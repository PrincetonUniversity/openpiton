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

set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 8 [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN div-1 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.CONFIG.SPI_OPCODE 8'h6B [current_design]
set_property CONFIG_MODE SPIx8 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pulldown [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]
# Clock signals
set_property PACKAGE_PIN CA39 [get_ports chipset_clk_osc_p]
set_property PACKAGE_PIN CA40 [get_ports chipset_clk_osc_n]
set_property IOSTANDARD LVDS [get_ports chipset_clk_osc_p]
set_property IOSTANDARD LVDS [get_ports chipset_clk_osc_n]
#create_clock -period 5.000  [get_ports chipset_clk_osc_p]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets chipset/clk_mmcm/inst/clkin1_ibufds/O]

# ref clock for MIG
set_property IOSTANDARD LVDS [get_ports mc_clk_p]
set_property PACKAGE_PIN Y52 [get_ports mc_clk_p]
set_property PACKAGE_PIN Y53 [get_ports mc_clk_n]
set_property IOSTANDARD LVDS [get_ports mc_clk_n]
# Reset
#set_property PACKAGE_PIN AF14 [get_ports sys_rst_n]
#set_property IOSTANDARD LVCMOS18 [get_ports sys_rst_n]

# False paths
set_false_path -to [get_cells -hierarchical *afifo_ui_rst_r*]
set_false_path -to [get_cells -hierarchical *ui_clk_sync_rst_r*]
set_false_path -to [get_cells -hierarchical *ui_clk_syn_rst_delayed*]
set_false_path -to [get_cells -hierarchical *init_calib_complete_f*]
set_false_path -to [get_cells -hierarchical *chipset_rst_n*]
#set_false_path -from [get_clocks chipset_clk_clk_mmcm] -to [get_clocks net_axi_clk_clk_mmcm]

#set_clock_groups -name sync_gr1 -logically_exclusive -group chipset_clk_clk_mmcm -group [get_clocks -include_generated_clocks mc_sys_clk_clk_mmcm]


set_property IOSTANDARD LVCMOS18 [get_ports tck_i]
set_property PACKAGE_PIN H4 [get_ports tck_i]
set_property IOSTANDARD LVCMOS18 [get_ports td_i]
set_property PACKAGE_PIN L4 [get_ports td_i]
set_property IOSTANDARD LVCMOS18 [get_ports td_o]
set_property PACKAGE_PIN L2 [get_ports td_o]
set_property IOSTANDARD LVCMOS18 [get_ports tms_i]
set_property PACKAGE_PIN M4 [get_ports tms_i]
set_property IOSTANDARD LVCMOS18 [get_ports trst_ni]
set_property PACKAGE_PIN M6 [get_ports trst_ni]
## Add some additional constraints for JTAG signals, set to 10MHz to be on the safe side
create_clock -period 100.000 -name tck_i -waveform {0.000 50.000} [get_ports tck_i]

set_input_delay  -clock tck_i -clock_fall 5 [get_ports td_i    ]
set_input_delay  -clock tck_i -clock_fall 5 [get_ports tms_i   ]
set_output_delay -clock tck_i             5 [get_ports td_o    ]
set_false_path   -from                      [get_ports trst_ni ]

# constrain clock domain crossing
set_max_delay -datapath_only -from [get_clocks -include_generated_clocks chipset_clk_clk_mmcm] -to [get_clocks tck_i] 8.0
set_max_delay -datapath_only -from [get_clocks tck_i] -to [get_clocks -include_generated_clocks chipset_clk_clk_mmcm] 8.0

# accept sub-optimal placement
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets tck_i_IBUF_inst/O]

# UART
#IO_L11N_T1_SRCC_35 Sch=uart_rxd_out
set_property IOSTANDARD LVCMOS18 [get_ports uart_tx]
set_property PACKAGE_PIN F14 [get_ports uart_tx]
set_property IOSTANDARD LVCMOS18 [get_ports uart_rx]
set_property PACKAGE_PIN G14 [get_ports uart_rx]

