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

`include "mc_define.h"
`include "define.tmp.h"
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

module noc_mig_bridge # (
  parameter MIG_APP_ADDR_WIDTH          = 28,
  parameter MIG_APP_DATA_WIDTH          = 128, // value for a generated MIG, which varies for different FPGAs
  parameter MIG_APP_MASK_WIDTH          = MIG_APP_DATA_WIDTH / 8,

  parameter IN_FLIGHT_LIMIT             = 16, //number of commands the MC can have in flight
  parameter BUFFER_ADDR_SIZE            = 4 //(log_2(IN_FLIGHT_LIMIT)+1)
)
(
  input                             clk,
  input                             rst,

   // Need to do some translation if uart boot is enabled
   input                                uart_boot_en,

  // System Network Interface
   input       [`NOC_DATA_WIDTH-1:0]           flit_in,
   input                                 flit_in_val,
   output                                flit_in_rdy,

   output      [`NOC_DATA_WIDTH-1:0]           flit_out,
   output                                flit_out_val,
   input                                 flit_out_rdy,

  // MIG User Interface
   input                                 app_rdy,
   input                                 app_wdf_rdy,
   input       [MIG_APP_DATA_WIDTH-1:0]  app_rd_data,
   input                                 app_rd_data_end,
   input                                 app_rd_data_valid,
   input                                 phy_init_done,

   output reg                            app_wdf_wren_reg,
   output      [MIG_APP_DATA_WIDTH-1:0]  app_wdf_data_out,
   output      [MIG_APP_MASK_WIDTH-1:0]  app_wdf_mask_out,
   output                                app_wdf_end_out,
   output      [MIG_APP_ADDR_WIDTH-1:0]  app_addr_out,
   output reg                            app_en_reg,
   output reg  [2:0]                     app_cmd_reg

);

localparam CL_ADDR_WIDTH = `PHY_ADDR_WIDTH - 6;
localparam APP_DATA_WIDTH              = 512; // data width in noc
localparam APP_MASK_WIDTH              = APP_DATA_WIDTH / 8;   // byte mask
localparam MAX_PKT_LEN                 = 11; // measured in flits
localparam MAX_PKT_LEN_LOG             = clogb2(MAX_PKT_LEN);
localparam LOC_ADDR_HI                 = `MSG_ADDR_HI_;
localparam LOC_ADDR_LO                 = `MSG_ADDR_LO_ + 6;
localparam RATIO        = APP_DATA_WIDTH / MIG_APP_DATA_WIDTH;  // must be a power of 2!
localparam RATIO_WIDTH  = clogb2(RATIO);
localparam WORD_SIZE_LOG = clogb2(`WORD_SIZE);



integer i;

// global buffers
reg [`NOC_DATA_WIDTH-1:0]           pkt_w1        [IN_FLIGHT_LIMIT-1:0];
reg [`NOC_DATA_WIDTH-1:0]           pkt_w2        [IN_FLIGHT_LIMIT-1:0];
reg [`NOC_DATA_WIDTH-1:0]           pkt_w3        [IN_FLIGHT_LIMIT-1:0]; 
reg [APP_DATA_WIDTH-1:0]  pkt_data_buf  [IN_FLIGHT_LIMIT-1:0];
 reg [2:0]                     pkt_state_buf [IN_FLIGHT_LIMIT-1:0];
 reg [`MSG_TYPE_WIDTH-1:0]   pkt_cmd_buf   [IN_FLIGHT_LIMIT-1:0];

//*******************************************************
// ACCEPT PACKETS
//*******************************************************
reg [`NOC_DATA_WIDTH-1:0]           in_data_buf[MAX_PKT_LEN-4:0]; //buffer for incomming packets
reg [BUFFER_ADDR_SIZE-1:0]    buf_current_in;  //address of buffer slot being filled
reg [BUFFER_ADDR_SIZE-1:0]    buf_current_out; //address of buffer slot being sent
reg [MAX_PKT_LEN_LOG-1:0]     remaining_flits; //flits remaining in current packet
reg [2:0]                     acc_state;

// Alexey: moved all reg/wire declaration at the top
reg [BUFFER_ADDR_SIZE-1:0]    buf_current_cmd;  //tracks current command sender to MC
reg                           r_app_en;         //command enable

reg [BUFFER_ADDR_SIZE-1:0]    buf_current_data_rcv;

reg [MAX_PKT_LEN_LOG-1:0]     remaining_flt_out;
reg [`NOC_DATA_WIDTH-1:0]           flit_out_buffer[MAX_PKT_LEN-1:0];

