// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: ctu_dft_jtag_tap.v
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
/////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
`include "sys.h"
// `include "ctu.h"
`include "jtag.vh"

// trin: I copied this unmodified from ctu_dft_jtag_tap.v

`ifdef L15_EXTRA_DEBUG
`default_nettype none
`endif
module jtag_interface_tap(/*AUTOARG*/
// Outputs
instructions, next_instructions, capture_dr_state, shift_dr_state, 
pause_dr_state, update_dr_state, shift_exit2_dr_state, 
update_ir_state, clock_dr, tdo, tdo_en, 
// Inputs
tck, tck_l, trst_n, tms, tdi, so, bypass_sel, dft_pin_pscan
);


input  tck;
input  tck_l;
input  trst_n;
input  tms;
input  tdi;
input  so;
input  bypass_sel;
input  dft_pin_pscan;

output [`TAP_INSTR_WIDTH-1:0] instructions;
output [`TAP_INSTR_WIDTH-1:0] next_instructions;
output                capture_dr_state;
output                shift_dr_state;
output                pause_dr_state;
output                update_dr_state;
output                shift_exit2_dr_state;
output                update_ir_state;
output                clock_dr;
output                tdo;
output                tdo_en; 

////////////////////////////////////////////////////////////////////////
                  // Interface signal type declarations
////////////////////////////////////////////////////////////////////////
wire [`TAP_INSTR_WIDTH-1:0]   instructions;
reg [`TAP_INSTR_WIDTH-1:0]    next_instructions;
wire                  capture_dr_state;
wire                  shift_dr_state;
wire                  pause_dr_state;
wire                  update_dr_state;
wire                  shift_exit2_dr_state;
wire                  update_ir_state;
wire                  clock_dr;
wire                  tdo;
wire                  tdo_en; 


////////////////////////////////////////////////////////////////////////
// Local signal declarations 
////////////////////////////////////////////////////////////////////////
parameter TAP_RESET     = 16'h0001,
      TAP_TEST      = 16'h0002,
      TAP_SEL_DR    = 16'h0004,
      TAP_CAP_DR    = 16'h0008,
      TAP_SHIFT_DR  = 16'h0010,
      TAP_EXIT1_DR  = 16'h0020,
      TAP_PAUSE_DR  = 16'h0040,
      TAP_EXIT2_DR  = 16'h0080,
      TAP_UPDATE_DR = 16'h0100,
      TAP_SEL_IR    = 16'h0200,
      TAP_CAP_IR    = 16'h0400,
      TAP_SHIFT_IR  = 16'h0800,
      TAP_EXIT1_IR  = 16'h1000,
      TAP_PAUSE_IR  = 16'h2000,
      TAP_EXIT2_IR  = 16'h4000,
      TAP_UPDATE_IR = 16'h8000,
      TAP_STATE_WIDTH = 16;

parameter TAP_RESET_BIT     =  0,
//    TAP_TEST_BIT      =  1,
//    TAP_SEL_DR_BIT    =  2,
      TAP_CAP_DR_BIT    =  3,
      TAP_SHIFT_DR_BIT  =  4,
//    TAP_EXIT1_DR_BIT  =  5,
      TAP_PAUSE_DR_BIT  =  6,
      TAP_EXIT2_DR_BIT  =  7,
      TAP_UPDATE_DR_BIT =  8,
//    TAP_SEL_IR_BIT    =  9,
      TAP_CAP_IR_BIT    = 10,
      TAP_SHIFT_IR_BIT  = 11,
//    TAP_EXIT1_IR_BIT  = 12,
//    TAP_PAUSE_IR_BIT  = 13,
//    TAP_EXIT2_IR_BIT  = 14,
      TAP_UPDATE_IR_BIT = 15;


wire [15:0] tap_state;
reg [15:0]  next_tap_state;

wire        tap_state_reset_negedge;
wire        capture_shift_dr;
wire        next_tap_state_reset_negedge;
wire        next_capture_shift_dr;

reg         next_tdo;
wire        next_tdo_en;

wire [`TAP_INSTR_WIDTH-1:0] new_instructions;
reg [`TAP_INSTR_WIDTH-1:0] next_new_instructions;
wire                reset_muxed;
wire                instructions_rst_l;
wire                tdi_ff;
wire                tdi_ff_en;
wire                tdi_ff_rst_l;

//*******************************************************************************
// Tap State Machine
//*******************************************************************************

