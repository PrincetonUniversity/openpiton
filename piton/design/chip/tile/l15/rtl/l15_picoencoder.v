/*
Copyright (c) 2018 Princeton University
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
module l15_picoencoder(
    input wire          clk,
    input wire          rst_n,
    
    input wire          l15_picoencoder_val,
    input wire [3:0]    l15_picoencoder_returntype,
    
    input wire [63:0]   l15_picoencoder_data_0,
    input wire [63:0]   l15_picoencoder_data_1,
    
    input wire [39:0]   picodecoder_l15_address,  
    
    output reg          pico_mem_ready,
    output wire [31:0]  pico_mem_rdata,
    
    output wire         picoencoder_l15_req_ack,
    output reg          pico_int
);
    
    reg [31:0] rdata_part;
    assign pico_mem_rdata = {rdata_part[7:0], rdata_part[15:8],
                             rdata_part[23:16], rdata_part[31:24]};
    assign picoencoder_l15_req_ack = l15_picoencoder_val;
     
    // keep track of whether we have received the wakeup interrupt
    reg int_recv;
    always @ (posedge clk) begin
        if (!rst_n) begin
            pico_int <= 1'b0;
        end
        else if (int_recv) begin
            pico_int <= 1'b1;
        end
        else if (pico_int) begin
            pico_int <= 1'b0;
        end
    end
       
    always @ * begin
        if (l15_picoencoder_val) begin
            case(l15_picoencoder_returntype)
                `LOAD_RET, `CPX_RESTYPE_ATOMIC_RES: begin
                    // load
                    int_recv = 1'b0;
                    pico_mem_ready = 1'b1;
                    case(picodecoder_l15_address[3:2])
                        2'b00: begin
                            rdata_part = l15_picoencoder_data_0[63:32];
                        end
                        2'b01: begin
                            rdata_part = l15_picoencoder_data_0[31:0];
                        end
                        2'b10: begin
                            rdata_part = l15_picoencoder_data_1[63:32];
                        end
                        2'b11: begin
                            rdata_part = l15_picoencoder_data_1[31:0];
                        end
                        default: begin
                        end
                    endcase 
                end
                `ST_ACK: begin
                    int_recv = 1'b0;
                    pico_mem_ready = 1'b1;
                    rdata_part = 32'b0;
                end
                `INT_RET: begin
                    if (l15_picoencoder_data_0[17:16] == 2'b01) begin
                        int_recv = 1'b1;
                    end
                    else begin
                        int_recv = 1'b0;
                    end
                    pico_mem_ready = 1'b0;
                    rdata_part = 32'b0;
                end
                default: begin
                    int_recv = 1'b0;
                    pico_mem_ready = 1'b0;
                    rdata_part = 32'b0;
                end
            endcase 
        end
        else begin
            int_recv = 1'b0;
            pico_mem_ready = 1'b0;
            rdata_part = 32'b0;
        end
    end
    
endmodule // l15_picoencoder
