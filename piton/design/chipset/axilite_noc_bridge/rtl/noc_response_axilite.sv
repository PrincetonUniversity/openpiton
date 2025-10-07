// Copyright (c) 2019 multiple authors
// All rights reserved.

// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the authors nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.

// THIS SOFTWARE IS PROVIDED BY THE AUTHORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


`include "define.tmp.h"

module noc_response_axi_decoder (
    input logic [5:0] current_flit_info,
    output logic last_write_flit,
    output logic last_read_transfer, 
    output logic read_size,  
    output logic read_word_select, 
    output logic [1:0] flit_type
);

always_comb begin 
    last_write_flit = current_flit_info[5];
    last_read_transfer = current_flit_info[4];
    read_size = current_flit_info[3];
    read_word_select = current_flit_info[2];
    flit_type = current_flit_info[1:0];
end 

endmodule 
module noc_response_axilite #(
    parameter AXILITE_DATA_WIDTH  = 64,
  `ifndef ARA_REQ2MEM
    parameter MSG_TYPE_INVAL       = 2'd0, // Invalid Message
    parameter MSG_TYPE_LOAD        = 2'd1,// Load Request
    parameter MSG_TYPE_STORE       = 2'd2, // Store Request
  `endif
    parameter AXI_RESP_WIDTH  = 2
) (
    // Clock + Reset
    input  logic                                   clk,
    input  logic                                   rst_n,

    //NoC channel output 
    input  logic                                   noc_valid_in,
    input  logic [`NOC_DATA_WIDTH-1:0]             noc_data_in,
    output logic                                   noc_ready_out,

    //Signal to indicate current transaction type 
  `ifndef ARA_REQ2MEM
    input  logic [5:0]                             transaction_type_wr_data, 
    input  logic                                   transaction_type_wr,
  `endif

    // AXI Read Data Channel Signals
    output logic [AXILITE_DATA_WIDTH-1:0]              m_axi_rdata,
    output logic [AXI_RESP_WIDTH-1:0]              m_axi_rresp,
    output logic                                   m_axi_rvalid,
    input  logic                                   m_axi_rready,

    // AXI Write Response Channel Signals
    output logic [AXI_RESP_WIDTH-1:0]              m_axi_bresp,
    output logic                                   m_axi_bvalid,
    input  logic                                   m_axi_bready
);

localparam LAST_TRANSFER_FLAG_WIDTH = 1; 

typedef enum logic [2:0] {
    NOC_IN_STATE_HEADER          = 2'b00, // Header 0
    NOC_IN_STATE_READ_DATA       = 2'b01, // Data Lines
    NOC_IN_STATE_STORE_ACK       = 2'b10  // for the fifo read when store happens
} noc_in_state;

noc_in_state noc_in_state_f, noc_in_state_next;

// input flit information 
logic noc_io_go;
logic L2_request_ack; 

// read data fifo signal 
logic                                rdata_fifo_ren;
logic                                rdata_fifo_full;
logic                                rdata_fifo_empty;
logic [(AXILITE_DATA_WIDTH + LAST_TRANSFER_FLAG_WIDTH - 1):0]             rdata_fifo_rdata;

logic                                rdata_fifo_wval;
logic [(AXILITE_DATA_WIDTH + LAST_TRANSFER_FLAG_WIDTH - 1):0]             rdata_fifo_wdata;  
logic [AXILITE_DATA_WIDTH-1:0]           rdata_fifo_data;      
logic [LAST_TRANSFER_FLAG_WIDTH - 1 :0] valid_last_read_transfer;    

// input flit counter and length 
logic [`MSG_LENGTH_WIDTH - 1:0] noc_in_count_f; 
logic [`MSG_LENGTH_WIDTH - 1:0] noc_in_payload_len_f;
logic [`MSG_LENGTH_WIDTH - 1:0] noc_in_count_next; 
logic [`MSG_LENGTH_WIDTH - 1:0] noc_in_payload_len_next;

logic fifo_rst;

//decoder output 
logic last_write_flit;
logic last_read_transfer; // if current transfer is last one in transaction 
logic read_size; // 0 -> 8B, 1 -> 16B 
logic read_word_select; // if 8B, which word will be choose 
logic [1:0] flit_type;

