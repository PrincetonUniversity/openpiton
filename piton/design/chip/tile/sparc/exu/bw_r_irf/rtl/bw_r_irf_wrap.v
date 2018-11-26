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

// Wraps the EXU to tie unused signals when no scan chain is present                                              

`include "define.tmp.h"

module bw_r_irf_wrap
(
    input           rclk,
    input           reset_l,
    input           sehold,
    input           rst_tri_en,
    input           ifu_exu_tid_s2,
    input   [4:0]   ifu_exu_rs1_s,
    input   [4:0]   ifu_exu_rs2_s,
    input   [4:0]   ifu_exu_rs3_s,
    input           ifu_exu_ren1_s,
    input           ifu_exu_ren2_s,
    input           ifu_exu_ren3_s,
    input           ecl_irf_wen_w,
    input           ecl_irf_wen_w2,
    input   [4:0]   ecl_irf_rd_m,
    input   [4:0]   ecl_irf_rd_g,
    input   [71:0]  byp_irf_rd_data_w,
    input   [71:0]  byp_irf_rd_data_w2,
    input   [1:0]   ecl_irf_tid_m,
    input   [1:0]   ecl_irf_tid_g,
    input   [2:0]   rml_irf_old_lo_cwp_e,
    input   [2:0]   rml_irf_new_lo_cwp_e,
    input   [2:1]   rml_irf_old_e_cwp_e,
    input   [2:1]   rml_irf_new_e_cwp_e,
    input           rml_irf_swap_even_e,
    input           rml_irf_swap_odd_e,
    input           rml_irf_swap_local_e,
    input           rml_irf_kill_restore_w,
    input           rml_irf_cwpswap_tid_e,
    input   [1:0]   rml_irf_old_agp,
    input   [1:0]   rml_irf_new_agp,
    input           rml_irf_swap_global,
    input           rml_irf_global_tid,

    output  [71:0]  irf_byp_rs1_data_d_l,
    output  [71:0]  irf_byp_rs2_data_d_l,
    output  [71:0]  irf_byp_rs3_data_d_l,
    output  [31:0]  irf_byp_rs3h_data_d_l,

    output [`CORE_JTAG_BUS_WIDTH-1:0] core_rtap_data,
    input wire rtap_core_val,
    input wire rtap_core_threadid,
    input wire [`JTAG_CORE_ID_WIDTH-1:0]  rtap_core_id,
    input wire [4:0] rtap_core_data
);

bw_r_irf irf
(
    .rclk (rclk),
    .reset_l (reset_l),
    .si (1'bx),
    .se (1'b0),
    .sehold (sehold),
    .rst_tri_en (rst_tri_en),
    .ifu_exu_tid_s2 ({1'bx, ifu_exu_tid_s2}),
    .ifu_exu_rs1_s (ifu_exu_rs1_s),
    .ifu_exu_rs2_s (ifu_exu_rs2_s),
    .ifu_exu_rs3_s (ifu_exu_rs3_s),
    .ifu_exu_ren1_s (ifu_exu_ren1_s),
    .ifu_exu_ren2_s (ifu_exu_ren2_s),
    .ifu_exu_ren3_s (ifu_exu_ren3_s),
    .ecl_irf_wen_w (ecl_irf_wen_w),
    .ecl_irf_wen_w2 (ecl_irf_wen_w2),
    .ecl_irf_rd_m (ecl_irf_rd_m),
    .ecl_irf_rd_g (ecl_irf_rd_g),
    .byp_irf_rd_data_w (byp_irf_rd_data_w),
    .byp_irf_rd_data_w2 (byp_irf_rd_data_w2),
    .ecl_irf_tid_m (ecl_irf_tid_m),
    .ecl_irf_tid_g (ecl_irf_tid_g),
    .rml_irf_old_lo_cwp_e (rml_irf_old_lo_cwp_e),
    .rml_irf_new_lo_cwp_e (rml_irf_new_lo_cwp_e),
    .rml_irf_old_e_cwp_e (rml_irf_old_e_cwp_e),
    .rml_irf_new_e_cwp_e (rml_irf_new_e_cwp_e),
    .rml_irf_swap_even_e (rml_irf_swap_even_e),
    .rml_irf_swap_odd_e (rml_irf_swap_odd_e),
    .rml_irf_swap_local_e (rml_irf_swap_local_e),
    .rml_irf_kill_restore_w (rml_irf_kill_restore_w),
    .rml_irf_cwpswap_tid_e ({1'bx, rml_irf_cwpswap_tid_e}),
    .rml_irf_old_agp (rml_irf_old_agp),
    .rml_irf_new_agp (rml_irf_new_agp),
    .rml_irf_swap_global (rml_irf_swap_global),
    .rml_irf_global_tid ({1'bx, rml_irf_global_tid}),
    .so (),
    .irf_byp_rs1_data_d_l (irf_byp_rs1_data_d_l),
    .irf_byp_rs2_data_d_l (irf_byp_rs2_data_d_l),
    .irf_byp_rs3_data_d_l (irf_byp_rs3_data_d_l),
    .irf_byp_rs3h_data_d_l (irf_byp_rs3h_data_d_l)
    
    `ifndef PITON_PROTO
    `ifndef CONFIG_NUM_THREADS
    ,
    .core_rtap_data (core_rtap_data),
    .rtap_core_val (rtap_core_val),
    .rtap_core_threadid ({1'bx, rtap_core_threadid}),
    .rtap_core_id (rtap_core_id),
    .rtap_core_data ({89'bx, rtap_core_data}) 
    `endif
    `endif
);

endmodule
