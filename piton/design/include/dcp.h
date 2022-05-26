/*
Copyright (c) 2019 Princeton University
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
//  Filename      : dcp.h
//  Created On    : 2019-11-30
//  Revision      :
//  Author        : Marcelo Orenes Vera
//  Company       : Princeton University
//  Email         : movera@princeton.edu
//
//  Description   : Header file defining DCP constants
//
//
//==================================================================================================
//dcp.h
`include "define.tmp.h"
`include "iop.h"

`ifndef DCP_H
`define DCP_H

  
// PARAMETERS
`define FC_FIFO_SIZE 4  // Default 4
`define DCP_TLB_SIZE 16  // Default 16
`define CR_CHUNK_IDX 4  // Default 4

`define FC_GLOBL_IDX  `MSG_MSHRID_WIDTH-1
`define DCP_PERF_COUNTERS 1 // Default 1
`define DCP_CR      1       // Default 1

// Loop unit constants
`define CR_ARRAY_IDX  32
`define CR_CHUNK_SIZE 64*8

// TLB source constants
`define TLB_SRC_IDX 1
`define TLB_SRC_NUM 2**`TLB_SRC_IDX

//Virtual mem constants
`define DCP_VADDR 40
`define DCP_PADDR 40
`define LITTLE_ENDIAN 1

//Msg Type codes
`define DCP_REQ_LOAD       `MSG_TYPE_NC_LOAD_REQ
`define DCP_REQ_LOAD_ACK   `MSG_TYPE_NC_LOAD_MEM_ACK
`define DCP_REQ_STORE      `MSG_TYPE_NC_STORE_REQ
`define DCP_REQ_STORE_ACK  `MSG_TYPE_NC_STORE_MEM_ACK
`define DCP_RES_NOC2 `MSG_TYPE_DATA_ACK

// CONSTANTS
`define DCP_NOC2_LOAD_ACK 8'd30 
`define DCP_NOC2_STORE_ACK 8'd31 
`define DCP_NOC2_LOAD_REQ64 8'd32 
`define DCP_NOC2_LOAD_REQ512 8'd33 

`define FC_FIFO_IDX $clog2(`FC_FIFO_SIZE)
`define FC_ENTRY_IDX `FC_GLOBL_IDX-1
`define DCP_FIFO_LEN 11:9

`define DCP_NOC_REQ_BUF_SIZE 256
`define DCP_NOC_RES_DATA_SIZE 512

`ifdef PITON_L2_64B_RESP_ONLY
    `define DCP_RES_NOC3 `MSG_TYPE_LOAD_MEM_ACK
    `define DCP_REQ_TLOAD `MSG_TYPE_LOAD_MEM
    `define FC_DATA_IDX   4
`else
    `define DCP_RES_NOC3 `MSG_TYPE_NC_LOAD_MEM_ACK
    `define DCP_REQ_TLOAD `MSG_TYPE_NC_LOAD_REQ
    `define FC_DATA_IDX   2
`endif

`define DCP_NOC_ACK_LENGTH 1
`define DCP_NOC_RES_BUF_SIZE `DCP_NOC_RES_DATA_SIZE + 64

`define FC_DATA_SIZE  32 //later change to 32

`define DCP_NOC1_REQTYPE_WIDTH `MSG_TYPE_WIDTH 
`define DCP_MSHRID_WIDTH `MSG_MSHRID_WIDTH
`define DCP_REQ_LEN 1
`define DCP_DATA_WIDTH 64

`define DCP_NOC2_REQTYPE_WIDTH `MSG_TYPE_WIDTH
`define DCP_NOC2_REQTYPE_NC_STORE_REQ 8'd1
`define DCP_NOC2_REQTYPE_NC_LOAD_REQ  8'd2

`define DCP_SHIM_FLITS 3
`define DCP_UNPARAM_1_0 1:0
`define DCP_UNPARAM_2_0 2:0
`define DCP_UNPARAM_3_0 3:0
`define DCP_UNPARAM_7_0 7:0
`define DCP_UNPARAM_5_0 5:0
`define DCP_UNPARAM_11_0 11:0
`define DCP_UNPARAM_15_0 15:0
`define DCP_UNPARAM_63_0 63:0
`define DCP_UNPARAM_127_0 127:0
`define DCP_PADDR_HI 39
`define DCP_PADDR_MASK 39:0

`define DCP_COUNT_TRANS 32
`define DCP_COUNT_STALL 32
`define DCP_COUNT_LAT 32

`define DCP_THREADID_WIDTH 1
`define DCP_THREADID_MASK 0:0
`define DCP_THREAD_ARRAY_MASK 1:0
`define DCP_NUM_MSHRID_PER_THREAD 4

`define DCP_STAT_SIZE 4
`define DCP_STAT_WIDTH 2//$clog2(`DCP_STAT_SIZE)

// Operation codes
`define DCP_OPCODE 8:3
`define DCP_OPCODE_WIDTH 6

`define DCP_INIT_OP      6'd0
`define DCP_REST_OP      6'd1
`define DCP_ACON_OP      6'd2
`define DCP_ECON_OP      6'd3
`define DCP_ADES_OP      6'd4
`define DCP_EDES_OP      6'd5
`define DCP_FIFO_OP      6'd6
`define DCP_CONS_OP      6'd7
`define DCP_PROD_OP      6'd8
`define DCP_FIFO_CLR_OP  6'd9
`define DCP_TLOAD32_OP   6'd10
`define DCP_TLOAD64_OP   6'd11
`define DCP_STAT_OP      6'd12
`define DCP_TLBF_OP      6'd13
`define DCP_LOOP_OP      6'd14
`define DCP_TLBP_OP      6'd15

//AMO operations Store the Addr as SD and then the data as either SW or SD.
//Do we need different OPcodes for Data and Addr? or we assume order?
//I guess I can get the size from the data_size of the second Store, to know
//how wide is the data
`define DCP_AMO_OP_ADD   6'd32
`define DCP_AMO_OP_AND   6'd33
`define DCP_AMO_OP_OR    6'd34
`define DCP_AMO_OP_XOR   6'd35
`define DCP_AMO_OP_MAX   6'd36
`define DCP_AMO_OP_MAXU  6'd37
`define DCP_AMO_OP_MIN   6'd38
`define DCP_AMO_OP_MINU  6'd39
`define DCP_AMO_OP_SWAP  6'd40

`define DCP_AMO_OP_CAS1  6'd41
`define DCP_AMO_OP_CAS2  6'd42
`define DCP_PREFETCH     6'd43
`define DCP_LLC_32       6'd44
`define DCP_LLC_64       6'd45

`define DCP_LP_TLOAD32 6'd48
`define DCP_LP_TLOAD64 6'd49
`define DCP_LP_PRODUCE 6'd50
`define DCP_LP_CDMA    6'd51
`define DCP_LP_LLC_32  6'd52
`define DCP_LP_LLC_64  6'd53
`define DCP_LP_PREFETCH  6'd54

//`define DCP_SET_B_ALL  6'd56
`define DCP_SET_B32_FIFO 6'd57
`define DCP_SET_B64_FIFO 6'd58

`define DREAM_NS_LOAD    6'd60
`define DREAM_SW_WB      6'd61

// FIFO SIZE
`define DCP_LEN_8  3'd0
`define DCP_LEN_16 3'd1
`define DCP_LEN_32 3'd2
`define DCP_LEN_48 3'd3
`define DCP_LEN_64 3'd4
`define DCP_LEN_80 3'd5
`define DCP_LEN_96 3'd6
`define DCP_LEN_128 3'd7

// NOC3 BUFFER
`define DCP_NOC3_FLIT_STATE_WIDTH 4
`define DCP_NOC_STATE_WIDTH 2
`define DCP_NOC_STATE_IDLE 2'd0
`define DCP_NOC_STATE_RECEIVING 2'd1
`define DCP_NOC_STATE_WAITING_ACK 2'd2

//// NOC2 ENCODER
`define DCP_NOC2_FLIT_STATE_WIDTH 4
`define DCP_NOC2_REQ_HEADER_1 4'd0
`define DCP_NOC2_REQ_HEADER_2 4'd1
`define DCP_NOC2_REQ_HEADER_3 4'd2
`define DCP_NOC2_REQ_STORE_DATA 4'd3
//
// NOC1 ENCODER
`define DCP_NOC1_FLIT_STATE_WIDTH 4
`define DCP_NOC1_REQ_HEADER_1 4'd0
`define DCP_NOC1_REQ_HEADER_2 4'd1
`define DCP_NOC1_REQ_HEADER_3 4'd2
`define DCP_NOC1_REQ_DATA_1 4'd3
`define DCP_NOC1_REQ_DATA_2 4'd4

`define DCP_NOC1ENCODER_SOURCE_WIDTH 1
`define DCP_NOC1ENCODER_SOURCE_DCP 1'b0
`define DCP_NOC1ENCODER_SOURCE_CSM 1'b1

// NOC1 CREDIT MANAGEMENT
// be careful, the noc1buffer module assumes these are power of two
// also, please change the corresponding pyv value in noc1buffer.v.pyv
`define DCP_NOC1_BUF_NUM_SLOTS 2
`define DCP_NOC1_BUF_NUM_SLOTS_LOG 1
`define DCP_NOC1_BUF_NUM_DATA_SLOTS 2
`define DCP_NOC1_BUF_NUM_DATA_SLOTS_LOG 1

`define DCP_NOC1BUFFER_REQTYPE_LO 0
`define DCP_NOC1BUFFER_REQTYPE_HI `DCP_NOC1BUFFER_REQTYPE_LO + `DCP_NOC1_REQTYPE_WIDTH - 1
`define DCP_NOC1BUFFER_MSHRID_LO  `DCP_NOC1BUFFER_REQTYPE_HI + 1
`define DCP_NOC1BUFFER_MSHRID_HI  `DCP_NOC1BUFFER_MSHRID_LO + `DCP_MSHRID_WIDTH - 1
`define DCP_NOC1BUFFER_ADDRESS_LO  `DCP_NOC1BUFFER_MSHRID_HI + 1
`define DCP_NOC1BUFFER_ADDRESS_HI  `DCP_NOC1BUFFER_ADDRESS_LO + 40 - 1
`define DCP_NOC1BUFFER_NON_CACHEABLE_LO  `DCP_NOC1BUFFER_ADDRESS_HI + 1
`define DCP_NOC1BUFFER_NON_CACHEABLE_HI  `DCP_NOC1BUFFER_NON_CACHEABLE_LO + 1 - 1
`define DCP_NOC1BUFFER_SIZE_LO  `DCP_NOC1BUFFER_NON_CACHEABLE_HI + 1
`define DCP_NOC1BUFFER_SIZE_HI  `DCP_NOC1BUFFER_SIZE_LO + `MSG_DATA_SIZE_WIDTH - 1
`define DCP_NOC1BUFFER_PREFETCH_LO  `DCP_NOC1BUFFER_SIZE_HI + 1
`define DCP_NOC1BUFFER_PREFETCH_HI  `DCP_NOC1BUFFER_PREFETCH_LO + 1 - 1
`define DCP_NOC1BUFFER_DATA_INDEX_LO  `DCP_NOC1BUFFER_PREFETCH_HI + 1
`define DCP_NOC1BUFFER_DATA_INDEX_HI  `DCP_NOC1BUFFER_DATA_INDEX_LO + 1 - 1

`define DCP_NOC1BUFFER_HOMEID_LO  `DCP_NOC1BUFFER_DATA_INDEX_HI + 1
`define DCP_NOC1BUFFER_HOMEID_HI  `DCP_NOC1BUFFER_HOMEID_LO + `PACKET_HOME_ID_WIDTH - 1
`define DCP_NOC1BUFFER_WRITE_MASK_LO  `DCP_NOC1BUFFER_HOMEID_HI + 1
`define DCP_NOC1BUFFER_WRITE_MASK_HI  `DCP_NOC1BUFFER_WRITE_MASK_LO + `MSG_AMO_MASK_WIDTH - 1
//Length of the command buffer (all fields neccesary)
`define DCP_COMMAND_BUFFER_LEN `DCP_NOC1BUFFER_WRITE_MASK_HI + 1

`define DCP_NOC1BUFFER_REQTYPE `DCP_NOC1BUFFER_REQTYPE_HI:`DCP_NOC1BUFFER_REQTYPE_LO
`define DCP_NOC1BUFFER_MSHRID  `DCP_NOC1BUFFER_MSHRID_HI:`DCP_NOC1BUFFER_MSHRID_LO
`define DCP_NOC1BUFFER_ADDRESS  `DCP_NOC1BUFFER_ADDRESS_HI:`DCP_NOC1BUFFER_ADDRESS_LO
`define DCP_NOC1BUFFER_NON_CACHEABLE  `DCP_NOC1BUFFER_NON_CACHEABLE_HI:`DCP_NOC1BUFFER_NON_CACHEABLE_LO
`define DCP_NOC1BUFFER_SIZE  `DCP_NOC1BUFFER_SIZE_HI:`DCP_NOC1BUFFER_SIZE_LO
`define DCP_NOC1BUFFER_PREFETCH  `DCP_NOC1BUFFER_PREFETCH_HI:`DCP_NOC1BUFFER_PREFETCH_LO
`define DCP_NOC1BUFFER_DATA_INDEX  `DCP_NOC1BUFFER_DATA_INDEX_HI:`DCP_NOC1BUFFER_DATA_INDEX_LO
`define DCP_NOC1BUFFER_HOMEID  `DCP_NOC1BUFFER_HOMEID_HI:`DCP_NOC1BUFFER_HOMEID_LO
`define DCP_NOC1BUFFER_WRITE_MASK  `DCP_NOC1BUFFER_WRITE_MASK_HI:`DCP_NOC1BUFFER_WRITE_MASK_LO

`endif

