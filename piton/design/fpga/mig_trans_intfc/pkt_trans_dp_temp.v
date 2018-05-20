// ========== Copyright Header Begin ============================================
// Copyright (c) 2015 Princeton University
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

module pkt_trans_dp
# (
	parameter MAX_PKT_LEN       = 10, //measured in flits
  parameter ADDR_WIDTH     	  = 29, //size of addr to MC
  parameter MEMORY_WIDTH   		= 8,
  parameter DATA_WIDTH     	  = 64,
  parameter FLIT_SIZE	  	    = 64, //Size of one flit
  parameter FLT_ADDR_START    = 23, //memory address starts inside system global addr
  parameter FLT_ADDR_SIZE     = 23, //512 MB, addressed by 64 byte cache lines
  parameter FLT_SRC_START     = 0,  //TODO: detemine
  parameter FLT_SRC_LEN       = 0,  //TODO: detemine
  parameter FLT_DST_START     = 0,  //TODO: detemine
  parameter FLT_DST_LEN       = 20,  //TODO: detemine
  parameter	FLT_CMD_START     = 23,  //TODO: detemine
  parameter	FLT_CMD_LEN       = 1,  //TODO: detemine
  parameter FLT_LENGTH_START  = 22,  //TODO: detemine
  parameter FLT_LENGTH_LEN    = 4,  //TODO: detemine
  parameter IN_FLIGHT_LIMIT   = 16, //number of commands the MC can have in flight
  parameter BUFFER_ADDR_SIZE  = 4, //(log_2(IN_FLIGHT_LIMIT)+1)
  parameter READ_CMD          = 1,  //TODO: detemine actual command value
  parameter WRITE_CMD         = 0   //TODO: detemine actual command value
)(
clk,
rst,
flit_in,
flit_in_val,
flit_in_rdy,
flit_out,
flit_out_val,
flit_out_rdy,
app_rdy,
app_wdf_rdy,
app_rd_data,
app_rd_data_end,
app_rd_data_valid,
phy_init_done,
app_wdf_wren,
app_wdf_data,
app_wdf_mask,
app_wdf_end,
app_addr,
app_en,
app_cmd
);

`timescale 1ps/100fs

//TODO list:
// Change packet headers before release
// Perhaps change FIFO to be RAM - okay for simulation now
// write test bench, test

//packet parser states
`define ACCEPT_HEAD 0
`define ACCEPT_ADDR 1
`define ACCEPT_DATA 2
`define STALLED     3

//buffer item states
`define FILLING      0
`define WAITING_WDF  1
`define WAITING_CMD  2
`define WAITING_DATA 3
`define READY        4
`define INACTIVE     5


`define FIRST       0
`define SECOND      1

localparam APP_DATA_WIDTH 		= DATA_WIDTH * 4; //one cache line, one write request
localparam APP_MASK_WIDTH 		= APP_DATA_WIDTH / 8;

input clk;
input rst;

//System Network Interface
input [FLIT_SIZE-1:0] flit_in;
input flit_in_val;
output flit_in_rdy;

output [FLIT_SIZE] flit_out;
output flit_out_val;
input  flit_out_rdy;

//MC User Interface
input                       app_rdy;
input                       app_wdf_rdy;
input [APP_DATA_WIDTH-1:0]  app_rd_data;
input                       app_rd_data_end;
input                       app_rd_data_valid;
input                       phy_init_done;

output                      app_wdf_wren;
output [APP_DATA_WIDTH-1:0] app_wdf_data;
output [APP_MASK_WIDTH-1:0] app_wdf_mask;
output                      app_wdf_end;
output [ADDR_WIDTH-1:0]     app_addr;
output                      app_en;
output [2:0]                app_cmd;

// global buffers
reg [FLIT_SIZE-1:0]           pkt_head_buf  [IN_FLIGHT_LIMIT-1:0];
reg [FLT_ADDR_SIZE-1:0]       pkt_addr_buf  [IN_FLIGHT_LIMIT-1:0];
reg [(APP_DATA_WIDTH*2)-1:0]  pkt_data_buf  [IN_FLIGHT_LIMIT-1:0];
reg [FLT_CMD_LEN-1:0]         pkt_cmd_buf   [IN_FLIGHT_LIMIT-1:0];
reg [2:0]                     pkt_state_buf [IN_FLIGHT_LIMIT-1:0];

//*******************************************************
// ACCEPT PACKETS
//*******************************************************
reg [BUFFER_ADDR_SIZE-1:0] buf_current_in;
reg [BUFFER_ADDR_SIZE-1:0] buf_current_out;
reg [FLT_LENGTH_LEN-1:0] 	remaining_flits;
reg [2:0]									state;
reg [FLIT_SIZE-1:0]       accept_data_buffer[MAX_PKT_LEN-2:0];

wire [2:0] dbg_state_in = pkt_state_buf[buf_current_in];
wire [2:0] dbg_state_0 = pkt_state_buf[0];
wire [2:0] dbg_state_1 = pkt_state_buf[1];
wire [2:0] dbg_state_2 = pkt_state_buf[2];
wire [2:0] dbg_state_3 = pkt_state_buf[3];
wire [2:0] dbg_state_4 = pkt_state_buf[4];
wire dbg_in_write = (pkt_cmd_buf[buf_current_in] == WRITE_CMD);
wire dbg_in_read = (pkt_cmd_buf[buf_current_in] == READ_CMD &&
                   buf_current_in+4'd1 != buf_current_out);

assign flit_in_rdy  = (state != `STALLED && !rst && phy_init_done);

