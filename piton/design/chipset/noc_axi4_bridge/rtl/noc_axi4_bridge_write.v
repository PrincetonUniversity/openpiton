// ========== Copyright Header Begin ============================================
// Copyright (c) 2019 Princeton University
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

`include "mc_define.h"
`include "define.tmp.h"


module noc_axi4_bridge_write # (
  parameter IN_FLIGHT_LIMIT             = 16, //number of commands the MC can have in flight
  parameter BUFFER_ADDR_SIZE            = 4, //(log_2(IN_FLIGHT_LIMIT)+1)
  parameter PAYLOAD_SIZE                = 512
)(
    // Clock + Reset
    input  wire                                   clk,
    input  wire                                   rst_n,
    input  wire                                   uart_boot_en, 

    // NOC interface
    input  wire                                   req_val,
    input  wire [`MSG_HEADER_WIDTH-1:0]           req_header,
    input  wire [BUFFER_ADDR_SIZE-1:0]            req_id,
    input  wire [PAYLOAD_SIZE-1:0]                req_data,
    output wire                                   req_rdy,

    output wire                                   resp_val,
    output wire [BUFFER_ADDR_SIZE-1:0]            resp_id,
    input  wire                                   resp_rdy,

    // AXI write interface
    output wire [`C_M_AXI4_ID_WIDTH     -1:0]     m_axi_awid,
    output wire [`C_M_AXI4_ADDR_WIDTH   -1:0]     m_axi_awaddr,
    output wire [`C_M_AXI4_LEN_WIDTH    -1:0]     m_axi_awlen,
    output wire [`C_M_AXI4_SIZE_WIDTH   -1:0]     m_axi_awsize,
    output wire [`C_M_AXI4_BURST_WIDTH  -1:0]     m_axi_awburst,
    output wire                                   m_axi_awlock,
    output wire [`C_M_AXI4_CACHE_WIDTH  -1:0]     m_axi_awcache,
    output wire [`C_M_AXI4_PROT_WIDTH   -1:0]     m_axi_awprot,
    output wire [`C_M_AXI4_QOS_WIDTH    -1:0]     m_axi_awqos,
    output wire [`C_M_AXI4_REGION_WIDTH -1:0]     m_axi_awregion,
    output wire [`C_M_AXI4_USER_WIDTH   -1:0]     m_axi_awuser,
    output wire                                   m_axi_awvalid,
    input  wire                                   m_axi_awready,

    output wire  [`C_M_AXI4_ID_WIDTH     -1:0]    m_axi_wid,
    output wire  [`C_M_AXI4_DATA_WIDTH   -1:0]    m_axi_wdata,
    output wire  [`C_M_AXI4_STRB_WIDTH   -1:0]    m_axi_wstrb,
    output wire                                   m_axi_wlast,
    output wire  [`C_M_AXI4_USER_WIDTH   -1:0]    m_axi_wuser,
    output wire                                   m_axi_wvalid,
    input  wire                                   m_axi_wready,

    input  wire  [`C_M_AXI4_ID_WIDTH     -1:0]    m_axi_bid,
    input  wire  [`C_M_AXI4_RESP_WIDTH   -1:0]    m_axi_bresp,
    input  wire  [`C_M_AXI4_USER_WIDTH   -1:0]    m_axi_buser,
    input  wire                                   m_axi_bvalid,
    output wire                                   m_axi_bready
);


localparam IDLE = 3'd0;
localparam GOT_REQ = 3'd1;
localparam PREP_REQ = 3'd2;
localparam SENT_AW = 3'd3;
localparam SENT_W = 3'd4;
localparam GOT_RESP = 3'd1;

