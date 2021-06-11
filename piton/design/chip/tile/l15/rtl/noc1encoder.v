/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

//==================================================================================================
//  Filename      : noc1encoder.v
//  Created On    : 2014-02-05 20:06:27
//  Revision      :
//  Author        : Tri Nguyen
//  Company       : Princeton University
//  Email         : trin@princeton.edu
//
//  Description   :
//
//
//==================================================================================================
`include "l15.tmp.h"
`include "define.tmp.h"

`ifdef DEFAULT_NETTYPE_NONE
`default_nettype none
`endif
module noc1encoder(
   input wire clk,
   input wire rst_n,

   // interface with noc1buffer
   input wire [63:0] noc1buffer_noc1encoder_req_data_0,
   input wire [63:0] noc1buffer_noc1encoder_req_data_1,
   input wire noc1buffer_noc1encoder_req_val,
   input wire [`L15_NOC1_REQTYPE_WIDTH-1:0] noc1buffer_noc1encoder_req_type,
   input wire [`L15_MSHR_ID_WIDTH-1:0] noc1buffer_noc1encoder_req_mshrid,
   input wire [`L15_THREADID_MASK] noc1buffer_noc1encoder_req_threadid,
   input wire [39:0] noc1buffer_noc1encoder_req_address,
   input wire noc1buffer_noc1encoder_req_non_cacheable,
   input wire [`PCX_SIZE_WIDTH-1:0] noc1buffer_noc1encoder_req_size,
   input wire noc1buffer_noc1encoder_req_prefetch,
   // input wire noc1buffer_noc1encoder_req_blkstore,
   // input wire noc1buffer_noc1encoder_req_blkinitstore,
   input wire [`PACKET_HOME_ID_WIDTH-1:0] noc1buffer_noc1encoder_req_homeid,
   input wire [`MSG_SDID_WIDTH-1:0] noc1buffer_noc1encoder_req_csm_sdid,
   input wire [`MSG_LSID_WIDTH-1:0] noc1buffer_noc1encoder_req_csm_lsid,

   output reg noc1encoder_noc1buffer_req_ack,

   // current chip position
   input wire [`NOC_CHIPID_WIDTH-1:0] chipid,
   input wire [`NOC_X_WIDTH-1:0] coreid_x,
   input wire [`NOC_Y_WIDTH-1:0] coreid_y,

   // ready at noc1
   input wire noc1out_ready,
   output reg noc1encoder_noc1out_val,
   output reg [63:0] noc1encoder_noc1out_data,

   // dmbr stall interface
   input wire dmbr_l15_stall,
   output reg                       l15_dmbr_l1missIn,
   output reg [`DMBR_TAG_WIDTH-1:0] l15_dmbr_l1missTag,

   // csm interface
   input wire csm_noc1encoder_req_val,
   input wire [`L15_NOC1_REQTYPE_WIDTH-1:0] csm_noc1encoder_req_type,
   input wire [`L15_CSM_NUM_TICKETS_LOG2-1:0] csm_noc1encoder_req_mshrid,
   input wire [`PHY_ADDR_WIDTH-1:0] csm_noc1encoder_req_address,
   input wire csm_noc1encoder_req_non_cacheable,
   input wire  [`PCX_SIZE_WIDTH-1:0] csm_noc1encoder_req_size,
   output reg noc1encoder_csm_req_ack
);
// The flit sending out this cycle
reg [63:0] flit;
reg [`NOC1_FLIT_STATE_WIDTH-1:0] flit_state;
reg [`NOC1_FLIT_STATE_WIDTH-1:0] flit_state_next;

reg sending;
reg dmbr_stall;
reg control_raw_data_flit1;

always @ (posedge clk)
begin
   if (!rst_n)
   begin
      flit_state <= 0;
   end
   else
   begin
      flit_state <= flit_state_next;
   end
end


always @ *
begin

   // simple alias for output
   noc1encoder_noc1out_data = flit;

   // sending throttle for dmbr
   dmbr_stall = dmbr_l15_stall && (flit_state == 0); // let's not stall in the middle of a msg
   sending = (noc1buffer_noc1encoder_req_val || csm_noc1encoder_req_val) && !dmbr_stall;
   noc1encoder_noc1out_val = sending;

