
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// sendCmd.v                                           ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
////  If send_cmd_req asserted, then send command to
////  SD card. Command consists of command byte,
////  4 data bytes, and a checksum byte.
//// Waits for response byte from SD card
////  or times out if no response
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

module send_cmd(
    input  wire [7:0] check_sum_byte_1,
    input  wire [7:0] check_sum_byte_2,
    input  wire       clk,
    input  wire [7:0] cmd_byte_1,
    input  wire [7:0] cmd_byte_2,
    input  wire [7:0] data_byte_1_1,
    input  wire [7:0] data_byte_1_2,
    input  wire [7:0] data_byte_2_1,
    input  wire [7:0] data_byte_2_2,
    input  wire [7:0] data_byte_3_1,
    input  wire [7:0] data_byte_3_2,
    input  wire [7:0] data_byte_4_1,
    input  wire [7:0] data_byte_4_2,
    input  wire       rst,
    input  wire [7:0] rx_data_in,
    input  wire       rx_data_rdy,
    input  wire       send_cmd_req_1,
    input  wire       send_cmd_req_2,
    input  wire       tx_data_empty,
    input  wire       tx_data_full,

    output reg  [7:0] resp_byte,
    output reg        resp_tout,
    output reg        rx_data_rdy_clr,
    output reg        send_cmd_rdy,
    output reg  [7:0] tx_data_out,
    output reg        tx_data_wen
);

    reg [7:0] next_resp_byte;
    reg       next_resp_tout;
    reg       next_rx_data_rdy_clr;
    reg       next_send_cmd_rdy;

    reg [7:0] next_tx_data_out;
    reg       next_tx_data_wen;

    // diagram signals declarations
    reg  [7:0] check_sum_byte, next_check_sum_byte;
    reg  [7:0] cmd_byte, next_cmd_byte;
    reg  [7:0] data_byte_1, next_data_byte_1;
    reg  [7:0] data_byte_2, next_data_byte_2;
    reg  [7:0] data_byte_3, next_data_byte_3;
    reg  [7:0] data_byte_4, next_data_byte_4;
    reg        send_cmd_req, next_send_cmd_req;
    reg  [9:0] time_out_cnt, next_time_out_cnt;

    // BINARY ENCODED state machine: sndCmdSt
    // State codes definitions:
    localparam CMD_D_BYTE2_FIN  = 5'b00000;
    localparam CMD_D_BYTE2_ST   = 5'b00001;
    localparam CMD_SEND_FF_FIN  = 5'b00010;
    localparam CMD_CMD_BYTE_FIN = 5'b00011;
    localparam CMD_D_BYTE1_FIN  = 5'b00100;
    localparam CMD_REQ_RESP_ST  = 5'b00101;
    localparam CMD_REQ_RESP_FIN = 5'b00110;
    localparam CMD_CHK_RESP     = 5'b00111;
    localparam CMD_D_BYTE1_ST   = 5'b01000;
    localparam CMD_D_BYTE3_FIN  = 5'b01001;
    localparam CMD_D_BYTE3_ST   = 5'b01010;
    localparam CMD_D_BYTE4_FIN  = 5'b01011;
    localparam CMD_D_BYTE4_ST   = 5'b01100;
    localparam CMD_CS_FIN       = 5'b01101;
    localparam CMD_CS_ST        = 5'b01110;
    localparam CMD_SEND_FF_ST   = 5'b01111;
    localparam CMD_CMD_BYTE_ST  = 5'b10000;
    localparam WT_CMD           = 5'b10001;
    localparam ST_S_CMD         = 5'b10010;
    localparam CMD_DEL          = 5'b10011;

    reg [4:0] state, next_state;

    // Diagram actions (continuous assignments allowed only: assign ...)
    // diagram ACTION
    always @( * ) begin
        send_cmd_req = send_cmd_req_1 | send_cmd_req_2;
    end
    always @(posedge clk) begin
        cmd_byte       <= cmd_byte_1       | cmd_byte_2;
        data_byte_1    <= data_byte_1_1    | data_byte_1_2;
        data_byte_2    <= data_byte_2_1    | data_byte_2_2;
        data_byte_3    <= data_byte_3_1    | data_byte_3_2;
        data_byte_4    <= data_byte_4_1    | data_byte_4_2;
        check_sum_byte <= check_sum_byte_1 | check_sum_byte_2;
    end


    // Machine: sndCmdSt

    // NextState logic (combinatorial)
    always @( * ) begin
        next_state           = state;
        // Set default values for outputs and signals
        next_tx_data_wen     = tx_data_wen;
        next_tx_data_out     = tx_data_out;
        next_time_out_cnt    = time_out_cnt;
        next_rx_data_rdy_clr = rx_data_rdy_clr;
        next_resp_byte       = resp_byte;
        next_resp_tout       = resp_tout;
        next_send_cmd_rdy    = send_cmd_rdy;
        case (state)  // synopsys parallel_case full_case
            WT_CMD: begin
                next_send_cmd_rdy = 1'b1;
                if (send_cmd_req == 1'b1) begin
                    next_state        = CMD_SEND_FF_ST;
                    next_send_cmd_rdy = 1'b0;
                    next_resp_tout    = 1'b0;
                end
            end
            ST_S_CMD: begin
                next_send_cmd_rdy    = 1'b0;
                next_tx_data_wen     = 1'b0;
                next_tx_data_out     = 8'h00;
                next_rx_data_rdy_clr = 1'b0;
                next_resp_byte       = 8'h00;
                next_resp_tout       = 1'b0;
                next_time_out_cnt    = 10'h000;
                next_state           = WT_CMD;
            end
            CMD_D_BYTE2_FIN: begin
                next_tx_data_wen = 1'b0;
                next_state       = CMD_D_BYTE3_ST;
            end
            CMD_D_BYTE2_ST: begin
                if (tx_data_full == 1'b0) begin
                    next_state       = CMD_D_BYTE2_FIN;
                    next_tx_data_out = data_byte_2;
                    next_tx_data_wen = 1'b1;
                end
            end
            CMD_SEND_FF_FIN: begin
                next_state = CMD_CMD_BYTE_ST;
            end
            CMD_CMD_BYTE_FIN: begin
                next_tx_data_wen = 1'b0;
                next_state       = CMD_D_BYTE1_ST;
            end
            CMD_D_BYTE1_FIN: begin
                next_tx_data_wen = 1'b0;
                next_state       = CMD_D_BYTE2_ST;
            end
            CMD_REQ_RESP_ST: begin
                next_state           = CMD_DEL;
                next_tx_data_out     = 8'hff;
                next_tx_data_wen     = 1'b1;
                next_time_out_cnt    = time_out_cnt + 1'b1;
                next_rx_data_rdy_clr = 1'b1;
            end
            CMD_REQ_RESP_FIN: begin
                if (rx_data_rdy == 1'b1) begin
                    next_state     = CMD_CHK_RESP;
                    next_resp_byte = rx_data_in;
                end
            end
            CMD_CHK_RESP: begin
                if (time_out_cnt == 10'h200) begin
                    next_state     = WT_CMD;
                    next_resp_tout = 1'b1;
                end
                else if (resp_byte[7] == 1'b0) begin
                    next_state = WT_CMD;
                end
                else begin
                    next_state = CMD_REQ_RESP_ST;
                end
            end
            CMD_D_BYTE1_ST: begin
                if (tx_data_full == 1'b0) begin
                    next_state       = CMD_D_BYTE1_FIN;
                    next_tx_data_out = data_byte_1;
                    next_tx_data_wen = 1'b1;
                end
            end
            CMD_D_BYTE3_FIN: begin
                next_tx_data_wen = 1'b0;
                next_state       = CMD_D_BYTE4_ST;
            end
            CMD_D_BYTE3_ST: begin
                if (tx_data_full == 1'b0) begin
                    next_state       = CMD_D_BYTE3_FIN;
                    next_tx_data_out = data_byte_3;
                    next_tx_data_wen = 1'b1;
                end
            end
            CMD_D_BYTE4_FIN: begin
                next_tx_data_wen = 1'b0;
                next_state       = CMD_CS_ST;
            end
            CMD_D_BYTE4_ST: begin
                if (tx_data_full == 1'b0) begin
                    next_state       = CMD_D_BYTE4_FIN;
                    next_tx_data_out = data_byte_4;
                    next_tx_data_wen = 1'b1;
                end
            end
            CMD_CS_FIN: begin
                next_tx_data_wen  = 1'b0;
                next_time_out_cnt = 10'h000;
                if (tx_data_empty == 1'b1) begin
                    next_state = CMD_REQ_RESP_ST;
                end
            end
            CMD_CS_ST: begin
                if (tx_data_full == 1'b0) begin
                    next_state       = CMD_CS_FIN;
                    next_tx_data_out = check_sum_byte;
                    next_tx_data_wen = 1'b1;
                end
            end
            CMD_SEND_FF_ST: begin
                if (tx_data_full == 1'b0) begin
                    next_state       = CMD_SEND_FF_FIN;
                    next_tx_data_out = 8'hff;
                    next_tx_data_wen = 1'b1;
                end
            end
            CMD_CMD_BYTE_ST: begin
                next_tx_data_wen = 1'b0;
                if (tx_data_full == 1'b0) begin
                    next_state       = CMD_CMD_BYTE_FIN;
                    next_tx_data_out = cmd_byte;
                    next_tx_data_wen = 1'b1;
                end
            end
            CMD_DEL: begin
                next_state           = CMD_REQ_RESP_FIN;
                next_tx_data_wen     = 1'b0;
                next_rx_data_rdy_clr = 1'b0;
            end
        endcase
    end

    // Current State Logic (sequential)
    always @ (posedge clk) begin
        if (rst == 1'b1)
            state <= ST_S_CMD;
        else
            state <= next_state;
    end

    // Registered outputs logic
    always @ (posedge clk) begin
        if (rst == 1'b1) begin
            tx_data_wen     <= 1'b0;
            tx_data_out     <= 8'h00;
            rx_data_rdy_clr <= 1'b0;
            resp_byte       <= 8'h00;
            resp_tout       <= 1'b0;
            send_cmd_rdy    <= 1'b0;
            time_out_cnt    <= 10'h000;
        end
        else begin
            tx_data_wen     <= next_tx_data_wen;
            tx_data_out     <= next_tx_data_out;
            rx_data_rdy_clr <= next_rx_data_rdy_clr;
            resp_byte       <= next_resp_byte;
            resp_tout       <= next_resp_tout;
            send_cmd_rdy    <= next_send_cmd_rdy;
            time_out_cnt    <= next_time_out_cnt;
        end
    end

endmodule
