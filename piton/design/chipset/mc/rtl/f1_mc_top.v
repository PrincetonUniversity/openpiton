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

`include "define.tmp.h"
`include "mc_define.h"
`include "noc_axi4_bridge_define.vh"

module f1_mc_top (
    input                           sys_clk,       
    input                           sys_rst_n,     
    input                           mc_clk,

    input   [`NOC_DATA_WIDTH-1:0]   mc_flit_in_data,
    input                           mc_flit_in_val,
    output                          mc_flit_in_rdy,

    output  [`NOC_DATA_WIDTH-1:0]   mc_flit_out_data,
    output                          mc_flit_out_val,
    input                           mc_flit_out_rdy,

    input                           uart_boot_en,
    output                          init_calib_complete_out,
    output                          mc_ui_clk_sync_rst,

    // AXI Write Address Channel Signals
    output wire [`AXI4_ID_WIDTH     -1:0]    m_axi_awid,
    output wire [`AXI4_ADDR_WIDTH   -1:0]    m_axi_awaddr,
    output wire [`AXI4_LEN_WIDTH    -1:0]    m_axi_awlen,
    output wire [`AXI4_SIZE_WIDTH   -1:0]    m_axi_awsize,
    output wire [`AXI4_BURST_WIDTH  -1:0]    m_axi_awburst,
    output wire                                  m_axi_awlock,
    output wire [`AXI4_CACHE_WIDTH  -1:0]    m_axi_awcache,
    output wire [`AXI4_PROT_WIDTH   -1:0]    m_axi_awprot,
    output wire [`AXI4_QOS_WIDTH    -1:0]    m_axi_awqos,
    output wire [`AXI4_REGION_WIDTH -1:0]    m_axi_awregion,
    output wire [`AXI4_USER_WIDTH   -1:0]    m_axi_awuser,
    output wire                                  m_axi_awvalid,
    input  wire                                  m_axi_awready,

    // AXI Write Data Channel Signals
    output wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_wid,
    output wire  [`AXI4_DATA_WIDTH   -1:0]    m_axi_wdata,
    output wire  [`AXI4_STRB_WIDTH   -1:0]    m_axi_wstrb,
    output wire                                   m_axi_wlast,
    output wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_wuser,
    output wire                                   m_axi_wvalid,
    input  wire                                   m_axi_wready,

    // AXI Read Address Channel Signals
    output wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_arid,
    output wire  [`AXI4_ADDR_WIDTH   -1:0]    m_axi_araddr,
    output wire  [`AXI4_LEN_WIDTH    -1:0]    m_axi_arlen,
    output wire  [`AXI4_SIZE_WIDTH   -1:0]    m_axi_arsize,
    output wire  [`AXI4_BURST_WIDTH  -1:0]    m_axi_arburst,
    output wire                                   m_axi_arlock,
    output wire  [`AXI4_CACHE_WIDTH  -1:0]    m_axi_arcache,
    output wire  [`AXI4_PROT_WIDTH   -1:0]    m_axi_arprot,
    output wire  [`AXI4_QOS_WIDTH    -1:0]    m_axi_arqos,
    output wire  [`AXI4_REGION_WIDTH -1:0]    m_axi_arregion,
    output wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_aruser,
    output wire                                   m_axi_arvalid,
    input  wire                                   m_axi_arready,

    // AXI Read Data Channel Signals
    input  wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_rid,
    input  wire  [`AXI4_DATA_WIDTH   -1:0]    m_axi_rdata,
    input  wire  [`AXI4_RESP_WIDTH   -1:0]    m_axi_rresp,
    input  wire                                   m_axi_rlast,
    input  wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_ruser,
    input  wire                                   m_axi_rvalid,
    output wire                                   m_axi_rready,

    // AXI Write Response Channel Signals
    input  wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_bid,
    input  wire  [`AXI4_RESP_WIDTH   -1:0]    m_axi_bresp,
    input  wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_buser,
    input  wire                                   m_axi_bvalid,
    output wire                                   m_axi_bready, 

    input wire                                    ddr_ready

);


