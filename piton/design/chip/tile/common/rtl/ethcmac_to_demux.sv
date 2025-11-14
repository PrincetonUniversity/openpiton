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
  input badpack_in,
  input last_in,
  input valid_in,

  output [CMAC_USE_DAT_BYTES*8-1 :0] data_out,
  output [CMAC_USE_DAT_BYTES  -1 :0] keep_out,
  output [AXIS_TDEST_BYTES  *8-1 :0] dest_out,
  output last_out,
  input  ready_out,
  output valid_out
);
  parameter FIFO_DEPTH_LOG = 5;

  reg  [CMAC_FULL_DAT_BYTES*8 :0] fifo[2**FIFO_DEPTH_LOG];
  reg  [FIFO_DEPTH_LOG        :0] rd_ptr;
  reg  [FIFO_DEPTH_LOG        :0] wr_ptr;
  wire [FIFO_DEPTH_LOG        :0] wr_ptr_inc = wr_ptr + 'b1;
  reg  [FIFO_DEPTH_LOG        :0] wr_ptr_pack;

  assign valid_out =  (rd_ptr != wr_ptr_pack); // fifo is not empty with packets
  wire full        = ((rd_ptr ^  wr_ptr) == (2**FIFO_DEPTH_LOG)); // fifo is full

  wire [CMAC_USE_DAT_BYTES-1 :0] keep_extr = data_in[CMAC_USE_DAT_BYTES*8 +: CMAC_USE_DAT_BYTES];
  wire [AXIS_TDEST_BYTES*8-1 :0] dest_extr = data_in[CMAC_USE_DAT_BYTES*8 +  CMAC_USE_DAT_BYTES +: AXIS_TDEST_BYTES*8];
  reg  [AXIS_TDEST_BYTES*8-1 :0] dest_prev;
  reg  last_prev;
  wire good_cur = (keep_in == '1) && // all bytes of CMAC are utilized
                  (last_prev || (dest_prev == dest_extr)) && // channel number should stay the same along the packet
                  (last_in ? !badpack_in : keep_extr == '1); // correct CRC in the end OR all valid data bytes in the middle
  reg  dropped;

  always_ff @(posedge clk)
    if (rst) begin
      wr_ptr      <= '0;
      wr_ptr_pack <= '0;
      last_prev   <= '1;
      dropped     <= '0;
      dest_prev   <= '0;
    end else if (valid_in) begin
      if (!full && good_cur && !dropped) begin
        fifo[wr_ptr[FIFO_DEPTH_LOG-1:0]] <= {last_in, data_in};
        wr_ptr <= wr_ptr_inc;
        if (last_in) wr_ptr_pack <= wr_ptr_inc; // good packet is finished, advance packet pointer
      end else begin
        wr_ptr <= wr_ptr_pack; // drop bad or missed packet
        dropped <= '1; // packet is dropped upto the end
      end
      dest_prev <= dest_extr;
      last_prev <= last_in;
      if (last_in) dropped <= '0; // restore reception at the end
    end

  always_ff @(posedge clk)
    if (rst) rd_ptr <= '0;
    else if (valid_out && ready_out) rd_ptr <= rd_ptr + 1;

  wire [CMAC_FULL_DAT_BYTES*8 :0] fifo_rd = fifo[rd_ptr[FIFO_DEPTH_LOG-1:0]];
  assign data_out  = fifo_rd[CMAC_USE_DAT_BYTES*8-1 :0];
  assign keep_out  = fifo_rd[CMAC_USE_DAT_BYTES*8 +: CMAC_USE_DAT_BYTES];
  assign dest_out  = fifo_rd[CMAC_USE_DAT_BYTES*8 +  CMAC_USE_DAT_BYTES +: AXIS_TDEST_BYTES*8];
  assign last_out  = fifo_rd[CMAC_FULL_DAT_BYTES*8];

endmodule
