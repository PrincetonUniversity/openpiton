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

`define UART_LSR        32'h1014
`define UART_THR        32'h1000
`define UART_RBR        32'h1000
`define LSR_TEMT        6         // bit number
`define LSR_DR          0         // bit number

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
`define PC_BLK_WIDTH        512
`define PC_BLK_NUM_WIDTH    clogb2(`PC_MAX_BLK_CNT+1)
`define BLK_NUM_IN_MIG      `MIG_APP_DATA_WIDTH/`PC_BLK_WIDTH
`define PC_FLITS_IN_ADDR    `PC_ADDR_WIDTH/`PC_FLIT_WIDTH
`define PC_FLITS_IN_BLK_NUM 1
`define PC_FLITS_IN_BLK     `PC_BLK_WIDTH/`PC_FLIT_WIDTH

    