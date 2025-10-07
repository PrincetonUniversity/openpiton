// Copyright (c) 2019 multiple authors
// All rights reserved.

// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the authors nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.

// THIS SOFTWARE IS PROVIDED BY THE AUTHORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

`include "define.tmp.h"

module axilite_noc_bridge #(
    parameter AXI_LITE_DATA_WIDTH = 64,
    parameter AXI_LITE_ADDR_WIDTH = 64, 
    parameter AXI_LITE_RESP_WIDTH = 2
) (
    input  logic                                   clk,
    input  logic                                   rst_n,

    output logic 		                           noc_valid_out,
    output logic [`NOC_DATA_WIDTH-1:0] 		       noc_data_out,
    input  logic 					               noc_ready_in,
   
    input  logic 					               noc_valid_in,
    input  logic [`NOC_DATA_WIDTH-1:0] 		       noc_data_in,
    output logic      				               noc_ready_out,

    input  logic [`MSG_SRC_CHIPID_WIDTH-1:0]       src_chipid,
    input  logic [`MSG_SRC_X_WIDTH-1:0]            src_xpos,
    input  logic [`MSG_SRC_Y_WIDTH-1:0]            src_ypos,
    input  logic [`MSG_SRC_FBITS_WIDTH-1:0]        src_fbits,

    input  logic [`MSG_DST_CHIPID_WIDTH-1:0]       dest_chipid,
    input  logic [`MSG_DST_X_WIDTH-1:0]            dest_xpos,
    input  logic [`MSG_DST_Y_WIDTH-1:0]            dest_ypos,
    input  logic [`MSG_DST_FBITS_WIDTH-1:0]        dest_fbits,
  `ifndef ARA_REQ2MEM
    input  logic [`HOME_ID_WIDTH-1:0]              system_tile_count,
    input  logic [`HOME_ALLOC_METHOD_WIDTH-1:0]    home_alloc_method,
  `endif 

    // AXI Write Address Channel Signals
    input  logic [AXI_LITE_ADDR_WIDTH-1:0]         m_axi_awaddr,
    input  logic                                   m_axi_awvalid,
    output logic                                   m_axi_awready,

    // AXI Write Data Channel Signals
    input  logic [AXI_LITE_DATA_WIDTH-1:0]         m_axi_wdata,
    input  logic [AXI_LITE_DATA_WIDTH/8-1:0]       m_axi_wstrb,
    input  logic                                   m_axi_wvalid,
    output logic                                   m_axi_wready,

    // AXI Read Address Channel Signals
    input  logic [AXI_LITE_ADDR_WIDTH-1:0]         m_axi_araddr,
    input  logic                                   m_axi_arvalid,
    output logic                                   m_axi_arready,

    // AXI Read Data Channel Signals
    output logic [AXI_LITE_DATA_WIDTH-1:0]         m_axi_rdata,
    output logic [AXI_LITE_RESP_WIDTH-1:0]         m_axi_rresp,
    output logic                                   m_axi_rvalid,
    input  logic                                   m_axi_rready,

    // AXI Write Response Channel Signals
    output logic [AXI_LITE_RESP_WIDTH-1:0]         m_axi_bresp,
    output logic                                   m_axi_bvalid,
    input  logic                                   m_axi_bready
);

// States for Incoming Piton Messages
localparam MSG_TYPE_INVAL          = 2'd0; // Invalid Message
localparam MSG_TYPE_LOAD           = 2'd1; // Load Request
localparam MSG_TYPE_STORE          = 2'd2; // Store Request

localparam MIN_NOC_DATA_WIDTH      = 64; // 8 Bytes
localparam NOC_HDR_LEN             = 3;

localparam NOC_PAYLOAD_LEN = (AXI_LITE_DATA_WIDTH < MIN_NOC_DATA_WIDTH) ?
                        3'b1 : AXI_LITE_DATA_WIDTH / MIN_NOC_DATA_WIDTH;
localparam NULL_PAYLOAD_LEN = 2; // we write 16 bytes null data for L2 version load request

typedef enum logic [1:0] {
    MSG_STATE_IDLE = 2'd0,

  `ifdef ARA_REQ2MEM
    MSG_STATE_WAIT_STRB = 2'd1,
    MSG_STATE_HEADER = 2'd2,
    MSG_STATE_NOC_DATA = 2'd3
  `else 
    MSG_STATE_DEST_CAL = 2'd1,
    MSG_STATE_HEADER = 2'd2,
    MSG_STATE_NOC_DATA = 2'd3
  `endif
} flit_state;        // state for flit output

flit_state                                flit_state_f, flit_state_next;

