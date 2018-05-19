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

//Function: This maintains the control of the output mux for a dynamic network port.
//	This does the scheduling for the output.
//	It takes as input what all of the other ports want to do and outputs the control
//	for the respective crossbar mux and the validOut signal for a respective direction.
//
//Instantiates:
//
//State: current_route_f [2:0], planned_f
//
//Note:
//
`include "network_define.v"

module dynamic_output_control(thanks_a, thanks_b, thanks_c, thanks_d, thanks_x, valid_out, current_route, ec_wants_to_send_but_cannot, clk, reset, route_req_a_in, route_req_b_in, route_req_c_in, route_req_d_in, route_req_x_in, tail_a_in, tail_b_in, tail_c_in, tail_d_in, tail_x_in, valid_out_temp, default_ready, space_avail);

// begin port declarations

output thanks_a;
output thanks_b;
output thanks_c;
output thanks_d;
output thanks_x;

output valid_out;

output [2:0] current_route;
output    ec_wants_to_send_but_cannot;

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

input valid_out_temp;

input default_ready;

input space_avail;

// end port declarations

`define ROUTE_A 3'b000
`define ROUTE_B 3'b001
`define ROUTE_C 3'b010
`define ROUTE_D 3'b011
`define ROUTE_X 3'b100

//This is the state
reg [2:0]current_route_f;
reg planned_f;

//inputs to the state
wire [2:0] current_route_temp;

//wires
wire planned_or_default;
// wire route_req_all_or;
wire route_req_all_or_with_planned;
wire route_req_all_but_default;
wire valid_out_internal;

//wire regs
reg new_route_needed;
reg planned_temp;
reg [2:0] new_route;
reg tail_current_route;
/*reg route_req_planned;*/
reg route_req_a_mask;
reg route_req_b_mask;
reg route_req_c_mask;
reg route_req_d_mask;
reg route_req_x_mask;


//more wire regs for the thanks lines
reg thanks_a;
reg thanks_b;
reg thanks_c;
reg thanks_d;
reg thanks_x;

reg    ec_wants_to_send_but_cannot;

//assigns
assign planned_or_default = planned_f | default_ready;
assign valid_out_internal = valid_out_temp & planned_or_default & space_avail;

// mbt: if valid_out_interal is a critical path, we can use some "bleeder" gates to decrease the load of the ec stuff
always @(posedge clk)
  begin
     ec_wants_to_send_but_cannot <= valid_out_temp & planned_or_default & ~space_avail;
  end

/* assign route_req_all_or = route_req_a_in | route_req_b_in | route_req_c_in | route_req_d_in | route_req_x_in; */
assign current_route_temp = (new_route_needed) ? new_route : current_route_f;
assign current_route = current_route_f;
//this is everything except the currentl planned route's request
assign route_req_all_or_with_planned = (route_req_a_in & route_req_a_mask) | (route_req_b_in & route_req_b_mask) | (route_req_c_in & route_req_c_mask) | (route_req_d_in & route_req_d_mask) | (route_req_x_in & route_req_x_mask);
//calculates whether the nib that we are going to has space
assign route_req_all_but_default = route_req_b_in | route_req_c_in | route_req_d_in | route_req_x_in;

assign valid_out = valid_out_internal;

//instantiations
//space_avail space(.valid(valid_out_internal), .clk(clk), .reset(reset), .yummy(yummy_in), .spc_avail(space_avail));
//THIS HAS BEEN MOVED to dynamic_output_top