logic [5:0] transaction_type_rd_data; 
logic transaction_type_rd; 
logic transaction_fifo_empty;
logic transaction_fifo_full; 

// fifo of storing flit status, for dealing with the input flit in order 
sync_fifo #(
    .DSIZE(6),
    .ASIZE(5),
    .MEMSIZE(16) // should be 2 ^ (ASIZE-1)
) type_fifo (
    .rdata(transaction_type_rd_data),
    .empty(transaction_fifo_empty),
    .clk(clk),
    .ren(transaction_type_rd),
    .wdata(transaction_type_wr_data),
    .full(transaction_fifo_full),
    .wval(transaction_type_wr),
    .reset(fifo_rst)
);

// decoder for indicate flit status (is input flit last transfer (beat) in current AXI trasanction, is the input flit valid data 16B or 8B, etc) 
noc_response_axi_decoder noc_response_axi_decoder (
    .current_flit_info (transaction_type_rd_data),
    .last_write_flit(last_write_flit), 
    .last_read_transfer(last_read_transfer),
    .read_size(read_size), 
    .read_word_select(read_word_select), 
    .flit_type(flit_type)
);

/* fifo for read data */
sync_fifo #(
	.DSIZE(AXILITE_DATA_WIDTH + LAST_TRANSFER_FLAG_WIDTH),
	.ASIZE(5),
	.MEMSIZE(16)  
) rdata_fifo (
	.rdata(rdata_fifo_rdata),
	.empty(rdata_fifo_empty),
	.clk(clk),
	.ren(rdata_fifo_ren),
	.wdata(rdata_fifo_wdata),
	.full(rdata_fifo_full),
	.wval(rdata_fifo_wval),
	.reset(fifo_rst)
);

assign fifo_rst = !rst_n;

always_comb begin 
    if (!transaction_fifo_empty)
        transaction_type_rd = ((noc_in_state_f == NOC_IN_STATE_READ_DATA) || (noc_in_state_f == NOC_IN_STATE_STORE_ACK)) && (noc_io_go && (noc_in_count_f == noc_in_payload_len_f - 1));
    else 
        transaction_type_rd = 0;
end

always_comb begin 
    // valid_last_read_transfer = last_read_flit_16B ? (noc_in_count_f == 1) && (noc_in_state_f == NOC_IN_STATE_READ_DATA): 
    //                             last_read_flit_8B_first ? (noc_in_count_f == 0) && (noc_in_state_f == NOC_IN_STATE_READ_DATA):
    //                             last_read_flit_8B_second ? (noc_in_count_f == 1) && (noc_in_state_f == NOC_IN_STATE_READ_DATA):
    //                             0;
    valid_last_read_transfer = (~last_read_transfer) ? 0 : 
                                read_size ? (noc_in_count_f == 1) && (noc_in_state_f == NOC_IN_STATE_READ_DATA) :
                                read_word_select ? (noc_in_count_f == 1) && (noc_in_state_f == NOC_IN_STATE_READ_DATA) :
                                (noc_in_count_f == 0) && (noc_in_state_f == NOC_IN_STATE_READ_DATA); 
end 

always_comb begin 
    rdata_fifo_wdata = {valid_last_read_transfer, {noc_data_in[7:0], noc_data_in[15:8], noc_data_in[23:16], noc_data_in[31:24], 
    noc_data_in[39:32], noc_data_in[47:40], noc_data_in[55:48], noc_data_in[63:56]}};
    // rdata_fifo_wval = last_read_flit_16B ? (noc_in_count_f >= 0) && (noc_in_state_f == NOC_IN_STATE_READ_DATA) && noc_io_go: 
    //                     last_read_flit_8B_first ? (noc_in_count_f == 0) && (noc_in_state_f == NOC_IN_STATE_READ_DATA) && noc_io_go:
    //                     last_read_flit_8B_second ? (noc_in_count_f == 1) && (noc_in_state_f == NOC_IN_STATE_READ_DATA) && noc_io_go:
    //                     0;
    rdata_fifo_wval = read_size ? (noc_in_count_f >= 0) && (noc_in_state_f == NOC_IN_STATE_READ_DATA) && noc_io_go : 
                        read_word_select ? (noc_in_count_f == 1) && (noc_in_state_f == NOC_IN_STATE_READ_DATA) && noc_io_go :
                        (noc_in_count_f == 0) && (noc_in_state_f == NOC_IN_STATE_READ_DATA) && noc_io_go;
