// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: iop.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
//
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
//
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
//
// ========== Copyright Header End ============================================

`ifndef USE_TEST_TOP // useless for older TOPs
// `define FPGA_SYN     // Alexey: an easy way to get rid of floating inputs
                     // in XST

`include "define.vh"
`include "jtag.vh"
`include "sys.h"
`include "iop.h"
`include "cross_module.tmp.h"
`include "ifu.h"

// `ifdef L15_EXTRA_DEBUG
// `default_nettype none
// `endif

module chip(
   // IO cell configs
   // input slew,
   // input impsel1,
   // input impsel2,

   input core_ref_clk,
   input io_clk,
   input rst_n,       // reset is assumed to be asynchronous
   // input pll_rst_n,
   // input [4:0] pll_rangea,
   // input [1:0] clk_mux_sel,
   // input clk_en,
   // input pll_bypass,
   // input async_mux,
   
   // input oram_on,
   // input oram_traffic_gen,
   // input oram_dummy_gen,

   // output pll_lock,
   // output pll_clk, // the chip shouldn't be outputting the clk
   
   // JTAG pins
   // input wire jtag_clk,
   // input wire jtag_rst_l,
   // input wire jtag_modesel,
   // input wire jtag_datain,
   // output wire jtag_dataout,

   // offchip interface
   // Tri: I think these should be transcoded to the actual virtual channel
   //  offchip interface
   //  but they are as they are right now
   // Also, oram module should be placed here before signals get out of chip

`ifdef CHIP_IS_TOP
   input                          intf_chip_data_single,
   input  [1:0]                   intf_chip_channel,
   output                         intf_chip_credit_back_single,
`else 
   input  [31:0]                  intf_chip_data,
   input  [1:0]                   intf_chip_channel,
   output [2:0]                   intf_chip_credit_back,
`endif

`ifdef CHIP_IS_TOP
   output                         chip_intf_data_single,
   // output [31:0]                 chip_intf_data,
   output [1:0]                   chip_intf_channel,
   input                          chip_intf_credit_back_single
   //input  [2:0]                  chip_intf_credit_back
`else
   output [31:0]                  chip_intf_data,
   output [1:0]                   chip_intf_channel,
   input  [2:0]                   chip_intf_credit_back
`endif
   
);

   wire core_ref_clk_inter;
   wire io_clk_inter;
   wire rst_n_inter;
   wire pll_rst_n_inter;
   wire [4:0] pll_rangea_inter;
   wire [1:0] clk_mux_sel_inter;
   wire clk_en_inter;
   wire pll_bypass_inter;
   wire async_mux_inter;
   wire oram_on_inter;
   wire oram_traffic_gen_inter;
   wire oram_dummy_gen_inter;
   wire pll_lock_inter;
   wire jtag_clk_inter;
   wire jtag_rst_l_inter;
   wire jtag_rst_l_inter_sync;
   wire jtag_modesel_inter;
   wire jtag_datain_inter;
   wire jtag_dataout_inter;
   wire [31:0]      		   intf_chip_data_inter;
   wire [1:0]                  intf_chip_channel_inter;
   wire [2:0]                  intf_chip_credit_back_inter;
   wire [31:0]                 chip_intf_data_inter;
   wire [1:0]                  chip_intf_channel_inter;
   wire [2:0]                  chip_intf_credit_back_inter;


   // Alexey
   // PROTO
   reg  [3:0]   cnt_div;
   reg  [1:0]   io_div_cnt;
   reg          jtag_clk;
   wire         cnt_div_flag;
   wire         io_div_flag;

   wire   pll_rst_n;
   wire   [3:0] pll_rangea;
   wire   [1:0] clk_mux_sel;
   wire   clk_en;
   wire   pll_bypass;
   wire   async_mux;
   wire   oram_on;
   wire   oram_traffic_gen;
   wire   oram_dummy_gen;
   wire   pll_lock;
   wire   jtag_rst_l;
   wire   jtag_modesel;
   wire   jtag_datain;
   wire   jtag_dataout;

   wire slew;
   wire impsel1;
   wire impsel2;

   // Temporary