// Create mc_rst_n
reg pre_mc_rst_n;
reg mc_rst_n;

always @(negedge sys_rst_n or posedge mc_clk) begin 
    if(!sys_rst_n) begin
        pre_mc_rst_n <= 0;
        mc_rst_n <= 0;
    end else begin
        pre_mc_rst_n <= 1;
        mc_rst_n <= pre_mc_rst_n;
    end
end

wire                                trans_fifo_val;
wire    [`NOC_DATA_WIDTH-1:0]       trans_fifo_data;
wire                                trans_fifo_rdy;

wire                                fifo_trans_val;
wire    [`NOC_DATA_WIDTH-1:0]       fifo_trans_data;
wire                                fifo_trans_rdy;

wire [`AXI4_ID_WIDTH     -1:0]     core_axi_awid;
wire [`AXI4_ADDR_WIDTH   -1:0]     core_axi_awaddr;
wire [`AXI4_LEN_WIDTH    -1:0]     core_axi_awlen;
wire [`AXI4_SIZE_WIDTH   -1:0]     core_axi_awsize;
wire [`AXI4_BURST_WIDTH  -1:0]     core_axi_awburst;
wire                               core_axi_awlock;
wire [`AXI4_CACHE_WIDTH  -1:0]     core_axi_awcache;
wire [`AXI4_PROT_WIDTH   -1:0]     core_axi_awprot;
wire [`AXI4_QOS_WIDTH    -1:0]     core_axi_awqos;
wire [`AXI4_REGION_WIDTH -1:0]     core_axi_awregion;
wire [`AXI4_USER_WIDTH   -1:0]     core_axi_awuser;
wire                               core_axi_awvalid;
wire                               core_axi_awready;

wire  [`AXI4_ID_WIDTH     -1:0]    core_axi_wid;
wire  [`AXI4_DATA_WIDTH   -1:0]    core_axi_wdata;
wire  [`AXI4_STRB_WIDTH   -1:0]    core_axi_wstrb;
wire                               core_axi_wlast;
wire  [`AXI4_USER_WIDTH   -1:0]    core_axi_wuser;
wire                               core_axi_wvalid;
wire                               core_axi_wready;

wire  [`AXI4_ID_WIDTH     -1:0]    core_axi_arid;
wire  [`AXI4_ADDR_WIDTH   -1:0]    core_axi_araddr;
wire  [`AXI4_LEN_WIDTH    -1:0]    core_axi_arlen;
wire  [`AXI4_SIZE_WIDTH   -1:0]    core_axi_arsize;
wire  [`AXI4_BURST_WIDTH  -1:0]    core_axi_arburst;
wire                               core_axi_arlock;
wire  [`AXI4_CACHE_WIDTH  -1:0]    core_axi_arcache;
wire  [`AXI4_PROT_WIDTH   -1:0]    core_axi_arprot;
wire  [`AXI4_QOS_WIDTH    -1:0]    core_axi_arqos;
wire  [`AXI4_REGION_WIDTH -1:0]    core_axi_arregion;
wire  [`AXI4_USER_WIDTH   -1:0]    core_axi_aruser;
wire                               core_axi_arvalid;
wire                               core_axi_arready;

wire  [`AXI4_ID_WIDTH     -1:0]    core_axi_rid;
wire  [`AXI4_DATA_WIDTH   -1:0]    core_axi_rdata;
wire  [`AXI4_RESP_WIDTH   -1:0]    core_axi_rresp;
wire                               core_axi_rlast;
wire  [`AXI4_USER_WIDTH   -1:0]    core_axi_ruser;
wire                               core_axi_rvalid;
wire                               core_axi_rready;

