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
`include "noc_axi4_bridge_define.vh"


module noc_axi4_bridge_write (
    // Clock + Reset
    input  wire                                                    clk,
    input  wire                                                    rst_n,
    input  wire                                                    uart_boot_en, 

    // NOC interface
    input  wire                                          req_val,
    input  wire [`MSG_HEADER_WIDTH-1:0]                  req_header,
    input  wire [`NOC_AXI4_BRIDGE_BUFFER_ADDR_SIZE-1:0]  req_id,
    input  wire [`AXI4_DATA_WIDTH-1:0]                   req_data,
    output wire                                          req_rdy,

    output wire                                          resp_val,
    output wire [`NOC_AXI4_BRIDGE_BUFFER_ADDR_SIZE-1:0]  resp_id,
    input  wire                                          resp_rdy,

    // AXI write interface
    output wire [`AXI4_ID_WIDTH     -1:0]     m_axi_awid,
    output wire [`AXI4_ADDR_WIDTH   -1:0]     m_axi_awaddr,
    output wire [`AXI4_LEN_WIDTH    -1:0]     m_axi_awlen,
    output wire [`AXI4_SIZE_WIDTH   -1:0]     m_axi_awsize,
    output wire [`AXI4_BURST_WIDTH  -1:0]     m_axi_awburst,
    output wire                               m_axi_awlock,
    output wire [`AXI4_CACHE_WIDTH  -1:0]     m_axi_awcache,
    output wire [`AXI4_PROT_WIDTH   -1:0]     m_axi_awprot,
    output wire [`AXI4_QOS_WIDTH    -1:0]     m_axi_awqos,
    output wire [`AXI4_REGION_WIDTH -1:0]     m_axi_awregion,
    output wire [`AXI4_USER_WIDTH   -1:0]     m_axi_awuser,
    output wire                               m_axi_awvalid,
    input  wire                               m_axi_awready,

    output wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_wid,
    output wire  [`AXI4_DATA_WIDTH   -1:0]    m_axi_wdata,
    output wire  [`AXI4_STRB_WIDTH   -1:0]    m_axi_wstrb,
    output wire                               m_axi_wlast,
    output wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_wuser,
    output wire                               m_axi_wvalid,
    input  wire                               m_axi_wready,

    input  wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_bid,
    input  wire  [`AXI4_RESP_WIDTH   -1:0]    m_axi_bresp,
    input  wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_buser,
    input  wire                               m_axi_bvalid,
    output wire                               m_axi_bready
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

    assign m_axi_awlen    = `AXI4_LEN_WIDTH'b0; // Use only length-1 bursts
    assign m_axi_awsize   = `AXI4_SIZE_WIDTH'b110; // Always transfer 64 bytes
    assign m_axi_awburst  = `AXI4_BURST_WIDTH'b01; // fixed address in bursts (doesn't matter cause we use length-1 bursts)
    assign m_axi_awlock   = 1'b0; // Do not use locks
    assign m_axi_awcache  = `AXI4_CACHE_WIDTH'b11; // Non-cacheable bufferable requests
    assign m_axi_awprot   = `AXI4_PROT_WIDTH'b0; // Data access, non-secure access, unpriveleged access
    assign m_axi_awqos    = `AXI4_QOS_WIDTH'b0; // Do not use qos
    assign m_axi_awregion = `AXI4_REGION_WIDTH'b0; // Do not use regions
    assign m_axi_awuser   = `AXI4_USER_WIDTH'b0; // Do not use user field
    assign m_axi_wuser    = `AXI4_USER_WIDTH'b0; // Do not use user field

wire [`AXI4_ADDR_WIDTH-1:0] addr_paddings = `AXI4_ADDR_WIDTH'b0;

// outbound requests
wire m_axi_awgo = m_axi_awvalid & m_axi_awready;
wire m_axi_wgo = m_axi_wvalid & m_axi_wready;
wire req_go = req_val & req_rdy;
assign m_axi_wlast = m_axi_wvalid;

reg [2:0] req_state;
reg [`MSG_HEADER_WIDTH-1:0] req_header_f;
reg [`NOC_AXI4_BRIDGE_BUFFER_ADDR_SIZE-1:0] req_id_f;
reg [`AXI4_DATA_WIDTH-1:0] req_data_f;