end

// mux selects between l15 buffer and csm, with priority to csm
// generate request signals
reg [`L15_NOC1ENCODER_SOURCE_WIDTH-1:0] last_req_source;
reg [`L15_NOC1ENCODER_SOURCE_WIDTH-1:0] req_source;
reg [`L15_NOC1_REQTYPE_WIDTH-1:0] req_type;
reg req_prefetch;
reg req_nc;
// reg req_blkstore;
// reg req_blkinitstore;
reg [63:0] req_data0;
reg [63:0] req_data1;
reg [39:0] req_address;
reg [`MSG_MSHRID_WIDTH-1:0] req_mshrid;
reg [`PCX_SIZE_WIDTH-1:0] req_size;
reg [`NOC_X_WIDTH-1:0] req_dest_l2_xpos;
reg [`NOC_Y_WIDTH-1:0] req_dest_l2_ypos;
reg [`NOC_CHIPID_WIDTH-1:0] req_dest_chipid;
reg [`MSG_LSID_WIDTH-1:0] req_csm_lsid;
reg [`MSG_SDID_WIDTH-1:0] req_csm_sdid;
always @ (posedge clk)
begin
   if (!rst_n)
      last_req_source <= 0;
   else
      last_req_source <= req_source;
end

always @ *
begin
   req_source = 0;
   req_type = 0;
   req_prefetch = 0;
   req_nc = 0;
   // req_blkstore = 0;
   // req_blkinitstore = 0;
   req_data0 = 0;
   req_data1 = 0;
   req_address = 0;
   req_mshrid = 0;
   req_size = 0;
   req_dest_l2_xpos = 0;
   req_dest_l2_ypos = 0;
   req_dest_chipid = 0;
   req_csm_lsid = 0;
   req_csm_sdid = 0;

   if ((last_req_source == `L15_NOC1ENCODER_SOURCE_L15 && (flit_state != 0)) ||
         csm_noc1encoder_req_val == 1'b0)
   begin
      // condition for selecting L15 as source:
      // 1. was sending L15 message last cycle is is still sending (no interruption)
      // 2. or csm is not sending
      req_source = `L15_NOC1ENCODER_SOURCE_L15;
   end
   else
   begin
      // else select csm
      req_source = `L15_NOC1ENCODER_SOURCE_CSM;
   end

   if (req_source == `L15_NOC1ENCODER_SOURCE_L15)
   begin
      req_type = noc1buffer_noc1encoder_req_type;
      req_prefetch = noc1buffer_noc1encoder_req_prefetch;
      req_nc = noc1buffer_noc1encoder_req_non_cacheable;
      // req_blkstore = 1'b0; // All block stores are translated to normal stores
      // req_blkinitstore = 1'b0;
      req_data0 = noc1buffer_noc1encoder_req_data_0;
      req_data1 = noc1buffer_noc1encoder_req_data_1;
      req_address = noc1buffer_noc1encoder_req_address;
      req_mshrid = {noc1buffer_noc1encoder_req_threadid,noc1buffer_noc1encoder_req_mshrid};
      req_size = noc1buffer_noc1encoder_req_size;
      req_dest_l2_xpos = noc1buffer_noc1encoder_req_homeid[`PACKET_HOME_ID_X_MASK];
      req_dest_l2_ypos = noc1buffer_noc1encoder_req_homeid[`PACKET_HOME_ID_Y_MASK];
      req_dest_chipid = noc1buffer_noc1encoder_req_homeid[`PACKET_HOME_ID_CHIP_MASK];

      if (req_type != `L15_NOC1_REQTYPE_WRITEBACK_GUARD)
      begin
        req_csm_lsid = noc1buffer_noc1encoder_req_csm_lsid;
        req_csm_sdid = noc1buffer_noc1encoder_req_csm_sdid;
      end
   end
   else
   begin
      req_type = csm_noc1encoder_req_type;
      req_nc = csm_noc1encoder_req_non_cacheable;
      req_address = csm_noc1encoder_req_address;
      req_size = csm_noc1encoder_req_size;
      req_mshrid = csm_noc1encoder_req_mshrid;

      // send to home l2
      req_dest_l2_xpos = coreid_x;
      req_dest_l2_ypos = coreid_y;
      req_dest_chipid = chipid;

      // csm mshrid has the most significant bit set
      req_mshrid = req_mshrid | {1'b1, {`MSG_MSHRID_WIDTH-1{1'b0}}};
   end


