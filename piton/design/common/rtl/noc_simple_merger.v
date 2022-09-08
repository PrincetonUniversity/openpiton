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

// Filename: noc_simple_merger.v
// Author: Fei Gao  
// Description: Merge two noc traffic. src0 has the higher prior. 

`include "define.tmp.h"
`include "network_define.v"

module noc_simple_merger (   
    input                               clk,
    input                               rst_n,

    input                               src0_merger_vr_noc_val,   // Highest priority
    input       [`NOC_DATA_WIDTH-1:0]   src0_merger_vr_noc_dat,
    output reg                          src0_merger_vr_noc_rdy,

    input                               src1_merger_vr_noc_val,
    input       [`NOC_DATA_WIDTH-1:0]   src1_merger_vr_noc_dat,
    output reg                          src1_merger_vr_noc_rdy,

    output reg                          merger_dst_vr_noc_val,   
    output reg  [`NOC_DATA_WIDTH-1:0]   merger_dst_vr_noc_dat,
    input                               merger_dst_vr_noc_rdy
);

    localparam IDLE = 2'd0;
    localparam COUNT_PRIO0 = 2'd1;
    localparam COUNT_PRIO1 = 2'd2;
    localparam NONE = 2'd3; 
    
    reg [1:0] state_reg;
    reg [1:0] state_next;
    
    reg [`MSG_LENGTH_WIDTH-1:0] count_reg;
    reg [`MSG_LENGTH_WIDTH-1:0] count_next;

    wire [1:0] sel_src_id;
    wire [`NOC_DATA_WIDTH-1:0] merger_dst_vr_noc_dat_header;
    
    always @(posedge clk) begin
        if (~rst_n) begin
            state_reg <= IDLE;
            count_reg <= {`MSG_LENGTH_WIDTH{1'b0}};
        end
        else begin
            state_reg <= state_next;
            if ((state_next != IDLE)) begin
                count_reg <= count_next;
            end
        end
    end
    
    assign sel_src_id = src0_merger_vr_noc_val ? 2'd0 :
                        src1_merger_vr_noc_val ? 2'd1 : NONE;
    
    assign merger_dst_vr_noc_dat_header = (sel_src_id == 2'd0) ? src0_merger_vr_noc_dat :
                                       (sel_src_id == 2'd1) ? src1_merger_vr_noc_dat : {`NOC_DATA_WIDTH{1'b0}};
    
    always @* begin
        src0_merger_vr_noc_rdy = 0; 
        src1_merger_vr_noc_rdy = 0; 

        case (state_reg)
        IDLE: begin
    
            count_next =    merger_dst_vr_noc_dat_header[`MSG_LENGTH];
    
            merger_dst_vr_noc_val = (sel_src_id != NONE);
            merger_dst_vr_noc_dat = merger_dst_vr_noc_dat_header;
    
            src0_merger_vr_noc_rdy = (sel_src_id == 2'd0) & merger_dst_vr_noc_rdy;
            src1_merger_vr_noc_rdy = (sel_src_id == 2'd1) & merger_dst_vr_noc_rdy;
    
            state_next = (merger_dst_vr_noc_dat_header[`MSG_LENGTH] == {`MSG_LENGTH_WIDTH{1'b0}}) ? IDLE :
                         src0_merger_vr_noc_rdy ? COUNT_PRIO0 :
                         src1_merger_vr_noc_rdy ? COUNT_PRIO1 : IDLE;
        end

    
        COUNT_PRIO0: begin
            src0_merger_vr_noc_rdy = merger_dst_vr_noc_rdy;
            merger_dst_vr_noc_val = src0_merger_vr_noc_val;
            merger_dst_vr_noc_dat = src0_merger_vr_noc_dat;
            
            count_next = (src0_merger_vr_noc_val & src0_merger_vr_noc_rdy) ? (count_reg - 1'b1) : count_reg;
            state_next = (count_next == {`MSG_LENGTH_WIDTH{1'b0}}) ? IDLE : COUNT_PRIO0;
        end


    
        COUNT_PRIO1: begin
            src1_merger_vr_noc_rdy = merger_dst_vr_noc_rdy;
            merger_dst_vr_noc_val = src1_merger_vr_noc_val;
            merger_dst_vr_noc_dat = src1_merger_vr_noc_dat;
            
            count_next = (src1_merger_vr_noc_val & src1_merger_vr_noc_rdy) ? (count_reg - 1'b1) : count_reg;
            state_next = (count_next == {`MSG_LENGTH_WIDTH{1'b0}}) ? IDLE : COUNT_PRIO1;
        end


    

        default: begin
            count_next = {`MSG_LENGTH_WIDTH{1'b0}};
    
            merger_dst_vr_noc_val = 1'b0;
            merger_dst_vr_noc_dat = {`NOC_DATA_WIDTH{1'b0}};
    
            state_next = IDLE;
        end
        endcase
    end

endmodule
