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

# set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets clk_mmcm/inst/clk_in1_clk_mmcm]

# Constraint core clock

# Reset
set_property IOSTANDARD LVCMOS15 [get_ports sys_rst_n]
set_property PACKAGE_PIN G4 [get_ports sys_rst_n]

# False paths
set_false_path -to [get_cells -hierarchical *afifo_ui_rst_r*]
set_false_path -to [get_cells -hierarchical *ui_clk_sync_rst_r*]
set_false_path -to [get_cells -hierarchical *ui_clk_syn_rst_delayed*]
set_false_path -to [get_cells -hierarchical *init_calib_complete_f*]


#### UART
#IO_L11N_T1_SRCC_35 Sch=uart_rxd_out
set_property IOSTANDARD LVCMOS33 [get_ports uart_rx]
set_property PACKAGE_PIN V18 [get_ports uart_rx]
set_property IOSTANDARD LVCMOS33 [get_ports uart_tx]
set_property PACKAGE_PIN AA19 [get_ports uart_tx]

set_property IOSTANDARD LVCMOS12 [get_ports uart_boot_en]
set_property PACKAGE_PIN M17 [get_ports uart_boot_en]

# Loopback control for UART
#set_property IOSTANDARD LVCMOS12 [get_ports uart_lb_sw]
#set_property PACKAGE_PIN E22 [get_ports uart_lb_sw]

# Soft reset
#set_property IOSTANDARD LVCMOS12 [get_ports pin_soft_rst]
#set_property PACKAGE_PIN B22 [get_ports pin_soft_rst]

# SD
set_property IOSTANDARD LVCMOS33 [get_ports spi_clk_out]
set_property PACKAGE_PIN W19 [get_ports spi_clk_out]
set_property IOSTANDARD LVCMOS33 [get_ports spi_data_in]
set_property PACKAGE_PIN V19 [get_ports spi_data_in]
set_property IOSTANDARD LVCMOS33 [get_ports spi_data_out]
set_property PACKAGE_PIN W20 [get_ports spi_data_out]
set_property IOSTANDARD LVCMOS33 [get_ports spi_cs_n]
set_property PACKAGE_PIN U18 [get_ports spi_cs_n]

## LEDs

set_property PACKAGE_PIN T14 [get_ports leds[0]]
set_property IOSTANDARD LVCMOS25 [get_ports leds[0]]
set_property PACKAGE_PIN T15 [get_ports leds[1]]
set_property IOSTANDARD LVCMOS25 [get_ports leds[1]]
set_property PACKAGE_PIN T16 [get_ports leds[2]]
set_property IOSTANDARD LVCMOS25 [get_ports leds[2]]
set_property PACKAGE_PIN U16 [get_ports leds[3]]
set_property IOSTANDARD LVCMOS25 [get_ports leds[3]]
set_property PACKAGE_PIN V15 [get_ports leds[4]]
set_property IOSTANDARD LVCMOS25 [get_ports leds[4]]
set_property PACKAGE_PIN W16 [get_ports leds[5]]
set_property IOSTANDARD LVCMOS25 [get_ports leds[5]]
set_property PACKAGE_PIN W15 [get_ports leds[6]]
set_property IOSTANDARD LVCMOS25 [get_ports leds[6]]
set_property PACKAGE_PIN Y13 [get_ports leds[7]]
set_property IOSTANDARD LVCMOS25 [get_ports leds[7]]


## OLED
set_property -dict { PACKAGE_PIN W22   IOSTANDARD LVCMOS33 } [get_ports { oled_dc }]
set_property -dict { PACKAGE_PIN U21   IOSTANDARD LVCMOS33 } [get_ports { oled_rst_n }]
set_property -dict { PACKAGE_PIN W21   IOSTANDARD LVCMOS33 } [get_ports { oled_sclk }]
set_property -dict { PACKAGE_PIN Y22   IOSTANDARD LVCMOS33 } [get_ports { oled_data }]
set_property -dict { PACKAGE_PIN P20   IOSTANDARD LVCMOS33 } [get_ports { oled_vbat_n }]
set_property -dict { PACKAGE_PIN V22   IOSTANDARD LVCMOS33 } [get_ports { oled_vdd_n }]


## Buttons
set_property -dict { PACKAGE_PIN B22 IOSTANDARD LVCMOS12 } [get_ports { btnc }];
set_property -dict { PACKAGE_PIN D22 IOSTANDARD LVCMOS12 } [get_ports { btnd }];
set_property -dict { PACKAGE_PIN C22 IOSTANDARD LVCMOS12 } [get_ports { btnl }];
set_property -dict { PACKAGE_PIN D14 IOSTANDARD LVCMOS12 } [get_ports { btnr }];
set_property -dict { PACKAGE_PIN F15 IOSTANDARD LVCMOS12 } [get_ports { btnu }];


### False paths
#set_false_path -from [get_clocks clk_pll_i] -to [get_clocks clk_pll_i_1]
set_clock_groups -name sync_gr1 -logically_exclusive -group chipset_clk_clk_mmcm -group [get_clocks -include_generated_clocks mc_sys_clk_clk_mmcm]
