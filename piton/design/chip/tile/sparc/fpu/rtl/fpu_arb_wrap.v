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

// Wrapper to tie unused signals in fpu_arb


module fpu_arb_wrap
(
    input           clk,
    input           rst_n,
    
    input [67:0]    pcx_fpio_data_px2_67_0,
    input [79:72]   pcx_fpio_data_px2_79_72,
    input [116:112] pcx_fpio_data_px2_116_112,
    input [123:118] pcx_fpio_data_px2_123_118,

    input           l15_fp_rdy,
    
    output          fpu_arb_data_rdy,
    output [144:0]  fpu_arb_data,
    output          fpu_arb_grant
);

`ifdef PITON_FPGA_NO_FPU

    assign fpu_arb_data_rdy = 1'b0;
    assign fpu_arb_data     = 145'b0;
    assign fpu_arb_grant    = 1'b0;

`else

    wire[123:0]  pcx_fpio_data_px2 = {pcx_fpio_data_px2_123_118, 
                                                           1'bx, 
                                      pcx_fpio_data_px2_116_112, 
                                                          32'bx,
                                        pcx_fpio_data_px2_79_72,
                                                           4'bx,
                                         pcx_fpio_data_px2_67_0};

    fpu_arb fpu_arb
    (
        .arst_l (rst_n),
        .grst_l (rst_n),
        .gclk (clk),
        .cluster_cken (1'b1),
        .pcx_fpio_data_rdy_px1 (1'bx),
        .pcx_fpio_data_rdy_squashed (1'bx),
        .pcx_fpio_data_px2 (pcx_fpio_data_px2),
        .l15_fp_rdy (l15_fp_rdy),
        .fpu_arb_data_rdy (fpu_arb_data_rdy),
        .fpu_arb_data (fpu_arb_data),
        .fpu_arb_grant (fpu_arb_grant),
        .ctu_tst_pre_grst_l(1'b1),
        .global_shift_enable(1'b0),
        .ctu_tst_scan_disable(1'b1),
        .ctu_tst_scanmode(),
        .ctu_tst_macrotest(1'b0),
        .ctu_tst_short_chain(),
        .si(),
        .so()
    );

`endif

endmodule
