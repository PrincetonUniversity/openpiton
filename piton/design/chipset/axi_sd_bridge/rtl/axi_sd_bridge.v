// Copyright (c) 2016 Princeton University
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

//==================================================================================================
//  Filename      : axi_sd_bridge.v
//  Created On    : 2015-04-20
//  Revision      :
//  Author        : Matthew Matl
//  Company       : Princeton University
//  Email         : mmatl@princeton.edu
//
//  Description   : Translate incoming AXI-Lite requests to initiate reads and writes to an SD card
//                  interface. Details about the SD card transactional interface are handled in
//                  sd_wishbone_transaction_manager.v. Currently, up to four blocks are cached by
//                  this module, with LRU replacement and a write-back protocol for speed.
//                  TODO: parameterize the entry selection logic.
//==================================================================================================

`include "define.tmp.h"
`include "spi_master_defines.v"
`include "sd_cache_defines.v"

module axi_sd_bridge (
    // AXI Lite Bus Clock
     input  wire                         clk,
     input  wire                         rst,

    // AXI Lite Slave Channels
    // Write Address Channel
     input  wire [`AXI_ADDR_WIDTH-1:0]   s_axi_awaddr,
     input  wire                         s_axi_awvalid,
     output reg                          s_axi_awready,

    // Write Data Channel
     input  wire [`AXI_DATA_WIDTH-1:0]   s_axi_wdata,
     input  wire [`AXI_DATA_WIDTH/8-1:0] s_axi_wstrb,
     input  wire                         s_axi_wvalid,
     output reg                          s_axi_wready,

    // Read Address Channel
     input  wire [`AXI_ADDR_WIDTH-1:0]   s_axi_araddr,
     input  wire                         s_axi_arvalid,
     output reg                          s_axi_arready,

    // Read Data Channel
     output reg  [`AXI_DATA_WIDTH-1:0]   s_axi_rdata,
     output reg  [`AXI_RESP_WIDTH-1:0]   s_axi_rresp,
     output reg                          s_axi_rvalid,
     input  wire                         s_axi_rready,

    // Write Response Channel
     output reg  [`AXI_RESP_WIDTH-1:0]   s_axi_bresp,
     output reg                          s_axi_bvalid,
     input  wire                         s_axi_bready,

    // Wishbone Master Channels
     input  wire                         ack_i,
     input  wire [7:0]                   dat_i,
     output wire [7:0]                   adr_o,
     output wire [7:0]                   dat_o,
     output wire                         stb_o,
     output wire                         we_o
);
    //----------------------------------------------------------------------------
    // FSM States
    //----------------------------------------------------------------------------

    // Reset State
    localparam RESET           = 4'b0000; // Clears out the cache, waits for SD to initialize

    // Idle State
    localparam RDY             = 4'b0001; // Ready to receive requests

    // Decision State
    localparam INIT_REQ        = 4'b0010; // Decide whether we have a hit or miss

    // Cache Miss States
    localparam WRITEBACK_START = 4'b0011; // Writeback the victim block
    localparam WRITEBACK_WAIT  = 4'b0100; // Wait for the victim to finish writeback
    localparam READ_START      = 4'b0101; // Read in the requested block
    localparam READ_WAIT       = 4'b0110; // Wait for the block read to complete

    // Cache Hit States
    localparam COMPLETE_REQ    = 4'b0111; // Read from or write to a cached block
    localparam COMPLETE_REQ_WR = 4'b1001;

    // Response Sending State
    localparam SEND_RESP       = 4'b1000; // Send a response


    //----------------------------------------------------------------------------
    // Local Registers
    //----------------------------------------------------------------------------

    // Write Inputs
    reg  [`AXI_ADDR_WIDTH-1:0]   waddr_buf, next_waddr_buf; // Saved write address
    reg  [`AXI_DATA_WIDTH-1:0]   wdata_buf, next_wdata_buf; // Saved write data
    reg  [`AXI_DATA_WIDTH/8-1:0] wstrb_buf, next_wstrb_buf; // Saved write STRB

    // Read Inputs
    reg  [`AXI_ADDR_WIDTH-1:0]   raddr_buf, next_raddr_buf; // Saved read address

    // Transaction Information
    localparam                 TTYPE_READ  = 1'b0;
    localparam                 TTYPE_WRITE = 1'b1;
    reg                        ttype_buf, next_ttype_buf; // Saved transaction type (read or write)
    reg  [`ENTRY_BITS-1:0]     entry_sel;
    wire [`ENTRY_BITS-1:0]     next_entry_sel; // Saved cache entry select

    // Cache Entries (Data, Address, Valid, Dirty)
    reg  [`N_BLK_ADDR_BITS-1:0] block_adr     [`N_ENTRIES-1:0];  // Cache address (aligned to block-size addr)
    reg  [`N_ENTRIES-1:0]       block_val;                       // Valid bits
    reg  [`N_ENTRIES-1:0]       block_dirty;                     // Dirty bits

    // LRU Algorithm Entries
    reg  [`N_ENTRIES-1:0]      block_lru      [`N_ENTRIES-1:0]; // Highest number indicates most recently used
    wire [`N_ENTRIES-1:0]      next_block_lru [`N_ENTRIES-1:0]; // while lowest number (1) indicates LRU target

    // State Data
    reg [3:0] state, next_state;

    // SD Wishbone Transaction Manager Controls
    reg                         sd_req_type;
    reg  [`AXI_ADDR_WIDTH-1:0]  sd_req_addr;
    reg  [`BLK_BYTES*8-1:0]     sd_req_data;
    reg                         sd_req_val;
    wire                        sd_req_rdy;
    wire                        sd_resp_succ;
    wire [`BLK_BYTES*8-1:0]     sd_resp_data;
    wire                        sd_resp_val;
    reg                         sd_resp_rdy;

    // Local Helper Wires
    wire [`N_ENTRIES-1:0]       valid_match;
    wire [`AXI_DATA_WIDTH-1:0]  rresp_word;
    wire [`AXI_DATA_WIDTH-1:0]  write_data;
    wire [`AXI_ADDR_WIDTH-1:0]  addr_buf;
    wire                        rd_req_go;
    wire                        wr_req_go;
    wire                        rd_resp_go;
    wire                        wr_resp_go;

    wire [5:0]                 tm_cache_r_addr;
    wire                       tm_cache_w_en;
    wire [5:0]                 tm_cache_w_addr;
    wire [`AXI_DATA_WIDTH-1:0] tm_cache_w_data; 

    // Cache Control Wires
    reg                        cache_ctrl_local;
    wire [`ENTRY_BITS-1:0]     cache_entry_sel  = entry_sel;
    wire [5:0]                 cache_r_addr     = (cache_ctrl_local) ? (addr_buf[`BLK_ADDR_WIDTH-1:3]) : (tm_cache_r_addr);
    wire [`AXI_DATA_WIDTH-1:0] cache_r_data;
    wire                       cache_w_en       = (cache_ctrl_local) ? (state == COMPLETE_REQ_WR) : (tm_cache_w_en);
    wire [5:0]                 cache_w_addr     = (cache_ctrl_local) ? (addr_buf[`BLK_ADDR_WIDTH-1:3]) : (tm_cache_w_addr);
    wire [`AXI_DATA_WIDTH-1:0] cache_w_data     = (cache_ctrl_local) ? (write_data) : (tm_cache_w_data);

    sd_block_cache sd_cache(
        // Clock + Reset
        .clk     (clk),
        .r_entry (cache_entry_sel),
        .r_addr  (cache_r_addr),
        .r_data  (cache_r_data),
        .w_en    (cache_w_en),
        .w_entry (entry_sel),
        .w_addr  (cache_w_addr),
        .w_data  (cache_w_data)
    );

    //----------------------------------------------------------------------------
    // Check validity of each block against current request address.
    //   - A block's corresponding valid_match bit is set only if its address
    //     matches and the entry is valid.
    //----------------------------------------------------------------------------
    assign addr_buf = (ttype_buf == TTYPE_READ) ? (raddr_buf) : (waddr_buf);

    generate
        genvar a;
        for (a = 0; a < `N_ENTRIES; a = a + 1) begin: block_validity_check
            assign valid_match[a] = ((addr_buf[`BLK_ADDR_BITS] == block_adr[a]) && block_val[a]);
        end
    endgenerate

    //----------------------------------------------------------------------------
    // Set up next LRU bit entry.
    //   - Each block has N_ENTRIES LRU bits.
    //   - When the block is used, the highest-order LRU bit is set for it.
    //   - Whenever a block that was previously less recently used than the
    //     current block is used, the bit for the current block shifts right by
    //     one entry.
    //   - Thus, the block that is least recently used has a 1 in its' lowest-
    //     order LRU entry slot.
    //----------------------------------------------------------------------------
    generate
        genvar b;
        for (b = 0; b < `N_ENTRIES; b = b + 1) begin: lru_bit_generation
            // Three cases:
            //   - If we're using block b, set it to the most recently used block.
            //   - If we're using a different block who is less recently used than block b,
            //     then slide block b's LRU bit right.
            //   - Otherwise, do nothing.
            assign next_block_lru[b] = (entry_sel == b)                      ? (1 << `N_ENTRIES - 1) :
                                       (block_lru[entry_sel] < block_lru[b]) ? (block_lru[b] >> 1)   :
                                                                               (block_lru[b])        ;

            // Update LRU bits once current transaction has completed
            always @(posedge clk)
            begin
                if (rst)
                begin
                    block_lru[b] <= 1 << b;
                end
                else begin
                    if (state == SEND_RESP && (rd_resp_go || wr_resp_go))
                    begin
                        block_lru[b] <= next_block_lru[b];
                    end
                end
            end
        end
    endgenerate

    //----------------------------------------------------------------------------
    // Select a word to be read out of the selected cache entry.
    //----------------------------------------------------------------------------
    // generate
    //     genvar c;
    //     for (c = 0; c < `BLK_WORDS; c = c + 1) begin: read_word_selection
    //         assign block_words[c] = block_buf[entry_sel][`AXI_DATA_WIDTH*(c+1)-1:`AXI_DATA_WIDTH*c];
    //     end
    // endgenerate

    // assign rresp_word = block_words[addr_buf[`BLK_ADDR_WIDTH-1:3]];

    //----------------------------------------------------------------------------
    // Generate write data.
    //   - This is simply the selected block, but with certain bytes masked out
    //     and replaced with the data being written to the block.
    //----------------------------------------------------------------------------
    generate
        genvar e;
        for (e = 0; e < `AXI_DATA_WIDTH/8; e = e + 1) begin: write_data_loop
            assign write_data[(8*(e+1))-1:(8*e)] =
                (wstrb_buf[e]) ? wdata_buf[8*(e+1)-1:8*e] : cache_r_data[8*(e+1)-1:8*e];
        end
    endgenerate

    //----------------------------------------------------------------------------
    // Control SD Cache Lines
    //----------------------------------------------------------------------------
    generate
        genvar f;
        for (f = 0; f < `N_ENTRIES; f = f + 1) begin: block_buf_and_adr
            always @(posedge clk) begin
                if (rst)
                begin
                    block_adr[f]   <= 0;
                    block_val[f]   <= 0;
                    block_dirty[f] <= 0;
                end
                else
                begin
                    if (entry_sel == f && state == READ_WAIT && sd_resp_val)
                    begin
                        if (sd_resp_succ)
                        begin
                            block_adr[f]   <= addr_buf[`BLK_ADDR_BITS];
                            block_val[f]   <= 1;
                            block_dirty[f] <= (ttype_buf == TTYPE_WRITE);
                        end
                        else
                        begin
                            block_val[f]   <= 0;
                            block_dirty[f] <= 0;
                        end
                    end
                    if (entry_sel == f && state == COMPLETE_REQ_WR && ttype_buf == TTYPE_WRITE)
                    begin
                        block_dirty[f] <= 1;
                    end
                end
            end
        end
    endgenerate

    //----------------------------------------------------------------------------
    // Logic for loading new requests
    //----------------------------------------------------------------------------
    assign rd_req_go = (s_axi_arvalid);
    assign wr_req_go = (!rd_req_go && s_axi_wvalid && s_axi_awvalid);

    always @( * )
    begin
        next_waddr_buf = waddr_buf;
        next_wdata_buf = wdata_buf;
        next_wstrb_buf = wstrb_buf;
        next_raddr_buf = raddr_buf;
        next_ttype_buf = ttype_buf;

        s_axi_awready = 0;
        s_axi_wready  = 0;
        s_axi_arready = 0;

        if (state == RDY)
        begin
            if (rd_req_go)
            begin
                s_axi_arready = 1;

                if (s_axi_araddr[31:28] == 4'hF)
                begin
                    next_raddr_buf = {36'b0, s_axi_araddr[27:0]};
                end
                else
                begin
                    next_raddr_buf = {32'b0, s_axi_araddr[31:0]};
                end
                next_ttype_buf = TTYPE_READ;
            end
            if (wr_req_go)
            begin
                s_axi_awready = 1;
                s_axi_wready  = 1;

                if (s_axi_awaddr[31:28] == 4'hF)
                begin
                    next_waddr_buf = {36'b0, s_axi_awaddr[27:0]};
                end
                else
                begin
                    next_waddr_buf = {32'b0, s_axi_awaddr[31:0]};
                end
                next_wdata_buf =  {s_axi_wdata[7:0], s_axi_wdata[15:8], s_axi_wdata[23:16], s_axi_wdata[31:24], s_axi_wdata[39:32], s_axi_wdata[47:40], s_axi_wdata[55:48], s_axi_wdata[63:56]};
                next_wstrb_buf = s_axi_wstrb;
                next_ttype_buf = TTYPE_WRITE;
            end
        end
    end

    always @(posedge clk)
    begin
        if (rst)
        begin
            waddr_buf <= 0;
            wdata_buf <= 0;
            wstrb_buf <= 0;
            raddr_buf <= 0;
            ttype_buf <= 0;
        end
        else
        begin
            waddr_buf <= next_waddr_buf;
            wdata_buf <= next_wdata_buf;
            wstrb_buf <= next_wstrb_buf;
            raddr_buf <= next_raddr_buf;
            ttype_buf <= next_ttype_buf;
        end
    end

    //----------------------------------------------------------------------------
    // Logic for sending responses
    //----------------------------------------------------------------------------
    assign rd_resp_go = ((ttype_buf == TTYPE_READ)  && s_axi_rready);
    assign wr_resp_go = ((ttype_buf == TTYPE_WRITE) && s_axi_bready);

    always @( * )
    begin
        s_axi_rdata  = {cache_r_data[7:0], cache_r_data[15:8], cache_r_data[23:16], cache_r_data[31:24], cache_r_data[39:32], cache_r_data[47:40], cache_r_data[55:48], cache_r_data[63:56]};
        s_axi_rresp  = (block_val[entry_sel]) ? `AXI_RESP_OKAY : `AXI_RESP_ERROR;
        s_axi_rvalid = 0;

        s_axi_bresp  = (block_val[entry_sel]) ? `AXI_RESP_OKAY : `AXI_RESP_ERROR;
        s_axi_bvalid = 0;

        if (state == SEND_RESP)
        begin
            if (rd_resp_go)
            begin
                s_axi_rvalid = 1;
            end
            else if (wr_resp_go)
            begin
                s_axi_bvalid = 1;
            end
        end
    end

    //----------------------------------------------------------------------------
    // Block Selection Logic TODO: PARAMATERIZE THIS!!!!
    //----------------------------------------------------------------------------
    assign next_entry_sel = (valid_match == `N_ENTRIES'd1) ? `ENTRY_BITS'd0 :
                            (valid_match == `N_ENTRIES'd2) ? `ENTRY_BITS'd1 :
                            (valid_match == `N_ENTRIES'd4) ? `ENTRY_BITS'd2 :
                            (valid_match == `N_ENTRIES'd8) ? `ENTRY_BITS'd3 :
                            (block_lru[0][0])              ? `ENTRY_BITS'd0 :
                            (block_lru[1][0])              ? `ENTRY_BITS'd1 :
                            (block_lru[2][0])              ? `ENTRY_BITS'd2 :
                                                             `ENTRY_BITS'd3 ;

    always @(posedge clk)
    begin
        if (rst)
        begin
            entry_sel <= 0;
        end
        else
        begin
            if (state == INIT_REQ)
            begin
                entry_sel <= next_entry_sel;
            end
        end
    end

    //----------------------------------------------------------------------------
    // State Transition Logic
    //----------------------------------------------------------------------------
    always @( * )
    begin
        next_state = state;

        case(state)
            RESET:
            begin
                if (sd_req_rdy)
                begin
                    next_state = RDY;
                end
            end
            RDY:
            begin
                if (rd_req_go || wr_req_go)
                begin
                    next_state = INIT_REQ;
                end
            end
            INIT_REQ:
            begin
                if (valid_match != 0)
                begin
                    next_state = COMPLETE_REQ;
                end
                else if (block_val[next_entry_sel] && block_dirty[next_entry_sel])
                begin
                    next_state = WRITEBACK_START;
                end
                else
                begin
                    next_state = READ_START;
                end
            end
            WRITEBACK_START:
            begin
                if (sd_req_rdy)
                begin
                    next_state = WRITEBACK_WAIT;
                end
            end
            WRITEBACK_WAIT:
            begin
                if (sd_resp_val)
                begin
                    if (sd_resp_succ)
                    begin
                        next_state = READ_START;
                    end
                    else
                    begin
                        next_state = SEND_RESP;
                    end
                end
            end
            READ_START:
            begin
                if (sd_req_rdy)
                begin
                    next_state = READ_WAIT;
                end
            end
            READ_WAIT:
            begin
                if (sd_resp_val)
                begin
                    if (sd_resp_succ)
                    begin
                        next_state = COMPLETE_REQ;
                    end
                    else
                    begin
                        next_state = SEND_RESP;
                    end
                end
            end
            COMPLETE_REQ:
            begin
                if (ttype_buf == TTYPE_READ)
                begin
                    next_state = SEND_RESP;
                end
                else
                begin
                    next_state = COMPLETE_REQ_WR;
                end
            end
            COMPLETE_REQ_WR:
            begin
                next_state = SEND_RESP;
            end
            SEND_RESP:
            begin
                if (wr_resp_go || rd_resp_go)
                begin
                    next_state = RDY;
                end
            end
        endcase
    end

    always @(posedge clk)
    begin
        if (rst)
        begin
            state <= RESET;
        end
        else
        begin
            state <= next_state;
        end
    end

    //----------------------------------------------------------------------------
    // SD Interface Logic
    //----------------------------------------------------------------------------

    always @( * )
    begin
        sd_req_type = 0;
        sd_req_addr = {block_adr[entry_sel], 9'd0};
        sd_req_val  = 0;

        sd_resp_rdy = 0;
        cache_ctrl_local = 1;

        case(state)
            WRITEBACK_START:
            begin
                cache_ctrl_local = 0;
                sd_req_val = 1;
                sd_req_type = `SD_WB_BLK_WR;
            end
            WRITEBACK_WAIT:
            begin
                cache_ctrl_local = 0;
                sd_resp_rdy = 1;
            end
            READ_START:
            begin
                cache_ctrl_local = 0;
                sd_req_val  = 1;
                sd_req_type = `SD_WB_BLK_RD;
                sd_req_addr = addr_buf;
            end
            READ_WAIT:
            begin
                cache_ctrl_local = 0;
                sd_resp_rdy = 1;
            end
            default:
            begin

            end
        endcase
    end

    sd_wishbone_transaction_manager tm (
        .clk       (clk),
        .rst       (rst),

        .req_type  (sd_req_type),
        .req_addr  (sd_req_addr),
        .req_val   (sd_req_val),
        .req_rdy   (sd_req_rdy),

        .resp_succ (sd_resp_succ),
        .resp_val  (sd_resp_val),
        .resp_rdy  (sd_resp_rdy),

        .cache_r_data (cache_r_data),
        .cache_r_addr (tm_cache_r_addr),
        .cache_w_en   (tm_cache_w_en),
        .cache_w_addr (tm_cache_w_addr),
        .cache_w_data (tm_cache_w_data),

        .ack_i     (ack_i),
        .dat_i     (dat_i),
        .adr_o     (adr_o),
        .dat_o     (dat_o),
        .stb_o     (stb_o),
        .we_o      (we_o)
    );


endmodule

