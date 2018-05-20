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

# Paths to SRAMs
source -echo script/sram_paths.tcl

# Get dimensions of modules
set l2_data_height              [lindex [get_attribute [get_cells $l2_data_path] height] 0]
set l2_data_width               [lindex [get_attribute [get_cells $l2_data_path] width] 0]
set l2_dir_height               [lindex [get_attribute [get_cells $l2_dir_path] height] 0]
set l2_dir_width                [lindex [get_attribute [get_cells $l2_dir_path] width] 0]
set l2_tag_height               [lindex [get_attribute [get_cells $l2_tag_path] height] 0]
set l2_tag_width                [lindex [get_attribute [get_cells $l2_tag_path] width] 0]
set l2_state_height             [lindex [get_attribute [get_cells $l2_state_path] height] 0]
set l2_state_width              [lindex [get_attribute [get_cells $l2_state_path] width] 0]
set l15_hmt_height              [lindex [get_attribute [get_cells $l15_hmt_path] height] 0]
set l15_hmt_width               [lindex [get_attribute [get_cells $l15_hmt_path] width] 0]
set l15_data_height             [lindex [get_attribute [get_cells $l15_data_path] height] 0]
set l15_data_width              [lindex [get_attribute [get_cells $l15_data_path] width] 0]
set l15_tag_height              [lindex [get_attribute [get_cells $l15_tag_path] height] 0]
set l15_tag_width               [lindex [get_attribute [get_cells $l15_tag_path] width] 0]

# Set position of modules (based on virtual flat placement)
set l2_data_x1 [expr $core_x2 - $l2_data_width - (2.0 * $pgn_x_step)]
set l2_data_y1 [expr $sparc_y2 - $l2_data_height]
set l2_data_x2 [expr $l2_data_x1 + $l2_data_width]
set l2_data_y2 [expr $l2_data_y1 + $l2_data_height]

set l2_state_x1 [expr $l2_data_x1 - $l2_state_width - (3.0 * $pgn_x_step)]
set l2_state_y1 [expr $sparc_y2 - $l2_state_height]
set l2_state_x2 [expr $l2_state_x1 + $l2_state_width]
set l2_state_y2 [expr $l2_state_y1 + $l2_state_height]

set l2_dir_x1 [expr $core_x2 - $l2_dir_width - (2.0 * $pgn_x_step)]
set l2_dir_y1 [expr $l2_data_y1 - $l2_dir_height - (2.0 * $pgn_y_step)]
set l2_dir_x2 [expr $l2_dir_x1 + $l2_dir_width]
set l2_dir_y2 [expr $l2_dir_y1 + $l2_dir_height]

set l2_tag_x1 [expr $sparc_x2 + (3.0 * $pgn_x_step)]
set l2_tag_y1 [expr $l2_data_y1 - $l2_tag_height - (2.0 * $pgn_y_step)]
set l2_tag_x2 [expr $l2_tag_x1 + $l2_tag_width]
set l2_tag_y2 [expr $l2_tag_y1 + $l2_tag_height]

set l15_hmt_x1 [expr $core_x2 - $l15_hmt_width - (2.0 * $pgn_x_step)]
set l15_hmt_y1 [expr $l2_dir_y1 - $l15_hmt_height - (2.0 * $pgn_y_step)]
set l15_hmt_x2 [expr $l15_hmt_x1 + $l15_hmt_width]
set l15_hmt_y2 [expr $l15_hmt_y1 + $l15_hmt_height]

set l15_data_x1 [expr $l2_tag_x2 + (8.0 * $pgn_x_step)]
set l15_data_y1 [expr $core_x1 + (2.0 * $pgn_y_step)]
set l15_data_x2 [expr $l15_data_x1 + $l15_data_width]
set l15_data_y2 [expr $l15_data_y1 + $l15_data_height]

set l15_tag_x1 [expr $sparc_x2 + (8.0 * $pgn_x_step)]
set l15_tag_y1 [expr $core_x1 + (2.0 * $pgn_y_step)]
set l15_tag_x2 [expr $l15_tag_x1 + $l15_tag_width]
set l15_tag_y2 [expr $l15_tag_y1 + $l15_tag_height]

# Actually move SRAMs
rotate_objects -mirror Y $l2_data_path
move_object -x $l2_data_x1 -y $l2_data_y1 $l2_data_path
rotate_objects -mirror Y $l2_dir_path
move_object -x $l2_dir_x1 -y $l2_dir_y1 $l2_dir_path
move_object -x $l2_tag_x1 -y $l2_tag_y1 $l2_tag_path
rotate_objects -mirror Y $l2_state_path
move_object -x $l2_state_x1 -y $l2_state_y1 $l2_state_path
rotate_objects -mirror Y $l15_hmt_path
move_object -x $l15_hmt_x1 -y $l15_hmt_y1 $l15_hmt_path
move_object -x $l15_data_x1 -y $l15_data_y1 $l15_data_path
move_object -x $l15_tag_x1 -y $l15_tag_y1 $l15_tag_path