end

// translate req_ -> msg_
reg [`PHY_ADDR_WIDTH-1:0]              msg_address;
reg [`NOC_X_WIDTH-1:0]                 msg_dest_l2_xpos;
reg [`NOC_Y_WIDTH-1:0]                 msg_dest_l2_ypos;
reg [`NOC_X_WIDTH-1:0]                 msg_dest_l2_xpos_new;
reg [`NOC_Y_WIDTH-1:0]                 msg_dest_l2_ypos_new;
wire [`NOC_X_WIDTH-1:0]                msg_dest_l2_xpos_compat;
wire [`NOC_Y_WIDTH-1:0]                msg_dest_l2_ypos_compat;
reg [`NOC_CHIPID_WIDTH-1:0]            msg_dest_chipid;
reg [`NOC_FBITS_WIDTH-1:0]             msg_dest_fbits;
reg [`NOC_X_WIDTH-1:0]                 msg_src_xpos;
reg [`NOC_Y_WIDTH-1:0]                 msg_src_ypos;
reg [`NOC_CHIPID_WIDTH-1:0]            msg_src_chipid;
reg [`NOC_FBITS_WIDTH-1:0]             msg_src_fbits;
reg [`MSG_LENGTH_WIDTH-1:0]            msg_length;
reg [`MSG_TYPE_WIDTH-1:0]              msg_type;
reg [`MSG_MSHRID_WIDTH-1:0]            msg_mshrid;
reg [`MSG_MESI_BITS-1:0]               msg_mesi;
reg [`MSG_LAST_SUBLINE_WIDTH-1:0]      msg_last_subline;
reg [`MSG_OPTIONS_1]                   msg_options_1;
reg [`MSG_OPTIONS_2_]                  msg_options_2;
reg [`MSG_OPTIONS_3_]                  msg_options_3;
reg [`MSG_CACHE_TYPE_WIDTH-1:0]        msg_cache_type;
reg [`MSG_SUBLINE_VECTOR_WIDTH-1:0]    msg_subline_vector;
reg [`MSG_DATA_SIZE_WIDTH-1:0]         msg_data_size;
reg [5:0] t1_interrupt_cpuid;
always @ *
begin
   msg_length = 0;
   msg_type = 0;
   msg_mesi = 0;
   msg_last_subline = 0;
   msg_cache_type = 0;
   msg_subline_vector = 0; // always 0 for requests
   control_raw_data_flit1 = 0;
   t1_interrupt_cpuid = 0;

   msg_address = req_address;
   msg_mshrid = req_mshrid;
   msg_data_size = req_size;

   // source are static
   msg_src_xpos = coreid_x;
   msg_src_ypos = coreid_y;
   msg_src_chipid = chipid;
   msg_src_fbits = `NOC_FBITS_L1;
   msg_dest_fbits = `NOC_FBITS_L2;

   // default value for a message, will be overwritten by interrupt reqs
   msg_dest_l2_xpos = req_dest_l2_xpos;
   msg_dest_l2_ypos = req_dest_l2_ypos;
   msg_dest_chipid = req_dest_chipid;

   // trin: removing latches
   msg_dest_l2_xpos_new = 0;
   msg_dest_l2_ypos_new = 0;


   case (req_type)
      `L15_NOC1_REQTYPE_WRITEBACK_GUARD:
      begin
         msg_type = `MSG_TYPE_WBGUARD_REQ;
         msg_length = 2; // 2 extra headers
         msg_cache_type = `MSG_CACHE_TYPE_DATA;
      end
      `L15_NOC1_REQTYPE_LD_REQUEST:
      begin
         // this needs to be splitted into
         //  normal ld, ld nc, and prefetch ld
         if (req_prefetch)
            msg_type = `MSG_TYPE_PREFETCH_REQ;
         else if (req_nc)
            msg_type = `MSG_TYPE_NC_LOAD_REQ;
         else
            msg_type = `MSG_TYPE_LOAD_REQ;
         msg_length = 2; // 2 extra headers
         msg_cache_type = `MSG_CACHE_TYPE_DATA;
      end
      `L15_NOC1_REQTYPE_IFILL_REQUEST:
      begin
         // can be either normal or nc
         if (req_nc)
            msg_type = `MSG_TYPE_NC_LOAD_REQ;
         else
            msg_type = `MSG_TYPE_LOAD_REQ;
         msg_length = 2; // 2 extra headers
         msg_cache_type = `MSG_CACHE_TYPE_INS;
      end
      `L15_NOC1_REQTYPE_WRITETHROUGH_REQUEST:
      begin
         // can be nc store, blkstore, or blkinitstore
         if (req_nc)
            msg_type = `MSG_TYPE_NC_STORE_REQ;
         // else if (req_blkstore)
            // msg_type = `MSG_TYPE_BLKINIT_STORE_REQ;
         // else if (req_blkinitstore)
            // msg_type = `MSG_TYPE_BLK_STORE_REQ;
         msg_cache_type = `MSG_CACHE_TYPE_DATA;
         msg_length = 3; // 2 extra headers + 1 data
      end
      `L15_NOC1_REQTYPE_ST_UPGRADE_REQUEST, `L15_NOC1_REQTYPE_ST_FILL_REQUEST:
      begin
         // should specify the sub cacheline? no, the L2 should be able to detect
         //      based on the msg_address
         msg_type = `MSG_TYPE_STORE_REQ;
         msg_cache_type = `MSG_CACHE_TYPE_DATA;
         msg_length = 2; // 2 extra headers
      end
      `L15_NOC1_REQTYPE_CAS_REQUEST:
      begin
         msg_type = `MSG_TYPE_CAS_REQ;
         msg_cache_type = `MSG_CACHE_TYPE_DATA;
         msg_length = 4; // 2 extra headers + 1 compare data + 1 swap data
      end
      `L15_NOC1_REQTYPE_SWAP_REQUEST:
      begin
         msg_type = `MSG_TYPE_SWAP_REQ;
         msg_cache_type = `MSG_CACHE_TYPE_DATA;
         msg_length = 3; // 2 extra headers + 1 swap data
      end
      `L15_NOC1_REQTYPE_INTERRUPT_FWD:
      begin
         msg_type = `MSG_TYPE_INTERRUPT_FWD;
         msg_length = 1; // just 1 data
         control_raw_data_flit1 = 1'b1;
         t1_interrupt_cpuid = req_data0[14:9];
         msg_dest_l2_xpos_new = req_data0[`NOC_X_WIDTH+17:18];
         msg_dest_l2_ypos_new = req_data0[`NOC_Y_WIDTH+`NOC_X_WIDTH+17:`NOC_X_WIDTH+18];
         msg_dest_l2_xpos = req_data0[63] ? msg_dest_l2_xpos_new : msg_dest_l2_xpos_compat; 
         msg_dest_l2_ypos = req_data0[63] ? msg_dest_l2_ypos_new : msg_dest_l2_ypos_compat; 
         msg_dest_chipid  = req_data0[63] ? req_data0[`NOC_CHIPID_WIDTH+`NOC_Y_WIDTH+`NOC_X_WIDTH+17:`NOC_Y_WIDTH+`NOC_X_WIDTH+18] : `NOC_CHIPID_WIDTH'b0;
      end
      `L15_NOC1_REQTYPE_LR_REQUEST:
      begin
         msg_type = `MSG_TYPE_LR_REQ;
         msg_length = 2; // 2 extra headers
         msg_cache_type = `MSG_CACHE_TYPE_DATA;
      end
      `L15_NOC1_REQTYPE_AMO_ADD_REQUEST:
      begin
         msg_type = `MSG_TYPE_AMO_ADD_REQ;
         msg_cache_type = `MSG_CACHE_TYPE_DATA;
         msg_length = 3; // 2 extra headers + 1 swap data
      end
      `L15_NOC1_REQTYPE_AMO_AND_REQUEST:
      begin
         msg_type = `MSG_TYPE_AMO_AND_REQ;
         msg_cache_type = `MSG_CACHE_TYPE_DATA;
         msg_length = 3; // 2 extra headers + 1 swap data
      end
      `L15_NOC1_REQTYPE_AMO_OR_REQUEST:
      begin
         msg_type = `MSG_TYPE_AMO_OR_REQ;
         msg_cache_type = `MSG_CACHE_TYPE_DATA;
         msg_length = 3; // 2 extra headers + 1 swap data
      end
      `L15_NOC1_REQTYPE_AMO_XOR_REQUEST:
      begin
         msg_type = `MSG_TYPE_AMO_XOR_REQ;
         msg_cache_type = `MSG_CACHE_TYPE_DATA;
         msg_length = 3; // 2 extra headers + 1 swap data
      end
      `L15_NOC1_REQTYPE_AMO_MAX_REQUEST:
      begin
         msg_type = `MSG_TYPE_AMO_MAX_REQ;
         msg_cache_type = `MSG_CACHE_TYPE_DATA;
         msg_length = 3; // 2 extra headers + 1 swap data
      end
      `L15_NOC1_REQTYPE_AMO_MAXU_REQUEST:
      begin
         msg_type = `MSG_TYPE_AMO_MAXU_REQ;
         msg_cache_type = `MSG_CACHE_TYPE_DATA;
         msg_length = 3; // 2 extra headers + 1 swap data
      end
      `L15_NOC1_REQTYPE_AMO_MIN_REQUEST:
      begin
         msg_type = `MSG_TYPE_AMO_MIN_REQ;
         msg_cache_type = `MSG_CACHE_TYPE_DATA;
         msg_length = 3; // 2 extra headers + 1 swap data
      end
      `L15_NOC1_REQTYPE_AMO_MINU_REQUEST:
      begin
         msg_type = `MSG_TYPE_AMO_MINU_REQ;
         msg_cache_type = `MSG_CACHE_TYPE_DATA;
         msg_length = 3; // 2 extra headers + 1 swap data
      end
   endcase
