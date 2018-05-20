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

# Pre-routes VDD and VSS for stdcells

# Tie high cells/Tie low cells
derive_pg_connection -power_net ${MW_POWER_NET} -ground_net ${MW_GROUND_NET} -tie
derive_pg_connection -power_net ${MW_SRAM_POWER_NET} -ground_net ${MW_GROUND_NET} -tie

# Place tie cells into module area
suppress_message "APL-017"
connect_tie_cells -objects [get_cells *] -obj_type cell_inst -tie_high_lib_cell $TIEHIGHCELL -tie_low_lib_cell $TIELOWCELL -incremental true
unsuppress_message "APL-017"

source script/connect_pg.tcl

# Ignore discrete metal widths
set_preroute_drc_strategy -ignore_discrete_metal_width_rule

suppress_message "PGRT-030"
# This is to make sure the following commands do not route above
# standard cell rails (connecting into SRAMs, which causes DRC problems)
set_preroute_drc_strategy -max_layer ${STD_CELL_RAIL_MAX_LAYER} -ignore_discrete_metal_width_rule

# preroute stdcells : Preroute rails for VDD and VSS
preroute_standard_cells \
    -mode rail \
    -nets ${MW_POWER_NET} \
    -fill_empty_rows \
    -extend_to_boundaries_and_generate_pins \
    -do_not_route_over_macros \
    -remove_floating_pieces
preroute_standard_cells \
    -mode rail \
    -nets ${MW_GROUND_NET} \
    -fill_empty_rows \
    -extend_to_boundaries_and_generate_pins \
    -remove_floating_pieces

# Reset max layer
set_preroute_drc_strategy -max_layer ${TOP_METAL_LAYER} -ignore_discrete_metal_width_rule
unsuppress_message "PGRT-030"
