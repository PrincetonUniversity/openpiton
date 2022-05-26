// Copyright (c) 2020 Princeton University
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

// Filename: noc_simple_splitter.v
// Author: Fei Gao
// Description: Split the noc message to different destination based on the fbits.
//              only has two outputs: to the processor and the other 

`include "define.tmp.h"
`include "network_define.v"

module noc_simple_splitter (
    input                               clk,
    input                               rst_n,

    input                               src_splitter_vr_noc_val,
    input       [`NOC_DATA_WIDTH-1:0]   src_splitter_vr_noc_dat,
    output reg                          src_splitter_vr_noc_rdy,

    output reg                          splitter_dst0_vr_noc_val,
    output      [`NOC_DATA_WIDTH-1:0]   splitter_dst0_vr_noc_dat,
    input                               splitter_dst0_vr_noc_rdy,

    output reg                          splitter_dst1_vr_noc_val,
    output      [`NOC_DATA_WIDTH-1:0]   splitter_dst1_vr_noc_dat,
    input                               splitter_dst1_vr_noc_rdy
);

    localparam IDLE = 2'd0;
    localparam COUNT_TYPE0 = 2'd1;
    localparam COUNT_TYPE1 = 2'd2;
    
    reg [1:0] state_reg;
    reg [1:0] state_next;
    
    reg [`MSG_LENGTH_WIDTH-1:0] count_reg;
    reg [`MSG_LENGTH_WIDTH-1:0] count_next;
    
    always @(posedge clk) begin
        if (~rst_n) begin
            state_reg <= IDLE;
            count_reg <= {`MSG_LENGTH_WIDTH{1'b0}};
        end
        else begin
            state_reg <= state_next;
            if ((state_next >= COUNT_TYPE0) && (state_next <= COUNT_TYPE1)) begin
                count_reg <= count_next;
            end
        end
    end
    
    assign splitter_dst0_vr_noc_dat = src_splitter_vr_noc_dat;
    assign splitter_dst1_vr_noc_dat = src_splitter_vr_noc_dat;
    
    always @* begin
        splitter_dst0_vr_noc_val = 0;    
        splitter_dst1_vr_noc_val = 0;
    
        case (state_reg)
        IDLE: begin
    
            count_next = (src_splitter_vr_noc_val & |src_splitter_vr_noc_dat[`MSG_LENGTH]) ?
                            src_splitter_vr_noc_dat[`MSG_LENGTH] :
                            {`MSG_LENGTH_WIDTH{1'b0}};
            
            splitter_dst0_vr_noc_val = src_splitter_vr_noc_val & (src_splitter_vr_noc_dat[`MSG_DST_FBITS] == `NOC_FBITS_L2);
            splitter_dst1_vr_noc_val = src_splitter_vr_noc_val & (src_splitter_vr_noc_dat[`MSG_DST_FBITS] != `NOC_FBITS_L2); 
    
            src_splitter_vr_noc_rdy =  (splitter_dst0_vr_noc_val & splitter_dst0_vr_noc_rdy) | 
                                    (splitter_dst1_vr_noc_val & splitter_dst1_vr_noc_rdy);
    
            state_next =    (|src_splitter_vr_noc_dat[`MSG_LENGTH] == 0) ? (IDLE) :
                            (splitter_dst0_vr_noc_val & splitter_dst0_vr_noc_rdy) ? (COUNT_TYPE0) :
                            (splitter_dst1_vr_noc_val & splitter_dst1_vr_noc_rdy) ? (COUNT_TYPE1) :
                            (IDLE);
        end

    
        COUNT_TYPE0: begin
            splitter_dst0_vr_noc_val = src_splitter_vr_noc_val;
            src_splitter_vr_noc_rdy = splitter_dst0_vr_noc_rdy;
    
            count_next = (splitter_dst0_vr_noc_val & splitter_dst0_vr_noc_rdy) ? (count_reg - 1'b1) : count_reg;
            state_next = (count_next == {`MSG_LENGTH_WIDTH{1'b0}}) ? IDLE : COUNT_TYPE0;
        end


    
        COUNT_TYPE1: begin
            splitter_dst1_vr_noc_val = src_splitter_vr_noc_val;
            src_splitter_vr_noc_rdy = splitter_dst1_vr_noc_rdy;
    
            count_next = (splitter_dst1_vr_noc_val & splitter_dst1_vr_noc_rdy) ? (count_reg - 1'b1) : count_reg;
            state_next = (count_next == {`MSG_LENGTH_WIDTH{1'b0}}) ? IDLE : COUNT_TYPE1;
        end

    
        default: begin
            count_next = {`MSG_LENGTH_WIDTH{1'b0}};
            src_splitter_vr_noc_rdy = 1'b0;
            state_next = IDLE;
        end
        endcase
    end
    
endmodule
