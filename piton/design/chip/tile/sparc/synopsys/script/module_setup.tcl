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
set DESIGN_NAME                   "sparc_core"

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
set MAX_ROUTING_LAYER            "M8"

# Override block-level pin layers
set MODULE_PIN_LAYERS            "M8"

#  Additional search path to be added to the default search path
#  Include directories, etc.
set ADDITIONAL_SEARCH_PATH        "${DV_ROOT}/design/include"

#  Extra target libraries not included in TARGET_LIBRARY_FILES
#  Memory libs, IP, etc.
set ADDITIONAL_TARGET_LIBRARY_FILES     "FFU_SRAM_TARGET_LIBRARY_HERE (.db) L1I_DATA_SRAM_TARGET_LIBRARY_HERE (.db) L1ID_TAG_SRAM_TARGET_LIBRARY_HERE (.db) L1D_DATA_SRAM_TARGET_LIBRARY_HERE (.db)"

#  List of max min library pairs "max1 min1 max2 min2 max3 min3"... Should
#  correspond to ADDITIONAL_TARGET_LIBRARY_FILES
set ADDITIONAL_MIN_LIBRARY_FILES        "FFU_SRAM_MAX_SETUP_LIBRARY_HERE (.db) FFU_SRAM_MIN_HOLD_LIBRARY_HERE L1I_DATA_MAX_SETUP_LIBRARY_HERE (.db) L1I_DATA_MIN_HOLD_LIBRARY_HERE (.db) L1ID_TAG_SRAM_MAX_SETUP_LIBRARY_HERE (.db) L1ID_TAG_SRAM_MIN_HOLD_LIBRARY_HERE (.db) L1D_DATA_SRAM_MAX_SETUP_LIBRARY_HERE (.db) L1D_DATA_SRAM_MIN_HOLD_LIBRARY_HERE (.db)"

set ADDITIONAL_MW_REFERENCE_LIB_DIRS    "SRAM_MW_REFERENCE_LIBRARY_HERE (MW directory, could be multiple)"

set ADDITIONAL_LINK_LIB_FILES     ""

# Additional macro definitions needed by RTL
set ADDITIONAL_MACROS             ""

# List of GDSII files to merge design GDSII with when merge_gds is run
set GDSII_MERGE_FILES             "FFU_SRAM_GDS_HERE (.gds) L1I_DATA_SRAM_GDS_HERE (.gds) L1ID_TAG_SRAM_GDS_HERE (.gds) L1D_DATA_SRAM_GDS_HERE (.gds)"

# List of SPICE files to merge design SPICE with for LVS
set ADDITIONAL_SPICE_MERGE_FILES  "FFU_SRAM_LVS_SPICE_HERE (.cdl/.sp) L1I_DATA_SRAM_LVS_SPICE_HERE (.cdl/.sp) L1ID_TAG_SRAM_LVS_SPICE_HERE (.cdl/.sp) L1D_DATA_SRAM_LVS_SPICE_HERE (.cdl/.sp)"

# Enter the list of source RTL files if reading from RTL

# Top level stuff
set RTL_SOURCE_FILES           "${DV_ROOT}/design/chip/tile/sparc/rtl/sparc_core.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/include/define.h " ;# Just for PyHP pre-processing
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/rtl/sparc.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/rtl/bw_clk_cl_sparc_cmp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/rtl/cpx_spc_rpt.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/rtl/cpx_spc_buf.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/rtl/cfg_asi.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/cluster_header.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/test_stub_bist.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/test_stub_scan.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/synchronizer_asr.v "

