## This file is a general .xdc for the NetFPGA SUME Rev. C
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project
## Note: DDR, QDR, and GTH Transceiver constraints are not included with this document. See applicable reference
##       projects on www.netfpga.org for information on using these components

##The following two properties should be set for every design
set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]

#System Clock signal (200 MHz)
set_property -dict {PACKAGE_PIN G18 IOSTANDARD LVDS} [get_ports fpga_sysclk_n]
set_property -dict {PACKAGE_PIN H19 IOSTANDARD LVDS} [get_ports fpga_sysclk_p]
create_clock -period 5.000 -name sys_clk_pin -waveform {0.000 2.500} -add [get_ports fpga_sysclk_p]

##QDRII_CLK (200 MHz)
## Note: This clock is used by the MIG for the QDRII+ A and B modules. It should not be used for other purposes in designs that use the QDRII+ A and/or B modules  ; #IO_L13N_T2_MRCC_16 Sch=qdrii_sysclk_n, ; #IO_L13P_T2_MRCC_16 Sch=qdrii_sysclk_p
set_property -dict {PACKAGE_PIN AD33 IOSTANDARD LVDS} [get_ports qdrii_sysclk_n]
set_property -dict {PACKAGE_PIN AD32 IOSTANDARD LVDS} [get_ports qdrii_sysclk_p]
create_clock -period 5.000 -name qdr_clk_pin -waveform {0.000 2.500} -add [get_ports qdrii_sysclk_p]

##QDRIIC_CLK (200 MHz)
## Note: This clock is used by the MIG for the QDRII+ C module. It should not be used for other purposes in designs that use the QDRII+ C module, ; #IO_L13P_T2_MRCC_31 Sch=qdriic_sysclk_p,; #IO_L13N_T2_MRCC_31 Sch=qdriic_sysclk_n
#set_property -dict {PACKAGE_PIN AU13  IOSTANDARD LVDS} [get_ports {QDRIIC_SYSCLK_N}]
#set_property -dict {PACKAGE_PIN AU14  IOSTANDARD LVDS} [get_ports {QDRIIC_SYSCLK_P}]
#create_clock -add -name qdrc_clk_pin -period 5.00 -waveform {0 2.5} [get_ports {QDRIIC_SYSCLK_P}];

##DDR_SYS_CLK (233.3333MHz)
## Note: This clock is used by the MIG for the DDR3 SODIMM. It should not be used for other purposes in designs that use the DDR3,  #IO_L13N_T2_MRCC_35 Sch=ddr3_sysclk_n,  #IO_L13P_T2_MRCC_35 Sch=ddr3_sysclk_p
set_property -dict {PACKAGE_PIN E35 IOSTANDARD LVDS} [get_ports ddr_clk_n]
set_property -dict {PACKAGE_PIN E34 IOSTANDARD LVDS} [get_ports ddr_clk_p]
#create_clock -period 4.286 -name ddr_clk_pin -waveform {0.000 2.143} -add [get_ports ddr_clk_p]



##FMC Transceiver clocks (Must be set to value provided by Mezzanine card, currently set to 156.25 MHz)
## Note: This clock is attached to a MGTREFCLK pin
#set_property -dict { PACKAGE_PIN AT7 } [get_ports { FMC_GBTCLK0_N }];
#set_property -dict { PACKAGE_PIN AT8 } [get_ports { FMC_GBTCLK0_P }];
#create_clock -add -name gbtclk0_pin -period 6.400 -waveform {0 3.200} [get_ports {FMC_GBTCLK0_P}];
#set_property -dict { PACKAGE_PIN AU9 } [get_ports { FMC_GBTCLK1_N }];
#set_property -dict { PACKAGE_PIN AU10 } [get_ports { FMC_GBTCLK1_P }];
#create_clock -add -name gbtclk1_pin -period 6.400 -waveform {0 3.200} [get_ports {FMC_GBTCLK1_P}];

#PCIe Transceiver clock (100 MHz)
# Note: This clock is attached to a MGTREFCLK pin
#set_property -dict {PACKAGE_PIN AB7} [get_ports PCIE_CLK_N]
#set_property -dict {PACKAGE_PIN AB8} [get_ports PCIE_CLK_P]
#create_clock -period 10.000 -name pcie_sys_clk [get_pins -hier -filter name=~*IBUFDS_GTE2*/O]
#create_clock -add -name pcie_clk_pin -period 10.000 -waveform {0 5.000} [get_ports {PCIE_CLK_P}];

##SATA Transceiver clock (150 MHz)
## Note: This clock is attached to a MGTREFCLK pin
#set_property -dict { PACKAGE_PIN T7 } [get_ports { SATA_CLK_N }];
#set_property -dict { PACKAGE_PIN T8 } [get_ports { SATA_CLK_P }];
#create_clock -add -name sata_clk_pin -period 6.667 -waveform {0 3.3335 } [get_ports {SATA_CLK_P}];

##SFP/QTH Transceiver clock (Must be set to value provided by Si5324, currently set to 156.25 MHz)
## Note: This clock is attached to a MGTREFCLK pin
set_property -dict {PACKAGE_PIN E9} [get_ports sfp_clk_n]
set_property -dict {PACKAGE_PIN E10} [get_ports sfp_clk_p]
create_clock -period 6.400 -name sfp_clk_pin -waveform {0.000 3.200} -add [get_ports sfp_clk_p]

#BTN
#set_property -dict {PACKAGE_PIN AR13 IOSTANDARD LVCMOS15} [get_ports reset]
#set_property -dict { PACKAGE_PIN BB12  IOSTANDARD LVCMOS15 } [get_ports { BTN[1] }]; #IO_L24N_T3_31 Sch=btn[1]

##LED
#set_property -dict { PACKAGE_PIN AR22  IOSTANDARD LVCMOS15 } [get_ports { LED[0] }]; #IO_L11N_T1_SRCC_33 Sch=led[0]
#set_property -dict { PACKAGE_PIN AR23  IOSTANDARD LVCMOS15 } [get_ports { LED[1] }]; #IO_L11P_T1_SRCC_33 Sch=led[1]

##IIC Mux
#set_property -dict { PACKAGE_PIN AK24  IOSTANDARD LVCMOS18 } [get_ports { I2C_FPGA_SCL }]; #IO_L22P_T3_12 Sch=i2c_fpga_scl
#set_property -dict { PACKAGE_PIN AK25  IOSTANDARD LVCMOS18 } [get_ports { I2C_FPGA_SDA }]; #IO_L22N_T3_12 Sch=i2c_fpga_sda
#set_property -dict { PACKAGE_PIN AM39  IOSTANDARD LVCMOS15 } [get_ports { I2C_MUX_RESET }]; #IO_L6P_T0_15 Sch=i2c_mux_reset

