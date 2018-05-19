// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ffu_part_add32.v
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
///////////////////////////////////////////////////////////////////////
/*
//  Module Name: sparc_ffu_part_add32
//      Description: This is the ffu VIS adder.  It can do either 
//				2 16 bit adds or 1 32 bit add.
*/
module sparc_ffu_part_add32 (/*AUTOARG*/
   // Outputs
   z, 
   // Inputs
   a, b, cin, add32
   ) ;
   input [31:0] a;
   input [31:0] b;
   input        cin;
   input        add32;

   output [31:0] z;

   wire          cout15; // carry out from lower 16 bit add
   wire          cin16; // carry in to the upper 16 bit add

   assign        cin16 = (add32)? cout15: cin;

   assign      {cout15, z[15:0]} = a[15:0]+b[15:0]+{15'b0,cin};   
   assign      z[31:16] = a[31:16]+b[31:16]+{15'b0,cin16};   
   
endmodule // sparc_ffu_part_add32
