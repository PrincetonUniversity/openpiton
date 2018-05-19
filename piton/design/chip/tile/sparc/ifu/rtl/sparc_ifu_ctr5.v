// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ifu_ctr5.v
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
//  Module Name: sparc_ifu_ctr5
//  Description:	
//  5 bit counter for starvation detect
*/

module sparc_ifu_ctr5(/*AUTOARG*/
   // Outputs
   limit, so, 
   // Inputs
   clk, se, si, rst_ctr_l
   );

   input     clk;
   input     se, si;

   input     rst_ctr_l;

   output    limit;
   output    so;
   
   wire [4:0] count,
	      count_nxt,
	      sum;
   
   assign   sum[0] = ~count[0];
   assign   sum[1] = count[1] ^ count[0];
   assign   sum[2] = count[2] ^ (count[1] & count[0]);
   assign   sum[3] = count[3] ^ (count[2] & count[1] & count[0]);
   assign   sum[4] = count[4] ^ (count[3] & count[2] & count[1] & count[0]);
   assign   count_nxt = sum & {5{rst_ctr_l}};

   dff_s #(5) cnt_reg(.din (count_nxt),
		                .q   (count),
		                .clk (clk),
		                .se  (se), .si(), .so());

   // limit set to 24 for now
   assign   limit = count[4] & count[3];
   
   
endmodule
   
