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
set DESIGN_NAME                   "sparc_ffu_nospu_wrap"

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
set MAX_ROUTING_LAYER            "M6"

# Override block-level pin layers
set MODULE_PIN_LAYERS            "M5 M6"

#  Additional search path to be added to the default search path
#  Include directories, etc.
set ADDITIONAL_SEARCH_PATH        "${DV_ROOT}/design/include"

#  Extra target libraries not included in TARGET_LIBRARY_FILES
#  Memory libs, IP, etc.
set ADDITIONAL_TARGET_LIBRARY_FILES     "FFU_SRAM_TARGET_LIBRARY_HERE (.db)"

#  List of max min library pairs "max1 min1 max2 min2 max3 min3"... Should
#  correspond to ADDITIONAL_TARGET_LIBRARY_FILES
set ADDITIONAL_MIN_LIBRARY_FILES        "FFU_SRAM_MAX_SETUP_LIBRARY_HERE (.db) FFU_SRAM_MIN_HOLD_LIBRARY_HERE (.db)"

#  Additional Milkyway reference libraries
set ADDITIONAL_MW_REFERENCE_LIB_DIRS    "FFU_SRAM_MW_REFERENCE_LIBRARY_HERE (MW directory)"

set ADDITIONAL_LINK_LIB_FILES     ""

#  Additional macros needed by RTL
set ADDITIONAL_MACROS             ""

# List of GDSII files to merge design GDSII with when merge_gds is run
set GDSII_MERGE_FILES             "FFU_SRAM_GDS_HERE (.gds)"

# List of SPICE files to merge design SPICE with for LVS
set ADDITIONAL_SPICE_MERGE_FILES  "FFU_SRAM_LVS_SPICE_HERE (.cdl/.sp)"

# Enter the list of source RTL files if reading from RTL
set RTL_SOURCE_FILES           "${DV_ROOT}/design/chip/tile/sparc/ffu/rtl/sparc_ffu_nospu_wrap.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ffu/rtl/sparc_ffu.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ffu/rtl/sparc_ffu_ctl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ffu/rtl/sparc_ffu_ctl_visctl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ffu/rtl/sparc_ffu_dp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ffu/rtl/sparc_ffu_part_add32.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ffu/rtl/sparc_ffu_vis.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/bw_r_frf.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/sram_wrappers/FFU_SRAM_WRAPPER_HERE.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/u1.beh.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/m1.beh.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/swrvr_clib.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/swrvr_dlib.v "

#########################################
# End of Design Specification Variables #
#########################################
