// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: cmp_top.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
//
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
//
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
//
// ========== Copyright Header End ============================================
////////////////////////////////////////////////////////
`timescale 1ps/100fs

`include "sys.h"
`include "iop.h"
`include "cross_module.tmp.h"
`include "ifu.tmp.h"
`include "define.vh"


`ifdef PITON_FPGA_SYNTH
    `define PITON_PROTO
`endif

`ifdef VC707_BOARD
    `define PITON_FPGA_DIFF_CLK
`elsif GENESYS2_BOARD
    `define PITON_FPGA_DIFF_CLK
`endif
// Nexys4ddr and NexysVideo has single ended clock input

`ifdef VC707_BOARD
    `define PITON_FPGA_RST_ACT_HIGH
`endif
// Genesys2 and NexysVideo has low active rst


module cmp_top (
`ifdef PITON_FPGA_DIFF_CLK
    input       clk_p,
    input       clk_n,
`else
    input       pin_clk,
`endif 

`ifdef PITON_FPGA_SD_BOOT
    input   spi_data_in,
    output  spi_data_out,
    output  spi_clk_out,
    output  spi_cs_n,
`endif

`ifdef PITON_FPGA_MC_DDR3
    output              init_calib_complete,
    
    `ifdef VC707_BOARD
        output  [13:0]      ddr3_addr,
        output  [2:0]       ddr3_ba,
        output              ddr3_cas_n,
        output  [0:0]       ddr3_ck_n,
        output  [0:0]       ddr3_ck_p,
        output  [0:0]       ddr3_cke,
        output              ddr3_ras_n,
        output              ddr3_reset_n,
        output              ddr3_we_n,
        inout   [63:0]      ddr3_dq,
        inout   [7:0]       ddr3_dqs_n,
        inout   [7:0]       ddr3_dqs_p,
        output  [0:0]       ddr3_cs_n,
        output  [7:0]       ddr3_dm,
        output  [0:0]       ddr3_odt,
    `elsif NEXYS4DDR_BOARD
        output  [12:0]      ddr2_addr,
        output  [2:0]       ddr2_ba,
        output              ddr2_cas_n,
        output  [0:0]       ddr2_ck_n,
        output  [0:0]       ddr2_ck_p,
        output  [0:0]       ddr2_cke,
        output              ddr2_ras_n,
        output              ddr2_we_n,
        inout   [15:0]      ddr2_dq,
        inout   [1:0]       ddr2_dqs_n,
        inout   [1:0]       ddr2_dqs_p,
        output  [0:0]       ddr2_cs_n,
        output  [1:0]       ddr2_dm,
        output  [0:0]       ddr2_odt,
    `elsif GENESYS2_BOARD
        output  [14:0]      ddr3_addr,
        output  [2:0]       ddr3_ba,
        output              ddr3_cas_n,
        output  [0:0]       ddr3_ck_n,
        output  [0:0]       ddr3_ck_p,
        output  [0:0]       ddr3_cke,
        output              ddr3_ras_n,
        output              ddr3_reset_n,
        output              ddr3_we_n,
        inout   [31:0]      ddr3_dq,
        inout   [3:0]       ddr3_dqs_n,
        inout   [3:0]       ddr3_dqs_p,
        output  [0:0]       ddr3_cs_n,
        output  [3:0]       ddr3_dm,
        output  [0:0]       ddr3_odt,
    `elsif NEXYSVIDEO_BOARD
        output  [14:0]      ddr3_addr,
        output  [2:0]       ddr3_ba,
        output              ddr3_cas_n,
        output  [0:0]       ddr3_ck_n,
        output  [0:0]       ddr3_ck_p,
        output  [0:0]       ddr3_cke,
        output              ddr3_ras_n,
        output              ddr3_reset_n,
        output              ddr3_we_n,
        inout   [15:0]      ddr3_dq,
        inout   [1:0]       ddr3_dqs_n,
        inout   [1:0]       ddr3_dqs_p,
        output  [1:0]       ddr3_dm,
        output  [0:0]       ddr3_odt,
    `endif
