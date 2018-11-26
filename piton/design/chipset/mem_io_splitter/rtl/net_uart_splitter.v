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

module net_uart_splitter (
    input   wire                            clk,
    input   wire                            rst_n,

    // NOC1 interface is not used so far
        input   wire                            noc1_splitter_val,
        input   wire [`NOC_DATA_WIDTH-1:0]      noc1_splitter_data,
        output  reg                             splitter_noc1_rdy,

        output  reg                             splitter_noc1sink_val,
        output  reg     [`NOC_DATA_WIDTH-1:0]   splitter_noc1sink_data,
        input   wire                            noc1sink_splitter_rdy,
    // NOC1 interface is not used so far

     input   wire                            noc2_splitter_val,
     input   wire    [`NOC_DATA_WIDTH-1:0]   noc2_splitter_data,
     output  reg                             splitter_noc2_rdy,

    output  reg                             splitter_noc3_val,
    output  reg     [`NOC_DATA_WIDTH-1:0]   splitter_noc3_data,
    input   wire                            noc3_splitter_rdy,

     output  reg                             splitter_uart_val,
     output  reg     [`NOC_DATA_WIDTH-1:0]   splitter_uart_data,
     input   wire                            uart_splitter_rdy,

     input   wire                            uart_splitter_val,
     input   wire    [`NOC_DATA_WIDTH-1:0]   uart_splitter_data,
     output  reg                             splitter_uart_rdy,

     output  reg                             splitter_net_val,
     output  reg     [`NOC_DATA_WIDTH-1:0]   splitter_net_data,      
     input   wire                            net_splitter_rdy,

     input   wire                            net_splitter_val,
     input   wire    [`NOC_DATA_WIDTH-1:0]   net_splitter_data,
     output  reg                             splitter_net_rdy
);     

    localparam msg_state_inval = 3'd0;
    localparam msg_state_header0 = 3'd1;
    localparam msg_state_header1 = 3'd2;
    localparam msg_state_header2 = 3'd3;
    localparam msg_state_data = 3'd4;
   
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

    always @ (*)
    begin
        if (!rst_n)
        begin
            splitter_noc1_rdy = !stall_noc1_splitter_buf0;
        end
        else
        begin
          splitter_noc1_rdy = 0;
        end
    end
   
    always @ (posedge clk)
    begin
        if (!rst_n)
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

    always @ (*)
    begin
        if (!rst_n)
        begin
            splitter_noc1sink_val = noc1_splitter_buf1_val;
            splitter_noc1sink_data = noc1_splitter_buf1_data_f;
        end
        else
        begin
            splitter_noc1sink_val = 0;
            splitter_noc1sink_data = 0;
        end
    end

    always @ (posedge clk)
    begin
        if (!rst_n)
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
    reg [1:0]                   memnet_splitter_rdy_mux_sel;  

    localparam MSG_DEST_INVAL   = 2'd0;
    localparam MSG_DEST_NET     = 2'd1;
    localparam MSG_DEST_UART    = 2'd2;
   
    // from noc2 to splitter buf0
     wire          noc2_splitter_go;
    wire [2:0]    noc2_splitter_msg_state_next;
     wire [1:0]    noc2_splitter_buf0_dest_next;
    wire          noc2_splitter_buf0_val;
     wire          stall_noc2_splitter_buf0;
    wire          memnet_splitter_rdy_mux_out;
    wire          stall_noc2_splitter_buf1;
    wire          noc2_splitter_buf1_val;


    //assign wires
    assign  noc2_splitter_go = noc2_splitter_val && splitter_noc2_rdy;
    
    assign  noc2_splitter_msg_state_next 
            = (rst_n) ? msg_state_inval
            : (noc2_splitter_msg_state_f == msg_state_inval) ? msg_state_header0
            : (noc2_splitter_msg_state_f == msg_state_header0) ? msg_state_header1
            : (noc2_splitter_msg_state_f == msg_state_header1) ? msg_state_header2
            : (noc2_splitter_msg_counter_f == 0) ? msg_state_header0
            : (noc2_splitter_msg_state_f == msg_state_header2) ? msg_state_data
            : (noc2_splitter_msg_state_f == msg_state_data) ? msg_state_data
            : msg_state_inval;

    assign  noc2_splitter_buf0_dest_next 
            = (rst_n) ? MSG_DEST_INVAL
            :   (noc2_splitter_data[`MSG_ADDR_HI_ : `MSG_ADDR_HI_-19] == 20'hfff0d) ? MSG_DEST_NET
            : MSG_DEST_UART;
   
    assign  noc2_splitter_buf0_val = (noc2_splitter_buf0_state_f != msg_state_inval);
    assign  stall_noc2_splitter_buf0 = stall_noc2_splitter_buf1 && (noc2_splitter_buf0_state_f != msg_state_inval);

    always @ (*)
    begin
        if (!rst_n)
        begin
            splitter_noc2_rdy = !stall_noc2_splitter_buf0;
        end
        else
        begin
            splitter_noc2_rdy = 0;
        end
    end
   
    always @ (posedge clk)
    begin
        if (!rst_n)
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
                        noc2_splitter_buf0_dest_f <= MSG_DEST_INVAL; 
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
            noc2_splitter_buf0_dest_f <= MSG_DEST_INVAL;
            noc2_splitter_msg_counter_f <= 0;
            noc2_splitter_msg_state_f <= msg_state_inval;
        end
    end

    // from buf0 to buf1
    always @ (*)
    begin
        if (noc2_splitter_buf1_dest_f != MSG_DEST_INVAL)
            memnet_splitter_rdy_mux_sel = noc2_splitter_buf1_dest_f;
        else if (noc2_splitter_buf0_state_f == msg_state_header1)
            memnet_splitter_rdy_mux_sel = noc2_splitter_buf0_dest_f;
        else
            memnet_splitter_rdy_mux_sel = MSG_DEST_INVAL;
    end

    always @ (*)
    begin
        splitter_net_val = noc2_splitter_buf1_val && (memnet_splitter_rdy_mux_sel == MSG_DEST_NET);
        splitter_net_data = noc2_splitter_buf1_data_f;

        splitter_uart_val = noc2_splitter_buf1_val && (memnet_splitter_rdy_mux_sel == MSG_DEST_UART);
        splitter_uart_data = noc2_splitter_buf1_data_f;
    end

    assign      memnet_splitter_rdy_mux_out
                = (memnet_splitter_rdy_mux_sel == MSG_DEST_NET) ? net_splitter_rdy
                : (memnet_splitter_rdy_mux_sel == MSG_DEST_UART) ? uart_splitter_rdy
                : 1'b0;
   
    assign      stall_noc2_splitter_buf1 = noc2_splitter_buf1_val && (!memnet_splitter_rdy_mux_out);
    
    assign      noc2_splitter_buf1_val = (noc2_splitter_buf1_state_f != msg_state_inval);
   
    always @ (posedge clk)
    begin
        if (!rst_n)
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
            noc2_splitter_buf1_dest_f <= MSG_DEST_INVAL; 
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
    reg                         memnet_splitter_val;
    reg [`NOC_DATA_WIDTH-1:0]   memnet_splitter_data_mux_out;

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
    assign      memio_splitter_go = memnet_splitter_val && splitter_memio_rdy;
    assign      splitter_memio_rdy = (rst_n) ? 1'b0 : !stall_memio_splitter_buf0;

    assign      memio_splitter_msg_state_next 
                = (rst_n) ? msg_state_inval
                : (memio_splitter_msg_state_f == msg_state_inval) ? msg_state_header0
                : (memio_splitter_msg_counter_f == 0) ? msg_state_header0
                : (memio_splitter_msg_state_f == msg_state_header0) ? msg_state_data
                : (memio_splitter_msg_state_f == msg_state_data) ? msg_state_data
                : msg_state_inval;
        
    assign      stall_memio_splitter_buf0 = stall_memio_splitter_buf1;


    // choose rdy/val from mem or choose input from io
    always @ (*)
    begin
        if (!rst_n)
        begin
            if (memio_splitter_input_mux_sel == msg_src_io)
            begin
                memnet_splitter_val = net_splitter_val;
                memnet_splitter_data_mux_out = net_splitter_data;
                splitter_uart_rdy = 0;
                splitter_net_rdy = splitter_memio_rdy;
            end
            else
            begin
                memnet_splitter_val = uart_splitter_val;
                memnet_splitter_data_mux_out = uart_splitter_data;
                splitter_uart_rdy = splitter_memio_rdy;
                splitter_net_rdy = 0;	        
            end
        end
        else
        begin
            memnet_splitter_val = 0;
            memnet_splitter_data_mux_out = 0;
            splitter_uart_rdy = 0;
  	        splitter_net_rdy = 0;	   
        end
    end

    // determine value for memio_splitter_input_mux_sel
    always @ (*)
    begin
        if (!rst_n)
        begin
            if (memio_splitter_msg_state_next != msg_state_header0)
            begin
                memio_splitter_input_mux_sel = memio_splitter_msg_src_f;
            end
            else
            begin
                if (uart_splitter_val && (!net_splitter_val))
                begin
                    memio_splitter_input_mux_sel = msg_src_mem; 
                end
                else if (net_splitter_val && (!uart_splitter_val))
                begin
                    memio_splitter_input_mux_sel = msg_src_io; 
                end
                else if ((!net_splitter_val) && (!uart_splitter_val))
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
        else
        begin
            memio_splitter_input_mux_sel = msg_src_inval; //need sone checking 
        end
    end

    // pipeline states and data
    always @ (posedge clk)
    begin
        if (!rst_n)
        begin
            if (!stall_memio_splitter_buf0)
                begin
                    memio_splitter_buf0_data_f <= memnet_splitter_data_mux_out;
                    if (memio_splitter_go)
                    begin
                        memio_splitter_msg_state_f <= memio_splitter_msg_state_next;
                        memio_splitter_buf0_state_f <= memio_splitter_msg_state_next; 
                    if (memio_splitter_msg_state_next == msg_state_header0)
                    begin
                        memio_splitter_msg_counter_f <= memnet_splitter_data_mux_out[`MSG_LENGTH];
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
        if (!rst_n)
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
endmodule
  
