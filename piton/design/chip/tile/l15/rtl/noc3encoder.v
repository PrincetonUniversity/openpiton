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
//  Filename      : noc3encoder.v
//  Created On    : 2014-02-05 20:06:27
//  Revision      :
//  Author        : Tri Nguyen
//  Company       : Princeton University
//  Email         : trin@princeton.edu
//
//  Description   :
//
//
//==================================================================================================
`include "l15.tmp.h"
`include "define.tmp.h"

`ifdef DEFAULT_NETTYPE_NONE
`default_nettype none // DEFAULT_NETTYPE_NONE
`endif
module noc3encoder(
    input wire clk,
    input wire rst_n,

    input wire l15_noc3encoder_req_val,
    input wire [`L15_NOC3_REQTYPE_WIDTH-1:0] l15_noc3encoder_req_type,
    input wire [63:0] l15_noc3encoder_req_data_0,
    input wire [63:0] l15_noc3encoder_req_data_1,
    input wire [`L15_MSHR_ID_WIDTH-1:0] l15_noc3encoder_req_mshrid,
    input wire [`L15_THREADID_MASK] l15_noc3encoder_req_threadid,
    input wire [1:0] l15_noc3encoder_req_sequenceid,
    input wire [39:0] l15_noc3encoder_req_address,
    input wire l15_noc3encoder_req_with_data,
    // input wire l15_noc3encoder_req_fwdack_hit,
    input wire l15_noc3encoder_req_was_inval,
    input wire [3:0] l15_noc3encoder_req_fwdack_vector,
    input wire [`PACKET_HOME_ID_WIDTH-1:0] l15_noc3encoder_req_homeid,
    input wire [`NOC_CHIPID_WIDTH-1:0] chipid,
    input wire [`NOC_X_WIDTH-1:0] coreid_x,
    input wire [`NOC_Y_WIDTH-1:0] coreid_y,

    input wire noc3out_ready,

    output reg noc3encoder_l15_req_ack,

    output reg noc3encoder_noc3out_val,
    output reg [63:0] noc3encoder_noc3out_data
   );


reg [63:0] flit;
reg [`NOC3_FLIT_STATE_WIDTH-1:0] flit_state;
reg [`NOC3_FLIT_STATE_WIDTH-1:0] flit_state_next;

reg [`PHY_ADDR_WIDTH-1:0] address;
reg [`NOC_X_WIDTH-1:0] dest_l2_xpos;
reg [`NOC_Y_WIDTH-1:0] dest_l2_ypos;
reg [`NOC_CHIPID_WIDTH-1:0] dest_chipid;
reg [`NOC_FBITS_WIDTH-1:0] dest_fbits;
reg [`NOC_X_WIDTH-1:0] src_l2_xpos;
reg [`NOC_Y_WIDTH-1:0] src_l2_ypos;
reg [`NOC_CHIPID_WIDTH-1:0] src_chipid;
reg [`NOC_FBITS_WIDTH-1:0] src_fbits;
reg [`MSG_LENGTH_WIDTH-1:0] msg_length;
reg [`MSG_TYPE_WIDTH-1:0] msg_type;
reg [`MSG_MSHRID_WIDTH-1:0] msg_mshrid;
reg [`MSG_MESI_BITS-1:0] msg_mesi;
// reg [`MSG_SUBLINE_ID_WIDTH-1:0] msg_subline_id;
reg [`MSG_LAST_SUBLINE_WIDTH-1:0] msg_last_subline;
reg [`MSG_OPTIONS_1] msg_options_1;
reg [`MSG_OPTIONS_2_] msg_options_2;
reg [`MSG_OPTIONS_3_] msg_options_3;
reg [`MSG_OPTIONS_4] msg_options_4;
reg [`MSG_CACHE_TYPE_WIDTH-1:0] msg_cache_type;
reg [`MSG_SUBLINE_VECTOR_WIDTH-1:0] msg_subline_vector;
reg [`MSG_DATA_SIZE_WIDTH-1:0] msg_data_size;

reg sending;
reg is_request;
reg is_response;
// reg msg_last_subline;
reg [1:0] last_subcacheline_id;


