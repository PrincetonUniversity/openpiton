// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc.v
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
`include "sys.h"
`include "iop.h"
`include "ifu.tmp.h"
`include "tlu.h"
`include "lsu.tmp.h"
`include "define.tmp.h"
`ifdef PITON_PROTO
`ifdef PITONSYS_UART_BOOT
   `include "uart16550_define.vh"
`endif   // PITONSYS_UART_BOOT
`endif   // PITON_PROTO
     
module sparc (/*AUTOARG*/
   // Outputs
   spc_grst_l, spc_pcx_req_pq, spc_pcx_atom_pq, spc_pcx_data_pa,
   `ifndef NO_RTL_CSM
   spc_pcx_csm_pa,
   `endif
   // Inputs
   pcx_spc_grant_px, cpx_spc_data_rdy_cx2, cpx_spc_data_cx2, 

   // clocking
   // cluster_cken, 
   gclk, 
   // cmp_grst_l, 
   cmp_arst_l, 
   // ctu_tst_pre_grst_l, 
   // adbginit_l, gdbginit_l,

   // jtag debugging
   // sram wrapper interface
   srams_rtap_data,
   rtap_srams_bist_command,
   rtap_srams_bist_data,

   core_rtap_data,
   rtap_core_val,
   rtap_core_threadid,
   rtap_core_id,
   rtap_core_data

   // rtap_core_stallreq
   );

   // cpx/pcx interface
   input [4:0] pcx_spc_grant_px; // pcx to processor grant info  
   input       cpx_spc_data_rdy_cx2; // cpx data inflight to sparc  
   input [`CPX_WIDTH-1:0] cpx_spc_data_cx2;     // cpx to sparc data packet
   output [4:0]   spc_pcx_req_pq;    // processor to pcx request
   output         spc_pcx_atom_pq;   // processor to pcx atomic request
   output [`PCX_WIDTH-1:0] spc_pcx_data_pa;  // processor to pcx packet

   // clk
   wire          cluster_cken;           // To spc_hdr of cluster_header.v
   input        gclk;                   // To spc_hdr of cluster_header.v
   // reset
   // input        cmp_grst_l;
   input        cmp_arst_l;
   // input        ctu_tst_pre_grst_l;     // To test_stub of test_stub_bist.v
   // input        adbginit_l;             // To spc_hdr of cluster_header.v
   // input        gdbginit_l;             // To spc_hdr of cluster_header.v
   output spc_grst_l;

   `ifndef NO_RTL_CSM
   output [`TLB_CSM] spc_pcx_csm_pa;
   `endif

   // jtag/bist stuff
   // input        rtap_core_stallreq;
   output [`SRAM_WRAPPER_BUS_WIDTH-1:0] srams_rtap_data;
   input  [`BIST_OP_WIDTH-1:0] rtap_srams_bist_command;
   input  [`SRAM_WRAPPER_BUS_WIDTH-1:0] rtap_srams_bist_data;

   wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_lsu_rtap_data;
   wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_ifu_rtap_data;
   wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_ffu_rtap_data;
   assign srams_rtap_data = sram_lsu_rtap_data | sram_ifu_rtap_data
                                 | sram_ffu_rtap_data; // TODO

   output wire [`CORE_JTAG_BUS_WIDTH-1:0] core_rtap_data;
   input wire rtap_core_val;
   input wire [1:0] rtap_core_threadid;
   input wire [`JTAG_CORE_ID_WIDTH-1:0]  rtap_core_id;
   input wire [`CORE_JTAG_BUS_WIDTH-1:0] rtap_core_data;

   wire [`CORE_JTAG_BUS_WIDTH-1:0] ifu_rtap_data;
   wire [`CORE_JTAG_BUS_WIDTH-1:0] exu_rtap_data;
   assign core_rtap_data = ifu_rtap_data | exu_rtap_data;

   // trin: these inputs/outputs are not used, and moved to respective synthesis block
   wire [3:0]  const_cpuid = 4'b0;
   wire [7:0]  const_maskid = 8'b0;           // To ifu of sparc_ifu.v
   wire        spc_scanin0 = 1'b0;
   wire        spc_scanin1 = 1'b0;

   // ----------------- End of IOs -------------------------- //

   /* AUTOOUTPUT*/
   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   // End of automatics

   // not hooked up yet
   wire [3:0]   tlu_dsfsr_flt_vld;      // To lsu of lsu.v
   wire         tlu_lsu_int_ld_ill_va_w2;// To lsu of lsu.v
   wire [9:0]   lsu_tlu_ldst_va_m;// To lsu of lsu.v
   wire [47:0]  lsu_ifu_stxa_data;  // From lsu of lsu.v

   wire         lsu_tlu_misalign_addr_ldst_atm_m ;// To tlu of tlu.v

   // name change at top level
   wire [3:0]   tlu_ifu_sftint_vld;
   wire [3:0]   tlu_hintp_vld;
   wire [3:0]   tlu_rerr_vld;
   wire         lsu_exu_ldst_miss_g2;   // To exu of sparc_exu.v
   wire         lsu_ifu_ldst_miss_w;    // To exu of sparc_exu.v
   wire         lsu_exu_dfill_vld_g;
   wire [63:0]  lsu_exu_dfill_data_g;   // From lsu of lsu.v
   wire [62:0]  tlu_sscan_test_data;
   wire         lsu_ifu_tlb_data_ue;      // dtlb data asi rd parity error
   wire         lsu_ifu_tlb_tag_ue;       // dtlb tag asi rd parity error
   wire [8:0]   ifu_tlu_imm_asi_d;      // From ifu of sparc_ifu.v
   
   wire        ifu_lsu_wsr_inst_d;     // To lsu of lsu.v, ...
   wire        ifu_exu_wsr_inst_d; 

   // hypervisor stuff
   wire [3:0]   tlu_hpstate_enb,
                tlu_hpstate_priv,
                tlu_hpstate_ibe;

   // scan chain
   wire                    short_scan0_1;
   wire                    short_scan0_2;
   wire                    short_scan0_3;
   wire                    short_scan0_4;
   wire                    short_scan0_5;
   wire                    short_scan0_6;
   wire                    scan0_1;
   wire                    scan0_2;
   wire                    scan0_3;
   wire                    scan0_4;
   wire                    scan0_5;
   wire                    scan0_6;
   wire                    scan0_7;

   wire                    short_scan1_1;
   wire                    short_scan1_2;
   wire                    short_scan1_3;
   wire                    short_scan1_4;
   wire                    short_scan1_5;
   wire                    scan1_1;
   wire                    scan1_2;
   wire                    scan1_3;
   wire                    scan1_4;

   
   // bus width difference
   wire [12:0]  lsu_t0_pctxt_state; // From lsu of lsu.v
   wire [12:0]  lsu_t1_pctxt_state; // From lsu of lsu.v
   wire [12:0]  lsu_t2_pctxt_state; // From lsu of lsu.v
   wire [12:0]  lsu_t3_pctxt_state; // From lsu of lsu.v

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [`L1D_ADDRESS_HI:0]          bist_ctl_reg_out;       // From test_stub of test_stub_bist.v
   wire                 bist_ctl_reg_wr_en;     // From lsu of lsu.v
   wire [`CPX_WIDTH-1:0]cpx_spc_data_cx2_buf;   // From buf_cpx of cpx_spc_buf.v
   wire [`CPX_WIDTH-1:0]cpx_spc_data_cx3;       // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_rdy_cx2_buf;// From buf_cpx of cpx_spc_buf.v
   wire                 cpx_spc_data_rdy_cx3;   // From ff_cpx of cpx_spc_rpt.v
   wire                 exu_ffu_wsr_inst_e;     // From exu of sparc_exu.v
   wire [47:0]          exu_ifu_brpc_e;         // From exu of sparc_exu.v
   wire [7:0]           exu_ifu_cc_d;           // From exu of sparc_exu.v
   wire                 exu_ifu_ecc_ce_m;       // From exu of sparc_exu.v
   wire                 exu_ifu_ecc_ue_m;       // From exu of sparc_exu.v
   wire [7:0]           exu_ifu_err_reg_m;      // From exu of sparc_exu.v
   wire [7:0]           exu_ifu_err_synd_m;     // From exu of sparc_exu.v
   wire                 exu_ifu_inj_ack;        // From exu of sparc_exu.v
   wire [3:0]           exu_ifu_longop_done_g;  // From exu of sparc_exu.v
   wire [3:0]           exu_ifu_oddwin_s;       // From exu of sparc_exu.v
   wire                 exu_ifu_regn_e;         // From exu of sparc_exu.v
   wire                 exu_ifu_regz_e;         // From exu of sparc_exu.v
   wire                 exu_ifu_spill_e;        // From exu of sparc_exu.v
   wire                 exu_ifu_va_oor_m;       // From exu of sparc_exu.v
   wire [`L1D_ADDRESS_HI:3]          exu_lsu_early_va_e;     // From exu of sparc_exu.v
   wire [47:0]          exu_lsu_ldst_va_e;      // From exu of sparc_exu.v
   wire                 exu_lsu_priority_trap_m;// From exu of sparc_exu.v
   wire [63:0]          exu_lsu_rs2_data_e;     // From exu of sparc_exu.v
   wire [63:0]          exu_lsu_rs3_data_e;     // From exu of sparc_exu.v
   wire [7:0]           exu_mmu_early_va_e;     // From exu of sparc_exu.v
   wire                 exu_mul_input_vld;      // From exu of sparc_exu.v
   wire [63:0]          exu_mul_rs1_data;       // From exu of sparc_exu.v
   wire [63:0]          exu_mul_rs2_data;       // From exu of sparc_exu.v
   wire [63:0]          exu_spu_rs3_data_e;     // From exu of sparc_exu.v
   wire [7:0]           exu_tlu_ccr0_w;         // From exu of sparc_exu.v
   wire [7:0]           exu_tlu_ccr1_w;         // From exu of sparc_exu.v
   wire [7:0]           exu_tlu_ccr2_w;         // From exu of sparc_exu.v
   wire [7:0]           exu_tlu_ccr3_w;         // From exu of sparc_exu.v
   wire [2:0]           exu_tlu_cwp0_w;         // From exu of sparc_exu.v
   wire [2:0]           exu_tlu_cwp1_w;         // From exu of sparc_exu.v
   wire [2:0]           exu_tlu_cwp2_w;         // From exu of sparc_exu.v
   wire [2:0]           exu_tlu_cwp3_w;         // From exu of sparc_exu.v
   wire                 exu_tlu_cwp_cmplt;      // From exu of sparc_exu.v
   wire [1:0]           exu_tlu_cwp_cmplt_tid;  // From exu of sparc_exu.v
   wire                 exu_tlu_cwp_retry;      // From exu of sparc_exu.v
   wire                 exu_tlu_misalign_addr_jmpl_rtn_m;// From exu of sparc_exu.v
   wire                 exu_tlu_spill;          // From exu of sparc_exu.v
   wire                 exu_tlu_spill_other;    // From exu of sparc_exu.v
   wire [1:0]           exu_tlu_spill_tid;      // From exu of sparc_exu.v
   wire [2:0]           exu_tlu_spill_wtype;    // From exu of sparc_exu.v
   wire [8:0]           exu_tlu_ttype_m;        // From exu of sparc_exu.v
   wire                 exu_tlu_ttype_vld_m;    // From exu of sparc_exu.v
   wire                 exu_tlu_va_oor_jl_ret_m;// From exu of sparc_exu.v
   wire                 exu_tlu_va_oor_m;       // From exu of sparc_exu.v
   wire [63:0]          exu_tlu_wsr_data_m;     // From exu of sparc_exu.v
   wire [63:0]          ffu_exu_rsr_data_m;     // From ffu of sparc_ffu.v
   wire [3:0]           ffu_ifu_cc_vld_w2;      // From ffu of sparc_ffu.v
   wire [7:0]           ffu_ifu_cc_w2;          // From ffu of sparc_ffu.v
   wire                 ffu_ifu_ecc_ce_w2;      // From ffu of sparc_ffu.v
   wire                 ffu_ifu_ecc_ue_w2;      // From ffu of sparc_ffu.v
   wire [5:0]           ffu_ifu_err_reg_w2;     // From ffu of sparc_ffu.v
   wire [13:0]          ffu_ifu_err_synd_w2;    // From ffu of sparc_ffu.v
   wire                 ffu_ifu_fpop_done_w2;   // From ffu of sparc_ffu.v
   wire                 ffu_ifu_fst_ce_w;       // From ffu of sparc_ffu.v
   wire                 ffu_ifu_inj_ack;        // From ffu of sparc_ffu.v
   wire                 ffu_ifu_stallreq;       // From ffu of sparc_ffu.v
   wire [1:0]           ffu_ifu_tid_w2;         // From ffu of sparc_ffu.v
   wire                 ffu_lsu_blk_st_e;       // From ffu of sparc_ffu.v
   wire [5:3]           ffu_lsu_blk_st_va_e;    // From ffu of sparc_ffu.v
   wire [80:0]          ffu_lsu_data;           // From ffu of sparc_ffu.v
   wire                 ffu_lsu_fpop_rq_vld;    // From ffu of sparc_ffu.v
   wire                 ffu_lsu_kill_fst_w;     // From ffu of sparc_ffu.v
   wire                 ffu_tlu_fpu_cmplt;      // From ffu of sparc_ffu.v
   wire [1:0]           ffu_tlu_fpu_tid;        // From ffu of sparc_ffu.v
   wire                 ffu_tlu_ill_inst_m;     // From ffu of sparc_ffu.v
   wire                 ffu_tlu_trap_ieee754;   // From ffu of sparc_ffu.v
   wire                 ffu_tlu_trap_other;     // From ffu of sparc_ffu.v
   wire                 ffu_tlu_trap_ue;        // From ffu of sparc_ffu.v
   wire                 ifu_exu_addr_mask_d;    // From ifu of sparc_ifu.v
   wire [2:0]           ifu_exu_aluop_d;        // From ifu of sparc_ifu.v
   wire                 ifu_exu_casa_d;         // From ifu of sparc_ifu.v
   wire                 ifu_exu_dbrinst_d;      // From ifu of sparc_ifu.v
   wire                 ifu_exu_disable_ce_e;   // From ifu of sparc_ifu.v
   wire                 ifu_exu_dontmv_regz0_e; // From ifu of sparc_ifu.v
   wire                 ifu_exu_dontmv_regz1_e; // From ifu of sparc_ifu.v
   wire [7:0]           ifu_exu_ecc_mask;       // From ifu of sparc_ifu.v
   wire                 ifu_exu_enshift_d;      // From ifu of sparc_ifu.v
   wire                 ifu_exu_flushw_e;       // From ifu of sparc_ifu.v
   wire                 ifu_exu_ialign_d;       // From ifu of sparc_ifu.v
   wire [31:0]          ifu_exu_imm_data_d;     // From ifu of sparc_ifu.v
   wire                 ifu_exu_inj_irferr;     // From ifu of sparc_ifu.v
   wire                 ifu_exu_inst_vld_e;     // From ifu of sparc_ifu.v
   wire                 ifu_exu_inst_vld_w;     // From ifu of sparc_ifu.v
   wire                 ifu_exu_invert_d;       // From ifu of sparc_ifu.v
   wire                 ifu_exu_kill_e;         // From ifu of sparc_ifu.v
   wire [4:0]           ifu_exu_muldivop_d;     // From ifu of sparc_ifu.v
   wire                 ifu_exu_muls_d;         // From ifu of sparc_ifu.v
   wire                 ifu_exu_nceen_e;        // From ifu of sparc_ifu.v
   wire [47:0]          ifu_exu_pc_d;           // From ifu of sparc_ifu.v
   wire [63:0]          ifu_exu_pcver_e;        // From ifu of sparc_ifu.v
   wire                 ifu_exu_range_check_jlret_d;// From ifu of sparc_ifu.v
   wire                 ifu_exu_range_check_other_d;// From ifu of sparc_ifu.v
   wire [4:0]           ifu_exu_rd_d;           // From ifu of sparc_ifu.v
   wire                 ifu_exu_rd_exusr_e;     // From ifu of sparc_ifu.v
   wire                 ifu_exu_rd_ffusr_e;     // From ifu of sparc_ifu.v
   wire                 ifu_exu_rd_ifusr_e;     // From ifu of sparc_ifu.v
   wire                 ifu_exu_ren1_s;         // From ifu of sparc_ifu.v
   wire                 ifu_exu_ren2_s;         // From ifu of sparc_ifu.v
   wire                 ifu_exu_ren3_s;         // From ifu of sparc_ifu.v
   wire                 ifu_exu_restore_d;      // From ifu of sparc_ifu.v
   wire                 ifu_exu_restored_e;     // From ifu of sparc_ifu.v
   wire                 ifu_exu_return_d;       // From ifu of sparc_ifu.v
   wire [4:0]           ifu_exu_rs1_s;          // From ifu of sparc_ifu.v
   wire                 ifu_exu_rs1_vld_d;      // From ifu of sparc_ifu.v
   wire [4:0]           ifu_exu_rs2_s;          // From ifu of sparc_ifu.v
   wire                 ifu_exu_rs2_vld_d;      // From ifu of sparc_ifu.v
   wire [4:0]           ifu_exu_rs3_s;          // From ifu of sparc_ifu.v
   wire                 ifu_exu_rs3e_vld_d;     // From ifu of sparc_ifu.v
   wire                 ifu_exu_rs3o_vld_d;     // From ifu of sparc_ifu.v
   wire                 ifu_exu_save_d;         // From ifu of sparc_ifu.v
   wire                 ifu_exu_saved_e;        // From ifu of sparc_ifu.v
   wire                 ifu_exu_setcc_d;        // From ifu of sparc_ifu.v
   wire                 ifu_exu_sethi_inst_d;   // From ifu of sparc_ifu.v
   wire [2:0]           ifu_exu_shiftop_d;      // From ifu of sparc_ifu.v
   wire                 ifu_exu_tagop_d;        // From ifu of sparc_ifu.v
   wire                 ifu_exu_tcc_e;          // From ifu of sparc_ifu.v
   wire [1:0]           ifu_exu_tid_s2;         // From ifu of sparc_ifu.v
   wire                 ifu_exu_ttype_vld_m;    // From ifu of sparc_ifu.v
   wire                 ifu_exu_tv_d;           // From ifu of sparc_ifu.v
   wire                 ifu_exu_use_rsr_e_l;    // From ifu of sparc_ifu.v
   wire                 ifu_exu_usecin_d;       // From ifu of sparc_ifu.v
   wire                 ifu_exu_useimm_d;       // From ifu of sparc_ifu.v
   wire                 ifu_exu_wen_d;          // From ifu of sparc_ifu.v
   wire [1:0]           ifu_ffu_fcc_num_d;      // From ifu of sparc_ifu.v
   wire                 ifu_ffu_fld_d;          // From ifu of sparc_ifu.v
   wire                 ifu_ffu_fpop1_d;        // From ifu of sparc_ifu.v
   wire                 ifu_ffu_fpop2_d;        // From ifu of sparc_ifu.v
   wire [8:0]           ifu_ffu_fpopcode_d;     // From ifu of sparc_ifu.v
   wire [4:0]           ifu_ffu_frd_d;          // From ifu of sparc_ifu.v
   wire [4:0]           ifu_ffu_frs1_d;         // From ifu of sparc_ifu.v
   wire [4:0]           ifu_ffu_frs2_d;         // From ifu of sparc_ifu.v
   wire                 ifu_ffu_fst_d;          // From ifu of sparc_ifu.v
   wire                 ifu_ffu_inj_frferr;     // From ifu of sparc_ifu.v
   wire                 ifu_ffu_ldfsr_d;        // From ifu of sparc_ifu.v
   wire                 ifu_ffu_ldst_size_d;    // From ifu of sparc_ifu.v
   wire                 ifu_ffu_ldxfsr_d;       // From ifu of sparc_ifu.v
   wire                 ifu_ffu_mvcnd_m;        // From ifu of sparc_ifu.v
   wire                 ifu_ffu_quad_op_e;      // From ifu of sparc_ifu.v
   wire                 ifu_ffu_stfsr_d;        // From ifu of sparc_ifu.v
   wire                 ifu_ffu_visop_d;        // From ifu of sparc_ifu.v
   wire                 ifu_lsu_alt_space_d;    // From ifu of sparc_ifu.v
   wire                 ifu_lsu_alt_space_e;    // From ifu of sparc_ifu.v
   wire                 ifu_lsu_asi_ack;        // From ifu of sparc_ifu.v
   wire                 ifu_lsu_asi_rd_unc;     // From ifu of sparc_ifu.v
   wire                 ifu_lsu_casa_e;         // From ifu of sparc_ifu.v
   wire [2:0]           ifu_lsu_destid_s;       // From ifu of sparc_ifu.v
   wire [3:0]           ifu_lsu_error_inj;      // From ifu of sparc_ifu.v
   wire                 ifu_lsu_fwd_data_vld;   // From ifu of sparc_ifu.v
   wire                 ifu_lsu_fwd_wr_ack;     // From ifu of sparc_ifu.v
   wire                 ifu_lsu_ibuf_busy;      // From ifu of sparc_ifu.v
   wire [7:0]           ifu_lsu_imm_asi_d;      // From ifu of sparc_ifu.v
   wire                 ifu_lsu_imm_asi_vld_d;  // From ifu of sparc_ifu.v
   wire                 ifu_lsu_inv_clear;      // From ifu of sparc_ifu.v
   wire                 ifu_lsu_ld_inst_e;      // From ifu of sparc_ifu.v
   wire                 ifu_lsu_ldst_dbl_e;     // From ifu of sparc_ifu.v
   wire                 ifu_lsu_ldst_fp_e;      // From ifu of sparc_ifu.v
   wire [1:0]           ifu_lsu_ldst_size_e;    // From ifu of sparc_ifu.v
   wire                 ifu_lsu_ldstub_e;       // From ifu of sparc_ifu.v
   wire                 ifu_lsu_ldxa_data_vld_w2;// From ifu of sparc_ifu.v
   wire [63:0]          ifu_lsu_ldxa_data_w2;   // From ifu of sparc_ifu.v
   wire                 ifu_lsu_ldxa_illgl_va_w2;// From ifu of sparc_ifu.v
   wire [1:0]           ifu_lsu_ldxa_tid_w2;    // From ifu of sparc_ifu.v
   wire                 ifu_lsu_memref_d;       // From ifu of sparc_ifu.v
   wire [3:0]           ifu_lsu_nceen;          // From ifu of sparc_ifu.v
   wire [51:0]          ifu_lsu_pcxpkt_e;       // From ifu of sparc_ifu.v
   wire                 ifu_lsu_pcxreq_d;       // From ifu of sparc_ifu.v
   wire                 ifu_lsu_pref_inst_e;    // From ifu of sparc_ifu.v
   wire [4:0]           ifu_lsu_rd_e;           // From ifu of sparc_ifu.v
   wire                 ifu_lsu_sign_ext_e;     // From ifu of sparc_ifu.v
   wire                 ifu_lsu_st_inst_e;      // From ifu of sparc_ifu.v
   wire                 ifu_lsu_swap_e;         // From ifu of sparc_ifu.v
   wire [1:0]           ifu_lsu_thrid_s;        // From ifu of sparc_ifu.v
   wire                 ifu_mmu_trap_m;         // From ifu of sparc_ifu.v
   wire                 ifu_spu_inst_vld_w;     // From ifu of sparc_ifu.v
   wire [3:0]           ifu_spu_nceen;          // From ifu of sparc_ifu.v
   wire                 ifu_spu_trap_ack;       // From ifu of sparc_ifu.v
   wire                 ifu_tlu_alt_space_d;    // From ifu of sparc_ifu.v
   wire                 ifu_tlu_done_inst_d;    // From ifu of sparc_ifu.v
   wire                 ifu_tlu_flsh_inst_e;    // From ifu of sparc_ifu.v
   wire                 ifu_tlu_flush_fd2_w;    // From lsu of lsu.v
   wire                 ifu_tlu_flush_fd3_w;    // From lsu of lsu.v
   wire                 ifu_tlu_flush_fd_w;     // From lsu of lsu.v
   wire                 ifu_tlu_flush_m;        // From ifu of sparc_ifu.v
   wire                 ifu_tlu_flush_w;        // From ifu of sparc_ifu.v
   wire                 ifu_tlu_hwint_m;        // From ifu of sparc_ifu.v
   wire                 ifu_tlu_icmiss_e;       // From ifu of sparc_ifu.v
   wire                 ifu_tlu_immu_miss_m;    // From ifu of sparc_ifu.v
   wire                 ifu_tlu_inst_vld_m;     // From ifu of sparc_ifu.v
   // wire                 ifu_tlu_inst_vld_m_bf1; // From lsu of lsu.v
   wire                 ifu_tlu_inst_vld_w;     // From ifu of sparc_ifu.v
   wire                 ifu_tlu_itlb_done;      // From ifu of sparc_ifu.v
   wire [3:0]           ifu_tlu_l2imiss;        // From ifu of sparc_ifu.v
   wire                 ifu_tlu_mb_inst_e;      // From ifu of sparc_ifu.v
   wire [48:0]          ifu_tlu_npc_m;          // From ifu of sparc_ifu.v
   wire [48:0]          ifu_tlu_pc_m;           // From ifu of sparc_ifu.v
   wire                 ifu_tlu_pc_oor_e;       // From ifu of sparc_ifu.v
   wire                 ifu_tlu_priv_violtn_m;  // From ifu of sparc_ifu.v
   wire                 ifu_tlu_retry_inst_d;   // From ifu of sparc_ifu.v
   wire                 ifu_tlu_rsr_inst_d;     // From ifu of sparc_ifu.v
   wire                 ifu_tlu_rstint_m;       // From ifu of sparc_ifu.v
   wire                 ifu_tlu_sftint_m;       // From ifu of sparc_ifu.v
   wire                 ifu_tlu_sir_inst_m;     // From ifu of sparc_ifu.v
   wire [6:0]           ifu_tlu_sraddr_d;       // From ifu of sparc_ifu.v
   wire [6:0]           ifu_tlu_sraddr_d_v2;    // From ifu of sparc_ifu.v
   wire [1:0]           ifu_tlu_thrid_d;        // From ifu of sparc_ifu.v
   wire [1:0]           ifu_tlu_thrid_e;        // From ifu of sparc_ifu.v
   wire                 ifu_tlu_trap_m;         // From ifu of sparc_ifu.v
   wire [8:0]           ifu_tlu_ttype_m;        // From ifu of sparc_ifu.v
   wire                 ifu_tlu_ttype_vld_m;    // From ifu of sparc_ifu.v
   wire [7:0]           lsu_asi_reg0;           // From lsu of lsu.v
   wire [7:0]           lsu_asi_reg1;           // From lsu of lsu.v
   wire [7:0]           lsu_asi_reg2;           // From lsu of lsu.v
   wire [7:0]           lsu_asi_reg3;           // From lsu of lsu.v
   wire [7:0]           lsu_asi_state;          // From lsu of lsu.v
   wire [3:0]           lsu_dmmu_sfsr_trp_wr;   // From lsu of lsu.v
   wire [23:0]          lsu_dsfsr_din_g;        // From lsu of lsu.v
   wire                 lsu_exu_flush_pipe_w;   // From lsu of lsu.v
   wire [63:0]          lsu_exu_ldxa_data_g;    // From tlu of tlu.v
   wire                 lsu_exu_ldxa_m;         // From tlu of tlu.v
   wire [4:0]           lsu_exu_rd_m;           // From lsu of lsu.v
   wire                 lsu_exu_st_dtlb_perr_g; // From lsu of lsu.v
   wire [1:0]           lsu_exu_thr_m;          // From lsu of lsu.v
   wire                 lsu_ffu_ack;            // From lsu of lsu.v
   wire [2:0]           lsu_ffu_bld_cnt_w;      // From lsu of lsu.v
   wire                 lsu_ffu_blk_asi_e;      // From lsu of lsu.v
   wire                 lsu_ffu_flush_pipe_w;   // From lsu of lsu.v
   wire [63:0]          lsu_ffu_ld_data;        // From lsu of lsu.v
   wire                 lsu_ffu_ld_vld;         // From lsu of lsu.v
   wire                 lsu_ffu_stb_full0;      // From lsu of lsu.v
   wire                 lsu_ffu_stb_full1;      // From lsu of lsu.v
   wire                 lsu_ffu_stb_full2;      // From lsu of lsu.v
   wire                 lsu_ffu_stb_full3;      // From lsu of lsu.v
   wire [3:0]           lsu_ictag_mrgn;         // From lsu of lsu.v
   wire [17:0]          lsu_ifu_asi_addr;       // From lsu of lsu.v
   wire                 lsu_ifu_asi_load;       // From lsu of lsu.v
   wire [7:0]           lsu_ifu_asi_state;      // From lsu of lsu.v
   wire [1:0]           lsu_ifu_asi_thrid;      // From lsu of lsu.v
   wire                 lsu_ifu_asi_vld;        // From lsu of lsu.v
   wire [`CPX_VLD-1:0]  lsu_ifu_cpxpkt_i1;      // From lsu of lsu.v
   wire                 lsu_ifu_cpxpkt_vld_i1;  // From lsu of lsu.v
   wire                 lsu_ifu_dc_parity_error_w2;// From lsu of lsu.v
   wire                 lsu_ifu_dcache_data_perror;// From lsu of lsu.v
   wire                 lsu_ifu_dcache_tag_perror;// From lsu of lsu.v
   wire                 lsu_ifu_direct_map_l1;  // From lsu of lsu.v
   wire [47:4]          lsu_ifu_err_addr;       // From lsu of lsu.v
   wire [1:0]           lsu_ifu_error_tid;      // From lsu of lsu.v
   wire                 lsu_ifu_flush_pipe_w;   // From lsu of lsu.v
   wire [3:0]           lsu_ifu_icache_en;      // From lsu of lsu.v
   wire [3:0]           lsu_ifu_inj_ack;        // From tlu of tlu.v
   wire                 lsu_ifu_io_error;       // From lsu of lsu.v
   wire [3:0]           lsu_ifu_itlb_en;        // From lsu of lsu.v
   wire                 lsu_ifu_l2_corr_error;  // From lsu of lsu.v
   wire                 lsu_ifu_l2_unc_error;   // From lsu of lsu.v
   wire [`IC_IDX_HI:5]  lsu_ifu_ld_icache_index;// From lsu of lsu.v
   wire [1:0]           lsu_ifu_ld_pcxpkt_tid;  // From lsu of lsu.v
   wire                 lsu_ifu_ld_pcxpkt_vld;  // From lsu of lsu.v
   wire [3:0]           lsu_ifu_ldst_cmplt;     // From lsu of lsu.v
   wire                 lsu_ifu_ldsta_internal_e;// From lsu of lsu.v
   wire                 lsu_ifu_pcxpkt_ack_d;   // From lsu of lsu.v
   wire                 lsu_ifu_stallreq;       // From lsu of lsu.v
   wire [3:0]           lsu_ifu_stbcnt0;        // From lsu of lsu.v
   wire [3:0]           lsu_ifu_stbcnt1;        // From lsu of lsu.v
   wire [3:0]           lsu_ifu_stbcnt2;        // From lsu of lsu.v
   wire [3:0]           lsu_ifu_stbcnt3;        // From lsu of lsu.v
   wire                 lsu_ifu_tlb_data_su;    // From lsu of lsu.v
   wire [7:0]           lsu_itlb_mrgn;          // From lsu of lsu.v
   wire [3:0]           lsu_mamem_mrgn;         // From lsu of lsu.v
   wire                 lsu_mmu_defr_trp_taken_g;// From lsu of lsu.v
   wire                 lsu_mmu_flush_pipe_w;   // From lsu of lsu.v
   wire [63:0]          lsu_mmu_rs3_data_g;     // From lsu of lsu.v
   wire [2:0]           lsu_pid_state0;         // From lsu of lsu.v
   wire [2:0]           lsu_pid_state1;         // From lsu of lsu.v
   wire [2:0]           lsu_pid_state2;         // From lsu of lsu.v
   wire [2:0]           lsu_pid_state3;         // From lsu of lsu.v
   wire [7:0]           lsu_spu_asi_state_e;    // From lsu of lsu.v
   wire                 lsu_spu_early_flush_g;  // From lsu of lsu.v
   wire                 lsu_spu_ldst_ack;       // From lsu of lsu.v
   wire [3:0]           lsu_spu_stb_empty;      // From lsu of lsu.v
   wire [1:0]           lsu_spu_strm_ack_cmplt; // From lsu of lsu.v
   wire [15:0]          lsu_sscan_data;         // From lsu of lsu.v
   wire [1:0]           lsu_tlu_async_tid_w2;   // From lsu of lsu.v
   wire                 lsu_tlu_async_ttype_vld_w2;// From lsu of lsu.v
   wire [6:0]           lsu_tlu_async_ttype_w2; // From lsu of lsu.v
   wire [3:0]           lsu_tlu_cpx_req;        // From lsu of lsu.v
   wire                 lsu_tlu_cpx_vld;        // From lsu of lsu.v
   wire                 lsu_tlu_daccess_excptn_g;// From lsu of lsu.v
   wire                 lsu_tlu_daccess_prot_g; // From lsu of lsu.v
   wire [3:0]           lsu_tlu_dcache_miss_w2; // From lsu of lsu.v
   wire                 lsu_tlu_defr_trp_taken_g;// From lsu of lsu.v
   wire                 lsu_tlu_dmmu_miss_g;    // From lsu of lsu.v
   wire [12:0]          lsu_tlu_dside_ctxt_m;   // From lsu of lsu.v
   wire                 lsu_tlu_dtlb_done;      // From lsu of lsu.v
   wire                 lsu_tlu_early_flush2_w; // From lsu of lsu.v
   wire                 lsu_tlu_early_flush_w;  // From lsu of lsu.v
   wire [17:0]          lsu_tlu_intpkt;         // From lsu of lsu.v
   wire [3:0]           lsu_tlu_l2_dmiss;       // From lsu of lsu.v
   wire                 lsu_tlu_nucleus_ctxt_m; // From lsu of lsu.v
   wire [12:0]          lsu_tlu_pctxt_m;        // From lsu of lsu.v
   wire                 lsu_tlu_pcxpkt_ack;     // From lsu of lsu.v
   wire                 lsu_tlu_priv_action_g;  // From lsu of lsu.v
   wire [63:0]          lsu_tlu_rs3_data_g;     // From lsu of lsu.v
   wire [7:0]           lsu_tlu_rsr_data_e;     // From lsu of lsu.v
   wire                 lsu_tlu_squash_va_oor_m;// From lsu of lsu.v
   wire [3:0]           lsu_tlu_stb_full_w2;    // From lsu of lsu.v
   wire [1:0]           lsu_tlu_thrid_d;        // From lsu of lsu.v
   wire [1:0]           lsu_tlu_tlb_access_tid_m;// From lsu of lsu.v
   wire [7:0]           lsu_tlu_tlb_asi_state_m;// From lsu of lsu.v
   wire [47:13]         lsu_tlu_tlb_dmp_va_m;   // From lsu of lsu.v
   wire                 lsu_tlu_tlb_ld_inst_m;  // From lsu of lsu.v
   wire [`L1D_ADDRESS_HI:0]          lsu_tlu_tlb_ldst_va_m;  // From lsu of lsu.v
   wire                 lsu_tlu_tlb_st_inst_m;  // From lsu of lsu.v
   wire [2:0]           lsu_tlu_tte_pg_sz_g;    // From lsu of lsu.v
   wire [8:0]           lsu_tlu_ttype_m2;       // From lsu of lsu.v
   wire                 lsu_tlu_ttype_vld_m2;   // From lsu of lsu.v
   wire                 lsu_tlu_wsr_inst_e;     // From lsu of lsu.v
   wire                 lsu_tlu_wtchpt_trp_g;   // From lsu of lsu.v
   // wire                 mem_bypass;             // From test_stub of test_stub_bist.v
   // wire                 mem_write_disable;      // From test_stub of test_stub_bist.v
   wire [63:0]          mul_data_out;           // From mul of sparc_mul_top.v
   wire                 mul_exu_ack;            // From mul of sparc_mul_top.v
   wire                 mul_spu_ack;            // From mul of sparc_mul_top.v
   wire                 mul_spu_shf_ack;        // From mul of sparc_mul_top.v
   // wire                 mux_drive_disable;      // From test_stub of test_stub_bist.v
   wire                 rclk;                   // From spc_hdr of bw_clk_cl_sparc_cmp.v
   wire                 se;                     // From test_stub of test_stub_bist.v
   wire                 sehold;                 // From test_stub of test_stub_bist.v
   reg                  spc_dbginit_l;          // From spc_hdr of bw_clk_cl_sparc_cmp.v
   reg                  spc_grst_l;             // From spc_hdr of bw_clk_cl_sparc_cmp.v
   wire                 spu_ifu_corr_err_w2;    // From spu of spu.v
   wire [39:4]          spu_ifu_err_addr_w2;    // From spu of spu.v
   wire                 spu_ifu_int_w2;         // From spu of spu.v
   wire                 spu_ifu_mamem_err_w1;   // From spu of spu.v
   wire [1:0]           spu_ifu_ttype_tid_w2;   // From spu of spu.v
   wire                 spu_ifu_ttype_vld_w2;   // From spu of spu.v
   wire                 spu_ifu_ttype_w2;       // From spu of spu.v
   wire                 spu_ifu_unc_err_w1;     // From spu of spu.v
   wire [123:0]         spu_lsu_ldst_pckt;      // From spu of spu.v
   wire                 spu_lsu_ldxa_data_vld_w2;// From spu of spu.v
   wire [63:0]          spu_lsu_ldxa_data_w2;   // From spu of spu.v
   wire                 spu_lsu_ldxa_illgl_va_w2;// From spu of spu.v
   wire [1:0]           spu_lsu_ldxa_tid_w2;    // From spu of spu.v
   wire                 spu_lsu_stxa_ack;       // From spu of spu.v
   wire [1:0]           spu_lsu_stxa_ack_tid;   // From spu of spu.v
   wire                 spu_lsu_unc_error_w2;   // From spu of spu.v
   wire                 spu_mul_acc;            // From spu of spu.v
   wire                 spu_mul_areg_rst;       // From spu of spu.v
   wire                 spu_mul_areg_shf;       // From spu of spu.v
   wire                 spu_mul_mulres_lshft;   // From spu of spu.v
   wire [63:0]          spu_mul_op1_data;       // From spu of spu.v
   wire [63:0]          spu_mul_op2_data;       // From spu of spu.v
   wire                 spu_mul_req_vld;        // From spu of spu.v
   wire                 testmode_l;             // From test_stub of test_stub_bist.v
   wire                 tlu_dtlb_data_rd_g;     // From tlu of tlu.v
   wire                 tlu_dtlb_dmp_actxt_g;   // From tlu of tlu.v
   wire                 tlu_dtlb_dmp_all_g;     // From tlu of tlu.v
   wire                 tlu_dtlb_dmp_nctxt_g;   // From tlu of tlu.v
   wire                 tlu_dtlb_dmp_pctxt_g;   // From tlu of tlu.v
   wire                 tlu_dtlb_dmp_sctxt_g;   // From tlu of tlu.v
   wire                 tlu_dtlb_dmp_vld_g;     // From tlu of tlu.v
   wire                 tlu_dtlb_invalidate_all_g;// From tlu of tlu.v
   wire [5:0]           tlu_dtlb_rw_index_g;    // From tlu of tlu.v
   wire                 tlu_dtlb_rw_index_vld_g;// From tlu of tlu.v
   wire                 tlu_dtlb_tag_rd_g;      // From tlu of tlu.v
   wire [42:0]          tlu_dtlb_tte_data_w2;   // From tlu of tlu.v
   wire [58:0]          tlu_dtlb_tte_tag_w2;    // From tlu of tlu.v
   wire                 tlu_early_flush_pipe2_w;// From tlu of tlu.v
   wire                 tlu_early_flush_pipe_w; // From tlu of tlu.v
   wire [`TSA_GLOBAL_WIDTH-1:0]tlu_exu_agp;     // From tlu of tlu.v
   wire                 tlu_exu_agp_swap;       // From tlu of tlu.v
   wire [1:0]           tlu_exu_agp_tid;        // From tlu of tlu.v
   wire [7:0]           tlu_exu_ccr_m;          // From tlu of tlu.v
   wire [2:0]           tlu_exu_cwp_m;          // From tlu of tlu.v
   wire                 tlu_exu_cwp_retry_m;    // From tlu of tlu.v
   wire                 tlu_exu_cwpccr_update_m;// From tlu of tlu.v
   wire                 tlu_exu_early_flush_pipe_w;// From tlu of tlu.v
   wire                 tlu_exu_pic_onebelow_m; // From tlu of tlu.v
   wire                 tlu_exu_pic_twobelow_m; // From tlu of tlu.v
   wire                 tlu_exu_priv_trap_m;    // From tlu of tlu.v
   wire [`TLU_ASR_DATA_WIDTH-1:0]tlu_exu_rsr_data_m;// From tlu of tlu.v
   wire [40:0]          tlu_idtlb_dmp_key_g;    // From tlu of tlu.v
   wire [1:0]           tlu_idtlb_dmp_thrid_g;  // From tlu of tlu.v
   wire [3:0]           tlu_ifu_hwint_i3;       // From tlu of tlu.v
   wire                 tlu_ifu_nukeint_i2;     // From tlu of tlu.v
   wire [3:0]           tlu_ifu_pstate_ie;      // From tlu of tlu.v
   wire [3:0]           tlu_ifu_pstate_pef;     // From tlu of tlu.v
   wire                 tlu_ifu_resumint_i2;    // From tlu of tlu.v
   wire                 tlu_ifu_rstint_i2;      // From tlu of tlu.v
   wire [3:0]           tlu_ifu_rstthr_i2;      // From tlu of tlu.v
   wire [1:0]           tlu_ifu_trap_tid_w1;    // From tlu of tlu.v
   wire                 tlu_ifu_trapnpc_vld_w1; // From tlu of tlu.v
   wire [48:0]          tlu_ifu_trapnpc_w2;     // From tlu of tlu.v
   wire                 tlu_ifu_trappc_vld_w1;  // From tlu of tlu.v
   wire [48:0]          tlu_ifu_trappc_w2;      // From tlu of tlu.v
   wire                 tlu_itlb_data_rd_g;     // From tlu of tlu.v
   wire                 tlu_itlb_dmp_actxt_g;   // From tlu of tlu.v
   wire                 tlu_itlb_dmp_all_g;     // From tlu of tlu.v
   wire                 tlu_itlb_dmp_nctxt_g;   // From tlu of tlu.v
   wire                 tlu_itlb_dmp_vld_g;     // From tlu of tlu.v
   wire                 tlu_itlb_invalidate_all_g;// From tlu of tlu.v
   wire [5:0]           tlu_itlb_rw_index_g;    // From tlu of tlu.v
   wire                 tlu_itlb_rw_index_vld_g;// From tlu of tlu.v
   wire                 tlu_itlb_tag_rd_g;      // From tlu of tlu.v
   wire [42:0]          tlu_itlb_tte_data_w2;   // From tlu of tlu.v
   wire [58:0]          tlu_itlb_tte_tag_w2;    // From tlu of tlu.v
   wire                 tlu_itlb_wr_vld_g;      // From tlu of tlu.v
   wire [7:0]           tlu_lsu_asi_m;          // From tlu of tlu.v
   wire                 tlu_lsu_asi_update_m;   // From tlu of tlu.v
   wire [63:0]          tlu_lsu_int_ldxa_data_w2;// From tlu of tlu.v
   wire                 tlu_lsu_int_ldxa_vld_w2;// From tlu of tlu.v
   wire                 tlu_lsu_ldxa_async_data_vld;// From tlu of tlu.v
   wire [1:0]           tlu_lsu_ldxa_tid_w2;    // From tlu of tlu.v
   wire [25:0]          tlu_lsu_pcxpkt;         // From tlu of tlu.v
   wire                 tlu_lsu_priv_trap_m;    // From tlu of tlu.v
   wire [3:0]           tlu_lsu_pstate_am;      // From tlu of tlu.v
   wire [3:0]           tlu_lsu_pstate_cle;     // From tlu of tlu.v
   wire [3:0]           tlu_lsu_pstate_priv;    // From tlu of tlu.v
   wire [3:0]           tlu_lsu_redmode;        // From tlu of tlu.v
   wire [3:0]           tlu_lsu_redmode_rst_d1; // From tlu of tlu.v
   wire                 tlu_lsu_stxa_ack;       // From tlu of tlu.v
   wire [1:0]           tlu_lsu_stxa_ack_tid;   // From tlu of tlu.v
   wire [1:0]           tlu_lsu_tid_m;          // From tlu of tlu.v
   wire [`TLU_THRD_NUM-1:0]tlu_lsu_tl_zero;     // From tlu of tlu.v
   // End of automatics

   `ifndef NO_RTL_CSM
   wire [`TLB_CSM]      ifu_lsu_pcxcsm_e;
   wire [`TLB_CSM]      tlu_itlb_tte_csm_w2;
   wire [`TLB_CSM]      tlu_dtlb_tte_csm_w2;
   wire [`TLB_CSM]      spc_pcx_csm_pa;
   wire                 tlu_itlb_csm_rd_g;
   wire                 tlu_itlb_wr_csm_sel_g;
   wire                 tlu_dtlb_csm_rd_g;
   wire                 tlu_dtlb_wr_csm_sel_g;
   `endif


   wire                 cpx_spc_data_cx3_b0;    // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b100;  // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b103;  // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b106;  // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b109;  // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b12;   // From ff_cpx of cpx_spc_rpt.v
   wire [`CPX_INV_CID_HI:`CPX_INV_CID_LO]cpx_spc_data_cx3_b120to118;// From ff_cpx of cpx_spc_rpt.v
   wire [`CPX_WIDTH-1:140]cpx_spc_data_cx3_b144to140;// From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b16;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b20;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b24;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b28;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b32;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b35;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b38;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b4;    // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b41;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b44;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b47;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b50;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b53;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b56;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b60;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b64;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b68;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b72;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b76;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b8;    // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b80;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b84;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b88;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b91;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b94;   // From ff_cpx of cpx_spc_rpt.v
   wire                 cpx_spc_data_cx3_b97;   // From ff_cpx of cpx_spc_rpt.v
   wire         lsu_ffu_st_dtlb_perr_g;
   wire         spu_tlu_rsrv_illgl_m;

   wire                 cfg_asi_lsu_ldxa_vld_w2;
   wire [1:0]           cfg_asi_lsu_ldxa_tid_w2;
   wire [63:0]          cfg_asi_lsu_ldxa_data_w2;

   // Execution drafting configuration bits
   wire                 cfg_dtu_esl_en;
   wire [1:0]           cfg_dtu_esl_sync_method;
   wire [15:0]          cfg_esl_lfsr_seed;
   wire                 cfg_esl_lfsr_ld;
   wire [49:0]          cfg_esl_pc_diff_thresh; 
   wire [15:0]          cfg_esl_counter_timeout;

   wire [`CFG_CSM_STATE_WIDTH-1:0]   cfg_ifu_csm_itlb_state;
   wire [`NOC_CHIPID_WIDTH-1:0]      cfg_ifu_csm_itlb_chipid;
   wire [`NOC_X_WIDTH-1:0]           cfg_ifu_csm_itlb_x;
   wire [`NOC_Y_WIDTH-1:0]           cfg_ifu_csm_itlb_y;
   wire [`MSG_HDID_WIDTH-1:0]        cfg_ifu_csm_itlb_hdid;
   wire [`MSG_LHID_WIDTH-1:0]        cfg_ifu_csm_itlb_hd_size;
   wire [`MSG_SDID_WIDTH-1:0]        cfg_ifu_csm_itlb_sdid;
   wire [`MSG_LSID_WIDTH-1:0]        cfg_ifu_csm_itlb_lsid;

   wire [`CFG_CSM_STATE_WIDTH-1:0]   cfg_lsu_csm_dtlb_state;
   wire [`NOC_CHIPID_WIDTH-1:0]      cfg_lsu_csm_dtlb_chipid;
   wire [`NOC_X_WIDTH-1:0]           cfg_lsu_csm_dtlb_x;
   wire [`NOC_Y_WIDTH-1:0]           cfg_lsu_csm_dtlb_y;
   wire [`MSG_HDID_WIDTH-1:0]        cfg_lsu_csm_dtlb_hdid;
   wire [`MSG_LHID_WIDTH-1:0]        cfg_lsu_csm_dtlb_hd_size;
   wire [`MSG_SDID_WIDTH-1:0]        cfg_lsu_csm_dtlb_sdid;
   wire [`MSG_LSID_WIDTH-1:0]        cfg_lsu_csm_dtlb_lsid;


   cpx_spc_buf buf_cpx (/*AUTOINST*/
                        // Outputs
                        .cpx_spc_data_cx2_buf(cpx_spc_data_cx2_buf[`CPX_WIDTH-1:0]),
                        .cpx_spc_data_rdy_cx2_buf(cpx_spc_data_rdy_cx2_buf),
                        // Inputs
                        .cpx_spc_data_cx2(cpx_spc_data_cx2[`CPX_WIDTH-1:0]),
                        .cpx_spc_data_rdy_cx2(cpx_spc_data_rdy_cx2));

/*   cpx_spc_rpt AUTO_TEMPLATE  (
                       .cpx_spc_data_cx2(cpx_spc_data_cx2_buf[`CPX_WIDTH-1:0]),
                       .cpx_spc_data_rdy_cx2(cpx_spc_data_rdy_cx2_buf),
                        .si             (short_scan0_6),
                        .so             (scan0_1));
*/

   cpx_spc_rpt ff_cpx  (
                         .cpx_spc_data_cx3_b144to140(cpx_spc_data_cx3_b144to140[`CPX_WIDTH-1:140]),
                         .cpx_spc_data_cx3_b120to118(cpx_spc_data_cx3_b120to118[`CPX_INV_CID_HI:`CPX_INV_CID_LO]),
                         .cpx_spc_data_cx3_b0(cpx_spc_data_cx3_b0),
                         .cpx_spc_data_cx3_b4(cpx_spc_data_cx3_b4),
                         .cpx_spc_data_cx3_b8(cpx_spc_data_cx3_b8),
                         .cpx_spc_data_cx3_b12(cpx_spc_data_cx3_b12),
                         .cpx_spc_data_cx3_b16(cpx_spc_data_cx3_b16),
                         .cpx_spc_data_cx3_b20(cpx_spc_data_cx3_b20),
                         .cpx_spc_data_cx3_b24(cpx_spc_data_cx3_b24),
                         .cpx_spc_data_cx3_b28(cpx_spc_data_cx3_b28),
                         .cpx_spc_data_cx3_b32(cpx_spc_data_cx3_b32),
                         .cpx_spc_data_cx3_b35(cpx_spc_data_cx3_b35),
                         .cpx_spc_data_cx3_b38(cpx_spc_data_cx3_b38),
                         .cpx_spc_data_cx3_b41(cpx_spc_data_cx3_b41),
                         .cpx_spc_data_cx3_b44(cpx_spc_data_cx3_b44),
                         .cpx_spc_data_cx3_b47(cpx_spc_data_cx3_b47),
                         .cpx_spc_data_cx3_b50(cpx_spc_data_cx3_b50),
                         .cpx_spc_data_cx3_b53(cpx_spc_data_cx3_b53),
                         .cpx_spc_data_cx3_b56(cpx_spc_data_cx3_b56),
                         .cpx_spc_data_cx3_b60(cpx_spc_data_cx3_b60),
                         .cpx_spc_data_cx3_b64(cpx_spc_data_cx3_b64),
                         .cpx_spc_data_cx3_b68(cpx_spc_data_cx3_b68),
                         .cpx_spc_data_cx3_b72(cpx_spc_data_cx3_b72),
                         .cpx_spc_data_cx3_b76(cpx_spc_data_cx3_b76),
                         .cpx_spc_data_cx3_b80(cpx_spc_data_cx3_b80),
                         .cpx_spc_data_cx3_b84(cpx_spc_data_cx3_b84),
                         .cpx_spc_data_cx3_b88(cpx_spc_data_cx3_b88),
                         .cpx_spc_data_cx3_b91(cpx_spc_data_cx3_b91),
                         .cpx_spc_data_cx3_b94(cpx_spc_data_cx3_b94),
                         .cpx_spc_data_cx3_b97(cpx_spc_data_cx3_b97),
                         .cpx_spc_data_cx3_b100(cpx_spc_data_cx3_b100),
                         .cpx_spc_data_cx3_b103(cpx_spc_data_cx3_b103),
                         .cpx_spc_data_cx3_b106(cpx_spc_data_cx3_b106),
                         .cpx_spc_data_cx3_b109(cpx_spc_data_cx3_b109),

                         /*AUTOINST*/
                        // Outputs
                        .so             (scan0_1),               // Templated
                        .cpx_spc_data_cx3(cpx_spc_data_cx3[`CPX_WIDTH-1:0]),
                        .cpx_spc_data_rdy_cx3(cpx_spc_data_rdy_cx3),
                        // Inputs
                        .rclk           (rclk),
                        .si             (short_scan0_6),         // Templated
                        .se             (se),
                        .cpx_spc_data_cx2(cpx_spc_data_cx2_buf[`CPX_WIDTH-1:0]), // Templated
                        .cpx_spc_data_rdy_cx2(cpx_spc_data_rdy_cx2_buf)); // Templated

      sparc_ifu_nospu_wrap ifu(
                 // reset stuff and clk 
                 .grst_l                 (spc_grst_l),
                 .arst_l                 (cmp_arst_l),
                 .gdbginit_l             (spc_dbginit_l),
                 
                 // tlb on condition changes with hypervisor
                 // itlb_en is the bit from the lsu control register
                 // with no additional logic
                 .lsu_ifu_addr_real_l  (lsu_ifu_itlb_en[3:0]),
                 
                 // name change
                     .lsu_ifu_dtlb_data_ue  (lsu_ifu_tlb_data_ue),
                     .lsu_ifu_dtlb_tag_ue   (lsu_ifu_tlb_tag_ue),
                 .lsu_ifu_dtlb_data_su  (lsu_ifu_tlb_data_su),

                   .tlu_ifu_hintp_vld       (tlu_hintp_vld[3:0]),
                   .tlu_ifu_rerr_vld        (tlu_rerr_vld[1:0]),

                     .lsu_ifu_t0_tlz        (tlu_lsu_tl_zero[0]),
                     .lsu_ifu_t1_tlz        (tlu_lsu_tl_zero[1]),
                     .lsu_ifu_t2_tlz        (tlu_lsu_tl_zero[2]),
                     .lsu_ifu_t3_tlz        (tlu_lsu_tl_zero[3]),
                 
                 .lsu_ifu_ldst_miss_g   (lsu_ifu_ldst_miss_w),
                 .tlu_ifu_flush_pipe_w  (lsu_ifu_flush_pipe_w),

                 .tlu_sscan_data        (tlu_sscan_test_data[62:0]),
                 .ifu_tlu_imm_asi_d     (ifu_tlu_imm_asi_d[8:0]),

                 // bus width difference
                 .lsu_ifu_cpxpkt_i1_144_130 ({lsu_ifu_cpxpkt_vld_i1,
                                              lsu_ifu_cpxpkt_i1[`CPX_VLD-1:130]}),
                 .lsu_ifu_cpxpkt_i1_127_0 (lsu_ifu_cpxpkt_i1[127:0]),
                 
                     /*AUTOINST*/
                 // Outputs

                 `ifndef NO_RTL_CSM
                 .ifu_lsu_pcxcsm_e       (ifu_lsu_pcxcsm_e), 
                 `endif
                 .ifu_exu_addr_mask_d   (ifu_exu_addr_mask_d),
                 .ifu_tlu_inst_vld_w    (ifu_tlu_inst_vld_w),
                 .ifu_tlu_flush_w       (ifu_tlu_flush_w),
                 .ifu_lsu_alt_space_e   (ifu_lsu_alt_space_e),
                 .ifu_tlu_ttype_vld_m   (ifu_tlu_ttype_vld_m),
                 .ifu_exu_muldivop_d    (ifu_exu_muldivop_d[4:0]),
                 .ifu_lsu_thrid_s       (ifu_lsu_thrid_s[1:0]),
                 .ifu_exu_aluop_d       (ifu_exu_aluop_d[2:0]),
                 .ifu_exu_casa_d        (ifu_exu_casa_d),
                 .ifu_exu_dbrinst_d     (ifu_exu_dbrinst_d),
                 .ifu_exu_disable_ce_e  (ifu_exu_disable_ce_e),
                 .ifu_exu_dontmv_regz0_e(ifu_exu_dontmv_regz0_e),
                 .ifu_exu_dontmv_regz1_e(ifu_exu_dontmv_regz1_e),
                 .ifu_exu_ecc_mask      (ifu_exu_ecc_mask[7:0]),
                 .ifu_exu_enshift_d     (ifu_exu_enshift_d),
                 .ifu_exu_flushw_e      (ifu_exu_flushw_e),
                 .ifu_exu_ialign_d      (ifu_exu_ialign_d),
                 .ifu_exu_imm_data_d    (ifu_exu_imm_data_d[31:0]),
                 .ifu_exu_inj_irferr    (ifu_exu_inj_irferr),
                 .ifu_exu_inst_vld_e    (ifu_exu_inst_vld_e),
                 .ifu_exu_inst_vld_w    (ifu_exu_inst_vld_w),
                 .ifu_exu_invert_d      (ifu_exu_invert_d),
                 .ifu_exu_kill_e        (ifu_exu_kill_e),
                 .ifu_exu_muls_d        (ifu_exu_muls_d),
                 .ifu_exu_nceen_e       (ifu_exu_nceen_e),
                 .ifu_exu_pc_d          (ifu_exu_pc_d[47:0]),
                 .ifu_exu_pcver_e       (ifu_exu_pcver_e[63:0]),
                 .ifu_exu_range_check_jlret_d(ifu_exu_range_check_jlret_d),
                 .ifu_exu_range_check_other_d(ifu_exu_range_check_other_d),
                 .ifu_exu_rd_d          (ifu_exu_rd_d[4:0]),
                 .ifu_exu_rd_exusr_e    (ifu_exu_rd_exusr_e),
                 .ifu_exu_rd_ffusr_e    (ifu_exu_rd_ffusr_e),
                 .ifu_exu_rd_ifusr_e    (ifu_exu_rd_ifusr_e),
                 .ifu_exu_ren1_s        (ifu_exu_ren1_s),
                 .ifu_exu_ren2_s        (ifu_exu_ren2_s),
                 .ifu_exu_ren3_s        (ifu_exu_ren3_s),
                 .ifu_exu_restore_d     (ifu_exu_restore_d),
                 .ifu_exu_restored_e    (ifu_exu_restored_e),
                 .ifu_exu_return_d      (ifu_exu_return_d),
                 .ifu_exu_rs1_s         (ifu_exu_rs1_s[4:0]),
                 .ifu_exu_rs1_vld_d     (ifu_exu_rs1_vld_d),
                 .ifu_exu_rs2_s         (ifu_exu_rs2_s[4:0]),
                 .ifu_exu_rs2_vld_d     (ifu_exu_rs2_vld_d),
                 .ifu_exu_rs3_s         (ifu_exu_rs3_s[4:0]),
                 .ifu_exu_rs3e_vld_d    (ifu_exu_rs3e_vld_d),
                 .ifu_exu_rs3o_vld_d    (ifu_exu_rs3o_vld_d),
                 .ifu_exu_save_d        (ifu_exu_save_d),
                 .ifu_exu_saved_e       (ifu_exu_saved_e),
                 .ifu_exu_setcc_d       (ifu_exu_setcc_d),
                 .ifu_exu_sethi_inst_d  (ifu_exu_sethi_inst_d),
                 .ifu_exu_shiftop_d     (ifu_exu_shiftop_d[2:0]),
                 .ifu_exu_tagop_d       (ifu_exu_tagop_d),
                 .ifu_exu_tcc_e         (ifu_exu_tcc_e),
                 .ifu_exu_tid_s2        (ifu_exu_tid_s2[1:0]),
                 .ifu_exu_ttype_vld_m   (ifu_exu_ttype_vld_m),
                 .ifu_exu_tv_d          (ifu_exu_tv_d),
                 .ifu_exu_use_rsr_e_l   (ifu_exu_use_rsr_e_l),
                 .ifu_exu_usecin_d      (ifu_exu_usecin_d),
                 .ifu_exu_useimm_d      (ifu_exu_useimm_d),
                 .ifu_exu_wen_d         (ifu_exu_wen_d),
                 .ifu_exu_wsr_inst_d    (ifu_exu_wsr_inst_d),
                 .ifu_ffu_fcc_num_d     (ifu_ffu_fcc_num_d[1:0]),
                 .ifu_ffu_fld_d         (ifu_ffu_fld_d),
                 .ifu_ffu_fpop1_d       (ifu_ffu_fpop1_d),
                 .ifu_ffu_fpop2_d       (ifu_ffu_fpop2_d),
                 .ifu_ffu_fpopcode_d    (ifu_ffu_fpopcode_d[8:0]),
                 .ifu_ffu_frd_d         (ifu_ffu_frd_d[4:0]),
                 .ifu_ffu_frs1_d        (ifu_ffu_frs1_d[4:0]),
                 .ifu_ffu_frs2_d        (ifu_ffu_frs2_d[4:0]),
                 .ifu_ffu_fst_d         (ifu_ffu_fst_d),
                 .ifu_ffu_inj_frferr    (ifu_ffu_inj_frferr),
                 .ifu_ffu_ldfsr_d       (ifu_ffu_ldfsr_d),
                 .ifu_ffu_ldst_size_d   (ifu_ffu_ldst_size_d),
                 .ifu_ffu_ldxfsr_d      (ifu_ffu_ldxfsr_d),
                 .ifu_ffu_mvcnd_m       (ifu_ffu_mvcnd_m),
                 .ifu_ffu_quad_op_e     (ifu_ffu_quad_op_e),
                 .ifu_ffu_stfsr_d       (ifu_ffu_stfsr_d),
                 .ifu_ffu_visop_d       (ifu_ffu_visop_d),
                 .ifu_lsu_alt_space_d   (ifu_lsu_alt_space_d),
                 .ifu_lsu_asi_ack       (ifu_lsu_asi_ack),
                 .ifu_lsu_asi_rd_unc    (ifu_lsu_asi_rd_unc),
                 .ifu_lsu_casa_e        (ifu_lsu_casa_e),
                 .ifu_lsu_destid_s      (ifu_lsu_destid_s[2:0]),
                 .ifu_lsu_error_inj     (ifu_lsu_error_inj[3:0]),
                 .ifu_lsu_fwd_data_vld  (ifu_lsu_fwd_data_vld),
                 .ifu_lsu_fwd_wr_ack    (ifu_lsu_fwd_wr_ack),
                 .ifu_lsu_ibuf_busy     (ifu_lsu_ibuf_busy),
                 .ifu_lsu_imm_asi_d     (ifu_lsu_imm_asi_d[7:0]),
                 .ifu_lsu_imm_asi_vld_d (ifu_lsu_imm_asi_vld_d),
                 .ifu_lsu_inv_clear     (ifu_lsu_inv_clear),
                 .ifu_lsu_ld_inst_e     (ifu_lsu_ld_inst_e),
                 .ifu_lsu_ldst_dbl_e    (ifu_lsu_ldst_dbl_e),
                 .ifu_lsu_ldst_fp_e     (ifu_lsu_ldst_fp_e),
                 .ifu_lsu_ldst_size_e   (ifu_lsu_ldst_size_e[1:0]),
                 .ifu_lsu_ldstub_e      (ifu_lsu_ldstub_e),
                 .ifu_lsu_ldxa_data_vld_w2(ifu_lsu_ldxa_data_vld_w2),
                 .ifu_lsu_ldxa_data_w2  (ifu_lsu_ldxa_data_w2[63:0]),
                 .ifu_lsu_ldxa_illgl_va_w2(ifu_lsu_ldxa_illgl_va_w2),
                 .ifu_lsu_ldxa_tid_w2   (ifu_lsu_ldxa_tid_w2[1:0]),
                 .ifu_lsu_memref_d      (ifu_lsu_memref_d),
                 .ifu_lsu_nceen         (ifu_lsu_nceen[3:0]),
                 .ifu_lsu_pcxpkt_e      (ifu_lsu_pcxpkt_e[51:0]),
                 .ifu_lsu_pcxreq_d      (ifu_lsu_pcxreq_d),
                 .ifu_lsu_pref_inst_e   (ifu_lsu_pref_inst_e),
                 .ifu_lsu_rd_e          (ifu_lsu_rd_e[4:0]),
                 .ifu_lsu_sign_ext_e    (ifu_lsu_sign_ext_e),
                 .ifu_lsu_st_inst_e     (ifu_lsu_st_inst_e),
                 .ifu_lsu_swap_e        (ifu_lsu_swap_e),
                 .ifu_lsu_wsr_inst_d    (ifu_lsu_wsr_inst_d),
                 .ifu_mmu_trap_m        (ifu_mmu_trap_m),
                 .ifu_tlu_alt_space_d   (ifu_tlu_alt_space_d),
                 .ifu_tlu_done_inst_d   (ifu_tlu_done_inst_d),
                 .ifu_tlu_flsh_inst_e   (ifu_tlu_flsh_inst_e),
                 .ifu_tlu_flush_m       (ifu_tlu_flush_m),
                 .ifu_tlu_hwint_m       (ifu_tlu_hwint_m),
                 .ifu_tlu_icmiss_e      (ifu_tlu_icmiss_e),
                 .ifu_tlu_immu_miss_m   (ifu_tlu_immu_miss_m),
                 .ifu_tlu_inst_vld_m    (ifu_tlu_inst_vld_m),
                 .ifu_tlu_itlb_done     (ifu_tlu_itlb_done),
                 .ifu_tlu_l2imiss       (ifu_tlu_l2imiss[3:0]),
                 .ifu_tlu_mb_inst_e     (ifu_tlu_mb_inst_e),
                 .ifu_tlu_npc_m         (ifu_tlu_npc_m[48:0]),
                 .ifu_tlu_pc_m          (ifu_tlu_pc_m[48:0]),
                 .ifu_tlu_pc_oor_e      (ifu_tlu_pc_oor_e),
                 .ifu_tlu_priv_violtn_m (ifu_tlu_priv_violtn_m),
                 .ifu_tlu_retry_inst_d  (ifu_tlu_retry_inst_d),
                 .ifu_tlu_rsr_inst_d    (ifu_tlu_rsr_inst_d),
                 .ifu_tlu_rstint_m      (ifu_tlu_rstint_m),
                 .ifu_tlu_sftint_m      (ifu_tlu_sftint_m),
                 .ifu_tlu_sir_inst_m    (ifu_tlu_sir_inst_m),
                 .ifu_tlu_sraddr_d      (ifu_tlu_sraddr_d[6:0]),
                 .ifu_tlu_sraddr_d_v2   (ifu_tlu_sraddr_d_v2[6:0]),
                 .ifu_tlu_thrid_d       (ifu_tlu_thrid_d[1:0]),
                 .ifu_tlu_thrid_e       (ifu_tlu_thrid_e[1:0]),
                 .ifu_tlu_trap_m        (ifu_tlu_trap_m),
                 .ifu_tlu_ttype_m       (ifu_tlu_ttype_m[8:0]),
                 // Inputs

                 `ifndef NO_RTL_CSM
                 .tlu_itlb_csm_rd_g     (tlu_itlb_csm_rd_g), 
                 .tlu_itlb_tte_csm_w2   (tlu_itlb_tte_csm_w2[`TLB_CSM_LOCAL]),
                 .tlu_itlb_wr_csm_sel_g (tlu_itlb_wr_csm_sel_g),

 
                 .cfg_ifu_csm_itlb_state       (cfg_ifu_csm_itlb_state),
                 .cfg_ifu_csm_itlb_chipid      (cfg_ifu_csm_itlb_chipid),
                 .cfg_ifu_csm_itlb_x           (cfg_ifu_csm_itlb_x),
                 .cfg_ifu_csm_itlb_y           (cfg_ifu_csm_itlb_y),
                 .cfg_ifu_csm_itlb_hdid        (cfg_ifu_csm_itlb_hdid),
                 .cfg_ifu_csm_itlb_hd_size     (cfg_ifu_csm_itlb_hd_size),
                 .cfg_ifu_csm_itlb_sdid        (cfg_ifu_csm_itlb_sdid),
                 .cfg_ifu_csm_itlb_lsid        (cfg_ifu_csm_itlb_lsid),
                 `endif
                 .exu_tlu_wsr_data_m    (exu_tlu_wsr_data_m[2:0]),
                 .tlu_itlb_tte_tag_w2   (tlu_itlb_tte_tag_w2[58:0]),
                 .tlu_itlb_tte_data_w2  (tlu_itlb_tte_data_w2[42:0]),
                 .tlu_itlb_rw_index_vld_g(tlu_itlb_rw_index_vld_g),
                 .tlu_itlb_rw_index_g   (tlu_itlb_rw_index_g[5:0]),
                 .tlu_idtlb_dmp_key_g   (tlu_idtlb_dmp_key_g[40:0]),
                 .tlu_itlb_dmp_all_g    (tlu_itlb_dmp_all_g),
                 // .const_cpuid           (const_cpuid[3:0]),
                 // .const_maskid          (const_maskid[7:0]),
                 // .ctu_sscan_se          (rtap_sscan_se),
                 // .ctu_tck               (ctu_tck),
                 .exu_ifu_brpc_e        (exu_ifu_brpc_e[47:0]),
                 .exu_ifu_cc_d          (exu_ifu_cc_d[7:0]),
                 .exu_ifu_ecc_ce_m      (exu_ifu_ecc_ce_m),
                 .exu_ifu_ecc_ue_m      (exu_ifu_ecc_ue_m),
                 .exu_ifu_err_reg_m     (exu_ifu_err_reg_m[7:0]),
                 .exu_ifu_err_synd_m    (exu_ifu_err_synd_m[7:0]),
                 .exu_ifu_inj_ack       (exu_ifu_inj_ack),
                 .exu_ifu_longop_done_g (exu_ifu_longop_done_g[3:0]),
                 .exu_ifu_oddwin_s      (exu_ifu_oddwin_s[3:0]),
                 .exu_ifu_regn_e        (exu_ifu_regn_e),
                 .exu_ifu_regz_e        (exu_ifu_regz_e),
                 .exu_ifu_spill_e       (exu_ifu_spill_e),
                 .exu_ifu_va_oor_m      (exu_ifu_va_oor_m),
                 .ffu_ifu_cc_vld_w2     (ffu_ifu_cc_vld_w2[1:0]),
                 .ffu_ifu_cc_w2         (ffu_ifu_cc_w2[7:0]),
                 .ffu_ifu_ecc_ce_w2     (ffu_ifu_ecc_ce_w2),
                 .ffu_ifu_ecc_ue_w2     (ffu_ifu_ecc_ue_w2),
                 .ffu_ifu_err_reg_w2    (ffu_ifu_err_reg_w2[5:0]),
                 .ffu_ifu_err_synd_w2   (ffu_ifu_err_synd_w2[13:0]),
                 .ffu_ifu_fpop_done_w2  (ffu_ifu_fpop_done_w2),
                 .ffu_ifu_fst_ce_w      (ffu_ifu_fst_ce_w),
                 .ffu_ifu_inj_ack       (ffu_ifu_inj_ack),
                 .ffu_ifu_stallreq      (ffu_ifu_stallreq),
                 .ffu_ifu_tid_w2        (ffu_ifu_tid_w2[1:0]),
                 .lsu_ifu_asi_addr      (lsu_ifu_asi_addr[17:0]),
                 .lsu_ifu_asi_load      (lsu_ifu_asi_load),
                 .lsu_ifu_asi_state     (lsu_ifu_asi_state[7:0]),
                 .lsu_ifu_asi_thrid     (lsu_ifu_asi_thrid[1:0]),
                 .lsu_ifu_asi_vld       (lsu_ifu_asi_vld),
                 .lsu_ifu_dc_parity_error_w2(lsu_ifu_dc_parity_error_w2),
                 .lsu_ifu_dcache_data_perror(lsu_ifu_dcache_data_perror),
                 .lsu_ifu_dcache_tag_perror(lsu_ifu_dcache_tag_perror),
                 .lsu_ifu_direct_map_l1 (lsu_ifu_direct_map_l1),
                 .lsu_ifu_err_addr      (lsu_ifu_err_addr[47:4]),
                 .lsu_ifu_error_tid     (lsu_ifu_error_tid[1:0]),
                 .lsu_ifu_icache_en     (lsu_ifu_icache_en[3:0]),
                 .lsu_ifu_inj_ack       (lsu_ifu_inj_ack[3:0]),
                 .lsu_ifu_io_error      (lsu_ifu_io_error),
                 .lsu_ifu_l2_corr_error (lsu_ifu_l2_corr_error),
                 .lsu_ifu_l2_unc_error  (lsu_ifu_l2_unc_error),
                 .lsu_ifu_ld_icache_index(lsu_ifu_ld_icache_index[`IC_IDX_HI:5]),
                 .lsu_ifu_ld_pcxpkt_tid (lsu_ifu_ld_pcxpkt_tid[1:0]),
                 .lsu_ifu_ld_pcxpkt_vld (lsu_ifu_ld_pcxpkt_vld),
                 // .lsu_ifu_ldst_cmplt    (lsu_ifu_ldst_cmplt[3:0]), // trin: width mismatch
                 .lsu_ifu_ldst_cmplt    (lsu_ifu_ldst_cmplt[1:0]),
                 .lsu_ifu_ldsta_internal_e(lsu_ifu_ldsta_internal_e),
                 .lsu_ifu_pcxpkt_ack_d  (lsu_ifu_pcxpkt_ack_d),
                 .lsu_ifu_stallreq      (lsu_ifu_stallreq),
                 .lsu_ifu_stbcnt0       (lsu_ifu_stbcnt0[3:0]),
                 .lsu_ifu_stbcnt1       (lsu_ifu_stbcnt1[3:0]),
                 .lsu_ifu_stbcnt2       (lsu_ifu_stbcnt2[3:0]),
                 .lsu_ifu_stbcnt3       (lsu_ifu_stbcnt3[3:0]),
                 .lsu_ifu_stxa_data     (lsu_ifu_stxa_data[47:0]),
                 .lsu_pid_state0        (lsu_pid_state0[2:0]),
                 .lsu_pid_state1        (lsu_pid_state1[2:0]),
                 .lsu_pid_state2        (lsu_pid_state2[2:0]),
                 .lsu_pid_state3        (lsu_pid_state3[2:0]),
                 .lsu_t0_pctxt_state    (lsu_t0_pctxt_state[12:0]),
                 .lsu_t1_pctxt_state    (lsu_t1_pctxt_state[12:0]),
                 .rclk                  (rclk),
                 .tlu_hpstate_enb       (tlu_hpstate_enb[3:0]),
                 .tlu_hpstate_ibe       (tlu_hpstate_ibe[3:0]),
                 .tlu_hpstate_priv      (tlu_hpstate_priv[3:0]),
                 .tlu_idtlb_dmp_thrid_g (tlu_idtlb_dmp_thrid_g[1:0]),
                 .tlu_ifu_hwint_i3      (tlu_ifu_hwint_i3[3:0]),
                 .tlu_ifu_nukeint_i2    (tlu_ifu_nukeint_i2),
                 .tlu_ifu_pstate_ie     (tlu_ifu_pstate_ie[1:0]),
                 .tlu_ifu_pstate_pef    (tlu_ifu_pstate_pef[3:0]),
                 .tlu_ifu_resumint_i2   (tlu_ifu_resumint_i2),
                 .tlu_ifu_rstint_i2     (tlu_ifu_rstint_i2),
                 .tlu_ifu_rstthr_i2     (tlu_ifu_rstthr_i2[3:0]),
                 .tlu_ifu_sftint_vld    (tlu_ifu_sftint_vld[1:0]),
                 .tlu_ifu_trap_tid_w1   (tlu_ifu_trap_tid_w1[1:0]),
                 .tlu_ifu_trapnpc_vld_w1(tlu_ifu_trapnpc_vld_w1),
                 .tlu_ifu_trapnpc_w2    (tlu_ifu_trapnpc_w2[48:0]),
                 .tlu_ifu_trappc_vld_w1 (tlu_ifu_trappc_vld_w1),
                 .tlu_ifu_trappc_w2     (tlu_ifu_trappc_w2[48:0]),
                 .tlu_itlb_data_rd_g    (tlu_itlb_data_rd_g),
                 .tlu_itlb_dmp_actxt_g  (tlu_itlb_dmp_actxt_g),
                 .tlu_itlb_dmp_nctxt_g  (tlu_itlb_dmp_nctxt_g),
                 .tlu_itlb_dmp_vld_g    (tlu_itlb_dmp_vld_g),
                 .tlu_itlb_invalidate_all_g(tlu_itlb_invalidate_all_g),
                 .tlu_itlb_tag_rd_g     (tlu_itlb_tag_rd_g),
                 .tlu_itlb_wr_vld_g     (tlu_itlb_wr_vld_g),
                 .tlu_lsu_pstate_am     (tlu_lsu_pstate_am[3:0]),
                 .tlu_lsu_pstate_priv   (tlu_lsu_pstate_priv[3:0]),
                 .tlu_lsu_redmode       (tlu_lsu_redmode[3:0]),
                 .config_dtu_esl_en     (cfg_dtu_esl_en),
                 .config_dtu_esl_sync_method (cfg_dtu_esl_sync_method),
                 .config_esl_lfsr_seed (cfg_esl_lfsr_seed),
                 .config_esl_lfsr_ld (cfg_esl_lfsr_ld),
                 .config_esl_pc_diff_thresh (cfg_esl_pc_diff_thresh),
                 .config_esl_counter_timeout (cfg_esl_counter_timeout),
                 // .rtap_core_stallreq (rtap_core_stallreq),
                 .lsu_sscan_data              (lsu_sscan_data[15:0]),

                 // trin: use this ifu, this is the default
                 // interface to srams and other jtag functionalities
                 .srams_rtap_data (sram_ifu_rtap_data),
                 .rtap_srams_bist_command (rtap_srams_bist_command),
                 .rtap_srams_bist_data (rtap_srams_bist_data),

                .core_rtap_data          (ifu_rtap_data),
                .rtap_core_val         (rtap_core_val),
                .rtap_core_threadid         (rtap_core_threadid),
                .rtap_core_id         (rtap_core_id),
                .rtap_core_data_47_0         (rtap_core_data[47:0])

                 );

      lsu_nospu_wrap lsu(
           // temp - name change
           .ifu_tlu_wsr_inst_d          (ifu_lsu_wsr_inst_d),
       // eco 6529 .
       .lsu_ffu_st_dtlb_perr_g      (lsu_ffu_st_dtlb_perr_g),
       // Bug 4799.
       .tlu_lsu_priv_trap_m     (tlu_lsu_priv_trap_m),

           // reset stuff
           .grst_l                       (spc_grst_l),
           .arst_l                       (cmp_arst_l),
           .clk                          (rclk),
             .lsu_exu_dfill_data_w2 (lsu_exu_dfill_data_g[63:0]),
             .lsu_exu_dfill_vld_w2  (lsu_exu_dfill_vld_g),
             .lsu_exu_ldst_miss_w2  (lsu_exu_ldst_miss_g2),
           //.cpx_spc_data_cx             (cpx_spc_data_cx3[`CPX_WIDTH-1:0]),
           .cpx_spc_data_cx             ({cpx_spc_data_cx3_b144to140[`CPX_WIDTH-1:140],
                                          cpx_spc_data_cx3[139:121],
                                          cpx_spc_data_cx3_b120to118[`CPX_INV_CID_HI:`CPX_INV_CID_LO],
                                          cpx_spc_data_cx3[117:110],
                                          cpx_spc_data_cx3_b109,
                                          cpx_spc_data_cx3[108:107],
                                          cpx_spc_data_cx3_b106,
                                          cpx_spc_data_cx3[105:104],
                                          cpx_spc_data_cx3_b103,
                                          cpx_spc_data_cx3[102:101],
                                          cpx_spc_data_cx3_b100,
                                          cpx_spc_data_cx3[99:98],
                                          cpx_spc_data_cx3_b97,
                                          cpx_spc_data_cx3[96:95],
                                          cpx_spc_data_cx3_b94,
                                          cpx_spc_data_cx3[93:92],
                                          cpx_spc_data_cx3_b91,
                                          cpx_spc_data_cx3[90:89],
                                          cpx_spc_data_cx3_b88,
                                          cpx_spc_data_cx3[87:85],
                                          cpx_spc_data_cx3_b84,
                                          cpx_spc_data_cx3[83:81],
                                          cpx_spc_data_cx3_b80,
                                          cpx_spc_data_cx3[79:77],
                                          cpx_spc_data_cx3_b76,
                                          cpx_spc_data_cx3[75:73],
                                          cpx_spc_data_cx3_b72,
                                          cpx_spc_data_cx3[71:69],
                                          cpx_spc_data_cx3_b68,
                                          cpx_spc_data_cx3[67:65],
                                          cpx_spc_data_cx3_b64,
                                          cpx_spc_data_cx3[63:61],
                                          cpx_spc_data_cx3_b60,
                                          cpx_spc_data_cx3[59:57],
                                          cpx_spc_data_cx3_b56,
                                          cpx_spc_data_cx3[55:54],
                                          cpx_spc_data_cx3_b53,
                                          cpx_spc_data_cx3[52:51],
                                          cpx_spc_data_cx3_b50,
                                          cpx_spc_data_cx3[49:48],
                                          cpx_spc_data_cx3_b47,
                                          cpx_spc_data_cx3[46:45],
                                          cpx_spc_data_cx3_b44,
                                          cpx_spc_data_cx3[43:42],
                                          cpx_spc_data_cx3_b41,
                                          cpx_spc_data_cx3[40:39],
                                          cpx_spc_data_cx3_b38,
                                          cpx_spc_data_cx3[37:36],
                                          cpx_spc_data_cx3_b35,
                                          cpx_spc_data_cx3[34:33],
                                          cpx_spc_data_cx3_b32,
                                          cpx_spc_data_cx3[31:29],
                                          cpx_spc_data_cx3_b28,
                                          cpx_spc_data_cx3[27:25],
                                          cpx_spc_data_cx3_b24,
                                          cpx_spc_data_cx3[23:21],
                                          cpx_spc_data_cx3_b20,
                                          cpx_spc_data_cx3[19:17],
                                          cpx_spc_data_cx3_b16,
                                          cpx_spc_data_cx3[15:13],
                                          cpx_spc_data_cx3_b12,
                                          cpx_spc_data_cx3[11:9],
                                          cpx_spc_data_cx3_b8,
                                          cpx_spc_data_cx3[7:5],
                                          cpx_spc_data_cx3_b4,
                                          cpx_spc_data_cx3[3:1],
                                          cpx_spc_data_cx3_b0}),
           .exu_tlu_wsr_data_m          (exu_tlu_wsr_data_m[7:0]),
           
       // Hypervisor related
           .tlu_lsu_hpv_priv        (tlu_hpstate_priv[3:0]),
           .tlu_lsu_hpstate_en      (tlu_hpstate_enb[3:0]),

           .gdbginit_l              (spc_dbginit_l),
           /*AUTOINST*/
           // Outputs
           `ifndef NO_RTL_CSM
           .spc_pcx_csm_pa              (spc_pcx_csm_pa),
           `endif
           .ifu_tlu_flush_fd2_w         (ifu_tlu_flush_fd2_w),
           .ifu_tlu_flush_fd3_w         (ifu_tlu_flush_fd3_w),
           .ifu_tlu_flush_fd_w          (ifu_tlu_flush_fd_w),
           .lsu_asi_reg0                (lsu_asi_reg0[7:0]),
           .lsu_asi_reg1                (lsu_asi_reg1[7:0]),
           .lsu_asi_reg2                (lsu_asi_reg2[7:0]),
           .lsu_asi_reg3                (lsu_asi_reg3[7:0]),
           .lsu_dmmu_sfsr_trp_wr        (lsu_dmmu_sfsr_trp_wr[3:0]),
           .lsu_dsfsr_din_g             (lsu_dsfsr_din_g[23:0]),
           .lsu_exu_flush_pipe_w        (lsu_exu_flush_pipe_w),
           .lsu_exu_rd_m                (lsu_exu_rd_m[4:0]),
           .lsu_exu_st_dtlb_perr_g      (lsu_exu_st_dtlb_perr_g),
           .lsu_exu_thr_m               (lsu_exu_thr_m[1:0]),
           .lsu_ffu_ack                 (lsu_ffu_ack),
           .lsu_ffu_blk_asi_e           (lsu_ffu_blk_asi_e),
           .lsu_ffu_flush_pipe_w        (lsu_ffu_flush_pipe_w),
           .lsu_ffu_ld_data             (lsu_ffu_ld_data[63:0]),
           .lsu_ffu_ld_vld              (lsu_ffu_ld_vld),
           .lsu_ffu_stb_full0           (lsu_ffu_stb_full0),
           .lsu_ffu_stb_full1           (lsu_ffu_stb_full1),
           .lsu_ffu_stb_full2           (lsu_ffu_stb_full2),
           .lsu_ffu_stb_full3           (lsu_ffu_stb_full3),
           .lsu_ictag_mrgn              (lsu_ictag_mrgn[3:0]),
           .lsu_ifu_asi_addr            (lsu_ifu_asi_addr[17:0]),
           .lsu_ifu_asi_load            (lsu_ifu_asi_load),
           .lsu_ifu_asi_state           (lsu_ifu_asi_state[7:0]),
           .lsu_ifu_asi_thrid           (lsu_ifu_asi_thrid[1:0]),
           .lsu_ifu_asi_vld             (lsu_ifu_asi_vld),
           .lsu_ifu_cpxpkt_i1           (lsu_ifu_cpxpkt_i1[`CPX_VLD-1:0]),
           .lsu_ifu_cpxpkt_vld_i1       (lsu_ifu_cpxpkt_vld_i1),
           .lsu_ifu_dc_parity_error_w2  (lsu_ifu_dc_parity_error_w2),
           .lsu_ifu_dcache_data_perror  (lsu_ifu_dcache_data_perror),
           .lsu_ifu_dcache_tag_perror   (lsu_ifu_dcache_tag_perror),
           .lsu_ifu_direct_map_l1       (lsu_ifu_direct_map_l1),
           .lsu_ifu_error_tid           (lsu_ifu_error_tid[1:0]),
           .lsu_ifu_flush_pipe_w        (lsu_ifu_flush_pipe_w),
           .lsu_ifu_icache_en           (lsu_ifu_icache_en[3:0]),
           .lsu_ifu_io_error            (lsu_ifu_io_error),
           .lsu_ifu_itlb_en             (lsu_ifu_itlb_en[3:0]),
           .lsu_ifu_l2_corr_error       (lsu_ifu_l2_corr_error),
           .lsu_ifu_l2_unc_error        (lsu_ifu_l2_unc_error),
           .lsu_ifu_ld_icache_index     (lsu_ifu_ld_icache_index[`IC_IDX_HI:5]),
           .lsu_ifu_ld_pcxpkt_tid       (lsu_ifu_ld_pcxpkt_tid[1:0]),
           .lsu_ifu_ld_pcxpkt_vld       (lsu_ifu_ld_pcxpkt_vld),
           .lsu_ifu_ldst_cmplt          (lsu_ifu_ldst_cmplt[3:0]),
           .lsu_ifu_ldst_miss_w         (lsu_ifu_ldst_miss_w),
           .lsu_ifu_ldsta_internal_e    (lsu_ifu_ldsta_internal_e),
           .lsu_ifu_pcxpkt_ack_d        (lsu_ifu_pcxpkt_ack_d),
           .lsu_ifu_stallreq            (lsu_ifu_stallreq),
           .lsu_ifu_stbcnt0             (lsu_ifu_stbcnt0[3:0]),
           .lsu_ifu_stbcnt1             (lsu_ifu_stbcnt1[3:0]),
           .lsu_ifu_stbcnt2             (lsu_ifu_stbcnt2[3:0]),
           .lsu_ifu_stbcnt3             (lsu_ifu_stbcnt3[3:0]),
           .lsu_ifu_stxa_data           (lsu_ifu_stxa_data[47:0]),
           .lsu_ifu_tlb_data_su         (lsu_ifu_tlb_data_su),
           .lsu_ifu_tlb_data_ue         (lsu_ifu_tlb_data_ue),
           .lsu_ifu_tlb_tag_ue          (lsu_ifu_tlb_tag_ue),
           .lsu_itlb_mrgn               (lsu_itlb_mrgn[7:0]),
           .lsu_mmu_defr_trp_taken_g    (lsu_mmu_defr_trp_taken_g),
           .lsu_mmu_flush_pipe_w        (lsu_mmu_flush_pipe_w),
           .lsu_mmu_rs3_data_g          (lsu_mmu_rs3_data_g[63:0]),
           .lsu_pid_state0              (lsu_pid_state0[2:0]),
           .lsu_pid_state1              (lsu_pid_state1[2:0]),
           .lsu_pid_state2              (lsu_pid_state2[2:0]),
           .lsu_pid_state3              (lsu_pid_state3[2:0]),
           .lsu_spu_asi_state_e         (lsu_spu_asi_state_e),
           .lsu_t0_pctxt_state          (lsu_t0_pctxt_state[12:0]),
           .lsu_t1_pctxt_state          (lsu_t1_pctxt_state[12:0]),
           .lsu_t2_pctxt_state          (lsu_t2_pctxt_state[12:0]),
           .lsu_t3_pctxt_state          (lsu_t3_pctxt_state[12:0]),
           .lsu_tlu_async_tid_w2        (lsu_tlu_async_tid_w2[1:0]),
           .lsu_tlu_async_ttype_vld_w2  (lsu_tlu_async_ttype_vld_w2),
           .lsu_tlu_async_ttype_w2      (lsu_tlu_async_ttype_w2[6:0]),
           .lsu_tlu_cpx_req             (lsu_tlu_cpx_req[3:0]),
           .lsu_tlu_cpx_vld             (lsu_tlu_cpx_vld),
           .lsu_tlu_daccess_excptn_g    (lsu_tlu_daccess_excptn_g),
           .lsu_tlu_dcache_miss_w2      (lsu_tlu_dcache_miss_w2[3:0]),
           .lsu_tlu_defr_trp_taken_g    (lsu_tlu_defr_trp_taken_g),
           .lsu_tlu_dmmu_miss_g         (lsu_tlu_dmmu_miss_g),
           .lsu_tlu_dside_ctxt_m        (lsu_tlu_dside_ctxt_m[12:0]),
           .lsu_tlu_dtlb_done           (lsu_tlu_dtlb_done),
           .lsu_tlu_early_flush2_w      (lsu_tlu_early_flush2_w),
           .lsu_tlu_early_flush_w       (lsu_tlu_early_flush_w),
           .lsu_tlu_intpkt              (lsu_tlu_intpkt[17:0]),
           .lsu_tlu_l2_dmiss            (lsu_tlu_l2_dmiss[3:0]),
           .lsu_tlu_ldst_va_m           (lsu_tlu_ldst_va_m[9:0]),
           .lsu_tlu_misalign_addr_ldst_atm_m(lsu_tlu_misalign_addr_ldst_atm_m),
           .lsu_tlu_pctxt_m             (lsu_tlu_pctxt_m[12:0]),
           .lsu_tlu_pcxpkt_ack          (lsu_tlu_pcxpkt_ack),
           .lsu_tlu_rs3_data_g          (lsu_tlu_rs3_data_g[63:0]),
           .lsu_tlu_rsr_data_e          (lsu_tlu_rsr_data_e[7:0]),
           .lsu_tlu_stb_full_w2         (lsu_tlu_stb_full_w2[3:0]),
           .lsu_tlu_thrid_d             (lsu_tlu_thrid_d[1:0]),
           .lsu_tlu_tlb_access_tid_m    (lsu_tlu_tlb_access_tid_m[1:0]),
           .lsu_tlu_tlb_asi_state_m     (lsu_tlu_tlb_asi_state_m[7:0]),
           .lsu_tlu_tlb_dmp_va_m        (lsu_tlu_tlb_dmp_va_m[47:13]),
           .lsu_tlu_tlb_ld_inst_m       (lsu_tlu_tlb_ld_inst_m),
           .lsu_tlu_tlb_ldst_va_m       (lsu_tlu_tlb_ldst_va_m[`L1D_ADDRESS_HI:0]),
           .lsu_tlu_tlb_st_inst_m       (lsu_tlu_tlb_st_inst_m),
           .lsu_tlu_ttype_m2            (lsu_tlu_ttype_m2[8:0]),
           .lsu_tlu_ttype_vld_m2        (lsu_tlu_ttype_vld_m2),
           .lsu_tlu_wsr_inst_e          (lsu_tlu_wsr_inst_e),
           .spc_pcx_atom_pq             (spc_pcx_atom_pq),
           .spc_pcx_data_pa             (spc_pcx_data_pa[`PCX_WIDTH-1:0]),
           .spc_pcx_req_pq              (spc_pcx_req_pq[4:0]),
           .lsu_asi_state               (lsu_asi_state[7:0]),
           .lsu_ifu_err_addr            (lsu_ifu_err_addr[47:4]),
           .lsu_sscan_data              (lsu_sscan_data[15:0]),
           // .ifu_tlu_inst_vld_m_bf1      (ifu_tlu_inst_vld_m_bf1),
           .lsu_ffu_bld_cnt_w           (lsu_ffu_bld_cnt_w[2:0]),
           .lsu_tlu_nucleus_ctxt_m      (lsu_tlu_nucleus_ctxt_m),
           .lsu_tlu_tte_pg_sz_g         (lsu_tlu_tte_pg_sz_g[2:0]),
           .lsu_tlu_squash_va_oor_m     (lsu_tlu_squash_va_oor_m),
           .lsu_tlu_wtchpt_trp_g        (lsu_tlu_wtchpt_trp_g),
           .lsu_tlu_daccess_prot_g      (lsu_tlu_daccess_prot_g),
           .lsu_tlu_priv_action_g       (lsu_tlu_priv_action_g),
           // Inputs

           `ifndef NO_RTL_CSM
           .tlu_dtlb_csm_rd_g           (tlu_dtlb_csm_rd_g), 
           .tlu_dtlb_tte_csm_w2         (tlu_dtlb_tte_csm_w2[`TLB_CSM_LOCAL]), 
           .ifu_lsu_pcxcsm_e            (ifu_lsu_pcxcsm_e), 
           .tlu_dtlb_wr_csm_sel_g       (tlu_dtlb_wr_csm_sel_g),

           .cfg_lsu_csm_dtlb_state      (cfg_lsu_csm_dtlb_state),
           .cfg_lsu_csm_dtlb_chipid     (cfg_lsu_csm_dtlb_chipid),
           .cfg_lsu_csm_dtlb_x          (cfg_lsu_csm_dtlb_x),
           .cfg_lsu_csm_dtlb_y          (cfg_lsu_csm_dtlb_y),
           .cfg_lsu_csm_dtlb_hdid       (cfg_lsu_csm_dtlb_hdid),
           .cfg_lsu_csm_dtlb_hd_size    (cfg_lsu_csm_dtlb_hd_size),
           .cfg_lsu_csm_dtlb_sdid       (cfg_lsu_csm_dtlb_sdid),
           .cfg_lsu_csm_dtlb_lsid       (cfg_lsu_csm_dtlb_lsid),

           `endif
           .bist_ctl_reg_out            (bist_ctl_reg_out[`L1D_ADDRESS_HI:0]),
           .const_cpuid                 (const_cpuid[2:0]),
           .exu_lsu_rs2_data_e          (exu_lsu_rs2_data_e[63:0]),
           .exu_lsu_rs3_data_e          (exu_lsu_rs3_data_e[63:0]),
           .exu_tlu_misalign_addr_jmpl_rtn_m(exu_tlu_misalign_addr_jmpl_rtn_m),
           .exu_tlu_va_oor_m            (exu_tlu_va_oor_m),
           .ffu_lsu_blk_st_e            (ffu_lsu_blk_st_e),
           .ffu_lsu_blk_st_va_e         (ffu_lsu_blk_st_va_e[5:3]),
           .ffu_lsu_fpop_rq_vld         (ffu_lsu_fpop_rq_vld),
           .ffu_lsu_kill_fst_w          (ffu_lsu_kill_fst_w),
           .ifu_lsu_alt_space_d         (ifu_lsu_alt_space_d),
           .ifu_lsu_alt_space_e         (ifu_lsu_alt_space_e),
           .ifu_lsu_asi_ack             (ifu_lsu_asi_ack),
           .ifu_lsu_asi_rd_unc          (ifu_lsu_asi_rd_unc),
           .ifu_lsu_casa_e              (ifu_lsu_casa_e),
           .ifu_lsu_destid_s            (ifu_lsu_destid_s[2:0]),
           .ifu_lsu_fwd_data_vld        (ifu_lsu_fwd_data_vld),
           .ifu_lsu_fwd_wr_ack          (ifu_lsu_fwd_wr_ack),
           .ifu_lsu_ibuf_busy           (ifu_lsu_ibuf_busy),
           .ifu_lsu_imm_asi_d           (ifu_lsu_imm_asi_d[7:0]),
           .ifu_lsu_imm_asi_vld_d       (ifu_lsu_imm_asi_vld_d),
           .ifu_lsu_inv_clear           (ifu_lsu_inv_clear),
           .ifu_lsu_ld_inst_e           (ifu_lsu_ld_inst_e),
           .ifu_lsu_ldst_dbl_e          (ifu_lsu_ldst_dbl_e),
           .ifu_lsu_ldst_fp_e           (ifu_lsu_ldst_fp_e),
           .ifu_lsu_ldst_size_e         (ifu_lsu_ldst_size_e[1:0]),
           .ifu_lsu_ldstub_e            (ifu_lsu_ldstub_e),
           .ifu_lsu_ldxa_data_vld_w2    (ifu_lsu_ldxa_data_vld_w2),
           .ifu_lsu_ldxa_data_w2        (ifu_lsu_ldxa_data_w2[63:0]),
           .ifu_lsu_ldxa_illgl_va_w2    (ifu_lsu_ldxa_illgl_va_w2),
           .ifu_lsu_ldxa_tid_w2         (ifu_lsu_ldxa_tid_w2[1:0]),
           .ifu_lsu_memref_d            (ifu_lsu_memref_d),
           .ifu_lsu_nceen               (ifu_lsu_nceen[3:0]),
           .ifu_lsu_pcxpkt_e            (ifu_lsu_pcxpkt_e[51:0]),
           .ifu_lsu_pcxreq_d            (ifu_lsu_pcxreq_d),
           .ifu_lsu_pref_inst_e         (ifu_lsu_pref_inst_e),
           .ifu_lsu_rd_e                (ifu_lsu_rd_e[4:0]),
           .ifu_lsu_sign_ext_e          (ifu_lsu_sign_ext_e),
           .ifu_lsu_st_inst_e           (ifu_lsu_st_inst_e),
           .ifu_lsu_swap_e              (ifu_lsu_swap_e),
           .ifu_lsu_thrid_s             (ifu_lsu_thrid_s[1:0]),
           .ifu_tlu_flsh_inst_e         (ifu_tlu_flsh_inst_e),
           .ifu_tlu_flush_m             (ifu_tlu_flush_m),
           .ifu_tlu_inst_vld_m          (ifu_tlu_inst_vld_m),
           .ifu_tlu_mb_inst_e           (ifu_tlu_mb_inst_e),
           .ifu_tlu_sraddr_d            (ifu_tlu_sraddr_d[6:0]),
           .ifu_tlu_thrid_e             (ifu_tlu_thrid_e[1:0]),
           .pcx_spc_grant_px0           (pcx_spc_grant_px[0]),
           .tlu_dsfsr_flt_vld           (tlu_dsfsr_flt_vld[3:0]),
           .tlu_dtlb_data_rd_g          (tlu_dtlb_data_rd_g),
           .tlu_dtlb_dmp_actxt_g        (tlu_dtlb_dmp_actxt_g),
           .tlu_dtlb_dmp_all_g          (tlu_dtlb_dmp_all_g),
           .tlu_dtlb_dmp_nctxt_g        (tlu_dtlb_dmp_nctxt_g),
           .tlu_dtlb_dmp_pctxt_g        (tlu_dtlb_dmp_pctxt_g),
           .tlu_dtlb_dmp_sctxt_g        (tlu_dtlb_dmp_sctxt_g),
           .tlu_dtlb_dmp_vld_g          (tlu_dtlb_dmp_vld_g),
           .tlu_dtlb_invalidate_all_g   (tlu_dtlb_invalidate_all_g),
           .tlu_dtlb_rw_index_g         (tlu_dtlb_rw_index_g[5:0]),
           .tlu_dtlb_rw_index_vld_g     (tlu_dtlb_rw_index_vld_g),
           .tlu_dtlb_tag_rd_g           (tlu_dtlb_tag_rd_g),
           .tlu_dtlb_tte_data_w2        (tlu_dtlb_tte_data_w2[42:0]),
           .tlu_dtlb_tte_tag_w2         (tlu_dtlb_tte_tag_w2[58:0]),
           .tlu_early_flush_pipe2_w     (tlu_early_flush_pipe2_w),
           .tlu_early_flush_pipe_w      (tlu_early_flush_pipe_w),
           .tlu_exu_early_flush_pipe_w  (tlu_exu_early_flush_pipe_w),
           .tlu_idtlb_dmp_key_g         (tlu_idtlb_dmp_key_g[40:0]),
           .tlu_idtlb_dmp_thrid_g       (tlu_idtlb_dmp_thrid_g[1:0]),
           .tlu_lsu_asi_m               (tlu_lsu_asi_m[7:0]),
           .tlu_lsu_asi_update_m        (tlu_lsu_asi_update_m),
           .tlu_lsu_int_ld_ill_va_w2    (tlu_lsu_int_ld_ill_va_w2),
           .tlu_lsu_int_ldxa_data_w2    (tlu_lsu_int_ldxa_data_w2[63:0]),
           .tlu_lsu_int_ldxa_vld_w2     (tlu_lsu_int_ldxa_vld_w2),
           .tlu_lsu_ldxa_async_data_vld (tlu_lsu_ldxa_async_data_vld),
           .tlu_lsu_ldxa_tid_w2         (tlu_lsu_ldxa_tid_w2[1:0]),
           .tlu_lsu_pcxpkt              (tlu_lsu_pcxpkt[25:0]),
           .tlu_lsu_pstate_am           (tlu_lsu_pstate_am[3:0]),
           .tlu_lsu_pstate_cle          (tlu_lsu_pstate_cle[3:0]),
           .tlu_lsu_pstate_priv         (tlu_lsu_pstate_priv[3:0]),
           .tlu_lsu_redmode             (tlu_lsu_redmode[1:0]),
           .tlu_lsu_redmode_rst_d1      (tlu_lsu_redmode_rst_d1[3:0]),
           .tlu_lsu_stxa_ack            (tlu_lsu_stxa_ack),
           .tlu_lsu_stxa_ack_tid        (tlu_lsu_stxa_ack_tid[1:0]),
           .tlu_lsu_tid_m               (tlu_lsu_tid_m[1:0]),
           .tlu_lsu_tl_zero             (tlu_lsu_tl_zero[3:0]),
           .exu_lsu_ldst_va_e           (exu_lsu_ldst_va_e[47:0]),
           .exu_lsu_early_va_e          (exu_lsu_early_va_e[`L1D_ADDRESS_HI:3]),
//           .ffu_lsu_data                (ffu_lsu_data[80:0]));
           .ffu_lsu_data                (ffu_lsu_data[80:0]),
           .cfg_asi_lsu_ldxa_vld_w2     (cfg_asi_lsu_ldxa_vld_w2),
           .cfg_asi_lsu_ldxa_tid_w2     (cfg_asi_lsu_ldxa_tid_w2),
           .cfg_asi_lsu_ldxa_data_w2    (cfg_asi_lsu_ldxa_data_w2),


           // interface to srams
           .srams_rtap_data (sram_lsu_rtap_data),
           .rtap_srams_bist_command (rtap_srams_bist_command),
           .rtap_srams_bist_data (rtap_srams_bist_data),

    // .core_rtap_data          (core_rtap_data),
    .rtap_core_val         (rtap_core_val),
    .rtap_core_threadid         (rtap_core_threadid),
    .rtap_core_id         (rtap_core_id),
    .rtap_core_data_13_0         (rtap_core_data[13:0])
            );



    sparc_exu_wrap exu   (
                 // reset stuff
                 .grst_l                (spc_grst_l),
                 .arst_l                (cmp_arst_l),
                 .mul_exu_data_g (mul_data_out[63:0]),
                 .ifu_tlu_wsr_inst_d (ifu_exu_wsr_inst_d),
                     /*AUTOINST*/
                 // Outputs
                 .exu_ffu_wsr_inst_e    (exu_ffu_wsr_inst_e),
                 .exu_ifu_brpc_e        (exu_ifu_brpc_e[47:0]),
                 .exu_ifu_cc_d          (exu_ifu_cc_d[7:0]),
                 .exu_ifu_ecc_ce_m      (exu_ifu_ecc_ce_m),
                 .exu_ifu_ecc_ue_m      (exu_ifu_ecc_ue_m),
                 .exu_ifu_err_reg_m     (exu_ifu_err_reg_m[7:0]),
                 .exu_ifu_inj_ack       (exu_ifu_inj_ack),
                 .exu_ifu_longop_done_g (exu_ifu_longop_done_g[3:0]),
                 .exu_ifu_oddwin_s      (exu_ifu_oddwin_s[3:0]),
                 .exu_ifu_regn_e        (exu_ifu_regn_e),
                 .exu_ifu_regz_e        (exu_ifu_regz_e),
                 .exu_ifu_spill_e       (exu_ifu_spill_e),
                 .exu_ifu_va_oor_m      (exu_ifu_va_oor_m),
                 .exu_lsu_early_va_e    (exu_lsu_early_va_e[`L1D_ADDRESS_HI:3]),
                 .exu_lsu_ldst_va_e     (exu_lsu_ldst_va_e[47:0]),
                 .exu_lsu_priority_trap_m(exu_lsu_priority_trap_m),
                 .exu_lsu_rs2_data_e    (exu_lsu_rs2_data_e[63:0]),
                 .exu_lsu_rs3_data_e    (exu_lsu_rs3_data_e[63:0]),
                 .exu_mmu_early_va_e    (exu_mmu_early_va_e[7:0]),
                 .exu_mul_input_vld     (exu_mul_input_vld),
                 .exu_mul_rs1_data      (exu_mul_rs1_data[63:0]),
                 .exu_mul_rs2_data      (exu_mul_rs2_data[63:0]),
                 .exu_tlu_ccr0_w        (exu_tlu_ccr0_w[7:0]),
                 .exu_tlu_ccr1_w        (exu_tlu_ccr1_w[7:0]),
                 .exu_tlu_ccr2_w        (exu_tlu_ccr2_w[7:0]),
                 .exu_tlu_ccr3_w        (exu_tlu_ccr3_w[7:0]),
                 .exu_tlu_cwp0_w        (exu_tlu_cwp0_w[2:0]),
                 .exu_tlu_cwp1_w        (exu_tlu_cwp1_w[2:0]),
                 .exu_tlu_cwp2_w        (exu_tlu_cwp2_w[2:0]),
                 .exu_tlu_cwp3_w        (exu_tlu_cwp3_w[2:0]),
                 .exu_tlu_cwp_cmplt     (exu_tlu_cwp_cmplt),
                 .exu_tlu_cwp_cmplt_tid (exu_tlu_cwp_cmplt_tid[1:0]),
                 .exu_tlu_cwp_retry     (exu_tlu_cwp_retry),
                 .exu_tlu_misalign_addr_jmpl_rtn_m(exu_tlu_misalign_addr_jmpl_rtn_m),
                 .exu_tlu_spill         (exu_tlu_spill),
                 .exu_tlu_spill_other   (exu_tlu_spill_other),
                 .exu_tlu_spill_tid     (exu_tlu_spill_tid[1:0]),
                 .exu_tlu_spill_wtype   (exu_tlu_spill_wtype[2:0]),
                 .exu_tlu_ttype_m       (exu_tlu_ttype_m[8:0]),
                 .exu_tlu_ttype_vld_m   (exu_tlu_ttype_vld_m),
                 .exu_tlu_va_oor_jl_ret_m(exu_tlu_va_oor_jl_ret_m),
                 .exu_tlu_va_oor_m      (exu_tlu_va_oor_m),
                 .exu_tlu_wsr_data_m    (exu_tlu_wsr_data_m[63:0]),
                 .exu_ifu_err_synd_m    (exu_ifu_err_synd_m[7:0]),
                 // Inputs
                 .ffu_exu_rsr_data_m    (ffu_exu_rsr_data_m[63:0]),
                 .ifu_exu_addr_mask_d   (ifu_exu_addr_mask_d),
                 .ifu_exu_aluop_d       (ifu_exu_aluop_d[2:0]),
                 .ifu_exu_casa_d        (ifu_exu_casa_d),
                 .ifu_exu_dbrinst_d     (ifu_exu_dbrinst_d),
                 .ifu_exu_disable_ce_e  (ifu_exu_disable_ce_e),
                 .ifu_exu_dontmv_regz0_e(ifu_exu_dontmv_regz0_e),
                 .ifu_exu_dontmv_regz1_e(ifu_exu_dontmv_regz1_e),
                 .ifu_exu_ecc_mask      (ifu_exu_ecc_mask[7:0]),
                 .ifu_exu_enshift_d     (ifu_exu_enshift_d),
                 .ifu_exu_flushw_e      (ifu_exu_flushw_e),
                 .ifu_exu_ialign_d      (ifu_exu_ialign_d),
                 .ifu_exu_imm_data_d    (ifu_exu_imm_data_d[31:0]),
                 .ifu_exu_inj_irferr    (ifu_exu_inj_irferr),
                 .ifu_exu_inst_vld_e    (ifu_exu_inst_vld_e),
                 .ifu_exu_inst_vld_w    (ifu_exu_inst_vld_w),
                 .ifu_exu_invert_d      (ifu_exu_invert_d),
                 .ifu_exu_kill_e        (ifu_exu_kill_e),
                 .ifu_exu_muldivop_d    (ifu_exu_muldivop_d[4:0]),
                 .ifu_exu_muls_d        (ifu_exu_muls_d),
                 .ifu_exu_nceen_e       (ifu_exu_nceen_e),
                 .ifu_exu_pc_d          (ifu_exu_pc_d[47:0]),
                 .ifu_exu_pcver_e       (ifu_exu_pcver_e[63:0]),
                 .ifu_exu_range_check_jlret_d(ifu_exu_range_check_jlret_d),
                 .ifu_exu_range_check_other_d(ifu_exu_range_check_other_d),
                 .ifu_exu_rd_d          (ifu_exu_rd_d[4:0]),
                 .ifu_exu_rd_exusr_e    (ifu_exu_rd_exusr_e),
                 .ifu_exu_rd_ffusr_e    (ifu_exu_rd_ffusr_e),
                 .ifu_exu_rd_ifusr_e    (ifu_exu_rd_ifusr_e),
                 .ifu_exu_ren1_s        (ifu_exu_ren1_s),
                 .ifu_exu_ren2_s        (ifu_exu_ren2_s),
                 .ifu_exu_ren3_s        (ifu_exu_ren3_s),
                 .ifu_exu_restore_d     (ifu_exu_restore_d),
                 .ifu_exu_restored_e    (ifu_exu_restored_e),
                 .ifu_exu_return_d      (ifu_exu_return_d),
                 .ifu_exu_rs1_s         (ifu_exu_rs1_s[4:0]),
                 .ifu_exu_rs1_vld_d     (ifu_exu_rs1_vld_d),
                 .ifu_exu_rs2_s         (ifu_exu_rs2_s[4:0]),
                 .ifu_exu_rs2_vld_d     (ifu_exu_rs2_vld_d),
                 .ifu_exu_rs3_s         (ifu_exu_rs3_s[4:0]),
                 .ifu_exu_rs3e_vld_d    (ifu_exu_rs3e_vld_d),
                 .ifu_exu_rs3o_vld_d    (ifu_exu_rs3o_vld_d),
                 .ifu_exu_save_d        (ifu_exu_save_d),
                 .ifu_exu_saved_e       (ifu_exu_saved_e),
                 .ifu_exu_setcc_d       (ifu_exu_setcc_d),
                 .ifu_exu_sethi_inst_d  (ifu_exu_sethi_inst_d),
                 .ifu_exu_shiftop_d     (ifu_exu_shiftop_d[2:0]),
                 .ifu_exu_tagop_d       (ifu_exu_tagop_d),
                 .ifu_exu_tcc_e         (ifu_exu_tcc_e),
                 .ifu_exu_tid_s2        (ifu_exu_tid_s2[1:0]),
                 .ifu_exu_ttype_vld_m   (ifu_exu_ttype_vld_m),
                 .ifu_exu_tv_d          (ifu_exu_tv_d),
                 .ifu_exu_use_rsr_e_l   (ifu_exu_use_rsr_e_l),
                 .ifu_exu_usecin_d      (ifu_exu_usecin_d),
                 .ifu_exu_useimm_d      (ifu_exu_useimm_d),
                 .ifu_exu_wen_d         (ifu_exu_wen_d),
                 .ifu_tlu_flush_m       (ifu_tlu_flush_m),
                 .ifu_tlu_sraddr_d      (ifu_tlu_sraddr_d[6:0]),
                 .lsu_exu_dfill_data_g  (lsu_exu_dfill_data_g[63:0]),
                 .lsu_exu_dfill_vld_g   (lsu_exu_dfill_vld_g),
                 .lsu_exu_flush_pipe_w  (lsu_exu_flush_pipe_w),
                 .lsu_exu_ldst_miss_g2  (lsu_exu_ldst_miss_g2),
                 .lsu_exu_ldxa_data_g   (lsu_exu_ldxa_data_g[63:0]),
                 .lsu_exu_ldxa_m        (lsu_exu_ldxa_m),
                 .lsu_exu_rd_m          (lsu_exu_rd_m[4:0]),
                 .lsu_exu_st_dtlb_perr_g(lsu_exu_st_dtlb_perr_g),
                 .lsu_exu_thr_m         (lsu_exu_thr_m[1:0]),
                 .mul_exu_ack           (mul_exu_ack),
                 .rclk                  (rclk),
                 .tlu_exu_agp           (tlu_exu_agp[1:0]),
                 .tlu_exu_agp_swap      (tlu_exu_agp_swap),
                 .tlu_exu_agp_tid       (tlu_exu_agp_tid[1:0]),
                 .tlu_exu_ccr_m         (tlu_exu_ccr_m[7:0]),
                 .tlu_exu_cwp_m         (tlu_exu_cwp_m[2:0]),
                 .tlu_exu_cwp_retry_m   (tlu_exu_cwp_retry_m),
                 .tlu_exu_cwpccr_update_m(tlu_exu_cwpccr_update_m),
                 .tlu_exu_pic_onebelow_m(tlu_exu_pic_onebelow_m),
                 .tlu_exu_pic_twobelow_m(tlu_exu_pic_twobelow_m),
                 .tlu_exu_priv_trap_m   (tlu_exu_priv_trap_m),
                 .tlu_exu_rsr_data_m    (tlu_exu_rsr_data_m[63:0]),

                 .core_rtap_data          (exu_rtap_data),
                 .rtap_core_val         (rtap_core_val),
                 .rtap_core_threadid_0         (rtap_core_threadid[0]),
                 .rtap_core_id         (rtap_core_id),
                 .rtap_core_data_4_0         (rtap_core_data[4:0])
                );

      tlu_nospu_wrap tlu(
           .grst_l                (spc_grst_l),
           .arst_l                (cmp_arst_l),
           .tlu_sftint_vld          (tlu_ifu_sftint_vld[3:0]),
           .ifu_tlu_swint_m         (ifu_tlu_sftint_m),
           .exu_tlu_cwp0                (exu_tlu_cwp0_w[2:0]),
           .exu_tlu_cwp1                (exu_tlu_cwp1_w[2:0]),
           .exu_tlu_cwp2                (exu_tlu_cwp2_w[2:0]),
           .exu_tlu_cwp3                (exu_tlu_cwp3_w[2:0]),

           // new interface to the pib block
           .ifu_lsu_imm_asi_d           (ifu_tlu_imm_asi_d[8:0]),
           
           .ifu_tlu_imiss_e       (ifu_tlu_icmiss_e),
           // MMU_ASI_RD_CHANGE
           .ifu_tlu_thrid_d             (lsu_tlu_thrid_d[1:0]),
           .lsu_tlu_st_rs3_data_g_63_59 (lsu_mmu_rs3_data_g[63:59]),
           .lsu_tlu_st_rs3_data_g_48_0  (lsu_mmu_rs3_data_g[48:0]),           
           .lsu_tlu_async_ttype_g       (lsu_tlu_async_ttype_w2[6:0]),
           .lsu_tlu_async_tid_g         (lsu_tlu_async_tid_w2[1:0]),
           .lsu_tlu_async_ttype_vld_g   (lsu_tlu_async_ttype_vld_w2),
       // end of new interface to the pib
       /*AUTOINST*/
           // Outputs
           `ifndef NO_RTL_CSM
           .tlu_dtlb_csm_rd_g           (tlu_dtlb_csm_rd_g), 
           .tlu_itlb_csm_rd_g           (tlu_itlb_csm_rd_g), 
           .tlu_dtlb_tte_csm_w2         (tlu_dtlb_tte_csm_w2), 
           .tlu_itlb_tte_csm_w2         (tlu_itlb_tte_csm_w2),
           .tlu_itlb_wr_csm_sel_g       (tlu_itlb_wr_csm_sel_g), 
           .tlu_dtlb_wr_csm_sel_g       (tlu_dtlb_wr_csm_sel_g),
           `endif

           .tlu_lsu_int_ldxa_data_w2    (tlu_lsu_int_ldxa_data_w2[63:0]),
           .tlu_lsu_int_ld_ill_va_w2    (tlu_lsu_int_ld_ill_va_w2),
           .tlu_lsu_int_ldxa_vld_w2     (tlu_lsu_int_ldxa_vld_w2),
           .tlu_dtlb_data_rd_g          (tlu_dtlb_data_rd_g),
           .tlu_dtlb_dmp_actxt_g        (tlu_dtlb_dmp_actxt_g),
           .tlu_dtlb_dmp_all_g          (tlu_dtlb_dmp_all_g),
           .tlu_dtlb_dmp_nctxt_g        (tlu_dtlb_dmp_nctxt_g),
           .tlu_dtlb_dmp_pctxt_g        (tlu_dtlb_dmp_pctxt_g),
           .tlu_dtlb_dmp_sctxt_g        (tlu_dtlb_dmp_sctxt_g),
           .tlu_dtlb_dmp_vld_g          (tlu_dtlb_dmp_vld_g),
           .tlu_dtlb_invalidate_all_g   (tlu_dtlb_invalidate_all_g),
           .tlu_dtlb_rw_index_g         (tlu_dtlb_rw_index_g[5:0]),
           .tlu_dtlb_rw_index_vld_g     (tlu_dtlb_rw_index_vld_g),
           .tlu_dtlb_tag_rd_g           (tlu_dtlb_tag_rd_g),
           .tlu_dtlb_tte_data_w2        (tlu_dtlb_tte_data_w2[42:0]),
           .tlu_dtlb_tte_tag_w2         (tlu_dtlb_tte_tag_w2[58:0]),
           .lsu_ifu_inj_ack             (lsu_ifu_inj_ack[3:0]),
           .tlu_exu_agp                 (tlu_exu_agp[`TSA_GLOBAL_WIDTH-1:0]),
           .tlu_exu_agp_swap            (tlu_exu_agp_swap),
           .tlu_exu_agp_tid             (tlu_exu_agp_tid[1:0]),
           .tlu_exu_ccr_m               (tlu_exu_ccr_m[7:0]),
           .tlu_exu_cwp_m               (tlu_exu_cwp_m[2:0]),
           .tlu_exu_cwp_retry_m         (tlu_exu_cwp_retry_m),
           .tlu_exu_cwpccr_update_m     (tlu_exu_cwpccr_update_m),
           .tlu_exu_rsr_data_m          (tlu_exu_rsr_data_m[`TLU_ASR_DATA_WIDTH-1:0]),
           .tlu_idtlb_dmp_key_g         (tlu_idtlb_dmp_key_g[40:0]),
           .tlu_idtlb_dmp_thrid_g       (tlu_idtlb_dmp_thrid_g[1:0]),
           .tlu_ifu_hwint_i3            (tlu_ifu_hwint_i3[3:0]),
           .tlu_ifu_nukeint_i2          (tlu_ifu_nukeint_i2),
           .tlu_ifu_pstate_ie           (tlu_ifu_pstate_ie[3:0]),
           .tlu_ifu_pstate_pef          (tlu_ifu_pstate_pef[3:0]),
           .tlu_ifu_resumint_i2         (tlu_ifu_resumint_i2),
           .tlu_ifu_rstint_i2           (tlu_ifu_rstint_i2),
           .tlu_ifu_rstthr_i2           (tlu_ifu_rstthr_i2[3:0]),
           .tlu_ifu_trap_tid_w1         (tlu_ifu_trap_tid_w1[1:0]),
           .tlu_ifu_trapnpc_vld_w1      (tlu_ifu_trapnpc_vld_w1),
           .tlu_ifu_trapnpc_w2          (tlu_ifu_trapnpc_w2[48:0]),
           .tlu_ifu_trappc_w2           (tlu_ifu_trappc_w2[48:0]),
           .tlu_ifu_trappc_vld_w1       (tlu_ifu_trappc_vld_w1),
           .tlu_itlb_data_rd_g          (tlu_itlb_data_rd_g),
           .tlu_itlb_dmp_actxt_g        (tlu_itlb_dmp_actxt_g),
           .tlu_itlb_dmp_all_g          (tlu_itlb_dmp_all_g),
           .tlu_itlb_dmp_nctxt_g        (tlu_itlb_dmp_nctxt_g),
           .tlu_itlb_dmp_vld_g          (tlu_itlb_dmp_vld_g),
           .tlu_itlb_invalidate_all_g   (tlu_itlb_invalidate_all_g),
           .tlu_itlb_rw_index_g         (tlu_itlb_rw_index_g[5:0]),
           .tlu_itlb_rw_index_vld_g     (tlu_itlb_rw_index_vld_g),
           .tlu_itlb_tag_rd_g           (tlu_itlb_tag_rd_g),
           .tlu_itlb_tte_data_w2        (tlu_itlb_tte_data_w2[42:0]),
           .tlu_itlb_tte_tag_w2         (tlu_itlb_tte_tag_w2[58:0]),
           .tlu_itlb_wr_vld_g           (tlu_itlb_wr_vld_g),
           .tlu_lsu_asi_m               (tlu_lsu_asi_m[7:0]),
           .tlu_lsu_asi_update_m        (tlu_lsu_asi_update_m),
           .tlu_sscan_test_data         (tlu_sscan_test_data[62:0]),
           .tlu_lsu_ldxa_tid_w2         (tlu_lsu_ldxa_tid_w2[1:0]),
           .tlu_lsu_pcxpkt              (tlu_lsu_pcxpkt[25:0]),
           .tlu_lsu_pstate_am           (tlu_lsu_pstate_am[3:0]),
           .tlu_lsu_pstate_cle          (tlu_lsu_pstate_cle[3:0]),
           .tlu_lsu_pstate_priv         (tlu_lsu_pstate_priv[3:0]),
           .tlu_lsu_redmode             (tlu_lsu_redmode[3:0]),
           .tlu_lsu_redmode_rst_d1      (tlu_lsu_redmode_rst_d1[3:0]),
           .tlu_lsu_stxa_ack            (tlu_lsu_stxa_ack),
           .tlu_lsu_stxa_ack_tid        (tlu_lsu_stxa_ack_tid[1:0]),
           .tlu_lsu_tid_m               (tlu_lsu_tid_m[1:0]),
           .tlu_lsu_tl_zero             (tlu_lsu_tl_zero[`TLU_THRD_NUM-1:0]),
           .tlu_hintp_vld               (tlu_hintp_vld[`TLU_THRD_NUM-1:0]),
           .tlu_rerr_vld                (tlu_rerr_vld[`TLU_THRD_NUM-1:0]),
           .tlu_early_flush_pipe_w      (tlu_early_flush_pipe_w),
           .tlu_early_flush_pipe2_w     (tlu_early_flush_pipe2_w),
           .tlu_exu_early_flush_pipe_w  (tlu_exu_early_flush_pipe_w),
           .tlu_lsu_ldxa_async_data_vld (tlu_lsu_ldxa_async_data_vld),
           .tlu_hpstate_priv            (tlu_hpstate_priv[`TLU_THRD_NUM-1:0]),
           .tlu_hpstate_enb             (tlu_hpstate_enb[`TLU_THRD_NUM-1:0]),
           .tlu_hpstate_ibe             (tlu_hpstate_ibe[`TLU_THRD_NUM-1:0]),
           .tlu_exu_priv_trap_m         (tlu_exu_priv_trap_m),
           .tlu_lsu_priv_trap_m         (tlu_lsu_priv_trap_m),
           .tlu_exu_pic_onebelow_m      (tlu_exu_pic_onebelow_m),
           .tlu_exu_pic_twobelow_m      (tlu_exu_pic_twobelow_m),
           .lsu_exu_ldxa_m              (lsu_exu_ldxa_m),
           .lsu_exu_ldxa_data_g         (lsu_exu_ldxa_data_g[63:0]),
           .tlu_dsfsr_flt_vld           (tlu_dsfsr_flt_vld[3:0]),
           // Inputs
           .rclk                        (rclk),
           .const_cpuid                 (const_cpuid[2:0]),
           .exu_lsu_ldst_va_e           (exu_lsu_ldst_va_e[`ASI_VA_WIDTH-1:0]),
           .lsu_tlu_ldst_va_m           (lsu_tlu_ldst_va_m[`TLU_ASI_VA_WIDTH-1:0]),
           .exu_mmu_early_va_e          (exu_mmu_early_va_e[7:0]),
           .exu_tlu_ccr0_w              (exu_tlu_ccr0_w[7:0]),
           .exu_tlu_ccr1_w              (exu_tlu_ccr1_w[7:0]),
`ifndef CONFIG_NUM_THREADS
`else
           .exu_tlu_ccr2_w              (exu_tlu_ccr2_w[7:0]),
           .exu_tlu_ccr3_w              (exu_tlu_ccr3_w[7:0]),
`endif           
           .exu_tlu_cwp_cmplt           (exu_tlu_cwp_cmplt),
           .exu_tlu_cwp_cmplt_tid       (exu_tlu_cwp_cmplt_tid[1:0]),
           .exu_tlu_cwp_retry           (exu_tlu_cwp_retry),
           .exu_tlu_misalign_addr_jmpl_rtn_m(exu_tlu_misalign_addr_jmpl_rtn_m),
           .exu_tlu_spill               (exu_tlu_spill),
           .exu_tlu_spill_tid           (exu_tlu_spill_tid[1:0]),
           .exu_tlu_spill_other         (exu_tlu_spill_other),
           .exu_tlu_spill_wtype         (exu_tlu_spill_wtype[2:0]),
           .exu_tlu_ttype_m             (exu_tlu_ttype_m[8:0]),
           .exu_tlu_ttype_vld_m         (exu_tlu_ttype_vld_m),
           .exu_tlu_va_oor_jl_ret_m     (exu_tlu_va_oor_jl_ret_m),
           .exu_tlu_va_oor_m            (exu_tlu_va_oor_m),
           .ffu_tlu_ill_inst_m          (ffu_tlu_ill_inst_m),
           .ffu_ifu_tid_w2              (ffu_ifu_tid_w2[1:0]),
           .ffu_tlu_trap_ieee754        (ffu_tlu_trap_ieee754),
           .ffu_tlu_trap_other          (ffu_tlu_trap_other),
           .ffu_tlu_trap_ue             (ffu_tlu_trap_ue),
           .ifu_lsu_ld_inst_e           (ifu_lsu_ld_inst_e),
           .ifu_lsu_memref_d            (ifu_lsu_memref_d),
           .ifu_lsu_st_inst_e           (ifu_lsu_st_inst_e),
           .ifu_tlu_done_inst_d         (ifu_tlu_done_inst_d),
           .ifu_tlu_flush_m             (ifu_tlu_flush_m),
           .ifu_tlu_flush_fd_w          (ifu_tlu_flush_fd_w),
           .ifu_tlu_flush_fd2_w         (ifu_tlu_flush_fd2_w),
           .ifu_tlu_flush_fd3_w         (ifu_tlu_flush_fd3_w),
           .lsu_tlu_early_flush_w       (lsu_tlu_early_flush_w),
           .lsu_tlu_early_flush2_w      (lsu_tlu_early_flush2_w),
           .ifu_tlu_hwint_m             (ifu_tlu_hwint_m),
           .ifu_tlu_immu_miss_m         (ifu_tlu_immu_miss_m),
           .ifu_tlu_pc_oor_e            (ifu_tlu_pc_oor_e),
           .ifu_tlu_l2imiss             (ifu_tlu_l2imiss[`TLU_THRD_NUM-1:0]),
           .ifu_tlu_inst_vld_m          (ifu_tlu_inst_vld_m),
           // .ifu_tlu_inst_vld_m_bf1      (ifu_tlu_inst_vld_m_bf1),
           .ifu_tlu_itlb_done           (ifu_tlu_itlb_done),
           .ifu_tlu_npc_m               (ifu_tlu_npc_m[48:0]),
           .ifu_tlu_pc_m                (ifu_tlu_pc_m[48:0]),
           .ifu_tlu_priv_violtn_m       (ifu_tlu_priv_violtn_m),
           .ifu_tlu_retry_inst_d        (ifu_tlu_retry_inst_d),
           .ifu_tlu_rstint_m            (ifu_tlu_rstint_m),
           .ifu_tlu_sir_inst_m          (ifu_tlu_sir_inst_m),
           .ifu_lsu_thrid_s             (ifu_lsu_thrid_s[1:0]),
           .ifu_tlu_ttype_m             (ifu_tlu_ttype_m[8:0]),
           .ifu_tlu_ttype_vld_m         (ifu_tlu_ttype_vld_m),
           .ifu_mmu_trap_m              (ifu_mmu_trap_m),
           .ifu_tlu_trap_m              (ifu_tlu_trap_m),
           .lsu_asi_reg0                (lsu_asi_reg0[7:0]),
           .lsu_asi_reg1                (lsu_asi_reg1[7:0]),
           .lsu_asi_reg2                (lsu_asi_reg2[7:0]),
           .lsu_asi_reg3                (lsu_asi_reg3[7:0]),
           .lsu_asi_state               (lsu_asi_state[`TLU_ASI_STATE_WIDTH-1:0]),
           .lsu_tlu_defr_trp_taken_g    (lsu_tlu_defr_trp_taken_g),
           .lsu_mmu_defr_trp_taken_g    (lsu_mmu_defr_trp_taken_g),
           .lsu_tlu_cpx_req             (lsu_tlu_cpx_req[3:0]),
           .lsu_tlu_cpx_vld             (lsu_tlu_cpx_vld),
           .lsu_tlu_daccess_excptn_g    (lsu_tlu_daccess_excptn_g),
           .lsu_tlu_daccess_prot_g      (lsu_tlu_daccess_prot_g),
           .lsu_tlu_dmmu_miss_g         (lsu_tlu_dmmu_miss_g),
           .lsu_tlu_dside_ctxt_m        (lsu_tlu_dside_ctxt_m[12:0]),
           .lsu_tlu_dtlb_done           (lsu_tlu_dtlb_done),
           .lsu_tlu_intpkt_17_16        (lsu_tlu_intpkt[17:16]),
           .lsu_tlu_intpkt_12_8         (lsu_tlu_intpkt[12:8]),
           .lsu_tlu_intpkt_5_0          (lsu_tlu_intpkt[5:0]),
           .lsu_tlu_misalign_addr_ldst_atm_m(lsu_tlu_misalign_addr_ldst_atm_m),
           .lsu_tlu_pctxt_m             (lsu_tlu_pctxt_m[12:0]),
           .lsu_tlu_pcxpkt_ack          (lsu_tlu_pcxpkt_ack),
           .lsu_tlu_priv_action_g       (lsu_tlu_priv_action_g),
           .lsu_tlu_rs3_data_g          (lsu_tlu_rs3_data_g[63:0]),
           .lsu_tlu_tlb_access_tid_m    (lsu_tlu_tlb_access_tid_m[1:0]),
           .lsu_tlu_tlb_asi_state_m     (lsu_tlu_tlb_asi_state_m[7:0]),
           .lsu_tlu_tlb_dmp_va_m        (lsu_tlu_tlb_dmp_va_m[47:13]),
           .lsu_tlu_tlb_ld_inst_m       (lsu_tlu_tlb_ld_inst_m),
           .lsu_tlu_tlb_ldst_va_m       (lsu_tlu_tlb_ldst_va_m[`L1D_ADDRESS_HI:0]),
           .lsu_tlu_tlb_st_inst_m       (lsu_tlu_tlb_st_inst_m),
           .lsu_tlu_ttype_m2            (lsu_tlu_ttype_m2[8:0]),
           .lsu_tlu_ttype_vld_m2        (lsu_tlu_ttype_vld_m2),
           .lsu_tlu_wtchpt_trp_g        (lsu_tlu_wtchpt_trp_g),
           .ifu_tlu_sraddr_d            (ifu_tlu_sraddr_d[`TLU_ASR_ADDR_WIDTH-1:0]),
           .ifu_tlu_sraddr_d_v2         (ifu_tlu_sraddr_d_v2[`TLU_ASR_ADDR_WIDTH-1:0]),
           .ifu_tlu_rsr_inst_d          (ifu_tlu_rsr_inst_d),
           .lsu_tlu_wsr_inst_e          (lsu_tlu_wsr_inst_e),
           .exu_tlu_wsr_data_m          (exu_tlu_wsr_data_m[63:0]),
           .lsu_tlu_rsr_data_e          (lsu_tlu_rsr_data_e[7:0]),
           .ifu_lsu_alt_space_e         (ifu_lsu_alt_space_e),
           .ifu_tlu_alt_space_d         (ifu_tlu_alt_space_d),
           .lsu_tlu_squash_va_oor_m     (lsu_tlu_squash_va_oor_m),
           .lsu_tlu_dcache_miss_w2      (lsu_tlu_dcache_miss_w2[3:0]),
           .lsu_tlu_l2_dmiss            (lsu_tlu_l2_dmiss[3:0]),
           .lsu_tlu_stb_full_w2         (lsu_tlu_stb_full_w2[3:0]),
           .ffu_tlu_fpu_tid             (ffu_tlu_fpu_tid[1:0]),
           .ffu_tlu_fpu_cmplt           (ffu_tlu_fpu_cmplt),
           .lsu_pid_state0              (lsu_pid_state0[2:0]),
           .lsu_pid_state1              (lsu_pid_state1[2:0]),
           .lsu_pid_state2              (lsu_pid_state2[2:0]),
           .lsu_pid_state3              (lsu_pid_state3[2:0]),
           .lsu_tlu_nucleus_ctxt_m      (lsu_tlu_nucleus_ctxt_m),
           .lsu_tlu_tte_pg_sz_g         (lsu_tlu_tte_pg_sz_g[2:0]),
           .ifu_lsu_error_inj           (ifu_lsu_error_inj[3:0]),
           .ifu_lsu_imm_asi_vld_d       (ifu_lsu_imm_asi_vld_d),
           .lsu_dsfsr_din_g             (lsu_dsfsr_din_g[23:0]),
           .lsu_dmmu_sfsr_trp_wr        (lsu_dmmu_sfsr_trp_wr[3:0]),
           .lsu_mmu_flush_pipe_w        (lsu_mmu_flush_pipe_w),
           .exu_lsu_priority_trap_m     (exu_lsu_priority_trap_m),

           // trin: setting reset vector from jtag
    // .core_rtap_data          (core_rtap_data),
    .rtap_core_val         (rtap_core_val),
    .rtap_core_threadid         (rtap_core_threadid),
    .rtap_core_id         (rtap_core_id),
    .rtap_core_data_33_0         (rtap_core_data[33:0])

           );
 

      sparc_mul_top_nospu_wrap mul(
                                //
                                .grst_l             (spc_grst_l),
                                .arst_l                     (cmp_arst_l),
                                /*AUTOINST*/
                                // Outputs
                                .mul_exu_ack       (mul_exu_ack),
                                .mul_data_out      (mul_data_out[63:0]),
                                // Inputs
                                .rclk              (rclk),
                                .exu_mul_input_vld (exu_mul_input_vld),
                                .exu_mul_rs1_data  (exu_mul_rs1_data[63:0]),
                                .exu_mul_rs2_data  (exu_mul_rs2_data[63:0]));


   sparc_ffu_nospu_wrap ffu(
                 // reset stuff
                 .grst_l                (spc_grst_l),
                 .arst_l                (cmp_arst_l),
                 
       // eco 6529 .
       .lsu_ffu_st_dtlb_perr_g      (lsu_ffu_st_dtlb_perr_g),

                 .exu_ffu_ist_e         (ifu_lsu_st_inst_e),
                 .ifu_ffu_tid_d         (ifu_tlu_thrid_d[1:0]),
                 .cpx_fpu_data          (cpx_spc_data_cx2_buf[63:0]),
                 .cpx_vld             (cpx_spc_data_cx2_buf[`CPX_VLD]),
                 .cpx_fcmp            (cpx_spc_data_cx2_buf[69]),
                 .cpx_req             (cpx_spc_data_cx2_buf[`CPX_RQ_HI:`CPX_RQ_LO]),
                 .cpx_fccval          (cpx_spc_data_cx2_buf[68:67]),
                 .cpx_fpexc           (cpx_spc_data_cx2_buf[76:72]),                   
                 .exu_ffu_gsr_mask_m  (exu_tlu_wsr_data_m[63:32]),
                 .exu_ffu_gsr_scale_m (exu_tlu_wsr_data_m[7:3]),
                 .exu_ffu_gsr_align_m (exu_tlu_wsr_data_m[2:0]),
                 .exu_ffu_gsr_rnd_m   (exu_tlu_wsr_data_m[27:25]),
                 .ifu_ffu_ldst_single_d   (ifu_ffu_ldst_size_d),
                     /*AUTOINST*/
                 // Outputs
                 .ffu_lsu_data          (ffu_lsu_data[80:0]),
                 .ffu_ifu_cc_vld_w2     (ffu_ifu_cc_vld_w2[3:0]),
                 .ffu_ifu_cc_w2         (ffu_ifu_cc_w2[7:0]),
                 .ffu_ifu_ecc_ce_w2     (ffu_ifu_ecc_ce_w2),
                 .ffu_ifu_ecc_ue_w2     (ffu_ifu_ecc_ue_w2),
                 .ffu_ifu_err_reg_w2    (ffu_ifu_err_reg_w2[5:0]),
                 .ffu_ifu_err_synd_w2   (ffu_ifu_err_synd_w2[13:0]),
                 .ffu_ifu_fpop_done_w2  (ffu_ifu_fpop_done_w2),
                 .ffu_ifu_fst_ce_w      (ffu_ifu_fst_ce_w),
                 .ffu_ifu_inj_ack       (ffu_ifu_inj_ack),
                 .ffu_ifu_stallreq      (ffu_ifu_stallreq),
                 .ffu_ifu_tid_w2        (ffu_ifu_tid_w2[1:0]),
                 .ffu_lsu_blk_st_e      (ffu_lsu_blk_st_e),
                 .ffu_lsu_blk_st_va_e   (ffu_lsu_blk_st_va_e[5:3]),
                 .ffu_lsu_fpop_rq_vld   (ffu_lsu_fpop_rq_vld),
                 .ffu_lsu_kill_fst_w    (ffu_lsu_kill_fst_w),
                 .ffu_tlu_fpu_cmplt     (ffu_tlu_fpu_cmplt),
                 .ffu_tlu_fpu_tid       (ffu_tlu_fpu_tid[1:0]),
                 .ffu_tlu_ill_inst_m    (ffu_tlu_ill_inst_m),
                 .ffu_tlu_trap_ieee754  (ffu_tlu_trap_ieee754),
                 .ffu_tlu_trap_other    (ffu_tlu_trap_other),
                 .ffu_tlu_trap_ue       (ffu_tlu_trap_ue),
                 .ffu_exu_rsr_data_m    (ffu_exu_rsr_data_m[63:0]),
                 // Inputs
                 .exu_ffu_wsr_inst_e    (exu_ffu_wsr_inst_e),
                 .ifu_exu_disable_ce_e  (ifu_exu_disable_ce_e),
                 .ifu_exu_ecc_mask      (ifu_exu_ecc_mask[6:0]),
                 .ifu_exu_nceen_e       (ifu_exu_nceen_e),
                 .ifu_ffu_fcc_num_d     (ifu_ffu_fcc_num_d[1:0]),
                 .ifu_ffu_fld_d         (ifu_ffu_fld_d),
                 .ifu_ffu_fpop1_d       (ifu_ffu_fpop1_d),
                 .ifu_ffu_fpop2_d       (ifu_ffu_fpop2_d),
                 .ifu_ffu_fpopcode_d    (ifu_ffu_fpopcode_d[8:0]),
                 .ifu_ffu_frd_d         (ifu_ffu_frd_d[4:0]),
                 .ifu_ffu_frs1_d        (ifu_ffu_frs1_d[4:0]),
                 .ifu_ffu_frs2_d        (ifu_ffu_frs2_d[4:0]),
                 .ifu_ffu_fst_d         (ifu_ffu_fst_d),
                 .ifu_ffu_inj_frferr    (ifu_ffu_inj_frferr),
                 .ifu_ffu_ldfsr_d       (ifu_ffu_ldfsr_d),
                 .ifu_ffu_ldxfsr_d      (ifu_ffu_ldxfsr_d),
                 .ifu_ffu_mvcnd_m       (ifu_ffu_mvcnd_m),
                 .ifu_ffu_quad_op_e     (ifu_ffu_quad_op_e),
                 .ifu_ffu_stfsr_d       (ifu_ffu_stfsr_d),
                 .ifu_ffu_visop_d       (ifu_ffu_visop_d),
                 .ifu_lsu_ld_inst_e     (ifu_lsu_ld_inst_e),
                 .ifu_tlu_flsh_inst_e   (ifu_tlu_flsh_inst_e),
                 .ifu_tlu_flush_w       (ifu_tlu_flush_w),
                 .ifu_tlu_inst_vld_w    (ifu_tlu_inst_vld_w),
                 .ifu_tlu_sraddr_d      (ifu_tlu_sraddr_d[6:0]),
                 .lsu_ffu_ack           (lsu_ffu_ack),
                 .lsu_ffu_bld_cnt_w     (lsu_ffu_bld_cnt_w[2:0]),
                 .lsu_ffu_blk_asi_e     (lsu_ffu_blk_asi_e),
                 .lsu_ffu_flush_pipe_w  (lsu_ffu_flush_pipe_w),
                 .lsu_ffu_ld_data       (lsu_ffu_ld_data[63:0]),
                 .lsu_ffu_ld_vld        (lsu_ffu_ld_vld),
                 .lsu_ffu_stb_full0     (lsu_ffu_stb_full0),
                 .lsu_ffu_stb_full1     (lsu_ffu_stb_full1),
                 .lsu_ffu_stb_full2     (lsu_ffu_stb_full2),
                 .lsu_ffu_stb_full3     (lsu_ffu_stb_full3),
                 .rclk                  (rclk),

                 .srams_rtap_data (sram_ffu_rtap_data),
                 .rtap_srams_bist_command (rtap_srams_bist_command),
                 .rtap_srams_bist_data (rtap_srams_bist_data)
                 );

// trin
// removing test_stub_bist
// the following unused outputs might cause problems for timing
// (include the LSU & IFU at least)
assign bist_ctl_reg_out = {`L1D_ADDRESS_HI+1{1'b0}};
assign testmode_l = 1'b0;
assign sehold = 1'b0;
assign se = 1'b0;


//       test_stub_bist test_stub(
//                             // unused
//                             .so_2             (),
//                             .long_chain_so_2  (1'b0),
//                             .short_chain_so_2 (1'b0),

//                             // connect with scan stitch
//                             .si(scan1_4),
//                             .so (scan1_5),
//                             .long_chain_so_0  (scan0_7),
//                             .short_chain_so_0 (short_scan0_6),
//                             .long_chain_so_1  (scan1_5),
//                             .short_chain_so_1 (short_scan1_4),
                            
//                             // from LSU
//                             .bist_ctl_reg_in(bist_ctl_reg_in[6:0]),
                            
//                             /*AUTOINST*/
//                             // Outputs
//                             .mux_drive_disable(mux_drive_disable),
//                             .mem_write_disable(mem_write_disable),
//                             .sehold     (sehold),
//                             .se         (se),
//                             .testmode_l (testmode_l),
//                             .mem_bypass (),
//                             .so_0       (spc_scanout0),          // Templated
//                             .so_1       (spc_scanout1),          // Templated
//                             // Inputs
//                             .ctu_tst_pre_grst_l(ctu_tst_pre_grst_l),
//                             .arst_l     (cmp_arst_l),            // Templated
//                             .cluster_grst_l(spc_grst_l),         // Templated
//                             .global_shift_enable(global_shift_enable),
//                             .ctu_tst_scan_disable(ctu_tst_scan_disable),
//                             .ctu_tst_scanmode(ctu_tst_scanmode),
//                             .ctu_tst_macrotest(ctu_tst_macrotest),
//                             .ctu_tst_short_chain(ctu_tst_short_chain),
//                             .rclk       (rclk),
//                             .bist_ctl_reg_wr_en(bist_ctl_reg_wr_en),


   cfg_asi cfg_asi (
      // Inputs
      .clk                          (gclk),
      .rst_n                        (cmp_arst_l),
      .ifu_lsu_alt_space_e          (ifu_lsu_alt_space_e),
      .ifu_lsu_ld_inst_e            (ifu_lsu_ld_inst_e),
      .ifu_lsu_st_inst_e            (ifu_lsu_st_inst_e),
      .ifu_tlu_thrid_e              (ifu_tlu_thrid_e),
      .lsu_spu_asi_state_e          (lsu_spu_asi_state_e),
      .exu_lsu_ldst_va_e            (exu_lsu_ldst_va_e),
      .lsu_tlu_rs3_data_g           (lsu_tlu_rs3_data_g),
      // Outputs
      .cfg_asi_lsu_ldxa_vld_w2      (cfg_asi_lsu_ldxa_vld_w2),
      .cfg_asi_lsu_ldxa_tid_w2      (cfg_asi_lsu_ldxa_tid_w2),
      .cfg_asi_lsu_ldxa_data_w2     (cfg_asi_lsu_ldxa_data_w2),
      .cfg_dtu_esl_en               (cfg_dtu_esl_en),
      .cfg_dtu_esl_sync_method      (cfg_dtu_esl_sync_method),
      .cfg_esl_lfsr_seed            (cfg_esl_lfsr_seed),
      .cfg_esl_lfsr_ld              (cfg_esl_lfsr_ld),
      .cfg_esl_pc_diff_thresh       (cfg_esl_pc_diff_thresh),
      .cfg_esl_counter_timeout      (cfg_esl_counter_timeout),
      .cfg_ifu_csm_itlb_state       (cfg_ifu_csm_itlb_state),
      .cfg_ifu_csm_itlb_chipid      (cfg_ifu_csm_itlb_chipid),
      .cfg_ifu_csm_itlb_x           (cfg_ifu_csm_itlb_x),
      .cfg_ifu_csm_itlb_y           (cfg_ifu_csm_itlb_y),
      .cfg_ifu_csm_itlb_hdid        (cfg_ifu_csm_itlb_hdid),
      .cfg_ifu_csm_itlb_hd_size     (cfg_ifu_csm_itlb_hd_size),
      .cfg_ifu_csm_itlb_sdid        (cfg_ifu_csm_itlb_sdid),
      .cfg_ifu_csm_itlb_lsid        (cfg_ifu_csm_itlb_lsid),
      .cfg_lsu_csm_dtlb_state       (cfg_lsu_csm_dtlb_state),
      .cfg_lsu_csm_dtlb_chipid      (cfg_lsu_csm_dtlb_chipid),
      .cfg_lsu_csm_dtlb_x           (cfg_lsu_csm_dtlb_x),
      .cfg_lsu_csm_dtlb_y           (cfg_lsu_csm_dtlb_y),
      .cfg_lsu_csm_dtlb_hdid        (cfg_lsu_csm_dtlb_hdid),
      .cfg_lsu_csm_dtlb_hd_size     (cfg_lsu_csm_dtlb_hd_size),
      .cfg_lsu_csm_dtlb_sdid        (cfg_lsu_csm_dtlb_sdid),
      .cfg_lsu_csm_dtlb_lsid        (cfg_lsu_csm_dtlb_lsid)
      );


/*  bw_clk_cl_sparc_cmp AUTO_TEMPLATE(
                               .si      (scan0_6),
                               .so      (scan0_7),                               
                           .arst_l       (cmp_arst_l),
                           .grst_l       (cmp_grst_l),
                           // Outputs
                           .dbginit_l    (spc_dbginit_l),
                           .cluster_grst_l   (spc_grst_l));
 */
   // trin: simplifying the reset and clock
   reg reset_l_f;
   reg reset_l_ff;
   reg reset_l_fff;
   always @ (posedge gclk)
   begin
      reset_l_f <= cmp_arst_l;
      reset_l_ff <= reset_l_f;
      reset_l_fff <= reset_l_ff;
      spc_dbginit_l <= reset_l_fff;
      spc_grst_l <= reset_l_fff;
   end

   assign rclk = gclk;
   assign cluster_cken = 1'b1;


   // bw_clk_cl_sparc_cmp spc_hdr(/*AUTOINST*/
   //                             // Outputs
   //                             // .cluster_grst_l(spc_grst_l),      // Templated
   //                             // .dbginit_l(spc_dbginit_l),        // Templated
   //                             .rclk    (rclk),
   //                             .so      (scan0_7),               // Templated
   //                             // Inputs
   //                             .adbginit_l(adbginit_l),
   //                             .arst_l  (cmp_arst_l),            // Templated
   //                             .cluster_cken(cluster_cken),
   //                             .gclk    (gclk),
   //                             .gdbginit_l(gdbginit_l),
   //                             .grst_l  (cmp_grst_l),            // Templated
   //                             .se      (se),
   //                             .si      (scan0_6));               // Templated
endmodule // sparc


// Local Variables:
// verilog-library-directories:("../tlu/rtl" "../ifu/rtl" "../exu/rtl" "../lsu/rtl" "../spu/rtl" "../mul/rtl" "../ffu/rtl/" "../../common/rtl" ".")
// End:

     
