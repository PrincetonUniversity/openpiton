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

#
# RTL setup, provides locations for all RTL
# Not intended to be run standalone
#

set GLOBAL_INCLUDE_DIRS "${DV_ROOT}/design/include ${DV_ROOT}/design/chip/tile/sparc/include ${DV_ROOT}/design/chipset/include ${ARIANE_ROOT}/common/submodules/common_cells/include ${ARIANE_ROOT}/common/local/util ${ARIANE_ROOT}/corev_apu/register_interface/include"

# RTL include files
set GLOBAL_INCLUDE_FILES [list \
    "${DV_ROOT}/design/include/define.h" \
    "${DV_ROOT}/design/include/piton_system.vh" \
    "${DV_ROOT}/design/include/dmbr_define.v" \
    "${DV_ROOT}/design/include/l15.h" \
    "${DV_ROOT}/design/include/l2.h" \
    "${DV_ROOT}/design/include/network_define.v" \
    "${DV_ROOT}/design/include/jtag.vh" \
    "${OST1_ROOT}/include/ifu.h" \
    "${DV_ROOT}/design/include/lsu.h" \
    "${DV_ROOT}/design/chipset/include/chipset_define.vh" \
]

set GLOBAL_DEFAULT_VERILOG_MACROS "NO_SCAN FPGA_SYN PITON_FPGA_SYNTH PITON_PROTO"

# RTL implementation files

set SYSTEM_RTL_IMPL_FILES [list \
    "${DV_ROOT}/design/rtl/system.v" \
]

set SYSTEM_INCLUDE_FILES [list \
]

set SYSTEM_IP_FILE_PREFIXES [list \
]

set SYSTEM_COE_IP_FILES [list \
]

set SYSTEM_PRJ_IP_FILES [list \
]

