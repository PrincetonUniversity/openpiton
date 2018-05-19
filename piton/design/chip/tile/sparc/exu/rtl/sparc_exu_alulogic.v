// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_alulogic.v
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
//
//  Module Name: sparc_exu_alulogic
//	Description: This block implements and, or, xor, xnor, nand, nor
//		and pass_rs2_data.  And, or, Xor and pass are muxed together
//		and then xored with an inversion signal to create
//		xnor, nand and nor.  Both inputs are buffered before being
//		used and the rs2_data signal is buffered again before going
//		to the mux.
*/

module sparc_exu_alulogic (/*AUTOARG*/
   // Outputs
   logic_out, 
   // Inputs
   rs1_data, rs2_data, isand, isor, isxor, pass_rs2_data, inv_logic, 
   ifu_exu_sethi_inst_e
   );

input [63:0] rs1_data;             // 1st input operand
input [63:0] rs2_data;             // 2nd input operand
input isand;
input isor;
input isxor;
input pass_rs2_data;
input inv_logic;
   input ifu_exu_sethi_inst_e;       // zero out top half of rs2 on mov

output [63:0] logic_out;      // output of logic block

wire [63:0] rs1_data_bf1;                 // buffered rs1_data
wire [63:0] rs2_data_bf1;                 // buffered rs2_data
   wire [63:0] mov_data;
wire [63:0] result_and;              // rs1_data & rs2_data
wire [63:0] result_or;               // rs1_data | rs2_data
wire [63:0] result_xor;              // rs1_data ^ rs2_data
wire [63:0] rs2_xor_invert;           // output of mux between various results


// mux between various results
   mux4ds #(64) logic_mux(.dout(logic_out[63:0]),
                        .in0(result_and[63:0]), 
                        .in1(result_or[63:0]),
                        .in2(result_xor[63:0]), 
                        .in3(mov_data[63:0]), 
                        .sel0(isand),
                        .sel1(isor), 
                        .sel2(isxor),
                        .sel3(pass_rs2_data));

// buffer inputs
dp_buffer #(64) rs1_data_buf(.dout(rs1_data_bf1[63:0]), .in(rs1_data[63:0]));
dp_buffer #(64) rs2_data_buf(.dout(rs2_data_bf1[63:0]), .in(rs2_data[63:0]));

   // zero out top of rs2 for sethi_inst
  assign   mov_data[63:32] = rs2_data_bf1[63:32] & {32{~ifu_exu_sethi_inst_e}};
   dp_buffer #(32) rs2_data_buf2(.dout(mov_data[31:0]), .in(rs2_data_bf1[31:0]));

// invert input2 for andn, orn, xnor
assign rs2_xor_invert[63:0] = rs2_data_bf1[63:0] ^ {64{inv_logic}};
   
// do boolean ops
assign result_and = rs1_data_bf1 & rs2_xor_invert;
assign result_or = rs1_data_bf1 | rs2_xor_invert;
assign result_xor = rs1_data_bf1 ^ rs2_xor_invert;

endmodule

