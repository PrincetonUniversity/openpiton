// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: cluster_header.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
//
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
//
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
//
// ========== Copyright Header End ============================================

//==================================================================================================
//  Filename      : l15.v
//  Created On    : 2014-01-31 12:52:57
//  Revision      :
//  Author        : Tri Nguyen
//  Company       : Princeton University
//  Email         : trin@princeton.edu
//
//  Description   : JTAG port for the processor. Includes the JTAG interface that runs at JTAG clock
//                  and a central tap (ctap) module that parses the JTAG command to UCB packets
//                  (at processor clock speed) and forward these packets to the receiver tap (rtap)
//                  that lives in the tiles.
//                  The tiles are connected as 2 low-bandwidth, uni-direction rings using the T1's UCB transmitters and receivers.
//                  Ring #1 is the
//                  The JTAG interface operates at test clock speed
//==================================================================================================

`include "define.tmp.h"
`include "jtag.vh"

`ifdef L15_EXTRA_DEBUG
`default_nettype none
`endif
module jtag_interface(
    // IO interface
    input wire jtag_clk,
    input wire jtag_rst_l,
    input wire jtag_modesel,
    input wire jtag_datain,
    output wire jtag_dataout,
    output wire jtag_dataout_en,

    // CTAP interface
    input wire [`JTAG_SCRATCH_WIDTH-1:0] ctap_jtag_data,
    input wire ctap_jtag_interrupt_bit,
    output reg [`JTAG_SCRATCH_WIDTH-1:0] jtag_ctap_data,
    output reg jtag_ctap_reg_wr_en,
    output reg [`CTAP_REG_SEL_WIDTH-1:0] jtag_ctap_reg_sel
    );

wire jtag_clk_l = ~jtag_clk;

// TAP_INSTR_WIDTH is defined by ctu.h
wire [`TAP_INSTR_WIDTH-1:0]   tap_instructions;
wire [`TAP_INSTR_WIDTH-1:0]   next_tap_instructions;

wire          tap_capture_dr_state;       // load data from ctap data register
wire          tap_shift_dr_state;         // main used to shift scratch register or
                                          // other registers in this module
// wire          tap_shift_dr_state_d1;
wire          tap_pause_dr_state;         // not sure what this is used for
wire          tap_update_dr_state;        // update ctap registers state
wire          tap_shift_exit2_dr_state;   // not used here
wire          tap_update_ir_state;        // not used here
wire          tap_bypass_sel;

// others
wire          instr_bypass;
wire          instr_idcode;
wire          instr_highz;
wire          instr_clamp;
reg [31:0]    idcode;
reg [31:0]    next_idcode;

// scratch register to write to CTAP
reg [`JTAG_SCRATCH_WIDTH-1:0] scratch_reg;
reg [`JTAG_SCRATCH_WIDTH-1:0] scratch_reg_next;

wire          tap_scratch_sel;
wire          tap_so;
// wire          tap_scratch_sel;
// wire          tap_scratch_sel;
// wire          tap_scratch_sel;

// ctap insts
wire          instr_ctap_instruction_reg_sel;
wire          instr_ctap_data0_reg_sel;
wire          instr_ctap_address_reg_sel;
wire          instr_ctap_interrupt_bit_sel;
wire          next_instr_ctap_instruction_reg_sel;
wire          next_instr_ctap_data0_reg_sel;
wire          next_instr_ctap_address_reg_sel;
// wire          instr_clamp;
// wire          instr_clamp;
// wire          instr_clamp;
// wire          instr_clamp;
// wire          instr_clamp;

//********************************************************************
// TAP Controller
//********************************************************************

