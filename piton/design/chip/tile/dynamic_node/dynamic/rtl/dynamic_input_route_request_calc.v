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

//Function: This generates all of the route_request lines and the default_ready lines from
//the absolute location of the tile, the abs address of the message, and the fbits of the message
//
//State: 
//NONE
//
//Instantiates: 
//
//Note:
//

`include "network_define.v"

module dynamic_input_route_request_calc(route_req_n, route_req_e, route_req_s, route_req_w, route_req_p, 
                                        default_ready_n, default_ready_e, default_ready_s, default_ready_w, default_ready_p, 
                                        my_loc_x_in, my_loc_y_in, my_chip_id_in, abs_x, abs_y, abs_chip_id, final_bits, length, header_in);

// begin port declarations

output route_req_n;
output route_req_e;
output route_req_s;
output route_req_w;
output route_req_p;
output default_ready_n;
output default_ready_e;
output default_ready_s;
output default_ready_w;
output default_ready_p;

input [`XY_WIDTH-1:0] my_loc_x_in;
input [`XY_WIDTH-1:0] my_loc_y_in;
input [`CHIP_ID_WIDTH-1:0] my_chip_id_in;
input [`XY_WIDTH-1:0] abs_x;
input [`XY_WIDTH-1:0] abs_y;
input [`CHIP_ID_WIDTH-1:0] abs_chip_id;

input [2:0] final_bits;
input [`PAYLOAD_LEN-1:0] length;
input header_in;

// end port declarations
   
//fbit declarations
`define FINAL_NONE	3'b000
`define FINAL_WEST	3'b010
`define FINAL_SOUTH	3'b011
`define FINAL_EAST	3'b100
`define FINAL_NORTH	3'b101

//This is the state
//NONE

//inputs to the state
//NONE

//wires
wire more_x;
wire more_y;
wire less_x;
wire less_y;
wire done_x;
wire done_y;
wire off_chip;

wire done;

wire north;
wire east;
wire south;
wire west;
wire proc;

wire north_calc;
wire south_calc;

//wire regs

//assigns

assign off_chip = abs_chip_id != my_chip_id_in;
assign more_x = off_chip ? `OFF_CHIP_NODE_X > my_loc_x_in : abs_x > my_loc_x_in;
assign more_y = off_chip ? `OFF_CHIP_NODE_Y > my_loc_y_in : abs_y > my_loc_y_in;

assign less_x = off_chip ? `OFF_CHIP_NODE_X < my_loc_x_in : abs_x < my_loc_x_in;
assign less_y = off_chip ? `OFF_CHIP_NODE_Y < my_loc_y_in : abs_y < my_loc_y_in;

assign done_x = off_chip ? `OFF_CHIP_NODE_X == my_loc_x_in : abs_x == my_loc_x_in;
assign done_y = off_chip ? `OFF_CHIP_NODE_Y == my_loc_y_in : abs_y == my_loc_y_in;

assign done = done_x & done_y;

assign north_calc = done_x & less_y;
assign south_calc = done_x & more_y;

assign north = north_calc | ((final_bits == `FINAL_NORTH) & done);
assign south = south_calc | ((final_bits == `FINAL_SOUTH) & done);
assign east = more_x | ((final_bits == `FINAL_EAST) & done);
assign west = less_x | ((final_bits == `FINAL_WEST) & done);
assign proc = ((final_bits == `FINAL_NONE) & done);

assign route_req_n = header_in & north;
assign route_req_e = header_in & east;
assign route_req_s = header_in & south;
assign route_req_w = header_in & west;
assign route_req_p = header_in & proc;

assign default_ready_n = route_req_n;
assign default_ready_e = route_req_e;
assign default_ready_s = route_req_s;
assign default_ready_w = route_req_w;
assign default_ready_p = route_req_p;

//instantiations

endmodule
   
