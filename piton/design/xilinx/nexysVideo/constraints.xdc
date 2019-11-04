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

# Clock signals
set_property IOSTANDARD LVCMOS33 [get_ports chipset_clk_osc]
set_property PACKAGE_PIN R4 [get_ports chipset_clk_osc]

# Reset
set_property IOSTANDARD LVCMOS15 [get_ports sys_rst_n]
set_property PACKAGE_PIN G4 [get_ports sys_rst_n]

# False paths
set_false_path -to [get_cells -hierarchical *afifo_ui_rst_r*]
set_false_path -to [get_cells -hierarchical *ui_clk_sync_rst_r*]
set_false_path -to [get_cells -hierarchical *ui_clk_syn_rst_delayed*]
set_false_path -to [get_cells -hierarchical *chipset_rst_n*]
set_false_path -to [get_cells -hierarchical *init_calib_complete_f*]
set_false_path -from [get_clocks chipset_clk_clk_mmcm] -to [get_clocks net_axi_clk_clk_mmcm]
set_false_path -from [get_clocks net_axi_clk_clk_mmcm] -to [get_clocks chipset_clk_clk_mmcm]


#### UART
#IO_L11N_T1_SRCC_35 Sch=uart_rxd_out
set_property IOSTANDARD LVCMOS33 [get_ports uart_rx]
set_property PACKAGE_PIN V18 [get_ports uart_rx]
set_property IOSTANDARD LVCMOS33 [get_ports uart_tx]
set_property PACKAGE_PIN AA19 [get_ports uart_tx]

# Switches
set_property IOSTANDARD LVCMOS12 [get_ports {sw[0]}]
set_property PACKAGE_PIN E22 [get_ports {sw[0]}]
set_property IOSTANDARD LVCMOS12 [get_ports {sw[1]}]
set_property PACKAGE_PIN F21 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS12 [get_ports {sw[2]}]
set_property PACKAGE_PIN G21 [get_ports {sw[2]}]
set_property IOSTANDARD LVCMOS12 [get_ports {sw[3]}]
set_property PACKAGE_PIN G22 [get_ports {sw[3]}]
set_property IOSTANDARD LVCMOS12 [get_ports {sw[4]}]
set_property PACKAGE_PIN H17 [get_ports {sw[4]}]
set_property IOSTANDARD LVCMOS12 [get_ports {sw[5]}]
set_property PACKAGE_PIN J16 [get_ports {sw[5]}]
set_property IOSTANDARD LVCMOS12 [get_ports {sw[6]}]
set_property PACKAGE_PIN K13 [get_ports {sw[6]}]
set_property IOSTANDARD LVCMOS12 [get_ports {sw[7]}]
set_property PACKAGE_PIN M17 [get_ports {sw[7]}]