#UART ; #IO_L23P_T3_32 Sch=uart_cts, ; #IO_L23N_T3_32 Sch=uart_rts
set_property -dict {PACKAGE_PIN BA16 IOSTANDARD LVCMOS15} [get_ports uart_cts]
set_property -dict {PACKAGE_PIN BB16 IOSTANDARD LVCMOS15} [get_ports uart_rts]
set_property -dict {PACKAGE_PIN BA19 IOSTANDARD LVCMOS15} [get_ports uart_tx]
set_property -dict {PACKAGE_PIN AY19 IOSTANDARD LVCMOS15} [get_ports uart_rx]
##microSD
set_property -dict {PACKAGE_PIN AW35 IOSTANDARD LVCMOS18} [get_ports sd_cd]
set_property -dict {PACKAGE_PIN AJ26 IOSTANDARD LVCMOS18} [get_ports sd_cmd]
set_property -dict {PACKAGE_PIN AY29 IOSTANDARD LVCMOS18} [get_ports {sd_dat[0]}]
set_property -dict {PACKAGE_PIN AM28 IOSTANDARD LVCMOS18} [get_ports {sd_dat[1]}]
set_property -dict {PACKAGE_PIN AL25 IOSTANDARD LVCMOS18} [get_ports {sd_dat[2]}]
set_property -dict {PACKAGE_PIN AL26 IOSTANDARD LVCMOS18} [get_ports {sd_dat[3]}]
set_property -dict {PACKAGE_PIN AJ25 IOSTANDARD LVCMOS18} [get_ports sd_clk_out]

#set_property -dict { PACKAGE_PIN AJ25  IOSTANDARD LVCMOS18 } [get_ports { SD_CCLK }]; #IO_L24P_T3_12 Sch=sd_cclk
#set_property -dict { PACKAGE_PIN AW35  IOSTANDARD LVCMOS18 } [get_ports { SD_CD }]; #IO_L6P_T0_13 Sch=sd_cd
#set_property -dict { PACKAGE_PIN AJ26  IOSTANDARD LVCMOS18 } [get_ports { SD_CMD }]; #IO_L24N_T3_12 Sch=sd_cmd
#set_property -dict { PACKAGE_PIN AY29  IOSTANDARD LVCMOS18 } [get_ports { SD_D[0] }]; #IO_L6P_T0_12 Sch=sd_d[0]
#set_property -dict { PACKAGE_PIN AM28  IOSTANDARD LVCMOS18 } [get_ports { SD_D[1] }]; #IO_L19P_T3_12 Sch=sd_d[1]
#set_property -dict { PACKAGE_PIN AL25  IOSTANDARD LVCMOS18 } [get_ports { SD_D[2] }]; #IO_L23P_T3_12 Sch=sd_d[2]
#set_property -dict { PACKAGE_PIN AL26  IOSTANDARD LVCMOS18 } [get_ports { SD_D[3] }]; #IO_L23N_T3_12 Sch=sd_d[3]

##Power Status signals
#set_property -dict { PACKAGE_PIN J41   IOSTANDARD LVCMOS15 PULLUP true } [get_ports { PCON_ALERT_B }]; #IO_L11N_T1_SRCC_19 Sch=pcon_alert_b
#set_property -dict { PACKAGE_PIN M41   IOSTANDARD LVCMOS15 PULLUP true } [get_ports { PCON_AUXFAULT_B }]; #IO_L14P_T2_SRCC_19 Sch=pcon_auxfault_b
#set_property -dict { PACKAGE_PIN N40   IOSTANDARD LVCMOS15 PULLUP true } [get_ports { PCON_FAULT }]; #IO_L24N_T3_19 Sch=pcon_fault1
#set_property -dict { PACKAGE_PIN AW42  IOSTANDARD LVCMOS15 PULLUP true } [get_ports { PWR_SNS }]; #IO_L24N_T3_RS0_15 Sch=pwr_sns1

##PCIe Control
#set_property -dict { PACKAGE_PIN AY35  IOSTANDARD LVCMOS18 } [get_ports { PCIE-PERST_B_LS }]; #IO_L6N_T0_VREF_13 Sch=pcie-perst_b_ls
#set_property -dict { PACKAGE_PIN AR35  IOSTANDARD LVCMOS18 } [get_ports { PCIE-PRSNT_B_LS }]; #IO_0_VRN_13 Sch=pcie-prsnt_b_ls
#set_property -dict { PACKAGE_PIN AT31  IOSTANDARD LVCMOS18 } [get_ports { PCIE-WAKE }]; #IO_25_VRP_13 Sch=pcie-wake

#PCIe Transceivers
#set_property -dict { PACKAGE_PIN Y4 } [get_ports { PCIE_TX0_P }];
#set_property -dict { PACKAGE_PIN Y3 } [get_ports { PCIE_TX0_N }];
#set_property -dict { PACKAGE_PIN W2 } [get_ports { PCIE_RX0_P }];
#set_property -dict { PACKAGE_PIN W1 } [get_ports { PCIE_RX0_N }];
#set_property -dict { PACKAGE_PIN AA6 } [get_ports { PCIE_TX1_P }];
#set_property -dict { PACKAGE_PIN AA5 } [get_ports { PCIE_TX1_N }];
#set_property -dict { PACKAGE_PIN AA2 } [get_ports { PCIE_RX1_P }];
#set_property -dict { PACKAGE_PIN AA1 } [get_ports { PCIE_RX1_N }];
#set_property -dict { PACKAGE_PIN AB4 } [get_ports { PCIE_TX2_P }];
#set_property -dict { PACKAGE_PIN AB3 } [get_ports { PCIE_TX2_N }];
#set_property -dict { PACKAGE_PIN AC2 } [get_ports { PCIE_RX2_P }];
#set_property -dict { PACKAGE_PIN AC1 } [get_ports { PCIE_RX2_N }];
#set_property -dict { PACKAGE_PIN AC6 } [get_ports { PCIE_TX3_P }];
#set_property -dict { PACKAGE_PIN AC5 } [get_ports { PCIE_TX3_N }];
#set_property -dict { PACKAGE_PIN AE2 } [get_ports { PCIE_RX3_P }];
#set_property -dict { PACKAGE_PIN AE1 } [get_ports { PCIE_RX3_N }];
#set_property -dict { PACKAGE_PIN AD4 } [get_ports { PCIE_TX4_P }];
#set_property -dict { PACKAGE_PIN AD3 } [get_ports { PCIE_TX4_N }];
#set_property -dict { PACKAGE_PIN AG2 } [get_ports { PCIE_RX4_P }];
#set_property -dict { PACKAGE_PIN AG1 } [get_ports { PCIE_RX4_N }];
#set_property -dict { PACKAGE_PIN AE6 } [get_ports { PCIE_TX5_P }];
#set_property -dict { PACKAGE_PIN AE5 } [get_ports { PCIE_TX5_N }];
#set_property -dict { PACKAGE_PIN AH4 } [get_ports { PCIE_RX5_P }];
#set_property -dict { PACKAGE_PIN AH3 } [get_ports { PCIE_RX5_N }];
#set_property -dict { PACKAGE_PIN AF4 } [get_ports { PCIE_TX6_P }];
#set_property -dict { PACKAGE_PIN AF3 } [get_ports { PCIE_TX6_N }];
#set_property -dict { PACKAGE_PIN AJ2 } [get_ports { PCIE_RX6_P }];
#set_property -dict { PACKAGE_PIN AJ1 } [get_ports { PCIE_RX6_N }];
#set_property -dict { PACKAGE_PIN AG6 } [get_ports { PCIE_TX7_P }];
#set_property -dict { PACKAGE_PIN AG5 } [get_ports { PCIE_TX7_N }];
#set_property -dict { PACKAGE_PIN AK4 } [get_ports { PCIE_RX7_P }];
#set_property -dict { PACKAGE_PIN AK3 } [get_ports { PCIE_RX7_N }];


