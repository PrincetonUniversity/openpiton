// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: ciop_iob.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
//
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
//
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
//
// ========== Copyright Header End ============================================
`timescale 1ps/1ps
`include "define.vh"
`include "cross_module.h.tmp"

module ciop_iob(
    input clk,
    input rst_n,

    input noc_in_val,
    output reg noc_in_rdy,
    input [`NOC_DATA_WIDTH-1:0] noc_in_data,

    output reg noc_out_val,
    input noc_out_rdy,
    output reg [`NOC_DATA_WIDTH-1:0] noc_out_data,

   input                spc0_inst_done,
   input [48:0]         pc_w0,
   input                spc1_inst_done,
   input [48:0]         pc_w1,
   input                spc2_inst_done,
   input [48:0]         pc_w2,
   input                spc3_inst_done,
   input [48:0]         pc_w3,
   input                spc4_inst_done,
   input [48:0]         pc_w4,
   input                spc5_inst_done,
   input [48:0]         pc_w5,
   input                spc6_inst_done,
   input [48:0]         pc_w6,
   input                spc7_inst_done,
   input [48:0]         pc_w7
);
//temp. memory.
reg [`IOB_CPU_WIDTH-1:0] 	    fake_iob_out_req;
reg [`CPX_WIDTH-1:0] 	    fake_iob_out_data;

wire [`CPX_WIDTH-1:0]       cpx_data = fake_iob_out_data;

//Input buffer
reg [`NOC_DATA_WIDTH-1:0] in_buffer [1:0];
reg [`NOC_DATA_WIDTH-1:0] noc_buffer_write_packet;
reg [3:0] in_buffer_counter;
reg [3:0] in_buffer_counter_next;

