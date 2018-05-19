/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

//==================================================================================================
//  Filename      : jtag.vh
//  Created On    : 2014-01-31 12:52:57
//  Last Modified : 2015-01-28 16:54:05
//  Revision      :
//  Author        : Tri Nguyen
//  Company       : Princeton University
//  Email         : trin@princeton.edu
//
//  Description   : Parallel JTAG/debug controller defines
//==================================================================================================


/////////////////////////////////
// Chip ID in JTAG
/////////////////////////////////

`define PARALLEL_PART_ID         16'h1AAA
`define PARALLEL_MANUFACTURE_ID  11'h03E
`define JTAG_SCRATCH_WIDTH          128

`define JTAG_FLATID_WIDTH 8

/////////////////////////////////
// JTAG TAP
/////////////////////////////////
// copied from ctu.h

`define TAP_EXTEST            6'h00
`define TAP_BYPASS            6'h3f
`define TAP_IDCODE            6'h01
`define TAP_SAMPLE_PRELOAD    6'h02
`define TAP_HIGHZ             6'h03
`define TAP_CLAMP             6'h04

// `define TAP_CREG_ADDR          6'h08
// `define TAP_CREG_WDATA         6'h09
// `define TAP_CREG_RDATA         6'h0a
// `define TAP_CREG_SCRATCH       6'h0b
// `define TAP_IOB_WR             6'h0c
// `define TAP_IOB_RD             6'h0d
// `define TAP_IOB_WADDR          6'h0e
// `define TAP_IOB_WDATA          6'h0f
// `define TAP_IOB_RADDR          6'h10
`define TAP_SEL_CTAP_INSTRUCTION          6'h08
`define TAP_SEL_CTAP_DATA0         6'h09
`define TAP_SEL_CTAP_ADDRESS         6'h0a
`define TAP_SEL_CTAP_INTERRUPTBIT         6'h0b
// `define TAP_CREG_SCRATCH       6'h0b
// `define TAP_IOB_WR             6'h0c
// `define TAP_IOB_RD             6'h0d
// `define TAP_IOB_WADDR          6'h0e
// `define TAP_IOB_WDATA          6'h0f
// `define TAP_IOB_RADDR          6'h10

// `define TAP_MBIST_SERIAL       6'h14
// `define TAP_MBIST_PARALLEL     6'h15
// `define TAP_MBIST_RESULT       6'h16
// `define TAP_MBIST_ABORT        6'h17

// `define TAP_PLL_BYPASS         6'h18

// `define TAP_CLK_STOP_ID        6'h1a
// `define TAP_CLK_SEL            6'h1b  //mask ff00 for ck src

// `define TAP_SSCAN_T0           6'h1c
// `define TAP_SSCAN_T1           6'h1d
// `define TAP_SSCAN_T2           6'h1e
// `define TAP_SSCAN_T3           6'h1f

// `define TAP_SCAN_PARALLEL      6'h20
// `define TAP_SCAN_SERIAL        6'h21
// `define TAP_SCAN_MTEST_LONG    6'h22
// `define TAP_SCAN_MTEST_SHORT   6'h23
// `define TAP_SCAN_BYPASS_EN     6'h24
// `define TAP_SCAN_NSTEP         6'h25
// `define TAP_SCAN_DUMP          6'h26

// `define TAP_EFC_READ           6'h28 
// `define TAP_EFC_BYPASS_DATA    6'h29 
// `define TAP_EFC_BYPASS         6'h2a 
// `define TAP_EFC_READ_MODE      6'h2b 
// `define TAP_EFC_COL_ADDR       6'h2c
// `define TAP_EFC_ROW_ADDR       6'h2d
// `define TAP_EFC_DEST_SAMPLE    6'h2e

`define TAP_CMD_WIDTH           6
`define CTU_BIST_CNT           12
`define TAP_INSTR_WIDTH        18  // `TAP_CMD_WIDTH + `CTU_BIST_CNT

/////////////////////////////////
// CTAP register select defines
/////////////////////////////////

// `define CTAP_DATA_REG_WIDTH 64

`define CTAP_REG_SEL_WIDTH 4
`define CTAP_REG_SEL_DATA0 4'd1
`define CTAP_REG_SEL_INSTRUCTION 4'd2
`define CTAP_REG_SEL_ADDRESS 4'd3

/////////////////////////////////
// JTAG instructions
/////////////////////////////////

