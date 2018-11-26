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

`include "define.tmp.h"

// Filename: random_addrdata.v
// Author: mmckeown
// Description: This module generates random
//              addresses and data.  Note that
//              this module assumes the top
//              address of the memory is a
//              power of two, i.e. mem_top_addr
//              is all 1s in the valid address
//              bit range

module random_addrdata(
    input                               clk,
    input                               rst_n,
    input                               en,

    input      [`PHY_ADDR_WIDTH-1:0]    addr_incr_val,
    input      [`PHY_ADDR_WIDTH-1:0]    mem_top_addr,

    input                               test_state_reset,

    input                               next_rdy,
    output reg                          next_val,
    output reg [`PHY_ADDR_WIDTH-1:0]    next_addr,
    output     [511:0]                  next_data,

    output reg                          done
);

///////////////////////
// Type declarations //
///////////////////////

parameter                               DONE_COUNTER_THRESHOLD = 1073741824;
parameter                               DONE_COUNTER_WIDTH = 31;

localparam                              GEN_RANDOM_STATE_RESET = 1'b0;
localparam                              GEN_RANDOM_STATE_NON_RESET = 1'b1;

localparam                              LFSR_SEED = 8832'h3ba06424277b3adf678899218901790a83e9322c2c6b75cdeb3267d1c94e9272446cffdf067f9cc69fccc993d68bd22a9cd05a24c82051540a4c29631c7bc5f887251419df48d1da11fb477c17cb23bc20311e2a3b9466319917bd23171400c5e1e837f3e3d696db579bb1fae406817447e545e856b93942152889ea8dbe687669f86cf333d97fba880b66b2ae5af3e5fc9c8879b8f1c5b01357c72b7c08523c1761110a0e9f320d41f3c40f6d3a67aaa6271c2bdb5d333482b006e99a77eece83042d67a2a34bc650ddbd4ac5433058ca1e165373ae5750a37065388252a57e696b7d6805da1edd177e4a903f808a5c2a4a7f08f4dc693bc08b1f4c4df2946de4b7bace5ae3a382d9fc575fdd58c6af12f598827522c92e233779080fb1b5ca8390f71d1361d9ac3316e193a246108c214272a76400e96560b8e931b155fe79eeab8d09b97026107977753d0708a2a9772ae84b0b496a6dd23270dd3cf7e3d9ed17ef3e9a2aa7110aaa24ab67ff039781910899c0f4a99129ba0299ec77be1bf25dd5958ea1620c2ff30b0eef774e0f45e0956bd70e1f3a5bb931ff39b44921d7b4e12389c100e8255cecfbc642866dbd5606e297f061ff5ba5ed188de46515879b0b2895865525c676b6c87c1935b96dcbc73ded4e31050ce03700a08c61a23d17348078c00be70d5339709434179bba4df82f1fcedf6a7f04798c5bc5f83b0c5d11e555efa40c33f703469638d864eeda5955bb708ad379c35e88c996372301bc794f2242021cf4a40834ab814cec39686beca1faeb18ff64858ca3573668f528a10f6d058a060dd474a65c4c2aa5ed42b6053c6f9527167bf5475416ce78b3a2afcc013ba8660e90a10092c55f96c937d27bbc58b5c33c22280f0cb1edc30d819130d1c197bf6433c24252ec883fb959b7972d9c4e51c878e80e5a8f3ace261cb459f7f7f6eb7adcb58959667044016c160e1e465e9a96dca53aeca668a9cf9afcdd6299a9206a491d4c9a08d038ef38ba3be884bc11d5fa9b9733db9a554b6c73982804928f34537ec316fdae02e0527ea7034131010da25317c6800f1ba65b1cfae14c2c9089e8dac1ad91d163388b5b4505c46e2e2e85b33f260b42309b6c598c42dd00e4539f0324afd0055c92d4978cf8c4d2a9d5333b49b643e580d80597fa5f4c335c8bd6cb5eb17a3e57f8bd3e4ed024db00fa5b82db573dfa8ebfd3ee8e46e8feadb8ab1e3a2bc5eb058ab7ced73e1627e6d3963605df79ccf90da3b38dd4a28cefe409306c099e013d1c8846eb52f45982fdd360cb570bbaf37624bb18433def5338e65ff1e926df29247c08353482902578c44c3bd49b5c8c216f21829c462bbe4be316b605f09d0c8611dc7438f3d2e3b7f5a766af5115e0aa24903804978a0f580fa00354f4b793d1d67cba4f02bd272ff9b70e147047d2a5bef399cd377f3e8b2f6b412dde36c2c88bde33044acb4ce833a7d75b61bb5ba77e1d32df254426616d3c816e49b910e0e2fdd81934a442b80b671e946eee73da929779a79bab1e317f4cd1d5cd1bb3;

// Generation state
reg                                     gen_random_state_f;
reg                                     gen_random_state_next;

// LFSR signals
reg                                     lfsr_ld_seed;
wire [`PHY_ADDR_WIDTH-1:0]              lfsr_addr_out;

// Done counter signals
wire                                    done_count_trigger;
reg                                     done_next;

//////////////////////
// Sequential Logic //
//////////////////////

always @ (posedge clk)
begin
    if (~rst_n)
    begin
        gen_random_state_f <= GEN_RANDOM_STATE_RESET;
        
        done <= 1'b0;
    end
    else
    begin
        gen_random_state_f <= gen_random_state_next;

        done <= done_next;
    end
end

/////////////////////////
// Combinational Logic //
/////////////////////////

always @ *
begin
    gen_random_state_next = gen_random_state_f;
    lfsr_ld_seed = 1'b0;
    done_next = done;

    case (gen_random_state_f)
        GEN_RANDOM_STATE_RESET:
        begin
            if (en)
                gen_random_state_next = GEN_RANDOM_STATE_NON_RESET;

            lfsr_ld_seed = 1'b1;
        end
        GEN_RANDOM_STATE_NON_RESET:
        begin
            // If data is received and done trigger is high signals
            // we are done with all data
            if (next_rdy && next_val && done_count_trigger)
                done_next = 1'b1;
        end
        default:
        begin
            gen_random_state_next = 1'bx;
            lfsr_ld_seed = 1'bx;
            done_next = 1'bx;
        end
    endcase
end

always @ *
    next_val = (gen_random_state_f == GEN_RANDOM_STATE_NON_RESET) && ~done;

always @ *
    next_addr = lfsr_addr_out & mem_top_addr;

//////////////////////////
// Sub-module Instances //
//////////////////////////

sparc_ifu_esl_lfsr lfsrs[`PHY_ADDR_WIDTH+511:0](
    .clk(clk),
    .rst_n(rst_n),

    .lfsr_seed(LFSR_SEED),
    .lfsr_ld(lfsr_ld_seed),

    .lfsr_step(next_val & next_rdy),
    
    .lfsr_state_f(),

    .lfsr_out_f({next_data, lfsr_addr_out})
);

alarm_counter #(
    .COUNTER_WIDTH(DONE_COUNTER_WIDTH),
    .ALARM_THRESHOLD(DONE_COUNTER_THRESHOLD)
)done_counter(
    .clk(clk),
    .rst_n(rst_n),
    .en(next_val & next_rdy),
    .trigger(done_count_trigger)
);

endmodule
