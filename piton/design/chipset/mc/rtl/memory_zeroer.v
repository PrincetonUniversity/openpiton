// Copyright (c) 2018 Princeton University
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
`include "mc_define.h"

module memory_zeroer
#(
    parameter MIG_APP_ADDR_WIDTH          = 28,
    parameter MIG_APP_DATA_WIDTH          = 128, // value for a generated MIG, which varies for different FPGAs
    parameter MIG_APP_MASK_WIDTH          = MIG_APP_DATA_WIDTH / 8
)
(
    input   clk,
    input   rst_n,

    input   init_calib_complete_in,
    output  init_calib_complete_out,

    // MIG User Interface
    input                           app_rdy_in,
    input                           app_wdf_rdy_in,

    input                           app_wdf_wren_in,
    input [MIG_APP_DATA_WIDTH-1:0]  app_wdf_data_in,
    input [MIG_APP_MASK_WIDTH-1:0]  app_wdf_mask_in,
    input                           app_wdf_end_in,
    input [MIG_APP_ADDR_WIDTH-1:0]  app_addr_in,
    input                           app_en_in,
    input [2:0]                     app_cmd_in,

    output                          app_wdf_wren_out,
    output [MIG_APP_DATA_WIDTH-1:0] app_wdf_data_out,
    output [MIG_APP_MASK_WIDTH-1:0] app_wdf_mask_out,
    output                          app_wdf_end_out,
    output [MIG_APP_ADDR_WIDTH-1:0] app_addr_out,
    output                          app_en_out,
    output [2:0]                    app_cmd_out
);

// need extended range here as board mem size may be above 2GB which is out 
// of range for int datatype
localparam reg [63:0] BOARD_MEM_SIZE_MB = `BOARD_MEM_SIZE_MB;
localparam reg [63:0] MAX_MEM_ADDR      = (BOARD_MEM_SIZE_MB * 2**20) / `WORD_SIZE;
localparam reg [63:0] WORDS_PER_WR      = `WORDS_PER_BURST;

wire                          app_wdf_wren;
wire [MIG_APP_DATA_WIDTH-1:0] app_wdf_data;
wire [MIG_APP_MASK_WIDTH-1:0] app_wdf_mask;
wire                          app_wdf_end;
wire [MIG_APP_ADDR_WIDTH-1:0] app_addr;
wire                          app_en;
wire [2:0]                    app_cmd;

wire zeroing_done;
reg [MIG_APP_ADDR_WIDTH:0] address_f;
wire [MIG_APP_ADDR_WIDTH:0] address_next;

reg  [7:0] extra_time_f;
wire [7:0] extra_time_next;
wire extra_time_done;

assign address_next = (init_calib_complete_in & app_rdy_in & app_wdf_rdy_in & (address_f <= MAX_MEM_ADDR)) ? address_f + WORDS_PER_WR : address_f;

always @(posedge clk)
begin
    if (~rst_n)
    begin
        address_f <= {MIG_APP_ADDR_WIDTH+1{1'b0}};
        extra_time_f <= 8'b11111111;
    end
    else
    begin
        address_f <= address_next;
        extra_time_f <= extra_time_next;
    end
end

assign zeroing_done = (address_f >= MAX_MEM_ADDR);
assign extra_time_next = ((~zeroing_done) | (extra_time_f == 8'b0)) ? extra_time_f : (extra_time_f - 1'b1);
assign extra_time_done = zeroing_done & (extra_time_f == 8'b0);

assign init_calib_complete_out = init_calib_complete_in & extra_time_done;

assign app_wdf_wren = 1'b1 & app_rdy_in & app_wdf_rdy_in;
assign app_wdf_wren_out = zeroing_done ? app_wdf_wren_in : app_wdf_wren;

assign app_wdf_data = {MIG_APP_DATA_WIDTH{1'b0}};
assign app_wdf_data_out = zeroing_done ? app_wdf_data_in : app_wdf_data;

assign app_wdf_mask = {MIG_APP_MASK_WIDTH{1'b0}};
assign app_wdf_mask_out = zeroing_done ? app_wdf_mask_in : app_wdf_mask;

assign app_wdf_end = 1'b1;
assign app_wdf_end_out = zeroing_done ? app_wdf_end_in : app_wdf_end;

assign app_addr = address_f[MIG_APP_ADDR_WIDTH-1:0];
assign app_addr_out = zeroing_done ? app_addr_in : app_addr;

assign app_en = 1'b1 & app_rdy_in & app_wdf_rdy_in;
assign app_en_out = zeroing_done ? app_en_in : app_en;

assign app_cmd = `MIG_WR_CMD;
assign app_cmd_out = zeroing_done ? app_cmd_in : app_cmd;

endmodule
