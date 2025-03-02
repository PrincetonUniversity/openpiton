// Modified by Barcelona Supercomputing Center on March 3rd, 2022
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

`define MIG_WR_CMD  3'b000
`define MIG_RD_CMD  3'b001
`define MIG_RMW_CMD  3'b011

`ifdef F1_BOARD
    `define BOARD_MEM_SIZE_MB       8192
    `define WORDS_PER_BURST         8
    `define WORD_SIZE               8 // in bytes
    `define MIG_APP_ADDR_WIDTH      28
    `define MIG_APP_CMD_WIDTH       3
    `define MIG_APP_DATA_WIDTH      512
    `define MIG_APP_MASK_WIDTH      64

    `define DDR3_DQ_WIDTH           64
    `define DDR3_DQS_WIDTH          8
    `define DDR3_ADDR_WIDTH         14
    `define DDR3_BA_WIDTH           3
    `define DDR3_DM_WIDTH           8
    `define DDR3_CK_WIDTH           1
    `define DDR3_CKE_WIDTH          1
    `define DDR3_CS_WIDTH           1
    `define DDR3_ODT_WIDTH          1

`elsif VC707_BOARD
    // specify mem size in MByte here
    `define BOARD_MEM_SIZE_MB       1024
    `define WORDS_PER_BURST         8
    `define WORD_SIZE               8 // in bytes
    `define MIG_APP_ADDR_WIDTH      28
    `define MIG_APP_CMD_WIDTH       3
    `define MIG_APP_DATA_WIDTH      512
    `define MIG_APP_MASK_WIDTH      64

    `define DDR3_DQ_WIDTH           64
    `define DDR3_DQS_WIDTH          8
    `define DDR3_ADDR_WIDTH         14
    `define DDR3_BA_WIDTH           3
    `define DDR3_DM_WIDTH           8
    `define DDR3_CK_WIDTH           1
    `define DDR3_CKE_WIDTH          1
    `define DDR3_CS_WIDTH           1
    `define DDR3_ODT_WIDTH          1
`elsif VCU118_BOARD
    `define BOARD_MEM_SIZE_MB       2048
    `define WORDS_PER_BURST         8
    `define WORD_SIZE               8 // in bytes
    `define MIG_APP_ADDR_WIDTH      28
    `define MIG_APP_CMD_WIDTH       3
    `define MIG_APP_DATA_WIDTH      512
    `define MIG_APP_MASK_WIDTH      64

    `define DDR3_DQ_WIDTH           64
    `define DDR3_DQS_WIDTH          8
    `define DDR3_ADDR_WIDTH         17
    `define DDR3_BA_WIDTH           2
    `define DDR3_DM_WIDTH           8
    `define DDR3_CK_WIDTH           1
    `define DDR3_CKE_WIDTH          1
    `define DDR3_CS_WIDTH           1
    `define DDR3_BG_WIDTH           1
    `define DDR3_ODT_WIDTH          1
`elsif ALVEO_BOARD
    `define BOARD_MEM_SIZE_MB       8192 // Valid for HBM and DDR4
    `define WORDS_PER_BURST         8
    `define WORD_SIZE               8 // in bytes
    `define MIG_APP_ADDR_WIDTH      31
    `define MIG_APP_CMD_WIDTH       3
    `define MIG_APP_DATA_WIDTH      512
    `define MIG_APP_MASK_WIDTH      64

    `define DDR3_DQ_WIDTH           72
    `define DDR3_DQS_WIDTH          18
    `define DDR3_ADDR_WIDTH         17
    `define DDR3_BA_WIDTH           2
    `define DDR3_DM_WIDTH           8
    `define DDR3_CK_WIDTH           1
    `define DDR3_CKE_WIDTH          1
    `define DDR3_CS_WIDTH           1
    `define DDR3_BG_WIDTH           2
    `define DDR3_ODT_WIDTH          1
`elsif XUPP3R_BOARD
    `define BOARD_MEM_SIZE_MB       32768
    `define WORDS_PER_BURST         8
    `define WORD_SIZE               8 // in bytes
    `define MIG_APP_ADDR_WIDTH      32
    `define MIG_APP_CMD_WIDTH       3
    `define MIG_APP_DATA_WIDTH      512
    `define MIG_APP_MASK_WIDTH      64

    `define DDR3_DQ_WIDTH           72
    `define DDR3_DQS_WIDTH          18
    `define DDR3_ADDR_WIDTH         18
    `define DDR3_BA_WIDTH           2
    `define DDR3_DM_WIDTH           0
    `define DDR3_CK_WIDTH           1
    `define DDR3_CKE_WIDTH          2
    `define DDR3_CS_WIDTH           2
    `define DDR3_BG_WIDTH           2
    `define DDR3_ODT_WIDTH          2
`elsif NEXYS4DDR_BOARD
    `define BOARD_MEM_SIZE_MB       256
    `define WORDS_PER_BURST         8
    `define WORD_SIZE               2 // in bytes
    `define MIG_APP_ADDR_WIDTH      27
    `define MIG_APP_CMD_WIDTH       3
    `define MIG_APP_DATA_WIDTH      128
    `define MIG_APP_MASK_WIDTH      16

    `define DDR3_DQ_WIDTH           16
    `define DDR3_DQS_WIDTH          2
    `define DDR3_ADDR_WIDTH         13
    `define DDR3_BA_WIDTH           3
    `define DDR3_DM_WIDTH           2
    `define DDR3_CK_WIDTH           1
    `define DDR3_CKE_WIDTH          1
    `define DDR3_CS_WIDTH           1
    `define DDR3_ODT_WIDTH          1
