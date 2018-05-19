// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: playback_dump.v
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

module playback_dump();

integer fid;
reg clk_start;
reg core_ref_clk;
reg io_clk;

initial begin
   fid = $fopen("stimuli.txt","w");
   clk_start = 1'b0;
   core_ref_clk = 1'b0;
   forever #500 core_ref_clk = ~core_ref_clk;
end


wire [268:0] input_vector = {
    cmp_top.chip.tile0.core.sparc0.ffu.arst_l,
    cmp_top.chip.tile0.core.sparc0.ffu.grst_l,
    cmp_top.chip.tile0.core.sparc0.ffu.lsu_ffu_st_dtlb_perr_g,
    cmp_top.chip.tile0.core.sparc0.ffu.exu_ffu_ist_e,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_ffu_tid_d,
    cmp_top.chip.tile0.core.sparc0.ffu.cpx_fpu_data,
    cmp_top.chip.tile0.core.sparc0.ffu.cpx_vld,
    cmp_top.chip.tile0.core.sparc0.ffu.cpx_fcmp,
    cmp_top.chip.tile0.core.sparc0.ffu.cpx_req,
    cmp_top.chip.tile0.core.sparc0.ffu.cpx_fccval,
    cmp_top.chip.tile0.core.sparc0.ffu.cpx_fpexc,
    cmp_top.chip.tile0.core.sparc0.ffu.exu_ffu_gsr_mask_m,
    cmp_top.chip.tile0.core.sparc0.ffu.exu_ffu_gsr_scale_m,
    cmp_top.chip.tile0.core.sparc0.ffu.exu_ffu_gsr_align_m,
    cmp_top.chip.tile0.core.sparc0.ffu.exu_ffu_gsr_rnd_m,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_ffu_ldst_single_d,
    cmp_top.chip.tile0.core.sparc0.ffu.exu_ffu_wsr_inst_e,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_exu_disable_ce_e,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_exu_ecc_mask,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_exu_nceen_e,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_ffu_fcc_num_d,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_ffu_fld_d,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_ffu_fpop1_d,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_ffu_fpop2_d,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_ffu_fpopcode_d,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_ffu_frd_d,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_ffu_frs1_d,        
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_ffu_frs2_d,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_ffu_fst_d,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_ffu_inj_frferr,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_ffu_ldfsr_d,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_ffu_ldxfsr_d,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_ffu_mvcnd_m,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_ffu_quad_op_e,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_ffu_stfsr_d,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_ffu_visop_d,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_lsu_ld_inst_e,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_tlu_flsh_inst_e,  
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_tlu_flush_w,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_tlu_inst_vld_w,
    cmp_top.chip.tile0.core.sparc0.ffu.ifu_tlu_sraddr_d,
    cmp_top.chip.tile0.core.sparc0.ffu.lsu_ffu_ack,
    cmp_top.chip.tile0.core.sparc0.ffu.lsu_ffu_bld_cnt_w,
    cmp_top.chip.tile0.core.sparc0.ffu.lsu_ffu_blk_asi_e,
    cmp_top.chip.tile0.core.sparc0.ffu.lsu_ffu_flush_pipe_w,
    cmp_top.chip.tile0.core.sparc0.ffu.lsu_ffu_ld_data,
    cmp_top.chip.tile0.core.sparc0.ffu.lsu_ffu_ld_vld,
    cmp_top.chip.tile0.core.sparc0.ffu.lsu_ffu_stb_full0,
    cmp_top.chip.tile0.core.sparc0.ffu.lsu_ffu_stb_full1,
    cmp_top.chip.tile0.core.sparc0.ffu.lsu_ffu_stb_full2,      
    cmp_top.chip.tile0.core.sparc0.ffu.lsu_ffu_stb_full3,
    cmp_top.chip.tile0.core.sparc0.ffu.rtap_srams_bist_command,
    cmp_top.chip.tile0.core.sparc0.ffu.rtap_srams_bist_data

};

wire [197:0] output_vector = {
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_lsu_data,
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_ifu_cc_vld_w2,
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_ifu_cc_w2,
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_ifu_ecc_ce_w2,      
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_ifu_ecc_ue_w2,
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_ifu_err_reg_w2,
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_ifu_err_synd_w2,
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_ifu_fpop_done_w2,
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_ifu_fst_ce_w,
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_ifu_inj_ack,
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_ifu_stallreq,
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_ifu_tid_w2,
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_lsu_blk_st_e,
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_lsu_blk_st_va_e,
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_lsu_fpop_rq_vld,
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_lsu_kill_fst_w,
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_tlu_fpu_cmplt,
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_tlu_fpu_tid,
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_tlu_ill_inst_m,
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_tlu_trap_ieee754,
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_tlu_trap_other,
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_tlu_trap_ue,
   cmp_top.chip.tile0.core.sparc0.ffu.ffu_exu_rsr_data_m,
    cmp_top.chip.tile0.core.sparc0.ffu.srams_rtap_data
};

wire clock_vector = cmp_top.chip.tile0.core.sparc0.ffu.rclk;

always @(posedge core_ref_clk) begin
  if(~clk_start) begin
    $fdisplay(fid, "%b\n%b\n", {1'b0,input_vector}, output_vector);
  end
end

always @(posedge clock_vector) begin
  clk_start = 1'b1;
  $fdisplay(fid, "%b\n%b\n", {1'b1,input_vector}, output_vector);
end

endmodule


