// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ifu_milfsm.v
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
//  Module Name: sparc_ifu_ifqdp
//  Description:	
//  The IFQ is the icache fill queue.  This communicates between the
//  IFU and the outside world.  It handles icache misses and
//  invalidate requests from the crossbar.  
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////

`include "ifu.tmp.h"

//`define MILFSM_NULL   4'b0000
//`define MILFSM_WAIT   4'b1000
//`define MILFSM_REQ    4'b1100
//`define MILFSM_FILL0  4'b1001
//`define MILFSM_FILL1  4'b1011

//`define MIL_V  3
//`define MIL_R  2
//`define MIL_A  1
//`define MIL_F  0


module sparc_ifu_milfsm(/*AUTOARG*/
   // Outputs
   so, fsm_ifc_errreq, fsm_ifc_wrt_tir, fsm_ifc_comp_valid, 
   fsm_ifc_mil_valid, fsm_ifc_mil_cancel, fsm_ifc_thr_ready, 
   fsm_ifc_pred_rdy, fsm_ifc_pcxreq, fsm_ifc_addrbit4_i2, 
   fsm_ifc_milchld, fsm_ifc_milstate, 
   // Inputs
   ifc_fsm_can_thisthr, ifc_fsm_fill_thisthr_i2, 
   ifc_fsm_wr_complete_f, ifqadv_i2, ifd_ifc_4bpkt_i2, 
   fcl_ifq_thr_s1, ifc_fsm_imiss_thisthr_s, ifc_fsm_milhit_s, 
   ifc_fsm_hiton_thismil_s, ifc_fsm_pcxaccept_thisthr, 
   ifc_fsm_miladdr4, clk, se, si, reset, ifc_fsm_err_thisthr
   );

   input       ifc_fsm_can_thisthr,        
	             ifc_fsm_fill_thisthr_i2;
   
   input       ifc_fsm_wr_complete_f;

   input       ifqadv_i2;

   input       ifd_ifc_4bpkt_i2;
   input [1:0] fcl_ifq_thr_s1;             
   input       ifc_fsm_imiss_thisthr_s;
   input       ifc_fsm_milhit_s;
	 input       ifc_fsm_hiton_thismil_s,
               ifc_fsm_pcxaccept_thisthr;
   input       ifc_fsm_miladdr4;

   input       clk, 
               se, 
               si, 
               reset;

   input       ifc_fsm_err_thisthr;
   

   output      so;

   output      fsm_ifc_errreq;
   output      fsm_ifc_wrt_tir;

   output      fsm_ifc_comp_valid,
	             fsm_ifc_mil_valid,
               fsm_ifc_mil_cancel,
	             fsm_ifc_thr_ready;
   output      fsm_ifc_pred_rdy,
	             fsm_ifc_pcxreq,
	             fsm_ifc_addrbit4_i2;
	 
   output [2:0] fsm_ifc_milchld;

   output [3:0] fsm_ifc_milstate;
	 