// 9/24/14: add buffer between dcache and output
reg [63:0] l15_noc3encoder_req_data_0_f;
// reg [63:0] l15_noc3encoder_req_data_1_f;
always @ (posedge clk)
begin
    if (!rst_n)
    begin
        l15_noc3encoder_req_data_0_f <= 0;
        // l15_noc3encoder_req_data_1_f <= 0;
    end
    else
    begin
        if (l15_noc3encoder_req_val && is_request && flit_state_next == `NOC3_REQ_DATA_1)
            l15_noc3encoder_req_data_0_f <= l15_noc3encoder_req_data_0;
        else if (l15_noc3encoder_req_val && is_request && flit_state_next == `NOC3_REQ_DATA_2)
            l15_noc3encoder_req_data_0_f <= l15_noc3encoder_req_data_1;
        else if (l15_noc3encoder_req_val && is_response && flit_state_next == `NOC3_RES_DATA_1)
            l15_noc3encoder_req_data_0_f <= l15_noc3encoder_req_data_0;
        else if (l15_noc3encoder_req_val && is_response && flit_state_next == `NOC3_RES_DATA_2)
            l15_noc3encoder_req_data_0_f <= l15_noc3encoder_req_data_1;
    end
end

always @ (posedge clk)
begin
    if (!rst_n)
    begin
        flit_state <= 0;
    end
    else
    begin
        flit_state <= flit_state_next;
    end
end

