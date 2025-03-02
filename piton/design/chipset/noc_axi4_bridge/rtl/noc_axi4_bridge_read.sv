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


module noc_axi4_bridge_read #(
    parameter AXI4_DAT_WIDTH_USED = `AXI4_DATA_WIDTH // actually used AXI Data width (down converted if needed)
) (
    // Clock + Reset
    input  wire                                          clk,
    input  wire                                          rst_n,

    // NOC interface
    input  wire                                          req_val,
    input  wire [`AXI4_ADDR_WIDTH    -1:0]               req_addr,
    input  wire [`MSG_DATA_SIZE_WIDTH-1:0]               req_size_log,
    input  wire [`AXI4_ID_WIDTH      -1:0]               req_id,
    output wire                                          req_rdy,

    output wire                                          resp_val,
    output wire [`AXI4_ID_WIDTH  -1:0]                   resp_id,
    output  reg [`AXI4_DATA_WIDTH-1:0]                   resp_data,
    input  wire                                          resp_rdy,

    // AXI Read Interface
    output reg   [`AXI4_ID_WIDTH     -1:0]    m_axi_arid,
    output reg   [`AXI4_ADDR_WIDTH   -1:0]    m_axi_araddr,
    output reg   [`AXI4_LEN_WIDTH    -1:0]    m_axi_arlen,
    output reg   [`AXI4_SIZE_WIDTH   -1:0]    m_axi_arsize,
    output wire  [`AXI4_BURST_WIDTH  -1:0]    m_axi_arburst,
    output wire                               m_axi_arlock,
    output wire  [`AXI4_CACHE_WIDTH  -1:0]    m_axi_arcache,
    output wire  [`AXI4_PROT_WIDTH   -1:0]    m_axi_arprot,
    output wire  [`AXI4_QOS_WIDTH    -1:0]    m_axi_arqos,
    output wire  [`AXI4_REGION_WIDTH -1:0]    m_axi_arregion,
    output wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_aruser,
    output wire                               m_axi_arvalid,
    input  wire                               m_axi_arready,

    input  wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_rid,
    input  wire  [AXI4_DAT_WIDTH_USED-1:0]    m_axi_rdata,
    input  wire  [`AXI4_RESP_WIDTH   -1:0]    m_axi_rresp,
    input  wire                               m_axi_rlast,
    input  wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_ruser,
    input  wire                               m_axi_rvalid,
    output wire                               m_axi_rready
);


localparam IDLE     = 1'b0;
localparam GOT_REQ  = 1'b1;
localparam GOT_RESP = 1'b1;

