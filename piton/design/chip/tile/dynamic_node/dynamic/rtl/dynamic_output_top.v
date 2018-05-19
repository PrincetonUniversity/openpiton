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

//Function: The top level module that glues together the datapath and
//the control for a dynamic_output port
//
//Instantiates: dynamic_output_control dynamic_output_datapath space_avail
//
//State: NONE
//
//Note:
//
`include "network_define.v"

module dynamic_output_top(data_out, thanks_a_out, thanks_b_out, thanks_c_out, thanks_d_out, thanks_x_out, valid_out, popped_interrupt_mesg_out, popped_memory_ack_mesg_out, popped_memory_ack_mesg_out_sender, ec_wants_to_send_but_cannot, clk, reset, route_req_a_in, route_req_b_in, route_req_c_in, route_req_d_in, route_req_x_in, tail_a_in, tail_b_in, tail_c_in, tail_d_in, tail_x_in, data_a_in, data_b_in, data_c_in, data_d_in, data_x_in, valid_a_in, valid_b_in, valid_c_in, valid_d_in, valid_x_in, default_ready_in, yummy_in);

parameter KILL_HEADERS = 1'b0;

// begin port declarations
output [`DATA_WIDTH-1:0] data_out;

output thanks_a_out;
output thanks_b_out;
output thanks_c_out;
output thanks_d_out;
output thanks_x_out;

output valid_out;

output popped_interrupt_mesg_out;
output popped_memory_ack_mesg_out;
output [9:0] popped_memory_ack_mesg_out_sender;

output ec_wants_to_send_but_cannot;

input clk;
input reset;

input route_req_a_in;
input route_req_b_in;
input route_req_c_in;
input route_req_d_in;
input route_req_x_in;

input tail_a_in;
input tail_b_in;
input tail_c_in;
input tail_d_in;
input tail_x_in;

input [`DATA_WIDTH-1:0] data_a_in;
input [`DATA_WIDTH-1:0] data_b_in;
input [`DATA_WIDTH-1:0] data_c_in;
input [`DATA_WIDTH-1:0] data_d_in;
input [`DATA_WIDTH-1:0] data_x_in;
input valid_a_in;
input valid_b_in;
input valid_c_in;
input valid_d_in;
input valid_x_in;

input default_ready_in;
input yummy_in;

// end port declarations

`define ROUTE_A 3'b000
`define ROUTE_B 3'b001
`define ROUTE_C 3'b010
`define ROUTE_D 3'b011
`define ROUTE_X 3'b100

//This is the state
//NOTHING HERE BUT US CHICKENS

//inputs to the state
//NOTHING HERE EITHER

//wires
wire valid_out_temp_connection;
wire [2:0] current_route_connection;
wire space_avail_connection;
wire valid_out_pre;
wire data_out_len_zero;
wire data_out_interrupt_user_bits_set;
wire data_out_memory_ack_user_bits_set;
wire [`DATA_WIDTH-1:0] data_out_internal;
wire valid_out_internal;

//wire regs
reg current_route_req;

//assigns
assign valid_out_internal = valid_out_pre & ~(KILL_HEADERS & current_route_req);
assign data_out_len_zero = data_out_internal[`DATA_WIDTH-`CHIP_ID_WIDTH-2*`XY_WIDTH-4:`DATA_WIDTH-`CHIP_ID_WIDTH-2*`XY_WIDTH-3-`PAYLOAD_LEN] == `PAYLOAD_LEN'd0;
assign data_out_interrupt_user_bits_set = data_out_internal[23:20] == 4'b1111;
assign data_out_memory_ack_user_bits_set = data_out_internal[23:20] == 4'b1110;
//assign popped_zero_len_mesg_out = data_out_len_zero & valid_out_pre & (KILL_HEADERS & current_route_req);
assign popped_interrupt_mesg_out = data_out_interrupt_user_bits_set & data_out_len_zero & valid_out_pre & (KILL_HEADERS & current_route_req);
assign popped_memory_ack_mesg_out = data_out_memory_ack_user_bits_set & data_out_len_zero & valid_out_pre & (KILL_HEADERS & current_route_req);
assign popped_memory_ack_mesg_out_sender = data_out_internal[19:10] & { 10 { KILL_HEADERS} };

assign data_out = data_out_internal;
assign valid_out = valid_out_internal;

//instantiations
space_avail_top space(.valid(valid_out_internal), .clk(clk), .reset(reset), .yummy(yummy_in),.spc_avail(space_avail_connection));
dynamic_output_datapath datapath(.data_out(data_out_internal), .valid_out_temp(valid_out_temp_connection), .data_a_in(data_a_in), .data_b_in(data_b_in), .data_c_in(data_c_in), .data_d_in(data_d_in), .data_x_in(data_x_in), .valid_a_in(valid_a_in), .valid_b_in(valid_b_in), .valid_c_in(valid_c_in), .valid_d_in(valid_d_in), .valid_x_in(valid_x_in), .current_route_in(current_route_connection));

dynamic_output_control control(.thanks_a(thanks_a_out), .thanks_b(thanks_b_out), .thanks_c(thanks_c_out), .thanks_d(thanks_d_out), .thanks_x(thanks_x_out), .valid_out(valid_out_pre), .current_route(current_route_connection), .ec_wants_to_send_but_cannot(ec_wants_to_send_but_cannot), .clk(clk), .reset(reset), .route_req_a_in(route_req_a_in), .route_req_b_in(route_req_b_in), .route_req_c_in(route_req_c_in), .route_req_d_in(route_req_d_in), .route_req_x_in(route_req_x_in), .tail_a_in(tail_a_in), .tail_b_in(tail_b_in), .tail_c_in(tail_c_in), .tail_d_in(tail_d_in), .tail_x_in(tail_x_in), .valid_out_temp(valid_out_temp_connection), .default_ready(default_ready_in), .space_avail(space_avail_connection));
//NOTE TO READER.  I like the way that these instantiations look so if it
//really bothers you go open this in emacs and re-tabify everything
//and don't complain to me

always @ (current_route_connection or route_req_a_in or route_req_b_in or route_req_c_in or route_req_d_in or route_req_x_in)
begin
	case(current_route_connection)
	`ROUTE_A:	current_route_req <= route_req_a_in;
	`ROUTE_B:	current_route_req <= route_req_b_in;
	`ROUTE_C:	current_route_req <= route_req_c_in;
	`ROUTE_D:	current_route_req <= route_req_d_in;
	`ROUTE_X:	current_route_req <= route_req_x_in;
	default:	current_route_req <= 1'bx;
	endcase
end

endmodule
