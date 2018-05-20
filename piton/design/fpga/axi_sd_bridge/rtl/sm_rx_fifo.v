//////////////////////////////////////////////////////////////////////
////                                                              ////
//// sm_rx_fifo.v                                                  ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
////  parameterized RxFifo wrapper. Min depth = 2, Max depth = 65536
////  fifo read access via bus interface, fifo write access is direct
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

module sm_rx_fifo
#(
  //FIFO_DEPTH = 2^ADDR_WIDTH
  parameter FIFO_DEPTH = 64,
  parameter ADDR_WIDTH = 6
)(
    input  wire       bus_clk,
    input  wire       spi_sys_clk,
    input  wire       rst_sync_to_bus_clk,
    input  wire       rst_sync_to_spi_clk,
    input  wire       fifo_w_en,
    input  wire [2:0] bus_address,
    input  wire       bus_write_en,
    input  wire       bus_strobe_i,
    input  wire       bus_fifo_select,
    input  wire [7:0] bus_data_in,
    input  wire [7:0] fifo_data_in,
    output wire       fifo_full,
    output wire [7:0] bus_data_out

);

    //internal wires and regs
    wire [7:0] data_from_fifo_to_bus;
    wire fifo_r_en;
    wire force_empty_sync_to_bus_clk;
    wire force_empty_sync_to_spi_clk;
    wire [15:0] num_elements_in_fifo;
    wire fifo_empty;   //not used

    sm_fifo_rtl #(8, FIFO_DEPTH, ADDR_WIDTH) u_sm_fifo(
        .wr_clk(spi_sys_clk),
        .rd_clk(bus_clk),
        .rst_sync_to_wr_clk(rst_sync_to_spi_clk),
        .rst_sync_to_rd_clk(rst_sync_to_bus_clk),
        .data_in(fifo_data_in),
        .data_out(data_from_fifo_to_bus),
        .fifo_w_en(fifo_w_en),
        .fifo_r_en(fifo_r_en),
        .fifo_full(fifo_full),
        .fifo_empty(fifo_empty),
        .force_empty_sync_to_wr_clk(force_empty_sync_to_spi_clk),
        .force_empty_sync_to_rd_clk(force_empty_sync_to_bus_clk),
        .num_elements_in_fifo(num_elements_in_fifo)
    );

    sm_rx_fifo_bi u_sm_rx_fifo_bi(
        .address(bus_address),
        .write_en(bus_write_en),
        .strobe_i(bus_strobe_i),
        .bus_clk(bus_clk),
        .spi_sys_clk(spi_sys_clk),
        .rst_sync_to_bus_clk(rst_sync_to_bus_clk),
        .fifo_select(bus_fifo_select),
        .fifo_data_in(data_from_fifo_to_bus),
        .bus_data_in(bus_data_in),
        .bus_data_out(bus_data_out),
        .fifo_r_en(fifo_r_en),
        .force_empty_sync_to_bus_clk(force_empty_sync_to_bus_clk),
        .force_empty_sync_to_spi_clk(force_empty_sync_to_spi_clk),
        .num_elements_in_fifo(num_elements_in_fifo)
    );

endmodule