//----------------------------------------------------------------------
// Declarations
//----------------------------------------------------------------------


   // local variables
   reg [3:0] 	next_state;

   wire [3:0] 	milstate;

   wire [2:0]   local_milchld;
   
   wire 	milchld_valid;

   wire   fill_this16b;
   

   wire 	cancel_mil,
		      cancel_next;
   wire 	err_pending,
		      err_pending_next;
   
   wire 	valid_d1,
		valid_i2;
   
   wire [2:0] 	next_milchld;


   // Missed Instruction List State Machine
   // 3   - valid
   // 2   - req
   // 1   - addr for fill fill (1/0)
   // 0   - fill
   //
   // 2   - child valid
   // 1:0 - child thr ptr
   //


   always @(/*AUTOSENSE*/err_pending or ifc_fsm_err_thisthr
            or ifc_fsm_fill_thisthr_i2 or ifc_fsm_imiss_thisthr_s
            or ifc_fsm_milhit_s or ifc_fsm_pcxaccept_thisthr
            or ifc_fsm_wr_complete_f or ifd_ifc_4bpkt_i2 or ifqadv_i2
            or milstate)
     begin
	      case (milstate)  //  synopsys parallel_case
	        4'b0000: // null
	          begin
	             //ic_wrreq_i2 = 1'b0;	       
	             //  orphan_chld = 1'b0;
               next_state[1:0] = 2'b0;
               if (ifc_fsm_err_thisthr | ifc_fsm_imiss_thisthr_s)
		             begin
		                next_state[`MIL_V] = 1'b1;
		                if (ifc_fsm_milhit_s & ~ifc_fsm_err_thisthr) 
		                  next_state[`MIL_R] = 1'b0;  // MILFSM_WAIT
		                else
		                  next_state[`MIL_R] = 1'b1;  // MILFSM_REQ;
		             end
	             else
		             next_state = milstate;
	          end // case: begin...
	        
	        4'b1100:  // req
	          begin
	             // ic_wrreq_i2 = 1'b0;		
	             // if canthr=1, the request will not be sent out in this cycle.
               if ((ifc_fsm_pcxaccept_thisthr) &
                   ~(ifc_fsm_err_thisthr | err_pending))
                 // two requests are made when there is an error.
                 // one, with errbit=1 gets back in invalidate response, 
                 // the other, with errbit=0, gets the regular ifill 
                 // return
		             begin
		                // we invalidate the icache on detecting an error
		                // only if this wasn't an MIL hit as well.  If it
		                // was an MIL we would have gone to the wait state
		                // already and it is too late to invalidate the cache
		                next_state = `MILFSM_WAIT;
                    //		    orphan_chld = 1'b0;		    
		             end
//	             else if ((cancel_mil | ifc_fsm_can_thisthr) & 
//                        ~milchld_valid & ~ifc_fsm_hiton_thismil_s)
//		             begin
//		                next_state = `MILFSM_NULL;
//		             end
	             else
		             begin
		                next_state = milstate;
                    //		    orphan_chld = 1'b0;
		             end 
	          end // case: 4'b1100
          
	        4'b1000: // wait
	          begin
               //	       orphan_chld = 1'b0;
	             if (ifc_fsm_fill_thisthr_i2)
		             begin
		                // ic_wrreq_i2 = 1'b1;
                    if (ifd_ifc_4bpkt_i2 & ifqadv_i2) // 4B ifill from IOB
                      // don't want to advance too quickly and get fasle compl
                      next_state = `MILFSM_NULL;
                    else if (~ifd_ifc_4bpkt_i2)
		                  next_state = `MILFSM_FILL0;
                    else
                      next_state = milstate;
		             end
	             else
		             begin
		                next_state = milstate;
		                //ic_wrreq_i2 = 1'b0;		    
		             end
	          end // case: 4'b1000
	        
	        4'b1001: // fill0
	          begin
               //	       orphan_chld = 1'b0;
               if (ifc_fsm_wr_complete_f)
		             begin
		                next_state = `MILFSM_FILL1;
		                //ic_wrreq_i2 = 1'b1;
		             end
	             else
		             begin
		                next_state = milstate;
		                //ic_wrreq_i2 = 1'b1;
		             end
	          end // case: 4'b1001
          
	        4'b1011: // fill1
	          // Do we really need this state??  yes, to start thr
	          begin
               //	       orphan_chld = 1'b0;		    
	             if (ifc_fsm_wr_complete_f)
		             begin
		                //ic_wrreq_i2 = 1'b0; 		    
                    //		    if (delay_mil | ifc_fsm_imiss_thisthr_s)
                    //		      next_state = `MILFSM_REQ;
                    //		    else
		                next_state = `MILFSM_NULL;
		             end
	             else
		             begin
		                //ic_wrreq_i2 = 1'b1;
		                next_state = milstate;
		             end // else: !if(ifc_fsm_wr_complete_f)
	          end // case: 4'b10001
          
	        default:
	          begin
               // synopsys translate_off
		     // 0in <fire -message "MILSTATE, Error: SPARC/IFU/MILFSM: unknown state!"
`ifdef DEFINE_0IN
`else
               if ($time > (4* `CMP_CLK_PERIOD))
                 begin
					$display ("MILSTATE", 
                            "Error: SPARC/IFU/MILFSM: unknown state! %b\n",milstate);
                    $finish();
                 end
