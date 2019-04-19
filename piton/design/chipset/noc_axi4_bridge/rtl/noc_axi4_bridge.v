// ========== Copyright Header Begin ============================================
// Copyright (c) 2019 Princeton University
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
//  Filename      : axi_lite_bridge.v
//  Created On    : 2019-02-25
//  Revision      :
//  Author        : Grigory Chirkov
//  Company       : Princeton University
//  Email         : gchirkov@princeton.edu
//
//  Description   : Translate the incoming message (in the Piton Messaging
//                  Protocol, via a val/rdy interface) to a AXI4
//                  request.
//==================================================================================================

`include "define.tmp.h"
`define C_M_AXI4_DATA_WIDTH  512
`define C_M_AXI4_ID_WIDTH    16
`define C_M_AXI4_ADDR_WIDTH  64
`define C_M_AXI4_LEN_WIDTH   8
`define C_M_AXI4_SIZE_WIDTH  3

`define C_M_AXI4_STRB_WIDTH  64
`define C_M_AXI4_BURST_WIDTH 2

`define C_M_AXI4_RESP_WIDTH  2
`define C_M_AXI4_CACHE_WIDTH 4
`define C_M_AXI4_PROT_WIDTH 3
`define C_M_AXI4_QOS_WIDTH 4
`define C_M_AXI4_REGION_WIDTH 4
`define C_M_AXI4_USER_WIDTH 11

`define C_DATA_FLITS_CNT 8

module noc_axi4_bridge (
    // Clock + Reset
    (* mark_debug = "true" *) input  wire                                   clk,
    (* mark_debug = "true" *) input  wire                                   rst_n,
    input wire uart_boot_en, 

    // Memory Splitter -> AXI SPI
    (* mark_debug = "true" *) input  wire                                   splitter_bridge_val,
    (* mark_debug = "true" *) input  wire [`NOC_DATA_WIDTH-1:0]             splitter_bridge_data,
    (* mark_debug = "true" *) output wire                                   splitter_bridge_rdy,

    // Memory Splitter <- AXI SPI
    (* mark_debug = "true" *) output  reg                                   bridge_splitter_val,
    (* mark_debug = "true" *) output  reg  [`NOC_DATA_WIDTH-1:0]            bridge_splitter_data,
    (* mark_debug = "true" *) input  wire                                   bridge_splitter_rdy,

    // AXI Write Address Channel Signals
    (* mark_debug = "true" *) output wire [`C_M_AXI4_ID_WIDTH     -1:0]    m_axi_awid,
    (* mark_debug = "true" *) output  reg [`C_M_AXI4_ADDR_WIDTH   -1:0]    m_axi_awaddr,
    (* mark_debug = "true" *) output wire [`C_M_AXI4_LEN_WIDTH    -1:0]    m_axi_awlen,
    (* mark_debug = "true" *) output wire [`C_M_AXI4_SIZE_WIDTH   -1:0]    m_axi_awsize,
    (* mark_debug = "true" *) output wire [`C_M_AXI4_BURST_WIDTH  -1:0]    m_axi_awburst,
    (* mark_debug = "true" *) output wire                                  m_axi_awlock,
    (* mark_debug = "true" *) output wire [`C_M_AXI4_CACHE_WIDTH  -1:0]    m_axi_awcache,
    (* mark_debug = "true" *) output wire [`C_M_AXI4_PROT_WIDTH   -1:0]    m_axi_awprot,
    (* mark_debug = "true" *) output wire [`C_M_AXI4_QOS_WIDTH    -1:0]    m_axi_awqos,
    (* mark_debug = "true" *) output wire [`C_M_AXI4_REGION_WIDTH -1:0]    m_axi_awregion,
    (* mark_debug = "true" *) output wire [`C_M_AXI4_USER_WIDTH   -1:0]    m_axi_awuser,
    (* mark_debug = "true" *) output  reg                                  m_axi_awvalid,
    (* mark_debug = "true" *) input  wire                                  m_axi_awready,

    // AXI Write Data Channel Signals
    (* mark_debug = "true" *) output wire  [`C_M_AXI4_ID_WIDTH     -1:0]    m_axi_wid,
    (* mark_debug = "true" *) output  reg  [`C_M_AXI4_DATA_WIDTH   -1:0]    m_axi_wdata,
    (* mark_debug = "true" *) output  reg  [`C_M_AXI4_STRB_WIDTH   -1:0]    m_axi_wstrb,
    (* mark_debug = "true" *) output  reg                                   m_axi_wlast,
    (* mark_debug = "true" *) output wire  [`C_M_AXI4_USER_WIDTH   -1:0]    m_axi_wuser,
    (* mark_debug = "true" *) output  reg                                   m_axi_wvalid,
    (* mark_debug = "true" *) input  wire                                   m_axi_wready,

    // AXI Read Address Channel Signals
    (* mark_debug = "true" *) output wire  [`C_M_AXI4_ID_WIDTH     -1:0]    m_axi_arid,
    (* mark_debug = "true" *) output  reg  [`C_M_AXI4_ADDR_WIDTH   -1:0]    m_axi_araddr,
    (* mark_debug = "true" *) output wire  [`C_M_AXI4_LEN_WIDTH    -1:0]    m_axi_arlen,
    (* mark_debug = "true" *) output wire  [`C_M_AXI4_SIZE_WIDTH   -1:0]    m_axi_arsize,
    (* mark_debug = "true" *) output wire  [`C_M_AXI4_BURST_WIDTH  -1:0]    m_axi_arburst,
    (* mark_debug = "true" *) output wire                                   m_axi_arlock,
    (* mark_debug = "true" *) output wire  [`C_M_AXI4_CACHE_WIDTH  -1:0]    m_axi_arcache,
    (* mark_debug = "true" *) output wire  [`C_M_AXI4_PROT_WIDTH   -1:0]    m_axi_arprot,
    (* mark_debug = "true" *) output wire  [`C_M_AXI4_QOS_WIDTH    -1:0]    m_axi_arqos,
    (* mark_debug = "true" *) output wire  [`C_M_AXI4_REGION_WIDTH -1:0]    m_axi_arregion,
    (* mark_debug = "true" *) output wire  [`C_M_AXI4_USER_WIDTH   -1:0]    m_axi_aruser,
    (* mark_debug = "true" *) output  reg                                   m_axi_arvalid,
    (* mark_debug = "true" *) input  wire                                   m_axi_arready,

    // AXI Read Data Channel Signals
    (* mark_debug = "true" *) input  wire  [`C_M_AXI4_ID_WIDTH     -1:0]    m_axi_rid,
    (* mark_debug = "true" *) input  wire  [`C_M_AXI4_DATA_WIDTH   -1:0]    m_axi_rdata,
    (* mark_debug = "true" *) input  wire  [`C_M_AXI4_RESP_WIDTH   -1:0]    m_axi_rresp,
    (* mark_debug = "true" *) input  wire                                   m_axi_rlast,
    (* mark_debug = "true" *) input  wire  [`C_M_AXI4_USER_WIDTH   -1:0]    m_axi_ruser,
    (* mark_debug = "true" *) input  wire                                   m_axi_rvalid,
    (* mark_debug = "true" *) output  reg                                   m_axi_rready,

    // AXI Write Response Channel Signals
    (* mark_debug = "true" *) input  wire  [`C_M_AXI4_ID_WIDTH     -1:0]    m_axi_bid,
    (* mark_debug = "true" *) input  wire  [`C_M_AXI4_RESP_WIDTH   -1:0]    m_axi_bresp,
    (* mark_debug = "true" *) input  wire  [`C_M_AXI4_USER_WIDTH   -1:0]    m_axi_buser,
    (* mark_debug = "true" *) input  wire                                   m_axi_bvalid,
    (* mark_debug = "true" *) output  reg                                   m_axi_bready
);

