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

  parameter IN_REGS = 0; // register inputs to improve timing
  logic [CMAC_FULL_DAT_BYTES*8-1 :0] data;
  logic [CMAC_FULL_DAT_BYTES  -1 :0] keep;
  logic badpack;
  logic last;
  logic valid;
  if (IN_REGS) begin
    always_ff @(posedge clk) begin
      data    <= data_in;
      keep    <= keep_in;
      badpack <= badpack_in;
      last    <= last_in;
      valid   <= valid_in;
    end
  end else begin
    assign data    = data_in;
    assign keep    = keep_in;
    assign badpack = badpack_in;
    assign last    = last_in;
    assign valid   = valid_in;
  end

  parameter FIFO_DEPTH_LOG = 9;
  reg  [CMAC_FULL_DAT_BYTES*8 :0] fifo[2**FIFO_DEPTH_LOG];
  reg  [FIFO_DEPTH_LOG        :0] rd_ptr;
  reg  [FIFO_DEPTH_LOG        :0] wr_ptr;
  wire [FIFO_DEPTH_LOG        :0] wr_ptr_inc = wr_ptr + 'b1;
  reg  [FIFO_DEPTH_LOG        :0] wr_ptr_pack;

  wire [CMAC_USE_DAT_BYTES-1 :0] mask_used = data[CMAC_USE_DAT_BYTES*8 +: CMAC_USE_DAT_BYTES];
  wire [AXIS_TDEST_BYTES*8-1 :0] chan_curr = data[CMAC_USE_DAT_BYTES*8 +  CMAC_USE_DAT_BYTES +: AXIS_TDEST_BYTES*8];
  reg  [AXIS_TDEST_BYTES*8-1 :0] chan_prev;
  reg  start_pack;
  reg  discrd_pack;

  // FIFO write logic with packet filtering
  always_ff @(posedge clk)
    if (rst) begin
      wr_ptr      <= '0;
      wr_ptr_pack <= '0;
      start_pack  <= '1;
      discrd_pack <= '0;
      chan_prev   <= '0;
    end else if (valid) begin
      if ( // Accept packet word if:
          ((rd_ptr ^ wr_ptr) != (2**FIFO_DEPTH_LOG)) && // fifo is not full,
          (keep == '1)                               && // all bytes of CMAC word are utilized,
          (start_pack || (chan_prev == chan_curr))   && // channel number stays the same along the packet,
          (last ? !badpack : mask_used == '1)        && // correct CRC in the end of packet OR all data bytes are valid inside the packet,
          !discrd_pack)                                 // the packet is not discarded yet.
      begin
        fifo[wr_ptr[FIFO_DEPTH_LOG-1:0]] <= {last, data};
        wr_ptr <= wr_ptr_inc;
        if (last) wr_ptr_pack <= wr_ptr_inc; // good packet is finished, advance the packet pointer
      end else begin // Otherwise:
        wr_ptr <= wr_ptr_pack; // discard bad or missed packet,
        discrd_pack <= '1;     // discard such packet upto the end.
      end
      chan_prev  <= chan_curr;
      start_pack <= last;
      if (last) discrd_pack <= '0; // restore reception at the end
    end

  // FIFO read logic
  always_ff @(posedge clk)
    if (rst) rd_ptr <= '0;
    else if (valid_out && ready_out) rd_ptr <= rd_ptr + 1;

  assign valid_out = (rd_ptr != wr_ptr_pack); // fifo is not empty with whole packets
  wire [CMAC_FULL_DAT_BYTES*8 :0] fifo_rd = fifo[rd_ptr[FIFO_DEPTH_LOG-1:0]];
  assign data_out  = fifo_rd[CMAC_USE_DAT_BYTES*8-1 :0];
  assign keep_out  = fifo_rd[CMAC_USE_DAT_BYTES*8 +: CMAC_USE_DAT_BYTES];
  assign dest_out  = fifo_rd[CMAC_USE_DAT_BYTES*8 +  CMAC_USE_DAT_BYTES +: AXIS_TDEST_BYTES*8];
  assign last_out  = fifo_rd[CMAC_FULL_DAT_BYTES*8];

endmodule
