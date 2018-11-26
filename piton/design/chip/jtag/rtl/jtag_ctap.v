/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
//==================================================================================================
//  Filename      : jtag_ctap.v
//  Created On    : 2014-01-31 12:52:57
//  Revision      :
//  Author        : Tri Nguyen
//  Company       : Princeton University
//  Email         : trin@princeton.edu
//
//  Description   : 
//==================================================================================================

`include "define.tmp.h"
`include "jtag.vh"

`ifdef L15_EXTRA_DEBUG
`default_nettype none
`endif

// This module runs at system clk

module jtag_ctap(
    input wire clk,
    input wire rst_n,

    // CTAP-JTAG interface
    input wire [`JTAG_SCRATCH_WIDTH-1:0] jtag_ctap_data,
    input wire jtag_ctap_reg_wr_en,
    input wire [`CTAP_REG_SEL_WIDTH-1:0] jtag_ctap_reg_sel,
    output reg [`JTAG_SCRATCH_WIDTH-1:0] ctap_jtag_data,
    output reg ctap_jtag_interrupt_bit,

    // UCB out interface
    output reg ctap_ucb_tx_val,
    output reg [`CTAP_UCB_PACKET_WIDTH-1:0] ctap_ucb_tx_data,
    output reg [(`CTAP_UCB_PACKET_WIDTH/`UCB_BUS_WIDTH)-1:0] ctap_ucb_tx_data_vec,

    // UCB in interface
    // output reg ctap_ucb_rx_rdy,
    input wire ctap_ucb_rx_val,
    input wire [`CTAP_UCB_PACKET_WIDTH-1:0] ctap_ucb_rx_data,

    output reg ctap_oram_req_val,
    output reg [`JTAG_ORAM_MISC_WIDTH-1:0] ctap_oram_req_misc,
    input wire [`JTAG_ORAM_DATA_WIDTH-1:0] oram_ctap_res_data,

    // output reg [`BIST_OP_WIDTH-1:0] ctap_oram_bist_command,
    // output reg [`SRAM_WRAPPER_BUS_WIDTH-1:0] ctap_oram_bist_data,
    // input wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] oram_ctap_sram_data,
    output reg [127:0] ctap_clk_en,
    output reg ctap_oram_clk_en
    );

// Data registers
reg [`JTAG_REQ_WIDTH-1:0] jtag_req;
reg [`JTAG_REQ_WIDTH-1:0] jtag_req_misc;
reg [`JTAG_REQ_WIDTH-1:0] jtag_req_next;
reg jtag_req_val;
reg jtag_req_val_next;
reg [`JTAG_DATA_RES_WIDTH-1:0] data_reg;
reg [`JTAG_DATA_RES_WIDTH-1:0] data_reg_next;
reg [`JTAG_ADDRESS_REG_WIDTH-1:0] jtag_address;
reg [`JTAG_ADDRESS_REG_WIDTH-1:0] jtag_address_next;

reg interrupt_bit;
reg interrupt_bit_next;

// Data regs before inputting to UCB and after outputting from UCB
// reg [`CTAP_UCB_PACKET_WIDTH-1:0] jtag_tiles_data;
// reg [(`CTAP_UCB_PACKET_WIDTH/`UCB_BUS_WIDTH)-1:0] jtag_tiles_data_vec;
// reg jtag_tiles_val;
// reg [`CTAP_UCB_PACKET_WIDTH-1:0] tiles_jtag_data;
// reg tiles_jtag_val;
reg response_interrupt_en;
reg clear_interrupt_en;
reg capture_ucb_data_en;

reg [127:0] ctap_clk_en_reg;
reg [127:0] ctap_clk_en_reg_next;
reg ctap_oram_clk_en_reg;
reg ctap_oram_clk_en_reg_next;

