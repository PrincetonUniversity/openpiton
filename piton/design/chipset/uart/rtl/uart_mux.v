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

//--------------------------------------------------
// Description:     Multiplexer for accessing UART. If UART_DMW is now enabled, UART is always connected
//                  to a core. Otherwise switches AXI interface between ATG, writer, reader, and core 
// Author:          Alexey Lavrov
// Company:         Princeton University
// Created:         1/18/2016
//--------------------------------------------------
`include "uart16550_define.vh"
`include "chipset_define.vh"

module uart_mux (
    input               axi_clk,
    input               axi_rst_n,

    input               uart_boot_en,
    input               uart_timeout_en,

    input               init_done,
    
    output              writer_start,
    input               writer_finish,
    output  reg [2:0]   writer_str_sel,

    output              reader_start,
    input               reader_stop,

    output              test_start,
    input               test_good_end,
    input               test_bad_end,

    // init ATG <-> uart_mux
    input   [12:0]      init_axi_awaddr, 
    input               init_axi_awvalid,
    output              init_axi_awready,

    input   [31:0]      init_axi_wdata,  
    input   [3:0 ]      init_axi_wstrb,  
    input               init_axi_wvalid, 
    output              init_axi_wready, 

    output  [1:0]       init_axi_bresp,  
    output              init_axi_bvalid, 
    input               init_axi_bready,

    // UART writer <-> MUX
    input   [12:0]      writer_axi_awaddr,
    input               writer_axi_awvalid,
    output              writer_axi_awready,
    input   [31:0]      writer_axi_wdata,
    input   [3:0]       writer_axi_wstrb,
    input               writer_axi_wvalid,
    output              writer_axi_wready,
    output  [1:0]       writer_axi_bresp,
    output              writer_axi_bvalid,
    input               writer_axi_bready,
    input   [31:0]      writer_axi_araddr,
    input               writer_axi_arvalid,
    output              writer_axi_arready,
    output  [31:0]      writer_axi_rdata,
    output  [1:0]       writer_axi_rresp,
    output              writer_axi_rvalid,
    input               writer_axi_rready,

    // Piton Core <-> MUX
    input   [12:0]      core_axi_awaddr,
    input               core_axi_awvalid,
    output              core_axi_awready,
    input   [31:0]      core_axi_wdata,
    input   [3:0]       core_axi_wstrb,
    input               core_axi_wvalid,
    output              core_axi_wready,
    output  [1:0]       core_axi_bresp,
    output              core_axi_bvalid,
    input               core_axi_bready,
    input   [31:0]      core_axi_araddr,
    input               core_axi_arvalid,
    output              core_axi_arready,
    output  [31:0]      core_axi_rdata,
    output  [1:0]       core_axi_rresp,
    output              core_axi_rvalid,
    input               core_axi_rready,

    // UART reader <-> MUX
    input   [31:0]      reader_axi_araddr,
    input               reader_axi_arvalid,
    output              reader_axi_arready,
    output  [31:0]      reader_axi_rdata,
    output  [1:0]       reader_axi_rresp,
    output              reader_axi_rvalid,
    input               reader_axi_rready,

    // MUX <-> UART
    output   reg    [12:0]  s_axi_awaddr,
    output   reg            s_axi_awvalid,
    input                   s_axi_awready,

    output   reg    [31:0]  s_axi_wdata,
    output   reg    [3:0 ]  s_axi_wstrb,
    output   reg            s_axi_wvalid,
    input                   s_axi_wready,

    input           [1:0]   s_axi_bresp,
    input                   s_axi_bvalid,
    output   reg            s_axi_bready,

    output   reg    [12:0]  s_axi_araddr,
    output   reg            s_axi_arvalid,
    input                   s_axi_arready,

    input           [31:0]  s_axi_rdata,
    input           [1:0]   s_axi_rresp,
    input                   s_axi_rvalid,
    output   reg            s_axi_rready
);

localparam INIT_SEL         = 0;
localparam WRITER_SEL       = 1;
localparam READER_SEL       = 2;
localparam TEST_SEL         = 3;

wire [2:0]  mux_sel_rst_state;
wire        asm_test_timeout;
wire                    pc_good_trap;
wire                    pc_bad_trap;

reg     [2:0]       mux_sel;
reg     [63:0]      asm_test_cycle_cnt;
reg                 uart_boot_en_ff;
reg                 uart_timeout_en_ff;

always @(posedge axi_clk) begin
    uart_boot_en_ff <= uart_boot_en;
    uart_timeout_en_ff <= uart_timeout_en;
end

assign mux_sel_rst_state  = uart_boot_en_ff ? INIT_SEL : TEST_SEL ;

