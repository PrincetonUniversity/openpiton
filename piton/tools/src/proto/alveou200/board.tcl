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
# Board specific variables
# Not intended to be run standalone
#
set BOARD_PART "xilinx.com:au200:part0:1.3"
set FPGA_PART "xcu200-fsgd2104-2-e"
set VIVADO_FLOW_PERF_OPT 0
set BOARD_DEFAULT_VERILOG_MACROS "ALVEO_BOARD"

# Create a block design containing PCIe and GPIO using the FPGA_PART variable
# It will produce the "meep_shell.bd" file
set BD_NAME ${DV_ROOT}/design/chipset/xilinx/${BOARD}/meep_shell/meep_shell.bd

if { ![file exists ${BD_NAME} ]} {
    source $DV_ROOT/tools/src/proto/${BOARD}/meep_shell.tcl
}

# Grab the file from where the above tcl script has placed it
set DESIGN_BD_FILES [list $DV_ROOT/design/chipset/xilinx/${BOARD}/meep_shell/meep_shell]



