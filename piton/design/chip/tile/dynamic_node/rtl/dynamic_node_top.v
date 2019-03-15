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

//Function: This wires everything together to make a crossbar
//

`include "define.tmp.h"

module dynamic_node_top(clk,
		    reset_in,
		    dataIn_N,
		    dataIn_E,
		    dataIn_S,
		    dataIn_W,
		    dataIn_P,
		    validIn_N,
		    validIn_E,
		    validIn_S,
		    validIn_W,
		    validIn_P,
		    yummyIn_N,
		    yummyIn_E,
		    yummyIn_S,
		    yummyIn_W,
		    yummyIn_P,
		    myLocX,
		    myLocY,
            myChipID,
		    store_meter_partner_address_X,
		    store_meter_partner_address_Y,
		    ec_cfg,
		    dataOut_N,
		    dataOut_E,
		    dataOut_S,
		    dataOut_W,
		    dataOut_P,
		    validOut_N,
		    validOut_E,
		    validOut_S,
		    validOut_W,
		    validOut_P,
		    yummyOut_N,
		    yummyOut_E,
		    yummyOut_S,
		    yummyOut_W,
		    yummyOut_P,
		    thanksIn_P,
		    external_interrupt,
		    store_meter_ack_partner,
		    store_meter_ack_non_partner,
		    ec_out);

// begin port declarations

input clk;
input reset_in;
   
input [`DATA_WIDTH-1:0] dataIn_N;	// data inputs from neighboring tiles
input [`DATA_WIDTH-1:0] dataIn_E;
input [`DATA_WIDTH-1:0] dataIn_S;
input [`DATA_WIDTH-1:0] dataIn_W;
input [`DATA_WIDTH-1:0] dataIn_P;	// data input from processor
   
input validIn_N;		// valid signals from neighboring tiles
input validIn_E;
input validIn_S;
input validIn_W;
input validIn_P;		// valid signal from processor
   
input yummyIn_N;		// neighbor consumed output data
input yummyIn_E;
input yummyIn_S;
input yummyIn_W;
input yummyIn_P;		// processor consumed output data
   
input [`XY_WIDTH-1:0] myLocX;		// this tile's position
input [`XY_WIDTH-1:0] myLocY;
input [`CHIP_ID_WIDTH-1:0] myChipID;

input [4:0] store_meter_partner_address_X;
input [4:0] store_meter_partner_address_Y;

input [14:0] ec_cfg;            // NESWP 3 bits each selecter of event to monitor


output [`DATA_WIDTH-1:0] dataOut_N;	// data outputs to neighbors
output [`DATA_WIDTH-1:0] dataOut_E;
output [`DATA_WIDTH-1:0] dataOut_S;
output [`DATA_WIDTH-1:0] dataOut_W;
output [`DATA_WIDTH-1:0] dataOut_P;	// data output to processor

output validOut_N;		// valid outputs to neighbors
output validOut_E;
output validOut_S;
output validOut_W;
output validOut_P;		// valid output to processor
   
output yummyOut_N;		// yummy signal to neighbors' output buffers
output yummyOut_E;
output yummyOut_S;
output yummyOut_W;
output yummyOut_P;		// yummy signal to processor's output buffer

output thanksIn_P;		// thanksIn to processor's space_avail

output external_interrupt;	//is used for the proc to know
				//that an external interrupt occured
output store_meter_ack_partner;      // strobes high when a memory ack word is popped off of the network
                                     // and the sender ID matches the "partner port" id from the STORE_METER
output store_meter_ack_non_partner;  // strobes high when a memory ack word is popped off of the network
                                     // and the sender ID does not match the "partner port" id from the STORE_METER


output [4:0] ec_out;


wire   ec_wants_to_send_but_cannot_N,
       ec_wants_to_send_but_cannot_E,
       ec_wants_to_send_but_cannot_S,
       ec_wants_to_send_but_cannot_W,
       ec_wants_to_send_but_cannot_P;

// end port declarations

   wire store_ack_received;
   wire store_ack_received_r;
   wire [9:0] store_ack_addr;
   wire [9:0] store_ack_addr_r;

//wires

wire north_input_tail;
wire east_input_tail;
wire south_input_tail;
wire west_input_tail;
wire proc_input_tail;

