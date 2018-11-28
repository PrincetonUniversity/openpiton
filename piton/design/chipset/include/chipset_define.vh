// ========== Copyright Header Begin ============================================
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
// ========== Copyright Header End ============================================

`define PITON_BRAM_TEST_WIDTH   512

`ifdef  PITON_BOARD
    `define     PITON_BRAM_TEST_DEPTH   8192
`else   // PITON_BOARD
    `define     PITON_BRAM_TEST_DEPTH   16384
`endif

`ifdef PITON_BOARD
    `define     PITON_BOOT_BRAM_DEPTH       256
    `define     PITON_BOOT_BRAM_ADDR_WIDTH  8
`else   // PITON_BOARD
    `ifdef PITONSYS_UART_BOOT
        `define     PITON_BOOT_BRAM_DEPTH       16384
        `define     PITON_BOOT_BRAM_ADDR_WIDTH  14
    `else   // PITONSYS_UART_BOOT
        `define     PITON_BOOT_BRAM_DEPTH       256
        `define     PITON_BOOT_BRAM_ADDR_WIDTH  8
    `endif
`endif  // PITON_BOARD
`define     PITON_BOOT_BRAM_DATA_WIDTH  512

`define RD_START_ADDR       40'haaaaaaaaaa
`define RD_STOP_ADDR        40'hffffffffff

`define DDR3_MAX_ADDR       40'h8000000   // 2**27 of 8 bytes (1 GB)
`define BOOT_SIZE           40'h20000     // 2**17 of 8 bytes (1 MB)
`define DISK_SIZE           40'h800000    // 2**23 of 8 bytes (64 MB)

`define VA_BOOT_BASE        40'hfff0000000
`define MIG_BOOT_BASE       `DDR3_MAX_ADDR - `BOOT_SIZE
`define VA_DISK_BASE        40'hfff1000000
`define MIG_DISK_BASE       `DDR3_MAX_ADDR - `BOOT_SIZE - `DISK_SIZE

`define PC_FLIT_WIDTH       8
`define PC_ADDR_WIDTH       40
`define PC_MAX_BLK_CNT      255
`define PC_BLK_NUM_WIDTH    clogb2(`PC_MAX_BLK_CNT+1)

// see network_define.v for used defines
`define PC_BLK_WIDTH            8*64
`define STRG_BLK_WIDTH          `PC_BLK_WIDTH
`define STRG_BLK_ALIGN_WIDTH    6   // logb2(`PAYLOAD_LEN*`NOC_DATA_WIDTH)

// `define PC_BLK_IN_STRG_BLK      `STRG_BLK_WIDTH/`PC_BLK_WIDTH
`define PC_BLK_IN_STRG_BLK      1
`define PC_FLITS_IN_ADDR        `PC_ADDR_WIDTH/`PC_FLIT_WIDTH
`define PC_FLITS_IN_BLK_NUM     1
`define PC_FLITS_IN_BLK         `PC_BLK_WIDTH/`PC_FLIT_WIDTH

`ifdef PITON_FPGA_BRAM_TEST // 64-bit PHY
    `define ADDR_TRANS_PHYS_WIDTH_ALIGN     6
    `define ADDR_TRANS_SECTION_MULT         1
`elsif NEXYSVIDEO_BOARD     // 16-bit PHY
    `define ADDR_TRANS_PHYS_WIDTH_ALIGN     4
    `define ADDR_TRANS_SECTION_MULT         4
`elsif GENESYS2_BOARD       // 32-bit PHY
    `define ADDR_TRANS_PHYS_WIDTH_ALIGN     5
    `define ADDR_TRANS_SECTION_MULT         2
`else   // 64-bit interface by default
    `define ADDR_TRANS_PHYS_WIDTH_ALIGN     6
    `define ADDR_TRANS_SECTION_MULT         1
`endif

`define ASM_TIMEOUT_CYCLES  64'd5000000000

`define CFG_DONE_STRING     0
`define PASSED_STRING       1
`define FAILED_STRING       2
`define TIMEOUT_STRING      3

`define PC_STATUS_WIDTH     2
`define PC_STATUS_NOSTATUS  0
`define PC_STATUS_GOODTRAP  1
`define PC_STATUS_BADTRAP   2

`define PITON_TEST_GOOD_END     40'h8100000000
`define PITON_TEST_BAD_END      40'h8200000000

`ifndef PITON_ARIANE
`define OLED_STRING "OpenPiton rel 10Princeton            Parallel              Group"
`else
`define OLED_STRING "OpenPiton+ArianePrinceton & ETHZA Collaboration "
`endif
