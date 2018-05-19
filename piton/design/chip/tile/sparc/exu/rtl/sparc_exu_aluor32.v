// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_aluor32.v
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
//  Module Name: sparc_exu_aluor32
//	Description: This block performs a 32 bit OR of the input source.
//			The result is the output nonzero.
*/


module sparc_exu_aluor32
  (/*AUTOARG*/
   // Outputs
   out, 
   // Inputs
   in
   );

   input [31:0] in;         // input to be compared to zero

   output       out;       // or of input bits

   wire         nor1_1;
   wire         nor1_2;
   wire         nor1_3;
   wire         nor1_4;
   wire         nor1_5;
   wire         nor1_6;
   wire         nor1_7;
   wire         nor1_8;
   wire         nor1_9;
   wire         nor1_10;
   wire         nor1_11;
   wire         nor1_12;
   wire         nor1_13;
   wire         nor1_14;
   wire         nor1_15;
   wire         nor1_16;
   wire         nand2_1;
   wire         nand2_2;
   wire         nand2_3;
   wire         nand2_4;
   wire         inv3_1;
   wire         inv3_2;
   wire         inv3_3;
   wire         inv3_4;

   assign       nor1_1 = ~(in[1] | in[0]);
   assign       nor1_2 = ~(in[3] | in[2]);
   assign       nor1_3 = ~(in[5] | in[4]);
   assign       nor1_4 = ~(in[7] | in[6]);
   assign       nor1_5 = ~(in[9] | in[8]);
   assign       nor1_6 = ~(in[11] | in[10]);
   assign       nor1_7 = ~(in[13] | in[12]);
   assign       nor1_8 = ~(in[15] | in[14]);
   assign       nor1_9 = ~(in[17] | in[16]);
   assign       nor1_10 = ~(in[19] | in[18]);
   assign       nor1_11 = ~(in[21] | in[20]);
   assign       nor1_12 = ~(in[23] | in[22]);
   assign       nor1_13 = ~(in[25] | in[24]);
   assign       nor1_14 = ~(in[27] | in[26]);
   assign       nor1_15 = ~(in[29] | in[28]);
   assign       nor1_16 = ~(in[31] | in[30]);

   assign       nand2_1 = ~(nor1_1 & nor1_2 & nor1_3 & nor1_4);
   assign       nand2_2 = ~(nor1_5 & nor1_6 & nor1_7 & nor1_8);
   assign       nand2_3 = ~(nor1_9 & nor1_10 & nor1_11 & nor1_12);
   assign       nand2_4 = ~(nor1_13 & nor1_14 & nor1_15 & nor1_16);

   assign       inv3_1 = ~nand2_1;
   assign       inv3_2 = ~nand2_2;
   assign       inv3_3 = ~nand2_3;
   assign       inv3_4 = ~nand2_4;

   assign       out = ~(inv3_1 & inv3_2 & inv3_3 & inv3_4);

endmodule // sparc_exu_aluor32

   

   
                           

                            
                            
                          
