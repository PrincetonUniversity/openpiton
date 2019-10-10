// Copyright (c) 2015 Princeton University
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Header file for FPGA and system level macros

// Generally, if doing FPGA synth, certain things
// are not needed or are fixed, always.  These
// can be used for other purposes though
`ifdef PITON_FPGA_SYNTH
    `define PITON_NO_JTAG
    `define USE_FAKE_IOS
`endif // endif PITON_FPGA_SYNTH

// If we are doing FPGA prototype,
// at least for now, all prototypes
// include chip+chipset in same FPGA,
// include a real io_ctrl module,
// include a UART (not necessarily for boot),
// and include an SPI (not always used for boot,
// but for top-level constraints I/Os are needed)
// so the following macros always apply
`ifdef PITON_FULL_SYSTEM
    `define PITON_CHIPSET_CLKS_GEN
    `define PITON_CLKS_CHIPSET
    `define PITONSYS_IOCTRL
    `define PITONSYS_UART
    `define PITONSYS_SPI
`endif

`ifdef PITON_NOC_POWER_CHIPSET_TEST
    `define PITONSYS_NO_MC
    // Oddly this needs to be set, but
    // no io_ctrl is used, it just
    // makes it so there are no additional
    // interface signals to chipset_impl
    `define PITONSYS_IOCTRL
// Only for FPGA synthesis
`ifdef PITON_FPGA_SYNTH
    `define PITON_CHIPSET_CLKS_GEN
    `ifdef PITON_ASIC_CHIPSET
        `define PITON_CLKS_PASSTHRU
        `define PITONSYS_INC_PASSTHRU
    `endif
    `ifdef PITON_BOARD_CHIPSET
        `define PITON_CLKS_CHIPSET
    `endif
    `ifndef PITON_NOC_POWER_CHIPSET_TEST_HOP_COUNT
        `define PITON_NOC_POWER_CHIPSET_TEST_HOP_COUNT 0
    `endif // PITON_NOC_POWER_CHIPSET_TEST_HOP_COUNT
    // Don't actually need UART, but
    // constraints complain for piton board
    // fpga synthesis if we don't have it
    `define PITONSYS_UART
    // Don't want everything from PITON_ASIC_CHIPSET
    `undef PITON_ASIC_CHIPSET
    // Don't want everything from PITON_BOARD_CHIPSET
    `undef PITON_BOARD_CHIPSET
    // Don't want SPI
    `undef PITON_FPGA_SD_BOOT
`endif // endif PITON_FPGA_SYNTH
`endif // PITON_NOC_POWER_CHIPSET_TEST

// If we are synthesizing chipset
// for use with piton ASIC, we need
// these macros
`ifdef PITON_ASIC_CHIPSET
    `define PITON_CHIPSET_CLKS_GEN
    `define PITONSYS_INC_PASSTHRU
    `define PITON_CLKS_PASSTHRU
    `define PITONSYS_IOCTRL
    `define PITONSYS_UART
    `define PITONSYS_SPI
`endif // endif PITON_ASIC_CHIPSET

`ifdef PITON_BOARD_CHIPSET
    `define PITON_CHIPSET_CLKS_GEN
    `define PITON_CLKS_CHIPSET
    `define PITONSYS_IOCTRL
    `define PITONSYS_UART
`endif  // PITON_BOARD_CHIPSET

// If we are synthesizing the chip
// only for FPGA, we need to use these
// macros
`ifdef PITON_CHIP_FPGA
    `define PITON_FPGA_CLKS_GEN
`endif

`ifndef PITON_CLKS_CHIPSET
`ifndef PITON_CLKS_PASSTHRU
    `define PITON_CLKS_SIM
`endif // endif PITON_CLKS_PASSTHRU
`endif // endif PITON_CLKS_CHIPSET

`ifdef VC707_BOARD
    `define PITON_CHIPSET_DIFF_CLK
`elsif VCU118_BOARD
    `define PITON_CHIPSET_DIFF_CLK
`elsif XUPP3R_BOARD
    `define PITON_CHIPSET_DIFF_CLK
`elsif GENESYS2_BOARD
    `define PITON_CHIPSET_DIFF_CLK
`elsif PITON_BOARD
    `define PITON_CHIPSET_DIFF_CLK
    `define PITON_CHIPSET_DIFF_CLK_POLARITY_CAPS
    `define PITON_FPGA_AFIFO_NO_SRST
`endif
// Nexys4ddr and NexysVideo has single ended clock input

// Reset is active high on VC707 and VCU118
`ifdef VC707_BOARD
    `define PITON_FPGA_RST_ACT_HIGH
`elsif VCU118_BOARD
    `define PITON_FPGA_RST_ACT_HIGH
`endif

`ifdef XUPP3R_BOARD
    `undef PITON_FPGA_SD_BOOT
    `undef PITONSYS_SPI
`elsif F1_BOARD
    `undef PITON_FPGA_SD_BOOT
    `undef PITONSYS_SPI
    `define PITONSYS_AXI4_MEM
`endif

// If PITON_FPGA_SD_BOOT is set we should always include SPI
`ifdef PITON_FPGA_SD_BOOT
    `define PITONSYS_SPI
`endif // endif PITON_FPGA_SD_BOOT

// If PITONSYS_UART_BOOT is set, we should always include a UART
`ifdef PITONSYS_UART_BOOT
    `define PITONSYS_UART
`endif // endif PITONSYS_UART_BOOT

`ifdef VCU118_BOARD
    `define PITONSYS_DDR4
`elsif XUPP3R_BOARD
    `define PITONSYS_DDR4
`endif
