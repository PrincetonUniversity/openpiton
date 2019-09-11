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

//==================================================================================================
//  Filename      : synchronizer.v
//  Created On    : 2014-01-31 12:52:57
//  Last Modified : 2018-11-29 17:02:47
//  Revision      :
//  Author        : Tri Nguyen
//  Company       : Princeton University
//  Email         : trin@princeton.edu
//
//  Description   :
//==================================================================================================

`ifdef L15_EXTRA_DEBUG
`default_nettype none
`endif

module synchronizer (
    clk,
    presyncdata,
    syncdata
    );

// synopsys template
parameter SIZE = 1;

input wire clk;
input wire [SIZE-1:0] presyncdata;
output reg [SIZE-1:0] syncdata;

`ifdef PITON_ARIANE
// this prevents SV assertion failures in Ariane
// pragma translate_off
`define SIM_RST_INIT
// pragma translate_on
`ifdef SIM_RST_INIT
  reg [SIZE-1:0] presyncdata_tmp = {{SIZE}{1'b0}};
`else
  reg [SIZE-1:0] presyncdata_tmp;
`endif
`undef SIM_RST_INIT
`else
  reg [SIZE-1:0] presyncdata_tmp;
`endif


    // bw_u1_syncff_4x u_synchronizer_syncff [SIZE-1:0](.q(presyncdata_tmp),
    //                  .so(),
    //                  .ck(clk),
    //                  .d(presyncdata),
    //                  .sd(),
    //                  .se(1'b0)
    //                  );

    // bw_u1_soff_2x u_synchronizer_ff[SIZE-1:0] (.q(syncdata),
    //                  .so(),
    //                  .ck(clk),
    //                  .d(presyncdata_tmp),
    //                  .sd(),
    //                  .se(1'b0)
    //                  );

always @ (posedge clk)
begin
    presyncdata_tmp <= presyncdata;
    syncdata        <= presyncdata_tmp;
end

endmodule

