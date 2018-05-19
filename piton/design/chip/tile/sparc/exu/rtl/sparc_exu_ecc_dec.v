// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_ecc_dec.v
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
//  Module Name: sparc_exu_ecc_dec
//	Description:  Decodes the result from the ecc checking block
// 			into a 64 bit value that is used to correct single bit errors.
//			Correction is performed by e ^ data.
*/
module sparc_exu_ecc_dec (/*AUTOARG*/
   // Outputs
   e, 
   // Inputs
   q
   ) ; 
   input [6:0] q;
   output [63:0] e;

   assign e[0] = ~q[6] & ~q[5] & ~q[4] & ~q[3] & ~q[2] & q[1] & q[0];
   assign e[1] = ~q[6] & ~q[5] & ~q[4] & ~q[3] & q[2] & ~q[1] & q[0];
   assign e[2] = ~q[6] & ~q[5] & ~q[4] & ~q[3] & q[2] & q[1] & ~q[0];
   assign e[3] = ~q[6] & ~q[5] & ~q[4] & ~q[3] & q[2] & q[1] & q[0];
   assign e[4] = ~q[6] & ~q[5] & ~q[4] & q[3] & ~q[2] & ~q[1] & q[0];
   assign e[5] = ~q[6] & ~q[5] & ~q[4] & q[3] & ~q[2] & q[1] & ~q[0];
   assign e[6] = ~q[6] & ~q[5] & ~q[4] & q[3] & ~q[2] & q[1] & q[0];
   assign e[7] = ~q[6] & ~q[5] & ~q[4] & q[3] & q[2] & ~q[1] & ~q[0];
   assign e[8] = ~q[6] & ~q[5] & ~q[4] & q[3] & q[2] & ~q[1] & q[0];
   assign e[9] = ~q[6] & ~q[5] & ~q[4] & q[3] & q[2] & q[1] & ~q[0];
   assign e[10] = ~q[6] & ~q[5] & ~q[4] & q[3] & q[2] & q[1] & q[0];
   assign e[11] = ~q[6] & ~q[5] & q[4] & ~q[3] & ~q[2] & ~q[1] & q[0];
   assign e[12] = ~q[6] & ~q[5] & q[4] & ~q[3] & ~q[2] & q[1] & ~q[0];
   assign e[13] = ~q[6] & ~q[5] & q[4] & ~q[3] & ~q[2] & q[1] & q[0];
   assign e[14] = ~q[6] & ~q[5] & q[4] & ~q[3] & q[2] & ~q[1] & ~q[0];
   assign e[15] = ~q[6] & ~q[5] & q[4] & ~q[3] & q[2] & ~q[1] & q[0];
   assign e[16] = ~q[6] & ~q[5] & q[4] & ~q[3] & q[2] & q[1] & ~q[0];
   assign e[17] = ~q[6] & ~q[5] & q[4] & ~q[3] & q[2] & q[1] & q[0];
   assign e[18] = ~q[6] & ~q[5] & q[4] & q[3] & ~q[2] & ~q[1] & ~q[0];
   assign e[19] = ~q[6] & ~q[5] & q[4] & q[3] & ~q[2] & ~q[1] & q[0];
   assign e[20] = ~q[6] & ~q[5] & q[4] & q[3] & ~q[2] & q[1] & ~q[0];
   assign e[21] = ~q[6] & ~q[5] & q[4] & q[3] & ~q[2] & q[1] & q[0];
   assign e[22] = ~q[6] & ~q[5] & q[4] & q[3] & q[2] & ~q[1] & ~q[0];
   assign e[23] = ~q[6] & ~q[5] & q[4] & q[3] & q[2] & ~q[1] & q[0];
   assign e[24] = ~q[6] & ~q[5] & q[4] & q[3] & q[2] & q[1] & ~q[0];
   assign e[25] = ~q[6] & ~q[5] & q[4] & q[3] & q[2] & q[1] & q[0];
   assign e[26] = ~q[6] & q[5] & ~q[4] & ~q[3] & ~q[2] & ~q[1] & q[0];
   assign e[27] = ~q[6] & q[5] & ~q[4] & ~q[3] & ~q[2] & q[1] & ~q[0];
   assign e[28] = ~q[6] & q[5] & ~q[4] & ~q[3] & ~q[2] & q[1] & q[0];
   assign e[29] = ~q[6] & q[5] & ~q[4] & ~q[3] & q[2] & ~q[1] & ~q[0];
   assign e[30] = ~q[6] & q[5] & ~q[4] & ~q[3] & q[2] & ~q[1] & q[0];
   assign e[31] = ~q[6] & q[5] & ~q[4] & ~q[3] & q[2] & q[1] & ~q[0];
   assign e[32] = ~q[6] & q[5] & ~q[4] & ~q[3] & q[2] & q[1] & q[0];
   assign e[33] = ~q[6] & q[5] & ~q[4] & q[3] & ~q[2] & ~q[1] & ~q[0];
   assign e[34] = ~q[6] & q[5] & ~q[4] & q[3] & ~q[2] & ~q[1] & q[0];
   assign e[35] = ~q[6] & q[5] & ~q[4] & q[3] & ~q[2] & q[1] & ~q[0];
   assign e[36] = ~q[6] & q[5] & ~q[4] & q[3] & ~q[2] & q[1] & q[0];
   assign e[37] = ~q[6] & q[5] & ~q[4] & q[3] & q[2] & ~q[1] & ~q[0];
   assign e[38] = ~q[6] & q[5] & ~q[4] & q[3] & q[2] & ~q[1] & q[0];
   assign e[39] = ~q[6] & q[5] & ~q[4] & q[3] & q[2] & q[1] & ~q[0];
   assign e[40] = ~q[6] & q[5] & ~q[4] & q[3] & q[2] & q[1] & q[0];
   assign e[41] = ~q[6] & q[5] & q[4] & ~q[3] & ~q[2] & ~q[1] & ~q[0];
   assign e[42] = ~q[6] & q[5] & q[4] & ~q[3] & ~q[2] & ~q[1] & q[0];
   assign e[43] = ~q[6] & q[5] & q[4] & ~q[3] & ~q[2] & q[1] & ~q[0];
   assign e[44] = ~q[6] & q[5] & q[4] & ~q[3] & ~q[2] & q[1] & q[0];
   assign e[45] = ~q[6] & q[5] & q[4] & ~q[3] & q[2] & ~q[1] & ~q[0];
   assign e[46] = ~q[6] & q[5] & q[4] & ~q[3] & q[2] & ~q[1] & q[0];
   assign e[47] = ~q[6] & q[5] & q[4] & ~q[3] & q[2] & q[1] & ~q[0];
   assign e[48] = ~q[6] & q[5] & q[4] & ~q[3] & q[2] & q[1] & q[0];
   assign e[49] = ~q[6] & q[5] & q[4] & q[3] & ~q[2] & ~q[1] & ~q[0];
   assign e[50] = ~q[6] & q[5] & q[4] & q[3] & ~q[2] & ~q[1] & q[0];
   assign e[51] = ~q[6] & q[5] & q[4] & q[3] & ~q[2] & q[1] & ~q[0];
   assign e[52] = ~q[6] & q[5] & q[4] & q[3] & ~q[2] & q[1] & q[0];
   assign e[53] = ~q[6] & q[5] & q[4] & q[3] & q[2] & ~q[1] & ~q[0];
   assign e[54] = ~q[6] & q[5] & q[4] & q[3] & q[2] & ~q[1] & q[0];
   assign e[55] = ~q[6] & q[5] & q[4] & q[3] & q[2] & q[1] & ~q[0];
   assign e[56] = ~q[6] & q[5] & q[4] & q[3] & q[2] & q[1] & q[0];
   assign e[57] = q[6] & ~q[5] & ~q[4] & ~q[3] & ~q[2] & ~q[1] & q[0];
   assign e[58] = q[6] & ~q[5] & ~q[4] & ~q[3] & ~q[2] & q[1] & ~q[0];
   assign e[59] = q[6] & ~q[5] & ~q[4] & ~q[3] & ~q[2] & q[1] & q[0];
   assign e[60] = q[6] & ~q[5] & ~q[4] & ~q[3] & q[2] & ~q[1] & ~q[0];
   assign e[61] = q[6] & ~q[5] & ~q[4] & ~q[3] & q[2] & ~q[1] & q[0];
   assign e[62] = q[6] & ~q[5] & ~q[4] & ~q[3] & q[2] & q[1] & ~q[0];
   assign e[63] = q[6] & ~q[5] & ~q[4] & ~q[3] & q[2] & q[1] & q[0];
   
endmodule // sparc_exu_ecc_dec
