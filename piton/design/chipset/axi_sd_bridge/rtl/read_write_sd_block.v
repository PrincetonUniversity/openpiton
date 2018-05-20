
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// read_write_s_d_block.v                             ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
//// If read_write_sd_block_req equals WRITE_SD_BLOCK or
//// READ_SD_BLOCK, then write or read a 512 byte block
//// of SD memory
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
//// Copyright (C) 2004 Steve Fielding and OPENCORES.ORG          ////
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

module read_write_sd_block(
    input   wire [31:0] block_addr,
    input   wire        clk,
    input   wire [1:0]  read_write_sd_block_req,
    input   wire [7:0]  resp_byte,
    input   wire        resp_tout,
    input   wire        rst,
    input   wire [7:0]  rx_data_in,
    input   wire        rx_data_rdy,
    input   wire        send_cmd_rdy,
    input   wire        tx_data_empty,
    input   wire        tx_data_full,
    input   wire [7:0]  tx_fifo_data,

    output  reg  [7:0]  check_sum_byte,
    output  reg  [7:0]  cmd_byte,
    output  reg  [7:0]  data_byte_1,
    output  reg  [7:0]  data_byte_2,
    output  reg  [7:0]  data_byte_3,
    output  reg  [7:0]  data_byte_4,
    output  reg  [1:0]  read_error,
    output  reg         read_write_sd_block_rdy,
    output  reg         rx_data_rdy_clr,
    output  reg  [7:0]  rx_fifo_data,
    output  reg         rx_fifo_wen,
    output  reg         send_cmd_req,
    output  reg         spi_cs_n,
    output  reg  [7:0]  tx_data_out,
    output  reg         tx_data_wen,
    output  reg         tx_fifo_ren,
    output  reg  [1:0]  write_error
);

reg [7:0] next_check_sum_byte;
reg [7:0] next_cmd_byte;
reg [7:0] next_data_byte_1;
reg [7:0] next_data_byte_2;
reg [7:0] next_data_byte_3;
reg [7:0] next_data_byte_4;
reg [1:0] next_read_error;
reg       next_read_write_s_d_block_rdy;
reg       next_rx_data_rdy_clr;
reg [7:0] next_rx_fifo_data;
reg       next_rx_fifo_wen;
reg       next_send_cmd_req;
reg       next_spi_cs_n;
reg [7:0] next_tx_data_out;
reg       next_tx_data_wen;
reg       next_tx_fifo_ren;
reg [1:0] next_write_error;

// diagram signals declarations
reg [7:0]  del_cnt_1, next_del_cnt_1;
reg [7:0]  del_cnt_2, next_del_cnt_2;
reg [7:0]  loc_resp_byte, next_loc_resp_byte;
reg [8:0]  loop_cnt, next_loop_cnt;
reg [11:0] time_out_cnt, next_time_out_cnt;