//==============================================================================
// Tie constant outputs in axi4
//==============================================================================

// Do not use id field
assign m_axi_awid     = `C_M_AXI4_ID_WIDTH'b1;
assign m_axi_arid     = `C_M_AXI4_ID_WIDTH'b1;
assign m_axi_wid      = `C_M_AXI4_ID_WIDTH'b1;

// Use only length-1 bursts
assign m_axi_awlen    = `C_M_AXI4_LEN_WIDTH'b0;
assign m_axi_arlen    = `C_M_AXI4_LEN_WIDTH'b0;

// Always transfer 64 bytes
assign m_axi_awsize   = `C_M_AXI4_SIZE_WIDTH'b110;
assign m_axi_arsize   = `C_M_AXI4_SIZE_WIDTH'b110;

// fixed address in bursts (doesn't matter cause we use length-1 bursts)
assign m_axi_awburst  = `C_M_AXI4_BURST_WIDTH'b01;
assign m_axi_arburst  = `C_M_AXI4_BURST_WIDTH'b01;

// Do not use locks
assign m_axi_awlock   = 1'b0;
assign m_axi_arlock   = 1'b0;

// Non-cacheable bufferable requests
assign m_axi_arcache  = `C_M_AXI4_CACHE_WIDTH'b11;
assign m_axi_awcache  = `C_M_AXI4_CACHE_WIDTH'b11;

// Data access, non-secure access, unpriveleged access
assign m_axi_awprot   = `C_M_AXI4_PROT_WIDTH'b10;
assign m_axi_arprot   = `C_M_AXI4_PROT_WIDTH'b10;

// Do not use qos
assign m_axi_awqos    = `C_M_AXI4_QOS_WIDTH'b0;
assign m_axi_arqos    = `C_M_AXI4_QOS_WIDTH'b0;

// Do not use regions
assign m_axi_awregion = `C_M_AXI4_REGION_WIDTH'b0;
assign m_axi_arregion = `C_M_AXI4_REGION_WIDTH'b0;

// Do not use user field
assign m_axi_awuser   = `C_M_AXI4_USER_WIDTH'b0;
assign m_axi_aruser   = `C_M_AXI4_USER_WIDTH'b0;
assign m_axi_wuser    = `C_M_AXI4_USER_WIDTH'b0;

//==============================================================================
// Local Parameters
//==============================================================================

// States for Incoming Piton Messages
localparam MSG_STATE_INVAL      = 3'd0; // Invalid Message
localparam MSG_STATE_HEADER_0   = 3'd1; // Header 0
localparam MSG_STATE_HEADER_1   = 3'd2; // Header 1
localparam MSG_STATE_HEADER_2   = 3'd3; // Header 2
localparam MSG_STATE_DATA       = 3'd4; // Data Lines

// Types for Incoming Piton Messages
localparam MSG_TYPE_INVAL       = 3'd0; // Invalid Message
localparam MSG_TYPE_LOAD        = 3'd1; // Load Request
localparam MSG_TYPE_LOAD_NC     = 3'd2; // Load Request non cacheable
localparam MSG_TYPE_STORE       = 3'd3; // Store Request
localparam MSG_TYPE_STORE_NC    = 3'd4; // Store Request non cacheable

// States for Buffer Status
localparam BUF_STATUS_INCOMP    = 2'd0; // Buffer not yet filled by one complete request/response
localparam BUF_STATUS_COMP      = 2'd1; // Buffer contains a complete but unsent request
localparam BUF_STATUS_WAITRESP  = 2'd2; // Request sent via AXI, waiting on response
localparam BUF_STATUS_RESPSEND  = 2'd3; // Response waiting to forward back to memory splitter

