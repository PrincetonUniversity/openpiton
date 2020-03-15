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
//  Filename      : noc2decoder.v
//  Created On    : 2014-03-03 22:08:49
//  Last Modified : 2015-01-27 16:48:19
//  Revision      :
//
//  Description   :
//
//
//==================================================================================================
//noc2decoder.v

`include "iop.h"

`ifdef DEFAULT_NETTYPE_NONE
`default_nettype none
`endif
module noc2decoder(
    input wire clk,
    input wire rst_n,

    input wire [511:0] noc2_data,
    input wire noc2_data_val,
    input wire l15_noc2decoder_ack,
    input wire l15_noc2decoder_header_ack,

    output reg noc2_data_ack,

    output reg                       l15_dmbr_l2responseIn,
    output reg                       l15_dmbr_l2missIn,
    output reg [`DMBR_TAG_WIDTH-1:0] l15_dmbr_l2missTag,

    output reg noc2decoder_l15_val,
    output reg [`L15_MSHR_ID_WIDTH-1:0] noc2decoder_l15_mshrid,
    output reg [`L15_THREADID_MASK] noc2decoder_l15_threadid,
    output reg noc2decoder_l15_hmc_fill,
    output reg noc2decoder_l15_l2miss,
    output reg noc2decoder_l15_icache_type,
    output reg noc2decoder_l15_f4b,
    output reg [`MSG_TYPE_WIDTH-1:0] noc2decoder_l15_reqtype,
    output reg [`L15_MESI_STATE_WIDTH-1:0] noc2decoder_l15_ack_state,
    output reg [63:0] noc2decoder_l15_data_0,
    output reg [63:0] noc2decoder_l15_data_1,
    output reg [63:0] noc2decoder_l15_data_2,
    output reg [63:0] noc2decoder_l15_data_3,
    output reg [39:0] noc2decoder_l15_address,
    output reg [3:0] noc2decoder_l15_fwd_subcacheline_vector,
    output reg [`L15_CSM_NUM_TICKETS_LOG2-1:0] noc2decoder_l15_csm_mshrid,
    output reg [`PACKET_HOME_ID_WIDTH-1:0] noc2decoder_l15_src_homeid
    );


reg is_message_new;
reg is_message_new_next;
always @ (posedge clk)
begin
    if (!rst_n)
      is_message_new <= 1'b1;
    else
      is_message_new <= is_message_new_next;
end

reg [`MSG_MSHRID_WIDTH-1:0] noc2_mshrid;
reg [`MSG_LENGTH_WIDTH-1:0] msg_len;
always @ *
begin
    noc2_data_ack = l15_noc2decoder_ack;
    noc2decoder_l15_val = noc2_data_val && is_message_new;

    // these are shared by both requests and replies from L2
    noc2decoder_l15_reqtype = noc2_data[`MSG_TYPE];
    msg_len = noc2_data[`MSG_LENGTH];
    
    noc2_mshrid = noc2_data[`MSG_MSHRID];
    noc2decoder_l15_mshrid = noc2_mshrid[`L15_MSHR_ID_WIDTH-1:0];
    noc2decoder_l15_csm_mshrid = noc2_mshrid[`L15_CSM_NUM_TICKETS_LOG2-1:0];
    // the threadid is encoded in the mshrid sent to L2, is the next L15_THREADID_WIDTH bits after the first L15_MSHR_ID_WIDTH bits
    noc2decoder_l15_threadid = noc2_mshrid[`L15_MSHR_ID_WIDTH+`L15_THREADID_WIDTH -1 -: `L15_THREADID_WIDTH];
    noc2decoder_l15_hmc_fill = noc2_mshrid[`MSG_MSHRID_WIDTH-1];

    noc2decoder_l15_l2miss = noc2_data[`MSG_L2_MISS];
    noc2decoder_l15_icache_type = noc2_data[`MSG_CACHE_TYPE];
    noc2decoder_l15_f4b = 0;
    noc2decoder_l15_ack_state = noc2_data[`MSG_MESI];
    noc2decoder_l15_fwd_subcacheline_vector = noc2_data[`MSG_SUBLINE_VECTOR];
    noc2decoder_l15_address = noc2_data[`MSG_ADDR];

    // Replicate the data flits if we receive less than 4 to support
    // non-cacheable requests.
    // cacheable ifill      -- 32B / 4 flits 
    // non-cacheable ifill  -- 4B / 1 flit
    // cacheable load data ack      -- 16B / 2 flit
    // non-cacheable load data ack  -- 1-16B / 1-2 flit  sparc may send 16BNC-load
    // interrupt            -- 1 flit 
    noc2decoder_l15_data_0 = noc2_data[2*64 - 1 -: 64];
    noc2decoder_l15_data_1 = (msg_len == `MSG_LENGTH_WIDTH'd1) ? noc2_data[2*64 - 1 -: 64] : noc2_data[3*64 - 1 -: 64];
    noc2decoder_l15_data_2 = (msg_len <= `MSG_LENGTH_WIDTH'd2) ? noc2_data[2*64 - 1 -: 64] : noc2_data[4*64 - 1 -: 64];
    noc2decoder_l15_data_3 = (msg_len == `MSG_LENGTH_WIDTH'd1) ? noc2_data[2*64 - 1 -: 64] :
                                    (msg_len == `MSG_LENGTH_WIDTH'd2) ? noc2_data[3*64 - 1 -: 64] : noc2_data[5*64 - 1 -: 64];

    noc2decoder_l15_src_homeid = 0;
    noc2decoder_l15_src_homeid[`PACKET_HOME_ID_Y_MASK] = noc2_data[`MSG_SRC_Y];
    noc2decoder_l15_src_homeid[`PACKET_HOME_ID_X_MASK] = noc2_data[`MSG_SRC_X];
    noc2decoder_l15_src_homeid[`PACKET_HOME_ID_CHIP_MASK] = noc2_data[`MSG_SRC_CHIPID];

    // is_message_new is 1 on a new message, even if it's not valid yet
    // when header ack is received, it becomes 0 until the next "new" message
    // otherwise retain the newness value
    is_message_new_next = l15_noc2decoder_ack ? 1'b1 :
                                 l15_noc2decoder_header_ack ? 1'b0 : is_message_new;
end


// fix timing for dmbr by putting flops on the response
reg dmbr_response_val_next;
reg dmbr_l2_miss_next;
reg [`DMBR_TAG_WIDTH-1:0]dmbr_l2_miss_mshrid_next;
reg dmbr_response_val;
reg dmbr_l2_miss;
reg [`DMBR_TAG_WIDTH-1:0]dmbr_l2_miss_mshrid;

always @ (posedge clk)
begin
    if (!rst_n)
    begin
        dmbr_response_val = 0;
        dmbr_l2_miss = 0;
        dmbr_l2_miss_mshrid = 0;
    end
    else
    begin
        dmbr_response_val = dmbr_response_val_next;
        dmbr_l2_miss = dmbr_l2_miss_next;
        dmbr_l2_miss_mshrid = dmbr_l2_miss_mshrid_next;
    end
end


always @ *
begin
    // dmbr hook
    dmbr_response_val_next = 0;
    dmbr_l2_miss_next = 0;
    dmbr_l2_miss_mshrid_next = 0;
    if (l15_noc2decoder_ack)
    begin
        if (noc2decoder_l15_reqtype == `MSG_TYPE_DATA_ACK)
        begin
            dmbr_response_val_next = 1'b1;
            dmbr_l2_miss_next = noc2decoder_l15_l2miss;
            dmbr_l2_miss_mshrid_next = {1'b0, noc2decoder_l15_threadid, noc2decoder_l15_mshrid};
        end
    end

    l15_dmbr_l2responseIn = dmbr_response_val;
    l15_dmbr_l2missIn = dmbr_l2_miss;
    l15_dmbr_l2missTag = dmbr_l2_miss_mshrid;
end


endmodule
