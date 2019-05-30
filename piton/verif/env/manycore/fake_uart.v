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

`include "define.tmp.h"

module fake_uart (
    input                           clk,
    input                           rst_n,

    input                           src_uart_noc2_val,
    input  [`NOC_DATA_WIDTH-1:0]    src_uart_noc2_data,
    output                          src_uart_noc2_rdy,

    output                          uart_dst_noc3_val,
    output [`NOC_DATA_WIDTH-1:0]    uart_dst_noc3_data,
    input                           uart_dst_noc3_rdy
);

wire [`NOC_DATA_WIDTH-1:0]  m_axi_awaddr;
wire                        m_axi_awvalid;

wire [`NOC_DATA_WIDTH-1:0]  m_axi_wdata;
wire                        m_axi_wvalid;

integer file;

initial begin
    file = $fopen("fake_uart.log", "w");
end

always @(posedge clk) begin
    if (m_axi_awvalid & m_axi_wvalid & (m_axi_awaddr[2:0] == 3'b0)) begin
        $fwrite(file, "%c", m_axi_wdata[7:0]);
        $fflush(file);
    end
end

noc_axilite_bridge #(
 .SLAVE_RESP_BYTEWIDTH (1)
) noc_axilite_bridge (
    .clk                    (clk),
    .rst                    (~rst_n),

    .splitter_bridge_val    (src_uart_noc2_val),
    .splitter_bridge_data   (src_uart_noc2_data),
    .bridge_splitter_rdy    (src_uart_noc2_rdy),

    .bridge_splitter_val    (uart_dst_noc3_val),
    .bridge_splitter_data   (uart_dst_noc3_data),
    .splitter_bridge_rdy    (uart_dst_noc3_rdy),

    //axi lite signals
    //write address channel
    .m_axi_awaddr           (m_axi_awaddr),
    .m_axi_awvalid          (m_axi_awvalid),
    .m_axi_awready          (1'b1),

    //write data channel
    .m_axi_wdata            (m_axi_wdata),
    .m_axi_wstrb            (),
    .m_axi_wvalid           (m_axi_wvalid),
    .m_axi_wready           (1'b1),

    //read address channel
    .m_axi_araddr           (),
    .m_axi_arvalid          (),
    .m_axi_arready          (1'b1),

    //read data channel
    .m_axi_rdata            (`NOC_DATA_WIDTH'hef),
    .m_axi_rresp            (2'b0),
    .m_axi_rvalid           (1'b1),
    .m_axi_rready           (),

    //write response channel
    .m_axi_bresp            (2'b0),
    .m_axi_bvalid           (1'b1),
    .m_axi_bready           (),
    // non-axi-lite signals
    .w_reqbuf_size          (),
    .r_reqbuf_size          ()
);



endmodule
