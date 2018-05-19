// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_div_32eql.v
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
module sparc_exu_div_32eql (/*AUTOARG*/
   // Outputs
   equal, 
   // Inputs
   in
   ) ;
   input [31:0] in;

   output       equal;

   wire [31:0]  inxor;
   wire         notequal;

   assign       inxor[0] = 1'b0;
   assign inxor[1] = in[31] ^ in[30];
   assign inxor[2] = in[30] ^ in[29];
   assign inxor[3] = in[29] ^ in[28];
   assign inxor[4] = in[28] ^ in[27];
   assign inxor[5] = in[27] ^ in[26];
   assign inxor[6] = in[26] ^ in[25];
   assign inxor[7] = in[25] ^ in[24];
   assign inxor[8] = in[24] ^ in[23];
   assign inxor[9] = in[23] ^ in[22];
   assign inxor[10] = in[22] ^ in[21];
   assign inxor[11] = in[21] ^ in[20];
   assign inxor[12] = in[20] ^ in[19];
   assign inxor[13] = in[19] ^ in[18];
   assign inxor[14] = in[18] ^ in[17];
   assign inxor[15] = in[17] ^ in[16];
   assign inxor[16] = in[16] ^ in[15];
   assign inxor[17] = in[15] ^ in[14];
   assign inxor[18] = in[14] ^ in[13];
   assign inxor[19] = in[13] ^ in[12];
   assign inxor[20] = in[12] ^ in[11];
   assign inxor[21] = in[11] ^ in[10];
   assign inxor[22] = in[10] ^ in[9];
   assign inxor[23] = in[9] ^ in[8];
   assign inxor[24] = in[8] ^ in[7];
   assign inxor[25] = in[7] ^ in[6];
   assign inxor[26] = in[6] ^ in[5];
   assign inxor[27] = in[5] ^ in[4];
   assign inxor[28] = in[4] ^ in[3];
   assign inxor[29] = in[3] ^ in[2];
   assign inxor[30] = in[2] ^ in[1];
   assign inxor[31] = in[1] ^ in[0];

   assign equal = ~notequal;
   sparc_exu_aluor32 or32(// Outputs
                          .out     (notequal),
                          // Inputs
                          .in       (inxor[31:0]));
   
endmodule // sparc_exu_div_32eql
