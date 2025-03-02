// Modified by Barcelona Supercomputing Center on March 3rd, 2022
// ========== Copyright Header Begin ============================================
// Copyright (c) 2019 Princeton University
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

`include "mc_define.h"
`include "define.tmp.h"
`include "noc_axi4_bridge_define.vh"
import noc_axi4_bridge_pkg::*;


module noc_axi4_bridge_write #(
    parameter AXI4_DAT_WIDTH_USED = `AXI4_DATA_WIDTH // actually used AXI Data width (down converted if needed)
) (
    // Clock + Reset
    input  wire                                                    clk,
    input  wire                                                    rst_n,

    // NOC interface
    input  wire                                          req_val,
    input  wire [`AXI4_ADDR_WIDTH    -1:0]               req_addr,
    input  wire [`MSG_DATA_SIZE_WIDTH-1:0]               req_size_log,
    input  wire [`AXI4_ID_WIDTH      -1:0]               req_id,
    input  wire [`AXI4_DATA_WIDTH-1:0]                   req_data,
    input  wire [`AXI4_STRB_WIDTH-1:0]                   req_strb,
    output wire                                          req_rdy,

    output wire                                          resp_val,
    output wire [`AXI4_ID_WIDTH   -1:0]                  resp_id,
    input  wire                                          resp_rdy,

    // AXI write interface
    output reg  [`AXI4_ID_WIDTH     -1:0]     m_axi_awid,
    output reg  [`AXI4_ADDR_WIDTH   -1:0]     m_axi_awaddr,
    output reg  [`AXI4_LEN_WIDTH    -1:0]     m_axi_awlen,
    output reg  [`AXI4_SIZE_WIDTH   -1:0]     m_axi_awsize,
    output wire [`AXI4_BURST_WIDTH  -1:0]     m_axi_awburst,
    output wire                               m_axi_awlock,
    output wire [`AXI4_CACHE_WIDTH  -1:0]     m_axi_awcache,
    output wire [`AXI4_PROT_WIDTH   -1:0]     m_axi_awprot,
    output wire [`AXI4_QOS_WIDTH    -1:0]     m_axi_awqos,
    output wire [`AXI4_REGION_WIDTH -1:0]     m_axi_awregion,
    output wire [`AXI4_USER_WIDTH   -1:0]     m_axi_awuser,
    output wire                               m_axi_awvalid,
    input  wire                               m_axi_awready,

    output wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_wid,
    output wire  [AXI4_DAT_WIDTH_USED-1:0]    m_axi_wdata,
    output wire  [AXI4_DAT_WIDTH_USED/8-1:0]  m_axi_wstrb,
    output wire                               m_axi_wlast,
    output wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_wuser,
    output wire                               m_axi_wvalid,
    input  wire                               m_axi_wready,

    input  wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_bid,
    input  wire  [`AXI4_RESP_WIDTH   -1:0]    m_axi_bresp,
    input  wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_buser,
    input  wire                               m_axi_bvalid,
    output wire                               m_axi_bready
);


localparam IDLE     = 2'h0;
localparam GOT_REQ  = 2'h1;
localparam SENT_AW  = 2'h2;
localparam SENT_W   = 2'h3;
localparam GOT_RESP = 2'b1;

//==============================================================================
// Tie constant outputs in axi4
//==============================================================================

    assign m_axi_awburst  = `AXI4_BURST_WIDTH'b01; // INCR address in bursts
    assign m_axi_awlock   = 1'b0; // Do not use locks
    assign m_axi_awcache  = `AXI4_CACHE_WIDTH'b11; // Non-cacheable bufferable requests
    assign m_axi_awprot   = `AXI4_PROT_WIDTH'b0; // Data access, non-secure access, unpriveleged access
    assign m_axi_awqos    = `AXI4_QOS_WIDTH'b0; // Do not use qos
    assign m_axi_awregion = `AXI4_REGION_WIDTH'b0; // Do not use regions
    assign m_axi_awuser   = `AXI4_USER_WIDTH'b0; // Do not use user field
    assign m_axi_wuser    = `AXI4_USER_WIDTH'b0; // Do not use user field

wire [`AXI4_ADDR_WIDTH-1:0] addr_paddings = `AXI4_ADDR_WIDTH'b0;

// outbound requests
wire m_axi_awgo = m_axi_awvalid & m_axi_awready;
wire m_axi_wgo = m_axi_wvalid & m_axi_wready;
wire m_axi_lwgo = m_axi_wgo & m_axi_wlast;
wire req_go = req_val & req_rdy;

reg [1:0] req_state;
reg [`AXI4_DATA_WIDTH-1:0] req_data_f;

assign req_rdy = (req_state == IDLE);
assign m_axi_awvalid = (req_state == GOT_REQ) || (req_state == SENT_W);
assign m_axi_wvalid  = (req_state == GOT_REQ) || (req_state == SENT_AW);
wire signed [`MSG_DATA_SIZE_WIDTH:0] burst_len_log = $signed({1'b0, req_size_log}) - $clog2(AXI4_DAT_WIDTH_USED/8);
wire [`AXI4_LEN_WIDTH -1:0] burst_len = (1 << clip2zer(burst_len_log)) - 1;

always @(posedge clk)
    if(~rst_n) begin
        req_state <= IDLE;
    end else
        case (req_state)
            IDLE: if (req_go) begin
                req_state    <= GOT_REQ;
                m_axi_awaddr <= req_addr;
                m_axi_awlen  <= burst_len;
                m_axi_awsize <= (burst_len_log < 0) ? req_size_log : $clog2(AXI4_DAT_WIDTH_USED/8);
                m_axi_awid   <= req_id;
            end
            GOT_REQ:
                req_state <= (m_axi_awgo & m_axi_lwgo) ? IDLE :
                              m_axi_awgo               ? SENT_AW :
                                           m_axi_lwgo  ? SENT_W : req_state;
            SENT_AW: if (m_axi_lwgo)
                req_state <= IDLE;
            SENT_W: if (m_axi_awgo)
                req_state <= IDLE;
            default : begin
                // should never end up here
                req_state    <= 2'bX;
                m_axi_awaddr <= `AXI4_ADDR_WIDTH'bX;
                m_axi_awlen  <= `AXI4_LEN_WIDTH'bX;
                m_axi_awsize <= `AXI4_SIZE_WIDTH'bX;
                m_axi_awid   <= `AXI4_ID_WIDTH'bX;
            end
        endcase

// making a burst on data and strobe buses
localparam MAX_BURST_LEN  = `AXI4_DATA_WIDTH / AXI4_DAT_WIDTH_USED;
reg [clip2zer($clog2(MAX_BURST_LEN)-1) :0] burst_count;
assign m_axi_wlast = !burst_count;
reg [`AXI4_STRB_WIDTH-1:0] req_strb_f;
always @(posedge clk)
  if(~rst_n) begin
    burst_count <= 0;
    req_data_f  <= 0;
    req_strb_f  <= 0;
  end else begin
    if (req_go) begin
      burst_count <= burst_len;
      req_data_f  <= req_data;
      req_strb_f  <= req_strb;
    end
    else if (MAX_BURST_LEN > 1 && m_axi_wgo && ~m_axi_wlast) begin
      burst_count <= burst_count-1;
      // down shifting data and strobe buses every burst cycle (high part is don't care, left unchanged for optimization)
      req_data_f <= {req_data_f[`AXI4_DATA_WIDTH -1 : `AXI4_DATA_WIDTH - AXI4_DAT_WIDTH_USED],
                     req_data_f[`AXI4_DATA_WIDTH -1 : (MAX_BURST_LEN>1 ? AXI4_DAT_WIDTH_USED   : 0)]};
      req_strb_f <= {req_strb_f[`AXI4_STRB_WIDTH -1 : `AXI4_STRB_WIDTH - AXI4_DAT_WIDTH_USED/8],
                     req_strb_f[`AXI4_STRB_WIDTH -1 : (MAX_BURST_LEN>1 ? AXI4_DAT_WIDTH_USED/8 : 0)]};
    end
end

assign m_axi_wid    = m_axi_awid;
assign m_axi_wstrb  = req_strb_f;
assign m_axi_wdata  = req_data_f;

// inbound responses
wire m_axi_bgo = m_axi_bvalid & m_axi_bready;
wire resp_go = resp_val & resp_rdy;

reg resp_state;
reg [`AXI4_ID_WIDTH-1:0] resp_id_f;

assign resp_val = (resp_state == GOT_RESP);
assign m_axi_bready = (resp_state == IDLE);


always @(posedge clk)
    if(~rst_n) begin
        resp_id_f <= 0;
        resp_state <= IDLE;
    end else
        case (resp_state)
            IDLE: if (m_axi_bgo) begin
                resp_state <= GOT_RESP;
                resp_id_f  <= m_axi_bid;
            end
            GOT_RESP: if (resp_go)
                resp_state <= IDLE;
            default : begin
                resp_state <= IDLE;
                resp_id_f <= 0;
            end
        endcase

// process data here
assign resp_id = resp_id_f;

/*
ila_write ila_write (
    .clk(clk), // input wire clk


    .probe0(rst_n), // input wire [0:0]  probe0  
    .probe1(uart_boot_en), // input wire [0:0]  probe1 
    .probe2(req_val), // input wire [0:0]  probe2 
    .probe3(req_header), // input wire [191:0]  probe3 
    .probe4(req_id), // input wire [1:0]  probe4 
    .probe5(req_data), // input wire [511:0]  probe5 
    .probe6(req_rdy), // input wire [0:0]  probe6 
    .probe7(resp_val), // input wire [0:0]  probe7 
    .probe8(resp_id), // input wire [1:0]  probe8 
    .probe9(resp_rdy), // input wire [0:0]  probe9 
    .probe10(m_axi_awid), // input wire [15:0]  probe10 
    .probe11(m_axi_awaddr), // input wire [63:0]  probe11 
    .probe12(m_axi_awvalid), // input wire [0:0]  probe12 
    .probe13(m_axi_awready), // input wire [0:0]  probe13 
    .probe14(m_axi_wid), // input wire [15:0]  probe14 
    .probe15(m_axi_wdata), // input wire [511:0]  probe15 
    .probe16(m_axi_wstrb), // input wire [63:0]  probe16 
    .probe17(m_axi_wlast), // input wire [0:0]  probe17 
    .probe18(m_axi_wvalid), // input wire [0:0]  probe18 
    .probe19(m_axi_wready), // input wire [0:0]  probe19 
    .probe20(m_axi_bid), // input wire [15:0]  probe20 
    .probe21(m_axi_bvalid), // input wire [0:0]  probe21 
    .probe22(m_axi_bready), // input wire [0:0]  probe22 
    .probe23(req_state), // input wire [2:0]  probe23 
    .probe24(req_header_f), // input wire [191:0]  probe24 
    .probe25(req_id_f), // input wire [1:0]  probe25 
    .probe26(req_data_f), // input wire [511:0]  probe26 
    .probe27(strb_before_offset), // input wire [63:0]  probe27 
    .probe28(offset), // input wire [5:0]  probe28 
    .probe29(addr), // input wire [63:0]  probe29 
    .probe30(resp_state), // input wire [2:0]  probe30 
    .probe31(resp_id_f) // input wire [1:0]  probe31
);*/

endmodule
