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

set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets clk_mmcm_memio_unit_tests/inst/clk_in1_clk_mmcm_memio_unit_tests]

# Reset
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]
set_property PACKAGE_PIN R19 [get_ports rst_n]

# Switches
set_property PACKAGE_PIN G19 [get_ports sw[0]]
set_property IOSTANDARD LVCMOS12 [get_ports sw[0]]
set_property PACKAGE_PIN G25 [get_ports sw[1]]
set_property IOSTANDARD LVCMOS12 [get_ports sw[1]]
set_property PACKAGE_PIN H24 [get_ports sw[2]]
set_property IOSTANDARD LVCMOS12 [get_ports sw[2]]
set_property PACKAGE_PIN K19 [get_ports sw[3]]
set_property IOSTANDARD LVCMOS12 [get_ports sw[3]]
set_property PACKAGE_PIN N19 [get_ports sw[4]]
set_property IOSTANDARD LVCMOS12 [get_ports sw[4]]
set_property PACKAGE_PIN P19 [get_ports sw[5]]
set_property IOSTANDARD LVCMOS12 [get_ports sw[5]]
set_property PACKAGE_PIN P26 [get_ports sw[6]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[6]]
set_property PACKAGE_PIN P27 [get_ports sw[7]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[7]]

# LEDs
set_property PACKAGE_PIN T28 [get_ports led[0]]
set_property IOSTANDARD LVCMOS33 [get_ports led[0]]
set_property PACKAGE_PIN V19 [get_ports led[1]]
set_property IOSTANDARD LVCMOS33 [get_ports led[1]]
set_property PACKAGE_PIN U30 [get_ports led[2]]
set_property IOSTANDARD LVCMOS33 [get_ports led[2]]
set_property PACKAGE_PIN U29 [get_ports led[3]]
set_property IOSTANDARD LVCMOS33 [get_ports led[3]]
set_property PACKAGE_PIN V20 [get_ports led[4]]
set_property IOSTANDARD LVCMOS33 [get_ports led[4]]
set_property PACKAGE_PIN V26 [get_ports led[5]]
set_property IOSTANDARD LVCMOS33 [get_ports led[5]]
set_property PACKAGE_PIN W24 [get_ports led[6]]
set_property IOSTANDARD LVCMOS33 [get_ports led[6]]
set_property PACKAGE_PIN W23 [get_ports led[7]]
set_property IOSTANDARD LVCMOS33 [get_ports led[7]]

# SD card SPI
set_property IOSTANDARD LVCMOS33 [get_ports spi_clk_out]
set_property PACKAGE_PIN R28 [get_ports spi_clk_out]
set_property IOSTANDARD LVCMOS33 [get_ports spi_data_in]
set_property PACKAGE_PIN R26 [get_ports spi_data_in]
set_property IOSTANDARD LVCMOS33 [get_ports spi_data_out]
set_property PACKAGE_PIN R29 [get_ports spi_data_out]
set_property IOSTANDARD LVCMOS33 [get_ports spi_cs_n]
set_property PACKAGE_PIN T30 [get_ports spi_cs_n]
