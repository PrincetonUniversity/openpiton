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

`include "axi_defines.vh"
`include "piton_system.vh"

module pcie_cfg(
    input sys_clk,

    input                                pcie_cfg_axi_clk,
    input                                pcie_cfg_axi_resetn,
    input  [`AXIL_ADDR_WIDTH-1:0]        pcie_cfg_axi_awaddr, 
    input  [`AXIL_PROT_WIDTH-1:0]        pcie_cfg_axi_awprot, 
    input                                pcie_cfg_axi_awvalid,
    output                               pcie_cfg_axi_awready, 
    input  [`AXIL_DATA_WIDTH-1:0]        pcie_cfg_axi_wdata,
    input  [`AXIL_STRB_WIDTH-1:0]        pcie_cfg_axi_wstrb,
    input                                pcie_cfg_axi_wvalid,
    output                               pcie_cfg_axi_wready,
    output reg                           pcie_cfg_axi_bvalid,
    output [`AXIL_RESP_WIDTH-1:0]        pcie_cfg_axi_bresp,
    input                                pcie_cfg_axi_bready,
    input  [`AXIL_ADDR_WIDTH-1:0]        pcie_cfg_axi_araddr,
    input  [`AXIL_PROT_WIDTH-1:0]        pcie_cfg_axi_arprot,
    input                                pcie_cfg_axi_arvalid,
    output                               pcie_cfg_axi_arready,
    output reg [`AXIL_DATA_WIDTH-1:0]    pcie_cfg_axi_rdata,
    output  [`AXIL_RESP_WIDTH-1:0]       pcie_cfg_axi_rresp,
    output reg                           pcie_cfg_axi_rvalid,
    input                                pcie_cfg_axi_rready,

    output pcie_cfg_rst_out_n,
    output [`PITONSYS_SW_WIDTH-1:0] pcie_cfg_sw_out
);

localparam RST_ADDR = `AXIL_ADDR_WIDTH'h0;
localparam SW_ADDR = `AXIL_ADDR_WIDTH'h4;

wire [`AXIL_DATA_WIDTH-1:0] paddings = `AXIL_DATA_WIDTH'b0;

reg [`PITONSYS_SW_WIDTH-1:0] sw_reg;
reg rstn_reg;
wire wgo;
wire rgo;
wire [`AXIL_DATA_WIDTH-1:0] rdata;

reg [`PITONSYS_SW_WIDTH-1:0] sw_reg_f;
reg [`PITONSYS_SW_WIDTH-1:0] sw_reg_ff;
reg rstn_reg_f;
reg rstn_reg_ff;


assign pcie_cfg_axi_awready = pcie_cfg_axi_awvalid & pcie_cfg_axi_wvalid;
assign pcie_cfg_axi_wready = pcie_cfg_axi_awvalid & pcie_cfg_axi_wvalid;
assign pcie_cfg_axi_arready = 1'b1;
assign pcie_cfg_axi_rresp = `AXIL_RESP_WIDTH'b0;
assign pcie_cfg_axi_bresp = `AXIL_RESP_WIDTH'b0;
assign wgo = pcie_cfg_axi_awready & pcie_cfg_axi_wready & pcie_cfg_axi_wvalid & pcie_cfg_axi_awvalid;
assign rdata = (pcie_cfg_axi_araddr == RST_ADDR) ? {paddings [`AXIL_DATA_WIDTH-1:1], rstn_reg}
             : (pcie_cfg_axi_araddr == SW_ADDR) ? {paddings [`AXIL_DATA_WIDTH-1:`PITONSYS_SW_WIDTH], sw_reg}
             : `AXIL_DATA_WIDTH'b0;


// Writes
always @(posedge pcie_cfg_axi_clk) begin
    if(~pcie_cfg_axi_resetn) begin
        sw_reg <= `PITONSYS_SW_WIDTH'b0;
        rstn_reg <= 1;
    end 
    else begin
        if (wgo) begin
            case (pcie_cfg_axi_awaddr)
                RST_ADDR: begin
                    rstn_reg <= pcie_cfg_axi_wdata[0];
                    sw_reg <= sw_reg;
                end
                SW_ADDR: begin
                    sw_reg <= pcie_cfg_axi_wdata[`PITONSYS_SW_WIDTH-1:0];
                    rstn_reg <= rstn_reg;
                end
                default: begin
                    rstn_reg <= rstn_reg;
                    sw_reg <= sw_reg;
                end
            endcase
        end
    end
end

always @(posedge pcie_cfg_axi_clk) begin
    if(~pcie_cfg_axi_resetn) begin
        pcie_cfg_axi_bvalid <= 0;
    end 
    else begin
        pcie_cfg_axi_bvalid <= wgo ? 1 : pcie_cfg_axi_bready ? 0 : pcie_cfg_axi_bvalid;
    end
end


// Reads
always @(posedge pcie_cfg_axi_clk) begin
    if(~pcie_cfg_axi_resetn) begin
        pcie_cfg_axi_rvalid <= 0;
        pcie_cfg_axi_rdata <= 0;
    end 
    else begin
        pcie_cfg_axi_rvalid <= pcie_cfg_axi_arvalid ? 1 : pcie_cfg_axi_rready ? 0 : pcie_cfg_axi_rvalid;
        pcie_cfg_axi_rdata  <= pcie_cfg_axi_arvalid ? rdata : pcie_cfg_axi_rdata;
    end
end

// clock domain crossing
always @(posedge sys_clk) begin
	rstn_reg_f <= rstn_reg;
	rstn_reg_ff <= rstn_reg_f;
	sw_reg_f <= sw_reg;
	sw_reg_ff <= sw_reg_f;
end

assign pcie_cfg_sw_out = sw_reg_ff;
assign pcie_cfg_rst_out_n = rstn_reg_ff;

endmodule 