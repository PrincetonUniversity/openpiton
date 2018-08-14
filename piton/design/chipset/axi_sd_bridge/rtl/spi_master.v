//////////////////////////////////////////////////////////////////////
////                                                              ////
//// spi_master.v                                                    ////
////                                                              ////
//// This file is part of the spi_master opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
////  Top level module
////
////
////
////                                                              ////
//// To Do:                                                       ////
////
////                                                              ////
//// Author(s):                                                   ////
//// - Steve Fielding, sfielding@base2designs.com                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2008 Steve Fielding and OPENCORES.ORG          ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE. See the GNU Lesser General Public License for more  ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from <http://www.opencores.org/lgpl.shtml>                   ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
//  Patches by    : John Li
//
`include "spi_master_defines.v"

module spi_master(
    // Wishbone bus
    input  wire       clk_i,
    input  wire       rst_i,
    input  wire [7:0] adr_i,
    input  wire [7:0] dat_i,
    input  wire       stb_i,
    input  wire       we_i,
    output wire       ack_o,
    output wire [7:0] dat_o,

    // SPI logic clock
    input wire        spi_sys_clk,

    // SPI bus
    input  wire       spi_data_in,
    output wire       spi_clk_out,
    output wire       spi_data_out,
    output wire       spi_cs_n
);



    // local wires and regs
    wire [7:0]  spi_clk_delay_init;
    wire        rst_sync_to_spi_clk;
    wire [7:0]  rx_data_rwspi;
    wire        rx_data_rdy_rwspi;
    wire        tx_data_full;
    wire        tx_data_full_clr_rwspi;
    wire [7:0]  tx_data_rwspi;
    wire        rx_data_rdy_clr_rw_sd;
    wire        rx_data_rdy_clr_scmd;
    wire [7:0]  spi_da_rx_data;
    wire        rx_data_rdy;
    wire [7:0]  tx_data_rw_sd;
    wire        tx_data_wen_rw_sd;
    wire [7:0]  tx_data_scmd;
    wire        tx_data_wen_scmd;
    wire [7:0]  tx_data_init;
    wire        tx_data_wen_init;
    wire [7:0]  ctrl_status_data;
    wire [7:0]  tx_fifo_data;
    wire [7:0]  rx_fifo_data;
    wire [1:0]  spi_trans_type;
    wire [7:0]  spi_da_tx_data;
    wire [1:0]  rdwr_sd_block_req;
    wire [1:0]  sd_write_error;
    wire [1:0]  sd_read_error;
    wire [1:0]  sd_init_error;
    wire [7:0]  cmd_byte_init;
    wire [7:0]  data_byte_1_init;
    wire [7:0]  data_byte_2_init;
    wire [7:0]  data_byte_3_init;
    wire [7:0]  data_byte_4_init;
    wire [7:0]  check_sum_byte_init;
    wire [7:0]  resp_byte;
    wire [7:0]  cmd_byte_rw_sd;
    wire [7:0]  data_byte_1_rw_sd;
    wire [7:0]  data_byte_2_rw_sd;
    wire [7:0]  data_byte_3_rw_sd;
    wire [7:0]  data_byte_4_rw_sd;
    wire [7:0]  check_sum_byte_rw_sd;
    wire [7:0]  tx_fifo_data_out;
    wire [7:0]  rx_fifo_data_in;
    wire [31:0] sd_addr;
    wire [7:0]  spi_clk_delay;
    wire        spi_cs_n_init;
    wire        spi_cs_n_rw_sd;
    wire        spi_cs_n_ctrl;


    assign spi_cs_n = spi_cs_n_init & spi_cs_n_rw_sd & spi_cs_n_ctrl;

    // -----------------------------------
    // Instance of Module: wishBoneBI
    // -----------------------------------
    spi_master_wishbone_decoder wb_decoder(
        .clk_i            (clk_i),
        .rst_i            (rst_i),
        .adr_i            (adr_i),
        .dat_i            (dat_i),
        .we_i             (we_i),
        .stb_i            (stb_i),

        .dat_o            (dat_o),
        .ack_o            (ack_o),

        .ctrl_status_data (ctrl_status_data),
        .rx_fifo_data     (rx_fifo_data),
        .tx_fifo_data     (tx_fifo_data_out),

        .ctrl_status_sel  (ctrl_status_sel),
        .rx_fifo_sel      (rx_fifo_sel),
        .tx_fifo_sel      (tx_fifo_sel)
    );

    // -----------------------------------
    // Instance of Module: ctrlStsRegBI
    // -----------------------------------
    status_register_control status_reg_ctrl(
        .clk_i               (clk_i),
        .rst_i               (rst_i),
        .adr_i               (adr_i),
        .dat_i               (dat_i),
        .we_i                (we_i),
        .stb_i               (stb_i),

        .spi_sys_clk         (spi_sys_clk),
        .spi_trans_status    (spi_trans_status),
        .spi_da_rx_data      (spi_da_rx_data),
        .sd_write_error      (sd_write_error),
        .sd_read_error       (sd_read_error),
        .sd_init_error       (sd_init_error),

        .spi_clk_delay       (spi_clk_delay),
        .spi_trans_type      (spi_trans_type),
        .spi_trans_ctrl      (spi_trans_ctrl),
        .spi_da_tx_data      (spi_da_tx_data),
        .sd_addr             (sd_addr),
        .rst_sync_to_bus_clk (rst_sync_to_bus_clk),
        .rst_sync_to_spi_clk (rst_sync_to_spi_clk),

        .ctrl_status_sel     (ctrl_status_sel),

        .ctrl_status_data    (ctrl_status_data)
    );

    // -----------------------------------
    // Instance of Module: spiCtrl
    // -----------------------------------
    spi_control spi_ctrl(
        .clk               (spi_sys_clk),
        .rst               (rst_sync_to_spi_clk),

        .rx_data_rdy       (rx_data_rdy),
        .sd_init_rdy       (sd_init_rdy),
        .rdwr_sd_block_rdy (rdwr_sd_block_rdy),

        .spi_trans_ctrl    (spi_trans_ctrl),
        .spi_trans_type    (spi_trans_type),

        .rx_data_rdy_clr   (rx_data_rdy_clr),
        .sd_init_req       (sd_init_req),
        .rdwr_sd_block_req (rdwr_sd_block_req),
        .tx_data_wen       (tx_data_wen),

        .spi_trans_status  (spi_trans_status),
        .spi_cs_n          (spi_cs_n_ctrl)
    );

    // -----------------------------------
    // Instance of Module: initSD
    // -----------------------------------
    init_sd init(
        .clk               (spi_sys_clk),
        .rst               (rst_sync_to_spi_clk),

        .sd_init_req       (sd_init_req),
        .send_cmd_rdy      (send_cmd_rdy),
        .resp_byte         (resp_byte),
        .resp_tout         (resp_tout),
        .rx_data_rdy       (rx_data_rdy),
        .tx_data_empty     (tx_data_empty),
        .tx_data_full      (tx_data_full),
        .spi_clk_delay_in  (spi_clk_delay),

        .check_sum_byte    (check_sum_byte_init),
        .cmd_byte          (cmd_byte_init),
        .data_byte_1       (data_byte_1_init),
        .data_byte_2       (data_byte_2_init),
        .data_byte_3       (data_byte_3_init),
        .data_byte_4       (data_byte_4_init),
        .send_cmd_req      (send_cmd_req_init),
        .sd_init_error     (sd_init_error),
        .sd_init_rdy       (sd_init_rdy),
        .spi_clk_delay_out (spi_clk_delay_init),
        .spi_cs_n          (spi_cs_n_init),
        .rx_data_rdy_clr   (rx_data_rdy_clr_init),
        .tx_data_out       (tx_data_init),
        .tx_data_wen       (tx_data_wen_init)
    );

    // -----------------------------------
    // Instance of Module: readWriteSDBlock
    // -----------------------------------
    read_write_sd_block rw_sd(
        .block_addr              (sd_addr),
        .clk                     (spi_sys_clk),
        .read_write_sd_block_req (rdwr_sd_block_req),
        .resp_byte               (resp_byte),
        .resp_tout               (resp_tout),
        .rst                     (rst_sync_to_spi_clk),
        .rx_data_in              (spi_da_rx_data),
        .rx_data_rdy             (rx_data_rdy),
        .send_cmd_rdy            (send_cmd_rdy),
        .tx_data_empty           (tx_data_empty),
        .tx_data_full            (tx_data_full),
        .tx_fifo_data            (tx_fifo_data_out),
        .check_sum_byte          (check_sum_byte_rw_sd),
        .cmd_byte                (cmd_byte_rw_sd),
        .data_byte_1             (data_byte_1_rw_sd),
        .data_byte_2             (data_byte_2_rw_sd),
        .data_byte_3             (data_byte_3_rw_sd),
        .data_byte_4             (data_byte_4_rw_sd),
        .read_error              (sd_read_error),
        .read_write_sd_block_rdy (rdwr_sd_block_rdy),
        .rx_data_rdy_clr         (rx_data_rdy_clr_rw_sd),
        .rx_fifo_data            (rx_fifo_data_in),
        .rx_fifo_wen             (rx_fifo_wen),
        .send_cmd_req            (send_cmd_req_rw_sd),
        .spi_cs_n                (spi_cs_n_rw_sd),
        .tx_data_out             (tx_data_rw_sd),
        .tx_data_wen             (tx_data_wen_rw_sd),
        .tx_fifo_ren             (tx_fifo_ren),
        .write_error             (sd_write_error)
    );

    // -----------------------------------
    // Instance of Module: sendCmd
    // -----------------------------------
    send_cmd scmd(

        .check_sum_byte_1 (check_sum_byte_init),
        .check_sum_byte_2 (check_sum_byte_rw_sd),
        .clk              (spi_sys_clk),
        .cmd_byte_1       (cmd_byte_init),
        .cmd_byte_2       (cmd_byte_rw_sd),
        .data_byte_1_1    (data_byte_1_init),
        .data_byte_1_2    (data_byte_1_rw_sd),
        .data_byte_2_1    (data_byte_2_init),
        .data_byte_2_2    (data_byte_2_rw_sd),
        .data_byte_3_1    (data_byte_3_init),
        .data_byte_3_2    (data_byte_3_rw_sd),
        .data_byte_4_1    (data_byte_4_init),
        .data_byte_4_2    (data_byte_4_rw_sd),
        .rst              (rst_sync_to_spi_clk),
        .rx_data_in       (spi_da_rx_data),
        .rx_data_rdy      (rx_data_rdy),
        .send_cmd_req_1   (send_cmd_req_init),
        .send_cmd_req_2   (send_cmd_req_rw_sd),
        .tx_data_empty    (tx_data_empty),
        .tx_data_full     (tx_data_full),
        .resp_byte        (resp_byte),
        .resp_tout        (resp_tout),
        .rx_data_rdy_clr  (rx_data_rdy_clr_scmd),
        .send_cmd_rdy     (send_cmd_rdy),
        .tx_data_out      (tx_data_scmd),
        .tx_data_wen      (tx_data_wen_scmd)
    );

    // -----------------------------------
    // Instance of Module: spiTxRxData
    // -----------------------------------
    spi_tx_rx_data spitxrx(

        .clk              (spi_sys_clk),
        .rst              (rst_sync_to_spi_clk),
        .tx1_data_in      (tx_data_rw_sd),
        .tx2_data_in      (tx_data_scmd),
        .tx3_data_in      (tx_data_init),
        .tx4_data_in      (spi_da_tx_data),
        .tx1_data_w_en    (tx_data_wen_rw_sd),
        .tx2_data_w_en    (tx_data_wen_scmd),
        .tx3_data_w_en    (tx_data_wen_init),
        .tx4_data_w_en    (tx_data_wen),
        .tx_data_full_clr (tx_data_full_clr_rwspi),
        .rx1_data_rdy_clr (rx_data_rdy_clr_rw_sd),
        .rx2_data_rdy_clr (rx_data_rdy_clr_scmd),
        .rx3_data_rdy_clr (rx_data_rdy_clr_init),
        .rx4_data_rdy_clr (rx_data_rdy_clr),
        .rx_data_in       (rx_data_rwspi),
        .rx_data_rdy_set  (rx_data_rdy_rwspi),
        .tx_data_out      (tx_data_rwspi),
        .tx_data_full     (tx_data_full),
        .rx_data_out      (spi_da_rx_data),
        .rx_data_rdy      (rx_data_rdy)
    );

    // -----------------------------------
    // Instance of Module: readWriteSPIWireData
    // -----------------------------------
    rwspi_wire_data rwspi(
        .clk              (spi_sys_clk),
        .clk_delay        (spi_clk_delay_init),
        .rst              (rst_sync_to_spi_clk),
        .spi_data_in      (spi_data_in),
        .tx_data_full     (tx_data_full),
        .tx_data_in       (tx_data_rwspi),
        .rx_data_out      (rx_data_rwspi),
        .rx_data_rdy_set  (rx_data_rdy_rwspi),
        .spi_clk_out      (spi_clk_out),
        .spi_data_out     (spi_data_out),
        .tx_data_empty    (tx_data_empty),
        .tx_data_full_clr (tx_data_full_clr_rwspi)
    );

    sm_tx_fifo #(`TX_FIFO_DEPTH, `TX_FIFO_ADDR_WIDTH) u_sm_tx_fifo (
        .spi_sys_clk(spi_sys_clk),
        .bus_clk(clk_i),
        .rst_sync_to_bus_clk(rst_sync_to_bus_clk),
        .rst_sync_to_spi_clk(rst_sync_to_spi_clk),
        .fifo_r_en(tx_fifo_ren),
        .fifo_empty(hostTxFifoEmpty),
        .bus_address(adr_i[2:0]),
        .bus_write_en(we_i),
        .bus_strobe_i(stb_i),
        .bus_fifo_select(tx_fifo_sel),
        .bus_data_in(dat_i),
        .bus_data_out(tx_fifo_data),
        .fifo_data_out(tx_fifo_data_out)
    );


    sm_rx_fifo #(`RX_FIFO_DEPTH, `RX_FIFO_ADDR_WIDTH) u_sm_rx_fifo(
        .spi_sys_clk(spi_sys_clk),
        .bus_clk(clk_i),
        .rst_sync_to_bus_clk(rst_sync_to_bus_clk),
        .rst_sync_to_spi_clk(rst_sync_to_spi_clk),
        .fifo_w_en(rx_fifo_wen),
        .fifo_full(hostRxFifoFull),
        .bus_address(adr_i[2:0]),
        .bus_write_en(we_i),
        .bus_strobe_i(stb_i),
        .bus_fifo_select(rx_fifo_sel),
        .bus_data_in(dat_i),
        .bus_data_out(rx_fifo_data),
        .fifo_data_in(rx_fifo_data_in)
    );

endmodule

