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
//  Last Modified : 2018-11-23 13:03:10
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : fake memory controller for the L2 cache
//
//
//==================================================================================================

`include "l2.tmp.h"
`include "define.tmp.h"
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

reg [`MSG_TYPE_WIDTH-1:0] msg_send_type;
reg [`MSG_LENGTH_WIDTH-1:0] msg_send_length;
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


always @ *
begin
    // initialize to get rid of msim warnings
    mem_temp = `NOC_DATA_WIDTH'h0;
    if (mem_valid_in)
    begin
        case (msg_type)
        `MSG_TYPE_LOAD_MEM:
        begin
`ifdef PITON_DPI
            msg_send_data[0] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b000000});
            msg_send_data[1] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b001000});
            msg_send_data[2] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b010000});
            msg_send_data[3] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b011000});
            msg_send_data[4] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b100000});
            msg_send_data[5] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b101000});
            msg_send_data[6] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b110000});
            msg_send_data[7] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b111000});
`else // ifdef PITON_DPI
            $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b000000}, msg_send_data[0]);
            $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b001000}, msg_send_data[1]);
            $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b010000}, msg_send_data[2]);
            $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b011000}, msg_send_data[3]);
            $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b100000}, msg_send_data[4]);
            $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b101000}, msg_send_data[5]);
            $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b110000}, msg_send_data[6]);
            $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b111000}, msg_send_data[7]);
`endif // ifdef PITON_DPI
`ifndef MINIMAL_MONITORING
            $display("MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b000000}, msg_send_data[0]);
            $display("MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b001000}, msg_send_data[1]);
            $display("MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b010000}, msg_send_data[2]);
            $display("MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b011000}, msg_send_data[3]);
            $display("MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b100000}, msg_send_data[4]);
            $display("MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b101000}, msg_send_data[5]);
            $display("MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b110000}, msg_send_data[6]);
            $display("MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b111000}, msg_send_data[7]);
`endif
            msg_send_type = `MSG_TYPE_LOAD_MEM_ACK;
            msg_send_length = 8'd8;
        end
        `MSG_TYPE_STORE_MEM:
        begin
`ifdef PITON_DPI
            write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b000000},buf_in_mem_f[3]);
            write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b001000},buf_in_mem_f[4]);
            write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b010000},buf_in_mem_f[5]);
            write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b011000},buf_in_mem_f[6]);
            write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b100000},buf_in_mem_f[7]);
            write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b101000},buf_in_mem_f[8]);
            write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b110000},buf_in_mem_f[9]);
            write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b111000},buf_in_mem_f[10]);
`else // ifdef PITON_DPI
            $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b000000}, buf_in_mem_f[3]);
            $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b001000}, buf_in_mem_f[4]);
            $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b010000}, buf_in_mem_f[5]);
            $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b011000}, buf_in_mem_f[6]);
            $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b100000}, buf_in_mem_f[7]);
            $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b101000}, buf_in_mem_f[8]);
            $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b110000}, buf_in_mem_f[9]);
            $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b111000}, buf_in_mem_f[10]);
`endif // ifdef PITON_DPI
`ifndef MINIMAL_MONITORING
            $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b000000}, buf_in_mem_f[3]);
            $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b001000}, buf_in_mem_f[4]);
            $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b010000}, buf_in_mem_f[5]);
            $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b011000}, buf_in_mem_f[6]);
            $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b100000}, buf_in_mem_f[7]);
            $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b101000}, buf_in_mem_f[8]);
            $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b110000}, buf_in_mem_f[9]);
            $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b111000}, buf_in_mem_f[10]);
`endif
            msg_send_type = `MSG_TYPE_STORE_MEM_ACK;
            msg_send_length = 8'd0;
        end
        `MSG_TYPE_NC_LOAD_REQ:
        begin
            $display("Non-cacheable load request, size: %h, address: %h", msg_data_size, msg_addr);
            msg_send_type = `MSG_TYPE_NC_LOAD_MEM_ACK;
            case(msg_data_size)
            `MSG_DATA_SIZE_1B: 
            begin
`ifndef PITON_DPI
                $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG], msg_addr[`L2_TAG_INDEX],msg_addr[5:3],3'b000}, mem_temp);
`else // ifndef PITON_DPI
                mem_temp = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG], msg_addr[`L2_TAG_INDEX],msg_addr[5:3],3'b000});
