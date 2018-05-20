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

# Constraints specific to this module

# Generate clocks (all units in ps)
create_clock -name clk -period $CPU_CLOCK_PERIOD -waveform "0 [expr $CPU_CLOCK_PERIOD / 2.0]" clk
#set_clock_uncertainty -setup 60 clk
#set_clock_uncertainty -hold 60 clk
#set_clock_transition 20 clk
set_dont_touch_network clk

# Set input and output delay
# set_input_delay 150 -clock clk -max [all_inputs]
# set_input_delay 100 -clock clk -min [all_inputs]
# set_output_delay 200 -clock clk -max [all_outputs]
# set_output_delay 150 -clock clk -min [all_outputs]

# // Set output load
# // load for tile output is high because of wirings
set_load 20.0 [all_outputs]
if {$CONSTRAINTS_DRIVING_CELL != "" && $CONSTRAINTS_DRIVING_CELLLIB != ""} {
    set_driving_cell -lib_cell $CONSTRAINTS_DRIVING_CELL -library $CONSTRAINTS_DRIVING_CELLLIB -no_design_rule [all_inputs]
}

# auto_constraint_clk
# clk

# auto_constraint_input unconstrained
# default_chipid
# default_coreid_x
# default_coreid_y
# flat_tileid

# auto_constraint_input register
# rst_n
# clk_en
# jtag_tiles_ucb_val
# jtag_tiles_ucb_data

# auto_constraint_input combinational_7
# dyn0_dataIn_N
# dyn0_dataIn_E
# dyn0_dNo_yummy
# dyn0_dEo_yummy
# dyn1_dataIn_N
# dyn1_dataIn_E
# dyn1_dNo_yummy
# dyn1_dEo_yummy
# dyn2_dataIn_N
# dyn2_dataIn_E
# dyn2_dNo_yummy
# dyn2_dEo_yummy
# dyn0_validIn_N
# dyn0_validIn_E
# dyn1_validIn_N
# dyn1_validIn_E
# dyn2_validIn_N
# dyn2_validIn_E

# // inputs from the west nocs and south nocs are allowed to take longer
# auto_constraint_input combinational_5
# dyn0_dataIn_W
# dyn0_dWo_yummy
# dyn1_dataIn_W
# dyn1_dWo_yummy
# dyn2_dataIn_W
# dyn2_dWo_yummy
# dyn0_validIn_W
# dyn1_validIn_W
# dyn2_validIn_W
# dyn0_dataIn_S
# dyn0_dSo_yummy
# dyn1_dataIn_S
# dyn1_dSo_yummy
# dyn2_dataIn_S
# dyn2_dSo_yummy
# dyn0_validIn_S
# dyn1_validIn_S
# dyn2_validIn_S


# auto_constraint_output combinational_5
# dyn0_dWo
# dyn0_dSo
# dyn0_yummyOut_W
# dyn0_yummyOut_S
# dyn1_dWo
# dyn1_dSo
# dyn1_yummyOut_W
# dyn1_yummyOut_S
# dyn2_dWo
# dyn2_dSo
# dyn2_yummyOut_W
# dyn2_yummyOut_S
# tile_jtag_ucb_val
# tile_jtag_ucb_data

# // output to E and N shouldn't take too long
# auto_constraint_output combinational_3
# dyn0_dEo
# dyn0_yummyOut_E
# dyn1_dEo
# dyn1_yummyOut_E
# dyn2_dEo
# dyn2_yummyOut_E
# dyn0_dNo
# dyn0_yummyOut_N
# dyn1_dNo
# dyn1_yummyOut_N
# dyn2_dNo
# dyn2_yummyOut_N

# // valid signals takes a bit longer to output 
# auto_constraint_output combinational_6
# dyn0_dWo_valid
# dyn0_dSo_valid
# dyn1_dWo_valid
# dyn1_dSo_valid
# dyn2_dWo_valid
# dyn2_dSo_valid