//==============================================================================
// Tie constant outputs in axi4
//==============================================================================

    assign m_axi_awlen    = `C_M_AXI4_LEN_WIDTH'b0; // Use only length-1 bursts
    assign m_axi_awsize   = `C_M_AXI4_SIZE_WIDTH'b110; // Always transfer 64 bytes
    assign m_axi_awburst  = `C_M_AXI4_BURST_WIDTH'b01; // fixed address in bursts (doesn't matter cause we use length-1 bursts)
    assign m_axi_awlock   = 1'b0; // Do not use locks
    assign m_axi_awcache  = `C_M_AXI4_CACHE_WIDTH'b11; // Non-cacheable bufferable requests
    assign m_axi_awprot   = `C_M_AXI4_PROT_WIDTH'b10; // Data access, non-secure access, unpriveleged access
    assign m_axi_awqos    = `C_M_AXI4_QOS_WIDTH'b0; // Do not use qos
    assign m_axi_awregion = `C_M_AXI4_REGION_WIDTH'b0; // Do not use regions
    assign m_axi_awuser   = `C_M_AXI4_USER_WIDTH'b0; // Do not use user field
    assign m_axi_wuser    = `C_M_AXI4_USER_WIDTH'b0; // Do not use user field

wire [`C_M_AXI4_ADDR_WIDTH-1:0] addr_paddings = `C_M_AXI4_ADDR_WIDTH'b0;

// outbound requests
wire m_axi_awgo = m_axi_awvalid & m_axi_awready;
wire m_axi_wgo = m_axi_wvalid & m_axi_wready;
wire req_go = req_val & req_rdy;
assign m_axi_wlast = m_axi_wgo;

reg [2:0] req_state;
reg [`MSG_HEADER_WIDTH-1:0] req_header_f;
reg [BUFFER_ADDR_SIZE-1:0] req_id_f;
reg [PAYLOAD_SIZE-1:0] req_data_f;

assign req_rdy = (req_state == IDLE);
assign m_axi_awvalid = (req_state == PREP_REQ);
assign m_axi_wvalid = (req_state == PREP_REQ);

always  @(posedge clk) begin
    if(~rst_n) begin
        req_header_f <= 0;
        req_id_f <= 0;
        req_state <= IDLE;
        req_data_f <= 0;
    end else begin
        case (req_state)
            IDLE: begin
                req_state <= req_go ? GOT_REQ : req_state;
                req_header_f <= req_go ? req_header : req_header_f;
                req_id_f <= req_go ? req_id : req_id_f;
                req_data_f <= req_data_f;
            end
            GOT_REQ: begin
                req_state <= PREP_REQ;
                req_header_f <= req_header_f;
                req_id_f <= req_id_f;
                req_data_f <= req_data; // get data one cycle later because of bram in buffer
            end
            PREP_REQ: begin
                req_state <= (m_axi_awgo & m_axi_wgo) ? IDLE : m_axi_awgo ? SENT_AW : m_axi_wgo ? SENT_W : req_state;
                req_header_f <= (m_axi_awgo & m_axi_wgo) ? 0 : req_header_f;
                req_id_f <= (m_axi_awgo & m_axi_wgo) ? 0 : req_id_f;
                req_data_f <= (m_axi_awgo & m_axi_wgo) ? 0 : req_data_f;
            end
            SENT_AW: begin
                req_state <= m_axi_wgo ? IDLE : req_state;
                req_header_f <= m_axi_wgo ? 0 : req_header_f;
                req_id_f <= m_axi_wgo ? 0 : req_id_f;
                req_data_f <= m_axi_wgo ? 0 : req_data_f;
            end
            SENT_W: begin
                req_state <= m_axi_awgo ? IDLE : req_state;
                req_header_f <= m_axi_awgo ? IDLE : req_header_f;
                req_id_f <= m_axi_awgo ? IDLE : req_id_f;
                req_data_f <= m_axi_awgo ? 0 : req_data_f;
            end
            default : begin
                req_header_f <= 0;
                req_id_f <= 0;
                req_state <= IDLE;
                req_data_f <= 0;
            end
        endcase
    end
end


// Process information here
assign m_axi_awid = req_id_f;
assign m_axi_wid = req_id_f;


wire [`PHY_ADDR_WIDTH-1:0] virt_addr = req_header_f[`MSG_ADDR];
wire [`C_M_AXI4_ADDR_WIDTH-1:0] phys_addr;
wire uncacheable = (virt_addr[`PHY_ADDR_WIDTH-1]);