`endif // ifndef PITON_DPI
                mem_temp = (mem_temp & write_mask) << (8*msg_addr[2:0]);
                msg_send_data[0] = {8{mem_temp[63:56]}};
`ifndef MINIMAL_MONITORING
                $display("NC_MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}},msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5:0]}, msg_send_data[0]);
`endif
                msg_send_length = 8'd1;
            end
            `MSG_DATA_SIZE_2B: 
            begin
`ifndef PITON_DPI
                $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG], msg_addr[`L2_TAG_INDEX],msg_addr[5:3],3'b000}, mem_temp);
`else // ifndef PITON_DPI
                mem_temp = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG], msg_addr[`L2_TAG_INDEX],msg_addr[5:3],3'b000});
`endif // ifndef PITON_DPI
                mem_temp = (mem_temp & write_mask) << (16*msg_addr[2:1]);
                msg_send_data[0] = {4{mem_temp[63:48]}};
`ifndef MINIMAL_MONITORING
                $display("NC_MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}},msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5:1],1'b0}, msg_send_data[0]);
`endif
                msg_send_length = 8'd1;
            end
            `MSG_DATA_SIZE_4B: 
            begin
`ifndef PITON_DPI
                $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG], msg_addr[`L2_TAG_INDEX],msg_addr[5:3],3'b000}, mem_temp);
`else // ifndef PITON_DPI
                mem_temp = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG], msg_addr[`L2_TAG_INDEX],msg_addr[5:3],3'b000});
`endif // ifndef PITON_DPI
                mem_temp = (mem_temp & write_mask) << (32*msg_addr[2]);
                msg_send_data[0] = {2{mem_temp[63:32]}};
`ifndef MINIMAL_MONITORING
                $display("NC_MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}},msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5:2],2'b00}, msg_send_data[0]);
`endif
                msg_send_length = 8'd1;
            end
            `MSG_DATA_SIZE_8B: 
            begin
`ifndef PITON_DPI
                $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG], msg_addr[`L2_TAG_INDEX],msg_addr[5:3],3'b000}, msg_send_data[0]);
`else // ifndef PITON_DPI
                msg_send_data[0] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG], msg_addr[`L2_TAG_INDEX],msg_addr[5:3],3'b000});
`endif // ifndef PITON_DPI
`ifndef MINIMAL_MONITORING
                $display("NC_MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}},msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5:3],3'b000}, msg_send_data[0]);
`endif
                msg_send_length = 8'd1;
            end
            `MSG_DATA_SIZE_16B: 
            begin
`ifndef PITON_DPI
                $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
                    msg_addr[`L2_TAG_INDEX],msg_addr[`L2_DATA_SUBLINE],4'b0000}, msg_send_data[0]);
                $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
                    msg_addr[`L2_TAG_INDEX],msg_addr[`L2_DATA_SUBLINE],4'b1000}, msg_send_data[1]);
`else // ifndef PITON_DPI
                msg_send_data[0] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG], msg_addr[`L2_TAG_INDEX],msg_addr[`L2_DATA_SUBLINE],4'b0000});
                msg_send_data[1] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG], msg_addr[`L2_TAG_INDEX],msg_addr[`L2_DATA_SUBLINE],4'b1000});
`endif // ifndef PITON_DPI
`ifndef MINIMAL_MONITORING
                $display("NC_MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
                    msg_addr[`L2_TAG_INDEX],msg_addr[`L2_DATA_SUBLINE],4'b0000}, msg_send_data[0]);
                $display("NC_MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
                    msg_addr[`L2_TAG_INDEX],msg_addr[`L2_DATA_SUBLINE],4'b1000}, msg_send_data[1]);
`endif
                msg_send_length = 8'd2;
            end
            `MSG_DATA_SIZE_32B: // L2 currently does not support 32B DATA_ACK  
            begin
`ifndef PITON_DPI
                $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
                    msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b00000}, msg_send_data[0]);
                $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
                    msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b01000}, msg_send_data[1]);
                $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
                    msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b10000}, msg_send_data[2]);
                $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
                    msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b11000}, msg_send_data[3]);
`else // ifndef PITON_DPI
                msg_send_data[0] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG], msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b00000});
                msg_send_data[1] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG], msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b01000});
                msg_send_data[2] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG], msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b10000});
                msg_send_data[3] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG], msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b11000});
`endif // ifndef PITON_DPI
`ifndef MINIMAL_MONITORING
                $display("NC_MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
                    msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b00000}, msg_send_data[0]);
                $display("NC_MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
                    msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b01000}, msg_send_data[1]);
                $display("NC_MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
                    msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b10000}, msg_send_data[2]);
                $display("NC_MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
                    msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b11000}, msg_send_data[3]);
`endif
                msg_send_length = 8'd4;
            end
            `MSG_DATA_SIZE_64B: 
            begin