`ifdef ARA_REQ2MEM
    typedef enum logic [1:0] {
        IDLE = 2'd0,
        VALID = 2'd1,
        WAIT_ = 2'd2
    } wstrb_fifo_state;  // state for strobe conversion 

    wstrb_fifo_state                          wstrb_fifo_state_f, wstrb_fifo_state_next;
`endif 

/* flit fields */
logic [`NOC_DATA_WIDTH-1:0]               msg_address;
logic [`MSG_LENGTH_WIDTH-1:0]             msg_length;
logic [`MSG_TYPE_WIDTH-1:0]               msg_type;
logic [`MSG_MSHRID_WIDTH-1:0]             msg_mshrid;
logic [`MSG_DATA_SIZE_WIDTH-1:0]          msg_data_size;
logic [`MSG_OPTIONS_1]                    msg_options_1;
logic [`MSG_OPTIONS_2_]                   msg_options_2;
logic [`MSG_OPTIONS_3_]                   msg_options_3;

logic                                     axi2noc_msg_type_store;
logic                                     axi2noc_msg_type_load;
logic                                     flit_ready;
logic [`NOC_DATA_WIDTH-1:0]               flit;
logic [`NOC_DATA_WIDTH-1:0]               noc_data;

logic                                     type_fifo_wval;
logic                                     type_fifo_full;
logic [1:0]                               type_fifo_wdata;
logic                                     type_fifo_empty;
logic [1:0]                               type_fifo_out;
logic                                     type_fifo_ren;

logic                                     awaddr_fifo_wval;
logic                                     awaddr_fifo_full;
logic [AXI_LITE_ADDR_WIDTH-1:0]           awaddr_fifo_wdata;
logic                                     awaddr_fifo_empty;
logic [AXI_LITE_ADDR_WIDTH-1:0]           awaddr_fifo_out;
logic                                     awaddr_fifo_ren;

logic                                     wdata_fifo_wval;
logic                                     wdata_fifo_full;
logic [AXI_LITE_DATA_WIDTH-1:0]           wdata_fifo_wdata;
logic                                     wdata_fifo_empty;
logic [AXI_LITE_DATA_WIDTH-1:0]           wdata_fifo_out_buffer; // for endian conversion 
logic [AXI_LITE_DATA_WIDTH-1:0]           wdata_fifo_out;
logic                                     wdata_fifo_ren;

logic                                     word_select;
logic                                     araddr_fifo_wval;
logic                                     araddr_fifo_full;
logic [AXI_LITE_ADDR_WIDTH-1:0]           araddr_fifo_wdata;
logic                                     araddr_fifo_empty;
logic [AXI_LITE_ADDR_WIDTH-1:0]           araddr_fifo_out;
logic                                     araddr_fifo_ren;

logic [AXI_LITE_DATA_WIDTH/8 - 1: 0]      wstrb_fifo_out;
logic [AXI_LITE_DATA_WIDTH/8 - 1: 0]      wstrb_fifo_wdata; 
logic                                     wstrb_fifo_full;
logic                                     wstrb_fifo_empty;
logic                                     wstrb_fifo_ren;
logic                                     wstrb_fifo_wval;

