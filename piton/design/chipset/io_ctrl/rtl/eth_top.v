// Modified by Barcelona Supercomputing Center on March 3rd, 2022
// ========== Copyright Header Begin ============================================
// Copyright (c) 2017 Princeton University
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

//--------------------------------------------------
// Description:     Top level for FPGA MAC
// Author:          Alexey Lavrov
// Company:         Princeton University
// Created:         1/25/2017
//--------------------------------------------------

`ifdef  PITON_FPGA_ETH
`ifndef PITON_FPGA_ETHERNETLITE
`include "noc_axi4_bridge_define.vh"
`endif
`endif

module eth_top #(
  parameter SWAP_ENDIANESS = 0,
  parameter NUM_INTR       = 1
) (
    input                                   chipset_clk,

    input                                   rst_n,

    output      [NUM_INTR-1:0]              net_interrupt,

    input                                   noc_in_val,
    input       [`NOC_DATA_WIDTH-1:0]       noc_in_data,
    output                                  noc_in_rdy,

    output                                  noc_out_val,
    output      [`NOC_DATA_WIDTH-1:0]       noc_out_data,
    input                                   noc_out_rdy

`ifdef PITON_FPGA_ETHERNETLITE
                                            ,
    input                                   net_axi_clk,
    output                                  net_phy_rst_n,

    input                                   net_phy_tx_clk,
    output                                  net_phy_tx_en,
    output  [3 : 0]                         net_phy_tx_data,

    input                                   net_phy_rx_clk,
    input                                   net_phy_dv,
    input  [3 : 0]                          net_phy_rx_data,
    input                                   net_phy_rx_er,

    inout                                   net_phy_mdio_io,
    output                                  net_phy_mdc
`elsif PITON_FPGA_ETH_CMAC // PITON_FPGA_ETHERNETLITE
                   ,
     // Eth DMA master channels
     output [`AXI4_ID_WIDTH     -1:0]     eth_sg_dma_awid,
     output [`AXI4_ADDR_WIDTH   -1:0]     eth_sg_dma_awaddr,
     output [`AXI4_LEN_WIDTH    -1:0]     eth_sg_dma_awlen,
     output [`AXI4_SIZE_WIDTH   -1:0]     eth_sg_dma_awsize,
     output [`AXI4_BURST_WIDTH  -1:0]     eth_sg_dma_awburst,
     output                               eth_sg_dma_awlock,
     output [`AXI4_CACHE_WIDTH  -1:0]     eth_sg_dma_awcache,
     output [`AXI4_PROT_WIDTH   -1:0]     eth_sg_dma_awprot,
     output [`AXI4_QOS_WIDTH    -1:0]     eth_sg_dma_awqos,
     output [`AXI4_REGION_WIDTH -1:0]     eth_sg_dma_awregion,
     output [`AXI4_USER_WIDTH   -1:0]     eth_sg_dma_awuser,
     output                               eth_sg_dma_awvalid,
     input                                eth_sg_dma_awready,

     output  [`AXI4_ID_WIDTH     -1:0]    eth_sg_dma_wid,
     output  [`AXI4_DATA_WIDTH   -1:0]    eth_sg_dma_wdata,
     output  [`AXI4_STRB_WIDTH   -1:0]    eth_sg_dma_wstrb,
     output                               eth_sg_dma_wlast,
     output  [`AXI4_USER_WIDTH   -1:0]    eth_sg_dma_wuser,
     output                               eth_sg_dma_wvalid,
     input                                eth_sg_dma_wready,
     
     output  [`AXI4_ID_WIDTH     -1:0]    eth_sg_dma_arid,
     output  [`AXI4_ADDR_WIDTH   -1:0]    eth_sg_dma_araddr,
     output  [`AXI4_LEN_WIDTH    -1:0]    eth_sg_dma_arlen,
     output  [`AXI4_SIZE_WIDTH   -1:0]    eth_sg_dma_arsize,
     output  [`AXI4_BURST_WIDTH  -1:0]    eth_sg_dma_arburst,
     output                               eth_sg_dma_arlock,
     output  [`AXI4_CACHE_WIDTH  -1:0]    eth_sg_dma_arcache,
     output  [`AXI4_PROT_WIDTH   -1:0]    eth_sg_dma_arprot,
     output  [`AXI4_QOS_WIDTH    -1:0]    eth_sg_dma_arqos,
     output  [`AXI4_REGION_WIDTH -1:0]    eth_sg_dma_arregion,
     output  [`AXI4_USER_WIDTH   -1:0]    eth_sg_dma_aruser,
     output                               eth_sg_dma_arvalid,
     input                                eth_sg_dma_arready,
     
     input   [`AXI4_ID_WIDTH     -1:0]    eth_sg_dma_rid,
     input   [`AXI4_DATA_WIDTH   -1:0]    eth_sg_dma_rdata,
     input   [`AXI4_RESP_WIDTH   -1:0]    eth_sg_dma_rresp,
     input                                eth_sg_dma_rlast,
     input   [`AXI4_USER_WIDTH   -1:0]    eth_sg_dma_ruser,
     input                                eth_sg_dma_rvalid,
     output                               eth_sg_dma_rready,
     
     input  [`AXI4_ID_WIDTH     -1:0]     eth_sg_dma_bid,
     input  [`AXI4_RESP_WIDTH   -1:0]     eth_sg_dma_bresp,
     input  [`AXI4_USER_WIDTH   -1:0]     eth_sg_dma_buser,
     input                                eth_sg_dma_bvalid,
     output                               eth_sg_dma_bready,


     output [`AXI4_ID_WIDTH     -1:0]     eth_tx_dma_awid,
     output [`AXI4_ADDR_WIDTH   -1:0]     eth_tx_dma_awaddr,
     output [`AXI4_LEN_WIDTH    -1:0]     eth_tx_dma_awlen,
     output [`AXI4_SIZE_WIDTH   -1:0]     eth_tx_dma_awsize,
     output [`AXI4_BURST_WIDTH  -1:0]     eth_tx_dma_awburst,
     output                               eth_tx_dma_awlock,
     output [`AXI4_CACHE_WIDTH  -1:0]     eth_tx_dma_awcache,
     output [`AXI4_PROT_WIDTH   -1:0]     eth_tx_dma_awprot,
     output [`AXI4_QOS_WIDTH    -1:0]     eth_tx_dma_awqos,
     output [`AXI4_REGION_WIDTH -1:0]     eth_tx_dma_awregion,
     output [`AXI4_USER_WIDTH   -1:0]     eth_tx_dma_awuser,
     output                               eth_tx_dma_awvalid,
     input                                eth_tx_dma_awready,

     output  [`AXI4_ID_WIDTH     -1:0]    eth_tx_dma_wid,
     output  [`AXI4_DATA_WIDTH   -1:0]    eth_tx_dma_wdata,
     output  [`AXI4_STRB_WIDTH   -1:0]    eth_tx_dma_wstrb,
     output                               eth_tx_dma_wlast,
     output  [`AXI4_USER_WIDTH   -1:0]    eth_tx_dma_wuser,
     output                               eth_tx_dma_wvalid,
     input                                eth_tx_dma_wready,
     
     output  [`AXI4_ID_WIDTH     -1:0]    eth_tx_dma_arid,
     output  [`AXI4_ADDR_WIDTH   -1:0]    eth_tx_dma_araddr,
     output  [`AXI4_LEN_WIDTH    -1:0]    eth_tx_dma_arlen,
     output  [`AXI4_SIZE_WIDTH   -1:0]    eth_tx_dma_arsize,
     output  [`AXI4_BURST_WIDTH  -1:0]    eth_tx_dma_arburst,
     output                               eth_tx_dma_arlock,
     output  [`AXI4_CACHE_WIDTH  -1:0]    eth_tx_dma_arcache,
     output  [`AXI4_PROT_WIDTH   -1:0]    eth_tx_dma_arprot,
     output  [`AXI4_QOS_WIDTH    -1:0]    eth_tx_dma_arqos,
     output  [`AXI4_REGION_WIDTH -1:0]    eth_tx_dma_arregion,
     output  [`AXI4_USER_WIDTH   -1:0]    eth_tx_dma_aruser,
     output                               eth_tx_dma_arvalid,
     input                                eth_tx_dma_arready,
     
     input   [`AXI4_ID_WIDTH     -1:0]    eth_tx_dma_rid,
     input   [`AXI4_DATA_WIDTH   -1:0]    eth_tx_dma_rdata,
     input   [`AXI4_RESP_WIDTH   -1:0]    eth_tx_dma_rresp,
     input                                eth_tx_dma_rlast,
     input   [`AXI4_USER_WIDTH   -1:0]    eth_tx_dma_ruser,
     input                                eth_tx_dma_rvalid,
     output                               eth_tx_dma_rready,
     
     input  [`AXI4_ID_WIDTH     -1:0]     eth_tx_dma_bid,
     input  [`AXI4_RESP_WIDTH   -1:0]     eth_tx_dma_bresp,
     input  [`AXI4_USER_WIDTH   -1:0]     eth_tx_dma_buser,
     input                                eth_tx_dma_bvalid,
     output                               eth_tx_dma_bready,

     output                               eth_tx_dma_clk,
     output                               eth_tx_dma_rstn,


     output [`AXI4_ID_WIDTH     -1:0]     eth_rx_dma_awid,
     output [`AXI4_ADDR_WIDTH   -1:0]     eth_rx_dma_awaddr,
     output [`AXI4_LEN_WIDTH    -1:0]     eth_rx_dma_awlen,
     output [`AXI4_SIZE_WIDTH   -1:0]     eth_rx_dma_awsize,
     output [`AXI4_BURST_WIDTH  -1:0]     eth_rx_dma_awburst,
     output                               eth_rx_dma_awlock,
     output [`AXI4_CACHE_WIDTH  -1:0]     eth_rx_dma_awcache,
     output [`AXI4_PROT_WIDTH   -1:0]     eth_rx_dma_awprot,
     output [`AXI4_QOS_WIDTH    -1:0]     eth_rx_dma_awqos,
     output [`AXI4_REGION_WIDTH -1:0]     eth_rx_dma_awregion,
     output [`AXI4_USER_WIDTH   -1:0]     eth_rx_dma_awuser,
     output                               eth_rx_dma_awvalid,
     input                                eth_rx_dma_awready,

     output  [`AXI4_ID_WIDTH     -1:0]    eth_rx_dma_wid,
     output  [`AXI4_DATA_WIDTH   -1:0]    eth_rx_dma_wdata,
     output  [`AXI4_STRB_WIDTH   -1:0]    eth_rx_dma_wstrb,
     output                               eth_rx_dma_wlast,
     output  [`AXI4_USER_WIDTH   -1:0]    eth_rx_dma_wuser,
     output                               eth_rx_dma_wvalid,
     input                                eth_rx_dma_wready,
     
     output  [`AXI4_ID_WIDTH     -1:0]    eth_rx_dma_arid,
     output  [`AXI4_ADDR_WIDTH   -1:0]    eth_rx_dma_araddr,
     output  [`AXI4_LEN_WIDTH    -1:0]    eth_rx_dma_arlen,
     output  [`AXI4_SIZE_WIDTH   -1:0]    eth_rx_dma_arsize,
     output  [`AXI4_BURST_WIDTH  -1:0]    eth_rx_dma_arburst,
     output                               eth_rx_dma_arlock,
     output  [`AXI4_CACHE_WIDTH  -1:0]    eth_rx_dma_arcache,
     output  [`AXI4_PROT_WIDTH   -1:0]    eth_rx_dma_arprot,
     output  [`AXI4_QOS_WIDTH    -1:0]    eth_rx_dma_arqos,
     output  [`AXI4_REGION_WIDTH -1:0]    eth_rx_dma_arregion,
     output  [`AXI4_USER_WIDTH   -1:0]    eth_rx_dma_aruser,
     output                               eth_rx_dma_arvalid,
     input                                eth_rx_dma_arready,
     
     input   [`AXI4_ID_WIDTH     -1:0]    eth_rx_dma_rid,
     input   [`AXI4_DATA_WIDTH   -1:0]    eth_rx_dma_rdata,
     input   [`AXI4_RESP_WIDTH   -1:0]    eth_rx_dma_rresp,
     input                                eth_rx_dma_rlast,
     input   [`AXI4_USER_WIDTH   -1:0]    eth_rx_dma_ruser,
     input                                eth_rx_dma_rvalid,
     output                               eth_rx_dma_rready,
     
     input  [`AXI4_ID_WIDTH     -1:0]     eth_rx_dma_bid,
     input  [`AXI4_RESP_WIDTH   -1:0]     eth_rx_dma_bresp,
     input  [`AXI4_USER_WIDTH   -1:0]     eth_rx_dma_buser,
     input                                eth_rx_dma_bvalid,
     output                               eth_rx_dma_bready,

     output                               eth_rx_dma_clk,
     output                               eth_rx_dma_rstn,

    input          eth_init_clk,
    input          qsfp_ref_clk_n,
    input          qsfp_ref_clk_p,
    input   [3:0]  qsfp_4x_grx_n,
    input   [3:0]  qsfp_4x_grx_p,
    output  [3:0]  qsfp_4x_gtx_n,
    output  [3:0]  qsfp_4x_gtx_p
