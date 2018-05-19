// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ifu_swpla.v
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

module sparc_ifu_swpla(/*AUTOARG*/
   // Outputs
   out, 
   // Inputs
   in
   );

   input [31:0]  in;
   output 	 out;

   wire [31:0] 	 in;
   reg 		 out;
   

   always @ (in)
     begin
	      if (in[31:30] == 2'b01)            // call
	        out = 1'b1;
	      else if (in[31:30] == 2'b00)       // branch, sethi, nop
	        begin
	           if (in[24:22] == 3'b100) // nop/sethi
	             out = 1'b0;
	           else // branch
	             out = 1'b1;
	        end // if (in[31:30] == 2'b00)
	      else if (in[31:30] == 2'b10)        // arith, shift, mem#, mov
	        begin
	           if (in[24:23] == 2'b11)  // wrpr, vis, save, jmpl
	             out = 1'b1;
	           else if (in[24] == 1'b0) // arith
	             begin
		              if (in[22] == 1'b0) // alu op
		                out = 1'b0;
		              else if ((in[22] == 1'b1) && (in[20:19] == 2'b00))
		                // subc or addc
		                out = 1'b0;
		              else // mul, div
		                out = 1'b1;
	             end // if (in[24] == 1'b0)
	           else // if (in[24:23] == 2'b10)  shft, mov, rdpr, tag
	             begin
		              if (in[22:19] == 4'h4) // mulscc
		                out = 1'b1;
		              else if (in[22] == 1'b0)  // shft, tag
		                out = 1'b0;
		              else if  ((in[22:19] == 4'hc) ||  (in[22:19] == 4'hf)) // mov
		                out = 1'b0;
//		              else if (in[22:19] == 4'ha)  // rdpr
//		                out = 1'b0;
		              else // rdsr, mem#, popc, flushw, rdpr
		                out = 1'b1;
	             end // if ((in[24] == 1'b1) && (in[23] == 1'b0))
	        end // if (in[31:30] == 2'b10)
	      else // ld st
	        begin
//	           if (in[24] & in[22] & in[21] & ~in[20] & in[19]) // prefetch
//	             out = 1'b0;
             if (in[24] | in[23] | ~in[21]) // fp, alt space or ld
	             out = 1'b1;
//	           else if (in[24]) // FP and CAS
//	             out = 1'b1;
//	           else if (in[23] & in[20] & in[19]) // stda
//	             out = 1'b1;
	           else if ((~in[23]) && (in[22:19] == 4'he))  // stx
	             out = 1'b0;
	           else if (in[22:21] == 2'b01) // other st
	             out = 1'b0;
	           else // other atomic
	             out = 1'b1;
	        end // else: !if(in[31:30] == 2'b10)
     end // always @ (in)

   sink #(32) s0(.in (in));
   
endmodule // sparc_ifu_swpla