wire [`DATA_WIDTH-1:0] north_input_data;
wire [`DATA_WIDTH-1:0] east_input_data;
wire [`DATA_WIDTH-1:0] south_input_data;
wire [`DATA_WIDTH-1:0] west_input_data;
wire [`DATA_WIDTH-1:0] proc_input_data;

wire north_input_valid;
wire east_input_valid;
wire south_input_valid;
wire west_input_valid;
wire proc_input_valid;

wire thanks_n_to_n;
wire thanks_n_to_e;
wire thanks_n_to_s;
wire thanks_n_to_w;
wire thanks_n_to_p;

wire thanks_e_to_n;
wire thanks_e_to_e;
wire thanks_e_to_s;
wire thanks_e_to_w;
wire thanks_e_to_p;

wire thanks_s_to_n;
wire thanks_s_to_e;
wire thanks_s_to_s;
wire thanks_s_to_w;
wire thanks_s_to_p;

wire thanks_w_to_n;
wire thanks_w_to_e;
wire thanks_w_to_s;
wire thanks_w_to_w;
wire thanks_w_to_p;

wire thanks_p_to_n;
wire thanks_p_to_e;
wire thanks_p_to_s;
wire thanks_p_to_w;
wire thanks_p_to_p;

wire route_req_n_to_n;
wire route_req_n_to_e;
wire route_req_n_to_s;
wire route_req_n_to_w;
wire route_req_n_to_p;

wire route_req_e_to_n;
wire route_req_e_to_e;
wire route_req_e_to_s;
wire route_req_e_to_w;
wire route_req_e_to_p;

wire route_req_s_to_n;
wire route_req_s_to_e;
wire route_req_s_to_s;
wire route_req_s_to_w;
wire route_req_s_to_p;

wire route_req_w_to_n;
wire route_req_w_to_e;
wire route_req_w_to_s;
wire route_req_w_to_w;
wire route_req_w_to_p;

wire route_req_p_to_n;
wire route_req_p_to_e;
wire route_req_p_to_s;
wire route_req_p_to_w;
wire route_req_p_to_p;

wire default_ready_n_to_s;
wire default_ready_e_to_w;
wire default_ready_s_to_n;
wire default_ready_s_to_p;
wire default_ready_w_to_e;

// input/output buffered signals
wire yummyOut_N_internal;
wire yummyOut_E_internal;
wire yummyOut_S_internal;
wire yummyOut_W_internal;
wire yummyOut_P_internal;

wire validOut_N_internal;
wire validOut_E_internal;
wire validOut_S_internal;
wire validOut_W_internal;
wire validOut_P_internal;

wire [`DATA_WIDTH-1:0] dataOut_N_internal;
wire [`DATA_WIDTH-1:0] dataOut_E_internal;
wire [`DATA_WIDTH-1:0] dataOut_S_internal;
wire [`DATA_WIDTH-1:0] dataOut_W_internal;
wire [`DATA_WIDTH-1:0] dataOut_P_internal;

wire yummyOut_N_flip1_out;
wire yummyOut_E_flip1_out;
wire yummyOut_S_flip1_out;
wire yummyOut_W_flip1_out;
//wire yummyOut_P_flip1_out;

wire validOut_N_flip1_out;
wire validOut_E_flip1_out;
wire validOut_S_flip1_out;
wire validOut_W_flip1_out;
//wire validOut_P_flip1_out;

wire [`DATA_WIDTH-1:0] dataOut_N_flip1_out;
wire [`DATA_WIDTH-1:0] dataOut_E_flip1_out;
wire [`DATA_WIDTH-1:0] dataOut_S_flip1_out;
wire [`DATA_WIDTH-1:0] dataOut_W_flip1_out;
//wire [`DATA_WIDTH-1:0] dataOut_P_flip1_out;

wire yummyIn_N_internal;
wire yummyIn_E_internal;
wire yummyIn_S_internal;
wire yummyIn_W_internal;
wire yummyIn_P_internal;

wire validIn_N_internal;
wire validIn_E_internal;
wire validIn_S_internal;
wire validIn_W_internal;
//wire validIn_P_internal;

wire [`DATA_WIDTH-1:0] dataIn_N_internal;
wire [`DATA_WIDTH-1:0] dataIn_E_internal;
wire [`DATA_WIDTH-1:0] dataIn_S_internal;
wire [`DATA_WIDTH-1:0] dataIn_W_internal;
//wire [`DATA_WIDTH-1:0] dataIn_P_internal;

wire yummyIn_N_flip1_out;
wire yummyIn_E_flip1_out;
wire yummyIn_S_flip1_out;
wire yummyIn_W_flip1_out;
//wire yummyIn_P_flip1_out;

wire validIn_N_flip1_out;
wire validIn_E_flip1_out;
wire validIn_S_flip1_out;
wire validIn_W_flip1_out;
//wire validIn_P_flip1_out;

wire [`DATA_WIDTH-1:0] dataIn_N_flip1_out;
wire [`DATA_WIDTH-1:0] dataIn_E_flip1_out;
wire [`DATA_WIDTH-1:0] dataIn_S_flip1_out;
wire [`DATA_WIDTH-1:0] dataIn_W_flip1_out;
//wire [`DATA_WIDTH-1:0] dataIn_P_flip1_out;

