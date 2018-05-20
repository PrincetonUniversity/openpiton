// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ifu_swl.v
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
//  Module Name: sparc_ifu_swl
//  Description:	
//  The switch logic manages the 4 threads.  It schedules the next
//  thread to be executed.   
*/
////////////////////////////////////////////////////////////////////////

`include "ifu.tmp.h"

module sparc_ifu_swl(/*AUTOARG*/
   // Outputs
   swl_sscan_thrstate, so, dtu_reset, swl_dec_mulbusy_e, 
   swl_dec_divbusy_e, swl_dec_fpbusy_e, swl_dec_fp_enable_d, 
   swl_dec_ibe_e, dtu_fcl_ntr_s, dtu_fcl_running_s, 
   dtu_fcl_rollback_g, dtu_fcl_retract_d, dtu_fcl_thr_active, 
   dtu_fcl_nextthr_bf, swl_dcl_thr_d, swl_dcl_thr_w2, 
   esl_fcl_stall_bf, esl_fcl_switch_bf, esl_fdp_sync_pcs_bf,
   esl_fcl_ntr_s, esl_fdp_issue_prev_inst_s, esl_fcl_force_running_s,
   dtu_fdp_thrconf_e, 
   // Inputs
   rclk, se, si, gdbginit_l, arst_l, grst_l, ctu_sscan_tid, 
   ifq_dtu_thrrdy, ifq_dtu_pred_rdy, ifu_tlu_inst_vld_w, 
   ifu_tlu_ttype_vld_m, fcl_dtu_hprivmode_d, fcl_dtu_hprivmode_w2, 
   tlu_ifu_flush_pipe_w, fcl_swl_flush_w, fcl_dtu_sync_intr_d, 
   fcl_dtu_nuke_thr_w, fcl_dtu_rst_thr_w, fcl_dtu_resum_thr_w, 
   fcl_dtu_thr_f, tlu_hpstate_ibe, lsu_ifu_ldsta_internal_e, 
   tlu_ifu_trappc_vld_w1, dec_swl_ll_done_d, dec_swl_br_done_d, 
   dec_swl_rdsr_sel_thr_d, dec_swl_std_inst_d, dec_swl_sta_inst_e, 
   wsr_fixed_inst_w, dec_swl_ld_inst_d, dec_swl_mul_inst_d, 
   dec_swl_div_inst_d, dec_swl_fpop_d, dec_swl_allfp_d, 
   dec_swl_frf_upper_d, dec_swl_frf_lower_d, dec_swl_wrtfprs_w, 
   dcl_swl_tcc_done_m, exu_ifu_longop_done_g, exu_ifu_spill_e, 
   lsu_ifu_ldst_cmplt, lsu_ifu_dc_parity_error_w2, lsu_ifu_stbcnt0, 
   lsu_ifu_stbcnt1, lsu_ifu_stbcnt2, lsu_ifu_stbcnt3, 
   lsu_ifu_quad_asi_e, ffu_ifu_fpop_done_w2, ffu_ifu_tid_w2, 
   ffu_ifu_fst_ce_w, tlu_ifu_trap_tid_w1, tlu_ifu_pstate_pef, 
   lsu_ifu_ldst_miss_g, fcl_swl_int_activate_i3, 
   fcl_swl_flush_wake_w, ifq_swl_stallreq, fcl_dtu_stall_bf, 
   fcl_swl_swout_f, fcl_swl_swcvld_s, fdp_fcl_swc_s2, 
   fcl_ifq_icmiss_s1, fcl_dtu_inst_vld_e, fcl_dtu_intr_vld_e, 
   fcl_dtu_inst_vld_d, erb_dtu_ifeterr_d1, dtu_inst_anull_e, 
   const_cpuid, thr_config_in_m, dec_swl_wrt_tcr_w, 
   dec_swl_st_inst_d, extra_longlat_compl, config_dtu_esl_en, 
   config_dtu_esl_sync_method, config_esl_lfsr_seed, 
   config_esl_lfsr_ld, config_esl_pc_diff_thresh, config_esl_counter_timeout, 
   fdp_esl_t0inst_next_s2, 
`ifndef CONFIG_NUM_THREADS
   fdp_esl_t1inst_next_s2, 
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
   fdp_esl_t1inst_next_s2, 
`elsif THREADS_3
   fdp_esl_t1inst_next_s2, 
   fdp_esl_t2inst_next_s2, 
`else
   fdp_esl_t1inst_next_s2, 
   fdp_esl_t2inst_next_s2, 
   fdp_esl_t3inst_next_s2, 
`endif
`endif
   fdp_esl_t0inst_paddr_next_s2,
`ifndef CONFIG_NUM_THREADS
   fdp_esl_t1inst_paddr_next_s2, 
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
   fdp_esl_t1inst_paddr_next_s2, 
`elsif THREADS_3
   fdp_esl_t1inst_paddr_next_s2, 
   fdp_esl_t2inst_paddr_next_s2,
`else
   fdp_esl_t1inst_paddr_next_s2, 
   fdp_esl_t2inst_paddr_next_s2,
   fdp_esl_t3inst_paddr_next_s2, 
`endif
`endif
   fdp_esl_t0pc_next_s2, 
`ifndef CONFIG_NUM_THREADS
   fdp_esl_t1pc_next_s2,
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
   fdp_esl_t1pc_next_s2,
`elsif THREADS_3
   fdp_esl_t1pc_next_s2,
   fdp_esl_t2pc_next_s2, 
`else
   fdp_esl_t1pc_next_s2,
   fdp_esl_t2pc_next_s2, 
   fdp_esl_t3pc_next_s2, 
`endif
`endif
   fcl_esl_tinst_vld_next_s,
   fcl_esl_brtaken_e, fcl_esl_brtaken_m, fcl_esl_thr_e, fcl_esl_thr_m,
   fcl_esl_inst_vld_d, fcl_esl_inst_vld_e, fcl_esl_inst_vld_m, fcl_esl_thr_trap_bf,
   fcl_esl_rb_stg_s, dcl_esl_br_inst_d, dcl_esl_br_inst_e, fdp_esl_brtrp_target_pc_bf_f,

   // trin
   // core_rtap_data,
   rtap_core_val,
   rtap_core_threadid,
   rtap_core_id,
   rtap_core_data

   );

   input       rclk, 
               se, 
               si,
               gdbginit_l,
               arst_l,
               grst_l;

   input [3:0] ctu_sscan_tid;   // guaranteed one-hot by ctu

   input [3:0] ifq_dtu_thrrdy;	      // ifq completion signals
   input [3:0] ifq_dtu_pred_rdy;	    // ifq almost done

   input       ifu_tlu_inst_vld_w,    //
	             ifu_tlu_ttype_vld_m;
   input       fcl_dtu_hprivmode_d;
   input       fcl_dtu_hprivmode_w2;
   input       tlu_ifu_flush_pipe_w;  // flush after a trap
   input       fcl_swl_flush_w;
   input       fcl_dtu_sync_intr_d;   // interrupt
   input       fcl_dtu_nuke_thr_w;    // sync suspend
   input       fcl_dtu_rst_thr_w;    // 
   input       fcl_dtu_resum_thr_w;    // 
   input [3:0] fcl_dtu_thr_f;

   input [3:0] tlu_hpstate_ibe;
   
   input       lsu_ifu_ldsta_internal_e,// sta to local reg
	             tlu_ifu_trappc_vld_w1, // trap completion
	             dec_swl_ll_done_d,   // rdsr completion
               dec_swl_br_done_d,
	             dec_swl_rdsr_sel_thr_d,
	             dec_swl_std_inst_d,    //
	             dec_swl_sta_inst_e,    // state change
	             wsr_fixed_inst_w,      // wrspr completion
	             dec_swl_ld_inst_d;     // load hit/compl. speculation

   input       dec_swl_mul_inst_d,
	             dec_swl_div_inst_d;
   input       dec_swl_fpop_d,
	             dec_swl_allfp_d;

   input       dec_swl_frf_upper_d,
	             dec_swl_frf_lower_d,
	             dec_swl_wrtfprs_w;
   
   input       dcl_swl_tcc_done_m;

   input [3:0] exu_ifu_longop_done_g; // save, restore, div, mul compl.
   input       exu_ifu_spill_e;
   input [3:0] lsu_ifu_ldst_cmplt;
   input       lsu_ifu_dc_parity_error_w2;

   input [3:0] lsu_ifu_stbcnt0,
	             lsu_ifu_stbcnt1,
	             lsu_ifu_stbcnt2,
	             lsu_ifu_stbcnt3;

//   input [3:0] lsu_ifu_stq_busy;
   input       lsu_ifu_quad_asi_e;
	 
   input       ffu_ifu_fpop_done_w2;
   input [1:0] ffu_ifu_tid_w2;
   input       ffu_ifu_fst_ce_w;
   
   input [1:0] tlu_ifu_trap_tid_w1;

   input [3:0] tlu_ifu_pstate_pef;

   input       lsu_ifu_ldst_miss_g;   // dcache hit or miss
   
   input [3:0] fcl_swl_int_activate_i3; // wake up thread on interrupt
   input       fcl_swl_flush_wake_w;

   // TBD: with the latest changes fcl_dtu_switch_s = dtu_fcl_ntr_s, so 
   // this input can be removed.
//   input       fcl_dtu_switch_s; // switch out curr, sw in next

   input       ifq_swl_stallreq;

   input       fcl_dtu_stall_bf,
               fcl_swl_swout_f,       // curr thread is stalled
	             fcl_swl_swcvld_s,
               fdp_fcl_swc_s2,        // thread stall condition
	             fcl_ifq_icmiss_s1;     // icache miss
   input       fcl_dtu_inst_vld_e,
               fcl_dtu_intr_vld_e,
	             fcl_dtu_inst_vld_d;

   input       erb_dtu_ifeterr_d1;

   input       dtu_inst_anull_e;      // anull delay slot

   input [3:0] const_cpuid;           // use 4 bits to allow future
                                      // expansion to 16 cores

   input [2:0] thr_config_in_m;       // write data to thread status reg
   input       dec_swl_wrt_tcr_w;     // write signal for thr status reg
   input       dec_swl_st_inst_d;

   input [3:0] extra_longlat_compl;   // spare signal, not used
  
   input       config_dtu_esl_en;       // Configuration for ESL - Enable signal
   input [1:0] config_dtu_esl_sync_method; // Configuration for ESL - Synchronization method

   input [15:0] config_esl_lfsr_seed;   // Configuration for ESL - LFSR seed
   input        config_esl_lfsr_ld;      // Configuration for ESL - LFSR load seed
 
   input [49:0] config_esl_pc_diff_thresh; // Configuration for ESL - STSM PC diff threshold
   input [15:0] config_esl_counter_timeout; // Configuration for ESL - STSM timeout
  
   input [32:0] fdp_esl_t0inst_next_s2;
`ifndef CONFIG_NUM_THREADS
   input [32:0] fdp_esl_t1inst_next_s2;
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
   input [32:0] fdp_esl_t1inst_next_s2;
`elsif THREADS_3
   input [32:0] fdp_esl_t1inst_next_s2;
   input [32:0] fdp_esl_t2inst_next_s2;
`else
   input [32:0] fdp_esl_t1inst_next_s2;
   input [32:0] fdp_esl_t2inst_next_s2;
   input [32:0] fdp_esl_t3inst_next_s2;
`endif
`endif

   input [39:2] fdp_esl_t0inst_paddr_next_s2;
`ifndef CONFIG_NUM_THREADS
   input [39:2] fdp_esl_t1inst_paddr_next_s2;
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
   input [39:2] fdp_esl_t1inst_paddr_next_s2;
