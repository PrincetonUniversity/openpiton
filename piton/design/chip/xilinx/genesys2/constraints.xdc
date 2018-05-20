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
set_property IOSTANDARD LVDS [get_ports clk_osc_p]
set_property PACKAGE_PIN AD12 [get_ports clk_osc_p]
set_property PACKAGE_PIN AD11 [get_ports clk_osc_n]
set_property IOSTANDARD LVDS [get_ports clk_osc_n]

set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets clk_mmcm/inst/clk_in1_clk_mmcm_chip]

# Non-MMCM clock constraints
create_clock -name intf_chip_clk_p -period 6.0 -waveform "0 3.0" [get_ports { intf_chip_clk_p }];
create_clock -name intf_chip_clk_n -period 6.0 -waveform "3.0 6.0" [get_ports { intf_chip_clk_n }];
create_clock -name io_clk -period 6.0 -waveform "0 3.0" [get_pins { intf_chip_clk_ibufgds/O }];
create_clock -name chip_intf_clk_p -period 6.0 -waveform "0 3.0" [get_ports { chip_intf_clk_p }];
create_clock -name chip_intf_clk_n -period 6.0 -waveform "3.0 6.0" [get_ports { chip_intf_clk_n }];

# Reset
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]
set_property PACKAGE_PIN R19 [get_ports rst_n]

## LEDs
set_property PACKAGE_PIN T28 [get_ports leds[0]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[0]]
set_property PACKAGE_PIN V19 [get_ports leds[1]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[1]]
set_property PACKAGE_PIN U30 [get_ports leds[2]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[2]]
set_property PACKAGE_PIN U29 [get_ports leds[3]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[3]]
set_property PACKAGE_PIN V20 [get_ports leds[4]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[4]]
set_property PACKAGE_PIN V26 [get_ports leds[5]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[5]]
set_property PACKAGE_PIN W24 [get_ports leds[6]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[6]]
set_property PACKAGE_PIN W23 [get_ports leds[7]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[7]]

## OLED
set_property -dict {PACKAGE_PIN AC17 IOSTANDARD LVCMOS18} [get_ports oled_dc]
set_property -dict {PACKAGE_PIN AB17 IOSTANDARD LVCMOS18} [get_ports oled_rst_n]
set_property -dict {PACKAGE_PIN AF17 IOSTANDARD LVCMOS18} [get_ports oled_sclk]
set_property -dict {PACKAGE_PIN Y15 IOSTANDARD LVCMOS18} [get_ports oled_data]
set_property -dict {PACKAGE_PIN AB22 IOSTANDARD LVCMOS33} [get_ports oled_vbat_n]
set_property -dict {PACKAGE_PIN AG17 IOSTANDARD LVCMOS18} [get_ports oled_vdd_n]


## Buttons
set_property PACKAGE_PIN M20 [get_ports btnl]
set_property IOSTANDARD LVCMOS12 [get_ports btnl]
set_property PACKAGE_PIN C19 [get_ports btnr]
set_property IOSTANDARD LVCMOS12 [get_ports btnr]
set_property PACKAGE_PIN M19 [get_ports btnd]
set_property IOSTANDARD LVCMOS12 [get_ports btnd]
set_property PACKAGE_PIN B19 [get_ports btnu]
set_property IOSTANDARD LVCMOS12 [get_ports btnu]

# FMC Clocks
set_property -dict { PACKAGE_PIN E20   IOSTANDARD LVDS_25 } [get_ports { intf_chip_clk_n }]; #IO_L12N_T1_MRCC_17 Sch=fmc_clk0_m2c_n
set_property -dict { PACKAGE_PIN F20   IOSTANDARD LVDS_25 } [get_ports { intf_chip_clk_p }]; #IO_L12P_T1_MRCC_17 Sch=fmc_clk0_m2c_p
set_property -dict { PACKAGE_PIN D28   IOSTANDARD LVDS_25 } [get_ports { chip_intf_clk_n }]; #IO_L14N_T2_SRCC_16 Sch=fmc_clk1_m2c_n
set_property -dict { PACKAGE_PIN E28   IOSTANDARD LVDS_25 } [get_ports { chip_intf_clk_p }]; #IO_L14P_T2_SRCC_16 Sch=fmc_clk1_m2c_p

