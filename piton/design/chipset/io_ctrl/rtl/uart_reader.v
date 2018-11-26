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
`include "uart16550_define.vh"
`include "chipset_define.vh"

module uart_reader (
    input                                 axi_clk,      
    input                                 axi_rst_n,    

    input                                 start,        
    output  reg                           stop,       

    output  [31:0]                        m_axi_araddr,
    output                                m_axi_arvalid,
    input                                 m_axi_arready,
    input   [31:0]                        m_axi_rdata,
    input   [1:0]                         m_axi_rresp,
    input                                 m_axi_rvalid,
    output                                m_axi_rready,

    input   [`NOC_CHIPID_WIDTH-1:0]       chip_id,
    input   [`NOC_X_WIDTH-1:0]            x_id,
    input   [`NOC_Y_WIDTH-1:0]            y_id,

    output                                noc_valid,
    output  [`NOC_DATA_WIDTH-1:0]         noc_data,
    input                                 noc_ready
);

localparam  RD_STOP             = 0;
localparam  TEST_RXRD           = 1;
localparam  WAIT_RXRD_RESP      = 2;
localparam  READ_DATA           = 3;
localparam  WAIT_DATA           = 4;

localparam  IDLE                = 0;
localparam  ADDR                = 1;
localparam  BLK_NUM             = 2;
localparam  BLK                 = 3;

localparam  NOC_INTF_IDLE       = 0;
localparam  NOC_INTF_HDR        = 1;
localparam  NOC_INTF_DATA       = 2;

localparam  NOC_HDR_LEN         = 3;
//------------------------
reg             start_r;
reg             active;
reg             finish;
reg     [2:0]   rd_state;

reg     [1:0]                     gr_state;
reg     [1:0]                     gr_state_r;
reg     [`PC_ADDR_WIDTH-1   : 0]  gr_addr;
reg     [`PC_FLIT_WIDTH-1   : 0]  gr_blk_num;
reg     [`PC_BLK_WIDTH-1    : 0]  gr_blk;
reg     [`PC_BLK_NUM_WIDTH-1: 0]  gr_blk_cnt;
reg     [`PC_BLK_NUM_WIDTH-1: 0]  pcblk_in_strgblk_cnt;
reg     [`PC_BLK_NUM_WIDTH-1: 0]  pcblk_in_strgblk_cnt_r;
reg     [`PC_BLK_NUM_WIDTH-1: 0]  strgblk_in_gr_cnt;
reg     [`PC_BLK_NUM_WIDTH-1: 0]  strgblk_in_gr_cnt_prev;
reg     [7:0]   flit_cnt; // took with margin

reg     [`PC_ADDR_WIDTH-1   : 0]  start_window;

reg     [`PC_BLK_WIDTH-1  : 0]    gr_blk_r;

// NoC interface
reg     [1:0]                     noc_intf_state;
reg     [2:0]                     noc_cnt;


wire            launch;
wire            rresp_rx_rdy;
wire            rresp_rx_not_rdy;
wire            r_sent;
wire            state_rd_stop;
wire            state_test_rxrd;
wire            state_read_data;
wire            state_wait_data;
wire            gr_state_idle;
wire            gr_state_addr;
wire            gr_state_blk_num;
wire            gr_state_blk;
wire            gr_end;
wire    [7:0]   rdata;
wire            end_detected;
wire            storage_msg_ready;

