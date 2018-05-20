// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: pc_muxsel_mon.v
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
// File:	pc_muxsel_mon.v
// Description: This monitor checks that the right mux sel is asserted for a
// 		thread running in the F-stage.
//
// ***************************************************************************

`include "ifu.tmp.h"

module pc_muxsel_mon(/*AUTOARG*/
   // Inputs
   clk, rst_l, pc_f, thr_f, t0pc_f, t1pc_f, t2pc_f, t3pc_f, inst_vld_f, dtu_fcl_running_s,
   coreid
   );

   input clk;
   input rst_l;
   input [47:0] t0pc_f;
   input [47:0] t1pc_f;
   input [47:0] t2pc_f;
   input [47:0] t3pc_f;
   input [47:0] pc_f;
   input 	inst_vld_f;
   input        dtu_fcl_running_s;
   input [3:0] 	thr_f;
   input [9:0]  coreid;

   reg 		enable;

   initial begin
      enable = 1;
      if ($test$plusargs("turn_off_pc_muxsel_mon"))enable = 0;
   end

   always @(negedge clk)
     begin
       	if (rst_l)
	  begin

	     if (inst_vld_f == 1'b1 && dtu_fcl_running_s == 1'b1)
	       begin
		  if (thr_f[0] == 1'b1)
		    begin
		       if (pc_f != t0pc_f)
			 begin
			    $display ("%d: C%d T0: pc_f = %h: t0pc_f = %h\n", $time, coreid, pc_f, t0pc_f);
			    if(enable)`MONITOR_PATH.fail("Wrong PC selected for thread 0");
			    else $display("Warning -> Wrong PC selected for thread 0");
			 end
		    end
		  else if (thr_f[1] == 1'b1)
		    begin
		       if (pc_f != t1pc_f)
			 begin
			    $display ("%d: C%d T1: pc_f = %h: t1pc_f = %h\n", $time, coreid, pc_f, t1pc_f);
			    if(enable)`MONITOR_PATH.fail("Wrong PC selected for thread 1");
			    else $display("Warning -> Wrong PC selected for thread 1");
			 end
		    end
		  else if (thr_f[2] == 1'b1)
		    begin
		       if (pc_f != t2pc_f)
			 begin
			    $display ("%d: C%d T2: pc_f = %h: t2pc_f = %h\n", $time, coreid, pc_f, t2pc_f);
       			    if(enable)`MONITOR_PATH.fail("Wrong PC selected for thread 2");
			    else $display("Warning -> Wrong PC selected for thread 2");
			 end
		    end
		  else if (thr_f[3] == 1'b1)
		    begin
		       if (pc_f != t3pc_f)
			 begin
			    $display ("%d: C%d T3: pc_f = %h: t3pc_f = %h\n", $time, coreid, pc_f, t3pc_f);
			    if(enable)`MONITOR_PATH.fail("Wrong PC selected for thread 3");
			    else $display("Warning -> Wrong PC selected for thread 3");
			 end
		    end
	       end
	  end
     end

endmodule


