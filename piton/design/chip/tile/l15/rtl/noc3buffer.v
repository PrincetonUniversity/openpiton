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
//  Filename      : noc3buffer.v
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
module noc3buffer(
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
    input wire l15_noc3encoder_req_was_inval,
    input wire [3:0] l15_noc3encoder_req_fwdack_vector,
    input wire [`PACKET_HOME_ID_WIDTH-1:0] l15_noc3encoder_req_homeid,

    output reg noc3buffer_noc3encoder_req_val,
    output reg [`L15_NOC3_REQTYPE_WIDTH-1:0] noc3buffer_noc3encoder_req_type,
    output reg [63:0] noc3buffer_noc3encoder_req_data_0,
    output reg [63:0] noc3buffer_noc3encoder_req_data_1,
    output reg [`L15_MSHR_ID_WIDTH-1:0] noc3buffer_noc3encoder_req_mshrid,
    output reg [1:0] noc3buffer_noc3encoder_req_sequenceid,
    output reg [`L15_THREADID_MASK] noc3buffer_noc3encoder_req_threadid,
    output reg [39:0] noc3buffer_noc3encoder_req_address,
    output reg noc3buffer_noc3encoder_req_with_data,
    output reg noc3buffer_noc3encoder_req_was_inval,
    output reg [3:0] noc3buffer_noc3encoder_req_fwdack_vector,
    output reg [`PACKET_HOME_ID_WIDTH-1:0] noc3buffer_noc3encoder_req_homeid,


    input wire noc3encoder_noc3buffer_req_ack,
    output reg noc3buffer_l15_req_ack

   );


// reg l15_noc3encoder_req_val_buf;
reg buffer_val;
reg buffer_val_next;
reg new_buffer;
reg [`L15_NOC3_REQTYPE_WIDTH-1:0] l15_noc3encoder_req_type_buf;
reg [63:0] l15_noc3encoder_req_data_0_buf;
reg [63:0] l15_noc3encoder_req_data_1_buf;
reg [`L15_MSHR_ID_WIDTH-1:0] l15_noc3encoder_req_mshrid_buf;
reg [1:0] l15_noc3encoder_req_threadid_buf;
reg [1:0] l15_noc3encoder_req_sequenceid_buf;
reg [39:0] l15_noc3encoder_req_address_buf;
reg l15_noc3encoder_req_with_data_buf;
reg l15_noc3encoder_req_was_inval_buf;
reg [3:0] l15_noc3encoder_req_fwdack_vector_buf;
reg [`PACKET_HOME_ID_WIDTH-1:0] l15_noc3encoder_req_homeid_buf;

always @ (posedge clk)
begin
    if (!rst_n)
    begin
        buffer_val <= 1'b0;
    end
    else
    begin
        buffer_val <= buffer_val_next;
        if (new_buffer)
        begin
            l15_noc3encoder_req_type_buf <= l15_noc3encoder_req_type;
            l15_noc3encoder_req_data_0_buf <= l15_noc3encoder_req_data_0;
            l15_noc3encoder_req_data_1_buf <= l15_noc3encoder_req_data_1;
            l15_noc3encoder_req_mshrid_buf <= l15_noc3encoder_req_mshrid;
            l15_noc3encoder_req_threadid_buf <= l15_noc3encoder_req_threadid;
            l15_noc3encoder_req_sequenceid_buf <= l15_noc3encoder_req_sequenceid;
            l15_noc3encoder_req_address_buf <= l15_noc3encoder_req_address;
            l15_noc3encoder_req_with_data_buf <= l15_noc3encoder_req_with_data;
            l15_noc3encoder_req_was_inval_buf <= l15_noc3encoder_req_was_inval;
            l15_noc3encoder_req_fwdack_vector_buf <= l15_noc3encoder_req_fwdack_vector;
            l15_noc3encoder_req_homeid_buf <= l15_noc3encoder_req_homeid;
        end
    end
end

always @ *
begin
    noc3buffer_noc3encoder_req_val = buffer_val;
    noc3buffer_noc3encoder_req_type = l15_noc3encoder_req_type_buf;
    noc3buffer_noc3encoder_req_data_0 = l15_noc3encoder_req_data_0_buf;
    noc3buffer_noc3encoder_req_data_1 = l15_noc3encoder_req_data_1_buf;
    noc3buffer_noc3encoder_req_mshrid = l15_noc3encoder_req_mshrid_buf;
    noc3buffer_noc3encoder_req_threadid = l15_noc3encoder_req_threadid_buf;
    noc3buffer_noc3encoder_req_sequenceid = l15_noc3encoder_req_sequenceid_buf;
    noc3buffer_noc3encoder_req_address = l15_noc3encoder_req_address_buf;
    noc3buffer_noc3encoder_req_with_data = l15_noc3encoder_req_with_data_buf;
    noc3buffer_noc3encoder_req_was_inval = l15_noc3encoder_req_was_inval_buf;
    noc3buffer_noc3encoder_req_fwdack_vector = l15_noc3encoder_req_fwdack_vector_buf;
    noc3buffer_noc3encoder_req_homeid = l15_noc3encoder_req_homeid_buf;
end

// val/ack logic

// buffer_l15_ack is 1 only when req is valid, and buffer_val is 0 or noc3encoder_ack is 1
// ie buffer_l15_ack = l15_req && (!buffer_val || noc3encoder_ack);
// case 1: buffer not valid, accepting new req
// case 2: buffer is valid, but accepting new req because noc3 is done with current buffer

// logic for accepting new req: buffer_l15_ack

// buffer_val_next
// = 1 when buffer_l15_ack
// else = 0 when noc3encoder_ack
// else = buffer_val

always @ *
begin
    noc3buffer_l15_req_ack = 1'b0;
    if (l15_noc3encoder_req_val && (!buffer_val || noc3encoder_noc3buffer_req_ack))
        noc3buffer_l15_req_ack = 1'b1;

    new_buffer = noc3buffer_l15_req_ack;

    buffer_val_next = 1'b0;
    if (noc3buffer_l15_req_ack)
        buffer_val_next = 1'b1;
    else if (noc3encoder_noc3buffer_req_ack)
        buffer_val_next = 1'b0;
    else
        buffer_val_next = buffer_val;
end

endmodule
