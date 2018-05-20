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

// Wraps bw_r_irf_register with specific parameteres


module bw_r_irf_register16
(
    input               clk,
    input               reset_l,
    input   [1:0]       wrens,
    input               save,
    input   [3:0]       save_addr,
    input               restore,
    input   [3:0]       restore_addr,
    input   [71:0]      wr_data0,
    input   [71:0]      wr_data1,
    input               rd_thread,
    output  [71:0]      rd_data
);

`ifdef FPGA_SYN_1THREAD
    bw_r_irf_register bw_r_irf_register
    (
        .clk                (clk),
        .reset_l            (reset_l),
        .wren               (wrens),
        .save               (save),
        .save_addr          (save_addr),
        .restore            (restore),
        .restore_addr       (restore_addr),
        .wr_data            (wr_data0),
        .rd_data            (rd_data)
    );
`else
    bw_r_irf_register bw_r_irf_register
    (
        .clk                (clk),
        .reset_l            (reset_l),
        .wrens              (wrens),
        .save               (save),
        .save_addr          (save_addr),
        .restore            (restore),
        .restore_addr       (restore_addr),
        .wr_data0           (wr_data0),
        .wr_data1           (wr_data1),
        .rd_thread          (rd_thread),
        .rd_data            (rd_data)
    );
`endif

endmodule
