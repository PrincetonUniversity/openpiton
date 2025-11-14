/* ------------------------------------------------------------------
 * Organization   : Barcelona Supercomputing Center
 * Project        : BZL
 * File           : 
 * Description    : Initial filter/converter of Ethernet frame got from CMAC Xilinx IP before demuxing
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

module ethcmac_to_demux (
  input clk,
  input rst,

  input [CMAC_FULL_DAT_BYTES*8-1 :0] data_in,
  input [CMAC_FULL_DAT_BYTES  -1 :0] keep_in,
  input badp_in,
  input last_in,
  input valid_in,

  output [CMAC_USE_DAT_BYTES*8-1 :0] data_out,
  output [CMAC_USE_DAT_BYTES  -1 :0] keep_out,
  output [AXIS_TDEST_BYTES  *8-1 :0] dest_out,
  output last_out,
  input  ready_out,
  output valid_out
);

  assign data_out  = data_in[CMAC_USE_DAT_BYTES*8-1 :0];
  assign keep_out  = data_in[CMAC_USE_DAT_BYTES*8 +: CMAC_USE_DAT_BYTES];
  assign dest_out  = data_in[CMAC_USE_DAT_BYTES*8 +  CMAC_USE_DAT_BYTES +: AXIS_TDEST_BYTES*8];
  assign last_out  = last_in;
  assign valid_out = valid_in;

endmodule
