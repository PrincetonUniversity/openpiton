//////////////////////////////////////////////////////////////////////
////                                                              ////
//// spiMasterWishBoneBI.v                                        ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
////  Control WB access to fifos and control and status registers
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


module spi_master_wishbone_decoder (
    // Wishbone input signals
    input  wire       clk_i,
    input  wire       rst_i,
    input  wire [7:0] adr_i,
    input  wire [7:0] dat_i,
    input  wire       we_i,
    input  wire       stb_i,

    // Wishbone output signals
    output reg  [7:0] dat_o,
    output reg        ack_o,

    // SPI register data
    input  wire [7:0] ctrl_status_data,
    input  wire [7:0] rx_fifo_data,
    input  wire [7:0] tx_fifo_data,

    // SPI register control
    output reg        ctrl_status_sel,
    output reg        rx_fifo_sel,
    output reg        tx_fifo_sel
);

    // ACK wires
    reg ack_delayed;
    reg ack_immediate;

    // Multiplex incoming/outgoing data to/from either control register space,
    // RX space, or TX space.
    always @( * ) begin
        ctrl_status_sel = 1'b0;
        rx_fifo_sel = 1'b0;
        tx_fifo_sel = 1'b0;

        case (adr_i & `ADDRESS_DECODE_MASK)
            `CTRL_STS_REG_BASE : begin
                ctrl_status_sel = 1'b1;
                dat_o = ctrl_status_data;
            end
            `RX_FIFO_BASE : begin
                rx_fifo_sel = 1'b1;
                dat_o = rx_fifo_data;
            end
            `TX_FIFO_BASE : begin
                tx_fifo_sel = 1'b1;
                dat_o = tx_fifo_data;
            end
            default: begin
                dat_o = 8'h00;
            end
        endcase
    end

    // Delayed ack
    always @(posedge clk_i) begin
        ack_delayed <= stb_i;
    end

    // Immediate ack
    always @( * ) begin
        ack_immediate = stb_i;
    end

    // Select between immediate and delayed ack:
    //   - ACK immediately if writing or reading from normal registers
    //   - ACK synchronously if reading from FIFO data registers
    always @( * ) begin
        if (we_i == 1'b0 &&
            (adr_i == `RX_FIFO_BASE + `FIFO_DATA_REG ||
             adr_i == `TX_FIFO_BASE + `FIFO_DATA_REG)) begin
            ack_o = ack_delayed & ack_immediate;
        end
        else begin
            ack_o = ack_immediate;
        end
    end

endmodule
