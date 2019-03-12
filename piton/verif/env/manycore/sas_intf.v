// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: sas_intf.v
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
////////////////////////////////////////////////////////

`include "sys.h"
`include "iop.h"
`include "lsu.tmp.h"
`include "ifu.tmp.h"
`include "cross_module.tmp.h"
`define INTF0_WIDTH 61
`define INTF1_WIDTH 125
`define INTF2_WIDTH 192
`define INTF3_WIDTH 145
`define INTF4_WIDTH 109
`define INTF5_WIDTH 45
`define CLEAN_CYCLE 200

module sas_intf (/*AUTOARG*/
   // Inputs
   clk, rst_l
   );

   input   clk;
   input   rst_l;

   wire [`INTF0_WIDTH-1:0] i0_0_data;
   wire 		   i0_0_rdy;

   wire [`INTF3_WIDTH-1:0] i3_0_data;
   wire 		   i3_0_rdy;

   wire [`INTF4_WIDTH-1:0] i4_0_data;
   wire 		   i4_0_rdy;

   wire [`INTF5_WIDTH-1:0] i5_0_data;
   wire 		   i5_0_rdy;

   reg [1:0] 		  i0_0_ifu_lsu_ldst_size_m;
   reg [1:0] 		  i0_0_ifu_lsu_ldst_size_g;
   wire 		  i0_0_asi_internal_g;
   wire 		  i0_0_asi_quad_g;
   wire 		  i0_0_asi_blk_g;
   wire 		  i0_0_asi_binit_g;
   wire 		  i0_0_dcache_hit_g;
   wire			  i0_0_full_raw_g;
   wire			  i0_0_partial_raw_g;
   wire			  i0_0_ld_l2cache_rq;
   wire			  i0_0_st_inst_vld_g;
   wire			  i0_0_ld_inst_vld_g;

   reg[3:0]		  i4_0_fprs_set_e;
   reg[1:0]		  i4_0_new_fprs_e;
   reg[3:0]		  i4_0_fprs_set_m;
   reg[1:0]		  i4_0_new_fprs_m;
   reg[3:0]		  i4_0_fprs_set_w;
   reg[1:0]		  i4_0_new_fprs_w;
   reg			  i4_0_rstint_w;
   reg			  i4_0_hwint_w;
   reg			  i4_0_sftint_w;
   reg			  i4_0_hint_m;
   reg			  i4_0_hint_w;
   reg[3:0]		  i4_0_int_thr_w;

   reg			  i4_0_ic_inv_vld_f;
   reg			  i4_0_ic_inv_vld_s;
   reg[5:0]		  i4_0_ic_inv_addr_f;
   reg[5:0]		  i4_0_ic_inv_addr_s;
   reg			  i4_0_ic_inv_word1_f;
   reg			  i4_0_ic_inv_word1_s;
   reg			  i4_0_ic_inv_word0_f;
   reg			  i4_0_ic_inv_word0_s;
   reg[1:0]		  i4_0_ic_inv_way1_f;
   reg[1:0]		  i4_0_ic_inv_way1_s;
   reg[1:0]		  i4_0_ic_inv_way0_f;
   reg[1:0]		  i4_0_ic_inv_way0_s;
   reg			  i4_0_st_wr_dcache_m;
   reg			  i4_0_fill_dcache_m;
   reg[9:0]		  i4_0_dcache_fill_addr_m;
   reg			  i4_0_dva_svld_m;
   reg[4:0]		  i4_0_dva_snp_addr_m;
   reg[3:0]		  i4_0_dva_snp_set_vld_m;
   reg[1:0]		  i4_0_dva_snp_wy0_m;
   reg[1:0]		  i4_0_dva_snp_wy1_m;
   reg[1:0]		  i4_0_dva_snp_wy2_m;
   reg[1:0]		  i4_0_dva_snp_wy3_m;
   reg			  i4_0_st_wr_dcache_w;
   reg			  i4_0_fill_dcache_w;
   reg[9:0]		  i4_0_dcache_fill_addr_w;
   reg			  i4_0_dva_svld_w;
   reg[4:0]		  i4_0_dva_snp_addr_w;
   reg[3:0]		  i4_0_dva_snp_set_vld_w;
   reg[1:0]		  i4_0_dva_snp_wy0_w;
   reg[1:0]		  i4_0_dva_snp_wy1_w;
   reg[1:0]		  i4_0_dva_snp_wy2_w;
   reg[1:0]		  i4_0_dva_snp_wy3_w;
   wire			  i4_0_spu_trap_ack_w;
   wire			  i4_0_spu_illgl_va;
   wire[3:0]		  i4_0_tick_match;
   wire[3:0]		  i4_0_stick_match;
   wire[3:0]		  i4_0_hstick_match;
   wire			  i4_0_rstint_vld_w;
   wire			  i4_0_hwint_vld_w;
   wire			  i4_0_sftint_vld_w;
   wire			  i4_0_hint_vld_w;
   wire			  i4_0_trap;
   wire[3:0]		  i4_0_ld_int;
   wire			  i4_0_immu_miss;
   wire			  i4_0_dmmu_miss;
   wire[1:0]		  i4_0_cpx_tid;
   wire		  	  i4_0_itlb_repl_vld;
   wire		  	  i4_0_dtlb_repl_vld;
   wire[63:0]		  i4_0_tlb_repl_vec;
   wire[5:0]		  i4_0_tlb_repl_idx;

   wire [`INTF0_WIDTH-1:0] i0_1_data;
   wire 		   i0_1_rdy;

   wire [`INTF3_WIDTH-1:0] i3_1_data;
   wire 		   i3_1_rdy;

   wire [`INTF4_WIDTH-1:0] i4_1_data;
   wire 		   i4_1_rdy;

   wire [`INTF5_WIDTH-1:0] i5_1_data;
   wire 		   i5_1_rdy;

   reg [1:0] 		  i0_1_ifu_lsu_ldst_size_m;
   reg [1:0] 		  i0_1_ifu_lsu_ldst_size_g;
   wire 		  i0_1_asi_internal_g;
   wire 		  i0_1_asi_quad_g;
   wire 		  i0_1_asi_blk_g;
   wire 		  i0_1_asi_binit_g;
   wire 		  i0_1_dcache_hit_g;
   wire			  i0_1_full_raw_g;
   wire			  i0_1_partial_raw_g;
   wire			  i0_1_ld_l2cache_rq;
   wire			  i0_1_st_inst_vld_g;
   wire			  i0_1_ld_inst_vld_g;

   reg[3:0]		  i4_1_fprs_set_e;
   reg[1:0]		  i4_1_new_fprs_e;
   reg[3:0]		  i4_1_fprs_set_m;
   reg[1:0]		  i4_1_new_fprs_m;
   reg[3:0]		  i4_1_fprs_set_w;
   reg[1:0]		  i4_1_new_fprs_w;
   reg			  i4_1_rstint_w;
   reg			  i4_1_hwint_w;
   reg			  i4_1_sftint_w;
   reg			  i4_1_hint_m;
   reg			  i4_1_hint_w;
   reg[3:0]		  i4_1_int_thr_w;

   reg			  i4_1_ic_inv_vld_f;
   reg			  i4_1_ic_inv_vld_s;
   reg[5:0]		  i4_1_ic_inv_addr_f;
   reg[5:0]		  i4_1_ic_inv_addr_s;
   reg			  i4_1_ic_inv_word1_f;
   reg			  i4_1_ic_inv_word1_s;
   reg			  i4_1_ic_inv_word0_f;
   reg			  i4_1_ic_inv_word0_s;
   reg[1:0]		  i4_1_ic_inv_way1_f;
   reg[1:0]		  i4_1_ic_inv_way1_s;
   reg[1:0]		  i4_1_ic_inv_way0_f;
   reg[1:0]		  i4_1_ic_inv_way0_s;
   reg			  i4_1_st_wr_dcache_m;
   reg			  i4_1_fill_dcache_m;
   reg[9:0]		  i4_1_dcache_fill_addr_m;
   reg			  i4_1_dva_svld_m;
   reg[4:0]		  i4_1_dva_snp_addr_m;
   reg[3:0]		  i4_1_dva_snp_set_vld_m;
   reg[1:0]		  i4_1_dva_snp_wy0_m;
   reg[1:0]		  i4_1_dva_snp_wy1_m;
   reg[1:0]		  i4_1_dva_snp_wy2_m;
   reg[1:0]		  i4_1_dva_snp_wy3_m;
   reg			  i4_1_st_wr_dcache_w;
   reg			  i4_1_fill_dcache_w;
   reg[9:0]		  i4_1_dcache_fill_addr_w;
   reg			  i4_1_dva_svld_w;
   reg[4:0]		  i4_1_dva_snp_addr_w;
   reg[3:0]		  i4_1_dva_snp_set_vld_w;
   reg[1:0]		  i4_1_dva_snp_wy0_w;
   reg[1:0]		  i4_1_dva_snp_wy1_w;
   reg[1:0]		  i4_1_dva_snp_wy2_w;
   reg[1:0]		  i4_1_dva_snp_wy3_w;
   wire			  i4_1_spu_trap_ack_w;
   wire			  i4_1_spu_illgl_va;
   wire[3:0]		  i4_1_tick_match;
   wire[3:0]		  i4_1_stick_match;
   wire[3:0]		  i4_1_hstick_match;
   wire			  i4_1_rstint_vld_w;
   wire			  i4_1_hwint_vld_w;
   wire			  i4_1_sftint_vld_w;
   wire			  i4_1_hint_vld_w;
   wire			  i4_1_trap;
   wire[3:0]		  i4_1_ld_int;
   wire			  i4_1_immu_miss;
   wire			  i4_1_dmmu_miss;
   wire[1:0]		  i4_1_cpx_tid;
   wire		  	  i4_1_itlb_repl_vld;
   wire		  	  i4_1_dtlb_repl_vld;
   wire[63:0]		  i4_1_tlb_repl_vec;
   wire[5:0]		  i4_1_tlb_repl_idx;

   wire [`INTF0_WIDTH-1:0] i0_2_data;
   wire 		   i0_2_rdy;

   wire [`INTF3_WIDTH-1:0] i3_2_data;
   wire 		   i3_2_rdy;

   wire [`INTF4_WIDTH-1:0] i4_2_data;
   wire 		   i4_2_rdy;

   wire [`INTF5_WIDTH-1:0] i5_2_data;
   wire 		   i5_2_rdy;

   reg [1:0] 		  i0_2_ifu_lsu_ldst_size_m;
   reg [1:0] 		  i0_2_ifu_lsu_ldst_size_g;
   wire 		  i0_2_asi_internal_g;
   wire 		  i0_2_asi_quad_g;
   wire 		  i0_2_asi_blk_g;
   wire 		  i0_2_asi_binit_g;
   wire 		  i0_2_dcache_hit_g;
   wire			  i0_2_full_raw_g;
   wire			  i0_2_partial_raw_g;
   wire			  i0_2_ld_l2cache_rq;
   wire			  i0_2_st_inst_vld_g;
   wire			  i0_2_ld_inst_vld_g;

   reg[3:0]		  i4_2_fprs_set_e;
   reg[1:0]		  i4_2_new_fprs_e;
   reg[3:0]		  i4_2_fprs_set_m;
   reg[1:0]		  i4_2_new_fprs_m;
   reg[3:0]		  i4_2_fprs_set_w;
   reg[1:0]		  i4_2_new_fprs_w;
   reg			  i4_2_rstint_w;
   reg			  i4_2_hwint_w;
   reg			  i4_2_sftint_w;
   reg			  i4_2_hint_m;
   reg			  i4_2_hint_w;
   reg[3:0]		  i4_2_int_thr_w;

   reg			  i4_2_ic_inv_vld_f;
   reg			  i4_2_ic_inv_vld_s;
   reg[5:0]		  i4_2_ic_inv_addr_f;
   reg[5:0]		  i4_2_ic_inv_addr_s;
   reg			  i4_2_ic_inv_word1_f;
   reg			  i4_2_ic_inv_word1_s;
   reg			  i4_2_ic_inv_word0_f;
   reg			  i4_2_ic_inv_word0_s;
   reg[1:0]		  i4_2_ic_inv_way1_f;
   reg[1:0]		  i4_2_ic_inv_way1_s;
   reg[1:0]		  i4_2_ic_inv_way0_f;
   reg[1:0]		  i4_2_ic_inv_way0_s;
   reg			  i4_2_st_wr_dcache_m;
   reg			  i4_2_fill_dcache_m;
   reg[9:0]		  i4_2_dcache_fill_addr_m;
   reg			  i4_2_dva_svld_m;
   reg[4:0]		  i4_2_dva_snp_addr_m;
   reg[3:0]		  i4_2_dva_snp_set_vld_m;
   reg[1:0]		  i4_2_dva_snp_wy0_m;
   reg[1:0]		  i4_2_dva_snp_wy1_m;
   reg[1:0]		  i4_2_dva_snp_wy2_m;
   reg[1:0]		  i4_2_dva_snp_wy3_m;
   reg			  i4_2_st_wr_dcache_w;
   reg			  i4_2_fill_dcache_w;
   reg[9:0]		  i4_2_dcache_fill_addr_w;
   reg			  i4_2_dva_svld_w;
   reg[4:0]		  i4_2_dva_snp_addr_w;
   reg[3:0]		  i4_2_dva_snp_set_vld_w;
   reg[1:0]		  i4_2_dva_snp_wy0_w;
   reg[1:0]		  i4_2_dva_snp_wy1_w;
   reg[1:0]		  i4_2_dva_snp_wy2_w;
   reg[1:0]		  i4_2_dva_snp_wy3_w;
   wire			  i4_2_spu_trap_ack_w;
   wire			  i4_2_spu_illgl_va;
   wire[3:0]		  i4_2_tick_match;
   wire[3:0]		  i4_2_stick_match;
   wire[3:0]		  i4_2_hstick_match;
   wire			  i4_2_rstint_vld_w;
   wire			  i4_2_hwint_vld_w;
   wire			  i4_2_sftint_vld_w;
   wire			  i4_2_hint_vld_w;
   wire			  i4_2_trap;
   wire[3:0]		  i4_2_ld_int;
   wire			  i4_2_immu_miss;
   wire			  i4_2_dmmu_miss;
   wire[1:0]		  i4_2_cpx_tid;
   wire		  	  i4_2_itlb_repl_vld;
   wire		  	  i4_2_dtlb_repl_vld;
   wire[63:0]		  i4_2_tlb_repl_vec;
   wire[5:0]		  i4_2_tlb_repl_idx;

   wire [`INTF0_WIDTH-1:0] i0_3_data;
   wire 		   i0_3_rdy;

   wire [`INTF3_WIDTH-1:0] i3_3_data;
   wire 		   i3_3_rdy;

   wire [`INTF4_WIDTH-1:0] i4_3_data;
   wire 		   i4_3_rdy;

   wire [`INTF5_WIDTH-1:0] i5_3_data;
   wire 		   i5_3_rdy;

   reg [1:0] 		  i0_3_ifu_lsu_ldst_size_m;
   reg [1:0] 		  i0_3_ifu_lsu_ldst_size_g;
   wire 		  i0_3_asi_internal_g;
   wire 		  i0_3_asi_quad_g;
   wire 		  i0_3_asi_blk_g;
   wire 		  i0_3_asi_binit_g;
   wire 		  i0_3_dcache_hit_g;
   wire			  i0_3_full_raw_g;
   wire			  i0_3_partial_raw_g;
   wire			  i0_3_ld_l2cache_rq;
   wire			  i0_3_st_inst_vld_g;
   wire			  i0_3_ld_inst_vld_g;

   reg[3:0]		  i4_3_fprs_set_e;
   reg[1:0]		  i4_3_new_fprs_e;
   reg[3:0]		  i4_3_fprs_set_m;
   reg[1:0]		  i4_3_new_fprs_m;
   reg[3:0]		  i4_3_fprs_set_w;
   reg[1:0]		  i4_3_new_fprs_w;
   reg			  i4_3_rstint_w;
   reg			  i4_3_hwint_w;
   reg			  i4_3_sftint_w;
   reg			  i4_3_hint_m;
   reg			  i4_3_hint_w;
   reg[3:0]		  i4_3_int_thr_w;

   reg			  i4_3_ic_inv_vld_f;
   reg			  i4_3_ic_inv_vld_s;
   reg[5:0]		  i4_3_ic_inv_addr_f;
   reg[5:0]		  i4_3_ic_inv_addr_s;
   reg			  i4_3_ic_inv_word1_f;
   reg			  i4_3_ic_inv_word1_s;
   reg			  i4_3_ic_inv_word0_f;
   reg			  i4_3_ic_inv_word0_s;
   reg[1:0]		  i4_3_ic_inv_way1_f;
   reg[1:0]		  i4_3_ic_inv_way1_s;
   reg[1:0]		  i4_3_ic_inv_way0_f;
   reg[1:0]		  i4_3_ic_inv_way0_s;
   reg			  i4_3_st_wr_dcache_m;
   reg			  i4_3_fill_dcache_m;
   reg[9:0]		  i4_3_dcache_fill_addr_m;
   reg			  i4_3_dva_svld_m;
   reg[4:0]		  i4_3_dva_snp_addr_m;
   reg[3:0]		  i4_3_dva_snp_set_vld_m;
   reg[1:0]		  i4_3_dva_snp_wy0_m;
   reg[1:0]		  i4_3_dva_snp_wy1_m;
   reg[1:0]		  i4_3_dva_snp_wy2_m;
   reg[1:0]		  i4_3_dva_snp_wy3_m;
   reg			  i4_3_st_wr_dcache_w;
   reg			  i4_3_fill_dcache_w;
   reg[9:0]		  i4_3_dcache_fill_addr_w;
   reg			  i4_3_dva_svld_w;
   reg[4:0]		  i4_3_dva_snp_addr_w;
   reg[3:0]		  i4_3_dva_snp_set_vld_w;
   reg[1:0]		  i4_3_dva_snp_wy0_w;
   reg[1:0]		  i4_3_dva_snp_wy1_w;
   reg[1:0]		  i4_3_dva_snp_wy2_w;
   reg[1:0]		  i4_3_dva_snp_wy3_w;
   wire			  i4_3_spu_trap_ack_w;
   wire			  i4_3_spu_illgl_va;
   wire[3:0]		  i4_3_tick_match;
   wire[3:0]		  i4_3_stick_match;
   wire[3:0]		  i4_3_hstick_match;
   wire			  i4_3_rstint_vld_w;
   wire			  i4_3_hwint_vld_w;
   wire			  i4_3_sftint_vld_w;
   wire			  i4_3_hint_vld_w;
   wire			  i4_3_trap;
   wire[3:0]		  i4_3_ld_int;
   wire			  i4_3_immu_miss;
   wire			  i4_3_dmmu_miss;
   wire[1:0]		  i4_3_cpx_tid;
   wire		  	  i4_3_itlb_repl_vld;
   wire		  	  i4_3_dtlb_repl_vld;
   wire[63:0]		  i4_3_tlb_repl_vec;
   wire[5:0]		  i4_3_tlb_repl_idx;

   wire [`INTF0_WIDTH-1:0] i0_4_data;
   wire 		   i0_4_rdy;

   wire [`INTF3_WIDTH-1:0] i3_4_data;
   wire 		   i3_4_rdy;

   wire [`INTF4_WIDTH-1:0] i4_4_data;
   wire 		   i4_4_rdy;

   wire [`INTF5_WIDTH-1:0] i5_4_data;
   wire 		   i5_4_rdy;

   reg [1:0] 		  i0_4_ifu_lsu_ldst_size_m;
   reg [1:0] 		  i0_4_ifu_lsu_ldst_size_g;
   wire 		  i0_4_asi_internal_g;
   wire 		  i0_4_asi_quad_g;
   wire 		  i0_4_asi_blk_g;
   wire 		  i0_4_asi_binit_g;
   wire 		  i0_4_dcache_hit_g;
   wire			  i0_4_full_raw_g;
   wire			  i0_4_partial_raw_g;
   wire			  i0_4_ld_l2cache_rq;
   wire			  i0_4_st_inst_vld_g;
   wire			  i0_4_ld_inst_vld_g;

   reg[3:0]		  i4_4_fprs_set_e;
   reg[1:0]		  i4_4_new_fprs_e;
   reg[3:0]		  i4_4_fprs_set_m;
   reg[1:0]		  i4_4_new_fprs_m;
   reg[3:0]		  i4_4_fprs_set_w;
   reg[1:0]		  i4_4_new_fprs_w;
   reg			  i4_4_rstint_w;
   reg			  i4_4_hwint_w;
   reg			  i4_4_sftint_w;
   reg			  i4_4_hint_m;
   reg			  i4_4_hint_w;
   reg[3:0]		  i4_4_int_thr_w;

   reg			  i4_4_ic_inv_vld_f;
   reg			  i4_4_ic_inv_vld_s;
   reg[5:0]		  i4_4_ic_inv_addr_f;
   reg[5:0]		  i4_4_ic_inv_addr_s;
   reg			  i4_4_ic_inv_word1_f;
   reg			  i4_4_ic_inv_word1_s;
   reg			  i4_4_ic_inv_word0_f;
   reg			  i4_4_ic_inv_word0_s;
   reg[1:0]		  i4_4_ic_inv_way1_f;
   reg[1:0]		  i4_4_ic_inv_way1_s;
   reg[1:0]		  i4_4_ic_inv_way0_f;
   reg[1:0]		  i4_4_ic_inv_way0_s;
   reg			  i4_4_st_wr_dcache_m;
   reg			  i4_4_fill_dcache_m;
   reg[9:0]		  i4_4_dcache_fill_addr_m;
   reg			  i4_4_dva_svld_m;
   reg[4:0]		  i4_4_dva_snp_addr_m;
   reg[3:0]		  i4_4_dva_snp_set_vld_m;
   reg[1:0]		  i4_4_dva_snp_wy0_m;
   reg[1:0]		  i4_4_dva_snp_wy1_m;
   reg[1:0]		  i4_4_dva_snp_wy2_m;
   reg[1:0]		  i4_4_dva_snp_wy3_m;
   reg			  i4_4_st_wr_dcache_w;
   reg			  i4_4_fill_dcache_w;
   reg[9:0]		  i4_4_dcache_fill_addr_w;
   reg			  i4_4_dva_svld_w;
   reg[4:0]		  i4_4_dva_snp_addr_w;
   reg[3:0]		  i4_4_dva_snp_set_vld_w;
   reg[1:0]		  i4_4_dva_snp_wy0_w;
   reg[1:0]		  i4_4_dva_snp_wy1_w;
   reg[1:0]		  i4_4_dva_snp_wy2_w;
   reg[1:0]		  i4_4_dva_snp_wy3_w;
   wire			  i4_4_spu_trap_ack_w;
   wire			  i4_4_spu_illgl_va;
   wire[3:0]		  i4_4_tick_match;
   wire[3:0]		  i4_4_stick_match;
   wire[3:0]		  i4_4_hstick_match;
   wire			  i4_4_rstint_vld_w;
   wire			  i4_4_hwint_vld_w;
   wire			  i4_4_sftint_vld_w;
   wire			  i4_4_hint_vld_w;
   wire			  i4_4_trap;
   wire[3:0]		  i4_4_ld_int;
   wire			  i4_4_immu_miss;
   wire			  i4_4_dmmu_miss;
   wire[1:0]		  i4_4_cpx_tid;
   wire		  	  i4_4_itlb_repl_vld;
   wire		  	  i4_4_dtlb_repl_vld;
   wire[63:0]		  i4_4_tlb_repl_vec;
   wire[5:0]		  i4_4_tlb_repl_idx;

   wire [`INTF0_WIDTH-1:0] i0_5_data;
   wire 		   i0_5_rdy;

   wire [`INTF3_WIDTH-1:0] i3_5_data;
   wire 		   i3_5_rdy;

   wire [`INTF4_WIDTH-1:0] i4_5_data;
   wire 		   i4_5_rdy;

   wire [`INTF5_WIDTH-1:0] i5_5_data;
   wire 		   i5_5_rdy;

   reg [1:0] 		  i0_5_ifu_lsu_ldst_size_m;
   reg [1:0] 		  i0_5_ifu_lsu_ldst_size_g;
   wire 		  i0_5_asi_internal_g;
   wire 		  i0_5_asi_quad_g;
   wire 		  i0_5_asi_blk_g;
   wire 		  i0_5_asi_binit_g;
   wire 		  i0_5_dcache_hit_g;
   wire			  i0_5_full_raw_g;
   wire			  i0_5_partial_raw_g;
   wire			  i0_5_ld_l2cache_rq;
   wire			  i0_5_st_inst_vld_g;
   wire			  i0_5_ld_inst_vld_g;

   reg[3:0]		  i4_5_fprs_set_e;
   reg[1:0]		  i4_5_new_fprs_e;
   reg[3:0]		  i4_5_fprs_set_m;
   reg[1:0]		  i4_5_new_fprs_m;
   reg[3:0]		  i4_5_fprs_set_w;
   reg[1:0]		  i4_5_new_fprs_w;
   reg			  i4_5_rstint_w;
   reg			  i4_5_hwint_w;
   reg			  i4_5_sftint_w;
   reg			  i4_5_hint_m;
   reg			  i4_5_hint_w;
   reg[3:0]		  i4_5_int_thr_w;

   reg			  i4_5_ic_inv_vld_f;
   reg			  i4_5_ic_inv_vld_s;
   reg[5:0]		  i4_5_ic_inv_addr_f;
   reg[5:0]		  i4_5_ic_inv_addr_s;
   reg			  i4_5_ic_inv_word1_f;
   reg			  i4_5_ic_inv_word1_s;
   reg			  i4_5_ic_inv_word0_f;
   reg			  i4_5_ic_inv_word0_s;
   reg[1:0]		  i4_5_ic_inv_way1_f;
   reg[1:0]		  i4_5_ic_inv_way1_s;
   reg[1:0]		  i4_5_ic_inv_way0_f;
   reg[1:0]		  i4_5_ic_inv_way0_s;
   reg			  i4_5_st_wr_dcache_m;
   reg			  i4_5_fill_dcache_m;
   reg[9:0]		  i4_5_dcache_fill_addr_m;
   reg			  i4_5_dva_svld_m;
   reg[4:0]		  i4_5_dva_snp_addr_m;
   reg[3:0]		  i4_5_dva_snp_set_vld_m;
   reg[1:0]		  i4_5_dva_snp_wy0_m;
   reg[1:0]		  i4_5_dva_snp_wy1_m;
   reg[1:0]		  i4_5_dva_snp_wy2_m;
   reg[1:0]		  i4_5_dva_snp_wy3_m;
   reg			  i4_5_st_wr_dcache_w;
   reg			  i4_5_fill_dcache_w;
   reg[9:0]		  i4_5_dcache_fill_addr_w;
   reg			  i4_5_dva_svld_w;
   reg[4:0]		  i4_5_dva_snp_addr_w;
   reg[3:0]		  i4_5_dva_snp_set_vld_w;
   reg[1:0]		  i4_5_dva_snp_wy0_w;
   reg[1:0]		  i4_5_dva_snp_wy1_w;
   reg[1:0]		  i4_5_dva_snp_wy2_w;
   reg[1:0]		  i4_5_dva_snp_wy3_w;
   wire			  i4_5_spu_trap_ack_w;
   wire			  i4_5_spu_illgl_va;
   wire[3:0]		  i4_5_tick_match;
   wire[3:0]		  i4_5_stick_match;
   wire[3:0]		  i4_5_hstick_match;
   wire			  i4_5_rstint_vld_w;
   wire			  i4_5_hwint_vld_w;
   wire			  i4_5_sftint_vld_w;
   wire			  i4_5_hint_vld_w;
   wire			  i4_5_trap;
   wire[3:0]		  i4_5_ld_int;
   wire			  i4_5_immu_miss;
   wire			  i4_5_dmmu_miss;
   wire[1:0]		  i4_5_cpx_tid;
   wire		  	  i4_5_itlb_repl_vld;
   wire		  	  i4_5_dtlb_repl_vld;
   wire[63:0]		  i4_5_tlb_repl_vec;
   wire[5:0]		  i4_5_tlb_repl_idx;

   wire [`INTF0_WIDTH-1:0] i0_6_data;
   wire 		   i0_6_rdy;

   wire [`INTF3_WIDTH-1:0] i3_6_data;
   wire 		   i3_6_rdy;

   wire [`INTF4_WIDTH-1:0] i4_6_data;
   wire 		   i4_6_rdy;

   wire [`INTF5_WIDTH-1:0] i5_6_data;
   wire 		   i5_6_rdy;

   reg [1:0] 		  i0_6_ifu_lsu_ldst_size_m;
   reg [1:0] 		  i0_6_ifu_lsu_ldst_size_g;
   wire 		  i0_6_asi_internal_g;
   wire 		  i0_6_asi_quad_g;
   wire 		  i0_6_asi_blk_g;
   wire 		  i0_6_asi_binit_g;
   wire 		  i0_6_dcache_hit_g;
   wire			  i0_6_full_raw_g;
   wire			  i0_6_partial_raw_g;
   wire			  i0_6_ld_l2cache_rq;
   wire			  i0_6_st_inst_vld_g;
   wire			  i0_6_ld_inst_vld_g;

   reg[3:0]		  i4_6_fprs_set_e;
   reg[1:0]		  i4_6_new_fprs_e;
   reg[3:0]		  i4_6_fprs_set_m;
   reg[1:0]		  i4_6_new_fprs_m;
   reg[3:0]		  i4_6_fprs_set_w;
   reg[1:0]		  i4_6_new_fprs_w;
   reg			  i4_6_rstint_w;
   reg			  i4_6_hwint_w;
   reg			  i4_6_sftint_w;
   reg			  i4_6_hint_m;
   reg			  i4_6_hint_w;
   reg[3:0]		  i4_6_int_thr_w;

   reg			  i4_6_ic_inv_vld_f;
   reg			  i4_6_ic_inv_vld_s;
   reg[5:0]		  i4_6_ic_inv_addr_f;
   reg[5:0]		  i4_6_ic_inv_addr_s;
   reg			  i4_6_ic_inv_word1_f;
   reg			  i4_6_ic_inv_word1_s;
   reg			  i4_6_ic_inv_word0_f;
   reg			  i4_6_ic_inv_word0_s;
   reg[1:0]		  i4_6_ic_inv_way1_f;
   reg[1:0]		  i4_6_ic_inv_way1_s;
   reg[1:0]		  i4_6_ic_inv_way0_f;
   reg[1:0]		  i4_6_ic_inv_way0_s;
   reg			  i4_6_st_wr_dcache_m;
   reg			  i4_6_fill_dcache_m;
   reg[9:0]		  i4_6_dcache_fill_addr_m;
   reg			  i4_6_dva_svld_m;
   reg[4:0]		  i4_6_dva_snp_addr_m;
   reg[3:0]		  i4_6_dva_snp_set_vld_m;
   reg[1:0]		  i4_6_dva_snp_wy0_m;
   reg[1:0]		  i4_6_dva_snp_wy1_m;
   reg[1:0]		  i4_6_dva_snp_wy2_m;
   reg[1:0]		  i4_6_dva_snp_wy3_m;
   reg			  i4_6_st_wr_dcache_w;
   reg			  i4_6_fill_dcache_w;
   reg[9:0]		  i4_6_dcache_fill_addr_w;
   reg			  i4_6_dva_svld_w;
   reg[4:0]		  i4_6_dva_snp_addr_w;
   reg[3:0]		  i4_6_dva_snp_set_vld_w;
   reg[1:0]		  i4_6_dva_snp_wy0_w;
   reg[1:0]		  i4_6_dva_snp_wy1_w;
   reg[1:0]		  i4_6_dva_snp_wy2_w;
   reg[1:0]		  i4_6_dva_snp_wy3_w;
   wire			  i4_6_spu_trap_ack_w;
   wire			  i4_6_spu_illgl_va;
   wire[3:0]		  i4_6_tick_match;
   wire[3:0]		  i4_6_stick_match;
   wire[3:0]		  i4_6_hstick_match;
   wire			  i4_6_rstint_vld_w;
   wire			  i4_6_hwint_vld_w;
   wire			  i4_6_sftint_vld_w;
   wire			  i4_6_hint_vld_w;
   wire			  i4_6_trap;
   wire[3:0]		  i4_6_ld_int;
   wire			  i4_6_immu_miss;
   wire			  i4_6_dmmu_miss;
   wire[1:0]		  i4_6_cpx_tid;
   wire		  	  i4_6_itlb_repl_vld;
   wire		  	  i4_6_dtlb_repl_vld;
   wire[63:0]		  i4_6_tlb_repl_vec;
   wire[5:0]		  i4_6_tlb_repl_idx;

   wire [`INTF0_WIDTH-1:0] i0_7_data;
   wire 		   i0_7_rdy;

   wire [`INTF3_WIDTH-1:0] i3_7_data;
   wire 		   i3_7_rdy;

   wire [`INTF4_WIDTH-1:0] i4_7_data;
   wire 		   i4_7_rdy;

   wire [`INTF5_WIDTH-1:0] i5_7_data;
   wire 		   i5_7_rdy;

   reg [1:0] 		  i0_7_ifu_lsu_ldst_size_m;
   reg [1:0] 		  i0_7_ifu_lsu_ldst_size_g;
   wire 		  i0_7_asi_internal_g;
   wire 		  i0_7_asi_quad_g;
   wire 		  i0_7_asi_blk_g;
   wire 		  i0_7_asi_binit_g;
   wire 		  i0_7_dcache_hit_g;
   wire			  i0_7_full_raw_g;
   wire			  i0_7_partial_raw_g;
   wire			  i0_7_ld_l2cache_rq;
   wire			  i0_7_st_inst_vld_g;
   wire			  i0_7_ld_inst_vld_g;

   reg[3:0]		  i4_7_fprs_set_e;
   reg[1:0]		  i4_7_new_fprs_e;
   reg[3:0]		  i4_7_fprs_set_m;
   reg[1:0]		  i4_7_new_fprs_m;
   reg[3:0]		  i4_7_fprs_set_w;
   reg[1:0]		  i4_7_new_fprs_w;
   reg			  i4_7_rstint_w;
   reg			  i4_7_hwint_w;
   reg			  i4_7_sftint_w;
   reg			  i4_7_hint_m;
   reg			  i4_7_hint_w;
   reg[3:0]		  i4_7_int_thr_w;

   reg			  i4_7_ic_inv_vld_f;
   reg			  i4_7_ic_inv_vld_s;
   reg[5:0]		  i4_7_ic_inv_addr_f;
   reg[5:0]		  i4_7_ic_inv_addr_s;
   reg			  i4_7_ic_inv_word1_f;
   reg			  i4_7_ic_inv_word1_s;
   reg			  i4_7_ic_inv_word0_f;
   reg			  i4_7_ic_inv_word0_s;
   reg[1:0]		  i4_7_ic_inv_way1_f;
   reg[1:0]		  i4_7_ic_inv_way1_s;
   reg[1:0]		  i4_7_ic_inv_way0_f;
   reg[1:0]		  i4_7_ic_inv_way0_s;
   reg			  i4_7_st_wr_dcache_m;
   reg			  i4_7_fill_dcache_m;
   reg[9:0]		  i4_7_dcache_fill_addr_m;
   reg			  i4_7_dva_svld_m;
   reg[4:0]		  i4_7_dva_snp_addr_m;
   reg[3:0]		  i4_7_dva_snp_set_vld_m;
   reg[1:0]		  i4_7_dva_snp_wy0_m;
   reg[1:0]		  i4_7_dva_snp_wy1_m;
   reg[1:0]		  i4_7_dva_snp_wy2_m;
   reg[1:0]		  i4_7_dva_snp_wy3_m;
   reg			  i4_7_st_wr_dcache_w;
   reg			  i4_7_fill_dcache_w;
   reg[9:0]		  i4_7_dcache_fill_addr_w;
   reg			  i4_7_dva_svld_w;
   reg[4:0]		  i4_7_dva_snp_addr_w;
   reg[3:0]		  i4_7_dva_snp_set_vld_w;
   reg[1:0]		  i4_7_dva_snp_wy0_w;
   reg[1:0]		  i4_7_dva_snp_wy1_w;
   reg[1:0]		  i4_7_dva_snp_wy2_w;
   reg[1:0]		  i4_7_dva_snp_wy3_w;
   wire			  i4_7_spu_trap_ack_w;
   wire			  i4_7_spu_illgl_va;
   wire[3:0]		  i4_7_tick_match;
   wire[3:0]		  i4_7_stick_match;
   wire[3:0]		  i4_7_hstick_match;
   wire			  i4_7_rstint_vld_w;
   wire			  i4_7_hwint_vld_w;
   wire			  i4_7_sftint_vld_w;
   wire			  i4_7_hint_vld_w;
   wire			  i4_7_trap;
   wire[3:0]		  i4_7_ld_int;
   wire			  i4_7_immu_miss;
   wire			  i4_7_dmmu_miss;
   wire[1:0]		  i4_7_cpx_tid;
   wire		  	  i4_7_itlb_repl_vld;
   wire		  	  i4_7_dtlb_repl_vld;
   wire[63:0]		  i4_7_tlb_repl_vec;
   wire[5:0]		  i4_7_tlb_repl_idx;


   wire [`INTF1_WIDTH-1:0] i1_0_data;
   wire 		   i1_0_rdy;

   wire [`INTF2_WIDTH-1:0] i2_0_data;
   reg 			   i2_0_rdy;

   reg    		   pcx_sctag0_data_rdy_px2;

   reg[2:0] 	     	   sctag0_cpuid_c8;
   reg			   i2_0_hit_c4;
   reg			   i2_0_hit_c5;
   reg			   i2_0_hit_c6;
   reg			   i2_0_hit_c7;
   reg			   i2_0_hit_c8;

   wire [`INTF1_WIDTH-1:0] i1_1_data;
   wire 		   i1_1_rdy;

   wire [`INTF2_WIDTH-1:0] i2_1_data;
   reg 			   i2_1_rdy;

   reg    		   pcx_sctag1_data_rdy_px2;

   reg[2:0] 	     	   sctag1_cpuid_c8;
   reg			   i2_1_hit_c4;
   reg			   i2_1_hit_c5;
   reg			   i2_1_hit_c6;
   reg			   i2_1_hit_c7;
   reg			   i2_1_hit_c8;

   wire [`INTF1_WIDTH-1:0] i1_2_data;
   wire 		   i1_2_rdy;

   wire [`INTF2_WIDTH-1:0] i2_2_data;
   reg 			   i2_2_rdy;

   reg    		   pcx_sctag2_data_rdy_px2;

   reg[2:0] 	     	   sctag2_cpuid_c8;
   reg			   i2_2_hit_c4;
   reg			   i2_2_hit_c5;
   reg			   i2_2_hit_c6;
   reg			   i2_2_hit_c7;
   reg			   i2_2_hit_c8;

   wire [`INTF1_WIDTH-1:0] i1_3_data;
   wire 		   i1_3_rdy;

   wire [`INTF2_WIDTH-1:0] i2_3_data;
   reg 			   i2_3_rdy;

   reg    		   pcx_sctag3_data_rdy_px2;

   reg[2:0] 	     	   sctag3_cpuid_c8;
   reg			   i2_3_hit_c4;
   reg			   i2_3_hit_c5;
   reg			   i2_3_hit_c6;
   reg			   i2_3_hit_c7;
   reg			   i2_3_hit_c8;