always @(posedge axi_clk) begin
    if (~axi_rst_n) begin
        mux_sel <= mux_sel_rst_state;
        writer_str_sel <= `CFG_DONE_STRING;
    end
    else begin
        case (mux_sel)
        INIT_SEL: begin
            if (init_done) begin
                mux_sel <= WRITER_SEL;
                writer_str_sel <= `CFG_DONE_STRING;
            end
        end
        WRITER_SEL: begin
            if (writer_finish) begin
                mux_sel <= READER_SEL;
            end
        end
        READER_SEL: begin
            if (reader_stop)
                mux_sel <= TEST_SEL;
        end
        TEST_SEL: begin
            mux_sel <=  pc_good_trap | pc_bad_trap | asm_test_timeout ? WRITER_SEL   : mux_sel;
            writer_str_sel <=   pc_good_trap        ?   `PASSED_STRING  :
                                pc_bad_trap         ?   `FAILED_STRING  :
                                asm_test_timeout    ?   `TIMEOUT_STRING : writer_str_sel;         
        end
        default: begin
            mux_sel <= mux_sel;
        end
        endcase
    end
end

// rename to _sel instead of _start
assign writer_start = mux_sel == WRITER_SEL;
assign reader_start = mux_sel == READER_SEL;
assign test_start   = mux_sel == TEST_SEL;

assign  core_axi_awready    = s_axi_awready;
assign  core_axi_wready     = s_axi_wready;
assign  core_axi_bresp      = s_axi_bresp;
assign  core_axi_bvalid     = s_axi_bvalid;
assign  core_axi_arready    = s_axi_arready;
assign  core_axi_rdata      = s_axi_rdata;
assign  core_axi_rresp      = s_axi_rresp;
assign  core_axi_rvalid     = s_axi_rvalid;

// UART -> init ATG
assign  init_axi_awready    = s_axi_awready;
assign  init_axi_wready     = s_axi_wready;
assign  init_axi_bresp      = s_axi_bresp;
assign  init_axi_bvalid     = s_axi_bvalid;

assign  writer_axi_awready  = s_axi_awready;
assign  writer_axi_wready   = s_axi_wready;
assign  writer_axi_bresp    = s_axi_bresp;
assign  writer_axi_bvalid   = s_axi_bvalid;
assign  writer_axi_arready  = s_axi_arready;
assign  writer_axi_rdata    = s_axi_rdata;
assign  writer_axi_rresp    = s_axi_rresp;
assign  writer_axi_rvalid   = s_axi_rvalid;

assign  reader_axi_arready  = s_axi_arready;
assign  reader_axi_rdata    = s_axi_rdata;
assign  reader_axi_rresp    = s_axi_rresp;
assign  reader_axi_rvalid   = s_axi_rvalid;


always @(*) begin
    // default assignments
    s_axi_awaddr    = 13'b0;
    s_axi_awvalid   = 1'b0;
    s_axi_wdata     = 32'b0;
    s_axi_wstrb     = 4'b0;
    s_axi_wvalid    = 1'b0;
    s_axi_bready    = 1'b0;
    s_axi_araddr    = 13'b0;
    s_axi_arvalid   = 1'b0;
    s_axi_rready    = 1'b0;
    case(mux_sel)
        INIT_SEL: begin
            s_axi_awaddr    = init_axi_awaddr;
            s_axi_awvalid   = init_axi_awvalid;
            s_axi_wdata     = init_axi_wdata;
            s_axi_wstrb     = init_axi_wstrb;
            s_axi_wvalid    = init_axi_wvalid;
            s_axi_bready    = init_axi_bready;
        end
        WRITER_SEL: begin
            s_axi_awaddr    = writer_axi_awaddr;
            s_axi_awvalid   = writer_axi_awvalid;
            s_axi_wdata     = writer_axi_wdata;
            s_axi_wstrb     = writer_axi_wstrb;
            s_axi_wvalid    = writer_axi_wvalid;
            s_axi_bready    = writer_axi_bready;
            s_axi_araddr    = writer_axi_araddr;
            s_axi_arvalid   = writer_axi_arvalid;
            s_axi_rready    = writer_axi_rready;
        end
        READER_SEL: begin
            s_axi_araddr    = reader_axi_araddr;
            s_axi_arvalid   = reader_axi_arvalid;
            s_axi_rready    = reader_axi_rready;
        end
        TEST_SEL: begin
            s_axi_awaddr    = core_axi_awaddr;
            s_axi_awvalid   = core_axi_awvalid;
            s_axi_wdata     = core_axi_wdata;
            s_axi_wstrb     = core_axi_wstrb;
            s_axi_wvalid    = core_axi_wvalid;
            s_axi_bready    = core_axi_bready;
            s_axi_araddr    = core_axi_araddr;
            s_axi_arvalid   = core_axi_arvalid;
            s_axi_rready    = core_axi_rready;
        end
        default: ;
    endcase
end

always @(posedge axi_clk) begin
    if (~axi_rst_n)
        asm_test_cycle_cnt <= 64'b0;
    else
        asm_test_cycle_cnt <=   reader_start & reader_stop      ?   64'b0                   :
                                test_start & ~asm_test_timeout  ?   asm_test_cycle_cnt + 1  :
                                                                    asm_test_cycle_cnt      ;
end

`ifdef PITONSYS_UART_BOOT
    assign asm_test_timeout = uart_boot_en_ff & uart_timeout_en_ff ? asm_test_cycle_cnt == `ASM_TIMEOUT_CYCLES : 1'b0;
    assign pc_good_trap     = uart_boot_en_ff                      ? test_good_end   : 1'b0;
    assign pc_bad_trap      = uart_boot_en_ff                      ? test_bad_end    : 1'b0;
`else   // PITONSYS_UART_BOOT
    assign asm_test_timeout = 1'b0;
    assign pc_good_trap     = 1'b0;
    assign pc_bad_trap      = 1'b0;
`endif  // PITONSYS_UART_BOOT

endmodule
