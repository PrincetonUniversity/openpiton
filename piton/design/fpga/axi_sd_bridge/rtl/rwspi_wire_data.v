
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// readWriteSPIWireData.v                      ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
//// Wait for TX data bytes. When data is ready generate
////  SPI TX data, SPI CLK, and read SPI RX data
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

module rwspi_wire_data(
    input  wire       clk,
    input  wire [7:0] clk_delay,
    input  wire       rst,
    input  wire       spi_data_in,
    input  wire       tx_data_full,
    input  wire [7:0] tx_data_in,

    output reg  [7:0] rx_data_out,
    output reg        rx_data_rdy_set,
    output reg        spi_clk_out,
    output reg        spi_data_out,
    output reg        tx_data_empty,
    output reg        tx_data_full_clr
);

    reg [7:0] next_rx_data_out;
    reg       next_rx_data_rdy_set;
    reg       next_spi_clk_out;
    reg       next_spi_data_out;
    reg       next_tx_data_empty;
    reg       next_tx_data_full_clr;

    // diagram signals declarations
    reg [3:0] bit_cnt, next_bit_cnt;
    reg [7:0] clk_delay_cnt, next_clk_delay_cnt;
    reg [7:0] rx_data_shift_reg, next_rx_data_shift_reg;
    reg [7:0] tx_data_shift_reg, next_tx_data_shift_reg;

    // BINARY ENCODED state machine: rwSPISt
    // State codes definitions:
    localparam WT_TX_DATA = 2'b00;
    localparam CLK_HI     = 2'b01;
    localparam CLK_LO     = 2'b10;
    localparam ST_RW_WIRE = 2'b11;

    reg [1:0] state, next_state;

    // Diagram actions (continuous assignments allowed only: assign ...)
    // diagram ACTION


    // Machine: rwSPISt

    // NextState logic (combinatorial)
    always @ ( * ) begin
        next_state             = state;
        // Set default values for outputs and signals
        next_rx_data_rdy_set   = rx_data_rdy_set;
        next_tx_data_empty     = tx_data_empty;
        next_tx_data_shift_reg = tx_data_shift_reg;
        next_rx_data_shift_reg = rx_data_shift_reg;
        next_bit_cnt           = bit_cnt;
        next_clk_delay_cnt     = clk_delay_cnt;
        next_tx_data_full_clr  = tx_data_full_clr;
        next_spi_clk_out       = spi_clk_out;
        next_spi_data_out      = spi_data_out;
        next_rx_data_out       = rx_data_out;
        case (state)  // synopsys parallel_case full_case
            WT_TX_DATA: begin
                next_rx_data_rdy_set = 1'b0;
                next_tx_data_empty   = 1'b1;
                if (tx_data_full == 1'b1) begin
                    next_state             = CLK_HI;
                    next_tx_data_shift_reg = tx_data_in;
                    next_rx_data_shift_reg = 8'h00;
                    next_bit_cnt           = 4'h0;
                    next_clk_delay_cnt     = 8'h00;
                    next_tx_data_full_clr  = 1'b1;
                    next_tx_data_empty     = 1'b0;
                end
            end
            CLK_HI: begin
                next_clk_delay_cnt    = clk_delay_cnt + 1'b1;
                next_tx_data_full_clr = 1'b0;
                next_rx_data_rdy_set  = 1'b0;
                if (clk_delay_cnt == clk_delay) begin
                    next_state             = CLK_LO;
                    next_spi_clk_out       = 1'b0;
                    next_spi_data_out      = tx_data_shift_reg[7];
                    next_tx_data_shift_reg = {tx_data_shift_reg[6:0], 1'b0};
                    next_rx_data_shift_reg = {rx_data_shift_reg[6:0], spi_data_in};
                    next_clk_delay_cnt     = 8'h00;
                end
            end
            CLK_LO: begin
                next_clk_delay_cnt = clk_delay_cnt + 1'b1;
                if ((bit_cnt == 4'h8) && (tx_data_full == 1'b1)) begin
                    next_state             = CLK_HI;
                    next_rx_data_rdy_set   = 1'b1;
                    next_rx_data_out       = rx_data_shift_reg;
                    next_tx_data_shift_reg = tx_data_in;
                    next_bit_cnt           = 3'b000;
                    next_clk_delay_cnt     = 8'h00;
                    next_tx_data_full_clr  = 1'b1;
                end
                else if (bit_cnt == 4'h8) begin
                    next_state           = WT_TX_DATA;
                    next_rx_data_rdy_set = 1'b1;
                    next_rx_data_out     = rx_data_shift_reg;
                end
                else if (clk_delay_cnt == clk_delay) begin
                    next_state         = CLK_HI;
                    next_spi_clk_out   = 1'b1;
                    next_bit_cnt       = bit_cnt + 1'b1;
                    next_clk_delay_cnt = 8'h00;
                end
            end
            ST_RW_WIRE: begin
                next_bit_cnt           = 4'h0;
                next_clk_delay_cnt     = 8'h00;
                next_tx_data_full_clr  = 1'b0;
                next_rx_data_rdy_set   = 1'b0;
                next_tx_data_shift_reg = 8'h00;
                next_rx_data_shift_reg = 8'h00;
                next_rx_data_out       = 8'h00;
                next_spi_data_out      = 1'b0;
                next_spi_clk_out       = 1'b0;
                next_tx_data_empty     = 1'b0;
                next_state             = WT_TX_DATA;
            end
        endcase
    end

    // Current State Logic (sequential)
    always @ (posedge clk) begin
        if (rst == 1'b1)
            state <= ST_RW_WIRE;
        else
            state <= next_state;
    end

    // Registered outputs logic
    always @ (posedge clk) begin
        if (rst == 1'b1) begin
            rx_data_rdy_set   <= 1'b0;
            tx_data_empty     <= 1'b0;
            tx_data_full_clr  <= 1'b0;
            spi_clk_out       <= 1'b0;
            spi_data_out      <= 1'b0;
            rx_data_out       <= 8'h00;
            tx_data_shift_reg <= 8'h00;
            rx_data_shift_reg <= 8'h00;
            bit_cnt           <= 4'h0;
            clk_delay_cnt     <= 8'h00;
        end
        else begin
            rx_data_rdy_set   <= next_rx_data_rdy_set;
            tx_data_empty     <= next_tx_data_empty;
            tx_data_full_clr  <= next_tx_data_full_clr;
            spi_clk_out       <= next_spi_clk_out;
            spi_data_out      <= next_spi_data_out;
            rx_data_out       <= next_rx_data_out;
            tx_data_shift_reg <= next_tx_data_shift_reg;
            rx_data_shift_reg <= next_rx_data_shift_reg;
            bit_cnt           <= next_bit_cnt;
            clk_delay_cnt     <= next_clk_delay_cnt;
        end
    end

endmodule
