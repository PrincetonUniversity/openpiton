// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: nc_inv_chk.v
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
// File:	nc_inv_chk.v
// Description:
//
// ***************************************************************************

`include "ifu.tmp.h"

module nc_inv_chk (/*AUTOARG*/
   // Inputs
   clk, rst_l, cpxpkt_vld, cpxpkt_rtntype, nc, wv, coreid
   );

   input clk;
   input rst_l;
   input cpxpkt_vld;
   input [3:0] cpxpkt_rtntype;
   input nc;
   input wv;
   input [9:0] coreid;
   reg 	 enable;

   initial begin
      enable = 1;
      if ($test$plusargs("turn_off_nc_inv_chk"))enable = 0;
   end

   always @(negedge clk) begin
      if (rst_l) begin
	if (cpxpkt_vld == 1'b1 && cpxpkt_rtntype == 4'b0000 && nc == 1'b1 && wv == 1'b1)
	  begin
	    $display ("%d: C%d non-cachable load invalidating I$\n", $time, coreid);
	    if (enable)
	      `MONITOR_PATH.fail("non-cachable load invalidating I$");
	    else
	      $display("Warning-> non-cachable load invalidating I$");
	  end
        end
     end

endmodule


