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


//==================================================================================================
//  Filename      : mem_io_splitter.v
//  Created On    : 2015-03-31
//  Revision      :
//  Author        : Xiaohua Liang
//  Company       : Princeton University
//  Email         : xiaohua@princeton.edu
//
//  Description   : splitter that mux mem request and io request,
//                  and demux mem response and io response
//
//
//==================================================================================================

`include "define.tmp.h"
`include "chipset_define.vh"

module mem_io_splitter(
    input wire clk,
    input wire rst,

    // We need to slightly change splitting
    // when doing UART boot
    input wire uart_boot_en,

    // rdy/val for nocs to splitter
    input wire noc1_splitter_val,
    input wire noc2_splitter_val,
    //input wire noc3_splitter_val,
    output reg splitter_noc1_rdy,
    output reg splitter_noc2_rdy,
    //output wire splitter_noc3_rdy,

    // rdy/val for splitter to nocs
    //output wire splitter_noc1_val,
    //output wire splitter_noc2_val,
    output reg splitter_noc3_val,
    //input wire noc1_splitter_rdy,
    //input wire noc2_splitter_rdy,
    input wire noc3_splitter_rdy,

    // rdy/val for splitter to mem
     output reg splitter_mem_val,
     input wire mem_splitter_rdy,

    // rdy/val for mem to splitter
     input wire mem_splitter_val,
     output reg splitter_mem_rdy,

    // rdy/val for splitter to IO
     output reg splitter_io_val,
     input wire io_splitter_rdy,

    // rdy/val for IO to splitter
     input wire io_splitter_val,
     output reg splitter_io_rdy,

    // rdy/val for splitter to noc1 sink
    input wire noc1sink_splitter_rdy,
    output reg splitter_noc1sink_val,
    
    input wire [`NOC_DATA_WIDTH-1:0] noc1_splitter_data,
    input wire [`NOC_DATA_WIDTH-1:0] noc2_splitter_data,
    // input wire [`NOC_DATA_WIDTH-1:0] noc3_splitter,

    // output wire [`NOC_DATA_WIDTH-1:0] splitter_noc1_data,
    // output wire [`NOC_DATA_WIDTH-1:0] splitter_noc2_data,
    output reg [`NOC_DATA_WIDTH-1:0] splitter_noc3_data,

    output reg [`NOC_DATA_WIDTH-1:0] splitter_noc1sink_data,

     input wire [`NOC_DATA_WIDTH-1:0] mem_splitter_data,
     output reg [`NOC_DATA_WIDTH-1:0] splitter_mem_data,

     input wire [`NOC_DATA_WIDTH-1:0] io_splitter_data,
     output reg [`NOC_DATA_WIDTH-1:0] splitter_io_data,

     output                              test_good_end,
     output                              test_bad_end 
);     

    localparam msg_state_inval = 3'd0;
    localparam msg_state_header0 = 3'd1;
    localparam msg_state_header1 = 3'd2;
    localparam msg_state_header2 = 3'd3;
    localparam msg_state_data = 3'd4;

    reg     test_good;
    reg     test_bad;
    wire    end_sent;
   
    //============================================
    // dummy passage for noc1
    //============================================
    reg [`NOC_DATA_WIDTH-1:0]    noc1_splitter_buf0_data_f;
    reg [`NOC_DATA_WIDTH-1:0]    noc1_splitter_buf1_data_f;
    reg [2:0]                    noc1_splitter_buf0_state_f;
    reg [2:0]                    noc1_splitter_buf1_state_f;

    // from noc1 to splitter buf0
    wire    stall_noc1_splitter_buf0;
    wire    noc1_splitter_go;
    wire    stall_noc1_splitter_buf1;
    wire    noc1_splitter_buf1_val;
   
    assign stall_noc1_splitter_buf0 = stall_noc1_splitter_buf1;
    assign noc1_splitter_go = splitter_noc1_rdy && noc1_splitter_val;

    always @ (*) begin
        splitter_noc1_rdy = !stall_noc1_splitter_buf0;
    end
   
    always @ (posedge clk)
    begin
        if (!rst)
        begin
            if (!stall_noc1_splitter_buf0)
            begin
                noc1_splitter_buf0_data_f <= noc1_splitter_data;
                if (noc1_splitter_go)
                begin
                    noc1_splitter_buf0_state_f <= msg_state_data; // you can load anything other than msg_state_inval
                end
                else
                begin
                    noc1_splitter_buf0_state_f <= msg_state_inval; 
                end
            end
        end
        else
        begin
            noc1_splitter_buf0_data_f <= 0;
            noc1_splitter_buf0_state_f <= msg_state_inval;	    
        end
    end

    // from splitter buf0 to buf1
    assign stall_noc1_splitter_buf1 = noc1_splitter_buf1_val && (!noc1sink_splitter_rdy);
    assign noc1_splitter_buf1_val = (noc1_splitter_buf1_state_f != msg_state_inval);

    always @ (*) begin
        splitter_noc1sink_val = noc1_splitter_buf1_val;
        splitter_noc1sink_data = noc1_splitter_buf1_data_f;
    end

    always @ (posedge clk)
    begin
        if (!rst)
        begin
            if (!stall_noc1_splitter_buf1)
            begin
                noc1_splitter_buf1_data_f <= noc1_splitter_buf0_data_f;
                noc1_splitter_buf1_state_f <= noc1_splitter_buf0_state_f; 
            end
        end
        else
        begin
       	    noc1_splitter_buf1_data_f <= 0;
            noc1_splitter_buf1_state_f <= msg_state_inval;
        end
    end

    //============================================
    // input from noc2 to splitter to io/mem
    //============================================
    reg [`NOC_DATA_WIDTH-1:0]   noc2_splitter_buf0_data_f;
    reg [`NOC_DATA_WIDTH-1:0]   noc2_splitter_buf1_data_f;
    reg [2:0]                   noc2_splitter_buf0_state_f;
    reg [2:0]                   noc2_splitter_buf1_state_f;
    reg [2:0]                   noc2_splitter_msg_state_f;
    reg [`MSG_LENGTH_WIDTH-1:0] noc2_splitter_msg_counter_f;
    reg [1:0]                   noc2_splitter_buf0_dest_f;
    reg [1:0]                   noc2_splitter_buf1_dest_f;
    reg [1:0]                   memio_splitter_rdy_mux_sel;  

    localparam msg_dest_inval = 2'd0;
    localparam msg_dest_io = 2'd1;
    localparam msg_dest_mem = 2'd2;
   
    // from noc2 to splitter buf0
    wire          noc2_splitter_go;
    wire [2:0]    noc2_splitter_msg_state_next;
    wire [1:0]    noc2_splitter_buf0_dest_next;
    wire          noc2_splitter_buf0_val;
    wire          stall_noc2_splitter_buf0;
    wire          memio_splitter_rdy_mux_out;
    wire          stall_noc2_splitter_buf1;
    wire          noc2_splitter_buf1_val;


    //assign wires
    assign  noc2_splitter_go = noc2_splitter_val && splitter_noc2_rdy;
    
    assign  noc2_splitter_msg_state_next 
            = (noc2_splitter_msg_state_f == msg_state_inval) ? msg_state_header0
            : (noc2_splitter_msg_state_f == msg_state_header0) ? msg_state_header1
            : (noc2_splitter_msg_state_f == msg_state_header1) ? msg_state_header2
            : (noc2_splitter_msg_counter_f == 0) ? msg_state_header0
            : (noc2_splitter_msg_state_f == msg_state_header2) ? msg_state_data
            : (noc2_splitter_msg_state_f == msg_state_data) ? msg_state_data
            : msg_state_inval;

    `ifdef PITON_PROTO
        `ifdef  PITONSYS_NO_MC
            assign  noc2_splitter_buf0_dest_next =  msg_dest_io;
        `else   // PITONSYS_NO_MC
            `ifdef  PITON_FPGA_BRAM_TEST
                assign  noc2_splitter_buf0_dest_next =  uart_boot_en ?   msg_dest_io                                    :
                                                        (noc2_splitter_data[`MSG_ADDR_HI_] ? msg_dest_io : msg_dest_mem);
            `else   // PITON_FPGA_BRAM_TEST
                assign  noc2_splitter_buf0_dest_next = uart_boot_en ? 
                                       (noc2_splitter_data[`MSG_ADDR_HI_:`MSG_ADDR_HI_-27] == 28'hfff0c2c ?
                                                                                         msg_dest_io      :
                                                                                         msg_dest_mem) :
                                       (noc2_splitter_data[`MSG_ADDR_HI_]    ? msg_dest_io
                                                                             : msg_dest_mem);
            `endif  // PITON_FPGA_BRAM_TEST
        `endif  // PITONSYS_NO_MC 
    `else   // For master branch memory is entirely emulated via verilog API
        assign  noc2_splitter_buf0_dest_next = noc2_splitter_data[`MSG_ADDR_HI_:`MSG_ADDR_HI_-27] == 28'hfff0c2c ?
                                                                                                    msg_dest_io      :
                                                                                                    msg_dest_mem;
    `endif // PITON_PROTO
   
    assign  noc2_splitter_buf0_val = (noc2_splitter_buf0_state_f != msg_state_inval);
    assign  stall_noc2_splitter_buf0 = stall_noc2_splitter_buf1 && (noc2_splitter_buf0_state_f != msg_state_inval);

    always @ (*) begin
        splitter_noc2_rdy = !stall_noc2_splitter_buf0;
    end
   
    always @ (posedge clk)
    begin
        if (!rst)
        begin
            if (!stall_noc2_splitter_buf0)
            begin
                noc2_splitter_buf0_data_f <= noc2_splitter_data;
                if (noc2_splitter_go)
                begin
                    //noc2_splitter_buf0_data_f <= noc2_splitter_data;
                    noc2_splitter_msg_state_f <= noc2_splitter_msg_state_next;
                    noc2_splitter_buf0_state_f <= noc2_splitter_msg_state_next;

                    if (noc2_splitter_msg_state_next == msg_state_header0)
                    begin
                        noc2_splitter_msg_counter_f <= noc2_splitter_data[`MSG_LENGTH];
                        noc2_splitter_buf0_dest_f <= msg_dest_inval; 
                    end
                    else if (noc2_splitter_msg_state_next == msg_state_header1)
                    begin
                        noc2_splitter_msg_counter_f <= noc2_splitter_msg_counter_f - 1;
                        noc2_splitter_buf0_dest_f <= noc2_splitter_buf0_dest_next; 
                    end
                    else
                    begin
                        noc2_splitter_msg_counter_f <= noc2_splitter_msg_counter_f - 1;
                    end
                end
                else
                begin
                    noc2_splitter_buf0_state_f <= msg_state_inval;
                end
            end
        end
        else
        begin
            noc2_splitter_buf0_data_f <= 0;
            noc2_splitter_buf0_state_f <= msg_state_inval;
            noc2_splitter_buf0_dest_f <= msg_dest_inval;
            noc2_splitter_msg_counter_f <= 0;
            noc2_splitter_msg_state_f <= msg_state_inval;
        end
    end

    // from buf0 to buf1
    always @ (*)
    begin
        if (noc2_splitter_buf1_dest_f != msg_dest_inval)
            memio_splitter_rdy_mux_sel = noc2_splitter_buf1_dest_f;
        else if (noc2_splitter_buf0_state_f == msg_state_header1)
            memio_splitter_rdy_mux_sel = noc2_splitter_buf0_dest_f;
        else
            memio_splitter_rdy_mux_sel = msg_dest_inval;
    end

    always @ (*)
    begin
        splitter_io_val = noc2_splitter_buf1_val && (memio_splitter_rdy_mux_sel == msg_dest_io);
        splitter_io_data = noc2_splitter_buf1_data_f;

        splitter_mem_val = noc2_splitter_buf1_val && (memio_splitter_rdy_mux_sel == msg_dest_mem);
        splitter_mem_data = noc2_splitter_buf1_data_f;
    end

    assign      memio_splitter_rdy_mux_out
                = (memio_splitter_rdy_mux_sel == msg_dest_io) ? io_splitter_rdy
                : (memio_splitter_rdy_mux_sel == msg_dest_mem) ? mem_splitter_rdy
                : 1'b0;
   
    assign      stall_noc2_splitter_buf1 = noc2_splitter_buf1_val && (!memio_splitter_rdy_mux_out);
    
    assign      noc2_splitter_buf1_val = (noc2_splitter_buf1_state_f != msg_state_inval);
   
    always @ (posedge clk)
    begin
        if (!rst)
        begin
            if (!stall_noc2_splitter_buf1)
            begin
                noc2_splitter_buf1_data_f <= noc2_splitter_buf0_data_f;
                noc2_splitter_buf1_state_f <= noc2_splitter_buf0_state_f;
                noc2_splitter_buf1_dest_f <= noc2_splitter_buf0_dest_f; 
            end
        end
        else
        begin
            noc2_splitter_buf1_data_f <= 0;
            noc2_splitter_buf1_state_f <= msg_state_inval;
            noc2_splitter_buf1_dest_f <= msg_dest_inval; 
        end
    end
   
    //============================================
    // input from io/mem to splitter to noc3
    //============================================
    reg [`NOC_DATA_WIDTH-1:0]   memio_splitter_buf0_data_f;
    reg [`NOC_DATA_WIDTH-1:0]   memio_splitter_buf1_data_f;
     reg [2:0]                   memio_splitter_buf0_state_f;
     reg [2:0]                   memio_splitter_buf1_state_f;
    reg [2:0]                   memio_splitter_msg_state_f;
    reg [`MSG_LENGTH_WIDTH-1:0] memio_splitter_msg_counter_f;
     reg [1:0]                   memio_splitter_msg_src_f;
     reg [1:0]                   memio_splitter_input_mux_sel;
    reg                         memio_splitter_val;
    reg [`NOC_DATA_WIDTH-1:0]   memio_splitter_data_mux_out;

    localparam msg_src_inval = 2'd0;
    localparam msg_src_io = 2'd1;
    localparam msg_src_mem = 2'd2;

    //from memio to splitter buf0
    wire            memio_splitter_go;
     wire            splitter_memio_rdy;   
     wire [2:0]      memio_splitter_msg_state_next;
     wire            stall_memio_splitter_buf0;
     wire            memio_splitter_buf1_val;
     wire            stall_memio_splitter_buf1;

    // assign wires
    assign      memio_splitter_go = memio_splitter_val && splitter_memio_rdy;
    assign      splitter_memio_rdy = ~stall_memio_splitter_buf0;

    assign      memio_splitter_msg_state_next 
                = (memio_splitter_msg_state_f == msg_state_inval) ? msg_state_header0
                : (memio_splitter_msg_counter_f == 0) ? msg_state_header0
                : (memio_splitter_msg_state_f == msg_state_header0) ? msg_state_data
                : (memio_splitter_msg_state_f == msg_state_data) ? msg_state_data
                : msg_state_inval;
        
    assign      stall_memio_splitter_buf0 = stall_memio_splitter_buf1;


    // choose rdy/val from mem or choose input from io
    always @ (*) begin
        if (memio_splitter_input_mux_sel == msg_src_io)
        begin
            memio_splitter_val = io_splitter_val;
            memio_splitter_data_mux_out = io_splitter_data;
            splitter_mem_rdy = 0;
            splitter_io_rdy = splitter_memio_rdy;
        end
        else
        begin
            memio_splitter_val = mem_splitter_val;
            memio_splitter_data_mux_out = mem_splitter_data;
            splitter_mem_rdy = splitter_memio_rdy;
            splitter_io_rdy = 0;	        
        end
    end

    // determine value for memio_splitter_input_mux_sel
    always @ (*) begin
        if (memio_splitter_msg_state_next != msg_state_header0)
        begin
            memio_splitter_input_mux_sel = memio_splitter_msg_src_f;
        end
        else
        begin
            if (mem_splitter_val && (!io_splitter_val))
            begin
                memio_splitter_input_mux_sel = msg_src_mem; 
            end
            else if (io_splitter_val && (!mem_splitter_val))
            begin
                memio_splitter_input_mux_sel = msg_src_io; 
            end
            else if ((!io_splitter_val) && (!mem_splitter_val))
            begin
                memio_splitter_input_mux_sel = memio_splitter_msg_src_f; 
            end
            else
            begin
                if (memio_splitter_msg_src_f == msg_src_mem)
                begin
                    memio_splitter_input_mux_sel = msg_src_io; 
                end
                else
                begin
                   memio_splitter_input_mux_sel = msg_src_mem; 
                end
            end
        end
    end

    // pipeline states and data
    always @ (posedge clk)
    begin
        if (!rst)
        begin
            if (!stall_memio_splitter_buf0)
                begin
                    memio_splitter_buf0_data_f <= memio_splitter_data_mux_out;
                    if (memio_splitter_go)
                    begin
                        memio_splitter_msg_state_f <= memio_splitter_msg_state_next;
                        memio_splitter_buf0_state_f <= memio_splitter_msg_state_next; 
                    if (memio_splitter_msg_state_next == msg_state_header0)
                    begin
                        memio_splitter_msg_counter_f <= memio_splitter_data_mux_out[`MSG_LENGTH];
                        memio_splitter_msg_src_f <= memio_splitter_input_mux_sel;
                    end
                    else
                    begin
                        memio_splitter_msg_counter_f <= memio_splitter_msg_counter_f - 1;
                    end
                end
                else
                begin
                    memio_splitter_buf0_state_f <= msg_state_inval;
                end
            end
        end
        else
        begin
            memio_splitter_buf0_data_f <= 0;
            memio_splitter_buf0_state_f <= msg_state_inval;
            memio_splitter_msg_counter_f <= 0;
            memio_splitter_msg_state_f <= msg_state_inval;
            memio_splitter_msg_src_f <= msg_src_inval; 
        end
    end

    //from splitter buf0 to splitter buf1
    assign memio_splitter_buf1_val = (memio_splitter_buf1_state_f != msg_state_inval);
    assign stall_memio_splitter_buf1 = memio_splitter_buf1_val && (!noc3_splitter_rdy);
    always @ (*)
    begin
        splitter_noc3_val = memio_splitter_buf1_val;
        splitter_noc3_data = memio_splitter_buf1_data_f; 
    end
    
    always @ (posedge clk)
    begin
        if (!rst)
        begin
            if (!stall_memio_splitter_buf1)
            begin
                memio_splitter_buf1_data_f <= memio_splitter_buf0_data_f;
                memio_splitter_buf1_state_f <= memio_splitter_buf0_state_f;
            end
        end
        else
        begin
            memio_splitter_buf1_data_f <= 0;
            memio_splitter_buf1_state_f <= msg_state_inval;
        end
    end

// Asm Test end address check
    always @(posedge clk) begin
        if (rst)
            test_good <= 1'b0;
        else
            test_good <= (noc2_splitter_msg_state_f == msg_state_header0) &
                         noc2_splitter_val   &
                         (noc2_splitter_data[`MSG_ADDR_HI_:`MSG_ADDR_HI_-39] == `PITON_TEST_GOOD_END)   ? 1'b1 :
                         end_sent                                                                       ? 1'b0 : test_good;
    end

    always @(posedge clk) begin
        if (rst)
            test_bad <= 1'b0;
        else
            test_bad <= (noc2_splitter_msg_state_f == msg_state_header0) &
                        noc2_splitter_val   &
                        (noc2_splitter_data[`MSG_ADDR_HI_:`MSG_ADDR_HI_-39] == `PITON_TEST_BAD_END)     ? 1'b1  :
                        end_sent                                                                        ? 1'b0  : test_bad;
    end

    assign end_sent =   (test_good | test_bad) &
                        (noc2_splitter_msg_counter_f == 0);

    assign test_good_end = test_good & end_sent;
    assign test_bad_end = test_bad & end_sent;

endmodule
  
