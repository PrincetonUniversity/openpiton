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
`include "chipset_define.vh"

module  uart_writer (
  input                 axi_clk,
  input                 axi_rst_n,

  input                 start,
  output  reg           finish,
  input   [2:0]         str_sel,

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
localparam LINE_NUMBER = 16;
localparam CHAR_WIDTH = 8;

localparam WAIT_TX    = 0;
localparam WAIT_RRESP = 1;
localparam SEND_DATA  = 2;

localparam LINE_0_LEN = 4;
localparam LINE_1_LEN = 6;
localparam LINE_2_LEN = 6;
localparam LINE_3_LEN = 7;

// set of hardwired lines to send
wire  [LINE_CNTR_WIDTH-1:0] str_len [LINE_NUMBER-1:0];

assign str_len[0] = LINE_0_LEN;
assign str_len[1] = LINE_1_LEN;
assign str_len[2] = LINE_1_LEN;
assign str_len[3] = LINE_3_LEN;

reg   [CHAR_WIDTH-1:0]  line_0 [LINE_0_LEN-1:0];  // DONE
reg   [CHAR_WIDTH-1:0]  line_1 [LINE_1_LEN-1:0];  // PASSED
reg   [CHAR_WIDTH-1:0]  line_2 [LINE_2_LEN-1:0];  // FAILED
reg   [CHAR_WIDTH-1:0]  line_3 [LINE_3_LEN-1:0];  // TIMEOUT

// DONE
always @(posedge axi_clk) begin
  line_0[0] <= 8'h44;
  line_0[1] <= 8'h4f;
  line_0[2] <= 8'h4e;
  line_0[3] <= 8'h45;
end

// PASSED
always @(posedge axi_clk) begin
  line_1[0] <= 8'h50;
  line_1[1] <= 8'h41;
  line_1[2] <= 8'h53;
  line_1[3] <= 8'h53;
  line_1[4] <= 8'h45;
  line_1[5] <= 8'h44;
end

// FAILED
always @(posedge axi_clk) begin
  line_2[0] <= 8'h46;
  line_2[1] <= 8'h41;
  line_2[2] <= 8'h49;
  line_2[3] <= 8'h4c;
  line_2[4] <= 8'h45;
  line_2[5] <= 8'h44;
end

// TIMEOUT
always @(posedge axi_clk) begin
  line_3[0] <= 8'h54;
  line_3[1] <= 8'h49;
  line_3[2] <= 8'h4d;
  line_3[3] <= 8'h45;
  line_3[4] <= 8'h4f;
  line_3[5] <= 8'h55;
  line_3[6] <= 8'h54;
end

// stub
assign m_axi_bready   = 1'b1;
assign m_axi_rready   = 1'b1;



reg [1:0]   state;
reg         start_r;
reg         writer_active;
reg [LINE_CNTR_WIDTH-1:0]   char_cnt;

wire          ar_sent;
wire          tx_sent;
wire          launch_writer;
wire  [7:0]   curr_char;
wire  [LINE_CNTR_WIDTH-1:0]   curr_line_len;

wire [CHAR_WIDTH-1:0]   char_0;
wire [CHAR_WIDTH-1:0]   char_1;
wire [CHAR_WIDTH-1:0]   char_2;
wire [CHAR_WIDTH-1:0]   char_3;

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
    finish <= writer_active & (char_cnt == curr_line_len);
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
  `ifdef PITON_UART16550
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
  `else
    state <= SEND_DATA;
  `endif
  end
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
assign char_0 = line_0[char_cnt];
assign char_1 = line_1[char_cnt];
assign char_2 = line_2[char_cnt];
assign char_3 = line_3[char_cnt];

assign curr_char =  ({8{str_sel == `CFG_DONE_STRING}} & char_0) |
                    ({8{str_sel == `PASSED_STRING}}   & char_1) |
                    ({8{str_sel == `FAILED_STRING}}   & char_2) |
                    ({8{str_sel == `TIMEOUT_STRING}}  & char_3) ;


assign curr_line_len = str_len[str_sel];

endmodule
