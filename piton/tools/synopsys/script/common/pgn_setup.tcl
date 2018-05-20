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

# Power/Ground networks setup

# PGN pitch and step
#    - Pitch - distance between adjacent power straps
#    - Step - distance between power straps of the same type

set pgn_x_pitch             [expr (62.0 * 0.13) / 3.0]
set pgn_y_pitch             [expr 3.0 * $std_cells_height]
set pgn_x_step              [expr 62.0 * 0.13]
set pgn_y_step              [expr 9.0 * $std_cells_height]
set pgn_x_step_ma_mb        [expr 2.0 * $pgn_x_step]
set pgn_y_step_ma_mb        [expr 2.0 * $pgn_y_step]

# PGN strap widths for different layers
set strap_width_m1          0.134
set strap_width_m2_m3       $strap_width_m1
set strap_width_m5          0.45
set strap_width_b1_b2       0.45
set strap_width_ma_mb       1.8

# PGN offset/misc. parameters
set sram_m1_ring_offset_x   0.4
set sram_m2_ring_offset_y   0.434
set sram_edge_offset        1.8
set strap_m5_sram_overshoot 0.45
set macro_gnd_ring_offset   0.5