`ifdef SAS_DISABLE
`else

   always @(posedge clk) begin
`ifdef RTL_SPARC0
      i0_0_ifu_lsu_ldst_size_m <= #1 `SPARC_CORE0.`LSU_PATH.ifu_lsu_ldst_size_e[1:0];
      i0_0_ifu_lsu_ldst_size_g <= #1 i0_0_ifu_lsu_ldst_size_m;
`endif //ifdef RTL_SPARC0

`ifdef RTL_SPARC1
      i0_1_ifu_lsu_ldst_size_m <= #1 `SPARC_CORE1.`LSU_PATH.ifu_lsu_ldst_size_e[1:0];
      i0_1_ifu_lsu_ldst_size_g <= #1 i0_1_ifu_lsu_ldst_size_m;
`endif //ifdef RTL_SPARC1

`ifdef RTL_SPARC2
      i0_2_ifu_lsu_ldst_size_m <= #1 `SPARC_CORE2.`LSU_PATH.ifu_lsu_ldst_size_e[1:0];
      i0_2_ifu_lsu_ldst_size_g <= #1 i0_2_ifu_lsu_ldst_size_m;
`endif //ifdef RTL_SPARC2

`ifdef RTL_SPARC3
      i0_3_ifu_lsu_ldst_size_m <= #1 `SPARC_CORE3.`LSU_PATH.ifu_lsu_ldst_size_e[1:0];
      i0_3_ifu_lsu_ldst_size_g <= #1 i0_3_ifu_lsu_ldst_size_m;
`endif //ifdef RTL_SPARC3

`ifdef RTL_SPARC4
      i0_4_ifu_lsu_ldst_size_m <= #1 `SPARC_CORE4.`LSU_PATH.ifu_lsu_ldst_size_e[1:0];
      i0_4_ifu_lsu_ldst_size_g <= #1 i0_4_ifu_lsu_ldst_size_m;
`endif //ifdef RTL_SPARC4

`ifdef RTL_SPARC5
      i0_5_ifu_lsu_ldst_size_m <= #1 `SPARC_CORE5.`LSU_PATH.ifu_lsu_ldst_size_e[1:0];
      i0_5_ifu_lsu_ldst_size_g <= #1 i0_5_ifu_lsu_ldst_size_m;
`endif //ifdef RTL_SPARC5

`ifdef RTL_SPARC6
      i0_6_ifu_lsu_ldst_size_m <= #1 `SPARC_CORE6.`LSU_PATH.ifu_lsu_ldst_size_e[1:0];
      i0_6_ifu_lsu_ldst_size_g <= #1 i0_6_ifu_lsu_ldst_size_m;
`endif //ifdef RTL_SPARC6

`ifdef RTL_SPARC7
      i0_7_ifu_lsu_ldst_size_m <= #1 `SPARC_CORE7.`LSU_PATH.ifu_lsu_ldst_size_e[1:0];
      i0_7_ifu_lsu_ldst_size_g <= #1 i0_7_ifu_lsu_ldst_size_m;
`endif //ifdef RTL_SPARC7


`ifdef ENV_SPARC1
      i0_1_ifu_lsu_ldst_size_m <= #1 2'h0;
      i0_1_ifu_lsu_ldst_size_g <= #1 2'h0;
`endif // !ifdef RTL_SPARC1

`ifdef ENV_SPARC2
      i0_2_ifu_lsu_ldst_size_m <= #1 2'h0;
      i0_2_ifu_lsu_ldst_size_g <= #1 2'h0;
`endif // !ifdef RTL_SPARC2

`ifdef ENV_SPARC3
      i0_3_ifu_lsu_ldst_size_m <= #1 2'h0;
      i0_3_ifu_lsu_ldst_size_g <= #1 2'h0;
`endif // !ifdef RTL_SPARC3

`ifdef ENV_SPARC4
      i0_4_ifu_lsu_ldst_size_m <= #1 2'h0;
      i0_4_ifu_lsu_ldst_size_g <= #1 2'h0;
`endif // !ifdef RTL_SPARC4

`ifdef ENV_SPARC5
      i0_5_ifu_lsu_ldst_size_m <= #1 2'h0;
      i0_5_ifu_lsu_ldst_size_g <= #1 2'h0;
`endif // !ifdef RTL_SPARC5

`ifdef ENV_SPARC6
      i0_6_ifu_lsu_ldst_size_m <= #1 2'h0;
      i0_6_ifu_lsu_ldst_size_g <= #1 2'h0;
`endif // !ifdef RTL_SPARC6

`ifdef ENV_SPARC7
      i0_7_ifu_lsu_ldst_size_m <= #1 2'h0;
      i0_7_ifu_lsu_ldst_size_g <= #1 2'h0;
`endif // !ifdef RTL_SPARC7

   end // always @(posedge clk)

`ifdef RTL_SPARC0
   assign i0_0_asi_internal_g = `SPARC_CORE0.`LSU_PATH.dctl.lsu_alt_space_g &
			        `SPARC_CORE0.`LSU_PATH.dctl.asi_internal_g;
   assign i0_0_asi_quad_g     = `SPARC_CORE0.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE0.`LSU_PATH.dctl.quad_asi_g;
   assign i0_0_asi_blk_g      = `SPARC_CORE0.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE0.`LSU_PATH.dctl.blk_asi_g;
   assign i0_0_asi_binit_g    = `SPARC_CORE0.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE0.`LSU_PATH.dctl.binit_quad_asi_g;
   assign i0_0_dcache_hit_g= |(`SPARC_CORE0.`LSU_PATH.dtlb.cache_way_hit[`L1D_WAY_COUNT-1:0]);
   assign i0_0_full_raw_g=
	(|`SPARC_CORE0.`LSU_PATH.qctl1.stb_ld_full_raw[7:0]) &
	 ~(`SPARC_CORE0.`LSU_PATH.qctl1.stb_cam_mhit |
	   `SPARC_CORE0.`LSU_PATH.qctl1.ldq_hit_g |
	   `SPARC_CORE0.`LSU_PATH.qctl1.io_ld);
   assign i0_0_partial_raw_g=
	 (|`SPARC_CORE0.`LSU_PATH.qctl1.stb_ld_partial_raw[7:0]) |
	 `SPARC_CORE0.`LSU_PATH.qctl1.stb_cam_mhit |
	 `SPARC_CORE0.`LSU_PATH.qctl1.ldq_hit_g |
	 (`SPARC_CORE0.`LSU_PATH.qctl1.io_ld &
	  `SPARC_CORE0.`LSU_PATH.qctl1.stb_not_empty);
   assign i0_0_ld_l2cache_rq=
	(`SPARC_CORE0.`LSU_PATH.qctl1.ld0_l2cache_rq &
	 `SPARC_CORE0.`LSU_PATH.qctl1.thread0_g) |
	(`SPARC_CORE0.`LSU_PATH.qctl1.ld1_l2cache_rq &
	 `SPARC_CORE0.`LSU_PATH.qctl1.thread1_g) |
	(`SPARC_CORE0.`LSU_PATH.qctl1.ld2_l2cache_rq &
	 `SPARC_CORE0.`LSU_PATH.qctl1.thread2_g) |
	(`SPARC_CORE0.`LSU_PATH.qctl1.ld3_l2cache_rq &
	 `SPARC_CORE0.`LSU_PATH.qctl1.thread3_g);
   assign i0_0_ld_inst_vld_g =
	`SPARC_CORE0.`LSU_PATH.dctl.ld_inst_vld_g &
        ~(|cmp_top.sas_tasks.task0.spc0_force_flush[3:0]);
   assign i0_0_st_inst_vld_g =
	`SPARC_CORE0.`LSU_PATH.dctl.st_inst_vld_g &
	~`SPARC_CORE0.`LSU_PATH.stb_rwctl.ffu_lsu_kill_fst_w &
        ~(|cmp_top.sas_tasks.task0.spc0_force_flush[3:0]);

   assign i0_0_data =
		     {1'b0,
		      1'b0,
		      1'b0,
		      1'b0,
		      i0_0_asi_internal_g,
		      i0_0_asi_quad_g,
		      i0_0_asi_blk_g,
		      i0_0_asi_binit_g,
		      `SPARC_CORE0.`LSU_PATH.dctl.ldd_force_l2access_g,
		      i0_0_ld_l2cache_rq,
		      i0_0_full_raw_g,
		      i0_0_partial_raw_g,
		      i0_0_dcache_hit_g,
		      i0_0_ifu_lsu_ldst_size_g[1:0],
		      `SPARC_CORE0.`LSU_PATH.dctl.ld_inst_vld_g,
		      i0_0_st_inst_vld_g,
		      `SPARC_CORE0.`LSU_PATH.qctl1.thread0_g,
		      `SPARC_CORE0.`LSU_PATH.qctl1.thread1_g,
		      `SPARC_CORE0.`LSU_PATH.qctl1.thread2_g,
		      `SPARC_CORE0.`LSU_PATH.qctl1.thread3_g,
		      `SPARC_CORE0.`LSU_PATH.dtlb.pgnum_g[29:0],
		      `SPARC_CORE0.`LSU_PATH.dctldp.ldst_va_g[9:0]};

   assign i0_0_rdy =
		     (i0_0_ld_inst_vld_g |
		      i0_0_st_inst_vld_g);
`endif // ifdef RTL_SPARC0

`ifdef RTL_SPARC1
   assign i0_1_asi_internal_g = `SPARC_CORE1.`LSU_PATH.dctl.lsu_alt_space_g &
			        `SPARC_CORE1.`LSU_PATH.dctl.asi_internal_g;
   assign i0_1_asi_quad_g     = `SPARC_CORE1.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE1.`LSU_PATH.dctl.quad_asi_g;
   assign i0_1_asi_blk_g      = `SPARC_CORE1.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE1.`LSU_PATH.dctl.blk_asi_g;
   assign i0_1_asi_binit_g    = `SPARC_CORE1.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE1.`LSU_PATH.dctl.binit_quad_asi_g;
   assign i0_1_dcache_hit_g= |(`SPARC_CORE1.`LSU_PATH.dtlb.cache_way_hit[`L1D_WAY_COUNT-1:0]);
   assign i0_1_full_raw_g=
	(|`SPARC_CORE1.`LSU_PATH.qctl1.stb_ld_full_raw[7:0]) &
	 ~(`SPARC_CORE1.`LSU_PATH.qctl1.stb_cam_mhit |
	   `SPARC_CORE1.`LSU_PATH.qctl1.ldq_hit_g |
	   `SPARC_CORE1.`LSU_PATH.qctl1.io_ld);
   assign i0_1_partial_raw_g=
	 (|`SPARC_CORE1.`LSU_PATH.qctl1.stb_ld_partial_raw[7:0]) |
	 `SPARC_CORE1.`LSU_PATH.qctl1.stb_cam_mhit |
	 `SPARC_CORE1.`LSU_PATH.qctl1.ldq_hit_g |
	 (`SPARC_CORE1.`LSU_PATH.qctl1.io_ld &
	  `SPARC_CORE1.`LSU_PATH.qctl1.stb_not_empty);
   assign i0_1_ld_l2cache_rq=
	(`SPARC_CORE1.`LSU_PATH.qctl1.ld0_l2cache_rq &
	 `SPARC_CORE1.`LSU_PATH.qctl1.thread0_g) |
	(`SPARC_CORE1.`LSU_PATH.qctl1.ld1_l2cache_rq &
	 `SPARC_CORE1.`LSU_PATH.qctl1.thread1_g) |
	(`SPARC_CORE1.`LSU_PATH.qctl1.ld2_l2cache_rq &
	 `SPARC_CORE1.`LSU_PATH.qctl1.thread2_g) |
	(`SPARC_CORE1.`LSU_PATH.qctl1.ld3_l2cache_rq &
	 `SPARC_CORE1.`LSU_PATH.qctl1.thread3_g);
   assign i0_1_ld_inst_vld_g =
	`SPARC_CORE1.`LSU_PATH.dctl.ld_inst_vld_g &
        ~(|cmp_top.sas_tasks.task1.spc0_force_flush[3:0]);
   assign i0_1_st_inst_vld_g =
	`SPARC_CORE1.`LSU_PATH.dctl.st_inst_vld_g &
	~`SPARC_CORE1.`LSU_PATH.stb_rwctl.ffu_lsu_kill_fst_w &
        ~(|cmp_top.sas_tasks.task1.spc0_force_flush[3:0]);

   assign i0_1_data =
		     {1'b0,
		      1'b0,
		      1'b0,
		      1'b0,
		      i0_1_asi_internal_g,
		      i0_1_asi_quad_g,
		      i0_1_asi_blk_g,
		      i0_1_asi_binit_g,
		      `SPARC_CORE1.`LSU_PATH.dctl.ldd_force_l2access_g,
		      i0_1_ld_l2cache_rq,
		      i0_1_full_raw_g,
		      i0_1_partial_raw_g,
		      i0_1_dcache_hit_g,
		      i0_1_ifu_lsu_ldst_size_g[1:0],
		      `SPARC_CORE1.`LSU_PATH.dctl.ld_inst_vld_g,
		      i0_1_st_inst_vld_g,
		      `SPARC_CORE1.`LSU_PATH.qctl1.thread0_g,
		      `SPARC_CORE1.`LSU_PATH.qctl1.thread1_g,
		      `SPARC_CORE1.`LSU_PATH.qctl1.thread2_g,
		      `SPARC_CORE1.`LSU_PATH.qctl1.thread3_g,
		      `SPARC_CORE1.`LSU_PATH.dtlb.pgnum_g[29:0],
		      `SPARC_CORE1.`LSU_PATH.dctldp.ldst_va_g[9:0]};

   assign i0_1_rdy =
		     (i0_1_ld_inst_vld_g |
		      i0_1_st_inst_vld_g);
`endif // ifdef RTL_SPARC1

`ifdef RTL_SPARC2
   assign i0_2_asi_internal_g = `SPARC_CORE2.`LSU_PATH.dctl.lsu_alt_space_g &
			        `SPARC_CORE2.`LSU_PATH.dctl.asi_internal_g;
   assign i0_2_asi_quad_g     = `SPARC_CORE2.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE2.`LSU_PATH.dctl.quad_asi_g;
   assign i0_2_asi_blk_g      = `SPARC_CORE2.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE2.`LSU_PATH.dctl.blk_asi_g;
   assign i0_2_asi_binit_g    = `SPARC_CORE2.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE2.`LSU_PATH.dctl.binit_quad_asi_g;
   assign i0_2_dcache_hit_g= |(`SPARC_CORE2.`LSU_PATH.dtlb.cache_way_hit[`L1D_WAY_COUNT-1:0]);
   assign i0_2_full_raw_g=
	(|`SPARC_CORE2.`LSU_PATH.qctl1.stb_ld_full_raw[7:0]) &
	 ~(`SPARC_CORE2.`LSU_PATH.qctl1.stb_cam_mhit |
	   `SPARC_CORE2.`LSU_PATH.qctl1.ldq_hit_g |
	   `SPARC_CORE2.`LSU_PATH.qctl1.io_ld);
   assign i0_2_partial_raw_g=
	 (|`SPARC_CORE2.`LSU_PATH.qctl1.stb_ld_partial_raw[7:0]) |
	 `SPARC_CORE2.`LSU_PATH.qctl1.stb_cam_mhit |
	 `SPARC_CORE2.`LSU_PATH.qctl1.ldq_hit_g |
	 (`SPARC_CORE2.`LSU_PATH.qctl1.io_ld &
	  `SPARC_CORE2.`LSU_PATH.qctl1.stb_not_empty);
   assign i0_2_ld_l2cache_rq=
	(`SPARC_CORE2.`LSU_PATH.qctl1.ld0_l2cache_rq &
	 `SPARC_CORE2.`LSU_PATH.qctl1.thread0_g) |
	(`SPARC_CORE2.`LSU_PATH.qctl1.ld1_l2cache_rq &
	 `SPARC_CORE2.`LSU_PATH.qctl1.thread1_g) |
	(`SPARC_CORE2.`LSU_PATH.qctl1.ld2_l2cache_rq &
	 `SPARC_CORE2.`LSU_PATH.qctl1.thread2_g) |
	(`SPARC_CORE2.`LSU_PATH.qctl1.ld3_l2cache_rq &
	 `SPARC_CORE2.`LSU_PATH.qctl1.thread3_g);
   assign i0_2_ld_inst_vld_g =
	`SPARC_CORE2.`LSU_PATH.dctl.ld_inst_vld_g &
        ~(|cmp_top.sas_tasks.task2.spc0_force_flush[3:0]);
   assign i0_2_st_inst_vld_g =
	`SPARC_CORE2.`LSU_PATH.dctl.st_inst_vld_g &
	~`SPARC_CORE2.`LSU_PATH.stb_rwctl.ffu_lsu_kill_fst_w &
        ~(|cmp_top.sas_tasks.task2.spc0_force_flush[3:0]);

   assign i0_2_data =
		     {1'b0,
		      1'b0,
		      1'b0,
		      1'b0,
		      i0_2_asi_internal_g,
		      i0_2_asi_quad_g,
		      i0_2_asi_blk_g,
		      i0_2_asi_binit_g,
		      `SPARC_CORE2.`LSU_PATH.dctl.ldd_force_l2access_g,
		      i0_2_ld_l2cache_rq,
		      i0_2_full_raw_g,
		      i0_2_partial_raw_g,
		      i0_2_dcache_hit_g,
		      i0_2_ifu_lsu_ldst_size_g[1:0],
		      `SPARC_CORE2.`LSU_PATH.dctl.ld_inst_vld_g,
		      i0_2_st_inst_vld_g,
		      `SPARC_CORE2.`LSU_PATH.qctl1.thread0_g,
		      `SPARC_CORE2.`LSU_PATH.qctl1.thread1_g,
		      `SPARC_CORE2.`LSU_PATH.qctl1.thread2_g,
		      `SPARC_CORE2.`LSU_PATH.qctl1.thread3_g,
		      `SPARC_CORE2.`LSU_PATH.dtlb.pgnum_g[29:0],
		      `SPARC_CORE2.`LSU_PATH.dctldp.ldst_va_g[9:0]};

   assign i0_2_rdy =
		     (i0_2_ld_inst_vld_g |
		      i0_2_st_inst_vld_g);
`endif // ifdef RTL_SPARC2

`ifdef RTL_SPARC3
   assign i0_3_asi_internal_g = `SPARC_CORE3.`LSU_PATH.dctl.lsu_alt_space_g &
			        `SPARC_CORE3.`LSU_PATH.dctl.asi_internal_g;
   assign i0_3_asi_quad_g     = `SPARC_CORE3.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE3.`LSU_PATH.dctl.quad_asi_g;
   assign i0_3_asi_blk_g      = `SPARC_CORE3.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE3.`LSU_PATH.dctl.blk_asi_g;
   assign i0_3_asi_binit_g    = `SPARC_CORE3.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE3.`LSU_PATH.dctl.binit_quad_asi_g;
   assign i0_3_dcache_hit_g= |(`SPARC_CORE3.`LSU_PATH.dtlb.cache_way_hit[`L1D_WAY_COUNT-1:0]);
   assign i0_3_full_raw_g=
	(|`SPARC_CORE3.`LSU_PATH.qctl1.stb_ld_full_raw[7:0]) &
	 ~(`SPARC_CORE3.`LSU_PATH.qctl1.stb_cam_mhit |
	   `SPARC_CORE3.`LSU_PATH.qctl1.ldq_hit_g |
	   `SPARC_CORE3.`LSU_PATH.qctl1.io_ld);
   assign i0_3_partial_raw_g=
	 (|`SPARC_CORE3.`LSU_PATH.qctl1.stb_ld_partial_raw[7:0]) |
	 `SPARC_CORE3.`LSU_PATH.qctl1.stb_cam_mhit |
	 `SPARC_CORE3.`LSU_PATH.qctl1.ldq_hit_g |
	 (`SPARC_CORE3.`LSU_PATH.qctl1.io_ld &
	  `SPARC_CORE3.`LSU_PATH.qctl1.stb_not_empty);
   assign i0_3_ld_l2cache_rq=
	(`SPARC_CORE3.`LSU_PATH.qctl1.ld0_l2cache_rq &
	 `SPARC_CORE3.`LSU_PATH.qctl1.thread0_g) |
	(`SPARC_CORE3.`LSU_PATH.qctl1.ld1_l2cache_rq &
	 `SPARC_CORE3.`LSU_PATH.qctl1.thread1_g) |
	(`SPARC_CORE3.`LSU_PATH.qctl1.ld2_l2cache_rq &
	 `SPARC_CORE3.`LSU_PATH.qctl1.thread2_g) |
	(`SPARC_CORE3.`LSU_PATH.qctl1.ld3_l2cache_rq &
	 `SPARC_CORE3.`LSU_PATH.qctl1.thread3_g);
   assign i0_3_ld_inst_vld_g =
	`SPARC_CORE3.`LSU_PATH.dctl.ld_inst_vld_g &
        ~(|cmp_top.sas_tasks.task3.spc0_force_flush[3:0]);
   assign i0_3_st_inst_vld_g =
	`SPARC_CORE3.`LSU_PATH.dctl.st_inst_vld_g &
	~`SPARC_CORE3.`LSU_PATH.stb_rwctl.ffu_lsu_kill_fst_w &
        ~(|cmp_top.sas_tasks.task3.spc0_force_flush[3:0]);

   assign i0_3_data =
		     {1'b0,
		      1'b0,
		      1'b0,
		      1'b0,
		      i0_3_asi_internal_g,
		      i0_3_asi_quad_g,
		      i0_3_asi_blk_g,
		      i0_3_asi_binit_g,
		      `SPARC_CORE3.`LSU_PATH.dctl.ldd_force_l2access_g,
		      i0_3_ld_l2cache_rq,
		      i0_3_full_raw_g,
		      i0_3_partial_raw_g,
		      i0_3_dcache_hit_g,
		      i0_3_ifu_lsu_ldst_size_g[1:0],
		      `SPARC_CORE3.`LSU_PATH.dctl.ld_inst_vld_g,
		      i0_3_st_inst_vld_g,
		      `SPARC_CORE3.`LSU_PATH.qctl1.thread0_g,
		      `SPARC_CORE3.`LSU_PATH.qctl1.thread1_g,
		      `SPARC_CORE3.`LSU_PATH.qctl1.thread2_g,
		      `SPARC_CORE3.`LSU_PATH.qctl1.thread3_g,
		      `SPARC_CORE3.`LSU_PATH.dtlb.pgnum_g[29:0],
		      `SPARC_CORE3.`LSU_PATH.dctldp.ldst_va_g[9:0]};

   assign i0_3_rdy =
		     (i0_3_ld_inst_vld_g |
		      i0_3_st_inst_vld_g);
`endif // ifdef RTL_SPARC3

`ifdef RTL_SPARC4
   assign i0_4_asi_internal_g = `SPARC_CORE4.`LSU_PATH.dctl.lsu_alt_space_g &
			        `SPARC_CORE4.`LSU_PATH.dctl.asi_internal_g;
   assign i0_4_asi_quad_g     = `SPARC_CORE4.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE4.`LSU_PATH.dctl.quad_asi_g;
   assign i0_4_asi_blk_g      = `SPARC_CORE4.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE4.`LSU_PATH.dctl.blk_asi_g;
   assign i0_4_asi_binit_g    = `SPARC_CORE4.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE4.`LSU_PATH.dctl.binit_quad_asi_g;
   assign i0_4_dcache_hit_g= |(`SPARC_CORE4.`LSU_PATH.dtlb.cache_way_hit[`L1D_WAY_COUNT-1:0]);
   assign i0_4_full_raw_g=
	(|`SPARC_CORE4.`LSU_PATH.qctl1.stb_ld_full_raw[7:0]) &
	 ~(`SPARC_CORE4.`LSU_PATH.qctl1.stb_cam_mhit |
	   `SPARC_CORE4.`LSU_PATH.qctl1.ldq_hit_g |
	   `SPARC_CORE4.`LSU_PATH.qctl1.io_ld);
   assign i0_4_partial_raw_g=
	 (|`SPARC_CORE4.`LSU_PATH.qctl1.stb_ld_partial_raw[7:0]) |
	 `SPARC_CORE4.`LSU_PATH.qctl1.stb_cam_mhit |
	 `SPARC_CORE4.`LSU_PATH.qctl1.ldq_hit_g |
	 (`SPARC_CORE4.`LSU_PATH.qctl1.io_ld &
	  `SPARC_CORE4.`LSU_PATH.qctl1.stb_not_empty);
   assign i0_4_ld_l2cache_rq=
	(`SPARC_CORE4.`LSU_PATH.qctl1.ld0_l2cache_rq &
	 `SPARC_CORE4.`LSU_PATH.qctl1.thread0_g) |
	(`SPARC_CORE4.`LSU_PATH.qctl1.ld1_l2cache_rq &
	 `SPARC_CORE4.`LSU_PATH.qctl1.thread1_g) |
	(`SPARC_CORE4.`LSU_PATH.qctl1.ld2_l2cache_rq &
	 `SPARC_CORE4.`LSU_PATH.qctl1.thread2_g) |
	(`SPARC_CORE4.`LSU_PATH.qctl1.ld3_l2cache_rq &
	 `SPARC_CORE4.`LSU_PATH.qctl1.thread3_g);
   assign i0_4_ld_inst_vld_g =
	`SPARC_CORE4.`LSU_PATH.dctl.ld_inst_vld_g &
        ~(|cmp_top.sas_tasks.task4.spc0_force_flush[3:0]);
   assign i0_4_st_inst_vld_g =
	`SPARC_CORE4.`LSU_PATH.dctl.st_inst_vld_g &
	~`SPARC_CORE4.`LSU_PATH.stb_rwctl.ffu_lsu_kill_fst_w &
        ~(|cmp_top.sas_tasks.task4.spc0_force_flush[3:0]);

   assign i0_4_data =
		     {1'b0,
		      1'b0,
		      1'b0,
		      1'b0,
		      i0_4_asi_internal_g,
		      i0_4_asi_quad_g,
		      i0_4_asi_blk_g,
		      i0_4_asi_binit_g,
		      `SPARC_CORE4.`LSU_PATH.dctl.ldd_force_l2access_g,
		      i0_4_ld_l2cache_rq,
		      i0_4_full_raw_g,
		      i0_4_partial_raw_g,
		      i0_4_dcache_hit_g,
		      i0_4_ifu_lsu_ldst_size_g[1:0],
		      `SPARC_CORE4.`LSU_PATH.dctl.ld_inst_vld_g,
		      i0_4_st_inst_vld_g,
		      `SPARC_CORE4.`LSU_PATH.qctl1.thread0_g,
		      `SPARC_CORE4.`LSU_PATH.qctl1.thread1_g,
		      `SPARC_CORE4.`LSU_PATH.qctl1.thread2_g,
		      `SPARC_CORE4.`LSU_PATH.qctl1.thread3_g,
		      `SPARC_CORE4.`LSU_PATH.dtlb.pgnum_g[29:0],
		      `SPARC_CORE4.`LSU_PATH.dctldp.ldst_va_g[9:0]};

   assign i0_4_rdy =
		     (i0_4_ld_inst_vld_g |
		      i0_4_st_inst_vld_g);
`endif // ifdef RTL_SPARC4

`ifdef RTL_SPARC5
   assign i0_5_asi_internal_g = `SPARC_CORE5.`LSU_PATH.dctl.lsu_alt_space_g &
			        `SPARC_CORE5.`LSU_PATH.dctl.asi_internal_g;
   assign i0_5_asi_quad_g     = `SPARC_CORE5.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE5.`LSU_PATH.dctl.quad_asi_g;
   assign i0_5_asi_blk_g      = `SPARC_CORE5.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE5.`LSU_PATH.dctl.blk_asi_g;
   assign i0_5_asi_binit_g    = `SPARC_CORE5.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE5.`LSU_PATH.dctl.binit_quad_asi_g;
   assign i0_5_dcache_hit_g= |(`SPARC_CORE5.`LSU_PATH.dtlb.cache_way_hit[`L1D_WAY_COUNT-1:0]);
   assign i0_5_full_raw_g=
	(|`SPARC_CORE5.`LSU_PATH.qctl1.stb_ld_full_raw[7:0]) &
	 ~(`SPARC_CORE5.`LSU_PATH.qctl1.stb_cam_mhit |
	   `SPARC_CORE5.`LSU_PATH.qctl1.ldq_hit_g |
	   `SPARC_CORE5.`LSU_PATH.qctl1.io_ld);
   assign i0_5_partial_raw_g=
	 (|`SPARC_CORE5.`LSU_PATH.qctl1.stb_ld_partial_raw[7:0]) |
	 `SPARC_CORE5.`LSU_PATH.qctl1.stb_cam_mhit |
	 `SPARC_CORE5.`LSU_PATH.qctl1.ldq_hit_g |
	 (`SPARC_CORE5.`LSU_PATH.qctl1.io_ld &
	  `SPARC_CORE5.`LSU_PATH.qctl1.stb_not_empty);
   assign i0_5_ld_l2cache_rq=
	(`SPARC_CORE5.`LSU_PATH.qctl1.ld0_l2cache_rq &
	 `SPARC_CORE5.`LSU_PATH.qctl1.thread0_g) |
	(`SPARC_CORE5.`LSU_PATH.qctl1.ld1_l2cache_rq &
	 `SPARC_CORE5.`LSU_PATH.qctl1.thread1_g) |
	(`SPARC_CORE5.`LSU_PATH.qctl1.ld2_l2cache_rq &
	 `SPARC_CORE5.`LSU_PATH.qctl1.thread2_g) |
	(`SPARC_CORE5.`LSU_PATH.qctl1.ld3_l2cache_rq &
	 `SPARC_CORE5.`LSU_PATH.qctl1.thread3_g);
   assign i0_5_ld_inst_vld_g =
	`SPARC_CORE5.`LSU_PATH.dctl.ld_inst_vld_g &
        ~(|cmp_top.sas_tasks.task5.spc0_force_flush[3:0]);
   assign i0_5_st_inst_vld_g =
	`SPARC_CORE5.`LSU_PATH.dctl.st_inst_vld_g &
	~`SPARC_CORE5.`LSU_PATH.stb_rwctl.ffu_lsu_kill_fst_w &
        ~(|cmp_top.sas_tasks.task5.spc0_force_flush[3:0]);

   assign i0_5_data =
		     {1'b0,
		      1'b0,
		      1'b0,
		      1'b0,
		      i0_5_asi_internal_g,
		      i0_5_asi_quad_g,
		      i0_5_asi_blk_g,
		      i0_5_asi_binit_g,
		      `SPARC_CORE5.`LSU_PATH.dctl.ldd_force_l2access_g,
		      i0_5_ld_l2cache_rq,
		      i0_5_full_raw_g,
		      i0_5_partial_raw_g,
		      i0_5_dcache_hit_g,
		      i0_5_ifu_lsu_ldst_size_g[1:0],
		      `SPARC_CORE5.`LSU_PATH.dctl.ld_inst_vld_g,
		      i0_5_st_inst_vld_g,
		      `SPARC_CORE5.`LSU_PATH.qctl1.thread0_g,
		      `SPARC_CORE5.`LSU_PATH.qctl1.thread1_g,
		      `SPARC_CORE5.`LSU_PATH.qctl1.thread2_g,
		      `SPARC_CORE5.`LSU_PATH.qctl1.thread3_g,
		      `SPARC_CORE5.`LSU_PATH.dtlb.pgnum_g[29:0],
		      `SPARC_CORE5.`LSU_PATH.dctldp.ldst_va_g[9:0]};

   assign i0_5_rdy =
		     (i0_5_ld_inst_vld_g |
		      i0_5_st_inst_vld_g);
`endif // ifdef RTL_SPARC5

`ifdef RTL_SPARC6
   assign i0_6_asi_internal_g = `SPARC_CORE6.`LSU_PATH.dctl.lsu_alt_space_g &
			        `SPARC_CORE6.`LSU_PATH.dctl.asi_internal_g;
   assign i0_6_asi_quad_g     = `SPARC_CORE6.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE6.`LSU_PATH.dctl.quad_asi_g;
   assign i0_6_asi_blk_g      = `SPARC_CORE6.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE6.`LSU_PATH.dctl.blk_asi_g;
   assign i0_6_asi_binit_g    = `SPARC_CORE6.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE6.`LSU_PATH.dctl.binit_quad_asi_g;
   assign i0_6_dcache_hit_g= |(`SPARC_CORE6.`LSU_PATH.dtlb.cache_way_hit[`L1D_WAY_COUNT-1:0]);
   assign i0_6_full_raw_g=
	(|`SPARC_CORE6.`LSU_PATH.qctl1.stb_ld_full_raw[7:0]) &
	 ~(`SPARC_CORE6.`LSU_PATH.qctl1.stb_cam_mhit |
	   `SPARC_CORE6.`LSU_PATH.qctl1.ldq_hit_g |
	   `SPARC_CORE6.`LSU_PATH.qctl1.io_ld);
   assign i0_6_partial_raw_g=
	 (|`SPARC_CORE6.`LSU_PATH.qctl1.stb_ld_partial_raw[7:0]) |
	 `SPARC_CORE6.`LSU_PATH.qctl1.stb_cam_mhit |
	 `SPARC_CORE6.`LSU_PATH.qctl1.ldq_hit_g |
	 (`SPARC_CORE6.`LSU_PATH.qctl1.io_ld &
	  `SPARC_CORE6.`LSU_PATH.qctl1.stb_not_empty);
   assign i0_6_ld_l2cache_rq=
	(`SPARC_CORE6.`LSU_PATH.qctl1.ld0_l2cache_rq &
	 `SPARC_CORE6.`LSU_PATH.qctl1.thread0_g) |
	(`SPARC_CORE6.`LSU_PATH.qctl1.ld1_l2cache_rq &
	 `SPARC_CORE6.`LSU_PATH.qctl1.thread1_g) |
	(`SPARC_CORE6.`LSU_PATH.qctl1.ld2_l2cache_rq &
	 `SPARC_CORE6.`LSU_PATH.qctl1.thread2_g) |
	(`SPARC_CORE6.`LSU_PATH.qctl1.ld3_l2cache_rq &
	 `SPARC_CORE6.`LSU_PATH.qctl1.thread3_g);
   assign i0_6_ld_inst_vld_g =
	`SPARC_CORE6.`LSU_PATH.dctl.ld_inst_vld_g &
        ~(|cmp_top.sas_tasks.task6.spc0_force_flush[3:0]);
   assign i0_6_st_inst_vld_g =
	`SPARC_CORE6.`LSU_PATH.dctl.st_inst_vld_g &
	~`SPARC_CORE6.`LSU_PATH.stb_rwctl.ffu_lsu_kill_fst_w &
        ~(|cmp_top.sas_tasks.task6.spc0_force_flush[3:0]);

   assign i0_6_data =
		     {1'b0,
		      1'b0,
		      1'b0,
		      1'b0,
		      i0_6_asi_internal_g,
		      i0_6_asi_quad_g,
		      i0_6_asi_blk_g,
		      i0_6_asi_binit_g,
		      `SPARC_CORE6.`LSU_PATH.dctl.ldd_force_l2access_g,
		      i0_6_ld_l2cache_rq,
		      i0_6_full_raw_g,
		      i0_6_partial_raw_g,
		      i0_6_dcache_hit_g,
		      i0_6_ifu_lsu_ldst_size_g[1:0],
		      `SPARC_CORE6.`LSU_PATH.dctl.ld_inst_vld_g,
		      i0_6_st_inst_vld_g,
		      `SPARC_CORE6.`LSU_PATH.qctl1.thread0_g,
		      `SPARC_CORE6.`LSU_PATH.qctl1.thread1_g,
		      `SPARC_CORE6.`LSU_PATH.qctl1.thread2_g,
		      `SPARC_CORE6.`LSU_PATH.qctl1.thread3_g,
		      `SPARC_CORE6.`LSU_PATH.dtlb.pgnum_g[29:0],
		      `SPARC_CORE6.`LSU_PATH.dctldp.ldst_va_g[9:0]};

   assign i0_6_rdy =
		     (i0_6_ld_inst_vld_g |
		      i0_6_st_inst_vld_g);
