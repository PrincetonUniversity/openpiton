
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
//  Filename      : l15.v
//  Created On    : 2014-01-31 12:52:57
//  Last Modified : 2015-01-22 17:39:39
//  Revision      :
//  Author        : Tri Nguyen
//  Company       : Princeton University
//  Email         : trin@princeton.edu
//
//  Description   : L1.5 top module
//
//
//==================================================================================================

//`timescale 1 ns / 10 ps
`include "l15.tmp.h"
`include "lsu.tmp.h"

`ifdef DEFAULT_NETTYPE_NONE
`default_nettype none
`endif
module l15 (
    input                                   clk,
    input                                   rst_n,
    
    input [4:0]                             transducer_l15_rqtype,
    input [`L15_AMO_OP_WIDTH-1:0]           transducer_l15_amo_op,
    input                                   transducer_l15_nc,
    input [2:0]                             transducer_l15_size,
    input [`L15_THREADID_MASK]              transducer_l15_threadid,
    input                                   transducer_l15_prefetch,
    input                                   transducer_l15_invalidate_cacheline,
    input                                   transducer_l15_blockstore,
    input                                   transducer_l15_blockinitstore,
    input [1:0]                             transducer_l15_l1rplway,
    input                                   transducer_l15_val,
    input [39:0]                            transducer_l15_address,
    input [63:0]                            transducer_l15_data,
    input [63:0]                            transducer_l15_data_next_entry,
    input [`TLB_CSM_WIDTH-1:0]              transducer_l15_csm_data,

    output                                  l15_transducer_ack,
    output                                  l15_transducer_header_ack,

    output                                  l15_transducer_val,
    output [3:0]                            l15_transducer_returntype,
    output                                  l15_transducer_l2miss,
    output [1:0]                            l15_transducer_error,
    output                                  l15_transducer_noncacheable,
    output                                  l15_transducer_atomic,
    output [`L15_THREADID_MASK]             l15_transducer_threadid,
    output                                  l15_transducer_prefetch,
    output                                  l15_transducer_f4b,
    output [63:0]                           l15_transducer_data_0,
    output [63:0]                           l15_transducer_data_1,
    output [63:0]                           l15_transducer_data_2,
    output [63:0]                           l15_transducer_data_3,
    output                                  l15_transducer_inval_icache_all_way,
    output                                  l15_transducer_inval_dcache_all_way,
    output [15:4]                           l15_transducer_inval_address_15_4,
    output                                  l15_transducer_cross_invalidate,
    output [1:0]                            l15_transducer_cross_invalidate_way,
    output                                  l15_transducer_inval_dcache_inval,
    output                                  l15_transducer_inval_icache_inval,
    output [1:0]                            l15_transducer_inval_way,
    output                                  l15_transducer_blockinitstore,

    input                                   transducer_l15_req_ack,

    input                                   noc1_out_rdy,
    input                                   noc2_in_val,
    input [`NOC_DATA_WIDTH-1:0]             noc2_in_data,
    input                                   noc3_out_rdy,
    input                                   dmbr_l15_stall,
    input [`NOC_CHIPID_WIDTH-1:0]           chipid,
    input [`NOC_X_WIDTH-1:0]                coreid_x,
    input [`NOC_Y_WIDTH-1:0]                coreid_y,

    // input from config registers to pipeline
    input [63:0]                            config_l15_read_res_data_s3,
    input                                   config_csm_en,
    input [31:0]                            config_system_tile_count,
    input [`HOME_ALLOC_METHOD_WIDTH-1:0]    config_home_alloc_method, 
    input [`L15_HMT_BASE_ADDR_WIDTH-1:0]    config_hmt_base,

    output                                  noc1_out_val,
    output [`NOC_DATA_WIDTH-1:0]            noc1_out_data,
    output                                  noc2_in_rdy,
    output                                  noc3_out_val,
    output [`NOC_DATA_WIDTH-1:0]            noc3_out_data,
    output                                  l15_dmbr_l1missIn,
    output [`DMBR_TAG_WIDTH-1:0]            l15_dmbr_l1missTag,
    output                                  l15_dmbr_l2responseIn,
    output                                  l15_dmbr_l2missIn,
    output [`DMBR_TAG_WIDTH-1:0]            l15_dmbr_l2missTag,

    // output to config registers to pipeline
    output                                  l15_config_req_val_s2,
    output                                  l15_config_req_rw_s2,
    output [63:0]                           l15_config_write_req_data_s2,
    output [`CONFIG_REG_ADDRESS_MASK]       l15_config_req_address_s2,

    // sram interface
    output [`SRAM_WRAPPER_BUS_WIDTH-1:0]    srams_rtap_data,
    input  [`BIST_OP_WIDTH-1:0]             rtap_srams_bist_command,
    input  [`SRAM_WRAPPER_BUS_WIDTH-1:0]    rtap_srams_bist_data

);

// assigning sram return data
wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] dtag_rtap_data;
wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] dcache_rtap_data;

`ifndef NO_RTL_CSM
wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] hmt_rtap_data;
assign srams_rtap_data = dtag_rtap_data
                            | dcache_rtap_data
                            | hmt_rtap_data;
`else
assign srams_rtap_data = dtag_rtap_data
                            | dcache_rtap_data;
`endif

///////////////////////////////////
// CSM module
///////////////////////////////////

wire [`PHY_ADDR_WIDTH-1:0] l15_csm_req_address_s2;
wire l15_csm_req_val_s2;
wire l15_csm_stall_s3;
wire [`L15_CSM_NUM_TICKETS_LOG2-1:0] l15_csm_req_ticket_s2;
// wire [`HOME_ID_WIDTH-1:0] l15_csm_clump_tile_count_s2;
wire  l15_csm_req_type_s2;
wire [127:0] l15_csm_req_data_s2;
wire  [`TLB_CSM_WIDTH-1:0] l15_csm_req_pcx_data_s2;
wire csm_l15_res_val_s3;
wire [63:0] csm_l15_res_data_s3;

// read port in case of a cache miss
wire [`L15_CSM_NUM_TICKETS_LOG2-1:0] l15_csm_read_ticket;
wire [`L15_CSM_NUM_TICKETS_LOG2-1:0] l15_csm_clear_ticket;
wire l15_csm_clear_ticket_val;
wire [`PACKET_HOME_ID_WIDTH-1:0] csm_l15_read_res_data;
wire csm_l15_read_res_val;

// with noc1
wire noc1encoder_csm_req_ack;
wire csm_noc1encoder_req_val;
wire [`L15_NOC1_REQTYPE_WIDTH-1:0] csm_noc1encoder_req_type;
wire [`L15_CSM_NUM_TICKETS_LOG2-1:0] csm_noc1encoder_req_mshrid;
wire [`PHY_ADDR_WIDTH-1:0] csm_noc1encoder_req_address;
wire csm_noc1encoder_req_non_cacheable;
wire  [`PCX_SIZE_WIDTH-1:0] csm_noc1encoder_req_size;