`elsif THREADS_3
   input [39:2] fdp_esl_t1inst_paddr_next_s2;
   input [39:2] fdp_esl_t2inst_paddr_next_s2;
`else
   input [39:2] fdp_esl_t1inst_paddr_next_s2;
   input [39:2] fdp_esl_t2inst_paddr_next_s2;
   input [39:2] fdp_esl_t3inst_paddr_next_s2;
`endif
`endif

   input [48:0] fdp_esl_t0pc_next_s2;
`ifndef CONFIG_NUM_THREADS
   input [48:0] fdp_esl_t1pc_next_s2;
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
   input [48:0] fdp_esl_t1pc_next_s2;
`elsif THREADS_3
   input [48:0] fdp_esl_t1pc_next_s2;
   input [48:0] fdp_esl_t2pc_next_s2;
`else
   input [48:0] fdp_esl_t1pc_next_s2;
   input [48:0] fdp_esl_t2pc_next_s2;
   input [48:0] fdp_esl_t3pc_next_s2;
`endif
`endif
   
   input [3:0]  fcl_esl_tinst_vld_next_s;
   input        fcl_esl_brtaken_e;
   input        fcl_esl_brtaken_m;
   input [3:0]  fcl_esl_thr_e;
   input [3:0]  fcl_esl_thr_m;
   input        fcl_esl_inst_vld_d;
   input        fcl_esl_inst_vld_e;
   input        fcl_esl_inst_vld_m;
   input [3:0]  fcl_esl_thr_trap_bf;
   input        fcl_esl_rb_stg_s;

   input        dcl_esl_br_inst_d;
   input        dcl_esl_br_inst_e;

   input [3:0]  fdp_esl_brtrp_target_pc_bf_f;

   // jtag interface
   // output wire [`CORE_JTAG_BUS_WIDTH-1:0] core_rtap_data;
   input wire rtap_core_val;
   input wire [1:0] rtap_core_threadid;
   input wire [`JTAG_CORE_ID_WIDTH-1:0]  rtap_core_id;
   input wire [`CORE_JTAG_BUS_WIDTH-1:0] rtap_core_data;

   output [10:0] swl_sscan_thrstate;
   output        so;
   
   output      dtu_reset;

   output      swl_dec_mulbusy_e,
	             swl_dec_divbusy_e,
	             swl_dec_fpbusy_e,
	             swl_dec_fp_enable_d;

   output      swl_dec_ibe_e;
   
   // to fcl
   output      dtu_fcl_ntr_s,         // next thread ready
               dtu_fcl_running_s,
	             dtu_fcl_rollback_g,    // rollback on spec
	             dtu_fcl_retract_d;     // rollback on hw hazard

   output [3:0] dtu_fcl_thr_active;   // currently active threads
   
   output [3:0] dtu_fcl_nextthr_bf,   // thread to switch to when ntr=1
		            swl_dcl_thr_d,
		            swl_dcl_thr_w2;

   output       esl_fcl_stall_bf;
   output       esl_fcl_switch_bf;
   output       esl_fdp_sync_pcs_bf;

   output       esl_fcl_ntr_s;
   output       esl_fdp_issue_prev_inst_s;
   output       esl_fcl_force_running_s;

   // to fdp
   output [40:0] dtu_fdp_thrconf_e;   // thread conf for RDSR inst

//----------------------------------------------------------
// Declarations
//----------------------------------------------------------
   // local signals
//   wire [3:0]    count_nxt,
//	               count;
//   wire          proc0;
//   wire          start_on_rst;

   wire [3:0]    lru_fcl_nextthr_bf;   // thread to switch to when ntr=1 from lru
   wire [3:0]    esl_fcl_nextthr_bf;   // thread to switch to when ntr=1 from esl

   wire          esl_fdp_issue_prev_inst_next_s;

   wire [3:0]    swl_esl_thr_urdy;      // Input to ESL for which threads are ready
   wire [3:0]    swl_esl_thr_sprdy;

   wire          swl_esl_icmiss_out;

   wire          ibe_d,
                 ibe_e;

   wire [3:0]    completion,
		             wm_imiss,
		             wm_other,
		             spec_ld_d,
		             issue_spec_ld,
		             ldmiss,
		             ldhit_thr,
		             spec_ld_g,
		             imiss,
		             trap,
                 ldmiss_non_crit,
                 ldmiss_crit,
		             trp_no_retr,
//		             rb_thr_w,
                 rt_st_thr_d,
                 rt_st_thr_e,
		             schedule,
		             int_activate,
		             start_thread,
                 thaw_thread,
		             resum_thread,
		             nuke_thread,
		             rst_thread;

   wire          rollback_g,
                 rb_en_g,
                 rollback_g_l,
                 rollback_w2;
   

   wire          sched_nt;
   
   wire [3:0]    fixedop_done,
		             wsr_done_w3;

   wire          wsr_inst_w2,
                 wsr_inst_w3;
   
   wire          wsr_fixed_qual_w,
                 wsr_fixed_w2;

   wire          llinst_done_e;
   
   wire [3:0]    ll_done_e,
                 branch_done_d,
                 std_tcc_done_m;

   wire          sta_done_e,
		             killed_inst_done_e;
   wire [3:0]    killed_uniop_done_e;

   wire          uniop_d,
		             uniop_e;

//   wire          no_iftrap_m,
//                 no_iftrap_w;

   wire [3:0]    thr_s1,
                 thr_s2,
		             thr_f,
		             thr_d,
		             thr_e,
		             thr_m,
		             thr_w,
                 st_thr_w2,
		             st_thr_w3;

   wire          flush_pipe_w_nxt,
                 flush_all_w,
                 flush_pipe_w2,
                 flush_done_w,
                 fp_flush_done_w2,
                 fp_flush_done_w3,
		             flush_done_w2;

   wire          rbfor_fst_ce_w;
   
   wire [3:0]    flush_wake_w2,
                 fp_flush_wake_w3,
                 halt_thread;
   
   wire          wrt_spec_w,
                 wrt_spec_w2,
                 halt_w,
                 halt_w2,
		             en_spec_d,
		             en_spec_m,
		             en_spec_g,
		             spec_next;
   

   wire          ld_inst_e,
		             ld_inst_next_e,
                 ld_inst_qual_d,
		             ld_inst_m,
		             ld_inst_unq_w,
		             ld_inst_w,
                 ld_inst_w2;
	 
   wire          switch_out,
	               sw_cond_s,
	               swc_d,
	               swc_next_d,
	               swc_e;

   wire          trp_noretr_d;
   
   wire [3:0]    all_stall;

   wire [3:0]    rdy,
	               sprdy_or_urdy,
                   sprdy_or_urdy_next;

   wire          running_s2,
                 atr_s;

   wire [4:0]    thr0_state,
		             thr1_state,
		             thr2_state,
		             thr3_state;

  wire [4:0]    thr0_nstate,
                thr1_nstate,
                thr2_nstate,
                thr3_nstate;

   wire          use_spec;

   wire [3:0]    wrt_tcr_w2;

   wire [1:0]    enc_thr_d;

   wire          rd_thract_d,
		             rd_thract_e;
   wire [51:0]   fmt_thrconf_e,
                 thrconf_out_e,
                 fmt_thrconf_adj;

   wire          hprivmode_e,
                 rdsr_sel_thr_e;
   
   wire [2:0]    rd_tid_spec_e;

   wire [3:0]    mul_busy_d,
		             mul_busy_e,
		             div_busy_d,
		             div_busy_e,
		             fp_busy_d,
		             fp_busy_e;

   wire          true_fpbusy_e,
                 fpbusy_local_e,
                 true_mulbusy_e,
                 true_divbusy_e;

   wire          fbusy_nxt_d,
                 fbusy_crit_e,
                 fbusy_d3,
                 fbusy_d0,
                 fbusy_d1,
                 fbusy_d2,
                 dbusy_d3,
                 dbusy_d0,
                 dbusy_d1,
                 dbusy_d2,
                 mbusy_d3,
                 mbusy_d0,
                 mbusy_d1,
                 mbusy_d2;

   wire [3:0]    mul_wait,
		             mul_wait_nxt,
		             div_wait,
		             div_wait_nxt,
		             fp_wait,
		             fp_wait_nxt;

   wire          mul_wait_any,
		             div_wait_any,
		             fp_wait_any;

   wire [3:0]    mul_wake,
		             div_wake,
		             fp_wake;

   wire [3:0]    exu_lop_done,
		             mul_done,
		             div_done,
		             fp_done;

   wire [3:0]    retr_thr_wakeup;
   wire [3:0]    trap_thrrdy,
		             trap_thr;

   wire [3:0]    fp_thr,
		             fp_thrrdy;

   wire          same_thr_de,
		             same_thr_dg,
                 same_thr_fd,
                 same_thr_fe,
		             same_thr_fm,                 
		             same_thr_fg;


   wire          st_thisthr_e;
   
   wire          st_inst_e,
		             st_inst_qual_d,
		             st_inst_qual_e,
 		             st_inst_m,
 		             st_inst_g;
   
   wire          pipe_st_cnt_ge1,
 		             pipe_st_cnt_ge2,
 		             pipe_st_cnt_ge3;
   
   wire          pipe_st_d,
                 pipe_st_e,
 		             pipe_st_m,
 		             pipe_st_g;

   wire          all_dst_ge1,
 		             all_dst_ge2,
 		             all_dst_ge3,
 		             all_dst_eq4;

   wire          dst_cnt_ge1,
 		             dst_cnt_ge2,
 		             dst_cnt_ge3;
   
   
   wire [3:0]    stbcnt_s,
		             stbcnt_d;

   wire [3:0]    stb_stall,
		             stb_blocked,
		             stb_blocked_d1,
		             st_in_pipe,
		             stb_retry,
		             wm_stbwait,
		             stb_wait_nxt;
   
   wire          switch_store_d,
//		             retract_stall_d,
		             retract_store_e,
                 retract_st_next_d,
		             retract_store_d;

   wire          retract_iferr_d,
                 iferr_s,
                 iferr_d;

   wire          clear_wmo_e;

   wire          sw_st_e,
		             sw_st_m,
		             sw_st_g,
		             sw_st_w2;

   wire          std_inst_e;
//		             stq_inst_e,
//		             stq_inst_m,
//		             stq_inst_w,
//		             stq_inst_w2;
   wire          std_done_e;
   wire          std_done_m;
//   wire [3:0]    stq_busy,
//		             stq_in_pipe,
//		             stq_wait,
//		             stq_wait_next,
//		             stq_done_thr;

   wire [2:0]    fprs0,
		             fprs1,
		             fprs2,
		             fprs3,
		             fprs_d,
		             fprs_e,
		             fprs_wrt_data,
                 thr_config_in_w,
                 thr_config_in_w2,
		             fprs0_nxt,
		             fprs1_nxt,
		             fprs2_nxt,
		             fprs3_nxt;

   wire [1:0]    new_fprs;

   wire [3:0]    fprs_en_s,
		             fpen_vec_s;

   wire          wrt_fprs_w,
                 wrt_fprs_w2;
   
   wire [3:0]    sel_wrt,
		             fprs_sel_set,
		             fprs_sel_wrt,
		             fprs_sel_old;

   wire          fpen_s;

   wire [1:0]    trap_tid_w2;
   wire          trappc_vld_w2;

   wire          dtu_reset_l;
   wire          sched_reset;
   
   wire          clk;
   
   //
   // Code Begins Here
   //

   assign        clk = rclk;
   
   // reset buffer
   dffrl_async rstff(.din (grst_l),
                        .q   (dtu_reset_l),
                        .clk (clk), .se(se), .si(), .so(),
                        .rst_l (arst_l));

   assign       dtu_reset = ~dtu_reset_l;
   

   //---------------------------------------------
   // Start off thread on reset using this counter
   //---------------------------------------------