# FMC Signals
set_property -dict { PACKAGE_PIN C27   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[11] }]; #IO_L13N_T2_MRCC_16 Sch=fmc_la_n[00]
set_property -dict { PACKAGE_PIN D27   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[11] }]; #IO_L13P_T2_MRCC_16 Sch=fmc_la_p[00]
set_property -dict { PACKAGE_PIN C26   IOSTANDARD LVDS_25 } [get_ports { chip_intf_credit_back_n[0] }]; #IO_L11N_T1_SRCC_16 Sch=fmc_la_n[01]
set_property -dict { PACKAGE_PIN D26   IOSTANDARD LVDS_25 } [get_ports { chip_intf_credit_back_p[0] }]; #IO_L11P_T1_SRCC_16 Sch=fmc_la_p[01]
set_property -dict { PACKAGE_PIN G30   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[16] }]; #IO_L24N_T3_16 Sch=fmc_la_n[02]
set_property -dict { PACKAGE_PIN H30   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[16] }]; #IO_L24P_T3_16 Sch=fmc_la_p[02]
set_property -dict { PACKAGE_PIN E30   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[12] }]; #IO_L18N_T2_16 Sch=fmc_la_n[03]
set_property -dict { PACKAGE_PIN E29   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[12] }]; #IO_L18P_T2_16 Sch=fmc_la_p[03]
set_property -dict { PACKAGE_PIN H27   IOSTANDARD LVCMOS25 } [get_ports { F4_N }]; #IO_L23N_T3_16 Sch=fmc_la_n[04]
set_property -dict { PACKAGE_PIN H26   IOSTANDARD LVCMOS25 } [get_ports { F4_P }]; #IO_L23P_T3_16 Sch=fmc_la_p[04]
set_property -dict { PACKAGE_PIN A30   IOSTANDARD LVDS_25 } [get_ports { chip_intf_credit_back_n[2] }]; #IO_L17N_T2_16 Sch=fmc_la_n[05]
set_property -dict { PACKAGE_PIN B30   IOSTANDARD LVDS_25 } [get_ports { chip_intf_credit_back_p[2] }]; #IO_L17P_T2_16 Sch=fmc_la_p[05]
set_property -dict { PACKAGE_PIN C30   IOSTANDARD LVCMOS25 } [get_ports { F6_N }]; #IO_L16N_T2_16 Sch=fmc_la_n[06]
set_property -dict { PACKAGE_PIN D29   IOSTANDARD LVCMOS25 } [get_ports { F6_P }]; #IO_L16P_T2_16 Sch=fmc_la_p[06]
set_property -dict { PACKAGE_PIN E25   IOSTANDARD LVDS_25 } [get_ports { intf_chip_channel_n[0] }]; #IO_L3N_T0_DQS_16 Sch=fmc_la_n[07]
set_property -dict { PACKAGE_PIN F25   IOSTANDARD LVDS_25 } [get_ports { intf_chip_channel_p[0] }]; #IO_L3P_T0_DQS_16 Sch=fmc_la_p[07]
set_property -dict { PACKAGE_PIN B29   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[29] }]; #IO_L15N_T2_DQS_16 Sch=fmc_la_n[08]
set_property -dict { PACKAGE_PIN C29   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[29] }]; #IO_L15P_T2_DQS_16 Sch=fmc_la_p[08]
set_property -dict { PACKAGE_PIN A28   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[0] }]; #IO_L9N_T1_DQS_16 Sch=fmc_la_n[09]
set_property -dict { PACKAGE_PIN B28   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[0] }]; #IO_L9P_T1_DQS_16 Sch=fmc_la_p[09]
set_property -dict { PACKAGE_PIN A27   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[30] }]; #IO_L7N_T1_16 Sch=fmc_la_n[10]
set_property -dict { PACKAGE_PIN B27   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[30] }]; #IO_L7P_T1_16 Sch=fmc_la_p[10]
set_property -dict { PACKAGE_PIN A26   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[31] }]; #IO_L10N_T1_16 Sch=fmc_la_n[11]
set_property -dict { PACKAGE_PIN A25   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[31] }]; #IO_L10P_T1_16 Sch=fmc_la_p[11]
set_property -dict { PACKAGE_PIN E26   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[9] }]; #IO_L5N_T0_16 Sch=fmc_la_n[12]
set_property -dict { PACKAGE_PIN F26   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[9] }]; #IO_L5P_T0_16 Sch=fmc_la_p[12]
set_property -dict { PACKAGE_PIN D24   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[20] }]; #IO_L4N_T0_16 Sch=fmc_la_n[13]
set_property -dict { PACKAGE_PIN E24   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[20] }]; #IO_L4P_T0_16 Sch=fmc_la_p[13]
set_property -dict { PACKAGE_PIN B24   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[25] }]; #IO_L8N_T1_16 Sch=fmc_la_n[14]
set_property -dict { PACKAGE_PIN C24   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[25] }]; #IO_L8P_T1_16 Sch=fmc_la_p[14]
set_property -dict { PACKAGE_PIN A23   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[25] }]; #IO_L1N_T0_16 Sch=fmc_la_n[15]
set_property -dict { PACKAGE_PIN B23   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[25] }]; #IO_L1P_T0_16 Sch=fmc_la_p[15]
set_property -dict { PACKAGE_PIN D23   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[15] }]; #IO_L2N_T0_16 Sch=fmc_la_n[16]
set_property -dict { PACKAGE_PIN E23   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[15] }]; #IO_L2P_T0_16 Sch=fmc_la_p[16]
set_property -dict { PACKAGE_PIN E21   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[16] }]; #IO_L11N_T1_SRCC_17 Sch=fmc_la_n[17]
set_property -dict { PACKAGE_PIN F21   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[16] }]; #IO_L11P_T1_SRCC_17 Sch=fmc_la_p[17]
set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[21] }]; #IO_L13N_T2_MRCC_17 Sch=fmc_la_n[18]
set_property -dict { PACKAGE_PIN D17   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[21] }]; #IO_L13P_T2_MRCC_17 Sch=fmc_la_p[18]
set_property -dict { PACKAGE_PIN H22   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[14] }]; #IO_L7N_T1_17 Sch=fmc_la_n[19]
set_property -dict { PACKAGE_PIN H21   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[14] }]; #IO_L7P_T1_17 Sch=fmc_la_p[19]
set_property -dict { PACKAGE_PIN F22   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[6] }]; #IO_L9N_T1_DQS_17 Sch=fmc_la_n[20]
set_property -dict { PACKAGE_PIN G22   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[6] }]; #IO_L9P_T1_DQS_17 Sch=fmc_la_p[20]
set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[11] }]; #IO_L5N_T0_17 Sch=fmc_la_n[21]
set_property -dict { PACKAGE_PIN L17   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[11] }]; #IO_L5P_T0_17 Sch=fmc_la_p[21]
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[7] }]; #IO_L3N_T0_DQS_17 Sch=fmc_la_n[22]
set_property -dict { PACKAGE_PIN J17   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[7] }]; #IO_L3P_T0_DQS_17 Sch=fmc_la_p[22]
set_property -dict { PACKAGE_PIN F17   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[13] }]; #IO_L18N_T2_17 Sch=fmc_la_n[23]
set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[13] }]; #IO_L18P_T2_17 Sch=fmc_la_p[23]
set_property -dict { PACKAGE_PIN G20   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[8] }]; #IO_L2N_T0_17 Sch=fmc_la_n[24]
set_property -dict { PACKAGE_PIN H20   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[8] }]; #IO_L2P_T0_17 Sch=fmc_la_p[24]
set_property -dict { PACKAGE_PIN C22   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[9] }]; #IO_L10N_T1_17 Sch=fmc_la_n[25]
set_property -dict { PACKAGE_PIN D22   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[9] }]; #IO_L10P_T1_17 Sch=fmc_la_p[25]
set_property -dict { PACKAGE_PIN A22   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[18] }]; #IO_L23N_T3_17 Sch=fmc_la_n[26]
set_property -dict { PACKAGE_PIN B22   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[18] }]; #IO_L23P_T3_17 Sch=fmc_la_p[26]
set_property -dict { PACKAGE_PIN A21   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[22] }]; #IO_L21N_T3_DQS_17 Sch=fmc_la_n[27]
set_property -dict { PACKAGE_PIN A20   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[22] }]; #IO_L21P_T3_DQS_17 Sch=fmc_la_p[27]
set_property -dict { PACKAGE_PIN H19   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[31] }]; #IO_L4N_T0_17 Sch=fmc_la_n[28]
set_property -dict { PACKAGE_PIN J19   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[31] }]; #IO_L4P_T0_17 Sch=fmc_la_p[28]
set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[2] }]; #IO_L22N_T3_17 Sch=fmc_la_n[29]
set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[2] }]; #IO_L22P_T3_17 Sch=fmc_la_p[29]
set_property -dict { PACKAGE_PIN A17   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[0] }]; #IO_L20N_T3_17 Sch=fmc_la_n[30]
set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[0] }]; #IO_L20P_T3_17 Sch=fmc_la_p[30]
set_property -dict { PACKAGE_PIN B17   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[6] }]; #IO_L17N_T2_17 Sch=fmc_la_n[31]
set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[6] }]; #IO_L17P_T2_17 Sch=fmc_la_p[31]
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[10] }]; #IO_L1N_T0_17 Sch=fmc_la_n[32]
set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[10] }]; #IO_L1P_T0_17 Sch=fmc_la_p[32]
set_property -dict { PACKAGE_PIN C16   IOSTANDARD LVDS_25 } [get_ports { intf_chip_credit_back_n[1] }]; #IO_L15N_T2_DQS_17 Sch=fmc_la_n[33]
set_property -dict { PACKAGE_PIN D16   IOSTANDARD LVDS_25 } [get_ports { intf_chip_credit_back_p[1] }]; #IO_L15P_T2_DQS_17 Sch=fmc_la_p[33]
set_property -dict { PACKAGE_PIN K29   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[15] }]; #IO_L13N_T2_MRCC_15 Sch=fmc_ha_n[00]
set_property -dict { PACKAGE_PIN K28   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[15] }]; #IO_L13P_T2_MRCC_15 Sch=fmc_ha_p[00]
set_property -dict { PACKAGE_PIN L28   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[13] }]; #IO_L14N_T2_SRCC_15 Sch=fmc_ha_n[01]
set_property -dict { PACKAGE_PIN M28   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[13] }]; #IO_L14P_T2_SRCC_15 Sch=fmc_ha_p[01]
set_property -dict { PACKAGE_PIN P22   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[24] }]; #IO_L22N_T3_A16_15 Sch=fmc_ha_n[02]
set_property -dict { PACKAGE_PIN P21   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[24] }]; #IO_L22P_T3_A17_15 Sch=fmc_ha_p[02]
set_property -dict { PACKAGE_PIN N26   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[26] }]; #IO_L18N_T2_A23_15 Sch=fmc_ha_n[03]
set_property -dict { PACKAGE_PIN N25   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[26] }]; #IO_L18P_T2_A24_15 Sch=fmc_ha_p[03]
set_property -dict { PACKAGE_PIN M25   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[18] }]; #IO_L23N_T3_FWE_B_15 Sch=fmc_ha_n[04]
set_property -dict { PACKAGE_PIN M24   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[18] }]; #IO_L23P_T3_FOE_B_15 Sch=fmc_ha_p[04]
set_property -dict { PACKAGE_PIN H29   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[17] }]; #IO_L7N_T1_AD10N_15 Sch=fmc_ha_n[05]
set_property -dict { PACKAGE_PIN J29   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[17] }]; #IO_L7P_T1_AD10P_15 Sch=fmc_ha_p[05]
set_property -dict { PACKAGE_PIN N30   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[19] }]; #IO_L17N_T2_A25_15 Sch=fmc_ha_n[06]
set_property -dict { PACKAGE_PIN N29   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[19] }]; #IO_L17P_T2_A26_15 Sch=fmc_ha_p[06]
set_property -dict { PACKAGE_PIN M30   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[1] }]; #IO_L15N_T2_DQS_ADV_B_15 Sch=fmc_ha_n[07]
set_property -dict { PACKAGE_PIN M29   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[1] }]; #IO_L15P_T2_DQS_15 Sch=fmc_ha_p[07]
set_property -dict { PACKAGE_PIN J28   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[10] }]; #IO_L8N_T1_AD3N_15 Sch=fmc_ha_n[08]
set_property -dict { PACKAGE_PIN J27   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[10] }]; #IO_L8P_T1_AD3P_15 Sch=fmc_ha_p[08]
set_property -dict { PACKAGE_PIN K30   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[14] }]; #IO_L9N_T1_DQS_AD11N_15 Sch=fmc_ha_n[09]
set_property -dict { PACKAGE_PIN L30   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[14] }]; #IO_L9P_T1_DQS_AD11P_15 Sch=fmc_ha_p[09]
set_property -dict { PACKAGE_PIN N22   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[28] }]; #IO_L20N_T3_A19_15 Sch=fmc_ha_n[10]
set_property -dict { PACKAGE_PIN N21   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[28] }]; #IO_L20P_T3_A20_15 Sch=fmc_ha_p[10]
set_property -dict { PACKAGE_PIN N24   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[30] }]; #IO_L21N_T3_DQS_A18_15 Sch=fmc_ha_n[11]
set_property -dict { PACKAGE_PIN P23   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[30] }]; #IO_L21P_T3_DQS_15 Sch=fmc_ha_p[11]
set_property -dict { PACKAGE_PIN L27   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[22] }]; #IO_L11N_T1_SRCC_AD12N_15 Sch=fmc_ha_n[12]
set_property -dict { PACKAGE_PIN L26   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[22] }]; #IO_L11P_T1_SRCC_AD12P_15 Sch=fmc_ha_p[12]
set_property -dict { PACKAGE_PIN J26   IOSTANDARD LVCMOS25 } [get_ports { piton_prsnt_n }]; #IO_L10N_T1_AD4N_15 Sch=fmc_ha_n[13]
set_property -dict { PACKAGE_PIN K26   IOSTANDARD LVCMOS25 } [get_ports { F47_P }]; #IO_L10P_T1_AD4P_15 Sch=fmc_ha_p[13]
set_property -dict { PACKAGE_PIN M27   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[29] }]; #IO_L16N_T2_A27_15 Sch=fmc_ha_n[14]
set_property -dict { PACKAGE_PIN N27   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[29] }]; #IO_L16P_T2_A28_15 Sch=fmc_ha_p[14]
set_property -dict { PACKAGE_PIN J22   IOSTANDARD LVDS_25 } [get_ports { chip_intf_credit_back_n[1] }]; #IO_L5N_T0_AD2N_15 Sch=fmc_ha_n[15]
set_property -dict { PACKAGE_PIN J21   IOSTANDARD LVDS_25 } [get_ports { chip_intf_credit_back_p[1] }]; #IO_L5P_T0_AD2P_15 Sch=fmc_ha_p[15]
set_property -dict { PACKAGE_PIN M23   IOSTANDARD LVDS_25 } [get_ports { intf_chip_channel_n[1] }]; #IO_L24N_T3_RS0_15 Sch=fmc_ha_n[16]
set_property -dict { PACKAGE_PIN M22   IOSTANDARD LVDS_25 } [get_ports { intf_chip_channel_p[1] }]; #IO_L24P_T3_RS1_15 Sch=fmc_ha_p[16]
set_property -dict { PACKAGE_PIN B25   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[20] }]; #IO_L12N_T1_MRCC_16 Sch=fmc_ha_n[17]
set_property -dict { PACKAGE_PIN C25   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[20] }]; #IO_L12P_T1_MRCC_16 Sch=fmc_ha_p[17]
set_property -dict { PACKAGE_PIN D19   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[28] }]; #IO_L14N_T2_SRCC_17 Sch=fmc_ha_n[18]
set_property -dict { PACKAGE_PIN E19   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[28] }]; #IO_L14P_T2_SRCC_17 Sch=fmc_ha_p[18]
set_property -dict { PACKAGE_PIN F30   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[3] }]; #IO_L22N_T3_16 Sch=fmc_ha_n[19]
set_property -dict { PACKAGE_PIN G29   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[3] }]; #IO_L22P_T3_16 Sch=fmc_ha_p[19]
set_property -dict { PACKAGE_PIN F27   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[5] }]; #IO_L21N_T3_DQS_16 Sch=fmc_ha_n[20]
set_property -dict { PACKAGE_PIN G27   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[5] }]; #IO_L21P_T3_DQS_16 Sch=fmc_ha_p[20]
set_property -dict { PACKAGE_PIN F28   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[21] }]; #IO_L20N_T3_16 Sch=fmc_ha_n[21]
set_property -dict { PACKAGE_PIN G28   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[21] }]; #IO_L20P_T3_16 Sch=fmc_ha_p[21]
set_property -dict { PACKAGE_PIN C21   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[23] }]; #IO_L8N_T1_17 Sch=fmc_ha_n[22]
set_property -dict { PACKAGE_PIN D21   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[23] }]; #IO_L8P_T1_17 Sch=fmc_ha_p[22]
set_property -dict { PACKAGE_PIN F18   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[27] }]; #IO_L16N_T2_17 Sch=fmc_ha_n[23]
set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[27] }]; #IO_L16P_T2_17 Sch=fmc_ha_p[23]
set_property -dict { PACKAGE_PIN F13   IOSTANDARD LVCMOS25 } [get_ports { piton_ready_n }]; #IO_L12N_T1_MRCC_18 Sch=fmc_hb_n[00]
set_property -dict { PACKAGE_PIN G13   IOSTANDARD LVCMOS25 PULLUP TRUE} [get_ports { chipset_prsnt_n }]; #IO_L12P_T1_MRCC_18 Sch=fmc_hb_p[00]
set_property -dict { PACKAGE_PIN G15   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[7] }]; #IO_L7N_T1_18 Sch=fmc_hb_n[01]
set_property -dict { PACKAGE_PIN H15   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[7] }]; #IO_L7P_T1_18 Sch=fmc_hb_p[01]
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[8] }]; #IO_L2N_T0_18 Sch=fmc_hb_n[02]
set_property -dict { PACKAGE_PIN L15   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[8] }]; #IO_L2P_T0_18 Sch=fmc_hb_p[02]
set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_n[4] }]; #IO_L11N_T1_SRCC_18 Sch=fmc_hb_n[03]
set_property -dict { PACKAGE_PIN H14   IOSTANDARD LVDS_25 } [get_ports { intf_chip_data_p[4] }]; #IO_L11P_T1_SRCC_18 Sch=fmc_hb_p[03]
set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[23] }]; #IO_L9N_T1_DQS_18 Sch=fmc_hb_n[04]
set_property -dict { PACKAGE_PIN J16   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[23] }]; #IO_L9P_T1_DQS_18 Sch=fmc_hb_p[04]
set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[27] }]; #IO_L1N_T0_18 Sch=fmc_hb_n[05]
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[27] }]; #IO_L1P_T0_18 Sch=fmc_hb_p[05]
set_property -dict { PACKAGE_PIN E13   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[17] }]; #IO_L14N_T2_SRCC_18 Sch=fmc_hb_n[06]
set_property -dict { PACKAGE_PIN F12   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[17] }]; #IO_L14P_T2_SRCC_18 Sch=fmc_hb_p[06]
set_property -dict { PACKAGE_PIN A13   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[24] }]; #IO_L22N_T3_18 Sch=fmc_hb_n[07]
set_property -dict { PACKAGE_PIN B13   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[24] }]; #IO_L22P_T3_18 Sch=fmc_hb_p[07]
set_property -dict { PACKAGE_PIN J14   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[26] }]; #IO_L5N_T0_18 Sch=fmc_hb_n[08]
set_property -dict { PACKAGE_PIN K14   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[26] }]; #IO_L5P_T0_18 Sch=fmc_hb_p[08]
set_property -dict { PACKAGE_PIN B15   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[19] }]; #IO_L23N_T3_18 Sch=fmc_hb_n[09]
set_property -dict { PACKAGE_PIN C15   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[19] }]; #IO_L23P_T3_18 Sch=fmc_hb_p[09]
set_property -dict { PACKAGE_PIN J12   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[1] }]; #IO_L8N_T1_18 Sch=fmc_hb_n[10]
set_property -dict { PACKAGE_PIN J11   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[1] }]; #IO_L8P_T1_18 Sch=fmc_hb_p[10]
set_property -dict { PACKAGE_PIN C11   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[12] }]; #IO_L18N_T2_18 Sch=fmc_hb_n[11]
set_property -dict { PACKAGE_PIN D11   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[12] }]; #IO_L18P_T2_18 Sch=fmc_hb_p[11]
set_property -dict { PACKAGE_PIN A12   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[2] }]; #IO_L17N_T2_18 Sch=fmc_hb_n[12]
set_property -dict { PACKAGE_PIN A11   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[2] }]; #IO_L17P_T2_18 Sch=fmc_hb_p[12]
set_property -dict { PACKAGE_PIN B12   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[4] }]; #IO_L15N_T2_DQS_18 Sch=fmc_hb_n[13]
set_property -dict { PACKAGE_PIN C12   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[4] }]; #IO_L15P_T2_DQS_18 Sch=fmc_hb_p[13]
set_property -dict { PACKAGE_PIN H12   IOSTANDARD LVDS_25 } [get_ports { chip_intf_channel_n[1] }]; #IO_L10N_T1_18 Sch=fmc_hb_n[14]
set_property -dict { PACKAGE_PIN H11   IOSTANDARD LVDS_25 } [get_ports { chip_intf_channel_p[1] }]; #IO_L10P_T1_18 Sch=fmc_hb_p[14]
set_property -dict { PACKAGE_PIN L13   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[3] }]; #IO_L3N_T0_DQS_18 Sch=fmc_hb_n[15]
set_property -dict { PACKAGE_PIN L12   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[3] }]; #IO_L3P_T0_DQS_18 Sch=fmc_hb_p[15]
set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVDS_25 } [get_ports { intf_chip_credit_back_n[0] }]; #IO_L4N_T0_18 Sch=fmc_hb_n[16]
set_property -dict { PACKAGE_PIN K13   IOSTANDARD LVDS_25 } [get_ports { intf_chip_credit_back_p[0] }]; #IO_L4P_T0_18 Sch=fmc_hb_p[16]
set_property -dict { PACKAGE_PIN D13   IOSTANDARD LVDS_25 } [get_ports { chip_intf_channel_n[0] }]; #IO_L13N_T2_MRCC_18 Sch=fmc_hb_n[17]
set_property -dict { PACKAGE_PIN D12   IOSTANDARD LVDS_25 } [get_ports { chip_intf_channel_p[0] }]; #IO_L13P_T2_MRCC_18 Sch=fmc_hb_p[17]
set_property -dict { PACKAGE_PIN E15   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_n[5] }]; #IO_L20N_T3_18 Sch=fmc_hb_n[18]
set_property -dict { PACKAGE_PIN E14   IOSTANDARD LVDS_25 } [get_ports { chip_intf_data_p[5] }]; #IO_L20P_T3_18 Sch=fmc_hb_p[18]
set_property -dict { PACKAGE_PIN E11   IOSTANDARD LVDS_25 } [get_ports { intf_chip_credit_back_n[2] }]; #IO_L16N_T2_18 Sch=fmc_hb_n[19]
set_property -dict { PACKAGE_PIN F11   IOSTANDARD LVDS_25 } [get_ports { intf_chip_credit_back_p[2] }]; #IO_L16P_T2_18 Sch=fmc_hb_p[19]
set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVCMOS25 } [get_ports { F78_N }]; #IO_L24N_T3_18 Sch=fmc_hb_n[20]
set_property -dict { PACKAGE_PIN B14   IOSTANDARD LVCMOS25 } [get_ports { F78_P }]; #IO_L24P_T3_18 Sch=fmc_hb_p[20]
set_property -dict { PACKAGE_PIN C14   IOSTANDARD LVCMOS25 } [get_ports { F79_N }]; #IO_L21N_T3_DQS_18 Sch=fmc_hb_n[21]
set_property -dict { PACKAGE_PIN D14   IOSTANDARD LVCMOS25 } [get_ports { F79_P }]; #IO_L21P_T3_DQS_18 Sch=fmc_hb_p[21]


### False paths
#set_clock_groups -name sync_gr1 -logically_exclusive -group [get_clocks chipset_clk_clk_mmcm] -group [get_clocks -include_generated_clocks mc_sys_clk_clk_mmcm]
set_false_path -from [get_clocks clk_osc_p] -to [get_clocks clk_osc_n]
set_false_path -from [get_clocks clk_osc_n] -to [get_clocks clk_osc_p]
#set_false_path -from [get_clocks chipset_clk_clk_mmcm] -to [get_clocks chipset_clk_mmcm_1]
#set_false_path -from [get_clocks chipset_clk_clk_mmcm_1] -to [get_clocks chipset_clk_clk_mmcm]
#set_false_path -from [get_clocks clk_pll_i_1] -to [get_clocks clk_pll_i]
#set_false_path -from [get_clocks clk_pll_i] -to [get_clocks clk_pll_i_1]
#set_false_path -from [get_clocks core_ref_clk_clk_mmcm] -to [get_clocks clk_pll_i_1]
#set_false_path -from [get_clocks clk_pll_i_1] -to [get_clocks core_ref_clk_clk_mmcm]


###############################################################
