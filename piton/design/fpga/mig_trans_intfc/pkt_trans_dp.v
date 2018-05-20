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
  parameter MAX_PKT_LEN         = 11, //measured in flits
  parameter MAX_PKT_LEN_LOG     = 4,
  parameter ADDR_WIDTH     	    = 29, //size of addr to MC
  parameter MEMORY_WIDTH        = 8,
  parameter DATA_WIDTH     	    = 64,
  parameter LOC_ADDR_HI         = 45,
  parameter LOC_ADDR_LO         = 22,
  parameter LOC_ADDR_SIZE       = 23, //512 MB, addressed by 64 byte cache lines 
  
  parameter FLIT_SIZE           = 64, //Size of one flit
  
  parameter FLT_ADDR_HI         = 63,
  parameter FLT_ADDR_LO         = 16,
  parameter FLT_ADDR_SIZE       = 48,
  
  parameter FLT_CHIPID_HI       = 63,
  parameter FLT_CHIPID_LO       = 50,
  parameter FLT_CHIPID_SIZE     = 14,

  parameter FLT_XPOS_HI         =49, 
  parameter FLT_XPOS_LO         =42,
  parameter FLT_XPOS_SIZE       =8,
  
  parameter FLT_YPOS_HI         =41,
  parameter FLT_YPOS_LO         =34,
  parameter FLT_YPOS_SIZE       =8,
 
  parameter FLT_FBITS_HI        =33,
  parameter FLT_FBITS_LO        =30,
  parameter FLT_FBITS_SIZE      =4,
  
  parameter FLT_PAYLOADL_HI     =29,
  parameter FLT_PAYLOADL_LO     =22,
  parameter FLT_PAYLOADL_SIZE   =8,
    
  parameter FLT_MSG_TYPE_HI     =21,
  parameter FLT_MSG_TYPE_LO     =14,
  parameter FLT_MSG_TYPE_SIZE   =8,
    
  parameter FLT_TAG_HI          =13,
  parameter FLT_TAG_LO          =6,
  parameter FLT_TAG_SIZE        =8,
   
  parameter FLT_OPT_HI          =15,
  parameter FLT_OPT_LO          =0,
  parameter FLT_OPT_SIZE        =16,
   
  parameter FLT_SRC_CHIPID_HI   =63,
  parameter FLT_SRC_CHIPID_LO   =50,
  parameter FLT_SRC_CHIPID_SIZE =14,
     
  parameter FLT_SRC_XPOS_HI        =49,
  parameter FLT_SRC_XPOS_LO        =42,
  parameter FLT_SRC_XPOS_SIZE      =8,
  
  parameter FLT_SRC_YPOS_HI        =41,
  parameter FLT_SRC_YPOS_LO        =34,
  parameter FLT_SRC_YPOS_SIZE      =8,
  
  parameter FLT_SRC_FBITS_HI    =33,
  parameter FLT_SRC_FBITS_LO    =30,
  parameter FLT_SRC_FBITS_SIZE  =4,

//message types
  parameter MSG_TYPE_NC_LOAD_REQ = 8'd14,
  parameter MSG_TYPE_NC_STORE_REQ = 8'd15,
  parameter MSG_TYPE_LOAD_MEM = 8'd19,
  parameter MSG_TYPE_STORE_MEM = 8'd20,

  parameter MSG_TYPE_NC_LOAD_MEM_ACK = 8'd26,
  parameter MSG_TYPE_NC_STORE_MEM_ACK = 8'd27,
  parameter MSG_TYPE_LOAD_MEM_ACK = 8'd24,
  parameter MSG_TYPE_STORE_MEM_ACK = 8'd25,
  
  parameter IN_FLIGHT_LIMIT   = 16, //number of commands the MC can have in flight
  parameter BUFFER_ADDR_SIZE  = 4 //(log_2(IN_FLIGHT_LIMIT)+1)
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