// buffer to iob interface
reg buffer_iob_val;
reg buffer_iob_rdy = 1'b1; // iob always accept packets
reg [2*`NOC_DATA_WIDTH-1:0] buffer_iob_data; // TODO: error?

// this block determines the next index for writing
always @ (posedge clk)
begin
    if (noc_in_val && noc_in_rdy)
    begin
        in_buffer_counter_next = in_buffer_counter + 1;
    end
    else if (buffer_iob_val && buffer_iob_rdy)
    begin
        in_buffer_counter_next = 0;
    end
    else
    begin
        in_buffer_counter_next = in_buffer_counter;
    end

    if (in_buffer_counter > 2)
    begin
        $display("%d : Simulation -> FAIL(%0s)", $time, "ciop_iob.v: IOB in buffer overflowed");
        repeat(5)@(posedge clk);
        `MONITOR_PATH.fail("ciop_iob.v: IOB in buffer overflowed");
    end
end

always @ (posedge clk)
begin
    if (!rst_n)
    begin
        in_buffer[0] <= 0;
        in_buffer[1] <= 0;
    end
    else
    begin
        if (noc_in_val && noc_in_rdy)
            in_buffer[in_buffer_counter] <= noc_in_data;
    end
end

always @ (posedge clk)
begin
    if (!rst_n)
    begin
        in_buffer_counter <= 0;
    end
    else
    begin
        in_buffer_counter <= in_buffer_counter_next;
    end
end

reg noc_in_buf_full;
always @ *
begin
    noc_in_buf_full = (in_buffer_counter ==  2);
    noc_in_rdy = !noc_in_buf_full;
    buffer_iob_val = noc_in_buf_full;
    buffer_iob_data = {in_buffer[0], in_buffer[1]};
end


// Output buffer
// The output buffer need to be asynchronous and cannot ever be overflowed.
// We will ensure this by having a lot of entries
localparam NUM_ASYNC_ENTRIES = 256;

reg [`NOC_DATA_WIDTH-1:0] out_buffer [NUM_ASYNC_ENTRIES-1:0];
reg [NUM_ASYNC_ENTRIES-1:0] out_buffer_val;

reg iob_buffer_val;
reg [2*`NOC_DATA_WIDTH-1:0] iob_buffer_data;

///////////////////////////////////////////////////////////
// write port of the async fifo; runs at chip frequency
///////////////////////////////////////////////////////////
reg [7:0] out_write_index;
reg [7:0] out_write_index_next;

integer i;

always @ (posedge `CHIP.singleclockout)
begin
    if (!rst_n)
        out_write_index <= 0;
    else
    begin
        out_write_index <= out_write_index_next;
    end

    // write port
    if (!rst_n)
        for (i = 0; i < NUM_ASYNC_ENTRIES; i = i + 1)
        begin
            out_buffer[i] = 0;
            out_buffer_val[i] = 1'b0;
        end
    else
    begin
        if (iob_buffer_val)
        begin
            // no ready; always accepting packet
            out_buffer[out_write_index + 1] = iob_buffer_data[63:0];
            out_buffer[out_write_index] = iob_buffer_data[127:64];
            out_buffer_val[out_write_index] = 1'b1;
            out_buffer_val[out_write_index + 1] = 1'b1;
        end
    end

end

always @ *
begin
    out_write_index_next = iob_buffer_val ? out_write_index + 2 : out_write_index;
end


///////////////////////////////////////////////////////////
// read port of the async fifo; runs at off-chip frequency
///////////////////////////////////////////////////////////
reg [7:0] out_read_index;
reg [7:0] out_read_index_next;

always @ (posedge clk)
begin
    if (!rst_n)
        out_read_index <= 0;
    else
    begin
        out_read_index <= out_read_index_next;
    end

    if (noc_out_rdy && noc_out_val)
    begin
        out_buffer_val[out_read_index] = 1'b0;
    end
end

always @ *
begin
    noc_out_val = out_buffer_val[out_read_index];
    noc_out_data = 0; // Tri: fixes x when out_buffer_counter == 0
    noc_out_data = out_buffer[out_read_index];

    out_read_index_next = (noc_out_rdy && noc_out_val) ? out_read_index + 1 : out_read_index;
end

///////////////////////////////////////////////////////////
// Make out going packets from IOB out data
///////////////////////////////////////////////////////////
reg [63:0] iob_buffer_flit1;
reg [63:0] iob_buffer_flit2;
reg [5:0] dest_cpuid;
always @ *
begin
   iob_buffer_val = fake_iob_out_data[144];
   iob_buffer_flit1 = {14'b0,5'b0, 3'b0, 8'b0,`NOC_FBITS_L1,8'd1, `MSG_TYPE_INTERRUPT,14'b0};
   iob_buffer_flit2 = {fake_iob_out_data[63:16],7'b0,fake_iob_out_data[8:0]};

   // assuming a 8x8 topo
   dest_cpuid = fake_iob_out_data[14:9];
   iob_buffer_flit1[`MSG_DST_X] = dest_cpuid[2:0];
   iob_buffer_flit1[`MSG_DST_Y] = dest_cpuid[5:3];

   if (iob_buffer_val)
   begin
      $display("IOB sending to tile X:%d Y:%d", iob_buffer_flit1[`MSG_DST_X], iob_buffer_flit1[`MSG_DST_Y]);
      $display("   raw tileid %x", dest_cpuid);
    end

   iob_buffer_data = {iob_buffer_flit1, iob_buffer_flit2};
end


// input signals
wire  [`PCX_WIDTH-1:0]           pcx_iob_data        = {buffer_iob_val,5'b01001,1'b0,3'b0,2'b0,48'b0,buffer_iob_data[63:0]};
wire  [`IOB_CPU_WIDTH-1:0]       cpx_iob_grant       = fake_iob_out_req; // basically always ready
wire                             spc0_inst_done_buf  = spc0_inst_done;
wire [48:0]                      pc_w0_buf           = pc_w0;
wire                             spc1_inst_done_buf  = spc1_inst_done;
wire [48:0]                      pc_w1_buf           = pc_w1;
wire                             spc2_inst_done_buf  = spc2_inst_done;
wire [48:0]                      pc_w2_buf           = pc_w2;
wire                             spc3_inst_done_buf  = spc3_inst_done;
wire [48:0]                      pc_w3_buf           = pc_w3;
wire                             spc4_inst_done_buf  = spc4_inst_done;
wire [48:0]                      pc_w4_buf           = pc_w4;
wire                             spc5_inst_done_buf  = spc5_inst_done;
wire [48:0]                      pc_w5_buf           = pc_w5;
wire                             spc6_inst_done_buf  = spc6_inst_done;
wire [48:0]                      pc_w6_buf           = pc_w6;
wire                             spc7_inst_done_buf  = spc7_inst_done;
wire [48:0]                      pc_w7_buf           = pc_w7;

reg 	 ok_iob;
initial
begin
    ok_iob    = 0;
    fake_iob_out_req   = 0;
    fake_iob_out_data  = 0;

	$init_iob_model();
end

// cmp clock domain
// trin bug #65: use reference clock from the chip b/c the fake iob
// needs to monitor the core PC
always @(negedge `CHIP.singleclockout)
begin
    if(ok_iob)
    begin
        $iob_cdriver(//input to pli
            //pcx packet from core
            pcx_iob_data,
            //cpx request from iob
            fake_iob_out_req,
            fake_iob_out_data,
            //grand and request
            cpx_iob_grant,
            //pc event
            spc0_inst_done_buf,
            pc_w0_buf,
            spc1_inst_done_buf,
            pc_w1_buf,
            spc2_inst_done_buf,
            pc_w2_buf,
            spc3_inst_done_buf,
            pc_w3_buf,
            spc4_inst_done_buf,
            pc_w4_buf,
            spc5_inst_done_buf,
            pc_w5_buf,
            spc6_inst_done_buf,
            pc_w6_buf,
            spc7_inst_done_buf,
            pc_w7_buf
        );

        // a little error check
        if (iob_buffer_val && (out_buffer_val[out_write_index] | out_buffer_val[out_write_index + 1] == 1'b1))
        begin
            $display("%d : Simulation -> FAIL(%0s)", $time, "ciop_iob.v: IOB out buffer overflowed");
            repeat(5)@(posedge clk);
            `MONITOR_PATH.fail("ciop_iob.v: IOB out buffer overflowed");
        end
    end // if (ok_iob)
end // always @ (posedge cmp_gclk)




endmodule
