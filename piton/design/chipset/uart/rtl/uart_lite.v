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

`include "define.tmp.h"
`include "mc_define.h"
`include "chipset_define.vh"

module uart_lite (
    input                                   axi_clk,
    input                                   rst_n,
   
    output                                  uart_tx,
    input                                   uart_rx,
    output                                  uart_interrupt,

    // receive request/send response
    input                                   xbar_uart_noc2_valid,
    input [`NOC_DATA_WIDTH-1:0]             xbar_uart_noc2_data,     
    output                                  uart_xbar_noc2_ready,

    output                                  uart_xbar_noc3_valid,
    output [`NOC_DATA_WIDTH-1:0]            uart_xbar_noc3_data,  
    input                                   xbar_uart_noc3_ready
);

wire [12:0]                        core_axi_awaddr;
wire                               core_axi_awvalid;
wire                               core_axi_awready;
wire [31:0]                        core_axi_wdata;
wire [3:0]                         core_axi_wstrb;
wire                               core_axi_wvalid;
wire                               core_axi_wready;
wire [1:0]                         core_axi_bresp;
wire                               core_axi_bvalid;
wire                               core_axi_bready;
wire [12:0]                        core_axi_araddr;
wire                               core_axi_arvalid;
wire                               core_axi_arready;
wire [31:0]                        core_axi_rdata;
wire [1:0]                         core_axi_rresp;
wire                               core_axi_rvalid;
wire                               core_axi_rready;

// put don't touch back on these
(* DONT_TOUCH = "yes" *)wire    [`NOC_DATA_WIDTH-1:0]  core_axi_awaddr_unmasked;
(* DONT_TOUCH = "yes" *)wire    [`NOC_DATA_WIDTH-1:0]  core_axi_araddr_unmasked;

assign core_axi_awaddr = (core_axi_awaddr_unmasked[12:0] << 2)  | 13'h1000;
assign core_axi_araddr = (core_axi_araddr_unmasked[12:0] << 2)  | 13'h1000;

noc_axilite_bridge #(
    .SLAVE_RESP_BYTEWIDTH   (1)
) noc_axilite_bridge (
    .clk                    (axi_clk    ),
    .rst                    (~rst_n     ),

    .splitter_bridge_val    (xbar_uart_noc2_valid   ),
    .splitter_bridge_data   (xbar_uart_noc2_data    ),
    .bridge_splitter_rdy    (uart_xbar_noc2_ready   ),

    .bridge_splitter_val    (uart_xbar_noc3_valid   ),
    .bridge_splitter_data   (uart_xbar_noc3_data    ),
    .splitter_bridge_rdy    (xbar_uart_noc3_ready   ),

    //axi lite signals             
    //write address channel
    .m_axi_awaddr        (core_axi_awaddr_unmasked),
    .m_axi_awvalid       (core_axi_awvalid),
    .m_axi_awready       (core_axi_awready),

    //write data channel
    .m_axi_wdata         (core_axi_wdata),
    .m_axi_wstrb         (core_axi_wstrb),
    .m_axi_wvalid        (core_axi_wvalid),
    .m_axi_wready        (core_axi_wready),

    //read address channel
    .m_axi_araddr        (core_axi_araddr_unmasked),
    .m_axi_arvalid       (core_axi_arvalid),
    .m_axi_arready       (core_axi_arready),

    //read data channel
    .m_axi_rdata         (core_axi_rdata),
    .m_axi_rresp         (core_axi_rresp),
    .m_axi_rvalid        (core_axi_rvalid),
    .m_axi_rready        (core_axi_rready),

    //write response channel
    .m_axi_bresp         (core_axi_bresp),
    .m_axi_bvalid        (core_axi_bvalid),
    .m_axi_bready        (core_axi_bready)

);

uart_16550   secondary_uart_16550 (
  .s_axi_aclk       (axi_clk          ),  // input wire s_axi_aclk
  .s_axi_aresetn    (rst_n            ),  // input wire s_axi_aresetn
  .ip2intc_irpt     (uart_interrupt   ),  // output wire ip2intc_irpt
  .freeze           (1'b0             ),  // input wire freeze

  // write address channel
  .s_axi_awaddr     (core_axi_awaddr     ),  // input wire [12 : 0] s_axi_awaddr
  .s_axi_awvalid    (core_axi_awvalid    ),  // input wire s_axi_awvalid
  .s_axi_awready    (core_axi_awready    ),  // output wire s_axi_awready

  // write data channel
  .s_axi_wdata      (core_axi_wdata      ),  // input wire [31 : 0] s_axi_wdata
  .s_axi_wstrb      (core_axi_wstrb      ),  // input wire [3 : 0] s_axi_wstrb
  .s_axi_wvalid     (core_axi_wvalid     ),  // input wire s_axi_wvalid
  .s_axi_wready     (core_axi_wready     ),  // output wire s_axi_wready

  // write responce channel
  .s_axi_bresp      (core_axi_bresp      ),  // output wire [1 : 0] s_axi_bresp
  .s_axi_bvalid     (core_axi_bvalid     ),  // output wire s_axi_bvalid
  .s_axi_bready     (core_axi_bready     ),  // input wire s_axi_bready

  // read adress channel
  .s_axi_araddr     (core_axi_araddr     ),  // input wire [12 : 0] s_axi_araddr
  .s_axi_arvalid    (core_axi_arvalid    ),  // input wire s_axi_arvalid
  .s_axi_arready    (core_axi_arready    ),  // output wire s_axi_arready

  // read data channel
  .s_axi_rdata      (core_axi_rdata      ),  // output wire [31 : 0] s_axi_rdata
  .s_axi_rresp      (core_axi_rresp      ),  // output wire [1 : 0] s_axi_rresp
  .s_axi_rvalid     (core_axi_rvalid     ),  // output wire s_axi_rvalid
  .s_axi_rready     (core_axi_rready     ),  // input wire s_axi_rready

  .baudoutn         (),   
  .ctsn             (1'b0),  
  .dcdn             (1'b0),  
  .ddis             (),   
  .dsrn             (1'b0),  
  .dtrn             (),   
  .out1n            (),   
  .out2n            (),   
  .rin              (1'b0),  
  .rtsn             (),   
  .rxrdyn           (),   
  .sin              (uart_rx),  
  .sout             (uart_tx),  
  .txrdyn           ()    
);

endmodule
