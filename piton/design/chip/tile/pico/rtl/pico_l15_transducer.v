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
module pico_l15_transducer (
    input                           clk,
    input                           rst_n,

    //--- Pico -> L1.5
    input                           pico_transducer_mem_valid,
    input [31:0]                    pico_transducer_mem_addr,
    input [ 3:0]                    pico_transducer_mem_wstrb,

    input [31:0]                    pico_transducer_mem_wdata,
    input [`L15_AMO_OP_WIDTH-1:0]   pico_transducer_mem_amo_op,
    input                           l15_transducer_ack,
    input                           l15_transducer_header_ack,

    // outputs pico uses                    
    output [4:0]                    transducer_l15_rqtype,
    output [`L15_AMO_OP_WIDTH-1:0]  transducer_l15_amo_op,
    output [2:0]                    transducer_l15_size,
    output                          transducer_l15_val,
    output [`PHY_ADDR_WIDTH-1:0]    transducer_l15_address,
    output [63:0]                   transducer_l15_data,
    output                          transducer_l15_nc,


    // outputs pico doesn't use                    
    output [0:0]                    transducer_l15_threadid,
    output                          transducer_l15_prefetch,
    output                          transducer_l15_invalidate_cacheline,
    output                          transducer_l15_blockstore,
    output                          transducer_l15_blockinitstore,
    output [1:0]                    transducer_l15_l1rplway,
    output [63:0]                   transducer_l15_data_next_entry,
    output [32:0]                   transducer_l15_csm_data,

    //--- L1.5 -> Pico
    input                           l15_transducer_val,
    input [3:0]                     l15_transducer_returntype,
    
    input [63:0]                    l15_transducer_data_0,
    input [63:0]                    l15_transducer_data_1,
   
    output                          transducer_pico_mem_ready,
    output [31:0]                   transducer_pico_mem_rdata,
    
    output                          transducer_l15_req_ack,
    output                          pico_int
);

// not supported at the moment
//assign transducer_l15_amo_op = `L15_AMO_OP_NONE;

//--- Pico -> L1.5
pico_decoder pico_decoder(
    .clk(clk),
    .rst_n(rst_n),
    
    .pico_mem_valid                         (pico_transducer_mem_valid),
    .pico_mem_addr                          (pico_transducer_mem_addr),
    .pico_mem_wstrb                         (pico_transducer_mem_wstrb),
    .pico_mem_wdata                         (pico_transducer_mem_wdata),
    .pico_mem_amo_op                        (pico_transducer_mem_amo_op),
    .l15_picodecoder_ack                    (l15_transducer_ack),
    .l15_picodecoder_header_ack             (l15_transducer_header_ack),
                           
    .picodecoder_l15_rqtype                 (transducer_l15_rqtype),
    .picodecoder_l15_amo_op                 (transducer_l15_amo_op),
    .picodecoder_l15_size                   (transducer_l15_size),
    .picodecoder_l15_val                    (transducer_l15_val),
    .picodecoder_l15_address                (transducer_l15_address),
    .picodecoder_l15_data                   (transducer_l15_data),
                           
    .picodecoder_l15_nc                     (transducer_l15_nc),                          
    .picodecoder_l15_threadid               (transducer_l15_threadid),
    .picodecoder_l15_prefetch               (transducer_l15_prefetch),
    .picodecoder_l15_blockstore             (transducer_l15_blockstore),
    .picodecoder_l15_blockinitstore         (transducer_l15_blockinitstore),
    .picodecoder_l15_l1rplway               (transducer_l15_l1rplway),
    .picodecoder_l15_invalidate_cacheline   (transducer_l15_invalidate_cacheline),
    .picodecoder_l15_csm_data               (transducer_l15_csm_data),
    .picodecoder_l15_data_next_entry        (transducer_l15_data_next_entry)
);

//--- L1.5 -> Pico
l15_picoencoder l15_picoencoder(
    .clk(clk),
    .rst_n(rst_n),
    
    .l15_picoencoder_val        (l15_transducer_val),
    .l15_picoencoder_returntype (l15_transducer_returntype),
    
    .l15_picoencoder_data_0     (l15_transducer_data_0),
    .l15_picoencoder_data_1     (l15_transducer_data_1),
    
    .picodecoder_l15_address    (transducer_l15_address),
    
    .pico_mem_ready             (transducer_pico_mem_ready),
    .pico_mem_rdata             (transducer_pico_mem_rdata),
    
    .picoencoder_l15_req_ack    (transducer_l15_req_ack),
    .pico_int                   (pico_int)
);

endmodule
