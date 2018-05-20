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

# SRAM paths
source -echo script/sram_paths.tcl

# Ignore discrete metal width rule
set_preroute_drc_strategy -ignore_discrete_metal_width_rule

# Create the power plan regions
create_power_plan_regions l2_data_ppr \
    -group_of_macros [get_cells -all $l2_data_path]
create_power_plan_regions l2_dir_ppr \
    -group_of_macros [get_cells -all $l2_dir_path]
create_power_plan_regions l2_tag_ppr \
    -group_of_macros [get_cells -all $l2_tag_path]
create_power_plan_regions l2_state_ppr \
    -group_of_macros [get_cells -all $l2_state_path]
create_power_plan_regions l15_data_ppr \
    -group_of_macros [get_cells -all $l15_data_path]
create_power_plan_regions l15_hmt_ppr \
    -group_of_macros [get_cells -all $l15_hmt_path]
create_power_plan_regions l15_tag_ppr \
    -group_of_macros [get_cells -all $l15_tag_path]

# Determine core area
set core_area [get_attribute [get_core_area] bbox]
set core_x1 [lindex [lindex $core_area 0] 0]
set core_y1 [lindex [lindex $core_area 0] 1]
set core_x2 [lindex [lindex $core_area 1] 0]
set core_y2 [lindex [lindex $core_area 1] 1]

# First preroute all the standard cells
# and fill empty spots
source -echo script/preroute_stdcells.tcl

# Mesh over whole core above standard cell rails
set_power_plan_strategy \
    default_low_pps \
    -nets [list ${MW_GROUND_NET} ${MW_POWER_NET}] \
    -core \
    -template ${DV_ROOT}/tools/synopsys/script/common/floorplan/core_pgn_mesh.tpl:default_low($strap_width_m2_m3,$pgn_x_step,[expr $pgn_x_pitch - $strap_width_m2_m3]) \
    -extension {stop: design_boundary}
compile_power_plan -strategy {default_low_pps}

# For some  reason, need to specifically preroute this,
# not sure why, but it works
preroute_instances \
    -connect_instances specified \
    -cells [get_cells -all core] \
    -skip_left_side \
    -skip_right_side \
    -nets [list ${MW_GROUND_NET} ${MW_POWER_NET}] \
    -route_pins_on_layer M3 \
    -primary_routing_layer pin \
    -routing_width $strap_width_m2_m3

# Straps specifically over SRAMs to hit P/G pins
set sram_pps {}
foreach sram_ppr {l2_data_ppr l2_dir_ppr l2_tag_ppr l2_state_ppr l15_data_ppr l15_hmt_ppr l15_tag_ppr} {
    # Find the left most point of the SRAM
    set sram_x1 [lindex [lindex [get_attribute [get_power_plan_regions $sram_ppr] points] 0] 0]
    foreach point [get_attribute [get_power_plan_regions $sram_ppr] points] {
        if {[lindex $point 0] < $sram_x1} {
            set sram_x1 [lindex $point 0]
        }
    }

    # Find the position of the first power strap over the SRAM
    set start_at_vss [expr $core_x1 + (ceil(($sram_x1 - $core_x1) / $pgn_x_step) * $pgn_x_step)]
    set start_at_vdd [expr ($core_x1 + $pgn_x_pitch) + (ceil(($sram_x1 - ($core_x1 + $pgn_x_pitch)) / $pgn_x_step) * $pgn_x_step)]
    set start_at_vcs [expr ($core_x1 + (2.0 * $pgn_x_pitch)) + (ceil(($sram_x1 - ($core_x1 + (2.0 * $pgn_x_pitch))) / $pgn_x_step) * $pgn_x_step)]
    set sram_offset [expr $start_at_vss - $sram_x1]
    set net_list [list ${MW_GROUND_NET} ${MW_POWER_NET} ${MW_SRAM_POWER_NET}]
    if {$start_at_vcs < $start_at_vss} {
        set sram_offset [expr $start_at_vcs - $sram_x1]
        set net_list [list ${MW_SRAM_POWER_NET} ${MW_GROUND_NET} ${MW_POWER_NET}]
    }
    if {$start_at_vdd < $start_at_vss} {
        set sram_offset [expr $start_at_vdd - $sram_x1]
        set net_list [list ${MW_POWER_NET} ${MW_SRAM_POWER_NET} ${MW_GROUND_NET}]
    }

    # Create power plan strategy from template file
    set_power_plan_strategy \
        ${sram_ppr}_pps \
        -nets $net_list \
        -power_plan_regions $sram_ppr \
        -template ${DV_ROOT}/tools/synopsys/script/common/floorplan/core_pgn_mesh.tpl:sram($strap_width_m5,$pgn_x_step,[expr $pgn_x_pitch - $strap_width_m5],$sram_offset)

    # Append to list of strategies to be committed
    append sram_pps "${sram_ppr}_pps "
}
compile_power_plan -strategy $sram_pps

# Create routing blockage over whole sparc core submodule on upper PGN layers 
# to prevent edges getting power straps routed over them (they don't via to anythng anyways)
set mid1_blockage [create_routing_blockage -layers {metal6Blockage} -bbox [list "[expr $sparc_x1 + $strap_width_ma_mb] $sparc_y1" "[expr $sparc_x2 - $strap_width_ma_mb] $sparc_y2"]]
set mid2_blockage [create_routing_blockage -layers {metal7Blockage} -bbox [list "$sparc_x1 [expr $sparc_y1 + $strap_width_ma_mb]" "$sparc_x2 [expr $sparc_y2 - $strap_width_ma_mb]"]]
set top1_blockage [create_routing_blockage -layers {metal10Blockage} -bbox [list "[expr $sparc_x1 + $strap_width_ma_mb] $sparc_y1" "[expr $sparc_x2 - $strap_width_ma_mb] $sparc_y2"]]
set top2_blockage [create_routing_blockage -layers {metal11Blockage} -bbox [list "$sparc_x1 [expr $sparc_y1 + $strap_width_ma_mb]" "$sparc_x2 [expr $sparc_y2 - $strap_width_ma_mb]"]]

# Default upper layer PGN meshes over whole core
set_power_plan_strategy \
    default_pps \
    -nets [list ${MW_GROUND_NET} ${MW_POWER_NET} ${MW_SRAM_POWER_NET}] \
    -core \
    -template ${DV_ROOT}/tools/synopsys/script/common/floorplan/core_pgn_mesh.tpl:default($strap_width_b1_b2,$strap_width_ma_mb,$pgn_x_step_ma_mb,$pgn_x_step_ma_mb,[expr $pgn_x_pitch - $strap_width_b1_b2],[expr $pgn_x_pitch - $strap_width_ma_mb],$pgn_y_step_ma_mb,$pgn_y_step_ma_mb,[expr $pgn_y_pitch - $strap_width_b1_b2],[expr $pgn_y_pitch - $strap_width_ma_mb]) \
    -extension {stop: design_boundary}
compile_power_plan -strategy default_pps

# Remove the routing blockages
remove_routing_blockage $mid1_blockage
remove_routing_blockage $mid2_blockage
remove_routing_blockage $top1_blockage
remove_routing_blockage $top2_blockage
