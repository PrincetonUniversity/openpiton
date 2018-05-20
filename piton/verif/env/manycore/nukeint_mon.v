// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: nukeint_mon.v
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
// File:	nukeint_chk.v
// Description: This monitor checks that a thread transitions to the dead
//              state within 130 cycles of receiving an idle (nuke) interrupt.
//
// ***************************************************************************

`include "ifu.tmp.h"

module nukeint_mon(/*AUTOARG*/
   // Inputs
   clk, rst_l, nukeint, resumint, rstint, rstthr, thr_state0, thr_state1, thr_state2, thr_state3, coreid
   );

   input clk;
   input rst_l;
   input [4:0] thr_state0;
   input [4:0] thr_state1;
   input [4:0] thr_state2;
   input [4:0] thr_state3;
   input [3:0] rstthr;
   input       nukeint;
   input       resumint;
   input       rstint;
   input [9:0] coreid;

   integer     thr_cnt0;
   integer     thr_cnt1;
   integer     thr_cnt2;
   integer     thr_cnt3;

   integer     start_cnt0;
   integer     start_cnt1;
   integer     start_cnt2;
   integer     start_cnt3;

   reg         enable;
   integer     max_nuke_wait;

   initial begin
      enable = 1;
      if ($test$plusargs("turn_off_nukeint_mon"))enable = 0;
      if ($value$plusargs ("max_nuke_wait=%d", max_nuke_wait))
	$display ("Setting max_nuke_wait cycles to %d\n", max_nuke_wait) ;
      else
	max_nuke_wait = 2000;
      start_cnt0 = 0;
      start_cnt1 = 0;
      start_cnt2 = 0;
      start_cnt3 = 0;
   end

   always @(negedge clk) begin
     if (rst_l) begin
       if (start_cnt0 == 1) //already received a nuke, counting cycles now
	 begin
	    if (thr_cnt0 >= max_nuke_wait) //fail
	      begin
		 thr_cnt0 = 0;
		 start_cnt0 = 0;
	         $display ("%d: C%d Nuke Interrupt to Thr0 dropped\n", $time, coreid);
		 if (enable)
		   `MONITOR_PATH.fail("Nuke Interrupt to Thr0 dropped");
		 else
		   $display("Warning-> Nuke Interrupt to Thr0 dropped");
	      end
	    else
	      begin
		 if (thr_state0 != `THRFSM_DEAD)
		   begin
		      thr_cnt0 = thr_cnt0 + 1;
//		      $display ("%d: Thr0 nukeint wait cycles = %d\n", $time, thr_cnt0);
		   end
		 else //It is the dead state and everything is ok, reset the counter
		   begin
//		      $display ("%d: Thr0 nukeint was successfully taken\n", $time);
		      thr_cnt0 = 0;
		      start_cnt0 = 0;
		   end
	      end
	 end
       if (start_cnt1 == 1) //already received a nuke, counting cycles now
	 begin
	    if (thr_cnt1 >= max_nuke_wait) //fail
	      begin
		 thr_cnt1 = 0;
		 start_cnt1 = 0;
	         $display ("%d: C%d Nuke Interrupt to Thr1 dropped\n", $time, coreid);
		 if (enable)
		   `MONITOR_PATH.fail("Nuke Interrupt to Thr1 dropped");
		 else
		   $display("Warning-> Nuke Interrupt to Thr1 dropped");
	      end
	    else
	      begin
		 if (thr_state1 != `THRFSM_DEAD)
		   begin
		      thr_cnt1 = thr_cnt1 + 1;
//		      $display ("%d: Thr1 nukeint wait cycles = %d\n", $time, thr_cnt1);
		   end
		 else //It is the dead state and everything is ok, reset the counter
		   begin
	//	      $display ("%d: Thr1 nukeint was successfully taken\n", $time);
		      thr_cnt1 = 0;
		      start_cnt1 = 0;
		   end
	      end
	 end
       if (start_cnt2 == 1) //already received a nuke, counting cycles now
	 begin
	    if (thr_cnt2 >= max_nuke_wait) //fail
	      begin
		 thr_cnt2 = 0;
		 start_cnt2 = 0;
	         $display ("%d: C%d Nuke Interrupt to Thr2 dropped\n", $time, coreid);
		 if (enable)
		   `MONITOR_PATH.fail("Nuke Interrupt to Thr2 dropped");
		 else
		   $display("Warning-> Nuke Interrupt to Thr2 dropped");
	      end
	    else
	      begin
		 if (thr_state2 != `THRFSM_DEAD)
		   begin
		      thr_cnt2 = thr_cnt2 + 1;
		//      $display ("%d: Thr2 nukeint wait cycles = %d\n", $time, thr_cnt2);
		   end
		 else //It is the dead state and everything is ok, reset the counter
		   begin
		  //    $display ("%d: Thr2 nukeint was successfully taken\n", $time);
		      thr_cnt2 = 0;
		      start_cnt2 = 0;
		   end
	      end
	 end
       if (start_cnt3 == 1) //already received a nuke, counting cycles now
	 begin
	    if (thr_cnt3 >= max_nuke_wait) //fail
	      begin
		 thr_cnt3 = 0;
		 start_cnt3 = 0;
	         $display ("%d: C%d Nuke Interrupt to Thr3 dropped\n", $time, coreid);
		 if (enable)
		   `MONITOR_PATH.fail("Nuke Interrupt to Thr3 dropped");
		 else
		   $display("Warning-> Nuke Interrupt to Thr3 dropped");
	      end
	    else
	      begin
		 if (thr_state3 != `THRFSM_DEAD)
		   begin
		      thr_cnt3 = thr_cnt3 + 1;
//		      $display ("%d: Thr3 nukeint wait cycles = %d\n", $time, thr_cnt3);
		   end
		 else //It is the dead state and everything is ok, reset the counter
		   begin
//		      $display ("%d: Thr3 nukeint was successfully taken\n", $time);
		      thr_cnt3 = 0;
		      start_cnt3 = 0;
		   end
	      end
	 end

       	if (nukeint == 1'b1)
	  if (rstthr[0] == 1'b1)
	    begin
//	       $display ("%d: Thr0 received a nukeint\n", $time);
	       if (start_cnt0 == 0)
		 begin
	//	    $display ("%d: Thr0 has no pending nukeint\n", $time);
		    start_cnt0 = 1; //begin counting
		    thr_cnt0 = 0;
		 end
	    end
	  else if (rstthr[1] == 1'b1)
	    begin
	  //     $display ("%d: Thr1 received a nukeint\n", $time);
	       if (start_cnt1 == 0)
		 begin
		//    $display ("%d: Thr1 has no pending nukeint\n", $time);
		    start_cnt1 = 1; //begin counting
		    thr_cnt1 = 0;
		 end
	    end
	  else if (rstthr[2] == 1'b1)
	    begin
//	       $display ("%d: Thr2 received a nukeint\n", $time);
	       if (start_cnt2 == 0)
		 begin
		 //   $display ("%d: Thr2 has no pending nukeint\n", $time);
		    start_cnt2 = 1; //begin counting
		    thr_cnt2 = 0;
		 end
	    end
	  else if (rstthr[3] == 1'b1)
	    begin
	//       $display ("%d: Thr3 received a nukeint\n", $time);
	       if (start_cnt3 == 0)
		 begin
		//    $display ("%d: Thr3 has no pending nukeint\n", $time);
		    start_cnt3 = 1; //begin counting
		    thr_cnt3 = 0;
		 end
	    end

       	if ((resumint == 1'b1) || (rstint == 1'b1))
	  if (rstthr[0] == 1'b1)
	    begin
	 //      $display ("%d: Thr0 received a resumint\n", $time);
	       start_cnt0 = 0; //end counting
	       thr_cnt0 = 0;
	    end
	  else if (rstthr[1] == 1'b1)
	    begin
	 //      $display ("%d: Thr1 received a resumint\n", $time);
	       start_cnt1 = 0; //end counting
	       thr_cnt1 = 0;
	    end
	  else if (rstthr[2] == 1'b1)
	    begin
	 //      $display ("%d: Thr2 received a resumint\n", $time);
	       start_cnt2 = 0; //end counting
	       thr_cnt2 = 0;
	    end
	  else if (rstthr[3] == 1'b1)
	    begin
	 //      $display ("%d: Thr3 received a resumint\n", $time);
	       start_cnt3 = 0; //end counting
	       thr_cnt3 = 0;
	    end
        end
     end
endmodule


