// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_eclcomp7.v
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
//  Module Name: sparc_exu_eclcomp7
//	Description: This block is a 7 bit comparator.  It takes 2 inputs
// 		and outputs a 1 on out if they are equal.
*/

module sparc_exu_eclcomp7 (/*AUTOARG*/
   // Outputs
   out, 
   // Inputs
   in1, in2
   ) ;
   input [6:0] in1;
   input [6:0] in2;
   output      out;

   wire [6:0]  in1xorin2;
   wire nor1out;
   wire nor2out;
   wire nor3out;
   wire nandout;
   
   assign in1xorin2 = in1 ^ in2;
   assign nor1out = ~(in1xorin2[0] | in1xorin2[1]);
   assign nor2out = ~(in1xorin2[2] | in1xorin2[3]);
   assign nor3out = ~(in1xorin2[4] | in1xorin2[5]);
   assign nandout = ~(nor1out & nor2out & nor3out);
   assign out = ~(in1xorin2[6] | nandout);
   
   
endmodule // sparc_exu_eclcomp7
