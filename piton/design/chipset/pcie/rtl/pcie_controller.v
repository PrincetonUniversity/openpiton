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

`include "axi_defines.vh"

module pcie_controller(
    input pcie_clk_p, 
    input pcie_clk_n, 
    input pcie_rst_n,
    output [15:0] pcie_txp, 
    output [15:0] pcie_txn, 
    input  [15:0] pcie_rxp, 
    input  [15:0] pcie_rxn, 

    output pcie_axi_aclk, 
    output pcie_axi_aresetn

`ifdef PITONSYS_PCIE_DMA
    ,
    output  [`AXI4_ID_WIDTH     -1:0]    pcie_dma_axi_awid,
    output  [`AXI4_ADDR_WIDTH   -1:0]    pcie_dma_axi_awaddr,
    output  [`AXI4_LEN_WIDTH    -1:0]    pcie_dma_axi_awlen,
    output  [`AXI4_SIZE_WIDTH   -1:0]    pcie_dma_axi_awsize,
    output  [`AXI4_BURST_WIDTH  -1:0]    pcie_dma_axi_awburst,
    output                               pcie_dma_axi_awlock,
    output  [`AXI4_CACHE_WIDTH  -1:0]    pcie_dma_axi_awcache,
    output  [`AXI4_PROT_WIDTH   -1:0]    pcie_dma_axi_awprot,
    output  [`AXI4_QOS_WIDTH    -1:0]    pcie_dma_axi_awqos,
    output  [`AXI4_REGION_WIDTH -1:0]    pcie_dma_axi_awregion,
    output  [`AXI4_USER_WIDTH   -1:0]    pcie_dma_axi_awuser,
    output                               pcie_dma_axi_awvalid,
    input                                pcie_dma_axi_awready,
    output  [`AXI4_ID_WIDTH     -1:0]    pcie_dma_axi_wid,
    output  [`AXI4_DATA_WIDTH   -1:0]    pcie_dma_axi_wdata,
    output  [`AXI4_STRB_WIDTH   -1:0]    pcie_dma_axi_wstrb,
    output                               pcie_dma_axi_wlast,
    output  [`AXI4_USER_WIDTH   -1:0]    pcie_dma_axi_wuser,
    output                               pcie_dma_axi_wvalid,
    input                                pcie_dma_axi_wready,
    output  [`AXI4_ID_WIDTH     -1:0]    pcie_dma_axi_arid,
    output  [`AXI4_ADDR_WIDTH   -1:0]    pcie_dma_axi_araddr,
    output  [`AXI4_LEN_WIDTH    -1:0]    pcie_dma_axi_arlen,
    output  [`AXI4_SIZE_WIDTH   -1:0]    pcie_dma_axi_arsize,
    output  [`AXI4_BURST_WIDTH  -1:0]    pcie_dma_axi_arburst,
    output                               pcie_dma_axi_arlock,
    output  [`AXI4_CACHE_WIDTH  -1:0]    pcie_dma_axi_arcache,
    output  [`AXI4_PROT_WIDTH   -1:0]    pcie_dma_axi_arprot,
    output  [`AXI4_QOS_WIDTH    -1:0]    pcie_dma_axi_arqos,
    output  [`AXI4_REGION_WIDTH -1:0]    pcie_dma_axi_arregion,
    output  [`AXI4_USER_WIDTH   -1:0]    pcie_dma_axi_aruser,
    output                               pcie_dma_axi_arvalid,
    input                                pcie_dma_axi_arready,
    input   [`AXI4_ID_WIDTH     -1:0]    pcie_dma_axi_rid,
    input   [`AXI4_DATA_WIDTH   -1:0]    pcie_dma_axi_rdata,
    input   [`AXI4_RESP_WIDTH   -1:0]    pcie_dma_axi_rresp,
    input                                pcie_dma_axi_rlast,
    input   [`AXI4_USER_WIDTH   -1:0]    pcie_dma_axi_ruser,
    input                                pcie_dma_axi_rvalid,
    output                               pcie_dma_axi_rready,
    input   [`AXI4_ID_WIDTH     -1:0]    pcie_dma_axi_bid,
    input   [`AXI4_RESP_WIDTH   -1:0]    pcie_dma_axi_bresp,
    input   [`AXI4_USER_WIDTH   -1:0]    pcie_dma_axi_buser,
    input                                pcie_dma_axi_bvalid,
    output                               pcie_dma_axi_bready
`endif

`ifdef PITONSYS_PCIE_CFG
    ,
    output [`AXIL_ADDR_WIDTH-1:0]        pcie_cfg_axi_awaddr, 
    output [`AXIL_PROT_WIDTH-1:0]        pcie_cfg_axi_awprot, 
    output                               pcie_cfg_axi_awvalid,
    input                                pcie_cfg_axi_awready, 
    output [`AXIL_DATA_WIDTH-1:0]        pcie_cfg_axi_wdata,
    output [`AXIL_STRB_WIDTH-1:0]        pcie_cfg_axi_wstrb,
    output                               pcie_cfg_axi_wvalid,
    input                                pcie_cfg_axi_wready,
    input                                pcie_cfg_axi_bvalid,
    input  [`AXIL_RESP_WIDTH-1:0]        pcie_cfg_axi_bresp,
    output                               pcie_cfg_axi_bready,
    output [`AXIL_ADDR_WIDTH-1:0]        pcie_cfg_axi_araddr,
    output [`AXIL_PROT_WIDTH-1:0]        pcie_cfg_axi_arprot,
    output                               pcie_cfg_axi_arvalid,
    input                                pcie_cfg_axi_arready,
    input  [`AXIL_DATA_WIDTH-1:0]        pcie_cfg_axi_rdata,
    input  [`AXIL_RESP_WIDTH-1:0]        pcie_cfg_axi_rresp,
    input                                pcie_cfg_axi_rvalid,
    output                               pcie_cfg_axi_rready
