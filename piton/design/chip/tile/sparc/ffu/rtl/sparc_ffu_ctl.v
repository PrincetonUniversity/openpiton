// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ffu_ctl.v
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
//  Module Name: sparc_ffu_ctl
//	Description: This is the ffu control block.
*/

`include "iop.h"
`define FSR_NVA   9
`define FSR_OFA   8
`define FSR_UFA   7
`define FSR_DZA   6
`define FSR_NXA   5
`define FSR_NVC   4
`define FSR_OFC   3
`define FSR_UFC   2
`define FSR_DZC   1
`define FSR_NXC   0


module sparc_ffu_ctl (/*AUTOARG*/
   // Outputs
   ffu_exu_rsr_data_mid_m, ffu_exu_rsr_data_lo_m, 
   ffu_exu_rsr_data_hi_m, ctl_vis_subtract, ctl_vis_sel_log, 
   ctl_vis_sel_align, ctl_vis_sel_add, ctl_vis_log_sel_xor, 
   ctl_vis_log_sel_pass, ctl_vis_log_sel_nor, ctl_vis_log_sel_nand, 
   ctl_vis_log_pass_rs2, ctl_vis_log_pass_rs1, 
   ctl_vis_log_pass_const, ctl_vis_log_invert_rs2, 
   ctl_vis_log_invert_rs1, ctl_vis_log_constant, ctl_vis_cin, 
   ctl_vis_align_odd, ctl_vis_align6, ctl_vis_align4, ctl_vis_align2, 
   ctl_vis_align0, ctl_vis_add32, ctl_dp_wsr_data_w2, ctl_dp_thr_e, 
   ctl_dp_gsr_wsr_w2, so, ctl_dp_rst_l, ffu_ifu_fpop_done_w2, 
   ffu_ifu_cc_vld_w2, ffu_ifu_cc_w2, ffu_ifu_tid_w2, 
   ffu_ifu_stallreq, ffu_ifu_ecc_ce_w2, ffu_ifu_ecc_ue_w2, 
   ffu_ifu_err_reg_w2, ffu_ifu_err_synd_w2, ffu_ifu_fst_ce_w, 
   ffu_lsu_kill_fst_w, ffu_ifu_inj_ack, ffu_lsu_data, 
   ffu_lsu_fpop_rq_vld, ffu_lsu_blk_st_va_e, ffu_lsu_blk_st_e, 
   ffu_tlu_trap_ieee754, ffu_tlu_trap_other, ffu_tlu_trap_ue, 
   ffu_tlu_ill_inst_m, ffu_tlu_fpu_tid, ffu_tlu_fpu_cmplt, 
   ctl_frf_ren, ctl_frf_wen, ctl_frf_addr, ctl_dp_fp_thr, 
   ctl_dp_fcc_w2, ctl_dp_ftt_w2, ctl_dp_exc_w2, ctl_dp_ecc_sel_frf, 
   ctl_dp_output_sel_rs1, ctl_dp_output_sel_rs2, 
   ctl_dp_output_sel_frf, ctl_dp_output_sel_fsr, ctl_dp_rs2_frf_read, 
   ctl_dp_rs2_sel_vis, ctl_dp_rs2_sel_fpu_lsu, ctl_dp_rs2_keep_data, 
   ctl_dp_rd_ecc, ctl_dp_fsr_sel_ld, ctl_dp_fsr_sel_fpu, 
   ctl_dp_fsr_sel_old, ctl_dp_noshift64_frf, ctl_dp_shift_frf_right, 
   ctl_dp_shift_frf_left, ctl_dp_zero_low32_frf, ctl_dp_new_rs1, 
   ctl_dp_sign, ctl_dp_flip_fpu, ctl_dp_flip_lsu, ctl_dp_noflip_fpu, 
   ctl_dp_noflip_lsu, ctl_frf_write_synd, 
   // Inputs
   ifu_tlu_sraddr_d, exu_ffu_wsr_inst_e, exu_ffu_gsr_scale_m, 
   exu_ffu_gsr_rnd_m, exu_ffu_gsr_mask_m, exu_ffu_gsr_align_m, 
   dp_ctl_gsr_scale_e, dp_ctl_gsr_mask_e, rclk, si, se, grst_l, 
   arst_l, rst_tri_en, dp_ctl_rs2_sign, cpx_vld, cpx_fcmp, cpx_req, 
   cpx_fccval, cpx_fpexc, dp_ctl_fsr_fcc, dp_ctl_fsr_rnd, 
   dp_ctl_fsr_tem, dp_ctl_fsr_aexc, dp_ctl_fsr_cexc, 
   dp_ctl_synd_out_low, dp_ctl_synd_out_high, ifu_ffu_fpop1_d, 
   ifu_ffu_fpop2_d, ifu_ffu_visop_d, ifu_ffu_fpopcode_d, 
   ifu_ffu_frs1_d, ifu_ffu_frs2_d, ifu_ffu_frd_d, ifu_ffu_fld_d, 
   ifu_ffu_fst_d, ifu_ffu_ldst_single_d, ifu_ffu_tid_d, 
   ifu_ffu_fcc_num_d, ifu_ffu_mvcnd_m, ifu_ffu_inj_frferr, 
   ifu_exu_ecc_mask, ifu_ffu_ldfsr_d, ifu_ffu_ldxfsr_d, 
   ifu_ffu_stfsr_d, ifu_ffu_quad_op_e, ifu_tlu_inst_vld_w, 
   lsu_ffu_flush_pipe_w, ifu_tlu_flush_w, lsu_ffu_ack, 
   lsu_ffu_ld_vld, lsu_ffu_bld_cnt_w, dp_ctl_ld_fcc, ifu_exu_nceen_e, 
   ifu_exu_disable_ce_e, lsu_ffu_blk_asi_e, exu_ffu_ist_e, 
   ifu_tlu_flsh_inst_e, ifu_lsu_ld_inst_e, lsu_ffu_stb_full0, 
   lsu_ffu_stb_full1, lsu_ffu_stb_full2, lsu_ffu_stb_full3,
//sotheas,8/17/04: fixed eco 6529
   lsu_ffu_st_dtlb_perr_g
//////////////////////////////
   ) ;
   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   input [31:0]         dp_ctl_gsr_mask_e;      // To visctl of sparc_ffu_ctl_visctl.v
   input [4:0]          dp_ctl_gsr_scale_e;     // To visctl of sparc_ffu_ctl_visctl.v
   input [2:0]          exu_ffu_gsr_align_m;    // To visctl of sparc_ffu_ctl_visctl.v
   input [31:0]         exu_ffu_gsr_mask_m;     // To visctl of sparc_ffu_ctl_visctl.v
   input [2:0]          exu_ffu_gsr_rnd_m;      // To visctl of sparc_ffu_ctl_visctl.v
   input [4:0]          exu_ffu_gsr_scale_m;    // To visctl of sparc_ffu_ctl_visctl.v
   input                exu_ffu_wsr_inst_e;     // To visctl of sparc_ffu_ctl_visctl.v
   input [6:0]          ifu_tlu_sraddr_d;       // To visctl of sparc_ffu_ctl_visctl.v
   // End of automatics
   input rclk;
   input si;
   input se;
   input grst_l;
   input arst_l;
   input rst_tri_en;
   input [1:0] dp_ctl_rs2_sign;

   input          cpx_vld;
   input          cpx_fcmp;
   input [3:0]    cpx_req;
   input [1:0]    cpx_fccval;
   input [4:0]    cpx_fpexc;
   input [7:0] dp_ctl_fsr_fcc;
   input [1:0] dp_ctl_fsr_rnd;
   input [4:0] dp_ctl_fsr_tem;
	 input [4:0] dp_ctl_fsr_aexc;
	 input [4:0] dp_ctl_fsr_cexc;

   input [6:0] dp_ctl_synd_out_low;   // signals for ecc errors
   input [6:0] dp_ctl_synd_out_high;

   input       ifu_ffu_fpop1_d;
   input       ifu_ffu_fpop2_d;
   input       ifu_ffu_visop_d;
   input [8:0] ifu_ffu_fpopcode_d;
   input [4:0] ifu_ffu_frs1_d;
   input [4:0] ifu_ffu_frs2_d;
   input [4:0] ifu_ffu_frd_d;
   input       ifu_ffu_fld_d;
   input       ifu_ffu_fst_d;
   input       ifu_ffu_ldst_single_d;
   input [1:0] ifu_ffu_tid_d;
   input [1:0] ifu_ffu_fcc_num_d;
   input       ifu_ffu_mvcnd_m;

   input       ifu_ffu_inj_frferr;
   input [6:0] ifu_exu_ecc_mask;

   input       ifu_ffu_ldfsr_d,
	       ifu_ffu_ldxfsr_d,
	       ifu_ffu_stfsr_d;
   input       ifu_ffu_quad_op_e;
   
   input       ifu_tlu_inst_vld_w;
   input       lsu_ffu_flush_pipe_w;
   input       ifu_tlu_flush_w;
   
   input        lsu_ffu_ack;
   input        lsu_ffu_ld_vld;
   input [2:0]  lsu_ffu_bld_cnt_w;
   input [7:0]  dp_ctl_ld_fcc;

   input        ifu_exu_nceen_e;// enable ecc traps
   input        ifu_exu_disable_ce_e; // all ce are treated as ue
   input        lsu_ffu_blk_asi_e;
   input        exu_ffu_ist_e;
   input        ifu_tlu_flsh_inst_e;
   input        ifu_lsu_ld_inst_e;
   input        lsu_ffu_stb_full0;
   input        lsu_ffu_stb_full1;
   input        lsu_ffu_stb_full2;
   input        lsu_ffu_stb_full3;

   input        lsu_ffu_st_dtlb_perr_g; //sotheas,8/17/04: fixed eco 6529, when asserted terminated
                                        //                 block store

   /*AUTOOUTPUT*/
   // Beginning of automatic outputs (from unused autoinst outputs)
   output [3:0]         ctl_dp_gsr_wsr_w2;      // From visctl of sparc_ffu_ctl_visctl.v
   output [3:0]         ctl_dp_thr_e;           // From visctl of sparc_ffu_ctl_visctl.v
   output [36:0]        ctl_dp_wsr_data_w2;     // From visctl of sparc_ffu_ctl_visctl.v
   output               ctl_vis_add32;          // From visctl of sparc_ffu_ctl_visctl.v
   output               ctl_vis_align0;         // From visctl of sparc_ffu_ctl_visctl.v
   output               ctl_vis_align2;         // From visctl of sparc_ffu_ctl_visctl.v
   output               ctl_vis_align4;         // From visctl of sparc_ffu_ctl_visctl.v
   output               ctl_vis_align6;         // From visctl of sparc_ffu_ctl_visctl.v
   output               ctl_vis_align_odd;      // From visctl of sparc_ffu_ctl_visctl.v
   output               ctl_vis_cin;            // From visctl of sparc_ffu_ctl_visctl.v
   output               ctl_vis_log_constant;   // From visctl of sparc_ffu_ctl_visctl.v
   output               ctl_vis_log_invert_rs1; // From visctl of sparc_ffu_ctl_visctl.v
   output               ctl_vis_log_invert_rs2; // From visctl of sparc_ffu_ctl_visctl.v
   output               ctl_vis_log_pass_const; // From visctl of sparc_ffu_ctl_visctl.v
   output               ctl_vis_log_pass_rs1;   // From visctl of sparc_ffu_ctl_visctl.v
   output               ctl_vis_log_pass_rs2;   // From visctl of sparc_ffu_ctl_visctl.v
   output               ctl_vis_log_sel_nand;   // From visctl of sparc_ffu_ctl_visctl.v
   output               ctl_vis_log_sel_nor;    // From visctl of sparc_ffu_ctl_visctl.v
   output               ctl_vis_log_sel_pass;   // From visctl of sparc_ffu_ctl_visctl.v
   output               ctl_vis_log_sel_xor;    // From visctl of sparc_ffu_ctl_visctl.v
   output               ctl_vis_sel_add;        // From visctl of sparc_ffu_ctl_visctl.v
   output               ctl_vis_sel_align;      // From visctl of sparc_ffu_ctl_visctl.v
   output               ctl_vis_sel_log;        // From visctl of sparc_ffu_ctl_visctl.v
   output               ctl_vis_subtract;       // From visctl of sparc_ffu_ctl_visctl.v
   output [31:0]        ffu_exu_rsr_data_hi_m;  // From visctl of sparc_ffu_ctl_visctl.v
   output [7:0]         ffu_exu_rsr_data_lo_m;  // From visctl of sparc_ffu_ctl_visctl.v
   output [2:0]         ffu_exu_rsr_data_mid_m; // From visctl of sparc_ffu_ctl_visctl.v
   // End of automatics
   output               so;
   output               ctl_dp_rst_l;
   output       ffu_ifu_fpop_done_w2;
   output [3:0] ffu_ifu_cc_vld_w2;// one hot valid for each set of fcc
   output [7:0] ffu_ifu_cc_w2;// all 4 sets of fcc
   output [1:0] ffu_ifu_tid_w2;
   output       ffu_ifu_stallreq; // stall pipe so blk st can issue
   
   output       ffu_ifu_ecc_ce_w2;  // correctable ecc error
   output       ffu_ifu_ecc_ue_w2;  // uncorrectable ecc error
   output [5:0] ffu_ifu_err_reg_w2;
   output [13:0] ffu_ifu_err_synd_w2;
   output       ffu_ifu_fst_ce_w;
   output       ffu_lsu_kill_fst_w;
   output       ffu_ifu_inj_ack;

   output [80:64] ffu_lsu_data;
   output 	  ffu_lsu_fpop_rq_vld ;   // ffu dispatches fpop issue request.
   output [5:3]  ffu_lsu_blk_st_va_e;
   output        ffu_lsu_blk_st_e;

   output 	  ffu_tlu_trap_ieee754;
   output 	  ffu_tlu_trap_other;
   output     ffu_tlu_trap_ue;
   output     ffu_tlu_ill_inst_m;

   output [1:0] ffu_tlu_fpu_tid;
   output       ffu_tlu_fpu_cmplt;
   
   output       ctl_frf_ren;
   output [1:0] ctl_frf_wen;
   output [6:0] ctl_frf_addr;

   output [3:0] ctl_dp_fp_thr;
   
   output [7:0] ctl_dp_fcc_w2;
   output [2:0] ctl_dp_ftt_w2;
   output [9:0] ctl_dp_exc_w2;

   output ctl_dp_ecc_sel_frf;
   

   // mux selects
   output       ctl_dp_output_sel_rs1;
   output 	ctl_dp_output_sel_rs2;
   output 	ctl_dp_output_sel_frf;
   output 	ctl_dp_output_sel_fsr;
   
   output 	ctl_dp_rs2_frf_read;
   output 	ctl_dp_rs2_sel_vis;
   output 	ctl_dp_rs2_sel_fpu_lsu;
   output 	ctl_dp_rs2_keep_data;
   output   ctl_dp_rd_ecc;

   output [3:0] ctl_dp_fsr_sel_ld,
		ctl_dp_fsr_sel_fpu,
		ctl_dp_fsr_sel_old;
   
   output 	ctl_dp_noshift64_frf;
   output 	ctl_dp_shift_frf_right;
   output 	ctl_dp_shift_frf_left;
   output 	ctl_dp_zero_low32_frf;
   
   output ctl_dp_new_rs1;
   
   output [1:0] ctl_dp_sign;
   
   output       ctl_dp_flip_fpu;
   output       ctl_dp_flip_lsu;
   output       ctl_dp_noflip_fpu;
   output       ctl_dp_noflip_lsu;


   wire     clk;
   wire     reset;
   wire     ffu_reset_l;
   // FPOP is broken into parts:
   // [8:4] fpop_high
   // [3:2] fpop_mid
   // [1:0] fpop_size
   wire         fpop_size_0;    // 2 lsbs of fpop
   wire         fpop_size_1;

   wire         fpop_high_0;    // 4 msbs of fpop
   wire         fpop_high_2;
   wire         fpop_high_4;
   wire         fpop_high_5; 
   wire         fpop_high_6; 
   wire         fpop_high_8;
   wire         fpop_high_a;
   wire         fpop_high_c;
   wire         fpop_high_d;
   wire         fpop_high_e;
   wire         fpop_high_10;
   wire         fpop_high_18;
   wire    fpop_low_1;
   wire    fpop_low_2;
   wire    fpop_low_4;
   wire    fpop_low_5;
   wire    fpop_low_6;
   wire    fpop_low_8;
   wire    fpop_low_9;
   wire    fpop_low_a;
   wire    fpop_low_d;
   wire    fpop_low_e;

   wire         source_single_e;
   wire         source_single_next;
   wire         source_single;

   wire         dest_single_e;
   wire         dest_single_next;
   wire         dest_single;

   wire [4:0]   frs1_e;
   wire [5:0]   rs1_e;
   wire [5:0]   rs1_next;
   wire [5:0]   rs1;
   wire [4:0]   frs2_e;
   wire [5:0]   rs2_e;
   wire [4:0]   frd_e;
   wire         ldst_single_e;
   wire [5:0]   rd_e;
   wire [5:1]   st_rd_d;
   wire [5:1]   write_addr;

   wire [5:0] 	rs2_next;
   wire [5:0] 	rs2;
   wire [5:0] 	rd_next;
   wire [5:0] 	rd;
   wire [5:1]   blk_rd;

   wire         is_fpop_d;
   wire    shift_frf_rs2_m;
   wire    shift_frf_rs1_w;
   wire    shift_frf_right_next;
   wire    shift_frf_right;
   wire    shift_frf_left_next;
   wire    shift_frf_left;
   wire    noshift64_frf_next;
   wire    noshift64_frf;

   wire 	abs_w;
   wire 	neg_w;
   wire 	cond_move_e;
   wire 	cond_move_m;
   wire 	move_e;
   wire 	move_m;
   wire 	move_m_valid;
   wire 	move_w;
   wire   move_w_valid;
   wire   move_w2;
   wire   move_w2_vld;
   wire   move_wen_m;
   wire   move_wen_w;
   wire 	move_wen_w2;
   wire 	move_wen_w2_valid;

   wire   vis_nofrf_e;
   wire 	ren_rs2_e;
   wire 	ren_rs2_e_vld;
   wire 	ren_rs2_m;
   wire 	ren_rs2_m_vld;
   wire 	ren_rs2_w;
   wire 	ren_rs2_w2;
   wire 	ren_rs2_w3;
   wire 	ren_rs2_w4;
   wire 	ren_rs1_e;
   wire 	ren_rs1_m;
   wire 	ren_rs1_w;
   wire 	ren_rs1_w_vld;
   wire 	ren_rs1_w2_vld;
   wire 	ren_rs1_w2;
   wire 	ren_rs1_w3;
   wire 	ren_rs1_w4;
   wire 	ren_rs1_w5;
   wire 	read_rs1;
   wire 	read_rs2;
   wire   read_rd;
   wire 	read_bst;

   wire 	fpu_op_e;
   wire 	fpu_op_m;
   wire 	fpu_op_w_vld;
   wire 	fpu_op_w;
   wire 	fpu_op_w2;
   wire 	fpu_op_w2_vld;
   wire 	fpu_op_w3;
   wire 	fpu_op_w3_vld;
   wire 	any_op_e;
   wire 	any_op_m;
   wire 	any_op_w;
   wire 	any_op_w2;
   wire 	any_op_m_valid;
   wire   visop_e;
   wire   visop_m;
   wire   visop_w_vld;
   
   wire 	fld_e;
   wire 	fld_m;
   wire 	fst_e;
   wire 	fst_m;
   wire 	fst_w;
   wire 	zero_lower_data_next;

   wire   fpop1_e;
   wire   fpop2_e;
   wire   fpop1_next;
   wire   fpop1;
   wire   fpop2_next;
   wire   fpop2;
   wire   visop_next;
   wire   visop;
   wire 	kill_m;
   wire 	killed_w;
   wire 	kill_w;
   wire 	kill_unimpl_w;
   wire 	kill_fp;
   wire 	kill_eccchk_w;
   wire   flush_w;
   wire   flush_w2;
   
   wire [1:0] 	tid_next;
   wire [1:0]   tid;
   wire [1:0]   extra_tid;
   wire [8:0] 	opf_next;
   wire [8:0] 	opf;
   wire [5:1] 	early_frf_rnum;
   wire [5:1] 	frf_rnum;
   wire [1:0]   frf_tid;
   wire [1:0]   fpu_rnd;

   wire 	thr_match_mw2;
   wire 	thr_match_ww2;
   wire 	thr_match_fpw2;
   wire [1:0] 	tid_e,
		tid_m,
		tid_w,
                tid_w2;

   wire 	fpop1_ready_w2_next;
   wire 	fpop2_ready_w3_next;
   wire 	fpop1_ready_w2;
   wire 	fpop2_ready_w3;
   wire   issue_fpop2;
   
   wire 	ldfsr,
		ldxfsr,
		stfsr_e,
		stfsr_w,
		stfsr_qual_w,
		ldfsr_vld,
		ldxfsr_vld;
   wire   stfsr_w2;
   wire   stfsr_w2_vld;
   
   wire   clear_ftt;
   
   wire [1:0] 	ldfsr_next;
   
   wire 	is_fpu_result;
   
   wire   output_sel_rs1_next;
   wire   output_sel_frf_next;
   wire   output_sel_fsr_next;
   wire   output_sel_rs2_next;
   wire   output_sel_rs1;
   wire   output_sel_frf;
   wire   output_sel_fsr;
   wire   output_sel_rs2;

   wire   ffu_op_done_next;
   wire   ffu_op_done;
   wire   ffu_op_done_vld;
   wire 	external_wen_next;
   wire 	lsu_pkt_vld;
   wire [1:0] 	lsu_pkt_type;
   wire 	store_ready;
   wire 	load_pending;
   wire 	load_pending_next;
   wire   blk_ld_done;
   wire   blk_ld_m;
   wire 	blk_load_pending;
   wire 	blk_load_pending_next;
   wire 	fp_pending,
		fp_pending_next;

   wire [3:0] 	fcc_num_dec;
   wire [1:0] 	fcc_num,
		fcc_num_next;
   
   wire [7:0] 	fpu_fcc;
   wire [9:0] 	fp_exc_w2;

   wire         fcc_sel_fpu;
   wire         fcc_sel_ldx;
   wire         fcc_sel_ld;
   wire         fcc_sel_old;
   wire 	cc_changed;
   wire 	rf_wen;
   wire   rf_wen_next;
   wire   rf_ecc_gen_next;
   wire   rf_ecc_gen;
   wire   vis_wen_next;
   wire   vis_result;

   wire [4:0] fsr_tem_d1;
   wire       ieee_trap;
   wire  	take_ieee_trap;
   wire 	take_other_trap;
   wire [4:0] 	ieee_trap_vec;
   wire 	fpexc_nxc;
   wire   fpexc_ofc;
   wire   fpexc_ufc;
   
   wire [1:0] error_detected;
   wire [1:0] possible_ue;
   wire [1:0] ce;
   wire [1:0] prev_err_detected;
   wire [1:0] prev_poss_ue;
   wire       rollback_fst_m;
   wire       rollback_fst_w;
   wire       rollback_rs2_w2;
   wire       rollback_rs1_w3;
   wire       rollback_c1_next;
   wire   rollback_c1;
   wire   rollback_c1_vld;
   wire   rollback_c2;
   wire   rollback_c3;
   wire   rolled_back_next;
   wire   rolled_back;
   wire   chk_rs1_w2;
   wire 	check_ecc_next;
   wire [1:0] chk_ecc_m;
   wire [1:0] chk_ecc_w;
   wire [1:0] chk_ecc_w2;
   wire [1:0] chk_ecc;
   wire [1:0] chk_ecc_prev;
   wire   disable_ce_m;
   wire   disable_ce_w;
   wire 	fst_ce_w;
   wire 	fst_ue_w;
   wire 	fst_ce_w2;
   wire 	fst_ue_w2;
   wire 	rs2_ce_w2;
   wire 	rs2_ue_w2;
   wire 	rs2_fst_ce_w2_vld;
   wire 	rs2_fst_ue_w2_vld;
   wire 	rs2_fst_ce_w3;
   wire 	rs2_fst_ue_w3;
   wire   rs1_ce_w3;
   wire 	ce_w3;
   wire 	ue_w3;
   wire   nceen;
   wire   nceen_next;
   wire   ue_trap_w3;
   wire [1:0] 	previous_ce;
   wire         previous_ue;
   wire [1:0] 	ecc_wen_next;
   wire [1:0] 	ecc_wen_gen_next;
   wire [1:0] 	ecc_wen_gen;
   wire [1:0] 	ecc_wen;
   wire 	inject_err_next;
   wire [6:0] 	err_data;
   wire 	inject_err;
   wire   wen_rs1_ecc;
   wire   wen_rs2_ecc;
   wire   ecc_kill_rs2_w2;
   wire [13:0] new_err_synd;
   wire [13:0] err_synd_d1;
   wire [13:0] err_synd_next;
   wire [5:0]  new_err_reg;
   wire [5:0]  err_reg_next;
   wire [5:0]  err_reg_d1;
   wire        log_new_err;
   wire   kill_st_ce_w;
   wire   possible_kill_st_ue_m;
   wire   possible_kill_st_ce_m;
   wire   possible_kill_st_ue_w;
   wire   possible_kill_st_ce_w;
   
   wire 	unimpl_op_e,
		unimpl_op_all_e,
		unimpl_op_m,
		unimpl_op_w,
		unimpl_qual_w,
		unimpl_qual_w2,
		unimpl_op_w2;
   wire    illegal_vis_e;
   wire    illegal_vis_m;
   wire    illegal_blk_m;
   wire    illegal_rs1_e;
   wire    illegal_field_e;
   wire    convert_op_e;
   
   wire          cpx_vld_d1;
   wire          cpx_fcmp_d1;
   wire [3:0]    cpx_req_d1;
   wire [1:0]    cpx_fccval_d1;
   wire [4:0]    cpx_fpexc_d1;

   wire   bst_m;
   wire   bst_w;
   wire   st_dtlb_perr_w2_l;
   wire   can_issue_bst_c2;
   wire   other_mem_op_e;
   wire [5:0] bst_rs;
   wire [2:0] bst_cnt;
   wire [2:0] bst_cnt_next;
   wire       bst_read_req;
   wire       bst_issue_c1;
   wire       bst_issue_c2;
   wire       bst_issue_c3;
   wire       bst_issue_c4;
   wire       bst_issue_c5;
   wire       bst_issue_c6;
   wire       bst_issue_c1_next;
   wire       bst_issue_c2_next;
   wire       bst_issue_c3_next;
   wire       bst_issue_c4_next;
   wire       bst_issue_c5_next;
   wire       bst_issue_c6_next;
   wire       bst_done;
   wire [2:0] bld_cnt_d1;
   wire [2:0] bld_cnt_d2;
   wire [2:0] bld_cnt_d3;
   wire       stb_full0;
   wire       stb_full1;
   wire       stb_full2;
   wire       stb_full3;
   wire       stb_full_c2;
   wire [5:0] bst_stall_cnt;
   wire [5:0] bst_stall_cnt_next;
   wire       bst_stall_req;
   wire       bst_stall_req_next;
   wire       fld_done;
   wire       ld_ret;
   wire   bst_ce_c4;
   wire   bst_ue_c4;
   wire   fixed_bst_ce;
   wire   fixed_bst_ce_next;
   wire   blk_asi_m;
   
//
// Code begins here
//
   assign clk = rclk;
   // Reset flop
    dffrl_async rstff(.din (grst_l),
                        .q   (ffu_reset_l),
                        .clk (clk),
                        .rst_l (arst_l), .si(), .so(), .se(se));
   assign        ctl_dp_rst_l = ffu_reset_l;
   assign        reset = ~ffu_reset_l;
   // Stage cpx data by one cycle
   dff_s #(13) cpx_dff(.din({cpx_vld, cpx_fcmp, cpx_req[3:0], cpx_fccval[1:0], cpx_fpexc[4:0]}),
                     .q({cpx_vld_d1, cpx_fcmp_d1, cpx_req_d1[3:0], cpx_fccval_d1[1:0], cpx_fpexc_d1[4:0]}),
                     .clk(clk), .se(se), .si(), .so());
   dff_s #(3) lsu_bld_cnt1_dff(.din({lsu_ffu_bld_cnt_w[2:0]}), .clk(clk),
                         .q({bld_cnt_d1[2:0]}), .se(se), .si(), .so());
   dff_s #(3) lsu_bld_cnt2_dff(.din({bld_cnt_d1[2:0]}), .clk(clk),
                         .q({bld_cnt_d2[2:0]}), .se(se), .si(), .so());
   dff_s #(3) lsu_bld_cnt3_dff(.din({bld_cnt_d2[2:0]}), .clk(clk),
                         .q({bld_cnt_d3[2:0]}), .se(se), .si(), .so());

//----------------------------------------
// Decode Instruction From IFU
//----------------------------------------
   dff_s #(3) fpop_d2e(.din({ifu_ffu_fpop1_d, ifu_ffu_fpop2_d, ifu_ffu_visop_d}), .clk(clk),
                     .q({fpop1_e, fpop2_e, visop_e}), .se(se), .si(), .so());
   assign        fpop1_next = (any_op_e | reset)? fpop1_e: fpop1;
   assign        fpop2_next = (any_op_e | reset)? fpop2_e: fpop2;
   assign        visop_next = (any_op_e | reset)? visop_e: visop;
   dff_s #(3) fpop_dff(.din({fpop1_next,fpop2_next,visop_next}),
                     .q({fpop1,fpop2,visop}),
                     .clk(clk), .se(se), .si(), .so());
   
   assign  fpop_size_0 = ~opf[1] & ~opf[0];
   assign  fpop_size_1 = ~opf[1] & opf[0];

   assign  fpop_low_1 = ~opf[3] & ~opf[2] & ~opf[1] & opf[0];
   assign  fpop_low_2 = ~opf[3] & ~opf[2] & opf[1] & ~opf[0];
   assign  fpop_low_4 = ~opf[3] & opf[2] & ~opf[1] & ~opf[0];
   assign  fpop_low_5 = ~opf[3] & opf[2] & ~opf[1] & opf[0];
   assign  fpop_low_6 = ~opf[3] & opf[2] & opf[1] & ~opf[0];
   assign  fpop_low_8 = opf[3] & ~opf[2] & ~opf[1] & ~opf[0];
   assign  fpop_low_9 = opf[3] & ~opf[2] & ~opf[1] & opf[0];
   assign  fpop_low_a = opf[3] & ~opf[2] & opf[1] & ~opf[0];
   assign  fpop_low_d = opf[3] & opf[2] & ~opf[1] & opf[0];
   assign  fpop_low_e = opf[3] & opf[2] & opf[1] & ~opf[0];
   
   assign  fpop_high_0 = ~opf[8] & ~opf[7] & ~opf[6] & ~opf[5] & ~opf[4];
   assign  fpop_high_2 = ~opf[8] & ~opf[7] & ~opf[6] & opf[5] & ~opf[4];
   assign  fpop_high_4 = ~opf[8] & ~opf[7] & opf[6] & ~opf[5] & ~opf[4];
   assign  fpop_high_5 = ~opf[8] & ~opf[7] & opf[6] & ~opf[5] & opf[4];
   assign  fpop_high_6 = ~opf[8] & ~opf[7] & opf[6] & opf[5] & ~opf[4];
   assign  fpop_high_a = ~opf[8] & opf[7] & ~opf[6] & opf[5] & ~opf[4];
   assign  fpop_high_8 = ~opf[8] & opf[7] & ~opf[6] & ~opf[5] & ~opf[4];
   assign  fpop_high_c = ~opf[8] & opf[7] & opf[6] & ~opf[5] & ~opf[4];
   assign  fpop_high_d = ~opf[8] & opf[7] & opf[6] & ~opf[5] & opf[4];
   assign  fpop_high_e = ~opf[8] & opf[7] & opf[6] & opf[5] & ~opf[4];
   assign  fpop_high_10 = opf[8] & ~opf[7] & ~opf[6] & ~opf[5] & ~opf[4];
   assign  fpop_high_18 = opf[8] & opf[7] & ~opf[6] & ~opf[5] & ~opf[4];

   assign  unimpl_op_e = ~((fpop_low_1 | fpop_low_2) & (fpop_high_0 | fpop_high_4 | fpop_high_8 |
                                                        fpop1_e & fpop_high_d |
                                                        fpop2_e & (fpop_high_5 | fpop_high_c |
                                                                           fpop_high_10 | fpop_high_18)) |
                           (fpop_low_4 | fpop_low_8) & fpop1_e & (fpop_high_8 | fpop_high_c) |
                           (fpop_low_5 | fpop_low_6) & (fpop_high_4 |
                                                        fpop1_e & fpop_high_0 |
                                                        fpop2_e & (fpop_high_2 | fpop_high_5 |
                                                                           fpop_high_6 | fpop_high_a |
                                                                           fpop_high_c | fpop_high_e)) |
                           fpop_low_6 & fpop1_e & fpop_high_c |
                           fpop_low_9 & fpop1_e & (fpop_high_0 | fpop_high_4 | fpop_high_6 |
                                                           fpop_high_c) |
                           fpop_low_a & fpop1_e & (fpop_high_0 | fpop_high_4) |
                           (fpop_low_d | fpop_low_e) & fpop1_e & fpop_high_4) & (fpop1_e | fpop2_e);
   assign illegal_field_e = fpop2_e & (fpop_high_5 & |rd_e[4:2] |// bits 29:27 must be zero on fcmp
                                       ~opf[4] & ~opf[2] & rs1_e[4]);// bit 18 must be zero on fmovcc
                                       

   assign  convert_op_e = fpop1_e & opf[7];
   assign  illegal_rs1_e = (frs1_e[4:0] != 5'b00000) & (move_e & ~rollback_c3 | convert_op_e);
      
//
// Decode size of source and destination. don't care for unimplemented ops
//
   assign source_single_e = (fpop_high_c & fpop_size_0) | //32b int
                                 (opf[0]);// single (also quad but those are illegal

/* -----\/----- EXCLUDED -----\/-----
   assign  convert_op = (ifu_ffu_fpopcode_d[7] |fpop_high_6_d) & ifu_ffu_fpop1_d;
   assign dest_single_d = (is_fpop_d)? (fpop_size_1_d & ~convert_op) | // sgl and not conv
                                         (ifu_ffu_fpop1_d & ifu_ffu_fpopcode_d[7] & ~ifu_ffu_fpopcode_d[3] &
                                          (~fpop_high_8_d | ifu_ffu_fpopcode_d[2])) |// int to s or float to short int
                                           (ifu_ffu_visop_d & ifu_ffu_fpopcode_d[0]) :// vis single
                                        ifu_ffu_ldst_single_d;
 -----/\----- EXCLUDED -----/\----- */
   assign dest_single_e = (fpop1_e & (~opf[1] & opf[0] & ~(opf[7] |fpop_high_6) | // sgl and not conv
                                              opf[7] & ~opf[3] &
                                              (~fpop_high_8 | opf[2])) |// int to s or float to short int
                           fpop2_e & fpop_size_1 | 
                           visop_e & opf[0] | // vis single
                           (fst_e | fld_e) & ldst_single_e);

   assign unimpl_op_all_e = (unimpl_op_e | ifu_ffu_quad_op_e | 
                             illegal_rs1_e | illegal_field_e);
   
   dff_s #(1) qopm_ff(.din (unimpl_op_all_e),
		  .q   (unimpl_op_m),
		  .clk (clk), .se(se), .si(), .so());
   
   dff_s #(1) qopw_ff(.din (unimpl_op_m),
		  .q   (unimpl_op_w),
		  .clk (clk), .se(se), .si(), .so());
   assign unimpl_qual_w = unimpl_op_w & ~kill_unimpl_w;
   assign unimpl_qual_w2 = unimpl_op_w2 & ~flush_w2;

   dff_s #(1) qopw2_ff(.din (unimpl_qual_w),
		   .q   (unimpl_op_w2),
		   .clk (clk), .se(se), .si(), .so());
   
   
   // Decode register encoding (bit[5] wrapped to bit[0] for non singles)
   // Also the storage is flopped around so odd regs are at even addresses 
   // in the regfile for singles.  this helps because everything external 
   // expects data to be [63:0] not [31:0, 63:32] on doubles.
   
   assign rs1_e[5] = frs1_e[0] & ~source_single_e;// zero for singles
   assign rs1_e[4:2] = frs1_e[4:2];
   assign rs1_e[1] = frs1_e[1];
   assign rs1_e[0] = frs1_e[0] & source_single_e;// only nonzro for sgl

   assign rs2_e[5] = frs2_e[0] & ~source_single_e;// zero for singles
   assign rs2_e[4:2] = frs2_e[4:2];
   assign rs2_e[1] = frs2_e[1];
   assign rs2_e[0] = frs2_e[0] & source_single_e;// only nonzro for sgl

   assign rd_e[5] = frd_e[0] & ~dest_single_e;// zero for singles
   assign rd_e[4:2] = frd_e[4:2];
   assign rd_e[1] = frd_e[1];
   assign rd_e[0] = frd_e[0] & dest_single_e;// only nonzro for sgl


   // Decode general type of operation
   assign is_fpop_d = ifu_ffu_fpop1_d | ifu_ffu_fpop2_d | ifu_ffu_visop_d;
	  
   // Do locally
   assign move_e = fpop_high_0 & (fpop1_e | (fpop1 & rollback_c3)) |
                                                (rollback_c3 & fpop2 & ~opf[4]);// rollback cond_move
   // cond moves don't get rollback because they either don't happen or become unconditional
   assign cond_move_e = fpop2_e & ~opf[4];

   assign abs_w = move_w & fpop_high_0 & opf[3];
   assign neg_w = move_w & fpop_high_0 & opf[2];

   // Send to FPU
   assign fpu_op_e = ((~fpop_high_0 & fpop1_next) | (fpop_high_5 & fpop2_next)) & (any_op_e | rollback_c3);

   // FRF read indication
   assign ren_rs2_e = (fpop1_e | fpop2_e | visop_e) | rollback_c3;
   assign ren_rs2_e_vld = ren_rs2_e & ~vis_nofrf_e;
   assign ren_rs2_m_vld = ren_rs2_m & (cond_move_m & ifu_ffu_mvcnd_m | ~cond_move_m);
   assign ren_rs1_e = ((~vis_nofrf_e & visop_e) | // all vis except siam read rs1
                       (rollback_c3 & visop) |
                       ((fpop2_next & opf[4]) | //FCMP
                        (fpop1_next & ~opf[7] & opf[6])) &	// add,sub,mul,div
                       (any_op_e | rollback_c3 & ~reset));
   assign ren_rs1_w_vld = ren_rs1_w & ~kill_eccchk_w;
   assign ren_rs1_w2_vld = ren_rs1_w2 & ~flush_w2;

   //------------------------------------
   // Store and wait for FPop to complete
   //------------------------------------
   // Storage of control signals

   // >>>>> added ~kill_fp
   // set these in e so that kill_fp doesn't kill spuriously
   assign load_pending_next = fld_e |          // set
	        (load_pending & ~lsu_ffu_ld_vld & ~kill_fp & ~blk_ld_m);
   assign fld_done = lsu_ffu_ld_vld & ~kill_fp & load_pending;
   dffr_s ldpend_dff(.din (load_pending_next), 
		               .q   (load_pending),
		               .clk (clk), 
		               .rst (reset),
		               .se(se), .si(), .so());

   assign blk_ld_m = fld_m & blk_asi_m;
   assign blk_ld_done = lsu_ffu_ld_vld & ~kill_fp & (bld_cnt_d1[2:0] == 3'b111) & blk_load_pending;
   assign blk_load_pending_next = (blk_ld_m & ~kill_m)  | // set
          (blk_load_pending & ~kill_fp & ~ffu_ifu_fpop_done_w2);
   dffr_s blk_ldpend_dff(.din(blk_load_pending_next),
                       .q(blk_load_pending),
                       .clk(clk),
                       .rst(reset),
                       .se(se), .si(), .so());
   
   assign fp_pending_next = fpu_op_e |   // set
	                    (fp_pending & ~is_fpu_result & ~kill_fp);
   dffr_s fppend_dff(.din(fp_pending_next), 
		               .q(fp_pending),
		               .clk(clk), 
		               .rst (reset),
		               .se(se), .si(), .so());

   // rs1
   dff_s #(5) rs1_d2e(.din(ifu_ffu_frs1_d[4:0]), .clk(clk), .q(frs1_e[4:0]), .se(se), .si(), .so());
   mux2ds #(6) rs1_mux(.dout (rs1_next[5:0]),
                          .in0  (rs1[5:0]),
                          .in1  (rs1_e[5:0]),
                          .sel0  (~any_op_e),
                          .sel1  (any_op_e));
   dff_s #(6) rs1_dff(.din(rs1_next[5:0]), 
		                .clk(clk), 
		                .q(rs1[5:0]),
                    .se(se), .si(), .so());
   // rs2
   dff_s #(5) rs2_d2e(.din(ifu_ffu_frs2_d[4:0]), .clk(clk), .q(frs2_e[4:0]), .se(se), .si(), .so());
   mux2ds #(6) rs2_mux(.dout(rs2_next[5:0]),
                       .in0 (rs2[5:0]),
                       .in1 (rs2_e[5:0]),
                       .sel0(~any_op_e),
                       .sel1 (any_op_e));
   dff_s #(6) rs2_dff(.din (rs2_next[5:0]), 
		                .clk (clk), 
		                .q   (rs2[5:0]),
                    .se(se), .si(), .so());
   // rd
   dff_s #(6) rd_d2e(.din({ifu_ffu_ldst_single_d,ifu_ffu_frd_d[4:0]}), .clk(clk), 
                   .q({ldst_single_e,frd_e[4:0]}),
                   .se(se), .si(), .so());
   mux2ds #(6) rd_mux(.dout (rd_next[5:0]),
                      .in0  (rd[5:0]),
                      .in1  (rd_e[5:0]),
                      .sel0 (~any_op_e),
                      .sel1  (any_op_e));
   dff_s #(6) rd_dff(.din (rd_next[5:0]), 
		               .clk (clk),
		               .q    (rd[5:0]),
                   .se  (se), .si(), .so());
   // rs size
   mux2ds source_single_mux(.dout (source_single_next),
                            .in0  (source_single),
                            .in1  (source_single_e),
                            .sel0(~any_op_e),
                            .sel1 (any_op_e));
   dff_s source_single_dff(.din(source_single_next), 
			                   .clk(clk), 
			                   .q(source_single),
                         .se(se), .si(), .so());
   // rd size
   assign dest_single_next = (any_op_e)? dest_single_e: dest_single;
   dff_s dest_single_dff(.din (dest_single_next), 
			                    .clk (clk), 
			                    .q   (dest_single),
                          .se  (se), .si(), .so());
   // thread
   mux2ds #(2) tid_mux(.dout (tid_next[1:0]),
                       .in0  (tid[1:0]),
                       .in1  (tid_e[1:0]),
                       .sel0 (~any_op_e),
                       .sel1  (any_op_e));
   dff_s #(2) tid_dff(.din(tid_next[1:0]), 
		                .clk(clk), 
		                .q(tid[1:0]),
                    .se(se), .si(), .so());
   // extra tid to help fanout for critical signals
   dff_s #(2) extra_tid_dff(.din(tid_next[1:0]),
                          .clk(clk), .q(extra_tid[1:0]), .se(se), .si(), .so());
   // fcc num
   mux2ds #(2) fcc_mux(.dout (fcc_num_next[1:0]),
                       .in0   (fcc_num[1:0]),
                       .in1   (ifu_ffu_fcc_num_d[1:0]),
                       .sel0 (~is_fpop_d),
                       .sel1   (is_fpop_d));
   dff_s #(2) fcc_dff(.din (fcc_num_next[1:0]), 
		                .clk (clk), 
		                .q   (fcc_num[1:0]),
                    .se  (se), .si(), .so());

   // ldfsr
   mux2ds #(2) ldfsr_mux(.dout (ldfsr_next[1:0]),
                         .in0  ({ldfsr, ldxfsr}),
                         .in1  ({ifu_ffu_ldfsr_d, ifu_ffu_ldxfsr_d}),
                         .sel0  (~ifu_ffu_fld_d),
                         .sel1  (ifu_ffu_fld_d));
   dff_s #(2) ldfsr_dff(.din (ldfsr_next[1:0]), 
		                  .clk (clk), 
		                  .q   ({ldfsr, ldxfsr}),
                      .se  (se), .si(), .so());

   // op code
   mux2ds #(9) opf_mux(.dout (opf_next[8:0]),
                       .in0  (opf[8:0]),
                       .in1  (ifu_ffu_fpopcode_d[8:0]),
                       .sel0  (~is_fpop_d),
                       .sel1  (is_fpop_d));
   dff_s #(9) opf_dff(.din(opf_next[8:0]), 
		                .clk(clk), 
		                .q(opf[8:0]),
                   .se(se), .si(), .so());
   //----------
   // FP Pipe
   //----------
   dff_s fop_e2m(.din(any_op_e), .clk(clk), 
	             .q(any_op_m), 
	             .se(se), .si(), .so());

   dff_s fop_m2w(.din(any_op_m_valid), .clk(clk), 
	             .q(any_op_w), 
	             .se(se), .si(), .so());
   dff_s fop_w2w2(.din(any_op_w), .clk(clk), 
	             .q(any_op_w2), 
	             .se(se), .si(), .so());

   dff_s fst_d2e(.din(ifu_ffu_fst_d),  .clk(clk),  
	             .q  (fst_e), 
	             .se(se), .si(), .so());
   dff_s fst_e2m(.din(fst_e), .clk(clk), 
	             .q  (fst_m), 
	             .se(se), .si(), .so());
   dff_s fst_m2w(.din(fst_m), .clk(clk), 
	             .q  (fst_w), 
	             .se(se), .si(), .so());
   dff_s fld_d2e(.din(ifu_ffu_fld_d),  .clk(clk),  
	             .q  (fld_e), 
	             .se(se), .si(), .so());
   dff_s fld_e2m(.din(fld_e),  .clk(clk),  
	             .q  (fld_m), 
	             .se(se), .si(), .so());

   dff_s ren_rs2_e2m(.din(ren_rs2_e_vld), .clk(clk), 
		               .q(ren_rs2_m), 
		               .se(se), .si(), .so());
   dff_s ren_rs2_m2w(.din(ren_rs2_m_vld), .clk(clk), 
		               .q(ren_rs2_w), 
		               .se(se), .si(), .so());
   dff_s ren_rs2_w2w2(.din(ren_rs2_w), .clk(clk), 
		                .q(ren_rs2_w2), 
		                .se(se), .si(), .so());
   dff_s ren_rs2_w22w3(.din(ren_rs2_w2), .clk(clk), 
		                .q(ren_rs2_w3), 
		                .se(se), .si(), .so());
   dff_s ren_rs2_w32w4(.din(ren_rs2_w3), .clk(clk), 
		                .q(ren_rs2_w4), 
		                .se(se), .si(), .so());
   
   dff_s ren_rs1_e2m(.din(ren_rs1_e), .clk(clk), 
		               .q(ren_rs1_m), 
		               .se(se), .si(), .so());
   dff_s ren_rs1_m2w(.din(ren_rs1_m), .clk(clk), 
		               .q(ren_rs1_w), 
		               .se(se), .si(), .so());
   dff_s ren_rs1_w2w2(.din(ren_rs1_w_vld), .clk(clk), 
		               .q(ren_rs1_w2), 
		               .se(se), .si(), .so());
   dff_s ren_rs1_w22w3(.din(ren_rs1_w2_vld), .clk(clk), 
		               .q(ren_rs1_w3), 
		               .se(se), .si(), .so());
   dff_s ren_rs1_w32w4(.din(ren_rs1_w3), .clk(clk), 
		               .q(ren_rs1_w4), 
		               .se(se), .si(), .so());
   dff_s ren_rs1_w42w5(.din(ren_rs1_w4), .clk(clk), 
		               .q(ren_rs1_w5), 
		               .se(se), .si(), .so());
  
   dff_s cond_move_e2m(.din(cond_move_e), .clk(clk), 
		                 .q(cond_move_m), 
		                 .se(se), .si(), .so());
   
   dff_s move_e2m(.din(move_e), .clk(clk), 
		            .q(move_m), 
		            .se(se), .si(), .so());
   dff_s move_m2w(.din(move_m_valid), .clk(clk), 
		            .q(move_w), 
		            .se(se), .si(), .so());
   dff_s move_wen_m2w(.din(move_wen_m), .clk(clk), .q(move_wen_w),
                    .se(se), .si(), .so());
   dff_s move_wen_w2w2(.din(move_wen_w), .clk(clk), .q(move_wen_w2),
                    .se(se), .si(), .so());
   dff_s move_wdff(.din(move_w_valid), .clk(clk), .q(move_w2), .se(se), .si(), .so());

   dff_s stfsr_d2e(.din(ifu_ffu_stfsr_d), 
		             .q(stfsr_e), 
		             .clk(clk), 
		             .se(se), .si(), .so());
  
   dff_s fpu_op_e2m(.din(fpu_op_e), .clk(clk), 
		              .q(fpu_op_m), 
		              .se(se), .si(), .so());
   dff_s fpu_op_m2w(.din(fpu_op_m), .clk(clk), 
		              .q(fpu_op_w), 
		              .se(se), .si(), .so());
   dff_s fpu_op_w2w2(.din(fpu_op_w_vld), .clk(clk), 
		              .q(fpu_op_w2), 
		              .se(se), .si(), .so());
   dff_s fpu_op_w22w3(.din(fpu_op_w2_vld), .clk(clk), 
		              .q(fpu_op_w3), 
		              .se(se), .si(), .so());

   dff_s #(2) tid_d2e(.din(ifu_ffu_tid_d[1:0]), 
		                .clk(clk), 
		                .q(tid_e[1:0]), 
		                .se(se), .si(), .so());
   
   dff_s #(2) tid_e2m(.din(tid_e[1:0]), 
		                .clk(clk), 
		                .q(tid_m[1:0]), 
		                .se(se), .si(), .so());
   
   dff_s #(2) tid_m2w(.din(tid_m[1:0]), 
		                .clk(clk), 
		                .q(tid_w[1:0]), 
		                .se(se), .si(), .so());
   
   dff_s #(2) tid_w2w2(.din(tid_w[1:0]), 
		                 .clk(clk), 
		                 .q(tid_w2[1:0]), 
		                 .se(se), .si(), .so());

   dff_s dff_killed_w(.din(kill_m), 
		                .clk(clk), 
		                .q(killed_w), 
		                .se(se), .si(), .so());

   dff_s dff_flush_w2(.din(flush_w), .clk(clk), .q(flush_w2), .se(se), .si(), .so());
   
   assign  thr_match_mw2 = ~((tid_m[1] ^ tid_w2[1]) |
                           (tid_m[0] ^ tid_w2[0]));
   assign  thr_match_ww2 = ~((tid_w[1] ^ tid_w2[1]) |
                           (tid_w[0] ^ tid_w2[0]));

   assign thr_match_fpw2 = ~((tid[1] ^ tid_w2[1]) |
                           (tid[0] ^ tid_w2[0]));

   // new fpops squash previous ones (only possible in m or w, but w will also have ifu_tlu_flush_w)
   // all kill_w signals do not include lsu_ffu_flush_pipe_w.  This must be included at the final destination
   assign flush_w = (lsu_ffu_flush_pipe_w | ifu_tlu_flush_w) & ~rolled_back;
   assign any_op_e = fpop1_e | fpop2_e | fst_e | fld_e | visop_e;
   assign any_op_m_valid = any_op_m & ~any_op_e;
   assign  kill_m = (thr_match_mw2 & flush_w2) | any_op_e;
   assign  kill_eccchk_w = (~ifu_tlu_inst_vld_w | killed_w | unimpl_op_w | any_op_e | 
                            (thr_match_ww2 & flush_w2)) & ~rolled_back;
   // unimplemented ops don't check rolled_back because they trap before rollback happens
   assign  kill_unimpl_w = (~ifu_tlu_inst_vld_w | killed_w | any_op_e 
	                  | (thr_match_ww2 & flush_w2));
   assign  kill_w = (~ifu_tlu_inst_vld_w | killed_w | any_op_e |
	                  unimpl_op_w | ffu_lsu_kill_fst_w | (thr_match_ww2 & flush_w2)) & ~rolled_back;
   // this kills the "pending" signals that are set in the E stage.
   // Since they are set in E all the kills can be delayed by one cycle without
   // squashing a new, valid op
   assign  kill_fp = (thr_match_fpw2 & flush_w2 | any_op_e |
		                  any_op_w & (~ifu_tlu_inst_vld_w | unimpl_op_w)) & ~rolled_back;
   

//----------------------------
// Control for muxes that manipulate data to/from FRF
//----------------------------
   // implement fmov/fmovcc
   assign  move_wen_m = move_m | (cond_move_m & ifu_ffu_mvcnd_m);
   assign  move_wen_w2_valid = move_wen_w2 & move_w2_vld;
   assign  move_m_valid = (move_m | cond_move_m);
   // used for updating fsr
   assign  move_w_valid = move_w & ~kill_w;
   assign  move_w2_vld = move_w2 & ~flush_w2 & ~rollback_rs2_w2 & ~(rs2_ue_w2 & nceen);

   // negation or absolute value happen to rs2 in the m_stage if needed
   assign  ctl_dp_sign[1] = (dp_ctl_rs2_sign[1] ^ neg_w) & ~abs_w;
   assign  ctl_dp_sign[0] = (source_single) ? 
			     (dp_ctl_rs2_sign[0] ^ neg_w) & ~abs_w : 
	                      dp_ctl_rs2_sign[0];

   //
   // Shifts to align sgl precision 32b data
   //
   // mux for moving around single data from frf
   
   // shift on moves or stores
   assign shift_frf_rs2_m = (rs2[0] ^ rd[0]) & (move_m | cond_move_m | visop_m) & ~fst_e;
   assign shift_frf_rs1_w = (rs1[0] ^ rd[0]) & visop_w_vld; //check for squash

   assign  shift_frf_right_next = (source_single & shift_frf_rs2_m & ~rs2[0]) |
                                      (source_single & shift_frf_rs1_w & ~rs1[0]) |
                                      (dest_single_e & fst_e & ~rd_e[0]);

   assign  shift_frf_left_next = ((source_single & rs2[0] & (shift_frf_rs2_m | fpu_op_m & ~fst_e) |
                                   source_single & rs1[0] & (shift_frf_rs1_w | fpu_op_w_vld)) 
                                  & ~shift_frf_right_next);

   assign  noshift64_frf_next = ~(shift_frf_right_next | shift_frf_left_next);
   
   assign  ctl_dp_shift_frf_right = shift_frf_right & ~rst_tri_en;
   assign  ctl_dp_shift_frf_left = shift_frf_left & ~rst_tri_en;
   assign  ctl_dp_noshift64_frf = noshift64_frf | rst_tri_en;

   // fpu expects lower 32 bits to be zero on single operands
   assign  zero_lower_data_next = ((source_single & ~rs1[0] & fpu_op_w_vld) | 
                                   (source_single & ~rs2[0] & fpu_op_m));
   
   dff_s shift_frf_right_dff(.din(shift_frf_right_next), .clk(clk), .q(shift_frf_right),
                           .se(se), .si(), .so());
   dff_s shift_frf_left_dff(.din(shift_frf_left_next), .clk(clk), .q(shift_frf_left),
                           .se(se), .si(), .so());
   dff_s noshift64_dff(.din(noshift64_frf_next), .clk(clk), .q(noshift64_frf),
                     .se(se), .si(), .so());
   dff_s noshift32_dff(.din(zero_lower_data_next), .clk(clk), .q(ctl_dp_zero_low32_frf),
                     .se(se), .si(), .so());
   
   wire    flip_fpu;
   wire    flip_lsu;
   // mux for rearranging data from fpu
   // data comes in with msb always at b63.  This means that singles with an odd
   // rd must be flipped so that the data ends up in the correct
   //  registers.
   assign  flip_fpu = (dest_single & rd[0]);// single with odd rd

   // mux for rearranging data from lsu
   // data comes in [63:0].  This means that singles with an even
   // rd must be flipped so that the data ends up in the correct
   //  registers.
   assign  flip_lsu = (dest_single & ~rd[0]);// single with even rd

   assign  ctl_dp_noflip_lsu = ld_ret & ~flip_lsu;
   assign  ctl_dp_flip_lsu = ld_ret & flip_lsu;
   assign  ctl_dp_noflip_fpu = ~ld_ret & ~flip_fpu & is_fpu_result & ~cpx_fcmp_d1;
   assign  ctl_dp_flip_fpu = ~ld_ret & ~ctl_dp_noflip_fpu;
   

//---------------------------------
// LSU Interface
//---------------------------------

   // Note that stores fit into the standard pipeline so they are automatically 
   // accepted and do not require an ACK.  The lsu will check for kills in m and w.
   
   assign  store_ready = fst_m | bst_issue_c3;
   assign  fpu_op_w_vld = fpu_op_w & ~kill_w;
   assign  fpu_op_w2_vld = fpu_op_w2 & ~flush_w2 & ~ecc_kill_rs2_w2;
   assign  fpu_op_w3_vld = fpu_op_w3 & ~ue_trap_w3 & ~rollback_rs1_w3;
   // don't qual with inst_vld since it takes too much time?
   // Resolved with Sanjay:
   //    Will never receive ack in the same cycle req was first made
   assign  fpop1_ready_w2_next = (fpu_op_w3_vld | 
				                         (fpop1_ready_w2 & ~lsu_ffu_ack));

   dffr_s #(1) fpop1_w2_dff(.din (fpop1_ready_w2_next), 
		                   .q   (fpop1_ready_w2),
		                   .rst (reset),
		                   .clk (clk), .se(se), .si(), .so());

   // once op1 has been accepted, move to w2, and in the next cycle op2 is ready
   //
   // C1 -- recv ack, send op1 (fpop1_ready_w2)
   // C2 -- send op2 (fpop2_ready_w3)
   assign fpop2_ready_w3_next = fpop1_ready_w2 & lsu_ffu_ack;
   
   dff_s fpop2_w22w3(.din (fpop2_ready_w3_next), 
		               .q   (fpop2_ready_w3), 
		               .clk(clk), .se(se), .si(), .so());

   
   // request in W2 and wait till an ack is received
   //    Will never receive ack in the same cycle req was first made
   assign ffu_lsu_fpop_rq_vld = fpu_op_w3_vld;

   // valid pkt sent to lsu (after request)
   assign issue_fpop2 = fpop2_ready_w3 & ~opf[7];// not conversion op
   assign  lsu_pkt_vld = fpop1_ready_w2 | fpu_op_w3_vld | issue_fpop2 | store_ready;

   assign lsu_pkt_type[1:0] = {store_ready, fpop2_ready_w3};

   // Create packet for LSU: ffu_lsu_data[80:0]
   //     80 = vld
   //     79:78 = type (00 = fpu operand 1, 01 = fpu operand 2, 10 = fp store)
   //     77:76 = tid
   //     75:68 = floating point opcode
   //     67:66 = fcc
   //     65:64 = rounding mode
   //     63:0 = data
   assign ffu_lsu_data[80:64] = {lsu_pkt_vld, 
				 lsu_pkt_type[1:0], 
				 extra_tid[1:0], 
				 opf[7:0], 
				 fcc_num[1:0], 
				 fpu_rnd[1:0]};  // rounding mode

   // Select data to send to LSU.  This is calculated one cycle early and flopped
   assign output_sel_rs1_next = fpop2_ready_w3_next & ~fst_e & ~bst_issue_c3_next;     // rs2 is sent first (fpop1)
   assign output_sel_frf_next = fst_e & ~stfsr_e | bst_issue_c3_next;   // store data
   assign output_sel_fsr_next = fst_e & stfsr_e & ~bst_issue_c3_next;
   assign output_sel_rs2_next = ~(fpop2_ready_w3_next | fst_e | bst_issue_c3_next);
   assign ctl_dp_output_sel_rs1 = output_sel_rs1 & ~rst_tri_en;
   assign ctl_dp_output_sel_frf = output_sel_frf & ~rst_tri_en;
   assign ctl_dp_output_sel_fsr = output_sel_fsr & ~rst_tri_en;
   assign ctl_dp_output_sel_rs2 = output_sel_rs2 | rst_tri_en;
   dff_s #(4) output_sel_dff(.din({output_sel_rs1_next,output_sel_rs2_next,output_sel_frf_next,output_sel_fsr_next}),
                           .q({output_sel_rs1,output_sel_rs2,output_sel_frf,output_sel_fsr}),
                           .clk(clk), .se(se), .si(), .so());


   dff_s #(1) sfsrw_ff(.din (ctl_dp_output_sel_fsr),
		               .q   (stfsr_w),
		               .clk (clk), .se(se), .si(), .so());
   dff_s stfsr_wdff(.din(stfsr_qual_w), .clk(clk), .q(stfsr_w2), .se(se), .si(), .so());
   assign stfsr_qual_w =  (stfsr_w & ~kill_w);
   assign stfsr_w2_vld = stfsr_w2 & ~flush_w2;


   //------------------------------------------------------
   //  Block Stores
   //------------------------------------------------------
   // interface with lsu.  bst packet issues in c3
   // check for stb_full so it doesn't confuse lsu.  Don't have to count inflight packets
   // because none exist by bst_issue_c2
   assign        ffu_lsu_blk_st_e = bst_issue_c2 & ~stb_full_c2;
   assign        ffu_lsu_blk_st_va_e[5:3] = bst_cnt[2:0];
   assign        bst_done = bst_issue_c4 & (bst_cnt[2:0] == 3'b111) & ~bst_ce_c4 & ~(bst_ue_c4 & nceen);

   mux4ds stb_full_mux (.dout(stb_full_c2),
                        .in0(stb_full0),
                        .in1(stb_full1),
                        .in2(stb_full2),
                        .in3(stb_full3),
                        .sel0(ctl_dp_fp_thr[0]),
                        .sel1(ctl_dp_fp_thr[1]),
                        .sel2(ctl_dp_fp_thr[2]),
                        .sel3(ctl_dp_fp_thr[3]));

   assign        other_mem_op_e = exu_ffu_ist_e | ifu_tlu_flsh_inst_e | ifu_lsu_ld_inst_e;
   assign        can_issue_bst_c2  = (~other_mem_op_e & ~stb_full_c2);
   assign bst_m = fst_m & blk_asi_m;

   assign bst_rs[5:0] = {rd[5:4], bst_cnt[2:0], 1'b0};

   // bst starts when bst hits w and is done when the 7th pckt has issued
   assign bst_issue_c1_next = ((bst_w & ~kill_w) | 
                               (bst_issue_c4 & ~(bst_cnt[2:0] == 3'b111) & ~bst_ce_c4 & 
                                ~(bst_ue_c4 & nceen)) | bst_issue_c6);

   // sotheas,9/14/04: fixed eco 6910, suppress block store start on dtlb perr
   //                  using registered version of lsu_ffu_st_dtlb_perr_g
   //   WAS:
   //        assign bst_issue_c2_next = ((bst_issue_c1 & ~(any_op_w2 & flush_w2)) | (bst_issue_c2 & ~can_issue_bst_c2)) & ~reset;
   //   IS:
   dff_s #(1) st_dtlbperr_ff(.din (!lsu_ffu_st_dtlb_perr_g),
		               .q   (st_dtlb_perr_w2_l),
		               .clk (clk), .se(se), .si(), .so());
   assign bst_issue_c2_next = ((bst_issue_c1 & ~(any_op_w2 & flush_w2) & st_dtlb_perr_w2_l) 
                             | (bst_issue_c2 & ~can_issue_bst_c2)) & ~reset;
   assign bst_issue_c3_next = bst_issue_c2 & can_issue_bst_c2 & ~reset;
   assign bst_issue_c4_next = bst_issue_c3 & ~reset;
   assign bst_issue_c5_next = bst_issue_c4 & bst_ce_c4 & ~reset;
   assign bst_issue_c6_next = bst_issue_c5 & ~reset;

   // bst keeps reading in both c1 and c2 in case it stalls in c2
   assign bst_read_req = bst_issue_c1 | bst_issue_c2;
   // counter resets to 1 when bst hits w, increments when one is issued to lsu without ce
   assign bst_cnt_next[2:0] = (bst_w? 				3'b001:
                               (bst_issue_c4 & ~bst_ce_c4)?  (bst_cnt[2:0] + 3'b001):
                                               bst_cnt[2:0]);

   ///////////////////
   // bst starvation
   //----------------
   // when six bit counter saturates then a req to stall inst issue is made
   // The request stays high until a bst gets issued
   ///////////////////
   assign ffu_ifu_stallreq = bst_stall_req;
   assign bst_stall_req_next = ((bst_stall_cnt[5:0] == 6'b111111) & bst_issue_c2 & ~can_issue_bst_c2 |
                                bst_stall_req & other_mem_op_e);
   assign bst_stall_cnt_next[5:0] = (~bst_issue_c2)? 6'd0: bst_stall_cnt[5:0] + 6'd1;

   /////////////////////
   // bst ecc control
   /////////////////////
   // if a ce occurs even after correction then it is converted to a ue
   assign bst_ue_c4 = bst_issue_c4 & (previous_ue | (fixed_bst_ce & |previous_ce[1:0]));
   assign bst_ce_c4 = bst_issue_c4 & |previous_ce[1:0] & ~fixed_bst_ce & ~previous_ue;
   assign fixed_bst_ce_next = bst_ce_c4 | (fixed_bst_ce & ~bst_issue_c4);

   dff_s #(4) stb_full_dff(.din({lsu_ffu_stb_full0,lsu_ffu_stb_full1,lsu_ffu_stb_full2,lsu_ffu_stb_full3}),
                         .q({stb_full0, stb_full1, stb_full2, stb_full3}),
                         .clk(clk), .se(se), .si(), .so());
   dff_s blk_asi_dff(.din(lsu_ffu_blk_asi_e), .clk(clk), .q(blk_asi_m),
                   .se(se), .si(), .so());
   dffr_s bst_fix_ce_dff(.din(fixed_bst_ce_next), .clk(clk), .q(fixed_bst_ce), 
                       .se(se), .si(), .so(), .rst(reset));
   dff_s #(3) bst_cnt_dff(.din(bst_cnt_next[2:0]), .clk(clk), .q(bst_cnt[2:0]),
                        .se(se), .si(), .so());
   dff_s bst_m2w(.din(bst_m), .clk(clk), .q(bst_w), .se(se), .si(), .so());
   dff_s bst_issue_c1_dff(.din(bst_issue_c1_next), .clk(clk), .q(bst_issue_c1), .se(se),
                     .si(), .so());
   dff_s bst_issue_c2_dff(.din(bst_issue_c2_next), .clk(clk), .q(bst_issue_c2), .se(se),
                     .si(), .so());
   dff_s bst_issue_c3_dff(.din(bst_issue_c3_next), .clk(clk), .q(bst_issue_c3), .se(se),
                     .si(), .so());
   dff_s bst_issue_c4_dff(.din(bst_issue_c4_next), .clk(clk), .q(bst_issue_c4), .se(se),
                     .si(), .so());
   dff_s bst_issue_c5_dff(.din(bst_issue_c5_next), .clk(clk), .q(bst_issue_c5), .se(se),
                     .si(), .so());
   dff_s bst_issue_c6_dff(.din(bst_issue_c6_next), .clk(clk), .q(bst_issue_c6), .se(se),
                     .si(), .so());
   dff_s #(6) bst_stall_cntdff(.din(bst_stall_cnt_next[5:0]), .clk(clk), .q(bst_stall_cnt[5:0]),
                             .se(se), .si(), .so());
   dffr_s bst_stall_reqdff(.din(bst_stall_req_next), .clk(clk), .q(bst_stall_req),
                        .se(se), .si(), .so(), .rst(reset));
   
//----------------------------------------
// Decode Returning FPU/LSU packets
//----------------------------------------

   // FPU result pulled off of cpx
   assign is_fpu_result = (cpx_req_d1 == `FP_RET) ?
                           cpx_vld_d1 & fp_pending : 1'b0;
   assign ld_ret = lsu_ffu_ld_vld & ~(thr_match_fpw2 & flush_w2) & (blk_load_pending | load_pending);
	  
   // select frf write data
   // don't write data on Fcompares
   assign ctl_dp_rs2_sel_fpu_lsu = is_fpu_result & ~cpx_fcmp_d1 | ld_ret;
   assign ctl_dp_rs2_sel_vis = vis_result & ~ctl_dp_rs2_sel_fpu_lsu;
   assign ctl_dp_rs2_frf_read = (ren_rs2_w | ctl_dp_rd_ecc) & ~ctl_dp_rs2_sel_fpu_lsu & ~vis_result;
   assign ctl_dp_rs2_keep_data = ~(ren_rs2_w | ctl_dp_rd_ecc | vis_result | 
				   ctl_dp_rs2_sel_fpu_lsu);

   // selects for rs2 result mux
   assign ctl_dp_rd_ecc = fst_ce_w | rollback_rs2_w2 | bst_ce_c4 | rollback_rs1_w3;
   
   // Selects for rs1 mux
   assign ctl_dp_new_rs1 = ren_rs1_w2;