//a mux for current_route_f's tail bit
always @ (current_route_f or tail_a_in or tail_b_in or tail_c_in or tail_d_in or tail_x_in)
begin
	case(current_route_f) //synopsys parallel_case
	`ROUTE_A:
	begin
		tail_current_route <= tail_a_in;
	end
	`ROUTE_B:
	begin
		tail_current_route <= tail_b_in;
	end
	`ROUTE_C:
	begin
		tail_current_route <= tail_c_in;
	end
	`ROUTE_D:
	begin
		tail_current_route <= tail_d_in;
	end
	`ROUTE_X:
	begin
		tail_current_route <= tail_x_in;
	end
	default:
	begin
		tail_current_route <= 1'bx; //This is probably dangerous, but I
					    //really need the speed here and
					    //I don't want the synthesizer to
					    //mess me up if I put a real value
					    //here
	end
	endcase
end

always @ (current_route_f or valid_out_internal)
begin
	case(current_route_f)
	`ROUTE_A:
	begin
		thanks_a <= valid_out_internal;
		thanks_b <= 1'b0;
		thanks_c <= 1'b0;
		thanks_d <= 1'b0;
		thanks_x <= 1'b0;
	end
	`ROUTE_B:
	begin
		thanks_a <= 1'b0;
		thanks_b <= valid_out_internal;
		thanks_c <= 1'b0;
		thanks_d <= 1'b0;
		thanks_x <= 1'b0;
	end
	`ROUTE_C:
	begin
		thanks_a <= 1'b0;
		thanks_b <= 1'b0;
		thanks_c <= valid_out_internal;
		thanks_d <= 1'b0;
		thanks_x <= 1'b0;
	end
	`ROUTE_D:
	begin
		thanks_a <= 1'b0;
		thanks_b <= 1'b0;
		thanks_c <= 1'b0;
		thanks_d <= valid_out_internal;
		thanks_x <= 1'b0;
	end
	`ROUTE_X:
	begin
		thanks_a <= 1'b0;
		thanks_b <= 1'b0;
		thanks_c <= 1'b0;
		thanks_d <= 1'b0;
		thanks_x <= valid_out_internal;
	end
	default:
	begin
		thanks_a <= 1'bx;
		thanks_b <= 1'bx;
		thanks_c <= 1'bx;
		thanks_d <= 1'bx;
		thanks_x <= 1'bx;
					//once again this is very dangerous
					//but I want to see the timing this
					//way and we sould never get here
	end
	endcase
end

//this is the rotating priority encoder
/*
always @(current_route_f or route_req_a_in or route_req_b_in or route_req_c_in or route_req_d_in or route_req_x_in)
begin
	case(current_route_f)
	`ROUTE_A:
	begin
		new_route <= (route_req_b_in)?`ROUTE_B:((route_req_c_in)?`ROUTE_C:((route_req_d_in)?`ROUTE_D:((route_req_x_in)?`ROUTE_X:`ROUTE_A)));
	end
	`ROUTE_B:
	begin
		new_route <= (route_req_c_in)?`ROUTE_C:((route_req_d_in)?`ROUTE_D:((route_req_x_in)?`ROUTE_X:((route_req_a_in)?`ROUTE_A:((route_req_b_in)?`ROUTE_B:`ROUTE_A))));
	end
	`ROUTE_C:
	begin
		new_route <= (route_req_d_in)?`ROUTE_D:((route_req_x_in)?`ROUTE_X:((route_req_a_in)?`ROUTE_A:((route_req_b_in)?`ROUTE_B:((route_req_c_in)?`ROUTE_C:`ROUTE_A))));
	end
	`ROUTE_D:
	begin
		new_route <= (route_req_c_in)?`ROUTE_C:((route_req_d_in)?`ROUTE_D:((route_req_x_in)?`ROUTE_X:((route_req_a_in)?`ROUTE_A:((route_req_b_in)?`ROUTE_B:`ROUTE_A))));
	end
	`ROUTE_X:
	begin
		new_route <= (route_req_x_in)?`ROUTE_X:((route_req_a_in)?`ROUTE_A:((route_req_b_in)?`ROUTE_B:((route_req_c_in)?`ROUTE_C:((route_req_d_in)?`ROUTE_D:`ROUTE_A))));
	end
	default:
	begin
		new_route <= `ROUTE_A;
			//this one I am not willing to chince on
	end
	endcase
end
*/
//end the rotating priority encoder