always @ ( /*AUTOSENSE*/tap_state or tms) begin
   case (tap_state)
      TAP_RESET: begin
     if (tms)
        next_tap_state = TAP_RESET;
     else
        next_tap_state = TAP_TEST;
      end
      TAP_TEST: begin
     if (tms)
        next_tap_state = TAP_SEL_DR;
     else
        next_tap_state = TAP_TEST;
      end
      TAP_SEL_DR: begin
     if (tms)
        next_tap_state = TAP_SEL_IR;
     else
        next_tap_state = TAP_CAP_DR;
      end
      TAP_CAP_DR: begin
     if (tms)
        next_tap_state = TAP_EXIT1_DR;
     else
        next_tap_state = TAP_SHIFT_DR;
      end
      TAP_SHIFT_DR: begin
     if (tms)
        next_tap_state = TAP_EXIT1_DR;
     else
        next_tap_state = TAP_SHIFT_DR;
      end
      TAP_EXIT1_DR: begin
     if (tms)
        next_tap_state = TAP_UPDATE_DR;
     else
        next_tap_state = TAP_PAUSE_DR;
      end
      TAP_PAUSE_DR: begin
     if (tms)
        next_tap_state = TAP_EXIT2_DR;
     else
        next_tap_state = TAP_PAUSE_DR;
      end
      TAP_EXIT2_DR: begin
     if (tms)
        next_tap_state = TAP_UPDATE_DR;
     else
        next_tap_state = TAP_SHIFT_DR;
      end
      TAP_UPDATE_DR: begin
     if (tms)
        next_tap_state = TAP_SEL_DR;
     else
        next_tap_state = TAP_TEST;
      end
      TAP_SEL_IR: begin
     if (tms)
        next_tap_state = TAP_RESET;
     else
        next_tap_state = TAP_CAP_IR;
      end
      TAP_CAP_IR: begin
     if (tms)
        next_tap_state = TAP_EXIT1_IR;
     else
        next_tap_state = TAP_SHIFT_IR;
      end
      TAP_SHIFT_IR:  begin
     if (tms)
        next_tap_state = TAP_EXIT1_IR;
     else
        next_tap_state = TAP_SHIFT_IR;
      end
      TAP_EXIT1_IR:  begin
     if (tms)
        next_tap_state = TAP_UPDATE_IR;
     else
        next_tap_state = TAP_PAUSE_IR;
      end
      TAP_PAUSE_IR:  begin
     if (tms)
        next_tap_state = TAP_EXIT2_IR;
     else
        next_tap_state = TAP_PAUSE_IR;
      end
      TAP_EXIT2_IR:  begin
     if (tms)
        next_tap_state = TAP_UPDATE_IR;
     else
        next_tap_state = TAP_SHIFT_IR;
      end
      TAP_UPDATE_IR: begin
     if (tms)
        next_tap_state = TAP_SEL_DR;
     else
        next_tap_state = TAP_TEST;
      end
