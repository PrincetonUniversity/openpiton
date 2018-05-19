// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_aluadder64.v
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
//  Module Name: sparc_exu_aluadder64
//	Description:		This block implements the adder for the sparc alu.
//            It takes two operands and a carry bit.  It adds them together
//						and sends the output to adder_out.  It outputs the overflow
//						and carry condition codes for both 64 bit and 32 bit operations.
*/

module sparc_exu_aluadder64
  (
   rs1_data,
   rs2_data,
   cin,
   adder_out,
   cout32,
   cout64
   );

   input [63:0]  rs1_data;   // 1st input operand
   input [63:0]  rs2_data;   // 2nd input operand
   input         cin;           // carry in

   output [63:0] adder_out; // result of adder
   output         cout32;         // Cout from lower 32 bit add
   output         cout64;         // cout from 64 bit add


////////////////////////////////////////////
//  Module implementation
////////////////////////////////////////////

   assign      {cout32, adder_out[31:0]} = rs1_data[31:0]+rs2_data[31:0]+
                                           cin;
   assign      {cout64, adder_out[63:32]} = rs1_data[63:32] 
               + rs2_data[63:32] + cout32;

endmodule // sparc_exu_aluadder64




