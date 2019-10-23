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

`include "uart16550_define.vh"

module uart_reseter(
    input axi_clk, 
    input axi_rst_n, 

    input [31:0] axi_rdata,
    input        axi_rvalid,
    input        axi_rready,
    input [12:0] axi_araddr, 
    input axi_arvalid, 
    input axi_arready, 

    output uart_rst_out_n
);

// This module sniffs uart bytes and compares them with this
// magic sequence. If comparison is successful - sends reset to the whole system
localparam reset_sequence = 64'h9a337213af278f34;

wire axi_rgo = axi_rvalid & axi_rready;
wire axi_argo = axi_arvalid & axi_arready;

reg [4:0] state;
localparam IDLE = 4'd0;
localparam BYTE1 = 4'd1;
localparam BYTE2 = 4'd2;
localparam BYTE3 = 4'd3;
localparam BYTE4 = 4'd4;
localparam BYTE5 = 4'd5;
localparam BYTE6 = 4'd6;
localparam BYTE7 = 4'd7;
localparam RESET = 4'd8;

reg waiting;

assign uart_rst_out_n = !(state == RESET);

always @(posedge axi_clk) begin
    if(~axi_rst_n) begin
        state <= 0;
    end 
    else begin
        if (waiting & axi_rgo) begin
            case (state)
                IDLE: begin
                    if (axi_rdata[7:0] == reset_sequence[7:0])
                        state <= BYTE1;
                    else 
                        state <= IDLE;
                end
                BYTE1: begin
                    if (axi_rdata[7:0] == reset_sequence[15:8])                        
                        state <= BYTE2;
                    else 
                        state <= IDLE;
                end
                BYTE2: begin
                    if (axi_rdata[7:0] == reset_sequence[23:16])
                        state <= BYTE3;
                    else 
                        state <= IDLE;
                end
                BYTE3: begin
                    if (axi_rdata[7:0] == reset_sequence[31:24])
                        state <= BYTE4;
                    else 
                        state <= IDLE;
                end
                BYTE4: begin
                    if (axi_rdata[7:0] == reset_sequence[39:32])
                        state <= BYTE5;
                    else 
                        state <= IDLE;
                end
                BYTE5: begin
                    if (axi_rdata[7:0] == reset_sequence[47:40])
                        state <= BYTE6;
                    else 
                        state <= IDLE;
                end
                BYTE6: begin
                    if (axi_rdata[7:0] == reset_sequence[55:48])
                        state <= BYTE7;
                    else 
                        state <= IDLE;
                end
                BYTE7: begin
                    if (axi_rdata[7:0] == reset_sequence[63:56])
                        state <= RESET;
                    else 
                        state <= IDLE;
                end
                RESET: begin
                    state <= RESET;
                end
                default: begin
                    state <= IDLE;
                end
            endcase // state
        end
        else begin
            state <= state;
        end
    end
end



always @(posedge axi_clk) begin
    if(~axi_rst_n) begin
        waiting <= 0;
    end 
    else begin
        if (axi_argo & (axi_araddr == `UART_RBR) & !waiting) 
            waiting <= 1;
        else if (axi_rgo & waiting)
            waiting <= 0;
        else
            waiting <= waiting; //should never be here
    end
end

endmodule
