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

`include "define.tmp.h"
`include "mc_define.h"

// Filename: memctrl_test.v
// Author: mmckeown
// Description: This module implements multiple tests for
//              the chipset memory controller.  The switch
//              inputs control the addressing mode and
//              test mode as below.
//
//              sw[2:0] - Addressing mode
//                  3'b000 - 0 Byte   (NOT SUPPORTED BY MEMORY CONTROLLER)
//                  3'b001 - 1 Bytes  (NOT SUPPORTED BY MEMORY CONTROLLER)
//                  3'b010 - 2 Bytes  (NOT SUPPORTED BY MEMORY CONTROLLER)
//                  3'b011 - 4 Bytes  (NOT SUPPORTED BY MEMORY CONTROLLER)
//                  3'b100 - 8 Bytes  (NOT SUPPORTED BY MEMORY CONTROLLER)
//                  3'b101 - 16 Bytes (NOT SUPPORTED BY MEMORY CONTROLLER)
//                  3'b110 - 32 Bytes (NOT SUPPORTED BY MEMORY CONTROLLER)
//                  3'b111 - 64 Bytes
//              sw[7:3] - Test mode
//                  5'd0 - Sequential walking ones test
//                  5'd1 - Sequential address own test
//                  5'd2 - Sequential random test
//                  5'd3 - Parallel address own test
//                  5'd4 - Parallel random data test (sequential address)
//                  5'd5-5'd31 - Reserved
//
//              The output LEDs can be read as below.
//
//              led[0] - clock locked
//              led[1] - logic reset (active low)
//              led[2] - logic reset and not DRAM calibration complete (active low)
//              led[3] - test running
//              led[4] - test done
//              led[5] - test timeout
//              led[7:6] - test passed

module memctrl_test(
`ifndef PITON_MEMCTRL_TEST_SIM_CLKS
`ifdef PITON_CHIPSET_DIFF_CLK
    input                                       clk_osc_p,
    input                                       clk_osc_n,
`else // ifndef PITON_CHIPSET_DIFF_CLK
    input                                       clk_osc,
`endif // endif PITON_CHIPSET_DIFF_CLK
`else // ifdef PITON_MEMCTRL_TEST_SIM_CLKS
    input                                       test_sys_clk,
    input                                       mc_sys_clk,                             
`endif

    input                                       rst_n,

    input  [7:0]                                sw,

    output [7:0]                                led,

    // DDR interface
    output [`DDR3_ADDR_WIDTH-1:0]               ddr_addr,
    output [`DDR3_BA_WIDTH-1:0]                 ddr_ba,
    output                                      ddr_cas_n,
    output [`DDR3_CK_WIDTH-1:0]                 ddr_ck_n,
    output [`DDR3_CK_WIDTH-1:0]                 ddr_ck_p,
    output [`DDR3_CKE_WIDTH-1:0]                ddr_cke,
    output                                      ddr_ras_n,
    output                                      ddr_reset_n,
    output                                      ddr_we_n,
    inout  [`DDR3_DQ_WIDTH-1:0]                 ddr_dq,
    inout  [`DDR3_DQS_WIDTH-1:0]                ddr_dqs_n,
    inout  [`DDR3_DQS_WIDTH-1:0]                ddr_dqs_p,
`ifndef NEXYSVIDEO_BOARD
    output [`DDR3_CS_WIDTH-1:0]                 ddr_cs_n,
`endif // endif NEXYSVIDEO_BOARD
    output [`DDR3_DM_WIDTH-1:0]                 ddr_dm,
    output                                      ddr_odt
);

///////////////////////
// Type declarations //
///////////////////////

