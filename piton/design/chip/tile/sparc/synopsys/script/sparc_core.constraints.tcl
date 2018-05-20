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
create_clock -name gclk -period $CPU_CLOCK_PERIOD -waveform "0 [expr $CPU_CLOCK_PERIOD / 2.0]" gclk
#set_clock_uncertainty -setup 60 gclk
#set_clock_uncertainty -hold 60 gclk
#set_clock_transition 20 gclk
set_dont_touch_network gclk

# Set output load
set_load 4.0 [all_outputs]
if {$CONSTRAINTS_DRIVING_CELL != "" && $CONSTRAINTS_DRIVING_CELLLIB != ""} {
    set_driving_cell -lib_cell $CONSTRAINTS_DRIVING_CELL -library $CONSTRAINTS_DRIVING_CELLLIB -no_design_rule [all_inputs]
}

# auto_constraint_clk
# gclk

set_input_delay $RESET_INPUT_DELAY -clock gclk -max [get_ports reset_l]
set_input_delay [expr $RESET_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock gclk -min [get_ports reset_l]

# auto_constraint_input register

# auto_constraint_input combinational_3
# pcx_spc0_grant_px
# cpx_spc0_data_rdy_cx2
# cpx_spc0_data_cx2

# auto_constraint_input combinational_4
# rtap_srams_bist_command
# rtap_srams_bist_data


# auto_constraint_input combinational_2
# rtap_core_val
# rtap_core_threadid
# rtap_core_id
# rtap_core_data



# auto_constraint_output combinational_3
# srams_rtap_data
# spc_grst_l
# spc0_pcx_req_pq
# spc0_pcx_atom_pq
# spc0_pcx_csm_pa
# spc0_pcx_data_pa

# auto_constraint_output combinational_8
# core_rtap_data

# auto_constraint_port_list
    # input wire gclk,
    # input wire [4:0] pcx_spc0_grant_px,
    # input wire [144:0] cpx_spc0_data_cx2,
    # output wire spc_grst_l,
    # output wire [4:0] spc0_pcx_req_pq,
    # output wire spc0_pcx_atom_pq,
    # output wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] srams_rtap_data,
    # input wire  [`BIST_OP_WIDTH-1:0] rtap_srams_bist_command,
    # input wire  [`SRAM_WRAPPER_BUS_WIDTH-1:0] rtap_srams_bist_data,
    # output wire [`CORE_JTAG_BUS_WIDTH-1:0] core_rtap_data,
    # input wire rtap_core_val,
    # input wire [1:0] rtap_core_threadid,
    # input wire [`JTAG_CORE_ID_WIDTH-1:0]  rtap_core_id,
    # input wire [`CORE_JTAG_BUS_WIDTH-1:0] rtap_core_data,
    # output wire [`TLB_CSM] spc0_pcx_csm_pa,
    # output wire [123:0] spc0_pcx_data_pa

# auto_constraint_text_begin
## autoport resetlist
## autoport portlist
set_input_delay $COM_INPUT_DELAY_3 -clock gclk -max [get_ports pcx_spc0_grant_px]
set_input_delay [expr $COM_INPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock gclk -min [get_ports pcx_spc0_grant_px]
set_input_delay $COM_INPUT_DELAY_3 -clock gclk -max [get_ports cpx_spc0_data_cx2[*]]
set_input_delay [expr $COM_INPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock gclk -min [get_ports cpx_spc0_data_cx2[*]]
set_output_delay $COM_OUTPUT_DELAY_3 -clock gclk -max [get_ports spc_grst_l]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock gclk -min [get_ports spc_grst_l]
set_output_delay $COM_OUTPUT_DELAY_3 -clock gclk -max [get_ports spc0_pcx_req_pq[*]]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock gclk -min [get_ports spc0_pcx_req_pq[*]]
set_output_delay $COM_OUTPUT_DELAY_3 -clock gclk -max [get_ports spc0_pcx_atom_pq]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock gclk -min [get_ports spc0_pcx_atom_pq]
set_output_delay $COM_OUTPUT_DELAY_3 -clock gclk -max [get_ports srams_rtap_data[*]]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock gclk -min [get_ports srams_rtap_data[*]]
set_input_delay $COM_INPUT_DELAY_4 -clock gclk -max [get_ports rtap_srams_bist_command[*]]
set_input_delay [expr $COM_INPUT_DELAY_4 - $HOLD_DELAY_MARGIN] -clock gclk -min [get_ports rtap_srams_bist_command[*]]
set_input_delay $COM_INPUT_DELAY_4 -clock gclk -max [get_ports rtap_srams_bist_data[*]]
set_input_delay [expr $COM_INPUT_DELAY_4 - $HOLD_DELAY_MARGIN] -clock gclk -min [get_ports rtap_srams_bist_data[*]]
set_output_delay $COM_OUTPUT_DELAY_8 -clock gclk -max [get_ports core_rtap_data[*]]
set_output_delay [expr $COM_OUTPUT_DELAY_8 - $HOLD_DELAY_MARGIN] -clock gclk -min [get_ports core_rtap_data[*]]
set_input_delay $COM_INPUT_DELAY_2 -clock gclk -max [get_ports rtap_core_val]
set_input_delay [expr $COM_INPUT_DELAY_2 - $HOLD_DELAY_MARGIN] -clock gclk -min [get_ports rtap_core_val]
set_input_delay $COM_INPUT_DELAY_2 -clock gclk -max [get_ports rtap_core_threadid[*]]
set_input_delay [expr $COM_INPUT_DELAY_2 - $HOLD_DELAY_MARGIN] -clock gclk -min [get_ports rtap_core_threadid[*]]
set_input_delay $COM_INPUT_DELAY_2 -clock gclk -max [get_ports rtap_core_id[*]]
set_input_delay [expr $COM_INPUT_DELAY_2 - $HOLD_DELAY_MARGIN] -clock gclk -min [get_ports rtap_core_id[*]]
set_input_delay $COM_INPUT_DELAY_2 -clock gclk -max [get_ports rtap_core_data[*]]
set_input_delay [expr $COM_INPUT_DELAY_2 - $HOLD_DELAY_MARGIN] -clock gclk -min [get_ports rtap_core_data[*]]
set_output_delay $COM_OUTPUT_DELAY_3 -clock gclk -max [get_ports spc0_pcx_csm_pa[*]]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock gclk -min [get_ports spc0_pcx_csm_pa[*]]
set_output_delay $COM_OUTPUT_DELAY_3 -clock gclk -max [get_ports spc0_pcx_data_pa[*]]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock gclk -min [get_ports spc0_pcx_data_pa[*]]
# auto_constraint_text_end
