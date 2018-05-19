// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_alu_16eql.v
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
//  Module Name: sparc_exu_alu_16eql
//	Description: Takes a 17 bit input and generates an active low output
//			signifying that all 17 bits have the same value.
*/
module sparc_exu_alu_16eql (/*AUTOARG*/
   // Outputs
   equal, 
   // Inputs
   in
   ) ;
   input [16:0] in;

   output       equal;

   wire [15:0]  inxor;
   wire [7:0]   nor1;
   wire [1:0]   nand2;

   assign inxor[0] = in[15] ^ in[14];
   assign inxor[1] = in[14] ^ in[13];
   assign inxor[2] = in[13] ^ in[12];
   assign inxor[3] = in[12] ^ in[11];
   assign inxor[4] = in[11] ^ in[10];
   assign inxor[5] = in[10] ^ in[9];
   assign inxor[6] = in[9] ^ in[8];
   assign inxor[7] = in[8] ^ in[7];
   assign inxor[8] = in[7] ^ in[6];
   assign inxor[9] = in[6] ^ in[5];
   assign inxor[10] = in[5] ^ in[4];
   assign inxor[11] = in[4] ^ in[3];
   assign inxor[12] = in[3] ^ in[2];
   assign inxor[13] = in[2] ^ in[1];
   assign inxor[14] = in[1] ^ in[0];
   assign inxor[15] = in[16] ^ in[15];

   assign nor1[0] = ~(inxor[15] | inxor[14]);
   assign       nor1[1] = ~(inxor[1] | inxor[0]);
   assign       nor1[2] = ~(inxor[3] | inxor[2]);
   assign       nor1[3] = ~(inxor[5] | inxor[4]);
   assign       nor1[4] = ~(inxor[7] | inxor[6]);
   assign       nor1[5] = ~(inxor[9] | inxor[8]);
   assign       nor1[6] = ~(inxor[11] | inxor[10]);
   assign       nor1[7] = ~(inxor[13] | inxor[12]);

   assign       nand2[0] = ~(nor1[1] & nor1[2] & nor1[3] & nor1[4]);
   assign       nand2[1] = ~(nor1[5] & nor1[6] & nor1[7] & nor1[0]);

   assign       equal = ~(nand2[1] | nand2[0]);
   
endmodule // sparc_exu_div_32eql