// BINARY ENCODED state machine: rwBlkSt
// State codes definitions:
localparam ST_RW_SD             = 6'b000000;
localparam WR_CMD_SEND_CMD      = 6'b000001;
localparam WR_CMD_WT_FIN        = 6'b000010;
localparam WR_CMD_DEL           = 6'b000011;
localparam WT_REQ               = 6'b000100;
localparam WR_TOKEN_FF1_FIN     = 6'b000101;
localparam WR_TOKEN_FF1_ST      = 6'b000110;
localparam WR_TOKEN_FF2_FIN     = 6'b000111;
localparam WR_TOKEN_FF2_ST      = 6'b001000;
localparam WR_TOKEN_FE_FIN      = 6'b001001;
localparam WR_TOKEN_FE_ST       = 6'b001010;
localparam WR_DATA_D_FIN        = 6'b001011;
localparam WR_DATA_D_ST         = 6'b001100;
localparam WR_DATA_RD_FIFO1     = 6'b001101;
localparam WR_DATA_RD_FIFO2     = 6'b001110;
localparam WR_DATA_LOOP_INIT    = 6'b001111;
localparam WR_DATA_CS_ST1       = 6'b010000;
localparam WR_DATA_CS_FIN1      = 6'b010001;
localparam WR_DATA_CS_FIN2      = 6'b010010;
localparam WR_DATA_CS_ST2       = 6'b010011;
localparam WR_DATA_CHK_RESP     = 6'b010100;
localparam WR_DATA_REQ_RESP_ST  = 6'b010101;
localparam WR_DATA_REQ_RESP_FIN = 6'b010110;
localparam RD_CMD_SEND_CMD      = 6'b010111;
localparam RD_CMD_WT_FIN        = 6'b011000;
localparam RD_CMD_DEL           = 6'b011001;
localparam RD_TOKEN_CHK_LOOP    = 6'b011010;
localparam RD_TOKEN_WT_FIN      = 6'b011011;
localparam RD_TOKEN_SEND_CMD    = 6'b011100;
localparam RD_TOKEN_DEL2        = 6'b011101;
localparam RD_TOKEN_INIT_LOOP   = 6'b011110;
localparam RD_TOKEN_DEL1        = 6'b011111;
localparam RD_DATA_ST_LOOP      = 6'b100000;
localparam RD_DATA_WT_DATA      = 6'b100001;
localparam RD_DATA_CHK_LOOP     = 6'b100010;
localparam RD_DATA_CLR_RX       = 6'b100011;
localparam RD_DATA_CS_FIN2      = 6'b100100;
localparam RD_DATA_CS_FIN1      = 6'b100101;
localparam RD_DATA_CS_ST1       = 6'b100110;
localparam RD_DATA_CS_ST2       = 6'b100111;
localparam WR_BUSY_CHK_FIN      = 6'b101000;
localparam WR_BUSY_WT_FIN1      = 6'b101001;
localparam WR_BUSY_DEL1         = 6'b101010;
localparam WR_BUSY_SEND_CMD1    = 6'b101011;
localparam WR_BUSY_DEL2         = 6'b101100;
localparam WR_BUSY_INIT_LOOP    = 6'b101101;
localparam RD_TOKEN_DEL3        = 6'b101110;
localparam WR_DATA_DEL          = 6'b101111;

reg [5:0] state, next_state;

