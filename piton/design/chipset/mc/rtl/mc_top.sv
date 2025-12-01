// Modified by Barcelona Supercomputing Center on March 3rd, 2022
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

module mc_top (
    input                           core_ref_clk,
`ifdef PITON_FPGA_MC_DDR3
    output                          mc_ui_clk_sync_rst,

    input   [`NOC_DATA_WIDTH-1:0]   mc_flit_in_data,
    input                           mc_flit_in_val,
    output                          mc_flit_in_rdy,

    output  [`NOC_DATA_WIDTH-1:0]   mc_flit_out_data,
    output                          mc_flit_out_val,
    input                           mc_flit_out_rdy,

  `ifdef PITON_EXTRA_MEMS
    input   [`PITON_EXTRA_MEMS * `NOC_DATA_WIDTH -1:0] mcx_flit_in_data,
    input   [`PITON_EXTRA_MEMS-1:0]                    mcx_flit_in_val,
    output  [`PITON_EXTRA_MEMS-1:0]                    mcx_flit_in_rdy,

    output  [`PITON_EXTRA_MEMS * `NOC_DATA_WIDTH -1:0] mcx_flit_out_data,
    output  [`PITON_EXTRA_MEMS-1:0]                    mcx_flit_out_val,
    input   [`PITON_EXTRA_MEMS-1:0]                    mcx_flit_out_rdy,
  `endif

    input                           uart_boot_en,
    
`ifdef PITONSYS_DDR4
    // directly feed in 250MHz ref clock
    `ifndef PITONSYS_MEEP
    input                           sys_clk_p,
    input                           sys_clk_n,

    `else
    input mc_clk,
    input mc_rstn,
    `endif
    output                          ddr_act_n,
    output [`DDR3_BG_WIDTH-1:0]     ddr_bg,
`else // PITONSYS_DDR4
    input                           sys_clk,

    output                          ddr_cas_n,
    output                          ddr_ras_n,
    output                          ddr_we_n,
`endif // PITONSYS_DDR4

    output [`DDR3_ADDR_WIDTH-1:0]   ddr_addr,
    output [`DDR3_BA_WIDTH-1:0]     ddr_ba,
    output [`DDR3_CK_WIDTH-1:0]     ddr_ck_n,
    output [`DDR3_CK_WIDTH-1:0]     ddr_ck_p,
    output [`DDR3_CKE_WIDTH-1:0]    ddr_cke,
    output                          ddr_reset_n,
    inout  [`DDR3_DQ_WIDTH-1:0]     ddr_dq,
    inout  [`DDR3_DQS_WIDTH-1:0]    ddr_dqs_n,
    inout  [`DDR3_DQS_WIDTH-1:0]    ddr_dqs_p,
`ifndef NEXYSVIDEO_BOARD
    output [`DDR3_CS_WIDTH-1:0]     ddr_cs_n,
