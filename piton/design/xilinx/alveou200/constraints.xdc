# Bitstream Configuration
# ------------------------------------------------------------------------
set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property BITSTREAM.CONFIG.CONFIGFALLBACK Enable [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 63.8 [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN disable [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR Yes [current_design]
# ------------------------------------------------------------------------

# Don't time the GPIO reset signals
set_false_path -from [get_pins -hier *Not_Dual.gpio_Data_Out_reg*/C]



# 156.25MHz General purpose system clock
set_property PACKAGE_PIN AU19 [get_ports chipset_clk_osc_p]
set_property PACKAGE_PIN AV19 [get_ports chipset_clk_osc_n]

set_property IOSTANDARD LVDS [get_ports chipset_clk*]


set_property PACKAGE_PIN AL20 [get_ports resetn]
set_property IOSTANDARD LVCMOS12 [get_ports resetn]


# UART
set_property PACKAGE_PIN BF18 [get_ports uart_rx]
set_property PACKAGE_PIN BB20 [get_ports uart_tx]
set_property IOSTANDARD LVCMOS12 [get_ports uart_*]

##
## PCIe MGTY Interface
##
set_property PACKAGE_PIN BD21 [get_ports pcie_perstn]
set_property IOSTANDARD LVCMOS12 [get_ports pcie_perstn]

set_property PACKAGE_PIN BC2 [get_ports {pci_express_x16_rxp[15]}]
set_property PACKAGE_PIN BC1 [get_ports {pci_express_x16_rxn[15]}]
set_property PACKAGE_PIN BF5 [get_ports {pci_express_x16_txp[15]}]
set_property PACKAGE_PIN BF4 [get_ports {pci_express_x16_txn[15]}]
set_property PACKAGE_PIN BA2 [get_ports {pci_express_x16_rxp[14]}]
set_property PACKAGE_PIN BA1 [get_ports {pci_express_x16_rxn[14]}]
set_property PACKAGE_PIN BD5 [get_ports {pci_express_x16_txp[14]}]
set_property PACKAGE_PIN BD4 [get_ports {pci_express_x16_txn[14]}]
set_property PACKAGE_PIN AW4 [get_ports {pci_express_x16_rxp[13]}]
set_property PACKAGE_PIN AW3 [get_ports {pci_express_x16_rxn[13]}]
set_property PACKAGE_PIN BB5 [get_ports {pci_express_x16_txp[13]}]
set_property PACKAGE_PIN BB4 [get_ports {pci_express_x16_txn[13]}]
set_property PACKAGE_PIN AV2 [get_ports {pci_express_x16_rxp[12]}]
set_property PACKAGE_PIN AV1 [get_ports {pci_express_x16_rxn[12]}]
set_property PACKAGE_PIN AV7 [get_ports {pci_express_x16_txp[12]}]
set_property PACKAGE_PIN AV6 [get_ports {pci_express_x16_txn[12]}]
# Clock
set_property PACKAGE_PIN AM10 [get_ports pcie_refclk_clk_n]
set_property PACKAGE_PIN AM11 [get_ports pcie_refclk_clk_p]

set_property PACKAGE_PIN AU4 [get_ports {pci_express_x16_rxp[11]}]
set_property PACKAGE_PIN AU3 [get_ports {pci_express_x16_rxn[11]}]
set_property PACKAGE_PIN AU9 [get_ports {pci_express_x16_txp[11]}]
set_property PACKAGE_PIN AU8 [get_ports {pci_express_x16_txn[11]}]
set_property PACKAGE_PIN AT2 [get_ports {pci_express_x16_rxp[10]}]
set_property PACKAGE_PIN AT1 [get_ports {pci_express_x16_rxn[10]}]
set_property PACKAGE_PIN AT7 [get_ports {pci_express_x16_txp[10]}]
set_property PACKAGE_PIN AT6 [get_ports {pci_express_x16_txn[10]}]
set_property PACKAGE_PIN AP2 [get_ports {pci_express_x16_rxp[8]}]
set_property PACKAGE_PIN AP1 [get_ports {pci_express_x16_rxn[8]}]
set_property PACKAGE_PIN AP7 [get_ports {pci_express_x16_txp[8]}]
set_property PACKAGE_PIN AP6 [get_ports {pci_express_x16_txn[8]}]
set_property PACKAGE_PIN AR4 [get_ports {pci_express_x16_rxp[9]}]
set_property PACKAGE_PIN AR3 [get_ports {pci_express_x16_rxn[9]}]
set_property PACKAGE_PIN AR9 [get_ports {pci_express_x16_txp[9]}]
set_property PACKAGE_PIN AR8 [get_ports {pci_express_x16_txn[9]}]
set_property PACKAGE_PIN AN4 [get_ports {pci_express_x16_rxp[7]}]
set_property PACKAGE_PIN AN3 [get_ports {pci_express_x16_rxn[7]}]
set_property PACKAGE_PIN AN9 [get_ports {pci_express_x16_txp[7]}]
set_property PACKAGE_PIN AN8 [get_ports {pci_express_x16_txn[7]}]
set_property PACKAGE_PIN AM2 [get_ports {pci_express_x16_rxp[6]}]
set_property PACKAGE_PIN AM1 [get_ports {pci_express_x16_rxn[6]}]
set_property PACKAGE_PIN AM7 [get_ports {pci_express_x16_txp[6]}]
set_property PACKAGE_PIN AM6 [get_ports {pci_express_x16_txn[6]}]
set_property PACKAGE_PIN AL4 [get_ports {pci_express_x16_rxp[5]}]
set_property PACKAGE_PIN AL3 [get_ports {pci_express_x16_rxn[5]}]
set_property PACKAGE_PIN AL9 [get_ports {pci_express_x16_txp[5]}]
set_property PACKAGE_PIN AL8 [get_ports {pci_express_x16_txn[5]}]
set_property PACKAGE_PIN AK2 [get_ports {pci_express_x16_rxp[4]}]
set_property PACKAGE_PIN AK1 [get_ports {pci_express_x16_rxn[4]}]
set_property PACKAGE_PIN AK7 [get_ports {pci_express_x16_txp[4]}]
set_property PACKAGE_PIN AK6 [get_ports {pci_express_x16_txn[4]}]
#set_property PACKAGE_PIN AL14             [get_ports {pcie_clk0_n} ]                       ;# Bank 227 - MGTREFCLK0N_227
#set_property PACKAGE_PIN AL15             [get_ports {pcie_clk0_n} ]                       ;# Bank 227 - MGTREFCLK0P_227
#set_property PACKAGE_PIN AK12             [get_ports {sys_clk2_n} ]                        ;# Bank 227 - MGTREFCLK1N_227
#set_property PACKAGE_PIN AK13             [get_ports {sys_clk2_n} ]                        ;# Bank 227 - MGTREFCLK1P_227
set_property PACKAGE_PIN AJ4 [get_ports {pci_express_x16_rxp[3]}]
set_property PACKAGE_PIN AJ3 [get_ports {pci_express_x16_rxn[3]}]
set_property PACKAGE_PIN AJ9 [get_ports {pci_express_x16_txp[3]}]
set_property PACKAGE_PIN AJ8 [get_ports {pci_express_x16_txn[3]}]
set_property PACKAGE_PIN AH2 [get_ports {pci_express_x16_rxp[2]}]
set_property PACKAGE_PIN AH1 [get_ports {pci_express_x16_rxn[2]}]
set_property PACKAGE_PIN AH7 [get_ports {pci_express_x16_txp[2]}]
set_property PACKAGE_PIN AH6 [get_ports {pci_express_x16_txn[2]}]
set_property PACKAGE_PIN AG4 [get_ports {pci_express_x16_rxp[1]}]
set_property PACKAGE_PIN AG3 [get_ports {pci_express_x16_rxn[1]}]
set_property PACKAGE_PIN AG9 [get_ports {pci_express_x16_txp[1]}]
set_property PACKAGE_PIN AG8 [get_ports {pci_express_x16_txn[1]}]
set_property PACKAGE_PIN AF2 [get_ports {pci_express_x16_rxp[0]}]
set_property PACKAGE_PIN AF1 [get_ports {pci_express_x16_rxn[0]}]
set_property PACKAGE_PIN AF7 [get_ports {pci_express_x16_txp[0]}]
set_property PACKAGE_PIN AF6 [get_ports {pci_express_x16_txn[0]}]

create_clock -period 10.000 -name pcie_refclk [get_ports pcie_refclk_clk_p]
set_clock_groups -asynchronous -group pcie_refclk

#There are other 3 DDR chips in the u200, here it is only the C0
#300MHz DDR0 system clock
set_property PACKAGE_PIN AY37 [get_ports mc_clk_p]
set_property PACKAGE_PIN AY38 [get_ports mc_clk_n]

set_property -dict {PACKAGE_PIN AR36 IOSTANDARD SSTL12_DCI} [get_ports {ddr_addr[16]}]
set_property -dict {PACKAGE_PIN AP36 IOSTANDARD SSTL12_DCI} [get_ports {ddr_addr[15]}]
#set_property -dict {PACKAGE_PIN AN34 IOSTANDARD SSTL12_DCI     } [get_ports ddr4_sdram_c0_odt[1]   ]; # Bank 42 VCCO - VCC1V2 Net "DDR4_C0_ODT1"    - IO_L22N_T3U_N7_DBC_AD0N_42
#set_property -dict {PACKAGE_PIN AM34 IOSTANDARD SSTL12_DCI     } [get_ports ddr4_sdram_c0_cs_n[3]  ]; # Bank 42 VCCO - VCC1V2 Net "DDR4_C0_CS_B3"   - IO_L22P_T3U_N6_DBC_AD0P_42
set_property -dict {PACKAGE_PIN AR33 IOSTANDARD SSTL12_DCI} [get_ports {ddr_cs_n[0]}]
set_property -dict {PACKAGE_PIN AN36 IOSTANDARD SSTL12_DCI} [get_ports {ddr_addr[13]}]
#set_property -dict {PACKAGE_PIN AN35 IOSTANDARD SSTL12_DCI     } [get_ports ddr_addr[17]  ]; # Bank 42 VCCO - VCC1V2 Net "DDR4_C0_ADR17"   - IO_L24P_T3U_N10_42
set_property -dict {PACKAGE_PIN AP35 IOSTANDARD SSTL12_DCI} [get_ports {ddr_addr[14]}]
set_property -dict {PACKAGE_PIN AP34 IOSTANDARD SSTL12_DCI} [get_ports {ddr_odt[0]}]
#set_property -dict {PACKAGE_PIN AP33 IOSTANDARD SSTL12_DCI     } [get_ports ddr4_sdram_c0_cs_n[1]  ]; # Bank 42 VCCO - VCC1V2 Net "DDR4_C0_CS_B1"   - IO_L20N_T3L_N3_AD1N_42
#set_property -dict {PACKAGE_PIN AN33 IOSTANDARD SSTL12_DCI     } [get_ports ddr4_sdram_c0_cs_n[2]  ]; # Bank 42 VCCO - VCC1V2 Net "DDR4_C0_CS_B2"   - IO_L20P_T3L_N2_AD1P_42
set_property -dict {PACKAGE_PIN AT35 IOSTANDARD SSTL12_DCI} [get_ports {ddr_ba[0]}]
set_property -dict {PACKAGE_PIN AR35 IOSTANDARD SSTL12_DCI} [get_ports {ddr_addr[10]}]
set_property -dict {PACKAGE_PIN AW38 IOSTANDARD DIFF_SSTL12_DCI} [get_ports {ddr_ck_n[0]}]
set_property -dict {PACKAGE_PIN AV38 IOSTANDARD DIFF_SSTL12_DCI} [get_ports {ddr_ck_p[0]}]
#set_property -dict {PACKAGE_PIN AU35 IOSTANDARD DIFF_SSTL12_DCI} [get_ports ddr_ck_n[1]  ]; # Bank 42 VCCO - VCC1V2 Net "DDR4_C0_CK_C1"   - IO_L16N_T2U_N7_QBC_AD3N_42
#set_property -dict {PACKAGE_PIN AU34 IOSTANDARD DIFF_SSTL12_DCI} [get_ports ddr_ck_p[1]  ]; # Bank 42 VCCO - VCC1V2 Net "DDR4_C0_CK_T1"   - IO_L16P_T2U_N6_QBC_AD3P_42
set_property -dict {PACKAGE_PIN AT34 IOSTANDARD SSTL12_DCI} [get_ports {ddr_ba[1]}]
set_property -dict {PACKAGE_PIN AU36 IOSTANDARD SSTL12_DCI} [get_ports ddr_parity]
set_property -dict {PACKAGE_PIN AT36 IOSTANDARD SSTL12_DCI} [get_ports {ddr_addr[0]}]
set_property -dict {PACKAGE_PIN AV37 IOSTANDARD SSTL12_DCI} [get_ports {ddr_addr[2]}]
set_property -dict {PACKAGE_PIN AV36 IOSTANDARD SSTL12_DCI} [get_ports {ddr_addr[1]}]
set_property -dict {PACKAGE_PIN AW36 IOSTANDARD SSTL12_DCI} [get_ports {ddr_addr[4]}]
set_property -dict {PACKAGE_PIN AW35 IOSTANDARD SSTL12_DCI} [get_ports {ddr_addr[3]}]
#set_property -dict {PACKAGE_PIN BA38 IOSTANDARD LVCMOS12       } [get_ports ddr4_sdram_c0_alert_n  ]; # Bank 42 VCCO - VCC1V2 Net "DDR4_C0_ALERT_B" - IO_L11N_T1U_N9_GC_42
set_property -dict {PACKAGE_PIN BA37 IOSTANDARD SSTL12_DCI} [get_ports {ddr_addr[8]}]
set_property -dict {PACKAGE_PIN BA40 IOSTANDARD SSTL12_DCI} [get_ports {ddr_addr[7]}]
set_property -dict {PACKAGE_PIN BA39 IOSTANDARD SSTL12_DCI} [get_ports {ddr_addr[11]}]
set_property -dict {PACKAGE_PIN BB37 IOSTANDARD SSTL12_DCI} [get_ports {ddr_addr[9]}]
set_property -dict {PACKAGE_PIN AY36 IOSTANDARD SSTL12_DCI} [get_ports {ddr_addr[5]}]
set_property -dict {PACKAGE_PIN AY35 IOSTANDARD SSTL12_DCI} [get_ports {ddr_addr[6]}]
#set_property -dict {PACKAGE_PIN BC40 IOSTANDARD SSTL12_DCI     } [get_ports ddr_cke[1]   ]; # Bank 42 VCCO - VCC1V2 Net "DDR4_C0_CKE1"    - IO_L9N_T1L_N5_AD12N_42
set_property -dict {PACKAGE_PIN BC39 IOSTANDARD SSTL12_DCI} [get_ports {ddr_bg[1]}]
set_property -dict {PACKAGE_PIN BB40 IOSTANDARD SSTL12_DCI} [get_ports {ddr_addr[12]}]
set_property -dict {PACKAGE_PIN BB39 IOSTANDARD SSTL12_DCI} [get_ports ddr_act_n]
set_property -dict {PACKAGE_PIN BC38 IOSTANDARD SSTL12_DCI} [get_ports {ddr_cke[0]}]
set_property -dict {PACKAGE_PIN BC37 IOSTANDARD SSTL12_DCI} [get_ports {ddr_bg[0]}]
set_property -dict {PACKAGE_PIN BF43 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[66]}]
set_property -dict {PACKAGE_PIN BF42 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[67]}]
set_property -dict {PACKAGE_PIN BF38 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_n[16]}]
set_property -dict {PACKAGE_PIN BE38 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_p[16]}]
set_property -dict {PACKAGE_PIN BD40 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[64]}]
set_property -dict {PACKAGE_PIN BD39 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[65]}]
set_property -dict {PACKAGE_PIN BF41 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[71]}]
set_property -dict {PACKAGE_PIN BE40 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[70]}]
set_property -dict {PACKAGE_PIN BF37 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[68]}]
set_property -dict {PACKAGE_PIN BE37 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[69]}]
set_property -dict {PACKAGE_PIN BF40 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_n[17]}]
set_property -dict {PACKAGE_PIN BF39 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_p[17]}]
set_property -dict {PACKAGE_PIN AU32 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[34]}]
set_property -dict {PACKAGE_PIN AT32 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[35]}]
set_property -dict {PACKAGE_PIN AM32 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_n[8]}]
set_property -dict {PACKAGE_PIN AM31 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_p[8]}]
#set_property -dict {PACKAGE_PIN AT33 IOSTANDARD LVCMOS12       } [get_ports ddr4_sdram_c0_event_n  ]; # Bank 41 VCCO - VCC1V2 Net "DDR4_C0_EVENT_B" - IO_T3U_N12_41
set_property -dict {PACKAGE_PIN AM30 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[33]}]
set_property -dict {PACKAGE_PIN AL30 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[32]}]
set_property -dict {PACKAGE_PIN AR32 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[38]}]
set_property -dict {PACKAGE_PIN AR31 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[39]}]
set_property -dict {PACKAGE_PIN AN32 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[37]}]
set_property -dict {PACKAGE_PIN AN31 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[36]}]
set_property -dict {PACKAGE_PIN AP31 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_n[9]}]
set_property -dict {PACKAGE_PIN AP30 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_p[9]}]
set_property -dict {PACKAGE_PIN AV32 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[25]}]
set_property -dict {PACKAGE_PIN AV31 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[24]}]
set_property -dict {PACKAGE_PIN AW33 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_n[6]}]
set_property -dict {PACKAGE_PIN AV33 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_p[6]}]
set_property -dict {PACKAGE_PIN AU31 IOSTANDARD LVCMOS12} [get_ports ddr_reset_n]
set_property -dict {PACKAGE_PIN AW34 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[27]}]
set_property -dict {PACKAGE_PIN AV34 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[26]}]
set_property -dict {PACKAGE_PIN AY31 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[29]}]
set_property -dict {PACKAGE_PIN AW31 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[28]}]
set_property -dict {PACKAGE_PIN BA35 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[30]}]
set_property -dict {PACKAGE_PIN BA34 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[31]}]
set_property -dict {PACKAGE_PIN BA33 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_n[7]}]
set_property -dict {PACKAGE_PIN BA32 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_p[7]}]
set_property -dict {PACKAGE_PIN BB32 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[17]}]
set_property -dict {PACKAGE_PIN BB31 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[16]}]
set_property -dict {PACKAGE_PIN BB36 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_n[4]}]
set_property -dict {PACKAGE_PIN BB35 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_p[4]}]
set_property -dict {PACKAGE_PIN AY33 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[19]}]
set_property -dict {PACKAGE_PIN AY32 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[18]}]
set_property -dict {PACKAGE_PIN BC33 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[21]}]
set_property -dict {PACKAGE_PIN BC32 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[20]}]
set_property -dict {PACKAGE_PIN BC34 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[23]}]
set_property -dict {PACKAGE_PIN BB34 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[22]}]
set_property -dict {PACKAGE_PIN BD31 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_n[5]}]
set_property -dict {PACKAGE_PIN BC31 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_p[5]}]
set_property -dict {PACKAGE_PIN BE33 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[58]}]
set_property -dict {PACKAGE_PIN BD33 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[57]}]
set_property -dict {PACKAGE_PIN BE36 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_n[14]}]
set_property -dict {PACKAGE_PIN BE35 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_p[14]}]
set_property -dict {PACKAGE_PIN BD35 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[59]}]
set_property -dict {PACKAGE_PIN BD34 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[56]}]
set_property -dict {PACKAGE_PIN BF33 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[61]}]
set_property -dict {PACKAGE_PIN BF32 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[60]}]
set_property -dict {PACKAGE_PIN BF35 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[63]}]
set_property -dict {PACKAGE_PIN BF34 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[62]}]
set_property -dict {PACKAGE_PIN BE32 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_n[15]}]
set_property -dict {PACKAGE_PIN BE31 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_p[15]}]
set_property -dict {PACKAGE_PIN AP29 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[40]}]
set_property -dict {PACKAGE_PIN AP28 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[41]}]
set_property -dict {PACKAGE_PIN AL29 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_n[10]}]
set_property -dict {PACKAGE_PIN AL28 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_p[10]}]
set_property -dict {PACKAGE_PIN AN27 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[42]}]
set_property -dict {PACKAGE_PIN AM27 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[43]}]
set_property -dict {PACKAGE_PIN AR28 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[47]}]
set_property -dict {PACKAGE_PIN AR27 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[46]}]
set_property -dict {PACKAGE_PIN AN29 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[44]}]
set_property -dict {PACKAGE_PIN AM29 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[45]}]
set_property -dict {PACKAGE_PIN AT30 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_n[11]}]
set_property -dict {PACKAGE_PIN AR30 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_p[11]}]
set_property -dict {PACKAGE_PIN AV27 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[49]}]
set_property -dict {PACKAGE_PIN AU27 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[50]}]
set_property -dict {PACKAGE_PIN AU30 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_n[12]}]
set_property -dict {PACKAGE_PIN AU29 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_p[12]}]
set_property -dict {PACKAGE_PIN AT28 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[48]}]
set_property -dict {PACKAGE_PIN AT27 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[51]}]
set_property -dict {PACKAGE_PIN AV29 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[52]}]
set_property -dict {PACKAGE_PIN AV28 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[55]}]
set_property -dict {PACKAGE_PIN AY30 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[53]}]
set_property -dict {PACKAGE_PIN AW30 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[54]}]
set_property -dict {PACKAGE_PIN AY28 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_n[13]}]
set_property -dict {PACKAGE_PIN AY27 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_p[13]}]
set_property -dict {PACKAGE_PIN BA28 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[2]}]
set_property -dict {PACKAGE_PIN BA27 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[3]}]
set_property -dict {PACKAGE_PIN BB30 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_n[0]}]
set_property -dict {PACKAGE_PIN BA30 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_p[0]}]
set_property -dict {PACKAGE_PIN AW29 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[1]}]
set_property -dict {PACKAGE_PIN AW28 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[0]}]
set_property -dict {PACKAGE_PIN BC27 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[6]}]
set_property -dict {PACKAGE_PIN BB27 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[7]}]
set_property -dict {PACKAGE_PIN BB29 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[4]}]
set_property -dict {PACKAGE_PIN BA29 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[5]}]
set_property -dict {PACKAGE_PIN BC26 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_n[1]}]
set_property -dict {PACKAGE_PIN BB26 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_p[1]}]
set_property -dict {PACKAGE_PIN BF28 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[9]}]
set_property -dict {PACKAGE_PIN BE28 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[8]}]
set_property -dict {PACKAGE_PIN BD29 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_n[2]}]
set_property -dict {PACKAGE_PIN BD28 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_p[2]}]
set_property -dict {PACKAGE_PIN BE30 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[10]}]
set_property -dict {PACKAGE_PIN BD30 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[11]}]
set_property -dict {PACKAGE_PIN BF27 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[12]}]
set_property -dict {PACKAGE_PIN BE27 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[13]}]
set_property -dict {PACKAGE_PIN BF30 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[14]}]
set_property -dict {PACKAGE_PIN BF29 IOSTANDARD POD12_DCI} [get_ports {ddr_dq[15]}]
set_property -dict {PACKAGE_PIN BE26 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_n[3]}]
set_property -dict {PACKAGE_PIN BD26 IOSTANDARD DIFF_POD12_DCI} [get_ports {ddr_dqs_p[3]}]
#