##SFP Control
set_property LOC GTHE2_CHANNEL_X1Y39 [get_cells -hier -filter name=~*hier_nic_10g_7series*axi_10g_ethernet_0*gthe2_i]

#set_property -dict { PACKAGE_PIN AM29  IOSTANDARD LVCMOS18 } [get_ports { SFP_CLK_ALARM_B }]; #IO_L19N_T3_VREF_12 Sch=sfp_clk_alarm_b
#set_property -dict { PACKAGE_PIN BA29  IOSTANDARD LVCMOS18 } [get_ports { SFP_CLK_RST }]; #IO_L6N_T0_VREF_12 Sch=sfp_clk_rst
#set_property -dict { PACKAGE_PIN AW33  IOSTANDARD LVDS     } [get_ports { SFP_REC_CLK_N }]; #IO_L12N_T1_MRCC_13 Sch=sfp_rec_clk_n
#set_property -dict { PACKAGE_PIN AW32  IOSTANDARD LVDS     } [get_ports { SFP_REC_CLK_P }]; #IO_L12P_T1_MRCC_13 Sch=sfp_rec_clk_p

##SFP Transceivers
#set_property -dict { PACKAGE_PIN A6 IOSTANDARD LVCMOS15} [get_ports { eth1_tx_p }];
#set_property -dict { PACKAGE_PIN A5 IOSTANDARD LVCMOS15} [get_ports { eth1_tx_n }];
#set_property -dict { PACKAGE_PIN B3 IOSTANDARD LVCMOS15} [get_ports { eth1_rx_n }];
#set_property -dict { PACKAGE_PIN B8 IOSTANDARD LVCMOS15 } [get_ports eth2_tx_p];
#set_property -dict { PACKAGE_PIN B7 IOSTANDARD LVCMOS15 } [get_ports eth2_tx_n];
#set_property -dict { PACKAGE_PIN C2 IOSTANDARD LVCMOS15 } [get_ports eth2_rx_p];
#set_property -dict { PACKAGE_PIN C1 IOSTANDARD LVCMOS15 } [get_ports eth2_rx_n];
#set_property -dict { PACKAGE_PIN C6 } [get_ports { ETH3_TX_P }];
#set_property -dict { PACKAGE_PIN C5 } [get_ports { ETH3_TX_N }];
#set_property -dict { PACKAGE_PIN D4 } [get_ports { ETH3_RX_P }];
#set_property -dict { PACKAGE_PIN D3 } [get_ports { ETH3_RX_N }];
#set_property -dict { PACKAGE_PIN D8 } [get_ports { ETH4_TX_P }];
#set_property -dict { PACKAGE_PIN D7 } [get_ports { ETH4_TX_N }];
#set_property -dict { PACKAGE_PIN E2 } [get_ports { ETH4_RX_P }];
#set_property -dict { PACKAGE_PIN E1 } [get_ports { ETH4_RX_N }];

##SFP ETH1 Misc.
#set_property -dict { PACKAGE_PIN N19 IOSTANDARD LVCMOS15 } [get_ports { ETH1_RS[0] }]; #IO_L21P_T3_DQS_38 Sch=eth1_rs[0]
#set_property -dict { PACKAGE_PIN P18 IOSTANDARD LVCMOS15 } [get_ports { ETH1_RS[1] }]; #IO_L19P_T3_38 Sch=eth1_rs[1]
#set_property -dict { PACKAGE_PIN L17 IOSTANDARD LVCMOS15 } [get_ports { ETH1_RX_LOS }]; #IO_L20N_T3_38 Sch=eth1_rx_los
set_property -dict {PACKAGE_PIN N18 IOSTANDARD LVCMOS15} [get_ports eth1_mod_detect]
set_property -dict {PACKAGE_PIN M18 IOSTANDARD LVCMOS15} [get_ports eth1_tx_disable]
set_property -dict {PACKAGE_PIN M19 IOSTANDARD LVCMOS15} [get_ports eth1_tx_fault]


##SFP ETH2 Misc.
#set_property -dict { PACKAGE_PIN AL22  IOSTANDARD LVCMOS15 } [get_ports { eth2_led[0] }]; #IO_L6P_T0_33 Sch=eth2_led[0]
#set_property -dict { PACKAGE_PIN BA20  IOSTANDARD LVCMOS15 } [get_ports { eth2_led[1] }]; #IO_L22N_T3_32 Sch=eth2_led[1]
#set_property -dict { PACKAGE_PIN L19 IOSTANDARD LVCMOS15 } [get_ports { eth2_mod_detect }]; #IO_L24N_T3_38 Sch=eth2_mod_detect
#set_property -dict { PACKAGE_PIN P20 IOSTANDARD LVCMOS15 } [get_ports { eth2_rs[0] }]; #IO_L23P_T3_38 Sch=eth2_rs[0]
#-set_property -dict { PACKAGE_PIN N20 IOSTANDARD LVCMOS15 } [get_ports { eth2_rs[1] }]; #IO_L23N_T3_38 Sch=eth2_rs[1]
#set_property -dict { PACKAGE_PIN L20 IOSTANDARD LVCMOS15 } [get_ports { eth2_rx_los }]; #IO_L24P_T3_38 Sch=eth2_rx_los
#set_property -dict { PACKAGE_PIN B31 IOSTANDARD LVCMOS15 } [get_ports { eth2_tx_disable }]; #IO_L18N_T2_37 Sch=eth2_tx_disable
#set_property -dict { PACKAGE_PIN C26 IOSTANDARD LVCMOS15 } [get_ports { eth2_tx_fault }]; #IO_L12N_T1_MRCC_37 Sch=eth2_tx_fault

##SFP ETH3 Misc.
#set_property -dict { PACKAGE_PIN AY18  IOSTANDARD LVCMOS15 } [get_ports { ETH3_LED[0] }]; #IO_L13P_T2_MRCC_32 Sch=eth3_led[0]
#set_property -dict { PACKAGE_PIN AY17  IOSTANDARD LVCMOS15 } [get_ports { ETH3_LED[1] }]; #IO_L13N_T2_MRCC_32 Sch=eth3_led[1]
#set_property -dict { PACKAGE_PIN J37 IOSTANDARD LVCMOS15 } [get_ports { ETH3_MOD_DETECT }]; #IO_L22P_T3_35 Sch=eth3_mod_detect
#set_property -dict { PACKAGE_PIN F39 IOSTANDARD LVCMOS15 } [get_ports { ETH3_RS[0] }]; #IO_L21P_T3_DQS_35 Sch=eth3_rs[0]
#set_property -dict { PACKAGE_PIN G36 IOSTANDARD LVCMOS15 } [get_ports { ETH3_RS[1] }]; #IO_L20P_T3_35 Sch=eth3_rs[1]
#set_property -dict { PACKAGE_PIN G37 IOSTANDARD LVCMOS15 } [get_ports { ETH3_RX_LOS }]; #IO_L20N_T3_35 Sch=eth3_rx_los
#set_property -dict { PACKAGE_PIN J38 IOSTANDARD LVCMOS15 } [get_ports { ETH3_TX_DISABLE }]; #IO_L22N_T3_35 Sch=eth3_tx_disable
#set_property -dict { PACKAGE_PIN E39 IOSTANDARD LVCMOS15 } [get_ports { ETH3_TX_FAULT }]; #IO_L21N_T3_DQS_35 Sch=eth3_tx_fault

