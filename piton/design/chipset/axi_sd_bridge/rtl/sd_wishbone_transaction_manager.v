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
//  Filename      : sd_wishbone_transaction_manager.v
//  Created On    : 2015-04-20
//  Revision      :
//  Author        : Matthew Matl
//  Company       : Princeton University
//  Email         : mmatl@princeton.edu
//
//  Description   : Handles transaction logic with to an SD Wishbone interface.
//  Patches by    : John Li
//==================================================================================================

`include "define.tmp.h"
`include "spi_master_defines.v"
`include "sd_cache_defines.v"

module sd_wishbone_transaction_manager (
    // Clock + Reset
    input  wire                        clk,
    input  wire                        rst,

    // Incoming Request Channel (Simple Val/Rdy)
    input  wire                        req_type, // Either SD_WB_BLK_RD (read) or SD_WB_BLK_WR (write)
    input  wire [`AXI_ADDR_WIDTH-1:0]  req_addr, // Byte address. Lower 9 bits are ignored (512 bytes per SD block)
    input  wire                        req_val,
    output reg                         req_rdy,

    // Outbound Response Channel (Simple Val/Rdy)
    output wire                        resp_succ, // 1 if successful, 0 if failure
    output reg                         resp_val,
    input  wire                        resp_rdy,

    // Cache control signals
    input  wire [`AXI_DATA_WIDTH-1:0]  cache_r_data,
    output reg  [5:0]                  cache_r_addr,
    output reg                         cache_w_en,
    output reg  [5:0]                  cache_w_addr,
    output reg  [`AXI_DATA_WIDTH-1:0]  cache_w_data,

    // Wishbone Master Channels
    input  wire                        ack_i,
    input  wire [7:0]                  dat_i,
    output reg  [7:0]                  adr_o,
    output reg  [7:0]                  dat_o,
    output reg                         stb_o,
    output reg                         we_o
);

    //----------------------------------------------------------------------------
    // Local Registers
    //----------------------------------------------------------------------------
    reg [4:0]                 state,       next_state;
    reg [4:0]                 after_state, next_after_state;

    reg [6:0]                 wcntr, next_wcntr;
    reg [2:0]                 bcntr, next_bcntr;

    reg [`AXI_ADDR_WIDTH-1:0] addr,  next_addr;
    reg [1:0]                 type,  next_type;
    reg                       succ,  next_succ;
    reg [`AXI_DATA_WIDTH-1:0] rword, next_rword;

    wire [`AXI_DATA_WIDTH-1:0] rdata_shift = (cache_r_data >> ({bcntr, 3'b000}));

    localparam INIT_WAIT_TIME = 80;

    //----------------------------------------------------------------------------
    // FSM States
    //----------------------------------------------------------------------------

    // Reset States
    localparam RS_CLEAR        = 5'b00000; // Sets registers to default values after reset
    localparam RS_WAIT         = 5'b00001; // Waits a few cycles after reset for card to stabilize
    localparam RS_W_TRANS_TYPE = 5'b00010; // Write a SD INIT op to the transaction type reg
    localparam RS_W_TRANS_CTRL = 5'b00011; // Start the SD INIT transaction
    localparam RS_R_TRANS_STS  = 5'b00100; // Wait for the SD INIT transaction to complete
    localparam RS_R_TRANS_ERR  = 5'b00101; // Read in the error status register

    // Idle Ready State
    localparam RDY             = 5'b00110; // Wait for a valid block transaction

    // Update Address States
    localparam W_ADDR_0        = 5'b00111; // Write the 32-bit SD address to the card
    localparam W_ADDR_1        = 5'b01000; // Write the 32-bit SD address to the card
    localparam W_ADDR_2        = 5'b01001; // Write the 32-bit SD address to the card
    localparam W_ADDR_3        = 5'b01010; // Write the 32-bit SD address to the card

    // Copying to TX
    localparam W_CLEAR_FIFO    = 5'b11010; // Empty the fifo before write data to it
    localparam W_DATA_WORD     = 5'b10010;
    localparam W_DATA_BYTES    = 5'b01011; // Copy 512 bytes from cache to TX queue (only for writes)

    // Start the Transaction
    localparam W_TRANS_TYPE    = 5'b01100; // Write a SD BLOCK op to the transaction type reg
    localparam W_TRANS_CTRL    = 5'b01101; // Start the SD BLOCK transaction
    localparam R_TRANS_STS     = 5'b01110; // Wait for the SD BLOCK transaction to complete
    localparam R_TRANS_ERR     = 5'b01111; // Read in the error status register

    // Copying from RX
    localparam R_DATA_BYTES    = 5'b10000; // Copy 512 bytes from RX queue to cache (only for reads)
    localparam R_DATA_WORD     = 5'b10011;

    // Transaction Completed
    localparam DONE            = 5'b10001; // Send a block transaction response

    // Intermediate State
    localparam WB_CHILL        = 5'b11111; // Pause between wishbone transactions.

    //----------------------------------------------------------------------------
    // Combinational Next State Logic
    //----------------------------------------------------------------------------

    always @( * )
    begin
        next_state = state;
        next_after_state = after_state;

        case(state)
            RS_CLEAR:
            begin
                next_state = RS_WAIT;
            end
            RS_WAIT:
            begin
                if (wcntr == INIT_WAIT_TIME)
                begin
                    next_state = RS_W_TRANS_TYPE;
                end
            end
            RS_W_TRANS_TYPE:
            begin
                if (ack_i)
                begin
                    next_after_state = RS_W_TRANS_CTRL;
                    next_state       = WB_CHILL;
                end
            end
            RS_W_TRANS_CTRL:
            begin
                if (ack_i)
                begin
                    next_after_state = RS_R_TRANS_STS;
                    next_state       = WB_CHILL;
                end
            end
            RS_R_TRANS_STS:
            begin
                if (ack_i)
                begin
                    if (dat_i[0] != `TRANS_BUSY) begin
                        next_after_state = RS_R_TRANS_ERR;
                        next_state       = WB_CHILL;
                    end
                    else
                    begin
                        next_after_state = RS_R_TRANS_STS;
                        next_state       = WB_CHILL;
                    end
                end
            end
            RS_R_TRANS_ERR:
            begin
                if (ack_i)
                begin
                    if (dat_i[`INIT_ERR_SLOT] == `INIT_NO_ERROR)
                    begin
                        next_state = RDY;
                    end
                    else
                    begin
                        next_state = RS_CLEAR;
                    end
                end
            end
            RDY:
            begin
                if (req_val)
                begin
                    if (req_type == `SD_WB_BLK_WR)
                    begin
                        next_state = W_CLEAR_FIFO;
                    end
                    else
                    begin
                        next_state = W_ADDR_0;
                    end
                end
            end
            W_ADDR_0:
            begin
                if (ack_i)
                begin
                    next_after_state = W_ADDR_1;
                    next_state       = WB_CHILL;
                end
            end
            W_ADDR_1:
            begin
                if (ack_i)
                begin
                    next_after_state = W_ADDR_2;
                    next_state       = WB_CHILL;
                end
            end
            W_ADDR_2:
            begin
                if (ack_i)
                begin
                    next_after_state = W_ADDR_3;
                    next_state       = WB_CHILL;
                end
            end
            W_ADDR_3:
            begin
                if (ack_i)
                begin
                    next_after_state = W_TRANS_TYPE;
                    next_state       = WB_CHILL;
                end
            end
            W_CLEAR_FIFO:
            begin
                if (ack_i)
                begin
                    next_after_state = W_DATA_WORD;
                    next_state = WB_CHILL;
                end
            end
            W_DATA_WORD:
            begin
                next_state = W_DATA_BYTES;
            end
            W_DATA_BYTES:
            begin
                if (ack_i)
                begin
                    if (wcntr == `BLK_WORDS-1 && bcntr == 3'b111)
                    begin
                        next_after_state = W_ADDR_0;
                        next_state       = WB_CHILL;
                    end
                    else if (bcntr == 3'b111)
                    begin
                        next_after_state = W_DATA_WORD;
                        next_state       = WB_CHILL;
                    end
                    else
                    begin
                        next_after_state = W_DATA_BYTES;
                        next_state       = WB_CHILL;
                    end
                end
            end
            W_TRANS_TYPE:
            begin
                if (ack_i)
                begin
                    next_after_state = W_TRANS_CTRL;
                    next_state       = WB_CHILL;
                end
            end
            W_TRANS_CTRL:
            begin
                if (ack_i)
                begin
                    next_after_state = R_TRANS_STS;
                    next_state       = WB_CHILL;
                end
            end
            R_TRANS_STS:
            begin
                if (ack_i)
                begin
                    if (dat_i[0] != `TRANS_BUSY)
                    begin
                        next_after_state = R_TRANS_ERR;
                        next_state       = WB_CHILL;
                    end
                    else
                    begin
                        next_after_state = R_TRANS_STS;
                        next_state       = WB_CHILL;
                    end
                end
            end
            R_TRANS_ERR:
            begin
                if (ack_i && (type == `SD_WB_BLK_WR))
                begin
                    next_after_state = DONE;
                    next_state       = WB_CHILL;
                end
                else if (ack_i && (type == `SD_WB_BLK_RD))
                begin
                    if (dat_i[`READ_ERR_SLOT] != `READ_NO_ERROR)
                    begin
                        next_after_state = DONE;
                        next_state       = WB_CHILL;
                    end
                    else
                    begin
                        next_after_state = R_DATA_BYTES;
                        next_state       = WB_CHILL;
                    end
                end
            end
            R_DATA_BYTES:
            begin
                if (ack_i)
                begin
                    if (bcntr == 3'b111)
                    begin
                        next_after_state = R_DATA_WORD;
                        next_state       = WB_CHILL;
                    end
                    else
                    begin
                        next_after_state = R_DATA_BYTES;
                        next_state       = WB_CHILL;
                    end
                end
            end
            R_DATA_WORD:
            begin
                    if (wcntr == `BLK_WORDS-1)
                    begin
                        next_state       = DONE;
                    end
                    else
                    begin
                        next_state       = R_DATA_BYTES;
                    end
            end
            DONE:
            begin
                if (resp_rdy)
                begin
                    next_state = RDY;
                end
            end
            WB_CHILL:
            begin
                next_state = after_state;
            end
        endcase
    end

    //----------------------------------------------------------------------------
    // Sequential State Logic
    //----------------------------------------------------------------------------

    always @(posedge clk)
    begin
        if (rst) begin
            state       <= RS_CLEAR;
            after_state <= RS_CLEAR;
        end
        else begin
            state       <= next_state;
            after_state <= next_after_state;
        end
    end

    //----------------------------------------------------------------------------
    // Combinational Output Logic
    //----------------------------------------------------------------------------

    assign resp_succ = succ;

    always @( * )
    begin
        adr_o      = 8'd0;
        dat_o      = 8'd0;
        stb_o      = 1'b0;
        we_o       = 1'b0;

        req_rdy    = 0;
        resp_val   = 0;

        next_wcntr = wcntr;
        next_bcntr = bcntr;

        next_addr  = addr;
        next_type  = type;

        next_succ  = succ;

        cache_r_addr = wcntr[5:0];
        cache_w_en   = 0;
        cache_w_addr = wcntr[5:0];
        cache_w_data = rword;
        next_rword  = rword;

        case(state)
            RS_CLEAR:
            begin
                next_wcntr = 0;
                next_bcntr = 0;
                next_succ  = 1;
            end
            RS_WAIT:
            begin
                if (wcntr == INIT_WAIT_TIME)
                begin
                    next_wcntr = 0;
                end
                else
                begin
                    next_wcntr = wcntr + 1;
                end
            end
            RS_W_TRANS_TYPE:
            begin
                adr_o = `CTRL_STS_REG_BASE + `TRANS_TYPE_REG;
                dat_o = {6'b000000, `INIT_SD};
                stb_o = 1'b1;
                we_o  = 1'b1;
            end
            RS_W_TRANS_CTRL:
            begin
                adr_o = `CTRL_STS_REG_BASE + `TRANS_CTRL_REG;
                dat_o = {7'b0000000, `TRANS_START};
                stb_o = 1'b1;
                we_o  = 1'b1;
            end
            RS_R_TRANS_STS:
            begin
                adr_o = `CTRL_STS_REG_BASE + `TRANS_STS_REG;
                stb_o = 1'b1;
            end
            RS_R_TRANS_ERR:
            begin
                adr_o = `CTRL_STS_REG_BASE + `TRANS_ERROR_REG;
                stb_o = 1'b1;
            end
            RDY:
            begin
                next_wcntr    = 0;
                next_bcntr    = 0;
                req_rdy       = 1;

                if (req_val)
                begin
                    next_addr  = req_addr;
                    next_type  = req_type;
                    next_succ  = 1;
                end
            end
            W_ADDR_0:
            begin
                adr_o = `CTRL_STS_REG_BASE + `SD_ADDR_7_0_REG;
                dat_o = 8'd0;
                stb_o = 1'b1;
                we_o  = 1'b1;
            end
            W_ADDR_1:
            begin
                adr_o = `CTRL_STS_REG_BASE + `SD_ADDR_15_8_REG;
                dat_o = {addr[15:9], 1'b0};
                stb_o = 1'b1;
                we_o  = 1'b1;
            end
            W_ADDR_2:
            begin
                adr_o = `CTRL_STS_REG_BASE + `SD_ADDR_23_16_REG;
                dat_o = addr[23:16];
                stb_o = 1'b1;
                we_o  = 1'b1;
            end
            W_ADDR_3:
            begin
                adr_o = `CTRL_STS_REG_BASE + `SD_ADDR_31_24_REG;
                dat_o = addr[31:24];
                stb_o = 1'b1;
                we_o  = 1'b1;
            end
            W_CLEAR_FIFO:
            begin
                adr_o = `TX_FIFO_BASE + `FIFO_CONTROL_REG;
                dat_o = 8'b00000001;
                stb_o = 1'b1;
                we_o  = 1'b1;
            end
            W_DATA_WORD:
            begin
                cache_r_addr = wcntr[5:0];
            end
            W_DATA_BYTES:
            begin
                adr_o = `TX_FIFO_BASE + `FIFO_DATA_REG;
                dat_o = rdata_shift[7:0];
                stb_o = 1'b1;
                we_o  = 1'b1;

                cache_r_addr = wcntr[5:0];

                if (ack_i)
                begin
                    next_bcntr = bcntr + 1;
                    if (bcntr == 3'b111) begin
                        next_wcntr = wcntr + 1;
                    end
                end
            end
            W_TRANS_TYPE:
            begin
                adr_o = `CTRL_STS_REG_BASE + `TRANS_TYPE_REG;
                dat_o = (type == `SD_WB_BLK_WR) ? {6'b000000, `RW_WRITE_SD_BLOCK} : {6'b000000, `RW_READ_SD_BLOCK};
                stb_o = 1'b1;
                we_o  = 1'b1;
            end
            W_TRANS_CTRL:
            begin
                adr_o = `CTRL_STS_REG_BASE + `TRANS_CTRL_REG;
                dat_o = {7'b0000000, `TRANS_START};
                stb_o = 1'b1;
                we_o  = 1'b1;
            end
            R_TRANS_STS:
            begin
                adr_o = `CTRL_STS_REG_BASE + `TRANS_STS_REG;
                stb_o = 1'b1;
            end
            R_TRANS_ERR:
            begin
                adr_o = `CTRL_STS_REG_BASE + `TRANS_ERROR_REG;
                stb_o = 1'b1;

                if (ack_i && (type == `SD_WB_BLK_WR) && (dat_i[`WRITE_ERR_SLOT] != `WRITE_NO_ERROR))
                begin
                    next_succ = 0;
                end
                else if (ack_i && (type == `SD_WB_BLK_RD) && (dat_i[`READ_ERR_SLOT] != `READ_NO_ERROR))
                begin
                    next_succ = 0;
                end
            end
            R_DATA_BYTES:
            begin
                adr_o = `RX_FIFO_BASE + `FIFO_DATA_REG;
                stb_o = 1'b1;

                if (ack_i)
                begin
                    next_bcntr = bcntr + 1;
                    next_rword = {dat_i, rword[`AXI_DATA_WIDTH-1:8]};
                end
            end
            R_DATA_WORD:
            begin
               cache_w_en = 1;
               next_wcntr = wcntr + 1;
            end
            DONE:
            begin
                resp_val = 1'b1;
            end
            WB_CHILL:
            begin
                stb_o = 1'b0;
            end
        endcase
    end

    //----------------------------------------------------------------------------
    // Sequential State Logic
    //----------------------------------------------------------------------------

    always @(posedge clk)
    begin
        if (rst) begin
            bcntr <= 0;
            wcntr <= 0;
            addr  <= 0;
            type  <= 0;
            succ  <= 1;
            rword <= 0;
        end
        else begin
            bcntr <= next_bcntr;
            wcntr <= next_wcntr;
            addr  <= next_addr;
            type  <= next_type;
            succ  <= next_succ;
            rword <= next_rword;
        end
    end

endmodule
