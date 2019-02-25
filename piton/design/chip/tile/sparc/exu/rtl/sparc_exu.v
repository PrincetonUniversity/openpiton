// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu.v
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
//  Module Name: sparc_exu
//	Description: Execution unit containing register file(IRF),
//			execution control (ECL), ALU, shifting (SHFT).
*/

`include "define.tmp.h"
`include "lsu.tmp.h"

module sparc_exu (/*AUTOARG*/
   // Outputs
   exu_tlu_wsr_data_m, exu_tlu_va_oor_m, exu_tlu_va_oor_jl_ret_m, 
   exu_tlu_ue_trap_m, exu_tlu_ttype_vld_m, exu_tlu_ttype_m, 
   exu_tlu_spill_wtype, exu_tlu_spill_tid, exu_tlu_spill_other, 
   exu_tlu_spill, exu_tlu_misalign_addr_jmpl_rtn_m, 
   exu_tlu_cwp_retry, exu_tlu_cwp_cmplt_tid, exu_tlu_cwp_cmplt, 
   exu_tlu_cwp3_w, exu_tlu_cwp2_w, exu_tlu_cwp1_w, exu_tlu_cwp0_w, 
   exu_tlu_ccr3_w, exu_tlu_ccr2_w, exu_tlu_ccr1_w, exu_tlu_ccr0_w, 
   exu_spu_rs3_data_e, exu_mul_rs2_data, exu_mul_rs1_data, 
   exu_mul_input_vld, exu_mmu_early_va_e, exu_lsu_rs3_data_e, 
   exu_lsu_rs2_data_e, exu_lsu_priority_trap_m, exu_lsu_ldst_va_e, 
   exu_lsu_early_va_e, exu_ifu_va_oor_m, exu_ifu_spill_e, 
   exu_ifu_regz_e, exu_ifu_regn_e, exu_ifu_oddwin_s, 
   exu_ifu_longop_done_g, exu_ifu_inj_ack, exu_ifu_err_reg_m, 
   exu_ifu_ecc_ue_m, exu_ifu_ecc_ce_m, exu_ifu_cc_d, exu_ifu_brpc_e, 
   exu_ffu_wsr_inst_e, short_so0, short_so1, so0, exu_ifu_err_synd_m, 
   // Inputs
   tlu_exu_rsr_data_m, tlu_exu_priv_trap_m, tlu_exu_pic_twobelow_m, 
   tlu_exu_pic_onebelow_m, tlu_exu_cwpccr_update_m, 
   tlu_exu_cwp_retry_m, tlu_exu_cwp_m, tlu_exu_ccr_m, 
   tlu_exu_agp_tid, tlu_exu_agp_swap, tlu_exu_agp, sehold, se, rclk, 
   mul_exu_data_g, mul_exu_ack, lsu_exu_thr_m, 
   lsu_exu_st_dtlb_perr_g, lsu_exu_rd_m, lsu_exu_ldxa_m, 
   lsu_exu_ldxa_data_g, lsu_exu_ldst_miss_g2, lsu_exu_flush_pipe_w, 
   lsu_exu_dfill_vld_g, lsu_exu_dfill_data_g, ifu_tlu_wsr_inst_d, 
   ifu_tlu_sraddr_d, ifu_tlu_flush_m, ifu_exu_wen_d, 
   ifu_exu_useimm_d, ifu_exu_usecin_d, ifu_exu_use_rsr_e_l, 
   ifu_exu_tv_d, ifu_exu_ttype_vld_m, ifu_exu_tid_s2, ifu_exu_tcc_e, 
   ifu_exu_tagop_d, ifu_exu_shiftop_d, ifu_exu_sethi_inst_d, 
   ifu_exu_setcc_d, ifu_exu_saved_e, ifu_exu_save_d, 
   ifu_exu_rs3o_vld_d, ifu_exu_rs3e_vld_d, ifu_exu_rs3_s, 
   ifu_exu_rs2_vld_d, ifu_exu_rs2_s, ifu_exu_rs1_vld_d, 
   ifu_exu_rs1_s, ifu_exu_return_d, ifu_exu_restored_e, 
   ifu_exu_restore_d, ifu_exu_ren3_s, ifu_exu_ren2_s, ifu_exu_ren1_s, 
   ifu_exu_rd_ifusr_e, ifu_exu_rd_ffusr_e, ifu_exu_rd_exusr_e, 
   ifu_exu_rd_d, ifu_exu_range_check_other_d, 
   ifu_exu_range_check_jlret_d, ifu_exu_pcver_e, ifu_exu_pc_d, 
   ifu_exu_nceen_e, ifu_exu_muls_d, ifu_exu_muldivop_d, 
   ifu_exu_kill_e, ifu_exu_invert_d, ifu_exu_inst_vld_w, 
   ifu_exu_inst_vld_e, ifu_exu_inj_irferr, ifu_exu_imm_data_d, 
   ifu_exu_ialign_d, ifu_exu_flushw_e, ifu_exu_enshift_d, 
   ifu_exu_ecc_mask, ifu_exu_dontmv_regz1_e, ifu_exu_dontmv_regz0_e, 
   ifu_exu_disable_ce_e, ifu_exu_dbrinst_d, ifu_exu_casa_d, 
   ifu_exu_aluop_d, ifu_exu_addr_mask_d, grst_l, ffu_exu_rsr_data_m, 
   arst_l, 
   // mux_drive_disable, mem_write_disable, 
   short_si0, 
   short_si1, si0,

   core_rtap_data,
   rtap_core_val,
   rtap_core_threadid,
   rtap_core_id,
   rtap_core_data
   ) ;

