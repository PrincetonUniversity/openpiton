// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_rndrob.v
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
//  Module Name: sparc_exu_rndrob
//  Description:	
//  Round robin scheduler.  Least priority to the last granted
//  customer.  If no requests, the priority remains the same. 
*/
////////////////////////////////////////////////////////////////////////

module sparc_exu_rndrob(/*AUTOARG*/
   // Outputs
   grant_vec, 
   // Inputs
   clk, reset, se, req_vec, advance
   );

   input     clk, reset, se;

   input  [3:0] req_vec;
   input 	advance;
   
   output [3:0] grant_vec;
   
   wire [3:0] 	pv,
		next_pv,
		park_vec;
   
   
   assign  next_pv =  advance ? grant_vec : park_vec;
   
   dffr_s #(4)  park_reg(.din  (next_pv[3:0]),
		    .clk  (clk),
		    .q    (pv[3:0]),
		    .rst  (reset),
		    .se   (se), .si(), .so());

   assign  park_vec = pv;

   // if noone requests, don't advance, otherwise we'll go back to 0
   // and will not be fair to other requestors
   assign grant_vec[0] =  park_vec[3] & req_vec[0] |
		  park_vec[2] & ~req_vec[3] & req_vec[0] |
		  park_vec[1] & ~req_vec[2] & ~req_vec[3] & req_vec[0] |
	          ~req_vec[1] & ~req_vec[2] & ~req_vec[3];
   
   assign grant_vec[1] = park_vec[0] & req_vec[1] |
		  park_vec[3] & ~req_vec[0] & req_vec[1] |
		  park_vec[2] & ~req_vec[3] & ~req_vec[0] & req_vec[1] |
	          req_vec[1] & ~req_vec[2] & ~req_vec[3] & ~req_vec[0];

   assign grant_vec[2] = park_vec[1] & req_vec[2] |
		  park_vec[0] & ~req_vec[1] & req_vec[2] |
		  park_vec[3] & ~req_vec[0] & ~req_vec[1] & req_vec[2] |
		  req_vec[2] & ~req_vec[3] & ~req_vec[0] & ~req_vec[1];

   assign grant_vec[3] = park_vec[2] & req_vec[3] |
		  park_vec[1] & ~req_vec[2] & req_vec[3] |
		  park_vec[0] & ~req_vec[1] & ~req_vec[2] & req_vec[3] |
		  req_vec[3] & ~req_vec[0] & ~req_vec[1] & ~req_vec[2];

endmodule // sparc_exu_rndrob

   
   
