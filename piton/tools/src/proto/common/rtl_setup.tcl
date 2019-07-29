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

set GLOBAL_INCLUDE_DIRS "${DV_ROOT}/design/include ${DV_ROOT}/design/chipset/include ${DV_ROOT}/design/chip/tile/ariane/src/common_cells/include/"

# RTL include files
set GLOBAL_INCLUDE_FILES [list \
    "${DV_ROOT}/design/include/define.h" \
    "${DV_ROOT}/design/include/piton_system.vh" \
    "${DV_ROOT}/design/include/dmbr_define.v" \
    "${DV_ROOT}/design/include/l15.h" \
    "${DV_ROOT}/design/include/l2.h" \
    "${DV_ROOT}/design/include/network_define.v" \
    "${DV_ROOT}/design/include/jtag.vh" \
    "${DV_ROOT}/design/include/ifu.h" \
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
    "${DV_ROOT}/design/chip/tile/rtl/ccx_l15_transducer.v" \
    "${DV_ROOT}/design/chip/tile/rtl/pico_l15_transducer.v" \
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
    "${DV_ROOT}/design/chip/tile/l15/rtl/l15_picoencoder.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/l15_cpxencoder.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/noc3encoder.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/noc3buffer.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/noc2decoder.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/noc1encoder.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/noc1buffer.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/simplenocbuffer.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/pico_decoder.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/pcx_decoder.v" \
    "${DV_ROOT}/design/chip/tile/l15/rtl/pcx_buffer.v" \
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
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_arb_wrap.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_arb.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_buf.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_out.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_mul.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_in.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_div.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_add.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_in2_gt_in1_frac.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_denorm_frac.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_cnt_lead0_64b.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_cnt_lead0_53b.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_rptr_min_global.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_rptr_macros.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_out_dp.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_out_ctl.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_mul_frac_dp.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_mul_exp_dp.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_mul_ctl.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_in_dp.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_in_ctl.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_div_frac_dp.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_div_exp_dp.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_div_ctl.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_add_frac_dp.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_add_exp_dp.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_add_ctl.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_rptr_groups.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_in2_gt_in1_3to1.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_in2_gt_in1_3b.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_in2_gt_in1_2b.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_denorm_3to1.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_denorm_3b.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_cnt_lead0_lvl4.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_cnt_lead0_lvl3.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_cnt_lead0_lvl2.v" \
    "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_cnt_lead0_lvl1.v" \
    "${DV_ROOT}/design/chip/tile/rtap/rtl/rtap.v" \
    "${DV_ROOT}/design/chip/tile/rtap/rtl/rtap_ucb_transmitter.v" \
    "${DV_ROOT}/design/chip/tile/rtap/rtl/rtap_ucb_receiver.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/swrvr_clib.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/swrvr_dlib.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/u1.beh.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/m1.beh.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/mul64.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/ucb_bus_out.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/ucb_bus_in.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/valrdy_to_credit.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/credit_to_valrdy.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/flat_id_to_xy.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/clk_gating_latch.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/test_stub_scan.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/synchronizer_asr.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/synchronizer_asr_dup.v" \
    "${DV_ROOT}/design/chip/tile/common/srams/rtl/bw_r_rf16x160.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/ucb_flow_2buf.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/sync_pulse_synchronizer.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/dbl_buf.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/ucb_flow_spi.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/test_stub_bist.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/ucb_flow_jbi.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/ucb_noflow.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/cluster_header.v" \
    "${DV_ROOT}/design/chip/tile/common/rtl/cluster_header_ctu.v" \
    "${DV_ROOT}/design/chip/tile/pico/rtl/picorv32.v" \
    "${DV_ROOT}/design/chip/tile/pico/rtl/pico_reset.v" \
    "${DV_ROOT}/design/chip/tile/sparc/rtl/sparc.v" \
    "${DV_ROOT}/design/chip/tile/sparc/rtl/sparc_core.v" \
    "${DV_ROOT}/design/chip/tile/sparc/rtl/cpx_spc_rpt.v" \
    "${DV_ROOT}/design/chip/tile/sparc/rtl/cpx_spc_buf.v" \
    "${DV_ROOT}/design/chip/tile/sparc/rtl/cfg_asi.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_wrap.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_shft.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_rml.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_ecl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_ecc.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_div.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_byp.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_alu.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_rml_inc3.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_rml_cwp.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_reg.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_ecl_wb.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_ecl_mdqctl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_ecl_eccctl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_ecl_divcntl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_eclccr.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_eclbyplog_rs1.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_eclbyplog.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_ecc_dec.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_div_yreg.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_div_32eql.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_byp_eccgen.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_alu_16eql.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_aluzcmp64.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_alulogic.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_aluaddsub.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_rndrob.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_ecl_cnt6.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_eclcomp7.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_aluspr.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_aluor32.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_aluadder64.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/bw_r_irf/rtl/bw_r_irf_wrap.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/bw_r_irf/rtl/bw_r_irf.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/bw_r_irf/bw_r_irf_register8/rtl/bw_r_irf_register8.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/bw_r_irf/bw_r_irf_register16/rtl/bw_r_irf_register16.v" \
    "${DV_ROOT}/design/chip/tile/sparc/exu/bw_r_irf/common/rtl/bw_r_irf_register.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ffu/rtl/sparc_ffu_nospu_wrap.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ffu/rtl/sparc_ffu.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ffu/rtl/sparc_ffu_vis.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ffu/rtl/sparc_ffu_dp.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ffu/rtl/sparc_ffu_ctl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ffu/rtl/sparc_ffu_part_add32.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ffu/rtl/sparc_ffu_ctl_visctl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_nospu_wrap.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_wseldp.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_swl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_sscan.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_invctl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_imd.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_ifqdp.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_ifqctl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_fdp.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_fcl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_errdp.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_errctl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_dec.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_dcl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_thrfsm.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_thrcmpl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_swpla.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_rndrob.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_par34.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_par32.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_par16.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_milfsm.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_lru4.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_lfsr5.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_incr46.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_ctr5.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_cmp35.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_stsm.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_shiftreg.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_rtsm.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_lfsr.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_htsm.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_counter.v" \
    "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_fsm.v" \
    "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_nospu_wrap.v" \
    "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu.v" \
    "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_tlbdp.v" \
    "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_tagdp.v" \
    "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_stb_rwdp.v" \
    "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_stb_rwctl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_stb_ctldp.v" \
    "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_stb_ctl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_qdp2.v" \
    "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_qdp1.v" \
    "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_qctl2.v" \
    "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_qctl1.v" \
    "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_excpctl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_dctldp.v" \
    "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_dctl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_dcdp.v" \
    "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_rrobin_picker2.v" \
    "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_pcx_qmon.v" \
    "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_dc_parity_gen.v" \
    "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_dcache_lfsr.v" \
    "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_asi_decode.v" \
    "${DV_ROOT}/design/chip/tile/sparc/mul/rtl/sparc_mul_top_nospu_wrap.v" \
    "${DV_ROOT}/design/chip/tile/sparc/mul/rtl/sparc_mul_top.v" \
    "${DV_ROOT}/design/chip/tile/sparc/mul/rtl/sparc_mul_dp.v" \
    "${DV_ROOT}/design/chip/tile/sparc/mul/rtl/sparc_mul_cntl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_nospu_wrap.v" \
    "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu.v" \
    "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_tdp.v" \
    "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_tcl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_pib.v" \
    "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_mmu_dp.v" \
    "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_mmu_ctl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_misctl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_incr64.v" \
    "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_hyperv.v" \
    "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/sparc_tlu_intdp.v" \
    "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/sparc_tlu_intctl.v" \
    "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_rrobin_picker.v" \
    "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_prencoder16.v" \
    "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_addern_32.v" \
    "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/sparc_tlu_zcmp64.v" \
    "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/sparc_tlu_penc64.v" \
    "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/sparc_tlu_dec64.v" \
    "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/bw_r_dtlb.v" \
    "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/bw_r_itlb.v" \
    "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/bw_r_ict.v" \
    "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/bw_r_icd.v" \
    "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/bw_r_dct.v" \
    "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/bw_r_dcd.v" \
    "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/bw_r_scm.v" \
    "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/bw_r_frf.v" \
    "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/bw_r_rf32x80.v" \
    "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/bw_r_rf32x152b.v" \
    "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/sram_l1d_val.v" \
    "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/sram_l1i_val.v" \
    "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/sram_wrappers/sram_1rw_128x78.v" \
    "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/sram_wrappers/sram_l1d_data.v" \
    "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/sram_wrappers/sram_l1d_tag.v" \
    "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/sram_wrappers/sram_l1i_data.v" \
    "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/sram_wrappers/sram_l1i_tag.v" \
    "${DV_ROOT}/design/chip/tile/ariane/tb/ariane_soc_pkg.sv"                                 \
    "${DV_ROOT}/design/chip/tile/ariane/src/axi/src/axi_pkg.sv"                               \
    "${DV_ROOT}/design/chip/tile/ariane/src/riscv-dbg/src/dm_pkg.sv"                          \
    "${DV_ROOT}/design/chip/tile/ariane/include/riscv_pkg.sv"                                 \
    "${DV_ROOT}/design/chip/tile/ariane/include/ariane_pkg.sv"                                \
    "${DV_ROOT}/design/chip/tile/ariane/include/ariane_axi_pkg.sv"                            \
    "${DV_ROOT}/design/chip/tile/ariane/include/wt_cache_pkg.sv"                              \
    "${DV_ROOT}/design/chip/tile/ariane/include/axi_intf.sv"                                  \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/fpnew_pkg.sv"                             \
    "${DV_ROOT}/design/chip/tile/ariane/src/util/sram.sv"                                     \
    "${DV_ROOT}/design/chip/tile/ariane/src/util/axi_master_connect.sv"                       \
    "${DV_ROOT}/design/chip/tile/ariane/src/util/axi_master_connect_rev.sv"                   \
    "${DV_ROOT}/design/chip/tile/ariane/src/util/axi_slave_connect.sv"                        \
    "${DV_ROOT}/design/chip/tile/ariane/src/util/axi_slave_connect_rev.sv"                    \
    "${DV_ROOT}/design/chip/tile/ariane/src/common_cells/src/deprecated/rrarbiter.sv"         \
    "${DV_ROOT}/design/chip/tile/ariane/src/common_cells/src/deprecated/fifo_v1.sv"           \
    "${DV_ROOT}/design/chip/tile/ariane/src/common_cells/src/deprecated/fifo_v2.sv"           \
    "${DV_ROOT}/design/chip/tile/ariane/src/common_cells/src/fifo_v3.sv"                      \
    "${DV_ROOT}/design/chip/tile/ariane/src/common_cells/src/shift_reg.sv"                    \
    "${DV_ROOT}/design/chip/tile/ariane/src/common_cells/src/lfsr_8bit.sv"                    \
    "${DV_ROOT}/design/chip/tile/ariane/src/common_cells/src/lzc.sv"                          \
    "${DV_ROOT}/design/chip/tile/ariane/src/common_cells/src/exp_backoff.sv"                  \
    "${DV_ROOT}/design/chip/tile/ariane/src/common_cells/src/rr_arb_tree.sv"                  \
    "${DV_ROOT}/design/chip/tile/ariane/src/common_cells/src/rstgen_bypass.sv"                \
    "${DV_ROOT}/design/chip/tile/ariane/src/common_cells/src/sync_wedge.sv"                   \
    "${DV_ROOT}/design/chip/tile/ariane/src/common_cells/src/pulp_sync.sv"                    \
    "${DV_ROOT}/design/chip/tile/ariane/src/common_cells/src/cdc_2phase.sv"                   \
    "${DV_ROOT}/design/chip/tile/ariane/src/common_cells/src/unread.sv"                       \
    "${DV_ROOT}/design/chip/tile/ariane/src/common_cells/src/popcount.sv"                     \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpga-support/rtl/SyncSpRamBeNx64.sv"              \
    "${DV_ROOT}/design/chip/tile/ariane/src/axi_mem_if/src/axi2mem.sv"                        \
    "${DV_ROOT}/design/chip/tile/ariane/src/tech_cells_generic/src/pulp_clock_gating.sv"      \
    "${DV_ROOT}/design/chip/tile/ariane/src/tech_cells_generic/src/cluster_clock_inverter.sv" \
    "${DV_ROOT}/design/chip/tile/ariane/src/tech_cells_generic/src/pulp_clock_mux2.sv"        \
    "${DV_ROOT}/design/chip/tile/ariane/src/axi_adapter.sv"                                   \
    "${DV_ROOT}/design/chip/tile/ariane/src/alu.sv"                                           \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu_wrap.sv"                                      \
    "${DV_ROOT}/design/chip/tile/ariane/src/ariane.sv"                                        \
    "${DV_ROOT}/design/chip/tile/ariane/src/branch_unit.sv"                                   \
    "${DV_ROOT}/design/chip/tile/ariane/src/compressed_decoder.sv"                            \
    "${DV_ROOT}/design/chip/tile/ariane/src/controller.sv"                                    \
    "${DV_ROOT}/design/chip/tile/ariane/src/csr_buffer.sv"                                    \
    "${DV_ROOT}/design/chip/tile/ariane/src/csr_regfile.sv"                                   \
    "${DV_ROOT}/design/chip/tile/ariane/src/decoder.sv"                                       \
    "${DV_ROOT}/design/chip/tile/ariane/src/ex_stage.sv"                                      \
    "${DV_ROOT}/design/chip/tile/ariane/src/frontend/btb.sv"                                  \
    "${DV_ROOT}/design/chip/tile/ariane/src/frontend/bht.sv"                                  \
    "${DV_ROOT}/design/chip/tile/ariane/src/frontend/ras.sv"                                  \
    "${DV_ROOT}/design/chip/tile/ariane/src/frontend/instr_scan.sv"                           \
    "${DV_ROOT}/design/chip/tile/ariane/src/frontend/instr_queue.sv"                          \
    "${DV_ROOT}/design/chip/tile/ariane/src/frontend/frontend.sv"                             \
    "${DV_ROOT}/design/chip/tile/ariane/src/id_stage.sv"                                      \
    "${DV_ROOT}/design/chip/tile/ariane/src/instr_realign.sv"                                 \
    "${DV_ROOT}/design/chip/tile/ariane/src/issue_read_operands.sv"                           \
    "${DV_ROOT}/design/chip/tile/ariane/src/issue_stage.sv"                                   \
    "${DV_ROOT}/design/chip/tile/ariane/src/load_unit.sv"                                     \
    "${DV_ROOT}/design/chip/tile/ariane/src/load_store_unit.sv"                               \
    "${DV_ROOT}/design/chip/tile/ariane/src/mmu.sv"                                           \
    "${DV_ROOT}/design/chip/tile/ariane/src/mult.sv"                                          \
    "${DV_ROOT}/design/chip/tile/ariane/src/multiplier.sv"                                    \
    "${DV_ROOT}/design/chip/tile/ariane/src/serdiv.sv"                                        \
    "${DV_ROOT}/design/chip/tile/ariane/src/perf_counters.sv"                                 \
    "${DV_ROOT}/design/chip/tile/ariane/src/ptw.sv"                                           \
    "${DV_ROOT}/design/chip/tile/ariane/src/ariane_regfile_ff.sv"                             \
    "${DV_ROOT}/design/chip/tile/ariane/src/re_name.sv"                                       \
    "${DV_ROOT}/design/chip/tile/ariane/src/scoreboard.sv"                                    \
    "${DV_ROOT}/design/chip/tile/ariane/src/store_buffer.sv"                                  \
    "${DV_ROOT}/design/chip/tile/ariane/src/amo_buffer.sv"                                    \
    "${DV_ROOT}/design/chip/tile/ariane/src/store_unit.sv"                                    \
    "${DV_ROOT}/design/chip/tile/ariane/src/tlb.sv"                                           \
    "${DV_ROOT}/design/chip/tile/ariane/src/commit_stage.sv"                                  \
    "${DV_ROOT}/design/chip/tile/ariane/src/cache_subsystem/wt_dcache_ctrl.sv"                \
    "${DV_ROOT}/design/chip/tile/ariane/src/cache_subsystem/wt_dcache_mem.sv"                 \
    "${DV_ROOT}/design/chip/tile/ariane/src/cache_subsystem/wt_dcache_missunit.sv"            \
    "${DV_ROOT}/design/chip/tile/ariane/src/cache_subsystem/wt_dcache_wbuffer.sv"             \
    "${DV_ROOT}/design/chip/tile/ariane/src/cache_subsystem/wt_dcache.sv"                     \
    "${DV_ROOT}/design/chip/tile/ariane/src/cache_subsystem/wt_icache.sv"                     \
    "${DV_ROOT}/design/chip/tile/ariane/src/cache_subsystem/wt_l15_adapter.sv"                \
    "${DV_ROOT}/design/chip/tile/ariane/src/cache_subsystem/wt_cache_subsystem.sv"            \
    "${DV_ROOT}/design/chip/tile/ariane/src/clint/clint.sv"                                   \
    "${DV_ROOT}/design/chip/tile/ariane/src/clint/axi_lite_interface.sv"                      \
    "${DV_ROOT}/design/chip/tile/ariane/src/riscv-dbg/debug_rom/debug_rom.sv"                 \
    "${DV_ROOT}/design/chip/tile/ariane/src/riscv-dbg/src/dm_csrs.sv"                         \
    "${DV_ROOT}/design/chip/tile/ariane/src/riscv-dbg/src/dm_mem.sv"                          \
    "${DV_ROOT}/design/chip/tile/ariane/src/riscv-dbg/src/dm_top.sv"                          \
    "${DV_ROOT}/design/chip/tile/ariane/src/riscv-dbg/src/dmi_cdc.sv"                         \
    "${DV_ROOT}/design/chip/tile/ariane/src/riscv-dbg/src/dmi_jtag.sv"                        \
    "${DV_ROOT}/design/chip/tile/ariane/src/riscv-dbg/src/dm_sba.sv"                          \
    "${DV_ROOT}/design/chip/tile/ariane/src/riscv-dbg/src/dmi_jtag_tap.sv"                    \
    "${DV_ROOT}/design/chip/tile/ariane/openpiton/riscv_peripherals.sv"                       \
    "${DV_ROOT}/design/chip/tile/ariane/openpiton/ariane_verilog_wrap.sv"                     \
    "${DV_ROOT}/design/chip/tile/ariane/openpiton/bootrom/baremetal/bootrom.sv"               \
    "${DV_ROOT}/design/chip/tile/ariane/openpiton/bootrom/linux/bootrom_linux.sv"             \
    "${DV_ROOT}/design/chip/tile/ariane/src/rv_plic/rtl/rv_plic_target.sv"                    \
    "${DV_ROOT}/design/chip/tile/ariane/src/rv_plic/rtl/rv_plic_gateway.sv"                   \
    "${DV_ROOT}/design/chip/tile/ariane/src/rv_plic/rtl/plic_regmap.sv"                       \
    "${DV_ROOT}/design/chip/tile/ariane/src/rv_plic/rtl/plic_top.sv"                          \
    "${DV_ROOT}/design/chip/tile/ariane/fpga/src/axi2apb/src/axi2apb_wrap.sv"                 \
    "${DV_ROOT}/design/chip/tile/ariane/fpga/src/axi2apb/src/axi2apb.sv"                      \
    "${DV_ROOT}/design/chip/tile/ariane/fpga/src/axi2apb/src/axi2apb_64_32.sv"                \
    "${DV_ROOT}/design/chip/tile/ariane/fpga/src/axi_slice/src/axi_w_buffer.sv"               \
    "${DV_ROOT}/design/chip/tile/ariane/fpga/src/axi_slice/src/axi_b_buffer.sv"               \
    "${DV_ROOT}/design/chip/tile/ariane/fpga/src/axi_slice/src/axi_slice_wrap.sv"             \
    "${DV_ROOT}/design/chip/tile/ariane/fpga/src/axi_slice/src/axi_slice.sv"                  \
    "${DV_ROOT}/design/chip/tile/ariane/fpga/src/axi_slice/src/axi_single_slice.sv"           \
    "${DV_ROOT}/design/chip/tile/ariane/fpga/src/axi_slice/src/axi_ar_buffer.sv"              \
    "${DV_ROOT}/design/chip/tile/ariane/fpga/src/axi_slice/src/axi_r_buffer.sv"               \
    "${DV_ROOT}/design/chip/tile/ariane/fpga/src/axi_slice/src/axi_aw_buffer.sv"              \
    "${DV_ROOT}/design/chip/tile/ariane/src/register_interface/src/apb_to_reg.sv"             \
    "${DV_ROOT}/design/chip/tile/ariane/src/register_interface/src/reg_intf.sv"               \
    "${DV_ROOT}/design/chip/tile/ariane/src/register_interface/src/reg_intf_pkg.sv"           \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/fpu_div_sqrt_mvp/hdl/fpu_ff.sv"                 \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/fpu_div_sqrt_mvp/hdl/defs_div_sqrt_mvp.sv"      \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/fpu_div_sqrt_mvp/hdl/control_mvp.sv"            \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/fpu_div_sqrt_mvp/hdl/div_sqrt_mvp_wrapper.sv"   \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/fpu_div_sqrt_mvp/hdl/div_sqrt_top_mvp.sv"       \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/fpu_div_sqrt_mvp/hdl/iteration_div_sqrt_mvp.sv" \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/fpu_div_sqrt_mvp/hdl/norm_div_sqrt_mvp.sv"      \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/fpu_div_sqrt_mvp/hdl/nrbd_nrsc_mvp.sv"          \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/fpu_div_sqrt_mvp/hdl/preprocess_mvp.sv"         \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/fpnew_cast_multi.sv"                            \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/fpnew_classifier.sv"                            \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/fpnew_divsqrt_multi.sv"                         \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/fpnew_fma_multi.sv"                             \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/fpnew_fma.sv"                                   \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/fpnew_noncomp.sv"                               \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/fpnew_opgroup_block.sv"                         \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/fpnew_opgroup_fmt_slice.sv"                     \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/fpnew_opgroup_multifmt_slice.sv"                \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/fpnew_rounding.sv"                              \
    "${DV_ROOT}/design/chip/tile/ariane/src/fpu/src/fpnew_top.sv"                                   \
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
    "${DV_ROOT}/design/chip/tile/ariane/src/common_cells/include/common_cells/registers.svh"
]