`ifdef CHIP_IS_TOP
   wire  [31:0]               intf_chip_data;

   wire  [31:0]                chip_intf_data;
   wire  [2:0]                 chip_intf_credit_back;

   assign  intf_chip_data = {32{intf_chip_data_single}};
   assign  intf_chip_credit_back_single = |intf_chip_credit_back;

   assign  chip_intf_credit_back = {3{chip_intf_credit_back_single}};
   assign  chip_intf_data_single = |chip_intf_data_single;
   // TODO: remove for simulation
`endif

   assign pll_rst_n           = 1'b1; // not used
   assign pll_rangea          = 4'b0; // not used

   assign slew                = 1'b1;
   assign impsel1             = 1'b1;
   assign impsel2             = 1'b1;
   assign clk_mux_sel         = 2'b0; // not used
   assign clk_en              = 1'b1;
   assign pll_bypass          = 1'b1; // not used
   assign async_mux           = 1'b1;
   assign oram_on             = 1'b0;
   assign oram_traffic_gen    = 1'b0;
   assign oram_dummy_gen      = 1'b0;
   assign jtag_rst_l          = rst_n;
   assign jtag_modesel        = 1'b0;
   assign jtag_datain         = 1'b0;
   assign jtag_dataout        = 1'b0;

   assign cnt_div_flag        = cnt_div == 4'h7;

   always @(posedge core_ref_clk) begin
      if (~rst_n)
        cnt_div <= 4'b0;
      else
        cnt_div <= cnt_div_flag ? 4'b0 : cnt_div + 1;
   end

   always @(posedge core_ref_clk) begin
     if (~rst_n)
        jtag_clk <= 1'b0;
     else
        jtag_clk <= cnt_div_flag ? ~jtag_clk : jtag_clk;
   end


   assign io_div_flag = io_div_cnt == 2'h2;

   always @(posedge core_ref_clk) begin
     if (~rst_n)
      io_div_cnt <= 2'b0;
     else
      io_div_cnt <= io_div_flag ? 2'b0 : io_div_cnt + 1;
   end

   // reg   io_clk;
   // always @(posedge core_ref_clk) begin
   //   if (~rst_n)
   //    io_clk <= 1'b0;
   //   else begin
   //     io_clk <= ~io_clk; //io_div_flag ? ~io_clk : io_clk;
   //   end
   // end
   // wire io_clk;
   // assign io_clk = core_ref_clk;
   
   
   // Off-Chip Interface Block
   
   OCI oci_inst (
   // Outside
   .slew						(slew),
   .impsel1						(impsel1),
   .impsel2						(impsel2),
   .core_ref_clk				(core_ref_clk),
   .io_clk						(io_clk),
   .rst_n						(rst_n),
   .pll_rst_n					(pll_rst_n),
   .pll_rangea					(pll_rangea),
   .clk_mux_sel					(clk_mux_sel),
   .clk_en						(clk_en),
   .pll_bypass					(pll_bypass),
   .async_mux					(async_mux),
   .oram_on						(oram_on),
   .oram_traffic_gen			(oram_traffic_gen),
   .oram_dummy_gen				(oram_dummy_gen),
   .pll_lock					(pll_lock),
   .jtag_clk					(jtag_clk),
   .jtag_rst_l					(jtag_rst_l),
   .jtag_modesel				(jtag_modesel),
   .jtag_datain					(jtag_datain),
   .jtag_dataout				(jtag_dataout),
   .intf_chip_data				(intf_chip_data),
   .intf_chip_channel			(intf_chip_channel),
   .intf_chip_credit_back		(intf_chip_credit_back),
   .chip_intf_data				(chip_intf_data),
   .chip_intf_channel			(chip_intf_channel),
   .chip_intf_credit_back		(chip_intf_credit_back),
   // Inside
   .core_ref_clk_inter			(core_ref_clk_inter),
   .io_clk_inter				(io_clk_inter),
   .rst_n_inter					(rst_n_inter),
   .pll_rst_n_inter				(pll_rst_n_inter),
   .pll_rangea_inter			(pll_rangea_inter),
   .clk_mux_sel_inter			(clk_mux_sel_inter),
   .clk_en_inter				(clk_en_inter),
   .pll_bypass_inter			(pll_bypass_inter),
   .async_mux_inter				(async_mux_inter),
   .oram_on_inter				(oram_on_inter),
   .oram_traffic_gen_inter		(oram_traffic_gen_inter),
   .oram_dummy_gen_inter		(oram_dummy_gen_inter),
   .pll_lock_inter				(pll_lock_inter),
   .jtag_clk_inter				(jtag_clk_inter),
   .jtag_rst_l_inter			(jtag_rst_l_inter),
   .jtag_modesel_inter			(jtag_modesel_inter),
   .jtag_datain_inter			(jtag_datain_inter),
   .jtag_dataout_inter			(jtag_dataout_inter),
   .intf_chip_data_inter		(intf_chip_data_inter),
   .intf_chip_channel_inter		(intf_chip_channel_inter),
   .intf_chip_credit_back_inter	(intf_chip_credit_back_inter),
   .chip_intf_data_inter		(chip_intf_data_inter),
   .chip_intf_channel_inter		(chip_intf_channel_inter),
   .chip_intf_credit_back_inter	(chip_intf_credit_back_inter) );
   



   wire clk_muxed;
   wire pll_clk;
   // wire pll_bypass_inter;
   wire rst_n_inter_sync;

   // reset synchronizer, might need to be placed near the
   //   pll or clock source so that reset signal has the same propagation
   //   as clock for better timing
   // materials on reset tree and placement
   // http://www.sunburst-design.com/papers/CummingsSNUG2002SJ_Resets.pdf
   synchronizer rst_sync (
      .clk(clk_muxed),
      .presyncdata(rst_n_inter),
      .syncdata(rst_n_inter_sync)
   );
   synchronizer jtag_rst_sync (
      .clk(clk_muxed),
      .presyncdata(jtag_rst_l_inter),
      .syncdata(jtag_rst_l_inter_sync)
   );

   // trin 2/3/15:
   // rst in the tile is flopped for an additional cycle
   // we'll do the same for all other modules at the chip.v level
   reg rst_n_inter_sync_f;
   always @ (posedge clk_muxed)
      rst_n_inter_sync_f <= rst_n_inter_sync;


   // wire difftieoutcomp;
   // wire difftieouttrue;
   // wire diffclockoutcomp;
   // wire diffclockouttrue;
   // wire dcoempty;
   // wire dcofull;
   // wire observe0;
   // wire plloutb;
   // wire pllsynca;
   // wire pllsyncb;
   // wire so_testonly_r_0;
   // wire testoutfreq;
 

   wire                         processor_offchip_noc1_valid;
   wire [`NOC_DATA_WIDTH-1:0]   processor_offchip_noc1_data;
   wire                         processor_offchip_noc1_yummy;
   wire                         processor_offchip_noc2_valid;
   wire [`NOC_DATA_WIDTH-1:0]   processor_offchip_noc2_data;
   wire                         processor_offchip_noc2_yummy;
   wire                         processor_offchip_noc3_valid;
   wire [`NOC_DATA_WIDTH-1:0]   processor_offchip_noc3_data;
   wire                         processor_offchip_noc3_yummy;

   wire                         offchip_processor_noc1_valid;
   wire [`NOC_DATA_WIDTH-1:0]   offchip_processor_noc1_data;
   wire                         offchip_processor_noc1_yummy;
   wire                         offchip_processor_noc2_valid;
   wire [`NOC_DATA_WIDTH-1:0]   offchip_processor_noc2_data;
   wire                         offchip_processor_noc2_yummy;
   wire                         offchip_processor_noc3_valid;
   wire [`NOC_DATA_WIDTH-1:0]   offchip_processor_noc3_data;
   wire                         offchip_processor_noc3_yummy;

   // ORAM-JTAG
   wire ctap_oram_req_val;
   wire [`JTAG_ORAM_MISC_WIDTH-1:0] ctap_oram_req_misc;
   wire [`JTAG_ORAM_DATA_WIDTH-1:0] oram_ctap_res_data;
   // wire [`BIST_OP_WIDTH-1:0] ctap_oram_bist_command;
   // wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] ctap_oram_bist_data;
   // wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] oram_ctap_sram_data;

   wire [127:0] ctap_clk_en_inter; // trin TODO: parameterize this number (63)
   wire ctap_oram_clk_en;



