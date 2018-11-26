// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Wraps the SPU and ties unused signals 

`include "define.tmp.h"

module sparc_ffu_nospu_wrap
(
    input                rclk,
    
    input                arst_l,
    input                grst_l,

    input                lsu_ffu_st_dtlb_perr_g,
    input                exu_ffu_ist_e,    
    input [1:0]          ifu_ffu_tid_d,
    input [63:0]         cpx_fpu_data,
    input                cpx_vld,
    input                cpx_fcmp,
    input [3:0]          cpx_req,
    input [1:0]          cpx_fccval,
    input [4:0]          cpx_fpexc,
    input [31:0]         exu_ffu_gsr_mask_m,
    input [4:0]          exu_ffu_gsr_scale_m,
    input [2:0]          exu_ffu_gsr_align_m,
    input [2:0]          exu_ffu_gsr_rnd_m,
    input                ifu_ffu_ldst_single_d,
    // input                mux_drive_disable,
    // input                mem_write_disable,
    

    output [80:0]        ffu_lsu_data,
    output [3:0]         ffu_ifu_cc_vld_w2,
    output [7:0]         ffu_ifu_cc_w2,
    output               ffu_ifu_ecc_ce_w2,      
    output               ffu_ifu_ecc_ue_w2,
    output [5:0]         ffu_ifu_err_reg_w2,
    output [13:0]        ffu_ifu_err_synd_w2,
    output               ffu_ifu_fpop_done_w2,
    output               ffu_ifu_fst_ce_w,
    output               ffu_ifu_inj_ack,
    output               ffu_ifu_stallreq,
    output [1:0]         ffu_ifu_tid_w2,
    output               ffu_lsu_blk_st_e,
    output [5:3]         ffu_lsu_blk_st_va_e,
    output               ffu_lsu_fpop_rq_vld,
    output               ffu_lsu_kill_fst_w,
    output               ffu_tlu_fpu_cmplt,
    output [1:0]         ffu_tlu_fpu_tid,
    output               ffu_tlu_ill_inst_m,
    output               ffu_tlu_trap_ieee754,
    output               ffu_tlu_trap_other,
    output               ffu_tlu_trap_ue,
    output [63:0]        ffu_exu_rsr_data_m,
    input                exu_ffu_wsr_inst_e,
    input                ifu_exu_disable_ce_e,
    input [6:0]          ifu_exu_ecc_mask,
    input                ifu_exu_nceen_e,
    input [1:0]          ifu_ffu_fcc_num_d,
    input                ifu_ffu_fld_d,
    input                ifu_ffu_fpop1_d,
    input                ifu_ffu_fpop2_d,
    input [8:0]          ifu_ffu_fpopcode_d,
    input [4:0]          ifu_ffu_frd_d,
    input [4:0]          ifu_ffu_frs1_d,        
    input [4:0]          ifu_ffu_frs2_d,
    input                ifu_ffu_fst_d,
    input                ifu_ffu_inj_frferr,
    input                ifu_ffu_ldfsr_d,
    input                ifu_ffu_ldxfsr_d,
    input                ifu_ffu_mvcnd_m,
    input                ifu_ffu_quad_op_e,
    input                ifu_ffu_stfsr_d,
    input                ifu_ffu_visop_d,
    input                ifu_lsu_ld_inst_e,
    input                ifu_tlu_flsh_inst_e,  
    input                ifu_tlu_flush_w,
    input                ifu_tlu_inst_vld_w,
    input [6:0]          ifu_tlu_sraddr_d,
    input                lsu_ffu_ack,
    input [2:0]          lsu_ffu_bld_cnt_w,
    input                lsu_ffu_blk_asi_e,
    input                lsu_ffu_flush_pipe_w,
    input [63:0]         lsu_ffu_ld_data,
    input                lsu_ffu_ld_vld,
    input                lsu_ffu_stb_full0,
    input                lsu_ffu_stb_full1,
    input                lsu_ffu_stb_full2,      
    input                lsu_ffu_stb_full3,

    // sram wrapper interface
    output [`SRAM_WRAPPER_BUS_WIDTH-1:0] srams_rtap_data,
    input  [`BIST_OP_WIDTH-1:0] rtap_srams_bist_command,
    input  [`SRAM_WRAPPER_BUS_WIDTH-1:0] rtap_srams_bist_data
);

    sparc_ffu ffu(
                 .short_si0             (),
                 .short_so0             (),
                 .si                    (),
                 .so                    (),
                 // reset stuff
                 .grst_l                (grst_l),
                 .arst_l                (arst_l),
                 
       // eco 6529 .
       .lsu_ffu_st_dtlb_perr_g      (lsu_ffu_st_dtlb_perr_g),

                 .exu_ffu_ist_e         (exu_ffu_ist_e),
                 .ifu_ffu_tid_d         (ifu_ffu_tid_d),
                 .cpx_fpu_data          (cpx_fpu_data),
                 .cpx_vld             (cpx_vld),
                 .cpx_fcmp            (cpx_fcmp),
                 .cpx_req             (cpx_req),
                 .cpx_fccval          (cpx_fccval),
                 .cpx_fpexc           (cpx_fpexc),                   
                 .exu_ffu_gsr_mask_m  (exu_ffu_gsr_mask_m),
                 .exu_ffu_gsr_scale_m (exu_ffu_gsr_scale_m),
                 .exu_ffu_gsr_align_m (exu_ffu_gsr_align_m),
                 .exu_ffu_gsr_rnd_m   (exu_ffu_gsr_rnd_m),
                 .ifu_ffu_ldst_single_d   (ifu_ffu_ldst_single_d),
                     /*AUTOINST*/
                 // Outputs
                 .ffu_lsu_data          (ffu_lsu_data),
                 .ffu_ifu_cc_vld_w2     (ffu_ifu_cc_vld_w2),
                 .ffu_ifu_cc_w2         (ffu_ifu_cc_w2),
                 .ffu_ifu_ecc_ce_w2     (ffu_ifu_ecc_ce_w2),
                 .ffu_ifu_ecc_ue_w2     (ffu_ifu_ecc_ue_w2),
                 .ffu_ifu_err_reg_w2    (ffu_ifu_err_reg_w2),
                 .ffu_ifu_err_synd_w2   (ffu_ifu_err_synd_w2),
                 .ffu_ifu_fpop_done_w2  (ffu_ifu_fpop_done_w2),
                 .ffu_ifu_fst_ce_w      (ffu_ifu_fst_ce_w),
                 .ffu_ifu_inj_ack       (ffu_ifu_inj_ack),
                 .ffu_ifu_stallreq      (ffu_ifu_stallreq),
                 .ffu_ifu_tid_w2        (ffu_ifu_tid_w2),
                 .ffu_lsu_blk_st_e      (ffu_lsu_blk_st_e),
                 .ffu_lsu_blk_st_va_e   (ffu_lsu_blk_st_va_e),
                 .ffu_lsu_fpop_rq_vld   (ffu_lsu_fpop_rq_vld),
                 .ffu_lsu_kill_fst_w    (ffu_lsu_kill_fst_w),
                 .ffu_tlu_fpu_cmplt     (ffu_tlu_fpu_cmplt),
                 .ffu_tlu_fpu_tid       (ffu_tlu_fpu_tid),
                 .ffu_tlu_ill_inst_m    (ffu_tlu_ill_inst_m),
                 .ffu_tlu_trap_ieee754  (ffu_tlu_trap_ieee754),
                 .ffu_tlu_trap_other    (ffu_tlu_trap_other),
                 .ffu_tlu_trap_ue       (ffu_tlu_trap_ue),
                 .ffu_exu_rsr_data_m    (ffu_exu_rsr_data_m),
                 // Inputs
                 // .mux_drive_disable     (mux_drive_disable),
                 // .mem_write_disable     (mem_write_disable),
                 .exu_ffu_wsr_inst_e    (exu_ffu_wsr_inst_e),
                 .ifu_exu_disable_ce_e  (ifu_exu_disable_ce_e),
                 .ifu_exu_ecc_mask      (ifu_exu_ecc_mask),
                 .ifu_exu_nceen_e       (ifu_exu_nceen_e),
                 .ifu_ffu_fcc_num_d     (ifu_ffu_fcc_num_d),
                 .ifu_ffu_fld_d         (ifu_ffu_fld_d),
                 .ifu_ffu_fpop1_d       (ifu_ffu_fpop1_d),
                 .ifu_ffu_fpop2_d       (ifu_ffu_fpop2_d),
                 .ifu_ffu_fpopcode_d    (ifu_ffu_fpopcode_d),
                 .ifu_ffu_frd_d         (ifu_ffu_frd_d),
                 .ifu_ffu_frs1_d        (ifu_ffu_frs1_d),
                 .ifu_ffu_frs2_d        (ifu_ffu_frs2_d),
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
                 .ifu_tlu_sraddr_d      (ifu_tlu_sraddr_d),
                 .lsu_ffu_ack           (lsu_ffu_ack),
                 .lsu_ffu_bld_cnt_w     (lsu_ffu_bld_cnt_w),
                 .lsu_ffu_blk_asi_e     (lsu_ffu_blk_asi_e),
                 .lsu_ffu_flush_pipe_w  (lsu_ffu_flush_pipe_w),
                 .lsu_ffu_ld_data       (lsu_ffu_ld_data),
                 .lsu_ffu_ld_vld        (lsu_ffu_ld_vld),
                 .lsu_ffu_stb_full0     (lsu_ffu_stb_full0),
                 .lsu_ffu_stb_full1     (lsu_ffu_stb_full1),
                 .lsu_ffu_stb_full2     (lsu_ffu_stb_full2),
                 .lsu_ffu_stb_full3     (lsu_ffu_stb_full3),
                 .rclk                  (rclk),
                 .se                    (),
                 .sehold                (),
                 // interface to srams
                 .srams_rtap_data (srams_rtap_data),
                 .rtap_srams_bist_command (rtap_srams_bist_command),
                 .rtap_srams_bist_data (rtap_srams_bist_data)
       );

endmodule