assign req_rdy = (req_state == IDLE);
assign m_axi_awvalid = (req_state == PREP_REQ) || (req_state == SENT_W);
assign m_axi_wvalid = (req_state == PREP_REQ) || (req_state == SENT_AW);

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
                req_header_f <= m_axi_awgo ? 0 : req_header_f;
                req_id_f <= m_axi_awgo ? 0 : req_id_f;
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
assign m_axi_awid = {{`AXI4_ID_WIDTH-`NOC_AXI4_BRIDGE_BUFFER_ADDR_SIZE{1'b0}}, req_id_f};
assign m_axi_wid = {{`AXI4_ID_WIDTH-`NOC_AXI4_BRIDGE_BUFFER_ADDR_SIZE{1'b0}}, req_id_f};


wire [`PHY_ADDR_WIDTH-1:0] virt_addr = req_header_f[`MSG_ADDR];
wire [`AXI4_ADDR_WIDTH-1:0] phys_addr;
wire uncacheable = (virt_addr[`PHY_ADDR_WIDTH-1])
                || (req_header_f[`MSG_TYPE] == `MSG_TYPE_NC_STORE_REQ);;

// If running uart tests - we need to do address translation
`ifdef PITONSYS_UART_BOOT
storage_addr_trans_unified   #(
`else
storage_addr_trans #(
`endif
.STORAGE_ADDR_WIDTH(`AXI4_ADDR_WIDTH)
) cpu_mig_raddr_translastor (
    .va_byte_addr       (virt_addr  ),
    .storage_addr_out   (phys_addr  )
);

reg [`AXI4_STRB_WIDTH-1:0] strb_before_offset;
reg [5:0] offset;
reg [`AXI4_ADDR_WIDTH-1:0] addr;
always @(posedge clk) begin
    if (~rst_n) begin
        offset <= 6'b0;
        strb_before_offset <= `AXI4_STRB_WIDTH'b0;
        addr <= `AXI4_ADDR_WIDTH'b0;
    end
    else begin
        if (uncacheable) begin
            case (req_header_f[`MSG_DATA_SIZE])
                `MSG_DATA_SIZE_0B: begin
                    strb_before_offset <= `AXI4_STRB_WIDTH'b0;
                end
                `MSG_DATA_SIZE_1B: begin
                    strb_before_offset <= `AXI4_STRB_WIDTH'b1;
                end
                `MSG_DATA_SIZE_2B: begin
                    strb_before_offset <= `AXI4_STRB_WIDTH'b11;
                end
                `MSG_DATA_SIZE_4B: begin
                    strb_before_offset <= `AXI4_STRB_WIDTH'hf;
                end
                `MSG_DATA_SIZE_8B: begin
                    strb_before_offset <= `AXI4_STRB_WIDTH'hff;
                end
                `MSG_DATA_SIZE_16B: begin
                    strb_before_offset <= `AXI4_STRB_WIDTH'hffff;
                end
                `MSG_DATA_SIZE_32B: begin
                    strb_before_offset <= `AXI4_STRB_WIDTH'hffffffff;
                end
                `MSG_DATA_SIZE_64B: begin
                    strb_before_offset <= `AXI4_STRB_WIDTH'hffffffffffffffff;
                end
                default: begin
                    // should never end up here
                    strb_before_offset <= `AXI4_STRB_WIDTH'b0;
                end
            endcase
        end
        else begin
            strb_before_offset <= `AXI4_STRB_WIDTH'hffffffffffffffff;
        end

        offset <= uncacheable ? virt_addr[5:0] : 6'b0;
        addr <= uart_boot_en ? {phys_addr[`AXI4_ADDR_WIDTH-4:0], 3'b0} : virt_addr;
    end
end

assign m_axi_awaddr = {addr[`AXI4_ADDR_WIDTH-1:6], 6'b0};
assign m_axi_wstrb = strb_before_offset << offset;
assign m_axi_wdata = req_data_f << (8*offset);

// inbound responses
wire m_axi_bgo = m_axi_bvalid & m_axi_bready;
wire resp_go = resp_val & resp_rdy;

reg [2:0] resp_state;
reg [`NOC_AXI4_BRIDGE_BUFFER_ADDR_SIZE-1:0]resp_id_f;

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

/*
ila_write ila_write (
    .clk(clk), // input wire clk


    .probe0(rst_n), // input wire [0:0]  probe0  
    .probe1(uart_boot_en), // input wire [0:0]  probe1 
    .probe2(req_val), // input wire [0:0]  probe2 
    .probe3(req_header), // input wire [191:0]  probe3 
    .probe4(req_id), // input wire [1:0]  probe4 
    .probe5(req_data), // input wire [511:0]  probe5 
    .probe6(req_rdy), // input wire [0:0]  probe6 
    .probe7(resp_val), // input wire [0:0]  probe7 
    .probe8(resp_id), // input wire [1:0]  probe8 
    .probe9(resp_rdy), // input wire [0:0]  probe9 
    .probe10(m_axi_awid), // input wire [15:0]  probe10 
    .probe11(m_axi_awaddr), // input wire [63:0]  probe11 
    .probe12(m_axi_awvalid), // input wire [0:0]  probe12 
    .probe13(m_axi_awready), // input wire [0:0]  probe13 
    .probe14(m_axi_wid), // input wire [15:0]  probe14 
    .probe15(m_axi_wdata), // input wire [511:0]  probe15 
    .probe16(m_axi_wstrb), // input wire [63:0]  probe16 
    .probe17(m_axi_wlast), // input wire [0:0]  probe17 
    .probe18(m_axi_wvalid), // input wire [0:0]  probe18 
    .probe19(m_axi_wready), // input wire [0:0]  probe19 
    .probe20(m_axi_bid), // input wire [15:0]  probe20 
    .probe21(m_axi_bvalid), // input wire [0:0]  probe21 
    .probe22(m_axi_bready), // input wire [0:0]  probe22 
    .probe23(req_state), // input wire [2:0]  probe23 
    .probe24(req_header_f), // input wire [191:0]  probe24 
    .probe25(req_id_f), // input wire [1:0]  probe25 
    .probe26(req_data_f), // input wire [511:0]  probe26 
    .probe27(strb_before_offset), // input wire [63:0]  probe27 
    .probe28(offset), // input wire [5:0]  probe28 
    .probe29(addr), // input wire [63:0]  probe29 
    .probe30(resp_state), // input wire [2:0]  probe30 
    .probe31(resp_id_f) // input wire [1:0]  probe31
);*/

endmodule
