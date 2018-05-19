// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_tlu_penc64.v
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
//  Module Name: sparc_tlu_penc64
//  Description:    
//    64 -> 6 priority encoder
//    Bit 63 has the highest priority
//
*/

module sparc_tlu_penc64 (/*AUTOARG*/
   // Outputs
   out, 
   // Inputs
   in
   );

   input [63:0] in;

   output [5:0] out;


   reg [5:0] 	out;
   integer 	i;
   
always @ (in)
begin
//
// code modified for verplex to avoid inferred latches
//	     if (in == 64'b0) // don't want a latch
	out = 6'b0;
//	else 
	for (i=0;i<64;i=i+1)
	    begin
	       if (in[i])
		   out[5:0] = i[5:0];
	    end
end
   
endmodule // sparc_tlu_penc64

