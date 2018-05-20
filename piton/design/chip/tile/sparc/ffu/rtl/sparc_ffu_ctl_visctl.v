// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ffu_ctl_visctl.v
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
//  Module Name: sparc_ffu_ctl_visctl
//	Description: This is the ffu vis control block.
*/
module sparc_ffu_ctl_visctl (/*AUTOARG*/
   // Outputs
   ctl_vis_sel_add, ctl_vis_sel_log, ctl_vis_sel_align, 
   ctl_vis_add32, ctl_vis_subtract, ctl_vis_cin, ctl_vis_align0, 
   ctl_vis_align2, ctl_vis_align4, ctl_vis_align6, ctl_vis_align_odd, 
   ctl_vis_log_sel_pass, ctl_vis_log_sel_nand, ctl_vis_log_sel_nor, 
   ctl_vis_log_sel_xor, ctl_vis_log_invert_rs1, 
   ctl_vis_log_invert_rs2, ctl_vis_log_constant, 
   ctl_vis_log_pass_const, ctl_vis_log_pass_rs1, 
   ctl_vis_log_pass_rs2, vis_result, illegal_vis_e, vis_nofrf_e, 
   visop_m, visop_w_vld, vis_wen_next, fpu_rnd, 
   ffu_exu_rsr_data_hi_m, ffu_exu_rsr_data_mid_m, 
   ffu_exu_rsr_data_lo_m, ctl_dp_wsr_data_w2, ctl_dp_gsr_wsr_w2, 
   ctl_dp_thr_e, 
   // Inputs
   clk, se, reset, opf, tid_w2, tid_e, tid, visop_e, kill_w, 
   ifu_tlu_sraddr_d, exu_ffu_wsr_inst_e, exu_ffu_gsr_align_m, 
   exu_ffu_gsr_rnd_m, exu_ffu_gsr_mask_m, exu_ffu_gsr_scale_m, 
   ifu_ffu_rnd_e, dp_ctl_fsr_rnd, flush_w2, thr_match_mw2, 
   thr_match_ww2, ifu_tlu_inst_vld_w, ue_trap_w3, frs1_e, frs2_e, 
   frd_e, rollback_c3, rollback_rs2_w2, visop, rollback_rs1_w3, 
   dp_ctl_gsr_mask_e, dp_ctl_gsr_scale_e
   ) ;
   input clk;
   input se;
   input reset;
   input [8:0] opf;
   input [1:0] tid_w2;
   input [1:0] tid_e;
   input [1:0] tid;
   input      visop_e;
   input       kill_w;
   input [6:0] ifu_tlu_sraddr_d; 
   input       exu_ffu_wsr_inst_e;
   input [2:0] exu_ffu_gsr_align_m;
   input [2:0] exu_ffu_gsr_rnd_m;
   input [31:0] exu_ffu_gsr_mask_m;
   input [4:0]  exu_ffu_gsr_scale_m;
   input [2:0] ifu_ffu_rnd_e;
   input [1:0] dp_ctl_fsr_rnd;
   input      flush_w2;
   input      thr_match_mw2;
   input      thr_match_ww2;
   input      ifu_tlu_inst_vld_w;
   input      ue_trap_w3;
   input [4:0] frs1_e;
   input [4:0] frs2_e;
   input [4:0] frd_e;
   input       rollback_c3;
   input       rollback_rs2_w2;
   input       visop;
   input       rollback_rs1_w3;
   input [31:0] dp_ctl_gsr_mask_e;
   input [4:0]  dp_ctl_gsr_scale_e;
   
   output      ctl_vis_sel_add;
   output      ctl_vis_sel_log;
   output      ctl_vis_sel_align;
   output      ctl_vis_add32;
   output      ctl_vis_subtract;
   output      ctl_vis_cin;
   output      ctl_vis_align0;
   output      ctl_vis_align2;
   output      ctl_vis_align4;
   output      ctl_vis_align6;
   output      ctl_vis_align_odd;
   output      ctl_vis_log_sel_pass;
   output      ctl_vis_log_sel_nand;
   output      ctl_vis_log_sel_nor;
   output      ctl_vis_log_sel_xor;
   output      ctl_vis_log_invert_rs1;
   output      ctl_vis_log_invert_rs2;
   output      ctl_vis_log_constant;
   output      ctl_vis_log_pass_const;
   output      ctl_vis_log_pass_rs1;
   output      ctl_vis_log_pass_rs2;
   output      vis_result;
   output      illegal_vis_e;
   output      vis_nofrf_e;
   output      visop_m;
   output      visop_w_vld;
   output      vis_wen_next;
   output [1:0] fpu_rnd;
   output [31:0] ffu_exu_rsr_data_hi_m;
   output [2:0]  ffu_exu_rsr_data_mid_m;
   output [7:0] ffu_exu_rsr_data_lo_m;

   output [36:0] ctl_dp_wsr_data_w2;
   output [3:0] ctl_dp_gsr_wsr_w2;
   output [3:0] ctl_dp_thr_e;
   
   wire         illegal_rs1_e;
   wire         illegal_rs2_e;
   wire         illegal_siam_e;
   wire         rs2_check_nonzero_e;
   wire         rs1_check_nonzero_e;
   wire        visop_e;
   wire        issue_visop_e;
   wire        visop_m;
   wire        visop_w;
   wire        visop_w_vld;
   wire        visop_w2_vld;
   wire        visop_w2;
   wire        visop_w3;
   wire        visop_w3_vld;
   wire        add;
   wire        align;
   wire        wlogic;
   wire        siam;
   wire        alignaddr;

   wire        opf_log_zero;
   wire        opf_log_one;
   wire        opf_log_src1;
   wire        opf_log_src2;
   wire        opf_log_not1;
   wire        opf_log_not2;
   wire        opf_log_or;
   wire        opf_log_nor;
   wire        opf_log_and;
   wire        opf_log_nand;
   wire        opf_log_xor;
   wire        opf_log_xnor;
   wire        opf_log_ornot1;
   wire        opf_log_ornot2;
   wire        opf_log_andnot1;
   wire        opf_log_andnot2;
   wire        invert_rs1_next;
   wire        invert_rs2_next;
   wire        log_pass_rs1_next;
   wire        log_pass_rs2_next;
   wire        log_pass_rs1;
   wire        log_pass_rs2;
   
   wire [2:0] t0_gsr_rnd;
   wire [2:0] t1_gsr_rnd;
   wire [2:0] t2_gsr_rnd;
   wire [2:0] t3_gsr_rnd;
   wire [2:0] t0_gsr_align;
   wire [2:0] t1_gsr_align;
   wire [2:0] t2_gsr_align;
   wire [2:0] t3_gsr_align;
   wire [2:0] t0_gsr_rnd_next;
   wire [2:0] t1_gsr_rnd_next;
   wire [2:0] t2_gsr_rnd_next;
   wire [2:0] t3_gsr_rnd_next;
   wire [2:0] t0_gsr_align_next;
   wire [2:0] t1_gsr_align_next;
   wire [2:0] t2_gsr_align_next;
   wire [2:0] t3_gsr_align_next;
   wire [2:0] gsr_rnd_e;
   wire [2:0] gsr_align_e;
   wire       t0_rnd_wen_l;
   wire       t0_gsr_wsr_w2;
   wire       t0_siam_w2;
   wire       t0_align_wen_l;
   wire       t0_alignaddr_w2;
   wire       t1_rnd_wen_l;
   wire       t1_gsr_wsr_w2;
   wire       t1_siam_w2;
   wire       t1_align_wen_l;
   wire       t1_alignaddr_w2;
   wire       t2_rnd_wen_l;
   wire       t2_gsr_wsr_w2;
   wire       t2_siam_w2;
   wire       t2_align_wen_l;
   wire       t2_alignaddr_w2;
   wire       t3_rnd_wen_l;
   wire       t3_gsr_wsr_w2;
   wire       t3_siam_w2;
   wire       t3_align_wen_l;
   wire       t3_alignaddr_w2;

   wire [2:0] siam_rnd;
   wire [3:0] thr_w2;
   wire [3:0] ctl_dp_thr_e;
   wire [3:0] thr_fp;
   wire       gsr_addr_d;
   wire       gsr_addr_e;
   wire       wgsr_e;
   wire       wgsr_m;
   wire       wgsr_w;
   wire       wgsr_vld_m;
   wire       wgsr_vld_w;
   wire       wgsr_vld_w2;
   wire       wgsr_w2;
   wire [2:0] gsr_rnd;
   wire [1:0] fpu_rnd_next;
   wire [2:0]  gsr_align;
   wire [2:0]  gsr_align_d1;

   wire [2:0] align_addr_data_w2;
   wire [2:0] wgsr_align_offset_w;
   wire [2:0] wgsr_rnd_w;
   wire [2:0] wgsr_align_offset_w2;
   wire [2:0] wgsr_rnd_w2;

   wire [36:0] wsr_data_m;
   wire [36:0] wsr_data_w;


   //////////////////////////////////////
   // VIS PIPELINE
   //------------------------------------
   // Note: rs2_ce, rs2_ue, rs1_ue will kill vis instruction
   //       in addition to any traps, etc.
   //       These are incorporated into the "kill" signals
   // E: ren rs2
   // M: ren rs1
   // W: rs2 data ready, check rs2 ecc
   // W2: rs1 data ready, check rs1 ecc
   // W3: execute vis operation (result written to rs2/rd flop)
   // W4: gen ecc and write to frf
   
   dff_s visop_e2m(.din(issue_visop_e), .clk(clk), .q(visop_m), .si(), .so(), .se(se));
   dff_s visop_m2w(.din(visop_m), .clk(clk), .q(visop_w), .si(), .so(), .se(se));
   dff_s visop_w2w2(.din(visop_w_vld), .clk(clk), .q(visop_w2), .si(), .so(), .se(se));
   dff_s visop_w22w3(.din(visop_w2_vld), .clk(clk), .q(visop_w3), .si(), .so(), .se(se));

   assign     issue_visop_e = visop_e | visop & rollback_c3;
   // only check kills in w since they are accumulated into kill_w
   assign      visop_w_vld = visop_w & ~kill_w;
   assign      visop_w2_vld = visop_w2 & ~flush_w2 & ~rollback_rs2_w2;
   assign      visop_w3_vld = visop_w3 & ~ue_trap_w3 & ~rollback_rs1_w3;

   assign      vis_result = visop_w3_vld;
   assign      vis_wen_next = vis_result & ~siam & ~alignaddr;

   ////////////////////////////////////
   // Decode opf
   ////////////////////////////////////
   assign      add = ~opf[8] & ~opf[7] & opf[6] & ~opf[5] & opf[4] & ~opf[3];
   assign      align = ~opf[8] & ~opf[7] & opf[6] & ~opf[5] & ~opf[4] & opf[3] & ~opf[2] & ~opf[1] & ~opf[0];
   assign      wlogic = ~opf[8] & ~opf[7] & opf[6] & opf[5];
   assign siam = ~opf[8] & opf[7] & ~opf[6] & ~opf[5] & ~opf[4] & ~opf[3] & ~opf[2] & ~opf[1] & opf[0];
   assign alignaddr = ~opf[8] & ~opf[7] & ~opf[6] & ~opf[5] & opf[4] & opf[3] & ~opf[2] & ~opf[0]; //alignaddress

   assign illegal_vis_e = (visop_e & ~(add | align | wlogic | siam | alignaddr) | 
                           illegal_rs1_e | illegal_rs2_e | illegal_siam_e);
   assign rs1_check_nonzero_e = visop_e & (siam | (wlogic & (opf_log_zero | opf_log_one | opf_log_src2 | opf_log_not2)));
   assign rs2_check_nonzero_e = visop_e & wlogic & (opf_log_zero | opf_log_one | opf_log_src1 | opf_log_not1);
   assign illegal_rs1_e = (frs1_e[4:0] != 5'b00000) & rs1_check_nonzero_e;
   assign illegal_rs2_e = (frs2_e[4:0] != 5'b00000) & rs2_check_nonzero_e;
   assign illegal_siam_e = ((frd_e[4:0] != 5'b00000) | frs2_e[4] | frs2_e[3]) & siam & visop_e;

   assign vis_nofrf_e = visop_e & (siam | alignaddr | opf_log_zero | opf_log_one);
   
   // controls for add
   // Make subtract come out of its own flop for loading purposes (very critical timing)
   dff_s sub_dff(.din(opf[2]), .clk(clk), .q(ctl_vis_subtract), .se(se), .si(), .so());
   assign ctl_vis_cin = opf[2];
   assign ctl_vis_add32 = opf[1];

   // controls for logic
   assign opf_log_zero = ~opf[4] & ~opf[3] & ~opf[2] & ~opf[1];
   assign opf_log_nor = ~opf[4] & ~opf[3] & ~opf[2] & opf[1];
   assign opf_log_andnot2 = ~opf[4] & ~opf[3] & opf[2] & ~opf[1];
   assign opf_log_not2 = ~opf[4] & ~opf[3] & opf[2] & opf[1];
   assign opf_log_andnot1 = ~opf[4] & opf[3] & ~opf[2] & ~opf[1];
   assign opf_log_not1 = ~opf[4] & opf[3] & ~opf[2] & opf[1];
   assign opf_log_xor = ~opf[4] & opf[3] & opf[2] & ~opf[1];
   assign opf_log_nand = ~opf[4] & opf[3] & opf[2] & opf[1];
   assign opf_log_and = opf[4] & ~opf[3] & ~opf[2] & ~opf[1];
   assign opf_log_xnor = opf[4] & ~opf[3] & ~opf[2] & opf[1];
   assign opf_log_src1 = opf[4] & ~opf[3] & opf[2] & ~opf[1];
   assign opf_log_ornot2 = opf[4] & ~opf[3] & opf[2] & opf[1];
   assign opf_log_src2 = opf[4] & opf[3] & ~opf[2] & ~opf[1];
   assign opf_log_ornot1 = opf[4] & opf[3] & ~opf[2] & opf[1];
   assign opf_log_or = opf[4] & opf[3] & opf[2] & ~opf[1];
   assign opf_log_one = opf[4] & opf[3] & opf[2] & opf[1];

   // selects for logic mux
   assign ctl_vis_log_sel_nand = opf_log_or | opf_log_nand | opf_log_ornot1 | opf_log_ornot2;
   assign ctl_vis_log_sel_xor = opf_log_xor | opf_log_xnor;
   assign ctl_vis_log_sel_nor = opf_log_and | opf_log_nor | opf_log_andnot1 | opf_log_andnot2;
   assign ctl_vis_log_sel_pass = (opf_log_zero | opf_log_one | opf_log_src1 | opf_log_src2 |
                                  opf_log_not1 | opf_log_not2);

   assign invert_rs1_next = (opf_log_not1 | opf_log_or | opf_log_and | 
                                    opf_log_ornot2 | opf_log_andnot2);
   assign invert_rs2_next = (opf_log_not2 | opf_log_or | opf_log_and | 
                                    opf_log_ornot1 | opf_log_andnot1 | opf_log_xnor);
   dff_s invert_rs1_dff(.din(invert_rs1_next), .clk(clk), .q(ctl_vis_log_invert_rs1),
                      .se(se), .si(), .so());
   dff_s invert_rs2_dff(.din(invert_rs2_next), .clk(clk), .q(ctl_vis_log_invert_rs2),
                      .se(se), .si(), .so());
   // precalculate to help timing
   assign log_pass_rs1_next = opf_log_src1 | opf_log_not1;
   assign log_pass_rs2_next = opf_log_src2 | opf_log_not2;
   dff_s #(2) log_pass_dff(.din({log_pass_rs1_next,log_pass_rs2_next}), .clk(clk),
                         .q({log_pass_rs1,log_pass_rs2}), .se(se), .si(), .so());
   
   assign ctl_vis_log_pass_rs1 = log_pass_rs1;
   assign ctl_vis_log_pass_rs2 = log_pass_rs2 & ~log_pass_rs1;
   assign ctl_vis_log_constant = opf_log_one;
   assign ctl_vis_log_pass_const = ~(ctl_vis_log_pass_rs1 | ctl_vis_log_pass_rs2);
   
   // controls for falign
   assign ctl_vis_align0 = ~gsr_align_d1[2] & ~gsr_align_d1[1];
   assign ctl_vis_align2 = ~gsr_align_d1[2] & gsr_align_d1[1];
   assign ctl_vis_align4 = gsr_align_d1[2] & ~gsr_align_d1[1];
   assign ctl_vis_align6 = gsr_align_d1[2] & gsr_align_d1[1];
   assign ctl_vis_align_odd = gsr_align_d1[0];

   // controls for output mux
   assign ctl_vis_sel_add = add;
   assign ctl_vis_sel_align = align;
   assign ctl_vis_sel_log = ~(add | align);

   ///////////////////////////////////////////////////////////
   // GSR.alignaddr_offset, GSR.IM, GSR.IRND
   ///////////////////////////////////////////////////////////

   mux4ds #(6) curr_gsr_mux(.dout({gsr_rnd[2:0], gsr_align[2:0]}),
                            .in0({t0_gsr_rnd[2:0], t0_gsr_align[2:0]}),
                            .in1({t1_gsr_rnd[2:0], t1_gsr_align[2:0]}),
                            .in2({t2_gsr_rnd[2:0], t2_gsr_align[2:0]}),
                            .in3({t3_gsr_rnd[2:0], t3_gsr_align[2:0]}),
                            .sel0(thr_fp[0]),
                            .sel1(thr_fp[1]),
                            .sel2(thr_fp[2]),
                            .sel3(thr_fp[3]));
   mux4ds #(6) gsr_e_mux(.dout({gsr_rnd_e[2:0], gsr_align_e[2:0]}),
                            .in0({t0_gsr_rnd[2:0], t0_gsr_align[2:0]}),
                            .in1({t1_gsr_rnd[2:0], t1_gsr_align[2:0]}),
                            .in2({t2_gsr_rnd[2:0], t2_gsr_align[2:0]}),
                            .in3({t3_gsr_rnd[2:0], t3_gsr_align[2:0]}),
                            .sel0(ctl_dp_thr_e[0]),
                            .sel1(ctl_dp_thr_e[1]),
                            .sel2(ctl_dp_thr_e[2]),
                            .sel3(ctl_dp_thr_e[3]));
   dff_s #(43) gsr_e2m(.din({dp_ctl_gsr_mask_e[31:0],gsr_rnd_e[2:0],
                          dp_ctl_gsr_scale_e[4:0],gsr_align_e[2:0]}), .clk(clk),
                    .q({ffu_exu_rsr_data_hi_m[31:0],ffu_exu_rsr_data_mid_m[2:0], ffu_exu_rsr_data_lo_m[7:0]}),
                    .se(se), .si(), .so());
   dff_s #(3) gsr_align_dff(.din(gsr_align[2:0]), .clk(clk), .q(gsr_align_d1[2:0]), .se(se), .si(), .so());

   // put in to help timing for sending to lsu
   dff_s #(2) fpu_rnd_dff(.din(fpu_rnd_next[1:0]), .clk(clk), .q(fpu_rnd[1:0]), .si(), .so(), .se(se));
   assign      fpu_rnd_next[1:0] = (gsr_rnd[2])? gsr_rnd[1:0]: dp_ctl_fsr_rnd[1:0];

   // if alignaddress_little then write the 2's complement
   assign     align_addr_data_w2[2:0] = (opf[1])? (~wgsr_align_offset_w2[2:0] + 3'b001):
                                                  wgsr_align_offset_w2[2:0];
   
   assign     gsr_addr_d = (ifu_tlu_sraddr_d[6:0] == 7'b0010011);
   assign     wgsr_e = exu_ffu_wsr_inst_e & gsr_addr_e;
   dff_s gsr_addr_d2e(.din(gsr_addr_d), .clk(clk), .q(gsr_addr_e), .se(se), .si(), .so());

   // need independent kill checks because this isn't killed by new fpop
   assign     wgsr_vld_m = wgsr_m & ~(thr_match_mw2 & flush_w2);
   assign     wgsr_vld_w = wgsr_w & ifu_tlu_inst_vld_w & ~(thr_match_ww2 & flush_w2);
   assign     wgsr_vld_w2 = wgsr_w2 & ~flush_w2;
   dff_s wgsr_e2m(.din(wgsr_e), .clk(clk), .q(wgsr_m), .si(), .so(), .se(se));
   dff_s wgsr_m2w(.din(wgsr_vld_m), .clk(clk), .q(wgsr_w), .si(), .so(), .se(se));
   dff_s wgsr_w2w2(.din(wgsr_vld_w), .clk(clk), .q(wgsr_w2), .si(), .so(), .se(se));

   assign     thr_w2[3] = (tid_w2[1:0] == 2'b11);
   assign     thr_w2[2] = (tid_w2[1:0] == 2'b10);
   assign     thr_w2[1] = (tid_w2[1:0] == 2'b01);
   assign     thr_w2[0] = (tid_w2[1:0] == 2'b00);
   assign     ctl_dp_thr_e[3] = (tid_e[1:0] == 2'b11);
   assign     ctl_dp_thr_e[2] = (tid_e[1:0] == 2'b10);
   assign     ctl_dp_thr_e[1] = (tid_e[1:0] == 2'b01);
   assign     ctl_dp_thr_e[0] = (tid_e[1:0] == 2'b00);
   assign     thr_fp[3] = (tid[1:0] == 2'b11);
   assign     thr_fp[2] = (tid[1:0] == 2'b10);
   assign     thr_fp[1] = (tid[1:0] == 2'b01);
   assign     thr_fp[0] = (tid[1:0] == 2'b00);
   
   assign     t0_siam_w2 = thr_fp[0] & siam & visop_w2_vld;
   assign     t0_gsr_wsr_w2 = thr_w2[0] & wgsr_vld_w2;
   assign     t0_alignaddr_w2 = thr_fp[0] & alignaddr & visop_w2_vld;
   assign     t0_rnd_wen_l = ~(t0_gsr_wsr_w2 | t0_siam_w2);
   assign     t0_align_wen_l = ~(t0_gsr_wsr_w2 | t0_alignaddr_w2);
   assign     t1_siam_w2 = thr_fp[1] & siam & visop_w2_vld;
   assign     t1_gsr_wsr_w2 = thr_w2[1] & wgsr_vld_w2;
   assign     t1_alignaddr_w2 = thr_fp[1] & alignaddr & visop_w2_vld;
   assign     t1_rnd_wen_l = ~(t1_gsr_wsr_w2 | t1_siam_w2);
   assign     t1_align_wen_l = ~(t1_gsr_wsr_w2 | t1_alignaddr_w2);
   assign     t2_siam_w2 = thr_fp[2] & siam & visop_w2_vld;
   assign     t2_gsr_wsr_w2 = thr_w2[2] & wgsr_vld_w2;
   assign     t2_alignaddr_w2 = thr_fp[2] & alignaddr & visop_w2_vld;
   assign     t2_rnd_wen_l = ~(t2_gsr_wsr_w2 | t2_siam_w2);
   assign     t2_align_wen_l = ~(t2_gsr_wsr_w2 | t2_alignaddr_w2);
   assign     t3_siam_w2 = thr_fp[3] & siam & visop_w2_vld;
   assign     t3_gsr_wsr_w2 = thr_w2[3] & wgsr_vld_w2;
   assign     t3_alignaddr_w2 = thr_fp[3] & alignaddr & visop_w2_vld;
   assign     t3_rnd_wen_l = ~(t3_gsr_wsr_w2 | t3_siam_w2);
   assign     t3_align_wen_l = ~(t3_gsr_wsr_w2 | t3_alignaddr_w2);

   assign     ctl_dp_gsr_wsr_w2[3:0] = {t3_gsr_wsr_w2,t2_gsr_wsr_w2,t1_gsr_wsr_w2,t0_gsr_wsr_w2};

   // Storage flops and muxes
   mux3ds #(3) t0_rnd_mux(.dout(t0_gsr_rnd_next[2:0]),
                          .in0(t0_gsr_rnd[2:0]),
                          .in1(wgsr_rnd_w2[2:0]),
                          .in2(siam_rnd[2:0]),
                          .sel0(t0_rnd_wen_l),
                          .sel1(t0_gsr_wsr_w2),
                          .sel2(t0_siam_w2));
   mux3ds #(3) t0_align_mux(.dout(t0_gsr_align_next[2:0]),
                            .in0(t0_gsr_align[2:0]),
                            .in1(wgsr_align_offset_w2[2:0]),
                            .in2(align_addr_data_w2[2:0]),
                            .sel0(t0_align_wen_l),
                            .sel1(t0_gsr_wsr_w2),
                            .sel2(t0_alignaddr_w2));
   mux3ds #(3) t1_rnd_mux(.dout(t1_gsr_rnd_next[2:0]),
                          .in0(t1_gsr_rnd[2:0]),
                          .in1(wgsr_rnd_w2[2:0]),
                          .in2(siam_rnd[2:0]),
                          .sel0(t1_rnd_wen_l),
                          .sel1(t1_gsr_wsr_w2),
                          .sel2(t1_siam_w2));
   mux3ds #(3) t1_align_mux(.dout(t1_gsr_align_next[2:0]),
                            .in0(t1_gsr_align[2:0]),
                            .in1(wgsr_align_offset_w2[2:0]),
                            .in2(align_addr_data_w2[2:0]),
                            .sel0(t1_align_wen_l),
                            .sel1(t1_gsr_wsr_w2),
                            .sel2(t1_alignaddr_w2));
   mux3ds #(3) t2_rnd_mux(.dout(t2_gsr_rnd_next[2:0]),
                          .in0(t2_gsr_rnd[2:0]),
                          .in1(wgsr_rnd_w2[2:0]),
                          .in2(siam_rnd[2:0]),
                          .sel0(t2_rnd_wen_l),
                          .sel1(t2_gsr_wsr_w2),
                          .sel2(t2_siam_w2));
   mux3ds #(3) t2_align_mux(.dout(t2_gsr_align_next[2:0]),
                            .in0(t2_gsr_align[2:0]),
                            .in1(wgsr_align_offset_w2[2:0]),
                            .in2(align_addr_data_w2[2:0]),
                            .sel0(t2_align_wen_l),
                            .sel1(t2_gsr_wsr_w2),
                            .sel2(t2_alignaddr_w2));
   mux3ds #(3) t3_rnd_mux(.dout(t3_gsr_rnd_next[2:0]),
                          .in0(t3_gsr_rnd[2:0]),
                          .in1(wgsr_rnd_w2[2:0]),
                          .in2(siam_rnd[2:0]),
                          .sel0(t3_rnd_wen_l),
                          .sel1(t3_gsr_wsr_w2),
                          .sel2(t3_siam_w2));
   mux3ds #(3) t3_align_mux(.dout(t3_gsr_align_next[2:0]),
                            .in0(t3_gsr_align[2:0]),
                            .in1(wgsr_align_offset_w2[2:0]),
                            .in2(align_addr_data_w2[2:0]),
                            .sel0(t3_align_wen_l),
                            .sel1(t3_gsr_wsr_w2),
                            .sel2(t3_alignaddr_w2));


   dffr_s #(6) t0_gsr_dff(.din({t0_gsr_rnd_next[2:0], t0_gsr_align_next[2:0]}), .clk(clk),
                       .q({t0_gsr_rnd[2:0], t0_gsr_align[2:0]}), .se(se),
                       .si(), .so(), .rst(reset));
   dffr_s #(6) t1_gsr_dff(.din({t1_gsr_rnd_next[2:0], t1_gsr_align_next[2:0]}), .clk(clk),
                       .q({t1_gsr_rnd[2:0], t1_gsr_align[2:0]}), .se(se),
                       .si(), .so(), .rst(reset));
   dffr_s #(6) t2_gsr_dff(.din({t2_gsr_rnd_next[2:0], t2_gsr_align_next[2:0]}), .clk(clk),
                       .q({t2_gsr_rnd[2:0], t2_gsr_align[2:0]}), .se(se),
                       .si(), .so(), .rst(reset));
   dffr_s #(6) t3_gsr_dff(.din({t3_gsr_rnd_next[2:0], t3_gsr_align_next[2:0]}), .clk(clk),
                       .q({t3_gsr_rnd[2:0], t3_gsr_align[2:0]}), .se(se),
                       .si(), .so(), .rst(reset));

   dffre_s #(3) siam_rnd_dff(.din(ifu_ffu_rnd_e[2:0]), .clk(clk),
                          .q(siam_rnd), .se(se), .si(), .so(),
                           .rst(reset), .en(visop_e));
   dff_s #(3) align_offset_dff1(.din(exu_ffu_gsr_align_m[2:0]), .clk(clk),
                             .q(wgsr_align_offset_w[2:0]), .se(se), .si(), .so());
   dff_s #(3) align_offset_dff2(.din(wgsr_align_offset_w[2:0]), .clk(clk),
                             .q(wgsr_align_offset_w2[2:0]), .se(se), .si(), .so());
   dff_s #(3) rnd_dff1(.din(exu_ffu_gsr_rnd_m[2:0]), .clk(clk),
                      .q(wgsr_rnd_w[2:0]), .se(se), .si(), .so());
   dff_s #(3) rnd_dff2(.din(wgsr_rnd_w[2:0]), .clk(clk),
                      .q(wgsr_rnd_w2[2:0]), .se(se), .si(), .so());
   assign     wsr_data_m[36:0] = {exu_ffu_gsr_mask_m[31:0], exu_ffu_gsr_scale_m[4:0]};
   dff_s #(37) wsr_data_m2w(.din(wsr_data_m[36:0]), .clk(clk), .q(wsr_data_w[36:0]),
                          .se(se), .si(), .so());
   dff_s #(37) wsr_data_w2w2(.din(wsr_data_w[36:0]), .clk(clk), .q(ctl_dp_wsr_data_w2[36:0]),
                          .se(se), .si(), .so());
           
   
endmodule // sparc_ffu_ctl_visctl