//   dffr #(4) thrrdy_ctr(.din (count_nxt),
//		                    .clk (clk),
//		                    .q   (count),
//		                    .rst (dtu_reset),
//		                    .se (se), .si(), .so());
//
//   // count_nxt = count + 1, sticky at 8 = 1111
//   assign count_nxt[0] = ~count[0] | count[3];
//   assign count_nxt[1] = (count[1] ^ count[0]) | count[3];
//   assign count_nxt[2] = (count[2] ^ (count[1] & count[0])) | count[3]; 
//   assign count_nxt[3] = (count[3] ^ (count[2] & count[1] & count[0])) |
//	                       count[3]; 
//
//   assign proc0 = (const_cpuid == 4'b0000) ? 1'b1 : 1'b0;
//   assign start_on_rst = (~count[3] & count[2] & count[1] & count[0])
//                          & proc0;

//`ifdef IFU_SAT   
//   // temporary hack to start threads
//   reg [3:0]  auto_start;
//   always @ (posedge clk)
//     auto_start = 4'b0000;
//`endif
   
   //-----------------
   // completion logic
   //-----------------
   sparc_ifu_thrcmpl compl(
                           .reset       (dtu_reset),
			                     /*AUTOINST*/
                           // Outputs
                           .completion  (completion[3:0]),
                           .wm_imiss    (wm_imiss[3:0]),
                           .wm_other    (wm_other[3:0]),
                           .swl_esl_icmiss_out (swl_esl_icmiss_out),
                           // Inputs
                           .clk         (clk),
                           .se          (se),
                           .si          (si),
                           .fcl_ifq_icmiss_s1(fcl_ifq_icmiss_s1),
                           .erb_dtu_ifeterr_d1(erb_dtu_ifeterr_d1),
                           .sw_cond_s   (sw_cond_s),
                           .en_spec_g   (en_spec_g),
                           .atr_s       (atr_s),
                           .dtu_fcl_thr_active(dtu_fcl_thr_active[3:0]),
                           .ifq_dtu_thrrdy(ifq_dtu_thrrdy[3:0]),
                           .ifq_dtu_pred_rdy(ifq_dtu_pred_rdy[3:0]),
                           .exu_lop_done(exu_lop_done[3:0]),
                           .branch_done_d(branch_done_d[3:0]),
                           .fixedop_done(fixedop_done[3:0]),
                           .ldmiss      (ldmiss[3:0]),
                           .spec_ld_d   (spec_ld_d[3:0]),
                           .trap        (trap[3:0]),
                           .retr_thr_wakeup(retr_thr_wakeup[3:0]),
                           .flush_wake_w2(flush_wake_w2[3:0]),
                           .ldhit_thr   (ldhit_thr[3:0]),
                           .spec_ld_g   (spec_ld_g[3:0]),
                           .clear_wmo_e (clear_wmo_e),
                           .wm_stbwait  (wm_stbwait[3:0]),
                           .stb_retry   (stb_retry[3:0]),
                           .rst_thread  (rst_thread[3:0]),
                           .trap_thrrdy (trap_thrrdy[3:0]),
                           .thr_s2      (thr_s2[3:0]),
                           .thr_e       (thr_e[3:0]),
                           .thr_s1      (thr_s1[3:0]),
                           .fp_thrrdy   (fp_thrrdy[3:0]),
                           .lsu_ifu_ldst_cmplt(lsu_ifu_ldst_cmplt[3:0]),
                           .sta_done_e  (sta_done_e),
                           .killed_inst_done_e(killed_inst_done_e));

   //------------
   // Thread Pipe
   //------------
   assign thr_f = fcl_dtu_thr_f;

//   assign thr_dec_f[0] = thr_f[0] | rst_tri_en;
//   assign thr_dec_f[3:1] = thr_f[3:1] & {3{~rst_tri_en}};

//   assign thr_dec_d[0] = thr_d[0] | rst_tri_en;
//   assign thr_dec_d[3:1] = thr_d[3:1] & {3{~rst_tri_en}};


   dff_s #(4) thrd_reg(.din  (thr_f[3:0]),
		   .clk  (clk),
		   .q    (thr_d[3:0]),
		   .se   (se), .si(), .so());

   assign     swl_dcl_thr_d = thr_d;

   dff_s #(4) thre_reg(.din  (thr_d),
		   .clk  (clk),
		   .q    (thr_e),
		   .se   (se), .si(), .so());

   dff_s #(4) thrm_reg(.din  (thr_e),
		   .clk  (clk),
		   .q    (thr_m),
		   .se   (se), .si(), .so());
   dff_s #(4) thrw_reg(.din  (thr_m),
		   .clk  (clk),
		   .q    (thr_w),
		   .se   (se), .si(), .so());

   dff_s #(4) thrw2_reg(.din  (thr_w),
		    .clk  (clk),
		    .q    (st_thr_w2),
		    .se   (se), .si(), .so());

   dff_s #(4) thrw3_reg(.din  (st_thr_w2),
		    .clk  (clk),
		    .q    (st_thr_w3),
		    .se   (se), .si(), .so());

   assign     swl_dcl_thr_w2 = st_thr_w2;

   // send ibe of curr thread to dec
   assign ibe_d = (thr_d[0] & tlu_hpstate_ibe[0] |
                   thr_d[1] & tlu_hpstate_ibe[1] |
                   thr_d[2] & tlu_hpstate_ibe[2] |
                   thr_d[3] & tlu_hpstate_ibe[3]);

   dff_s #(1) ibee_ff(.din (ibe_d),
                    .q   (ibe_e),
                    .clk (clk), .se(se), .si(), .so());
   assign swl_dec_ibe_e = ibe_e;

//----------------------------------------------------------------------
// Track Thread Execution
//----------------------------------------------------------------------

   // track instructions
   dff_s #(1) lle_ff(.din (dec_swl_ll_done_d),
                   .q   (llinst_done_e),
                   .clk (clk), .se (se), .si(), .so());
                   
   assign ll_done_e = thr_e & {4{llinst_done_e & fcl_dtu_inst_vld_e & 
                                 ~exu_ifu_spill_e}};
   assign std_tcc_done_m = thr_m & {4{dcl_swl_tcc_done_m | std_done_m}};

   assign wsr_fixed_qual_w  = wsr_fixed_inst_w & ifu_tlu_inst_vld_w & 
                              ~fcl_swl_flush_w;
   dff_s #(1) wsrw2_ff(.din (wsr_fixed_qual_w),
                     .q   (wsr_fixed_w2),
                     .clk (clk), .se(se), .si(), .so());
                     
   assign wsr_inst_w2  = wsr_fixed_w2 & ~flush_pipe_w2;

   // delay one cycle to allow tlu to finish
   dff_s #(1) wsw3_ff(.din (wsr_inst_w2),
                    .q   (wsr_inst_w3),
                    .clk (clk), .se(se), .si(), .so());

   assign wsr_done_w3 = {4{wsr_inst_w3}} & st_thr_w3;

   assign fixedop_done = (ll_done_e | wsr_done_w3 | std_tcc_done_m |
	                        wrt_tcr_w2 | extra_longlat_compl);

   assign branch_done_d = thr_d & {4{dec_swl_br_done_d & fcl_dtu_inst_vld_d}};

   assign sta_done_e = dec_swl_sta_inst_e & fcl_dtu_inst_vld_e & 
                       ~lsu_ifu_ldsta_internal_e;
   assign ld_inst_qual_d = dec_swl_ld_inst_d & fcl_dtu_inst_vld_d & 
                           ~iferr_d;
   dff_s #(1) lde_ff(.din  (ld_inst_qual_d),
		               .clk  (clk),
		               .q    (ld_inst_e),
		               .se   (se), .si(), .so());
   assign ld_inst_next_e = ld_inst_e;
//                         & ~dtu_inst_anull_e &    
//                           ~(lsu_ifu_ldsta_internal_e & 
//                             ifu_lsu_alt_space_e &
//                             fcl_dtu_inst_vld_e);
   
//   assign ld_inst_internal_e = ~dtu_inst_anull_e & ld_inst_e &
//                               (fcl_dtu_inst_vld_e & 
//                                lsu_ifu_ldsta_internal_e & 
//                                ifu_lsu_alt_space_e);
   
   dff_s #(1) ldm_ff(.din  (ld_inst_next_e),
		               .clk  (clk),
		               .q    (ld_inst_m),
		               .se   (se), .si(), .so());
   dff_s #(1) ldw_ff(.din  (ld_inst_m),
		               .clk  (clk),
		               .q    (ld_inst_unq_w),
		               .se   (se), .si(), .so());
   assign ld_inst_w = ifu_tlu_inst_vld_w & ld_inst_unq_w;
   dff_s #(1) ldw2_ff(.din  (ld_inst_w),
		               .clk  (clk),
		               .q    (ld_inst_w2),
		               .se   (se), .si(), .so());

   // track instruction status
   dff_s #(1) swcd_ff(.din  (sw_cond_s),
		                .clk  (clk),
		                .q    (swc_d),
		                .se   (se), .si(), .so());

   assign swc_next_d = (swc_d & ~dec_swl_br_done_d);
//			                   | fcl_dtu_sync_intr_d;
   
   dff_s #(1) swce_ff(.din  (swc_next_d),
		                .clk  (clk),
		                .q    (swc_e),
		                .se   (se), .si(), .so());

//bug6838,bug6989 - interrupt issued in annulled delay slot resets wm_other mask in e-stage; this
//                  reset causes switch logic to lose a long latency op(div) which set the wm_other mask
//                  in s-stage. Note that the div is issued to FPU. the ifu re-issues the interrupt - 
//                  which results in flush. this kills the long latency op and div is lost
//
//                  fix is to detect interrupt in anulled delay slot followed by long latency op and
//                  not reset the wm_other mask.
//
//       10/07/04 - fix changed to delay setting of wm_other mask from d-cycle to e-cycle. hence
//                  removing the kill in killed_inst_done_e
//
//   assign killed_inst_done_e = (fcl_dtu_inst_vld_e  & swc_e | //sw inst
//                                fcl_dtu_intr_vld_e) &  // any intr
//                                 dtu_inst_anull_e;

   assign killed_inst_done_e = fcl_dtu_inst_vld_e  & swc_e & //sw inst
                                 dtu_inst_anull_e;

   // a uniop is something that stalls all threads (looks like a uni
   // threaded machine)
   assign uniop_d = (dec_swl_allfp_d | //& swl_dec_fp_enable_d  
                     dec_swl_mul_inst_d | dec_swl_div_inst_d) & 
                      fcl_dtu_inst_vld_d;
   dff_s #(1) uniop_ff(.din  (uniop_d),
		                 .clk  (clk),
		                 .q    (uniop_e),
		                 .se   (se), .si(), .so());
   assign killed_uniop_done_e = thr_e & {4{dtu_inst_anull_e & uniop_e & 
                                           fcl_dtu_inst_vld_e |
                                           clear_wmo_e}};

//   assign sched_nt = fcl_dtu_switch_s & ~fcl_dtu_stall_bf;
   assign sched_nt = dtu_fcl_ntr_s & ~(fcl_dtu_stall_bf | ifq_swl_stallreq);   
   assign schedule = dtu_fcl_nextthr_bf & {4{sched_nt}};

   // speculate load hit if it is a load instruction
   // FP loads are not speculated on 
   assign spec_ld_d = thr_d & {4{ld_inst_qual_d & en_spec_d}};
   assign issue_spec_ld = thr_d & {4{ld_inst_qual_d & en_spec_d}} &
                          ~wm_imiss & ~wm_stbwait;

//   assign issue_spec_ld = thr_d & {4{dec_swl_ld_inst_d & en_spec_d & 
//                                     ~fcl_ifq_icmiss_s1}} & ~wm_imiss;
   
   assign spec_ld_g = (thr_w & {4{ld_inst_w & en_spec_g}});
   
   // actual load hit signal and load miss stall
