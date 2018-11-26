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
module ccx_l15_transducer (
    input                           clk,
    input                           rst_n,

    //--- PCX (CCX -> L1.5)
    input                           pcx_transducer_req_0,
    input                           pcx_transducer_atomic_req,
    input  [123:117]                pcx_transducer_data_123_117,
    input  [112:0]                  pcx_transducer_data_112_0,

    `ifndef NO_RTL_CSM
    input  [`TLB_CSM_WIDTH-1:0]     pcx_transducer_csm,
    `endif

    output [4:0]                    transducer_pcx_grant,

    input                           l15_transducer_ack,
    input                           l15_transducer_header_ack,

    output [4:0]                    transducer_l15_rqtype,
    output [`L15_AMO_OP_WIDTH-1:0]  transducer_l15_amo_op,
    output                          transducer_l15_nc,
    output [2:0]                    transducer_l15_size,
    output [`L15_THREADID_MASK]     transducer_l15_threadid,
    output                          transducer_l15_prefetch,
    output                          transducer_l15_invalidate_cacheline,
    output                          transducer_l15_blockstore,
    output                          transducer_l15_blockinitstore,
    output [1:0]                    transducer_l15_l1rplway,
    output                          transducer_l15_val,
    output [39:0]                   transducer_l15_address,
    output [63:0]                   transducer_l15_data,
    output [63:0]                   transducer_l15_data_next_entry,
    output [`TLB_CSM_WIDTH-1:0]     transducer_l15_csm_data,

    //--- CPX (L1.5 -> CCX)
    output reg                      transducer_cpx_data_ready,
    output reg  [144:0]             transducer_cpx_data,

    input                           l15_transducer_val,
    input  [3:0]                    l15_transducer_returntype,
    input                           l15_transducer_l2miss,
    input  [1:0]                    l15_transducer_error,
    input                           l15_transducer_noncacheable,
    input                           l15_transducer_atomic,
    input  [`L15_THREADID_MASK]     l15_transducer_threadid,
    input                           l15_transducer_prefetch,
    input                           l15_transducer_f4b,
    input  [63:0]                   l15_transducer_data_0,
    input  [63:0]                   l15_transducer_data_1,
    input  [63:0]                   l15_transducer_data_2,
    input  [63:0]                   l15_transducer_data_3,
    input                           l15_transducer_inval_icache_all_way,
    input                           l15_transducer_inval_dcache_all_way,
    input  [15:4]                   l15_transducer_inval_address_15_4,
    input                           l15_transducer_cross_invalidate,
    input  [1:0]                    l15_transducer_cross_invalidate_way,
    input                           l15_transducer_inval_dcache_inval,
    input                           l15_transducer_inval_icache_inval,
    input  [1:0]                    l15_transducer_inval_way,
    input                           l15_transducer_blockinitstore,

    output                          transducer_l15_req_ack
);

wire pcxdecoder_pcxbuf_ack;
wire [`TLB_CSM_WIDTH-1:0] pcxbuf_pcxdecoder_csm_data;
wire [`PCX_WIDTH-1:0] pcxbuf_pcxdecoder_data;
wire [`PCX_WIDTH-1:0] pcxbuf_pcxdecoder_data_buf1;
wire pcxbuf_pcxdecoder_valid;

