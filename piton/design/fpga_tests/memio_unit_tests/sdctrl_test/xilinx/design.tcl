# Copyright (c) 2017 Princeton University
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

#
# Design specific variables.
# Not intended to be run standalone.
#

set DESIGN_NAME "sdctrl_test"

set DESIGN_INCLUDE_DIRS ""

set DESIGN_DEFAULT_VERILOG_MACROS "SDCTRL_TEST"

set DESIGN_RTL_IMPL_FILES [concat \
    ${DV_ROOT}/design/fpga_tests/memio_unit_tests/sdctrl_test/rtl/sdctrl_test.v \
    ${DV_ROOT}/design/fpga_tests/memio_unit_tests/common/rtl/mem_test_seq_driver.v \
    ${DV_ROOT}/design/fpga_tests/memio_unit_tests/common/rtl/mem_test_par_driver.v \
    ${DV_ROOT}/design/fpga_tests/memio_unit_tests/common/rtl/walk_ones_addrdata.v \
    ${DV_ROOT}/design/fpga_tests/memio_unit_tests/common/rtl/address_own_addrdata.v \
    ${DV_ROOT}/design/fpga_tests/memio_unit_tests/common/rtl/random_addrdata.v \
    ${DV_ROOT}/design/fpga_tests/memio_unit_tests/common/rtl/random_data_addrdata.v \
    ${DV_ROOT}/design/chipset/noc_axilite_bridge/rtl/noc_axilite_bridge.v \
    ${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/axi_sd_bridge.v \
    ${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/sd_block_cache.v \
    ${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/sd_wishbone_transaction_manager.v \
    ${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/spi_master.v \
    ${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/spi_master_wishbone_decoder.v \
    ${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/status_register_control.v \
    ${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/spi_control.v \
    ${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/init_sd.v \
    ${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/read_write_sd_block.v \
    ${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/send_cmd.v \
    ${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/spi_tx_rx_data.v \
    ${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/rwspi_wire_data.v \
    ${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/sm_tx_fifo.v \
    ${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/sm_rx_fifo.v \
    ${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/sm_fifo_rtl.v \
    ${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/sm_dp_mem_dc.v \
    ${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/sm_tx_fifo_bi.v \
    ${DV_ROOT}/design/chipset/axi_sd_bridge/rtl/sm_rx_fifo_bi.v \
    ${DV_ROOT}/design/chip/tile/sparc/ifu/rtl/sparc_ifu_esl_lfsr.v \
    ${DV_ROOT}/design/common/rtl/alarm_counter.v \
    ${CHIPSET_RTL_IMPL_FILES} \
]

set DESIGN_INCLUDE_FILES [concat \
    ${CHIPSET_INCLUDE_FILES}
]

set DESIGN_IP_FILE_PREFIXES [concat \
    ${DV_ROOT}/design/fpga_tests/memio_unit_tests/common/xilinx/${BOARD}/ip_cores/clk_mmcm_memio_unit_tests/clk_mmcm_memio_unit_tests \
    ${CHIPSET_IP_FILE_PREFIXES} \
]

set DESIGN_COE_IP_FILES [concat \
]

set DESIGN_PRJ_IP_FILES [concat \
    ${CHIPSET_PRJ_IP_FILES} \
]
