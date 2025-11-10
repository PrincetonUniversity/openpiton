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
       output [ETHFR_RETRY_TIME_WIDTH-1 :0] wait_time,
       output [ETHFR_RETRIES_WIDTH   -1 :0] retries,

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
reg  [ETHFR_ID_WIDTH-1 :0] ethfr_id;
wire [ETH_PAYLD_LEN_WIDTH-1:0] ethfr_payld_len_tx = (cmac_pack_beats << $clog2(CMAC_FULL_DAT_BYTES)) - ETHHDR_WIDTH/8;
// swapping bytes in payload length for big-end network byte order (IEEE802.3 usage of the Ethertype field as Eth payload length)
// wire [ETHHDR_NOC_WIDTH-1:0] header_tx = {'0, ethfr_id, ethfr_payld_len_tx[7:0], ethfr_payld_len_tx[ETH_PAYLD_LEN_WIDTH-1:8], dst_src_mac_tx};
wire [ETHHDR_NOC_WIDTH-1:0] header_tx = {'0, ethfr_id, ETHTYPE_BYTE0, ETHTYPE_BYTE1, dst_src_mac_tx};

reg [$clog2(ETHHDR_NOC_FLITS):0] hdr_tx_cnt;
reg [$clog2(ETHHDR_NOC_FLITS):0] hdr_rx_cnt;
reg [`NOC_DATA_WIDTH-1:0] pack_buf[MAX_NOC_PACK_FLITS];
reg [$clog2(MAX_NOC_PACK_FLITS):0] pack_cnt;
reg [$clog2(MAX_NOC_PACK_FLITS):0] pack_flits;
reg [ETHFR_RETRY_TIME_WIDTH-1  :0] wait_ack;
reg [ETHFR_RETRY_TIME_WIDTH-1  :0] wait_time;
reg [ETHFR_RETRIES_WIDTH   -1  :0] retries;
wire header_ok;
always @(posedge clk)
  if(rst) begin 
    hdr_tx_cnt <= ETHHDR_NOC_FLITS;
    ethfr_id   <= '0;
    wait_ack   <= '0;
    wait_time  <= '0;
    pack_cnt   <= '0;
    pack_flits <= '0;
    retries    <= '0;
  end
  else begin 
    if (valid_out && ready_out) begin
      if (hdr_tx_cnt && !wait_ack) begin 
        hdr_tx_cnt <= hdr_tx_cnt - 'b1;
        assert(ethfr_payld_len_tx <= MAX_ETHFR_PAYLD_LEN) else $error("Eth frame payload length %d exceeds maximum possible value %d",
               ethfr_payld_len_tx,   MAX_ETHFR_PAYLD_LEN);
      end
      pack_buf[pack_cnt] <= data_out;
      pack_cnt <= pack_cnt + 'b1;
      if (last_out) begin
        hdr_tx_cnt <= ETHHDR_NOC_FLITS;
        wait_ack  <= '1; // all ones to retry timeout counter
        pack_flits <= pack_cnt; // due to eth header, here pack_cnt is above zero
        pack_cnt <= '0;
        if (!pack_flits) retries <= '0;
        else retries <= retries + 'b1;
      end
    end
    if (wait_ack >> 1) begin
      wait_ack <= wait_ack - 'b1; // countdown untill one, one means that retry should start
      if (hdr_rx_cnt == ETHHDR_NOC_FLITS && header_ok) begin // correct Eth frame ACK is received during wait time
        ethfr_id <= ethfr_id + 'b1;
        wait_time <= ~wait_ack;
        wait_ack   <= '0;
        pack_flits <= '0;
      end
    end
  end

assign ready_in = ready_out && !hdr_tx_cnt;
assign valid_out = (valid_in && !wait_ack) || (wait_ack == 'b1);

reg [`MSG_LENGTH_WIDTH-1:0] remaining_flits;
always @(posedge clk)
  if(rst) remaining_flits <= `MSG_LENGTH_WIDTH'h0;
  else if (valid_in & ready_in) begin
    if (remaining_flits == `MSG_LENGTH_WIDTH'h0) remaining_flits <= noc_msg_len;
    else remaining_flits <= remaining_flits - `MSG_LENGTH_WIDTH'h1;
  end

assign last_out = (((remaining_flits == `MSG_LENGTH_WIDTH'h1) ||
                   ((remaining_flits == `MSG_LENGTH_WIDTH'h0) &&
                        (noc_msg_len == `MSG_LENGTH_WIDTH'h0) && valid_in)) && !hdr_tx_cnt) ||
                   (pack_flits && pack_cnt == pack_flits); // last flit of retry transmission

assign data_out = pack_flits  ? pack_buf[pack_cnt] : // retry transmission from the buffer
                 (hdr_tx_cnt ? header_tx[(ETHHDR_NOC_FLITS - hdr_tx_cnt)*`NOC_DATA_WIDTH +: `NOC_DATA_WIDTH] : flit_in); // primary tramsmission


reg [ETHHDR_NOC_WIDTH-1 :0] header_rx;
// swap bytes in payload length because of big-end network byte order
wire [ETH_PAYLD_LEN_WIDTH-1:0] ethfr_payld_len_rx = {header_rx[2*MAC_ADDR_WIDTH   +: 7],
                                                     header_rx[2*MAC_ADDR_WIDTH+7 +: 7]};
assign header_ok = (header_rx[2*MAC_ADDR_WIDTH-1 :0] == dst_src_mac_ref) &&
                   //(ethfr_payld_len_rx == MIN_ETHFR_PAYLD_LEN) && // for IEEE802.3 usage of Ethertype field as Eth payload length
                   (header_rx[2*MAC_ADDR_WIDTH +: ETH_PAYLD_LEN_WIDTH] == {ETHTYPE_BYTE0,ETHTYPE_BYTE1}) && // checking the custom Ethertype
                   (header_rx[ETHHDR_WIDTH +: ETHFR_ID_WIDTH] == ethfr_id);
assign ready_ack = 'b1;

always @(posedge clk)
  if(rst) begin
    hdr_rx_cnt <= ETHHDR_NOC_FLITS;
    header_rx  <= '0;
  end
  else begin 
    if (valid_ack && ready_ack) begin
      if (hdr_rx_cnt) begin
        hdr_rx_cnt <= hdr_rx_cnt - 'b1;
        header_rx[(ETHHDR_NOC_FLITS - hdr_rx_cnt)*`NOC_DATA_WIDTH +: `NOC_DATA_WIDTH] <= data_ack;
        // header_rx <= {data_in, header_rx[ETHHDR_NOC_FLITS * `NOC_DATA_WIDTH -1 : `NOC_DATA_WIDTH]};
      end
      if (last_ack) hdr_rx_cnt <= ETHHDR_NOC_FLITS;
    end
    // Giving a chance just for one clock cycle to treat header (by header_ok) before clearing it
    else if (hdr_rx_cnt == ETHHDR_NOC_FLITS) header_rx <= '0;
  end

endmodule
