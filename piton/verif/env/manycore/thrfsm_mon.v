// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: thrfsm_mon.v
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
`include "ifu.tmp.h"

module thrfsm_mon(/*AUTOARG*/
   // Inputs
   clk, rst_l, wm_imiss, wm_other, wm_stbwait, thr_state0,
   thr_state1, thr_state2, thr_state3, rst_stallreq, ifq_fcl_stallreq,
   lsu_ifu_stallreq, ffu_ifu_stallreq, completion, mul_wait, div_wait, fp_wait,
   mul_wait_nxt, div_wait_nxt, fp_wait_nxt, mul_busy_d, div_busy_d,
   fp_busy_d, ifet_ue_vec_d1, cpu_id
   );
   input clk;
   input rst_l;

   input [3:0] wm_imiss;
   input [3:0] wm_other;
   input [3:0] wm_stbwait;

   input [4:0] thr_state0;
   input [4:0] thr_state1;
   input [4:0] thr_state2;
   input [4:0] thr_state3;
   input       rst_stallreq;
   input       ifq_fcl_stallreq;
   input       lsu_ifu_stallreq;
   input       ffu_ifu_stallreq;
   input [3:0] completion;
   input [3:0] mul_wait;
   input [3:0] div_wait;
   input [3:0] fp_wait;
   input [3:0] mul_wait_nxt;
   input [3:0] div_wait_nxt;
   input [3:0] fp_wait_nxt;
   input [3:0] mul_busy_d;
   input [3:0] div_busy_d;
   input [3:0] fp_busy_d;
   input [3:0] ifet_ue_vec_d1;
   input [9:0] cpu_id;

   reg 	       enable;

   reg [3:0] ifet_ue_vec_e;
   reg [3:0] ifet_ue_vec_m;
   reg [3:0] ifet_ue_vec_w;

   integer i;

   initial begin
      enable = 1;
      if ($test$plusargs("turn_off_thread_monitor")) enable = 0;
   end

   task print_err_msg;
      input [1:0]  thread;
      input [4:0]  state;
      input [4095:0] comment;
      reg   [1023:0] state_name;

      begin
	 case (state)
	   `THRFSM_WAIT     : state_name = "THRFSM_WAIT";
	   `THRFSM_RDY      : state_name = "THRFSM_RDY";
	   `THRFSM_SPEC_RDY : state_name = "THRFSM_SPEC_RDY";
	   `THRFSM_RUN      : state_name = "THRFSM_RUN";
	   `THRFSM_SPEC_RUN : state_name = "THRFSM_SPEC_RUN";
	 endcase // case(state)

	 $display("Info: C%1d T%1d thr_state(%0s)", cpu_id, thread, state_name);
	 if (enable)
	   begin
	      $display("%d: C%1d T%1d %s\n", $time, cpu_id, thread, comment);
	      `MONITOR_PATH.fail(comment);
	   end
	 else
	   $display("Warning -> %s\n", comment);
      end
   endtask // print_err_msg

   always @(negedge clk)begin
      if (rst_l)
	begin

	   //0) Check: Completion signal does not have x's

           if (((completion[0] === 1'bx) && (ifet_ue_vec_d1[0] == 1'b0) && (ifet_ue_vec_e[0] == 1'b0) && (ifet_ue_vec_m[0] == 1'b0) && (ifet_ue_vec_w[0] == 1'b0)) ||
	       ((completion[1] === 1'bx) && (ifet_ue_vec_d1[1] == 1'b0) && (ifet_ue_vec_e[1] == 1'b0) && (ifet_ue_vec_m[1] == 1'b0) && (ifet_ue_vec_w[1] == 1'b0)) ||
	       ((completion[2] === 1'bx) && (ifet_ue_vec_d1[2] == 1'b0) && (ifet_ue_vec_e[2] == 1'b0) && (ifet_ue_vec_m[2] == 1'b0) && (ifet_ue_vec_w[2] == 1'b0)) ||
	       ((completion[3] === 1'bx) && (ifet_ue_vec_d1[3] == 1'b0) && (ifet_ue_vec_e[3] == 1'b0) && (ifet_ue_vec_m[3] == 1'b0) && (ifet_ue_vec_w[3] == 1'b0)))
	     begin
	      	if(enable)$display("Error: Info: C%1d has X's in the completion signal", cpu_id);
	      	if(enable)`MONITOR_PATH.fail("X's in the completion signal");
	      	else $display("Warning -> X's in the completion signal");
	     end

	   //1) Check: Thread wait masks do not have x's

	   if (((wm_imiss[0] === 1'bx) && (ifet_ue_vec_d1[0] == 1'b0) && (ifet_ue_vec_e[0] == 1'b0) && (ifet_ue_vec_m[0] == 1'b0) && (ifet_ue_vec_w[0] == 1'b0)) ||
	       ((wm_imiss[1] === 1'bx) && (ifet_ue_vec_d1[1] == 1'b0) && (ifet_ue_vec_e[1] == 1'b0) && (ifet_ue_vec_m[1] == 1'b0) && (ifet_ue_vec_w[1] == 1'b0)) ||
	       ((wm_imiss[2] === 1'bx) && (ifet_ue_vec_d1[2] == 1'b0) && (ifet_ue_vec_e[2] == 1'b0) && (ifet_ue_vec_m[2] == 1'b0) && (ifet_ue_vec_w[2] == 1'b0)) ||
	       ((wm_imiss[3] === 1'bx) && (ifet_ue_vec_d1[3] == 1'b0) && (ifet_ue_vec_e[3] == 1'b0) && (ifet_ue_vec_m[3] == 1'b0) && (ifet_ue_vec_w[3] == 1'b0)) ||
	       ((wm_other[0] === 1'bx) && (ifet_ue_vec_d1[0] == 1'b0) && (ifet_ue_vec_e[0] == 1'b0) && (ifet_ue_vec_m[0] == 1'b0) && (ifet_ue_vec_w[0] == 1'b0)) ||
	       ((wm_other[1] === 1'bx) && (ifet_ue_vec_d1[1] == 1'b0) && (ifet_ue_vec_e[1] == 1'b0) && (ifet_ue_vec_m[1] == 1'b0) && (ifet_ue_vec_w[1] == 1'b0)) ||
	       ((wm_other[2] === 1'bx) && (ifet_ue_vec_d1[2] == 1'b0) && (ifet_ue_vec_e[2] == 1'b0) && (ifet_ue_vec_m[2] == 1'b0) && (ifet_ue_vec_w[2] == 1'b0)) ||
	       ((wm_other[3] === 1'bx) && (ifet_ue_vec_d1[3] == 1'b0) && (ifet_ue_vec_e[3] == 1'b0) && (ifet_ue_vec_m[3] == 1'b0) && (ifet_ue_vec_w[3] == 1'b0)) ||
	       ((wm_stbwait[0] === 1'bx) && (ifet_ue_vec_d1[0] == 1'b0) && (ifet_ue_vec_e[0] == 1'b0) && (ifet_ue_vec_m[0] == 1'b0) && (ifet_ue_vec_w[0] == 1'b0)) ||
	       ((wm_stbwait[1] === 1'bx) && (ifet_ue_vec_d1[1] == 1'b0) && (ifet_ue_vec_e[1] == 1'b0) && (ifet_ue_vec_m[1] == 1'b0) && (ifet_ue_vec_w[1] == 1'b0)) ||
	       ((wm_stbwait[2] === 1'bx) && (ifet_ue_vec_d1[2] == 1'b0) && (ifet_ue_vec_e[2] == 1'b0) && (ifet_ue_vec_m[2] == 1'b0) && (ifet_ue_vec_w[2] == 1'b0)) ||
	       ((wm_stbwait[3] === 1'bx) && (ifet_ue_vec_d1[3] == 1'b0) && (ifet_ue_vec_e[3] == 1'b0) && (ifet_ue_vec_m[3] == 1'b0) && (ifet_ue_vec_w[3] == 1'b0)))
             begin
	      	$display("Info: C%1d wm_imiss(%x) wm_other(%x) wm_stbwait(%x)", cpu_id, wm_imiss, wm_other, wm_stbwait);
	      	if(enable)$display("Error: Thread wait masks contains X's");
	      	if(enable)`MONITOR_PATH.fail("Thread wait masks contains X's");
	      	else $display("Warning -> Thread wait masks contains X's");
	     end

	   //2) Check: Thread in wait state when no wait mask is set

	   if((thr_state0  == `THRFSM_WAIT) && (wm_imiss[0] == 1'b0) &&
	      (wm_other[0] == 1'b0) && (wm_stbwait[0] == 1'b0)) print_err_msg(0, thr_state0, "Thread FSM is in a wrong state");

	   if((thr_state1  == `THRFSM_WAIT) && (wm_imiss[1] == 1'b0) &&
	      (wm_other[1] == 1'b0) && (wm_stbwait[1] == 1'b0)) print_err_msg(1, thr_state1, "Thread FSM is in a wrong state");

	   if((thr_state2  == `THRFSM_WAIT) && (wm_imiss[2] == 1'b0) &&
	      (wm_other[2] == 1'b0) && (wm_stbwait[2] == 1'b0)) print_err_msg(2, thr_state2, "Thread FSM is in a wrong state");

	   if((thr_state3  == `THRFSM_WAIT) && (wm_imiss[3] == 1'b0) &&
	      (wm_other[3] == 1'b0) && (wm_stbwait[3] == 1'b0)) print_err_msg(3, thr_state3, "Thread FSM is in a wrong state");

	   //3) Check: Thread in "schedule-able" states when some wait mask is set

	   if(((thr_state0 == `THRFSM_SPEC_RDY)  ||
	       (thr_state0 == `THRFSM_RUN)       ||
	       (thr_state0 == `THRFSM_RDY)       ||
	       (thr_state0 == `THRFSM_SPEC_RUN)) &&
	      ((wm_imiss[0] != 1'b0)             ||
	       (wm_other[0] != 1'b0)             ||
	       (wm_stbwait[0] != 1'b0))) print_err_msg(0, thr_state0, "Thread FSM is in a wrong state");

	   if(((thr_state1 == `THRFSM_SPEC_RDY)  ||
	       (thr_state1 == `THRFSM_RUN)       ||
	       (thr_state1 == `THRFSM_RDY)       ||
	       (thr_state1 == `THRFSM_SPEC_RUN)) &&
	      ((wm_imiss[1] != 1'b0)             ||
	       (wm_other[1] != 1'b0)             ||
	       (wm_stbwait[1] != 1'b0))) print_err_msg(1, thr_state1, "Thread FSM is in a wrong state");

	   if(((thr_state2 == `THRFSM_SPEC_RDY)  ||
	       (thr_state2 == `THRFSM_RUN)       ||
	       (thr_state2 == `THRFSM_RDY)       ||
	       (thr_state2 == `THRFSM_SPEC_RUN)) &&
	      ((wm_imiss[2] != 1'b0)             ||
	       (wm_other[2] != 1'b0)             ||
	       (wm_stbwait[2] != 1'b0))) print_err_msg(2, thr_state2, "Thread FSM is in a wrong state");

	   if(((thr_state3 == `THRFSM_SPEC_RDY)  ||
	       (thr_state3 == `THRFSM_RUN)       ||
	       (thr_state3 == `THRFSM_RDY)       ||
	       (thr_state3 == `THRFSM_SPEC_RUN)) &&
	      ((wm_imiss[3] != 1'b0)             ||
	       (wm_other[3] != 1'b0)             ||
	       (wm_stbwait[3] != 1'b0))) print_err_msg(3, thr_state3, "Thread FSM is in a wrong state");

	   //6) Check: wait masks are in synch

	   if(((fp_wait[0] == 1'b1) || (fp_wait_nxt[0] == 1'b1) || (fp_busy_d[0] == 1'b1)) && (wm_other[0] == 1'b0) && (ifet_ue_vec_d1[0] == 1'b0) && (ifet_ue_vec_e[0] == 1'b0) && (ifet_ue_vec_m[0] == 1'b0) && (ifet_ue_vec_w[0] == 1'b0))
	     print_err_msg(0, thr_state0, "fp_wait or fp_busy and wm_other masks out of synch");
	   if(((fp_wait[1] == 1'b1) || (fp_wait_nxt[1] == 1'b1) || (fp_busy_d[1] == 1'b1)) && (wm_other[1] == 1'b0) && (ifet_ue_vec_d1[1] == 1'b0) && (ifet_ue_vec_e[1] == 1'b0) && (ifet_ue_vec_m[1] == 1'b0) && (ifet_ue_vec_w[1] == 1'b0))
	     print_err_msg(1, thr_state1, "fp_wait or fp_busy and wm_other masks out of synch");
	   if(((fp_wait[2] == 1'b1) || (fp_wait_nxt[2] == 1'b1) || (fp_busy_d[2] == 1'b1)) && (wm_other[2] == 1'b0) && (ifet_ue_vec_d1[2] == 1'b0) && (ifet_ue_vec_e[2] == 1'b0) && (ifet_ue_vec_m[2] == 1'b0) && (ifet_ue_vec_w[2] == 1'b0))
	     print_err_msg(2, thr_state2, "fp_wait or fp_busy and wm_other masks out of synch");
	   if(((fp_wait[3] == 1'b1) || (fp_wait_nxt[3] == 1'b1) || (fp_busy_d[3] == 1'b1)) && (wm_other[3] == 1'b0) && (ifet_ue_vec_d1[3] == 1'b0) && (ifet_ue_vec_e[3] == 1'b0) && (ifet_ue_vec_m[3] == 1'b0) && (ifet_ue_vec_w[3] == 1'b0))
	     print_err_msg(3, thr_state3, "fp_wait or fp_busy and wm_other masks out of synch");

	   if(((mul_wait[0] == 1'b1) || (mul_wait_nxt[0] == 1'b1) || (mul_busy_d[0] == 1'b1)) && (wm_other[0] == 1'b0) && (ifet_ue_vec_d1[0] == 1'b0) && (ifet_ue_vec_e[0] == 1'b0) && (ifet_ue_vec_m[0] == 1'b0) && (ifet_ue_vec_w[0] == 1'b0))
	     print_err_msg(0, thr_state0, "mul_wait or mul_busy and wm_other masks out of synch");
	   if(((mul_wait[1] == 1'b1) || (mul_wait_nxt[1] == 1'b1) || (mul_busy_d[1] == 1'b1)) && (wm_other[1] == 1'b0) && (ifet_ue_vec_d1[1] == 1'b0) && (ifet_ue_vec_e[1] == 1'b0) && (ifet_ue_vec_m[1] == 1'b0) && (ifet_ue_vec_w[1] == 1'b0))
	     print_err_msg(1, thr_state1, "mul_wait or mul_busy and wm_other masks out of synch");
	   if(((mul_wait[2] == 1'b1) || (mul_wait_nxt[2] == 1'b1) || (mul_busy_d[2] == 1'b1)) && (wm_other[2] == 1'b0) && (ifet_ue_vec_d1[2] == 1'b0) && (ifet_ue_vec_e[2] == 1'b0) && (ifet_ue_vec_m[2] == 1'b0) && (ifet_ue_vec_w[2] == 1'b0))
	     print_err_msg(2, thr_state2, "mul_wait or mul_busy and wm_other masks out of synch");
	   if(((mul_wait[3] == 1'b1) || (mul_wait_nxt[3] == 1'b1) || (mul_busy_d[3] == 1'b1)) && (wm_other[3] == 1'b0) && (ifet_ue_vec_d1[3] == 1'b0) && (ifet_ue_vec_e[3] == 1'b0) && (ifet_ue_vec_m[3] == 1'b0) && (ifet_ue_vec_w[3] == 1'b0))
	     print_err_msg(3, thr_state3, "mul_wait or mul_busy and wm_other masks out of synch");

	   if(((div_wait[0] == 1'b1) || (div_wait_nxt[0] == 1'b1) || (div_busy_d[0] == 1'b1)) && (wm_other[0] == 1'b0) && (ifet_ue_vec_d1[0] == 1'b0) && (ifet_ue_vec_e[0] == 1'b0) && (ifet_ue_vec_m[0] == 1'b0) && (ifet_ue_vec_w[0] == 1'b0))
	     print_err_msg(0, thr_state0, "div_wait or div_busy and wm_other masks out of synch");
	   if(((div_wait[1] == 1'b1) || (div_wait_nxt[1] == 1'b1) || (div_busy_d[1] == 1'b1)) && (wm_other[1] == 1'b0) && (ifet_ue_vec_d1[1] == 1'b0) && (ifet_ue_vec_e[1] == 1'b0) && (ifet_ue_vec_m[1] == 1'b0) && (ifet_ue_vec_w[1] == 1'b0))
	     print_err_msg(1, thr_state1, "div_wait or div_busy and wm_other masks out of synch");
	   if(((div_wait[2] == 1'b1) || (div_wait_nxt[2] == 1'b1) || (div_busy_d[2] == 1'b1)) && (wm_other[2] == 1'b0) && (ifet_ue_vec_d1[2] == 1'b0) && (ifet_ue_vec_e[2] == 1'b0) && (ifet_ue_vec_m[2] == 1'b0) && (ifet_ue_vec_w[2] == 1'b0))
	     print_err_msg(2, thr_state2, "div_wait or div_busy and wm_other masks out of synch");
	   if(((div_wait[3] == 1'b1) || (div_wait_nxt[3] == 1'b1) || (div_busy_d[3] == 1'b1)) && (wm_other[3] == 1'b0) && (ifet_ue_vec_d1[3] == 1'b0) && (ifet_ue_vec_e[3] == 1'b0) && (ifet_ue_vec_m[3] == 1'b0) && (ifet_ue_vec_w[3] == 1'b0))
	     print_err_msg(3, thr_state3, "div_wait or div_busy and wm_other masks out of synch");

	   ifet_ue_vec_w = ifet_ue_vec_m;
	   ifet_ue_vec_m = ifet_ue_vec_e;
	   ifet_ue_vec_e = ifet_ue_vec_d1;

      	end // if (!reset)
   end
endmodule // pipegraph


