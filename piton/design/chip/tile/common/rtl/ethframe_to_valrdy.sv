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

       input  [2*MAC_ADDR_WIDTH-1:0] dst_src_mac_ref,
       input  [2*MAC_ADDR_WIDTH-1:0] dst_src_mac_tx,
       output [ETHHDR_NOC_WIDTH-1:0] eth_hdr_out,

       input  [`NOC_DATA_WIDTH-1:0] data_in,
       input  last_in,
       input  valid_in,
       output ready_in,

       output [`NOC_DATA_WIDTH-1:0] flit_out,
       output valid_out,
       input  ready_out,

       output [`NOC_DATA_WIDTH-1:0] data_ack,
       output valid_ack,
       output last_ack,
       input  ready_ack
);

assign flit_out = data_in;

reg [$clog2(ETHHDR_NOC_FLITS):0] hdr_rx_cnt;
reg [ETHHDR_NOC_WIDTH-1 :0] header_rx;
reg [ETHHDR_NOC_WIDTH-1 :0] header_tx;
reg [ETHFR_ID_WIDTH  -1 :0] ethfr_id;
reg valid_ack;

// swap bytes in payload length because of big-end network byte order
wire [ETH_PAYLD_LEN_WIDTH-1:0] ethfr_payld_len = {header_rx[2*MAC_ADDR_WIDTH   +: 8],
                                                  header_rx[2*MAC_ADDR_WIDTH+8 +: 8]};
wire header_ok = (header_rx[2*MAC_ADDR_WIDTH-1 :0] == dst_src_mac_ref) &&
                 (ethfr_payld_len <= MAX_ETHFR_PAYLD_LEN); // for IEEE802.3 usage of Ethertype field as Eth payload length
                 //(header_rx[2*MAC_ADDR_WIDTH +: ETH_PAYLD_LEN_WIDTH] == {ETHTYPE_BYTE0,ETHTYPE_BYTE1}); // checking the custom Ethertype
wire ethpack_exp = header_ok && (header_rx[ETHHDR_WIDTH +: ETHFR_ID_WIDTH] ==                 ethfr_id     );
wire ethpack_prv = header_ok && (header_rx[ETHHDR_WIDTH +: ETHFR_ID_WIDTH] == ETHFR_ID_WIDTH'(ethfr_id-'b1));

wire [ETH_PAYLD_LEN_WIDTH-1:0] min_ethfr_payld_len = MIN_ETHFR_PAYLD_LEN;

always @(posedge clk)
  if(rst) begin
    hdr_rx_cnt <= ETHHDR_NOC_FLITS;
    header_rx <= '0;
    header_tx <= '0;
    ethfr_id  <= '0;
    valid_ack <= '0;
  end
  else begin 
    if (valid_in && ready_in) begin
      if (hdr_rx_cnt) begin
        hdr_rx_cnt <= hdr_rx_cnt - 'b1;
        header_rx[(ETHHDR_NOC_FLITS - hdr_rx_cnt)*`NOC_DATA_WIDTH +: `NOC_DATA_WIDTH] <= data_in;
        // header_rx <= {data_in, header_rx[ETHHDR_NOC_FLITS * `NOC_DATA_WIDTH -1 : `NOC_DATA_WIDTH]};
      end
      if (last_in) begin 
        hdr_rx_cnt <= ETHHDR_NOC_FLITS;
        if (ethpack_exp) ethfr_id <= header_rx[ETHHDR_WIDTH +: ETHFR_ID_WIDTH] + 'b1;
        if (ethpack_exp || ethpack_prv) begin
          // swapping bytes in payload length for big-end network byte order (IEEE802.3 usage of the Ethertype field as Eth payload length)
          header_tx <= {header_rx[ETHHDR_WIDTH +: ETHFR_ID_WIDTH], min_ethfr_payld_len[7:0], min_ethfr_payld_len[ETH_PAYLD_LEN_WIDTH-1:8], dst_src_mac_tx};
          //header_tx <= {header_rx[ETHHDR_WIDTH +: ETHFR_ID_WIDTH], ETHTYPE_BYTE0, ETHTYPE_BYTE1, dst_src_mac_tx};
          valid_ack <= 'b1;
        end
      end
    end
    if (ready_ack && last_ack) valid_ack <= '0;
  end

assign eth_hdr_out = header_rx;
// assign valid_out = valid_in && !hdr_rx_cnt && ethpack_exp && !valid_ack;
// assign ready_in  = hdr_rx_cnt || (ready_out && ethpack_exp && !valid_ack) || (ethpack_prv && !valid_ack) || (!ethpack_exp && !ethpack_prv);
assign valid_out = valid_in && !hdr_rx_cnt && ethpack_exp;
assign ready_in  = (hdr_rx_cnt || (ready_out && ethpack_exp) || !ethpack_exp) && !valid_ack;


reg [$clog2(ETHHDR_NOC_FLITS):0] hdr_tx_cnt;
always @(posedge clk)
  if(rst) hdr_tx_cnt <= ETHHDR_NOC_FLITS;
  else if (valid_ack && ready_ack) begin
    if (last_ack) hdr_tx_cnt <= ETHHDR_NOC_FLITS;
    else          hdr_tx_cnt <= hdr_tx_cnt - 'b1;
  end

assign data_ack = header_tx[(ETHHDR_NOC_FLITS - hdr_tx_cnt)*`NOC_DATA_WIDTH +: `NOC_DATA_WIDTH];
assign last_ack = (hdr_tx_cnt == 'b1);

endmodule