# Switches
#set_property PACKAGE_PIN AV30 [get_ports sw[0]]
#set_property IOSTANDARD LVCMOS18 [get_ports sw[0]]
#set_property PACKAGE_PIN AY33 [get_ports sw[1]]
#set_property IOSTANDARD LVCMOS18 [get_ports sw[1]]
#set_property PACKAGE_PIN BA31 [get_ports sw[2]]
#set_property IOSTANDARD LVCMOS18 [get_ports sw[2]]
#set_property PACKAGE_PIN BA32 [get_ports sw[3]]
#set_property IOSTANDARD LVCMOS18 [get_ports sw[3]]
#set_property PACKAGE_PIN AW30 [get_ports sw[4]]
#set_property IOSTANDARD LVCMOS18 [get_ports sw[4]]
#set_property PACKAGE_PIN AY30 [get_ports sw[5]]
#set_property IOSTANDARD LVCMOS18 [get_ports sw[5]]
#set_property PACKAGE_PIN BA30 [get_ports sw[6]]
#set_property IOSTANDARD LVCMOS18 [get_ports sw[6]]
#set_property PACKAGE_PIN BB31 [get_ports sw[7]]
#set_property IOSTANDARD LVCMOS18 [get_ports sw[7]]

# SD
set_property PACKAGE_PIN C14 [get_ports sd_clk_out]
set_property PACKAGE_PIN D13 [get_ports sd_cmd]
set_property PACKAGE_PIN A15 [get_ports {sd_dat[0]}]
set_property PACKAGE_PIN C15 [get_ports {sd_dat[1]}]
set_property PACKAGE_PIN C16 [get_ports {sd_dat[2]}]
set_property PACKAGE_PIN A14 [get_ports {sd_dat[3]}]
set_property PACKAGE_PIN B12 [get_ports sd_cd]