parameter TAP_CMD_LO    = 0,
    TAP_CMD_HI    = `TAP_CMD_WIDTH - 1;

jtag_interface_tap u_tap_controller (
    // Inputs
    .tck (jtag_clk),
    .tck_l (jtag_clk_l),
    .trst_n (jtag_rst_l),
    .tms (jtag_modesel),
    .tdi (jtag_datain),
    .so (tap_so),
    .bypass_sel (tap_bypass_sel), 
    .dft_pin_pscan(1'b0),

    // Outputs
    .capture_dr_state (tap_capture_dr_state),
    .shift_dr_state (tap_shift_dr_state),
    .pause_dr_state (tap_pause_dr_state),
    .update_dr_state (tap_update_dr_state),
    .shift_exit2_dr_state (tap_shift_exit2_dr_state), // used for sscan or something else
    .update_ir_state (tap_update_ir_state),
    .clock_dr  (), // not needed?
    .tdo (jtag_dataout),
    .tdo_en (jtag_dataout_en),
    .instructions (tap_instructions), // TODO
    .next_instructions (next_tap_instructions) // TODO
    );


//instruction decode
wire [`TAP_CMD_WIDTH-1:0] tap_inst = tap_instructions[TAP_CMD_HI:TAP_CMD_LO];
wire [`TAP_CMD_WIDTH-1:0] next_tap_inst = next_tap_instructions[TAP_CMD_HI:TAP_CMD_LO];
assign instr_bypass           = tap_inst == {`TAP_CMD_WIDTH{1'b1}}
                                | (tap_instructions[TAP_CMD_HI:TAP_CMD_HI-3] == 4'b0001   // 0x05 thru 0x07
                                & (|tap_instructions[TAP_CMD_HI-4:TAP_CMD_LO]))
                                | (tap_instructions[TAP_CMD_HI:TAP_CMD_HI-3] == 4'b0100   // 0x11 thru 0x13
                                & (|tap_instructions[TAP_CMD_HI-4:TAP_CMD_LO]))
                                | tap_inst == 6'h19
                                | tap_inst == 6'h27
                                | tap_inst == 6'h2F
                                | tap_instructions[TAP_CMD_HI:TAP_CMD_HI-1] == 2'd3;

assign instr_idcode           = tap_inst == `TAP_IDCODE;
assign instr_highz            = tap_inst == `TAP_HIGHZ;
assign instr_clamp            = tap_inst == `TAP_CLAMP;

// assign instr_scan_bypass_en   = tap_inst == `TAP_SCAN_BYPASS_EN;

assign instr_ctap_instruction_reg_sel = tap_inst == `TAP_SEL_CTAP_INSTRUCTION;
assign instr_ctap_data0_reg_sel = tap_inst == `TAP_SEL_CTAP_DATA0;
assign instr_ctap_address_reg_sel = tap_inst == `TAP_SEL_CTAP_ADDRESS;
assign instr_ctap_interrupt_bit_sel = tap_inst == `TAP_SEL_CTAP_INTERRUPTBIT;

assign next_instr_ctap_instruction_reg_sel = next_tap_inst == `TAP_SEL_CTAP_INSTRUCTION;
assign next_instr_ctap_data0_reg_sel = next_tap_inst == `TAP_SEL_CTAP_DATA0;
assign next_instr_ctap_address_reg_sel = next_tap_inst == `TAP_SEL_CTAP_ADDRESS;

assign tap_scratch_sel = instr_ctap_instruction_reg_sel | instr_ctap_data0_reg_sel 
                        | instr_ctap_address_reg_sel;

//tap_bypass_sel generation
assign tap_bypass_sel   = instr_highz  | instr_clamp | instr_bypass;

assign tap_so =   // (idcode[31]                & instr_idcode)
       (idcode[0]                 & instr_idcode) // bug #5497
       | (scratch_reg[`JTAG_SCRATCH_WIDTH-1]   & tap_scratch_sel)
       | (ctap_jtag_interrupt_bit   & instr_ctap_interrupt_bit_sel)
       // | (pads_ctu_bsi              & bscan_enable)
       // | (creg_addr[39]             & instr_creg_addr)
       // | (creg_wdata[63]            & instr_creg_wdata)
       // | (scratch_reg[63]           & instr_creg_scratch)
       // | (creg_rdrtrn_out           & instr_creg_rdata)
       //| (pads_ctu_si               & instr_scan)
       //| (pads_ctu_si_bypmux_out    & instr_scan) // bug # 5581
       // | (pads_ctu_si_bypmux_out_ff & instr_scan)  // bug # 5581 & bug #5696
       // | (efc_ctu_data_out          & instr_efc_shift)
       // | (shadow_scan_out           & shadow_scan_instr)
       // | (bist_result_reg[(`CTU_BIST_CNT*2)-1] & instr_mbist_result)
       ;

