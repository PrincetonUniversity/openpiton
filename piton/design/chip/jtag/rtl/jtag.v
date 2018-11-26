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
//  Filename      : l15.v
//  Created On    : 2014-01-31 12:52:57
//  Revision      :
//  Author        : Tri Nguyen
//  Company       : Princeton University
//  Email         : trin@princeton.edu
//
//  Description   : JTAG port for the processor. Includes the JTAG interface that runs at JTAG clock
//                  and a central tap (ctap) module that parses the JTAG command to UCB packets
//                  (at processor clock speed) and forward these packets to the receiver tap (rtap)
//                  that lives in the tiles.
//                  The tiles are connected as 2 low-bandwidth, uni-direction rings using the T1's UCB transmitters and receivers.
//                  Ring #1 is the
//==================================================================================================

`include "define.tmp.h"
`include "jtag.vh"

`ifdef L15_EXTRA_DEBUG
`default_nettype none
`endif

module jtag(
    input clk,
    input rst_n,

    // IO interface
    input wire jtag_clk,
    input wire jtag_rst_l,
    input wire jtag_modesel,
    input wire jtag_datain,
    output wire jtag_dataout,
    output wire jtag_dataout_en,

    // UCB out interface
    output wire jtag_tiles_ucb_val,
    output wire [`UCB_BUS_WIDTH-1:0] jtag_tiles_ucb_data,

    // UCB in interface
    input wire tiles_jtag_ucb_val,
    input wire [`UCB_BUS_WIDTH-1:0] tiles_jtag_ucb_data,

    output wire ctap_oram_req_val,
    output wire [`JTAG_ORAM_MISC_WIDTH-1:0] ctap_oram_req_misc,
    input wire [`JTAG_ORAM_DATA_WIDTH-1:0] oram_ctap_res_data,

    // output wire [`BIST_OP_WIDTH-1:0] ctap_oram_bist_command,
    // output wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] ctap_oram_bist_data,
    // input wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] oram_ctap_sram_data,

    output wire [127:0] ctap_clk_en,
    output wire ctap_oram_clk_en
    );


//////////////////////
// Internal signals
//////////////////////

wire sys_clk = clk;

// from jtag to ctap
wire jtag_ctap_reg_wr_en;
wire [`CTAP_REG_SEL_WIDTH-1:0] jtag_ctap_reg_sel;
wire [`JTAG_SCRATCH_WIDTH-1:0] jtag_ctap_data;
// from jtag to ctap synced
wire jtag_ctap_reg_wr_en_sync;
wire [`CTAP_REG_SEL_WIDTH-1:0] jtag_ctap_reg_sel_sync;
wire [`JTAG_SCRATCH_WIDTH-1:0] jtag_ctap_data_sync;

// from ctap to jtag
wire [`JTAG_SCRATCH_WIDTH-1:0] ctap_jtag_data;
wire ctap_jtag_interrupt_bit;
// from ctap to jtag synced
wire [`JTAG_SCRATCH_WIDTH-1:0] ctap_jtag_data_sync;
wire ctap_jtag_interrupt_bit_sync;

wire ctap_ucb_tx_val;
wire [`CTAP_UCB_PACKET_WIDTH-1:0] ctap_ucb_tx_data;
wire [(`CTAP_UCB_PACKET_WIDTH/`UCB_BUS_WIDTH)-1:0] ctap_ucb_tx_data_vec;
wire ctap_ucb_rx_val;
wire [`CTAP_UCB_PACKET_WIDTH-1:0] ctap_ucb_rx_data;


jtag_interface jtag_interface(
    .jtag_clk(jtag_clk),
    .jtag_rst_l(jtag_rst_l),
    .jtag_modesel(jtag_modesel),
    .jtag_datain(jtag_datain),
    .jtag_dataout(jtag_dataout),
    .jtag_dataout_en(jtag_dataout_en),
    .ctap_jtag_data(ctap_jtag_data_sync),
    .ctap_jtag_interrupt_bit(ctap_jtag_interrupt_bit_sync),
    .jtag_ctap_data(jtag_ctap_data),
    .jtag_ctap_reg_wr_en(jtag_ctap_reg_wr_en),
    .jtag_ctap_reg_sel(jtag_ctap_reg_sel)
    );

