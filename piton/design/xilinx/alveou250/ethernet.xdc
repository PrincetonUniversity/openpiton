## ================ Ethernet ================
## Commented pin locations are applied automatically due to configurations inside Ethernet CMAC core (made in BD)
#--------------------------------------------
#
# ---- Both QSFP Clock Tree
#    1) SI570 - SiLabs 570BAB000544DG @ 156.250Mhz Programmable Oscillator (Re-programming I2C access via Bank 64 I2C )
#
#      - OUT---> SI570_OUTPUT_P/SI570_OUTPUT_N @ 156.250Mhz LVDS
#           |
#           |--> SI53340-B-GM --> OUT0  USER_SI570_CLOCK_P/USER_SI570_CLOCK_N 156.250Mhz - General Perpose System Clock.
#                             |   PINS: IO_L12P_T1U_N10_GC_64_AU19/IO_L12N_T1U_N11_GC_64_AV19
#                             |
#                             |-> OUT1  Not Connected
#                             |   PINS: NA
#                             |
#                             |-> OUT2  MGT_SI570_CLOCK0_C_P/MGT_SI570_CLOCK0_C_N 156.250Mhz - QSFP REFCLK0
#                             |   PINS: MGTREFCLK0P_231_M11/MGTREFCLK0N_231_M10
#                             |
#                             |-> OUT3  MGT_SI570_CLOCK1_C_P/MGT_SI570_CLOCK1_C_N 156.250Mhz - QSFP REFCLK1
#                                 PINS: MGTREFCLK0P_230_T11/MGTREFCLK0N_230_T10
#
# ---- QSFP0 Clock Tree
#    2) SI335A - SiLabs SI5335A-B06201-GM Selectable output Oscillator 156.2500Mhz/161.1328125Mhz For QSFP0 REFCLK1
#
#      - FS[1:0] <-- Clock Select Pin FS[1:0] = 1X -> 161.132812 MHz 1.8V LVDS (default when FPGA pin Hi-Z due to 10K pullups)
#                                     FS[1:0] = 01 -> 156.250000 MHz 1.8V LVDS
#                PINS: "QSFP0_FS[0]"         - IO_L10P_T1U_N6_QBC_AD4P_64_AT20
#                PINS: "QSFP0_FS[1]"         - IO_L9N_T1L_N5_AD12N_64_AU22
#
#      - RESET <-- Device Reset - Asserting this pin (driving high) is required to change FS1,FS0 pin setting. 
#                PINS: "QSFP0_RECLK_RESET"   - IO_L9P_T1L_N4_AD12P_64_AT22
#
#      - OUT1--> QSFP0_CLOCK_P/QSFP0_CLOCK_N @ 161.1328125Mhz (Selectable based on state of FS[1:0])
#                PINS: MGTREFCLK1P_231_K11/MGTREFCLK1N_231_K10
#
# ---- Input Clocks and Controls for QSFP28 Port 0
#
# MGT_SI570_CLOCK0   -> MGT Ref Clock 0 156.25MHz Default (User re-programmable)
# QSFP0_CLOCK        -> MGT Ref Clock 1 User selectable by QSFP0_FS
#
set_property PACKAGE_PIN M10 [get_ports qsfp0_ref_clk_n]; # Bank 231 Net "MGT_SI570_CLOCK0_C_N" - MGTREFCLK0N_231
set_property PACKAGE_PIN M11 [get_ports qsfp0_ref_clk_p]; # Bank 231 Net "MGT_SI570_CLOCK0_C_P" - MGTREFCLK0P_231
# set_property PACKAGE_PIN M10 [get_ports MGT_SI570_CLOCK0_N]; # Bank 231 Net "MGT_SI570_CLOCK0_C_N" - MGTREFCLK0N_231
# set_property PACKAGE_PIN M11 [get_ports MGT_SI570_CLOCK0_P]; # Bank 231 Net "MGT_SI570_CLOCK0_C_P" - MGTREFCLK0P_231
# set_property PACKAGE_PIN K10 [get_ports QSFP0_CLOCK_N     ]; # Bank 231 Net "QSFP0_CLOCK_N"        - MGTREFCLK1N_231
# set_property PACKAGE_PIN K11 [get_ports QSFP0_CLOCK_P     ]; # Bank 231 Net "QSFP0_CLOCK_P"        - MGTREFCLK1P_231
#
# QSFP0 Control Signals
#       RESETL  - Active Low Reset output from FPGA to QSFP Module
#       MODPRSL - Active Low Module Present input from QSFP to FPGA
#       INTL    - Active Low Interrupt input from QSFP to FPGA
#       LPMODE  - Active High Control output from FPGA to QSFP Module to put the device in low power mode (Optics Off)
#       MODSEL  - Active Low Enable output from FPGA to QSFP Module to select device for I2C Sideband Communication
#
# set_property -dict {PACKAGE_PIN BE17 IOSTANDARD LVCMOS12       } [get_ports QSFP0_RESETL      ]; # Bank 64 VCCO - VCC1V2 Net "QSFP0_RESETL_LS"     - IO_L22P_T3U_N6_DBC_AD0P_64
# set_property -dict {PACKAGE_PIN BE20 IOSTANDARD LVCMOS12       } [get_ports QSFP0_MODPRSL     ]; # Bank 64 VCCO - VCC1V2 Net "QSFP0_MODPRSL_LS"    - IO_L21N_T3L_N5_AD8N_64
# set_property -dict {PACKAGE_PIN BE21 IOSTANDARD LVCMOS12       } [get_ports QSFP0_INTL        ]; # Bank 64 VCCO - VCC1V2 Net "QSFP0_INTL_LS"       - IO_L21P_T3L_N4_AD8P_64
# set_property -dict {PACKAGE_PIN BD18 IOSTANDARD LVCMOS12       } [get_ports QSFP0_LPMODE      ]; # Bank 64 VCCO - VCC1V2 Net "QSFP0_LPMODE_LS"     - IO_L20N_T3L_N3_AD1N_64
# set_property -dict {PACKAGE_PIN BE16 IOSTANDARD LVCMOS12       } [get_ports QSFP0_MODSELL     ]; # Bank 64 VCCO - VCC1V2 Net "QSFP0_MODSELL_LS"    - IO_L22N_T3U_N7_DBC_AD0N_64
#
# QSFP0 Clock Control Signals
#       FS[1:0] <-- Clock Select Pin FS[1:0] = 1X -> 161.132812 MHz 1.8V LVDS (default when FPGA pin Hi-Z due to 10K pullups)
#                                    FS[1:0] = 01 -> 156.250000 MHz 1.8V LVDS
#       RESET <-- Device Reset - Asserting this pin (driving high) is required to change FS1,FS0 pin setting. 
#
# set_property -dict {PACKAGE_PIN AT20 IOSTANDARD LVCMOS12       } [get_ports QSFP0_FS[0]       ]; # Bank 64 VCCO - VCC1V2 Net "QSFP0_FS0"           - IO_L10P_T1U_N6_QBC_AD4P_64
# set_property -dict {PACKAGE_PIN AU22 IOSTANDARD LVCMOS12       } [get_ports QSFP0_FS[1]       ]; # Bank 64 VCCO - VCC1V2 Net "QSFP0_FS1"           - IO_L9N_T1L_N5_AD12N_64
# set_property -dict {PACKAGE_PIN AT22 IOSTANDARD LVCMOS12       } [get_ports QSFP0_REFCLK_RESET]; # Bank 64 VCCO - VCC1V2 Net "QSFP0_REFCLK_RESET"  - IO_L9P_T1L_N4_AD12P_64
#
## ---- QSFP0 MGTY Interface
#set_property PACKAGE_PIN N3  [get_ports QSFP0_RX1_N]; # Bank 231  - MGTYRXN0_231
#set_property PACKAGE_PIN N4  [get_ports QSFP0_RX1_P]; # Bank 231  - MGTYRXP0_231
#set_property PACKAGE_PIN M1  [get_ports QSFP0_RX2_N]; # Bank 231  - MGTYRXN1_231
#set_property PACKAGE_PIN M2  [get_ports QSFP0_RX2_P]; # Bank 231  - MGTYRXP1_231
#set_property PACKAGE_PIN L3  [get_ports QSFP0_RX3_N]; # Bank 231  - MGTYRXN2_231
#set_property PACKAGE_PIN L4  [get_ports QSFP0_RX3_P]; # Bank 231  - MGTYRXP2_231
#set_property PACKAGE_PIN K1  [get_ports QSFP0_RX4_N]; # Bank 231  - MGTYRXN3_231
#set_property PACKAGE_PIN K2  [get_ports QSFP0_RX4_P]; # Bank 231  - MGTYRXP3_231
#set_property PACKAGE_PIN N8  [get_ports QSFP0_TX1_N]; # Bank 231  - MGTYTXN0_231
#set_property PACKAGE_PIN N9  [get_ports QSFP0_TX1_P]; # Bank 231  - MGTYTXP0_231
#set_property PACKAGE_PIN M6  [get_ports QSFP0_TX2_N]; # Bank 231  - MGTYTXN1_231
#set_property PACKAGE_PIN M7  [get_ports QSFP0_TX2_P]; # Bank 231  - MGTYTXP1_231
#set_property PACKAGE_PIN L8  [get_ports QSFP0_TX3_N]; # Bank 231  - MGTYTXN2_231
#set_property PACKAGE_PIN L9  [get_ports QSFP0_TX3_P]; # Bank 231  - MGTYTXP2_231
#set_property PACKAGE_PIN K6  [get_ports QSFP0_TX4_N]; # Bank 231  - MGTYTXN3_231
#set_property PACKAGE_PIN K7  [get_ports QSFP0_TX4_P]; # Bank 231  - MGTYTXP3_231
#
#--------------------------------------------
# ---- QSFP1 Clock Tree
#    3) SI335A - SiLabs SI5335A-B06201-GM Selectable output Oscillator 156.2500Mhz/161.1328125Mhz For QSFP1 REFCLK1
#
#      - FS[1:0] <-- Clock Select Pin FS[1:0] = 1X -> 161.132812 MHz 1.8V LVDS (default when FPGA pin Hi-Z due to 10K pullups)
#                                     FS[1:0] = 01 -> 156.250000 MHz 1.8V LVDS
#                PINS: "QSFP1_FS[0]"         - IO_L8P_T1L_N2_AD5P_64_AR22
#                PINS: "QSFP1_FS[1]"         - IO_L7N_T1L_N1_QBC_AD13N_64_AU20
#
#      - RESET <-- Device Reset - Asserting this pin (driving high) is required to change FS1,FS0 pin setting. 
#                PINS: "QSFP1_RECLK_RESET"   - IO_L8N_T1L_N3_AD5N_64_AR21
#
#      - OUT1--> QSFP1_CLOCK_P/QSFP1_CLOCK_N @ 161.1328125Mhz (Selectable based on state of FS[1:0])
#                PINS: MGTREFCLK1P_230_P11/MGTREFCLK1N_230_P10
#
# ---- Input Clocks and Controls for QSFP28 Port 1
#
# MGT_SI570_CLOCK1   -> MGT Ref Clock 0 156.25MHz Default (User re-programmable)
# QSFP1_CLOCK        -> MGT Ref Clock 1 User selectable by QSFP0_FS
#
set_property PACKAGE_PIN T10 [get_ports qsfp1_ref_clk_n ]; # Bank 230 Net "MGT_SI570_CLOCK1_C_N" - MGTREFCLK0N_230
set_property PACKAGE_PIN T11 [get_ports qsfp1_ref_clk_p ]; # Bank 230 Net "MGT_SI570_CLOCK1_C_P" - MGTREFCLK0P_230
# set_property PACKAGE_PIN T10 [get_ports MGT_SI570_CLOCK1_N ]; # Bank 230 Net "MGT_SI570_CLOCK1_C_N" - MGTREFCLK0N_230
# set_property PACKAGE_PIN T11 [get_ports MGT_SI570_CLOCK1_P ]; # Bank 230 Net "MGT_SI570_CLOCK1_C_P" - MGTREFCLK0P_230
# set_property PACKAGE_PIN P10 [get_ports QSFP1_CLOCK_N      ]; # Bank 230 Net "QSFP1_CLOCK_N"        - MGTREFCLK1N_230
# set_property PACKAGE_PIN P11 [get_ports QSFP1_CLOCK_P      ]; # Bank 230 Net "QSFP1_CLOCK_P"        - MGTREFCLK1P_230
#
# QSFP1 Control Signals
#       RESETL  - Active Low Reset output from FPGA to QSFP Module
#       MODPRSL - Active Low Module Present input from QSFP to FPGA
#       INTL    - Active Low Interrupt input from QSFP to FPGA
#       LPMODE  - Active High Control output from FPGA to QSFP Module to put the device in low power mode (Optics Off)
#       MODSEL  - Active Low Enable output from FPGA to QSFP Module to select device for I2C Sideband Communication
#
# set_property -dict {PACKAGE_PIN BC18 IOSTANDARD LVCMOS12      } [get_ports QSFP1_RESETL      ]; # Bank 64 VCCO - VCC1V2 Net "QSFP1_RESETL_LS"     - IO_L15N_T2L_N5_AD11N_64
# set_property -dict {PACKAGE_PIN BC19 IOSTANDARD LVCMOS12      } [get_ports QSFP1_MODPRSL     ]; # Bank 64 VCCO - VCC1V2 Net "QSFP1_MODPRSL_LS"    - IO_L15P_T2L_N4_AD11P_64
# set_property -dict {PACKAGE_PIN AV21 IOSTANDARD LVCMOS12      } [get_ports QSFP1_INTL        ]; # Bank 64 VCCO - VCC1V2 Net "QSFP1_INTL_LS"       - IO_L14N_T2L_N3_GC_64
# set_property -dict {PACKAGE_PIN AV22 IOSTANDARD LVCMOS12      } [get_ports QSFP1_LPMODE      ]; # Bank 64 VCCO - VCC1V2 Net "QSFP1_LPMODE_LS"     - IO_L14P_T2L_N2_GC_64
# set_property -dict {PACKAGE_PIN AY20 IOSTANDARD LVCMOS12      } [get_ports QSFP1_MODSELL     ]; # Bank 64 VCCO - VCC1V2 Net "QSFP1_MODSELL_LS"    - IO_L16P_T2U_N6_QBC_AD3P_64
#
#
# QSFP1 Clock Control Signals
#      - FS[1:0] <-- Clock Select Pin FS[1:0] = 1X -> 161.132812 MHz 1.8V LVDS (default when FPGA pin Hi-Z due to 10K pullups)
#                                     FS[1:0] = 01 -> 156.250000 MHz 1.8V LVDS
#      - RESET <-- Device Reset - Asserting this pin (driving high) is required to change FS1,FS0 pin setting. 
#                PINS: "QSFP1_RECLK_RESET"   - IO_L8N_T1L_N3_AD5N_64_AR21
#
# set_property -dict {PACKAGE_PIN AR22 IOSTANDARD LVCMOS12       } [get_ports QSFP1_FS[0]       ]; # Bank 64 VCCO - VCC1V2 Net "QSFP1_FS0"           - IO_L8P_T1L_N2_AD5P_64
# set_property -dict {PACKAGE_PIN AU20 IOSTANDARD LVCMOS12       } [get_ports QSFP1_FS[1]       ]; # Bank 64 VCCO - VCC1V2 Net "QSFP1_FS1"           - IO_L7N_T1L_N1_QBC_AD13N_64
# set_property -dict {PACKAGE_PIN AR21 IOSTANDARD LVCMOS12       } [get_ports QSFP1_REFCLK_RESET]; # Bank 64 VCCO - VCC1V2 Net "QSFP1_REFCLK_RESET"  - IO_L8N_T1L_N3_AD5N_64
#
## ---- QSFP1 MGTY Interface
#set_property PACKAGE_PIN U3  [get_ports QSFP1_RX1_N]; # Bank 230  - MGTYRXN0_230
#set_property PACKAGE_PIN U4  [get_ports QSFP1_RX1_P]; # Bank 230  - MGTYRXP0_230
#set_property PACKAGE_PIN T1  [get_ports QSFP1_RX2_N]; # Bank 230  - MGTYRXN1_230
#set_property PACKAGE_PIN T2  [get_ports QSFP1_RX2_P]; # Bank 230  - MGTYRXP1_230
#set_property PACKAGE_PIN R3  [get_ports QSFP1_RX3_N]; # Bank 230  - MGTYRXN2_230
#set_property PACKAGE_PIN R4  [get_ports QSFP1_RX3_P]; # Bank 230  - MGTYRXP2_230
#set_property PACKAGE_PIN P1  [get_ports QSFP1_RX4_N]; # Bank 230  - MGTYRXN3_230
#set_property PACKAGE_PIN P2  [get_ports QSFP1_RX4_P]; # Bank 230  - MGTYRXP3_230
#set_property PACKAGE_PIN U8  [get_ports QSFP1_TX1_N]; # Bank 230  - MGTYTXN0_230
#set_property PACKAGE_PIN U9  [get_ports QSFP1_TX1_P]; # Bank 230  - MGTYTXP0_230
#set_property PACKAGE_PIN T6  [get_ports QSFP1_TX2_N]; # Bank 230  - MGTYTXN1_230
#set_property PACKAGE_PIN T7  [get_ports QSFP1_TX2_P]; # Bank 230  - MGTYTXP1_230
#set_property PACKAGE_PIN R8  [get_ports QSFP1_TX3_N]; # Bank 230  - MGTYTXN2_230
#set_property PACKAGE_PIN R9  [get_ports QSFP1_TX3_P]; # Bank 230  - MGTYTXP2_230
#set_property PACKAGE_PIN P6  [get_ports QSFP1_TX4_N]; # Bank 230  - MGTYTXN3_230
#set_property PACKAGE_PIN P7  [get_ports QSFP1_TX4_P]; # Bank 230  - MGTYTXP3_230
#
#--------------------------------------------
# Specifying the placement of QSFP clock domain modules into single SLR to facilitate routing
# https://www.xilinx.com/support/documentation/sw_manuals/xilinx2020_1/ug912-vivado-properties.pdf#page=386
#Collecting all units from correspondingly Tx and Rx domains,
#excluding AXI register slices intended to facilitate SLR crossing on the way to/from HBM located in SLR0
set tx_clk_units [get_cells -filter {NAME !~ *axi_reg_slice_tx && NAME !~ *tx_rst_gen} -of_objects [get_nets -of_objects [get_pins -hierarchical eth100gb/gt_txusrclk2]]]
set rx_clk_units [get_cells -filter {NAME !~ *axi_reg_slice_rx && NAME !~ *rx_rst_gen} -of_objects [get_nets -of_objects [get_pins -hierarchical eth100gb/gt_rxusrclk2]]]
#Since clocks are not applied to memories explicitly in BD, include them explicitly to SLR placement.
set eth_txmem [get_cells -hierarchical eth_tx_mem]
set eth_rxmem [get_cells -hierarchical eth_rx_mem]
#Setting specific SLR to which QSFP are wired since placer may miss it if just "group_name" is applied
set_property USER_SLR_ASSIGNMENT SLR2 [get_cells "$tx_clk_units $rx_clk_units $eth_txmem $eth_rxmem"]
#
#--------------------------------------------
# Timing constraints for clock domains crossings (CDC), which didn't apply automatically (e.g. for GPIO)
set sys_clk [get_clocks -of_objects [get_pins -hierarchical eth_cmac_syst/s_axi_clk]]
set tx_clk  [get_clocks -of_objects [get_pins -hierarchical eth100gb/gt_txusrclk2  ]]
set rx_clk  [get_clocks -of_objects [get_pins -hierarchical eth100gb/gt_rxusrclk2  ]]
# set_false_path -from $xxx_clk -to $yyy_clk
# controlling resync paths to be less than source clock period
# (-datapath_only to exclude clock paths)
set_max_delay -datapath_only -from $sys_clk -to $tx_clk  [expr [get_property -min period $sys_clk] * 0.9]
set_max_delay -datapath_only -from $sys_clk -to $rx_clk  [expr [get_property -min period $sys_clk] * 0.9]
set_max_delay -datapath_only -from $tx_clk  -to $sys_clk [expr [get_property -min period $tx_clk ] * 0.9]
set_max_delay -datapath_only -from $tx_clk  -to $rx_clk  [expr [get_property -min period $tx_clk ] * 0.9]
set_max_delay -datapath_only -from $rx_clk  -to $sys_clk [expr [get_property -min period $rx_clk ] * 0.9]
set_max_delay -datapath_only -from $rx_clk  -to $tx_clk  [expr [get_property -min period $rx_clk ] * 0.9]
## ================================
