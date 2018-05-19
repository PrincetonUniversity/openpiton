// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_aluspr.v
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
//  Module Name: sparc_exu_aluspr
//	Description:		This block implements the sum predict for the sparc alu.
//            It takes two operands and produces the correct result if the
//            sum is zero.  If not, the output is undefined, but non-zero.
*/

module sparc_exu_aluspr(/*AUTOARG*/
   // Outputs
   spr_out, 
   // Inputs
   rs1_data, rs2_data, cin
   );

input [63:0] rs1_data;
input [63:0] rs2_data;
   input     cin;
output [63:0] spr_out;

wire [63:0] rs1_data_xor_rs2_data;
wire [62:0] rs1_data_or_rs2_data;
wire [63:0] shift_or;

assign rs1_data_xor_rs2_data[63:0] = rs1_data[63:0] ^ rs2_data[63:0];
assign rs1_data_or_rs2_data[62:0] = rs1_data[62:0] | rs2_data[62:0];
assign shift_or[63:0] = {rs1_data_or_rs2_data[62:0],cin};

assign spr_out[63:0] = rs1_data_xor_rs2_data[63:0] ^ shift_or[63:0];

endmodule  // sparc_exu_aluspr