set CHIP_RTL_IMPL_FILES [list \
    "${DV_ROOT}/design/common/rtl/bram_sdp_wrapper.v" \
    "${DV_ROOT}/design/common/rtl/bram_1rw_wrapper.v" \
    "${DV_ROOT}/design/common/rtl/bram_1r1w_wrapper.v" \
    "${DV_ROOT}/design/common/rtl/synchronizer.v" \
    "${DV_ROOT}/design/chip/rtl/OCI.v" \
    "${DV_ROOT}/design/chip/rtl/chip.v" \
    "${DV_ROOT}/design/chip/pll/rtl/pll_top.v" \
    "${DV_ROOT}/design/chip/pll/rtl/clk_mux.v" \
    "${DV_ROOT}/design/chip/pll/rtl/clk_se_to_diff.v" \
    "${DV_ROOT}/design/chip/jtag/rtl/jtag.v" \
    "${DV_ROOT}/design/chip/jtag/rtl/jtag_interface_tap.v" \
    "${DV_ROOT}/design/chip/jtag/rtl/jtag_ucb_transmitter.v" \
    "${DV_ROOT}/design/chip/jtag/rtl/jtag_ucb_receiver.v" \
    "${DV_ROOT}/design/chip/jtag/rtl/jtag_interface.v" \
    "${DV_ROOT}/design/chip/jtag/rtl/jtag_ctap.v" \
    "${DV_ROOT}/design/chip/chip_bridge/rtl/chip_bridge.v" \
    "${DV_ROOT}/design/chip/chip_bridge/rtl/chip_bridge_send_32.v" \
    "${DV_ROOT}/design/chip/chip_bridge/rtl/chip_bridge_rcv_32.v" \
    "${DV_ROOT}/design/chip/chip_bridge/rtl/sync_fifo.v" \
    "${DV_ROOT}/design/chip/chip_bridge/rtl/chip_net_chooser_32.v" \
    "${DV_ROOT}/design/chip/tile/dmbr/rtl/dmbr.v" \
    "${DV_ROOT}/design/chip/tile/rtl/tile.v" \
    "${DV_ROOT}/design/chip/tile/rtl/config_regs.v" \
    "${DV_ROOT}/design/chip/tile/rtl/cpx_arbitrator.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_priority_encoder.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_data_pgen.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_data_ecc.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_smc.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_pipe2_dpath.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_pipe2_ctrl.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_pipe2_buf_in.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_pipe1_dpath.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_pipe1_ctrl.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_pipe1_buf_out.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_pipe1_buf_in.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_mshr_decoder.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_mshr.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_encoder.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_decoder.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_broadcast_counter.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_smc_wrap.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_pipe2.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_pipe1.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_mshr_wrap.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_config_regs.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_broadcast_counter_wrap.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_tag_wrap.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_state_wrap.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_dir_wrap.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_data_wrap.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_tag.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_state.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_dir.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_data.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_amo_alu.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/sram_wrappers/sram_l2_tag.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/sram_wrappers/sram_l2_state.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/sram_wrappers/sram_l2_dir.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/sram_wrappers/sram_l2_data.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/l15_wrap.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/l15.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/rf_l15_wmt.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/rf_l15_lruarray.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/rf_l15_mesi.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/rf_l15_lrsc_flag.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/l15_pipeline.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/l15_mshr.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/l15_csm.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/noc3encoder.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/noc3buffer.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/noc2decoder.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/noc1encoder.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/noc1buffer.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/simplenocbuffer.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/l15_priority_encoder.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/l15_home_encoder.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/l15_hmc.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/sram_wrappers/sram_l15_tag.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/sram_wrappers/sram_l15_hmt.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/sram_wrappers/sram_l15_data.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/rtl/dynamic_node_top_wrap.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/rtl/dynamic_node_top.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_output_datapath.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_output_control.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_control.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_output_top.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_top_4.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_top_16.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_route_request_calc.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/one_of_five.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/one_of_eight.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/net_dff.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/flip_bus.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/bus_compare_equal.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/common/rtl/space_avail_top.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/common/rtl/network_input_blk_multi_out.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/rtl/dynamic_node_top_wrap_para.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/rtl/dynamic_node_top_para.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_output_datapath_para.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_output_control_para.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_control_para.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_output_top_para.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_top_4_para.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_top_16_para.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_route_request_calc_para.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/one_of_n.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/one_of_n_plus_3.v" \
    "${DV_ROOT}/design/chip/tile/rtap/rtl/rtap.v" \
    "${DV_ROOT}/design/chip/tile/rtap/rtl/rtap_ucb_transmitter.v" \
    "${DV_ROOT}/design/chip/tile/rtap/rtl/rtap_ucb_receiver.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/swrvr_clib.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/ucb_bus_out.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/ucb_bus_in.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/valrdy_to_credit.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/credit_to_valrdy.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/flat_id_to_xy.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/xy_to_flat_id.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/clk_gating_latch.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/test_stub_scan.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/test_stub_bist.v" \
    "${DV_ROOT}/design/chip/tile/pico/rtl/picorv32.v" \
    "${DV_ROOT}/design/chip/tile/pico/rtl/pico_reset.v" \
    "${DV_ROOT}/design/chip/tile/pico/rtl/pico_l15_transducer.v" \
    "${DV_ROOT}/design/chip/tile/pico/rtl/l15_picoencoder.v" \
    "${DV_ROOT}/design/chip/tile/pico/rtl/pico_decoder.v" \
    "${OST1_ROOT}/rtl/sparc.v" \
    "${OST1_ROOT}/rtl/sparc_core.v" \
    "${OST1_ROOT}/rtl/sparc_tri.v" \
    "${OST1_ROOT}/rtl/ccx_l15_transducer.v" \
    "${OST1_ROOT}/rtl/l15_cpxencoder.v" \
    "${OST1_ROOT}/rtl/pcx_decoder.v" \
    "${OST1_ROOT}/rtl/pcx_buffer.v" \
    "${OST1_ROOT}/rtl/cpx_spc_rpt.v" \
    "${OST1_ROOT}/rtl/cpx_spc_buf.v" \
    "${OST1_ROOT}/rtl/cfg_asi.v" \
    "${OST1_ROOT}/common/rtl/swrvr_dlib.v" \
    "${OST1_ROOT}/common/rtl/u1.beh.v" \
    "${OST1_ROOT}/common/rtl/m1.beh.v" \
    "${OST1_ROOT}/common/rtl/mul64.v" \
    "${OST1_ROOT}/common/rtl/synchronizer_asr.v" \
    "${OST1_ROOT}/common/rtl/cluster_header.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_arb_wrap.v" \
    "${OST1_ROOT}/fpu/rtl/fpu.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_arb.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_buf.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_out.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_mul.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_in.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_div.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_add.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_in2_gt_in1_frac.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_denorm_frac.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_cnt_lead0_64b.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_cnt_lead0_53b.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_rptr_min_global.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_rptr_macros.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_out_dp.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_out_ctl.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_mul_frac_dp.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_mul_exp_dp.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_mul_ctl.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_in_dp.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_in_ctl.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_div_frac_dp.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_div_exp_dp.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_div_ctl.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_add_frac_dp.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_add_exp_dp.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_add_ctl.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_rptr_groups.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_in2_gt_in1_3to1.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_in2_gt_in1_3b.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_in2_gt_in1_2b.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_denorm_3to1.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_denorm_3b.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_cnt_lead0_lvl4.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_cnt_lead0_lvl3.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_cnt_lead0_lvl2.v" \
    "${OST1_ROOT}/fpu/rtl/fpu_cnt_lead0_lvl1.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_wrap.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_shft.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_rml.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_ecl.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_ecc.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_div.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_byp.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_alu.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_rml_inc3.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_rml_cwp.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_reg.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_ecl_wb.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_ecl_mdqctl.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_ecl_eccctl.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_ecl_divcntl.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_eclccr.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_eclbyplog_rs1.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_eclbyplog.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_ecc_dec.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_div_yreg.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_div_32eql.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_byp_eccgen.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_alu_16eql.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_aluzcmp64.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_alulogic.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_aluaddsub.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_rndrob.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_ecl_cnt6.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_eclcomp7.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_aluspr.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_aluor32.v" \
    "${OST1_ROOT}/exu/rtl/sparc_exu_aluadder64.v" \
    "${OST1_ROOT}/exu/bw_r_irf/rtl/bw_r_irf_wrap.v" \
    "${OST1_ROOT}/exu/bw_r_irf/rtl/bw_r_irf.v" \
    "${OST1_ROOT}/exu/bw_r_irf/bw_r_irf_register8/rtl/bw_r_irf_register8.v" \
    "${OST1_ROOT}/exu/bw_r_irf/bw_r_irf_register16/rtl/bw_r_irf_register16.v" \
    "${OST1_ROOT}/exu/bw_r_irf/common/rtl/bw_r_irf_register.v" \
    "${OST1_ROOT}/ffu/rtl/sparc_ffu_nospu_wrap.v" \
    "${OST1_ROOT}/ffu/rtl/sparc_ffu.v" \
    "${OST1_ROOT}/ffu/rtl/sparc_ffu_vis.v" \
    "${OST1_ROOT}/ffu/rtl/sparc_ffu_dp.v" \
    "${OST1_ROOT}/ffu/rtl/sparc_ffu_ctl.v" \
    "${OST1_ROOT}/ffu/rtl/sparc_ffu_part_add32.v" \
    "${OST1_ROOT}/ffu/rtl/sparc_ffu_ctl_visctl.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_nospu_wrap.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_wseldp.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_swl.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_sscan.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_invctl.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_imd.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_ifqdp.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_ifqctl.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_fdp.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_fcl.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_errdp.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_errctl.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_dec.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_dcl.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_thrfsm.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_thrcmpl.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_swpla.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_rndrob.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_par34.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_par32.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_par16.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_milfsm.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_lru4.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_lfsr5.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_incr46.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_esl.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_ctr5.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_cmp35.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_esl_stsm.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_esl_shiftreg.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_esl_rtsm.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_esl_lfsr.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_esl_htsm.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_esl_counter.v" \
    "${OST1_ROOT}/ifu/rtl/sparc_ifu_esl_fsm.v" \
    "${OST1_ROOT}/lsu/rtl/lsu_nospu_wrap.v" \
    "${OST1_ROOT}/lsu/rtl/lsu.v" \
    "${OST1_ROOT}/lsu/rtl/lsu_tlbdp.v" \
    "${OST1_ROOT}/lsu/rtl/lsu_tagdp.v" \
    "${OST1_ROOT}/lsu/rtl/lsu_stb_rwdp.v" \
    "${OST1_ROOT}/lsu/rtl/lsu_stb_rwctl.v" \
    "${OST1_ROOT}/lsu/rtl/lsu_stb_ctldp.v" \
    "${OST1_ROOT}/lsu/rtl/lsu_stb_ctl.v" \
    "${OST1_ROOT}/lsu/rtl/lsu_qdp2.v" \
    "${OST1_ROOT}/lsu/rtl/lsu_qdp1.v" \
    "${OST1_ROOT}/lsu/rtl/lsu_qctl2.v" \
    "${OST1_ROOT}/lsu/rtl/lsu_qctl1.v" \
    "${OST1_ROOT}/lsu/rtl/lsu_excpctl.v" \
    "${OST1_ROOT}/lsu/rtl/lsu_dctldp.v" \
    "${OST1_ROOT}/lsu/rtl/lsu_dctl.v" \
    "${OST1_ROOT}/lsu/rtl/lsu_dcdp.v" \
    "${OST1_ROOT}/lsu/rtl/lsu_rrobin_picker2.v" \
    "${OST1_ROOT}/lsu/rtl/lsu_pcx_qmon.v" \
    "${OST1_ROOT}/lsu/rtl/lsu_dc_parity_gen.v" \
    "${OST1_ROOT}/lsu/rtl/lsu_dcache_lfsr.v" \
    "${OST1_ROOT}/lsu/rtl/lsu_asi_decode.v" \
    "${OST1_ROOT}/mul/rtl/sparc_mul_top_nospu_wrap.v" \
    "${OST1_ROOT}/mul/rtl/sparc_mul_top.v" \
    "${OST1_ROOT}/mul/rtl/sparc_mul_dp.v" \
    "${OST1_ROOT}/mul/rtl/sparc_mul_cntl.v" \
    "${OST1_ROOT}/tlu/rtl/tlu_nospu_wrap.v" \
    "${OST1_ROOT}/tlu/rtl/tlu.v" \
    "${OST1_ROOT}/tlu/rtl/tlu_tdp.v" \
    "${OST1_ROOT}/tlu/rtl/tlu_tcl.v" \
    "${OST1_ROOT}/tlu/rtl/tlu_pib.v" \
    "${OST1_ROOT}/tlu/rtl/tlu_mmu_dp.v" \
    "${OST1_ROOT}/tlu/rtl/tlu_mmu_ctl.v" \
    "${OST1_ROOT}/tlu/rtl/tlu_misctl.v" \
    "${OST1_ROOT}/tlu/rtl/tlu_incr64.v" \
    "${OST1_ROOT}/tlu/rtl/tlu_hyperv.v" \
    "${OST1_ROOT}/tlu/rtl/sparc_tlu_intdp.v" \
    "${OST1_ROOT}/tlu/rtl/sparc_tlu_intctl.v" \
    "${OST1_ROOT}/tlu/rtl/tlu_rrobin_picker.v" \
    "${OST1_ROOT}/tlu/rtl/tlu_prencoder16.v" \
    "${OST1_ROOT}/tlu/rtl/tlu_addern_32.v" \
    "${OST1_ROOT}/tlu/rtl/sparc_tlu_zcmp64.v" \
    "${OST1_ROOT}/tlu/rtl/sparc_tlu_penc64.v" \
    "${OST1_ROOT}/tlu/rtl/sparc_tlu_dec64.v" \
    "${OST1_ROOT}/srams/rtl/bw_r_dtlb.v" \
    "${OST1_ROOT}/srams/rtl/bw_r_itlb.v" \
    "${OST1_ROOT}/srams/rtl/bw_r_ict.v" \
    "${OST1_ROOT}/srams/rtl/bw_r_icd.v" \
    "${OST1_ROOT}/srams/rtl/bw_r_dct.v" \
    "${OST1_ROOT}/srams/rtl/bw_r_dcd.v" \
    "${OST1_ROOT}/srams/rtl/bw_r_scm.v" \
    "${OST1_ROOT}/srams/rtl/bw_r_frf.v" \
    "${OST1_ROOT}/srams/rtl/bw_r_rf32x80.v" \
    "${OST1_ROOT}/srams/rtl/bw_r_rf32x152b.v" \
    "${OST1_ROOT}/srams/rtl/bw_r_rf16x160.v" \
    "${OST1_ROOT}/srams/rtl/sram_l1d_val.v" \
    "${OST1_ROOT}/srams/rtl/sram_l1i_val.v" \
    "${OST1_ROOT}/srams/rtl/sram_wrappers/sram_1rw_128x78.v" \
    "${OST1_ROOT}/srams/rtl/sram_wrappers/sram_l1d_data.v" \
    "${OST1_ROOT}/srams/rtl/sram_wrappers/sram_l1d_tag.v" \
    "${OST1_ROOT}/srams/rtl/sram_wrappers/sram_l1i_data.v" \
    "${OST1_ROOT}/srams/rtl/sram_wrappers/sram_l1i_tag.v" \
    "${DV_ROOT}/design/chipset/rv64_platform/bootrom/baremetal/bootrom.sv"                    \
    "${DV_ROOT}/design/chipset/rv64_platform/bootrom/linux/bootrom_linux.sv"                  \
    "${ARIANE_ROOT}/core/include/cv64a6_imafdc_sv39_config_pkg.sv" \
    "${ARIANE_ROOT}/core/include/riscv_pkg.sv"                                 \
    "${ARIANE_ROOT}/corev_apu/riscv-dbg/src/dm_pkg.sv"                          \
    "${ARIANE_ROOT}/core/include/ariane_pkg.sv"                                \
    "${ARIANE_ROOT}/corev_apu/tb/ariane_soc_pkg.sv"                                 \
    "${ARIANE_ROOT}/corev_apu/axi/src/axi_pkg.sv"                               \
    "${ARIANE_ROOT}/core/include/ariane_axi_pkg.sv"                            \
    "${ARIANE_ROOT}/core/include/wt_cache_pkg.sv"                              \
    "${ARIANE_ROOT}/core/include/axi_intf.sv"                                  \
    "${ARIANE_ROOT}/core/fpu/src/fpnew_pkg.sv"                             \
    "${ARIANE_ROOT}/core/include/cvxif_pkg.sv" \
    "${ARIANE_ROOT}/common/submodules/common_cells/src/cf_math_pkg.sv" \
    "${ARIANE_ROOT}/core/cvxif_example/include/cvxif_instr_pkg.sv" \
    "${ARIANE_ROOT}/corev_apu/rv_plic/rtl/rv_plic_reg_pkg.sv" \
    "${ARIANE_ROOT}/common/local/util/sram.sv"                                     \
    "${ARIANE_ROOT}/common/local/util/axi_master_connect.sv"                       \
    "${ARIANE_ROOT}/common/local/util/axi_master_connect_rev.sv"                   \
    "${ARIANE_ROOT}/common/local/util/axi_slave_connect.sv"                        \
    "${ARIANE_ROOT}/common/local/util/axi_slave_connect_rev.sv"                    \
    "${ARIANE_ROOT}/common/submodules/common_cells/src/deprecated/rrarbiter.sv"         \
    "${ARIANE_ROOT}/common/submodules/common_cells/src/deprecated/fifo_v1.sv"           \
    "${ARIANE_ROOT}/common/submodules/common_cells/src/deprecated/fifo_v2.sv"           \
    "${ARIANE_ROOT}/common/submodules/common_cells/src/fifo_v3.sv"                      \
    "${ARIANE_ROOT}/common/submodules/common_cells/src/shift_reg.sv"                    \
    "${ARIANE_ROOT}/common/submodules/common_cells/src/lfsr_8bit.sv"                    \
    "${ARIANE_ROOT}/common/submodules/common_cells/src/lfsr.sv"                    \
    "${ARIANE_ROOT}/common/submodules/common_cells/src/lzc.sv"                          \
    "${ARIANE_ROOT}/common/submodules/common_cells/src/exp_backoff.sv"                  \
    "${ARIANE_ROOT}/common/submodules/common_cells/src/rr_arb_tree.sv"                  \
    "${ARIANE_ROOT}/common/submodules/common_cells/src/rstgen_bypass.sv"                \
    "${ARIANE_ROOT}/common/submodules/common_cells/src/cdc_2phase.sv"                   \
    "${ARIANE_ROOT}/common/submodules/common_cells/src/unread.sv"                       \
    "${ARIANE_ROOT}/common/submodules/common_cells/src/popcount.sv"                     \
    "${ARIANE_ROOT}/corev_apu/axi_mem_if/src/axi2mem.sv"                        \
    "${ARIANE_ROOT}/corev_apu/src/tech_cells_generic/src/fpga/tc_clk_xilinx.sv"         \
    "${ARIANE_ROOT}/corev_apu/src/tech_cells_generic/src/fpga/tc_sram_xilinx.sv"        \
    "${ARIANE_ROOT}/corev_apu/src/tech_cells_generic/src/deprecated/cluster_clk_cells.sv" \
    "${ARIANE_ROOT}/corev_apu/src/tech_cells_generic/src/deprecated/pulp_clk_cells.sv" \
    "${ARIANE_ROOT}/common/local/util/tc_sram_xilinx_wrapper.sv"           \
    "${ARIANE_ROOT}/core/axi_adapter.sv"                                   \
    "${ARIANE_ROOT}/core/alu.sv"                                           \
    "${ARIANE_ROOT}/core/fpu_wrap.sv"                                      \
    "${ARIANE_ROOT}/core/ariane.sv"                                        \
    "${ARIANE_ROOT}/core/cva6.sv"                                        \
    "${ARIANE_ROOT}/core/branch_unit.sv"                                   \
    "${ARIANE_ROOT}/core/compressed_decoder.sv"                            \
    "${ARIANE_ROOT}/core/controller.sv"                                    \
    "${ARIANE_ROOT}/core/csr_buffer.sv"                                    \
    "${ARIANE_ROOT}/core/csr_regfile.sv"                                   \
    "${ARIANE_ROOT}/core/decoder.sv"                                       \
    "${ARIANE_ROOT}/core/ex_stage.sv"                                      \
    "${ARIANE_ROOT}/core/frontend/btb.sv"                                  \
    "${ARIANE_ROOT}/core/frontend/bht.sv"                                  \
    "${ARIANE_ROOT}/core/frontend/ras.sv"                                  \
    "${ARIANE_ROOT}/core/frontend/instr_scan.sv"                           \
    "${ARIANE_ROOT}/core/frontend/instr_queue.sv"                          \
    "${ARIANE_ROOT}/core/frontend/frontend.sv"                             \
    "${ARIANE_ROOT}/core/id_stage.sv"                                      \
    "${ARIANE_ROOT}/core/instr_realign.sv"                                 \
    "${ARIANE_ROOT}/core/issue_read_operands.sv"                           \
    "${ARIANE_ROOT}/core/issue_stage.sv"                                   \
    "${ARIANE_ROOT}/core/load_unit.sv"                                     \
    "${ARIANE_ROOT}/core/load_store_unit.sv"                               \
    "${ARIANE_ROOT}/core/lsu_bypass.sv"                               \
    "${ARIANE_ROOT}/core/mmu_sv39/mmu.sv"                                           \
    "${ARIANE_ROOT}/core/mult.sv"                                          \
    "${ARIANE_ROOT}/core/multiplier.sv"                                    \
    "${ARIANE_ROOT}/core/serdiv.sv"                                        \
    "${ARIANE_ROOT}/core/perf_counters.sv"                                 \
    "${ARIANE_ROOT}/core/mmu_sv39/ptw.sv"                                           \
    "${ARIANE_ROOT}/core/ariane_regfile_ff.sv"                             \
    "${ARIANE_ROOT}/core/re_name.sv"                                       \
    "${ARIANE_ROOT}/core/scoreboard.sv"                                    \
    "${ARIANE_ROOT}/core/store_buffer.sv"                                  \
    "${ARIANE_ROOT}/core/amo_buffer.sv"                                    \
    "${ARIANE_ROOT}/core/store_unit.sv"                                    \
    "${ARIANE_ROOT}/core/mmu_sv39/tlb.sv"                                           \
    "${ARIANE_ROOT}/core/commit_stage.sv"                                  \
    "${ARIANE_ROOT}/core/cache_subsystem/wt_dcache_ctrl.sv"                \
    "${ARIANE_ROOT}/core/cache_subsystem/wt_dcache_mem.sv"                 \
    "${ARIANE_ROOT}/core/cache_subsystem/wt_dcache_missunit.sv"            \
    "${ARIANE_ROOT}/core/cache_subsystem/wt_dcache_wbuffer.sv"             \
    "${ARIANE_ROOT}/core/cache_subsystem/wt_dcache.sv"                     \
    "${ARIANE_ROOT}/core/cache_subsystem/cva6_icache.sv"                     \
    "${ARIANE_ROOT}/core/cache_subsystem/cva6_icache_axi_wrapper.sv"                     \
    "${ARIANE_ROOT}/core/cache_subsystem/wt_l15_adapter.sv"                \
    "${ARIANE_ROOT}/core/cache_subsystem/wt_cache_subsystem.sv"            \
    "${ARIANE_ROOT}/corev_apu/clint/clint.sv"                                   \
    "${ARIANE_ROOT}/corev_apu/clint/axi_lite_interface.sv"                      \
    "${ARIANE_ROOT}/corev_apu/riscv-dbg/debug_rom/debug_rom.sv"                 \
    "${ARIANE_ROOT}/corev_apu/riscv-dbg/src/dm_csrs.sv"                         \
    "${ARIANE_ROOT}/corev_apu/riscv-dbg/src/dm_mem.sv"                          \
    "${ARIANE_ROOT}/corev_apu/riscv-dbg/src/dm_top.sv"                          \
    "${ARIANE_ROOT}/corev_apu/riscv-dbg/src/dmi_cdc.sv"                         \
    "${ARIANE_ROOT}/corev_apu/riscv-dbg/src/dmi_jtag.sv"                        \
    "${ARIANE_ROOT}/corev_apu/riscv-dbg/src/dm_sba.sv"                          \
    "${ARIANE_ROOT}/corev_apu/riscv-dbg/src/dmi_jtag_tap.sv"                    \
    "${ARIANE_ROOT}/corev_apu/openpiton/riscv_peripherals.sv"                       \
    "${ARIANE_ROOT}/corev_apu/openpiton/ariane_verilog_wrap.sv"                     \
    "${ARIANE_ROOT}/corev_apu/openpiton/bootrom/baremetal/bootrom.sv"               \
    "${ARIANE_ROOT}/corev_apu/openpiton/bootrom/linux/bootrom_linux.sv"             \
    "${ARIANE_ROOT}/corev_apu/rv_plic/rtl/rv_plic_target.sv"                    \
    "${ARIANE_ROOT}/corev_apu/rv_plic/rtl/rv_plic_gateway.sv"                   \
    "${ARIANE_ROOT}/corev_apu/rv_plic/rtl/plic_regmap.sv"                       \
    "${ARIANE_ROOT}/corev_apu/rv_plic/rtl/plic_top.sv"                          \
    "${ARIANE_ROOT}/corev_apu/fpga/src/axi2apb/src/axi2apb_wrap.sv"                 \
    "${ARIANE_ROOT}/corev_apu/fpga/src/axi2apb/src/axi2apb.sv"                      \
    "${ARIANE_ROOT}/corev_apu/fpga/src/axi2apb/src/axi2apb_64_32.sv"                \
    "${ARIANE_ROOT}/corev_apu/fpga/src/axi_slice/src/axi_w_buffer.sv"               \
    "${ARIANE_ROOT}/corev_apu/fpga/src/axi_slice/src/axi_b_buffer.sv"               \
    "${ARIANE_ROOT}/corev_apu/fpga/src/axi_slice/src/axi_slice_wrap.sv"             \
    "${ARIANE_ROOT}/corev_apu/fpga/src/axi_slice/src/axi_slice.sv"                  \
    "${ARIANE_ROOT}/corev_apu/fpga/src/axi_slice/src/axi_single_slice.sv"           \
    "${ARIANE_ROOT}/corev_apu/fpga/src/axi_slice/src/axi_ar_buffer.sv"              \
    "${ARIANE_ROOT}/corev_apu/fpga/src/axi_slice/src/axi_r_buffer.sv"               \
    "${ARIANE_ROOT}/corev_apu/fpga/src/axi_slice/src/axi_aw_buffer.sv"              \
    "${ARIANE_ROOT}/corev_apu/register_interface/src/apb_to_reg.sv"             \
    "${ARIANE_ROOT}/corev_apu/register_interface/src/reg_intf.sv"               \
    "${ARIANE_ROOT}/corev_apu/register_interface/src/reg_intf_pkg.sv"           \
    "${ARIANE_ROOT}/core/fpu/src/fpu_div_sqrt_mvp/hdl/defs_div_sqrt_mvp.sv"      \
    "${ARIANE_ROOT}/core/fpu/src/fpu_div_sqrt_mvp/hdl/control_mvp.sv"            \
    "${ARIANE_ROOT}/core/fpu/src/fpu_div_sqrt_mvp/hdl/div_sqrt_mvp_wrapper.sv"   \
    "${ARIANE_ROOT}/core/fpu/src/fpu_div_sqrt_mvp/hdl/div_sqrt_top_mvp.sv"       \
    "${ARIANE_ROOT}/core/fpu/src/fpu_div_sqrt_mvp/hdl/iteration_div_sqrt_mvp.sv" \
    "${ARIANE_ROOT}/core/fpu/src/fpu_div_sqrt_mvp/hdl/norm_div_sqrt_mvp.sv"      \
    "${ARIANE_ROOT}/core/fpu/src/fpu_div_sqrt_mvp/hdl/nrbd_nrsc_mvp.sv"          \
    "${ARIANE_ROOT}/core/fpu/src/fpu_div_sqrt_mvp/hdl/preprocess_mvp.sv"         \
    "${ARIANE_ROOT}/core/fpu/src/fpnew_cast_multi.sv"                            \
    "${ARIANE_ROOT}/core/fpu/src/fpnew_classifier.sv"                            \
    "${ARIANE_ROOT}/core/fpu/src/fpnew_divsqrt_multi.sv"                         \
    "${ARIANE_ROOT}/core/fpu/src/fpnew_fma_multi.sv"                             \
    "${ARIANE_ROOT}/core/fpu/src/fpnew_fma.sv"                                   \
    "${ARIANE_ROOT}/core/fpu/src/fpnew_noncomp.sv"                               \
    "${ARIANE_ROOT}/core/fpu/src/fpnew_opgroup_block.sv"                         \
    "${ARIANE_ROOT}/core/fpu/src/fpnew_opgroup_fmt_slice.sv"                     \
    "${ARIANE_ROOT}/core/fpu/src/fpnew_opgroup_multifmt_slice.sv"                \
    "${ARIANE_ROOT}/core/fpu/src/fpnew_rounding.sv"                              \
    "${ARIANE_ROOT}/core/fpu/src/fpnew_top.sv" \
    "${ARIANE_ROOT}/core/pmp/src/pmp.sv" \
    "${ARIANE_ROOT}/core/pmp/src/pmp_entry.sv" \                                \
    "${ARIANE_ROOT}/core/cvxif_example/cvxif_example_coprocessor.sv" \
    "${ARIANE_ROOT}/core/cvxif_example/instr_decoder.sv" \
    "${ARIANE_ROOT}/common/submodules/common_cells/src/counter.sv" \
    "${ARIANE_ROOT}/common/submodules/common_cells/src/delta_counter.sv" \
    "${ARIANE_ROOT}/core/cvxif_fu.sv" \
]