end 

always_comb begin 
    rdata_fifo_ren = m_axi_rvalid && m_axi_rready;
end 

//state register 
always_ff@(posedge clk or negedge rst_n) begin 
    if (!rst_n) noc_in_state_f <= NOC_IN_STATE_HEADER;
    else noc_in_state_f <= noc_in_state_next;
end 

assign noc_io_go = noc_valid_in && noc_ready_out;
assign L2_request_ack = (noc_in_state_f == NOC_IN_STATE_HEADER) && (noc_data_in[`MSG_TYPE] == `MSG_TYPE_DATA_ACK);

//state transition
always_comb begin 
    unique case (noc_in_state_f)
        NOC_IN_STATE_HEADER: begin 
            if (noc_io_go && (L2_request_ack)) begin 
                if ((flit_type == MSG_TYPE_STORE) && ~transaction_fifo_empty) begin 
                    noc_in_state_next = NOC_IN_STATE_STORE_ACK;
                end 
                else if ((flit_type == MSG_TYPE_LOAD) && ~transaction_fifo_empty) begin
                    noc_in_state_next = NOC_IN_STATE_READ_DATA;
                end 
                else noc_in_state_next = NOC_IN_STATE_HEADER;
            end 
            else noc_in_state_next = noc_in_state_f;
        end 

        NOC_IN_STATE_READ_DATA: begin 
            if (noc_io_go && noc_in_count_f == noc_in_payload_len_f -1)  noc_in_state_next = NOC_IN_STATE_HEADER;
            else noc_in_state_next = noc_in_state_f;
        end 

        NOC_IN_STATE_STORE_ACK: begin 
            if (noc_io_go && noc_in_count_f == noc_in_payload_len_f -1)  noc_in_state_next = NOC_IN_STATE_HEADER;
            else noc_in_state_next = noc_in_state_f;
        end 

        default: 
            noc_in_state_next =  NOC_IN_STATE_HEADER;
    endcase
end 

always_ff@(posedge clk or negedge rst_n) begin
    if (!rst_n) noc_in_count_f <= 0;
    else noc_in_count_f <= noc_in_count_next;
end 

always_comb begin
    if (noc_in_state_f == NOC_IN_STATE_HEADER) noc_in_count_next = 0;
    else if (noc_in_state_f == NOC_IN_STATE_READ_DATA || noc_in_state_f == NOC_IN_STATE_STORE_ACK && noc_io_go) noc_in_count_next = noc_in_count_f + 1;
    else noc_in_count_next = noc_in_count_f;
end 

always_ff@(posedge clk or negedge rst_n) begin  
    if (!rst_n) noc_in_payload_len_f <= 0;
    else noc_in_payload_len_f <= noc_in_payload_len_next;
end 

always_comb begin 
    if (noc_in_state_f == NOC_IN_STATE_HEADER && noc_io_go) noc_in_payload_len_next = noc_data_in[`MSG_LENGTH];
    else noc_in_payload_len_next = noc_in_payload_len_f;
end 


//AXI interface output 
always_comb begin 
    m_axi_bresp = {AXI_RESP_WIDTH{1'b0}};
    m_axi_bvalid = (noc_in_state_f == NOC_IN_STATE_STORE_ACK) && noc_io_go && (noc_in_count_f == noc_in_payload_len_f -1) && last_write_flit;
end 

always_comb begin 
    m_axi_rdata = m_axi_rvalid ? rdata_fifo_rdata[AXILITE_DATA_WIDTH - 1: 0] : 64'hca11_ab1e_badc_ab1e;
    m_axi_rresp = m_axi_rvalid && m_axi_rready ? {AXI_RESP_WIDTH{1'b0}} : 2'b10;
    m_axi_rvalid = !rdata_fifo_empty;
end 

// NoC interface
always_comb begin   
    noc_ready_out = !rdata_fifo_full;
end 

endmodule 