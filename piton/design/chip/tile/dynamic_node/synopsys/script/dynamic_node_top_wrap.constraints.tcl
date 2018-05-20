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

# Set output load
set_load 10.0 [all_outputs]
if {$CONSTRAINTS_DRIVING_CELL != "" && $CONSTRAINTS_DRIVING_CELLLIB != ""} {
    set_driving_cell -lib_cell $CONSTRAINTS_DRIVING_CELL -library $CONSTRAINTS_DRIVING_CELLLIB -no_design_rule [all_inputs]
}

# auto_constraint_clk
# clk

# auto_constraint_reset
# reset_in

# auto_constraint_input register
# dataIn_N
# dataIn_E
# dataIn_S
# dataIn_W
# dataIn_P
# yummyIn_N
# yummyIn_E
# yummyIn_S
# yummyIn_W
# yummyIn_P
# myLocX
# myLocY
# myChipID
# validIn_N
# validIn_E
# validIn_S
# validIn_W
# validIn_P

# auto_constraint_input combinational_3

# auto_constraint_output register
# dataOut_N
# dataOut_E
# dataOut_S
# dataOut_W
# dataOut_P
# yummyOut_N
# yummyOut_E
# yummyOut_S
# yummyOut_W
# yummyOut_P

# auto_constraint_output combinational_3
# thanksIn_P
# validOut_N
# validOut_E
# validOut_S
# validOut_W
# validOut_P


# auto_constraint_port_list
    # input clk,
    # input reset_in,
    # input [`DATA_WIDTH-1:0] dataIn_N,   // data inputs from neighboring tiles
    # input [`DATA_WIDTH-1:0] dataIn_E,
    # input [`DATA_WIDTH-1:0] dataIn_S,
    # input [`DATA_WIDTH-1:0] dataIn_W,
    # input [`DATA_WIDTH-1:0] dataIn_P,   // data input from processor
    # input validIn_N,        // valid signals from neighboring tiles
    # input validIn_E,
    # input validIn_S,
    # input validIn_W,
    # input validIn_P,        // valid signal from processor
    # input yummyIn_N,        // neighbor consumed output data
    # input yummyIn_E,
    # input yummyIn_S,
    # input yummyIn_W,
    # input yummyIn_P,        // processor consumed output data
    # input [`XY_WIDTH-1:0] myLocX,       // this tile's position
    # input [`XY_WIDTH-1:0] myLocY,
    # input [`CHIP_ID_WIDTH-1:0] myChipID,

    # output [`DATA_WIDTH-1:0] dataOut_N, // data outputs to neighbors
    # output [`DATA_WIDTH-1:0] dataOut_E,
    # output [`DATA_WIDTH-1:0] dataOut_S,
    # output [`DATA_WIDTH-1:0] dataOut_W,
    # output [`DATA_WIDTH-1:0] dataOut_P, // data output to processor
    
    # output validOut_N,      // valid outputs to neighbors
    # output validOut_E,
    # output validOut_S,
    # output validOut_W,
    # output validOut_P,      // valid output to processor
    # output yummyOut_N,      // yummy signal to neighbors' output buffers
    # output yummyOut_E,
    # output yummyOut_S,
    # output yummyOut_W,
    # output yummyOut_P,      // yummy signal to processor's output buffer
    # output thanksIn_P      // thanksIn to processor's space_avail


# auto_constraint_text_begin
## autoport resetlist
set_input_delay $RESET_INPUT_DELAY -clock clk -max [get_ports reset_in]
set_input_delay [expr $RESET_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports reset_in]
## autoport portlist
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports dataIn_N[*]]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dataIn_N[*]]
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports dataIn_E[*]]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dataIn_E[*]]
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports dataIn_S[*]]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dataIn_S[*]]
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports dataIn_W[*]]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dataIn_W[*]]
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports dataIn_P[*]]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dataIn_P[*]]
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports validIn_N]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports validIn_N]
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports validIn_E]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports validIn_E]
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports validIn_S]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports validIn_S]
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports validIn_W]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports validIn_W]
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports validIn_P]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports validIn_P]
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports yummyIn_N]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports yummyIn_N]
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports yummyIn_E]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports yummyIn_E]
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports yummyIn_S]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports yummyIn_S]
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports yummyIn_W]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports yummyIn_W]
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports yummyIn_P]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports yummyIn_P]
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports myLocX[*]]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports myLocX[*]]
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports myLocY[*]]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports myLocY[*]]
set_input_delay $REG_INPUT_DELAY -clock clk -max [get_ports myChipID[*]]
set_input_delay [expr $REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports myChipID[*]]
set_output_delay $REG_OUTPUT_DELAY -clock clk -max [get_ports dataOut_N[*]]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dataOut_N[*]]
set_output_delay $REG_OUTPUT_DELAY -clock clk -max [get_ports dataOut_E[*]]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dataOut_E[*]]
set_output_delay $REG_OUTPUT_DELAY -clock clk -max [get_ports dataOut_S[*]]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dataOut_S[*]]
set_output_delay $REG_OUTPUT_DELAY -clock clk -max [get_ports dataOut_W[*]]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dataOut_W[*]]
set_output_delay $REG_OUTPUT_DELAY -clock clk -max [get_ports dataOut_P[*]]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports dataOut_P[*]]
set_output_delay $COM_OUTPUT_DELAY_3 -clock clk -max [get_ports validOut_N]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports validOut_N]
set_output_delay $COM_OUTPUT_DELAY_3 -clock clk -max [get_ports validOut_E]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports validOut_E]
set_output_delay $COM_OUTPUT_DELAY_3 -clock clk -max [get_ports validOut_S]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports validOut_S]
set_output_delay $COM_OUTPUT_DELAY_3 -clock clk -max [get_ports validOut_W]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports validOut_W]
set_output_delay $COM_OUTPUT_DELAY_3 -clock clk -max [get_ports validOut_P]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports validOut_P]
set_output_delay $REG_OUTPUT_DELAY -clock clk -max [get_ports yummyOut_N]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports yummyOut_N]
set_output_delay $REG_OUTPUT_DELAY -clock clk -max [get_ports yummyOut_E]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports yummyOut_E]
set_output_delay $REG_OUTPUT_DELAY -clock clk -max [get_ports yummyOut_S]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports yummyOut_S]
set_output_delay $REG_OUTPUT_DELAY -clock clk -max [get_ports yummyOut_W]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports yummyOut_W]
set_output_delay $REG_OUTPUT_DELAY -clock clk -max [get_ports yummyOut_P]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports yummyOut_P]
set_output_delay $COM_OUTPUT_DELAY_3 -clock clk -max [get_ports thanksIn_P]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock clk -min [get_ports thanksIn_P]
# auto_constraint_text_end




