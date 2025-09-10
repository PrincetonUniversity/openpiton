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

       input  [`NOC_DATA_WIDTH-1:0] flit_in,
       input  last_in,
       input  valid_in,
       output ready_in,

       output [`NOC_DATA_WIDTH-1:0] flit_out,
       output valid_out,
       input  ready_out
);

assign flit_out = flit_in;

reg [$clog2(NOC_ETHHDR_RATIO):0] hdr_cnt;
always @(posedge clk)
  if(rst) hdr_cnt <= NOC_ETHHDR_RATIO;
  else if (valid_in && ready_in) begin
    if (hdr_cnt) hdr_cnt <= hdr_cnt - 'h1;
    if (last_in) hdr_cnt <= NOC_ETHHDR_RATIO;
  end

assign valid_out = valid_in && !hdr_cnt;
assign ready_in  = ready_out || hdr_cnt;

endmodule
