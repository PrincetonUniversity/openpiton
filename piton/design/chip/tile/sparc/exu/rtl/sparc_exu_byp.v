// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_byp.v
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
//  Module Name: sparc_exu_byp
//	Description: This block includes the muxes for the bypassing for all
//		3 register outputs.  It also includes the pipeline registers 
//		for the output of the ALU.  All other operands come from
// 		outside the bypass block.  Rs1_data chooses between the normal
//		bypassing paths and the PC.  Rs2_data chooses between the normal
//		bypassing paths and the immediate.
*/

//PITON_PROTO enables all FPGA related modifications
`ifdef PITON_PROTO 
`define FPGA_SYN_CLK_EN
`define FPGA_SYN_CLK_DFF
`endif

module sparc_exu_byp
( /*AUTOARG*/
   // Outputs
   so, byp_alu_rs1_data_e, byp_alu_rs2_data_e_l, byp_alu_rs2_data_e, 
   exu_lsu_rs3_data_e, exu_spu_rs3_data_e, exu_lsu_rs2_data_e, 
   byp_alu_rcc_data_e, byp_irf_rd_data_w, exu_tlu_wsr_data_m, 
   byp_irf_rd_data_w2, byp_ecc_rs3_data_e, byp_ecc_rcc_data_e, 
   byp_ecl_rs2_31_e, byp_ecl_rs1_31_e, byp_ecl_rs1_63_e, 
   byp_ecl_rs1_2_0_e, byp_ecl_rs2_3_0_e, byp_ecc_rs1_synd_d, 
   byp_ecc_rs2_synd_d, byp_ecc_rs3_synd_d, 
   // Inputs
   rclk, se, si, sehold, ecl_byp_rs1_mux2_sel_e, 
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
   ecl_byp_rs3h_longmux_sel_ldxa, ecl_byp_sel_load_m, 
   ecl_byp_sel_pipe_m, ecl_byp_sel_ecc_m, ecl_byp_sel_muldiv_g, 
   ecl_byp_sel_load_g, ecl_byp_sel_restore_g, ecl_byp_std_e_l, 
   ecl_byp_ldxa_g, alu_byp_rd_data_e, ifu_exu_imm_data_d, 
   irf_byp_rs1_data_d_l, irf_byp_rs2_data_d_l, irf_byp_rs3_data_d_l, 
   irf_byp_rs3h_data_d_l, lsu_exu_dfill_data_g, lsu_exu_ldxa_data_g, 
   div_byp_muldivout_g, ecc_byp_ecc_result_m, ecl_byp_ecc_mask_m_l, 
   ifu_exu_pc_d, ecl_byp_3lsb_m, ecl_byp_restore_m, 
   ecl_byp_sel_restore_m, ecl_byp_eclpr_e, div_byp_yreg_e, 
   ifu_exu_pcver_e, tlu_exu_rsr_data_m, ffu_exu_rsr_data_m, 
   ecl_byp_sel_yreg_e, ecl_byp_sel_eclpr_e, ecl_byp_sel_ifusr_e, 
   ecl_byp_sel_alu_e, ecl_byp_sel_ifex_m, ecl_byp_sel_ffusr_m, 
   ecl_byp_sel_tlusr_m
   );

   input rclk;
   input se;                    // scan enable
   input si;
   input sehold;
   input ecl_byp_rs1_mux2_sel_e;// select lines for bypass muxes for rs1
   input ecl_byp_rs1_mux2_sel_rf;
   input ecl_byp_rs1_mux2_sel_ld;
   input ecl_byp_rs1_mux2_sel_usemux1;
   input ecl_byp_rs1_mux1_sel_m;
   input ecl_byp_rs1_mux1_sel_w;
   input ecl_byp_rs1_mux1_sel_w2;
   input ecl_byp_rs1_mux1_sel_other;
   input ecl_byp_rcc_mux2_sel_e;// select lines for bypass muxes for reg condition code
   input ecl_byp_rcc_mux2_sel_rf;
   input ecl_byp_rcc_mux2_sel_ld;
   input ecl_byp_rcc_mux2_sel_usemux1;
   input ecl_byp_rcc_mux1_sel_m;
   input ecl_byp_rcc_mux1_sel_w;
   input ecl_byp_rcc_mux1_sel_w2;
   input ecl_byp_rcc_mux1_sel_other;
   input ecl_byp_rs2_mux2_sel_e;// select lines for bypass muxes for rs2
   input ecl_byp_rs2_mux2_sel_rf;
   input ecl_byp_rs2_mux2_sel_ld;
   input ecl_byp_rs2_mux2_sel_usemux1;
   input ecl_byp_rs2_mux1_sel_m;
   input ecl_byp_rs2_mux1_sel_w;
   input ecl_byp_rs2_mux1_sel_w2;
   input ecl_byp_rs2_mux1_sel_other;
   input ecl_byp_rs3_mux2_sel_e;// select lines for bypass muxes for rs3
   input ecl_byp_rs3_mux2_sel_rf;
   input ecl_byp_rs3_mux2_sel_ld;
   input ecl_byp_rs3_mux2_sel_usemux1;
   input ecl_byp_rs3_mux1_sel_m;
   input ecl_byp_rs3_mux1_sel_w;
   input ecl_byp_rs3_mux1_sel_w2;
   input ecl_byp_rs3_mux1_sel_other;
   input ecl_byp_rs3h_mux2_sel_e;// select lines for bypass muxes for rs3 double
   input ecl_byp_rs3h_mux2_sel_rf;
   input ecl_byp_rs3h_mux2_sel_ld;
   input ecl_byp_rs3h_mux2_sel_usemux1;
   input ecl_byp_rs3h_mux1_sel_m;
   input ecl_byp_rs3h_mux1_sel_w;
   input ecl_byp_rs3h_mux1_sel_w2;
   input ecl_byp_rs3h_mux1_sel_other;
   input ecl_byp_rs1_longmux_sel_g2;
   input ecl_byp_rs1_longmux_sel_w2;
   input ecl_byp_rs1_longmux_sel_ldxa;
   input ecl_byp_rs2_longmux_sel_g2;
   input ecl_byp_rs2_longmux_sel_w2;
   input ecl_byp_rs2_longmux_sel_ldxa;
   input ecl_byp_rs3_longmux_sel_g2;
   input ecl_byp_rs3_longmux_sel_w2;
   input ecl_byp_rs3_longmux_sel_ldxa;
   input ecl_byp_rs3h_longmux_sel_g2;
   input ecl_byp_rs3h_longmux_sel_w2;
   input ecl_byp_rs3h_longmux_sel_ldxa;
   input ecl_byp_sel_load_m;        // m instruction uses load in w1 port
   input ecl_byp_sel_pipe_m;
   input ecl_byp_sel_ecc_m;
   input ecl_byp_sel_muldiv_g;
   input ecl_byp_sel_load_g;
   input ecl_byp_sel_restore_g;
   input ecl_byp_std_e_l;
   input ecl_byp_ldxa_g;
   input [63:0] alu_byp_rd_data_e;           // data from alu for bypass
   input [31:0] ifu_exu_imm_data_d;     // immediate
   input [71:0] irf_byp_rs1_data_d_l;  // RF rs1_data
   input [71:0] irf_byp_rs2_data_d_l;  // RF rs2_data
   input [71:0] irf_byp_rs3_data_d_l;  // RF rs3_data
   input [31:0] irf_byp_rs3h_data_d_l;// RF rs3 double data
   input [63:0] lsu_exu_dfill_data_g; // load data
   input [63:0] lsu_exu_ldxa_data_g;
   input [63:0] div_byp_muldivout_g;
   input [63:0] ecc_byp_ecc_result_m;// result from ecc
   input [7:0]  ecl_byp_ecc_mask_m_l;
   input [47:0]  ifu_exu_pc_d;
   input [2:0]   ecl_byp_3lsb_m;
   input         ecl_byp_restore_m;
   input         ecl_byp_sel_restore_m;
   input [7:0]   ecl_byp_eclpr_e;
   input [31:0]  div_byp_yreg_e;
   input [63:0]  ifu_exu_pcver_e;
   input [63:0]  tlu_exu_rsr_data_m;
   input [63:0]  ffu_exu_rsr_data_m;
   input         ecl_byp_sel_yreg_e;
   input         ecl_byp_sel_eclpr_e;
   input         ecl_byp_sel_ifusr_e;
   input         ecl_byp_sel_alu_e;
   input         ecl_byp_sel_ifex_m;
   input         ecl_byp_sel_ffusr_m;
   input         ecl_byp_sel_tlusr_m;
 
   output        so;
   output [63:0] byp_alu_rs1_data_e; // rs1_data operand for alu
   output [63:0] byp_alu_rs2_data_e_l; // rs2_data operand for alu
   output [63:0] byp_alu_rs2_data_e;
   output [63:0] exu_lsu_rs3_data_e; // rs3_data operand for lsu
   output [63:0] exu_spu_rs3_data_e;// rs3 data for spu
   output [63:0]  exu_lsu_rs2_data_e;
   output [63:0]  byp_alu_rcc_data_e;// data for reg condition codes
   output [71:0] byp_irf_rd_data_w;
   output [63:0] exu_tlu_wsr_data_m;          // data for writeback
   output [71:0] byp_irf_rd_data_w2;
   output [63:0] byp_ecc_rs3_data_e;
   output [63:0] byp_ecc_rcc_data_e;
   output        byp_ecl_rs2_31_e;
   output        byp_ecl_rs1_31_e;
   output        byp_ecl_rs1_63_e;
   output [2:0]  byp_ecl_rs1_2_0_e;
   output [3:0]  byp_ecl_rs2_3_0_e;
   output [7:0]  byp_ecc_rs1_synd_d;
   output [7:0]  byp_ecc_rs2_synd_d;
   output [7:0]  byp_ecc_rs3_synd_d;

   wire          clk;
   wire          sehold_clk;
   wire [63:0] irf_byp_rs1_data_d;  // RF rs1_data
   wire [63:0] irf_byp_rs2_data_d;  // RF rs2_data
   wire [63:0] irf_byp_rs3_data_d;  // RF rs3_data
   wire [31:0] irf_byp_rs3h_data_d;  // RF rs3_data double
   wire [63:0] byp_alu_rs1_data_d; // rs1 operand for alu
   wire [63:0] byp_alu_rcc_data_d; // rcc operand for alu
   wire [63:0] byp_alu_rs2_data_d; // rs2_data operand for alu
   wire [63:0]   rd_data_e;          // e stage rd_data
   wire [63:0]   rd_data_m;          // m stage non-load rd_data
   wire [63:0]   full_rd_data_m;          // m stage non-load rd_data including rdsr
   wire [63:0]   rd_data_g;
   wire [63:0]   byp_irf_rd_data_m;// m stage rd_data
   wire [63:0]   rs1_data_btwn_mux;  // intermediate net for rs1_data muxes
   wire [63:0]   rcc_data_btwn_mux;  // intermediate net for rs1_data muxes
   wire [63:0]   rs2_data_btwn_mux;  // intermediate net for rs2_data muxes
   wire [63:0]   rs3_data_btwn_mux;  // intermediate net for rs3_data muxes
   wire [31:0]   rs3h_data_btwn_mux;  // intermediate net for rs3h_data muxes
   wire [63:0]   rs3_data_d;
   wire [63:0]   rs3_data_e;
   wire [31:0]   rs3h_data_d;
   wire [31:0]   rs3h_data_e;
   wire [63:0]   restore_rd_data;
   wire [63:0]   restore_rd_data_next;
   wire [63:0]   dfill_data_g;
   wire [63:0]   dfill_data_g2;
   wire          ecl_byp_std_e;
   wire [7:0]    rd_synd_w_l;
   wire [7:0]    rd_synd_w2_l;

   assign        clk = rclk;