# auto_constraint_output combinational_4
# dyn0_dEo_valid
# dyn1_dEo_valid
# dyn2_dEo_valid
# dyn0_dNo_valid
# dyn1_dNo_valid
# dyn2_dNo_valid


# auto_constraint_port_list
#    input                               clk,
#    input                               rst_n,    // trin: assumed to be synchronous
#    input                               clk_en,   // trin: assumed to be asynchronous
#    input wire [`NOC_CHIPID_WIDTH-1:0]  default_chipid,
#    input wire [`NOC_X_WIDTH-1:0]       default_coreid_x,
#    input wire [`NOC_Y_WIDTH-1:0]       default_coreid_y,
#    input wire [`JTAG_FLATID_WIDTH-1:0] flat_tileid,
#    input                               jtag_tiles_ucb_val,
#    input [`UCB_BUS_WIDTH-1:0]          jtag_tiles_ucb_data,
#    output                              tile_jtag_ucb_val,
#    output [`UCB_BUS_WIDTH-1:0]         tile_jtag_ucb_data,
#    input [`NOC_DATA_WIDTH-1:0]         dyn0_dataIn_N,
#    input [`NOC_DATA_WIDTH-1:0]         dyn0_dataIn_E,
#    input [`NOC_DATA_WIDTH-1:0]         dyn0_dataIn_W,
#    input [`NOC_DATA_WIDTH-1:0]         dyn0_dataIn_S,
#    input                               dyn0_validIn_N,
#    input                               dyn0_validIn_E,
#    input                               dyn0_validIn_W,
#    input                               dyn0_validIn_S,
#    input                               dyn0_dNo_yummy,
#    input                               dyn0_dEo_yummy,
#    input                               dyn0_dWo_yummy,
#    input                               dyn0_dSo_yummy,
#    input [`NOC_DATA_WIDTH-1:0]         dyn1_dataIn_N,
#    input [`NOC_DATA_WIDTH-1:0]         dyn1_dataIn_E,
#    input [`NOC_DATA_WIDTH-1:0]         dyn1_dataIn_W,
#    input [`NOC_DATA_WIDTH-1:0]         dyn1_dataIn_S,
#    input                               dyn1_validIn_N,
#    input                               dyn1_validIn_E,
#    input                               dyn1_validIn_W,
#    input                               dyn1_validIn_S,
#    input                               dyn1_dNo_yummy,
#    input                               dyn1_dEo_yummy,
#    input                               dyn1_dWo_yummy,
#    input                               dyn1_dSo_yummy,
#    input [`NOC_DATA_WIDTH-1:0]         dyn2_dataIn_N,
#    input [`NOC_DATA_WIDTH-1:0]         dyn2_dataIn_E,
#    input [`NOC_DATA_WIDTH-1:0]         dyn2_dataIn_W,
#    input [`NOC_DATA_WIDTH-1:0]         dyn2_dataIn_S,
#    input                               dyn2_validIn_N,
#    input                               dyn2_validIn_E,
#    input                               dyn2_validIn_W,
#    input                               dyn2_validIn_S,
#    input                               dyn2_dNo_yummy,
#    input                               dyn2_dEo_yummy,
#    input                               dyn2_dWo_yummy,
#    input                               dyn2_dSo_yummy,
#    output [`NOC_DATA_WIDTH-1:0]        dyn0_dNo,
#    output [`NOC_DATA_WIDTH-1:0]        dyn0_dEo,
#    output [`NOC_DATA_WIDTH-1:0]        dyn0_dWo,
#    output [`NOC_DATA_WIDTH-1:0]        dyn0_dSo,
#    output                              dyn0_dNo_valid,
#    output                              dyn0_dEo_valid,
#    output                              dyn0_dWo_valid,
#    output                              dyn0_dSo_valid,
#    output                              dyn0_yummyOut_N,
#    output                              dyn0_yummyOut_E,
#    output                              dyn0_yummyOut_W,
#    output                              dyn0_yummyOut_S,
#    output [`NOC_DATA_WIDTH-1:0]        dyn1_dNo,
#    output [`NOC_DATA_WIDTH-1:0]        dyn1_dEo,
#    output [`NOC_DATA_WIDTH-1:0]        dyn1_dWo,
#    output [`NOC_DATA_WIDTH-1:0]        dyn1_dSo,
#    output                              dyn1_dNo_valid,
#    output                              dyn1_dEo_valid,
#    output                              dyn1_dWo_valid,
#    output                              dyn1_dSo_valid,
#    output                              dyn1_yummyOut_N,
#    output                              dyn1_yummyOut_E,
#    output                              dyn1_yummyOut_W,
#    output                              dyn1_yummyOut_S,
#    output [`NOC_DATA_WIDTH-1:0]        dyn2_dNo,
#    output [`NOC_DATA_WIDTH-1:0]        dyn2_dEo,
#    output [`NOC_DATA_WIDTH-1:0]        dyn2_dWo,
#    output [`NOC_DATA_WIDTH-1:0]        dyn2_dSo,
#    output                              dyn2_dNo_valid,
#    output                              dyn2_dEo_valid,
#    output                              dyn2_dWo_valid,
#    output                              dyn2_dSo_valid,
#    output                              dyn2_yummyOut_N,
#    output                              dyn2_yummyOut_E,
#    output                              dyn2_yummyOut_W,
#    output                              dyn2_yummyOut_S


