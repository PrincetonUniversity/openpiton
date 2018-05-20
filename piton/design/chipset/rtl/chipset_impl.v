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

`include "define.vh"
`include "piton_system.vh"
`include "mc_define.h"
`include "uart16550_define.vh"
`include "chipset_define.vh"

// Filename: chipset_impl.v
// Author: mmckeown
// Description: Top-level chipset implementation.  Instantiates
//              different versions of chipsets based on different
//              macros.  Some logic is common to all chipset implementations.

// Macros used in this file:
//  PITON_FPGA_MC_DDR3                  Set to indicate an FPGA implementation will
//                                      use a DDR2/3 memory controller.  If
//                                      this is not set, a default "fake"
//                                      simulated DRAM is used.
//  PITONSYS_NO_MC                      If set, no memory controller is used. This is used
//                                      in the testing of the Piton system, where a small test
//                                      can be run on the chip with DRAM
//                                      emulated in BRAMs
//  PITONSYS_IOCTRL                     Set to use real I/O controller, otherwise a fake I/O bridge 
//                                      is used and emulates I/O in PLI C calls.  This may not be compatible
//                                      with the "fake" memory controller or no memory controller at all
//  PITONSYS_UART                       Set to include a UART in the Piton system chipset.  The UART
//                                      can be used as an I/O device and/or a device for bootloading
//                                      test programs (see PITONSYS_UART_BOOT)
//  PITONSYS_UART_LOOBACK               Set to looback UART to itself.  Used for testing purposes
//  PITONSYS_UART_BOOT                  Set for UART boot hardware to be included.  If this is the 
//                                      only boot option set, it is always used.  If there is another
//                                      boot option, a switch can be used to enable UART boot
//  PITONSYS_NON_UART_BOOT              This is set whenever another boot method is specified besides UART.
//                                      This is important so UART knows if it needs to be enabled or not.
//                                      This is only used if PITONSYS_UART_BOOT is set
//  PITONSYS_SPI                        Set to include a SPI in the Piton system chipset.  SPI is generally
//                                      used for SD card boot, but could potentially be used for other
//                                      purposes
//  NEXYS4DDR_BOARD NEXYSVIDEO_BOARD    Used to indicate which board this code is 
//                                      being synthesized for. There are more than just these

module chipset_impl(
    // Clocks and resets
    input                                       chipset_clk,
    input                                       chipset_rst_n,
    input                                       piton_ready_n,

    output                                      test_start,

`ifndef PITONSYS_NO_MC
`ifdef PITON_FPGA_MC_DDR3
    input                                       mc_clk,
`endif // endif PITON_FPGA_MC_DDR3
`endif // endif PITONSYS_NO_MC

    // Main chip interface
    output [`NOC_DATA_WIDTH-1:0]                chipset_intf_data_noc1,
    output [`NOC_DATA_WIDTH-1:0]                chipset_intf_data_noc2,
    output [`NOC_DATA_WIDTH-1:0]                chipset_intf_data_noc3,
    output                                      chipset_intf_val_noc1,
    output                                      chipset_intf_val_noc2,
    output                                      chipset_intf_val_noc3,
    input                                       chipset_intf_rdy_noc1,
    input                                       chipset_intf_rdy_noc2,
    input                                       chipset_intf_rdy_noc3,

    input  [`NOC_DATA_WIDTH-1:0]                intf_chipset_data_noc1,
    input  [`NOC_DATA_WIDTH-1:0]                intf_chipset_data_noc2,
    input  [`NOC_DATA_WIDTH-1:0]                intf_chipset_data_noc3,
    input                                       intf_chipset_val_noc1,
    input                                       intf_chipset_val_noc2,
    input                                       intf_chipset_val_noc3,
    output                                      intf_chipset_rdy_noc1,
    output                                      intf_chipset_rdy_noc2,
    output                                      intf_chipset_rdy_noc3

    // DRAM and I/O interfaces
`ifndef PITONSYS_NO_MC
    ,
`ifdef PITON_FPGA_MC_DDR3
    output                                      init_calib_complete,
    // Generalized interface for any FPGA board we support.
    // Not all signals will be used for all FPGA boards (see constraints)
    output [`DDR3_ADDR_WIDTH-1:0]               ddr_addr,
    output [`DDR3_BA_WIDTH-1:0]                 ddr_ba,
    output                                      ddr_cas_n,
    output [`DDR3_CK_WIDTH-1:0]                 ddr_ck_n,
    output [`DDR3_CK_WIDTH-1:0]                 ddr_ck_p,
    output [`DDR3_CKE_WIDTH-1:0]                ddr_cke,
    output                                      ddr_ras_n,
    output                                      ddr_reset_n,
    output                                      ddr_we_n,
    inout  [`DDR3_DQ_WIDTH-1:0]                 ddr_dq,
    inout  [`DDR3_DQS_WIDTH-1:0]                ddr_dqs_n,
    inout  [`DDR3_DQS_WIDTH-1:0]                ddr_dqs_p,
`ifndef NEXYSVIDEO_BOARD
    output [`DDR3_CS_WIDTH-1:0]                 ddr_cs_n,
`endif // endif NEXYSVIDEO_BOARD
    output [`DDR3_DM_WIDTH-1:0]                 ddr_dm,
    output                                      ddr_odt
`else // ifndef PITON_FPGA_MC_DDR3
    output                                      chipset_mem_val,
    output [`NOC_DATA_WIDTH-1:0]                chipset_mem_data,
    input                                       chipset_mem_rdy,
    input                                       mem_chipset_val,
    input  [`NOC_DATA_WIDTH-1:0]                mem_chipset_data,
    output                                      mem_chipset_rdy
`endif // endif PITON_FPGA_MC_DDR3
`endif // endif PITONSYS_NO_MC

`ifdef PITONSYS_IOCTRL
    `ifdef PITONSYS_UART
        ,
        output                                      uart_tx,
        input                                       uart_rx
        `ifdef PITONSYS_UART_BOOT
            `ifdef PITONSYS_NON_UART_BOOT
                ,
                input                                       uart_boot_en,
                input                                       uart_timeout_en
            `endif // endif PITONSYS_NON_UART_BOOT
        `endif // endif PITONSYS_UART_BOOT
    `endif // endif PITONSYS_UART

    `ifdef PITONSYS_SPI
        ,
        input                                       spi_sys_clk,
        input                                       spi_data_in,
        output                                      spi_clk_out,
        output                                      spi_data_out,
        output                                      spi_cs_n
    `endif // endif PITONSYS_SPI

        ,
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
        output                              net_phy_mdc

`else // ifndef PITONSYS_IOCTRL
    ,
    output                                      chipset_fake_iob_val,
    output [`NOC_DATA_WIDTH-1:0]                chipset_fake_iob_data,
    input                                       chipset_fake_iob_rdy,
    input                                       fake_iob_chipset_val,
    input  [`NOC_DATA_WIDTH-1:0]                fake_iob_chipset_data,
    output                                      fake_iob_chipset_rdy,

    output                                      chipset_io_val,
    output [`NOC_DATA_WIDTH-1:0]                chipset_io_data,
    input                                       chipset_io_rdy,
    input                                       io_chipset_val,
    input  [`NOC_DATA_WIDTH-1:0]                io_chipset_data,
    output                                      io_chipset_rdy
`endif // endif PITONSYS_IO_CTRL
);

///////////////////////
// Type declarations //
///////////////////////

// Splitter to memory and io interfaces
wire                                            splitter_mem_val;
wire   [`NOC_DATA_WIDTH-1:0]                    splitter_mem_data;
wire                                            splitter_mem_rdy;
wire                                            mem_splitter_val;
wire   [`NOC_DATA_WIDTH-1:0]                    mem_splitter_data;
wire                                            mem_splitter_rdy;
wire                                            splitter_io_val;
wire   [`NOC_DATA_WIDTH-1:0]                    splitter_io_data;
wire                                            splitter_io_rdy;
wire                                            io_splitter_val;
wire   [`NOC_DATA_WIDTH-1:0]                    io_splitter_data;
wire                                            io_splitter_rdy;

wire                                            mc_ui_clk_sync_rst;

wire                                            uart_noc_valid;
wire    [`NOC_DATA_WIDTH-1:0]                   uart_noc_data;
wire                                            uart_noc_ready;

reg                                             init_calib_complete_f;
reg                                             init_calib_complete_ff;

reg                                             io_ctrl_rst_n;

`ifndef PITONSYS_IOCTRL
wire                                            uart_boot_en;
wire                                            uart_timeout_en;
`else // ifdef PITONSYS_IOCTRL
`ifndef PITONSYS_UART
wire                                            uart_boot_en;
wire                                            uart_timeout_en;
`else // ifdef PITONSYS_UART
`ifndef PITONSYS_UART_BOOT
wire                                            uart_boot_en;
wire                                            uart_timeout_en;
`else // ifdef PITONSYS_UART_BOOT
`ifndef PITONSYS_NON_UART_BOOT
wire                                            uart_boot_en;
wire                                            uart_timeout_en;
`endif // endif PITONSYS_NON_UART_BOOT
`endif // endif PITONSYS_UART_BOOT
`endif // endif PITONSYS_UART
`endif // endif PITONSYS_IOCTRL

wire                                            cpu_mem_traffic;
wire                                            mem_io_spl_in_val;
wire    [`NOC_DATA_WIDTH-1:0]                   mem_io_spl_in_data;
wire                                            mem_io_spl_in_rdy;
wire                                            spl_noc3_val;
wire    [`NOC_DATA_WIDTH-1:0]                   spl_noc3_data;
wire                                            spl_noc3_rdy;
wire                                            spl_uart_noc3_val;
wire    [`NOC_DATA_WIDTH-1:0]                   spl_uart_noc3_data;

wire                                            test_good_end;
wire                                            test_bad_end;


//////////////////////
// Sequential Logic //
//////////////////////

`ifdef PITONSYS_IOCTRL
`ifndef PITONSYS_NO_MC
`ifdef PITON_FPGA_MC_DDR3
always @ (posedge chipset_clk)
begin
    init_calib_complete_f <= init_calib_complete;
    init_calib_complete_ff <= init_calib_complete_f;
end
`endif // endif PITON_FPGA_MC_DDR3
`endif // endif PITONSYS_NO_MC
`endif // endif PITONSYS_IOCTRL

/////////////////////////
// Combinational Logic //
/////////////////////////

// Currently NoC 1 from chipset to interface is not used
// by any chipset implementation
assign chipset_intf_data_noc1 = {`NOC_DATA_WIDTH{1'b0}};
assign chipset_intf_val_noc1 = 1'b0;

// Currently NoC 3 from interface to chipset is not used
// by any chipset implementation
assign intf_chipset_rdy_noc3 = 1'b0;

`ifdef PITONSYS_NO_MC
    // Tie off splitter memory interface
    assign splitter_mem_rdy = 1'b0;
    assign mem_splitter_val = 1'b0;
    assign mem_splitter_data = {`NOC_DATA_WIDTH{1'b0}};
`endif // endif PITONSYS_NO_MC

`ifndef PITONSYS_NO_MC
`ifndef PITON_FPGA_MC_DDR3
    // Need to pass the generic mem interface up to fake memory in manycore_top
    assign chipset_mem_val = splitter_mem_val;
    assign chipset_mem_data = splitter_mem_data;
    assign splitter_mem_rdy = chipset_mem_rdy;
    assign mem_splitter_val = mem_chipset_val;
    assign mem_splitter_data = mem_chipset_data;
    assign mem_chipset_rdy = mem_splitter_rdy;
`endif // endif PITON_FPGA_MC_DDR3
`endif // endif PITONSYS_NO_MC

`ifndef PITONSYS_IOCTRL
    // Need to pass the generic iob interface up to fake iob in mayncore_top
    assign chipset_fake_iob_val = intf_chipset_val_noc1;
    assign chipset_fake_iob_data = intf_chipset_data_noc1;
    assign intf_chipset_rdy_noc1 = chipset_fake_iob_rdy;
    assign chipset_intf_val_noc2 = fake_iob_chipset_val;
    assign chipset_intf_data_noc2 = fake_iob_chipset_data;
    assign fake_iob_chipset_rdy = chipset_intf_rdy_noc2;

    assign chipset_io_val = splitter_io_val;
    assign chipset_io_data = splitter_io_data;
    assign splitter_io_rdy = chipset_io_rdy;
    assign io_splitter_val = io_chipset_val;
    assign io_splitter_data = io_chipset_data;
    assign io_chipset_rdy = io_splitter_rdy;
`endif // endif PITONSYS_IOCTRL

`ifdef PITONSYS_IOCTRL
    always @ *
    begin
    `ifndef PITONSYS_NO_MC
    `ifdef PITON_FPGA_MC_DDR3
        // Reset I/O ctrl as long as DRAM ctrl is not reset 
        // and not calibrated or initialized
        io_ctrl_rst_n = ~mc_ui_clk_sync_rst & init_calib_complete_ff;
    `else // ifndef PITON_FPGA_MC_DDR3
        io_ctrl_rst_n = chipset_rst_n;
    `endif // endif PITON_FPGA_MC_DDR3
    `else // ifdef PITONSYS_NO_MC
        io_ctrl_rst_n = chipset_rst_n;
    `endif // PITONSYS_NO_MC
    end
`endif // endif PITONSYS_IOCTRL

`ifndef PITONSYS_IOCTRL
    assign uart_boot_en = 1'b0;
    assign uart_timeout_en = 1'b0;
`else // ifdef PITONSYS_IOCTRL
    `ifndef PITONSYS_UART
        assign uart_boot_en = 1'b0;
        assign uart_timeout_en = 1'b0;
    `else // ifdef PITONSYS_UART
        `ifndef PITONSYS_UART_BOOT
            assign uart_boot_en = 1'b0;
            assign uart_timeout_en = 1'b0;
        `else // ifdef PITONSYS_UART_BOOT
            `ifndef PITONSYS_NON_UART_BOOT
                assign uart_boot_en = 1'b1;
            `endif // endif PITONSYS_NON_UART_BOOT
        `endif // endif PITONSYS_UART_BOOT
    `endif // endif PITONSYS_UART
`endif // endif PITONSYS_IOCTRL

//////////////////////////
// Sub-module Instances //
//////////////////////////
`ifdef PITONSYS_IOCTRL
    assign cpu_mem_traffic = test_start | (~uart_boot_en);
`else
    assign cpu_mem_traffic = 1'b1;
`endif

assign mem_io_spl_in_val = cpu_mem_traffic  ?   intf_chipset_val_noc2   :
                                                uart_noc_valid          ;
assign mem_io_spl_in_data = cpu_mem_traffic ?   intf_chipset_data_noc2  :
                                                uart_noc_data           ;
assign uart_noc_ready           = mem_io_spl_in_rdy;
assign intf_chipset_rdy_noc2    = mem_io_spl_in_rdy;

// NoC 3
assign spl_uart_noc3_val        = ~cpu_mem_traffic & spl_noc3_val;
assign spl_uart_noc3_data       = spl_noc3_data;

assign chipset_intf_val_noc3    = cpu_mem_traffic & spl_noc3_val;
assign chipset_intf_data_noc3   = spl_noc3_data;

assign spl_noc3_rdy             = cpu_mem_traffic ? chipset_intf_rdy_noc3 : 1'b1;



// Splits memory and I/O traffic
// (careful with modifications, naming is 
// a bit backwards)
mem_io_splitter mem_io_splitter(
    .clk (chipset_clk),
    .rst (~chipset_rst_n),

    // Slightly different splitting when doing UART boot
    .uart_boot_en(uart_boot_en),

    // NoC1 into splitter (only I/O uses Noc1 input)
    .noc1_splitter_val (1'b0),
    .noc1_splitter_data ({`NOC_DATA_WIDTH{1'b0}}),
    .splitter_noc1_rdy (),

    // NoC2 into splitter
    .noc2_splitter_val      (mem_io_spl_in_val  ),
    .noc2_splitter_data     (mem_io_spl_in_data ),
    .splitter_noc2_rdy      (mem_io_spl_in_rdy  ),

    // NoC3 into splitter not used
    
    // Splitter output to NoC1 (not used)
    .splitter_noc1sink_val (),
    .splitter_noc1sink_data (),
    .noc1sink_splitter_rdy (1'b0),

    // Splitter output to NoC2 not used

    // Splitter output to NoC3
    .splitter_noc3_val      (spl_noc3_val       ),
    .splitter_noc3_data     (spl_noc3_data      ),
    .noc3_splitter_rdy      (spl_noc3_rdy       ),

    // Splitter to memory interface
    .splitter_mem_val (splitter_mem_val),
    .splitter_mem_data (splitter_mem_data),
    .mem_splitter_rdy (splitter_mem_rdy),

    // Memory to splitter interface
    .mem_splitter_val (mem_splitter_val),
    .mem_splitter_data (mem_splitter_data),
    .splitter_mem_rdy (mem_splitter_rdy),

    // Splitter to I/O interface
    .splitter_io_val (splitter_io_val),
    .splitter_io_data (splitter_io_data),
    .io_splitter_rdy (splitter_io_rdy),

    // I/O to splitter interface
    .io_splitter_val (io_splitter_val),
    .io_splitter_data (io_splitter_data),
    .splitter_io_rdy (io_splitter_rdy),

    .test_good_end      (test_good_end  ),
    .test_bad_end       (test_bad_end   )
);

`ifndef PITONSYS_NO_MC
// Memory controller.  Either uses "fake" simulated
// memory controller or FPGA memory controllers
`ifdef PITON_FPGA_MC_DDR3
mc_top mc_top(
    .mc_ui_clk_sync_rst(mc_ui_clk_sync_rst),

    .core_ref_clk(chipset_clk),

    .sys_clk(mc_clk),

    .sys_rst_n(chipset_rst_n),

    .mc_flit_in_val(splitter_mem_val),
    .mc_flit_in_data(splitter_mem_data),
    .mc_flit_in_rdy(splitter_mem_rdy),

    .mc_flit_out_val(mem_splitter_val),
    .mc_flit_out_data(mem_splitter_data),
    .mc_flit_out_rdy(mem_splitter_rdy),

    .uart_boot_en(uart_boot_en),

    .ddr_addr(ddr_addr),
    .ddr_ba(ddr_ba),
    .ddr_cas_n(ddr_cas_n),
    .ddr_ck_n(ddr_ck_n),
    .ddr_ck_p(ddr_ck_p),
    .ddr_cke(ddr_cke),
    .ddr_ras_n(ddr_ras_n),
    .ddr_reset_n(ddr_reset_n),
    .ddr_we_n(ddr_we_n),
    .ddr_dq(ddr_dq),
    .ddr_dqs_n(ddr_dqs_n),
    .ddr_dqs_p(ddr_dqs_p),
`ifndef NEXYSVIDEO_BOARD
    .ddr_cs_n(ddr_cs_n),
`endif // endif NEXYSVIDEO_BOARD
    .ddr_dm(ddr_dm),
    .ddr_odt(ddr_odt),

    .init_calib_complete_out(init_calib_complete)
);
`endif // endif PITON_FPGA_MC_DDR3
`endif // endif PITONSYS_NO_MC

`ifdef PITONSYS_IOCTRL
io_ctrl_top io_ctrl_top(
    .clk                    (chipset_clk    ),
    .rst_n                  (io_ctrl_rst_n  ),
    .piton_ready_n          (piton_ready_n  ),

    // NoC1 into IOB 
    .iob_noc1_valid_in(intf_chipset_val_noc1),
    .iob_noc1_data_in(intf_chipset_data_noc1),
    .iob_noc1_ready_in(intf_chipset_rdy_noc1),
    
    // NoC2 from splitter into IOB
    .noc2_valid_in(splitter_io_val),
    .noc2_data_in(splitter_io_data),
    .noc2_ready_in(splitter_io_rdy),

    // NoC3 in not used by IOB
    
    // NoC1 out not used by IOB

    // NoC2 out of IOB
    .iob_noc2_valid_out(chipset_intf_val_noc2),
    .iob_noc2_data_out(chipset_intf_data_noc2),
    .iob_noc2_ready_out(chipset_intf_rdy_noc2),

    // NoC3 out of IOB to splitter
    .noc3_valid_out(io_splitter_val),
    .noc3_data_out(io_splitter_data),
    .noc3_ready_out(io_splitter_rdy),

`ifdef PITONSYS_UART
    // UART interface
`ifdef PITONSYS_UART_LOOBACK
    // Can be used to loobpack UART for testing
    .uart_lb_sw(1'b1),
`else // ifndef PITONSYS_UART_LOOBACK
    .uart_lb_sw(1'b0),
`endif // endif PITONSYS_UART_LOOBACK
    .uart_rx(uart_rx),
    .uart_tx(uart_tx),
`endif // endif PITONSYS_UART

    // SPI interface
`ifdef PITONSYS_SPI
    .spi_sys_clk(spi_sys_clk),
    .spi_data_in(spi_data_in),
    .spi_clk_out(spi_clk_out),
    .spi_data_out(spi_data_out),
    .spi_cs_n(spi_cs_n),
`endif // PITONSYS_SPI

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
    .net_phy_mdc            (net_phy_mdc        ),

    .uart_boot_en(uart_boot_en),
    // Uncomment to connect to the switch
    // .uart_timeout_en(uart_timeout_en),
    .uart_timeout_en        (1'b1),

    .test_good_end          (test_good_end      ),
    .test_bad_end           (test_bad_end       ),
    
    .test_start             (test_start         ),

    .uart_noc_valid         (uart_noc_valid     ),
    .uart_noc_data          (uart_noc_data      ),
    .uart_noc_ready         (uart_noc_ready     )
);
`endif // endif PITONSYS_IOCTRL

endmodule