`ifdef PITON_MEMCTRL_TEST_MINI_TEST
parameter                                   MEMSIZE_BYTES = 1024;
parameter                                   MEMSIZE_BYTES_LOG2 = 10;
`elsif GENESYS2_BOARD
parameter                                   MEMSIZE_BYTES = 1073741824;
parameter                                   MEMSIZE_BYTES_LOG2 = 30;
`endif

// SW values
localparam                                  ADDRESSING_MODE_BITS_HI = 2;
localparam                                  ADDRESSING_MODE_BITS_LO = 0;

localparam                                  TEST_MODE_BITS_HI = 7;
localparam                                  TEST_MODE_BITS_LO = 3;

localparam                                  TEST_SEQ_WALKING_ONES = 5'd0;
localparam                                  TEST_SEQ_ADDRESS_OWN = 5'd1;
localparam                                  TEST_SEQ_RANDOM = 5'd2;
localparam                                  TEST_PAR_ADDRESS_OWN = 5'd3;
localparam                                  TEST_PAR_RANDOM_DATA = 5'd4;

// Decoded address increment value and data payload num flits
reg  [`PHY_ADDR_WIDTH-1:0]                  addr_incr_val;
reg  [7:0]                                  data_payload_flits;
reg  [`PHY_ADDR_WIDTH-1:0]                  mem_top_addr;

// Decoded test mode one-hot enable bits
reg  [4:0]                                  test_mode_en;
reg                                         test_seq_en;
reg                                         test_par_en;

wire                                        clk_locked;

`ifndef PITON_MEMCTRL_TEST_SIM_CLKS
// Clocks
wire                                        test_sys_clk;
wire                                        mc_sys_clk;
`endif // PITON_MEMCTRL_TEST_SIM_CLKS

// Resets
reg                                         rst_n_rect;
reg                                         rst_n_combined;
reg                                         rst_n_combined_f;
reg                                         rst_n_combined_ff;
reg                                         test_sys_rst_n;

wire                                        init_calib_complete;
reg                                         init_calib_complete_f;
reg                                         init_calib_complete_ff;

// Memory controller interface
reg                                         test_mc_val;
reg  [`NOC_DATA_WIDTH-1:0]                  test_mc_data;
wire                                        test_mc_rdy;

wire                                        mc_test_val;
wire [`NOC_DATA_WIDTH-1:0]                  mc_test_data;
reg                                         mc_test_rdy;

wire                                        mc_flit_in_val;
wire [`NOC_DATA_WIDTH-1:0]                  mc_flit_in_data;
wire                                        mc_flit_in_rdy;

wire                                        mc_flit_out_val;
wire [`NOC_DATA_WIDTH-1:0]                  mc_flit_out_data;
wire                                        mc_flit_out_rdy;

// Individual test driver memory controller interfaces
wire                                        seq_test_mc_val;
wire [`NOC_DATA_WIDTH-1:0]                  seq_test_mc_data;
wire                                        seq_mc_test_rdy;