// renaming
reg [`CTAP_UCB_PACKET_WIDTH-1:0] rtap_packet;
reg rtap_val;
// oram
reg capture_oram_response;
reg capture_oram_response_next;


always @ (posedge clk)
begin
    if (!rst_n)
    begin
        jtag_req <= 0;
        data_reg <= 0;
        jtag_address <= 0;
        interrupt_bit <= 0;
        jtag_req_val <= 0;
        capture_oram_response <= 0;
        ctap_clk_en_reg <= ~(128'b0);
        ctap_oram_clk_en_reg <= 1'b0; // oram is off by default
    end
    else
    begin
        jtag_req <= jtag_req_next;
        data_reg <= data_reg_next;
        jtag_address <= jtag_address_next;
        interrupt_bit <= interrupt_bit_next;
        jtag_req_val <= jtag_req_val_next;
        capture_oram_response <= capture_oram_response_next;
        ctap_clk_en_reg <= ctap_clk_en_reg_next;
        ctap_oram_clk_en_reg <= ctap_oram_clk_en_reg_next;
    end
end

// Write enables to capture request and response data
// assuming that the enable signals from jtag are synced to system clk
reg data_reg_wr_en;
reg inst_wr_en;
reg addr_wr_en;
always @ *
begin
    data_reg_wr_en = 0;
    inst_wr_en = 0;
    addr_wr_en = 0;

    if (jtag_ctap_reg_wr_en)
    begin
        if (jtag_ctap_reg_sel == `CTAP_REG_SEL_DATA0)
            data_reg_wr_en = 1'b1;
        if (jtag_ctap_reg_sel == `CTAP_REG_SEL_INSTRUCTION)
            inst_wr_en = 1'b1;
        if (jtag_ctap_reg_sel == `CTAP_REG_SEL_ADDRESS)
            addr_wr_en = 1'b1;
    end


    // wren for data_reg
    if (data_reg_wr_en)
    begin
        data_reg_next = 0;
        data_reg_next[63:0] = jtag_ctap_data[63:0]; // data is only 64b for transmission
    end
    else if (capture_ucb_data_en)
        data_reg_next[`JTAG_DATA_RES_WIDTH-1:0] = rtap_packet[`JTAG_DATA_RES_WIDTH-1:0];
    // else if (capture_ucb_64b_en)
    //     data_reg_next[`JTAG_DATA_RES_WIDTH-1:0] = rtap_packet[`RTAP_RET_DATA_MASK];
    else if (capture_oram_response)
        data_reg_next = oram_ctap_res_data;
    else
        data_reg_next = data_reg;

    // wren for jtag_req reg
    if (inst_wr_en)
        jtag_req_next = jtag_ctap_data;
    else
        jtag_req_next = jtag_req;

    // wren for jtag_address
    if (addr_wr_en)
        jtag_address_next = jtag_ctap_data;
    else
        jtag_address_next = jtag_address;
end

// jtag_req val capture logics
// Basically, we would want the val to be only valid for 1 system clk cycle, when
//  the jtag clk could stretch for hundred of system clk cycles
// Assuming the jtag_req val signal is also synced

reg jtag_ctap_reg_wr_en_d1;
always @ (posedge clk)
begin
    if (!rst_n)
        jtag_ctap_reg_wr_en_d1 <= 1'b0;
    else
        jtag_ctap_reg_wr_en_d1 <= jtag_ctap_reg_wr_en;
end

