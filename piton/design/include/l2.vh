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
//  Filename      : l2.vh
//  Created On    : 2014-02-20
//  Last Modified : 2014-02-20
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : header file for the L2 cache
//
//
//==================================================================================================


// Input buffer for pipeline1

`define L2_P1_HEADER_BUF_IN_WIDTH       192
`define L2_P1_DATA_BUF_IN_WIDTH         64

`define L2_P1_HEADER_BUF_IN_FLITS       3
`define L2_P1_DATA_BUF_IN_FLITS         1

`define L2_P1_HEADER_BUF_IN_SIZE        8
`define L2_P1_DATA_BUF_IN_SIZE          4

`define L2_P1_HEADER_BUF_IN_LOG_SIZE    3
`define L2_P1_DATA_BUF_IN_LOG_SIZE      2

// Input buffer for pipeline2

`define L2_P2_HEADER_BUF_IN_WIDTH       192
`define L2_P2_DATA_BUF_IN_WIDTH         128

`define L2_P2_HEADER_BUF_IN_FLITS       3
`define L2_P2_DATA_BUF_IN_FLITS         2

`define L2_P2_HEADER_BUF_IN_SIZE        4
`define L2_P2_DATA_BUF_IN_SIZE          16

`define L2_P2_HEADER_BUF_IN_LOG_SIZE    2
`define L2_P2_DATA_BUF_IN_LOG_SIZE      4


// Output buffer

`define L2_P1_BUF_OUT_WIDTH       320
`define L2_P1_BUF_OUT_FLITS       5
`define L2_P1_BUF_OUT_SIZE        16
`define L2_P1_BUF_OUT_LOG_SIZE    4
`define L2_P1_BUF_OUT_MODE_WIDTH  3
`define L2_P1_BUF_OUT_MODE_0H0D   3'd0
`define L2_P1_BUF_OUT_MODE_1H0D   3'd1
`define L2_P1_BUF_OUT_MODE_1H1D   3'd2
`define L2_P1_BUF_OUT_MODE_1H2D   3'd3
`define L2_P1_BUF_OUT_MODE_3H0D   3'd4
`define L2_P1_BUF_OUT_MODE_3H1D   3'd5
`define L2_P1_BUF_OUT_MODE_3H2D   3'd6
`define L2_P1_BUF_OUT_MODE_0H2D   3'd7

// L2 cache configuration

`define BYTE_TO_BIT              8
`define L2_SIZE                  65536
`define L2_SIZE_WIDTH            16

`define L2_LINE_SIZE             64
`define L2_LINE_SIZE_WIDTH       6

`define L2_ENTRY_SIZE            16
`define L2_ENTRY_SIZE_WIDTH      4

`define L2_WAYS                  4
`define L2_WAYS_WIDTH            2
`define L2_WAY_0                 2'b00
`define L2_WAY_1                 2'b01
`define L2_WAY_2                 2'b10
`define L2_WAY_3                 2'b11

`define L2_OFFSET_WIDTH         `L2_LINE_SIZE_WIDTH



// Tag array

`define L2_TAG_INDEX_WIDTH      8
`define L2_TAG_WIDTH            26
`define L2_TAG_WAY_WIDTH        26
`define L2_TAG_ARRAY_WIDTH      104


// Tag Address decomposition 

`define L2_TAG_OFFSET           5:0
`define L2_TAG_INDEX            13:6
`define L2_TAG                  39:14
`define L2_TAG_PLUS_INDEX       39:6

//Data array