//packet parser states
`define ACCEPT_W1   0
`define ACCEPT_W2   1
`define ACCEPT_W3   2
`define ACCEPT_DATA 3
`define STALLED     4

//buffer item states
`define FILLING      0
`define WAITING_WDF  1
`define WAITING_CMD  2
`define WAITING_DATA 3
`define READY        4
`define INACTIVE     5


`define FIRST       0
`define SECOND      1

`define ADDR_ONE {{BUFFER_ADDR_SIZE-1{1'b0}}, {1'b1}}

localparam APP_DATA_WIDTH 		= DATA_WIDTH * 4; //one cache line, one write request
localparam APP_MASK_WIDTH 		= APP_DATA_WIDTH / 8;

input clk;
input rst;

//System Network Interface
input  [FLIT_SIZE-1:0] flit_in;
input  flit_in_val;
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
reg [FLIT_SIZE-1:0]           pkt_w1        [IN_FLIGHT_LIMIT-1:0];
reg [FLIT_SIZE-1:0]           pkt_w2        [IN_FLIGHT_LIMIT-1:0];
reg [FLIT_SIZE-1:0]           pkt_w3        [IN_FLIGHT_LIMIT-1:0]; 
reg [(APP_DATA_WIDTH*2)-1:0]  pkt_data_buf  [IN_FLIGHT_LIMIT-1:0];
reg [2:0]                     pkt_state_buf [IN_FLIGHT_LIMIT-1:0];
reg [FLT_MSG_TYPE_SIZE-1:0]   pkt_cmd_buf   [IN_FLIGHT_LIMIT-1:0];

//*******************************************************
// ACCEPT PACKETS
//*******************************************************
reg [FLIT_SIZE-1:0]         in_data_buf[MAX_PKT_LEN-4:0]; //buffer for incomming packets
reg [BUFFER_ADDR_SIZE-1:0]  buf_current_in;  //address of buffer slot being filled
reg [BUFFER_ADDR_SIZE-1:0]  buf_current_out; //address of buffer slot being sent
reg [MAX_PKT_LEN_LOG-1:0]   remaining_flits; //flits remaining in current packet
reg [2:0]                   acc_state;

//debug signals
wire [2:0] dbg_state_in = pkt_state_buf[buf_current_in];
wire [2:0] dbg_state_0 = pkt_state_buf[0];
wire [2:0] dbg_state_1 = pkt_state_buf[1];
wire [2:0] dbg_state_2 = pkt_state_buf[2];
wire [2:0] dbg_state_3 = pkt_state_buf[3];
wire [2:0] dbg_state_4 = pkt_state_buf[4];
wire [2:0] dbg_state_11 = pkt_state_buf[11];
wire [2:0] dbg_state_12 = pkt_state_buf[12];
wire [2:0] dbg_state_13 = pkt_state_buf[13];
wire [2:0] dbg_state_14 = pkt_state_buf[14];
wire [2:0] dbg_state_15 = pkt_state_buf[15];

wire [BUFFER_ADDR_SIZE-1:0] dbg_in_next = buf_current_in+`ADDR_ONE;

//assignments
assign flit_in_rdy  = (acc_state != `STALLED && !rst && phy_init_done);

