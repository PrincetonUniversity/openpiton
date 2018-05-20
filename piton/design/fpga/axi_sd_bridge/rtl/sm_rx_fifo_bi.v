//////////////////////////////////////////////////////////////////////
////                                                              ////
//// sm_rx_fifo_bi.v                                                ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
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

module sm_rx_fifo_bi (
    input  wire [2:0]  address,
    input  wire        write_en,
    input  wire        strobe_i,
    input  wire        bus_clk,
    input  wire        spi_sys_clk,
    input  wire        rst_sync_to_bus_clk,
    input  wire [7:0]  fifo_data_in,
    input  wire [7:0]  bus_data_in,
    input  wire [15:0] num_elements_in_fifo,
    input  wire        fifo_select,

    output reg  [7:0]  bus_data_out,
    output reg         fifo_r_en,
    output wire        force_empty_sync_to_spi_clk,
    output wire        force_empty_sync_to_bus_clk
);

    reg force_empty_reg;
    reg force_empty;
    reg force_empty_toggle;
    reg [2:0] force_empty_toggle_sync_to_spi_clk;

    //sync write
    always @(posedge bus_clk) begin
        if (write_en == 1'b1 && fifo_select == 1'b1 &&
            address == `FIFO_CONTROL_REG && strobe_i == 1'b1 && bus_data_in[0] == 1'b1)
            force_empty <= 1'b1;
        else
            force_empty <= 1'b0;
    end

    //detect rising edge of 'force_empty', and generate toggle signal
    always @(posedge bus_clk) begin
        if (rst_sync_to_bus_clk == 1'b1) begin
            force_empty_reg    <= 1'b0;
            force_empty_toggle <= 1'b0;
        end
        else begin
            if (force_empty == 1'b1)
                force_empty_reg <= 1'b1;
            else
                force_empty_reg <= 1'b0;
            if (force_empty == 1'b1 && force_empty_reg == 1'b0)
                force_empty_toggle <= ~force_empty_toggle;
        end
    end
    assign force_empty_sync_to_bus_clk = (force_empty == 1'b1 && force_empty_reg == 1'b0) ? 1'b1 : 1'b0;


    // double sync across clock domains to generate 'force_empty_sync_to_spi_clk'
    always @(posedge spi_sys_clk) begin
            force_empty_toggle_sync_to_spi_clk <= {force_empty_toggle_sync_to_spi_clk[1:0], force_empty_toggle};
    end
    assign force_empty_sync_to_spi_clk = force_empty_toggle_sync_to_spi_clk[2] ^ force_empty_toggle_sync_to_spi_clk[1];

    // async read mux
    always @( * ) begin
        case (address)
                `FIFO_DATA_REG :       bus_data_out = fifo_data_in;
                `FIFO_DATA_COUNT_MSB : bus_data_out = num_elements_in_fifo[15:8];
                `FIFO_DATA_COUNT_LSB : bus_data_out = num_elements_in_fifo[7:0];
                default:               bus_data_out = 8'h00;
        endcase
    end

    //generate fifo read strobe
    always @( * ) begin
        if (address == `FIFO_DATA_REG &&   write_en == 1'b0 &&
        strobe_i == 1'b1 &&   fifo_select == 1'b1)
            fifo_r_en = 1'b1;
        else
            fifo_r_en = 1'b0;
    end

endmodule
