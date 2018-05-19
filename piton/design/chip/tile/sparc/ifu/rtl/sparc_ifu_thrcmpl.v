// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ifu_thrcmpl.v
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
//  Module Name: sparc_ifu_thrcmpl
//  Description:	
//  The thread completion block processes the completion signals fomr
//  the different cpu blocks and generates a unified completion
//  signal. 
*/

module sparc_ifu_thrcmpl(/*AUTOARG*/
   // Outputs
   completion, wm_imiss, wm_other, swl_esl_icmiss_out,
   // Inputs
   clk, se, si, reset, fcl_ifq_icmiss_s1, erb_dtu_ifeterr_d1, 
   sw_cond_s, en_spec_g, atr_s, dtu_fcl_thr_active, ifq_dtu_thrrdy, 
   ifq_dtu_pred_rdy, exu_lop_done, branch_done_d, fixedop_done, 
   ldmiss, spec_ld_d, trap, retr_thr_wakeup, flush_wake_w2, 
   ldhit_thr, spec_ld_g, clear_wmo_e, wm_stbwait, stb_retry, 
   rst_thread, trap_thrrdy, thr_s2, thr_e, thr_s1, fp_thrrdy, 
   lsu_ifu_ldst_cmplt, sta_done_e, killed_inst_done_e
   );

   input     clk, se, si, reset;

   input     fcl_ifq_icmiss_s1;
   input     erb_dtu_ifeterr_d1;
   
   input     sw_cond_s;
   input     en_spec_g;
   input     atr_s;

   input [3:0] dtu_fcl_thr_active;
   input [3:0] ifq_dtu_thrrdy,         // I$ miss completion
               ifq_dtu_pred_rdy,
		           exu_lop_done,  // mul, div, wrpr, sav, rest
               branch_done_d,
		           fixedop_done;           // br, rdsr, wrs/pr, 
   input [3:0] ldmiss,
		           spec_ld_d,
		           trap,
		           retr_thr_wakeup,
		           flush_wake_w2,
		           ldhit_thr,
		           spec_ld_g;

   input       clear_wmo_e;
   input [3:0] wm_stbwait,
               stb_retry;

   input [3:0] rst_thread,
		           trap_thrrdy;

   input [3:0] thr_s2,
		           thr_e,
		           thr_s1;
   
   input [3:0] fp_thrrdy;

   input [3:0] lsu_ifu_ldst_cmplt;	   // sta local, ld and atomic done
   
   input       sta_done_e,
		           killed_inst_done_e;        // long lat op was killed
   
   // .. Other completion signals needed
   // 1. STA completion from LSU -- real mem done 10/03, local TBD
   // 2. Atomic completion  -- done
   // 3. membar completion (lsu) -- done
   // 4. flush completion (lsu)
   // 5. FP op completion (ffu)
   // 

   output [3:0] completion;
   output [3:0] wm_imiss;
   output [3:0] wm_other;
   output       swl_esl_icmiss_out;

   // local signals
   wire [3:0]   wm_imiss,
		            wm_other,
		            wmi_nxt,
		            wmo_nxt;

   wire [3:0]   clr_wmo_thr_e;
   
   wire [3:0]   ldst_thrrdy,
		            ld_thrrdy,
		            sta_thrrdy,
		            killed_thrrdy,
		            fp_thrrdy,
                pred_ifq_rdy,
                imiss_thrrdy,
		            other_thrrdy;
   //   wire [3:0] 	can_imiss;
   
   //---------------------------------------------------------------------- 
   // Code begins here
   //----------------------------------------------------------------------
   
   // Thread completion
   // Since an imiss can overlap with anything else, have to make sure
   // the imiss condition has been cleared.
   // Imiss itself has to make sure ALL OTHER conditions have been
   // cleared.  In this code, I am not checking for branches being
   // cleared, since Imiss is assumed to take much longer than a branch.
   // -- may not be a valid assumption, since milhits could be faster

