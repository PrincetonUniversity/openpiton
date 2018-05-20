# Clock signals
set_property IOSTANDARD LVCMOS33 [get_ports pin_clk]
set_property PACKAGE_PIN R4 [get_ports pin_clk]

# set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets clk_mmcm/inst/clk_in1_clk_mmcm]

# Constraint core clock

# Reset
set_property IOSTANDARD LVCMOS15 [get_ports pin_rst]
set_property PACKAGE_PIN G4 [get_ports pin_rst]

# False paths
set_false_path -to [get_cells -hierarchical *afifo_ui_rst_r*]
set_false_path -to [get_cells -hierarchical *ui_clk_sync_rst_r*]
set_false_path -to [get_cells -hierarchical *ui_clk_syn_rst_delayed*]
set_false_path -to [get_cells init_calib_complete_r*]


#### UART
#IO_L11N_T1_SRCC_35 Sch=uart_rxd_out
set_property IOSTANDARD LVCMOS33 [get_ports pin_rx]
set_property PACKAGE_PIN V18 [get_ports pin_rx]
set_property IOSTANDARD LVCMOS33 [get_ports pin_tx]
set_property PACKAGE_PIN AA19 [get_ports pin_tx]

# Loopback control for UART
set_property IOSTANDARD LVCMOS12 [get_ports uart_lb_sw]
set_property PACKAGE_PIN E22 [get_ports uart_lb_sw]

# Soft reset
set_property IOSTANDARD LVCMOS12 [get_ports pin_soft_rst]
set_property PACKAGE_PIN B22 [get_ports pin_soft_rst]

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

set_property PACKAGE_PIN T14 [get_ports led_0]
set_property IOSTANDARD LVCMOS25 [get_ports led_0]
set_property PACKAGE_PIN T15 [get_ports led_1]
set_property IOSTANDARD LVCMOS25 [get_ports led_1]
set_property PACKAGE_PIN T16 [get_ports led_2]
set_property IOSTANDARD LVCMOS25 [get_ports led_2]
set_property PACKAGE_PIN U16 [get_ports led_3]
set_property IOSTANDARD LVCMOS25 [get_ports led_3]
set_property PACKAGE_PIN V15 [get_ports led_4]
set_property IOSTANDARD LVCMOS25 [get_ports led_4]
set_property PACKAGE_PIN W16 [get_ports fake_noc2_ored]
set_property IOSTANDARD LVCMOS25 [get_ports fake_noc2_ored]
set_property PACKAGE_PIN W15 [get_ports fake_noc3_ored]
set_property IOSTANDARD LVCMOS25 [get_ports fake_noc3_ored]
set_property PACKAGE_PIN Y13 [get_ports init_calib_complete]
set_property IOSTANDARD LVCMOS25 [get_ports init_calib_complete]


### False paths
set_false_path -from [get_clocks clk_pll_i] -to [get_clocks clk_pll_i_1]
set_clock_groups -name sync_gr1 -logically_exclusive -group core_ref_clk_clk_mmcm -group [get_clocks -include_generated_clocks mc_sys_clk_clk_mmcm]
