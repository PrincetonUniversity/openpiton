// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: cluster_header_dup.v
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
// The cluster header is instatiated as a hard macro.
// This model is for simulation only.
`include "sys.h"

module cluster_header_dup (/*AUTOARG*/
   // Outputs
   dbginit_l, cluster_grst_l, rclk, so,
   // Inputs
   gclk, cluster_cken, arst_l, grst_l, adbginit_l, gdbginit_l, si,
   se
   );

   input       gclk;
   input       cluster_cken;
   input       arst_l;
   input       grst_l;
   input       adbginit_l;
   input       gdbginit_l;
   output      dbginit_l;
   output      cluster_grst_l;
   output      rclk;

   input       si; // scan ports for reset flop repeaters
   input       se;
   output      so;

   wire        pre_sync_enable;
   wire        sync_enable;
   wire        cluster_grst_l;
   wire        dbginit_l;
   wire        rst_sync_so;

   bw_u1_soffasr_2x sync_cluster_master ( // no scan hook-up
                                        .so(),
                                        .q (pre_sync_enable),
                                        .ck (gclk),
                                        .d (cluster_cken),
					.r_l (arst_l),
					.s_l (1'b1),
                                        .sd(1'b0),
                                        .se(1'b0)
				        );


   bw_clk_cclk_scanlasr_2x sync_cluster_slave ( // use scan lock-up latch
                                      .r_l (arst_l),
                                      .so (sync_enable),
                                      .ck (gclk),
                                      .sd (pre_sync_enable)
        			      );

// NOTE! Pound delay in the below statement is meant to provide 10 ps
// delay between gclk and rclk to allow the synchronizer for rst, dbginit,
// and sync pulses to be modelled accurately.  gclk and rclk need to have
// at least one simulator timestep separation to allow the flop->flop
// synchronizer to work correctly.
   // assign #10 rclk = gclk & sync_enable;
   assign rclk = gclk & sync_enable;

   synchronizer_asr rst_repeater (
				 .sync_out(cluster_grst_l),
				 .so(rst_sync_so),
				 .async_in(grst_l),
				 .gclk(gclk),
				 .rclk(rclk),
				 .arst_l(arst_l),
				 .si(si),
				 .se(se)
				 );

   synchronizer_asr_dup dbginit_repeater (
				     .sync_out(dbginit_l),
				     .so(so),
				     .async_in(gdbginit_l),
				     .gclk(gclk),
				     .rclk(rclk),
				     .arst_l(adbginit_l),
				     .si(rst_sync_so),
				     .se(se)
				     );

endmodule // cluster_header