// ACK's
localparam LOAD_ACK = 1'd0;
localparam STORE_ACK = 1'd1;

//==============================================================================
// Local Variables
//==============================================================================

// Meta-registers for tracking incoming Piton packets (used in parsing)
 (* mark_debug = "true" *) reg  [2:0]                          splitter_io_msg_state_f;
 (* mark_debug = "true" *) reg  [1:0]                          splitter_io_msg_type_f;
 (* mark_debug = "true" *) reg  [`MSG_LENGTH_WIDTH-1:0]        splitter_io_msg_counter_f;
 (* mark_debug = "true" *) reg  [`MSG_LENGTH_WIDTH-1:0]        splitter_io_msg_data_counter_f;

// Buffer registers for load requests
 (* mark_debug = "true" *) reg  [`NOC_DATA_WIDTH-1:0]          r_req_buf_header0_f;
 (* mark_debug = "true" *) reg  [`NOC_DATA_WIDTH-1:0]          r_req_buf_header1_f;
 (* mark_debug = "true" *) reg  [`NOC_DATA_WIDTH-1:0]          r_req_buf_header2_f;
 (* mark_debug = "true" *) reg  [1:0]                          r_req_buf_status_f;

// Buffer registers for store requests
 (* mark_debug = "true" *) reg  [`NOC_DATA_WIDTH-1:0]          w_req_buf_header0_f;
 (* mark_debug = "true" *) reg  [`NOC_DATA_WIDTH-1:0]          w_req_buf_header1_f;
 (* mark_debug = "true" *) reg  [`NOC_DATA_WIDTH-1:0]          w_req_buf_header2_f;
 (* mark_debug = "true" *) reg  [`NOC_DATA_WIDTH-1:0]          w_req_buf_data_f[`C_DATA_FLITS_CNT-1:0];
 (* mark_debug = "true" *) reg  [`C_M_AXI4_DATA_WIDTH-1:0]     wdata_before_offset;
 (* mark_debug = "true" *) reg  [6:0]                          wsize;

 wire [1:0]                          w_req_buf_status;
 (* mark_debug = "true" *) reg  [1:0]                          w_addr_req_buf_status_f;
 (* mark_debug = "true" *) reg  [1:0]                          w_data_req_buf_status_f;

// Buffer registers for load responses
 (* mark_debug = "true" *) reg  [`NOC_DATA_WIDTH-1:0]          r_resp_buf_header0_f;
 (* mark_debug = "true" *) reg  [`NOC_DATA_WIDTH-1:0]          r_resp_buf_data_f[`C_DATA_FLITS_CNT-1:0];
 (* mark_debug = "true" *) reg  [`NOC_DATA_WIDTH-1:0]          r_resp_buf_rresp_f;
 (* mark_debug = "true" *) reg  [1:0]                          r_resp_buf_status_f;
 (* mark_debug = "true" *) reg  [6:0]                          rsize;

// Buffer registers for store responses
 (* mark_debug = "true" *) reg  [`NOC_DATA_WIDTH-1:0]          w_resp_buf_header0_f;
 (* mark_debug = "true" *) reg  [`NOC_DATA_WIDTH-1:0]          w_resp_buf_bresp_f;
 wire [1:0]                          w_resp_buf_status;
 (* mark_debug = "true" *) reg  [1:0]                          w_addr_resp_buf_status_f;
 (* mark_debug = "true" *) reg  [1:0]                          w_data_resp_buf_status_f;

// Helper Signals for saving requests
 wire                         splitter_io_go;
 wire                         splitter_io_load_go;
 wire                         splitter_io_store_go;

 wire                         splitter_io_msg_is_load;
 wire                         splitter_io_msg_is_store;
 wire                         splitter_io_msg_is_load_next;
 wire                         splitter_io_msg_is_store_next;

 wire [2:0]                   splitter_io_msg_state_next;
 wire [2:0]                   splitter_io_msg_type_mux_out;
 wire [2:0]                   splitter_io_msg_type_next;
 wire [`MSG_LENGTH_WIDTH-1:0] splitter_io_msg_counter_next;
 wire [`MSG_LENGTH_WIDTH-1:0] splitter_io_msg_data_counter_next;
 wire                         splitter_io_msg_is_data;
 wire                         splitter_io_msg_is_data_next;
 wire                         splitter_io_msg_is_first_data_next;


// Helper Signals for sending responses
 wire                         m_axi_ar_go;
 wire                         m_axi_w_go;
 wire                         m_axi_aw_go;

 wire                         m_axi_b_go;
 wire                         m_axi_r_go;

 wire [`NOC_DATA_WIDTH-1:0]   r_resp_buf_header0_next;
 wire [`NOC_DATA_WIDTH-1:0]   w_resp_buf_header0_next;

 (* mark_debug = "true" *) reg  [`MSG_LENGTH_WIDTH-1:0] io_splitter_ack_load_counter_f;
 (* mark_debug = "true" *) reg                          io_splitter_arb_f;
 (* mark_debug = "true" *) reg                          io_splitter_ack_mux_sel;

 wire                         r_resp_buf_val;
 wire                         w_resp_buf_val;
 wire [`NOC_DATA_WIDTH-1:0]   io_splitter_ack_store;
 wire [`NOC_DATA_WIDTH-1:0]   io_splitter_ack_load;
 wire                         io_splitter_ack_load_go;
 wire                         io_splitter_ack_store_go;