`elsif GENESYS2_BOARD
    `define BOARD_MEM_SIZE_MB       1024
    `define WORDS_PER_BURST         8
    `define WORD_SIZE               4
    `define MIG_APP_ADDR_WIDTH      29
    `define MIG_APP_CMD_WIDTH       3
    `define MIG_APP_DATA_WIDTH      256
    `define MIG_APP_MASK_WIDTH      32

    `define DDR3_DQ_WIDTH           32
    `define DDR3_DQS_WIDTH          4
    `define DDR3_ADDR_WIDTH         15
    `define DDR3_BA_WIDTH           3
    `define DDR3_DM_WIDTH           4
    `define DDR3_CK_WIDTH           1
    `define DDR3_CKE_WIDTH          1
    `define DDR3_CS_WIDTH           1
    `define DDR3_ODT_WIDTH          1
`elsif NEXYSVIDEO_BOARD
    `define BOARD_MEM_SIZE_MB       512
    `define WORDS_PER_BURST         8
    `define WORD_SIZE               2 // in bytes
    `define MIG_APP_ADDR_WIDTH      29
    `define MIG_APP_CMD_WIDTH       3
    `define MIG_APP_DATA_WIDTH      128
    `define MIG_APP_MASK_WIDTH      16

    `define DDR3_DQ_WIDTH           16
    `define DDR3_DQS_WIDTH          2
    `define DDR3_ADDR_WIDTH         15
    `define DDR3_BA_WIDTH           3
    `define DDR3_DM_WIDTH           2
    `define DDR3_CK_WIDTH           1
    `define DDR3_CKE_WIDTH          1
    `define DDR3_CS_WIDTH           1
    `define DDR3_ODT_WIDTH          1
`else
    `define BOARD_MEM_SIZE_MB       1024
    `define MIG_APP_ADDR_WIDTH      29
    `define WORDS_PER_BURST         8
    `define WORD_SIZE               8 // in bytes
    `define MIG_APP_CMD_WIDTH       3
    `define MIG_APP_DATA_WIDTH      512
    `define MIG_APP_MASK_WIDTH      64

    `define DDR3_DQ_WIDTH           64
    `define DDR3_DQS_WIDTH          8
    `define DDR3_ADDR_WIDTH         15
    `define DDR3_BA_WIDTH           3
    `define DDR3_DM_WIDTH           8
    `define DDR3_CK_WIDTH           1
    `define DDR3_CKE_WIDTH          1
    `define DDR3_CS_WIDTH           1
    `define DDR3_ODT_WIDTH          1
`endif


