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

module pkt_trans_dp # (
  parameter MAX_PKT_LEN                 = 11, //measured in flits
  parameter MAX_PKT_LEN_LOG             = 4,
  parameter ADDR_WIDTH                  = 28, //size of addr to MC
  parameter MEMORY_WIDTH                = 8,
  parameter DATA_WIDTH                  = 64,
  parameter APP_DATA_WIDTH              = DATA_WIDTH * 4,
  parameter APP_MASK_WIDTH              = APP_DATA_WIDTH / 8,
  parameter LOC_ADDR_HI                 = 45,
  parameter LOC_ADDR_LO                 = 22,
  parameter LOC_ADDR_SIZE               = 24, //512 MB, addressed by 64 byte cache lines 
  
  parameter FLIT_SIZE                   = 64, //Size of one flit
  
  parameter FLT_ADDR_HI                 = 63,
  parameter FLT_ADDR_LO                 = 16,
  parameter FLT_ADDR_SIZE               = 48,
  
  parameter FLT_CHIPID_HI               = 63,
  parameter FLT_CHIPID_LO               = 50,
  parameter FLT_CHIPID_SIZE             = 14,

  parameter FLT_XPOS_HI                 = 49, 
  parameter FLT_XPOS_LO                 = 42,
  parameter FLT_XPOS_SIZE               = 8,
  
  parameter FLT_YPOS_HI                 = 41,
  parameter FLT_YPOS_LO                 = 34,
  parameter FLT_YPOS_SIZE               = 8,
 
  parameter FLT_FBITS_HI                = 33,
  parameter FLT_FBITS_LO                = 30,
  parameter FLT_FBITS_SIZE              = 4,
  
  parameter FLT_PAYLOADL_HI             = 29,
  parameter FLT_PAYLOADL_LO             = 22,
  parameter FLT_PAYLOADL_SIZE           = 8,
    
  parameter FLT_MSG_TYPE_HI             = 21,
  parameter FLT_MSG_TYPE_LO             = 14,
  parameter FLT_MSG_TYPE_SIZE           = 8,
    
  parameter FLT_TAG_HI                  = 13,
  parameter FLT_TAG_LO                  = 6,
  parameter FLT_TAG_SIZE                = 8,
   
  parameter FLT_OPT_HI                  = 15,
  parameter FLT_OPT_LO                  = 0,
  parameter FLT_OPT_SIZE                = 16,
   
  parameter FLT_SRC_CHIPID_HI           = 63,
  parameter FLT_SRC_CHIPID_LO           = 50,
  parameter FLT_SRC_CHIPID_SIZE         = 14,
     
  parameter FLT_SRC_XPOS_HI             = 49,
  parameter FLT_SRC_XPOS_LO             = 42,
  parameter FLT_SRC_XPOS_SIZE           = 8,
  
  parameter FLT_SRC_YPOS_HI             = 41,
  parameter FLT_SRC_YPOS_LO             = 34,
  parameter FLT_SRC_YPOS_SIZE           = 8,
  
  parameter FLT_SRC_FBITS_HI            = 33,
  parameter FLT_SRC_FBITS_LO            = 30,
  parameter FLT_SRC_FBITS_SIZE          = 4,

