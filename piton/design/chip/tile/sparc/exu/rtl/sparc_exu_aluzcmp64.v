// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_aluzcmp64.v
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
//
//  Module Name: sparc_exu_aluzcmp64
//	Description: This block determines if the input 'source' is zero.
//		It provides to outputs.  zero64 is high if all 64 bits
//		are zero, while zero32 is high if the lower 32 bits are
//		zero.  It uses 2 32 bit or gates and then NORs them.
*/

module sparc_exu_aluzcmp64
  (
   in,
   zero64,
   zero32
   );

   input [63:0] in;         // input operand

   output zero64;               // true if input is zero
   output zero32;               // true if lower 32 bits are zero

   wire   low_nonzero;					// low 32 is nonzero
   wire   high_nonzero;         // high 32 is nonzero

   // evaluate each half of the input
   sparc_exu_aluor32 lowcmp(.in(in[31:0]), .out(low_nonzero));
   sparc_exu_aluor32 highcmp(.in(in[63:32]), .out(high_nonzero));

   assign zero32 = ~low_nonzero;
   assign zero64 = ~(low_nonzero | high_nonzero);

endmodule // sparc_exu_aluzcmp64
   
