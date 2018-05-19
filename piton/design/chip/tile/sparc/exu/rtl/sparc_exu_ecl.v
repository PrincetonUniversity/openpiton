// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_ecl.v
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
//  Module Name: sparc_exu_ecl
//	Description:  Implements all the control logic for the exu.
//		This includes: bypass logic, ccr control and ccr bypassing,
//			  w2 arbitration logic, mux selects for alu and shift.
//				Also implements the ccrs.
*/

module sparc_exu_ecl
(/*AUTOARG*/
   // Outputs
   exu_tlu_ccr3_w, exu_tlu_ccr2_w, exu_tlu_ccr1_w, exu_tlu_ccr0_w, 
   exu_mul_input_vld, exu_ifu_longop_done_g, exu_ifu_inj_ack, 
   exu_ifu_err_synd_7_m, exu_ifu_err_reg_m, exu_ifu_ecc_ue_m, 
   exu_ifu_ecc_ce_m, exu_ffu_wsr_inst_e, ecl_rml_wstate_wen_w, 
   ecl_rml_otherwin_wen_w, ecl_rml_cwp_wen_e, ecl_rml_cleanwin_wen_w, 
   ecl_rml_cansave_wen_w, ecl_rml_canrestore_wen_w, 
   ecl_ecc_sel_rs3_m_l, ecl_ecc_sel_rs2_m_l, ecl_ecc_sel_rs1_m_l, 
   ecl_ecc_log_rs3_m, ecl_ecc_log_rs2_m, ecl_ecc_log_rs1_m, 
   ecl_div_yreg_wen_w, ecl_div_yreg_wen_l, ecl_div_yreg_wen_g, 
   ecl_div_yreg_shift_g, ecl_div_xinmask, ecl_div_upper33_zero, 
   ecl_div_upper33_one, ecl_div_upper32_zero, ecl_div_subtract_l, 
   ecl_div_sel_u32, ecl_div_sel_pos32, ecl_div_sel_neg32, 
   ecl_div_sel_adder, ecl_div_sel_64b, ecl_div_newq, 
   ecl_div_mul_sext_rs2_e, ecl_div_mul_sext_rs1_e, 
   ecl_div_mul_keep_data, ecl_div_mul_get_new_data, 
   ecl_div_mul_get_32bit_data, ecl_div_last_cycle, ecl_div_keepx, 
   ecl_div_keep_d, ecl_div_dividend_sign, ecl_div_cin, 
   ecl_div_almostlast_cycle, ecl_byp_sel_restore_m, 
   ecl_byp_sel_restore_g, ecl_byp_sel_pipe_m, ecl_byp_sel_muldiv_g, 
   ecl_byp_sel_load_m, ecl_byp_sel_load_g, ecl_byp_eclpr_e, 
   ecl_byp_ecc_mask_m_l, so, ecl_byp_sel_alu_e, ecl_byp_sel_eclpr_e, 
   ecl_byp_sel_yreg_e, ecl_byp_sel_ifusr_e, ecl_byp_sel_ffusr_m, 
   ecl_byp_sel_ifex_m, ecl_byp_sel_tlusr_m, exu_ifu_va_oor_m, 
   ecl_alu_out_sel_sum_e_l, ecl_alu_out_sel_rs3_e_l, 
   ecl_alu_out_sel_shift_e_l, ecl_alu_out_sel_logic_e_l, 
   ecl_alu_log_sel_and_e, ecl_alu_log_sel_or_e, 
   ecl_alu_log_sel_xor_e, ecl_alu_log_sel_move_e, 
   ecl_alu_sethi_inst_e, ecl_alu_cin_e, ecl_shft_lshift_e_l, 
   ecl_shft_op32_e, ecl_shft_shift4_e, ecl_shft_shift1_e, 
   ecl_shft_enshift_e_l, ecl_byp_restore_m, ecl_byp_rs1_mux2_sel_e, 
   ecl_byp_rs1_mux2_sel_rf, ecl_byp_rs1_mux2_sel_ld, 
   ecl_byp_rs1_mux2_sel_usemux1, ecl_byp_rs1_mux1_sel_m, 
   ecl_byp_rs1_mux1_sel_w, ecl_byp_rs1_mux1_sel_w2, 
   ecl_byp_rs1_mux1_sel_other, ecl_byp_rcc_mux2_sel_e, 
   ecl_byp_rcc_mux2_sel_rf, ecl_byp_rcc_mux2_sel_ld, 
   ecl_byp_rcc_mux2_sel_usemux1, ecl_byp_rcc_mux1_sel_m, 
   ecl_byp_rcc_mux1_sel_w, ecl_byp_rcc_mux1_sel_w2, 
   ecl_byp_rcc_mux1_sel_other, ecl_byp_rs2_mux2_sel_e, 
   ecl_byp_rs2_mux2_sel_rf, ecl_byp_rs2_mux2_sel_ld, 
   ecl_byp_rs2_mux2_sel_usemux1, ecl_byp_rs2_mux1_sel_m, 
   ecl_byp_rs2_mux1_sel_w, ecl_byp_rs2_mux1_sel_w2, 
   ecl_byp_rs2_mux1_sel_other, ecl_byp_rs3_mux2_sel_e, 
   ecl_byp_rs3_mux2_sel_rf, ecl_byp_rs3_mux2_sel_ld, 
   ecl_byp_rs3_mux2_sel_usemux1, ecl_byp_rs3_mux1_sel_m, 
   ecl_byp_rs3_mux1_sel_w, ecl_byp_rs3_mux1_sel_w2, 
   ecl_byp_rs3_mux1_sel_other, ecl_byp_rs3h_mux2_sel_e, 
   ecl_byp_rs3h_mux2_sel_rf, ecl_byp_rs3h_mux2_sel_ld, 
   ecl_byp_rs3h_mux2_sel_usemux1, ecl_byp_rs3h_mux1_sel_m, 
   ecl_byp_rs3h_mux1_sel_w, ecl_byp_rs3h_mux1_sel_w2, 
   ecl_byp_rs3h_mux1_sel_other, ecl_byp_rs1_longmux_sel_g2, 
   ecl_byp_rs1_longmux_sel_w2, ecl_byp_rs1_longmux_sel_ldxa, 
   ecl_byp_rs2_longmux_sel_g2, ecl_byp_rs2_longmux_sel_w2, 
   ecl_byp_rs2_longmux_sel_ldxa, ecl_byp_rs3_longmux_sel_g2, 
   ecl_byp_rs3_longmux_sel_w2, ecl_byp_rs3_longmux_sel_ldxa, 
   ecl_byp_rs3h_longmux_sel_g2, ecl_byp_rs3h_longmux_sel_w2, 
   ecl_byp_rs3h_longmux_sel_ldxa, ecl_byp_std_e_l, ecl_byp_ldxa_g, 
   ecl_byp_3lsb_m, ecl_ecc_rs1_use_rf_e, ecl_ecc_rs2_use_rf_e, 
   ecl_ecc_rs3_use_rf_e, ecl_irf_rd_m, ecl_irf_tid_m, ecl_irf_wen_w, 
   ecl_irf_wen_w2, ecl_irf_rd_g, ecl_irf_tid_g, ecl_div_thr_e, 
   ecl_rml_thr_m, ecl_rml_thr_w, ecl_rml_xor_data_e, 
   ecl_div_ld_inputs, ecl_div_sel_div, ecl_div_div64, exu_ifu_cc_d, 
   ecl_shft_extendbit_e, ecl_shft_extend32bit_e_l, 
   ecl_div_zero_rs2_e, ecl_div_muls_rs1_31_e_l, 
   ecl_div_yreg_data_31_g, exu_tlu_va_oor_m, exu_tlu_va_oor_jl_ret_m, 
   ecl_rml_kill_e, ecl_rml_kill_w, ecl_byp_sel_ecc_m, 
   exu_tlu_ttype_m, exu_tlu_ttype_vld_m, exu_tlu_ue_trap_m, 
   exu_tlu_misalign_addr_jmpl_rtn_m, exu_lsu_priority_trap_m, 
   ecl_div_mul_wen, ecl_div_muls, ecl_rml_early_flush_w, 
   ecl_rml_inst_vld_w, ecl_alu_casa_e, 
   // Inputs
   tlu_exu_cwpccr_update_m, tlu_exu_ccr_m, sehold, rst_tri_en, 
   rml_ecl_wstate_d, rml_ecl_swap_done, rml_ecl_rmlop_done_e, 
   rml_ecl_otherwin_d, rml_ecl_kill_m, rml_ecl_gl_e, rml_ecl_cwp_d, 
   rml_ecl_cleanwin_d, rml_ecl_cansave_d, rml_ecl_canrestore_d, 
   mul_exu_ack, lsu_exu_ldst_miss_g2, ifu_tlu_wsr_inst_d, 
   ifu_tlu_sraddr_d, ifu_exu_return_d, ifu_exu_muldivop_d, 
   ifu_exu_inst_vld_w, ifu_exu_inst_vld_e, ifu_exu_inj_irferr, 
   ifu_exu_ecc_mask, ifu_exu_disable_ce_e, ecc_ecl_rs3_ue, 
   ecc_ecl_rs3_ce, ecc_ecl_rs2_ue, ecc_ecl_rs2_ce, ecc_ecl_rs1_ue, 
   ecc_ecl_rs1_ce, div_ecl_xin_msb_l, div_ecl_x_msb, 
   div_ecl_upper32_equal, div_ecl_low32_nonzero, 
   div_ecl_gencc_in_msb_l, div_ecl_gencc_in_31, div_ecl_dividend_msb, 
   div_ecl_detect_zero_low, div_ecl_detect_zero_high, div_ecl_d_msb, 
   div_ecl_d_62, div_ecl_cout64, div_ecl_cout32, 
   div_ecl_adder_out_31, byp_ecl_wrccr_data_w, rclk, se, si, grst_l, 
   arst_l, ifu_exu_dbrinst_d, ifu_exu_aluop_d, ifu_exu_shiftop_d, 
   ifu_exu_invert_d, ifu_exu_usecin_d, ifu_exu_enshift_d, 
   byp_ecl_rs2_3_0_e, byp_ecl_rs1_2_0_e, byp_ecl_rd_data_3lsb_m, 
   ifu_exu_use_rsr_e_l, ifu_exu_rd_exusr_e, ifu_exu_rd_ifusr_e, 
   ifu_exu_rd_ffusr_e, ifu_exu_rs1_vld_d, ifu_exu_rs2_vld_d, 
   ifu_exu_rs3e_vld_d, ifu_exu_rs3o_vld_d, ifu_exu_dontmv_regz0_e, 
   ifu_exu_dontmv_regz1_e, ifu_exu_rd_d, ifu_exu_tid_s2, 
   ifu_exu_kill_e, ifu_exu_wen_d, ifu_exu_ialign_d, exu_ifu_regz_e, 
   alu_ecl_add_n64_e, alu_ecl_add_n32_e, alu_ecl_log_n64_e, 
   alu_ecl_log_n32_e, alu_ecl_zhigh_e, alu_ecl_zlow_e, 
   ifu_exu_setcc_d, lsu_exu_dfill_vld_g, lsu_exu_rd_m, lsu_exu_thr_m, 
   lsu_exu_ldxa_m, byp_ecl_rs1_31_e, byp_ecl_rs2_31_e, 
   byp_ecl_rs1_63_e, alu_ecl_cout64_e_l, alu_ecl_cout32_e, 
   alu_ecl_adder_out_63_e, alu_ecl_adder_out_31_e, 
   alu_ecl_adderin2_63_e, alu_ecl_adderin2_31_e, ifu_exu_rs1_s, 
   ifu_exu_rs2_s, ifu_exu_rs3_s, ifu_exu_tagop_d, ifu_exu_tv_d, 
   ifu_exu_muls_d, div_ecl_yreg_0_l, alu_ecl_mem_addr_invalid_e_l, 
   ifu_exu_range_check_jlret_d, ifu_exu_range_check_other_d, 
   ifu_exu_addr_mask_d, ifu_exu_save_d, ifu_exu_restore_d, 
   ifu_exu_casa_d, rml_ecl_clean_window_e, rml_ecl_fill_e, 
   rml_ecl_other_e, rml_ecl_wtype_e, ifu_exu_tcc_e, 
   alu_ecl_adder_out_7_0_e, ifu_exu_useimm_d, ifu_exu_nceen_e, 
   ifu_tlu_flush_m, ifu_exu_ttype_vld_m, tlu_exu_priv_trap_m, 
   tlu_exu_pic_onebelow_m, tlu_exu_pic_twobelow_m, 
   lsu_exu_flush_pipe_w, ifu_exu_sethi_inst_d, 
   lsu_exu_st_dtlb_perr_g
   );
   
