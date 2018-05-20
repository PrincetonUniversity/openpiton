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
source $DV_ROOT/tools/src/proto/common/rtl_setup.tcl
source $DESIGN_DIR/design.tcl
source $DV_ROOT/tools/src/proto/${BOARD}/board.tcl

set PROJECT_NAME "${BOARD}_${DESIGN_NAME}"
set PROJECT_DIR [file normalize ./${PROJECT_NAME}]
set VIVADO_PROJECT_FILE "${PROJECT_DIR}/${PROJECT_NAME}.xpr"
set ISE_PROJECT_FILE "${PROJECT_DIR}/${PROJECT_NAME}.xise"

# Combined variables from global, design, and board
set ALL_INCLUDE_DIRS [concat ${GLOBAL_INCLUDE_DIRS} ${DESIGN_INCLUDE_DIRS}]
set ALL_DEFAULT_VERILOG_MACROS [concat \
    ${GLOBAL_DEFAULT_VERILOG_MACROS} \
    ${DESIGN_DEFAULT_VERILOG_MACROS} \
    ${BOARD_DEFAULT_VERILOG_MACROS} \
]

puts "INFO: Using Defines: ${ALL_DEFAULT_VERILOG_MACROS}"

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

# Pre-process PyHP files
global ::env
if {[file exists $DESIGN_DIR/pyhp_setup.tcl]} {
    source $DESIGN_DIR/pyhp_setup.tcl
}
source $DV_ROOT/tools/src/proto/common/pyhp_preprocess.tcl
set ALL_RTL_IMPL_FILES [pyhp_preprocess ${ALL_RTL_IMPL_FILES}]
set ALL_INCLUDE_FILES [pyhp_preprocess ${ALL_INCLUDE_FILES}]