`endif  // PITON_FPGA_MC_DDR3


    input       pin_rst,        // VC707: active high
    input       pin_soft_rst,   // VC707: active high

    output      pin_tx,
    input       pin_rx,

    input       uart_lb_sw,

    output      led_0,
    output      led_1,
    output      led_2,
    output      led_3,
    output      led_4,

    output  wire    fake_noc2_ored,
    output  wire    fake_noc3_ored
);

    reg     chip_rst_n;
    wire    io_ctrl_rst_n;
    wire    mc_ui_clk_sync_rst;
    wire    mc_ui_clk;
    wire    test_start;
    wire    sys_rst_n;
    wire    spi_sys_clk;

    reg     init_calib_complete_r;
    reg     init_calib_complete_r_r;

    `ifdef PITON_FPGA_RST_ACT_HIGH
        assign sys_rst_n = ~pin_rst;
    `else
        assign sys_rst_n = pin_rst;
    `endif
    

    `ifdef PITON_FPGA_MC_DDR3
        assign io_ctrl_rst_n = ~mc_ui_clk_sync_rst & init_calib_complete_r_r;
    `else
        assign io_ctrl_rst_n = sys_rst_n;
    `endif


    always @(posedge core_ref_clk) begin
        `ifdef PITON_FPGA_UART_DMW
            chip_rst_n <= test_start & ~pin_soft_rst;
        `else
            chip_rst_n <= sys_rst_n;
        `endif
    end    
    
