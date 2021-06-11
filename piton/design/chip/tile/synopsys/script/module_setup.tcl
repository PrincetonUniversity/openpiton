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

# Variables specific to this module

# For the following variables, use a blank space to separate multiple entries.
# Example: set TARGET_LIBRARY_FILES "lib1.db lib2.db lib3.db"

#  The name of the top-level design
set DESIGN_NAME                   "tile"

###############################
# Hierarchical Flow Variables #
###############################

#  Indicate whether design is top-level chip design or not (hierarchical flow dc.tcl vs dc_top.tcl)
set HIERARCHICAL                      TRUE

# List of hierarchical block design names "DesignA DesignB" ...
set HIERARCHICAL_DESIGNS           "sparc_core"
# List of hierarchical block design directory names, needs to be in same order as above
set HIERARCHICAL_DESIGNS_DIRS      "sparc"
# List of hierarchical block cell instance names "u_DesignA u_DesignB" ...
set HIERARCHICAL_CELLS             "core"

# Each of the hierarchical designs specified in ${HIERARCHICAL_DESIGNS}
# should be added to only one of the lists below:

# List of Design Compiler hierarchical design names (.ddc will be read)
set DDC_HIER_DESIGNS                    ""
# List of Design Compiler ILM hierarchical design names (.ddc will be read)
set DC_ILM_HIER_DESIGNS                 ""
# List of Design Compiler block abstraction hierarchical designs (.ddc will be read)
# without transparent interface optimization
set DC_BLOCK_ABSTRACTION_DESIGNS        ""
# List of Design Compiler block abstraction hierarchical designs
# with transparent interface optimization
set DC_BLOCK_ABSTRACTION_DESIGNS_TIO    ""
# List of IC Compiler ILM hierarchical design names (Milkyway will be read)
set ICC_ILM_HIER_DESIGNS                ""
# List of IC Compiler block abstraction hierarchical design names (Milkyway will be read)
set ICC_BLOCK_ABSTRACTION_DESIGNS       $HIERARCHICAL_DESIGNS
# List of IC Compiler block abstraction hierarchical design directory names, needs to be in
# same order as above variable
set ICC_BLOCK_ABSTRACTION_DIRS          $HIERARCHICAL_DESIGNS_DIRS

######################################
# End of Hierarchical Flow Variables #
######################################

##################################
# Design Specification Variables #
##################################

# Override max routing layer
set MAX_ROUTING_LAYER            "M9"

# Override block-level pin layers
set MODULE_PIN_LAYERS            "M8 M9"

#  Additional search path to be added to the default search path
#  Include directories, etc.
set ADDITIONAL_SEARCH_PATH        "${DV_ROOT}/design/include"

#  Extra target libraries not included in TARGET_LIBRARY_FILES
#  Memory libs, IP, etc.
set ADDITIONAL_TARGET_LIBRARY_FILES     "FFU_SRAM_TARGET_LIBRARY_HERE (.db) L1I_DATA_SRAM_TARGET_LIBRARY_HERE (.db) L1ID_L15_TAG_SRAM_TARGET_LIBRARY_HERE (.db) L1D_DATA_SRAM_TARGET_LIBRARY_HERE (.db) L15_DATA_SRAM_TARGET_LIBRARY_HERE (.db) L15_HMT_SRAM_TARGET_LIBRARY_HERE (.db) L2_TAG_SRAM_TARGET_LIBRARY_HERE (.db) L2_DATA_SRAM_TARGET_LIBRARY_HERE (.db) L2_STATE_SRAM_TARGET_LIBRARY_HERE (.db) L2_DIR_SRAM_TARGET_LIBRARY_HERE (.db)"