//message types
  parameter MSG_TYPE_NC_LOAD_REQ        = 8'd14,
  parameter MSG_TYPE_NC_STORE_REQ       = 8'd15,
  parameter MSG_TYPE_LOAD_MEM           = 8'd19,
  parameter MSG_TYPE_STORE_MEM          = 8'd20,

  parameter MSG_TYPE_NC_LOAD_MEM_ACK    = 8'd26,
  parameter MSG_TYPE_NC_STORE_MEM_ACK   = 8'd27,
  parameter MSG_TYPE_LOAD_MEM_ACK       = 8'd24,
  parameter MSG_TYPE_STORE_MEM_ACK      = 8'd25,
  
  parameter IN_FLIGHT_LIMIT             = 16, //number of commands the MC can have in flight
  parameter BUFFER_ADDR_SIZE            = 4 //(log_2(IN_FLIGHT_LIMIT)+1)
)
(
  input                             clk,
  input                             rst,

  // System Network Interface
   input       [FLIT_SIZE-1:0]       flit_in,
   input                             flit_in_val,
   output                            flit_in_rdy,

   output      [FLIT_SIZE-1:0]       flit_out,
   output                            flit_out_val,
   input                             flit_out_rdy,

  // MIG User Interface
   input                             app_rdy,
   input                             app_wdf_rdy,
   input       [APP_DATA_WIDTH-1:0]  app_rd_data,
   input                             app_rd_data_end,
   input                             app_rd_data_valid,
   input                             phy_init_done,

   output reg                        app_wdf_wren_reg,
   output reg  [APP_DATA_WIDTH-1:0]  app_wdf_data_reg,
   output reg  [APP_MASK_WIDTH-1:0]  app_wdf_mask_reg,
   output reg                        app_wdf_end_reg,
   output reg  [ADDR_WIDTH-1:0]      app_addr_reg,
   output reg                        app_en_reg,
   output reg  [2:0]                 app_cmd_reg

);

integer i;

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
reg [FLIT_SIZE-1:0]           in_data_buf[MAX_PKT_LEN-4:0]; //buffer for incomming packets
reg [BUFFER_ADDR_SIZE-1:0]    buf_current_in;  //address of buffer slot being filled
reg [BUFFER_ADDR_SIZE-1:0]    buf_current_out; //address of buffer slot being sent
reg [MAX_PKT_LEN_LOG-1:0]     remaining_flits; //flits remaining in current packet
reg [2:0]                     acc_state;

// Alexey: moved all reg/wire declaration at the top
reg [BUFFER_ADDR_SIZE-1:0]    buf_current_cmd;  //tracks current command sender to MC
reg                           r_app_en;         //command enable

reg [BUFFER_ADDR_SIZE-1:0]    buf_current_data_rcv;

reg [MAX_PKT_LEN_LOG-1:0]     remaining_flt_out;
reg [FLIT_SIZE-1:0]           flit_out_buffer[MAX_PKT_LEN-1:0];

reg [BUFFER_ADDR_SIZE-1:0]    buf_current_wdf; //tracks the current data sender to MC
reg                           buf_wdf_data_half;  //which half of the data we are writing;
reg                           r_app_wdf_wren;     //write_enable

wire                        app_wdf_wren;
wire  [APP_DATA_WIDTH-1:0]  app_wdf_data;
wire  [APP_MASK_WIDTH-1:0]  app_wdf_mask;
wire                        app_wdf_end;
wire  [ADDR_WIDTH-1:0]      app_addr;
wire                        app_en;
wire  [2:0]                 app_cmd;

