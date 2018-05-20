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

//--------------------------------------------------
// Description:     Top level for FPGA IO
// Author:          Alexey Lavrov
// Company:         Princeton University
// Created:         1/18/2016
//--------------------------------------------------
`include "define.vh"
`include "mc_define.h"
`include "piton_system.vh"
`include "chipset_define.vh"

module io_ctrl_top (
    input                               clk,          
    input                               rst_n,
    input                               piton_ready_n,

    input                               uart_boot_en,
    input                               uart_timeout_en,
    output                              test_start,
    input                               test_good_end,
    input                               test_bad_end,

    input                               iob_noc1_valid_in, 
    input   [`NOC_DATA_WIDTH-1:0]       iob_noc1_data_in,  
    output                              iob_noc1_ready_in,

    output                              iob_noc2_valid_out,
    output  [`NOC_DATA_WIDTH-1:0]       iob_noc2_data_out, 
    input                               iob_noc2_ready_out,

    input                               noc2_valid_in, 
    input   [`NOC_DATA_WIDTH-1:0]       noc2_data_in,  
    output                              noc2_ready_in,

    output                              noc3_valid_out,
    output  [`NOC_DATA_WIDTH-1:0]       noc3_data_out, 
    input                               noc3_ready_out,

`ifdef PITONSYS_UART
    input                               uart_lb_sw,
    input                               uart_rx,
    output                              uart_tx,
`endif // endif PITONSYS_UART

`ifdef PITONSYS_SPI
    /* SD Card Reader Interface */
    input                               spi_sys_clk,
    input                               spi_data_in,
    output                              spi_clk_out,
    output                              spi_data_out,
    output                              spi_cs_n,
`endif // endif PITONSYS_SPI

    input                               net_axi_clk,
    output                              net_phy_rst_n,

    input                               net_phy_tx_clk,
    output                              net_phy_tx_en,
    output  [3 : 0]                     net_phy_tx_data,
    
    input                               net_phy_rx_clk,
    input                               net_phy_dv,    
    input  [3 : 0]                      net_phy_rx_data,
    input                               net_phy_rx_er,
    
    inout                               net_phy_mdio_io,
    output                              net_phy_mdc,

    output                              uart_noc_valid,
    output  [`NOC_DATA_WIDTH-1:0]       uart_noc_data,
    input                               uart_noc_ready
);

wire                            splitter_iob_val;   
wire    [`NOC_DATA_WIDTH-1:0]   splitter_iob_data;  
wire                            iob_splitter_rdy;   
wire                            iob_splitter_val;   
wire    [`NOC_DATA_WIDTH-1:0]   iob_splitter_data;  
wire                            splitter_iob_rdy;  
                                                   
wire                            splitter_iodev_val; 
wire    [`NOC_DATA_WIDTH-1:0]   splitter_iodev_data;
wire                            iodev_splitter_rdy; 
wire                            iodev_splitter_val; 
wire    [`NOC_DATA_WIDTH-1:0]   iodev_splitter_data;
wire                            splitter_iodev_rdy; 

wire                            splitter_axi_val;
wire    [`NOC_DATA_WIDTH-1:0]   splitter_axi_data;
wire                            axi_splitter_rdy;
wire                            axi_splitter_val;
wire    [`NOC_DATA_WIDTH-1:0]   axi_splitter_data;
wire                            splitter_axi_rdy;

wire                            splitter_boot_val;
wire    [`NOC_DATA_WIDTH-1:0]   splitter_boot_data;
wire                            splitter_boot_rdy;
wire                            boot_splitter_val;
wire    [`NOC_DATA_WIDTH-1:0]   boot_splitter_data;
wire                            boot_splitter_rdy;

wire                            splitter_uart_val;
wire    [`NOC_DATA_WIDTH-1:0]   splitter_uart_data;
wire                            splitter_uart_rdy;
wire                            uart_splitter_val;
wire    [`NOC_DATA_WIDTH-1:0]   uart_splitter_data;
wire                            uart_splitter_rdy;

wire                            splitter_net_val;
wire    [`NOC_DATA_WIDTH-1:0]   splitter_net_data;
wire                            net_splitter_rdy;
wire                            net_splitter_val;
wire    [`NOC_DATA_WIDTH-1:0]   net_splitter_data;
wire                            splitter_net_rdy;

wire [`NOC_DATA_WIDTH-1:0]      converter_io_aw_addr;
wire                            converter_io_aw_valid;
wire                            converter_io_aw_ready;
wire [`NOC_DATA_WIDTH-1:0]      converter_io_w_data;
wire [`NOC_DATA_WIDTH/8-1:0]    converter_io_w_strb;
wire                            converter_io_w_valid;
wire                            converter_io_w_ready;
wire [`NOC_DATA_WIDTH-1:0]      converter_io_ar_addr;
wire                            converter_io_ar_valid;
wire                            converter_io_ar_ready;
wire [`NOC_DATA_WIDTH-1:0]      io_converter_r_data;
wire [1:0]                      io_converter_r_resp; // width should be C_M_AXI_LITE_RESP_WIDTH
wire                            io_converter_r_valid;
wire                            io_converter_r_ready;
wire [1:0]                      io_converter_b_resp; // width should be C_M_AXI_LITE_RESP_WIDTH
wire                            io_converter_b_valid;
wire                            io_converter_b_ready;

wire [`NOC_DATA_WIDTH-1:0]      converter_sd_aw_addr;
wire                            converter_sd_aw_valid;
wire                            converter_sd_aw_ready;
wire [`NOC_DATA_WIDTH-1:0]      converter_sd_w_data;
wire [`NOC_DATA_WIDTH/8-1:0]    converter_sd_w_strb;
wire                            converter_sd_w_valid;
wire                            converter_sd_w_ready;
wire [`NOC_DATA_WIDTH-1:0]      converter_sd_ar_addr;
wire                            converter_sd_ar_valid;
wire                            converter_sd_ar_ready;
wire [`NOC_DATA_WIDTH-1:0]      sd_converter_r_data;
wire [1:0]                      sd_converter_r_resp; // width should be C_M_AXI_LITE_RESP_WIDTH
wire                            sd_converter_r_valid;
wire                            sd_converter_r_ready;
wire [1:0]                      sd_converter_b_resp; // width should be C_M_AXI_LITE_RESP_WIDTH
wire                            sd_converter_b_valid;
wire                            sd_converter_b_ready;

wire                            wb_ack;
wire [7:0]                      wb_dat_i;
wire [7:0]                      wb_adr;
wire [7:0]                      wb_dat_o;
wire                            wb_stb;
wire                            wb_we;

wire net_interrupt;
wire uart_interrupt;

wire ciop_iob_rst_n = rst_n & test_start & ~piton_ready_n;

ciop_iob ciop_iob     (
    .chip_clk       (clk),
    .fpga_clk       (clk),
    .rst_n          (ciop_iob_rst_n),

    .noc1_in_val     (iob_noc1_valid_in      ),
    .noc1_in_data    (iob_noc1_data_in       ),
    .noc1_in_rdy     (iob_noc1_ready_in      ),

    .noc2_out_val    (iob_noc2_valid_out     ),
    .noc2_out_data   (iob_noc2_data_out      ),
    .noc2_out_rdy    (iob_noc2_ready_out     ),
    
    .noc2_in_val     (splitter_iob_val      ),
    .noc2_in_data    (splitter_iob_data      ),
    .noc2_in_rdy     (iob_splitter_rdy      ),
                                       
    .noc3_out_val    (iob_splitter_val      ),
    .noc3_out_data   (iob_splitter_data      ),
    .noc3_out_rdy    (splitter_iob_rdy     ),

    .uart_interrupt (uart_interrupt         ),
    .net_interrupt  (net_interrupt         )
);

iob_splitter iob_splitter (

    .clk                    (clk                         ),
    .rst_n                  (~rst_n                      ),

    // TODO: NOC1 interface is not used for this splitter
    .noc1_splitter_val      (1'b0                        ),
    .noc1_splitter_data     ({`NOC_DATA_WIDTH{1'b0}}     ),
    .splitter_noc1_rdy      (),

    .splitter_noc1sink_val  (       ),
    .splitter_noc1sink_data (       ),
    .noc1sink_splitter_rdy  (1'b0   ),
    // TODO: NOC1 interface is not used for this splitter

    .noc2_splitter_val      (noc2_valid_in                ),
    .noc2_splitter_data     (noc2_data_in                 ),
    .splitter_noc2_rdy      (noc2_ready_in                ),
                                                   
    .splitter_noc3_val      (noc3_valid_out               ),
    .splitter_noc3_data     (noc3_data_out                ),
    .noc3_splitter_rdy      (noc3_ready_out               ),
                                                   
    .splitter_iob_val       (splitter_iob_val             ),
    .splitter_iob_data      (splitter_iob_data            ),
    .iob_splitter_rdy       (iob_splitter_rdy             ),
                                                   
    .iob_splitter_val       (iob_splitter_val             ),
    .iob_splitter_data      (iob_splitter_data            ),
    .splitter_iob_rdy       (splitter_iob_rdy             ),

    .splitter_iodev_val     (splitter_iodev_val           ),
    .splitter_iodev_data    (splitter_iodev_data          ),
    .iodev_splitter_rdy     (iodev_splitter_rdy           ),

    .iodev_splitter_val     (iodev_splitter_val           ),
    .iodev_splitter_data    (iodev_splitter_data          ),
    .splitter_iodev_rdy     (splitter_iodev_rdy           )

);

uart_boot_splitter  uart_boot_splitter  (
    .clk                    (clk                        ),
    .rst_n                  (~rst_n                      ),

    // TODO: NOC1 interface is not used for this splitter
    .noc1_splitter_val      (1'b0                       ),
    .noc1_splitter_data     ({`NOC_DATA_WIDTH{1'b0}}    ),
    .splitter_noc1_rdy      (),

    .splitter_noc1sink_val  (       ),
    .splitter_noc1sink_data (       ),
    .noc1sink_splitter_rdy  (1'b0   ),
    // TODO: NOC1 interface is not used for this splitter

    .noc2_splitter_val      (splitter_iodev_val              ),
    .noc2_splitter_data     (splitter_iodev_data             ),
    .splitter_noc2_rdy      (iodev_splitter_rdy              ),
                                                
    .splitter_noc3_val      (iodev_splitter_val              ),
    .splitter_noc3_data     (iodev_splitter_data             ),
    .noc3_splitter_rdy      (splitter_iodev_rdy              ),

    .splitter_boot_val      (splitter_boot_val          ),
    .splitter_boot_data     (splitter_boot_data         ),
    .boot_splitter_rdy      (boot_splitter_rdy          ),

    .boot_splitter_val      (boot_splitter_val          ),
    .boot_splitter_data     (boot_splitter_data         ),
    .splitter_boot_rdy      (splitter_boot_rdy          ),

    .splitter_axi_val       (splitter_axi_val           ),
    .splitter_axi_data      (splitter_axi_data          ),
    .axi_splitter_rdy       (axi_splitter_rdy           ),

    .axi_splitter_val       (axi_splitter_val           ),
    .axi_splitter_data      (axi_splitter_data          ),
    .splitter_axi_rdy       (splitter_axi_rdy           )
); 

net_uart_splitter  net_uart_splitter  (
    .clk                    (clk                        ),
    .rst_n                  (~rst_n                      ),

    // TODO: NOC1 interface is not used for this splitter
    .noc1_splitter_val      (1'b0                       ),
    .noc1_splitter_data     ({`NOC_DATA_WIDTH{1'b0}}    ),
    .splitter_noc1_rdy      (),

    .splitter_noc1sink_val  (       ),
    .splitter_noc1sink_data (       ),
    .noc1sink_splitter_rdy  (1'b0   ),
    // TODO: NOC1 interface is not used for this splitter

    .noc2_splitter_val      (splitter_axi_val               ),
    .noc2_splitter_data     (splitter_axi_data              ),
    .splitter_noc2_rdy      (axi_splitter_rdy               ),
                                                
    .splitter_noc3_val      (axi_splitter_val               ),
    .splitter_noc3_data     (axi_splitter_data              ),
    .noc3_splitter_rdy      (splitter_axi_rdy               ),

    .splitter_uart_val      (splitter_uart_val          ),
    .splitter_uart_data     (splitter_uart_data         ),
    .uart_splitter_rdy      (uart_splitter_rdy          ),

    .uart_splitter_val      (uart_splitter_val          ),
    .uart_splitter_data     (uart_splitter_data         ),
    .splitter_uart_rdy      (splitter_uart_rdy          ),

    .splitter_net_val       (splitter_net_val           ),
    .splitter_net_data      (splitter_net_data          ),
    .net_splitter_rdy       (net_splitter_rdy           ),

    .net_splitter_val       (net_splitter_val           ),
    .net_splitter_data      (net_splitter_data          ),
    .splitter_net_rdy       (splitter_net_rdy           )
); 

`ifdef PITON_FPGA_BRAM_TEST

    fake_boot_ctrl  fake_boot_ctrl(
        .clk                    (clk                    ),
        .rst_n                  (rst_n                  ),

        .noc_valid_in           (splitter_boot_val      ),
        .noc_data_in            (splitter_boot_data     ),
        .noc_ready_in           (boot_splitter_rdy      ),

        .noc_valid_out          (boot_splitter_val      ),
        .noc_data_out           (boot_splitter_data     ),
        .noc_ready_out          (splitter_boot_rdy      )
    );

`elsif PITON_FPGA_BRAM_BOOT

    fake_boot_ctrl  fake_boot_ctrl(
        .clk                    (clk                    ),
        .rst_n                  (rst_n                  ),

        .noc_valid_in           (splitter_boot_val      ),
        .noc_data_in            (splitter_boot_data     ),
        .noc_ready_in           (boot_splitter_rdy      ),

        .noc_valid_out          (boot_splitter_val      ),
        .noc_data_out           (boot_splitter_data     ),
        .noc_ready_out          (splitter_boot_rdy      )
    );

`elsif PITONSYS_SPI
`ifdef PITON_FPGA_SD_BOOT

    /* Bridge between NOCs and SD Card AXI Interface */
    noc_axilite_bridge_boot noc_sd_bridge (
        .clk                  (clk                  ),
        .rst                  (~rst_n               ),

        .splitter_bridge_val  (splitter_boot_val  ),
        .splitter_bridge_data (splitter_boot_data ),
        .bridge_splitter_rdy  (boot_splitter_rdy  ),

        .bridge_splitter_val  (boot_splitter_val  ),
        .bridge_splitter_data (boot_splitter_data ),
        .splitter_bridge_rdy  (splitter_boot_rdy  ),

        .m_axi_awaddr         (converter_sd_aw_addr),
        .m_axi_awvalid        (converter_sd_aw_valid),
        .m_axi_awready        (converter_sd_aw_ready),

        .m_axi_wdata          (converter_sd_w_data),
        .m_axi_wstrb          (converter_sd_w_strb),
        .m_axi_wvalid         (converter_sd_w_valid),
        .m_axi_wready         (converter_sd_w_ready),

        .m_axi_araddr         (converter_sd_ar_addr),
        .m_axi_arvalid        (converter_sd_ar_valid),
        .m_axi_arready        (converter_sd_ar_ready),

        .m_axi_rdata          (sd_converter_r_data),
        .m_axi_rresp          (sd_converter_r_resp),
        .m_axi_rvalid         (sd_converter_r_valid),
        .m_axi_rready         (sd_converter_r_ready),

        .m_axi_bresp          (sd_converter_b_resp),
        .m_axi_bvalid         (sd_converter_b_valid),
        .m_axi_bready         (sd_converter_b_ready)
    );

    /* Bridge between AXI-Lite and SD Wishbone Controller */
    axi_sd_bridge axi_sd_bridge (
        .clk           (clk                     ),
        .rst           (~rst_n                  ),

        .s_axi_awaddr  (converter_sd_aw_addr),
        .s_axi_awvalid (converter_sd_aw_valid),
        .s_axi_awready (converter_sd_aw_ready),

        .s_axi_wdata   (converter_sd_w_data),
        .s_axi_wstrb   (converter_sd_w_strb),
        .s_axi_wvalid  (converter_sd_w_valid),
        .s_axi_wready  (converter_sd_w_ready),

        .s_axi_araddr  (converter_sd_ar_addr),
        .s_axi_arvalid (converter_sd_ar_valid),
        .s_axi_arready (converter_sd_ar_ready),

        .s_axi_rdata   (sd_converter_r_data),
        .s_axi_rresp   (sd_converter_r_resp),
        .s_axi_rvalid  (sd_converter_r_valid),
        .s_axi_rready  (sd_converter_r_ready),

        .s_axi_bresp   (sd_converter_b_resp),
        .s_axi_bvalid  (sd_converter_b_valid),
        .s_axi_bready  (sd_converter_b_ready),

        .ack_i         (wb_ack),
        .dat_i         (wb_dat_i),
        .adr_o         (wb_adr),
        .dat_o         (wb_dat_o),
        .stb_o         (wb_stb),
        .we_o          (wb_we)
    );

    /* Wishbone Slave to SPI Master for SD Cards */
    spi_master sd_master (
        .clk_i        (clk),
        .rst_i        (~rst_n   ),

        .adr_i        (wb_adr),
        .dat_i        (wb_dat_o),
        .stb_i        (wb_stb),
        .we_i         (wb_we),
        .ack_o        (wb_ack),
        .dat_o        (wb_dat_i),

        .spi_sys_clk  (spi_sys_clk),
        .spi_data_in  (spi_data_in),
        .spi_clk_out  (spi_clk_out),
        .spi_data_out (spi_data_out),
        .spi_cs_n     (spi_cs_n)
    );

`endif
`else

    assign boot_splitter_rdy    = 1'b0;
    assign boot_splitter_val    = 1'b0;
    assign boot_splitter_data   = {`NOC_DATA_WIDTH{1'b0}};

`endif


noc_axilite_bridge     noc_axilite_bridge   (
    .clk                    (clk                ),
    .rst                    (~rst_n             ),  // TODO: rewrite to positive ?
           
    .splitter_bridge_val    (splitter_uart_val   ),
    .splitter_bridge_data   (splitter_uart_data  ),
    .bridge_splitter_rdy    (uart_splitter_rdy   ),

    .bridge_splitter_val    (uart_splitter_val   ),
    .bridge_splitter_data   (uart_splitter_data  ),
    .splitter_bridge_rdy    (splitter_uart_rdy   ),
       
    //axi lite signals             
    //write address channel
    .m_axi_awaddr        (converter_io_aw_addr),
    .m_axi_awvalid       (converter_io_aw_valid),
    .m_axi_awready       (converter_io_aw_ready),

    //write data channel
    .m_axi_wdata         (converter_io_w_data),
    .m_axi_wstrb         (converter_io_w_strb),
    .m_axi_wvalid        (converter_io_w_valid),
    .m_axi_wready        (converter_io_w_ready),

    //read address channel
    .m_axi_araddr        (converter_io_ar_addr),
    .m_axi_arvalid       (converter_io_ar_valid),
    .m_axi_arready       (converter_io_ar_ready),

    //read data channel
    .m_axi_rdata         (io_converter_r_data),
    .m_axi_rresp         (io_converter_r_resp),
    .m_axi_rvalid        (io_converter_r_valid),
    .m_axi_rready        (io_converter_r_ready),

    //write response channel
    .m_axi_bresp         (io_converter_b_resp),
    .m_axi_bvalid        (io_converter_b_valid),
    .m_axi_bready        (io_converter_b_ready)
    
);


(* DONT_TOUCH = "yes" *) wire    [12:0]  s_axi_awaddr;
(* DONT_TOUCH = "yes" *) wire    [12:0]  s_axi_araddr;

assign s_axi_awaddr = (converter_io_aw_addr[12:0] << 2)  | 13'h1000;
assign s_axi_araddr = (converter_io_ar_addr[12:0] << 2)  | 13'h1000;

`ifdef PITONSYS_UART
uart_top        uart_top (
    .axi_clk                    (clk                        ),
    .rst_n                      (rst_n                      ),

    .uart_rx                    (uart_rx                    ),
    .uart_tx                    (uart_tx                    ),
    .uart_interrupt             (uart_interrupt             ),
    .uart_lb_sw                 (uart_lb_sw                 ),

    .uart_boot_en               (uart_boot_en               ),
    .uart_timeout_en            (uart_timeout_en            ),
    .test_start                 (test_start                 ),
    .test_good_end              (test_good_end              ),
    .test_bad_end               (test_bad_end               ),

    .core_axi_awaddr            (s_axi_awaddr               ),
    .core_axi_awvalid           (converter_io_aw_valid      ),
    .core_axi_awready           (converter_io_aw_ready      ),
    .core_axi_wdata             (converter_io_w_data[31:0]  ),
    .core_axi_wstrb             (converter_io_w_strb[3:0]   ),
    .core_axi_wvalid            (converter_io_w_valid       ),
    .core_axi_wready            (converter_io_w_ready       ),
    .core_axi_araddr            (s_axi_araddr               ),
    .core_axi_arvalid           (converter_io_ar_valid      ),
    .core_axi_arready           (converter_io_ar_ready      ),
    .core_axi_rdata             (io_converter_r_data[31:0]  ),
    .core_axi_rresp             (io_converter_r_resp        ),
    .core_axi_rvalid            (io_converter_r_valid       ),
    .core_axi_rready            (io_converter_r_ready       ),
    .core_axi_bresp             (io_converter_b_resp        ),
    .core_axi_bvalid            (io_converter_b_valid       ),
    .core_axi_bready            (io_converter_b_ready       ),

    .uart_noc_valid             (uart_noc_valid             ),
    .uart_noc_data              (uart_noc_data              ),
    .uart_noc_ready             (uart_noc_ready             )
);
`else // ifndef PITONSYS_UART
    assign uart_interrupt = 1'b0;
    assign test_start = 1'b1;
    assign converter_io_aw_ready = 1'b0;
    assign converter_io_w_ready = 1'b0;
    assign io_converter_b_resp = 2'b0;
    assign io_converter_b_valid = 1'b0;
    assign converter_io_ar_ready = 1'b0;
    assign io_converter_r_data = {`NOC_DATA_WIDTH{1'b0}};
    assign io_converter_r_resp = 2'b0;
    assign io_converter_r_valid = 1'b0;
    assign uart_noc_valid = 1'b0;
`endif // endif PITONSYS_UART


eth_top  eth_top (
    .chipset_clk            (clk                ),
    .rst_n                  (rst_n              ),

    .net_interrupt          (net_interrupt      ),

    .noc_in_val             (splitter_net_val   ),
    .noc_in_data            (splitter_net_data  ),
    .noc_in_rdy             (net_splitter_rdy   ),

    .noc_out_val            (net_splitter_val   ),
    .noc_out_data           (net_splitter_data  ),
    .noc_out_rdy            (splitter_net_rdy   ),

    .net_axi_clk            (net_axi_clk        ),
    .net_phy_rst_n          (net_phy_rst_n      ),

    .net_phy_tx_clk         (net_phy_tx_clk     ),
    .net_phy_tx_en          (net_phy_tx_en      ),
    .net_phy_tx_data        (net_phy_tx_data    ),
    
    .net_phy_rx_clk         (net_phy_rx_clk     ),
    .net_phy_dv             (net_phy_dv         ),    
    .net_phy_rx_data        (net_phy_rx_data    ),
    .net_phy_rx_er          (net_phy_rx_er      ),
    
    .net_phy_mdio_io        (net_phy_mdio_io    ),
    .net_phy_mdc            (net_phy_mdc        )
);

endmodule
