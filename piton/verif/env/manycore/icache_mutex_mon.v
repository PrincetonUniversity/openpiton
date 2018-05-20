// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: icache_mutex_mon.v
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
// ***************************************************************************
// File:	icache_mutex_mon.v
// Description: This monitor checks that the icache hits are mutex
// ***************************************************************************

`include "ifu.tmp.h"

module icache_mutex_mon(/*AUTOARG*/
   // Inputs
   clk, rst_l, waysel_buf_s1, alltag_err_s1, tlb_cam_miss_s1, cam_vld_s1, coreid
   );

   input clk;
   input rst_l;
   input [3:0] waysel_buf_s1;
   input [3:0] alltag_err_s1;
   input       tlb_cam_miss_s1;
   input       cam_vld_s1;
   input [9:0] coreid;

   reg 		enable;

   initial begin
      enable = 1;
      if ($test$plusargs("turn_off_icache_mutex_mon")) enable = 0;
   end

   always @ (negedge clk) begin
      if (rst_l) begin
        if (!((waysel_buf_s1 == 4'b0001) ||
              (waysel_buf_s1 == 4'b0010) ||
              (waysel_buf_s1 == 4'b0100) ||
              (waysel_buf_s1 == 4'b1000) ||
              (waysel_buf_s1 == 4'b0000)) &&
	      (|alltag_err_s1 == 1'b0) &&
	      (tlb_cam_miss_s1 == 1'b0) &&
	      (cam_vld_s1 == 1'b1))
	  begin
	     $display ("%d: C%d Non-mutex hit in the icache: %4b\n", $time, coreid, waysel_buf_s1);
	     if (enable)
	       `MONITOR_PATH.fail("Non-mutex hit in the icache");
	     else
	       $display("Warning-> Non-mutex hit in the icache");
	  end // if (!((waysel_buf_s1 == 4'b0001) ||...
      end // if (rst_l)
   end

endmodule


