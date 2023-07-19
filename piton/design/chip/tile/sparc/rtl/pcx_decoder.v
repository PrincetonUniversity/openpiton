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
//  Filename      : pcx_decoder.v
//  Created On    : 2014-03-03 22:08:49
//  Last Modified : 2015-01-22 17:20:15
//  Revision      :
//
//  Description   :
//
//
//==================================================================================================
//pcx_decoder.v

`include "iop.h"

module pcx_decoder(
   input wire clk,
   input wire rst_n,

   input wire [`PCX_WIDTH-1:0]   pcxbuf_pcxdecoder_data,
   input wire [`PCX_WIDTH-1:0]   pcxbuf_pcxdecoder_data_buf1,
   input wire [`TLB_CSM_WIDTH-1:0]   pcxbuf_pcxdecoder_csm_data,
   input wire                    pcxbuf_pcxdecoder_valid,
   input wire                    l15_pcxdecoder_ack,
   input wire                    l15_pcxdecoder_header_ack,

   output reg        pcxdecoder_pcxbuf_ack,
   output reg [4:0]  pcxdecoder_l15_rqtype,
   output reg [`L15_AMO_OP_WIDTH-1:0]  pcxdecoder_l15_amo_op,
   output reg        pcxdecoder_l15_nc,
   output reg [2:0]  pcxdecoder_l15_size,
   output reg [`L15_THREADID_MASK]  pcxdecoder_l15_threadid,
   output reg        pcxdecoder_l15_prefetch,
   output reg        pcxdecoder_l15_invalidate_cacheline,
   output reg        pcxdecoder_l15_blockstore,
   output reg        pcxdecoder_l15_blockinitstore,
   output reg [1:0]  pcxdecoder_l15_l1rplway,
   output reg        pcxdecoder_l15_val,
   output reg [39:0] pcxdecoder_l15_address,
   output reg [63:0] pcxdecoder_l15_data,
   output reg [63:0] pcxdecoder_l15_data_next_entry,
   output reg [`TLB_CSM_WIDTH-1:0] pcxdecoder_l15_csm_data
   );


wire [`PCX_WIDTH-1:0] message = pcxbuf_pcxdecoder_data;

reg is_message_new;
reg is_message_new_next;
always @ (posedge clk)
begin
   if (!rst_n)
      is_message_new <= 1'b1;
   else
      is_message_new <= is_message_new_next;
end

reg [2:0] pcxdecoder_l15_size_pcx_standard;
reg [2:0] pcxdecoder_l15_size_pmesh_standard;

always @ *
begin
   pcxdecoder_l15_val = pcxbuf_pcxdecoder_valid && message[`PCX_VLD] && is_message_new;
   // pcxdecoder_l15_val = pcxbuf_pcxdecoder_valid;
   pcxdecoder_pcxbuf_ack = l15_pcxdecoder_ack || (pcxbuf_pcxdecoder_valid && !message[`PCX_VLD]);
   pcxdecoder_l15_csm_data = pcxbuf_pcxdecoder_csm_data;

   pcxdecoder_l15_rqtype = message[`PCX_RQ_HI:`PCX_RQ_LO];
   pcxdecoder_l15_amo_op = `L15_AMO_OP_NONE;
   pcxdecoder_l15_nc = message[`PCX_NC];
   pcxdecoder_l15_threadid = message[`PCX_TH_HI:`PCX_TH_LO];
   pcxdecoder_l15_prefetch = message[110];
   pcxdecoder_l15_blockstore = message[110];
   pcxdecoder_l15_invalidate_cacheline = message[111];
   pcxdecoder_l15_blockinitstore = message[109];
   pcxdecoder_l15_l1rplway = message[`PCX_WY_HI:`PCX_WY_LO];
   pcxdecoder_l15_size_pcx_standard = message[`PCX_SZ_HI:`PCX_SZ_LO];
   pcxdecoder_l15_address = message[`PCX_AD_HI:`PCX_AD_LO]; // 40b
   pcxdecoder_l15_data = message[`PCX_DA_HI:`PCX_DA_LO];
   pcxdecoder_l15_data_next_entry = pcxbuf_pcxdecoder_data_buf1[`PCX_DA_HI:`PCX_DA_LO];

   // is_message_new is 1 on a new message, even if it's not valid yet
   // when header ack is received, it becomes 0 until the next "new" message
   // otherwise retain the newness value
   is_message_new_next = l15_pcxdecoder_ack ? 1'b1 :
                         l15_pcxdecoder_header_ack ? 1'b0 : is_message_new;

   if (message[`PCX_RQ_HI:`PCX_RQ_LO] == `PCX_REQTYPE_CAS1)
   begin
      pcxdecoder_l15_rqtype = `PCX_REQTYPE_AMO;
      pcxdecoder_l15_amo_op = `L15_AMO_OP_CAS1;
   end
   else if (message[`PCX_RQ_HI:`PCX_RQ_LO] == `PCX_REQTYPE_CAS2)
   begin
      pcxdecoder_l15_rqtype = `PCX_REQTYPE_AMO;
      pcxdecoder_l15_amo_op = `L15_AMO_OP_CAS2;
   end
   else if (message[`PCX_RQ_HI:`PCX_RQ_LO] == `PCX_REQTYPE_SWP_LOADSTUB)
   begin
      pcxdecoder_l15_rqtype = `PCX_REQTYPE_AMO;
      pcxdecoder_l15_amo_op = `L15_AMO_OP_SWAP;
   end
end

always @(*) begin
   case (pcxdecoder_l15_size_pcx_standard)
      `PCX_SZ_1B:
         pcxdecoder_l15_size_pmesh_standard = `MSG_DATA_SIZE_1B;
      `PCX_SZ_2B:
         pcxdecoder_l15_size_pmesh_standard = `MSG_DATA_SIZE_2B;
      `PCX_SZ_4B:
         pcxdecoder_l15_size_pmesh_standard = `MSG_DATA_SIZE_4B;
      `PCX_SZ_8B:
         pcxdecoder_l15_size_pmesh_standard = `MSG_DATA_SIZE_8B;
      `PCX_SZ_16B:
         pcxdecoder_l15_size_pmesh_standard = `MSG_DATA_SIZE_16B;
   endcase
`ifdef L2_SEND_NC_REQ
   // Sparc sends both 4B and 32B non-cacheable ifill. 
   // Since we could not distinguish them, 
   // we set the data size to always be 32B for ifill
   if (pcxdecoder_l15_rqtype == `PCX_REQTYPE_IFILL && ~pcxdecoder_l15_invalidate_cacheline) begin
        pcxdecoder_l15_size_pmesh_standard = `MSG_DATA_SIZE_32B;
   end
`endif

    pcxdecoder_l15_size = pcxdecoder_l15_size_pmesh_standard;
end
endmodule