reg[90:0] counter;
always@(posedge clk) begin
  if(rst || !phy_init_done) 
    counter = 0;
  else
    counter = counter+1;
end

always @(posedge clk) begin
  if(rst || !phy_init_done) begin
    buf_current_in = 0;
    remaining_flits = 0;
    state = `ACCEPT_HEAD;
    for(int i=0; i < IN_FLIGHT_LIMIT; i=i+1) begin
    pkt_head_buf  [i] = 0;
    pkt_addr_buf  [i] = 0;
    pkt_data_buf  [i] = 0;
    pkt_cmd_buf   [i] = 0;
    pkt_state_buf [i] = 5;
    end
  end
  else begin
    if(flit_in_val && flit_in_rdy) begin  
      case (state)
        //############## Accepting Head Flit ###################
        `ACCEPT_HEAD: begin //accept relevant parameters from head
          pkt_state_buf[buf_current_in] = `FILLING;
          pkt_head_buf[buf_current_in] = flit_in;
          pkt_cmd_buf[buf_current_in] = flit_in[FLT_CMD_START:FLT_CMD_START-FLT_CMD_LEN+1];
          remaining_flits = flit_in[FLT_LENGTH_START:FLT_LENGTH_START-FLT_LENGTH_LEN+1]+1;
    			state       = `ACCEPT_ADDR;
        end

        //############## Accepting Addr Flit ###################
        `ACCEPT_ADDR: begin//accept address flit
          pkt_addr_buf[buf_current_in]	= flit_in[FLT_ADDR_START:FLT_ADDR_START-FLT_ADDR_SIZE+1];  
          remaining_flits = remaining_flits-1;
          if(pkt_cmd_buf[buf_current_in] == WRITE_CMD) begin //read command, advance to accepting data
  				  state          = `ACCEPT_DATA;
          end
          else if (pkt_cmd_buf[buf_current_in] == READ_CMD &&
                   buf_current_in+4'd1 != buf_current_out) 
          begin //read command there is space for next command
            state          = `ACCEPT_HEAD;
  					pkt_state_buf[buf_current_in] = `WAITING_CMD;
            buf_current_in = buf_current_in+1;
          end
          else if (buf_current_in+4'd1 == buf_current_out) begin
            state = `STALLED;
          end
        end

        //############## Accepting Data Flits ##################
        `ACCEPT_DATA: begin
          if(remaining_flits == 0 &&
            (buf_current_in+4'd1 != buf_current_out) ) begin
  					pkt_state_buf[buf_current_in] = `WAITING_WDF;
            pkt_data_buf[buf_current_in] = {accept_data_buffer[7],
                            accept_data_buffer[6],
                            accept_data_buffer[5],
                            accept_data_buffer[4],
                            accept_data_buffer[3],
                            accept_data_buffer[2],
                            accept_data_buffer[1],
                            accept_data_buffer[0]};
            buf_current_in = buf_current_in+1;
            state          = `ACCEPT_HEAD;
          end
					else if(remaining_flits == 0 &&
                   buf_current_in+4'd1 == buf_current_out ) begin
            state = `STALLED;
          end
          else begin
          accept_data_buffer[remaining_flits-1] = flit_in;
          remaining_flits = remaining_flits - 1;
          end
				end

        //#################### Stalled #######################
				`STALLED: begin
          if(pkt_cmd_buf[buf_current_in] == WRITE_CMD &&
            (buf_current_in+4'd1 != buf_current_out) ) begin
            pkt_state_buf[buf_current_in] = `WAITING_WDF;
            buf_current_in = buf_current_in+1;
            state          = `ACCEPT_HEAD;
          end
          else if (pkt_cmd_buf[buf_current_in] == READ_CMD &&
                    buf_current_in+4'd1 != buf_current_out) begin
            buf_current_in = buf_current_in+1;
            state          = `ACCEPT_HEAD;
          end
        end
      endcase
    end
  end
end
//*******************************************************
// MC DATA SEND
//*******************************************************
reg [BUFFER_ADDR_SIZE-1:0] buf_current_wdf;
reg buf_wdf_data_half;
reg r_app_wdf_wren;

wire [2:0] dbg_state_wdf = pkt_state_buf[buf_current_wdf];
wire [APP_DATA_WIDTH*2-1:0] dbg_data_wdf = pkt_data_buf[buf_current_wdf];

assign app_wdf_wren = r_app_wdf_wren;

assign app_wdf_data = (buf_wdf_data_half == `FIRST) 									?
											pkt_data_buf[buf_current_wdf][APP_DATA_WIDTH*2-1:APP_DATA_WIDTH]	:
											pkt_data_buf[buf_current_wdf][APP_DATA_WIDTH-1:0];
assign app_wdf_mask = 0;
assign app_wdf_end  = (buf_wdf_data_half == `SECOND);

always@(posedge clk) begin
  if(rst || !phy_init_done) begin
    buf_current_wdf = 0;
    buf_wdf_data_half = `FIRST;
    r_app_wdf_wren = 0;
  end
  else begin
		if(pkt_cmd_buf[buf_current_wdf] == READ_CMD &&
       pkt_state_buf[buf_current_wdf] != `INACTIVE) 
    begin  //no need to write data for read commands
      buf_current_wdf = buf_current_wdf + 1;
    end
    r_app_wdf_wren <= (pkt_state_buf[buf_current_wdf] == `WAITING_WDF) ? 1 : 0;
    if(app_wdf_wren && app_wdf_rdy)
      buf_wdf_data_half = ~buf_wdf_data_half;           //present first or second 32 bytes
			if(buf_wdf_data_half == `FIRST) begin
        pkt_state_buf[buf_current_wdf] = `WAITING_CMD;
        buf_current_wdf = buf_current_wdf + 1;
      end
  end
end

//*******************************************************
// MC CMD SEND
//*******************************************************
reg [BUFFER_ADDR_SIZE-1:0] buf_current_cmd;
reg r_app_en;

assign app_en = r_app_en;
assign app_addr = pkt_data_buf[buf_current_cmd];
assign app_cmd = (pkt_cmd_buf[buf_current_cmd] == WRITE_CMD) ? 3'b000 : 3'b001;

always @(posedge clk) begin
  if(rst || !phy_init_done) begin
    buf_current_cmd = 0;
    r_app_en = 0;
  end
  else begin
    if(pkt_state_buf[buf_current_cmd] == `WAITING_CMD) begin
      r_app_en <= 1;
    end

    if (app_en && app_rdy) begin
      r_app_en <= 0;
      if(pkt_cmd_buf[buf_current_cmd] == WRITE_CMD) begin
        pkt_state_buf[buf_current_cmd] = `READY;
      end
      else begin
        pkt_state_buf[buf_current_cmd] = `WAITING_DATA;
      end
      buf_current_cmd = buf_current_cmd+1;
    end
    
  end

end


//*******************************************************
// MC DATA RCV
//*******************************************************
reg [BUFFER_ADDR_SIZE-1:0] buf_current_data_rcv;

always @(posedge clk) begin
  if(rst || !phy_init_done) begin
    buf_current_data_rcv = 0;
  end
	else begin
		if( pkt_cmd_buf[buf_current_in] == WRITE_CMD && 
        pkt_state_buf[buf_current_data_rcv] != `INACTIVE) 
    begin //no need to receive data for write commands
      buf_current_data_rcv = buf_current_data_rcv+1;
    end
    if(app_rd_data_valid) begin
      if(!app_rd_data_end) begin
        pkt_data_buf[buf_current_data_rcv][APP_DATA_WIDTH-1:0] = app_rd_data;
        buf_current_data_rcv = buf_current_data_rcv+1;
      end
      else if (app_rd_data_end) begin
        pkt_data_buf[buf_current_data_rcv][APP_DATA_WIDTH*2-1:APP_DATA_WIDTH] = app_rd_data;
        pkt_state_buf[buf_current_data_rcv] = `READY;
        buf_current_data_rcv = buf_current_data_rcv+1;
      end
    end
  end

end


//*******************************************************
// SEND PACKETS
//*******************************************************
reg remaining_flt_out;
reg [FLIT_SIZE-1:0]   flit_out_buffer[MAX_PKT_LEN];

assign flit_out = flit_out_buffer[remaining_flt_out-1];
assign flit_out_val = (pkt_state_buf[buf_current_out] == `READY && 
                       remaining_flt_out != 0);

always @(posedge clk) begin
  if(rst || !phy_init_done) begin
    buf_current_out = 0;
    remaining_flt_out = 0;
    flit_out_buffer[0] = 64'h0;
    flit_out_buffer[1] = 64'h0;
    flit_out_buffer[2] = 64'h0;
    flit_out_buffer[3] = 64'h0;
    flit_out_buffer[4] = 64'h0;
    flit_out_buffer[5] = 64'h0;
    flit_out_buffer[6] = 64'h0;
    flit_out_buffer[7] = 64'h0;
    flit_out_buffer[8] = 64'h0;
    flit_out_buffer[9] = 64'h0;
  end
  else begin
    if(pkt_state_buf[buf_current_out] == `READY ) begin
      if (remaining_flt_out == 0) begin
        remaining_flt_out = pkt_head_buf[buf_current_out][FLT_LENGTH_START:FLT_LENGTH_START-FLT_LENGTH_LEN+1];
        //initialize flit_out 
        flit_out_buffer[remaining_flt_out-1] = pkt_head_buf[buf_current_out];
        flit_out_buffer[remaining_flt_out-2] = pkt_addr_buf[buf_current_out];
        if(pkt_cmd_buf[buf_current_out] == READ_CMD) begin 
	//				genvar index;
  //        generate
  //        for (index = 8; index > 0; index = index-1) begin:generate_data_fill
  //           flit_out_buffer[remaining_flt_out-(11-index)] = pkt_data_buf[buf_current_out][(index*FLIT_SIZE)-1:(index-1)*FLIT_SIZE];
  //        end
  //        endgenerate
          flit_out_buffer[remaining_flt_out-3] = pkt_data_buf[buf_current_out][(8*FLIT_SIZE)-1:(7)*FLIT_SIZE];
          flit_out_buffer[remaining_flt_out-4] = pkt_data_buf[buf_current_out][((7)*FLIT_SIZE)-1:(6)*FLIT_SIZE];
          flit_out_buffer[remaining_flt_out-5] = pkt_data_buf[buf_current_out][((6)*FLIT_SIZE)-1:(5)*FLIT_SIZE];
          flit_out_buffer[remaining_flt_out-6] = pkt_data_buf[buf_current_out][((5)*FLIT_SIZE)-1:(4)*FLIT_SIZE];
          flit_out_buffer[remaining_flt_out-7] = pkt_data_buf[buf_current_out][((4)*FLIT_SIZE)-1:(3)*FLIT_SIZE];
          flit_out_buffer[remaining_flt_out-8] = pkt_data_buf[buf_current_out][((3)*FLIT_SIZE)-1:(2)*FLIT_SIZE];
          flit_out_buffer[remaining_flt_out-9] = pkt_data_buf[buf_current_out][((2)*FLIT_SIZE)-1:(1)*FLIT_SIZE];
          flit_out_buffer[remaining_flt_out-10] = pkt_data_buf[buf_current_out][((1)*FLIT_SIZE)-1:(0)*FLIT_SIZE];
        end
      end
      else begin
        if(flit_out_rdy && flit_out_val) begin
          remaining_flt_out = remaining_flt_out-1;
        end
        if(remaining_flt_out == 0)
          pkt_state_buf[buf_current_out] = `INACTIVE;
          buf_current_out = buf_current_out+1;
        end
    end
  end


end

endmodule










