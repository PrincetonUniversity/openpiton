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
#set_property IOSTANDARD LVDS [get_ports chipset_clk_osc_p]
#set_property PACKAGE_PIN H19 [get_ports chipset_clk_osc_p]
#set_property PACKAGE_PIN G18 [get_ports chipset_clk_osc_n]
#set_property IOSTANDARD LVDS [get_ports chipset_clk_osc_n]

#set_property CLOCK_DEDICATED_ROUTE BACKBONE [ get_nets chipset/clk_mmcm/inst/clk_in1_clk_mmcm]

# Reset
#set_property IOSTANDARD LVCMOS33 [ get_ports sys_rst_n]
#set_property PACKAGE_PIN R19 [ get_ports sys_rst_n]

# False paths
set_false_path -to [get_cells -hierarchical *afifo_ui_rst_r*]
set_false_path -to [get_cells -hierarchical *ui_clk_sync_rst_r*]
set_false_path -to [get_cells -hierarchical *ui_clk_syn_rst_delayed*]
#set_false_path -to [ get_cells -hierarchical *init_calib_complete_f*]
#set_false_path -to [ get_cells -hierarchical *chipset_rst_n*]
#set_false_path -from [ get_clocks chipset_clk_clk_mmcm] -to [ get_clocks net_axi_clk_clk_mmcm]
#set_false_path -from [ get_clocks net_axi_clk_clk_mmcm] -to [ get_clocks chipset_clk_clk_mmcm]
set_false_path -from [get_pins chipset/chipset_impl/mc_top/axi_xbar_block_design_wrapper/axi_cross_bare_block_design_i/hier_nic_10g_7series/nic_axi_dma/U0/I_AXI_DMA_REG_MODULE/GEN_MM2S_REGISTERS.GEN_INTROUT_ASYNC.PROC_REG_INTR2LITE/GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4/C]
set_false_path -from [get_pins chipset/chipset_impl/mc_top/axi_xbar_block_design_wrapper/axi_cross_bare_block_design_i/hier_nic_10g_7series/nic_axi_dma/U0/I_AXI_DMA_REG_MODULE/GEN_S2MM_REGISTERS.GEN_INTROUT_ASYNC.PROC_REG_INTR2LITE/GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4/C]
set_false_path -to [get_pins chipset/chipset_impl/sync_fasttoslow_s2mm/*]
## To use FTDI FT2232 JTAG
## Add some additional constraints for JTAG signals, set to 10MHz to be on the safe side

#set_input_delay -clock tck_i -clock_fall 5.000 [ get_ports td_i]
#set_input_delay -clock tck_i -clock_fall 5.000 [ get_ports tms_i]
#set_false_path -from [ get_ports trst_ni]

# constrain clock domain crossing
#set_max_delay -datapath_only -from [ get_clocks -include_generated_clocks chipset_clk_clk_mmcm] -to [ get_clocks tck_i] 15.000
#set_max_delay -datapath_only -from [ get_clocks tck_i] -to [ get_clocks -include_generated_clocks chipset_clk_clk_mmcm] 15.000

#set_property -dict {PACKAGE_PIN Y29 IOSTANDARD LVCMOS33} [ get_ports trst_ni]
#set_property -dict {PACKAGE_PIN P10 IOSTANDARD LVCMOS18} [ get_ports tck_i]
#set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS18} [ get_ports td_i]
#set_property -dict {PACKAGE_PIN R10 IOSTANDARD LVCMOS18} [ get_ports td_o]
#set_property -dict {PACKAGE_PIN P11 IOSTANDARD LVCMOS18} [ get_ports tms_i]

#### UART
#IO_L11N_T1_SRCC_35 Sch=uart_rxd_out
#set_property IOSTANDARD LVCMOS33 [ get_ports uart_rx]
#set_property PACKAGE_PIN Y20 [ get_ports uart_rx]
#set_property -dict {PACKAGE_PIN BA19 IOSTANDARD LVCMOS15} [get_ports uart_tx]
#set_property IOSTANDARD LVCMOS33 [ get_ports uart_tx]
#set_property PACKAGE_PIN Y23 [ get_ports uart_tx]
#set_property -dict {PACKAGE_PIN AY19 IOSTANDARD LVCMOS15} [get_ports uart_rx]
#set_property IOSTANDARD LVCMOS33 [ get_ports uart_cts]
#set_property -dict {PACKAGE_PIN BA16 IOSTANDARD LVCMOS15} [get_ports uart_cts]
#set_property IOSTANDARD LVCMOS33 [ get_ports uart_rts]
#set_property -dict {PACKAGE_PIN BB16 IOSTANDARD LVCMOS15} [get_ports uart_rts]

# Switches
#set_property IOSTANDARD LVCMOS33 [ get_ports {sw[7]}]
#set_property PACKAGE_PIN P27 [ get_ports {sw[7]}]
#set_property IOSTANDARD LVCMOS33 [ get_ports {sw[6]}]
#set_property PACKAGE_PIN P26 [ get_ports {sw[6]}]
#set_property IOSTANDARD LVCMOS12 [ get_ports {sw[5]}]
#set_property PACKAGE_PIN P19 [ get_ports {sw[5]}]
#set_property IOSTANDARD LVCMOS12 [ get_ports {sw[4]}]
#set_property PACKAGE_PIN N19 [ get_ports {sw[4]}]
#set_property IOSTANDARD LVCMOS12 [ get_ports {sw[3]}]
#set_property PACKAGE_PIN K19 [ get_ports {sw[3]}]
#set_property IOSTANDARD LVCMOS12 [ get_ports {sw[2]}]
#set_property PACKAGE_PIN H24 [ get_ports {sw[2]}]
#set_property IOSTANDARD LVCMOS12 [ get_ports {sw[1]}]
#set_property PACKAGE_PIN G25 [ get_ports {sw[1]}]
#set_property IOSTANDARD LVCMOS12 [ get_ports {sw[0]}]
#set_property PACKAGE_PIN G19 [ get_ports {sw[0]}]
#
# Loopback control for UART
#set_property IOSTANDARD LVCMOS12 [ get_ports uart_lb_sw]
#set_property PACKAGE_PIN G19 [ get_ports uart_lb_sw]

# Soft reset
#set_property IOSTANDARD LVCMOS12 [ get_ports pin_soft_rst]
#set_property PACKAGE_PIN E18 [ get_ports pin_soft_rst]

# SD
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN R28 DRIVE 16 SLEW FAST} [ get_ports sd_clk_out]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN R29} [ get_ports sd_cmd]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN R26} [ get_ports {sd_dat[0]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN R30} [ get_ports {sd_dat[1]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN P29} [ get_ports {sd_dat[2]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T30} [ get_ports {sd_dat[3]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN AE24} [ get_ports sd_reset]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN P28} [ get_ports sd_cd]
#

#set_property -dict { PACKAGE_PIN AJ25  IOSTANDARD LVCMOS18 } [ get_ports { sd_clk_out }]; #IO_L24P_T3_12 Sch=sd_cclk
set_property -dict {PACKAGE_PIN AW35 IOSTANDARD LVCMOS18} [get_ports sd_cd]
set_property -dict {PACKAGE_PIN AJ26 IOSTANDARD LVCMOS18} [get_ports sd_cmd]
set_property -dict {PACKAGE_PIN AY29 IOSTANDARD LVCMOS18} [get_ports {sd_dat[0]}]
set_property -dict {PACKAGE_PIN AM28 IOSTANDARD LVCMOS18} [get_ports {sd_dat[1]}]
set_property -dict {PACKAGE_PIN AL25 IOSTANDARD LVCMOS18} [get_ports {sd_dat[2]}]
set_property -dict {PACKAGE_PIN AL26 IOSTANDARD LVCMOS18} [get_ports {sd_dat[3]}]

## LEDs

set_property -dict {PACKAGE_PIN AR22 IOSTANDARD LVCMOS15} [get_ports {leds[0]}]
set_property -dict {PACKAGE_PIN AR23 IOSTANDARD LVCMOS15} [get_ports {leds[1]}]


#set_property PACKAGE_PIN T28 [ get_ports {leds[0]}]
#set_property IOSTANDARD LVCMOS33 [ get_ports {leds[0]}]
#set_property PACKAGE_PIN V19 [ get_ports {leds[1]}]
#set_property IOSTANDARD LVCMOS33 [ get_ports {leds[1]}]
#set_property PACKAGE_PIN U30 [ get_ports {leds[2]}]
#set_property IOSTANDARD LVCMOS33 [ get_ports {leds[2]}]
#set_property PACKAGE_PIN U29 [ get_ports {leds[3]}]
#set_property IOSTANDARD LVCMOS33 [ get_ports {leds[3]}]
#set_property PACKAGE_PIN V20 [ get_ports {leds[4]}]
#set_property IOSTANDARD LVCMOS33 [ get_ports {leds[4]}]
#set_property PACKAGE_PIN V26 [ get_ports {leds[5]}]
#set_property IOSTANDARD LVCMOS33 [ get_ports {leds[5]}]
#set_property PACKAGE_PIN W24 [ get_ports {leds[6]}]
#set_property IOSTANDARD LVCMOS33 [ get_ports {leds[6]}]
#set_property PACKAGE_PIN W23 [ get_ports {leds[7]}]
#set_property IOSTANDARD LVCMOS33 [ get_ports {leds[7]}]


## OLED
#set_property -dict { PACKAGE_PIN AC17 IOSTANDARD LVCMOS18 } [ get_ports oled_dc]
#set_property -dict { PACKAGE_PIN AB17 IOSTANDARD LVCMOS18 } [ get_ports oled_rst_n]
#set_property -dict { PACKAGE_PIN AF17 IOSTANDARD LVCMOS18 } [ get_ports oled_sclk]
#set_property -dict { PACKAGE_PIN Y15 IOSTANDARD LVCMOS18 }  [ get_ports oled_data]
#set_property -dict { PACKAGE_PIN AB22 IOSTANDARD LVCMOS18 } [ get_ports oled_vbat_n]
#set_property -dict { PACKAGE_PIN AG17 IOSTANDARD LVCMOS18 } [ get_ports oled_vdd_n]

## Buttons
#set_property PACKAGE_PIN M20 [ get_ports btnl]
#set_property IOSTANDARD LVCMOS12 [ get_ports btnl]
#set_property PACKAGE_PIN C19 [ get_ports btnr]
#set_property IOSTANDARD LVCMOS12 [ get_ports btnr]
#set_property PACKAGE_PIN M19 [ get_ports btnd]
#set_property IOSTANDARD LVCMOS12 [ get_ports btnd]
#set_property PACKAGE_PIN B19 [ get_ports btnu]
#set_property IOSTANDARD LVCMOS12 [ get_ports btnu]

## Ethernet

# NOTUSED? set_property PACKAGE_PIN AK16 [ get_ports net_ip2intc_irpt]
# NOTUSED? set_property IOSTANDARD LVCMOS18 [ get_ports net_ip2intc_irpt]
# NOTUSED? set_property PULLUP true [ get_ports net_ip2intc_irpt]
#set_property PACKAGE_PIN AF12 [ get_ports net_phy_mdc]
#set_property IOSTANDARD LVCMOS15 [ get_ports net_phy_mdc]
#set_property PACKAGE_PIN AG12 [ get_ports net_phy_mdio_io]
#set_property IOSTANDARD LVCMOS15 [ get_ports net_phy_mdio_io]
#set_property PACKAGE_PIN AH24 [ get_ports net_phy_rst_n]
#set_property IOSTANDARD LVCMOS33 [ get_ports net_phy_rst_n]
#set_property -dict { PACKAGE_PIN AK15  IOSTANDARD LVCMOS18 } [ get_ports { ETH_PMEB }]; #IO_L1N_T0_32 Sch=eth_pmeb
#set_property PACKAGE_PIN AG10 [ get_ports net_phy_rxc]
#set_property IOSTANDARD LVCMOS15 [ get_ports net_phy_rxc]
#set_property PACKAGE_PIN AH11 [ get_ports net_phy_rxctl]
#set_property IOSTANDARD LVCMOS15 [ get_ports net_phy_rxctl]
#set_property PACKAGE_PIN AJ14 [ get_ports {net_phy_rxd[0]}]
#set_property IOSTANDARD LVCMOS15 [ get_ports {net_phy_rxd[0]}]
#set_property PACKAGE_PIN AH14 [ get_ports {net_phy_rxd[1]}]
#set_property IOSTANDARD LVCMOS15 [ get_ports {net_phy_rxd[1]}]
#set_property PACKAGE_PIN AK13 [ get_ports {net_phy_rxd[2]}]
#set_property IOSTANDARD LVCMOS15 [ get_ports {net_phy_rxd[2]}]
#set_property PACKAGE_PIN AJ13 [ get_ports {net_phy_rxd[3]}]
#set_property IOSTANDARD LVCMOS15 [ get_ports {net_phy_rxd[3]}]
#set_property PACKAGE_PIN AE10 [ get_ports net_phy_txc]
#set_property IOSTANDARD LVCMOS15 [ get_ports net_phy_txc]
#set_property PACKAGE_PIN AJ12 [ get_ports {net_phy_txd[0]}]
#set_property IOSTANDARD LVCMOS15 [ get_ports {net_phy_txd[0]}]
#set_property PACKAGE_PIN AK11 [ get_ports {net_phy_txd[1]}]
#set_property IOSTANDARD LVCMOS15 [ get_ports {net_phy_txd[1]}]
#set_property PACKAGE_PIN AJ11 [ get_ports {net_phy_txd[2]}]
#set_property IOSTANDARD LVCMOS15 [ get_ports {net_phy_txd[2]}]
#set_property PACKAGE_PIN AK10 [ get_ports {net_phy_txd[3]}]
#set_property IOSTANDARD LVCMOS15 [ get_ports {net_phy_txd[3]}]
#set_property PACKAGE_PIN AK14 [ get_ports net_phy_txctl]
#set_property IOSTANDARD LVCMOS15 [ get_ports net_phy_txctl]

### False paths
#set_clock_groups -name sync_gr1 -logically_exclusive -group [ get_clocks chipset_clk_clk_mmcm] -group [ get_clocks -include_generated_clocks mc_sys_clk_clk_mmcm]


###############################################################

#set_property LOC ILOGIC_X1Y119 [ get_cells {chipset/chipset_impl/mc_top/mig_7series_0/u_mig_7series_0_mig/u_memc_ui_top_std/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/gen_dqs_iobuf_HP.gen_dqs_iobuf[2].gen_dqs_diff.u_iddr_edge_det/u_phase_detector}]
#set_property PACKAGE_PIN AG2 [ get_ports {ddr_dqs_p[2]}]
#set_property PACKAGE_PIN AH1 [ get_ports {ddr_dqs_n[2]}]

set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]

#############################################
# Ethernet Constraints for 100 Mb/s
#############################################

######### Input constraints
# hint from here: https://forums.xilinx.com/t5/Timing-Analysis/XDC-constraints-Source-Synchronous-ADC-DDR/td-p/292807
#create_clock -period 40.000 -name net_phy_rxc_virt
# conservatively assuming +/- 2ns skew of rxd/rxctl
#create_clock -period 40.000 -name net_phy_rxc -waveform {2.000 22.000} [ get_ports net_phy_rxc]
#set_clock_groups -asynchronous -group [ get_clocks chipset_clk_clk_mmcm] -group [ get_clocks net_phy_rxc]
#set_input_delay -clock [ get_clocks net_phy_rxc_virt] -min -add_delay 0.000 [ get_ports {net_phy_rxd[*]}]
#set_input_delay -clock [ get_clocks net_phy_rxc_virt] -max -add_delay 4.000 [ get_ports {net_phy_rxd[*]}]
#set_input_delay -clock [ get_clocks net_phy_rxc_virt] -clock_fall -min -add_delay 0.000 [ get_ports net_phy_rxctl]
#set_input_delay -clock [ get_clocks net_phy_rxc_virt] -clock_fall -max -add_delay 4.000 [ get_ports net_phy_rxctl]
#set_input_delay -clock [ get_clocks net_phy_rxc_virt] -min -add_delay 0.000 [ get_ports net_phy_rxctl]
#set_input_delay -clock [ get_clocks net_phy_rxc_virt] -max -add_delay 4.000 [ get_ports net_phy_rxctl]

########## Output Constraints
#create_generated_clock -name net_phy_txc -source [ get_pins chipset/net_phy_txc_oddr/C] -divide_by 1 -invert [ get_ports net_phy_txc]

#############################################
# SD Card Constraints for 25MHz
#############################################
create_generated_clock -name sd_fast_clk -source [get_pins chipset/chipset_impl/sd_clk_gen/sd_clk] -divide_by 2 [get_pins chipset/chipset_impl/piton_sd_top/sdc_controller/clock_divider0/fast_clk_reg/Q]
create_generated_clock -name sd_slow_clk -source [get_pins chipset/chipset_impl/sd_clk_gen/sd_clk] -divide_by 200 [get_pins chipset/chipset_impl/piton_sd_top/sdc_controller/clock_divider0/slow_clk_reg/Q]
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
#
## hold slow (spec requires minimum 5ns), note that data is launched on falling edge, so 0.0 is ok here
set_output_delay -clock [get_clocks sd_clk_out_1] -min -add_delay -8.000 [get_ports {sd_dat[*]}]
set_output_delay -clock [get_clocks sd_clk_out_1] -min -add_delay -8.000 [get_ports sd_cmd]
#
## setup slow (spec requires minimum 5ns)
set_output_delay -clock [get_clocks sd_clk_out_1] -max -add_delay 8.000 [get_ports {sd_dat[*]}]
set_output_delay -clock [get_clocks sd_clk_out_1] -max -add_delay 8.000 [get_ports sd_cmd]
#
##################
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
#
#################
# clock groups

set_clock_groups -physically_exclusive -group [get_clocks -include_generated_clocks sd_clk_out] -group [get_clocks -include_generated_clocks sd_clk_out_1]
set_clock_groups -logically_exclusive -group [get_clocks -include_generated_clocks sd_fast_clk] -group [get_clocks -include_generated_clocks sd_slow_clk]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks chipset_clk_sd_clk_gen] -group [get_clocks -filter { NAME =~  "*sd*" }]



###############
##DDR3 SIGNALS
###############
#set_property PACKAGE_PIN M11 [get_ports {ddr_dq[0]}]
#set_property PACKAGE_PIN M12 [get_ports {ddr_dq[1]}]
#set_property PACKAGE_PIN N14 [get_ports {ddr_dq[2]}]
#set_property PACKAGE_PIN M14 [get_ports {ddr_dq[3]}]
#set_property PACKAGE_PIN N13 [get_ports {ddr_dq[4]}]
#set_property PACKAGE_PIN L12 [get_ports {ddr_dq[5]}]
#set_property PACKAGE_PIN L14 [get_ports {ddr_dq[6]}]
#set_property PACKAGE_PIN N15 [get_ports {ddr_dq[7]}]
#set_property PACKAGE_PIN K15 [get_ports {ddr_dq[8]}]
#set_property PACKAGE_PIN K14 [get_ports {ddr_dq[9]}]
#set_property PACKAGE_PIN H14 [get_ports {ddr_dq[10]}]
#set_property PACKAGE_PIN L16 [get_ports {ddr_dq[11]}]
#set_property PACKAGE_PIN K13 [get_ports {ddr_dq[12]}]
#set_property PACKAGE_PIN H13 [get_ports {ddr_dq[13]}]
#set_property PACKAGE_PIN H15 [get_ports {ddr_dq[14]}]
#set_property PACKAGE_PIN J15 [get_ports {ddr_dq[15]}]
#set_property PACKAGE_PIN E14 [get_ports {ddr_dq[16]}]
#set_property PACKAGE_PIN F15 [get_ports {ddr_dq[17]}]
#set_property PACKAGE_PIN F16 [get_ports {ddr_dq[18]}]
#set_property PACKAGE_PIN E15 [get_ports {ddr_dq[19]}]
#set_property PACKAGE_PIN G12 [get_ports {ddr_dq[20]}]
#set_property PACKAGE_PIN F12 [get_ports {ddr_dq[21]}]
#set_property PACKAGE_PIN E13 [get_ports {ddr_dq[22]}]
#set_property PACKAGE_PIN F14 [get_ports {ddr_dq[23]}]
#set_property PACKAGE_PIN D15 [get_ports {ddr_dq[24]}]
#set_property PACKAGE_PIN D16 [get_ports {ddr_dq[25]}]
#set_property PACKAGE_PIN B16 [get_ports {ddr_dq[26]}]
#set_property PACKAGE_PIN C16 [get_ports {ddr_dq[27]}]
#set_property PACKAGE_PIN E12 [get_ports {ddr_dq[28]}]
#set_property PACKAGE_PIN C13 [get_ports {ddr_dq[29]}]
#set_property PACKAGE_PIN B14 [get_ports {ddr_dq[30]}]
#set_property PACKAGE_PIN D13 [get_ports {ddr_dq[31]}]
#set_property PACKAGE_PIN C24 [get_ports {ddr_dq[32]}]
#set_property PACKAGE_PIN A25 [get_ports {ddr_dq[33]}]
#set_property PACKAGE_PIN B26 [get_ports {ddr_dq[34]}]
#set_property PACKAGE_PIN B27 [get_ports {ddr_dq[35]}]
#set_property PACKAGE_PIN B22 [get_ports {ddr_dq[36]}]
#set_property PACKAGE_PIN A22 [get_ports {ddr_dq[37]}]
#set_property PACKAGE_PIN C23 [get_ports {ddr_dq[38]}]
#set_property PACKAGE_PIN A24 [get_ports {ddr_dq[39]}]
#set_property PACKAGE_PIN D25 [get_ports {ddr_dq[40]}]
#set_property PACKAGE_PIN C25 [get_ports {ddr_dq[41]}]
#set_property PACKAGE_PIN E24 [get_ports {ddr_dq[42]}]
#set_property PACKAGE_PIN E23 [get_ports {ddr_dq[43]}]
#set_property PACKAGE_PIN D22 [get_ports {ddr_dq[44]}]
#set_property PACKAGE_PIN D23 [get_ports {ddr_dq[45]}]
#set_property PACKAGE_PIN E22 [get_ports {ddr_dq[46]}]
#set_property PACKAGE_PIN F22 [get_ports {ddr_dq[47]}]
#set_property PACKAGE_PIN A29 [get_ports {ddr_dq[48]}]
#set_property PACKAGE_PIN A30 [get_ports {ddr_dq[49]}]
#set_property PACKAGE_PIN A32 [get_ports {ddr_dq[50]}]
#set_property PACKAGE_PIN D28 [get_ports {ddr_dq[51]}]
#set_property PACKAGE_PIN C28 [get_ports {ddr_dq[52]}]
#set_property PACKAGE_PIN C29 [get_ports {ddr_dq[53]}]
#set_property PACKAGE_PIN D27 [get_ports {ddr_dq[54]}]
#set_property PACKAGE_PIN C31 [get_ports {ddr_dq[55]}]
#set_property PACKAGE_PIN D30 [get_ports {ddr_dq[56]}]
#set_property PACKAGE_PIN E30 [get_ports {ddr_dq[57]}]
#set_property PACKAGE_PIN C30 [get_ports {ddr_dq[58]}]
#set_property PACKAGE_PIN F30 [get_ports {ddr_dq[59]}]
#set_property PACKAGE_PIN F27 [get_ports {ddr_dq[60]}]
#set_property PACKAGE_PIN F26 [get_ports {ddr_dq[61]}]
#set_property PACKAGE_PIN F29 [get_ports {ddr_dq[62]}]
#set_property PACKAGE_PIN E29 [get_ports {ddr_dq[63]}]
####################
#set_property PACKAGE_PIN N16 [get_ports {ddr_dqs_p[0]}]
#set_property PACKAGE_PIN M16 [get_ports {ddr_dqs_n[0]}]
#set_property PACKAGE_PIN K12 [get_ports {ddr_dqs_p[1]}]
#set_property PACKAGE_PIN J12 [get_ports {ddr_dqs_n[1]}]
#set_property PACKAGE_PIN H16 [get_ports {ddr_dqs_p[2]}]
#set_property PACKAGE_PIN G16 [get_ports {ddr_dqs_n[2]}]
#set_property PACKAGE_PIN C15 [get_ports {ddr_dqs_p[3]}]
#set_property PACKAGE_PIN C14 [get_ports {ddr_dqs_n[3]}]
#set_property PACKAGE_PIN A26 [get_ports {ddr_dqs_p[4]}]
#set_property PACKAGE_PIN A27 [get_ports {ddr_dqs_n[4]}]
#set_property PACKAGE_PIN F25 [get_ports {ddr_dqs_p[5]}]
#set_property PACKAGE_PIN E25 [get_ports {ddr_dqs_n[5]}]
#set_property PACKAGE_PIN B28 [get_ports {ddr_dqs_p[6]}]
#set_property PACKAGE_PIN B29 [get_ports {ddr_dqs_n[6]}]
#set_property PACKAGE_PIN E27 [get_ports {ddr_dqs_p[7]}]
#set_property PACKAGE_PIN E28 [get_ports {ddr_dqs_n[7]}]
###################
#set_property PACKAGE_PIN G17 [get_ports {ddr_addr[0]}]
#set_property PACKAGE_PIN J20 [get_ports {ddr_addr[1]}]
#set_property PACKAGE_PIN H18 [get_ports {ddr_addr[2]}]
#set_property PACKAGE_PIN D21 [get_ports {ddr_addr[3]}]
#set_property PACKAGE_PIN D18 [get_ports {ddr_addr[4]}]
#set_property PACKAGE_PIN C21 [get_ports {ddr_addr[5]}]
#set_property PACKAGE_PIN J17 [get_ports {ddr_addr[6]}]
#set_property PACKAGE_PIN E17 [get_ports {ddr_addr[7]}]
#set_property PACKAGE_PIN B21 [get_ports {ddr_addr[8]}]
#set_property PACKAGE_PIN A19 [get_ports {ddr_addr[9]}]
#set_property PACKAGE_PIN E20 [get_ports {ddr_addr[10]}]
#set_property PACKAGE_PIN A17 [get_ports {ddr_addr[11]}]
#set_property PACKAGE_PIN K19 [get_ports {ddr_addr[12]}]
#set_property PACKAGE_PIN C20 [get_ports {ddr_addr[13]}]
#set_property PACKAGE_PIN F17 [get_ports {ddr_addr[14]}]
#set_property PACKAGE_PIN K17 [get_ports {ddr_addr[15]}]
###################
#set_property PACKAGE_PIN F20 [get_ports {ddr_ba[0]}]
#set_property PACKAGE_PIN D17 [get_ports {ddr_ba[1]}]
#set_property PACKAGE_PIN B19 [get_ports {ddr_ba[2]}]
###################
#set_property PACKAGE_PIN D20 [get_ports ddr_cas_n]
###################
#set_property PACKAGE_PIN G19 [get_ports {ddr_ck_p[0]}]
#set_property PACKAGE_PIN F19 [get_ports {ddr_ck_n[0]}]
##############
#set_property PACKAGE_PIN M17 [get_ports {ddr_cke[0]}]
######
#set_property PACKAGE_PIN M13 [get_ports {ddr_dm[0]}]
#set_property PACKAGE_PIN J13 [get_ports {ddr_dm[1]}]
#set_property PACKAGE_PIN G14 [get_ports {ddr_dm[2]}]
#set_property PACKAGE_PIN A14 [get_ports {ddr_dm[3]}]
#set_property PACKAGE_PIN B23 [get_ports {ddr_dm[4]}]
#set_property PACKAGE_PIN D26 [get_ports {ddr_dm[5]}]
#set_property PACKAGE_PIN A31 [get_ports {ddr_dm[6]}]
#set_property PACKAGE_PIN F31 [get_ports {ddr_dm[7]}]
######

#set_property IOSTANDARD SSTL15 [get_ports {ddr_odt[0]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr_odt[1]}]
#set_property PACKAGE_PIN J18 [get_ports {ddr_odt[0]}]
#set_property PACKAGE_PIN C18 [get_ports {ddr_odt[1]}]
######
#set_property PACKAGE_PIN B17 [get_ports ddr_ras_n]
######
#set_property PACKAGE_PIN A15 [get_ports ddr_reset_n]
#####
#set_property PACKAGE_PIN H20 [get_ports ddr_we_n]

###############################
#set_property DONT_TOUCH true [ get_nets {sys_rst_n} ]
###############################
#set_property VCCAUX_IO DONTCARE [ get_ports {mc_clk_p}]
#set_property IOSTANDARD LVDS [get_ports mc_clk_p]

# PadFunction: IO_L13N_T2_MRCC_35
#set_property VCCAUX_IO DONTCARE [ get_ports {mc_clk_n}]
#set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets chipset/chipset_impl/mc_top/mig_7series_0/u_mig_7series_0_mig/u_ddr3_clk_ibuf/sys_clk_ibufg]

#set_property IOSTANDARD LVDS [get_ports mc_clk_n]
#set_property PACKAGE_PIN E34 [get_ports mc_clk_p]
#set_property PACKAGE_PIN E35 [get_ports mc_clk_n]

# PadFunction: IO_L13P_T2_MRCC_38
#set_property VCCAUX_IO DONTCARE [ get_ports {clk_ref_p}]
#set_property IOSTANDARD DIFF_SSTL15 [ get_ports {clk_ref_p}]
#set_property -dict {PACKAGE_PIN AD32 IOSTANDARD LVDS} [ get_ports {qdrii_sysclk_p}]
#set_property -dict {PACKAGE_PIN AD32 IOSTANDARD LVDS} [get_ports qdrii_sysclk_p]

# PadFunction: IO_L13N_T2_MRCC_38
#set_property VCCAUX_IO DONTCARE [ get_ports {clk_ref_n}]
#set_property IOSTANDARD DIFF_SSTL15 [ get_ports {clk_ref_n}]
#set_property -dict {PACKAGE_PIN AD33 IOSTANDARD LVDS} [ get_ports {qdrii_sysclk_n}]
#set_property -dict {PACKAGE_PIN AD33 IOSTANDARD LVDS} [get_ports qdrii_sysclk_n]

#set_property -dict {PACKAGE_PIN AB7} [ get_ports pcie_clk_n ]
#set_property -dict {PACKAGE_PIN AB8} [ get_ports pcie_clk_p ]

