set CHIP_INCLUDE_FILES [list \
]

set CHIP_IP_FILE_PREFIXES [list \
    "${DV_ROOT}/design/chip/xilinx/${BOARD}/ip_cores/clk_mmcm_chip/clk_mmcm_chip" \
    "${DV_ROOT}/design/chip/chip_bridge/xilinx/${BOARD}/ip_cores/afifo_w64_d16/afifo_w64_d16" \
    "${DV_ROOT}/design/chip/chip_bridge/xilinx/${BOARD}/ip_cores/afifo_w3_d16/afifo_w3_d16" \
    "${DV_ROOT}/design/chip/chip_bridge/xilinx/${BOARD}/ip_cores/fifo_w64_d16/fifo_w64_d16" \
    "${DV_ROOT}/design/chip/chip_bridge/xilinx/${BOARD}/ip_cores/fifo_w3_d16/fifo_w3_d16" \
]

set CHIP_COE_IP_FILES [list \
]

set CHIP_PRJ_IP_FILES [list \
]

set PASSTHRU_RTL_IMPL_FILES [list \
    "${DV_ROOT}/design/passthru/rtl/passthru.v" \
    "${DV_ROOT}/design/passthru/passthru_nodec/rtl/passthru_nodec.v" \
    "${DV_ROOT}/design/passthru/passthru_dec/rtl/passthru_dec.v" \
    "${DV_ROOT}/design/common/rtl/chip_rst_seq.v" \
    "${DV_ROOT}/design/common/rtl/alarm_counter.v" \
    "${DV_ROOT}/design/common/fpga_bridge/rtl/fpga_bridge.v" \
    "${DV_ROOT}/design/common/fpga_bridge/fpga_send/rtl/fpga_net_chooser_32.v" \
    "${DV_ROOT}/design/common/fpga_bridge/fpga_send/rtl/fpga_bridge_send_32.v" \
    "${DV_ROOT}/design/common/fpga_bridge/fpga_rcv/rtl/fpga_bridge_rcv_32.v" \
    "${DV_ROOT}/design/common/uart_pkttrace_dump/rtl/uart_pkttrace_dump.v" \
    "${DV_ROOT}/design/common/uart_pkttrace_dump/rtl/uart_serializer.v" \
    "${DV_ROOT}/design/common/uart_pkttrace_dump/rtl/noc2string.v" \
    "${DV_ROOT}/design/common/uart_pkttrace_dump/rtl/side2string.v" \
    "${DV_ROOT}/design/common/uart_pkttrace_dump/rtl/bits2hex.v" \
    "${DV_ROOT}/design/common/uart_pkttrace_dump/rtl/demux_process_pkt.v" \
    "${DV_ROOT}/design/common/uart_pkttrace_dump/rtl/process_pkt_complete.v" \
    "${DV_ROOT}/design/common/uart_pkttrace_dump/rtl/mux_process_pkt.v" \
    "${DV_ROOT}/design/common/uart/rtl/Const.v" \
    "${DV_ROOT}/design/common/uart/rtl/Counter.v" \
    "${DV_ROOT}/design/common/uart/rtl/IORegister.v" \
    "${DV_ROOT}/design/common/uart/rtl/ParityGen.v" \
    "${DV_ROOT}/design/common/uart/rtl/Register.v" \
    "${DV_ROOT}/design/common/uart/rtl/Reverse.v" \
    "${DV_ROOT}/design/common/uart/rtl/ShiftRegister.v" \
    "${DV_ROOT}/design/common/uart/rtl/UART.v" \
    "${DV_ROOT}/design/common/uart/rtl/UAReceiver.v" \
    "${DV_ROOT}/design/common/uart/rtl/UATransmitter.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/valrdy_to_credit.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/credit_to_valrdy.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/common/rtl/network_input_blk_multi_out.v" \
]

