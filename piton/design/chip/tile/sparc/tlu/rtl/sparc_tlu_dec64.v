// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_tlu_dec64.v
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
//  Module Name: sparc_tlu_dec64
//  Description:    
//    6 -> 64 decoder
*/

module sparc_tlu_dec64(/*AUTOARG*/
   // Outputs
   out, 
   // Inputs
   in
   );

   input [5:0] in;

   output [63:0] out;


   wire [5:0] 	 in;
   reg [63:0] 	 out;

   integer 	 i;
   
   always @ (in)
     begin
	for (i=0;i<64;i=i+1)
	  begin
	     if (i[5:0] == in[5:0])
	       out[i] = 1'b1;
	     else
	       out[i] = 1'b0;
	  end
     end

endmodule // sparc_tlu_dec64

	