##SFP ETH4 Misc.
#set_property -dict { PACKAGE_PIN P31 IOSTANDARD LVCMOS15 } [get_ports { ETH4_LED[0] }]; #IO_L18N_T2_34 Sch=eth4_led[0]
#set_property -dict { PACKAGE_PIN K32 IOSTANDARD LVCMOS15 } [get_ports { ETH4_LED[1] }]; #IO_L12N_T1_MRCC_34 Sch=eth4_led[1]
#set_property -dict { PACKAGE_PIN H36 IOSTANDARD LVCMOS15 } [get_ports { ETH4_MOD_DETECT }]; #IO_L24N_T3_35 Sch=eth4_mod_detect
#set_property -dict { PACKAGE_PIN H38 IOSTANDARD LVCMOS15 } [get_ports { ETH4_RS[0] }]; #IO_L23P_T3_35 Sch=eth4_rs[0]
#set_property -dict { PACKAGE_PIN G38 IOSTANDARD LVCMOS15 } [get_ports { ETH4_RS[1] }]; #IO_L23N_T3_35 Sch=eth4_rs[1]
#set_property -dict { PACKAGE_PIN J36 IOSTANDARD LVCMOS15 } [get_ports { ETH4_RX_LOS }]; #IO_L24P_T3_35 Sch=eth4_rx_los
#set_property -dict { PACKAGE_PIN L21 IOSTANDARD LVCMOS15 } [get_ports { ETH4_TX_DISABLE }]; #IO_L18N_T2_36 Sch=eth4_tx_disable
#set_property -dict { PACKAGE_PIN J26 IOSTANDARD LVCMOS15 } [get_ports { ETH4_TX_FAULT }]; #IO_L12N_T1_MRCC_36 Sch=eth4_tx_fault

##SATA Transceivers
#set_property -dict { PACKAGE_PIN W6 } [get_ports { SATA0_B_P }];
#set_property -dict { PACKAGE_PIN W5 } [get_ports { SATA0_B_N }];
#set_property -dict { PACKAGE_PIN U2 } [get_ports { SATA0_A_P }];
#set_property -dict { PACKAGE_PIN U1 } [get_ports { SATA0_A_N }];
#set_property -dict { PACKAGE_PIN V4 } [get_ports { SATA1_B_P }];
#set_property -dict { PACKAGE_PIN V3 } [get_ports { SATA1_B_N }];
#set_property -dict { PACKAGE_PIN T4 } [get_ports { SATA1_A_P }];
#set_property -dict { PACKAGE_PIN T3 } [get_ports { SATA1_A_N }];