//   assign rollback_g = en_spec_g & ld_inst_w & lsu_ifu_ldst_miss_g;
   // expand to gates:
   assign rb_en_g = en_spec_g & ld_inst_w;
   assign rollback_g_l = ~(lsu_ifu_ldst_miss_g & rb_en_g);
//   bw_u1_nand2_7x UZsize_rbgen(.a (lsu_ifu_ldst_miss_g),
//                               .b (rb_en_g),
//                               .z (rollback_g_l));
   assign rollback_g = ~rollback_g_l;
//   bw_u1_invh_25x UZsize_rbbuf(.a (rollback_g_l),
//                               .z (rollback_g));
   assign dtu_fcl_rollback_g = rollback_g;

   // delay restart of ldhit when en_spec=0 by 1 more cycle?
   
// assign rb_thr_w = thr_w & {4{en_spec_g & ld_inst_w & lsu_ifu_ldst_miss_g}};
// assign spec_ldmiss = rb_thr_w; // to thrcmpl
   
   assign ldhit_thr = (thr_w & {4{ld_inst_w & ~lsu_ifu_ldst_miss_g}} | 
                       thr_e & {4{ld_inst_e & dtu_inst_anull_e}});
   assign ldmiss_crit = thr_w & {4{ld_inst_w & lsu_ifu_ldst_miss_g}};
   assign ldmiss_non_crit = st_thr_w2 & {4{lsu_ifu_dc_parity_error_w2}};
                            // | thr_e & {4{ld_inst_internal_e}} 
                            
   assign ldmiss = ldmiss_crit | ldmiss_non_crit;
   
   assign rt_st_thr_d = thr_d & {4{retract_store_d}};
   assign rt_st_thr_e = thr_e & {4{retract_store_e}};

   dff_s #(1) rbw2_ff(.din (rollback_g),
                    .q   (rollback_w2),
                    .clk (clk), .se(se), .si(), .so());

   // traps and interrupts
   dff_s #(1) ld_trp_reg(.din (tlu_ifu_trappc_vld_w1),
                       .q   (trappc_vld_w2),
                       .clk (clk), .se(se), .si(), .so());

   dff_s #(2) trp_tid_reg(.din (tlu_ifu_trap_tid_w1[1:0]),
                        .q   (trap_tid_w2[1:0]),
                        .clk (clk), .se(se), .si(), .so());
   
   assign trap_thr[0] = ~trap_tid_w2[1] & ~trap_tid_w2[0];
   assign trap_thr[1] = ~trap_tid_w2[1] &  trap_tid_w2[0];
   assign trap_thr[2] =  trap_tid_w2[1] & ~trap_tid_w2[0];
   assign trap_thr[3] =  trap_tid_w2[1] &  trap_tid_w2[0];

   assign trap_thrrdy = trap_thr & {4{trappc_vld_w2}};

   // fst processed directly in swl
   assign rbfor_fst_ce_w = ifu_tlu_inst_vld_w & ~tlu_ifu_flush_pipe_w & 
                           ffu_ifu_fst_ce_w & ~fcl_swl_flush_w;

//   dff #(1) fstce_ff(.din (rbfor_fst_ce_w),
//                     .q   (rbfor_fst_ce_w2),
//                     .clk (clk), .se(se), .si(), .so());
   
   assign flush_all_w = tlu_ifu_flush_pipe_w | fcl_swl_flush_w;
//   assign flush_pipe_w_nxt = tlu_ifu_flush_pipe_w & ~fcl_swl_flush_w;
   assign flush_pipe_w_nxt = tlu_ifu_flush_pipe_w & 
                             ~fcl_swl_flush_wake_w;   
   
   dff_s #(1) flpw2_ff(.din (flush_pipe_w_nxt),
                     .q   (flush_pipe_w2),
                     .clk (clk), .se(se), .si(), .so());

//   assign no_iftrap_m = ~ifu_tlu_ttype_vld_m;
//   dff #(1) trpw_ff(.din (no_iftrap_m),
//                    .q   (no_iftrap_w),
//                    .clk (clk), .se(se), .si(), .so());
   
//bug6838,bug6989 - change setting of trap for interrupt from d-cycle to e-cycle
//                  remove  thr_d & {4{fcl_dtu_sync_intr_d & ~iferr_d}} & ~rt_st_thr_e |
   
//   assign trap =  thr_w & {4{flush_all_w}} |
   assign trap =  st_thr_w2 & {4{flush_pipe_w2}} |
                  thr_w & {4{fcl_swl_flush_w}} |
                        thr_e & {4{fcl_dtu_intr_vld_e & ~dtu_inst_anull_e}} |
	                thr_m & {4{ifu_tlu_ttype_vld_m}};

   assign trp_no_retr = st_thr_w2 & {4{flush_pipe_w2 |
                                       lsu_ifu_dc_parity_error_w2 &
                                       ld_inst_w2    | 
                                       rollback_w2}}  |
	                      trap_thr & {4{trappc_vld_w2}} |
                        fp_flush_wake_w3 |
                        thr_w & {4{fcl_swl_flush_w}};
//	                       thr_m    & {4{ifu_tlu_ttype_vld_m}};

   assign trp_noretr_d = (thr_d[0] & trp_no_retr[0] | 
                          thr_d[1] & trp_no_retr[1] | 
                          thr_d[2] & trp_no_retr[2] | 
                          thr_d[3] & trp_no_retr[3]);
   
//   assign flush_done_w = fcl_swl_flush_w & ~fcl_swl_flush_wait_w;
   assign flush_done_w = fcl_swl_flush_wake_w;   
   dff_s #(1) flsh_ff(.din (flush_done_w),
		                .q   (flush_done_w2),
		                .clk (clk), .se(se), .si(), .so());
   assign flush_wake_w2 = {4{flush_done_w2}} & st_thr_w2 | fp_flush_wake_w3;

   // delay FP wakeup by one extra cycle to allow time for IRF CE
   // to be corrected.
   dff_s #(1) fpflsh_ff(.din (rbfor_fst_ce_w),
		                  .q   (fp_flush_done_w2),
		                  .clk (clk), .se(se), .si(), .so());

   dff_s #(1) fpflw_ff(.din (fp_flush_done_w2),
		                 .q   (fp_flush_done_w3),
		                 .clk (clk), .se(se), .si(), .so());
   assign fp_flush_wake_w3 = st_thr_w3 & {4{fp_flush_done_w3}};
   
   // store buffer full
//   assign stbfull_on_curr_thr = stb_stall & thr_f;
//   assign stbfull_thisthr =  stbfull_on_curr_thr[0] |
//	                           stbfull_on_curr_thr[1] |
//	                           stbfull_on_curr_thr[2] |
//	                           stbfull_on_curr_thr[3];

//   assign stbfull_nextthr = ((stb_stall & dtu_fcl_nextthr_bf)
//			                       == 4'b0) ?
//			                        1'b0 : 1'b1;

   // imiss stall condition
   assign thr_s1 = thr_d;
   assign imiss = (thr_s1 & {4{fcl_ifq_icmiss_s1}}) | 
	                  (thr_e & {4{erb_dtu_ifeterr_d1}});  //

   // All Stall conditions
   assign all_stall = imiss | ldmiss_non_crit | trap | stb_stall | 
                      ldmiss_crit;

   // TBD: move to ifu -- done
//   assign ext_stallreq = ifq_dtu_stallreq | lsu_ifu_stallreq | 
//                         ffu_ifu_stallreq;  
                         // | other stall reqs
//   assign cpu_fcl_stallreq = ext_stallreq;
   
   // thread start and stop
//   assign switch_out = fcl_dtu_switch_s | fcl_dtu_stall_bf | fcl_swl_swout_f;
   assign switch_out = dtu_fcl_ntr_s | fcl_dtu_stall_bf | fcl_swl_swout_f |
                       ifq_swl_stallreq;

   // general stall condition
//   assign cpu_fcl_stallreq = ~dtu_fcl_ntr_s & (stbfull_thisthr) |
//                             dtu_fcl_ntr_s & (stbfull_nextthr) |
//	                           ext_stallreq;

   // ldmiss (i.e rollback) and flush_pipe are taken care of in FCL
   assign sw_cond_s = fdp_fcl_swc_s2 & fcl_swl_swcvld_s & ~iferr_s;

   // thread reset and other interrupts
   // added flop for timing reasons

//   assign async_rst_i3 = rst_thread & ~dtu_fcl_thr_active;
//   assign rst_thread   = rstthr_i3 & {4{rstint_i3}};
  // assign nuke_thread  = (rstthr_i3 & {4{nukeint_i3}} & 
//			                    ~dtu_fcl_thr_active) |   // if not active nuke 
			                                             // immediately
//			                     ({4{fcl_dtu_nuke_thr_ms}} & thr_m);
                                                   // else wait for signal

   assign resum_thread = ({4{fcl_dtu_resum_thr_w}} & thr_w);
   assign nuke_thread = ({4{fcl_dtu_nuke_thr_w}} & thr_w);
   assign rst_thread = ({4{fcl_dtu_rst_thr_w}} & thr_w);

   assign int_activate = fcl_swl_int_activate_i3 & ~wm_imiss;

//`ifdef IFU_SAT   
//   assign start_thread = {3'b0, start_on_rst} | auto_start | 
//                         resum_thread & (~wm_imiss | ifq_dtu_thrrdy);
//`else
   assign start_thread = resum_thread & (~wm_imiss | ifq_dtu_thrrdy) & 
                                          (~wm_stbwait | stb_retry);
   assign thaw_thread = resum_thread & (wm_imiss & ~ifq_dtu_thrrdy |
                                        wm_stbwait & ~stb_retry);
   
//`endif
   
   
//----------------------------------------------------------------------
// Thread FSM
//----------------------------------------------------------------------   

//trin
// jtag access
reg [3:0] rtap_ifu_thrfsm_wr_en;
reg [4:0] rtap_ifu_thrfsm_wr_data;