//Verilog macro metaprogramming: https://veripool.org/papers/Preproc_Good_Evil_SNUGBos10_paper.pdf
// reassignment of multiple name-indexed AXI buses to/from vectorized ones
`define MC_AXI(idx) \
\
wire [`AXI4_ID_WIDTH     -1:0]  mcx_axi``idx``_awid     =  mcx_axi_awid     [idx * `AXI4_ID_WIDTH     +: `AXI4_ID_WIDTH    ]; \
wire [`AXI4_ADDR_WIDTH   -1:0]  mcx_axi``idx``_awaddr   =  mcx_axi_awaddr   [idx * `AXI4_ADDR_WIDTH   +: `AXI4_ADDR_WIDTH  ]; \
wire [`AXI4_LEN_WIDTH    -1:0]  mcx_axi``idx``_awlen    =  mcx_axi_awlen    [idx * `AXI4_LEN_WIDTH    +: `AXI4_LEN_WIDTH   ]; \
wire [`AXI4_SIZE_WIDTH   -1:0]  mcx_axi``idx``_awsize   =  mcx_axi_awsize   [idx * `AXI4_SIZE_WIDTH   +: `AXI4_SIZE_WIDTH  ]; \
wire [`AXI4_BURST_WIDTH  -1:0]  mcx_axi``idx``_awburst  =  mcx_axi_awburst  [idx * `AXI4_BURST_WIDTH  +: `AXI4_BURST_WIDTH ]; \
wire                            mcx_axi``idx``_awlock   =  mcx_axi_awlock   [idx                                           ]; \
wire [`AXI4_CACHE_WIDTH  -1:0]  mcx_axi``idx``_awcache  =  mcx_axi_awcache  [idx * `AXI4_CACHE_WIDTH  +: `AXI4_CACHE_WIDTH ]; \
wire [`AXI4_PROT_WIDTH   -1:0]  mcx_axi``idx``_awprot   =  mcx_axi_awprot   [idx * `AXI4_PROT_WIDTH   +: `AXI4_PROT_WIDTH  ]; \
wire [`AXI4_QOS_WIDTH    -1:0]  mcx_axi``idx``_awqos    =  mcx_axi_awqos    [idx * `AXI4_QOS_WIDTH    +: `AXI4_QOS_WIDTH   ]; \
wire [`AXI4_REGION_WIDTH -1:0]  mcx_axi``idx``_awregion =  mcx_axi_awregion [idx * `AXI4_REGION_WIDTH +: `AXI4_REGION_WIDTH]; \
wire [`AXI4_USER_WIDTH   -1:0]  mcx_axi``idx``_awuser   =  mcx_axi_awuser   [idx * `AXI4_USER_WIDTH   +: `AXI4_USER_WIDTH  ]; \
wire                            mcx_axi``idx``_awvalid  =  mcx_axi_awvalid  [idx                                           ]; \
wire                            mcx_axi``idx``_awready; \
assign mcx_axi_awready[idx] =   mcx_axi``idx``_awready; \
\
wire [`AXI4_ID_WIDTH     -1:0]  mcx_axi``idx``_wid      =  mcx_axi_wid      [idx * `AXI4_ID_WIDTH     +: `AXI4_ID_WIDTH  ]; \
wire [`AXI4_DATA_WIDTH   -1:0]  mcx_axi``idx``_wdata    =  mcx_axi_wdata    [idx * `AXI4_DATA_WIDTH   +: `AXI4_DATA_WIDTH]; \
wire [`AXI4_STRB_WIDTH   -1:0]  mcx_axi``idx``_wstrb    =  mcx_axi_wstrb    [idx * `AXI4_STRB_WIDTH   +: `AXI4_STRB_WIDTH]; \
wire                            mcx_axi``idx``_wlast    =  mcx_axi_wlast    [idx                                         ]; \
wire [`AXI4_USER_WIDTH   -1:0]  mcx_axi``idx``_wuser    =  mcx_axi_wuser    [idx * `AXI4_USER_WIDTH   +: `AXI4_USER_WIDTH]; \
wire                            mcx_axi``idx``_wvalid   =  mcx_axi_wvalid   [idx                                         ]; \
wire                            mcx_axi``idx``_wready; \
assign mcx_axi_wready[idx] =    mcx_axi``idx``_wready; \
\
wire [`AXI4_ID_WIDTH     -1:0]  mcx_axi``idx``_arid     =  mcx_axi_arid     [idx * `AXI4_ID_WIDTH     +: `AXI4_ID_WIDTH    ]; \
wire [`AXI4_ADDR_WIDTH   -1:0]  mcx_axi``idx``_araddr   =  mcx_axi_araddr   [idx * `AXI4_ADDR_WIDTH   +: `AXI4_ADDR_WIDTH  ]; \
wire [`AXI4_LEN_WIDTH    -1:0]  mcx_axi``idx``_arlen    =  mcx_axi_arlen    [idx * `AXI4_LEN_WIDTH    +: `AXI4_LEN_WIDTH   ]; \
wire [`AXI4_SIZE_WIDTH   -1:0]  mcx_axi``idx``_arsize   =  mcx_axi_arsize   [idx * `AXI4_SIZE_WIDTH   +: `AXI4_SIZE_WIDTH  ]; \
wire [`AXI4_BURST_WIDTH  -1:0]  mcx_axi``idx``_arburst  =  mcx_axi_arburst  [idx * `AXI4_BURST_WIDTH  +: `AXI4_BURST_WIDTH ]; \
wire                            mcx_axi``idx``_arlock   =  mcx_axi_arlock   [idx                                           ]; \
wire [`AXI4_CACHE_WIDTH  -1:0]  mcx_axi``idx``_arcache  =  mcx_axi_arcache  [idx * `AXI4_CACHE_WIDTH  +: `AXI4_CACHE_WIDTH ]; \
wire [`AXI4_PROT_WIDTH   -1:0]  mcx_axi``idx``_arprot   =  mcx_axi_arprot   [idx * `AXI4_PROT_WIDTH   +: `AXI4_PROT_WIDTH  ]; \
wire [`AXI4_QOS_WIDTH    -1:0]  mcx_axi``idx``_arqos    =  mcx_axi_arqos    [idx * `AXI4_QOS_WIDTH    +: `AXI4_QOS_WIDTH   ]; \
wire [`AXI4_REGION_WIDTH -1:0]  mcx_axi``idx``_arregion =  mcx_axi_arregion [idx * `AXI4_REGION_WIDTH +: `AXI4_REGION_WIDTH]; \
wire [`AXI4_USER_WIDTH   -1:0]  mcx_axi``idx``_aruser   =  mcx_axi_aruser   [idx * `AXI4_USER_WIDTH   +: `AXI4_USER_WIDTH  ]; \
wire                            mcx_axi``idx``_arvalid  =  mcx_axi_arvalid  [idx                                           ]; \
wire                            mcx_axi``idx``_arready; \
assign mcx_axi_arready[idx] =   mcx_axi``idx``_arready; \
\
wire [`AXI4_ID_WIDTH     -1:0]  mcx_axi``idx``_rid; \
wire [`AXI4_DATA_WIDTH   -1:0]  mcx_axi``idx``_rdata; \
wire [`AXI4_RESP_WIDTH   -1:0]  mcx_axi``idx``_rresp; \
wire                            mcx_axi``idx``_rlast; \
wire [`AXI4_USER_WIDTH   -1:0]  mcx_axi``idx``_ruser; \
wire                            mcx_axi``idx``_rvalid; \
wire                            mcx_axi``idx``_rready =  mcx_axi_rready[idx]; \
assign mcx_axi_rid   [idx * `AXI4_ID_WIDTH     +: `AXI4_ID_WIDTH  ] = mcx_axi``idx``_rid; \
assign mcx_axi_rdata [idx * `AXI4_DATA_WIDTH   +: `AXI4_DATA_WIDTH] = mcx_axi``idx``_rdata; \
assign mcx_axi_rresp [idx * `AXI4_RESP_WIDTH   +: `AXI4_RESP_WIDTH] = mcx_axi``idx``_rresp; \
assign mcx_axi_rlast [idx                                         ] = mcx_axi``idx``_rlast; \
assign mcx_axi_ruser [idx * `AXI4_USER_WIDTH   +: `AXI4_USER_WIDTH] = mcx_axi``idx``_ruser; \
assign mcx_axi_rvalid[idx                                         ] = mcx_axi``idx``_rvalid; \
\
wire [`AXI4_ID_WIDTH     -1:0]  mcx_axi``idx``_bid; \
wire [`AXI4_RESP_WIDTH   -1:0]  mcx_axi``idx``_bresp; \
wire [`AXI4_USER_WIDTH   -1:0]  mcx_axi``idx``_buser; \
wire                            mcx_axi``idx``_bvalid; \
wire                            mcx_axi``idx``_bready = mcx_axi_bready[idx]; \
assign mcx_axi_bid   [idx * `AXI4_ID_WIDTH     +: `AXI4_ID_WIDTH  ] = mcx_axi``idx``_bid; \
assign mcx_axi_bresp [idx * `AXI4_RESP_WIDTH   +: `AXI4_RESP_WIDTH] = mcx_axi``idx``_bresp; \
assign mcx_axi_buser [idx * `AXI4_USER_WIDTH   +: `AXI4_USER_WIDTH] = mcx_axi``idx``_buser; \
assign mcx_axi_bvalid[idx                                         ] = mcx_axi``idx``_bvalid;

