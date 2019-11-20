# Copyright (c) 2017 Princeton University
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
set DESIGN_NAME                   "chip"

###############################
# Hierarchical Flow Variables #
###############################

#  Indicate whether design is top-level chip design or not (hierarchical flow dc.tcl vs dc_top.tcl)
set HIERARCHICAL                      TRUE

# Indicate whether this is chip level, i.e. whether there are pads so we want to place pins at floorplan
set ICC_CREATE_MODEL                  FALSE

# List of hierarchical block design names "DesignA DesignB" ...
set HIERARCHICAL_DESIGNS           "tile sparc_core"
# List of hierarchical block design directory names, needs to be in same order as above
set HIERARCHICAL_DESIGNS_DIRS      "tile tile/sparc"
# List of hierarchical block cell instance names "u_DesignA u_DesignB" ...
set HIERARCHICAL_CELLS             ""

# Each of the hierarchical designs specified in ${HIERARCHICAL_DESIGNS}
# should be added to only one of the lists below:

# List of Design Compiler hierarchical design names (.ddc will be read)
set DDC_HIER_DESIGNS                    ""
# List of Design Compiler hierarchical design directories
set DDC_HIER_DESIGNS_DIRS               ""
# List of Design Compiler ILM hierarchical design names (.ddc will be read)
set DC_ILM_HIER_DESIGNS                 ""
# List of Design Compiler block abstraction hierarchical designs (.ddc will be read)
# without transparent interface optimization
set DC_BLOCK_ABSTRACTION_DESIGNS        ""
# List of Design Compiler block abstraction hierarchical designs
# with transparent interface optimization
set DC_BLOCK_ABSTRACTION_DESIGNS_TIO    ""
# List of Design Compiler block abstraction hierarchical design directory names, needs to
# be in same order as above variable
set DC_BLOCK_ABSTRACTION_DESIGNS_TIO_DIRS ""
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
set MAX_ROUTING_LAYER            "MB"

#  Additional search path to be added to the default search path
#  Include directories, etc.
set ADDITIONAL_SEARCH_PATH        "${DV_ROOT}/design/include"

#  Extra target libraries not included in TARGET_LIBRARY_FILES
#  Memory libs, IP, etc.
set ADDITIONAL_TARGET_LIBRARY_FILES     "FFU_SRAM_TARGET_LIBRARY_HERE (.db) L1I_DATA_SRAM_TARGET_LIBRARY_HERE (.db) L1ID_L15_TAG_SRAM_TARGET_LIBRARY_HERE (.db) L1D_DATA_SRAM_TARGET_LIBRARY_HERE (.db) L15_DATA_SRAM_TARGET_LIBRARY_HERE (.db) L15_HMT_SRAM_TARGET_LIBRARY_HERE (.db) L2_TAG_SRAM_TARGET_LIBRARY_HERE (.db) L2_DATA_SRAM_TARGET_LIBRARY_HERE (.db) L2_STATE_SRAM_TARGET_LIBRARY_HERE (.db) L2_DIR_SRAM_TARGET_LIBRARY_HERE (.db) PLL_TARGET_LIBRARY_HERE (.db) IO_TARGET_LIBRARY_HERE (.db) PAD_TARGET_LIBRARY_HERE (.db)"

#  List of max min library pairs "max1 min1 max2 min2 max3 min3"... Should
#  correspond to ADDITIONAL_TARGET_LIBRARY_FILES
set ADDITIONAL_MIN_LIBRARY_FILES        "FFU_SRAM_MAX_SETUP_LIBRARY_HERE (.db) FFU_SRAM_MIN_HOLD_LIBRARY_HERE L1I_DATA_MAX_SETUP_LIBRARY_HERE (.db) L1I_DATA_MIN_HOLD_LIBRARY_HERE (.db) L1ID_L15_TAG_SRAM_MAX_SETUP_LIBRARY_HERE (.db) L1ID_L15_TAG_SRAM_MIN_HOLD_LIBRARY_HERE (.db) L1D_DATA_SRAM_MAX_SETUP_LIBRARY_HERE (.db) L1D_DATA_SRAM_MIN_HOLD_LIBRARY_HERE (.db) L15_DATA_SRAM_MAX_SETUP_LIBRARY_HERE (.db) L15_DATA_SRAM_MIN_HOLD_LIBRARY_HERE (.db) L15_HMT_SRAM_MAX_SETUP_LIBRARY_HERE (.db) L15_HMT_SRAM_MIN_HOLD_LIBRARY_HERE (.db) L2_TAG_SRAM_MAX_SETUP_LIBRARY_HERE (.db) L2_TAG_SRAM_MIN_HOLD_LIBRARY_HERE (.db) L2_DATA_SRAM_MAX_SETUP_LIBRARY_HERE (.db) L2_DATA_SRAM_MIN_HOLD_LIBRARY_HERE (.db) L2_STATE_SRAM_MAX_SETUP_LIBRARY_HERE (.db) L2_STATE_SRAM_MIN_HOLD_LIBRARY_HERE (.db) L2_DIR_SRAM_MAX_SETUP_LIBRARY_HERE (.db) L2_DIR_SRAM_MIN_HOLD_LIBRARY_HERE (.db) PLL_MAX_SETUP_LIBRARY_HERE (.db) PLL_MIN_HOLD_LIBRARY_HERE (.db) IO_MAX_SETUP_LIBRARY_HERE (.db) IO_MIN_HOLD_LIBRARY_HERE (.db) PAD_MAX_SETUP_LIBRARY_HERE (.db) PAD_MIN_HOLD_LIBRARY_HERE (.db)"