`ifdef FPGA_SYN_CLK_EN
`else
   clken_buf irf_write_clkbuf (	
                                .rclk   (clk),
                                .enb_l  (sehold),
                                .tmb_l  (~se),
                                .clk    (sehold_clk)
                                ) ;
`endif
   
   
   assign        byp_ecc_rs1_synd_d[7:0] = ~irf_byp_rs1_data_d_l[71:64];
   assign        byp_ecc_rs2_synd_d[7:0] = ~irf_byp_rs2_data_d_l[71:64];
   assign        byp_ecc_rs3_synd_d[7:0] = ~irf_byp_rs3_data_d_l[71:64];
   /////////////////////////////////////////
   // Load returns go straight into a flop after mux with ldxa_data
   /////////////////////////////////////////
   dp_mux2es #(64) dfill_data_mux (.dout(dfill_data_g[63:0]),
                                   .in0(lsu_exu_dfill_data_g[63:0]),
                                   .in1(lsu_exu_ldxa_data_g[63:0]),
                                   .sel(ecl_byp_ldxa_g));
   dff_s #(64) dfill_data_dff (.din(dfill_data_g[63:0]), .clk(clk),
                             .q(dfill_data_g2[63:0]), .se(se), .si(), .so());
   
   //////////////////////////////////////////////////
   // RD of PR or SR
   //////////////////////////////////////////////////
   
   // Mux outputs for rdpr/rdsr
   mux4ds #(64) ifu_exu_sr_mux(.dout(rd_data_e[63:0]),
                               .in0({32'b0, div_byp_yreg_e[31:0]}),
                               .in1({56'b0, ecl_byp_eclpr_e[7:0]}),
                               .in2(ifu_exu_pcver_e[63:0]),
                               .in3(alu_byp_rd_data_e[63:0]),
                               .sel0(ecl_byp_sel_yreg_e),
                               .sel1(ecl_byp_sel_eclpr_e),
                               .sel2(ecl_byp_sel_ifusr_e),
                               .sel3(ecl_byp_sel_alu_e));
   
   // mux in the rdsr data from ffu and tlu
   mux3ds #(64) sr_out_mux(.dout(full_rd_data_m[63:0]),
                           .in0({rd_data_m[63:3], ecl_byp_3lsb_m[2:0]}),
                           .in1(ffu_exu_rsr_data_m[63:0]),
                           .in2(tlu_exu_rsr_data_m[63:0]),
                           .sel0(ecl_byp_sel_ifex_m),
                           .sel1(ecl_byp_sel_ffusr_m),
                           .sel2(ecl_byp_sel_tlusr_m));
   
   // Pipeline registers for rd_data
   dff_s #(64) dff_rd_data_e2m(.din(rd_data_e[63:0]), .clk(clk), .q(rd_data_m[63:0]),
                           .se(se), .si(), .so());
   dp_buffer #(64) wsr_data_buf(.dout(exu_tlu_wsr_data_m[63:0]), .in(rd_data_m[63:0]));
   
   // Flop for storing result from restore
   dp_mux2es #(64) restore_buf_mux(.dout(restore_rd_data_next[63:0]),
                                   .in0(restore_rd_data[63:0]),
                                   .in1(rd_data_m[63:0]),
                                   .sel(ecl_byp_restore_m));
   dff_s #(64) dff_restore_buf(.din(restore_rd_data_next[63:0]),
                             .q(restore_rd_data[63:0]), .clk(clk),
                             .se(se), .si(), .so());
   // Mux for rd_data_m between ALU and load data and ECC result and restore result
   mux4ds #(64) rd_data_m_mux(.dout(byp_irf_rd_data_m[63:0]), 
                              .in0(full_rd_data_m[63:0]),
                              .in1(dfill_data_g2[63:0]),
                              .in2(ecc_byp_ecc_result_m[63:0]),
                              .in3(restore_rd_data[63:0]),
                              .sel0(ecl_byp_sel_pipe_m), 
                              .sel1(ecl_byp_sel_load_m),
                              .sel2(ecl_byp_sel_ecc_m),
                              .sel3(ecl_byp_sel_restore_m));
`ifdef FPGA_SYN_CLK_DFF
   dffe_s #(64) dff_rd_data_m2w(.din(byp_irf_rd_data_m[63:0]), .en (~(sehold)), .clk(clk), .q(byp_irf_rd_data_w[63:0]),
                           .se(se), .si(), .so());