set_property PACKAGE_PIN BC21 [get_ports hbm_cattrip]
set_property IOSTANDARD LVCMOS12 [get_ports hbm_cattrip]
set_property PULLDOWN true [get_ports hbm_cattrip]

set_false_path -from [get_pins chipset/chipset_impl/u200_shell_i/meep_shell_i/ddr4_0/inst/u_ddr4_mem_intfc/u_ddr_cal_top/*/C] -to [get_pins chipset/chipset_impl/init_calib_complete_f_reg/D]


# set_property strategy Performance_EarlyBlockPlacement [get_runs impl_1]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 6 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list chipset/clk_mmcm/inst/chipset_clk]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 6 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][rd][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][rd][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][rd][2]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][rd][3]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][rd][4]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][rd][5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 64 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][2]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][3]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][4]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][5]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][6]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][7]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][8]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][9]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][10]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][11]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][12]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][13]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][14]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][15]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][16]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][17]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][18]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][19]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][20]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][21]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][22]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][23]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][24]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][25]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][26]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][27]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][28]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][29]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][30]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][31]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][32]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][33]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][34]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][35]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][36]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][37]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][38]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][39]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][40]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][41]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][42]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][43]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][44]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][45]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][46]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][47]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][48]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][49]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][50]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][51]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][52]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][53]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][54]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][55]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][56]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][57]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][58]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][59]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][60]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][61]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][62]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][tval][63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 64 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][2]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][3]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][4]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][5]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][6]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][7]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][8]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][9]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][10]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][11]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][12]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][13]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][14]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][15]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][16]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][17]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][18]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][19]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][20]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][21]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][22]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][23]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][24]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][25]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][26]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][27]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][28]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][29]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][30]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][31]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][32]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][33]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][34]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][35]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][36]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][37]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][38]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][39]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][40]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][41]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][42]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][43]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][44]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][45]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][46]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][47]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][48]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][49]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][50]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][51]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][52]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][53]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][54]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][55]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][56]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][57]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][58]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][59]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][60]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][61]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][62]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][cause][63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 64 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][2]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][3]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][4]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][5]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][6]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][7]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][8]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][9]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][10]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][11]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][12]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][13]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][14]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][15]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][16]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][17]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][18]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][19]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][20]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][21]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][22]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][23]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][24]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][25]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][26]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][27]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][28]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][29]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][30]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][31]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][32]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][33]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][34]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][35]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][36]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][37]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][38]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][39]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][40]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][41]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][42]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][43]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][44]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][45]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][46]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][47]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][48]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][49]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][50]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][51]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][52]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][53]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][54]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][55]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][56]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][57]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][58]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][59]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][60]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][61]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][62]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][cause][63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 3 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][cf][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][cf][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][cf][2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 64 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][2]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][3]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][4]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][5]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][6]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][7]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][8]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][9]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][10]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][11]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][12]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][13]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][14]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][15]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][16]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][17]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][18]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][19]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][20]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][21]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][22]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][23]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][24]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][25]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][26]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][27]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][28]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][29]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][30]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][31]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][32]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][33]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][34]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][35]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][36]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][37]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][38]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][39]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][40]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][41]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][42]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][43]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][44]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][45]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][46]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][47]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][48]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][49]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][50]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][51]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][52]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][53]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][54]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][55]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][56]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][57]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][58]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][59]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][60]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][61]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][62]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][pc][63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 64 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][2]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][3]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][4]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][5]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][6]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][7]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][8]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][9]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][10]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][11]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][12]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][13]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][14]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][15]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][16]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][17]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][18]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][19]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][20]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][21]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][22]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][23]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][24]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][25]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][26]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][27]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][28]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][29]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][30]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][31]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][32]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][33]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][34]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][35]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][36]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][37]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][38]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][39]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][40]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][41]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][42]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][43]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][44]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][45]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][46]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][47]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][48]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][49]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][50]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][51]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][52]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][53]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][54]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][55]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][56]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][57]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][58]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][59]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][60]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][61]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][62]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][result][63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 64 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][2]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][3]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][4]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][5]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][6]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][7]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][8]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][9]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][10]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][11]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][12]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][13]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][14]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][15]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][16]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][17]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][18]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][19]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][20]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][21]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][22]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][23]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][24]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][25]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][26]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][27]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][28]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][29]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][30]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][31]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][32]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][33]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][34]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][35]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][36]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][37]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][38]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][39]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][40]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][41]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][42]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][43]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][44]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][45]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][46]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][47]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][48]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][49]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][50]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][51]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][52]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][53]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][54]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][55]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][56]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][57]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][58]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][59]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][60]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][61]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][62]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][predict_address][63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 6 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][rs1][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][rs1][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][rs1][2]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][rs1][3]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][rs1][4]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][rs1][5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 6 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][rd][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][rd][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][rd][2]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][rd][3]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][rd][4]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][rd][5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 4 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][fu][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][fu][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][fu][2]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][fu][3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 8 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][op][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][op][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][op][2]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][op][3]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][op][4]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][op][5]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][op][6]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][op][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 3 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][trans_id][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][trans_id][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][trans_id][2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 8 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][op][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][op][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][op][2]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][op][3]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][op][4]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][op][5]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][op][6]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][op][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 64 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][2]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][3]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][4]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][5]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][6]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][7]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][8]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][9]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][10]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][11]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][12]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][13]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][14]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][15]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][16]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][17]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][18]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][19]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][20]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][21]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][22]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][23]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][24]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][25]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][26]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][27]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][28]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][29]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][30]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][31]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][32]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][33]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][34]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][35]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][36]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][37]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][38]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][39]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][40]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][41]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][42]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][43]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][44]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][45]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][46]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][47]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][48]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][49]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][50]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][51]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][52]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][53]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][54]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][55]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][56]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][57]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][58]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][59]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][60]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][61]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][62]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][bp][predict_address][63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 64 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][2]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][3]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][4]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][5]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][6]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][7]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][8]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][9]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][10]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][11]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][12]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][13]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][14]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][15]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][16]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][17]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][18]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][19]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][20]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][21]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][22]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][23]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][24]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][25]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][26]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][27]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][28]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][29]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][30]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][31]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][32]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][33]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][34]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][35]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][36]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][37]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][38]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][39]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][40]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][41]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][42]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][43]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][44]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][45]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][46]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][47]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][48]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][49]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][50]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][51]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][52]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][53]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][54]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][55]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][56]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][57]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][58]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][59]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][60]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][61]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][62]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][tval][63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 3 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][cf][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][cf][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][bp][cf][2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 64 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][2]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][3]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][4]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][5]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][6]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][7]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][8]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][9]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][10]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][11]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][12]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][13]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][14]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][15]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][16]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][17]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][18]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][19]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][20]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][21]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][22]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][23]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][24]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][25]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][26]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][27]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][28]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][29]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][30]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][31]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][32]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][33]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][34]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][35]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][36]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][37]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][38]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][39]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][40]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][41]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][42]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][43]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][44]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][45]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][46]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][47]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][48]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][49]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][50]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][51]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][52]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][53]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][54]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][55]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][56]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][57]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][58]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][59]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][60]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][61]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][62]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][pc][63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 6 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][rs2][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][rs2][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][rs2][2]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][rs2][3]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][rs2][4]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][rs2][5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 4 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][fu][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][fu][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][fu][2]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][fu][3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 4 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {chipset/chipset_impl/uart_top/s_axi_wstrb[0]} {chipset/chipset_impl/uart_top/s_axi_wstrb[1]} {chipset/chipset_impl/uart_top/s_axi_wstrb[2]} {chipset/chipset_impl/uart_top/s_axi_wstrb[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 13 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {chipset/chipset_impl/uart_top/s_axi_araddr[0]} {chipset/chipset_impl/uart_top/s_axi_araddr[1]} {chipset/chipset_impl/uart_top/s_axi_araddr[2]} {chipset/chipset_impl/uart_top/s_axi_araddr[3]} {chipset/chipset_impl/uart_top/s_axi_araddr[4]} {chipset/chipset_impl/uart_top/s_axi_araddr[5]} {chipset/chipset_impl/uart_top/s_axi_araddr[6]} {chipset/chipset_impl/uart_top/s_axi_araddr[7]} {chipset/chipset_impl/uart_top/s_axi_araddr[8]} {chipset/chipset_impl/uart_top/s_axi_araddr[9]} {chipset/chipset_impl/uart_top/s_axi_araddr[10]} {chipset/chipset_impl/uart_top/s_axi_araddr[11]} {chipset/chipset_impl/uart_top/s_axi_araddr[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 32 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {chipset/chipset_impl/uart_top/s_axi_wdata[0]} {chipset/chipset_impl/uart_top/s_axi_wdata[1]} {chipset/chipset_impl/uart_top/s_axi_wdata[2]} {chipset/chipset_impl/uart_top/s_axi_wdata[3]} {chipset/chipset_impl/uart_top/s_axi_wdata[4]} {chipset/chipset_impl/uart_top/s_axi_wdata[5]} {chipset/chipset_impl/uart_top/s_axi_wdata[6]} {chipset/chipset_impl/uart_top/s_axi_wdata[7]} {chipset/chipset_impl/uart_top/s_axi_wdata[8]} {chipset/chipset_impl/uart_top/s_axi_wdata[9]} {chipset/chipset_impl/uart_top/s_axi_wdata[10]} {chipset/chipset_impl/uart_top/s_axi_wdata[11]} {chipset/chipset_impl/uart_top/s_axi_wdata[12]} {chipset/chipset_impl/uart_top/s_axi_wdata[13]} {chipset/chipset_impl/uart_top/s_axi_wdata[14]} {chipset/chipset_impl/uart_top/s_axi_wdata[15]} {chipset/chipset_impl/uart_top/s_axi_wdata[16]} {chipset/chipset_impl/uart_top/s_axi_wdata[17]} {chipset/chipset_impl/uart_top/s_axi_wdata[18]} {chipset/chipset_impl/uart_top/s_axi_wdata[19]} {chipset/chipset_impl/uart_top/s_axi_wdata[20]} {chipset/chipset_impl/uart_top/s_axi_wdata[21]} {chipset/chipset_impl/uart_top/s_axi_wdata[22]} {chipset/chipset_impl/uart_top/s_axi_wdata[23]} {chipset/chipset_impl/uart_top/s_axi_wdata[24]} {chipset/chipset_impl/uart_top/s_axi_wdata[25]} {chipset/chipset_impl/uart_top/s_axi_wdata[26]} {chipset/chipset_impl/uart_top/s_axi_wdata[27]} {chipset/chipset_impl/uart_top/s_axi_wdata[28]} {chipset/chipset_impl/uart_top/s_axi_wdata[29]} {chipset/chipset_impl/uart_top/s_axi_wdata[30]} {chipset/chipset_impl/uart_top/s_axi_wdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 13 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {chipset/chipset_impl/uart_top/s_axi_awaddr[0]} {chipset/chipset_impl/uart_top/s_axi_awaddr[1]} {chipset/chipset_impl/uart_top/s_axi_awaddr[2]} {chipset/chipset_impl/uart_top/s_axi_awaddr[3]} {chipset/chipset_impl/uart_top/s_axi_awaddr[4]} {chipset/chipset_impl/uart_top/s_axi_awaddr[5]} {chipset/chipset_impl/uart_top/s_axi_awaddr[6]} {chipset/chipset_impl/uart_top/s_axi_awaddr[7]} {chipset/chipset_impl/uart_top/s_axi_awaddr[8]} {chipset/chipset_impl/uart_top/s_axi_awaddr[9]} {chipset/chipset_impl/uart_top/s_axi_awaddr[10]} {chipset/chipset_impl/uart_top/s_axi_awaddr[11]} {chipset/chipset_impl/uart_top/s_axi_awaddr[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 32 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {chipset/chipset_impl/uart_top/s_axi_rdata[0]} {chipset/chipset_impl/uart_top/s_axi_rdata[1]} {chipset/chipset_impl/uart_top/s_axi_rdata[2]} {chipset/chipset_impl/uart_top/s_axi_rdata[3]} {chipset/chipset_impl/uart_top/s_axi_rdata[4]} {chipset/chipset_impl/uart_top/s_axi_rdata[5]} {chipset/chipset_impl/uart_top/s_axi_rdata[6]} {chipset/chipset_impl/uart_top/s_axi_rdata[7]} {chipset/chipset_impl/uart_top/s_axi_rdata[8]} {chipset/chipset_impl/uart_top/s_axi_rdata[9]} {chipset/chipset_impl/uart_top/s_axi_rdata[10]} {chipset/chipset_impl/uart_top/s_axi_rdata[11]} {chipset/chipset_impl/uart_top/s_axi_rdata[12]} {chipset/chipset_impl/uart_top/s_axi_rdata[13]} {chipset/chipset_impl/uart_top/s_axi_rdata[14]} {chipset/chipset_impl/uart_top/s_axi_rdata[15]} {chipset/chipset_impl/uart_top/s_axi_rdata[16]} {chipset/chipset_impl/uart_top/s_axi_rdata[17]} {chipset/chipset_impl/uart_top/s_axi_rdata[18]} {chipset/chipset_impl/uart_top/s_axi_rdata[19]} {chipset/chipset_impl/uart_top/s_axi_rdata[20]} {chipset/chipset_impl/uart_top/s_axi_rdata[21]} {chipset/chipset_impl/uart_top/s_axi_rdata[22]} {chipset/chipset_impl/uart_top/s_axi_rdata[23]} {chipset/chipset_impl/uart_top/s_axi_rdata[24]} {chipset/chipset_impl/uart_top/s_axi_rdata[25]} {chipset/chipset_impl/uart_top/s_axi_rdata[26]} {chipset/chipset_impl/uart_top/s_axi_rdata[27]} {chipset/chipset_impl/uart_top/s_axi_rdata[28]} {chipset/chipset_impl/uart_top/s_axi_rdata[29]} {chipset/chipset_impl/uart_top/s_axi_rdata[30]} {chipset/chipset_impl/uart_top/s_axi_rdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 2 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {chipset/chipset_impl/uart_top/s_axi_bresp[0]} {chipset/chipset_impl/uart_top/s_axi_bresp[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 2 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {chipset/chipset_impl/uart_top/s_axi_rresp[0]} {chipset/chipset_impl/uart_top/s_axi_rresp[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 3 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][trans_id][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][trans_id][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][trans_id][2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 64 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][2]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][3]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][4]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][5]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][6]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][7]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][8]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][9]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][10]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][11]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][12]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][13]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][14]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][15]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][16]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][17]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][18]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][19]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][20]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][21]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][22]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][23]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][24]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][25]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][26]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][27]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][28]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][29]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][30]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][31]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][32]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][33]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][34]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][35]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][36]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][37]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][38]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][39]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][40]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][41]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][42]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][43]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][44]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][45]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][46]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][47]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][48]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][49]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][50]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][51]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][52]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][53]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][54]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][55]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][56]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][57]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][58]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][59]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][60]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][61]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][62]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][result][63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 6 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][rs2][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][rs2][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][rs2][2]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][rs2][3]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][rs2][4]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][rs2][5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 6 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][rs1][0]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][rs1][1]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][rs1][2]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][rs1][3]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][rs1][4]} {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][rs1][5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 1 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][ex][valid]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 1 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][is_compressed]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 1 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][use_imm]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 1 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][use_pc]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][use_zimm]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[0][valid]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][ex][valid]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 1 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][is_compressed]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 1 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][use_imm]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][use_pc]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][use_zimm]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list {chip/tile0/g_ariane_core.core/ariane/i_cva6/commit_instr_id_commit[1][valid]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 1 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list chipset/chipset_impl/uart_top/rst_n]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 1 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list chipset/chipset_impl/uart_top/s_axi_arready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 1 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list chipset/chipset_impl/uart_top/s_axi_arvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 1 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list chipset/chipset_impl/uart_top/s_axi_awready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 1 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list chipset/chipset_impl/uart_top/s_axi_awvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe48]
set_property port_width 1 [get_debug_ports u_ila_0/probe48]
connect_debug_port u_ila_0/probe48 [get_nets [list chipset/chipset_impl/uart_top/s_axi_bready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe49]
set_property port_width 1 [get_debug_ports u_ila_0/probe49]
connect_debug_port u_ila_0/probe49 [get_nets [list chipset/chipset_impl/uart_top/s_axi_bvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe50]
set_property port_width 1 [get_debug_ports u_ila_0/probe50]
connect_debug_port u_ila_0/probe50 [get_nets [list chipset/chipset_impl/uart_top/s_axi_rready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe51]
set_property port_width 1 [get_debug_ports u_ila_0/probe51]
connect_debug_port u_ila_0/probe51 [get_nets [list chipset/chipset_impl/uart_top/s_axi_rvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe52]
set_property port_width 1 [get_debug_ports u_ila_0/probe52]
connect_debug_port u_ila_0/probe52 [get_nets [list chipset/chipset_impl/uart_top/s_axi_wready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe53]
set_property port_width 1 [get_debug_ports u_ila_0/probe53]
connect_debug_port u_ila_0/probe53 [get_nets [list chipset/chipset_impl/uart_top/s_axi_wvalid]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 6 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list chipset/chipset_impl/u200_shell_i/meep_shell_i/ddr4_0/inst/u_ddr4_infrastructure/div_clk]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 64 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {chipset/chipset_impl/u200_shell_i/m_axi_araddr[0]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[1]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[2]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[3]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[4]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[5]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[6]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[7]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[8]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[9]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[10]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[11]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[12]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[13]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[14]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[15]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[16]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[17]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[18]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[19]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[20]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[21]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[22]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[23]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[24]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[25]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[26]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[27]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[28]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[29]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[30]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[31]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[32]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[33]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[34]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[35]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[36]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[37]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[38]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[39]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[40]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[41]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[42]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[43]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[44]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[45]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[46]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[47]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[48]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[49]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[50]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[51]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[52]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[53]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[54]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[55]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[56]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[57]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[58]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[59]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[60]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[61]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[62]} {chipset/chipset_impl/u200_shell_i/m_axi_araddr[63]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 64 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[0]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[1]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[2]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[3]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[4]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[5]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[6]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[7]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[8]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[9]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[10]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[11]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[12]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[13]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[14]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[15]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[16]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[17]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[18]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[19]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[20]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[21]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[22]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[23]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[24]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[25]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[26]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[27]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[28]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[29]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[30]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[31]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[32]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[33]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[34]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[35]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[36]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[37]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[38]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[39]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[40]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[41]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[42]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[43]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[44]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[45]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[46]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[47]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[48]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[49]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[50]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[51]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[52]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[53]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[54]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[55]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[56]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[57]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[58]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[59]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[60]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[61]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[62]} {chipset/chipset_impl/u200_shell_i/m_axi_awaddr[63]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 1 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list chipset/chipset_impl/u200_shell_i/m_axi_arready]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 1 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list chipset/chipset_impl/u200_shell_i/m_axi_arvalid]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 1 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list chipset/chipset_impl/u200_shell_i/m_axi_awready]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 1 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list chipset/chipset_impl/u200_shell_i/m_axi_awvalid]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 1 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list chipset/chipset_impl/u200_shell_i/m_axi_bready]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 1 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list chipset/chipset_impl/u200_shell_i/m_axi_bvalid]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe8]
set_property port_width 1 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list chipset/chipset_impl/u200_shell_i/m_axi_rready]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe9]
set_property port_width 1 [get_debug_ports u_ila_1/probe9]
connect_debug_port u_ila_1/probe9 [get_nets [list chipset/chipset_impl/u200_shell_i/m_axi_rvalid]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