always @ *
begin
    is_request = (l15_noc3encoder_req_type == `L15_NOC3_REQTYPE_WRITEBACK);
    is_response = !is_request;

    last_subcacheline_id =  (l15_noc3encoder_req_fwdack_vector[3] == 1'b1) ? 2'b11 :
                            (l15_noc3encoder_req_fwdack_vector[2] == 1'b1) ? 2'b10 :
                            (l15_noc3encoder_req_fwdack_vector[1] == 1'b1) ? 2'b01 :
                                                                             2'b00 ;
    msg_last_subline = last_subcacheline_id == l15_noc3encoder_req_sequenceid;

    address = l15_noc3encoder_req_address;

    // old non-csm implementation
    // if (`HOME_ID_MASK_X_ENABLE)
    //     dest_l2_xpos = l15_noc3encoder_req_address[`HOME_ID_MASK_X];
    // else
    //     dest_l2_xpos = 0;
    // if (`HOME_ID_MASK_Y_ENABLE)
    //     dest_l2_ypos = l15_noc3encoder_req_address[`HOME_ID_MASK_Y];
    // else
    //     dest_l2_ypos = 0;
    // dest_chipid = 0;

    dest_l2_xpos = l15_noc3encoder_req_homeid[`PACKET_HOME_ID_X_MASK];
    dest_l2_ypos = l15_noc3encoder_req_homeid[`PACKET_HOME_ID_Y_MASK];
    dest_chipid = l15_noc3encoder_req_homeid[`PACKET_HOME_ID_CHIP_MASK];
    dest_fbits = `NOC_FBITS_L2;

    src_l2_xpos = coreid_x;
    src_l2_ypos = coreid_y;
    src_chipid = chipid;
    src_fbits = `NOC_FBITS_L1;

    msg_length = 0;
    msg_type = 0;
    msg_mshrid = {l15_noc3encoder_req_threadid, l15_noc3encoder_req_mshrid};
    msg_mesi = 0;
    // msg_l2_miss = 0;
    // msg_subline_id = 0;
    msg_cache_type = 0;
    msg_subline_vector = 0; // always 0 for requests
    msg_data_size = 0;

    sending = l15_noc3encoder_req_val;
    noc3encoder_noc3out_val = sending;

    case (l15_noc3encoder_req_type)
        `L15_NOC3_REQTYPE_WRITEBACK:
        begin
            // specify address (should be specified by default)
            msg_type = `MSG_TYPE_WB_REQ;
            msg_length = 4; // 2 extra req headers + 2 data (128b)
            // msg_cache_type = `MSG_CACHE_TYPE_DATA;
        end
        `L15_NOC3_REQTYPE_DOWNGRADE_ACK:
        begin
            msg_type = `MSG_TYPE_LOAD_FWDACK;
            if (l15_noc3encoder_req_with_data)
            begin
                msg_length = 2;
                msg_data_size = `MSG_DATA_SIZE_32B;
            end
            else
                msg_length = 0;
        end
        `L15_NOC3_REQTYPE_INVAL_ACK:
        begin
            // specify sequence id + if is last
            if (l15_noc3encoder_req_was_inval)
               msg_type = `MSG_TYPE_INV_FWDACK;
            else
               msg_type = `MSG_TYPE_STORE_FWDACK;
           
            if (l15_noc3encoder_req_with_data)
            begin
                msg_length = 2;
                msg_data_size = `MSG_DATA_SIZE_32B;
            end
            else
                msg_length = 0;
        end
        `L15_NOC3_REQTYPE_ICACHE_INVAL_ACK:
        begin
            // specify sequence id + if is last
            msg_type = `MSG_TYPE_INV_FWDACK;
            msg_length = 0;
        end
    endcase

    msg_options_1 = 0;
    msg_options_2 = 0;
    msg_options_3 = 0;
    msg_options_4 = 0;

    // trin: line coverage: 16B transaction apparently does not happen with the T1 core
    msg_options_2[`MSG_DATA_SIZE_] = msg_data_size;
    msg_options_2[`MSG_CACHE_TYPE_] = msg_cache_type;
    msg_options_2[`MSG_SUBLINE_VECTOR_] = msg_subline_vector;

    msg_options_4[`MSG_LAST_SUBLINE] = msg_last_subline || (l15_noc3encoder_req_type == `L15_NOC3_REQTYPE_ICACHE_INVAL_ACK);
    msg_options_4[`MSG_SUBLINE_ID] = l15_noc3encoder_req_sequenceid;
    // does not need to specify cache line state
    // no l2miss


    // flit filling logic
    flit[`NOC_DATA_WIDTH-1:0] = 0; // so that the flit is not a latch
    if (is_request)
    begin
        if (flit_state == `NOC3_REQ_HEADER_1)
        begin
            flit[`MSG_DST_CHIPID] = dest_chipid;
            flit[`MSG_DST_X] = dest_l2_xpos;
            flit[`MSG_DST_Y] = dest_l2_ypos;
            flit[`MSG_DST_FBITS] = dest_fbits;
            flit[`MSG_LENGTH] = msg_length;
            flit[`MSG_TYPE] = msg_type;
            flit[`MSG_MSHRID] = msg_mshrid;
            flit[`MSG_OPTIONS_1] = msg_options_1;
        end
        else if (flit_state == `NOC3_REQ_HEADER_2)
        begin
            flit[`MSG_ADDR_] = address;
            flit[`MSG_OPTIONS_2_] = msg_options_2;
        end
        else if (flit_state == `NOC3_REQ_HEADER_3)
        begin
            flit[`MSG_SRC_CHIPID_] = src_chipid;
            flit[`MSG_SRC_X_] = src_l2_xpos;
            flit[`MSG_SRC_Y_] = src_l2_ypos;
            flit[`MSG_SRC_FBITS_] = src_fbits;
            flit[`MSG_OPTIONS_3_] = msg_options_3;
        end
        else if (flit_state == `NOC3_REQ_DATA_1)
        begin
            flit[`NOC_DATA_WIDTH-1:0] = l15_noc3encoder_req_data_0_f;
        end
        else if (flit_state == `NOC3_REQ_DATA_2)
        begin
            flit[`NOC_DATA_WIDTH-1:0] = l15_noc3encoder_req_data_0_f;
        end
    end
    else if (is_response)
    begin
        if (flit_state == `NOC3_RES_HEADER_1)
        begin
            flit[`MSG_DST_CHIPID] = dest_chipid;
            flit[`MSG_DST_X] = dest_l2_xpos;
            flit[`MSG_DST_Y] = dest_l2_ypos;
            flit[`MSG_DST_FBITS] = dest_fbits;
            flit[`MSG_LENGTH] = msg_length;
            flit[`MSG_TYPE] = msg_type;
            flit[`MSG_MSHRID] = msg_mshrid;
            flit[`MSG_OPTIONS_4] = msg_options_4;
        end
        else if (flit_state == `NOC3_RES_DATA_1)
        begin
            flit[`NOC_DATA_WIDTH-1:0] = l15_noc3encoder_req_data_0_f;
        end
        else if (flit_state == `NOC3_RES_DATA_2)
        begin
            flit[`NOC_DATA_WIDTH-1:0] = l15_noc3encoder_req_data_0_f;
        end
    end

    noc3encoder_noc3out_data = flit;

    // next flit state logic
    flit_state_next = flit_state;
    if (sending)
    begin
        if (is_request || is_response)
            if (noc3out_ready)
            begin
                if (flit_state != msg_length)
                    flit_state_next = flit_state + 1;
                else
                    flit_state_next = `NOC1_REQ_HEADER_1;
            end
            else
                flit_state_next = flit_state;
    end
    else
        flit_state_next = `NOC1_REQ_HEADER_1;

    // ack logic to L2
    if (l15_noc3encoder_req_val && flit_state == msg_length && noc3out_ready)
        noc3encoder_l15_req_ack = 1'b1;
    else
        noc3encoder_l15_req_ack = 1'b0;
end
endmodule