end

flat_id_to_xy cpuid_to_xy (
    .flat_id(t1_interrupt_cpuid),
    .x_coord(msg_dest_l2_xpos_compat),
    .y_coord(msg_dest_l2_ypos_compat)
    );

always @ *
begin
   msg_options_1 = 0;
   msg_options_2 = 0;
   msg_options_3 = 0;

   msg_options_2[`MSG_DATA_SIZE_] = msg_data_size;
   msg_options_2[`MSG_CACHE_TYPE_] = msg_cache_type;
   msg_options_2[`MSG_SUBLINE_VECTOR_] = msg_subline_vector;

   msg_options_3[`MSG_SDID_] = req_csm_sdid;
   msg_options_3[`MSG_LSID_] = req_csm_lsid;
end


// flit filling logic
// translate msg_ -> flit
always @ *
begin
   flit[`NOC_DATA_WIDTH-1:0] = 0; // so that the flit is not a latch
   if (flit_state == `NOC1_REQ_HEADER_1)
   begin
      flit[`MSG_DST_CHIPID] = msg_dest_chipid;
      flit[`MSG_DST_X] = msg_dest_l2_xpos;
      flit[`MSG_DST_Y] = msg_dest_l2_ypos;
      flit[`MSG_DST_FBITS] = msg_dest_fbits;
      flit[`MSG_LENGTH] = msg_length;
      flit[`MSG_TYPE] = msg_type;
      flit[`MSG_MSHRID] = msg_mshrid;
      flit[`MSG_OPTIONS_1] = msg_options_1;
   end
   else if (flit_state == `NOC1_REQ_HEADER_2)
   begin
      if (control_raw_data_flit1)
      begin
         flit[`NOC_DATA_WIDTH-1:0] = req_data0;
         // also need to suppress cpuid before sending
         flit[15:9] = 0;
      end
      else
      begin
         flit[`MSG_ADDR_] = msg_address;
         flit[`MSG_CACHE_TYPE_] = msg_cache_type;
         flit[`MSG_OPTIONS_2_] = msg_options_2;
      end
   end
   else if (flit_state == `NOC1_REQ_HEADER_3)
   begin
      flit[`MSG_SRC_CHIPID_] = msg_src_chipid;
      flit[`MSG_SRC_X_] = msg_src_xpos;
      flit[`MSG_SRC_Y_] = msg_src_ypos;
      flit[`MSG_SRC_FBITS_] = msg_src_fbits;
      flit[`MSG_OPTIONS_3_] = msg_options_3;
   end
   else if (flit_state == `NOC1_REQ_DATA_1)
   begin
      flit[`NOC_DATA_WIDTH-1:0] = req_data0;
   end
   else if (flit_state == `NOC1_REQ_DATA_2)
   begin
      flit[`NOC_DATA_WIDTH-1:0] = req_data1;
   end