logic [AXI_LITE_DATA_WIDTH/8 - 1: 0]      wstrb_fifo_mux_out;
`ifdef ARA_REQ2MEM
    logic [`MSG_DATA_SIZE_WIDTH - 1:0]        pmesh_data_size;
    logic [$clog2(AXI_LITE_ADDR_WIDTH) - 1:0] pmesh_addr;
    logic [`MSG_DATA_SIZE_WIDTH:0]            buf_pmesh_data_size;
    logic [$clog2(AXI_LITE_ADDR_WIDTH) - 1:0] buf_pmesh_addr;
    logic                                     wstrb_fifoside_valid;
    logic                                     wstrb_fifoside_ready;
    logic                                     wstrb_outputside_valid;
    logic                                     wstrb_outputside_ready;
`else 
    logic                                     cal_dest_stage0;
    logic                                     cal_dest_stage1; 
    logic                                     cal_dest_stage2 ;
    logic [`HOME_ID_WIDTH-1:0]                lhid_s0;
    logic [`HOME_ID_WIDTH-1:0]                lhid_s1;
    logic [`HOME_ID_WIDTH-1:0]                home_addr_bits_s0;
    logic [`PHY_ADDR_WIDTH-1:0]               axilite2noc_req_address_s0;
    logic                                     special_l2_addr_s0;
    logic [`NOC_X_WIDTH-1:0]                  lhid_s1_x;
    logic [`NOC_Y_WIDTH-1:0]                  lhid_s1_y;
`endif

logic                                     fifo_has_packet;
logic                                     noc_store_done;
logic                                     noc_load_done;
logic [MIN_NOC_DATA_WIDTH-1:0]            out_data [0:NOC_PAYLOAD_LEN-1];
logic                                     noc_last_header;
logic                                     noc_last_data;
logic [2:0]                               noc_cnt;

logic                                     fifo_rst;

// deal with simultaneous read write operation
logic                                     simu_wr_detected; 
logic                                     read_buffer_full; 

/******** Where the magic happens ********/
noc_response_axilite #(
  `ifdef ARA_REQ2MEM
    .AXILITE_DATA_WIDTH(AXI_LITE_DATA_WIDTH),
    .AXI_RESP_WIDTH(2)
  `else 
    .AXILITE_DATA_WIDTH(AXI_LITE_DATA_WIDTH),
    .AXI_RESP_WIDTH(2),
    .MSG_TYPE_INVAL(MSG_TYPE_INVAL), 
    .MSG_TYPE_STORE(MSG_TYPE_STORE), 
    .MSG_TYPE_LOAD(MSG_TYPE_LOAD)
  `endif
) noc_response_axilite(
    .clk(clk),
    .rst_n(rst_n),
    .noc_valid_in(noc_valid_in),
    .noc_data_in(noc_data_in),
    .noc_ready_out(noc_ready_out),
  `ifndef ARA_REQ2MEM
    .transaction_type_wr_data({1'b1, 1'b1, 1'b0, read_word_select, type_fifo_out}), 
    .transaction_type_wr(type_fifo_ren),
  `endif
    .m_axi_rdata(m_axi_rdata),
    .m_axi_rresp(m_axi_rresp),
    .m_axi_rvalid(m_axi_rvalid),
    .m_axi_rready(m_axi_rready),
    .m_axi_bresp(m_axi_bresp),
    .m_axi_bvalid(m_axi_bvalid),
    .m_axi_bready(m_axi_bready)
);

assign fifo_rst = !rst_n;
/**************************************************************************/
/*control signal of store buffer, which is for simultaneous read and write*/
/**************************************************************************/  
assign simu_wr_detected = awaddr_fifo_wval && araddr_fifo_wval && !read_buffer_full;

always@(posedge clk or negedge rst_n) begin 
    if (!rst_n) begin 
        read_buffer_full <= 0;
    end 
    else if (simu_wr_detected) begin
        read_buffer_full <= 1;
    end 
    else if (type_fifo_wval) begin 
        read_buffer_full <= 0;
    end 
    else begin 
        read_buffer_full <= read_buffer_full;
    end
end 
/****************************************************************************/

assign write_channel_ready = !awaddr_fifo_full && !wdata_fifo_full && !wstrb_fifo_full;
//assign m_axi_awready = write_channel_ready && !type_fifo_full && !read_buffer_full;
assign m_axi_awready = !awaddr_fifo_full && !type_fifo_full && !read_buffer_full;
//assign m_axi_wready = write_channel_ready && !type_fifo_full;
assign m_axi_wready = !wdata_fifo_full && !wstrb_fifo_full && !type_fifo_full;
assign m_axi_arready = !araddr_fifo_full && !type_fifo_full && !read_buffer_full;

assign axi2noc_msg_type_store = m_axi_awvalid && (!read_buffer_full); //give priority to load request if read buffer has something
assign axi2noc_msg_type_load = m_axi_arvalid || read_buffer_full;

/* fifo for storing packet type */
sync_fifo #(
    .DSIZE(2),
    .ASIZE(5),
    .MEMSIZE(16) // should be 2 ^ (ASIZE-1)
) type_fifo (
    .rdata(type_fifo_out),
    .empty(type_fifo_empty),
    .clk(clk),
    .ren(type_fifo_ren),
    .wdata(type_fifo_wdata),
    .full(type_fifo_full),
    .wval(type_fifo_wval),
    .reset(!rst_n)
);

assign type_fifo_wval = (axi2noc_msg_type_store || axi2noc_msg_type_load) && !type_fifo_full;
assign type_fifo_ren = (noc_store_done | noc_load_done) && !type_fifo_empty;
assign type_fifo_wdata = (axi2noc_msg_type_store) ? MSG_TYPE_STORE :
                            (axi2noc_msg_type_load) ? MSG_TYPE_LOAD : MSG_TYPE_INVAL;

