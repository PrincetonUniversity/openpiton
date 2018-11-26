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
//  Filename      : l2_state_wrap.v
//  Created On    : 2014-02-24
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : The wrap module for state array in the L2 cache
//
//
//==================================================================================================

`include "l2.tmp.h"
`include "define.tmp.h"

module l2_state_wrap(


    input wire clk,
    input wire rst_n,
    input wire pipe_rd_sel,
    input wire pipe_wr_sel,
    input wire pdout_en,
    input wire deepsleep,

    input wire rd_en1,
    input wire wr_en1,
    input wire [`L2_STATE_INDEX_WIDTH-1:0] rd_addr1,
    input wire [`L2_STATE_INDEX_WIDTH-1:0] wr_addr1,
    input wire [`L2_STATE_ARRAY_WIDTH-1:0] data_in1,
    input wire [`L2_STATE_ARRAY_WIDTH-1:0] data_mask_in1,

    input wire rd_en2,
    input wire wr_en2,
    input wire [`L2_STATE_INDEX_WIDTH-1:0] rd_addr2,
    input wire [`L2_STATE_INDEX_WIDTH-1:0] wr_addr2,
    input wire [`L2_STATE_ARRAY_WIDTH-1:0] data_in2,
    input wire [`L2_STATE_ARRAY_WIDTH-1:0] data_mask_in2,

    output wire [`L2_STATE_ARRAY_WIDTH-1:0] data_out,
    output wire [`L2_STATE_ARRAY_WIDTH-1:0] pdata_out,

    // sram interface
    output wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] srams_rtap_data,
    input wire  [`BIST_OP_WIDTH-1:0] rtap_srams_bist_command,
    input wire  [`SRAM_WRAPPER_BUS_WIDTH-1:0] rtap_srams_bist_data

);

reg rd_en;
reg wr_en;
reg [`L2_STATE_INDEX_WIDTH-1:0] rd_addr;
reg [`L2_STATE_INDEX_WIDTH-1:0] wr_addr;
reg [`L2_STATE_ARRAY_WIDTH-1:0] data_in;
reg [`L2_STATE_ARRAY_WIDTH-1:0] data_mask_in;

always @ *
begin
    if (pipe_rd_sel)
    begin
        rd_en = rd_en2;
        rd_addr = rd_addr2;
    end
    else
    begin
        rd_en = rd_en1;
        rd_addr = rd_addr1;
    end
end

always @ *
begin
    if (pipe_wr_sel)
    begin
        wr_en = wr_en2;
        wr_addr = wr_addr2;
        data_in = data_in2;
        data_mask_in = data_mask_in2;
     end
    else
    begin
        wr_en = wr_en1;
        wr_addr = wr_addr1;
        data_in = data_in1;
        data_mask_in = data_mask_in1;
    end
end


l2_state l2_state(

    .clk            (clk),
    .rst_n          (rst_n),
    .rd_en          (rd_en),
    .wr_en          (wr_en),
    .pdout_en       (pdout_en),
    .deepsleep      (deepsleep),
    .rd_addr        (rd_addr),
    .wr_addr        (wr_addr),
    .data_in        (data_in),
    .data_mask_in   (data_mask_in),
    .data_out       (data_out),
    .pdata_out      (pdata_out),

    // sram interfaces
    .srams_rtap_data (srams_rtap_data),
    .rtap_srams_bist_command (rtap_srams_bist_command),
    .rtap_srams_bist_data (rtap_srams_bist_data)
);


endmodule
