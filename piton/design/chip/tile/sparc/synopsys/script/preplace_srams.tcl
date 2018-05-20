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
set frf_path                    "sparc0_ffu_ffu_frf_regfile_ibmsram"
set ifu_icd_10_path             "sparc0_ifu_ifu_icd/icache_way_10_ibmsram"
set ifu_icd_32_path             "sparc0_ifu_ifu_icd/icache_way_32_ibmsram"
set ifu_ict_path                "sparc0_ifu_ifu_ict_cache_ibmsram"
set lsu_dcd_10_path             "sparc0_lsu/lsu_dcache/dcache_way_01_ibmsram"
set lsu_dcd_32_path             "sparc0_lsu/lsu_dcache/dcache_way_23_ibmsram"
set lsu_dct_path                "sparc0_lsu/lsu_dtag_cache_ibmsram"

# Get dimensions of modules
set frf_height                  [lindex [get_attribute [get_cells $frf_path] height] 0]
set frf_width                   [lindex [get_attribute [get_cells $frf_path] width] 0]
set ifu_icd_10_height           [lindex [get_attribute [get_cells $ifu_icd_10_path] height] 0]
set ifu_icd_10_width            [lindex [get_attribute [get_cells $ifu_icd_10_path] width] 0]
set ifu_icd_32_height           [lindex [get_attribute [get_cells $ifu_icd_32_path] height] 0]
set ifu_icd_32_width            [lindex [get_attribute [get_cells $ifu_icd_32_path] width] 0]
set ifu_ict_height              [lindex [get_attribute [get_cells $ifu_ict_path] height] 0]
set ifu_ict_width               [lindex [get_attribute [get_cells $ifu_ict_path] width] 0]
set lsu_dcd_10_height           [lindex [get_attribute [get_cells $lsu_dcd_10_path] height] 0]
set lsu_dcd_10_width            [lindex [get_attribute [get_cells $lsu_dcd_10_path] width] 0]
set lsu_dcd_32_height           [lindex [get_attribute [get_cells $lsu_dcd_32_path] height] 0]
set lsu_dcd_32_width            [lindex [get_attribute [get_cells $lsu_dcd_32_path] width] 0]
set lsu_dct_height              [lindex [get_attribute [get_cells $lsu_dct_path] height] 0]
set lsu_dct_width               [lindex [get_attribute [get_cells $lsu_dct_path] width] 0]

# Set positions of module (taken from a virtual flat placement in design planning mode)
set frf_x1 [expr $core_x1 + 58.119]
set frf_y1 [expr $core_y1 + 16.2]
set frf_x2 [expr $frf_x1 + $frf_width]
set frf_y2 [expr $frf_y1 + $frf_height]

set ifu_icd_10_x1 [expr $core_x1 + 207.243]
set ifu_icd_10_y1 [expr $core_y1 + 502.951]
set ifu_icd_10_x2 [expr $ifu_icd_10_x1 + $ifu_icd_10_width]
set ifu_icd_10_y2 [expr $ifu_icd_10_y1 + $ifu_icd_10_height]

set ifu_icd_32_x1 [expr $core_x1 + 103.539]
set ifu_icd_32_y1 [expr $core_y1 + 502.951]
set ifu_icd_32_x2 [expr $ifu_icd_32_x1 + $ifu_icd_32_width]
set ifu_icd_32_y2 [expr $ifu_icd_32_y1 + $ifu_icd_32_height]

set ifu_ict_x1 [expr $core_x1 + 16.2]
set ifu_ict_y1 [expr $core_y1 + 436.949]
set ifu_ict_x2 [expr $ifu_ict_x1 + $ifu_ict_width]
set ifu_ict_y2 [expr $ifu_ict_y1 + $ifu_ict_height]

set lsu_dcd_10_x1 [expr $core_x1 + 317.615]
set lsu_dcd_10_y1 [expr $core_y1 + 16.2]
set lsu_dcd_10_x2 [expr $lsu_dcd_10_x1 + $lsu_dcd_10_width]
set lsu_dcd_10_y2 [expr $lsu_dcd_10_y1 + $lsu_dcd_10_height]

