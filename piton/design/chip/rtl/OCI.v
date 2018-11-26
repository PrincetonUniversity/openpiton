// Copyright (c) 2017 Princeton University
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

// Project: Off-Chip Interface (OCI)
// Creation date: 1/11/15
// Author: Mohammad Shahrad

// Notes:
// You can instantiate yout IO cells, pads, and other off-chip interface in
// this file.

`include "define.tmp.h"

module OCI (
   // Outside
   input slew,
   input impsel1,
   input impsel2,
   input core_ref_clk,
   input io_clk,
   input rst_n,
   input pll_rst_n,
   input [4:0] pll_rangea,
   input [1:0] clk_mux_sel,
   input clk_en,
   input pll_bypass,
   input async_mux,
   input oram_on,
   input oram_traffic_gen,
   input oram_dummy_gen,
   output pll_lock,
   input  wire jtag_clk,
   input  wire jtag_rst_l,
   input  wire jtag_modesel,
   input  wire jtag_datain,
   output wire jtag_dataout,
   input  [31:0]                 intf_chip_data,
   input  [1:0]                  intf_chip_channel,
   output [2:0]                  intf_chip_credit_back,
   output [31:0]                 chip_intf_data,
   output [1:0]                  chip_intf_channel,
   input  [2:0]                  chip_intf_credit_back,
   // Inside
   output core_ref_clk_inter,
   output io_clk_inter,
   output rst_n_inter,
   output pll_rst_n_inter,
   output [4:0] pll_rangea_inter,
   output [1:0] clk_mux_sel_inter,
   output clk_en_inter,
   output pll_bypass_inter,
   output async_mux_inter,
   output oram_on_inter,
   output oram_traffic_gen_inter,
   output oram_dummy_gen_inter,
   input  pll_lock_inter,
   output wire jtag_clk_inter,
   output wire jtag_rst_l_inter,
   output wire jtag_modesel_inter,
   output wire jtag_datain_inter,
   input  wire jtag_dataout_inter,
   output [31:0]                 intf_chip_data_inter,
   output [1:0]                  intf_chip_channel_inter,
   input  [2:0]                  intf_chip_credit_back_inter,
   input  [31:0]                 chip_intf_data_inter,
   input  [1:0]                  chip_intf_channel_inter,
   output [2:0]                  chip_intf_credit_back_inter
   );

`ifdef USE_FAKE_IOS

    assign core_ref_clk_inter = core_ref_clk;
    assign io_clk_inter = io_clk;
    assign rst_n_inter = rst_n;
    assign pll_rst_n_inter = pll_rst_n;
    assign pll_rangea_inter = pll_rangea;
    assign clk_mux_sel_inter = clk_mux_sel;
    assign clk_en_inter = clk_en;
    assign pll_bypass_inter = pll_bypass;
    assign async_mux_inter = async_mux;
    assign oram_on_inter = oram_on;
    assign oram_traffic_gen_inter = oram_traffic_gen;
    assign oram_dummy_gen_inter = oram_dummy_gen;
    assign pll_lock = pll_lock_inter;
    assign jtag_clk_inter = jtag_clk;
    assign jtag_rst_l_inter = jtag_rst_l;
    assign jtag_modesel_inter = jtag_modesel;
    assign jtag_datain_inter = jtag_datain;
    assign jtag_dataout = jtag_dataout_inter;
    assign intf_chip_data_inter = intf_chip_data;
    assign intf_chip_channel_inter = intf_chip_channel;
    assign intf_chip_credit_back = intf_chip_credit_back_inter;
    assign chip_intf_data = chip_intf_data_inter;
    assign chip_intf_channel = chip_intf_channel_inter;
    assign chip_intf_credit_back_inter = chip_intf_credit_back;

`else // `ifndef USE_FAKE_IOS
    
    // PUT REAL PADS AND I/Os HERE FOR SYNTHESIS AND BACKEND
    // BELOW IS A DUMMY SO FUNCTIONALITY IS MAINTAINED
    assign core_ref_clk_inter = core_ref_clk;
    assign io_clk_inter = io_clk;
    assign rst_n_inter = rst_n;
    assign pll_rst_n_inter = pll_rst_n;
    assign pll_rangea_inter = pll_rangea;
    assign clk_mux_sel_inter = clk_mux_sel;
    assign clk_en_inter = clk_en;
    assign pll_bypass_inter = pll_bypass;
    assign async_mux_inter = async_mux;
    assign oram_on_inter = oram_on;
    assign oram_traffic_gen_inter = oram_traffic_gen;
    assign oram_dummy_gen_inter = oram_dummy_gen;
    assign pll_lock = pll_lock_inter;
    assign jtag_clk_inter = jtag_clk;
    assign jtag_rst_l_inter = jtag_rst_l;
    assign jtag_modesel_inter = jtag_modesel;
    assign jtag_datain_inter = jtag_datain;
    assign jtag_dataout = jtag_dataout_inter;
    assign intf_chip_data_inter = intf_chip_data;
    assign intf_chip_channel_inter = intf_chip_channel;
    assign intf_chip_credit_back = intf_chip_credit_back_inter;
    assign chip_intf_data = chip_intf_data_inter;
    assign chip_intf_channel = chip_intf_channel_inter;
    assign chip_intf_credit_back_inter = chip_intf_credit_back; 

`endif
   
   endmodule
   
