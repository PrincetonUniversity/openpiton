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

remove_pin_pad_physical_constraints
remove_fp_pin_constraints


# delta for E1 track is .8
set X_DELTA $min_spacing_mx_high
# delta for B3 track is .4
set Y_DELTA [expr 4.0 * $min_spacing_bx]
set CORE_BUS_WIDTH 64

set PORT_SEPARATION [expr 4*$X_DELTA]
set PORT_SEPARATION 0

# core_x1
# core_x2
# core_y1
# core_y2

################################################
# NORTH NOCs
################################################
set x_pos [expr $core_x2 - 3*$X_DELTA - $PORT_SEPARATION]
set y_pos $core_y2
set x_pos [expr $x_pos - $CORE_BUS_WIDTH*$X_DELTA - $PORT_SEPARATION] 
set_pin_physical_constraints {dyn0_dataIn_N[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_validIn_N} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_dNo_yummy} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - $CORE_BUS_WIDTH*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_dNo[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_dNo_valid} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_yummyOut_N} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"

set x_pos [expr $x_pos - $CORE_BUS_WIDTH*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_dataIn_N[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_validIn_N} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_dNo_yummy} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - $CORE_BUS_WIDTH*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_dNo[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_dNo_valid} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_yummyOut_N} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"

set x_pos [expr $x_pos - $CORE_BUS_WIDTH*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_dataIn_N[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_validIn_N} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_dNo_yummy} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - $CORE_BUS_WIDTH*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_dNo[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_dNo_valid} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_yummyOut_N} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"

################################################
# NORTH MISCs
################################################
# top right on a different layer
# clk, rst_n, clk_en, default_chipid, default_coreid_x, default_coreid_y, flat_tileid
set y_pos $core_y2

set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {clk} -side 2 -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {rst_n} -side 2 -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"

set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {clk_en} -side 2 -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"

set x_pos [expr $x_pos - 16*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {default_chipid[0]} -side 2 -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"

set x_pos [expr $x_pos - 16*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {default_coreid_x[0]} -side 2 -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"

set x_pos [expr $x_pos - 16*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {default_coreid_y[0]} -side 2 -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"

set x_pos [expr $x_pos - 8*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {flat_tileid[0]} -side 2 -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"

set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {jtag_tiles_ucb_val} -side 3 -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 8*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {jtag_tiles_ucb_data[0]} -side 3 -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {tile_jtag_ucb_val} -side 3 -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 8*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {tile_jtag_ucb_data[0]} -side 3 -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"

################################################
# EAST NOCs
################################################
set x_pos $core_x2
set y_pos [expr $core_y2 - 3*$Y_DELTA - $PORT_SEPARATION]
set y_pos [expr $y_pos - $CORE_BUS_WIDTH*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_dataIn_E[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_validIn_E} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_dEo_yummy} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - $CORE_BUS_WIDTH*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_dEo[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_dEo_valid} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_yummyOut_E} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"

set y_pos [expr $y_pos - $CORE_BUS_WIDTH*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_dataIn_E[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_validIn_E} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_dEo_yummy} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - $CORE_BUS_WIDTH*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_dEo[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_dEo_valid} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_yummyOut_E} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"

set y_pos [expr $y_pos - $CORE_BUS_WIDTH*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_dataIn_E[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_validIn_E} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_dEo_yummy} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - $CORE_BUS_WIDTH*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_dEo[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_dEo_valid} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_yummyOut_E} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"

################################################
# WEST NOCs
################################################
set x_pos $core_x1
set y_pos [expr $core_y2 - 3*$Y_DELTA - $PORT_SEPARATION]
set y_pos [expr $y_pos - $CORE_BUS_WIDTH*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_dWo[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_dWo_valid} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_yummyOut_W} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - $CORE_BUS_WIDTH*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_dataIn_W[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_validIn_W} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_dWo_yummy} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"

set y_pos [expr $y_pos - $CORE_BUS_WIDTH*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_dWo[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_dWo_valid} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_yummyOut_W} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - $CORE_BUS_WIDTH*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_dataIn_W[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_validIn_W} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_dWo_yummy} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"

set y_pos [expr $y_pos - $CORE_BUS_WIDTH*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_dWo[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_dWo_valid} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_yummyOut_W} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - $CORE_BUS_WIDTH*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_dataIn_W[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_validIn_W} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set y_pos [expr $y_pos - 1*$Y_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_dWo_yummy} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"

################################################
# SOUTH NOCs
################################################
set x_pos [expr $core_x2 - 3*$X_DELTA - $PORT_SEPARATION]
set y_pos $core_y1
set x_pos [expr $x_pos - $CORE_BUS_WIDTH*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_dSo[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_dSo_valid} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_yummyOut_S} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - $CORE_BUS_WIDTH*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_dataIn_S[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_validIn_S} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn0_dSo_yummy} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"

set x_pos [expr $x_pos - $CORE_BUS_WIDTH*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_dSo[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_dSo_valid} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_yummyOut_S} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - $CORE_BUS_WIDTH*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_dataIn_S[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_validIn_S} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn1_dSo_yummy} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"

set x_pos [expr $x_pos - $CORE_BUS_WIDTH*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_dSo[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_dSo_valid} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_yummyOut_S} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - $CORE_BUS_WIDTH*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_dataIn_S[0]} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_validIn_S} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"
set x_pos [expr $x_pos - 1*$X_DELTA - $PORT_SEPARATION]
set_pin_physical_constraints {dyn2_dSo_yummy} -layers ${MODULE_PIN_LAYERS} -location "$x_pos $y_pos"

set_fp_pin_constraints -block_level -pin_spacing 1
set_fp_pin_constraints -block_level -use_physical_constraints on -bus_ordering lsb -keep_buses_together on
place_fp_pins -use_existing_routing -block_level

