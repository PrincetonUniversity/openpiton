/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
//==================================================================================================
//  Filename      : rtap.v
//  Created On    : 2014-01-31 12:52:57
//  Last Modified : 2019-03-15 16:25:45
//  Revision      :
//  Author        : Tri Nguyen
//  Company       : Princeton University
//  Email         : trin@princeton.edu
//
//  Description   :
//==================================================================================================

`include "define.tmp.h"
`include "jtag.vh"

`ifdef L15_EXTRA_DEBUG
`default_nettype none
`endif

// This module runs at system clk

module rtap(
    input wire clk,
    input wire rst_n,

    input wire [`JTAG_FLATID_WIDTH-1:0] own_tileid,

    // UCB out interface
    // modified to output from flops
    output wire tile_jtag_ucb_val,
    output wire [`UCB_BUS_WIDTH-1:0] tile_jtag_ucb_data,
    // UCB in interface
    input wire jtag_tiles_ucb_val,
    input wire [`UCB_BUS_WIDTH-1:0] jtag_tiles_ucb_data,

    // sram wrapper interface
    // modified to output from flops
    input wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] srams_rtap_data,
    output reg [`BIST_OP_WIDTH-1:0] rtap_srams_bist_command,
    output reg [`SRAM_WRAPPER_BUS_WIDTH-1:0] rtap_srams_bist_data,

    // insert interrupt packets for jtag
    // NOT modified to output from flops, assuming rtap/arb synthesized together
    output reg               rtap_arb_req_val,
    output reg [63:0]        rtap_arb_req_data,
    output reg [1:0]         rtap_arb_req_threadid,

    // jtag unified debug interface
    // modified to output from flops
    input wire [`CORE_JTAG_BUS_WIDTH-1:0] core_rtap_data,
    output reg rtap_core_val,
    output reg [1:0] rtap_core_threadid,
    output reg [`JTAG_CORE_ID_WIDTH-1:0]  rtap_core_id,
    output reg [`CORE_JTAG_BUS_WIDTH-1:0] rtap_core_data,

    // r/w port for jtag to config regs
    // NOT modified to output from flops, assuming rtap/config synthesized together
    output reg rtap_config_req_val,
    output reg rtap_config_req_rw,
    output reg [63:0] rtap_config_write_req_data,
    output reg [`CONFIG_REG_ADDRESS_MASK] rtap_config_req_address,
    input wire [63:0] config_rtap_read_res_data
    );


////////////////////////////////
// packet in
////////////////////////////////
wire ucb_rx_val;
wire [`CTAP_UCB_PACKET_WIDTH-1:0] ucb_rx_data;
////////////////////////////////
// packet out
////////////////////////////////
reg ucb_tx_val;
reg [`CTAP_UCB_PACKET_WIDTH-1:0] ucb_tx_data;
reg [(`CTAP_UCB_PACKET_WIDTH/`UCB_BUS_WIDTH)-1:0] ucb_tx_data_vec;
////////////////////////////////