wire    [`PC_ADDR_WIDTH-1:0]    blk_addr;

// NoC interface
wire            noc_last_hdr_val;
wire            noc_last_data_val;
wire    [`NOC_DATA_WIDTH-1:0]       noc_hdr1_data;
wire    [`NOC_DATA_WIDTH-1:0]       noc_hdr2_data;
wire    [`NOC_DATA_WIDTH-1:0]       noc_hdr3_data;
wire    [`STRG_BLK_WIDTH-1:0]       data_to_storage;
wire    [`NOC_DATA_WIDTH-1:0]       noc_data_to_send [`PAYLOAD_LEN-1:0];

wire [`NOC_CHIPID_WIDTH-1:0]       source_chip_id;
wire [`NOC_CHIPID_WIDTH-1:0]       dest_chip_id;
wire [`NOC_X_WIDTH-1:0]            dest_x_id;
wire [`NOC_Y_WIDTH-1:0]            dest_y_id;

genvar i;

//---------------------------------
assign source_chip_id = chip_id;
assign dest_chip_id = chip_id;
assign dest_x_id = x_id;
assign dest_y_id = y_id;

assign m_axi_rready = 1'b1;

assign launch = start & ~start_r;

assign rresp_rx_rdy     = m_axi_rvalid & m_axi_rdata[`LSR_DR];
assign rresp_rx_not_rdy = m_axi_rvalid & ~m_axi_rdata[`LSR_DR];

assign r_sent        = m_axi_arvalid & m_axi_arready;

assign state_rd_stop       = rd_state == IDLE;
assign state_test_rxrd  = rd_state == TEST_RXRD;
assign state_read_data  = rd_state == READ_DATA;
assign state_wait_data  = rd_state == WAIT_DATA;

assign rdata_val        = m_axi_rvalid & state_wait_data;
assign rdata            = m_axi_rdata[7:0];

assign gr_state_idle    = gr_state == IDLE;
assign gr_state_addr    = gr_state == ADDR;
assign gr_state_blk_num = gr_state == BLK_NUM;
assign gr_state_blk     = gr_state == BLK;

assign gr_end           = (gr_state_r == BLK) & (gr_state == ADDR);

assign end_detected     = gr_state_blk_num & 
                          (gr_addr == `RD_STOP_ADDR) &
                          rdata_val & (rdata == 8'b0);

//---------------------------------

always @(posedge axi_clk) begin
  start_r <= start;
end

always @(posedge axi_clk) begin
    active <= launch  ? 1'b1  :
              stop    ? 1'b0  : active;   // Alexey: stop instead of finish to prevent pending requests
end

always @(posedge axi_clk) begin
  if (~axi_rst_n) begin
    finish <= 1'b0;    
  end
  else begin
    finish <= launch                ? 1'b0  :
              active & end_detected ? 1'b1  : finish;
  end
end

always @(posedge axi_clk) begin
  if (~axi_rst_n) begin
    stop <= 1'b0;    
  end
  else begin
    stop <= launch | ~active         ? 1'b0  :
            active & state_rd_stop   ? 1'b1  : stop;
  end
end

always @(posedge axi_clk) begin
  if (~axi_rst_n) begin
    rd_state <= RD_STOP;        
  end
  else begin
  `ifdef PITON_UART16550
    case (rd_state)
      RD_STOP: begin
        if (launch)
          rd_state <= TEST_RXRD;
      end
      TEST_RXRD: begin
        if (r_sent)
          rd_state <= WAIT_RXRD_RESP;
      end
      WAIT_RXRD_RESP: begin
        if (rresp_rx_rdy)
          rd_state <= finish ? RD_STOP : READ_DATA;
        else if (rresp_rx_not_rdy)
          rd_state <= finish ? RD_STOP : TEST_RXRD;
      end
      READ_DATA: begin
        if (r_sent)
          rd_state <= WAIT_DATA;
      end
      WAIT_DATA: begin
        if (m_axi_rvalid)
          rd_state <= finish ? RD_STOP : TEST_RXRD;
      end
      default: begin
      end
    endcase
  `else   // PITON_UART16550
    case(rd_state)
      RD_STOP: begin
        if (launch)
          rd_state <= WAIT_DATA;
      end
      WAIT_DATA: begin
        if (m_axi_rvalid)
          rd_state <= finish ? RD_STOP : WAIT_DATA;
      end
      default: begin
      end
    endcase
  `endif  // PITON_UART16550
  end
end

// Interface with UART16550
assign m_axi_arvalid  = (active & state_test_rxrd) |
                        (active & state_read_data) ;

assign m_axi_araddr   = (active & state_test_rxrd) ? `UART_LSR : `UART_RBR;

// Group processing
always @(posedge axi_clk) begin
    start_window <= rdata_val ? {start_window[`PC_ADDR_WIDTH-9:0], rdata} : start_window;
