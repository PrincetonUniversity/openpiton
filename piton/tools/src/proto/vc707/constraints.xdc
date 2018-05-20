# This file is a general .xdc for the Nexys4 DDR Rev. C
# To use it in a project:
# - uncomment the lines corresponding to used pins
# - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property IOSTANDARD LVDS [get_ports clk_p]
set_property PACKAGE_PIN E18 [get_ports clk_n]
set_property IOSTANDARD LVDS [get_ports clk_n]

set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets clk_mmcm/inst/clk_in1_clk_mmcm]

# Reset
set_property IOSTANDARD LVCMOS18 [get_ports pin_rst]
set_property PACKAGE_PIN AV40 [get_ports pin_rst]

# False paths
set_false_path -to [get_cells -hierarchical *afifo_ui_rst_r*]
set_false_path -to [get_cells -hierarchical *ui_clk_sync_rst_r*]
set_false_path -to [get_cells -hierarchical *ui_clk_syn_rst_delayed*]
set_false_path -to [get_cells init_calib_complete_r*]

set_clock_groups -name sync_gr1 -logically_exclusive -group core_ref_clk_clk_mmcm -group [get_clocks -include_generated_clocks mc_sys_clk_clk_mmcm]

# UART
#IO_L11N_T1_SRCC_35 Sch=uart_rxd_out
set_property IOSTANDARD LVCMOS18 [get_ports pin_tx]
set_property PACKAGE_PIN AU36 [get_ports pin_tx]
set_property IOSTANDARD LVCMOS18 [get_ports pin_rx]
set_property PACKAGE_PIN AU33 [get_ports pin_rx]

# SD
set_property IOSTANDARD LVCMOS18 [get_ports spi_clk_out]
set_property PACKAGE_PIN AN30 [get_ports spi_clk_out]
set_property IOSTANDARD LVCMOS18 [get_ports spi_data_in]
set_property PACKAGE_PIN AR30 [get_ports spi_data_in]
set_property IOSTANDARD LVCMOS18 [get_ports spi_data_out]
set_property PACKAGE_PIN AP30 [get_ports spi_data_out]
set_property IOSTANDARD LVCMOS18 [get_ports spi_cs_n]
set_property PACKAGE_PIN AT30 [get_ports spi_cs_n]

set_property PACKAGE_PIN AV30 [get_ports uart_lb_sw]
set_property IOSTANDARD LVCMOS18 [get_ports uart_lb_sw]

## LEDs

set_property PACKAGE_PIN AM39 [get_ports led_0]
set_property IOSTANDARD LVCMOS18 [get_ports led_0]
set_property PACKAGE_PIN AN39 [get_ports led_1]
set_property IOSTANDARD LVCMOS18 [get_ports led_1]
set_property PACKAGE_PIN AR37 [get_ports led_2]
set_property IOSTANDARD LVCMOS18 [get_ports led_2]
set_property PACKAGE_PIN AT37 [get_ports led_3]
set_property IOSTANDARD LVCMOS18 [get_ports led_3]
set_property PACKAGE_PIN AR35 [get_ports led_4]
set_property IOSTANDARD LVCMOS18 [get_ports led_4]
set_property PACKAGE_PIN AP41 [get_ports fake_noc2_ored]
set_property IOSTANDARD LVCMOS18 [get_ports fake_noc2_ored]
set_property PACKAGE_PIN AP42 [get_ports fake_noc3_ored]
set_property IOSTANDARD LVCMOS18 [get_ports fake_noc3_ored]
set_property PACKAGE_PIN AU39 [get_ports init_calib_complete]
set_property IOSTANDARD LVCMOS18 [get_ports init_calib_complete]

set_false_path -from [get_clocks clk_pll_i] -to [get_clocks clk_pll_i_1]

