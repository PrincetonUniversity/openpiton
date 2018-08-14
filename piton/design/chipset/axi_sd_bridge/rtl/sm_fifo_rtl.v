//////////////////////////////////////////////////////////////////////
////                                                              ////
//// sm_fifo_rtl.v                                                 ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
////  parameterized dual clock domain fifo.
////  fifo depth is restricted to 2^ADDR_WIDTH
////  No protection against over runs and under runs.
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
//  Patches by    : John Li

module sm_fifo_rtl
#(
    parameter FIFO_WIDTH = 8,
    parameter FIFO_DEPTH = 64,
    parameter ADDR_WIDTH = 6
)(
    // Two clock domains within this module
    // These ports are within 'wr_clk' domain
    input  wire                  wr_clk,
    input  wire                  rst_sync_to_wr_clk,
    input  wire [FIFO_WIDTH-1:0] data_in,
    input  wire                  fifo_w_en,
    input  wire                  force_empty_sync_to_wr_clk,
    output reg                   fifo_full,

    // These ports are within 'rd_clk' domaim
    input  wire                  rd_clk,
    input  wire                  rst_sync_to_rd_clk,
    output reg  [FIFO_WIDTH-1:0] data_out,
    input                        fifo_r_en,
    input                        force_empty_sync_to_rd_clk,
    output reg                   fifo_empty,
    output reg  [15:0]           num_elements_in_fifo //note that this implies a max fifo depth of 65536
);

    // local registers
    reg  [ADDR_WIDTH:0]   buffer_in_index;
    reg  [ADDR_WIDTH:0]   buffer_in_index_sync_to_rd_clk;
    reg  [ADDR_WIDTH:0]   buffer_out_index;
    reg  [ADDR_WIDTH:0]   buffer_out_index_sync_to_wr_clk;
    reg  [ADDR_WIDTH-1:0] buffer_in_index_to_mem;
    reg  [ADDR_WIDTH-1:0] buffer_out_index_to_mem;
    reg  [ADDR_WIDTH:0]   buffer_cnt;
    reg                   fifo_r_en_delayed;
    wire [FIFO_WIDTH-1:0] data_from_mem;

    always @(posedge wr_clk) begin
        buffer_out_index_sync_to_wr_clk <= buffer_out_index;
        if (rst_sync_to_wr_clk == 1'b1 || force_empty_sync_to_wr_clk == 1'b1) begin
            fifo_full       <= 1'b0;
            buffer_in_index <= 0;
        end
            else begin
                if (fifo_w_en == 1'b1) begin
                    buffer_in_index <= buffer_in_index + 1'b1;
                end
                if ((buffer_out_index_sync_to_wr_clk[ADDR_WIDTH-1:0] == buffer_in_index[ADDR_WIDTH-1:0]) &&
                        (buffer_out_index_sync_to_wr_clk[ADDR_WIDTH] != buffer_in_index[ADDR_WIDTH]) )
                    fifo_full <= 1'b1;
                else
                    fifo_full <= 1'b0;
            end
    end

    always @( * )
        buffer_cnt = buffer_in_index_sync_to_rd_clk - buffer_out_index;

    always @(posedge rd_clk) begin
        num_elements_in_fifo <= { {16-ADDR_WIDTH-1{1'b0}}, buffer_cnt }; //pad buffer_cnt with leading zeroes
        buffer_in_index_sync_to_rd_clk <= buffer_in_index;
        if (rst_sync_to_rd_clk == 1'b1 || force_empty_sync_to_rd_clk == 1'b1) begin
            fifo_empty <= 1'b1;
            buffer_out_index <= 0;
            fifo_r_en_delayed <= 1'b0;
        end
        else begin
            fifo_r_en_delayed <= fifo_r_en;
            if (fifo_r_en == 1'b1 && fifo_r_en_delayed == 1'b0) begin
                data_out         <= data_from_mem;
                buffer_out_index <= buffer_out_index + 1'b1;
            end
            if (buffer_in_index_sync_to_rd_clk == buffer_out_index)
                fifo_empty <= 1'b1;
            else
                fifo_empty <= 1'b0;
        end
    end


    always @( * ) begin
        buffer_in_index_to_mem  = buffer_in_index[ADDR_WIDTH-1:0];
        buffer_out_index_to_mem = buffer_out_index[ADDR_WIDTH-1:0];
    end

    sm_dp_mem_dc #(FIFO_WIDTH, FIFO_DEPTH, ADDR_WIDTH)  u_sm_dp_mem_dc (
        .addr_in(buffer_in_index_to_mem),
        .addr_out(buffer_out_index_to_mem),
        .wr_clk(wr_clk),
        .rd_clk(rd_clk),
        .data_in(data_in),
        .write_en(fifo_w_en),
        .read_en(fifo_r_en),
        .data_out(data_from_mem)
    );

endmodule
