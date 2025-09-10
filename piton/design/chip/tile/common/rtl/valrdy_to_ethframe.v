/* ------------------------------------------------------------------
 * Organization   : Barcelona Supercomputing Center
 * Project        : BZL
 * File           : 
 * Description    : Generator of Ethernet frame from NOC packet (insertion of destination/source MAC addresses + Payload length) 
 * Authors        : alexander.kropotov@bsc.es
 * ------------------------------------------------------------------
 * COPYRIGHT
 *  Copyright (c) Barcelona Supercomputing Center
 * ------------------------------------------------------------------
 * LICENSE
 *  Licensed under the Solderpad Hardware License v 2.1 (the
 *  "License"); you may not use this file except in compliance
 *  with the License, or, at your option, the Apache License
 *  version 2.0. You may obtain a copy of the License at
 *
 *  http://www.solderpad.org/licenses/SHL-2.1
 *
 *  Unless required by applicable law or agreed to in writing,
 *  work distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 *  either express or implied. See the License for the specific
 *  language governing permissions and limitations under the License.
 * ------------------------------------------------------------------
 * Revision History
 *  Revision   | Author     | Description
 *             |            | 
 * ------------------------------------------------------------------
*/

`include "define.tmp.h"

module valrdy_to_ethframe (
       input clk,
       input rst,

       input  [2*MAC_ADDR_WIDTH-1:0] dst_src_mac,

       input  [`NOC_DATA_WIDTH-1:0] flit_in,
       input  valid_in,
       output ready_in,

       output [`NOC_DATA_WIDTH-1:0] flit_out,
       output valid_out,
       output last_out,
       input  ready_out
);

localparam NOC_HDR_WIDTH = NOC_ETHHDR_RATIO * `NOC_DATA_WIDTH;
localparam CMAC_FULL_DAT_BYTES = 64;
localparam CMAC_DATA_OVERHD_BYTES = 8;
localparam CMAC_USE_DAT_BYTES = CMAC_FULL_DAT_BYTES - CMAC_DATA_OVERHD_BYTES;

wire [ETH_PAYLD_LEN_WIDTH-1:0] noc_pack_len = ((flit_in[`MSG_LENGTH]+1) << $clog2(`NOC_DATA_WIDTH/8)) + NOC_HDR_WIDTH/8;
//wire [ETH_PAYLD_LEN_WIDTH-1:0] cmac_pack_beats = (noc_pack_len + CMAC_USE_DAT_BYTES-1) / CMAC_USE_DAT_BYTES; // true division with ceiling
wire [ETH_PAYLD_LEN_WIDTH-1:0] cmac_pack_beats = CMAC_USE_DAT_BYTES   >= noc_pack_len ? 1 :
                                                 CMAC_USE_DAT_BYTES*2 >= noc_pack_len ? 2 : 3; // substitution of division assuming maximum 3 beats
wire [ETH_PAYLD_LEN_WIDTH-1:0] payload_len = (cmac_pack_beats << $clog2(CMAC_FULL_DAT_BYTES)) - ETH_HDR_WIDTH/8;
wire [NOC_HDR_WIDTH-1:0] header = {'h0, payload_len, dst_src_mac};

reg [$clog2(NOC_ETHHDR_RATIO):0] hdr_cnt;
always @(posedge clk)
  if(rst) hdr_cnt <= NOC_ETHHDR_RATIO;
  else if (valid_out && ready_out) begin
    if (hdr_cnt)  hdr_cnt <= hdr_cnt - 'h1;
    if (last_out) hdr_cnt <= NOC_ETHHDR_RATIO;
  end

assign ready_in = ready_out && !hdr_cnt;
assign valid_out = valid_in;

reg [`MSG_LENGTH_WIDTH-1:0] remaining_flits;
always @(posedge clk)
  if(rst) remaining_flits <= `MSG_LENGTH_WIDTH'h0;
  else if (valid_in & ready_in) begin
    if (remaining_flits == `MSG_LENGTH_WIDTH'h0) remaining_flits <= flit_in[`MSG_LENGTH];
    else remaining_flits <= remaining_flits - `MSG_LENGTH_WIDTH'h1;
  end

assign last_out = ((remaining_flits == `MSG_LENGTH_WIDTH'h1) ||
                  ((remaining_flits == `MSG_LENGTH_WIDTH'h0) &&
              (flit_in[`MSG_LENGTH] == `MSG_LENGTH_WIDTH'h0) && valid_in)) && !hdr_cnt;

assign flit_out = hdr_cnt ? header[(NOC_ETHHDR_RATIO - hdr_cnt)*`NOC_DATA_WIDTH +: `NOC_DATA_WIDTH] : flit_in;

endmodule