# auto_constraint_text_begin
## autoport resetlist
## autoport portlist
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports rst_n]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports rst_n]
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports clk_en]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports clk_en]
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports jtag_tiles_ucb_val]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports jtag_tiles_ucb_val]
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports jtag_tiles_ucb_data[*]]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports jtag_tiles_ucb_data[*]]
set_output_delay $COM_OUTPUT_DELAY_5 -clock clk -max [get_ports tile_jtag_ucb_val]
set_output_delay [expr $COM_OUTPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports tile_jtag_ucb_val]
set_output_delay $COM_OUTPUT_DELAY_5 -clock clk -max [get_ports tile_jtag_ucb_data[*]]
set_output_delay [expr $COM_OUTPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports tile_jtag_ucb_data[*]]
set_input_delay $COM_INPUT_DELAY_7 -clock clk -max [get_ports dyn0_dataIn_N[*]]
set_input_delay [expr $COM_INPUT_DELAY_7 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_dataIn_N[*]]
set_input_delay $COM_INPUT_DELAY_7 -clock clk -max [get_ports dyn0_dataIn_E[*]]
set_input_delay [expr $COM_INPUT_DELAY_7 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_dataIn_E[*]]
set_input_delay $COM_INPUT_DELAY_5 -clock clk -max [get_ports dyn0_dataIn_W[*]]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_dataIn_W[*]]
set_input_delay $COM_INPUT_DELAY_5 -clock clk -max [get_ports dyn0_dataIn_S[*]]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_dataIn_S[*]]
set_input_delay $COM_INPUT_DELAY_7 -clock clk -max [get_ports dyn0_validIn_N]
set_input_delay [expr $COM_INPUT_DELAY_7 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_validIn_N]
set_input_delay $COM_INPUT_DELAY_7 -clock clk -max [get_ports dyn0_validIn_E]
set_input_delay [expr $COM_INPUT_DELAY_7 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_validIn_E]
set_input_delay $COM_INPUT_DELAY_5 -clock clk -max [get_ports dyn0_validIn_W]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_validIn_W]
set_input_delay $COM_INPUT_DELAY_5 -clock clk -max [get_ports dyn0_validIn_S]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_validIn_S]
set_input_delay $COM_INPUT_DELAY_7 -clock clk -max [get_ports dyn0_dNo_yummy]
set_input_delay [expr $COM_INPUT_DELAY_7 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_dNo_yummy]
set_input_delay $COM_INPUT_DELAY_7 -clock clk -max [get_ports dyn0_dEo_yummy]
set_input_delay [expr $COM_INPUT_DELAY_7 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_dEo_yummy]
set_input_delay $COM_INPUT_DELAY_5 -clock clk -max [get_ports dyn0_dWo_yummy]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_dWo_yummy]
set_input_delay $COM_INPUT_DELAY_5 -clock clk -max [get_ports dyn0_dSo_yummy]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_dSo_yummy]
set_input_delay $COM_INPUT_DELAY_7 -clock clk -max [get_ports dyn1_dataIn_N[*]]
set_input_delay [expr $COM_INPUT_DELAY_7 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_dataIn_N[*]]
set_input_delay $COM_INPUT_DELAY_7 -clock clk -max [get_ports dyn1_dataIn_E[*]]
set_input_delay [expr $COM_INPUT_DELAY_7 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_dataIn_E[*]]
set_input_delay $COM_INPUT_DELAY_5 -clock clk -max [get_ports dyn1_dataIn_W[*]]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_dataIn_W[*]]
set_input_delay $COM_INPUT_DELAY_5 -clock clk -max [get_ports dyn1_dataIn_S[*]]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_dataIn_S[*]]
set_input_delay $COM_INPUT_DELAY_7 -clock clk -max [get_ports dyn1_validIn_N]
set_input_delay [expr $COM_INPUT_DELAY_7 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_validIn_N]
set_input_delay $COM_INPUT_DELAY_7 -clock clk -max [get_ports dyn1_validIn_E]
set_input_delay [expr $COM_INPUT_DELAY_7 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_validIn_E]
set_input_delay $COM_INPUT_DELAY_5 -clock clk -max [get_ports dyn1_validIn_W]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_validIn_W]
set_input_delay $COM_INPUT_DELAY_5 -clock clk -max [get_ports dyn1_validIn_S]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_validIn_S]
set_input_delay $COM_INPUT_DELAY_7 -clock clk -max [get_ports dyn1_dNo_yummy]
set_input_delay [expr $COM_INPUT_DELAY_7 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_dNo_yummy]
set_input_delay $COM_INPUT_DELAY_7 -clock clk -max [get_ports dyn1_dEo_yummy]
set_input_delay [expr $COM_INPUT_DELAY_7 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_dEo_yummy]
set_input_delay $COM_INPUT_DELAY_5 -clock clk -max [get_ports dyn1_dWo_yummy]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_dWo_yummy]
set_input_delay $COM_INPUT_DELAY_5 -clock clk -max [get_ports dyn1_dSo_yummy]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_dSo_yummy]
set_input_delay $COM_INPUT_DELAY_7 -clock clk -max [get_ports dyn2_dataIn_N[*]]
set_input_delay [expr $COM_INPUT_DELAY_7 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_dataIn_N[*]]
set_input_delay $COM_INPUT_DELAY_7 -clock clk -max [get_ports dyn2_dataIn_E[*]]
set_input_delay [expr $COM_INPUT_DELAY_7 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_dataIn_E[*]]
set_input_delay $COM_INPUT_DELAY_5 -clock clk -max [get_ports dyn2_dataIn_W[*]]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_dataIn_W[*]]
set_input_delay $COM_INPUT_DELAY_5 -clock clk -max [get_ports dyn2_dataIn_S[*]]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_dataIn_S[*]]
set_input_delay $COM_INPUT_DELAY_7 -clock clk -max [get_ports dyn2_validIn_N]
set_input_delay [expr $COM_INPUT_DELAY_7 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_validIn_N]
set_input_delay $COM_INPUT_DELAY_7 -clock clk -max [get_ports dyn2_validIn_E]
set_input_delay [expr $COM_INPUT_DELAY_7 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_validIn_E]
set_input_delay $COM_INPUT_DELAY_5 -clock clk -max [get_ports dyn2_validIn_W]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_validIn_W]
set_input_delay $COM_INPUT_DELAY_5 -clock clk -max [get_ports dyn2_validIn_S]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_validIn_S]
set_input_delay $COM_INPUT_DELAY_7 -clock clk -max [get_ports dyn2_dNo_yummy]
set_input_delay [expr $COM_INPUT_DELAY_7 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_dNo_yummy]
set_input_delay $COM_INPUT_DELAY_7 -clock clk -max [get_ports dyn2_dEo_yummy]
set_input_delay [expr $COM_INPUT_DELAY_7 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_dEo_yummy]
set_input_delay $COM_INPUT_DELAY_5 -clock clk -max [get_ports dyn2_dWo_yummy]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_dWo_yummy]
set_input_delay $COM_INPUT_DELAY_5 -clock clk -max [get_ports dyn2_dSo_yummy]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_dSo_yummy]
set_output_delay $COM_OUTPUT_DELAY_3 -clock clk -max [get_ports dyn0_dNo[*]]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_dNo[*]]
set_output_delay $COM_OUTPUT_DELAY_3 -clock clk -max [get_ports dyn0_dEo[*]]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_dEo[*]]
set_output_delay $COM_OUTPUT_DELAY_5 -clock clk -max [get_ports dyn0_dWo[*]]
set_output_delay [expr $COM_OUTPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_dWo[*]]
set_output_delay $COM_OUTPUT_DELAY_5 -clock clk -max [get_ports dyn0_dSo[*]]
set_output_delay [expr $COM_OUTPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_dSo[*]]
set_output_delay $COM_OUTPUT_DELAY_4 -clock clk -max [get_ports dyn0_dNo_valid]
set_output_delay [expr $COM_OUTPUT_DELAY_4 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_dNo_valid]
set_output_delay $COM_OUTPUT_DELAY_4 -clock clk -max [get_ports dyn0_dEo_valid]
set_output_delay [expr $COM_OUTPUT_DELAY_4 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_dEo_valid]
set_output_delay $COM_OUTPUT_DELAY_6 -clock clk -max [get_ports dyn0_dWo_valid]
set_output_delay [expr $COM_OUTPUT_DELAY_6 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_dWo_valid]
set_output_delay $COM_OUTPUT_DELAY_6 -clock clk -max [get_ports dyn0_dSo_valid]
set_output_delay [expr $COM_OUTPUT_DELAY_6 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_dSo_valid]
set_output_delay $COM_OUTPUT_DELAY_3 -clock clk -max [get_ports dyn0_yummyOut_N]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_yummyOut_N]
set_output_delay $COM_OUTPUT_DELAY_3 -clock clk -max [get_ports dyn0_yummyOut_E]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_yummyOut_E]
set_output_delay $COM_OUTPUT_DELAY_5 -clock clk -max [get_ports dyn0_yummyOut_W]
set_output_delay [expr $COM_OUTPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_yummyOut_W]
set_output_delay $COM_OUTPUT_DELAY_5 -clock clk -max [get_ports dyn0_yummyOut_S]
set_output_delay [expr $COM_OUTPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn0_yummyOut_S]
set_output_delay $COM_OUTPUT_DELAY_3 -clock clk -max [get_ports dyn1_dNo[*]]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_dNo[*]]
set_output_delay $COM_OUTPUT_DELAY_3 -clock clk -max [get_ports dyn1_dEo[*]]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_dEo[*]]
set_output_delay $COM_OUTPUT_DELAY_5 -clock clk -max [get_ports dyn1_dWo[*]]
set_output_delay [expr $COM_OUTPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_dWo[*]]
set_output_delay $COM_OUTPUT_DELAY_5 -clock clk -max [get_ports dyn1_dSo[*]]
set_output_delay [expr $COM_OUTPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_dSo[*]]
set_output_delay $COM_OUTPUT_DELAY_4 -clock clk -max [get_ports dyn1_dNo_valid]
set_output_delay [expr $COM_OUTPUT_DELAY_4 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_dNo_valid]
set_output_delay $COM_OUTPUT_DELAY_4 -clock clk -max [get_ports dyn1_dEo_valid]
set_output_delay [expr $COM_OUTPUT_DELAY_4 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_dEo_valid]
set_output_delay $COM_OUTPUT_DELAY_6 -clock clk -max [get_ports dyn1_dWo_valid]
set_output_delay [expr $COM_OUTPUT_DELAY_6 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_dWo_valid]
set_output_delay $COM_OUTPUT_DELAY_6 -clock clk -max [get_ports dyn1_dSo_valid]
set_output_delay [expr $COM_OUTPUT_DELAY_6 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_dSo_valid]
set_output_delay $COM_OUTPUT_DELAY_3 -clock clk -max [get_ports dyn1_yummyOut_N]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_yummyOut_N]
set_output_delay $COM_OUTPUT_DELAY_3 -clock clk -max [get_ports dyn1_yummyOut_E]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_yummyOut_E]
set_output_delay $COM_OUTPUT_DELAY_5 -clock clk -max [get_ports dyn1_yummyOut_W]
set_output_delay [expr $COM_OUTPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_yummyOut_W]
set_output_delay $COM_OUTPUT_DELAY_5 -clock clk -max [get_ports dyn1_yummyOut_S]
set_output_delay [expr $COM_OUTPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn1_yummyOut_S]
set_output_delay $COM_OUTPUT_DELAY_3 -clock clk -max [get_ports dyn2_dNo[*]]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_dNo[*]]
set_output_delay $COM_OUTPUT_DELAY_3 -clock clk -max [get_ports dyn2_dEo[*]]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_dEo[*]]
set_output_delay $COM_OUTPUT_DELAY_5 -clock clk -max [get_ports dyn2_dWo[*]]
set_output_delay [expr $COM_OUTPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_dWo[*]]
set_output_delay $COM_OUTPUT_DELAY_5 -clock clk -max [get_ports dyn2_dSo[*]]
set_output_delay [expr $COM_OUTPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_dSo[*]]
set_output_delay $COM_OUTPUT_DELAY_4 -clock clk -max [get_ports dyn2_dNo_valid]
set_output_delay [expr $COM_OUTPUT_DELAY_4 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_dNo_valid]
set_output_delay $COM_OUTPUT_DELAY_4 -clock clk -max [get_ports dyn2_dEo_valid]
set_output_delay [expr $COM_OUTPUT_DELAY_4 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_dEo_valid]
set_output_delay $COM_OUTPUT_DELAY_6 -clock clk -max [get_ports dyn2_dWo_valid]
set_output_delay [expr $COM_OUTPUT_DELAY_6 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_dWo_valid]
set_output_delay $COM_OUTPUT_DELAY_6 -clock clk -max [get_ports dyn2_dSo_valid]
set_output_delay [expr $COM_OUTPUT_DELAY_6 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_dSo_valid]
set_output_delay $COM_OUTPUT_DELAY_3 -clock clk -max [get_ports dyn2_yummyOut_N]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_yummyOut_N]
set_output_delay $COM_OUTPUT_DELAY_3 -clock clk -max [get_ports dyn2_yummyOut_E]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_yummyOut_E]
set_output_delay $COM_OUTPUT_DELAY_5 -clock clk -max [get_ports dyn2_yummyOut_W]
set_output_delay [expr $COM_OUTPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_yummyOut_W]
set_output_delay $COM_OUTPUT_DELAY_5 -clock clk -max [get_ports dyn2_yummyOut_S]
set_output_delay [expr $COM_OUTPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dyn2_yummyOut_S]
# auto_constraint_text_end
