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

// Filename: piton_aws.sv
// Author: gchirkov
// Description: Wrapper over system.v for aws


`include "define.tmp.h"
`include "piton_system.vh"
`include "axi_defines.vh"

module piton_aws
(
	`include "cl_ports.vh"
);

// TIE OFF ALL UNUSED INTERFACES
// Including all the unused interface to tie off

`include "unused_apppf_irq_template.inc"
`include "unused_cl_sda_template.inc"
`include "unused_pcim_template.inc"
`include "unused_flr_template.inc"
`include "unused_ddr_a_b_d_template.inc"

`ifndef PITONSYS_UART
    `include "unused_sh_ocl_template.inc"
`endif

`ifndef PITONSYS_UART2
    `include "unused_sh_bar1_template.inc"
`endif


`ifdef PITONSYS_NO_MC
    `include "unused_ddr_c_template.inc"
    `include "unused_dma_pcis_template.inc"
`else 
    `ifndef PITON_FPGA_MC_DDR
        `include "unused_ddr_c_template.inc"
        `include "unused_dma_pcis_template.inc"
    `else
        `ifndef PITONSYS_PCIE_DMA
            `include "unused_dma_pcis_template.inc"
        `endif
    `endif
`endif


// Unused 'full' signals
assign cl_sh_dma_rd_full  = 1'b0;
assign cl_sh_dma_wr_full  = 1'b0;

// Unused
assign cl_sh_status0 = 32'h0;
assign cl_sh_status1 = 32'h0;

// Hardcoded vals from Amazon
assign cl_sh_id0 = 32'hF001_1D0F;
assign cl_sh_id1 = 32'h1D51_FEDC;



///////////////////////////////////////////////////////////////////////
//////////////////////////// clocks ///////////////////////////////////
///////////////////////////////////////////////////////////////////////

    logic shell_clk;
    logic piton_clk;

    assign shell_clk = clk_main_a0; //125 mhz, recipe A0 OR 250 mhz, recipe A1
    assign piton_clk = clk_extra_b1; //62.5 mhz, recipe B1 OR 125 mhz, recipe B0 OR 100 mhz, recipe B5

///////////////////////////////////////////////////////////////////////
//////////////////////////// clocks ///////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//////////////////////////// resets ///////////////////////////////////
///////////////////////////////////////////////////////////////////////

    logic pre_piton_rst_n;
    logic piton_rst_n;

    // Piton reset comes from 15th dip switch 
    always_ff @(negedge sh_cl_status_vdip[15] or posedge piton_clk)
        if (!sh_cl_status_vdip[15])
        begin
            pre_piton_rst_n <= 0;
            piton_rst_n <= 0;
        end
        else begin
            pre_piton_rst_n <= 1;
            piton_rst_n <= pre_piton_rst_n;
        end


    logic pre_shell_rst_n;
    logic shell_rst_n;

    always_ff @(negedge rst_main_n or posedge shell_clk)
        if (!rst_main_n)
        begin
            pre_shell_rst_n <= 0;
            shell_rst_n <= 0;
        end
        else begin
            pre_shell_rst_n <= 1;
            shell_rst_n <= pre_shell_rst_n;
        end


///////////////////////////////////////////////////////////////////////
//////////////////////////// resets ///////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
////////////////////// leds and switches //////////////////////////////
///////////////////////////////////////////////////////////////////////

    logic [15:0] sw;
    logic [15:0] sw_q;
    logic [15:0] sw_q_q;
    logic [15:0] leds;
    logic [15:0] leds_q;
    logic [15:0] leds_q_q;

    always_ff @(posedge piton_clk)
       begin
          sw_q <= sh_cl_status_vdip;
          sw_q_q <= sw_q;
       end

    always_ff @(posedge shell_clk)
       begin
          leds_q <= leds;
          leds_q_q <= leds_q;
       end

    assign sw = sw_q_q;
    assign cl_sh_status_vled = leds_q_q; 
 