set_property IOSTANDARD LVCMOS18 [get_ports sd_clk_out]
set_property IOSTANDARD LVCMOS18 [get_ports sd_cmd]
set_property IOSTANDARD LVCMOS18 [get_ports {sd_dat[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {sd_dat[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {sd_dat[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {sd_dat[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports sd_cd]

#set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN AN30 DRIVE 16 SLEW FAST} [get_ports sd_clk_out]
#set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN AP30} [get_ports sd_cmd]
#set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN AR30} [get_ports {sd_dat[0]}]
#set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN AU31} [get_ports {sd_dat[1]}]
#set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN AV31} [get_ports {sd_dat[2]}]
#set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN AT30} [get_ports {sd_dat[3]}]
## set_property IOSTANDARD LVCMOS18 [get_ports sd_cd]
## set_property PACKAGE_PIN AP32 [get_ports sd_cd]
#
##set_property PACKAGE_PIN AV30 [get_ports uart_lb_sw]
##set_property IOSTANDARD LVCMOS18 [get_ports uart_lb_sw]

## LEDs

set_property PACKAGE_PIN AH14 [get_ports {leds[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[0]}]
set_property PACKAGE_PIN AH13 [get_ports {leds[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[1]}]
set_property PACKAGE_PIN AH16 [get_ports {leds[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[2]}]
set_property PACKAGE_PIN AH15 [get_ports {leds[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[3]}]
set_property PACKAGE_PIN AG14 [get_ports {leds[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[4]}]
set_property PACKAGE_PIN AC15 [get_ports {leds[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[5]}]
set_property PACKAGE_PIN AA17 [get_ports {leds[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[6]}]
set_property PACKAGE_PIN AA16 [get_ports {leds[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[7]}]

#############################################
# SD Card Constraints for 25MHz
#############################################
###################################707
#create_generated_clock -name sd_fast_clk -source [get_pins chipset/clk_mmcm/sd_sys_clk] -divide_by 2 [get_pins chipset/chipset_impl/piton_sd_top/sdc_controller/clock_divider0/fast_clk_reg/Q]
#create_generated_clock -name sd_slow_clk -source [get_pins chipset/clk_mmcm/sd_sys_clk] -divide_by 200 [get_pins chipset/chipset_impl/piton_sd_top/sdc_controller/clock_divider0/slow_clk_reg/Q]
#create_generated_clock -name sd_clk_out -source [get_pins chipset/sd_clk_oddr/C] -divide_by 1 -add -master_clock sd_fast_clk [get_ports sd_clk_out]
#create_generated_clock -name sd_clk_out_1 -source [get_pins chipset/sd_clk_oddr/C] -divide_by 1 -add -master_clock sd_slow_clk [get_ports sd_clk_out]
#
## compensate for board trace uncertainty
#set_clock_uncertainty 0.500 [get_clocks sd_clk_out]
#set_clock_uncertainty 0.500 [get_clocks sd_clk_out_1]
#
##################
## FPGA out / card in
## data is aligned with clock (source synchronous)
#
## hold fast (spec requires minimum 2ns), note that data is launched on falling edge, so 0.0 is ok here
#set_output_delay -clock [get_clocks sd_clk_out] -min -add_delay -6.000 [get_ports {sd_dat[*]}]
#set_output_delay -clock [get_clocks sd_clk_out] -min -add_delay -6.000 [get_ports sd_cmd]
#
## setup fast (spec requires minimum 6ns)
#set_output_delay -clock [get_clocks sd_clk_out] -max -add_delay 8.000 [get_ports {sd_dat[*]}]
#set_output_delay -clock [get_clocks sd_clk_out] -max -add_delay 8.000 [get_ports sd_cmd]
#
## hold slow (spec requires minimum 5ns), note that data is launched on falling edge, so 0.0 is ok here
#set_output_delay -clock [get_clocks sd_clk_out_1] -min -add_delay -8.000 [get_ports {sd_dat[*]}]
#set_output_delay -clock [get_clocks sd_clk_out_1] -min -add_delay -8.000 [get_ports sd_cmd]
#
## setup slow (spec requires minimum 5ns)
#set_output_delay -clock [get_clocks sd_clk_out_1] -max -add_delay 8.000 [get_ports {sd_dat[*]}]
#set_output_delay -clock [get_clocks sd_clk_out_1] -max -add_delay 8.000 [get_ports sd_cmd]
#
##################
## card out / FPGA in
## data is launched on negative clock edge here
#
## propdelay fast
#set_input_delay -clock [get_clocks sd_clk_out] -clock_fall -max -add_delay 14.000 [get_ports {sd_dat[*]}]
#set_input_delay -clock [get_clocks sd_clk_out] -clock_fall -max -add_delay 14.000 [get_ports sd_cmd]
#
## contamination delay fast
#set_input_delay -clock [get_clocks sd_clk_out] -clock_fall -min -add_delay -14.000 [get_ports {sd_dat[*]}]
#set_input_delay -clock [get_clocks sd_clk_out] -clock_fall -min -add_delay -14.000 [get_ports sd_cmd]
#
## propdelay slow
#set_input_delay -clock [get_clocks sd_clk_out_1] -clock_fall -max -add_delay 14.000 [get_ports {sd_dat[*]}]
#set_input_delay -clock [get_clocks sd_clk_out_1] -clock_fall -max -add_delay 14.000 [get_ports sd_cmd]
#
## contamination  slow
#set_input_delay -clock [get_clocks sd_clk_out_1] -clock_fall -min -add_delay -14.000 [get_ports {sd_dat[*]}]
#set_input_delay -clock [get_clocks sd_clk_out_1] -clock_fall -min -add_delay -14.000 [get_ports sd_cmd]
#
##################
## clock groups
#
#set_clock_groups -physically_exclusive -group [get_clocks -include_generated_clocks sd_clk_out] -group [get_clocks -include_generated_clocks sd_clk_out_1]
#set_clock_groups -logically_exclusive -group [get_clocks -include_generated_clocks sd_fast_clk] -group [get_clocks -include_generated_clocks sd_slow_clk]
#set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks chipset_clk_clk_mmcm] -group [get_clocks -filter { NAME =~  "*sd*" }]




###################################707








###############################vu9p
create_generated_clock -name sd_fast_clk -source [get_pins chipset/clk_mmcm/sd_sys_clk] -divide_by 2 [get_pins chipset/chipset_impl/piton_sd_top/sdc_controller/clock_divider0/fast_clk_reg/Q]
create_generated_clock -name sd_slow_clk -source [get_pins chipset/clk_mmcm/sd_sys_clk] -divide_by 200 [get_pins chipset/chipset_impl/piton_sd_top/sdc_controller/clock_divider0/slow_clk_reg/Q]
create_generated_clock -name sd_clk_out   -source [get_pins chipset/sd_clk_oddr/C] -divide_by 1 -add -master_clock sd_fast_clk [get_ports sd_clk_out]
create_generated_clock -name sd_clk_out_1 -source [get_pins chipset/sd_clk_oddr/C] -divide_by 1 -add -master_clock sd_slow_clk [get_ports sd_clk_out]

# compensate for board trace and level shifter uncertainty
set_clock_uncertainty 2.0 [get_clocks sd_clk_out]
set_clock_uncertainty 2.0 [get_clocks sd_clk_out_1]

#################
# FPGA out / card in
# data is aligned with clock (source synchronous)

# hold fast (spec requires minimum 2ns), note that data is launched on falling edge, so 0.0 is ok here
set_output_delay -clock [get_clocks sd_clk_out]   -min -add_delay 0.000 [get_ports {sd_dat[*]}]
set_output_delay -clock [get_clocks sd_clk_out]   -min -add_delay 0.000 [get_ports sd_cmd]

# setup fast (spec requires minimum 6ns)
set_output_delay -clock [get_clocks sd_clk_out]   -max -add_delay 8.000 [get_ports {sd_dat[*]}]
set_output_delay -clock [get_clocks sd_clk_out]   -max -add_delay 8.000 [get_ports sd_cmd]

# hold slow (spec requires minimum 5ns), note that data is launched on falling edge, so 0.0 is ok here
set_output_delay -clock [get_clocks sd_clk_out_1] -min -add_delay 0.000 [get_ports {sd_dat[*]}]
set_output_delay -clock [get_clocks sd_clk_out_1] -min -add_delay 0.000 [get_ports sd_cmd]

# setup slow (spec requires minimum 5ns)
set_output_delay -clock [get_clocks sd_clk_out_1] -max -add_delay 8.000 [get_ports {sd_dat[*]}]
set_output_delay -clock [get_clocks sd_clk_out_1] -max -add_delay 8.000 [get_ports sd_cmd]

#################
# card out / FPGA in
# assume ~15cm/ns propagation time
# 14ns pd from card + 2 x 1ns trace + 2 x 2ns level shifter
# data is launched on negative clock edge here

# propdelay fast
set_input_delay -clock [get_clocks sd_clk_out]   -max -add_delay 20.000 [get_ports {sd_dat[*]}] -clock_fall
set_input_delay -clock [get_clocks sd_clk_out]   -max -add_delay 20.000 [get_ports sd_cmd]      -clock_fall

# contamination delay fast
set_input_delay -clock [get_clocks sd_clk_out]   -min -add_delay -1.000 [get_ports {sd_dat[*]}] -clock_fall
set_input_delay -clock [get_clocks sd_clk_out]   -min -add_delay -1.000 [get_ports sd_cmd]      -clock_fall

# propdelay slow
set_input_delay -clock [get_clocks sd_clk_out_1] -max -add_delay 20.000 [get_ports {sd_dat[*]}] -clock_fall
set_input_delay -clock [get_clocks sd_clk_out_1] -max -add_delay 20.000 [get_ports sd_cmd]      -clock_fall

# contamination  slow
set_input_delay -clock [get_clocks sd_clk_out_1] -min -add_delay -1.000 [get_ports {sd_dat[*]}] -clock_fall
set_input_delay -clock [get_clocks sd_clk_out_1] -min -add_delay -1.000 [get_ports sd_cmd]      -clock_fall

#################
# clock groups

set_clock_groups -physically_exclusive -group [get_clocks -include_generated_clocks sd_clk_out] -group [get_clocks -include_generated_clocks sd_clk_out_1]
set_clock_groups -logically_exclusive -group [get_clocks -include_generated_clocks {sd_fast_clk}] -group [get_clocks -include_generated_clocks {sd_slow_clk}]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks chipset_clk_clk_mmcm] -group [get_clocks -filter { NAME =~  "*sd*" }]

###############################vu9p



set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.GENERAL.CRC DISABLE [current_design]

set_property SEVERITY {Warning} [get_drc_checks NSTD-1]




###########################DDR
set_property PACKAGE_PIN M58 [get_ports {ddr_dq[36]}]
set_property PACKAGE_PIN M57 [get_ports {ddr_dq[37]}]
set_property PACKAGE_PIN N55 [get_ports {ddr_dq[34]}]
set_property PACKAGE_PIN P57 [get_ports {ddr_dm[4]}]
set_property PACKAGE_PIN K57 [get_ports {ddr_dq[35]}]
set_property PACKAGE_PIN L57 [get_ports {ddr_dq[32]}]
set_property PACKAGE_PIN N58 [get_ports {ddr_dq[33]}]
set_property PACKAGE_PIN N56 [get_ports {ddr_dq[38]}]
set_property PACKAGE_PIN M56 [get_ports {ddr_dqs_p[4]}]
set_property PACKAGE_PIN L56 [get_ports {ddr_dqs_n[4]}]
set_property PACKAGE_PIN K58 [get_ports {ddr_dq[39]}]
set_property PACKAGE_PIN AE59 [get_ports {ddr_dm[3]}]
set_property PACKAGE_PIN AC58 [get_ports {ddr_dq[26]}]
set_property PACKAGE_PIN AD63 [get_ports {ddr_dq[28]}]
set_property PACKAGE_PIN AC61 [get_ports {ddr_dq[29]}]
set_property PACKAGE_PIN V59 [get_ports {ddr_dq[14]}]
set_property PACKAGE_PIN AD62 [get_ports {ddr_dq[24]}]
set_property PACKAGE_PIN AD61 [get_ports {ddr_dq[27]}]
set_property PACKAGE_PIN U63 [get_ports {ddr_dq[15]}]
set_property PACKAGE_PIN AC63 [get_ports {ddr_dqs_p[3]}]
set_property PACKAGE_PIN AB63 [get_ports {ddr_dqs_n[3]}]
set_property PACKAGE_PIN AC60 [get_ports {ddr_dq[25]}]
set_property PACKAGE_PIN AC59 [get_ports {ddr_dq[30]}]
set_property PACKAGE_PIN W63 [get_ports {ddr_dq[12]}]
set_property PACKAGE_PIN V60 [get_ports {ddr_dqs_p[1]}]
set_property PACKAGE_PIN V61 [get_ports {ddr_dqs_n[1]}]
set_property PACKAGE_PIN AF62 [get_ports {ddr_dq[22]}]
set_property PACKAGE_PIN AF61 [get_ports {ddr_dq[20]}]
set_property PACKAGE_PIN AD60 [get_ports {ddr_dq[31]}]
set_property PACKAGE_PIN V63 [get_ports {ddr_dq[13]}]
set_property PACKAGE_PIN U62 [get_ports {ddr_dq[10]}]
set_property PACKAGE_PIN W62 [get_ports {ddr_dq[8]}]
set_property PACKAGE_PIN AG59 [get_ports {ddr_dq[23]}]
set_property PACKAGE_PIN AF59 [get_ports {ddr_dq[21]}]
set_property PACKAGE_PIN AE62 [get_ports {ddr_dq[18]}]
set_property PACKAGE_PIN AH58 [get_ports {ddr_dm[2]}]
set_property PACKAGE_PIN U61 [get_ports {ddr_dq[11]}]
set_property PACKAGE_PIN V58 [get_ports {ddr_dq[9]}]
set_property PACKAGE_PIN AG62 [get_ports {ddr_dqs_p[2]}]
set_property PACKAGE_PIN AG63 [get_ports {ddr_dqs_n[2]}]
set_property PACKAGE_PIN AG58 [get_ports {ddr_dq[19]}]
set_property PACKAGE_PIN W60 [get_ports {ddr_dm[1]}]
set_property PACKAGE_PIN AF60 [get_ports {ddr_dq[16]}]
set_property PACKAGE_PIN AG61 [get_ports {ddr_dq[17]}]
set_property PACKAGE_PIN AA61 [get_ports {ddr_dq[6]}]
set_property PACKAGE_PIN AC55 [get_ports {ddr_addr[0]}]
set_property PACKAGE_PIN AC53 [get_ports {ddr_addr[1]}]
set_property PACKAGE_PIN AA62 [get_ports {ddr_dq[7]}]
set_property PACKAGE_PIN AB61 [get_ports {ddr_dm[0]}]
set_property PACKAGE_PIN AC51 [get_ports {ddr_addr[6]}]
set_property PACKAGE_PIN AB51 [get_ports ddr_ck_p]
set_property PACKAGE_PIN AB52 [get_ports ddr_ck_n]
#set_property PACKAGE_PIN AC45 [ get_ports "ddr_dq[68]" ]
set_property PACKAGE_PIN L54 [get_ports {ddr_dq[60]}]
set_property PACKAGE_PIN J52 [get_ports {ddr_dq[61]}]
set_property PACKAGE_PIN M51 [get_ports {ddr_dq[58]}]
set_property PACKAGE_PIN Y59 [get_ports {ddr_dqs_p[0]}]
set_property PACKAGE_PIN Y60 [get_ports {ddr_dqs_n[0]}]
set_property PACKAGE_PIN AA60 [get_ports {ddr_dq[0]}]
set_property PACKAGE_PIN AB59 [get_ports {ddr_dq[4]}]
set_property PACKAGE_PIN V53 [get_ports {ddr_addr[7]}]
set_property PACKAGE_PIN AB57 [get_ports {ddr_addr[2]}]
set_property PACKAGE_PIN AA56 [get_ports {ddr_addr[4]}]
#set_property PACKAGE_PIN AA45 [ get_ports "ddr_dqs_p[8]" ]
#set_property PACKAGE_PIN Y45 [ get_ports "ddr_dqs_n[8]" ]
#set_property PACKAGE_PIN AA47 [ get_ports "ddr_dq[69]" ]
set_property PACKAGE_PIN M52 [get_ports {ddr_dq[62]}]
set_property PACKAGE_PIN L51 [get_ports {ddr_dq[59]}]
set_property PACKAGE_PIN AA59 [get_ports {ddr_dq[1]}]
set_property PACKAGE_PIN AB58 [get_ports {ddr_dq[5]}]
set_property PACKAGE_PIN Y62 [get_ports {ddr_dq[2]}]
set_property PACKAGE_PIN Y63 [get_ports {ddr_dq[3]}]
set_property PACKAGE_PIN AB56 [get_ports {ddr_addr[3]}]
set_property PACKAGE_PIN AC54 [get_ports {ddr_addr[5]}]
set_property PACKAGE_PIN M53 [get_ports {ddr_dm[7]}]
set_property PACKAGE_PIN J51 [get_ports {ddr_dq[63]}]
set_property PACKAGE_PIN AA55 [get_ports ddr_cs_n]
set_property PACKAGE_PIN AB54 [get_ports {ddr_addr[16]}]
set_property PACKAGE_PIN V56 [get_ports {ddr_ba[0]}]
set_property PACKAGE_PIN L52 [get_ports {ddr_dq[56]}]
set_property PACKAGE_PIN W56 [get_ports {ddr_bg[0]}]
set_property PACKAGE_PIN AA54 [get_ports {ddr_addr[10]}]
set_property PACKAGE_PIN Y54 [get_ports {ddr_addr[11]}]
set_property PACKAGE_PIN T56 [get_ports {ddr_dq[44]}]
set_property PACKAGE_PIN P52 [get_ports {ddr_dq[54]}]
set_property PACKAGE_PIN P51 [get_ports {ddr_dq[55]}]
set_property PACKAGE_PIN K54 [get_ports {ddr_dq[57]}]
set_property PACKAGE_PIN K52 [get_ports {ddr_dqs_p[7]}]
set_property PACKAGE_PIN K53 [get_ports {ddr_dqs_n[7]}]
set_property PACKAGE_PIN W55 [get_ports {ddr_bg[1]}]
set_property PACKAGE_PIN W53 [get_ports {ddr_addr[12]}]
set_property PACKAGE_PIN V51 [get_ports {ddr_addr[13]}]
set_property PACKAGE_PIN R54 [get_ports {ddr_dq[42]}]
set_property PACKAGE_PIN R58 [get_ports {ddr_dq[45]}]
set_property PACKAGE_PIN P56 [get_ports {ddr_dq[40]}]
set_property PACKAGE_PIN T54 [get_ports {ddr_dqs_p[5]}]
set_property PACKAGE_PIN T55 [get_ports {ddr_dqs_n[5]}]
set_property PACKAGE_PIN U53 [get_ports {ddr_dq[52]}]
set_property PACKAGE_PIN T52 [get_ports {ddr_dq[53]}]
set_property PACKAGE_PIN N53 [get_ports {ddr_dqs_p[6]}]
set_property PACKAGE_PIN N54 [get_ports {ddr_dqs_n[6]}]
set_property PACKAGE_PIN AA49 [get_ports ddr_odt]
set_property PACKAGE_PIN V54 [get_ports ddr_cke]
set_property PACKAGE_PIN AC56 [get_ports {ddr_addr[14]}]
set_property PACKAGE_PIN AC50 [get_ports {ddr_addr[8]}]
set_property PACKAGE_PIN W52 [get_ports {ddr_addr[9]}]
set_property PACKAGE_PIN R55 [get_ports {ddr_dq[43]}]
set_property PACKAGE_PIN T57 [get_ports {ddr_dq[41]}]
set_property PACKAGE_PIN P55 [get_ports {ddr_dq[46]}]
set_property PACKAGE_PIN N51 [get_ports {ddr_dq[50]}]
set_property PACKAGE_PIN T51 [get_ports {ddr_dq[51]}]
set_property PACKAGE_PIN P53 [get_ports {ddr_dq[48]}]
set_property PACKAGE_PIN U52 [get_ports {ddr_dq[49]}]
set_property PACKAGE_PIN W57 [get_ports ddr_act_n]
set_property PACKAGE_PIN Y49 [get_ports ddr_reset_n]
set_property PACKAGE_PIN V55 [get_ports {ddr_addr[15]}]
set_property PACKAGE_PIN AA57 [get_ports {ddr_ba[1]}]
set_property PACKAGE_PIN U56 [get_ports {ddr_dm[5]}]
set_property PACKAGE_PIN R57 [get_ports {ddr_dq[47]}]
set_property PACKAGE_PIN R52 [get_ports {ddr_dm[6]}]

####################################################################################
# Constraints from file : 'xiangshan.xdc'
####################################################################################

set_property SLEW FAST [get_ports ddr_reset_n]
set_property IOSTANDARD SSTL12_DCI [get_ports ddr_act_n]
set_property IOSTANDARD SSTL12_DCI [get_ports ddr_reset_n]

####################################################################################
# Constraints from file : 'xiangshan.xdc'
####################################################################################

set_property IOSTANDARD POD12_DCI [get_ports {ddr_dm[7]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dm[6]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dm[5]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dm[4]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dm[3]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dm[2]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dm[1]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dm[0]}]

