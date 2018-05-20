// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: sparc_exu_alu.v
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
//  Module Name: sparc_exu_alu
*/

module sparc_exu_alu
(
 /*AUTOARG*/
   // Outputs
   so, alu_byp_rd_data_e, exu_ifu_brpc_e, exu_lsu_ldst_va_e,
   exu_lsu_early_va_e, exu_mmu_early_va_e, alu_ecl_add_n64_e,
   alu_ecl_add_n32_e, alu_ecl_log_n64_e, alu_ecl_log_n32_e,
   alu_ecl_zhigh_e, alu_ecl_zlow_e, exu_ifu_regz_e, exu_ifu_regn_e,
   alu_ecl_adderin2_63_e, alu_ecl_adderin2_31_e,
   alu_ecl_adder_out_63_e, alu_ecl_cout32_e, alu_ecl_cout64_e_l,
   alu_ecl_mem_addr_invalid_e_l,
   // Inputs
   rclk, se, si, byp_alu_rs1_data_e, byp_alu_rs2_data_e_l,
   byp_alu_rs3_data_e, byp_alu_rcc_data_e, ecl_alu_cin_e,
   ifu_exu_invert_d, ecl_alu_log_sel_and_e, ecl_alu_log_sel_or_e,
   ecl_alu_log_sel_xor_e, ecl_alu_log_sel_move_e,
   ecl_alu_out_sel_sum_e_l, ecl_alu_out_sel_rs3_e_l,
   ecl_alu_out_sel_shift_e_l, ecl_alu_out_sel_logic_e_l,
   shft_alu_shift_out_e, ecl_alu_sethi_inst_e, ifu_lsu_casa_e
   );
   input rclk;
   input se;
   input si;
   input [63:0] byp_alu_rs1_data_e;   // source operand 1
   input [63:0] byp_alu_rs2_data_e_l;  // source operand 2
   input [63:0] byp_alu_rs3_data_e;  // source operand 3
   input [63:0] byp_alu_rcc_data_e;  // source operand for reg condition codes
   input        ecl_alu_cin_e;            // cin for adder
   input        ifu_exu_invert_d;
   input  ecl_alu_log_sel_and_e;// These 4 wires are select lines for the logic
   input  ecl_alu_log_sel_or_e;// block mux.  They are active high and choose the
   input  ecl_alu_log_sel_xor_e;// output they describe.
   input  ecl_alu_log_sel_move_e;
   input  ecl_alu_out_sel_sum_e_l;// The following 4 are select lines for
   input  ecl_alu_out_sel_rs3_e_l;// the output stage mux.  They are active high
   input  ecl_alu_out_sel_shift_e_l;// and choose the output of the respective block.
   input  ecl_alu_out_sel_logic_e_l;
   input [63:0] shft_alu_shift_out_e;// result from shifter
   input        ecl_alu_sethi_inst_e;
   input        ifu_lsu_casa_e;

   output       so;
   output [63:0] alu_byp_rd_data_e;          // alu result
   output [47:0] exu_ifu_brpc_e;// branch pc output
   output [47:0] exu_lsu_ldst_va_e; // address for lsu
   output [`L1D_ADDRESS_HI:3] exu_lsu_early_va_e; // faster bits for cache
   output [7:0]  exu_mmu_early_va_e;
   output        alu_ecl_add_n64_e;
   output        alu_ecl_add_n32_e;
   output        alu_ecl_log_n64_e;
   output        alu_ecl_log_n32_e;
   output        alu_ecl_zhigh_e;
   output        alu_ecl_zlow_e;
   output    exu_ifu_regz_e;              // rs1_data == 0
   output    exu_ifu_regn_e;
   output    alu_ecl_adderin2_63_e;
   output    alu_ecl_adderin2_31_e;
   output    alu_ecl_adder_out_63_e;
   output    alu_ecl_cout32_e;       // To ecl of sparc_exu_ecl.v
   output    alu_ecl_cout64_e_l;       // To ecl of sparc_exu_ecl.v
   output    alu_ecl_mem_addr_invalid_e_l;// adder_out[63:48] not all 1 or all 0

   wire         clk;
   wire [63:0] logic_out;       // result of logic block
   wire [63:0] adder_out;       // result of adder
   wire [63:0] spr_out;         // result of sum predict
   wire [63:0] zcomp_in;        // result going to zcompare
   wire [63:0] va_e;            // complete va
   wire [63:0] byp_alu_rs2_data_e;
   wire        invert_e;
   wire        ecl_alu_out_sel_sum_e;
   wire        ecl_alu_out_sel_rs3_e;
   wire        ecl_alu_out_sel_shift_e;
   wire        ecl_alu_out_sel_logic_e;
   assign      clk = rclk;
   assign      byp_alu_rs2_data_e[63:0] = ~byp_alu_rs2_data_e_l[63:0];
   assign      ecl_alu_out_sel_sum_e = ~ecl_alu_out_sel_sum_e_l;
   assign      ecl_alu_out_sel_rs3_e = ~ecl_alu_out_sel_rs3_e_l;
   assign      ecl_alu_out_sel_shift_e = ~ecl_alu_out_sel_shift_e_l;
   assign      ecl_alu_out_sel_logic_e = ~ecl_alu_out_sel_logic_e_l;

   // Zero comparison for exu_ifu_regz_e
   // Tri: adds dummy output zero32 to get rid of the vcs warning
   sparc_exu_aluzcmp64 regzcmp(.in(byp_alu_rcc_data_e[63:0]), .zero64(exu_ifu_regz_e), .zero32());
   assign     exu_ifu_regn_e = byp_alu_rcc_data_e[63];

   // mux between adder output and rs1 (for casa) for lsu va
   dp_mux2es #(64)  lsu_va_mux(.dout(va_e[63:0]),
                               .in0(adder_out[63:0]),
                               .in1(byp_alu_rs1_data_e[63:0]),
                               .sel(ifu_lsu_casa_e));
   assign     exu_lsu_ldst_va_e[47:0] = va_e[47:0];
   // for bits 10:4 we have a separate bus that is not used for cas
   assign     exu_lsu_early_va_e[`L1D_ADDRESS_HI:3] = adder_out[`L1D_ADDRESS_HI:3];
   // mmu needs bits 7:0
   assign     exu_mmu_early_va_e[7:0] = adder_out[7:0];


   // Adder
   assign     exu_ifu_brpc_e[47:0] = adder_out[47:0];
   assign     alu_ecl_adder_out_63_e = adder_out[63];
   sparc_exu_aluaddsub addsub(.adder_out(adder_out[63:0]),
                              /*AUTOINST*/
                              // Outputs
                              .spr_out  (spr_out[63:0]),
                              .alu_ecl_cout64_e_l(alu_ecl_cout64_e_l),
                              .alu_ecl_cout32_e(alu_ecl_cout32_e),
                              .alu_ecl_adderin2_63_e(alu_ecl_adderin2_63_e),
                              .alu_ecl_adderin2_31_e(alu_ecl_adderin2_31_e),
                              // Inputs
                              .clk      (clk),
                              .se       (se),
                              .byp_alu_rs1_data_e(byp_alu_rs1_data_e[63:0]),
                              .byp_alu_rs2_data_e(byp_alu_rs2_data_e[63:0]),
                              .ecl_alu_cin_e(ecl_alu_cin_e),
                              .ifu_exu_invert_d(ifu_exu_invert_d));

   // Logic/pass rs2_data
   dff_s invert_d2e(.din(ifu_exu_invert_d), .clk(clk), .q(invert_e), .se(se), .si(), .so());
   sparc_exu_alulogic logic_mod(.rs1_data(byp_alu_rs1_data_e[63:0]),
                            .rs2_data(byp_alu_rs2_data_e[63:0]),
                            .isand(ecl_alu_log_sel_and_e),
                            .isor(ecl_alu_log_sel_or_e),
                            .isxor(ecl_alu_log_sel_xor_e),
                            .pass_rs2_data(ecl_alu_log_sel_move_e),
                            .inv_logic(invert_e), .logic_out(logic_out[63:0]),
                            .ifu_exu_sethi_inst_e(ecl_alu_sethi_inst_e));

   // Mux between sum predict and logic outputs for zcc
   dp_mux2es #(64)  zcompmux(.dout(zcomp_in[63:0]),
                           .in0(logic_out[63:0]),
                           .in1(spr_out[63:0]),
                           .sel(ecl_alu_out_sel_sum_e));

   // Zero comparison for zero cc
//   sparc_exu_aluzcmp64 zcccmp(.in(zcomp_in[63:0]), .zero64(alu_ecl_z64_e),
//                          .zero32(alu_ecl_z32_e));
   assign        alu_ecl_zlow_e = ~(|zcomp_in[31:0]);
   assign        alu_ecl_zhigh_e = ~(|zcomp_in[63:32]);

   // Get Negative ccs
   assign   alu_ecl_add_n64_e = adder_out[63];
   assign   alu_ecl_add_n32_e = adder_out[31];
   assign   alu_ecl_log_n64_e = logic_out[63];
   assign   alu_ecl_log_n32_e = logic_out[31];


   // Mux for output
   mux4ds #(64) output_mux(.dout(alu_byp_rd_data_e[63:0]),
                         .in0(adder_out[63:0]),
                         .in1(byp_alu_rs3_data_e[63:0]),
                         .in2(shft_alu_shift_out_e[63:0]),
                         .in3(logic_out[63:0]),
                         .sel0(ecl_alu_out_sel_sum_e),
                         .sel1(ecl_alu_out_sel_rs3_e),
                         .sel2(ecl_alu_out_sel_shift_e),
                         .sel3(ecl_alu_out_sel_logic_e));

   // memory address checks
   sparc_exu_alu_16eql chk_mem_addr(.equal(alu_ecl_mem_addr_invalid_e_l),
                                    .in(va_e[63:47]));

endmodule  // sparc_exu_alu