// assign jtag_dataout_en = jtag_dataout_en
//        | instr_creg_rdata
//        | dft_pin_pscan;

//////////////////////////////////////////////////////////////////////
// IDCODE
//////////////////////////////////////////////////////////////////////

// TODO
wire [3:0] jtag_id = 4'b0;

always @ *
begin
    if (instr_idcode & tap_capture_dr_state)
        next_idcode = { jtag_id[3:0], `PARALLEL_PART_ID, `PARALLEL_MANUFACTURE_ID, 1'b1 };
    else begin
        if (instr_idcode & tap_shift_dr_state)
            //   next_idcode = { idcode[30:0], jtag_datain };
            next_idcode = { jtag_datain, idcode[31:1] }; // bug #5497
        else
            next_idcode = idcode[31:0];
    end
end

//////////////////////////////////////////////////////////////////////
// Scratch register
//////////////////////////////////////////////////////////////////////
always @ (posedge jtag_clk)
begin
    if (!jtag_rst_l)
    begin
        scratch_reg <= `JTAG_SCRATCH_WIDTH'b0;
        idcode <= 0;
    end
    else
    begin
        scratch_reg <= scratch_reg_next;
        idcode <= next_idcode;
    end
end

reg           scratch_reg_shift;
reg           scratch_reg_load;
always @ * 
begin
    scratch_reg_shift = tap_scratch_sel & tap_shift_dr_state;
    scratch_reg_load = tap_scratch_sel & tap_capture_dr_state;

    if (scratch_reg_shift)
        scratch_reg_next = {scratch_reg[`JTAG_SCRATCH_WIDTH-2:0], jtag_datain};
    else if (scratch_reg_load)
        scratch_reg_next[`JTAG_SCRATCH_WIDTH-1:0] = ctap_jtag_data[`JTAG_SCRATCH_WIDTH-1:0];
    else
        scratch_reg_next = scratch_reg;

    // assign output to ctap
    jtag_ctap_data = scratch_reg;
    // write enable
    jtag_ctap_reg_wr_en = tap_update_dr_state && tap_scratch_sel;
end

//////////////////////////////////////////////////////////////////////
// ctap register select
//////////////////////////////////////////////////////////////////////
reg [`CTAP_REG_SEL_WIDTH-1:0] ctap_reg_sel;
reg [`CTAP_REG_SEL_WIDTH-1:0] ctap_reg_sel_next;
always @ (posedge jtag_clk)
begin
    if (!jtag_rst_l)
    begin
        ctap_reg_sel <= 0;
    end
    else
        ctap_reg_sel <= ctap_reg_sel_next;
end

reg next_ctap_data0_sel;
always @ *
begin
    // ctap data0 reg select, 1 cycle earlier
    next_ctap_data0_sel = tap_update_ir_state & next_instr_ctap_data0_reg_sel;

    if (next_ctap_data0_sel)
        ctap_reg_sel_next = `CTAP_REG_SEL_DATA0;
    else if (next_instr_ctap_instruction_reg_sel)
        ctap_reg_sel_next = `CTAP_REG_SEL_INSTRUCTION;
    else if (next_instr_ctap_address_reg_sel)
        ctap_reg_sel_next = `CTAP_REG_SEL_ADDRESS;
    else
        ctap_reg_sel_next = ctap_reg_sel;

    // output assign
    jtag_ctap_reg_sel = ctap_reg_sel;
end

endmodule
