## ================ Ethernet ================
## Commented pin locations are applied automatically due to configurations inside Ethernet CMAC core (made in BD)
#--------------------------------------------
## Input Clocks and Controls for QSFP28 Port 0
#
## MGT_SI570_CLOCK0   -> MGT Ref Clock 0 156.25MHz Default (Not User re-programmable)
# set_property PACKAGE_PIN T43      [get_ports "MGT_SI570_CLOCK0_N"]  ;# Bank 134 - MGTREFCLK0N_134, platform: io_clk_gtyquad_refclk0_00_clk_n
# set_property PACKAGE_PIN T42      [get_ports "MGT_SI570_CLOCK0_P"]  ;# Bank 134 - MGTREFCLK0P_134, platform: io_clk_gtyquad_refclk0_00_clk_p
set_property PACKAGE_PIN T43      [get_ports "qsfp0_ref_clk_n"]  ;# Bank 134 - MGTREFCLK0N_134, platform: io_clk_gtyquad_refclk0_00_clk_n
set_property PACKAGE_PIN T42      [get_ports "qsfp0_ref_clk_p"]  ;# Bank 134 - MGTREFCLK0P_134, platform: io_clk_gtyquad_refclk0_00_clk_p
#
## QSFP0_CLOCK        -> MGT Ref Clock 1 User selectable by QSFP0_FS=0 161.132812 MHz and QSFP0_FS=1 156.250MHz; QSFP0_OEB must driven low to enable clock output
# set_property PACKAGE_PIN R41      [get_ports "QSFP0_CLOCK_N"]  ;# Bank 134 - MGTREFCLK1N_134, platform: io_clk_gtyquad_refclk1_00_clk_n
# set_property PACKAGE_PIN R40      [get_ports "QSFP0_CLOCK_P"]  ;# Bank 134 - MGTREFCLK1P_134, platform: io_clk_gtyquad_refclk1_00_clk_p
#
## QSFP0_CLOCK control signals
# set_property PACKAGE_PIN G32       [get_ports "qsfp_fs" ]  ;# Bank  75 VCCO - VCC1V8 Net "QSFP0_FS"   - IO_L9N_T1L_N5_AD12N_75, platform: QSFP0_FS[0:0]
# set_property IOSTANDARD  LVCMOS18  [get_ports "qsfp_fs" ]  ;# Bank  75 VCCO - VCC1V8 Net "QSFP0_FS"   - IO_L9N_T1L_N5_AD12N_75
# set_property PACKAGE_PIN H32       [get_ports "qsfp_oeb"]  ;# Bank  75 VCCO - VCC1V8 Net "QSFP0_OEB"  - IO_L9P_T1L_N4_AD12P_75, platform: QSFP0_OEB[0:0]
# set_property IOSTANDARD  LVCMOS18  [get_ports "qsfp_oeb"]  ;# Bank  75 VCCO - VCC1V8 Net "QSFP0_OEB"  - IO_L9P_T1L_N4_AD12P_75
#
## QSFP0 MGTY Interface
# set_property PACKAGE_PIN L54       [get_ports "QSFP0_RX1_N"]  ;# Bank 134 - MGTYRXN0_134, platform: io_gt_gtyquad_00[_grx_n[0]]
# set_property PACKAGE_PIN K52       [get_ports "QSFP0_RX2_N"]  ;# Bank 134 - MGTYRXN1_134, platform: io_gt_gtyquad_00[_grx_n[1]]
# set_property PACKAGE_PIN J54       [get_ports "QSFP0_RX3_N"]  ;# Bank 134 - MGTYRXN2_134, platform: io_gt_gtyquad_00[_grx_n[2]]
# set_property PACKAGE_PIN H52       [get_ports "QSFP0_RX4_N"]  ;# Bank 134 - MGTYRXN3_134, platform: io_gt_gtyquad_00[_grx_n[4]]
# set_property PACKAGE_PIN L53       [get_ports "QSFP0_RX1_P"]  ;# Bank 134 - MGTYRXP0_134, platform: io_gt_gtyquad_00[_grx_p[0]]
# set_property PACKAGE_PIN K51       [get_ports "QSFP0_RX2_P"]  ;# Bank 134 - MGTYRXP1_134, platform: io_gt_gtyquad_00[_grx_p[1]]
# set_property PACKAGE_PIN J53       [get_ports "QSFP0_RX3_P"]  ;# Bank 134 - MGTYRXP2_134, platform: io_gt_gtyquad_00[_grx_p[2]]
# set_property PACKAGE_PIN H51       [get_ports "QSFP0_RX4_P"]  ;# Bank 134 - MGTYRXP3_134, platform: io_gt_gtyquad_00[_grx_p[4]]
# set_property PACKAGE_PIN L49       [get_ports "QSFP0_TX1_N"]  ;# Bank 134 - MGTYTXN0_134, platform: io_gt_gtyquad_00[_gtx_n[0]]
# set_property PACKAGE_PIN L45       [get_ports "QSFP0_TX2_N"]  ;# Bank 134 - MGTYTXN1_134, platform: io_gt_gtyquad_00[_gtx_n[1]]
# set_property PACKAGE_PIN K47       [get_ports "QSFP0_TX3_N"]  ;# Bank 134 - MGTYTXN2_134, platform: io_gt_gtyquad_00[_gtx_n[2]]
# set_property PACKAGE_PIN J49       [get_ports "QSFP0_TX4_N"]  ;# Bank 134 - MGTYTXN3_134, platform: io_gt_gtyquad_00[_gtx_n[3]]
# set_property PACKAGE_PIN L48       [get_ports "QSFP0_TX1_P"]  ;# Bank 134 - MGTYTXP0_134, platform: io_gt_gtyquad_00[_gtx_p[0]]
# set_property PACKAGE_PIN L44       [get_ports "QSFP0_TX2_P"]  ;# Bank 134 - MGTYTXP1_134, platform: io_gt_gtyquad_00[_gtx_p[1]]
# set_property PACKAGE_PIN K46       [get_ports "QSFP0_TX3_P"]  ;# Bank 134 - MGTYTXP2_134, platform: io_gt_gtyquad_00[_gtx_p[2]]
# set_property PACKAGE_PIN J48       [get_ports "QSFP0_TX4_P"]  ;# Bank 134 - MGTYTXP3_134, platform: io_gt_gtyquad_00[_gtx_p[3]]
#
#--------------------------------------------
# Input Clocks and Controls for QSFP28 Port 1
#
## MGT_SI570_CLOCK1_N   -> MGT Ref Clock 0 156.25MHz Default (Not User re-programmable)
# set_property PACKAGE_PIN P43       [get_ports "MGT_SI570_CLOCK1_N"] ;# Bank 135 - MGTREFCLK0N_135, platform: io_clk_gtyquad_refclk0_01_clk_n
# set_property PACKAGE_PIN P42       [get_ports "MGT_SI570_CLOCK1_P"] ;# Bank 135 - MGTREFCLK0P_135, platform: io_clk_gtyquad_refclk0_01_clk_p
set_property PACKAGE_PIN P43       [get_ports "qsfp1_ref_clk_n"] ;# Bank 135 - MGTREFCLK0N_135, platform: io_clk_gtyquad_refclk0_01_clk_n
set_property PACKAGE_PIN P42       [get_ports "qsfp1_ref_clk_p"] ;# Bank 135 - MGTREFCLK0P_135, platform: io_clk_gtyquad_refclk0_01_clk_p
#
## QSFP1_CLOCK_N        -> MGT Ref Clock 1 User selectable by QSFP1_FS=0 161.132812 MHz and QSFP1_FS=1 156.250MHz; QSFP1_OEB must be low to enable clock output
# set_property PACKAGE_PIN M43       [get_ports "QSFP1_CLOCK_N"]  ;# Bank 135 - MGTREFCLK1N_135, platform: io_clk_gtyquad_refclk1_01_clk_n
# set_property PACKAGE_PIN M42       [get_ports "QSFP1_CLOCK_P"]  ;# Bank 135 - MGTREFCLK1P_135, platform: io_clk_gtyquad_refclk1_01_clk_p
#
## QSFP1_CLOCK control signals
# set_property PACKAGE_PIN H30       [get_ports "qsfp_oeb"]  ;# Bank  75 VCCO - VCC1V8 Net "QSFP1_OEB"  - IO_L8N_T1L_N3_AD5N_75     , platform: QSFP1_OEB[0:0]
# set_property IOSTANDARD  LVCMOS18  [get_ports "qsfp_oeb"]  ;# Bank  75 VCCO - VCC1V8 Net "QSFP1_OEB"  - IO_L8N_T1L_N3_AD5N_75
# set_property PACKAGE_PIN G33       [get_ports "qsfp_fs" ]  ;# Bank  75 VCCO - VCC1V8 Net "QSFP1_FS"   - IO_L7N_T1L_N1_QBC_AD13N_75, platform: QSFP1_FS[0:0]
# set_property IOSTANDARD  LVCMOS18  [get_ports "qsfp_fs" ]  ;# Bank  75 VCCO - VCC1V8 Net "QSFP1_FS"   - IO_L7N_T1L_N1_QBC_AD13N_75
#
## QSFP1 MGTY Interface
# set_property PACKAGE_PIN G54       [get_ports "QSFP1_RX1_N"]  ;# Bank 135 - MGTYRXN0_135, platform: io_gt_gtyquad_01[_grx_n[0]]
# set_property PACKAGE_PIN F52       [get_ports "QSFP1_RX2_N"]  ;# Bank 135 - MGTYRXN1_135, platform: io_gt_gtyquad_01[_grx_n[1]]
# set_property PACKAGE_PIN E54       [get_ports "QSFP1_RX3_N"]  ;# Bank 135 - MGTYRXN2_135, platform: io_gt_gtyquad_01[_grx_n[2]]
# set_property PACKAGE_PIN D52       [get_ports "QSFP1_RX4_N"]  ;# Bank 135 - MGTYRXN3_135, platform: io_gt_gtyquad_01[_grx_n[4]]
# set_property PACKAGE_PIN G53       [get_ports "QSFP1_RX1_P"]  ;# Bank 135 - MGTYRXP0_135, platform: io_gt_gtyquad_01[_grx_p[0]]
# set_property PACKAGE_PIN F51       [get_ports "QSFP1_RX2_P"]  ;# Bank 135 - MGTYRXP1_135, platform: io_gt_gtyquad_01[_grx_p[1]]
# set_property PACKAGE_PIN E53       [get_ports "QSFP1_RX3_P"]  ;# Bank 135 - MGTYRXP2_135, platform: io_gt_gtyquad_01[_grx_p[2]]
# set_property PACKAGE_PIN D51       [get_ports "QSFP1_RX4_P"]  ;# Bank 135 - MGTYRXP3_135, platform: io_gt_gtyquad_01[_grx_p[4]]
# set_property PACKAGE_PIN G49       [get_ports "QSFP1_TX1_N"]  ;# Bank 135 - MGTYTXN0_135, platform: io_gt_gtyquad_01[_gtx_n[0]]
# set_property PACKAGE_PIN E49       [get_ports "QSFP1_TX2_N"]  ;# Bank 135 - MGTYTXN1_135, platform: io_gt_gtyquad_01[_gtx_n[1]]
# set_property PACKAGE_PIN C49       [get_ports "QSFP1_TX3_N"]  ;# Bank 135 - MGTYTXN2_135, platform: io_gt_gtyquad_01[_gtx_n[2]]
# set_property PACKAGE_PIN A50       [get_ports "QSFP1_TX4_N"]  ;# Bank 135 - MGTYTXN3_135, platform: io_gt_gtyquad_01[_gtx_n[3]]
# set_property PACKAGE_PIN G48       [get_ports "QSFP1_TX1_P"]  ;# Bank 135 - MGTYTXP0_135, platform: io_gt_gtyquad_01[_gtx_p[0]]
# set_property PACKAGE_PIN E48       [get_ports "QSFP1_TX2_P"]  ;# Bank 135 - MGTYTXP1_135, platform: io_gt_gtyquad_01[_gtx_p[1]]
# set_property PACKAGE_PIN C48       [get_ports "QSFP1_TX3_P"]  ;# Bank 135 - MGTYTXP2_135, platform: io_gt_gtyquad_01[_gtx_p[2]]
# set_property PACKAGE_PIN A49       [get_ports "QSFP1_TX4_P"]  ;# Bank 135 - MGTYTXP3_135, platform: io_gt_gtyquad_01[_gtx_p[3]]
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