##FMC
#set_property -dict { PACKAGE_PIN AR30  IOSTANDARD LVCMOS18 } [get_ports { FMC_PRSNT_LS }]; #IO_L19P_T3_13 Sch=fmc_prsnt_ls
#set_property -dict { PACKAGE_PIN AT27  IOSTANDARD LVDS     } [get_ports { FMC_CLK0_M2C_N }]; #IO_L13N_T2_MRCC_12 Sch=fmc_clk0_m2c_n
#set_property -dict { PACKAGE_PIN AR27  IOSTANDARD LVDS     } [get_ports { FMC_CLK0_M2C_P }]; #IO_L13P_T2_MRCC_12 Sch=fmc_clk0_m2c_p
#set_property -dict { PACKAGE_PIN AV35  IOSTANDARD LVDS     } [get_ports { FMC_CLK1_M2C_N }]; #IO_L13N_T2_MRCC_13 Sch=fmc_clk1_m2c_n
#set_property -dict { PACKAGE_PIN AV34  IOSTANDARD LVDS     } [get_ports { FMC_CLK1_M2C_P }]; #IO_L13P_T2_MRCC_13 Sch=fmc_clk1_m2c_p
#set_property -dict { PACKAGE_PIN AV28  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[00] }]; #IO_L11N_T1_SRCC_12 Sch=fmc_la_00_cc_n
#set_property -dict { PACKAGE_PIN AU28  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[00] }]; #IO_L11P_T1_SRCC_12 Sch=fmc_la_00_cc_p
#set_property -dict { PACKAGE_PIN AR28  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[01] }]; #IO_L14N_T2_SRCC_12 Sch=fmc_la_01_cc_n
#set_property -dict { PACKAGE_PIN AP27  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[01] }]; #IO_L14P_T2_SRCC_12 Sch=fmc_la_01_cc_p
#set_property -dict { PACKAGE_PIN AT29  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[02] }]; #IO_L8N_T1_12 Sch=fmc_la__n[02]
#set_property -dict { PACKAGE_PIN AR29  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[02] }]; #IO_L8P_T1_12 Sch=fmc_la__p[02]
#set_property -dict { PACKAGE_PIN BB27  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[03] }]; #IO_L5N_T0_12 Sch=fmc_la__n[03]
#set_property -dict { PACKAGE_PIN BB26  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[03] }]; #IO_L5P_T0_12 Sch=fmc_la__p[03]
#set_property -dict { PACKAGE_PIN BB29  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[04] }]; #IO_L4N_T0_12 Sch=fmc_la__n[04]
#set_property -dict { PACKAGE_PIN BB28  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[04] }]; #IO_L4P_T0_12 Sch=fmc_la__p[04]
#set_property -dict { PACKAGE_PIN AV26  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[05] }]; #IO_L9N_T1_DQS_12 Sch=fmc_la__n[05]
#set_property -dict { PACKAGE_PIN AV25  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[05] }]; #IO_L9P_T1_DQS_12 Sch=fmc_la__p[05]
#set_property -dict { PACKAGE_PIN BA27  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[06] }]; #IO_L3N_T0_DQS_12 Sch=fmc_la__n[06]
#set_property -dict { PACKAGE_PIN BA26  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[06] }]; #IO_L3P_T0_DQS_12 Sch=fmc_la__p[06]
#set_property -dict { PACKAGE_PIN AY28  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[07] }]; #IO_L1N_T0_12 Sch=fmc_la__n[07]
#set_property -dict { PACKAGE_PIN AY27  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[07] }]; #IO_L1P_T0_12 Sch=fmc_la__p[07]
#set_property -dict { PACKAGE_PIN AP28  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[08] }]; #IO_L15N_T2_DQS_12 Sch=fmc_la__n[08]
#set_property -dict { PACKAGE_PIN AN28  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[08] }]; #IO_L15P_T2_DQS_12 Sch=fmc_la__p[08]
#set_property -dict { PACKAGE_PIN AR25  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[09] }]; #IO_L17N_T2_12 Sch=fmc_la__n[09]
#set_property -dict { PACKAGE_PIN AP25  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[09] }]; #IO_L17P_T2_12 Sch=fmc_la__p[09]
#set_property -dict { PACKAGE_PIN AW26  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[10] }]; #IO_L7N_T1_12 Sch=fmc_la__n[10]
#set_property -dict { PACKAGE_PIN AW25  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[10] }]; #IO_L7P_T1_12 Sch=fmc_la__p[10]
#set_property -dict { PACKAGE_PIN AT26  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[11] }]; #IO_L16N_T2_12 Sch=fmc_la__n[11]
#set_property -dict { PACKAGE_PIN AT25  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[11] }]; #IO_L16P_T2_12 Sch=fmc_la__p[11]
#set_property -dict { PACKAGE_PIN AV29  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[12] }]; #IO_L2N_T0_12 Sch=fmc_la__n[12]
#set_property -dict { PACKAGE_PIN AU29  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[12] }]; #IO_L2P_T0_12 Sch=fmc_la__p[12]
#set_property -dict { PACKAGE_PIN AW28  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[13] }]; #IO_L10N_T1_12 Sch=fmc_la__n[13]
#set_property -dict { PACKAGE_PIN AW27  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[13] }]; #IO_L10P_T1_12 Sch=fmc_la__p[13]
#set_property -dict { PACKAGE_PIN AN26  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[14] }]; #IO_L18N_T2_12 Sch=fmc_la__n[14]
#set_property -dict { PACKAGE_PIN AN25  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[14] }]; #IO_L18P_T2_12 Sch=fmc_la__p[14]
#set_property -dict { PACKAGE_PIN AM27  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[15] }]; #IO_L21N_T3_DQS_12 Sch=fmc_la__n[15]
#set_property -dict { PACKAGE_PIN AM26  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[15] }]; #IO_L21P_T3_DQS_12 Sch=fmc_la__p[15]
#set_property -dict { PACKAGE_PIN AL27  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[16] }]; #IO_L20N_T3_12 Sch=fmc_la__n[16]
#set_property -dict { PACKAGE_PIN AK27  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[16] }]; #IO_L20P_T3_12 Sch=fmc_la__p[16]
#set_property -dict { PACKAGE_PIN AY33  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[17] }]; #IO_L14N_T2_SRCC_13 Sch=fmc_la_17_cc_n
#set_property -dict { PACKAGE_PIN AY32  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[17] }]; #IO_L14P_T2_SRCC_13 Sch=fmc_la_17_cc_p
#set_property -dict { PACKAGE_PIN AV33  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[18] }]; #IO_L11N_T1_SRCC_13 Sch=fmc_la_18_cc_n
#set_property -dict { PACKAGE_PIN AU32  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[18] }]; #IO_L11P_T1_SRCC_13 Sch=fmc_la_18_cc_p
#set_property -dict { PACKAGE_PIN AW31  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[19] }]; #IO_L18N_T2_13 Sch=fmc_la__n[19]
#set_property -dict { PACKAGE_PIN AV30  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[19] }]; #IO_L18P_T2_13 Sch=fmc_la__p[19]
#set_property -dict { PACKAGE_PIN AY30  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[20] }]; #IO_L16N_T2_13 Sch=fmc_la__n[20]
#set_property -dict { PACKAGE_PIN AW30  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[20] }]; #IO_L16P_T2_13 Sch=fmc_la__p[20]
#set_property -dict { PACKAGE_PIN BB31  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[21] }]; #IO_L17N_T2_13 Sch=fmc_la__n[21]
#set_property -dict { PACKAGE_PIN BA30  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[21] }]; #IO_L17P_T2_13 Sch=fmc_la__p[21]
#set_property -dict { PACKAGE_PIN BA32  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[22] }]; #IO_L15N_T2_DQS_13 Sch=fmc_la__n[22]
#set_property -dict { PACKAGE_PIN BA31  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[22] }]; #IO_L15P_T2_DQS_13 Sch=fmc_la__p[22]
#set_property -dict { PACKAGE_PIN BB34  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[23] }]; #IO_L3N_T0_DQS_13 Sch=fmc_la__n[23]
#set_property -dict { PACKAGE_PIN BA34  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[23] }]; #IO_L3P_T0_DQS_13 Sch=fmc_la__p[23]
#set_property -dict { PACKAGE_PIN AU34  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[24] }]; #IO_L7N_T1_13 Sch=fmc_la__n[24]
#set_property -dict { PACKAGE_PIN AT34  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[24] }]; #IO_L7P_T1_13 Sch=fmc_la__p[24]
#set_property -dict { PACKAGE_PIN AU33  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[25] }]; #IO_L9N_T1_DQS_13 Sch=fmc_la__n[25]
#set_property -dict { PACKAGE_PIN AT32  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[25] }]; #IO_L9P_T1_DQS_13 Sch=fmc_la__p[25]
#set_property -dict { PACKAGE_PIN BB33  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[26] }]; #IO_L5N_T0_13 Sch=fmc_la__n[26]
#set_property -dict { PACKAGE_PIN BB32  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[26] }]; #IO_L5P_T0_13 Sch=fmc_la__p[26]
#set_property -dict { PACKAGE_PIN AV31  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[27] }]; #IO_L20N_T3_13 Sch=fmc_la__n[27]
#set_property -dict { PACKAGE_PIN AU31  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[27] }]; #IO_L20P_T3_13 Sch=fmc_la__p[27]
#set_property -dict { PACKAGE_PIN AT35  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[28] }]; #IO_L10N_T1_13 Sch=fmc_la__n[28]
#set_property -dict { PACKAGE_PIN AR34  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[28] }]; #IO_L10P_T1_13 Sch=fmc_la__p[28]
#set_property -dict { PACKAGE_PIN BB36  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[29] }]; #IO_L4N_T0_13 Sch=fmc_la__n[29]
#set_property -dict { PACKAGE_PIN BA36  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[29] }]; #IO_L4P_T0_13 Sch=fmc_la__p[29]
#set_property -dict { PACKAGE_PIN BA35  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[30] }]; #IO_L1N_T0_13 Sch=fmc_la__n[30]
#set_property -dict { PACKAGE_PIN AY34  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[30] }]; #IO_L1P_T0_13 Sch=fmc_la__p[30]
#set_property -dict { PACKAGE_PIN AP30  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[31] }]; #IO_L21N_T3_DQS_13 Sch=fmc_la__n[31]
#set_property -dict { PACKAGE_PIN AN30  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[31] }]; #IO_L21P_T3_DQS_13 Sch=fmc_la__p[31]
#set_property -dict { PACKAGE_PIN AW36  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[32] }]; #IO_L2N_T0_13 Sch=fmc_la__n[32]
#set_property -dict { PACKAGE_PIN AV36  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[32] }]; #IO_L2P_T0_13 Sch=fmc_la__p[32]
#set_property -dict { PACKAGE_PIN AU36  IOSTANDARD LVDS     } [get_ports { FMC_LA_N[33] }]; #IO_L8N_T1_13 Sch=fmc_la__n[33]
#set_property -dict { PACKAGE_PIN AT36  IOSTANDARD LVDS     } [get_ports { FMC_LA_P[33] }]; #IO_L8P_T1_13 Sch=fmc_la__p[33]

