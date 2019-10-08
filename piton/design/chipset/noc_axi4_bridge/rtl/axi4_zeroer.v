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
`include "mc_define.h"
`include "noc_axi4_bridge_define.vh"

module axi4_zeroer (
    input   clk,
    input   rst_n,

    input   init_calib_complete_in,
    output  init_calib_complete_out,

    // AXI interface in
    input wire  [`AXI4_ID_WIDTH     -1:0]     s_axi_awid,
    input wire  [`AXI4_ADDR_WIDTH   -1:0]     s_axi_awaddr,
    input wire  [`AXI4_LEN_WIDTH    -1:0]     s_axi_awlen,
    input wire  [`AXI4_SIZE_WIDTH   -1:0]     s_axi_awsize,
    input wire  [`AXI4_BURST_WIDTH  -1:0]     s_axi_awburst,
    input wire                                s_axi_awlock,
    input wire  [`AXI4_CACHE_WIDTH  -1:0]     s_axi_awcache,
    input wire  [`AXI4_PROT_WIDTH   -1:0]     s_axi_awprot,
    input wire  [`AXI4_QOS_WIDTH    -1:0]     s_axi_awqos,
    input wire  [`AXI4_REGION_WIDTH -1:0]     s_axi_awregion,
    input wire  [`AXI4_USER_WIDTH   -1:0]     s_axi_awuser,
    input wire                                s_axi_awvalid,
    output reg                                s_axi_awready,

    input wire   [`AXI4_ID_WIDTH     -1:0]    s_axi_wid,
    input wire   [`AXI4_DATA_WIDTH   -1:0]    s_axi_wdata,
    input wire   [`AXI4_STRB_WIDTH   -1:0]    s_axi_wstrb,
    input wire                                s_axi_wlast,
    input wire   [`AXI4_USER_WIDTH   -1:0]    s_axi_wuser,
    input wire                                s_axi_wvalid,
    output reg                                s_axi_wready,

    input wire   [`AXI4_ID_WIDTH     -1:0]    s_axi_arid,
    input wire   [`AXI4_ADDR_WIDTH   -1:0]    s_axi_araddr,
    input wire   [`AXI4_LEN_WIDTH    -1:0]    s_axi_arlen,
    input wire   [`AXI4_SIZE_WIDTH   -1:0]    s_axi_arsize,
    input wire   [`AXI4_BURST_WIDTH  -1:0]    s_axi_arburst,
    input wire                                s_axi_arlock,
    input wire   [`AXI4_CACHE_WIDTH  -1:0]    s_axi_arcache,
    input wire   [`AXI4_PROT_WIDTH   -1:0]    s_axi_arprot,
    input wire   [`AXI4_QOS_WIDTH    -1:0]    s_axi_arqos,
    input wire   [`AXI4_REGION_WIDTH -1:0]    s_axi_arregion,
    input wire   [`AXI4_USER_WIDTH   -1:0]    s_axi_aruser,
    input wire                                s_axi_arvalid,
    output reg                                s_axi_arready,

    output reg  [`AXI4_ID_WIDTH     -1:0]     s_axi_rid,
    output reg  [`AXI4_DATA_WIDTH   -1:0]     s_axi_rdata,
    output reg  [`AXI4_RESP_WIDTH   -1:0]     s_axi_rresp,
    output reg                                s_axi_rlast,
    output reg  [`AXI4_USER_WIDTH   -1:0]     s_axi_ruser,
    output reg                                s_axi_rvalid,
    input wire                                s_axi_rready,

    output reg  [`AXI4_ID_WIDTH     -1:0]     s_axi_bid,
    output reg  [`AXI4_RESP_WIDTH   -1:0]     s_axi_bresp,
    output reg  [`AXI4_USER_WIDTH   -1:0]     s_axi_buser,
    output reg                                s_axi_bvalid,
    input wire                                s_axi_bready,    

    // AXI interface out
    output reg  [`AXI4_ID_WIDTH     -1:0]     m_axi_awid,
    output reg  [`AXI4_ADDR_WIDTH   -1:0]     m_axi_awaddr,
    output reg  [`AXI4_LEN_WIDTH    -1:0]     m_axi_awlen,
    output reg  [`AXI4_SIZE_WIDTH   -1:0]     m_axi_awsize,
    output reg  [`AXI4_BURST_WIDTH  -1:0]     m_axi_awburst,
    output reg                                m_axi_awlock,
    output reg  [`AXI4_CACHE_WIDTH  -1:0]     m_axi_awcache,
    output reg  [`AXI4_PROT_WIDTH   -1:0]     m_axi_awprot,
    output reg  [`AXI4_QOS_WIDTH    -1:0]     m_axi_awqos,
    output reg  [`AXI4_REGION_WIDTH -1:0]     m_axi_awregion,
    output reg  [`AXI4_USER_WIDTH   -1:0]     m_axi_awuser,
    output reg                                m_axi_awvalid,
    input  wire                               m_axi_awready,

    output reg   [`AXI4_ID_WIDTH     -1:0]    m_axi_wid,
    output reg   [`AXI4_DATA_WIDTH   -1:0]    m_axi_wdata,
    output reg   [`AXI4_STRB_WIDTH   -1:0]    m_axi_wstrb,
    output reg                                m_axi_wlast,
    output reg   [`AXI4_USER_WIDTH   -1:0]    m_axi_wuser,
    output reg                                m_axi_wvalid,
    input  wire                               m_axi_wready,

    output reg   [`AXI4_ID_WIDTH     -1:0]    m_axi_arid,
    output reg   [`AXI4_ADDR_WIDTH   -1:0]    m_axi_araddr,
    output reg   [`AXI4_LEN_WIDTH    -1:0]    m_axi_arlen,
    output reg   [`AXI4_SIZE_WIDTH   -1:0]    m_axi_arsize,
    output reg   [`AXI4_BURST_WIDTH  -1:0]    m_axi_arburst,
    output reg                                m_axi_arlock,
    output reg   [`AXI4_CACHE_WIDTH  -1:0]    m_axi_arcache,
    output reg   [`AXI4_PROT_WIDTH   -1:0]    m_axi_arprot,
    output reg   [`AXI4_QOS_WIDTH    -1:0]    m_axi_arqos,
    output reg   [`AXI4_REGION_WIDTH -1:0]    m_axi_arregion,
    output reg   [`AXI4_USER_WIDTH   -1:0]    m_axi_aruser,
    output reg                                m_axi_arvalid,
    input  wire                               m_axi_arready,

    input  wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_rid,
    input  wire  [`AXI4_DATA_WIDTH   -1:0]    m_axi_rdata,
    input  wire  [`AXI4_RESP_WIDTH   -1:0]    m_axi_rresp,
    input  wire                               m_axi_rlast,
    input  wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_ruser,
    input  wire                               m_axi_rvalid,
    output reg                                m_axi_rready,

    input  wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_bid,
    input  wire  [`AXI4_RESP_WIDTH   -1:0]    m_axi_bresp,
    input  wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_buser,
    input  wire                               m_axi_bvalid,
    output reg                                m_axi_bready
);