set PASSTHRU_INCLUDE_FILES [list \
]

set PASSTHRU_IP_FILE_PREFIXES [list \
    "${DV_ROOT}/design/passthru/xilinx/${BOARD}/ip_cores/clk_dcm/clk_dcm" \
    "${DV_ROOT}/design/passthru/passthru_nodec/xilinx/${BOARD}/ip_cores/afifo_w66_d1024/afifo_w66_d1024" \
    "${DV_ROOT}/design/passthru/passthru_nodec/xilinx/${BOARD}/ip_cores/afifo_w3_d1024/afifo_w3_d1024" \
    "${DV_ROOT}/design/common/fpga_bridge/common/xilinx/${BOARD}/ip_cores/afifo_w64/afifo_w64" \
    "${DV_ROOT}/design/common/fpga_bridge/fpga_rcv/xilinx/${BOARD}/ip_cores/afifo_w3/afifo_w3" \
]

set PASSTHRU_COE_IP_FILES [list \
]

set PASSTHRU_PRJ_IP_FILES [list \
]

set CHIPSET_RTL_IMPL_FILES [list \
    "${DV_ROOT}/design/common/rtl/bram_sdp_wrapper.v" \
    "${DV_ROOT}/design/chipset/rtl/chipset.v" \
    "${DV_ROOT}/design/chipset/rtl/chipset_impl.v" \
    "${DV_ROOT}/design/chipset/rtl/chipset_impl_noc_power_test.v" \
    "${DV_ROOT}/design/chipset/rtl/blinker.v" \
    "${DV_ROOT}/design/chipset/rtl/packet_filter.v" \
    "${DV_ROOT}/design/chipset/rtl/storage_addr_trans.v" \
    "${DV_ROOT}/design/chipset/rtl/storage_addr_trans_unified.v" \
    "${DV_ROOT}/design/chipset/rtl/test_end_checker.v" \
    "${DV_ROOT}/design/chipset/common/rtl/noc_bidir_afifo.v" \
    "${DV_ROOT}/design/common/fpga_bridge/rtl/fpga_bridge.v" \
    "${DV_ROOT}/design/common/fpga_bridge/fpga_send/rtl/fpga_net_chooser_32.v" \
    "${DV_ROOT}/design/common/fpga_bridge/fpga_send/rtl/fpga_bridge_send_32.v" \
    "${DV_ROOT}/design/common/fpga_bridge/fpga_rcv/rtl/fpga_bridge_rcv_32.v" \
    "${DV_ROOT}/design/chipset/mem_io_splitter/rtl/mem_io_splitter.v" \
    "${DV_ROOT}/design/chipset/mem_io_splitter/rtl/iob_splitter.v" \
    "${DV_ROOT}/design/chipset/mem_io_splitter/rtl/uart_boot_splitter.v" \
    "${DV_ROOT}/design/chipset/mem_io_splitter/rtl/net_uart_splitter.v" \
    "${DV_ROOT}/design/chipset/io_xbar/rtl/io_xbar_top.v" \
    "${DV_ROOT}/design/chipset/io_xbar/rtl/io_xbar_top_wrap.v" \
    "${DV_ROOT}/design/chipset/io_xbar/dynamic/rtl/io_xbar_input_control.v" \
    "${DV_ROOT}/design/chipset/io_xbar/dynamic/rtl/io_xbar_input_route_request_calc.v" \
    "${DV_ROOT}/design/chipset/io_xbar/dynamic/rtl/io_xbar_input_top_16.v" \
    "${DV_ROOT}/design/chipset/io_xbar/dynamic/rtl/io_xbar_input_top_4.v" \
    "${DV_ROOT}/design/chipset/io_xbar/dynamic/rtl/io_xbar_output_control.v" \
    "${DV_ROOT}/design/chipset/io_xbar/dynamic/rtl/io_xbar_output_datapath.v" \
    "${DV_ROOT}/design/chipset/io_xbar/dynamic/rtl/io_xbar_output_top.v" \
    "${DV_ROOT}/design/chipset/io_xbar/common/rtl/io_xbar_space_avail_top.v" \
    "${DV_ROOT}/design/chipset/io_xbar/components/rtl/io_xbar_one_of_n.v" \
    "${DV_ROOT}/design/chipset/io_xbar/components/rtl/io_xbar_one_of_n_plus_3.v" \
    "${DV_ROOT}/design/chipset/io_xbar/components/rtl/io_xbar_net_dff.v" \
    "${DV_ROOT}/design/chipset/io_xbar/components/rtl/io_xbar_bus_compare_equal.v" \
    "${DV_ROOT}/design/chipset/io_xbar/components/rtl/io_xbar_flip_bus.v" \
    "${DV_ROOT}/design/chipset/io_ctrl/rtl/ciop_iob.v" \
    "${DV_ROOT}/design/chipset/io_ctrl/rtl/net_int_sync.v" \
    "${DV_ROOT}/design/chipset/io_ctrl/rtl/uart_top.v" \
    "${DV_ROOT}/design/chipset/io_ctrl/rtl/uart_writer.v" \
    "${DV_ROOT}/design/chipset/io_ctrl/rtl/uart_reader.v" \
    "${DV_ROOT}/design/chipset/io_ctrl/rtl/uart_mux.v" \
    "${DV_ROOT}/design/chipset/io_ctrl/rtl/uart_reseter.v" \
    "${DV_ROOT}/design/chipset/io_ctrl/rtl/fake_boot_ctrl.v" \
    "${DV_ROOT}/design/chipset/io_ctrl/rtl/eth_top.v" \
    "${DV_ROOT}/design/chipset/mc/rtl/mc_top.v" \
    "${DV_ROOT}/design/chipset/mc/rtl/f1_mc_top.v" \
    "${DV_ROOT}/design/chipset/mc/rtl/noc_mig_bridge.v" \
    "${DV_ROOT}/design/chipset/mc/rtl/memory_zeroer.v" \
    "${DV_ROOT}/design/chipset/noc_axilite_bridge/rtl/noc_axilite_bridge.v" \
    "${DV_ROOT}/design/chipset/noc_axi4_bridge/rtl/noc_axi4_bridge.v" \
    "${DV_ROOT}/design/chipset/noc_axi4_bridge/rtl/noc_axi4_bridge_ser.v" \
    "${DV_ROOT}/design/chipset/noc_axi4_bridge/rtl/noc_axi4_bridge_deser.v" \
    "${DV_ROOT}/design/chipset/noc_axi4_bridge/rtl/noc_axi4_bridge_read.v" \
    "${DV_ROOT}/design/chipset/noc_axi4_bridge/rtl/noc_axi4_bridge_write.v" \
    "${DV_ROOT}/design/chipset/noc_axi4_bridge/rtl/noc_axi4_bridge_buffer.v" \
    "${DV_ROOT}/design/chipset/noc_axi4_bridge/rtl/noc_axi4_bridge_sram_data.v" \
    "${DV_ROOT}/design/chipset/noc_axi4_bridge/rtl/noc_axi4_bridge_sram_req.v" \
    "${DV_ROOT}/design/chipset/noc_axi4_bridge/rtl/axi4_zeroer.v" \
    "${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/axi_sd_bridge.v" \
    "${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/spi_master.v" \
    "${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/init_sd.v" \
    "${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/read_write_sd_block.v" \
    "${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/rwspi_wire_data.v" \
    "${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/sd_block_cache.v" \
    "${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/sd_cache_defines.v" \
    "${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/sd_wishbone_transaction_manager.v" \
    "${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/send_cmd.v" \
    "${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/sm_dp_mem_dc.v" \
    "${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/sm_fifo_rtl.v" \
    "${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/sm_rx_fifo.v" \
    "${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/sm_rx_fifo_bi.v" \
    "${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/sm_tx_fifo.v" \
    "${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/sm_tx_fifo_bi.v" \
    "${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/spi_control.v" \
    "${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/spi_master_defines.v" \
    "${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/spi_master_wishbone_decoder.v" \
    "${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/spi_tx_rx_data.v" \
    "${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/status_register_control.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/byte_en_reg.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/cdc_bits.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/cdc_pulse.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/piton_sd_buffer.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/piton_sd_cache_tag.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/piton_sd_cache_manager.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/piton_sd_core_ctrl.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/piton_sd_define.vh" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/piton_sd_init.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/piton_sd_top.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/piton_sd_transaction_manager.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/sd_clock_divider.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/sd_cmd_master.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/sd_cmd_serial_host.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/sd_controller_wb.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/sd_crc_16.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/sd_crc_7.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/sd_data_master.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/sd_data_serial_host.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/sd_data_xfer_trig.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/sd_defines.h" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/sd_fifo_filler.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/sd_wb_sel_ctrl.v" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/rtl/sdc_controller.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/valrdy_to_credit.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/credit_to_valrdy.v" \
    "${DV_ROOT}/design/chip/tile/dynamic_node/common/rtl/network_input_blk_multi_out.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_decoder.v" \
    "${DV_ROOT}/design/chip/tile/l2/rtl/l2_encoder.v" \
    "${DV_ROOT}/design/common/rtl/chip_rst_seq.v" \
    "${DV_ROOT}/design/common/rtl/alarm_counter.v" \
    "${DV_ROOT}/design/common/uart/rtl/Const.v" \
    "${DV_ROOT}/design/common/uart/rtl/Counter.v" \
    "${DV_ROOT}/design/common/uart/rtl/ParityGen.v" \
    "${DV_ROOT}/design/common/uart/rtl/Register.v" \
    "${DV_ROOT}/design/common/uart/rtl/Reverse.v" \
    "${DV_ROOT}/design/common/uart/rtl/ShiftRegister.v" \
    "${DV_ROOT}/design/common/uart/rtl/IORegister.v" \
    "${DV_ROOT}/design/common/uart/rtl/UART.v" \
    "${DV_ROOT}/design/common/uart/rtl/UAReceiver.v" \
    "${DV_ROOT}/design/common/uart/rtl/UATransmitter.v" \
    "${DV_ROOT}/design/chipset/oled/rtl/oled_delay.v" \
    "${DV_ROOT}/design/chipset/oled/rtl/oled_transform.v" \
    "${DV_ROOT}/design/chipset/oled/rtl/oled_wrapper.v" \
    "${DV_ROOT}/design/chipset/oled/rtl/ssd1306_ctrl.v" \
    "${DV_ROOT}/design/chipset/oled/rtl/ssd1306_init.v" \
    "${DV_ROOT}/design/chipset/oled/rtl/ssd1306_spi.v" \
    "${DV_ROOT}/design/chipset/oled/rtl/ssd1306_top.v" \
]

set CHIPSET_INCLUDE_FILES [list \
    "${DV_ROOT}/design/chipset/include/mc_define.h" \
    "${DV_ROOT}/design/chipset/include/uart16550_define.vh" \
    "${DV_ROOT}/design/chipset/include/chipset_define.vh" \
    "${DV_ROOT}/design/chipset/noc_axi4_bridge/rtl/noc_axi4_bridge_define.vh" \
    "${ARIANE_ROOT}/src/common_cells/include/common_cells/registers.svh"
]

set CHIPSET_IP_FILE_PREFIXES [list \
    "${DV_ROOT}/design/chipset/xilinx/${BOARD}/ip_cores/clk_dcm/clk_dcm" \
    "${DV_ROOT}/design/chipset/xilinx/${BOARD}/ip_cores/clk_mmcm/clk_mmcm" \
    "${DV_ROOT}/design/chipset/xilinx/${BOARD}/ip_cores/afifo_w64_d128_std/afifo_w64_d128_std" \
    "${DV_ROOT}/design/chipset/xilinx/${BOARD}/ip_cores/mac_eth_axi_lite/mac_eth_axi_lite" \
    "${DV_ROOT}/design/chipset/io_ctrl/xilinx/${BOARD}/ip_cores/atg_uart_init/atg_uart_init" \
    "${DV_ROOT}/design/chipset/io_ctrl/xilinx/${BOARD}/ip_cores/uart_16550/uart_16550" \
    "${DV_ROOT}/design/chipset/io_ctrl/xilinx/${BOARD}/ip_cores/mem_uart_timeout/mem_uart_timeout" \
    "${DV_ROOT}/design/chipset/io_ctrl/xilinx/${BOARD}/ip_cores/bram_256x512/bram_256x512" \
    "${DV_ROOT}/design/chipset/io_ctrl/xilinx/${BOARD}/ip_cores/bram_16384x512/bram_16384x512" \
    "${DV_ROOT}/design/chipset/io_ctrl/xilinx/${BOARD}/ip_cores/bram_8192x512/bram_8192x512" \
    "${DV_ROOT}/design/chipset/mc/xilinx/${BOARD}/ip_cores/mig_7series_0/mig_7series_0" \
    "${DV_ROOT}/design/chipset/mc/xilinx/${BOARD}/ip_cores/ddr4_0/ddr4_0" \
    "${DV_ROOT}/design/chipset/mc/xilinx/${BOARD}/ip_cores/ddr4_axi4/ddr4_axi4" \
    "${DV_ROOT}/design/chipset/mc/xilinx/${BOARD}/ip_cores/axi_interconnect/axi_interconnect" \
    "${DV_ROOT}/design/chipset/mc/xilinx/${BOARD}/ip_cores/mig_7series_axi4/mig_7series_axi4" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/xilinx/${BOARD}/ip_cores/sd_data_fifo/sd_data_fifo" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/xilinx/${BOARD}/ip_cores/sd_ctrl_fifo/sd_ctrl_fifo" \
    "${DV_ROOT}/design/chipset/noc_sd_bridge/xilinx/${BOARD}/ip_cores/sd_cache_bram/sd_cache_bram" \
    "${DV_ROOT}/design/common/fpga_bridge/common/xilinx/${BOARD}/ip_cores/afifo_w64/afifo_w64" \
    "${DV_ROOT}/design/common/fpga_bridge/fpga_rcv/xilinx/${BOARD}/ip_cores/afifo_w3/afifo_w3" \

]

set CHIPSET_COE_IP_FILES [list \
    "${DV_ROOT}/design/chipset/io_ctrl/xilinx/${BOARD}/ip_cores/atg_uart_init/uart_data.coe" \
    "${DV_ROOT}/design/chipset/io_ctrl/xilinx/${BOARD}/ip_cores/atg_uart_init/uart_addr.coe" \
    "${DV_ROOT}/design/chipset/io_ctrl/xilinx/common/ip_cores/bram_256x512/test_proto.coe" \
    "${DV_ROOT}/design/chipset/io_ctrl/xilinx/${BOARD}/ip_cores/bram_16384x512/obp.coe" \
]

set CHIPSET_PRJ_IP_FILES [list \
    "${DV_ROOT}/design/chipset/mc/xilinx/${BOARD}/ip_cores/mig_7series_0/mig_a.prj" \
    "${DV_ROOT}/design/chipset/mc/xilinx/${BOARD}/ip_cores/mig_7series_axi4/mig_b.prj" \
]
