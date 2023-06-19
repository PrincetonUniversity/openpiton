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
# Design and board generic variables
# Not intended to be run standalone
#

set MODEL_DIR $::env(MODEL_DIR)
set DESIGN_DIR $::env(PROTOSYN_RUNTIME_DESIGN_PATH)
set BOARD $::env(PROTOSYN_RUNTIME_BOARD)
set BOARD_DIR "${DESIGN_DIR}/$BOARD"

set VIVADO_VERSION [ string range [ version -short ] 0 3 ]
source $DV_ROOT/tools/src/proto/common/rtl_setup.tcl

set BLACKPARROT_RTL_IMPL_FILES {}
set BLACKPARROT_INCLUDE_DIRS {}
if {[info exists ::env(PITON_BLACKPARROT)]} {
    source ${DV_ROOT}/tools/src/proto/common/blackparrot.tcl
}

source $DESIGN_DIR/design.tcl
source $DV_ROOT/tools/src/proto/${BOARD}/board.tcl

set PROJECT_NAME "${BOARD}_${DESIGN_NAME}"
set PROJECT_DIR [file normalize ./${PROJECT_NAME}]
set VIVADO_PROJECT_FILE "${PROJECT_DIR}/${PROJECT_NAME}.xpr"
set ISE_PROJECT_FILE "${PROJECT_DIR}/${PROJECT_NAME}.xise"

# Combined variables from global, design, and board
set ALL_INCLUDE_DIRS [concat ${GLOBAL_INCLUDE_DIRS} ${DESIGN_INCLUDE_DIRS}]

set ALL_RTL_IMPL_FILES [concat ${DESIGN_RTL_IMPL_FILES}]

set ALL_INCLUDE_FILES [concat ${GLOBAL_INCLUDE_FILES} ${DESIGN_INCLUDE_FILES}]

set ALL_IP_FILE_PREFIXES [concat ${DESIGN_IP_FILE_PREFIXES}]

set ALL_XCI_IP_FILES [list ]
foreach ip_file ${ALL_IP_FILE_PREFIXES} {
    lappend ALL_XCI_IP_FILES "${ip_file}.xci"
}

set ALL_XCO_IP_FILES [list ]
foreach ip_file ${ALL_IP_FILE_PREFIXES} {
        lappend ALL_XCO_IP_FILES "${ip_file}.xco"
}

set ALL_COE_FILES [concat ${DESIGN_COE_IP_FILES}]

set ALL_PRJ_IP_FILES [concat ${DESIGN_PRJ_IP_FILES}]

# get pyhp globals
# note that this may override some evironment vars!
global ::env
if {[file exists $DESIGN_DIR/pyhp_setup.tcl]} {
    source $DESIGN_DIR/pyhp_setup.tcl
}

# Set the verilog macros
# note: we need to add the adjustable RTL params here
set ALL_DEFAULT_VERILOG_MACROS [concat \
    ${GLOBAL_DEFAULT_VERILOG_MACROS}   \
    ${DESIGN_DEFAULT_VERILOG_MACROS}   \
    ${BOARD_DEFAULT_VERILOG_MACROS}    \
]

if {[info exists ::env(PITON_OST1)]} {
  append ALL_DEFAULT_VERILOG_MACROS " PITON_OST1"
}

if {[info exists ::env(PITON_PICO)]} {
  append ALL_DEFAULT_VERILOG_MACROS " PITON_PICO"
}

if {[info exists ::env(PITON_PICO_HET)]} {
  append ALL_DEFAULT_VERILOG_MACROS " PITON_PICO PITON_PICO_HET"
}

if {[info exists ::env(PITON_ARIANE)]} {
  append ALL_DEFAULT_VERILOG_MACROS " PITON_ARIANE PITON_RV64_PLATFORM PITON_RV64_DEBUGUNIT PITON_RV64_CLINT PITON_RV64_PLIC WT_DCACHE"
}

if {[info exists ::env(PITON_BLACKPARROT)]} {
  append ALL_DEFAULT_VERILOG_MACROS " PITON_BLACKPARROT PITON_RV64_PLATFORM PITON_RV64_CLINT PITON_RV64_PLIC"
}

for {set k 0} {$k < $::env(PITON_NUM_TILES)} {incr k} {
  if {[info exists "::env(RTL_ARIANE$k)"]} {
    append ALL_DEFAULT_VERILOG_MACROS " RTL_ARIANE$k"
  }
  if {[info exists "::env(RTL_BLACKPARROT$k)"]} {
    append ALL_DEFAULT_VERILOG_MACROS " RTL_BLACKPARROT$k"
  }
  if {[info exists "::env(RTL_PICO$k)"]} {
    append ALL_DEFAULT_VERILOG_MACROS " RTL_PICO$k"
  }
  if {[info exists "::env(RTL_SPARC$k)"]} {
    append ALL_DEFAULT_VERILOG_MACROS " RTL_SPARC$k"
  }
  if {[info exists "::env(RTL_TILE$k)"]} {
    append ALL_DEFAULT_VERILOG_MACROS " RTL_TILE$k"
  }
}

puts "INFO: Using Defines: ${ALL_DEFAULT_VERILOG_MACROS}"

# Pre-process PyHP files
source $DV_ROOT/tools/src/proto/common/pyhp_preprocess.tcl
set ALL_RTL_IMPL_FILES [pyhp_preprocess ${ALL_RTL_IMPL_FILES}]
set ALL_INCLUDE_FILES [pyhp_preprocess ${ALL_INCLUDE_FILES}]


if  {[info exists ::env(PITON_RV64_PLATFORM)]} {
  puts "INFO: compiling RV64 DTS and bootroms (MAX_HARTS=$::env(PITON_NUM_TILES), UART_FREQ=$env(CONFIG_SYS_FREQ))..."
  
  
  # credit goes to https://github.com/PrincetonUniversity/openpiton/issues/50 
  # and https://www.xilinx.com/support/answers/72570.html
  set tmp_PYTHONPATH $::env(PYTHONPATH)
  set tmp_PYTHONHOME $::env(PYTHONHOME)
  unset ::env(PYTHONPATH)
  unset ::env(PYTHONHOME)
  
  set TMP [pwd]
  cd $::env(DV_ROOT)/design/chipset/rv64_platform/bootrom/baremetal
  # Note: dd dumps info to stderr that we do not want to interpret
  # otherwise this command fails...
  exec make clean 2> /dev/null
  exec make all 2> /dev/null
  cd $::env(DV_ROOT)/design/chipset/rv64_platform/bootrom/linux
  # Note: dd dumps info to stderr that we do not want to interpret
  # otherwise this command fails...
  exec make clean 2> /dev/null
  exec make all MAX_HARTS=$::env(PITON_NUM_TILES) UART_FREQ=$::env(CONFIG_SYS_FREQ) 2> /dev/null
  puts "INFO: done"
  # two targets per hart (M,S) and two interrupt sources (UART, Ethernet)
  set NUM_TARGETS [expr 2*$::env(PITON_NUM_TILES)]
  set NUM_SOURCES 2
  puts "INFO: generating PLIC for Ariane ($NUM_TARGETS targets, $NUM_SOURCES sources)..."
  cd $::env(ARIANE_ROOT)/corev_apu/rv_plic/rtl
  exec ./gen_plic_addrmap.py -t $NUM_TARGETS -s $NUM_SOURCES > plic_regmap.sv

  cd $TMP
  puts "INFO: done"
  set ::env(PYTHONPATH) $tmp_PYTHONPATH
  set ::env(PYTHONHOME) $tmp_PYTHONHOME
}

