// ========== Copyright Header Begin ============================================
// Copyright (c) 2019 Princeton University
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// ========== Copyright Header End ============================================

`include "mc_define.h"
`include "define.tmp.h"
`include "noc_axi4_bridge_define.vh"


module noc_axi4_bridge_buffer (
  input clk, 
  input rst_n, 

  // from deserializer
  input [`MSG_HEADER_WIDTH-1:0] deser_header, 
  input [`AXI4_DATA_WIDTH-1:0] deser_data, 
  input deser_val, 
  output  deser_rdy,

  // read request out
  output [`MSG_HEADER_WIDTH-1:0] read_req_header, 
  output [`NOC_AXI4_BRIDGE_BUFFER_ADDR_SIZE-1:0] read_req_id,
  output read_req_val, 
  input  read_req_rdy,

  // read response in
  input [`AXI4_DATA_WIDTH-1:0] read_resp_data, 
  input [`NOC_AXI4_BRIDGE_BUFFER_ADDR_SIZE-1:0] read_resp_id,
  input read_resp_val, 
  output  read_resp_rdy,

  // read request out
  output [`MSG_HEADER_WIDTH-1:0] write_req_header, 
  output [`NOC_AXI4_BRIDGE_BUFFER_ADDR_SIZE-1:0] write_req_id,
  output [`AXI4_DATA_WIDTH-1:0] write_req_data, 
  output write_req_val, 
  input  write_req_rdy,

  // read response in
  input [`NOC_AXI4_BRIDGE_BUFFER_ADDR_SIZE-1:0] write_resp_id,
  input write_resp_val, 
  output  write_resp_rdy,

  // in serializer
  output [`MSG_HEADER_WIDTH-1:0] ser_header, 
  output [`AXI4_DATA_WIDTH-1:0] ser_data, 
  output ser_val, 
  input  ser_rdy
);

localparam INVALID = 1'd0;
localparam WAITING = 1'd1;

localparam READ  = 1'd0;
localparam WRITE = 1'd1;


reg [`NOC_AXI4_BRIDGE_IN_FLIGHT_LIMIT-1:0]                          pkt_state_buf ;
reg [`MSG_HEADER_WIDTH-1:0]   pkt_header[`NOC_AXI4_BRIDGE_IN_FLIGHT_LIMIT-1:0];
reg [`NOC_AXI4_BRIDGE_IN_FLIGHT_LIMIT-1:0]                          pkt_command;

reg [`NOC_AXI4_BRIDGE_BUFFER_ADDR_SIZE-1:0]    fifo_in;
reg [`NOC_AXI4_BRIDGE_BUFFER_ADDR_SIZE-1:0]    fifo_out;
reg preser_arb;
reg [`NOC_AXI4_BRIDGE_IN_FLIGHT_LIMIT-1:0] bram_rdy;
reg [`AXI4_DATA_WIDTH-1:0] ser_data_f;
wire [`MSG_HEADER_WIDTH-1:0] ser_header_f;
reg ser_val_f;
reg [`AXI4_DATA_WIDTH-1:0] ser_data_ff;
reg [`MSG_HEADER_WIDTH-1:0] ser_header_ff;
reg ser_val_ff;


wire deser_go = (deser_rdy & deser_val);
wire read_req_go = (read_req_val & read_req_rdy);
wire read_resp_go = (read_resp_val & read_resp_rdy);
wire write_req_go = (write_req_val & write_req_rdy);
wire write_resp_go = (write_resp_val & write_resp_rdy);
wire req_go = read_req_go || write_req_go;
wire preser_rdy = ~ser_val_ff || ser_rdy;
wire ser_go = ser_val & ser_rdy;

//
//  SEND REQUESTS 
//