wire                                        par_test_mc_val;
wire [`NOC_DATA_WIDTH-1:0]                  par_test_mc_data;
wire                                        par_mc_test_rdy;

// Individual test driver done and passed signals
wire                                        seq_test_running;
wire                                        seq_test_done;
wire                                        seq_test_timeout;
wire                                        seq_test_passed;

wire                                        par_test_running;
wire                                        par_test_done;
wire                                        par_test_timeout;
wire                                        par_test_passed;

// Aggregate test done and passed
reg                                         test_running;
reg                                         test_done;
reg                                         test_timeout;
reg                                         test_passed;

//////////////////////
// Sequential Logic //
//////////////////////

// Synchronize resets
always @ (posedge test_sys_clk)
begin
    rst_n_combined_f <= rst_n_combined;
    rst_n_combined_ff <= rst_n_combined_f;

    init_calib_complete_f <= init_calib_complete;
    init_calib_complete_ff <= init_calib_complete_f;
end

/////////////////////////
// Combinational Logic //
/////////////////////////

// Decode address increment value and data playload flits based on addressing mode
always @ *
begin
    case (sw[ADDRESSING_MODE_BITS_HI:ADDRESSING_MODE_BITS_LO])
        3'd0:
        begin
            addr_incr_val = {`PHY_ADDR_WIDTH{1'b0}};
            data_payload_flits = 8'd1;
            mem_top_addr = {`PHY_ADDR_WIDTH{1'b0}};
        end
        3'd1:
        begin
            addr_incr_val = {{`PHY_ADDR_WIDTH-7{1'b0}}, 7'd1};;
            data_payload_flits = 8'd1;
            mem_top_addr = {{`PHY_ADDR_WIDTH-MEMSIZE_BYTES_LOG2{1'b0}}, {MEMSIZE_BYTES_LOG2{1'b1}}};
        end
        3'd2:
        begin
            addr_incr_val = {{`PHY_ADDR_WIDTH-7{1'b0}}, 7'd2};
            data_payload_flits = 8'd1;
            mem_top_addr = {{`PHY_ADDR_WIDTH-MEMSIZE_BYTES_LOG2{1'b0}}, {MEMSIZE_BYTES_LOG2-1{1'b1}}, 1'd0};
        end
        3'd3:
        begin
            addr_incr_val = {{`PHY_ADDR_WIDTH-7{1'b0}}, 7'd4};
            data_payload_flits = 8'd1;
            mem_top_addr = {{`PHY_ADDR_WIDTH-MEMSIZE_BYTES_LOG2{1'b0}}, {MEMSIZE_BYTES_LOG2-2{1'b1}}, 2'd0};
        end
        3'd4:
        begin
            addr_incr_val = {{`PHY_ADDR_WIDTH-7{1'b0}}, 7'd8};
            data_payload_flits = 8'd1;
            mem_top_addr = {{`PHY_ADDR_WIDTH-MEMSIZE_BYTES_LOG2{1'b0}}, {MEMSIZE_BYTES_LOG2-3{1'b1}}, 3'd0};
        end
        3'd5:
        begin
            addr_incr_val = {{`PHY_ADDR_WIDTH-7{1'b0}}, 7'd16};
            data_payload_flits = 8'd2;
            mem_top_addr = {{`PHY_ADDR_WIDTH-MEMSIZE_BYTES_LOG2{1'b0}}, {MEMSIZE_BYTES_LOG2-4{1'b1}}, 4'd0};
        end
        3'd6:
        begin
            addr_incr_val = {{`PHY_ADDR_WIDTH-7{1'b0}}, 7'd32};
            data_payload_flits = 8'd4;
            mem_top_addr = {{`PHY_ADDR_WIDTH-MEMSIZE_BYTES_LOG2{1'b0}}, {MEMSIZE_BYTES_LOG2-5{1'b1}}, 5'd0};
        end
        3'd7:
        begin
            addr_incr_val = {{`PHY_ADDR_WIDTH-7{1'b0}}, 7'd64};
            data_payload_flits = 8'd8;
            mem_top_addr = {{`PHY_ADDR_WIDTH-MEMSIZE_BYTES_LOG2{1'b0}}, {MEMSIZE_BYTES_LOG2-6{1'b1}}, 6'd0};
        end
        default:
        begin
            addr_incr_val = {`PHY_ADDR_WIDTH{1'bx}};
            data_payload_flits = 8'dx;
            mem_top_addr = {`PHY_ADDR_WIDTH{1'bx}};
        end
    endcase
end

// Decode test mode into one-hot enable bits
always @ *
begin
    case (sw[TEST_MODE_BITS_HI:TEST_MODE_BITS_LO])
        TEST_SEQ_WALKING_ONES:
        begin
            test_mode_en = 5'd1; 
            test_seq_en = 1'b1;
            test_par_en = 1'b0;
        end
        TEST_SEQ_ADDRESS_OWN:
        begin
            test_mode_en = 5'd2;
            test_seq_en = 1'b1;
            test_par_en = 1'b0;
        end
        TEST_SEQ_RANDOM:
        begin
            test_mode_en = 5'd4;
            test_seq_en = 1'b1;
            test_par_en = 1'b0;
        end
        TEST_PAR_ADDRESS_OWN:
        begin
            test_mode_en = 5'd8;
            test_seq_en = 1'b0;
            test_par_en = 1'b1;
        end
        TEST_PAR_RANDOM_DATA:
        begin
            test_mode_en = 5'd16;
            test_seq_en = 1'b0;
            test_par_en = 1'b1;
        end
        default: 
        begin
            test_mode_en = 4'd0;
            test_seq_en = 1'b0;
            test_par_en = 1'b0;
        end
    endcase
end

// Multiplex memory controller and test passed bits
always @ *
begin
    if (test_seq_en)
    begin
        test_mc_val = seq_test_mc_val;
        test_mc_data = seq_test_mc_data;
        mc_test_rdy = seq_mc_test_rdy;
        test_running = seq_test_running;
        test_done = seq_test_done;
        test_timeout = seq_test_timeout;
        test_passed = seq_test_passed; 
    end
    else if (test_par_en)
    begin
        test_mc_val = par_test_mc_val;
        test_mc_data = par_test_mc_data;
        mc_test_rdy = par_mc_test_rdy;
        test_running = par_test_running;
        test_done = par_test_done;
        test_timeout = par_test_timeout;
        test_passed = par_test_passed;
    end
    else
    begin
        test_mc_val = 1'b0;
        test_mc_data = {`NOC_DATA_WIDTH{1'b0}};
        mc_test_rdy = 1'b0;
        test_running = 1'b0;
        test_done = 1'b1;
        test_timeout = 1'b0;
        test_passed = 1'b0;
    end
end

`ifndef PITON_MEMCTRL_TEST_INC_MEMIO_SPLITTER
assign mc_flit_in_val = test_mc_val;
assign mc_flit_in_data = test_mc_data;
assign test_mc_rdy = mc_flit_in_rdy;

assign mc_test_val = mc_flit_out_val;
assign mc_test_data = mc_flit_out_data;
assign mc_flit_out_rdy = mc_test_rdy;
`endif

// Correct reset sense if needed
always @ *
begin
`ifdef PITON_FPGA_RST_ACT_HIGH
    rst_n_rect = ~rst_n;
`else // ifndef PITON_FPGA_RST_ACT_HIGH
    rst_n_rect = rst_n;
`endif // endif PITON_FPGA_RST_ACT_HIGH
end

// Create combined resets
always @ *
begin
    rst_n_combined = rst_n_rect & clk_locked;
    test_sys_rst_n = rst_n_combined_ff & init_calib_complete_ff;
end

`ifdef PITON_MEMCTRL_TEST_SIM_CLKS
assign clk_locked = 1'b1;
`endif // PITON_MEMCTRL_TEST_SIM_CLKS

assign led[0] = clk_locked;
assign led[1] = rst_n_combined_ff;
assign led[2] = test_sys_rst_n;
assign led[3] = test_running;
assign led[4] = test_done;
assign led[5] = test_timeout;
assign led[7:6] = {2{test_passed}};

//////////////////////////
// Sub-module Instances //
//////////////////////////

`ifndef PITON_MEMCTRL_TEST_SIM_CLKS
clk_mmcm_memio_unit_tests clk_mmcm_memio_unit_tests (
`ifdef PITON_CHIPSET_DIFF_CLK
    .clk_in1_p(clk_osc_p),
    .clk_in1_n(clk_osc_n),
`else // ifndef PITON_CHIPSET_DIFF_CLK
    .clk_in1(clk_osc),
`endif // PITON_CHIPSET_DIFF_CLK

    .reset(1'b0),
    .locked(clk_locked),

    .test_sys_clk(test_sys_clk),
    .mc_sys_clk(mc_sys_clk)
);
`endif // PITON_MEMCTRL_TEST_SIM_CLKS

// Sequential test driver
mem_test_seq_driver mem_test_seq_driver (
    .clk(test_sys_clk),
    .rst_n(test_sys_rst_n),
    .en(test_seq_en),

    .test_mode_en(test_mode_en[2:0]),
    
    .addr_mode(sw[ADDRESSING_MODE_BITS_HI:ADDRESSING_MODE_BITS_LO]),
    .addr_incr_val(addr_incr_val),
    .data_payload_flits(data_payload_flits),
    .mem_top_addr(mem_top_addr),

    .test_mem_val(seq_test_mc_val),
    .test_mem_data(seq_test_mc_data),
    .test_mem_rdy(test_mc_rdy),

    .mem_test_val(mc_test_val),
    .mem_test_data(mc_test_data),
    .mem_test_rdy(seq_mc_test_rdy),

    .test_running(seq_test_running),
    .test_done(seq_test_done),
    .test_timeout(seq_test_timeout),
    .test_passed(seq_test_passed)
);

// Parallel test driver
mem_test_par_driver mem_test_par_driver (
    .clk(test_sys_clk),
    .rst_n(test_sys_rst_n),
    .en(test_par_en),

    .test_mode_en(test_mode_en[4:3]),

    .addr_mode(sw[ADDRESSING_MODE_BITS_HI:ADDRESSING_MODE_BITS_LO]),
    .addr_incr_val(addr_incr_val),
    .data_payload_flits(data_payload_flits),
    .mem_top_addr(mem_top_addr),

    .test_mem_val(par_test_mc_val),
    .test_mem_data(par_test_mc_data),
    .test_mem_rdy(test_mc_rdy),

    .mem_test_val(mc_test_val),
    .mem_test_data(mc_test_data),
    .mem_test_rdy(par_mc_test_rdy),

    .test_running(par_test_running),
    .test_done(par_test_done),
    .test_timeout(par_test_timeout),
    .test_passed(par_test_passed)
);

`ifdef PITON_MEMCTRL_TEST_INC_MEMIO_SPLITTER
mem_io_splitter mem_io_splitter(
    .clk(test_sys_clk),
    .rst(~test_sys_rst_n),

    .uart_boot_en(1'b0),

    // NoC1 into splitter (only I/O uses Noc1 input)
    .noc1_splitter_val (1'b0),
    .noc1_splitter_data ({`NOC_DATA_WIDTH{1'b0}}),
    .splitter_noc1_rdy (),

    // NoC2 into splitter
    .noc2_splitter_val(test_mc_val),
    .noc2_splitter_data(test_mc_data),
    .splitter_noc2_rdy(test_mc_rdy),

    // NoC3 into splitter not used

    // Splitter output to NoC1 (not used)
    .splitter_noc1sink_val (),
    .splitter_noc1sink_data (),
    .noc1sink_splitter_rdy (1'b0),

    // Splitter output to NoC2 not used

    // Splitter output to NoC3
    .splitter_noc3_val(mc_test_val),
    .splitter_noc3_data(mc_test_data),
    .noc3_splitter_rdy(mc_test_rdy),

    // Splitter to memory interface
    .splitter_mem_val(mc_flit_in_val),
    .splitter_mem_data(mc_flit_in_data),
    .mem_splitter_rdy(mc_flit_in_rdy),

    // Memory to splitter interface
    .mem_splitter_val(mc_flit_out_val),
    .mem_splitter_data(mc_flit_out_data),
    .splitter_mem_rdy(mc_flit_out_rdy),

    // Splitter to I/O interface
    .splitter_io_val(),
    .splitter_io_data(),
    .io_splitter_rdy(1'b0),

    // I/O to splitter interface
    .io_splitter_val(1'b0),
    .io_splitter_data({`NOC_DATA_WIDTH{1'b0}}),
    .splitter_io_rdy(),

    .test_good_end(),
    .test_bad_end()
);
`endif

// Memory controller dut
mc_top mc_top(
    .mc_ui_clk_sync_rst(),

    .core_ref_clk(test_sys_clk),

    .sys_clk(mc_sys_clk),

    .sys_rst_n(rst_n_combined_ff),

    .mc_flit_in_val(mc_flit_in_val),
    .mc_flit_in_data(mc_flit_in_data),
    .mc_flit_in_rdy(mc_flit_in_rdy),

    .mc_flit_out_val(mc_flit_out_val),
    .mc_flit_out_data(mc_flit_out_data),
    .mc_flit_out_rdy(mc_flit_out_rdy),

    .uart_boot_en(1'b0),

    .ddr_addr(ddr_addr),
    .ddr_ba(ddr_ba),
    .ddr_cas_n(ddr_cas_n),
    .ddr_ck_n(ddr_ck_n),
    .ddr_ck_p(ddr_ck_p),
    .ddr_cke(ddr_cke),
    .ddr_ras_n(ddr_ras_n),
    .ddr_reset_n(ddr_reset_n),
    .ddr_we_n(ddr_we_n),
    .ddr_dq(ddr_dq),
    .ddr_dqs_n(ddr_dqs_n),
    .ddr_dqs_p(ddr_dqs_p),
`ifndef NEXYSVIDEO_BOARD
    .ddr_cs_n(ddr_cs_n),
`endif // endif NEXYSVIDEO_BOARD
    .ddr_dm(ddr_dm),
    .ddr_odt(ddr_odt),

    .init_calib_complete_out(init_calib_complete)
);

endmodule
