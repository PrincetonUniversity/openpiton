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

# Path to FRF SRAM module
set frf_module_path "ffu_frf_regfile_ibmsram"

# Determine size of FRF
set frf_height [lindex [get_attribute [get_cells $frf_module_path] height] 0]
set frf_width  [lindex [get_attribute [get_cells $frf_module_path] width] 0]

# Offset FRF from core boundary
set frf_offset_x [expr (118.213333333333 / 2.0) - ($frf_width / 2.0) - ($pgn_x_pitch / 2.0)]
set frf_offset_y [expr (2.0 * $pgn_y_pitch) + 0.067]

# Determine position of actual SRAM
set frf_x1 [expr $core_x1 + $frf_offset_x]
set frf_y1 [expr $core_y2 - $frf_offset_y - $frf_height]
set frf_x2 [expr $core_x1 + $frf_offset_x + $frf_width]
set frf_y2 [expr $core_y2 - $frf_offset_y]

# un-fix and un-place FRF
set_undoable_attribute [get_cells $frf_module_path] is_fixed {0}
set_undoable_attribute [get_cells $frf_module_path] is_placed {0}

# Change snap settings
set_object_snap_type -class hard_macro -snap litho
set_object_snap_type -class soft_macro -snap litho

# Move FRF
move_objects -x $frf_x1 -y $frf_y1 $frf_module_path

# Determine boundary of SRAM and split it into 2 rectangles
# with variables for coordinates for each
set frf_boundary [get_attribute [get_cells $frf_module_path] boundary]
set frf_lrect_x2 [lindex [lindex $frf_boundary 0] 0]
set frf_lrect_y2 [lindex [lindex $frf_boundary 0] 1]
set frf_srect_x1 [lindex [lindex $frf_boundary 1] 0]
set frf_srect_y2 [lindex [lindex $frf_boundary 1] 1]
set frf_srect_x2 [lindex [lindex $frf_boundary 2] 0]
set frf_srect_y1 [lindex [lindex $frf_boundary 3] 1]
set frf_lrect_y1 [lindex [lindex $frf_boundary 5] 1]
set frf_lrect_x1 [lindex [lindex $frf_boundary 6] 0]