l15_csm l15_csm(
    .clk(clk),
    .rst_n(rst_n),
    
    // interface with noc1 buffer
    .l15_csm_read_ticket(l15_csm_read_ticket),
    .l15_csm_clear_ticket(l15_csm_clear_ticket),
    .l15_csm_clear_ticket_val(l15_csm_clear_ticket_val),
    .csm_l15_read_res_data(csm_l15_read_res_data),
    .csm_l15_read_res_val(csm_l15_read_res_val),
    
    // config regs
    .l15_hmt_base_reg(config_hmt_base),
    .csm_en(config_csm_en),
    .system_tile_count(config_system_tile_count[`HOME_ID_WIDTH-1:0]),
    .home_alloc_method(config_home_alloc_method),
    
    // interface with pipeline
    .l15_csm_req_address_s2(l15_csm_req_address_s2),
    .l15_csm_req_val_s2(l15_csm_req_val_s2),
    .l15_csm_stall_s3(l15_csm_stall_s3),
    .l15_csm_req_ticket_s2(l15_csm_req_ticket_s2),
    //.l15_csm_clump_tile_count_s2(l15_csm_clump_tile_count_s2),
    .l15_csm_req_type_s2(l15_csm_req_type_s2),
    .l15_csm_req_data_s2(l15_csm_req_data_s2),
    .l15_csm_req_pcx_data_s2(l15_csm_req_pcx_data_s2),
    .csm_l15_res_val_s3(csm_l15_res_val_s3),
    .csm_l15_res_data_s3(csm_l15_res_data_s3),
    
    // interface with noc1
    .noc1encoder_csm_req_ack(noc1encoder_csm_req_ack),
    .csm_noc1encoder_req_val(csm_noc1encoder_req_val),
    .csm_noc1encoder_req_type(csm_noc1encoder_req_type),
    .csm_noc1encoder_req_mshrid(csm_noc1encoder_req_mshrid),
    .csm_noc1encoder_req_address(csm_noc1encoder_req_address),
    .csm_noc1encoder_req_non_cacheable(csm_noc1encoder_req_non_cacheable),
    .csm_noc1encoder_req_size(csm_noc1encoder_req_size)
);

/*
    NoC2 buffer gets all the flits of a packet before transmitting it to the L1.5
    TODO: optimize it so that full buffering is not needed,
            ie. we can have a header ready signal + data ready signal
*/

wire [511:0] noc2_data;
wire noc2_data_val;
wire noc2_data_ack;

simplenocbuffer simplenocbuffer(
    .clk(clk),
    .rst_n(rst_n),
    .noc_in_val(noc2_in_val),
    .noc_in_data(noc2_in_data),
    .msg_ack(noc2_data_ack),
    .noc_in_rdy(noc2_in_rdy),
    .msg(noc2_data),
    .msg_val(noc2_data_val)
);

wire l15_noc2decoder_ack;
wire l15_noc2decoder_header_ack;
wire noc2decoder_l15_val;
wire [`L15_MSHR_ID_WIDTH-1:0] noc2decoder_l15_mshrid;
wire noc2decoder_l15_l2miss;
wire noc2decoder_l15_icache_type;
wire noc2decoder_l15_f4b;
wire [`MSG_TYPE_WIDTH-1:0] noc2decoder_l15_reqtype;
wire [`L15_MESI_STATE_WIDTH-1:0] noc2decoder_l15_ack_state;
wire [63:0] noc2decoder_l15_data_0;
wire [63:0] noc2decoder_l15_data_1;
wire [63:0] noc2decoder_l15_data_2;
wire [63:0] noc2decoder_l15_data_3;
wire [`L15_PADDR_HI:0] noc2decoder_l15_address;
wire [3:0] noc2decoder_l15_fwd_subcacheline_vector;
wire [`PACKET_HOME_ID_WIDTH-1:0] noc2decoder_l15_src_homeid;

wire [`L15_CSM_NUM_TICKETS_LOG2-1:0] noc2decoder_l15_csm_mshrid;
wire [`L15_THREADID_MASK] noc2decoder_l15_threadid;
wire noc2decoder_l15_hmc_fill;

/*
    noc2decoder takes the data from the buffer and decode it to meaningful signals
    to the l15
*/
noc2decoder noc2decoder(
    .clk(clk),
    .rst_n(rst_n),
    .noc2_data(noc2_data),
    .noc2_data_val(noc2_data_val),
    .l15_noc2decoder_ack(l15_noc2decoder_ack),
    .l15_noc2decoder_header_ack(l15_noc2decoder_header_ack),
    .noc2_data_ack(noc2_data_ack),
    .noc2decoder_l15_val(noc2decoder_l15_val),
    .noc2decoder_l15_mshrid(noc2decoder_l15_mshrid),
    .noc2decoder_l15_l2miss(noc2decoder_l15_l2miss),
    .noc2decoder_l15_icache_type(noc2decoder_l15_icache_type),
    .noc2decoder_l15_f4b(noc2decoder_l15_f4b),
    .noc2decoder_l15_reqtype(noc2decoder_l15_reqtype),
    .noc2decoder_l15_ack_state(noc2decoder_l15_ack_state),
    .noc2decoder_l15_data_0(noc2decoder_l15_data_0),
    .noc2decoder_l15_data_1(noc2decoder_l15_data_1),
    .noc2decoder_l15_data_2(noc2decoder_l15_data_2),
    .noc2decoder_l15_data_3(noc2decoder_l15_data_3),
    .noc2decoder_l15_address(noc2decoder_l15_address),
    .noc2decoder_l15_fwd_subcacheline_vector(noc2decoder_l15_fwd_subcacheline_vector),
    .noc2decoder_l15_src_homeid(noc2decoder_l15_src_homeid),
    .noc2decoder_l15_csm_mshrid(noc2decoder_l15_csm_mshrid),
    .noc2decoder_l15_threadid(noc2decoder_l15_threadid),
    .noc2decoder_l15_hmc_fill(noc2decoder_l15_hmc_fill),
    .l15_dmbr_l2missIn(l15_dmbr_l2missIn),
    .l15_dmbr_l2missTag(l15_dmbr_l2missTag),
    .l15_dmbr_l2responseIn(l15_dmbr_l2responseIn)
);

// noc1 signal declarations
wire noc1encoder_l15_req_ack;
wire noc1encoder_l15_req_sent;
wire l15_noc1buffer_req_val;
wire [`NOC1_BUFFER_ACK_DATA_WIDTH-1:0] noc1encoder_l15_req_data_sent;

wire [`L15_NOC1_REQTYPE_WIDTH-1:0] l15_noc1buffer_req_type;
wire [`L15_THREADID_MASK] l15_noc1buffer_req_threadid;
wire [`L15_MSHR_ID_WIDTH-1:0] l15_noc1buffer_req_mshrid;
wire [`L15_PADDR_HI:0] l15_noc1buffer_req_address;
wire l15_noc1buffer_req_non_cacheable;
wire [2:0] l15_noc1buffer_req_size;
wire l15_noc1buffer_req_prefetch;
// wire l15_noc1buffer_req_blkstore;
// wire l15_noc1buffer_req_blkinitstore;
wire [63:0] l15_noc1buffer_req_data_0;
wire [63:0] l15_noc1buffer_req_data_1;
wire [`TLB_CSM_WIDTH-1:0] l15_noc1buffer_req_csm_data;
// csm
wire [`L15_CSM_NUM_TICKETS_LOG2-1:0] l15_noc1buffer_req_csm_ticket;
wire [`PACKET_HOME_ID_WIDTH-1:0] l15_noc1buffer_req_homeid;
wire l15_noc1buffer_req_homeid_val;
wire [`MSG_SDID_WIDTH-1:0] noc1buffer_noc1encoder_req_csm_sdid;
wire [`MSG_LSID_WIDTH-1:0] noc1buffer_noc1encoder_req_csm_lsid;

wire [`L15_NOC1_REQTYPE_WIDTH-1:0] noc1buffer_noc1encoder_req_type;
wire [`L15_THREADID_MASK] noc1buffer_noc1encoder_req_threadid;
wire [`L15_MSHR_ID_WIDTH-1:0] noc1buffer_noc1encoder_req_mshrid;
wire [`L15_PADDR_HI:0] noc1buffer_noc1encoder_req_address;
wire noc1buffer_noc1encoder_req_non_cacheable;
wire [2:0] noc1buffer_noc1encoder_req_size;
wire noc1buffer_noc1encoder_req_prefetch;
// wire noc1buffer_noc1encoder_req_blkstore;
// wire noc1buffer_noc1encoder_req_blkinitstore;
wire [63:0] noc1buffer_noc1encoder_req_data_0;
wire [63:0] noc1buffer_noc1encoder_req_data_1;
wire [`PACKET_HOME_ID_WIDTH-1:0] noc1buffer_noc1encoder_req_homeid;

wire noc1encoder_noc1buffer_req_ack;
wire noc1buffer_noc1encoder_req_val;


// noc3 signal declarations
wire noc3encoder_l15_req_ack;
wire noc3encoder_noc3buffer_req_ack;

wire l15_noc3encoder_req_val;
wire noc3buffer_noc3encoder_req_val;
wire [`L15_NOC3_REQTYPE_WIDTH-1:0] l15_noc3encoder_req_type;
wire [63:0] l15_noc3encoder_req_data_0;
wire [63:0] l15_noc3encoder_req_data_1;
wire [`L15_MSHR_ID_WIDTH-1:0] l15_noc3encoder_req_mshrid;
wire [1:0] l15_noc3encoder_req_sequenceid;
wire [`L15_THREADID_MASK] l15_noc3encoder_req_threadid;
wire [`L15_PADDR_HI:0] l15_noc3encoder_req_address;
wire l15_noc3encoder_req_with_data;
wire l15_noc3encoder_req_was_inval;
wire [3:0] l15_noc3encoder_req_fwdack_vector;
wire [`PACKET_HOME_ID_WIDTH-1:0] l15_noc3encoder_req_homeid;

wire [`L15_NOC3_REQTYPE_WIDTH-1:0] noc3buffer_noc3encoder_req_type;
wire [63:0] noc3buffer_noc3encoder_req_data_0;
wire [63:0] noc3buffer_noc3encoder_req_data_1;
wire [`L15_MSHR_ID_WIDTH-1:0] noc3buffer_noc3encoder_req_mshrid;
wire [1:0] noc3buffer_noc3encoder_req_sequenceid;
wire [`L15_THREADID_MASK] noc3buffer_noc3encoder_req_threadid;
wire [`L15_PADDR_HI:0] noc3buffer_noc3encoder_req_address;
wire noc3buffer_noc3encoder_req_with_data;
wire noc3buffer_noc3encoder_req_was_inval;
wire [3:0] noc3buffer_noc3encoder_req_fwdack_vector;
wire [`PACKET_HOME_ID_WIDTH-1:0] noc3buffer_noc3encoder_req_homeid;



// DTAG
wire l15_dtag_val_s1;
wire l15_dtag_rw_s1;
wire [`L15_CACHE_INDEX_WIDTH-1:0] l15_dtag_index_s1;
wire [`L15_CACHE_TAG_RAW_WIDTH*4-1:0] l15_dtag_write_data_s1;
wire [`L15_CACHE_TAG_RAW_WIDTH*4-1:0] l15_dtag_write_mask_s1;
wire [`L15_CACHE_TAG_RAW_WIDTH*4-1:0] dtag_l15_dout_s2;

sram_l15_tag dtag(
    .MEMCLK(clk),
    .RESET_N(rst_n),
    .CE(l15_dtag_val_s1),
    .A(l15_dtag_index_s1),
    .DIN(l15_dtag_write_data_s1),
    .BW(l15_dtag_write_mask_s1),
    .RDWEN(l15_dtag_rw_s1),
    .DOUT(dtag_l15_dout_s2),
    .BIST_COMMAND(rtap_srams_bist_command),
    .BIST_DIN(rtap_srams_bist_data),
    .BIST_DOUT(dtag_rtap_data),
    .SRAMID(`BIST_ID_L15_DTAG)
);

// DCACHE
wire l15_dcache_val_s2;
wire l15_dcache_rw_s2;
wire [(`L15_CACHE_INDEX_WIDTH+`L15_WAY_WIDTH)-1:0] l15_dcache_index_s2;
wire [127:0] l15_dcache_write_data_s2;
wire [127:0] l15_dcache_write_mask_s2;
wire [127:0] dcache_l15_dout_s3;


`ifndef NO_RTL_CSM
wire [`L15_CSM_GHID_WIDTH-1:0] l15_hmt_write_data_s2;
wire [`L15_CSM_GHID_WIDTH-1:0] l15_hmt_write_mask_s2;
wire [`L15_CSM_GHID_WIDTH-1:0] hmt_l15_dout_s3;
`endif

// sram_1rw_512x128 dcache(
sram_l15_data dcache(
    .MEMCLK(clk),
    .RESET_N(rst_n),
    .CE(l15_dcache_val_s2),
    .A(l15_dcache_index_s2),
    .DIN({l15_dcache_write_data_s2}),
    .BW({l15_dcache_write_mask_s2}),
    .RDWEN(l15_dcache_rw_s2),
    .DOUT({dcache_l15_dout_s3}),
    .BIST_COMMAND(rtap_srams_bist_command),
    .BIST_DIN(rtap_srams_bist_data),
    .BIST_DOUT(dcache_rtap_data),
    .SRAMID(`BIST_ID_L15_DCACHE)
);