//assignments
assign flit_in_rdy  = (acc_state != `STALLED && !rst && phy_init_done);

always @(posedge clk) begin
  if(rst || !phy_init_done) begin
    //initialize buffer pointers
    buf_current_in <= 0;
    remaining_flits <= 0;
    acc_state = `ACCEPT_W1;
    //initialize all buffers to zero
    for(i=0; i < IN_FLIGHT_LIMIT; i=i+1) begin
      pkt_w1        [i] <= 0;
      pkt_w2        [i] <= 0;
      pkt_w3        [i] <= 0;
      // pkt_data_buf  [i] <= 0;
      pkt_cmd_buf   [i] <= 0;
      // pkt_state_buf [i] <= `INACTIVE; //initialize state to inactive
    end
    for(i=0; i < MAX_PKT_LEN-3; i = i + 1) begin
      in_data_buf[i] <= 0;
    end
  end
  else begin
    if(flit_in_val) begin
      // Alexey: potential bug: not full case statement
      case (acc_state) //determine which word of the packet we are accepting
      //############## Accepting Head Flit ###################
      `ACCEPT_W1: begin 
        // pkt_state_buf [buf_current_in] <= `FILLING;
        pkt_w1        [buf_current_in] <= flit_in;
        pkt_cmd_buf   [buf_current_in] <= flit_in[FLT_MSG_TYPE_HI: FLT_MSG_TYPE_LO];
        remaining_flits <= flit_in[FLT_PAYLOADL_HI:FLT_PAYLOADL_LO]-1;    // Alexey: when 0 flit is accepted
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
                // pkt_state_buf[buf_current_in] <= `WAITING_CMD;
                acc_state <= `STALLED;
            end
            else begin
                buf_current_in <= buf_current_in + 1;
                // pkt_state_buf[buf_current_in] <= `WAITING_CMD;
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
            // pkt_state_buf[buf_current_in] <= `WAITING_WDF;
            //TODO: this should be done parametrically
            // pkt_data_buf[buf_current_in] <= {flit_in,         // Alexey: bug fix
            //                                  in_data_buf[1],  // Bug: All <= are parallel
            //                                  in_data_buf[2],  // so the last data flit isn't sent to mem
            //                                  in_data_buf[3],  // ?? is in_data_buf required ?
            //                                  in_data_buf[4],
            //                                  in_data_buf[5],
            //                                  in_data_buf[6],
            //                                  in_data_buf[7]};
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
            // pkt_state_buf[buf_current_in] <= `FILLING;
            acc_state <= `ACCEPT_W1;
        end
      end

      default: begin
        // Alexey: empty
      end
      endcase
    end

    // if(app_rd_data_valid) begin
    //   if(!app_rd_data_end) begin
    //     pkt_data_buf[buf_current_data_rcv][APP_DATA_WIDTH-1:0] <= app_rd_data;
    //   end
    //   else begin
    //     pkt_data_buf[buf_current_data_rcv][APP_DATA_WIDTH*2-1:APP_DATA_WIDTH] <= app_rd_data;
    //   end
    // end
    
    // Alexey: pkt_state_buf definition moved at one always block
    // otherwise we get multiple drivers for a single reg
    // if(pkt_state_buf[buf_current_out] == `READY ||
    //    pkt_state_buf[buf_current_out] == `INACTIVE ) begin
    //   if (remaining_flt_out == 0) begin
    //     //deactivate current buffer entry
    //     pkt_state_buf[buf_current_out] <= `INACTIVE;
    //   end
    // end
    // else if(app_rd_data_valid) begin
    //   if (app_rd_data_end) begin
    //     pkt_state_buf[buf_current_data_rcv] <= `READY;
    //   end
    // end
    // else if (app_en && app_rdy) begin
    //   if(pkt_cmd_buf[buf_current_cmd] == MSG_TYPE_NC_STORE_REQ || 
    //       pkt_cmd_buf[buf_current_cmd] == MSG_TYPE_STORE_MEM) begin
    //     pkt_state_buf[buf_current_cmd] <= `READY;
    //   end
    //   else begin
    //     pkt_state_buf[buf_current_cmd] <= `WAITING_DATA;
    //   end
    // end
    // else if(app_wdf_wren && app_wdf_rdy) begin
    //   if(buf_wdf_data_half == `SECOND) begin
    //     pkt_state_buf[buf_current_wdf] <= `WAITING_CMD;
    //   end
    // end

  end
end


// Alexey
// dealing with mutlidriver problem
generate begin
  genvar ii;
  for (ii = 0; ii < IN_FLIGHT_LIMIT; ii = ii + 1) begin
    always @(posedge clk) begin
      if(rst || !phy_init_done) begin
        pkt_data_buf[ii]  <= {2*APP_DATA_WIDTH{1'b0}};
        pkt_state_buf[ii] <= `INACTIVE;
      end
      else begin
        pkt_data_buf[ii]  <= (ii == buf_current_in) & flit_in_val &
                             (acc_state == `ACCEPT_DATA) & (remaining_flits == 0) ? { flit_in, 
                                                                                      in_data_buf[1], 
                                                                                      in_data_buf[2],
                                                                                      in_data_buf[3],
                                                                                      in_data_buf[4],
                                                                                      in_data_buf[5],
                                                                                      in_data_buf[6],
                                                                                      in_data_buf[7]}   :
                              (ii == buf_current_data_rcv) & app_rd_data_valid    ?  ( ~app_rd_data_end ? {pkt_data_buf[ii][APP_DATA_WIDTH*2-1:APP_DATA_WIDTH], app_rd_data} :
                                                                                                          {app_rd_data, pkt_data_buf[ii][APP_DATA_WIDTH-1:0]}
                                                                                     )                  : 
                                                                                      pkt_data_buf[ii]  ;
        pkt_state_buf[ii] <= (ii == buf_current_in)   & 
                             flit_in_val                              ? ((acc_state == `ACCEPT_W1)                ?   `FILLING          :
                                                                         (acc_state == `ACCEPT_W3)   & 
                                                                         (remaining_flits == 0)                   ?   `WAITING_CMD      :
                                                                         (acc_state == `ACCEPT_DATA) &
                                                                         (remaining_flits == 0)                   ?   `WAITING_WDF      :
                                                                         (acc_state == `STALLED)     &
                                                                         (buf_current_in != buf_current_out)      ?   `FILLING          :
                                                                                                                  pkt_state_buf[ii]
                                                                         )                  :
                              (ii == buf_current_out)             & 
                              ((pkt_state_buf[ii] == `READY) |
                               (pkt_state_buf[ii] == `INACTIVE))  &
                              (remaining_flt_out == 0)                ?   `INACTIVE         :
                              (ii == buf_current_data_rcv)        &
                              app_rd_data_valid                   & 
                              app_rd_data_end                         ?   `READY            :
                              (ii == buf_current_cmd)             &
                              app_en & app_rdy                        ? ((pkt_cmd_buf[ii] == MSG_TYPE_NC_STORE_REQ) |
                                                                         (pkt_cmd_buf[ii] == MSG_TYPE_STORE_MEM) ?    `READY            :
                                                                                                                      `WAITING_DATA     
                                                                        )                   :
                              (ii == buf_current_wdf)             &
                              app_wdf_wren                        &
                              app_wdf_rdy                         &
                              (buf_wdf_data_half == `SECOND)          ?   `WAITING_CMD      :
                                                                          pkt_state_buf[ii] ;                                                            


      end
    end
  end
end
endgenerate


//*******************************************************
// MC DATA SEND
//*******************************************************

// Alexey: made app_* interface to be output from registers because of timing
always @(posedge clk) begin
  if (rst) begin
    app_wdf_wren_reg  <= 1'b0;
    app_wdf_data_reg  <= {APP_DATA_WIDTH{1'b0}};
    app_wdf_mask_reg  <= {APP_MASK_WIDTH{1'b0}};
    app_wdf_end_reg   <= 1'b0;
    app_en_reg        <= 1'b0;
    app_addr_reg      <= {ADDR_WIDTH{1'b0}};
    app_cmd_reg       <= {3{1'b0}};
  end else begin
    app_wdf_wren_reg  <= app_wdf_wren;
    app_wdf_data_reg  <= app_wdf_data;
    app_wdf_mask_reg  <= app_wdf_mask;
    app_wdf_end_reg   <= app_wdf_end;
    app_en_reg        <= app_en;
    app_addr_reg      <= app_addr;
    app_cmd_reg       <= app_cmd;
  end
end

assign app_wdf_wren  = (pkt_state_buf[buf_current_wdf] == `WAITING_WDF) ? 1'b1 : 1'b0;
assign app_wdf_data  = (buf_wdf_data_half == `FIRST)                                      ?   // Alexey: bug fix.
                        pkt_data_buf[buf_current_wdf][APP_DATA_WIDTH-1:0]                 :   // Changing of order of
                        pkt_data_buf[buf_current_wdf][APP_DATA_WIDTH*2-1:APP_DATA_WIDTH]  ;   // of CL halfs
assign app_wdf_mask  = {APP_MASK_WIDTH{1'b0}};
assign app_wdf_end   = (buf_wdf_data_half == `SECOND);
assign app_en        = r_app_en;
assign app_addr      = pkt_w2[buf_current_cmd][LOC_ADDR_HI: LOC_ADDR_LO] << 3;  // Alexey: bug fix. 512 = 64 * 8 = 64 * ( 1 << 3)
assign app_cmd       = (pkt_cmd_buf[buf_current_cmd] == MSG_TYPE_NC_STORE_REQ ||
                        pkt_cmd_buf[buf_current_cmd] == MSG_TYPE_STORE_MEM) ? 3'b000 : 3'b001;

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
        buf_current_wdf <= buf_current_wdf + 1;
      end
    end
  end
end

//*******************************************************
// MC CMD SEND
//*******************************************************

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
      buf_current_cmd <= buf_current_cmd+1;
    end
    
  end

end


//*******************************************************
// MC DATA RCV
//*******************************************************
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
      if (app_rd_data_end) begin
        buf_current_data_rcv <= buf_current_data_rcv+1;
      end
    end
  end
end


//*******************************************************
// SEND PACKETS
//*******************************************************
assign flit_out = flit_out_buffer[remaining_flt_out];
assign flit_out_val = (pkt_state_buf[buf_current_out] == `READY) & (remaining_flt_out > 0); // Alexey: buf fix


always @(posedge clk) begin
  if(rst || !phy_init_done) begin
    buf_current_out <= IN_FLIGHT_LIMIT-1; //initialize current out
    remaining_flt_out <= 0;
    for(i=0; i < MAX_PKT_LEN; i=i+1) begin
        flit_out_buffer[i] <= 64'h0;
    end
  end
  else begin
    if(pkt_state_buf[buf_current_out] == `READY ||
       pkt_state_buf[buf_current_out] == `INACTIVE ) begin
      if (remaining_flt_out == 0) begin
        //load next buffer entry if it is ready
        if(pkt_state_buf[buf_current_out+`ADDR_ONE] == `READY ) begin
            buf_current_out <= buf_current_out+`ADDR_ONE;

            //load response - data is attached
            if( pkt_cmd_buf[buf_current_out+`ADDR_ONE] == MSG_TYPE_NC_LOAD_REQ || 
                pkt_cmd_buf[buf_current_out+`ADDR_ONE] == MSG_TYPE_LOAD_MEM
                ) begin 
                remaining_flt_out <= MAX_PKT_LEN-2;   // Alexey: 9 downto 0

                //initialize flit_out header
                flit_out_buffer[MAX_PKT_LEN-2][FLT_CHIPID_HI:FLT_CHIPID_LO]     <= pkt_w1[buf_current_out+`ADDR_ONE][FLT_SRC_CHIPID_HI:FLT_SRC_CHIPID_LO];
                flit_out_buffer[MAX_PKT_LEN-2][FLT_XPOS_HI  :FLT_XPOS_LO  ]     <= pkt_w3[buf_current_out+`ADDR_ONE][FLT_SRC_XPOS_HI  :FLT_SRC_XPOS_LO  ];
                flit_out_buffer[MAX_PKT_LEN-2][FLT_YPOS_HI  :FLT_YPOS_LO  ]     <= pkt_w3[buf_current_out+`ADDR_ONE][FLT_SRC_YPOS_HI  :FLT_SRC_YPOS_LO  ];
                flit_out_buffer[MAX_PKT_LEN-2][FLT_FBITS_HI :FLT_FBITS_LO ]     <= pkt_w3[buf_current_out+`ADDR_ONE][FLT_SRC_FBITS_HI :FLT_SRC_FBITS_LO ];
                flit_out_buffer[MAX_PKT_LEN-2][FLT_TAG_HI   :FLT_TAG_LO   ]     <= pkt_w1[buf_current_out+`ADDR_ONE][FLT_TAG_HI       :FLT_TAG_LO       ];
                flit_out_buffer[MAX_PKT_LEN-2][FLT_PAYLOADL_HI:FLT_PAYLOADL_LO] <= MAX_PKT_LEN-3;    // Alexey: bug fix: removed nonblocking assignment

                //determine return message type
                if(pkt_cmd_buf[buf_current_out+`ADDR_ONE] == MSG_TYPE_NC_LOAD_REQ) begin
                  flit_out_buffer[MAX_PKT_LEN-2][FLT_MSG_TYPE_HI:FLT_MSG_TYPE_LO] <=  MSG_TYPE_NC_LOAD_MEM_ACK; // Alexey: bug fix: removed nonblocking assignment
                end
                if(pkt_cmd_buf[buf_current_out+`ADDR_ONE] == MSG_TYPE_LOAD_MEM) begin
                  flit_out_buffer[MAX_PKT_LEN-2][FLT_MSG_TYPE_HI:FLT_MSG_TYPE_LO] <=  MSG_TYPE_LOAD_MEM_ACK; // Alexey: bug fix: removed nonblocking assignment
                end // Alexey: bug fix. Bug: write response instead of read
        
                //initialize return data
                //TODO: this should be done genericly
                flit_out_buffer[MAX_PKT_LEN-10] <= pkt_data_buf[buf_current_out+`ADDR_ONE][((8)*FLIT_SIZE)-1:(7)*FLIT_SIZE];
                flit_out_buffer[MAX_PKT_LEN-9]  <= pkt_data_buf[buf_current_out+`ADDR_ONE][((7)*FLIT_SIZE)-1:(6)*FLIT_SIZE];
                flit_out_buffer[MAX_PKT_LEN-8]  <= pkt_data_buf[buf_current_out+`ADDR_ONE][((6)*FLIT_SIZE)-1:(5)*FLIT_SIZE];
                flit_out_buffer[MAX_PKT_LEN-7]  <= pkt_data_buf[buf_current_out+`ADDR_ONE][((5)*FLIT_SIZE)-1:(4)*FLIT_SIZE];
                flit_out_buffer[MAX_PKT_LEN-6]  <= pkt_data_buf[buf_current_out+`ADDR_ONE][((4)*FLIT_SIZE)-1:(3)*FLIT_SIZE];
                flit_out_buffer[MAX_PKT_LEN-5]  <= pkt_data_buf[buf_current_out+`ADDR_ONE][((3)*FLIT_SIZE)-1:(2)*FLIT_SIZE];
                flit_out_buffer[MAX_PKT_LEN-4]  <= pkt_data_buf[buf_current_out+`ADDR_ONE][((2)*FLIT_SIZE)-1:(1)*FLIT_SIZE];
                flit_out_buffer[MAX_PKT_LEN-3]  <= pkt_data_buf[buf_current_out+`ADDR_ONE][((1)*FLIT_SIZE)-1:(0)*FLIT_SIZE];
            end
            else begin //store command
                flit_out_buffer[remaining_flt_out+1][FLT_PAYLOADL_HI:FLT_PAYLOADL_LO] <= 0; //no data to return
                remaining_flt_out <= 0;

                flit_out_buffer[0][FLT_CHIPID_HI:FLT_CHIPID_LO] <= pkt_w1[buf_current_out+`ADDR_ONE][FLT_SRC_CHIPID_HI:FLT_SRC_CHIPID_LO];
                flit_out_buffer[0][FLT_XPOS_HI  :FLT_XPOS_LO  ] <= pkt_w3[buf_current_out+`ADDR_ONE][FLT_SRC_XPOS_HI  :FLT_SRC_XPOS_LO  ];
                flit_out_buffer[0][FLT_YPOS_HI  :FLT_YPOS_LO  ] <= pkt_w3[buf_current_out+`ADDR_ONE][FLT_SRC_YPOS_HI  :FLT_SRC_YPOS_LO  ];
                flit_out_buffer[0][FLT_FBITS_HI :FLT_FBITS_LO ] <= pkt_w3[buf_current_out+`ADDR_ONE][FLT_SRC_FBITS_HI :FLT_SRC_FBITS_LO ];
                flit_out_buffer[0][FLT_TAG_HI   :FLT_TAG_LO   ] <= pkt_w1[buf_current_out+`ADDR_ONE][FLT_TAG_HI       :FLT_TAG_LO       ];

                if(pkt_cmd_buf[buf_current_out+`ADDR_ONE] == MSG_TYPE_NC_STORE_REQ) begin
                  flit_out_buffer[0][FLT_MSG_TYPE_HI:FLT_MSG_TYPE_LO] <=  MSG_TYPE_NC_STORE_MEM_ACK; // Alexey: bug fix: removed nonblocking assignment
                end
                if(pkt_cmd_buf[buf_current_out+`ADDR_ONE] == MSG_TYPE_STORE_MEM) begin
                  flit_out_buffer[0][FLT_MSG_TYPE_HI:FLT_MSG_TYPE_LO] <=  MSG_TYPE_STORE_MEM_ACK; // Alexey: bug fix: removed nonblocking assignment
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