//----------------------------------------
// FRF Controls
//----------------------------------------   
   // WEN for frf from load, FPU result or mov
   assign external_wen_next = ld_ret & ~(ldfsr | ldxfsr) | (is_fpu_result & ~cpx_fcmp_d1 & ~take_ieee_trap);
   assign rf_ecc_gen_next = external_wen_next | vis_wen_next;
   
   dff_s rf_eccgen_dff(.din(rf_ecc_gen_next), .q(rf_ecc_gen), .clk(clk), .se(se), .si(), .so());
   dff_s rf_wen_dff(.din(rf_wen_next), .q(rf_wen), .clk(clk), .se(se), .si(), .so());
   // check for flush_pipe for moves
   assign rf_wen_next = rf_ecc_gen & ~(any_op_w2 & flush_w2) | move_wen_w2_valid;


   // REN and WEN must be mutually exclusive.  This works because WEN is always after W
   // if a new fpop has arrived to cancel it.
   // The even register is the upper half, odd is the lower half
   assign ctl_frf_wen[1] = ((rf_wen & ~rd[0]) | ecc_wen[1]) & ~ctl_frf_ren;   // double or even sgl
   assign ctl_frf_wen[0] = ((rf_wen & (~dest_single | rd[0])) | ecc_wen[0]) & ~ctl_frf_ren; // dbl or odd sgl

   // REN for frf  -- rd rs2 in D, rs1 in E
   assign read_rs2 = ren_rs2_e;
   assign read_rs1 = ren_rs1_m;
   assign read_rd = ifu_ffu_fst_d;
   assign read_bst = bst_read_req;
   // expanded out the terms for reading rs2 to help timing
   assign ctl_frf_ren = (read_rs1 | read_rs2 |
                         ifu_ffu_fst_d | bst_read_req);

   assign early_frf_rnum[5:1] = read_rs2?  rs2_next[5:1]:
                                read_rs1?  rs1[5:1]:
                                read_bst?  bst_rs[5:1]:
                                           write_addr[5:1];
   assign     st_rd_d[5:1] = {ifu_ffu_frd_d[0] & ~ifu_ffu_ldst_single_d, ifu_ffu_frd_d[4:1]};
   mux2ds #(5) frf_rnum_mux(.dout(frf_rnum[5:1]),
                            .in0(early_frf_rnum[5:1]),
                            .in1(st_rd_d[5:1]),
                            .sel0(~read_rd),
                            .sel1(read_rd));

   assign frf_tid[1:0] = (read_rd)? ifu_ffu_tid_d[1:0]: tid_next[1:0];
                          
   assign wen_rs2_ecc = |ecc_wen[1:0] & ren_rs2_w4;
   assign wen_rs1_ecc = |ecc_wen[1:0] & ren_rs1_w5;
   assign blk_rd[5:1] = rd[5:1] + {2'b0, bld_cnt_d3[2:0]};
   assign write_addr[5:1] = wen_rs2_ecc?          rs2[5:1] :
                            wen_rs1_ecc?          rs1[5:1] :
                            bst_issue_c6?         bst_rs[5:1]:
                            blk_load_pending?     blk_rd[5:1]:
                                                  rd[5:1];

   // Address is combination of tid and rnum
   assign ctl_frf_addr[6:0] = {frf_tid[1:0], frf_rnum[5:1]}; 
  
//----------------------------------------
// Data from FPU forwarded to IFU
//----------------------------------------
   // Send thrid to IFU
   assign ffu_ifu_tid_w2[1:0] = tid;

   // completion is always signalled after the w-stage so that flush_pipe, etc.
   // can be checked.  For lds and fpops this is signalled after they write.
   // ecc_kill_rs2_w is checked for move and fst because the "compeletion"
   // is signalled over a separate interface so rollback can occur.
   // This is staged 2 cycles to allow for the cycle of ecc generation.
   //
   assign ffu_op_done_next = ((is_fpu_result & ~take_ieee_trap) | fld_done |
                              blk_ld_done | bst_done | vis_result |
                              fst_w & ~bst_w & ~kill_w);
   dff_s ffu_op_done_dff(.din(ffu_op_done_next), .clk(clk), .q(ffu_op_done),
                       .se(se), .si(), .so());
   // sotheas,9/14/04: fixed eco 6910, send done on dtlb perr for block store
   //                  using registered version of lsu_ffu_st_dtlb_perr_g
   //   WAS:
   //     assign ffu_op_done_vld = ffu_op_done & ~(any_op_w2 & flush_w2) | move_w2_vld;
   assign ffu_op_done_vld = (ffu_op_done | (bst_issue_c1 & !st_dtlb_perr_w2_l) ) 
                            & ~(any_op_w2 & flush_w2) | move_w2_vld;
   dff_s ffu_op_done2_dff(.din(ffu_op_done_vld), .clk(clk), .q(ffu_ifu_fpop_done_w2),
                        .se(se), .si(), .so());

//------------------------------------------
// FSR Controls
//------------------------------------------

   assign ctl_dp_fp_thr[0] = ~extra_tid[1] & ~extra_tid[0];
   assign ctl_dp_fp_thr[1] = ~extra_tid[1] &  extra_tid[0];
   assign ctl_dp_fp_thr[2] =  extra_tid[1] & ~extra_tid[0];
   assign ctl_dp_fp_thr[3] =  extra_tid[1] &  extra_tid[0];

   // CC's
   assign fcc_num_dec[0] = ~fcc_num[1] & ~fcc_num[0];
   assign fcc_num_dec[1] = ~fcc_num[1] & fcc_num[0];
   assign fcc_num_dec[2] = fcc_num[1] & ~fcc_num[0];
   assign fcc_num_dec[3] = fcc_num[1] & fcc_num[0];

   // selects to load next fsr from
   // stfsr or fmov always clear ftt
   assign clear_ftt = stfsr_w2_vld | move_w2_vld | is_fpu_result;
   
   assign ctl_dp_fsr_sel_fpu[3:0] = ({4{is_fpu_result | move_w2_vld | take_other_trap | stfsr_w2_vld}}
                                     & ctl_dp_fp_thr[3:0]);
   assign ctl_dp_fsr_sel_ld[3:0] =  ({4{ld_ret & (ldfsr | ldxfsr)}} &  
                                     ~ctl_dp_fsr_sel_fpu[3:0] & ctl_dp_fp_thr[3:0]);
   assign ctl_dp_fsr_sel_old[3:0] =  (~ctl_dp_fsr_sel_fpu[3:0] & ~ctl_dp_fsr_sel_ld[3:0]);
   
   // align fcc depending on which fcc_num was used
   mux4ds #(8) fcc_ret_mux(.dout (fpu_fcc[7:0]),
			 .in0  ({dp_ctl_fsr_fcc[7:2], cpx_fccval_d1[1:0]}),
			 .in1  ({dp_ctl_fsr_fcc[7:4], cpx_fccval_d1[1:0], dp_ctl_fsr_fcc[1:0]}),
			 .in2  ({dp_ctl_fsr_fcc[7:6], cpx_fccval_d1[1:0], dp_ctl_fsr_fcc[3:0]}),
			 .in3  ({cpx_fccval_d1[1:0], dp_ctl_fsr_fcc[5:0]}),
			 .sel0 (fcc_num_dec[0]),
			 .sel1 (fcc_num_dec[1]),
			 .sel2 (fcc_num_dec[2]),
			 .sel3 (fcc_num_dec[3]));

   // set fcc if this was an fcmp instruction
   assign fcc_sel_fpu = cpx_fcmp_d1 & ~ieee_trap & is_fpu_result;
   assign fcc_sel_ld = ~is_fpu_result & ldfsr_vld;
   assign fcc_sel_ldx = ~is_fpu_result & ~ldfsr_vld & ldxfsr_vld;
   assign fcc_sel_old = ~fcc_sel_fpu & ~fcc_sel_ld & ~fcc_sel_ldx;
   mux4ds #(8) fcc_set_mux(.dout (ctl_dp_fcc_w2[7:0]),
			                   .in0  (dp_ctl_fsr_fcc[7:0]),
			                   .in1  (fpu_fcc[7:0]),
			                   .in2  (dp_ctl_ld_fcc[7:0]),
			                   .in3  ({dp_ctl_fsr_fcc[7:2], dp_ctl_ld_fcc[1:0]}),
			                   .sel0 (fcc_sel_old),
			                   .sel1 (fcc_sel_fpu),
			                   .sel2 (fcc_sel_ldx),
			                   .sel3 (fcc_sel_ld));

   // get fcc's from ldfsr instruction
   assign ldfsr_vld = ldfsr & load_pending;
   assign ldxfsr_vld = ldxfsr & load_pending;

   wire   cc_changed_w2;

   // fcc set by fcmp, ldfsr or ldxfsr
   assign cc_changed = fcc_sel_fpu |
	                     fld_done & (ldfsr_vld | ldxfsr_vld);

   dff_s cc_changed_dff(.din(cc_changed), .clk(clk), .q(cc_changed_w2),
                      .se(se), .si(), .so());
   dff_s #(8) cc_next(.din(ctl_dp_fcc_w2[7:0]), .clk(clk), .q(ffu_ifu_cc_w2[7:0]),
                    .se(se), .si(), .so());

   assign ffu_ifu_cc_vld_w2[3:0] = ctl_dp_fp_thr[3:0] & {4{cc_changed_w2}};
   