set CHIPSET_IP_FILE_PREFIXES [list \
    "${DV_ROOT}/design/chipset/xilinx/${BOARD}/ip_cores/clk_dcm/clk_dcm" \
    "${DV_ROOT}/design/chipset/xilinx/${BOARD}/ip_cores/clk_mmcm/clk_mmcm" \
    "${DV_ROOT}/design/chipset/xilinx/${BOARD}/ip_cores/afifo_w64_d128_std/afifo_w64_d128_std" \
    "${DV_ROOT}/design/chipset/xilinx/${BOARD}/ip_cores/mac_eth_axi_lite/mac_eth_axi_lite" \
    "${DV_ROOT}/design/chipset/xilinx/${BOARD}/ip_cores/axi_crossbar_2_in_1/axi_crossbar_2_in_1" \
    "${DV_ROOT}/design/chipset/io_ctrl/xilinx/${BOARD}/ip_cores/atg_uart_init/atg_uart_init" \
    "${DV_ROOT}/design/chipset/io_ctrl/xilinx/${BOARD}/ip_cores/uart_16550/uart_16550" \
    "${DV_ROOT}/design/chipset/io_ctrl/xilinx/${BOARD}/ip_cores/mem_uart_timeout/mem_uart_timeout" \
    "${DV_ROOT}/design/chipset/io_ctrl/xilinx/${BOARD}/ip_cores/bram_256x512/bram_256x512" \
    "${DV_ROOT}/design/chipset/io_ctrl/xilinx/${BOARD}/ip_cores/bram_16384x512/bram_16384x512" \
    "${DV_ROOT}/design/chipset/io_ctrl/xilinx/${BOARD}/ip_cores/bram_8192x512/bram_8192x512" \
    "${DV_ROOT}/design/chipset/mc/xilinx/${BOARD}/ip_cores/mig_7series_0/mig_7series_0" \
    "${DV_ROOT}/design/chipset/mc/xilinx/${BOARD}/ip_cores/ddr4_0/ddr4_0" \
    "${DV_ROOT}/design/chipset/mc/xilinx/${BOARD}/ip_cores/ddr4_axi4/ddr4_axi4" \
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
