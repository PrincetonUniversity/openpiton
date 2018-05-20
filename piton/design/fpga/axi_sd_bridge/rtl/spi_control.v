
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// spiCtrl.v                                                 ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
////  Controls access to the 3 types of SPI access
//// Direct SPI access, SD initialisation, and SD block read/write
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
`include "spi_master_defines.v"

module spi_control(
    input  wire       clk,
    input  wire       rst,

    input  wire       rx_data_rdy,
    input  wire       sd_init_rdy,
    input  wire       rdwr_sd_block_rdy,

    input  wire       spi_trans_ctrl,
    input  wire [1:0] spi_trans_type,

    output reg        rx_data_rdy_clr,
    output reg        sd_init_req,
    output reg  [1:0] rdwr_sd_block_req,
    output reg        tx_data_wen,

    output reg        spi_trans_status,
    output reg        spi_cs_n
);

    //==========================================================================
    // State Definitions
    //==========================================================================
    localparam ST_S_CTRL     = 3'b000;
    localparam WT_S_CTRL_REQ = 3'b001;
    localparam WT_FIN1       = 3'b010;
    localparam DIR_ACC       = 3'b011;
    localparam INIT          = 3'b100;
    localparam WT_FIN2       = 3'b101;
    localparam RW            = 3'b110;
    localparam WT_FIN3       = 3'b111;

    //==========================================================================
    // Internal Wires and Registers
    //==========================================================================
    reg [1:0] rdwr_sd_block_req_next;
    reg       rx_data_rdy_clr_next;
    reg       sd_init_req_next;
    reg       spi_cs_n_next;
    reg       spi_trans_status_next;
    reg       tx_data_wen_next;
    reg [2:0] state;
    reg [2:0] state_next;

    //==========================================================================
    // Next State/Next Output Logic
    //==========================================================================
    always @ ( * ) begin
        state_next = state;
        rdwr_sd_block_req_next = rdwr_sd_block_req;
        tx_data_wen_next       = tx_data_wen;
        sd_init_req_next       = sd_init_req;
        rx_data_rdy_clr_next   = rx_data_rdy_clr;
        spi_trans_status_next  = spi_trans_status;
        spi_cs_n_next          = spi_cs_n;


        case (state)  // synopsys parallel_case full_case
            ST_S_CTRL: begin
                rdwr_sd_block_req_next = `NO_BLOCK_REQ;
                tx_data_wen_next       = 1'b0;
                sd_init_req_next       = 1'b0;
                rx_data_rdy_clr_next   = 1'b0;
                spi_trans_status_next  = `TRANS_NOT_BUSY;
                spi_cs_n_next          = 1'b1;
                state_next             = WT_S_CTRL_REQ;
            end
            WT_S_CTRL_REQ: begin
                rx_data_rdy_clr_next  = 1'b0;
                spi_trans_status_next = `TRANS_NOT_BUSY;

                if ((spi_trans_ctrl == `TRANS_START) && (spi_trans_type == `INIT_SD)) begin
                    state_next            = INIT;
                    spi_trans_status_next = `TRANS_BUSY;
                    sd_init_req_next      = 1'b1;
                end
                else if ((spi_trans_ctrl == `TRANS_START) && (spi_trans_type == `RW_WRITE_SD_BLOCK)) begin
                    state_next             = RW;
                    spi_trans_status_next  = `TRANS_BUSY;
                    rdwr_sd_block_req_next = `WRITE_SD_BLOCK;
                end
                else if ((spi_trans_ctrl == `TRANS_START) && (spi_trans_type == `RW_READ_SD_BLOCK)) begin
                    state_next             = RW;
                    spi_trans_status_next  = `TRANS_BUSY;
                    rdwr_sd_block_req_next = `READ_SD_BLOCK;
                end
                else if ((spi_trans_ctrl == `TRANS_START) && (spi_trans_type == `DIRECT_ACCESS)) begin
                    state_next            = DIR_ACC;
                    spi_trans_status_next = `TRANS_BUSY;
                    tx_data_wen_next      = 1'b1;
                    spi_cs_n_next         = 1'b0;
                end
            end
            WT_FIN1: begin
                if (rx_data_rdy) begin
                    state_next           = WT_S_CTRL_REQ;
                    rx_data_rdy_clr_next = 1'b1;
                    spi_cs_n_next        = 1'b1;
                end
            end
            DIR_ACC: begin
                tx_data_wen_next = 1'b0;
                state_next       = WT_FIN1;
            end
            INIT: begin
                sd_init_req_next = 1'b0;
                state_next       = WT_FIN2;
            end
            WT_FIN2: begin
                if (sd_init_rdy) begin
                    state_next = WT_S_CTRL_REQ;
                end
            end
            RW: begin
                rdwr_sd_block_req_next <= `NO_BLOCK_REQ;
                state_next = WT_FIN3;
            end
            WT_FIN3: begin
                if (rdwr_sd_block_rdy) begin
                    state_next = WT_S_CTRL_REQ;
                end
            end
        endcase
    end

    //==========================================================================
    // State Update Logic
    //==========================================================================
    always @(posedge clk) begin
        if (rst)
            state <= ST_S_CTRL;
        else
            state <= state_next;
    end

    //==========================================================================
    // Output Update Logic
    //==========================================================================
    always @ (posedge clk) begin
        if (rst == 1'b1) begin
            rdwr_sd_block_req <= `NO_BLOCK_REQ;
            tx_data_wen       <= 1'b0;
            sd_init_req       <= 1'b0;
            rx_data_rdy_clr   <= 1'b0;
            spi_trans_status  <= `TRANS_NOT_BUSY;
            spi_cs_n          <= 1'b1;
        end
        else begin
            rdwr_sd_block_req <= rdwr_sd_block_req_next;
            tx_data_wen       <= tx_data_wen_next;
            sd_init_req       <= sd_init_req_next;
            rx_data_rdy_clr   <= rx_data_rdy_clr_next;
            spi_trans_status  <= spi_trans_status_next;
            spi_cs_n          <= spi_cs_n_next;
        end
    end

endmodule
