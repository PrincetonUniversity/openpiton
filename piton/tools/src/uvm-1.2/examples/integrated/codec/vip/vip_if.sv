// 
// -------------------------------------------------------------
//    Copyright 2011 Synopsys, Inc.
//    All Rights Reserved Worldwide
// 
//    Licensed under the Apache License, Version 2.0 (the
//    "License"); you may not use this file except in
//    compliance with the License.  You may obtain a copy of
//    the License at
// 
//        http://www.apache.org/licenses/LICENSE-2.0
// 
//    Unless required by applicable law or agreed to in
//    writing, software distributed under the License is
//    distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//    CONDITIONS OF ANY KIND, either express or implied.  See
//    the License for the specific language governing
//    permissions and limitations under the License.
// -------------------------------------------------------------
// 


`ifndef VIP_IF__SV
`define VIP_IF__SV

`timescale 1ns/1ns


interface vip_tx_if(input  bit clk,
                    output reg Tx);
endinterface: vip_tx_if


interface vip_rx_if(input bit clk,
                    input reg Rx);
endinterface: vip_rx_if


interface vip_if(input  bit clk,
                 output reg Tx,
                 input  wire Rx);

vip_tx_if tx(clk, Tx);
vip_rx_if rx(clk, Rx);
vip_rx_if tx_mon(clk, Tx);

endinterface: vip_if

`endif
