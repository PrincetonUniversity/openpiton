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
//  Filename      : iosplitter_axi_lite.v
//  Created On    : 2015-04-20
//  Last Modified : 2015-04-20
//  Revision      :
//  Author        : Xiaohua Liang
//  Company       : Princeton University
//  Email         : xiaohua@princeton.edu
//
//  Description   : translate the incoming request to io port from mem/io splitter
//                  into axi lite data interface, with 64 bit data/address
//                  note that the output of this module is an axi lite master output
//                  so the output/input is the opposite from the slave's perspective
//  Note          : currently, MSG_TYPE_LOAD_MEM_ACK/MSG_TYPE_STORE_MEM_ACK and
//                  MSG_TYPE_LOAD_MEM/MSG_TYPE_STORE_MEM are being used, may
//                  need to switch to NC variant
//==================================================================================================

`include "define.vh"
`define C_M_AXI_LITE_DATA_WIDTH  `NOC_DATA_WIDTH
`define C_M_AXI_LITE_ADDR_WIDTH  `NOC_DATA_WIDTH
`define C_M_AXI_LITE_RESP_WIDTH  2

module iosplitter_axi_lite(
    input wire clk,
    input wire rst,
			   
    //signal from the splitter
    // rdy/val for splitter to IO
    //connect to signal of the same name in mem_io_splitter.
    input wire splitter_io_val,
    output reg io_splitter_rdy,

    // rdy/val for IO to splitter
    output reg io_splitter_val,
    input wire splitter_io_rdy,

    //data to and from splitter
    output reg [`NOC_DATA_WIDTH-1:0] io_splitter_data,
    input wire [`NOC_DATA_WIDTH-1:0] splitter_io_data,
			   
    //axi lite signals			   
    //write address channel
    output reg [`C_M_AXI_LITE_ADDR_WIDTH-1:0] m_axi_awaddr,
    output reg m_axi_awvalid,
    input  m_axi_awready,

    //write data channel
    output reg [`C_M_AXI_LITE_DATA_WIDTH-1:0] m_axi_wdata,
    output reg [`C_M_AXI_LITE_DATA_WIDTH/8-1:0] m_axi_wstrb,
    output reg m_axi_wvalid,
    input wire m_axi_wready,

    //read address channel
    output reg [`C_M_AXI_LITE_ADDR_WIDTH-1:0] m_axi_araddr,
    output reg m_axi_arvalid,
    input  m_axi_arready,

    //read data channel
    input wire [`C_M_AXI_LITE_DATA_WIDTH-1:0] m_axi_rdata,
    input wire [`C_M_AXI_LITE_RESP_WIDTH-1:0] m_axi_rresp,
    input wire m_axi_rvalid,
    output reg m_axi_rready,

    //write response channel
    input wire [`C_M_AXI_LITE_RESP_WIDTH-1:0] m_axi_bresp,
    input wire m_axi_bvalid,
    output reg m_axi_bready

    // two addr protect constant port not included yet...
    
);
    localparam msg_state_inval = 3'd0;
    localparam msg_state_header0 = 3'd1;
    localparam msg_state_header1 = 3'd2;
    localparam msg_state_header2 = 3'd3;
    localparam msg_state_data = 3'd4;

    localparam msg_type_inval = 2'd0;
    localparam msg_type_load = 2'd1;
    localparam msg_type_store = 2'd2;

    localparam buf_status_incomp = 2'd0; // buffer not filled by one complete request/response, more like space available
    localparam buf_status_comp = 2'd1; // buffer contains a complete request, but hasn't send it out yet
    localparam buf_status_waitresp = 2'd2; // request sent out to axi, but has not get response yet
    localparam buf_status_respsend = 2'd3; // the buffer is waiting to send out the response to splitter

    // regs to keep track of incoming data for parsing
    reg [2:0]                   splitter_io_msg_state_f;
    reg [1:0]                   splitter_io_msg_type_f;
    reg [`MSG_LENGTH_WIDTH-1:0] splitter_io_msg_counter_f;
    
     
    // buffer register for load requests
    reg [`NOC_DATA_WIDTH-1:0] r_req_buf_header0_f;
    reg [`NOC_DATA_WIDTH-1:0] r_req_buf_header1_f;
    reg [`NOC_DATA_WIDTH-1:0] r_req_buf_header2_f;
    reg [1:0]                 r_req_buf_status_f; 
    

    // buffer register for store requests
    reg [`NOC_DATA_WIDTH-1:0] w_req_buf_header0_f;
    reg [`NOC_DATA_WIDTH-1:0] w_req_buf_header1_f;
    reg [`NOC_DATA_WIDTH-1:0] w_req_buf_header2_f;
    reg [`NOC_DATA_WIDTH-1:0] w_req_buf_data0_f;
    wire[1:0]                 w_req_buf_status;
    reg [1:0]                 w_addr_req_buf_status_f;
    reg [1:0]                 w_data_req_buf_status_f; 

    // buffer register for write response
    reg [`NOC_DATA_WIDTH-1:0]            w_resp_buf_header0_f;
    reg [`C_M_AXI_LITE_RESP_WIDTH-1:0]   w_resp_buf_bresp_f;
    wire[1:0]                            w_resp_buf_status;
    
    reg[1:0]                             w_addr_resp_buf_status_f;
    reg[1:0]                             w_data_resp_buf_status_f;
	 		      
    // buffer register for read response
    reg [`NOC_DATA_WIDTH-1:0]            r_resp_buf_header0_f;
    reg [`C_M_AXI_LITE_DATA_WIDTH-1:0]   r_resp_buf_data0_f;
    reg [`C_M_AXI_LITE_RESP_WIDTH-1:0]   r_resp_buf_rresp_f;
    reg [1:0]                            r_resp_buf_status_f;

    // buff status check can be improved
    wire    splitter_io_go;
    wire    splitter_io_load_go;
    wire    splitter_io_store_go;

    wire    splitter_io_msg_is_load;
    wire    splitter_io_msg_is_store;
    wire    splitter_io_msg_is_load_next;
    wire    splitter_io_msg_is_store_next;

    wire [2:0]    splitter_io_msg_state_next;
    wire [2:0]    splitter_io_msg_type_mux_out;
    wire [2:0]    splitter_io_msg_type_next;

    assign  w_req_buf_status = ((w_addr_req_buf_status_f == buf_status_incomp) && (w_data_req_buf_status_f == buf_status_incomp)) ? buf_status_incomp
                                        : buf_status_comp;
   
    assign  w_resp_buf_status = ((w_addr_resp_buf_status_f == buf_status_incomp) || (w_data_resp_buf_status_f == buf_status_incomp)) ? buf_status_incomp
                                        : ((w_addr_resp_buf_status_f == buf_status_comp) || (w_data_resp_buf_status_f == buf_status_comp)) ? buf_status_comp
                                        : ((w_addr_resp_buf_status_f == buf_status_waitresp) || (w_data_resp_buf_status_f == buf_status_waitresp)) ? buf_status_waitresp
                                        : buf_status_respsend;

    assign  splitter_io_go = splitter_io_val && io_splitter_rdy;
    assign  splitter_io_load_go = splitter_io_msg_is_load_next && splitter_io_val && (r_req_buf_status_f == buf_status_incomp);
    assign  splitter_io_store_go = splitter_io_msg_is_store_next && splitter_io_val && (w_req_buf_status == buf_status_incomp);

    assign  splitter_io_msg_is_load = (splitter_io_msg_type_f == msg_type_load);
    assign  splitter_io_msg_is_store = (splitter_io_msg_type_f == msg_type_store);
    assign  splitter_io_msg_is_load_next = (splitter_io_msg_type_next == msg_type_load);
    assign  splitter_io_msg_is_store_next = (splitter_io_msg_type_next == msg_type_store);

    assign  splitter_io_msg_state_next = (rst) ? msg_state_inval
                                        : (splitter_io_msg_state_f == msg_state_inval) ? msg_state_header0
                                        : (splitter_io_msg_state_f == msg_state_header0) ? msg_state_header1
                                        : (splitter_io_msg_state_f == msg_state_header1) ? msg_state_header2
                                        : (splitter_io_msg_counter_f == 0) ? msg_state_header0
                                        : (splitter_io_msg_state_f == msg_state_header2) ? msg_state_data
                                        : (splitter_io_msg_state_f == msg_state_data) ? msg_state_data
                                        : msg_state_inval;

    assign  splitter_io_msg_type_mux_out = (rst) ? msg_type_inval
                                        : ((splitter_io_data[`MSG_TYPE] == `MSG_TYPE_LOAD_REQ) || 
                                            (splitter_io_data[`MSG_TYPE] == `MSG_TYPE_NC_LOAD_REQ) ||
                                            (splitter_io_data[`MSG_TYPE] == `MSG_TYPE_LOAD_MEM)) ? msg_type_load
                                        : ((splitter_io_data[`MSG_TYPE] == `MSG_TYPE_STORE_REQ) ||
                                            (splitter_io_data[`MSG_TYPE] == `MSG_TYPE_NC_STORE_REQ) ||
                                            (splitter_io_data[`MSG_TYPE] == `MSG_TYPE_STORE_MEM)) ? msg_type_store
                                        : msg_type_inval;
    
    assign  splitter_io_msg_type_next = (rst) ? msg_type_inval
                                        : (splitter_io_msg_state_next == msg_state_inval) ? msg_type_inval
                                        : (splitter_io_msg_state_next == msg_state_header0) ? splitter_io_msg_type_mux_out
                                        : splitter_io_msg_type_f;
   
    always @ (*)
    begin
        if (!rst)
        begin
            io_splitter_rdy = (splitter_io_msg_type_next == msg_type_inval)
                            || (splitter_io_msg_is_load_next && (r_req_buf_status_f == buf_status_incomp))
                            || (splitter_io_msg_is_store_next && (w_req_buf_status == buf_status_incomp));
        end
        else
        begin
            io_splitter_rdy = 0;
        end
    end

    // sequential logic to load information from splitter
    always @ (posedge clk)
    begin
        if (!rst)
        begin
            if (splitter_io_go)
            begin
                splitter_io_msg_state_f <= splitter_io_msg_state_next;
                if (splitter_io_msg_state_next == msg_state_header0)
                begin
                    splitter_io_msg_counter_f <= splitter_io_data[`MSG_LENGTH];
                end
                else
                begin
                    splitter_io_msg_counter_f <= splitter_io_msg_counter_f - 1;
                end
                splitter_io_msg_type_f <= splitter_io_msg_type_next;

                if (splitter_io_load_go)
                begin
                    if (splitter_io_msg_state_next == msg_state_header0)
                    begin
                        r_req_buf_header0_f <= splitter_io_data;
                    end
                    else if (splitter_io_msg_state_next == msg_state_header1)
                    begin
                        r_req_buf_header1_f <= splitter_io_data;
                    end
                    else if (splitter_io_msg_state_next == msg_state_header2)
                    begin
                        r_req_buf_header2_f <= splitter_io_data;
                        r_req_buf_status_f <= buf_status_comp;
                    end
                end // if (splitter_io_load_go)

                if (splitter_io_store_go)
                begin
                    if (splitter_io_msg_state_next == msg_state_header0)
                    begin
                        w_req_buf_header0_f <= splitter_io_data;
                    end
                    else if (splitter_io_msg_state_next == msg_state_header1)
                    begin
                        w_req_buf_header1_f <= splitter_io_data;
                    end
                    else if (splitter_io_msg_state_next == msg_state_header2)
                    begin
                        w_req_buf_header2_f <= splitter_io_data;
                    end
                    if (splitter_io_msg_state_next == msg_state_data)
                    begin
                        w_req_buf_data0_f <= splitter_io_data;
                        if (splitter_io_msg_counter_f == `MSG_LENGTH_WIDTH'd1)
                        begin
                            w_addr_req_buf_status_f <= buf_status_comp;
                            w_data_req_buf_status_f <= buf_status_comp;
                        end
                    end
                end
            end
        end
        else
        begin
            splitter_io_msg_state_f <= msg_state_inval;
            splitter_io_msg_type_f <= msg_type_inval;

            r_req_buf_header0_f <= 0;
            r_req_buf_header1_f <= 0;
            r_req_buf_header2_f <= 0;
            r_req_buf_status_f <= buf_status_incomp;

            w_req_buf_header0_f <= 0;
            w_req_buf_header1_f <= 0;
            w_req_buf_header2_f <= 0;
            w_req_buf_data0_f <= 0;
            w_addr_req_buf_status_f <= buf_status_incomp;
            w_data_req_buf_status_f <= buf_status_incomp;

            w_resp_buf_header0_f <= 0;
            w_resp_buf_bresp_f <= 0;
            w_data_resp_buf_status_f <= buf_status_incomp;
            w_addr_resp_buf_status_f <= buf_status_incomp;

            r_resp_buf_header0_f <= 0;
            r_resp_buf_data0_f <= 0;
            r_resp_buf_rresp_f <= 0;
            r_resp_buf_status_f <= buf_status_incomp;
            splitter_io_msg_counter_f <= 0;
        end
    end

    wire [`NOC_DATA_WIDTH-1:0] paddings;
    assign paddings = 0;
   // send out requests to axi
    always @ (*)
    begin
        if (!rst)
        begin
            m_axi_awvalid = (w_req_buf_status == buf_status_comp) && (w_addr_resp_buf_status_f == buf_status_incomp);
            m_axi_wvalid  = (w_req_buf_status == buf_status_comp) && (w_data_resp_buf_status_f == buf_status_incomp);
            m_axi_arvalid = (r_req_buf_status_f == buf_status_comp) && (r_resp_buf_status_f == buf_status_incomp);
            
            //m_axi_awaddr = w_req_buf_header1_f[`C_M_AXI_LITE_ADDR_WIDTH-1:0]; // should be sending the whole signal if data_width == 64
            m_axi_awaddr = {paddings[`NOC_DATA_WIDTH-1:`PHY_ADDR_WIDTH], w_req_buf_header1_f[`MSG_ADDR_HI_:3], 3'b100};
            m_axi_wdata = w_req_buf_data0_f[`C_M_AXI_LITE_DATA_WIDTH-1:0];
            //m_axi_araddr = r_req_buf_header1_f[`C_M_AXI_LITE_ADDR_WIDTH-1:0];
            m_axi_araddr = {paddings[`NOC_DATA_WIDTH-1:`PHY_ADDR_WIDTH], r_req_buf_header1_f[`MSG_ADDR_HI_:3], 3'b000};

            // decode data_size, only support write to one word maximum
            if (w_req_buf_header1_f[`MSG_DATA_SIZE_] == `MSG_DATA_SIZE_0B)
            begin
                m_axi_wstrb = 8'b00000000;
            end
            else if (w_req_buf_header1_f[`MSG_DATA_SIZE_] == `MSG_DATA_SIZE_1B)
            begin
                m_axi_wstrb = 8'b00000001;
            end
            else if (w_req_buf_header1_f[`MSG_DATA_SIZE_] == `MSG_DATA_SIZE_2B)
            begin
                m_axi_wstrb = 8'b00000011;
            end
            else if (w_req_buf_header1_f[`MSG_DATA_SIZE_] == `MSG_DATA_SIZE_4B)
            begin
                m_axi_wstrb = 8'b00001111;
            end
            else if (w_req_buf_header1_f[`MSG_DATA_SIZE_] == `MSG_DATA_SIZE_8B)
            begin
                m_axi_wstrb = 8'b11111111;
            end
            else
            begin
                m_axi_wstrb = 8'b11111111;
            end

          end
        else
        begin
            m_axi_awvalid = 0;
            m_axi_wvalid  = 0;
            m_axi_arvalid = 0;
            m_axi_awaddr = 0;
            m_axi_wdata = 0;
            m_axi_araddr = 0;
            m_axi_wstrb = 0;
        end
    end

    wire m_axi_ar_go;
    wire m_axi_w_go;
    wire m_axi_aw_go;

    // form read resp/load ack msg header;
    wire [`NOC_DATA_WIDTH-1:0] r_resp_buf_header0_next;
    wire [`NOC_DATA_WIDTH-1:0] w_resp_buf_header0_next;

    assign m_axi_ar_go = m_axi_arvalid && m_axi_arready;
    assign m_axi_w_go = m_axi_wvalid & m_axi_wready;
    assign m_axi_aw_go = m_axi_awvalid & m_axi_awready;

    assign r_resp_buf_header0_next[`MSG_DST_CHIPID] = r_req_buf_header2_f[`MSG_SRC_CHIPID_];
    assign r_resp_buf_header0_next[`MSG_DST_X] = r_req_buf_header2_f[`MSG_SRC_X_];
    assign r_resp_buf_header0_next[`MSG_DST_Y] = r_req_buf_header2_f[`MSG_SRC_Y_];
    assign r_resp_buf_header0_next[`MSG_DST_FBITS] = r_req_buf_header2_f[`MSG_SRC_FBITS_]; //TODO check this...
    assign r_resp_buf_header0_next[`MSG_LENGTH] = `MSG_LENGTH_WIDTH'd8; //none NC loads always return 8 words
    assign r_resp_buf_header0_next[`MSG_TYPE] = `MSG_TYPE_LOAD_MEM_ACK; //TODO check this
    assign r_resp_buf_header0_next[`MSG_MSHRID] = r_req_buf_header0_f[`MSG_MSHRID];//TODO check this...
    assign r_resp_buf_header0_next[`MSG_OPTIONS_1] = 0; //reserved bits

    assign w_resp_buf_header0_next[`MSG_DST_CHIPID] = w_req_buf_header2_f[`MSG_SRC_CHIPID_];
    assign w_resp_buf_header0_next[`MSG_DST_X] = w_req_buf_header2_f[`MSG_SRC_X_];
    assign w_resp_buf_header0_next[`MSG_DST_Y] = w_req_buf_header2_f[`MSG_SRC_Y_];
    assign w_resp_buf_header0_next[`MSG_DST_FBITS] = w_req_buf_header2_f[`MSG_SRC_FBITS_]; //TODO check this...
    assign w_resp_buf_header0_next[`MSG_LENGTH] = 0;
    assign w_resp_buf_header0_next[`MSG_TYPE] = `MSG_TYPE_NC_STORE_MEM_ACK;
    assign w_resp_buf_header0_next[`MSG_MSHRID] = w_req_buf_header0_f[`MSG_MSHRID];//TODO check this...
    assign w_resp_buf_header0_next[`MSG_OPTIONS_1] = 0; //reserved bits
   
    always @ (posedge clk)
    begin
        if (!rst)
        begin
            if (m_axi_ar_go)
            begin
              r_req_buf_status_f <= buf_status_incomp;
              r_resp_buf_header0_f <= r_resp_buf_header0_next;
              r_resp_buf_status_f <= buf_status_waitresp;
            end
            if (m_axi_aw_go)
            begin
                w_addr_req_buf_status_f <= buf_status_incomp;
                w_resp_buf_header0_f <= w_resp_buf_header0_next;
                w_addr_resp_buf_status_f <= buf_status_waitresp;
            end
            if (m_axi_w_go)
            begin
                w_data_req_buf_status_f <= buf_status_incomp;
                w_data_resp_buf_status_f <= buf_status_waitresp;
            end
        end
    end


    // getting response
    always @(*)
    begin
        if (!rst)
        begin
            m_axi_rready = (r_resp_buf_status_f == buf_status_waitresp);
            m_axi_bready = (w_resp_buf_status == buf_status_waitresp);
        end
        else
        begin
            m_axi_rready = 0;
            m_axi_bready = 0;
        end
    end

    wire                       m_axi_b_go;
    wire                       m_axi_r_go;
    wire [`NOC_DATA_WIDTH-1:0] a_axi_rdata_masked;
    assign m_axi_b_go = m_axi_bready && m_axi_bvalid;
    assign m_axi_r_go = m_axi_rready && m_axi_rvalid;
    assign a_axi_rdata_masked = {m_axi_rdata[7:0], m_axi_rdata[7:0], m_axi_rdata[7:0], m_axi_rdata[7:0], m_axi_rdata[7:0], m_axi_rdata[7:0], m_axi_rdata[7:0], m_axi_rdata[7:0]};

    always @(posedge clk)
    begin
        if (!rst)
        begin
        if (m_axi_r_go)
        begin
            r_resp_buf_status_f <= buf_status_respsend;
            r_resp_buf_data0_f <= a_axi_rdata_masked;
            r_resp_buf_rresp_f <= m_axi_rresp;
        end
        if (m_axi_b_go)
        begin
            w_data_resp_buf_status_f <= buf_status_respsend;
            w_addr_resp_buf_status_f <= buf_status_respsend;
            w_resp_buf_bresp_f <= m_axi_bresp;
        end
        end // if (!rst)
        else
        begin

        end
    end // always @ (posedge clk)

   //form load/store ack signal and send back to nocs
    localparam load_ack = 1'd0;
    localparam store_ack = 1'd1;

    reg [`MSG_LENGTH_WIDTH-1:0] io_splitter_ack_load_counter_f;
    reg                         io_splitter_arb_f;
    reg                         io_splitter_ack_mux_sel;
    
    
    wire                        r_resp_buf_val;
    wire                        w_resp_buf_val;   
    wire [`NOC_DATA_WIDTH-1:0]  io_splitter_ack_store;
    wire [`NOC_DATA_WIDTH-1:0]  io_splitter_ack_load;
    wire                        io_splitter_ack_load_go;
    wire                        io_splitter_ack_store_go;
    

    assign  r_resp_buf_val = (r_resp_buf_status_f == buf_status_respsend);
    assign  w_resp_buf_val = (w_resp_buf_status == buf_status_respsend);

    assign  io_splitter_ack_store = w_resp_buf_header0_f;
    assign  io_splitter_ack_load = (io_splitter_ack_load_counter_f == r_resp_buf_header0_f[`MSG_LENGTH]) ? r_resp_buf_header0_f
                                                       : r_resp_buf_data0_f;

    assign  io_splitter_ack_load_go = (io_splitter_ack_mux_sel == load_ack) && (r_resp_buf_val) && splitter_io_rdy;
    assign  io_splitter_ack_store_go = (io_splitter_ack_mux_sel == store_ack) && (w_resp_buf_val) && splitter_io_rdy;

    always @ (*)
    begin
        // val flag and output to splitter
        if (io_splitter_ack_mux_sel == load_ack)
        begin
            io_splitter_val = r_resp_buf_val;
            io_splitter_data = io_splitter_ack_load;
        end
        else
        begin
            io_splitter_val = w_resp_buf_val;
            io_splitter_data = io_splitter_ack_store;
        end
    end

    always @ (*)
    begin
        if (!rst)
        begin
            // mux control to select load ack or store ack
            if (r_resp_buf_val && (!w_resp_buf_val))
            begin
                io_splitter_ack_mux_sel = load_ack;
            end
            else if (w_resp_buf_val && (!r_resp_buf_val))
            begin
                io_splitter_ack_mux_sel = store_ack;
            end
            else if (w_resp_buf_val && r_resp_buf_val)
            begin
                if(io_splitter_ack_load_counter_f == r_resp_buf_header0_f[`MSG_LENGTH])
                begin
                    io_splitter_ack_mux_sel = io_splitter_arb_f;
                end
                else
                begin
                    io_splitter_ack_mux_sel = load_ack;
                end
            end
            else
            begin
                io_splitter_ack_mux_sel = load_ack;
            end
        end
        else
        begin
            io_splitter_ack_mux_sel = 0;
            io_splitter_val = 0;
            io_splitter_data = 0;
        end
    end
   
    always @(posedge clk)
    begin
        if (!rst)
        begin
            // update arbitration reg
            if (w_resp_buf_val && r_resp_buf_val && io_splitter_ack_load_go)
            begin
                io_splitter_arb_f <= store_ack;
            end
            else if (w_resp_buf_val && r_resp_buf_val && io_splitter_ack_store_go)
            begin
                io_splitter_arb_f <= load_ack;
            end

            //update r_resp status and counter
            if (r_resp_buf_status_f == buf_status_waitresp)
            begin
                io_splitter_ack_load_counter_f <= r_resp_buf_header0_f[`MSG_LENGTH];
            end
            else if(io_splitter_ack_load_go)
            begin
                if (io_splitter_ack_load_counter_f == 0)
                begin
                    r_resp_buf_status_f <= buf_status_incomp;
                end
                else
                begin
                    io_splitter_ack_load_counter_f <= io_splitter_ack_load_counter_f - 1;
                end
            end

            //update w_resp status
            if (io_splitter_ack_store_go)
            begin
                w_addr_resp_buf_status_f <= buf_status_incomp;
                w_data_resp_buf_status_f <= buf_status_incomp;
            end
        end
        else
        begin
            io_splitter_arb_f <= 0;
            io_splitter_ack_load_counter_f <= 0;
        end
    end
endmodule