//==============================================================================
// Read Requests From Splitter
//==============================================================================

    // What type of message is arriving currently?
    assign splitter_io_msg_type_mux_out =
        (!splitter_bridge_val) ? MSG_TYPE_INVAL :
        ((splitter_bridge_data[`MSG_TYPE] == `MSG_TYPE_LOAD_REQ   )  ||
         (splitter_bridge_data[`MSG_TYPE] == `MSG_TYPE_LOAD_MEM   )      ) ? MSG_TYPE_LOAD     :
        ( splitter_bridge_data[`MSG_TYPE] == `MSG_TYPE_NC_LOAD_REQ       ) ? MSG_TYPE_LOAD_NC  : 
        ((splitter_bridge_data[`MSG_TYPE] == `MSG_TYPE_STORE_REQ   ) ||
         (splitter_bridge_data[`MSG_TYPE] == `MSG_TYPE_STORE_MEM   )     ) ? MSG_TYPE_STORE    :
        ( splitter_bridge_data[`MSG_TYPE] == `MSG_TYPE_NC_STORE_REQ      ) ? MSG_TYPE_STORE_NC : 
                                                                             MSG_TYPE_INVAL    ;

    // What type of message will we be receiving?
    assign splitter_io_msg_type_next =
        (splitter_io_msg_state_next == MSG_STATE_INVAL   ) ? MSG_TYPE_INVAL               :
        (splitter_io_msg_state_next == MSG_STATE_HEADER_0) ? splitter_io_msg_type_mux_out :
                                                             splitter_io_msg_type_f       ;
    // Is the current message a load or a store?
    assign splitter_io_msg_is_load       = (splitter_io_msg_type_f    == MSG_TYPE_LOAD ) ||  (splitter_io_msg_type_f    == MSG_TYPE_LOAD_NC );
    assign splitter_io_msg_is_store      = (splitter_io_msg_type_f    == MSG_TYPE_STORE) ||  (splitter_io_msg_type_f    == MSG_TYPE_STORE_NC);

    // Is the incoming message a load or a store?
    assign splitter_io_msg_is_load_next  = (splitter_io_msg_type_next == MSG_TYPE_LOAD ) || (splitter_io_msg_type_next == MSG_TYPE_LOAD_NC );
    assign splitter_io_msg_is_store_next = (splitter_io_msg_type_next == MSG_TYPE_STORE) || (splitter_io_msg_type_next == MSG_TYPE_STORE_NC);

    // Should we read data from splitter_bridge_data?
    assign splitter_io_go = splitter_bridge_val && bridge_splitter_rdy;

    // Should we read a load request (store request)?
    assign splitter_io_load_go  = splitter_io_msg_is_load_next  && splitter_io_go && (r_req_buf_status_f == BUF_STATUS_INCOMP);
    assign splitter_io_store_go = splitter_io_msg_is_store_next && splitter_io_go && (w_req_buf_status   == BUF_STATUS_INCOMP);

    // Next-State logic for incoming message parser
    assign splitter_io_msg_state_next =
        (splitter_io_msg_state_f == MSG_STATE_INVAL   ) ? MSG_STATE_HEADER_0  :
        (splitter_io_msg_state_f == MSG_STATE_HEADER_0) ? MSG_STATE_HEADER_1  :
        (splitter_io_msg_state_f == MSG_STATE_HEADER_1) ? MSG_STATE_HEADER_2  :
        (splitter_io_msg_counter_f == 0               ) ? MSG_STATE_HEADER_0  :
        (splitter_io_msg_state_f == MSG_STATE_HEADER_2) ? MSG_STATE_DATA      :
        (splitter_io_msg_state_f == MSG_STATE_DATA    ) ? MSG_STATE_DATA      :
                                                          MSG_STATE_INVAL     ;

    // Counting data flits
    assign splitter_io_msg_is_data      = ( splitter_io_msg_state_f    == MSG_STATE_DATA );
    assign splitter_io_msg_is_data_next = ( splitter_io_msg_state_next == MSG_STATE_DATA );
    assign splitter_io_msg_is_first_data_next = !splitter_io_msg_is_data && splitter_io_msg_is_data_next;
    assign splitter_io_msg_data_counter_next = splitter_io_msg_is_first_data_next ? `MSG_LENGTH_WIDTH'b0 :
                                                                                    splitter_io_msg_data_counter_f + 1;

    // Next-value logic for message counter
    assign splitter_io_msg_counter_next =
        (splitter_io_msg_state_next == MSG_STATE_HEADER_0) ? splitter_bridge_data[`MSG_LENGTH] :
                                                             splitter_io_msg_counter_f - 1'b1  ;

    //--------------------------------------------------------------------------
    // Sequential Block for Splitter FSM State
    //--------------------------------------------------------------------------
    always @(posedge clk) begin
        if (~rst_n) begin
            splitter_io_msg_state_f        <= MSG_STATE_INVAL;
            splitter_io_msg_type_f         <= MSG_TYPE_INVAL;
            splitter_io_msg_counter_f      <= {`MSG_LENGTH_WIDTH{1'b0}};
            splitter_io_msg_data_counter_f <= {`MSG_LENGTH_WIDTH{1'b0}};
        end
        else begin
            splitter_io_msg_state_f        <= splitter_io_go ? splitter_io_msg_state_next
                                                             : splitter_io_msg_state_f;
            splitter_io_msg_type_f         <= splitter_io_go ? splitter_io_msg_type_next
                                                             : splitter_io_msg_type_f;
            splitter_io_msg_counter_f      <= splitter_io_go ? splitter_io_msg_counter_next
                                                             : splitter_io_msg_counter_f;
            splitter_io_msg_data_counter_f <= splitter_io_go ? splitter_io_msg_data_counter_next
                                                             : splitter_io_msg_data_counter_f;
        end
    end

    //--------------------------------------------------------------------------
    // Read headers and data for a load request
    //--------------------------------------------------------------------------
    always @(posedge clk) begin
        if (~rst_n) begin
            r_req_buf_header0_f <= {`NOC_DATA_WIDTH{1'b0}};
            r_req_buf_header1_f <= {`NOC_DATA_WIDTH{1'b0}};
            r_req_buf_header2_f <= {`NOC_DATA_WIDTH{1'b0}};
            r_req_buf_status_f  <= BUF_STATUS_INCOMP;
        end
        else begin
            r_req_buf_header0_f <= (splitter_io_load_go &
                                    (splitter_io_msg_state_next == MSG_STATE_HEADER_0)) ? splitter_bridge_data :
                                                                                          r_req_buf_header0_f  ;
            r_req_buf_header1_f <= (splitter_io_load_go &
                                    (splitter_io_msg_state_next == MSG_STATE_HEADER_1)) ? splitter_bridge_data :
                                                                                          r_req_buf_header1_f  ;
            r_req_buf_header2_f <= (splitter_io_load_go &
                                    (splitter_io_msg_state_next == MSG_STATE_HEADER_2)) ? splitter_bridge_data :
                                                                                          r_req_buf_header2_f  ;
            r_req_buf_status_f  <= (splitter_io_load_go &
                                    (splitter_io_msg_state_next == MSG_STATE_HEADER_2)) ? BUF_STATUS_COMP      :
                                   (m_axi_ar_go)                                        ? BUF_STATUS_INCOMP    :
                                                                                          r_req_buf_status_f   ;
        end
    end

    //--------------------------------------------------------------------------
    // Read headers and data for a store request
    //--------------------------------------------------------------------------
    wire    w_status_update;
    assign  w_status_update =   splitter_io_store_go &
                                (splitter_io_msg_state_next == MSG_STATE_DATA) &
                                (splitter_io_msg_counter_f == `MSG_LENGTH_WIDTH'd1);

    always @(posedge clk) begin
        if (~rst_n) begin
            w_req_buf_header0_f     <= {`NOC_DATA_WIDTH{1'b0}};
            w_req_buf_header1_f     <= {`NOC_DATA_WIDTH{1'b0}};
            w_req_buf_header2_f     <= {`NOC_DATA_WIDTH{1'b0}};
            w_addr_req_buf_status_f <= BUF_STATUS_INCOMP;
            w_data_req_buf_status_f <= BUF_STATUS_INCOMP;
        end
        else begin
            w_req_buf_header0_f     <= (splitter_io_store_go &
                                        (splitter_io_msg_state_next == MSG_STATE_HEADER_0)) ? splitter_bridge_data    :
                                                                                              w_req_buf_header0_f     ;
            w_req_buf_header1_f     <= (splitter_io_store_go &
                                        (splitter_io_msg_state_next == MSG_STATE_HEADER_1)) ? splitter_bridge_data    :
                                                                                              w_req_buf_header1_f     ;
            w_req_buf_header2_f     <= (splitter_io_store_go &
                                        (splitter_io_msg_state_next == MSG_STATE_HEADER_2)) ? splitter_bridge_data    :
                                                                                              w_req_buf_header2_f     ;

            w_addr_req_buf_status_f <= w_status_update                                      ? BUF_STATUS_COMP         :
                                       m_axi_aw_go                                          ? BUF_STATUS_INCOMP       :
                                                                                              w_addr_req_buf_status_f ;
            w_data_req_buf_status_f <= w_status_update                                      ? BUF_STATUS_COMP         :
                                       m_axi_w_go                                           ? BUF_STATUS_INCOMP       :
                                                                                              w_data_req_buf_status_f ;
        end
    end

    genvar i;
    generate
      for ( i = 0; i < `C_DATA_FLITS_CNT; i = i + 1 )
      begin: w_buf_entry
        always @(posedge clk)
        begin
          if (~rst_n)
            w_req_buf_data_f[i]     <= {`NOC_DATA_WIDTH{1'b0}};
          else
            w_req_buf_data_f[i]     <= (splitter_io_store_go &
                                        splitter_io_msg_is_data_next &
                                        (splitter_io_msg_data_counter_next == i))           ? splitter_bridge_data    :
                                                                                              w_req_buf_data_f[i]     ;
        end
      end
    endgenerate

    // Calculate Store Request Status
    assign w_req_buf_status =
        ((w_addr_req_buf_status_f == BUF_STATUS_INCOMP) &&
         (w_data_req_buf_status_f == BUF_STATUS_INCOMP)    ) ? BUF_STATUS_INCOMP :
                                                               BUF_STATUS_COMP   ;
    //==============================================================================
    // Calculate addresses and offsets and sizes
    //==============================================================================


    wire [`C_M_AXI4_ADDR_WIDTH-1:0]              paddings;
    wire [`C_M_AXI4_ADDR_WIDTH-1:0]              raddr_virt;
    wire [`C_M_AXI4_ADDR_WIDTH-1:0]              waddr_virt;
    wire [`C_M_AXI4_ADDR_WIDTH-1:0]              raddr_phys;
    wire [`C_M_AXI4_ADDR_WIDTH-1:0]              waddr_phys;
    wire [`C_M_AXI4_ADDR_WIDTH-1:0]              raddr;
    wire [`C_M_AXI4_ADDR_WIDTH-1:0]              waddr;
    reg  [6:0]                                   rsize;
    reg  [6:0]                                   wsize;

    assign paddings = 0;
    assign raddr_virt = r_req_buf_header1_f[`MSG_ADDR_];
    assign waddr_virt = w_req_buf_header1_f[`MSG_ADDR_];

    // Calculate Valid, Addr, Data signals

    `ifdef PITONSYS_UART_BOOT
      storage_addr_trans_unified   #(
    `else
      storage_addr_trans #(
    `endif
        .STORAGE_ADDR_WIDTH(`C_M_AXI4_ADDR_WIDTH)
      ) cpu_mig_raddr_translastor (
        .va_byte_addr       (raddr_virt  ),
        .storage_addr_out   (raddr_phys  )
      );

    `ifdef PITONSYS_UART_BOOT
      storage_addr_trans_unified   #(
    `else
      storage_addr_trans #(
    `endif
        .STORAGE_ADDR_WIDTH(`C_M_AXI4_ADDR_WIDTH)
      ) cpu_mig_waddr_translastor (
        .va_byte_addr       (waddr_virt  ),
        .storage_addr_out   (waddr_phys  )
      );

    assign raddr = uart_boot_en ? raddr_phys : raddr_virt; // use translated address if running uart tests
    assign waddr = uart_boot_en ? waddr_phys : waddr_virt; // use translated address if running uart tests

    assign roffset = raddr[5:0]; //how offseted we are from natural alignment on 64 bytes
    assign woffset = waddr[5:0]; //how offseted we are from natural alignment on 64 bytes

    // Calculate data sizes
    always @ (*) begin
        if (w_req_buf_header1_f[`MSG_DATA_SIZE_] == `MSG_DATA_SIZE_0B) begin
            wsize = 7'b0;
        end 
        else begin
            wsize = (7'b1 << (w_req_buf_header1_f[`MSG_DATA_SIZE_] - 1));
        end

        if (w_req_buf_header0_f[`MSG_TYPE] == `MSG_TYPE_NC_STORE_REQ) begin
            if (wsize == 0) begin
                m_axi_wstrb = `C_M_AXI4_STRB_WIDTH'b0;
            end 
            else begin 
                m_axi_wstrb = ((`C_M_AXI4_STRB_WIDTH'b1 << wsize) - 1) << woffset;
            end
        end 
        else begin
            m_axi_wstrb = {`C_M_AXI4_STRB_WIDTH{1'b1}};
        end

        if (r_req_buf_header1_f[`MSG_DATA_SIZE_] == `MSG_DATA_SIZE_0B) begin
            rsize = 7'b0;
        end 
        else begin
            rsize = (7'b1 << (r_req_buf_header1_f[`MSG_DATA_SIZE_] - 1));
        end
    end


//==============================================================================
// Forward Requests to AXI
//==============================================================================

    always @ (*) begin
        // Write Address Channel
        m_axi_awvalid = (w_req_buf_status == BUF_STATUS_COMP) && (w_addr_resp_buf_status_f == BUF_STATUS_INCOMP);
        m_axi_awaddr = {paddings[`C_M_AXI4_ADDR_WIDTH-1:`PHY_ADDR_WIDTH], waddr[`PHY_ADDR_WIDTH-1:6], 6'b0};

        // Write Data Channel
        m_axi_wvalid    = (w_req_buf_status == BUF_STATUS_COMP) && (w_data_resp_buf_status_f == BUF_STATUS_INCOMP);
        m_axi_wlast     = (m_axi_w_go);

        // Read Address Channel
        m_axi_arvalid = (r_req_buf_status_f == BUF_STATUS_COMP) && (r_resp_buf_status_f == BUF_STATUS_INCOMP);
        m_axi_araddr = {paddings[`C_M_AXI4_ADDR_WIDTH-1:`PHY_ADDR_WIDTH], raddr[`PHY_ADDR_WIDTH-1:6], 6'b0};
    end

    genvar k;
    generate
      for (k=0; k<`C_DATA_FLITS_CNT; k=k+1)
      begin : transform_requests_array_in_bus
        always @ (*)
        begin
          wdata_before_offset[`NOC_DATA_WIDTH*(k+1)-1:`NOC_DATA_WIDTH*k] = w_req_buf_data_f[k];
          m_axi_wdata = wdata_before_offset << woffset;
        end
      end
    endgenerate

    assign m_axi_ar_go = m_axi_arvalid && m_axi_arready;
    assign m_axi_w_go  = m_axi_wvalid & m_axi_wready;
    assign m_axi_aw_go = m_axi_awvalid & m_axi_awready;

//==============================================================================
// Receive AXI Response and Create Piton Response
//==============================================================================

    // Set ready signals
    always @( * ) begin
        m_axi_rready = (r_resp_buf_status_f == BUF_STATUS_WAITRESP);
        m_axi_bready = (w_resp_buf_status == BUF_STATUS_WAITRESP);
    end

    // Create response header
    assign r_resp_buf_header0_next[`MSG_DST_CHIPID] = r_req_buf_header2_f[`MSG_SRC_CHIPID_];
    assign r_resp_buf_header0_next[`MSG_DST_X]      = r_req_buf_header2_f[`MSG_SRC_X_];
    assign r_resp_buf_header0_next[`MSG_DST_Y]      = r_req_buf_header2_f[`MSG_SRC_Y_];
    assign r_resp_buf_header0_next[`MSG_DST_FBITS]  = r_req_buf_header2_f[`MSG_SRC_FBITS_]; //TODO check this...
    assign r_resp_buf_header0_next[`MSG_LENGTH]     = `MSG_LENGTH_WIDTH'd`C_DATA_FLITS_CNT; //none loads always return 8 words // TODO
    assign r_resp_buf_header0_next[`MSG_TYPE]       = (r_req_buf_header0_f[`MSG_TYPE] == `MSG_TYPE_NC_LOAD_REQ) ? `MSG_TYPE_NC_LOAD_MEM_ACK :
                                                      (r_req_buf_header0_f[`MSG_TYPE] == `MSG_TYPE_LOAD_MEM) ? `MSG_TYPE_LOAD_MEM_ACK :
                                                      `MSG_TYPE_WIDTH'dx;
    assign r_resp_buf_header0_next[`MSG_MSHRID]     = r_req_buf_header0_f[`MSG_MSHRID];//TODO check this...
    assign r_resp_buf_header0_next[`MSG_OPTIONS_1]  = `MSG_OPTIONS_1_WIDTH'd0; //reserved bits

    assign w_resp_buf_header0_next[`MSG_DST_CHIPID] = w_req_buf_header2_f[`MSG_SRC_CHIPID_];
    assign w_resp_buf_header0_next[`MSG_DST_X]      = w_req_buf_header2_f[`MSG_SRC_X_];
    assign w_resp_buf_header0_next[`MSG_DST_Y]      = w_req_buf_header2_f[`MSG_SRC_Y_];
    assign w_resp_buf_header0_next[`MSG_DST_FBITS]  = w_req_buf_header2_f[`MSG_SRC_FBITS_]; //TODO check this...
    assign w_resp_buf_header0_next[`MSG_LENGTH]     = `MSG_LENGTH_WIDTH'd0;
    assign w_resp_buf_header0_next[`MSG_TYPE]       = (w_req_buf_header0_f[`MSG_TYPE] == `MSG_TYPE_NC_STORE_REQ) ? `MSG_TYPE_NC_STORE_MEM_ACK :
                                                      (w_req_buf_header0_f[`MSG_TYPE] == `MSG_TYPE_STORE_MEM) ? `MSG_TYPE_STORE_MEM_ACK :
                                                      `MSG_TYPE_WIDTH'dx;
    assign w_resp_buf_header0_next[`MSG_MSHRID]     = w_req_buf_header0_f[`MSG_MSHRID];//TODO check this...
    assign w_resp_buf_header0_next[`MSG_OPTIONS_1]  = `MSG_OPTIONS_1_WIDTH'd0; //reserved bits

    // Calculate whether we're ready to accept a response
    assign m_axi_b_go = m_axi_bready && m_axi_bvalid;
    assign m_axi_r_go = m_axi_rready && m_axi_rvalid;

    //--------------------------------------------------------------------------
    // Create Store Response
    //--------------------------------------------------------------------------
    always @(posedge clk) begin
        if (~rst_n) begin
            w_resp_buf_header0_f     <=  {`NOC_DATA_WIDTH{1'b0}};
            w_resp_buf_bresp_f       <=  {`NOC_DATA_WIDTH{1'b0}};
            w_addr_resp_buf_status_f <=  BUF_STATUS_INCOMP;
            w_data_resp_buf_status_f <=  BUF_STATUS_INCOMP;
        end
        else begin
            w_resp_buf_header0_f     <=  m_axi_aw_go              ? w_resp_buf_header0_next  :
                                                                    w_resp_buf_header0_f     ;
            w_resp_buf_bresp_f       <=  m_axi_b_go               ? m_axi_bresp              :
                                                                    w_resp_buf_bresp_f       ;
            w_addr_resp_buf_status_f <=  m_axi_aw_go              ? BUF_STATUS_WAITRESP      :
                                         m_axi_b_go               ? BUF_STATUS_RESPSEND      :
                                         io_splitter_ack_store_go ? BUF_STATUS_INCOMP        :
                                                                    w_addr_resp_buf_status_f ;
            w_data_resp_buf_status_f <=  m_axi_w_go               ? BUF_STATUS_WAITRESP      :
                                         m_axi_b_go               ? BUF_STATUS_RESPSEND      :
                                         io_splitter_ack_store_go ? BUF_STATUS_INCOMP        :
                                                                    w_data_resp_buf_status_f ;
        end
    end

    // Calculate Store Response Status
    assign w_resp_buf_status =
        ((w_addr_resp_buf_status_f == BUF_STATUS_INCOMP  ) ||
         (w_data_resp_buf_status_f == BUF_STATUS_INCOMP  )    ) ? BUF_STATUS_INCOMP   :
        ((w_addr_resp_buf_status_f == BUF_STATUS_COMP    ) ||
         (w_data_resp_buf_status_f == BUF_STATUS_COMP    )    ) ? BUF_STATUS_COMP     :
        ((w_addr_resp_buf_status_f == BUF_STATUS_WAITRESP) ||
         (w_data_resp_buf_status_f == BUF_STATUS_WAITRESP)    ) ? BUF_STATUS_WAITRESP :
                                                                  BUF_STATUS_RESPSEND ;

    //--------------------------------------------------------------------------
    // Create Load Response
    //--------------------------------------------------------------------------
    always @(posedge clk) begin
        if (~rst_n) begin
            r_resp_buf_header0_f <= {`NOC_DATA_WIDTH{1'b0}};
            r_resp_buf_rresp_f   <= {`NOC_DATA_WIDTH{1'b0}};
            r_resp_buf_status_f  <= BUF_STATUS_INCOMP;
        end
        else begin
            r_resp_buf_header0_f <= m_axi_ar_go                                        ? r_resp_buf_header0_next :
                                                                                         r_resp_buf_header0_f    ;
            r_resp_buf_rresp_f   <= m_axi_r_go                                         ? m_axi_rresp             :
                                                                                         r_resp_buf_rresp_f      ;
            r_resp_buf_status_f  <= m_axi_ar_go                                        ? BUF_STATUS_WAITRESP     :
                                    m_axi_r_go                                         ? BUF_STATUS_RESPSEND     :
                                    (io_splitter_ack_load_go                       &
                                     (io_splitter_ack_load_counter_f == 0)         &
                                     ~(r_resp_buf_status_f == BUF_STATUS_WAITRESP)   ) ? BUF_STATUS_INCOMP       :
                                                                                         r_resp_buf_status_f     ;
        end
    end


    reg[`C_M_AXI4_DATA_WIDTH-1:0] rdata;
    always @(*) begin
        if (w_req_buf_header0_f[`MSG_TYPE] == `MSG_TYPE_NC_STORE_REQ) begin
            case (rsize) 
                7'd0: begin 
                    rdata = `C_M_AXI4_DATA_WIDTH'b0;
                end
                7'd1: begin
                    rdata = {`C_M_AXI4_DATA_WIDTH/8{m_axi_rdata[roffset+7:roffset]}};
                end
                7'd2: begin
                    rdata = {`C_M_AXI4_DATA_WIDTH/16{m_axi_rdata[roffset+15:roffset]}};
                end
                7'd4: begin
                    rdata = {`C_M_AXI4_DATA_WIDTH/32{m_axi_rdata[roffset+31:roffset]}};
                end
                7'd8: begin
                    rdata = {`C_M_AXI4_DATA_WIDTH/64{m_axi_rdata[roffset+63:roffset]}};
                end
                7'd16: begin
                    rdata = {`C_M_AXI4_DATA_WIDTH/128{m_axi_rdata[roffset+127:roffset]}};
                end
                7'd32: begin
                    rdata = {`C_M_AXI4_DATA_WIDTH/256{m_axi_rdata[roffset+255:roffset]}};
                end
                default: begin
                    rdata = {`C_M_AXI4_DATA_WIDTH/512{m_axi_rdata[roffset+511:roffset]}};
                end
        end 
        else begin
            rdata = m_axi_rdata;
        end
    end



    genvar j;
    generate
      for ( j = 0; j < `C_DATA_FLITS_CNT; j = j + 1 )
      begin: r_buf_entry
        always @(posedge clk)
        begin
          if (~rst_n)
            r_resp_buf_data_f[j]   <= {`NOC_DATA_WIDTH{1'b0}};
          else
            r_resp_buf_data_f[j]   <= m_axi_r_go        ? rdata[`NOC_DATA_WIDTH*(j+1)-1:`NOC_DATA_WIDTH*j] :
                                                          r_resp_buf_data_f[j]                                       ;
        end
      end
    endgenerate




//==============================================================================
// Send Piton Response Back to NOCs
//==============================================================================

    assign  r_resp_buf_val = (r_resp_buf_status_f == BUF_STATUS_RESPSEND);
    assign  w_resp_buf_val = (w_resp_buf_status == BUF_STATUS_RESPSEND);

    assign  io_splitter_ack_store = w_resp_buf_header0_f;
    assign  io_splitter_ack_load = (io_splitter_ack_load_counter_f == r_resp_buf_header0_f[`MSG_LENGTH]) ? r_resp_buf_header0_f
                                                       : r_resp_buf_data_f[`MSG_LENGTH_WIDTH'd`C_DATA_FLITS_CNT - 1 - io_splitter_ack_load_counter_f];

    assign  io_splitter_ack_load_go = (io_splitter_ack_mux_sel == LOAD_ACK) && (r_resp_buf_val) && splitter_bridge_rdy;
    assign  io_splitter_ack_store_go = (io_splitter_ack_mux_sel == STORE_ACK) && (w_resp_buf_val) && splitter_bridge_rdy;

    always @( * ) begin
        // val flag and output to splitter
        if (io_splitter_ack_mux_sel == LOAD_ACK) begin
            bridge_splitter_val = r_resp_buf_val;
            bridge_splitter_data = io_splitter_ack_load;
        end
        else begin
            bridge_splitter_val = w_resp_buf_val;
            bridge_splitter_data = io_splitter_ack_store;
        end
    end

    // Select whether to send a load ACK or a store ACK
    always @( * ) begin
        if (r_resp_buf_val && (!w_resp_buf_val)) begin
            io_splitter_ack_mux_sel = LOAD_ACK;
        end
        else if (w_resp_buf_val && (!r_resp_buf_val)) begin
            io_splitter_ack_mux_sel = STORE_ACK;
        end
        else if (w_resp_buf_val && r_resp_buf_val) begin
            if(io_splitter_ack_load_counter_f == r_resp_buf_header0_f[`MSG_LENGTH]) begin
                io_splitter_ack_mux_sel = io_splitter_arb_f;
            end
            else begin
                io_splitter_ack_mux_sel = LOAD_ACK;
            end
        end
        else begin
            io_splitter_ack_mux_sel = LOAD_ACK;
        end
    end

    // Sequential updates to the arbitration selector and load flit counter
    always @(posedge clk) begin
        if (~rst_n) begin
                io_splitter_arb_f <= 0;
                io_splitter_ack_load_counter_f <= 0;
        end
        else begin
            // Update Arbitration Reg
            if (w_resp_buf_val && r_resp_buf_val && io_splitter_ack_load_go) begin
                io_splitter_arb_f <= STORE_ACK;
            end
            else if (w_resp_buf_val && r_resp_buf_val && io_splitter_ack_store_go) begin
                io_splitter_arb_f <= LOAD_ACK;
            end

            // Update Load Flit Counter
            if (r_resp_buf_status_f == BUF_STATUS_WAITRESP) begin
                io_splitter_ack_load_counter_f <= r_resp_buf_header0_f[`MSG_LENGTH];
            end
            else if(io_splitter_ack_load_go) begin
                if (io_splitter_ack_load_counter_f != 0) begin
                    io_splitter_ack_load_counter_f <= io_splitter_ack_load_counter_f - 1;
                end
            end

        end
    end

    assign bridge_splitter_rdy =
         (r_resp_buf_status_f == BUF_STATUS_INCOMP) &&
         (r_req_buf_status_f  != BUF_STATUS_COMP)   && 
         (w_resp_buf_status   == BUF_STATUS_INCOMP) && 
         (w_req_buf_status    != BUF_STATUS_COMP);

endmodule