wire [`AXI4_ADDR_WIDTH-1:0]addr_paddings = `AXI4_ADDR_WIDTH'b0;

//==============================================================================
// Tie constant outputs in axi4
//==============================================================================

    assign m_axi_arburst  = `AXI4_BURST_WIDTH'b01; // INCR address in bursts
    assign m_axi_arlock   = 1'b0; // Do not use locks
    assign m_axi_arcache  = `AXI4_CACHE_WIDTH'b11; // Non-cacheable bufferable requests
    assign m_axi_arprot   = `AXI4_PROT_WIDTH'b0; // Data access, non-secure access, unpriveleged access
    assign m_axi_arqos    = `AXI4_QOS_WIDTH'b0; // Do not use qos
    assign m_axi_arregion = `AXI4_REGION_WIDTH'b0; // Do not use regions
    assign m_axi_aruser   = `AXI4_USER_WIDTH'b0; // Do not use user field

// outbound requests
wire m_axi_argo = m_axi_arvalid & m_axi_arready;
wire req_go = req_val & req_rdy;

reg req_state;

assign req_rdy = (req_state == IDLE);
assign m_axi_arvalid = (req_state == GOT_REQ);
wire signed [`MSG_DATA_SIZE_WIDTH:0] burst_len_log = $signed({1'b0, req_size_log}) - $clog2(AXI4_DAT_WIDTH_USED/8);

always @(posedge clk)
    if(~rst_n) begin
        req_state <= IDLE;
    end else
        case (req_state)
            IDLE: if (req_go) begin
                req_state  <= GOT_REQ;
                m_axi_araddr <= req_addr;
                m_axi_arlen  <= (1 << clip2zer(burst_len_log)) - 1;
                m_axi_arsize <= (burst_len_log < 0) ? req_size_log : $clog2(AXI4_DAT_WIDTH_USED/8);
                m_axi_arid   <= req_id;
            end
            GOT_REQ: if (m_axi_argo)
                req_state <= IDLE;
            default : begin
                // should never end up here
                req_state    <= 1'bX;
                m_axi_araddr <= `AXI4_ADDR_WIDTH'bX;
                m_axi_arlen  <= `AXI4_LEN_WIDTH'bX;
                m_axi_arsize <= `AXI4_SIZE_WIDTH'bX;
                m_axi_arid   <= `AXI4_ID_WIDTH'bX;
            end
        endcase

// inbound responses
reg [`AXI4_ID_WIDTH-1:0] resp_id_f;
wire resp_go = resp_val & resp_rdy;
wire m_axi_rgo = m_axi_rvalid & m_axi_rready;

reg resp_state;

assign resp_val = (resp_state == GOT_RESP);
assign m_axi_rready = (resp_state == IDLE);

localparam MAX_BURST_LEN  = `AXI4_DATA_WIDTH / AXI4_DAT_WIDTH_USED;
reg [clip2zer($clog2(MAX_BURST_LEN)-1) :0] burst_count;
always @(posedge clk)
    if(~rst_n) begin
        resp_id_f <= 0;
        resp_state <= IDLE;
        resp_data   <= 0;
        burst_count <= 0;
    end else
        case (resp_state)
            IDLE: if (m_axi_rgo) begin
                if (m_axi_rlast) begin
                  resp_state <= GOT_RESP;
                  burst_count <= 0;
                end else if (MAX_BURST_LEN > 1) burst_count <= burst_count + 1;
                resp_id_f  <= m_axi_rid;
                resp_data[{burst_count,{$clog2(AXI4_DAT_WIDTH_USED){1'b0}}} +: AXI4_DAT_WIDTH_USED] <= m_axi_rdata;
            end
            GOT_RESP: if (resp_go)
                resp_state <= IDLE;
            default : begin
                // should never end up here
                resp_id_f <= 0;
                resp_state <= IDLE;
                resp_data  <= 0;
            end
        endcase

// process data here
assign resp_id = resp_id_f;

/*
ila_read ila_read(
    .clk(clk), // input wire clk


    .probe0(rst_n), // input wire [0:0]  probe0  
    .probe1(uart_boot_en), // input wire [0:0]  probe1 
    .probe2(req_val), // input wire [0:0]  probe2 
    .probe3(req_header), // input wire [191:0]  probe3 
    .probe4(req_id), // input wire [1:0]  probe4 
    .probe5(req_rdy), // input wire [0:0]  probe5 
    .probe6(resp_val), // input wire [0:0]  probe6 
    .probe7(resp_id), // input wire [1:0]  probe7 
    .probe8(resp_data), // input wire [511:0]  probe8 
    .probe9(resp_rdy), // input wire [0:0]  probe9 
    .probe10(m_axi_arid), // input wire [15:0]  probe10 
    .probe11(m_axi_araddr), // input wire [63:0]  probe11 
    .probe12(m_axi_arvalid), // input wire [0:0]  probe12 
    .probe13(m_axi_arready), // input wire [0:0]  probe13 
    .probe14(m_axi_rid), // input wire [15:0]  probe14 
    .probe15(m_axi_rdata), // input wire [511:0]  probe15 
    .probe16(m_axi_rvalid), // input wire [0:0]  probe16 
    .probe17(m_axi_rready), // input wire [0:0]  probe17 
    .probe18(req_state), // input wire [0:0]  probe18 
    .probe19(req_header_f), // input wire [191:0]  probe19 
    .probe20(req_id_f), // input wire [1:0]  probe20 
    .probe21(resp_id_f), // input wire [1:0]  probe21 
    .probe22(resp_state), // input wire [1:0]  probe22 
    .probe23(data_offseted) // input wire [511:0]  probe23
);*/
endmodule
