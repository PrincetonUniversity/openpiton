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

module ethframe_to_valrdy #(
  parameter DAT_WIDTH = `NOC_DATA_WIDTH,
  parameter ACK_WIDTH = `NOC_DATA_WIDTH,
  // parameter ACK_WIDTH = CMAC_USE_DAT_BYTES*8,
  localparam ETHHDR_DAT_FLITS = (ETHFR_MIN_WIDTH + DAT_WIDTH-1) / DAT_WIDTH, // ceil division: (112+8)/`NOC_DATA_WIDTH = 120/64 = 2
  localparam ETHHDR_DAT_WIDTH = ETHHDR_DAT_FLITS * DAT_WIDTH // 2*`NOC_DATA_WIDTH = 2*64 = 128
)(
       input clk,
       input rst,

       input  [2*MAC_ADDR_WIDTH-1:0] dst_src_mac_tx,
       output [ETHHDR_DAT_WIDTH-1:0] eth_hdr_out,

       input  [DAT_WIDTH-1:0] data_in,
       input  last_in,
       input  valid_in,
       output ready_in,

       output [DAT_WIDTH-1:0] flit_out,
       output valid_out,
       input  ready_out,

       output [ACK_WIDTH-1:0] data_ack,
       output valid_ack,
       output last_ack,
       input  ready_ack
);

localparam ETHHDR_ACK_FLITS = (ETHFR_MIN_WIDTH + ACK_WIDTH-1) / ACK_WIDTH; // ceil division
localparam ETHHDR_ACK_WIDTH = ETHHDR_ACK_FLITS * ACK_WIDTH;

if (ETHHDR_ACK_WIDTH/8 > CMAC_USE_DAT_BYTES) begin
  $fatal("Ack Eth frame: Aligned to %d width Ethernet header with length %d does not fit into single CMAC AXI data beat with length %d as a condition of feasible further Eth frame payload length",
         ACK_WIDTH, ETHHDR_ACK_WIDTH/8, CMAC_USE_DAT_BYTES);
end

reg [$clog2(ETHHDR_DAT_FLITS):0] hdr_rx_cnt;
reg [ETHHDR_DAT_WIDTH-1 :0] header_rx;
reg [ETHHDR_ACK_WIDTH-1 :0] header_tx;
reg [ETHFR_ID_WIDTH  -1 :0] ethfr_id;
reg valid_ack;