jtag_ctap ctap(
    .clk(clk),
    .rst_n(rst_n),

    // jtag
    .ctap_jtag_data(ctap_jtag_data),
    .ctap_jtag_interrupt_bit(ctap_jtag_interrupt_bit),
    .jtag_ctap_data(jtag_ctap_data_sync),
    .jtag_ctap_reg_wr_en(jtag_ctap_reg_wr_en_sync),
    .jtag_ctap_reg_sel(jtag_ctap_reg_sel_sync),

    .ctap_ucb_tx_val(ctap_ucb_tx_val),
    .ctap_ucb_tx_data(ctap_ucb_tx_data),
    .ctap_ucb_tx_data_vec(ctap_ucb_tx_data_vec),
    .ctap_ucb_rx_val(ctap_ucb_rx_val),
    .ctap_ucb_rx_data(ctap_ucb_rx_data),

    .ctap_oram_req_val(ctap_oram_req_val),
    .ctap_oram_req_misc(ctap_oram_req_misc),
    .oram_ctap_res_data(oram_ctap_res_data),
    // .ctap_oram_bist_command(ctap_oram_bist_command),
    // .ctap_oram_bist_data(ctap_oram_bist_data),
    // .oram_ctap_sram_data(oram_ctap_sram_data),

    .ctap_clk_en(ctap_clk_en),
    .ctap_oram_clk_en(ctap_oram_clk_en)
    );

// Synchronizers
// trin: the interface assumes that system clock runs at least 2x jtag clk
//          other wise the interface might not work
synchronizer #(1) u_jtag_ctap_reg_wr_en_sync 
   ( .syncdata (jtag_ctap_reg_wr_en_sync),
     .presyncdata (jtag_ctap_reg_wr_en),
     .clk (sys_clk)
     );

// synchronizer #(`CTAP_REG_SEL_WIDTH) u_jtag_ctap_reg_sel_sync 
//    ( .syncdata (jtag_ctap_reg_sel_sync),
//      .presyncdata (jtag_ctap_reg_sel),
//      .clk (sys_clk)
//      );
// synchronizers should not be applied on data bus
assign jtag_ctap_reg_sel_sync = jtag_ctap_reg_sel;

// synchronizer #(`JTAG_SCRATCH_WIDTH) u_jtag_ctap_data_sync 
//    ( .syncdata (jtag_ctap_data_sync),
//      .presyncdata (jtag_ctap_data),
//      .clk (sys_clk)
//      );
// synchronizers should not be applied on data bus
assign jtag_ctap_data_sync = jtag_ctap_data;

// synchronizer #(`JTAG_SCRATCH_WIDTH) u_ctap_jtag_data_sync 
//    ( .syncdata (ctap_jtag_data_sync),
//      .presyncdata (ctap_jtag_data),
//      .clk (jtag_clk)
//      );
// synchronizers should not be applied on data bus
assign ctap_jtag_data_sync = ctap_jtag_data;

synchronizer #(1) u_ctap_jtag_interrupt_bit_sync 
   ( .syncdata (ctap_jtag_interrupt_bit_sync),
     .presyncdata (ctap_jtag_interrupt_bit),
     .clk (jtag_clk)
     );

jtag_ucb_receiver ucb_rx(
    .clk(clk),
    .rst_n(rst_n),
    .ctap_ucb_rx_val(ctap_ucb_rx_val),
    .ctap_ucb_rx_data(ctap_ucb_rx_data),
    .tiles_jtag_ucb_val(tiles_jtag_ucb_val),
    .tiles_jtag_ucb_data(tiles_jtag_ucb_data)
    );

jtag_ucb_transmitter ucb_tx(
    .clk(clk),
    .rst_n(rst_n),
    .ctap_ucb_tx_val(ctap_ucb_tx_val),
    .ctap_ucb_tx_data(ctap_ucb_tx_data),
    .ctap_ucb_tx_data_vec(ctap_ucb_tx_data_vec),
    .jtag_tiles_ucb_val(jtag_tiles_ucb_val),
    .jtag_tiles_ucb_data(jtag_tiles_ucb_data)
    );

endmodule