//this is the rotating priority encoder
always @(current_route_f or route_req_a_in or route_req_b_in or route_req_c_in or route_req_d_in or route_req_x_in)
begin
	case(current_route_f)
	`ROUTE_A:
	begin
		new_route <= (route_req_b_in)?`ROUTE_B:((route_req_c_in)?`ROUTE_C:((route_req_d_in)?`ROUTE_D:((route_req_x_in)?`ROUTE_X:`ROUTE_A)));
	end
	`ROUTE_B:
	begin
		new_route <= (route_req_c_in)?`ROUTE_C:((route_req_d_in)?`ROUTE_D:((route_req_x_in)?`ROUTE_X:((route_req_a_in)?`ROUTE_A:`ROUTE_A)));
	end
	`ROUTE_C:
	begin
		new_route <= (route_req_d_in)?`ROUTE_D:((route_req_x_in)?`ROUTE_X:((route_req_a_in)?`ROUTE_A:((route_req_b_in)?`ROUTE_B:`ROUTE_A)));
	end
	`ROUTE_D:
	begin
		new_route <= (route_req_x_in)?`ROUTE_X:((route_req_a_in)?`ROUTE_A:((route_req_b_in)?`ROUTE_B:((route_req_c_in)?`ROUTE_C:`ROUTE_A)));
	end
	`ROUTE_X:
	begin
		new_route <= (route_req_a_in)?`ROUTE_A:((route_req_b_in)?`ROUTE_B:((route_req_c_in)?`ROUTE_C:((route_req_d_in)?`ROUTE_D:`ROUTE_A)));
	end
	default:
	begin
		new_route <= `ROUTE_A;
			//this one I am not willing to chince on
	end
	endcase
end
//end the rotating priority encoder

always @(current_route_f or planned_f)
begin
	if(planned_f)
	begin
		case(current_route_f)
		`ROUTE_A:	
			begin
				route_req_a_mask <= 1'b0;
				route_req_b_mask <= 1'b1;
				route_req_c_mask <= 1'b1;
				route_req_d_mask <= 1'b1;
				route_req_x_mask <= 1'b1;
			end
		`ROUTE_B:
			begin
				route_req_a_mask <= 1'b1;
				route_req_b_mask <= 1'b0;
				route_req_c_mask <= 1'b1;
				route_req_d_mask <= 1'b1;
				route_req_x_mask <= 1'b1;
			end
		`ROUTE_C:
			begin
				route_req_a_mask <= 1'b1;
				route_req_b_mask <= 1'b1;
				route_req_c_mask <= 1'b0;
				route_req_d_mask <= 1'b1;
				route_req_x_mask <= 1'b1;
			end
		`ROUTE_D:
			begin
				route_req_a_mask <= 1'b1;
				route_req_b_mask <= 1'b1;
				route_req_c_mask <= 1'b1;
				route_req_d_mask <= 1'b0;
				route_req_x_mask <= 1'b1;
			end
		`ROUTE_X:
			begin
				route_req_a_mask <= 1'b1;
				route_req_b_mask <= 1'b1;
				route_req_c_mask <= 1'b1;
				route_req_d_mask <= 1'b1;
				route_req_x_mask <= 1'b0;
			end
		default:
			begin
				route_req_a_mask <= 1'b1;
				route_req_b_mask <= 1'b1;
				route_req_c_mask <= 1'b1;
				route_req_d_mask <= 1'b1;
				route_req_x_mask <= 1'b1;
			end
		endcase
	end
	else
	begin
		route_req_a_mask <= 1'b1;
		route_req_b_mask <= 1'b1;
		route_req_c_mask <= 1'b1;
		route_req_d_mask <= 1'b1;
		route_req_x_mask <= 1'b1;
	end
end

//calculation of new_route_needed
always @ (planned_f or tail_current_route or valid_out_internal or default_ready)
begin
	case({default_ready, valid_out_internal, tail_current_route, planned_f}) //synopsys parallel_case
	4'b0000:	new_route_needed <= 1'b1;
	4'b0001:	new_route_needed <= 1'b0;
	4'b0010:	new_route_needed <= 1'b1;
	4'b0011:	new_route_needed <= 1'b0;
	4'b0100:	new_route_needed <= 1'b0;	//This line should probably be turned to a 1 if we are to implement "Mikes fairness" schema
	4'b0101:	new_route_needed <= 1'b0;	//This line should probably be turned to a 1 if we are to implement "Mikes fairness" schema
	4'b0110:	new_route_needed <= 1'b1;
	4'b0111:	new_route_needed <= 1'b1;

	4'b1000:	new_route_needed <= 1'b1;
	4'b1001:	new_route_needed <= 1'b0;