# EXU
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_wrap.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_alu.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_aluadder64.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_aluaddsub.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_alulogic.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_aluor32.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_aluspr.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_aluzcmp64.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_alu_16eql.v "         
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_byp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_byp_eccgen.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_div.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_div_yreg.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_div_32eql.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_ecc.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_ecc_dec.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_ecl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_eclbyplog.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_eclbyplog_rs1.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_eclccr.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_eclcomp7.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_ecl_cnt6.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_ecl_divcntl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_ecl_eccctl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_ecl_mdqctl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_ecl_wb.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_reg.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_rml.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_rml_cwp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_rml_inc3.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_rndrob.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/rtl/sparc_exu_shft.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/bw_r_irf/rtl/bw_r_irf_wrap.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/bw_r_irf/rtl/bw_r_irf.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/bw_r_irf/bw_r_irf_register8/rtl/bw_r_irf_register8.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/bw_r_irf/bw_r_irf_register16/rtl/bw_r_irf_register16.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/exu/bw_r_irf/common/rtl/bw_r_irf_register.v "

# FFU
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ffu/rtl/sparc_ffu_nospu_wrap.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ffu/rtl/sparc_ffu.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ffu/rtl/sparc_ffu_ctl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ffu/rtl/sparc_ffu_ctl_visctl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ffu/rtl/sparc_ffu_dp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ffu/rtl/sparc_ffu_part_add32.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ffu/rtl/sparc_ffu_vis.v "

# IFU
append RTL_SOURCE_FILES        "${DV_ROOT}/design/include/ifu.h " ; # Only here for PyHP generation
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_nospu_wrap.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_cmp35.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_ctr5.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_dcl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_dec.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_errctl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_errdp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_fcl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_fdp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_wseldp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_sscan.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_ifqctl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_ifqdp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_rndrob.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_imd.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_incr46.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_invctl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_lfsr5.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_lru4.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_milfsm.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_par16.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_par32.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_par34.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_swl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_swpla.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_thrcmpl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_thrfsm.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_fsm.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_stsm.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_rtsm.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_htsm.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_counter.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_lfsr.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_shiftreg.v "

# LSU
append RTL_SOURCE_FILES        "${DV_ROOT}/design/include/lsu.h " ; # Only here for PyHP generation
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_nospu_wrap.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_asi_decode.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_dcdp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_excpctl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_dctl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_dctldp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_tagdp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_tlbdp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_pcx_qmon.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_rrobin_picker2.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_stb_ctl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_stb_ctldp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_stb_rwctl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_stb_rwdp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_qctl1.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_qctl2.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_qdp1.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_qdp2.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_dcache_lfsr.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/lsu/rtl/lsu_dc_parity_gen.v "

# MUL
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/mul/rtl/sparc_mul_top_nospu_wrap.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/mul/rtl/sparc_mul_top.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/mul/rtl/sparc_mul_dp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/mul/rtl/sparc_mul_cntl.v "

# TLU
append RTL_SOURCE_FILES           "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_nospu_wrap.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_incr64.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_mmu_ctl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_mmu_dp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_pib.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_addern_32.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_prencoder16.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_rrobin_picker.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_tcl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_tdp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_hyperv.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/tlu_misctl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/sparc_tlu_dec64.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/sparc_tlu_intctl.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/sparc_tlu_intdp.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/sparc_tlu_penc64.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/tlu/rtl/sparc_tlu_zcmp64.v "

# SRAM Wrappers
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/bw_r_frf.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/bw_r_itlb.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/bw_r_dtlb.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/bw_r_icd.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/bw_r_dcd.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/bw_r_dct.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/bw_r_ict.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/bw_r_scm.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/sram_l1i_val.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/sram_l1d_val.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/bw_r_rf32x80.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/bw_r_rf32x152b.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/srams/rtl/bw_r_rf16x160.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/sram_wrappers/FFU_SRAM_WRAPPER_HERE.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/sram_wrappers/L1I_DATA_SRAM_WRAPPER_HERE.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/sram_wrappers/L1D_TAG_SRAM_WRAPPER_HERE.v"
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/sram_wrappers/L1I_TAG_SRAM_WRAPPER_HERE.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/sparc/srams/rtl/sram_wrappers/L1D_DATA_SRAM_WRAPPER_HERE.v "

# Common stuff
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/mul64.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/swrvr_clib.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/swrvr_dlib.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/u1.beh.v "
append RTL_SOURCE_FILES        "${DV_ROOT}/design/chip/tile/common/rtl/m1.beh.v "

#########################################
# End of Design Specification Variables #
#########################################
