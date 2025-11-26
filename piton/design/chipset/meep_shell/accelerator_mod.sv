// Copyright 2023 Barcelona Supercomputing Center-Centro Nacional de Supercomputación

// Licensed under the Solderpad Hardware License v 2.1 (the "License");
// you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
// You may obtain a copy of the License at
//  
//     http://www.solderpad.org/licenses/SHL-2.1
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// Authors: Daniel J.Mazure, Alex Kropotov BSC-CNS
// Date: 15.03.2023
// Description: 

// Please put only whole line comments in this file

module openpiton_wrapper(
    input            chipset_clk,
    input            mc_clk,
    input            vpu_clk,
    input   [4:0]    pcie_gpio ,
    output           ExtArstn,
    input            mc_rstn,

    // AXI Write Address Channel Signals
    output   [`AXI4_ID_WIDTH     -1:0]    mem_axi_awid,
    output   [`AXI4_ADDR_WIDTH   -1:0]    mem_axi_awaddr,
    output   [`AXI4_LEN_WIDTH    -1:0]    mem_axi_awlen,
    output   [`AXI4_SIZE_WIDTH   -1:0]    mem_axi_awsize,
    output   [`AXI4_BURST_WIDTH  -1:0]    mem_axi_awburst,
    output                                mem_axi_awlock,
    output   [`AXI4_CACHE_WIDTH  -1:0]    mem_axi_awcache,
    output   [`AXI4_PROT_WIDTH   -1:0]    mem_axi_awprot,
    output   [`AXI4_QOS_WIDTH    -1:0]    mem_axi_awqos,
    output   [`AXI4_REGION_WIDTH -1:0]    mem_axi_awregion,
    output   [`AXI4_USER_WIDTH   -1:0]    mem_axi_awuser,
    output                                mem_axi_awvalid,
    input                                 mem_axi_awready,

    // AXI Write Data Channel Signals
    output   [`AXI4_ID_WIDTH     -1:0]    mem_axi_wid,
    output   [`AXI4_DATA_WIDTH   -1:0]    mem_axi_wdata,
    output   [`AXI4_STRB_WIDTH   -1:0]    mem_axi_wstrb,
    output                                mem_axi_wlast,
    output   [`AXI4_USER_WIDTH   -1:0]    mem_axi_wuser,
    output                                mem_axi_wvalid,
    input                                 mem_axi_wready,

    // AXI Read Address Channel Signals
    output   [`AXI4_ID_WIDTH     -1:0]    mem_axi_arid,
    output   [`AXI4_ADDR_WIDTH   -1:0]    mem_axi_araddr,
    output   [`AXI4_LEN_WIDTH    -1:0]    mem_axi_arlen,
    output   [`AXI4_SIZE_WIDTH   -1:0]    mem_axi_arsize,
    output   [`AXI4_BURST_WIDTH  -1:0]    mem_axi_arburst,
    output                                mem_axi_arlock,
    output   [`AXI4_CACHE_WIDTH  -1:0]    mem_axi_arcache,
    output   [`AXI4_PROT_WIDTH   -1:0]    mem_axi_arprot,
    output   [`AXI4_QOS_WIDTH    -1:0]    mem_axi_arqos,
    output   [`AXI4_REGION_WIDTH -1:0]    mem_axi_arregion,
    output   [`AXI4_USER_WIDTH   -1:0]    mem_axi_aruser,
    output                                mem_axi_arvalid,
    input                                 mem_axi_arready,

    // AXI Read Data Channel Signals
    input    [`AXI4_ID_WIDTH     -1:0]    mem_axi_rid,
    input    [`AXI4_DATA_WIDTH   -1:0]    mem_axi_rdata,
    input    [`AXI4_RESP_WIDTH   -1:0]    mem_axi_rresp,
    input                                 mem_axi_rlast,
    input    [`AXI4_USER_WIDTH   -1:0]    mem_axi_ruser,
    input                                 mem_axi_rvalid,
    output                                mem_axi_rready,

    // AXI Write Response Channel Signals
    input    [`AXI4_ID_WIDTH     -1:0]    mem_axi_bid,
    input    [`AXI4_RESP_WIDTH   -1:0]    mem_axi_bresp,
    input    [`AXI4_USER_WIDTH   -1:0]    mem_axi_buser,
    input                                 mem_axi_bvalid,
    output                                mem_axi_bready,

    input mem_calib_complete,

 	    //Ethernet
    input                                eth_axi_aclk,
    input                                eth_axi_arstn,        
    input    [1:0]                       eth_irq,
    
  `ifdef ETHERNET_DMA
    output [`C_M_AXI_LITE_ADDR_WIDTH-1:0]   eth_axi_awaddr,
    output                                  eth_axi_awvalid,
    input                                   eth_axi_awready,

    output [`C_M_AXI_LITE_DATA_WIDTH-1:0]   eth_axi_wdata,
    output [`C_M_AXI_LITE_DATA_WIDTH/8-1:0] eth_axi_wstrb,
    output                                  eth_axi_wvalid,
    input                                   eth_axi_wready,

    input  [`C_M_AXI_LITE_RESP_WIDTH-1:0]   eth_axi_bresp,
    input                                   eth_axi_bvalid,
    output                                  eth_axi_bready,

    output [`C_M_AXI_LITE_ADDR_WIDTH-1:0]   eth_axi_araddr,
    output                                  eth_axi_arvalid,
    input                                   eth_axi_arready,

    input  [`C_M_AXI_LITE_DATA_WIDTH-1:0]   eth_axi_rdata,
    input  [`C_M_AXI_LITE_RESP_WIDTH-1:0]   eth_axi_rresp,
    input                                   eth_axi_rvalid,
    output                                  eth_axi_rready,

  `else
    // AXI interface
    output  [`AXI4_ID_WIDTH     -1:0]    eth_axi_awid,
    output  [`AXI4_ADDR_WIDTH   -1:0]    eth_axi_awaddr,
    output  [`AXI4_LEN_WIDTH    -1:0]    eth_axi_awlen,
    output  [`AXI4_SIZE_WIDTH   -1:0]    eth_axi_awsize,
    output  [`AXI4_BURST_WIDTH  -1:0]    eth_axi_awburst,
    output                               eth_axi_awlock,
    output  [`AXI4_CACHE_WIDTH  -1:0]    eth_axi_awcache,
    output  [`AXI4_PROT_WIDTH   -1:0]    eth_axi_awprot,
    output  [`AXI4_QOS_WIDTH    -1:0]    eth_axi_awqos,
    output  [`AXI4_REGION_WIDTH -1:0]    eth_axi_awregion,
    output  [`AXI4_USER_WIDTH   -1:0]    eth_axi_awuser,
    output                               eth_axi_awvalid,
    input                                eth_axi_awready,

    output   [`AXI4_ID_WIDTH     -1:0]    eth_axi_wid,
    output   [`AXI4_DATA_WIDTH   -1:0]    eth_axi_wdata,
    output   [`AXI4_STRB_WIDTH   -1:0]    eth_axi_wstrb,
    output                                eth_axi_wlast,
    output   [`AXI4_USER_WIDTH   -1:0]    eth_axi_wuser,
    output                                eth_axi_wvalid,
    input                                 eth_axi_wready,

    output   [`AXI4_ID_WIDTH     -1:0]    eth_axi_arid,
    output   [`AXI4_ADDR_WIDTH   -1:0]    eth_axi_araddr,
    output   [`AXI4_LEN_WIDTH    -1:0]    eth_axi_arlen,
    output   [`AXI4_SIZE_WIDTH   -1:0]    eth_axi_arsize,
    output   [`AXI4_BURST_WIDTH  -1:0]    eth_axi_arburst,
    output                                eth_axi_arlock,
    output   [`AXI4_CACHE_WIDTH  -1:0]    eth_axi_arcache,
    output   [`AXI4_PROT_WIDTH   -1:0]    eth_axi_arprot,
    output   [`AXI4_QOS_WIDTH    -1:0]    eth_axi_arqos,
    output   [`AXI4_REGION_WIDTH -1:0]    eth_axi_arregion,
    output   [`AXI4_USER_WIDTH   -1:0]    eth_axi_aruser,
    output                                eth_axi_arvalid,
    input                                 eth_axi_arready,

    input    [`AXI4_ID_WIDTH     -1:0]    eth_axi_rid,
    input    [`AXI4_DATA_WIDTH   -1:0]    eth_axi_rdata,
    input    [`AXI4_RESP_WIDTH   -1:0]    eth_axi_rresp,
    input                                 eth_axi_rlast,
    input    [`AXI4_USER_WIDTH   -1:0]    eth_axi_ruser,
    input                                 eth_axi_rvalid,
    output                                eth_axi_rready,

    input    [`AXI4_ID_WIDTH     -1:0]    eth_axi_bid,
    input    [`AXI4_RESP_WIDTH   -1:0]    eth_axi_bresp,
    input    [`AXI4_USER_WIDTH   -1:0]    eth_axi_buser,
    input                                 eth_axi_bvalid,
    output                                eth_axi_bready,
   `endif

    // AXI non-cacheable system memory
    `ifdef PITON_NONCACH_MEM
    output  [`AXI4_ID_WIDTH     -1:0]    ncmem_axi_awid,
    output  [`AXI4_ADDR_WIDTH   -1:0]    ncmem_axi_awaddr,
    output  [`AXI4_LEN_WIDTH    -1:0]    ncmem_axi_awlen,
    output  [`AXI4_SIZE_WIDTH   -1:0]    ncmem_axi_awsize,
    output  [`AXI4_BURST_WIDTH  -1:0]    ncmem_axi_awburst,
    output                               ncmem_axi_awlock,
    output  [`AXI4_CACHE_WIDTH  -1:0]    ncmem_axi_awcache,
    output  [`AXI4_PROT_WIDTH   -1:0]    ncmem_axi_awprot,
    output  [`AXI4_QOS_WIDTH    -1:0]    ncmem_axi_awqos,
    output  [`AXI4_REGION_WIDTH -1:0]    ncmem_axi_awregion,
    output  [`AXI4_USER_WIDTH   -1:0]    ncmem_axi_awuser,
    output                               ncmem_axi_awvalid,
    input                                ncmem_axi_awready,

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
    `endif

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
    `endif

  `ifdef PITON_RV64_DEBUGUNIT
    // JTAG
    input  dbg_jtag_tck,
    input  dbg_jtag_tdi,
    output dbg_jtag_tdo,
    input  dbg_jtag_tms,
  `endif //`ifdef PITON_RV64_DEBUGUNIT

    // AXI UART
    output [`C_M_AXI_LITE_ADDR_WIDTH-1:0]   m_axi_uart0_awaddr,
    output                                  m_axi_uart0_awvalid,
    input                                   m_axi_uart0_awready,

    output [`C_M_AXI_LITE_DATA_WIDTH-1:0]   m_axi_uart0_wdata,
    output [`C_M_AXI_LITE_DATA_WIDTH/8-1:0] m_axi_uart0_wstrb,
    output                                  m_axi_uart0_wvalid,
    input                                   m_axi_uart0_wready,

    input  [`C_M_AXI_LITE_RESP_WIDTH-1:0]   m_axi_uart0_bresp,
    input                                   m_axi_uart0_bvalid,
    output                                  m_axi_uart0_bready,

    output [`C_M_AXI_LITE_ADDR_WIDTH-1:0]   m_axi_uart0_araddr,
    output                                  m_axi_uart0_arvalid,
    input                                   m_axi_uart0_arready,

    input  [`C_M_AXI_LITE_DATA_WIDTH-1:0]   m_axi_uart0_rdata,
    input  [`C_M_AXI_LITE_RESP_WIDTH-1:0]   m_axi_uart0_rresp,
    input                                   m_axi_uart0_rvalid,
    output                                  m_axi_uart0_rready,
    input                                   uart0_irq
  );

  /* The code inside multi-line comment is passed through to auto-generated by FPGA shell system_top.sv
  `ifdef PITON_EXTRA_MEMS
     // reassignment of vectorized multiple AXI buses to/from name-indexed ones to be used in system_top of FPGA shell
    `MCX_AXI(`PITON_EXTRA_MEMS)
  `endif
  */

  system ACME_OP ( .* );

endmodule
