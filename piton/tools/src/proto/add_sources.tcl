# Copyright (c) 2016 Princeton University
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of Princeton University nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

set origin_dir "."

set obj [get_filesets sources_1]
set files [list \
 "[file normalize "$origin_dir/../../piton/design/include/dmbr_define.v"]"\
 "[file normalize "$origin_dir/../../piton/design/include/define.vh"]"\
 "[file normalize "$origin_dir/../../piton/design/include/l15.vh"]"\
 "[file normalize "$origin_dir/../../piton/design/fpga/include/mc_define.h"]"\
 "[file normalize "$origin_dir/../../piton/design/fpga/include/uart16550_define.vh"]"\
 "[file normalize "$origin_dir/../../piton/design/include/network_define.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_stsm.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_shiftreg.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_rtsm.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_lfsr.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_htsm.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_counter.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/bw_r_irf/common/rtl/bw_r_irf_register.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/swrvr_clib.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/swrvr_dlib.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_fsm.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_rndrob.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_ecl_cnt6.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_eclcomp7.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_aluspr.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_aluor32.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_aluadder64.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/bw_r_irf/bw_r_irf_register8/rtl/bw_r_irf_register8.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/bw_r_irf/bw_r_irf_register16/rtl/bw_r_irf_register16.v"]"\
 "[file normalize "$origin_dir/../../piton/design/proto/bram_sdp_128x80_wrapper.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/u1.beh.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/tlu/rtl/tlu_rrobin_picker.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/tlu/rtl/tlu_prencoder16.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/tlu/rtl/tlu_addern_32.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/srams/rtl/sram_wrappers/sram_1rw_128x78.v.xlx.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/tlu/rtl/sparc_tlu_zcmp64.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/tlu/rtl/sparc_tlu_penc64.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/tlu/rtl/sparc_tlu_dec64.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_thrfsm.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_thrcmpl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_swpla.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_rndrob.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_par34.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_par32.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_par16.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_milfsm.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_lru4.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_lfsr5.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_incr46.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_ctr5.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_cmp35.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ffu/rtl/sparc_ffu_part_add32.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ffu/rtl/sparc_ffu_ctl_visctl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_rml_inc3.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_rml_cwp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_reg.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_ecl_wb.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_ecl_mdqctl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_ecl_eccctl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_ecl_divcntl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_eclccr.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_eclbyplog_rs1.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_eclbyplog.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_ecc_dec.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_div_yreg.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_div_32eql.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_byp_eccgen.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_alu_16eql.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_aluzcmp64.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_alulogic.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_aluaddsub.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/mul64.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/m1.beh.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/lsu/rtl/lsu_rrobin_picker2.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/lsu/rtl/lsu_pcx_qmon.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/lsu/rtl/lsu_dc_parity_gen.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/lsu/rtl/lsu_dcache_lfsr.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/lsu/rtl/lsu_asi_decode.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/bw_r_irf/rtl/bw_r_irf.v"]"\
 "[file normalize "$origin_dir/../../piton/design/proto/bram_sdp_4096x144_wrapper.v"]"\
 "[file normalize "$origin_dir/../../piton/design/proto/bram_sdp_1024x64_wrapper.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/tlu/rtl/tlu_tdp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/tlu/rtl/tlu_tcl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/tlu/rtl/tlu_pib.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/tlu/rtl/tlu_mmu_dp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/tlu/rtl/tlu_mmu_ctl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/tlu/rtl/tlu_misctl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/tlu/rtl/tlu_incr64.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/tlu/rtl/tlu_hyperv.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/tlu/rtl/sparc_tlu_intdp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/tlu/rtl/sparc_tlu_intctl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/mul/rtl/sparc_mul_dp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/mul/rtl/sparc_mul_cntl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_wseldp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_swl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_sscan.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_invctl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_imd.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_ifqdp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_ifqctl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_fdp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_fcl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_errdp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_errctl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_dec.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_dcl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ffu/rtl/sparc_ffu_vis.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ffu/rtl/sparc_ffu_dp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ffu/rtl/sparc_ffu_ctl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_shft.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_rml.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_ecl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_ecc.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_div.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_byp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_alu.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/dynamic_node/components/rtl/one_of_five.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/lsu/rtl/lsu_tlbdp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/lsu/rtl/lsu_tagdp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/lsu/rtl/lsu_stb_rwdp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/lsu/rtl/lsu_stb_rwctl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/lsu/rtl/lsu_stb_ctldp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/lsu/rtl/lsu_stb_ctl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/lsu/rtl/lsu_qdp2.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/lsu/rtl/lsu_qdp1.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/lsu/rtl/lsu_qctl2.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/lsu/rtl/lsu_qctl1.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/lsu/rtl/lsu_excpctl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/lsu/rtl/lsu_dctldp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/lsu/rtl/lsu_dctl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/lsu/rtl/lsu_dcdp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/l15_priority_encoder.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_route_request_calc.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/srams/rtl/bw_r_tlb.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/srams/rtl/bw_r_scm.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/srams/rtl/bw_r_rf32x80.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/srams/rtl/bw_r_rf32x152b.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/srams/rtl/bw_r_rf16x32.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/srams/rtl/bw_r_rf16x160.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/bw_r_irf/rtl/bw_r_irf_wrap.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/srams/rtl/bw_r_idct.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/srams/rtl/bw_r_icd.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/srams/rtl/bw_r_frf.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/srams/rtl/bw_r_dcd.v"]"\
 "[file normalize "$origin_dir/../../piton/design/proto/bram_sdp_256x104_wrapper.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/tlu/rtl/tlu.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/sram_wrappers/sram_l2_tag.v.xlx.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/sram_wrappers/sram_l2_state.v.xlx.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/sram_wrappers/sram_l2_dir.v.xlx.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/sram_wrappers/sram_l2_data.v.xlx.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/mul/rtl/sparc_mul_top.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ffu/rtl/sparc_ffu.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/dynamic_node/common/rtl/space_avail_top.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/dynamic_node/common/rtl/network_input_blk_multi_out.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/lsu/rtl/lsu.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_priority_encoder.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_data_pgen.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_data_ecc.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/l15_home_encoder.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/l15_hmc.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/flat_id_to_xy.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_output_datapath.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_output_control.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_control.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/tlu/rtl/tlu_nospu_wrap.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/sram_wrappers/sram_l15_tag.v.xlx.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/sram_wrappers/sram_l15_hmt.v.xlx.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/sram_wrappers/sram_l15_data.v.xlx.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/mul/rtl/sparc_mul_top_nospu_wrap.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ifu/rtl/sparc_ifu_nospu_wrap.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/ffu/rtl/sparc_ffu_nospu_wrap.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/exu/rtl/sparc_exu_wrap.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/simplenocbuffer.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/pcx_decoder.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/pcx_buffer.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/dynamic_node/components/rtl/one_of_eight.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/noc3encoder.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/noc3buffer.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/noc2decoder.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/noc1encoder.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/noc1buffer.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/dynamic_node/components/rtl/net_dff.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/lsu/rtl/lsu_nospu_wrap.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_tag.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_state.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_smc.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_pipe2_dpath.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_pipe2_ctrl.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_pipe2_buf_in.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_pipe1_dpath.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_pipe1_ctrl.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_pipe1_buf_out.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_pipe1_buf_in.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_mshr_decoder.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_mshr.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_encoder.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_dir.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_decoder.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_data.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_broadcast_counter.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/l15_rf_128x8.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/l15_rf_128x6.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/l15_rf_128x12.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/l15_pipeline.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/l15_mshr.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/l15_csm.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/l15_cpxencoder.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/dynamic_node/components/rtl/flip_bus.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_output_top.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_top_4.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_top_16.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/rtl/cpx_spc_rpt.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/rtl/cpx_spc_buf.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/rtl/cfg_asi.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/dynamic_node/components/rtl/bus_compare_equal.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/ucb_bus_out.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/ucb_bus_in.v"]"\
 "[file normalize "$origin_dir/../../piton/design/fpga/mc/rtl/mig_addr_translator.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/rtl/synchronizer.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/rtl/sparc.v"]"\
 "[file normalize "$origin_dir/../../piton/design/include/jtag.vh"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/rtap/rtl/rtap_ucb_transmitter.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/rtap/rtl/rtap_ucb_receiver.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_tag_wrap.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_state_wrap.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_smc_wrap.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_pipe2.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_pipe1.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_mshr_wrap.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_dir_wrap.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_data_wrap.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_config_regs.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2_broadcast_counter_wrap.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/l15.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/jtag/rtl/jtag_interface_tap.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/dynamic_node/rtl/dynamic_node_top.v"]"\
 "[file normalize "$origin_dir/../../piton/design/proto/bram_sdp_16384x512_wrapper.v"]"\
 "[file normalize "$origin_dir/../../piton/design/proto/bram_map_obp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/fpga/io_ctrl/rtl/uart_writer.v"]"\
 "[file normalize "$origin_dir/../../piton/design/fpga/io_ctrl/rtl/uart_reader.v"]"\
 "[file normalize "$origin_dir/../../piton/design/fpga/io_ctrl/rtl/uart_mux.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/rtl/cpx_arbitrator.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/valrdy_to_credit.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/rtl/sparc_core.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/rtap/rtl/rtap.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l2/rtl/l2.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/l15/rtl/l15_wrap.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/jtag/rtl/jtag_ucb_transmitter.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/jtag/rtl/jtag_ucb_receiver.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/jtag/rtl/jtag_interface.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/jtag/rtl/jtag_ctap.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_arb_wrap.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/dynamic_node/rtl/dynamic_node_top_wrap.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/dmbr/rtl/dmbr.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/credit_to_valrdy.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/rtl/config_regs.tmp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/clk_gating_latch.v"]"\
 "[file normalize "$origin_dir/../../piton/verif/env/common/fake_boot_ctrl.v.xlx.v"]"\
 "[file normalize "$origin_dir/../../piton/design/fpga/mc/rtl/pkt_trans_dp_wide.v"]"\
 "[file normalize "$origin_dir/../../piton/design/fpga/mc/rtl/mig_mux.v"]"\
 "[file normalize "$origin_dir/../../piton/design/fpga/mig_trans_intfc/mig_async_fifo.v"]"\
 "[file normalize "$origin_dir/../../piton/design/fpga/io_ctrl/rtl/uart_top.v"]"\
 "[file normalize "$origin_dir/../../piton/design/fpga/mem_io_splitter/rtl/uart_boot_splitter.v"]"\
 "[file normalize "$origin_dir/../../piton/design/fpga/noc_axilite_bridge/rtl/noc_axilite_bridge.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/rtl/tile.v.xlx.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/rtl/OCI.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/jtag/rtl/jtag.v"]"\
 "[file normalize "$origin_dir/../../piton/design/fpga/mc/rtl/mc_top.v"]"\
 "[file normalize "$origin_dir/../../piton/design/fpga/mem_io_splitter/rtl/mem_io_splitter.v"]"\
 "[file normalize "$origin_dir/../../piton/design/fpga/io_ctrl/rtl/io_ctrl_top.v"]"\
 "[file normalize "$origin_dir/../../piton/design/proto/blinker.v"]"\
 "[file normalize "$origin_dir/../../piton/verif/env/manycore/ciop_iob.v.xlx.v"]"\
 "[file normalize "$origin_dir/../../piton/verif/env/manycore/cross_module.tmp.h"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/rtl/chip.v.xlx.v"]"\
 "[file normalize "$origin_dir/../../piton/verif/env/manycore/manycore_top.v.xlx.v"]"\
 "[file normalize "$origin_dir/../../piton/design/proto/bram_sdp_256x512_wrapper.v"]"\
 "[file normalize "$origin_dir/../../piton/design/proto/bram_map.v"]"\
 "[file normalize "$origin_dir/../../piton/verif/env/common/fake_mem_ctrl.v.xlx.v"]"\
 "[file normalize "$origin_dir/../../piton/design/proto/bram_sdp_512x64_wrapper.v"]"\
 "[file normalize "$origin_dir/../../piton/design/proto/bram_sdp_2048x144_wrapper.v"]"\
 "[file normalize "$origin_dir/../../piton/design/proto/bram_sdp_128x108_wrapper.v"]"\
 "[file normalize "$origin_dir/../../piton/design/proto/bram_sdp_256x272_wrapper.v"]"\
 "[file normalize "$origin_dir/../../piton/design/proto/bram_sdp_128x288_wrapper.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_in2_gt_in1_3to1.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_in2_gt_in1_3b.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_in2_gt_in1_2b.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_denorm_3to1.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_denorm_3b.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_cnt_lead0_lvl4.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_cnt_lead0_lvl3.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_cnt_lead0_lvl2.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_cnt_lead0_lvl1.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/srams/rtl/sram_wrappers/sram_1rw_128x132.v.xlx.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/srams/rtl/sram_wrappers/sram_1rw_256x272.v.xlx.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/sparc/srams/rtl/sram_wrappers/sram_1rw_128x288.v.xlx.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_in2_gt_in1_frac.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_denorm_frac.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_cnt_lead0_64b.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_cnt_lead0_53b.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_rptr_min_global.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_rptr_macros.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_out_dp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_out_ctl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_mul_frac_dp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_mul_exp_dp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_mul_ctl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_in_dp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_in_ctl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_div_frac_dp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_div_exp_dp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_div_ctl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_add_frac_dp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_add_exp_dp.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_add_ctl.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_rptr_groups.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_out.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_mul.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_in.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_div.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_add.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/test_stub_scan.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_buf.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/fpu/rtl/fpu_arb.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/chip_bridge/rtl/sync_fifo.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/chip_bridge/rtl/chip_net_chooser_32.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/chip_bridge/rtl/async_fifo.v"]"\
 "[file normalize "$origin_dir/../../piton/design/fpga/fpga_bridge/fpga_send/rtl/fpga_net_chooser_32.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/chip_bridge/rtl/chip_bridge_send_32.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/chip_bridge/rtl/chip_bridge_rcv_32.v"]"\
 "[file normalize "$origin_dir/../../piton/design/fpga/fpga_bridge/fpga_send/rtl/fpga_bridge_send_32.v"]"\
 "[file normalize "$origin_dir/../../piton/design/fpga/fpga_bridge/fpga_rcv/rtl/fpga_bridge_rcv_32.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/synchronizer_asr.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/synchronizer_asr_dup.v"]"\
 "[file normalize "$origin_dir/../../piton/design/proto/bram_sdp_128x512_wrapper.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/ucb_flow_2buf.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/chip_bridge/rtl/chip_bridge.v"]"\
 "[file normalize "$origin_dir/../../piton/design/proto/bram_sdp_4096x512_wrapper.v"]"\
 "[file normalize "$origin_dir/../../piton/design/fpga/fpga_bridge/rtl/fpga_bridge.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/cluster_header_sync.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/sync_pulse_synchronizer.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/dbl_buf.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/ucb_flow_spi.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/test_stub_bist.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/ucb_flow_jbi.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/cluster_header_dup.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/ucb_noflow.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/cmp_sram_redhdr.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/cluster_header.v"]"\
 "[file normalize "$origin_dir/../../piton/design/chip/tile/common/rtl/cluster_header_ctu.v"]"\
 "[file normalize "$origin_dir/../../piton/design/fpga/iosplitter_axi_lite/rtl/iosplitter_axi_lite.v"]"\
 "[file normalize "$origin_dir/../../piton/design/fpga/iosplitter_axi_lite/rtl/iosplitter_axi_lite_updated.v"]"\
 "[file normalize "$origin_dir/../test_proto.coe"]"\
 "[file normalize "$origin_dir/uart_data.coe"]"\
 "[file normalize "$origin_dir/uart_addr.coe"]"\
 "[file normalize "$origin_dir/mem_uart_done.coe"]"\
 "[file normalize "$origin_dir/../../piton/design/proto/fpga_top.v"]"\
 "[file normalize "$origin_dir/obp.coe"]"\
]
add_files -norecurse -fileset $obj $files

set_property "top" "cmp_top" $obj
set_property "verilog_define" "NO_SCAN PITON_PROTO_SYNTH FPGA_SYN_1THREAD FPGA_SYN PITON_PROTO NO_USE_IBM_SRAMS PITON_NO_FPU PITON_NO_DMBR PITON_PROTO_NO_MON USE_UART_16550 PITON_PROTO_MC_DDR3 PITON_FPGA_BRAM_BOOT" $obj

set obj [get_filesets constrs_1]
set file "[file normalize "$origin_dir/constraints.xdc"]"
set file_added [add_files -norecurse -fileset $obj $file]
set file "genesys2/constraints.xdc"
set obj [get_filesets constrs_1]
set_property "name" "constrs_1" $obj
set_property "target_constrs_file" "[file normalize "$origin_dir/constraints.xdc"]" $obj
