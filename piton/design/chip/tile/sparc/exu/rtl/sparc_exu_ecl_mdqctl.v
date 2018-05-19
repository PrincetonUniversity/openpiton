// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_ecl_mdqctl.v
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
////////////////////////////////////////////////////////////////////////
/*
//  Module Name: sparc_exu_ecl_mdqctl
//	Description:  This block is the control logic for the multiply/divide
// 	input buffer.  It generates the select lines for both the output
//	to mul and div, as well as for moving the data within the buffer.
//	There are 4 slots in the buffer, which is a modified FIFO.
//	It will output 1 MUL and 1 DIV every cycle, as well as whether those
// 	outputs are valid.  If none of the slots contain a valid entry, it
//	will pass through the input to the output.  If a kill comes through
//	and invalidates an entry, it will show up on the valid bit coming out
//	of the mdq, but may cause a lost cycle as the kill won't affect the logic
//	which chooses the output until the next cycle.  The block also
//	stores the thr, rd, setcc and other control bits for each entry.
*/

`define MULS 10
`define IS64 9
`define SIGNED 8  
`define SET_CC 7

module sparc_exu_ecl_mdqctl (/*AUTOARG*/
   // Outputs
   mdqctl_divcntl_input_vld, mdqctl_divcntl_reset_div, 
   mdqctl_divcntl_muldone, ecl_div_div64, ecl_div_signed_div, 
   ecl_div_muls, mdqctl_wb_divthr_g, mdqctl_wb_divrd_g, 
   mdqctl_wb_multhr_g, mdqctl_wb_mulrd_g, mdqctl_wb_divsetcc_g, 
   mdqctl_wb_mulsetcc_g, mdqctl_wb_yreg_shift_g, exu_mul_input_vld, 
   mdqctl_wb_yreg_wen_g, ecl_div_mul_sext_rs1_e, 
   ecl_div_mul_sext_rs2_e, ecl_div_mul_get_new_data, 
   ecl_div_mul_keep_data, ecl_div_mul_get_32bit_data, 
   ecl_div_mul_wen, div_zero_m, 
   // Inputs
   clk, se, reset, ifu_exu_muldivop_d, tid_d, ifu_exu_rd_d, tid_w1, 
   flush_w1, ifu_exu_inst_vld_w, wb_divcntl_ack_g, divcntl_wb_req_g, 
   byp_alu_rs1_data_31_e, byp_alu_rs2_data_31_e, mul_exu_ack, 
   ecl_div_sel_div, ifu_exu_muls_d, div_ecl_detect_zero_high, 
   div_ecl_detect_zero_low, ifu_tlu_flush_w, early_flush_w
   ) ;
   input clk;
   input se;
   input reset;
   input [4:0] ifu_exu_muldivop_d;
   input [1:0] tid_d;
   input [4:0] ifu_exu_rd_d;
   input [1:0] tid_w1;
   input       flush_w1;
   input       ifu_exu_inst_vld_w;
   input       wb_divcntl_ack_g;
   input       divcntl_wb_req_g;
   input       byp_alu_rs1_data_31_e;
   input       byp_alu_rs2_data_31_e;
   input       mul_exu_ack;
   input       ecl_div_sel_div;
   input       ifu_exu_muls_d;
   input       div_ecl_detect_zero_high;
   input       div_ecl_detect_zero_low;
   input       ifu_tlu_flush_w;
   input       early_flush_w;

   
   output      mdqctl_divcntl_input_vld;
   output      mdqctl_divcntl_reset_div;
   output      mdqctl_divcntl_muldone;
   output      ecl_div_div64;
   output      ecl_div_signed_div;
   output      ecl_div_muls;
   output [1:0] mdqctl_wb_divthr_g;
   output [4:0] mdqctl_wb_divrd_g;
   output [1:0] mdqctl_wb_multhr_g;
   output [4:0] mdqctl_wb_mulrd_g;
   output       mdqctl_wb_divsetcc_g;
   output       mdqctl_wb_mulsetcc_g;
   output       mdqctl_wb_yreg_shift_g;

   
   output       exu_mul_input_vld;
   output       mdqctl_wb_yreg_wen_g;
   output       ecl_div_mul_sext_rs1_e;
   output       ecl_div_mul_sext_rs2_e;
   output       ecl_div_mul_get_new_data;
   output       ecl_div_mul_keep_data;
   output       ecl_div_mul_get_32bit_data;
   output       ecl_div_mul_wen;
   output   div_zero_m;

   wire [11:0] div_data_next;
   wire [11:0] div_data;
   wire        new_div_vld;
   wire        curr_div_vld;
   wire [11:0] div_input_data_d;
   wire [9:0] mul_input_data_d;
   wire [9:0] mul_data;
   wire [9:0] mul_data_next;
   wire        new_mul_d;
   wire        kill_thr_mul;
   wire        mul_kill;
   wire        invalid_mul_w;
   wire        div_kill;
   wire        kill_thr_div;
   
   wire        mul_ready_next;
   wire        mul_ready;
   wire        mul_done_valid_c0;
   wire        mul_done_valid_c1;
   wire        mul_done_ack;
   wire        mul_done_c0;
   wire        mul_done_c1;
   wire        mul_done_c2;
   wire        mul_done_c3;

   wire        isdiv_e_valid;
   wire        isdiv_m_valid;
   wire        ismul_e_valid;
   wire        ismul_m_valid;
   wire        isdiv_e;
   wire        isdiv_m;
   wire        isdiv_w;
   wire        ismul_e;
   wire        ismul_m;
   wire        ismul_w;
   
   wire        div_used;
   wire        invalid_div_w;
   wire        div_zero_e;

   // Mul result state wires
   wire        go_mul_done;
   wire        stay_mul_done;
   wire        mul_done;
   wire        next_mul_done;
   
   
   ////////////////////////
   // Divide  output DATAPATH
   ////////////////////////
   // store control signals
   assign div_used = divcntl_wb_req_g & wb_divcntl_ack_g & ecl_div_sel_div;

   assign new_div_vld = ifu_exu_muls_d | ifu_exu_muldivop_d[3];
   
   assign div_input_data_d[11:0] = {1'b1, // isdiv
                                    ifu_exu_muls_d,
                                    ifu_exu_muldivop_d[2], // 64bit
                                    ifu_exu_muldivop_d[1], // signed
                                    ifu_exu_muldivop_d[0], // setcc
                                    ifu_exu_rd_d[4:0],
                                    tid_d[1:0]};
   mux2ds #(12) div_data_mux(.dout(div_data_next[11:0]),
                                .in0({curr_div_vld, div_data[10:0]}),
                                .in1(div_input_data_d[11:0]),
                                .sel0(~new_div_vld),
                                .sel1(new_div_vld));

   dffr_s #(12) div_data_dff(.din(div_data_next[11:0]), .clk(clk), .q(div_data[11:0]),
                          .se(se), .si(), .so(), .rst(reset));

   //div  kill logic (kills on div by zero exception or if there isn't an outstanding div)
   assign div_zero_e = isdiv_e & div_ecl_detect_zero_high & div_ecl_detect_zero_low & ~div_data[`MULS];
   assign invalid_div_w = isdiv_w & (~ifu_exu_inst_vld_w | ifu_tlu_flush_w | early_flush_w);
   assign kill_thr_div = ~(div_data[1] ^ tid_w1[1]) & ~(div_data[0] ^ tid_w1[0]);
   assign div_kill = (flush_w1 & kill_thr_div) | invalid_div_w | new_div_vld;
   assign curr_div_vld = div_data[11] & ~div_zero_m & ~div_kill & ~div_used;

   wire   div_zero_unqual_m;
   assign div_zero_m = div_zero_unqual_m & isdiv_m;
   dff_s div_zero_e2m(.din(div_zero_e), .clk(clk), .q(div_zero_unqual_m), .se(se), .si(), .so());
   
   // pipeling for divide valid signal (for inst_vld checking)
   dff_s isdiv_d2e(.din(new_div_vld), .clk(clk), .q(isdiv_e),
                 .se(se), .si(), .so());
   dff_s isdiv_e2m(.din(isdiv_e_valid), .clk(clk), .q(isdiv_m),
                 .se(se), .si(), .so());
   dff_s isdiv_m2w(.din(isdiv_m_valid), .clk(clk), .q(isdiv_w),
                 .se(se), .si(), .so());
   assign        isdiv_e_valid = isdiv_e & ~div_kill;
   assign        isdiv_m_valid = isdiv_m & ~div_kill;

   // control for div state machine
   assign mdqctl_divcntl_reset_div = (~div_data[11] | div_kill);
   assign mdqctl_divcntl_input_vld = isdiv_e;

   // control signals for div
   assign ecl_div_div64 = div_data[`IS64];
   assign ecl_div_signed_div = div_data[`SIGNED];
   assign ecl_div_muls = div_data[`MULS];
   
   // control for writeback on completion
   assign mdqctl_wb_divrd_g[4:0] = div_data[6:2];
   assign mdqctl_wb_divthr_g[1:0] = div_data[1:0];
   assign mdqctl_wb_divsetcc_g = div_data[`SET_CC] | div_data[`MULS];
   assign mdqctl_wb_yreg_shift_g = div_used & div_data[`MULS];

   
   ////////////////////////////////////////////////////////////////////////////
   // Multiply control
   //----------------------
   // The multiply will drop the current operation if a new request is issued.
   // This requires addition checking to make sure that the kills are for the
   // proper operation.
   ////////////////////////////////////////////////////////////////////////////
   dff_s ismul_d2e(.din(ifu_exu_muldivop_d[4]), .clk(clk), .q(ismul_e),
                 .se(se), .si(), .so());
   dff_s ismul_e2m(.din(ismul_e_valid), .clk(clk), .q(ismul_m),
                 .se(se), .si(), .so());
   dff_s ismul_m2w(.din(ismul_m_valid), .clk(clk), .q(ismul_w),
                 .se(se), .si(), .so());
   assign ismul_e_valid = ismul_e & ~mul_kill;
   assign        ismul_m_valid = ismul_m & ~mul_kill & ~ismul_e;
   
   // store control signals
  //   assign mul_used = divcntl_wb_req_g & wb_divcntl_ack_g & ~ecl_div_sel_div;
   assign new_mul_d = ifu_exu_muldivop_d[4];
   
   assign mul_input_data_d[9:0] = {ifu_exu_muldivop_d[2], // 64bit
                                    ifu_exu_muldivop_d[1], // signed
                                    ifu_exu_muldivop_d[0], // setcc
                                    ifu_exu_rd_d[4:0],
                                    tid_d[1:0]};
   assign mul_data_next[9:0] = (new_mul_d)? mul_input_data_d[9:0]: mul_data[9:0];

   dff_s #(10) mul_data_dff(.din(mul_data_next[9:0]), .clk(clk), .q(mul_data[9:0]),
                          .se(se), .si(), .so());

   // mul kill logic
   assign kill_thr_mul = ~(mul_data[1] ^ tid_w1[1]) & ~(mul_data[0] ^ tid_w1[0]);
   assign mul_kill = (flush_w1 & kill_thr_mul) | reset;
   assign invalid_mul_w = ismul_w & ~ifu_exu_inst_vld_w;
   
   // control signals for mul data in div unit
   assign      ecl_div_mul_keep_data = ~ismul_e;
   assign      ecl_div_mul_get_new_data = ismul_e & mul_data[`IS64];
   assign      ecl_div_mul_get_32bit_data = ismul_e & ~mul_data[`IS64];
   assign      ecl_div_mul_sext_rs1_e = byp_alu_rs1_data_31_e & mul_data[`SIGNED];
   assign      ecl_div_mul_sext_rs2_e = byp_alu_rs2_data_31_e & mul_data[`SIGNED];

   // control for writeback on completion
   assign      mdqctl_wb_yreg_wen_g = ~mul_data[`IS64] & ecl_div_mul_wen;
   assign      mdqctl_wb_multhr_g[1:0] = mul_data[1:0];
   assign      mdqctl_wb_mulsetcc_g = mul_data[`SET_CC];
   assign      mdqctl_wb_mulrd_g[4:0] = mul_data[6:2];

   // interface with mul and state of pending mul
   assign      mul_ready_next = ismul_e_valid | (mul_ready & ~mul_exu_ack & ~mul_kill & ~ismul_e & ~invalid_mul_w);
   dff_s mul_ready_dff(.din(mul_ready_next), .clk(clk), .q(mul_ready), .se(se), .si(), .so());
   
   assign      exu_mul_input_vld = mul_ready;
   
   // If there was a valid request and an ack then start passing down pipe
   assign      mul_done_ack = mul_ready & ~mul_kill & ~ismul_e & mul_exu_ack & ~invalid_mul_w;
   dff_s dff_done_ack2c0(.din(mul_done_ack), .clk(clk), .q(mul_done_c0),
                       .se(se), .si(), .so());
   // need to check here cause this could be w
   assign        mul_done_valid_c0 = mul_done_c0 & ~mul_kill & ~invalid_mul_w & ~ismul_e;
   dff_s dff_done_c02c1(.din(mul_done_valid_c0), .clk(clk), .q(mul_done_c1),
                       .se(se), .si(), .so());
   // need to check here cause this could be w1
   assign        mul_done_valid_c1 = mul_done_c1 & ~mul_kill & ~ismul_e;
   dff_s dff_done_c1c2(.din(mul_done_valid_c1), .clk(clk), .q(mul_done_c2),
                       .se(se), .si(), .so());
   dff_s dff_done_c22c3(.din(mul_done_c2), .clk(clk), .q(mul_done_c3),
                       .se(se), .si(), .so());
   dff_s dff_done_c32c4(.din(mul_done_c3), .clk(clk), .q(ecl_div_mul_wen),
                       .se(se), .si(), .so());

   // Mul result state machine
   assign        go_mul_done = ~mul_done & ecl_div_mul_wen;
   assign        stay_mul_done = mul_done & (~wb_divcntl_ack_g | ecl_div_sel_div);
   assign        next_mul_done = ~reset & (go_mul_done | stay_mul_done);

   assign        mdqctl_divcntl_muldone = mul_done;

   // mul state flop
   dff_s  mulstate_dff(.din(next_mul_done), .clk(clk), .q(mul_done), .se(se), .si(),
                     .so());
   
   /////////////////////////////////////////
   // Pipeline registers for control signals
   /////////////////////////////////////////

   
endmodule // sparc_exu_ecl_mdqctl