always @ *
begin
   rtap_ifu_thrfsm_wr_en = 0;
   if (rtap_core_val && rtap_core_id == `JTAG_CORE_ID_IFU_THRFSM)
   begin
      if (rtap_core_threadid == 2'd0)
         rtap_ifu_thrfsm_wr_en = 4'b0001;
      else if (rtap_core_threadid == 2'd1)
         rtap_ifu_thrfsm_wr_en = 4'b0010;
      else if (rtap_core_threadid == 2'd2)
         rtap_ifu_thrfsm_wr_en = 4'b0100;
      else if (rtap_core_threadid == 2'd3)
         rtap_ifu_thrfsm_wr_en = 4'b1000;
   end
   rtap_ifu_thrfsm_wr_data = rtap_core_data[4:0];
end

   sparc_ifu_thrfsm  thrfsm0(
			     // Outputs
`ifdef PITON_PROTO
			     
			     .so	(/*so*/),
`else
			     .so	(so),
`endif
			     .thr_state	(thr0_state[4:0]),
                 .thr_nstate (thr0_nstate[4:0]),
			     // Inputs
			     .completion(completion[0]),
			     .schedule	(schedule[0]),
			     .spec_ld	(issue_spec_ld[0]),
			     .ldhit	(ldhit_thr[0]),
			     .switch_out(switch_out),

			     .stall     (all_stall[0]),
			     .sw_cond	(sw_cond_s),

			     .int_activate(int_activate[0]),
			     .start_thread(start_thread[0]),
			     .thaw_thread(thaw_thread[0]),
			     .nuke_thread (nuke_thread[0]),
			     .rst_thread(rst_thread[0]),

			     .halt_thread (halt_thread[0]),
			     
           // jtag interface
           .rtap_ifu_thrfsm_wr_en(rtap_ifu_thrfsm_wr_en[0]),
           .rtap_ifu_thrfsm_wr_data(rtap_ifu_thrfsm_wr_data),

			     .clk	(clk),
			     .se	(se),
			     .si	(si),
			     .reset	(dtu_reset));

   sparc_ifu_thrfsm  thrfsm1(
			     // Outputs
`ifdef PITON_PROTO
			     
			     .so	(/*so*/),
`else
			     .so	(so),
`endif
			     .thr_state	(thr1_state[4:0]),
                 .thr_nstate (thr1_nstate[4:0]),
			     // Inputs
			     .completion(completion[1]),
			     .schedule	(schedule[1]),
			     .spec_ld	(issue_spec_ld[1]),
			     .ldhit	(ldhit_thr[1]),
			     .switch_out(switch_out),

			     .stall     (all_stall[1]),
			     .sw_cond	(sw_cond_s),

			     .int_activate(int_activate[1]),
			     .start_thread(start_thread[1]),
			     .thaw_thread(thaw_thread[1]),
			     .nuke_thread (nuke_thread[1]),
			     .rst_thread(rst_thread[1]),

			     .halt_thread (halt_thread[1]),
			     
           // jtag interface
           .rtap_ifu_thrfsm_wr_en(rtap_ifu_thrfsm_wr_en[1]),
           .rtap_ifu_thrfsm_wr_data(rtap_ifu_thrfsm_wr_data),

			     .clk	(clk),
			     .se	(se),
			     .si	(si),
			     .reset	(dtu_reset));
   
// trin: since proc only has 2 threads, disabling the following state machines
`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined
assign thr2_state[4:0] = 5'b0;
assign thr3_state[4:0] = 5'b0;

`else // ifdef CONFIG_NUM_THREADS
   sparc_ifu_thrfsm  thrfsm2(
			     // Outputs
`ifdef PITON_PROTO
			     
			     .so	(/*so*/),
`else
			     .so	(so),
`endif
			     .thr_state	(thr2_state[4:0]),
                 .thr_nstate (thr2_nstate[4:0]),
			     // Inputs
			     .completion(completion[2]),
			     .schedule	(schedule[2]),
			     .spec_ld	(issue_spec_ld[2]),
			     .ldhit	(ldhit_thr[2]),
			     .switch_out(switch_out),

			     .stall     (all_stall[2]),
			     .sw_cond	(sw_cond_s),

			     .int_activate(int_activate[2]),
			     .start_thread(start_thread[2]),
			     .thaw_thread(thaw_thread[2]),
			     .nuke_thread (nuke_thread[2]),
			     .rst_thread(rst_thread[2]),

			     .halt_thread (halt_thread[2]),
			     
           // jtag interface
           .rtap_ifu_thrfsm_wr_en(rtap_ifu_thrfsm_wr_en[2]),
           .rtap_ifu_thrfsm_wr_data(rtap_ifu_thrfsm_wr_data),

			     .clk	(clk),
			     .se	(se),
			     .si	(si),
			     .reset	(dtu_reset));
   
   sparc_ifu_thrfsm  thrfsm3(
			     // Outputs
`ifdef PITON_PROTO
			     
			     .so	(/*so*/),
`else
			     .so	(so),
`endif
			     .thr_state	(thr3_state[4:0]),
                 .thr_nstate (thr3_nstate[4:0]),
			     // Inputs
			     .completion(completion[3]),
			     .schedule	(schedule[3]),
			     .spec_ld	(issue_spec_ld[3]),
			     .ldhit	(ldhit_thr[3]),
			     .switch_out(switch_out),

			     .stall     (all_stall[3]),
			     .sw_cond	(sw_cond_s),

			     .int_activate(int_activate[3]),
			     .start_thread(start_thread[3]),
			     .thaw_thread(thaw_thread[3]),
			     .nuke_thread (nuke_thread[3]),
			     .rst_thread(rst_thread[3]),

			     .halt_thread (halt_thread[3]),
			     
           // jtag interface
           .rtap_ifu_thrfsm_wr_en(rtap_ifu_thrfsm_wr_en[3]),
           .rtap_ifu_thrfsm_wr_data(rtap_ifu_thrfsm_wr_data),

			     .clk	(clk),
			     .se	(se),
			     .si	(si),
			     .reset	(dtu_reset));

`endif // ifdef CONFIG_NUM_THREADS

//----------------------------------------------------------------------
// Schedule Next Thread
//----------------------------------------------------------------------
   // rdy bit from thrfsm
   assign dtu_fcl_thr_active[0] = thr0_state[`TCR_ACTIVE];
   assign dtu_fcl_thr_active[1] = thr1_state[`TCR_ACTIVE];
   assign dtu_fcl_thr_active[2] = thr2_state[`TCR_ACTIVE];
   assign dtu_fcl_thr_active[3] = thr3_state[`TCR_ACTIVE];

   assign rdy[0] = thr0_state[`TCR_URDY];
   assign rdy[1] = thr1_state[`TCR_URDY];
   assign rdy[2] = thr2_state[`TCR_URDY];
   assign rdy[3] = thr3_state[`TCR_URDY];

   assign sprdy_or_urdy[0] = thr0_state[`TCR_READY];
   assign sprdy_or_urdy[1] = thr1_state[`TCR_READY];
   assign sprdy_or_urdy[2] = thr2_state[`TCR_READY];
   assign sprdy_or_urdy[3] = thr3_state[`TCR_READY];

   assign sprdy_or_urdy_next[0] = thr0_nstate[`TCR_READY];
   assign sprdy_or_urdy_next[1] = thr1_nstate[`TCR_READY];
   assign sprdy_or_urdy_next[2] = thr2_nstate[`TCR_READY];
   assign sprdy_or_urdy_next[3] = thr3_nstate[`TCR_READY]; 

   assign running_s2 = (thr0_state[`TCR_RUNNING] |
			                  thr1_state[`TCR_RUNNING] |
			                  thr2_state[`TCR_RUNNING] |
			                  thr3_state[`TCR_RUNNING]);

   assign dtu_fcl_running_s = running_s2;

   assign thr_s2 =  {thr3_state[`TCR_RUNNING],
			               thr2_state[`TCR_RUNNING],
			               thr1_state[`TCR_RUNNING],
			               thr0_state[`TCR_RUNNING]};

   // Next Thread Ready 
   assign dtu_fcl_ntr_s = config_dtu_esl_en ? esl_fcl_ntr_s 
                                            : (sprdy_or_urdy[0] | sprdy_or_urdy[1] | 
				                               sprdy_or_urdy[2] | sprdy_or_urdy[3]);

   // Any thread ready
   assign atr_s = dtu_fcl_ntr_s | running_s2;

   // decide which scheduler to use
   // timing note: see if use_spec can be generated in previous cycle
   assign use_spec = ~(rdy[3] | rdy[2] | rdy[1] | rdy[0]);

   // Select between thread select decision from LRU and ESL
   assign dtu_fcl_nextthr_bf = config_dtu_esl_en ? esl_fcl_nextthr_bf : lru_fcl_nextthr_bf;

   assign sched_reset = dtu_reset | ~gdbginit_l;
   // schedule ready threads using LRU
   sparc_ifu_lru4 thr_sched(// Outputs
			                      .grant_vec	(lru_fcl_nextthr_bf[3:0]),
			                      .so		(so),
			                      // Inputs
			                      .clk	(clk),
			                      .reset	(sched_reset),
			                      .se		(se),
			                      .si		(si),
			                      .recent_vec	(thr_e[3:0]),
			                      .load_recent(fcl_dtu_inst_vld_e),
			                      .req_vec	(rdy[3:0]),
                            .spec_vec (sprdy_or_urdy[3:0]),
                            .use_spec (use_spec));

   // Pipe forward issue previous instruction control signal
   dff_s #(1) issue_prev_inst_reg (.din (esl_fdp_issue_prev_inst_next_s),
                                   .q (esl_fdp_issue_prev_inst_s),
                                   .clk (clk), .se(se), .si(), .so());

   // Schedule ready threads using Execution Drafting
   sparc_ifu_esl esl_thr_sched
   (
      .clk (clk),
      .rst_n (~sched_reset),
      .config_esl_en (config_dtu_esl_en),
      .config_esl_sync_method (config_dtu_esl_sync_method),
      .config_esl_lfsr_seed (config_esl_lfsr_seed),
      .config_esl_lfsr_ld (config_esl_lfsr_ld),
      .config_esl_pc_diff_thresh (config_esl_pc_diff_thresh),
      .config_esl_counter_timeout (config_esl_counter_timeout),
      .swl_esl_thr_active (dtu_fcl_thr_active),
      .swl_esl_thr_urdy (rdy),
      .swl_esl_thr_sprdy_or_urdy (sprdy_or_urdy),
      .swl_esl_thr_sprdy_or_urdy_next (sprdy_or_urdy_next),
      .swl_esl_use_spec (use_spec),
      .fcl_esl_thr_f (fcl_dtu_thr_f),
      .fdp_esl_t0inst_next_s2 (fdp_esl_t0inst_next_s2),
`ifndef CONFIG_NUM_THREADS
      .fdp_esl_t1inst_next_s2 (fdp_esl_t1inst_next_s2),
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
      .fdp_esl_t1inst_next_s2 (fdp_esl_t1inst_next_s2),
`elsif THREADS_3
      .fdp_esl_t1inst_next_s2 (fdp_esl_t1inst_next_s2),
      .fdp_esl_t2inst_next_s2 (fdp_esl_t2inst_next_s2),
`else
      .fdp_esl_t1inst_next_s2 (fdp_esl_t1inst_next_s2),
      .fdp_esl_t2inst_next_s2 (fdp_esl_t2inst_next_s2),
      .fdp_esl_t3inst_next_s2 (fdp_esl_t3inst_next_s2),
`endif
`endif
      .fdp_esl_t0inst_paddr_next_s2 (fdp_esl_t0inst_paddr_next_s2),
`ifndef CONFIG_NUM_THREADS
      .fdp_esl_t1inst_paddr_next_s2 (fdp_esl_t1inst_paddr_next_s2),
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
      .fdp_esl_t1inst_paddr_next_s2 (fdp_esl_t1inst_paddr_next_s2),
`elsif THREADS_3
      .fdp_esl_t1inst_paddr_next_s2 (fdp_esl_t1inst_paddr_next_s2),
      .fdp_esl_t2inst_paddr_next_s2 (fdp_esl_t2inst_paddr_next_s2),
`else
      .fdp_esl_t1inst_paddr_next_s2 (fdp_esl_t1inst_paddr_next_s2),
      .fdp_esl_t2inst_paddr_next_s2 (fdp_esl_t2inst_paddr_next_s2),
      .fdp_esl_t3inst_paddr_next_s2 (fdp_esl_t3inst_paddr_next_s2),
`endif
`endif
      .fdp_esl_t0pc_next_s2 (fdp_esl_t0pc_next_s2),
`ifndef CONFIG_NUM_THREADS
      .fdp_esl_t1pc_next_s2 (fdp_esl_t1pc_next_s2),
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
      .fdp_esl_t1pc_next_s2 (fdp_esl_t1pc_next_s2),
`elsif THREADS_3
      .fdp_esl_t1pc_next_s2 (fdp_esl_t1pc_next_s2),
      .fdp_esl_t2pc_next_s2 (fdp_esl_t2pc_next_s2),
`else
      .fdp_esl_t1pc_next_s2 (fdp_esl_t1pc_next_s2),
      .fdp_esl_t2pc_next_s2 (fdp_esl_t2pc_next_s2),
      .fdp_esl_t3pc_next_s2 (fdp_esl_t3pc_next_s2),
`endif
`endif
      .fcl_esl_tinst_vld_next_s (fcl_esl_tinst_vld_next_s),
      .fcl_esl_brtaken_e (fcl_esl_brtaken_e),
      .fcl_esl_brtaken_m (fcl_esl_brtaken_m),
      .fcl_esl_thr_e (fcl_esl_thr_e),
      .fcl_esl_thr_m (fcl_esl_thr_m),
      .fcl_esl_inst_vld_d (fcl_esl_inst_vld_d),
      .fcl_esl_inst_vld_e (fcl_esl_inst_vld_e),
      .fcl_esl_inst_vld_m (fcl_esl_inst_vld_m),
      .fcl_esl_thr_trap_bf (fcl_esl_thr_trap_bf),
      .fcl_esl_rb_stg_s (fcl_esl_rb_stg_s),
      .dcl_esl_br_inst_d (dcl_esl_br_inst_d),
      .dcl_esl_br_inst_e (dcl_esl_br_inst_e),
      .fdp_esl_brtrp_target_pc_bf_f (fdp_esl_brtrp_target_pc_bf_f),
      .swl_esl_icmiss_out (swl_esl_icmiss_out),
      .esl_fcl_nextthr_bf (esl_fcl_nextthr_bf),
      .esl_fcl_stall_bf (esl_fcl_stall_bf),
      .esl_fcl_switch_bf (esl_fcl_switch_bf),
      .esl_fdp_sync_pcs_bf (esl_fdp_sync_pcs_bf),
      .esl_fcl_ntr_s (esl_fcl_ntr_s),
      .esl_fdp_issue_prev_inst_next_s (esl_fdp_issue_prev_inst_next_s),
      .esl_fcl_force_running_s (esl_fcl_force_running_s)
   );
      
//----------------------------------------------------------------------
// Thread Status (Config) Register
//----------------------------------------------------------------------
   // Read thread config
   assign enc_thr_d[1] = thr_d[3] | thr_d[2];
   assign enc_thr_d[0] = thr_d[3] | thr_d[1];   

   assign rd_thract_d = (thr0_state[0] & thr_d[0] |
                         thr1_state[0] & thr_d[1] |
                         thr2_state[0] & thr_d[2] |
                         thr3_state[0] & thr_d[3]);

   dff_s #(1) rdthr_ff(.din (rd_thract_d),
		                  .clk (clk),
		                  .q   (rd_thract_e),
		                  .se   (se), .si(), .so());

   dff_s #(3) rdcf_reg(.din ({enc_thr_d, en_spec_d}),
		                 .clk (clk),
		                 .q   (rd_tid_spec_e),
		                 .se   (se), .si(), .so());

   dff_s #(1) hpe_ff(.din (fcl_dtu_hprivmode_d),
		               .clk (clk),
		               .q   (hprivmode_e),
		               .se   (se), .si(), .so());
   dff_s #(1) rdthre_ff(.din (dec_swl_rdsr_sel_thr_d),
		                  .clk (clk),
		                  .q   (rdsr_sel_thr_e),
		                  .se   (se), .si(), .so());

   // TBD: read out all thread state, not just the current thread
   //      Done 9/26/02
   assign fmt_thrconf_e = {wm_stbwait,
                           wm_other,
                           wm_imiss,           // 51:40 - wait mask
                           4'b0,               // 39:36 - rsvd
                           thr0_state,
                           thr1_state,
                           thr2_state,
                           thr3_state,         // 35:16 - thr state
			                     {2'b0},             // 15:14 - rsvd
			                     const_cpuid,        // 13:10 - 4b cpu id
			                     rd_tid_spec_e[2:1], // 9:8 - 2b tid
			                     {5'b0},             // 7:3 - rsvd
			                     rd_tid_spec_e[0],   // 2 - en spec
			                     {1'b0},             // 1 - QOS/rsvd
			                     rd_thract_e};       // 0 - active

//`ifdef SPARC_HPV_EN
   assign fmt_thrconf_adj[51:1] = fmt_thrconf_e[51:1] & {51{hprivmode_e}};
   assign fmt_thrconf_adj[0] = fmt_thrconf_e[0];
//`else
//   assign fmt_thrconf_adj[51:0] = fmt_thrconf_e[51:0];
//`endif

//   assign thrconf_out_e[51:16] = (fmt_thrconf_e[51:16] & 
//                                      {36{hprivmode_e}});
   
//   mux2ds #(52) rdsr_mxe(.dout (thrconf_out_e[51:0]),
//		                     .in0  ({49'b0, fprs_e}),
//		                     .in1  (fmt_thrconf_adj[51:0]),
//		                     .sel0 (~rdsr_sel_thr_e),
//		                     .sel1 (rdsr_sel_thr_e));
   assign thrconf_out_e[51:0] = rdsr_sel_thr_e ? fmt_thrconf_adj[51:0] :
                                                 {49'b0, fprs_e};

   // leave out the zeros before sending to fdp
   assign dtu_fdp_thrconf_e = {thrconf_out_e[51:40], // 40:29
                               thrconf_out_e[35:16], // 28:9
                               thrconf_out_e[13:8],  // 8:3
                               thrconf_out_e[2:0]};

   // shadow scan outputs
   mux4ds #(11) sscan_mx(.dout (swl_sscan_thrstate[10:0]),
                         .in0  ({thr0_state[4:0], 
                                 wm_imiss[0],
                                 wm_other[0],
                                 wm_stbwait[0],
                                 mul_busy_e[0],
                                 div_busy_e[0],
                                 fp_busy_e[0]}),
                         .in1  ({thr1_state[4:0], 
                                 wm_imiss[1],
                                 wm_other[1],
                                 wm_stbwait[1],
                                 mul_busy_e[1],
                                 div_busy_e[1],
                                 fp_busy_e[1]}),
                         .in2  ({thr2_state[4:0], 
                                 wm_imiss[2],
                                 wm_other[2],
                                 wm_stbwait[2],
                                 mul_busy_e[2],
                                 div_busy_e[2],
                                 fp_busy_e[2]}),
                         .in3  ({thr3_state[4:0], 
                                 wm_imiss[3],
                                 wm_other[3],
                                 wm_stbwait[3],
                                 mul_busy_e[3],
                                 div_busy_e[3],
                                 fp_busy_e[3]}),
                         .sel0 (ctu_sscan_tid[0]),
                         .sel1 (ctu_sscan_tid[1]),
                         .sel2 (ctu_sscan_tid[2]),
                         .sel3 (ctu_sscan_tid[3]));
   
   // write to TCR
   assign wrt_spec_w = dec_swl_wrt_tcr_w & ifu_tlu_inst_vld_w & 
                       ~flush_all_w;

   assign spec_next = (wrt_spec_w2 & fcl_dtu_hprivmode_w2) ? 
                             thr_config_in_w2[2] : 
                             en_spec_d;
   
   assign halt_w = wrt_spec_w & ~thr_config_in_w[0];
   
   dff_s #(1) wrsw2_ff(.din (wrt_spec_w),
                     .q   (wrt_spec_w2),
                     .clk (clk), .se(se), .si(), .so());
   
   assign wrt_tcr_w2 = st_thr_w2 & {4{wrt_spec_w2}};
   
   dff_s #(1) hlt_ff(.din (halt_w),
                   .q   (halt_w2),
                   .clk (clk), .se(se), .si(), .so());
   assign halt_thread = st_thr_w2 & {4{halt_w2}};
   
   dffr_s #(1) enspec_ff(.din (spec_next),
		                   .clk (clk),
		                   .q   (en_spec_d),
		                   .rst (dtu_reset),
		                   .se  (se), .si(), .so());
   
   dff_s #(1) enspecm_ff(.din (rd_tid_spec_e[0]),
		                   .clk (clk),
		                   .q   (en_spec_m),
		                   .se  (se), .si(), .so());

   dff_s #(1) enspecw_ff(.din (en_spec_m),
		                   .clk (clk),
		                   .q   (en_spec_g),
		                   .se  (se), .si(), .so());


   //-----------------------------
   // Instruction Flow Control
   //-----------------------------

   // mul and div control (1 each per cpu)
   assign mul_busy_d = ({4{dec_swl_mul_inst_d & ~swl_dec_mulbusy_e &
                           fcl_dtu_inst_vld_d & ~iferr_d}} & thr_d &
//			                  ~rb_thr_w & ~rt_st_thr_e |          // set
                        ~rt_st_thr_e |
			                  mul_busy_e & ~killed_uniop_done_e) & 
			                   ~exu_ifu_longop_done_g & (~trp_no_retr);  // reset wins

   assign div_busy_d = ({4{dec_swl_div_inst_d & ~swl_dec_divbusy_e &
                           fcl_dtu_inst_vld_d & ~iferr_d}} & 
			                  thr_d  & ~rt_st_thr_e |        // set
			                  div_busy_e & ~killed_uniop_done_e) & 
			                   ~exu_ifu_longop_done_g & (~trp_no_retr); // reset wins

   assign fp_busy_d = ({4{dec_swl_allfp_d & // swl_dec_fp_enable_d &
                          fcl_dtu_inst_vld_d &
                          ~fpbusy_local_e & ~iferr_d}} & thr_d & 
		                   ~rt_st_thr_d & ~rt_st_thr_e |
                                  // FP could be a st
		                   fp_busy_e & ~killed_uniop_done_e) &
			                  {4{~ffu_ifu_fpop_done_w2}} & ~trp_no_retr; // reset wins

   dffr_s #(4) mulb_ff(.din (mul_busy_d),
		                 .q   (mul_busy_e),
		                 .clk (clk),
		                 .rst (dtu_reset),
		                 .se  (se), .si(), .so());
   assign true_mulbusy_e = (|mul_busy_e[3:0]);   
   assign mbusy_d0 = true_mulbusy_e & mul_wait_any;
   
   // block shared resource for two extra cycles, to allow waiting
   // threads a fair chance at getting it.  
   assign swl_dec_mulbusy_e = true_mulbusy_e | mbusy_d3 | mbusy_d1 | mbusy_d2;
   
   dffr_s #(4) divb_ff(.din (div_busy_d),
		                 .q   (div_busy_e),
		                 .clk (clk),
		                 .rst (dtu_reset),
		                 .se  (se), .si(), .so());
   assign true_divbusy_e = (|div_busy_e[3:0]);   
   assign dbusy_d0 = true_divbusy_e & div_wait_any;

   // block shared resource for two extra cycles, to allow waiting
   // threads a fair chance at getting it.  
   assign swl_dec_divbusy_e = true_divbusy_e | dbusy_d3 | dbusy_d1 | dbusy_d2;

   dffr_s #(4) fpb_ff(.din (fp_busy_d),
		                .q   (fp_busy_e),
		                .clk (clk),
		                .rst (dtu_reset),
		                .se  (se), .si(), .so());
   assign true_fpbusy_e = (|fp_busy_e[3:0]);
   assign fbusy_d0 = true_fpbusy_e & fp_wait_any;
   
   assign fbusy_nxt_d = (|fp_busy_d[3:0]) | fbusy_d0 | fbusy_d1 | fbusy_d2;
   dffr_s #(1) tfbe_ff(.din (fbusy_nxt_d),
                     .q   (fbusy_crit_e),
                     .clk (clk), 
                     .rst (dtu_reset), .se(se), .si(), .so());
   
   // block shared resource for two extra cycles, to allow waiting
   // threads a fair chance at getting it.  
   assign swl_dec_fpbusy_e = fbusy_crit_e;
   assign fpbusy_local_e = true_fpbusy_e | fbusy_d3 | fbusy_d1 | fbusy_d2;

   dff_s #(3) bd1_reg(.din ({mbusy_d0, dbusy_d0, fbusy_d0}),
                    .q   ({mbusy_d1, dbusy_d1, fbusy_d1}),
                    .clk (clk), .se(se), .si(), .so());

   dff_s #(3) bd2_reg(.din ({mbusy_d1, dbusy_d1, fbusy_d1}),
                    .q   ({mbusy_d2, dbusy_d2, fbusy_d2}),
                    .clk (clk), .se(se), .si(), .so());
   
   dff_s #(3) bd3_reg(.din ({mbusy_d2, dbusy_d2, fbusy_d2}),
                    .q   ({mbusy_d3, dbusy_d3, fbusy_d3}),
                    .clk (clk), .se(se), .si(), .so());
   
   // ifetch errors
   // If there was an error in the ifetch call back this instruction
   assign iferr_d = erb_dtu_ifeterr_d1 & same_thr_de;
   assign iferr_s = erb_dtu_ifeterr_d1 & same_thr_fe;
   assign retract_iferr_d =  erb_dtu_ifeterr_d1 & fcl_dtu_inst_vld_d & 
                             same_thr_de;

   // mul_inst is already already qualified with inst_vld
   // so is fpop
   // don't set retract if there is an iferr, since this will cancel
   // the pending imisses!  
   assign dtu_fcl_retract_d = ((dec_swl_mul_inst_d & swl_dec_mulbusy_e | 
			                          dec_swl_div_inst_d & swl_dec_divbusy_e |
			                          dec_swl_allfp_d & fpbusy_local_e) &
                                // & swl_dec_fp_enable_d 
                               fcl_dtu_inst_vld_d |
                               retract_store_d  
//                             |  retract_iferr_d
                               );

   // what does this do???
   // no need to stall after retract since thread is already switched out
