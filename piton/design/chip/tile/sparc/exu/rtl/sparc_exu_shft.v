// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_shft.v
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
//  Module Name: sparc_exu_shft
//	Description: This block implements right and left shifting of any amount
//								from 0 to 63.
*/


module sparc_exu_shft (/*AUTOARG*/
   // Outputs
   shft_alu_shift_out_e, 
   // Inputs
   ecl_shft_lshift_e_l, ecl_shft_op32_e, ecl_shft_shift4_e, 
   ecl_shft_shift1_e, byp_alu_rs1_data_e, byp_alu_rs2_data_e, 
   ecl_shft_enshift_e_l, ecl_shft_extendbit_e, 
   ecl_shft_extend32bit_e_l
   ) ;
   input 	ecl_shft_lshift_e_l;    // if 0 do left shift.  else right shift
   input  ecl_shft_op32_e;      // indicates 32 bit operation so upper 32 = 0
   //input [3:0] ecl_shft_shift16_e;// [48, 32, 16, 0] shift
   input [3:0] ecl_shft_shift4_e;// [12, 8, 4, 0] shift
   input [3:0] ecl_shft_shift1_e;// [3, 2, 1, 0] shift
   input [63:0] byp_alu_rs1_data_e;
   input [5:4] byp_alu_rs2_data_e;
   input        ecl_shft_enshift_e_l;// enables inputs to shifter
   input        ecl_shft_extendbit_e;
   input    ecl_shft_extend32bit_e_l;
   
   output [63:0] shft_alu_shift_out_e;

   wire [63:0]   shifter_input; // enabled input
   wire [63:0]   shifter_input_b1;// buffered input
   wire [63:0]   rshifterinput; // masked for 32-bit operation
   wire [63:0]   rshifterinput_b1; // masked for 32-bit operation
   wire [63:0]   lshift16;      // output of the respective mux
   wire [63:0]   rshift16;
   wire [63:0]   lshift4;
   wire [63:0]   rshift4;
   wire [63:0]   lshift1;
   wire [63:0]   rshift1;
   wire [63:0]   lshift16_b1;      // buffed output of the respective mux
   wire [63:0]   rshift16_b1;
   wire [63:0]   lshift4_b1;
   wire [63:0]   rshift4_b1;
   wire [47:0]   shft_extendbit_e;
   wire [3:0]    shift16_e;
   wire          shiftby_msb;
   wire          extend32bit_e;

   assign        shiftby_msb = byp_alu_rs2_data_e[5] & ~ecl_shft_op32_e;
   assign        shift16_e[0] = ~shiftby_msb & ~byp_alu_rs2_data_e[4];
   assign        shift16_e[1] = ~shiftby_msb & byp_alu_rs2_data_e[4];
   assign        shift16_e[2] = shiftby_msb & ~byp_alu_rs2_data_e[4];
   assign        shift16_e[3] = shiftby_msb & byp_alu_rs2_data_e[4];
   // enable inputs
   assign   shifter_input[63:0] = byp_alu_rs1_data_e[63:0] & {64{~ecl_shft_enshift_e_l}};
   
   // mux between left and right shifts
   dp_mux2es #(64) mux_shiftout(.dout(shft_alu_shift_out_e[63:0]), .in0(lshift1[63:0]),
                           .in1(rshift1[63:0]),
                           .sel(ecl_shft_lshift_e_l));
   
   // mask out top for r_shift 32bit
   assign   extend32bit_e = ~ecl_shft_extend32bit_e_l;
   dp_mux2es #(32) mux_rshift_extend(.dout(rshifterinput[63:32]),
                                     .in0(byp_alu_rs1_data_e[63:32]),
                                     .in1({32{extend32bit_e}}),
                                     .sel(ecl_shft_op32_e));
   assign rshifterinput[31:0] = shifter_input[31:0];

   assign shft_extendbit_e[47:0] = {48{ecl_shft_extendbit_e}};

   // right shift muxes
   mux4ds #(64) mux_right16(.dout(rshift16[63:0]),
                          .in0({shft_extendbit_e[47:0], rshifterinput_b1[63:48]}),
                          .in1({shft_extendbit_e[47:16], rshifterinput_b1[63:32]}),
                          .in2({shft_extendbit_e[47:32], rshifterinput_b1[63:16]}),
                          .in3(rshifterinput_b1[63:0]),
                          .sel0(shift16_e[3]),
                          .sel1(shift16_e[2]),
                          .sel2(shift16_e[1]),
                          .sel3(shift16_e[0]));
   mux4ds #(64) mux_right4(.dout(rshift4[63:0]),
                         .in0({shft_extendbit_e[47:36], rshift16_b1[63:12]}),
                         .in1({shft_extendbit_e[47:40], rshift16_b1[63:8]}),
                         .in2({shft_extendbit_e[47:44], rshift16_b1[63:4]}),
                         .in3(rshift16_b1[63:0]),
                         .sel0(ecl_shft_shift4_e[3]),
                         .sel1(ecl_shft_shift4_e[2]),
                         .sel2(ecl_shft_shift4_e[1]),
                         .sel3(ecl_shft_shift4_e[0]));
   mux4ds #(64) mux_right1(.dout(rshift1[63:0]),
                         .in0({shft_extendbit_e[47:45], rshift4_b1[63:3]}),
                         .in1({shft_extendbit_e[47:46], rshift4_b1[63:2]}),
                         .in2({shft_extendbit_e[47], rshift4_b1[63:1]}),
                         .in3(rshift4_b1[63:0]),
                         .sel0(ecl_shft_shift1_e[3]),
                         .sel1(ecl_shft_shift1_e[2]),
                         .sel2(ecl_shft_shift1_e[1]),
                         .sel3(ecl_shft_shift1_e[0]));

   // buffer signals to right muxes
   dp_buffer #(64) buf_rshiftin(.dout(rshifterinput_b1[63:0]), .in(rshifterinput[63:0]));
   dp_buffer #(64) buf_rshift16(.dout(rshift16_b1[63:0]), .in(rshift16[63:0]));
   dp_buffer #(64) buf_rshift4(.dout(rshift4_b1[63:0]), .in(rshift4[63:0]));

   // left shift muxes
   mux4ds #(64) mux_left16(.dout(lshift16[63:0]),
                         .in0({shifter_input_b1[15:0], {48{1'b0}}}),
                         .in1({shifter_input_b1[31:0], {32{1'b0}}}),
                         .in2({shifter_input_b1[47:0], {16{1'b0}}}),
                         .in3(shifter_input_b1[63:0]),
                         .sel0(shift16_e[3]),
                         .sel1(shift16_e[2]),
                         .sel2(shift16_e[1]),
                         .sel3(shift16_e[0]));
   mux4ds #(64) mux_left4(.dout(lshift4[63:0]),
                        .in0({lshift16_b1[51:0], {12{1'b0}}}),
                        .in1({lshift16_b1[55:0], {8{1'b0}}}),
                        .in2({lshift16_b1[59:0], {4{1'b0}}}),
                        .in3(lshift16_b1[63:0]),
                        .sel0(ecl_shft_shift4_e[3]),
                        .sel1(ecl_shft_shift4_e[2]),
                        .sel2(ecl_shft_shift4_e[1]),
                        .sel3(ecl_shft_shift4_e[0]));
   mux4ds #(64) mux_left1(.dout(lshift1[63:0]),
                        .in0({lshift4_b1[60:0], {3{1'b0}}}),
                        .in1({lshift4_b1[61:0], {2{1'b0}}}),
                        .in2({lshift4_b1[62:0], {1{1'b0}}}),
                        .in3(lshift4_b1[63:0]),
                        .sel0(ecl_shft_shift1_e[3]),
                        .sel1(ecl_shft_shift1_e[2]),
                        .sel2(ecl_shft_shift1_e[1]),
                        .sel3(ecl_shft_shift1_e[0]));

   // buffer signals to left muxes
   dp_buffer #(64) buf_lshiftin(.dout(shifter_input_b1[63:0]), .in(shifter_input[63:0]));
   dp_buffer #(64) buf_lshift16(.dout(lshift16_b1[63:0]), .in(lshift16[63:0]));
   dp_buffer #(64) buf_lshift4(.dout(lshift4_b1[63:0]), .in(lshift4[63:0]));

    
endmodule // sparc_exu_shft
