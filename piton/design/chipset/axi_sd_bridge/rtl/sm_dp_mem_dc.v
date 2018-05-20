//////////////////////////////////////////////////////////////////////
////                                                              ////
//// sm_dp_mem_dc.v                                                ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
//// Synchronous dual port memory with dual clocks
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

module sm_dp_mem_dc
#(
  //FIFO_DEPTH = ADDR_WIDTH^2
  parameter FIFO_WIDTH = 8,
  parameter FIFO_DEPTH = 64,
  parameter ADDR_WIDTH = 6
)(
    input  wire                  wr_clk,
    input  wire                  rd_clk,
    input  wire [FIFO_WIDTH-1:0] data_in,
    input  wire                  write_en,
    input  wire                  read_en,
    input  wire [ADDR_WIDTH-1:0] addr_in,
    input  wire [ADDR_WIDTH-1:0] addr_out,

    output reg  [FIFO_WIDTH-1:0] data_out
);

    reg [FIFO_WIDTH-1:0] buffer [0:FIFO_DEPTH-1];

    // synchronous read. Introduces one clock cycle delay
    always @(posedge rd_clk) begin
        data_out <= buffer[addr_out];
    end

    // synchronous write
    always @(posedge wr_clk) begin
        if (write_en == 1'b1)
            buffer[addr_in] <= data_in;
    end

endmodule
