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

# Floorplan script for FFU

# Source floorplan common script
source -echo ${DV_ROOT}/tools/synopsys/script/common/floorplan/common_floorplan.tcl

# Connect power and ground
source -echo script/connect_pg.tcl

# Create a floorplan
suppress_message "MWLIBP-311"
create_floorplan \
    -control_type width_and_height \
    -core_width 134.333333333333 \
    -core_height 143.1
unsuppress_message "MWLIBP-311"

# Create supply voltage ports
create_supply_port ${MW_POWER_PORT}
create_supply_port ${MW_SRAM_POWER_PORT}
create_supply_port ${MW_GROUND_PORT}

# Connect power and ground
source -echo script/connect_pg.tcl

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

# Preplace the SRAM
source -echo script/preplace_srams.tcl

# Create power/ground network
source -echo script/pgn.tcl

# Place pins after PGN
remove_pin_pad_physical_constraints 
set_pin_physical_constraints \
    [get_ports *] \
    -layers $MODULE_PIN_LAYERS
remove_fp_pin_constraints -block_level [get_ports *]
set_fp_pin_constraints -block_level -bus_ordering lsb -keep_buses_together on -use_physical_constraints on
place_fp_pins -use_existing_routing -block_level