////////////////////////////////
// request translations
////////////////////////////////
reg req_val;
reg [`JTAG_REQ_WIDTH-1:0] req_header;
reg [`JTAG_REQ_OP_WIDTH-1:0] req_op;
reg [`JTAG_REQ_MISC_WIDTH-1:0] req_misc;
reg [`JTAG_REQ_TILEID_WIDTH-1:0] req_tileid;
reg [`JTAG_REQ_THREADID_WIDTH-1:0] req_threadid;
reg [`JTAG_ADDRESS_REG_WIDTH-1:0] req_address;
reg [`JTAG_ADDRESS_INDEX_WIDTH:0] req_address_index;
reg [`JTAG_ADDRESS_SRAMID_WIDTH:0] req_address_sramid;
reg [`JTAG_ADDRESS_BSEL_WIDTH:0] req_address_bsel;
reg [63:0] req_data;
////////////////////////////////

////////////////////////////////
// response vars
////////////////////////////////
reg [`RTAP_RET_OP_WIDTH-1:0] res_op_next;
reg [`RTAP_RET_OP_WIDTH-1:0] res_op;
reg res_val;
// reg [(`CTAP_UCB_PACKET_WIDTH/`UCB_BUS_WIDTH)-1:0] res_vec;
reg sram_res_val;
reg sram_res_val_f;

always @ (posedge clk)
begin
    if (!rst_n)
        sram_res_val_f <= 1'b0;
    else
        sram_res_val_f <= sram_res_val;
end
////////////////////////////////

////////////////////////////////
// SRAM REQUEST INTERFACE
////////////////////////////////
reg [`BIST_OP_WIDTH-1:0] sram_req_op;
reg [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_req_dataout;

// reg [`BIST_OP_WIDTH-1:0] sram_req_op_f;
// reg [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_req_dataout_f;

always @ (posedge clk)
begin
    if (!rst_n)
    begin
        rtap_srams_bist_command <= `BIST_OP_WIDTH'd0;
    end
    else
    begin
        rtap_srams_bist_command <= sram_req_op;
    end

    rtap_srams_bist_data <= sram_req_dataout;
end

// output from flops
// always @ *
// begin
//     rtap_srams_bist_command = sram_req_op_f;
//     rtap_srams_bist_data = sram_req_dataout_f;
// end
////////////////////////////////

////////////////////////////////
// req/res to sram, muxed properly
////////////////////////////////
reg [15:0] sram_req_address_reg;
reg [3:0] sram_req_sramid_reg;
reg [63:0] sram_data_reg;
reg [7:0] sram_req_bsel_reg;
reg [15:0] sram_req_address_reg_next;
reg [3:0] sram_req_sramid_reg_next;
reg [63:0] sram_data_reg_next;
reg [7:0] sram_req_bsel_reg_next;
reg sram_req_rw;
reg sram_req_rw_next;
////////////////////////////////

////////////////////////////////
// Jtag Unified Debug Interface
////////////////////////////////
reg judi_op_val;
reg [1:0] judi_op_threadid;
reg [`JTAG_CORE_ID_WIDTH-1:0] judi_op_id;
reg [`CORE_JTAG_BUS_WIDTH-1:0] judi_op_data;

// output from flops
always @ (posedge clk)
begin
    if (!rst_n)
        rtap_core_val <= 1'b0;
    else
        rtap_core_val <= judi_op_val;

    rtap_core_data <= judi_op_data;
    rtap_core_threadid <= judi_op_threadid;
    rtap_core_id <= judi_op_id;
end

wire judi_op_val_f = rtap_core_val;
reg judi_op_val_ff;
always @ (posedge clk)
begin
    judi_op_val_ff <= judi_op_val_f;
end
////////////////////////////////


// states for writing srams
reg [`RTAP_STATE_WIDTH-1:0] state;
reg [`RTAP_STATE_WIDTH-1:0] state_next;
reg [3:0] state_counter;
reg [3:0] state_counter_next;
reg [3:0] state_counter_minus_1;
always @ (posedge clk)
begin
    if (!rst_n)
    begin
        state <= `RTAP_STATE_INIT;
        res_op <= 0;
    end
    else
    begin
        state <= state_next;
        state_counter <= state_counter_next;
        res_op <= res_op_next;
    end
end

always @ *
begin
    req_data = ucb_rx_data[`CTAP_REQ_DATA_MASK];
    req_address = ucb_rx_data[`CTAP_REQ_ADDRESS_MASK];
    req_header = ucb_rx_data[`CTAP_REQ_HEADER_MASK];
    req_op = 0;

    req_tileid = req_header[`JTAG_REQ_TILEID_MASK];
    req_threadid = req_header[`JTAG_REQ_THREADID_MASK];
    req_misc = req_header[`JTAG_REQ_MISC_MASK];

    req_address_index = req_address[`JTAG_ADDRESS_INDEX_MASK];
    req_address_sramid = req_address[`JTAG_ADDRESS_SRAMID_MASK];
    req_address_bsel = req_address[`JTAG_ADDRESS_BSEL_MASK];
    req_val = ucb_rx_val && (req_tileid == `JTAG_TILEID_BROADCAST || req_tileid == own_tileid);

    if (req_val)
        req_op = req_header[`JTAG_REQ_OP_MASK];


    res_op_next = 0;

    // default sram request values
    sram_req_address_reg_next = sram_req_address_reg;
    sram_req_sramid_reg_next = sram_req_sramid_reg;
    sram_data_reg_next = sram_data_reg;
    sram_req_bsel_reg_next = sram_req_bsel_reg;
    sram_req_rw_next = sram_req_rw;

    sram_req_op = 0;
    sram_req_dataout = 0;

    sram_res_val = 1'b0;

    state_counter_minus_1 = state_counter - 1;
    state_counter_next = state_counter;

    state_next = `RTAP_STATE_INIT;
    case (state)
        `RTAP_STATE_INIT:
        begin
            if (req_op == `JTAG_REQ_OP_READ_SRAM || req_op == `JTAG_REQ_OP_WRITE_SRAM)
            begin
                // sram_req_val = 1'b1;
                sram_req_address_reg_next[15:0] = req_address_index[15:0];
                sram_req_sramid_reg_next[3:0] = req_address_sramid;
                sram_req_bsel_reg_next[7:0] = req_address_bsel;
                state_next = `RTAP_STATE_SRAM_0;
                state_counter_next = 0; // only 1 cycle to transfer sramid
                if (req_op == `JTAG_REQ_OP_READ_SRAM)
                    sram_req_rw_next = 1'b0;
                else
                begin
                    sram_req_rw_next = 1'b1;
                    sram_data_reg_next = req_data[63:0];
                end
            end
        end

        `RTAP_STATE_SRAM_0:
        begin
            // write the req sramid
            sram_req_op = `BIST_OP_SHIFT_ID;
            sram_req_dataout[3:0] = sram_req_sramid_reg[3:0];
            if (state_counter == 0)
            begin
                state_next = `RTAP_STATE_SRAM_1;
                state_counter_next = 1; // 2 cycles to transfer 8b of bsel
            end
            else
            begin
                state_next = state;
                state_counter_next = state_counter_minus_1;
            end
        end

        `RTAP_STATE_SRAM_1:
        begin
            // shift in bitselect (which 64b of the read out data to capture)
            sram_req_op = `BIST_OP_SHIFT_BSEL;
            sram_req_dataout[3:0] = sram_req_bsel_reg[7:4];
            sram_req_bsel_reg_next = {sram_req_bsel_reg[3:0], 4'b0};
            if (state_counter == 0)
            begin
                state_next = `RTAP_STATE_SRAM_2;
                state_counter_next = 3; // 4 cycles to shift 16b of address
            end
            else
            begin
                state_next = state;
                state_counter_next = state_counter_minus_1;
            end
        end

        `RTAP_STATE_SRAM_2:
        begin
            // shift in address (which 64b of the read out data to capture)
            sram_req_op = `BIST_OP_SHIFT_ADDRESS;
            sram_req_dataout[3:0] = sram_req_address_reg[15:12];
            sram_req_address_reg_next = {sram_req_address_reg[11:0], 4'b0};
            if (state_counter == 0)
            begin
                if (sram_req_rw == 1'b0)
                begin
                    state_next = `RTAP_STATE_SRAM_READ_3;
                end
                else
                    state_next = `RTAP_STATE_SRAM_WRITE_3;
                    state_counter_next = 15; // 16 cycles to transmit 64b of write data
            end
            else
            begin
                state_next = state;
                state_counter_next = state_counter_minus_1;
            end
        end

        `RTAP_STATE_SRAM_READ_3:
        begin
            // issue read
            sram_req_op = `BIST_OP_READ;
            state_next = `RTAP_STATE_SRAM_READ_4;
        end

        `RTAP_STATE_SRAM_READ_4:
        begin
            // wait 1 cycle for loading
            sram_req_op = 0;
            state_next = `RTAP_STATE_SRAM_READ_4a;
            // state_counter_next = 15; // 16 cycles to transmit 64b of read data
        end

        `RTAP_STATE_SRAM_READ_4a:
        begin
            // initiate shift 1 cycle before
            sram_req_op = `BIST_OP_SHIFT_DATA;
            state_next = `RTAP_STATE_SRAM_READ_5;
            state_counter_next = 15; // 16 cycles to transmit 64b of read data
        end

        `RTAP_STATE_SRAM_READ_5:
        begin
            // shift in reads from SRAM
            sram_req_op = `BIST_OP_SHIFT_DATA;
            sram_req_dataout[3:0] = sram_data_reg[63:60]; // non-functional output
            sram_data_reg_next = {sram_data_reg[59:0], srams_rtap_data[3:0]};
            if (state_counter == 0)
            begin
                state_next = `RTAP_STATE_INIT;
                // res_op_next = `RTAP_RET_OP_READRET;
                sram_res_val = 1'b1;
            end
            else
            begin
                state_next = state;
                state_counter_next = state_counter_minus_1;
            end
        end

        `RTAP_STATE_SRAM_WRITE_3:
        begin
            // shift write data in
            sram_req_op = `BIST_OP_SHIFT_DATA;
            sram_req_dataout[3:0] = sram_data_reg[63:60];
            sram_data_reg_next = {sram_data_reg[59:0], srams_rtap_data[3:0]};
            if (state_counter == 0)
            begin
                state_next = `RTAP_STATE_SRAM_WRITE_4;
            end
            else
            begin
                state_next = state;
                state_counter_next = state_counter_minus_1;
            end
        end

        `RTAP_STATE_SRAM_WRITE_4:
        begin
            // send write command
            sram_req_op = `BIST_OP_WRITE;
            // res_op_next = `RTAP_RET_OP_ACK;
            sram_res_val = 1'b1;
            state_next = `RTAP_STATE_INIT;
        end
    endcase

    rtap_arb_req_val = 0;
    rtap_arb_req_data[63:0] = 0;
    rtap_arb_req_threadid[1:0] = 0;

    judi_op_val = 0;
    judi_op_threadid = 0;
    judi_op_id = 0;
    judi_op_data = 0;

    rtap_config_req_val = 0;
    rtap_config_req_rw = 0;
    rtap_config_req_address = 0;
    rtap_config_write_req_data = 0;

    case (req_op)
        // `JTAG_REQ_OP_CPX_INTERRUPT:
        // begin
        //     res_op_next = `RTAP_RET_OP_ACK;
        //     rtap_arb_req_val = 1'b1;
        //     rtap_arb_req_data[63:0] = req_data[63:0];
        //     rtap_arb_req_threadid[1:0] = req_threadid[1:0];
        // end
        `JTAG_REQ_OP_READ_RTAP:
        begin
            case (req_misc)
                `JTAG_RTAP_ID_CONFIGREGS_REG:
                begin
                    res_op_next = `RTAP_RET_OP_CONFIG_REGS;
                    rtap_config_req_val = 1'b1;
                    rtap_config_req_rw = 1'b0;
                    rtap_config_req_address[`CONFIG_REG_ADDRESS_MASK] = req_address;
                end
                `JTAG_RTAP_ID_SHADOWSCAN_REG:
                begin
                    // res_op_next = `RTAP_RET_OP_CORE_DATA;
                    judi_op_threadid = req_threadid;
                    judi_op_val = 1'b1;
                    judi_op_id = `JTAG_CORE_ID_IFU_SSCAN;
                end
                `JTAG_RTAP_ID_IRF_REG:
                begin
                    // res_op_next = `RTAP_RET_OP_CORE_DATA;
                    judi_op_threadid = req_threadid;
                    judi_op_val = 1'b1;
                    judi_op_id = `JTAG_CORE_ID_IRF;
                    judi_op_data = req_address;
                end
            endcase
        end

        `JTAG_REQ_OP_WRITE_RTAP:
        begin
            case (req_misc)
                `JTAG_RTAP_ID_PC_REG:
                begin
                    // res_op_next = `RTAP_RET_OP_ACK;
                    judi_op_threadid = req_threadid;
                    judi_op_val = 1'b1;
                    judi_op_id = `JTAG_CORE_ID_IFU_PC;
                    judi_op_data[47:0] = req_data[47:0];
                end
                `JTAG_RTAP_ID_RESETVECTOR_REG:
                begin
                    // res_op_next = `RTAP_RET_OP_ACK;
                    judi_op_data[47:0] = req_data[47:0];
                    judi_op_threadid = req_threadid;
                    judi_op_val = 1'b1;
                    judi_op_id = `JTAG_CORE_ID_TLU_RSTVADDR_BASE;
                end
                `JTAG_RTAP_ID_THREADSTATE_REG:
                begin
                    // res_op_next = `RTAP_RET_OP_ACK;
                    judi_op_threadid = req_threadid;
                    judi_op_val = 1'b1;
                    judi_op_id = `JTAG_CORE_ID_IFU_THRFSM;
                    judi_op_data[4:0] = req_data[4:0];
                end
                `JTAG_RTAP_ID_LSU_CONTROL_REG:
                begin
                    // res_op_next = `RTAP_RET_OP_ACK;
                    judi_op_threadid = req_threadid;
                    judi_op_val = 1'b1;
                    judi_op_id = `JTAG_CORE_ID_LSU_CONTROL_BITS;
                    judi_op_data[13:0] = req_data[13:0];
                end
                `JTAG_RTAP_ID_CPX_INTERRUPT:
                begin
                    res_op_next = `RTAP_RET_OP_ACK;
                    rtap_arb_req_val = 1'b1;
                    rtap_arb_req_data[63:0] = req_data[63:0];
                    rtap_arb_req_threadid[1:0] = req_threadid[1:0];
                end
                `JTAG_RTAP_ID_CONFIGREGS_REG:
                begin
                    res_op_next = `RTAP_RET_OP_ACK;
                    rtap_config_req_val = 1'b1;
                    rtap_config_req_rw = 1'b1;
                    rtap_config_req_address[`CONFIG_REG_ADDRESS_MASK] = req_address;
                    rtap_config_write_req_data = req_data;
                end
                `JTAG_RTAP_ID_ICACHE_EN_REG:
                begin
                    // res_op_next = `RTAP_RET_OP_ACK;
                    // judi_op_threadid = req_threadid;
                    judi_op_val = 1'b1;
                    judi_op_id = `JTAG_CORE_ID_IFU_ICACHE_EN;
                    judi_op_data[4:0] = req_data[4:0]; // active bit, en3, en2, en1, en0
                end
                `JTAG_RTAP_ID_BREAKPOINT_PC_REG:
                begin
                    // force `SPARC_CORE0.sparc0.ifu.ifu.fdp.jtag_breakpoint_pc = req_data[47:0];
                    // force `SPARC_CORE0.sparc0.ifu.ifu.fcl.jtag_breakpoint_stall_en = 1'b1;
                    // res_op_next = `RTAP_RET_OP_ACK;
                    // judi_op_threadid = req_threadid;
                    judi_op_val = 1'b1;
                    judi_op_id = `JTAG_CORE_ID_IFU_BREAKPOINT_PC;
                    judi_op_data[47:0] = req_data[47:0]; // active bit, en3, en2, en1, en0
                end
            endcase
        end
    endcase
end

// flops for SRAM requests
always @ (posedge clk)
begin
    sram_req_address_reg <= sram_req_address_reg_next;
    sram_req_sramid_reg <= sram_req_sramid_reg_next;
    sram_data_reg <= sram_data_reg_next;
    sram_req_bsel_reg <= sram_req_bsel_reg_next;
    sram_req_rw <= sram_req_rw_next;
end


// set outputs
reg [`JTAG_DATA_RES_WIDTH-1:0] res_data;
always @ *
begin
    res_val = 0;
    res_data = 0;
    // res_vec = 0;

    if (judi_op_val_ff)
    begin
        res_val = 1'b1;
        res_data = core_rtap_data[`CORE_JTAG_BUS_WIDTH-1:0];
    end
    else
    if (sram_res_val_f)
    begin
        res_val = 1'b1;
        res_data = sram_data_reg;
    end
    else case (res_op)
        `RTAP_RET_OP_ACK:
        begin
            res_val = 1'b1;
        end
        // `RTAP_RET_OP_CORE_DATA:
        // begin
        //     res_val = 1'b1;
        //     res_data = core_rtap_data[`CORE_JTAG_BUS_WIDTH-1:0];
        // end
        // `RTAP_RET_OP_READRET:
        // begin
        //     res_val = 1'b1;
        //     res_data = sram_data_reg;
        // end
        `RTAP_RET_OP_CONFIG_REGS:
        begin
            res_val = 1'b1;
            res_data = config_rtap_read_res_data;
        end
    endcase

    ucb_tx_val = res_val;
    ucb_tx_data_vec = 32'hffffffff;
    ucb_tx_data = res_data;
end

// UCB receiver
rtap_ucb_receiver ucb_rx(
    .clk(clk),
    .rst_n(rst_n),
    .ucb_rx_val(ucb_rx_val),
    .ucb_rx_data(ucb_rx_data),
    .ucb_in_vld(jtag_tiles_ucb_val),
    .ucb_in_data(jtag_tiles_ucb_data)
    );

// UCB transmitter
rtap_ucb_transmitter ucb_tx(
    .clk(clk),
    .rst_n(rst_n),
    .ucb_tx_val(ucb_tx_val),
    .ucb_tx_data(ucb_tx_data),
    .ucb_tx_data_vec(ucb_tx_data_vec),
    .ucb_out_val(tile_jtag_ucb_val),
    .ucb_out_data(tile_jtag_ucb_data)
    );




endmodule