// wire [127:0] l15_hmt_write_data_s2_extended = l15_hmt_write_data_s2;
// wire [127:0] l15_hmt_write_mask_s2_extended = l15_hmt_write_mask_s2;
// wire [127:0] hmt_l15_dout_s3_extended;
// assign hmt_l15_dout_s3 = hmt_l15_dout_s3_extended;
// // home map table, is supposed to be merged with dcache but for now use this
// sram_1rw_512x128 hmt(
//    .MEMCLK(clk),
//    .RESET_N(rst_n),
//    .CE(l15_dcache_val_s2),
//    .A(l15_dcache_index_s2),
//    .DIN(l15_hmt_write_data_s2_extended),
//    .BW(l15_hmt_write_mask_s2_extended),
//    .RDWEN(l15_dcache_rw_s2),

//    .TESTEN(1'b0),
//    .TA(l15_dcache_index_s2),
//    .TDIN(l15_dcache_write_data_s2),
//    .TBW(l15_dcache_write_mask_s2),
//    .TRDWEN(l15_dcache_rw_s2),

//    .FUSE(`BIST_FUSE_WIDTH'b0),

//    .DOUT(hmt_l15_dout_s3_extended),
//    .TDOUT()
//    );

`ifndef NO_RTL_CSM
wire [31:0] l15_hmt_write_data_s2_extended = l15_hmt_write_data_s2;
wire [31:0] l15_hmt_write_mask_s2_extended = l15_hmt_write_mask_s2;
wire [31:0] hmt_l15_dout_s3_extended;
assign hmt_l15_dout_s3 = hmt_l15_dout_s3_extended[`L15_CSM_GHID_WIDTH-1:0];
// sram_1rw_512x32 hmt(
sram_l15_hmt hmt(
    .MEMCLK(clk),
    .RESET_N(rst_n),
    .CE(l15_dcache_val_s2),
    .A(l15_dcache_index_s2),
    .DIN(l15_hmt_write_data_s2_extended),
    .BW(l15_hmt_write_mask_s2_extended),
    .RDWEN(l15_dcache_rw_s2),
    .DOUT(hmt_l15_dout_s3_extended),
    .BIST_COMMAND(rtap_srams_bist_command),
    .BIST_DIN(rtap_srams_bist_data),
    .BIST_DOUT(hmt_rtap_data),
    .SRAMID(`BIST_ID_L15_HMT)
);
`endif


// MSHR
wire pipe_mshr_writereq_val_s1;
wire [`L15_MSHR_WRITE_TYPE_WIDTH-1:0] pipe_mshr_writereq_op_s1;
wire [`L15_PADDR_HI:0] pipe_mshr_writereq_address_s1;
wire [127:0] pipe_mshr_writereq_write_buffer_data_s1;
wire [15:0] pipe_mshr_writereq_write_buffer_byte_mask_s1;
wire [`L15_CONTROL_WIDTH-1:0] pipe_mshr_writereq_control_s1;
wire [`L15_MSHR_ID_WIDTH-1:0] pipe_mshr_writereq_mshrid_s1;
wire [`L15_THREADID_MASK] pipe_mshr_writereq_threadid_s1;
wire [`L15_THREADID_MASK] pipe_mshr_readreq_threadid_s1;
wire [`L15_MSHR_ID_WIDTH-1:0] pipe_mshr_readreq_mshrid_s1;
wire [`L15_CONTROL_WIDTH-1:0] mshr_pipe_readres_control_s1;
wire [`PACKET_HOME_ID_WIDTH-1:0] mshr_pipe_readres_homeid_s1;
wire [(`L15_NUM_MSHRID_PER_THREAD*`L15_NUM_THREADS)-1:0] mshr_pipe_vals_s1;
wire [(40*`L15_NUM_THREADS)-1:0] mshr_pipe_ld_address;
wire [(40*`L15_NUM_THREADS)-1:0] mshr_pipe_st_address;
wire [(2*`L15_NUM_THREADS)-1:0] mshr_pipe_st_way_s1;
wire [(`L15_MESI_TRANS_STATE_WIDTH*`L15_NUM_THREADS)-1:0] mshr_pipe_st_state_s1;
wire pipe_mshr_write_buffer_rd_en_s2;
wire [`L15_THREADID_MASK] pipe_mshr_threadid_s2;
wire [127:0]mshr_pipe_write_buffer_s2;
wire [15:0] mshr_pipe_write_buffer_byte_mask_s2;
wire pipe_mshr_val_s3;
wire [`L15_MSHR_WRITE_TYPE_WIDTH-1:0] pipe_mshr_op_s3;
wire [`L15_MSHR_ID_WIDTH-1:0] pipe_mshr_mshrid_s3;
wire [`L15_THREADID_MASK] pipe_mshr_threadid_s3;
wire [`L15_MESI_TRANS_STATE_WIDTH-1:0] pipe_mshr_write_update_state_s3;
wire [1:0] pipe_mshr_write_update_way_s3;

wire noc1buffer_mshr_homeid_write_val_s4;
wire [`L15_MSHR_ID_WIDTH-1:0] noc1buffer_mshr_homeid_write_mshrid_s4;
wire [`PACKET_HOME_ID_WIDTH-1:0] noc1buffer_mshr_homeid_write_data_s4;
wire [`L15_THREADID_MASK] noc1buffer_mshr_homeid_write_threadid_s4;

l15_mshr mshr(
    .clk(clk),
    .rst_n(rst_n),
    .pipe_mshr_writereq_val_s1(pipe_mshr_writereq_val_s1),
    .pipe_mshr_writereq_op_s1(pipe_mshr_writereq_op_s1),
    .pipe_mshr_writereq_address_s1(pipe_mshr_writereq_address_s1),
    .pipe_mshr_writereq_write_buffer_data_s1(pipe_mshr_writereq_write_buffer_data_s1),
    .pipe_mshr_writereq_write_buffer_byte_mask_s1(pipe_mshr_writereq_write_buffer_byte_mask_s1),
    .pipe_mshr_writereq_control_s1(pipe_mshr_writereq_control_s1),
    .pipe_mshr_writereq_mshrid_s1(pipe_mshr_writereq_mshrid_s1),
    .pipe_mshr_writereq_threadid_s1(pipe_mshr_writereq_threadid_s1),
    .pipe_mshr_readreq_threadid_s1(pipe_mshr_readreq_threadid_s1),
    .pipe_mshr_readreq_mshrid_s1(pipe_mshr_readreq_mshrid_s1),
    .mshr_pipe_readres_control_s1(mshr_pipe_readres_control_s1),
    .mshr_pipe_readres_homeid_s1(mshr_pipe_readres_homeid_s1),
    .mshr_pipe_vals_s1(mshr_pipe_vals_s1),
    .mshr_pipe_ld_address(mshr_pipe_ld_address),
    .mshr_pipe_st_address(mshr_pipe_st_address),
    .mshr_pipe_st_way_s1(mshr_pipe_st_way_s1),
    .mshr_pipe_st_state_s1(mshr_pipe_st_state_s1),
    .pipe_mshr_write_buffer_rd_en_s2(pipe_mshr_write_buffer_rd_en_s2),
    .pipe_mshr_threadid_s2(pipe_mshr_threadid_s2),
    .mshr_pipe_write_buffer_s2(mshr_pipe_write_buffer_s2),
    .mshr_pipe_write_buffer_byte_mask_s2(mshr_pipe_write_buffer_byte_mask_s2),
    .pipe_mshr_val_s3(pipe_mshr_val_s3),
    .pipe_mshr_op_s3(pipe_mshr_op_s3),
    .pipe_mshr_mshrid_s3(pipe_mshr_mshrid_s3),
    .pipe_mshr_threadid_s3(pipe_mshr_threadid_s3),
    .pipe_mshr_write_update_state_s3(pipe_mshr_write_update_state_s3),
    .pipe_mshr_write_update_way_s3(pipe_mshr_write_update_way_s3),
    
    .noc1buffer_mshr_homeid_write_threadid_s4(noc1buffer_mshr_homeid_write_threadid_s4),
    .noc1buffer_mshr_homeid_write_val_s4(noc1buffer_mshr_homeid_write_val_s4),
    .noc1buffer_mshr_homeid_write_mshrid_s4(noc1buffer_mshr_homeid_write_mshrid_s4),
    .noc1buffer_mshr_homeid_write_data_s4(noc1buffer_mshr_homeid_write_data_s4)
);


// MESI array
wire l15_mesi_read_val_s1;
wire [`L15_CACHE_INDEX_WIDTH-1:0] l15_mesi_read_index_s1;
wire l15_mesi_write_val_s2;
wire [`L15_CACHE_INDEX_WIDTH-1:0] l15_mesi_write_index_s2;
wire [7:0] l15_mesi_write_mask_s2;
wire [7:0] l15_mesi_write_data_s2;
wire [7:0] mesi_l15_dout_s2;

rf_l15_mesi mesi(
    .clk(clk),
    .rst_n(rst_n),
    .read_valid(l15_mesi_read_val_s1),
    .read_index(l15_mesi_read_index_s1),
    .write_valid(l15_mesi_write_val_s2),
    .write_index(l15_mesi_write_index_s2),
    .write_mask(l15_mesi_write_mask_s2),
    .write_data(l15_mesi_write_data_s2),
    .read_data(mesi_l15_dout_s2)
);

// LRSC Flag array
wire l15_lrsc_flag_read_val_s1;
wire [`L15_CACHE_INDEX_WIDTH-1:0] l15_lrsc_flag_read_index_s1;
wire l15_lrsc_flag_write_val_s2;
wire [`L15_CACHE_INDEX_WIDTH-1:0] l15_lrsc_flag_write_index_s2;
wire [3:0] l15_lrsc_flag_write_mask_s2;
wire [3:0] l15_lrsc_flag_write_data_s2;
wire [3:0] lrsc_flag_l15_dout_s2;

rf_l15_lrsc_flag lrsc_flag(
    .clk(clk),
    .rst_n(rst_n),
    .read_valid(l15_lrsc_flag_read_val_s1),
    .read_index(l15_lrsc_flag_read_index_s1),
    .write_valid(l15_lrsc_flag_write_val_s2),
    .write_index(l15_lrsc_flag_write_index_s2),
    .write_mask(l15_lrsc_flag_write_mask_s2),
    .write_data(l15_lrsc_flag_write_data_s2),
    .read_data(lrsc_flag_l15_dout_s2)
);

// // home map table array
// wire l15_hmt_read_val_s1;
// wire [8:0] l15_hmt_read_index_s1;
// wire l15_hmt_write_val_s2;
// wire [8:0] l15_hmt_write_index_s2;
// wire [31:0] l15_hmt_write_mask_s2;
// wire [31:0] l15_hmt_write_data_s2;
// wire [31:0] hmt_l15_dout_s2;

// l15_rf_512x32 hmt(
//    .clk(clk),
//    .rst_n(rst_n),
//    .read_valid(l15_hmt_read_val_s1),
//    .read_index(l15_hmt_read_index_s1),
//    .write_valid(l15_hmt_write_val_s2),
//    .write_index(l15_hmt_write_index_s2),
//    .write_mask(l15_hmt_write_mask_s2),
//    .write_data(l15_hmt_write_data_s2),
//    .read_data(hmt_l15_dout_s2)
//    );



// way map table
wire l15_wmt_read_val_s2;
wire [`L1D_SET_IDX_MASK] l15_wmt_read_index_s2;
wire l15_wmt_write_val_s3;
wire [`L1D_SET_IDX_MASK] l15_wmt_write_index_s3;
wire [`L15_WMT_MASK] l15_wmt_write_mask_s3;
wire [`L15_WMT_MASK] l15_wmt_write_data_s3;
wire [`L15_WMT_MASK] wmt_l15_data_s3;
rf_l15_wmt wmc(
    .clk(clk),
    .rst_n(rst_n),
    .read_valid(l15_wmt_read_val_s2),
    .read_index(l15_wmt_read_index_s2),
    .write_valid(l15_wmt_write_val_s3),
    .write_index(l15_wmt_write_index_s3),
    .write_mask(l15_wmt_write_mask_s3),
    .write_data(l15_wmt_write_data_s3),
    .read_data(wmt_l15_data_s3)
);

// lru array, psuedo
wire l15_lruarray_read_val_s1;
wire [`L15_CACHE_INDEX_WIDTH-1:0] l15_lruarray_read_index_s1;
wire l15_lruarray_write_val_s3;
wire [`L15_CACHE_INDEX_WIDTH-1:0] l15_lruarray_write_index_s3;
wire [5:0] l15_lruarray_write_mask_s3;
wire [5:0] l15_lruarray_write_data_s3;
wire [5:0] lruarray_l15_dout_s2;
rf_l15_lruarray lruarray(
    .clk(clk),
    .rst_n(rst_n),
    .read_valid(l15_lruarray_read_val_s1),
    .read_index(l15_lruarray_read_index_s1),
    .write_valid(l15_lruarray_write_val_s3),
    .write_index(l15_lruarray_write_index_s3),
    .write_mask(l15_lruarray_write_mask_s3),
    .write_data(l15_lruarray_write_data_s3),
    .read_data(lruarray_l15_dout_s2)
);

// pipeline
l15_pipeline pipeline(
    .clk(clk),
    .rst_n(rst_n),
    .dtag_l15_dout_s2(dtag_l15_dout_s2),
    .dcache_l15_dout_s3(dcache_l15_dout_s3),
    .mesi_l15_dout_s2(mesi_l15_dout_s2),
    .lrsc_flag_l15_dout_s2(lrsc_flag_l15_dout_s2),
    .lruarray_l15_dout_s2(lruarray_l15_dout_s2),
    .wmt_l15_data_s3(wmt_l15_data_s3),
    .pcxdecoder_l15_rqtype               (transducer_l15_rqtype),
    .pcxdecoder_l15_amo_op               (transducer_l15_amo_op),
    .pcxdecoder_l15_nc                   (transducer_l15_nc),
    .pcxdecoder_l15_size                 (transducer_l15_size),
    // .pcxdecoder_l15_invalall          (transducer_l15_invalall),
    .pcxdecoder_l15_threadid             (transducer_l15_threadid),
    .pcxdecoder_l15_prefetch             (transducer_l15_prefetch),
    .pcxdecoder_l15_blockstore           (transducer_l15_blockstore),
    .pcxdecoder_l15_blockinitstore       (transducer_l15_blockinitstore),
    .pcxdecoder_l15_l1rplway             (transducer_l15_l1rplway),
    .pcxdecoder_l15_val                  (transducer_l15_val),
    .pcxdecoder_l15_invalidate_cacheline (transducer_l15_invalidate_cacheline),
    .pcxdecoder_l15_address              (transducer_l15_address),
    .pcxdecoder_l15_data                 (transducer_l15_data),
    .pcxdecoder_l15_data_next_entry      (transducer_l15_data_next_entry),
    .pcxdecoder_l15_csm_data             (transducer_l15_csm_data),
    .noc2decoder_l15_val(noc2decoder_l15_val),
    .noc2decoder_l15_mshrid(noc2decoder_l15_mshrid),
    .noc2decoder_l15_l2miss(noc2decoder_l15_l2miss),
    .noc2decoder_l15_icache_type(noc2decoder_l15_icache_type),
    .noc2decoder_l15_f4b(noc2decoder_l15_f4b),
    .noc2decoder_l15_reqtype(noc2decoder_l15_reqtype),
    .noc2decoder_l15_ack_state(noc2decoder_l15_ack_state),
    .noc2decoder_l15_data_0(noc2decoder_l15_data_0),
    .noc2decoder_l15_data_1(noc2decoder_l15_data_1),
    .noc2decoder_l15_data_2(noc2decoder_l15_data_2),
    .noc2decoder_l15_data_3(noc2decoder_l15_data_3),
    .noc2decoder_l15_address(noc2decoder_l15_address),
    .noc2decoder_l15_fwd_subcacheline_vector(noc2decoder_l15_fwd_subcacheline_vector),
    .noc2decoder_l15_src_homeid(noc2decoder_l15_src_homeid),
    .noc2decoder_l15_csm_mshrid(noc2decoder_l15_csm_mshrid),
    .noc2decoder_l15_threadid(noc2decoder_l15_threadid),
    .noc2decoder_l15_hmc_fill(noc2decoder_l15_hmc_fill),
    .cpxencoder_l15_req_ack(transducer_l15_req_ack),
    // .noc1encoder_l15_req_ack(noc1encoder_l15_req_ack),
    .noc1encoder_l15_req_sent(noc1encoder_l15_req_sent),
    .noc1encoder_l15_req_data_sent(noc1encoder_l15_req_data_sent),
    .noc3encoder_l15_req_ack(noc3encoder_l15_req_ack),
    // .chipid(chipid),
    // .coreid_x(coreid_x),
    // .coreid_y(coreid_y),
    
    // OUTPUT
    .l15_dtag_val_s1(l15_dtag_val_s1),
    .l15_dtag_rw_s1(l15_dtag_rw_s1),
    .l15_dtag_index_s1(l15_dtag_index_s1),
    .l15_dtag_write_data_s1(l15_dtag_write_data_s1),
    .l15_dtag_write_mask_s1(l15_dtag_write_mask_s1),
    .l15_dcache_val_s2(l15_dcache_val_s2),
    .l15_dcache_rw_s2(l15_dcache_rw_s2),
    .l15_dcache_index_s2(l15_dcache_index_s2),
    .l15_dcache_write_data_s2(l15_dcache_write_data_s2),
    .l15_dcache_write_mask_s2(l15_dcache_write_mask_s2),
    .l15_mesi_read_val_s1(l15_mesi_read_val_s1),
    .l15_mesi_read_index_s1(l15_mesi_read_index_s1),
    .l15_mesi_write_val_s2(l15_mesi_write_val_s2),
    .l15_mesi_write_index_s2(l15_mesi_write_index_s2),
    .l15_mesi_write_mask_s2(l15_mesi_write_mask_s2),
    .l15_mesi_write_data_s2(l15_mesi_write_data_s2),
    .l15_lrsc_flag_read_val_s1(l15_lrsc_flag_read_val_s1),
    .l15_lrsc_flag_read_index_s1(l15_lrsc_flag_read_index_s1),
    .l15_lrsc_flag_write_val_s2(l15_lrsc_flag_write_val_s2),
    .l15_lrsc_flag_write_index_s2(l15_lrsc_flag_write_index_s2),
    .l15_lrsc_flag_write_mask_s2(l15_lrsc_flag_write_mask_s2),
    .l15_lrsc_flag_write_data_s2(l15_lrsc_flag_write_data_s2),
    .l15_wmt_read_val_s2(l15_wmt_read_val_s2),
    .l15_wmt_read_index_s2(l15_wmt_read_index_s2),
    .l15_wmt_write_val_s3(l15_wmt_write_val_s3),
    .l15_wmt_write_index_s3(l15_wmt_write_index_s3),
    .l15_wmt_write_mask_s3(l15_wmt_write_mask_s3),
    .l15_wmt_write_data_s3(l15_wmt_write_data_s3),
    .l15_lruarray_read_val_s1(l15_lruarray_read_val_s1),
    .l15_lruarray_read_index_s1(l15_lruarray_read_index_s1),
    .l15_lruarray_write_val_s3(l15_lruarray_write_val_s3),
    .l15_lruarray_write_index_s3(l15_lruarray_write_index_s3),
    .l15_lruarray_write_mask_s3(l15_lruarray_write_mask_s3),
    .l15_lruarray_write_data_s3(l15_lruarray_write_data_s3),
    .l15_cpxencoder_val                  (l15_transducer_val),
    .l15_cpxencoder_returntype           (l15_transducer_returntype),
    .l15_cpxencoder_l2miss               (l15_transducer_l2miss),
    .l15_cpxencoder_error                (l15_transducer_error),
    .l15_cpxencoder_noncacheable         (l15_transducer_noncacheable),
    .l15_cpxencoder_atomic               (l15_transducer_atomic),
    .l15_cpxencoder_threadid             (l15_transducer_threadid),
    .l15_cpxencoder_prefetch             (l15_transducer_prefetch),
    .l15_cpxencoder_f4b                  (l15_transducer_f4b),
    .l15_cpxencoder_data_0               (l15_transducer_data_0),
    .l15_cpxencoder_data_1               (l15_transducer_data_1),
    .l15_cpxencoder_data_2               (l15_transducer_data_2),
    .l15_cpxencoder_data_3               (l15_transducer_data_3),
    .l15_cpxencoder_inval_icache_all_way (l15_transducer_inval_icache_all_way),
    .l15_cpxencoder_inval_dcache_all_way (l15_transducer_inval_dcache_all_way),
    .l15_cpxencoder_inval_address_15_4   (l15_transducer_inval_address_15_4),
    .l15_cpxencoder_cross_invalidate     (l15_transducer_cross_invalidate),
    .l15_cpxencoder_cross_invalidate_way (l15_transducer_cross_invalidate_way),
    .l15_cpxencoder_inval_dcache_inval   (l15_transducer_inval_dcache_inval),
    .l15_cpxencoder_inval_icache_inval   (l15_transducer_inval_icache_inval),
    .l15_cpxencoder_inval_way            (l15_transducer_inval_way),
    .l15_cpxencoder_blockinitstore       (l15_transducer_blockinitstore),
    .l15_noc1buffer_req_val(l15_noc1buffer_req_val),
    .l15_noc1buffer_req_type(l15_noc1buffer_req_type),
    .l15_noc1buffer_req_threadid(l15_noc1buffer_req_threadid),
    .l15_noc1buffer_req_mshrid(l15_noc1buffer_req_mshrid),
    .l15_noc1buffer_req_address(l15_noc1buffer_req_address),
    .l15_noc1buffer_req_non_cacheable(l15_noc1buffer_req_non_cacheable),
    .l15_noc1buffer_req_size(l15_noc1buffer_req_size),
    .l15_noc1buffer_req_prefetch(l15_noc1buffer_req_prefetch),
    // .l15_noc1buffer_req_blkstore(l15_noc1buffer_req_blkstore),
    // .l15_noc1buffer_req_blkinitstore(l15_noc1buffer_req_blkinitstore),
    .l15_noc1buffer_req_data_0(l15_noc1buffer_req_data_0),
    .l15_noc1buffer_req_data_1(l15_noc1buffer_req_data_1),
    .l15_noc1buffer_req_csm_data(l15_noc1buffer_req_csm_data),
    .l15_noc3encoder_req_val(l15_noc3encoder_req_val),
    .l15_noc3encoder_req_type(l15_noc3encoder_req_type),
    .l15_noc3encoder_req_data_0(l15_noc3encoder_req_data_0),
    .l15_noc3encoder_req_data_1(l15_noc3encoder_req_data_1),
    .l15_noc3encoder_req_mshrid(l15_noc3encoder_req_mshrid),
    .l15_noc3encoder_req_sequenceid(l15_noc3encoder_req_sequenceid),
    .l15_noc3encoder_req_threadid(l15_noc3encoder_req_threadid),
    .l15_noc3encoder_req_address(l15_noc3encoder_req_address),
    .l15_noc3encoder_req_with_data(l15_noc3encoder_req_with_data),
    .l15_noc3encoder_req_was_inval(l15_noc3encoder_req_was_inval),
    .l15_noc3encoder_req_fwdack_vector(l15_noc3encoder_req_fwdack_vector),
    .l15_noc3encoder_req_homeid(l15_noc3encoder_req_homeid),
    .l15_pcxdecoder_ack(l15_transducer_ack),
    .l15_noc2decoder_ack(l15_noc2decoder_ack),
    .l15_pcxdecoder_header_ack(l15_transducer_header_ack),
    .l15_noc2decoder_header_ack(l15_noc2decoder_header_ack),
    
    // CSM
    .l15_csm_req_address_s2(l15_csm_req_address_s2),
    .l15_csm_req_val_s2(l15_csm_req_val_s2),
    .l15_csm_stall_s3(l15_csm_stall_s3),
    .l15_csm_req_ticket_s2(l15_csm_req_ticket_s2),
    // .l15_csm_clump_tile_count_s2(l15_csm_clump_tile_count_s2),
    .l15_csm_req_type_s2(l15_csm_req_type_s2),
    .l15_csm_req_data_s2(l15_csm_req_data_s2),
    .l15_csm_req_pcx_data_s2(l15_csm_req_pcx_data_s2),
    .csm_l15_res_val_s3(csm_l15_res_val_s3),
    .csm_l15_res_data_s3(csm_l15_res_data_s3),
    
    .l15_noc1buffer_req_csm_ticket(l15_noc1buffer_req_csm_ticket),
    .l15_noc1buffer_req_homeid(l15_noc1buffer_req_homeid),
    .l15_noc1buffer_req_homeid_val(l15_noc1buffer_req_homeid_val),
    
    // .config_csm_en(config_csm_en),
    
    // hmt
     `ifndef NO_RTL_CSM
    .l15_hmt_write_data_s2(l15_hmt_write_data_s2),
    .l15_hmt_write_mask_s2(l15_hmt_write_mask_s2),
    .hmt_l15_dout_s3(hmt_l15_dout_s3),
     `endif
    
    // config registers
    .l15_config_req_val_s2(l15_config_req_val_s2),
    .l15_config_req_rw_s2(l15_config_req_rw_s2),
    .l15_config_write_req_data_s2(l15_config_write_req_data_s2),
    .l15_config_req_address_s2(l15_config_req_address_s2),
    .config_l15_read_res_data_s3(config_l15_read_res_data_s3),
    
    // MSHR
    .pipe_mshr_writereq_val_s1(pipe_mshr_writereq_val_s1),
    .pipe_mshr_writereq_op_s1(pipe_mshr_writereq_op_s1),
    .pipe_mshr_writereq_address_s1(pipe_mshr_writereq_address_s1),
    .pipe_mshr_writereq_write_buffer_data_s1(pipe_mshr_writereq_write_buffer_data_s1),
    .pipe_mshr_writereq_write_buffer_byte_mask_s1(pipe_mshr_writereq_write_buffer_byte_mask_s1),
    .pipe_mshr_writereq_control_s1(pipe_mshr_writereq_control_s1),
    .pipe_mshr_writereq_mshrid_s1(pipe_mshr_writereq_mshrid_s1),
    .pipe_mshr_writereq_threadid_s1(pipe_mshr_writereq_threadid_s1),
    .pipe_mshr_readreq_threadid_s1(pipe_mshr_readreq_threadid_s1),
    .pipe_mshr_readreq_mshrid_s1(pipe_mshr_readreq_mshrid_s1),
    .mshr_pipe_readres_control_s1(mshr_pipe_readres_control_s1),
    .mshr_pipe_readres_homeid_s1(mshr_pipe_readres_homeid_s1),
    .mshr_pipe_vals_s1(mshr_pipe_vals_s1),
    .mshr_pipe_ld_address(mshr_pipe_ld_address),
    .mshr_pipe_st_address(mshr_pipe_st_address),
    .mshr_pipe_st_way_s1(mshr_pipe_st_way_s1),
    .mshr_pipe_st_state_s1(mshr_pipe_st_state_s1),
    .pipe_mshr_write_buffer_rd_en_s2(pipe_mshr_write_buffer_rd_en_s2),
    .pipe_mshr_threadid_s2(pipe_mshr_threadid_s2),
    .mshr_pipe_write_buffer_s2(mshr_pipe_write_buffer_s2),
    .mshr_pipe_write_buffer_byte_mask_s2(mshr_pipe_write_buffer_byte_mask_s2),
    .pipe_mshr_val_s3(pipe_mshr_val_s3),
    .pipe_mshr_op_s3(pipe_mshr_op_s3),
    .pipe_mshr_mshrid_s3(pipe_mshr_mshrid_s3),
    .pipe_mshr_threadid_s3(pipe_mshr_threadid_s3),
    .pipe_mshr_write_update_state_s3(pipe_mshr_write_update_state_s3),
    .pipe_mshr_write_update_way_s3(pipe_mshr_write_update_way_s3)
);

/*
NoC1 buffers data before send out to NoC1, unlike NoC3 which doesn't have to buffer
    The buffer scheme will probably work as follow:
        We will have 4 queues: writeback guard queue, CAS queue, 8B data inst queue, and ld/st queue
        - Combined WBG/ldst queue: 6 entries (1l/1s/1if each thread). No data
        - Dataqueue of 16B
            Supporting CAS/LDSTUB/SWAP and write-through. 1 CAS or 2 LDSTUB/SWAP or 2 write-through.
        All need to have the address + request metadata
    Priorities for the queues:
        1. writeback guard
        2. CAS
        3. data queue
        4. ld/st queue
        Note: TSO will not be violated regardless of how the NoC1 priority is chosen.
                This is due to the fact that only 1 load per thread can be outstanding, and no ordering between different threads enforced
                Actually, WBG might need to be ordered with respect to LD/ST req
*/
noc1buffer noc1buffer(
    .clk(clk),
    .rst_n(rst_n),
    .l15_noc1buffer_req_data_0(l15_noc1buffer_req_data_0),
    .l15_noc1buffer_req_data_1(l15_noc1buffer_req_data_1),
    .l15_noc1buffer_req_val(l15_noc1buffer_req_val),
    .l15_noc1buffer_req_type(l15_noc1buffer_req_type),
    .l15_noc1buffer_req_threadid(l15_noc1buffer_req_threadid),
    .l15_noc1buffer_req_mshrid(l15_noc1buffer_req_mshrid),
    .l15_noc1buffer_req_address(l15_noc1buffer_req_address),
    .l15_noc1buffer_req_non_cacheable(l15_noc1buffer_req_non_cacheable),
    .l15_noc1buffer_req_size(l15_noc1buffer_req_size),
    .l15_noc1buffer_req_prefetch(l15_noc1buffer_req_prefetch),
    // .l15_noc1buffer_req_blkstore(l15_noc1buffer_req_blkstore),
    // .l15_noc1buffer_req_blkinitstore(l15_noc1buffer_req_blkinitstore),
    .l15_noc1buffer_req_csm_data(l15_noc1buffer_req_csm_data),
    
    .l15_noc1buffer_req_csm_ticket(l15_noc1buffer_req_csm_ticket),
    .l15_noc1buffer_req_homeid(l15_noc1buffer_req_homeid),
    .l15_noc1buffer_req_homeid_val(l15_noc1buffer_req_homeid_val),
    .noc1buffer_noc1encoder_req_csm_sdid(noc1buffer_noc1encoder_req_csm_sdid),
    .noc1buffer_noc1encoder_req_csm_lsid(noc1buffer_noc1encoder_req_csm_lsid),
    
    .noc1encoder_noc1buffer_req_ack(noc1encoder_noc1buffer_req_ack),
    
    .noc1buffer_noc1encoder_req_data_0(noc1buffer_noc1encoder_req_data_0),
    .noc1buffer_noc1encoder_req_data_1(noc1buffer_noc1encoder_req_data_1),
    .noc1buffer_noc1encoder_req_val(noc1buffer_noc1encoder_req_val),
    .noc1buffer_noc1encoder_req_type(noc1buffer_noc1encoder_req_type),
    .noc1buffer_noc1encoder_req_mshrid(noc1buffer_noc1encoder_req_mshrid),
    .noc1buffer_noc1encoder_req_threadid(noc1buffer_noc1encoder_req_threadid),
    .noc1buffer_noc1encoder_req_address(noc1buffer_noc1encoder_req_address),
    .noc1buffer_noc1encoder_req_non_cacheable(noc1buffer_noc1encoder_req_non_cacheable),
    .noc1buffer_noc1encoder_req_size(noc1buffer_noc1encoder_req_size),
    .noc1buffer_noc1encoder_req_prefetch(noc1buffer_noc1encoder_req_prefetch),
    // .noc1buffer_noc1encoder_req_blkstore(noc1buffer_noc1encoder_req_blkstore),
    // .noc1buffer_noc1encoder_req_blkinitstore(noc1buffer_noc1encoder_req_blkinitstore),
    
    // stall signal from dmbr prevents the encoder from sending requests to the L2
    // .l15_dmbr_l1missIn(l15_dmbr_l1missIn),
    // .l15_dmbr_l1missTag(l15_dmbr_l1missTag),
    // .dmbr_l15_stall(dmbr_l15_stall),
    
    // CSM
    .l15_csm_read_ticket(l15_csm_read_ticket),
    .l15_csm_clear_ticket(l15_csm_clear_ticket),
    .l15_csm_clear_ticket_val(l15_csm_clear_ticket_val),
    .csm_l15_read_res_data(csm_l15_read_res_data),
    .csm_l15_read_res_val(csm_l15_read_res_val),
    .noc1buffer_noc1encoder_req_homeid(noc1buffer_noc1encoder_req_homeid),
    
    // .noc1buffer_l15_req_ack(noc1encoder_l15_req_ack),
    .noc1buffer_l15_req_sent(noc1encoder_l15_req_sent),
    .noc1buffer_l15_req_data_sent(noc1encoder_l15_req_data_sent),
    
    // homeid
    .noc1buffer_mshr_homeid_write_threadid_s4(noc1buffer_mshr_homeid_write_threadid_s4),
    .noc1buffer_mshr_homeid_write_val_s4(noc1buffer_mshr_homeid_write_val_s4),
    .noc1buffer_mshr_homeid_write_mshrid_s4(noc1buffer_mshr_homeid_write_mshrid_s4),
    .noc1buffer_mshr_homeid_write_data_s4(noc1buffer_mshr_homeid_write_data_s4)
);

noc1encoder noc1encoder(
    .clk(clk),
    .rst_n(rst_n),
    .noc1buffer_noc1encoder_req_data_0(noc1buffer_noc1encoder_req_data_0),
    .noc1buffer_noc1encoder_req_data_1(noc1buffer_noc1encoder_req_data_1),
    .noc1buffer_noc1encoder_req_val(noc1buffer_noc1encoder_req_val),
    .noc1buffer_noc1encoder_req_type(noc1buffer_noc1encoder_req_type),
    .noc1buffer_noc1encoder_req_mshrid(noc1buffer_noc1encoder_req_mshrid),
    .noc1buffer_noc1encoder_req_threadid(noc1buffer_noc1encoder_req_threadid),
    .noc1buffer_noc1encoder_req_address(noc1buffer_noc1encoder_req_address),
    .noc1buffer_noc1encoder_req_non_cacheable(noc1buffer_noc1encoder_req_non_cacheable),
    .noc1buffer_noc1encoder_req_size(noc1buffer_noc1encoder_req_size),
    .noc1buffer_noc1encoder_req_prefetch(noc1buffer_noc1encoder_req_prefetch),
    // .noc1buffer_noc1encoder_req_blkstore(noc1buffer_noc1encoder_req_blkstore),
    // .noc1buffer_noc1encoder_req_blkinitstore(noc1buffer_noc1encoder_req_blkinitstore),
    .noc1buffer_noc1encoder_req_csm_sdid(noc1buffer_noc1encoder_req_csm_sdid),
    .noc1buffer_noc1encoder_req_csm_lsid(noc1buffer_noc1encoder_req_csm_lsid),
    .noc1buffer_noc1encoder_req_homeid(noc1buffer_noc1encoder_req_homeid),
    
    .dmbr_l15_stall(dmbr_l15_stall),
    .chipid(chipid),
    .coreid_x(coreid_x),
    .coreid_y(coreid_y),
    .noc1out_ready(noc1_out_rdy),
    
    .l15_dmbr_l1missIn(l15_dmbr_l1missIn),
    .l15_dmbr_l1missTag(l15_dmbr_l1missTag),
    .noc1encoder_noc1buffer_req_ack(noc1encoder_noc1buffer_req_ack),
    .noc1encoder_noc1out_val(noc1_out_val),
    .noc1encoder_noc1out_data(noc1_out_data),
    
    // csm interface
    .noc1encoder_csm_req_ack(noc1encoder_csm_req_ack),
    .csm_noc1encoder_req_val(csm_noc1encoder_req_val),
    .csm_noc1encoder_req_type(csm_noc1encoder_req_type),
    .csm_noc1encoder_req_mshrid(csm_noc1encoder_req_mshrid),
    .csm_noc1encoder_req_address(csm_noc1encoder_req_address),
    .csm_noc1encoder_req_non_cacheable(csm_noc1encoder_req_non_cacheable),
    .csm_noc1encoder_req_size(csm_noc1encoder_req_size)
);


/*
   1 deep buffer for noc3 to improve performance and reduce timing pressure
*/
noc3buffer noc3buffer(
    .clk(clk),
    .rst_n(rst_n),
    .l15_noc3encoder_req_val(l15_noc3encoder_req_val),
    .l15_noc3encoder_req_type(l15_noc3encoder_req_type),
    .l15_noc3encoder_req_data_0(l15_noc3encoder_req_data_0),
    .l15_noc3encoder_req_data_1(l15_noc3encoder_req_data_1),
    .l15_noc3encoder_req_mshrid(l15_noc3encoder_req_mshrid),
    .l15_noc3encoder_req_sequenceid(l15_noc3encoder_req_sequenceid),
    .l15_noc3encoder_req_threadid(l15_noc3encoder_req_threadid),
    .l15_noc3encoder_req_address(l15_noc3encoder_req_address),
    .l15_noc3encoder_req_with_data(l15_noc3encoder_req_with_data),
    .l15_noc3encoder_req_was_inval(l15_noc3encoder_req_was_inval),
    .l15_noc3encoder_req_fwdack_vector(l15_noc3encoder_req_fwdack_vector),
    .l15_noc3encoder_req_homeid(l15_noc3encoder_req_homeid),
    .noc3buffer_l15_req_ack(noc3encoder_l15_req_ack),
    
    // from buffer to encoder
    .noc3buffer_noc3encoder_req_val(noc3buffer_noc3encoder_req_val),
    .noc3buffer_noc3encoder_req_type(noc3buffer_noc3encoder_req_type),
    .noc3buffer_noc3encoder_req_data_0(noc3buffer_noc3encoder_req_data_0),
    .noc3buffer_noc3encoder_req_data_1(noc3buffer_noc3encoder_req_data_1),
    .noc3buffer_noc3encoder_req_mshrid(noc3buffer_noc3encoder_req_mshrid),
    .noc3buffer_noc3encoder_req_sequenceid(noc3buffer_noc3encoder_req_sequenceid),
    .noc3buffer_noc3encoder_req_threadid(noc3buffer_noc3encoder_req_threadid),
    .noc3buffer_noc3encoder_req_address(noc3buffer_noc3encoder_req_address),
    .noc3buffer_noc3encoder_req_with_data(noc3buffer_noc3encoder_req_with_data),
    .noc3buffer_noc3encoder_req_was_inval(noc3buffer_noc3encoder_req_was_inval),
    .noc3buffer_noc3encoder_req_fwdack_vector(noc3buffer_noc3encoder_req_fwdack_vector),
    .noc3buffer_noc3encoder_req_homeid(noc3buffer_noc3encoder_req_homeid),
    .noc3encoder_noc3buffer_req_ack(noc3encoder_noc3buffer_req_ack)
);

noc3encoder noc3encoder(
    .clk(clk),
    .rst_n(rst_n),
    .l15_noc3encoder_req_val(noc3buffer_noc3encoder_req_val),
    .l15_noc3encoder_req_type(noc3buffer_noc3encoder_req_type),
    .l15_noc3encoder_req_data_0(noc3buffer_noc3encoder_req_data_0),
    .l15_noc3encoder_req_data_1(noc3buffer_noc3encoder_req_data_1),
    .l15_noc3encoder_req_mshrid(noc3buffer_noc3encoder_req_mshrid),
    .l15_noc3encoder_req_sequenceid(noc3buffer_noc3encoder_req_sequenceid),
    .l15_noc3encoder_req_threadid(noc3buffer_noc3encoder_req_threadid),
    .l15_noc3encoder_req_address(noc3buffer_noc3encoder_req_address),
    .l15_noc3encoder_req_with_data(noc3buffer_noc3encoder_req_with_data),
    .l15_noc3encoder_req_was_inval(noc3buffer_noc3encoder_req_was_inval),
    .l15_noc3encoder_req_fwdack_vector(noc3buffer_noc3encoder_req_fwdack_vector),
    .l15_noc3encoder_req_homeid(noc3buffer_noc3encoder_req_homeid),
    .chipid(chipid),
    .coreid_x(coreid_x),
    .coreid_y(coreid_y),
    .noc3out_ready(noc3_out_rdy),
    .noc3encoder_l15_req_ack(noc3encoder_noc3buffer_req_ack),
    .noc3encoder_noc3out_val(noc3_out_val),
    .noc3encoder_noc3out_data(noc3_out_data)
);

endmodule
