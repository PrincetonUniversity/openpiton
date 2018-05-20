
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// initSD.v                                                 ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
//// When sd_init_req asserted, initialise SD card
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

module init_sd(
    input  wire       clk,
    input  wire       rst,

    input  wire       sd_init_req,
    input  wire       send_cmd_rdy,

    input  wire [7:0] resp_byte,
    input  wire       resp_tout,
    input  wire       rx_data_rdy,
    input  wire       tx_data_empty,
    input  wire       tx_data_full,
    input  wire [7:0] spi_clk_delay_in,


    output reg  [7:0] check_sum_byte,
    output reg  [7:0] cmd_byte,
    output reg  [7:0] data_byte_1,
    output reg  [7:0] data_byte_2,
    output reg  [7:0] data_byte_3,
    output reg  [7:0] data_byte_4,
    output reg        send_cmd_req,
    output reg  [1:0] sd_init_error,
    output reg        sd_init_rdy,
    output reg  [7:0] spi_clk_delay_out,
    output reg        spi_cs_n,
    output reg        rx_data_rdy_clr,
    output reg  [7:0] tx_data_out,
    output reg        tx_data_wen
);

    reg [7:0] next_check_sum_byte;
    reg [7:0] next_cmd_byte;
    reg [7:0] next_data_byte_1;
    reg [7:0] next_data_byte_2;
    reg [7:0] next_data_byte_3;
    reg [7:0] next_data_byte_4;
    reg [1:0] next_sd_init_error;
    reg       next_rx_data_rdy_clr;
    reg       next_sd_init_rdy;
    reg       next_send_cmd_req;
    reg [7:0] next_spi_clk_delay_out;
    reg       next_spi_cs_n;
    reg [7:0] next_tx_data_out;
    reg       next_tx_data_wen;

    // diagram signals declarations
    reg [9:0] del_cnt_1, next_del_cnt_1;
    reg [7:0] del_cnt_2, next_del_cnt_2;
    reg [7:0] loop_cnt, next_loop_cnt;

    // BINARY ENCODED state machine: initSDSt
    // State codes definitions:
    localparam START                 = 4'b0000;
    localparam WT_INIT_REQ           = 4'b0001;
    localparam CLK_SEQ_SEND_FF       = 4'b0010;
    localparam CLK_SEQ_CHK_FIN       = 4'b0011;
    localparam RESET_SEND_CMD        = 4'b0100;
    localparam RESET_DEL             = 4'b0101;
    localparam RESET_WT_FIN          = 4'b0110;
    localparam RESET_CHK_FIN         = 4'b0111;
    localparam INIT_WT_FIN           = 4'b1000;
    localparam INIT_CHK_FIN          = 4'b1001;
    localparam INIT_SEND_CMD         = 4'b1010;
    localparam INIT_DEL1             = 4'b1011;
    localparam INIT_DEL2             = 4'b1100;
    localparam CLK_SEQ_WT_DATA_EMPTY = 4'b1101;

    reg [3:0] state, next_state;

  // NextState logic (combinatorial)
  always @ ( * ) begin
      next_state = state;
      // Set default values for outputs and signals
      next_spi_clk_delay_out = spi_clk_delay_out;
      next_sd_init_rdy       = sd_init_rdy;
      next_spi_cs_n          = spi_cs_n;
      next_sd_init_error     = sd_init_error;
      next_tx_data_out       = tx_data_out;
      next_tx_data_wen       = tx_data_wen;
      next_cmd_byte          = cmd_byte;
      next_data_byte_1       = data_byte_1;
      next_data_byte_2       = data_byte_2;
      next_data_byte_3       = data_byte_3;
      next_data_byte_4       = data_byte_4;
      next_check_sum_byte    = check_sum_byte;
      next_send_cmd_req      = send_cmd_req;
      next_loop_cnt          = loop_cnt;
      next_del_cnt_1         = del_cnt_1;
      next_del_cnt_2         = del_cnt_2;
      next_rx_data_rdy_clr   = rx_data_rdy_clr;

      case (state)  // synopsys parallel_case full_case
          START: begin
              next_spi_clk_delay_out = spi_clk_delay_in;
              next_sd_init_rdy       = 1'b0;
              next_spi_cs_n          = 1'b1;
              next_sd_init_error     = `INIT_NO_ERROR;
              next_tx_data_out       = 8'h00;
              next_tx_data_wen       = 1'b0;
              next_cmd_byte          = 8'h00;
              next_data_byte_1       = 8'h00;
              next_data_byte_2       = 8'h00;
              next_data_byte_3       = 8'h00;
              next_data_byte_4       = 8'h00;
              next_check_sum_byte    = 8'h00;
              next_send_cmd_req      = 1'b0;
              next_loop_cnt          = 8'h00;
              next_del_cnt_1         = 10'h000;
              next_del_cnt_2         = 8'h00;
              next_rx_data_rdy_clr   = 1'b0;
              next_state             = WT_INIT_REQ;
          end
          WT_INIT_REQ: begin
              next_sd_init_rdy       = 1'b1;
              next_spi_clk_delay_out = spi_clk_delay_in;
              next_cmd_byte          = 8'h00;
              next_data_byte_1       = 8'h00;
              next_data_byte_2       = 8'h00;
              next_data_byte_3       = 8'h00;
              next_data_byte_4       = 8'h00;
              next_check_sum_byte    = 8'h00;
              if (sd_init_req == 1'b1) begin
                  next_state             = CLK_SEQ_SEND_FF;
                  next_sd_init_rdy       = 1'b0;
                  next_loop_cnt          = 8'h00;
                  next_spi_clk_delay_out = `SLOW_SPI_CLK;
                  next_sd_init_error     = `INIT_NO_ERROR;
              end
          end
          CLK_SEQ_SEND_FF: begin
              if (tx_data_full == 1'b0) begin
                  next_state       = CLK_SEQ_CHK_FIN;
                  next_tx_data_out = 8'hff;
                  next_tx_data_wen = 1'b1;
                  next_loop_cnt    = loop_cnt + 1'b1;
              end
          end
          CLK_SEQ_CHK_FIN: begin
              next_tx_data_wen = 1'b0;
              if (loop_cnt == `SD_INIT_START_SEQ_LEN) begin
                  next_state = CLK_SEQ_WT_DATA_EMPTY;
              end
              else begin
                  next_state = CLK_SEQ_SEND_FF;
              end
          end
          CLK_SEQ_WT_DATA_EMPTY:
          begin
              if (tx_data_empty == 1'b1) begin
                  next_state    = RESET_SEND_CMD;
                  next_loop_cnt = 8'h00;
              end
          end
          RESET_SEND_CMD: begin
              next_cmd_byte       = 8'h40;
              //CMD0
              next_data_byte_1    = 8'h00;
              next_data_byte_2    = 8'h00;
              next_data_byte_3    = 8'h00;
              next_data_byte_4    = 8'h00;
              next_check_sum_byte = 8'h95;
              next_send_cmd_req   = 1'b1;
              next_loop_cnt       = loop_cnt + 1'b1;
              next_spi_cs_n       = 1'b0;
              next_state          = RESET_DEL;
          end
          RESET_DEL: begin
              next_send_cmd_req = 1'b0;
              next_state        = RESET_WT_FIN;
          end
          RESET_WT_FIN: begin
              if (send_cmd_rdy == 1'b1) begin
                  next_state    = RESET_CHK_FIN;
                  next_spi_cs_n = 1'b1;
              end
          end
          RESET_CHK_FIN: begin
              if ((resp_tout == 1'b1 || resp_byte != 8'h01) && loop_cnt != 8'hff)begin
                  next_state = RESET_SEND_CMD;
              end
              else if (resp_tout == 1'b1 || resp_byte != 8'h01) begin
                  next_state         = WT_INIT_REQ;
                  next_sd_init_error = `INIT_CMD0_ERROR;
              end
              else begin
                  next_state = INIT_SEND_CMD;
              end
          end
          INIT_WT_FIN: begin
              if (send_cmd_rdy == 1'b1) begin
                  next_state    = INIT_CHK_FIN;
                  next_spi_cs_n = 1'b1;
              end
          end
          INIT_CHK_FIN: begin
              if ((resp_tout == 1'b1 || resp_byte != 8'h00) && loop_cnt != 8'hff) begin
                  next_state = INIT_SEND_CMD;
              end
              else if (resp_tout == 1'b1 || resp_byte != 8'h00) begin
                  next_state         = WT_INIT_REQ;
                  next_sd_init_error = `INIT_CMD1_ERROR;
              end
              else begin
                  next_state = WT_INIT_REQ;
              end
          end
          INIT_SEND_CMD: begin
              next_cmd_byte       = 8'h41;
              //CMD1
              next_data_byte_1    = 8'h00;
              next_data_byte_2    = 8'h00;
              next_data_byte_3    = 8'h00;
              next_data_byte_4    = 8'h00;
              next_check_sum_byte = 8'hff;
              next_send_cmd_req   = 1'b1;
              next_loop_cnt       = loop_cnt + 1'b1;
              next_spi_cs_n       = 1'b0;
              next_del_cnt_1      = 10'h000;
              next_state          = INIT_DEL1;
          end
          INIT_DEL1: begin
              next_del_cnt_1    = del_cnt_1 + 1'b1;
              next_del_cnt_2    = 8'h00;
              next_send_cmd_req = 1'b0;
              if (del_cnt_1 == `TWO_MS) begin
                  next_state = INIT_WT_FIN;
              end
              else begin
                  next_state = INIT_DEL2;
              end
          end
          INIT_DEL2: begin
              next_del_cnt_2 = del_cnt_2 + 1'b1;
              if (del_cnt_2 == 8'hff) begin
                  next_state = INIT_DEL1;
              end
          end
      endcase
  end

  // Current State Logic (sequential)
  always @ (posedge clk) begin
      if (rst)
          state <= START;
      else
          state <= next_state;
  end

  // Registered outputs logic
  always @ (posedge clk) begin
      if (rst) begin
          spi_clk_delay_out <= spi_clk_delay_in;
          sd_init_rdy       <= 1'b0;
          spi_cs_n          <= 1'b1;
          sd_init_error     <= `INIT_NO_ERROR;
          tx_data_out       <= 8'h00;
          tx_data_wen       <= 1'b0;
          cmd_byte          <= 8'h00;
          data_byte_1       <= 8'h00;
          data_byte_2       <= 8'h00;
          data_byte_3       <= 8'h00;
          data_byte_4       <= 8'h00;
          check_sum_byte    <= 8'h00;
          send_cmd_req      <= 1'b0;
          rx_data_rdy_clr   <= 1'b0;
          loop_cnt          <= 8'h00;
          del_cnt_1         <= 10'h000;
          del_cnt_2         <= 8'h00;
      end
      else
      begin
          spi_clk_delay_out <= next_spi_clk_delay_out;
          sd_init_rdy       <= next_sd_init_rdy;
          spi_cs_n          <= next_spi_cs_n;
          sd_init_error     <= next_sd_init_error;
          tx_data_out       <= next_tx_data_out;
          tx_data_wen       <= next_tx_data_wen;
          cmd_byte          <= next_cmd_byte;
          data_byte_1       <= next_data_byte_1;
          data_byte_2       <= next_data_byte_2;
          data_byte_3       <= next_data_byte_3;
          data_byte_4       <= next_data_byte_4;
          check_sum_byte    <= next_check_sum_byte;
          send_cmd_req      <= next_send_cmd_req;
          rx_data_rdy_clr   <= next_rx_data_rdy_clr;
          loop_cnt          <= next_loop_cnt;
          del_cnt_1         <= next_del_cnt_1;
          del_cnt_2         <= next_del_cnt_2;
      end
  end

endmodule
