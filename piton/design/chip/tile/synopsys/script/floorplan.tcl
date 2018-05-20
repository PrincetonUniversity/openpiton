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

# Floorplan script for the tile

# Source floorplan common script
source  -echo ${DV_ROOT}/tools/synopsys/script/common/floorplan/common_floorplan.tcl

# Connect power and ground
source -echo script/connect_pg.tcl

# Create a floorplan
suppress_message "MWLIBP-311"
create_floorplan \
    -control_type width_and_height \
    -core_width 1130.0 \
    -core_height 1040.0
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

# Preplace core
set sparc_path "core"
set sparc_height [lindex [get_attribute [get_cells $sparc_path] height] 0]
set sparc_width [lindex [get_attribute [get_cells $sparc_path] width] 0]
set sparc_x1 [expr $core_x1 + (2.0 * $pgn_x_step)]
set sparc_y1 [expr $core_y1 + (2.0 * $pgn_y_step)]
set sparc_x2 [expr $sparc_x1 + $sparc_width]
set sparc_y2 [expr $sparc_y1 + $sparc_height]
move_objects -x $sparc_x1 -y $sparc_y1 $sparc_path
create_placement_blockage -bbox [list "$sparc_x1 $sparc_y1" "$sparc_x2 $sparc_y2"] -type hard 

# Place SRAMs
source -echo script/preplace_srams.tcl

# Create power/ground network
source -echo script/pgn.tcl

# place pins after PGN
source -echo -verbose script/place_pins.tcl