`ifndef PITON_DPI
                $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b000000}, msg_send_data[0]);
                $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b001000}, msg_send_data[1]);
                $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b010000}, msg_send_data[2]);
                $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b011000}, msg_send_data[3]);
                $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b100000}, msg_send_data[4]);
                $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b101000}, msg_send_data[5]);
                $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b110000}, msg_send_data[6]);
                $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b111000}, msg_send_data[7]);
`else // ifndef PITON_DPI
                msg_send_data[0] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b000000});
                msg_send_data[1] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b001000});
                msg_send_data[2] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b010000});
                msg_send_data[3] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b011000});
                msg_send_data[4] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b100000});
                msg_send_data[5] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b101000});
                msg_send_data[6] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b110000});
                msg_send_data[7] = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b111000});
`endif // ifndef PITON_DPI
`ifndef MINIMAL_MONITORING
                $display("NC_MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b000000}, msg_send_data[0]);
                $display("NC_MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b001000}, msg_send_data[1]);
                $display("NC_MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b010000}, msg_send_data[2]);
                $display("NC_MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b011000}, msg_send_data[3]);
                $display("NC_MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b100000}, msg_send_data[4]);
                $display("NC_MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b101000}, msg_send_data[5]);
                $display("NC_MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b110000}, msg_send_data[6]);
                $display("NC_MemRead: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b111000}, msg_send_data[7]);
`endif
                msg_send_length = 8'd8;
            end
            endcase
        end
        `MSG_TYPE_NC_STORE_REQ:
        begin
            $display("Non-cacheable store request, size: %h, address: %h", msg_data_size, msg_addr);
            msg_send_type = `MSG_TYPE_NC_STORE_MEM_ACK;
            msg_send_length = 8'd0;
            case(msg_data_size)
            `MSG_DATA_SIZE_64B:
            begin
`ifdef PITON_DPI
                write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b000000},buf_in_mem_f[3]);
                write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b001000},buf_in_mem_f[4]);
                write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b010000},buf_in_mem_f[5]);
                write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b011000},buf_in_mem_f[6]);
                write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b100000},buf_in_mem_f[7]);
                write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b101000},buf_in_mem_f[8]);
                write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b110000},buf_in_mem_f[9]);
                write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b111000},buf_in_mem_f[10]);
`else // ifdef PITON_DPI
                $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b000000}, buf_in_mem_f[3]);
                $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b001000}, buf_in_mem_f[4]);
                $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b010000}, buf_in_mem_f[5]);
                $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b011000}, buf_in_mem_f[6]);
                $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b100000}, buf_in_mem_f[7]);
                $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b101000}, buf_in_mem_f[8]);
                $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b110000}, buf_in_mem_f[9]);
                $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b111000}, buf_in_mem_f[10]);
`endif // ifdef PITON_DPI
`ifndef MINIMAL_MONITORING
                $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b000000}, buf_in_mem_f[3]);
                $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b001000}, buf_in_mem_f[4]);
                $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b010000}, buf_in_mem_f[5]);
                $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b011000}, buf_in_mem_f[6]);
                $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b100000}, buf_in_mem_f[7]);
                $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b101000}, buf_in_mem_f[8]);
                $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b110000}, buf_in_mem_f[9]);
                $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],6'b111000}, buf_in_mem_f[10]);
`endif
            end
            `MSG_DATA_SIZE_32B:
            begin
`ifdef PITON_DPI
                write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b00000},buf_in_mem_f[3]);
                write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b01000},buf_in_mem_f[4]);
                write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b10000},buf_in_mem_f[5]);
                write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b11000},buf_in_mem_f[6]);
`else // ifdef PITON_DPI
                $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b00000}, buf_in_mem_f[3]);
                $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b01000}, buf_in_mem_f[4]);
                $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b10000}, buf_in_mem_f[5]);
                $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b11000}, buf_in_mem_f[6]);
`endif // ifdef PITON_DPI
`ifndef MINIMAL_MONITORING
                $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b00000}, buf_in_mem_f[3]);
                $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b01000}, buf_in_mem_f[4]);
                $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b10000}, buf_in_mem_f[5]);
                $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5],5'b11000}, buf_in_mem_f[6]);
`endif
            end
            `MSG_DATA_SIZE_16B:
            begin
`ifdef PITON_DPI
                write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5:4],4'b0000},buf_in_mem_f[3]);
                write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5:4],4'b1000},buf_in_mem_f[4]);
`else // ifdef PITON_DPI
                $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5:4],4'b0000}, buf_in_mem_f[3]);
                $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5:4],4'b1000}, buf_in_mem_f[4]);