//	4'b1010:	new_route_needed <= 1'b0;	//this is scary CHECK THIS BEFORE CHIP SHIPS
	4'b1010:	new_route_needed <= 1'b1;	//this is the case where there is a zero length message on the default route that is not being sent this cycle therefore we should let something be locked in, but it doesn't necessarily just the default route.  Remember that the default route is the last choice in the priority encoder, but if nothing else is requesting, the default route will be planned and locked in.
    //yanqiz change from 0->1
	4'b1011:	new_route_needed <= 1'b0;
	4'b1100:	new_route_needed <= 1'b0;
	4'b1101:	new_route_needed <= 1'b0;
	4'b1110:	new_route_needed <= 1'b1;
	4'b1111:	new_route_needed <= 1'b1;
	default:	new_route_needed <= 1'b1;
			//safest choice should never occur
	endcase
end

//calculation of planned_temp
//random five input function
always @ (planned_f or tail_current_route or valid_out_internal or default_ready or route_req_all_or_with_planned or route_req_all_but_default)
begin
	case({route_req_all_or_with_planned, default_ready, valid_out_internal, tail_current_route, planned_f}) //synopsys parallel_case
	5'b00000:	planned_temp <= 1'b0;
	5'b00001:	planned_temp <= 1'b1;
	5'b00010:	planned_temp <= 1'b0;
	5'b00011:	planned_temp <= 1'b1;
	5'b00100:	planned_temp <= 1'b0;	//error what did we just send
	5'b00101:	planned_temp <= 1'b1;
	5'b00110:	planned_temp <= 1'b0;	//error
	5'b00111:	planned_temp <= 1'b0;

	5'b01000:	planned_temp <= 1'b0;	//error
	5'b01001:	planned_temp <= 1'b1;
	5'b01010:	planned_temp <= 1'b0;	//This actually cannot happen
	5'b01011:	planned_temp <= 1'b1;
	5'b01100:	planned_temp <= 1'b0;	//What did we just send?
	5'b01101:	planned_temp <= 1'b1;
	5'b01110:	planned_temp <= 1'b0;	//error
	5'b01111:	planned_temp <= 1'b0;	//The default route is
						//currently planned but
						//is ending this cycle
						//and nobody else wants to go
						//This is a delayed zero length
						//message on the through route
	5'b10000:	planned_temp <= 1'b1;
	5'b10001:	planned_temp <= 1'b1;
	5'b10010:	planned_temp <= 1'b1;
	5'b10011:	planned_temp <= 1'b1;
	5'b10100:	planned_temp <= 1'b1;
	5'b10101:	planned_temp <= 1'b1;
	5'b10110:	planned_temp <= 1'b1;
	5'b10111:	planned_temp <= 1'b1;
	5'b11000:	planned_temp <= 1'b1;
	5'b11001:	planned_temp <= 1'b1;
	5'b11010:	planned_temp <= 1'b1;
	5'b11011:	planned_temp <= 1'b1;
	5'b11100:	planned_temp <= 1'b1;
	5'b11101:	planned_temp <= 1'b1;
//	5'b11110:	planned_temp <= 1'b0;	//This is wrong becasue if
						//there is a default
						//route zero length message
						//that is being sent and
						//somebody else wants to send
						//on the next cycle
	5'b11110:	planned_temp <= route_req_all_but_default;
	5'b11111:	planned_temp <= 1'b1;
	default:	planned_temp <= 1'b0;
	endcase
end

//take care of syncrhonous stuff
always @(posedge clk)
begin
	if(reset)
	begin
		current_route_f <= 3'd0;
		planned_f <= 1'd0;
	end
	else
	begin
		current_route_f <= current_route_temp;
		planned_f <= planned_temp;
	end
end

endmodule