// If running uart tests - we need to do address translation
`ifdef PITONSYS_UART_BOOT
storage_addr_trans_unified   #(
`else
storage_addr_trans #(
`endif
.STORAGE_ADDR_WIDTH(`C_M_AXI4_ADDR_WIDTH)
) cpu_mig_raddr_translastor (
    .va_byte_addr       (virt_addr  ),
    .storage_addr_out   (phys_addr  )
);

reg [`C_M_AXI4_STRB_WIDTH-1:0] strb_before_offset;
reg [5:0] offset;
reg [`C_M_AXI4_ADDR_WIDTH-1:0] addr;
always @(posedge clk) begin
    if (~rst_n) begin
        offset <= 6'b0;
        strb_before_offset <= `C_M_AXI4_STRB_WIDTH'b0;
        addr <= `C_M_AXI4_ADDR_WIDTH'b0;
    end
    else begin
        if (uncacheable) begin
            case (req_header_f[`MSG_DATA_SIZE])
                `MSG_DATA_SIZE_0B: begin
                    strb_before_offset <= `C_M_AXI4_STRB_WIDTH'b0;
                end
                `MSG_DATA_SIZE_1B: begin
                    strb_before_offset <= `C_M_AXI4_STRB_WIDTH'b1;
                end
                `MSG_DATA_SIZE_2B: begin
                    strb_before_offset <= `C_M_AXI4_STRB_WIDTH'b11;
                end
                `MSG_DATA_SIZE_4B: begin
                    strb_before_offset <= `C_M_AXI4_STRB_WIDTH'hf;
                end
                `MSG_DATA_SIZE_8B: begin
                    strb_before_offset <= `C_M_AXI4_STRB_WIDTH'hff;
                end
                `MSG_DATA_SIZE_16B: begin
                    strb_before_offset <= `C_M_AXI4_STRB_WIDTH'hffff;
                end
                `MSG_DATA_SIZE_32B: begin
                    strb_before_offset <= `C_M_AXI4_STRB_WIDTH'hffffffff;
                end
                `MSG_DATA_SIZE_64B: begin
                    strb_before_offset <= `C_M_AXI4_STRB_WIDTH'hffffffffffffffff;
                end
                default: begin
                    // should never end up here
                    strb_before_offset <= `C_M_AXI4_STRB_WIDTH'b0;
                end
            endcase
        end
        else begin
            strb_before_offset <= `C_M_AXI4_STRB_WIDTH'hffffffffffffffff;
        end

        offset <= uncacheable ? virt_addr[5:0] : 6'b0;
        addr <= uart_boot_en ? {phys_addr[`C_M_AXI4_ADDR_WIDTH-4:0], 3'b0} : virt_addr;
    end
end

assign m_axi_awaddr = {addr[`C_M_AXI4_ADDR_WIDTH-1:6], 6'b0};
assign m_axi_wstrb = strb_before_offset << offset;
assign m_axi_wdata = req_data_f << offset;

// inbound responses
wire m_axi_bgo = m_axi_bvalid & m_axi_bready;
wire resp_go = resp_val & resp_rdy;

reg [2:0] resp_state;
reg [BUFFER_ADDR_SIZE-1:0]resp_id_f;

assign resp_val = (resp_state == GOT_RESP);
assign m_axi_bready = (resp_state == IDLE);


always  @(posedge clk) begin
    if(~rst_n) begin
        resp_id_f <= 0;
        resp_state <= IDLE;
    end else begin
        case (resp_state)
            IDLE: begin
                resp_state <= m_axi_bgo ? GOT_RESP : resp_state;
                resp_id_f <= m_axi_bgo ? m_axi_bid : resp_id_f;
            end
            GOT_RESP: begin
                resp_state <= resp_go ? IDLE : resp_state;
                resp_id_f <= resp_go ? 0 : resp_id_f;
            end
            default : begin
                resp_state <= IDLE;
                resp_id_f <= 0;
            end
        endcase
    end
end

// process data here
assign resp_id = resp_id_f;

endmodule