# SD
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN W19 DRIVE 16 SLEW FAST} [get_ports sd_clk_out]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN W20} [get_ports sd_cmd]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN V19} [get_ports {sd_dat[0]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T21} [get_ports {sd_dat[1]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T20} [get_ports {sd_dat[2]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN U18} [get_ports {sd_dat[3]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN V20} [get_ports sd_reset]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T18} [get_ports sd_cd]

## LEDs

set_property PACKAGE_PIN T14 [get_ports {leds[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {leds[0]}]
set_property PACKAGE_PIN T15 [get_ports {leds[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {leds[1]}]
set_property PACKAGE_PIN T16 [get_ports {leds[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {leds[2]}]
set_property PACKAGE_PIN U16 [get_ports {leds[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {leds[3]}]
set_property PACKAGE_PIN V15 [get_ports {leds[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {leds[4]}]
set_property PACKAGE_PIN W16 [get_ports {leds[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {leds[5]}]
set_property PACKAGE_PIN W15 [get_ports {leds[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {leds[6]}]
set_property PACKAGE_PIN Y13 [get_ports {leds[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {leds[7]}]


## OLED
set_property -dict {PACKAGE_PIN W22 IOSTANDARD LVCMOS33} [get_ports {oled_dc}]
set_property -dict {PACKAGE_PIN U21 IOSTANDARD LVCMOS33} [get_ports {oled_rst_n}]
set_property -dict {PACKAGE_PIN W21 IOSTANDARD LVCMOS33} [get_ports {oled_sclk}]
set_property -dict {PACKAGE_PIN Y22 IOSTANDARD LVCMOS33} [get_ports {oled_data}]
set_property -dict {PACKAGE_PIN P20 IOSTANDARD LVCMOS33} [get_ports {oled_vbat_n}]
set_property -dict {PACKAGE_PIN V22 IOSTANDARD LVCMOS33} [get_ports {oled_vdd_n}]


## Buttons
set_property -dict { PACKAGE_PIN B22 IOSTANDARD LVCMOS12 } [get_ports { btnc }];
set_property -dict {PACKAGE_PIN D22 IOSTANDARD LVCMOS12} [get_ports {btnd}]
set_property -dict {PACKAGE_PIN C22 IOSTANDARD LVCMOS12} [get_ports {btnl}]
set_property -dict {PACKAGE_PIN D14 IOSTANDARD LVCMOS12} [get_ports {btnr}]
set_property -dict {PACKAGE_PIN F15 IOSTANDARD LVCMOS12} [get_ports {btnu}]

## Ethernet
#set_property -dict { PACKAGE_PIN Y14   IOSTANDARD LVCMOS25 } [get_ports { eth_int_b }]; #IO_L6N_T0_VREF_13 Sch=eth_int_b
set_property -dict {PACKAGE_PIN AA16 IOSTANDARD LVCMOS25} [get_ports {net_phy_mdc}]
set_property -dict {PACKAGE_PIN Y16 IOSTANDARD LVCMOS25} [get_ports {net_phy_mdio_io}]
#set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS25 } [get_ports { eth_pme_b }]; #IO_L6P_T0_13 Sch=eth_pme_b
set_property -dict {PACKAGE_PIN U7 IOSTANDARD LVCMOS33} [get_ports {net_phy_rst_n}]
set_property -dict {PACKAGE_PIN V13 IOSTANDARD LVCMOS25} [get_ports {net_phy_rxc}]
set_property -dict {PACKAGE_PIN W10 IOSTANDARD LVCMOS25} [get_ports {net_phy_rxctl}]
set_property PACKAGE_PIN AB16 [get_ports {net_phy_rxd[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {net_phy_rxd[0]}]
set_property PACKAGE_PIN AA15 [get_ports {net_phy_rxd[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {net_phy_rxd[1]}]
set_property PACKAGE_PIN AB15 [get_ports {net_phy_rxd[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {net_phy_rxd[2]}]
set_property PACKAGE_PIN AB11 [get_ports {net_phy_rxd[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {net_phy_rxd[3]}]
set_property -dict {PACKAGE_PIN AA14 IOSTANDARD LVCMOS25} [get_ports {net_phy_txc}]
set_property -dict {PACKAGE_PIN V10 IOSTANDARD LVCMOS25} [get_ports {net_phy_txctl}]
set_property PACKAGE_PIN Y12 [get_ports {net_phy_txd[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {net_phy_txd[0]}]
set_property PACKAGE_PIN W12 [get_ports {net_phy_txd[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {net_phy_txd[1]}]
set_property PACKAGE_PIN W11 [get_ports {net_phy_txd[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {net_phy_txd[2]}]
set_property PACKAGE_PIN Y11 [get_ports {net_phy_txd[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {net_phy_txd[3]}]


### False paths
#set_false_path -from [get_clocks clk_pll_i] -to [get_clocks clk_pll_i_1]
set_clock_groups -name sync_gr1 -logically_exclusive -group chipset_clk_clk_mmcm -group [get_clocks -include_generated_clocks mc_sys_clk_clk_mmcm]


#############################################
# Ethernet Constraints for 100 Mb/s
#############################################

######### Input constraints
# hint from here: https://forums.xilinx.com/t5/Timing-Analysis/XDC-constraints-Source-Synchronous-ADC-DDR/td-p/292807
create_clock -period 40.000 -name net_phy_rxc_virt
# conservatively assuming +/- 2ns skew of rxd/rxctl
create_clock -period 40.000 -name net_phy_rxc -waveform {2.000 22.000} [get_ports net_phy_rxc]
set_clock_groups -asynchronous -group [get_clocks chipset_clk_clk_mmcm] -group [get_clocks net_phy_rxc]
set_input_delay -clock [get_clocks net_phy_rxc_virt] -min -add_delay 0.000 [get_ports {net_phy_rxd[*]}]
set_input_delay -clock [get_clocks net_phy_rxc_virt] -max -add_delay 4.000 [get_ports {net_phy_rxd[*]}]
set_input_delay -clock [get_clocks net_phy_rxc_virt] -clock_fall -min -add_delay 0.000 [get_ports net_phy_rxctl]
set_input_delay -clock [get_clocks net_phy_rxc_virt] -clock_fall -max -add_delay 4.000 [get_ports net_phy_rxctl]
set_input_delay -clock [get_clocks net_phy_rxc_virt] -min -add_delay 0.000 [get_ports net_phy_rxctl]
set_input_delay -clock [get_clocks net_phy_rxc_virt] -max -add_delay 4.000 [get_ports net_phy_rxctl]

########## Output Constraints
create_generated_clock -name net_phy_txc -source [get_pins chipset/net_phy_txc_oddr/C] -divide_by 1 -invert [get_ports net_phy_txc]

#############################################
# SD Card Constraints for 25MHz
#############################################
create_generated_clock -name sd_fast_clk -source [get_pins chipset/clk_mmcm/sd_sys_clk] -divide_by 2 [get_pins chipset/chipset_impl/piton_sd_top/sdc_controller/clock_divider0/fast_clk_reg/Q]
create_generated_clock -name sd_slow_clk -source [get_pins chipset/clk_mmcm/sd_sys_clk] -divide_by 200 [get_pins chipset/chipset_impl/piton_sd_top/sdc_controller/clock_divider0/slow_clk_reg/Q]
create_generated_clock -name sd_clk_out   -source [get_pins chipset/sd_clk_oddr/C] -divide_by 1 -add -master_clock sd_fast_clk [get_ports sd_clk_out]
create_generated_clock -name sd_clk_out_1 -source [get_pins chipset/sd_clk_oddr/C] -divide_by 1 -add -master_clock sd_slow_clk [get_ports sd_clk_out]

# compensate for board trace uncertainty
set_clock_uncertainty 0.500 [get_clocks sd_clk_out]
set_clock_uncertainty 0.500 [get_clocks sd_clk_out_1]

#################
# FPGA out / card in
# data is aligned with clock (source synchronous)

# hold fast (spec requires minimum 2ns), note that data is launched on falling edge, so 0.0 is ok here
set_output_delay -clock [get_clocks sd_clk_out] -min -add_delay -6.000 [get_ports {sd_dat[*]}]
set_output_delay -clock [get_clocks sd_clk_out] -min -add_delay -6.000 [get_ports sd_cmd]

# setup fast (spec requires minimum 6ns)
set_output_delay -clock [get_clocks sd_clk_out] -max -add_delay 8.000 [get_ports {sd_dat[*]}]
set_output_delay -clock [get_clocks sd_clk_out] -max -add_delay 8.000 [get_ports sd_cmd]

# hold slow (spec requires minimum 5ns), note that data is launched on falling edge, so 0.0 is ok here
set_output_delay -clock [get_clocks sd_clk_out_1] -min -add_delay -8.000 [get_ports {sd_dat[*]}]
set_output_delay -clock [get_clocks sd_clk_out_1] -min -add_delay -8.000 [get_ports sd_cmd]

# setup slow (spec requires minimum 5ns)
set_output_delay -clock [get_clocks sd_clk_out_1] -max -add_delay 8.000 [get_ports {sd_dat[*]}]
set_output_delay -clock [get_clocks sd_clk_out_1] -max -add_delay 8.000 [get_ports sd_cmd]

#################
# card out / FPGA in
# data is launched on negative clock edge here

# propdelay fast
set_input_delay -clock [get_clocks sd_clk_out] -clock_fall -max -add_delay 14.000 [get_ports {sd_dat[*]}]
set_input_delay -clock [get_clocks sd_clk_out] -clock_fall -max -add_delay 14.000 [get_ports sd_cmd]

# contamination delay fast
set_input_delay -clock [get_clocks sd_clk_out] -clock_fall -min -add_delay -14.000 [get_ports {sd_dat[*]}]
set_input_delay -clock [get_clocks sd_clk_out] -clock_fall -min -add_delay -14.000 [get_ports sd_cmd]

# propdelay slow
set_input_delay -clock [get_clocks sd_clk_out_1] -clock_fall -max -add_delay 14.000 [get_ports {sd_dat[*]}]
set_input_delay -clock [get_clocks sd_clk_out_1] -clock_fall -max -add_delay 14.000 [get_ports sd_cmd]

# contamination  slow
set_input_delay -clock [get_clocks sd_clk_out_1] -clock_fall -min -add_delay -14.000 [get_ports {sd_dat[*]}]
set_input_delay -clock [get_clocks sd_clk_out_1] -clock_fall -min -add_delay -14.000 [get_ports sd_cmd]

#################
# clock groups

set_clock_groups -physically_exclusive -group [get_clocks -include_generated_clocks sd_clk_out] -group [get_clocks -include_generated_clocks sd_clk_out_1]
set_clock_groups -logically_exclusive -group [get_clocks -include_generated_clocks sd_fast_clk] -group [get_clocks -include_generated_clocks sd_slow_clk]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks chipset_clk_clk_mmcm] -group [get_clocks -filter { NAME =~  "*sd*" }]
