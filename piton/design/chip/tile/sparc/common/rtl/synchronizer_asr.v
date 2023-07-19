// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: synchronizer_asr.v
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
module synchronizer_asr (/*AUTOARG*/
   // Outputs
   sync_out, so, 
   // Inputs
   async_in, gclk, rclk, arst_l, si, se
   );

   output sync_out;
   output so;
   
   input  async_in;
   input  gclk;
   input  rclk;
   input  arst_l;
   input  si;
   input  se;

   wire   pre_sync_out;
   wire   so_rptr;
   wire   so_lockup;
   
   bw_u1_soffasr_2x repeater (
                              .q (pre_sync_out),
                              .so (so_rptr),
                              .ck (gclk),
                              .d (async_in),	
                              .r_l (arst_l),	
                              .s_l (1'b1),	
                              .se (se),
                              .sd (si)
			      );
   bw_u1_scanl_2x lockup (
			   .so (so_lockup),
			   .sd (so_rptr),
			   .ck (gclk)
			   );

   bw_u1_soffasr_2x syncff (
                            .q (sync_out),
                            .so (so),
                            .ck (rclk),
                            .d (pre_sync_out),
                            .r_l (arst_l),	
                            .s_l (1'b1),	
                            .se (se),
                            .sd (so_lockup)
			    );

endmodule // synchronizer_asr