`endif // ifdef RTL_SPARC6

`ifdef RTL_SPARC7
   assign i0_7_asi_internal_g = `SPARC_CORE7.`LSU_PATH.dctl.lsu_alt_space_g &
			        `SPARC_CORE7.`LSU_PATH.dctl.asi_internal_g;
   assign i0_7_asi_quad_g     = `SPARC_CORE7.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE7.`LSU_PATH.dctl.quad_asi_g;
   assign i0_7_asi_blk_g      = `SPARC_CORE7.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE7.`LSU_PATH.dctl.blk_asi_g;
   assign i0_7_asi_binit_g    = `SPARC_CORE7.`LSU_PATH.dctl.lsu_alt_space_g &
				`SPARC_CORE7.`LSU_PATH.dctl.binit_quad_asi_g;
   assign i0_7_dcache_hit_g= |(`SPARC_CORE7.`LSU_PATH.dtlb.cache_way_hit[`L1D_WAY_COUNT-1:0]);
   assign i0_7_full_raw_g=
	(|`SPARC_CORE7.`LSU_PATH.qctl1.stb_ld_full_raw[7:0]) &
	 ~(`SPARC_CORE7.`LSU_PATH.qctl1.stb_cam_mhit |
	   `SPARC_CORE7.`LSU_PATH.qctl1.ldq_hit_g |
	   `SPARC_CORE7.`LSU_PATH.qctl1.io_ld);
   assign i0_7_partial_raw_g=
	 (|`SPARC_CORE7.`LSU_PATH.qctl1.stb_ld_partial_raw[7:0]) |
	 `SPARC_CORE7.`LSU_PATH.qctl1.stb_cam_mhit |
	 `SPARC_CORE7.`LSU_PATH.qctl1.ldq_hit_g |
	 (`SPARC_CORE7.`LSU_PATH.qctl1.io_ld &
	  `SPARC_CORE7.`LSU_PATH.qctl1.stb_not_empty);
   assign i0_7_ld_l2cache_rq=
	(`SPARC_CORE7.`LSU_PATH.qctl1.ld0_l2cache_rq &
	 `SPARC_CORE7.`LSU_PATH.qctl1.thread0_g) |
	(`SPARC_CORE7.`LSU_PATH.qctl1.ld1_l2cache_rq &
	 `SPARC_CORE7.`LSU_PATH.qctl1.thread1_g) |
	(`SPARC_CORE7.`LSU_PATH.qctl1.ld2_l2cache_rq &
	 `SPARC_CORE7.`LSU_PATH.qctl1.thread2_g) |
	(`SPARC_CORE7.`LSU_PATH.qctl1.ld3_l2cache_rq &
	 `SPARC_CORE7.`LSU_PATH.qctl1.thread3_g);
   assign i0_7_ld_inst_vld_g =
	`SPARC_CORE7.`LSU_PATH.dctl.ld_inst_vld_g &
        ~(|cmp_top.sas_tasks.task7.spc0_force_flush[3:0]);
   assign i0_7_st_inst_vld_g =
	`SPARC_CORE7.`LSU_PATH.dctl.st_inst_vld_g &
	~`SPARC_CORE7.`LSU_PATH.stb_rwctl.ffu_lsu_kill_fst_w &
        ~(|cmp_top.sas_tasks.task7.spc0_force_flush[3:0]);

   assign i0_7_data =
		     {1'b0,
		      1'b0,
		      1'b0,
		      1'b0,
		      i0_7_asi_internal_g,
		      i0_7_asi_quad_g,
		      i0_7_asi_blk_g,
		      i0_7_asi_binit_g,
		      `SPARC_CORE7.`LSU_PATH.dctl.ldd_force_l2access_g,
		      i0_7_ld_l2cache_rq,
		      i0_7_full_raw_g,
		      i0_7_partial_raw_g,
		      i0_7_dcache_hit_g,
		      i0_7_ifu_lsu_ldst_size_g[1:0],
		      `SPARC_CORE7.`LSU_PATH.dctl.ld_inst_vld_g,
		      i0_7_st_inst_vld_g,
		      `SPARC_CORE7.`LSU_PATH.qctl1.thread0_g,
		      `SPARC_CORE7.`LSU_PATH.qctl1.thread1_g,
		      `SPARC_CORE7.`LSU_PATH.qctl1.thread2_g,
		      `SPARC_CORE7.`LSU_PATH.qctl1.thread3_g,
		      `SPARC_CORE7.`LSU_PATH.dtlb.pgnum_g[29:0],
		      `SPARC_CORE7.`LSU_PATH.dctldp.ldst_va_g[9:0]};

   assign i0_7_rdy =
		     (i0_7_ld_inst_vld_g |
		      i0_7_st_inst_vld_g);
`endif // ifdef RTL_SPARC7


`ifdef ENV_SPARC1
   assign i0_1_data = 'h0;
   assign i0_1_rdy  = 'h0;
`endif // !ifdef RTL_SPARC1

`ifdef ENV_SPARC2
   assign i0_2_data = 'h0;
   assign i0_2_rdy  = 'h0;
`endif // !ifdef RTL_SPARC2

`ifdef ENV_SPARC3
   assign i0_3_data = 'h0;
   assign i0_3_rdy  = 'h0;
`endif // !ifdef RTL_SPARC3

`ifdef ENV_SPARC4
   assign i0_4_data = 'h0;
   assign i0_4_rdy  = 'h0;
`endif // !ifdef RTL_SPARC4

`ifdef ENV_SPARC5
   assign i0_5_data = 'h0;
   assign i0_5_rdy  = 'h0;
`endif // !ifdef RTL_SPARC5

`ifdef ENV_SPARC6
   assign i0_6_data = 'h0;
   assign i0_6_rdy  = 'h0;
`endif // !ifdef RTL_SPARC6

`ifdef ENV_SPARC7
   assign i0_7_data = 'h0;
   assign i0_7_rdy  = 'h0;
`endif // !ifdef RTL_SPARC7


`endif // ifdef SAS_DISABLE

`ifdef RTL_CCX
   always @(posedge clk) begin
      pcx_sctag0_data_rdy_px2 <= `TOP_MEMORY.ccx.pcx_sctag0_data_rdy_px1;
      pcx_sctag1_data_rdy_px2 <= `TOP_MEMORY.ccx.pcx_sctag1_data_rdy_px1;
      pcx_sctag2_data_rdy_px2 <= `TOP_MEMORY.ccx.pcx_sctag2_data_rdy_px1;
      pcx_sctag3_data_rdy_px2 <= `TOP_MEMORY.ccx.pcx_sctag3_data_rdy_px1;

   end

   assign i1_0_data  =   `TOP_MEMORY.ccx.pcx_sctag0_data_px2;
   assign i1_0_rdy   =   pcx_sctag0_data_rdy_px2;

   assign i1_1_data  =   `TOP_MEMORY.ccx.pcx_sctag1_data_px2;
   assign i1_1_rdy   =   pcx_sctag1_data_rdy_px2;

   assign i1_2_data  =   `TOP_MEMORY.ccx.pcx_sctag2_data_px2;
   assign i1_2_rdy   =   pcx_sctag2_data_rdy_px2;

   assign i1_3_data  =   `TOP_MEMORY.ccx.pcx_sctag3_data_px2;
   assign i1_3_rdy   =   pcx_sctag3_data_rdy_px2;

`endif // ifdef RTL_CCX


`ifdef RTL_SCTAG0
   always @(posedge clk) begin
      i2_0_rdy   <= #1   |`TOP_MEMORY.sctag0.oqctl.req_out_c7;
      i2_0_hit_c4 <= #1 `TOP_MEMORY.sctag0.arbctl.decdp_bis_inst_c3 &
			   (`TOP_MEMORY.sctag0.tagctl.tagctl_hit_c3 |
			    `TOP_MEMORY.sctag0.mbctl.fbctl_match_c3);
      i2_0_hit_c5 <= #1  i2_0_hit_c4;
      i2_0_hit_c6 <= #1  i2_0_hit_c5;
      i2_0_hit_c7 <= #1  i2_0_hit_c6;
      i2_0_hit_c8 <= #1  i2_0_hit_c7;

      i2_1_rdy   <= #1   |`TOP_MEMORY.sctag1.oqctl.req_out_c7;
      i2_1_hit_c4 <= #1 `TOP_MEMORY.sctag1.arbctl.decdp_bis_inst_c3 &
			   (`TOP_MEMORY.sctag1.tagctl.tagctl_hit_c3 |
			    `TOP_MEMORY.sctag1.mbctl.fbctl_match_c3);
      i2_1_hit_c5 <= #1  i2_1_hit_c4;
      i2_1_hit_c6 <= #1  i2_1_hit_c5;
      i2_1_hit_c7 <= #1  i2_1_hit_c6;
      i2_1_hit_c8 <= #1  i2_1_hit_c7;

      i2_2_rdy   <= #1   |`TOP_MEMORY.sctag2.oqctl.req_out_c7;
      i2_2_hit_c4 <= #1 `TOP_MEMORY.sctag2.arbctl.decdp_bis_inst_c3 &
			   (`TOP_MEMORY.sctag2.tagctl.tagctl_hit_c3 |
			    `TOP_MEMORY.sctag2.mbctl.fbctl_match_c3);
      i2_2_hit_c5 <= #1  i2_2_hit_c4;
      i2_2_hit_c6 <= #1  i2_2_hit_c5;
      i2_2_hit_c7 <= #1  i2_2_hit_c6;
      i2_2_hit_c8 <= #1  i2_2_hit_c7;

      i2_3_rdy   <= #1   |`TOP_MEMORY.sctag3.oqctl.req_out_c7;
      i2_3_hit_c4 <= #1 `TOP_MEMORY.sctag3.arbctl.decdp_bis_inst_c3 &
			   (`TOP_MEMORY.sctag3.tagctl.tagctl_hit_c3 |
			    `TOP_MEMORY.sctag3.mbctl.fbctl_match_c3);
      i2_3_hit_c5 <= #1  i2_3_hit_c4;
      i2_3_hit_c6 <= #1  i2_3_hit_c5;
      i2_3_hit_c7 <= #1  i2_3_hit_c6;
      i2_3_hit_c8 <= #1  i2_3_hit_c7;

   end // always @(posedge clk)


   assign i2_0_data  = {`TOP_MEMORY.sctag0.arbaddrdp.arbdp_addr_c8[39:0],
			  1'b0,
			  1'b0,
			  1'b0,
			  i2_0_hit_c8,
			  `TOP_MEMORY.sctag0.oqdp.cpuid_c8,	// C8 signal
			  `TOP_MEMORY.sctag0.oqdp.oq_array_data_in[144:0]};

   assign i2_1_data  = {`TOP_MEMORY.sctag1.arbaddrdp.arbdp_addr_c8[39:0],
			  1'b0,
			  1'b0,
			  1'b0,
			  i2_1_hit_c8,
			  `TOP_MEMORY.sctag1.oqdp.cpuid_c8,	// C8 signal
			  `TOP_MEMORY.sctag1.oqdp.oq_array_data_in[144:0]};

   assign i2_2_data  = {`TOP_MEMORY.sctag2.arbaddrdp.arbdp_addr_c8[39:0],
			  1'b0,
			  1'b0,
			  1'b0,
			  i2_2_hit_c8,
			  `TOP_MEMORY.sctag2.oqdp.cpuid_c8,	// C8 signal
			  `TOP_MEMORY.sctag2.oqdp.oq_array_data_in[144:0]};

   assign i2_3_data  = {`TOP_MEMORY.sctag3.arbaddrdp.arbdp_addr_c8[39:0],
			  1'b0,
			  1'b0,
			  1'b0,
			  i2_3_hit_c8,
			  `TOP_MEMORY.sctag3.oqdp.cpuid_c8,	// C8 signal
			  `TOP_MEMORY.sctag3.oqdp.oq_array_data_in[144:0]};

`endif // ifdef SCTAG0


`ifdef RTL_CCX
   assign i3_0_data  =  `TOP_MEMORY.ccx.cpx_spc0_data_cx2;
   assign i3_0_rdy   =  `TOP_MEMORY.ccx.cpx_spc0_data_cx2[144];

   assign i3_1_data  =  `TOP_MEMORY.ccx.cpx_spc1_data_cx2;
   assign i3_1_rdy   =  `TOP_MEMORY.ccx.cpx_spc1_data_cx2[144];

   assign i3_2_data  =  `TOP_MEMORY.ccx.cpx_spc2_data_cx2;
   assign i3_2_rdy   =  `TOP_MEMORY.ccx.cpx_spc2_data_cx2[144];

   assign i3_3_data  =  `TOP_MEMORY.ccx.cpx_spc3_data_cx2;
   assign i3_3_rdy   =  `TOP_MEMORY.ccx.cpx_spc3_data_cx2[144];

   assign i3_4_data  =  `TOP_MEMORY.ccx.cpx_spc4_data_cx2;
   assign i3_4_rdy   =  `TOP_MEMORY.ccx.cpx_spc4_data_cx2[144];

   assign i3_5_data  =  `TOP_MEMORY.ccx.cpx_spc5_data_cx2;
   assign i3_5_rdy   =  `TOP_MEMORY.ccx.cpx_spc5_data_cx2[144];

   assign i3_6_data  =  `TOP_MEMORY.ccx.cpx_spc6_data_cx2;
   assign i3_6_rdy   =  `TOP_MEMORY.ccx.cpx_spc6_data_cx2[144];

   assign i3_7_data  =  `TOP_MEMORY.ccx.cpx_spc7_data_cx2;
   assign i3_7_rdy   =  `TOP_MEMORY.ccx.cpx_spc7_data_cx2[144];

`endif // ifdef RTL_CCX

`ifdef SAS_DISABLE
`else

   always @(posedge clk) begin
`ifdef RTL_SPARC0
`ifndef RTL_SPU
      i4_0_fprs_set_e  <= #1 `SPARC_CORE0.sparc0.ifu.ifu.swl.fprs_sel_set;
      i4_0_new_fprs_e  <= #1 `SPARC_CORE0.sparc0.ifu.ifu.swl.new_fprs;
`else
      i4_0_fprs_set_e  <= #1 `SPARC_CORE0.sparc0.ifu.swl.fprs_sel_set;
      i4_0_new_fprs_e  <= #1 `SPARC_CORE0.sparc0.ifu.swl.new_fprs;
`endif     
      i4_0_fprs_set_m  <= #1 i4_0_fprs_set_e;
      i4_0_new_fprs_m  <= #1 i4_0_new_fprs_e;
      i4_0_fprs_set_w  <= #1 i4_0_fprs_set_m;
      i4_0_new_fprs_w  <= #1 i4_0_new_fprs_m;
`ifndef RTL_SPU
      i4_0_rstint_w    <= #1 `SPARC_CORE0.sparc0.ifu.ifu.fcl.ifu_tlu_rstint_m;
      i4_0_hwint_w     <= #1 `SPARC_CORE0.sparc0.ifu.ifu.fcl.ifu_tlu_hwint_m;
      i4_0_sftint_w    <= #1 `SPARC_CORE0.sparc0.ifu.ifu.fcl.ifu_tlu_sftint_m;
      i4_0_hint_m      <= #1 `SPARC_CORE0.sparc0.ifu.ifu.fcl.ttype_sel_hstk_cmp_e;
      i4_0_hint_w      <= #1 i4_0_hint_m & `SPARC_CORE0.sparc0.ifu.ifu.fcl.ifu_tlu_ttype_vld_m;
      i4_0_int_thr_w       <= #1 `SPARC_CORE0.sparc0.ifu.ifu.fcl.thr_m;

      i4_0_ic_inv_vld_f <= #1 `SPARC_CORE0.sparc0.ifu.ifu.invctl.stpkt_i2 &
                         `SPARC_CORE0.sparc0.ifu.ifu.invctl.invalidate_i2 &
                 `SPARC_CORE0.sparc0.ifu.ifu.invctl.icvidx_sel_inv_i2;
      i4_0_ic_inv_addr_f  <= #1 `SPARC_CORE0.sparc0.ifu.ifu.invctl.inv_addr_i2[`IC_IDX_HI:6];
      i4_0_ic_inv_word1_f <= #1 `SPARC_CORE0.sparc0.ifu.ifu.invctl.word1_inv_i2;
      i4_0_ic_inv_word0_f <= #1 `SPARC_CORE0.sparc0.ifu.ifu.invctl.word0_inv_i2;
      i4_0_ic_inv_way1_f  <= #1 `SPARC_CORE0.sparc0.ifu.ifu.invctl.invwd1_way_i2;
      i4_0_ic_inv_way0_f  <= #1 `SPARC_CORE0.sparc0.ifu.ifu.invctl.invwd0_way_i2;
`else
      i4_0_rstint_w    <= #1 `SPARC_CORE0.sparc0.ifu.fcl.ifu_tlu_rstint_m;
      i4_0_hwint_w     <= #1 `SPARC_CORE0.sparc0.ifu.fcl.ifu_tlu_hwint_m;
      i4_0_sftint_w    <= #1 `SPARC_CORE0.sparc0.ifu.fcl.ifu_tlu_sftint_m;
      i4_0_hint_m      <= #1 `SPARC_CORE0.sparc0.ifu.fcl.ttype_sel_hstk_cmp_e;
      i4_0_hint_w      <= #1 i4_0_hint_m & `SPARC_CORE0.sparc0.ifu.fcl.ifu_tlu_ttype_vld_m;
      i4_0_int_thr_w       <= #1 `SPARC_CORE0.sparc0.ifu.fcl.thr_m;

      i4_0_ic_inv_vld_f <= #1 `SPARC_CORE0.sparc0.ifu.invctl.stpkt_i2 &
	                     `SPARC_CORE0.sparc0.ifu.invctl.invalidate_i2 &
			     `SPARC_CORE0.sparc0.ifu.invctl.icvidx_sel_inv_i2;
      i4_0_ic_inv_addr_f  <= #1 `SPARC_CORE0.sparc0.ifu.invctl.inv_addr_i2[`IC_IDX_HI:6];
      i4_0_ic_inv_word1_f <= #1 `SPARC_CORE0.sparc0.ifu.invctl.word1_inv_i2;
      i4_0_ic_inv_word0_f <= #1 `SPARC_CORE0.sparc0.ifu.invctl.word0_inv_i2;
      i4_0_ic_inv_way1_f  <= #1 `SPARC_CORE0.sparc0.ifu.invctl.invwd1_way_i2;
      i4_0_ic_inv_way0_f  <= #1 `SPARC_CORE0.sparc0.ifu.invctl.invwd0_way_i2;
`endif
      i4_0_ic_inv_vld_s     <= #1 i4_0_ic_inv_vld_f;
      i4_0_ic_inv_addr_s  <= #1 i4_0_ic_inv_addr_f;
      i4_0_ic_inv_word1_s <= #1 i4_0_ic_inv_word1_f;
      i4_0_ic_inv_word0_s <= #1 i4_0_ic_inv_word0_f;
      i4_0_ic_inv_way1_s  <= #1 i4_0_ic_inv_way1_f;
      i4_0_ic_inv_way0_s  <= #1 i4_0_ic_inv_way0_f;
      i4_0_st_wr_dcache_m <= #1 `SPARC_CORE0.`LSU_PATH.lsu_st_wr_dcache;
      i4_0_fill_dcache_m  <= #1 `SPARC_CORE0.`LSU_PATH.lsu_dcache_wr_vld_e & ~`SPARC_CORE0.`LSU_PATH.lsu_st_wr_dcache;
      i4_0_dcache_fill_addr_m <= #1 `SPARC_CORE0.`LSU_PATH.dctl.dcache_fill_addr_e;
      i4_0_dva_svld_m     <= #1 `SPARC_CORE0.`LSU_PATH.qctl2.dva_svld_e &
	      (`SPARC_CORE0.`LSU_PATH.qdp2.dfq_byp_ff_data[143:140]=='h4) &
	      ~(`SPARC_CORE0.`LSU_PATH.qctl2.memref_e &
		`SPARC_CORE0.`LSU_PATH.qctl2.dfq_st_vld &
		`SPARC_CORE0.`LSU_PATH.qctl2.dfq_local_inv &
		`SPARC_CORE0.`LSU_PATH.qctl2.lsu_cpx_pkt_atomic);
      i4_0_dva_snp_addr_m     <= #1 `SPARC_CORE0.`LSU_PATH.qctl2.dva_snp_addr_e;
      i4_0_dva_snp_set_vld_m  <= #1 `SPARC_CORE0.`LSU_PATH.qctl2.dva_snp_set_vld_e;
      i4_0_dva_snp_wy0_m <= #1 `SPARC_CORE0.`LSU_PATH.qctl2.dva_snp_wy0_e;
      i4_0_dva_snp_wy1_m <= #1 `SPARC_CORE0.`LSU_PATH.qctl2.dva_snp_wy1_e;
      i4_0_dva_snp_wy2_m <= #1 `SPARC_CORE0.`LSU_PATH.qctl2.dva_snp_wy2_e;
      i4_0_dva_snp_wy3_m <= #1 `SPARC_CORE0.`LSU_PATH.qctl2.dva_snp_wy3_e;
      i4_0_st_wr_dcache_w    <= #1 i4_0_st_wr_dcache_m;
      i4_0_fill_dcache_w     <= #1 i4_0_fill_dcache_m;
      i4_0_dcache_fill_addr_w <= #1 i4_0_dcache_fill_addr_m;
      i4_0_dva_svld_w         <= #1 i4_0_dva_svld_m;
      i4_0_dva_snp_addr_w     <= #1 i4_0_dva_snp_addr_m;
      i4_0_dva_snp_set_vld_w  <= #1 i4_0_dva_snp_set_vld_m;
      i4_0_dva_snp_wy0_w <= #1 i4_0_dva_snp_wy0_m;
      i4_0_dva_snp_wy1_w <= #1 i4_0_dva_snp_wy1_m;
      i4_0_dva_snp_wy2_w <= #1 i4_0_dva_snp_wy2_m;
      i4_0_dva_snp_wy3_w <= #1 i4_0_dva_snp_wy3_m;
`endif // ifdef RTL_SPARC0

`ifdef RTL_SPARC1
`ifndef RTL_SPU
      i4_1_fprs_set_e  <= #1 `SPARC_CORE1.sparc0.ifu.ifu.swl.fprs_sel_set;
      i4_1_new_fprs_e  <= #1 `SPARC_CORE1.sparc0.ifu.ifu.swl.new_fprs;
`else
      i4_1_fprs_set_e  <= #1 `SPARC_CORE1.sparc0.ifu.swl.fprs_sel_set;
      i4_1_new_fprs_e  <= #1 `SPARC_CORE1.sparc0.ifu.swl.new_fprs;
`endif
      i4_1_fprs_set_m  <= #1 i4_1_fprs_set_e;
      i4_1_new_fprs_m  <= #1 i4_1_new_fprs_e;
      i4_1_fprs_set_w  <= #1 i4_1_fprs_set_m;
      i4_1_new_fprs_w  <= #1 i4_1_new_fprs_m;
`ifndef RTL_SPU
      i4_1_rstint_w    <= #1 `SPARC_CORE1.sparc0.ifu.ifu.fcl.ifu_tlu_rstint_m;
      i4_1_hwint_w     <= #1 `SPARC_CORE1.sparc0.ifu.ifu.fcl.ifu_tlu_hwint_m;
      i4_1_sftint_w    <= #1 `SPARC_CORE1.sparc0.ifu.ifu.fcl.ifu_tlu_sftint_m;
      i4_1_hint_m      <= #1 `SPARC_CORE1.sparc0.ifu.ifu.fcl.ttype_sel_hstk_cmp_e;
      i4_1_hint_w      <= #1 i4_1_hint_m & `SPARC_CORE1.sparc0.ifu.ifu.fcl.ifu_tlu_ttype_vld_m;
      i4_1_int_thr_w       <= #1 `SPARC_CORE1.sparc0.ifu.ifu.fcl.thr_m;

      i4_1_ic_inv_vld_f <= #1 `SPARC_CORE1.sparc0.ifu.ifu.invctl.stpkt_i2 &
                         `SPARC_CORE1.sparc0.ifu.ifu.invctl.invalidate_i2 &
                 `SPARC_CORE1.sparc0.ifu.ifu.invctl.icvidx_sel_inv_i2;
      i4_1_ic_inv_addr_f  <= #1 `SPARC_CORE1.sparc0.ifu.ifu.invctl.inv_addr_i2[`IC_IDX_HI:6];
      i4_1_ic_inv_word1_f <= #1 `SPARC_CORE1.sparc0.ifu.ifu.invctl.word1_inv_i2;
      i4_1_ic_inv_word0_f <= #1 `SPARC_CORE1.sparc0.ifu.ifu.invctl.word0_inv_i2;
      i4_1_ic_inv_way1_f  <= #1 `SPARC_CORE1.sparc0.ifu.ifu.invctl.invwd1_way_i2;
      i4_1_ic_inv_way0_f  <= #1 `SPARC_CORE1.sparc0.ifu.ifu.invctl.invwd0_way_i2; 
`else
      i4_1_rstint_w    <= #1 `SPARC_CORE1.sparc0.ifu.fcl.ifu_tlu_rstint_m;
      i4_1_hwint_w     <= #1 `SPARC_CORE1.sparc0.ifu.fcl.ifu_tlu_hwint_m;
      i4_1_sftint_w    <= #1 `SPARC_CORE1.sparc0.ifu.fcl.ifu_tlu_sftint_m;
      i4_1_hint_m      <= #1 `SPARC_CORE1.sparc0.ifu.fcl.ttype_sel_hstk_cmp_e;
      i4_1_hint_w      <= #1 i4_1_hint_m & `SPARC_CORE1.sparc0.ifu.fcl.ifu_tlu_ttype_vld_m;
      i4_1_int_thr_w       <= #1 `SPARC_CORE1.sparc0.ifu.fcl.thr_m;

      i4_1_ic_inv_vld_f <= #1 `SPARC_CORE1.sparc0.ifu.invctl.stpkt_i2 &
	                     `SPARC_CORE1.sparc0.ifu.invctl.invalidate_i2 &
			     `SPARC_CORE1.sparc0.ifu.invctl.icvidx_sel_inv_i2;
      i4_1_ic_inv_addr_f  <= #1 `SPARC_CORE1.sparc0.ifu.invctl.inv_addr_i2[`IC_IDX_HI:6];
      i4_1_ic_inv_word1_f <= #1 `SPARC_CORE1.sparc0.ifu.invctl.word1_inv_i2;
      i4_1_ic_inv_word0_f <= #1 `SPARC_CORE1.sparc0.ifu.invctl.word0_inv_i2;
      i4_1_ic_inv_way1_f  <= #1 `SPARC_CORE1.sparc0.ifu.invctl.invwd1_way_i2;
      i4_1_ic_inv_way0_f  <= #1 `SPARC_CORE1.sparc0.ifu.invctl.invwd0_way_i2;
`endif
      i4_1_ic_inv_vld_s     <= #1 i4_1_ic_inv_vld_f;
      i4_1_ic_inv_addr_s  <= #1 i4_1_ic_inv_addr_f;
      i4_1_ic_inv_word1_s <= #1 i4_1_ic_inv_word1_f;
      i4_1_ic_inv_word0_s <= #1 i4_1_ic_inv_word0_f;
      i4_1_ic_inv_way1_s  <= #1 i4_1_ic_inv_way1_f;
      i4_1_ic_inv_way0_s  <= #1 i4_1_ic_inv_way0_f;
      i4_1_st_wr_dcache_m <= #1 `SPARC_CORE1.`LSU_PATH.lsu_st_wr_dcache;
      i4_1_fill_dcache_m  <= #1 `SPARC_CORE1.`LSU_PATH.lsu_dcache_wr_vld_e & ~`SPARC_CORE1.`LSU_PATH.lsu_st_wr_dcache;
      i4_1_dcache_fill_addr_m <= #1 `SPARC_CORE1.`LSU_PATH.dctl.dcache_fill_addr_e;
      i4_1_dva_svld_m     <= #1 `SPARC_CORE1.`LSU_PATH.qctl2.dva_svld_e &
	      (`SPARC_CORE1.`LSU_PATH.qdp2.dfq_byp_ff_data[143:140]=='h4) &
	      ~(`SPARC_CORE1.`LSU_PATH.qctl2.memref_e &
		`SPARC_CORE1.`LSU_PATH.qctl2.dfq_st_vld &
		`SPARC_CORE1.`LSU_PATH.qctl2.dfq_local_inv &
		`SPARC_CORE1.`LSU_PATH.qctl2.lsu_cpx_pkt_atomic);
      i4_1_dva_snp_addr_m     <= #1 `SPARC_CORE1.`LSU_PATH.qctl2.dva_snp_addr_e;
      i4_1_dva_snp_set_vld_m  <= #1 `SPARC_CORE1.`LSU_PATH.qctl2.dva_snp_set_vld_e;
      i4_1_dva_snp_wy0_m <= #1 `SPARC_CORE1.`LSU_PATH.qctl2.dva_snp_wy0_e;
      i4_1_dva_snp_wy1_m <= #1 `SPARC_CORE1.`LSU_PATH.qctl2.dva_snp_wy1_e;
      i4_1_dva_snp_wy2_m <= #1 `SPARC_CORE1.`LSU_PATH.qctl2.dva_snp_wy2_e;
      i4_1_dva_snp_wy3_m <= #1 `SPARC_CORE1.`LSU_PATH.qctl2.dva_snp_wy3_e;
      i4_1_st_wr_dcache_w    <= #1 i4_1_st_wr_dcache_m;
      i4_1_fill_dcache_w     <= #1 i4_1_fill_dcache_m;
      i4_1_dcache_fill_addr_w <= #1 i4_1_dcache_fill_addr_m;
      i4_1_dva_svld_w         <= #1 i4_1_dva_svld_m;
      i4_1_dva_snp_addr_w     <= #1 i4_1_dva_snp_addr_m;
      i4_1_dva_snp_set_vld_w  <= #1 i4_1_dva_snp_set_vld_m;
      i4_1_dva_snp_wy0_w <= #1 i4_1_dva_snp_wy0_m;
      i4_1_dva_snp_wy1_w <= #1 i4_1_dva_snp_wy1_m;
      i4_1_dva_snp_wy2_w <= #1 i4_1_dva_snp_wy2_m;
      i4_1_dva_snp_wy3_w <= #1 i4_1_dva_snp_wy3_m;
`endif // ifdef RTL_SPARC1

`ifdef RTL_SPARC2
`ifndef RTL_SPU
      i4_2_fprs_set_e  <= #1 `SPARC_CORE2.sparc0.ifu.ifu.swl.fprs_sel_set;
      i4_2_new_fprs_e  <= #1 `SPARC_CORE2.sparc0.ifu.ifu.swl.new_fprs;
`else
      i4_2_fprs_set_e  <= #1 `SPARC_CORE2.sparc0.ifu.swl.fprs_sel_set;
      i4_2_new_fprs_e  <= #1 `SPARC_CORE2.sparc0.ifu.swl.new_fprs;
`endif
      i4_2_fprs_set_m  <= #1 i4_2_fprs_set_e;
      i4_2_new_fprs_m  <= #1 i4_2_new_fprs_e;
      i4_2_fprs_set_w  <= #1 i4_2_fprs_set_m;
      i4_2_new_fprs_w  <= #1 i4_2_new_fprs_m;
`ifndef RTL_SPU
      i4_2_rstint_w    <= #1 `SPARC_CORE2.sparc0.ifu.ifu.fcl.ifu_tlu_rstint_m;
      i4_2_hwint_w     <= #1 `SPARC_CORE2.sparc0.ifu.ifu.fcl.ifu_tlu_hwint_m;
      i4_2_sftint_w    <= #1 `SPARC_CORE2.sparc0.ifu.ifu.fcl.ifu_tlu_sftint_m;
      i4_2_hint_m      <= #1 `SPARC_CORE2.sparc0.ifu.ifu.fcl.ttype_sel_hstk_cmp_e;
      i4_2_hint_w      <= #1 i4_2_hint_m & `SPARC_CORE2.sparc0.ifu.ifu.fcl.ifu_tlu_ttype_vld_m;
      i4_2_int_thr_w       <= #1 `SPARC_CORE2.sparc0.ifu.ifu.fcl.thr_m;

      i4_2_ic_inv_vld_f <= #1 `SPARC_CORE2.sparc0.ifu.ifu.invctl.stpkt_i2 &
                         `SPARC_CORE2.sparc0.ifu.ifu.invctl.invalidate_i2 &
                 `SPARC_CORE2.sparc0.ifu.ifu.invctl.icvidx_sel_inv_i2;
      i4_2_ic_inv_addr_f  <= #1 `SPARC_CORE2.sparc0.ifu.ifu.invctl.inv_addr_i2[`IC_IDX_HI:6];
      i4_2_ic_inv_word1_f <= #1 `SPARC_CORE2.sparc0.ifu.ifu.invctl.word1_inv_i2;
      i4_2_ic_inv_word0_f <= #1 `SPARC_CORE2.sparc0.ifu.ifu.invctl.word0_inv_i2;
      i4_2_ic_inv_way1_f  <= #1 `SPARC_CORE2.sparc0.ifu.ifu.invctl.invwd1_way_i2;
      i4_2_ic_inv_way0_f  <= #1 `SPARC_CORE2.sparc0.ifu.ifu.invctl.invwd0_way_i2;
`else
      i4_2_rstint_w    <= #1 `SPARC_CORE2.sparc0.ifu.fcl.ifu_tlu_rstint_m;
      i4_2_hwint_w     <= #1 `SPARC_CORE2.sparc0.ifu.fcl.ifu_tlu_hwint_m;
      i4_2_sftint_w    <= #1 `SPARC_CORE2.sparc0.ifu.fcl.ifu_tlu_sftint_m;
      i4_2_hint_m      <= #1 `SPARC_CORE2.sparc0.ifu.fcl.ttype_sel_hstk_cmp_e;
      i4_2_hint_w      <= #1 i4_2_hint_m & `SPARC_CORE2.sparc0.ifu.fcl.ifu_tlu_ttype_vld_m;
      i4_2_int_thr_w       <= #1 `SPARC_CORE2.sparc0.ifu.fcl.thr_m;

      i4_2_ic_inv_vld_f <= #1 `SPARC_CORE2.sparc0.ifu.invctl.stpkt_i2 &
	                     `SPARC_CORE2.sparc0.ifu.invctl.invalidate_i2 &
			     `SPARC_CORE2.sparc0.ifu.invctl.icvidx_sel_inv_i2;
      i4_2_ic_inv_addr_f  <= #1 `SPARC_CORE2.sparc0.ifu.invctl.inv_addr_i2[`IC_IDX_HI:6];
      i4_2_ic_inv_word1_f <= #1 `SPARC_CORE2.sparc0.ifu.invctl.word1_inv_i2;
      i4_2_ic_inv_word0_f <= #1 `SPARC_CORE2.sparc0.ifu.invctl.word0_inv_i2;
      i4_2_ic_inv_way1_f  <= #1 `SPARC_CORE2.sparc0.ifu.invctl.invwd1_way_i2;
      i4_2_ic_inv_way0_f  <= #1 `SPARC_CORE2.sparc0.ifu.invctl.invwd0_way_i2;
`endif
      i4_2_ic_inv_vld_s     <= #1 i4_2_ic_inv_vld_f;
      i4_2_ic_inv_addr_s  <= #1 i4_2_ic_inv_addr_f;
      i4_2_ic_inv_word1_s <= #1 i4_2_ic_inv_word1_f;
      i4_2_ic_inv_word0_s <= #1 i4_2_ic_inv_word0_f;
      i4_2_ic_inv_way1_s  <= #1 i4_2_ic_inv_way1_f;
      i4_2_ic_inv_way0_s  <= #1 i4_2_ic_inv_way0_f;
      i4_2_st_wr_dcache_m <= #1 `SPARC_CORE2.`LSU_PATH.lsu_st_wr_dcache;
      i4_2_fill_dcache_m  <= #1 `SPARC_CORE2.`LSU_PATH.lsu_dcache_wr_vld_e & ~`SPARC_CORE2.`LSU_PATH.lsu_st_wr_dcache;
      i4_2_dcache_fill_addr_m <= #1 `SPARC_CORE2.`LSU_PATH.dctl.dcache_fill_addr_e;
      i4_2_dva_svld_m     <= #1 `SPARC_CORE2.`LSU_PATH.qctl2.dva_svld_e &
	      (`SPARC_CORE2.`LSU_PATH.qdp2.dfq_byp_ff_data[143:140]=='h4) &
	      ~(`SPARC_CORE2.`LSU_PATH.qctl2.memref_e &
		`SPARC_CORE2.`LSU_PATH.qctl2.dfq_st_vld &
		`SPARC_CORE2.`LSU_PATH.qctl2.dfq_local_inv &
		`SPARC_CORE2.`LSU_PATH.qctl2.lsu_cpx_pkt_atomic);
      i4_2_dva_snp_addr_m     <= #1 `SPARC_CORE2.`LSU_PATH.qctl2.dva_snp_addr_e;
      i4_2_dva_snp_set_vld_m  <= #1 `SPARC_CORE2.`LSU_PATH.qctl2.dva_snp_set_vld_e;
      i4_2_dva_snp_wy0_m <= #1 `SPARC_CORE2.`LSU_PATH.qctl2.dva_snp_wy0_e;
      i4_2_dva_snp_wy1_m <= #1 `SPARC_CORE2.`LSU_PATH.qctl2.dva_snp_wy1_e;
      i4_2_dva_snp_wy2_m <= #1 `SPARC_CORE2.`LSU_PATH.qctl2.dva_snp_wy2_e;
      i4_2_dva_snp_wy3_m <= #1 `SPARC_CORE2.`LSU_PATH.qctl2.dva_snp_wy3_e;
      i4_2_st_wr_dcache_w    <= #1 i4_2_st_wr_dcache_m;
      i4_2_fill_dcache_w     <= #1 i4_2_fill_dcache_m;
      i4_2_dcache_fill_addr_w <= #1 i4_2_dcache_fill_addr_m;
      i4_2_dva_svld_w         <= #1 i4_2_dva_svld_m;
      i4_2_dva_snp_addr_w     <= #1 i4_2_dva_snp_addr_m;
      i4_2_dva_snp_set_vld_w  <= #1 i4_2_dva_snp_set_vld_m;
      i4_2_dva_snp_wy0_w <= #1 i4_2_dva_snp_wy0_m;
      i4_2_dva_snp_wy1_w <= #1 i4_2_dva_snp_wy1_m;
      i4_2_dva_snp_wy2_w <= #1 i4_2_dva_snp_wy2_m;
      i4_2_dva_snp_wy3_w <= #1 i4_2_dva_snp_wy3_m;
`endif // ifdef RTL_SPARC2

`ifdef RTL_SPARC3
`ifndef RTL_SPU
      i4_3_fprs_set_e  <= #1 `SPARC_CORE3.sparc0.ifu.ifu.swl.fprs_sel_set;
      i4_3_new_fprs_e  <= #1 `SPARC_CORE3.sparc0.ifu.ifu.swl.new_fprs;
`else
      i4_3_fprs_set_e  <= #1 `SPARC_CORE3.sparc0.ifu.swl.fprs_sel_set;
      i4_3_new_fprs_e  <= #1 `SPARC_CORE3.sparc0.ifu.swl.new_fprs;
`endif
      i4_3_fprs_set_m  <= #1 i4_3_fprs_set_e;
      i4_3_new_fprs_m  <= #1 i4_3_new_fprs_e;
      i4_3_fprs_set_w  <= #1 i4_3_fprs_set_m;
      i4_3_new_fprs_w  <= #1 i4_3_new_fprs_m;
`ifndef RTL_SPU
      i4_3_rstint_w    <= #1 `SPARC_CORE3.sparc0.ifu.ifu.fcl.ifu_tlu_rstint_m;
      i4_3_hwint_w     <= #1 `SPARC_CORE3.sparc0.ifu.ifu.fcl.ifu_tlu_hwint_m;
      i4_3_sftint_w    <= #1 `SPARC_CORE3.sparc0.ifu.ifu.fcl.ifu_tlu_sftint_m;
      i4_3_hint_m      <= #1 `SPARC_CORE3.sparc0.ifu.ifu.fcl.ttype_sel_hstk_cmp_e;
      i4_3_hint_w      <= #1 i4_3_hint_m & `SPARC_CORE3.sparc0.ifu.ifu.fcl.ifu_tlu_ttype_vld_m;
      i4_3_int_thr_w       <= #1 `SPARC_CORE3.sparc0.ifu.ifu.fcl.thr_m;

      i4_3_ic_inv_vld_f <= #1 `SPARC_CORE3.sparc0.ifu.ifu.invctl.stpkt_i2 &
                         `SPARC_CORE3.sparc0.ifu.ifu.invctl.invalidate_i2 &
                 `SPARC_CORE3.sparc0.ifu.ifu.invctl.icvidx_sel_inv_i2;
      i4_3_ic_inv_addr_f  <= #1 `SPARC_CORE3.sparc0.ifu.ifu.invctl.inv_addr_i2[`IC_IDX_HI:6];
      i4_3_ic_inv_word1_f <= #1 `SPARC_CORE3.sparc0.ifu.ifu.invctl.word1_inv_i2;
      i4_3_ic_inv_word0_f <= #1 `SPARC_CORE3.sparc0.ifu.ifu.invctl.word0_inv_i2;
      i4_3_ic_inv_way1_f  <= #1 `SPARC_CORE3.sparc0.ifu.ifu.invctl.invwd1_way_i2;
      i4_3_ic_inv_way0_f  <= #1 `SPARC_CORE3.sparc0.ifu.ifu.invctl.invwd0_way_i2;
`else
      i4_3_rstint_w    <= #1 `SPARC_CORE3.sparc0.ifu.fcl.ifu_tlu_rstint_m;
      i4_3_hwint_w     <= #1 `SPARC_CORE3.sparc0.ifu.fcl.ifu_tlu_hwint_m;
      i4_3_sftint_w    <= #1 `SPARC_CORE3.sparc0.ifu.fcl.ifu_tlu_sftint_m;
      i4_3_hint_m      <= #1 `SPARC_CORE3.sparc0.ifu.fcl.ttype_sel_hstk_cmp_e;
      i4_3_hint_w      <= #1 i4_3_hint_m & `SPARC_CORE3.sparc0.ifu.fcl.ifu_tlu_ttype_vld_m;
      i4_3_int_thr_w       <= #1 `SPARC_CORE3.sparc0.ifu.fcl.thr_m;

      i4_3_ic_inv_vld_f <= #1 `SPARC_CORE3.sparc0.ifu.invctl.stpkt_i2 &
	                     `SPARC_CORE3.sparc0.ifu.invctl.invalidate_i2 &
			     `SPARC_CORE3.sparc0.ifu.invctl.icvidx_sel_inv_i2;
      i4_3_ic_inv_addr_f  <= #1 `SPARC_CORE3.sparc0.ifu.invctl.inv_addr_i2[`IC_IDX_HI:6];
      i4_3_ic_inv_word1_f <= #1 `SPARC_CORE3.sparc0.ifu.invctl.word1_inv_i2;
      i4_3_ic_inv_word0_f <= #1 `SPARC_CORE3.sparc0.ifu.invctl.word0_inv_i2;
      i4_3_ic_inv_way1_f  <= #1 `SPARC_CORE3.sparc0.ifu.invctl.invwd1_way_i2;
      i4_3_ic_inv_way0_f  <= #1 `SPARC_CORE3.sparc0.ifu.invctl.invwd0_way_i2;
`endif
      i4_3_ic_inv_vld_s     <= #1 i4_3_ic_inv_vld_f;
      i4_3_ic_inv_addr_s  <= #1 i4_3_ic_inv_addr_f;
      i4_3_ic_inv_word1_s <= #1 i4_3_ic_inv_word1_f;
      i4_3_ic_inv_word0_s <= #1 i4_3_ic_inv_word0_f;
      i4_3_ic_inv_way1_s  <= #1 i4_3_ic_inv_way1_f;
      i4_3_ic_inv_way0_s  <= #1 i4_3_ic_inv_way0_f;
      i4_3_st_wr_dcache_m <= #1 `SPARC_CORE3.`LSU_PATH.lsu_st_wr_dcache;
      i4_3_fill_dcache_m  <= #1 `SPARC_CORE3.`LSU_PATH.lsu_dcache_wr_vld_e & ~`SPARC_CORE3.`LSU_PATH.lsu_st_wr_dcache;
      i4_3_dcache_fill_addr_m <= #1 `SPARC_CORE3.`LSU_PATH.dctl.dcache_fill_addr_e;
      i4_3_dva_svld_m     <= #1 `SPARC_CORE3.`LSU_PATH.qctl2.dva_svld_e &
	      (`SPARC_CORE3.`LSU_PATH.qdp2.dfq_byp_ff_data[143:140]=='h4) &
	      ~(`SPARC_CORE3.`LSU_PATH.qctl2.memref_e &
		`SPARC_CORE3.`LSU_PATH.qctl2.dfq_st_vld &
		`SPARC_CORE3.`LSU_PATH.qctl2.dfq_local_inv &
		`SPARC_CORE3.`LSU_PATH.qctl2.lsu_cpx_pkt_atomic);
      i4_3_dva_snp_addr_m     <= #1 `SPARC_CORE3.`LSU_PATH.qctl2.dva_snp_addr_e;
      i4_3_dva_snp_set_vld_m  <= #1 `SPARC_CORE3.`LSU_PATH.qctl2.dva_snp_set_vld_e;
      i4_3_dva_snp_wy0_m <= #1 `SPARC_CORE3.`LSU_PATH.qctl2.dva_snp_wy0_e;
      i4_3_dva_snp_wy1_m <= #1 `SPARC_CORE3.`LSU_PATH.qctl2.dva_snp_wy1_e;
      i4_3_dva_snp_wy2_m <= #1 `SPARC_CORE3.`LSU_PATH.qctl2.dva_snp_wy2_e;
      i4_3_dva_snp_wy3_m <= #1 `SPARC_CORE3.`LSU_PATH.qctl2.dva_snp_wy3_e;
      i4_3_st_wr_dcache_w    <= #1 i4_3_st_wr_dcache_m;
      i4_3_fill_dcache_w     <= #1 i4_3_fill_dcache_m;
      i4_3_dcache_fill_addr_w <= #1 i4_3_dcache_fill_addr_m;
      i4_3_dva_svld_w         <= #1 i4_3_dva_svld_m;
      i4_3_dva_snp_addr_w     <= #1 i4_3_dva_snp_addr_m;
      i4_3_dva_snp_set_vld_w  <= #1 i4_3_dva_snp_set_vld_m;
      i4_3_dva_snp_wy0_w <= #1 i4_3_dva_snp_wy0_m;
      i4_3_dva_snp_wy1_w <= #1 i4_3_dva_snp_wy1_m;
      i4_3_dva_snp_wy2_w <= #1 i4_3_dva_snp_wy2_m;
      i4_3_dva_snp_wy3_w <= #1 i4_3_dva_snp_wy3_m;
`endif // ifdef RTL_SPARC3

`ifdef RTL_SPARC4
`ifndef RTL_SPU
      i4_4_fprs_set_e  <= #1 `SPARC_CORE4.sparc0.ifu.ifu.swl.fprs_sel_set;
      i4_4_new_fprs_e  <= #1 `SPARC_CORE4.sparc0.ifu.ifu.swl.new_fprs;
`else
      i4_4_fprs_set_e  <= #1 `SPARC_CORE4.sparc0.ifu.swl.fprs_sel_set;
      i4_4_new_fprs_e  <= #1 `SPARC_CORE4.sparc0.ifu.swl.new_fprs;
`endif
      i4_4_fprs_set_m  <= #1 i4_4_fprs_set_e;
      i4_4_new_fprs_m  <= #1 i4_4_new_fprs_e;
      i4_4_fprs_set_w  <= #1 i4_4_fprs_set_m;
      i4_4_new_fprs_w  <= #1 i4_4_new_fprs_m;
`ifndef RTL_SPU
      i4_4_rstint_w    <= #1 `SPARC_CORE4.sparc0.ifu.ifu.fcl.ifu_tlu_rstint_m;
      i4_4_hwint_w     <= #1 `SPARC_CORE4.sparc0.ifu.ifu.fcl.ifu_tlu_hwint_m;
      i4_4_sftint_w    <= #1 `SPARC_CORE4.sparc0.ifu.ifu.fcl.ifu_tlu_sftint_m;
      i4_4_hint_m      <= #1 `SPARC_CORE4.sparc0.ifu.ifu.fcl.ttype_sel_hstk_cmp_e;
      i4_4_hint_w      <= #1 i4_4_hint_m & `SPARC_CORE4.sparc0.ifu.ifu.fcl.ifu_tlu_ttype_vld_m;
      i4_4_int_thr_w       <= #1 `SPARC_CORE4.sparc0.ifu.ifu.fcl.thr_m;

      i4_4_ic_inv_vld_f <= #1 `SPARC_CORE4.sparc0.ifu.ifu.invctl.stpkt_i2 &
                         `SPARC_CORE4.sparc0.ifu.ifu.invctl.invalidate_i2 &
                 `SPARC_CORE4.sparc0.ifu.ifu.invctl.icvidx_sel_inv_i2;
      i4_4_ic_inv_addr_f  <= #1 `SPARC_CORE4.sparc0.ifu.ifu.invctl.inv_addr_i2[`IC_IDX_HI:6];
      i4_4_ic_inv_word1_f <= #1 `SPARC_CORE4.sparc0.ifu.ifu.invctl.word1_inv_i2;
      i4_4_ic_inv_word0_f <= #1 `SPARC_CORE4.sparc0.ifu.ifu.invctl.word0_inv_i2;
      i4_4_ic_inv_way1_f  <= #1 `SPARC_CORE4.sparc0.ifu.ifu.invctl.invwd1_way_i2;
      i4_4_ic_inv_way0_f  <= #1 `SPARC_CORE4.sparc0.ifu.ifu.invctl.invwd0_way_i2;
`else
      i4_4_rstint_w    <= #1 `SPARC_CORE4.sparc0.ifu.fcl.ifu_tlu_rstint_m;
      i4_4_hwint_w     <= #1 `SPARC_CORE4.sparc0.ifu.fcl.ifu_tlu_hwint_m;
      i4_4_sftint_w    <= #1 `SPARC_CORE4.sparc0.ifu.fcl.ifu_tlu_sftint_m;
      i4_4_hint_m      <= #1 `SPARC_CORE4.sparc0.ifu.fcl.ttype_sel_hstk_cmp_e;
      i4_4_hint_w      <= #1 i4_4_hint_m & `SPARC_CORE4.sparc0.ifu.fcl.ifu_tlu_ttype_vld_m;
      i4_4_int_thr_w       <= #1 `SPARC_CORE4.sparc0.ifu.fcl.thr_m;

      i4_4_ic_inv_vld_f <= #1 `SPARC_CORE4.sparc0.ifu.invctl.stpkt_i2 &
	                     `SPARC_CORE4.sparc0.ifu.invctl.invalidate_i2 &
			     `SPARC_CORE4.sparc0.ifu.invctl.icvidx_sel_inv_i2;
      i4_4_ic_inv_addr_f  <= #1 `SPARC_CORE4.sparc0.ifu.invctl.inv_addr_i2[`IC_IDX_HI:6];
      i4_4_ic_inv_word1_f <= #1 `SPARC_CORE4.sparc0.ifu.invctl.word1_inv_i2;
      i4_4_ic_inv_word0_f <= #1 `SPARC_CORE4.sparc0.ifu.invctl.word0_inv_i2;
      i4_4_ic_inv_way1_f  <= #1 `SPARC_CORE4.sparc0.ifu.invctl.invwd1_way_i2;
      i4_4_ic_inv_way0_f  <= #1 `SPARC_CORE4.sparc0.ifu.invctl.invwd0_way_i2;
`endif
      i4_4_ic_inv_vld_s     <= #1 i4_4_ic_inv_vld_f;
      i4_4_ic_inv_addr_s  <= #1 i4_4_ic_inv_addr_f;
      i4_4_ic_inv_word1_s <= #1 i4_4_ic_inv_word1_f;
      i4_4_ic_inv_word0_s <= #1 i4_4_ic_inv_word0_f;
      i4_4_ic_inv_way1_s  <= #1 i4_4_ic_inv_way1_f;
      i4_4_ic_inv_way0_s  <= #1 i4_4_ic_inv_way0_f;
      i4_4_st_wr_dcache_m <= #1 `SPARC_CORE4.`LSU_PATH.lsu_st_wr_dcache;
      i4_4_fill_dcache_m  <= #1 `SPARC_CORE4.`LSU_PATH.lsu_dcache_wr_vld_e & ~`SPARC_CORE4.`LSU_PATH.lsu_st_wr_dcache;
      i4_4_dcache_fill_addr_m <= #1 `SPARC_CORE4.`LSU_PATH.dctl.dcache_fill_addr_e;
      i4_4_dva_svld_m     <= #1 `SPARC_CORE4.`LSU_PATH.qctl2.dva_svld_e &
	      (`SPARC_CORE4.`LSU_PATH.qdp2.dfq_byp_ff_data[143:140]=='h4) &
	      ~(`SPARC_CORE4.`LSU_PATH.qctl2.memref_e &
		`SPARC_CORE4.`LSU_PATH.qctl2.dfq_st_vld &
		`SPARC_CORE4.`LSU_PATH.qctl2.dfq_local_inv &
		`SPARC_CORE4.`LSU_PATH.qctl2.lsu_cpx_pkt_atomic);
      i4_4_dva_snp_addr_m     <= #1 `SPARC_CORE4.`LSU_PATH.qctl2.dva_snp_addr_e;
      i4_4_dva_snp_set_vld_m  <= #1 `SPARC_CORE4.`LSU_PATH.qctl2.dva_snp_set_vld_e;
      i4_4_dva_snp_wy0_m <= #1 `SPARC_CORE4.`LSU_PATH.qctl2.dva_snp_wy0_e;
      i4_4_dva_snp_wy1_m <= #1 `SPARC_CORE4.`LSU_PATH.qctl2.dva_snp_wy1_e;
      i4_4_dva_snp_wy2_m <= #1 `SPARC_CORE4.`LSU_PATH.qctl2.dva_snp_wy2_e;
      i4_4_dva_snp_wy3_m <= #1 `SPARC_CORE4.`LSU_PATH.qctl2.dva_snp_wy3_e;
      i4_4_st_wr_dcache_w    <= #1 i4_4_st_wr_dcache_m;
      i4_4_fill_dcache_w     <= #1 i4_4_fill_dcache_m;
      i4_4_dcache_fill_addr_w <= #1 i4_4_dcache_fill_addr_m;
      i4_4_dva_svld_w         <= #1 i4_4_dva_svld_m;
      i4_4_dva_snp_addr_w     <= #1 i4_4_dva_snp_addr_m;
      i4_4_dva_snp_set_vld_w  <= #1 i4_4_dva_snp_set_vld_m;
      i4_4_dva_snp_wy0_w <= #1 i4_4_dva_snp_wy0_m;
      i4_4_dva_snp_wy1_w <= #1 i4_4_dva_snp_wy1_m;
      i4_4_dva_snp_wy2_w <= #1 i4_4_dva_snp_wy2_m;
      i4_4_dva_snp_wy3_w <= #1 i4_4_dva_snp_wy3_m;
`endif // ifdef RTL_SPARC4

`ifdef RTL_SPARC5
`ifndef RTL_SPU
      i4_5_fprs_set_e  <= #1 `SPARC_CORE5.sparc0.ifu.ifu.swl.fprs_sel_set;
      i4_5_new_fprs_e  <= #1 `SPARC_CORE5.sparc0.ifu.ifu.swl.new_fprs;
`else
      i4_5_fprs_set_e  <= #1 `SPARC_CORE5.sparc0.ifu.swl.fprs_sel_set;
      i4_5_new_fprs_e  <= #1 `SPARC_CORE5.sparc0.ifu.swl.new_fprs;
`endif
      i4_5_fprs_set_m  <= #1 i4_5_fprs_set_e;
      i4_5_new_fprs_m  <= #1 i4_5_new_fprs_e;
      i4_5_fprs_set_w  <= #1 i4_5_fprs_set_m;
      i4_5_new_fprs_w  <= #1 i4_5_new_fprs_m;
`ifndef RTL_SPU
      i4_5_rstint_w    <= #1 `SPARC_CORE5.sparc0.ifu.ifu.fcl.ifu_tlu_rstint_m;
      i4_5_hwint_w     <= #1 `SPARC_CORE5.sparc0.ifu.ifu.fcl.ifu_tlu_hwint_m;
      i4_5_sftint_w    <= #1 `SPARC_CORE5.sparc0.ifu.ifu.fcl.ifu_tlu_sftint_m;
      i4_5_hint_m      <= #1 `SPARC_CORE5.sparc0.ifu.ifu.fcl.ttype_sel_hstk_cmp_e;
      i4_5_hint_w      <= #1 i4_5_hint_m & `SPARC_CORE5.sparc0.ifu.ifu.fcl.ifu_tlu_ttype_vld_m;
      i4_5_int_thr_w       <= #1 `SPARC_CORE5.sparc0.ifu.ifu.fcl.thr_m;

      i4_5_ic_inv_vld_f <= #1 `SPARC_CORE5.sparc0.ifu.ifu.invctl.stpkt_i2 &
                         `SPARC_CORE5.sparc0.ifu.ifu.invctl.invalidate_i2 &
                 `SPARC_CORE5.sparc0.ifu.ifu.invctl.icvidx_sel_inv_i2;
      i4_5_ic_inv_addr_f  <= #1 `SPARC_CORE5.sparc0.ifu.ifu.invctl.inv_addr_i2[`IC_IDX_HI:6];
      i4_5_ic_inv_word1_f <= #1 `SPARC_CORE5.sparc0.ifu.ifu.invctl.word1_inv_i2;
      i4_5_ic_inv_word0_f <= #1 `SPARC_CORE5.sparc0.ifu.ifu.invctl.word0_inv_i2;
      i4_5_ic_inv_way1_f  <= #1 `SPARC_CORE5.sparc0.ifu.ifu.invctl.invwd1_way_i2;
      i4_5_ic_inv_way0_f  <= #1 `SPARC_CORE5.sparc0.ifu.ifu.invctl.invwd0_way_i2;
`else
      i4_5_rstint_w    <= #1 `SPARC_CORE5.sparc0.ifu.fcl.ifu_tlu_rstint_m;
      i4_5_hwint_w     <= #1 `SPARC_CORE5.sparc0.ifu.fcl.ifu_tlu_hwint_m;
      i4_5_sftint_w    <= #1 `SPARC_CORE5.sparc0.ifu.fcl.ifu_tlu_sftint_m;
      i4_5_hint_m      <= #1 `SPARC_CORE5.sparc0.ifu.fcl.ttype_sel_hstk_cmp_e;
      i4_5_hint_w      <= #1 i4_5_hint_m & `SPARC_CORE5.sparc0.ifu.fcl.ifu_tlu_ttype_vld_m;
      i4_5_int_thr_w       <= #1 `SPARC_CORE5.sparc0.ifu.fcl.thr_m;

      i4_5_ic_inv_vld_f <= #1 `SPARC_CORE5.sparc0.ifu.invctl.stpkt_i2 &
	                     `SPARC_CORE5.sparc0.ifu.invctl.invalidate_i2 &
			     `SPARC_CORE5.sparc0.ifu.invctl.icvidx_sel_inv_i2;
      i4_5_ic_inv_addr_f  <= #1 `SPARC_CORE5.sparc0.ifu.invctl.inv_addr_i2[`IC_IDX_HI:6];
      i4_5_ic_inv_word1_f <= #1 `SPARC_CORE5.sparc0.ifu.invctl.word1_inv_i2;
      i4_5_ic_inv_word0_f <= #1 `SPARC_CORE5.sparc0.ifu.invctl.word0_inv_i2;
      i4_5_ic_inv_way1_f  <= #1 `SPARC_CORE5.sparc0.ifu.invctl.invwd1_way_i2;
      i4_5_ic_inv_way0_f  <= #1 `SPARC_CORE5.sparc0.ifu.invctl.invwd0_way_i2;
`endif
      i4_5_ic_inv_vld_s     <= #1 i4_5_ic_inv_vld_f;
      i4_5_ic_inv_addr_s  <= #1 i4_5_ic_inv_addr_f;
      i4_5_ic_inv_word1_s <= #1 i4_5_ic_inv_word1_f;
      i4_5_ic_inv_word0_s <= #1 i4_5_ic_inv_word0_f;
      i4_5_ic_inv_way1_s  <= #1 i4_5_ic_inv_way1_f;
      i4_5_ic_inv_way0_s  <= #1 i4_5_ic_inv_way0_f;
      i4_5_st_wr_dcache_m <= #1 `SPARC_CORE5.`LSU_PATH.lsu_st_wr_dcache;
      i4_5_fill_dcache_m  <= #1 `SPARC_CORE5.`LSU_PATH.lsu_dcache_wr_vld_e & ~`SPARC_CORE5.`LSU_PATH.lsu_st_wr_dcache;
      i4_5_dcache_fill_addr_m <= #1 `SPARC_CORE5.`LSU_PATH.dctl.dcache_fill_addr_e;
      i4_5_dva_svld_m     <= #1 `SPARC_CORE5.`LSU_PATH.qctl2.dva_svld_e &
	      (`SPARC_CORE5.`LSU_PATH.qdp2.dfq_byp_ff_data[143:140]=='h4) &
	      ~(`SPARC_CORE5.`LSU_PATH.qctl2.memref_e &
		`SPARC_CORE5.`LSU_PATH.qctl2.dfq_st_vld &
		`SPARC_CORE5.`LSU_PATH.qctl2.dfq_local_inv &
		`SPARC_CORE5.`LSU_PATH.qctl2.lsu_cpx_pkt_atomic);
      i4_5_dva_snp_addr_m     <= #1 `SPARC_CORE5.`LSU_PATH.qctl2.dva_snp_addr_e;
      i4_5_dva_snp_set_vld_m  <= #1 `SPARC_CORE5.`LSU_PATH.qctl2.dva_snp_set_vld_e;
      i4_5_dva_snp_wy0_m <= #1 `SPARC_CORE5.`LSU_PATH.qctl2.dva_snp_wy0_e;
      i4_5_dva_snp_wy1_m <= #1 `SPARC_CORE5.`LSU_PATH.qctl2.dva_snp_wy1_e;
      i4_5_dva_snp_wy2_m <= #1 `SPARC_CORE5.`LSU_PATH.qctl2.dva_snp_wy2_e;
      i4_5_dva_snp_wy3_m <= #1 `SPARC_CORE5.`LSU_PATH.qctl2.dva_snp_wy3_e;
      i4_5_st_wr_dcache_w    <= #1 i4_5_st_wr_dcache_m;
      i4_5_fill_dcache_w     <= #1 i4_5_fill_dcache_m;
      i4_5_dcache_fill_addr_w <= #1 i4_5_dcache_fill_addr_m;
      i4_5_dva_svld_w         <= #1 i4_5_dva_svld_m;
      i4_5_dva_snp_addr_w     <= #1 i4_5_dva_snp_addr_m;
      i4_5_dva_snp_set_vld_w  <= #1 i4_5_dva_snp_set_vld_m;
      i4_5_dva_snp_wy0_w <= #1 i4_5_dva_snp_wy0_m;
      i4_5_dva_snp_wy1_w <= #1 i4_5_dva_snp_wy1_m;
      i4_5_dva_snp_wy2_w <= #1 i4_5_dva_snp_wy2_m;
      i4_5_dva_snp_wy3_w <= #1 i4_5_dva_snp_wy3_m;
`endif // ifdef RTL_SPARC5

`ifdef RTL_SPARC6
`ifndef RTL_SPU
      i4_6_fprs_set_e  <= #1 `SPARC_CORE6.sparc0.ifu.ifu.swl.fprs_sel_set;
      i4_6_new_fprs_e  <= #1 `SPARC_CORE6.sparc0.ifu.ifu.swl.new_fprs;
`else
      i4_6_fprs_set_e  <= #1 `SPARC_CORE6.sparc0.ifu.swl.fprs_sel_set;
      i4_6_new_fprs_e  <= #1 `SPARC_CORE6.sparc0.ifu.swl.new_fprs;
`endif
      i4_6_fprs_set_m  <= #1 i4_6_fprs_set_e;
      i4_6_new_fprs_m  <= #1 i4_6_new_fprs_e;
      i4_6_fprs_set_w  <= #1 i4_6_fprs_set_m;
      i4_6_new_fprs_w  <= #1 i4_6_new_fprs_m;
`ifndef RTL_SPU
      i4_6_rstint_w    <= #1 `SPARC_CORE6.sparc0.ifu.ifu.fcl.ifu_tlu_rstint_m;
      i4_6_hwint_w     <= #1 `SPARC_CORE6.sparc0.ifu.ifu.fcl.ifu_tlu_hwint_m;
      i4_6_sftint_w    <= #1 `SPARC_CORE6.sparc0.ifu.ifu.fcl.ifu_tlu_sftint_m;
      i4_6_hint_m      <= #1 `SPARC_CORE6.sparc0.ifu.ifu.fcl.ttype_sel_hstk_cmp_e;
      i4_6_hint_w      <= #1 i4_6_hint_m & `SPARC_CORE6.sparc0.ifu.ifu.fcl.ifu_tlu_ttype_vld_m;
      i4_6_int_thr_w       <= #1 `SPARC_CORE6.sparc0.ifu.ifu.fcl.thr_m;

      i4_6_ic_inv_vld_f <= #1 `SPARC_CORE6.sparc0.ifu.ifu.invctl.stpkt_i2 &
                         `SPARC_CORE6.sparc0.ifu.ifu.invctl.invalidate_i2 &
                 `SPARC_CORE6.sparc0.ifu.ifu.invctl.icvidx_sel_inv_i2;
      i4_6_ic_inv_addr_f  <= #1 `SPARC_CORE6.sparc0.ifu.ifu.invctl.inv_addr_i2[`IC_IDX_HI:6];
      i4_6_ic_inv_word1_f <= #1 `SPARC_CORE6.sparc0.ifu.ifu.invctl.word1_inv_i2;
      i4_6_ic_inv_word0_f <= #1 `SPARC_CORE6.sparc0.ifu.ifu.invctl.word0_inv_i2;
      i4_6_ic_inv_way1_f  <= #1 `SPARC_CORE6.sparc0.ifu.ifu.invctl.invwd1_way_i2;
      i4_6_ic_inv_way0_f  <= #1 `SPARC_CORE6.sparc0.ifu.ifu.invctl.invwd0_way_i2;
`else
      i4_6_rstint_w    <= #1 `SPARC_CORE6.sparc0.ifu.fcl.ifu_tlu_rstint_m;
      i4_6_hwint_w     <= #1 `SPARC_CORE6.sparc0.ifu.fcl.ifu_tlu_hwint_m;
      i4_6_sftint_w    <= #1 `SPARC_CORE6.sparc0.ifu.fcl.ifu_tlu_sftint_m;
      i4_6_hint_m      <= #1 `SPARC_CORE6.sparc0.ifu.fcl.ttype_sel_hstk_cmp_e;
      i4_6_hint_w      <= #1 i4_6_hint_m & `SPARC_CORE6.sparc0.ifu.fcl.ifu_tlu_ttype_vld_m;
      i4_6_int_thr_w       <= #1 `SPARC_CORE6.sparc0.ifu.fcl.thr_m;

      i4_6_ic_inv_vld_f <= #1 `SPARC_CORE6.sparc0.ifu.invctl.stpkt_i2 &
	                     `SPARC_CORE6.sparc0.ifu.invctl.invalidate_i2 &
			     `SPARC_CORE6.sparc0.ifu.invctl.icvidx_sel_inv_i2;
      i4_6_ic_inv_addr_f  <= #1 `SPARC_CORE6.sparc0.ifu.invctl.inv_addr_i2[`IC_IDX_HI:6];
      i4_6_ic_inv_word1_f <= #1 `SPARC_CORE6.sparc0.ifu.invctl.word1_inv_i2;
      i4_6_ic_inv_word0_f <= #1 `SPARC_CORE6.sparc0.ifu.invctl.word0_inv_i2;
      i4_6_ic_inv_way1_f  <= #1 `SPARC_CORE6.sparc0.ifu.invctl.invwd1_way_i2;
      i4_6_ic_inv_way0_f  <= #1 `SPARC_CORE6.sparc0.ifu.invctl.invwd0_way_i2;
`endif
      i4_6_ic_inv_vld_s     <= #1 i4_6_ic_inv_vld_f;
      i4_6_ic_inv_addr_s  <= #1 i4_6_ic_inv_addr_f;
      i4_6_ic_inv_word1_s <= #1 i4_6_ic_inv_word1_f;
      i4_6_ic_inv_word0_s <= #1 i4_6_ic_inv_word0_f;
      i4_6_ic_inv_way1_s  <= #1 i4_6_ic_inv_way1_f;
      i4_6_ic_inv_way0_s  <= #1 i4_6_ic_inv_way0_f;
      i4_6_st_wr_dcache_m <= #1 `SPARC_CORE6.`LSU_PATH.lsu_st_wr_dcache;
      i4_6_fill_dcache_m  <= #1 `SPARC_CORE6.`LSU_PATH.lsu_dcache_wr_vld_e & ~`SPARC_CORE6.`LSU_PATH.lsu_st_wr_dcache;
      i4_6_dcache_fill_addr_m <= #1 `SPARC_CORE6.`LSU_PATH.dctl.dcache_fill_addr_e;
      i4_6_dva_svld_m     <= #1 `SPARC_CORE6.`LSU_PATH.qctl2.dva_svld_e &
	      (`SPARC_CORE6.`LSU_PATH.qdp2.dfq_byp_ff_data[143:140]=='h4) &
	      ~(`SPARC_CORE6.`LSU_PATH.qctl2.memref_e &
		`SPARC_CORE6.`LSU_PATH.qctl2.dfq_st_vld &
		`SPARC_CORE6.`LSU_PATH.qctl2.dfq_local_inv &
		`SPARC_CORE6.`LSU_PATH.qctl2.lsu_cpx_pkt_atomic);
      i4_6_dva_snp_addr_m     <= #1 `SPARC_CORE6.`LSU_PATH.qctl2.dva_snp_addr_e;
      i4_6_dva_snp_set_vld_m  <= #1 `SPARC_CORE6.`LSU_PATH.qctl2.dva_snp_set_vld_e;
      i4_6_dva_snp_wy0_m <= #1 `SPARC_CORE6.`LSU_PATH.qctl2.dva_snp_wy0_e;
      i4_6_dva_snp_wy1_m <= #1 `SPARC_CORE6.`LSU_PATH.qctl2.dva_snp_wy1_e;
      i4_6_dva_snp_wy2_m <= #1 `SPARC_CORE6.`LSU_PATH.qctl2.dva_snp_wy2_e;
      i4_6_dva_snp_wy3_m <= #1 `SPARC_CORE6.`LSU_PATH.qctl2.dva_snp_wy3_e;
      i4_6_st_wr_dcache_w    <= #1 i4_6_st_wr_dcache_m;
      i4_6_fill_dcache_w     <= #1 i4_6_fill_dcache_m;
      i4_6_dcache_fill_addr_w <= #1 i4_6_dcache_fill_addr_m;
      i4_6_dva_svld_w         <= #1 i4_6_dva_svld_m;
      i4_6_dva_snp_addr_w     <= #1 i4_6_dva_snp_addr_m;
      i4_6_dva_snp_set_vld_w  <= #1 i4_6_dva_snp_set_vld_m;
      i4_6_dva_snp_wy0_w <= #1 i4_6_dva_snp_wy0_m;
      i4_6_dva_snp_wy1_w <= #1 i4_6_dva_snp_wy1_m;
      i4_6_dva_snp_wy2_w <= #1 i4_6_dva_snp_wy2_m;
      i4_6_dva_snp_wy3_w <= #1 i4_6_dva_snp_wy3_m;
`endif // ifdef RTL_SPARC6

`ifdef RTL_SPARC7
`ifndef RTL_SPU
      i4_7_fprs_set_e  <= #1 `SPARC_CORE7.sparc0.ifu.ifu.swl.fprs_sel_set;
      i4_7_new_fprs_e  <= #1 `SPARC_CORE7.sparc0.ifu.ifu.swl.new_fprs;
`else
      i4_7_fprs_set_e  <= #1 `SPARC_CORE7.sparc0.ifu.swl.fprs_sel_set;
      i4_7_new_fprs_e  <= #1 `SPARC_CORE7.sparc0.ifu.swl.new_fprs;
`endif
      i4_7_fprs_set_m  <= #1 i4_7_fprs_set_e;
      i4_7_new_fprs_m  <= #1 i4_7_new_fprs_e;
      i4_7_fprs_set_w  <= #1 i4_7_fprs_set_m;
      i4_7_new_fprs_w  <= #1 i4_7_new_fprs_m;
`ifndef RTL_SPU
      i4_7_rstint_w    <= #1 `SPARC_CORE7.sparc0.ifu.ifu.fcl.ifu_tlu_rstint_m;
      i4_7_hwint_w     <= #1 `SPARC_CORE7.sparc0.ifu.ifu.fcl.ifu_tlu_hwint_m;
      i4_7_sftint_w    <= #1 `SPARC_CORE7.sparc0.ifu.ifu.fcl.ifu_tlu_sftint_m;
      i4_7_hint_m      <= #1 `SPARC_CORE7.sparc0.ifu.ifu.fcl.ttype_sel_hstk_cmp_e;
      i4_7_hint_w      <= #1 i4_7_hint_m & `SPARC_CORE7.sparc0.ifu.ifu.fcl.ifu_tlu_ttype_vld_m;
      i4_7_int_thr_w       <= #1 `SPARC_CORE7.sparc0.ifu.ifu.fcl.thr_m;

      i4_7_ic_inv_vld_f <= #1 `SPARC_CORE7.sparc0.ifu.ifu.invctl.stpkt_i2 &
                         `SPARC_CORE7.sparc0.ifu.ifu.invctl.invalidate_i2 &
                 `SPARC_CORE7.sparc0.ifu.ifu.invctl.icvidx_sel_inv_i2;
      i4_7_ic_inv_addr_f  <= #1 `SPARC_CORE7.sparc0.ifu.ifu.invctl.inv_addr_i2[`IC_IDX_HI:6];
      i4_7_ic_inv_word1_f <= #1 `SPARC_CORE7.sparc0.ifu.ifu.invctl.word1_inv_i2;
      i4_7_ic_inv_word0_f <= #1 `SPARC_CORE7.sparc0.ifu.ifu.invctl.word0_inv_i2;
      i4_7_ic_inv_way1_f  <= #1 `SPARC_CORE7.sparc0.ifu.ifu.invctl.invwd1_way_i2;
      i4_7_ic_inv_way0_f  <= #1 `SPARC_CORE7.sparc0.ifu.ifu.invctl.invwd0_way_i2;
`else
      i4_7_rstint_w    <= #1 `SPARC_CORE7.sparc0.ifu.fcl.ifu_tlu_rstint_m;
      i4_7_hwint_w     <= #1 `SPARC_CORE7.sparc0.ifu.fcl.ifu_tlu_hwint_m;
      i4_7_sftint_w    <= #1 `SPARC_CORE7.sparc0.ifu.fcl.ifu_tlu_sftint_m;
      i4_7_hint_m      <= #1 `SPARC_CORE7.sparc0.ifu.fcl.ttype_sel_hstk_cmp_e;
      i4_7_hint_w      <= #1 i4_7_hint_m & `SPARC_CORE7.sparc0.ifu.fcl.ifu_tlu_ttype_vld_m;
      i4_7_int_thr_w       <= #1 `SPARC_CORE7.sparc0.ifu.fcl.thr_m;

      i4_7_ic_inv_vld_f <= #1 `SPARC_CORE7.sparc0.ifu.invctl.stpkt_i2 &
	                     `SPARC_CORE7.sparc0.ifu.invctl.invalidate_i2 &
			     `SPARC_CORE7.sparc0.ifu.invctl.icvidx_sel_inv_i2;
      i4_7_ic_inv_addr_f  <= #1 `SPARC_CORE7.sparc0.ifu.invctl.inv_addr_i2[`IC_IDX_HI:6];
      i4_7_ic_inv_word1_f <= #1 `SPARC_CORE7.sparc0.ifu.invctl.word1_inv_i2;
      i4_7_ic_inv_word0_f <= #1 `SPARC_CORE7.sparc0.ifu.invctl.word0_inv_i2;
      i4_7_ic_inv_way1_f  <= #1 `SPARC_CORE7.sparc0.ifu.invctl.invwd1_way_i2;
      i4_7_ic_inv_way0_f  <= #1 `SPARC_CORE7.sparc0.ifu.invctl.invwd0_way_i2;
`endif
      i4_7_ic_inv_vld_s     <= #1 i4_7_ic_inv_vld_f;
      i4_7_ic_inv_addr_s  <= #1 i4_7_ic_inv_addr_f;
      i4_7_ic_inv_word1_s <= #1 i4_7_ic_inv_word1_f;
      i4_7_ic_inv_word0_s <= #1 i4_7_ic_inv_word0_f;
      i4_7_ic_inv_way1_s  <= #1 i4_7_ic_inv_way1_f;
      i4_7_ic_inv_way0_s  <= #1 i4_7_ic_inv_way0_f;
      i4_7_st_wr_dcache_m <= #1 `SPARC_CORE7.`LSU_PATH.lsu_st_wr_dcache;
      i4_7_fill_dcache_m  <= #1 `SPARC_CORE7.`LSU_PATH.lsu_dcache_wr_vld_e & ~`SPARC_CORE7.`LSU_PATH.lsu_st_wr_dcache;
      i4_7_dcache_fill_addr_m <= #1 `SPARC_CORE7.`LSU_PATH.dctl.dcache_fill_addr_e;
      i4_7_dva_svld_m     <= #1 `SPARC_CORE7.`LSU_PATH.qctl2.dva_svld_e &
	      (`SPARC_CORE7.`LSU_PATH.qdp2.dfq_byp_ff_data[143:140]=='h4) &
	      ~(`SPARC_CORE7.`LSU_PATH.qctl2.memref_e &
		`SPARC_CORE7.`LSU_PATH.qctl2.dfq_st_vld &
		`SPARC_CORE7.`LSU_PATH.qctl2.dfq_local_inv &
		`SPARC_CORE7.`LSU_PATH.qctl2.lsu_cpx_pkt_atomic);
      i4_7_dva_snp_addr_m     <= #1 `SPARC_CORE7.`LSU_PATH.qctl2.dva_snp_addr_e;
      i4_7_dva_snp_set_vld_m  <= #1 `SPARC_CORE7.`LSU_PATH.qctl2.dva_snp_set_vld_e;
      i4_7_dva_snp_wy0_m <= #1 `SPARC_CORE7.`LSU_PATH.qctl2.dva_snp_wy0_e;
      i4_7_dva_snp_wy1_m <= #1 `SPARC_CORE7.`LSU_PATH.qctl2.dva_snp_wy1_e;
      i4_7_dva_snp_wy2_m <= #1 `SPARC_CORE7.`LSU_PATH.qctl2.dva_snp_wy2_e;
      i4_7_dva_snp_wy3_m <= #1 `SPARC_CORE7.`LSU_PATH.qctl2.dva_snp_wy3_e;
      i4_7_st_wr_dcache_w    <= #1 i4_7_st_wr_dcache_m;
      i4_7_fill_dcache_w     <= #1 i4_7_fill_dcache_m;
      i4_7_dcache_fill_addr_w <= #1 i4_7_dcache_fill_addr_m;
      i4_7_dva_svld_w         <= #1 i4_7_dva_svld_m;
      i4_7_dva_snp_addr_w     <= #1 i4_7_dva_snp_addr_m;
      i4_7_dva_snp_set_vld_w  <= #1 i4_7_dva_snp_set_vld_m;
      i4_7_dva_snp_wy0_w <= #1 i4_7_dva_snp_wy0_m;
      i4_7_dva_snp_wy1_w <= #1 i4_7_dva_snp_wy1_m;
      i4_7_dva_snp_wy2_w <= #1 i4_7_dva_snp_wy2_m;
      i4_7_dva_snp_wy3_w <= #1 i4_7_dva_snp_wy3_m;
`endif // ifdef RTL_SPARC7

   end // always @(posedge clk)

`ifdef RTL_SPARC0
`ifndef RTL_SPU
   assign i4_0_trap     = `SPARC_CORE0.sparc0.tlu.tlu.tcl.thrd0_traps |
              `SPARC_CORE0.sparc0.tlu.tlu.tcl.thrd1_traps |
              `SPARC_CORE0.sparc0.tlu.tlu.tcl.thrd2_traps |
              `SPARC_CORE0.sparc0.tlu.tlu.tcl.thrd3_traps;
   assign i4_0_immu_miss= i4_0_trap &
            ((`SPARC_CORE0.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h64) |
         (`SPARC_CORE0.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h3e));
   assign i4_0_dmmu_miss= i4_0_trap &
        ((`SPARC_CORE0.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h68) |
         (`SPARC_CORE0.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h3f)); 
`else
   assign i4_0_trap     = `SPARC_CORE0.sparc0.tlu.tcl.thrd0_traps |
			  `SPARC_CORE0.sparc0.tlu.tcl.thrd1_traps |
			  `SPARC_CORE0.sparc0.tlu.tcl.thrd2_traps |
			  `SPARC_CORE0.sparc0.tlu.tcl.thrd3_traps;
   assign i4_0_immu_miss= i4_0_trap &
	        ((`SPARC_CORE0.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h64) |
		 (`SPARC_CORE0.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h3e));
   assign i4_0_dmmu_miss= i4_0_trap &
		((`SPARC_CORE0.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h68) |
		 (`SPARC_CORE0.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h3f));
`endif        
   assign i4_0_spu_trap_ack_w= `SPARC_CORE0.sparc0.ifu_spu_trap_ack;
   assign i4_0_spu_illgl_va= `SPARC_CORE0.sparc0.spu_lsu_ldxa_data_vld_w2 &
				`SPARC_CORE0.sparc0.spu_lsu_ldxa_illgl_va_w2;
`ifndef RTL_SPU
   assign i4_0_rstint_vld_w= i4_0_rstint_w &
                `SPARC_CORE0.sparc0.ifu.ifu.ifu_tlu_inst_vld_w &
                ~`SPARC_CORE0.sparc0.ifu.ifu.ifu_tlu_flush_w;
   assign i4_0_hwint_vld_w= i4_0_hwint_w &
            `SPARC_CORE0.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE0.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE0.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE0.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_0_sftint_vld_w= i4_0_sftint_w &
            `SPARC_CORE0.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE0.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE0.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE0.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_0_hint_vld_w=  i4_0_hint_w &
            `SPARC_CORE0.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE0.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE0.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE0.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_0_tick_match= `SPARC_CORE0.sparc0.tlu.tlu.tdp.tickcmp_int[3:0];
   assign i4_0_stick_match= `SPARC_CORE0.sparc0.tlu.tlu.tdp.stickcmp_int[3:0];
   assign i4_0_hstick_match= `SPARC_CORE0.sparc0.tlu.tlu.tdp.tlu_set_hintp_g[3:0];
   assign i4_0_ld_int   = `SPARC_CORE0.sparc0.tlu.tlu.intdp.inc_ind_ld_int_i1;
`else
   assign i4_0_rstint_vld_w= i4_0_rstint_w &
                `SPARC_CORE0.sparc0.ifu.ifu_tlu_inst_vld_w &
                ~`SPARC_CORE0.sparc0.ifu.ifu_tlu_flush_w;
   assign i4_0_hwint_vld_w= i4_0_hwint_w &
			`SPARC_CORE0.sparc0.ifu.ifu_tlu_inst_vld_w &
			~`SPARC_CORE0.sparc0.ifu.ifu_tlu_flush_w &
			~`SPARC_CORE0.sparc0.tlu.lsu_tlu_defr_trp_taken_g &
			~(|(`SPARC_CORE0.sparc0.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_0_sftint_vld_w= i4_0_sftint_w &
			`SPARC_CORE0.sparc0.ifu.ifu_tlu_inst_vld_w &
			~`SPARC_CORE0.sparc0.ifu.ifu_tlu_flush_w &
			~`SPARC_CORE0.sparc0.tlu.lsu_tlu_defr_trp_taken_g &
			~(|(`SPARC_CORE0.sparc0.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_0_hint_vld_w=	i4_0_hint_w &
			`SPARC_CORE0.sparc0.ifu.ifu_tlu_inst_vld_w &
			~`SPARC_CORE0.sparc0.ifu.ifu_tlu_flush_w &
			~`SPARC_CORE0.sparc0.tlu.lsu_tlu_defr_trp_taken_g &
			~(|(`SPARC_CORE0.sparc0.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_0_tick_match= `SPARC_CORE0.sparc0.tlu.tdp.tickcmp_int[3:0];
   assign i4_0_stick_match= `SPARC_CORE0.sparc0.tlu.tdp.stickcmp_int[3:0];
   assign i4_0_hstick_match= `SPARC_CORE0.sparc0.tlu.tdp.tlu_set_hintp_g[3:0];
   assign i4_0_ld_int	= `SPARC_CORE0.sparc0.tlu.intdp.inc_ind_ld_int_i1;
`endif
   assign i4_0_cpx_tid	= `SPARC_CORE0.`LSU_PATH.qdp2.cpx_spc_data_cx[`CPX_TH_HI:`CPX_TH_LO];

`ifndef RTL_SPU
   assign i4_0_itlb_repl_vld = `SPARC_CORE0.sparc0.ifu.ifu.itlb.wr_vld &
                   ~`SPARC_CORE0.sparc0.ifu.ifu.itlb.rw_index_vld;
`else
   assign i4_0_itlb_repl_vld = `SPARC_CORE0.sparc0.ifu.itlb.wr_vld &
				   ~`SPARC_CORE0.sparc0.ifu.itlb.rw_index_vld;
`endif
   assign i4_0_dtlb_repl_vld = `SPARC_CORE0.`LSU_PATH.dtlb.wr_vld &
				   ~`SPARC_CORE0.`LSU_PATH.dtlb.rw_index_vld;
   // assign i4_0_tlb_repl_vec[63:0]  = i4_0_itlb_repl_vld ?
         // `SPARC_CORE0.sparc0.ifu.itlb.tlb_entry_replace[15:0] :
         // `SPARC_CORE0.`LSU_PATH.dtlb.tlb_entry_replace[15:0];
   // Tri: changed these to 16 entry TLB
   assign i4_0_tlb_repl_vec[63:16] = 48'b0;
`ifndef RTL_SPU
   assign i4_0_tlb_repl_vec[15:0]  = i4_0_itlb_repl_vld ?
         `SPARC_CORE0.sparc0.ifu.ifu.itlb.tlb_entry_replace[15:0] :
         `SPARC_CORE0.`LSU_PATH.dtlb.tlb_entry_replace[15:0];
`else
   assign i4_0_tlb_repl_vec[15:0]  = i4_0_itlb_repl_vld ?
         `SPARC_CORE0.sparc0.ifu.itlb.tlb_entry_replace[15:0] :
         `SPARC_CORE0.`LSU_PATH.dtlb.tlb_entry_replace[15:0];
`endif
   assign i4_0_tlb_repl_idx[5] = |(i4_0_tlb_repl_vec[63:32]);
   assign i4_0_tlb_repl_idx[4] =
	(|(i4_0_tlb_repl_vec[63:48])) | (|(i4_0_tlb_repl_vec[31:16]));
   assign i4_0_tlb_repl_idx[3] =
	(|(i4_0_tlb_repl_vec[63:56])) | (|(i4_0_tlb_repl_vec[47:40])) |
	(|(i4_0_tlb_repl_vec[31:24])) | (|(i4_0_tlb_repl_vec[15:8]));
   assign i4_0_tlb_repl_idx[2] =
	(|i4_0_tlb_repl_vec[63:60]) | (|i4_0_tlb_repl_vec[55:52]) |
	(|i4_0_tlb_repl_vec[47:44]) | (|i4_0_tlb_repl_vec[39:36]) |
	(|i4_0_tlb_repl_vec[31:28]) | (|i4_0_tlb_repl_vec[23:20]) |
	(|i4_0_tlb_repl_vec[15:12]) | (|i4_0_tlb_repl_vec[7:4]);
   assign i4_0_tlb_repl_idx[1] =
	(|i4_0_tlb_repl_vec[63:62]) | (|i4_0_tlb_repl_vec[59:58]) |
	(|i4_0_tlb_repl_vec[55:54]) | (|i4_0_tlb_repl_vec[51:50]) |
	(|i4_0_tlb_repl_vec[47:46]) | (|i4_0_tlb_repl_vec[43:42]) |
	(|i4_0_tlb_repl_vec[39:38]) | (|i4_0_tlb_repl_vec[35:34]) |
	(|i4_0_tlb_repl_vec[31:30]) | (|i4_0_tlb_repl_vec[27:26]) |
	(|i4_0_tlb_repl_vec[23:22]) | (|i4_0_tlb_repl_vec[19:18]) |
	(|i4_0_tlb_repl_vec[15:14]) | (|i4_0_tlb_repl_vec[11:10]) |
	(|i4_0_tlb_repl_vec[7:6]) |   (|i4_0_tlb_repl_vec[3:2]);
   assign i4_0_tlb_repl_idx[0] =
	i4_0_tlb_repl_vec[63] | i4_0_tlb_repl_vec[61] |
	i4_0_tlb_repl_vec[59] | i4_0_tlb_repl_vec[57] |
	i4_0_tlb_repl_vec[55] | i4_0_tlb_repl_vec[53] |
	i4_0_tlb_repl_vec[51] | i4_0_tlb_repl_vec[49] |
	i4_0_tlb_repl_vec[47] | i4_0_tlb_repl_vec[45] |
	i4_0_tlb_repl_vec[43] | i4_0_tlb_repl_vec[41] |
	i4_0_tlb_repl_vec[39] | i4_0_tlb_repl_vec[37] |
	i4_0_tlb_repl_vec[35] | i4_0_tlb_repl_vec[33] |
	i4_0_tlb_repl_vec[31] | i4_0_tlb_repl_vec[29] |
	i4_0_tlb_repl_vec[27] | i4_0_tlb_repl_vec[25] |
	i4_0_tlb_repl_vec[23] | i4_0_tlb_repl_vec[21] |
	i4_0_tlb_repl_vec[19] | i4_0_tlb_repl_vec[17] |
	i4_0_tlb_repl_vec[15] | i4_0_tlb_repl_vec[13] |
	i4_0_tlb_repl_vec[11] | i4_0_tlb_repl_vec[9] |
	i4_0_tlb_repl_vec[7] | i4_0_tlb_repl_vec[5] |
	i4_0_tlb_repl_vec[3] | i4_0_tlb_repl_vec[1];

`endif // ifdef RTL_SPARC0

`ifdef RTL_SPARC1
`ifndef RTL_SPU
   assign i4_1_trap     = `SPARC_CORE1.sparc0.tlu.tlu.tcl.thrd0_traps |
              `SPARC_CORE1.sparc0.tlu.tlu.tcl.thrd1_traps |
              `SPARC_CORE1.sparc0.tlu.tlu.tcl.thrd2_traps |
              `SPARC_CORE1.sparc0.tlu.tlu.tcl.thrd3_traps;
   assign i4_1_immu_miss= i4_1_trap &
            ((`SPARC_CORE1.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h64) |
         (`SPARC_CORE1.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h3e));
   assign i4_1_dmmu_miss= i4_1_trap &
        ((`SPARC_CORE1.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h68) |
         (`SPARC_CORE1.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h3f));
`else
   assign i4_1_trap     = `SPARC_CORE1.sparc0.tlu.tcl.thrd0_traps |
			  `SPARC_CORE1.sparc0.tlu.tcl.thrd1_traps |
			  `SPARC_CORE1.sparc0.tlu.tcl.thrd2_traps |
			  `SPARC_CORE1.sparc0.tlu.tcl.thrd3_traps;
   assign i4_1_immu_miss= i4_1_trap &
	        ((`SPARC_CORE1.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h64) |
		 (`SPARC_CORE1.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h3e));
   assign i4_1_dmmu_miss= i4_1_trap &
		((`SPARC_CORE1.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h68) |
		 (`SPARC_CORE1.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h3f));
`endif
   assign i4_1_spu_trap_ack_w= `SPARC_CORE1.sparc0.ifu_spu_trap_ack;
   assign i4_1_spu_illgl_va= `SPARC_CORE1.sparc0.spu_lsu_ldxa_data_vld_w2 &
				`SPARC_CORE1.sparc0.spu_lsu_ldxa_illgl_va_w2;
`ifndef RTL_SPU
   assign i4_1_rstint_vld_w= i4_1_rstint_w &
                `SPARC_CORE1.sparc0.ifu.ifu.ifu_tlu_inst_vld_w &
                ~`SPARC_CORE1.sparc0.ifu.ifu.ifu_tlu_flush_w;
   assign i4_1_hwint_vld_w= i4_1_hwint_w &
            `SPARC_CORE1.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE1.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE1.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE1.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_1_sftint_vld_w= i4_1_sftint_w &
            `SPARC_CORE1.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE1.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE1.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE1.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_1_hint_vld_w=  i4_1_hint_w &
            `SPARC_CORE1.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE1.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE1.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE1.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_1_tick_match= `SPARC_CORE1.sparc0.tlu.tlu.tdp.tickcmp_int[3:0];
   assign i4_1_stick_match= `SPARC_CORE1.sparc0.tlu.tlu.tdp.stickcmp_int[3:0];
   assign i4_1_hstick_match= `SPARC_CORE1.sparc0.tlu.tlu.tdp.tlu_set_hintp_g[3:0];
   assign i4_1_ld_int   = `SPARC_CORE1.sparc0.tlu.tlu.intdp.inc_ind_ld_int_i1;
`else
   assign i4_1_rstint_vld_w= i4_1_rstint_w &
                `SPARC_CORE1.sparc0.ifu.ifu_tlu_inst_vld_w &
                ~`SPARC_CORE1.sparc0.ifu.ifu_tlu_flush_w;
   assign i4_1_hwint_vld_w= i4_1_hwint_w &
			`SPARC_CORE1.sparc0.ifu.ifu_tlu_inst_vld_w &
			~`SPARC_CORE1.sparc0.ifu.ifu_tlu_flush_w &
			~`SPARC_CORE1.sparc0.tlu.lsu_tlu_defr_trp_taken_g &
			~(|(`SPARC_CORE1.sparc0.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_1_sftint_vld_w= i4_1_sftint_w &
			`SPARC_CORE1.sparc0.ifu.ifu_tlu_inst_vld_w &
			~`SPARC_CORE1.sparc0.ifu.ifu_tlu_flush_w &
			~`SPARC_CORE1.sparc0.tlu.lsu_tlu_defr_trp_taken_g &
			~(|(`SPARC_CORE1.sparc0.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_1_hint_vld_w=	i4_1_hint_w &
			`SPARC_CORE1.sparc0.ifu.ifu_tlu_inst_vld_w &
			~`SPARC_CORE1.sparc0.ifu.ifu_tlu_flush_w &
			~`SPARC_CORE1.sparc0.tlu.lsu_tlu_defr_trp_taken_g &
			~(|(`SPARC_CORE1.sparc0.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_1_tick_match= `SPARC_CORE1.sparc0.tlu.tdp.tickcmp_int[3:0];
   assign i4_1_stick_match= `SPARC_CORE1.sparc0.tlu.tdp.stickcmp_int[3:0];
   assign i4_1_hstick_match= `SPARC_CORE1.sparc0.tlu.tdp.tlu_set_hintp_g[3:0];
   assign i4_1_ld_int	= `SPARC_CORE1.sparc0.tlu.intdp.inc_ind_ld_int_i1;
`endif
   assign i4_1_cpx_tid	= `SPARC_CORE1.`LSU_PATH.qdp2.cpx_spc_data_cx[`CPX_TH_HI:`CPX_TH_LO];

`ifndef RTL_SPU
   assign i4_1_itlb_repl_vld = `SPARC_CORE1.sparc0.ifu.ifu.itlb.wr_vld &
                   ~`SPARC_CORE1.sparc0.ifu.ifu.itlb.rw_index_vld; 
`else
   assign i4_1_itlb_repl_vld = `SPARC_CORE1.sparc0.ifu.itlb.wr_vld &
				   ~`SPARC_CORE1.sparc0.ifu.itlb.rw_index_vld;
`endif                   
   assign i4_1_dtlb_repl_vld = `SPARC_CORE1.`LSU_PATH.dtlb.wr_vld &
				   ~`SPARC_CORE1.`LSU_PATH.dtlb.rw_index_vld;
`ifndef RTL_SPU
   assign i4_1_tlb_repl_vec[63:0]  = i4_1_itlb_repl_vld ?
            `SPARC_CORE1.sparc0.ifu.ifu.itlb.tlb_entry_replace[15:0] :
            `SPARC_CORE1.`LSU_PATH.dtlb.tlb_entry_replace[15:0];
`else
   assign i4_1_tlb_repl_vec[63:0]  = i4_1_itlb_repl_vld ?
			`SPARC_CORE1.sparc0.ifu.itlb.tlb_entry_replace[15:0] :
			`SPARC_CORE1.`LSU_PATH.dtlb.tlb_entry_replace[15:0];
`endif
   assign i4_1_tlb_repl_idx[5] = |(i4_1_tlb_repl_vec[63:32]);
   assign i4_1_tlb_repl_idx[4] =
	|(i4_1_tlb_repl_vec[63:48]) | |(i4_1_tlb_repl_vec[31:16]);
   assign i4_1_tlb_repl_idx[3] =
	|(i4_1_tlb_repl_vec[63:56]) | |(i4_1_tlb_repl_vec[47:40]) |
	|(i4_1_tlb_repl_vec[31:24]) | |(i4_1_tlb_repl_vec[15:8]);
   assign i4_1_tlb_repl_idx[2] =
	|(i4_1_tlb_repl_vec[63:60]) | |(i4_1_tlb_repl_vec[55:52]) |
	|(i4_1_tlb_repl_vec[47:44]) | |(i4_1_tlb_repl_vec[39:36]) |
	|(i4_1_tlb_repl_vec[31:28]) | |(i4_1_tlb_repl_vec[23:20]) |
	|(i4_1_tlb_repl_vec[15:12]) | |(i4_1_tlb_repl_vec[7:4]);
   assign i4_1_tlb_repl_idx[1] =
	|(i4_1_tlb_repl_vec[63:62]) | |(i4_1_tlb_repl_vec[59:58]) |
	|(i4_1_tlb_repl_vec[55:54]) | |(i4_1_tlb_repl_vec[51:50]) |
	|(i4_1_tlb_repl_vec[47:46]) | |(i4_1_tlb_repl_vec[43:42]) |
	|(i4_1_tlb_repl_vec[39:38]) | |(i4_1_tlb_repl_vec[35:34]) |
	|(i4_1_tlb_repl_vec[31:30]) | |(i4_1_tlb_repl_vec[27:26]) |
	|(i4_1_tlb_repl_vec[23:22]) | |(i4_1_tlb_repl_vec[19:18]) |
	|(i4_1_tlb_repl_vec[15:14]) | |(i4_1_tlb_repl_vec[11:10]) |
	|(i4_1_tlb_repl_vec[7:6]) | |(i4_1_tlb_repl_vec[3:2]);
   assign i4_1_tlb_repl_idx[0] =
	i4_1_tlb_repl_vec[63] | i4_1_tlb_repl_vec[61] |
	i4_1_tlb_repl_vec[59] | i4_1_tlb_repl_vec[57] |
	i4_1_tlb_repl_vec[55] | i4_1_tlb_repl_vec[53] |
	i4_1_tlb_repl_vec[51] | i4_1_tlb_repl_vec[49] |
	i4_1_tlb_repl_vec[47] | i4_1_tlb_repl_vec[45] |
	i4_1_tlb_repl_vec[43] | i4_1_tlb_repl_vec[41] |
	i4_1_tlb_repl_vec[39] | i4_1_tlb_repl_vec[37] |
	i4_1_tlb_repl_vec[35] | i4_1_tlb_repl_vec[33] |
	i4_1_tlb_repl_vec[31] | i4_1_tlb_repl_vec[29] |
	i4_1_tlb_repl_vec[27] | i4_1_tlb_repl_vec[25] |
	i4_1_tlb_repl_vec[23] | i4_1_tlb_repl_vec[21] |
	i4_1_tlb_repl_vec[19] | i4_1_tlb_repl_vec[17] |
	i4_1_tlb_repl_vec[15] | i4_1_tlb_repl_vec[13] |
	i4_1_tlb_repl_vec[11] | i4_1_tlb_repl_vec[9] |
	i4_1_tlb_repl_vec[7] | i4_1_tlb_repl_vec[5] |
	i4_1_tlb_repl_vec[3] | i4_1_tlb_repl_vec[1];

`endif // ifdef RTL_SPARC1

`ifdef RTL_SPARC2
`ifndef RTL_SPU
   assign i4_2_trap     = `SPARC_CORE2.sparc0.tlu.tlu.tcl.thrd0_traps |
              `SPARC_CORE2.sparc0.tlu.tlu.tcl.thrd1_traps |
              `SPARC_CORE2.sparc0.tlu.tlu.tcl.thrd2_traps |
              `SPARC_CORE2.sparc0.tlu.tlu.tcl.thrd3_traps;
   assign i4_2_immu_miss= i4_2_trap &
            ((`SPARC_CORE2.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h64) |
         (`SPARC_CORE2.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h3e));
   assign i4_2_dmmu_miss= i4_2_trap &
        ((`SPARC_CORE2.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h68) |
         (`SPARC_CORE2.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h3f));
`else
   assign i4_2_trap     = `SPARC_CORE2.sparc0.tlu.tcl.thrd0_traps |
			  `SPARC_CORE2.sparc0.tlu.tcl.thrd1_traps |
			  `SPARC_CORE2.sparc0.tlu.tcl.thrd2_traps |
			  `SPARC_CORE2.sparc0.tlu.tcl.thrd3_traps;
   assign i4_2_immu_miss= i4_2_trap &
	        ((`SPARC_CORE2.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h64) |
		 (`SPARC_CORE2.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h3e));
   assign i4_2_dmmu_miss= i4_2_trap &
		((`SPARC_CORE2.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h68) |
		 (`SPARC_CORE2.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h3f));
`endif
   assign i4_2_spu_trap_ack_w= `SPARC_CORE2.sparc0.ifu_spu_trap_ack;
   assign i4_2_spu_illgl_va= `SPARC_CORE2.sparc0.spu_lsu_ldxa_data_vld_w2 &
				`SPARC_CORE2.sparc0.spu_lsu_ldxa_illgl_va_w2;
`ifndef RTL_SPU
   assign i4_2_rstint_vld_w= i4_2_rstint_w &
                `SPARC_CORE2.sparc0.ifu.ifu.ifu_tlu_inst_vld_w &
                ~`SPARC_CORE2.sparc0.ifu.ifu.ifu_tlu_flush_w;
   assign i4_2_hwint_vld_w= i4_2_hwint_w &
            `SPARC_CORE2.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE2.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE2.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE2.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_2_sftint_vld_w= i4_2_sftint_w &
            `SPARC_CORE2.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE2.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE2.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE2.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_2_hint_vld_w=  i4_2_hint_w &
            `SPARC_CORE2.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE2.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE2.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE2.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_2_tick_match= `SPARC_CORE2.sparc0.tlu.tlu.tdp.tickcmp_int[3:0];
   assign i4_2_stick_match= `SPARC_CORE2.sparc0.tlu.tlu.tdp.stickcmp_int[3:0];
   assign i4_2_hstick_match= `SPARC_CORE2.sparc0.tlu.tlu.tdp.tlu_set_hintp_g[3:0];
   assign i4_2_ld_int   = `SPARC_CORE2.sparc0.tlu.tlu.intdp.inc_ind_ld_int_i1;
`else
   assign i4_2_rstint_vld_w= i4_2_rstint_w &
                `SPARC_CORE2.sparc0.ifu.ifu_tlu_inst_vld_w &
                ~`SPARC_CORE2.sparc0.ifu.ifu_tlu_flush_w;
   assign i4_2_hwint_vld_w= i4_2_hwint_w &
			`SPARC_CORE2.sparc0.ifu.ifu_tlu_inst_vld_w &
			~`SPARC_CORE2.sparc0.ifu.ifu_tlu_flush_w &
			~`SPARC_CORE2.sparc0.tlu.lsu_tlu_defr_trp_taken_g &
			~(|(`SPARC_CORE2.sparc0.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_2_sftint_vld_w= i4_2_sftint_w &
			`SPARC_CORE2.sparc0.ifu.ifu_tlu_inst_vld_w &
			~`SPARC_CORE2.sparc0.ifu.ifu_tlu_flush_w &
			~`SPARC_CORE2.sparc0.tlu.lsu_tlu_defr_trp_taken_g &
			~(|(`SPARC_CORE2.sparc0.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_2_hint_vld_w=	i4_2_hint_w &
			`SPARC_CORE2.sparc0.ifu.ifu_tlu_inst_vld_w &
			~`SPARC_CORE2.sparc0.ifu.ifu_tlu_flush_w &
			~`SPARC_CORE2.sparc0.tlu.lsu_tlu_defr_trp_taken_g &
			~(|(`SPARC_CORE2.sparc0.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_2_tick_match= `SPARC_CORE2.sparc0.tlu.tdp.tickcmp_int[3:0];
   assign i4_2_stick_match= `SPARC_CORE2.sparc0.tlu.tdp.stickcmp_int[3:0];
   assign i4_2_hstick_match= `SPARC_CORE2.sparc0.tlu.tdp.tlu_set_hintp_g[3:0];
   assign i4_2_ld_int	= `SPARC_CORE2.sparc0.tlu.intdp.inc_ind_ld_int_i1;
`endif
   assign i4_2_cpx_tid	= `SPARC_CORE2.`LSU_PATH.qdp2.cpx_spc_data_cx[`CPX_TH_HI:`CPX_TH_LO];

`ifndef RTL_SPU
   assign i4_2_itlb_repl_vld = `SPARC_CORE2.sparc0.ifu.ifu.itlb.wr_vld &
                   ~`SPARC_CORE2.sparc0.ifu.ifu.itlb.rw_index_vld;
   assign i4_2_dtlb_repl_vld = `SPARC_CORE2.`LSU_PATH.dtlb.wr_vld &
                   ~`SPARC_CORE2.`LSU_PATH.dtlb.rw_index_vld;
   assign i4_2_tlb_repl_vec[63:0]  = i4_2_itlb_repl_vld ?
            `SPARC_CORE2.sparc0.ifu.ifu.itlb.tlb_entry_replace[15:0] :
            `SPARC_CORE2.`LSU_PATH.dtlb.tlb_entry_replace[15:0];
`else
   assign i4_2_itlb_repl_vld = `SPARC_CORE2.sparc0.ifu.itlb.wr_vld &
				   ~`SPARC_CORE2.sparc0.ifu.itlb.rw_index_vld;
   assign i4_2_dtlb_repl_vld = `SPARC_CORE2.`LSU_PATH.dtlb.wr_vld &
				   ~`SPARC_CORE2.`LSU_PATH.dtlb.rw_index_vld;
   assign i4_2_tlb_repl_vec[63:0]  = i4_2_itlb_repl_vld ?
			`SPARC_CORE2.sparc0.ifu.itlb.tlb_entry_replace[15:0] :
			`SPARC_CORE2.`LSU_PATH.dtlb.tlb_entry_replace[15:0];
`endif
   assign i4_2_tlb_repl_idx[5] = |(i4_2_tlb_repl_vec[63:32]);
   assign i4_2_tlb_repl_idx[4] =
	|(i4_2_tlb_repl_vec[63:48]) | |(i4_2_tlb_repl_vec[31:16]);
   assign i4_2_tlb_repl_idx[3] =
	|(i4_2_tlb_repl_vec[63:56]) | |(i4_2_tlb_repl_vec[47:40]) |
	|(i4_2_tlb_repl_vec[31:24]) | |(i4_2_tlb_repl_vec[15:8]);
   assign i4_2_tlb_repl_idx[2] =
	|(i4_2_tlb_repl_vec[63:60]) | |(i4_2_tlb_repl_vec[55:52]) |
	|(i4_2_tlb_repl_vec[47:44]) | |(i4_2_tlb_repl_vec[39:36]) |
	|(i4_2_tlb_repl_vec[31:28]) | |(i4_2_tlb_repl_vec[23:20]) |
	|(i4_2_tlb_repl_vec[15:12]) | |(i4_2_tlb_repl_vec[7:4]);
   assign i4_2_tlb_repl_idx[1] =
	|(i4_2_tlb_repl_vec[63:62]) | |(i4_2_tlb_repl_vec[59:58]) |
	|(i4_2_tlb_repl_vec[55:54]) | |(i4_2_tlb_repl_vec[51:50]) |
	|(i4_2_tlb_repl_vec[47:46]) | |(i4_2_tlb_repl_vec[43:42]) |
	|(i4_2_tlb_repl_vec[39:38]) | |(i4_2_tlb_repl_vec[35:34]) |
	|(i4_2_tlb_repl_vec[31:30]) | |(i4_2_tlb_repl_vec[27:26]) |
	|(i4_2_tlb_repl_vec[23:22]) | |(i4_2_tlb_repl_vec[19:18]) |
	|(i4_2_tlb_repl_vec[15:14]) | |(i4_2_tlb_repl_vec[11:10]) |
	|(i4_2_tlb_repl_vec[7:6]) | |(i4_2_tlb_repl_vec[3:2]);
   assign i4_2_tlb_repl_idx[0] =
	i4_2_tlb_repl_vec[63] | i4_2_tlb_repl_vec[61] |
	i4_2_tlb_repl_vec[59] | i4_2_tlb_repl_vec[57] |
	i4_2_tlb_repl_vec[55] | i4_2_tlb_repl_vec[53] |
	i4_2_tlb_repl_vec[51] | i4_2_tlb_repl_vec[49] |
	i4_2_tlb_repl_vec[47] | i4_2_tlb_repl_vec[45] |
	i4_2_tlb_repl_vec[43] | i4_2_tlb_repl_vec[41] |
	i4_2_tlb_repl_vec[39] | i4_2_tlb_repl_vec[37] |
	i4_2_tlb_repl_vec[35] | i4_2_tlb_repl_vec[33] |
	i4_2_tlb_repl_vec[31] | i4_2_tlb_repl_vec[29] |
	i4_2_tlb_repl_vec[27] | i4_2_tlb_repl_vec[25] |
	i4_2_tlb_repl_vec[23] | i4_2_tlb_repl_vec[21] |
	i4_2_tlb_repl_vec[19] | i4_2_tlb_repl_vec[17] |
	i4_2_tlb_repl_vec[15] | i4_2_tlb_repl_vec[13] |
	i4_2_tlb_repl_vec[11] | i4_2_tlb_repl_vec[9] |
	i4_2_tlb_repl_vec[7] | i4_2_tlb_repl_vec[5] |
	i4_2_tlb_repl_vec[3] | i4_2_tlb_repl_vec[1];

`endif // ifdef RTL_SPARC2

`ifdef RTL_SPARC3
`ifndef RTL_SPU
   assign i4_3_trap     = `SPARC_CORE3.sparc0.tlu.tlu.tcl.thrd0_traps |
              `SPARC_CORE3.sparc0.tlu.tlu.tcl.thrd1_traps |
              `SPARC_CORE3.sparc0.tlu.tlu.tcl.thrd2_traps |
              `SPARC_CORE3.sparc0.tlu.tlu.tcl.thrd3_traps;
   assign i4_3_immu_miss= i4_3_trap &
            ((`SPARC_CORE3.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h64) |
         (`SPARC_CORE3.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h3e));
   assign i4_3_dmmu_miss= i4_3_trap &
        ((`SPARC_CORE3.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h68) |
         (`SPARC_CORE3.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h3f));
`else
   assign i4_3_trap     = `SPARC_CORE3.sparc0.tlu.tcl.thrd0_traps |
			  `SPARC_CORE3.sparc0.tlu.tcl.thrd1_traps |
			  `SPARC_CORE3.sparc0.tlu.tcl.thrd2_traps |
			  `SPARC_CORE3.sparc0.tlu.tcl.thrd3_traps;
   assign i4_3_immu_miss= i4_3_trap &
	        ((`SPARC_CORE3.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h64) |
		 (`SPARC_CORE3.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h3e));
   assign i4_3_dmmu_miss= i4_3_trap &
		((`SPARC_CORE3.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h68) |
		 (`SPARC_CORE3.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h3f));
`endif
   assign i4_3_spu_trap_ack_w= `SPARC_CORE3.sparc0.ifu_spu_trap_ack;
   assign i4_3_spu_illgl_va= `SPARC_CORE3.sparc0.spu_lsu_ldxa_data_vld_w2 &
				`SPARC_CORE3.sparc0.spu_lsu_ldxa_illgl_va_w2;
`ifndef RTL_SPU
   assign i4_3_rstint_vld_w= i4_3_rstint_w &
                `SPARC_CORE3.sparc0.ifu.ifu.ifu_tlu_inst_vld_w &
                ~`SPARC_CORE3.sparc0.ifu.ifu.ifu_tlu_flush_w;
   assign i4_3_hwint_vld_w= i4_3_hwint_w &
            `SPARC_CORE3.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE3.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE3.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE3.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_3_sftint_vld_w= i4_3_sftint_w &
            `SPARC_CORE3.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE3.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE3.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE3.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_3_hint_vld_w=  i4_3_hint_w &
            `SPARC_CORE3.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE3.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE3.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE3.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_3_tick_match= `SPARC_CORE3.sparc0.tlu.tlu.tdp.tickcmp_int[3:0];
   assign i4_3_stick_match= `SPARC_CORE3.sparc0.tlu.tlu.tdp.stickcmp_int[3:0];
   assign i4_3_hstick_match= `SPARC_CORE3.sparc0.tlu.tlu.tdp.tlu_set_hintp_g[3:0];
   assign i4_3_ld_int   = `SPARC_CORE3.sparc0.tlu.tlu.intdp.inc_ind_ld_int_i1;
`else
   assign i4_3_rstint_vld_w= i4_3_rstint_w &
                `SPARC_CORE3.sparc0.ifu.ifu_tlu_inst_vld_w &
                ~`SPARC_CORE3.sparc0.ifu.ifu_tlu_flush_w;
   assign i4_3_hwint_vld_w= i4_3_hwint_w &
			`SPARC_CORE3.sparc0.ifu.ifu_tlu_inst_vld_w &
			~`SPARC_CORE3.sparc0.ifu.ifu_tlu_flush_w &
			~`SPARC_CORE3.sparc0.tlu.lsu_tlu_defr_trp_taken_g &
			~(|(`SPARC_CORE3.sparc0.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_3_sftint_vld_w= i4_3_sftint_w &
			`SPARC_CORE3.sparc0.ifu.ifu_tlu_inst_vld_w &
			~`SPARC_CORE3.sparc0.ifu.ifu_tlu_flush_w &
			~`SPARC_CORE3.sparc0.tlu.lsu_tlu_defr_trp_taken_g &
			~(|(`SPARC_CORE3.sparc0.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_3_hint_vld_w=	i4_3_hint_w &
			`SPARC_CORE3.sparc0.ifu.ifu_tlu_inst_vld_w &
			~`SPARC_CORE3.sparc0.ifu.ifu_tlu_flush_w &
			~`SPARC_CORE3.sparc0.tlu.lsu_tlu_defr_trp_taken_g &
			~(|(`SPARC_CORE3.sparc0.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_3_tick_match= `SPARC_CORE3.sparc0.tlu.tdp.tickcmp_int[3:0];
   assign i4_3_stick_match= `SPARC_CORE3.sparc0.tlu.tdp.stickcmp_int[3:0];
   assign i4_3_hstick_match= `SPARC_CORE3.sparc0.tlu.tdp.tlu_set_hintp_g[3:0];
   assign i4_3_ld_int	= `SPARC_CORE3.sparc0.tlu.intdp.inc_ind_ld_int_i1;
`endif
   assign i4_3_cpx_tid	= `SPARC_CORE3.`LSU_PATH.qdp2.cpx_spc_data_cx[`CPX_TH_HI:`CPX_TH_LO];

`ifndef RTL_SPU
   assign i4_3_itlb_repl_vld = `SPARC_CORE3.sparc0.ifu.ifu.itlb.wr_vld &
                   ~`SPARC_CORE3.sparc0.ifu.ifu.itlb.rw_index_vld;
   assign i4_3_dtlb_repl_vld = `SPARC_CORE3.`LSU_PATH.dtlb.wr_vld &
                   ~`SPARC_CORE3.`LSU_PATH.dtlb.rw_index_vld;
   assign i4_3_tlb_repl_vec[63:0]  = i4_3_itlb_repl_vld ?
            `SPARC_CORE3.sparc0.ifu.ifu.itlb.tlb_entry_replace[15:0] :
            `SPARC_CORE3.`LSU_PATH.dtlb.tlb_entry_replace[15:0];
`else
   assign i4_3_itlb_repl_vld = `SPARC_CORE3.sparc0.ifu.itlb.wr_vld &
				   ~`SPARC_CORE3.sparc0.ifu.itlb.rw_index_vld;
   assign i4_3_dtlb_repl_vld = `SPARC_CORE3.`LSU_PATH.dtlb.wr_vld &
				   ~`SPARC_CORE3.`LSU_PATH.dtlb.rw_index_vld;
   assign i4_3_tlb_repl_vec[63:0]  = i4_3_itlb_repl_vld ?
			`SPARC_CORE3.sparc0.ifu.itlb.tlb_entry_replace[15:0] :
			`SPARC_CORE3.`LSU_PATH.dtlb.tlb_entry_replace[15:0];
`endif            
   assign i4_3_tlb_repl_idx[5] = |(i4_3_tlb_repl_vec[63:32]);
   assign i4_3_tlb_repl_idx[4] =
	|(i4_3_tlb_repl_vec[63:48]) | |(i4_3_tlb_repl_vec[31:16]);
   assign i4_3_tlb_repl_idx[3] =
	|(i4_3_tlb_repl_vec[63:56]) | |(i4_3_tlb_repl_vec[47:40]) |
	|(i4_3_tlb_repl_vec[31:24]) | |(i4_3_tlb_repl_vec[15:8]);
   assign i4_3_tlb_repl_idx[2] =
	|(i4_3_tlb_repl_vec[63:60]) | |(i4_3_tlb_repl_vec[55:52]) |
	|(i4_3_tlb_repl_vec[47:44]) | |(i4_3_tlb_repl_vec[39:36]) |
	|(i4_3_tlb_repl_vec[31:28]) | |(i4_3_tlb_repl_vec[23:20]) |
	|(i4_3_tlb_repl_vec[15:12]) | |(i4_3_tlb_repl_vec[7:4]);
   assign i4_3_tlb_repl_idx[1] =
	|(i4_3_tlb_repl_vec[63:62]) | |(i4_3_tlb_repl_vec[59:58]) |
	|(i4_3_tlb_repl_vec[55:54]) | |(i4_3_tlb_repl_vec[51:50]) |
	|(i4_3_tlb_repl_vec[47:46]) | |(i4_3_tlb_repl_vec[43:42]) |
	|(i4_3_tlb_repl_vec[39:38]) | |(i4_3_tlb_repl_vec[35:34]) |
	|(i4_3_tlb_repl_vec[31:30]) | |(i4_3_tlb_repl_vec[27:26]) |
	|(i4_3_tlb_repl_vec[23:22]) | |(i4_3_tlb_repl_vec[19:18]) |
	|(i4_3_tlb_repl_vec[15:14]) | |(i4_3_tlb_repl_vec[11:10]) |
	|(i4_3_tlb_repl_vec[7:6]) | |(i4_3_tlb_repl_vec[3:2]);
   assign i4_3_tlb_repl_idx[0] =
	i4_3_tlb_repl_vec[63] | i4_3_tlb_repl_vec[61] |
	i4_3_tlb_repl_vec[59] | i4_3_tlb_repl_vec[57] |
	i4_3_tlb_repl_vec[55] | i4_3_tlb_repl_vec[53] |
	i4_3_tlb_repl_vec[51] | i4_3_tlb_repl_vec[49] |
	i4_3_tlb_repl_vec[47] | i4_3_tlb_repl_vec[45] |
	i4_3_tlb_repl_vec[43] | i4_3_tlb_repl_vec[41] |
	i4_3_tlb_repl_vec[39] | i4_3_tlb_repl_vec[37] |
	i4_3_tlb_repl_vec[35] | i4_3_tlb_repl_vec[33] |
	i4_3_tlb_repl_vec[31] | i4_3_tlb_repl_vec[29] |
	i4_3_tlb_repl_vec[27] | i4_3_tlb_repl_vec[25] |
	i4_3_tlb_repl_vec[23] | i4_3_tlb_repl_vec[21] |
	i4_3_tlb_repl_vec[19] | i4_3_tlb_repl_vec[17] |
	i4_3_tlb_repl_vec[15] | i4_3_tlb_repl_vec[13] |
	i4_3_tlb_repl_vec[11] | i4_3_tlb_repl_vec[9] |
	i4_3_tlb_repl_vec[7] | i4_3_tlb_repl_vec[5] |
	i4_3_tlb_repl_vec[3] | i4_3_tlb_repl_vec[1];

`endif // ifdef RTL_SPARC3

`ifdef RTL_SPARC4
`ifndef RTL_SPU
   assign i4_4_trap     = `SPARC_CORE4.sparc0.tlu.tlu.tcl.thrd0_traps |
              `SPARC_CORE4.sparc0.tlu.tlu.tcl.thrd1_traps |
              `SPARC_CORE4.sparc0.tlu.tlu.tcl.thrd2_traps |
              `SPARC_CORE4.sparc0.tlu.tlu.tcl.thrd3_traps;
   assign i4_4_immu_miss= i4_4_trap &
            ((`SPARC_CORE4.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h64) |
         (`SPARC_CORE4.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h3e));
   assign i4_4_dmmu_miss= i4_4_trap &
        ((`SPARC_CORE4.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h68) |
         (`SPARC_CORE4.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h3f));
`else
   assign i4_4_trap     = `SPARC_CORE4.sparc0.tlu.tcl.thrd0_traps |
			  `SPARC_CORE4.sparc0.tlu.tcl.thrd1_traps |
			  `SPARC_CORE4.sparc0.tlu.tcl.thrd2_traps |
			  `SPARC_CORE4.sparc0.tlu.tcl.thrd3_traps;
   assign i4_4_immu_miss= i4_4_trap &
	        ((`SPARC_CORE4.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h64) |
		 (`SPARC_CORE4.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h3e));
   assign i4_4_dmmu_miss= i4_4_trap &
		((`SPARC_CORE4.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h68) |
		 (`SPARC_CORE4.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h3f));
`endif
   assign i4_4_spu_trap_ack_w= `SPARC_CORE4.sparc0.ifu_spu_trap_ack;
   assign i4_4_spu_illgl_va= `SPARC_CORE4.sparc0.spu_lsu_ldxa_data_vld_w2 &
				`SPARC_CORE4.sparc0.spu_lsu_ldxa_illgl_va_w2;
`ifndef RTL_SPU
   assign i4_4_rstint_vld_w= i4_4_rstint_w &
                `SPARC_CORE4.sparc0.ifu.ifu.ifu_tlu_inst_vld_w &
                ~`SPARC_CORE4.sparc0.ifu.ifu.ifu_tlu_flush_w;
   assign i4_4_hwint_vld_w= i4_4_hwint_w &
            `SPARC_CORE4.sparc0.ifu.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE4.sparc0.ifu.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE4.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE4.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_4_sftint_vld_w= i4_4_sftint_w &
            `SPARC_CORE4.sparc0.ifu.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE4.sparc0.ifu.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE4.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE4.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_4_hint_vld_w=  i4_4_hint_w &
            `SPARC_CORE4.sparc0.ifu.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE4.sparc0.ifu.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE4.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE4.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_4_tick_match= `SPARC_CORE4.sparc0.tlu.tlu.tdp.tickcmp_int[3:0];
   assign i4_4_stick_match= `SPARC_CORE4.sparc0.tlu.tlu.tdp.stickcmp_int[3:0];
   assign i4_4_hstick_match= `SPARC_CORE4.sparc0.tlu.tlu.tdp.tlu_set_hintp_g[3:0];
   assign i4_4_ld_int   = `SPARC_CORE4.sparc0.tlu.tlu.intdp.inc_ind_ld_int_i1;
`else
   assign i4_4_rstint_vld_w= i4_4_rstint_w &
                `SPARC_CORE4.sparc0.ifu.ifu_tlu_inst_vld_w &
                ~`SPARC_CORE4.sparc0.ifu.ifu_tlu_flush_w;
   assign i4_4_hwint_vld_w= i4_4_hwint_w &
            `SPARC_CORE4.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE4.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE4.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE4.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_4_sftint_vld_w= i4_4_sftint_w &
            `SPARC_CORE4.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE4.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE4.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE4.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_4_hint_vld_w=  i4_4_hint_w &
            `SPARC_CORE4.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE4.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE4.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE4.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_4_tick_match= `SPARC_CORE4.sparc0.tlu.tdp.tickcmp_int[3:0];
   assign i4_4_stick_match= `SPARC_CORE4.sparc0.tlu.tdp.stickcmp_int[3:0];
   assign i4_4_hstick_match= `SPARC_CORE4.sparc0.tlu.tdp.tlu_set_hintp_g[3:0];
   assign i4_4_ld_int	= `SPARC_CORE4.sparc0.tlu.intdp.inc_ind_ld_int_i1;
`endif
   assign i4_4_cpx_tid	= `SPARC_CORE4.`LSU_PATH.qdp2.cpx_spc_data_cx[`CPX_TH_HI:`CPX_TH_LO];

`ifndef RTL_SPU
   assign i4_4_itlb_repl_vld = `SPARC_CORE4.sparc0.ifu.ifu.itlb.wr_vld &
                   ~`SPARC_CORE4.sparc0.ifu.ifu.itlb.rw_index_vld;
   assign i4_4_dtlb_repl_vld = `SPARC_CORE4.`LSU_PATH.dtlb.wr_vld &
                   ~`SPARC_CORE4.`LSU_PATH.dtlb.rw_index_vld;
   assign i4_4_tlb_repl_vec[63:0]  = i4_4_itlb_repl_vld ?
            `SPARC_CORE4.sparc0.ifu.ifu.itlb.tlb_entry_replace[15:0] :
            `SPARC_CORE4.`LSU_PATH.dtlb.tlb_entry_replace[15:0];
`else
   assign i4_4_itlb_repl_vld = `SPARC_CORE4.sparc0.ifu.itlb.wr_vld &
				   ~`SPARC_CORE4.sparc0.ifu.itlb.rw_index_vld;
   assign i4_4_dtlb_repl_vld = `SPARC_CORE4.`LSU_PATH.dtlb.wr_vld &
				   ~`SPARC_CORE4.`LSU_PATH.dtlb.rw_index_vld;
   assign i4_4_tlb_repl_vec[63:0]  = i4_4_itlb_repl_vld ?
			`SPARC_CORE4.sparc0.ifu.itlb.tlb_entry_replace[15:0] :
			`SPARC_CORE4.`LSU_PATH.dtlb.tlb_entry_replace[15:0];
`endif
   assign i4_4_tlb_repl_idx[5] = |(i4_4_tlb_repl_vec[63:32]);
   assign i4_4_tlb_repl_idx[4] =
	|(i4_4_tlb_repl_vec[63:48]) | |(i4_4_tlb_repl_vec[31:16]);
   assign i4_4_tlb_repl_idx[3] =
	|(i4_4_tlb_repl_vec[63:56]) | |(i4_4_tlb_repl_vec[47:40]) |
	|(i4_4_tlb_repl_vec[31:24]) | |(i4_4_tlb_repl_vec[15:8]);
   assign i4_4_tlb_repl_idx[2] =
	|(i4_4_tlb_repl_vec[63:60]) | |(i4_4_tlb_repl_vec[55:52]) |
	|(i4_4_tlb_repl_vec[47:44]) | |(i4_4_tlb_repl_vec[39:36]) |
	|(i4_4_tlb_repl_vec[31:28]) | |(i4_4_tlb_repl_vec[23:20]) |
	|(i4_4_tlb_repl_vec[15:12]) | |(i4_4_tlb_repl_vec[7:4]);
   assign i4_4_tlb_repl_idx[1] =
	|(i4_4_tlb_repl_vec[63:62]) | |(i4_4_tlb_repl_vec[59:58]) |
	|(i4_4_tlb_repl_vec[55:54]) | |(i4_4_tlb_repl_vec[51:50]) |
	|(i4_4_tlb_repl_vec[47:46]) | |(i4_4_tlb_repl_vec[43:42]) |
	|(i4_4_tlb_repl_vec[39:38]) | |(i4_4_tlb_repl_vec[35:34]) |
	|(i4_4_tlb_repl_vec[31:30]) | |(i4_4_tlb_repl_vec[27:26]) |
	|(i4_4_tlb_repl_vec[23:22]) | |(i4_4_tlb_repl_vec[19:18]) |
	|(i4_4_tlb_repl_vec[15:14]) | |(i4_4_tlb_repl_vec[11:10]) |
	|(i4_4_tlb_repl_vec[7:6]) | |(i4_4_tlb_repl_vec[3:2]);
   assign i4_4_tlb_repl_idx[0] =
	i4_4_tlb_repl_vec[63] | i4_4_tlb_repl_vec[61] |
	i4_4_tlb_repl_vec[59] | i4_4_tlb_repl_vec[57] |
	i4_4_tlb_repl_vec[55] | i4_4_tlb_repl_vec[53] |
	i4_4_tlb_repl_vec[51] | i4_4_tlb_repl_vec[49] |
	i4_4_tlb_repl_vec[47] | i4_4_tlb_repl_vec[45] |
	i4_4_tlb_repl_vec[43] | i4_4_tlb_repl_vec[41] |
	i4_4_tlb_repl_vec[39] | i4_4_tlb_repl_vec[37] |
	i4_4_tlb_repl_vec[35] | i4_4_tlb_repl_vec[33] |
	i4_4_tlb_repl_vec[31] | i4_4_tlb_repl_vec[29] |
	i4_4_tlb_repl_vec[27] | i4_4_tlb_repl_vec[25] |
	i4_4_tlb_repl_vec[23] | i4_4_tlb_repl_vec[21] |
	i4_4_tlb_repl_vec[19] | i4_4_tlb_repl_vec[17] |
	i4_4_tlb_repl_vec[15] | i4_4_tlb_repl_vec[13] |
	i4_4_tlb_repl_vec[11] | i4_4_tlb_repl_vec[9] |
	i4_4_tlb_repl_vec[7] | i4_4_tlb_repl_vec[5] |
	i4_4_tlb_repl_vec[3] | i4_4_tlb_repl_vec[1];

`endif // ifdef RTL_SPARC4

`ifdef RTL_SPARC5
`ifndef RTL_SPU
   assign i4_5_trap     = `SPARC_CORE5.sparc0.tlu.tlu.tcl.thrd0_traps |
              `SPARC_CORE5.sparc0.tlu.tlu.tcl.thrd1_traps |
              `SPARC_CORE5.sparc0.tlu.tlu.tcl.thrd2_traps |
              `SPARC_CORE5.sparc0.tlu.tlu.tcl.thrd3_traps;
   assign i4_5_immu_miss= i4_5_trap &
            ((`SPARC_CORE5.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h64) |
         (`SPARC_CORE5.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h3e));
   assign i4_5_dmmu_miss= i4_5_trap &
        ((`SPARC_CORE5.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h68) |
         (`SPARC_CORE5.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h3f));
`else
   assign i4_5_trap     = `SPARC_CORE5.sparc0.tlu.tcl.thrd0_traps |
			  `SPARC_CORE5.sparc0.tlu.tcl.thrd1_traps |
			  `SPARC_CORE5.sparc0.tlu.tcl.thrd2_traps |
			  `SPARC_CORE5.sparc0.tlu.tcl.thrd3_traps;
   assign i4_5_immu_miss= i4_5_trap &
	        ((`SPARC_CORE5.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h64) |
		 (`SPARC_CORE5.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h3e));
   assign i4_5_dmmu_miss= i4_5_trap &
		((`SPARC_CORE5.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h68) |
		 (`SPARC_CORE5.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h3f));
`endif
   assign i4_5_spu_trap_ack_w= `SPARC_CORE5.sparc0.ifu_spu_trap_ack;
   assign i4_5_spu_illgl_va= `SPARC_CORE5.sparc0.spu_lsu_ldxa_data_vld_w2 &
				`SPARC_CORE5.sparc0.spu_lsu_ldxa_illgl_va_w2;
`ifndef RTL_SPU
   assign i4_5_rstint_vld_w= i4_5_rstint_w &
                `SPARC_CORE5.sparc0.ifu.ifu.ifu_tlu_inst_vld_w &
                ~`SPARC_CORE5.sparc0.ifu.ifu.ifu_tlu_flush_w;
   assign i4_5_hwint_vld_w= i4_5_hwint_w &
            `SPARC_CORE5.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE5.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE5.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE5.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_5_sftint_vld_w= i4_5_sftint_w &
            `SPARC_CORE5.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE5.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE5.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE5.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_5_hint_vld_w=  i4_5_hint_w &
            `SPARC_CORE5.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE5.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE5.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE5.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_5_tick_match= `SPARC_CORE5.sparc0.tlu.tlu.tdp.tickcmp_int[3:0];
   assign i4_5_stick_match= `SPARC_CORE5.sparc0.tlu.tlu.tdp.stickcmp_int[3:0];
   assign i4_5_hstick_match= `SPARC_CORE5.sparc0.tlu.tlu.tdp.tlu_set_hintp_g[3:0];
   assign i4_5_ld_int   = `SPARC_CORE5.sparc0.tlu.tlu.intdp.inc_ind_ld_int_i1;
`else
   assign i4_5_rstint_vld_w= i4_5_rstint_w &
                `SPARC_CORE5.sparc0.ifu.ifu_tlu_inst_vld_w &
                ~`SPARC_CORE5.sparc0.ifu.ifu_tlu_flush_w;
   assign i4_5_hwint_vld_w= i4_5_hwint_w &
			`SPARC_CORE5.sparc0.ifu.ifu_tlu_inst_vld_w &
			~`SPARC_CORE5.sparc0.ifu.ifu_tlu_flush_w &
			~`SPARC_CORE5.sparc0.tlu.lsu_tlu_defr_trp_taken_g &
			~(|(`SPARC_CORE5.sparc0.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_5_sftint_vld_w= i4_5_sftint_w &
			`SPARC_CORE5.sparc0.ifu.ifu_tlu_inst_vld_w &
			~`SPARC_CORE5.sparc0.ifu.ifu_tlu_flush_w &
			~`SPARC_CORE5.sparc0.tlu.lsu_tlu_defr_trp_taken_g &
			~(|(`SPARC_CORE5.sparc0.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_5_hint_vld_w=	i4_5_hint_w &
			`SPARC_CORE5.sparc0.ifu.ifu_tlu_inst_vld_w &
			~`SPARC_CORE5.sparc0.ifu.ifu_tlu_flush_w &
			~`SPARC_CORE5.sparc0.tlu.lsu_tlu_defr_trp_taken_g &
			~(|(`SPARC_CORE5.sparc0.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_5_tick_match= `SPARC_CORE5.sparc0.tlu.tdp.tickcmp_int[3:0];
   assign i4_5_stick_match= `SPARC_CORE5.sparc0.tlu.tdp.stickcmp_int[3:0];
   assign i4_5_hstick_match= `SPARC_CORE5.sparc0.tlu.tdp.tlu_set_hintp_g[3:0];
   assign i4_5_ld_int	= `SPARC_CORE5.sparc0.tlu.intdp.inc_ind_ld_int_i1;
`endif
   assign i4_5_cpx_tid	= `SPARC_CORE5.`LSU_PATH.qdp2.cpx_spc_data_cx[`CPX_TH_HI:`CPX_TH_LO];

`ifndef RTL_SPU
   assign i4_5_itlb_repl_vld = `SPARC_CORE5.sparc0.ifu.ifu.itlb.wr_vld &
                   ~`SPARC_CORE5.sparc0.ifu.ifu.itlb.rw_index_vld;
   assign i4_5_dtlb_repl_vld = `SPARC_CORE5.`LSU_PATH.dtlb.wr_vld &
                   ~`SPARC_CORE5.`LSU_PATH.dtlb.rw_index_vld;
   assign i4_5_tlb_repl_vec[63:0]  = i4_5_itlb_repl_vld ?
            `SPARC_CORE5.sparc0.ifu.ifu.itlb.tlb_entry_replace[15:0] :
            `SPARC_CORE5.`LSU_PATH.dtlb.tlb_entry_replace[15:0];
`else
   assign i4_5_itlb_repl_vld = `SPARC_CORE5.sparc0.ifu.itlb.wr_vld &
				   ~`SPARC_CORE5.sparc0.ifu.itlb.rw_index_vld;
   assign i4_5_dtlb_repl_vld = `SPARC_CORE5.`LSU_PATH.dtlb.wr_vld &
				   ~`SPARC_CORE5.`LSU_PATH.dtlb.rw_index_vld;
   assign i4_5_tlb_repl_vec[63:0]  = i4_5_itlb_repl_vld ?
			`SPARC_CORE5.sparc0.ifu.itlb.tlb_entry_replace[15:0] :
			`SPARC_CORE5.`LSU_PATH.dtlb.tlb_entry_replace[15:0];
`endif
   assign i4_5_tlb_repl_idx[5] = |(i4_5_tlb_repl_vec[63:32]);
   assign i4_5_tlb_repl_idx[4] =
	|(i4_5_tlb_repl_vec[63:48]) | |(i4_5_tlb_repl_vec[31:16]);
   assign i4_5_tlb_repl_idx[3] =
	|(i4_5_tlb_repl_vec[63:56]) | |(i4_5_tlb_repl_vec[47:40]) |
	|(i4_5_tlb_repl_vec[31:24]) | |(i4_5_tlb_repl_vec[15:8]);
   assign i4_5_tlb_repl_idx[2] =
	|(i4_5_tlb_repl_vec[63:60]) | |(i4_5_tlb_repl_vec[55:52]) |
	|(i4_5_tlb_repl_vec[47:44]) | |(i4_5_tlb_repl_vec[39:36]) |
	|(i4_5_tlb_repl_vec[31:28]) | |(i4_5_tlb_repl_vec[23:20]) |
	|(i4_5_tlb_repl_vec[15:12]) | |(i4_5_tlb_repl_vec[7:4]);
   assign i4_5_tlb_repl_idx[1] =
	|(i4_5_tlb_repl_vec[63:62]) | |(i4_5_tlb_repl_vec[59:58]) |
	|(i4_5_tlb_repl_vec[55:54]) | |(i4_5_tlb_repl_vec[51:50]) |
	|(i4_5_tlb_repl_vec[47:46]) | |(i4_5_tlb_repl_vec[43:42]) |
	|(i4_5_tlb_repl_vec[39:38]) | |(i4_5_tlb_repl_vec[35:34]) |
	|(i4_5_tlb_repl_vec[31:30]) | |(i4_5_tlb_repl_vec[27:26]) |
	|(i4_5_tlb_repl_vec[23:22]) | |(i4_5_tlb_repl_vec[19:18]) |
	|(i4_5_tlb_repl_vec[15:14]) | |(i4_5_tlb_repl_vec[11:10]) |
	|(i4_5_tlb_repl_vec[7:6]) | |(i4_5_tlb_repl_vec[3:2]);
   assign i4_5_tlb_repl_idx[0] =
	i4_5_tlb_repl_vec[63] | i4_5_tlb_repl_vec[61] |
	i4_5_tlb_repl_vec[59] | i4_5_tlb_repl_vec[57] |
	i4_5_tlb_repl_vec[55] | i4_5_tlb_repl_vec[53] |
	i4_5_tlb_repl_vec[51] | i4_5_tlb_repl_vec[49] |
	i4_5_tlb_repl_vec[47] | i4_5_tlb_repl_vec[45] |
	i4_5_tlb_repl_vec[43] | i4_5_tlb_repl_vec[41] |
	i4_5_tlb_repl_vec[39] | i4_5_tlb_repl_vec[37] |
	i4_5_tlb_repl_vec[35] | i4_5_tlb_repl_vec[33] |
	i4_5_tlb_repl_vec[31] | i4_5_tlb_repl_vec[29] |
	i4_5_tlb_repl_vec[27] | i4_5_tlb_repl_vec[25] |
	i4_5_tlb_repl_vec[23] | i4_5_tlb_repl_vec[21] |
	i4_5_tlb_repl_vec[19] | i4_5_tlb_repl_vec[17] |
	i4_5_tlb_repl_vec[15] | i4_5_tlb_repl_vec[13] |
	i4_5_tlb_repl_vec[11] | i4_5_tlb_repl_vec[9] |
	i4_5_tlb_repl_vec[7] | i4_5_tlb_repl_vec[5] |
	i4_5_tlb_repl_vec[3] | i4_5_tlb_repl_vec[1];

`endif // ifdef RTL_SPARC5

`ifdef RTL_SPARC6
`ifndef RTL_SPU
   assign i4_6_trap     = `SPARC_CORE6.sparc0.tlu.tlu.tcl.thrd0_traps |
              `SPARC_CORE6.sparc0.tlu.tlu.tcl.thrd1_traps |
              `SPARC_CORE6.sparc0.tlu.tlu.tcl.thrd2_traps |
              `SPARC_CORE6.sparc0.tlu.tlu.tcl.thrd3_traps;
   assign i4_6_immu_miss= i4_6_trap &
            ((`SPARC_CORE6.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h64) |
         (`SPARC_CORE6.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h3e));
   assign i4_6_dmmu_miss= i4_6_trap &
        ((`SPARC_CORE6.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h68) |
         (`SPARC_CORE6.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h3f));
`else
   assign i4_6_trap     = `SPARC_CORE6.sparc0.tlu.tcl.thrd0_traps |
			  `SPARC_CORE6.sparc0.tlu.tcl.thrd1_traps |
			  `SPARC_CORE6.sparc0.tlu.tcl.thrd2_traps |
			  `SPARC_CORE6.sparc0.tlu.tcl.thrd3_traps;
   assign i4_6_immu_miss= i4_6_trap &
	        ((`SPARC_CORE6.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h64) |
		 (`SPARC_CORE6.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h3e));
   assign i4_6_dmmu_miss= i4_6_trap &
		((`SPARC_CORE6.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h68) |
		 (`SPARC_CORE6.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h3f));
`endif
   assign i4_6_spu_trap_ack_w= `SPARC_CORE6.sparc0.ifu_spu_trap_ack;
   assign i4_6_spu_illgl_va= `SPARC_CORE6.sparc0.spu_lsu_ldxa_data_vld_w2 &
				`SPARC_CORE6.sparc0.spu_lsu_ldxa_illgl_va_w2;
`ifndef RTL_SPU
   assign i4_6_rstint_vld_w= i4_6_rstint_w &
                `SPARC_CORE6.sparc0.ifu.ifu.ifu_tlu_inst_vld_w &
                ~`SPARC_CORE6.sparc0.ifu.ifu.ifu_tlu_flush_w;
   assign i4_6_hwint_vld_w= i4_6_hwint_w &
            `SPARC_CORE6.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE6.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE6.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE6.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_6_sftint_vld_w= i4_6_sftint_w &
            `SPARC_CORE6.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE6.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE6.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE6.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_6_hint_vld_w=  i4_6_hint_w &
            `SPARC_CORE6.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE6.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE6.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE6.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_6_tick_match= `SPARC_CORE6.sparc0.tlu.tlu.tdp.tickcmp_int[3:0];
   assign i4_6_stick_match= `SPARC_CORE6.sparc0.tlu.tlu.tdp.stickcmp_int[3:0];
   assign i4_6_hstick_match= `SPARC_CORE6.sparc0.tlu.tlu.tdp.tlu_set_hintp_g[3:0];
   assign i4_6_ld_int   = `SPARC_CORE6.sparc0.tlu.tlu.intdp.inc_ind_ld_int_i1;
`else
   assign i4_6_rstint_vld_w= i4_6_rstint_w &
                `SPARC_CORE6.sparc0.ifu.ifu_tlu_inst_vld_w &
                ~`SPARC_CORE6.sparc0.ifu.ifu_tlu_flush_w;
   assign i4_6_hwint_vld_w= i4_6_hwint_w &
			`SPARC_CORE6.sparc0.ifu.ifu_tlu_inst_vld_w &
			~`SPARC_CORE6.sparc0.ifu.ifu_tlu_flush_w &
			~`SPARC_CORE6.sparc0.tlu.lsu_tlu_defr_trp_taken_g &
			~(|(`SPARC_CORE6.sparc0.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_6_sftint_vld_w= i4_6_sftint_w &
			`SPARC_CORE6.sparc0.ifu.ifu_tlu_inst_vld_w &
			~`SPARC_CORE6.sparc0.ifu.ifu_tlu_flush_w &
			~`SPARC_CORE6.sparc0.tlu.lsu_tlu_defr_trp_taken_g &
			~(|(`SPARC_CORE6.sparc0.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_6_hint_vld_w=	i4_6_hint_w &
			`SPARC_CORE6.sparc0.ifu.ifu_tlu_inst_vld_w &
			~`SPARC_CORE6.sparc0.ifu.ifu_tlu_flush_w &
			~`SPARC_CORE6.sparc0.tlu.lsu_tlu_defr_trp_taken_g &
			~(|(`SPARC_CORE6.sparc0.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_6_tick_match= `SPARC_CORE6.sparc0.tlu.tdp.tickcmp_int[3:0];
   assign i4_6_stick_match= `SPARC_CORE6.sparc0.tlu.tdp.stickcmp_int[3:0];
   assign i4_6_hstick_match= `SPARC_CORE6.sparc0.tlu.tdp.tlu_set_hintp_g[3:0];
   assign i4_6_ld_int	= `SPARC_CORE6.sparc0.tlu.intdp.inc_ind_ld_int_i1;
`endif
   assign i4_6_cpx_tid	= `SPARC_CORE6.`LSU_PATH.qdp2.cpx_spc_data_cx[`CPX_TH_HI:`CPX_TH_LO];

`ifndef RTL_SPU
   assign i4_6_itlb_repl_vld = `SPARC_CORE6.sparc0.ifu.ifu.itlb.wr_vld &
                   ~`SPARC_CORE6.sparc0.ifu.ifu.itlb.rw_index_vld;
   assign i4_6_dtlb_repl_vld = `SPARC_CORE6.`LSU_PATH.dtlb.wr_vld &
                   ~`SPARC_CORE6.`LSU_PATH.dtlb.rw_index_vld;
   assign i4_6_tlb_repl_vec[63:0]  = i4_6_itlb_repl_vld ?
            `SPARC_CORE6.sparc0.ifu.ifu.itlb.tlb_entry_replace[15:0] :
            `SPARC_CORE6.`LSU_PATH.dtlb.tlb_entry_replace[15:0];
`else
   assign i4_6_itlb_repl_vld = `SPARC_CORE6.sparc0.ifu.itlb.wr_vld &
				   ~`SPARC_CORE6.sparc0.ifu.itlb.rw_index_vld;
   assign i4_6_dtlb_repl_vld = `SPARC_CORE6.`LSU_PATH.dtlb.wr_vld &
				   ~`SPARC_CORE6.`LSU_PATH.dtlb.rw_index_vld;
   assign i4_6_tlb_repl_vec[63:0]  = i4_6_itlb_repl_vld ?
			`SPARC_CORE6.sparc0.ifu.itlb.tlb_entry_replace[15:0] :
			`SPARC_CORE6.`LSU_PATH.dtlb.tlb_entry_replace[15:0];
`endif
   assign i4_6_tlb_repl_idx[5] = |(i4_6_tlb_repl_vec[63:32]);
   assign i4_6_tlb_repl_idx[4] =
	|(i4_6_tlb_repl_vec[63:48]) | |(i4_6_tlb_repl_vec[31:16]);
   assign i4_6_tlb_repl_idx[3] =
	|(i4_6_tlb_repl_vec[63:56]) | |(i4_6_tlb_repl_vec[47:40]) |
	|(i4_6_tlb_repl_vec[31:24]) | |(i4_6_tlb_repl_vec[15:8]);
   assign i4_6_tlb_repl_idx[2] =
	|(i4_6_tlb_repl_vec[63:60]) | |(i4_6_tlb_repl_vec[55:52]) |
	|(i4_6_tlb_repl_vec[47:44]) | |(i4_6_tlb_repl_vec[39:36]) |
	|(i4_6_tlb_repl_vec[31:28]) | |(i4_6_tlb_repl_vec[23:20]) |
	|(i4_6_tlb_repl_vec[15:12]) | |(i4_6_tlb_repl_vec[7:4]);
   assign i4_6_tlb_repl_idx[1] =
	|(i4_6_tlb_repl_vec[63:62]) | |(i4_6_tlb_repl_vec[59:58]) |
	|(i4_6_tlb_repl_vec[55:54]) | |(i4_6_tlb_repl_vec[51:50]) |
	|(i4_6_tlb_repl_vec[47:46]) | |(i4_6_tlb_repl_vec[43:42]) |
	|(i4_6_tlb_repl_vec[39:38]) | |(i4_6_tlb_repl_vec[35:34]) |
	|(i4_6_tlb_repl_vec[31:30]) | |(i4_6_tlb_repl_vec[27:26]) |
	|(i4_6_tlb_repl_vec[23:22]) | |(i4_6_tlb_repl_vec[19:18]) |
	|(i4_6_tlb_repl_vec[15:14]) | |(i4_6_tlb_repl_vec[11:10]) |
	|(i4_6_tlb_repl_vec[7:6]) | |(i4_6_tlb_repl_vec[3:2]);
   assign i4_6_tlb_repl_idx[0] =
	i4_6_tlb_repl_vec[63] | i4_6_tlb_repl_vec[61] |
	i4_6_tlb_repl_vec[59] | i4_6_tlb_repl_vec[57] |
	i4_6_tlb_repl_vec[55] | i4_6_tlb_repl_vec[53] |
	i4_6_tlb_repl_vec[51] | i4_6_tlb_repl_vec[49] |
	i4_6_tlb_repl_vec[47] | i4_6_tlb_repl_vec[45] |
	i4_6_tlb_repl_vec[43] | i4_6_tlb_repl_vec[41] |
	i4_6_tlb_repl_vec[39] | i4_6_tlb_repl_vec[37] |
	i4_6_tlb_repl_vec[35] | i4_6_tlb_repl_vec[33] |
	i4_6_tlb_repl_vec[31] | i4_6_tlb_repl_vec[29] |
	i4_6_tlb_repl_vec[27] | i4_6_tlb_repl_vec[25] |
	i4_6_tlb_repl_vec[23] | i4_6_tlb_repl_vec[21] |
	i4_6_tlb_repl_vec[19] | i4_6_tlb_repl_vec[17] |
	i4_6_tlb_repl_vec[15] | i4_6_tlb_repl_vec[13] |
	i4_6_tlb_repl_vec[11] | i4_6_tlb_repl_vec[9] |
	i4_6_tlb_repl_vec[7] | i4_6_tlb_repl_vec[5] |
	i4_6_tlb_repl_vec[3] | i4_6_tlb_repl_vec[1];

`endif // ifdef RTL_SPARC6

`ifdef RTL_SPARC7
`ifndef RTL_SPU
   assign i4_7_trap     = `SPARC_CORE7.sparc0.tlu.tlu.tcl.thrd0_traps |
              `SPARC_CORE7.sparc0.tlu.tlu.tcl.thrd1_traps |
              `SPARC_CORE7.sparc0.tlu.tlu.tcl.thrd2_traps |
              `SPARC_CORE7.sparc0.tlu.tlu.tcl.thrd3_traps;
   assign i4_7_immu_miss= i4_7_trap &
            ((`SPARC_CORE7.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h64) |
         (`SPARC_CORE7.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h3e));
   assign i4_7_dmmu_miss= i4_7_trap &
        ((`SPARC_CORE7.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h68) |
         (`SPARC_CORE7.sparc0.tlu.tlu.tcl.sas_final_ttype_g[8:0]=='h3f));
`else
   assign i4_7_trap     = `SPARC_CORE7.sparc0.tlu.tcl.thrd0_traps |
			  `SPARC_CORE7.sparc0.tlu.tcl.thrd1_traps |
			  `SPARC_CORE7.sparc0.tlu.tcl.thrd2_traps |
			  `SPARC_CORE7.sparc0.tlu.tcl.thrd3_traps;
   assign i4_7_immu_miss= i4_7_trap &
	        ((`SPARC_CORE7.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h64) |
		 (`SPARC_CORE7.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h3e));
   assign i4_7_dmmu_miss= i4_7_trap &
		((`SPARC_CORE7.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h68) |
		 (`SPARC_CORE7.sparc0.tlu.tcl.sas_final_ttype_g[8:0]=='h3f));
`endif
   assign i4_7_spu_trap_ack_w= `SPARC_CORE7.sparc0.ifu_spu_trap_ack;
   assign i4_7_spu_illgl_va= `SPARC_CORE7.sparc0.spu_lsu_ldxa_data_vld_w2 &
				`SPARC_CORE7.sparc0.spu_lsu_ldxa_illgl_va_w2;
`ifndef RTL_SPU
   assign i4_7_rstint_vld_w= i4_7_rstint_w &
                `SPARC_CORE7.sparc0.ifu.ifu.ifu_tlu_inst_vld_w &
                ~`SPARC_CORE7.sparc0.ifu.ifu.ifu_tlu_flush_w;
   assign i4_7_hwint_vld_w= i4_7_hwint_w &
            `SPARC_CORE7.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE7.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE7.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE7.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_7_sftint_vld_w= i4_7_sftint_w &
            `SPARC_CORE7.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE7.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE7.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE7.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_7_hint_vld_w=  i4_7_hint_w &
            `SPARC_CORE7.sparc0.ifu.ifu_tlu_inst_vld_w &
            ~`SPARC_CORE7.sparc0.ifu.ifu_tlu_flush_w &
            ~`SPARC_CORE7.sparc0.tlu.tlu.lsu_tlu_defr_trp_taken_g &
            ~(|(`SPARC_CORE7.sparc0.tlu.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_7_tick_match= `SPARC_CORE7.sparc0.tlu.tlu.tdp.tickcmp_int[3:0];
   assign i4_7_stick_match= `SPARC_CORE7.sparc0.tlu.tlu.tdp.stickcmp_int[3:0];
   assign i4_7_hstick_match= `SPARC_CORE7.sparc0.tlu.tlu.tdp.tlu_set_hintp_g[3:0];
   assign i4_7_ld_int   = `SPARC_CORE7.sparc0.tlu.tlu.intdp.inc_ind_ld_int_i1;
`else
   assign i4_7_rstint_vld_w= i4_7_rstint_w &
                `SPARC_CORE7.sparc0.ifu.ifu_tlu_inst_vld_w &
                ~`SPARC_CORE7.sparc0.ifu.ifu_tlu_flush_w;
   assign i4_7_hwint_vld_w= i4_7_hwint_w &
			`SPARC_CORE7.sparc0.ifu.ifu_tlu_inst_vld_w &
			~`SPARC_CORE7.sparc0.ifu.ifu_tlu_flush_w &
			~`SPARC_CORE7.sparc0.tlu.lsu_tlu_defr_trp_taken_g &
			~(|(`SPARC_CORE7.sparc0.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_7_sftint_vld_w= i4_7_sftint_w &
			`SPARC_CORE7.sparc0.ifu.ifu_tlu_inst_vld_w &
			~`SPARC_CORE7.sparc0.ifu.ifu_tlu_flush_w &
			~`SPARC_CORE7.sparc0.tlu.lsu_tlu_defr_trp_taken_g &
			~(|(`SPARC_CORE7.sparc0.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_7_hint_vld_w=	i4_7_hint_w &
			`SPARC_CORE7.sparc0.ifu.ifu_tlu_inst_vld_w &
			~`SPARC_CORE7.sparc0.ifu.ifu_tlu_flush_w &
			~`SPARC_CORE7.sparc0.tlu.lsu_tlu_defr_trp_taken_g &
			~(|(`SPARC_CORE7.sparc0.tlu.tcl.tlz_trap_g[3:0]));
   assign i4_7_tick_match= `SPARC_CORE7.sparc0.tlu.tdp.tickcmp_int[3:0];
   assign i4_7_stick_match= `SPARC_CORE7.sparc0.tlu.tdp.stickcmp_int[3:0];
   assign i4_7_hstick_match= `SPARC_CORE7.sparc0.tlu.tdp.tlu_set_hintp_g[3:0];
   assign i4_7_ld_int	= `SPARC_CORE7.sparc0.tlu.intdp.inc_ind_ld_int_i1;
`endif
   assign i4_7_cpx_tid	= `SPARC_CORE7.`LSU_PATH.qdp2.cpx_spc_data_cx[`CPX_TH_HI:`CPX_TH_LO];

`ifndef RTL_SPU
   assign i4_7_itlb_repl_vld = `SPARC_CORE7.sparc0.ifu.ifu.itlb.wr_vld &
                   ~`SPARC_CORE7.sparc0.ifu.ifu.itlb.rw_index_vld;
   assign i4_7_dtlb_repl_vld = `SPARC_CORE7.`LSU_PATH.dtlb.wr_vld &
                   ~`SPARC_CORE7.`LSU_PATH.dtlb.rw_index_vld;
   assign i4_7_tlb_repl_vec[63:0]  = i4_7_itlb_repl_vld ?
            `SPARC_CORE7.sparc0.ifu.ifu.itlb.tlb_entry_replace[15:0] :
            `SPARC_CORE7.`LSU_PATH.dtlb.tlb_entry_replace[15:0];
`else
   assign i4_7_itlb_repl_vld = `SPARC_CORE7.sparc0.ifu.itlb.wr_vld &
				   ~`SPARC_CORE7.sparc0.ifu.itlb.rw_index_vld;
   assign i4_7_dtlb_repl_vld = `SPARC_CORE7.`LSU_PATH.dtlb.wr_vld &
				   ~`SPARC_CORE7.`LSU_PATH.dtlb.rw_index_vld;
   assign i4_7_tlb_repl_vec[63:0]  = i4_7_itlb_repl_vld ?
			`SPARC_CORE7.sparc0.ifu.itlb.tlb_entry_replace[15:0] :
			`SPARC_CORE7.`LSU_PATH.dtlb.tlb_entry_replace[15:0];
`endif
   assign i4_7_tlb_repl_idx[5] = |(i4_7_tlb_repl_vec[63:32]);
   assign i4_7_tlb_repl_idx[4] =
	|(i4_7_tlb_repl_vec[63:48]) | |(i4_7_tlb_repl_vec[31:16]);
   assign i4_7_tlb_repl_idx[3] =
	|(i4_7_tlb_repl_vec[63:56]) | |(i4_7_tlb_repl_vec[47:40]) |
	|(i4_7_tlb_repl_vec[31:24]) | |(i4_7_tlb_repl_vec[15:8]);
   assign i4_7_tlb_repl_idx[2] =
	|(i4_7_tlb_repl_vec[63:60]) | |(i4_7_tlb_repl_vec[55:52]) |
	|(i4_7_tlb_repl_vec[47:44]) | |(i4_7_tlb_repl_vec[39:36]) |
	|(i4_7_tlb_repl_vec[31:28]) | |(i4_7_tlb_repl_vec[23:20]) |
	|(i4_7_tlb_repl_vec[15:12]) | |(i4_7_tlb_repl_vec[7:4]);
   assign i4_7_tlb_repl_idx[1] =
	|(i4_7_tlb_repl_vec[63:62]) | |(i4_7_tlb_repl_vec[59:58]) |
	|(i4_7_tlb_repl_vec[55:54]) | |(i4_7_tlb_repl_vec[51:50]) |
	|(i4_7_tlb_repl_vec[47:46]) | |(i4_7_tlb_repl_vec[43:42]) |
	|(i4_7_tlb_repl_vec[39:38]) | |(i4_7_tlb_repl_vec[35:34]) |
	|(i4_7_tlb_repl_vec[31:30]) | |(i4_7_tlb_repl_vec[27:26]) |
	|(i4_7_tlb_repl_vec[23:22]) | |(i4_7_tlb_repl_vec[19:18]) |
	|(i4_7_tlb_repl_vec[15:14]) | |(i4_7_tlb_repl_vec[11:10]) |
	|(i4_7_tlb_repl_vec[7:6]) | |(i4_7_tlb_repl_vec[3:2]);
   assign i4_7_tlb_repl_idx[0] =
	i4_7_tlb_repl_vec[63] | i4_7_tlb_repl_vec[61] |
	i4_7_tlb_repl_vec[59] | i4_7_tlb_repl_vec[57] |
	i4_7_tlb_repl_vec[55] | i4_7_tlb_repl_vec[53] |
	i4_7_tlb_repl_vec[51] | i4_7_tlb_repl_vec[49] |
	i4_7_tlb_repl_vec[47] | i4_7_tlb_repl_vec[45] |
	i4_7_tlb_repl_vec[43] | i4_7_tlb_repl_vec[41] |
	i4_7_tlb_repl_vec[39] | i4_7_tlb_repl_vec[37] |
	i4_7_tlb_repl_vec[35] | i4_7_tlb_repl_vec[33] |
	i4_7_tlb_repl_vec[31] | i4_7_tlb_repl_vec[29] |
	i4_7_tlb_repl_vec[27] | i4_7_tlb_repl_vec[25] |
	i4_7_tlb_repl_vec[23] | i4_7_tlb_repl_vec[21] |
	i4_7_tlb_repl_vec[19] | i4_7_tlb_repl_vec[17] |
	i4_7_tlb_repl_vec[15] | i4_7_tlb_repl_vec[13] |
	i4_7_tlb_repl_vec[11] | i4_7_tlb_repl_vec[9] |
	i4_7_tlb_repl_vec[7] | i4_7_tlb_repl_vec[5] |
	i4_7_tlb_repl_vec[3] | i4_7_tlb_repl_vec[1];

`endif // ifdef RTL_SPARC7


`ifdef RTL_SPARC0
   assign i4_0_data =
		     {1'b0,
		      1'b0,
		      1'b0,
		      `SPARC_CORE0.sparc0.spu_lsu_ldxa_tid_w2[1:0],
`ifndef RTL_SPU
              `SPARC_CORE0.sparc0.tlu.tlu.tcl.sftintctr[1:0],
`else
		      `SPARC_CORE0.sparc0.tlu.tcl.sftintctr[1:0],
`endif
		      i4_0_tlb_repl_idx[5:0],
`ifndef RTL_SPU
              `SPARC_CORE0.sparc0.tlu.tlu.mmu_ctl.tlb_access_tid_g[1:0],
`else
		      `SPARC_CORE0.sparc0.tlu.mmu_ctl.tlb_access_tid_g[1:0],
`endif
		      i4_0_itlb_repl_vld,
		      i4_0_dtlb_repl_vld,
		      i4_0_spu_illgl_va,
		      i4_0_ld_int[3:0],
   		      i4_0_hstick_match[3:0],
		      i4_0_stick_match[3:0],
		      i4_0_tick_match[3:0],
		      i4_0_hint_vld_w,
		      i4_0_sftint_vld_w,
		      i4_0_hwint_vld_w,
		      i4_0_rstint_vld_w,
		      i4_0_int_thr_w[3:0],
		      i4_0_spu_trap_ack_w,
		      i4_0_fill_dcache_w,
		      `SPARC_CORE0.sparc0.spu_ifu_ttype_vld_w2,
		      `SPARC_CORE0.sparc0.spu_ifu_ttype_w2,
		      `SPARC_CORE0.sparc0.spu_ifu_ttype_tid_w2[1:0],
		      i4_0_immu_miss,
		      i4_0_dmmu_miss,
`ifndef RTL_SPU
              `SPARC_CORE0.sparc0.tlu.tlu.tcl.trap_tid_g[1:0],
`else
		      `SPARC_CORE0.sparc0.tlu.tcl.trap_tid_g[1:0],
`endif
		      i4_0_fprs_set_w[3:0],
		      i4_0_new_fprs_w[1:0],
		      `SPARC_CORE0.`LSU_PATH.qctl2.cpx_st_ack_tid0,
		      `SPARC_CORE0.`LSU_PATH.qctl2.cpx_st_ack_tid1,
		      `SPARC_CORE0.`LSU_PATH.qctl2.cpx_st_ack_tid2,
		      `SPARC_CORE0.`LSU_PATH.qctl2.cpx_st_ack_tid3,
		      i4_0_cpx_tid[1:0],
		      i4_0_ic_inv_vld_s,
		      i4_0_ic_inv_addr_s[5:0],
		      i4_0_ic_inv_word1_s,
		      i4_0_ic_inv_word0_s,
		      i4_0_ic_inv_way1_s[1:0],
		      i4_0_ic_inv_way0_s[1:0],
		      `SPARC_CORE0.`LSU_PATH.qctl2.cpx_ifill_type,
		      `SPARC_CORE0.`LSU_PATH.qctl2.cpx_ld_type,
		      `SPARC_CORE0.`LSU_PATH.qctl2.cpx_st_ack_type |
		      `SPARC_CORE0.`LSU_PATH.qctl2.cpx_strm_st_ack_type,
		      i4_0_st_wr_dcache_w,
		      i4_0_dcache_fill_addr_w[9:0],
		      i4_0_dva_svld_w,
		      i4_0_dva_snp_addr_w[4:0],
		      i4_0_dva_snp_set_vld_w[3:0],
		      i4_0_dva_snp_wy3_w[1:0],
		      i4_0_dva_snp_wy2_w[1:0],
		      i4_0_dva_snp_wy1_w[1:0],
		      i4_0_dva_snp_wy0_w[1:0]};
   assign i4_0_rdy =
		     (i4_0_itlb_repl_vld |
		      i4_0_dtlb_repl_vld |
		      i4_0_fprs_set_w[0] |
		      i4_0_fprs_set_w[1] |
		      i4_0_fprs_set_w[2] |
		      i4_0_fprs_set_w[3] |
		      i4_0_tick_match[0] |
		      i4_0_tick_match[1] |
		      i4_0_tick_match[2] |
		      i4_0_tick_match[3] |
		      i4_0_stick_match[0] |
		      i4_0_stick_match[1] |
		      i4_0_stick_match[2] |
		      i4_0_stick_match[3] |
		      i4_0_hstick_match[0] |
		      i4_0_hstick_match[1] |
		      i4_0_hstick_match[2] |
		      i4_0_hstick_match[3] |
		      i4_0_ld_int[0] |
		      i4_0_ld_int[1] |
		      i4_0_ld_int[2] |
		      i4_0_ld_int[3] |
		      `SPARC_CORE0.sparc0.spu_ifu_ttype_vld_w2 |
		      i4_0_spu_illgl_va |
		      i4_0_spu_trap_ack_w |
		      i4_0_immu_miss | i4_0_dmmu_miss |
		      i4_0_rstint_vld_w | i4_0_hwint_vld_w |
		      i4_0_sftint_vld_w | i4_0_hint_w |
		      `SPARC_CORE0.`LSU_PATH.qctl2.cpx_ifill_type |
		      `SPARC_CORE0.`LSU_PATH.qctl2.cpx_ld_type  |
		      `SPARC_CORE0.`LSU_PATH.qctl2.cpx_st_ack_type  |
		      `SPARC_CORE0.`LSU_PATH.qctl2.cpx_strm_st_ack_type |
		      i4_0_ic_inv_vld_s |
		      i4_0_st_wr_dcache_w |
		      i4_0_fill_dcache_w |
		      i4_0_dva_svld_w);
`endif // ifdef RTL_SPARC0

`ifdef RTL_SPARC1
   assign i4_1_data =
		     {1'b0,
		      1'b0,
		      1'b0,
		      `SPARC_CORE1.sparc0.spu_lsu_ldxa_tid_w2[1:0],
`ifndef RTL_SPU
              `SPARC_CORE1.sparc0.tlu.tlu.tcl.sftintctr[1:0],
`else
		      `SPARC_CORE1.sparc0.tlu.tcl.sftintctr[1:0],
`endif
		      i4_1_tlb_repl_idx[5:0],
`ifndef RTL_SPU
              `SPARC_CORE1.sparc0.tlu.tlu.mmu_ctl.tlb_access_tid_g[1:0],
`else
		      `SPARC_CORE1.sparc0.tlu.mmu_ctl.tlb_access_tid_g[1:0],
`endif
		      i4_1_itlb_repl_vld,
		      i4_1_dtlb_repl_vld,
		      i4_1_spu_illgl_va,
		      i4_1_ld_int[3:0],
   		      i4_1_hstick_match[3:0],
		      i4_1_stick_match[3:0],
		      i4_1_tick_match[3:0],
		      i4_1_hint_vld_w,
		      i4_1_sftint_vld_w,
		      i4_1_hwint_vld_w,
		      i4_1_rstint_vld_w,
		      i4_1_int_thr_w[3:0],
		      i4_1_spu_trap_ack_w,
		      i4_1_fill_dcache_w,
		      `SPARC_CORE1.sparc0.spu_ifu_ttype_vld_w2,
		      `SPARC_CORE1.sparc0.spu_ifu_ttype_w2,
		      `SPARC_CORE1.sparc0.spu_ifu_ttype_tid_w2[1:0],
		      i4_1_immu_miss,
		      i4_1_dmmu_miss,
`ifndef RTL_SPU
              `SPARC_CORE1.sparc0.tlu.tlu.tcl.trap_tid_g[1:0],
`else
		      `SPARC_CORE1.sparc0.tlu.tcl.trap_tid_g[1:0],
`endif
		      i4_1_fprs_set_w[3:0],
		      i4_1_new_fprs_w[1:0],
		      `SPARC_CORE1.`LSU_PATH.qctl2.cpx_st_ack_tid0,
		      `SPARC_CORE1.`LSU_PATH.qctl2.cpx_st_ack_tid1,
		      `SPARC_CORE1.`LSU_PATH.qctl2.cpx_st_ack_tid2,
		      `SPARC_CORE1.`LSU_PATH.qctl2.cpx_st_ack_tid3,
		      i4_1_cpx_tid[1:0],
		      i4_1_ic_inv_vld_s,
		      i4_1_ic_inv_addr_s[5:0],
		      i4_1_ic_inv_word1_s,
		      i4_1_ic_inv_word0_s,
		      i4_1_ic_inv_way1_s[1:0],
		      i4_1_ic_inv_way0_s[1:0],
		      `SPARC_CORE1.`LSU_PATH.qctl2.cpx_ifill_type,
		      `SPARC_CORE1.`LSU_PATH.qctl2.cpx_ld_type,
		      `SPARC_CORE1.`LSU_PATH.qctl2.cpx_st_ack_type |
		      `SPARC_CORE1.`LSU_PATH.qctl2.cpx_strm_st_ack_type,
		      i4_1_st_wr_dcache_w,
		      i4_1_dcache_fill_addr_w[9:0],
		      i4_1_dva_svld_w,
		      i4_1_dva_snp_addr_w[4:0],
		      i4_1_dva_snp_set_vld_w[3:0],
		      i4_1_dva_snp_wy3_w[1:0],
		      i4_1_dva_snp_wy2_w[1:0],
		      i4_1_dva_snp_wy1_w[1:0],
		      i4_1_dva_snp_wy0_w[1:0]};
   assign i4_1_rdy =
		     (i4_1_itlb_repl_vld |
		      i4_1_dtlb_repl_vld |
		      i4_1_fprs_set_w[0] |
		      i4_1_fprs_set_w[1] |
		      i4_1_fprs_set_w[2] |
		      i4_1_fprs_set_w[3] |
		      i4_1_tick_match[0] |
		      i4_1_tick_match[1] |
		      i4_1_tick_match[2] |
		      i4_1_tick_match[3] |
		      i4_1_stick_match[0] |
		      i4_1_stick_match[1] |
		      i4_1_stick_match[2] |
		      i4_1_stick_match[3] |
		      i4_1_hstick_match[0] |
		      i4_1_hstick_match[1] |
		      i4_1_hstick_match[2] |
		      i4_1_hstick_match[3] |
		      i4_1_ld_int[0] |
		      i4_1_ld_int[1] |
		      i4_1_ld_int[2] |
		      i4_1_ld_int[3] |
		      `SPARC_CORE1.sparc0.spu_ifu_ttype_vld_w2 |
		      i4_1_spu_illgl_va |
		      i4_1_spu_trap_ack_w |
		      i4_1_immu_miss | i4_1_dmmu_miss |
		      i4_1_rstint_vld_w | i4_1_hwint_vld_w |
		      i4_1_sftint_vld_w | i4_1_hint_w |
		      `SPARC_CORE1.`LSU_PATH.qctl2.cpx_ifill_type |
		      `SPARC_CORE1.`LSU_PATH.qctl2.cpx_ld_type  |
		      `SPARC_CORE1.`LSU_PATH.qctl2.cpx_st_ack_type  |
		      `SPARC_CORE1.`LSU_PATH.qctl2.cpx_strm_st_ack_type |
		      i4_1_ic_inv_vld_s |
		      i4_1_st_wr_dcache_w |
		      i4_1_fill_dcache_w |
		      i4_1_dva_svld_w);
`endif // ifdef RTL_SPARC1

`ifdef RTL_SPARC2
   assign i4_2_data =
		     {1'b0,
		      1'b0,
		      1'b0,
		      `SPARC_CORE2.sparc0.spu_lsu_ldxa_tid_w2[1:0],
`ifndef RTL_SPU
              `SPARC_CORE2.sparc0.tlu.tlu.tcl.sftintctr[1:0],
`else
		      `SPARC_CORE2.sparc0.tlu.tcl.sftintctr[1:0],
`endif
		      i4_2_tlb_repl_idx[5:0],
`ifndef RTL_SPU
              `SPARC_CORE2.sparc0.tlu.tlu.mmu_ctl.tlb_access_tid_g[1:0],
`else
		      `SPARC_CORE2.sparc0.tlu.mmu_ctl.tlb_access_tid_g[1:0],
`endif
		      i4_2_itlb_repl_vld,
		      i4_2_dtlb_repl_vld,
		      i4_2_spu_illgl_va,
		      i4_2_ld_int[3:0],
   		      i4_2_hstick_match[3:0],
		      i4_2_stick_match[3:0],
		      i4_2_tick_match[3:0],
		      i4_2_hint_vld_w,
		      i4_2_sftint_vld_w,
		      i4_2_hwint_vld_w,
		      i4_2_rstint_vld_w,
		      i4_2_int_thr_w[3:0],
		      i4_2_spu_trap_ack_w,
		      i4_2_fill_dcache_w,
		      `SPARC_CORE2.sparc0.spu_ifu_ttype_vld_w2,
		      `SPARC_CORE2.sparc0.spu_ifu_ttype_w2,
		      `SPARC_CORE2.sparc0.spu_ifu_ttype_tid_w2[1:0],
		      i4_2_immu_miss,
		      i4_2_dmmu_miss,
`ifndef RTL_SPU
              `SPARC_CORE2.sparc0.tlu.tlu.tcl.trap_tid_g[1:0],
`else
		      `SPARC_CORE2.sparc0.tlu.tcl.trap_tid_g[1:0],
`endif
		      i4_2_fprs_set_w[3:0],
		      i4_2_new_fprs_w[1:0],
		      `SPARC_CORE2.`LSU_PATH.qctl2.cpx_st_ack_tid0,
		      `SPARC_CORE2.`LSU_PATH.qctl2.cpx_st_ack_tid1,
		      `SPARC_CORE2.`LSU_PATH.qctl2.cpx_st_ack_tid2,
		      `SPARC_CORE2.`LSU_PATH.qctl2.cpx_st_ack_tid3,
		      i4_2_cpx_tid[1:0],
		      i4_2_ic_inv_vld_s,
		      i4_2_ic_inv_addr_s[5:0],
		      i4_2_ic_inv_word1_s,
		      i4_2_ic_inv_word0_s,
		      i4_2_ic_inv_way1_s[1:0],
		      i4_2_ic_inv_way0_s[1:0],
		      `SPARC_CORE2.`LSU_PATH.qctl2.cpx_ifill_type,
		      `SPARC_CORE2.`LSU_PATH.qctl2.cpx_ld_type,
		      `SPARC_CORE2.`LSU_PATH.qctl2.cpx_st_ack_type |
		      `SPARC_CORE2.`LSU_PATH.qctl2.cpx_strm_st_ack_type,
		      i4_2_st_wr_dcache_w,
		      i4_2_dcache_fill_addr_w[9:0],
		      i4_2_dva_svld_w,
		      i4_2_dva_snp_addr_w[4:0],
		      i4_2_dva_snp_set_vld_w[3:0],
		      i4_2_dva_snp_wy3_w[1:0],
		      i4_2_dva_snp_wy2_w[1:0],
		      i4_2_dva_snp_wy1_w[1:0],
		      i4_2_dva_snp_wy0_w[1:0]};
   assign i4_2_rdy =
		     (i4_2_itlb_repl_vld |
		      i4_2_dtlb_repl_vld |
		      i4_2_fprs_set_w[0] |
		      i4_2_fprs_set_w[1] |
		      i4_2_fprs_set_w[2] |
		      i4_2_fprs_set_w[3] |
		      i4_2_tick_match[0] |
		      i4_2_tick_match[1] |
		      i4_2_tick_match[2] |
		      i4_2_tick_match[3] |
		      i4_2_stick_match[0] |
		      i4_2_stick_match[1] |
		      i4_2_stick_match[2] |
		      i4_2_stick_match[3] |
		      i4_2_hstick_match[0] |
		      i4_2_hstick_match[1] |
		      i4_2_hstick_match[2] |
		      i4_2_hstick_match[3] |
		      i4_2_ld_int[0] |
		      i4_2_ld_int[1] |
		      i4_2_ld_int[2] |
		      i4_2_ld_int[3] |
		      `SPARC_CORE2.sparc0.spu_ifu_ttype_vld_w2 |
		      i4_2_spu_illgl_va |
		      i4_2_spu_trap_ack_w |
		      i4_2_immu_miss | i4_2_dmmu_miss |
		      i4_2_rstint_vld_w | i4_2_hwint_vld_w |
		      i4_2_sftint_vld_w | i4_2_hint_w |
		      `SPARC_CORE2.`LSU_PATH.qctl2.cpx_ifill_type |
		      `SPARC_CORE2.`LSU_PATH.qctl2.cpx_ld_type  |
		      `SPARC_CORE2.`LSU_PATH.qctl2.cpx_st_ack_type  |
		      `SPARC_CORE2.`LSU_PATH.qctl2.cpx_strm_st_ack_type |
		      i4_2_ic_inv_vld_s |
		      i4_2_st_wr_dcache_w |
		      i4_2_fill_dcache_w |
		      i4_2_dva_svld_w);
`endif // ifdef RTL_SPARC2

`ifdef RTL_SPARC3
   assign i4_3_data =
		     {1'b0,
		      1'b0,
		      1'b0,
		      `SPARC_CORE3.sparc0.spu_lsu_ldxa_tid_w2[1:0],
`ifndef RTL_SPU
              `SPARC_CORE3.sparc0.tlu.tlu.tcl.sftintctr[1:0],
`else
		      `SPARC_CORE3.sparc0.tlu.tcl.sftintctr[1:0],
`endif
		      i4_3_tlb_repl_idx[5:0],
`ifndef RTL_SPU
              `SPARC_CORE3.sparc0.tlu.tlu.mmu_ctl.tlb_access_tid_g[1:0],
`else
		      `SPARC_CORE3.sparc0.tlu.mmu_ctl.tlb_access_tid_g[1:0],
`endif
		      i4_3_itlb_repl_vld,
		      i4_3_dtlb_repl_vld,
		      i4_3_spu_illgl_va,
		      i4_3_ld_int[3:0],
   		      i4_3_hstick_match[3:0],
		      i4_3_stick_match[3:0],
		      i4_3_tick_match[3:0],
		      i4_3_hint_vld_w,
		      i4_3_sftint_vld_w,
		      i4_3_hwint_vld_w,
		      i4_3_rstint_vld_w,
		      i4_3_int_thr_w[3:0],
		      i4_3_spu_trap_ack_w,
		      i4_3_fill_dcache_w,
		      `SPARC_CORE3.sparc0.spu_ifu_ttype_vld_w2,
		      `SPARC_CORE3.sparc0.spu_ifu_ttype_w2,
		      `SPARC_CORE3.sparc0.spu_ifu_ttype_tid_w2[1:0],
		      i4_3_immu_miss,
		      i4_3_dmmu_miss,
`ifndef RTL_SPU
              `SPARC_CORE3.sparc0.tlu.tlu.tcl.trap_tid_g[1:0],
`else
		      `SPARC_CORE3.sparc0.tlu.tcl.trap_tid_g[1:0],
`endif
		      i4_3_fprs_set_w[3:0],
		      i4_3_new_fprs_w[1:0],
		      `SPARC_CORE3.`LSU_PATH.qctl2.cpx_st_ack_tid0,
		      `SPARC_CORE3.`LSU_PATH.qctl2.cpx_st_ack_tid1,
		      `SPARC_CORE3.`LSU_PATH.qctl2.cpx_st_ack_tid2,
		      `SPARC_CORE3.`LSU_PATH.qctl2.cpx_st_ack_tid3,
		      i4_3_cpx_tid[1:0],
		      i4_3_ic_inv_vld_s,
		      i4_3_ic_inv_addr_s[5:0],
		      i4_3_ic_inv_word1_s,
		      i4_3_ic_inv_word0_s,
		      i4_3_ic_inv_way1_s[1:0],
		      i4_3_ic_inv_way0_s[1:0],
		      `SPARC_CORE3.`LSU_PATH.qctl2.cpx_ifill_type,
		      `SPARC_CORE3.`LSU_PATH.qctl2.cpx_ld_type,
		      `SPARC_CORE3.`LSU_PATH.qctl2.cpx_st_ack_type |
		      `SPARC_CORE3.`LSU_PATH.qctl2.cpx_strm_st_ack_type,
		      i4_3_st_wr_dcache_w,
		      i4_3_dcache_fill_addr_w[9:0],
		      i4_3_dva_svld_w,
		      i4_3_dva_snp_addr_w[4:0],
		      i4_3_dva_snp_set_vld_w[3:0],
		      i4_3_dva_snp_wy3_w[1:0],
		      i4_3_dva_snp_wy2_w[1:0],
		      i4_3_dva_snp_wy1_w[1:0],
		      i4_3_dva_snp_wy0_w[1:0]};
   assign i4_3_rdy =
		     (i4_3_itlb_repl_vld |
		      i4_3_dtlb_repl_vld |
		      i4_3_fprs_set_w[0] |
		      i4_3_fprs_set_w[1] |
		      i4_3_fprs_set_w[2] |
		      i4_3_fprs_set_w[3] |
		      i4_3_tick_match[0] |
		      i4_3_tick_match[1] |
		      i4_3_tick_match[2] |
		      i4_3_tick_match[3] |
		      i4_3_stick_match[0] |
		      i4_3_stick_match[1] |
		      i4_3_stick_match[2] |
		      i4_3_stick_match[3] |
		      i4_3_hstick_match[0] |
		      i4_3_hstick_match[1] |
		      i4_3_hstick_match[2] |
		      i4_3_hstick_match[3] |
		      i4_3_ld_int[0] |
		      i4_3_ld_int[1] |
		      i4_3_ld_int[2] |
		      i4_3_ld_int[3] |
		      `SPARC_CORE3.sparc0.spu_ifu_ttype_vld_w2 |
		      i4_3_spu_illgl_va |
		      i4_3_spu_trap_ack_w |
		      i4_3_immu_miss | i4_3_dmmu_miss |
		      i4_3_rstint_vld_w | i4_3_hwint_vld_w |
		      i4_3_sftint_vld_w | i4_3_hint_w |
		      `SPARC_CORE3.`LSU_PATH.qctl2.cpx_ifill_type |
		      `SPARC_CORE3.`LSU_PATH.qctl2.cpx_ld_type  |
		      `SPARC_CORE3.`LSU_PATH.qctl2.cpx_st_ack_type  |
		      `SPARC_CORE3.`LSU_PATH.qctl2.cpx_strm_st_ack_type |
		      i4_3_ic_inv_vld_s |
		      i4_3_st_wr_dcache_w |
		      i4_3_fill_dcache_w |
		      i4_3_dva_svld_w);
`endif // ifdef RTL_SPARC3

`ifdef RTL_SPARC4
   assign i4_4_data =
		     {1'b0,
		      1'b0,
		      1'b0,
		      `SPARC_CORE4.sparc0.spu_lsu_ldxa_tid_w2[1:0],
`ifndef RTL_SPU
              `SPARC_CORE4.sparc0.tlu.tlu.tcl.sftintctr[1:0],
`else
		      `SPARC_CORE4.sparc0.tlu.tcl.sftintctr[1:0],
`endif
		      i4_4_tlb_repl_idx[5:0],
`ifndef RTL_SPU
              `SPARC_CORE4.sparc0.tlu.tlu.mmu_ctl.tlb_access_tid_g[1:0],
`else
		      `SPARC_CORE4.sparc0.tlu.mmu_ctl.tlb_access_tid_g[1:0],
`endif
		      i4_4_itlb_repl_vld,
		      i4_4_dtlb_repl_vld,
		      i4_4_spu_illgl_va,
		      i4_4_ld_int[3:0],
   		      i4_4_hstick_match[3:0],
		      i4_4_stick_match[3:0],
		      i4_4_tick_match[3:0],
		      i4_4_hint_vld_w,
		      i4_4_sftint_vld_w,
		      i4_4_hwint_vld_w,
		      i4_4_rstint_vld_w,
		      i4_4_int_thr_w[3:0],
		      i4_4_spu_trap_ack_w,
		      i4_4_fill_dcache_w,
		      `SPARC_CORE4.sparc0.spu_ifu_ttype_vld_w2,
		      `SPARC_CORE4.sparc0.spu_ifu_ttype_w2,
		      `SPARC_CORE4.sparc0.spu_ifu_ttype_tid_w2[1:0],
		      i4_4_immu_miss,
		      i4_4_dmmu_miss,
`ifndef RTL_SPU
              `SPARC_CORE4.sparc0.tlu.tlu.tcl.trap_tid_g[1:0],
`else
		      `SPARC_CORE4.sparc0.tlu.tcl.trap_tid_g[1:0],
`endif
		      i4_4_fprs_set_w[3:0],
		      i4_4_new_fprs_w[1:0],
		      `SPARC_CORE4.`LSU_PATH.qctl2.cpx_st_ack_tid0,
		      `SPARC_CORE4.`LSU_PATH.qctl2.cpx_st_ack_tid1,
		      `SPARC_CORE4.`LSU_PATH.qctl2.cpx_st_ack_tid2,
		      `SPARC_CORE4.`LSU_PATH.qctl2.cpx_st_ack_tid3,
		      i4_4_cpx_tid[1:0],
		      i4_4_ic_inv_vld_s,
		      i4_4_ic_inv_addr_s[5:0],
		      i4_4_ic_inv_word1_s,
		      i4_4_ic_inv_word0_s,
		      i4_4_ic_inv_way1_s[1:0],
		      i4_4_ic_inv_way0_s[1:0],
		      `SPARC_CORE4.`LSU_PATH.qctl2.cpx_ifill_type,
		      `SPARC_CORE4.`LSU_PATH.qctl2.cpx_ld_type,
		      `SPARC_CORE4.`LSU_PATH.qctl2.cpx_st_ack_type |
		      `SPARC_CORE4.`LSU_PATH.qctl2.cpx_strm_st_ack_type,
		      i4_4_st_wr_dcache_w,
		      i4_4_dcache_fill_addr_w[9:0],
		      i4_4_dva_svld_w,
		      i4_4_dva_snp_addr_w[4:0],
		      i4_4_dva_snp_set_vld_w[3:0],
		      i4_4_dva_snp_wy3_w[1:0],
		      i4_4_dva_snp_wy2_w[1:0],
		      i4_4_dva_snp_wy1_w[1:0],
		      i4_4_dva_snp_wy0_w[1:0]};
   assign i4_4_rdy =
		     (i4_4_itlb_repl_vld |
		      i4_4_dtlb_repl_vld |
		      i4_4_fprs_set_w[0] |
		      i4_4_fprs_set_w[1] |
		      i4_4_fprs_set_w[2] |
		      i4_4_fprs_set_w[3] |
		      i4_4_tick_match[0] |
		      i4_4_tick_match[1] |
		      i4_4_tick_match[2] |
		      i4_4_tick_match[3] |
		      i4_4_stick_match[0] |
		      i4_4_stick_match[1] |
		      i4_4_stick_match[2] |
		      i4_4_stick_match[3] |
		      i4_4_hstick_match[0] |
		      i4_4_hstick_match[1] |
		      i4_4_hstick_match[2] |
		      i4_4_hstick_match[3] |
		      i4_4_ld_int[0] |
		      i4_4_ld_int[1] |
		      i4_4_ld_int[2] |
		      i4_4_ld_int[3] |
		      `SPARC_CORE4.sparc0.spu_ifu_ttype_vld_w2 |
		      i4_4_spu_illgl_va |
		      i4_4_spu_trap_ack_w |
		      i4_4_immu_miss | i4_4_dmmu_miss |
		      i4_4_rstint_vld_w | i4_4_hwint_vld_w |
		      i4_4_sftint_vld_w | i4_4_hint_w |
		      `SPARC_CORE4.`LSU_PATH.qctl2.cpx_ifill_type |
		      `SPARC_CORE4.`LSU_PATH.qctl2.cpx_ld_type  |
		      `SPARC_CORE4.`LSU_PATH.qctl2.cpx_st_ack_type  |
		      `SPARC_CORE4.`LSU_PATH.qctl2.cpx_strm_st_ack_type |
		      i4_4_ic_inv_vld_s |
		      i4_4_st_wr_dcache_w |
		      i4_4_fill_dcache_w |
		      i4_4_dva_svld_w);
`endif // ifdef RTL_SPARC4

`ifdef RTL_SPARC5
   assign i4_5_data =
		     {1'b0,
		      1'b0,
		      1'b0,
		      `SPARC_CORE5.sparc0.spu_lsu_ldxa_tid_w2[1:0],
`ifndef RTL_SPU
              `SPARC_CORE5.sparc0.tlu.tlu.tcl.sftintctr[1:0],
`else
		      `SPARC_CORE5.sparc0.tlu.tcl.sftintctr[1:0],
`endif
		      i4_5_tlb_repl_idx[5:0],
`ifndef RTL_SPU
              `SPARC_CORE5.sparc0.tlu.tlu.mmu_ctl.tlb_access_tid_g[1:0],
`else
		      `SPARC_CORE5.sparc0.tlu.mmu_ctl.tlb_access_tid_g[1:0],
`endif
		      i4_5_itlb_repl_vld,
		      i4_5_dtlb_repl_vld,
		      i4_5_spu_illgl_va,
		      i4_5_ld_int[3:0],
   		      i4_5_hstick_match[3:0],
		      i4_5_stick_match[3:0],
		      i4_5_tick_match[3:0],
		      i4_5_hint_vld_w,
		      i4_5_sftint_vld_w,
		      i4_5_hwint_vld_w,
		      i4_5_rstint_vld_w,
		      i4_5_int_thr_w[3:0],
		      i4_5_spu_trap_ack_w,
		      i4_5_fill_dcache_w,
		      `SPARC_CORE5.sparc0.spu_ifu_ttype_vld_w2,
		      `SPARC_CORE5.sparc0.spu_ifu_ttype_w2,
		      `SPARC_CORE5.sparc0.spu_ifu_ttype_tid_w2[1:0],
		      i4_5_immu_miss,
		      i4_5_dmmu_miss,
`ifndef RTL_SPU
              `SPARC_CORE5.sparc0.tlu.tlu.tcl.trap_tid_g[1:0],
`else
		      `SPARC_CORE5.sparc0.tlu.tcl.trap_tid_g[1:0],
`endif
		      i4_5_fprs_set_w[3:0],
		      i4_5_new_fprs_w[1:0],
		      `SPARC_CORE5.`LSU_PATH.qctl2.cpx_st_ack_tid0,
		      `SPARC_CORE5.`LSU_PATH.qctl2.cpx_st_ack_tid1,
		      `SPARC_CORE5.`LSU_PATH.qctl2.cpx_st_ack_tid2,
		      `SPARC_CORE5.`LSU_PATH.qctl2.cpx_st_ack_tid3,
		      i4_5_cpx_tid[1:0],
		      i4_5_ic_inv_vld_s,
		      i4_5_ic_inv_addr_s[5:0],
		      i4_5_ic_inv_word1_s,
		      i4_5_ic_inv_word0_s,
		      i4_5_ic_inv_way1_s[1:0],
		      i4_5_ic_inv_way0_s[1:0],
		      `SPARC_CORE5.`LSU_PATH.qctl2.cpx_ifill_type,
		      `SPARC_CORE5.`LSU_PATH.qctl2.cpx_ld_type,
		      `SPARC_CORE5.`LSU_PATH.qctl2.cpx_st_ack_type |
		      `SPARC_CORE5.`LSU_PATH.qctl2.cpx_strm_st_ack_type,
		      i4_5_st_wr_dcache_w,
		      i4_5_dcache_fill_addr_w[9:0],
		      i4_5_dva_svld_w,
		      i4_5_dva_snp_addr_w[4:0],
		      i4_5_dva_snp_set_vld_w[3:0],
		      i4_5_dva_snp_wy3_w[1:0],
		      i4_5_dva_snp_wy2_w[1:0],
		      i4_5_dva_snp_wy1_w[1:0],
		      i4_5_dva_snp_wy0_w[1:0]};
   assign i4_5_rdy =
		     (i4_5_itlb_repl_vld |
		      i4_5_dtlb_repl_vld |
		      i4_5_fprs_set_w[0] |
		      i4_5_fprs_set_w[1] |
		      i4_5_fprs_set_w[2] |
		      i4_5_fprs_set_w[3] |
		      i4_5_tick_match[0] |
		      i4_5_tick_match[1] |
		      i4_5_tick_match[2] |
		      i4_5_tick_match[3] |
		      i4_5_stick_match[0] |
		      i4_5_stick_match[1] |
		      i4_5_stick_match[2] |
		      i4_5_stick_match[3] |
		      i4_5_hstick_match[0] |
		      i4_5_hstick_match[1] |
		      i4_5_hstick_match[2] |
		      i4_5_hstick_match[3] |
		      i4_5_ld_int[0] |
		      i4_5_ld_int[1] |
		      i4_5_ld_int[2] |
		      i4_5_ld_int[3] |
		      `SPARC_CORE5.sparc0.spu_ifu_ttype_vld_w2 |
		      i4_5_spu_illgl_va |
		      i4_5_spu_trap_ack_w |
		      i4_5_immu_miss | i4_5_dmmu_miss |
		      i4_5_rstint_vld_w | i4_5_hwint_vld_w |
		      i4_5_sftint_vld_w | i4_5_hint_w |
		      `SPARC_CORE5.`LSU_PATH.qctl2.cpx_ifill_type |
		      `SPARC_CORE5.`LSU_PATH.qctl2.cpx_ld_type  |
		      `SPARC_CORE5.`LSU_PATH.qctl2.cpx_st_ack_type  |
		      `SPARC_CORE5.`LSU_PATH.qctl2.cpx_strm_st_ack_type |
		      i4_5_ic_inv_vld_s |
		      i4_5_st_wr_dcache_w |
		      i4_5_fill_dcache_w |
		      i4_5_dva_svld_w);
`endif // ifdef RTL_SPARC5

`ifdef RTL_SPARC6
   assign i4_6_data =
		     {1'b0,
		      1'b0,
		      1'b0,
		      `SPARC_CORE6.sparc0.spu_lsu_ldxa_tid_w2[1:0],
`ifndef RTL_SPU
              `SPARC_CORE6.sparc0.tlu.tlu.tcl.sftintctr[1:0],
`else
		      `SPARC_CORE6.sparc0.tlu.tcl.sftintctr[1:0],
`endif
		      i4_6_tlb_repl_idx[5:0],
`ifndef RTL_SPU
              `SPARC_CORE6.sparc0.tlu.tlu.mmu_ctl.tlb_access_tid_g[1:0],
`else
		      `SPARC_CORE6.sparc0.tlu.mmu_ctl.tlb_access_tid_g[1:0],
`endif
		      i4_6_itlb_repl_vld,
		      i4_6_dtlb_repl_vld,
		      i4_6_spu_illgl_va,
		      i4_6_ld_int[3:0],
   		      i4_6_hstick_match[3:0],
		      i4_6_stick_match[3:0],
		      i4_6_tick_match[3:0],
		      i4_6_hint_vld_w,
		      i4_6_sftint_vld_w,
		      i4_6_hwint_vld_w,
		      i4_6_rstint_vld_w,
		      i4_6_int_thr_w[3:0],
		      i4_6_spu_trap_ack_w,
		      i4_6_fill_dcache_w,
		      `SPARC_CORE6.sparc0.spu_ifu_ttype_vld_w2,
		      `SPARC_CORE6.sparc0.spu_ifu_ttype_w2,
		      `SPARC_CORE6.sparc0.spu_ifu_ttype_tid_w2[1:0],
		      i4_6_immu_miss,
		      i4_6_dmmu_miss,
`ifndef RTL_SPU
              `SPARC_CORE6.sparc0.tlu.tlu.tcl.trap_tid_g[1:0],
`else
		      `SPARC_CORE6.sparc0.tlu.tcl.trap_tid_g[1:0],
`endif
		      i4_6_fprs_set_w[3:0],
		      i4_6_new_fprs_w[1:0],
		      `SPARC_CORE6.`LSU_PATH.qctl2.cpx_st_ack_tid0,
		      `SPARC_CORE6.`LSU_PATH.qctl2.cpx_st_ack_tid1,
		      `SPARC_CORE6.`LSU_PATH.qctl2.cpx_st_ack_tid2,
		      `SPARC_CORE6.`LSU_PATH.qctl2.cpx_st_ack_tid3,
		      i4_6_cpx_tid[1:0],
		      i4_6_ic_inv_vld_s,
		      i4_6_ic_inv_addr_s[5:0],
		      i4_6_ic_inv_word1_s,
		      i4_6_ic_inv_word0_s,
		      i4_6_ic_inv_way1_s[1:0],
		      i4_6_ic_inv_way0_s[1:0],
		      `SPARC_CORE6.`LSU_PATH.qctl2.cpx_ifill_type,
		      `SPARC_CORE6.`LSU_PATH.qctl2.cpx_ld_type,
		      `SPARC_CORE6.`LSU_PATH.qctl2.cpx_st_ack_type |
		      `SPARC_CORE6.`LSU_PATH.qctl2.cpx_strm_st_ack_type,
		      i4_6_st_wr_dcache_w,
		      i4_6_dcache_fill_addr_w[9:0],
		      i4_6_dva_svld_w,
		      i4_6_dva_snp_addr_w[4:0],
		      i4_6_dva_snp_set_vld_w[3:0],
		      i4_6_dva_snp_wy3_w[1:0],
		      i4_6_dva_snp_wy2_w[1:0],
		      i4_6_dva_snp_wy1_w[1:0],
		      i4_6_dva_snp_wy0_w[1:0]};
   assign i4_6_rdy =
		     (i4_6_itlb_repl_vld |
		      i4_6_dtlb_repl_vld |
		      i4_6_fprs_set_w[0] |
		      i4_6_fprs_set_w[1] |
		      i4_6_fprs_set_w[2] |
		      i4_6_fprs_set_w[3] |
		      i4_6_tick_match[0] |
		      i4_6_tick_match[1] |
		      i4_6_tick_match[2] |
		      i4_6_tick_match[3] |
		      i4_6_stick_match[0] |
		      i4_6_stick_match[1] |
		      i4_6_stick_match[2] |
		      i4_6_stick_match[3] |
		      i4_6_hstick_match[0] |
		      i4_6_hstick_match[1] |
		      i4_6_hstick_match[2] |
		      i4_6_hstick_match[3] |
		      i4_6_ld_int[0] |
		      i4_6_ld_int[1] |
		      i4_6_ld_int[2] |
		      i4_6_ld_int[3] |
		      `SPARC_CORE6.sparc0.spu_ifu_ttype_vld_w2 |
		      i4_6_spu_illgl_va |
		      i4_6_spu_trap_ack_w |
		      i4_6_immu_miss | i4_6_dmmu_miss |
		      i4_6_rstint_vld_w | i4_6_hwint_vld_w |
		      i4_6_sftint_vld_w | i4_6_hint_w |
		      `SPARC_CORE6.`LSU_PATH.qctl2.cpx_ifill_type |
		      `SPARC_CORE6.`LSU_PATH.qctl2.cpx_ld_type  |
		      `SPARC_CORE6.`LSU_PATH.qctl2.cpx_st_ack_type  |
		      `SPARC_CORE6.`LSU_PATH.qctl2.cpx_strm_st_ack_type |
		      i4_6_ic_inv_vld_s |
		      i4_6_st_wr_dcache_w |
		      i4_6_fill_dcache_w |
		      i4_6_dva_svld_w);
`endif // ifdef RTL_SPARC6

`ifdef RTL_SPARC7
   assign i4_7_data =
		     {1'b0,
		      1'b0,
		      1'b0,
		      `SPARC_CORE7.sparc0.spu_lsu_ldxa_tid_w2[1:0],
`ifndef RTL_SPU
              `SPARC_CORE7.sparc0.tlu.tlu.tcl.sftintctr[1:0],
`else
		      `SPARC_CORE7.sparc0.tlu.tcl.sftintctr[1:0],
`endif
		      i4_7_tlb_repl_idx[5:0],
`ifndef RTL_SPU
              `SPARC_CORE7.sparc0.tlu.tlu.mmu_ctl.tlb_access_tid_g[1:0],
`else
		      `SPARC_CORE7.sparc0.tlu.mmu_ctl.tlb_access_tid_g[1:0],
`endif
		      i4_7_itlb_repl_vld,
		      i4_7_dtlb_repl_vld,
		      i4_7_spu_illgl_va,
		      i4_7_ld_int[3:0],
   		      i4_7_hstick_match[3:0],
		      i4_7_stick_match[3:0],
		      i4_7_tick_match[3:0],
		      i4_7_hint_vld_w,
		      i4_7_sftint_vld_w,
		      i4_7_hwint_vld_w,
		      i4_7_rstint_vld_w,
		      i4_7_int_thr_w[3:0],
		      i4_7_spu_trap_ack_w,
		      i4_7_fill_dcache_w,
		      `SPARC_CORE7.sparc0.spu_ifu_ttype_vld_w2,
		      `SPARC_CORE7.sparc0.spu_ifu_ttype_w2,
		      `SPARC_CORE7.sparc0.spu_ifu_ttype_tid_w2[1:0],
		      i4_7_immu_miss,
		      i4_7_dmmu_miss,
`ifndef RTL_SPU
              `SPARC_CORE7.sparc0.tlu.tlu.tcl.trap_tid_g[1:0],
`else
		      `SPARC_CORE7.sparc0.tlu.tcl.trap_tid_g[1:0],
`endif
		      i4_7_fprs_set_w[3:0],
		      i4_7_new_fprs_w[1:0],
		      `SPARC_CORE7.`LSU_PATH.qctl2.cpx_st_ack_tid0,
		      `SPARC_CORE7.`LSU_PATH.qctl2.cpx_st_ack_tid1,
		      `SPARC_CORE7.`LSU_PATH.qctl2.cpx_st_ack_tid2,
		      `SPARC_CORE7.`LSU_PATH.qctl2.cpx_st_ack_tid3,
		      i4_7_cpx_tid[1:0],
		      i4_7_ic_inv_vld_s,
		      i4_7_ic_inv_addr_s[5:0],
		      i4_7_ic_inv_word1_s,
		      i4_7_ic_inv_word0_s,
		      i4_7_ic_inv_way1_s[1:0],
		      i4_7_ic_inv_way0_s[1:0],
		      `SPARC_CORE7.`LSU_PATH.qctl2.cpx_ifill_type,
		      `SPARC_CORE7.`LSU_PATH.qctl2.cpx_ld_type,
		      `SPARC_CORE7.`LSU_PATH.qctl2.cpx_st_ack_type |
		      `SPARC_CORE7.`LSU_PATH.qctl2.cpx_strm_st_ack_type,
		      i4_7_st_wr_dcache_w,
		      i4_7_dcache_fill_addr_w[9:0],
		      i4_7_dva_svld_w,
		      i4_7_dva_snp_addr_w[4:0],
		      i4_7_dva_snp_set_vld_w[3:0],
		      i4_7_dva_snp_wy3_w[1:0],
		      i4_7_dva_snp_wy2_w[1:0],
		      i4_7_dva_snp_wy1_w[1:0],
		      i4_7_dva_snp_wy0_w[1:0]};
   assign i4_7_rdy =
		     (i4_7_itlb_repl_vld |
		      i4_7_dtlb_repl_vld |
		      i4_7_fprs_set_w[0] |
		      i4_7_fprs_set_w[1] |
		      i4_7_fprs_set_w[2] |
		      i4_7_fprs_set_w[3] |
		      i4_7_tick_match[0] |
		      i4_7_tick_match[1] |
		      i4_7_tick_match[2] |
		      i4_7_tick_match[3] |
		      i4_7_stick_match[0] |
		      i4_7_stick_match[1] |
		      i4_7_stick_match[2] |
		      i4_7_stick_match[3] |
		      i4_7_hstick_match[0] |
		      i4_7_hstick_match[1] |
		      i4_7_hstick_match[2] |
		      i4_7_hstick_match[3] |
		      i4_7_ld_int[0] |
		      i4_7_ld_int[1] |
		      i4_7_ld_int[2] |
		      i4_7_ld_int[3] |
		      `SPARC_CORE7.sparc0.spu_ifu_ttype_vld_w2 |
		      i4_7_spu_illgl_va |
		      i4_7_spu_trap_ack_w |
		      i4_7_immu_miss | i4_7_dmmu_miss |
		      i4_7_rstint_vld_w | i4_7_hwint_vld_w |
		      i4_7_sftint_vld_w | i4_7_hint_w |
		      `SPARC_CORE7.`LSU_PATH.qctl2.cpx_ifill_type |
		      `SPARC_CORE7.`LSU_PATH.qctl2.cpx_ld_type  |
		      `SPARC_CORE7.`LSU_PATH.qctl2.cpx_st_ack_type  |
		      `SPARC_CORE7.`LSU_PATH.qctl2.cpx_strm_st_ack_type |
		      i4_7_ic_inv_vld_s |
		      i4_7_st_wr_dcache_w |
		      i4_7_fill_dcache_w |
		      i4_7_dva_svld_w);
`endif // ifdef RTL_SPARC7


`endif // ifdef SAS_DISABLE

`ifdef ENV_SPARC1
   assign i4_1_data = 'h0;
   assign i4_1_rdy  = 'h0;
`endif // !ifdef RTL_SPARC1

`ifdef ENV_SPARC2
   assign i4_2_data = 'h0;
   assign i4_2_rdy  = 'h0;
`endif // !ifdef RTL_SPARC2

`ifdef ENV_SPARC3
   assign i4_3_data = 'h0;
   assign i4_3_rdy  = 'h0;
`endif // !ifdef RTL_SPARC3

`ifdef ENV_SPARC4
   assign i4_4_data = 'h0;
   assign i4_4_rdy  = 'h0;
`endif // !ifdef RTL_SPARC4

`ifdef ENV_SPARC5
   assign i4_5_data = 'h0;
   assign i4_5_rdy  = 'h0;
`endif // !ifdef RTL_SPARC5

`ifdef ENV_SPARC6
   assign i4_6_data = 'h0;
   assign i4_6_rdy  = 'h0;
`endif // !ifdef RTL_SPARC6

`ifdef ENV_SPARC7
   assign i4_7_data = 'h0;
   assign i4_7_rdy  = 'h0;
`endif // !ifdef RTL_SPARC7


`ifdef SAS_DISABLE
`else

`ifdef RTL_SPARC0
`ifndef RTL_SPU
   assign i5_0_data =
             {1'b0,
              1'b0,
              `SPARC_CORE0.sparc0.ifu.ifu.fcl.fcl_ifq_icmiss_s1,
              `SPARC_CORE0.sparc0.ifu.ifu.fcl.fcl_ifq_thr_s1[1:0],
              `SPARC_CORE0.sparc0.ifu.ifu.ifqdp.imiss_paddr_s};

   assign i5_0_rdy =
             ((`SPARC_CORE0.sparc0.ifu.ifu.fcl.rdreq_s1 &
               `SPARC_CORE0.sparc0.ifu.ifu.fcl.inst_vld_s1 &
               ~`SPARC_CORE0.sparc0.ifu.ifu.fcl.tlbmiss_s1_crit)|
              `SPARC_CORE0.sparc0.ifu.ifu.fcl.fcl_ifq_icmiss_s1); 
`else
   assign i5_0_data =
		     {1'b0,
		      1'b0,
		      `SPARC_CORE0.sparc0.ifu.fcl.fcl_ifq_icmiss_s1,
		      `SPARC_CORE0.sparc0.ifu.fcl.fcl_ifq_thr_s1[1:0],
		      `SPARC_CORE0.sparc0.ifu.ifqdp.imiss_paddr_s};

   assign i5_0_rdy =
		     ((`SPARC_CORE0.sparc0.ifu.fcl.rdreq_s1 &
		       `SPARC_CORE0.sparc0.ifu.fcl.inst_vld_s1 &
		       ~`SPARC_CORE0.sparc0.ifu.fcl.tlbmiss_s1_crit)|
		      `SPARC_CORE0.sparc0.ifu.fcl.fcl_ifq_icmiss_s1);
`endif             
`endif // ifdef RTL_SPARC0

`ifdef RTL_SPARC1
`ifndef RTL_SPU
   assign i5_1_data =
             {1'b0,
              1'b0,
              `SPARC_CORE1.sparc0.ifu.ifu.fcl.fcl_ifq_icmiss_s1,
              `SPARC_CORE1.sparc0.ifu.ifu.fcl.fcl_ifq_thr_s1[1:0],
              `SPARC_CORE1.sparc0.ifu.ifu.ifqdp.imiss_paddr_s};

   assign i5_1_rdy =
             ((`SPARC_CORE1.sparc0.ifu.ifu.fcl.rdreq_s1 &
               `SPARC_CORE1.sparc0.ifu.ifu.fcl.inst_vld_s1 &
               ~`SPARC_CORE1.sparc0.ifu.ifu.fcl.tlbmiss_s1_crit)|
              `SPARC_CORE1.sparc0.ifu.ifu.fcl.fcl_ifq_icmiss_s1);
`else
   assign i5_1_data =
		     {1'b0,
		      1'b0,
		      `SPARC_CORE1.sparc0.ifu.fcl.fcl_ifq_icmiss_s1,
		      `SPARC_CORE1.sparc0.ifu.fcl.fcl_ifq_thr_s1[1:0],
		      `SPARC_CORE1.sparc0.ifu.ifqdp.imiss_paddr_s};

   assign i5_1_rdy =
		     ((`SPARC_CORE1.sparc0.ifu.fcl.rdreq_s1 &
		       `SPARC_CORE1.sparc0.ifu.fcl.inst_vld_s1 &
		       ~`SPARC_CORE1.sparc0.ifu.fcl.tlbmiss_s1_crit)|
		      `SPARC_CORE1.sparc0.ifu.fcl.fcl_ifq_icmiss_s1);
`endif
`endif // ifdef RTL_SPARC1

`ifdef RTL_SPARC2
`ifndef RTL_SPU
   assign i5_2_data =
             {1'b0,
              1'b0,
              `SPARC_CORE2.sparc0.ifu.ifu.fcl.fcl_ifq_icmiss_s1,
              `SPARC_CORE2.sparc0.ifu.ifu.fcl.fcl_ifq_thr_s1[1:0],
              `SPARC_CORE2.sparc0.ifu.ifu.ifqdp.imiss_paddr_s};

   assign i5_2_rdy =
             ((`SPARC_CORE2.sparc0.ifu.ifu.fcl.rdreq_s1 &
               `SPARC_CORE2.sparc0.ifu.ifu.fcl.inst_vld_s1 &
               ~`SPARC_CORE2.sparc0.ifu.ifu.fcl.tlbmiss_s1_crit)|
              `SPARC_CORE2.sparc0.ifu.ifu.fcl.fcl_ifq_icmiss_s1);
`else
   assign i5_2_data =
		     {1'b0,
		      1'b0,
		      `SPARC_CORE2.sparc0.ifu.fcl.fcl_ifq_icmiss_s1,
		      `SPARC_CORE2.sparc0.ifu.fcl.fcl_ifq_thr_s1[1:0],
		      `SPARC_CORE2.sparc0.ifu.ifqdp.imiss_paddr_s};

   assign i5_2_rdy =
		     ((`SPARC_CORE2.sparc0.ifu.fcl.rdreq_s1 &
		       `SPARC_CORE2.sparc0.ifu.fcl.inst_vld_s1 &
		       ~`SPARC_CORE2.sparc0.ifu.fcl.tlbmiss_s1_crit)|
		      `SPARC_CORE2.sparc0.ifu.fcl.fcl_ifq_icmiss_s1);
`endif
`endif // ifdef RTL_SPARC2

`ifdef RTL_SPARC3
`ifndef RTL_SPU
   assign i5_3_data =
             {1'b0,
              1'b0,
              `SPARC_CORE3.sparc0.ifu.ifu.fcl.fcl_ifq_icmiss_s1,
              `SPARC_CORE3.sparc0.ifu.ifu.fcl.fcl_ifq_thr_s1[1:0],
              `SPARC_CORE3.sparc0.ifu.ifu.ifqdp.imiss_paddr_s};

   assign i5_3_rdy =
             ((`SPARC_CORE3.sparc0.ifu.ifu.fcl.rdreq_s1 &
               `SPARC_CORE3.sparc0.ifu.ifu.fcl.inst_vld_s1 &
               ~`SPARC_CORE3.sparc0.ifu.ifu.fcl.tlbmiss_s1_crit)|
              `SPARC_CORE3.sparc0.ifu.ifu.fcl.fcl_ifq_icmiss_s1);
`else
   assign i5_3_data =
		     {1'b0,
		      1'b0,
		      `SPARC_CORE3.sparc0.ifu.fcl.fcl_ifq_icmiss_s1,
		      `SPARC_CORE3.sparc0.ifu.fcl.fcl_ifq_thr_s1[1:0],
		      `SPARC_CORE3.sparc0.ifu.ifqdp.imiss_paddr_s};

   assign i5_3_rdy =
		     ((`SPARC_CORE3.sparc0.ifu.fcl.rdreq_s1 &
		       `SPARC_CORE3.sparc0.ifu.fcl.inst_vld_s1 &
		       ~`SPARC_CORE3.sparc0.ifu.fcl.tlbmiss_s1_crit)|
		      `SPARC_CORE3.sparc0.ifu.fcl.fcl_ifq_icmiss_s1);
`endif
`endif // ifdef RTL_SPARC3

`ifdef RTL_SPARC4
`ifndef RTL_SPU
   assign i5_4_data =
             {1'b0,
              1'b0,
              `SPARC_CORE4.sparc0.ifu.ifu.fcl.fcl_ifq_icmiss_s1,
              `SPARC_CORE4.sparc0.ifu.ifu.fcl.fcl_ifq_thr_s1[1:0],
              `SPARC_CORE4.sparc0.ifu.ifu.ifqdp.imiss_paddr_s};

   assign i5_4_rdy =
             ((`SPARC_CORE4.sparc0.ifu.ifu.fcl.rdreq_s1 &
               `SPARC_CORE4.sparc0.ifu.ifu.fcl.inst_vld_s1 &
               ~`SPARC_CORE4.sparc0.ifu.ifu.fcl.tlbmiss_s1_crit)|
              `SPARC_CORE4.sparc0.ifu.ifu.fcl.fcl_ifq_icmiss_s1);
`else
   assign i5_4_data =
		     {1'b0,
		      1'b0,
		      `SPARC_CORE4.sparc0.ifu.fcl.fcl_ifq_icmiss_s1,
		      `SPARC_CORE4.sparc0.ifu.fcl.fcl_ifq_thr_s1[1:0],
		      `SPARC_CORE4.sparc0.ifu.ifqdp.imiss_paddr_s};

   assign i5_4_rdy =
		     ((`SPARC_CORE4.sparc0.ifu.fcl.rdreq_s1 &
		       `SPARC_CORE4.sparc0.ifu.fcl.inst_vld_s1 &
		       ~`SPARC_CORE4.sparc0.ifu.fcl.tlbmiss_s1_crit)|
		      `SPARC_CORE4.sparc0.ifu.fcl.fcl_ifq_icmiss_s1);
`endif
`endif // ifdef RTL_SPARC4

`ifdef RTL_SPARC5
`ifndef RTL_SPU
   assign i5_5_data =
             {1'b0,
              1'b0,
              `SPARC_CORE5.sparc0.ifu.ifu.fcl.fcl_ifq_icmiss_s1,
              `SPARC_CORE5.sparc0.ifu.ifu.fcl.fcl_ifq_thr_s1[1:0],
              `SPARC_CORE5.sparc0.ifu.ifu.ifqdp.imiss_paddr_s};

   assign i5_5_rdy =
             ((`SPARC_CORE5.sparc0.ifu.ifu.fcl.rdreq_s1 &
               `SPARC_CORE5.sparc0.ifu.ifu.fcl.inst_vld_s1 &
               ~`SPARC_CORE5.sparc0.ifu.ifu.fcl.tlbmiss_s1_crit)|
              `SPARC_CORE5.sparc0.ifu.ifu.fcl.fcl_ifq_icmiss_s1);
`else
   assign i5_5_data =
		     {1'b0,
		      1'b0,
		      `SPARC_CORE5.sparc0.ifu.fcl.fcl_ifq_icmiss_s1,
		      `SPARC_CORE5.sparc0.ifu.fcl.fcl_ifq_thr_s1[1:0],
		      `SPARC_CORE5.sparc0.ifu.ifqdp.imiss_paddr_s};

   assign i5_5_rdy =
		     ((`SPARC_CORE5.sparc0.ifu.fcl.rdreq_s1 &
		       `SPARC_CORE5.sparc0.ifu.fcl.inst_vld_s1 &
		       ~`SPARC_CORE5.sparc0.ifu.fcl.tlbmiss_s1_crit)|
		      `SPARC_CORE5.sparc0.ifu.fcl.fcl_ifq_icmiss_s1);
`endif
`endif // ifdef RTL_SPARC5

`ifdef RTL_SPARC6
`ifndef RTL_SPU
   assign i5_6_data =
             {1'b0,
              1'b0,
              `SPARC_CORE6.sparc0.ifu.ifu.fcl.fcl_ifq_icmiss_s1,
              `SPARC_CORE6.sparc0.ifu.ifu.fcl.fcl_ifq_thr_s1[1:0],
              `SPARC_CORE6.sparc0.ifu.ifu.ifqdp.imiss_paddr_s};

   assign i5_6_rdy =
             ((`SPARC_CORE6.sparc0.ifu.ifu.fcl.rdreq_s1 &
               `SPARC_CORE6.sparc0.ifu.ifu.fcl.inst_vld_s1 &
               ~`SPARC_CORE6.sparc0.ifu.ifu.fcl.tlbmiss_s1_crit)|
              `SPARC_CORE6.sparc0.ifu.ifu.fcl.fcl_ifq_icmiss_s1);
`else
   assign i5_6_data =
		     {1'b0,
		      1'b0,
		      `SPARC_CORE6.sparc0.ifu.fcl.fcl_ifq_icmiss_s1,
		      `SPARC_CORE6.sparc0.ifu.fcl.fcl_ifq_thr_s1[1:0],
		      `SPARC_CORE6.sparc0.ifu.ifqdp.imiss_paddr_s};

   assign i5_6_rdy =
		     ((`SPARC_CORE6.sparc0.ifu.fcl.rdreq_s1 &
		       `SPARC_CORE6.sparc0.ifu.fcl.inst_vld_s1 &
		       ~`SPARC_CORE6.sparc0.ifu.fcl.tlbmiss_s1_crit)|
		      `SPARC_CORE6.sparc0.ifu.fcl.fcl_ifq_icmiss_s1);
`endif
`endif // ifdef RTL_SPARC6

`ifdef RTL_SPARC7
`ifndef RTL_SPU
   assign i5_7_data =
             {1'b0,
              1'b0,
              `SPARC_CORE7.sparc0.ifu.ifu.fcl.fcl_ifq_icmiss_s1,
              `SPARC_CORE7.sparc0.ifu.ifu.fcl.fcl_ifq_thr_s1[1:0],
              `SPARC_CORE7.sparc0.ifu.ifu.ifqdp.imiss_paddr_s};

   assign i5_7_rdy =
             ((`SPARC_CORE7.sparc0.ifu.ifu.fcl.rdreq_s1 &
               `SPARC_CORE7.sparc0.ifu.ifu.fcl.inst_vld_s1 &
               ~`SPARC_CORE7.sparc0.ifu.ifu.fcl.tlbmiss_s1_crit)|
              `SPARC_CORE7.sparc0.ifu.ifu.fcl.fcl_ifq_icmiss_s1);
`else
   assign i5_7_data =
		     {1'b0,
		      1'b0,
		      `SPARC_CORE7.sparc0.ifu.fcl.fcl_ifq_icmiss_s1,
		      `SPARC_CORE7.sparc0.ifu.fcl.fcl_ifq_thr_s1[1:0],
		      `SPARC_CORE7.sparc0.ifu.ifqdp.imiss_paddr_s};

   assign i5_7_rdy =
		     ((`SPARC_CORE7.sparc0.ifu.fcl.rdreq_s1 &
		       `SPARC_CORE7.sparc0.ifu.fcl.inst_vld_s1 &
		       ~`SPARC_CORE7.sparc0.ifu.fcl.tlbmiss_s1_crit)|
		      `SPARC_CORE7.sparc0.ifu.fcl.fcl_ifq_icmiss_s1);
`endif
`endif // ifdef RTL_SPARC7


`endif // ifdef SAS_DISABLE

`ifdef ENV_SPARC1
   assign i5_1_data = 'h0;
   assign i5_1_rdy  = 'h0;
`endif // !ifdef RTL_SPARC1

`ifdef ENV_SPARC2
   assign i5_2_data = 'h0;
   assign i5_2_rdy  = 'h0;
`endif // !ifdef RTL_SPARC2

`ifdef ENV_SPARC3
   assign i5_3_data = 'h0;
   assign i5_3_rdy  = 'h0;
`endif // !ifdef RTL_SPARC3

`ifdef ENV_SPARC4
   assign i5_4_data = 'h0;
   assign i5_4_rdy  = 'h0;
`endif // !ifdef RTL_SPARC4

`ifdef ENV_SPARC5
   assign i5_5_data = 'h0;
   assign i5_5_rdy  = 'h0;
`endif // !ifdef RTL_SPARC5

`ifdef ENV_SPARC6
   assign i5_6_data = 'h0;
   assign i5_6_rdy  = 'h0;
`endif // !ifdef RTL_SPARC6

`ifdef ENV_SPARC7
   assign i5_7_data = 'h0;
   assign i5_7_rdy  = 'h0;
`endif // !ifdef RTL_SPARC7


   //send memory model data

   wire [`INTF0_WIDTH+2:0] local_i0_0_data = {3'b000,i0_0_data};
   wire                    local_i0_0_vld  = i0_0_rdy;
   wire [`INTF0_WIDTH+2:0] local_i0_1_data = {3'b001,i0_1_data};
   wire                    local_i0_1_vld  = i0_1_rdy;
   wire [`INTF0_WIDTH+2:0] local_i0_2_data = {3'b010,i0_2_data};
   wire                    local_i0_2_vld  = i0_2_rdy;
   wire [`INTF0_WIDTH+2:0] local_i0_3_data = {3'b011,i0_3_data};
   wire                    local_i0_3_vld  = i0_3_rdy;
   wire [`INTF0_WIDTH+2:0] local_i0_4_data = {3'b100,i0_4_data};
   wire                    local_i0_4_vld  = i0_4_rdy;
   wire [`INTF0_WIDTH+2:0] local_i0_5_data = {3'b101,i0_5_data};
   wire                    local_i0_5_vld  = i0_5_rdy;
   wire [`INTF0_WIDTH+2:0] local_i0_6_data = {3'b110,i0_6_data};
   wire                    local_i0_6_vld  = i0_6_rdy;
   wire [`INTF0_WIDTH+2:0] local_i0_7_data = {3'b111,i0_7_data};
   wire                    local_i0_7_vld  = i0_7_rdy;

   wire [`INTF1_WIDTH-1:0] local_i1_0_data = i1_0_data;
   wire                    local_i1_0_vld  = i1_0_rdy;
   wire [`INTF1_WIDTH-1:0] local_i1_1_data = i1_1_data;
   wire                    local_i1_1_vld  = i1_1_rdy;
   wire [`INTF1_WIDTH-1:0] local_i1_2_data = i1_2_data;
   wire                    local_i1_2_vld  = i1_2_rdy;
   wire [`INTF1_WIDTH-1:0] local_i1_3_data = i1_3_data;
   wire                    local_i1_3_vld  = i1_3_rdy;

   wire [`INTF2_WIDTH-1:0] local_i2_0_data = i2_0_data;
   wire                    local_i2_0_vld  = i2_0_rdy;
   wire [`INTF2_WIDTH-1:0] local_i2_1_data = i2_1_data;
   wire                    local_i2_1_vld  = i2_1_rdy;
   wire [`INTF2_WIDTH-1:0] local_i2_2_data = i2_2_data;
   wire                    local_i2_2_vld  = i2_2_rdy;
   wire [`INTF2_WIDTH-1:0] local_i2_3_data = i2_3_data;
   wire                    local_i2_3_vld  = i2_3_rdy;

   wire [`INTF3_WIDTH+2:0] local_i3_0_data = {3'b000,i3_0_data};
   wire                    local_i3_0_vld  = i3_0_rdy;
   wire [`INTF3_WIDTH+2:0] local_i3_1_data = {3'b001,i3_1_data};
   wire                    local_i3_1_vld  = i3_1_rdy;
   wire [`INTF3_WIDTH+2:0] local_i3_2_data = {3'b010,i3_2_data};
   wire                    local_i3_2_vld  = i3_2_rdy;
   wire [`INTF3_WIDTH+2:0] local_i3_3_data = {3'b011,i3_3_data};
   wire                    local_i3_3_vld  = i3_3_rdy;
   wire [`INTF3_WIDTH+2:0] local_i3_4_data = {3'b100,i3_4_data};
   wire                    local_i3_4_vld  = i3_4_rdy;
   wire [`INTF3_WIDTH+2:0] local_i3_5_data = {3'b101,i3_5_data};
   wire                    local_i3_5_vld  = i3_5_rdy;
   wire [`INTF3_WIDTH+2:0] local_i3_6_data = {3'b110,i3_6_data};
   wire                    local_i3_6_vld  = i3_6_rdy;
   wire [`INTF3_WIDTH+2:0] local_i3_7_data = {3'b111,i3_7_data};
   wire                    local_i3_7_vld  = i3_7_rdy;

   wire [`INTF4_WIDTH+2:0] local_i4_0_data = {3'b000,i4_0_data};
   wire                    local_i4_0_vld  = i4_0_rdy;
   wire [`INTF4_WIDTH+2:0] local_i4_1_data = {3'b001,i4_1_data};
   wire                    local_i4_1_vld  = i4_1_rdy;
   wire [`INTF4_WIDTH+2:0] local_i4_2_data = {3'b010,i4_2_data};
   wire                    local_i4_2_vld  = i4_2_rdy;
   wire [`INTF4_WIDTH+2:0] local_i4_3_data = {3'b011,i4_3_data};
   wire                    local_i4_3_vld  = i4_3_rdy;
   wire [`INTF4_WIDTH+2:0] local_i4_4_data = {3'b100,i4_4_data};
   wire                    local_i4_4_vld  = i4_4_rdy;
   wire [`INTF4_WIDTH+2:0] local_i4_5_data = {3'b101,i4_5_data};
   wire                    local_i4_5_vld  = i4_5_rdy;
   wire [`INTF4_WIDTH+2:0] local_i4_6_data = {3'b110,i4_6_data};
   wire                    local_i4_6_vld  = i4_6_rdy;
   wire [`INTF4_WIDTH+2:0] local_i4_7_data = {3'b111,i4_7_data};
   wire                    local_i4_7_vld  = i4_7_rdy;

   wire [`INTF5_WIDTH+2:0] local_i5_0_data = {3'b000,i5_0_data};
   wire                    local_i5_0_vld  = i5_0_rdy;
   wire [`INTF5_WIDTH+2:0] local_i5_1_data = {3'b001,i5_1_data};
   wire                    local_i5_1_vld  = i5_1_rdy;
   wire [`INTF5_WIDTH+2:0] local_i5_2_data = {3'b010,i5_2_data};
   wire                    local_i5_2_vld  = i5_2_rdy;
   wire [`INTF5_WIDTH+2:0] local_i5_3_data = {3'b011,i5_3_data};
   wire                    local_i5_3_vld  = i5_3_rdy;
   wire [`INTF5_WIDTH+2:0] local_i5_4_data = {3'b100,i5_4_data};
   wire                    local_i5_4_vld  = i5_4_rdy;
   wire [`INTF5_WIDTH+2:0] local_i5_5_data = {3'b101,i5_5_data};
   wire                    local_i5_5_vld  = i5_5_rdy;
   wire [`INTF5_WIDTH+2:0] local_i5_6_data = {3'b110,i5_6_data};
   wire                    local_i5_6_vld  = i5_6_rdy;
   wire [`INTF5_WIDTH+2:0] local_i5_7_data = {3'b111,i5_7_data};
   wire                    local_i5_7_vld  = i5_7_rdy;

   //count rtl cycles
   integer 		   counter, match_count;
   reg 			   match;
   initial begin
      counter     = 0;
      match       = 1;
      match_count = 0;
     end

`ifdef SAS_DISABLE
`else

`ifdef RTL_SPARC0
   always @(posedge clk)begin//clean up buffer
      if(rst_l)begin
`ifndef VERILATOR
	 if(`PC_CMP.active_thread[31:0] && (`PC_CMP.good[31:0] == `PC_CMP.active_thread[31:0]))match_count = match_count + 1;
`else // ifndef VERILATOR
	 if(`PC_CMP.active_thread[3:0] && (`PC_CMP.good[3:0] == `PC_CMP.active_thread[3:0]))match_count = match_count + 1;
`endif // ifndef VERILATOR
	 if(match_count == `CLEAN_CYCLE)match = 0;
      end
      else begin
	 counter     = 0;
	 match       = 1;
	 match_count = 0;
      end
   end

//`ifdef RTL_SPARC0

`endif

`endif // ifdef SAS_DISABLE

endmodule // sas_intf