`endif
);


// Ref clock buffer
IBUFDS_GTE4 # (.REFCLK_HROW_CK_SEL(2'b00)) pcieclk_ibuf (.O(pcie_clk_gt), .ODIV2(pcie_clk), .I(pcie_clk_p), .CEB(1'b0), .IB(pcie_clk_n));

xdma_0 xdma (
  .sys_clk(pcie_clk),              // input output sys_clk
  .sys_clk_gt(pcie_clk_gt),        // input output sys_clk_gt
  .sys_rst_n(pcie_rst_n),          // input output sys_rst_n

  .user_lnk_up(),      // output output user_lnk_up
  .pci_exp_txp(pcie_txp),      // output output [15 : 0] pci_exp_txp
  .pci_exp_txn(pcie_txn),      // output output [15 : 0] pci_exp_txn
  .pci_exp_rxp(pcie_rxp),      // input output [15 : 0] pci_exp_rxp
  .pci_exp_rxn(pcie_rxn),      // input output [15 : 0] pci_exp_rxn
  .usr_irq_req(1'b0),      // input output [0 : 0] usr_irq_req
  .usr_irq_ack(),      // output output [0 : 0] usr_irq_ack

  .axi_aclk(pcie_axi_aclk),            // output output axi_aclk
  .axi_aresetn(pcie_axi_aresetn),      // output output axi_aresetn

`ifdef PITONSYS_PCIE_DMA
  .m_axi_awready(pcie_dma_axi_awready),  // input output m_axi_awready
  .m_axi_wready(pcie_dma_axi_wready),    // input output m_axi_wready
  .m_axi_bid(pcie_dma_axi_bid),          // input output [3 : 0] m_axi_bid
  .m_axi_bresp(pcie_dma_axi_bresp),      // input output [1 : 0] m_axi_bresp
  .m_axi_bvalid(pcie_dma_axi_bvalid),    // input output m_axi_bvalid
  .m_axi_arready(pcie_dma_axi_arready),  // input output m_axi_arready
  .m_axi_rid(pcie_dma_axi_rid),          // input output [3 : 0] m_axi_rid
  .m_axi_rdata(pcie_dma_axi_rdata),      // input output [511 : 0] m_axi_rdata
  .m_axi_rresp(pcie_dma_axi_rresp),      // input output [1 : 0] m_axi_rresp
  .m_axi_rlast(pcie_dma_axi_rlast),      // input output m_axi_rlast
  .m_axi_rvalid(pcie_dma_axi_rvalid),    // input output m_axi_rvalid
  .m_axi_awid(pcie_dma_axi_awid),        // output output [3 : 0] m_axi_awid
  .m_axi_awaddr(pcie_dma_axi_awaddr),    // output output [63 : 0] m_axi_awaddr
  .m_axi_awlen(pcie_dma_axi_awlen),      // output output [7 : 0] m_axi_awlen
  .m_axi_awsize(pcie_dma_axi_awsize),    // output output [2 : 0] m_axi_awsize
  .m_axi_awburst(pcie_dma_axi_awburst),  // output output [1 : 0] m_axi_awburst
  .m_axi_awprot(pcie_dma_axi_awprot),    // output output [2 : 0] m_axi_awprot
  .m_axi_awvalid(pcie_dma_axi_awvalid),  // output output m_axi_awvalid
  .m_axi_awlock(pcie_dma_axi_awlock),    // output output m_axi_awlock
  .m_axi_awcache(pcie_dma_axi_awcache),  // output output [3 : 0] m_axi_awcache
  .m_axi_wdata(pcie_dma_axi_wdata),      // output output [511 : 0] m_axi_wdata
  .m_axi_wstrb(pcie_dma_axi_wstrb),      // output output [63 : 0] m_axi_wstrb
  .m_axi_wlast(pcie_dma_axi_wlast),      // output output m_axi_wlast
  .m_axi_wvalid(pcie_dma_axi_wvalid),    // output output m_axi_wvalid
  .m_axi_bready(pcie_dma_axi_bready),    // output output m_axi_bready
  .m_axi_arid(pcie_dma_axi_arid),        // output output [3 : 0] m_axi_arid
  .m_axi_araddr(pcie_dma_axi_araddr),    // output output [63 : 0] m_axi_araddr
  .m_axi_arlen(pcie_dma_axi_arlen),      // output output [7 : 0] m_axi_arlen
  .m_axi_arsize(pcie_dma_axi_arsize),    // output output [2 : 0] m_axi_arsize
  .m_axi_arburst(pcie_dma_axi_arburst),  // output output [1 : 0] m_axi_arburst
  .m_axi_arprot(pcie_dma_axi_arprot),    // output output [2 : 0] m_axi_arprot
  .m_axi_arvalid(pcie_dma_axi_arvalid),  // output output m_axi_arvalid
  .m_axi_arlock(pcie_dma_axi_arlock),    // output output m_axi_arlock
  .m_axi_arcache(pcie_dma_axi_arcache),  // output output [3 : 0] m_axi_arcache
  .m_axi_rready(pcie_dma_axi_rready),    // output output m_axi_rready