// NextState logic (combinatorial)
always @ ( * ) begin
    next_state                    = state;
    // Set default values for outputs and signals
    next_read_write_s_d_block_rdy = read_write_sd_block_rdy;
    next_spi_cs_n                 = spi_cs_n;
    next_read_error               = read_error;
    next_write_error              = write_error;
    next_tx_data_out              = tx_data_out;
    next_tx_data_wen              = tx_data_wen;
    next_rx_data_rdy_clr          = rx_data_rdy_clr;
    next_cmd_byte                 = cmd_byte;
    next_data_byte_1              = data_byte_1;
    next_data_byte_2              = data_byte_2;
    next_data_byte_3              = data_byte_3;
    next_data_byte_4              = data_byte_4;
    next_check_sum_byte           = check_sum_byte;
    next_send_cmd_req             = send_cmd_req;
    next_loop_cnt                 = loop_cnt;
    next_del_cnt_1                = del_cnt_1;
    next_del_cnt_2                = del_cnt_2;
    next_tx_fifo_ren              = tx_fifo_ren;
    next_rx_fifo_wen              = rx_fifo_wen;
    next_rx_fifo_data             = rx_fifo_data;
    next_time_out_cnt             = time_out_cnt;
    next_loc_resp_byte            = loc_resp_byte;
    case (state)  // synopsys parallel_case full_case
        ST_RW_SD: begin
            next_read_write_s_d_block_rdy = 1'b0;
            next_spi_cs_n                 = 1'b1;
            next_read_error               = 1'b0;
            next_write_error              = 1'b0;
            next_tx_data_out              = 8'h00;
            next_tx_data_wen              = 1'b0;
            next_rx_data_rdy_clr          = 1'b0;
            next_cmd_byte                 = 8'h00;
            next_data_byte_1              = 8'h00;
            next_data_byte_2              = 8'h00;
            next_data_byte_3              = 8'h00;
            next_data_byte_4              = 8'h00;
            next_check_sum_byte           = 8'h00;
            next_send_cmd_req             = 1'b0;
            next_loop_cnt                 = 8'h00;
            next_del_cnt_1                = 8'h00;
            next_del_cnt_2                = 8'h00;
            next_read_error               = `READ_NO_ERROR;
            next_write_error              = `WRITE_NO_ERROR;
            next_tx_fifo_ren              = 1'b0;
            next_rx_fifo_wen              = 1'b0;
            next_rx_fifo_data             = 8'h00;
            next_time_out_cnt             = 12'h000;
            next_loc_resp_byte            = 8'h00;
            next_state                    = WT_REQ;
        end
        WT_REQ: begin
            next_spi_cs_n                 = 1'b1;
            next_read_write_s_d_block_rdy = 1'b1;
            next_cmd_byte                 = 8'h00;
            next_data_byte_1              = 8'h00;
            next_data_byte_2              = 8'h00;
            next_data_byte_3              = 8'h00;
            next_data_byte_4              = 8'h00;
            next_check_sum_byte           = 8'h00;
            if (read_write_sd_block_req == `READ_SD_BLOCK) begin
                next_state = RD_CMD_SEND_CMD;
                next_spi_cs_n                 = 1'b0;
                next_read_write_s_d_block_rdy = 1'b0;
                next_read_error               = `READ_NO_ERROR;
            end
            else if (read_write_sd_block_req == `WRITE_SD_BLOCK) begin
                next_state = WR_CMD_SEND_CMD;
                next_spi_cs_n                 = 1'b0;
                next_read_write_s_d_block_rdy = 1'b0;
                next_write_error              = `WRITE_NO_ERROR;
            end
        end
        WR_CMD_SEND_CMD: begin
            next_cmd_byte       = 8'h58;
            //CMD24 Block Write
            next_data_byte_1    = block_addr[31:24];
            next_data_byte_2    = block_addr[23:16];
            next_data_byte_3    = block_addr[15:8];
            next_data_byte_4    = block_addr[7:0];
            next_check_sum_byte = 8'hff;
            next_send_cmd_req   = 1'b1;
            next_state = WR_CMD_DEL;
        end
        WR_CMD_WT_FIN: begin
            if ((send_cmd_rdy == 1'b1) && (resp_tout == 1'b1 || resp_byte != 8'h00)) begin
                next_state = WT_REQ;
                next_write_error = `WRITE_CMD_ERROR;
            end
            else if (send_cmd_rdy == 1'b1) begin
                next_state = WR_TOKEN_FF1_ST;
            end
        end
        WR_CMD_DEL: begin
            next_send_cmd_req = 1'b0;
            next_state = WR_CMD_WT_FIN;
        end
        WR_TOKEN_FF1_FIN: begin
            next_tx_data_wen = 1'b0;
            next_state = WR_TOKEN_FF2_ST;
        end
        WR_TOKEN_FF1_ST: begin
            if (tx_data_full == 1'b0) begin
                next_state = WR_TOKEN_FF1_FIN;
                next_tx_data_out = 8'hff;
                next_tx_data_wen = 1'b1;
            end
        end
        WR_TOKEN_FF2_FIN: begin
            next_tx_data_wen = 1'b0;
            next_state = WR_TOKEN_FE_ST;
        end
        WR_TOKEN_FF2_ST: begin
            if (tx_data_full == 1'b0) begin
                next_state = WR_TOKEN_FF2_FIN;
                next_tx_data_out = 8'hff;
                next_tx_data_wen = 1'b1;
            end
        end
        WR_TOKEN_FE_FIN: begin
            next_tx_data_wen = 1'b0;
            next_state = WR_DATA_LOOP_INIT;
        end
        WR_TOKEN_FE_ST: begin
            if (tx_data_full == 1'b0) begin
                next_state = WR_TOKEN_FE_FIN;
                next_tx_data_out = 8'hfe;
                next_tx_data_wen = 1'b1;
            end
        end
        WR_BUSY_CHK_FIN: begin
            if (loc_resp_byte == 8'h00 && time_out_cnt != `TWO_FIFTY_MS) begin
                next_state = WR_BUSY_SEND_CMD1;
                next_time_out_cnt = time_out_cnt + 1'b1;
            end
            else if (time_out_cnt == `TWO_FIFTY_MS) begin
                next_state = WT_REQ;
                next_write_error = `WRITE_BUSY_ERROR;
            end
            else begin
                next_state = WT_REQ;
            end
        end
        WR_BUSY_WT_FIN1: begin
            if (rx_data_rdy == 1'b1) begin
                next_state = WR_BUSY_CHK_FIN;
                next_loc_resp_byte = rx_data_in;
            end
        end
        WR_BUSY_DEL1: begin
            next_tx_data_wen     = 1'b0;
            next_rx_data_rdy_clr = 1'b0;
            next_del_cnt_1       = del_cnt_1 + 1'b1;
            next_del_cnt_2       = 8'h00;
            if (del_cnt_1 == `MAX_8_BIT) begin
                next_state = WR_BUSY_WT_FIN1;
            end
            else begin
                next_state = WR_BUSY_DEL2;
            end
        end
        WR_BUSY_SEND_CMD1: begin
            next_tx_data_out     = 8'hff;
            next_tx_data_wen     = 1'b1;
            next_rx_data_rdy_clr = 1'b1;
            next_del_cnt_1       = 8'h00;
            next_state = WR_BUSY_DEL1;
        end
        WR_BUSY_DEL2: begin
            next_del_cnt_2 = del_cnt_2 + 1'b1;
            if (del_cnt_2 == 8'hff) begin
                next_state = WR_BUSY_DEL1;
            end
        end
        WR_BUSY_INIT_LOOP: begin
            next_time_out_cnt = 12'h000;
            next_state = WR_BUSY_SEND_CMD1;
        end
        RD_CMD_SEND_CMD: begin
            next_cmd_byte       = 8'h51;
            //CMD17 Block Read
            next_data_byte_1    = block_addr[31:24];
            next_data_byte_2    = block_addr[23:16];
            next_data_byte_3    = block_addr[15:8];
            next_data_byte_4    = block_addr[7:0];
            next_check_sum_byte = 8'hff;
            next_send_cmd_req   = 1'b1;
            next_state = RD_CMD_DEL;
        end
        RD_CMD_WT_FIN: begin
            if ((send_cmd_rdy == 1'b1) && (resp_tout == 1'b1 || resp_byte != 8'h00)) begin
                next_state = WT_REQ;
                next_read_error = `READ_CMD_ERROR;
            end
            else if (send_cmd_rdy == 1'b1) begin
                next_state = RD_TOKEN_INIT_LOOP;
            end
        end
        RD_CMD_DEL: begin
            next_send_cmd_req = 1'b0;
            next_state = RD_CMD_WT_FIN;
        end
        RD_TOKEN_CHK_LOOP: begin
            if (loc_resp_byte != 8'hfe && time_out_cnt != `ONE_HUNDRED_MS) begin
                next_state = RD_TOKEN_DEL2;
                next_time_out_cnt = time_out_cnt + 1'b1;
                next_del_cnt_1    = 8'h00;
            end
            else if (time_out_cnt == `ONE_HUNDRED_MS) begin
                next_state = WT_REQ;
                next_read_error = `READ_TOKEN_ERROR;
            end
            else begin
                next_state = RD_DATA_CLR_RX;
                next_rx_data_rdy_clr = 1'b1;
            end
        end
        RD_TOKEN_WT_FIN: begin
            if (rx_data_rdy == 1'b1) begin
                next_state = RD_TOKEN_CHK_LOOP;
                next_loc_resp_byte = rx_data_in;
            end
        end
        RD_TOKEN_SEND_CMD: begin
            next_tx_data_out     = 8'hff;
            next_tx_data_wen     = 1'b1;
            next_rx_data_rdy_clr = 1'b1;
            next_state = RD_TOKEN_DEL1;
        end
        RD_TOKEN_DEL2: begin
            next_del_cnt_1 = del_cnt_1 + 1'b1;
            next_del_cnt_2 = 8'h00;
            if (del_cnt_1 == `MAX_8_BIT) begin
                next_state = RD_TOKEN_SEND_CMD;
            end
            else begin
                next_state = RD_TOKEN_DEL3;
            end
        end
        RD_TOKEN_INIT_LOOP: begin
            next_time_out_cnt = 12'h000;
            next_state = RD_TOKEN_SEND_CMD;
        end
        RD_TOKEN_DEL1: begin
            next_tx_data_wen     = 1'b0;
            next_rx_data_rdy_clr = 1'b0;
            next_state = RD_TOKEN_WT_FIN;
        end
        RD_TOKEN_DEL3: begin
            next_del_cnt_2 = del_cnt_2 + 1'b1;
            if (del_cnt_2 == 8'hff) begin
                next_state = RD_TOKEN_DEL2;
            end
        end
        RD_DATA_ST_LOOP: begin
            next_tx_data_wen = 1'b1;
            next_tx_data_out = 8'hff;
            next_loop_cnt    = loop_cnt + 1'b1;
            next_state = RD_DATA_WT_DATA;
        end
        RD_DATA_WT_DATA: begin
            next_tx_data_wen = 1'b0;
            if (rx_data_rdy == 1'b1) begin
                next_state = RD_DATA_CHK_LOOP;
                next_rx_fifo_wen     = 1'b1;
                next_rx_data_rdy_clr = 1'b1;
                next_rx_fifo_data    = rx_data_in;
            end
        end
        RD_DATA_CHK_LOOP: begin
            if (loop_cnt == 9'b000000000) begin
                next_state = RD_DATA_CS_ST1;
                next_rx_data_rdy_clr = 1'b0;
                next_rx_fifo_wen     = 1'b0;
            end
            else begin
                next_state = RD_DATA_ST_LOOP;
                next_rx_data_rdy_clr = 1'b0;
                next_rx_fifo_wen     = 1'b0;
            end
        end
        RD_DATA_CLR_RX: begin
            next_state = RD_DATA_ST_LOOP;
            next_rx_data_rdy_clr = 1'b0;
            next_loop_cnt        = 9'b000000000;
        end
        RD_DATA_CS_FIN2: begin
            next_tx_data_wen = 1'b0;
            if (tx_data_empty == 1'b1) begin
                next_state = WT_REQ;
            end
        end
        RD_DATA_CS_FIN1: begin
            next_tx_data_wen = 1'b0;
            next_state = RD_DATA_CS_ST2;
        end
        RD_DATA_CS_ST1: begin
            if (tx_data_full == 1'b0) begin
                next_state = RD_DATA_CS_FIN1;
                next_tx_data_out = 8'hff;
                next_tx_data_wen = 1'b1;
            end
        end
        RD_DATA_CS_ST2: begin
            if (tx_data_full == 1'b0) begin
                next_state = RD_DATA_CS_FIN2;
                next_tx_data_out = 8'hff;
                next_tx_data_wen = 1'b1;
            end
        end
        WR_DATA_D_FIN: begin
            next_tx_data_wen = 1'b0;
            if (loop_cnt == 9'b000000000) begin
                next_state = WR_DATA_CS_ST1;
            end
            else begin
                next_state = WR_DATA_RD_FIFO1;
            end
        end
        WR_DATA_D_ST: begin
            if (tx_data_full == 1'b0) begin
                next_state = WR_DATA_D_FIN;
                next_tx_data_out = tx_fifo_data;
                next_tx_data_wen = 1'b1;
            end
        end
        WR_DATA_RD_FIFO1: begin
            next_tx_fifo_ren = 1'b1;
            next_loop_cnt    = loop_cnt + 1'b1;
            next_state = WR_DATA_RD_FIFO2;
        end
        WR_DATA_RD_FIFO2: begin
            next_tx_fifo_ren = 1'b0;
            next_state = WR_DATA_D_ST;
        end
        WR_DATA_LOOP_INIT: begin
            next_loop_cnt = 9'b000000000;
            next_state = WR_DATA_RD_FIFO1;
        end
        WR_DATA_CS_ST1: begin
            if (tx_data_full == 1'b0) begin
                next_state = WR_DATA_CS_FIN1;
                next_tx_data_out = 8'hff;
                next_tx_data_wen = 1'b1;
            end
        end
        WR_DATA_CS_FIN1: begin
            next_tx_data_wen = 1'b0;
            next_state = WR_DATA_CS_ST2;
        end
        WR_DATA_CS_FIN2: begin
            next_tx_data_wen  = 1'b0;
            next_time_out_cnt = 12'h000;
            if (tx_data_empty == 1'b1) begin
                next_state = WR_DATA_REQ_RESP_ST;
            end
        end
        WR_DATA_CS_ST2: begin
            if (tx_data_full == 1'b0) begin
                next_state = WR_DATA_CS_FIN2;
                next_tx_data_out = 8'hff;
                next_tx_data_wen = 1'b1;
            end
        end
        WR_DATA_CHK_RESP: begin
            if (time_out_cnt == `WR_RESP_TOUT) begin
                next_state = WT_REQ;
                next_write_error = `WRITE_DATA_ERROR;
            end
            else if (loc_resp_byte[4:0] == 5'h5) begin
                next_state = WR_BUSY_INIT_LOOP;
            end
            else begin
                next_state = WR_DATA_REQ_RESP_ST;
            end
        end
        WR_DATA_REQ_RESP_ST: begin
            next_state = WR_DATA_DEL;
            next_tx_data_out     = 8'hff;
            next_tx_data_wen     = 1'b1;
            next_time_out_cnt    = time_out_cnt + 1'b1;
            next_rx_data_rdy_clr = 1'b1;
        end
        WR_DATA_REQ_RESP_FIN: begin
            if (rx_data_rdy == 1'b1) begin
                next_state = WR_DATA_CHK_RESP;
                next_loc_resp_byte = rx_data_in;
            end
        end
        WR_DATA_DEL: begin
            next_state = WR_DATA_REQ_RESP_FIN;
            next_tx_data_wen     = 1'b0;
            next_rx_data_rdy_clr = 1'b0;
        end
    endcase
end

// Current State Logic (sequential)
always @ (posedge clk) begin
    if (rst)
        state <= ST_RW_SD;
    else
        state <= next_state;
end

// Registered outputs logic
always @ (posedge clk) begin
    if (rst == 1'b1) begin
        read_write_sd_block_rdy <= 1'b0;
        spi_cs_n                <= 1'b1;
        read_error              <= 1'b0;
        write_error             <= 1'b0;
        tx_data_out             <= 8'h00;
        tx_data_wen             <= 1'b0;
        rx_data_rdy_clr         <= 1'b0;
        cmd_byte                <= 8'h00;
        data_byte_1             <= 8'h00;
        data_byte_2             <= 8'h00;
        data_byte_3             <= 8'h00;
        data_byte_4             <= 8'h00;
        check_sum_byte          <= 8'h00;
        send_cmd_req            <= 1'b0;
        tx_fifo_ren             <= 1'b0;
        rx_fifo_wen             <= 1'b0;
        rx_fifo_data            <= 8'h00;
        loop_cnt                <= 8'h00;
        del_cnt_1               <= 8'h00;
        del_cnt_2               <= 8'h00;
        time_out_cnt            <= 12'h000;
        loc_resp_byte           <= 8'h00;
    end
    else begin
        read_write_sd_block_rdy <= next_read_write_s_d_block_rdy;
        spi_cs_n                <= next_spi_cs_n;
        read_error              <= next_read_error;
        write_error             <= next_write_error;
        tx_data_out             <= next_tx_data_out;
        tx_data_wen             <= next_tx_data_wen;
        rx_data_rdy_clr         <= next_rx_data_rdy_clr;
        cmd_byte                <= next_cmd_byte;
        data_byte_1             <= next_data_byte_1;
        data_byte_2             <= next_data_byte_2;
        data_byte_3             <= next_data_byte_3;
        data_byte_4             <= next_data_byte_4;
        check_sum_byte          <= next_check_sum_byte;
        send_cmd_req            <= next_send_cmd_req;
        tx_fifo_ren             <= next_tx_fifo_ren;
        rx_fifo_wen             <= next_rx_fifo_wen;
        rx_fifo_data            <= next_rx_fifo_data;
        loop_cnt                <= next_loop_cnt;
        del_cnt_1               <= next_del_cnt_1;
        del_cnt_2               <= next_del_cnt_2;
        time_out_cnt            <= next_time_out_cnt;
        loc_resp_byte           <= next_loc_resp_byte;
    end
end

endmodule
