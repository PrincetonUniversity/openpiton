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

# some constraints from the example design
set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.USR_ACCESS TIMESTAMP [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 85.0 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pulldown [current_design]

# Clock signals
set_property -dict {PACKAGE_PIN BA23 IOSTANDARD LVDS} [get_ports chipset_clk_osc_n]
set_property -dict {PACKAGE_PIN AY23 IOSTANDARD LVDS} [get_ports chipset_clk_osc_p]

set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets chipset/clk_mmcm/inst/clkin1_ibufds/O]

# Reset, note that this is active low on this board!!
set_property -dict {PACKAGE_PIN AT23 IOSTANDARD LVCMOS18} [get_ports sys_rst_n]

# False paths
set_false_path -to [get_cells -hierarchical *afifo_ui_rst_r*]
set_false_path -to [get_cells -hierarchical *ui_clk_sync_rst_r*]
set_false_path -to [get_cells -hierarchical *ui_clk_syn_rst_delayed*]
set_false_path -to [get_cells -hierarchical *chipset_rst_n*]
set_false_path -to [get_cells -hierarchical *init_calib_complete_f*]
set_false_path -from [get_cells -hierarchical *init_calib_complete_f*]

#### UART
set_property -dict {PACKAGE_PIN AM24 IOSTANDARD LVCMOS18} [get_ports uart_tx]
set_property -dict {PACKAGE_PIN AL24 IOSTANDARD LVCMOS18} [get_ports uart_rx]

## LEDs
set_property -dict {PACKAGE_PIN AT32 IOSTANDARD LVCMOS12} [get_ports {leds[0]}]
set_property -dict {PACKAGE_PIN AV34 IOSTANDARD LVCMOS12} [get_ports {leds[1]}]
set_property -dict {PACKAGE_PIN AY30 IOSTANDARD LVCMOS12} [get_ports {leds[2]}]
set_property -dict {PACKAGE_PIN BB32 IOSTANDARD LVCMOS12} [get_ports {leds[3]}]

## DDR4

### RDIMM 1

# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_act_n"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_act_n"]
# set_property PACKAGE_PIN       AV17            [get_ports "ddr_act_n"] ;# Dimm 1 Activation Command Low
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[0]"]
# set_property PACKAGE_PIN       AT18            [get_ports "ddr_addr[0]"] ;# Dimm 1 Address Pin 0
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[1]"]
# set_property PACKAGE_PIN       AU17            [get_ports "ddr_addr[1]"] ;# Dimm 1 Address Pin 1
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[2]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[2]"]
# set_property PACKAGE_PIN       AP18            [get_ports "ddr_addr[2]"] ;# Dimm 1 Address Pin 2
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[3]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[3]"]
# set_property PACKAGE_PIN       AR18            [get_ports "ddr_addr[3]"] ;# Dimm 1 Address Pin 3
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[4]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[4]"]
# set_property PACKAGE_PIN       AP20            [get_ports "ddr_addr[4]"] ;# Dimm 1 Address Pin 4
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[5]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[5]"]
# set_property PACKAGE_PIN       AR20            [get_ports "ddr_addr[5]"] ;# Dimm 1 Address Pin 5
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[6]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[6]"]
# set_property PACKAGE_PIN       AU21            [get_ports "ddr_addr[6]"] ;# Dimm 1 Address Pin 6
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[7]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[7]"]
# set_property PACKAGE_PIN       AN18            [get_ports "ddr_addr[7]"] ;# Dimm 1 Address Pin 7
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[8]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[8]"]
# set_property PACKAGE_PIN       AN17            [get_ports "ddr_addr[8]"] ;# Dimm 1 Address Pin 8
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[9]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[9]"]
# set_property PACKAGE_PIN       AN19            [get_ports "ddr_addr[9]"] ;# Dimm 1 Address Pin 9
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[10]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[10]"]
# set_property PACKAGE_PIN       AP19            [get_ports "ddr_addr[10]"] ;# Dimm 1 Address Pin 10
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[11]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[11]"]
# set_property PACKAGE_PIN       AM16            [get_ports "ddr_addr[11]"] ;# Dimm 1 Address Pin 11
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[12]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[12]"]
# set_property PACKAGE_PIN       AN16            [get_ports "ddr_addr[12]"] ;# Dimm 1 Address Pin 12
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[13]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[13]"]
# set_property PACKAGE_PIN       AL19            [get_ports "ddr_addr[13]"] ;# Dimm 1 Address Pin 13
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[14]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[14]"]
# set_property PACKAGE_PIN       AM19            [get_ports "ddr_addr[14]"] ;# Dimm 1 Address Pin 14
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[15]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[15]"]
# set_property PACKAGE_PIN       AL20            [get_ports "ddr_addr[15]"] ;# Dimm 1 Address Pin 15
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[16]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[16]"]
# set_property PACKAGE_PIN       AM20            [get_ports "ddr_addr[16]"] ;# Dimm 1 Address Pin 16
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[17]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[17]"]
# set_property PACKAGE_PIN       AP16            [get_ports "ddr_addr[17]"] ;# Dimm 1 Address Pin 17
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_ba[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_ba[0]"]
# set_property PACKAGE_PIN       AT19            [get_ports "ddr_ba[0]"] ;# Dimm 1 Bank Address 0
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_ba[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_ba[1]"]
# set_property PACKAGE_PIN       AU19            [get_ports "ddr_ba[1]"] ;# Dimm 1 Bank Address 1
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_bg[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_bg[0]"]
# set_property PACKAGE_PIN       AT20            [get_ports "ddr_bg[0]"] ;# Dimm 1 Bank Group 0
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_bg[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_bg[1]"]
# set_property PACKAGE_PIN       AU20            [get_ports "ddr_bg[1]"] ;# Dimm 1 Bank Address 1
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_cke[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_cke[0]"]
# set_property PACKAGE_PIN       AY20            [get_ports "ddr_cke[0]"] ;# Dimm 1 Clock Enable 0
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_cke[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_cke[1]"]
# set_property PACKAGE_PIN       AV21            [get_ports "ddr_cke[1]"] ;# Dimm 1 Clock Enable 1
# set_property PACKAGE_PIN       AT17            [get_ports "ddr_ck_n[0]"] ;# Dimm 1 Clock
# set_property IOSTANDARD        DIFF_SSTL12_DCI [get_ports "ddr_ck_n[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_ck_n[0]"]
# set_property PACKAGE_PIN       AR17            [get_ports "ddr_ck_p[0]"] ;# Dimm 1 Clock
# set_property IOSTANDARD        DIFF_SSTL12_DCI [get_ports "ddr_ck_p[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_ck_p[0]"]
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_cs_n[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_cs_n[0]"]
# set_property PACKAGE_PIN       BA18            [get_ports "ddr_cs_n[0]"] ;# Dimm 1 Active Low Chip Select 0
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_cs_n[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_cs_n[1]"]
# set_property PACKAGE_PIN       AW20            [get_ports "ddr_cs_n[1]"] ;# Dimm 1 Active Low Chip Select 1
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[0]"]
# set_property PACKAGE_PIN       AN26            [get_ports "ddr_dqs_n[0]"] ;# Dimm 1 Data Strobe 0
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[1]"]
# set_property PACKAGE_PIN       AP26            [get_ports "ddr_dqs_n[1]"] ;# Dimm 1 Data Strobe 1
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[2]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[2]"]
# set_property PACKAGE_PIN       AT25            [get_ports "ddr_dqs_n[2]"] ;# Dimm 1 Data Strobe 2
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[3]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[3]"]
# set_property PACKAGE_PIN       AW26            [get_ports "ddr_dqs_n[3]"] ;# Dimm 1 Data Strobe 3
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[4]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[4]"]
# set_property PACKAGE_PIN       AY25            [get_ports "ddr_dqs_n[4]"] ;# Dimm 1 Data Strobe 4
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[5]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[5]"]
# set_property PACKAGE_PIN       BB25            [get_ports "ddr_dqs_n[5]"] ;# Dimm 1 Data Strobe 5
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[6]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[6]"]
# set_property PACKAGE_PIN       BE26            [get_ports "ddr_dqs_n[6]"] ;# Dimm 1 Data Strobe
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[7]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[7]"]
# set_property PACKAGE_PIN       BF29            [get_ports "ddr_dqs_n[7]"] ;# Dimm 1 Data Strobe 7
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[8]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[8]"]
# set_property PACKAGE_PIN       AR13            [get_ports "ddr_dqs_n[8]"] ;# Dimm 1 Data Strobe
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[9]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[9]"]
# set_property PACKAGE_PIN       AR15            [get_ports "ddr_dqs_n[9]"] ;# Dimm 1 Data Strobe 9
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[10]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[10]"]
# set_property PACKAGE_PIN       AV14            [get_ports "ddr_dqs_n[10]"] ;# Dimm 1 Data Strobe 10
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[11]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[11]"]
# set_property PACKAGE_PIN       AW15            [get_ports "ddr_dqs_n[11]"] ;# Dimm 1 Data Strobe 11
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[12]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[12]"]
# set_property PACKAGE_PIN       BB14            [get_ports "ddr_dqs_n[12]"] ;# Dimm 1 Data Strobe 12
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[13]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[13]"]
# set_property PACKAGE_PIN       BB12            [get_ports "ddr_dqs_n[13]"] ;# Dimm 1 Data Strobe 13
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[14]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[14]"]
# set_property PACKAGE_PIN       BE13            [get_ports "ddr_dqs_n[14]"] ;# Dimm 1 Data Strobe 14
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[15]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[15]"]
# set_property PACKAGE_PIN       BF13            [get_ports "ddr_dqs_n[15]"] ;# Dimm 1 Data Strobe 15
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[16]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[16]"]
# set_property PACKAGE_PIN       BD19            [get_ports "ddr_dqs_n[16]"] ;# Dimm 1 Data Strobe 16
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[17]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[17]"]
# set_property PACKAGE_PIN       BF17            [get_ports "ddr_dqs_n[17]"] ;# Dimm 1 Data Strobe 17
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[0]"]
# set_property PACKAGE_PIN       AM26            [get_ports "ddr_dqs_p[0]"] ;# Dimm 1 Data Strobe 0
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[1]"]
# set_property PACKAGE_PIN       AP25            [get_ports "ddr_dqs_p[1]"] ;# Dimm 1 Data Strobe 1
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[2]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[2]"]
# set_property PACKAGE_PIN       AR25            [get_ports "ddr_dqs_p[2]"] ;# Dimm 1 Data Strobe 2
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[3]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[3]"]
# set_property PACKAGE_PIN       AV26            [get_ports "ddr_dqs_p[3]"] ;# Dimm 1 Data Strobe 3
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[4]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[4]"]
# set_property PACKAGE_PIN       AW25            [get_ports "ddr_dqs_p[4]"] ;# Dimm 1 Data Strobe 4
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[5]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[5]"]
# set_property PACKAGE_PIN       BA25            [get_ports "ddr_dqs_p[5]"] ;# Dimm 1 Data Strobe 5
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[6]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[6]"]
# set_property PACKAGE_PIN       BD26            [get_ports "ddr_dqs_p[6]"] ;# Dimm 1 Data Strobe 6
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[7]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[7]"]
# set_property PACKAGE_PIN       BF28            [get_ports "ddr_dqs_p[7]"] ;# Dimm 1 Data Strobe 7
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[8]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[8]"]
# set_property PACKAGE_PIN       AP13            [get_ports "ddr_dqs_p[8]"] ;# Dimm 1 Data Strobe 8
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[9]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[9]"]
# set_property PACKAGE_PIN       AR16            [get_ports "ddr_dqs_p[9]"] ;# Dimm 1 Data Strobe 9
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[10]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[10]"]
# set_property PACKAGE_PIN       AU14            [get_ports "ddr_dqs_p[10]"] ;# Dimm 1 Data Strobe 10
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[11]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[11]"]
# set_property PACKAGE_PIN       AW14            [get_ports "ddr_dqs_p[11]"] ;# Dimm 1 Data Strobe 11
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[12]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[12]"]
# set_property PACKAGE_PIN       BB15            [get_ports "ddr_dqs_p[12]"] ;# Dimm 1 Data Strobe 12
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[13]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[13]"]
# set_property PACKAGE_PIN       BA12            [get_ports "ddr_dqs_p[13]"] ;# Dimm 1 Data Strobe 13
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[14]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[14]"]
# set_property PACKAGE_PIN       BD13            [get_ports "ddr_dqs_p[14]"] ;# Dimm 1 Data Strobe 14
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[15]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[15]"]
# set_property PACKAGE_PIN       BF14            [get_ports "ddr_dqs_p[15]"] ;# Dimm 1 Data Strobe 15
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[16]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[16]"]
# set_property PACKAGE_PIN       BC19            [get_ports "ddr_dqs_p[16]"] ;# Dimm 1 Data Strobe 16
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[17]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[17]"]
# set_property PACKAGE_PIN       BE17            [get_ports "ddr_dqs_p[17]"] ;# Dimm 1 Data Strobe 17
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[0]"]
# set_property PACKAGE_PIN       AL28            [get_ports "ddr_dq[0]"] ;# Dimm 1 Data pin 0
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[1]"]
# set_property PACKAGE_PIN       AL27            [get_ports "ddr_dq[1]"] ;# Dimm 1 Data pin 1
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[2]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[2]"]
# set_property PACKAGE_PIN       AN27            [get_ports "ddr_dq[2]"] ;# Dimm 1 Data pin 2
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[3]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[3]"]
# set_property PACKAGE_PIN       AM27            [get_ports "ddr_dq[3]"] ;# Dimm 1 Data pin 3
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[4]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[4]"]
# set_property PACKAGE_PIN       AM25            [get_ports "ddr_dq[4]"] ;# Dimm 1 Data pin 4
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[5]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[5]"]
# set_property PACKAGE_PIN       AL25            [get_ports "ddr_dq[5]"] ;# Dimm 1 Data pin 5
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[6]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[6]"]
# set_property PACKAGE_PIN       AP28            [get_ports "ddr_dq[6]"] ;# Dimm 1 Data pin 6
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[7]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[7]"]
# set_property PACKAGE_PIN       AN28            [get_ports "ddr_dq[7]"] ;# Dimm 1 Data pin 7
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[8]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[8]"]
# set_property PACKAGE_PIN       AT28            [get_ports "ddr_dq[8]"] ;# Dimm 1 Data pin 8
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[9]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[9]"]
# set_property PACKAGE_PIN       AR28            [get_ports "ddr_dq[9]"] ;# Dimm 1 Data pin 9
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[10]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[10]"]
# set_property PACKAGE_PIN       AT27            [get_ports "ddr_dq[10]"] ;# Dimm 1 Data pin 10
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[11]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[11]"]
# set_property PACKAGE_PIN       AR27            [get_ports "ddr_dq[11]"] ;# Dimm 1 Data pin 11
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[12]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[12]"]
# set_property PACKAGE_PIN       AU27            [get_ports "ddr_dq[12]"] ;# Dimm 1 Data pin 12
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[13]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[13]"]
# set_property PACKAGE_PIN       AU26            [get_ports "ddr_dq[13]"] ;# Dimm 1 Data pin 13
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[14]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[14]"]
# set_property PACKAGE_PIN       AV28            [get_ports "ddr_dq[14]"] ;# Dimm 1 Data pin 14
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[15]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[15]"]
# set_property PACKAGE_PIN       AV27            [get_ports "ddr_dq[15]"] ;# Dimm 1 Data pin 15
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[16]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[16]"]
# set_property PACKAGE_PIN       AY28            [get_ports "ddr_dq[16]"] ;# Dimm 1 Data pin 16
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[17]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[17]"]
# set_property PACKAGE_PIN       AW28            [get_ports "ddr_dq[17]"] ;# Dimm 1 Data pin 17
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[18]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[18]"]
# set_property PACKAGE_PIN       AY27            [get_ports "ddr_dq[18]"] ;# Dimm 1 Data pin 18
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[19]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[19]"]
# set_property PACKAGE_PIN       AY26            [get_ports "ddr_dq[19]"] ;# Dimm 1 Data pin 19
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[20]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[20]"]
# set_property PACKAGE_PIN       BA28            [get_ports "ddr_dq[20]"] ;# Dimm 1 Data pin 20
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[21]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[21]"]
# set_property PACKAGE_PIN       BA27            [get_ports "ddr_dq[21]"] ;# Dimm 1 Data pin 21
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[22]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[22]"]
# set_property PACKAGE_PIN       BB27            [get_ports "ddr_dq[22]"] ;# Dimm 1 Data pin 22
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[23]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[23]"]
# set_property PACKAGE_PIN       BB26            [get_ports "ddr_dq[23]"] ;# Dimm 1 Data pin 23
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[24]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[24]"]
# set_property PACKAGE_PIN       BC27            [get_ports "ddr_dq[24]"] ;# Dimm 1 Data pin 24
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[25]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[25]"]
# set_property PACKAGE_PIN       BC26            [get_ports "ddr_dq[25]"] ;# Dimm 1 Data pin 25
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[26]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[26]"]
# set_property PACKAGE_PIN       BF25            [get_ports "ddr_dq[26]"] ;# Dimm 1 Data pin 26
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[27]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[27]"]
# set_property PACKAGE_PIN       BE25            [get_ports "ddr_dq[27]"] ;# Dimm 1 Data pin 27
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[28]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[28]"]
# set_property PACKAGE_PIN       BE28            [get_ports "ddr_dq[28]"] ;# Dimm 1 Data pin 28
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[29]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[29]"]
# set_property PACKAGE_PIN       BD28            [get_ports "ddr_dq[29]"] ;# Dimm 1 Data pin 29
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[30]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[30]"]
# set_property PACKAGE_PIN       BF27            [get_ports "ddr_dq[30]"] ;# Dimm 1 Data pin 30
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[31]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[31]"]
# set_property PACKAGE_PIN       BE27            [get_ports "ddr_dq[31]"] ;# Dimm 1 Data pin 31
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[32]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[32]"]
# set_property PACKAGE_PIN       AM14            [get_ports "ddr_dq[32]"] ;# Dimm 1 Data pin 32
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[33]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[33]"]
# set_property PACKAGE_PIN       AL14            [get_ports "ddr_dq[33]"] ;# Dimm 1 Data pin 33
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[34]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[34]"]
# set_property PACKAGE_PIN       AM15            [get_ports "ddr_dq[34]"] ;# Dimm 1 Data pin 34
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[35]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[35]"]
# set_property PACKAGE_PIN       AL15            [get_ports "ddr_dq[35]"] ;# Dimm 1 Data pin 35
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[36]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[36]"]
# set_property PACKAGE_PIN       AN13            [get_ports "ddr_dq[36]"] ;# Dimm 1 Data pin 36
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[37]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[37]"]
# set_property PACKAGE_PIN       AN14            [get_ports "ddr_dq[37]"] ;# Dimm 1 Data pin 37
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[38]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[38]"]
# set_property PACKAGE_PIN       AP14            [get_ports "ddr_dq[38]"] ;# Dimm 1 Data pin 38
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[39]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[39]"]
# set_property PACKAGE_PIN       AP15            [get_ports "ddr_dq[39]"] ;# Dimm 1 Data pin 39
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[40]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[40]"]
# set_property PACKAGE_PIN       AV16            [get_ports "ddr_dq[40]"] ;# Dimm 1 Data pin 40
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[41]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[41]"]
# set_property PACKAGE_PIN       AU16            [get_ports "ddr_dq[41]"] ;# Dimm 1 Data pin 41
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[42]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[42]"]
# set_property PACKAGE_PIN       AU15            [get_ports "ddr_dq[42]"] ;# Dimm 1 Data pin 42
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[43]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[43]"]
# set_property PACKAGE_PIN       AT15            [get_ports "ddr_dq[43]"] ;# Dimm 1 Data pin 43
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[44]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[44]"]
# set_property PACKAGE_PIN       AV13            [get_ports "ddr_dq[44]"] ;# Dimm 1 Data pin 44
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[45]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[45]"]
# set_property PACKAGE_PIN       AU13            [get_ports "ddr_dq[45]"] ;# Dimm 1 Data pin 45
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[46]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[46]"]
# set_property PACKAGE_PIN       AW15            [get_ports "ddr_dq[46]"] ;# Dimm 1 Data pin 46
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[47]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[47]"]
# set_property PACKAGE_PIN       AW16            [get_ports "ddr_dq[47]"] ;# Dimm 1 Data pin 47
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[48]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[48]"]
# set_property PACKAGE_PIN       BA13            [get_ports "ddr_dq[48]"] ;# Dimm 1 Data pin 48
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[49]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[49]"]
# set_property PACKAGE_PIN       AY13            [get_ports "ddr_dq[49]"] ;# Dimm 1 Data pin 49
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[50]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[50]"]
# set_property PACKAGE_PIN       BA14            [get_ports "ddr_dq[50]"] ;# Dimm 1 Data pin 50
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[51]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[51]"]
# set_property PACKAGE_PIN       BA15            [get_ports "ddr_dq[51]"] ;# Dimm 1 Data pin 51
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[52]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[52]"]
# set_property PACKAGE_PIN       AY15            [get_ports "ddr_dq[52]"] ;# Dimm 1 Data pin 52
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[53]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[53]"]
# set_property PACKAGE_PIN       AY16            [get_ports "ddr_dq[53]"] ;# Dimm 1 Data pin 53
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[54]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[54]"]
# set_property PACKAGE_PIN       AY11            [get_ports "ddr_dq[54]"] ;# Dimm 1 Data pin 54
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[55]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[55]"]
# set_property PACKAGE_PIN       AY12            [get_ports "ddr_dq[55]"] ;# Dimm 1 Data pin 55
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[56]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[56]"]
# set_property PACKAGE_PIN       BC13            [get_ports "ddr_dq[56]"] ;# Dimm 1 Data pin 56
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[57]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[57]"]
# set_property PACKAGE_PIN       BC14            [get_ports "ddr_dq[57]"] ;# Dimm 1 Data pin 57
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[58]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[58]"]
# set_property PACKAGE_PIN       BD14            [get_ports "ddr_dq[58]"] ;# Dimm 1 Data pin 58
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[59]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[59]"]
# set_property PACKAGE_PIN       BD15            [get_ports "ddr_dq[59]"] ;# Dimm 1 Data pin 59
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[60]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[60]"]
# set_property PACKAGE_PIN       BE16            [get_ports "ddr_dq[60]"] ;# Dimm 1 Data pin 60
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[61]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[61]"]
# set_property PACKAGE_PIN       BD16            [get_ports "ddr_dq[61]"] ;# Dimm 1 Data pin 61
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[62]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[62]"]
# set_property PACKAGE_PIN       BF15            [get_ports "ddr_dq[62]"] ;# Dimm 1 Data pin 62
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[63]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[63]"]
# set_property PACKAGE_PIN       BE15            [get_ports "ddr_dq[63]"] ;# Dimm 1 Data pin 63
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[64]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[64]"]
# set_property PACKAGE_PIN       BC18            [get_ports "ddr_dq[64]"] ;# Dimm 1 Data pin 64
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[65]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[65]"]
# set_property PACKAGE_PIN       BB19            [get_ports "ddr_dq[65]"] ;# Dimm 1 Data pin 65
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[66]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[66]"]
# set_property PACKAGE_PIN       BC17            [get_ports "ddr_dq[66]"] ;# Dimm 1 Data pin 66
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[67]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[67]"]
# set_property PACKAGE_PIN       BB17            [get_ports "ddr_dq[67]"] ;# Dimm 1 Data pin 67
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[68]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[68]"]
# set_property PACKAGE_PIN       BE18            [get_ports "ddr_dq[68]"] ;# Dimm 1 Data pin 68
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[69]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[69]"]
# set_property PACKAGE_PIN       BD18            [get_ports "ddr_dq[69]"] ;# Dimm 1 Data pin 69
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[70]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[70]"]
# set_property PACKAGE_PIN       BF18            [get_ports "ddr_dq[70]"] ;# Dimm 1 Data pin 70
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[71]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[71]"]
# set_property PACKAGE_PIN       BF19            [get_ports "ddr_dq[71]"] ;# Dimm 1 Data pin 71
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_odt[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_odt[0]"]
# set_property PACKAGE_PIN       AW21            [get_ports "ddr_odt[0]"] ;# Dimm 1 On Die Termination 0
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_odt[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_odt[1]"]
# set_property PACKAGE_PIN       AV19            [get_ports "ddr_odt[1]"] ;# Dimm 1 On Die Termination 1
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_parity"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_parity"]
# set_property PACKAGE_PIN       AW19            [get_ports "ddr_parity"] ;# Dimm 1 Parity
# set_property IOSTANDARD        LVCMOS12        [get_ports "ddr_reset_n"]
# set_property PACKAGE_PIN       AY17            [get_ports "ddr_reset_n"] ;# Dimm 1 Active Low Reset
# set_property PACKAGE_PIN AV18 [get_ports mc_clk_p] ;# Dimm 1 Reference Clock
# set_property PACKAGE_PIN AW18 [get_ports mc_clk_n]
# set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports mc_clk_p]
# set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports mc_clk_n]
# set_property ODT RTT_48 [get_ports mc_clk_p]

### RDIMM 2
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_act_n"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_act_n"]
# set_property PACKAGE_PIN       BF35            [get_ports "ddr_act_n"] ;# Dimm 2 Activation Command Low
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[0]"]
# set_property PACKAGE_PIN       AY33            [get_ports "ddr_addr[0]"] ;# Dimm 2 Address 0
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[1]"]
# set_property PACKAGE_PIN       BA33            [get_ports "ddr_addr[1]"] ;# Dimm 2 Address 1
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[2]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[2]"]
# set_property PACKAGE_PIN       AV34            [get_ports "ddr_addr[2]"] ;# Dimm 2 Address 2
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[3]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[3]"]
# set_property PACKAGE_PIN       AW34            [get_ports "ddr_addr[3]"] ;# Dimm 2 Address 3
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[4]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[4]"]
# set_property PACKAGE_PIN       AV33            [get_ports "ddr_addr[4]"] ;# Dimm 2 Address 4
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[5]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[5]"]
# set_property PACKAGE_PIN       AW33            [get_ports "ddr_addr[5]"] ;# Dimm 2 Address 5
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[6]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[6]"]
# set_property PACKAGE_PIN       AU34            [get_ports "ddr_addr[6]"] ;# Dimm 2 Address 6
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[7]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[7]"]
# set_property PACKAGE_PIN       AT33            [get_ports "ddr_addr[7]"] ;# Dimm 2 Address 7
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[8]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[8]"]
# set_property PACKAGE_PIN       AT34            [get_ports "ddr_addr[8]"] ;# Dimm 2 Address 8
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[9]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[9]"]
# set_property PACKAGE_PIN       AP33            [get_ports "ddr_addr[9]"] ;# Dimm 2 Address 9
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[10]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[10]"]
# set_property PACKAGE_PIN       AR33            [get_ports "ddr_addr[10]"] ;# Dimm 2 Address 10
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[11]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[11]"]
# set_property PACKAGE_PIN       AN34            [get_ports "ddr_addr[11]"] ;# Dimm 2 Address 11
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[12]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[12]"]
# set_property PACKAGE_PIN       AP34            [get_ports "ddr_addr[12]"] ;# Dimm 2 Address 12
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[13]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[13]"]
# set_property PACKAGE_PIN       AL32            [get_ports "ddr_addr[13]"] ;# Dimm 2 Address 13
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[14]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[14]"]
# set_property PACKAGE_PIN       AM32            [get_ports "ddr_addr[14]"] ;# Dimm 2 Address 14
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[15]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[15]"]
# set_property PACKAGE_PIN       AL34            [get_ports "ddr_addr[15]"] ;# Dimm 2 Address 15
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[16]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[16]"]
# set_property PACKAGE_PIN       AM34            [get_ports "ddr_addr[16]"] ;# Dimm 2 Address 16
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[17]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[17]"]
# set_property PACKAGE_PIN       AL33            [get_ports "ddr_addr[17]"] ;# Dimm 2 Address 17
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_ba[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_ba[0]"]
# set_property PACKAGE_PIN       BA34            [get_ports "ddr_ba[0]"] ;# Dimm 2 Bank Address 0
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_ba[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_ba[1]"]
# set_property PACKAGE_PIN       BB34            [get_ports "ddr_ba[1]"] ;# Dimm 2 Bank Address 1
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_bg[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_bg[0]"]
# set_property PACKAGE_PIN       AY35            [get_ports "ddr_bg[0]"] ;# Dimm 2 Bank Group 0
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_bg[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_bg[1]"]
# set_property PACKAGE_PIN       AY36            [get_ports "ddr_bg[1]"] ;# Dimm 2 Bank Group 1
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_cke[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_cke[0]"]
# set_property PACKAGE_PIN       BE36            [get_ports "ddr_cke[0]"] ;# Dimm 2 Clock Enable 0
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_cke[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_cke[1]"]
# set_property PACKAGE_PIN       BB37            [get_ports "ddr_cke[1]"] ;# Dimm 2 Clock Enable 1
# set_property PACKAGE_PIN       AW36            [get_ports "ddr_ck_n[0]"]
# set_property IOSTANDARD        DIFF_SSTL12_DCI [get_ports "ddr_ck_n[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_ck_n[0]"] ;# Dimm 2 Clock
# set_property PACKAGE_PIN       AW35            [get_ports "ddr_ck_p[0]"]
# set_property IOSTANDARD        DIFF_SSTL12_DCI [get_ports "ddr_ck_p[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_ck_p[0]"] ;# Dimm 2 Clock
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_cs_n[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_cs_n[0]"]
# set_property PACKAGE_PIN       BE35            [get_ports "ddr_cs_n[0]"] ;# Dimm 2 Active Low Chip Select 0
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_cs_n[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_cs_n[1]"]
# set_property PACKAGE_PIN       BD36            [get_ports "ddr_cs_n[1]"] ;# Dimm 2 Active Low Chip Select 1
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[0]"]
# set_property PACKAGE_PIN       Y31             [get_ports "ddr_dqs_n[0]"] ;# Dimm 2 Data Strobe 0
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[1]"]
# set_property PACKAGE_PIN       AA33            [get_ports "ddr_dqs_n[1]"] ;# Dimm 2 Data Strobe 1
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[2]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[2]"]
# set_property PACKAGE_PIN       AD31            [get_ports "ddr_dqs_n[2]"] ;# Dimm 2 Data Strobe 2
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[3]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[3]"]
# set_property PACKAGE_PIN       AE32            [get_ports "ddr_dqs_n[3]"] ;# Dimm 2 Data Strobe 3
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[4]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[4]"]
# set_property PACKAGE_PIN       AH32            [get_ports "ddr_dqs_n[4]"] ;# Dimm 2 Data Strobe 4
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[5]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[5]"]
# set_property PACKAGE_PIN       AJ34            [get_ports "ddr_dqs_n[5]"] ;# Dimm 2 Data Strobe 5
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[6]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[6]"]
# set_property PACKAGE_PIN       AH29            [get_ports "ddr_dqs_n[6]"] ;# Dimm 2 Data Strobe 6
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[7]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[7]"]
# set_property PACKAGE_PIN       AK27            [get_ports "ddr_dqs_n[7]"] ;# Dimm 2 Data Strobe 7
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[8]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[8]"]
# set_property PACKAGE_PIN       AM30            [get_ports "ddr_dqs_n[8]"] ;# Dimm 2 Data Strobe 8
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[9]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[9]"]
# set_property PACKAGE_PIN       AR31            [get_ports "ddr_dqs_n[9]"] ;# Dimm 2 Data Strobe 9
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[10]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[10]"]
# set_property PACKAGE_PIN       AV29            [get_ports "ddr_dqs_n[10]"] ;# Dimm 2 Data Strobe 10
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[11]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[11]"]
# set_property PACKAGE_PIN       AW30            [get_ports "ddr_dqs_n[11]"] ;# Dimm 2 Data Strobe 11
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[12]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[12]"]
# set_property PACKAGE_PIN       BB32            [get_ports "ddr_dqs_n[12]"] ;# Dimm 2 Data Strobe 12
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[13]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[13]"]
# set_property PACKAGE_PIN       BC32            [get_ports "ddr_dqs_n[13]"] ;# Dimm 2 Data Strobe 13
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[14]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[14]"]
# set_property PACKAGE_PIN       BD31            [get_ports "ddr_dqs_n[14]"] ;# Dimm 2 Data Strobe 14
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[15]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[15]"]
# set_property PACKAGE_PIN       BF33            [get_ports "ddr_dqs_n[15]"] ;# Dimm 2 Data Strobe 15
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[16]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[16]"]
# set_property PACKAGE_PIN       BE40            [get_ports "ddr_dqs_n[16]"] ;# Dimm 2 Data Strobe 16
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[17]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[17]"]
# set_property PACKAGE_PIN       BF40            [get_ports "ddr_dqs_n[17]"] ;# Dimm 2 Data Strobe 17
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[0]"]
# set_property PACKAGE_PIN       W31             [get_ports "ddr_dqs_p[0]"] ;# Dimm 2 Data Strobe 0
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[1]"]
# set_property PACKAGE_PIN       AA32            [get_ports "ddr_dqs_p[1]"] ;# Dimm 2 Data Strobe 1
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[2]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[2]"]
# set_property PACKAGE_PIN       AC31            [get_ports "ddr_dqs_p[2]"] ;# Dimm 2 Data Strobe 2
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[3]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[3]"]
# set_property PACKAGE_PIN       AE31            [get_ports "ddr_dqs_p[3]"] ;# Dimm 2 Data Strobe 3
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[4]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[4]"]
# set_property PACKAGE_PIN       AH31            [get_ports "ddr_dqs_p[4]"] ;# Dimm 2 Data Strobe 4
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[5]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[5]"]
# set_property PACKAGE_PIN       AH34            [get_ports "ddr_dqs_p[5]"] ;# Dimm 2 Data Strobe 5
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[6]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[6]"]
# set_property PACKAGE_PIN       AH28            [get_ports "ddr_dqs_p[6]"] ;# Dimm 2 Data Strobe 6
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[7]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[7]"]
# set_property PACKAGE_PIN       AJ27            [get_ports "ddr_dqs_p[7]"] ;# Dimm 2 Data Strobe 7
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[8]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[8]"]
# set_property PACKAGE_PIN       AM29            [get_ports "ddr_dqs_p[8]"] ;# Dimm 2 Data Strobe 8
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[9]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[9]"]
# set_property PACKAGE_PIN       AP31            [get_ports "ddr_dqs_p[9]"] ;# Dimm 2 Data Strobe 9
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[10]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[10]"]
# set_property PACKAGE_PIN       AU29            [get_ports "ddr_dqs_p[10]"] ;# Dimm 2 Data Strobe 10
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[11]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[11]"]
# set_property PACKAGE_PIN       AW29            [get_ports "ddr_dqs_p[11]"] ;# Dimm 2 Data Strobe 11
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[12]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[12]"]
# set_property PACKAGE_PIN       BA32            [get_ports "ddr_dqs_p[12]"] ;# Dimm 2 Data Strobe 12
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[13]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[13]"]
# set_property PACKAGE_PIN       BC31            [get_ports "ddr_dqs_p[13]"] ;# Dimm 2 Data Strobe 13
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[14]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[14]"]
# set_property PACKAGE_PIN       BD30            [get_ports "ddr_dqs_p[14]"] ;# Dimm 2 Data Strobe 14
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[15]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[15]"]
# set_property PACKAGE_PIN       BF32            [get_ports "ddr_dqs_p[15]"] ;# Dimm 2 Data Strobe 15
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[16]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[16]"]
# set_property PACKAGE_PIN       BD40            [get_ports "ddr_dqs_p[16]"] ;# Dimm 2 Data Strobe 16
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[17]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[17]"]
# set_property PACKAGE_PIN       BF39            [get_ports "ddr_dqs_p[17]"] ;# Dimm 2 Data Strobe 17
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[0]"]
# set_property PACKAGE_PIN       W34             [get_ports "ddr_dq[0]"] ;# Dimm 2 Data Pin 0
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[1]"]
# set_property PACKAGE_PIN       W33             [get_ports "ddr_dq[1]"] ;# Dimm 2 Data Pin 1
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[2]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[2]"]
# set_property PACKAGE_PIN       Y33             [get_ports "ddr_dq[2]"] ;# Dimm 2 Data Pin 2
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[3]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[3]"]
# set_property PACKAGE_PIN       Y32             [get_ports "ddr_dq[3]"] ;# Dimm 2 Data Pin 3
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[4]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[4]"]
# set_property PACKAGE_PIN       Y30             [get_ports "ddr_dq[4]"] ;# Dimm 2 Data Pin 4
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[5]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[5]"]
# set_property PACKAGE_PIN       W30             [get_ports "ddr_dq[5]"] ;# Dimm 2 Data Pin 5
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[6]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[6]"]
# set_property PACKAGE_PIN       AB34            [get_ports "ddr_dq[6]"] ;# Dimm 2 Data Pin 6
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[7]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[7]"]
# set_property PACKAGE_PIN       AA34            [get_ports "ddr_dq[7]"] ;# Dimm 2 Data Pin 7
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[8]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[8]"]
# set_property PACKAGE_PIN       AD34            [get_ports "ddr_dq[8]"] ;# Dimm 2 Data Pin 8
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[9]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[9]"]
# set_property PACKAGE_PIN       AC34            [get_ports "ddr_dq[9]"] ;# Dimm 2 Data Pin 9
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[10]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[10]"]
# set_property PACKAGE_PIN       AC33            [get_ports "ddr_dq[10]"] ;# Dimm 2 Data Pin 10
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[11]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[11]"]
# set_property PACKAGE_PIN       AC32            [get_ports "ddr_dq[11]"] ;# Dimm 2 Data Pin 11
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[12]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[12]"]
# set_property PACKAGE_PIN       AF30            [get_ports "ddr_dq[12]"] ;# Dimm 2 Data Pin 12
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[13]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[13]"]
# set_property PACKAGE_PIN       AE30            [get_ports "ddr_dq[13]"] ;# Dimm 2 Data Pin 13
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[14]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[14]"]
# set_property PACKAGE_PIN       AE33            [get_ports "ddr_dq[14]"] ;# Dimm 2 Data Pin 14
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[15]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[15]"]
# set_property PACKAGE_PIN       AD33            [get_ports "ddr_dq[15]"] ;# Dimm 2 Data Pin 15
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[16]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[16]"]
# set_property PACKAGE_PIN       AF33            [get_ports "ddr_dq[16]"] ;# Dimm 2 Data Pin 16
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[17]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[17]"]
# set_property PACKAGE_PIN       AF32            [get_ports "ddr_dq[17]"] ;# Dimm 2 Data Pin 17
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[18]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[18]"]
# set_property PACKAGE_PIN       AG32            [get_ports "ddr_dq[18]"] ;# Dimm 2 Data Pin 18
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[19]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[19]"]
# set_property PACKAGE_PIN       AG31            [get_ports "ddr_dq[19]"] ;# Dimm 2 Data Pin 19
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[20]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[20]"]
# set_property PACKAGE_PIN       AG34            [get_ports "ddr_dq[20]"] ;# Dimm 2 Data Pin 20
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[21]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[21]"]
# set_property PACKAGE_PIN       AF34            [get_ports "ddr_dq[21]"] ;# Dimm 2 Data Pin 21
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[22]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[22]"]
# set_property PACKAGE_PIN       AJ33            [get_ports "ddr_dq[22]"] ;# Dimm 2 Data Pin 22
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[23]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[23]"]
# set_property PACKAGE_PIN       AH33            [get_ports "ddr_dq[23]"] ;# Dimm 2 Data Pin 23
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[24]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[24]"]
# set_property PACKAGE_PIN       AK31            [get_ports "ddr_dq[24]"] ;# Dimm 2 Data Pin 24
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[25]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[25]"]
# set_property PACKAGE_PIN       AJ31            [get_ports "ddr_dq[25]"] ;# Dimm 2 Data Pin 25
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[26]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[26]"]
# set_property PACKAGE_PIN       AG30            [get_ports "ddr_dq[26]"] ;# Dimm 2 Data Pin 26
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[27]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[27]"]
# set_property PACKAGE_PIN       AG29            [get_ports "ddr_dq[27]"] ;# Dimm 2 Data Pin 27
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[28]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[28]"]
# set_property PACKAGE_PIN       AJ30            [get_ports "ddr_dq[28]"] ;# Dimm 2 Data Pin 28
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[29]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[29]"]
# set_property PACKAGE_PIN       AJ29            [get_ports "ddr_dq[29]"] ;# Dimm 2 Data Pin 29
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[30]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[30]"]
# set_property PACKAGE_PIN       AK28            [get_ports "ddr_dq[30]"] ;# Dimm 2 Data Pin 30
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[31]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[31]"]
# set_property PACKAGE_PIN       AJ28            [get_ports "ddr_dq[31]"] ;# Dimm 2 Data Pin 31
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[32]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[32]"]
# set_property PACKAGE_PIN       AL30            [get_ports "ddr_dq[32]"] ;# Dimm 2 Data Pin 32
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[33]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[33]"]
# set_property PACKAGE_PIN       AL29            [get_ports "ddr_dq[33]"] ;# Dimm 2 Data Pin 33
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[34]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[34]"]
# set_property PACKAGE_PIN       AN31            [get_ports "ddr_dq[34]"] ;# Dimm 2 Data Pin 34
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[35]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[35]"]
# set_property PACKAGE_PIN       AM31            [get_ports "ddr_dq[35]"] ;# Dimm 2 Data Pin 35
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[36]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[36]"]
# set_property PACKAGE_PIN       AP29            [get_ports "ddr_dq[36]"] ;# Dimm 2 Data Pin 36
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[37]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[37]"]
# set_property PACKAGE_PIN       AN29            [get_ports "ddr_dq[37]"] ;# Dimm 2 Data Pin 37
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[38]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[38]"]
# set_property PACKAGE_PIN       AR30            [get_ports "ddr_dq[38]"] ;# Dimm 2 Data Pin 38
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[39]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[39]"]
# set_property PACKAGE_PIN       AP30            [get_ports "ddr_dq[39]"] ;# Dimm 2 Data Pin 39
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[40]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[40]"]
# set_property PACKAGE_PIN       AT30            [get_ports "ddr_dq[40]"] ;# Dimm 2 Data Pin 40
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[41]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[41]"]
# set_property PACKAGE_PIN       AT29            [get_ports "ddr_dq[41]"] ;# Dimm 2 Data Pin 41
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[42]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[42]"]
# set_property PACKAGE_PIN       AU31            [get_ports "ddr_dq[42]"] ;# Dimm 2 Data Pin 42
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[43]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[43]"]
# set_property PACKAGE_PIN       AU30            [get_ports "ddr_dq[43]"] ;# Dimm 2 Data Pin 43
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[44]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[44]"]
# set_property PACKAGE_PIN       AV32            [get_ports "ddr_dq[44]"] ;# Dimm 2 Data Pin 44
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[45]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[45]"]
# set_property PACKAGE_PIN       AU32            [get_ports "ddr_dq[45]"] ;# Dimm 2 Data Pin 45
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[46]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[46]"]
# set_property PACKAGE_PIN       AW31            [get_ports "ddr_dq[46]"] ;# Dimm 2 Data Pin 46
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[47]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[47]"]
# set_property PACKAGE_PIN       AV31            [get_ports "ddr_dq[47]"] ;# Dimm 2 Data Pin 47
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[48]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[48]"]
# set_property PACKAGE_PIN       AY32            [get_ports "ddr_dq[48]"] ;# Dimm 2 Data Pin 48
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[49]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[49]"]
# set_property PACKAGE_PIN       AY31            [get_ports "ddr_dq[49]"] ;# Dimm 2 Data Pin 49
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[50]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[50]"]
# set_property PACKAGE_PIN       BA30            [get_ports "ddr_dq[50]"] ;# Dimm 2 Data Pin 50
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[51]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[51]"]
# set_property PACKAGE_PIN       AY30            [get_ports "ddr_dq[51]"] ;# Dimm 2 Data Pin 51
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[52]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[52]"]
# set_property PACKAGE_PIN       BB29            [get_ports "ddr_dq[52]"] ;# Dimm 2 Data Pin 52
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[53]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[53]"]
# set_property PACKAGE_PIN       BA29            [get_ports "ddr_dq[53]"] ;# Dimm 2 Data Pin 53
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[54]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[54]"]
# set_property PACKAGE_PIN       BB31            [get_ports "ddr_dq[54]"] ;# Dimm 2 Data Pin 54
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[55]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[55]"]
# set_property PACKAGE_PIN       BB30            [get_ports "ddr_dq[55]"] ;# Dimm 2 Data Pin 55
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[56]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[56]"]
# set_property PACKAGE_PIN       BD29            [get_ports "ddr_dq[56]"] ;# Dimm 2 Data Pin 56
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[57]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[57]"]
# set_property PACKAGE_PIN       BC29            [get_ports "ddr_dq[57]"] ;# Dimm 2 Data Pin 57
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[58]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[58]"]
# set_property PACKAGE_PIN       BE33            [get_ports "ddr_dq[58]"] ;# Dimm 2 Data Pin 58
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[59]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[59]"]
# set_property PACKAGE_PIN       BD33            [get_ports "ddr_dq[59]"] ;# Dimm 2 Data Pin 59
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[60]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[60]"]
# set_property PACKAGE_PIN       BF30            [get_ports "ddr_dq[60]"] ;# Dimm 2 Data Pin 60
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[61]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[61]"]
# set_property PACKAGE_PIN       BE30            [get_ports "ddr_dq[61]"] ;# Dimm 2 Data Pin 61
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[62]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[62]"]
# set_property PACKAGE_PIN       BE32            [get_ports "ddr_dq[62]"] ;# Dimm 2 Data Pin 62
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[63]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[63]"]
# set_property PACKAGE_PIN       BE31            [get_ports "ddr_dq[63]"] ;# Dimm 2 Data Pin 63
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[64]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[64]"]
# set_property PACKAGE_PIN       BC38            [get_ports "ddr_dq[64]"] ;# Dimm 2 Data Pin 64
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[65]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[65]"]
# set_property PACKAGE_PIN       BB38            [get_ports "ddr_dq[65]"] ;# Dimm 2 Data Pin 65
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[66]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[66]"]
# set_property PACKAGE_PIN       BD39            [get_ports "ddr_dq[66]"] ;# Dimm 2 Data Pin 66
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[67]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[67]"]
# set_property PACKAGE_PIN       BC39            [get_ports "ddr_dq[67]"] ;# Dimm 2 Data Pin 67
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[68]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[68]"]
# set_property PACKAGE_PIN       BF37            [get_ports "ddr_dq[68]"] ;# Dimm 2 Data Pin 68
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[69]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[69]"]
# set_property PACKAGE_PIN       BE37            [get_ports "ddr_dq[69]"] ;# Dimm 2 Data Pin 69
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[70]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[70]"]
# set_property PACKAGE_PIN       BF38            [get_ports "ddr_dq[70]"] ;# Dimm 2 Data Pin 70
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[71]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[71]"]
# set_property PACKAGE_PIN       BE38            [get_ports "ddr_dq[71]"] ;# Dimm 2 Data Pin 71
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_odt[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_odt[0]"]
# set_property PACKAGE_PIN       BC37            [get_ports "ddr_odt[0]"] ;# Dimm 2 On Die Termination 0
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_odt[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_odt[1]"]
# set_property PACKAGE_PIN       BA35            [get_ports "ddr_odt[1]"] ;# Dimm 2 On Die Termination 1
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_parity"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_parity"]
# set_property PACKAGE_PIN       BB35            [get_ports "ddr_parity"] ;# Dimm 2 Parity
# set_property IOSTANDARD        LVCMOS12        [get_ports "ddr_reset_n"]
# set_property PACKAGE_PIN       BC34            [get_ports "ddr_reset_n"] ;# Dimm 2 Active Low Reset
# set_property PACKAGE_PIN BB36 [get_ports mc_clk_p] ;# Dimm 2 Reference Clock
# set_property PACKAGE_PIN BC36 [get_ports mc_clk_n]
# set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports mc_clk_p]
# set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports mc_clk_n]
# set_property ODT RTT_48 [get_ports mc_clk_p]


### RDIMM 3
set_property IOSTANDARD SSTL12_DCI [get_ports ddr_act_n]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports ddr_act_n]
set_property PACKAGE_PIN F38 [get_ports ddr_act_n]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_addr[0]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_addr[0]}]
set_property PACKAGE_PIN A37 [get_ports {ddr_addr[0]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_addr[1]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_addr[1]}]
set_property PACKAGE_PIN A38 [get_ports {ddr_addr[1]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_addr[2]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_addr[2]}]
set_property PACKAGE_PIN B35 [get_ports {ddr_addr[2]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_addr[3]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_addr[3]}]
set_property PACKAGE_PIN A35 [get_ports {ddr_addr[3]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_addr[4]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_addr[4]}]
set_property PACKAGE_PIN E35 [get_ports {ddr_addr[4]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_addr[5]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_addr[5]}]
set_property PACKAGE_PIN D35 [get_ports {ddr_addr[5]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_addr[6]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_addr[6]}]
set_property PACKAGE_PIN E37 [get_ports {ddr_addr[6]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_addr[7]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_addr[7]}]
set_property PACKAGE_PIN B34 [get_ports {ddr_addr[7]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_addr[8]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_addr[8]}]
set_property PACKAGE_PIN A34 [get_ports {ddr_addr[8]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_addr[9]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_addr[9]}]
set_property PACKAGE_PIN D34 [get_ports {ddr_addr[9]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_addr[10]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_addr[10]}]
set_property PACKAGE_PIN C34 [get_ports {ddr_addr[10]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_addr[11]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_addr[11]}]
set_property PACKAGE_PIN D33 [get_ports {ddr_addr[11]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_addr[12]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_addr[12]}]
set_property PACKAGE_PIN C33 [get_ports {ddr_addr[12]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_addr[13]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_addr[13]}]
set_property PACKAGE_PIN C32 [get_ports {ddr_addr[13]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_addr[14]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_addr[14]}]
set_property PACKAGE_PIN B32 [get_ports {ddr_addr[14]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_addr[15]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_addr[15]}]
set_property PACKAGE_PIN D31 [get_ports {ddr_addr[15]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_addr[16]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_addr[16]}]
set_property PACKAGE_PIN C31 [get_ports {ddr_addr[16]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_addr[17]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_addr[17]}]
set_property PACKAGE_PIN B31 [get_ports {ddr_addr[17]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_ba[0]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_ba[0]}]
set_property PACKAGE_PIN C36 [get_ports {ddr_ba[0]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_ba[1]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_ba[1]}]
set_property PACKAGE_PIN C37 [get_ports {ddr_ba[1]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_bg[0]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_bg[0]}]
set_property PACKAGE_PIN E36 [get_ports {ddr_bg[0]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_bg[1]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_bg[1]}]
set_property PACKAGE_PIN D36 [get_ports {ddr_bg[1]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_cke[0]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_cke[0]}]
set_property PACKAGE_PIN A40 [get_ports {ddr_cke[0]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_cke[1]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_cke[1]}]
set_property PACKAGE_PIN B39 [get_ports {ddr_cke[1]}]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports {ddr_ck_n[0]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_ck_n[0]}]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports {ddr_ck_p[0]}]
set_property PACKAGE_PIN B36 [get_ports {ddr_ck_p[0]}]
set_property PACKAGE_PIN B37 [get_ports {ddr_ck_n[0]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_ck_p[0]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_cs_n[0]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_cs_n[0]}]
set_property PACKAGE_PIN D39 [get_ports {ddr_cs_n[0]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_cs_n[1]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_cs_n[1]}]
set_property PACKAGE_PIN B40 [get_ports {ddr_cs_n[1]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_n[0]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_n[0]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_n[1]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_n[1]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_n[2]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_n[2]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_n[3]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_n[3]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_n[4]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_n[4]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_n[5]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_n[5]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_n[6]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_n[6]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_n[7]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_n[7]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_n[8]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_n[8]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_n[9]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_n[9]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_n[10]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_n[10]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_n[11]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_n[11]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_n[12]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_n[12]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_n[13]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_n[13]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_n[14]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_n[14]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_n[15]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_n[15]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_n[16]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_n[16]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_n[17]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_n[17]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_p[0]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_p[0]}]
set_property PACKAGE_PIN J33 [get_ports {ddr_dqs_p[0]}]
set_property PACKAGE_PIN H33 [get_ports {ddr_dqs_n[0]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_p[1]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_p[1]}]
set_property PACKAGE_PIN G30 [get_ports {ddr_dqs_p[1]}]
set_property PACKAGE_PIN F30 [get_ports {ddr_dqs_n[1]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_p[2]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_p[2]}]
set_property PACKAGE_PIN K30 [get_ports {ddr_dqs_p[2]}]
set_property PACKAGE_PIN J30 [get_ports {ddr_dqs_n[2]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_p[3]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_p[3]}]
set_property PACKAGE_PIN M31 [get_ports {ddr_dqs_p[3]}]
set_property PACKAGE_PIN M32 [get_ports {ddr_dqs_n[3]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_p[4]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_p[4]}]
set_property PACKAGE_PIN M34 [get_ports {ddr_dqs_p[4]}]
set_property PACKAGE_PIN L34 [get_ports {ddr_dqs_n[4]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_p[5]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_p[5]}]
set_property PACKAGE_PIN R30 [get_ports {ddr_dqs_p[5]}]
set_property PACKAGE_PIN P30 [get_ports {ddr_dqs_n[5]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_p[6]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_p[6]}]
set_property PACKAGE_PIN V32 [get_ports {ddr_dqs_p[6]}]
set_property PACKAGE_PIN V33 [get_ports {ddr_dqs_n[6]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_p[7]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_p[7]}]
set_property PACKAGE_PIN U34 [get_ports {ddr_dqs_p[7]}]
set_property PACKAGE_PIN T34 [get_ports {ddr_dqs_n[7]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_p[8]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_p[8]}]
set_property PACKAGE_PIN A27 [get_ports {ddr_dqs_p[8]}]
set_property PACKAGE_PIN A28 [get_ports {ddr_dqs_n[8]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_p[9]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_p[9]}]
set_property PACKAGE_PIN C27 [get_ports {ddr_dqs_p[9]}]
set_property PACKAGE_PIN B27 [get_ports {ddr_dqs_n[9]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_p[10]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_p[10]}]
set_property PACKAGE_PIN F28 [get_ports {ddr_dqs_p[10]}]
set_property PACKAGE_PIN F29 [get_ports {ddr_dqs_n[10]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_p[11]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_p[11]}]
set_property PACKAGE_PIN J26 [get_ports {ddr_dqs_p[11]}]
set_property PACKAGE_PIN H26 [get_ports {ddr_dqs_n[11]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_p[12]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_p[12]}]
set_property PACKAGE_PIN K26 [get_ports {ddr_dqs_p[12]}]
set_property PACKAGE_PIN K27 [get_ports {ddr_dqs_n[12]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_p[13]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_p[13]}]
set_property PACKAGE_PIN M29 [get_ports {ddr_dqs_p[13]}]
set_property PACKAGE_PIN L29 [get_ports {ddr_dqs_n[13]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_p[14]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_p[14]}]
set_property PACKAGE_PIN P29 [get_ports {ddr_dqs_p[14]}]
set_property PACKAGE_PIN N29 [get_ports {ddr_dqs_n[14]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_p[15]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_p[15]}]
set_property PACKAGE_PIN T28 [get_ports {ddr_dqs_p[15]}]
set_property PACKAGE_PIN R28 [get_ports {ddr_dqs_n[15]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_p[16]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_p[16]}]
set_property PACKAGE_PIN H36 [get_ports {ddr_dqs_p[16]}]
set_property PACKAGE_PIN G36 [get_ports {ddr_dqs_n[16]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {ddr_dqs_p[17]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dqs_p[17]}]
set_property PACKAGE_PIN H37 [get_ports {ddr_dqs_p[17]}]
set_property PACKAGE_PIN H38 [get_ports {ddr_dqs_n[17]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[0]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[0]}]
set_property PACKAGE_PIN E33 [get_ports {ddr_dq[0]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[1]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[1]}]
set_property PACKAGE_PIN F33 [get_ports {ddr_dq[1]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[2]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[2]}]
set_property PACKAGE_PIN E32 [get_ports {ddr_dq[2]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[3]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[3]}]
set_property PACKAGE_PIN F32 [get_ports {ddr_dq[3]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[4]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[4]}]
set_property PACKAGE_PIN G32 [get_ports {ddr_dq[4]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[5]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[5]}]
set_property PACKAGE_PIN H32 [get_ports {ddr_dq[5]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[6]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[6]}]
set_property PACKAGE_PIN G31 [get_ports {ddr_dq[6]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[7]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[7]}]
set_property PACKAGE_PIN H31 [get_ports {ddr_dq[7]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[8]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[8]}]
set_property PACKAGE_PIN K33 [get_ports {ddr_dq[8]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[9]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[9]}]
set_property PACKAGE_PIN L33 [get_ports {ddr_dq[9]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[10]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[10]}]
set_property PACKAGE_PIN J31 [get_ports {ddr_dq[10]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[11]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[11]}]
set_property PACKAGE_PIN K31 [get_ports {ddr_dq[11]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[12]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[12]}]
set_property PACKAGE_PIN L30 [get_ports {ddr_dq[12]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[13]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[13]}]
set_property PACKAGE_PIN M30 [get_ports {ddr_dq[13]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[14]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[14]}]
set_property PACKAGE_PIN K32 [get_ports {ddr_dq[14]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[15]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[15]}]
set_property PACKAGE_PIN L32 [get_ports {ddr_dq[15]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[16]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[16]}]
set_property PACKAGE_PIN N33 [get_ports {ddr_dq[16]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[17]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[17]}]
set_property PACKAGE_PIN N32 [get_ports {ddr_dq[17]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[18]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[18]}]
set_property PACKAGE_PIN N31 [get_ports {ddr_dq[18]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[19]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[19]}]
set_property PACKAGE_PIN P31 [get_ports {ddr_dq[19]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[20]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[20]}]
set_property PACKAGE_PIN N34 [get_ports {ddr_dq[20]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[21]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[21]}]
set_property PACKAGE_PIN P34 [get_ports {ddr_dq[21]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[22]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[22]}]
set_property PACKAGE_PIN R32 [get_ports {ddr_dq[22]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[23]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[23]}]
set_property PACKAGE_PIN R31 [get_ports {ddr_dq[23]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[24]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[24]}]
set_property PACKAGE_PIN T30 [get_ports {ddr_dq[24]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[25]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[25]}]
set_property PACKAGE_PIN U30 [get_ports {ddr_dq[25]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[26]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[26]}]
set_property PACKAGE_PIN U31 [get_ports {ddr_dq[26]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[27]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[27]}]
set_property PACKAGE_PIN V31 [get_ports {ddr_dq[27]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[28]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[28]}]
set_property PACKAGE_PIN T32 [get_ports {ddr_dq[28]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[29]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[29]}]
set_property PACKAGE_PIN U32 [get_ports {ddr_dq[29]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[30]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[30]}]
set_property PACKAGE_PIN R33 [get_ports {ddr_dq[30]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[31]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[31]}]
set_property PACKAGE_PIN T33 [get_ports {ddr_dq[31]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[32]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[32]}]
set_property PACKAGE_PIN A30 [get_ports {ddr_dq[32]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[33]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[33]}]
set_property PACKAGE_PIN B30 [get_ports {ddr_dq[33]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[34]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[34]}]
set_property PACKAGE_PIN A29 [get_ports {ddr_dq[34]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[35]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[35]}]
set_property PACKAGE_PIN B29 [get_ports {ddr_dq[35]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[36]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[36]}]
set_property PACKAGE_PIN D30 [get_ports {ddr_dq[36]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[37]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[37]}]
set_property PACKAGE_PIN E30 [get_ports {ddr_dq[37]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[38]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[38]}]
set_property PACKAGE_PIN C29 [get_ports {ddr_dq[38]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[39]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[39]}]
set_property PACKAGE_PIN D29 [get_ports {ddr_dq[39]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[40]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[40]}]
set_property PACKAGE_PIN D28 [get_ports {ddr_dq[40]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[41]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[41]}]
set_property PACKAGE_PIN E28 [get_ports {ddr_dq[41]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[42]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[42]}]
set_property PACKAGE_PIN E27 [get_ports {ddr_dq[42]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[43]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[43]}]
set_property PACKAGE_PIN F27 [get_ports {ddr_dq[43]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[44]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[44]}]
set_property PACKAGE_PIN G29 [get_ports {ddr_dq[44]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[45]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[45]}]
set_property PACKAGE_PIN H29 [get_ports {ddr_dq[45]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[46]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[46]}]
set_property PACKAGE_PIN G27 [get_ports {ddr_dq[46]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[47]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[47]}]
set_property PACKAGE_PIN G26 [get_ports {ddr_dq[47]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[48]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[48]}]
set_property PACKAGE_PIN J29 [get_ports {ddr_dq[48]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[49]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[49]}]
set_property PACKAGE_PIN J28 [get_ports {ddr_dq[49]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[50]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[50]}]
set_property PACKAGE_PIN H28 [get_ports {ddr_dq[50]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[51]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[51]}]
set_property PACKAGE_PIN H27 [get_ports {ddr_dq[51]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[52]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[52]}]
set_property PACKAGE_PIN L27 [get_ports {ddr_dq[52]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[53]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[53]}]
set_property PACKAGE_PIN M27 [get_ports {ddr_dq[53]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[54]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[54]}]
set_property PACKAGE_PIN K28 [get_ports {ddr_dq[54]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[55]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[55]}]
set_property PACKAGE_PIN L28 [get_ports {ddr_dq[55]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[56]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[56]}]
set_property PACKAGE_PIN N26 [get_ports {ddr_dq[56]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[57]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[57]}]
set_property PACKAGE_PIN P26 [get_ports {ddr_dq[57]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[58]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[58]}]
set_property PACKAGE_PIN N28 [get_ports {ddr_dq[58]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[59]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[59]}]
set_property PACKAGE_PIN P28 [get_ports {ddr_dq[59]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[60]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[60]}]
set_property PACKAGE_PIN R26 [get_ports {ddr_dq[60]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[61]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[61]}]
set_property PACKAGE_PIN T26 [get_ports {ddr_dq[61]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[62]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[62]}]
set_property PACKAGE_PIN R27 [get_ports {ddr_dq[62]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[63]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[63]}]
set_property PACKAGE_PIN T27 [get_ports {ddr_dq[63]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[64]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[64]}]
set_property PACKAGE_PIN F35 [get_ports {ddr_dq[64]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[65]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[65]}]
set_property PACKAGE_PIN F34 [get_ports {ddr_dq[65]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[66]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[66]}]
set_property PACKAGE_PIN G34 [get_ports {ddr_dq[66]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[67]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[67]}]
set_property PACKAGE_PIN H34 [get_ports {ddr_dq[67]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[68]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[68]}]
set_property PACKAGE_PIN J36 [get_ports {ddr_dq[68]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[69]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[69]}]
set_property PACKAGE_PIN J35 [get_ports {ddr_dq[69]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[70]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[70]}]
set_property PACKAGE_PIN F37 [get_ports {ddr_dq[70]}]
set_property IOSTANDARD POD12_DCI [get_ports {ddr_dq[71]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_dq[71]}]
set_property PACKAGE_PIN G37 [get_ports {ddr_dq[71]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_odt[0]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_odt[0]}]
set_property PACKAGE_PIN A39 [get_ports {ddr_odt[0]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ddr_odt[1]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {ddr_odt[1]}]
set_property PACKAGE_PIN C38 [get_ports {ddr_odt[1]}]
set_property IOSTANDARD SSTL12_DCI [get_ports ddr_parity]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports ddr_parity]
set_property PACKAGE_PIN C39 [get_ports ddr_parity]
set_property IOSTANDARD LVCMOS12 [get_ports ddr_reset_n]
set_property PACKAGE_PIN E40 [get_ports ddr_reset_n]
set_property PACKAGE_PIN E38 [get_ports mc_clk_p]
set_property PACKAGE_PIN D38 [get_ports mc_clk_n]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports mc_clk_p]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports mc_clk_n]
set_property ODT RTT_48 [get_ports mc_clk_p]


### RDIMM 4
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_act_n"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_act_n"]
# set_property PACKAGE_PIN       K21             [get_ports "ddr_act_n"] ;# Dimm 4 Activation Command Low
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[0]"]
# set_property PACKAGE_PIN       F20             [get_ports "ddr_addr[0]"] ;# Dimm 4 Address 0
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[1]"]
# set_property PACKAGE_PIN       F19             [get_ports "ddr_addr[1]"] ;# Dimm 4 Address 1
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[2]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[2]"]
# set_property PACKAGE_PIN       E21             [get_ports "ddr_addr[2]"] ;# Dimm 4 Address 2
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[3]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[3]"]
# set_property PACKAGE_PIN       E20             [get_ports "ddr_addr[3]"] ;# Dimm 4 Address 3
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[4]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[4]"]
# set_property PACKAGE_PIN       F18             [get_ports "ddr_addr[4]"] ;# Dimm 4 Address 4
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[5]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[5]"]
# set_property PACKAGE_PIN       F17             [get_ports "ddr_addr[5]"] ;# Dimm 4 Address 5
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[6]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[6]"]
# set_property PACKAGE_PIN       G21             [get_ports "ddr_addr[6]"] ;# Dimm 4 Address 6
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[7]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[7]"]
# set_property PACKAGE_PIN       D19             [get_ports "ddr_addr[7]"] ;# Dimm 4 Address 7
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[8]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[8]"]
# set_property PACKAGE_PIN       C19             [get_ports "ddr_addr[8]"] ;# Dimm 4 Address 8
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[9]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[9]"]
# set_property PACKAGE_PIN       D21             [get_ports "ddr_addr[9]"] ;# Dimm 4 Address 9
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[10]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[10]"]
# set_property PACKAGE_PIN       D20             [get_ports "ddr_addr[10]"] ;# Dimm 4 Address 10
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[11]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[11]"]
# set_property PACKAGE_PIN       C21             [get_ports "ddr_addr[11]"] ;# Dimm 4 Address 11
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[12]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[12]"]
# set_property PACKAGE_PIN       B21             [get_ports "ddr_addr[12]"] ;# Dimm 4 Address 12
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[13]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[13]"]
# set_property PACKAGE_PIN       B19             [get_ports "ddr_addr[13]"] ;# Dimm 4 Address 13
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[14]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[14]"]
# set_property PACKAGE_PIN       A19             [get_ports "ddr_addr[14]"] ;# Dimm 4 Address 14
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[15]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[15]"]
# set_property PACKAGE_PIN       B20             [get_ports "ddr_addr[15]"] ;# Dimm 4 Address 15
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[16]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[16]"]
# set_property PACKAGE_PIN       A20             [get_ports "ddr_addr[16]"] ;# Dimm 4 Address 16
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_addr[17]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_addr[17]"]
# set_property PACKAGE_PIN       A18             [get_ports "ddr_addr[17]"] ;# Dimm 4 Address 17
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_ba[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_ba[0]"]
# set_property PACKAGE_PIN       H19             [get_ports "ddr_ba[0]"] ;# Dimm 4 Bank Address 0
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_ba[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_ba[1]"]
# set_property PACKAGE_PIN       H18             [get_ports "ddr_ba[1]"] ;# Dimm 4 Bank Address 1
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_bg[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_bg[0]"]
# set_property PACKAGE_PIN       G20             [get_ports "ddr_bg[0]"] ;# Dimm 4 Bank Group 0
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_bg[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_bg[1]"]
# set_property PACKAGE_PIN       G19             [get_ports "ddr_bg[1]"] ;# Dimm 4 Bank Group 1
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_cke[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_cke[0]"]
# set_property PACKAGE_PIN       K20             [get_ports "ddr_cke[0]"] ;# Dimm 4 Clock Enable 0
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_cke[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_cke[1]"]
# set_property PACKAGE_PIN       J21             [get_ports "ddr_cke[1]"] ;# Dimm 4 Clock Enable 1
# set_property PACKAGE_PIN       E17             [get_ports "ddr_ck_n[0]"]
# set_property IOSTANDARD        DIFF_SSTL12_DCI [get_ports "ddr_ck_n[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_ck_n[0]"] ;# Dimm 4 Clock
# set_property PACKAGE_PIN       E18             [get_ports "ddr_ck_p[0]"]
# set_property IOSTANDARD        DIFF_SSTL12_DCI [get_ports "ddr_ck_p[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_ck_p[0]"] ;# Dimm 4 Clock
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_cs_n[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_cs_n[0]"]
# set_property PACKAGE_PIN       L18             [get_ports "ddr_cs_n[0]"] ;# Dimm 4 Active Low Chip Select 0
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_cs_n[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_cs_n[1]"]
# set_property PACKAGE_PIN       L20             [get_ports "ddr_cs_n[1]"] ;# Dimm 4 Active Low Chip Select 1
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[0]"]
# set_property PACKAGE_PIN       A22             [get_ports "ddr_dqs_n[0]"] ;# Dimm 4 Data Strobe 0
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[1]"]
# set_property PACKAGE_PIN       B22             [get_ports "ddr_dqs_n[1]"] ;# Dimm 4 Data Strobe 1
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[2]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[2]"]
# set_property PACKAGE_PIN       E22             [get_ports "ddr_dqs_n[2]"] ;# Dimm 4 Data Strobe 2
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[3]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[3]"]
# set_property PACKAGE_PIN       G24             [get_ports "ddr_dqs_n[3]"] ;# Dimm 4 Data Strobe 3
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[4]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[4]"]
# set_property PACKAGE_PIN       J25             [get_ports "ddr_dqs_n[4]"] ;# Dimm 4 Data Strobe 4
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[5]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[5]"]
# set_property PACKAGE_PIN       L24             [get_ports "ddr_dqs_n[5]"] ;# Dimm 4 Data Strobe 6
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[6]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[6]"]
# set_property PACKAGE_PIN       N24             [get_ports "ddr_dqs_n[6]"] ;# Dimm 4 Data Strobe 6
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[7]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[7]"]
# set_property PACKAGE_PIN       P21             [get_ports "ddr_dqs_n[7]"] ;# Dimm 4 Data Strobe 7
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[8]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[8]"]
# set_property PACKAGE_PIN       A15             [get_ports "ddr_dqs_n[8]"] ;# Dimm 4 Data Strobe 8
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[9]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[9]"]
# set_property PACKAGE_PIN       C13             [get_ports "ddr_dqs_n[9]"] ;# Dimm 4 Data Strobe 9
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[10]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[10]"]
# set_property PACKAGE_PIN       G16             [get_ports "ddr_dqs_n[10]"] ;# Dimm 4 Data Strobe 10
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[11]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[11]"]
# set_property PACKAGE_PIN       F14             [get_ports "ddr_dqs_n[11]"] ;# Dimm 4 Data Strobe 11
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[12]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[12]"]
# set_property PACKAGE_PIN       H16             [get_ports "ddr_dqs_n[12]"] ;# Dimm 4 Data Strobe 12
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[13]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[13]"]
# set_property PACKAGE_PIN       K13             [get_ports "ddr_dqs_n[13]"] ;# Dimm 4 Data Strobe 13
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[14]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[14]"]
# set_property PACKAGE_PIN       P16             [get_ports "ddr_dqs_n[14]"] ;# Dimm 4 Data Strobe 14
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[15]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[15]"]
# set_property PACKAGE_PIN       N13             [get_ports "ddr_dqs_n[15]"] ;# Dimm 4 Data Strobe 15
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[16]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[16]"]
# set_property PACKAGE_PIN       N19             [get_ports "ddr_dqs_n[16]"] ;# Dimm 4 Data Strobe 16
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_n[17]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_n[17]"]
# set_property PACKAGE_PIN       M17             [get_ports "ddr_dqs_n[17]"] ;# Dimm 4 Data Strobe 17
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[0]"]
# set_property PACKAGE_PIN       A23             [get_ports "ddr_dqs_p[0]"] ;# Dimm 4 Data Strobe 0
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[1]"]
# set_property PACKAGE_PIN       C22             [get_ports "ddr_dqs_p[1]"] ;# Dimm 4 Data Strobe 1
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[2]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[2]"]
# set_property PACKAGE_PIN       E23             [get_ports "ddr_dqs_p[2]"] ;# Dimm 4 Data Strobe 2
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[3]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[3]"]
# set_property PACKAGE_PIN       G25             [get_ports "ddr_dqs_p[3]"] ;# Dimm 4 Data Strobe 3
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[4]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[4]"]
# set_property PACKAGE_PIN       K25             [get_ports "ddr_dqs_p[4]"] ;# Dimm 4 Data Strobe 4
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[5]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[5]"]
# set_property PACKAGE_PIN       L25             [get_ports "ddr_dqs_p[5]"] ;# Dimm 4 Data Strobe 6
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[6]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[6]"]
# set_property PACKAGE_PIN       P24             [get_ports "ddr_dqs_p[6]"] ;# Dimm 4 Data Strobe 6
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[7]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[7]"]
# set_property PACKAGE_PIN       R21             [get_ports "ddr_dqs_p[7]"] ;# Dimm 4 Data Strobe 7
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[8]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[8]"]
# set_property PACKAGE_PIN       B15             [get_ports "ddr_dqs_p[8]"] ;# Dimm 4 Data Strobe 8
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[9]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[9]"]
# set_property PACKAGE_PIN       D13             [get_ports "ddr_dqs_p[9]"] ;# Dimm 4 Data Strobe 9
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[10]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[10]"]
# set_property PACKAGE_PIN       G17             [get_ports "ddr_dqs_p[10]"] ;# Dimm 4 Data Strobe 10
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[11]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[11]"]
# set_property PACKAGE_PIN       G14             [get_ports "ddr_dqs_p[11]"] ;# Dimm 4 Data Strobe 11
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[12]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[12]"]
# set_property PACKAGE_PIN       H17             [get_ports "ddr_dqs_p[12]"] ;# Dimm 4 Data Strobe 12
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[13]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[13]"]
# set_property PACKAGE_PIN       L13             [get_ports "ddr_dqs_p[13]"] ;# Dimm 4 Data Strobe 13
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[14]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[14]"]
# set_property PACKAGE_PIN       R16             [get_ports "ddr_dqs_p[14]"] ;# Dimm 4 Data Strobe 14
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[15]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[15]"]
# set_property PACKAGE_PIN       P13             [get_ports "ddr_dqs_p[15]"] ;# Dimm 4 Data Strobe 15
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[16]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[16]"]
# set_property PACKAGE_PIN       P19             [get_ports "ddr_dqs_p[16]"] ;# Dimm 4 Data Strobe 16
# set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "ddr_dqs_p[17]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dqs_p[17]"]
# set_property PACKAGE_PIN       N17             [get_ports "ddr_dqs_p[17]"] ;# Dimm 4 Data Strobe 17
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[0]"]
# set_property PACKAGE_PIN       A25             [get_ports "ddr_dq[0]"] ;# Dimm 4 Data Pin 0
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[1]"]
# set_property PACKAGE_PIN       B25             [get_ports "ddr_dq[1]"] ;# Dimm 4 Data Pin 1
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[2]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[2]"]
# set_property PACKAGE_PIN       A24             [get_ports "ddr_dq[2]"] ;# Dimm 4 Data Pin 2
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[3]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[3]"]
# set_property PACKAGE_PIN       B24             [get_ports "ddr_dq[3]"] ;# Dimm 4 Data Pin 3
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[4]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[4]"]
# set_property PACKAGE_PIN       B26             [get_ports "ddr_dq[4]"] ;# Dimm 4 Data Pin 4
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[5]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[5]"]
# set_property PACKAGE_PIN       C26             [get_ports "ddr_dq[5]"] ;# Dimm 4 Data Pin 5
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[6]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[6]"]
# set_property PACKAGE_PIN       C23             [get_ports "ddr_dq[6]"] ;# Dimm 4 Data Pin 6
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[7]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[7]"]
# set_property PACKAGE_PIN       C24             [get_ports "ddr_dq[7]"] ;# Dimm 4 Data Pin 7
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[8]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[8]"]
# set_property PACKAGE_PIN       D25             [get_ports "ddr_dq[8]"] ;# Dimm 4 Data Pin 8
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[9]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[9]"]
# set_property PACKAGE_PIN       E25             [get_ports "ddr_dq[9]"] ;# Dimm 4 Data Pin 9
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[10]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[10]"]
# set_property PACKAGE_PIN       D23             [get_ports "ddr_dq[10]"] ;# Dimm 4 Data Pin 10
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[11]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[11]"]
# set_property PACKAGE_PIN       D24             [get_ports "ddr_dq[11]"] ;# Dimm 4 Data Pin 11
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[12]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[12]"]
# set_property PACKAGE_PIN       F22             [get_ports "ddr_dq[12]"] ;# Dimm 4 Data Pin 12
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[13]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[13]"]
# set_property PACKAGE_PIN       G22             [get_ports "ddr_dq[13]"] ;# Dimm 4 Data Pin 13
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[14]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[14]"]
# set_property PACKAGE_PIN       F23             [get_ports "ddr_dq[14]"] ;# Dimm 4 Data Pin 14
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[15]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[15]"]
# set_property PACKAGE_PIN       F24             [get_ports "ddr_dq[15]"] ;# Dimm 4 Data Pin 15
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[16]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[16]"]
# set_property PACKAGE_PIN       H24             [get_ports "ddr_dq[16]"] ;# Dimm 4 Data Pin 16
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[17]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[17]"]
# set_property PACKAGE_PIN       J24             [get_ports "ddr_dq[17]"] ;# Dimm 4 Data Pin 17
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[18]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[18]"]
# set_property PACKAGE_PIN       H23             [get_ports "ddr_dq[18]"] ;# Dimm 4 Data Pin 18
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[19]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[19]"]
# set_property PACKAGE_PIN       J23             [get_ports "ddr_dq[19]"] ;# Dimm 4 Data Pin 19
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[20]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[20]"]
# set_property PACKAGE_PIN       K23             [get_ports "ddr_dq[20]"] ;# Dimm 4 Data Pin 20
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[21]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[21]"]
# set_property PACKAGE_PIN       L23             [get_ports "ddr_dq[21]"] ;# Dimm 4 Data Pin 21
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[22]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[22]"]
# set_property PACKAGE_PIN       K22             [get_ports "ddr_dq[22]"] ;# Dimm 4 Data Pin 22
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[23]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[23]"]
# set_property PACKAGE_PIN       L22             [get_ports "ddr_dq[23]"] ;# Dimm 4 Data Pin 23
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[24]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[24]"]
# set_property PACKAGE_PIN       P25             [get_ports "ddr_dq[24]"] ;# Dimm 4 Data Pin 24
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[25]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[25]"]
# set_property PACKAGE_PIN       R25             [get_ports "ddr_dq[25]"] ;# Dimm 4 Data Pin 25
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[26]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[26]"]
# set_property PACKAGE_PIN       M24             [get_ports "ddr_dq[26]"] ;# Dimm 4 Data Pin 26
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[27]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[27]"]
# set_property PACKAGE_PIN       M25             [get_ports "ddr_dq[27]"] ;# Dimm 4 Data Pin 27
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[28]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[28]"]
# set_property PACKAGE_PIN       N23             [get_ports "ddr_dq[28]"] ;# Dimm 4 Data Pin 28
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[29]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[29]"]
# set_property PACKAGE_PIN       P23             [get_ports "ddr_dq[29]"] ;# Dimm 4 Data Pin 29
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[30]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[30]"]
# set_property PACKAGE_PIN       M22             [get_ports "ddr_dq[30]"] ;# Dimm 4 Data Pin 30
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[31]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[31]"]
# set_property PACKAGE_PIN       N22             [get_ports "ddr_dq[31]"] ;# Dimm 4 Data Pin 31
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[32]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[32]"]
# set_property PACKAGE_PIN       A17             [get_ports "ddr_dq[32]"] ;# Dimm 4 Data Pin 32
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[33]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[33]"]
# set_property PACKAGE_PIN       B17             [get_ports "ddr_dq[33]"] ;# Dimm 4 Data Pin 33
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[34]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[34]"]
# set_property PACKAGE_PIN       B16             [get_ports "ddr_dq[34]"] ;# Dimm 4 Data Pin 34
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[35]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[35]"]
# set_property PACKAGE_PIN       C16             [get_ports "ddr_dq[35]"] ;# Dimm 4 Data Pin 35
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[36]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[36]"]
# set_property PACKAGE_PIN       A13             [get_ports "ddr_dq[36]"] ;# Dimm 4 Data Pin 36
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[37]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[37]"]
# set_property PACKAGE_PIN       A14             [get_ports "ddr_dq[37]"] ;# Dimm 4 Data Pin 37
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[38]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[38]"]
# set_property PACKAGE_PIN       B14             [get_ports "ddr_dq[38]"] ;# Dimm 4 Data Pin 38
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[39]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[39]"]
# set_property PACKAGE_PIN       C14             [get_ports "ddr_dq[39]"] ;# Dimm 4 Data Pin 39
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[40]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[40]"]
# set_property PACKAGE_PIN       D16             [get_ports "ddr_dq[40]"] ;# Dimm 4 Data Pin 40
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[41]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[41]"]
# set_property PACKAGE_PIN       E16             [get_ports "ddr_dq[41]"] ;# Dimm 4 Data Pin 41
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[42]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[42]"]
# set_property PACKAGE_PIN       D15             [get_ports "ddr_dq[42]"] ;# Dimm 4 Data Pin 42
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[43]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[43]"]
# set_property PACKAGE_PIN       E15             [get_ports "ddr_dq[43]"] ;# Dimm 4 Data Pin 43
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[44]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[44]"]
# set_property PACKAGE_PIN       E13             [get_ports "ddr_dq[44]"] ;# Dimm 4 Data Pin 44
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[45]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[45]"]
# set_property PACKAGE_PIN       F13             [get_ports "ddr_dq[45]"] ;# Dimm 4 Data Pin 45
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[46]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[46]"]
# set_property PACKAGE_PIN       F15             [get_ports "ddr_dq[46]"] ;# Dimm 4 Data Pin 46
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[47]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[47]"]
# set_property PACKAGE_PIN       G15             [get_ports "ddr_dq[47]"] ;# Dimm 4 Data Pin 47
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[48]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[48]"]
# set_property PACKAGE_PIN       J15             [get_ports "ddr_dq[48]"] ;# Dimm 4 Data Pin 48
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[49]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[49]"]
# set_property PACKAGE_PIN       J16             [get_ports "ddr_dq[49]"] ;# Dimm 4 Data Pin 49
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[50]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[50]"]
# set_property PACKAGE_PIN       H14             [get_ports "ddr_dq[50]"] ;# Dimm 4 Data Pin 50
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[51]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[51]"]
# set_property PACKAGE_PIN       J14             [get_ports "ddr_dq[51]"] ;# Dimm 4 Data Pin 51
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[52]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[52]"]
# set_property PACKAGE_PIN       H13             [get_ports "ddr_dq[52]"] ;# Dimm 4 Data Pin 52
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[53]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[53]"]
# set_property PACKAGE_PIN       J13             [get_ports "ddr_dq[53]"] ;# Dimm 4 Data Pin 53
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[54]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[54]"]
# set_property PACKAGE_PIN       K15             [get_ports "ddr_dq[54]"] ;# Dimm 4 Data Pin 54
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[55]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[55]"]
# set_property PACKAGE_PIN       K16             [get_ports "ddr_dq[55]"] ;# Dimm 4 Data Pin 55
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[56]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[56]"]
# set_property PACKAGE_PIN       M16             [get_ports "ddr_dq[56]"] ;# Dimm 4 Data Pin 56
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[57]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[57]"]
# set_property PACKAGE_PIN       N16             [get_ports "ddr_dq[57]"] ;# Dimm 4 Data Pin 57
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[58]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[58]"]
# set_property PACKAGE_PIN       L14             [get_ports "ddr_dq[58]"] ;# Dimm 4 Data Pin 58
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[59]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[59]"]
# set_property PACKAGE_PIN       M14             [get_ports "ddr_dq[59]"] ;# Dimm 4 Data Pin 59
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[60]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[60]"]
# set_property PACKAGE_PIN       P15             [get_ports "ddr_dq[60]"] ;# Dimm 4 Data Pin 60
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[61]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[61]"]
# set_property PACKAGE_PIN       R15             [get_ports "ddr_dq[61]"] ;# Dimm 4 Data Pin 61
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[62]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[62]"]
# set_property PACKAGE_PIN       N14             [get_ports "ddr_dq[62]"] ;# Dimm 4 Data Pin 62
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[63]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[63]"]
# set_property PACKAGE_PIN       P14             [get_ports "ddr_dq[63]"] ;# Dimm 4 Data Pin 63
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[64]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[64]"]
# set_property PACKAGE_PIN       M21             [get_ports "ddr_dq[64]"] ;# Dimm 4 Data Pin 64
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[65]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[65]"]
# set_property PACKAGE_PIN       N21             [get_ports "ddr_dq[65]"] ;# Dimm 4 Data Pin 65
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[66]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[66]"]
# set_property PACKAGE_PIN       P20             [get_ports "ddr_dq[66]"] ;# Dimm 4 Data Pin 66
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[67]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[67]"]
# set_property PACKAGE_PIN       R20             [get_ports "ddr_dq[67]"] ;# Dimm 4 Data Pin 67
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[68]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[68]"]
# set_property PACKAGE_PIN       M19             [get_ports "ddr_dq[68]"] ;# Dimm 4 Data Pin 68
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[69]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[69]"]
# set_property PACKAGE_PIN       M20             [get_ports "ddr_dq[69]"] ;# Dimm 4 Data Pin 69
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[70]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[70]"]
# set_property PACKAGE_PIN       N18             [get_ports "ddr_dq[70]"] ;# Dimm 4 Data Pin 70
# set_property IOSTANDARD        POD12_DCI       [get_ports "ddr_dq[71]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_dq[71]"]
# set_property PACKAGE_PIN       P18             [get_ports "ddr_dq[71]"] ;# Dimm 4 Data Pin 71
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_odt[0]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_odt[0]"]
# set_property PACKAGE_PIN       H21             [get_ports "ddr_odt[0]"] ;# Dimm 4 On Die Termination 0
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_odt[1]"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_odt[1]"]
# set_property PACKAGE_PIN       J20             [get_ports "ddr_odt[1]"] ;# Dimm 4 On Die Termination 1
# set_property IOSTANDARD        SSTL12_DCI      [get_ports "ddr_parity"]
# set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "ddr_parity"]
# set_property PACKAGE_PIN       J19             [get_ports "ddr_parity"] ;# Dimm 4 Parity
# set_property IOSTANDARD        LVCMOS12        [get_ports "ddr_reset_n"]
# set_property PACKAGE_PIN       J19             [get_ports "ddr_reset_n"] ;# Dimm 4 Active Low Reset
# set_property PACKAGE_PIN K18  [get_ports mc_clk_p] ;# Dimm 4 Reference Clock
# set_property PACKAGE_PIN J18  [get_ports mc_clk_n]
# set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports mc_clk_p]
# set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports mc_clk_n]
# set_property ODT RTT_48 [get_ports mc_clk_p]


## False paths
#set_clock_groups -name sync_gr1 -logically_exclusive -group [get_clocks chipset_clk_clk_mmcm] -group [get_clocks -include_generated_clocks mc_sys_clk_clk_mmcm]
