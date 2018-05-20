# Copyright (c) 2017 Princeton University
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

# TODO: THESE NEED TO BE UPDATED BEFORE FINAL RUN

# Generate clocks (all units in ps)
create_clock -name core_ref_clk -period $CPU_REF_CLOCK_PERIOD -waveform "0 [expr $CPU_REF_CLOCK_PERIOD / 2.0]" core_ref_clk
create_clock -name io_clk -period $IO_CLOCK_PERIOD -waveform "0 [expr $IO_CLOCK_PERIOD / 2.0]" io_clk
create_clock -name jtag_clk -period $JTAG_CLOCK_PERIOD -waveform "0 [expr $JTAG_CLOCK_PERIOD / 2.0]" jtag_clk
create_clock -name pll_clk -period $CPU_CLOCK_PERIOD [get_pins pll_top/clk_out]
create_clock -name core_clk -period $CPU_CLOCK_PERIOD [get_pins clock_mux/clk_muxed]

set_dont_touch_network io_clk
set_dont_touch_network jtag_clk
set_dont_touch_network core_clk

# Do not constrain
# inputs
# (async to all clocks)
    # rst_n 
    # pll_rst_n
    # jtag_rst_l
# (static inputs)
    # pll_range
    # clk_mux_sel
    # clk_en
    # pll_bypass
    # async_mux
    # oram_on
    # oram_traffic_gen
    # oram_dummy_gen
    # input [4:0] pll_rangea,
# (async output)
    # pll_lock

set_clock_groups -async -group {io_clk} -group {jtag_clk} -group {core_clk, pll_clk}

# JTAG pins
set_input_delay [expr $JTAG_CLOCK_PERIOD * 0.7] -clock jtag_clk -max [get_ports jtag_modesel]
set_input_delay [expr $JTAG_CLOCK_PERIOD * 0.5] -clock jtag_clk -min [get_ports jtag_modesel]
set_input_delay [expr $JTAG_CLOCK_PERIOD * 0.7] -clock jtag_clk -max [get_ports jtag_datain]
set_input_delay [expr $JTAG_CLOCK_PERIOD * 0.5] -clock jtag_clk -min [get_ports jtag_datain]
# trin: jtag outputs on negedge so impossible to have output delay > 50%
set_output_delay [expr $JTAG_CLOCK_PERIOD * 0.3] -clock jtag_clk -max [get_ports jtag_dataout]
set_output_delay [expr $JTAG_CLOCK_PERIOD * 0.2] -clock jtag_clk -min [get_ports jtag_dataout]

# Off chip interface
set_input_delay [expr $IO_CLOCK_PERIOD * 0.7] -clock io_clk -max [get_ports intf_chip_data[*]]
set_input_delay [expr $IO_CLOCK_PERIOD * 0.5] -clock io_clk -min [get_ports intf_chip_data[*]]
set_input_delay [expr $IO_CLOCK_PERIOD * 0.7] -clock io_clk -max [get_ports intf_chip_channel[*]]
set_input_delay [expr $IO_CLOCK_PERIOD * 0.5] -clock io_clk -min [get_ports intf_chip_channel[*]]
set_input_delay [expr $IO_CLOCK_PERIOD * 0.7] -clock io_clk -max [get_ports chip_intf_credit_back[*]]
set_input_delay [expr $IO_CLOCK_PERIOD * 0.5] -clock io_clk -min [get_ports chip_intf_credit_back[*]]
set_output_delay [expr $IO_CLOCK_PERIOD * 0.7] -clock io_clk -max [get_ports intf_chip_credit_back[*]]
set_output_delay [expr $IO_CLOCK_PERIOD * 0.5] -clock io_clk -min [get_ports intf_chip_credit_back[*]]
set_output_delay [expr $IO_CLOCK_PERIOD * 0.7] -clock io_clk -max [get_ports chip_intf_data[*]]
set_output_delay [expr $IO_CLOCK_PERIOD * 0.5] -clock io_clk -min [get_ports chip_intf_data[*]]
set_output_delay [expr $IO_CLOCK_PERIOD * 0.7] -clock io_clk -max [get_ports chip_intf_channel[*]]
set_output_delay [expr $IO_CLOCK_PERIOD * 0.5] -clock io_clk -min [get_ports chip_intf_channel[*]]

# 5pF on the pads
set_load 5000.0 [all_outputs]
