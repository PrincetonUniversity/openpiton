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
set g_number_of_jobs $::env(NUM_VIVADO_JOBS)
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
#set_property flow "Vivado Implementation $VIVADO_VERSION" [get_runs impl_1]
#set_property strategy Performance_ExtraTimingOpt [get_runs impl_1]

# Dealing with Vivado case, when it locks IPs as old ones
upgrade_ip [get_ips -all]

# Extra open/close to make Vivado use defines for a project,
# not only for synthesis
close_project
open_project ${VIVADO_PROJECT_FILE}
auto_detect_xpm
proc synthesis { g_root_dir g_number_of_jobs } {

        set number_of_jobs $g_number_of_jobs
        reset_run synth_1
        launch_runs synth_1 -jobs ${g_number_of_jobs}
        puts "Waiting for the Out Of Context IPs to be synthesized..."
        wait_on_run synth_1
        open_run synth_1

	set status [get_property STATUS [get_runs synth_1]]

	if { $status == "synth_design Complete!"} {
		file mkdir ${g_root_dir}/dcp
        	write_checkpoint -force $g_root_dir/dcp/synthesis.dcp
	} else {
		puts "Synthesis didn't succeed"
		exit 1
	}	
}


if { $env(VIVADO_NON_PROJECT_MODE) eq "1" } {

	puts "Project will be implemented in non-project mode. Do make implementation, make bitstream"
        #TODO: Need to use the right directory to place the dcp file.	
        synthesis $env(PITON_ROOT) $g_number_of_jobs

} else { 

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
}

set VIVADO_POSTROUTEPHYSOPT $::env(VIVADO_POSTROUTEPHYSOPT)
if {$VIVADO_POSTROUTEPHYSOPT && $BOARD_DEFAULT_VERILOG_MACROS == "ALVEO_BOARD"} {

  open_run impl_1
  set CurrentSlack [get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]]
  if { [expr $CurrentSlack < 0.000] } {

  # Here is iterative routing procedure applying a set of strategies
  file mkdir $env(PITON_ROOT)/build/iter_impl

  # Explore routing strategies
  set RouteDirectives "NoTimingRelaxation \
        Explore \
        MoreGlobalIterations \
        HigherDelayCost \
        AdvancedSkewModeling \
        AlternateCLBRouting \
        AggressiveExplore  \
        Default"

  set PhysOptDirectives "Explore \
        ExploreWithHoldFix  \
        AggressiveExplore  \
        AlternateReplication  \
        AggressiveFanoutOpt \
        AddRetime \
        AlternateFlowWithRetiming \
        RuntimeOptimized \
        ExploreWithAggressiveHoldFix \
        Default"

  set route_loops [llength $RouteDirectives]
  puts "=== Running route_design with $route_loops strategies"
  for {set route_loop 0} {$route_loop < $route_loops} {incr route_loop} {
    set route_design_directive [lindex $RouteDirectives $route_loop]
    route_design -directive $route_design_directive
    set CurrentSlack [get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]]
    puts "=== Finished $route_loop of $route_loops route_design $route_design_directive on [exec date] (WNS: $CurrentSlack)"

    set i 0
    set nloops [llength $PhysOptDirectives]
    # Post-Route Physical Optimization is effective when WNS is above -0.5ns, and could be stuck otherwise
    if { [expr {$CurrentSlack >= -0.5 || $route_loop == ($route_loops-1)}] } {
      for {set i 0} {$i < $nloops} {incr i} {
        set CurrentDirective [lindex $PhysOptDirectives $i]
        phys_opt_design -directive $CurrentDirective
        # Get the Slack after the optimization
        set CurrentSlack [get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]]
        puts "--- Finished post-route ($route_loop/$route_loops) phys_opt_design ($i/$nloops ) with directive $CurrentDirective (WNS: $CurrentSlack)"
      }
    }
    set CurrentSlack [get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]]
    puts "=== Finished phys_opt_design after $route_loop of $route_loops route_design $route_design_directive on [exec date] (WNS: $CurrentSlack)"
    write_checkpoint -force $env(PITON_ROOT)/build/iter_impl/post_route${route_loop}_${route_design_directive}.dcp

    if { [expr $CurrentSlack >= 0.000] } {
      break
    }
  }

  write_bitstream -force $env(PITON_ROOT)/build/iter_impl/iter_system.bit

  }
}