wire [4:0] pcx_transducer_req = {4'bx, pcx_transducer_req_0};
wire [123:0] pcx_transducer_data = {pcx_transducer_data_123_117, 4'bx, pcx_transducer_data_112_0};

// The PCX buffer is a two-entry buffer for incoming packets from the CPU
// The buffer has to be two-entry deep because of atomic instructions
pcx_buffer pcx_buffer(
    .clk                        (clk),
    .rst_n                      (rst_n),
    .spc_uncore_req             (pcx_transducer_req),
    .spc_uncore_atomic_req      (pcx_transducer_atomic_req),
    .spc_uncore_data            (pcx_transducer_data),
     `ifndef NO_RTL_CSM
    .spc_uncore_csm_data        (pcx_transducer_csm),
     `else
    .spc_uncore_csm_data        (0),
     `endif
    .pcxdecoder_pcxbuf_ack      (pcxdecoder_pcxbuf_ack),
    .uncore_spc_grant           (transducer_pcx_grant),
    .pcxbuf_pcxdecoder_data     (pcxbuf_pcxdecoder_data),
    .pcxbuf_pcxdecoder_csm_data (pcxbuf_pcxdecoder_csm_data),
    .pcxbuf_pcxdecoder_data_buf1(pcxbuf_pcxdecoder_data_buf1),
    .pcxbuf_pcxdecoder_valid    (pcxbuf_pcxdecoder_valid)
);

pcx_decoder pcx_decoder(
   .clk                                 ( clk                                 ),
   .rst_n                               ( rst_n                               ),

   .pcxbuf_pcxdecoder_data              ( pcxbuf_pcxdecoder_data              ),
   .pcxbuf_pcxdecoder_data_buf1         ( pcxbuf_pcxdecoder_data_buf1         ),
   .pcxbuf_pcxdecoder_csm_data          ( pcxbuf_pcxdecoder_csm_data          ),
   .pcxbuf_pcxdecoder_valid             ( pcxbuf_pcxdecoder_valid             ),
   .l15_pcxdecoder_ack                  ( l15_transducer_ack                  ),
   .l15_pcxdecoder_header_ack           ( l15_transducer_header_ack           ),

   .pcxdecoder_pcxbuf_ack               ( pcxdecoder_pcxbuf_ack               ),
   .pcxdecoder_l15_rqtype               ( transducer_l15_rqtype               ),
   .pcxdecoder_l15_amo_op               ( transducer_l15_amo_op               ),
   .pcxdecoder_l15_nc                   ( transducer_l15_nc                   ),
   .pcxdecoder_l15_size                 ( transducer_l15_size                 ),
   // .pcxdecoder_l15_invalall          ( transducer_l15_invalall             ),
   .pcxdecoder_l15_threadid             ( transducer_l15_threadid             ),
   .pcxdecoder_l15_prefetch             ( transducer_l15_prefetch             ),
   .pcxdecoder_l15_blockstore           ( transducer_l15_blockstore           ),
   .pcxdecoder_l15_blockinitstore       ( transducer_l15_blockinitstore       ),
   .pcxdecoder_l15_l1rplway             ( transducer_l15_l1rplway             ),
   .pcxdecoder_l15_val                  ( transducer_l15_val                  ),
   .pcxdecoder_l15_invalidate_cacheline ( transducer_l15_invalidate_cacheline ),
   .pcxdecoder_l15_address              ( transducer_l15_address              ),
   .pcxdecoder_l15_csm_data             ( transducer_l15_csm_data             ),
   .pcxdecoder_l15_data                 ( transducer_l15_data                 ),
   .pcxdecoder_l15_data_next_entry      ( transducer_l15_data_next_entry      )
);

// 9/24/14: adding buffer for CPX to alleviate timing pressure
wire cpx_data_ready_e;
wire [144:0] cpx_data_e;
// always @ (posedge clk)
//    rst_n_cpx <= rst_n;

always @ (posedge clk)
begin
   if (!rst_n)
   begin
       transducer_cpx_data_ready <= 0;
      // cpx_data <= 0; // trin: only the valid signal is needed
   end
   else
   begin
       transducer_cpx_data_ready <= cpx_data_ready_e;
       transducer_cpx_data <= cpx_data_e;
   end
end

/* The cpx encoder does a few things:
    - encodes proper cpx formats:
        * L15 invalidation format
        ...
    - ensures that atomic returns are sequentially issued
*/
l15_cpxencoder l15_cpxencoder(
    .clk                                (clk),
    .rst_n                              (rst_n),
    .l15_cpxencoder_val                 (l15_transducer_val),
    .l15_cpxencoder_returntype          (l15_transducer_returntype),
    .l15_cpxencoder_l2miss              (l15_transducer_l2miss),
    .l15_cpxencoder_error               (l15_transducer_error),
    .l15_cpxencoder_noncacheable        (l15_transducer_noncacheable),
    .l15_cpxencoder_atomic              (l15_transducer_atomic),
    .l15_cpxencoder_threadid            (l15_transducer_threadid),
    .l15_cpxencoder_prefetch            (l15_transducer_prefetch),
    .l15_cpxencoder_f4b                 (l15_transducer_f4b),
    .l15_cpxencoder_data_0              (l15_transducer_data_0),
    .l15_cpxencoder_data_1              (l15_transducer_data_1),
    .l15_cpxencoder_data_2              (l15_transducer_data_2),
    .l15_cpxencoder_data_3              (l15_transducer_data_3),
    .l15_cpxencoder_inval_icache_all_way(l15_transducer_inval_icache_all_way),
    .l15_cpxencoder_inval_dcache_all_way(l15_transducer_inval_dcache_all_way),
    .l15_cpxencoder_inval_address_15_4  (l15_transducer_inval_address_15_4),
    .l15_cpxencoder_cross_invalidate    (l15_transducer_cross_invalidate),
    .l15_cpxencoder_cross_invalidate_way(l15_transducer_cross_invalidate_way),
    .l15_cpxencoder_inval_dcache_inval  (l15_transducer_inval_dcache_inval),
    .l15_cpxencoder_inval_icache_inval  (l15_transducer_inval_icache_inval),
    .l15_cpxencoder_inval_way           (l15_transducer_inval_way),
    .l15_cpxencoder_blockinitstore      (l15_transducer_blockinitstore),
    .uncore_spc_data_ready              (cpx_data_ready_e),
    .uncore_spc_data                    (cpx_data_e),
    .cpxencoder_l15_req_ack             (transducer_l15_req_ack)
);

endmodule
