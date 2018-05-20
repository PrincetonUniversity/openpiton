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

//==================================================================================================
//  Filename      : ciop_iob.v.xlx.v
//  Created On    : 2014-05-09
//  Last Modified : 2015-05-09 23:38:51
//  Revision      :
//  Author        : Alexey Lavrov
//  Company       : Princeton University
//  Email         : alavrov@princeton.edu
//
//  Description   : simple controller for IOB for PITON proto
//
//
//==================================================================================================


module ciop_iob (
    input                               chip_clk,
    input                               fpga_clk,
    input                               rst_n,

    input                               noc_in_val,
    output reg                          noc_in_rdy,
    input [`NOC_DATA_WIDTH-1:0]         noc_in_data,

    output                              noc_out_val,
    input                               noc_out_rdy,
    output [`NOC_DATA_WIDTH-1:0]        noc_out_data
);

parameter OK_IOB_CNT = 5000;   // ? Alexey: taken from simulation


reg     [31:0]          ok_iob_cnt;

wire                     ok_iob;

assign  ok_iob = ok_iob_cnt == OK_IOB_CNT;

always @(posedge chip_clk) begin
    if (~rst_n)
        ok_iob_cnt <= 32'b0;
    else
        ok_iob_cnt <= ok_iob ? ok_iob_cnt : ok_iob_cnt + 1'b1 ;
end


// making wake up packet
parameter FLIT_TO_SEND = 2;

wire [63:0]         iob_buffer_flit1;
wire [63:0]         iob_buffer_flit2;
reg                 iob_buffer_val;
reg  [1:0]          flit_cnt;

assign iob_buffer_flit1     = 64'h0000_0000_0048_4000;
assign iob_buffer_flit2     = 64'h0000_0000_0001_0001;

always @(posedge fpga_clk) begin
    if (~rst_n)
        flit_cnt <= 2'b0;
    else
        flit_cnt <= noc_out_val & noc_out_rdy ? flit_cnt + 1 : flit_cnt; 
end

always @(posedge fpga_clk)
    iob_buffer_val <= ok_iob;

assign noc_out_val = iob_buffer_val & (flit_cnt < FLIT_TO_SEND);

assign noc_out_data = flit_cnt == 2'b0 ? iob_buffer_flit1 : 
                      flit_cnt == 2'b1 ? iob_buffer_flit2 : {`NOC_DATA_WIDTH{1'b0}};

// noc data out is sent on chip_clk



endmodule