reg [BUFFER_ADDR_SIZE-1:0]    buf_current_wdf; //tracks the current data sender to MC
reg                           buf_wdf_data_half;  //which half of the data we are writing;
reg                           r_app_wdf_wren;     //write_enable

wire                        app_wdf_wren;
wire  [APP_DATA_WIDTH-1:0]  app_wdf_data;
wire  [APP_MASK_WIDTH-1:0]  app_wdf_mask;
wire                        app_wdf_end;
wire  [CL_ADDR_WIDTH-1:0]   cl_addr;
wire                        app_en;
wire  [2:0]                 app_cmd;

reg                        app_wdf_wren_r;
reg  [APP_DATA_WIDTH-1:0]  app_wdf_data_r;
reg  [APP_MASK_WIDTH-1:0]  app_wdf_mask_r;
reg                        app_wdf_end_r;

reg                        app_wdf_wren_r_r;
reg  [APP_DATA_WIDTH-1:0]  app_wdf_data_r_r;
reg  [APP_MASK_WIDTH-1:0]  app_wdf_mask_r_r;
reg                        app_wdf_end_r_r;

reg       [APP_DATA_WIDTH-1:0]  app_rd_data_reg;
reg                             app_rd_data_end_reg;
reg                             app_rd_data_valid_reg;

reg       [CL_ADDR_WIDTH-1:0]      cl_addr_reg;

reg      [APP_DATA_WIDTH-1:0]   app_wdf_data_reg;
reg      [APP_MASK_WIDTH-1:0]   app_wdf_mask_reg;
reg                             app_wdf_end_reg;

//--------------------------------
reg   [5:0]     cmd_part;
reg             cmd_pending;
reg             wdf_pending;
reg   [5:0]     wdf_part;
reg   [5:0]     rd_part;

wire            cmd_send_end;
wire  [5:0]     cmd_part_next;
wire            app_rdy_trans;
wire            wdf_send_end;
wire  [5:0]     wdf_part_next;
wire            app_wdf_rdy_trans;
wire            rd_last;
wire  [5:0]     rd_part_next;

wire  [MIG_APP_DATA_WIDTH-1:0]  wdf_data_part [RATIO-1:0];
wire  [MIG_APP_MASK_WIDTH-1:0]  wdf_mask_part [RATIO-1:0];

reg   [MIG_APP_DATA_WIDTH-1:0]  app_rd_data_part [RATIO-1:0];
wire  [APP_DATA_WIDTH-1:0]      app_rd_data_trans;




//--------------------------------

always @(posedge clk) begin
  app_rd_data_reg       <= app_rd_data_trans;
  app_rd_data_end_reg   <= rd_last;
  app_rd_data_valid_reg <= rd_last;
end