// CoverMeter line_off
      default: next_tap_state = {TAP_STATE_WIDTH{1'bx}};
// CoverMeter line_on
   endcase
end

// Tap state
assign capture_dr_state     = tap_state[TAP_CAP_DR_BIT];
assign shift_dr_state       = tap_state[TAP_SHIFT_DR_BIT];
assign pause_dr_state       = tap_state[TAP_PAUSE_DR_BIT];
assign update_dr_state      = tap_state[TAP_UPDATE_DR_BIT];
assign update_ir_state      = tap_state[TAP_UPDATE_IR_BIT];
assign shift_exit2_dr_state = tap_state[TAP_SHIFT_DR_BIT] | tap_state[TAP_EXIT2_DR_BIT];

//*******************************************************************************
// Instruction Register
//*******************************************************************************

always @ ( /*AUTOSENSE*/new_instructions or tap_state or tdi) begin
   if (tap_state[TAP_CAP_IR_BIT])       //load
      next_new_instructions = { {`TAP_INSTR_WIDTH-1{1'b0}}, 1'b1 };
   else begin
      if (tap_state[TAP_SHIFT_IR_BIT])  //shift
     next_new_instructions = { tdi, new_instructions[`TAP_INSTR_WIDTH-1:1] };
      else
     next_new_instructions = new_instructions;
   end
end

always @ ( /*AUTOSENSE*/instructions or new_instructions or tap_state) begin
   if (tap_state[TAP_UPDATE_IR_BIT])
      next_instructions = new_instructions;
   else
      next_instructions = instructions;
end

// - instruction register must have default instruction (idcode) when tap is in reset state
// - if in pin-based pscan, do not reset instruction register on tap state because
//   tap sm is on scan chain
assign next_tap_state_reset_negedge = tap_state[TAP_RESET_BIT];
assign reset_muxed = dft_pin_pscan ? 1'b0 : tap_state_reset_negedge;
assign instructions_rst_l = ~reset_muxed & trst_n;

//*******************************************************************************
// TDO
//*******************************************************************************

assign tdi_ff_en    = tap_state[TAP_SHIFT_DR_BIT];
assign tdi_ff_rst_l = ~(bypass_sel & tap_state[TAP_CAP_DR_BIT]);

// Negedge
assign next_tdo_en = tap_state[TAP_SHIFT_IR_BIT] | tap_state[TAP_SHIFT_DR_BIT];

always @ ( /*AUTOSENSE*/bypass_sel or new_instructions or so
      or tap_state or tdi_ff) begin
   if (tap_state[TAP_SHIFT_IR_BIT])
      next_tdo = new_instructions[0];
   else if (bypass_sel)
      next_tdo = tdi_ff;
   else
      next_tdo = so;
end

//*******************************************************************************
// *_dr
//*******************************************************************************

// clock_dr == 0 when idle
assign next_capture_shift_dr = tap_state[TAP_SHIFT_DR_BIT] | tap_state[TAP_CAP_DR_BIT];

assign clock_dr              = tck & capture_shift_dr;

//*******************************************************************************
// DFF Instantiations
//*******************************************************************************

//--------------------
// NEGEDGE
//--------------------
dff_ns #(1) u_dffsl_tap_state_reset_negedge
   ( .din (next_tap_state_reset_negedge),
     .clk (tck_l),
     .q (tap_state_reset_negedge)
     );

//*******************************************************************************
// Async Reset and Set DFFRL/DFFSL Instantiations
//*******************************************************************************

//--------------------
// POSEDGE
//--------------------
dffsl_async_ns #(1) u_dffsl_tap_state0
   ( .din (next_tap_state[0]),
     .clk (tck),
     .set_l (trst_n),
     .q (tap_state[0])
     );

dffrl_async_ns #(TAP_STATE_WIDTH-1) u_dffrl_async_tap_state 
   ( .din (next_tap_state[TAP_STATE_WIDTH-1:1]),
     .clk (tck),
     .rst_l (trst_n),
     .q (tap_state[TAP_STATE_WIDTH-1:1])
     );

// DEFAULT TO IDCODE
dffsl_async_ns #(1) u_dffsl_new_instructions0
   ( .din (next_new_instructions[0]),
     .clk (tck),
     .set_l (trst_n),
     .q (new_instructions[0])
     );

dffrl_async_ns #(`TAP_INSTR_WIDTH-1) u_dffrl_async_new_instructions 
   ( .din (next_new_instructions[`TAP_INSTR_WIDTH-1:1]),
     .clk (tck),
     .rst_l (trst_n),
     .q (new_instructions[`TAP_INSTR_WIDTH-1:1])
     );

//--------------------
// NEGEDGE
//--------------------

// DEFAULT TO IDCODE
dffsl_async_ns #(1) u_dffsl_instructions0
   ( .din (next_instructions[0]),
     .clk (tck_l),
     .set_l (instructions_rst_l),
     .q (instructions[0])
     );

dffrl_async_ns #(`TAP_INSTR_WIDTH-1) u_dffrl_async_instructions 
   ( .din (next_instructions[`TAP_INSTR_WIDTH-1:1]),
     .clk (tck_l),
     .rst_l (instructions_rst_l),
     .q (instructions[`TAP_INSTR_WIDTH-1:1])
     );

dffrl_async_ns #(1) u_dffrl_async_capture_shift_dr 
   ( .din (next_capture_shift_dr),
     .clk (tck_l),
     .rst_l (trst_n),
     .q (capture_shift_dr)
     );

dffrl_async_ns #(1) u_dffrl_async_tdo 
   ( .din (next_tdo),
     .clk (tck_l),
     .rst_l (trst_n),
     .q (tdo)
     );

dffrl_async_ns #(1) u_dffrl_async_tdo_en 
   ( .din (next_tdo_en),
     .clk (tck_l),
     .rst_l (trst_n),
     .q (tdo_en)
     );


//*******************************************************************************
// DFFRLE Instantiations
//*******************************************************************************

//--------------------
// POSEDGE
//--------------------
dffrle_ns #(1) u_dffrle_tdi_ff
   ( .din (tdi),
     .clk (tck),
     .en (tdi_ff_en),
     .rst_l (tdi_ff_rst_l),
     .q (tdi_ff)
     );

endmodule

// Local Variables:
// verilog-library-directories:(".")
// verilog-library-files:("../../../common/rtl/swrvr_macro.v")
// verilog-auto-sense-defines-constant:t
// End:
