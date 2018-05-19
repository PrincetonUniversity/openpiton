// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_rml_inc3.v
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
module sparc_exu_rml_inc3 (/*AUTOARG*/
   // Outputs
   dout, 
   // Inputs
   din, inc
   ) ;
   input [2:0] din;
   input       inc;
   output [2:0] dout;

   assign       dout[2] = ((~din[2] & ~din[1] & ~din[0] & ~inc) |
                           (~din[2] & din[1] & din[0] & inc) |
                           (din[2] & din[1] & ~din[0]) |
                           (din[2] & ~din[1] & inc) |
                           (din[2] & din[0] & ~inc));
   assign dout[1] = ((~din[1] & ~din[0] & ~inc) |
                     (din[1] & ~din[0] & inc) |
                     (~din[1] & din[0] & inc) |
                     (din[1] & din[0] & ~inc));
   assign dout[0] = ~din[0];
   
endmodule // sparc_exu_rml_inc3