localparam LOG_NOC_PACK_FLITS = $clog2(MAX_NOC_PACK_LEN*8 / `NOC_DATA_WIDTH); // log(88*8/64)=log(11)=4
reg [DAT_WIDTH-1:0] pack_buf[2**LOG_NOC_PACK_FLITS];
reg [LOG_NOC_PACK_FLITS-1 :0] pack_wrptr;
reg [LOG_NOC_PACK_FLITS-1 :0] pack_rdptr;
reg skip_ethpack; // signal to skip packet transfer to NOC since previous packet is still in process from the buffer

wire pack_buf_empt = (pack_wrptr == pack_rdptr);
assign flit_out = pack_buf_empt ? data_in : pack_buf[pack_rdptr];

// swap bytes in payload length because of big-end network byte order
wire [ETH_PAYLD_LEN_WIDTH-1:0] ethfr_payld_len = {header_rx[2*MAC_ADDR_WIDTH   +: 8],
                                                  header_rx[2*MAC_ADDR_WIDTH+8 +: 8]};
                                                      // exchanging destination and source MACs to check headers of incoming Eth frames
wire header_ok = (header_rx[2*MAC_ADDR_WIDTH-1 :0] == {dst_src_mac_tx[MAC_ADDR_WIDTH-1:0],dst_src_mac_tx[2*MAC_ADDR_WIDTH-1:MAC_ADDR_WIDTH]}) &&
                 (ethfr_payld_len <= MAX_ETHFR_PAYLD_LEN); // for IEEE802.3 usage of Ethertype field as Eth payload length
                 //(header_rx[2*MAC_ADDR_WIDTH +: ETH_PAYLD_LEN_WIDTH] == {ETHTYPE_BYTE0,ETHTYPE_BYTE1}); // checking the custom Ethertype
wire ethpack_exp = header_ok && (header_rx[ETHHDR_WIDTH +: ETHFR_ID_WIDTH] ==                 ethfr_id     ) && !skip_ethpack;
wire ethpack_prv = header_ok && (header_rx[ETHHDR_WIDTH +: ETHFR_ID_WIDTH] == ETHFR_ID_WIDTH'(ethfr_id-'b1));

wire [ETH_PAYLD_LEN_WIDTH-1:0] min_ethfr_payld_len = MIN_ETHFR_PAYLD_LEN;

always @(posedge clk)
  if(rst) begin
    hdr_rx_cnt   <= ETHHDR_DAT_FLITS;
    header_rx    <= '0;
    header_tx    <= '0;
    ethfr_id     <= '0;
    valid_ack    <= '0;
    pack_wrptr   <= '0;
    skip_ethpack <= '0;
  end
  else begin 
    if (valid_in && ready_in) begin
      if (hdr_rx_cnt) begin
        skip_ethpack <= !pack_buf_empt;
        hdr_rx_cnt <= hdr_rx_cnt - 'b1;
        header_rx[(ETHHDR_DAT_FLITS - hdr_rx_cnt)*DAT_WIDTH +: DAT_WIDTH] <= data_in;
        // header_rx <= {data_in, header_rx[ETHHDR_DAT_WIDTH -1 : DAT_WIDTH]};
      end
      else if (ethpack_exp) begin // saving NOC packet for a case if NOC readyness drops
        pack_buf[pack_wrptr] <= data_in;
        pack_wrptr <= pack_wrptr + 'b1;
      end

      if (last_in) begin
        hdr_rx_cnt <= ETHHDR_DAT_FLITS;
        if (ethpack_exp) ethfr_id <= header_rx[ETHHDR_WIDTH +: ETHFR_ID_WIDTH] + 'b1;
        if (ethpack_exp || ethpack_prv) begin
          // swapping bytes in payload length for big-end network byte order (IEEE802.3 usage of the Ethertype field as Eth payload length)
          header_tx <= {header_rx[ETHHDR_WIDTH +: ETHFR_ID_WIDTH], min_ethfr_payld_len[7:0], min_ethfr_payld_len[ETH_PAYLD_LEN_WIDTH-1:8], dst_src_mac_tx};
          //header_tx <= {header_rx[ETHHDR_WIDTH +: ETHFR_ID_WIDTH], ETHTYPE_BYTE0, ETHTYPE_BYTE1, dst_src_mac_tx};
          valid_ack <= 'b1;
        end
      end
    end
    if (valid_ack && ready_ack && last_ack) valid_ack <= '0;
  end

assign eth_hdr_out = header_rx;
assign valid_out = (valid_in && !hdr_rx_cnt && ethpack_exp) || !pack_buf_empt;
// we want never to stuck input Eth frames since they are retransmitted infinitely until acknowledged and
// thus might fill-up the pipeline in the bridge when NOC side is not ready causing the deadlock
assign ready_in  = !valid_ack; // && !rst;

always @(posedge clk)
  if(rst) pack_rdptr <= '0;
  else if (valid_out && ready_out)
    pack_rdptr <= pack_rdptr + 'b1;

reg [$clog2(ETHHDR_ACK_FLITS):0] hdr_tx_cnt;
always @(posedge clk)
  if(rst) hdr_tx_cnt <= ETHHDR_ACK_FLITS;
  else if (valid_ack && ready_ack) begin
    if (last_ack) hdr_tx_cnt <= ETHHDR_ACK_FLITS;
    else          hdr_tx_cnt <= hdr_tx_cnt - 'b1;
  end

assign data_ack = header_tx[(ETHHDR_ACK_FLITS - hdr_tx_cnt)*ACK_WIDTH +: ACK_WIDTH];
assign last_ack = (hdr_tx_cnt == 'b1);

endmodule