set ADDITIONAL_MW_REFERENCE_LIB_DIRS    "SRAM_MW_REFERENCE_LIBRARY_HERE (MW directory, could be multiple) PLL_MW_REFERENCE_LIBRARY_HERE (MW directory) IO_MW_REFERENCE_LIBRARY_HERE (MW directory, could be multiple) PAD_MW_REFERENCE_LIBRARY_HERE (MW directory)"

set ADDITIONAL_LINK_LIB_FILES     ""

# Additional macro definitions needed by RTL
set ADDITIONAL_MACROS             ""

# List of GDSII files to merge design GDSII with when merge_gds is run
set GDSII_MERGE_FILES             "FFU_SRAM_GDS_HERE (.gds) L1I_DATA_SRAM_GDS_HERE (.gds) L1ID_L15_TAG_SRAM_GDS_HERE (.gds) L1D_DATA_SRAM_GDS_HERE (.gds) L15_DATA_SRAM_GDS_HERE (.gds) L15_HMT_SRAM_GDS_HERE (.gds) L2_TAG_SRAM_GDS_HERE (.gds) L2_DATA_SRAM_GDS_HERE (.gds) L2_STATE_SRAM_GDS_HERE (.gds) L2_DIR_SRAM_GDS_HERE (.gds) PLL_GDS_HERE (.gds) IO_GDS_HERE (.gds) PAD_GDS_HERE (.gds)"

# List of SPICE files to merge design SPICE with for LVS
set ADDITIONAL_SPICE_MERGE_FILES  "FFU_SRAM_LVS_SPICE_HERE (.cdl/.sp) L1I_DATA_SRAM_LVS_SPICE_HERE (.cdl/.sp) L1ID_L15_TAG_SRAM_LVS_SPICE_HERE (.cdl/.sp) L1D_DATA_SRAM_LVS_SPICE_HERE (.cdl/.sp) L15_DATA_SRAM_LVS_SPICE_HERE (.cdl/.sp) L15_HMT_SRAM_LVS_SPICE_HERE (.cdl/.sp) L2_TAG_SRAM_LVS_SPICE_HERE (.cdl/.sp) L2_DATA_SRAM_LVS_SPICE_HERE (.cdl/.sp) L2_STATE_SRAM_LVS_SPICE_HERE (.cdl/.sp) L2_DIR_SRAM_LVS_SPICE_HERE (.cdl/.sp) PLL_LVS_SPICE_HERE (.cdl/.sp) IO_LVS_SPICE_HERE (.cdl/.sp) PAD_LVS_SPICE_HERE (.cdl/.sp)"

# Enter the list of source RTL files if reading from RTL

# Chip top-level
set RTL_SOURCE_FILES           "${DV_ROOT}/design/chip/rtl/chip.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/common/rtl/synchronizer.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/rtl/OCI.v "

# PLL
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/pll/rtl/pll_top.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/pll/rtl/clk_mux.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/pll/rtl/clk_se_to_diff.v "

# JTAG
append RTL_SOURCE_FILES           "${DV_ROOT}/design/chip/jtag/rtl/jtag.v "
append RTL_SOURCE_FILES           "${DV_ROOT}/design/chip/jtag/rtl/jtag_ctap.v "
append RTL_SOURCE_FILES           "${DV_ROOT}/design/chip/jtag/rtl/jtag_interface_tap.v "
append RTL_SOURCE_FILES           "${DV_ROOT}/design/chip/jtag/rtl/jtag_interface.v "
append RTL_SOURCE_FILES           "${DV_ROOT}/design/chip/jtag/rtl/jtag_ucb_receiver.v "
append RTL_SOURCE_FILES           "${DV_ROOT}/design/chip/jtag/rtl/jtag_ucb_transmitter.v "

# Chip Bridge
append RTL_SOURCE_FILES           "${DV_ROOT}/design/chip/chip_bridge/rtl/chip_bridge.v "
append RTL_SOURCE_FILES           "${DV_ROOT}/design/chip/chip_bridge/rtl/sync_fifo.v "
append RTL_SOURCE_FILES           "${DV_ROOT}/design/chip/chip_bridge/rtl/chip_bridge_rcv_32.v "
append RTL_SOURCE_FILES           "${DV_ROOT}/design/chip/chip_bridge/rtl/chip_bridge_send_32.v "
append RTL_SOURCE_FILES           "${DV_ROOT}/design/chip/chip_bridge/rtl/chip_net_chooser_32.v "

# Common stuff
append RTL_SOURCE_FILES        "${DV_ROOT}/design/common/rtl/async_fifo.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/valrdy_to_credit.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/credit_to_valrdy.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/ucb_bus_in.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/ucb_bus_out.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/swrvr_clib.v "

append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/dynamic_node/common/rtl/network_input_blk_multi_out.v "

#########################################
# End of Design Specification Variables #
#########################################
