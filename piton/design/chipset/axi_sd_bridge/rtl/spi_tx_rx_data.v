//////////////////////////////////////////////////////////////////////
////                                                              ////
//// spiTxRxData.v                                                ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
////  Mux access to SPI RX and TX data
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

module spi_tx_rx_data (
    input wire       clk,
    input wire       rst,
    input wire [7:0] tx1_data_in,
    input wire [7:0] tx2_data_in,
    input wire [7:0] tx3_data_in,
    input wire [7:0] tx4_data_in,
    input wire       tx1_data_w_en,
    input wire       tx2_data_w_en,
    input wire       tx3_data_w_en,
    input wire       tx4_data_w_en,
    input wire       tx_data_full_clr,
    input wire       rx1_data_rdy_clr,
    input wire       rx2_data_rdy_clr,
    input wire       rx3_data_rdy_clr,
    input wire       rx4_data_rdy_clr,
    input wire [7:0] rx_data_in,
    input wire       rx_data_rdy_set,

    output reg [7:0] tx_data_out,
    output reg       tx_data_full,
    output reg [7:0] rx_data_out,
    output reg       rx_data_rdy
);



// --- Transmit control
always @(posedge clk) begin
    if (rst == 1'b1) begin
        tx_data_out <= 8'h00;
        tx_data_full <= 1'b0;
    end
    else begin
        if (tx1_data_w_en == 1'b1) begin
            tx_data_out <= tx1_data_in;
            tx_data_full <= 1'b1;
        end
        else if (tx2_data_w_en == 1'b1) begin
            tx_data_out <= tx2_data_in;
            tx_data_full <= 1'b1;
        end
        else if (tx3_data_w_en == 1'b1) begin
            tx_data_out <= tx3_data_in;
            tx_data_full <= 1'b1;
        end
        else if (tx4_data_w_en == 1'b1) begin
            tx_data_out <= tx4_data_in;
            tx_data_full <= 1'b1;
        end
        if (tx_data_full_clr == 1'b1)
            tx_data_full <= 1'b0;
    end
end

// --- Receive control
always @(posedge clk) begin
    if (rst == 1'b1) begin
        rx_data_out <= 8'h00;
        rx_data_rdy <= 1'b0;
    end
    else begin
        if (rx1_data_rdy_clr == 1'b1 || rx2_data_rdy_clr == 1'b1 || rx3_data_rdy_clr == 1'b1 || rx4_data_rdy_clr == 1'b1) begin
            rx_data_rdy <= 1'b0;
        end
        if (rx_data_rdy_set == 1'b1) begin
            rx_data_rdy <= 1'b1;
            rx_data_out <= rx_data_in;
        end
    end
end

endmodule

