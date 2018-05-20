// Copyright (c) 2017 Princeton University
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

// Module to synchronize interrupt coming from the emac clock domain
// to the ciop clock domain
// Uses sync with ack
module net_int_sync (
// this is net_axi_clk
input clk_emac,
// depends where we put the module, but this is either chipset_clk or clk
input clk_ciop,
input rst_n,
// net_interrupt wire
input net_int,
// interrupt that should go to ciop
(* ASYNC_REG = "TRUE" *) output reg sync_int);

// 2 ff for synchronizing interrupt to ciop clock domain
(* ASYNC_REG = "TRUE" *) reg int_buffer_ff;
// 2nd ff is output sync_int

// 2 ff for synchronizing acknowledegement to emac clock domain
(* ASYNC_REG = "TRUE" *) reg ack_buffer_ff;
(* ASYNC_REG = "TRUE" *) reg sync_ack;

// store into store_int when the interrupt goes high, reset
// when the acknowledgement comes back from the other clock 
// (or on actual reset)
(* ASYNC_REG = "TRUE" *) reg store_int;
   
// pretty sure this should be clocked to emac's clock domain
// but not sure
always @(posedge clk_emac or posedge net_int) begin
    if (~rst_n) begin
        store_int <= 1'b0;
    end
    // if we're in here because interrupt went high
    else if (net_int) begin
        store_int <= 1'b1;
    end
    // if we're in here, because clock edge and the interrupt got "acknowledged"
    else if (sync_ack) begin
        store_int <= 1'b0;
    end
end

// synchronize the interrupt to ciop's clock domain
// sync_int will stay high for @ least 1 cycle in ciop's clock domain
always @(posedge clk_ciop) begin
    if (~rst_n) begin
        int_buffer_ff <= 1'b0;
        sync_int <= 1'b0;
    end
    else begin
        int_buffer_ff <= store_int;
        sync_int <= int_buffer_ff;
    end
end

// synchronize the acknowledgement to emac's clock domain
// this is going back to the faster domain, so don't have to store the 
// output of the acknowledgement from ciop
always @(posedge clk_emac) begin
    if (~rst_n) begin
        ack_buffer_ff <= 1'b0;
        sync_ack <= 1'b0;
    end
    else begin
        ack_buffer_ff <= sync_int;
        sync_ack <= ack_buffer_ff;
    end
end
endmodule
