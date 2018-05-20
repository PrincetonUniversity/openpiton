# This file is a general .xdc for the Nexys4 DDR Rev. C
# To use it in a project:
# - uncomment the lines corresponding to used pins
# - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property PACKAGE_PIN E3 [get_ports pin_clk]
set_property IOSTANDARD LVCMOS33 [get_ports pin_clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports pin_clk]
create_clock -period 40.000 -name sys_clk -add [get_nets core_ref_clk]

# Reset
set_property PACKAGE_PIN C12 [get_ports pin_rst]
set_property IOSTANDARD LVCMOS33 [get_ports pin_rst]

# UART
#IO_L11N_T1_SRCC_35 Sch=uart_rxd_out
set_property PACKAGE_PIN D4 [get_ports pin_tx]
set_property IOSTANDARD LVCMOS33 [get_ports pin_tx]
set_property PACKAGE_PIN C4 [ get_ports pin_rx]
set_property IOSTANDARD LVCMOS33 [ get_ports pin_rx]

# GP buttons
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { pin_soft_rst }]

## LEDs

set_property PACKAGE_PIN H17 [get_ports led_0]
set_property IOSTANDARD LVCMOS33 [get_ports led_0]
set_property PACKAGE_PIN K15 [get_ports led_1]
set_property IOSTANDARD LVCMOS33 [get_ports led_1]
set_property PACKAGE_PIN J13 [get_ports led_2]
set_property IOSTANDARD LVCMOS33 [get_ports led_2]
set_property PACKAGE_PIN N14 [get_ports led_3]
set_property IOSTANDARD LVCMOS33 [get_ports led_3]
set_property PACKAGE_PIN R18 [get_ports led_4]
set_property IOSTANDARD LVCMOS33 [get_ports led_4]
set_property PACKAGE_PIN V17 [get_ports led_5]
set_property IOSTANDARD LVCMOS33 [get_ports led_5]
set_property PACKAGE_PIN U17 [get_ports fake_noc2_ored]
set_property IOSTANDARD LVCMOS33 [get_ports fake_noc2_ored]
set_property PACKAGE_PIN U16 [get_ports fake_noc3_ored]
set_property IOSTANDARD LVCMOS33 [get_ports fake_noc3_ored]
set_property PACKAGE_PIN V16 [get_ports init_calib_complete]
set_property IOSTANDARD LVCMOS33 [get_ports init_calib_complete]
#set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { LED[9] }]; #IO_L14N_T2_SRCC_14 Sch=led[9]
#set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { LED[10] }]; #IO_L22P_T3_A05_D21_14 Sch=led[10]
#set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { LED[11] }]; #IO_L15N_T2_DQS_DOUT_CSO_B_14 Sch=led[11]
#set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { LED[12] }]; #IO_L16P_T2_CSI_B_14 Sch=led[12]
#set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports { LED[13] }]; #IO_L22N_T3_A04_D20_14 Sch=led[13]
#set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { LED[14] }]; #IO_L20N_T3_A07_D23_14 Sch=led[14]
#set_property -dict { PACKAGE_PIN V11   IOSTANDARD LVCMOS33 } [get_ports { LED[15] }]; #IO_L21N_T3_DQS_A06_D22_14 Sch=led[15]

