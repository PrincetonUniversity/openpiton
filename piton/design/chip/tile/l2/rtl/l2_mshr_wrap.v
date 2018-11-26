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
//  Filename      : l2_mshr_wrap.v
//  Created On    : 2014-02-24
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : The wrap module for MSHRs in the L2 cache
//
//
//==================================================================================================


`include "l2.tmp.h"
`include "define.tmp.h"

module l2_mshr_wrap(

    input wire clk,
    input wire rst_n,
    input wire pipe_rd_sel,
    input wire pipe_wr_sel,

    input wire rd_en1,
    input wire cam_en1,
    input wire wr_state_en1,
    input wire wr_data_en1,
    input wire pending_ready1,
    input wire [`L2_MSHR_STATE_BITS-1:0] state_in1,
    input wire [`L2_MSHR_ARRAY_WIDTH-1:0] data_in1,
    input wire [`L2_MSHR_ARRAY_WIDTH-1:0] data_mask_in1,
    input wire [`L2_MSHR_INDEX_WIDTH-1:0] rd_index_in1,
    input wire [`L2_MSHR_INDEX_WIDTH-1:0] inv_counter_rd_index_in1,
    input wire [`L2_MSHR_INDEX_WIDTH-1:0] wr_index_in1,
    input wire [`L2_MSHR_ADDR_IN_WIDTH-1:0] addr_in1,

    input wire rd_en2,
    input wire cam_en2,
    input wire wr_state_en2,
    input wire wr_data_en2,
    input wire pending_ready2,
    input wire inc_counter_en2,
    input wire [`L2_MSHR_STATE_BITS-1:0] state_in2,
    input wire [`L2_MSHR_ARRAY_WIDTH-1:0] data_in2,
    input wire [`L2_MSHR_ARRAY_WIDTH-1:0] data_mask_in2,
    input wire [`L2_MSHR_INDEX_WIDTH-1:0] rd_index_in2,
    input wire [`L2_MSHR_INDEX_WIDTH-1:0] wr_index_in2,
    input wire [`L2_MSHR_ADDR_IN_WIDTH-1:0] addr_in2,

    output wire hit,
    output wire [`L2_MSHR_INDEX_WIDTH-1:0] hit_index,
    output wire [`L2_MSHR_STATE_BITS-1:0] state_out,
    output wire [`L2_MSHR_ARRAY_WIDTH-1:0] data_out,
    output wire [`L2_OWNER_BITS-1:0] inv_counter_out,
    output wire [`L2_MSHR_INDEX_WIDTH:0] empty_slots,
    output wire pending,
    output wire [`L2_MSHR_INDEX_WIDTH-1:0] pending_index,
    output wire [`L2_MSHR_INDEX_WIDTH-1:0] empty_index
);

reg rd_en;
reg cam_en;
reg wr_state_en;
reg wr_data_en;
reg pending_ready;
reg [`L2_MSHR_STATE_BITS-1:0] state_in;
reg [`L2_MSHR_ARRAY_WIDTH-1:0] data_in;
reg [`L2_MSHR_ARRAY_WIDTH-1:0] data_mask_in;
reg [`L2_MSHR_INDEX_WIDTH-1:0] rd_index_in;
reg [`L2_MSHR_INDEX_WIDTH-1:0] wr_index_in;
reg [`L2_MSHR_ADDR_IN_WIDTH-1:0] addr_in;


always @ *
begin
    if (pipe_rd_sel)
    begin
        rd_en = rd_en2;
        cam_en = cam_en2;
        pending_ready = pending_ready2;
        rd_index_in = rd_index_in2;
        addr_in = addr_in2;
    end
    else
    begin
        rd_en = rd_en1;
        cam_en = cam_en1;
        pending_ready = pending_ready1;
        rd_index_in = rd_index_in1;
        addr_in = addr_in1;
    end
end

always @ *
begin
    if (pipe_wr_sel)
    begin
        wr_state_en = wr_state_en2;
        wr_data_en = wr_data_en2;
        state_in = state_in2;
        data_in = data_in2;
        data_mask_in = data_mask_in2;
        wr_index_in = wr_index_in2;
    end
    else
    begin
        wr_state_en = wr_state_en1;
        wr_data_en = wr_data_en1;
        state_in = state_in1;
        data_in = data_in1;
        data_mask_in = data_mask_in1;
        wr_index_in = wr_index_in1;
    end
end


l2_mshr l2_mshr(
    .clk                        (clk),
    .rst_n                      (rst_n),
    .rd_en                      (rd_en),
    .cam_en                     (cam_en),
    .wr_state_en                (wr_state_en),
    .wr_data_en                 (wr_data_en),
    .pending_ready              (pending_ready),
    .inc_counter_en             (inc_counter_en2),
    .state_in                   (state_in),
    .data_in                    (data_in),
    .data_mask_in               (data_mask_in),
    .rd_index_in                (rd_index_in),
    .inv_counter_rd_index_in    (inv_counter_rd_index_in1),
    .wr_index_in                (wr_index_in),
    .addr_in                    (addr_in),
    .hit                        (hit),
    .hit_index                  (hit_index),
    .state_out                  (state_out),
    .data_out                   (data_out),
    .inv_counter_out            (inv_counter_out),
    .empty_slots                (empty_slots),
    .pending                    (pending),
    .pending_index              (pending_index),
    .empty_index                (empty_index)
);


endmodule