//-----------------------------------
// Traps
//-----------------------------------   

   // illegal instruction if blk ld/st is not 8 dp regs aligned
   dff_s illegal_vis_e2m (.din(illegal_vis_e), .clk(clk), .q(illegal_vis_m),
                        .se(se), .si(), .so());
   assign illegal_blk_m = (blk_ld_m | bst_m) & (rd[0] | rd[1] | rd[2] | rd[3]) & ~dest_single;
   assign ffu_tlu_ill_inst_m = illegal_blk_m | illegal_vis_m;
   
   assign ctl_dp_ftt_w2 = take_ieee_trap      ? 3'b001 :
	                  unimpl_qual_w2        ? 3'b011 :
	                  clear_ftt           ? 3'b000 :
	                                        3'bxxx; 
   
// SPARC V9 Underflow, Overflow, Inexact behavior: 
//
//      Exception(s)             |            Current
//      Detected    Trap Enable  | fp_        Exception
//      in f.p.     Mask Bits    | exception_ Bits (in
//      operation   (in FSR.TEM) | ieee_754   FSR.cexc)   
//      ----------- ------------ | Trap       ----------- 
//      of  uf  nx  OFM UFM NXM  | Occurs?    ofc ufc nxc  Notes
//      --- --- --- --- --- ---  | ---------- --- --- ---  -----
//       -   -   -   x   x   x   |  no         0   0   0   
//       -   -   *   x   x   0   |  no         0   0   1 
//       -   *   *   x   0   0   |  no         0   1   1
//       *   -   *   0   x   0   |  no         1   0   1    (2)
//                               | 
//       -   -   *   x   x   1   |  yes        0   0   1 
//       -   *   *   x   0   1   |  yes        0   0   1 
//       -   *   -   x   1   x   |  yes        0   1   0
//       -   *   *   x   1   x   |  yes        0   1   0 
//       *   -   *   1   x   x   |  yes        1   0   0    (2)
//       *   -   *   0   x   1   |  yes        0   0   1    (2)
//
//      (2) Overflow is always accompanied by inexact.
//
//
// The FPU does not receive FSR.TEM bits. FSR.TEM bits are used within
// the FFU for the following cases:
// (1) fp_exception_ieee_754 trap detection
//     If a FPop generates an IEEE exception (nv, of, uf, dz, nx) for
//     which the corresponding trap enable (TEM) is set, then a
//     fp_exception_ieee_754 trap is caused. FSR.cexc field has one bit
//     set corresponding to the IEEE exception, and FSR.aexc field is
//     unchanged.
// (2) Clear FSR.nxc if an overflow (underflow) exception does trap
//     because FSR.OFM (FSR.UFM) is set, regardless of whether FSR.NXM
//     is set. Set FSR.ofc (FSR.ufc).
// (3) Clear FSR.ofc (FSR.ufc) if overflow (underflow) exception traps
//     and FSR.OFM (FSR.UFM) is not set and FSR.NXM is set. Set FSR.nxc.
// (4) Clear FSR.ufc if the result is exact (FSR.nxc is not set) and
//     FSR.UFM is not set. This case represents an exact denormalized
//     result.
//
// Note: - FPU will signal underflow to the FFU for all "tiny" results.
//       - FPU always reports inexact along with overflow.
   dff_s #(5) tem_dff(.din(dp_ctl_fsr_tem[4:0]), .clk(clk), .q(fsr_tem_d1),
                    .se(se), .si(), .so());
   assign fpexc_nxc =
          cpx_fpexc_d1[`FSR_NXC] &
          ~(( fsr_tem_d1[3] & cpx_fpexc_d1[`FSR_OFC]) |    // enabled  of
            ( fsr_tem_d1[2] & cpx_fpexc_d1[`FSR_UFC])  );  // enabled  uf

   assign fpexc_ofc =
          cpx_fpexc_d1[`FSR_OFC] &
          ~(~fsr_tem_d1[3] & fsr_tem_d1[0] & cpx_fpexc_d1[`FSR_NXC]); // disabled of and enabled nx

   assign fpexc_ufc =
          cpx_fpexc_d1[`FSR_UFC] &
          ~(~fsr_tem_d1[2] & ( fsr_tem_d1[0] & cpx_fpexc_d1[`FSR_NXC])) & // disabled uf & enabled nx
          ~(~fsr_tem_d1[2] & ~cpx_fpexc_d1[`FSR_NXC]) ; // disabled uf with no inexact
                                                               // (i.e. exact denorm w/ UFM=0)


   assign ieee_trap_vec[4:0] =
          ({cpx_fpexc_d1[4],
            fpexc_ofc,
            fpexc_ufc,
            cpx_fpexc_d1[1],
            fpexc_nxc       } & fsr_tem_d1[4:0]);


   // ieee trap has least priority.  Put through a flop for timing reasons
   assign ieee_trap = (|ieee_trap_vec[4:0]);
   assign take_ieee_trap = ieee_trap & is_fpu_result;
   dff_s trap_ieee_dff(.din(take_ieee_trap), .clk(clk), .q(ffu_tlu_trap_ieee754),
                     .se(se), .si(), .so());

   assign take_other_trap = unimpl_qual_w2;
   assign ffu_tlu_trap_other = take_other_trap;
   assign ffu_tlu_trap_ue = ue_trap_w3;
   
   // current exception
   assign fp_exc_w2[4:0] =
          ({cpx_fpexc_d1[4],
            fpexc_ofc,
            fpexc_ufc,
            cpx_fpexc_d1[1],
            fpexc_nxc       });



   
   // accrued exceptions
   // fp_exc_w2 = dp_ctl_fsr_aexc | cpx_fpexc_d1 & {5{~take_ieee_trap}};
   assign fp_exc_w2[`FSR_NVA] = dp_ctl_fsr_aexc[`FSR_NVC] | 
	                     is_fpu_result & cpx_fpexc_d1[`FSR_NVC] & ~fsr_tem_d1[`FSR_NVC];
   assign fp_exc_w2[`FSR_DZA] = dp_ctl_fsr_aexc[`FSR_DZC] | 
	                     is_fpu_result & cpx_fpexc_d1[`FSR_DZC] & ~fsr_tem_d1[`FSR_DZC];
   assign fp_exc_w2[`FSR_UFA] = dp_ctl_fsr_aexc[`FSR_UFC] | 
	                     is_fpu_result & fpexc_ufc & ~fsr_tem_d1[`FSR_UFC]; 
   assign fp_exc_w2[`FSR_OFA] = dp_ctl_fsr_aexc[`FSR_OFC] | 
	                     is_fpu_result & fpexc_ofc & ~fsr_tem_d1[`FSR_OFC];
   assign fp_exc_w2[`FSR_NXA] = dp_ctl_fsr_aexc[`FSR_NXC] |
	                     is_fpu_result & fpexc_nxc & ~fsr_tem_d1[`FSR_NXC];
   
   assign ctl_dp_exc_w2[9:5] = fp_exc_w2[9:5];
   // move, abs, etc will clear cexc, fpu_results will update, all else will leave unchanged
   wire   update_cexc;
   assign update_cexc = is_fpu_result | move_w2_vld;
   assign ctl_dp_exc_w2[4:0] = ((update_cexc)? fp_exc_w2[4:0] & {5{is_fpu_result}}:
                                dp_ctl_fsr_cexc[4:0]);



   ////////////////////////////////
   // ECC control
   ////////////////////////////////
   // Generation of the parity bit for writes
   wire [13:0] gen_synd_d1;
   wire        gen_par_hi;
   wire        gen_par_low;
   wire [6:0]  error_inj_data;
   output [13:0] ctl_frf_write_synd;
   dff_s #(14) gen_synd_dff (.din({dp_ctl_synd_out_high[6:0],dp_ctl_synd_out_low[6:0]}),
                           .q(gen_synd_d1[13:0]), .clk(clk), .se(se), .si(), .so());
   assign  gen_par_hi = ^gen_synd_d1[13:7];
   assign  gen_par_low = ^gen_synd_d1[6:0];
   assign  ctl_frf_write_synd[13:0] = ({gen_par_hi,gen_synd_d1[12:7],gen_par_low,gen_synd_d1[5:0]} ^ 
                                       {error_inj_data[6:0],error_inj_data[6:0]});
   /////////////////////////////////
   // error injection
   /////////////////////////////////
   // injection doesn't check for flush on wen
   assign  inject_err_next = ifu_ffu_inj_frferr & rf_wen_next;
   assign error_inj_data[6:0] = {7{inject_err}} & err_data[6:0];
   dff_s #(7) err_data_dff(.din(ifu_exu_ecc_mask[6:0]),
                     .q(err_data[6:0]),
                     .clk(clk), .se(se), .si(), .so());
   dff_s err_cntl(.din(inject_err_next),
                .q(inject_err),
                .clk(clk), .se(se), .si(), .so());
   // speculate on error injection (don't check flush_pipe etc)
   assign ffu_ifu_inj_ack = inject_err;


   // check the upper half on a double or a single with an even reg num
   // check the lower half on a double or a single with an odd reg num
   // ecc block will run on frf input for reads
   // otherwise it will run on the rd_data
   assign check_ecc_next = ren_rs2_m | fst_e | ren_rs1_w | bst_issue_c3_next;
   dff_s check_ecc_dff(.din(check_ecc_next), .clk(clk), .q(ctl_dp_ecc_sel_frf),
                     .se(se), .si(), .so());
   // rs1 will not be checked if a ce was detected on rs2.  If there was a ue on rs2
   // rs1 will be checked and a ce will be corrected, but the error on rs2 will be logged
   assign chk_rs1_w2 = ren_rs1_w2;
   assign chk_ecc_m[1] = fst_m & ~rd[0] & ~output_sel_fsr;
   assign chk_ecc_m[0] = fst_m & (~dest_single | rd[0]) & ~output_sel_fsr;
   assign chk_ecc_w[1] = ren_rs2_w & ~kill_eccchk_w & ~rs2[0];
   assign chk_ecc_w[0] = ren_rs2_w & ~kill_eccchk_w & (~source_single | rs2[0]);
   assign chk_ecc_w2[1] = chk_rs1_w2 & ~rs1[0];
   assign chk_ecc_w2[0] = chk_rs1_w2 & (~source_single | rs1[0]);

   assign chk_ecc[1:0] = chk_ecc_m[1:0] | chk_ecc_w[1:0] | chk_ecc_w2[1:0] | {2{bst_issue_c3}};
   dff_s #(2) chk_ecc_dff(.din(chk_ecc[1:0]), .clk(clk), .q(chk_ecc_prev[1:0]),
                        .se(se), .si(), .so());

   assign     error_detected[1] = |dp_ctl_synd_out_high[5:0];
   assign     error_detected[0] = |dp_ctl_synd_out_low[5:0];
   
   assign     possible_ue[1] = ~dp_ctl_synd_out_high[6] & chk_ecc[1];
   assign     possible_ue[0] = ~dp_ctl_synd_out_low[6] & chk_ecc[0];
   assign     ce[1] = dp_ctl_synd_out_high[6] & chk_ecc[1];
   assign     ce[0] = dp_ctl_synd_out_low[6] & chk_ecc[0];

   assign rollback_fst_m = ((dp_ctl_synd_out_high[6] & chk_ecc_m[1] & ~disable_ce_m) |
                        (dp_ctl_synd_out_low[6] & chk_ecc_m[0] & ~disable_ce_m));
   dff_s rollback_m2w(.din(rollback_fst_m), .clk(clk), .q(rollback_fst_w), .se(se), .si(), .so());
   dff_s #(2) possible_ue_dff(.din(possible_ue[1:0]), .clk(clk), .q(prev_poss_ue[1:0]),
                            .se(se), .si(), .so());
   dff_s #(2) ce_dff(.din(ce[1:0]), .clk(clk), .q(previous_ce[1:0]),
                            .se(se), .si(), .so());
   dff_s #(2) err_det_dff(.din(error_detected[1:0]), .clk(clk), .q(prev_err_detected[1:0]),
                            .se(se), .si(), .so());
   assign previous_ue = |(prev_err_detected[1:0] & prev_poss_ue[1:0]);
   
   dff_s #(2) ecc_wen1_dff(.din(ecc_wen_gen_next[1:0]), .clk(clk), .q(ecc_wen_gen[1:0]),
                        .se(se), .si(), .so());
   dff_s #(2) ecc_wen2_dff(.din(ecc_wen_next[1:0]), .clk(clk), .q(ecc_wen[1:0]),
                        .se(se), .si(), .so());
   // if the ecc error was in the m stage we need to check for a kill
   // if the ecc error was in the w stage we need to check flush
   // ECC errors on rs1 will not be written back to the frf.  The data that is used will be corrected.
   assign ecc_wen_gen_next[1:0] = previous_ce[1:0] & 
          {2{bst_issue_c4 | fst_ce_w | rollback_rs2_w2 | rollback_rs1_w3}};
   assign ecc_wen_next = ecc_wen_gen[1:0] & {2{~(fst_ce_w2 & flush_w2)}};
   
   // pass along ce and ue so trap can be signalled to ffu and tlu
   // if disable_ce_m then don't tell ifu reissue ce.  Instead convert to a ue.
   dff_s disable_ce_e2m(.din(ifu_exu_disable_ce_e), .clk(clk), .q(disable_ce_m),
                      .se(se), .si(), .so());
   dff_s disable_ce_m2w(.din(disable_ce_m), .clk(clk), .q(disable_ce_w),
                      .se(se), .si(), .so());
   assign fst_ce_w = rollback_fst_w & ~kill_eccchk_w;
   assign fst_ue_w = fst_w & (previous_ue | (disable_ce_w & |(previous_ce[1:0])))  & ~kill_eccchk_w;
   assign rollback_rs2_w2 = (ren_rs2_w2 & ~flush_w2 & |previous_ce[1:0] 
                             & ~rolled_back);
   assign rs2_ce_w2 = ren_rs2_w2 & |previous_ce[1:0] & ~rolled_back & ~previous_ue;
   assign rs2_ue_w2 = ren_rs2_w2 & (previous_ue | (rolled_back & |previous_ce[1:0]));
   // must check for flush because eccchk doesn't do this
   assign rs2_fst_ce_w2_vld = (rs2_ce_w2 | fst_ce_w2) & ~flush_w2;
   assign rs2_fst_ue_w2_vld = (rs2_ue_w2 | fst_ue_w2) & ~flush_w2;
   dff_s ce_w2w2(.din(fst_ce_w), .clk(clk), .q(fst_ce_w2),
               .se(se), .si(), .so());
   dff_s ue_w2w2(.din(fst_ue_w), .clk(clk), .q(fst_ue_w2),
               .se(se), .si(), .so());
   dff_s ce_w22w3(.din(rs2_fst_ce_w2_vld), .clk(clk), .q(rs2_fst_ce_w3),
               .se(se), .si(), .so());
   dff_s ue_w22w3(.din(rs2_fst_ue_w2_vld), .clk(clk), .q(rs2_fst_ue_w3),
               .se(se), .si(), .so());

   assign rs1_ce_w3 = ren_rs1_w3 & |previous_ce[1:0] & ~previous_ue & ~rolled_back;
   assign rollback_rs1_w3 = rs1_ce_w3 & ~ue_trap_w3;
   assign ce_w3 = (rs1_ce_w3 | rs2_fst_ce_w3);
   assign ue_w3 = (ren_rs1_w3 & (previous_ue | (rolled_back & |previous_ce[1:0]))) | rs2_fst_ue_w3;

   assign ffu_ifu_ecc_ce_w2 = (ce_w3 | bst_ce_c4);
   assign ffu_ifu_ecc_ue_w2 = (ue_w3 | bst_ue_c4);
   
   // error logging signals.  The error register priority is fst, bst, rs1_ue, rs2_ue, rs1_ce, rs2_ce
   assign log_new_err = (ren_rs2_w2 | bst_issue_c4 | fst_w | 
                         (ren_rs1_w3 & previous_ue) | (rs1_ce_w3 & ~rs2_fst_ue_w3));
   assign new_err_reg[5:0] = fst_w ?        rd[5:0]:
                             bst_issue_c4 ? bst_rs[5:0]:
                             ren_rs2_w2 ?    rs2[5:0]:
                                            rs1[5:0];
   assign err_reg_next[5:0] = (log_new_err) ? new_err_reg[5:0] : err_reg_d1[5:0];
   dff_s #(6) err_reg_dff(.din(err_reg_next[5:0]), .clk(clk), .q(err_reg_d1[5:0]),
                        .se(se), .si(), .so());
   assign ffu_ifu_err_reg_w2[5:0] = err_reg_d1[5:0];
   
   // storage of error syndrome for logging
   // For singles the invalid half of the syndrome is zeroed out.
   // The syndrome reported to the ifu will be latched until a new error is detected
   assign      new_err_synd[13:7] = gen_synd_d1[13:7] & {7{chk_ecc_prev[1]}};
   assign      new_err_synd[6:0] = gen_synd_d1[6:0] & {7{chk_ecc_prev[0]}};
   assign      err_synd_next[13:0] = (log_new_err)? new_err_synd: err_synd_d1;
   dff_s #(14) err_synd_d1ff(.din(err_synd_next[13:0]), .clk(clk), .q(err_synd_d1[13:0]),
                          .se(se), .si(), .so());
   assign      ffu_ifu_err_synd_w2[13:0] = err_synd_d1[13:0];

   // kill moves and fpu ops
   assign ecc_kill_rs2_w2 = rollback_rs2_w2 | (rs2_ue_w2 & nceen);
   

   // pipe along enable signal for ue traps
   assign nceen_next = (any_op_e)? ifu_exu_nceen_e: (nceen & ~rollback_fst_w);
   dff_s nceen_dff(.din(nceen_next), .clk(clk), .q(nceen),
                 .se(se), .si(), .so());
   assign ue_trap_w3 = (ue_w3 | bst_ue_c4) & nceen;

   // signals for killing stores on ecc
   // use this to kill any rs2/rd ce   
   assign ffu_ifu_fst_ce_w = rollback_fst_w;

   // These signals kill the entry in the store buffer for any ce or trapping ue.  Very critical timing.
   assign possible_kill_st_ce_m = ((fst_m & ~output_sel_fsr & ~(disable_ce_m & ~nceen)) |
                                   (bst_issue_c3 & ~(fixed_bst_ce & ~nceen)));
   assign possible_kill_st_ue_m = (fst_m & ~output_sel_fsr & nceen | bst_issue_c3 & nceen);
   assign kill_st_ce_w = (|previous_ce[1:0]) & possible_kill_st_ce_w;
   assign ffu_lsu_kill_fst_w = (previous_ue)? possible_kill_st_ue_w: kill_st_ce_w;
   dff_s kill_fst_ce_dff(.din(possible_kill_st_ce_m), .clk(clk), .q(possible_kill_st_ce_w),
                       .se(se), .si(), .so());
   dff_s kill_fst_ue_dff(.din(possible_kill_st_ue_m), .clk(clk), .q(possible_kill_st_ue_w),
                       .se(se), .si(), .so());

   // rollback signals
   assign rollback_c1_next = rollback_rs2_w2 | rollback_rs1_w3;
   dffr_s #(3) rollback_dff(.din({rollback_c1_next,rollback_c1_vld,rollback_c2}),
                         .q({rollback_c1, rollback_c2, rollback_c3}),
                         .clk(clk), .se(se), .si(), .so(), .rst(reset));
   // if both rs1 and rs2 rollback then the state machine needs to start on rs1
   assign rollback_c1_vld = rollback_c1 & ~ue_trap_w3 & ~rollback_rs1_w3;

   assign rolled_back_next = rollback_c1_vld | rolled_back & ~any_op_e;
   dffr_s rollback_state(.din(rolled_back_next), .q(rolled_back),
                        .rst(reset), .clk(clk),
                        .se(se), .si(), .so());
   
   //////////////////////////////
   // Performance counter signals
   //////////////////////////////
   assign ffu_tlu_fpu_tid[1:0] = tid[1:0] & {2{is_fpu_result}}; // don't toggle wire if not needed
   assign ffu_tlu_fpu_cmplt = is_fpu_result;

   sparc_ffu_ctl_visctl visctl(
                               .illegal_vis_e(illegal_vis_e),                               
                               .vis_nofrf_e(vis_nofrf_e),
                               .visop_e (visop_e),
                               .visop_m (visop_m),
                               .visop_w_vld (visop_w_vld),
                               .vis_wen_next (vis_wen_next),
                               .ifu_ffu_rnd_e(frs2_e[2:0]),
                               .fpu_rnd (fpu_rnd[1:0]),
                               .vis_result(vis_result),
                               /*AUTOINST*/
                               // Outputs
                               .ctl_vis_sel_add(ctl_vis_sel_add),
                               .ctl_vis_sel_log(ctl_vis_sel_log),
                               .ctl_vis_sel_align(ctl_vis_sel_align),
                               .ctl_vis_add32(ctl_vis_add32),
                               .ctl_vis_subtract(ctl_vis_subtract),
                               .ctl_vis_cin(ctl_vis_cin),
                               .ctl_vis_align0(ctl_vis_align0),
                               .ctl_vis_align2(ctl_vis_align2),
                               .ctl_vis_align4(ctl_vis_align4),
                               .ctl_vis_align6(ctl_vis_align6),
                               .ctl_vis_align_odd(ctl_vis_align_odd),
                               .ctl_vis_log_sel_pass(ctl_vis_log_sel_pass),
                               .ctl_vis_log_sel_nand(ctl_vis_log_sel_nand),
                               .ctl_vis_log_sel_nor(ctl_vis_log_sel_nor),
                               .ctl_vis_log_sel_xor(ctl_vis_log_sel_xor),
                               .ctl_vis_log_invert_rs1(ctl_vis_log_invert_rs1),
                               .ctl_vis_log_invert_rs2(ctl_vis_log_invert_rs2),
                               .ctl_vis_log_constant(ctl_vis_log_constant),
                               .ctl_vis_log_pass_const(ctl_vis_log_pass_const),
                               .ctl_vis_log_pass_rs1(ctl_vis_log_pass_rs1),
                               .ctl_vis_log_pass_rs2(ctl_vis_log_pass_rs2),
                               .ffu_exu_rsr_data_hi_m(ffu_exu_rsr_data_hi_m[31:0]),
                               .ffu_exu_rsr_data_mid_m(ffu_exu_rsr_data_mid_m[2:0]),
                               .ffu_exu_rsr_data_lo_m(ffu_exu_rsr_data_lo_m[7:0]),
                               .ctl_dp_wsr_data_w2(ctl_dp_wsr_data_w2[36:0]),
                               .ctl_dp_gsr_wsr_w2(ctl_dp_gsr_wsr_w2[3:0]),
                               .ctl_dp_thr_e(ctl_dp_thr_e[3:0]),
                               // Inputs
                               .clk     (clk),
                               .se      (se),
                               .reset   (reset),
                               .opf     (opf[8:0]),
                               .tid_w2  (tid_w2[1:0]),
                               .tid_e   (tid_e[1:0]),
                               .tid     (tid[1:0]),
                               .kill_w  (kill_w),
                               .ifu_tlu_sraddr_d(ifu_tlu_sraddr_d[6:0]),
                               .exu_ffu_wsr_inst_e(exu_ffu_wsr_inst_e),
                               .exu_ffu_gsr_align_m(exu_ffu_gsr_align_m[2:0]),
                               .exu_ffu_gsr_rnd_m(exu_ffu_gsr_rnd_m[2:0]),
                               .exu_ffu_gsr_mask_m(exu_ffu_gsr_mask_m[31:0]),
                               .exu_ffu_gsr_scale_m(exu_ffu_gsr_scale_m[4:0]),
                               .dp_ctl_fsr_rnd(dp_ctl_fsr_rnd[1:0]),
                               .flush_w2(flush_w2),
                               .thr_match_mw2(thr_match_mw2),
                               .thr_match_ww2(thr_match_ww2),
                               .ifu_tlu_inst_vld_w(ifu_tlu_inst_vld_w),
                               .ue_trap_w3(ue_trap_w3),
                               .frs1_e  (frs1_e[4:0]),
                               .frs2_e  (frs2_e[4:0]),
                               .frd_e   (frd_e[4:0]),
                               .rollback_c3(rollback_c3),
                               .rollback_rs2_w2(rollback_rs2_w2),
                               .visop   (visop),
                               .rollback_rs1_w3(rollback_rs1_w3),
                               .dp_ctl_gsr_mask_e(dp_ctl_gsr_mask_e[31:0]),
                               .dp_ctl_gsr_scale_e(dp_ctl_gsr_scale_e[4:0]));

endmodule // sparc_ffu_ctl