always @(posedge clk) begin
    if(rst || !phy_init_done) begin
        //initialize buffer pointers
        buf_current_in <= 0;
        remaining_flits <= 0;
        acc_state = `ACCEPT_W1;
        //initialize all buffers to zero
        for(int i=0; i < IN_FLIGHT_LIMIT; i=i+1) begin
            pkt_w1        [i] <= 0;
            pkt_w2        [i] <= 0;
            pkt_w3        [i] <= 0;
            pkt_data_buf  [i] <= 0;
            pkt_cmd_buf   [i] <= 0;
            pkt_state_buf [i] <= `INACTIVE; //initialize state to inactive
        end
        for(int i=0; i < MAX_PKT_LEN-3; i++) begin
            in_data_buf[i] <= 0;
        end
    end
    else begin
        if(flit_in_val) begin  
            case (acc_state) //determine which word of the packet we are accepting
            //############## Accepting Head Flit ###################
            `ACCEPT_W1: begin 
                pkt_state_buf [buf_current_in] <= `FILLING;
                pkt_w1        [buf_current_in] <= flit_in;
                pkt_cmd_buf   [buf_current_in] <= flit_in[FLT_MSG_TYPE_HI: FLT_MSG_TYPE_LO];
                remaining_flits <= flit_in[FLT_PAYLOADL_HI:FLT_PAYLOADL_LO]-1;
                acc_state       <= `ACCEPT_W2;
            end

            //############## Accepting Addr Flit ###################
            `ACCEPT_W2: begin
                pkt_w2        [buf_current_in] <= flit_in;  
                remaining_flits <= remaining_flits-1;
                acc_state <= `ACCEPT_W3;
            end
            //############## Accepting Src Flits ##################
            `ACCEPT_W3: begin
                pkt_w3        [buf_current_in] <= flit_in;
                
                if(remaining_flits == 0) begin //read command
                    //check if we can start accepting the next command
                    if(buf_current_in+`ADDR_ONE == buf_current_out) begin
                        buf_current_in <= buf_current_in + 1;
                        pkt_state_buf[buf_current_in] <= `WAITING_CMD;
                        acc_state <= `STALLED;
                    end
                    else begin
                        buf_current_in <= buf_current_in + 1;
                        pkt_state_buf[buf_current_in] <= `WAITING_CMD;
                        acc_state <= `ACCEPT_W1;
                    end
                end
                else begin //write command
                    remaining_flits <= remaining_flits-1;
                    acc_state <= `ACCEPT_DATA;
                end
            end
            //############## Accepting Data Flits ##################
            `ACCEPT_DATA: begin
                in_data_buf[remaining_flits] <= flit_in;
                remaining_flits <= remaining_flits - 1;
                //check if we are done accepting flits
                if((remaining_flits == 0)) begin
                    buf_current_in <= buf_current_in+1;
                    pkt_state_buf[buf_current_in] <= `WAITING_WDF;
                    //TODO: this should be done parametrically
                    pkt_data_buf[buf_current_in] <= {in_data_buf[0],
                                                     in_data_buf[1],
                                                     in_data_buf[2],
                                                     in_data_buf[3],
                                                     in_data_buf[4],
                                                     in_data_buf[5],
                                                     in_data_buf[6],
                                                     in_data_buf[7]};
                    //we are ready for the next command
                    if (buf_current_in+`ADDR_ONE != buf_current_out) begin	
                        acc_state <= `ACCEPT_W1;
                    end
                    else begin
                        acc_state <= `STALLED;
                    end
                end
            end
            //#################### Stalled #######################
            `STALLED: begin //waiting for buffer space to be freed
                if(buf_current_in != buf_current_out) begin
                    pkt_state_buf[buf_current_in] <= `FILLING;
                    acc_state <= `ACCEPT_W1;
                end
            end
      endcase
    end
  end
end

//*******************************************************
// MC DATA SEND
//*******************************************************
reg [BUFFER_ADDR_SIZE-1:0] buf_current_wdf; //tracks the current data sender to MC
reg buf_wdf_data_half;  //which half of the data we are writing;
reg r_app_wdf_wren;     //write_enable

wire [2:0] dbg_state_wdf = pkt_state_buf[buf_current_wdf];
wire [APP_DATA_WIDTH*2-1:0] dbg_data_wdf = pkt_data_buf[buf_current_wdf];

assign app_wdf_wren = (pkt_state_buf[buf_current_wdf] == `WAITING_WDF) ? 1 : 0;

assign app_wdf_data = (buf_wdf_data_half == `FIRST) 									?
											pkt_data_buf[buf_current_wdf][APP_DATA_WIDTH*2-1:APP_DATA_WIDTH]	:
											pkt_data_buf[buf_current_wdf][APP_DATA_WIDTH-1:0];
assign app_wdf_mask = 0;
assign app_wdf_end  = (buf_wdf_data_half == `SECOND);

always@(posedge clk) begin
  if(rst || !phy_init_done) begin
    buf_current_wdf <= 0;
    buf_wdf_data_half <= `FIRST;
    r_app_wdf_wren <= 0;
  end
  else begin
    if( (pkt_cmd_buf[buf_current_wdf] == MSG_TYPE_NC_LOAD_REQ || 
         pkt_cmd_buf[buf_current_wdf] == MSG_TYPE_LOAD_MEM) && 
        (pkt_state_buf[buf_current_wdf] != `INACTIVE) ) 
    begin  //no need to write data for read commands
      buf_current_wdf <= buf_current_wdf + 1;
    end
    r_app_wdf_wren <= (pkt_state_buf[buf_current_wdf] == `WAITING_WDF) ? 1 : 0;
    if(app_wdf_wren && app_wdf_rdy) begin
      buf_wdf_data_half <= ~buf_wdf_data_half;           //present first or second 32 bytes
			if(buf_wdf_data_half == `SECOND) begin
        pkt_state_buf[buf_current_wdf] <= `WAITING_CMD;
        buf_current_wdf <= buf_current_wdf + 1;
      end
    end
  end
end

//*******************************************************
// MC CMD SEND
//*******************************************************
reg [BUFFER_ADDR_SIZE-1:0] buf_current_cmd; //tracks current command sender to MC
reg r_app_en;                               //command enable

assign app_en = r_app_en;
assign app_addr = pkt_w2[buf_current_cmd][LOC_ADDR_HI: LOC_ADDR_LO];
assign app_cmd = (pkt_cmd_buf[buf_current_cmd] == MSG_TYPE_NC_STORE_REQ ||
                  pkt_cmd_buf[buf_current_cmd] == MSG_TYPE_STORE_MEM) ? 3'b000 : 3'b001;

always @(posedge clk) begin
  if(rst || !phy_init_done) begin
    buf_current_cmd <= 0;
    r_app_en <= 0;
  end
  else begin
    if(pkt_state_buf[buf_current_cmd] == `WAITING_CMD) begin
      r_app_en <= 1;
    end

    if (app_en && app_rdy) begin
      r_app_en <= 0;
      if(pkt_cmd_buf[buf_current_cmd] == MSG_TYPE_NC_STORE_REQ || 
          pkt_cmd_buf[buf_current_cmd] == MSG_TYPE_STORE_MEM) begin
        pkt_state_buf[buf_current_cmd] <= `READY;
      end
      else begin
        pkt_state_buf[buf_current_cmd] <= `WAITING_DATA;
      end
      buf_current_cmd <= buf_current_cmd+1;
    end
    
  end

end


//*******************************************************
// MC DATA RCV
//*******************************************************
reg [BUFFER_ADDR_SIZE-1:0] buf_current_data_rcv;
wire [FLT_MSG_TYPE_SIZE-1:0] dbg_read_data_cmd = pkt_cmd_buf[buf_current_data_rcv];

//debug commands
wire [FLT_MSG_TYPE_SIZE-1:0] dbg_cmd_0 = pkt_cmd_buf[0];
wire [FLT_MSG_TYPE_SIZE-1:0] dbg_cmd_1 = pkt_cmd_buf[1];
wire [FLT_MSG_TYPE_SIZE-1:0] dbg_cmd_2 = pkt_cmd_buf[2];
wire [FLT_MSG_TYPE_SIZE-1:0] dbg_cmd_3 = pkt_cmd_buf[3];
wire [FLT_MSG_TYPE_SIZE-1:0] dbg_cmd_4 = pkt_cmd_buf[4];

always @(posedge clk) begin
    if(rst || !phy_init_done) begin
        buf_current_data_rcv <= 0;
    end
	else begin
		if( (pkt_cmd_buf[buf_current_data_rcv] == MSG_TYPE_NC_STORE_REQ || 
             pkt_cmd_buf[buf_current_data_rcv] == MSG_TYPE_STORE_MEM) && 
            (pkt_state_buf[buf_current_data_rcv][2:0] != `INACTIVE)) 
    begin //no need to receive data for write commands
      buf_current_data_rcv <= buf_current_data_rcv+1;
    end

    if(app_rd_data_valid) begin //TODO: must ensure that we can always write to the next read command
      if(!app_rd_data_end) begin
        pkt_data_buf[buf_current_data_rcv][APP_DATA_WIDTH-1:0] <= app_rd_data;
      end
      else if (app_rd_data_end) begin
        pkt_data_buf[buf_current_data_rcv][APP_DATA_WIDTH*2-1:APP_DATA_WIDTH] <= app_rd_data;
        pkt_state_buf[buf_current_data_rcv] <= `READY;
        buf_current_data_rcv <= buf_current_data_rcv+1;
      end
    end
  end
end


//*******************************************************
// SEND PACKETS
//*******************************************************
reg [MAX_PKT_LEN_LOG-1:0]   remaining_flt_out;
reg [FLIT_SIZE-1:0]         flit_out_buffer[MAX_PKT_LEN];

assign flit_out = flit_out_buffer[remaining_flt_out];
assign flit_out_val = pkt_state_buf[buf_current_out] == `READY;


wire [FLT_MSG_TYPE_SIZE-1:0] dbg_current_cmd_0 = pkt_cmd_buf[0];
wire [FLT_MSG_TYPE_SIZE-1:0] dbg_current_cmd_1 = pkt_cmd_buf[1];
wire [FLT_MSG_TYPE_SIZE-1:0] dbg_current_cmd_2 = pkt_cmd_buf[2];
wire [FLT_MSG_TYPE_SIZE-1:0] dbg_current_cmd_3 = pkt_cmd_buf[3];
wire [FLT_MSG_TYPE_SIZE-1:0] dbg_current_cmd_4 = pkt_cmd_buf[4];
wire [FLT_MSG_TYPE_SIZE-1:0] dbg_current_cmd_5 = pkt_cmd_buf[5];
wire [FLT_MSG_TYPE_SIZE-1:0] dbg_current_cmd_6 = pkt_cmd_buf[6];
wire [FLT_MSG_TYPE_SIZE-1:0] dbg_current_cmd_7 = pkt_cmd_buf[7];
wire [FLT_MSG_TYPE_SIZE-1:0] dbg_current_cmd_8 = pkt_cmd_buf[8];
wire [FLT_MSG_TYPE_SIZE-1:0] dbg_current_cmd_9 = pkt_cmd_buf[9];
wire [FLT_MSG_TYPE_SIZE-1:0] dbg_current_cmd_10 = pkt_cmd_buf[10];
wire [FLT_MSG_TYPE_SIZE-1:0] dbg_current_cmd_11 = pkt_cmd_buf[11];
wire [FLT_MSG_TYPE_SIZE-1:0] dbg_current_cmd_12 = pkt_cmd_buf[12];
wire [FLT_MSG_TYPE_SIZE-1:0] dbg_current_cmd_13 = pkt_cmd_buf[13];
wire [FLT_MSG_TYPE_SIZE-1:0] dbg_current_cmd_14 = pkt_cmd_buf[14];
wire [FLT_MSG_TYPE_SIZE-1:0] dbg_current_cmd_15 = pkt_cmd_buf[15];

always @(posedge clk) begin
  if(rst || !phy_init_done) begin
    buf_current_out <= IN_FLIGHT_LIMIT-1; //initialize current out
    remaining_flt_out <= 0;
    for(int i=0; i < MAX_PKT_LEN; i=i+1) begin
        flit_out_buffer[i] <= 64'h0;
    end
  end
  else begin
    if(pkt_state_buf[buf_current_out] == `READY ||
       pkt_state_buf[buf_current_out] == `INACTIVE ) begin
      if (remaining_flt_out == 0) begin
        //deactivate current buffer entry
        pkt_state_buf[buf_current_out] <= `INACTIVE;
        //load next buffer entry if it is ready
        if(pkt_state_buf[buf_current_out+`ADDR_ONE] == `READY ) begin
            buf_current_out <= buf_current_out+`ADDR_ONE;

            //load response - data is attached
            if( pkt_cmd_buf[buf_current_out+`ADDR_ONE] == MSG_TYPE_NC_LOAD_REQ || 
                pkt_cmd_buf[buf_current_out+`ADDR_ONE] == MSG_TYPE_LOAD_MEM
                ) begin 
                remaining_flt_out <= MAX_PKT_LEN-2;

                //initialize flit_out header
                flit_out_buffer[MAX_PKT_LEN-2][FLT_CHIPID_HI:FLT_CHIPID_LO] <= pkt_w1[buf_current_out+`ADDR_ONE][FLT_SRC_CHIPID_HI:FLT_SRC_CHIPID_LO];
                flit_out_buffer[MAX_PKT_LEN-2][FLT_XPOS_HI  :FLT_XPOS_LO  ] <= pkt_w3[buf_current_out+`ADDR_ONE][FLT_SRC_XPOS_HI  :FLT_SRC_XPOS_LO  ];
                flit_out_buffer[MAX_PKT_LEN-2][FLT_YPOS_HI  :FLT_YPOS_LO  ] <= pkt_w3[buf_current_out+`ADDR_ONE][FLT_SRC_YPOS_HI  :FLT_SRC_YPOS_LO  ];
                flit_out_buffer[MAX_PKT_LEN-2][FLT_FBITS_HI :FLT_FBITS_LO ] <= pkt_w3[buf_current_out+`ADDR_ONE][FLT_SRC_FBITS_HI :FLT_SRC_FBITS_LO ];
                flit_out_buffer[MAX_PKT_LEN-2][FLT_TAG_HI   :FLT_TAG_LO   ] <= pkt_w1[buf_current_out+`ADDR_ONE][FLT_TAG_HI       :FLT_TAG_LO       ];
                flit_out_buffer[MAX_PKT_LEN-2][FLT_PAYLOADL_HI:FLT_PAYLOADL_LO] = MAX_PKT_LEN-3;

                //determine return message type
                if(pkt_cmd_buf[buf_current_out+`ADDR_ONE] == MSG_TYPE_NC_LOAD_REQ) begin
                    flit_out_buffer[MAX_PKT_LEN-2][FLT_MSG_TYPE_HI:FLT_MSG_TYPE_LO] =MSG_TYPE_NC_LOAD_MEM_ACK;
                end
                if(pkt_cmd_buf[buf_current_out+`ADDR_ONE] == MSG_TYPE_NC_STORE_REQ) begin
                    flit_out_buffer[MAX_PKT_LEN-2][FLT_MSG_TYPE_HI:FLT_MSG_TYPE_LO] =MSG_TYPE_NC_STORE_MEM_ACK;
                end
        
                //initialize return data
                //TODO: this should be done genericly
                flit_out_buffer[MAX_PKT_LEN-3] <= pkt_data_buf[buf_current_out+`ADDR_ONE][((8)*FLIT_SIZE)-1:(7)*FLIT_SIZE];
                flit_out_buffer[MAX_PKT_LEN-4] <= pkt_data_buf[buf_current_out+`ADDR_ONE][((7)*FLIT_SIZE)-1:(6)*FLIT_SIZE];
                flit_out_buffer[MAX_PKT_LEN-5] <= pkt_data_buf[buf_current_out+`ADDR_ONE][((6)*FLIT_SIZE)-1:(5)*FLIT_SIZE];
                flit_out_buffer[MAX_PKT_LEN-6] <= pkt_data_buf[buf_current_out+`ADDR_ONE][((5)*FLIT_SIZE)-1:(4)*FLIT_SIZE];
                flit_out_buffer[MAX_PKT_LEN-7] <= pkt_data_buf[buf_current_out+`ADDR_ONE][((4)*FLIT_SIZE)-1:(3)*FLIT_SIZE];
                flit_out_buffer[MAX_PKT_LEN-8] <= pkt_data_buf[buf_current_out+`ADDR_ONE][((3)*FLIT_SIZE)-1:(2)*FLIT_SIZE];
                flit_out_buffer[MAX_PKT_LEN-9] <= pkt_data_buf[buf_current_out+`ADDR_ONE][((2)*FLIT_SIZE)-1:(1)*FLIT_SIZE];
                flit_out_buffer[MAX_PKT_LEN-10]<= pkt_data_buf[buf_current_out+`ADDR_ONE][((1)*FLIT_SIZE)-1:(0)*FLIT_SIZE];
            end
            else begin //store command
                flit_out_buffer[remaining_flt_out+1][FLT_PAYLOADL_HI:FLT_PAYLOADL_LO] = 0; //no data to return
                remaining_flt_out <= 0;

                flit_out_buffer[0][FLT_CHIPID_HI:FLT_CHIPID_LO] <= pkt_w1[buf_current_out+`ADDR_ONE][FLT_SRC_CHIPID_HI:FLT_SRC_CHIPID_LO];
                flit_out_buffer[0][FLT_XPOS_HI  :FLT_XPOS_LO  ] <= pkt_w3[buf_current_out+`ADDR_ONE][FLT_SRC_XPOS_HI  :FLT_SRC_XPOS_LO  ];
                flit_out_buffer[0][FLT_YPOS_HI  :FLT_YPOS_LO  ] <= pkt_w3[buf_current_out+`ADDR_ONE][FLT_SRC_YPOS_HI  :FLT_SRC_YPOS_LO  ];
                flit_out_buffer[0][FLT_FBITS_HI :FLT_FBITS_LO ] <= pkt_w3[buf_current_out+`ADDR_ONE][FLT_SRC_FBITS_HI :FLT_SRC_FBITS_LO ];
                flit_out_buffer[0][FLT_TAG_HI   :FLT_TAG_LO   ] <= pkt_w1[buf_current_out+`ADDR_ONE][FLT_TAG_HI       :FLT_TAG_LO       ];

                if(pkt_cmd_buf[buf_current_out+`ADDR_ONE] == MSG_TYPE_LOAD_MEM) begin
                    flit_out_buffer[0][FLT_MSG_TYPE_HI:FLT_MSG_TYPE_LO] =MSG_TYPE_LOAD_MEM_ACK;
                end
                if(pkt_cmd_buf[buf_current_out+`ADDR_ONE] == MSG_TYPE_STORE_MEM) begin
                    flit_out_buffer[0][FLT_MSG_TYPE_HI:FLT_MSG_TYPE_LO] =MSG_TYPE_STORE_MEM_ACK;
                end


            end
         end
      end
      else begin
        if(flit_out_rdy && flit_out_val) begin
          remaining_flt_out <= remaining_flt_out-1;
        end
      end
    end
  end
end

endmodule

