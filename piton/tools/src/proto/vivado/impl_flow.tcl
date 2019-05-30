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
# This script kicks of an implementation
# flow for the project
#

# Boiler plate startup
set DV_ROOT $::env(DV_ROOT)
source $DV_ROOT/tools/src/proto/vivado/setup.tcl

# Get additional protosyn runtime defines
source additional_defines.tcl
set ALL_VERILOG_MACROS [concat $ALL_DEFAULT_VERILOG_MACROS $PROTOSYN_RUNTIME_DEFINES]

puts "INFO: Using the following Verilog defines: ${ALL_VERILOG_MACROS}"

# Open the project
open_project ${VIVADO_PROJECT_FILE}

# Update Verilog MACROs property
set_property verilog_define ${ALL_VERILOG_MACROS} [get_fileset sources_1]
set_property verilog_define ${ALL_VERILOG_MACROS} [get_fileset sim_1]

# Some additional effort to meet timing
set_property flow {Vivado Implementation 2016} [get_runs impl_1]
set_property strategy Performance_ExtraTimingOpt [get_runs impl_1]

# Dealing with Vivado case, when it locks IPs as old ones
upgrade_ip [get_ips -all]

# Extra open/close to make Vivado use defines for a project,
# not only for synthesis
close_project
open_project ${VIVADO_PROJECT_FILE}

# Launch implementation
launch_run impl_1 -to_step write_bitstream -jobs $::env(NUM_VIVADO_JOBS)
puts "INFO: Implementation launched for project '${PROJECT_NAME}'"

# Wait for run to finish
wait_on_run impl_1

if {[get_property PROGRESS [get_runs impl_1]] != "100%"} {
    puts "ERROR: Implementation failed."
} else {
    puts "INFO: Implementation passed!"
}