always @(posedge clk) begin
    if(~rst_n) begin
        fifo_in <= {`NOC_AXI4_BRIDGE_BUFFER_ADDR_SIZE{1'b0}};
        fifo_out <= {`NOC_AXI4_BRIDGE_BUFFER_ADDR_SIZE{1'b0}};
    end 
    else begin
        fifo_in <= deser_go ? fifo_in + 1 : fifo_in;
        fifo_out <= req_go ? fifo_out + 1 : fifo_out;
    end
end


genvar i;
generate 
    for (i = 0; i < `NOC_AXI4_BRIDGE_IN_FLIGHT_LIMIT; i = i + 1) begin
        always @(posedge clk) begin
            if(~rst_n) begin
                pkt_state_buf[i] <= INVALID;
                pkt_header[i] <= `MSG_HEADER_WIDTH'b0;
                pkt_command[i] <= 1'b0;
            end 
            else begin
                if ((i == fifo_in) & deser_go) begin
                    pkt_state_buf[i] <= WAITING;
                    pkt_header[i] <= deser_header;
                    pkt_command[i] <= (deser_header[`MSG_TYPE] == `MSG_TYPE_STORE_MEM) 
                                   || (deser_header[`MSG_TYPE] == `MSG_TYPE_NC_STORE_REQ);
                end
                else if ((i == fifo_out) & req_go) begin
                      pkt_state_buf[i] <= INVALID;
                      pkt_header[i] <= `MSG_HEADER_WIDTH'b0;
                      pkt_command[i] <= 1'b0;
                end
                else begin
                    pkt_state_buf[i] <= pkt_state_buf[i];
                    pkt_header[i] <= pkt_header[i];
                    pkt_command[i] <= pkt_command[i];
                end
            end
        end
    end
endgenerate

noc_axi4_bridge_sram_data noc_axi4_bridge_sram_data
(
    .MEMCLK(clk), 
    .RESET_N(rst_n),
    .CEA(1),
    .AA(write_req_id),
    .RDWENA(1'b1),
    .CEB(deser_go),
    .AB(fifo_in),
    .RDWENB(1'b0),
    .DOUTA(write_req_data),
    .BWB({`AXI4_DATA_WIDTH{1'b1}}),
    .DINB(deser_data)
);

assign read_req_val = (pkt_state_buf[fifo_out] == WAITING) && (pkt_command[fifo_out] == READ) && bram_rdy[fifo_out];
assign read_req_header = pkt_header[fifo_out];
assign read_req_id = fifo_out;

assign write_req_val = (pkt_state_buf[fifo_out] == WAITING) && (pkt_command[fifo_out] == WRITE) && bram_rdy[fifo_out];
assign write_req_header = pkt_header[fifo_out];
assign write_req_id = fifo_out;

assign deser_rdy = (pkt_state_buf[fifo_in] == INVALID);


//
// GET_RESPONSE
//

always @(posedge clk) begin
    if(~rst_n) begin
        preser_arb <= 1'b0;
    end 
    else begin
        preser_arb <= preser_arb + 1'b1;
    end
end

noc_axi4_bridge_sram_req noc_axi4_bridge_sram_req
(
    .MEMCLK(clk), 
    .RESET_N(rst_n),
    .CEA(1),
    .AA(preser_arb ? write_resp_id : read_resp_id),
    .RDWENA(1'b1),
    .CEB(req_go),
    .AB(fifo_out),
    .RDWENB(1'b0),
    .DOUTA(ser_header_f),
    .BWB({`MSG_HEADER_WIDTH{1'b1}}),
    .DINB(pkt_header[fifo_out])
);


generate 
    for (i = 0; i < `NOC_AXI4_BRIDGE_IN_FLIGHT_LIMIT; i = i + 1) begin
        always @(posedge clk) begin
            if(~rst_n) begin
                bram_rdy[i] <= 1;
            end 
            else begin
                bram_rdy[i] <= (req_go & (i == fifo_out))               ? 0 
                             : (write_resp_go & (i == write_resp_id)) ? 1
                             : (read_resp_go & (i == read_resp_id))   ? 1
                             :                                          bram_rdy[i];
            end
        end
    end
endgenerate

assign read_resp_rdy = ~preser_arb & preser_rdy;
assign write_resp_rdy = preser_arb & preser_rdy;


always @(posedge clk) begin
    if(~rst_n) begin
        ser_data_f <= 0;
        ser_val_f <= 0;
        ser_header_ff <= 0;
        ser_val_ff <= 0;
        ser_data_ff <= 0;
    end 
    else begin
        if (preser_rdy) begin
            if (preser_arb) begin
                ser_val_f <= write_resp_val;
                ser_data_f <= 0;
            end
            else begin
                ser_val_f <= read_resp_val;
                ser_data_f <= read_resp_data;
            end
            ser_val_ff <= ser_val_f;
            ser_data_ff <= ser_data_f;
            ser_header_ff <= ser_header_f;
        end
        else begin
            ser_val_f <= ser_val_f;
            ser_data_f <= ser_data_f;
            ser_val_ff <= ser_val_ff;
            ser_data_ff <= ser_data_ff;
            ser_header_ff <= ser_header_ff;
        end
    end
end

assign ser_data = ser_data_ff;
assign ser_val = ser_val_ff;
assign ser_header = ser_header_ff;


/*
ila_buffer ila_buffer (
  .clk(clk), // input wire clk


  .probe0(deser_header), // input wire [191:0]  probe0  
  .probe1(deser_data), // input wire [511:0]  probe1 
  .probe2(deser_val), // input wire [0:0]  probe2 
  .probe3(deser_rdy), // input wire [0:0]  probe3 
  .probe4(ser_header), // input wire [191:0]  probe4 
  .probe5(ser_data), // input wire [511:0]  probe5 
  .probe6(ser_val), // input wire [0:0]  probe6 
  .probe7(ser_rdy), // input wire [0:0]  probe7 
  .probe8(read_req_header), // input wire [191:0]  probe8 
  .probe9(read_req_id), // input wire [1:0]  probe9 
  .probe10(read_req_val), // input wire [0:0]  probe10 
  .probe11(read_req_rdy), // input wire [0:0]  probe11 
  .probe12(read_resp_data), // input wire [511:0]  probe12 
  .probe13(read_resp_id), // input wire [1:0]  probe13 
  .probe14(read_resp_val), // input wire [0:0]  probe14 
  .probe15(read_resp_rdy), // input wire [0:0]  probe15 
  .probe16(write_req_header), // input wire [191:0]  probe16 
  .probe17(write_req_id), // input wire [1:0]  probe17 
  .probe18(write_req_data), // input wire [511:0]  probe18 
  .probe19(write_req_val), // input wire [0:0]  probe19 
  .probe20(write_req_rdy), // input wire [0:0]  probe20 
  .probe21(write_resp_id), // input wire [1:0]  probe21 
  .probe22(write_resp_val), // input wire [0:0]  probe22 
  .probe23(write_resp_rdy), // input wire [0:0]  probe23 
  .probe24(fifo_in), // input wire [1:0]  probe24 
  .probe25(fifo_out), // input wire [1:0]  probe25 
  .probe26(preser_arb), // input wire [0:0]  probe26 
  .probe27(bram_rdy), // input wire [3:0]  probe27 
  .probe28(ser_data_f), // input wire [511:0]  probe28 
  .probe29(ser_header_f), // input wire [191:0]  probe29 
  .probe30(ser_val_f), // input wire [0:0]  probe30 
  .probe31(ser_data_ff), // input wire [511:0]  probe31 
  .probe32(ser_header_ff), // input wire [191:0]  probe32 
  .probe33(ser_val_ff), // input wire [0:0]  probe33 
  .probe34(rst_n) // input wire [0:0]  probe34
);

reg [159:0] reqresp_count;
always @(posedge clk) begin
    if (~rst_n) begin
        reqresp_count <= 0;
    end
    else begin
        reqresp_count <= ser_go & deser_go ? reqresp_count     : 
                                   deser_go ? reqresp_count + 1 :
                                   ser_go ? reqresp_count - 1 : 
                                             reqresp_count;

    end
end

ila_axi_protocol_checker ila_axi_protocol_checker (
    .clk(clk), // input wire clk

    .probe0(rst_n), // input wire [0:0]  probe0  
    .probe1(reqresp_count) // input wire [159:0]  probe1
);
*/

endmodule