/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
input [7:0]             byp_ecl_wrccr_data_w;   // To ccr of sparc_exu_eclccr.v
input                   div_ecl_adder_out_31;   // To divcntl of sparc_exu_ecl_divcntl.v
input                   div_ecl_cout32;         // To divcntl of sparc_exu_ecl_divcntl.v
input                   div_ecl_cout64;         // To divcntl of sparc_exu_ecl_divcntl.v
input                   div_ecl_d_62;           // To divcntl of sparc_exu_ecl_divcntl.v
input                   div_ecl_d_msb;          // To divcntl of sparc_exu_ecl_divcntl.v
input                   div_ecl_detect_zero_high;// To divcntl of sparc_exu_ecl_divcntl.v, ...
input                   div_ecl_detect_zero_low;// To divcntl of sparc_exu_ecl_divcntl.v, ...
input                   div_ecl_dividend_msb;   // To divcntl of sparc_exu_ecl_divcntl.v
input                   div_ecl_gencc_in_31;    // To divcntl of sparc_exu_ecl_divcntl.v
input                   div_ecl_gencc_in_msb_l; // To divcntl of sparc_exu_ecl_divcntl.v
input                   div_ecl_low32_nonzero;  // To divcntl of sparc_exu_ecl_divcntl.v
input                   div_ecl_upper32_equal;  // To divcntl of sparc_exu_ecl_divcntl.v
input                   div_ecl_x_msb;          // To divcntl of sparc_exu_ecl_divcntl.v
input                   div_ecl_xin_msb_l;      // To divcntl of sparc_exu_ecl_divcntl.v
input                   ecc_ecl_rs1_ce;         // To eccctl of sparc_exu_ecl_eccctl.v
input                   ecc_ecl_rs1_ue;         // To eccctl of sparc_exu_ecl_eccctl.v
input                   ecc_ecl_rs2_ce;         // To eccctl of sparc_exu_ecl_eccctl.v
input                   ecc_ecl_rs2_ue;         // To eccctl of sparc_exu_ecl_eccctl.v
input                   ecc_ecl_rs3_ce;         // To eccctl of sparc_exu_ecl_eccctl.v
input                   ecc_ecl_rs3_ue;         // To eccctl of sparc_exu_ecl_eccctl.v
input                   ifu_exu_disable_ce_e;   // To eccctl of sparc_exu_ecl_eccctl.v
input [7:0]             ifu_exu_ecc_mask;       // To eccctl of sparc_exu_ecl_eccctl.v
input                   ifu_exu_inj_irferr;     // To eccctl of sparc_exu_ecl_eccctl.v
input                   ifu_exu_inst_vld_e;     // To writeback of sparc_exu_ecl_wb.v, ...
input                   ifu_exu_inst_vld_w;     // To ccr of sparc_exu_eclccr.v, ...
input [4:0]             ifu_exu_muldivop_d;     // To mdqctl of sparc_exu_ecl_mdqctl.v
input                   ifu_exu_return_d;       // To writeback of sparc_exu_ecl_wb.v
input [6:0]             ifu_tlu_sraddr_d;       // To writeback of sparc_exu_ecl_wb.v
input                   ifu_tlu_wsr_inst_d;     // To writeback of sparc_exu_ecl_wb.v
input                   lsu_exu_ldst_miss_g2;   // To writeback of sparc_exu_ecl_wb.v
input                   mul_exu_ack;            // To mdqctl of sparc_exu_ecl_mdqctl.v
input [2:0]             rml_ecl_canrestore_d;   // To writeback of sparc_exu_ecl_wb.v
input [2:0]             rml_ecl_cansave_d;      // To writeback of sparc_exu_ecl_wb.v
input [2:0]             rml_ecl_cleanwin_d;     // To writeback of sparc_exu_ecl_wb.v
input [2:0]             rml_ecl_cwp_d;          // To writeback of sparc_exu_ecl_wb.v, ...
input [1:0]             rml_ecl_gl_e;           // To eccctl of sparc_exu_ecl_eccctl.v
input                   rml_ecl_kill_m;         // To writeback of sparc_exu_ecl_wb.v
input [2:0]             rml_ecl_otherwin_d;     // To writeback of sparc_exu_ecl_wb.v
input                   rml_ecl_rmlop_done_e;   // To writeback of sparc_exu_ecl_wb.v
input [3:0]             rml_ecl_swap_done;      // To writeback of sparc_exu_ecl_wb.v
input [5:0]             rml_ecl_wstate_d;       // To writeback of sparc_exu_ecl_wb.v
input                   rst_tri_en;             // To eccctl of sparc_exu_ecl_eccctl.v
input                   sehold;                 // To writeback of sparc_exu_ecl_wb.v, ...
input [7:0]             tlu_exu_ccr_m;          // To ccr of sparc_exu_eclccr.v
input                   tlu_exu_cwpccr_update_m;// To ccr of sparc_exu_eclccr.v
// End of automatics
   input 				rclk;
   input        se;
   input        si;
   input        grst_l;
   input        arst_l;
   input        ifu_exu_dbrinst_d;// rs1 bypass should use pc
   input [2:0]  ifu_exu_aluop_d;// partially decoded op for exu operation
   input [2:0]  ifu_exu_shiftop_d;
   input        ifu_exu_invert_d;       // invert logic output
   input        ifu_exu_usecin_d;        // use cin for add ops
   input        ifu_exu_enshift_d;     // enable shifter
   input [3:0]  byp_ecl_rs2_3_0_e;
   input [2:0]  byp_ecl_rs1_2_0_e;
   input [2:0]  byp_ecl_rd_data_3lsb_m;
   input        ifu_exu_use_rsr_e_l;      // e stage instruction uses sr
   input        ifu_exu_rd_exusr_e;
   input        ifu_exu_rd_ifusr_e;
   input        ifu_exu_rd_ffusr_e;
   input        ifu_exu_rs1_vld_d;
   input        ifu_exu_rs2_vld_d;
   input        ifu_exu_rs3e_vld_d;
   input        ifu_exu_rs3o_vld_d;
   input        ifu_exu_dontmv_regz0_e;// a move instruction got killed
   input        ifu_exu_dontmv_regz1_e;
   input [4:0]  ifu_exu_rd_d;           // destination register
   input [1:0]  ifu_exu_tid_s2;          // thread of inst in s stage
   input        ifu_exu_kill_e;         // kill instruction in e-stage
   input        ifu_exu_wen_d;  // instruction in d-stage writes to regfile
   input        ifu_exu_ialign_d;// instruction is alignaddress
   input        exu_ifu_regz_e;
   input        alu_ecl_add_n64_e;
   input        alu_ecl_add_n32_e;
   input        alu_ecl_log_n64_e;
   input        alu_ecl_log_n32_e;
   input        alu_ecl_zhigh_e;
   input        alu_ecl_zlow_e;
   input        ifu_exu_setcc_d;
   input        lsu_exu_dfill_vld_g; // load data is valid
   input [4:0]  lsu_exu_rd_m;  // load destination register
   input [1:0]  lsu_exu_thr_m; // load thread
   input        lsu_exu_ldxa_m;
   input  byp_ecl_rs1_31_e;
   input  byp_ecl_rs2_31_e;
   input  byp_ecl_rs1_63_e;
   input       alu_ecl_cout64_e_l;
   input       alu_ecl_cout32_e;
   input       alu_ecl_adder_out_63_e;
   input       alu_ecl_adder_out_31_e;
   input       alu_ecl_adderin2_63_e;
   input       alu_ecl_adderin2_31_e;
   input [4:0]  ifu_exu_rs1_s;  // source addresses
   input [4:0]  ifu_exu_rs2_s;
   input [4:0]  ifu_exu_rs3_s;
   input        ifu_exu_tagop_d;// add or sub sets icc.v with tagged overflow
   input        ifu_exu_tv_d;   // 32 bit overflow causes exception
   input  ifu_exu_muls_d;
   input  [3:0] div_ecl_yreg_0_l;
   input  alu_ecl_mem_addr_invalid_e_l;
   input  ifu_exu_range_check_jlret_d;
   input  ifu_exu_range_check_other_d;
   input  ifu_exu_addr_mask_d;
   input      ifu_exu_save_d;
   input      ifu_exu_restore_d;
   input      ifu_exu_casa_d;
   input  rml_ecl_clean_window_e;
   input  rml_ecl_fill_e;
   input  rml_ecl_other_e;
   input  [2:0] rml_ecl_wtype_e;
   input        ifu_exu_tcc_e;
   input [7:0]  alu_ecl_adder_out_7_0_e;
   input       ifu_exu_useimm_d;
   input       ifu_exu_nceen_e;
   input       ifu_tlu_flush_m;
   input       ifu_exu_ttype_vld_m;
   input        tlu_exu_priv_trap_m;
   input        tlu_exu_pic_onebelow_m;
   input        tlu_exu_pic_twobelow_m;
   input       lsu_exu_flush_pipe_w;
   input       ifu_exu_sethi_inst_d;
   input       lsu_exu_st_dtlb_perr_g;
  
   /*AUTOOUTPUT*/
   // Beginning of automatic outputs (from unused autoinst outputs)
   output [7:0]         ecl_byp_ecc_mask_m_l;   // From eccctl of sparc_exu_ecl_eccctl.v
   output [7:0]         ecl_byp_eclpr_e;        // From writeback of sparc_exu_ecl_wb.v
   output               ecl_byp_sel_load_g;     // From writeback of sparc_exu_ecl_wb.v
   output               ecl_byp_sel_load_m;     // From writeback of sparc_exu_ecl_wb.v
   output               ecl_byp_sel_muldiv_g;   // From writeback of sparc_exu_ecl_wb.v
   output               ecl_byp_sel_pipe_m;     // From writeback of sparc_exu_ecl_wb.v
   output               ecl_byp_sel_restore_g;  // From writeback of sparc_exu_ecl_wb.v
   output               ecl_byp_sel_restore_m;  // From writeback of sparc_exu_ecl_wb.v
   output               ecl_div_almostlast_cycle;// From divcntl of sparc_exu_ecl_divcntl.v
   output               ecl_div_cin;            // From divcntl of sparc_exu_ecl_divcntl.v
   output               ecl_div_dividend_sign;  // From divcntl of sparc_exu_ecl_divcntl.v
   output               ecl_div_keep_d;         // From divcntl of sparc_exu_ecl_divcntl.v
   output               ecl_div_keepx;          // From divcntl of sparc_exu_ecl_divcntl.v
   output               ecl_div_last_cycle;     // From divcntl of sparc_exu_ecl_divcntl.v
   output               ecl_div_mul_get_32bit_data;// From mdqctl of sparc_exu_ecl_mdqctl.v
   output               ecl_div_mul_get_new_data;// From mdqctl of sparc_exu_ecl_mdqctl.v
   output               ecl_div_mul_keep_data;  // From mdqctl of sparc_exu_ecl_mdqctl.v
   output               ecl_div_mul_sext_rs1_e; // From mdqctl of sparc_exu_ecl_mdqctl.v
   output               ecl_div_mul_sext_rs2_e; // From mdqctl of sparc_exu_ecl_mdqctl.v
   output               ecl_div_newq;           // From divcntl of sparc_exu_ecl_divcntl.v
   output               ecl_div_sel_64b;        // From divcntl of sparc_exu_ecl_divcntl.v
   output               ecl_div_sel_adder;      // From divcntl of sparc_exu_ecl_divcntl.v
   output               ecl_div_sel_neg32;      // From divcntl of sparc_exu_ecl_divcntl.v
   output               ecl_div_sel_pos32;      // From divcntl of sparc_exu_ecl_divcntl.v
   output               ecl_div_sel_u32;        // From divcntl of sparc_exu_ecl_divcntl.v
   output               ecl_div_subtract_l;     // From divcntl of sparc_exu_ecl_divcntl.v
   output               ecl_div_upper32_zero;   // From divcntl of sparc_exu_ecl_divcntl.v
   output               ecl_div_upper33_one;    // From divcntl of sparc_exu_ecl_divcntl.v
   output               ecl_div_upper33_zero;   // From divcntl of sparc_exu_ecl_divcntl.v
   output               ecl_div_xinmask;        // From divcntl of sparc_exu_ecl_divcntl.v
   output [3:0]         ecl_div_yreg_shift_g;   // From writeback of sparc_exu_ecl_wb.v
   output [3:0]         ecl_div_yreg_wen_g;     // From writeback of sparc_exu_ecl_wb.v
   output [3:0]         ecl_div_yreg_wen_l;     // From writeback of sparc_exu_ecl_wb.v
   output [3:0]         ecl_div_yreg_wen_w;     // From writeback of sparc_exu_ecl_wb.v
   output               ecl_ecc_log_rs1_m;      // From eccctl of sparc_exu_ecl_eccctl.v
   output               ecl_ecc_log_rs2_m;      // From eccctl of sparc_exu_ecl_eccctl.v
   output               ecl_ecc_log_rs3_m;      // From eccctl of sparc_exu_ecl_eccctl.v
   output               ecl_ecc_sel_rs1_m_l;    // From eccctl of sparc_exu_ecl_eccctl.v
   output               ecl_ecc_sel_rs2_m_l;    // From eccctl of sparc_exu_ecl_eccctl.v
   output               ecl_ecc_sel_rs3_m_l;    // From eccctl of sparc_exu_ecl_eccctl.v
   output               ecl_rml_canrestore_wen_w;// From writeback of sparc_exu_ecl_wb.v
   output               ecl_rml_cansave_wen_w;  // From writeback of sparc_exu_ecl_wb.v
   output               ecl_rml_cleanwin_wen_w; // From writeback of sparc_exu_ecl_wb.v
   output               ecl_rml_cwp_wen_e;      // From writeback of sparc_exu_ecl_wb.v
   output               ecl_rml_otherwin_wen_w; // From writeback of sparc_exu_ecl_wb.v
   output               ecl_rml_wstate_wen_w;   // From writeback of sparc_exu_ecl_wb.v
   output               exu_ffu_wsr_inst_e;     // From writeback of sparc_exu_ecl_wb.v
   output               exu_ifu_ecc_ce_m;       // From eccctl of sparc_exu_ecl_eccctl.v
   output               exu_ifu_ecc_ue_m;       // From eccctl of sparc_exu_ecl_eccctl.v
   output [7:0]         exu_ifu_err_reg_m;      // From eccctl of sparc_exu_ecl_eccctl.v
   output               exu_ifu_err_synd_7_m;   // From eccctl of sparc_exu_ecl_eccctl.v
   output               exu_ifu_inj_ack;        // From eccctl of sparc_exu_ecl_eccctl.v
   output [3:0]         exu_ifu_longop_done_g;  // From writeback of sparc_exu_ecl_wb.v
   output               exu_mul_input_vld;      // From mdqctl of sparc_exu_ecl_mdqctl.v
   output [7:0]         exu_tlu_ccr0_w;         // From ccr of sparc_exu_eclccr.v
   output [7:0]         exu_tlu_ccr1_w;         // From ccr of sparc_exu_eclccr.v
   output [7:0]         exu_tlu_ccr2_w;         // From ccr of sparc_exu_eclccr.v
   output [7:0]         exu_tlu_ccr3_w;         // From ccr of sparc_exu_eclccr.v
   // End of automatics
   output               so;
   output               ecl_byp_sel_alu_e;
   output               ecl_byp_sel_eclpr_e;
   output               ecl_byp_sel_yreg_e;
   output               ecl_byp_sel_ifusr_e;
   output               ecl_byp_sel_ffusr_m;
   output               ecl_byp_sel_ifex_m;
   output               ecl_byp_sel_tlusr_m;
   output   exu_ifu_va_oor_m;
   output ecl_alu_out_sel_sum_e_l;
   output ecl_alu_out_sel_rs3_e_l;
   output ecl_alu_out_sel_shift_e_l;
   output ecl_alu_out_sel_logic_e_l;
   output ecl_alu_log_sel_and_e;
   output ecl_alu_log_sel_or_e;
   output ecl_alu_log_sel_xor_e;
   output ecl_alu_log_sel_move_e;
   output ecl_alu_sethi_inst_e;
   output ecl_alu_cin_e;    // cin for add/sub operations
   output  ecl_shft_lshift_e_l;  // if 0 do left shift.  else right shift
   output  ecl_shft_op32_e;      // indicates 32 bit operation so upper 32 = 0
   //output [3:0] ecl_shft_shift16_e;// [48, 32, 16, 0] shift
   output [3:0] ecl_shft_shift4_e;// [12, 8, 4, 0] shift
   output [3:0] ecl_shft_shift1_e;// [3, 2, 1, 0] shift
   output        ecl_shft_enshift_e_l;// enables inputs to shifter
   output        ecl_byp_restore_m;
   output ecl_byp_rs1_mux2_sel_e;// select lines for bypass muxes for rs1
   output ecl_byp_rs1_mux2_sel_rf;
   output ecl_byp_rs1_mux2_sel_ld;
   output ecl_byp_rs1_mux2_sel_usemux1;
   output ecl_byp_rs1_mux1_sel_m;
   output ecl_byp_rs1_mux1_sel_w;
   output ecl_byp_rs1_mux1_sel_w2;
   output ecl_byp_rs1_mux1_sel_other;
   output ecl_byp_rcc_mux2_sel_e;// select lines for bypass muxes for rcc
   output ecl_byp_rcc_mux2_sel_rf;
   output ecl_byp_rcc_mux2_sel_ld;
   output ecl_byp_rcc_mux2_sel_usemux1;
   output ecl_byp_rcc_mux1_sel_m;
   output ecl_byp_rcc_mux1_sel_w;
   output ecl_byp_rcc_mux1_sel_w2;
   output ecl_byp_rcc_mux1_sel_other;
   output ecl_byp_rs2_mux2_sel_e;// select lines for bypass muxes for rs2
   output ecl_byp_rs2_mux2_sel_rf;
   output ecl_byp_rs2_mux2_sel_ld;
   output ecl_byp_rs2_mux2_sel_usemux1;
   output ecl_byp_rs2_mux1_sel_m;
   output ecl_byp_rs2_mux1_sel_w;
   output ecl_byp_rs2_mux1_sel_w2;
   output ecl_byp_rs2_mux1_sel_other;
   output ecl_byp_rs3_mux2_sel_e; // select lines for bypass muxes for rs3
   output ecl_byp_rs3_mux2_sel_rf;
   output ecl_byp_rs3_mux2_sel_ld;
   output ecl_byp_rs3_mux2_sel_usemux1;
   output ecl_byp_rs3_mux1_sel_m;
   output ecl_byp_rs3_mux1_sel_w;
   output ecl_byp_rs3_mux1_sel_w2;
   output ecl_byp_rs3_mux1_sel_other;
   output ecl_byp_rs3h_mux2_sel_e; // select lines for bypass muxes for rs3 double
   output ecl_byp_rs3h_mux2_sel_rf;
   output ecl_byp_rs3h_mux2_sel_ld;
   output ecl_byp_rs3h_mux2_sel_usemux1;
   output ecl_byp_rs3h_mux1_sel_m;
   output ecl_byp_rs3h_mux1_sel_w;
   output ecl_byp_rs3h_mux1_sel_w2;
   output ecl_byp_rs3h_mux1_sel_other;
   output ecl_byp_rs1_longmux_sel_g2;
   output ecl_byp_rs1_longmux_sel_w2;
   output ecl_byp_rs1_longmux_sel_ldxa;
   output ecl_byp_rs2_longmux_sel_g2;
   output ecl_byp_rs2_longmux_sel_w2;
   output ecl_byp_rs2_longmux_sel_ldxa;
   output ecl_byp_rs3_longmux_sel_g2;
   output ecl_byp_rs3_longmux_sel_w2;
   output ecl_byp_rs3_longmux_sel_ldxa;
   output ecl_byp_rs3h_longmux_sel_g2;
   output ecl_byp_rs3h_longmux_sel_w2;
   output ecl_byp_rs3h_longmux_sel_ldxa;
   output ecl_byp_std_e_l;
   output ecl_byp_ldxa_g;       // use the ldxa return data
   output [2:0] ecl_byp_3lsb_m;
   output                ecl_ecc_rs1_use_rf_e;
   output                ecl_ecc_rs2_use_rf_e;
   output                ecl_ecc_rs3_use_rf_e;
   output  [4:0] ecl_irf_rd_m;
   output  [1:0] ecl_irf_tid_m;
   output        ecl_irf_wen_w;
   output        ecl_irf_wen_w2;// write enable for w2
   output  [4:0] ecl_irf_rd_g; // w2 destination register
   output [1:0]  ecl_irf_tid_g;     // thread of inst in long w stage
   output [3:0]  ecl_div_thr_e;
   output [3:0] ecl_rml_thr_m;
   output [3:0] ecl_rml_thr_w;
   output [2:0] ecl_rml_xor_data_e;
   output        ecl_div_ld_inputs;
   output        ecl_div_sel_div;
   output        ecl_div_div64;
   output [7:0]  exu_ifu_cc_d;
   output ecl_shft_extendbit_e;     // bit that gets appended on right shifts
   output ecl_shft_extend32bit_e_l;   // bit that gets appended on 32 bit right shfts
   output         ecl_div_zero_rs2_e;// used on muls ops
   output         ecl_div_muls_rs1_31_e_l;
   output         ecl_div_yreg_data_31_g;
   output         exu_tlu_va_oor_m;
   output         exu_tlu_va_oor_jl_ret_m;
   output        ecl_rml_kill_e;
   output        ecl_rml_kill_w;
   output        ecl_byp_sel_ecc_m;
   output [8:0] exu_tlu_ttype_m;
   output       exu_tlu_ttype_vld_m;
   output       exu_tlu_ue_trap_m;
   output   exu_tlu_misalign_addr_jmpl_rtn_m;
   output   exu_lsu_priority_trap_m;
   output   ecl_div_mul_wen;
   output   ecl_div_muls;
   output   ecl_rml_early_flush_w;
   output   ecl_rml_inst_vld_w;
   output   ecl_alu_casa_e;

   
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire                 bypass_m;               // From writeback of sparc_exu_ecl_wb.v
   wire                 bypass_w;               // From writeback of sparc_exu_ecl_wb.v
   wire [7:0]           divcntl_ccr_cc_w2;      // From divcntl of sparc_exu_ecl_divcntl.v
   wire                 divcntl_wb_req_g;       // From divcntl of sparc_exu_ecl_divcntl.v
   wire [4:0]           eccctl_wb_rd_m;         // From eccctl of sparc_exu_ecl_eccctl.v
   wire                 ecl_div_signed_div;     // From mdqctl of sparc_exu_ecl_mdqctl.v
   wire                 mdqctl_divcntl_input_vld;// From mdqctl of sparc_exu_ecl_mdqctl.v
   wire                 mdqctl_divcntl_muldone; // From mdqctl of sparc_exu_ecl_mdqctl.v
   wire                 mdqctl_divcntl_reset_div;// From mdqctl of sparc_exu_ecl_mdqctl.v
   wire [4:0]           mdqctl_wb_divrd_g;      // From mdqctl of sparc_exu_ecl_mdqctl.v
   wire                 mdqctl_wb_divsetcc_g;   // From mdqctl of sparc_exu_ecl_mdqctl.v
   wire [1:0]           mdqctl_wb_divthr_g;     // From mdqctl of sparc_exu_ecl_mdqctl.v
   wire [4:0]           mdqctl_wb_mulrd_g;      // From mdqctl of sparc_exu_ecl_mdqctl.v
   wire                 mdqctl_wb_mulsetcc_g;   // From mdqctl of sparc_exu_ecl_mdqctl.v
   wire [1:0]           mdqctl_wb_multhr_g;     // From mdqctl of sparc_exu_ecl_mdqctl.v
   wire                 mdqctl_wb_yreg_shift_g; // From mdqctl of sparc_exu_ecl_mdqctl.v
   wire                 mdqctl_wb_yreg_wen_g;   // From mdqctl of sparc_exu_ecl_mdqctl.v
   wire [4:0]           wb_byplog_rd_g2;        // From writeback of sparc_exu_ecl_wb.v
   wire [4:0]           wb_byplog_rd_w2;        // From writeback of sparc_exu_ecl_wb.v
   wire [1:0]           wb_byplog_tid_w2;       // From writeback of sparc_exu_ecl_wb.v
   wire                 wb_byplog_wen_g2;       // From writeback of sparc_exu_ecl_wb.v
   wire                 wb_byplog_wen_w2;       // From writeback of sparc_exu_ecl_wb.v
   wire                 wb_ccr_setcc_g;         // From writeback of sparc_exu_ecl_wb.v
   wire                 wb_ccr_wrccr_w;         // From writeback of sparc_exu_ecl_wb.v
   wire                 wb_divcntl_ack_g;       // From writeback of sparc_exu_ecl_wb.v
   wire                 wb_e;                   // From writeback of sparc_exu_ecl_wb.v
   wire                 wb_eccctl_spec_wen_next;// From writeback of sparc_exu_ecl_wb.v
   // End of automatics
   wire                 clk;
   wire                 reset;
   wire                 ecl_reset_l;
   wire                ecl_byp_rs1_mux2_sel_rf;// To eccctl of sparc_exu_ecl_eccctl.v
   wire                ecl_byp_rs2_mux2_sel_rf;// To eccctl of sparc_exu_ecl_eccctl.v
   wire                ecl_byp_rs3_mux2_sel_rf;// To eccctl of sparc_exu_ecl_eccctl.v
   wire                ldxa_g;
   wire                ecl_byp_ldxa_g;
   wire                rs1_vld_e;
   wire                rs2_vld_e;
   wire                std_d;
   wire                std_e;
   wire                rs3_vld_d;
   wire                rs3_vld_e;
   wire                cancel_rs3_ecc_e;
   wire [4:0]  ifu_exu_rs1_d;  // source addresses
   wire [4:0]  ifu_exu_rs2_d;
   wire [4:0]  ifu_exu_rs3_d;
   wire [2:0]   ifu_exu_aluop_e;
   wire [2:0]   shiftop_d;
   wire [2:0]   shiftop_e;
   wire         enshift_e;
   wire         sel_sum_d;
   wire         sel_sum_e;
   wire         sub_e;        // Do subtraction for add ops
   wire         shft_sext_e;     // sign extend for R shift.  must be 0 for left
   wire         is_logic_e;       // opcode is for logic op
   wire         dont_move_e;
   wire         sethi_e;
   wire [4:0]   rd_e;
   wire  [4:0] rd_m;
   wire  [4:0] ecl_irf_rd_w;
   wire [1:0]  tid_d;
   wire [3:0] thr_d;
   wire [1:0]  tid_e;
   wire  [1:0] tid_m;
   wire [1:0]  tid_w;
   wire [1:0]  tid_w1;
   wire  [1:0] ecl_irf_tid_w;
   wire [3:0]  thr_m;
   wire [3:0]  ecl_rml_thr_w;
   wire        ecl_irf_wen_w;
   wire          extend64bit;   // bit that gets appended on 64 bit right shfts
   wire         c_used_d;       // actual c_in calculated in d_stage
   wire [1:0]  adder_xcc;
   wire [1:0]  adder_icc;
   wire        cc_e_3;          // cc_e for muls
   wire        cc_e_1;
   wire [3:0]  alu_xcc_e; // 64 bit ccs NZVC
   wire [3:0]  alu_icc_e; // 32 bit ccs NZVC
   wire        ialign_e;
   wire        ialign_m;
   wire        ifu_exu_tv_e;
   wire        ifu_exu_tagop_e;
   wire        tag_overflow;    // tag overflow has occured
   wire     tag_overflow_trap_e;   
   wire           ifu_exu_range_check_jlret_e;
   wire           ifu_exu_range_check_other_e;
   wire           addr_mask_e;
   wire           valid_range_check_jlret_e;
   wire           ifu_exu_range_check_jlret_m;
   wire           ifu_exu_range_check_other_m;
   wire           alu_ecl_mem_addr_invalid_m_l;
   wire           misalign_addr_e;
   wire           muls_rs1_31_m_l;
   wire           rs2_data_31_m;
   wire       save_e;
   wire       restore_e;
   wire [4:0] real_rd_e;
   wire       ifu_tlu_flush_w;
   wire          flush_w;
   wire          flush_w1;
   wire          part_early_flush_m;
   wire          part_early_flush_w;
   wire          pic_trap_m;
   wire          inst_vld_w1;
   wire          tlu_priv_trap_w;
   wire          early_flush_w;
   wire          thr_match_ew;
   wire          thr_match_mw1;
   wire          thr_match_mw;
   wire          thr_match_sd;
   wire          thr_match_de;
   wire          thr_match_se;
   wire          thr_match_dm;
   wire          ld_thr_match_sm;
   wire          ld_thr_match_dg;
   wire          ld_thr_match_sg;
   wire          ld_thr_match_dg2;
   wire	  	     ecl_exu_kill_m;
   wire	  	     kill_rml_m;
   wire          kill_rml_w;
   wire [3:0]    perr_store_next;
   wire [3:0]    perr_store;
   wire [3:0]    perr_kill;
   wire [4:0]    ld_rd_g;
   wire [1:0]    ld_tid_g;

   wire          read_yreg_e;
   wire          read_ffusr_e;
   wire          read_tlusr_e;
   wire          read_ffusr_m;
   wire          read_tlusr_m;
   
   // trap logic
   wire          ue_trap_m;
   wire [8:0]    early1_ttype_e;
   wire [8:0]    early2_ttype_e;
   wire [8:0]    early_ttype_m;
   wire          early_ttype_vld_e;
   wire          early_ttype_vld_m;
   wire          pick_not_aligned;
   wire          pick_tcc;
   wire          pick_normal_ttype;   
   wire          fill_trap_e;
   wire          fill_trap_m;
   wire       next_yreg_data_31;
   wire       muls_e;
   wire       zero_rs2_d;
   wire       div_e;
   wire       div_zero_m;


   wire [4:0]  ifu_exu_rs1_e;
   wire [4:0]  ifu_exu_rs1_m;
   wire [4:0]  ifu_exu_rs2_e;
   wire [4:0]  ifu_exu_rs2_m;
   wire [4:0]  ifu_exu_rs3_e;
   wire [4:0]  ifu_exu_rs3_m;
   wire [3:0]  div_ecl_yreg_0;
   wire   div_ecl_yreg_0_d;
   
   assign clk = rclk;
   // Reset flop
    dffrl_async rstff(.din (grst_l),
                        .q   (ecl_reset_l),
                        .clk (clk),
                        .rst_l (arst_l), .se(se), .si(), .so());
   assign reset = ~ecl_reset_l;
   
   // Pipeline flops for irf control signals
   dff_s #(5) dff_rs1_s2d(.din(ifu_exu_rs1_s[4:0]), .clk(clk), .q(ifu_exu_rs1_d[4:0]), .se(se),
                      .si(),.so());
   dff_s #(5) dff_rs2_s2d(.din(ifu_exu_rs2_s[4:0]), .clk(clk), .q(ifu_exu_rs2_d[4:0]), .se(se),
                      .si(),.so());
   dff_s #(5) dff_rs3_s2d(.din(ifu_exu_rs3_s[4:0]), .clk(clk), .q(ifu_exu_rs3_d[4:0]), .se(se),
                      .si(),.so());
   dff_s #(5) dff_rs1_d2e(.din(ifu_exu_rs1_d[4:0]), .clk(clk), .q(ifu_exu_rs1_e[4:0]), .se(se),
                      .si(),.so());
   dff_s #(5) dff_rs2_d2e(.din(ifu_exu_rs2_d[4:0]), .clk(clk), .q(ifu_exu_rs2_e[4:0]), .se(se),
                      .si(),.so());
   dff_s #(5) dff_rs3_d2e(.din(ifu_exu_rs3_d[4:0]), .clk(clk), .q(ifu_exu_rs3_e[4:0]), .se(se),
                      .si(),.so());
   dff_s #(5) dff_rs1_e2m(.din(ifu_exu_rs1_e[4:0]), .clk(clk), .q(ifu_exu_rs1_m[4:0]), .se(se),
                      .si(),.so());
   dff_s #(5) dff_rs2_e2m(.din(ifu_exu_rs2_e[4:0]), .clk(clk), .q(ifu_exu_rs2_m[4:0]), .se(se),
                      .si(),.so());
   dff_s #(5) dff_rs3_e2m(.din(ifu_exu_rs3_e[4:0]), .clk(clk), .q(ifu_exu_rs3_m[4:0]), .se(se),
                      .si(),.so());
   dff_s #(5) dff_ld_rd_m2g(.din(lsu_exu_rd_m[4:0]), .clk(clk), .q(ld_rd_g[4:0]), .se(se), .si(), .so());  
   dff_s #(2) dff_ld_tid_m2g(.din(lsu_exu_thr_m[1:0]), .clk(clk), .q(ld_tid_g[1:0]), .se(se), .si(), .so());
   
   // Pipeline flops for control signals
   dff_s #(3) dff_aluop_d2e(.din(ifu_exu_aluop_d[2:0]), .clk(clk), .q(ifu_exu_aluop_e[2:0]),
                        .se(se), .si(), .so());
   dff_s #(3) dff_shiftop_d2e(.din(shiftop_d[2:0]), .clk(clk),
                          .q(shiftop_e[2:0]), .se(se),
                          .si(), .so());
   dff_s dff_enshift_d2e(.din(ifu_exu_enshift_d), .clk(clk), .q(enshift_e),
                       .se(se), .si(), .so());
   dff_s dff_sel_sum_d2e(.din(sel_sum_d), .clk(clk), .q(sel_sum_e),
                       .se(se), .si(), .so());
   dff_s dff_tv_d2e(.din(ifu_exu_tv_d), .clk(clk), .q(ifu_exu_tv_e),
                  .se(se), .si(), .so());
   dff_s dff_tagop_d2e(.din(ifu_exu_tagop_d), .clk(clk), .q(ifu_exu_tagop_e),
                  .se(se), .si(), .so());
   dff_s dff_ialign_d2e(.din(ifu_exu_ialign_d), .clk(clk), .q(ialign_e),
                      .se(se), .si(), .so());
   dff_s dff_ialign_e2m(.din(ialign_e), .clk(clk), .q(ialign_m),
                      .se(se), .si(), .so());
   dff_s ldxa_dff(.din(lsu_exu_ldxa_m), .clk(clk), .q(ldxa_g), .se(se), .si(), .so());
   dff_s sethi_d2e(.din(ifu_exu_sethi_inst_d), .clk(clk), .q(sethi_e), .se(se), .si(), .so());
   dff_s rs1_vld_d2e(.din(ifu_exu_rs1_vld_d), .clk(clk), .q(rs1_vld_e), .se(se), .si(), .so());
   dff_s rs2_vld_d2e(.din(ifu_exu_rs2_vld_d), .clk(clk), .q(rs2_vld_e), .se(se), .si(), .so());
   assign rs3_vld_d = ifu_exu_rs3e_vld_d | ifu_exu_rs3o_vld_d;
   dff_s rs3_vld_d2e(.din(rs3_vld_d), .q(rs3_vld_e), .clk(clk), .se(se), .si(), .so());
   dff_s casa_d2e(.din(ifu_exu_casa_d), .q(ecl_alu_casa_e), .clk(clk), .se(se), .si(), .so());
   
   ///////////////////////////////
   // ALU Control
   ///////////////////////////////
   // Decode opcode for ALU
   // aluop: [move, log1, log0]
   // ADD = 00, AND = 01, OR = 10, XOR = 11
   // log_sel: [and, or, xor, pass]
   // out_sel: [sum, logic, shift]
   assign ecl_alu_log_sel_and_e = 
          (~ifu_exu_aluop_e[2] & ~ifu_exu_aluop_e[1] & ifu_exu_aluop_e[0]);
   assign ecl_alu_log_sel_or_e = (~ifu_exu_aluop_e[2] & ifu_exu_aluop_e[1]
                                     & ~ifu_exu_aluop_e[0]);
   assign ecl_alu_log_sel_xor_e = (~ifu_exu_aluop_e[2] & ifu_exu_aluop_e[1]
                                      & ifu_exu_aluop_e[0]);
   assign ecl_alu_log_sel_move_e = 
          (ifu_exu_aluop_e[2] | ~(ifu_exu_aluop_e[1] | ifu_exu_aluop_e[0]));

   assign is_logic_e = ifu_exu_aluop_e[2] | ifu_exu_aluop_e[1] |
          ifu_exu_aluop_e[0];

   assign ecl_alu_sethi_inst_e = sethi_e;// | ifu_exu_sethi_inst_e;

   assign dont_move_e = (exu_ifu_regz_e)? ifu_exu_dontmv_regz1_e:ifu_exu_dontmv_regz0_e;

   assign sel_sum_d = ~(ifu_exu_enshift_d | ifu_exu_aluop_d[2] |ifu_exu_aluop_d[1] |ifu_exu_aluop_d[0]); 
   assign ecl_alu_out_sel_sum_e_l = ~sel_sum_e;
   assign ecl_alu_out_sel_shift_e_l = ~(~is_logic_e & ~sel_sum_e);
   assign ecl_alu_out_sel_logic_e_l = ~(is_logic_e & ~dont_move_e & ~sel_sum_e);
   assign ecl_alu_out_sel_rs3_e_l = ~(is_logic_e & dont_move_e & ~sel_sum_e);// dontmove includes is_logic

   assign ecl_byp_sel_alu_e = ifu_exu_use_rsr_e_l;
   assign ecl_byp_sel_ifusr_e = ~ifu_exu_use_rsr_e_l & ifu_exu_rd_ifusr_e;
   assign ecl_byp_sel_yreg_e = ~ifu_exu_use_rsr_e_l & ~ifu_exu_rd_ifusr_e & read_yreg_e;
   assign ecl_byp_sel_eclpr_e = ~ifu_exu_use_rsr_e_l & ~ifu_exu_rd_ifusr_e & ~read_yreg_e;
        
   assign read_ffusr_e = ~ifu_exu_use_rsr_e_l & ifu_exu_rd_ffusr_e;
   assign read_tlusr_e = ~ifu_exu_use_rsr_e_l & ~ifu_exu_rd_ffusr_e & ~ifu_exu_rd_ifusr_e & ~ifu_exu_rd_exusr_e;
   assign ecl_byp_sel_ffusr_m = read_ffusr_m;
   assign ecl_byp_sel_tlusr_m = read_tlusr_m & ~read_ffusr_m;
   assign ecl_byp_sel_ifex_m = ~read_tlusr_m & ~read_ffusr_m;

   dff_s #(2) rsr_e2m(.din({read_ffusr_e, read_tlusr_e}), .clk(clk),
                    .q({read_ffusr_m, read_tlusr_m}), .se(se), .si(), .so());
 
   // ecc checking on rs3 will be cancelled if mov happens
   assign cancel_rs3_ecc_e = ~dont_move_e & is_logic_e;
   
   // compute xor for write to cwp
   assign ecl_rml_xor_data_e = byp_ecl_rs1_2_0_e[2:0] ^ byp_ecl_rs2_3_0_e[2:0];
   // Logic for muls control signals
   // icc.v ^ icc.n
   assign         ecl_div_muls_rs1_31_e_l = ~(cc_e_3 ^ cc_e_1);
   assign div_ecl_yreg_0[3:0] = ~div_ecl_yreg_0_l[3:0];
   mux4ds yreg0_mux(.dout(div_ecl_yreg_0_d),
                    .in0(div_ecl_yreg_0[0]),
                    .in1(div_ecl_yreg_0[1]),
                    .in2(div_ecl_yreg_0[2]),
                    .in3(div_ecl_yreg_0[3]),
                    .sel0(thr_d[0]),
                    .sel1(thr_d[1]),
                    .sel2(thr_d[2]),
                    .sel3(thr_d[3]));
                       
   assign zero_rs2_d = ifu_exu_muls_d & ~div_ecl_yreg_0_d;

   assign next_yreg_data_31 = (muls_e)? byp_ecl_rs1_2_0_e[0]:ecl_div_yreg_data_31_g; 
   dff_s dff_rs1_b0_m2w(.din(next_yreg_data_31), .clk(clk), .q(ecl_div_yreg_data_31_g),
                .se(se), .si(), .so());
   
   // Logic for carryin and subtract
   assign      c_used_d = ~(ifu_exu_invert_d ^ ~(exu_ifu_cc_d[0] & ifu_exu_usecin_d));
   // Pipeline flops
   dff_s sub_dff(.din(ifu_exu_invert_d), .clk(clk), .q(sub_e), .se(se),
               .si(), .so());
   dff_s c_used_dff(.din(c_used_d), .clk(clk), .q(ecl_alu_cin_e), .se(se),
                 .si(), .so());
   dff_s dff_muls_d2e(.din(ifu_exu_muls_d), .clk(clk), .q(muls_e),
                .se(se), .si(), .so());
   dff_s zero_rs2_dff(.din(zero_rs2_d), .clk(clk), .q(ecl_div_zero_rs2_e),
                    .se(se), .si(), .so());
   dff_s #(2) cc_d2e(.din({exu_ifu_cc_d[3],exu_ifu_cc_d[1]}), .clk(clk), .q({cc_e_3,cc_e_1}),
                   .se(se), .si(), .so());
   dff_s mulsrs131_e2m(.din(ecl_div_muls_rs1_31_e_l), .clk(clk),
                     .q(muls_rs1_31_m_l),
                     .se(se), .si(), .so());
   dff_s rs2_31_e2m(.din(byp_ecl_rs2_31_e), .clk(clk),
                  .q(rs2_data_31_m), .se(se), .si(), .so());
   
   dff_s save_dff(.din(ifu_exu_save_d), .clk(clk), .q(save_e), .se(se),
                .si(), .so());
   dff_s restore_dff(.din(ifu_exu_restore_d), .clk(clk), .q(restore_e), .se(se),
                .si(), .so());
   
   // Condition code generation
   assign      adder_xcc[0] = (~alu_ecl_cout64_e_l ^ sub_e) & sel_sum_e;
   assign      adder_icc[0] = (alu_ecl_cout32_e ^ sub_e) & sel_sum_e;
