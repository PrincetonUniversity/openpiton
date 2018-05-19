// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ifu_lfsr5.v
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
//  Module Name: sparc_ifu_lfsr5
//  Description:	
//  The IFQ is the icache input queue.  This communicates between the
//  IFU and the outside world.  It handles icache misses and
//  invalidate requests from the crossbar.  
*/
////////////////////////////////////////////////////////////////////////

module sparc_ifu_lfsr5 (/*AUTOARG*/
   // Outputs
   out, 
   // Inputs
   advance, clk, se, si, so, reset
   );

   input 	advance;
   
   input 	clk, se, si, so, reset;

   output [1:0] out;

   reg [4:0]    q_next;
   wire [4:0]   q;
   

/*
   always @ (posedge clk)
     begin
	out = $random;
     end // always @ posedge
 */

//   always @ (posedge clk)
//     begin
//	q[4:0] <= q_next[4:0];
//     end

   always @ (/*AUTOSENSE*/advance or q or reset)
     begin
	      if (reset)
	        q_next = 5'b11111;
	      else if (advance)
	        begin
	           // lfsr -- stable at 000000, period of 63
	           q_next[1] = q[0];
	           q_next[2] = q[1];
	           q_next[3] = q[2];
	           q_next[4] = q[3];
	           q_next[0] = q[1] ^ q[4];
	        end
	      else
	        q_next = q;
     end // always @ (...

   assign out = {q[0], q[2]};

   dff_s #(5) lfsr_reg(.din  (q_next),
                     .q    (q),
                     .clk  (clk), .se(se), .si(), .so());
   
endmodule // sparc_ifu_lfsr5

		
	       