#  List of max min library pairs "max1 min1 max2 min2 max3 min3"... Should
#  correspond to ADDITIONAL_TARGET_LIBRARY_FILES
set ADDITIONAL_MIN_LIBRARY_FILES        "FFU_SRAM_MAX_SETUP_LIBRARY_HERE (.db) FFU_SRAM_MIN_HOLD_LIBRARY_HERE L1I_DATA_MAX_SETUP_LIBRARY_HERE (.db) L1I_DATA_MIN_HOLD_LIBRARY_HERE (.db) L1ID_L15_TAG_SRAM_MAX_SETUP_LIBRARY_HERE (.db) L1ID_L15_TAG_SRAM_MIN_HOLD_LIBRARY_HERE (.db) L1D_DATA_SRAM_MAX_SETUP_LIBRARY_HERE (.db) L1D_DATA_SRAM_MIN_HOLD_LIBRARY_HERE (.db) L15_DATA_SRAM_MAX_SETUP_LIBRARY_HERE (.db) L15_DATA_SRAM_MIN_HOLD_LIBRARY_HERE (.db) L15_HMT_SRAM_MAX_SETUP_LIBRARY_HERE (.db) L15_HMT_SRAM_MIN_HOLD_LIBRARY_HERE (.db) L2_TAG_SRAM_MAX_SETUP_LIBRARY_HERE (.db) L2_TAG_SRAM_MIN_HOLD_LIBRARY_HERE (.db) L2_DATA_SRAM_MAX_SETUP_LIBRARY_HERE (.db) L2_DATA_SRAM_MIN_HOLD_LIBRARY_HERE (.db) L2_STATE_SRAM_MAX_SETUP_LIBRARY_HERE (.db) L2_STATE_SRAM_MIN_HOLD_LIBRARY_HERE (.db) L2_DIR_SRAM_MAX_SETUP_LIBRARY_HERE (.db) L2_DIR_SRAM_MIN_HOLD_LIBRARY_HERE (.db)"

set ADDITIONAL_MW_REFERENCE_LIB_DIRS    "SRAM_MW_REFERENCE_LIBRARY_HERE (MW directory, could be multiple)"
set ADDITIONAL_LINK_LIB_FILES     ""

# Additional macro definitions needed by RTL
set ADDITIONAL_MACROS             ""

# List of GDSII files to merge design GDSII with when merge_gds is run
set GDSII_MERGE_FILES             "FFU_SRAM_GDS_HERE (.gds) L1I_DATA_SRAM_GDS_HERE (.gds) L1ID_L15_TAG_SRAM_GDS_HERE (.gds) L1D_DATA_SRAM_GDS_HERE (.gds) L15_DATA_SRAM_GDS_HERE (.gds) L15_HMT_SRAM_GDS_HERE (.gds) L2_TAG_SRAM_GDS_HERE (.gds) L2_DATA_SRAM_GDS_HERE (.gds) L2_STATE_SRAM_GDS_HERE (.gds) L2_DIR_SRAM_GDS_HERE (.gds)"

# List of SPICE files to merge design SPICE with for LVS
set ADDITIONAL_SPICE_MERGE_FILES  "FFU_SRAM_LVS_SPICE_HERE (.cdl/.sp) L1I_DATA_SRAM_LVS_SPICE_HERE (.cdl/.sp) L1ID_L15_TAG_SRAM_LVS_SPICE_HERE (.cdl/.sp) L1D_DATA_SRAM_LVS_SPICE_HERE (.cdl/.sp) L15_DATA_SRAM_LVS_SPICE_HERE (.cdl/.sp) L15_HMT_SRAM_LVS_SPICE_HERE (.cdl/.sp) L2_TAG_SRAM_LVS_SPICE_HERE (.cdl/.sp) L2_DATA_SRAM_LVS_SPICE_HERE (.cdl/.sp) L2_STATE_SRAM_LVS_SPICE_HERE (.cdl/.sp) L2_DIR_SRAM_LVS_SPICE_HERE (.cdl/.sp)"

# Enter the list of source RTL files if reading from RTL

# Tile top level
set RTL_SOURCE_FILES           "${DV_ROOT}/design/chip/tile/rtl/tile.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/rtl/config_regs.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/rtl/cpx_arbitrator.v "

# DMBR
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/dmbr/rtl/dmbr.v "

# RTAP
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/rtap/rtl/rtap.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/rtap/rtl/rtap_ucb_receiver.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/rtap/rtl/rtap_ucb_transmitter.v "