//   assign  can_imiss = fcl_ifq_canthr;
                        // & (wm_imiss | ({4{fcl_ifq_icmiss_s1}} & thr_s1));
   
   dffr_s #(4) wmi_ff(.din (wmi_nxt),
		              .clk (clk),
		              .q   (wm_imiss),
		              .rst (reset),
		              .se  (se), .si(), .so());

   dffr_s #(4) wmo_ff(.din (wmo_nxt),
		              .clk (clk),
		              .q   (wm_other),
		              .rst (reset),
		              .se  (se), .si(), .so());

   assign  wmi_nxt = ({4{fcl_ifq_icmiss_s1}} & thr_s1) | // set
		                   ({4{erb_dtu_ifeterr_d1}} & thr_e) |
			                   (wm_imiss & ~imiss_thrrdy);    // reset

   // clear wm_other when we have a retracted store
   assign  clr_wmo_thr_e = {4{clear_wmo_e}} & thr_e;

   assign  wmo_nxt = (({4{sw_cond_s}} & thr_s2 & ~clr_wmo_thr_e) | 
		                  trap | ldmiss) & dtu_fcl_thr_active | 
                      rst_thread |  // set
		                  wm_other & dtu_fcl_thr_active &
		                  ~(other_thrrdy | spec_ld_d | clr_wmo_thr_e); // reset

   // A load hit signal is always for the load which is being filled
   // to the RF.  If speculation is enabled, the load would have
   // completed even before the hit signal.  So need to suppress the
   // completions signal.

   // load miss, st buf hit, ld/st alternate completion
   assign ldst_thrrdy = lsu_ifu_ldst_cmplt & ~spec_ld_g;   
   assign ld_thrrdy = ldhit_thr & {4{~en_spec_g}};
   assign sta_thrrdy = thr_e & {4{sta_done_e}};
   assign killed_thrrdy = thr_e & {4{killed_inst_done_e}};

   // everthing else
   assign other_thrrdy = (ldst_thrrdy     |     // ld, sta local, atomic
                          branch_done_d   |     // br
	                        ld_thrrdy       |     // load hit without spec
	                        exu_lop_done    |     // mul, div, win mgmt
	                        fixedop_done    |     // rdsr, wrspr
	                        killed_thrrdy   |     // ll op was anulled
    	                    retr_thr_wakeup |     // retract cond compl
	                        flush_wake_w2   |     // wake up after ecc 
	                        fp_thrrdy       |     // fp completion
	                        sta_thrrdy      |     // sta to real memory
                	        trap_thrrdy);         // trap

   // Imiss predicted ready
   assign pred_ifq_rdy = ifq_dtu_pred_rdy & {4{~atr_s}} & dtu_fcl_thr_active;
   assign imiss_thrrdy = pred_ifq_rdy | ifq_dtu_thrrdy;

   assign swl_esl_icmiss_out = (wm_imiss[0] & ~imiss_thrrdy[0]) | wmi_nxt[0];
   
//   assign completion = imiss_thrrdy & (~(wm_other | wm_stbwait) |
//					                               other_thrrdy) |       //see C1
//		                   other_thrrdy & (~(wm_imiss | wmi_nxt));

//   assign completion = (imiss_thrrdy & ~(wm_other | wm_stbwait) |
//		                    other_thrrdy & ~(wm_stbwait | wm_imiss) |
//                        stb_retry & ~(wm_other | wm_imiss) |
//                        imiss_thrrdy & other_thrrdy & ~wm_stbwait |
//                        imiss_thrrdy & stb_retry & ~wm_other |
//                        stb_retry & other_thrrdy & ~wm_imiss);

   assign completion = ((imiss_thrrdy | ~wm_imiss) &
                        (other_thrrdy | ~wm_other) &
                        (stb_retry | ~wm_stbwait) &
                        (wm_imiss | wm_other | wm_stbwait));

   // C1: should we do ~(wm_other | wmo_nxt)??
   // When an imiss is pending, we cannot be doing another fetch, so I
   // don't think so.  It seems nice and symmetric to put it in
   // though, unfortunately this results in a timing problem on swc_s 
   // and trap
   
endmodule // sparc_ifu_thrcmpl