always @ *
begin
    jtag_req_val_next = 0;
    if (jtag_req_val == 1'b1)
        jtag_req_val_next = 1'b0;
    else
    begin
        if (jtag_ctap_reg_wr_en_d1 == 1'b1 && jtag_ctap_reg_wr_en == 1'b0 && jtag_ctap_reg_sel == `CTAP_REG_SEL_INSTRUCTION)
            jtag_req_val_next = 1'b1;
    end
end

////////////////////////////
// CTAP logic
////////////////////////////

reg [`CTAP_UCB_PACKET_WIDTH-1:0] ctap_packet;
reg [(`CTAP_UCB_PACKET_WIDTH/`UCB_BUS_WIDTH)-1:0] ctap_packet_vec;
reg ctap_packet_val;
reg [`JTAG_REQ_WIDTH-1:0] ctap_header;
reg [`JTAG_ADDRESS_REG_WIDTH-1:0] ctap_address;
reg [`JTAG_DATA_REQ_WIDTH-1:0] ctap_data;

always @ *
begin
    ctap_packet_vec = 0;
    ctap_packet_val = 0;
    ctap_packet = 0;

    jtag_req_misc = jtag_req[`JTAG_REQ_MISC_MASK];

    clear_interrupt_en = 1'b0;
    ctap_oram_req_val = 0;
    ctap_oram_req_misc = 0;
    capture_oram_response_next = 0;
    ctap_clk_en_reg_next = ctap_clk_en_reg;
    ctap_oram_clk_en_reg_next = ctap_oram_clk_en_reg;

    if (jtag_req_val)
    begin
        // default is to pass along the message to rtap
        ctap_packet_val = 1'b1;

        case (jtag_req[`JTAG_REQ_OP_MASK])
            `JTAG_REQ_OP_CLEAR_INTERRUPT:
            begin
                clear_interrupt_en = 1'b1;
                ctap_packet_val = 1'b0;
            end
            `JTAG_REQ_OP_READ_ORAM:
            begin
                ctap_oram_req_val = 1'b1;
                ctap_oram_req_misc = jtag_req_misc[`JTAG_ORAM_MISC_WIDTH-1:0];
                capture_oram_response_next = 1'b1;
                ctap_packet_val = 1'b0;
            end
            `JTAG_REQ_OP_WRITE_CLK_EN:
            begin
                ctap_clk_en_reg_next = data_reg[127:0];
                ctap_packet_val = 1'b0;
            end
            `JTAG_REQ_OP_WRITE_ORAM_CLK_EN:
            begin
                ctap_oram_clk_en_reg_next = data_reg[0];
                ctap_packet_val = 1'b0;
            end
        endcase
    end

    ctap_header[`JTAG_REQ_WIDTH-1:0] = jtag_req[`JTAG_REQ_WIDTH-1:0];
    ctap_address[`JTAG_ADDRESS_REG_WIDTH-1:0] = jtag_address[`JTAG_ADDRESS_REG_WIDTH-1:0];
    ctap_data = data_reg[`JTAG_DATA_REQ_WIDTH-1:0];

    ctap_packet[`CTAP_REQ_HEADER_MASK] = ctap_header;
    ctap_packet[`CTAP_REQ_ADDRESS_MASK] = ctap_address;
    ctap_packet[`CTAP_REQ_DATA_MASK] = ctap_data;
    ctap_packet_vec = 32'hffffffff;
    // ctap_packet_vec = `CTAP_REQ_VEC_WHOLE_PACKET;
end

// handle returns from RTAP
reg ret_val;
always @ *
begin
    ret_val = rtap_val;

    capture_ucb_data_en = 1'b0;
    response_interrupt_en = 1'b0;

    if (ret_val)
    begin
        response_interrupt_en = 1'b1;
        capture_ucb_data_en = 1'b1;
    end
end

// interrupt bit logic
always @ *
begin
    interrupt_bit_next = interrupt_bit;
    if (response_interrupt_en)
        interrupt_bit_next = 1'b1;
    else if (clear_interrupt_en)
        interrupt_bit_next = 1'b0;

    // setting output reg
    ctap_jtag_interrupt_bit = interrupt_bit;
    ctap_clk_en = ctap_clk_en_reg;
    ctap_oram_clk_en = ctap_oram_clk_en_reg;
end

// ctap-jtag read interface
always @ *
begin
    ctap_jtag_data = data_reg;
end

// broadcast interface
always @ *
begin
    ctap_ucb_tx_val = ctap_packet_val;
    ctap_ucb_tx_data = ctap_packet;
    ctap_ucb_tx_data_vec = ctap_packet_vec;
end

// receiving interface
always @ *
begin
    rtap_packet = ctap_ucb_rx_data;
    rtap_val = ctap_ucb_rx_val;
end

// unused ORAM sram ports
    // output reg [`BIST_OP_WIDTH-1:0] ctap_oram_bist_command,
    // output reg [`SRAM_WRAPPER_BUS_WIDTH-1:0] ctap_oram_bist_data,
    // input wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] oram_ctap_sram_data,
// always @ *
// begin
//     ctap_oram_bist_command = 0;
//     ctap_oram_bist_data = 0;
// end
endmodule