`endif // ifdef PITON_DPI
`ifndef MINIMAL_MONITORING
                $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5:4],4'b0000}, buf_in_mem_f[3]);
                $display("MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],msg_addr[`L2_TAG_INDEX],msg_addr[5:4],4'b1000}, buf_in_mem_f[4]);
`endif
            end
            default:
            begin
`ifndef PITON_DPI
                $read_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
                msg_addr[`L2_TAG_INDEX],msg_addr[5:3],3'b000}, mem_temp);
`else // ifndef PITON_DPI
                mem_temp = read_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG], msg_addr[`L2_TAG_INDEX],msg_addr[5:3],3'b000});
`endif // ifndef PITON_DPI
                mem_temp = (mem_temp & ~write_mask) | (buf_in_mem_f[3] & write_mask);
`ifndef PITON_DPI
                $write_64b({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
                msg_addr[`L2_TAG_INDEX],msg_addr[5:3],3'b000}, mem_temp);
`else // ifndef PITON_DPI
                write_64b_call({{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
                msg_addr[`L2_TAG_INDEX],msg_addr[5:3],3'b000}, mem_temp);
`endif // ifndef PITON_DPI
`ifndef MINIMAL_MONITORING
                $display("NC_MemWrite: %h : %h", {{(`MEM_ADDR_WIDTH-`PHY_ADDR_WIDTH){1'b0}}, msg_addr[`L2_TAG],
                msg_addr[`L2_TAG_INDEX],msg_addr[5:3],3'b000}, mem_temp);
`endif
            end
            endcase
        end
        default:
        begin
            msg_send_type = `MSG_TYPE_ERROR;
            msg_send_length = 8'd0;
        end
        endcase
    end
end

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

reg [`NOC_DATA_WIDTH-1:0] buf_out_mem_f [8:0];
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
        buf_out_mem_next[0] = buf_out_mem_f[0];
        buf_out_mem_next[1] = buf_out_mem_f[1];
        buf_out_mem_next[2] = buf_out_mem_f[2];
        buf_out_mem_next[3] = buf_out_mem_f[3];
        buf_out_mem_next[4] = buf_out_mem_f[4];
        buf_out_mem_next[5] = buf_out_mem_f[5];
        buf_out_mem_next[6] = buf_out_mem_f[6];
        buf_out_mem_next[7] = buf_out_mem_f[7];
        buf_out_mem_next[8] = buf_out_mem_f[8];
    end
end

always @ (posedge clk)
begin
    if (!rst_n)
    begin
        buf_out_mem_f[0] <= 0;
        buf_out_mem_f[1] <= 0;
        buf_out_mem_f[2] <= 0;
        buf_out_mem_f[3] <= 0;
        buf_out_mem_f[4] <= 0;
        buf_out_mem_f[5] <= 0;
        buf_out_mem_f[6] <= 0;
        buf_out_mem_f[7] <= 0;
        buf_out_mem_f[8] <= 0;
    end
    else
    begin
        buf_out_mem_f[0] <= buf_out_mem_next[0];
        buf_out_mem_f[1] <= buf_out_mem_next[1];
        buf_out_mem_f[2] <= buf_out_mem_next[2];
        buf_out_mem_f[3] <= buf_out_mem_next[3];
        buf_out_mem_f[4] <= buf_out_mem_next[4];
        buf_out_mem_f[5] <= buf_out_mem_next[5];
        buf_out_mem_f[6] <= buf_out_mem_next[6];
        buf_out_mem_f[7] <= buf_out_mem_next[7];
        buf_out_mem_f[8] <= buf_out_mem_next[8];
    end
end


always @ *
begin
    noc_valid_out = (buf_out_counter_f != 0);
end

always @ *
begin
    // Tri: another quick fix for x
    noc_data_out = 0;
    if (buf_out_rd_ptr_f < 9)
        noc_data_out = buf_out_mem_f[buf_out_rd_ptr_f];
end

`ifndef MINIMAL_MONITORING
always @(posedge clk) begin
    if (noc_valid_in & noc_ready_in) begin
`ifdef VERILATOR
        $display("FakeMem: input: %h", noc_data_in);
`else
        $display("FakeMem: input: %h", noc_data_in, $time);
`endif
    end
    if (noc_valid_out & noc_ready_out) begin
`ifdef VERILATOR
        $display("FakeMem: output %h", noc_data_out);
`else
        $display("FakeMem: output %h", noc_data_out, $time);
`endif
    end
end
`endif // endif MINIMAL_MONITORING

endmodule