end

always @(posedge axi_clk) begin
  if (~axi_rst_n) begin
    gr_state <= IDLE;    
  end
  else begin
    case (gr_state)
      IDLE: begin
        if (start_window == `RD_START_ADDR)
          gr_state <= ADDR;
      end
      ADDR: begin
        if (flit_cnt == `PC_FLITS_IN_ADDR)
          gr_state <= BLK_NUM;
        else if (finish)
          gr_state <= IDLE;
      end
      BLK_NUM: begin
        if (flit_cnt == `PC_FLITS_IN_BLK_NUM)
          gr_state <= BLK;
      end
      BLK: begin
        if (gr_blk_cnt == gr_blk_num)
          gr_state <= ADDR;
      end
      default: begin
         gr_state  <= gr_state;
      end
    endcase
  end
end

always @(posedge axi_clk) begin
  if (~axi_rst_n) begin
    flit_cnt <= 8'b0;    
  end
  else begin
    flit_cnt <= (gr_state_addr & (flit_cnt == `PC_FLITS_IN_ADDR))       |
                (gr_state_blk_num & (flit_cnt == `PC_FLITS_IN_BLK_NUM)) |
                (gr_state_blk & (flit_cnt == `PC_FLITS_IN_BLK))         ? 8'b0         :
                active & rdata_val & ~gr_state_idle                     ? flit_cnt + 1 : flit_cnt;
  end
end