output wire [`CORE_JTAG_BUS_WIDTH-1:0] core_rtap_data;
input wire rtap_core_val;
input wire [1:0] rtap_core_threadid;
input wire [`JTAG_CORE_ID_WIDTH-1:0]  rtap_core_id;
input wire [`CORE_JTAG_BUS_WIDTH-1:0] rtap_core_data;

   // input mux_drive_disable;
   // input mem_write_disable;
   // wire mux_drive_disable = 0;
   // wire mem_write_disable = 0;
   input short_si0;
   input short_si1;
   input si0;
   output short_so0;
   output short_so1;
   output so0;
   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   input                arst_l;                 // To ecl of sparc_exu_ecl.v, ...
   input [63:0]         ffu_exu_rsr_data_m;     // To bypass of sparc_exu_byp.v
   input                grst_l;                 // To ecl of sparc_exu_ecl.v, ...
   input                ifu_exu_addr_mask_d;    // To ecl of sparc_exu_ecl.v
   input [2:0]          ifu_exu_aluop_d;        // To ecl of sparc_exu_ecl.v
   input                ifu_exu_casa_d;         // To ecl of sparc_exu_ecl.v
   input                ifu_exu_dbrinst_d;      // To ecl of sparc_exu_ecl.v
   input                ifu_exu_disable_ce_e;   // To ecl of sparc_exu_ecl.v
   input                ifu_exu_dontmv_regz0_e; // To ecl of sparc_exu_ecl.v
   input                ifu_exu_dontmv_regz1_e; // To ecl of sparc_exu_ecl.v
   input [7:0]          ifu_exu_ecc_mask;       // To ecl of sparc_exu_ecl.v
   input                ifu_exu_enshift_d;      // To ecl of sparc_exu_ecl.v
   input                ifu_exu_flushw_e;       // To rml of sparc_exu_rml.v
   input                ifu_exu_ialign_d;       // To ecl of sparc_exu_ecl.v
   input [31:0]         ifu_exu_imm_data_d;     // To bypass of sparc_exu_byp.v
   input                ifu_exu_inj_irferr;     // To ecl of sparc_exu_ecl.v
   input                ifu_exu_inst_vld_e;     // To ecl of sparc_exu_ecl.v
   input                ifu_exu_inst_vld_w;     // To ecl of sparc_exu_ecl.v
   input                ifu_exu_invert_d;       // To ecl of sparc_exu_ecl.v, ...
   input                ifu_exu_kill_e;         // To ecl of sparc_exu_ecl.v
   input [4:0]          ifu_exu_muldivop_d;     // To ecl of sparc_exu_ecl.v
   input                ifu_exu_muls_d;         // To ecl of sparc_exu_ecl.v
   input                ifu_exu_nceen_e;        // To ecl of sparc_exu_ecl.v
   input [47:0]         ifu_exu_pc_d;           // To bypass of sparc_exu_byp.v
   input [63:0]         ifu_exu_pcver_e;        // To bypass of sparc_exu_byp.v
   input                ifu_exu_range_check_jlret_d;// To ecl of sparc_exu_ecl.v
   input                ifu_exu_range_check_other_d;// To ecl of sparc_exu_ecl.v
   input [4:0]          ifu_exu_rd_d;           // To ecl of sparc_exu_ecl.v
   input                ifu_exu_rd_exusr_e;     // To ecl of sparc_exu_ecl.v
   input                ifu_exu_rd_ffusr_e;     // To ecl of sparc_exu_ecl.v
   input                ifu_exu_rd_ifusr_e;     // To ecl of sparc_exu_ecl.v
   input                ifu_exu_ren1_s;         // To irf of bw_r_irf.v
   input                ifu_exu_ren2_s;         // To irf of bw_r_irf.v
   input                ifu_exu_ren3_s;         // To irf of bw_r_irf.v
   input                ifu_exu_restore_d;      // To ecl of sparc_exu_ecl.v, ...
   input                ifu_exu_restored_e;     // To rml of sparc_exu_rml.v
   input                ifu_exu_return_d;       // To ecl of sparc_exu_ecl.v
   input [4:0]          ifu_exu_rs1_s;          // To irf of bw_r_irf.v, ...
   input                ifu_exu_rs1_vld_d;      // To ecl of sparc_exu_ecl.v
   input [4:0]          ifu_exu_rs2_s;          // To irf of bw_r_irf.v, ...
   input                ifu_exu_rs2_vld_d;      // To ecl of sparc_exu_ecl.v
   input [4:0]          ifu_exu_rs3_s;          // To irf of bw_r_irf.v, ...
   input                ifu_exu_rs3e_vld_d;     // To ecl of sparc_exu_ecl.v
   input                ifu_exu_rs3o_vld_d;     // To ecl of sparc_exu_ecl.v
   input                ifu_exu_save_d;         // To ecl of sparc_exu_ecl.v, ...
   input                ifu_exu_saved_e;        // To rml of sparc_exu_rml.v
   input                ifu_exu_setcc_d;        // To ecl of sparc_exu_ecl.v
   input                ifu_exu_sethi_inst_d;   // To ecl of sparc_exu_ecl.v
   input [2:0]          ifu_exu_shiftop_d;      // To ecl of sparc_exu_ecl.v
   input                ifu_exu_tagop_d;        // To ecl of sparc_exu_ecl.v
   input                ifu_exu_tcc_e;          // To ecl of sparc_exu_ecl.v
   input [1:0]          ifu_exu_tid_s2;         // To irf of bw_r_irf.v, ...
   input                ifu_exu_ttype_vld_m;    // To ecl of sparc_exu_ecl.v
   input                ifu_exu_tv_d;           // To ecl of sparc_exu_ecl.v
   input                ifu_exu_use_rsr_e_l;    // To ecl of sparc_exu_ecl.v
   input                ifu_exu_usecin_d;       // To ecl of sparc_exu_ecl.v
   input                ifu_exu_useimm_d;       // To ecl of sparc_exu_ecl.v
   input                ifu_exu_wen_d;          // To ecl of sparc_exu_ecl.v
   input                ifu_tlu_flush_m;        // To ecl of sparc_exu_ecl.v
   input [6:0]          ifu_tlu_sraddr_d;       // To ecl of sparc_exu_ecl.v
   input                ifu_tlu_wsr_inst_d;     // To ecl of sparc_exu_ecl.v
   input [63:0]         lsu_exu_dfill_data_g;   // To bypass of sparc_exu_byp.v
   input                lsu_exu_dfill_vld_g;    // To ecl of sparc_exu_ecl.v
   input                lsu_exu_flush_pipe_w;   // To ecl of sparc_exu_ecl.v
   input                lsu_exu_ldst_miss_g2;   // To ecl of sparc_exu_ecl.v
   input [63:0]         lsu_exu_ldxa_data_g;    // To bypass of sparc_exu_byp.v
   input                lsu_exu_ldxa_m;         // To ecl of sparc_exu_ecl.v
   input [4:0]          lsu_exu_rd_m;           // To ecl of sparc_exu_ecl.v
   input                lsu_exu_st_dtlb_perr_g; // To ecl of sparc_exu_ecl.v
   input [1:0]          lsu_exu_thr_m;          // To ecl of sparc_exu_ecl.v
   input                mul_exu_ack;            // To ecl of sparc_exu_ecl.v
   input [63:0]         mul_exu_data_g;         // To div of sparc_exu_div.v
   input                rclk;                   // To irf of bw_r_irf.v, ...
   input                se;                     // To irf of bw_r_irf.v, ...
   input                sehold;                 // To irf of bw_r_irf.v, ...
   input [1:0]          tlu_exu_agp;            // To rml of sparc_exu_rml.v
   input                tlu_exu_agp_swap;       // To rml of sparc_exu_rml.v
   input [1:0]          tlu_exu_agp_tid;        // To rml of sparc_exu_rml.v
   input [7:0]          tlu_exu_ccr_m;          // To ecl of sparc_exu_ecl.v
   input [2:0]          tlu_exu_cwp_m;          // To rml of sparc_exu_rml.v
   input                tlu_exu_cwp_retry_m;    // To rml of sparc_exu_rml.v
   input                tlu_exu_cwpccr_update_m;// To ecl of sparc_exu_ecl.v, ...
   input                tlu_exu_pic_onebelow_m; // To ecl of sparc_exu_ecl.v
   input                tlu_exu_pic_twobelow_m; // To ecl of sparc_exu_ecl.v
   input                tlu_exu_priv_trap_m;    // To ecl of sparc_exu_ecl.v
   input [63:0]         tlu_exu_rsr_data_m;     // To bypass of sparc_exu_byp.v
   // End of automatics
   /*AUTOOUTPUT*/
   // Beginning of automatic outputs (from unused autoinst outputs)
   output               exu_ffu_wsr_inst_e;     // From ecl of sparc_exu_ecl.v
   output [47:0]        exu_ifu_brpc_e;         // From alu of sparc_exu_alu.v
   output [7:0]         exu_ifu_cc_d;           // From ecl of sparc_exu_ecl.v
   output               exu_ifu_ecc_ce_m;       // From ecl of sparc_exu_ecl.v
   output               exu_ifu_ecc_ue_m;       // From ecl of sparc_exu_ecl.v
   output [7:0]         exu_ifu_err_reg_m;      // From ecl of sparc_exu_ecl.v
   output               exu_ifu_inj_ack;        // From ecl of sparc_exu_ecl.v
   output [3:0]         exu_ifu_longop_done_g;  // From ecl of sparc_exu_ecl.v
   output [3:0]         exu_ifu_oddwin_s;       // From rml of sparc_exu_rml.v
   output               exu_ifu_regn_e;         // From alu of sparc_exu_alu.v
   output               exu_ifu_regz_e;         // From alu of sparc_exu_alu.v
   output               exu_ifu_spill_e;        // From rml of sparc_exu_rml.v
   output               exu_ifu_va_oor_m;       // From ecl of sparc_exu_ecl.v
   output [`L1D_ADDRESS_HI:3]        exu_lsu_early_va_e;     // From alu of sparc_exu_alu.v
   output [47:0]        exu_lsu_ldst_va_e;      // From alu of sparc_exu_alu.v
   output               exu_lsu_priority_trap_m;// From ecl of sparc_exu_ecl.v
   output [63:0]        exu_lsu_rs2_data_e;     // From bypass of sparc_exu_byp.v
   output [63:0]        exu_lsu_rs3_data_e;     // From bypass of sparc_exu_byp.v
   output [7:0]         exu_mmu_early_va_e;     // From alu of sparc_exu_alu.v
   output               exu_mul_input_vld;      // From ecl of sparc_exu_ecl.v
   output [63:0]        exu_mul_rs1_data;       // From div of sparc_exu_div.v
   output [63:0]        exu_mul_rs2_data;       // From div of sparc_exu_div.v
   output [63:0]        exu_spu_rs3_data_e;     // From bypass of sparc_exu_byp.v
   output [7:0]         exu_tlu_ccr0_w;         // From ecl of sparc_exu_ecl.v
   output [7:0]         exu_tlu_ccr1_w;         // From ecl of sparc_exu_ecl.v
   output [7:0]         exu_tlu_ccr2_w;         // From ecl of sparc_exu_ecl.v
   output [7:0]         exu_tlu_ccr3_w;         // From ecl of sparc_exu_ecl.v
   output [2:0]         exu_tlu_cwp0_w;         // From rml of sparc_exu_rml.v
   output [2:0]         exu_tlu_cwp1_w;         // From rml of sparc_exu_rml.v
   output [2:0]         exu_tlu_cwp2_w;         // From rml of sparc_exu_rml.v
   output [2:0]         exu_tlu_cwp3_w;         // From rml of sparc_exu_rml.v
   output               exu_tlu_cwp_cmplt;      // From rml of sparc_exu_rml.v
   output [1:0]         exu_tlu_cwp_cmplt_tid;  // From rml of sparc_exu_rml.v
   output               exu_tlu_cwp_retry;      // From rml of sparc_exu_rml.v
   output               exu_tlu_misalign_addr_jmpl_rtn_m;// From ecl of sparc_exu_ecl.v
   output               exu_tlu_spill;          // From rml of sparc_exu_rml.v
   output               exu_tlu_spill_other;    // From rml of sparc_exu_rml.v
   output [1:0]         exu_tlu_spill_tid;      // From rml of sparc_exu_rml.v
   output [2:0]         exu_tlu_spill_wtype;    // From rml of sparc_exu_rml.v
   output [8:0]         exu_tlu_ttype_m;        // From ecl of sparc_exu_ecl.v
   output               exu_tlu_ttype_vld_m;    // From ecl of sparc_exu_ecl.v
   output               exu_tlu_ue_trap_m;      // From ecl of sparc_exu_ecl.v
   output               exu_tlu_va_oor_jl_ret_m;// From ecl of sparc_exu_ecl.v
   output               exu_tlu_va_oor_m;       // From ecl of sparc_exu_ecl.v
   output [63:0]        exu_tlu_wsr_data_m;     // From bypass of sparc_exu_byp.v
   // End of automatics
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [63:0]          alu_byp_rd_data_e;      // From alu of sparc_exu_alu.v
   wire                 alu_ecl_add_n32_e;      // From alu of sparc_exu_alu.v
   wire                 alu_ecl_add_n64_e;      // From alu of sparc_exu_alu.v
   wire                 alu_ecl_adder_out_63_e; // From alu of sparc_exu_alu.v
   wire                 alu_ecl_adderin2_31_e;  // From alu of sparc_exu_alu.v
   wire                 alu_ecl_adderin2_63_e;  // From alu of sparc_exu_alu.v
   wire                 alu_ecl_cout32_e;       // From alu of sparc_exu_alu.v
   wire                 alu_ecl_cout64_e_l;     // From alu of sparc_exu_alu.v
   wire                 alu_ecl_log_n32_e;      // From alu of sparc_exu_alu.v
   wire                 alu_ecl_log_n64_e;      // From alu of sparc_exu_alu.v
   wire                 alu_ecl_mem_addr_invalid_e_l;// From alu of sparc_exu_alu.v
   wire                 alu_ecl_zhigh_e;        // From alu of sparc_exu_alu.v
   wire                 alu_ecl_zlow_e;         // From alu of sparc_exu_alu.v
   wire [63:0]          byp_alu_rcc_data_e;     // From bypass of sparc_exu_byp.v
   wire [63:0]          byp_alu_rs1_data_e;     // From bypass of sparc_exu_byp.v
   wire [63:0]          byp_alu_rs2_data_e_l;   // From bypass of sparc_exu_byp.v
   wire [63:0]          byp_ecc_rcc_data_e;     // From bypass of sparc_exu_byp.v
   wire [7:0]           byp_ecc_rs1_synd_d;     // From bypass of sparc_exu_byp.v
   wire [7:0]           byp_ecc_rs2_synd_d;     // From bypass of sparc_exu_byp.v
   wire [63:0]          byp_ecc_rs3_data_e;     // From bypass of sparc_exu_byp.v
   wire [7:0]           byp_ecc_rs3_synd_d;     // From bypass of sparc_exu_byp.v
   wire [2:0]           byp_ecl_rs1_2_0_e;      // From bypass of sparc_exu_byp.v
   wire                 byp_ecl_rs1_31_e;       // From bypass of sparc_exu_byp.v
   wire                 byp_ecl_rs1_63_e;       // From bypass of sparc_exu_byp.v
   wire                 byp_ecl_rs2_31_e;       // From bypass of sparc_exu_byp.v
   wire [3:0]           byp_ecl_rs2_3_0_e;      // From bypass of sparc_exu_byp.v
   wire [71:0]          byp_irf_rd_data_w;      // From bypass of sparc_exu_byp.v
   wire [71:0]          byp_irf_rd_data_w2;     // From bypass of sparc_exu_byp.v
   wire [63:0]          div_byp_muldivout_g;    // From div of sparc_exu_div.v
   wire [31:0]          div_byp_yreg_e;         // From div of sparc_exu_div.v
   wire                 div_ecl_adder_out_31;   // From div of sparc_exu_div.v
   wire                 div_ecl_cout32;         // From div of sparc_exu_div.v
   wire                 div_ecl_cout64;         // From div of sparc_exu_div.v
   wire                 div_ecl_d_62;           // From div of sparc_exu_div.v
   wire                 div_ecl_d_msb;          // From div of sparc_exu_div.v
   wire                 div_ecl_detect_zero_high;// From div of sparc_exu_div.v
   wire                 div_ecl_detect_zero_low;// From div of sparc_exu_div.v
   wire                 div_ecl_dividend_msb;   // From div of sparc_exu_div.v
   wire                 div_ecl_gencc_in_31;    // From div of sparc_exu_div.v
   wire                 div_ecl_gencc_in_msb_l; // From div of sparc_exu_div.v
   wire                 div_ecl_low32_nonzero;  // From div of sparc_exu_div.v
   wire                 div_ecl_upper32_equal;  // From div of sparc_exu_div.v
   wire                 div_ecl_x_msb;          // From div of sparc_exu_div.v
   wire                 div_ecl_xin_msb_l;      // From div of sparc_exu_div.v
   wire [3:0]           div_ecl_yreg_0_l;       // From div of sparc_exu_div.v
   wire [63:0]          ecc_byp_ecc_result_m;   // From ecc of sparc_exu_ecc.v
   wire                 ecc_ecl_rs1_ce;         // From ecc of sparc_exu_ecc.v
   wire                 ecc_ecl_rs1_ue;         // From ecc of sparc_exu_ecc.v
   wire                 ecc_ecl_rs2_ce;         // From ecc of sparc_exu_ecc.v
   wire                 ecc_ecl_rs2_ue;         // From ecc of sparc_exu_ecc.v
   wire                 ecc_ecl_rs3_ce;         // From ecc of sparc_exu_ecc.v
   wire                 ecc_ecl_rs3_ue;         // From ecc of sparc_exu_ecc.v
   wire                 ecl_alu_cin_e;          // From ecl of sparc_exu_ecl.v
   wire                 ecl_alu_log_sel_and_e;  // From ecl of sparc_exu_ecl.v
   wire                 ecl_alu_log_sel_move_e; // From ecl of sparc_exu_ecl.v
   wire                 ecl_alu_log_sel_or_e;   // From ecl of sparc_exu_ecl.v
   wire                 ecl_alu_log_sel_xor_e;  // From ecl of sparc_exu_ecl.v
   wire                 ecl_alu_out_sel_logic_e_l;// From ecl of sparc_exu_ecl.v
   wire                 ecl_alu_out_sel_rs3_e_l;// From ecl of sparc_exu_ecl.v
   wire                 ecl_alu_out_sel_shift_e_l;// From ecl of sparc_exu_ecl.v
   wire                 ecl_alu_out_sel_sum_e_l;// From ecl of sparc_exu_ecl.v
   wire                 ecl_alu_sethi_inst_e;   // From ecl of sparc_exu_ecl.v
   wire [2:0]           ecl_byp_3lsb_m;         // From ecl of sparc_exu_ecl.v
   wire [7:0]           ecl_byp_ecc_mask_m_l;   // From ecl of sparc_exu_ecl.v
   wire [7:0]           ecl_byp_eclpr_e;        // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_ldxa_g;         // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rcc_mux1_sel_m; // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rcc_mux1_sel_other;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rcc_mux1_sel_w; // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rcc_mux1_sel_w2;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rcc_mux2_sel_e; // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rcc_mux2_sel_ld;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rcc_mux2_sel_rf;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rcc_mux2_sel_usemux1;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_restore_m;      // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs1_longmux_sel_g2;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs1_longmux_sel_ldxa;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs1_longmux_sel_w2;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs1_mux1_sel_m; // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs1_mux1_sel_other;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs1_mux1_sel_w; // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs1_mux1_sel_w2;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs1_mux2_sel_e; // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs1_mux2_sel_ld;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs1_mux2_sel_rf;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs1_mux2_sel_usemux1;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs2_longmux_sel_g2;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs2_longmux_sel_ldxa;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs2_longmux_sel_w2;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs2_mux1_sel_m; // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs2_mux1_sel_other;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs2_mux1_sel_w; // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs2_mux1_sel_w2;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs2_mux2_sel_e; // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs2_mux2_sel_ld;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs2_mux2_sel_rf;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs2_mux2_sel_usemux1;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3_longmux_sel_g2;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3_longmux_sel_ldxa;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3_longmux_sel_w2;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3_mux1_sel_m; // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3_mux1_sel_other;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3_mux1_sel_w; // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3_mux1_sel_w2;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3_mux2_sel_e; // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3_mux2_sel_ld;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3_mux2_sel_rf;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3_mux2_sel_usemux1;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3h_longmux_sel_g2;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3h_longmux_sel_ldxa;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3h_longmux_sel_w2;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3h_mux1_sel_m;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3h_mux1_sel_other;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3h_mux1_sel_w;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3h_mux1_sel_w2;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3h_mux2_sel_e;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3h_mux2_sel_ld;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3h_mux2_sel_rf;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_rs3h_mux2_sel_usemux1;// From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_sel_alu_e;      // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_sel_ecc_m;      // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_sel_eclpr_e;    // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_sel_ffusr_m;    // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_sel_ifex_m;     // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_sel_ifusr_e;    // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_sel_load_g;     // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_sel_load_m;     // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_sel_muldiv_g;   // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_sel_pipe_m;     // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_sel_restore_g;  // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_sel_restore_m;  // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_sel_tlusr_m;    // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_sel_yreg_e;     // From ecl of sparc_exu_ecl.v
   wire                 ecl_byp_std_e_l;        // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_almostlast_cycle;// From ecl of sparc_exu_ecl.v
   wire                 ecl_div_cin;            // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_div64;          // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_dividend_sign;  // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_keep_d;         // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_keepx;          // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_last_cycle;     // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_ld_inputs;      // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_mul_get_32bit_data;// From ecl of sparc_exu_ecl.v
   wire                 ecl_div_mul_get_new_data;// From ecl of sparc_exu_ecl.v
   wire                 ecl_div_mul_keep_data;  // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_mul_sext_rs1_e; // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_mul_sext_rs2_e; // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_mul_wen;        // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_muls;           // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_muls_rs1_31_e_l;// From ecl of sparc_exu_ecl.v
   wire                 ecl_div_newq;           // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_sel_64b;        // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_sel_adder;      // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_sel_div;        // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_sel_neg32;      // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_sel_pos32;      // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_sel_u32;        // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_subtract_l;     // From ecl of sparc_exu_ecl.v
   wire [3:0]           ecl_div_thr_e;          // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_upper32_zero;   // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_upper33_one;    // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_upper33_zero;   // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_xinmask;        // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_yreg_data_31_g; // From ecl of sparc_exu_ecl.v
   wire [3:0]           ecl_div_yreg_shift_g;   // From ecl of sparc_exu_ecl.v
   wire [3:0]           ecl_div_yreg_wen_g;     // From ecl of sparc_exu_ecl.v
   wire [3:0]           ecl_div_yreg_wen_l;     // From ecl of sparc_exu_ecl.v
   wire [3:0]           ecl_div_yreg_wen_w;     // From ecl of sparc_exu_ecl.v
   wire                 ecl_div_zero_rs2_e;     // From ecl of sparc_exu_ecl.v
   wire                 ecl_ecc_log_rs1_m;      // From ecl of sparc_exu_ecl.v
   wire                 ecl_ecc_log_rs2_m;      // From ecl of sparc_exu_ecl.v
   wire                 ecl_ecc_log_rs3_m;      // From ecl of sparc_exu_ecl.v
   wire                 ecl_ecc_rs1_use_rf_e;   // From ecl of sparc_exu_ecl.v
   wire                 ecl_ecc_rs2_use_rf_e;   // From ecl of sparc_exu_ecl.v
   wire                 ecl_ecc_rs3_use_rf_e;   // From ecl of sparc_exu_ecl.v
   wire                 ecl_ecc_sel_rs1_m_l;    // From ecl of sparc_exu_ecl.v
   wire                 ecl_ecc_sel_rs2_m_l;    // From ecl of sparc_exu_ecl.v
   wire                 ecl_ecc_sel_rs3_m_l;    // From ecl of sparc_exu_ecl.v
   wire [4:0]           ecl_irf_rd_g;           // From ecl of sparc_exu_ecl.v
   wire [4:0]           ecl_irf_rd_m;           // From ecl of sparc_exu_ecl.v
   wire [1:0]           ecl_irf_tid_g;          // From ecl of sparc_exu_ecl.v
   wire [1:0]           ecl_irf_tid_m;          // From ecl of sparc_exu_ecl.v
   wire                 ecl_irf_wen_w;          // From ecl of sparc_exu_ecl.v
   wire                 ecl_irf_wen_w2;         // From ecl of sparc_exu_ecl.v
   wire                 ecl_rml_canrestore_wen_w;// From ecl of sparc_exu_ecl.v
   wire                 ecl_rml_cansave_wen_w;  // From ecl of sparc_exu_ecl.v
   wire                 ecl_rml_cleanwin_wen_w; // From ecl of sparc_exu_ecl.v
   wire                 ecl_rml_cwp_wen_e;      // From ecl of sparc_exu_ecl.v
   wire                 ecl_rml_early_flush_w;  // From ecl of sparc_exu_ecl.v
   wire                 ecl_rml_inst_vld_w;     // From ecl of sparc_exu_ecl.v
   wire                 ecl_rml_kill_e;         // From ecl of sparc_exu_ecl.v
   wire                 ecl_rml_kill_w;         // From ecl of sparc_exu_ecl.v
   wire                 ecl_rml_otherwin_wen_w; // From ecl of sparc_exu_ecl.v
   wire [3:0]           ecl_rml_thr_m;          // From ecl of sparc_exu_ecl.v
   wire [3:0]           ecl_rml_thr_w;          // From ecl of sparc_exu_ecl.v
   wire                 ecl_rml_wstate_wen_w;   // From ecl of sparc_exu_ecl.v
   wire [2:0]           ecl_rml_xor_data_e;     // From ecl of sparc_exu_ecl.v
   wire                 ecl_shft_enshift_e_l;   // From ecl of sparc_exu_ecl.v
   wire                 ecl_shft_extend32bit_e_l;// From ecl of sparc_exu_ecl.v
   wire                 ecl_shft_extendbit_e;   // From ecl of sparc_exu_ecl.v
   wire                 ecl_shft_lshift_e_l;    // From ecl of sparc_exu_ecl.v
   wire                 ecl_shft_op32_e;        // From ecl of sparc_exu_ecl.v
   wire [3:0]           ecl_shft_shift1_e;      // From ecl of sparc_exu_ecl.v
   wire [3:0]           ecl_shft_shift4_e;      // From ecl of sparc_exu_ecl.v
   wire [71:0]          irf_byp_rs1_data_d_l;   // From irf of bw_r_irf.v
   wire [71:0]          irf_byp_rs2_data_d_l;   // From irf of bw_r_irf.v
   wire [71:0]          irf_byp_rs3_data_d_l;   // From irf of bw_r_irf.v
   wire [31:0]          irf_byp_rs3h_data_d_l;  // From irf of bw_r_irf.v
   wire [2:0]           rml_ecl_canrestore_d;   // From rml of sparc_exu_rml.v
   wire [2:0]           rml_ecl_cansave_d;      // From rml of sparc_exu_rml.v
   wire                 rml_ecl_clean_window_e; // From rml of sparc_exu_rml.v
   wire [2:0]           rml_ecl_cleanwin_d;     // From rml of sparc_exu_rml.v
   wire [2:0]           rml_ecl_cwp_d;          // From rml of sparc_exu_rml.v
   wire                 rml_ecl_fill_e;         // From rml of sparc_exu_rml.v
   wire [1:0]           rml_ecl_gl_e;           // From rml of sparc_exu_rml.v
   wire                 rml_ecl_kill_m;         // From rml of sparc_exu_rml.v
   wire                 rml_ecl_other_e;        // From rml of sparc_exu_rml.v
   wire [2:0]           rml_ecl_otherwin_d;     // From rml of sparc_exu_rml.v
   wire                 rml_ecl_rmlop_done_e;   // From rml of sparc_exu_rml.v
   wire [3:0]           rml_ecl_swap_done;      // From rml of sparc_exu_rml.v
   wire [5:0]           rml_ecl_wstate_d;       // From rml of sparc_exu_rml.v
   wire [2:0]           rml_ecl_wtype_e;        // From rml of sparc_exu_rml.v
   wire [1:0]           rml_irf_cwpswap_tid_e;  // From rml of sparc_exu_rml.v
   wire [1:0]           rml_irf_global_tid;     // From rml of sparc_exu_rml.v
   wire                 rml_irf_kill_restore_w; // From rml of sparc_exu_rml.v
   wire [1:0]           rml_irf_new_agp;        // From rml of sparc_exu_rml.v
   wire [2:0]           rml_irf_new_lo_cwp_e;   // From rml of sparc_exu_rml.v
   wire [1:0]           rml_irf_old_agp;        // From rml of sparc_exu_rml.v
   wire [2:0]           rml_irf_old_lo_cwp_e;   // From rml of sparc_exu_rml.v
   wire                 rml_irf_swap_even_e;    // From rml of sparc_exu_rml.v
   wire                 rml_irf_swap_global;    // From rml of sparc_exu_rml.v
   wire                 rml_irf_swap_local_e;   // From rml of sparc_exu_rml.v
   wire                 rml_irf_swap_odd_e;     // From rml of sparc_exu_rml.v
   wire [63:0]          shft_alu_shift_out_e;   // From shft of sparc_exu_shft.v
   // End of automatics
   wire                 short_scan0_1;
   wire                 scan0_1,scan0_2,scan0_3;

   wire                 ecl_alu_casa_e;
   wire [63:0]          byp_alu_rs2_data_e;
   output [7:0]         exu_ifu_err_synd_m;
   wire [1:0]           rml_irf_old_e_cwp_e;
   wire [1:0]           rml_irf_new_e_cwp_e;