//   assign retract_stall_d = (dec_swl_mul_inst_d & swl_dec_mulbusy_e | 
//			                       dec_swl_div_inst_d & swl_dec_divbusy_e |
//			                       dec_swl_allfp_d & swl_dec_fp_enable_d & 
//                             fpbusy_local_e);

   assign mul_wait_nxt = ({4{dec_swl_mul_inst_d & swl_dec_mulbusy_e &
                             fcl_dtu_inst_vld_d & ~iferr_d}} &
			                 thr_d  & ~rt_st_thr_e | mul_done |   // set
			                 mul_wait & ~retr_thr_wakeup  & ~killed_uniop_done_e) & 
			                 (~trp_no_retr);

   dffr_s #(4) mw_ff(.din (mul_wait_nxt[3:0]),
		               .q   (mul_wait[3:0]),
		               .clk (clk),
		               .rst (dtu_reset),
		               .se(se), .si(), .so());
   assign mul_wait_any = (|mul_wait[3:0]);
   
   assign div_wait_nxt =  ({4{dec_swl_div_inst_d & swl_dec_divbusy_e &
                              fcl_dtu_inst_vld_d & ~iferr_d}} & 
                        thr_d  & ~rt_st_thr_e | div_done | // set 
			                  div_wait & ~retr_thr_wakeup & ~killed_uniop_done_e) & 
			                  (~trp_no_retr);
   
   dffr_s #(4) dw_ff(.din (div_wait_nxt[3:0]),
		               .q   (div_wait[3:0]),
		               .clk (clk),
		               .rst (dtu_reset),
		               .se(se), .si(), .so());
   assign div_wait_any = (|div_wait[3:0]);

   assign fp_wait_nxt =  ({4{dec_swl_allfp_d & // swl_dec_fp_enable_d & 
                             fcl_dtu_inst_vld_d & fpbusy_local_e &
                             ~iferr_d}} &
			                    thr_d  & ~rt_st_thr_d & ~rt_st_thr_e |
                          fp_done |    // set 
			                    fp_wait & ~retr_thr_wakeup & ~killed_uniop_done_e) & 
			                     (~trp_no_retr);
   
   dffr_s #(4) fw_ff(.din (fp_wait_nxt[3:0]),
		               .q   (fp_wait[3:0]),
		               .clk (clk),
		               .rst (dtu_reset),
		               .se(se), .si(), .so());
   assign fp_wait_any = (|fp_wait[3:0]);

   // wake up waiting threads when the unit is no longer busy
   // need to qual with trp_no_retr since trp can occur at the same
   // time as unit becoming unbusy.  
   assign mul_wake = mul_wait & {4{~true_mulbusy_e}} & ~trp_no_retr;
   assign div_wake = div_wait & {4{~true_divbusy_e}} & ~trp_no_retr;
   assign fp_wake  = fp_wait & {4{~true_fpbusy_e}} & ~trp_no_retr;
			      
//   assign retr_thr_wakeup = (mul_wait & {4{~swl_dec_mulbusy_e}} |
//	                     div_wait & {4{~swl_dec_divbusy_e}} | 
//	                     fp_wait & {4{~fpbusy_local_e}} | 
//			     wm_stbwait & stb_retry);

   assign retr_thr_wakeup = mul_wake | div_wake | fp_wake;
//	                  |  (wm_stbwait & stb_retry & ~wm_other);
   
   assign fp_thr[0] = ~ffu_ifu_tid_w2[1] & ~ffu_ifu_tid_w2[0];
   assign fp_thr[1] = ~ffu_ifu_tid_w2[1] &  ffu_ifu_tid_w2[0];
   assign fp_thr[2] =  ffu_ifu_tid_w2[1] & ~ffu_ifu_tid_w2[0];
   assign fp_thr[3] =  ffu_ifu_tid_w2[1] &  ffu_ifu_tid_w2[0];

   // Delay mul div completion to prevent one thread from hogging mul and div
   assign mul_done = exu_ifu_longop_done_g & mul_busy_e & {4{mul_wait_any}};
   assign div_done = exu_ifu_longop_done_g & div_busy_e & {4{div_wait_any}};
   assign fp_done = fp_thr & {4{ffu_ifu_fpop_done_w2}} & {4{fp_wait_any}};   

   assign fp_thrrdy = fp_thr & {4{ffu_ifu_fpop_done_w2}} & {4{~fp_wait_any}};
   
   // don't complete if another mul/div is waiting
   assign exu_lop_done = (exu_ifu_longop_done_g & 
			                    (~mul_busy_e | {4{~mul_wait_any}}) &
			                    (~div_busy_e | {4{~div_wait_any}}));

   // TBD:
   // 1.  Put in similar wakeup sequence for fp completion -- done
   // 2.  Is it worth doing a round robin wakeup when a deadlock problem
   //     exists even in that case? -- no need with lru scheduler

   
   //--------------------------
   // Store buffer flow control
   //--------------------------
   // store pipe
   assign st_inst_qual_d = dec_swl_st_inst_d & fcl_dtu_inst_vld_d;
   dff_s ste_ff(.din (st_inst_qual_d),
	            .q   (st_inst_e),
	            .clk (clk),
	            .se  (se), .si(), .so());
   assign st_inst_qual_e = st_inst_e & ~dtu_inst_anull_e;

   dff_s stm_ff(.din (st_inst_qual_e),
	            .q   (st_inst_m),
	            .clk (clk),
	            .se  (se), .si(), .so());
   dff_s stg_ff(.din (st_inst_m),
	            .q   (st_inst_g),
	            .clk (clk),
	            .se  (se), .si(), .so());

//   assign st_inst_qual_g = st_inst_g & ifu_tlu_inst_vld_w;
//   dff stw2_ff(.din (st_inst_qual_g),
//	             .q   (st_inst_w2),
//	             .clk (clk),
//               .se  (se), .si(), .so());

   // determine which of the above thread is to the D thread
   assign same_thr_de = (thr_d[0] & thr_e[0] |
			                   thr_d[1] & thr_e[1] |
			                   thr_d[2] & thr_e[2] |
			                   thr_d[3] & thr_e[3]);
   assign same_thr_dg = (thr_d[0] & thr_w[0] |
			                   thr_d[1] & thr_w[1] |
			                   thr_d[2] & thr_w[2] |
			                   thr_d[3] & thr_w[3]);

   assign same_thr_fd = (thr_f[0] & thr_d[0] |
			                   thr_f[1] & thr_d[1] |
			                   thr_f[2] & thr_d[2] |
			                   thr_f[3] & thr_d[3]);
   assign same_thr_fe = (thr_f[0] & thr_e[0] |
			                   thr_f[1] & thr_e[1] |
			                   thr_f[2] & thr_e[2] |
			                   thr_f[3] & thr_e[3]);
   assign same_thr_fm = (thr_f[0] & thr_m[0] |
			                   thr_f[1] & thr_m[1] |
			                   thr_f[2] & thr_m[2] |
			                   thr_f[3] & thr_m[3]);
   assign same_thr_fg = (thr_f[0] & thr_w[0] |
			                   thr_f[1] & thr_w[1] |
			                   thr_f[2] & thr_w[2] |
			                   thr_f[3] & thr_w[3]);

   assign pipe_st_e = same_thr_fe & st_inst_e;
   assign pipe_st_m = same_thr_fm & st_inst_m;
   assign pipe_st_g = same_thr_fg & st_inst_g;
   assign pipe_st_d = same_thr_fd & st_inst_qual_d;

   dff_s #(1) pste_ff(.din (pipe_st_d),
                    .q   (st_thisthr_e),
                    .clk (clk), .se(se), .si(), .so());

   // count the number of stores in the pipe to this thread (0-4)
   assign pipe_st_cnt_ge1 = pipe_st_e | pipe_st_m | pipe_st_g;
//	                          pipe_st_w2;

   assign pipe_st_cnt_ge2 = (pipe_st_e & pipe_st_m |
			                       pipe_st_e & pipe_st_g |
                             pipe_st_m & pipe_st_g);

//   assign pipe_st_cnt_ge2 = (pipe_st_e & pipe_st_m |
//			                       pipe_st_e & pipe_st_g |
//			                       pipe_st_e & pipe_st_w2 |
//			                       pipe_st_m & pipe_st_g |
//			                       pipe_st_m & pipe_st_w2 |
//	                           pipe_st_g & pipe_st_w2);

   assign pipe_st_cnt_ge3 = (pipe_st_e & pipe_st_m & pipe_st_g);
//			                       pipe_st_e & pipe_st_m & pipe_st_w2 |
//			                       pipe_st_e & pipe_st_g & pipe_st_w2 |
//			                       pipe_st_m & pipe_st_g & pipe_st_w2);