/* fifo for storing addresses */
sync_fifo #(
    .DSIZE(AXI_LITE_ADDR_WIDTH),
    .ASIZE(5),
    .MEMSIZE(16) // should be 2 ^ (ASIZE-1)
) awaddr_fifo (
    .rdata(awaddr_fifo_out),
    .empty(awaddr_fifo_empty),
    .clk(clk),
    .ren(awaddr_fifo_ren),
    .wdata(awaddr_fifo_wdata),
    .full(awaddr_fifo_full),
    .wval(awaddr_fifo_wval),
    .reset(fifo_rst)
);
logic write_word_select;
assign write_word_select = (type_fifo_out == MSG_TYPE_STORE && awaddr_fifo_out[3] == 1) ? 1 : 0;
assign awaddr_fifo_wval = m_axi_awvalid && m_axi_awready; 
assign awaddr_fifo_wdata = m_axi_awaddr;
assign awaddr_fifo_ren = (noc_store_done && !awaddr_fifo_empty);

/* fifo for wdata */
sync_fifo #(
	.DSIZE(AXI_LITE_DATA_WIDTH),
	.ASIZE(5),
	.MEMSIZE(16) // should be 2 ^ (ASIZE-1)    
) waddr_fifo (
	.rdata(wdata_fifo_out_buffer),
	.empty(wdata_fifo_empty),
	.clk(clk),
	.ren(wdata_fifo_ren),
	.wdata(wdata_fifo_wdata),
	.full(wdata_fifo_full),
	.wval(wdata_fifo_wval),
	.reset(fifo_rst)
);

assign wdata_fifo_out = {<<8{wdata_fifo_out_buffer}};
assign wdata_fifo_wval = m_axi_wvalid && m_axi_wready;
assign wdata_fifo_wdata = m_axi_wdata;
assign wdata_fifo_ren = (noc_store_done && !wdata_fifo_empty);

/****************/ 
// declaration for strobe to mask conversion 
// control intreface signal

assign wstrb_fifo_mux_out = (wstrb_fifo_empty) ? 8'b0000_0000 : {<<1{wstrb_fifo_out}};

sync_fifo #(
	.DSIZE(AXI_LITE_DATA_WIDTH/8),
	.ASIZE(5),
	.MEMSIZE(16) // should be 2 ^ (ASIZE-1)
) wstrb_fifo (
	.rdata(wstrb_fifo_out),
	.empty(wstrb_fifo_empty),
	.clk(clk),
	.ren(wstrb_fifo_ren),
	.wdata(wstrb_fifo_wdata),
	.full(wstrb_fifo_full),
	.wval(wstrb_fifo_wval),
	.reset(fifo_rst)
);

assign wstrb_fifo_ren = (noc_store_done && !wstrb_fifo_empty);
assign wstrb_fifo_wval = m_axi_wvalid && m_axi_wready;
assign wstrb_fifo_wdata = m_axi_wstrb;

`ifdef ARA_REQ2MEM
    strb2mask strb2mask_ins (
        .clk (clk),
        .rst (fifo_rst),
        .m_axi_wstrb (wstrb_fifo_mux_out),
        .pmesh_data_size (pmesh_data_size),
        .pmesh_addr (pmesh_addr), 
        .s_channel_valid (wstrb_fifoside_valid),
        .s_channel_ready(wstrb_fifoside_ready),
        .d_channel_ready(wstrb_outputside_ready), 
        .d_channel_valid(wstrb_outputside_valid)
    );

    //valid state machine 
    always_ff@ (posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wstrb_fifo_state_f <= IDLE;
        end
        else begin
            wstrb_fifo_state_f <= wstrb_fifo_state_next;
        end
    end

    // flip flop output the strobe conversion module 
    always_ff@(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            buf_pmesh_addr <= 0;
            buf_pmesh_data_size <= 0;
        end
        else if ((flit_state_f == MSG_STATE_WAIT_STRB) & (wstrb_outputside_ready & wstrb_outputside_valid)) begin
            buf_pmesh_addr <= pmesh_addr;
            buf_pmesh_data_size <= pmesh_data_size;
        end
        else begin
            buf_pmesh_addr <= buf_pmesh_addr;
            buf_pmesh_data_size <= buf_pmesh_data_size;
        end
    end

    //state transfer logic
    always_comb 
    begin
        wstrb_fifo_state_next = wstrb_fifo_state_f;
        unique case (wstrb_fifo_state_f)
            IDLE: begin 
                wstrb_fifo_state_next = (fifo_has_packet && type_fifo_out == MSG_TYPE_STORE) 
                                            ? VALID : wstrb_fifo_state_f;
            end 
            VALID: begin 
                wstrb_fifo_state_next = (wstrb_fifoside_ready) ? WAIT_ : wstrb_fifo_state_f;
            end
            WAIT_: begin 
                wstrb_fifo_state_next = (noc_store_done) ? IDLE : wstrb_fifo_state_f;
            end 
            default: begin 
                wstrb_fifo_state_next = wstrb_fifo_state_f;
            end 
        endcase 
    end 

    assign wstrb_outputside_ready = (flit_state_f == MSG_STATE_WAIT_STRB) && (type_fifo_out == MSG_TYPE_STORE);

    //state output 
    assign wstrb_fifoside_valid = (wstrb_fifo_state_f == VALID);

`endif 