localparam reg [63:0] BOARD_MEM_SIZE_MB = `BOARD_MEM_SIZE_MB;
localparam reg [`AXI4_ADDR_WIDTH-1:0] MAX_MEM_ADDR      = (BOARD_MEM_SIZE_MB * 2**20);
localparam REQUESTS_NEEDED  = MAX_MEM_ADDR / `AXI4_STRB_WIDTH; // basically max addr divided by size of one request
localparam MAX_OUTSTANDING = 16;

wire zeroer_req_val;
wire zeroer_resp_rdy;
wire req_go;
wire resp_go;
reg [`AXI4_ADDR_WIDTH-1:0] req_sent;
reg [`AXI4_ADDR_WIDTH-1:0] resp_got;
reg [3:0] outstanding;
wire [`AXI4_ADDR_WIDTH-1:0] zeroer_addr;
wire zeroer_wlast;

assign zeroer_req_val = init_calib_complete_in 
                      & (req_sent < REQUESTS_NEEDED) 
                      & (outstanding != MAX_OUTSTANDING-1) 
                      & m_axi_awready
                      & m_axi_wready
                      & rst_n;

assign zeroer_resp_rdy = init_calib_complete_in 
                       & (resp_got < REQUESTS_NEEDED) 
                       & rst_n;

assign req_go = zeroer_req_val;
assign resp_go = zeroer_resp_rdy & m_axi_bvalid;


always @(posedge clk) begin
    if(~rst_n) begin
        req_sent <= 0;
        resp_got <= 0;
        outstanding <= 0;
    end 
    else begin
        req_sent <= req_sent + req_go;
        resp_got <= resp_got + resp_go;
        outstanding <= req_go & resp_go ? outstanding 
                     : req_go           ? outstanding + 1 
                     : resp_go          ? outstanding - 1 
                     :                    outstanding;
    end
end

assign init_calib_complete_out = (req_sent == REQUESTS_NEEDED) & 
                                 (resp_got == REQUESTS_NEEDED);