`endif
               // synopsys translate_on               
	             next_state = milstate;
	             //ic_wrreq_i2 = 1'b0;		    
               //	       orphan_chld = 1'b0;	
	          end // case: default
	      endcase // casex(milstate)
     end // always @ (...
   

   // MIL state reg
   dffr_s #(4) milst_reg(.din  (next_state[3:0]),
		                   .q    (milstate[3:0]),
		                   .clk  (clk),
		                   .rst  (reset),
		                   .se   (se), .si(), .so());

   // Cancel - Delay state machine
   // -- not used anymore
   // C D
   // 0 0  - null
   // 1 0  - current thread cancelled but pending from L2
   // 1 1  - one ifill pending from L2, current thread will be sent
   //        out after that.
   
//   assign cancel_next = (ifc_fsm_can_thisthr | 
//			                   cancel_mil) & next_state[`MIL_V];    // reset wins

   assign cancel_next = (ifc_fsm_can_thisthr | cancel_mil) & 
                          (milstate[`MIL_V] | ifc_fsm_imiss_thisthr_s |
                           ifc_fsm_err_thisthr);    // reset wins

   dffr_s #(1) can_ff(.din  (cancel_next),
		                .q    (cancel_mil),
		                .clk  (clk),
		                .rst  (reset),
		                .se   (se), .si(), .so());

   // track if we need to send out an error request
   assign err_pending_next = (ifc_fsm_err_thisthr & 
	                      (milstate[`MIL_R] | ~milstate[`MIL_V]) |
//	                      err_pending & next_state[`MIL_V]) &	
                        err_pending & milstate[`MIL_V]) &
	                      ~ifc_fsm_pcxaccept_thisthr;
                         // & ~ifc_fsm_can_thisthr;
   
   dffr_s #(1) err_ff(.din (err_pending_next),
		                .q   (err_pending),
		                .clk (clk),
		                .rst (reset), .se(se), .si(), .so());
   assign fsm_ifc_errreq = err_pending;

   // Track secondary hits
   assign next_milchld[2] = ifc_fsm_hiton_thismil_s |    // hit on MIL by
   	                                                     // someone else
              			    fsm_ifc_milchld[2] & milstate[`MIL_V]; // reset

   assign next_milchld[1:0] = ifc_fsm_hiton_thismil_s ? fcl_ifq_thr_s1 :
			                                                  fsm_ifc_milchld[1:0];

   dffr_s #(3) milchld_reg(.din  (next_milchld),
		                     .clk  (clk),
		                     .rst  (reset),
		                     .q    (local_milchld),
		                     .se   (se), .si(), .so());

   assign fsm_ifc_milchld[2] = local_milchld[2] & milstate[`MIL_V];
   assign fsm_ifc_milchld[1:0] = local_milchld[1:0];
   
   assign milchld_valid = local_milchld[2] & milstate[`MIL_V];

//   assign fsm_ifc_addrbit4_i2 = milstate[`MIL_F];
   assign fsm_ifc_addrbit4_i2 = milstate[`MIL_F] & milstate[`MIL_V] & 
                                (milstate[`MIL_A] | ifc_fsm_wr_complete_f); 

   // determine if we want to fill from the first pkt or second pkt
   assign fill_this16b = ~(milstate[`MIL_F] ^ ifc_fsm_miladdr4) |
                            ifd_ifc_4bpkt_i2;

   // write to thread inst reg (TIR)
//   assign fsm_ifc_wrt_tir =  (next_state[`MIL_F]) & ~cancel_mil & 
//	                     ifc_fsm_fill_thisthr_i2;
   assign fsm_ifc_wrt_tir =  (milstate[`MIL_V] & ~milstate[`MIL_R]) & 
			                         ~(cancel_mil | ifc_fsm_can_thisthr) & 
                               ifc_fsm_fill_thisthr_i2 &
                               fill_this16b;
	  
   // write to Icache 
//   assign fsm_ifc_wrreq_i2 = ic_wrreq_i2;
   assign valid_i2 = milstate[`MIL_V] & ~fsm_ifc_thr_ready;
   
   dff_s vld_ff(.din (valid_i2),
	            .q   (valid_d1),
	            .clk (clk),
	            .se  (se), .si(), .so());

   // signal thread completion
   assign fsm_ifc_thr_ready = milstate[`MIL_V] & milstate[`MIL_F] &
	                      milstate[`MIL_A] & ifc_fsm_wr_complete_f |
	                      ~milstate[`MIL_V] & valid_d1;

   // predict ready assuming 2nd ifill happens in the next cycle
   assign fsm_ifc_pred_rdy =  milstate[`MIL_V] & milstate[`MIL_F] &
                              (ifc_fsm_wr_complete_f |
                               milstate[`MIL_A]); //  & ifc_fsm_fill_thisthr_i2
   
   // set compare valid for mil hit signal
   assign fsm_ifc_comp_valid = milstate[`MIL_V] &     // valid entry
	                             ~milstate[`MIL_F] &    // not f0 or f1
                               ~milchld_valid;        // no chld already

   assign fsm_ifc_mil_valid = milstate[`MIL_V];
   assign fsm_ifc_mil_cancel = cancel_mil;
   
   // In the request state or if we need to send an error invalidate, 
   // ask for bus from LSU. 
//   assign fsm_ifc_pcxreq = (milstate[`MIL_V] & milstate[`MIL_R] |
//			    err_pending | ifc_fsm_err_thisthr) & 
//	                   ~ifc_fsm_pcxaccept_thisthr & 
//                            (milchld_valid | ~cancel_mil);

//   assign fsm_ifc_pcxreq = (milstate[`MIL_V] & milstate[`MIL_R] & 
//	                          ~ifc_fsm_pcxaccept_thisthr & 
//                            (milchld_valid | ~cancel_mil));

   // removed pcx_accept from critical path
   assign fsm_ifc_pcxreq = milstate[`MIL_V] & milstate[`MIL_R];

   assign fsm_ifc_milstate = milstate;

   
endmodule
