// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_ecl_eccctl.v
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
//  Module Name: sparc_exu_ecl_eccctl
//	Description:  Implements the control logic for ecc checking.
//		This includes picking which error to fix (only one fixed per instruction),
//		enabling the checks, and signalling the errors.
*/

module sparc_exu_ecl_eccctl (/*AUTOARG*/
   // Outputs
   ue_trap_m, ecl_ecc_sel_rs1_m_l, ecl_ecc_sel_rs2_m_l, 
   ecl_ecc_sel_rs3_m_l, ecl_ecc_log_rs1_m, ecl_ecc_log_rs2_m, 
   ecl_ecc_log_rs3_m, ecl_byp_sel_ecc_m, ecl_ecc_rs1_use_rf_e, 
   ecl_ecc_rs2_use_rf_e, ecl_ecc_rs3_use_rf_e, eccctl_wb_rd_m, 
   exu_ifu_ecc_ce_m, exu_ifu_ecc_ue_m, exu_ifu_err_reg_m, 
   ecl_byp_ecc_mask_m_l, exu_ifu_inj_ack, exu_ifu_err_synd_7_m, 
   // Inputs
   clk, se, rst_tri_en, ecc_ecl_rs1_ce, ecc_ecl_rs1_ue, 
   ecc_ecl_rs2_ce, ecc_ecl_rs2_ue, ecc_ecl_rs3_ce, ecc_ecl_rs3_ue, 
   ecl_byp_rcc_mux2_sel_rf, ecl_byp_rs2_mux2_sel_rf, 
   ecl_byp_rs3_mux2_sel_rf, rs1_vld_e, rs2_vld_e, rs3_vld_e, 
   ifu_exu_rs1_m, ifu_exu_rs2_m, ifu_exu_rs3_m, rml_ecl_cwp_d, 
   ifu_exu_ecc_mask, ifu_exu_inj_irferr, ifu_exu_disable_ce_e, 
   wb_eccctl_spec_wen_next, ifu_exu_nceen_e, ifu_exu_inst_vld_e, 
   rml_ecl_gl_e, cancel_rs3_ecc_e
   ) ;
   input clk;
   input se;
   input rst_tri_en;
   input       ecc_ecl_rs1_ce;
   input       ecc_ecl_rs1_ue;
   input       ecc_ecl_rs2_ce;
   input       ecc_ecl_rs2_ue;
   input       ecc_ecl_rs3_ce;
   input       ecc_ecl_rs3_ue;
   input       ecl_byp_rcc_mux2_sel_rf;
   input       ecl_byp_rs2_mux2_sel_rf;
   input       ecl_byp_rs3_mux2_sel_rf;
   input       rs1_vld_e;
   input       rs2_vld_e;
   input       rs3_vld_e;
   input [4:0] ifu_exu_rs1_m;
   input [4:0] ifu_exu_rs2_m;
   input [4:0] ifu_exu_rs3_m;
   input [2:0] rml_ecl_cwp_d;
   input [7:0] ifu_exu_ecc_mask;
   input       ifu_exu_inj_irferr;
   input       ifu_exu_disable_ce_e;
   input       wb_eccctl_spec_wen_next;
   input       ifu_exu_nceen_e;
   input       ifu_exu_inst_vld_e;
   input [1:0] rml_ecl_gl_e;
   input       cancel_rs3_ecc_e;
   
   output      ue_trap_m;
   output      ecl_ecc_sel_rs1_m_l;
   output      ecl_ecc_sel_rs2_m_l;
   output      ecl_ecc_sel_rs3_m_l;
   output      ecl_ecc_log_rs1_m;
   output      ecl_ecc_log_rs2_m;
   output      ecl_ecc_log_rs3_m;
   output      ecl_byp_sel_ecc_m;
   output      ecl_ecc_rs1_use_rf_e;
   output      ecl_ecc_rs2_use_rf_e;
   output      ecl_ecc_rs3_use_rf_e;
   output [4:0] eccctl_wb_rd_m;
   output       exu_ifu_ecc_ce_m;
   output       exu_ifu_ecc_ue_m;
   output [7:0] exu_ifu_err_reg_m;
   output [7:0] ecl_byp_ecc_mask_m_l;
   output       exu_ifu_inj_ack;
   output    exu_ifu_err_synd_7_m;
   
   wire      sel_rs1_e;
   wire      sel_rs2_e;
   wire      sel_rs3_e;
   wire        sel_rs1_m;
   wire        sel_rs2_m;
   wire        sel_rs3_m;
   wire        safe_sel_rs1_m;
   wire        safe_sel_rs2_m;
   wire        safe_sel_rs3_m;
   wire [2:0]  cwp_e;
   wire [2:0]  cwp_m;
   wire [1:0]  gl_m;
   wire        inj_irferr_m;
   wire        inj_irferr_w;
   wire        detect_ce_e;
   wire        detect_ue_e;
   wire        flag_ecc_ce_e;
   wire        flag_ecc_ue_e;
   wire [4:0]  log_rs_m;
   wire        rs1_ce_m;
   wire        rs1_ue_m;
   wire        rs2_ce_m;
   wire        rs2_ue_m;
   wire        rs3_ue_m;
   wire        rs1_sel_rf_e;
   wire        rs2_sel_rf_e;
   wire        rs3_sel_rf_e;
   wire        vld_rs3_ce_e;
   wire        vld_rs3_ue_e;
   wire        nceen_m;
   
   // Store whether rf value was used for ecc checking
   assign      ecl_ecc_rs1_use_rf_e = rs1_sel_rf_e & rs1_vld_e & ifu_exu_inst_vld_e;
   assign      ecl_ecc_rs2_use_rf_e = rs2_sel_rf_e & rs2_vld_e & ifu_exu_inst_vld_e;
   assign      ecl_ecc_rs3_use_rf_e = rs3_sel_rf_e & rs3_vld_e & ifu_exu_inst_vld_e; 

   dff_s rs1_rf_dff(.din(ecl_byp_rcc_mux2_sel_rf), .clk(clk),
                  .q(rs1_sel_rf_e), .se(se), .si(), .so());
   dff_s rs2_rf_dff(.din(ecl_byp_rs2_mux2_sel_rf), .clk(clk),
                  .q(rs2_sel_rf_e), .se(se), .si(), .so());
   dff_s rs3_rf_dff(.din(ecl_byp_rs3_mux2_sel_rf), .clk(clk),
                  .q(rs3_sel_rf_e), .se(se), .si(), .so());

   assign      vld_rs3_ce_e = ecc_ecl_rs3_ce & ~cancel_rs3_ecc_e;
   assign      vld_rs3_ue_e = ecc_ecl_rs3_ue & ~cancel_rs3_ecc_e;
   assign    detect_ce_e = (ecc_ecl_rs1_ce | ecc_ecl_rs2_ce | vld_rs3_ce_e);
   assign    detect_ue_e = (ecc_ecl_rs1_ue | ecc_ecl_rs2_ue | vld_rs3_ue_e);
   // Generate trap signals
   assign    flag_ecc_ue_e = (detect_ue_e | 
                                    detect_ce_e & ifu_exu_disable_ce_e); // convert ce to ue
   assign    flag_ecc_ce_e = detect_ce_e & ~ifu_exu_disable_ce_e;

   // Pass along signal to fix errors
   dff_s byp_sel_ecc_e2m(.din(flag_ecc_ce_e), .clk(clk), .q(ecl_byp_sel_ecc_m),
                       .se(se), .si(), .so());
   dff_s ecc_ue_e2m(.din(flag_ecc_ue_e), .clk(clk), .q(exu_ifu_ecc_ue_m),
                  .se(se), .si(), .so());
   dff_s nceen_e2m(.din(ifu_exu_nceen_e), .clk(clk), .q(nceen_m), .se(se), .si(), .so());
   assign    ue_trap_m = exu_ifu_ecc_ue_m & nceen_m;
   // only report ce (and replay) if no ue
   assign      exu_ifu_ecc_ce_m = ecl_byp_sel_ecc_m & ~exu_ifu_ecc_ue_m;
   // if globals then report %gl.  otherwise log %cwp
   assign      exu_ifu_err_reg_m[7:5] = (~log_rs_m[4] & ~log_rs_m[3])? {1'b0,gl_m[1:0]}: cwp_m[2:0];
   assign      exu_ifu_err_reg_m[4:0] = log_rs_m[4:0];
   
   // Control for mux to ecc decoder (just ce)
   assign      sel_rs1_e = ecc_ecl_rs1_ce;
   assign      sel_rs2_e = ~ecc_ecl_rs1_ce & ecc_ecl_rs2_ce;
   assign      sel_rs3_e = ~(ecc_ecl_rs1_ce | ecc_ecl_rs2_ce);
   
   dff_s ecc_sel_rs1_dff(.din(sel_rs1_e), .clk(clk), .q(sel_rs1_m),
                       .se(se), .si(), .so());
   dff_s ecc_sel_rs2_dff(.din(sel_rs2_e), .clk(clk), .q(sel_rs2_m),
                       .se(se), .si(), .so());
   dff_s ecc_sel_rs3_dff(.din(sel_rs3_e), .clk(clk), .q(sel_rs3_m),
                       .se(se), .si(), .so());
   // Make selects one hot
   assign      safe_sel_rs1_m = sel_rs1_m | rst_tri_en;
   assign      safe_sel_rs2_m = sel_rs2_m & ~rst_tri_en;
   assign      safe_sel_rs3_m = sel_rs3_m & ~rst_tri_en;
   assign      ecl_ecc_sel_rs1_m_l = ~safe_sel_rs1_m;
   assign      ecl_ecc_sel_rs2_m_l = ~safe_sel_rs2_m;
   assign      ecl_ecc_sel_rs3_m_l = ~safe_sel_rs3_m;

   // Mux to generate the rd for fixed value
   mux3ds #(5) ecc_rd_mux(.dout(eccctl_wb_rd_m[4:0]),
                          .in0(ifu_exu_rs1_m[4:0]),
                          .in1(ifu_exu_rs2_m[4:0]),
                          .in2(ifu_exu_rs3_m[4:0]),
                          .sel0(safe_sel_rs1_m),
                          .sel1(safe_sel_rs2_m),
                          .sel2(safe_sel_rs3_m));

   // Control for muxes for logging errors
   assign      ecl_ecc_log_rs1_m = rs1_ue_m | (rs1_ce_m & ~rs2_ue_m & ~rs3_ue_m);
   assign      ecl_ecc_log_rs2_m = (rs2_ue_m & ~rs1_ue_m) | (rs2_ce_m & ~rs1_ue_m & ~rs1_ce_m & ~rs3_ue_m);
   assign      ecl_ecc_log_rs3_m = ~(ecl_ecc_log_rs1_m | ecl_ecc_log_rs2_m);
   // Mux to generate the rs for error_logging
   mux3ds #(5) ecc_rdlog_mux(.dout(log_rs_m[4:0]),
                          .in0(ifu_exu_rs1_m[4:0]),
                          .in1(ifu_exu_rs2_m[4:0]),
                          .in2(ifu_exu_rs3_m[4:0]),
                          .sel0(ecl_ecc_log_rs1_m),
                          .sel1(ecl_ecc_log_rs2_m),
                          .sel2(ecl_ecc_log_rs3_m));

   dff_s #(3) cwp_d2e(.din(rml_ecl_cwp_d[2:0]), .clk(clk), .q(cwp_e[2:0]),
                    .se(se), .si(), .so());
   dff_s #(3) cwp_e2m(.din(cwp_e[2:0]), .clk(clk), .q(cwp_m[2:0]),
                    .se(se), .si(), .so());
   dff_s #(2) gl_e2m(.din(rml_ecl_gl_e[1:0]), .clk(clk), .q(gl_m[1:0]),
                   .se(se), .si(), .so());

   // Syndrome needs to know if it was really a ce or ue
   mux3ds ecc_synd7_mux(.dout(exu_ifu_err_synd_7_m),
                        .in0(rs1_ce_m),
                        .in1(rs2_ce_m),
                        .in2(~rs3_ue_m),
                        .sel0(ecl_ecc_log_rs1_m),
                        .sel1(ecl_ecc_log_rs2_m),
                        .sel2(ecl_ecc_log_rs3_m));


   // signals for injecting errors
   // inject error if it is enabled and a write will probably happen
   // (don't bother to check kill_w
   assign      inj_irferr_m = wb_eccctl_spec_wen_next & ifu_exu_inj_irferr;
   assign      ecl_byp_ecc_mask_m_l = ~(ifu_exu_ecc_mask[7:0] & {8{inj_irferr_m}});
   dff_s inj_irferr_m2w(.din(inj_irferr_m), .clk(clk), .q(inj_irferr_w),
                      .se(se), .si(), .so());
   assign      exu_ifu_inj_ack = inj_irferr_w;

   // Pipeline Flops
   dff_s rs1_ue_e2m(.din(ecc_ecl_rs1_ue), .clk(clk), .q(rs1_ue_m), .se(se), .si(), .so());
   dff_s rs1_ce_e2m(.din(ecc_ecl_rs1_ce), .clk(clk), .q(rs1_ce_m), .se(se), .si(), .so());
   dff_s rs2_ue_e2m(.din(ecc_ecl_rs2_ue), .clk(clk), .q(rs2_ue_m), .se(se), .si(), .so());
   dff_s rs2_ce_e2m(.din(ecc_ecl_rs2_ce), .clk(clk), .q(rs2_ce_m), .se(se), .si(), .so());
   dff_s rs3_ue_e2m(.din(vld_rs3_ue_e), .clk(clk), .q(rs3_ue_m), .se(se), .si(), .so());
   
endmodule // sparc_exu_ecl_eccctl