//--------------------------------------------------
// Clock Generation
//--------------------------------------------------

    wire    io_clk;
    wire    fpga_clk;
    wire    jtag_clk;
    wire    core_ref_clk;
    wire    mc_sys_clk;

    assign io_clk   = core_ref_clk;
    assign fpga_clk = core_ref_clk;
    assign jtag_clk = core_ref_clk;

   

    clk_mmcm    clk_mmcm    (
        `ifdef PITON_FPGA_DIFF_CLK
            .clk_in1_p      (clk_p          ),
            .clk_in1_n      (clk_n          ),
        `else
            .clk_in1        (pin_clk        ),
        `endif

            .core_ref_clk   (core_ref_clk   ),
            .mc_sys_clk     (mc_sys_clk     )
        `ifdef PITON_FPGA_SD_BOOT
            ,
            .spi_sys_clk    (spi_sys_clk    )
        `endif
    );


    `ifdef PITON_FPGA_MC_DDR3
        always @(posedge core_ref_clk) begin
            init_calib_complete_r   <= init_calib_complete;
            init_calib_complete_r_r <= init_calib_complete_r;
        end
    `endif



    blinker blinker(
        .clk                (core_ref_clk   ),
        .rst_n              (chip_rst_n     ),

        .GPIO_LED_0         (led_0          ),
        .GPIO_LED_1         (led_1          ),
        .GPIO_LED_2         (led_2          ),
        .GPIO_LED_3         (led_3          ),
        .GPIO_LED_4         (led_4          ),
        .GPIO_LED_5         (               )   // unconnected
     );

////////////////////////////////////////////////////////
// SYNTHESIZABLE CHIP
////////////////////////////////////////////////////////
    reg          pll_bypass;
    reg [4:0]    pll_rangea;
    reg [1:0]    clk_mux_sel;
    wire          async_mux;

    wire                         processor_offchip_noc1_valid;
    wire [`NOC_DATA_WIDTH-1:0]   processor_offchip_noc1_data;
    wire                         processor_offchip_noc1_yummy;
    wire                         processor_offchip_noc2_valid;
    wire [`NOC_DATA_WIDTH-1:0]   processor_offchip_noc2_data;
    wire                         processor_offchip_noc2_yummy;
    wire                         processor_offchip_noc3_valid;
    wire [`NOC_DATA_WIDTH-1:0]   processor_offchip_noc3_data;
    wire                         processor_offchip_noc3_yummy;

    wire                         offchip_processor_noc1_valid = 1'b0; 
    wire [`NOC_DATA_WIDTH-1:0]   offchip_processor_noc1_data = 64'b0;
    wire                         offchip_processor_noc1_yummy;
    wire                         offchip_processor_noc2_valid;
    wire [`NOC_DATA_WIDTH-1:0]   offchip_processor_noc2_data;
    wire                         offchip_processor_noc2_yummy;
    wire                         offchip_processor_noc3_valid;
    wire [`NOC_DATA_WIDTH-1:0]   offchip_processor_noc3_data;
    wire                         offchip_processor_noc3_yummy = 1'b0;

    wire                            uart_mig_en;           
    wire [`MIG_APP_CMD_WIDTH-1 :0]  uart_mig_cmd;          
    wire [`MIG_APP_ADDR_WIDTH-1:0]  uart_mig_addr;         
    wire                            uart_mig_rdy;          
    wire                            uart_mig_wdf_wren;     
    wire [`MIG_APP_DATA_WIDTH-1:0]  uart_mig_wdf_data;     
    wire [`MIG_APP_MASK_WIDTH-1:0]  uart_mig_wdf_mask;     
    wire                            uart_mig_wdf_end;      
    wire                            uart_mig_wdf_rdy;

    // connected to pins
    assign fake_noc2_ored = processor_offchip_noc2_valid | processor_offchip_noc2_yummy | |processor_offchip_noc2_data;
    assign fake_noc3_ored = processor_offchip_noc3_valid | processor_offchip_noc3_yummy | |processor_offchip_noc3_data;

    chip    chip(
        .core_ref_clk                   (core_ref_clk),
        .io_clk                         (io_clk),
        .rst_n                          (chip_rst_n),

        .processor_offchip_noc1_valid   (processor_offchip_noc1_valid),
        .processor_offchip_noc1_data    (processor_offchip_noc1_data),
        .processor_offchip_noc1_yummy   (processor_offchip_noc1_yummy),
        .processor_offchip_noc2_valid   (processor_offchip_noc2_valid),
        .processor_offchip_noc2_data    (processor_offchip_noc2_data),
        .processor_offchip_noc2_yummy   (processor_offchip_noc2_yummy),
        .processor_offchip_noc3_valid   (processor_offchip_noc3_valid),
        .processor_offchip_noc3_data    (processor_offchip_noc3_data),
        .processor_offchip_noc3_yummy   (processor_offchip_noc3_yummy),

        .offchip_processor_noc1_valid   (offchip_processor_noc1_valid),
        .offchip_processor_noc1_data    (offchip_processor_noc1_data),
        .offchip_processor_noc1_yummy   (offchip_processor_noc1_yummy),
        .offchip_processor_noc2_valid   (offchip_processor_noc2_valid),
        .offchip_processor_noc2_data    (offchip_processor_noc2_data),
        .offchip_processor_noc2_yummy   (offchip_processor_noc2_yummy),
        .offchip_processor_noc3_valid   (offchip_processor_noc3_valid),
        .offchip_processor_noc3_data    (offchip_processor_noc3_data),
        .offchip_processor_noc3_yummy   (offchip_processor_noc3_yummy)
    );

////////////////////////////////////////////////////////
// mem_io_splitter
////////////////////////////////////////////////////////
    wire splitter_noc2_valid_in;
    wire splitter_noc2_ready_in;
    wire [`NOC_DATA_WIDTH-1:0] splitter_noc2_data_in;
    wire splitter_mem_noc2_valid;
    wire splitter_mem_noc2_ready;
    wire [`NOC_DATA_WIDTH-1:0] splitter_mem_noc2_data;
    wire splitter_io_noc2_valid;
    wire splitter_io_noc2_ready;
    wire [`NOC_DATA_WIDTH-1:0] splitter_io_noc2_data;

    wire mem_splitter_noc3_valid;
    wire mem_splitter_noc3_ready;
    wire [`NOC_DATA_WIDTH-1:0] mem_splitter_noc3_data;
    wire io_splitter_noc3_valid; //tmp stub
    wire io_splitter_noc3_ready;
    wire [`NOC_DATA_WIDTH-1:0] io_splitter_noc3_data ; // tmp stub

    wire splitter_noc3_valid_out;
    wire splitter_noc3_ready_out;
    wire [`NOC_DATA_WIDTH-1:0] splitter_noc3_data_out;

    wire splitter_noc1_valid_in; // tmp stub
    wire splitter_noc1_ready_in;
    wire [`NOC_DATA_WIDTH-1:0] splitter_noc1_data_in; // tmp stub
    wire splitter_noc1_valid_out;
    wire splitter_noc1_ready_out; // temperary stub
    wire [`NOC_DATA_WIDTH-1:0] splitter_noc1_data_out;

    assign splitter_noc1_valid_in = 1'b0;
    assign splitter_noc1_data_in = `NOC_DATA_WIDTH'b0;
    assign splitter_noc1_ready_out = 1'b1;
    
    valrdy_to_credit #(4, 3) cgno_blk_splitter(
        .clk        (fpga_clk),
        .reset      (~chip_rst_n),
        .data_in    (splitter_noc3_data_out),
        .valid_in   (splitter_noc3_valid_out),
        .ready_in   (splitter_noc3_ready_out),

        .data_out   (offchip_processor_noc3_data),           // Data
        .valid_out  (offchip_processor_noc3_valid),       // Val signal
        .yummy_out  (processor_offchip_noc3_yummy)    // Yummy signal
    );

    credit_to_valrdy cgni_blk_splitter_noc2(
        .clk        (fpga_clk),
        .reset      (~chip_rst_n),
        .data_in    (processor_offchip_noc2_data),
        .valid_in   (processor_offchip_noc2_valid),
        .yummy_in   (offchip_processor_noc2_yummy),

        .data_out   (splitter_noc2_data_in),           // Data
        .valid_out  (splitter_noc2_valid_in),       // Val signal from dynamic network to processor
        .ready_out  (splitter_noc2_ready_in)    // Rdy signal from processor to dynamic network
    );
    
    mem_io_splitter mem_io_splitter(
        .clk  (fpga_clk),
        .rst  (~chip_rst_n),

        // rdy/val for nocs to splitter
        .noc1_splitter_val  (splitter_noc1_valid_in),
        .noc2_splitter_val  (splitter_noc2_valid_in),                             
        .splitter_noc1_rdy  (splitter_noc1_ready_in),
        .splitter_noc2_rdy  (splitter_noc2_ready_in),

        // rdy/val for splitter to nocs
        .splitter_noc3_val  (splitter_noc3_valid_out),
        .noc3_splitter_rdy  (splitter_noc3_ready_out),

        // rdy/val for splitter to mem
        .splitter_mem_val  (splitter_mem_noc2_valid),
        .mem_splitter_rdy  (splitter_mem_noc2_ready),

        // rdy/val for mem to splitter
        .mem_splitter_val  (mem_splitter_noc3_valid),
        .splitter_mem_rdy  (mem_splitter_noc3_ready),

        // rdy/val for splitter to IO
        .splitter_io_val   (splitter_io_noc2_valid),
        .io_splitter_rdy   (splitter_io_noc2_ready),

        // rdy/val for IO to splitter
        .io_splitter_val   (io_splitter_noc3_valid),
        .splitter_io_rdy   (io_splitter_noc3_ready),

        // rdy/val for splitter to noc1 sink
        .noc1sink_splitter_rdy  (splitter_noc1_ready_out),
        .splitter_noc1sink_val  (splitter_noc1_valid_out),
        
        .noc1_splitter_data  (splitter_noc1_data_in),
        .noc2_splitter_data  (splitter_noc2_data_in),

        .splitter_noc3_data  (splitter_noc3_data_out),
        .splitter_noc1sink_data  (splitter_noc1_data_out),

        .mem_splitter_data  (mem_splitter_noc3_data),
        .splitter_mem_data  (splitter_mem_noc2_data),

        .io_splitter_data  (io_splitter_noc3_data),
        .splitter_io_data  (splitter_io_noc2_data)      
    );
    