// wires for jtag interface
wire jtag_tiles_ucb_val;
wire [`UCB_BUS_WIDTH-1:0] jtag_tiles_ucb_data;
wire tile0_jtag_ucb_val;
wire [`UCB_BUS_WIDTH-1:0] tile0_jtag_ucb_data;



// generate the tiles and connect them through a template
wire [`DATA_WIDTH-1:0] tile_0_0_out_N_noc1_data;
wire [`DATA_WIDTH-1:0] tile_0_0_out_S_noc1_data;
wire [`DATA_WIDTH-1:0] tile_0_0_out_E_noc1_data;
wire [`DATA_WIDTH-1:0] tile_0_0_out_W_noc1_data;
wire tile_0_0_out_N_noc1_valid;
wire tile_0_0_out_S_noc1_valid;
wire tile_0_0_out_E_noc1_valid;
wire tile_0_0_out_W_noc1_valid;
wire tile_0_0_out_N_noc1_yummy;
wire tile_0_0_out_S_noc1_yummy;
wire tile_0_0_out_E_noc1_yummy;
wire tile_0_0_out_W_noc1_yummy;
wire [`DATA_WIDTH-1:0] tile_0_0_out_N_noc2_data;
wire [`DATA_WIDTH-1:0] tile_0_0_out_S_noc2_data;
wire [`DATA_WIDTH-1:0] tile_0_0_out_E_noc2_data;
wire [`DATA_WIDTH-1:0] tile_0_0_out_W_noc2_data;
wire tile_0_0_out_N_noc2_valid;
wire tile_0_0_out_S_noc2_valid;
wire tile_0_0_out_E_noc2_valid;
wire tile_0_0_out_W_noc2_valid;
wire tile_0_0_out_N_noc2_yummy;
wire tile_0_0_out_S_noc2_yummy;
wire tile_0_0_out_E_noc2_yummy;
wire tile_0_0_out_W_noc2_yummy;
wire [`DATA_WIDTH-1:0] tile_0_0_out_N_noc3_data;
wire [`DATA_WIDTH-1:0] tile_0_0_out_S_noc3_data;
wire [`DATA_WIDTH-1:0] tile_0_0_out_E_noc3_data;
wire [`DATA_WIDTH-1:0] tile_0_0_out_W_noc3_data;
wire tile_0_0_out_N_noc3_valid;
wire tile_0_0_out_S_noc3_valid;
wire tile_0_0_out_E_noc3_valid;
wire tile_0_0_out_W_noc3_valid;
wire tile_0_0_out_N_noc3_yummy;
wire tile_0_0_out_S_noc3_yummy;
wire tile_0_0_out_E_noc3_yummy;
wire tile_0_0_out_W_noc3_yummy;
wire [`DATA_WIDTH-1:0] dummy_out_N_noc1_data = `DATA_WIDTH'b0;
wire [`DATA_WIDTH-1:0] dummy_out_S_noc1_data = `DATA_WIDTH'b0;
wire [`DATA_WIDTH-1:0] dummy_out_E_noc1_data = `DATA_WIDTH'b0;
wire [`DATA_WIDTH-1:0] dummy_out_W_noc1_data = `DATA_WIDTH'b0;
wire dummy_out_N_noc1_valid = 1'b0;
wire dummy_out_S_noc1_valid = 1'b0;
wire dummy_out_E_noc1_valid = 1'b0;
wire dummy_out_W_noc1_valid = 1'b0;
wire dummy_out_N_noc1_yummy = 1'b0;
wire dummy_out_S_noc1_yummy = 1'b0;
wire dummy_out_E_noc1_yummy = 1'b0;
wire dummy_out_W_noc1_yummy = 1'b0;
wire [`DATA_WIDTH-1:0] dummy_out_N_noc2_data = `DATA_WIDTH'b0;
wire [`DATA_WIDTH-1:0] dummy_out_S_noc2_data = `DATA_WIDTH'b0;
wire [`DATA_WIDTH-1:0] dummy_out_E_noc2_data = `DATA_WIDTH'b0;
wire [`DATA_WIDTH-1:0] dummy_out_W_noc2_data = `DATA_WIDTH'b0;
wire dummy_out_N_noc2_valid = 1'b0;
wire dummy_out_S_noc2_valid = 1'b0;
wire dummy_out_E_noc2_valid = 1'b0;
wire dummy_out_W_noc2_valid = 1'b0;
wire dummy_out_N_noc2_yummy = 1'b0;
wire dummy_out_S_noc2_yummy = 1'b0;
wire dummy_out_E_noc2_yummy = 1'b0;
wire dummy_out_W_noc2_yummy = 1'b0;
wire [`DATA_WIDTH-1:0] dummy_out_N_noc3_data = `DATA_WIDTH'b0;
wire [`DATA_WIDTH-1:0] dummy_out_S_noc3_data = `DATA_WIDTH'b0;
wire [`DATA_WIDTH-1:0] dummy_out_E_noc3_data = `DATA_WIDTH'b0;
wire [`DATA_WIDTH-1:0] dummy_out_W_noc3_data = `DATA_WIDTH'b0;
wire dummy_out_N_noc3_valid = 1'b0;
wire dummy_out_S_noc3_valid = 1'b0;
wire dummy_out_E_noc3_valid = 1'b0;
wire dummy_out_W_noc3_valid = 1'b0;
wire dummy_out_N_noc3_yummy = 1'b0;
wire dummy_out_S_noc3_yummy = 1'b0;
wire dummy_out_E_noc3_yummy = 1'b0;
wire dummy_out_W_noc3_yummy = 1'b0;
wire [`DATA_WIDTH-1:0] offchip_out_E_noc1_data;
wire offchip_out_E_noc1_valid;
wire offchip_out_E_noc1_yummy;
wire [`DATA_WIDTH-1:0] offchip_out_E_noc2_data;
wire offchip_out_E_noc2_valid;
wire offchip_out_E_noc2_yummy;
wire [`DATA_WIDTH-1:0] offchip_out_E_noc3_data;
wire offchip_out_E_noc3_valid;
wire offchip_out_E_noc3_yummy;

tile tile0(
    .clk                (clk_muxed),
    .rst_n              (rst_n_inter_sync),
    .clk_en             (ctap_clk_en_inter[0] && clk_en_inter),
    .default_chipid             (14'b0),    // the first chip
    .default_coreid_x           (8'd0),
    .default_coreid_y           (8'd0),
    .flat_tileid                (`JTAG_FLATID_WIDTH'd0),
    // ucb from tiles to jtag
    .tile_jtag_ucb_val (tile0_jtag_ucb_val),
    .tile_jtag_ucb_data    (tile0_jtag_ucb_data),
    // ucb from jtag to tiles
    .jtag_tiles_ucb_val (jtag_tiles_ucb_val),
    .jtag_tiles_ucb_data    (jtag_tiles_ucb_data),

    .dyn0_dataIn_N      (dummy_out_S_noc1_data),
    .dyn0_dataIn_E      (dummy_out_W_noc1_data),
    .dyn0_dataIn_W      (offchip_out_E_noc1_data),
    .dyn0_dataIn_S      (dummy_out_N_noc1_data),
    .dyn0_validIn_N     (dummy_out_S_noc1_valid),
    .dyn0_validIn_E     (dummy_out_W_noc1_valid),
    .dyn0_validIn_W     (offchip_out_E_noc1_valid),
    .dyn0_validIn_S     (dummy_out_N_noc1_valid),
    .dyn0_dNo_yummy     (dummy_out_S_noc1_yummy),
    .dyn0_dEo_yummy     (dummy_out_W_noc1_yummy),
    .dyn0_dWo_yummy     (offchip_out_E_noc1_yummy),
    .dyn0_dSo_yummy     (dummy_out_N_noc1_yummy),

    .dyn0_dNo           (tile_0_0_out_N_noc1_data),
    .dyn0_dEo           (tile_0_0_out_E_noc1_data),
    .dyn0_dWo           (tile_0_0_out_W_noc1_data),
    .dyn0_dSo           (tile_0_0_out_S_noc1_data),
    .dyn0_dNo_valid     (tile_0_0_out_N_noc1_valid),
    .dyn0_dEo_valid     (tile_0_0_out_E_noc1_valid),
    .dyn0_dWo_valid     (tile_0_0_out_W_noc1_valid),
    .dyn0_dSo_valid     (tile_0_0_out_S_noc1_valid),
    .dyn0_yummyOut_N    (tile_0_0_out_N_noc1_yummy),
    .dyn0_yummyOut_E    (tile_0_0_out_E_noc1_yummy),
    .dyn0_yummyOut_W    (tile_0_0_out_W_noc1_yummy),
    .dyn0_yummyOut_S    (tile_0_0_out_S_noc1_yummy),
    .dyn1_dataIn_N      (dummy_out_S_noc2_data),
    .dyn1_dataIn_E      (dummy_out_W_noc2_data),
    .dyn1_dataIn_W      (offchip_out_E_noc2_data),
    .dyn1_dataIn_S      (dummy_out_N_noc2_data),
    .dyn1_validIn_N     (dummy_out_S_noc2_valid),
    .dyn1_validIn_E     (dummy_out_W_noc2_valid),
    .dyn1_validIn_W     (offchip_out_E_noc2_valid),
    .dyn1_validIn_S     (dummy_out_N_noc2_valid),
    .dyn1_dNo_yummy     (dummy_out_S_noc2_yummy),
    .dyn1_dEo_yummy     (dummy_out_W_noc2_yummy),
    .dyn1_dWo_yummy     (offchip_out_E_noc2_yummy),
    .dyn1_dSo_yummy     (dummy_out_N_noc2_yummy),

    .dyn1_dNo           (tile_0_0_out_N_noc2_data),
    .dyn1_dEo           (tile_0_0_out_E_noc2_data),
    .dyn1_dWo           (tile_0_0_out_W_noc2_data),
    .dyn1_dSo           (tile_0_0_out_S_noc2_data),
    .dyn1_dNo_valid     (tile_0_0_out_N_noc2_valid),
    .dyn1_dEo_valid     (tile_0_0_out_E_noc2_valid),
    .dyn1_dWo_valid     (tile_0_0_out_W_noc2_valid),
    .dyn1_dSo_valid     (tile_0_0_out_S_noc2_valid),
    .dyn1_yummyOut_N    (tile_0_0_out_N_noc2_yummy),
    .dyn1_yummyOut_E    (tile_0_0_out_E_noc2_yummy),
    .dyn1_yummyOut_W    (tile_0_0_out_W_noc2_yummy),
    .dyn1_yummyOut_S    (tile_0_0_out_S_noc2_yummy),
    .dyn2_dataIn_N      (dummy_out_S_noc3_data),
    .dyn2_dataIn_E      (dummy_out_W_noc3_data),
    .dyn2_dataIn_W      (offchip_out_E_noc3_data),
    .dyn2_dataIn_S      (dummy_out_N_noc3_data),
    .dyn2_validIn_N     (dummy_out_S_noc3_valid),
    .dyn2_validIn_E     (dummy_out_W_noc3_valid),
    .dyn2_validIn_W     (offchip_out_E_noc3_valid),
    .dyn2_validIn_S     (dummy_out_N_noc3_valid),
    .dyn2_dNo_yummy     (dummy_out_S_noc3_yummy),
    .dyn2_dEo_yummy     (dummy_out_W_noc3_yummy),
    .dyn2_dWo_yummy     (offchip_out_E_noc3_yummy),
    .dyn2_dSo_yummy     (dummy_out_N_noc3_yummy),

    .dyn2_dNo           (tile_0_0_out_N_noc3_data),
    .dyn2_dEo           (tile_0_0_out_E_noc3_data),
    .dyn2_dWo           (tile_0_0_out_W_noc3_data),
    .dyn2_dSo           (tile_0_0_out_S_noc3_data),
    .dyn2_dNo_valid     (tile_0_0_out_N_noc3_valid),
    .dyn2_dEo_valid     (tile_0_0_out_E_noc3_valid),
    .dyn2_dWo_valid     (tile_0_0_out_W_noc3_valid),
    .dyn2_dSo_valid     (tile_0_0_out_S_noc3_valid),
    .dyn2_yummyOut_N    (tile_0_0_out_N_noc3_yummy),
    .dyn2_yummyOut_E    (tile_0_0_out_E_noc3_yummy),
    .dyn2_yummyOut_W    (tile_0_0_out_W_noc3_yummy),
    .dyn2_yummyOut_S    (tile_0_0_out_S_noc3_yummy)
);



wire                          proc_oram_valid;
wire [`NOC_DATA_WIDTH-1:0]    proc_oram_data;
reg                           proc_oram_yummy;

reg                           oram_proc_valid;
reg  [`NOC_DATA_WIDTH-1:0]    oram_proc_data;
wire                          oram_proc_yummy;

wire                          offchip_oram_valid;
wire [`NOC_DATA_WIDTH-1:0]    offchip_oram_data;
reg                           offchip_oram_yummy;

reg                           oram_offchip_valid;
reg  [`NOC_DATA_WIDTH-1:0]    oram_offchip_data;
wire                          oram_offchip_yummy;

wire                          proc_oram_yummy_oram;
wire                          oram_proc_valid_oram;
wire [`NOC_DATA_WIDTH-1:0]    oram_proc_data_oram;
wire                          offchip_oram_yummy_oram;
wire                          oram_offchip_valid_oram;
wire [`NOC_DATA_WIDTH-1:0]    oram_offchip_data_oram;

// trin: off-chip channel mux when disabling oram
always @ *
begin
  // default is bypassing
  oram_offchip_valid = proc_oram_valid;
  oram_offchip_data = proc_oram_data;
  proc_oram_yummy = oram_offchip_yummy;
  oram_proc_valid = offchip_oram_valid;
  oram_proc_data = offchip_oram_data;
  offchip_oram_yummy = oram_proc_yummy;

  if (oram_on_inter)
  begin
    oram_offchip_valid = oram_offchip_valid_oram;
    oram_offchip_data = oram_offchip_data_oram;
    proc_oram_yummy = proc_oram_yummy_oram;
    oram_proc_valid = oram_proc_valid_oram;
    oram_proc_data = oram_proc_data_oram;
    offchip_oram_yummy = offchip_oram_yummy_oram;
  end
end




assign proc_oram_valid = tile_0_0_out_W_noc2_valid;
assign proc_oram_data = tile_0_0_out_W_noc2_data;

assign oram_proc_yummy = tile_0_0_out_W_noc3_yummy;

assign offchip_oram_valid = offchip_processor_noc3_valid;
assign offchip_oram_data = offchip_processor_noc3_data;

assign oram_offchip_yummy = offchip_processor_noc2_yummy;

assign processor_offchip_noc1_valid = tile_0_0_out_W_noc1_valid;
assign processor_offchip_noc1_data = tile_0_0_out_W_noc1_data;
assign processor_offchip_noc1_yummy = tile_0_0_out_W_noc1_yummy;
assign processor_offchip_noc2_valid = oram_offchip_valid;
assign processor_offchip_noc2_data = oram_offchip_data;
assign processor_offchip_noc2_yummy = tile_0_0_out_W_noc2_yummy;
assign processor_offchip_noc3_valid = tile_0_0_out_W_noc3_valid;
assign processor_offchip_noc3_data = tile_0_0_out_W_noc3_data;
assign processor_offchip_noc3_yummy = offchip_oram_yummy;

assign offchip_out_E_noc1_data = offchip_processor_noc1_data;
assign offchip_out_E_noc1_valid = offchip_processor_noc1_valid;
assign offchip_out_E_noc1_yummy = offchip_processor_noc1_yummy;
assign offchip_out_E_noc2_data = offchip_processor_noc2_data;
assign offchip_out_E_noc2_valid = offchip_processor_noc2_valid;
assign offchip_out_E_noc2_yummy = proc_oram_yummy; //going to processor
assign offchip_out_E_noc3_data = oram_proc_data;
assign offchip_out_E_noc3_valid = oram_proc_valid;
assign offchip_out_E_noc3_yummy = offchip_processor_noc3_yummy;

////////////////////////////////////////////////////////
// chip to fpga bridge
////////////////////////////////////////////////////////

    wire                         chip_intf_noc1_valid;
    wire [`NOC_DATA_WIDTH-1:0]   chip_intf_noc1_data;
    wire                         chip_intf_noc1_rdy;
    wire                         chip_intf_noc2_valid;
    wire [`NOC_DATA_WIDTH-1:0]   chip_intf_noc2_data;
    wire                         chip_intf_noc2_rdy;
    wire                         chip_intf_noc3_valid;
    wire [`NOC_DATA_WIDTH-1:0]   chip_intf_noc3_data;
    wire                         chip_intf_noc3_rdy;

    wire                         intf_chip_noc1_valid;
    wire [`NOC_DATA_WIDTH-1:0]   intf_chip_noc1_data;
    wire                         intf_chip_noc1_rdy;
    wire                         intf_chip_noc2_valid;
    wire [`NOC_DATA_WIDTH-1:0]   intf_chip_noc2_data;
    wire                         intf_chip_noc2_rdy;
    wire                         intf_chip_noc3_valid;
    wire [`NOC_DATA_WIDTH-1:0]   intf_chip_noc3_data;
    wire                         intf_chip_noc3_rdy;


    valrdy_to_credit #(4, 3) chip_from_intf_noc1_v2c(
       .clk(clk_muxed),
       .reset(~rst_n_inter_sync_f),
       .data_in(intf_chip_noc1_data),
       .valid_in(intf_chip_noc1_valid),
       .ready_in(chip_intf_noc1_rdy),

       .data_out(offchip_processor_noc1_data),           // Data
       .valid_out(offchip_processor_noc1_valid),       // Val signal
       .yummy_out(processor_offchip_noc1_yummy)    // Yummy signal
    );

    credit_to_valrdy chip_to_intf_noc1_c2v(
       .clk(clk_muxed),
       .reset(~rst_n_inter_sync_f),
       .data_in(processor_offchip_noc1_data),
       .valid_in(processor_offchip_noc1_valid),
       .yummy_in(offchip_processor_noc1_yummy),

       .data_out(chip_intf_noc1_data),           // Data
       .valid_out(chip_intf_noc1_valid),       // Val signal from dynamic network to processor
       .ready_out(intf_chip_noc1_rdy)    // Rdy signal from processor to dynamic network
    );


    valrdy_to_credit #(4, 3) chip_from_intf_noc2_v2c(
       .clk(clk_muxed),
       .reset(~rst_n_inter_sync_f),
       .data_in(intf_chip_noc2_data),
       .valid_in(intf_chip_noc2_valid),
       .ready_in(chip_intf_noc2_rdy),

       .data_out(offchip_processor_noc2_data),           // Data
       .valid_out(offchip_processor_noc2_valid),       // Val signal
       .yummy_out(processor_offchip_noc2_yummy)    // Yummy signal
    );

    credit_to_valrdy chip_to_intf_noc2_c2v(
       .clk(clk_muxed),
       .reset(~rst_n_inter_sync_f),
       .data_in(processor_offchip_noc2_data),
       .valid_in(processor_offchip_noc2_valid),
       .yummy_in(offchip_processor_noc2_yummy),

       .data_out(chip_intf_noc2_data),           // Data
       .valid_out(chip_intf_noc2_valid),       // Val signal from dynamic network to processor
       .ready_out(intf_chip_noc2_rdy)    // Rdy signal from processor to dynamic network
    );

    valrdy_to_credit #(4, 3) chip_from_intf_noc3_v2c(
       .clk(clk_muxed),
       .reset(~rst_n_inter_sync_f),
       .data_in(intf_chip_noc3_data),
       .valid_in(intf_chip_noc3_valid),
       .ready_in(chip_intf_noc3_rdy),

       .data_out(offchip_processor_noc3_data),           // Data
       .valid_out(offchip_processor_noc3_valid),       // Val signal
       .yummy_out(processor_offchip_noc3_yummy)    // Yummy signal
    );

    credit_to_valrdy chip_to_intf_noc3_c2v(
       .clk(clk_muxed),
       .reset(~rst_n_inter_sync_f),
       .data_in(processor_offchip_noc3_data),
       .valid_in(processor_offchip_noc3_valid),
       .yummy_in(offchip_processor_noc3_yummy),

       .data_out(chip_intf_noc3_data),           // Data
       .valid_out(chip_intf_noc3_valid),       // Val signal from dynamic network to processor
       .ready_out(intf_chip_noc3_rdy)    // Rdy signal from processor to dynamic network
    );


   reg  [31:0]                 intf_chip_data_inter_buf_f;
   reg  [1:0]                  intf_chip_channel_inter_buf_f;
   reg  [2:0]                  chip_intf_credit_back_inter_buf_f;


    always @(posedge io_clk_inter) 
    begin
        if(~rst_n_inter_sync_f)
        begin
            intf_chip_data_inter_buf_f <= 0;
            intf_chip_channel_inter_buf_f <= 0;
            chip_intf_credit_back_inter_buf_f <= 0; 
        end
        else
        begin
            intf_chip_data_inter_buf_f <= intf_chip_data_inter;
            intf_chip_channel_inter_buf_f <= intf_chip_channel_inter;
            chip_intf_credit_back_inter_buf_f <= chip_intf_credit_back_inter; 
        end
    end

    chip_bridge chip_intf(
        .rst_n                  (rst_n_inter_sync_f),
        .chip_clk               (clk_muxed),
        .intcnct_clk            (io_clk_inter),
        .async_mux              (async_mux_inter),
        .network_out_1          (chip_intf_noc1_data),
        .network_out_2          (chip_intf_noc2_data),
        .network_out_3          (chip_intf_noc3_data),
        .data_out_val_1         (chip_intf_noc1_valid),
        .data_out_val_2         (chip_intf_noc2_valid),
        .data_out_val_3         (chip_intf_noc3_valid),
        .data_out_rdy_1         (intf_chip_noc1_rdy),
        .data_out_rdy_2         (intf_chip_noc2_rdy),
        .data_out_rdy_3         (intf_chip_noc3_rdy),
        .intcnct_data_in        (intf_chip_data_inter_buf_f),
        .intcnct_channel_in     (intf_chip_channel_inter_buf_f),
        .intcnct_credit_back_in (intf_chip_credit_back_inter),
        .network_in_1           (intf_chip_noc1_data),
        .network_in_2           (intf_chip_noc2_data),
        .network_in_3           (intf_chip_noc3_data),
        .data_in_val_1          (intf_chip_noc1_valid),
        .data_in_val_2          (intf_chip_noc2_valid),
        .data_in_val_3          (intf_chip_noc3_valid),
        .data_in_rdy_1          (chip_intf_noc1_rdy),
        .data_in_rdy_2          (chip_intf_noc2_rdy),
        .data_in_rdy_3          (chip_intf_noc3_rdy),
        .intcnct_data_out       (chip_intf_data_inter),
        .intcnct_channel_out    (chip_intf_channel_inter),
        .intcnct_credit_back_out(chip_intf_credit_back_inter_buf_f)
    );

/////////////////////////////////////////////////
// on-chip jtag interface & test access port
/////////////////////////////////////////////////

// merge all outputs from tiles together
wire tiles_jtag_ucb_val;
wire [`UCB_BUS_WIDTH-1:0] tiles_jtag_ucb_data;
assign tiles_jtag_ucb_val = tile0_jtag_ucb_val;
assign tiles_jtag_ucb_data = tile0_jtag_ucb_data;


jtag jtag_port(
    .clk(clk_muxed),
    .rst_n(rst_n_inter_sync_f),
    .jtag_clk(jtag_clk_inter),
    .jtag_rst_l(jtag_rst_l_inter_sync),
    .jtag_modesel(jtag_modesel_inter),
    .jtag_datain(jtag_datain_inter),
    .jtag_dataout(jtag_dataout_inter),
    .jtag_dataout_en(),
    .jtag_tiles_ucb_val(jtag_tiles_ucb_val),
    .jtag_tiles_ucb_data(jtag_tiles_ucb_data),
    .tiles_jtag_ucb_val(tiles_jtag_ucb_val),
    .tiles_jtag_ucb_data(tiles_jtag_ucb_data),

    .ctap_oram_req_val(ctap_oram_req_val),
    .ctap_oram_req_misc(ctap_oram_req_misc),
    .oram_ctap_res_data(oram_ctap_res_data),
    // .ctap_oram_bist_command(ctap_oram_bist_command),
    // .ctap_oram_bist_data(ctap_oram_bist_data),
    // .oram_ctap_sram_data(oram_ctap_sram_data),

    .ctap_clk_en(ctap_clk_en_inter),
    .ctap_oram_clk_en(ctap_oram_clk_en)
    );

//////////////////////////////////////////////////
// pll and clk mux
//////////////////////////////////////////////////


assign clk_muxed = core_ref_clk_inter;
// assign pll_clk = core_ref_clk_inter;
// initial
// begin
//   force pll_lock_inter = 1'b0;
//   wait(pll_rst_n_inter == 1'b0);
//   wait(pll_rst_n_inter == 1'b1);
//   repeat(100)@(posedge core_ref_clk_inter);
//   force pll_lock_inter = 1'b1;
// end


endmodule

`endif
