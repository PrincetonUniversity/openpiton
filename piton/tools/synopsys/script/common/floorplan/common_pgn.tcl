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

set_preroute_drc_strategy -ignore_discrete_metal_width_rule


# Determine core area
set core_area [get_attribute [get_core_area] bbox]
set core_x1 [lindex [lindex $core_area 0] 0]
set core_y1 [lindex [lindex $core_area 0] 1]
set core_x2 [lindex [lindex $core_area 1] 0]
set core_y2 [lindex [lindex $core_area 1] 1]

# Placement blockages on top and bottom of core
# of one standard cell height internally and externally
create_placement_blockage -bbox [list "$core_x1 $core_y1" "$core_x2 [expr $core_y1 + $std_cells_height]"] -type hard
create_placement_blockage -bbox [list "$core_x1 [expr $core_y1 - $std_cells_height]" "$core_x2 $core_y1"] -type hard
create_placement_blockage -bbox [list "$core_x1 [expr $core_y2 - $std_cells_height]" "$core_x2 $core_y2"] -type hard
create_placement_blockage -bbox [list "$core_x1 $core_y2" "$core_x2 [expr $core_y2 + $std_cells_height]"] -type hard

# Set keepout margin around macros to prevent placement around macros
set_keepout_margin -all_macros -type hard -outer [list [expr $std_cells_height / 2.0] $std_cells_height [expr $std_cells_height / 2.0] $std_cells_height]

# First preroute all the standard cells
# and fill empty spots
source -echo script/preroute_stdcells.tcl

# Mesh over whole core on M3
set_power_plan_strategy \
    default_low_pps \
    -nets [list ${MW_GROUND_NET} ${MW_POWER_NET}] \
    -core \
    -template ${DV_ROOT}/tools/synopsys/script/common/floorplan/core_pgn_mesh.tpl:default_low($strap_width_m2_m3,$pgn_x_step,[expr $pgn_x_pitch - $strap_width_m2_m3]) \
    -extension {stop: design_boundary}
compile_power_plan -strategy {default_low_pps}


# Default M6/M7 and M10/M11 meshes over whole core
set_power_plan_strategy \
    default_pps \
    -nets [list ${MW_GROUND_NET} ${MW_POWER_NET} ${MW_SRAM_POWER_NET}] \
    -core \
    -template ${DV_ROOT}/tools/synopsys/script/common/floorplan/core_pgn_mesh.tpl:default($strap_width_b1_b2,$strap_width_ma_mb,$pgn_x_step_ma_mb,$pgn_x_step_ma_mb,[expr $pgn_x_pitch - $strap_width_b1_b2],[expr $pgn_x_pitch - $strap_width_ma_mb],$pgn_y_step_ma_mb,$pgn_y_step_ma_mb,[expr $pgn_y_pitch - $strap_width_b1_b2],[expr $pgn_y_pitch - $strap_width_ma_mb]) \
    -extension {stop: design_boundary}
compile_power_plan -strategy default_pps

