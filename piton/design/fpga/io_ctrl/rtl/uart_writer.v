// ========== Copyright Header Begin ============================================
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
// ========== Copyright Header End ============================================

`include "uart16550_define.vh"

module  uart_writer (
  input                 axi_clk,
  input                 axi_rst_n,

  input                 start,
  output  reg           finish,

  output  [12:0]        m_axi_awaddr,
  output                m_axi_awvalid,
  input                 m_axi_awready,
  output  [31:0]        m_axi_wdata,
  output  [3:0]         m_axi_wstrb,
  output                m_axi_wvalid,
  input                 m_axi_wready,
  input   [1:0]         m_axi_bresp,
  input                 m_axi_bvalid,
  output                m_axi_bready,
  output  [31:0]        m_axi_araddr,
  output                m_axi_arvalid,
  input                 m_axi_arready,
  input   [31:0]        m_axi_rdata,
  input   [1:0]         m_axi_rresp,
  input                 m_axi_rvalid,
  output                m_axi_rready
);

localparam LINE_CNTR_WIDTH = 9;

localparam WAIT_TX    = 0;
localparam WAIT_RRESP = 1;
localparam SEND_DATA  = 2;


// set of hardwired lines to send
wire [LINE_CNTR_WIDTH-1:0] line_0_len = 8'd4;
wire [LINE_CNTR_WIDTH-1:0] line_1_len = 10'd400;

// stub
assign m_axi_bready   = 1'b1;
assign m_axi_rready   = 1'b1;



reg [1:0]   state;
reg         start_r;
reg         writer_active;
reg         line_sel;
reg [LINE_CNTR_WIDTH-1:0]   char_cnt;

wire          ar_sent;
wire          tx_sent;
wire          launch_writer;
wire  [7:0]   curr_char;
wire  [LINE_CNTR_WIDTH-1:0]   curr_line_len;

assign ar_sent         = m_axi_arvalid & m_axi_arready;
assign tx_sent        = m_axi_wvalid  & m_axi_wready;
assign state_wait_tx  = state == WAIT_TX;
assign state_send_d   = state == SEND_DATA;

always @(posedge axi_clk) begin
  start_r <= start;
end

assign launch_writer = start & ~start_r;

always @(posedge axi_clk) begin
  if (~axi_rst_n)
    writer_active <= 1'b0;
  else
    writer_active <= launch_writer    ? 1'b1  :
                     finish           ? 1'b0  : writer_active;
end

always @(posedge axi_clk) begin
  if (~axi_rst_n)
    finish <= 1'b0;
  else
    finish <= launch_writer                ? 1'b0   :
              writer_active &
              (char_cnt == curr_line_len)  ? 1'b1   : finish;
end

// processing of RRESP
assign rresp_tx_emp     = m_axi_rvalid & m_axi_rdata[`LSR_TEMT];
assign rresp_tx_no_emp  = m_axi_rvalid & ~m_axi_rdata[`LSR_TEMT];


assign m_axi_arvalid    = writer_active & state_wait_tx;
assign m_axi_araddr     = `UART_LSR;

assign m_axi_wvalid     = writer_active & state_send_d;
assign m_axi_wdata      = curr_char;
assign m_axi_awvalid    = writer_active & state_send_d;
assign m_axi_awaddr     = `UART_THR;
assign m_axi_wstrb      = 4'hf;

always @(posedge axi_clk) begin
  if (~axi_rst_n) begin
    state <= WAIT_TX;
  end
  else begin
    case (state)
      WAIT_TX: 
        if (ar_sent)
          state <= WAIT_RRESP;
      WAIT_RRESP: 
        if (rresp_tx_emp) 
          state <= SEND_DATA;
        else if (rresp_tx_no_emp)
          state <= WAIT_TX;
      SEND_DATA:
        if (tx_sent)
          state <= WAIT_TX;
      default:
        state <= state;
    endcase
  end
end

// Choosing a line to sent
always @(posedge axi_clk) begin
  if (~axi_rst_n)
    line_sel <= 1'b0;
end

always @(posedge axi_clk) begin
  if (~axi_rst_n)
    char_cnt <= {LINE_CNTR_WIDTH{1'b0}};
  else begin
    char_cnt <= launch_writer             ? {LINE_CNTR_WIDTH{1'b0}} :
                writer_active & tx_sent   ?  char_cnt + 1           : char_cnt;
  end
end

///-------------------------------
wire            mem0_val;
wire    [5:0]   mem0_addr;
wire    [7:0]   mem0_data;

// wire            mem1_val;
// wire    [LINE_CNTR_WIDTH-1:0]   mem1_addr;
// wire    [7:0]   mem1_data;

mem_uart_done   mem_uart_done (
  .clka     (axi_clk),    // input wire clka
  .ena      (mem0_val),      // input wire ena
  .addra    (mem0_addr),  // input wire [5 : 0] addra
  .douta    (mem0_data)  // output wire [7 : 0] douta
);

// mem_test mem_test (
//   .clka     (axi_clk),    // input wire clka
//   .ena      (mem1_val),      // input wire ena
//   .addra    (mem1_addr),  // input wire [5 : 0] addra
//   .douta    (mem1_data)  // output wire [7 : 0] douta
// );

assign mem0_val = line_sel == 1'b0;
assign mem0_addr = char_cnt;

// assign mem1_val = line_sel == 1'b1;
// assign mem1_addr = char_cnt;

assign curr_char = ({8{mem0_val}} & mem0_data) ;

                   // ({8{mem1_val}} & mem1_data) ;

assign curr_line_len = line_0_len;
// assign curr_line_len = line_sel == 1'b0   ? line_0_len : line_1_len;

endmodule