assign zeroer_addr = req_sent * `AXI4_STRB_WIDTH;
assign zeroer_wlast = zeroer_req_val;

always @(*) begin
    if (~init_calib_complete_out) begin
        m_axi_awid = `AXI4_ID_WIDTH'b0;
        m_axi_awaddr = zeroer_addr;
        m_axi_awlen = `AXI4_LEN_WIDTH'b0;
        m_axi_awsize = `AXI4_SIZE_WIDTH'b110;
        m_axi_awburst = `AXI4_BURST_WIDTH'b01;
        m_axi_awlock = 1'b0;
        m_axi_awcache = `AXI4_CACHE_WIDTH'b11;
        m_axi_awprot = `AXI4_PROT_WIDTH'b10;
        m_axi_awqos = `AXI4_QOS_WIDTH'b0;
        m_axi_awregion = `AXI4_REGION_WIDTH'b0;
        m_axi_awuser = `AXI4_USER_WIDTH'b0;
        m_axi_awvalid = zeroer_req_val;

        m_axi_wid = `AXI4_ID_WIDTH'b0;
        m_axi_wdata = {`AXI4_DATA_WIDTH{1'b0}};
        m_axi_wstrb = {`AXI4_STRB_WIDTH{1'b1}};
        m_axi_wlast = zeroer_wlast;
        m_axi_wuser = `AXI4_USER_WIDTH'b0;
        m_axi_wvalid = zeroer_req_val;

        m_axi_arid = `AXI4_ID_WIDTH'b0;
        m_axi_araddr = `AXI4_ADDR_WIDTH'b0;
        m_axi_arlen = `AXI4_LEN_WIDTH'b0;
        m_axi_arsize = `AXI4_SIZE_WIDTH'b110;
        m_axi_arburst = `AXI4_BURST_WIDTH'b01;
        m_axi_arlock = 1'b0;
        m_axi_arcache = `AXI4_CACHE_WIDTH'b11;
        m_axi_arprot = `AXI4_PROT_WIDTH'b10;
        m_axi_arqos = `AXI4_QOS_WIDTH'b0;
        m_axi_arregion = `AXI4_REGION_WIDTH'b0;
        m_axi_aruser = `AXI4_USER_WIDTH'b0;
        m_axi_arvalid = 1'b0;

        m_axi_rready = 1'b0;
        m_axi_bready = zeroer_resp_rdy;

        s_axi_awready = 1'b0;
        s_axi_wready = 1'b0;
        s_axi_arready = 1'b0;
        s_axi_rid = `AXI4_ID_WIDTH'b0;
        s_axi_rdata = `AXI4_DATA_WIDTH'b0;
        s_axi_rresp = `AXI4_RESP_WIDTH'b0;
        s_axi_rlast = 1'b0;
        s_axi_ruser = `AXI4_USER_WIDTH'b0;
        s_axi_rvalid = 1'b0;
        s_axi_bid = `AXI4_ID_WIDTH'b0;
        s_axi_bresp = `AXI4_RESP_WIDTH'b0;
        s_axi_buser = `AXI4_USER_WIDTH'b0;
        s_axi_bvalid = 1'b0;
    end

    else begin
        m_axi_awid = s_axi_awid;
        m_axi_awaddr = s_axi_awaddr;
        m_axi_awlen = s_axi_awlen;
        m_axi_awsize = s_axi_awsize;
        m_axi_awburst = s_axi_awburst;
        m_axi_awlock = s_axi_awlock;
        m_axi_awcache = s_axi_awcache;
        m_axi_awprot = s_axi_awprot;
        m_axi_awqos = s_axi_awqos;
        m_axi_awregion = s_axi_awregion;
        m_axi_awuser = s_axi_awuser;
        m_axi_awvalid = s_axi_awvalid;
        s_axi_awready = m_axi_awready;

        m_axi_wid = s_axi_wid;
        m_axi_wdata = s_axi_wdata;
        m_axi_wstrb = s_axi_wstrb;
        m_axi_wlast = s_axi_wlast;
        m_axi_wuser = s_axi_wuser;
        m_axi_wvalid = s_axi_wvalid;
        s_axi_wready = m_axi_wready;

        m_axi_arid = s_axi_arid;
        m_axi_araddr = s_axi_araddr;
        m_axi_arlen = s_axi_arlen;
        m_axi_arsize = s_axi_arsize;
        m_axi_arburst = s_axi_arburst;
        m_axi_arlock = s_axi_arlock;
        m_axi_arcache = s_axi_arcache;
        m_axi_arprot = s_axi_arprot;
        m_axi_arqos = s_axi_arqos;
        m_axi_arregion = s_axi_arregion;
        m_axi_aruser = s_axi_aruser;
        m_axi_arvalid = s_axi_arvalid;
        s_axi_arready = m_axi_arready;

        s_axi_rid = m_axi_rid;
        s_axi_rdata = m_axi_rdata;
        s_axi_rresp = m_axi_rresp;
        s_axi_rlast = m_axi_rlast;
        s_axi_ruser = m_axi_ruser;
        s_axi_rvalid = m_axi_rvalid;
        m_axi_rready = s_axi_rready;

        s_axi_bid = m_axi_bid;
        s_axi_bresp = m_axi_bresp;
        s_axi_buser = m_axi_buser;
        s_axi_bvalid = m_axi_bvalid;
        m_axi_bready = s_axi_bready;
    end

end


endmodule