end

always @ *
begin
   // next flit state logic
   if (sending)
   begin
      if (noc1out_ready)
      begin
         if (flit_state != msg_length)
            flit_state_next = flit_state + 1;
         else
            flit_state_next = `NOC1_REQ_HEADER_1;
      end
      else
         flit_state_next = flit_state;
   end
   else
      flit_state_next = `NOC1_REQ_HEADER_1;
end

always @ *
begin
   // ack logic to L1.5
   noc1encoder_noc1buffer_req_ack = 0;
   if (noc1buffer_noc1encoder_req_val && (flit_state == msg_length) && noc1out_ready
   && (req_source == `L15_NOC1ENCODER_SOURCE_L15))
      noc1encoder_noc1buffer_req_ack = 1'b1;
   else
      noc1encoder_noc1buffer_req_ack = 1'b0;

   // ack logic to CSM
   noc1encoder_csm_req_ack = 0;
   if (csm_noc1encoder_req_val && (flit_state == msg_length) && noc1out_ready 
   && (req_source == `L15_NOC1ENCODER_SOURCE_CSM))
      noc1encoder_csm_req_ack = 1'b1;
   else
      noc1encoder_csm_req_ack = 1'b0;
end

always @ *
begin
   // hook for dmbr
   l15_dmbr_l1missIn = 0;
   l15_dmbr_l1missTag = 0;

   // trin: timing fix
   // removing CSM requests out of the requests to DMBR
   // if (sending && noc1out_ready && (flit_state == msg_length))
   if (noc1encoder_noc1buffer_req_ack)
   begin
      if (req_type == `L15_NOC1_REQTYPE_LD_REQUEST ||
         req_type == `L15_NOC1_REQTYPE_IFILL_REQUEST ||
         req_type == `L15_NOC1_REQTYPE_ST_UPGRADE_REQUEST ||
         req_type == `L15_NOC1_REQTYPE_ST_FILL_REQUEST ||
         req_type == `L15_NOC1_REQTYPE_CAS_REQUEST ||
         req_type == `L15_NOC1_REQTYPE_SWAP_REQUEST ||
         req_type == `L15_NOC1_REQTYPE_AMO_ADD_REQUEST ||
         req_type == `L15_NOC1_REQTYPE_AMO_AND_REQUEST ||
         req_type == `L15_NOC1_REQTYPE_AMO_OR_REQUEST ||
         req_type == `L15_NOC1_REQTYPE_AMO_XOR_REQUEST ||
         req_type == `L15_NOC1_REQTYPE_AMO_MAX_REQUEST ||
         req_type == `L15_NOC1_REQTYPE_AMO_MAXU_REQUEST ||
         req_type == `L15_NOC1_REQTYPE_AMO_MIN_REQUEST ||
         req_type == `L15_NOC1_REQTYPE_AMO_MINU_REQUEST)
      begin
         l15_dmbr_l1missIn = 1'b1;
         l15_dmbr_l1missTag = msg_mshrid[`DMBR_TAG_WIDTH-1:0]; // TODO: might be wrong please contact Tri
      end
   end
end

endmodule
