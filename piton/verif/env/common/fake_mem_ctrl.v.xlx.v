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

//==================================================================================================
//  Filename      : fake_mem_ctrl.v
//  Created On    : 2014-04-15
//  Last Modified : 2015-05-09 21:41:22
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : fake memory controller for the L2 cache
//
//
//==================================================================================================

`include "l2.vh"
`include "define.vh"
`include "iop.h"

`define MEM_ADDR_WIDTH      64

module fake_mem_ctrl(

    input wire clk,
    input wire rst_n,

    input wire noc_valid_in,
    input wire [`NOC_DATA_WIDTH-1:0] noc_data_in,
    output reg noc_ready_in,


    output reg noc_valid_out,
    output reg [`NOC_DATA_WIDTH-1:0] noc_data_out,
    input wire noc_ready_out

);

reg mem_valid_in;
reg [3*`NOC_DATA_WIDTH-1:0] mem_header_in;
reg mem_ready_in;


//Input buffer

reg [`NOC_DATA_WIDTH-1:0] buf_in_mem_f [10:0];
reg [`NOC_DATA_WIDTH-1:0] buf_in_mem_next;
reg [`MSG_LENGTH_WIDTH-1:0] buf_in_counter_f;
reg [`MSG_LENGTH_WIDTH-1:0] buf_in_counter_next;
reg [3:0] buf_in_wr_ptr_f;
reg [3:0] buf_in_wr_ptr_next;

always @ *
begin
    noc_ready_in = (buf_in_counter_f == 0) || (buf_in_counter_f < (buf_in_mem_f[0][`MSG_LENGTH]+1));
end

always @ *
begin
    if (noc_valid_in && noc_ready_in)
    begin
        buf_in_counter_next = buf_in_counter_f + 1;
    end
    else if (mem_valid_in && mem_ready_in)
    begin
        buf_in_counter_next = 0;
    end
    else
    begin
        buf_in_counter_next = buf_in_counter_f;
    end
end


always @ (posedge clk)
begin
    if (!rst_n)
    begin
        buf_in_counter_f <= 0;
    end
    else
    begin
        buf_in_counter_f <= buf_in_counter_next;
    end
end

always @ *
begin
    if (mem_valid_in && mem_ready_in)
    begin
        buf_in_wr_ptr_next = 0;
    end
    else if (noc_valid_in && noc_ready_in)
    begin
        buf_in_wr_ptr_next = buf_in_wr_ptr_f + 1;
    end
    else
    begin
        buf_in_wr_ptr_next = buf_in_wr_ptr_f;
    end
end


always @ (posedge clk)
begin
    if (!rst_n)
    begin
        buf_in_wr_ptr_f <= 0;
    end
    else
    begin
        buf_in_wr_ptr_f <= buf_in_wr_ptr_next;
    end
end


always @ *
begin
    if (noc_valid_in && noc_ready_in)
    begin
        buf_in_mem_next = noc_data_in;
    end
    else
    begin
        buf_in_mem_next = buf_in_mem_f[buf_in_wr_ptr_f];
    end
end

always @ (posedge clk)
begin
    if (!rst_n)
    begin
        buf_in_mem_f[buf_in_wr_ptr_f] <= 0;
    end
    else
    begin
        buf_in_mem_f[buf_in_wr_ptr_f] <= buf_in_mem_next;
    end
end