`else
   dff_s #(64) dff_rd_data_m2w(.din(byp_irf_rd_data_m[63:0]), .clk(sehold_clk), .q(byp_irf_rd_data_w[63:0]),
                           .se(se), .si(), .so());
`endif

   // W2 flop
`ifdef FPGA_SYN_CLK_DFF
   dffe_s #(64) dff_rd_data_g2w(.din(rd_data_g[63:0]), .en (~(sehold)), .clk(clk), .q(byp_irf_rd_data_w2[63:0]),
                           .se(se), .si(), .so());
`else
   dff_s #(64) dff_rd_data_g2w(.din(rd_data_g[63:0]), .clk(sehold_clk), .q(byp_irf_rd_data_w2[63:0]),
                           .se(se), .si(), .so());
`endif
   
   
   // D-E pipeline registers for rs_data
   dff_s #(64) rs1_data_dff(.din(byp_alu_rs1_data_d[63:0]), .clk(clk),
                        .q(byp_alu_rs1_data_e[63:0]), .se(se),
                        .si(), .so());
   dff_s #(64) rs2_data_dff(.din(byp_alu_rs2_data_d[63:0]), .clk(clk), 
                        .q(byp_alu_rs2_data_e[63:0]), .se(se),
                        .si(), .so());
   assign        byp_alu_rs2_data_e_l[63:0] = ~byp_alu_rs2_data_e[63:0];
   assign        byp_ecl_rs2_31_e = byp_alu_rs2_data_e[31];
   assign        byp_ecl_rs1_63_e = byp_alu_rs1_data_e[63];
   assign        byp_ecl_rs1_31_e = byp_alu_rs1_data_e[31];
   assign        byp_ecl_rs1_2_0_e[2:0] = byp_alu_rs1_data_e[2:0];
   assign        byp_ecl_rs2_3_0_e[3:0] = byp_alu_rs2_data_e[3:0];
   

   dff_s #(64) rs3_data_dff(.din(rs3_data_d[63:0]), .clk(clk), 
                        .q(rs3_data_e[63:0]), .se(se),
                        .si(), .so());
   dff_s #(32) rs3h_data_dff(.din(rs3h_data_d[31:0]), .clk(clk), 
                           .q(rs3h_data_e[31:0]), .se(se),
                           .si(), .so());
   dff_s #(64) rcc_data_dff(.din(byp_alu_rcc_data_d[63:0]), .clk(clk), 
                        .q(byp_alu_rcc_data_e[63:0]), .se(se),
                        .si(), .so());

   assign        ecl_byp_std_e = ~ecl_byp_std_e_l;
   dp_mux2es #(64) rs2_data_out_mux(.dout(exu_lsu_rs2_data_e[63:0]),
                                    .in0(byp_alu_rs2_data_e[63:0]),
                                    .in1(rs3_data_e[63:0]),
                                    .sel(ecl_byp_std_e));
   dp_mux2es #(64) rs3_data_out_mux(.dout(exu_lsu_rs3_data_e[63:0]),
                                    .in0(rs3_data_e[63:0]),
                                    .in1({32'b0,rs3h_data_e[31:0]}),
                                    .sel(ecl_byp_std_e));
   // part of rs3 goes to spu.  Buffer off to help timing/loading
   assign        exu_spu_rs3_data_e[63:0] = rs3_data_e[63:0];
   
   assign        byp_ecc_rs3_data_e[63:0] = rs3_data_e[63:0];
   assign        byp_ecc_rcc_data_e[63:0] = byp_alu_rcc_data_e[63:0];
   
   // Forwarding Muxes
   // Select lines are as follows:
   // mux1[M, W, W2, OTHER(optional)]
   // mux2[mux1, RF, E, LD]
   assign        irf_byp_rs1_data_d[63:0] = ~irf_byp_rs1_data_d_l[63:0];
   assign        irf_byp_rs2_data_d[63:0] = ~irf_byp_rs2_data_d_l[63:0];
   assign        irf_byp_rs3_data_d[63:0] = ~irf_byp_rs3_data_d_l[63:0];
   assign        irf_byp_rs3h_data_d[31:0] = ~irf_byp_rs3h_data_d_l[31:0];

/* -----\/----- EXCLUDED -----\/-----
   // the w2 bypass path is either what is being written that cycle
   // or the load result that will be written next cycle.
 -----/\----- EXCLUDED -----/\----- */
   wire [63:0]   rs1_data_w2;
   wire [63:0]   rs2_data_w2;
   wire [63:0]   rs3_data_w2;
   wire [31:0]   rs3h_data_w2;
   mux3ds #(64) rs1_w2_mux(.dout(rs1_data_w2[63:0]),
                           .in0(byp_irf_rd_data_w2[63:0]),
                           .in1(dfill_data_g2[63:0]),
                           .in2(lsu_exu_ldxa_data_g[63:0]),
                           .sel0(ecl_byp_rs1_longmux_sel_w2),
                           .sel1(ecl_byp_rs1_longmux_sel_g2),
                           .sel2(ecl_byp_rs1_longmux_sel_ldxa));
   mux3ds #(64) rs2_w2_mux(.dout(rs2_data_w2[63:0]),
                           .in0(byp_irf_rd_data_w2[63:0]),
                           .in1(dfill_data_g2[63:0]),
                           .in2(lsu_exu_ldxa_data_g[63:0]),
                           .sel0(ecl_byp_rs2_longmux_sel_w2),
                           .sel1(ecl_byp_rs2_longmux_sel_g2),
                           .sel2(ecl_byp_rs2_longmux_sel_ldxa));
   mux3ds #(64) rs3_w2_mux(.dout(rs3_data_w2[63:0]),
                           .in0(byp_irf_rd_data_w2[63:0]),
                           .in1(dfill_data_g2[63:0]),
                           .in2(lsu_exu_ldxa_data_g[63:0]),
                           .sel0(ecl_byp_rs3_longmux_sel_w2),
                           .sel1(ecl_byp_rs3_longmux_sel_g2),
                           .sel2(ecl_byp_rs3_longmux_sel_ldxa));
   mux3ds #(32) rs3h_w2_mux(.dout(rs3h_data_w2[31:0]),
                            .in0(byp_irf_rd_data_w2[31:0]),
                            .in1(dfill_data_g2[31:0]),
                            .in2(lsu_exu_ldxa_data_g[31:0]),
                            .sel0(ecl_byp_rs3h_longmux_sel_w2),
                            .sel1(ecl_byp_rs3h_longmux_sel_g2),
                            .sel2(ecl_byp_rs3h_longmux_sel_ldxa));
                              
   
   // rs1_data muxes: RF and E are critical paths
   mux4ds #(64) mux_rs1_data_1(.dout(rs1_data_btwn_mux[63:0]), 
                               .in0(rd_data_m[63:0]),
                               .in1(byp_irf_rd_data_w[63:0]),
                               .in2(rs1_data_w2[63:0]), 
                               .in3({{16{ifu_exu_pc_d[47]}}, ifu_exu_pc_d[47:0]}),
                             .sel0(ecl_byp_rs1_mux1_sel_m),
                             .sel1(ecl_byp_rs1_mux1_sel_w),
                             .sel2(ecl_byp_rs1_mux1_sel_w2),
                             .sel3(ecl_byp_rs1_mux1_sel_other));
   mux4ds #(64) mux_rs1_data_2(.dout(byp_alu_rs1_data_d[63:0]),
                             .in0(rs1_data_btwn_mux[63:0]),
                             .in1(irf_byp_rs1_data_d[63:0]), 
                             .in2(alu_byp_rd_data_e[63:0]),
                             .in3(lsu_exu_dfill_data_g[63:0]),
                             .sel0(ecl_byp_rs1_mux2_sel_usemux1),
                             .sel1(ecl_byp_rs1_mux2_sel_rf),
                             .sel2(ecl_byp_rs1_mux2_sel_e),
                             .sel3(ecl_byp_rs1_mux2_sel_ld));
   
   // rcc_data muxes: RF and E are critical paths
   mux4ds #(64) mux_rcc_data_1(.dout(rcc_data_btwn_mux[63:0]), 
                               .in0(rd_data_m[63:0]),
                               .in1(byp_irf_rd_data_w[63:0]),
                               .in2(rs1_data_w2[63:0]), 
                               .in3({64{1'b0}}),
                             .sel0(ecl_byp_rcc_mux1_sel_m),
                             .sel1(ecl_byp_rcc_mux1_sel_w),
                             .sel2(ecl_byp_rcc_mux1_sel_w2),
                             .sel3(ecl_byp_rcc_mux1_sel_other));
   mux4ds #(64) mux_rcc_data_2(.dout(byp_alu_rcc_data_d[63:0]),
                             .in0(rcc_data_btwn_mux[63:0]),
                             .in1(irf_byp_rs1_data_d[63:0]), 
                             .in2(alu_byp_rd_data_e[63:0]),
                             .in3(lsu_exu_dfill_data_g[63:0]),
                             .sel0(ecl_byp_rcc_mux2_sel_usemux1),
                             .sel1(ecl_byp_rcc_mux2_sel_rf),
                             .sel2(ecl_byp_rcc_mux2_sel_e),
                             .sel3(ecl_byp_rcc_mux2_sel_ld));

   // rs2_data muxes: RF and E are critical paths, optional is imm
   mux4ds #(64) mux_rs2_data_1(.dout(rs2_data_btwn_mux[63:0]), 
                             .in0(rd_data_m[63:0]),
                             .in1(byp_irf_rd_data_w[63:0]),
                             .in2(rs2_data_w2[63:0]),
                             .in3({{32{ifu_exu_imm_data_d[31]}},
                                   ifu_exu_imm_data_d[31:0]}),
                             .sel0(ecl_byp_rs2_mux1_sel_m),
                             .sel1(ecl_byp_rs2_mux1_sel_w),
                             .sel2(ecl_byp_rs2_mux1_sel_w2),
                             .sel3(ecl_byp_rs2_mux1_sel_other));
   mux4ds #(64) mux_rs2_data_2(.dout(byp_alu_rs2_data_d[63:0]),
                             .in0(rs2_data_btwn_mux[63:0]),
                             .in1(irf_byp_rs2_data_d[63:0]), 
                             .in2(alu_byp_rd_data_e[63:0]),
                             .in3(lsu_exu_dfill_data_g[63:0]),
                             .sel0(ecl_byp_rs2_mux2_sel_usemux1),
                             .sel1(ecl_byp_rs2_mux2_sel_rf),
                             .sel2(ecl_byp_rs2_mux2_sel_e),
                             .sel3(ecl_byp_rs2_mux2_sel_ld));
   
   // rs3_data muxes: RF and E are critical paths, no optional
   mux4ds #(64) mux_rs3_data_1(.dout(rs3_data_btwn_mux[63:0]), 
                                .in0(rd_data_m[63:0]),
                             .in1(byp_irf_rd_data_w[63:0]),
                             .in2(rs3_data_w2[63:0]), .in3({64{1'b0}}),
                             .sel0(ecl_byp_rs3_mux1_sel_m),
                             .sel1(ecl_byp_rs3_mux1_sel_w),
                             .sel2(ecl_byp_rs3_mux1_sel_w2),
                             .sel3(ecl_byp_rs3_mux1_sel_other));
   mux4ds #(64) mux_rs3_data_2(.dout(rs3_data_d[63:0]), 
                                .in0(rs3_data_btwn_mux[63:0]),
                                .in1(irf_byp_rs3_data_d[63:0]), 
                                .in2(alu_byp_rd_data_e[63:0]),
                                .in3(lsu_exu_dfill_data_g[63:0]),
                                .sel0(ecl_byp_rs3_mux2_sel_usemux1),
                                .sel1(ecl_byp_rs3_mux2_sel_rf),
                                .sel2(ecl_byp_rs3_mux2_sel_e),
                                .sel3(ecl_byp_rs3_mux2_sel_ld));
   
   // rs3_data muxes: RF and E are critical paths, no optional
   mux4ds #(32) mux_rs3h_data_1(.dout(rs3h_data_btwn_mux[31:0]), 
                                .in0(rd_data_m[31:0]),
                             .in1(byp_irf_rd_data_w[31:0]),
                             .in2(rs3h_data_w2[31:0]), .in3({32{1'b0}}),
                             .sel0(ecl_byp_rs3h_mux1_sel_m),
                             .sel1(ecl_byp_rs3h_mux1_sel_w),
                             .sel2(ecl_byp_rs3h_mux1_sel_w2),
                             .sel3(ecl_byp_rs3h_mux1_sel_other));
   mux4ds #(32) mux_rs3h_data_2(.dout(rs3h_data_d[31:0]), 
                                .in0(rs3h_data_btwn_mux[31:0]),
                                .in1(irf_byp_rs3h_data_d[31:0]), 
                                .in2(alu_byp_rd_data_e[31:0]),
                                .in3(lsu_exu_dfill_data_g[31:0]),
                                .sel0(ecl_byp_rs3h_mux2_sel_usemux1),
                                .sel1(ecl_byp_rs3h_mux2_sel_rf),
                                .sel2(ecl_byp_rs3h_mux2_sel_e),
                                .sel3(ecl_byp_rs3h_mux2_sel_ld));
 
   // ECC for W1
`ifdef FPGA_SYN_CLK_DFF
   sparc_exu_byp_eccgen w1_eccgen(.d(byp_irf_rd_data_m[63:0]),
                                   .msk(ecl_byp_ecc_mask_m_l[7:0]),
                                   .p(rd_synd_w_l[7:0]),
                                  .clk(clk), .se(se));