`endif // PITON_FPGA_ETH_CMAC
);

`ifdef PITON_FPGA_ETH

// afifo <-> netbridge
wire                            afifo_netbridge_val;
wire    [`NOC_DATA_WIDTH-1:0]   afifo_netbridge_data;
wire                            netbridge_afifo_rdy;

wire                            netbridge_afifo_val;
wire    [`NOC_DATA_WIDTH-1:0]   netbridge_afifo_data;
wire                            fifo_netbridge_rdy;

// netbridge <-> mac axi
`ifdef PITON_FPGA_ETHERNETLITE
wire [`C_M_AXI_LITE_ADDR_WIDTH-1:0]   net_s_axi_awaddr;
wire                            net_s_axi_awvalid;
wire                            net_s_axi_awready;

wire [`C_M_AXI_LITE_DATA_WIDTH-1:0]   net_s_axi_wdata;
wire [`C_M_AXI_LITE_DATA_WIDTH/8-1:0] net_s_axi_wstrb;
wire                            net_s_axi_wvalid;
wire                            net_s_axi_wready;

wire [`C_M_AXI_LITE_RESP_WIDTH-1:0]   net_s_axi_bresp;
wire                            net_s_axi_bvalid;
wire                            net_s_axi_bready;

wire [`C_M_AXI_LITE_ADDR_WIDTH-1:0]   net_s_axi_araddr;
wire                            net_s_axi_arvalid;
wire                            net_s_axi_arready;

