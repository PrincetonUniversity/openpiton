/* ------------------------------------------------------------------
 * Organization   : Barcelona Supercomputing Center
 * Project        : BZL
 * File           : 
 * Description    : Extractor of header from Ethernet frame (destination/source MAC addresses + Payload length) to convert to NOC packet
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

module ethframe_to_valrdy (
       input clk,
       input rst,

       input  [2*MAC_ADDR_WIDTH-1:0] dst_src_mac,
       output [ETHHDR_WIDTH-1:0] eth_hdr_out,

       input  [`NOC_DATA_WIDTH-1:0] flit_in,
       input  last_in,
       input  valid_in,
       output ready_in,

       output [`NOC_DATA_WIDTH-1:0] flit_out,
       output valid_out,
       input  ready_out
);

assign flit_out = flit_in;

reg [$clog2(ETHHDR_NOC_FLITS):0] hdr_cnt;
reg [ETHHDR_NOC_WIDTH-1:0] header;
always @(posedge clk)
  if(rst) begin
    hdr_cnt <= ETHHDR_NOC_FLITS;
    header  <= 'h0;
  end
  else if (valid_in && ready_in) begin
    if (hdr_cnt) begin
      hdr_cnt <= hdr_cnt - 'h1;
      header[(ETHHDR_NOC_FLITS - hdr_cnt)*`NOC_DATA_WIDTH +: `NOC_DATA_WIDTH] <= flit_in;
      // header <= {flit_in, header[ETHHDR_NOC_FLITS * `NOC_DATA_WIDTH -1 : `NOC_DATA_WIDTH]};
    end
    if (last_in) hdr_cnt <= ETHHDR_NOC_FLITS;
  end

// swap of bytes in payload length from big-end network byte order
wire [ETH_PAYLD_LEN_WIDTH-1:0] ethfr_payld_len = {header[2*MAC_ADDR_WIDTH+7 : 2*MAC_ADDR_WIDTH],
                                                  header[ETHHDR_WIDTH-1     : ETHHDR_WIDTH-8]};
wire header_ok = (ethfr_payld_len <= MAX_ETHFR_PAYLD_LEN) && (header[2*MAC_ADDR_WIDTH-1 :0] == dst_src_mac);

assign eth_hdr_out = header[ETHHDR_WIDTH-1:0];
assign valid_out = valid_in && !hdr_cnt && header_ok;
assign ready_in  = hdr_cnt || (ready_out && header_ok) || !header_ok;

endmodule