//   assign pipe_st_cnt_eq4 = pipe_st_e & pipe_st_m & pipe_st_g & 
//	                          pipe_st_w2;

   dff_s #(3) pstc_reg(.din ({pipe_st_cnt_ge1,
                            pipe_st_cnt_ge2,
                            pipe_st_cnt_ge3}),
                     .q   ({dst_cnt_ge1,
                            dst_cnt_ge2,
                            dst_cnt_ge3}),
                     .clk (clk), .se(se), .si(), .so());
   
   // get the number of taken store buffer entries to this thread
   mux4ds #(4) stbcnt_mux(.dout (stbcnt_s),
			                    .in0  (lsu_ifu_stbcnt0),
			                    .in1  (lsu_ifu_stbcnt1),
			                    .in2  (lsu_ifu_stbcnt2),
			                    .in3  (lsu_ifu_stbcnt3),
			                    .sel0 (thr_f[0]),
			                    .sel1 (thr_f[1]),
			                    .sel2 (thr_f[2]),
			                    .sel3 (thr_f[3]));

   dff_s #(4) stbd_reg(.din (stbcnt_s),
		                 .q   (stbcnt_d),
		                 .clk (clk),
		                 .se  (se), .si(), .so());

   assign all_dst_ge1 = dst_cnt_ge1 | st_thisthr_e;
   assign all_dst_ge2 = dst_cnt_ge1 & st_thisthr_e | dst_cnt_ge2;
   assign all_dst_ge3 = dst_cnt_ge2 & st_thisthr_e | dst_cnt_ge3;
   assign all_dst_eq4 = dst_cnt_ge3 & st_thisthr_e;

   // switch if taken entries + stores in pipe >= 8
   assign switch_store_d = stbcnt_d[3] & fcl_dtu_inst_vld_d | // 8
	            dec_swl_st_inst_d & fcl_dtu_inst_vld_d & 
	            (stbcnt_d[2] & stbcnt_d[1] & stbcnt_d[0] | // 7
		           stbcnt_d[2] & stbcnt_d[1] & all_dst_ge1 | // 6 + 1
		           stbcnt_d[2] & stbcnt_d[0] & all_dst_ge2 | // 5 + 2
		           stbcnt_d[2]               & all_dst_ge3 | // 4 + 3
		           stbcnt_d[1] & stbcnt_d[0] & all_dst_eq4); // 3 + 4

   assign stb_stall = {4{switch_store_d}} & thr_d;
   assign stb_blocked = {lsu_ifu_stbcnt3[3], lsu_ifu_stbcnt2[3],
			                   lsu_ifu_stbcnt1[3], lsu_ifu_stbcnt0[3]};

   dff_s #(4) stbb_reg(.din (stb_blocked),
		                 .q   (stb_blocked_d1),
		                 .clk (clk), .se(se), .si(), .so());
   
   // retract this thread if taken entries + stores in pipe >= 9
   assign retract_store_d = dec_swl_st_inst_d & fcl_dtu_inst_vld_d &
	        (stbcnt_d[3] | // 8
	         stbcnt_d[2] & stbcnt_d[1] & stbcnt_d[0] & all_dst_ge1 | // 7 + 1
	         stbcnt_d[2] & stbcnt_d[1] & all_dst_ge2 |  // 6 + 2
	         stbcnt_d[2] & stbcnt_d[0] & all_dst_ge3 |  // 5 + 3
	         stbcnt_d[2] & all_dst_eq4);                // 4 + 4

   // remember if we retracted a store so that we can clear wmo in 
   // the next cycle
   assign retract_st_next_d = (retract_store_d | retract_iferr_d) & 
                              ~(same_thr_dg & rollback_g) & 
                              ~trp_noretr_d;
   
   dff_s #(1) retr_se(.din (retract_st_next_d),
		                .q   (retract_store_e),
		                .clk (clk), .se (se), .si(), .so());

   // clear wmo if you set it already
   assign clear_wmo_e = retract_store_e & (swc_d & same_thr_de | swc_e);
// assign clear_wmo_e = retract_store_e;   


   // mark a switched out thread for wakeup
//   assign stb_wait_nxt = ({4{switch_store_d}} & thr_d & ~rb_thr_w |   // set
//			                    wm_stbwait & ~stb_retry 
//  			                ~(thr_d & {4{swc_d}}) & 
//			                    ~(thr_e & {4{dec_swl_sta_inst_e & 
//				                               lsu_ifu_ldsta_internal_e}})   // reset
//			                    ) & ~trp_no_retr;  // this reset wins

//   assign stb_wait_nxt = ({4{switch_store_d}} & thr_d & ~rb_thr_w |   // set
//			                    wm_stbwait & ~stb_retry) & ~trp_no_retr;

   assign stb_wait_nxt = ({4{switch_store_d}} & thr_d |   // set
			                    wm_stbwait & ~stb_retry);
   
   dffr_s #(4) stbw_reg(.din (stb_wait_nxt),
		                  .q   (wm_stbwait),
		                  .clk (clk),
		                  .rst (dtu_reset),
		                  .se  (se), .si(), .so());

   // count to 4 and retry 
   dff_s stbrete_ff(.din (switch_store_d),
		              .q   (sw_st_e),
		              .clk (clk),
		              .se  (se), .si(), .so());
   dff_s stbretm_ff(.din (sw_st_e),
		              .q   (sw_st_m),
		              .clk (clk),
		              .se  (se), .si(), .so());
   dff_s stbretg_ff(.din (sw_st_m),
		              .q   (sw_st_g),
		              .clk (clk),
		              .se  (se), .si(), .so());
   dff_s stbretw2_ff(.din (sw_st_g),
		               .q   (sw_st_w2),
		               .clk (clk),
		               .se  (se), .si(), .so());
//   assign stb_retry = {4{sw_st_w2}} & st_thr_w2 & ~stb_blocked;

   assign st_in_pipe = ({4{sw_st_e}} & thr_e |
			                  {4{sw_st_m}} & thr_m |
			                  {4{sw_st_g}} & thr_w |
			                  {4{sw_st_w2}} & st_thr_w2);

   // don't really need to AND with wm_stbwait with current logic, but
   // for future use, this is left as is 
   assign stb_retry = ~stb_blocked_d1 & ~st_in_pipe & wm_stbwait;


   //
   // Quad Stores
   //
   dff_s #(1) stde_ff(.din (dec_swl_std_inst_d),
		                .q   (std_inst_e),
		                .clk (clk), .se(se), .si(), .so());

//   assign stq_inst_e = std_inst_e & lsu_ifu_quad_asi_e & fcl_dtu_inst_vld_e;
   assign std_done_e = std_inst_e & ~lsu_ifu_quad_asi_e & fcl_dtu_inst_vld_e;
   dff_s #(1) stdm_ff(.din (std_done_e),
		                .q   (std_done_m),
		                .clk (clk), .se(se), .si(), .so());
   
//   dff #(1) stqm_ff(.din (stq_inst_e),
//		                .q   (stq_inst_m),
//		                .clk (clk), .se(se), .si(), .so());
//   dff #(1) stqw_ff(.din (stq_inst_m),
//		                .q   (stq_inst_w),
//		                .clk (clk), .se(se), .si(), .so());
//   dff #(1) stqw2_ff(.din (stq_inst_w),
//		                 .q   (stq_inst_w2),
//		                 .clk (clk), .se(se), .si(), .so());

//   assign stq_in_pipe = ({4{stq_inst_m}} & thr_m |
//			                   {4{stq_inst_w}} & thr_w |
//			                   {4{stq_inst_w2}} & st_thr_w2);

//   assign stq_busy = (stq_in_pipe | lsu_ifu_stq_busy);
//   assign stq_wait_next = thr_e & {4{stq_inst_e}} | 
//                 			    stq_wait & stq_busy;
   
//   dffr #(4) stqwait_reg(.din (stq_wait_next),
//		                     .q   (stq_wait),
//		                     .rst (dtu_reset),
//		                     .clk (clk), .se(se), .si(), .so());
//
//   assign stq_done_thr = stq_wait & ~stq_busy | thr_m & {4{std_done_m}};
   
   
   //-----------------------------
   // FPRS
   //-----------------------------
   dff_s #(3) wrtd_w_reg(.din (thr_config_in_m[2:0]),
                        .q   (thr_config_in_w[2:0]),
                        .clk (clk), .se(se), .si(), .so());

   dff_s #(3) wrtd_w2_reg(.din (thr_config_in_w[2:0]),
                        .q   (thr_config_in_w2[2:0]),
                        .clk (clk), .se(se), .si(), .so());
   
   assign fprs_wrt_data = thr_config_in_w2;
   mux3ds #(3) fprs_mx0(.dout (fprs0_nxt),
		                    .in0  (fprs_wrt_data),
		                    .in1  (fprs0),
		                    .in2  ({fprs0[2], new_fprs[1:0]}),
		                    .sel0 (fprs_sel_wrt[0]),
		                    .sel1 (fprs_sel_old[0]),
		                    .sel2 (fprs_sel_set[0]));
   mux3ds #(3) fprs_mx1(.dout (fprs1_nxt),
		                    .in0  (fprs_wrt_data),
		                    .in1  (fprs1),
		                    .in2  ({fprs1[2], new_fprs[1:0]}),
		                    .sel0 (fprs_sel_wrt[1]),
		                    .sel1 (fprs_sel_old[1]),
		                    .sel2 (fprs_sel_set[1]));
   mux3ds #(3) fprs_mx2(.dout (fprs2_nxt),
		                    .in0  (fprs_wrt_data),
		                    .in1  (fprs2),
		                    .in2  ({fprs2[2], new_fprs[1:0]}),
		                    .sel0 (fprs_sel_wrt[2]),
		                    .sel1 (fprs_sel_old[2]),
		                    .sel2 (fprs_sel_set[2]));
   mux3ds #(3) fprs_mx3(.dout (fprs3_nxt),
		                    .in0  (fprs_wrt_data),
		                    .in1  (fprs3),
		                    .in2  ({fprs3[2], new_fprs[1:0]}),
		                    .sel0 (fprs_sel_wrt[3]),
		                    .sel1 (fprs_sel_old[3]),
		                    .sel2 (fprs_sel_set[3]));

   // make resettable for now.  Eventually change to non-reset
   // Done
   dff_s #(3) t0_fprs(.din (fprs0_nxt),
		                 .q   (fprs0),
//		                 .rst (dtu_reset),
		                 .clk (clk), .se(se), .si(), .so());
   dff_s #(3) t1_fprs(.din (fprs1_nxt),
		                 .q   (fprs1),
//		                 .rst (dtu_reset),
		                 .clk (clk), .se(se), .si(), .so());
   dff_s #(3) t2_fprs(.din (fprs2_nxt),
		                 .q   (fprs2),
//		                 .rst (dtu_reset),
		                 .clk (clk), .se(se), .si(), .so());
   dff_s #(3) t3_fprs(.din (fprs3_nxt),
		                 .q   (fprs3),
//		                 .rst (dtu_reset),
		                 .clk (clk), .se(se), .si(), .so());

   assign fprs_en_s = {fprs3[2],fprs2[2],fprs1[2],fprs0[2]};
   assign fpen_vec_s = (tlu_ifu_pstate_pef & fprs_en_s & thr_f);
   assign fpen_s = (|fpen_vec_s[3:0]);
   dff_s #(1) fpend_ff(.din (fpen_s),
		                 .q   (swl_dec_fp_enable_d),
		                 .clk (clk), .se(se), .si(), .so());

   // unprotected since synopsys does not use one hot mux
   mux4ds #(3) curr_fprs_mx(.dout (fprs_d),
			                      .in0  (fprs0),
			                      .in1  (fprs1),
			                      .in2  (fprs2),
			                      .in3  (fprs3),
			                      .sel0 (thr_d[0]),
			                      .sel1 (thr_d[1]),
			                      .sel2 (thr_d[2]),
			                      .sel3 (thr_d[3]));

   dff_s #(3) fprse_reg(.din (fprs_d),
		                  .q   (fprs_e),
		                  .clk (clk), .se(se), .si(), .so());

   assign new_fprs[1] = dec_swl_frf_upper_d | fprs_d[1];
   assign new_fprs[0] = dec_swl_frf_lower_d | fprs_d[0];

   // writes to fprs are done by software
   assign wrt_fprs_w = ifu_tlu_inst_vld_w & dec_swl_wrtfprs_w &
			                 ~flush_all_w;

   dff_s #(1) fpwr_ff(.din (wrt_fprs_w),
                    .q   (wrt_fprs_w2),
                    .clk (clk), .se(se), .si(), .so());
   
   assign sel_wrt = st_thr_w2 & {4{wrt_fprs_w2}};
   assign fprs_sel_set = thr_d & {4{dec_swl_fpop_d & swl_dec_fp_enable_d &
                                    fcl_dtu_inst_vld_d}};
   assign fprs_sel_wrt = ~fprs_sel_set & sel_wrt;
   assign fprs_sel_old = ~sel_wrt & ~fprs_sel_set;

   sink #(52) s0(.in (thrconf_out_e));
   
   
endmodule // sparc_ifu_swl

// Local Variables:
// verilog-library-directories:("../../rtl" ".")
// End:
   