//assignments
assign flit_in_rdy  = (acc_state != `STALLED && !rst && phy_init_done);

always @(posedge clk) begin
  if(rst) begin
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
        pkt_cmd_buf   [buf_current_in] <= flit_in[`MSG_TYPE];
        remaining_flits <= flit_in[`MSG_LENGTH]-1;    // Alexey: when 0 flit is accepted
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
  end
end


// Alexey
// dealing with mutlidriver problem
generate begin
  genvar ii;
  for (ii = 0; ii < IN_FLIGHT_LIMIT; ii = ii + 1) begin: IN_STATE
    always @(posedge clk) begin
      if(rst) begin
        pkt_data_buf[ii]  <= {APP_DATA_WIDTH{1'b0}};
        pkt_state_buf[ii] <= `INACTIVE;
      end
      else begin
        pkt_data_buf[ii]  <= (ii == buf_current_in) & flit_in_val &
                             (acc_state == `ACCEPT_DATA) & (remaining_flits == 0)   ?   { flit_in, 
                                                                                        in_data_buf[1], 
                                                                                        in_data_buf[2],
                                                                                        in_data_buf[3],
                                                                                        in_data_buf[4],
                                                                                        in_data_buf[5],
                                                                                        in_data_buf[6],
                                                                                        in_data_buf[7]}   :
                              (ii == buf_current_data_rcv) & app_rd_data_valid_reg  ?   app_rd_data_reg   : 
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
                              app_rd_data_valid_reg               & 
                              app_rd_data_end_reg                     ?   `READY            :
                              (ii == buf_current_cmd)             &
                              app_en & app_rdy_trans                        ? ((pkt_cmd_buf[ii] == `MSG_TYPE_NC_STORE_REQ) |
                                                                         (pkt_cmd_buf[ii] == `MSG_TYPE_STORE_MEM) ?    `READY            :
                                                                                                                      `WAITING_DATA     
                                                                        )                   :
                              (ii == buf_current_wdf)             &
                              app_wdf_wren                        &
                              app_wdf_rdy_trans                         &
                              (buf_wdf_data_half == `FIRST)          ?   `WAITING_CMD      :
                                                                          pkt_state_buf[ii] ;                                                            


      end
    end
  end
end
endgenerate


//*******************************************************
// MC DATA SEND
//*******************************************************


always @(posedge clk) begin
  app_wdf_wren_r <= app_wdf_rdy_trans ? app_wdf_wren  : app_wdf_wren_r;
  app_wdf_data_r <= app_wdf_rdy_trans ? app_wdf_data  : app_wdf_data_r;
  app_wdf_mask_r <= app_wdf_rdy_trans ? app_wdf_mask  : app_wdf_mask_r;
  app_wdf_end_r  <= app_wdf_rdy_trans ? app_wdf_end   : app_wdf_end_r;
end

always @(posedge clk) begin
  app_wdf_wren_r_r <= app_wdf_rdy_trans   ? app_wdf_wren_r  : app_wdf_wren_r_r;
  app_wdf_data_r_r <= app_wdf_rdy_trans   ? app_wdf_data_r  : app_wdf_data_r_r;
  app_wdf_mask_r_r <= app_wdf_rdy_trans   ? app_wdf_mask_r  : app_wdf_mask_r_r;
  app_wdf_end_r_r  <= app_wdf_rdy_trans   ? app_wdf_end_r   : app_wdf_end_r_r;
end


// Alexey: made app_* interface to be output from registers because of timing
always @(posedge clk) begin
  if (rst) begin
    app_wdf_wren_reg  <= 1'b0;
    app_wdf_data_reg  <= {APP_DATA_WIDTH{1'b0}};
    app_wdf_mask_reg  <= {APP_MASK_WIDTH{1'b0}};
    app_wdf_end_reg   <= 1'b0;
    app_en_reg        <= 1'b0;
    cl_addr_reg       <= {CL_ADDR_WIDTH{1'b0}};
    app_cmd_reg       <= {3{1'b0}};
  end else begin
    app_wdf_wren_reg  <= app_wdf_rdy_trans      ? app_wdf_wren_r_r : app_wdf_wren_reg;
    app_wdf_data_reg  <= app_wdf_rdy_trans      ? app_wdf_data_r_r : app_wdf_data_reg;
    app_wdf_mask_reg  <= app_wdf_rdy_trans      ? app_wdf_mask_r_r : app_wdf_mask_reg;
    app_wdf_end_reg   <= app_wdf_rdy_trans      ? app_wdf_end_r_r  : app_wdf_end_reg;
    app_en_reg        <= app_rdy_trans    ? app_en       : app_en_reg;
    cl_addr_reg      <= app_rdy_trans    ? cl_addr     : cl_addr_reg;
    app_cmd_reg       <= app_rdy_trans    ? app_cmd      : app_cmd_reg;
  end
end


//-------------------------------------------------------------------------------------------------------
// Alexey: dealing with unequal width (pkt_trans VS MIG)
wire [RATIO_WIDTH-1:0]  last_addr_bits [RATIO-1:0];
wire [RATIO-1:0]        inv_cmp [RATIO_WIDTH-1:0];
wire [RATIO_WIDTH-1:0]  curr_last_bits;

generate begin
  if (RATIO_WIDTH > 0) begin
    assign curr_last_bits = cmd_part[RATIO_WIDTH-1:0];
  end
end
endgenerate
/*
generate begin
  genvar ii;
  if (RATIO_WIDTH > 0) begin
    for (ii = 0; ii < RATIO; ii = ii + 1) begin
      wire  cmp;

      assign cmp = cmd_part == ii;
      assign last_addr_bits[ii] = {1'b0, {RATIO_WIDTH{cmp}}} & ii;
    end
  end
end
endgenerate

generate begin
  genvar ii, jj;
  if (RATIO_WIDTH > 0) begin
    for (ii = 0; ii < RATIO_WIDTH; ii = ii + 1) begin
      for (jj = 0; jj < RATIO; jj = jj + 1) begin
        assign inv_cmp[ii][jj] = 
        [jj][ii];
      end

      assign curr_last_bits[ii] = |inv_cmp[ii];
    end
  end
end
endgenerate
*/

assign cmd_send_end       = app_en_reg & (cmd_part == (RATIO - 1)) & app_rdy;
assign cmd_part_next      = cmd_part == (RATIO - 1) ? 6'b0 : cmd_part + 1;  
assign app_rdy_trans      = (~cmd_pending | cmd_send_end) & ~(app_en_reg & ~cmd_send_end);
// assign cmd_addr           = {app_addr_out[MIG_APP_ADDR_WIDTH-1:RATIO], {RATIO{1'b0}} + cmd_part;


// Splitting one command to multiple
always @(posedge clk) begin
  if (rst)
    cmd_pending <= 1'b0;
  else
    cmd_pending <=  app_en_reg & ~cmd_send_end ? 1'b1  :
                    cmd_send_end               ? 1'b0  : cmd_pending;
end

always @(posedge clk) begin
  if (rst)
    cmd_part <= 5'b0;
  else
    cmd_part <= app_en_reg & app_rdy ? cmd_part_next : cmd_part;
end

// Splitting one write request to multiple
assign wdf_send_end     = app_wdf_wren_reg & (wdf_part == (RATIO - 1)) & app_wdf_rdy;
assign wdf_part_next    = wdf_part == (RATIO - 1) ? 6'b0 : wdf_part + 1;
assign app_wdf_rdy_trans    = (~wdf_pending | wdf_send_end) & ~(app_wdf_wren_reg & ~wdf_send_end);

always @(posedge clk) begin
  if (rst)
    wdf_pending <= 1'b0;
  else
    wdf_pending <=  app_wdf_wren_reg & ~wdf_send_end  ? 1'b1 :
                    wdf_send_end                      ? 1'b0 : wdf_pending;
end

always @(posedge clk) begin
  if (rst)
    wdf_part  <= 5'b0;
  else
    wdf_part  <= app_wdf_wren_reg & app_wdf_rdy ? wdf_part_next : wdf_part; 
end

generate begin
  genvar ii;
  for (ii = 0; ii < RATIO; ii = ii + 1) begin: APP_WDF
    assign wdf_data_part[ii] = app_wdf_data_reg[(ii+1)*MIG_APP_DATA_WIDTH - 1 : ii*MIG_APP_DATA_WIDTH];
    assign wdf_mask_part[ii] = app_wdf_mask_reg[(ii+1)*MIG_APP_MASK_WIDTH - 1 : ii*MIG_APP_MASK_WIDTH];
  end
end
endgenerate


// Output signals after splitting
generate begin
  if (RATIO_WIDTH > 0)
    assign app_addr_out = {cl_addr_reg, curr_last_bits, 3'b0}; //TODO: check if cl_addr_reg is used properly
  else
    assign app_addr_out = {cl_addr_reg, 3'b0};
end
endgenerate

assign app_wdf_data_out = wdf_data_part[wdf_part];
assign app_wdf_mask_out = wdf_mask_part[wdf_part];
assign app_wdf_end_out  = app_wdf_wren_reg;   // message has only one packet

// Aggeration of input signals
assign rd_part_next = rd_part == (RATIO - 1) ? 6'b0 : rd_part + 1;
assign rd_last      = (rd_part == (RATIO-1)) & app_rd_data_valid; 

always @(posedge clk) begin
  if (rst)
    rd_part   <= 5'b0;
  else
    rd_part   <= app_rd_data_valid ? rd_part_next : rd_part;
end

generate begin
  genvar ii;
  for (ii = 0; ii < RATIO; ii = ii + 1) begin: APP_RD
    always @(posedge clk) begin
      app_rd_data_part[ii] <= rd_part == ii ? app_rd_data : app_rd_data_part[ii]; 
    end

    if (ii == (RATIO-1)) // bypass last part
      assign app_rd_data_trans[(ii+1)*MIG_APP_DATA_WIDTH-1 : ii*MIG_APP_DATA_WIDTH] = app_rd_data;
    else
      assign app_rd_data_trans[(ii+1)*MIG_APP_DATA_WIDTH-1 : ii*MIG_APP_DATA_WIDTH] = app_rd_data_part[ii];
  end
end
endgenerate

//-------------------------------------------------------------------------------------------------------

assign app_wdf_wren  = (pkt_state_buf[buf_current_wdf] == `WAITING_WDF) ? 1'b1 : 1'b0;
assign app_wdf_data  = pkt_data_buf[buf_current_wdf];
assign app_wdf_mask  = {APP_MASK_WIDTH{1'b0}};
assign app_wdf_end   = (buf_wdf_data_half == `FIRST);
assign app_en        = r_app_en;

  // virtual address, which is used during UART DMW and test execution
  // see uart16550_define.vh for translation table

wire  [CL_ADDR_WIDTH-1:0]   cl_addr_uart_boot;
wire  [`MSG_ADDR_WIDTH-1:0]   app_addr_virt;
wire  [`MIG_APP_ADDR_WIDTH-1:0] storage_addr_out;   // addressable in DDR3_DQ_WIDTH
assign app_addr_virt = pkt_w2[buf_current_cmd][`MSG_ADDR_];

`ifdef PITONSYS_UART_BOOT
  storage_addr_trans_unified   #(
`else
  storage_addr_trans #(
`endif
    .STORAGE_ADDR_WIDTH(`MIG_APP_ADDR_WIDTH)
  ) cpu_mig_addr_translastor (
    .va_byte_addr       (app_addr_virt        ),
    .storage_addr_out   (storage_addr_out     )
  );

  // make byte address from DDR3_DQ_WIDTH address
  // get cache line addres from above address
  assign cl_addr_uart_boot   = {storage_addr_out, {WORD_SIZE_LOG{1'b0}}} >> 6;
  assign cl_addr      = uart_boot_en ? cl_addr_uart_boot : 
                                      pkt_w2[buf_current_cmd][LOC_ADDR_HI: LOC_ADDR_LO];  // Alexey: bug fix. 512 = 64 * 8 = 64 * ( 1 << 3)

assign app_cmd       = (pkt_cmd_buf[buf_current_cmd] == `MSG_TYPE_NC_STORE_REQ ||
                        pkt_cmd_buf[buf_current_cmd] == `MSG_TYPE_STORE_MEM) ? `MIG_WR_CMD : `MIG_RD_CMD;

always@(posedge clk) begin
  if(rst) begin
    buf_current_wdf <= 0;
    buf_wdf_data_half <= `FIRST;
    r_app_wdf_wren <= 0;
  end
  else begin
    if( (pkt_cmd_buf[buf_current_wdf] == `MSG_TYPE_NC_LOAD_REQ || 
         pkt_cmd_buf[buf_current_wdf] == `MSG_TYPE_LOAD_MEM) && 
        (pkt_state_buf[buf_current_wdf] != `INACTIVE) ) 
    begin  //no need to write data for read commands
      buf_current_wdf <= buf_current_wdf + 1;
    end
    r_app_wdf_wren <= (pkt_state_buf[buf_current_wdf] == `WAITING_WDF) ? 1 : 0;
    if(app_wdf_wren_r_r && app_wdf_rdy_trans) begin
      buf_current_wdf <= buf_current_wdf + 1;
    end
  end
end

//*******************************************************
// MC CMD SEND
//*******************************************************

always @(posedge clk) begin
  if(rst) begin
    buf_current_cmd <= 0;
    r_app_en <= 0;
  end
  else begin
    if(pkt_state_buf[buf_current_cmd] == `WAITING_CMD) begin
      r_app_en <= 1;
    end

    if (app_en && app_rdy_trans) begin
      r_app_en <= 0;
      buf_current_cmd <= buf_current_cmd+1;
    end
    
  end

end


//*******************************************************
// MC DATA RCV
//*******************************************************
always @(posedge clk) begin
  if(rst) begin
    buf_current_data_rcv <= 0;
  end
	else begin
		if( (pkt_cmd_buf[buf_current_data_rcv] == `MSG_TYPE_NC_STORE_REQ || 
             pkt_cmd_buf[buf_current_data_rcv] == `MSG_TYPE_STORE_MEM) && 
            (pkt_state_buf[buf_current_data_rcv][2:0] != `INACTIVE)) 
    begin //no need to receive data for write commands
      buf_current_data_rcv <= buf_current_data_rcv+1;
    end

    if(app_rd_data_valid_reg) begin //TODO: must ensure that we can always write to the next read command
      if (app_rd_data_end_reg) begin
        buf_current_data_rcv <= buf_current_data_rcv+1;
      end
    end
  end
end


//*******************************************************
// SEND PACKETS
//*******************************************************
assign flit_out = flit_out_buffer[remaining_flt_out-1];
assign flit_out_val = (pkt_state_buf[buf_current_out] == `READY) & (remaining_flt_out > 0); // Alexey: buf fix


always @(posedge clk) begin
  if(rst) begin
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
            if( pkt_cmd_buf[buf_current_out+`ADDR_ONE] == `MSG_TYPE_NC_LOAD_REQ || 
                pkt_cmd_buf[buf_current_out+`ADDR_ONE] == `MSG_TYPE_LOAD_MEM
                ) begin 
                remaining_flt_out <= 9;   // 9 down to 1

                //initialize flit_out header
                flit_out_buffer[8][`MSG_DST_CHIPID  ]     <= pkt_w3[buf_current_out+`ADDR_ONE][`MSG_SRC_CHIPID_ ];
                flit_out_buffer[8][`MSG_DST_X       ]     <= pkt_w3[buf_current_out+`ADDR_ONE][`MSG_SRC_X_      ];
                flit_out_buffer[8][`MSG_DST_Y       ]     <= pkt_w3[buf_current_out+`ADDR_ONE][`MSG_SRC_Y_      ];
                flit_out_buffer[8][`MSG_DST_FBITS   ]     <= pkt_w3[buf_current_out+`ADDR_ONE][`MSG_SRC_FBITS_  ];
                flit_out_buffer[8][`MSG_MSHRID      ]     <= pkt_w1[buf_current_out+`ADDR_ONE][`MSG_MSHRID      ];
                flit_out_buffer[8][`MSG_LENGTH] <= MAX_PKT_LEN-3;    // Alexey: bug fix: removed nonblocking assignment

                //determine return message type
                if(pkt_cmd_buf[buf_current_out+`ADDR_ONE] == `MSG_TYPE_NC_LOAD_REQ) begin
                  flit_out_buffer[8][`MSG_TYPE] <=  `MSG_TYPE_NC_LOAD_MEM_ACK; // Alexey: bug fix: removed nonblocking assignment
                end
                if(pkt_cmd_buf[buf_current_out+`ADDR_ONE] == `MSG_TYPE_LOAD_MEM) begin
                  flit_out_buffer[8][`MSG_TYPE] <=  `MSG_TYPE_LOAD_MEM_ACK; // Alexey: bug fix: removed nonblocking assignment
                end // Alexey: bug fix. Bug: write response instead of read
        
                // Set reserved bits to 0
                flit_out_buffer[8][`MSG_OPTIONS_1] <= {`MSG_OPTIONS_1_WIDTH{1'b0}};
                
                //initialize return data
                //TODO: this should be done genericly
                flit_out_buffer[0]  <= pkt_data_buf[buf_current_out+`ADDR_ONE][((8)*`NOC_DATA_WIDTH)-1:(7)*`NOC_DATA_WIDTH];
                flit_out_buffer[1]  <= pkt_data_buf[buf_current_out+`ADDR_ONE][((7)*`NOC_DATA_WIDTH)-1:(6)*`NOC_DATA_WIDTH];
                flit_out_buffer[2]  <= pkt_data_buf[buf_current_out+`ADDR_ONE][((6)*`NOC_DATA_WIDTH)-1:(5)*`NOC_DATA_WIDTH];
                flit_out_buffer[3]  <= pkt_data_buf[buf_current_out+`ADDR_ONE][((5)*`NOC_DATA_WIDTH)-1:(4)*`NOC_DATA_WIDTH];
                flit_out_buffer[4]  <= pkt_data_buf[buf_current_out+`ADDR_ONE][((4)*`NOC_DATA_WIDTH)-1:(3)*`NOC_DATA_WIDTH];
                flit_out_buffer[5]  <= pkt_data_buf[buf_current_out+`ADDR_ONE][((3)*`NOC_DATA_WIDTH)-1:(2)*`NOC_DATA_WIDTH];
                flit_out_buffer[6]  <= pkt_data_buf[buf_current_out+`ADDR_ONE][((2)*`NOC_DATA_WIDTH)-1:(1)*`NOC_DATA_WIDTH];
                flit_out_buffer[7]  <= pkt_data_buf[buf_current_out+`ADDR_ONE][((1)*`NOC_DATA_WIDTH)-1:(0)*`NOC_DATA_WIDTH];
            end
            else begin //store command
                flit_out_buffer[0][`MSG_LENGTH] <= 0; //no data to return
                remaining_flt_out <= 1;

                flit_out_buffer[0][`MSG_DST_CHIPID  ] <= pkt_w3[buf_current_out+`ADDR_ONE][`MSG_SRC_CHIPID_ ];
                flit_out_buffer[0][`MSG_DST_X       ] <= pkt_w3[buf_current_out+`ADDR_ONE][`MSG_SRC_X_      ];
                flit_out_buffer[0][`MSG_DST_Y       ] <= pkt_w3[buf_current_out+`ADDR_ONE][`MSG_SRC_Y_      ];
                flit_out_buffer[0][`MSG_DST_FBITS   ] <= pkt_w3[buf_current_out+`ADDR_ONE][`MSG_SRC_FBITS_  ];
                flit_out_buffer[0][`MSG_MSHRID      ] <= pkt_w1[buf_current_out+`ADDR_ONE][`MSG_MSHRID      ];

                if(pkt_cmd_buf[buf_current_out+`ADDR_ONE] == `MSG_TYPE_NC_STORE_REQ) begin
                  flit_out_buffer[0][`MSG_TYPE] <=  `MSG_TYPE_NC_STORE_MEM_ACK; // Alexey: bug fix: removed nonblocking assignment
                end
                if(pkt_cmd_buf[buf_current_out+`ADDR_ONE] == `MSG_TYPE_STORE_MEM) begin
                  flit_out_buffer[0][`MSG_TYPE] <=  `MSG_TYPE_STORE_MEM_ACK; // Alexey: bug fix: removed nonblocking assignment
                end

                // Set reserved bits to 0
                flit_out_buffer[0][`MSG_OPTIONS_1] <= {`MSG_OPTIONS_1_WIDTH{1'b0}};
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

function integer clogb2;
    input [31:0] value;
    begin
        value = value - 1;
        for (clogb2 = 0; value > 0; clogb2 = clogb2 + 1) begin
            value = value >> 1;
        end
    end
endfunction

endmodule