##FMC Transceiver pins
#set_property -dict { PACKAGE_PIN AW6 } [get_ports { FMC_DP0_M2C_P }];
#set_property -dict { PACKAGE_PIN AW5 } [get_ports { FMC_DP0_M2C_N }];
#set_property -dict { PACKAGE_PIN AW2 } [get_ports { FMC_DP0_C2M_P }];
#set_property -dict { PACKAGE_PIN AW1 } [get_ports { FMC_DP0_C2M_N }];
#set_property -dict { PACKAGE_PIN AY8 } [get_ports { FMC_DP1_M2C_P }];
#set_property -dict { PACKAGE_PIN AY7 } [get_ports { FMC_DP1_M2C_N }];
#set_property -dict { PACKAGE_PIN AY4 } [get_ports { FMC_DP1_C2M_P }];
#set_property -dict { PACKAGE_PIN AY3 } [get_ports { FMC_DP1_C2M_N }];
#set_property -dict { PACKAGE_PIN BA6 } [get_ports { FMC_DP2_M2C_P }];
#set_property -dict { PACKAGE_PIN BA5 } [get_ports { FMC_DP2_M2C_N }];
#set_property -dict { PACKAGE_PIN BA2 } [get_ports { FMC_DP2_C2M_P }];
#set_property -dict { PACKAGE_PIN BA1 } [get_ports { FMC_DP2_C2M_N }];
#set_property -dict { PACKAGE_PIN BB8 } [get_ports { FMC_DP3_M2C_P }];
#set_property -dict { PACKAGE_PIN BB7 } [get_ports { FMC_DP3_M2C_N }];
#set_property -dict { PACKAGE_PIN BB4 } [get_ports { FMC_DP3_C2M_P }];
#set_property -dict { PACKAGE_PIN BB3 } [get_ports { FMC_DP3_C2M_N }];
#set_property -dict { PACKAGE_PIN AR6 } [get_ports { FMC_DP4_M2C_P }];
#set_property -dict { PACKAGE_PIN AR5 } [get_ports { FMC_DP4_M2C_N }];
#set_property -dict { PACKAGE_PIN AT4 } [get_ports { FMC_DP4_C2M_P }];
#set_property -dict { PACKAGE_PIN AT3 } [get_ports { FMC_DP4_C2M_N }];
#set_property -dict { PACKAGE_PIN AV8 } [get_ports { FMC_DP5_M2C_P }];
#set_property -dict { PACKAGE_PIN AV7 } [get_ports { FMC_DP5_M2C_N }];
#set_property -dict { PACKAGE_PIN AV4 } [get_ports { FMC_DP5_C2M_P }];
#set_property -dict { PACKAGE_PIN AV3 } [get_ports { FMC_DP5_C2M_N }];
#set_property -dict { PACKAGE_PIN AU6 } [get_ports { FMC_DP6_M2C_P }];
#set_property -dict { PACKAGE_PIN AU5 } [get_ports { FMC_DP6_M2C_N }];
#set_property -dict { PACKAGE_PIN AU2 } [get_ports { FMC_DP6_C2M_P }];
#set_property -dict { PACKAGE_PIN AU1 } [get_ports { FMC_DP6_C2M_N }];
#set_property -dict { PACKAGE_PIN AP8 } [get_ports { FMC_DP7_M2C_P }];
#set_property -dict { PACKAGE_PIN AP7 } [get_ports { FMC_DP7_M2C_N }];
#set_property -dict { PACKAGE_PIN AR2 } [get_ports { FMC_DP7_C2M_P }];
#set_property -dict { PACKAGE_PIN AR1 } [get_ports { FMC_DP7_C2M_N }];
#set_property -dict { PACKAGE_PIN AN6 } [get_ports { FMC_DP8_M2C_P }];
#set_property -dict { PACKAGE_PIN AN5 } [get_ports { FMC_DP8_M2C_N }];
#set_property -dict { PACKAGE_PIN AP4 } [get_ports { FMC_DP8_C2M_P }];
#set_property -dict { PACKAGE_PIN AP3 } [get_ports { FMC_DP8_C2M_N }];
#set_property -dict { PACKAGE_PIN AM8 } [get_ports { FMC_DP9_M2C_P }];
#set_property -dict { PACKAGE_PIN AM7 } [get_ports { FMC_DP9_M2C_N }];
#set_property -dict { PACKAGE_PIN AN2 } [get_ports { FMC_DP9_C2M_P }];
#set_property -dict { PACKAGE_PIN AN1 } [get_ports { FMC_DP9_C2M_N }];

##FMC Transceiver pins
#set_property -dict { PACKAGE_PIN P8 } [get_ports { QTH_01T_P }];
#set_property -dict { PACKAGE_PIN P7 } [get_ports { QTH_01T_N }];
#set_property -dict { PACKAGE_PIN N2 } [get_ports { QTH_01R_P }];
#set_property -dict { PACKAGE_PIN N1 } [get_ports { QTH_01R_N }];
#set_property -dict { PACKAGE_PIN N6 } [get_ports { QTH_02T_P }];
#set_property -dict { PACKAGE_PIN N5 } [get_ports { QTH_02T_N }];
#set_property -dict { PACKAGE_PIN M4 } [get_ports { QTH_02R_P }];
#set_property -dict { PACKAGE_PIN M3 } [get_ports { QTH_02R_N }];
#set_property -dict { PACKAGE_PIN L6 } [get_ports { QTH_03T_P }];
#set_property -dict { PACKAGE_PIN L5 } [get_ports { QTH_03T_N }];
#set_property -dict { PACKAGE_PIN L2 } [get_ports { QTH_03R_P }];
#set_property -dict { PACKAGE_PIN L1 } [get_ports { QTH_03R_N }];
#set_property -dict { PACKAGE_PIN J6 } [get_ports { QTH_04T_P }];
#set_property -dict { PACKAGE_PIN J5 } [get_ports { QTH_04T_N }];
#set_property -dict { PACKAGE_PIN K4 } [get_ports { QTH_04R_P }];
#set_property -dict { PACKAGE_PIN K3 } [get_ports { QTH_04R_N }];
#set_property -dict { PACKAGE_PIN H8 } [get_ports { QTH_05T_P }];
#set_property -dict { PACKAGE_PIN H7 } [get_ports { QTH_05T_N }];
#set_property -dict { PACKAGE_PIN J2 } [get_ports { QTH_05R_P }];
#set_property -dict { PACKAGE_PIN J1 } [get_ports { QTH_05R_N }];
#set_property -dict { PACKAGE_PIN G6 } [get_ports { QTH_06T_P }];
#set_property -dict { PACKAGE_PIN G5 } [get_ports { QTH_06T_N }];
#set_property -dict { PACKAGE_PIN H4 } [get_ports { QTH_06R_P }];
#set_property -dict { PACKAGE_PIN H3 } [get_ports { QTH_06R_N }];
#set_property -dict { PACKAGE_PIN F8 } [get_ports { QTH_07T_P }];
#set_property -dict { PACKAGE_PIN F7 } [get_ports { QTH_07T_N }];
#set_property -dict { PACKAGE_PIN G2 } [get_ports { QTH_07R_P }];
#set_property -dict { PACKAGE_PIN G1 } [get_ports { QTH_07R_N }];
#set_property -dict { PACKAGE_PIN E6 } [get_ports { QTH_08T_P }];
#set_property -dict { PACKAGE_PIN E5 } [get_ports { QTH_08T_N }];
#set_property -dict { PACKAGE_PIN F4 } [get_ports { QTH_08R_P }];
#set_property -dict { PACKAGE_PIN F3 } [get_ports { QTH_08R_N }];