`endif // endif NEXYSVIDEO_BOARD
`ifdef PITONSYS_DDR4
`ifdef PITONSYS_PCIE
    input  [15:0] pci_express_x16_rxn,
    input  [15:0] pci_express_x16_rxp,
    output [15:0] pci_express_x16_txn,
    output [15:0] pci_express_x16_txp,  
    output [ 7:0] pcie_gpio,      
    output [2*MAC_ADDR_WIDTH   -1:0] dst_src_mac_tx,
    input  [2*MAC_ADDR_WIDTH   -1:0] dst_src_mac_rx,
    input  [ETH_PAYLD_LEN_WIDTH-1:0] eth_payl_len_rx,
    input  [ETHFR_ID_WIDTH     -1:0] ethfr_id,
    input  [ETHFR_RETRY_TIME_WIDTH-1 :0] ethack_wait_time,
    input  [ETHFR_RETRIES_WIDTH   -1 :0] ethfr_retries,
    input  pcie_perstn,
    input  pcie_refclk_n,
    input  pcie_refclk_p,
`endif // PITONSYS_PCIE
`ifdef XUPP3R_BOARD
    output                          ddr_parity,
`elsif ALVEO_BOARD

  `ifdef PITONSYS_MEEP
    input                           init_calib_complete,
    // regular MC AXI bus
    output [`AXI4_ID_WIDTH     -1:0]    m_axi_awid,
    output [`AXI4_ADDR_WIDTH   -1:0]    m_axi_awaddr,
    output [`AXI4_LEN_WIDTH    -1:0]    m_axi_awlen,
    output [`AXI4_SIZE_WIDTH   -1:0]    m_axi_awsize,
    output [`AXI4_BURST_WIDTH  -1:0]    m_axi_awburst,
    output                              m_axi_awlock,
    output [`AXI4_CACHE_WIDTH  -1:0]    m_axi_awcache,
    output [`AXI4_PROT_WIDTH   -1:0]    m_axi_awprot,
    output [`AXI4_QOS_WIDTH    -1:0]    m_axi_awqos,
    output [`AXI4_REGION_WIDTH -1:0]    m_axi_awregion,
    output [`AXI4_USER_WIDTH   -1:0]    m_axi_awuser,
    output                              m_axi_awvalid,
    input                               m_axi_awready,

    output  [`AXI4_ID_WIDTH     -1:0]    m_axi_wid,
    output  [`AXI4_DATA_WIDTH   -1:0]    m_axi_wdata,
    output  [`AXI4_STRB_WIDTH   -1:0]    m_axi_wstrb,
    output                               m_axi_wlast,
    output  [`AXI4_USER_WIDTH   -1:0]    m_axi_wuser,
    output                               m_axi_wvalid,
    input                                m_axi_wready,

    output  [`AXI4_ID_WIDTH     -1:0]    m_axi_arid,
    output  [`AXI4_ADDR_WIDTH   -1:0]    m_axi_araddr,
    output  [`AXI4_LEN_WIDTH    -1:0]    m_axi_arlen,
    output  [`AXI4_SIZE_WIDTH   -1:0]    m_axi_arsize,
    output  [`AXI4_BURST_WIDTH  -1:0]    m_axi_arburst,
    output                               m_axi_arlock,
    output  [`AXI4_CACHE_WIDTH  -1:0]    m_axi_arcache,
    output  [`AXI4_PROT_WIDTH   -1:0]    m_axi_arprot,
    output  [`AXI4_QOS_WIDTH    -1:0]    m_axi_arqos,
    output  [`AXI4_REGION_WIDTH -1:0]    m_axi_arregion,
    output  [`AXI4_USER_WIDTH   -1:0]    m_axi_aruser,
    output                               m_axi_arvalid,
    input                                m_axi_arready,

    input   [`AXI4_ID_WIDTH     -1:0]    m_axi_rid,
    input   [`AXI4_DATA_WIDTH   -1:0]    m_axi_rdata,
    input   [`AXI4_RESP_WIDTH   -1:0]    m_axi_rresp,
    input                                m_axi_rlast,
    input   [`AXI4_USER_WIDTH   -1:0]    m_axi_ruser,
    input                                m_axi_rvalid,
    output                               m_axi_rready,

    input   [`AXI4_ID_WIDTH     -1:0]    m_axi_bid,
    input   [`AXI4_RESP_WIDTH   -1:0]    m_axi_bresp,
    input   [`AXI4_USER_WIDTH   -1:0]    m_axi_buser,
    input                                m_axi_bvalid,
    output                               m_axi_bready,

    `ifdef PITON_NONCACH_MEM 
    // AXI non-cacheable system memory
    output [`AXI4_ID_WIDTH     -1:0]    ncmem_axi_awid,
    output [`AXI4_ADDR_WIDTH   -1:0]    ncmem_axi_awaddr,
    output [`AXI4_LEN_WIDTH    -1:0]    ncmem_axi_awlen,
    output [`AXI4_SIZE_WIDTH   -1:0]    ncmem_axi_awsize,
    output [`AXI4_BURST_WIDTH  -1:0]    ncmem_axi_awburst,
    output                              ncmem_axi_awlock,
    output [`AXI4_CACHE_WIDTH  -1:0]    ncmem_axi_awcache,
    output [`AXI4_PROT_WIDTH   -1:0]    ncmem_axi_awprot,
    output [`AXI4_QOS_WIDTH    -1:0]    ncmem_axi_awqos,
    output [`AXI4_REGION_WIDTH -1:0]    ncmem_axi_awregion,
    output [`AXI4_USER_WIDTH   -1:0]    ncmem_axi_awuser,
    output                              ncmem_axi_awvalid,
    input                               ncmem_axi_awready,

    output  [`AXI4_ID_WIDTH     -1:0]    ncmem_axi_wid,
    output  [`AXI4_DATA_WIDTH   -1:0]    ncmem_axi_wdata,
    output  [`AXI4_STRB_WIDTH   -1:0]    ncmem_axi_wstrb,
    output                               ncmem_axi_wlast,
    output  [`AXI4_USER_WIDTH   -1:0]    ncmem_axi_wuser,
    output                               ncmem_axi_wvalid,
    input                                ncmem_axi_wready,

    output  [`AXI4_ID_WIDTH     -1:0]    ncmem_axi_arid,
    output  [`AXI4_ADDR_WIDTH   -1:0]    ncmem_axi_araddr,
    output  [`AXI4_LEN_WIDTH    -1:0]    ncmem_axi_arlen,
    output  [`AXI4_SIZE_WIDTH   -1:0]    ncmem_axi_arsize,
    output  [`AXI4_BURST_WIDTH  -1:0]    ncmem_axi_arburst,
    output                               ncmem_axi_arlock,
    output  [`AXI4_CACHE_WIDTH  -1:0]    ncmem_axi_arcache,
    output  [`AXI4_PROT_WIDTH   -1:0]    ncmem_axi_arprot,
    output  [`AXI4_QOS_WIDTH    -1:0]    ncmem_axi_arqos,
    output  [`AXI4_REGION_WIDTH -1:0]    ncmem_axi_arregion,
    output  [`AXI4_USER_WIDTH   -1:0]    ncmem_axi_aruser,
    output                               ncmem_axi_arvalid,
    input                                ncmem_axi_arready,

    input   [`AXI4_ID_WIDTH     -1:0]    ncmem_axi_rid,
    input   [`AXI4_DATA_WIDTH   -1:0]    ncmem_axi_rdata,
    input   [`AXI4_RESP_WIDTH   -1:0]    ncmem_axi_rresp,
    input                                ncmem_axi_rlast,
    input   [`AXI4_USER_WIDTH   -1:0]    ncmem_axi_ruser,
    input                                ncmem_axi_rvalid,
    output                               ncmem_axi_rready,

    input   [`AXI4_ID_WIDTH     -1:0]    ncmem_axi_bid,
    input   [`AXI4_RESP_WIDTH   -1:0]    ncmem_axi_bresp,
    input   [`AXI4_USER_WIDTH   -1:0]    ncmem_axi_buser,
    input                                ncmem_axi_bvalid,
    output                               ncmem_axi_bready,
    `endif // NON_CACHE_MEM

    `ifdef PITON_EXTRA_MEMS
      // vectorized multi-MC AXI bus
      output [`PITON_EXTRA_MEMS * `AXI4_ID_WIDTH     -1:0]   mcx_axi_awid,
      output [`PITON_EXTRA_MEMS * `AXI4_ADDR_WIDTH   -1:0]   mcx_axi_awaddr,
      output [`PITON_EXTRA_MEMS * `AXI4_LEN_WIDTH    -1:0]   mcx_axi_awlen,
      output [`PITON_EXTRA_MEMS * `AXI4_SIZE_WIDTH   -1:0]   mcx_axi_awsize,
      output [`PITON_EXTRA_MEMS * `AXI4_BURST_WIDTH  -1:0]   mcx_axi_awburst,
      output [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_awlock,
      output [`PITON_EXTRA_MEMS * `AXI4_CACHE_WIDTH  -1:0]   mcx_axi_awcache,
      output [`PITON_EXTRA_MEMS * `AXI4_PROT_WIDTH   -1:0]   mcx_axi_awprot,
      output [`PITON_EXTRA_MEMS * `AXI4_QOS_WIDTH    -1:0]   mcx_axi_awqos,
      output [`PITON_EXTRA_MEMS * `AXI4_REGION_WIDTH -1:0]   mcx_axi_awregion,
      output [`PITON_EXTRA_MEMS * `AXI4_USER_WIDTH   -1:0]   mcx_axi_awuser,
      output [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_awvalid,
      input  [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_awready,

      output [`PITON_EXTRA_MEMS * `AXI4_ID_WIDTH     -1:0]   mcx_axi_wid,
      output [`PITON_EXTRA_MEMS * `AXI4_DATA_WIDTH   -1:0]   mcx_axi_wdata,
      output [`PITON_EXTRA_MEMS * `AXI4_STRB_WIDTH   -1:0]   mcx_axi_wstrb,
      output [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_wlast,
      output [`PITON_EXTRA_MEMS * `AXI4_USER_WIDTH   -1:0]   mcx_axi_wuser,
      output [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_wvalid,
      input  [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_wready,

      output [`PITON_EXTRA_MEMS * `AXI4_ID_WIDTH     -1:0]   mcx_axi_arid,
      output [`PITON_EXTRA_MEMS * `AXI4_ADDR_WIDTH   -1:0]   mcx_axi_araddr,
      output [`PITON_EXTRA_MEMS * `AXI4_LEN_WIDTH    -1:0]   mcx_axi_arlen,
      output [`PITON_EXTRA_MEMS * `AXI4_SIZE_WIDTH   -1:0]   mcx_axi_arsize,
      output [`PITON_EXTRA_MEMS * `AXI4_BURST_WIDTH  -1:0]   mcx_axi_arburst,
      output [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_arlock,
      output [`PITON_EXTRA_MEMS * `AXI4_CACHE_WIDTH  -1:0]   mcx_axi_arcache,
      output [`PITON_EXTRA_MEMS * `AXI4_PROT_WIDTH   -1:0]   mcx_axi_arprot,
      output [`PITON_EXTRA_MEMS * `AXI4_QOS_WIDTH    -1:0]   mcx_axi_arqos,
      output [`PITON_EXTRA_MEMS * `AXI4_REGION_WIDTH -1:0]   mcx_axi_arregion,
      output [`PITON_EXTRA_MEMS * `AXI4_USER_WIDTH   -1:0]   mcx_axi_aruser,
      output [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_arvalid,
      input  [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_arready,

      input  [`PITON_EXTRA_MEMS * `AXI4_ID_WIDTH     -1:0]   mcx_axi_rid,
      input  [`PITON_EXTRA_MEMS * `AXI4_DATA_WIDTH   -1:0]   mcx_axi_rdata,
      input  [`PITON_EXTRA_MEMS * `AXI4_RESP_WIDTH   -1:0]   mcx_axi_rresp,
      input  [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_rlast,
      input  [`PITON_EXTRA_MEMS * `AXI4_USER_WIDTH   -1:0]   mcx_axi_ruser,
      input  [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_rvalid,
      output [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_rready,

      input  [`PITON_EXTRA_MEMS * `AXI4_ID_WIDTH     -1:0]   mcx_axi_bid,
      input  [`PITON_EXTRA_MEMS * `AXI4_RESP_WIDTH   -1:0]   mcx_axi_bresp,
      input  [`PITON_EXTRA_MEMS * `AXI4_USER_WIDTH   -1:0]   mcx_axi_buser,
      input  [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_bvalid,
      output [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_bready,
    `endif //`ifdef PITON_EXTRA_MEMS
  `elsif PITON_FPGA_ETH_CMAC //`ifdef PITONSYS_MEEP
    // Eth DMA master channels
    input   [`AXI4_ID_WIDTH     -1:0]     eth_sg_dma_awid,
    input   [`AXI4_ADDR_WIDTH   -1:0]     eth_sg_dma_awaddr,
    input   [`AXI4_LEN_WIDTH    -1:0]     eth_sg_dma_awlen,
    input   [`AXI4_SIZE_WIDTH   -1:0]     eth_sg_dma_awsize,
    input   [`AXI4_BURST_WIDTH  -1:0]     eth_sg_dma_awburst,
    input                                 eth_sg_dma_awlock,
    input   [`AXI4_CACHE_WIDTH  -1:0]     eth_sg_dma_awcache,
    input   [`AXI4_PROT_WIDTH   -1:0]     eth_sg_dma_awprot,
    input   [`AXI4_QOS_WIDTH    -1:0]     eth_sg_dma_awqos,
    input   [`AXI4_REGION_WIDTH -1:0]     eth_sg_dma_awregion,
    input   [`AXI4_USER_WIDTH   -1:0]     eth_sg_dma_awuser,
    input                                 eth_sg_dma_awvalid,
    output                                eth_sg_dma_awready,

    input    [`AXI4_ID_WIDTH     -1:0]    eth_sg_dma_wid,
    input    [`AXI4_DATA_WIDTH   -1:0]    eth_sg_dma_wdata,
    input    [`AXI4_STRB_WIDTH   -1:0]    eth_sg_dma_wstrb,
    input                                 eth_sg_dma_wlast,
    input    [`AXI4_USER_WIDTH   -1:0]    eth_sg_dma_wuser,
    input                                 eth_sg_dma_wvalid,
    output                                eth_sg_dma_wready,
     
    input    [`AXI4_ID_WIDTH     -1:0]    eth_sg_dma_arid,
    input    [`AXI4_ADDR_WIDTH   -1:0]    eth_sg_dma_araddr,
    input    [`AXI4_LEN_WIDTH    -1:0]    eth_sg_dma_arlen,
    input    [`AXI4_SIZE_WIDTH   -1:0]    eth_sg_dma_arsize,
    input    [`AXI4_BURST_WIDTH  -1:0]    eth_sg_dma_arburst,
    input                                 eth_sg_dma_arlock,
    input    [`AXI4_CACHE_WIDTH  -1:0]    eth_sg_dma_arcache,
    input    [`AXI4_PROT_WIDTH   -1:0]    eth_sg_dma_arprot,
    input    [`AXI4_QOS_WIDTH    -1:0]    eth_sg_dma_arqos,
    input    [`AXI4_REGION_WIDTH -1:0]    eth_sg_dma_arregion,
    input    [`AXI4_USER_WIDTH   -1:0]    eth_sg_dma_aruser,
    input                                 eth_sg_dma_arvalid,
    output                                eth_sg_dma_arready,
     
    output   [`AXI4_ID_WIDTH     -1:0]    eth_sg_dma_rid,
    output   [`AXI4_DATA_WIDTH   -1:0]    eth_sg_dma_rdata,
    output   [`AXI4_RESP_WIDTH   -1:0]    eth_sg_dma_rresp,
    output                                eth_sg_dma_rlast,
    output   [`AXI4_USER_WIDTH   -1:0]    eth_sg_dma_ruser,
    output                                eth_sg_dma_rvalid,
    input                                 eth_sg_dma_rready,
     
    output  [`AXI4_ID_WIDTH     -1:0]     eth_sg_dma_bid,
    output  [`AXI4_RESP_WIDTH   -1:0]     eth_sg_dma_bresp,
    output  [`AXI4_USER_WIDTH   -1:0]     eth_sg_dma_buser,
    output                                eth_sg_dma_bvalid,
    input                                 eth_sg_dma_bready,


    input   [`AXI4_ID_WIDTH     -1:0]     eth_tx_dma_awid,
    input   [`AXI4_ADDR_WIDTH   -1:0]     eth_tx_dma_awaddr,
    input   [`AXI4_LEN_WIDTH    -1:0]     eth_tx_dma_awlen,
    input   [`AXI4_SIZE_WIDTH   -1:0]     eth_tx_dma_awsize,
    input   [`AXI4_BURST_WIDTH  -1:0]     eth_tx_dma_awburst,
    input                                 eth_tx_dma_awlock,
    input   [`AXI4_CACHE_WIDTH  -1:0]     eth_tx_dma_awcache,
    input   [`AXI4_PROT_WIDTH   -1:0]     eth_tx_dma_awprot,
    input   [`AXI4_QOS_WIDTH    -1:0]     eth_tx_dma_awqos,
    input   [`AXI4_REGION_WIDTH -1:0]     eth_tx_dma_awregion,
    input   [`AXI4_USER_WIDTH   -1:0]     eth_tx_dma_awuser,
    input                                 eth_tx_dma_awvalid,
    output                                eth_tx_dma_awready,

    input    [`AXI4_ID_WIDTH     -1:0]    eth_tx_dma_wid,
    input    [`AXI4_DATA_WIDTH   -1:0]    eth_tx_dma_wdata,
    input    [`AXI4_STRB_WIDTH   -1:0]    eth_tx_dma_wstrb,
    input                                 eth_tx_dma_wlast,
    input    [`AXI4_USER_WIDTH   -1:0]    eth_tx_dma_wuser,
    input                                 eth_tx_dma_wvalid,
    output                                eth_tx_dma_wready,
     
    input    [`AXI4_ID_WIDTH     -1:0]    eth_tx_dma_arid,
    input    [`AXI4_ADDR_WIDTH   -1:0]    eth_tx_dma_araddr,
    input    [`AXI4_LEN_WIDTH    -1:0]    eth_tx_dma_arlen,
    input    [`AXI4_SIZE_WIDTH   -1:0]    eth_tx_dma_arsize,
    input    [`AXI4_BURST_WIDTH  -1:0]    eth_tx_dma_arburst,
    input                                 eth_tx_dma_arlock,
    input    [`AXI4_CACHE_WIDTH  -1:0]    eth_tx_dma_arcache,
    input    [`AXI4_PROT_WIDTH   -1:0]    eth_tx_dma_arprot,
    input    [`AXI4_QOS_WIDTH    -1:0]    eth_tx_dma_arqos,
    input    [`AXI4_REGION_WIDTH -1:0]    eth_tx_dma_arregion,
    input    [`AXI4_USER_WIDTH   -1:0]    eth_tx_dma_aruser,
    input                                 eth_tx_dma_arvalid,
    output                                eth_tx_dma_arready,
     
    output   [`AXI4_ID_WIDTH     -1:0]    eth_tx_dma_rid,
    output   [`AXI4_DATA_WIDTH   -1:0]    eth_tx_dma_rdata,
    output   [`AXI4_RESP_WIDTH   -1:0]    eth_tx_dma_rresp,
    output                                eth_tx_dma_rlast,
    output   [`AXI4_USER_WIDTH   -1:0]    eth_tx_dma_ruser,
    output                                eth_tx_dma_rvalid,
    input                                 eth_tx_dma_rready,
     
    output  [`AXI4_ID_WIDTH     -1:0]     eth_tx_dma_bid,
    output  [`AXI4_RESP_WIDTH   -1:0]     eth_tx_dma_bresp,
    output  [`AXI4_USER_WIDTH   -1:0]     eth_tx_dma_buser,
    output                                eth_tx_dma_bvalid,
    input                                 eth_tx_dma_bready,

    input                                 eth_tx_dma_clk,
    input                                 eth_tx_dma_rstn,


    input   [`AXI4_ID_WIDTH     -1:0]     eth_rx_dma_awid,
    input   [`AXI4_ADDR_WIDTH   -1:0]     eth_rx_dma_awaddr,
    input   [`AXI4_LEN_WIDTH    -1:0]     eth_rx_dma_awlen,
    input   [`AXI4_SIZE_WIDTH   -1:0]     eth_rx_dma_awsize,
    input   [`AXI4_BURST_WIDTH  -1:0]     eth_rx_dma_awburst,
    input                                 eth_rx_dma_awlock,
    input   [`AXI4_CACHE_WIDTH  -1:0]     eth_rx_dma_awcache,
    input   [`AXI4_PROT_WIDTH   -1:0]     eth_rx_dma_awprot,
    input   [`AXI4_QOS_WIDTH    -1:0]     eth_rx_dma_awqos,
    input   [`AXI4_REGION_WIDTH -1:0]     eth_rx_dma_awregion,
    input   [`AXI4_USER_WIDTH   -1:0]     eth_rx_dma_awuser,
    input                                 eth_rx_dma_awvalid,
    output                                eth_rx_dma_awready,

    input    [`AXI4_ID_WIDTH     -1:0]    eth_rx_dma_wid,
    input    [`AXI4_DATA_WIDTH   -1:0]    eth_rx_dma_wdata,
    input    [`AXI4_STRB_WIDTH   -1:0]    eth_rx_dma_wstrb,
    input                                 eth_rx_dma_wlast,
    input    [`AXI4_USER_WIDTH   -1:0]    eth_rx_dma_wuser,
    input                                 eth_rx_dma_wvalid,
    output                                eth_rx_dma_wready,
     
    input    [`AXI4_ID_WIDTH     -1:0]    eth_rx_dma_arid,
    input    [`AXI4_ADDR_WIDTH   -1:0]    eth_rx_dma_araddr,
    input    [`AXI4_LEN_WIDTH    -1:0]    eth_rx_dma_arlen,
    input    [`AXI4_SIZE_WIDTH   -1:0]    eth_rx_dma_arsize,
    input    [`AXI4_BURST_WIDTH  -1:0]    eth_rx_dma_arburst,
    input                                 eth_rx_dma_arlock,
    input    [`AXI4_CACHE_WIDTH  -1:0]    eth_rx_dma_arcache,
    input    [`AXI4_PROT_WIDTH   -1:0]    eth_rx_dma_arprot,
    input    [`AXI4_QOS_WIDTH    -1:0]    eth_rx_dma_arqos,
    input    [`AXI4_REGION_WIDTH -1:0]    eth_rx_dma_arregion,
    input    [`AXI4_USER_WIDTH   -1:0]    eth_rx_dma_aruser,
    input                                 eth_rx_dma_arvalid,
    output                                eth_rx_dma_arready,
     
    output   [`AXI4_ID_WIDTH     -1:0]    eth_rx_dma_rid,
    output   [`AXI4_DATA_WIDTH   -1:0]    eth_rx_dma_rdata,
    output   [`AXI4_RESP_WIDTH   -1:0]    eth_rx_dma_rresp,
    output                                eth_rx_dma_rlast,
    output   [`AXI4_USER_WIDTH   -1:0]    eth_rx_dma_ruser,
    output                                eth_rx_dma_rvalid,
    input                                 eth_rx_dma_rready,
     
    output  [`AXI4_ID_WIDTH     -1:0]     eth_rx_dma_bid,
    output  [`AXI4_RESP_WIDTH   -1:0]     eth_rx_dma_bresp,
    output  [`AXI4_USER_WIDTH   -1:0]     eth_rx_dma_buser,
    output                                eth_rx_dma_bvalid,
    input                                 eth_rx_dma_bready,

    input                                 eth_rx_dma_clk,
    input                                 eth_rx_dma_rstn,
  `endif //`ifdef PITONSYS_MEEP
    output                          ddr_parity,
    output                          hbm_cattrip,
`else
    inout [`DDR3_DM_WIDTH-1:0]      ddr_dm,
`endif // XUPP3R_BOARD
`else // PITONSYS_DDR4
    output [`DDR3_DM_WIDTH-1:0]     ddr_dm,
`endif // PITONSYS_DDR4
    output [`DDR3_ODT_WIDTH-1:0]    ddr_odt,

    output                          init_calib_complete_out,
`endif // ifdef PITON_FPGA_MC_DDR3
    output                          mc_axi_deadlock,

`ifdef PITON_NONCACH_MEM
    input   [`NOC_DATA_WIDTH-1:0]   ncmem_flit_in_data,
    input                           ncmem_flit_in_val ,
    output                          ncmem_flit_in_rdy ,

    output  [`NOC_DATA_WIDTH-1:0]   ncmem_flit_out_data,
    output                          ncmem_flit_out_val ,
    input                           ncmem_flit_out_rdy ,
`endif // `ifdef PITON_NONCACH_MEM

    input                           sys_rst_n
);

localparam HBM_WIDTH = 256;
localparam HBM_SIZE_LOG2 = 33; // 8GB
localparam HBM_MCS_LOG2  = 0;  //  0 to disable "interleaving", 5 for 32 MC channels to participate in "interleaving"
localparam HBM_MCS_ADDR  = 9;  // "interleaving" address position of MC channels in AXI address

`ifdef PITON_NONCACH_MEM 
`ifndef PITONSYS_MEEP
 wire [`AXI4_ID_WIDTH     -1:0]     ncmem_axi_awid;
 wire [`AXI4_ADDR_WIDTH   -1:0]     ncmem_axi_awaddr;
 wire [`AXI4_LEN_WIDTH    -1:0]     ncmem_axi_awlen;
 wire [`AXI4_SIZE_WIDTH   -1:0]     ncmem_axi_awsize;
 wire [`AXI4_BURST_WIDTH  -1:0]     ncmem_axi_awburst;
 wire                               ncmem_axi_awlock;
 wire [`AXI4_CACHE_WIDTH  -1:0]     ncmem_axi_awcache;
 wire [`AXI4_PROT_WIDTH   -1:0]     ncmem_axi_awprot;
 wire [`AXI4_QOS_WIDTH    -1:0]     ncmem_axi_awqos;
 wire [`AXI4_REGION_WIDTH -1:0]     ncmem_axi_awregion;
 wire [`AXI4_USER_WIDTH   -1:0]     ncmem_axi_awuser;
 wire                               ncmem_axi_awvalid;
 wire                               ncmem_axi_awready;

 wire  [`AXI4_ID_WIDTH     -1:0]    ncmem_axi_wid;
 wire  [`AXI4_DATA_WIDTH   -1:0]    ncmem_axi_wdata;
 wire  [`AXI4_STRB_WIDTH   -1:0]    ncmem_axi_wstrb;
 wire                               ncmem_axi_wlast;
 wire  [`AXI4_USER_WIDTH   -1:0]    ncmem_axi_wuser;
 wire                               ncmem_axi_wvalid;
 wire                               ncmem_axi_wready;

 wire  [`AXI4_ID_WIDTH     -1:0]    ncmem_axi_arid;
 wire  [`AXI4_ADDR_WIDTH   -1:0]    ncmem_axi_araddr;
 wire  [`AXI4_LEN_WIDTH    -1:0]    ncmem_axi_arlen;
 wire  [`AXI4_SIZE_WIDTH   -1:0]    ncmem_axi_arsize;
 wire  [`AXI4_BURST_WIDTH  -1:0]    ncmem_axi_arburst;
 wire                               ncmem_axi_arlock;
 wire  [`AXI4_CACHE_WIDTH  -1:0]    ncmem_axi_arcache;
 wire  [`AXI4_PROT_WIDTH   -1:0]    ncmem_axi_arprot;
 wire  [`AXI4_QOS_WIDTH    -1:0]    ncmem_axi_arqos;
 wire  [`AXI4_REGION_WIDTH -1:0]    ncmem_axi_arregion;
 wire  [`AXI4_USER_WIDTH   -1:0]    ncmem_axi_aruser;
 wire                               ncmem_axi_arvalid;
 wire                               ncmem_axi_arready;

 wire  [`AXI4_ID_WIDTH     -1:0]    ncmem_axi_rid;
 wire  [`AXI4_DATA_WIDTH   -1:0]    ncmem_axi_rdata;
 wire  [`AXI4_RESP_WIDTH   -1:0]    ncmem_axi_rresp;
 wire                               ncmem_axi_rlast;
 wire  [`AXI4_USER_WIDTH   -1:0]    ncmem_axi_ruser;
 wire                               ncmem_axi_rvalid;
 wire                               ncmem_axi_rready;

 wire  [`AXI4_ID_WIDTH     -1:0]    ncmem_axi_bid;
 wire  [`AXI4_RESP_WIDTH   -1:0]    ncmem_axi_bresp;
 wire  [`AXI4_USER_WIDTH   -1:0]    ncmem_axi_buser;
 wire                               ncmem_axi_bvalid;
 wire                               ncmem_axi_bready;
`endif // `ifndef PITONSYS_MEEP

 noc_axi4_bridge #(
  `ifdef PITON_RV64_PLATFORM
    .SWAP_ENDIANESS (1),
  `endif
  `ifdef PITON_FPGA_MC_HBM
    .AXI4_DAT_WIDTH_USED (HBM_WIDTH),
    .ADDR_SWAP_LBITS(HBM_MCS_LOG2),
    .ADDR_SWAP_MSB  (HBM_SIZE_LOG2),
    .ADDR_SWAP_LSB  (HBM_MCS_ADDR),
  `endif
  .NUM_REQ_OUTSTANDING_LOG2 ($clog2(`PITON_NUM_TILES * 4))
 ) noc_axi4_bridge_ncmem (
    .clk                (core_ref_clk),  
    .rst_n              (sys_rst_n), 
    .uart_boot_en       (1'b0),
    .phy_init_done      (sys_rst_n),
  `ifndef PITON_FPGA_MC_DDR3
    .axi_id_deadlock    (mc_axi_deadlock), // taking "alarm" signal from NCMEM AXI for simulation (SDRAM is absent)
  `endif

    .src_bridge_vr_noc2_val(ncmem_flit_in_val),
    .src_bridge_vr_noc2_dat(ncmem_flit_in_data),
    .src_bridge_vr_noc2_rdy(ncmem_flit_in_rdy),

    .bridge_dst_vr_noc3_val(ncmem_flit_out_val),
    .bridge_dst_vr_noc3_dat(ncmem_flit_out_data),
    .bridge_dst_vr_noc3_rdy(ncmem_flit_out_rdy),

    .m_axi_awid(ncmem_axi_awid),
    .m_axi_awaddr(ncmem_axi_awaddr),
    .m_axi_awlen(ncmem_axi_awlen),
    .m_axi_awsize(ncmem_axi_awsize),
    .m_axi_awburst(ncmem_axi_awburst),
    .m_axi_awlock(ncmem_axi_awlock),
    .m_axi_awcache(ncmem_axi_awcache),
    .m_axi_awprot(ncmem_axi_awprot),
    .m_axi_awqos(ncmem_axi_awqos),
    .m_axi_awregion(ncmem_axi_awregion),
    .m_axi_awuser(ncmem_axi_awuser),
    .m_axi_awvalid(ncmem_axi_awvalid),
    .m_axi_awready(ncmem_axi_awready),

    .m_axi_wid(ncmem_axi_wid),
    .m_axi_wdata(ncmem_axi_wdata),
    .m_axi_wstrb(ncmem_axi_wstrb),
    .m_axi_wlast(ncmem_axi_wlast),
    .m_axi_wuser(ncmem_axi_wuser),
    .m_axi_wvalid(ncmem_axi_wvalid),
    .m_axi_wready(ncmem_axi_wready),

    .m_axi_bid(ncmem_axi_bid),
    .m_axi_bresp(ncmem_axi_bresp),
    .m_axi_buser(ncmem_axi_buser),
    .m_axi_bvalid(ncmem_axi_bvalid),
    .m_axi_bready(ncmem_axi_bready),

    .m_axi_arid(ncmem_axi_arid),
    .m_axi_araddr(ncmem_axi_araddr),
    .m_axi_arlen(ncmem_axi_arlen),
    .m_axi_arsize(ncmem_axi_arsize),
    .m_axi_arburst(ncmem_axi_arburst),
    .m_axi_arlock(ncmem_axi_arlock),
    .m_axi_arcache(ncmem_axi_arcache),
    .m_axi_arprot(ncmem_axi_arprot),
    .m_axi_arqos(ncmem_axi_arqos),
    .m_axi_arregion(ncmem_axi_arregion),
    .m_axi_aruser(ncmem_axi_aruser),
    .m_axi_arvalid(ncmem_axi_arvalid),
    .m_axi_arready(ncmem_axi_arready),

    .m_axi_rid(ncmem_axi_rid),
    .m_axi_rdata(ncmem_axi_rdata),
    .m_axi_rresp(ncmem_axi_rresp),
    .m_axi_rlast(ncmem_axi_rlast),
    .m_axi_ruser(ncmem_axi_ruser),
    .m_axi_rvalid(ncmem_axi_rvalid),
    .m_axi_rready(ncmem_axi_rready)
);

`ifndef PITON_FPGA_MC_DDR3
  // NCMEM AXI stub for simulation
  assign ncmem_axi_awready = 1'b1;
  assign ncmem_axi_wready  = 1'b1;
  assign ncmem_axi_arready = 1'b1;

  localparam RVALID_DELAY_LOG = 0;
  reg [RVALID_DELAY_LOG:0] ncmem_axi_rvalid_cnt;
  reg ncmem_axi_rvalid_en;
  reg [`AXI4_ID_WIDTH-1:0] ncmem_axi_rid_reg;
  always @(posedge core_ref_clk)
    if (~sys_rst_n) begin
      ncmem_axi_rvalid_cnt <= {(RVALID_DELAY_LOG+1){1'b0}};
      ncmem_axi_rvalid_en <= 1'b0;
      ncmem_axi_rid_reg <= `AXI4_ID_WIDTH'h0;
    end
    else begin 
           if (ncmem_axi_rvalid) begin
             if (ncmem_axi_rready) begin
               ncmem_axi_rvalid_cnt <= {(RVALID_DELAY_LOG+1){1'b0}};
               ncmem_axi_rvalid_en <= 1'b0;
             end
           end
           else if (ncmem_axi_rvalid_en) ncmem_axi_rvalid_cnt <= ncmem_axi_rvalid_cnt+1;
           if (ncmem_axi_arvalid) begin
             ncmem_axi_rvalid_cnt <= {{RVALID_DELAY_LOG{1'b0}}, 1'b1};
             ncmem_axi_rvalid_en <= 1'b1;
             ncmem_axi_rid_reg <= ncmem_axi_arid;
           end
    end
  assign ncmem_axi_rvalid = ncmem_axi_rvalid_cnt[RVALID_DELAY_LOG];
  assign ncmem_axi_rid    = ncmem_axi_rid_reg;
  assign ncmem_axi_rdata  = {(`AXI4_DATA_WIDTH/64/2+1){64'hDEADBEEFFEEDC0DE}};
  assign ncmem_axi_rresp  = 2'h0;
  assign ncmem_axi_rlast  = ncmem_axi_rvalid;
  assign ncmem_axi_ruser  = `AXI4_USER_WIDTH'h0;

  localparam BVALID_DELAY_LOG = 0;
  reg [BVALID_DELAY_LOG:0] ncmem_axi_bvalid_cnt;
  reg ncmem_axi_bvalid_en;
  reg [`AXI4_ID_WIDTH-1:0] ncmem_axi_bid_reg;
  always @(posedge core_ref_clk)
    if (~sys_rst_n) begin
      ncmem_axi_bvalid_cnt <= {(BVALID_DELAY_LOG+1){1'b0}};
      ncmem_axi_bvalid_en <= 1'b0;
      ncmem_axi_bid_reg <= `AXI4_ID_WIDTH'h0;
    end
    else begin
           if (ncmem_axi_bvalid) begin
             if (ncmem_axi_bready) begin
               ncmem_axi_bvalid_cnt <= {(BVALID_DELAY_LOG+1){1'b0}};
               ncmem_axi_bvalid_en <= 1'b0;
             end
           end
           else if (ncmem_axi_bvalid_en) ncmem_axi_bvalid_cnt <= ncmem_axi_bvalid_cnt+1;
           if (ncmem_axi_wvalid & ncmem_axi_wlast) begin
             ncmem_axi_bvalid_cnt <= {{BVALID_DELAY_LOG{1'b0}}, 1'b1};
             ncmem_axi_bvalid_en <= 1'b1;
             ncmem_axi_bid_reg <= ncmem_axi_wid;
           end
    end
  assign ncmem_axi_bvalid  = ncmem_axi_bvalid_cnt[BVALID_DELAY_LOG];
  assign ncmem_axi_bid     = ncmem_axi_bid_reg;
  assign ncmem_axi_bresp   = 2'h0;
  assign ncmem_axi_buser   = `AXI4_USER_WIDTH'h0;

`endif // `ifndef PITON_FPGA_MC_DDR3
`endif // `ifdef PITON_NONCACH_MEM 


`ifdef PITON_FPGA_MC_DDR3

reg     [31:0]                      delay_cnt;
reg                                 ui_clk_syn_rst_delayed;
`ifndef PITONSYS_MEEP
wire                                init_calib_complete;
`endif
wire                                afifo_rst_1;
wire                                afifo_rst_2;

`ifndef PITONSYS_AXI4_MEM
 wire                               app_en;
 wire    [`MIG_APP_CMD_WIDTH-1 :0]  app_cmd;
 wire    [`MIG_APP_ADDR_WIDTH-1:0]  app_addr;
 wire                               app_rdy;
 wire                               app_wdf_wren;
 wire    [`MIG_APP_DATA_WIDTH-1:0]  app_wdf_data;
 wire    [`MIG_APP_MASK_WIDTH-1:0]  app_wdf_mask;
 wire                               app_wdf_rdy;
 wire                               app_wdf_end;
 wire    [`MIG_APP_DATA_WIDTH-1:0]  app_rd_data;
 wire                               app_rd_data_end;
 wire                               app_rd_data_valid;

 wire                               core_app_en;
 wire    [`MIG_APP_CMD_WIDTH-1 :0]  core_app_cmd;
 wire    [`MIG_APP_ADDR_WIDTH-1:0]  core_app_addr;
 wire                               core_app_rdy;
 wire                               core_app_wdf_wren;
 wire    [`MIG_APP_DATA_WIDTH-1:0]  core_app_wdf_data;
 wire    [`MIG_APP_MASK_WIDTH-1:0]  core_app_wdf_mask;
 wire                               core_app_wdf_rdy;
 wire                               core_app_wdf_end;
 wire    [`MIG_APP_DATA_WIDTH-1:0]  core_app_rd_data;
 wire                               core_app_rd_data_end;
 wire                               core_app_rd_data_valid;

`ifdef PITONSYS_MEM_ZEROER
wire                                zero_app_en;
wire    [`MIG_APP_CMD_WIDTH-1 :0]   zero_app_cmd;
wire    [`MIG_APP_ADDR_WIDTH-1:0]   zero_app_addr;
wire                                zero_app_wdf_wren;
wire    [`MIG_APP_DATA_WIDTH-1:0]   zero_app_wdf_data;
wire    [`MIG_APP_MASK_WIDTH-1:0]   zero_app_wdf_mask;
wire                                zero_app_wdf_end;
wire                                init_calib_complete_zero;
`endif

wire                                noc_mig_bridge_rst;
wire                                noc_mig_bridge_init_done;

`else // PITONSYS_AXI4_MEM

// AXI4 interface
`ifndef PITONSYS_MEEP
wire [`AXI4_ID_WIDTH     -1:0]     m_axi_awid;
wire [`AXI4_ADDR_WIDTH   -1:0]     m_axi_awaddr;
wire [`AXI4_LEN_WIDTH    -1:0]     m_axi_awlen;
wire [`AXI4_SIZE_WIDTH   -1:0]     m_axi_awsize;
wire [`AXI4_BURST_WIDTH  -1:0]     m_axi_awburst;
wire                               m_axi_awlock;
wire [`AXI4_CACHE_WIDTH  -1:0]     m_axi_awcache;
wire [`AXI4_PROT_WIDTH   -1:0]     m_axi_awprot;
wire [`AXI4_QOS_WIDTH    -1:0]     m_axi_awqos;
wire [`AXI4_REGION_WIDTH -1:0]     m_axi_awregion;
wire [`AXI4_USER_WIDTH   -1:0]     m_axi_awuser;
wire                               m_axi_awvalid;
wire                               m_axi_awready;

wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_wid;
wire  [`AXI4_DATA_WIDTH   -1:0]    m_axi_wdata;
wire  [`AXI4_STRB_WIDTH   -1:0]    m_axi_wstrb;
wire                               m_axi_wlast;
wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_wuser;
wire                               m_axi_wvalid;
wire                               m_axi_wready;

wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_arid;
wire  [`AXI4_ADDR_WIDTH   -1:0]    m_axi_araddr;
wire  [`AXI4_LEN_WIDTH    -1:0]    m_axi_arlen;
wire  [`AXI4_SIZE_WIDTH   -1:0]    m_axi_arsize;
wire  [`AXI4_BURST_WIDTH  -1:0]    m_axi_arburst;
wire                               m_axi_arlock;
wire  [`AXI4_CACHE_WIDTH  -1:0]    m_axi_arcache;
wire  [`AXI4_PROT_WIDTH   -1:0]    m_axi_arprot;
wire  [`AXI4_QOS_WIDTH    -1:0]    m_axi_arqos;
wire  [`AXI4_REGION_WIDTH -1:0]    m_axi_arregion;
wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_aruser;
wire                               m_axi_arvalid;
wire                               m_axi_arready;

wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_rid;
wire  [`AXI4_DATA_WIDTH   -1:0]    m_axi_rdata;
wire  [`AXI4_RESP_WIDTH   -1:0]    m_axi_rresp;
wire                               m_axi_rlast;
wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_ruser;
wire                               m_axi_rvalid;
wire                               m_axi_rready;

wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_bid;
wire  [`AXI4_RESP_WIDTH   -1:0]    m_axi_bresp;
wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_buser;
wire                               m_axi_bvalid;
wire                               m_axi_bready;
`endif

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

wire                               noc_axi4_bridge_rst;
wire                               noc_axi4_bridge_init_done;

`endif // PITONSYS_AXI4_MEM

wire                                app_sr_req;
wire                                app_ref_req;
wire                                app_zq_req;
wire                                app_sr_active;
wire                                app_ref_ack;
wire                                app_zq_ack;
wire                                ui_clk;
wire                                ui_clk_sync_rst;


wire                                trans_fifo_val;
wire    [`NOC_DATA_WIDTH-1:0]       trans_fifo_data;
wire                                trans_fifo_rdy;

wire                                fifo_trans_val;
wire    [`NOC_DATA_WIDTH-1:0]       fifo_trans_data;
wire                                fifo_trans_rdy;

reg                                 afifo_ui_rst_r;
reg                                 afifo_ui_rst_r_r;

reg                                 ui_clk_sync_rst_r;
reg                                 ui_clk_sync_rst_r_r;

// needed for correct rst of async fifo
always @(posedge core_ref_clk) begin
    if (~sys_rst_n)
        delay_cnt <= 32'h1ff;
    else begin
        delay_cnt <= (delay_cnt != 0) & ~ui_clk_sync_rst_r_r ? delay_cnt - 1 : delay_cnt;
    end
end

always @(posedge core_ref_clk) begin
    if (ui_clk_sync_rst_r_r)
        ui_clk_syn_rst_delayed <= 1'b1;
    else begin
        ui_clk_syn_rst_delayed <= delay_cnt != 0;
    end
end

assign mc_ui_clk_sync_rst   = ui_clk_syn_rst_delayed;

assign afifo_rst_1 = ui_clk_syn_rst_delayed;


always @(posedge ui_clk) begin
    afifo_ui_rst_r <= afifo_rst_1;
    afifo_ui_rst_r_r <= afifo_ui_rst_r;
end


always @(posedge core_ref_clk) begin
    ui_clk_sync_rst_r   <= ui_clk_sync_rst;
    ui_clk_sync_rst_r_r <= ui_clk_sync_rst_r;
end

assign afifo_rst_2 = afifo_ui_rst_r_r | ui_clk_sync_rst;

// TODO: zeroed based on example simulation of MIG7
// not used for DDR4 MIG
assign app_ref_req = 1'b0;
assign app_sr_req = 1'b0;
assign app_zq_req = 1'b0;

`ifndef PITONSYS_AXI4_MEM
`ifdef PITONSYS_MEM_ZEROER
assign app_en                   = zero_app_en;
assign app_cmd                  = zero_app_cmd;
assign app_addr                 = zero_app_addr;
assign app_wdf_wren             = zero_app_wdf_wren;
assign app_wdf_data             = zero_app_wdf_data;
assign app_wdf_mask             = zero_app_wdf_mask;
assign app_wdf_end              = zero_app_wdf_end;
assign noc_mig_bridge_rst       = ui_clk_sync_rst & ~init_calib_complete_zero;
assign noc_mig_bridge_init_done = init_calib_complete_zero;
assign init_calib_complete_out  = init_calib_complete_zero & ~ui_clk_syn_rst_delayed;
`else
assign app_en                   = core_app_en;
assign app_cmd                  = core_app_cmd;
assign app_addr                 = core_app_addr;
assign app_wdf_wren             = core_app_wdf_wren;
assign app_wdf_data             = core_app_wdf_data;
assign app_wdf_mask             = core_app_wdf_mask;
assign app_wdf_end              = core_app_wdf_end;
assign noc_mig_bridge_rst       = ui_clk_sync_rst;
assign noc_mig_bridge_init_done = init_calib_complete;
assign init_calib_complete_out  = init_calib_complete & ~ui_clk_syn_rst_delayed;
`endif
assign core_app_rdy             = app_rdy;
assign core_app_wdf_rdy         = app_wdf_rdy;
assign core_app_rd_data_valid   = app_rd_data_valid;
assign core_app_rd_data_end     = app_rd_data_end;
assign core_app_rd_data         = app_rd_data;

`else //ifndef PITONSYS_AXI4_MEM
assign noc_mig_bridge_rst       = ui_clk_sync_rst;
assign noc_mig_bridge_init_done = init_calib_complete;
assign init_calib_complete_out  = init_calib_complete & ~ui_clk_syn_rst_delayed;
`endif

noc_bidir_afifo  mig_afifo  (
    .clk_1           (core_ref_clk      ),
    .rst_1           (afifo_rst_1       ),

    .clk_2           (ui_clk            ),
    .rst_2           (afifo_rst_2       ),

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


`ifndef PITONSYS_AXI4_MEM

`ifdef PITONSYS_MEM_ZEROER
assign app_en                   = zero_app_en;
assign app_cmd                  = zero_app_cmd;
assign app_addr                 = zero_app_addr;
assign app_wdf_wren             = zero_app_wdf_wren;
assign app_wdf_data             = zero_app_wdf_data;
assign app_wdf_mask             = zero_app_wdf_mask;
assign app_wdf_end              = zero_app_wdf_end;
assign noc_mig_bridge_rst       = ui_clk_sync_rst & ~init_calib_complete_zero;
assign noc_mig_bridge_init_done = init_calib_complete_zero;
assign init_calib_complete_out  = init_calib_complete_zero & ~ui_clk_syn_rst_delayed;
`else
assign app_en                   = core_app_en;
assign app_cmd                  = core_app_cmd;
assign app_addr                 = core_app_addr;
assign app_wdf_wren             = core_app_wdf_wren;
assign app_wdf_data             = core_app_wdf_data;
assign app_wdf_mask             = core_app_wdf_mask;
assign app_wdf_end              = core_app_wdf_end;
assign noc_mig_bridge_rst       = ui_clk_sync_rst;
assign noc_mig_bridge_init_done = init_calib_complete;
assign init_calib_complete_out  = init_calib_complete & ~ui_clk_syn_rst_delayed;
`endif
assign core_app_rdy             = app_rdy;
assign core_app_wdf_rdy         = app_wdf_rdy;
assign core_app_rd_data_valid   = app_rd_data_valid;
assign core_app_rd_data_end     = app_rd_data_end;
assign core_app_rd_data         = app_rd_data;

noc_mig_bridge    #  (
    .MIG_APP_ADDR_WIDTH (`MIG_APP_ADDR_WIDTH        ),
    .MIG_APP_DATA_WIDTH (`MIG_APP_DATA_WIDTH        )
)   noc_mig_bridge   (
    .clk                (ui_clk                     ),  // from MC
    .rst                (noc_mig_bridge_rst         ),  // from MC

    .uart_boot_en       (uart_boot_en               ),

    .flit_in            (fifo_trans_data            ),
    .flit_in_val        (fifo_trans_val             ),
    .flit_in_rdy        (fifo_trans_rdy             ),
    .flit_out           (trans_fifo_data            ),
    .flit_out_val       (trans_fifo_val             ),
    .flit_out_rdy       (trans_fifo_rdy             ),

    .app_rdy            (core_app_rdy               ),
    .app_wdf_rdy        (core_app_wdf_rdy           ),
    .app_rd_data        (core_app_rd_data           ),
    .app_rd_data_end    (core_app_rd_data_end       ),
    .app_rd_data_valid  (core_app_rd_data_valid     ),
    .phy_init_done      (noc_mig_bridge_init_done   ),

    .app_wdf_wren_reg   (core_app_wdf_wren          ),
    .app_wdf_data_out   (core_app_wdf_data          ),
    .app_wdf_mask_out   (core_app_wdf_mask          ),
    .app_wdf_end_out    (core_app_wdf_end           ),
    .app_addr_out       (core_app_addr              ),
    .app_en_reg         (core_app_en                ),
    .app_cmd_reg        (core_app_cmd               )
);

`ifdef PITONSYS_MEM_ZEROER
memory_zeroer #(
    .MIG_APP_ADDR_WIDTH (`MIG_APP_ADDR_WIDTH        ),
    .MIG_APP_DATA_WIDTH (`MIG_APP_DATA_WIDTH        )
)    memory_zeroer (
    .clk                        (ui_clk                     ),
    .rst_n                      (~ui_clk_sync_rst           ),

    .init_calib_complete_in     (init_calib_complete        ),
    .init_calib_complete_out    (init_calib_complete_zero   ),

    .app_rdy_in                 (core_app_rdy               ),
    .app_wdf_rdy_in             (core_app_wdf_rdy           ),
    
    .app_wdf_wren_in            (core_app_wdf_wren          ),
    .app_wdf_data_in            (core_app_wdf_data          ),
    .app_wdf_mask_in            (core_app_wdf_mask          ),
    .app_wdf_end_in             (core_app_wdf_end           ),
    .app_addr_in                (core_app_addr              ),
    .app_en_in                  (core_app_en                ),
    .app_cmd_in                 (core_app_cmd               ),

    .app_wdf_wren_out           (zero_app_wdf_wren          ),
    .app_wdf_data_out           (zero_app_wdf_data          ),
    .app_wdf_mask_out           (zero_app_wdf_mask          ),
    .app_wdf_end_out            (zero_app_wdf_end           ),
    .app_addr_out               (zero_app_addr              ),
    .app_en_out                 (zero_app_en                ),
    .app_cmd_out                (zero_app_cmd               )
);
`endif

`ifdef PITONSYS_DDR4

// reserved, tie to 0
wire app_hi_pri;
assign app_hi_pri = 1'b0;
  
ddr4_0 i_ddr4_0 (
  .sys_rst                   ( ~sys_rst_n                ),
  .c0_sys_clk_p              ( sys_clk_p                 ),
  .c0_sys_clk_n              ( sys_clk_n                 ),
  .dbg_clk                   (                           ), // not used 
  .dbg_bus                   (                           ), // not used
  .c0_ddr4_ui_clk            ( ui_clk                    ),
  .c0_ddr4_ui_clk_sync_rst   ( ui_clk_sync_rst           ),
  
  .c0_ddr4_act_n             ( ddr_act_n                 ), // cas_n, ras_n and we_n are multiplexed in ddr4
  .c0_ddr4_adr               ( ddr_addr                  ),
  .c0_ddr4_ba                ( ddr_ba                    ),
  .c0_ddr4_bg                ( ddr_bg                    ), // bank group address
  .c0_ddr4_cke               ( ddr_cke                   ),
  .c0_ddr4_odt               ( ddr_odt                   ),
  .c0_ddr4_cs_n              ( ddr_cs_n                  ),
  .c0_ddr4_ck_t              ( ddr_ck_p                  ),
  .c0_ddr4_ck_c              ( ddr_ck_n                  ),
  .c0_ddr4_reset_n           ( ddr_reset_n               ),
`ifndef XUPP3R_BOARD
  .c0_ddr4_dm_dbi_n          ( ddr_dm                    ), // dbi_n is a data bus inversion feature that cannot be used simultaneously with dm
`endif
  .c0_ddr4_dq                ( ddr_dq                    ), 
  .c0_ddr4_dqs_c             ( ddr_dqs_n                 ), 
  .c0_ddr4_dqs_t             ( ddr_dqs_p                 ), 
  .c0_init_calib_complete    ( init_calib_complete       ),
  
  // Application interface ports
  .c0_ddr4_app_addr          ( app_addr                  ),
  .c0_ddr4_app_cmd           ( app_cmd                   ),
  .c0_ddr4_app_en            ( app_en                    ),

  .c0_ddr4_app_hi_pri        ( app_hi_pri                ), // reserved, tie to 0
  .c0_ddr4_app_wdf_data      ( app_wdf_data              ), 
  .c0_ddr4_app_wdf_end       ( app_wdf_end               ),
  .c0_ddr4_app_wdf_mask      ( app_wdf_mask              ), 
  .c0_ddr4_app_wdf_wren      ( app_wdf_wren              ),
  .c0_ddr4_app_rd_data       ( app_rd_data               ), 
  .c0_ddr4_app_rd_data_end   ( app_rd_data_end           ),
  .c0_ddr4_app_rd_data_valid ( app_rd_data_valid         ),
  .c0_ddr4_app_rdy           ( app_rdy                   ),
  .c0_ddr4_app_wdf_rdy       ( app_wdf_rdy               )
`ifdef XUPP3R_BOARD
,
  .c0_ddr4_ecc_err_addr      (                           ),            // output wire [51 : 0] c0_ddr4_ecc_err_addr
  .c0_ddr4_ecc_single        (                           ),                // output wire [7 : 0] c0_ddr4_ecc_single
  .c0_ddr4_ecc_multiple      (                           ),            // output wire [7 : 0] c0_ddr4_ecc_multiple
  .c0_ddr4_app_correct_en_i  ( 1'b1                      ),     // input wire c0_ddr4_app_correct_en_i
  .c0_ddr4_parity            ( ddr_parity                )                        // output wire c0_ddr4_parity
`endif
);

`else // PITONSYS_DDR4
mig_7series_0   mig_7series_0 (
    // Memory interface ports
`ifndef NEXYS4DDR_BOARD
    .ddr3_addr                      (ddr_addr),
    .ddr3_ba                        (ddr_ba),
    .ddr3_cas_n                     (ddr_cas_n),
    .ddr3_ck_n                      (ddr_ck_n),
    .ddr3_ck_p                      (ddr_ck_p),
    .ddr3_cke                       (ddr_cke),
    .ddr3_ras_n                     (ddr_ras_n),
    .ddr3_reset_n                   (ddr_reset_n),
    .ddr3_we_n                      (ddr_we_n),
    .ddr3_dq                        (ddr_dq),
    .ddr3_dqs_n                     (ddr_dqs_n),
    .ddr3_dqs_p                     (ddr_dqs_p),
`ifndef NEXYSVIDEO_BOARD
    .ddr3_cs_n                      (ddr_cs_n),
`endif // endif NEXYSVIDEO_BOARD
    .ddr3_dm                        (ddr_dm),
    .ddr3_odt                       (ddr_odt),
`else // ifdef NEXYS4DDR_BOARD
    .ddr2_addr                      (ddr_addr),
    .ddr2_ba                        (ddr_ba),
    .ddr2_cas_n                     (ddr_cas_n),
    .ddr2_ck_n                      (ddr_ck_n),
    .ddr2_ck_p                      (ddr_ck_p),
    .ddr2_cke                       (ddr_cke),
    .ddr2_ras_n                     (ddr_ras_n),
    .ddr2_we_n                      (ddr_we_n),
    .ddr2_dq                        (ddr_dq),
    .ddr2_dqs_n                     (ddr_dqs_n),
    .ddr2_dqs_p                     (ddr_dqs_p),
    .ddr2_cs_n                      (ddr_cs_n),
    .ddr2_dm                        (ddr_dm),
    .ddr2_odt                       (ddr_odt),
`endif // endif NEXYS4DDR_BOARD

    .init_calib_complete            (init_calib_complete),

    // Application interface ports
    .app_addr                       (app_addr),
    .app_cmd                        (app_cmd),
    .app_en                         (app_en),
    .app_wdf_data                   (app_wdf_data),
    .app_wdf_end                    (app_wdf_end),
    .app_wdf_wren                   (app_wdf_wren),
    .app_rd_data                    (app_rd_data),
    .app_rd_data_end                (app_rd_data_end),
    .app_rd_data_valid              (app_rd_data_valid),
    .app_rdy                        (app_rdy),
    .app_wdf_rdy                    (app_wdf_rdy),
    .app_sr_req                     (app_sr_req),
    .app_ref_req                    (app_ref_req),
    .app_zq_req                     (app_zq_req),
    .app_sr_active                  (app_sr_active),
    .app_ref_ack                    (app_ref_ack),
    .app_zq_ack                     (app_zq_ack),
    .ui_clk                         (ui_clk),
    .ui_clk_sync_rst                (ui_clk_sync_rst),
    .app_wdf_mask                   (app_wdf_mask),

    // System Clock Ports
    .sys_clk_i                      (sys_clk),
    .sys_rst                        (sys_rst_n)
);
`endif // PITONSYS_DDR4

`else // PITONSYS_AXI4_MEM

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

assign noc_axi4_bridge_rst       = ui_clk_sync_rst & ~init_calib_complete_zero;
assign noc_axi4_bridge_init_done = init_calib_complete_zero;
assign init_calib_complete_out  = init_calib_complete_zero & ~ui_clk_syn_rst_delayed;
`else // PITONSYS_MEM_ZEROER

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

assign noc_axi4_bridge_rst       = ui_clk_sync_rst;
assign noc_axi4_bridge_init_done = init_calib_complete;
assign init_calib_complete_out  = init_calib_complete & ~ui_clk_syn_rst_delayed;
`endif // PITONSYS_MEM_ZEROER

// system memory base address from devices.xml, unaligned with memory size and thus is subtracted from access memory address
//localparam MEM_BASE_UNALIGN = `AXI4_ADDR_WIDTH'h80000000;
localparam MEM_BASE_UNALIGN = '0;

noc_axi4_bridge #(
  `ifdef PITON_RV64_PLATFORM
    .SWAP_ENDIANESS (1),
  `endif
  `ifdef PITON_FPGA_MC_HBM
    .AXI4_DAT_WIDTH_USED (HBM_WIDTH),
    .ADDR_SWAP_LBITS(HBM_MCS_LOG2),
    .ADDR_SWAP_MSB  (HBM_SIZE_LOG2),
    .ADDR_SWAP_LSB  (HBM_MCS_ADDR),
  `endif
    .ADDR_OFFSET(MEM_BASE_UNALIGN),
    .NUM_REQ_OUTSTANDING_LOG2 ($clog2(`PITON_NUM_TILES * 4))
    // .NUM_REQ_MSHRID_LBIT (`L15_MSHR_ID_WIDTH),
    // .NUM_REQ_MSHRID_BITS (`L15_THREADID_WIDTH),
    // .NUM_REQ_YTHREADS (`PITON_Y_TILES),
    // .NUM_REQ_XTHREADS (`PITON_X_TILES)
)
 noc_axi4_bridge  (
    .clk                (ui_clk                    ),  
    .rst_n              (~noc_axi4_bridge_rst      ), 
    .uart_boot_en       (uart_boot_en              ),
    .phy_init_done      (noc_axi4_bridge_init_done ),
    .axi_id_deadlock    (mc_axi_deadlock           ),

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


`ifdef PITON_EXTRA_MEMS
  // Multi-MC implementation
  `ifndef PITONSYS_MEEP
  wire [`PITON_EXTRA_MEMS * `AXI4_ID_WIDTH     -1:0]   mcx_axi_awid;
  wire [`PITON_EXTRA_MEMS * `AXI4_ADDR_WIDTH   -1:0]   mcx_axi_awaddr;
  wire [`PITON_EXTRA_MEMS * `AXI4_LEN_WIDTH    -1:0]   mcx_axi_awlen;
  wire [`PITON_EXTRA_MEMS * `AXI4_SIZE_WIDTH   -1:0]   mcx_axi_awsize;
  wire [`PITON_EXTRA_MEMS * `AXI4_BURST_WIDTH  -1:0]   mcx_axi_awburst;
  wire [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_awlock;
  wire [`PITON_EXTRA_MEMS * `AXI4_CACHE_WIDTH  -1:0]   mcx_axi_awcache;
  wire [`PITON_EXTRA_MEMS * `AXI4_PROT_WIDTH   -1:0]   mcx_axi_awprot;
  wire [`PITON_EXTRA_MEMS * `AXI4_QOS_WIDTH    -1:0]   mcx_axi_awqos;
  wire [`PITON_EXTRA_MEMS * `AXI4_REGION_WIDTH -1:0]   mcx_axi_awregion;
  wire [`PITON_EXTRA_MEMS * `AXI4_USER_WIDTH   -1:0]   mcx_axi_awuser;
  wire [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_awvalid;
  wire [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_awready;

  wire [`PITON_EXTRA_MEMS * `AXI4_ID_WIDTH     -1:0]   mcx_axi_wid;
  wire [`PITON_EXTRA_MEMS * `AXI4_DATA_WIDTH   -1:0]   mcx_axi_wdata;
  wire [`PITON_EXTRA_MEMS * `AXI4_STRB_WIDTH   -1:0]   mcx_axi_wstrb;
  wire [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_wlast;
  wire [`PITON_EXTRA_MEMS * `AXI4_USER_WIDTH   -1:0]   mcx_axi_wuser;
  wire [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_wvalid;
  wire [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_wready;

  wire [`PITON_EXTRA_MEMS * `AXI4_ID_WIDTH     -1:0]   mcx_axi_arid;
  wire [`PITON_EXTRA_MEMS * `AXI4_ADDR_WIDTH   -1:0]   mcx_axi_araddr;
  wire [`PITON_EXTRA_MEMS * `AXI4_LEN_WIDTH    -1:0]   mcx_axi_arlen;
  wire [`PITON_EXTRA_MEMS * `AXI4_SIZE_WIDTH   -1:0]   mcx_axi_arsize;
  wire [`PITON_EXTRA_MEMS * `AXI4_BURST_WIDTH  -1:0]   mcx_axi_arburst;
  wire [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_arlock;
  wire [`PITON_EXTRA_MEMS * `AXI4_CACHE_WIDTH  -1:0]   mcx_axi_arcache;
  wire [`PITON_EXTRA_MEMS * `AXI4_PROT_WIDTH   -1:0]   mcx_axi_arprot;
  wire [`PITON_EXTRA_MEMS * `AXI4_QOS_WIDTH    -1:0]   mcx_axi_arqos;
  wire [`PITON_EXTRA_MEMS * `AXI4_REGION_WIDTH -1:0]   mcx_axi_arregion;
  wire [`PITON_EXTRA_MEMS * `AXI4_USER_WIDTH   -1:0]   mcx_axi_aruser;
  wire [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_arvalid;
  wire [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_arready;

  wire [`PITON_EXTRA_MEMS * `AXI4_ID_WIDTH     -1:0]   mcx_axi_rid;
  wire [`PITON_EXTRA_MEMS * `AXI4_DATA_WIDTH   -1:0]   mcx_axi_rdata;
  wire [`PITON_EXTRA_MEMS * `AXI4_RESP_WIDTH   -1:0]   mcx_axi_rresp;
  wire [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_rlast;
  wire [`PITON_EXTRA_MEMS * `AXI4_USER_WIDTH   -1:0]   mcx_axi_ruser;
  wire [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_rvalid;
  wire [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_rready;

  wire [`PITON_EXTRA_MEMS * `AXI4_ID_WIDTH     -1:0]   mcx_axi_bid;
  wire [`PITON_EXTRA_MEMS * `AXI4_RESP_WIDTH   -1:0]   mcx_axi_bresp;
  wire [`PITON_EXTRA_MEMS * `AXI4_USER_WIDTH   -1:0]   mcx_axi_buser;
  wire [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_bvalid;
  wire [`PITON_EXTRA_MEMS                      -1:0]   mcx_axi_bready;

   // reassignment of vectorized multiple AXI buses to/from name-indexed ones for non-Shell OP build
  `MCX_AXI(`PITON_EXTRA_MEMS)
  `endif //`ifndef PITONSYS_MEEP

  genvar idx;
  generate
  for(idx=0; idx<`PITON_EXTRA_MEMS; idx=idx+1) begin: mcx_bridges
  noc_axi4_bridge #(
    .SWAP_ENDIANESS (1),
    .AXI4_DAT_WIDTH_USED(HBM_WIDTH),
    .ADDR_OFFSET(MEM_BASE_UNALIGN),
    .ADDR_SWAP_LBITS(HBM_MCS_LOG2),
    .ADDR_SWAP_MSB  (HBM_SIZE_LOG2),
    .ADDR_SWAP_LSB  (HBM_MCS_ADDR),
    .NUM_REQ_OUTSTANDING_LOG2 (4),
    // for 2d-mesh having pure internal tiles (like 3x3), usage of either SRC_X/Y or INI_X/Y NOC fields as AXI ID results in Linux kernel panic
    .NUM_REQ_YTHREADS (`PITON_EXTRA_MEMS == `PITON_NUM_TILES ? `PITON_Y_TILES : 1),
    .NUM_REQ_XTHREADS (`PITON_EXTRA_MEMS == `PITON_NUM_TILES ? `PITON_X_TILES : 1),
    .SRCXY_AS_AXIID   (1)
  ) noc_axi4_bridge_mcx (
    .clk                (core_ref_clk),
    .rst_n              (sys_rst_n),
    .uart_boot_en       (1'b0),
    .phy_init_done      (sys_rst_n),

    .src_bridge_vr_noc2_rdy(mcx_flit_in_rdy [idx]),
    .src_bridge_vr_noc2_val(mcx_flit_in_val [idx]),
    .src_bridge_vr_noc2_dat(mcx_flit_in_data[idx * `NOC_DATA_WIDTH +: `NOC_DATA_WIDTH]),

    .bridge_dst_vr_noc3_rdy(mcx_flit_out_rdy [idx]),
    .bridge_dst_vr_noc3_val(mcx_flit_out_val [idx]),
    .bridge_dst_vr_noc3_dat(mcx_flit_out_data[idx * `NOC_DATA_WIDTH +: `NOC_DATA_WIDTH]),

    .m_axi_awid      (mcx_axi_awid     [idx * `AXI4_ID_WIDTH     +: `AXI4_ID_WIDTH    ]),
    .m_axi_awaddr    (mcx_axi_awaddr   [idx * `AXI4_ADDR_WIDTH   +: `AXI4_ADDR_WIDTH  ]),
    .m_axi_awlen     (mcx_axi_awlen    [idx * `AXI4_LEN_WIDTH    +: `AXI4_LEN_WIDTH   ]),
    .m_axi_awsize    (mcx_axi_awsize   [idx * `AXI4_SIZE_WIDTH   +: `AXI4_SIZE_WIDTH  ]),
    .m_axi_awburst   (mcx_axi_awburst  [idx * `AXI4_BURST_WIDTH  +: `AXI4_BURST_WIDTH ]),
    .m_axi_awlock    (mcx_axi_awlock   [idx                                           ]),
    .m_axi_awcache   (mcx_axi_awcache  [idx * `AXI4_CACHE_WIDTH  +: `AXI4_CACHE_WIDTH ]),
    .m_axi_awprot    (mcx_axi_awprot   [idx * `AXI4_PROT_WIDTH   +: `AXI4_PROT_WIDTH  ]),
    .m_axi_awqos     (mcx_axi_awqos    [idx * `AXI4_QOS_WIDTH    +: `AXI4_QOS_WIDTH   ]),
    .m_axi_awregion  (mcx_axi_awregion [idx * `AXI4_REGION_WIDTH +: `AXI4_REGION_WIDTH]),
    .m_axi_awuser    (mcx_axi_awuser   [idx * `AXI4_USER_WIDTH   +: `AXI4_USER_WIDTH  ]),
    .m_axi_awvalid   (mcx_axi_awvalid  [idx                                           ]),
    .m_axi_awready   (mcx_axi_awready  [idx                                           ]),

    .m_axi_wid       (mcx_axi_wid      [idx * `AXI4_ID_WIDTH     +: `AXI4_ID_WIDTH  ]),
    .m_axi_wdata     (mcx_axi_wdata    [idx * `AXI4_DATA_WIDTH   +: `AXI4_DATA_WIDTH]),
    .m_axi_wstrb     (mcx_axi_wstrb    [idx * `AXI4_STRB_WIDTH   +: `AXI4_STRB_WIDTH]),
    .m_axi_wlast     (mcx_axi_wlast    [idx                                         ]),
    .m_axi_wuser     (mcx_axi_wuser    [idx * `AXI4_USER_WIDTH   +: `AXI4_USER_WIDTH]),
    .m_axi_wvalid    (mcx_axi_wvalid   [idx                                         ]),
    .m_axi_wready    (mcx_axi_wready   [idx                                         ]),

    .m_axi_bid       (mcx_axi_bid      [idx * `AXI4_ID_WIDTH     +: `AXI4_ID_WIDTH  ]),
    .m_axi_bresp     (mcx_axi_bresp    [idx * `AXI4_RESP_WIDTH   +: `AXI4_RESP_WIDTH]),
    .m_axi_buser     (mcx_axi_buser    [idx * `AXI4_USER_WIDTH   +: `AXI4_USER_WIDTH]),
    .m_axi_bvalid    (mcx_axi_bvalid   [idx                                         ]),
    .m_axi_bready    (mcx_axi_bready   [idx                                         ]),

    .m_axi_arid      (mcx_axi_arid     [idx * `AXI4_ID_WIDTH     +: `AXI4_ID_WIDTH    ]),
    .m_axi_araddr    (mcx_axi_araddr   [idx * `AXI4_ADDR_WIDTH   +: `AXI4_ADDR_WIDTH  ]),
    .m_axi_arlen     (mcx_axi_arlen    [idx * `AXI4_LEN_WIDTH    +: `AXI4_LEN_WIDTH   ]),
    .m_axi_arsize    (mcx_axi_arsize   [idx * `AXI4_SIZE_WIDTH   +: `AXI4_SIZE_WIDTH  ]),
    .m_axi_arburst   (mcx_axi_arburst  [idx * `AXI4_BURST_WIDTH  +: `AXI4_BURST_WIDTH ]),
    .m_axi_arlock    (mcx_axi_arlock   [idx                                           ]),
    .m_axi_arcache   (mcx_axi_arcache  [idx * `AXI4_CACHE_WIDTH  +: `AXI4_CACHE_WIDTH ]),
    .m_axi_arprot    (mcx_axi_arprot   [idx * `AXI4_PROT_WIDTH   +: `AXI4_PROT_WIDTH  ]),
    .m_axi_arqos     (mcx_axi_arqos    [idx * `AXI4_QOS_WIDTH    +: `AXI4_QOS_WIDTH   ]),
    .m_axi_arregion  (mcx_axi_arregion [idx * `AXI4_REGION_WIDTH +: `AXI4_REGION_WIDTH]),
    .m_axi_aruser    (mcx_axi_aruser   [idx * `AXI4_USER_WIDTH   +: `AXI4_USER_WIDTH  ]),
    .m_axi_arvalid   (mcx_axi_arvalid  [idx                                           ]),
    .m_axi_arready   (mcx_axi_arready  [idx                                           ]),

    .m_axi_rid       (mcx_axi_rid      [idx * `AXI4_ID_WIDTH     +: `AXI4_ID_WIDTH  ]),
    .m_axi_rdata     (mcx_axi_rdata    [idx * `AXI4_DATA_WIDTH   +: `AXI4_DATA_WIDTH]),
    .m_axi_rresp     (mcx_axi_rresp    [idx * `AXI4_RESP_WIDTH   +: `AXI4_RESP_WIDTH]),
    .m_axi_rlast     (mcx_axi_rlast    [idx                                         ]),
    .m_axi_ruser     (mcx_axi_ruser    [idx * `AXI4_USER_WIDTH   +: `AXI4_USER_WIDTH]),
    .m_axi_rvalid    (mcx_axi_rvalid   [idx                                         ]),
    .m_axi_rready    (mcx_axi_rready   [idx                                         ])
  );
  end
  endgenerate

`endif //ifdef PITON_EXTRA_MEMS


`ifdef PITONSYS_MEM_ZEROER
axi4_zeroer axi4_zeroer(
  .clk                    (ui_clk),
  .rst_n                  (~ui_clk_sync_rst),
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

`ifndef PITONSYS_MEEP
`ifdef PITONSYS_DDR4
`ifdef PITONSYS_PCIE


 wire [`AXI4_ADDR_WIDTH  -1:0]  pci2hbm_maxi_araddr;
 wire [`AXI4_BURST_WIDTH -1:0]  pci2hbm_maxi_arburst;
 wire [`AXI4_CACHE_WIDTH -1:0]  pci2hbm_maxi_arcache;
 wire [`AXI4_LEN_WIDTH   -1:0]  pci2hbm_maxi_arlen;
 wire                           pci2hbm_maxi_arlock;
 wire [`AXI4_PROT_WIDTH  -1:0]  pci2hbm_maxi_arprot;
 wire [`AXI4_QOS_WIDTH   -1:0]  pci2hbm_maxi_arqos;
 wire                           pci2hbm_maxi_arready;
 wire [`AXI4_SIZE_WIDTH  -1:0]  pci2hbm_maxi_arsize;
 wire [`AXI4_USER_WIDTH  -1:0]  pci2hbm_maxi_aruser;
 wire                           pci2hbm_maxi_arvalid;
 wire [`AXI4_ADDR_WIDTH  -1:0]  pci2hbm_maxi_awaddr;
 wire [`AXI4_BURST_WIDTH -1:0]  pci2hbm_maxi_awburst;
 wire [`AXI4_CACHE_WIDTH -1:0]  pci2hbm_maxi_awcache;
 wire [`AXI4_LEN_WIDTH   -1:0]  pci2hbm_maxi_awlen;
 wire                           pci2hbm_maxi_awlock;
 wire [`AXI4_PROT_WIDTH  -1:0]  pci2hbm_maxi_awprot;
 wire [`AXI4_QOS_WIDTH   -1:0]  pci2hbm_maxi_awqos;
 wire                           pci2hbm_maxi_awready;
 wire [`AXI4_SIZE_WIDTH  -1:0]  pci2hbm_maxi_awsize;
 wire [`AXI4_USER_WIDTH  -1:0]  pci2hbm_maxi_awuser;
 wire                           pci2hbm_maxi_awvalid;
 wire                           pci2hbm_maxi_bready;
 wire [`AXI4_RESP_WIDTH  -1:0]  pci2hbm_maxi_bresp;
 wire                           pci2hbm_maxi_bvalid;
 wire [`AXI4_DATA_WIDTH  -1:0]  pci2hbm_maxi_rdata;
 wire                           pci2hbm_maxi_rlast;
 wire                           pci2hbm_maxi_rready;
 wire [`AXI4_RESP_WIDTH  -1:0]  pci2hbm_maxi_rresp;
 wire                           pci2hbm_maxi_rvalid;
 wire [`AXI4_DATA_WIDTH  -1:0]  pci2hbm_maxi_wdata;
 wire                           pci2hbm_maxi_wlast;
 wire                           pci2hbm_maxi_wready;
 wire [`AXI4_STRB_WIDTH  -1:0]  pci2hbm_maxi_wstrb;
 wire                           pci2hbm_maxi_wvalid;

// making address swapping for interleaving of HBM MC channels
 wire [`AXI4_ADDR_WIDTH-1 : 0] pci2hbm_raddr;
 wire [`AXI4_ADDR_WIDTH-1 : 0] pci2hbm_waddr;
 generate
  if (HBM_MCS_LOG2) begin
    assign pci2hbm_raddr = {pci2hbm_maxi_araddr[`AXI4_ADDR_WIDTH-1 : HBM_SIZE_LOG2              ],
                            pci2hbm_maxi_araddr[HBM_MCS_ADDR      +: HBM_MCS_LOG2               ], // Low address part moved up
                            pci2hbm_maxi_araddr[HBM_SIZE_LOG2-1    : HBM_MCS_ADDR + HBM_MCS_LOG2], // High address part shifted down
                            pci2hbm_maxi_araddr[HBM_MCS_ADDR -1    : 0]};
    assign pci2hbm_waddr = {pci2hbm_maxi_awaddr[`AXI4_ADDR_WIDTH-1 : HBM_SIZE_LOG2              ],
                            pci2hbm_maxi_awaddr[HBM_MCS_ADDR      +: HBM_MCS_LOG2               ], // Low address part moved up
                            pci2hbm_maxi_awaddr[HBM_SIZE_LOG2-1    : HBM_MCS_ADDR + HBM_MCS_LOG2], // High address part shifted down
                            pci2hbm_maxi_awaddr[HBM_MCS_ADDR -1    : 0]};
  end
  else begin
    assign pci2hbm_raddr =  pci2hbm_maxi_araddr;
    assign pci2hbm_waddr =  pci2hbm_maxi_awaddr;
  end
 endgenerate

 meep_shell meep_shell
       (
         .*, // implicit connection of all AXI's at once

        .mem_clk(ui_clk),
        .mem_rst(ui_clk_sync_rst),
        .mem_calib_complete(init_calib_complete),
        .mem_refclk_clk_n(sys_clk_n),
        .mem_refclk_clk_p(sys_clk_p),

  `ifdef PITON_FPGA_MC_HBM
        .hbm_cattrip(hbm_cattrip),
        .pci2hbm_saxi_araddr  (pci2hbm_raddr),
        .pci2hbm_saxi_awaddr  (pci2hbm_waddr),
        .pci2hbm_saxi_arburst (pci2hbm_maxi_arburst),
        .pci2hbm_saxi_arid    ('0),
        .pci2hbm_saxi_arlen   (pci2hbm_maxi_arlen),
        .pci2hbm_saxi_arready (pci2hbm_maxi_arready),
        .pci2hbm_saxi_arsize  (pci2hbm_maxi_arsize),
        .pci2hbm_saxi_arvalid (pci2hbm_maxi_arvalid),
        .pci2hbm_saxi_awburst (pci2hbm_maxi_awburst),
        .pci2hbm_saxi_awid    ('0),
        .pci2hbm_saxi_awlen   (pci2hbm_maxi_awlen),
        .pci2hbm_saxi_awready (pci2hbm_maxi_awready),
        .pci2hbm_saxi_awsize  (pci2hbm_maxi_awsize),
        .pci2hbm_saxi_awvalid (pci2hbm_maxi_awvalid),
        .pci2hbm_saxi_bid     (),
        .pci2hbm_saxi_bready  (pci2hbm_maxi_bready),
        .pci2hbm_saxi_bresp   (pci2hbm_maxi_bresp),
        .pci2hbm_saxi_bvalid  (pci2hbm_maxi_bvalid),
        .pci2hbm_saxi_rdata   (pci2hbm_maxi_rdata),
        .pci2hbm_saxi_rid     (),
        .pci2hbm_saxi_rlast   (pci2hbm_maxi_rlast),
        .pci2hbm_saxi_rready  (pci2hbm_maxi_rready),
        .pci2hbm_saxi_rresp   (pci2hbm_maxi_rresp),
        .pci2hbm_saxi_rvalid  (pci2hbm_maxi_rvalid),
        .pci2hbm_saxi_wdata   (pci2hbm_maxi_wdata),
        .pci2hbm_saxi_wlast   (pci2hbm_maxi_wlast),
        .pci2hbm_saxi_wready  (pci2hbm_maxi_wready),
        .pci2hbm_saxi_wstrb   (pci2hbm_maxi_wstrb),
        .pci2hbm_saxi_wvalid  (pci2hbm_maxi_wvalid),
  `else
        .ddr4_sdram_c0_act_n(ddr_act_n),
        .ddr4_sdram_c0_adr(ddr_addr),
        .ddr4_sdram_c0_ba(ddr_ba),
        .ddr4_sdram_c0_bg(ddr_bg),
        .ddr4_sdram_c0_ck_c(ddr_ck_n),
        .ddr4_sdram_c0_ck_t(ddr_ck_p),
        .ddr4_sdram_c0_cke(ddr_cke),
        .ddr4_sdram_c0_cs_n(ddr_cs_n),
        .ddr4_sdram_c0_dq(ddr_dq),
        .ddr4_sdram_c0_dqs_c(ddr_dqs_n),
        .ddr4_sdram_c0_dqs_t(ddr_dqs_p),
        .ddr4_sdram_c0_odt(ddr_odt),
        .ddr4_sdram_c0_par(ddr_parity),
        .ddr4_sdram_c0_reset_n(ddr_reset_n),
  `endif

        .sys_rst(~sys_rst_n),
        .sys_clk(core_ref_clk),

        .pci_express_x16_rxn(pci_express_x16_rxn),
        .pci_express_x16_rxp(pci_express_x16_rxp),
        .pci_express_x16_txn(pci_express_x16_txn),
        .pci_express_x16_txp(pci_express_x16_txp),
        .pcie_gp0_out(pcie_gpio),
        .pcie_gp1_out(dst_src_mac_tx[31:0]),
        .pcie_gp2_out(dst_src_mac_tx[63:32]),
        .pcie_gp3_out(dst_src_mac_tx[95:64]),
        .pcie_gp0_in ({ethfr_retries, ethack_wait_time}),
        .pcie_gp1_in (dst_src_mac_rx[31:0]),
        .pcie_gp2_in (dst_src_mac_rx[63:32]),
        .pcie_gp3_in (dst_src_mac_rx[95:64]),
        .pcie_perstn(pcie_perstn),
        .pcie_refclk_clk_n( pcie_refclk_n),
        .pcie_refclk_clk_p( pcie_refclk_p)
        );
 assign m_axi_ruser    = `AXI4_USER_WIDTH'h0;
 assign m_axi_buser    = `AXI4_USER_WIDTH'h0;
 assign sram_axi_ruser = `AXI4_USER_WIDTH'h0;
 assign sram_axi_buser = `AXI4_USER_WIDTH'h0;
`else // PITONSYS_PCIE

ddr4_axi4 ddr_axi4 (
  .sys_rst                   ( ~sys_rst_n                ),
  .c0_sys_clk_p              ( sys_clk_p                 ),
  .c0_sys_clk_n              ( sys_clk_n                 ),
  .dbg_clk                   (                           ), // not used 
  .dbg_bus                   (                           ), // not used
  .c0_ddr4_ui_clk            ( ui_clk                    ),
  .c0_ddr4_ui_clk_sync_rst   ( ui_clk_sync_rst           ),
  
  .c0_ddr4_act_n             ( ddr_act_n                 ), // cas_n, ras_n and we_n are multiplexed in ddr4
  .c0_ddr4_adr               ( ddr_addr                  ),
  .c0_ddr4_ba                ( ddr_ba                    ),
  .c0_ddr4_bg                ( ddr_bg                    ), // bank group address
  .c0_ddr4_cke               ( ddr_cke                   ),
  .c0_ddr4_odt               ( ddr_odt                   ),
  .c0_ddr4_cs_n              ( ddr_cs_n                  ),
  .c0_ddr4_ck_t              ( ddr_ck_p                  ),
  .c0_ddr4_ck_c              ( ddr_ck_n                  ),
  .c0_ddr4_reset_n           ( ddr_reset_n               ),
`ifndef XUPP3R_BOARD
  .c0_ddr4_dm_dbi_n          ( ddr_dm                    ), // dbi_n is a data bus inversion feature that cannot be used simultaneously with dm
`endif
  .c0_ddr4_dq                ( ddr_dq                    ), 
  .c0_ddr4_dqs_c             ( ddr_dqs_n                 ), 
  .c0_ddr4_dqs_t             ( ddr_dqs_p                 ), 
  .c0_init_calib_complete    ( init_calib_complete       ),
`ifdef XUPP3R_BOARD
  .c0_ddr4_parity            ( ddr_parity                ),                        // output wire c0_ddr4_parity
`endif
  .c0_ddr4_interrupt         (                           ),                    // output wire c0_ddr4_interrupt
  .c0_ddr4_aresetn           ( sys_rst_n                 ),                        // input wire c0_ddr4_aresetn
  
  .c0_ddr4_s_axi_ctrl_awvalid(1'b0                  ),  // input wire c0_ddr4_s_axi_ctrl_awvalid
  .c0_ddr4_s_axi_ctrl_awready(                      ),  // output wire c0_ddr4_s_axi_ctrl_awready
  .c0_ddr4_s_axi_ctrl_awaddr (32'b0                 ),    // input wire [31 : 0] c0_ddr4_s_axi_ctrl_awaddr
  .c0_ddr4_s_axi_ctrl_wvalid (1'b0                  ),    // input wire c0_ddr4_s_axi_ctrl_wvalid
  .c0_ddr4_s_axi_ctrl_wready (                      ),    // output wire c0_ddr4_s_axi_ctrl_wready
  .c0_ddr4_s_axi_ctrl_wdata  (32'b0                 ),      // input wire [31 : 0] c0_ddr4_s_axi_ctrl_wdata
  .c0_ddr4_s_axi_ctrl_bvalid (                      ),    // output wire c0_ddr4_s_axi_ctrl_bvalid
  .c0_ddr4_s_axi_ctrl_bready (1'b0                  ),    // input wire c0_ddr4_s_axi_ctrl_bready
  .c0_ddr4_s_axi_ctrl_bresp  (                      ),      // output wire [1 : 0] c0_ddr4_s_axi_ctrl_bresp
  .c0_ddr4_s_axi_ctrl_arvalid(1'b0                  ),  // input wire c0_ddr4_s_axi_ctrl_arvalid
  .c0_ddr4_s_axi_ctrl_arready(                      ),  // output wire c0_ddr4_s_axi_ctrl_arready
  .c0_ddr4_s_axi_ctrl_araddr (32'b0                 ),    // input wire [31 : 0] c0_ddr4_s_axi_ctrl_araddr
  .c0_ddr4_s_axi_ctrl_rvalid (                      ),    // output wire c0_ddr4_s_axi_ctrl_rvalid
  .c0_ddr4_s_axi_ctrl_rready (1'b0                  ),    // input wire c0_ddr4_s_axi_ctrl_rready
  .c0_ddr4_s_axi_ctrl_rdata  (                      ),      // output wire [31 : 0] c0_ddr4_s_axi_ctrl_rdata
  .c0_ddr4_s_axi_ctrl_rresp  (                      ),      // output wire [1 : 0] c0_ddr4_s_axi_ctrl_rresp
  
  .c0_ddr4_s_axi_awid(m_axi_awid),                  // input wire [15 : 0] c0_ddr4_s_axi_awid
  .c0_ddr4_s_axi_awaddr(m_axi_awaddr),              // input wire [34 : 0] c0_ddr4_s_axi_awaddr
  .c0_ddr4_s_axi_awlen(m_axi_awlen),                // input wire [7 : 0] c0_ddr4_s_axi_awlen
  .c0_ddr4_s_axi_awsize(m_axi_awsize),              // input wire [2 : 0] c0_ddr4_s_axi_awsize
  .c0_ddr4_s_axi_awburst(m_axi_awburst),            // input wire [1 : 0] c0_ddr4_s_axi_awburst
  .c0_ddr4_s_axi_awlock(m_axi_awlock),              // input wire [0 : 0] c0_ddr4_s_axi_awlock
  .c0_ddr4_s_axi_awcache(m_axi_awcache),            // input wire [3 : 0] c0_ddr4_s_axi_awcache
  .c0_ddr4_s_axi_awprot(m_axi_awprot),              // input wire [2 : 0] c0_ddr4_s_axi_awprot
  .c0_ddr4_s_axi_awqos(m_axi_awqos),                // input wire [3 : 0] c0_ddr4_s_axi_awqos
  .c0_ddr4_s_axi_awvalid(m_axi_awvalid),            // input wire c0_ddr4_s_axi_awvalid
  .c0_ddr4_s_axi_awready(m_axi_awready),            // output wire c0_ddr4_s_axi_awready
  .c0_ddr4_s_axi_wdata(m_axi_wdata),                // input wire [511 : 0] c0_ddr4_s_axi_wdata
  .c0_ddr4_s_axi_wstrb(m_axi_wstrb),                // input wire [63 : 0] c0_ddr4_s_axi_wstrb
  .c0_ddr4_s_axi_wlast(m_axi_wlast),                // input wire c0_ddr4_s_axi_wlast
  .c0_ddr4_s_axi_wvalid(m_axi_wvalid),              // input wire c0_ddr4_s_axi_wvalid
  .c0_ddr4_s_axi_wready(m_axi_wready),              // output wire c0_ddr4_s_axi_wready
  .c0_ddr4_s_axi_bready(m_axi_bready),              // input wire c0_ddr4_s_axi_bready
  .c0_ddr4_s_axi_bid(m_axi_bid),                    // output wire [15 : 0] c0_ddr4_s_axi_bid
  .c0_ddr4_s_axi_bresp(m_axi_bresp),                // output wire [1 : 0] c0_ddr4_s_axi_bresp
  .c0_ddr4_s_axi_bvalid(m_axi_bvalid),              // output wire c0_ddr4_s_axi_bvalid
  .c0_ddr4_s_axi_arid(m_axi_arid),                  // input wire [15 : 0] c0_ddr4_s_axi_arid
  .c0_ddr4_s_axi_araddr(m_axi_araddr),              // input wire [34 : 0] c0_ddr4_s_axi_araddr
  .c0_ddr4_s_axi_arlen(m_axi_arlen),                // input wire [7 : 0] c0_ddr4_s_axi_arlen
  .c0_ddr4_s_axi_arsize(m_axi_arsize),              // input wire [2 : 0] c0_ddr4_s_axi_arsize
  .c0_ddr4_s_axi_arburst(m_axi_arburst),            // input wire [1 : 0] c0_ddr4_s_axi_arburst
  .c0_ddr4_s_axi_arlock(m_axi_arlock),              // input wire [0 : 0] c0_ddr4_s_axi_arlock
  .c0_ddr4_s_axi_arcache(m_axi_arcache),            // input wire [3 : 0] c0_ddr4_s_axi_arcache
  .c0_ddr4_s_axi_arprot(m_axi_arprot),              // input wire [2 : 0] c0_ddr4_s_axi_arprot
  .c0_ddr4_s_axi_arqos(m_axi_arqos),                // input wire [3 : 0] c0_ddr4_s_axi_arqos
  .c0_ddr4_s_axi_arvalid(m_axi_arvalid),            // input wire c0_ddr4_s_axi_arvalid
  .c0_ddr4_s_axi_arready(m_axi_arready),            // output wire c0_ddr4_s_axi_arready
  .c0_ddr4_s_axi_rready(m_axi_rready),              // input wire c0_ddr4_s_axi_rready
  .c0_ddr4_s_axi_rlast(m_axi_rlast),                // output wire c0_ddr4_s_axi_rlast
  .c0_ddr4_s_axi_rvalid(m_axi_rvalid),              // output wire c0_ddr4_s_axi_rvalid
  .c0_ddr4_s_axi_rresp(m_axi_rresp),                // output wire [1 : 0] c0_ddr4_s_axi_rresp
  .c0_ddr4_s_axi_rid(m_axi_rid),                    // output wire [15 : 0] c0_ddr4_s_axi_rid
  .c0_ddr4_s_axi_rdata(m_axi_rdata)                 // output wire [511 : 0] c0_ddr4_s_axi_rdata
);

`endif //PITONSYS_PCIE

`else // PITONSYS_DDR4


mig_7series_axi4 u_mig_7series_axi4 (

    // Memory interface ports
    .ddr3_addr                      (ddr_addr),  // output [13:0]      ddr3_addr
    .ddr3_ba                        (ddr_ba),  // output [2:0]     ddr3_ba
    .ddr3_cas_n                     (ddr_cas_n),  // output            ddr3_cas_n
    .ddr3_ck_n                      (ddr_ck_n),  // output [0:0]       ddr3_ck_n
    .ddr3_ck_p                      (ddr_ck_p),  // output [0:0]       ddr3_ck_p
    .ddr3_cke                       (ddr_cke),  // output [0:0]        ddr3_cke
    .ddr3_ras_n                     (ddr_ras_n),  // output            ddr3_ras_n
    .ddr3_reset_n                   (ddr_reset_n),  // output          ddr3_reset_n
    .ddr3_we_n                      (ddr_we_n),  // output         ddr3_we_n
    .ddr3_dq                        (ddr_dq),  // inout [63:0]     ddr3_dq
    .ddr3_dqs_n                     (ddr_dqs_n),  // inout [7:0]       ddr3_dqs_n
    .ddr3_dqs_p                     (ddr_dqs_p),  // inout [7:0]       ddr3_dqs_p
    .init_calib_complete            (init_calib_complete),  // output           init_calib_complete
      
    .ddr3_cs_n                      (ddr_cs_n),  // output [0:0]       ddr3_cs_n
    .ddr3_dm                        (ddr_dm),  // output [7:0]     ddr3_dm
    .ddr3_odt                       (ddr_odt),  // output [0:0]        ddr3_odt

    // Application interface ports
    .ui_clk                         (ui_clk),  // output            ui_clk
    .ui_clk_sync_rst                (ui_clk_sync_rst),  // output           ui_clk_sync_rst
    .mmcm_locked                    (),  // output           mmcm_locked
    .aresetn                        (sys_rst_n),  // input            aresetn
    .app_sr_req                     (app_sr_req),  // input         app_sr_req
    .app_ref_req                    (app_ref_req),  // input            app_ref_req
    .app_zq_req                     (app_zq_req),  // input         app_zq_req
    .app_sr_active                  (app_sr_active),  // output         app_sr_active
    .app_ref_ack                    (app_ref_ack),  // output           app_ref_ack
    .app_zq_ack                     (app_zq_ack),  // output            app_zq_ack

    // Slave Interface Write Address Ports
    .s_axi_awid                     (m_axi_awid),  // input [15:0]          s_axi_awid
    .s_axi_awaddr                   (m_axi_awaddr),  // input [29:0]            s_axi_awaddr
    .s_axi_awlen                    (m_axi_awlen),  // input [7:0]          s_axi_awlen
    .s_axi_awsize                   (m_axi_awsize),  // input [2:0]         s_axi_awsize
    .s_axi_awburst                  (m_axi_awburst),  // input [1:0]            s_axi_awburst
    .s_axi_awlock                   (m_axi_awlock),  // input [0:0]         s_axi_awlock
    .s_axi_awcache                  (m_axi_awcache),  // input [3:0]            s_axi_awcache
    .s_axi_awprot                   (m_axi_awprot),  // input [2:0]         s_axi_awprot
    .s_axi_awqos                    (m_axi_awqos),  // input [3:0]          s_axi_awqos
    .s_axi_awvalid                  (m_axi_awvalid),  // input          s_axi_awvalid
    .s_axi_awready                  (m_axi_awready),  // output         s_axi_awready
    // Slave Interface Write Data Ports
    .s_axi_wdata                    (m_axi_wdata),  // input [511:0]            s_axi_wdata
    .s_axi_wstrb                    (m_axi_wstrb),  // input [63:0]         s_axi_wstrb
    .s_axi_wlast                    (m_axi_wlast),  // input            s_axi_wlast
    .s_axi_wvalid                   (m_axi_wvalid),  // input           s_axi_wvalid
    .s_axi_wready                   (m_axi_wready),  // output          s_axi_wready
    // Slave Interface Write Response Ports
    .s_axi_bid                      (m_axi_bid),  // output [15:0]          s_axi_bid
    .s_axi_bresp                    (m_axi_bresp),  // output [1:0]         s_axi_bresp
    .s_axi_bvalid                   (m_axi_bvalid),  // output          s_axi_bvalid
    .s_axi_bready                   (m_axi_bready),  // input           s_axi_bready
    // Slave Interface Read Address Ports
    .s_axi_arid                     (m_axi_arid),  // input [15:0]          s_axi_arid
    .s_axi_araddr                   (m_axi_araddr),  // input [29:0]            s_axi_araddr
    .s_axi_arlen                    (m_axi_arlen),  // input [7:0]          s_axi_arlen
    .s_axi_arsize                   (m_axi_arsize),  // input [2:0]         s_axi_arsize
    .s_axi_arburst                  (m_axi_arburst),  // input [1:0]            s_axi_arburst
    .s_axi_arlock                   (m_axi_arlock),  // input [0:0]         s_axi_arlock
    .s_axi_arcache                  (m_axi_arcache),  // input [3:0]            s_axi_arcache
    .s_axi_arprot                   (m_axi_arprot),  // input [2:0]         s_axi_arprot
    .s_axi_arqos                    (m_axi_arqos),  // input [3:0]          s_axi_arqos
    .s_axi_arvalid                  (m_axi_arvalid),  // input          s_axi_arvalid
    .s_axi_arready                  (m_axi_arready),  // output         s_axi_arready
    // Slave Interface Read Data Ports
    .s_axi_rid                      (m_axi_rid),  // output [15:0]          s_axi_rid
    .s_axi_rdata                    (m_axi_rdata),  // output [511:0]           s_axi_rdata
    .s_axi_rresp                    (m_axi_rresp),  // output [1:0]         s_axi_rresp
    .s_axi_rlast                    (m_axi_rlast),  // output           s_axi_rlast
    .s_axi_rvalid                   (m_axi_rvalid),  // output          s_axi_rvalid
    .s_axi_rready                   (m_axi_rready),  // input           s_axi_rready

    // System Clock Ports
    .sys_clk_i                      (sys_clk),
    .sys_rst                        (sys_rst_n) // input sys_rst
);

`endif // PITONSYS_DDR4
`else  //`ifndef PITONSYS_MEEP

    assign ui_clk_sync_rst = ~mc_rstn; //~sys_rst_n;
    assign ui_clk = mc_clk;

`endif //`ifndef PITONSYS_MEEP

`endif // PITONSYS_AXI4_MEM

`ifdef PITON_PROTO
`ifndef PITON_PROTO_NO_MON
`ifndef PITONSYS_AXI4_MEM

    always @(posedge ui_clk) begin
        if (app_en) begin
            $display("MC_TOP: command to MIG. Addr: 0x%x, cmd: 0x%x at", app_addr, app_cmd, $time);
        end

        if (app_wdf_wren) begin
            $display("MC_TOP: writing data 0x%x to memory at", app_wdf_data, $time);
        end

        if (app_rd_data_valid) begin
            $display("MC_TOP: read data 0x%x from memory at", app_rd_data, $time);
        end
    end

`endif  // PITONSYS_AXI4_MEM
`endif  // PITON_PROTO_NO_MON
`endif  // PITON_PROTO
`endif  // PITON_FPGA_MC_DDR3

endmodule 
