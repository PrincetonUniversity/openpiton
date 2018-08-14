// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ifu_thrfsm.v
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
////////////////////////////////////////////////////////////////////////
/*
//  Module Name: sparc_ifu_swlthrfsm
//  Description:	
//  The switch logithrfsm contains the thread state machine.  
*/

`include "ifu.tmp.h"

module sparc_ifu_thrfsm(/*AUTOARG*/
   // Outputs
   so, thr_state, thr_nstate,
   // Inputs
   completion, schedule, spec_ld, ldhit, stall, int_activate, 
   start_thread, thaw_thread, nuke_thread, rst_thread, switch_out, 
   halt_thread, sw_cond, clk, se, si, reset,
   // jtag interface
   rtap_ifu_thrfsm_wr_en, rtap_ifu_thrfsm_wr_data
   );

   // thread specific input
   input  completion,   // the op this thread was waiting for is complete
	        schedule,     // this thread was just switched in
	        spec_ld,      // speculative switch in
	        ldhit,        // speculation was correct
	        stall,        // stall thread for ldmiss, imiss or trap
	        int_activate, // activate this thread
          halt_thread,
	        start_thread,    // wake up this thread from dead state
	        nuke_thread,
          thaw_thread,
	        rst_thread;      // reset this thread

   // common inputs
   input  switch_out,   // this thread was just switched out
	        sw_cond;	// wait until completion signal is received

   input       clk, se, si, reset;

   // jtag interface
   input rtap_ifu_thrfsm_wr_en;
   input [4:0] rtap_ifu_thrfsm_wr_data;

   output      so;

   output reg [4:0] thr_state;
   output     [4:0] thr_nstate;

   // local signals
   reg [4:0]    next_state;

   assign thr_nstate = next_state;
   
   //
   // Code Begins Here
   //


//   assign       spec_rdy     = thr_state[`TCR_READY];

   always @ (/*AUTOSENSE*/ completion
             or halt_thread or int_activate or ldhit or nuke_thread
             or rst_thread or schedule or spec_ld or stall
             or start_thread or sw_cond or switch_out or thaw_thread 
             or thr_state)
     begin
	      case (thr_state[4:0])
          `THRFSM_IDLE:  // 5'b00000
	          begin
	             if (rst_thread | thaw_thread)
		             next_state = `THRFSM_WAIT;
	             else if (start_thread)    
		             next_state = `THRFSM_RDY;
	             else  // all other interrupts ignored
		             next_state = thr_state[4:0];
	          end

	        `THRFSM_HALT:  // 5'b00010
	          begin
	             if (nuke_thread)
		             next_state = `THRFSM_IDLE;
	             else if (rst_thread | thaw_thread)
		             next_state = `THRFSM_WAIT;
	             else if (int_activate | start_thread) 
		             next_state = `THRFSM_RDY;
	             else
		             next_state = thr_state[4:0];
	          end
	        
	        `THRFSM_RDY:       // 5'b11001
	          begin
	             if (stall)     
		             // trap also kills inst_s2 and nir
		             // Ldmiss should not happen in this state
		             next_state = `THRFSM_WAIT;
	             else if (schedule)
		             next_state = `THRFSM_RUN;
	             else
		             next_state = thr_state[4:0];
	          end // case: `THRFSM_RDY

	        `THRFSM_RUN:       // 5'b00101
	          begin
	             if (stall | sw_cond)
		             // trap also kills inst_s2 and nir
		             // ldmiss should not happen in this state		 
		             next_state = `THRFSM_WAIT;
	             else if (switch_out)
	               // on an interrupt or thread stall, the fcl has to
	               // switch out the thread and inform the fsm 
		             next_state = `THRFSM_RDY;
	             else
		             next_state = thr_state[4:0];
	          end // case: `THRFSM_RUN

	        `THRFSM_WAIT:       // 5'b00001
	          begin
	             if (nuke_thread) 
		             next_state = `THRFSM_IDLE;
	             else if (halt_thread) // exclusive with above
		             next_state = `THRFSM_HALT;
	             else if (stall) // excl. with above
		             next_state = `THRFSM_WAIT;
	             else if (spec_ld) // exclusive with above
		             next_state = `THRFSM_SPEC_RDY;
	             else if (completion & ~halt_thread)
		             next_state = `THRFSM_RDY;
	             else
		             next_state = thr_state[4:0];
	          end // case: `THRFSM_WAIT
	        
	        `THRFSM_SPEC_RDY:       // 5'b10011
	          begin
	             if (stall)
		             next_state = `THRFSM_WAIT;
	             else if (schedule & ~ldhit) // exclusive
		             next_state = `THRFSM_SPEC_RUN;
	             else if (schedule & ldhit)  // exclusive
		             next_state = `THRFSM_RUN;
	             else if (ldhit)
		             next_state = `THRFSM_RDY;
	             else
		             next_state = thr_state[4:0];
	          end // case: `THRFSM_SPEC_RDY

	        `THRFSM_SPEC_RUN:       // 5'b00111
	          begin
	             if (stall | sw_cond)
		             next_state = `THRFSM_WAIT;
	             else if ((ldhit) & switch_out)
		             next_state = `THRFSM_RDY;
	             else if ((ldhit) & ~switch_out)
		             next_state = `THRFSM_RUN;
	             else if (~(ldhit) & switch_out)
		             next_state = `THRFSM_SPEC_RDY;
	             // on an interrupt or thread stall, the fcl has to
	             // switch out the thread and inform the fsm 
	             else
		             next_state = thr_state[4:0];
	          end // case: `THRFSM_SPEC_RUN

//VCS coverage off
	        default:
	          begin
               // synopsys translate_off
		     // 0in <fire -message "thrfsm.v: Error! Invalid State"
`ifdef DEFINE_0IN
`else           
	             $display("ILLEGAL_THR_STATE", "thrfsm.v: Error! Invalid State %b\n", thr_state);
                 $finish();
`endif		     
               // synopsys translate_on
	             if (rst_thread)
		             next_state = `THRFSM_WAIT;
	             else if (nuke_thread)
		             next_state = `THRFSM_IDLE;		 
	             else 
		             next_state = thr_state[4:0];
	          end
//VCS coverage on
	      endcase // casex({thr_state[4:0]})
     end // always @ (...

   // trin: modifying for thread state overwrite
   // // thread config register (tcr)
   // dffr_s #(5) tcr(.din  (next_state),
	  //            .clk  (clk),
	  //            .q    (thr_state),
	  //            .rst  (reset),
	  //            .se   (se), .so(), .si());

   // flop jtag inputs to not affect timing
   always @ (posedge clk)
   begin
      if (reset)
      begin
         thr_state <= `THRFSM_IDLE;
      end
      else
      begin
         if (rtap_ifu_thrfsm_wr_en)
            thr_state <= rtap_ifu_thrfsm_wr_data;
         else
            thr_state <= next_state;
      end
   end


endmodule