# Routers
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/dynamic_node/rtl/dynamic_node_top_wrap.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/dynamic_node/rtl/dynamic_node_top.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_top_16.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_top_4.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_route_request_calc.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_control.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_output_top.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_output_datapath.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_output_control.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/bus_compare_equal.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/flip_bus.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/net_dff.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/one_of_eight.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/one_of_five.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/dynamic_node/common/rtl/network_input_blk_multi_out.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/dynamic_node/common/rtl/space_avail_top.v "

# FPU
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_add.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_add_ctl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_add_exp_dp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_add_frac_dp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_arb.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_arb_wrap.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_buf.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_cnt_lead0_53b.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_cnt_lead0_64b.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_cnt_lead0_lvl1.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_cnt_lead0_lvl2.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_cnt_lead0_lvl3.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_cnt_lead0_lvl4.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_denorm_3b.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_denorm_3to1.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_denorm_frac.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_div.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_div_ctl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_div_exp_dp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_div_frac_dp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_in.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_in_ctl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_in_dp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_in2_gt_in1_2b.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_in2_gt_in1_3b.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_in2_gt_in1_3to1.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_in2_gt_in1_frac.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_mul.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_mul_ctl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_mul_exp_dp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_mul_frac_dp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_out.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_out_ctl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_out_dp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_rptr_macros.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_rptr_groups.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/fpu/rtl/fpu_rptr_min_global.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/srams/rtl/bw_r_rf16x160.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/mul64.v "

# L1.5
append RTL_SOURCE_FILES        "${DV_ROOT}/design/include/l15.h " ;# Just for PyHP pre-processing
append RTL_SOURCE_FILES        "${DV_ROOT}/design/include/lsu.h " ;# Just for PyHP pre-processing
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/l15_wrap.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/l15.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/l15_mshr.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/l15_pipeline.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/rf_l15_mesi.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/rf_l15_wmt.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/rf_l15_lruarray.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/l15_cpxencoder.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/pcx_buffer.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/pcx_decoder.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/noc1encoder.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/noc1buffer.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/noc3encoder.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/noc3buffer.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/noc2decoder.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/simplenocbuffer.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/l15_hmc.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/l15_home_encoder.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/l15_csm.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/l15_priority_encoder.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/sram_wrappers/L15_TAG_SRAM_WRAPPER_HERE.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/sram_wrappers/L15_DATA_SRAM_WRAPPER_HERE.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l15/rtl/sram_wrappers/L15_HMT_SRAM_WRAPPER_HERE.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/flat_id_to_xy.v "

# L2
append RTL_SOURCE_FILES        "${DV_ROOT}/design/include/l2.h " ;# Just for PyHP pre-processing
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_data.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_data_wrap.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_data_pgen.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_data_ecc.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_decoder.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_dir.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_dir_wrap.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_encoder.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_mshr.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_mshr_decoder.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_mshr_wrap.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_pipe1.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_pipe1_buf_in.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_pipe1_buf_out.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_pipe1_ctrl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_pipe1_dpath.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_pipe2.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_pipe2_buf_in.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_pipe2_ctrl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_pipe2_dpath.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_state.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_state_wrap.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_tag.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_tag_wrap.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_smc.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_smc_wrap.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_config_regs.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_priority_encoder.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_broadcast_counter.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/l2_broadcast_counter_wrap.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/sram_wrappers/L2_STATE_SRAM_WRAPPER_HERE.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/sram_wrappers/L2_TAG_SRAM_WRAPPER_HERE.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/sram_wrappers/L2_DIR_SRAM_WRAPPER_HERE.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/l2/rtl/sram_wrappers/L2_DATA_SRAM_WRAPPER_HERE.v "


# MISCs
append RTL_SOURCE_FILES        "${DV_ROOT}/design/common/rtl/synchronizer.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/valrdy_to_credit.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/credit_to_valrdy.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/ucb_bus_in.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/ucb_bus_out.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/swrvr_clib.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/clk_gating_latch.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/swrvr_dlib.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/u1.beh.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/m1.beh.v "

#########################################
# End of Design Specification Variables #
#########################################

