// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_byp_eccgen.v
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
////////////////////////////////////////////////////////////////////////////////
//  Module Name: zzecc_exu_byp_eccgen2
//      Description: This block generates the 8 bit ecc for a 64 bit input
//                              It is split over 2 cycles to accomodate the timing requirements of 
//                              the other blocks.

module sparc_exu_byp_eccgen ( p, d, msk, clk, se);
   input [63:0] d;
   input [7:0]  msk;
   input        clk;
   input        se;
   output [7:0] p;

   wire [7:0]   p0_g;
   wire [7:0]   p0_w;
   wire [7:0]   p1_g;
   wire [7:0]   p1_w;
   wire [7:0]   p2_g;
   wire [7:0]   p2_w;
   wire [7:0]   p3_g;
   wire [7:0]   p3_w;
   wire [3:0]   p4_g;
   wire [3:0]   p4_w;
   wire [1:0]   p5_g;
   wire [1:0]   p5_w;
   wire [1:0]   p6_g;
   wire [1:0]   p6_w;
   wire [7:0]   p7_g;
   wire [7:0]   p7_w;
   wire 	msk_w5;
   wire 	msk_w4;

   // Flops to store intermediate results
  dff_s Imsk_5_  ( .q(msk_w5),  .din(msk[5]),  .clk(clk), .se(se), .si(), .so());
  dff_s Imsk_4_  ( .q(msk_w4),  .din(msk[4]),  .clk(clk), .se(se), .si(), .so());
  dff_s Ip0ff_7_ ( .q(p0_w[7]), .din(p0_g[7]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip0ff_6_ ( .q(p0_w[6]), .din(p0_g[6]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip0ff_5_ ( .q(p0_w[5]), .din(p0_g[5]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip0ff_4_ ( .q(p0_w[4]), .din(p0_g[4]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip0ff_3_ ( .q(p0_w[3]), .din(p0_g[3]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip0ff_2_ ( .q(p0_w[2]), .din(p0_g[2]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip0ff_1_ ( .q(p0_w[1]), .din(p0_g[1]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip0ff_0_ ( .q(p0_w[0]), .din(p0_g[0]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip1ff_7_ ( .q(p1_w[7]), .din(p1_g[7]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip1ff_6_ ( .q(p1_w[6]), .din(p1_g[6]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip1ff_5_ ( .q(p1_w[5]), .din(p1_g[5]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip1ff_4_ ( .q(p1_w[4]), .din(p1_g[4]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip1ff_3_ ( .q(p1_w[3]), .din(p1_g[3]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip1ff_2_ ( .q(p1_w[2]), .din(p1_g[2]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip1ff_1_ ( .q(p1_w[1]), .din(p1_g[1]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip1ff_0_ ( .q(p1_w[0]), .din(p1_g[0]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip2ff_7_ ( .q(p2_w[7]), .din(p2_g[7]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip2ff_6_ ( .q(p2_w[6]), .din(p2_g[6]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip2ff_5_ ( .q(p2_w[5]), .din(p2_g[5]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip2ff_4_ ( .q(p2_w[4]), .din(p2_g[4]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip2ff_3_ ( .q(p2_w[3]), .din(p2_g[3]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip2ff_2_ ( .q(p2_w[2]), .din(p2_g[2]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip2ff_1_ ( .q(p2_w[1]), .din(p2_g[1]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip2ff_0_ ( .q(p2_w[0]), .din(p2_g[0]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip3ff_7_ ( .q(p3_w[7]), .din(p3_g[7]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip3ff_6_ ( .q(p3_w[6]), .din(p3_g[6]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip3ff_5_ ( .q(p3_w[5]), .din(p3_g[5]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip3ff_4_ ( .q(p3_w[4]), .din(p3_g[4]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip3ff_3_ ( .q(p3_w[3]), .din(p3_g[3]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip3ff_2_ ( .q(p3_w[2]), .din(p3_g[2]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip3ff_1_ ( .q(p3_w[1]), .din(p3_g[1]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip3ff_0_ ( .q(p3_w[0]), .din(p3_g[0]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip4ff_3_ ( .q(p4_w[3]), .din(p4_g[3]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip4ff_2_ ( .q(p4_w[2]), .din(p4_g[2]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip4ff_1_ ( .q(p4_w[1]), .din(p4_g[1]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip4ff_0_ ( .q(p4_w[0]), .din(p4_g[0]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip5ff_1_ ( .q(p5_w[1]), .din(p5_g[1]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip5ff_0_ ( .q(p5_w[0]), .din(p5_g[0]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip6ff_1_ ( .q(p6_w[1]), .din(p6_g[1]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip6ff_0_ ( .q(p6_w[0]), .din(p6_g[0]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip7ff_7_ ( .q(p7_w[7]), .din(p7_g[7]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip7ff_6_ ( .q(p7_w[6]), .din(p7_g[6]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip7ff_5_ ( .q(p7_w[5]), .din(p7_g[5]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip7ff_4_ ( .q(p7_w[4]), .din(p7_g[4]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip7ff_3_ ( .q(p7_w[3]), .din(p7_g[3]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip7ff_2_ ( .q(p7_w[2]), .din(p7_g[2]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip7ff_1_ ( .q(p7_w[1]), .din(p7_g[1]), .clk(clk), .se(se), .si(), .so());
  dff_s Ip7ff_0_ ( .q(p7_w[0]), .din(p7_g[0]), .clk(clk), .se(se), .si(), .so());


   // p[0]
   assign p[0] = p0_w[0] ^ p0_w[1] ^ p0_w[2] ^ p0_w[3] ^ p0_w[4] ^ p0_w[5] ^ p0_w[6] ^ p0_w[7]; 
   assign p0_g[0] = d[0]  ^ d[1]  ^ d[3]  ^ d[4]; 
   assign p0_g[1] = d[6]  ^ d[8]  ^ d[10] ^ d[11];
   assign p0_g[2] = d[13] ^ d[15] ^ d[17] ^ d[19];
   assign p0_g[3] = d[21] ^ d[23] ^ d[25] ^ d[26];
   assign p0_g[4] = d[28] ^ d[30] ^ d[32] ^ d[34];
   assign p0_g[5] = d[36] ^ d[38] ^ d[40] ^ d[42];
   assign p0_g[6] = d[44] ^ d[46] ^ d[48] ^ d[50];
   assign p0_g[7] = d[52] ^ d[54] ^ d[56] ^ d[57] ^ d[59] ^ d[61] ^ d[63] ^ msk[0];

   // p[1]
   assign p[1] = p1_w[0] ^ p1_w[1] ^ p1_w[2] ^ p1_w[3] ^ p1_w[4] ^ p1_w[5] ^ p1_w[6] ^ p1_w[7];
   assign p1_g[0] = d[0]  ^ d[2]  ^ d[3]  ^ d[5]; 
   assign p1_g[1] = d[6]  ^ d[9]  ^ d[10] ^ d[12];
   assign p1_g[2] = d[13] ^ d[16] ^ d[17] ^ d[20];
   assign p1_g[3] = d[21] ^ d[24] ^ d[25] ^ d[27];
   assign p1_g[4] = d[28] ^ d[31] ^ d[32] ^ d[35];
   assign p1_g[5] = d[36] ^ d[39] ^ d[40] ^ d[43];
   assign p1_g[6] = d[44] ^ d[47] ^ d[48] ^ d[51];
   assign p1_g[7] = d[52] ^ d[55] ^ d[56] ^ d[58] ^ d[59] ^ d[62] ^ d[63] ^ msk[1];

   // p[2]
   assign p[2] = p2_w[0] ^ p2_w[1] ^ p2_w[2] ^ p2_w[3] ^ p2_w[4] ^ p2_w[5] ^ p2_w[6] ^ p2_w[7];
   assign p2_g[0] = d[1]  ^ d[2]  ^ d[3]  ^ d[7]; 
   assign p2_g[1] = d[8]  ^ d[9]  ^ d[10] ^ d[14];
   assign p2_g[2] = d[15] ^ d[16] ^ d[17] ^ d[22];
   assign p2_g[3] = d[23] ^ d[24] ^ d[25] ^ d[29];
   assign p2_g[4] = d[30] ^ d[31] ^ d[32] ^ d[37];
   assign p2_g[5] = d[38] ^ d[39] ^ d[40] ^ d[45];
   assign p2_g[6] = d[46] ^ d[47] ^ d[48] ^ d[53];
   assign p2_g[7] = d[54] ^ d[55] ^ d[56] ^ d[60] ^ d[61] ^ d[62] ^ d[63] ^ msk[2];
   
   // p[3]
   assign p[3] =  p3_w[0] ^ p3_w[1] ^ p3_w[2] ^ p3_w[3] ^ p3_w[4] ^ p3_w[5] ^ p3_w[6] ^ p3_w[7];
   assign p3_g[0] = d[4]  ^ d[5]  ^ d[6]  ^ d[7]; 
   assign p3_g[1] = d[8]  ^ d[9]  ^ d[10] ^ d[18];
   assign p3_g[2] = d[19] ^ d[20] ^ d[21] ^ d[22];
   assign p3_g[3] = d[23] ^ d[24] ^ d[25] ^ d[33];
   assign p3_g[4] = d[34] ^ d[35] ^ d[36] ^ d[37];
   assign p3_g[5] = d[38] ^ d[39] ^ d[40] ^ d[49];
   assign p3_g[6] = d[50] ^ d[51] ^ d[52] ^ d[53];
   assign p3_g[7] = d[54] ^ d[55] ^ d[56] ^ msk[3];

   // p[4]
   assign p[4] =  p4_w[0] ^ p4_w[1] ^ p4_w[2] ^ p4_w[3] ^ msk_w4;

   assign p4_g[0] = d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15] ^ d[16] ^ d[17] ^ d[18];
   assign p4_g[1] = d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23] ^ d[24] ^ d[25] ^ d[41];
   assign p4_g[2] = d[42] ^ d[43] ^ d[44] ^ d[45] ^ d[46] ^ d[47] ^ d[48] ^ d[49];
   assign p4_g[3] = d[50] ^ d[51] ^ d[52] ^ d[53] ^ d[54] ^ d[55] ^ d[56];

   // p[5]
   assign p[5] =  p5_w[0] ^ p5_w[1] ^ p4_w[2] ^ p4_w[3] ^ msk_w5;
   assign p5_g[0] = d[26] ^ d[27] ^ d[28] ^ d[29] ^ d[30] ^ d[31] ^ d[32] ^ d[33];
   assign p5_g[1] = d[34] ^ d[35] ^ d[36] ^ d[37] ^ d[38] ^ d[39] ^ d[40] ^ d[41];
/* -----\/----- EXCLUDED -----\/-----
   assign p5_g[2] = (d[42]  ^ d[43]  ^ d[44]  ^ d[45]  ^
                     d[46]  ^ d[47]  ^ d[48]  ^ d[49]);
   assign p5_g[3] = (d[50]  ^ d[51]  ^ d[52]  ^ d[53]  ^
                     d[54]  ^ d[55]  ^ d[56]); 
 -----/\----- EXCLUDED -----/\----- */

   // p[6]
   assign p[6] =  p6_w[0] ^ p6_w[1];
   assign p6_g[0] = d[57] ^ d[58] ^ d[59] ^ d[60];
   assign p6_g[1] = d[61] ^ d[62] ^ d[63] ^ msk[6]; 

   // p[7]
   assign p[7] = p7_w[0] ^ p7_w[1] ^ p7_w[2] ^ p7_w[3] ^ p7_w[4] ^ p7_w[5] ^ p7_w[6] ^ p7_w[7];
   assign p7_g[0] = d[0]  ^ d[1]  ^ d[2]  ^ d[4]; 
   assign p7_g[1] = d[5]  ^ d[7]  ^ d[10] ^ d[11];
   assign p7_g[2] = d[12] ^ d[14] ^ d[17] ^ d[18];
   assign p7_g[3] = d[21] ^ d[23] ^ d[24] ^ d[26];
   assign p7_g[4] = d[27] ^ d[29] ^ d[32] ^ d[33];
   assign p7_g[5] = d[36] ^ d[38] ^ d[39] ^ d[41];
   assign p7_g[6] = d[44] ^ d[46] ^ d[47] ^ d[50];
   assign p7_g[7] = d[51] ^ d[53] ^ d[56] ^ d[57] ^ d[58] ^ d[60] ^ d[63] ^ msk[7];
       
endmodule // zzecc_exu_byp_eccgen3

