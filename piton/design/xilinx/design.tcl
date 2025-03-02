# Modified by Barcelona Supercomputing Center on March 3rd, 2022
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

#
# Design specific variables.
# Not intended to be run standalone.
#

set DESIGN_NAME "system"

set DESIGN_INCLUDE_DIRS ""

set DESIGN_DEFAULT_VERILOG_MACROS "PITON_FULL_SYSTEM PITON_FPGA_NO_DMBR MERGE_L1_DCACHE FPGA_SYN_1THREAD FPGA_FORCE_SRAM_ICACHE_TAG FPGA_FORCE_SRAM_LSU_ICACHE FPGA_FORCE_SRAM_DCACHE_TAG FPGA_FORCE_SRAM_LSU_DCACHE FPGA_FORCE_SRAM_RF16X160 FPGA_FORCE_SRAM_RF32X80 CONFIG_DISABLE_BIST_CLEAR"

set CORE_RTL_FILES ""

if {[info exists ::env(PITON_ARIANE)]} {
  set fp [open "$::env(ARIANE_ROOT)/Flist.ariane" r]
  set file_data [read $fp]
  set data [split $file_data "\n"]
  set ARIANE_RTL_FILES {}
  puts "Sources from $::env(ARIANE_ROOT)/Flist.ariane:"
  foreach line $data {
   set line [regsub -all  {\r} $line ""]
   set line [regsub -all  {\+.*} $line ""]
   set line [regsub {cpp.*} $line ""]
   set line [regsub {//.*} $line ""]
   set line [regsub {#.*} $line ""]
   if  {[string trim $line] eq ""} then continue
   lappend ARIANE_RTL_FILES "$::env(ARIANE_ROOT)/${line}"
   puts "$::env(ARIANE_ROOT)/${line}"
  } 
  close $fp

  set CORE_RTL_FILES [concat ${CORE_RTL_FILES} ${ARIANE_RTL_FILES}]
  puts "Including Ariane RTL files"
}


set DESIGN_RTL_IMPL_FILES [concat \
    ${SYSTEM_RTL_IMPL_FILES} \
    ${CHIP_RTL_IMPL_FILES} \
    ${PASSTHRU_RTL_IMPL_FILES} \
    ${CHIPSET_RTL_IMPL_FILES} \
    ${CORE_RTL_FILES} \
]

set DESIGN_INCLUDE_FILES [concat \
    ${SYSTEM_INCLUDE_FILES} \
    ${CHIP_INCLUDE_FILES} \
    ${PASSTHRU_INCLUDE_FILES} \
    ${CHIPSET_INCLUDE_FILES}
]

set DESIGN_IP_FILE_PREFIXES [concat \
    ${SYSTEM_IP_FILE_PREFIXES} \
    ${CHIP_IP_FILE_PREFIXES} \
    ${PASSTHRU_IP_FILE_PREFIXES} \
    ${CHIPSET_IP_FILE_PREFIXES} \
]

set DESIGN_COE_IP_FILES [concat \
    ${SYSTEM_COE_IP_FILES} \
    ${CHIP_COE_IP_FILES} \
    ${PASSTHRU_COE_IP_FILES} \
    ${CHIPSET_COE_IP_FILES} \
]

set DESIGN_PRJ_IP_FILES [concat \
    ${SYSTEM_PRJ_IP_FILES} \
    ${CHIP_PRJ_IP_FILES} \
    ${PASSTHRU_PRJ_IP_FILES} \
    ${CHIPSET_PRJ_IP_FILES} \
]