/* -----\/----- EXCLUDED -----\/-----
   assign adder_xcc[1] = ((byp_ecl_rs1_63_e & alu_ecl_adderin2_63_e & 
                             ~alu_ecl_adder_out_63_e) |
                           (~byp_ecl_rs1_63_e & ~alu_ecl_adderin2_63_e &
                             alu_ecl_adder_out_63_e));
   assign adder_icc[1] = ((byp_ecl_rs1_31_e & alu_ecl_adderin2_31_e & 
                             ~alu_ecl_adder_out_31_e) |
                           (~byp_ecl_rs1_31_e & ~alu_ecl_adderin2_31_e &
                             alu_ecl_adder_out_31_e));
 -----/\----- EXCLUDED -----/\----- */
   assign adder_xcc[1] = (alu_ecl_adder_out_63_e) ? (~byp_ecl_rs1_63_e & ~alu_ecl_adderin2_63_e & sel_sum_e):
                                                      (byp_ecl_rs1_63_e & alu_ecl_adderin2_63_e & sel_sum_e);
   assign adder_icc[1] = (alu_ecl_adder_out_31_e) ? ((~byp_ecl_rs1_31_e & ~alu_ecl_adderin2_31_e | tag_overflow) 
                                                     & sel_sum_e):
                                                      ((byp_ecl_rs1_31_e & alu_ecl_adderin2_31_e | tag_overflow)
                                                       & sel_sum_e);
   // Tagged overflow
   assign tag_overflow = (byp_ecl_rs1_2_0_e[0] | byp_ecl_rs1_2_0_e[1] |
                          byp_ecl_rs2_3_0_e[0] | byp_ecl_rs2_3_0_e[1]) & ifu_exu_tagop_e;

   // Set V C ccs assuming they are 0s for logic and shifting
   assign alu_xcc_e[3] = (sel_sum_e)? alu_ecl_add_n64_e: alu_ecl_log_n64_e;
   assign alu_xcc_e[2] = alu_ecl_zlow_e & alu_ecl_zhigh_e;
   assign alu_xcc_e[1:0] = adder_xcc[1:0]; // includes sel_sum
   
   assign alu_icc_e[3] = (sel_sum_e)? alu_ecl_add_n32_e: alu_ecl_log_n32_e;
   assign alu_icc_e[2] = alu_ecl_zlow_e;
   assign alu_icc_e[1:0] = adder_icc[1:0]; // includes sel_sum

   // Tag overflow exception on TV instruction with icc.v
   assign   tag_overflow_trap_e = ifu_exu_tv_e & adder_icc[1];
   
   // Mem address exception generation and flops
   assign   misalign_addr_e = (alu_ecl_adder_out_7_0_e[1] | alu_ecl_adder_out_7_0_e[0]) & ifu_exu_range_check_jlret_e;
   // jlret is used for misalign (E stage) and va hole (M stage).
   // if address mask is on then the va hole is not checked
   assign   valid_range_check_jlret_e = ifu_exu_range_check_jlret_e & ~addr_mask_e;
   assign   exu_ifu_va_oor_m = ~alu_ecl_mem_addr_invalid_m_l;
   assign exu_tlu_va_oor_m = (~alu_ecl_mem_addr_invalid_m_l &
                              ifu_exu_range_check_other_m);
   assign exu_tlu_va_oor_jl_ret_m = (~alu_ecl_mem_addr_invalid_m_l &
                                     ifu_exu_range_check_jlret_m);
   dff_s dff_addr_mask_d2e (.din(ifu_exu_addr_mask_d), .clk(clk), .q(addr_mask_e),
                          .se(se), .si(), .so());
   dff_s dff_mem_invalid_e2m(.din(alu_ecl_mem_addr_invalid_e_l), .clk(clk),
                           .q(alu_ecl_mem_addr_invalid_m_l), .se(se),
                           .si(), .so());
   dff_s dff_misalign_addr_e2m(.din(misalign_addr_e), .clk(clk),
                           .q(exu_tlu_misalign_addr_jmpl_rtn_m), .se(se),
                           .si(), .so());
   dff_s dff_range_check_jlret_d2e(.din(ifu_exu_range_check_jlret_d), .clk(clk),
                            .q(ifu_exu_range_check_jlret_e), .se(se),
                            .si(), .so());
   dff_s dff_range_check_jlret_e2m(.din(valid_range_check_jlret_e), .clk(clk),
                            .q(ifu_exu_range_check_jlret_m), .se(se),
                            .si(), .so());
   dff_s dff_range_check_other_d2e(.din(ifu_exu_range_check_other_d), .clk(clk),
                            .q(ifu_exu_range_check_other_e), .se(se),
                            .si(), .so());
   dff_s dff_range_check_other_e2m(.din(ifu_exu_range_check_other_e), .clk(clk),
                            .q(ifu_exu_range_check_other_m), .se(se),
                            .si(), .so());

   // 3lsbs can be zeroes for ialign
   assign ecl_byp_3lsb_m[2:0] = (ialign_m)? 3'b0: byp_ecl_rd_data_3lsb_m[2:0];

   /////////////////////////////
   // Generate Shift control
   /////////////////////////////
   assign shiftop_d[2:0] = ifu_exu_shiftop_d[2:0] & {3{ifu_exu_enshift_d}};
   // shiftop:
   //   2 = 64bit shift
   //   1 = Rshift (1), LShift (0)
   //   0 = arithmetic shift
   assign ecl_shft_lshift_e_l = shiftop_e[1];
   assign shft_sext_e = shiftop_e[0];
   assign ecl_shft_op32_e = ~shiftop_e[2];
   assign ecl_shft_enshift_e_l = ~enshift_e;
   // decide what sign extension for right shifts should be (in parallel w/
   // masking operation)
   assign ecl_shft_extend32bit_e_l = ~(ecl_shft_op32_e & byp_ecl_rs1_31_e
                                   & shft_sext_e);
   assign extend64bit = shft_sext_e & byp_ecl_rs1_63_e &
          ~ecl_shft_op32_e;
   assign ecl_shft_extendbit_e = (extend64bit | ~ecl_shft_extend32bit_e_l);
   
   // Get rid of top bit for 32 bit instructions
   //assign mod_shiftby_e[5]  = shiftop_e[2] & byp_ecl_rs2_3_0_e[5];
   // decode shiftby input into mux control signals
   //assign ecl_shft_shift16_e[0] = (~mod_shiftby_e[5] & ~mod_shiftby_e[4]);
   //assign ecl_shft_shift16_e[1] = (~mod_shiftby_e[5] & mod_shiftby_e[4]);
   //assign ecl_shft_shift16_e[2] = (mod_shiftby_e[5] & ~mod_shiftby_e[4]);
   //assign ecl_shft_shift16_e[3] = (mod_shiftby_e[5] & mod_shiftby_e[4]);

   assign ecl_shft_shift4_e[0] = (~byp_ecl_rs2_3_0_e[3] & ~byp_ecl_rs2_3_0_e[2]);
   assign ecl_shft_shift4_e[1] = (~byp_ecl_rs2_3_0_e[3] & byp_ecl_rs2_3_0_e[2]);
   assign ecl_shft_shift4_e[2] = (byp_ecl_rs2_3_0_e[3] & ~byp_ecl_rs2_3_0_e[2]);
   assign ecl_shft_shift4_e[3] = (byp_ecl_rs2_3_0_e[3] & byp_ecl_rs2_3_0_e[2]);

   assign ecl_shft_shift1_e[0] = (~byp_ecl_rs2_3_0_e[1] & ~byp_ecl_rs2_3_0_e[0]);
   assign ecl_shft_shift1_e[1] = (~byp_ecl_rs2_3_0_e[1] & byp_ecl_rs2_3_0_e[0]);
   assign ecl_shft_shift1_e[2] = (byp_ecl_rs2_3_0_e[1] & ~byp_ecl_rs2_3_0_e[0]);
   assign ecl_shft_shift1_e[3] = (byp_ecl_rs2_3_0_e[1] & byp_ecl_rs2_3_0_e[0]);


   // pipeline flops for bypass data
   dff_s #(5) dff_rd_d2e(.din(ifu_exu_rd_d[4:0]), .clk(clk), .q(rd_e[4:0]), .se(se),
                     .si(), .so());
   // account for switch of ins outs on save/restore
   assign real_rd_e[4] = rd_e[4] ^ (rd_e[3] & (save_e | restore_e));
   assign real_rd_e[3:0] = rd_e[3:0];
   dff_s #(5) dff_rd_e2m(.din(real_rd_e[4:0]), .clk(clk), .q(rd_m[4:0]), .se(se),
                     .si(), .so());
   dff_s #(5) dff_rd_m2w(.din(ecl_irf_rd_m[4:0]), .clk(clk), .q(ecl_irf_rd_w[4:0]), .se(se),
                     .si(), .so());
   dff_s #(2) dff_thr_s2d(.din(ifu_exu_tid_s2[1:0]), .clk(clk), .q(tid_d[1:0]), .se(se),
                      .si(), .so());
   dff_s #(2) dff_tid_d2e(.din(tid_d[1:0]), .clk(clk), .q(tid_e[1:0]), .se(se),
                      .si(), .so());
   dff_s #(2) dff_thr_e2m(.din(tid_e[1:0]), .clk(clk), .q(tid_m[1:0]), .se(se),
                      .si(), .so());
   // Need the original thr and the one with ld thr muxed in
   dff_s #(2) dff_tid_m2w(.din(tid_m[1:0]), .clk(clk), .q(tid_w[1:0]), .se(se),
                      .si(), .so());
   dff_s #(2) dff_tid_w2w1(.din(tid_w[1:0]), .clk(clk), .q(tid_w1[1:0]), .se(se),
                      .si(), .so());
   dff_s #(2) dff_irf_thr_m2w(.din(ecl_irf_tid_m[1:0]), .clk(clk), .q(ecl_irf_tid_w[1:0]), .se(se),
                      .si(), .so());

   // Thread decode
   // decode tid_d
   assign        thr_d[0] = ~tid_d[1] & ~tid_d[0];
   assign        thr_d[1] = ~tid_d[1] & tid_d[0];
   assign        thr_d[2] = tid_d[1] & ~tid_d[0];
   assign        thr_d[3] = tid_d[1] & tid_d[0];

   // decode thr_e
   assign        ecl_div_thr_e[0] = ~tid_e[1] & ~tid_e[0];
   assign        ecl_div_thr_e[1] = ~tid_e[1] & tid_e[0];
   assign        ecl_div_thr_e[2] = tid_e[1] & ~tid_e[0];
   assign        ecl_div_thr_e[3] = tid_e[1] & tid_e[0];
   
   // decode thr_m
   assign        thr_m[0] = ~tid_m[1] & ~tid_m[0];
   assign        thr_m[1] = ~tid_m[1] & tid_m[0];
   assign        thr_m[2] = tid_m[1] & ~tid_m[0];
   assign        thr_m[3] = tid_m[1] & tid_m[0];
   assign        ecl_rml_thr_m[3:0] = thr_m[3:0];
   // decode tid_w
   assign        ecl_rml_thr_w[0] = ~tid_w[1] & ~tid_w[0];
   assign        ecl_rml_thr_w[1] = ~tid_w[1] & tid_w[0];
   assign        ecl_rml_thr_w[2] = tid_w[1] & ~tid_w[0];
   assign        ecl_rml_thr_w[3] = tid_w[1] & tid_w[0];

   //////////////////////////////////////
   // Kill logic
   //////////////////////////////////////
   // a parity error on a store should kill the next instruction on that thread
   // perr_store_w sets the bit.  perr_kill_m says that the instruction in M should
   // be killed.  However, it does not check inst_vld or flush so it might be killing
   // an invalid instruction.  Therefore perr_store does not get cleared until W.  This
   // might cause an extra perr_kill_m, but that is OK because subsequent instructions will
   // be killed until the trap is taken.
   wire [3:0]    perr_store_w;
   wire [3:0]    perr_clear_w;
   wire          perr_kill_m;
   assign        perr_store_w[3] = tid_w[1] & tid_w[0] & lsu_exu_st_dtlb_perr_g;
   assign        perr_store_w[2] = tid_w[1] & ~tid_w[0] & lsu_exu_st_dtlb_perr_g;
   assign        perr_store_w[1] = ~tid_w[1] & tid_w[0] & lsu_exu_st_dtlb_perr_g;
   assign        perr_store_w[0] = ~tid_w[1] & ~tid_w[0] & lsu_exu_st_dtlb_perr_g;
   assign        perr_store_next[3] = perr_store_w[3] | perr_store[3] & ~perr_clear_w[3];
   assign        perr_store_next[2] = perr_store_w[2] | perr_store[2] & ~perr_clear_w[2];
   assign        perr_store_next[1] = perr_store_w[1] | perr_store[1] & ~perr_clear_w[1];
   assign        perr_store_next[0] = perr_store_w[0] | perr_store[0] & ~perr_clear_w[0];
   assign        perr_kill[3] = tid_m[1] & tid_m[0] & perr_store[3];
   assign        perr_kill[2] = tid_m[1] & ~tid_m[0] & perr_store[2];
   assign        perr_kill[1] = ~tid_m[1] & tid_m[0] & perr_store[1];
   assign        perr_kill[0] = ~tid_m[1] & ~tid_m[0] & perr_store[0];
   assign        perr_kill_m = |perr_kill[3:0] | lsu_exu_st_dtlb_perr_g & thr_match_mw;
   assign        perr_clear_w[3] = tid_w[1] & tid_w[0] & perr_store[3] & ifu_exu_inst_vld_w & ~ifu_tlu_flush_w;
   assign        perr_clear_w[2] = tid_w[1] & ~tid_w[0] & perr_store[2] & ifu_exu_inst_vld_w & ~ifu_tlu_flush_w;
   assign        perr_clear_w[1] = ~tid_w[1] & tid_w[0] & perr_store[1] & ifu_exu_inst_vld_w & ~ifu_tlu_flush_w;
   assign        perr_clear_w[0] = ~tid_w[1] & ~tid_w[0] & perr_store[0] & ifu_exu_inst_vld_w & ~ifu_tlu_flush_w;
   
   dffr_s #(4) perr_dff(.din(perr_store_next[3:0]), .clk(clk), .q(perr_store[3:0]), .si(), .so(), .se(se), .rst(reset));
   
   // calculate an early flush for killing writes in W
   // the pic trap occurs if there are too many instructions on a given thread.
   dff_s inst_vld_ww1(.din(ifu_exu_inst_vld_w), .clk(clk), .q(inst_vld_w1), .se(se), .si(), .so());
   assign pic_trap_m = ((tlu_exu_pic_onebelow_m & (thr_match_mw & ifu_exu_inst_vld_w | 
                                                   thr_match_mw1 & inst_vld_w1)) | 
                        (tlu_exu_pic_twobelow_m & thr_match_mw & ifu_exu_inst_vld_w &
                         thr_match_mw1 & inst_vld_w1));
   assign        part_early_flush_m = (exu_tlu_ttype_vld_m | ifu_exu_ttype_vld_m | exu_tlu_va_oor_jl_ret_m | 
                                       perr_kill_m | pic_trap_m);
   dff_s priv_trap_dff(.din(tlu_exu_priv_trap_m), .clk(clk), .q(tlu_priv_trap_w), .se(se), .si(), .so());
   dff_s early_flush_dff(.din(part_early_flush_m), .clk(clk), .q(part_early_flush_w), .se(se), .si(), .so());
   assign        early_flush_w = part_early_flush_w | tlu_priv_trap_w;
   assign        ecl_rml_early_flush_w = early_flush_w;
   
   // buffer this off so it only sees one load from the ifu
   assign        ecl_rml_inst_vld_w = ifu_exu_inst_vld_w & ~ifu_tlu_flush_w;

   dff_s flush_m2w(.din(ifu_tlu_flush_m), .clk(clk), .q(ifu_tlu_flush_w), .se(se), .si(), .so());
   assign        flush_w = ifu_tlu_flush_w | lsu_exu_flush_pipe_w;
   dff_s flush_w_dff(.din(flush_w), .clk(clk), .q(flush_w1), .se(se), .si(), .so());
   // allow misalign address on returns to kill the cwp switch
   // ttype[7] is a fill_trap so the return misalign should be ignored
   // UE trap should kill window ops.  This check is needed here because the
   // window traps will override the flush_W signals.
   assign        kill_rml_m = (ue_trap_m | ifu_exu_ttype_vld_m | perr_kill_m | pic_trap_m |
                               (exu_tlu_misalign_addr_jmpl_rtn_m & ~exu_tlu_ttype_m[7]));
   dff_s kill_rml_mw(.din(kill_rml_m), .clk(clk) , .q(kill_rml_w), .se(se), .si(), .so());
   // include tlu_priv_trap to cancel window traps
   assign        ecl_rml_kill_w = tlu_priv_trap_w | kill_rml_w;

   // pass kill_e through to the rml
   assign        ecl_rml_kill_e = ifu_exu_kill_e;
   
   assign        ecl_exu_kill_m = thr_match_mw1 & flush_w1;
   assign thr_match_mw = ~((tid_w[1] ^ tid_m[1]) |
                           (tid_w[0] ^ tid_m[0]));
   assign thr_match_ew = ~((tid_e[1] ^ tid_w[1]) |
                           (tid_e[0] ^ tid_w[0]));
   dff_s thr_match_ew_dff(.din(thr_match_ew), .clk(clk), .q(thr_match_mw1), .se(se), .si(), .so());

   // ldxa needs to check inst_vld and prior flushes
   assign ecl_byp_ldxa_g = ldxa_g & ifu_exu_inst_vld_w;   
   
   // controls for outputs to lsu
   assign std_d = ifu_exu_rs3e_vld_d & ifu_exu_rs3o_vld_d;
   dff_s std_d2e (.din(std_d), .q(std_e), .clk(clk), .se(se), .si(), .so());
   assign ecl_byp_std_e_l = ~std_e;

  
   //////////////////////////////////////
   // Trap output logic
   //-----------------------
   // In pipe traps (with priority order):
   // 029h: uncorrected ecc trap
   // 0C0h-0FFh: Fill trap
   // 024h: clean window trap
   // 034h: mem_address_not_aligned
   // 023h: Tag Overflow
   // 028h: Div by zero
   // 100h-17Fh: Trap instruction
   //////////////////////////////////////
   // ecc traps must be enabled
   assign fill_trap_e = rml_ecl_fill_e;
   
   assign early_ttype_vld_e = (rml_ecl_clean_window_e | rml_ecl_fill_e | 
                                 tag_overflow_trap_e | ifu_exu_tcc_e |
                                 misalign_addr_e);
   // This ttype includes clean window, fill, tag overflow, tcc, misalign address, and div zero.
   // Note that this will be div_zero on any divide instruction.  The valid will only be asserted if
   // div_zero is detected though.
   assign early1_ttype_e[8] = 1'b0;
   assign early1_ttype_e[7] = fill_trap_e;
   assign early1_ttype_e[6] = fill_trap_e;
   assign early1_ttype_e[5] = (rml_ecl_fill_e & rml_ecl_other_e) | 
                                (~rml_ecl_fill_e & (rml_ecl_clean_window_e | tag_overflow_trap_e | div_e));
   assign early1_ttype_e[4] = fill_trap_e & rml_ecl_wtype_e[2];
   assign early1_ttype_e[3] = (rml_ecl_fill_e & rml_ecl_wtype_e[1]) |
                           (~rml_ecl_fill_e & ~rml_ecl_clean_window_e & ~tag_overflow_trap_e & div_e);
   assign early1_ttype_e[2] = (fill_trap_e & rml_ecl_wtype_e[0]) |
                                 (~rml_ecl_fill_e & rml_ecl_clean_window_e);
   assign early1_ttype_e[1] = ~rml_ecl_fill_e & ~rml_ecl_clean_window_e & tag_overflow_trap_e;
   assign early1_ttype_e[0] = (~rml_ecl_fill_e & ~rml_ecl_clean_window_e & tag_overflow_trap_e);
   
   // mux together the ttypes
   // tcc only can be combined with an ue which is caught later so it isn't qualified by other traps
   assign pick_normal_ttype = ~pick_not_aligned & ~ifu_exu_tcc_e;
   assign pick_tcc = ifu_exu_tcc_e;
   assign pick_not_aligned = ~(rml_ecl_fill_e | rml_ecl_clean_window_e) & misalign_addr_e & ~ifu_exu_tcc_e;
   
   // the ue ttype is muxed in after the flop because it is so late
   mux3ds #(9) ttype_mux(.dout(early2_ttype_e[8:0]),
                         .in0(early1_ttype_e[8:0]),
                         .in1({1'b1, alu_ecl_adder_out_7_0_e[7:0]}),
                         .in2(9'h034),
                         .sel0(pick_normal_ttype),
                         .sel1(pick_tcc),
                         .sel2(pick_not_aligned));
   assign exu_tlu_ttype_m[8:0] = (ue_trap_m)? 9'h029: early_ttype_m[8:0];
   assign exu_tlu_ttype_vld_m = early_ttype_vld_m | ue_trap_m | div_zero_m;
   assign exu_tlu_ue_trap_m = ue_trap_m;
   
   dff_s ttype_vld_e2m(.din(early_ttype_vld_e), .clk(clk), .q(early_ttype_vld_m),
                     .se(se), .si(), .so());
   dff_s #(9) ttype_e2m(.din(early2_ttype_e[8:0]), .clk(clk), .q(early_ttype_m[8:0]),
                    .se(se), .si(), .so());
   // lsu needs to know about spill and ue traps for squashing sfsr writes
   dff_s fill_e2m(.din(fill_trap_e), .clk(clk), .q(fill_trap_m), .se(se), .si(), .so());
   assign exu_lsu_priority_trap_m = fill_trap_m | ue_trap_m;

   // Condition code Register
   sparc_exu_eclccr ccr(.wb_ccr_thr_g(ecl_irf_tid_g[1:0]),
                        .thrdec_d  (thr_d[3:0]),
                        .thr_w  (ecl_rml_thr_w[3:0]),
                       /*AUTOINST*/
                        // Outputs
                        .exu_ifu_cc_d   (exu_ifu_cc_d[7:0]),
                        .exu_tlu_ccr0_w (exu_tlu_ccr0_w[7:0]),
                        .exu_tlu_ccr1_w (exu_tlu_ccr1_w[7:0]),
                        .exu_tlu_ccr2_w (exu_tlu_ccr2_w[7:0]),
                        .exu_tlu_ccr3_w (exu_tlu_ccr3_w[7:0]),
                        // Inputs
                        .clk            (clk),
                        .se             (se),
                        .alu_xcc_e      (alu_xcc_e[3:0]),
                        .alu_icc_e      (alu_icc_e[3:0]),
                        .tid_d          (tid_d[1:0]),
                        .thr_match_dm   (thr_match_dm),
                        .thr_match_de   (thr_match_de),
                        .tid_w          (tid_w[1:0]),
                        .ifu_exu_kill_e (ifu_exu_kill_e),
                        .ifu_exu_setcc_d(ifu_exu_setcc_d),
                        .byp_ecl_wrccr_data_w(byp_ecl_wrccr_data_w[7:0]),
                        .wb_ccr_wrccr_w (wb_ccr_wrccr_w),
                        .wb_ccr_setcc_g (wb_ccr_setcc_g),
                        .divcntl_ccr_cc_w2(divcntl_ccr_cc_w2[7:0]),
                        .tlu_exu_cwpccr_update_m(tlu_exu_cwpccr_update_m),
                        .tlu_exu_ccr_m  (tlu_exu_ccr_m[7:0]),
                        .ifu_exu_inst_vld_w(ifu_exu_inst_vld_w),
                        .ifu_tlu_flush_w(ifu_tlu_flush_w),
                        .early_flush_w  (early_flush_w));
   
   // Writeback control logic
   sparc_exu_ecl_wb writeback(
                              .read_yreg_e(read_yreg_e),
                              /*AUTOINST*/
                              // Outputs
                              .wb_ccr_wrccr_w(wb_ccr_wrccr_w),
                              .ecl_rml_cwp_wen_e(ecl_rml_cwp_wen_e),
                              .ecl_rml_cansave_wen_w(ecl_rml_cansave_wen_w),
                              .ecl_rml_canrestore_wen_w(ecl_rml_canrestore_wen_w),
                              .ecl_rml_otherwin_wen_w(ecl_rml_otherwin_wen_w),
                              .ecl_rml_wstate_wen_w(ecl_rml_wstate_wen_w),
                              .ecl_rml_cleanwin_wen_w(ecl_rml_cleanwin_wen_w),
                              .ecl_byp_sel_load_m(ecl_byp_sel_load_m),
                              .ecl_byp_sel_restore_m(ecl_byp_sel_restore_m),
                              .ecl_byp_sel_pipe_m(ecl_byp_sel_pipe_m),
                              .ecl_byp_restore_m(ecl_byp_restore_m),
                              .ecl_irf_tid_m(ecl_irf_tid_m[1:0]),
                              .ecl_irf_rd_m(ecl_irf_rd_m[4:0]),
                              .ecl_irf_rd_g(ecl_irf_rd_g[4:0]),
                              .ecl_irf_wen_w2(ecl_irf_wen_w2),
                              .ecl_irf_tid_g(ecl_irf_tid_g[1:0]),
                              .wb_e     (wb_e),
                              .bypass_m (bypass_m),
                              .ecl_irf_wen_w(ecl_irf_wen_w),
                              .ecl_byp_sel_load_g(ecl_byp_sel_load_g),
                              .ecl_byp_sel_muldiv_g(ecl_byp_sel_muldiv_g),
                              .ecl_byp_sel_restore_g(ecl_byp_sel_restore_g),
                              .wb_divcntl_ack_g(wb_divcntl_ack_g),
                              .wb_ccr_setcc_g(wb_ccr_setcc_g),
                              .ecl_byp_eclpr_e(ecl_byp_eclpr_e[7:0]),
                              .exu_ifu_longop_done_g(exu_ifu_longop_done_g[3:0]),
                              .ecl_div_yreg_wen_w(ecl_div_yreg_wen_w[3:0]),
                              .ecl_div_yreg_wen_g(ecl_div_yreg_wen_g[3:0]),
                              .ecl_div_yreg_shift_g(ecl_div_yreg_shift_g[3:0]),
                              .ecl_div_yreg_wen_l(ecl_div_yreg_wen_l[3:0]),
                              .wb_eccctl_spec_wen_next(wb_eccctl_spec_wen_next),
                              .bypass_w (bypass_w),
                              .wb_byplog_rd_w2(wb_byplog_rd_w2[4:0]),
                              .wb_byplog_tid_w2(wb_byplog_tid_w2[1:0]),
                              .wb_byplog_wen_w2(wb_byplog_wen_w2),
                              .wb_byplog_rd_g2(wb_byplog_rd_g2[4:0]),
                              .wb_byplog_wen_g2(wb_byplog_wen_g2),
                              .exu_ffu_wsr_inst_e(exu_ffu_wsr_inst_e),
                              // Inputs
                              .clk      (clk),
                              .se       (se),
                              .reset    (reset),
                              .sehold   (sehold),
                              .ld_rd_g  (ld_rd_g[4:0]),
                              .ld_tid_g (ld_tid_g[1:0]),
                              .lsu_exu_dfill_vld_g(lsu_exu_dfill_vld_g),
                              .lsu_exu_ldst_miss_g2(lsu_exu_ldst_miss_g2),
                              .rd_m     (rd_m[4:0]),
                              .tid_m    (tid_m[1:0]),
                              .thr_m    (thr_m[3:0]),
                              .tid_w1   (tid_w1[1:0]),
                              .ifu_exu_wen_d(ifu_exu_wen_d),
                              .ifu_exu_kill_e(ifu_exu_kill_e),
                              .ecl_exu_kill_m(ecl_exu_kill_m),
                              .rml_ecl_kill_m(rml_ecl_kill_m),
                              .ifu_tlu_flush_w(ifu_tlu_flush_w),
                              .flush_w1 (flush_w1),
                              .divcntl_wb_req_g(divcntl_wb_req_g),
                              .mdqctl_wb_divrd_g(mdqctl_wb_divrd_g[4:0]),
                              .mdqctl_wb_divthr_g(mdqctl_wb_divthr_g[1:0]),
                              .mdqctl_wb_mulrd_g(mdqctl_wb_mulrd_g[4:0]),
                              .mdqctl_wb_multhr_g(mdqctl_wb_multhr_g[1:0]),
                              .mdqctl_wb_divsetcc_g(mdqctl_wb_divsetcc_g),
                              .mdqctl_wb_mulsetcc_g(mdqctl_wb_mulsetcc_g),
                              .ecl_div_sel_div(ecl_div_sel_div),
                              .ifu_tlu_wsr_inst_d(ifu_tlu_wsr_inst_d),
                              .ifu_tlu_sraddr_d(ifu_tlu_sraddr_d[6:0]),
                              .rml_ecl_cwp_d(rml_ecl_cwp_d[2:0]),
                              .rml_ecl_cansave_d(rml_ecl_cansave_d[2:0]),
                              .rml_ecl_canrestore_d(rml_ecl_canrestore_d[2:0]),
                              .rml_ecl_otherwin_d(rml_ecl_otherwin_d[2:0]),
                              .rml_ecl_wstate_d(rml_ecl_wstate_d[5:0]),
                              .rml_ecl_cleanwin_d(rml_ecl_cleanwin_d[2:0]),
                              .exu_ifu_cc_d(exu_ifu_cc_d[7:0]),
                              .rml_ecl_swap_done(rml_ecl_swap_done[3:0]),
                              .rml_ecl_rmlop_done_e(rml_ecl_rmlop_done_e),
                              .mdqctl_wb_yreg_wen_g(mdqctl_wb_yreg_wen_g),
                              .mdqctl_wb_yreg_shift_g(mdqctl_wb_yreg_shift_g),
                              .ecl_byp_sel_ecc_m(ecl_byp_sel_ecc_m),
                              .eccctl_wb_rd_m(eccctl_wb_rd_m[4:0]),
                              .ifu_exu_inst_vld_e(ifu_exu_inst_vld_e),
                              .ifu_exu_inst_vld_w(ifu_exu_inst_vld_w),
                              .ifu_exu_return_d(ifu_exu_return_d),
                              .restore_e(restore_e),
                              .rml_ecl_fill_e(rml_ecl_fill_e),
                              .early_flush_w(early_flush_w),
                              .ecl_byp_ldxa_g(ecl_byp_ldxa_g));

   ////////////////////////
   // ECC control logic
   ////////////////////////
   sparc_exu_ecl_eccctl eccctl(
                               .ue_trap_m(ue_trap_m),
                               /*AUTOINST*/
                               // Outputs
                               .ecl_ecc_sel_rs1_m_l(ecl_ecc_sel_rs1_m_l),
                               .ecl_ecc_sel_rs2_m_l(ecl_ecc_sel_rs2_m_l),
                               .ecl_ecc_sel_rs3_m_l(ecl_ecc_sel_rs3_m_l),
                               .ecl_ecc_log_rs1_m(ecl_ecc_log_rs1_m),
                               .ecl_ecc_log_rs2_m(ecl_ecc_log_rs2_m),
                               .ecl_ecc_log_rs3_m(ecl_ecc_log_rs3_m),
                               .ecl_byp_sel_ecc_m(ecl_byp_sel_ecc_m),
                               .ecl_ecc_rs1_use_rf_e(ecl_ecc_rs1_use_rf_e),
                               .ecl_ecc_rs2_use_rf_e(ecl_ecc_rs2_use_rf_e),
                               .ecl_ecc_rs3_use_rf_e(ecl_ecc_rs3_use_rf_e),
                               .eccctl_wb_rd_m(eccctl_wb_rd_m[4:0]),
                               .exu_ifu_ecc_ce_m(exu_ifu_ecc_ce_m),
                               .exu_ifu_ecc_ue_m(exu_ifu_ecc_ue_m),
                               .exu_ifu_err_reg_m(exu_ifu_err_reg_m[7:0]),
                               .ecl_byp_ecc_mask_m_l(ecl_byp_ecc_mask_m_l[7:0]),
                               .exu_ifu_inj_ack(exu_ifu_inj_ack),
                               .exu_ifu_err_synd_7_m(exu_ifu_err_synd_7_m),
                               // Inputs
                               .clk     (clk),
                               .se      (se),
                               .rst_tri_en(rst_tri_en),
                               .ecc_ecl_rs1_ce(ecc_ecl_rs1_ce),
                               .ecc_ecl_rs1_ue(ecc_ecl_rs1_ue),
                               .ecc_ecl_rs2_ce(ecc_ecl_rs2_ce),
                               .ecc_ecl_rs2_ue(ecc_ecl_rs2_ue),
                               .ecc_ecl_rs3_ce(ecc_ecl_rs3_ce),
                               .ecc_ecl_rs3_ue(ecc_ecl_rs3_ue),
                               .ecl_byp_rcc_mux2_sel_rf(ecl_byp_rcc_mux2_sel_rf),
                               .ecl_byp_rs2_mux2_sel_rf(ecl_byp_rs2_mux2_sel_rf),
                               .ecl_byp_rs3_mux2_sel_rf(ecl_byp_rs3_mux2_sel_rf),
                               .rs1_vld_e(rs1_vld_e),
                               .rs2_vld_e(rs2_vld_e),
                               .rs3_vld_e(rs3_vld_e),
                               .ifu_exu_rs1_m(ifu_exu_rs1_m[4:0]),
                               .ifu_exu_rs2_m(ifu_exu_rs2_m[4:0]),
                               .ifu_exu_rs3_m(ifu_exu_rs3_m[4:0]),
                               .rml_ecl_cwp_d(rml_ecl_cwp_d[2:0]),
                               .ifu_exu_ecc_mask(ifu_exu_ecc_mask[7:0]),
                               .ifu_exu_inj_irferr(ifu_exu_inj_irferr),
                               .ifu_exu_disable_ce_e(ifu_exu_disable_ce_e),
                               .wb_eccctl_spec_wen_next(wb_eccctl_spec_wen_next),
                               .ifu_exu_nceen_e(ifu_exu_nceen_e),
                               .ifu_exu_inst_vld_e(ifu_exu_inst_vld_e),
                               .rml_ecl_gl_e(rml_ecl_gl_e[1:0]),
                               .cancel_rs3_ecc_e(cancel_rs3_ecc_e));
   // Bypass logic
   // Precalculate some of the matching logic to help timing
   assign thr_match_sd =  ~((ifu_exu_tid_s2[1] ^ tid_d[1]) |
                           (ifu_exu_tid_s2[0] ^ tid_d[0]));
   dff_s thr_match_sd_dff(.din(thr_match_sd), .clk(clk), .q(thr_match_de),
                        .se(se), .si(), .so());
   assign thr_match_se =  ~((ifu_exu_tid_s2[1] ^ tid_e[1]) |
                           (ifu_exu_tid_s2[0] ^ tid_e[0]));
   dff_s thr_match_se_dff(.din(thr_match_se), .clk(clk), .q(thr_match_dm),
                        .se(se), .si(), .so());
   assign ld_thr_match_sm = ~((ifu_exu_tid_s2[1] ^ lsu_exu_thr_m[1]) |
                           (ifu_exu_tid_s2[0] ^ lsu_exu_thr_m[0]));
   dff_s ld_thr_match_sm_dff(.din(ld_thr_match_sm), .clk(clk), .q(ld_thr_match_dg), .se(se),
                           .si(), .so());
   assign ld_thr_match_sg = ~((ifu_exu_tid_s2[1] ^ ld_tid_g[1]) |
                           (ifu_exu_tid_s2[0] ^ ld_tid_g[0]));
   dff_s ld_thr_match_sg_dff(.din(ld_thr_match_sg), .clk(clk), .q(ld_thr_match_dg2), .se(se),
                           .si(), .so());
   sparc_exu_eclbyplog_rs1 byplog_rs1(.rs_sel_mux1_m(ecl_byp_rs1_mux1_sel_m),
                                  .rs_sel_mux1_w(ecl_byp_rs1_mux1_sel_w),
                                  .rs_sel_mux1_w2(ecl_byp_rs1_mux1_sel_w2),
                                  .rs_sel_mux1_other(ecl_byp_rs1_mux1_sel_other),
                                  .rs_sel_mux2_e(ecl_byp_rs1_mux2_sel_e),
                                  .rs_sel_mux2_rf(ecl_byp_rs1_mux2_sel_rf),
                                  .rs_sel_mux2_ld(ecl_byp_rs1_mux2_sel_ld),
                                  .rs_sel_mux2_usemux1(ecl_byp_rs1_mux2_sel_usemux1),
                                  .rs_sel_longmux_g2(ecl_byp_rs1_longmux_sel_g2),
                                  .rs_sel_longmux_w2(ecl_byp_rs1_longmux_sel_w2),
                                  .rs_sel_longmux_ldxa(ecl_byp_rs1_longmux_sel_ldxa),
                                  .rs   (ifu_exu_rs1_d[4:0]),
                                  .use_other(ifu_exu_dbrinst_d),
                                  /*AUTOINST*/
                                      // Outputs
                                      .ecl_byp_rcc_mux1_sel_m(ecl_byp_rcc_mux1_sel_m),
                                      .ecl_byp_rcc_mux1_sel_w(ecl_byp_rcc_mux1_sel_w),
                                      .ecl_byp_rcc_mux1_sel_w2(ecl_byp_rcc_mux1_sel_w2),
                                      .ecl_byp_rcc_mux1_sel_other(ecl_byp_rcc_mux1_sel_other),
                                      .ecl_byp_rcc_mux2_sel_usemux1(ecl_byp_rcc_mux2_sel_usemux1),
                                      .ecl_byp_rcc_mux2_sel_rf(ecl_byp_rcc_mux2_sel_rf),
                                      .ecl_byp_rcc_mux2_sel_e(ecl_byp_rcc_mux2_sel_e),
                                      .ecl_byp_rcc_mux2_sel_ld(ecl_byp_rcc_mux2_sel_ld),
                                      // Inputs
                                      .sehold(sehold),
                                      .rd_e(rd_e[4:0]),
                                      .rd_m(rd_m[4:0]),
                                      .ecl_irf_rd_w(ecl_irf_rd_w[4:0]),
                                      .ld_rd_g(ld_rd_g[4:0]),
                                      .wb_byplog_rd_w2(wb_byplog_rd_w2[4:0]),
                                      .wb_byplog_rd_g2(wb_byplog_rd_g2[4:0]),
                                      .tid_d(tid_d[1:0]),
                                      .thr_match_de(thr_match_de),
                                      .thr_match_dm(thr_match_dm),
                                      .ecl_irf_tid_w(ecl_irf_tid_w[1:0]),
                                      .ld_thr_match_dg(ld_thr_match_dg),
                                      .wb_byplog_tid_w2(wb_byplog_tid_w2[1:0]),
                                      .ld_thr_match_dg2(ld_thr_match_dg2),
                                      .ifu_exu_kill_e(ifu_exu_kill_e),
                                      .wb_e(wb_e),
                                      .bypass_m(bypass_m),
                                      .lsu_exu_dfill_vld_g(lsu_exu_dfill_vld_g),
                                      .bypass_w(bypass_w),
                                      .wb_byplog_wen_w2(wb_byplog_wen_w2),
                                      .wb_byplog_wen_g2(wb_byplog_wen_g2),
                                      .ecl_byp_ldxa_g(ecl_byp_ldxa_g));

   sparc_exu_eclbyplog byplog_rs2(.rs_sel_mux1_m(ecl_byp_rs2_mux1_sel_m),
                                  .rs_sel_mux1_w(ecl_byp_rs2_mux1_sel_w),
                                  .rs_sel_mux1_w2(ecl_byp_rs2_mux1_sel_w2),
                                  .rs_sel_mux1_other(ecl_byp_rs2_mux1_sel_other),
                                  .rs_sel_mux2_e(ecl_byp_rs2_mux2_sel_e),
                                  .rs_sel_mux2_rf(ecl_byp_rs2_mux2_sel_rf),
                                  .rs_sel_mux2_ld(ecl_byp_rs2_mux2_sel_ld),
                                  .rs_sel_mux2_usemux1(ecl_byp_rs2_mux2_sel_usemux1),
                                  .rs_sel_longmux_g2(ecl_byp_rs2_longmux_sel_g2),
                                  .rs_sel_longmux_w2(ecl_byp_rs2_longmux_sel_w2),
                                  .rs_sel_longmux_ldxa(ecl_byp_rs2_longmux_sel_ldxa),
                                  .rs   (ifu_exu_rs2_d[4:0]),
                                  .use_other(ifu_exu_useimm_d),
                                  /*AUTOINST*/
                                  // Inputs
                                  .sehold(sehold),
                                  .rd_e (rd_e[4:0]),
                                  .rd_m (rd_m[4:0]),
                                  .ecl_irf_rd_w(ecl_irf_rd_w[4:0]),
                                  .ld_rd_g(ld_rd_g[4:0]),
                                  .wb_byplog_rd_w2(wb_byplog_rd_w2[4:0]),
                                  .wb_byplog_rd_g2(wb_byplog_rd_g2[4:0]),
                                  .tid_d(tid_d[1:0]),
                                  .thr_match_de(thr_match_de),
                                  .thr_match_dm(thr_match_dm),
                                  .ecl_irf_tid_w(ecl_irf_tid_w[1:0]),
                                  .ld_thr_match_dg(ld_thr_match_dg),
                                  .wb_byplog_tid_w2(wb_byplog_tid_w2[1:0]),
                                  .ld_thr_match_dg2(ld_thr_match_dg2),
                                  .ifu_exu_kill_e(ifu_exu_kill_e),
                                  .wb_e (wb_e),
                                  .bypass_m(bypass_m),
                                  .lsu_exu_dfill_vld_g(lsu_exu_dfill_vld_g),
                                  .bypass_w(bypass_w),
                                  .wb_byplog_wen_w2(wb_byplog_wen_w2),
                                  .wb_byplog_wen_g2(wb_byplog_wen_g2),
                                  .ecl_byp_ldxa_g(ecl_byp_ldxa_g));
   sparc_exu_eclbyplog byplog_rs3(.rs_sel_mux1_m(ecl_byp_rs3_mux1_sel_m),
                                  .rs_sel_mux1_w(ecl_byp_rs3_mux1_sel_w),
                                  .rs_sel_mux1_w2(ecl_byp_rs3_mux1_sel_w2),
                                  .rs_sel_mux1_other(ecl_byp_rs3_mux1_sel_other),
                                  .rs_sel_mux2_e(ecl_byp_rs3_mux2_sel_e),
                                  .rs_sel_mux2_rf(ecl_byp_rs3_mux2_sel_rf),
                                  .rs_sel_mux2_ld(ecl_byp_rs3_mux2_sel_ld),
                                  .rs_sel_mux2_usemux1(ecl_byp_rs3_mux2_sel_usemux1),
                                  .rs_sel_longmux_g2(ecl_byp_rs3_longmux_sel_g2),
                                  .rs_sel_longmux_w2(ecl_byp_rs3_longmux_sel_w2),
                                  .rs_sel_longmux_ldxa(ecl_byp_rs3_longmux_sel_ldxa),
                                  .rs   ({ifu_exu_rs3_d[4:0]}),
                                  .use_other(1'b0),
                                  /*AUTOINST*/
                                  // Inputs
                                  .sehold(sehold),
                                  .rd_e (rd_e[4:0]),
                                  .rd_m (rd_m[4:0]),
                                  .ecl_irf_rd_w(ecl_irf_rd_w[4:0]),
                                  .ld_rd_g(ld_rd_g[4:0]),
                                  .wb_byplog_rd_w2(wb_byplog_rd_w2[4:0]),
                                  .wb_byplog_rd_g2(wb_byplog_rd_g2[4:0]),
                                  .tid_d(tid_d[1:0]),
                                  .thr_match_de(thr_match_de),
                                  .thr_match_dm(thr_match_dm),
                                  .ecl_irf_tid_w(ecl_irf_tid_w[1:0]),
                                  .ld_thr_match_dg(ld_thr_match_dg),
                                  .wb_byplog_tid_w2(wb_byplog_tid_w2[1:0]),
                                  .ld_thr_match_dg2(ld_thr_match_dg2),
                                  .ifu_exu_kill_e(ifu_exu_kill_e),
                                  .wb_e (wb_e),
                                  .bypass_m(bypass_m),
                                  .lsu_exu_dfill_vld_g(lsu_exu_dfill_vld_g),
                                  .bypass_w(bypass_w),
                                  .wb_byplog_wen_w2(wb_byplog_wen_w2),
                                  .wb_byplog_wen_g2(wb_byplog_wen_g2),
                                  .ecl_byp_ldxa_g(ecl_byp_ldxa_g));
   sparc_exu_eclbyplog byplog_rs3h(.rs_sel_mux1_m(ecl_byp_rs3h_mux1_sel_m),
                                  .rs_sel_mux1_w(ecl_byp_rs3h_mux1_sel_w),
                                  .rs_sel_mux1_w2(ecl_byp_rs3h_mux1_sel_w2),
                                  .rs_sel_mux1_other(ecl_byp_rs3h_mux1_sel_other),
                                  .rs_sel_mux2_e(ecl_byp_rs3h_mux2_sel_e),
                                  .rs_sel_mux2_rf(ecl_byp_rs3h_mux2_sel_rf),
                                  .rs_sel_mux2_ld(ecl_byp_rs3h_mux2_sel_ld),
                                  .rs_sel_mux2_usemux1(ecl_byp_rs3h_mux2_sel_usemux1),
                                  .rs_sel_longmux_g2(ecl_byp_rs3h_longmux_sel_g2),
                                  .rs_sel_longmux_w2(ecl_byp_rs3h_longmux_sel_w2),
                                  .rs_sel_longmux_ldxa(ecl_byp_rs3h_longmux_sel_ldxa),
                                  .rs   ({ifu_exu_rs3_d[4:1],1'b1}),
                                  .use_other(1'b0),
                                  /*AUTOINST*/
                                   // Inputs
                                   .sehold(sehold),
                                   .rd_e(rd_e[4:0]),
                                   .rd_m(rd_m[4:0]),
                                   .ecl_irf_rd_w(ecl_irf_rd_w[4:0]),
                                   .ld_rd_g(ld_rd_g[4:0]),
                                   .wb_byplog_rd_w2(wb_byplog_rd_w2[4:0]),
                                   .wb_byplog_rd_g2(wb_byplog_rd_g2[4:0]),
                                   .tid_d(tid_d[1:0]),
                                   .thr_match_de(thr_match_de),
                                   .thr_match_dm(thr_match_dm),
                                   .ecl_irf_tid_w(ecl_irf_tid_w[1:0]),
                                   .ld_thr_match_dg(ld_thr_match_dg),
                                   .wb_byplog_tid_w2(wb_byplog_tid_w2[1:0]),
                                   .ld_thr_match_dg2(ld_thr_match_dg2),
                                   .ifu_exu_kill_e(ifu_exu_kill_e),
                                   .wb_e(wb_e),
                                   .bypass_m(bypass_m),
                                   .lsu_exu_dfill_vld_g(lsu_exu_dfill_vld_g),
                                   .bypass_w(bypass_w),
                                   .wb_byplog_wen_w2(wb_byplog_wen_w2),
                                   .wb_byplog_wen_g2(wb_byplog_wen_g2),
                                   .ecl_byp_ldxa_g(ecl_byp_ldxa_g));

   /////////////////////////
   // Division control logic
   /////////////////////////
   sparc_exu_ecl_divcntl divcntl(
                                 .div_ecl_divisorin_31(byp_ecl_rs2_31_e),                                 
                                 /*AUTOINST*/
                                 // Outputs
                                 .ecl_div_xinmask(ecl_div_xinmask),
                                 .ecl_div_keep_d(ecl_div_keep_d),
                                 .ecl_div_ld_inputs(ecl_div_ld_inputs),
                                 .ecl_div_sel_adder(ecl_div_sel_adder),
                                 .ecl_div_last_cycle(ecl_div_last_cycle),
                                 .ecl_div_almostlast_cycle(ecl_div_almostlast_cycle),
                                 .ecl_div_sel_div(ecl_div_sel_div),
                                 .divcntl_wb_req_g(divcntl_wb_req_g),
                                 .divcntl_ccr_cc_w2(divcntl_ccr_cc_w2[7:0]),
                                 .ecl_div_sel_64b(ecl_div_sel_64b),
                                 .ecl_div_sel_u32(ecl_div_sel_u32),
                                 .ecl_div_sel_pos32(ecl_div_sel_pos32),
                                 .ecl_div_sel_neg32(ecl_div_sel_neg32),
                                 .ecl_div_upper32_zero(ecl_div_upper32_zero),
                                 .ecl_div_upper33_one(ecl_div_upper33_one),
                                 .ecl_div_upper33_zero(ecl_div_upper33_zero),
                                 .ecl_div_dividend_sign(ecl_div_dividend_sign),
                                 .ecl_div_newq(ecl_div_newq),
                                 .ecl_div_subtract_l(ecl_div_subtract_l),
                                 .ecl_div_keepx(ecl_div_keepx),
                                 .ecl_div_cin(ecl_div_cin),
                                 // Inputs
                                 .clk   (clk),
                                 .se    (se),
                                 .reset (reset),
                                 .mdqctl_divcntl_input_vld(mdqctl_divcntl_input_vld),
                                 .wb_divcntl_ack_g(wb_divcntl_ack_g),
                                 .mdqctl_divcntl_reset_div(mdqctl_divcntl_reset_div),
                                 .div_ecl_gencc_in_msb_l(div_ecl_gencc_in_msb_l),
                                 .div_ecl_gencc_in_31(div_ecl_gencc_in_31),
                                 .div_ecl_upper32_equal(div_ecl_upper32_equal),
                                 .div_ecl_low32_nonzero(div_ecl_low32_nonzero),
                                 .ecl_div_signed_div(ecl_div_signed_div),
                                 .div_ecl_dividend_msb(div_ecl_dividend_msb),
                                 .div_ecl_xin_msb_l(div_ecl_xin_msb_l),
                                 .div_ecl_x_msb(div_ecl_x_msb),
                                 .div_ecl_d_msb(div_ecl_d_msb),
                                 .div_ecl_cout64(div_ecl_cout64),
                                 .ecl_div_div64(ecl_div_div64),
                                 .mdqctl_divcntl_muldone(mdqctl_divcntl_muldone),
                                 .ecl_div_muls(ecl_div_muls),
                                 .div_ecl_adder_out_31(div_ecl_adder_out_31),
                                 .muls_rs1_31_m_l(muls_rs1_31_m_l),
                                 .div_ecl_cout32(div_ecl_cout32),
                                 .rs2_data_31_m(rs2_data_31_m),
                                 .div_ecl_detect_zero_high(div_ecl_detect_zero_high),
                                 .div_ecl_detect_zero_low(div_ecl_detect_zero_low),
                                 .div_ecl_d_62(div_ecl_d_62));

   assign div_e = mdqctl_divcntl_input_vld;
   sparc_exu_ecl_mdqctl mdqctl(.div_zero_m(div_zero_m),
                               .byp_alu_rs1_data_31_e(byp_ecl_rs1_31_e),
                               .byp_alu_rs2_data_31_e(byp_ecl_rs2_31_e),
                               /*AUTOINST*/
                               // Outputs
                               .mdqctl_divcntl_input_vld(mdqctl_divcntl_input_vld),
                               .mdqctl_divcntl_reset_div(mdqctl_divcntl_reset_div),
                               .mdqctl_divcntl_muldone(mdqctl_divcntl_muldone),
                               .ecl_div_div64(ecl_div_div64),
                               .ecl_div_signed_div(ecl_div_signed_div),
                               .ecl_div_muls(ecl_div_muls),
                               .mdqctl_wb_divthr_g(mdqctl_wb_divthr_g[1:0]),
                               .mdqctl_wb_divrd_g(mdqctl_wb_divrd_g[4:0]),
                               .mdqctl_wb_multhr_g(mdqctl_wb_multhr_g[1:0]),
                               .mdqctl_wb_mulrd_g(mdqctl_wb_mulrd_g[4:0]),
                               .mdqctl_wb_divsetcc_g(mdqctl_wb_divsetcc_g),
                               .mdqctl_wb_mulsetcc_g(mdqctl_wb_mulsetcc_g),
                               .mdqctl_wb_yreg_shift_g(mdqctl_wb_yreg_shift_g),
                               .exu_mul_input_vld(exu_mul_input_vld),
                               .mdqctl_wb_yreg_wen_g(mdqctl_wb_yreg_wen_g),
                               .ecl_div_mul_sext_rs1_e(ecl_div_mul_sext_rs1_e),
                               .ecl_div_mul_sext_rs2_e(ecl_div_mul_sext_rs2_e),
                               .ecl_div_mul_get_new_data(ecl_div_mul_get_new_data),
                               .ecl_div_mul_keep_data(ecl_div_mul_keep_data),
                               .ecl_div_mul_get_32bit_data(ecl_div_mul_get_32bit_data),
                               .ecl_div_mul_wen(ecl_div_mul_wen),
                               // Inputs
                               .clk     (clk),
                               .se      (se),
                               .reset   (reset),
                               .ifu_exu_muldivop_d(ifu_exu_muldivop_d[4:0]),
                               .tid_d   (tid_d[1:0]),
                               .ifu_exu_rd_d(ifu_exu_rd_d[4:0]),
                               .tid_w1  (tid_w1[1:0]),
                               .flush_w1(flush_w1),
                               .ifu_exu_inst_vld_w(ifu_exu_inst_vld_w),
                               .wb_divcntl_ack_g(wb_divcntl_ack_g),
                               .divcntl_wb_req_g(divcntl_wb_req_g),
                               .mul_exu_ack(mul_exu_ack),
                               .ecl_div_sel_div(ecl_div_sel_div),
                               .ifu_exu_muls_d(ifu_exu_muls_d),
                               .div_ecl_detect_zero_high(div_ecl_detect_zero_high),
                               .div_ecl_detect_zero_low(div_ecl_detect_zero_low),
                               .ifu_tlu_flush_w(ifu_tlu_flush_w),
                               .early_flush_w(early_flush_w));

endmodule // sparc_exu_ecl


