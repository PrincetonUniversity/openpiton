/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

//File: dynamic_node_top_wrap.v
////Creator: Michael McKeown
////Created: Sept. 21, 2014
////
////Function: This wraps the dynamic_node top and ties off signals
//            we will not be using at the tile level
////
////State: 
////
////Instantiates: dynamic_node_top
////
////

`include "define.tmp.h"

module dynamic_node_top_wrap
(
    input clk,
    input reset_in,
       
    input [`DATA_WIDTH-1:0] dataIn_N,   // data inputs from neighboring tiles
    input [`DATA_WIDTH-1:0] dataIn_E,
    input [`DATA_WIDTH-1:0] dataIn_S,
    input [`DATA_WIDTH-1:0] dataIn_W,
     input [`DATA_WIDTH-1:0] dataIn_P,   // data input from processor
       
    input validIn_N,        // valid signals from neighboring tiles
    input validIn_E,
    input validIn_S,
    input validIn_W,
    input validIn_P,        // valid signal from processor
       
    input yummyIn_N,        // neighbor consumed output data
    input yummyIn_E,
    input yummyIn_S,
    input yummyIn_W,
    input yummyIn_P,        // processor consumed output data
       
    input [`XY_WIDTH-1:0] myLocX,       // this tile's position
    input [`XY_WIDTH-1:0] myLocY,
    input [`CHIP_ID_WIDTH-1:0] myChipID,

    output [`DATA_WIDTH-1:0] dataOut_N, // data outputs to neighbors
    output [`DATA_WIDTH-1:0] dataOut_E,
    output [`DATA_WIDTH-1:0] dataOut_S,
     output [`DATA_WIDTH-1:0] dataOut_W,
     output [`DATA_WIDTH-1:0] dataOut_P, // data output to processor
    
    output validOut_N,      // valid outputs to neighbors
    output validOut_E,
    output validOut_S,
    output validOut_W,
    output validOut_P,      // valid output to processor
       
    output yummyOut_N,      // yummy signal to neighbors' output buffers
    output yummyOut_E,
    output yummyOut_S,
    output yummyOut_W,
    output yummyOut_P,      // yummy signal to processor's output buffer
    
    
    output thanksIn_P      // thanksIn to processor's space_avail
);

    dynamic_node_top dynamic_node_top
    (
        .clk(clk),
        .reset_in(reset_in),
        .dataIn_N(dataIn_N),
        .dataIn_E(dataIn_E),
        .dataIn_S(dataIn_S),
        .dataIn_W(dataIn_W),
        .dataIn_P(dataIn_P),
        .validIn_N(validIn_N),
        .validIn_E(validIn_E),
        .validIn_S(validIn_S),
        .validIn_W(validIn_W),
        .validIn_P(validIn_P),
        .yummyIn_N(yummyIn_N),
        .yummyIn_E(yummyIn_E),
        .yummyIn_S(yummyIn_S),
        .yummyIn_W(yummyIn_W),
        .yummyIn_P(yummyIn_P),
        .myLocX(myLocX),
        .myLocY(myLocY),
        .myChipID(myChipID),
        .ec_cfg(15'b0),
        .store_meter_partner_address_X(5'b0),
        .store_meter_partner_address_Y(5'b0),
        .dataOut_N(dataOut_N),
        .dataOut_E(dataOut_E),
        .dataOut_S(dataOut_S),
        .dataOut_W(dataOut_W),
        .dataOut_P(dataOut_P),
        .validOut_N(validOut_N),
        .validOut_E(validOut_E),
        .validOut_S(validOut_S),
        .validOut_W(validOut_W),
        .validOut_P(validOut_P),
        .yummyOut_N(yummyOut_N),
        .yummyOut_E(yummyOut_E),
        .yummyOut_W(yummyOut_W),
        .yummyOut_S(yummyOut_S),
        .yummyOut_P(yummyOut_P),
        .thanksIn_P(thanksIn_P),
        .external_interrupt(),
        .store_meter_ack_partner(),
        .store_meter_ack_non_partner(),
        .ec_out()
    ); 

endmodule