always @(posedge axi_clk) begin
    gr_addr <= rdata_val & gr_state_addr  ? {gr_addr[`PC_ADDR_WIDTH-9:0], rdata} :
                                             gr_addr;
end

always @(posedge axi_clk) begin
  if (~axi_rst_n)
    gr_blk_num <= {`PC_FLIT_WIDTH{1'b0}};
  else
    gr_blk_num <= rdata_val & gr_state_blk_num ? rdata : gr_blk_num;
end

always @(posedge axi_clk) begin
    gr_blk <= rdata_val & gr_state_blk  ? {gr_blk[`PC_BLK_WIDTH-9:0], rdata} :
                                          gr_blk;
end

always @(posedge axi_clk) begin
  if (~axi_rst_n)
    gr_blk_cnt <= {`PC_BLK_NUM_WIDTH{1'b0}};
  else
    gr_blk_cnt <= gr_state_blk & (flit_cnt == `PC_FLITS_IN_BLK) ? gr_blk_cnt + 1            :
                  gr_blk_cnt == gr_blk_num                      ? {`PC_BLK_NUM_WIDTH{1'b0}} :
                                                                  gr_blk_cnt;
end

always @(posedge axi_clk) begin
  if (~axi_rst_n) begin
    pcblk_in_strgblk_cnt <= {`PC_BLK_NUM_WIDTH{1'b0}};    
  end
  else begin
    pcblk_in_strgblk_cnt <= gr_state_blk & (flit_cnt == `PC_FLITS_IN_BLK) ? pcblk_in_strgblk_cnt + 1        :
                      (pcblk_in_strgblk_cnt == `PC_BLK_IN_STRG_BLK) | gr_end  ? {`PC_BLK_NUM_WIDTH{1'b0}} :
                                                                      pcblk_in_strgblk_cnt;
  end
end

always @(posedge axi_clk) begin
    pcblk_in_strgblk_cnt_r <= pcblk_in_strgblk_cnt;
end

always @(posedge axi_clk) begin
  if (~axi_rst_n) begin
    strgblk_in_gr_cnt <= {`PC_BLK_NUM_WIDTH{1'b0}};    
  end
  else begin
    strgblk_in_gr_cnt <= gr_state_blk & (pcblk_in_strgblk_cnt == `PC_BLK_IN_STRG_BLK)   ? strgblk_in_gr_cnt + 1         :
                     gr_end                                               ? {`PC_BLK_NUM_WIDTH{1'b0}} :
                                                                            strgblk_in_gr_cnt;
  end
end

always @(posedge axi_clk) begin
  if (~axi_rst_n)
    strgblk_in_gr_cnt_prev <= {`PC_BLK_NUM_WIDTH{1'b0}};
  else
    strgblk_in_gr_cnt_prev <= noc_last_hdr_val ? strgblk_in_gr_cnt : strgblk_in_gr_cnt_prev;
end

// Storage message composition
always @(posedge axi_clk) begin
    gr_state_r <= gr_state;
end

assign storage_msg_ready = active                                           & 
                          ((pcblk_in_strgblk_cnt_r == `PC_BLK_IN_STRG_BLK) | gr_end) &
                          (gr_addr != `RD_STOP_ADDR);


always @(posedge axi_clk) begin
  gr_blk_r <= gr_state_blk & (flit_cnt == `PC_FLITS_IN_BLK)   ? gr_blk : gr_blk_r;
end


assign data_to_storage = gr_blk_r;

assign blk_addr = gr_addr + (strgblk_in_gr_cnt_prev << `STRG_BLK_ALIGN_WIDTH);

//-----------------------
// NoC interface
//-----------------------
always @(posedge axi_clk) begin
  if (~axi_rst_n) begin
    noc_intf_state <= NOC_INTF_IDLE;
  end
  else begin
    case (noc_intf_state)
      NOC_INTF_IDLE: begin
        if (storage_msg_ready)
          noc_intf_state <= NOC_INTF_HDR;
      end
      NOC_INTF_HDR: begin
        if (noc_last_hdr_val)
          noc_intf_state <= NOC_INTF_DATA;
      end
      NOC_INTF_DATA: begin
        if (noc_last_data_val)
          noc_intf_state <= NOC_INTF_IDLE;
      end
      default: begin
      end
    endcase
  end
end

always @(posedge axi_clk) begin
  if (~axi_rst_n) begin
    noc_cnt <= 3'b0;
  end
  else begin
    noc_cnt <=  noc_last_hdr_val | noc_last_data_val  ? 3'b0        :
                noc_valid & noc_ready                 ? noc_cnt + 1 : noc_cnt;  
  end
end

assign noc_valid = noc_intf_state != NOC_INTF_IDLE;

// CHIPID, XPOS, YPOS, FBITS, PAYLOAD LEN, TYPE, MSHR/TAG, RESERVED
assign noc_hdr1_data      = {chip_id, 8'h0, 8'h0, 4'h0, 8'ha, 8'h14, 8'h0, 6'h0};
// 8'b0, ADDR, OPTIONS
assign noc_hdr2_data      = {8'h0, blk_addr, 16'h0};
// SRC CHIPID, SRC X, SRC y, SRC FBITS, RESERVED
assign noc_hdr3_data      = {chip_id, x_id, y_id, 4'b0, 30'h0};


generate
  for (i = 0; i < `PAYLOAD_LEN; i = i + 1) begin: NOC_DATA
    assign noc_data_to_send[i] = data_to_storage[`NOC_DATA_WIDTH*(i+1)-1:`NOC_DATA_WIDTH*i];
  end
endgenerate

assign noc_data           = (noc_intf_state == NOC_INTF_HDR) & (noc_cnt == 0) ? noc_hdr1_data :
                            (noc_intf_state == NOC_INTF_HDR) & (noc_cnt == 1) ? noc_hdr2_data :
                            (noc_intf_state == NOC_INTF_HDR) & (noc_cnt == 2) ? noc_hdr3_data :
                                                                                noc_data_to_send[noc_cnt];

assign noc_last_hdr_val   = (noc_intf_state == NOC_INTF_HDR)  &
                            (noc_cnt == NOC_HDR_LEN-1)        &
                            noc_ready;

assign noc_last_data_val  = (noc_intf_state == NOC_INTF_DATA) &
                            (noc_cnt == `PAYLOAD_LEN-1)       &
                            noc_ready; 

//------------------------------------------------
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