##Pmod Control pins
#set_property -dict { PACKAGE_PIN C40   IOSTANDARD LVCMOS15 } [get_ports { PMOD_OE_B }]; #IO_L6P_T0_19 Sch=pmod_oe_b
#set_property -dict { PACKAGE_PIN AT16  IOSTANDARD LVCMOS15 } [get_ports { DIR_JA[0] }]; #IO_L18P_T2_32 Sch=dir_ja[1]
#set_property -dict { PACKAGE_PIN AU16  IOSTANDARD LVCMOS15 } [get_ports { DIR_JA[1] }]; #IO_L18N_T2_32 Sch=dir_ja[2]
#set_property -dict { PACKAGE_PIN BB19  IOSTANDARD LVCMOS15 } [get_ports { DIR_JA[2] }]; #IO_L19P_T3_32 Sch=dir_ja[3]
#set_property -dict { PACKAGE_PIN AV20  IOSTANDARD LVCMOS15 } [get_ports { DIR_JA[3] }]; #IO_L20P_T3_32 Sch=dir_ja[4]
#set_property -dict { PACKAGE_PIN AW20  IOSTANDARD LVCMOS15 } [get_ports { DIR_JA[4] }]; #IO_L20N_T3_32 Sch=dir_ja[7]
#set_property -dict { PACKAGE_PIN BA17  IOSTANDARD LVCMOS15 } [get_ports { DIR_JA[5] }]; #IO_L21P_T3_DQS_32 Sch=dir_ja[8]
#set_property -dict { PACKAGE_PIN BB17  IOSTANDARD LVCMOS15 } [get_ports { DIR_JA[6] }]; #IO_L21N_T3_DQS_32 Sch=dir_ja[9]
#set_property -dict { PACKAGE_PIN AY20  IOSTANDARD LVCMOS15 } [get_ports { DIR_JA[7] }]; #IO_L22P_T3_32 Sch=dir_ja[10]

##Pmod Data pins
#set_property -dict { PACKAGE_PIN AW18  IOSTANDARD LVCMOS15 } [get_ports { JA_FPGA[0] }]; #IO_L14P_T2_SRCC_32 Sch=ja1_fpga
#set_property -dict { PACKAGE_PIN AW17  IOSTANDARD LVCMOS15 } [get_ports { JA_FPGA[1] }]; #IO_L14N_T2_SRCC_32 Sch=ja2_fpga
#set_property -dict { PACKAGE_PIN AU19  IOSTANDARD LVCMOS15 } [get_ports { JA_FPGA[2] }]; #IO_L15P_T2_DQS_32 Sch=ja3_fpga
#set_property -dict { PACKAGE_PIN AV19  IOSTANDARD LVCMOS15 } [get_ports { JA_FPGA[3] }]; #IO_L15N_T2_DQS_32 Sch=ja4_fpga
#set_property -dict { PACKAGE_PIN AT20  IOSTANDARD LVCMOS15 } [get_ports { JA_FPGA[4] }]; #IO_L16P_T2_32 Sch=ja7_fpga
#set_property -dict { PACKAGE_PIN AT19  IOSTANDARD LVCMOS15 } [get_ports { JA_FPGA[5] }]; #IO_L16N_T2_32 Sch=ja8_fpga
#set_property -dict { PACKAGE_PIN AV16  IOSTANDARD LVCMOS15 } [get_ports { JA_FPGA[6] }]; #IO_L17P_T2_32 Sch=ja9_fpga
#set_property -dict { PACKAGE_PIN AW16  IOSTANDARD LVCMOS15 } [get_ports { JA_FPGA[7] }]; #IO_L17N_T2_32 Sch=ja10_fpga

##Fan Control
#set_property -dict { PACKAGE_PIN AN34  IOSTANDARD LVCMOS18 } [get_ports { FAN_PWM }]; #IO_L15N_T2_DQS_DOUT_CSO_B_14 Sch=fan_pwm
#set_property -dict { PACKAGE_PIN AP32  IOSTANDARD LVCMOS18 } [get_ports { FAN_TACH }]; #IO_L22P_T3_13 Sch=fan_tach

##Unloaded Si570 Programmable Oscillator
#set_property -dict { PACKAGE_PIN AU27  IOSTANDARD LVDS     } [get_ports { USERCLK_N }]; #IO_L12N_T1_MRCC_12 Sch=userclk_n
#set_property -dict { PACKAGE_PIN AU26  IOSTANDARD LVDS     } [get_ports { USERCLK_P }]; #IO_L12P_T1_MRCC_12 Sch=userclk_p

##CPLD Triggered reconfiguration pins
#set_property -dict { PACKAGE_PIN AP31  IOSTANDARD LVCMOS18 } [get_ports { CPLD_IMGSEL[0] }]; #IO_L23N_T3_13 Sch=cpld_imgsel[0]
#set_property -dict { PACKAGE_PIN AP33  IOSTANDARD LVCMOS18 } [get_ports { CPLD_IMGSEL[1] }]; #IO_L24P_T3_13 Sch=cpld_imgsel[1]
#set_property -dict { PACKAGE_PIN AR33  IOSTANDARD LVCMOS18 } [get_ports { CPLD_IMGSEL[2] }]; #IO_L24N_T3_13 Sch=cpld_imgsel[2]
#set_property -dict { PACKAGE_PIN AK32  IOSTANDARD LVCMOS18 } [get_ports { CPLD_RECONFIG }]; #IO_L13N_T2_MRCC_14 Sch=cpld_reconfig

