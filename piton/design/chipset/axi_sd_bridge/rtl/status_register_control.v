//////////////////////////////////////////////////////////////////////
////                                                              ////
//// ctrlStsRegBI.v                                               ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
//// Wishbone bus interface to spiMaster control and status regs
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

module status_register_control (
    // Wishbone bus inputs
    input  wire        clk_i,
    input  wire        rst_i,
    input  wire [7:0]  adr_i,
    input  wire [7:0]  dat_i,
    input  wire        we_i,
    input  wire        stb_i,

    // SPI bus inputs
    input  wire        spi_sys_clk,
    input  wire        spi_trans_status,
    input  wire [7:0]  spi_da_rx_data,
    input  wire [1:0]  sd_write_error,
    input  wire [1:0]  sd_read_error,
    input  wire [1:0]  sd_init_error,

    // SPI bus outputs
    output reg  [7:0]  spi_clk_delay,
    output reg  [1:0]  spi_trans_type,
    output reg         spi_trans_ctrl,
    output reg  [7:0]  spi_da_tx_data,
    output reg  [31:0] sd_addr,
    output reg         rst_sync_to_bus_clk,
    output reg         rst_sync_to_spi_clk,

    // Status register data select
    input  wire        ctrl_status_sel,

    // Status register output
    output reg  [7:0]  ctrl_status_data

);

    //==========================================================================
    // Internal Control Registers
    //==========================================================================
    reg [1:0] spi_trans_type_stb;       // TRANS_TYPE_REG
    reg       spi_trans_ctrl_stb;       // TRANS_CTRL_REG
    reg       spi_trans_status_stb;     // TRANS_STS_REG
    reg [1:0] sd_write_error_stb;       // TRANS_ERROR_REG
    reg [1:0] sd_read_error_stb;        // ''
    reg [1:0] sd_init_error_stb;        // ''
    reg [7:0] spi_da_tx_data_stb;       // DIRECT_ACCESS_DATA_REG
    reg [7:0] spi_da_rx_data_stb;       // ''

    //==========================================================================
    // Internal Wires and Registers
    //==========================================================================
    reg [20:0] rst_shift;
    reg       rst_from_bus;

    reg       rst_sync_to_spi_clk_first;
    reg [20:0] spi_trans_ctrl_shift;
    reg       spi_trans_status_reg_1;
    reg       spi_trans_status_reg_2;
    reg       spi_trans_status_reg_3;

    reg       spi_trans_ctrl_reg1;
    reg       spi_trans_ctrl_reg2;
    reg       spi_trans_ctrl_reg3;

    //==========================================================================
    // Synchronous Register Writes
    //==========================================================================
    always @(posedge clk_i) begin

        // Synchronous reset with wishbone clock
        if (rst_sync_to_bus_clk == 1'b1) begin
            spi_trans_type_stb <= `DIRECT_ACCESS;
            spi_trans_ctrl_stb <= `TRANS_STOP;
            spi_da_tx_data_stb <= 8'h00;
            spi_clk_delay      <= `FAST_SPI_CLK;
        end

        // General synchronous register writes
        else begin
            if (we_i & ctrl_status_sel & stb_i & (adr_i == `SPI_MASTER_CONTROL_REG) & dat_i[0]) begin
                rst_from_bus <= 1'b1;
            end
            else begin
                rst_from_bus <= 1'b0;
            end

            if (we_i & ctrl_status_sel & stb_i & (adr_i == `TRANS_CTRL_REG) & dat_i[0]) begin
                spi_trans_ctrl_stb <= 1'b1;
            end
            else begin
                spi_trans_ctrl_stb <= 1'b0;
            end

            if (we_i & ctrl_status_sel & stb_i) begin
                case (adr_i)
                    `TRANS_TYPE_REG:         spi_trans_type_stb <= dat_i[1:0];
                    `SD_ADDR_7_0_REG:        sd_addr[7:0]       <= dat_i;
                    `SD_ADDR_15_8_REG:       sd_addr[15:8]      <= dat_i;
                    `SD_ADDR_23_16_REG:      sd_addr[23:16]     <= dat_i;
                    `SD_ADDR_31_24_REG:      sd_addr[31:24]     <= dat_i;
                    `SPI_CLK_DEL_REG:        spi_clk_delay      <= dat_i;
                    `DIRECT_ACCESS_DATA_REG: spi_da_tx_data_stb <= dat_i;
                endcase
            end
            else begin
                rst_from_bus <= 1'b0;
                spi_trans_ctrl_stb <= 1'b0;
            end
        end
    end

    //==========================================================================
    // Asynchronous Register Reads
    //==========================================================================
    always @( * )
    begin
        case (adr_i)
            `SPI_MASTER_VERSION_REG: ctrl_status_data = `SPI_MASTER_VERSION_NUM;
            `TRANS_TYPE_REG:         ctrl_status_data = { 6'b000000, spi_trans_type_stb };
            `TRANS_CTRL_REG:         ctrl_status_data = { 7'b0000000, spi_trans_ctrl_stb };
            `TRANS_STS_REG:          ctrl_status_data = { 7'b0000000, spi_trans_status_stb };
            `TRANS_ERROR_REG:        ctrl_status_data = { 2'b00, sd_write_error_stb, sd_read_error_stb, sd_init_error_stb };
            `SD_ADDR_7_0_REG:        ctrl_status_data = sd_addr[7:0];
            `SD_ADDR_15_8_REG:       ctrl_status_data = sd_addr[15:8];
            `SD_ADDR_23_16_REG:      ctrl_status_data = sd_addr[23:16];
            `SD_ADDR_31_24_REG:      ctrl_status_data = sd_addr[31:24];
            `SPI_CLK_DEL_REG:        ctrl_status_data = spi_clk_delay;
            `DIRECT_ACCESS_DATA_REG: ctrl_status_data = spi_da_rx_data_stb;
            default:                 ctrl_status_data = 8'h00;
        endcase
    end

    //==========================================================================
    // Reset synchronization (assuming freq of clk_i < 20*spi_sys_clk)
    //==========================================================================

    // Generate rst_sync_to_bus_clk, which is 1 while resetting for at least
    // 21 cycles of clk_i
    always @(posedge clk_i) begin
        if (rst_i == 1'b1 || rst_from_bus == 1'b1)
            rst_shift <= 21'b111111111111111111111;
        else
            rst_shift <= { 1'b0, rst_shift[20:1] };
    end

    always @( * ) begin
        rst_sync_to_bus_clk = rst_shift[0];
    end

    // Sync back across clock domains to generate rst_sync_to_spi_clk
    always @(posedge spi_sys_clk) begin
        rst_sync_to_spi_clk_first <= rst_sync_to_bus_clk;
        rst_sync_to_spi_clk <= rst_sync_to_spi_clk_first;
    end


    //==========================================================================
    // SPI Transaction Control (assuming freq of clk_i < 20*spi_sys_clk)
    //==========================================================================

    // Generate spi_trans_ctrl_shift, whose bottom bit is 1 for at least
    // 21 cycles of clk_i when a transaction is initiated
    always @(posedge clk_i) begin
        if (rst_sync_to_bus_clk == 1'b1)
            spi_trans_ctrl_shift <= 21'b000000000000000000000;
        else if (spi_trans_ctrl_stb == 1'b1)
            spi_trans_ctrl_shift <= 21'b111111111111111111111;
        else
            spi_trans_ctrl_shift <= { 1'b0, spi_trans_ctrl_shift[20:1] };
    end

    // Sync back across clock domains to set spi_trans_ctrl
    always @(posedge spi_sys_clk) begin
        if (rst_sync_to_spi_clk == 1'b1) begin
            spi_trans_ctrl_reg1 <= 1'b0;
            spi_trans_ctrl_reg2 <= 1'b0;
            spi_trans_ctrl_reg3 <= 1'b0;
        end
        else begin
            spi_trans_ctrl_reg1 <= spi_trans_ctrl_shift[0];
            spi_trans_ctrl_reg2 <= spi_trans_ctrl_reg1;
            spi_trans_ctrl_reg3 <= spi_trans_ctrl_reg2;

            if (spi_trans_ctrl_reg3 == 1'b0 && spi_trans_ctrl_reg2 == 1'b1)
                spi_trans_ctrl <= `TRANS_START;
            else
                spi_trans_ctrl <= `TRANS_STOP;
        end
    end



    // Re-sync from clk_i to spi_sys_clk.
    always @(posedge spi_sys_clk) begin
        if (rst_sync_to_spi_clk == 1'b1) begin
            spi_trans_type <= `DIRECT_ACCESS;
            spi_da_tx_data <= 8'h00;
        end
        else begin
            spi_da_tx_data <= spi_da_tx_data_stb;
            spi_trans_type <= spi_trans_type_stb;
        end
    end

    // Re-sync from spi_sys_clk to clk_i
    always @(posedge clk_i) begin
        if (rst_sync_to_bus_clk == 1'b1) begin
            spi_trans_status_stb   <= `TRANS_NOT_BUSY;
            spi_trans_status_reg_1 <= `TRANS_NOT_BUSY;
            spi_trans_status_reg_2 <= `TRANS_NOT_BUSY;
            spi_trans_status_reg_3 <= `TRANS_NOT_BUSY;
        end
        else begin
            spi_trans_status_reg_1 <= spi_trans_status;
            spi_trans_status_reg_2 <= spi_trans_status_reg_1;
            spi_trans_status_reg_3 <= spi_trans_status_reg_2;
            if (spi_trans_ctrl_stb == `TRANS_START)
                spi_trans_status_stb <= `TRANS_BUSY;
            else if (spi_trans_status_reg_3 == `TRANS_BUSY && spi_trans_status_reg_2 == `TRANS_NOT_BUSY)
                spi_trans_status_stb <= `TRANS_NOT_BUSY;
        end
        spi_da_rx_data_stb <= spi_da_rx_data;
        sd_write_error_stb <= sd_write_error;
        sd_read_error_stb  <= sd_read_error;
        sd_init_error_stb  <= sd_init_error;
    end

endmodule