// header
`define JTAG_REQ_WIDTH 32

// lengths of header
`define JTAG_REQ_OP_WIDTH 8
`define JTAG_REQ_TILEID_WIDTH 6
`define JTAG_REQ_THREADID_WIDTH 2
`define JTAG_REQ_MISC_WIDTH 16

// definitions of operations
// `define JTAG_REQ_OP_READ_SHADOWSCAN 8'd1
`define JTAG_REQ_OP_CLEAR_INTERRUPT 8'd2
// `define JTAG_REQ_OP_STALL_CORE 8'd3
`define JTAG_REQ_OP_READ_SRAM 8'd4
`define JTAG_REQ_OP_WRITE_SRAM 8'd5
// `define JTAG_REQ_OP_WRITE_PC 8'd6
// `define JTAG_REQ_OP_WRITE_THREADSTATE 8'd7
// `define JTAG_REQ_OP_CPX_INTERRUPT 8'd8
`define JTAG_REQ_OP_READ_ORAM 8'd9
`define JTAG_REQ_OP_READ_RTAP 8'd10
`define JTAG_REQ_OP_WRITE_RTAP 8'd11
`define JTAG_REQ_OP_WRITE_CLK_EN 8'd12
`define JTAG_REQ_OP_WRITE_ORAM_CLK_EN 8'd13
`define JTAG_REQ_OP_READ_CTAP_SRAM 8'd14
`define JTAG_REQ_OP_WRITE_CTAP_SRAM 8'd15

// definitions of misc field for read/write rtap
`define JTAG_RTAP_ID_PC_REG 16'd1
`define JTAG_RTAP_ID_STALL_REG 16'd2
`define JTAG_RTAP_ID_THREADSTATE_REG 16'd3
`define JTAG_RTAP_ID_CPX_INTERRUPT 16'd4
`define JTAG_RTAP_ID_RESETVECTOR_REG 16'd5
`define JTAG_RTAP_ID_LSU_CONTROL_REG 16'd6
`define JTAG_RTAP_ID_CONFIGREGS_REG 16'd7
`define JTAG_RTAP_ID_SHADOWSCAN_REG 16'd8
`define JTAG_RTAP_ID_IRF_REG 16'd9
`define JTAG_RTAP_ID_ICACHE_EN_REG 16'd10
`define JTAG_RTAP_ID_BREAKPOINT_PC_REG 16'd11
// `define JTAG_RTAP_ID__REG 16'd


// definitions of tileids
// `define CTAP_ID_BROADCAST 6'b111111
`define JTAG_TILEID_BROADCAST 6'b111111
`define JTAG_TILEID_CTAP 6'b111110

// mask of header
`define JTAG_REQ_OP_MASK 31:24          // 8b
`define JTAG_REQ_TILEID_MASK 23:18      // 6b
`define JTAG_REQ_THREADID_MASK 17:16    // 2b
`define JTAG_REQ_MISC_MASK 15:0         // 16b
// misc is used for stall bit at bit 0

// address reg
`define JTAG_ADDRESS_REG_WIDTH 32
`define JTAG_ADDRESS_INDEX_WIDTH 16
`define JTAG_ADDRESS_BSEL_WIDTH 8
`define JTAG_ADDRESS_SRAMID_WIDTH 8

// masks in address reg
`define JTAG_ADDRESS_INDEX_MASK 15:0
`define JTAG_ADDRESS_BSEL_MASK 23:16
`define JTAG_ADDRESS_SRAMID_MASK 31:24

// data reg
`define JTAG_DATA_REQ_WIDTH 64
`define JTAG_DATA_RES_WIDTH 128

// // From CTAP to RTAP
// // these valid vector assumes 4b bus. so 32b vector would be 128b
// `define CTAP_REQ_VEC_WHOLE_PACKET 32'hffffffff
// // header has first 32b
// `define CTAP_REQ_VEC_HEADER 32'h000000ff
// // half is 64b, includes the addresses
// `define CTAP_REQ_VEC_HALF 32'h0000ffff

`define CTAP_REQ_HEADER_MASK 31:0
`define CTAP_REQ_ADDRESS_MASK 63:32
`define CTAP_REQ_DATA_MASK 127:64

// RTAP returns
`define RTAP_RET_OP_WIDTH 4
`define RTAP_RET_OP_ACK             4'd1
`define RTAP_RET_OP_CORE_DATA       4'd2
`define RTAP_RET_OP_READRET         4'd3
`define RTAP_RET_OP_CONFIG_REGS     4'd4

// RTAP states
`define RTAP_STATE_WIDTH 4
`define RTAP_STATE_INIT 4'd0
`define RTAP_STATE_SRAM_0 4'd1
`define RTAP_STATE_SRAM_1 4'd2
`define RTAP_STATE_SRAM_2 4'd3
`define RTAP_STATE_SRAM_READ_3 4'd4
`define RTAP_STATE_SRAM_READ_4 4'd5
`define RTAP_STATE_SRAM_READ_5 4'd6
`define RTAP_STATE_SRAM_WRITE_3 4'd7
`define RTAP_STATE_SRAM_WRITE_4 4'd8
`define RTAP_STATE_SRAM_READ_4a 4'd9

// ORAM specifics
`define JTAG_ORAM_MISC_WIDTH 4
`define JTAG_ORAM_DATA_WIDTH 64

/////////////////////////////////
// UCB related
/////////////////////////////////
`define UCB_BUS_WIDTH               4
`define CTAP_UCB_PACKET_WIDTH       128


// CTAP_UCB_TILEID_MASK

// RTAP_INSTRUCTION_MASK
// RTAP_INSTRUCTION_RETURN_SHADOWSCAN
