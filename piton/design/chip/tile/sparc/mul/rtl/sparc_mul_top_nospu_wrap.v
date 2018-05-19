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

// Wraps the sparc_mul_top tieing all unused signals when no SPU is present

module sparc_mul_top_nospu_wrap
(
    input           rclk,
    input           grst_l,
    input           arst_l,
    input           exu_mul_input_vld,
    input [63:0]    exu_mul_rs1_data,
    input [63:0]    exu_mul_rs2_data,
    output          mul_exu_ack,
    output [63:0]   mul_data_out
);

    sparc_mul_top sparc_mul_top 
    (
        .si (),
        .so (),
        .grst_l (grst_l),
        .arst_l (arst_l),
        .mul_exu_ack (mul_exu_ack),
        .mul_spu_ack (),
        .mul_spu_shf_ack (),
        .mul_data_out (mul_data_out),
        .rclk (rclk),
        .se (),
        .exu_mul_input_vld (exu_mul_input_vld),
        .exu_mul_rs1_data (exu_mul_rs1_data),
        .exu_mul_rs2_data (exu_mul_rs2_data),
        .spu_mul_req_vld (1'b0),
        .spu_mul_acc (1'b0),
        .spu_mul_areg_shf (1'b0),
        .spu_mul_areg_rst (1'b0),
        .spu_mul_op1_data (64'h0000000000000000),
        .spu_mul_op2_data (64'h0000000000000000),
        .spu_mul_mulres_lshft ()
    );

endmodule
