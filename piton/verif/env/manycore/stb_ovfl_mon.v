// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: stb_ovfl_mon.v
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
//
// File:	stb_ovfl_mon.v
// Description: This monitor checks that the store buffer count does not
//              exceed 8.
//
// ***************************************************************************

`include "ifu.tmp.h"

module stb_ovfl_mon (/*AUTOARG*/
   // Inputs
   clk, rst_l, lsu_ifu_stbcnt3, lsu_ifu_stbcnt2, lsu_ifu_stbcnt1, lsu_ifu_stbcnt0,
   stb_ctl_reset3, stb_ctl_reset2, stb_ctl_reset1, stb_ctl_reset0, coreid
   );

   input clk;
   input rst_l;
   input [3:0] lsu_ifu_stbcnt3;
   input [3:0] lsu_ifu_stbcnt2;
   input [3:0] lsu_ifu_stbcnt1;
   input [3:0] lsu_ifu_stbcnt0;
   input       stb_ctl_reset3;
   input       stb_ctl_reset2;
   input       stb_ctl_reset1;
   input       stb_ctl_reset0;
   input [9:0] coreid;

   reg 		enable;
   reg 		stb_ctl_reset3_dly;
   reg 		stb_ctl_reset2_dly;
   reg 		stb_ctl_reset1_dly;
   reg 		stb_ctl_reset0_dly;

   initial begin
      enable = 1;
      if ($test$plusargs("turn_off_stb_ovfl_mon"))enable = 0;
   end

   always @(negedge clk) begin
     if (rst_l) begin
	stb_ctl_reset3_dly <= stb_ctl_reset3;
	stb_ctl_reset2_dly <= stb_ctl_reset2;
	stb_ctl_reset1_dly <= stb_ctl_reset1;
	stb_ctl_reset0_dly <= stb_ctl_reset0;
	if ((lsu_ifu_stbcnt3 > 8) && (stb_ctl_reset3_dly == 1'b0))
	  begin
	     $display ("%d: C%d T3: Store buffer overflow. No of entries = %d\n", $time, coreid, lsu_ifu_stbcnt3);
	     if(enable)`MONITOR_PATH.fail("Store buffer overflow");
	     else $display("Warning -> Store buffer overflow");
          end
	if ((lsu_ifu_stbcnt2 > 8) && (stb_ctl_reset2_dly == 1'b0))
	  begin
	     $display ("%d: C%d T2: Store buffer overflow. No of entries = %d\n", $time, coreid, lsu_ifu_stbcnt2);
	     if(enable)`MONITOR_PATH.fail("Store buffer overflow");
	     else $display("Warning -> Store buffer overflow");
          end
	if ((lsu_ifu_stbcnt1 > 8) && (stb_ctl_reset1_dly == 1'b0))
	  begin
	     $display ("%d: C%d T1: Store buffer overflow. No of entries = %d\n", $time, coreid, lsu_ifu_stbcnt1);
	     if(enable)`MONITOR_PATH.fail("Store buffer overflow");
	     else $display("Warning -> Store buffer overflow");
          end
	if ((lsu_ifu_stbcnt0 > 8) && (stb_ctl_reset0_dly == 1'b0))
	  begin
	     $display ("%d: C%d T0: Store buffer overflow. No of entries = %d\n", $time, coreid, lsu_ifu_stbcnt0);
	     if(enable)`MONITOR_PATH.fail("Store buffer overflow");
	     else $display("Warning -> Store buffer overflow");
          end
       end
     end

endmodule