///////////////////////////////////////////////////////////////////////
////////////////////// leds and switches //////////////////////////////
///////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////
/////////////////////////// piton /////////////////////////////////////
///////////////////////////////////////////////////////////////////////

    // For uart
    `ifdef PITONSYS_UART
        logic piton_uart_tx;
        logic piton_uart_rx;
        `ifdef PITONSYS_UART2
            logic piton_uart2_tx;
            logic piton_uart2_rx;
        `endif
    `endif

    system system(
        // Clocks and resets
        .sys_clk(piton_clk),
        .sys_rst_n(piton_rst_n),

    `ifndef PITONSYS_NO_MC
    `ifdef PITON_FPGA_MC_DDR
        .ddr_axi_clk(shell_clk),
        .ddr_axi_resetn(shell_rst_n),
        .ddr_axi_awid(cl_sh_ddr_awid),
        .ddr_axi_awaddr(cl_sh_ddr_awaddr),
        .ddr_axi_awlen(cl_sh_ddr_awlen),
        .ddr_axi_awsize(cl_sh_ddr_awsize),
        .ddr_axi_awburst(cl_sh_ddr_awburst),
        .ddr_axi_awlock(),
        .ddr_axi_awcache(),
        .ddr_axi_awprot(),
        .ddr_axi_awqos(),
        .ddr_axi_awregion(),
        .ddr_axi_awuser(),
        .ddr_axi_awvalid(cl_sh_ddr_awvalid),
        .ddr_axi_awready(sh_cl_ddr_awready),
        .ddr_axi_wid(cl_sh_ddr_wid),
        .ddr_axi_wdata(cl_sh_ddr_wdata),
        .ddr_axi_wstrb(cl_sh_ddr_wstrb),
        .ddr_axi_wlast(cl_sh_ddr_wlast),
        .ddr_axi_wuser(),
        .ddr_axi_wvalid(cl_sh_ddr_wvalid),
        .ddr_axi_wready(sh_cl_ddr_wready),
        .ddr_axi_arid(cl_sh_ddr_arid),
        .ddr_axi_araddr(cl_sh_ddr_araddr),
        .ddr_axi_arlen(cl_sh_ddr_arlen),
        .ddr_axi_arsize(cl_sh_ddr_arsize),
        .ddr_axi_arburst(cl_sh_ddr_arburst),
        .ddr_axi_arlock(),
        .ddr_axi_arcache(),
        .ddr_axi_arprot(),
        .ddr_axi_arqos(),
        .ddr_axi_arregion(),
        .ddr_axi_aruser(),
        .ddr_axi_arvalid(cl_sh_ddr_arvalid),
        .ddr_axi_arready(sh_cl_ddr_arready),
        .ddr_axi_rid(sh_cl_ddr_rid),
        .ddr_axi_rdata(sh_cl_ddr_rdata),
        .ddr_axi_rresp(sh_cl_ddr_rresp),
        .ddr_axi_rlast(sh_cl_ddr_rlast),
        .ddr_axi_ruser(`AXI4_USER_WIDTH'b0),
        .ddr_axi_rvalid(sh_cl_ddr_rvalid),
        .ddr_axi_rready(cl_sh_ddr_rready),
        .ddr_axi_bid(sh_cl_ddr_bid),
        .ddr_axi_bresp(sh_cl_ddr_bresp),
        .ddr_axi_buser(`AXI4_USER_WIDTH'b0),
        .ddr_axi_bvalid(sh_cl_ddr_bvalid),
        .ddr_axi_bready(cl_sh_ddr_bready),
        .ddr_ready(sh_cl_ddr_is_ready),

        `ifdef PITONSYS_PCIE_DMA
            .pcie_dma_axi_clk(shell_clk),
            .pcie_dma_axi_resetn(shell_rst_n),
            .pcie_dma_axi_awid(sh_cl_dma_pcis_awid),
            .pcie_dma_axi_awaddr(sh_cl_dma_pcis_awaddr),
            .pcie_dma_axi_awlen(sh_cl_dma_pcis_awlen),
            .pcie_dma_axi_awsize(sh_cl_dma_pcis_awsize),
            .pcie_dma_axi_awburst(),
            .pcie_dma_axi_awlock(),
            .pcie_dma_axi_awcache(),
            .pcie_dma_axi_awprot(),
            .pcie_dma_axi_awqos(),
            .pcie_dma_axi_awregion(),
            .pcie_dma_axi_awuser(),
            .pcie_dma_axi_awvalid(sh_cl_dma_pcis_awvalid),
            .pcie_dma_axi_awready(cl_sh_dma_pcis_awready),
            .pcie_dma_axi_wid(),
            .pcie_dma_axi_wdata(sh_cl_dma_pcis_wdata),
            .pcie_dma_axi_wstrb(sh_cl_dma_pcis_wstrb),
            .pcie_dma_axi_wlast(sh_cl_dma_pcis_wlast),
            .pcie_dma_axi_wuser(),
            .pcie_dma_axi_wvalid(sh_cl_dma_pcis_wvalid),
            .pcie_dma_axi_wready(cl_sh_dma_pcis_wready),
            .pcie_dma_axi_arid(sh_cl_dma_pcis_arid),
            .pcie_dma_axi_araddr(sh_cl_dma_pcis_araddr),
            .pcie_dma_axi_arlen(sh_cl_dma_pcis_arlen),
            .pcie_dma_axi_arsize(sh_cl_dma_pcis_arsize),
            .pcie_dma_axi_arburst(),
            .pcie_dma_axi_arlock(),
            .pcie_dma_axi_arcache(),
            .pcie_dma_axi_arprot(),
            .pcie_dma_axi_arqos(),
            .pcie_dma_axi_arregion(),
            .pcie_dma_axi_aruser(),
            .pcie_dma_axi_arvalid(sh_cl_dma_pcis_arvalid),
            .pcie_dma_axi_arready(cl_sh_dma_pcis_arready),
            .pcie_dma_axi_rid(cl_sh_dma_pcis_rid),
            .pcie_dma_axi_rdata(cl_sh_dma_pcis_rdata),
            .pcie_dma_axi_rresp(cl_sh_dma_pcis_rresp),
            .pcie_dma_axi_rlast(cl_sh_dma_pcis_rlast),
            .pcie_dma_axi_ruser(`AXI4_USER_WIDTH'b0),
            .pcie_dma_axi_rvalid(cl_sh_dma_pcis_rvalid),
            .pcie_dma_axi_rready(sh_cl_dma_pcis_rready),
            .pcie_dma_axi_bid(cl_sh_dma_pcis_bid),
            .pcie_dma_axi_bresp(cl_sh_dma_pcis_bresp),
            .pcie_dma_axi_buser(`AXI4_USER_WIDTH'b0),
            .pcie_dma_axi_bvalid(cl_sh_dma_pcis_bvalid),
            .pcie_dma_axi_bready(sh_cl_dma_pcis_bready),
        `endif // PITONSYS_PCIE_DMA
    `endif // PITON_FPGA_MC_DDR
    `endif // PITONSYS_NO_MC

    `ifdef PITONSYS_UART
        .uart_tx(piton_uart_tx),
        .uart_rx(piton_uart_rx),
        `ifdef PITONSYS_UART2
            .uart2_tx(piton_uart2_tx),
            .uart2_rx(piton_uart2_rx),
        `endif
    `endif

    `ifdef PITON_ARIANE
        .tck_i(tck), 
        .tms_i(tms),
        .trst_ni(reset),
        .td_i(tdi),
        .td_o(tdo),
    `endif

        .sw(sw[7:0]), 
        .leds(leds[7:0]) 

    );
    assign leds[15:8] = 0;

///////////////////////////////////////////////////////////////////////
/////////////////////////// piton /////////////////////////////////////
///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////
///////////////// aws uart module /////////////////////////////////////
///////////////////////////////////////////////////////////////////////
    
    `ifdef PITONSYS_UART
        logic shell_uart_tx;
        logic shell_uart_rx;

        assign shell_uart_rx = piton_uart_tx;
        assign piton_uart_rx = shell_uart_tx;

        uart_16550 aws_uart (
            .s_axi_aclk       (shell_clk        ),  // input wire s_axi_aclk
            .s_axi_aresetn    (shell_rst_n      ),  // input wire s_axi_aresetn
            .ip2intc_irpt     (                 ),  // output wire ip2intc_irpt
            .freeze           (1'b0             ),  // input wire freeze

            .s_axi_awaddr     (sh_ocl_awaddr[12:0]     ),  // input wire [12 : 0] s_axi_awaddr
            .s_axi_awvalid    (sh_ocl_awvalid          ),  // input wire s_axi_awvalid
            .s_axi_awready    (ocl_sh_awready          ),  // output wire s_axi_awready
            .s_axi_wdata      (sh_ocl_wdata            ),  // input wire [31 : 0] s_axi_wdata
            .s_axi_wstrb      (sh_ocl_wstrb            ),  // input wire [3 : 0] s_axi_wstrb
            .s_axi_wvalid     (sh_ocl_wvalid           ),  // input wire s_axi_wvalid
            .s_axi_wready     (ocl_sh_wready           ),  // output wire s_axi_wready
            .s_axi_bresp      (ocl_sh_bresp            ),  // output wire [1 : 0] s_axi_bresp
            .s_axi_bvalid     (ocl_sh_bvalid           ),  // output wire s_axi_bvalid
            .s_axi_bready     (sh_ocl_bready           ),  // input wire s_axi_bready
            .s_axi_araddr     (sh_ocl_araddr[12:0]     ),  // input wire [12 : 0] s_axi_araddr
            .s_axi_arvalid    (sh_ocl_arvalid          ),  // input wire s_axi_arvalid
            .s_axi_arready    (ocl_sh_arready          ),  // output wire s_axi_arready
            .s_axi_rdata      (ocl_sh_rdata            ),  // output wire [31 : 0] s_axi_rdata
            .s_axi_rresp      (ocl_sh_rresp            ),  // output wire [1 : 0] s_axi_rresp
            .s_axi_rvalid     (ocl_sh_rvalid           ),  // output wire s_axi_rvalid
            .s_axi_rready     (sh_ocl_rready           ),  // input wire s_axi_rready

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
            .sin              (shell_uart_rx),  
            .sout             (shell_uart_tx),  
            .txrdyn           ()    
        );
    `endif

    `ifdef PITONSYS_UART2
        logic shell_uart2_tx;
        logic shell_uart2_rx;

        assign shell_uart2_rx = piton_uart2_tx;
        assign piton_uart2_rx = shell_uart2_tx;


        uart_16550 aws_uart2 (
            .s_axi_aclk       (shell_clk        ),  // input wire s_axi_aclk
            .s_axi_aresetn    (shell_rst_n      ),  // input wire s_axi_aresetn
            .ip2intc_irpt     (                 ),  // output wire ip2intc_irpt
            .freeze           (1'b0             ),  // input wire freeze

            .s_axi_awaddr     (sh_bar1_awaddr[12:0]     ),  // input wire [12 : 0] s_axi_awaddr
            .s_axi_awvalid    (sh_bar1_awvalid          ),  // input wire s_axi_awvalid
            .s_axi_awready    (bar1_sh_awready          ),  // output wire s_axi_awready
            .s_axi_wdata      (sh_bar1_wdata            ),  // input wire [31 : 0] s_axi_wdata
            .s_axi_wstrb      (sh_bar1_wstrb            ),  // input wire [3 : 0] s_axi_wstrb
            .s_axi_wvalid     (sh_bar1_wvalid           ),  // input wire s_axi_wvalid
            .s_axi_wready     (bar1_sh_wready           ),  // output wire s_axi_wready
            .s_axi_bresp      (bar1_sh_bresp            ),  // output wire [1 : 0] s_axi_bresp
            .s_axi_bvalid     (bar1_sh_bvalid           ),  // output wire s_axi_bvalid
            .s_axi_bready     (sh_bar1_bready           ),  // input wire s_axi_bready
            .s_axi_araddr     (sh_bar1_araddr[12:0]     ),  // input wire [12 : 0] s_axi_araddr
            .s_axi_arvalid    (sh_bar1_arvalid          ),  // input wire s_axi_arvalid
            .s_axi_arready    (bar1_sh_arready          ),  // output wire s_axi_arready
            .s_axi_rdata      (bar1_sh_rdata            ),  // output wire [31 : 0] s_axi_rdata
            .s_axi_rresp      (bar1_sh_rresp            ),  // output wire [1 : 0] s_axi_rresp
            .s_axi_rvalid     (bar1_sh_rvalid           ),  // output wire s_axi_rvalid
            .s_axi_rready     (sh_bar1_rready           ),  // input wire s_axi_rready

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
            .sin              (shell_uart2_rx),  
            .sout             (shell_uart2_tx),  
            .txrdyn           ()    
        );
    `endif

///////////////////////////////////////////////////////////////////////
///////////////// aws uart module /////////////////////////////////////
///////////////////////////////////////////////////////////////////////


endmodule // aws_shell