wire [`C_M_AXI_LITE_DATA_WIDTH-1:0]   net_s_axi_rdata;
wire [`C_M_AXI_LITE_RESP_WIDTH-1:0]   net_s_axi_rresp;
wire                            net_s_axi_rvalid;
wire                            net_s_axi_rready;

// MDIO
wire                            net_phy_mdio_i;
wire                            net_phy_mdio_o;
wire                            net_phy_mdio_t;

wire net_phy_crs = 1'b0;
wire net_phy_col = 1'b0;

wire net_axi_arstn = rst_n;
(* dont_touch = "true" *) wire unsync_net_int;

`else // PITON_FPGA_ETHERNETLITE, full AXI4 for rest Eth cores
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

wire                               net_axi_clk   = chipset_clk;
wire                               net_axi_arstn = rst_n;
wire  [NUM_INTR-1:0]               unsync_net_int;
`endif


`ifndef PITON_FPGA_ETH_CMAC
`ifndef PITON_FPGA_ETHERNETLITE
  `define NO_ETH_CORE
`endif
`endif

`ifndef NO_ETH_CORE
noc_bidir_afifo  net_afifo  (
    .clk_1           (chipset_clk           ),
    .rst_1           (~rst_n                ),

    .clk_2           (net_axi_clk           ),
    .rst_2           (~net_axi_arstn        ),

    // CPU --> EMACLITE
    .flit_in_val_1   (noc_in_val      ),
    .flit_in_data_1  (noc_in_data     ),
    .flit_in_rdy_1   (noc_in_rdy      ),

    .flit_out_val_2  (afifo_netbridge_val   ),
    .flit_out_data_2 (afifo_netbridge_data  ),
    .flit_out_rdy_2  (netbridge_afifo_rdy   ),

    // EMACLITE --> CPU
    .flit_in_val_2   (netbridge_afifo_val   ),
    .flit_in_data_2  (netbridge_afifo_data  ),
    .flit_in_rdy_2   (afifo_netbridge_rdy   ),

    .flit_out_val_1  (noc_out_val      ),
    .flit_out_data_1 (noc_out_data     ),
    .flit_out_rdy_1  (noc_out_rdy      )
);
`else // NO_ETH_CORE
	// NO ETHERNET CORE
  assign afifo_netbridge_val  = noc_in_val;
  assign afifo_netbridge_data = noc_in_data;
  assign noc_in_rdy = netbridge_afifo_rdy;

  assign noc_out_val  = netbridge_afifo_val;
  assign noc_out_data = netbridge_afifo_data;
  assign afifo_netbridge_rdy = noc_out_rdy;
`endif

