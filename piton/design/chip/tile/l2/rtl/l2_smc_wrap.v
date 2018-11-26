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
//  Filename      : l2_smc_wrap.v
//  Created On    : 2014-06-19
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : The wrap module for smc in the L2 cache
//
//
//==================================================================================================

`include "l2.tmp.h"
`include "define.tmp.h"

module l2_smc_wrap(

    input wire clk,
    input wire rst_n,
    input wire pipe_sel,
    input wire rd_en,
    input wire rd_diag_en,
    input wire flush_en,
    input wire [`L2_ADDR_OP_WIDTH-1:0] addr_op,
    input wire [`L2_SMC_ADDR_WIDTH-1:0] rd_addr_in,

    input wire wr_en1,
    input wire [`L2_SMC_ADDR_WIDTH-1:0] wr_addr_in1,
    input wire [`L2_SMC_DATA_IN_WIDTH-1:0] data_in1,
    input wire wr_diag_en1,

    input wire wr_en2,
    input wire [`L2_SMC_ADDR_WIDTH-1:0] wr_addr_in2,
    input wire [`L2_SMC_DATA_IN_WIDTH-1:0] data_in2,
    input wire wr_diag_en2,

    output wire hit,
    output wire [`L2_SMC_DATA_OUT_WIDTH-1:0] data_out,
    output wire [`L2_SMC_VALID_WIDTH-1:0] valid_out,
    output wire [`L2_SMC_TAG_WIDTH-1:0] tag_out
);


reg wr_en;
reg [`L2_SMC_ADDR_WIDTH-1:0] wr_addr_in;
reg [`L2_SMC_DATA_IN_WIDTH-1:0] data_in;
reg wr_diag_en;

always @ *
begin
    if (pipe_sel)
    begin
        wr_en = wr_en2;
        wr_addr_in = wr_addr_in2;
        data_in = data_in2;
        wr_diag_en = wr_diag_en2;
    end
    else
    begin
        wr_en = wr_en1;
        wr_addr_in = wr_addr_in1;
        data_in = data_in1;
        wr_diag_en = wr_diag_en1;
    end
end

l2_smc l2_smc(
    .clk            (clk),
    .rst_n          (rst_n),
    .rd_en          (rd_en),
    .wr_en          (wr_en),
    .rd_diag_en     (rd_diag_en),
    .wr_diag_en     (wr_diag_en),
    .flush_en       (flush_en),
    .addr_op        (addr_op),
    .rd_addr_in     (rd_addr_in),
    .wr_addr_in     (wr_addr_in),
    .data_in        (data_in),
    .hit            (hit),
    .data_out       (data_out),
    .valid_out      (valid_out),
    .tag_out        (tag_out)
);


endmodule
