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

       input  [2*MAC_ADDR_WIDTH-1:0] dst_src_mac_tx,
       input  [2*MAC_ADDR_WIDTH-1:0] dst_src_mac_ref,

       input  [`NOC_DATA_WIDTH-1:0] flit_in,
       input  valid_in,
       output ready_in,

       output [`NOC_DATA_WIDTH-1:0] data_out,
       output valid_out,
       output last_out,
       input  ready_out,

       input  [`NOC_DATA_WIDTH-1:0] data_ack,
       input  valid_ack,
       input  last_ack,
       output ready_ack
);

parameter SINGLE_INFLIT = 0;

wire [`MSG_LENGTH_WIDTH-1:0] noc_msg_len = SINGLE_INFLIT ? `MSG_LENGTH_WIDTH'h0 : flit_in[`MSG_LENGTH];
wire [ETH_PAYLD_LEN_WIDTH-1:0] noc_pack_len = ((noc_msg_len +1) << $clog2(`NOC_DATA_WIDTH/8)) + ETHHDR_NOC_WIDTH/8;

//wire [ETH_PAYLD_LEN_WIDTH-1:0] cmac_pack_beats = (noc_pack_len + CMAC_USE_DAT_BYTES-1) / CMAC_USE_DAT_BYTES; // true division with ceiling
wire [ETH_PAYLD_LEN_WIDTH-1:0] cmac_pack_beats = CMAC_USE_DAT_BYTES   >= noc_pack_len ? 1 : // substitution of division taking into accoount maximum possible beats
                                                 CMAC_USE_DAT_BYTES*2 >= noc_pack_len ? 2 : MAX_CMAC_PACK_BEATS;

if (ETHHDR_NOC_WIDTH/8 > CMAC_USE_DAT_BYTES) begin
  $fatal("Ethernet header with length %d does not fit into single CMAC AXI data beat with length %d as a condition of feasible further Eth frame payload length",
         ETHHDR_NOC_WIDTH/8, CMAC_USE_DAT_BYTES);
end
wire [ETH_PAYLD_LEN_WIDTH-1:0] ethfr_payld_len = (cmac_pack_beats << $clog2(CMAC_FULL_DAT_BYTES)) - ETHHDR_WIDTH/8;
// swapping bytes in payload length for big-end network byte order (old IEEE802.3 usage of the Ethertype field as Eth payload length)
// wire [ETHHDR_NOC_WIDTH-1:0] header = {'h0, ethfr_payld_len[7:0], ethfr_payld_len[ETH_PAYLD_LEN_WIDTH-1:8], dst_src_mac_tx};
wire [ETHHDR_NOC_WIDTH-1:0] header = {'h0, ETHTYPE_BYTE0, ETHTYPE_BYTE1, dst_src_mac_tx};

reg [$clog2(ETHHDR_NOC_FLITS):0] hdr_cnt;
always @(posedge clk)
  if(rst) hdr_cnt <= ETHHDR_NOC_FLITS;
  else if (valid_out && ready_out) begin
    if (hdr_cnt) begin 
                  hdr_cnt <= hdr_cnt - 'h1;
                  assert(ethfr_payld_len <= MAX_ETHFR_PAYLD_LEN) else $error("Eth frame payload length %d exceeds maximum possible value %d",
                         ethfr_payld_len,   MAX_ETHFR_PAYLD_LEN);
                 end
    if (last_out) hdr_cnt <= ETHHDR_NOC_FLITS;
  end

assign ready_in = ready_out && !hdr_cnt;
assign valid_out = valid_in;

reg [`MSG_LENGTH_WIDTH-1:0] remaining_flits;
always @(posedge clk)
  if(rst) remaining_flits <= `MSG_LENGTH_WIDTH'h0;
  else if (valid_in & ready_in) begin
    if (remaining_flits == `MSG_LENGTH_WIDTH'h0) remaining_flits <= noc_msg_len;
    else remaining_flits <= remaining_flits - `MSG_LENGTH_WIDTH'h1;
  end

assign last_out = ((remaining_flits == `MSG_LENGTH_WIDTH'h1) ||
                  ((remaining_flits == `MSG_LENGTH_WIDTH'h0) &&
                       (noc_msg_len == `MSG_LENGTH_WIDTH'h0) && valid_in)) && !hdr_cnt;

assign data_out = hdr_cnt ? header[(ETHHDR_NOC_FLITS - hdr_cnt)*`NOC_DATA_WIDTH +: `NOC_DATA_WIDTH] : flit_in;

assign ready_ack = 1'b1;

endmodule