`ifdef PITON_FPGA_ETHERNETLITE
noc_axilite_bridge #(
    .SLAVE_RESP_BYTEWIDTH   (4),
    .SWAP_ENDIANESS         (SWAP_ENDIANESS)
) noc_ethernet_bridge (
    .clk                    (net_axi_clk        ),
    .rst                    (~rst_n             ),      // TODO: rewrite to positive ?

    .splitter_bridge_val    (afifo_netbridge_val   ),
    .splitter_bridge_data   (afifo_netbridge_data  ),
    .bridge_splitter_rdy    (netbridge_afifo_rdy   ),   // CRAZY NAMING !

    .bridge_splitter_val    (netbridge_afifo_val   ),
    .bridge_splitter_data   (netbridge_afifo_data  ),
    .splitter_bridge_rdy    (afifo_netbridge_rdy   ),   // CRAZY NAMING !

    //axi lite signals
    //write address channel
    .m_axi_awaddr        (net_s_axi_awaddr),
    .m_axi_awvalid       (net_s_axi_awvalid),
    .m_axi_awready       (net_s_axi_awready),

    //write data channel
    .m_axi_wdata         (net_s_axi_wdata),
    .m_axi_wstrb         (net_s_axi_wstrb),
    .m_axi_wvalid        (net_s_axi_wvalid),
    .m_axi_wready        (net_s_axi_wready),

    //read address channel
    .m_axi_araddr        (net_s_axi_araddr),
    .m_axi_arvalid       (net_s_axi_arvalid),
    .m_axi_arready       (net_s_axi_arready),

    //read data channel
    .m_axi_rdata         (net_s_axi_rdata),
    .m_axi_rresp         (net_s_axi_rresp),
    .m_axi_rvalid        (net_s_axi_rvalid),
    .m_axi_rready        (net_s_axi_rready),

    //write response channel
    .m_axi_bresp         (net_s_axi_bresp),
    .m_axi_bvalid        (net_s_axi_bvalid),
    .m_axi_bready        (net_s_axi_bready)
);

`else // PITON_FPGA_ETHERNETLITE, full AXI4 for rest Eth cores
noc_axi4_bridge #(
    .SWAP_ENDIANESS (SWAP_ENDIANESS)
) noc_ethernet_bridge (
    .clk                (net_axi_clk     ),  
    .rst_n              (net_axi_arstn   ), 
    .uart_boot_en       (1'b0       ),
    .phy_init_done      (1'b1       ),

    .src_bridge_vr_noc2_val(afifo_netbridge_val ),
    .src_bridge_vr_noc2_dat(afifo_netbridge_data),
    .src_bridge_vr_noc2_rdy(netbridge_afifo_rdy ),

    .bridge_dst_vr_noc3_val(netbridge_afifo_val ),
    .bridge_dst_vr_noc3_dat(netbridge_afifo_data),
    .bridge_dst_vr_noc3_rdy(afifo_netbridge_rdy ),

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
`endif

generate
genvar idx;
for(idx=0; idx<NUM_INTR; idx=idx+1) begin: irq_sync
net_int_sync net_int_sync(
  .clk_emac(net_axi_clk),
  .clk_ciop(chipset_clk),
  .rst_n(rst_n),
  .net_int(unsync_net_int[idx]),
  .sync_int(net_interrupt[idx])
);
end
endgenerate

`ifdef PITON_FPGA_ETHERNETLITE

mac_eth_axi_lite mac_eth_axi_lite (
  .s_axi_aclk       (net_axi_clk),       // input wire s_axi_aclk
  .s_axi_aresetn    (rst_n),    // input wire s_axi_aresetn
  .ip2intc_irpt     (unsync_net_int),     // output wire ip2intc_irpt
  .s_axi_awaddr     (net_s_axi_awaddr),     // input wire [12 : 0] s_axi_awaddr
  .s_axi_awvalid    (net_s_axi_awvalid),    // input wire s_axi_awvalid
  .s_axi_awready    (net_s_axi_awready),    // output wire s_axi_awready
  .s_axi_wdata      (net_s_axi_wdata),      // input wire [31 : 0] s_axi_wdata
  .s_axi_wstrb      (net_s_axi_wstrb),      // input wire [3 : 0] s_axi_wstrb
  .s_axi_wvalid     (net_s_axi_wvalid),     // input wire s_axi_wvalid
  .s_axi_wready     (net_s_axi_wready),     // output wire s_axi_wready
  .s_axi_bresp      (net_s_axi_bresp),      // output wire [1 : 0] s_axi_bresp
  .s_axi_bvalid     (net_s_axi_bvalid),     // output wire s_axi_bvalid
  .s_axi_bready     (net_s_axi_bready),     // input wire s_axi_bready
  .s_axi_araddr     (net_s_axi_araddr),     // input wire [12 : 0] s_axi_araddr
  .s_axi_arvalid    (net_s_axi_arvalid),    // input wire s_axi_arvalid
  .s_axi_arready    (net_s_axi_arready),    // output wire s_axi_arready
  .s_axi_rdata      (net_s_axi_rdata),      // output wire [31 : 0] s_axi_rdata
  .s_axi_rresp      (net_s_axi_rresp),      // output wire [1 : 0] s_axi_rresp
  .s_axi_rvalid     (net_s_axi_rvalid),     // output wire s_axi_rvalid
  .s_axi_rready     (net_s_axi_rready),     // input wire s_axi_rready

  .phy_rst_n        (net_phy_rst_n),        // output wire phy_rst_n

  .phy_tx_clk       (net_phy_tx_clk),       // input wire phy_tx_clk
  .phy_tx_en        (net_phy_tx_en),        // output wire phy_tx_en
  .phy_tx_data      (net_phy_tx_data),      // output wire [3 : 0] phy_tx_data

  .phy_rx_clk       (net_phy_rx_clk),       // input wire phy_rx_clk
  .phy_dv           (net_phy_dv),           // input wire phy_dv
  .phy_rx_data      (net_phy_rx_data),      // input wire [3 : 0] phy_rx_data
  .phy_rx_er        (net_phy_rx_er),        // input wire phy_rx_er

  .phy_crs          (net_phy_crs),          // input wire phy_crs
  .phy_col          (net_phy_col),          // input wire phy_col

  .phy_mdio_i       (net_phy_mdio_i),       // input wire phy_mdio_i
  .phy_mdio_o       (net_phy_mdio_o),       // output wire phy_mdio_o
  .phy_mdio_t       (net_phy_mdio_t),       // output wire phy_mdio_t
  .phy_mdc          (net_phy_mdc)           // output wire phy_mdc
);

// Tri-state buffer
IOBUF u_iobuf_dq (
    .I  (net_phy_mdio_o),
    .O  (net_phy_mdio_i),
    .T  (net_phy_mdio_t),
    .IO (net_phy_mdio_io)
);

`elsif PITON_FPGA_ETH_CMAC // PITON_FPGA_ETHERNETLITE
Eth_CMAC_syst eth_cmac_syst (
  .s_axi_clk        (net_axi_clk),          // input wire s_axi_aclk
  .s_axi_resetn     (net_axi_arstn),        // input wire s_axi_aresetn

  .s_axi_awaddr     (core_axi_awaddr),      // input wire s_axi_awaddr
  .s_axi_awvalid    (core_axi_awvalid),     // input wire s_axi_awvalid
  .s_axi_awready    (core_axi_awready),     // output wire s_axi_awready
  .s_axi_wdata      (core_axi_wdata),       // input wire s_axi_wdata
  .s_axi_wstrb      (core_axi_wstrb),       // input wire s_axi_wstrb
  .s_axi_wvalid     (core_axi_wvalid),      // input wire s_axi_wvalid
  .s_axi_wready     (core_axi_wready),      // output wire s_axi_wready
  .s_axi_bresp      (core_axi_bresp),       // output wire s_axi_bresp
  .s_axi_bvalid     (core_axi_bvalid),      // output wire s_axi_bvalid
  .s_axi_bready     (core_axi_bready),      // input wire s_axi_bready
  .s_axi_araddr     (core_axi_araddr),      // input wire s_axi_araddr
  .s_axi_arvalid    (core_axi_arvalid),     // input wire s_axi_arvalid
  .s_axi_arready    (core_axi_arready),     // output wire s_axi_arready
  .s_axi_rdata      (core_axi_rdata),       // output wire s_axi_rdata
  .s_axi_rresp      (core_axi_rresp),       // output wire s_axi_rresp
  .s_axi_rvalid     (core_axi_rvalid),      // output wire s_axi_rvalid
  .s_axi_rready     (core_axi_rready),      // input wire s_axi_rready
  .s_axi_arprot     (core_axi_arprot),      // input read  access permissions
  .s_axi_awprot     (core_axi_awprot),      // input write access permissions

  .s_axi_arburst    (core_axi_arburst),
  .s_axi_arcache    (core_axi_arcache),
  .s_axi_arlen      (core_axi_arlen),
  .s_axi_arlock     (core_axi_arlock),
  .s_axi_arqos      (core_axi_arqos),
  .s_axi_arsize     (core_axi_arsize),
  .s_axi_awburst    (core_axi_awburst),
  .s_axi_awcache    (core_axi_awcache),
  .s_axi_awlen      (core_axi_awlen),
  .s_axi_awlock     (core_axi_awlock),
  .s_axi_awqos      (core_axi_awqos),
  .s_axi_awsize     (core_axi_awsize),
  .s_axi_rlast      (core_axi_rlast),
  .s_axi_wlast      (core_axi_wlast),

  // .s_axi_arid       (core_axi_arid),
  // .s_axi_awid       (core_axi_awid),
  // .s_axi_rid        (core_axi_rid),
  // .s_axi_bid        (core_axi_bid),
  // .s_axi_wid        (core_axi_wid),
  // .s_axi_awuser     (core_axi_awuser),
  // .s_axi_aruser     (core_axi_aruser),
  // .s_axi_buser      (core_axi_buser),
  // .s_axi_ruser      (core_axi_ruser),
  // .s_axi_wuser      (core_axi_wuser),
  // .s_axi_awregion   (core_axi_awregion),
  // .s_axi_arregion   (core_axi_arregion),

  // DMA master channels
  .m_axi_sg_araddr(eth_sg_dma_araddr),
  .m_axi_sg_arburst(eth_sg_dma_arburst),
  .m_axi_sg_arcache(eth_sg_dma_arcache),
  .m_axi_sg_arlen(eth_sg_dma_arlen),
  .m_axi_sg_arprot(eth_sg_dma_arprot),
  .m_axi_sg_arready(eth_sg_dma_arready),
  .m_axi_sg_arsize(eth_sg_dma_arsize),
  .m_axi_sg_arvalid(eth_sg_dma_arvalid),
  .m_axi_sg_awaddr(eth_sg_dma_awaddr),
  .m_axi_sg_awburst(eth_sg_dma_awburst),
  .m_axi_sg_awcache(eth_sg_dma_awcache),
  .m_axi_sg_awlen(eth_sg_dma_awlen),
  .m_axi_sg_awprot(eth_sg_dma_awprot),
  .m_axi_sg_awready(eth_sg_dma_awready),
  .m_axi_sg_awsize(eth_sg_dma_awsize),
  .m_axi_sg_awvalid(eth_sg_dma_awvalid),
  .m_axi_sg_bready(eth_sg_dma_bready),
  .m_axi_sg_bresp(eth_sg_dma_bresp),
  .m_axi_sg_bvalid(eth_sg_dma_bvalid),
  .m_axi_sg_rdata(eth_sg_dma_rdata),
  .m_axi_sg_rlast(eth_sg_dma_rlast),
  .m_axi_sg_rready(eth_sg_dma_rready),
  .m_axi_sg_rresp(eth_sg_dma_rresp),
  .m_axi_sg_rvalid(eth_sg_dma_rvalid),
  .m_axi_sg_wdata(eth_sg_dma_wdata),
  .m_axi_sg_wlast(eth_sg_dma_wlast),
  .m_axi_sg_wready(eth_sg_dma_wready),
  .m_axi_sg_wstrb(eth_sg_dma_wstrb),
  .m_axi_sg_wvalid(eth_sg_dma_wvalid),

  .m_axi_tx_araddr(eth_tx_dma_araddr),
  .m_axi_tx_arburst(eth_tx_dma_arburst),
  .m_axi_tx_arcache(eth_tx_dma_arcache),
  .m_axi_tx_arlen(eth_tx_dma_arlen),
  .m_axi_tx_arlock(eth_tx_dma_arlock),
  .m_axi_tx_arprot(eth_tx_dma_arprot),
  .m_axi_tx_arqos(eth_tx_dma_arqos),
  .m_axi_tx_arready(eth_tx_dma_arready),
  .m_axi_tx_arsize(eth_tx_dma_arsize),
  .m_axi_tx_arvalid(eth_tx_dma_arvalid),
  // .m_axi_tx_awaddr(eth_tx_dma_awaddr),
  // .m_axi_tx_awburst(eth_tx_dma_awburst),
  // .m_axi_tx_awcache(eth_tx_dma_awcache),
  // .m_axi_tx_awlen(eth_tx_dma_awlen),
  // .m_axi_tx_awlock(eth_tx_dma_awlock),
  // .m_axi_tx_awprot(eth_tx_dma_awprot),
  // .m_axi_tx_awqos(eth_tx_dma_awqos),
  // .m_axi_tx_awready(eth_tx_dma_awready),
  // .m_axi_tx_awsize(eth_tx_dma_awsize),
  // .m_axi_tx_awvalid(eth_tx_dma_awvalid),
  // .m_axi_tx_bready(eth_tx_dma_bready),
  // .m_axi_tx_bresp(eth_tx_dma_bresp),
  // .m_axi_tx_bvalid(eth_tx_dma_bvalid),
  .m_axi_tx_rdata(eth_tx_dma_rdata),
  .m_axi_tx_rlast(eth_tx_dma_rlast),
  .m_axi_tx_rready(eth_tx_dma_rready),
  .m_axi_tx_rresp(eth_tx_dma_rresp),
  .m_axi_tx_rvalid(eth_tx_dma_rvalid),
  // .m_axi_tx_wdata(eth_tx_dma_wdata),
  // .m_axi_tx_wlast(eth_tx_dma_wlast),
  // .m_axi_tx_wready(eth_tx_dma_wready),
  // .m_axi_tx_wstrb(eth_tx_dma_wstrb),
  // .m_axi_tx_wvalid(eth_tx_dma_wvalid),
  .tx_clk(eth_tx_dma_clk),
  .tx_rstn(eth_tx_dma_rstn),

  // .m_axi_rx_araddr(eth_rx_dma_araddr),
  // .m_axi_rx_arburst(eth_rx_dma_arburst),
  // .m_axi_rx_arcache(eth_rx_dma_arcache),
  // .m_axi_rx_arlen(eth_rx_dma_arlen),
  // .m_axi_rx_arlock(eth_rx_dma_arlock),
  // .m_axi_rx_arprot(eth_rx_dma_arprot),
  // .m_axi_rx_arqos(eth_rx_dma_arqos),
  // .m_axi_rx_arready(eth_rx_dma_arready),
  // .m_axi_rx_arsize(eth_rx_dma_arsize),
  // .m_axi_rx_arvalid(eth_rx_dma_arvalid),
  .m_axi_rx_awaddr(eth_rx_dma_awaddr),
  .m_axi_rx_awburst(eth_rx_dma_awburst),
  .m_axi_rx_awcache(eth_rx_dma_awcache),
  .m_axi_rx_awlen(eth_rx_dma_awlen),
  .m_axi_rx_awlock(eth_rx_dma_awlock),
  .m_axi_rx_awprot(eth_rx_dma_awprot),
  .m_axi_rx_awqos(eth_rx_dma_awqos),
  .m_axi_rx_awready(eth_rx_dma_awready),
  .m_axi_rx_awsize(eth_rx_dma_awsize),
  .m_axi_rx_awvalid(eth_rx_dma_awvalid),
  .m_axi_rx_bready(eth_rx_dma_bready),
  .m_axi_rx_bresp(eth_rx_dma_bresp),
  .m_axi_rx_bvalid(eth_rx_dma_bvalid),
  // .m_axi_rx_rdata(eth_rx_dma_rdata),
  // .m_axi_rx_rlast(eth_rx_dma_rlast),
  // .m_axi_rx_rready(eth_rx_dma_rready),
  // .m_axi_rx_rresp(eth_rx_dma_rresp),
  // .m_axi_rx_rvalid(eth_rx_dma_rvalid),
  .m_axi_rx_wdata(eth_rx_dma_wdata),
  .m_axi_rx_wlast(eth_rx_dma_wlast),
  .m_axi_rx_wready(eth_rx_dma_wready),
  .m_axi_rx_wstrb(eth_rx_dma_wstrb),
  .m_axi_rx_wvalid(eth_rx_dma_wvalid),
  .rx_clk(eth_rx_dma_clk),
  .rx_rstn(eth_rx_dma_rstn),

  .intc               (unsync_net_int), // output interrupts (0-tx, 1-rx)

  .init_clk           (eth_init_clk),   // free-running clock required for Xilinx CMAC initialization in range 50...250 MHz
  .qsfp_refck_clk_n   (qsfp_ref_clk_n),
  .qsfp_refck_clk_p   (qsfp_ref_clk_p),
  .qsfp_4x_grx_n      (qsfp_4x_grx_n),
  .qsfp_4x_grx_p      (qsfp_4x_grx_p),
  .qsfp_4x_gtx_n      (qsfp_4x_gtx_n),
  .qsfp_4x_gtx_p      (qsfp_4x_gtx_p)
);

  assign core_axi_ruser       = `AXI4_USER_WIDTH'h0;
  assign core_axi_buser       = `AXI4_USER_WIDTH'h0;

  assign eth_tx_dma_awid      = `AXI4_ID_WIDTH'h0;
  assign eth_tx_dma_awaddr    = `AXI4_ADDR_WIDTH'h0;
  assign eth_tx_dma_awlen     = `AXI4_LEN_WIDTH'h0;
  assign eth_tx_dma_awsize    = `AXI4_SIZE_WIDTH'h0;
  assign eth_tx_dma_awburst   = `AXI4_BURST_WIDTH'h0;
  assign eth_tx_dma_awlock    = 1'b0;
  assign eth_tx_dma_awcache   = `AXI4_CACHE_WIDTH'h0;
  assign eth_tx_dma_awprot    = `AXI4_PROT_WIDTH'h0;
  assign eth_tx_dma_awqos     = `AXI4_QOS_WIDTH'h0;
  assign eth_tx_dma_awregion  = `AXI4_REGION_WIDTH'h0;
  assign eth_tx_dma_awuser    = `AXI4_USER_WIDTH'h0;
  assign eth_tx_dma_awvalid   = 1'b0;

  assign eth_tx_dma_wid       = `AXI4_ID_WIDTH'h0;
  assign eth_tx_dma_wdata     = `AXI4_DATA_WIDTH'h0;
  assign eth_tx_dma_wstrb     = `AXI4_STRB_WIDTH'h0;
  assign eth_tx_dma_wlast     = 1'b0;
  assign eth_tx_dma_wuser     = `AXI4_USER_WIDTH'h0;
  assign eth_tx_dma_wvalid    = 1'b0;
  assign eth_tx_dma_bready    = 1'b1;

  assign eth_rx_dma_arid      = `AXI4_ID_WIDTH'h0;
  assign eth_rx_dma_araddr    = `AXI4_ADDR_WIDTH'h0;
  assign eth_rx_dma_arlen     = `AXI4_LEN_WIDTH'h0;
  assign eth_rx_dma_arsize    = `AXI4_SIZE_WIDTH'h0;
  assign eth_rx_dma_arburst   = `AXI4_BURST_WIDTH'h0;
  assign eth_rx_dma_arlock    = 1'b0;
  assign eth_rx_dma_arcache   = `AXI4_CACHE_WIDTH'h0;
  assign eth_rx_dma_arprot    = `AXI4_PROT_WIDTH'h0;
  assign eth_rx_dma_arqos     = `AXI4_QOS_WIDTH'h0;
  assign eth_rx_dma_arregion  = `AXI4_REGION_WIDTH'h0;
  assign eth_rx_dma_aruser    = `AXI4_USER_WIDTH'h0;
  assign eth_rx_dma_arvalid   = 1'b0;
  assign eth_rx_dma_rready    = 1'b1;

  //These signals are not drived by 100GbE if DMA buses are intended for DDR (AXI4)
  assign eth_sg_dma_arlock    = 1'b0;
  assign eth_sg_dma_arqos     = `AXI4_QOS_WIDTH'h0;
  assign eth_sg_dma_awlock    = 1'b0;
  assign eth_sg_dma_awqos     = `AXI4_QOS_WIDTH'h0;

`else // PITON_FPGA_ETH_CMAC
  // Ethernet core stub for simulation
  assign core_axi_awready = 1'b1;
  assign core_axi_wready  = 1'b1;
  assign core_axi_arready = 1'b1;

  reg core_axi_rvalid_reg;
  reg [`AXI4_ID_WIDTH-1:0] core_axi_rid_reg;
  always @(posedge net_axi_clk) begin
    if (~net_axi_arstn) begin
      core_axi_rvalid_reg <= 1'b0;
      core_axi_rid_reg <= `AXI4_ID_WIDTH'h0;
    end
    else if (core_axi_arvalid) begin 
      core_axi_rvalid_reg <= 1'b1;
      core_axi_rid_reg <= core_axi_arid;
    end
    else if (core_axi_rready) core_axi_rvalid_reg <= 1'b0;
  end
  assign core_axi_rvalid = core_axi_rvalid_reg;
  assign core_axi_rid    = core_axi_rid_reg;
  assign core_axi_rdata  = {(`AXI4_DATA_WIDTH/64/2+1){64'hDEADBEEFFEEDC0DE}};
  assign core_axi_rresp  = 2'h0;
  assign core_axi_rlast  = core_axi_rvalid;
  assign core_axi_ruser  = `AXI4_USER_WIDTH'h0;

  reg core_axi_bvalid_reg;
  reg [`AXI4_ID_WIDTH-1:0] core_axi_bid_reg;
  always @(posedge net_axi_clk) begin
    if (~net_axi_arstn) begin 
      core_axi_bvalid_reg <= 1'b0;
      core_axi_bid_reg <= `AXI4_ID_WIDTH'h0;
    end
    else if (core_axi_wvalid & core_axi_wlast) begin
      core_axi_bvalid_reg <= 1'b1;
      core_axi_bid_reg <= core_axi_wid;
    end
    else if (core_axi_bready) core_axi_bvalid_reg <= 1'b0;
  end
  assign core_axi_bvalid  = core_axi_bvalid_reg;
  assign core_axi_bid     = core_axi_bid_reg;
  assign core_axi_bresp   = 2'h0;
  assign core_axi_buser   = `AXI4_USER_WIDTH'h0;

  assign unsync_net_int = {NUM_INTR{1'h0}};
`endif

`else  // PITON_FPGA_ETH

    assign noc_in_rdy    = 1'b0;
    assign noc_out_val    = 1'b0;
    assign noc_out_data   = {`NOC_DATA_WIDTH{1'b0}};

    assign net_phy_tx_en        = 1'b0;
    assign net_phy_mdc          = 1'b0;

    assign net_interrupt = {NUM_INTR{1'h0}};

`endif  // PITON_FPGA_ETH

endmodule