##CPLD Flash programming pins
## Note: these pins should not be used in your design. They are included for reference only.
#set_property -dict { PACKAGE_PIN AH35  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A_CE_B }]; #IO_0_VRN_14 Sch=cpld_a_ce_b
#set_property -dict { PACKAGE_PIN AM31  IOSTANDARD LVCMOS18 } [get_ports { CPLD_CSI_B }]; #IO_L16P_T2_CSI_B_14 Sch=cpld_csi_b
#set_property -dict { PACKAGE_PIN AP36  IOSTANDARD LVCMOS18 } [get_ports { CPLD_ADV_B }]; #IO_L3P_T0_DQS_PUDC_B_14 Sch=cpld_adv_b
#set_property -dict { PACKAGE_PIN AJ32  IOSTANDARD LVCMOS18 } [get_ports { CPLD_B_CE_B }]; #IO_L13P_T2_MRCC_14 Sch=cpld_b_ce_b
#set_property -dict { PACKAGE_PIN AG32  IOSTANDARD LVCMOS18 } [get_ports { CPLD_OE_B }]; #IO_25_VRP_14 Sch=cpld_oe_b
#set_property -dict { PACKAGE_PIN AN31  IOSTANDARD LVCMOS18 } [get_ports { CPLD_PROGREQ }]; #IO_L23P_T3_13 Sch=cpld_progreq
#set_property -dict { PACKAGE_PIN AR32  IOSTANDARD LVCMOS18 } [get_ports { CPLD_RST_B }]; #IO_L22N_T3_13 Sch=cpld_rst_b
#set_property -dict { PACKAGE_PIN AT30  IOSTANDARD LVCMOS18 } [get_ports { CPLD_WE_B }]; #IO_L19N_T3_VREF_13 Sch=cpld_we_b
#set_property -dict { PACKAGE_PIN AM36  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A_DQ[0] }]; #IO_L1P_T0_D00_MOSI_14 Sch=cpld_a_dq[0]
#set_property -dict { PACKAGE_PIN AN36  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A_DQ[1] }]; #IO_L1N_T0_D01_DIN_14 Sch=cpld_a_dq[1]
#set_property -dict { PACKAGE_PIN AJ36  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A_DQ[2] }]; #IO_L2P_T0_D02_14 Sch=cpld_a_dq[2]
#set_property -dict { PACKAGE_PIN AJ37  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A_DQ[3] }]; #IO_L2N_T0_D03_14 Sch=cpld_a_dq[3]
#set_property -dict { PACKAGE_PIN AK37  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A_DQ[4] }]; #IO_L4P_T0_D04_14 Sch=cpld_a_dq[4]
#set_property -dict { PACKAGE_PIN AL37  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A_DQ[5] }]; #IO_L4N_T0_D05_14 Sch=cpld_a_dq[5]
#set_property -dict { PACKAGE_PIN AN35  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A_DQ[6] }]; #IO_L5P_T0_D06_14 Sch=cpld_a_dq[6]
#set_property -dict { PACKAGE_PIN AP35  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A_DQ[7] }]; #IO_L5N_T0_D07_14 Sch=cpld_a_dq[7]
#set_property -dict { PACKAGE_PIN AM37  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A_DQ[8] }]; #IO_L6N_T0_D08_VREF_14 Sch=cpld_a_dq[8]
#set_property -dict { PACKAGE_PIN AG33  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A_DQ[9] }]; #IO_L7P_T1_D09_14 Sch=cpld_a_dq[9]
#set_property -dict { PACKAGE_PIN AH33  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A_DQ[10] }]; #IO_L7N_T1_D10_14 Sch=cpld_a_dq[10]
#set_property -dict { PACKAGE_PIN AK35  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A_DQ[11] }]; #IO_L8P_T1_D11_14 Sch=cpld_a_dq[11]
#set_property -dict { PACKAGE_PIN AL35  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A_DQ[12] }]; #IO_L8N_T1_D12_14 Sch=cpld_a_dq[12]
#set_property -dict { PACKAGE_PIN AJ31  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A_DQ[13] }]; #IO_L9N_T1_DQS_D13_14 Sch=cpld_a_dq[13]
#set_property -dict { PACKAGE_PIN AH34  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A_DQ[14] }]; #IO_L10P_T1_D14_14 Sch=cpld_a_dq[14]
#set_property -dict { PACKAGE_PIN AJ35  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A_DQ[15] }]; #IO_L10N_T1_D15_14 Sch=cpld_a_dq[15]
#set_property -dict { PACKAGE_PIN AP37  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A[16] }]; #IO_L3N_T0_DQS_EMCCLK_14 Sch=cpld_a[16]
#set_property -dict { PACKAGE_PIN AL36  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A[17] }]; #IO_L6P_T0_FCS_B_14 Sch=cpld_a[17]
#set_property -dict { PACKAGE_PIN AH31  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A[18] }]; #IO_L9P_T1_DQS_14 Sch=cpld_a[18]
#set_property -dict { PACKAGE_PIN AJ33  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A[19] }]; #IO_L11P_T1_SRCC_14 Sch=cpld_a[19]
#set_property -dict { PACKAGE_PIN AK33  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A[20] }]; #IO_L11N_T1_SRCC_14 Sch=cpld_a[20]
#set_property -dict { PACKAGE_PIN AK34  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A[21] }]; #IO_L12P_T1_MRCC_14 Sch=cpld_a[21]
#set_property -dict { PACKAGE_PIN AL34  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A[22] }]; #IO_L12N_T1_MRCC_14 Sch=cpld_a[22]
#set_property -dict { PACKAGE_PIN AL31  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A[23] }]; #IO_L14P_T2_SRCC_14 Sch=cpld_a[23]
#set_property -dict { PACKAGE_PIN AL32  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A[24] }]; #IO_L14N_T2_SRCC_14 Sch=cpld_a[24]
#set_property -dict { PACKAGE_PIN AF29  IOSTANDARD LVCMOS18 } [get_ports { CPLD_A[25] }]; #IO_L21P_T3_DQS_14 Sch=cpld_a[25]
#set_property -dict { PACKAGE_PIN AJ28  IOSTANDARD LVCMOS18 } [get_ports { CPLD_B_DQ[0] }]; #IO_L24N_T3_A00_D16_14 Sch=cpld_b_dq[0]
#set_property -dict { PACKAGE_PIN AH28  IOSTANDARD LVCMOS18 } [get_ports { CPLD_B_DQ[1] }]; #IO_L24P_T3_A01_D17_14 Sch=cpld_b_dq[1]
#set_property -dict { PACKAGE_PIN AG31  IOSTANDARD LVCMOS18 } [get_ports { CPLD_B_DQ[2] }]; #IO_L23N_T3_A02_D18_14 Sch=cpld_b_dq[2]
#set_property -dict { PACKAGE_PIN AF30  IOSTANDARD LVCMOS18 } [get_ports { CPLD_B_DQ[3] }]; #IO_L23P_T3_A03_D19_14 Sch=cpld_b_dq[3]
#set_property -dict { PACKAGE_PIN AK29  IOSTANDARD LVCMOS18 } [get_ports { CPLD_B_DQ[4] }]; #IO_L22N_T3_A04_D20_14 Sch=cpld_b_dq[4]
#set_property -dict { PACKAGE_PIN AK28  IOSTANDARD LVCMOS18 } [get_ports { CPLD_B_DQ[5] }]; #IO_L22P_T3_A05_D21_14 Sch=cpld_b_dq[5]
#set_property -dict { PACKAGE_PIN AG29  IOSTANDARD LVCMOS18 } [get_ports { CPLD_B_DQ[6] }]; #IO_L21N_T3_DQS_A06_D22_14 Sch=cpld_b_dq[6]
#set_property -dict { PACKAGE_PIN AK30  IOSTANDARD LVCMOS18 } [get_ports { CPLD_B_DQ[7] }]; #IO_L20N_T3_A07_D23_14 Sch=cpld_b_dq[7]
#set_property -dict { PACKAGE_PIN AJ30  IOSTANDARD LVCMOS18 } [get_ports { CPLD_B_DQ[8] }]; #IO_L20P_T3_A08_D24_14 Sch=cpld_b_dq[8]
#set_property -dict { PACKAGE_PIN AH30  IOSTANDARD LVCMOS18 } [get_ports { CPLD_B_DQ[9] }]; #IO_L19N_T3_A09_D25_VREF_14 Sch=cpld_b_dq[9]
#set_property -dict { PACKAGE_PIN AH29  IOSTANDARD LVCMOS18 } [get_ports { CPLD_B_DQ[10] }]; #IO_L19P_T3_A10_D26_14 Sch=cpld_b_dq[10]
#set_property -dict { PACKAGE_PIN AL30  IOSTANDARD LVCMOS18 } [get_ports { CPLD_B_DQ[11] }]; #IO_L18N_T2_A11_D27_14 Sch=cpld_b_dq[11]
#set_property -dict { PACKAGE_PIN AL29  IOSTANDARD LVCMOS18 } [get_ports { CPLD_B_DQ[12] }]; #IO_L18P_T2_A12_D28_14 Sch=cpld_b_dq[12]
#set_property -dict { PACKAGE_PIN AN33  IOSTANDARD LVCMOS18 } [get_ports { CPLD_B_DQ[13] }]; #IO_L17N_T2_A13_D29_14 Sch=cpld_b_dq[13]
#set_property -dict { PACKAGE_PIN AM33  IOSTANDARD LVCMOS18 } [get_ports { CPLD_B_DQ[14] }]; #IO_L17P_T2_A14_D30_14 Sch=cpld_b_dq[14]
#set_property -dict { PACKAGE_PIN AM32  IOSTANDARD LVCMOS18 } [get_ports { CPLD_B_DQ[15] }]; #IO_L16N_T2_A15_D31_14 Sch=cpld_b_dq[15]































