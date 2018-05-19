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

//Function: This ties together a 4 space NIB with the dynamic_input_control logic
//
//State:
//
//Instantiates: dynamic_input_control, network_input_blk_4elmt
//
//Note:
//
`include "network_define.v"

module dynamic_input_top_4(route_req_n_out, route_req_e_out, route_req_s_out, route_req_w_out, route_req_p_out,
                           default_ready_n_out, default_ready_e_out, default_ready_s_out, default_ready_w_out, default_ready_p_out,
                           tail_out, yummy_out, data_out, valid_out, clk, reset,
                           my_loc_x_in, my_loc_y_in, my_chip_id_in,  valid_in, data_in,
                           thanks_n, thanks_e, thanks_s, thanks_w, thanks_p);

// begin port declarations

output route_req_n_out;
output route_req_e_out;
output route_req_s_out;
output route_req_w_out;
output route_req_p_out;
output default_ready_n_out;
output default_ready_e_out;
output default_ready_s_out;
output default_ready_w_out;
output default_ready_p_out;
output tail_out;
output yummy_out;
output [`DATA_WIDTH-1:0] data_out;
output valid_out;

input clk;
input reset;

input [`XY_WIDTH-1:0] my_loc_x_in;
input [`XY_WIDTH-1:0] my_loc_y_in;
input [`CHIP_ID_WIDTH-1:0] my_chip_id_in;
input valid_in;
input [`DATA_WIDTH-1:0] data_in;
input thanks_n;
input thanks_e;
input thanks_s;
input thanks_w;
input thanks_p;

// end port declarations

//This is the state

//inputs to the state

//wires
wire thanks_all_temp;
wire [`DATA_WIDTH-1:0] data_internal;
wire valid_out_internal;

//wire regs

//assigns
assign valid_out = valid_out_internal;

//instantiations
network_input_blk_multi_out #(.LOG2_NUMBER_FIFO_ELEMENTS(2)) NIB(.clk(clk),
                                      .reset(reset),
                                      .data_in(data_in),
                                      .valid_in(valid_in),
                                      .yummy_out(yummy_out),
                                      .thanks_in(thanks_all_temp),
                                      .data_val(data_out),
                                      .data_val1(data_internal), // same as data_val, done for buffering
                                      .data_avail(valid_out_internal));

dynamic_input_control control(.thanks_all_temp_out(thanks_all_temp),
                              .route_req_n_out(route_req_n_out), 
                              .route_req_e_out(route_req_e_out), 
                              .route_req_s_out(route_req_s_out), 
                              .route_req_w_out(route_req_w_out), 
                              .route_req_p_out(route_req_p_out),
                              .default_ready_n(default_ready_n_out), 
                              .default_ready_e(default_ready_e_out), 
                              .default_ready_s(default_ready_s_out), 
                              .default_ready_w(default_ready_w_out), 
                              .default_ready_p(default_ready_p_out),
                              .tail_out(tail_out),
                              .clk(clk), .reset(reset),
                              .my_loc_x_in(my_loc_x_in), 
                              .my_loc_y_in(my_loc_y_in), 
                              .my_chip_id_in(my_chip_id_in),
                              .abs_x(data_internal[`DATA_WIDTH-`CHIP_ID_WIDTH-1:`DATA_WIDTH-`CHIP_ID_WIDTH-`XY_WIDTH]), 
                              .abs_y(data_internal[`DATA_WIDTH-`CHIP_ID_WIDTH-`XY_WIDTH-1:`DATA_WIDTH-`CHIP_ID_WIDTH-2*`XY_WIDTH]), 
                              .abs_chip_id(data_internal[`DATA_WIDTH-1:`DATA_WIDTH-`CHIP_ID_WIDTH]),
                              .final_bits(data_internal[`DATA_WIDTH-`CHIP_ID_WIDTH-2*`XY_WIDTH-2:`DATA_WIDTH-`CHIP_ID_WIDTH-2*`XY_WIDTH-4]),
                              .valid_in(valid_out_internal),
                              .thanks_n(thanks_n), .thanks_e(thanks_e), .thanks_s(thanks_s), .thanks_w(thanks_w), .thanks_p(thanks_p),
                              .length(data_internal[`DATA_WIDTH-`CHIP_ID_WIDTH-2*`XY_WIDTH-5:`DATA_WIDTH-`CHIP_ID_WIDTH-2*`XY_WIDTH-4-`PAYLOAD_LEN]));

endmodule
