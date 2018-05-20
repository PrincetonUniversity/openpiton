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
source $DV_ROOT/tools/src/proto/ise/setup.tcl

# Get additional protosyn runtime defines
source additional_defines.tcl
set ALL_VERILOG_MACROS [concat $ALL_DEFAULT_VERILOG_MACROS $PROTOSYN_RUNTIME_DEFINES]

puts "INFO: Using the following Verilog defines: ${ALL_VERILOG_MACROS}"

# Open the project
project open ${ISE_PROJECT_FILE}

# Update Verilog MACROs property
project set "Verilog Macros" "[join ${ALL_VERILOG_MACROS} " | " ]" -process "Synthesize - XST"

# Procedure to run a task and check results
proc run_task { task {instance ""} } {

   # helper proc for run_process

   set result ""
   if {[string equal $instance ""]} {
      set result [ process run "$task" ]
   } else {
      set result [ process run "$task" -instance "$instance" ]
   }
   #
   # check process status (and result)
   if {[string equal $instance ""]} {
      set status [ process get $task status ]
      if { ( ( $status != "up_to_date" ) && \
               ( $status != "warnings" ) ) || \
            ! $result } {
         return false
      }
   } else {
      return $result
   }
   
   return true
}

# Regenerate IP cores
set task "Regenerate Core"
set ip_status "PASS"
foreach xco_file $ALL_XCO_IP_FILES {
    if {[file exists $xco_file]} {
        set xco_file_instance [file rootname [file tail $xco_file]]
        puts "INFO: Regenerating IP core '$xco_file_instance'..."
        if { ! [run_task $task $xco_file_instance] } {
            puts "ERROR: Regenerate IP core '$xco_file_instance' failed"
            set ip_status "FAIL"
            break
        }
    }
}

# Run implementation, and bitgen
if {[string equal $ip_status "PASS"]} {
    set task "Implement Design"
    if { ! [run_task $task] } {
        puts "ERROR: Implementation failed."
    } else {
        set task "Generate Programming File"
        if { ! [run_task $task] } {
            puts "ERROR: Generating bit file failed."
        } else {
            puts "INFO: Implementation passed!"
        }
    }
}

project close