`define MCX_AXI_0
`define MCX_AXI_1  `MCX_AXI_0  `MC_AXI(0)
`define MCX_AXI_2  `MCX_AXI_1  `MC_AXI(1)
`define MCX_AXI_3  `MCX_AXI_2  `MC_AXI(2)
`define MCX_AXI_4  `MCX_AXI_3  `MC_AXI(3)
`define MCX_AXI_5  `MCX_AXI_4  `MC_AXI(4)
`define MCX_AXI_6  `MCX_AXI_5  `MC_AXI(5)
`define MCX_AXI_7  `MCX_AXI_6  `MC_AXI(6)
`define MCX_AXI_8  `MCX_AXI_7  `MC_AXI(7)
`define MCX_AXI_9  `MCX_AXI_8  `MC_AXI(8)
`define MCX_AXI_10 `MCX_AXI_9  `MC_AXI(9)
`define MCX_AXI_11 `MCX_AXI_10 `MC_AXI(10)
`define MCX_AXI_12 `MCX_AXI_11 `MC_AXI(11)
`define MCX_AXI_13 `MCX_AXI_12 `MC_AXI(12)
`define MCX_AXI_14 `MCX_AXI_13 `MC_AXI(13)
`define MCX_AXI_15 `MCX_AXI_14 `MC_AXI(14)
`define MCX_AXI_16 `MCX_AXI_15 `MC_AXI(15)
`define MCX_AXI_17 `MCX_AXI_16 `MC_AXI(16)
`define MCX_AXI_18 `MCX_AXI_17 `MC_AXI(17)
`define MCX_AXI_19 `MCX_AXI_18 `MC_AXI(18)
`define MCX_AXI_20 `MCX_AXI_19 `MC_AXI(19)
`define MCX_AXI_21 `MCX_AXI_20 `MC_AXI(20)
`define MCX_AXI_22 `MCX_AXI_21 `MC_AXI(21)
`define MCX_AXI_23 `MCX_AXI_22 `MC_AXI(22)
`define MCX_AXI_24 `MCX_AXI_23 `MC_AXI(23)
`define MCX_AXI_25 `MCX_AXI_24 `MC_AXI(24)
`define MCX_AXI_26 `MCX_AXI_25 `MC_AXI(25)
`define MCX_AXI_27 `MCX_AXI_26 `MC_AXI(26)
`define MCX_AXI_28 `MCX_AXI_27 `MC_AXI(27)
`define MCX_AXI_29 `MCX_AXI_28 `MC_AXI(28)
`define MCX_AXI_30 `MCX_AXI_29 `MC_AXI(29)

`define MCX_AXI(n) `MCX_AXI_``n