//state
reg [`XY_WIDTH-1:0] myLocX_f;
reg [`XY_WIDTH-1:0] myLocY_f;
reg [`CHIP_ID_WIDTH-1:0] myChipID_f;
wire   reset;


// event counter logic
//
//

reg ec_thanks_n_to_n_reg, ec_thanks_n_to_e_reg, ec_thanks_n_to_s_reg, ec_thanks_n_to_w_reg, ec_thanks_n_to_p_reg;
reg ec_thanks_e_to_n_reg, ec_thanks_e_to_e_reg, ec_thanks_e_to_s_reg, ec_thanks_e_to_w_reg, ec_thanks_e_to_p_reg;
reg ec_thanks_s_to_n_reg, ec_thanks_s_to_e_reg, ec_thanks_s_to_s_reg, ec_thanks_s_to_w_reg, ec_thanks_s_to_p_reg;
reg ec_thanks_w_to_n_reg, ec_thanks_w_to_e_reg, ec_thanks_w_to_s_reg, ec_thanks_w_to_w_reg, ec_thanks_w_to_p_reg;
reg ec_thanks_p_to_n_reg, ec_thanks_p_to_e_reg, ec_thanks_p_to_s_reg, ec_thanks_p_to_w_reg, ec_thanks_p_to_p_reg;
reg ec_wants_to_send_but_cannot_N_reg, ec_wants_to_send_but_cannot_E_reg, ec_wants_to_send_but_cannot_S_reg, ec_wants_to_send_but_cannot_W_reg, ec_wants_to_send_but_cannot_P_reg;
reg ec_north_input_valid_reg, ec_east_input_valid_reg, ec_south_input_valid_reg, ec_west_input_valid_reg, ec_proc_input_valid_reg;


// let's register these babies before they do any damage to the cycle time -- mbt
always @(posedge clk)
  begin
     ec_thanks_n_to_n_reg <= thanks_n_to_n; ec_thanks_n_to_e_reg <= thanks_n_to_e; ec_thanks_n_to_s_reg <= thanks_n_to_s; ec_thanks_n_to_w_reg <= thanks_n_to_w; ec_thanks_n_to_p_reg <= thanks_n_to_p;
     ec_thanks_e_to_n_reg <= thanks_e_to_n; ec_thanks_e_to_e_reg <= thanks_e_to_e; ec_thanks_e_to_s_reg <= thanks_e_to_s; ec_thanks_e_to_w_reg <= thanks_e_to_w; ec_thanks_e_to_p_reg <= thanks_e_to_p;
     ec_thanks_s_to_n_reg <= thanks_s_to_n; ec_thanks_s_to_e_reg <= thanks_s_to_e; ec_thanks_s_to_s_reg <= thanks_s_to_s; ec_thanks_s_to_w_reg <= thanks_s_to_w; ec_thanks_s_to_p_reg <= thanks_s_to_p;
     ec_thanks_w_to_n_reg <= thanks_w_to_n; ec_thanks_w_to_e_reg <= thanks_w_to_e; ec_thanks_w_to_s_reg <= thanks_w_to_s; ec_thanks_w_to_w_reg <= thanks_w_to_w; ec_thanks_w_to_p_reg <= thanks_w_to_p;
     ec_thanks_p_to_n_reg <= thanks_p_to_n; ec_thanks_p_to_e_reg <= thanks_p_to_e; ec_thanks_p_to_s_reg <= thanks_p_to_s; ec_thanks_p_to_w_reg <= thanks_p_to_w; ec_thanks_p_to_p_reg <= thanks_p_to_p;
     ec_wants_to_send_but_cannot_N_reg <= ec_wants_to_send_but_cannot_N;
     ec_wants_to_send_but_cannot_E_reg <= ec_wants_to_send_but_cannot_E;
     ec_wants_to_send_but_cannot_S_reg <= ec_wants_to_send_but_cannot_S;
     ec_wants_to_send_but_cannot_W_reg <= ec_wants_to_send_but_cannot_W;
     ec_wants_to_send_but_cannot_P_reg <= ec_wants_to_send_but_cannot_P;
     ec_north_input_valid_reg <= north_input_valid;
     ec_east_input_valid_reg  <= east_input_valid;
     ec_south_input_valid_reg <= south_input_valid;
     ec_west_input_valid_reg  <= west_input_valid;
     ec_proc_input_valid_reg  <= proc_input_valid;
  end

   wire ec_thanks_to_n = ec_thanks_n_to_n_reg | ec_thanks_e_to_n_reg | ec_thanks_s_to_n_reg | ec_thanks_w_to_n_reg | ec_thanks_p_to_n_reg;
   wire ec_thanks_to_e = ec_thanks_n_to_e_reg | ec_thanks_e_to_e_reg | ec_thanks_s_to_e_reg | ec_thanks_w_to_e_reg | ec_thanks_p_to_e_reg;
   wire ec_thanks_to_s = ec_thanks_n_to_s_reg | ec_thanks_e_to_s_reg | ec_thanks_s_to_s_reg | ec_thanks_w_to_s_reg | ec_thanks_p_to_s_reg;
   wire ec_thanks_to_w = ec_thanks_n_to_w_reg | ec_thanks_e_to_w_reg | ec_thanks_s_to_w_reg | ec_thanks_w_to_w_reg | ec_thanks_p_to_w_reg;
   wire ec_thanks_to_p = ec_thanks_n_to_p_reg | ec_thanks_e_to_p_reg | ec_thanks_s_to_p_reg | ec_thanks_w_to_p_reg | ec_thanks_p_to_p_reg;

one_of_eight #(1) ec_mux_north(.in0(ec_wants_to_send_but_cannot_N),
                        .in1(ec_thanks_p_to_n_reg),
                        .in2(ec_thanks_w_to_n_reg),
                        .in3(ec_thanks_s_to_n_reg),
                        .in4(ec_thanks_e_to_n_reg),
                        .in5(ec_thanks_n_to_n_reg),
                        .in6(ec_thanks_to_n),
                        .in7(ec_north_input_valid_reg & ~ec_thanks_to_n),
                        .sel(ec_cfg[14:12]),
                        .out(ec_out[4]));

one_of_eight #(1) ec_mux_east(.in0(ec_wants_to_send_but_cannot_E),
                       .in1(ec_thanks_p_to_e_reg),
                       .in2(ec_thanks_w_to_e_reg),
                       .in3(ec_thanks_s_to_e_reg),
                       .in4(ec_thanks_e_to_e_reg),
                       .in5(ec_thanks_n_to_e_reg),
                       .in6(ec_thanks_to_e),
                       .in7(ec_east_input_valid_reg & ~ec_thanks_to_e),
                       .sel(ec_cfg[11:9]),
                       .out(ec_out[3]));

one_of_eight #(1) ec_mux_south(.in0(ec_wants_to_send_but_cannot_S),
                        .in1(ec_thanks_p_to_s_reg),
                        .in2(ec_thanks_w_to_s_reg),
                        .in3(ec_thanks_s_to_s_reg),
                        .in4(ec_thanks_e_to_s_reg),
                        .in5(ec_thanks_n_to_s_reg),
                        .in6(ec_thanks_to_s),
                        .in7(ec_south_input_valid_reg & ~ec_thanks_to_s),
                        .sel(ec_cfg[8:6]),
                        .out(ec_out[2]));

one_of_eight #(1) ec_mux_west( .in0(ec_wants_to_send_but_cannot_W),
                        .in1(ec_thanks_p_to_w_reg),
                        .in2(ec_thanks_w_to_w_reg),
                        .in3(ec_thanks_s_to_w_reg),
                        .in4(ec_thanks_e_to_w_reg),
                        .in5(ec_thanks_n_to_w_reg),
                        .in6(ec_thanks_to_w),
                        .in7(ec_west_input_valid_reg & ~ec_thanks_to_w),
                        .sel(ec_cfg[5:3]),
                        .out(ec_out[1]));

one_of_eight #(1) ec_mux_proc( .in0(ec_wants_to_send_but_cannot_P),
                        .in1(ec_thanks_p_to_p_reg),
                        .in2(ec_thanks_w_to_p_reg),
                        .in3(ec_thanks_s_to_p_reg),
                        .in4(ec_thanks_e_to_p_reg),
                        .in5(ec_thanks_n_to_p_reg),
                        .in6(ec_thanks_to_p),
                        .in7(ec_proc_input_valid_reg & ~ec_thanks_to_p),
                        .sel(ec_cfg[2:0]),
                        .out(ec_out[0]));

// end event counter logic

net_dff #(1) REG_reset_fin(.d(reset_in), .q(reset), .clk(clk));

net_dff #(10) REG_store_ack_addr(   .d(store_ack_addr),     .q(store_ack_addr_r),     .clk(clk));
net_dff #(1) REG_store_ack_received(.d(store_ack_received), .q(store_ack_received_r), .clk(clk));

   wire is_partner_address_v_r;
   bus_compare_equal #(10) CMP_partner_address (.a(store_ack_addr_r),
                                        .b({ store_meter_partner_address_Y, store_meter_partner_address_X } ),
                                        .bus_equal(is_partner_address_v_r));

   assign store_meter_ack_partner     = is_partner_address_v_r & store_ack_received_r;
   assign store_meter_ack_non_partner = ~is_partner_address_v_r & store_ack_received_r;

//make it so that the mdn_cfg location register has
//one cycle latency when being changed
//this was done so that these flops could be put near the
//dynamic network but this does mean that the cycle directly
//folowing a mtsr MDN_CFG which changes the location bits
//will still use the old value
//likewise it would be best to make sure there are no in-flight memory
//operations when setting the X and Y location for a tile.
always @ (posedge clk)
begin
        if(reset)
        begin
                myLocY_f <= `XY_WIDTH'd0;
                myLocX_f <= `XY_WIDTH'd0;
                myChipID_f <= `CHIP_ID_WIDTH'd0;
        end
        else
        begin
                myLocY_f <= myLocY;
                myLocX_f <= myLocX;
                myChipID_f <= myChipID;
        end
end

// mmckeown: Removing DUMMY modules
//dummy signals
/*`ifdef NO_DUMMY
`else
   rDUMMY #(1) default_ready_n_to_s_dummy (.A(default_ready_n_to_s));

   rDUMMY #(1) default_ready_e_to_w_dummy (.A(default_ready_e_to_w));

   rDUMMY #(1) default_ready_s_to_n_dummy (.A(default_ready_s_to_n));

   rDUMMY #(1) default_ready_s_to_p_dummy (.A(default_ready_s_to_p));

   rDUMMY #(1) default_ready_w_to_e_dummy (.A(default_ready_w_to_e));
`endif

//dummy signals for detecting the critical path for the valid and data signals
`ifdef NO_DUMMY
`else
   rDUMMY #(1) valid_out_north(.A(validOut_N_internal));
   rDUMMY #(1) valid_out_east(.A(validOut_E_internal));
   rDUMMY #(1) valid_out_south(.A(validOut_S_internal));
   rDUMMY #(1) valid_out_west(.A(validOut_W_internal));
   rDUMMY #(1) valid_out_proc(.A(validOut_P_internal));

   rDUMMY #(`DATA_WIDTH) data_out_north(.A(dataOut_N_internal));
   rDUMMY #(`DATA_WIDTH) data_out_east(.A(dataOut_E_internal));
   rDUMMY #(`DATA_WIDTH) data_out_south(.A(dataOut_S_internal));
   rDUMMY #(`DATA_WIDTH) data_out_west(.A(dataOut_W_internal));
   rDUMMY #(`DATA_WIDTH) data_out_proc(.A(dataOut_P_internal));
`endif*/

//wire regs

//assigns
assign thanksIn_P = thanks_n_to_p | thanks_e_to_p | thanks_s_to_p | thanks_w_to_p | thanks_p_to_p;

//assign validOut_N = validOut_N_internal;
//assign validOut_E = validOut_E_internal;
//assign validOut_S = validOut_S_internal;
//assign validOut_W = validOut_W_internal;
assign validOut_P = validOut_P_internal;

//assign dataOut_N = dataOut_N_internal;
//assign dataOut_E = dataOut_E_internal;
//assign dataOut_S = dataOut_S_internal;
//assign dataOut_W = dataOut_W_internal;
assign dataOut_P = dataOut_P_internal;

//more assigns
assign yummyIn_P_internal = yummyIn_P;
assign yummyOut_P = yummyOut_P_internal;

   
// two sets of inverters for output signals (buffering for timing purposes)
flip_bus #(1, 14) yummyOut_N_flip1(yummyOut_N_internal, yummyOut_N_flip1_out);
flip_bus #(1, 14) yummyOut_E_flip1(yummyOut_E_internal, yummyOut_E_flip1_out);
flip_bus #(1, 14) yummyOut_S_flip1(yummyOut_S_internal, yummyOut_S_flip1_out);
flip_bus #(1, 14) yummyOut_W_flip1(yummyOut_W_internal, yummyOut_W_flip1_out);
//flip_bus #(1, 14) yummyOut_P_flip1(yummyOut_P_internal, yummyOut_P_flip1_out);
flip_bus #(1, 21) yummyOut_N_flip2(yummyOut_N_flip1_out, yummyOut_N);
flip_bus #(1, 21) yummyOut_E_flip2(yummyOut_E_flip1_out, yummyOut_E);
flip_bus #(1, 21) yummyOut_S_flip2(yummyOut_S_flip1_out, yummyOut_S);
flip_bus #(1, 21) yummyOut_W_flip2(yummyOut_W_flip1_out, yummyOut_W);
//flip_bus #(1, 21) yummyOut_P_flip2(yummyOut_P_flip1_out, yummyOut_P);

flip_bus #(1, 14) validOut_N_flip1(validOut_N_internal, validOut_N_flip1_out);
flip_bus #(1, 14) validOut_E_flip1(validOut_E_internal, validOut_E_flip1_out);
flip_bus #(1, 14) validOut_S_flip1(validOut_S_internal, validOut_S_flip1_out);
flip_bus #(1, 14) validOut_W_flip1(validOut_W_internal, validOut_W_flip1_out);
//flip_bus #(1, 14) validOut_P_flip1(validOut_P_internal, validOut_P_flip1_out);
flip_bus #(1, 21) validOut_N_flip2(validOut_N_flip1_out, validOut_N);
flip_bus #(1, 21) validOut_E_flip2(validOut_E_flip1_out, validOut_E);
flip_bus #(1, 21) validOut_S_flip2(validOut_S_flip1_out, validOut_S);
flip_bus #(1, 21) validOut_W_flip2(validOut_W_flip1_out, validOut_W);
//flip_bus #(1, 21) validOut_P_flip2(validOut_P_flip1_out, validOut_P);

flip_bus #(`DATA_WIDTH, 14) dataOut_N_flip1(dataOut_N_internal, dataOut_N_flip1_out);
flip_bus #(`DATA_WIDTH, 14) dataOut_E_flip1(dataOut_E_internal, dataOut_E_flip1_out);
flip_bus #(`DATA_WIDTH, 14) dataOut_S_flip1(dataOut_S_internal, dataOut_S_flip1_out);
flip_bus #(`DATA_WIDTH, 14) dataOut_W_flip1(dataOut_W_internal, dataOut_W_flip1_out);
//flip_bus #(`DATA_WIDTH, 14) dataOut_P_flip1(dataOut_P_internal, dataOut_P_flip1_out);
flip_bus #(`DATA_WIDTH, 21) dataOut_N_flip2(dataOut_N_flip1_out, dataOut_N);
flip_bus #(`DATA_WIDTH, 21) dataOut_E_flip2(dataOut_E_flip1_out, dataOut_E);
flip_bus #(`DATA_WIDTH, 21) dataOut_S_flip2(dataOut_S_flip1_out, dataOut_S);
flip_bus #(`DATA_WIDTH, 21) dataOut_W_flip2(dataOut_W_flip1_out, dataOut_W);
//flip_bus #(`DATA_WIDTH, 21) dataOut_P_flip2(dataOut_P_flip1_out, dataOut_P);

// two sets of inverters for input signals (buffering for timing purposes)
flip_bus #(1, 14) yummyIn_N_flip1(yummyIn_N, yummyIn_N_flip1_out);
flip_bus #(1, 14) yummyIn_E_flip1(yummyIn_E, yummyIn_E_flip1_out);
flip_bus #(1, 14) yummyIn_S_flip1(yummyIn_S, yummyIn_S_flip1_out);
flip_bus #(1, 14) yummyIn_W_flip1(yummyIn_W, yummyIn_W_flip1_out);
//flip_bus #(1, 14) yummyIn_P_flip1(yummyIn_P, yummyIn_P_flip1_out);
flip_bus #(1, 10) yummyIn_N_flip2(yummyIn_N_flip1_out, yummyIn_N_internal);
flip_bus #(1, 10) yummyIn_E_flip2(yummyIn_E_flip1_out, yummyIn_E_internal);
flip_bus #(1, 10) yummyIn_S_flip2(yummyIn_S_flip1_out, yummyIn_S_internal);
flip_bus #(1, 10) yummyIn_W_flip2(yummyIn_W_flip1_out, yummyIn_W_internal);
//flip_bus #(1, 10) yummyIn_P_flip2(yummyIn_P_flip1_out, yummyIn_P_internal);

flip_bus #(1, 14) validIn_N_flip1(validIn_N, validIn_N_flip1_out);
flip_bus #(1, 14) validIn_E_flip1(validIn_E, validIn_E_flip1_out);
flip_bus #(1, 14) validIn_S_flip1(validIn_S, validIn_S_flip1_out);
flip_bus #(1, 14) validIn_W_flip1(validIn_W, validIn_W_flip1_out);
//flip_bus #(1, 14) validIn_P_flip1(validIn_P, validIn_P_flip1_out);
flip_bus #(1, 10) validIn_N_flip2(validIn_N_flip1_out, validIn_N_internal);
flip_bus #(1, 10) validIn_E_flip2(validIn_E_flip1_out, validIn_E_internal);
flip_bus #(1, 10) validIn_S_flip2(validIn_S_flip1_out, validIn_S_internal);
flip_bus #(1, 10) validIn_W_flip2(validIn_W_flip1_out, validIn_W_internal);
//flip_bus #(1, 10) validIn_P_flip2(validIn_P_flip1_out, validIn_P_internal);

flip_bus #(`DATA_WIDTH, 14) dataIn_N_flip1(dataIn_N, dataIn_N_flip1_out);
flip_bus #(`DATA_WIDTH, 14) dataIn_E_flip1(dataIn_E, dataIn_E_flip1_out);
flip_bus #(`DATA_WIDTH, 14) dataIn_S_flip1(dataIn_S, dataIn_S_flip1_out);
flip_bus #(`DATA_WIDTH, 14) dataIn_W_flip1(dataIn_W, dataIn_W_flip1_out);
//flip_bus #(`DATA_WIDTH, 14) dataIn_P_flip1(dataIn_P, dataIn_P_flip1_out);
flip_bus #(`DATA_WIDTH, 10) dataIn_N_flip2(dataIn_N_flip1_out, dataIn_N_internal);
flip_bus #(`DATA_WIDTH, 10) dataIn_E_flip2(dataIn_E_flip1_out, dataIn_E_internal);
flip_bus #(`DATA_WIDTH, 10) dataIn_S_flip2(dataIn_S_flip1_out, dataIn_S_internal);
flip_bus #(`DATA_WIDTH, 10) dataIn_W_flip2(dataIn_W_flip1_out, dataIn_W_internal);
//flip_bus #(`DATA_WIDTH, 10) dataIn_P_flip2(dataIn_P_flip1_out, dataIn_P_internal);


//instantiations


//the following dense code impliments a full crossbar.
//The two main components are a dynamic_input_top_X and a dynamic_output_top

//the difference between dynamic_input_top_4 and dynamic_input_top_16 are the size of
//the nibs inside of them.

//dynamic inputs
dynamic_input_top_4 north_input(.route_req_n_out(route_req_n_to_n), .route_req_e_out(route_req_n_to_e), .route_req_s_out(route_req_n_to_s), .route_req_w_out(route_req_n_to_w), .route_req_p_out(route_req_n_to_p), .default_ready_n_out(), .default_ready_e_out(), .default_ready_s_out(default_ready_n_to_s), .default_ready_w_out(), .default_ready_p_out(), .tail_out(north_input_tail), .yummy_out(yummyOut_N_internal), .data_out(north_input_data), .valid_out(north_input_valid), .clk(clk), .reset(reset), .my_loc_x_in(myLocX_f), .my_loc_y_in(myLocY_f), .my_chip_id_in(myChipID_f), .valid_in(validIn_N_internal), .data_in(dataIn_N_internal), .thanks_n(thanks_n_to_n), .thanks_e(thanks_e_to_n), .thanks_s(thanks_s_to_n), .thanks_w(thanks_w_to_n), .thanks_p(thanks_p_to_n));

dynamic_input_top_4 east_input(.route_req_n_out(route_req_e_to_n), .route_req_e_out(route_req_e_to_e), .route_req_s_out(route_req_e_to_s), .route_req_w_out(route_req_e_to_w), .route_req_p_out(route_req_e_to_p), .default_ready_n_out(), .default_ready_e_out(), .default_ready_s_out(), .default_ready_w_out(default_ready_e_to_w), .default_ready_p_out(), .tail_out(east_input_tail), .yummy_out(yummyOut_E_internal), .data_out(east_input_data), .valid_out(east_input_valid), .clk(clk), .reset(reset), .my_loc_x_in(myLocX_f), .my_loc_y_in(myLocY_f), .my_chip_id_in(myChipID_f), .valid_in(validIn_E_internal), .data_in(dataIn_E_internal), .thanks_n(thanks_n_to_e), .thanks_e(thanks_e_to_e), .thanks_s(thanks_s_to_e), .thanks_w(thanks_w_to_e), .thanks_p(thanks_p_to_e));

dynamic_input_top_4 south_input(.route_req_n_out(route_req_s_to_n), .route_req_e_out(route_req_s_to_e), .route_req_s_out(route_req_s_to_s), .route_req_w_out(route_req_s_to_w), .route_req_p_out(route_req_s_to_p), .default_ready_n_out(default_ready_s_to_n), .default_ready_e_out(), .default_ready_s_out(), .default_ready_w_out(), .default_ready_p_out(default_ready_s_to_p), .tail_out(south_input_tail), .yummy_out(yummyOut_S_internal), .data_out(south_input_data), .valid_out(south_input_valid), .clk(clk), .reset(reset), .my_loc_x_in(myLocX_f), .my_loc_y_in(myLocY_f), .my_chip_id_in(myChipID_f), .valid_in(validIn_S_internal), .data_in(dataIn_S_internal), .thanks_n(thanks_n_to_s), .thanks_e(thanks_e_to_s), .thanks_s(thanks_s_to_s), .thanks_w(thanks_w_to_s), .thanks_p(thanks_p_to_s));

dynamic_input_top_4 west_input(.route_req_n_out(route_req_w_to_n), .route_req_e_out(route_req_w_to_e), .route_req_s_out(route_req_w_to_s), .route_req_w_out(route_req_w_to_w), .route_req_p_out(route_req_w_to_p), .default_ready_n_out(), .default_ready_e_out(default_ready_w_to_e), .default_ready_s_out(), .default_ready_w_out(), .default_ready_p_out(), .tail_out(west_input_tail), .yummy_out(yummyOut_W_internal), .data_out(west_input_data), .valid_out(west_input_valid), .clk(clk), .reset(reset), .my_loc_x_in(myLocX_f), .my_loc_y_in(myLocY_f), .my_chip_id_in(myChipID_f), .valid_in(validIn_W_internal), .data_in(dataIn_W_internal), .thanks_n(thanks_n_to_w), .thanks_e(thanks_e_to_w), .thanks_s(thanks_s_to_w), .thanks_w(thanks_w_to_w), .thanks_p(thanks_p_to_w));

dynamic_input_top_16 proc_input(.route_req_n_out(route_req_p_to_n), .route_req_e_out(route_req_p_to_e), .route_req_s_out(route_req_p_to_s), .route_req_w_out(route_req_p_to_w), .route_req_p_out(route_req_p_to_p), .default_ready_n_out(), .default_ready_e_out(), .default_ready_s_out(), .default_ready_w_out(), .default_ready_p_out(), .tail_out(proc_input_tail), .yummy_out(yummyOut_P_internal), .data_out(proc_input_data), .valid_out(proc_input_valid), .clk(clk), .reset(reset), .my_loc_x_in(myLocX_f), .my_loc_y_in(myLocY_f), .my_chip_id_in(myChipID_f), .valid_in(validIn_P), .data_in(dataIn_P), .thanks_n(thanks_n_to_p), .thanks_e(thanks_e_to_p), .thanks_s(thanks_s_to_p), .thanks_w(thanks_w_to_p), .thanks_p(thanks_p_to_p));

//dynamic outputs

dynamic_output_top north_output(.data_out(dataOut_N_internal), .thanks_a_out(thanks_n_to_s), .thanks_b_out(thanks_n_to_w), .thanks_c_out(thanks_n_to_p), .thanks_d_out(thanks_n_to_e), .thanks_x_out(thanks_n_to_n), .valid_out(validOut_N_internal),  .popped_interrupt_mesg_out(), .popped_memory_ack_mesg_out(), .popped_memory_ack_mesg_out_sender(), .ec_wants_to_send_but_cannot(ec_wants_to_send_but_cannot_N), .clk(clk), .reset(reset), .route_req_a_in(route_req_s_to_n), .route_req_b_in(route_req_w_to_n), .route_req_c_in(route_req_p_to_n), .route_req_d_in(route_req_e_to_n), .route_req_x_in(route_req_n_to_n), .tail_a_in(south_input_tail), .tail_b_in(west_input_tail), .tail_c_in(proc_input_tail), .tail_d_in(east_input_tail), .tail_x_in(north_input_tail), .data_a_in(south_input_data), .data_b_in(west_input_data), .data_c_in(proc_input_data), .data_d_in(east_input_data), .data_x_in(north_input_data), .valid_a_in(south_input_valid), .valid_b_in(west_input_valid), .valid_c_in(proc_input_valid), .valid_d_in(east_input_valid), .valid_x_in(north_input_valid), .default_ready_in(default_ready_s_to_n), .yummy_in(yummyIn_N_internal));

dynamic_output_top east_output(.data_out(dataOut_E_internal), .thanks_a_out(thanks_e_to_w), .thanks_b_out(thanks_e_to_p), .thanks_c_out(thanks_e_to_n), .thanks_d_out(thanks_e_to_s), .thanks_x_out(thanks_e_to_e), .valid_out(validOut_E_internal),   .popped_interrupt_mesg_out(), .popped_memory_ack_mesg_out(), .popped_memory_ack_mesg_out_sender(),  .ec_wants_to_send_but_cannot(ec_wants_to_send_but_cannot_E), .clk(clk), .reset(reset), .route_req_a_in(route_req_w_to_e), .route_req_b_in(route_req_p_to_e), .route_req_c_in(route_req_n_to_e), .route_req_d_in(route_req_s_to_e), .route_req_x_in(route_req_e_to_e), .tail_a_in(west_input_tail), .tail_b_in(proc_input_tail), .tail_c_in(north_input_tail), .tail_d_in(south_input_tail), .tail_x_in(east_input_tail), .data_a_in(west_input_data), .data_b_in(proc_input_data), .data_c_in(north_input_data), .data_d_in(south_input_data), .data_x_in(east_input_data), .valid_a_in(west_input_valid), .valid_b_in(proc_input_valid), .valid_c_in(north_input_valid), .valid_d_in(south_input_valid), .valid_x_in(east_input_valid), .default_ready_in(default_ready_w_to_e), .yummy_in(yummyIn_E_internal));

dynamic_output_top south_output(.data_out(dataOut_S_internal), .thanks_a_out(thanks_s_to_n), .thanks_b_out(thanks_s_to_e), .thanks_c_out(thanks_s_to_w), .thanks_d_out(thanks_s_to_p), .thanks_x_out(thanks_s_to_s), .valid_out(validOut_S_internal),   .popped_interrupt_mesg_out(), .popped_memory_ack_mesg_out(), .popped_memory_ack_mesg_out_sender(),  .ec_wants_to_send_but_cannot(ec_wants_to_send_but_cannot_S), .clk(clk), .reset(reset), .route_req_a_in(route_req_n_to_s), .route_req_b_in(route_req_e_to_s), .route_req_c_in(route_req_w_to_s), .route_req_d_in(route_req_p_to_s), .route_req_x_in(route_req_s_to_s), .tail_a_in(north_input_tail), .tail_b_in(east_input_tail), .tail_c_in(west_input_tail), .tail_d_in(proc_input_tail), .tail_x_in(south_input_tail), .data_a_in(north_input_data), .data_b_in(east_input_data), .data_c_in(west_input_data), .data_d_in(proc_input_data), .data_x_in(south_input_data), .valid_a_in(north_input_valid), .valid_b_in(east_input_valid), .valid_c_in(west_input_valid), .valid_d_in(proc_input_valid), .valid_x_in(south_input_valid), .default_ready_in(default_ready_n_to_s), .yummy_in(yummyIn_S_internal));

dynamic_output_top west_output(.data_out(dataOut_W_internal), .thanks_a_out(thanks_w_to_e), .thanks_b_out(thanks_w_to_s), .thanks_c_out(thanks_w_to_p), .thanks_d_out(thanks_w_to_n), .thanks_x_out(thanks_w_to_w), .valid_out(validOut_W_internal),   .popped_interrupt_mesg_out(), .popped_memory_ack_mesg_out(), .popped_memory_ack_mesg_out_sender(),  .ec_wants_to_send_but_cannot(ec_wants_to_send_but_cannot_W), .clk(clk), .reset(reset), .route_req_a_in(route_req_e_to_w), .route_req_b_in(route_req_s_to_w), .route_req_c_in(route_req_p_to_w), .route_req_d_in(route_req_n_to_w), .route_req_x_in(route_req_w_to_w), .tail_a_in(east_input_tail), .tail_b_in(south_input_tail), .tail_c_in(proc_input_tail), .tail_d_in(north_input_tail), .tail_x_in(west_input_tail), .data_a_in(east_input_data), .data_b_in(south_input_data), .data_c_in(proc_input_data), .data_d_in(north_input_data), .data_x_in(west_input_data), .valid_a_in(east_input_valid), .valid_b_in(south_input_valid), .valid_c_in(proc_input_valid), .valid_d_in(north_input_valid), .valid_x_in(west_input_valid), .default_ready_in(default_ready_e_to_w), .yummy_in(yummyIn_W_internal));
//yanqi change kill headers to 0
dynamic_output_top #(1'b0) proc_output(.data_out(dataOut_P_internal), .thanks_a_out(thanks_p_to_s), .thanks_b_out(thanks_p_to_w), .thanks_c_out(thanks_p_to_n), .thanks_d_out(thanks_p_to_e), .thanks_x_out(thanks_p_to_p), .valid_out(validOut_P_internal),  .popped_interrupt_mesg_out(external_interrupt), .popped_memory_ack_mesg_out(store_ack_received), .popped_memory_ack_mesg_out_sender(store_ack_addr),  .ec_wants_to_send_but_cannot(ec_wants_to_send_but_cannot_P), .clk(clk), .reset(reset), .route_req_a_in(route_req_s_to_p), .route_req_b_in(route_req_w_to_p), .route_req_c_in(route_req_n_to_p), .route_req_d_in(route_req_e_to_p), .route_req_x_in(route_req_p_to_p), .tail_a_in(south_input_tail), .tail_b_in(west_input_tail), .tail_c_in(north_input_tail), .tail_d_in(east_input_tail), .tail_x_in(proc_input_tail), .data_a_in(south_input_data), .data_b_in(west_input_data), .data_c_in(north_input_data), .data_d_in(east_input_data), .data_x_in(proc_input_data), .valid_a_in(south_input_valid), .valid_b_in(west_input_valid), .valid_c_in(north_input_valid), .valid_d_in(east_input_valid), .valid_x_in(proc_input_valid), .default_ready_in(default_ready_s_to_p), .yummy_in(yummyIn_P_internal));


endmodule // dynamic_node