always @ *
begin
    mem_valid_in = (buf_in_counter_f != 0) && (buf_in_counter_f == (buf_in_mem_f[0][`MSG_LENGTH]+1));
end

always @ *
begin
    mem_header_in = {buf_in_mem_f[2], buf_in_mem_f[1], buf_in_mem_f[0]};
end

//Memory read/write

wire [`MSG_TYPE_WIDTH-1:0] msg_type;
wire [`MSG_MSHRID_WIDTH-1:0] msg_mshrid;
wire [`MSG_DATA_SIZE_WIDTH-1:0] msg_data_size;
wire [`PHY_ADDR_WIDTH-1:0] msg_addr;
wire [`MSG_SRC_CHIPID_WIDTH-1:0] msg_src_chipid;
wire [`MSG_SRC_X_WIDTH-1:0] msg_src_x;
wire [`MSG_SRC_Y_WIDTH-1:0] msg_src_y;
wire [`MSG_SRC_FBITS_WIDTH-1:0] msg_src_fbits;

reg [`NOC_DATA_WIDTH-1:0] msg_send_data [7:0];
reg [`NOC_DATA_WIDTH-1:0] mem_temp;
wire [`NOC_DATA_WIDTH*3-1:0] msg_send_header;




l2_decoder decoder(
    .msg_header         (mem_header_in),
    .msg_type           (msg_type),
    .msg_length         (),
    .msg_mshrid         (msg_mshrid),
    .msg_data_size      (msg_data_size),
    .msg_cache_type     (),
    .msg_subline_vector (),
    .msg_mesi           (),
    .msg_l2_miss        (),
    .msg_subline_id     (),
    .msg_last_subline   (),
    .msg_addr           (msg_addr),
    .msg_src_chipid     (msg_src_chipid),
    .msg_src_x          (msg_src_x),
    .msg_src_y          (msg_src_y),
    .msg_src_fbits      (msg_src_fbits),
    .msg_sdid           (),
    .msg_lsid           ()
);

reg [63:0] write_mask;

always @ *
begin
    if (msg_data_size == `MSG_DATA_SIZE_1B)
    begin
        write_mask = 64'hff00000000000000;
        write_mask = write_mask >> (8*msg_addr[2:0]);
    end
    else if (msg_data_size == `MSG_DATA_SIZE_2B)
    begin
        write_mask = 64'hffff000000000000;
        write_mask = write_mask >> (16*msg_addr[2:1]);
    end
    else if (msg_data_size == `MSG_DATA_SIZE_4B)
    begin
        write_mask = 64'hffffffff00000000;
        write_mask = write_mask >> (32*msg_addr[2]);
    end
    else if (msg_data_size == `MSG_DATA_SIZE_8B)
    begin
        write_mask = 64'hffffffffffffffff;
    end
    else
    begin
        write_mask = 64'h0000000000000000;
    end
end

//------------------------------------------------
// Alexey
parameter BRAM_DATA_WIDTH = 512;
parameter BRAM_ADDR_WIDTH = 12;

wire                            bram_r_val;
wire [BRAM_DATA_WIDTH-1:0]      bram_data_out;

wire                            bram_w_val;
wire [BRAM_DATA_WIDTH-1:0]      bram_w_mask;
wire [BRAM_DATA_WIDTH-1:0]      bram_data_in;

wire [BRAM_ADDR_WIDTH-1:0]      bram_addr;    //TODO: mapping !

wire [`NOC_DATA_WIDTH-1:0]      buf_out_mem [8:0];
reg  [`NOC_DATA_WIDTH*3-1:0]    msg_send_header_r;
wire [`MSG_TYPE_WIDTH-1:0]      msg_send_type;
wire [`MSG_LENGTH_WIDTH-1:0]    msg_send_length;

reg  [`L2_DATA_SUBLINE_WIDTH-1:0] addr_subline_r;
wire                            hit_bram;
reg                             hit_bram_r;
wire [BRAM_DATA_WIDTH-1:0]      read_data;
reg  [`NOC_DATA_WIDTH-1:0]      buf_out_mem_r [8:0];
wire                            mem_process_next_val;
reg                             mem_process_next_val_r;


bram_map #(
    .MEM_ADDR_WIDTH     (`MEM_ADDR_WIDTH),
    .PHY_ADDR_WIDTH     (`PHY_ADDR_WIDTH),
    .BRAM_ADDR_WIDTH    (BRAM_ADDR_WIDTH)
) bram_map (
    .msg_addr           (msg_addr       ),
    .bram_blk_addr      (bram_addr      ),
    .hit_any_section    (hit_bram       )
);

// READ
assign mem_process_next_val = mem_valid_in & mem_ready_in;


assign read_data = hit_bram_r ? bram_data_out : {BRAM_DATA_WIDTH{1'b0}};

assign bram_r_val       = mem_valid_in & ((msg_type == `MSG_TYPE_LOAD_MEM) | (msg_type == `MSG_TYPE_NC_LOAD_REQ));
assign buf_out_mem[0]   = mem_process_next_val_r  ? msg_send_header_r[`NOC_DATA_WIDTH-1:0] : buf_out_mem_r[0];

assign {buf_out_mem[8], buf_out_mem[7], buf_out_mem[6], buf_out_mem[5],
        buf_out_mem[4], buf_out_mem[3]}     = mem_process_next_val_r ? read_data[511:128] : 
                                              {buf_out_mem_r[8], buf_out_mem_r[7], buf_out_mem_r[6], buf_out_mem_r[5],
                                               buf_out_mem_r[4], buf_out_mem_r[3]};
assign {buf_out_mem[2], buf_out_mem[1]}     = mem_process_next_val_r ? 
                                             (addr_subline_r == 2'b00 ? read_data[127:0]    :
                                              addr_subline_r == 2'b01 ? read_data[255:128]  :
                                              addr_subline_r == 2'b10 ? read_data[383:256]  : read_data[511:384]) :
                                             {buf_out_mem_r[2], buf_out_mem_r[1]};

// WRITE
assign bram_w_val       = mem_valid_in & ((msg_type == `MSG_TYPE_STORE_MEM) | (msg_type == `MSG_TYPE_NC_STORE_REQ));
assign bram_data_in     = {buf_in_mem_f[10], buf_in_mem_f[9], buf_in_mem_f[8], buf_in_mem_f[7], 
                           buf_in_mem_f[6],  buf_in_mem_f[5], buf_in_mem_f[4], buf_in_mem_f[3]};
assign bram_w_mask      = msg_type == `MSG_TYPE_NC_STORE_REQ ? write_mask <<  64*(1<<msg_addr[5:3]) : {BRAM_DATA_WIDTH{1'b1}};


// Figure out at which cycle are used
assign msg_send_type    = {`MSG_TYPE_WIDTH{mem_valid_in}} &
                         (msg_type == `MSG_TYPE_LOAD_MEM        ? `MSG_TYPE_LOAD_MEM_ACK        :
                          msg_type == `MSG_TYPE_STORE_MEM       ? `MSG_TYPE_STORE_MEM_ACK       :
                          msg_type == `MSG_TYPE_NC_LOAD_REQ     ? `MSG_TYPE_NC_LOAD_MEM_ACK     :
                          msg_type == `MSG_TYPE_NC_STORE_REQ    ? `MSG_TYPE_NC_STORE_MEM_ACK    : `MSG_TYPE_ERROR);
assign msg_send_length  = {`MSG_LENGTH_WIDTH{1'b1}} & 
                         (msg_type == `MSG_TYPE_LOAD_MEM        ? 8'd8  :
                          msg_type == `MSG_TYPE_STORE_MEM       ? 8'd0  :
                          msg_type == `MSG_TYPE_NC_LOAD_REQ     ? 8'd2  :
                          msg_type == `MSG_TYPE_NC_STORE_REQ    ? 8'd0  : 8'd0);

always @(posedge clk)
    msg_send_header_r <= msg_send_header;

always @(posedge clk)
    addr_subline_r <= msg_type == `MSG_TYPE_NC_LOAD_REQ ? msg_addr[`L2_DATA_SUBLINE] : 2'b0;

always @(posedge clk)
    hit_bram_r <= hit_bram;

always @(posedge clk)
    mem_process_next_val_r <= mem_process_next_val;

always @(posedge clk) begin
    buf_out_mem_r[8] <= buf_out_mem[8];
    buf_out_mem_r[7] <= buf_out_mem[7];
    buf_out_mem_r[6] <= buf_out_mem[6];
    buf_out_mem_r[5] <= buf_out_mem[5];
    buf_out_mem_r[4] <= buf_out_mem[4];
    buf_out_mem_r[3] <= buf_out_mem[3];
    buf_out_mem_r[2] <= buf_out_mem[2];
    buf_out_mem_r[1] <= buf_out_mem[1];
    buf_out_mem_r[0] <= buf_out_mem[0];
end

bram_sdp_4096x512_wrapper #(
    .ADDR_WIDTH     (12     ),
    .BITMASK_WIDTH  (512    ),
    .DATA_WIDTH     (512    )
) bram (
    .MEMCLK         (clk            ),
    .A              (bram_addr      ),
    .REN            (bram_r_val     ),
    .WEN            (bram_w_val     ),
    .BW             (bram_w_mask    ),
    .DIN            (bram_data_in   ),
    .DOUT           (bram_data_out  )

);


/*
always @ *
begin
    if (mem_valid_in)
    begin
        case (msg_type)
        `MSG_TYPE_LOAD_MEM:
        begin
            $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b000000}, msg_send_data[0]);
            $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b001000}, msg_send_data[1]);
            $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b010000}, msg_send_data[2]);
            $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b011000}, msg_send_data[3]);
            $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b100000}, msg_send_data[4]);
            $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b101000}, msg_send_data[5]);
            $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b110000}, msg_send_data[6]);
            $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b111000}, msg_send_data[7]);
            $display("MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b000000}, msg_send_data[0]);
            $display("MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b001000}, msg_send_data[1]);
            $display("MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b010000}, msg_send_data[2]);
            $display("MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b011000}, msg_send_data[3]);
            $display("MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b100000}, msg_send_data[4]);
            $display("MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b101000}, msg_send_data[5]);
            $display("MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b110000}, msg_send_data[6]);
            $display("MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b111000}, msg_send_data[7]);
            // msg_send_type = `MSG_TYPE_LOAD_MEM_ACK;
            // msg_send_length = 8'd8;
        end
        `MSG_TYPE_STORE_MEM:
        begin
            $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b000000}, buf_in_mem_f[3]);
            $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b001000}, buf_in_mem_f[4]);
            $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b010000}, buf_in_mem_f[5]);
            $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b011000}, buf_in_mem_f[6]);
            $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b100000}, buf_in_mem_f[7]);
            $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b101000}, buf_in_mem_f[8]);
            $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b110000}, buf_in_mem_f[9]);
            $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b111000}, buf_in_mem_f[10]);
            $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b000000}, buf_in_mem_f[3]);
            $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b001000}, buf_in_mem_f[4]);
            $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b010000}, buf_in_mem_f[5]);
            $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b011000}, buf_in_mem_f[6]);
            $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b100000}, buf_in_mem_f[7]);
            $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b101000}, buf_in_mem_f[8]);
            $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b110000}, buf_in_mem_f[9]);
            $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b111000}, buf_in_mem_f[10]);
            msg_send_type = `MSG_TYPE_STORE_MEM_ACK;
            msg_send_length = 8'd0;
        end
        `MSG_TYPE_NC_LOAD_REQ:
        begin
            $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
            msg_addr[`L2_TAG_INDEX],msg_addr[`L2_DATA_SUBLINE],4'b0000}, msg_send_data[0]);
            $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
            msg_addr[`L2_TAG_INDEX],msg_addr[`L2_DATA_SUBLINE],4'b1000}, msg_send_data[1]);
            $display("MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
            msg_addr[`L2_TAG_INDEX],msg_addr[`L2_DATA_SUBLINE],4'b0000}, msg_send_data[0]);
            $display("MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
            msg_addr[`L2_TAG_INDEX],msg_addr[`L2_DATA_SUBLINE],4'b1000}, msg_send_data[1]);
            msg_send_type = `MSG_TYPE_NC_LOAD_MEM_ACK;
            msg_send_length = 8'd2;
        end
        `MSG_TYPE_NC_STORE_REQ:
        begin
            $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
            msg_addr[`L2_TAG_INDEX],msg_addr[5:3],3'b000}, mem_temp);
            mem_temp = (mem_temp & ~write_mask) | (buf_in_mem_f[3] & write_mask);
            $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
            msg_addr[`L2_TAG_INDEX],msg_addr[5:3],3'b000}, mem_temp);
            $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
            msg_addr[`L2_TAG_INDEX],msg_addr[5:3],3'b000}, mem_temp);
            msg_send_type = `MSG_TYPE_NC_STORE_MEM_ACK;
            msg_send_length = 8'd0;
        end
        default:
        begin
            msg_send_type = `MSG_TYPE_ERROR;
            msg_send_length = 8'd0;
        end
        endcase
    end
end
*/

l2_encoder encoder(
    .msg_dst_chipid             (msg_src_chipid),
    .msg_dst_x                  (msg_src_x),
    .msg_dst_y                  (msg_src_y),
    .msg_dst_fbits              (msg_src_fbits),
    .msg_length                 (msg_send_length),
    .msg_type                   (msg_send_type),
    .msg_mshrid                 (msg_mshrid),
    .msg_data_size              ({`MSG_DATA_SIZE_WIDTH{1'b0}}),
    .msg_cache_type             ({`MSG_CACHE_TYPE_WIDTH{1'b0}}),
    .msg_subline_vector         ({`MSG_SUBLINE_VECTOR_WIDTH{1'b0}}),
    .msg_mesi                   ({`MSG_MESI_BITS{1'b0}}),
    .msg_l2_miss                (msg_addr[`PHY_ADDR_WIDTH-1]),
    .msg_subline_id             ({`MSG_SUBLINE_ID_WIDTH{1'b0}}),
    .msg_last_subline           ({`MSG_LAST_SUBLINE_WIDTH{1'b1}}),
    .msg_addr                   (msg_addr),
    .msg_src_chipid             ({`NOC_CHIPID_WIDTH{1'b0}}),
    .msg_src_x                  ({`NOC_X_WIDTH{1'b0}}),
    .msg_src_y                  ({`NOC_Y_WIDTH{1'b0}}),
    .msg_src_fbits              ({`NOC_FBITS_WIDTH{1'b0}}),
    .msg_sdid                   ({`MSG_SDID_WIDTH{1'b0}}),
    .msg_lsid                   ({`MSG_LSID_WIDTH{1'b0}}),
    .msg_header                 (msg_send_header)
);



//Output buffer

reg [`NOC_DATA_WIDTH-1:0] buf_out_mem_next [8:0];
reg [`MSG_LENGTH_WIDTH-1:0] buf_out_counter_f;
reg [`MSG_LENGTH_WIDTH-1:0] buf_out_counter_next;
reg [3:0] buf_out_rd_ptr_f;
reg [3:0] buf_out_rd_ptr_next;

always @ *
begin
    noc_valid_out = (buf_out_counter_f != 0);
end

always @ *
begin
    mem_ready_in = (buf_out_counter_f == 0);
end


always @ *
begin
    if (noc_valid_out && noc_ready_out)
    begin
        buf_out_counter_next = buf_out_counter_f - 1;
    end
    else if (mem_valid_in && mem_ready_in)
    begin
        buf_out_counter_next = msg_send_length + 1;
    end
    else
    begin
        buf_out_counter_next = buf_out_counter_f;
    end
end

always @ (posedge clk)
begin
    if (!rst_n)
    begin
        buf_out_counter_f <= 0;
    end
    else
    begin
        buf_out_counter_f <= buf_out_counter_next;
    end
end


always @ *
begin
    if (mem_valid_in && mem_ready_in)
    begin
        buf_out_rd_ptr_next = 0;
    end
    else if (noc_valid_out && noc_ready_out)
    begin
        buf_out_rd_ptr_next = buf_out_rd_ptr_f + 1;
    end
    else
    begin
        buf_out_rd_ptr_next = buf_out_rd_ptr_f;
    end
end

always @ (posedge clk)
begin
    if (!rst_n)
    begin
        buf_out_rd_ptr_f <= 0;
    end
    else
    begin
        buf_out_rd_ptr_f <= buf_out_rd_ptr_next;
    end
end



always @ *
begin
    if (mem_valid_in && mem_ready_in)
    begin
        buf_out_mem_next[0] = msg_send_header[`NOC_DATA_WIDTH-1:0];
        buf_out_mem_next[1] = msg_send_data[0];
        buf_out_mem_next[2] = msg_send_data[1];
        buf_out_mem_next[3] = msg_send_data[2];
        buf_out_mem_next[4] = msg_send_data[3];
        buf_out_mem_next[5] = msg_send_data[4];
        buf_out_mem_next[6] = msg_send_data[5];
        buf_out_mem_next[7] = msg_send_data[6];
        buf_out_mem_next[8] = msg_send_data[7];
    end
    else
    begin
        buf_out_mem_next[0] = buf_out_mem[0];
        buf_out_mem_next[1] = buf_out_mem[1];
        buf_out_mem_next[2] = buf_out_mem[2];
        buf_out_mem_next[3] = buf_out_mem[3];
        buf_out_mem_next[4] = buf_out_mem[4];
        buf_out_mem_next[5] = buf_out_mem[5];
        buf_out_mem_next[6] = buf_out_mem[6];
        buf_out_mem_next[7] = buf_out_mem[7];
        buf_out_mem_next[8] = buf_out_mem[8];
    end
end

/*
always @ (posedge clk)
begin
    if (!rst_n)
    begin
        buf_out_mem[0] <= 0;
        buf_out_mem[1] <= 0;
        buf_out_mem[2] <= 0;
        buf_out_mem[3] <= 0;
        buf_out_mem[4] <= 0;
        buf_out_mem[5] <= 0;
        buf_out_mem[6] <= 0;
        buf_out_mem[7] <= 0;
        buf_out_mem[8] <= 0;
    end
    else
    begin
        buf_out_mem[0] <= buf_out_mem_next[0];
        buf_out_mem[1] <= buf_out_mem_next[1];
        buf_out_mem[2] <= buf_out_mem_next[2];
        buf_out_mem[3] <= buf_out_mem_next[3];
        buf_out_mem[4] <= buf_out_mem_next[4];
        buf_out_mem[5] <= buf_out_mem_next[5];
        buf_out_mem[6] <= buf_out_mem_next[6];
        buf_out_mem[7] <= buf_out_mem_next[7];
        buf_out_mem[8] <= buf_out_mem_next[8];
    end
end
*/

always @ *
begin
    noc_valid_out = (buf_out_counter_f != 0);
end

always @ *
begin
    // Tri: another quick fix for x
    noc_data_out = 0;
    if (buf_out_rd_ptr_f < 9)
        noc_data_out = buf_out_mem[buf_out_rd_ptr_f];
end

always @(posedge clk) begin
    if (noc_valid_in & noc_ready_in) begin
        $display("FakeMem: input: %h", noc_data_in, $time);
    end
    if (noc_valid_out & noc_ready_out) begin
        $display("FakeMem: output %h", noc_data_out, $time);
    end
end


endmodule