`else
   sparc_exu_byp_eccgen w1_eccgen(.d(byp_irf_rd_data_m[63:0]),
                                   .msk(ecl_byp_ecc_mask_m_l[7:0]),
                                   .p(rd_synd_w_l[7:0]),
                                  .clk(sehold_clk), .se(se));
`endif
   assign        byp_irf_rd_data_w[71:64] = ~rd_synd_w_l[7:0];
   
   ////////////////////////
   // G arbitration muxes and W2 ECC
   ////////////////////////
   mux3ds #(64) mux_w2_data(.dout(rd_data_g[63:0]),
                            .in0(div_byp_muldivout_g[63:0]),
                            .in1(dfill_data_g2[63:0]),
                            .in2(restore_rd_data[63:0]),
                            .sel0(ecl_byp_sel_muldiv_g),
                            .sel1(ecl_byp_sel_load_g),
                            .sel2(ecl_byp_sel_restore_g));
`ifdef FPGA_SYN_CLK_DFF
   sparc_exu_byp_eccgen w2_eccgen(.d(rd_data_g[63:0]),
                                   .msk(ecl_byp_ecc_mask_m_l[7:0]),
                                  .p(rd_synd_w2_l[7:0]),
                                  .clk(clk), .se(se));
`else
   sparc_exu_byp_eccgen w2_eccgen(.d(rd_data_g[63:0]),
                                   .msk(ecl_byp_ecc_mask_m_l[7:0]),
                                  .p(rd_synd_w2_l[7:0]),
                                  .clk(sehold_clk), .se(se));
`endif
   assign        byp_irf_rd_data_w2[71:64] = ~rd_synd_w2_l[7:0];
   
endmodule // sparc_exu_byp

   
