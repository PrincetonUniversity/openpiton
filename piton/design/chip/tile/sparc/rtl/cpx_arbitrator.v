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

// the cpx arbitrator should give priority to the L1.5
// when communicating with the sparc core

module cpx_arbitrator(
   clk,
   rst_n,

   uncore_spc_data_ready,
   uncore_spc_data,
   uncore_spc_grant,

   rtap_arb_req_val,
   rtap_arb_req_data,
   rtap_arb_req_threadid,

   fpu_arb_data_rdy,
   fpu_arb_data,
   fpu_arb_grant,

   cpx_arb_spc_data_rdy,
   cpx_arb_spc_data,
   cpx_arb_spc_grant
   );

   input clk;
   input rst_n;

   input               uncore_spc_data_ready;
   input [144:0]       uncore_spc_data;
   input [4:0]         uncore_spc_grant;

   input               fpu_arb_data_rdy;
   input [144:0]       fpu_arb_data;
   input               fpu_arb_grant;

   input               rtap_arb_req_val;
   input [63:0]        rtap_arb_req_data;
   input [1:0]         rtap_arb_req_threadid;

   output reg          cpx_arb_spc_data_rdy;
   output reg [144:0]  cpx_arb_spc_data;
   output reg [4:0]    cpx_arb_spc_grant;

   reg [144:0]         rtap_interrupt_packet;

   always @ *
   begin
      // make the interrupt packet on behalf of jtag
      rtap_interrupt_packet = 0;
      rtap_interrupt_packet[144] = 1'b1;
      rtap_interrupt_packet[143:140] = `INT_RET;
      rtap_interrupt_packet[135:134] = rtap_arb_req_threadid;
      rtap_interrupt_packet[63:0] = rtap_arb_req_data;
   end

   always @*
   begin
      cpx_arb_spc_data_rdy = uncore_spc_data_ready | fpu_arb_data_rdy | rtap_arb_req_val;
      // cpx_arb_spc_data = uncore_spc_data_ready ? uncore_spc_data : fpu_arb_data;

      cpx_arb_spc_data = 0;
      if (uncore_spc_data_ready)
         cpx_arb_spc_data = uncore_spc_data;
      else if (fpu_arb_data_rdy)
         cpx_arb_spc_data = fpu_arb_data;
      else if (rtap_arb_req_val)
         cpx_arb_spc_data = rtap_interrupt_packet;

      cpx_arb_spc_grant[4:1] = uncore_spc_grant;
      cpx_arb_spc_grant[0] = fpu_arb_grant | uncore_spc_grant;
   end
endmodule