/* fifo for read addr */
sync_fifo #(
	.DSIZE(AXI_LITE_ADDR_WIDTH),
	.ASIZE(5),
	.MEMSIZE(16) // should be 2 ^ (ASIZE-1)    
) raddr_fifo (
	.rdata(araddr_fifo_out),
	.empty(araddr_fifo_empty),
	.clk(clk),
	.ren(araddr_fifo_ren),
	.wdata(araddr_fifo_wdata),
	.full(araddr_fifo_full),
	.wval(araddr_fifo_wval),
	.reset(fifo_rst)
);
assign read_word_select = (type_fifo_out == MSG_TYPE_LOAD) ? (araddr_fifo_out[3]) : 0;  
assign araddr_fifo_wval = m_axi_arvalid && m_axi_arready;
assign araddr_fifo_wdata = m_axi_araddr;
assign araddr_fifo_ren = (noc_load_done && !araddr_fifo_empty);

/* 
start the state machine when fifo is not empty and noc is ready 
We need to toggle between address and data fifos.
*/

/*write channel ready: address, data, strobe, read channel ready: address */
assign fifo_has_packet = (type_fifo_out == MSG_TYPE_STORE) ? (!awaddr_fifo_empty && !wdata_fifo_empty && !wstrb_fifo_empty) :
                            (type_fifo_out == MSG_TYPE_LOAD) ? !araddr_fifo_empty : 1'b0;

`ifdef ARA_REQ2MEM
 assign noc_store_done = noc_last_data && type_fifo_out == MSG_TYPE_STORE && ~wstrb_outputside_valid;
 assign noc_load_done = noc_last_header && type_fifo_out == MSG_TYPE_LOAD;

`else // load now can be done with load_noshare message type 
 assign noc_store_done = noc_last_data && type_fifo_out == MSG_TYPE_STORE;
 assign noc_load_done = noc_last_header && type_fifo_out == MSG_TYPE_LOAD;