wire  [`AXI4_ID_WIDTH     -1:0]    core_axi_bid;
wire  [`AXI4_RESP_WIDTH   -1:0]    core_axi_bresp;
wire  [`AXI4_USER_WIDTH   -1:0]    core_axi_buser;
wire                               core_axi_bvalid;
wire                               core_axi_bready;

`ifdef PITONSYS_MEM_ZEROER
wire [`AXI4_ID_WIDTH     -1:0]     zeroer_axi_awid;
wire [`AXI4_ADDR_WIDTH   -1:0]     zeroer_axi_awaddr;
wire [`AXI4_LEN_WIDTH    -1:0]     zeroer_axi_awlen;
wire [`AXI4_SIZE_WIDTH   -1:0]     zeroer_axi_awsize;
wire [`AXI4_BURST_WIDTH  -1:0]     zeroer_axi_awburst;
wire                               zeroer_axi_awlock;
wire [`AXI4_CACHE_WIDTH  -1:0]     zeroer_axi_awcache;
wire [`AXI4_PROT_WIDTH   -1:0]     zeroer_axi_awprot;
wire [`AXI4_QOS_WIDTH    -1:0]     zeroer_axi_awqos;
wire [`AXI4_REGION_WIDTH -1:0]     zeroer_axi_awregion;
wire [`AXI4_USER_WIDTH   -1:0]     zeroer_axi_awuser;
wire                               zeroer_axi_awvalid;
wire                               zeroer_axi_awready;

wire  [`AXI4_ID_WIDTH     -1:0]    zeroer_axi_wid;
wire  [`AXI4_DATA_WIDTH   -1:0]    zeroer_axi_wdata;
wire  [`AXI4_STRB_WIDTH   -1:0]    zeroer_axi_wstrb;
wire                               zeroer_axi_wlast;
wire  [`AXI4_USER_WIDTH   -1:0]    zeroer_axi_wuser;
wire                               zeroer_axi_wvalid;
wire                               zeroer_axi_wready;

wire  [`AXI4_ID_WIDTH     -1:0]    zeroer_axi_arid;
wire  [`AXI4_ADDR_WIDTH   -1:0]    zeroer_axi_araddr;
wire  [`AXI4_LEN_WIDTH    -1:0]    zeroer_axi_arlen;
wire  [`AXI4_SIZE_WIDTH   -1:0]    zeroer_axi_arsize;
wire  [`AXI4_BURST_WIDTH  -1:0]    zeroer_axi_arburst;
wire                               zeroer_axi_arlock;
wire  [`AXI4_CACHE_WIDTH  -1:0]    zeroer_axi_arcache;
wire  [`AXI4_PROT_WIDTH   -1:0]    zeroer_axi_arprot;
wire  [`AXI4_QOS_WIDTH    -1:0]    zeroer_axi_arqos;
wire  [`AXI4_REGION_WIDTH -1:0]    zeroer_axi_arregion;
wire  [`AXI4_USER_WIDTH   -1:0]    zeroer_axi_aruser;
wire                               zeroer_axi_arvalid;
wire                               zeroer_axi_arready;

wire  [`AXI4_ID_WIDTH     -1:0]    zeroer_axi_rid;
wire  [`AXI4_DATA_WIDTH   -1:0]    zeroer_axi_rdata;
wire  [`AXI4_RESP_WIDTH   -1:0]    zeroer_axi_rresp;
wire                               zeroer_axi_rlast;
wire  [`AXI4_USER_WIDTH   -1:0]    zeroer_axi_ruser;
wire                               zeroer_axi_rvalid;
wire                               zeroer_axi_rready;

wire  [`AXI4_ID_WIDTH     -1:0]    zeroer_axi_bid;
wire  [`AXI4_RESP_WIDTH   -1:0]    zeroer_axi_bresp;
wire  [`AXI4_USER_WIDTH   -1:0]    zeroer_axi_buser;
wire                               zeroer_axi_bvalid;
wire                               zeroer_axi_bready;

wire                               init_calib_complete_zero;
`endif

wire                               init_calib_complete;
wire                               noc_axi4_bridge_rst;
wire                               noc_axi4_bridge_init_done;


noc_bidir_afifo  f1_mig_afifo  (
    .clk_1           (sys_clk      ),
    .rst_1           (~sys_rst_n   ),

    .clk_2           (mc_clk            ),
    .rst_2           (~mc_rst_n         ),

    // CPU --> MIG
    .flit_in_val_1   (mc_flit_in_val    ),
    .flit_in_data_1  (mc_flit_in_data   ),
    .flit_in_rdy_1   (mc_flit_in_rdy    ),

    .flit_out_val_2  (fifo_trans_val    ),
    .flit_out_data_2 (fifo_trans_data   ),
    .flit_out_rdy_2  (fifo_trans_rdy    ),

    // MIG --> CPU
    .flit_in_val_2   (trans_fifo_val    ),
    .flit_in_data_2  (trans_fifo_data   ),
    .flit_in_rdy_2   (trans_fifo_rdy    ),

    .flit_out_val_1  (mc_flit_out_val   ),
    .flit_out_data_1 (mc_flit_out_data  ),
    .flit_out_rdy_1  (mc_flit_out_rdy   )
);


`ifdef PITONSYS_MEM_ZEROER
assign m_axi_awid = zeroer_axi_awid;
assign m_axi_awaddr = zeroer_axi_awaddr;
assign m_axi_awlen = zeroer_axi_awlen;
assign m_axi_awsize = zeroer_axi_awsize;
assign m_axi_awburst = zeroer_axi_awburst;
assign m_axi_awlock = zeroer_axi_awlock;
assign m_axi_awcache = zeroer_axi_awcache;
assign m_axi_awprot = zeroer_axi_awprot;
assign m_axi_awqos = zeroer_axi_awqos;
assign m_axi_awregion = zeroer_axi_awregion;
assign m_axi_awuser = zeroer_axi_awuser;
assign m_axi_awvalid = zeroer_axi_awvalid;
assign zeroer_axi_awready = m_axi_awready;

assign m_axi_wid = zeroer_axi_wid;
assign m_axi_wdata = zeroer_axi_wdata;
assign m_axi_wstrb = zeroer_axi_wstrb;
assign m_axi_wlast = zeroer_axi_wlast;
assign m_axi_wuser = zeroer_axi_wuser;
assign m_axi_wvalid = zeroer_axi_wvalid;
assign zeroer_axi_wready = m_axi_wready;

assign m_axi_arid = zeroer_axi_arid;
assign m_axi_araddr = zeroer_axi_araddr;
assign m_axi_arlen = zeroer_axi_arlen;
assign m_axi_arsize = zeroer_axi_arsize;
assign m_axi_arburst = zeroer_axi_arburst;
assign m_axi_arlock = zeroer_axi_arlock;
assign m_axi_arcache = zeroer_axi_arcache;
assign m_axi_arprot = zeroer_axi_arprot;
assign m_axi_arqos = zeroer_axi_arqos;
assign m_axi_arregion = zeroer_axi_arregion;
assign m_axi_aruser = zeroer_axi_aruser;
assign m_axi_arvalid = zeroer_axi_arvalid;
assign zeroer_axi_arready = m_axi_arready;

assign zeroer_axi_rid = m_axi_rid;
assign zeroer_axi_rdata = m_axi_rdata;
assign zeroer_axi_rresp = m_axi_rresp;
assign zeroer_axi_rlast = m_axi_rlast;
assign zeroer_axi_ruser = m_axi_ruser;
assign zeroer_axi_rvalid = m_axi_rvalid;
assign m_axi_rready = zeroer_axi_rready;

assign zeroer_axi_bid = m_axi_bid;
assign zeroer_axi_bresp = m_axi_bresp;
assign zeroer_axi_buser = m_axi_buser;
assign zeroer_axi_bvalid = m_axi_bvalid;
assign m_axi_bready = zeroer_axi_bready;

assign noc_axi4_bridge_rst       = ~mc_rst_n & ~init_calib_complete_zero;
assign noc_axi4_bridge_init_done = init_calib_complete_zero;
assign init_calib_complete_out  = init_calib_complete_zero;
`else

assign m_axi_awid = core_axi_awid;
assign m_axi_awaddr = core_axi_awaddr;
assign m_axi_awlen = core_axi_awlen;
assign m_axi_awsize = core_axi_awsize;
assign m_axi_awburst = core_axi_awburst;
assign m_axi_awlock = core_axi_awlock;
assign m_axi_awcache = core_axi_awcache;
assign m_axi_awprot = core_axi_awprot;
assign m_axi_awqos = core_axi_awqos;
assign m_axi_awregion = core_axi_awregion;
assign m_axi_awuser = core_axi_awuser;
assign m_axi_awvalid = core_axi_awvalid;
assign core_axi_awready = m_axi_awready;

assign m_axi_wid = core_axi_wid;
assign m_axi_wdata = core_axi_wdata;
assign m_axi_wstrb = core_axi_wstrb;
assign m_axi_wlast = core_axi_wlast;
assign m_axi_wuser = core_axi_wuser;
assign m_axi_wvalid = core_axi_wvalid;
assign core_axi_wready = m_axi_wready;

assign m_axi_arid = core_axi_arid;
assign m_axi_araddr = core_axi_araddr;
assign m_axi_arlen = core_axi_arlen;
assign m_axi_arsize = core_axi_arsize;
assign m_axi_arburst = core_axi_arburst;
assign m_axi_arlock = core_axi_arlock;
assign m_axi_arcache = core_axi_arcache;
assign m_axi_arprot = core_axi_arprot;
assign m_axi_arqos = core_axi_arqos;
assign m_axi_arregion = core_axi_arregion;
assign m_axi_aruser = core_axi_aruser;
assign m_axi_arvalid = core_axi_arvalid;
assign core_axi_arready = m_axi_arready;

assign core_axi_rid = m_axi_rid;
assign core_axi_rdata = m_axi_rdata;
assign core_axi_rresp = m_axi_rresp;
assign core_axi_rlast = m_axi_rlast;
assign core_axi_ruser = m_axi_ruser;
assign core_axi_rvalid = m_axi_rvalid;
assign m_axi_rready = core_axi_rready;

assign core_axi_bid = m_axi_bid;
assign core_axi_bresp = m_axi_bresp;
assign core_axi_buser = m_axi_buser;
assign core_axi_bvalid = m_axi_bvalid;
assign m_axi_bready = core_axi_bready;

assign noc_axi4_bridge_rst       = ~mc_rst_n;
assign noc_axi4_bridge_init_done = init_calib_complete;
assign init_calib_complete_out  = init_calib_complete;
`endif


noc_axi4_bridge noc_axi4_bridge  (
    .clk                (mc_clk                    ),  
    .rst_n              (~noc_axi4_bridge_rst      ), 
    .uart_boot_en       (uart_boot_en              ),
    .phy_init_done      (noc_axi4_bridge_init_done ),

    .src_bridge_vr_noc2_val(fifo_trans_val),
    .src_bridge_vr_noc2_dat(fifo_trans_data),
    .src_bridge_vr_noc2_rdy(fifo_trans_rdy),

    .bridge_dst_vr_noc3_val(trans_fifo_val),
    .bridge_dst_vr_noc3_dat(trans_fifo_data),
    .bridge_dst_vr_noc3_rdy(trans_fifo_rdy),

    .m_axi_awid(core_axi_awid),
    .m_axi_awaddr(core_axi_awaddr),
    .m_axi_awlen(core_axi_awlen),
    .m_axi_awsize(core_axi_awsize),
    .m_axi_awburst(core_axi_awburst),
    .m_axi_awlock(core_axi_awlock),
    .m_axi_awcache(core_axi_awcache),
    .m_axi_awprot(core_axi_awprot),
    .m_axi_awqos(core_axi_awqos),
    .m_axi_awregion(core_axi_awregion),
    .m_axi_awuser(core_axi_awuser),
    .m_axi_awvalid(core_axi_awvalid),
    .m_axi_awready(core_axi_awready),

    .m_axi_wid(core_axi_wid),
    .m_axi_wdata(core_axi_wdata),
    .m_axi_wstrb(core_axi_wstrb),
    .m_axi_wlast(core_axi_wlast),
    .m_axi_wuser(core_axi_wuser),
    .m_axi_wvalid(core_axi_wvalid),
    .m_axi_wready(core_axi_wready),

    .m_axi_bid(core_axi_bid),
    .m_axi_bresp(core_axi_bresp),
    .m_axi_buser(core_axi_buser),
    .m_axi_bvalid(core_axi_bvalid),
    .m_axi_bready(core_axi_bready),

    .m_axi_arid(core_axi_arid),
    .m_axi_araddr(core_axi_araddr),
    .m_axi_arlen(core_axi_arlen),
    .m_axi_arsize(core_axi_arsize),
    .m_axi_arburst(core_axi_arburst),
    .m_axi_arlock(core_axi_arlock),
    .m_axi_arcache(core_axi_arcache),
    .m_axi_arprot(core_axi_arprot),
    .m_axi_arqos(core_axi_arqos),
    .m_axi_arregion(core_axi_arregion),
    .m_axi_aruser(core_axi_aruser),
    .m_axi_arvalid(core_axi_arvalid),
    .m_axi_arready(core_axi_arready),

    .m_axi_rid(core_axi_rid),
    .m_axi_rdata(core_axi_rdata),
    .m_axi_rresp(core_axi_rresp),
    .m_axi_rlast(core_axi_rlast),
    .m_axi_ruser(core_axi_ruser),
    .m_axi_rvalid(core_axi_rvalid),
    .m_axi_rready(core_axi_rready)

);

`ifdef PITONSYS_MEM_ZEROER
axi4_zeroer axi4_zeroer(
  .clk                    (mc_clk),
  .rst_n                  (mc_rst_n),
  .init_calib_complete_in (init_calib_complete),
  .init_calib_complete_out(init_calib_complete_zero),

  .s_axi_awid             (core_axi_awid),
  .s_axi_awaddr           (core_axi_awaddr),
  .s_axi_awlen            (core_axi_awlen),
  .s_axi_awsize           (core_axi_awsize),
  .s_axi_awburst          (core_axi_awburst),
  .s_axi_awlock           (core_axi_awlock),
  .s_axi_awcache          (core_axi_awcache),
  .s_axi_awprot           (core_axi_awprot),
  .s_axi_awqos            (core_axi_awqos),
  .s_axi_awregion         (core_axi_awregion),
  .s_axi_awuser           (core_axi_awuser),
  .s_axi_awvalid          (core_axi_awvalid),
  .s_axi_awready          (core_axi_awready),

  .s_axi_wid              (core_axi_wid),
  .s_axi_wdata            (core_axi_wdata),
  .s_axi_wstrb            (core_axi_wstrb),
  .s_axi_wlast            (core_axi_wlast),
  .s_axi_wuser            (core_axi_wuser),
  .s_axi_wvalid           (core_axi_wvalid),
  .s_axi_wready           (core_axi_wready),

  .s_axi_arid             (core_axi_arid),
  .s_axi_araddr           (core_axi_araddr),
  .s_axi_arlen            (core_axi_arlen),
  .s_axi_arsize           (core_axi_arsize),
  .s_axi_arburst          (core_axi_arburst),
  .s_axi_arlock           (core_axi_arlock),
  .s_axi_arcache          (core_axi_arcache),
  .s_axi_arprot           (core_axi_arprot),
  .s_axi_arqos            (core_axi_arqos),
  .s_axi_arregion         (core_axi_arregion),
  .s_axi_aruser           (core_axi_aruser),
  .s_axi_arvalid          (core_axi_arvalid),
  .s_axi_arready          (core_axi_arready),

  .s_axi_rid              (core_axi_rid),
  .s_axi_rdata            (core_axi_rdata),
  .s_axi_rresp            (core_axi_rresp),
  .s_axi_rlast            (core_axi_rlast),
  .s_axi_ruser            (core_axi_ruser),
  .s_axi_rvalid           (core_axi_rvalid),
  .s_axi_rready           (core_axi_rready),

  .s_axi_bid              (core_axi_bid),
  .s_axi_bresp            (core_axi_bresp),
  .s_axi_buser            (core_axi_buser),
  .s_axi_bvalid           (core_axi_bvalid),
  .s_axi_bready           (core_axi_bready),


  .m_axi_awid             (zeroer_axi_awid),
  .m_axi_awaddr           (zeroer_axi_awaddr),
  .m_axi_awlen            (zeroer_axi_awlen),
  .m_axi_awsize           (zeroer_axi_awsize),
  .m_axi_awburst          (zeroer_axi_awburst),
  .m_axi_awlock           (zeroer_axi_awlock),
  .m_axi_awcache          (zeroer_axi_awcache),
  .m_axi_awprot           (zeroer_axi_awprot),
  .m_axi_awqos            (zeroer_axi_awqos),
  .m_axi_awregion         (zeroer_axi_awregion),
  .m_axi_awuser           (zeroer_axi_awuser),
  .m_axi_awvalid          (zeroer_axi_awvalid),
  .m_axi_awready          (zeroer_axi_awready),

  .m_axi_wid              (zeroer_axi_wid),
  .m_axi_wdata            (zeroer_axi_wdata),
  .m_axi_wstrb            (zeroer_axi_wstrb),
  .m_axi_wlast            (zeroer_axi_wlast),
  .m_axi_wuser            (zeroer_axi_wuser),
  .m_axi_wvalid           (zeroer_axi_wvalid),
  .m_axi_wready           (zeroer_axi_wready),

  .m_axi_arid             (zeroer_axi_arid),
  .m_axi_araddr           (zeroer_axi_araddr),
  .m_axi_arlen            (zeroer_axi_arlen),
  .m_axi_arsize           (zeroer_axi_arsize),
  .m_axi_arburst          (zeroer_axi_arburst),
  .m_axi_arlock           (zeroer_axi_arlock),
  .m_axi_arcache          (zeroer_axi_arcache),
  .m_axi_arprot           (zeroer_axi_arprot),
  .m_axi_arqos            (zeroer_axi_arqos),
  .m_axi_arregion         (zeroer_axi_arregion),
  .m_axi_aruser           (zeroer_axi_aruser),
  .m_axi_arvalid          (zeroer_axi_arvalid),
  .m_axi_arready          (zeroer_axi_arready),

  .m_axi_rid              (zeroer_axi_rid),
  .m_axi_rdata            (zeroer_axi_rdata),
  .m_axi_rresp            (zeroer_axi_rresp),
  .m_axi_rlast            (zeroer_axi_rlast),
  .m_axi_ruser            (zeroer_axi_ruser),
  .m_axi_rvalid           (zeroer_axi_rvalid),
  .m_axi_rready           (zeroer_axi_rready),

  .m_axi_bid              (zeroer_axi_bid),
  .m_axi_bresp            (zeroer_axi_bresp),
  .m_axi_buser            (zeroer_axi_buser),
  .m_axi_bvalid           (zeroer_axi_bvalid),
  .m_axi_bready           (zeroer_axi_bready)
);
`endif // PITONSYS_MEM_ZEROER

assign init_calib_complete = ddr_ready;
assign mc_ui_clk_sync_rst = ~mc_rst_n;


ila_0 noc_piton_bus (
    .clk(sys_clk), // input wire clk
    .probe0(mc_flit_in_val), // input wire [0:0]  probe0  
    .probe1(mc_flit_in_data), // input wire [63:0]  probe1 
    .probe2(mc_flit_in_rdy), // input wire [0:0]  probe2 
    .probe3(mc_flit_out_val), // input wire [0:0]  probe3 
    .probe4(mc_flit_out_data), // input wire [63:0]  probe4 
    .probe5(mc_flit_out_rdy) // input wire [0:0]  probe5
    );


endmodule 
