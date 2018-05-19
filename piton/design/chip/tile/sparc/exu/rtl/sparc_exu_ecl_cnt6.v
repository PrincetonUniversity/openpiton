// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_ecl_cnt6.v
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
//  Module Name: sparc_exu_cnt6
//	Description: 6 bit binary counter
*/
module sparc_exu_ecl_cnt6 (/*AUTOARG*/
   // Outputs
   cntr, 
   // Inputs
   reset, clk, se
   ) ;
   input reset;
   input clk;
   input se;
   
   output [5:0] cntr;

   wire [5:0]   next_cntr;
   wire         tog1;
   wire         tog2;
   wire         tog3;
   wire         tog4;
   wire         tog5;

   assign       tog1 = cntr[0];
   assign       tog2 = cntr[0] & cntr[1];
   assign       tog3 = cntr[0] & cntr[1] & cntr[2];
   assign       tog4 = cntr[0] & cntr[1] & cntr[2] & cntr[3];
   assign       tog5 = cntr[0] & cntr[1] & cntr[2] & cntr[3] & cntr[4];
   assign next_cntr[0] = ~reset & ~cntr[0];
   assign next_cntr[1] = ~reset & ((~cntr[1] & tog1) | (cntr[1] & ~tog1)); 
   assign next_cntr[2] = ~reset & ((~cntr[2] & tog2) | (cntr[2] & ~tog2)); 
   assign next_cntr[3] = ~reset & ((~cntr[3] & tog3) | (cntr[3] & ~tog3)); 
   assign next_cntr[4] = ~reset & ((~cntr[4] & tog4) | (cntr[4] & ~tog4)); 
   assign next_cntr[5] = ~reset & ((~cntr[5] & tog5) | (cntr[5] & ~tog5)); 
   

   // counter flop
   dff_s #(6) cntr_dff(.din(next_cntr[5:0]), .clk(clk), .q(cntr[5:0]), .se(se), .si(), .so());
endmodule // sparc_exu_ecl_cnt6