`define L2_DATA_ARRAY_WIDTH         144
`define L2_DATA_DATA_WIDTH          128
`define L2_DATA_PARITY_WIDTH        16
`define L2_DATA_ECC_TOTAL_WIDTH     72
`define L2_DATA_ECC_DATA_WIDTH      64
`define L2_DATA_ECC_PARITY_WIDTH    8
`define L2_DATA_INDEX_WIDTH         12
`define L2_DATA_OFFSET_WIDTH        4
`define L2_DATA_SUBLINE_WIDTH       2
`define L2_DATA_SUBLINE_0           2'd0
`define L2_DATA_SUBLINE_1           2'd1
`define L2_DATA_SUBLINE_2           2'd2
`define L2_DATA_SUBLINE_3           2'd3


// Data Address decomposition 

`define L2_INS_SUBLINE           5
`define L2_DATA_OFFSET           3:0
`define L2_DATA_SUBLINE          5:4
`define L2_INS_SUBLINE           5


//Dir array

`define L2_DIR_INDEX_WIDTH      10 
`define L2_DIR_SHARER_BITS      64
`define L2_DIR_ARRAY_WIDTH      `L2_DIR_SHARER_BITS

//State array

`define L2_STATE_INDEX_WIDTH    `L2_TAG_INDEX_WIDTH
`define L2_STATE_ENTRIES        (1 << `L2_TAG_INDEX_WIDTH)

`define L2_MESI_BITS            `MSG_MESI_BITS
`define L2_MESI_I               `MSG_MESI_I
`define L2_MESI_S               `MSG_MESI_S
`define L2_MESI_E               `MSG_MESI_E
`define L2_MESI_B               `MSG_MESI_M

`define L2_VD_BITS              2
`define L2_VD_INVAL             2'b00
`define L2_VD_CLEAN             2'b10
`define L2_VD_DIRTY             2'b11
`define L2_VD_ERROR             2'b01


//Whether the cache line is in Icaches or Dcaches
`define L2_DI_BIT               1
`define L2_DI_D                 0
`define L2_DI_I                 1

`define L2_SUBLINE_BITS         4

`define L2_OWNER_BITS           6
`define L2_OWNER_X_WIDTH        3
`define L2_OWNER_Y_WIDTH        3
`define L2_OWNER_XY             2:0
`define L2_OWNER_X              2:0
`define L2_OWNER_Y              5:3




//Round Robin selection
`define L2_RB_BITS              `L2_WAYS_WIDTH
`define L2_LRU_BITS             `L2_WAYS
`define L2_LRU_OP_BITS          1
`define L2_LRU_SET              1'b1
`define L2_LRU_CLR              1'b0


`define L2_STATE_ARRAY_WIDTH    66
`define L2_STATE_WAY_WIDTH      15
`define L2_STATE_DATA_WIDTH     60

   

// State decomposition 

`define L2_STATE_SDID           9:0
`define L2_STATE_OWNER          5:0
`define L2_STATE_SUBLINE        9:6
`define L2_STATE_DI             10
`define L2_STATE_VD             12:11
`define L2_STATE_MESI           14:13
`define L2_STATE_LRU            63:60
`define L2_STATE_RB             65:64
`define L2_STATE_DATA           59:0


//MSHR array

`define L2_MSHR_ENTRIES         8
`define L2_MSHR_INDEX_WIDTH     3
`define L2_MSHR_ADDR_IN_WIDTH   `L2_TAG_INDEX_WIDTH
`define L2_MSHR_ADDR_OUT_WIDTH  `PHY_ADDR_WIDTH
`define L2_MSHR_WBG_THRESHOLD   4

`define L2_MSHR_STATE_BITS      2
`define L2_MSHR_STATE_INVAL     2'd0
`define L2_MSHR_STATE_WAIT      2'd1
`define L2_MSHR_STATE_PENDING   2'd2


`define L2_MSHR_ARRAY_WIDTH     122

`define L2_MSHR_CMP_ADDR        13:6
`define L2_MSHR_ADDR            39:0
`define L2_MSHR_WAY             41:40
`define L2_MSHR_MSHRID          49:42
`define L2_MSHR_CACHE_TYPE      50
`define L2_MSHR_DATA_SIZE       53:51
`define L2_MSHR_MSG_TYPE        61:54
`define L2_MSHR_L2_MISS         62
`define L2_MSHR_SRC_CHIPID      76:63
`define L2_MSHR_SRC_X           84:77
`define L2_MSHR_SRC_Y           92:85
`define L2_MSHR_SRC_FBITS       96:93
`define L2_MSHR_SDID            106:97
`define L2_MSHR_LSID            112:107      
`define L2_MSHR_MISS_LSID       118:113
`define L2_MSHR_SMC_MISS        119
`define L2_MSHR_RECYCLED        120
`define L2_MSHR_INV_FWD_PENDING 121


//SMC array

`define L2_SMC_ENTRIES          16
`define L2_SMC_INDEX_WIDTH      4
`define L2_SMC_ADDR_WIDTH       16
`define L2_SMC_TAG_WIDTH        14
`define L2_SMC_OFFSET_WIDTH     2
`define L2_SMC_DATA_IN_WIDTH    128
`define L2_SMC_DATA_OUT_WIDTH   30
`define L2_SMC_VALID_WIDTH      4
`define L2_SMC_DATA_WIDTH       120
`define L2_SMC_DATA_NUM         4

`define L2_SMC_ADDR_TAG         15:2
`define L2_SMC_ADDR_OFFSET      1:0
`define L2_SMC_ADDR_INDEX       5:2
`define L2_SMC_ADDR_SDID        15:6
`define L2_SMC_ADDR_LSID        5:0


`define L2_SMC_ARRAY_WIDTH      138

`define L2_SMC_TAG              137:124
`define L2_SMC_VALID            123:120
`define L2_SMC_DATA             119:0
`define L2_SMC_SDID             137:128

`define L2_SMC_DATA_CHIPID      29:16
`define L2_SMC_DATA_Y           15:8
`define L2_SMC_DATA_X           7:0

`define L2_SMT_BASE_ADDR_WIDTH  22

//Message destination_type
`define MSG_DST_TYPE_WIDTH      3
`define MSG_DST_TYPE_INVALID    3'd0
`define MSG_DST_TYPE_REQ        3'd1
`define MSG_DST_TYPE_SHARER     3'd2
`define MSG_DST_TYPE_OWNER      3'd3
`define MSG_DST_TYPE_MEM        3'd4

//L2 public sharer beyond the maximum clump size

`define L2_PUBLIC_SHARER        6'd63

//L2 registers
`define L2_REG_WIDTH            64


//Special addresses
`define L2_ADDR_TYPE_WIDTH          8
`define L2_ADDR_OP_WIDTH            2
`define L2_ADDR_WAY_WIDTH           `L2_WAY_WIDTH
`define L2_ADDR_WAY                 15:14
`define L2_ADDR_TYPE                39:32
`define L2_ADDR_OP                  31:30
`define L2_ADDR_TYPE_DATA_ACCESS    8'ha0
`define L2_ADDR_TYPE_TAG_ACCESS     8'ha4
`define L2_ADDR_TYPE_STATE_ACCESS   8'ha6
`define L2_ADDR_TYPE_DIR_ACCESS     8'ha1
`define L2_ADDR_TYPE_SMC_ACCESS     8'ha2
`define L2_ADDR_TYPE_SMC_FLUSH      8'ha5
`define L2_ADDR_TYPE_COREID_REG     8'ha7
`define L2_ADDR_TYPE_ERROR_STATUS_REG 8'ha8
`define L2_ADDR_TYPE_CTRL_REG       8'ha9
`define L2_ADDR_TYPE_ACCESS_COUNTER 8'haa
`define L2_ADDR_TYPE_MISS_COUNTER   8'hab
`define L2_ADDR_TYPE_LINE_FLUSH     8'ha3
`define L2_ADDR_TYPE_DIS_FLUSH      8'hac, 8'had, 8'hae, 8'haf


//L2 core ID
`define L2_COREID_WIDTH         `NOC_CHIPID_WIDTH+`NOC_X_WIDTH+`NOC_Y_WIDTH
`define L2_CORE_CHIPID          29:16
`define L2_CORE_Y               15:8
`define L2_CORE_X               7:0

//L2 dir array reuse

`define L2_DIR_SDID             `L2_DIR_COREID_WIDTH+`MSG_SDID_WIDTH-1:`L2_DIR_COREID_WIDTH
`define L2_DIR_COREID_WIDTH     `L2_COREID_WIDTH
`define L2_DIR_CORE_CHIPID      `L2_CORE_CHIPID
`define L2_DIR_CORE_Y           `L2_CORE_Y
`define L2_DIR_CORE_X           `L2_CORE_X

//Control Signal 

`define CS_OP_WIDTH             2
`define OP_CLR                  2'd0 
`define OP_LD                   2'd1
`define OP_ADD                  2'd2
`define OP_SUB                  2'd3



//Control Signal in Stage 1

`define CS_SIZE_S1              3

`define CS_TAG_CLK_EN_S1        2
`define CS_TAG_RDW_EN_S1        1
`define CS_STATE_RD_EN_S1       0

`define CS_SIZE_P1S2            23

`define CS_STATE_LRU_OP_P1S2    0
`define CS_STATE_LRU_EN_P1S2    1
`define CS_STATE_MESI_P1S2      3:2
`define CS_STATE_MESI_EN_P1S2   4
`define CS_STATE_VD_P1S2        6:5
`define CS_STATE_VD_EN_P1S2     7
`define CS_STATE_DI_EN_P1S2     8
`define CS_STATE_SL_OP_P1S2     10:9
`define CS_STATE_DATA_RDY_P1S2  11
`define CS_STATE_SL_EN_P1S2     12
`define CS_STATE_OWNER_OP_P1S2  14:13
`define CS_STATE_OWNER_EN_P1S2  15
`define CS_MSHR_WR_EN_P1S2      16
`define CS_DATA_RDW_EN_P1S2     17
`define CS_DATA_CLK_EN_P1S2     18
`define CS_DIR_OP_P1S2          20:19
`define CS_DIR_RDW_EN_P1S2      21
`define CS_DIR_CLK_EN_P1S2      22

`define CS_SIZE_P2S2            19

`define CS_STATE_LRU_OP_P2S2    0
`define CS_STATE_LRU_EN_P2S2    1
`define CS_STATE_MESI_P2S2      3:2
`define CS_STATE_MESI_EN_P2S2   4
`define CS_STATE_VD_P2S2        6:5
`define CS_STATE_VD_EN_P2S2     7
`define CS_STATE_DI_EN_P2S2     8
`define CS_STATE_SL_OP_P2S2     10:9
`define CS_STATE_SL_EN_P2S2     11
`define CS_STATE_OWNER_OP_P2S2  13:12
`define CS_STATE_OWNER_EN_P2S2  14
`define CS_DIR_CLR_EN_P2S2      15
`define CS_DIR_RDW_EN_P2S2      16
`define CS_DIR_CLK_EN_P2S2      17
`define CS_DATA_CLK_EN_P2S2     18


`define CS_SIZE_S4              19

`define CS_MSG1_SEND_TYPE_S4    7:0
`define CS_MSG1_SEND_EN_S4      8
`define CS_MSG0_SEND_TYPE_S4    16:9
`define CS_MSG0_SEND_EN_S4      17
`define CS_MSG_SEND_FWD_S4      18
