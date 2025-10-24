/* ------------------------------------------------------------------
 * Organization   : Barcelona Supercomputing Center
 * Project        : BZL
 * File           : 
 * Description    : Generator of "last" signal for NOC "valrdy" domain in notion of AXI-Stream standard
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

module valrdy_last_gen (
       input clk,
       input rst,
       input [`NOC_DATA_WIDTH-1:0] flit_in,
       input valid_in,
       input ready_in,
       output last_out
);

reg [`MSG_LENGTH_WIDTH-1:0] remaining_flits;
always @(posedge clk)
  if(rst) remaining_flits <= `MSG_LENGTH_WIDTH'h0;
  else if (valid_in & ready_in) begin
    if (remaining_flits == `MSG_LENGTH_WIDTH'h0) remaining_flits <= flit_in[`MSG_LENGTH];
    else remaining_flits <= remaining_flits - `MSG_LENGTH_WIDTH'h1;
  end

assign last_out = (remaining_flits == `MSG_LENGTH_WIDTH'h1) ||
                 ((remaining_flits == `MSG_LENGTH_WIDTH'h0) &&
             (flit_in[`MSG_LENGTH] == `MSG_LENGTH_WIDTH'h0) && valid_in);

endmodule
