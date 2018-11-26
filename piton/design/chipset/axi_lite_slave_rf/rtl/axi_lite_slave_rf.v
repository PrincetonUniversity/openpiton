// ========== Copyright Header Begin ============================================
// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// ========== Copyright Header End ============================================

//==================================================================================================
//  Filename      : axi_lite_slave_rf.v
//  Created On    : 2015-05-08
//  Revision      :
//  Author        : Xiaohua Liang
//  Company       : Princeton University
//  Email         : xiaohua@princeton.edu
//
//  Description   : a register file with axi-lite slave interface used for testing
//                  
//                  
//                  
//==================================================================================================

`include "define.tmp.h"
`define C_S_AXI_LITE_DATA_WIDTH         `NOC_DATA_WIDTH
`define C_S_AXI_LITE_ADDR_WIDTH         `NOC_DATA_WIDTH
`define C_S_AXI_LITE_RESP_WIDTH         2
`define AXI_LITE_SLAVE_REG_SIZE         8
`define AXI_LITE_SLAVE_RF_SIZE          1024
`define AXI_LITE_SLAVE_RF_INDEX_WIDTH   10

module axi_lite_slave_rf(
    input wire clk,
    input wire rst,

    //axi lite signals             
    //write address channel
    input wire [`C_S_AXI_LITE_ADDR_WIDTH-1:0]   s_axi_awaddr,
    input wire                                  s_axi_awvalid,
    output reg                                  s_axi_awready,

    //write data channel
    input wire [`C_S_AXI_LITE_DATA_WIDTH-1:0]   s_axi_wdata,
    input wire [`C_S_AXI_LITE_DATA_WIDTH/8-1:0] s_axi_wstrb,
    input wire                                  s_axi_wvalid,
    output reg                                  s_axi_wready,

    //read address channel
    input wire [`C_S_AXI_LITE_ADDR_WIDTH-1:0]   s_axi_araddr,
    input wire                                  s_axi_arvalid,
    output reg                                  s_axi_arready,

    //read data channel
    output reg [`C_S_AXI_LITE_DATA_WIDTH-1:0]   s_axi_rdata,
    output reg [`C_S_AXI_LITE_RESP_WIDTH-1:0]   s_axi_rresp,
    output reg                                  s_axi_rvalid,
    input wire                                  s_axi_rready,

    //write response channel
    output reg [`C_S_AXI_LITE_RESP_WIDTH-1:0]   s_axi_bresp,
    output reg                                  s_axi_bvalid,
    input wire                                  s_axi_bready
);

    reg [`C_S_AXI_LITE_DATA_WIDTH-1:0]      araddr_buffer;
    reg [`C_S_AXI_LITE_DATA_WIDTH-1:0]      awaddr_buffer;
    reg [`C_S_AXI_LITE_DATA_WIDTH-1:0]      wdata_buffer;
    reg [`C_S_AXI_LITE_DATA_WIDTH/8-1:0]    wstrb_buffer;

    reg [`C_S_AXI_LITE_DATA_WIDTH-1:0]      rdata_buffer;
    reg [`C_S_AXI_LITE_RESP_WIDTH-1:0]      rresp_buffer;
    reg [`C_S_AXI_LITE_RESP_WIDTH-1:0]      bresp_buffer;

    reg                                     araddr_buffer_val;
    reg                                     awaddr_buffer_val;
    reg                                     wdata_buffer_val; //also wstrb_buffer_val
    reg                                     rdata_buffer_val; //also rresp_buffer_val
    reg                                     bresp_buffer_val;


    //need to reset this...
    reg [`AXI_LITE_SLAVE_REG_SIZE-1:0]      axi_lite_slave_regs[`AXI_LITE_SLAVE_RF_SIZE-1: 0];


    wire                                    araddr_input_go;
    wire                                    awaddr_input_go;
    wire                                    wdata_input_go;
    wire                                    write_commit_go;
    wire                                    read_commit_go;
    wire                                    rdata_output_go;
    wire                                    bresp_output_go;

    //wire                                    araddr_buffer_stall;
    //wire                                    awaddr_buffer_stall;
    //wire                                    wdata_buffer_stall;
    //wire                                    rdata_buffer_stall;
    //wire                                    bresp_buffer_stall;

    wire [`AXI_LITE_SLAVE_RF_INDEX_WIDTH-1:0] regs_read_index;
    wire [`AXI_LITE_SLAVE_RF_INDEX_WIDTH-1:0] regs_write_index[7:0];

    assign regs_read_index = araddr_buffer[`AXI_LITE_SLAVE_RF_INDEX_WIDTH-1:0];
    assign regs_write_index[0] = awaddr_buffer[`AXI_LITE_SLAVE_RF_INDEX_WIDTH-1:0];
    assign regs_write_index[1] = awaddr_buffer[`AXI_LITE_SLAVE_RF_INDEX_WIDTH-1:0] + `AXI_LITE_SLAVE_RF_INDEX_WIDTH'd1;
    assign regs_write_index[2] = awaddr_buffer[`AXI_LITE_SLAVE_RF_INDEX_WIDTH-1:0] + `AXI_LITE_SLAVE_RF_INDEX_WIDTH'd2;
    assign regs_write_index[3] = awaddr_buffer[`AXI_LITE_SLAVE_RF_INDEX_WIDTH-1:0] + `AXI_LITE_SLAVE_RF_INDEX_WIDTH'd3;
    assign regs_write_index[4] = awaddr_buffer[`AXI_LITE_SLAVE_RF_INDEX_WIDTH-1:0] + `AXI_LITE_SLAVE_RF_INDEX_WIDTH'd4;
    assign regs_write_index[5] = awaddr_buffer[`AXI_LITE_SLAVE_RF_INDEX_WIDTH-1:0] + `AXI_LITE_SLAVE_RF_INDEX_WIDTH'd5;
    assign regs_write_index[6] = awaddr_buffer[`AXI_LITE_SLAVE_RF_INDEX_WIDTH-1:0] + `AXI_LITE_SLAVE_RF_INDEX_WIDTH'd6;
    assign regs_write_index[7] = awaddr_buffer[`AXI_LITE_SLAVE_RF_INDEX_WIDTH-1:0] + `AXI_LITE_SLAVE_RF_INDEX_WIDTH'd7;

    assign araddr_input_go = s_axi_arready && s_axi_arvalid;
    assign awaddr_input_go = s_axi_awready && s_axi_awvalid;
    assign wdata_input_go = s_axi_awready && s_axi_wvalid;

    assign write_commit_go = (!bresp_buffer_val) && awaddr_buffer_val && wdata_buffer_val;
    assign read_commit_go = (!rdata_buffer_val) && araddr_buffer_val;
    assign rdata_output_go = s_axi_rready && rdata_buffer_val;
    assign bresp_output_go = s_axi_bready && bresp_buffer_val;

    always @(*)
    begin
        s_axi_awready = !awaddr_buffer_val;
        s_axi_wready  = !wdata_buffer_val;
        s_axi_arready = !araddr_buffer_val;
        s_axi_rvalid = rdata_buffer_val;
        s_axi_bvalid = bresp_buffer_val;
        s_axi_rdata = rdata_buffer;
        s_axi_rresp = rresp_buffer;
        s_axi_bresp = bresp_buffer;

    end

    always @(posedge clk) begin
        if (rst) begin
            araddr_buffer_val <= 1'b0;
            awaddr_buffer_val <= 1'b0;
            wdata_buffer_val  <= 1'b0;
            rdata_buffer_val  <= 1'b0;
            bresp_buffer_val  <= 1'b0;
            araddr_buffer <= `C_S_AXI_LITE_DATA_WIDTH'b0;
            awaddr_buffer <= `C_S_AXI_LITE_DATA_WIDTH'b0;
            wdata_buffer <= `C_S_AXI_LITE_DATA_WIDTH'b0;
            wstrb_buffer <= 8'b0;
            rdata_buffer <= `C_S_AXI_LITE_DATA_WIDTH'b0;
            rresp_buffer <= `C_S_AXI_LITE_RESP_WIDTH'b0;
            bresp_buffer <= `C_S_AXI_LITE_RESP_WIDTH'b0;
        end
        else begin
            //read cycles
            if (araddr_input_go) begin
                araddr_buffer <= s_axi_araddr;
                araddr_buffer_val <= 1'b1;
            end

            if (read_commit_go) begin
                rdata_buffer <= {56'b0, axi_lite_slave_regs[regs_read_index]}; //need padding
                rresp_buffer <= `C_S_AXI_LITE_RESP_WIDTH'b0;
                rdata_buffer_val <= 1'b1;
                araddr_buffer_val <= 1'b0;
            end

            if (rdata_output_go) begin
                rdata_buffer_val <= 1'b0;
            end


            if (awaddr_input_go) begin
                awaddr_buffer <= s_axi_awaddr;
                awaddr_buffer_val <= 1'b1;
            end

            if (wdata_input_go) begin
                wdata_buffer <= s_axi_wdata;
                wstrb_buffer <= s_axi_wstrb;
                wdata_buffer_val <= 1'b1;
            end

            if (write_commit_go) begin
                //need some decoding...
                if (wstrb_buffer == 8'b00000001) begin
                    axi_lite_slave_regs[regs_write_index[0]] <= wdata_buffer[`AXI_LITE_SLAVE_REG_SIZE-1:0];
                end
                else if (wstrb_buffer == 8'b00000011) begin
                    axi_lite_slave_regs[regs_write_index[0]] <= wdata_buffer[15:8];
                    axi_lite_slave_regs[regs_write_index[1]] <= wdata_buffer[`AXI_LITE_SLAVE_REG_SIZE-1:0];
                end
                else if (wstrb_buffer == 8'b00001111) begin
                    axi_lite_slave_regs[regs_write_index[0]] <= wdata_buffer[31:24];
                    axi_lite_slave_regs[regs_write_index[1]] <= wdata_buffer[23:16];
                    axi_lite_slave_regs[regs_write_index[2]] <= wdata_buffer[15:8];
                    axi_lite_slave_regs[regs_write_index[3]] <= wdata_buffer[`AXI_LITE_SLAVE_REG_SIZE-1:0];                    
                end
                else if (wstrb_buffer == 8'b11111111) begin
                    axi_lite_slave_regs[regs_write_index[0]] <= wdata_buffer[63:56];
                    axi_lite_slave_regs[regs_write_index[1]] <= wdata_buffer[55:48];
                    axi_lite_slave_regs[regs_write_index[2]] <= wdata_buffer[47:40];
                    axi_lite_slave_regs[regs_write_index[3]] <= wdata_buffer[39:32];
                    axi_lite_slave_regs[regs_write_index[4]] <= wdata_buffer[31:24];
                    axi_lite_slave_regs[regs_write_index[5]] <= wdata_buffer[23:16];
                    axi_lite_slave_regs[regs_write_index[6]] <= wdata_buffer[15:8];
                    axi_lite_slave_regs[regs_write_index[7]] <= wdata_buffer[`AXI_LITE_SLAVE_REG_SIZE-1:0];  
                end
                bresp_buffer <= `C_S_AXI_LITE_RESP_WIDTH'b0;
                bresp_buffer_val <= 1'b1;
                awaddr_buffer_val <= 1'b0;
                wdata_buffer_val <= 1'b0;
            end

            if (bresp_output_go) begin
                bresp_buffer_val <= 1'b0;
            end
        end
    end
endmodule