wire mux_drive_disable = ~grst_l;
wire mem_write_disable = ~grst_l;
 
   bw_r_irf_wrap irf(
                .reset_l (arst_l),
                .rst_tri_en             (mem_write_disable),
                .rml_irf_old_e_cwp_e    (rml_irf_old_e_cwp_e[1:0]),
                .rml_irf_new_e_cwp_e    (rml_irf_new_e_cwp_e[1:0]),
                /*AUTOINST*/
                // Outputs
                .irf_byp_rs1_data_d_l   (irf_byp_rs1_data_d_l[71:0]),
                .irf_byp_rs2_data_d_l   (irf_byp_rs2_data_d_l[71:0]),
                .irf_byp_rs3_data_d_l   (irf_byp_rs3_data_d_l[71:0]),
                .irf_byp_rs3h_data_d_l  (irf_byp_rs3h_data_d_l[31:0]),
                // Inputs
                .rclk                   (rclk),
                .sehold                 (sehold),
                .ifu_exu_tid_s2         (ifu_exu_tid_s2[0]),
                .ifu_exu_rs1_s          (ifu_exu_rs1_s[4:0]),
                .ifu_exu_rs2_s          (ifu_exu_rs2_s[4:0]),
                .ifu_exu_rs3_s          (ifu_exu_rs3_s[4:0]),
                .ifu_exu_ren1_s         (ifu_exu_ren1_s),
                .ifu_exu_ren2_s         (ifu_exu_ren2_s),
                .ifu_exu_ren3_s         (ifu_exu_ren3_s),
                .ecl_irf_wen_w          (ecl_irf_wen_w),
                .ecl_irf_wen_w2         (ecl_irf_wen_w2),
                .ecl_irf_rd_m           (ecl_irf_rd_m[4:0]),
                .ecl_irf_rd_g           (ecl_irf_rd_g[4:0]),
                .byp_irf_rd_data_w      (byp_irf_rd_data_w[71:0]),
                .byp_irf_rd_data_w2     (byp_irf_rd_data_w2[71:0]),
                .ecl_irf_tid_m          (ecl_irf_tid_m[1:0]),
                .ecl_irf_tid_g          (ecl_irf_tid_g[1:0]),
                .rml_irf_old_lo_cwp_e   (rml_irf_old_lo_cwp_e[2:0]),
                .rml_irf_new_lo_cwp_e   (rml_irf_new_lo_cwp_e[2:0]),
                .rml_irf_swap_even_e    (rml_irf_swap_even_e),
                .rml_irf_swap_odd_e     (rml_irf_swap_odd_e),
                .rml_irf_swap_local_e   (rml_irf_swap_local_e),
                .rml_irf_kill_restore_w (rml_irf_kill_restore_w),
                .rml_irf_cwpswap_tid_e  (rml_irf_cwpswap_tid_e[0]),
                .rml_irf_old_agp        (rml_irf_old_agp[1:0]),
                .rml_irf_new_agp        (rml_irf_new_agp[1:0]),
                .rml_irf_swap_global    (rml_irf_swap_global),
                .rml_irf_global_tid     (rml_irf_global_tid[0]),

                .core_rtap_data          (core_rtap_data),
                .rtap_core_val         (rtap_core_val),
                .rtap_core_threadid         (rtap_core_threadid[0]),
                .rtap_core_id         (rtap_core_id),
                .rtap_core_data         (rtap_core_data[4:0])
                );
   
   sparc_exu_byp bypass(
                        .so             (short_so1),
                        .si             (short_si1),
                        .byp_alu_rs2_data_e(byp_alu_rs2_data_e[63:0]),
                        /*AUTOINST*/
                        // Outputs
                        .byp_alu_rs1_data_e(byp_alu_rs1_data_e[63:0]),
                        .byp_alu_rs2_data_e_l(byp_alu_rs2_data_e_l[63:0]),
                        .exu_lsu_rs3_data_e(exu_lsu_rs3_data_e[63:0]),
                        .exu_spu_rs3_data_e(exu_spu_rs3_data_e[63:0]),
                        .exu_lsu_rs2_data_e(exu_lsu_rs2_data_e[63:0]),
                        .byp_alu_rcc_data_e(byp_alu_rcc_data_e[63:0]),
                        .byp_irf_rd_data_w(byp_irf_rd_data_w[71:0]),
                        .exu_tlu_wsr_data_m(exu_tlu_wsr_data_m[63:0]),
                        .byp_irf_rd_data_w2(byp_irf_rd_data_w2[71:0]),
                        .byp_ecc_rs3_data_e(byp_ecc_rs3_data_e[63:0]),
                        .byp_ecc_rcc_data_e(byp_ecc_rcc_data_e[63:0]),
                        .byp_ecl_rs2_31_e(byp_ecl_rs2_31_e),
                        .byp_ecl_rs1_31_e(byp_ecl_rs1_31_e),
                        .byp_ecl_rs1_63_e(byp_ecl_rs1_63_e),
                        .byp_ecl_rs1_2_0_e(byp_ecl_rs1_2_0_e[2:0]),
                        .byp_ecl_rs2_3_0_e(byp_ecl_rs2_3_0_e[3:0]),
                        .byp_ecc_rs1_synd_d(byp_ecc_rs1_synd_d[7:0]),
                        .byp_ecc_rs2_synd_d(byp_ecc_rs2_synd_d[7:0]),
                        .byp_ecc_rs3_synd_d(byp_ecc_rs3_synd_d[7:0]),
                        // Inputs
                        .rclk           (rclk),
                        .se             (se),
                        .sehold         (sehold),
                        .ecl_byp_rs1_mux2_sel_e(ecl_byp_rs1_mux2_sel_e),
                        .ecl_byp_rs1_mux2_sel_rf(ecl_byp_rs1_mux2_sel_rf),
                        .ecl_byp_rs1_mux2_sel_ld(ecl_byp_rs1_mux2_sel_ld),
                        .ecl_byp_rs1_mux2_sel_usemux1(ecl_byp_rs1_mux2_sel_usemux1),
                        .ecl_byp_rs1_mux1_sel_m(ecl_byp_rs1_mux1_sel_m),
                        .ecl_byp_rs1_mux1_sel_w(ecl_byp_rs1_mux1_sel_w),
                        .ecl_byp_rs1_mux1_sel_w2(ecl_byp_rs1_mux1_sel_w2),
                        .ecl_byp_rs1_mux1_sel_other(ecl_byp_rs1_mux1_sel_other),
                        .ecl_byp_rcc_mux2_sel_e(ecl_byp_rcc_mux2_sel_e),
                        .ecl_byp_rcc_mux2_sel_rf(ecl_byp_rcc_mux2_sel_rf),
                        .ecl_byp_rcc_mux2_sel_ld(ecl_byp_rcc_mux2_sel_ld),
                        .ecl_byp_rcc_mux2_sel_usemux1(ecl_byp_rcc_mux2_sel_usemux1),
                        .ecl_byp_rcc_mux1_sel_m(ecl_byp_rcc_mux1_sel_m),
                        .ecl_byp_rcc_mux1_sel_w(ecl_byp_rcc_mux1_sel_w),
                        .ecl_byp_rcc_mux1_sel_w2(ecl_byp_rcc_mux1_sel_w2),
                        .ecl_byp_rcc_mux1_sel_other(ecl_byp_rcc_mux1_sel_other),
                        .ecl_byp_rs2_mux2_sel_e(ecl_byp_rs2_mux2_sel_e),
                        .ecl_byp_rs2_mux2_sel_rf(ecl_byp_rs2_mux2_sel_rf),
                        .ecl_byp_rs2_mux2_sel_ld(ecl_byp_rs2_mux2_sel_ld),
                        .ecl_byp_rs2_mux2_sel_usemux1(ecl_byp_rs2_mux2_sel_usemux1),
                        .ecl_byp_rs2_mux1_sel_m(ecl_byp_rs2_mux1_sel_m),
                        .ecl_byp_rs2_mux1_sel_w(ecl_byp_rs2_mux1_sel_w),
                        .ecl_byp_rs2_mux1_sel_w2(ecl_byp_rs2_mux1_sel_w2),
                        .ecl_byp_rs2_mux1_sel_other(ecl_byp_rs2_mux1_sel_other),
                        .ecl_byp_rs3_mux2_sel_e(ecl_byp_rs3_mux2_sel_e),
                        .ecl_byp_rs3_mux2_sel_rf(ecl_byp_rs3_mux2_sel_rf),
                        .ecl_byp_rs3_mux2_sel_ld(ecl_byp_rs3_mux2_sel_ld),
                        .ecl_byp_rs3_mux2_sel_usemux1(ecl_byp_rs3_mux2_sel_usemux1),
                        .ecl_byp_rs3_mux1_sel_m(ecl_byp_rs3_mux1_sel_m),
                        .ecl_byp_rs3_mux1_sel_w(ecl_byp_rs3_mux1_sel_w),
                        .ecl_byp_rs3_mux1_sel_w2(ecl_byp_rs3_mux1_sel_w2),
                        .ecl_byp_rs3_mux1_sel_other(ecl_byp_rs3_mux1_sel_other),
                        .ecl_byp_rs3h_mux2_sel_e(ecl_byp_rs3h_mux2_sel_e),
                        .ecl_byp_rs3h_mux2_sel_rf(ecl_byp_rs3h_mux2_sel_rf),
                        .ecl_byp_rs3h_mux2_sel_ld(ecl_byp_rs3h_mux2_sel_ld),
                        .ecl_byp_rs3h_mux2_sel_usemux1(ecl_byp_rs3h_mux2_sel_usemux1),
                        .ecl_byp_rs3h_mux1_sel_m(ecl_byp_rs3h_mux1_sel_m),
                        .ecl_byp_rs3h_mux1_sel_w(ecl_byp_rs3h_mux1_sel_w),
                        .ecl_byp_rs3h_mux1_sel_w2(ecl_byp_rs3h_mux1_sel_w2),
                        .ecl_byp_rs3h_mux1_sel_other(ecl_byp_rs3h_mux1_sel_other),
                        .ecl_byp_rs1_longmux_sel_g2(ecl_byp_rs1_longmux_sel_g2),
                        .ecl_byp_rs1_longmux_sel_w2(ecl_byp_rs1_longmux_sel_w2),
                        .ecl_byp_rs1_longmux_sel_ldxa(ecl_byp_rs1_longmux_sel_ldxa),
                        .ecl_byp_rs2_longmux_sel_g2(ecl_byp_rs2_longmux_sel_g2),
                        .ecl_byp_rs2_longmux_sel_w2(ecl_byp_rs2_longmux_sel_w2),
                        .ecl_byp_rs2_longmux_sel_ldxa(ecl_byp_rs2_longmux_sel_ldxa),
                        .ecl_byp_rs3_longmux_sel_g2(ecl_byp_rs3_longmux_sel_g2),
                        .ecl_byp_rs3_longmux_sel_w2(ecl_byp_rs3_longmux_sel_w2),
                        .ecl_byp_rs3_longmux_sel_ldxa(ecl_byp_rs3_longmux_sel_ldxa),
                        .ecl_byp_rs3h_longmux_sel_g2(ecl_byp_rs3h_longmux_sel_g2),
                        .ecl_byp_rs3h_longmux_sel_w2(ecl_byp_rs3h_longmux_sel_w2),
                        .ecl_byp_rs3h_longmux_sel_ldxa(ecl_byp_rs3h_longmux_sel_ldxa),
                        .ecl_byp_sel_load_m(ecl_byp_sel_load_m),
                        .ecl_byp_sel_pipe_m(ecl_byp_sel_pipe_m),
                        .ecl_byp_sel_ecc_m(ecl_byp_sel_ecc_m),
                        .ecl_byp_sel_muldiv_g(ecl_byp_sel_muldiv_g),
                        .ecl_byp_sel_load_g(ecl_byp_sel_load_g),
                        .ecl_byp_sel_restore_g(ecl_byp_sel_restore_g),
                        .ecl_byp_std_e_l(ecl_byp_std_e_l),
                        .ecl_byp_ldxa_g (ecl_byp_ldxa_g),
                        .alu_byp_rd_data_e(alu_byp_rd_data_e[63:0]),
                        .ifu_exu_imm_data_d(ifu_exu_imm_data_d[31:0]),
                        .irf_byp_rs1_data_d_l(irf_byp_rs1_data_d_l[71:0]),
                        .irf_byp_rs2_data_d_l(irf_byp_rs2_data_d_l[71:0]),
                        .irf_byp_rs3_data_d_l(irf_byp_rs3_data_d_l[71:0]),
                        .irf_byp_rs3h_data_d_l(irf_byp_rs3h_data_d_l[31:0]),
                        .lsu_exu_dfill_data_g(lsu_exu_dfill_data_g[63:0]),
                        .lsu_exu_ldxa_data_g(lsu_exu_ldxa_data_g[63:0]),
                        .div_byp_muldivout_g(div_byp_muldivout_g[63:0]),
                        .ecc_byp_ecc_result_m(ecc_byp_ecc_result_m[63:0]),
                        .ecl_byp_ecc_mask_m_l(ecl_byp_ecc_mask_m_l[7:0]),
                        .ifu_exu_pc_d   (ifu_exu_pc_d[47:0]),
                        .ecl_byp_3lsb_m (ecl_byp_3lsb_m[2:0]),
                        .ecl_byp_restore_m(ecl_byp_restore_m),
                        .ecl_byp_sel_restore_m(ecl_byp_sel_restore_m),
                        .ecl_byp_eclpr_e(ecl_byp_eclpr_e[7:0]),
                        .div_byp_yreg_e (div_byp_yreg_e[31:0]),
                        .ifu_exu_pcver_e(ifu_exu_pcver_e[63:0]),
                        .tlu_exu_rsr_data_m(tlu_exu_rsr_data_m[63:0]),
                        .ffu_exu_rsr_data_m(ffu_exu_rsr_data_m[63:0]),
                        .ecl_byp_sel_yreg_e(ecl_byp_sel_yreg_e),
                        .ecl_byp_sel_eclpr_e(ecl_byp_sel_eclpr_e),
                        .ecl_byp_sel_ifusr_e(ecl_byp_sel_ifusr_e),
                        .ecl_byp_sel_alu_e(ecl_byp_sel_alu_e),
                        .ecl_byp_sel_ifex_m(ecl_byp_sel_ifex_m),
                        .ecl_byp_sel_ffusr_m(ecl_byp_sel_ffusr_m),
                        .ecl_byp_sel_tlusr_m(ecl_byp_sel_tlusr_m));

   sparc_exu_ecc ecc(
                     .so                (scan0_1),
                     .si                (si0),
                     .byp_alu_rs2_data_e(byp_alu_rs2_data_e[63:0]),
                     /*AUTOINST*/
                     // Outputs
                     .ecc_ecl_rs1_ce    (ecc_ecl_rs1_ce),
                     .ecc_ecl_rs1_ue    (ecc_ecl_rs1_ue),
                     .ecc_ecl_rs2_ce    (ecc_ecl_rs2_ce),
                     .ecc_ecl_rs2_ue    (ecc_ecl_rs2_ue),
                     .ecc_ecl_rs3_ce    (ecc_ecl_rs3_ce),
                     .ecc_ecl_rs3_ue    (ecc_ecl_rs3_ue),
                     .ecc_byp_ecc_result_m(ecc_byp_ecc_result_m[63:0]),
                     .exu_ifu_err_synd_m(exu_ifu_err_synd_m[6:0]),
                     // Inputs
                     .rclk              (rclk),
                     .se                (se),
                     .byp_ecc_rcc_data_e(byp_ecc_rcc_data_e[63:0]),
                     .ecl_ecc_rs1_use_rf_e(ecl_ecc_rs1_use_rf_e),
                     .byp_ecc_rs1_synd_d(byp_ecc_rs1_synd_d[7:0]),
                     .ecl_ecc_rs2_use_rf_e(ecl_ecc_rs2_use_rf_e),
                     .byp_ecc_rs2_synd_d(byp_ecc_rs2_synd_d[7:0]),
                     .byp_ecc_rs3_data_e(byp_ecc_rs3_data_e[63:0]),
                     .ecl_ecc_rs3_use_rf_e(ecl_ecc_rs3_use_rf_e),
                     .byp_ecc_rs3_synd_d(byp_ecc_rs3_synd_d[7:0]),
                     .ecl_ecc_sel_rs1_m_l(ecl_ecc_sel_rs1_m_l),
                     .ecl_ecc_sel_rs2_m_l(ecl_ecc_sel_rs2_m_l),
                     .ecl_ecc_sel_rs3_m_l(ecl_ecc_sel_rs3_m_l),
                     .ecl_ecc_log_rs1_m (ecl_ecc_log_rs1_m),
                     .ecl_ecc_log_rs2_m (ecl_ecc_log_rs2_m),
                     .ecl_ecc_log_rs3_m (ecl_ecc_log_rs3_m));
   
   sparc_exu_ecl ecl(
                     .so                (short_so0),
                     .si                (short_scan0_1),
                     .rst_tri_en        (mux_drive_disable),
                     .byp_ecl_wrccr_data_w(byp_irf_rd_data_w[7:0]),
                     .alu_ecl_adder_out_31_e(exu_ifu_brpc_e[31]),
                     .byp_ecl_rd_data_3lsb_m(exu_tlu_wsr_data_m[2:0]),                     
                     .alu_ecl_adder_out_7_0_e(exu_ifu_brpc_e[7:0]),
                     .exu_ifu_regz_e    (exu_ifu_regz_e),
                     .ecl_alu_casa_e    (ecl_alu_casa_e),
                     .exu_ifu_err_synd_7_m (exu_ifu_err_synd_m[7]),
                     /*AUTOINST*/
                     // Outputs
                     .ecl_byp_ecc_mask_m_l(ecl_byp_ecc_mask_m_l[7:0]),
                     .ecl_byp_eclpr_e   (ecl_byp_eclpr_e[7:0]),
                     .ecl_byp_sel_load_g(ecl_byp_sel_load_g),
                     .ecl_byp_sel_load_m(ecl_byp_sel_load_m),
                     .ecl_byp_sel_muldiv_g(ecl_byp_sel_muldiv_g),
                     .ecl_byp_sel_pipe_m(ecl_byp_sel_pipe_m),
                     .ecl_byp_sel_restore_g(ecl_byp_sel_restore_g),
                     .ecl_byp_sel_restore_m(ecl_byp_sel_restore_m),
                     .ecl_div_almostlast_cycle(ecl_div_almostlast_cycle),
                     .ecl_div_cin       (ecl_div_cin),
                     .ecl_div_dividend_sign(ecl_div_dividend_sign),
                     .ecl_div_keep_d    (ecl_div_keep_d),
                     .ecl_div_keepx     (ecl_div_keepx),
                     .ecl_div_last_cycle(ecl_div_last_cycle),
                     .ecl_div_mul_get_32bit_data(ecl_div_mul_get_32bit_data),
                     .ecl_div_mul_get_new_data(ecl_div_mul_get_new_data),
                     .ecl_div_mul_keep_data(ecl_div_mul_keep_data),
                     .ecl_div_mul_sext_rs1_e(ecl_div_mul_sext_rs1_e),
                     .ecl_div_mul_sext_rs2_e(ecl_div_mul_sext_rs2_e),
                     .ecl_div_newq      (ecl_div_newq),
                     .ecl_div_sel_64b   (ecl_div_sel_64b),
                     .ecl_div_sel_adder (ecl_div_sel_adder),
                     .ecl_div_sel_neg32 (ecl_div_sel_neg32),
                     .ecl_div_sel_pos32 (ecl_div_sel_pos32),
                     .ecl_div_sel_u32   (ecl_div_sel_u32),
                     .ecl_div_subtract_l(ecl_div_subtract_l),
                     .ecl_div_upper32_zero(ecl_div_upper32_zero),
                     .ecl_div_upper33_one(ecl_div_upper33_one),
                     .ecl_div_upper33_zero(ecl_div_upper33_zero),
                     .ecl_div_xinmask   (ecl_div_xinmask),
                     .ecl_div_yreg_shift_g(ecl_div_yreg_shift_g[3:0]),
                     .ecl_div_yreg_wen_g(ecl_div_yreg_wen_g[3:0]),
                     .ecl_div_yreg_wen_l(ecl_div_yreg_wen_l[3:0]),
                     .ecl_div_yreg_wen_w(ecl_div_yreg_wen_w[3:0]),
                     .ecl_ecc_log_rs1_m (ecl_ecc_log_rs1_m),
                     .ecl_ecc_log_rs2_m (ecl_ecc_log_rs2_m),
                     .ecl_ecc_log_rs3_m (ecl_ecc_log_rs3_m),
                     .ecl_ecc_sel_rs1_m_l(ecl_ecc_sel_rs1_m_l),
                     .ecl_ecc_sel_rs2_m_l(ecl_ecc_sel_rs2_m_l),
                     .ecl_ecc_sel_rs3_m_l(ecl_ecc_sel_rs3_m_l),
                     .ecl_rml_canrestore_wen_w(ecl_rml_canrestore_wen_w),
                     .ecl_rml_cansave_wen_w(ecl_rml_cansave_wen_w),
                     .ecl_rml_cleanwin_wen_w(ecl_rml_cleanwin_wen_w),
                     .ecl_rml_cwp_wen_e (ecl_rml_cwp_wen_e),
                     .ecl_rml_otherwin_wen_w(ecl_rml_otherwin_wen_w),
                     .ecl_rml_wstate_wen_w(ecl_rml_wstate_wen_w),
                     .exu_ffu_wsr_inst_e(exu_ffu_wsr_inst_e),
                     .exu_ifu_ecc_ce_m  (exu_ifu_ecc_ce_m),
                     .exu_ifu_ecc_ue_m  (exu_ifu_ecc_ue_m),
                     .exu_ifu_err_reg_m (exu_ifu_err_reg_m[7:0]),
                     .exu_ifu_inj_ack   (exu_ifu_inj_ack),
                     .exu_ifu_longop_done_g(exu_ifu_longop_done_g[3:0]),
                     .exu_mul_input_vld (exu_mul_input_vld),
                     .exu_tlu_ccr0_w    (exu_tlu_ccr0_w[7:0]),
                     .exu_tlu_ccr1_w    (exu_tlu_ccr1_w[7:0]),
                     .exu_tlu_ccr2_w    (exu_tlu_ccr2_w[7:0]),
                     .exu_tlu_ccr3_w    (exu_tlu_ccr3_w[7:0]),
                     .ecl_byp_sel_alu_e (ecl_byp_sel_alu_e),
                     .ecl_byp_sel_eclpr_e(ecl_byp_sel_eclpr_e),
                     .ecl_byp_sel_yreg_e(ecl_byp_sel_yreg_e),
                     .ecl_byp_sel_ifusr_e(ecl_byp_sel_ifusr_e),
                     .ecl_byp_sel_ffusr_m(ecl_byp_sel_ffusr_m),
                     .ecl_byp_sel_ifex_m(ecl_byp_sel_ifex_m),
                     .ecl_byp_sel_tlusr_m(ecl_byp_sel_tlusr_m),
                     .exu_ifu_va_oor_m  (exu_ifu_va_oor_m),
                     .ecl_alu_out_sel_sum_e_l(ecl_alu_out_sel_sum_e_l),
                     .ecl_alu_out_sel_rs3_e_l(ecl_alu_out_sel_rs3_e_l),
                     .ecl_alu_out_sel_shift_e_l(ecl_alu_out_sel_shift_e_l),
                     .ecl_alu_out_sel_logic_e_l(ecl_alu_out_sel_logic_e_l),
                     .ecl_alu_log_sel_and_e(ecl_alu_log_sel_and_e),
                     .ecl_alu_log_sel_or_e(ecl_alu_log_sel_or_e),
                     .ecl_alu_log_sel_xor_e(ecl_alu_log_sel_xor_e),
                     .ecl_alu_log_sel_move_e(ecl_alu_log_sel_move_e),
                     .ecl_alu_sethi_inst_e(ecl_alu_sethi_inst_e),
                     .ecl_alu_cin_e     (ecl_alu_cin_e),
                     .ecl_shft_lshift_e_l(ecl_shft_lshift_e_l),
                     .ecl_shft_op32_e   (ecl_shft_op32_e),
                     .ecl_shft_shift4_e (ecl_shft_shift4_e[3:0]),
                     .ecl_shft_shift1_e (ecl_shft_shift1_e[3:0]),
                     .ecl_shft_enshift_e_l(ecl_shft_enshift_e_l),
                     .ecl_byp_restore_m (ecl_byp_restore_m),
                     .ecl_byp_rs1_mux2_sel_e(ecl_byp_rs1_mux2_sel_e),
                     .ecl_byp_rs1_mux2_sel_rf(ecl_byp_rs1_mux2_sel_rf),
                     .ecl_byp_rs1_mux2_sel_ld(ecl_byp_rs1_mux2_sel_ld),
                     .ecl_byp_rs1_mux2_sel_usemux1(ecl_byp_rs1_mux2_sel_usemux1),
                     .ecl_byp_rs1_mux1_sel_m(ecl_byp_rs1_mux1_sel_m),
                     .ecl_byp_rs1_mux1_sel_w(ecl_byp_rs1_mux1_sel_w),
                     .ecl_byp_rs1_mux1_sel_w2(ecl_byp_rs1_mux1_sel_w2),
                     .ecl_byp_rs1_mux1_sel_other(ecl_byp_rs1_mux1_sel_other),
                     .ecl_byp_rcc_mux2_sel_e(ecl_byp_rcc_mux2_sel_e),
                     .ecl_byp_rcc_mux2_sel_rf(ecl_byp_rcc_mux2_sel_rf),
                     .ecl_byp_rcc_mux2_sel_ld(ecl_byp_rcc_mux2_sel_ld),
                     .ecl_byp_rcc_mux2_sel_usemux1(ecl_byp_rcc_mux2_sel_usemux1),
                     .ecl_byp_rcc_mux1_sel_m(ecl_byp_rcc_mux1_sel_m),
                     .ecl_byp_rcc_mux1_sel_w(ecl_byp_rcc_mux1_sel_w),
                     .ecl_byp_rcc_mux1_sel_w2(ecl_byp_rcc_mux1_sel_w2),
                     .ecl_byp_rcc_mux1_sel_other(ecl_byp_rcc_mux1_sel_other),
                     .ecl_byp_rs2_mux2_sel_e(ecl_byp_rs2_mux2_sel_e),
                     .ecl_byp_rs2_mux2_sel_rf(ecl_byp_rs2_mux2_sel_rf),
                     .ecl_byp_rs2_mux2_sel_ld(ecl_byp_rs2_mux2_sel_ld),
                     .ecl_byp_rs2_mux2_sel_usemux1(ecl_byp_rs2_mux2_sel_usemux1),
                     .ecl_byp_rs2_mux1_sel_m(ecl_byp_rs2_mux1_sel_m),
                     .ecl_byp_rs2_mux1_sel_w(ecl_byp_rs2_mux1_sel_w),
                     .ecl_byp_rs2_mux1_sel_w2(ecl_byp_rs2_mux1_sel_w2),
                     .ecl_byp_rs2_mux1_sel_other(ecl_byp_rs2_mux1_sel_other),
                     .ecl_byp_rs3_mux2_sel_e(ecl_byp_rs3_mux2_sel_e),
                     .ecl_byp_rs3_mux2_sel_rf(ecl_byp_rs3_mux2_sel_rf),
                     .ecl_byp_rs3_mux2_sel_ld(ecl_byp_rs3_mux2_sel_ld),
                     .ecl_byp_rs3_mux2_sel_usemux1(ecl_byp_rs3_mux2_sel_usemux1),
                     .ecl_byp_rs3_mux1_sel_m(ecl_byp_rs3_mux1_sel_m),
                     .ecl_byp_rs3_mux1_sel_w(ecl_byp_rs3_mux1_sel_w),
                     .ecl_byp_rs3_mux1_sel_w2(ecl_byp_rs3_mux1_sel_w2),
                     .ecl_byp_rs3_mux1_sel_other(ecl_byp_rs3_mux1_sel_other),
                     .ecl_byp_rs3h_mux2_sel_e(ecl_byp_rs3h_mux2_sel_e),
                     .ecl_byp_rs3h_mux2_sel_rf(ecl_byp_rs3h_mux2_sel_rf),
                     .ecl_byp_rs3h_mux2_sel_ld(ecl_byp_rs3h_mux2_sel_ld),
                     .ecl_byp_rs3h_mux2_sel_usemux1(ecl_byp_rs3h_mux2_sel_usemux1),
                     .ecl_byp_rs3h_mux1_sel_m(ecl_byp_rs3h_mux1_sel_m),
                     .ecl_byp_rs3h_mux1_sel_w(ecl_byp_rs3h_mux1_sel_w),
                     .ecl_byp_rs3h_mux1_sel_w2(ecl_byp_rs3h_mux1_sel_w2),
                     .ecl_byp_rs3h_mux1_sel_other(ecl_byp_rs3h_mux1_sel_other),
                     .ecl_byp_rs1_longmux_sel_g2(ecl_byp_rs1_longmux_sel_g2),
                     .ecl_byp_rs1_longmux_sel_w2(ecl_byp_rs1_longmux_sel_w2),
                     .ecl_byp_rs1_longmux_sel_ldxa(ecl_byp_rs1_longmux_sel_ldxa),
                     .ecl_byp_rs2_longmux_sel_g2(ecl_byp_rs2_longmux_sel_g2),
                     .ecl_byp_rs2_longmux_sel_w2(ecl_byp_rs2_longmux_sel_w2),
                     .ecl_byp_rs2_longmux_sel_ldxa(ecl_byp_rs2_longmux_sel_ldxa),
                     .ecl_byp_rs3_longmux_sel_g2(ecl_byp_rs3_longmux_sel_g2),
                     .ecl_byp_rs3_longmux_sel_w2(ecl_byp_rs3_longmux_sel_w2),
                     .ecl_byp_rs3_longmux_sel_ldxa(ecl_byp_rs3_longmux_sel_ldxa),
                     .ecl_byp_rs3h_longmux_sel_g2(ecl_byp_rs3h_longmux_sel_g2),
                     .ecl_byp_rs3h_longmux_sel_w2(ecl_byp_rs3h_longmux_sel_w2),
                     .ecl_byp_rs3h_longmux_sel_ldxa(ecl_byp_rs3h_longmux_sel_ldxa),
                     .ecl_byp_std_e_l   (ecl_byp_std_e_l),
                     .ecl_byp_ldxa_g    (ecl_byp_ldxa_g),
                     .ecl_byp_3lsb_m    (ecl_byp_3lsb_m[2:0]),
                     .ecl_ecc_rs1_use_rf_e(ecl_ecc_rs1_use_rf_e),
                     .ecl_ecc_rs2_use_rf_e(ecl_ecc_rs2_use_rf_e),
                     .ecl_ecc_rs3_use_rf_e(ecl_ecc_rs3_use_rf_e),
                     .ecl_irf_rd_m      (ecl_irf_rd_m[4:0]),
                     .ecl_irf_tid_m     (ecl_irf_tid_m[1:0]),
                     .ecl_irf_wen_w     (ecl_irf_wen_w),
                     .ecl_irf_wen_w2    (ecl_irf_wen_w2),
                     .ecl_irf_rd_g      (ecl_irf_rd_g[4:0]),
                     .ecl_irf_tid_g     (ecl_irf_tid_g[1:0]),
                     .ecl_div_thr_e     (ecl_div_thr_e[3:0]),
                     .ecl_rml_thr_m     (ecl_rml_thr_m[3:0]),
                     .ecl_rml_thr_w     (ecl_rml_thr_w[3:0]),
                     .ecl_rml_xor_data_e(ecl_rml_xor_data_e[2:0]),
                     .ecl_div_ld_inputs (ecl_div_ld_inputs),
                     .ecl_div_sel_div   (ecl_div_sel_div),
                     .ecl_div_div64     (ecl_div_div64),
                     .exu_ifu_cc_d      (exu_ifu_cc_d[7:0]),
                     .ecl_shft_extendbit_e(ecl_shft_extendbit_e),
                     .ecl_shft_extend32bit_e_l(ecl_shft_extend32bit_e_l),
                     .ecl_div_zero_rs2_e(ecl_div_zero_rs2_e),
                     .ecl_div_muls_rs1_31_e_l(ecl_div_muls_rs1_31_e_l),
                     .ecl_div_yreg_data_31_g(ecl_div_yreg_data_31_g),
                     .exu_tlu_va_oor_m  (exu_tlu_va_oor_m),
                     .exu_tlu_va_oor_jl_ret_m(exu_tlu_va_oor_jl_ret_m),
                     .ecl_rml_kill_e    (ecl_rml_kill_e),
                     .ecl_rml_kill_w    (ecl_rml_kill_w),
                     .ecl_byp_sel_ecc_m (ecl_byp_sel_ecc_m),
                     .exu_tlu_ttype_m   (exu_tlu_ttype_m[8:0]),
                     .exu_tlu_ttype_vld_m(exu_tlu_ttype_vld_m),
                     .exu_tlu_ue_trap_m (exu_tlu_ue_trap_m),
                     .exu_tlu_misalign_addr_jmpl_rtn_m(exu_tlu_misalign_addr_jmpl_rtn_m),
                     .exu_lsu_priority_trap_m(exu_lsu_priority_trap_m),
                     .ecl_div_mul_wen   (ecl_div_mul_wen),
                     .ecl_div_muls      (ecl_div_muls),
                     .ecl_rml_early_flush_w(ecl_rml_early_flush_w),
                     .ecl_rml_inst_vld_w(ecl_rml_inst_vld_w),
                     // Inputs
                     .div_ecl_adder_out_31(div_ecl_adder_out_31),
                     .div_ecl_cout32    (div_ecl_cout32),
                     .div_ecl_cout64    (div_ecl_cout64),
                     .div_ecl_d_62      (div_ecl_d_62),
                     .div_ecl_d_msb     (div_ecl_d_msb),
                     .div_ecl_detect_zero_high(div_ecl_detect_zero_high),
                     .div_ecl_detect_zero_low(div_ecl_detect_zero_low),
                     .div_ecl_dividend_msb(div_ecl_dividend_msb),
                     .div_ecl_gencc_in_31(div_ecl_gencc_in_31),
                     .div_ecl_gencc_in_msb_l(div_ecl_gencc_in_msb_l),
                     .div_ecl_low32_nonzero(div_ecl_low32_nonzero),
                     .div_ecl_upper32_equal(div_ecl_upper32_equal),
                     .div_ecl_x_msb     (div_ecl_x_msb),
                     .div_ecl_xin_msb_l (div_ecl_xin_msb_l),
                     .ecc_ecl_rs1_ce    (ecc_ecl_rs1_ce),
                     .ecc_ecl_rs1_ue    (ecc_ecl_rs1_ue),
                     .ecc_ecl_rs2_ce    (ecc_ecl_rs2_ce),
                     .ecc_ecl_rs2_ue    (ecc_ecl_rs2_ue),
                     .ecc_ecl_rs3_ce    (ecc_ecl_rs3_ce),
                     .ecc_ecl_rs3_ue    (ecc_ecl_rs3_ue),
                     .ifu_exu_disable_ce_e(ifu_exu_disable_ce_e),
                     .ifu_exu_ecc_mask  (ifu_exu_ecc_mask[7:0]),
                     .ifu_exu_inj_irferr(ifu_exu_inj_irferr),
                     .ifu_exu_inst_vld_e(ifu_exu_inst_vld_e),
                     .ifu_exu_inst_vld_w(ifu_exu_inst_vld_w),
                     .ifu_exu_muldivop_d(ifu_exu_muldivop_d[4:0]),
                     .ifu_exu_return_d  (ifu_exu_return_d),
                     .ifu_tlu_sraddr_d  (ifu_tlu_sraddr_d[6:0]),
                     .ifu_tlu_wsr_inst_d(ifu_tlu_wsr_inst_d),
                     .lsu_exu_ldst_miss_g2(lsu_exu_ldst_miss_g2),
                     .mul_exu_ack       (mul_exu_ack),
                     .rml_ecl_canrestore_d(rml_ecl_canrestore_d[2:0]),
                     .rml_ecl_cansave_d (rml_ecl_cansave_d[2:0]),
                     .rml_ecl_cleanwin_d(rml_ecl_cleanwin_d[2:0]),
                     .rml_ecl_cwp_d     (rml_ecl_cwp_d[2:0]),
                     .rml_ecl_gl_e      (rml_ecl_gl_e[1:0]),
                     .rml_ecl_kill_m    (rml_ecl_kill_m),
                     .rml_ecl_otherwin_d(rml_ecl_otherwin_d[2:0]),
                     .rml_ecl_rmlop_done_e(rml_ecl_rmlop_done_e),
                     .rml_ecl_swap_done (rml_ecl_swap_done[3:0]),
                     .rml_ecl_wstate_d  (rml_ecl_wstate_d[5:0]),
                     .sehold            (sehold),
                     .tlu_exu_ccr_m     (tlu_exu_ccr_m[7:0]),
                     .tlu_exu_cwpccr_update_m(tlu_exu_cwpccr_update_m),
                     .rclk              (rclk),
                     .se                (se),
                     .grst_l            (grst_l),
                     .arst_l            (arst_l),
                     .ifu_exu_dbrinst_d (ifu_exu_dbrinst_d),
                     .ifu_exu_aluop_d   (ifu_exu_aluop_d[2:0]),
                     .ifu_exu_shiftop_d (ifu_exu_shiftop_d[2:0]),
                     .ifu_exu_invert_d  (ifu_exu_invert_d),
                     .ifu_exu_usecin_d  (ifu_exu_usecin_d),
                     .ifu_exu_enshift_d (ifu_exu_enshift_d),
                     .byp_ecl_rs2_3_0_e (byp_ecl_rs2_3_0_e[3:0]),
                     .byp_ecl_rs1_2_0_e (byp_ecl_rs1_2_0_e[2:0]),
                     .ifu_exu_use_rsr_e_l(ifu_exu_use_rsr_e_l),
                     .ifu_exu_rd_exusr_e(ifu_exu_rd_exusr_e),
                     .ifu_exu_rd_ifusr_e(ifu_exu_rd_ifusr_e),
                     .ifu_exu_rd_ffusr_e(ifu_exu_rd_ffusr_e),
                     .ifu_exu_rs1_vld_d (ifu_exu_rs1_vld_d),
                     .ifu_exu_rs2_vld_d (ifu_exu_rs2_vld_d),
                     .ifu_exu_rs3e_vld_d(ifu_exu_rs3e_vld_d),
                     .ifu_exu_rs3o_vld_d(ifu_exu_rs3o_vld_d),
                     .ifu_exu_dontmv_regz0_e(ifu_exu_dontmv_regz0_e),
                     .ifu_exu_dontmv_regz1_e(ifu_exu_dontmv_regz1_e),
                     .ifu_exu_rd_d      (ifu_exu_rd_d[4:0]),
                     .ifu_exu_tid_s2    (ifu_exu_tid_s2[1:0]),
                     .ifu_exu_kill_e    (ifu_exu_kill_e),
                     .ifu_exu_wen_d     (ifu_exu_wen_d),
                     .ifu_exu_ialign_d  (ifu_exu_ialign_d),
                     .alu_ecl_add_n64_e (alu_ecl_add_n64_e),
                     .alu_ecl_add_n32_e (alu_ecl_add_n32_e),
                     .alu_ecl_log_n64_e (alu_ecl_log_n64_e),
                     .alu_ecl_log_n32_e (alu_ecl_log_n32_e),
                     .alu_ecl_zhigh_e   (alu_ecl_zhigh_e),
                     .alu_ecl_zlow_e    (alu_ecl_zlow_e),
                     .ifu_exu_setcc_d   (ifu_exu_setcc_d),
                     .lsu_exu_dfill_vld_g(lsu_exu_dfill_vld_g),
                     .lsu_exu_rd_m      (lsu_exu_rd_m[4:0]),
                     .lsu_exu_thr_m     (lsu_exu_thr_m[1:0]),
                     .lsu_exu_ldxa_m    (lsu_exu_ldxa_m),
                     .byp_ecl_rs1_31_e  (byp_ecl_rs1_31_e),
                     .byp_ecl_rs2_31_e  (byp_ecl_rs2_31_e),
                     .byp_ecl_rs1_63_e  (byp_ecl_rs1_63_e),
                     .alu_ecl_cout64_e_l(alu_ecl_cout64_e_l),
                     .alu_ecl_cout32_e  (alu_ecl_cout32_e),
                     .alu_ecl_adder_out_63_e(alu_ecl_adder_out_63_e),
                     .alu_ecl_adderin2_63_e(alu_ecl_adderin2_63_e),
                     .alu_ecl_adderin2_31_e(alu_ecl_adderin2_31_e),
                     .ifu_exu_rs1_s     (ifu_exu_rs1_s[4:0]),
                     .ifu_exu_rs2_s     (ifu_exu_rs2_s[4:0]),
                     .ifu_exu_rs3_s     (ifu_exu_rs3_s[4:0]),
                     .ifu_exu_tagop_d   (ifu_exu_tagop_d),
                     .ifu_exu_tv_d      (ifu_exu_tv_d),
                     .ifu_exu_muls_d    (ifu_exu_muls_d),
                     .div_ecl_yreg_0_l  (div_ecl_yreg_0_l[3:0]),
                     .alu_ecl_mem_addr_invalid_e_l(alu_ecl_mem_addr_invalid_e_l),
                     .ifu_exu_range_check_jlret_d(ifu_exu_range_check_jlret_d),
                     .ifu_exu_range_check_other_d(ifu_exu_range_check_other_d),
                     .ifu_exu_addr_mask_d(ifu_exu_addr_mask_d),
                     .ifu_exu_save_d    (ifu_exu_save_d),
                     .ifu_exu_restore_d (ifu_exu_restore_d),
                     .ifu_exu_casa_d    (ifu_exu_casa_d),
                     .rml_ecl_clean_window_e(rml_ecl_clean_window_e),
                     .rml_ecl_fill_e    (rml_ecl_fill_e),
                     .rml_ecl_other_e   (rml_ecl_other_e),
                     .rml_ecl_wtype_e   (rml_ecl_wtype_e[2:0]),
                     .ifu_exu_tcc_e     (ifu_exu_tcc_e),
                     .ifu_exu_useimm_d  (ifu_exu_useimm_d),
                     .ifu_exu_nceen_e   (ifu_exu_nceen_e),
                     .ifu_tlu_flush_m   (ifu_tlu_flush_m),
                     .ifu_exu_ttype_vld_m(ifu_exu_ttype_vld_m),
                     .tlu_exu_priv_trap_m(tlu_exu_priv_trap_m),
                     .tlu_exu_pic_onebelow_m(tlu_exu_pic_onebelow_m),
                     .tlu_exu_pic_twobelow_m(tlu_exu_pic_twobelow_m),
                     .lsu_exu_flush_pipe_w(lsu_exu_flush_pipe_w),
                     .ifu_exu_sethi_inst_d(ifu_exu_sethi_inst_d),
                     .lsu_exu_st_dtlb_perr_g(lsu_exu_st_dtlb_perr_g));
   
   sparc_exu_alu alu(
                     .byp_alu_rs3_data_e(exu_lsu_rs3_data_e[63:0]),
                     .so                (scan0_2),
                     .si                (scan0_1),
                     .ifu_lsu_casa_e (ecl_alu_casa_e),
                     /*AUTOINST*/
                     // Outputs
                     .alu_byp_rd_data_e (alu_byp_rd_data_e[63:0]),
                     .exu_ifu_brpc_e    (exu_ifu_brpc_e[47:0]),
                     .exu_lsu_ldst_va_e (exu_lsu_ldst_va_e[47:0]),
                     .exu_lsu_early_va_e(exu_lsu_early_va_e[`L1D_ADDRESS_HI:3]),
                     .exu_mmu_early_va_e(exu_mmu_early_va_e[7:0]),
                     .alu_ecl_add_n64_e (alu_ecl_add_n64_e),
                     .alu_ecl_add_n32_e (alu_ecl_add_n32_e),
                     .alu_ecl_log_n64_e (alu_ecl_log_n64_e),
                     .alu_ecl_log_n32_e (alu_ecl_log_n32_e),
                     .alu_ecl_zhigh_e   (alu_ecl_zhigh_e),
                     .alu_ecl_zlow_e    (alu_ecl_zlow_e),
                     .exu_ifu_regz_e    (exu_ifu_regz_e),
                     .exu_ifu_regn_e    (exu_ifu_regn_e),
                     .alu_ecl_adderin2_63_e(alu_ecl_adderin2_63_e),
                     .alu_ecl_adderin2_31_e(alu_ecl_adderin2_31_e),
                     .alu_ecl_adder_out_63_e(alu_ecl_adder_out_63_e),
                     .alu_ecl_cout32_e  (alu_ecl_cout32_e),
                     .alu_ecl_cout64_e_l(alu_ecl_cout64_e_l),
                     .alu_ecl_mem_addr_invalid_e_l(alu_ecl_mem_addr_invalid_e_l),
                     // Inputs
                     .rclk              (rclk),
                     .se                (se),
                     .byp_alu_rs1_data_e(byp_alu_rs1_data_e[63:0]),
                     .byp_alu_rs2_data_e_l(byp_alu_rs2_data_e_l[63:0]),
                     .byp_alu_rcc_data_e(byp_alu_rcc_data_e[63:0]),
                     .ecl_alu_cin_e     (ecl_alu_cin_e),
                     .ifu_exu_invert_d  (ifu_exu_invert_d),
                     .ecl_alu_log_sel_and_e(ecl_alu_log_sel_and_e),
                     .ecl_alu_log_sel_or_e(ecl_alu_log_sel_or_e),
                     .ecl_alu_log_sel_xor_e(ecl_alu_log_sel_xor_e),
                     .ecl_alu_log_sel_move_e(ecl_alu_log_sel_move_e),
                     .ecl_alu_out_sel_sum_e_l(ecl_alu_out_sel_sum_e_l),
                     .ecl_alu_out_sel_rs3_e_l(ecl_alu_out_sel_rs3_e_l),
                     .ecl_alu_out_sel_shift_e_l(ecl_alu_out_sel_shift_e_l),
                     .ecl_alu_out_sel_logic_e_l(ecl_alu_out_sel_logic_e_l),
                     .shft_alu_shift_out_e(shft_alu_shift_out_e[63:0]),
                     .ecl_alu_sethi_inst_e(ecl_alu_sethi_inst_e));
   sparc_exu_shft shft(/*AUTOINST*/
                       // Outputs
                       .shft_alu_shift_out_e(shft_alu_shift_out_e[63:0]),
                       // Inputs
                       .ecl_shft_lshift_e_l(ecl_shft_lshift_e_l),
                       .ecl_shft_op32_e (ecl_shft_op32_e),
                       .ecl_shft_shift4_e(ecl_shft_shift4_e[3:0]),
                       .ecl_shft_shift1_e(ecl_shft_shift1_e[3:0]),
                       .byp_alu_rs1_data_e(byp_alu_rs1_data_e[63:0]),
                       .byp_alu_rs2_data_e(byp_alu_rs2_data_e[5:4]),
                       .ecl_shft_enshift_e_l(ecl_shft_enshift_e_l),
                       .ecl_shft_extendbit_e(ecl_shft_extendbit_e),
                       .ecl_shft_extend32bit_e_l(ecl_shft_extend32bit_e_l));

   sparc_exu_div div(
                     .so                (scan0_3),
                     .si                (scan0_2),
                     .byp_div_rs1_data_e(byp_alu_rs1_data_e[63:0]),
                     .byp_div_rs2_data_e(byp_alu_rs2_data_e[63:0]),
                     .byp_div_yreg_data_w(byp_irf_rd_data_w[31:0]),
                     /*AUTOINST*/
                     // Outputs
                     .div_ecl_xin_msb_l (div_ecl_xin_msb_l),
                     .div_ecl_x_msb     (div_ecl_x_msb),
                     .div_ecl_d_msb     (div_ecl_d_msb),
                     .div_ecl_cout64    (div_ecl_cout64),
                     .div_ecl_cout32    (div_ecl_cout32),
                     .div_ecl_gencc_in_msb_l(div_ecl_gencc_in_msb_l),
                     .div_ecl_gencc_in_31(div_ecl_gencc_in_31),
                     .div_ecl_upper32_equal(div_ecl_upper32_equal),
                     .div_ecl_low32_nonzero(div_ecl_low32_nonzero),
                     .div_ecl_dividend_msb(div_ecl_dividend_msb),
                     .div_byp_muldivout_g(div_byp_muldivout_g[63:0]),
                     .div_byp_yreg_e    (div_byp_yreg_e[31:0]),
                     .div_ecl_yreg_0_l  (div_ecl_yreg_0_l[3:0]),
                     .exu_mul_rs1_data  (exu_mul_rs1_data[63:0]),
                     .exu_mul_rs2_data  (exu_mul_rs2_data[63:0]),
                     .div_ecl_adder_out_31(div_ecl_adder_out_31),
                     .div_ecl_detect_zero_low(div_ecl_detect_zero_low),
                     .div_ecl_detect_zero_high(div_ecl_detect_zero_high),
                     .div_ecl_d_62      (div_ecl_d_62),
                     // Inputs
                     .ecl_div_thr_e     (ecl_div_thr_e[3:0]),
                     .ecl_div_yreg_data_31_g(ecl_div_yreg_data_31_g),
                     .ecl_div_yreg_shift_g(ecl_div_yreg_shift_g[3:0]),
                     .ecl_div_yreg_wen_g(ecl_div_yreg_wen_g[3:0]),
                     .ecl_div_yreg_wen_l(ecl_div_yreg_wen_l[3:0]),
                     .ecl_div_yreg_wen_w(ecl_div_yreg_wen_w[3:0]),
                     .rclk              (rclk),
                     .se                (se),
                     .ecl_div_keep_d    (ecl_div_keep_d),
                     .ecl_div_ld_inputs (ecl_div_ld_inputs),
                     .ecl_div_sel_adder (ecl_div_sel_adder),
                     .ecl_div_last_cycle(ecl_div_last_cycle),
                     .ecl_div_almostlast_cycle(ecl_div_almostlast_cycle),
                     .ecl_div_div64     (ecl_div_div64),
                     .ecl_div_sel_u32   (ecl_div_sel_u32),
                     .ecl_div_sel_pos32 (ecl_div_sel_pos32),
                     .ecl_div_sel_neg32 (ecl_div_sel_neg32),
                     .ecl_div_sel_64b   (ecl_div_sel_64b),
                     .ecl_div_upper32_zero(ecl_div_upper32_zero),
                     .ecl_div_upper33_one(ecl_div_upper33_one),
                     .ecl_div_upper33_zero(ecl_div_upper33_zero),
                     .mul_exu_data_g    (mul_exu_data_g[63:0]),
                     .ecl_div_sel_div   (ecl_div_sel_div),
                     .ecl_div_mul_wen   (ecl_div_mul_wen),
                     .ecl_div_dividend_sign(ecl_div_dividend_sign),
                     .ecl_div_subtract_l(ecl_div_subtract_l),
                     .ecl_div_cin       (ecl_div_cin),
                     .ecl_div_newq      (ecl_div_newq),
                     .ecl_div_xinmask   (ecl_div_xinmask),
                     .ecl_div_keepx     (ecl_div_keepx),
                     .ecl_div_mul_get_new_data(ecl_div_mul_get_new_data),
                     .ecl_div_mul_keep_data(ecl_div_mul_keep_data),
                     .ecl_div_mul_get_32bit_data(ecl_div_mul_get_32bit_data),
                     .ecl_div_mul_sext_rs2_e(ecl_div_mul_sext_rs2_e),
                     .ecl_div_mul_sext_rs1_e(ecl_div_mul_sext_rs1_e),
                     .ecl_div_muls_rs1_31_e_l(ecl_div_muls_rs1_31_e_l),
                     .ecl_div_muls      (ecl_div_muls),
                     .ecl_div_zero_rs2_e(ecl_div_zero_rs2_e));

   sparc_exu_rml rml(
                     .so                (so0),
                     .si                (scan0_3),
                  .rst_tri_en        (mux_drive_disable),
                     .exu_tlu_wsr_data_w(byp_irf_rd_data_w[5:0]),
                     .rml_irf_old_e_cwp_e(rml_irf_old_e_cwp_e[1:0]),
                     .rml_irf_new_e_cwp_e(rml_irf_new_e_cwp_e[1:0]),
                     /*AUTOINST*/
                     // Outputs
                     .exu_tlu_cwp0_w    (exu_tlu_cwp0_w[2:0]),
                     .exu_tlu_cwp1_w    (exu_tlu_cwp1_w[2:0]),
                     .exu_tlu_cwp2_w    (exu_tlu_cwp2_w[2:0]),
                     .exu_tlu_cwp3_w    (exu_tlu_cwp3_w[2:0]),
                     .exu_tlu_cwp_retry (exu_tlu_cwp_retry),
                     .exu_tlu_spill_other(exu_tlu_spill_other),
                     .exu_tlu_spill_wtype(exu_tlu_spill_wtype[2:0]),
                     .exu_tlu_cwp_cmplt (exu_tlu_cwp_cmplt),
                     .exu_tlu_cwp_cmplt_tid(exu_tlu_cwp_cmplt_tid[1:0]),
                     .rml_ecl_cwp_d     (rml_ecl_cwp_d[2:0]),
                     .rml_ecl_cansave_d (rml_ecl_cansave_d[2:0]),
                     .rml_ecl_canrestore_d(rml_ecl_canrestore_d[2:0]),
                     .rml_ecl_otherwin_d(rml_ecl_otherwin_d[2:0]),
                     .rml_ecl_wstate_d  (rml_ecl_wstate_d[5:0]),
                     .rml_ecl_cleanwin_d(rml_ecl_cleanwin_d[2:0]),
                     .rml_ecl_fill_e    (rml_ecl_fill_e),
                     .rml_ecl_clean_window_e(rml_ecl_clean_window_e),
                     .rml_ecl_other_e   (rml_ecl_other_e),
                     .rml_ecl_wtype_e   (rml_ecl_wtype_e[2:0]),
                     .exu_ifu_spill_e   (exu_ifu_spill_e),
                     .rml_ecl_gl_e      (rml_ecl_gl_e[1:0]),
                     .rml_irf_old_lo_cwp_e(rml_irf_old_lo_cwp_e[2:0]),
                     .rml_irf_new_lo_cwp_e(rml_irf_new_lo_cwp_e[2:0]),
                     .rml_irf_swap_even_e(rml_irf_swap_even_e),
                     .rml_irf_swap_odd_e(rml_irf_swap_odd_e),
                     .rml_irf_swap_local_e(rml_irf_swap_local_e),
                     .rml_irf_kill_restore_w(rml_irf_kill_restore_w),
                     .rml_irf_cwpswap_tid_e(rml_irf_cwpswap_tid_e[1:0]),
                     .rml_ecl_swap_done (rml_ecl_swap_done[3:0]),
                     .rml_ecl_rmlop_done_e(rml_ecl_rmlop_done_e),
                     .exu_ifu_oddwin_s  (exu_ifu_oddwin_s[3:0]),
                     .exu_tlu_spill     (exu_tlu_spill),
                     .exu_tlu_spill_tid (exu_tlu_spill_tid[1:0]),
                     .rml_ecl_kill_m    (rml_ecl_kill_m),
                     .rml_irf_old_agp   (rml_irf_old_agp[1:0]),
                     .rml_irf_new_agp   (rml_irf_new_agp[1:0]),
                     .rml_irf_swap_global(rml_irf_swap_global),
                     .rml_irf_global_tid(rml_irf_global_tid[1:0]),
                     // Inputs
                     .rclk              (rclk),
                     .se                (se),
                     .grst_l            (grst_l),
                     .arst_l            (arst_l),
                     .ifu_exu_tid_s2    (ifu_exu_tid_s2[1:0]),
                     .ifu_exu_save_d    (ifu_exu_save_d),
                     .ifu_exu_restore_d (ifu_exu_restore_d),
                     .ifu_exu_saved_e   (ifu_exu_saved_e),
                     .ifu_exu_restored_e(ifu_exu_restored_e),
                     .ifu_exu_flushw_e  (ifu_exu_flushw_e),
                     .ecl_rml_thr_m     (ecl_rml_thr_m[3:0]),
                     .ecl_rml_thr_w     (ecl_rml_thr_w[3:0]),
                     .ecl_rml_cwp_wen_e (ecl_rml_cwp_wen_e),
                     .ecl_rml_cansave_wen_w(ecl_rml_cansave_wen_w),
                     .ecl_rml_canrestore_wen_w(ecl_rml_canrestore_wen_w),
                     .ecl_rml_otherwin_wen_w(ecl_rml_otherwin_wen_w),
                     .ecl_rml_wstate_wen_w(ecl_rml_wstate_wen_w),
                     .ecl_rml_cleanwin_wen_w(ecl_rml_cleanwin_wen_w),
                     .ecl_rml_xor_data_e(ecl_rml_xor_data_e[2:0]),
                     .ecl_rml_kill_e    (ecl_rml_kill_e),
                     .ecl_rml_kill_w    (ecl_rml_kill_w),
                     .ecl_rml_early_flush_w(ecl_rml_early_flush_w),
                     .tlu_exu_agp       (tlu_exu_agp[1:0]),
                     .tlu_exu_agp_swap  (tlu_exu_agp_swap),
                     .tlu_exu_agp_tid   (tlu_exu_agp_tid[1:0]),
                     .tlu_exu_cwp_m     (tlu_exu_cwp_m[2:0]),
                     .tlu_exu_cwpccr_update_m(tlu_exu_cwpccr_update_m),
                     .ecl_rml_inst_vld_w(ecl_rml_inst_vld_w),
                     .tlu_exu_cwp_retry_m(tlu_exu_cwp_retry_m));
endmodule // sparc_exu
// Local Variables:
// verilog-library-directories:("." "../../../srams/rtl")
// End:
