// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_ecl_wb.v
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
//  Module Name: sparc_exu_ecl_wb
//	Description:  Implements the writeback logic for the exu.
//		This includes the control signals for the w1 and w2 input 
//   	muxes as well as keeping track of the wen signal for ALU ops.
*/

module sparc_exu_ecl_wb (/*AUTOARG*/
   // Outputs
   wb_ccr_wrccr_w, ecl_rml_cwp_wen_e, ecl_rml_cansave_wen_w, 
   ecl_rml_canrestore_wen_w, ecl_rml_otherwin_wen_w, 
   ecl_rml_wstate_wen_w, ecl_rml_cleanwin_wen_w, ecl_byp_sel_load_m, 
   ecl_byp_sel_restore_m, ecl_byp_sel_pipe_m, ecl_byp_restore_m, 
   ecl_irf_tid_m, ecl_irf_rd_m, ecl_irf_rd_g, ecl_irf_wen_w2, 
   ecl_irf_tid_g, wb_e, bypass_m, ecl_irf_wen_w, ecl_byp_sel_load_g, 
   ecl_byp_sel_muldiv_g, ecl_byp_sel_restore_g, wb_divcntl_ack_g, 
   wb_ccr_setcc_g, ecl_byp_eclpr_e, exu_ifu_longop_done_g, 
   ecl_div_yreg_wen_w, ecl_div_yreg_wen_g, ecl_div_yreg_shift_g, 
   ecl_div_yreg_wen_l, wb_eccctl_spec_wen_next, bypass_w, 
   wb_byplog_rd_w2, wb_byplog_tid_w2, wb_byplog_wen_w2, 
   wb_byplog_rd_g2, wb_byplog_wen_g2, read_yreg_e, 
   exu_ffu_wsr_inst_e, 
   // Inputs
   clk, se, reset, sehold, ld_rd_g, ld_tid_g, lsu_exu_dfill_vld_g, 
   lsu_exu_ldst_miss_g2, rd_m, tid_m, thr_m, tid_w1, ifu_exu_wen_d, 
   ifu_exu_kill_e, ecl_exu_kill_m, rml_ecl_kill_m, ifu_tlu_flush_w, 
   flush_w1, divcntl_wb_req_g, mdqctl_wb_divrd_g, mdqctl_wb_divthr_g, 
   mdqctl_wb_mulrd_g, mdqctl_wb_multhr_g, mdqctl_wb_divsetcc_g, 
   mdqctl_wb_mulsetcc_g, ecl_div_sel_div, ifu_tlu_wsr_inst_d, 
   ifu_tlu_sraddr_d, rml_ecl_cwp_d, rml_ecl_cansave_d, 
   rml_ecl_canrestore_d, rml_ecl_otherwin_d, rml_ecl_wstate_d, 
   rml_ecl_cleanwin_d, exu_ifu_cc_d, rml_ecl_swap_done, 
   rml_ecl_rmlop_done_e, mdqctl_wb_yreg_wen_g, 
   mdqctl_wb_yreg_shift_g, ecl_byp_sel_ecc_m, eccctl_wb_rd_m, 
   ifu_exu_inst_vld_e, ifu_exu_inst_vld_w, ifu_exu_return_d, 
   restore_e, rml_ecl_fill_e, early_flush_w, ecl_byp_ldxa_g
   ) ;
   input clk;
   input se;
   input reset;
   input sehold;
   input [4:0] ld_rd_g;
   input [1:0] ld_tid_g;
   input       lsu_exu_dfill_vld_g;
   input        lsu_exu_ldst_miss_g2;
   input [4:0]  rd_m;
   input [1:0]  tid_m;
   input [3:0]  thr_m;
   input [1:0]  tid_w1;
   input        ifu_exu_wen_d;
   input        ifu_exu_kill_e;
   input        ecl_exu_kill_m;
   input        rml_ecl_kill_m; // kill from spill or fill trap
   input        ifu_tlu_flush_w;
   input        flush_w1;
   input        divcntl_wb_req_g;
   input [4:0]  mdqctl_wb_divrd_g;
   input [1:0]  mdqctl_wb_divthr_g;
   input [4:0]  mdqctl_wb_mulrd_g;
   input [1:0]  mdqctl_wb_multhr_g;
   input        mdqctl_wb_divsetcc_g;
   input        mdqctl_wb_mulsetcc_g;
   input        ecl_div_sel_div;
   input        ifu_tlu_wsr_inst_d;
   input [6:0] ifu_tlu_sraddr_d;
   input [2:0] rml_ecl_cwp_d;
   input [2:0] rml_ecl_cansave_d;
   input [2:0] rml_ecl_canrestore_d;
   input [2:0] rml_ecl_otherwin_d;
   input [5:0] rml_ecl_wstate_d;
   input [2:0] rml_ecl_cleanwin_d;
   input [7:0] exu_ifu_cc_d;
   input [3:0] rml_ecl_swap_done;
   input       rml_ecl_rmlop_done_e;
   input         mdqctl_wb_yreg_wen_g;
   input         mdqctl_wb_yreg_shift_g;
   input         ecl_byp_sel_ecc_m;
   input  [4:0] eccctl_wb_rd_m;
   input        ifu_exu_inst_vld_e;
   input        ifu_exu_inst_vld_w;
   input        ifu_exu_return_d;
   input  restore_e;
   input  rml_ecl_fill_e;
   input  early_flush_w;
   input        ecl_byp_ldxa_g;
   
   output      wb_ccr_wrccr_w;
   output      ecl_rml_cwp_wen_e;
   output      ecl_rml_cansave_wen_w;
   output      ecl_rml_canrestore_wen_w;
   output      ecl_rml_otherwin_wen_w;
   output      ecl_rml_wstate_wen_w;
   output      ecl_rml_cleanwin_wen_w;
   output      ecl_byp_sel_load_m;
   output      ecl_byp_sel_restore_m;
   output      ecl_byp_sel_pipe_m;
   output      ecl_byp_restore_m;
   output [1:0] ecl_irf_tid_m;
   output [4:0] ecl_irf_rd_m;
   output [4:0] ecl_irf_rd_g;
   output       ecl_irf_wen_w2;
   output [1:0] ecl_irf_tid_g;
   output       wb_e;
   output       bypass_m;
   output       ecl_irf_wen_w;
   output       ecl_byp_sel_load_g;
   output       ecl_byp_sel_muldiv_g;
   output       ecl_byp_sel_restore_g;
   output       wb_divcntl_ack_g;
   output       wb_ccr_setcc_g;
   output [7:0] ecl_byp_eclpr_e;
   output [3:0]  exu_ifu_longop_done_g;
   output [3:0]  ecl_div_yreg_wen_w;
   output [3:0]  ecl_div_yreg_wen_g;
   output [3:0]  ecl_div_yreg_shift_g;
   output [3:0]  ecl_div_yreg_wen_l;// w or w2 or shift
   output        wb_eccctl_spec_wen_next;
   output        bypass_w;
   output [4:0] wb_byplog_rd_w2;
   output [1:0] wb_byplog_tid_w2;
   output       wb_byplog_wen_w2;
   output [4:0] wb_byplog_rd_g2;
   output       wb_byplog_wen_g2;
   output       read_yreg_e;
   output       exu_ffu_wsr_inst_e;

   wire          wb_e;
   wire          wb_m;
   wire          wb_w;
   wire          inst_vld_noflush_wen_m;
   wire          inst_vld_noflush_wen_w;
   wire       ecl_irf_wen_g;
   wire      yreg_wen_w;
   wire      yreg_wen_w1;
   wire      yreg_wen_w1_vld;
   wire      wen_no_inst_vld_m;         // load or restore or ce wen
   wire        wen_no_inst_vld_w;
   wire        wen_w_inst_vld;
   wire        valid_e;
   wire        valid_m;
   wire    valid_w;
   wire    ecl_sel_mul_g;
   wire    ecl_sel_div_g;
   wire [1:0] muldiv_tid;
   wire        setcc_g;        // without wen from divcntl
   wire    wrsr_e;
   wire    wrsr_m;
   wire    wrsr_w;
   wire    [6:0] sraddr_e;
   wire    [6:0] sraddr_m;
   wire    [6:0] sraddr_w;
   wire    sraddr_ccr_w;
   wire    sraddr_y_w;
   wire    sraddr_cwp_e;
   wire    sraddr_cansave_w;
   wire    sraddr_canrestore_w;
   wire    sraddr_cleanwin_w;
   wire    sraddr_otherwin_w;
   wire    sraddr_wstate_w;
   wire    sel_cleanwin_d;
   wire    sel_otherwin_d;
   wire    sel_wstate_d;
   wire    sel_canrestore_d;
   wire    sel_ccr_d;
   wire    sel_cansave_d;
   wire    sel_cwp_d;
   wire    sel_rdpr_mux1_d;
   wire [2:0] rdpr_mux1_out;
   wire [7:0] rdpr_mux2_out;
   wire [3:0] muldiv_done_g;
   wire [3:0]    multhr_dec_g;
   wire [3:0]    divthr_dec_g;
   wire [3:0]    thrdec_w1;
   wire   short_longop_done_e;
   wire   short_longop_done_m;
   wire [3:0] short_longop_done;
   wire       return_e;
   wire   restore_m;
   wire   restore_w;
   wire   vld_restore_e;
   wire   vld_restore_w;
   wire   restore_request;
   wire   restore_wen;
   wire   restore_ready;
   wire   restore_ready_next;
   wire   restore_picked;
   wire [3:0]  restore_done;
   wire [1:0] restore_tid;
   wire [4:0] restore_rd;
   wire [3:0] restore_thr;
   wire [3:0] ecl_longop_done_kill_m;
   wire [3:0] ecl_longop_done_nokill_m;
   wire       dfill_vld_g2;
   wire       ld_g;
   wire       ld_g2;
   wire [1:0] dfill_tid_g2;
   wire [4:0] dfill_rd_g2;
   wire       kill_ld_g2;
   wire [1:0] tid_w2;
   wire [4:0] rd_w2;
   
   ////////////////////////////////////////////
   // Pass along result of load for one cycle
   ////////////////////////////////////////////
   assign     ld_g = lsu_exu_dfill_vld_g | ecl_byp_ldxa_g;
   dff_s dfill_vld_dff (.din(ld_g), .clk(clk), .q(ld_g2),
                      .se(se), .si(), .so());
   assign     kill_ld_g2 = flush_w1 & (dfill_tid_g2[1:0] == tid_w1[1:0]);
   assign     dfill_vld_g2 = ld_g2 & ~kill_ld_g2 & ~lsu_exu_ldst_miss_g2;
   dff_s #(2) dfill_tid_dff(.din(ld_tid_g[1:0]), .clk(clk), .q(dfill_tid_g2[1:0]),
                          .se(se), .si(), .so());
   dff_s #(5) dfill_rd_dff(.din(ld_rd_g[4:0]), .clk(clk), .q(dfill_rd_g2[4:0]),
                         .se(se), .si(), .so());

   ///////////////////////////////////////////
   // Help with bypassing of long latency ops
   ///////////////////////////////////////////
   assign       wb_byplog_rd_w2[4:0] = rd_w2[4:0];
   assign       wb_byplog_wen_w2 = ecl_irf_wen_w2;
   assign       wb_byplog_tid_w2[1:0] = tid_w2[1:0];
   assign       wb_byplog_rd_g2[4:0] = dfill_rd_g2[4:0];
   assign       wb_byplog_wen_g2 = ld_g2;
   
   
   ////////////////////////////////////////////////////////////////
   // G selection logic (picks between LOAD and MUL/DIV outputs)
   ////////////////////////////////////////////////////////////////
   // select signals: priority LOAD, RESTORE, MUL, DIV
   assign      ecl_byp_sel_load_g = (ld_g2 & (wb_m | wrsr_m | ecl_byp_sel_ecc_m));
   assign      ecl_byp_sel_restore_g = restore_request & ((wb_m | wrsr_m | ecl_byp_sel_ecc_m) ^ ld_g2);
   assign      ecl_byp_sel_muldiv_g = ~(ecl_byp_sel_load_g | ecl_byp_sel_restore_g);
   assign      ecl_sel_mul_g = ~ecl_div_sel_div & ecl_byp_sel_muldiv_g;
   assign      ecl_sel_div_g = ecl_div_sel_div & ecl_byp_sel_muldiv_g;
   assign      wb_divcntl_ack_g = ecl_byp_sel_muldiv_g;

   assign      muldiv_tid[1:0] = (ecl_div_sel_div)? mdqctl_wb_divthr_g[1:0]: mdqctl_wb_multhr_g[1:0];
   assign muldiv_done_g[3] = ((wb_divcntl_ack_g & divcntl_wb_req_g) & 
                              muldiv_tid[1] & muldiv_tid[0]); 
   assign muldiv_done_g[2] = ((wb_divcntl_ack_g & divcntl_wb_req_g) &
                              muldiv_tid[1] & ~muldiv_tid[0]); 
   assign muldiv_done_g[1] = ((wb_divcntl_ack_g & divcntl_wb_req_g) &
                              ~muldiv_tid[1] & muldiv_tid[0]); 
   assign muldiv_done_g[0] = ((wb_divcntl_ack_g & divcntl_wb_req_g) &
                              ~muldiv_tid[1] & ~muldiv_tid[0]); 

   assign ecl_irf_wen_g = (sehold)? ecl_irf_wen_w2: 
                                   (ecl_byp_sel_load_g & dfill_vld_g2 |
                                    (ecl_byp_sel_restore_g & restore_wen) |
                                    (ecl_byp_sel_muldiv_g & divcntl_wb_req_g));

   dff_s wen_w2_dff(.din(ecl_irf_wen_g), .clk(clk), .q(ecl_irf_wen_w2),
                  .se(se), .si(), .so());
   mux4ds #(5) rd_g_mux(.dout(ecl_irf_rd_g[4:0]), .in0(dfill_rd_g2[4:0]),
                       .in1(mdqctl_wb_divrd_g[4:0]),
                       .in2(mdqctl_wb_mulrd_g[4:0]),
                        .in3(restore_rd[4:0]),
                       .sel0(ecl_byp_sel_load_g),
                       .sel1(ecl_sel_div_g),
                        .sel2(ecl_sel_mul_g),
                        .sel3(ecl_byp_sel_restore_g));
   mux4ds #(2) thr_g_mux(.dout(ecl_irf_tid_g[1:0]), .in0(dfill_tid_g2[1:0]),
                        .in1(mdqctl_wb_divthr_g[1:0]),
                        .in2(mdqctl_wb_multhr_g[1:0]),
                         .in3(restore_tid[1:0]),
                        .sel0(ecl_byp_sel_load_g),
                        .sel1(ecl_sel_div_g),
                         .sel2(ecl_sel_mul_g),
                         .sel3(ecl_byp_sel_restore_g));
   mux2ds setcc_g_mux(.dout(setcc_g),
                         .in0(mdqctl_wb_mulsetcc_g),
                         .in1(mdqctl_wb_divsetcc_g),
                         .sel0(~ecl_div_sel_div),
                         .sel1(ecl_div_sel_div));
   dff_s #(2) dff_thr_g2w2(.din(ecl_irf_tid_g[1:0]), .clk(clk), .q(tid_w2[1:0]), .se(se),
                      .si(), .so());
   dff_s #(5) dff_rd_g2w2(.din(ecl_irf_rd_g[4:0]), .clk(clk), .q(rd_w2[4:0]), .se(se),
                     .si(), .so());
   // needs wen to setcc
   assign wb_ccr_setcc_g = wb_divcntl_ack_g & divcntl_wb_req_g & setcc_g;
   

   ///////////////////
   // W1 port control
   ///////////////////
   // sehold will turn off in pipe writes and put the hold functionality through
   // the non inst_vld part
   // Mux between load and ALU for rd, thr, and wen
   assign      ecl_byp_sel_load_m = ~(wb_m | wrsr_m | ecl_byp_sel_ecc_m) & ld_g2;
   assign      ecl_byp_sel_pipe_m = (wb_m | wrsr_m) & ~ecl_byp_sel_ecc_m; 
   assign      ecl_byp_sel_restore_m = ~(wb_m | wrsr_m | ld_g2 | ecl_byp_sel_ecc_m);
   assign      wen_no_inst_vld_m = (sehold)? ecl_irf_wen_w: 
                                             ((dfill_vld_g2 & ecl_byp_sel_load_m) |
                                              (ecl_byp_sel_restore_m & restore_wen));
   dff_s dff_lsu_wen_m2w(.din(wen_no_inst_vld_m), .clk(clk), .q(wen_no_inst_vld_w), .se(se), .si(),
                       .so());
   // ecc_wen must be kept separate because it needs to check inst_vld but not flush
   assign      inst_vld_noflush_wen_m = ecl_byp_sel_ecc_m & ~sehold;
   dff_s ecc_wen_m2w(.din(inst_vld_noflush_wen_m), .clk(clk), .q(inst_vld_noflush_wen_w), .se(se), .si(), .so());
   
   assign ecl_irf_tid_m[1:0] = ((ecl_byp_sel_load_m)? dfill_tid_g2[1:0]:
                                (ecl_byp_sel_restore_m)? restore_tid[1:0]:
                                tid_m[1:0]);

   mux4ds #(5) rd_mux(.dout(ecl_irf_rd_m[4:0]), 
                      .in0(rd_m[4:0]), 
                      .in1(dfill_rd_g2[4:0]),
                      .in2(eccctl_wb_rd_m[4:0]),
                      .in3(restore_rd[4:0]),
                      .sel0(ecl_byp_sel_pipe_m), 
                      .sel1(ecl_byp_sel_load_m),
                      .sel2(ecl_byp_sel_ecc_m),
                      .sel3(ecl_byp_sel_restore_m));
   assign wen_w_inst_vld = valid_w | inst_vld_noflush_wen_w;
   assign ecl_irf_wen_w = ifu_exu_inst_vld_w & wen_w_inst_vld | wen_no_inst_vld_w;

   // bypass valid logic and flops
   dff_s dff_wb_d2e(.din(ifu_exu_wen_d), .clk(clk), .q(wb_e), .se(se),
                  .si(), .so());
   dff_s dff_wb_e2m(.din(valid_e), .clk(clk), .q(wb_m), .se(se),
                  .si(), .so());
   dffr_s dff_wb_m2w(.din(valid_m), .clk(clk), .q(wb_w), .se(se),
                  .si(), .so(), .rst(reset));
   assign  valid_e = wb_e & ~ifu_exu_kill_e & ~restore_e & ~wrsr_e;// restore doesn't finish on time
   assign  bypass_m = wb_m;// bypass doesn't need to check for traps or sehold
   assign  valid_m = bypass_m & ~rml_ecl_kill_m & ~sehold;// sehold turns off writes from this path
   assign  valid_w = (wb_w & ~early_flush_w & ~ifu_tlu_flush_w);// check inst_vld later
   // don't check flush for bypass
   assign  bypass_w = wb_w | inst_vld_noflush_wen_w | wen_no_inst_vld_w;

   // speculative wen for ecc injection
   assign  wb_eccctl_spec_wen_next = valid_m | dfill_vld_g2 | restore_request |  divcntl_wb_req_g;

   ///////////////////////////////////////////////////////
   // Priviledged register read and write flops and logic
   ///////////////////////////////////////////////////////
/* -----\/----- EXCLUDED -----\/-----
   Decoded sraddr
   sraddr[5] = 1-priv, 0-state
   Y -   0
   CCR - 2
   CWP - 9
   CANSAVE - a
   CARESTORE - b
   CLEANWIN - c
   OTHERWIN - d
   WSTATE - e 
   GSR - 0x13
 -----/\----- EXCLUDED -----/\----- */
   assign  ecl_rml_cwp_wen_e = sraddr_cwp_e & wrsr_e;
   assign  sraddr_cwp_e = ~sraddr_e[6] & sraddr_e[5] & ~sraddr_e[4] & sraddr_e[3] & ~sraddr_e[2] &
           ~sraddr_e[1] & sraddr_e[0];

   assign  sraddr_y_w = ~sraddr_w[6] & ~sraddr_w[5] & ~sraddr_w[4] & ~sraddr_w[3] & ~sraddr_w[2] & 
           ~sraddr_w[1] & ~sraddr_w[0];
   assign  sraddr_ccr_w = ~sraddr_w[6] & ~sraddr_w[5] & ~sraddr_w[4] & ~sraddr_w[3] & ~sraddr_w[2] &
           sraddr_w[1] & ~sraddr_w[0];
   assign  sraddr_cansave_w = ~sraddr_w[6] & sraddr_w[5] & ~sraddr_w[4] & sraddr_w[3] & ~sraddr_w[2] &
           sraddr_w[1] & ~sraddr_w[0];
   assign  sraddr_canrestore_w = ~sraddr_w[6] & sraddr_w[5] & ~sraddr_w[4] & sraddr_w[3] & ~sraddr_w[2] &
           sraddr_w[1] & sraddr_w[0];
   assign  sraddr_cleanwin_w = ~sraddr_w[6] & sraddr_w[5] & ~sraddr_w[4] & sraddr_w[3] & sraddr_w[2] &
           ~sraddr_w[1] & ~sraddr_w[0];
   assign  sraddr_otherwin_w = ~sraddr_w[6] & sraddr_w[5] & ~sraddr_w[4] & sraddr_w[3] & sraddr_w[2] &
           ~sraddr_w[1] & sraddr_w[0];
   assign  sraddr_wstate_w = ~sraddr_w[6] & sraddr_w[5] & ~sraddr_w[4] & sraddr_w[3] & sraddr_w[2] &
           sraddr_w[1] & ~sraddr_w[0];

   // yreg writes cycle after w and checks flush in that cycle
   assign  yreg_wen_w = sraddr_y_w & wrsr_w & ifu_exu_inst_vld_w;
   assign  yreg_wen_w1_vld = yreg_wen_w1 & ~flush_w1;

   // controls for all other writes (and flush checks) are in their respective blocks
   assign  wb_ccr_wrccr_w = sraddr_ccr_w & wrsr_w;
   assign  ecl_rml_cansave_wen_w = sraddr_cansave_w & wrsr_w;
   assign  ecl_rml_canrestore_wen_w = sraddr_canrestore_w & wrsr_w;
   assign  ecl_rml_cleanwin_wen_w = sraddr_cleanwin_w & wrsr_w;
   assign  ecl_rml_otherwin_wen_w = sraddr_otherwin_w & wrsr_w;
   assign  ecl_rml_wstate_wen_w = sraddr_wstate_w & wrsr_w;
   

   dff_s dff_wrsr_d2e(.din(ifu_tlu_wsr_inst_d), .clk(clk), .q(wrsr_e), .se(se),
                   .si(), .so());
   assign  exu_ffu_wsr_inst_e = wrsr_e;
   dff_s dff_wrsr_e2m(.din(wrsr_e), .clk(clk), .q(wrsr_m), .se(se),
                   .si(), .so());
   dff_s dff_wrsr_m2w(.din(wrsr_m), .clk(clk), .q(wrsr_w), .se(se),
                   .si(), .so());
   dff_s #(7) dff_sraddr_d2e(.din(ifu_tlu_sraddr_d[6:0]), .clk(clk), .q(sraddr_e[6:0]), .se(se),
                       .si(), .so());
   dff_s #(7) dff_sraddr_e2m(.din(sraddr_e[6:0]), .clk(clk), .q(sraddr_m[6:0]), .se(se),
                       .si(), .so());
   dff_s #(7) dff_sraddr_m2w(.din(sraddr_m[6:0]), .clk(clk), .q(sraddr_w[6:0]), .se(se),
                       .si(), .so());
   dff_s dff_yreg_wen_w2w1(.din(yreg_wen_w), .clk(clk), .q(yreg_wen_w1), .se(se), .si(), .so());
   
   // Logic for rdpr/rdsr
   // This mux takes advantage of the fact that these 4 encodings don't overlap
   assign sel_cleanwin_d = ~ifu_tlu_sraddr_d[1] & ~ifu_tlu_sraddr_d[0];
   assign sel_otherwin_d = ~ifu_tlu_sraddr_d[1] & ifu_tlu_sraddr_d[0];
   assign sel_cansave_d = ifu_tlu_sraddr_d[1] & ~ifu_tlu_sraddr_d[0];
   assign sel_canrestore_d = ifu_tlu_sraddr_d[1] & ifu_tlu_sraddr_d[0];
   mux4ds #(3) rdpr_mux1(.dout(rdpr_mux1_out[2:0]),
                       .in0(rml_ecl_canrestore_d[2:0]),
                       .in1(rml_ecl_cleanwin_d[2:0]),
                       .in2(rml_ecl_cansave_d[2:0]),
                       .in3(rml_ecl_otherwin_d[2:0]),
                       .sel0(sel_canrestore_d),
                       .sel1(sel_cleanwin_d),
                       .sel2(sel_cansave_d),
                       .sel3(sel_otherwin_d));
   assign sel_ccr_d = ~ifu_tlu_sraddr_d[3];
   assign sel_cwp_d = ifu_tlu_sraddr_d[3] & ~ifu_tlu_sraddr_d[2] & ~ifu_tlu_sraddr_d[1] & ifu_tlu_sraddr_d[0];
   assign sel_wstate_d = ifu_tlu_sraddr_d[3] & ifu_tlu_sraddr_d[2] & ifu_tlu_sraddr_d[1] & ~ifu_tlu_sraddr_d[0];
   assign sel_rdpr_mux1_d = ~(sel_ccr_d | sel_cwp_d | sel_wstate_d);
   mux4ds #(8) rdpr_mux2(.dout(rdpr_mux2_out[7:0]),
                       .in0(exu_ifu_cc_d[7:0]),
                       .in1({5'b0, rml_ecl_cwp_d[2:0]}),
                       .in2({2'b0, rml_ecl_wstate_d[5:0]}),
                       .in3({5'b0, rdpr_mux1_out[2:0]}),
                       .sel0(sel_ccr_d),
                       .sel1(sel_cwp_d),
                       .sel2(sel_wstate_d),
                       .sel3(sel_rdpr_mux1_d));

   assign read_yreg_e = ~(sraddr_e[3] | sraddr_e[1]);
   dff_s #(8) rdpr_dff(.din(rdpr_mux2_out[7:0]), .clk(clk), .q(ecl_byp_eclpr_e[7:0]),
                   .se(se), .si(), .so());


   ///////////////////////////////
   // YREG write enable logic
   ///////////////////////////////
   // decode thr_g for mux select
   assign multhr_dec_g[0] = ~mdqctl_wb_multhr_g[1] & ~mdqctl_wb_multhr_g[0];
   assign multhr_dec_g[1] = ~mdqctl_wb_multhr_g[1] & mdqctl_wb_multhr_g[0];
   assign multhr_dec_g[2] = mdqctl_wb_multhr_g[1] & ~mdqctl_wb_multhr_g[0];
   assign multhr_dec_g[3] = mdqctl_wb_multhr_g[1] & mdqctl_wb_multhr_g[0];

   assign divthr_dec_g[0] = ~mdqctl_wb_divthr_g[1] & ~mdqctl_wb_divthr_g[0];
   assign divthr_dec_g[1] = ~mdqctl_wb_divthr_g[1] & mdqctl_wb_divthr_g[0];
   assign divthr_dec_g[2] = mdqctl_wb_divthr_g[1] & ~mdqctl_wb_divthr_g[0];
   assign divthr_dec_g[3] = mdqctl_wb_divthr_g[1] & mdqctl_wb_divthr_g[0];

   assign thrdec_w1[0] = ~tid_w1[1] & ~tid_w1[0];
   assign thrdec_w1[1] = ~tid_w1[1] & tid_w1[0];
   assign thrdec_w1[2] = tid_w1[1] & ~tid_w1[0];
   assign thrdec_w1[3] = tid_w1[1] & tid_w1[0];

   // enable input for each thread
   
   assign ecl_div_yreg_shift_g[0] = divthr_dec_g[0] & mdqctl_wb_yreg_shift_g;
   assign ecl_div_yreg_wen_w[0] = (thrdec_w1[0] & yreg_wen_w1_vld &
                                   ~ecl_div_yreg_shift_g[0] &
                                   ~ecl_div_yreg_wen_g[0]);
   assign ecl_div_yreg_wen_g[0] = (multhr_dec_g[0] & mdqctl_wb_yreg_wen_g & 
                                   ~ecl_div_yreg_shift_g[0]);
   assign ecl_div_yreg_wen_l[0] = ~(ecl_div_yreg_wen_w[0] | ecl_div_yreg_wen_g[0]
                                    | ecl_div_yreg_shift_g[0]);
   assign ecl_div_yreg_shift_g[1] = divthr_dec_g[1] & mdqctl_wb_yreg_shift_g;
   assign ecl_div_yreg_wen_w[1] = (thrdec_w1[1] & yreg_wen_w1_vld &
                                   ~ecl_div_yreg_shift_g[1] &
                                   ~ecl_div_yreg_wen_g[1]);
   assign ecl_div_yreg_wen_g[1] = (multhr_dec_g[1] & mdqctl_wb_yreg_wen_g & 
                                   ~ecl_div_yreg_shift_g[1]);
   assign ecl_div_yreg_wen_l[1] = ~(ecl_div_yreg_wen_w[1] | ecl_div_yreg_wen_g[1]
                                    | ecl_div_yreg_shift_g[1]);
   assign ecl_div_yreg_shift_g[2] = divthr_dec_g[2] & mdqctl_wb_yreg_shift_g;
   assign ecl_div_yreg_wen_w[2] = (thrdec_w1[2] & yreg_wen_w1_vld &
                                   ~ecl_div_yreg_shift_g[2] &
                                   ~ecl_div_yreg_wen_g[2]);
   assign ecl_div_yreg_wen_g[2] = (multhr_dec_g[2] & mdqctl_wb_yreg_wen_g & 
                                   ~ecl_div_yreg_shift_g[2]);
   assign ecl_div_yreg_wen_l[2] = ~(ecl_div_yreg_wen_w[2] | ecl_div_yreg_wen_g[2]
                                    | ecl_div_yreg_shift_g[2]);
   assign ecl_div_yreg_shift_g[3] = divthr_dec_g[3] & mdqctl_wb_yreg_shift_g;
   assign ecl_div_yreg_wen_w[3] = (thrdec_w1[3] & yreg_wen_w1_vld &
                                   ~ecl_div_yreg_shift_g[3] &
                                   ~ecl_div_yreg_wen_g[3]);
   assign ecl_div_yreg_wen_g[3] = (multhr_dec_g[3] & mdqctl_wb_yreg_wen_g & 
                                   ~ecl_div_yreg_shift_g[3]);
   assign ecl_div_yreg_wen_l[3] = ~(ecl_div_yreg_wen_w[3] | ecl_div_yreg_wen_g[3]
                                    | ecl_div_yreg_shift_g[3]);

   //////////////////////////////////////////////////////////
   // Completion logic for restore
   //////////////////////////////////////////////////////////

   // only worry about restores.  Returns are automatically switched back in
   assign ecl_byp_restore_m = restore_m;
   assign vld_restore_e = restore_e & wb_e & ~return_e & ~rml_ecl_fill_e & ifu_exu_inst_vld_e;
   assign vld_restore_w = (restore_w & ~ifu_tlu_flush_w & ~early_flush_w 
                           & ifu_exu_inst_vld_w & ~reset);

   assign restore_request = restore_w | restore_ready;
   assign restore_wen = vld_restore_w | restore_ready;
   assign restore_picked = ecl_byp_sel_restore_m | ecl_byp_sel_restore_g;
   assign restore_done[3:0] = restore_thr[3:0] & {4{restore_picked & restore_request}};
   // restore request waits for kills in the w stage.  they
   // won't start until after the flop
   assign restore_ready_next = (vld_restore_w  | restore_ready) & ~restore_picked;

   dffe_s #(2) restore_tid_dff(.din(tid_m[1:0]), .clk(clk), .q(restore_tid[1:0]),
                             .se(se), .si(), .so(), .en(restore_m));
   dffe_s #(5) restore_rd_dff(.din(rd_m[4:0]), .clk(clk), .q(restore_rd[4:0]),
                            .se(se), .si(), .so(), .en(restore_m));
   dff_s return_d2e(.din(ifu_exu_return_d), .clk(clk), .q(return_e),
                   .se(se), .si(), .so());
   dff_s restore_e2m(.din(vld_restore_e), .clk(clk), .q(restore_m),
                   .se(se), .si(), .so());
   dff_s restore_m2w(.din(restore_m), .clk(clk), .q(restore_w),
                   .se(se), .si(), .so());
   dff_s restore_ready_dff(.din(restore_ready_next), .q(restore_ready),
                         .clk(clk), .se(se), .so(), .si());

   //////////////////////////////////////////////////////////
   // Completion logic for non integer-pipeline operations
   //////////////////////////////////////////////////////////
   // short_longops must check inst_vld_e to protect against invalid completion signal
   assign short_longop_done_e = (rml_ecl_rmlop_done_e | (restore_e & ~wb_e & ~return_e)) & 
                                  ifu_exu_inst_vld_e & ~ifu_exu_kill_e;
   dff_s longop_done_e2m (.din(short_longop_done_e), .clk(clk), .q(short_longop_done_m), .se(se), .si(), .so());
   assign short_longop_done[3:0] = thr_m[3:0] & {4{short_longop_done_m}};
   
   assign ecl_longop_done_nokill_m[3:0] = (muldiv_done_g[3:0] | restore_done[3:0] | short_longop_done[3:0] | 
                                           rml_ecl_swap_done[3:0]);
   assign ecl_longop_done_kill_m[3:0] = (muldiv_done_g[3:0] | restore_done[3:0] | rml_ecl_swap_done[3:0]);
   assign exu_ifu_longop_done_g[3:0] = (ecl_exu_kill_m)? ecl_longop_done_kill_m[3:0]: ecl_longop_done_nokill_m[3:0];
   

   // decode tid
   assign restore_thr[3] = restore_tid[1] & restore_tid[0];
   assign restore_thr[2] = restore_tid[1] & ~restore_tid[0];
   assign restore_thr[1] = ~restore_tid[1] & restore_tid[0];
   assign restore_thr[0] = ~restore_tid[1] & ~restore_tid[0];

endmodule // sparc_exu_ecl_wb