// `else // this section is commented since we don't need extra data flit to use swap write back as the replacement of load_noshare
//  assign noc_store_done = noc_last_data && type_fifo_out == MSG_TYPE_STORE; // L2 supports mask   
//  assign noc_load_done = noc_last_data && type_fifo_out == MSG_TYPE_LOAD; // We need to file 2 meaningless data flit (16 bytes) for swap_wb load
`endif

generate begin
 genvar k;
 if (AXI_LITE_DATA_WIDTH < MIN_NOC_DATA_WIDTH) begin
     for (k=0; k< MIN_NOC_DATA_WIDTH/AXI_LITE_DATA_WIDTH; k = k + 1)
     begin: DATA_GEN
         assign out_data[(k+1)*AXI_LITE_DATA_WIDTH-1 : k*AXI_LITE_DATA_WIDTH] = wdata_fifo_out;
     end
 end
 else begin
     for (k=0; k<NOC_PAYLOAD_LEN; k = k + 1)
     begin: DATA_GEN
         assign out_data[k] = wdata_fifo_out[(k+1)*MIN_NOC_DATA_WIDTH-1 : k*MIN_NOC_DATA_WIDTH];
     end
 end
end
endgenerate



/* set defaults for the flit */
always_comb
begin
    msg_type = `MSG_TYPE_RESERVED;
    msg_data_size = `MSG_DATA_SIZE_8B;
    msg_length = `MSG_LENGTH_WIDTH'b0;
    msg_address = {{`MSG_ADDR_WIDTH-`PHY_ADDR_WIDTH{1'b0}}, {`PHY_ADDR_WIDTH{1'b0}}}; 
    unique case (type_fifo_out)
        MSG_TYPE_STORE: begin
        `ifdef ARA_REQ2MEM
            msg_type = `MSG_TYPE_NC_STORE_REQ; // axilite peripheral is writing to the memory?
            msg_data_size = buf_pmesh_data_size; // fix it for now
            msg_address = {{`MSG_ADDR_WIDTH-`PHY_ADDR_WIDTH{1'b0}}, awaddr_fifo_out[`PHY_ADDR_WIDTH-1:3], buf_pmesh_addr[2:0]};
            msg_length = `MSG_LENGTH_WIDTH'd2 + NOC_PAYLOAD_LEN; // 2 extra headers + 1 data
        `else 
            msg_type = `MSG_TYPE_SWAPWB_REQ;
            msg_data_size = `MSG_DATA_SIZE_16B; // fix it for now
            msg_address = {{`MSG_ADDR_WIDTH-`PHY_ADDR_WIDTH{1'b0}}, awaddr_fifo_out[`PHY_ADDR_WIDTH-1:0]};
            msg_length = `MSG_LENGTH_WIDTH'd2 + 2;
        `endif
        end

        MSG_TYPE_LOAD: begin
        `ifdef ARA_REQ2MEM // to memeory 
            msg_type = `MSG_TYPE_NC_LOAD_REQ; 
            msg_data_size = `MSG_DATA_SIZE_8B; 
            msg_length = `MSG_LENGTH_WIDTH'd2; 
            msg_address = {{`MSG_ADDR_WIDTH-`PHY_ADDR_WIDTH{1'b0}}, araddr_fifo_out[`PHY_ADDR_WIDTH-1:0]};
        `else // we can use load noshare to load the data from L2 right now
            msg_type = `MSG_TYPE_LOAD_NOSHARE_REQ; // for L2 LOADNOSHARE test 
            msg_data_size = `MSG_DATA_SIZE_16B; // Noted that L2 still return 16 bytes data 
            msg_length = `MSG_LENGTH_WIDTH'd2; 
            msg_address = {{`MSG_ADDR_WIDTH-`PHY_ADDR_WIDTH{1'b0}}, araddr_fifo_out[`PHY_ADDR_WIDTH-1:0]};
        // `else  // we don;t need to use swap writeback right now
        //     msg_type = `MSG_TYPE_SWAPWB_REQ;
        //     msg_data_size = `MSG_DATA_SIZE_16B; 
        //     msg_length = `MSG_LENGTH_WIDTH'd2 + NULL_PAYLOAD_LEN; // 2 extra header and two extra data (16Bytes zero data)
        //     msg_address = {{`MSG_ADDR_WIDTH-`PHY_ADDR_WIDTH{1'b0}}, araddr_fifo_out[`PHY_ADDR_WIDTH-1:0]};
        `endif
        end
        MSG_TYPE_INVAL: begin 
            msg_type = `MSG_TYPE_RESERVED;
            msg_data_size = `MSG_DATA_SIZE_8B;
            msg_length = `MSG_LENGTH_WIDTH'b0;
            msg_address = {{`MSG_ADDR_WIDTH-`PHY_ADDR_WIDTH{1'b0}}, {`PHY_ADDR_WIDTH{1'b0}}}; 
        end
        default: begin
            msg_type = `MSG_TYPE_RESERVED;
            msg_data_size = `MSG_DATA_SIZE_8B;
            msg_length = `MSG_LENGTH_WIDTH'b0;
            msg_address = {{`MSG_ADDR_WIDTH-`PHY_ADDR_WIDTH{1'b0}}, {`PHY_ADDR_WIDTH{1'b0}}}; 
        end
    endcase
end

always_ff@(posedge clk or negedge rst_n)
begin
    if (!rst_n) begin
        noc_cnt <= 3'b0;
    end
    else begin
        noc_cnt <= (noc_last_header | noc_last_data)  ? 3'b0 :
                    (noc_cnt == 3'b0 && fifo_has_packet) ? noc_cnt + 1: // since ready signal of NoC spilitter depends on producer's valid sinal, we need to let flit header0 ready first
                    (fifo_has_packet && noc_ready_in) ? noc_cnt + 1 : noc_cnt;
    end
end



always_comb
begin
    if (noc_ready_in) begin
        noc_last_header = (flit_state_f == MSG_STATE_HEADER &&
                                    noc_cnt == NOC_HDR_LEN) ? 1'b1 : 1'b0;
        noc_last_data = (flit_state_f == MSG_STATE_NOC_DATA &&
                                    noc_cnt == (msg_length - NOC_HDR_LEN )) ? 1'b1 : 1'b0;
    end
    else begin 
        noc_last_header = 1'b0;
        noc_last_data = 1'b0;
    end 
end


always@(posedge clk or negedge rst_n) 
begin 
    if (!rst_n) begin
        flit_state_f <= MSG_STATE_IDLE;
    end
    else begin
        flit_state_f <= flit_state_next;
    end
end 


always_ff@(posedge clk or negedge rst_n)
begin
    flit_state_next = flit_state_f;
    unique case (flit_state_f)
        MSG_STATE_IDLE: begin
          `ifdef ARA_REQ2MEM
            if ((fifo_has_packet && type_fifo_out == MSG_TYPE_STORE))
                flit_state_next = MSG_STATE_WAIT_STRB;
            else if ((fifo_has_packet && type_fifo_out == MSG_TYPE_LOAD))
                flit_state_next = MSG_STATE_HEADER;
          `else 
            if (fifo_has_packet && ((type_fifo_out == MSG_TYPE_STORE) || (type_fifo_out == MSG_TYPE_LOAD)))
                flit_state_next = MSG_STATE_DEST_CAL;
          `endif 
            else flit_state_next = flit_state_f;
        end
      `ifdef ARA_REQ2MEM
        MSG_STATE_WAIT_STRB:begin
            if (wstrb_outputside_ready & wstrb_outputside_valid)
                flit_state_next = MSG_STATE_HEADER;
            else flit_state_next = flit_state_f;
        end
      `else 
        MSG_STATE_DEST_CAL: begin
            flit_state_next = MSG_STATE_HEADER;
        end
      `endif
      
        MSG_STATE_HEADER: begin
            if (noc_last_header && type_fifo_out == MSG_TYPE_STORE)
                flit_state_next = MSG_STATE_NOC_DATA;
            else if (noc_last_header && type_fifo_out == MSG_TYPE_LOAD)
              `ifdef ARA_REQ2MEM
                flit_state_next = MSG_STATE_IDLE;
              `else
                flit_state_next = MSG_STATE_IDLE;
            //   `else // we don;t need extra data flits for load right now 
            //     flit_state_next = MSG_STATE_NOC_DATA;
              `endif 
            else flit_state_next = flit_state_f;
        end

        MSG_STATE_NOC_DATA: begin
            if (noc_store_done)
                flit_state_next = MSG_STATE_IDLE;
            else if (noc_load_done)
                flit_state_next = MSG_STATE_IDLE;
            else 
                flit_state_next = flit_state_f;
        end
        default: flit_state_next = MSG_STATE_IDLE;
    endcase
end

/*****destination x and y index calculate*************/

`ifndef ARA_REQ2MEM
    l15_home_encoder    l15_home_encoder(
    .home_in        (home_addr_bits_s0),
    .num_homes      (system_tile_count),
    .lhid_out       (lhid_s0)
    );

    flat_id_to_xy lhid_to_xy (
        .flat_id(lhid_s1[`HOME_ID_WIDTH-1:0]),
        .x_coord(lhid_s1_x),
        .y_coord(lhid_s1_y)
    );

    always_ff@(posedge clk or negedge rst_n) begin 
        if (!rst_n) lhid_s1 <= `HOME_ID_WIDTH'b0;
        else if (cal_dest_stage0) lhid_s1 <= lhid_s0;
        else lhid_s1 <= lhid_s1;
    end 

    always_comb 
    begin 
        cal_dest_stage0 = (flit_state_f == MSG_STATE_IDLE);
        cal_dest_stage1 = (flit_state_f == MSG_STATE_DEST_CAL);
        cal_dest_stage2 = (flit_state_f == MSG_STATE_HEADER);
    end 

    always_comb
    begin
        //special l2 addresses start with 0xA
        special_l2_addr_s0 = (axilite2noc_req_address_s0[39:36] == 4'b1010);
    end

    always_comb begin
        unique case (type_fifo_out) 
            MSG_TYPE_STORE: axilite2noc_req_address_s0 = awaddr_fifo_out[`PHY_ADDR_WIDTH-1:0];
            MSG_TYPE_LOAD: axilite2noc_req_address_s0 = araddr_fifo_out[`PHY_ADDR_WIDTH-1:0];
            MSG_TYPE_INVAL:axilite2noc_req_address_s0 = `PHY_ADDR_WIDTH'b0;
            default: axilite2noc_req_address_s0 = `PHY_ADDR_WIDTH'b0;
        endcase
    end 

    always_comb
    begin
        if (special_l2_addr_s0)
        begin
            home_addr_bits_s0 = axilite2noc_req_address_s0[`HOME_ID_ADDR_POS_HIGH];
        end
        else
        begin
            unique case (home_alloc_method) 
            `HOME_ALLOC_LOW_ORDER_BITS:
            begin
                home_addr_bits_s0 = axilite2noc_req_address_s0[`HOME_ID_ADDR_POS_LOW];
            end
            `HOME_ALLOC_MIDDLE_ORDER_BITS:
            begin
                home_addr_bits_s0 = axilite2noc_req_address_s0[`HOME_ID_ADDR_POS_MIDDLE];
            end
            `HOME_ALLOC_HIGH_ORDER_BITS:
            begin
                home_addr_bits_s0 = axilite2noc_req_address_s0[`HOME_ID_ADDR_POS_HIGH];
            end
            `HOME_ALLOC_MIXED_ORDER_BITS:
            begin
                home_addr_bits_s0 = (axilite2noc_req_address_s0[`HOME_ID_ADDR_POS_LOW] ^ axilite2noc_req_address_s0[`HOME_ID_ADDR_POS_MIDDLE]);
            end
            default: home_addr_bits_s0 = `MSG_LHID_WIDTH'b0;
            endcase
        end
    end
`endif 

always_comb
begin
    msg_mshrid = {`MSG_MSHRID_WIDTH{1'b0}};
    msg_options_1 = {`MSG_OPTIONS_1_WIDTH{1'b0}};
    msg_options_2 = 16'b0;
    msg_options_3 = 30'b0;

    flit[`MSG_OPTIONS_1] = msg_options_1;

    flit[`MSG_AMO_MASK0_] = {`MSG_AMO_MASK0_WIDTH{1'b0}};
    flit[`MSG_DATA_SIZE_] = msg_data_size;
    flit[`MSG_OPTIONS_2_] = msg_options_2;

    flit[`MSG_AMO_MASK1_] = {`MSG_AMO_MASK1_WIDTH{1'b0}};
    flit[`MSG_OPTIONS_3_] = msg_options_2;

    flit[`NOC_DATA_WIDTH -1:0] = {`NOC_DATA_WIDTH{1'b0}};
    flit_ready = 1'b0;
    unique case (flit_state_f)
        MSG_STATE_HEADER: begin
            unique case (noc_cnt)
                3'b001: begin
                    flit[`MSG_DST_CHIPID] = dest_chipid;
                  `ifdef ARA_REQ2MEM
                    flit[`MSG_DST_X] = dest_xpos;
                    flit[`MSG_DST_Y] = dest_ypos;
                  `else 
                    flit[`MSG_DST_X] = lhid_s1_x;
                    flit[`MSG_DST_Y] = lhid_s1_y;
                  `endif
                    flit[`MSG_DST_FBITS] = dest_fbits; // to memory or L2 cache
                    flit[`MSG_LENGTH] = msg_length;
                    flit[`MSG_TYPE] = msg_type;
                    flit[`MSG_MSHRID] = msg_mshrid;
                    flit[`MSG_OPTIONS_1] = msg_options_1;
                    flit_ready = 1'b1;
                end

                3'b010: begin
                `ifdef ARA_REQ2MEM
                    flit[`MSG_ADDR_] = msg_address;
                    flit[`MSG_OPTIONS_2_] = msg_options_2;
                    flit[`MSG_DATA_SIZE_] = msg_data_size;
                `else 
                    flit[`MSG_ADDR_] = msg_address;
                    flit[`MSG_DATA_SIZE_] = msg_data_size;
                    flit[`MSG_AMO_MASK0_] = (type_fifo_out == MSG_TYPE_STORE && (write_word_select == 0)) ? wstrb_fifo_mux_out : 8'b0;
                `endif 
                    flit_ready = 1'b1;                  
                end

                3'b011: begin
                `ifdef ARA_REQ2MEM
                    flit[`MSG_SRC_CHIPID_] = src_chipid;
                    flit[`MSG_SRC_X_] = src_xpos;
                    flit[`MSG_SRC_Y_] = src_ypos;
                    flit[`MSG_SRC_FBITS_] = src_fbits;
                    flit[`MSG_OPTIONS_3_] = msg_options_3;
                `else 
                    flit[`MSG_SRC_CHIPID_] = src_chipid;
                    flit[`MSG_SRC_X_] = src_xpos;
                    flit[`MSG_SRC_Y_] = src_ypos;
                    flit[`MSG_SRC_FBITS_] = src_fbits;
                    flit[`MSG_AMO_MASK1_] = (type_fifo_out == MSG_TYPE_STORE && (write_word_select == 1)) ? wstrb_fifo_mux_out : 8'b0;
                `endif 
                    flit_ready = 1'b1;
                end
            endcase
        end

        MSG_STATE_NOC_DATA: begin
            flit[`NOC_DATA_WIDTH-1:0] = (type_fifo_out == MSG_TYPE_STORE) ? wdata_fifo_out : {`NOC_DATA_WIDTH{1'b0}}; //wdata_fifo_out;
            //flit[`NOC_DATA_WIDTH-1:0] = (type_fifo_out == MSG_TYPE_STORE) ? out_data[noc_cnt] : {`NOC_DATA_WIDTH{1'b0}}; //wdata_fifo_out;
            flit_ready = 1'b1;
        end

        default: begin
            flit[`NOC_DATA_WIDTH-1:0] = {`NOC_DATA_WIDTH{1'b0}};
            flit_ready = 1'b0;
        end
    endcase
end

assign noc_valid_out = flit_ready;
assign noc_data_out = flit;

endmodule 