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
set DESIGN_NAME                   "dynamic_node_top_wrap"

###############################
# Hierarchical Flow Variables #
###############################

#  Indicate whether design is top-level chip design or not (hierarchical flow dc.tcl vs dc_top.tcl)
set HIERARCHICAL                      FALSE

# List of hierarchical block design names "DesignA DesignB" ...
set HIERARCHICAL_DESIGNS           "${DESIGN_NAME}"
# List of hierarchical block design directory names, needs to be in same order as above
set HIERARCHICAL_DESIGNS_DIRS      ""
# List of hierarchical block cell instance names "u_DesignA u_DesignB" ...
set HIERARCHICAL_CELLS             ""

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
set DC_BLOCK_ABSTRACTION_DESIGNS_TIO    "${DESIGN_NAME}"
# List of IC Compiler ILM hierarchical design names (Milkyway will be read)
set ICC_ILM_HIER_DESIGNS                ""
# List of IC Compiler block abstraction hierarchical design names (Milkyway will be read)
set ICC_BLOCK_ABSTRACTION_DESIGNS       ""
# List of IC Compiler block abstraction hierarchical design directory names, needs to be in 
# same order as above variable
set ICC_BLOCK_ABSTRACTION_DIRS          ""

######################################
# End of Hierarchical Flow Variables #
######################################

##################################
# Design Specification Variables #
##################################

# Override max routing layer
set MAX_ROUTING_LAYER            "M5"

# Override pin layers
set MODULE_PIN_LAYERS            "M4 M5"

#  Additional search path to be added to the default search path
#  Include directories, etc.
set ADDITIONAL_SEARCH_PATH        "${DV_ROOT}/design/include"

#  Extra target libraries not included in TARGET_LIBRARY_FILES
#  Memory libs, IP, etc.
set ADDITIONAL_TARGET_LIBRARY_FILES     ""

#  List of max min library pairs "max1 min1 max2 min2 max3 min3"... Should
#  correspond to ADDITIONAL_TARGET_LIBRARY_FILES
set ADDITIONAL_MIN_LIBRARY_FILES        ""

set ADDITIONAL_MW_REFERENCE_LIB_DIRS    ""

set ADDITIONAL_LINK_LIB_FILES     ""

# Additional macro definitions needed by RTL
set ADDITIONAL_MACROS             ""

# List of GDSII files to merge design GDSII with when merge_gds is run
set GDSII_MERGE_FILES             ""

# List of SPICE files to merge design SPICE with for LVS
set ADDITIONAL_SPICE_MERGE_FILES  ""

# Enter the list of source RTL files if reading from RTL
set RTL_SOURCE_FILES           "${DV_ROOT}/design/chip/tile/dynamic_node/rtl/dynamic_node_top_wrap.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/include/define.h " ;# Just for PyHP pre-processing
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


append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/valrdy_to_credit.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/credit_to_valrdy.v "

#########################################
# End of Design Specification Variables #
#########################################