set lsu_dcd_32_x1 [expr $core_x1 + 218.229]
set lsu_dcd_32_y1 [expr $core_y1 + 16.2]
set lsu_dcd_32_x2 [expr $lsu_dcd_32_x1 + $lsu_dcd_32_width]
set lsu_dcd_32_y2 [expr $lsu_dcd_32_y1 + $lsu_dcd_32_height]

set lsu_dct_x1 [expr $core_x1 + 425.455]
set lsu_dct_y1 [expr $core_y1 + 16.2]
set lsu_dct_x2 [expr $lsu_dct_x1 + $lsu_dct_width]
set lsu_dct_y2 [expr $lsu_dct_y1 + $lsu_dct_height]

# Actually move SRAMs
rotate_objects -mirror Y $frf_path
move_object -x $frf_x1 -y $frf_y1 $frf_path
rotate_objects -mirror Y $ifu_icd_10_path
move_object -x $ifu_icd_10_x1 -y $ifu_icd_10_y1 $ifu_icd_10_path
move_object -x $ifu_icd_32_x1 -y $ifu_icd_32_y1 $ifu_icd_32_path
move_object -x $ifu_ict_x1 -y $ifu_ict_y1 $ifu_ict_path
rotate_objects -mirror Y $lsu_dcd_10_path
move_object -x $lsu_dcd_10_x1 -y $lsu_dcd_10_y1 $lsu_dcd_10_path
move_object -x $lsu_dcd_32_x1 -y $lsu_dcd_32_y1 $lsu_dcd_32_path
rotate_objects -mirror Y $lsu_dct_path
move_object -x $lsu_dct_x1 -y $lsu_dct_y1 $lsu_dct_path

# Determine boundary of SRAM and split it into 2 rectangles
# with variables for coordinates for each
set frf_boundary [get_attribute [get_cells $frf_path] boundary]
set frf_lrect_x2 [lindex [lindex $frf_boundary 0] 0]
set frf_lrect_y2 [lindex [lindex $frf_boundary 0] 1]
set frf_srect_x1 [lindex [lindex $frf_boundary 1] 0]
set frf_srect_y2 [lindex [lindex $frf_boundary 1] 1]
set frf_srect_x2 [lindex [lindex $frf_boundary 2] 0]
set frf_srect_y1 [lindex [lindex $frf_boundary 3] 1]
set frf_lrect_y1 [lindex [lindex $frf_boundary 5] 1]
set frf_lrect_x1 [lindex [lindex $frf_boundary 6] 0]

set ifu_icd_10_boundary [get_attribute [get_cells $ifu_icd_10_path] boundary]
set ifu_icd_10_lrect_x2 [lindex [lindex $ifu_icd_10_boundary 0] 0]
set ifu_icd_10_lrect_y2 [lindex [lindex $ifu_icd_10_boundary 0] 1]
set ifu_icd_10_srect_x1 [lindex [lindex $ifu_icd_10_boundary 1] 0]
set ifu_icd_10_srect_y2 [lindex [lindex $ifu_icd_10_boundary 1] 1]
set ifu_icd_10_srect_x2 [lindex [lindex $ifu_icd_10_boundary 2] 0]
set ifu_icd_10_srect_y1 [lindex [lindex $ifu_icd_10_boundary 3] 1]
set ifu_icd_10_lrect_y1 [lindex [lindex $ifu_icd_10_boundary 5] 1]
set ifu_icd_10_lrect_x1 [lindex [lindex $ifu_icd_10_boundary 6] 0]

set ifu_icd_32_boundary [get_attribute [get_cells $ifu_icd_32_path] boundary]
set ifu_icd_32_lrect_x2 [lindex [lindex $ifu_icd_32_boundary 0] 0]
set ifu_icd_32_lrect_y2 [lindex [lindex $ifu_icd_32_boundary 0] 1]
set ifu_icd_32_srect_x1 [lindex [lindex $ifu_icd_32_boundary 1] 0]
set ifu_icd_32_srect_y2 [lindex [lindex $ifu_icd_32_boundary 1] 1]
set ifu_icd_32_srect_x2 [lindex [lindex $ifu_icd_32_boundary 2] 0]
set ifu_icd_32_srect_y1 [lindex [lindex $ifu_icd_32_boundary 3] 1]
set ifu_icd_32_lrect_y1 [lindex [lindex $ifu_icd_32_boundary 5] 1]
set ifu_icd_32_lrect_x1 [lindex [lindex $ifu_icd_32_boundary 6] 0]