`else // PITONSYS_PCIE_DMA
  .m_axi_awready(1'b0),
  .m_axi_wready(1'b0),
  .m_axi_arready(1'b0),
  .m_axi_rvalid(1'b0),
  .m_axi_bvalid(1'b0),
`endif // PITONSYS_PCIE_DMA

`ifdef PITONSYS_PCIE_CFG
  .m_axil_awaddr(pcie_cfg_axi_awaddr),    // output wire [31 : 0] m_axil_awaddr
  .m_axil_awprot(pcie_cfg_axi_awprot),    // output wire [2 : 0] m_axil_awprot
  .m_axil_awvalid(pcie_cfg_axi_awvalid),  // output wire m_axil_awvalid
  .m_axil_awready(pcie_cfg_axi_awready),  // input wire m_axil_awready
  .m_axil_wdata(pcie_cfg_axi_wdata),      // output wire [31 : 0] m_axil_wdata
  .m_axil_wstrb(pcie_cfg_axi_wstrb),      // output wire [3 : 0] m_axil_wstrb
  .m_axil_wvalid(pcie_cfg_axi_wvalid),    // output wire m_axil_wvalid
  .m_axil_wready(pcie_cfg_axi_wready),    // input wire m_axil_wready
  .m_axil_bvalid(pcie_cfg_axi_bvalid),    // input wire m_axil_bvalid
  .m_axil_bresp(pcie_cfg_axi_bresp),      // input wire [1 : 0] m_axil_bresp
  .m_axil_bready(pcie_cfg_axi_bready),    // output wire m_axil_bready
  .m_axil_araddr(pcie_cfg_axi_araddr),    // output wire [31 : 0] m_axil_araddr
  .m_axil_arprot(pcie_cfg_axi_arprot),    // output wire [2 : 0] m_axil_arprot
  .m_axil_arvalid(pcie_cfg_axi_arvalid),  // output wire m_axil_arvalid
  .m_axil_arready(pcie_cfg_axi_arready),  // input wire m_axil_arready
  .m_axil_rdata(pcie_cfg_axi_rdata),      // input wire [31 : 0] m_axil_rdata
  .m_axil_rresp(pcie_cfg_axi_rresp),      // input wire [1 : 0] m_axil_rresp
  .m_axil_rvalid(pcie_cfg_axi_rvalid),    // input wire m_axil_rvalid
  .m_axil_rready(pcie_cfg_axi_rready)     // output wire m_axil_rready
`else // PITONSYS_PCIE_CFG
  .m_axil_awready(1'b0),
  .m_axil_wready(1'b0),
  .m_axil_arready(1'b0),
  .m_axil_rvalid(1'b0),
  .m_axil_bvalid(1'b0),
`endif // PITONSYS_PCIE_CFG
);


endmodule