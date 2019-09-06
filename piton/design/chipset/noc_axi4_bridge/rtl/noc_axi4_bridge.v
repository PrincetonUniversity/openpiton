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

module noc_axi4_bridge # (
  parameter MAX_PKT_LEN                 = 11,
  parameter MAX_PKT_LEN_LOG             = 4,
  parameter IN_FLIGHT_LIMIT             = 16, //number of commands the MC can have in flight
  parameter BUFFER_ADDR_SIZE            = 4,   //(log_2(IN_FLIGHT_LIMIT)+1)
  parameter PAYLOAD_SIZE                = 512
)(
	// Clock + Reset
    input  wire                                   clk,
    input  wire                                   rst_n,
    input  wire                                   uart_boot_en, 

    // Noc interface
    input  wire                                   flit_in_val,
    input  wire [`NOC_DATA_WIDTH-1:0]             flit_in,
    output wire                                   flit_in_rdy,
    output wire                                   flit_out_val,
    output wire  [`NOC_DATA_WIDTH-1:0]            flit_out,
    input  wire                                   flit_out_rdy,

    // AXI interface
    output wire [`C_M_AXI4_ID_WIDTH     -1:0]    m_axi_awid,
    output wire [`C_M_AXI4_ADDR_WIDTH   -1:0]    m_axi_awaddr,
    output wire [`C_M_AXI4_LEN_WIDTH    -1:0]    m_axi_awlen,
    output wire [`C_M_AXI4_SIZE_WIDTH   -1:0]    m_axi_awsize,
    output wire [`C_M_AXI4_BURST_WIDTH  -1:0]    m_axi_awburst,
    output wire                                  m_axi_awlock,
    output wire [`C_M_AXI4_CACHE_WIDTH  -1:0]    m_axi_awcache,
    output wire [`C_M_AXI4_PROT_WIDTH   -1:0]    m_axi_awprot,
    output wire [`C_M_AXI4_QOS_WIDTH    -1:0]    m_axi_awqos,
    output wire [`C_M_AXI4_REGION_WIDTH -1:0]    m_axi_awregion,
    output wire [`C_M_AXI4_USER_WIDTH   -1:0]    m_axi_awuser,
    output wire                                  m_axi_awvalid,
    input  wire                                  m_axi_awready,

    output wire  [`C_M_AXI4_ID_WIDTH     -1:0]    m_axi_wid,
    output wire  [`C_M_AXI4_DATA_WIDTH   -1:0]    m_axi_wdata,
    output wire  [`C_M_AXI4_STRB_WIDTH   -1:0]    m_axi_wstrb,
    output wire                                   m_axi_wlast,
    output wire  [`C_M_AXI4_USER_WIDTH   -1:0]    m_axi_wuser,
    output wire                                   m_axi_wvalid,
    input  wire                                   m_axi_wready,

    output wire  [`C_M_AXI4_ID_WIDTH     -1:0]    m_axi_arid,
    output wire  [`C_M_AXI4_ADDR_WIDTH   -1:0]    m_axi_araddr,
    output wire  [`C_M_AXI4_LEN_WIDTH    -1:0]    m_axi_arlen,
    output wire  [`C_M_AXI4_SIZE_WIDTH   -1:0]    m_axi_arsize,
    output wire  [`C_M_AXI4_BURST_WIDTH  -1:0]    m_axi_arburst,
    output wire                                   m_axi_arlock,
    output wire  [`C_M_AXI4_CACHE_WIDTH  -1:0]    m_axi_arcache,
    output wire  [`C_M_AXI4_PROT_WIDTH   -1:0]    m_axi_arprot,
    output wire  [`C_M_AXI4_QOS_WIDTH    -1:0]    m_axi_arqos,
    output wire  [`C_M_AXI4_REGION_WIDTH -1:0]    m_axi_arregion,
    output wire  [`C_M_AXI4_USER_WIDTH   -1:0]    m_axi_aruser,
    output wire                                   m_axi_arvalid,
    input  wire                                   m_axi_arready,

    input  wire  [`C_M_AXI4_ID_WIDTH     -1:0]    m_axi_rid,
    input  wire  [`C_M_AXI4_DATA_WIDTH   -1:0]    m_axi_rdata,
    input  wire  [`C_M_AXI4_RESP_WIDTH   -1:0]    m_axi_rresp,
    input  wire                                   m_axi_rlast,
    input  wire  [`C_M_AXI4_USER_WIDTH   -1:0]    m_axi_ruser,
    input  wire                                   m_axi_rvalid,
    output wire                                   m_axi_rready,

    input  wire  [`C_M_AXI4_ID_WIDTH     -1:0]    m_axi_bid,
    input  wire  [`C_M_AXI4_RESP_WIDTH   -1:0]    m_axi_bresp,
    input  wire  [`C_M_AXI4_USER_WIDTH   -1:0]    m_axi_buser,
    input  wire                                   m_axi_bvalid,
    output wire                                   m_axi_bready
);

wire [`MSG_HEADER_WIDTH-1:0] deser_header;
wire [PAYLOAD_SIZE-1:0] deser_data;
wire deser_val;
wire deser_rdy;

wire [`MSG_HEADER_WIDTH-1:0] read_req_header;
wire [BUFFER_ADDR_SIZE-1:0] read_req_id;
wire read_req_val;
wire read_req_rdy;
wire [PAYLOAD_SIZE-1:0] read_resp_data;
wire [BUFFER_ADDR_SIZE-1:0] read_resp_id;
wire read_resp_val;
wire read_resp_rdy;

wire write_req_val;
wire [`MSG_HEADER_WIDTH-1:0] write_req_header;
wire [BUFFER_ADDR_SIZE-1:0] write_req_id;
wire [PAYLOAD_SIZE-1:0] write_req_data;
wire write_req_rdy;
wire [BUFFER_ADDR_SIZE-1:0] write_resp_id;
wire write_resp_val;
wire write_resp_rdy;

wire [`MSG_HEADER_WIDTH-1:0] ser_header;
wire [PAYLOAD_SIZE-1:0] ser_data;
wire ser_val;
wire ser_rdy;


noc_axi4_bridge_buffer #  (
    .IN_FLIGHT_LIMIT (IN_FLIGHT_LIMIT        ),
    .BUFFER_ADDR_SIZE (BUFFER_ADDR_SIZE        ),
    .PAYLOAD_SIZE (PAYLOAD_SIZE)
) noc_axi4_bridge_buffer(
	.clk(clk),
	.rst_n(rst_n), 

	.deser_header(deser_header),
	.deser_data(deser_data),
	.deser_val(deser_val),
	.deser_rdy(deser_rdy),

	.read_req_header(read_req_header),
	.read_req_id(read_req_id),
	.read_req_val(read_req_val),
	.read_req_rdy(read_req_rdy),

	.read_resp_data(read_resp_data),
	.read_resp_id(read_resp_id),
	.read_resp_val(read_resp_val),
	.read_resp_rdy(read_resp_rdy),

	.write_req_header(write_req_header),
	.write_req_id(write_req_id),
	.write_req_data(write_req_data),
	.write_req_val(write_req_val), 
	.write_req_rdy(write_req_rdy),

	.write_resp_id(write_resp_id), 
	.write_resp_val(write_resp_val), 
	.write_resp_rdy(write_resp_rdy), 

	.ser_header(ser_header), 
	.ser_data(ser_data), 
	.ser_val(ser_val), 
	.ser_rdy(ser_rdy)
);

noc_axi4_bridge_deser #  (
    .MAX_PKT_LEN (MAX_PKT_LEN        ),
    .MAX_PKT_LEN_LOG (MAX_PKT_LEN_LOG        ),
    .PAYLOAD_SIZE (PAYLOAD_SIZE)
) noc_axi4_bridge_deser(
	.clk(clk), 
	.rst_n(rst_n), 

	.flit_in(flit_in), 
	.flit_in_val(flit_in_val), 
	.flit_in_rdy(flit_in_rdy), 

	.header_out(deser_header), 
	.data_out(deser_data), 
	.out_val(deser_val), 
	.out_rdy(deser_rdy)
);

noc_axi4_bridge_read #  (
    .IN_FLIGHT_LIMIT (IN_FLIGHT_LIMIT        ),
    .BUFFER_ADDR_SIZE (BUFFER_ADDR_SIZE        ),
    .PAYLOAD_SIZE (PAYLOAD_SIZE)
) noc_axi4_bridge_read (
	.clk(clk), 
	.rst_n(rst_n), 
	.uart_boot_en(uart_boot_en), 

	// NOC interface
    .req_val(read_req_val),
    .req_header(read_req_header),
    .req_id(read_req_id),
    .req_rdy(read_req_rdy),

    .resp_val(read_resp_val),
    .resp_id(read_resp_id),
    .resp_data(read_resp_data),
    .resp_rdy(read_resp_rdy),

    // axi read interface
	.m_axi_arid(m_axi_arid),
	.m_axi_araddr(m_axi_araddr),
	.m_axi_arlen(m_axi_arlen),
	.m_axi_arsize(m_axi_arsize),
	.m_axi_arburst(m_axi_arburst),
	.m_axi_arlock(m_axi_arlock),
	.m_axi_arcache(m_axi_arcache),
	.m_axi_arprot(m_axi_arprot), 
	.m_axi_arqos(m_axi_arqos),
	.m_axi_arregion(m_axi_arregion),
	.m_axi_aruser(m_axi_aruser),
	.m_axi_arvalid(m_axi_arvalid),
	.m_axi_arready(m_axi_arready),

	.m_axi_rid(m_axi_rid),
	.m_axi_rdata(m_axi_rdata),
	.m_axi_rresp(m_axi_rresp),
	.m_axi_rlast(m_axi_rlast), 
	.m_axi_ruser(m_axi_ruser),
	.m_axi_rvalid(m_axi_rvalid),
	.m_axi_rready(m_axi_rready)
);

noc_axi4_bridge_write #  (
    .IN_FLIGHT_LIMIT (IN_FLIGHT_LIMIT        ),
    .BUFFER_ADDR_SIZE (BUFFER_ADDR_SIZE        ),
    .PAYLOAD_SIZE (PAYLOAD_SIZE)
) noc_axi4_bridge_write (
    // Clock + Reset
    .clk(clk),
    .rst_n(rst_n),
    .uart_boot_en(uart_boot_en), 

    // NOC interface
    .req_val(write_req_val),
    .req_header(write_req_header),
    .req_id(write_req_id),
    .req_data(write_req_data),
    .req_rdy(write_req_rdy),

    .resp_val(write_resp_val),
    .resp_id(write_resp_id),
    .resp_rdy(write_resp_rdy),

    // AXI write interface
    .m_axi_awid(m_axi_awid),
    .m_axi_awaddr(m_axi_awaddr),
    .m_axi_awlen(m_axi_awlen),
    .m_axi_awsize(m_axi_awsize),
    .m_axi_awburst(m_axi_awburst),
    .m_axi_awlock(m_axi_awlock),
    .m_axi_awcache(m_axi_awcache),
    .m_axi_awprot(m_axi_awprot),
    .m_axi_awqos(m_axi_awqos),
    .m_axi_awregion(m_axi_awregion),
    .m_axi_awuser(m_axi_awuser),
    .m_axi_awvalid(m_axi_awvalid),
    .m_axi_awready(m_axi_awready),

    .m_axi_wid(m_axi_wid),
    .m_axi_wdata(m_axi_wdata),
    .m_axi_wstrb(m_axi_wstrb),
    .m_axi_wlast(m_axi_wlast),
    .m_axi_wuser(m_axi_wuser),
    .m_axi_wvalid(m_axi_wvalid),
    .m_axi_wready(m_axi_wready),

    .m_axi_bid(m_axi_bid),
    .m_axi_bresp(m_axi_bresp),
    .m_axi_buser(m_axi_buser),
    .m_axi_bvalid(m_axi_bvalid),
    .m_axi_bready(m_axi_bready)
);

noc_axi4_bridge_ser #  (
    .PAYLOAD_SIZE (PAYLOAD_SIZE), 
    .MAX_PKT_LEN (MAX_PKT_LEN)
) noc_axi4_bridge_ser(
	.clk(clk), 
	.rst_n(rst_n), 

	.header_in(ser_header), 
	.data_in(ser_data), 
	.in_val(ser_val), 
	.in_rdy(ser_rdy), 

	.flit_out(flit_out), 
	.flit_out_val(flit_out_val), 
	.flit_out_rdy(flit_out_rdy)
);

endmodule