////////////////////////////////////////////////////////
// iobridge rtl/stub
////////////////////////////////////////////////////////
    // input: noc1
    // output: noc2
    // Iob val/rdy interface
    wire iob_noc1_valid_in;
    wire iob_noc1_ready_in;
    wire [`NOC_DATA_WIDTH-1:0] iob_noc1_data_in;
    wire iob_noc2_valid_out;
    wire iob_noc2_ready_out;
    wire [`NOC_DATA_WIDTH-1:0] iob_noc2_data_out;

    valrdy_to_credit #(4, 3) cgno_blk_iob(
        .clk        (fpga_clk),
        .reset      (~chip_rst_n),
        .data_in    (iob_noc2_data_out),
        .valid_in   (iob_noc2_valid_out),
        .ready_in   (iob_noc2_ready_out),
        .data_out   (offchip_processor_noc2_data),           // Data
        .valid_out  (offchip_processor_noc2_valid),       // Val signal
        .yummy_out  (processor_offchip_noc2_yummy)    // Yummy signal
    );

    credit_to_valrdy cgni_blk_iob(
        .clk        (fpga_clk),
        .reset      (~chip_rst_n),
        .data_in    (processor_offchip_noc1_data),
        .valid_in   (processor_offchip_noc1_valid),
        .yummy_in   (offchip_processor_noc1_yummy),
        .data_out   (iob_noc1_data_in),           // Data
        .valid_out  (iob_noc1_valid_in),       // Val signal from dynamic network to processor
        .ready_out  (iob_noc1_ready_in)    // Rdy signal from processor to dynamic network
    );


    `ifdef PITON_FPGA_MC_DDR3

        mc_top    mc_top (
            .mc_ui_clk              (mc_ui_clk                  ),
            .mc_ui_clk_sync_rst     (mc_ui_clk_sync_rst         ),
            .core_ref_clk           (core_ref_clk               ),
            .test_start             (test_start                 ),

            .mc_flit_in_data        (splitter_mem_noc2_data     ),
            .mc_flit_in_val         (splitter_mem_noc2_valid    ),
            .mc_flit_in_rdy         (splitter_mem_noc2_ready    ),

            .mc_flit_out_data       (mem_splitter_noc3_data     ),
            .mc_flit_out_val        (mem_splitter_noc3_valid    ),
            .mc_flit_out_rdy        (mem_splitter_noc3_ready    ),

            .uart_mig_en            (uart_mig_en                ),
            .uart_mig_cmd           (uart_mig_cmd               ),
            .uart_mig_addr          (uart_mig_addr              ),
            .uart_mig_rdy           (uart_mig_rdy               ),
            .uart_mig_wdf_wren      (uart_mig_wdf_wren          ),
            .uart_mig_wdf_data      (uart_mig_wdf_data          ),
            .uart_mig_wdf_mask      (uart_mig_wdf_mask          ),
            .uart_mig_wdf_end       (uart_mig_wdf_end           ),
            .uart_mig_wdf_rdy       (uart_mig_wdf_rdy           ),

        `ifdef VC707_BOARD
            .ddr3_addr              (ddr3_addr                  ),
            .ddr3_ba                (ddr3_ba                    ),
            .ddr3_cas_n             (ddr3_cas_n                 ),
            .ddr3_ck_n              (ddr3_ck_n                  ),
            .ddr3_ck_p              (ddr3_ck_p                  ),
            .ddr3_cke               (ddr3_cke                   ),
            .ddr3_ras_n             (ddr3_ras_n                 ),
            .ddr3_reset_n           (ddr3_reset_n               ),
            .ddr3_we_n              (ddr3_we_n                  ),
            .ddr3_dq                (ddr3_dq                    ),
            .ddr3_dqs_n             (ddr3_dqs_n                 ),
            .ddr3_dqs_p             (ddr3_dqs_p                 ),
            .ddr3_cs_n              (ddr3_cs_n                  ),
            .ddr3_dm                (ddr3_dm                    ),
            .ddr3_odt               (ddr3_odt                   ),
        `elsif NEXYS4DDR_BOARD
            .ddr2_addr              (ddr2_addr                  ),
            .ddr2_ba                (ddr2_ba                    ),
            .ddr2_cas_n             (ddr2_cas_n                 ),
            .ddr2_ck_n              (ddr2_ck_n                  ),
            .ddr2_ck_p              (ddr2_ck_p                  ),
            .ddr2_cke               (ddr2_cke                   ),
            .ddr2_ras_n             (ddr2_ras_n                 ),
            .ddr2_we_n              (ddr2_we_n                  ),
            .ddr2_dq                (ddr2_dq                    ),
            .ddr2_dqs_n             (ddr2_dqs_n                 ),
            .ddr2_dqs_p             (ddr2_dqs_p                 ),
            .ddr2_cs_n              (ddr2_cs_n                  ),
            .ddr2_dm                (ddr2_dm                    ),
            .ddr2_odt               (ddr2_odt                   ),
        `elsif GENESYS2_BOARD
            .ddr3_addr              (ddr3_addr                  ),
            .ddr3_ba                (ddr3_ba                    ),
            .ddr3_cas_n             (ddr3_cas_n                 ),
            .ddr3_ck_n              (ddr3_ck_n                  ),
            .ddr3_ck_p              (ddr3_ck_p                  ),
            .ddr3_cke               (ddr3_cke                   ),
            .ddr3_ras_n             (ddr3_ras_n                 ),
            .ddr3_reset_n           (ddr3_reset_n               ),
            .ddr3_we_n              (ddr3_we_n                  ),
            .ddr3_dq                (ddr3_dq                    ),
            .ddr3_dqs_n             (ddr3_dqs_n                 ),
            .ddr3_dqs_p             (ddr3_dqs_p                 ),
            .ddr3_cs_n              (ddr3_cs_n                  ),
            .ddr3_dm                (ddr3_dm                    ),
            .ddr3_odt               (ddr3_odt                   ),
        `elsif NEXYSVIDEO_BOARD
            .ddr3_addr              (ddr3_addr                  ),
            .ddr3_ba                (ddr3_ba                    ),
            .ddr3_cas_n             (ddr3_cas_n                 ),
            .ddr3_ck_n              (ddr3_ck_n                  ),
            .ddr3_ck_p              (ddr3_ck_p                  ),
            .ddr3_cke               (ddr3_cke                   ),
            .ddr3_ras_n             (ddr3_ras_n                 ),
            .ddr3_reset_n           (ddr3_reset_n               ),
            .ddr3_we_n              (ddr3_we_n                  ),
            .ddr3_dq                (ddr3_dq                    ),
            .ddr3_dqs_n             (ddr3_dqs_n                 ),
            .ddr3_dqs_p             (ddr3_dqs_p                 ),
            .ddr3_dm                (ddr3_dm                    ),
            .ddr3_odt               (ddr3_odt                   ),
        `endif

            .init_calib_complete_out(init_calib_complete        ),

            .sys_clk                (mc_sys_clk                 ),
            .sys_rst_n              (sys_rst_n               )
        );

    `else

        assign splitter_mem_noc2_ready = 1'b0;
        assign mem_splitter_noc3_valid = 1'b0;
        assign mem_splitter_noc3_data = {`NOC_DATA_WIDTH{1'b0}};
    
    `endif // PITON_FPGA_MC_DDR3


    ciop_iob ciop_iob     (
        .chip_clk       (core_ref_clk           ),
        .fpga_clk       (fpga_clk               ),
        .rst_n          (chip_rst_n             )
    );


    io_ctrl_top io_ctrl_top (
        .clk                (fpga_clk                   ),
        .rst_n              (io_ctrl_rst_n              ),

        .mig_ui_clk         (mc_ui_clk                  ),

        .uart_lb_sw         (uart_lb_sw                 ),
        .test_start         (test_start                 ),

        .iob_noc1_valid_in  (iob_noc1_valid_in          ),
        .iob_noc1_ready_in  (iob_noc1_ready_in          ),
        .iob_noc1_data_in   (iob_noc1_data_in           ),

        .iob_noc2_valid_out (iob_noc2_valid_out         ),
        .iob_noc2_ready_out (iob_noc2_ready_out         ),
        .iob_noc2_data_out  (iob_noc2_data_out          ),

        .noc2_valid_in      (splitter_io_noc2_valid     ),
        .noc2_data_in       (splitter_io_noc2_data      ),
        .noc2_ready_in      (splitter_io_noc2_ready     ),

        .noc3_valid_out     (io_splitter_noc3_valid     ),
        .noc3_data_out      (io_splitter_noc3_data      ),
        .noc3_ready_out     (io_splitter_noc3_ready     ),

        .uart_rx            (pin_rx                     ),
        .uart_tx            (pin_tx                     ),

        .spi_sys_clk        (spi_sys_clk                ),
        .spi_data_in        (spi_data_in                ),
        .spi_clk_out        (spi_clk_out                ),
        .spi_data_out       (spi_data_out               ),
        .spi_cs_n           (spi_cs_n                   ),

        .uart_mig_en        (uart_mig_en                ),
        .uart_mig_cmd       (uart_mig_cmd               ),
        .uart_mig_addr      (uart_mig_addr              ),
        .uart_mig_rdy       (uart_mig_rdy               ),
        .uart_mig_wdf_wren  (uart_mig_wdf_wren          ),
        .uart_mig_wdf_data  (uart_mig_wdf_data          ),
        .uart_mig_wdf_mask  (uart_mig_wdf_mask          ),
        .uart_mig_wdf_end   (uart_mig_wdf_end           ),
        .uart_mig_wdf_rdy   (uart_mig_wdf_rdy           )
    );


////////////////////////////////////////////////////////
// MONITOR STUFF
////////////////////////////////////////////////////////
`ifdef PITON_PROTO_MON
    // T1's TSO monitor, stripped of all L2 references
     reg diag_done;
       reg fail_flag;
       
    tso_mon tso_mon(chip.clk_muxed, `SPARC_CORE0.reset_l);

    // this is the T1 sparc core monitor
    monitor   monitor(
        .clk    (chip.clk_muxed),
        .cmp_gclk  (chip.clk_muxed),
        .rst_l     (`SPARC_CORE0.reset_l)
        );

    // L15 MONITORS
    cmp_l15_messages_mon l15_messages_mon(
        .clk (chip.clk_muxed)
        );

    // DMBR MONITOR
    dmbr_mon dmbr_mon (
        .clk(chip.clk_muxed)
     );

    //L2 MONITORS
     `ifdef FAKE_L2
     `else
     l2_mon l2_mon(
         .clk (chip.clk_muxed)
     );
     `endif

    jtag_mon jtag_mon(
        .clk (clk)
        );

    `ifndef PITON_PROTO
        iob_mon iob_mon(
            //.clk (fpga_clk)
            .clk (chip.clkmuxed)
        );
    `endif // PITON_PROTO

    manycore_network_mon network_mon (pll_clk);

    // Alexey
    // UART monitor
    reg      prev_tx_state;
    always @(posedge core_ref_clk)
        prev_tx_state <= pin_tx;

    always @(posedge core_ref_clk)
        if (prev_tx_state != pin_tx) begin
            $display("UART: pin_tx changed to %d at", pin_tx, $time);
        end

`endif // PITON_PROTO_MON


endmodule // cmp_top