set ifu_ict_boundary [get_attribute [get_cells $ifu_ict_path] boundary]
set ifu_ict_lrect_x2 [lindex [lindex $ifu_ict_boundary 0] 0]
set ifu_ict_lrect_y2 [lindex [lindex $ifu_ict_boundary 0] 1]
set ifu_ict_srect_x1 [lindex [lindex $ifu_ict_boundary 1] 0]
set ifu_ict_srect_y2 [lindex [lindex $ifu_ict_boundary 1] 1]
set ifu_ict_srect_x2 [lindex [lindex $ifu_ict_boundary 2] 0]
set ifu_ict_srect_y1 [lindex [lindex $ifu_ict_boundary 3] 1]
set ifu_ict_lrect_y1 [lindex [lindex $ifu_ict_boundary 5] 1]
set ifu_ict_lrect_x1 [lindex [lindex $ifu_ict_boundary 6] 0]

set lsu_dcd_10_boundary [get_attribute [get_cells $lsu_dcd_10_path] boundary]
set lsu_dcd_10_lrect_x2 [lindex [lindex $lsu_dcd_10_boundary 0] 0]
set lsu_dcd_10_lrect_y2 [lindex [lindex $lsu_dcd_10_boundary 0] 1]
set lsu_dcd_10_srect_x1 [lindex [lindex $lsu_dcd_10_boundary 1] 0]
set lsu_dcd_10_srect_y2 [lindex [lindex $lsu_dcd_10_boundary 1] 1]
set lsu_dcd_10_srect_x2 [lindex [lindex $lsu_dcd_10_boundary 2] 0]
set lsu_dcd_10_srect_y1 [lindex [lindex $lsu_dcd_10_boundary 3] 1]
set lsu_dcd_10_lrect_y1 [lindex [lindex $lsu_dcd_10_boundary 5] 1]
set lsu_dcd_10_lrect_x1 [lindex [lindex $lsu_dcd_10_boundary 6] 0]

set lsu_dcd_32_boundary [get_attribute [get_cells $lsu_dcd_32_path] boundary]
set lsu_dcd_32_lrect_x2 [lindex [lindex $lsu_dcd_32_boundary 0] 0]
set lsu_dcd_32_lrect_y2 [lindex [lindex $lsu_dcd_32_boundary 0] 1]
set lsu_dcd_32_srect_x1 [lindex [lindex $lsu_dcd_32_boundary 1] 0]
set lsu_dcd_32_srect_y2 [lindex [lindex $lsu_dcd_32_boundary 1] 1]
set lsu_dcd_32_srect_x2 [lindex [lindex $lsu_dcd_32_boundary 2] 0]
set lsu_dcd_32_srect_y1 [lindex [lindex $lsu_dcd_32_boundary 3] 1]
set lsu_dcd_32_lrect_y1 [lindex [lindex $lsu_dcd_32_boundary 5] 1]
set lsu_dcd_32_lrect_x1 [lindex [lindex $lsu_dcd_32_boundary 6] 0]

set lsu_dct_boundary [get_attribute [get_cells $lsu_dct_path] boundary]
set lsu_dct_lrect_x2 [lindex [lindex $lsu_dct_boundary 0] 0]
set lsu_dct_lrect_y2 [lindex [lindex $lsu_dct_boundary 0] 1]
set lsu_dct_srect_x1 [lindex [lindex $lsu_dct_boundary 1] 0]
set lsu_dct_srect_y2 [lindex [lindex $lsu_dct_boundary 1] 1]
set lsu_dct_srect_x2 [lindex [lindex $lsu_dct_boundary 2] 0]
set lsu_dct_srect_y1 [lindex [lindex $lsu_dct_boundary 3] 1]
set lsu_dct_lrect_y1 [lindex [lindex $lsu_dct_boundary 5] 1]
set lsu_dct_lrect_x1 [lindex [lindex $lsu_dct_boundary 6] 0]
