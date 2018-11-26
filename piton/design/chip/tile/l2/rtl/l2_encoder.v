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
//  Filename      : l2_encoder.v
//  Created On    : 2014-03-03
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : The message encoder in the L2 cache
//
//
//====================================================================================================


`include "l2.tmp.h"
`include "define.tmp.h"

module l2_encoder(

    input wire [`MSG_SRC_CHIPID_WIDTH-1:0] msg_dst_chipid,
    input wire [`MSG_SRC_X_WIDTH-1:0] msg_dst_x,
    input wire [`MSG_SRC_Y_WIDTH-1:0] msg_dst_y,
    input wire [`MSG_SRC_FBITS_WIDTH-1:0] msg_dst_fbits,
    input wire [`MSG_LENGTH_WIDTH-1:0] msg_length,
    input wire [`MSG_TYPE_WIDTH-1:0] msg_type,
    input wire [`MSG_MSHRID_WIDTH-1:0] msg_mshrid,
    input wire [`MSG_DATA_SIZE_WIDTH-1:0] msg_data_size,
    input wire [`MSG_CACHE_TYPE_WIDTH-1:0] msg_cache_type,
    input wire [`MSG_SUBLINE_VECTOR_WIDTH-1:0] msg_subline_vector,
    input wire [`MSG_MESI_BITS-1:0] msg_mesi,
    input wire [`MSG_L2_MISS_BITS-1:0] msg_l2_miss,
    input wire [`MSG_LAST_SUBLINE_WIDTH-1:0] msg_last_subline,
    input wire [`MSG_SUBLINE_ID_WIDTH-1:0] msg_subline_id,
    input wire [`PHY_ADDR_WIDTH-1:0] msg_addr,
    input wire [`MSG_SRC_CHIPID_WIDTH-1:0] msg_src_chipid,
    input wire [`MSG_SRC_X_WIDTH-1:0] msg_src_x,
    input wire [`MSG_SRC_Y_WIDTH-1:0] msg_src_y,
    input wire [`MSG_SRC_FBITS_WIDTH-1:0] msg_src_fbits,
    input wire [`MSG_SDID_WIDTH-1:0] msg_sdid,
    input wire [`MSG_LSID_WIDTH-1:0] msg_lsid,


    output reg [`MSG_HEADER_WIDTH-1:0] msg_header
);

always @ *
begin
    msg_header = {msg_src_chipid,
                  msg_src_x,
                  msg_src_y,
                  msg_src_fbits,
                  msg_sdid,
                  msg_lsid,
                  14'd0,

                  8'd0,
                  msg_addr,
                  msg_subline_vector,
                  msg_cache_type,
                  msg_data_size,
                  8'd0,

                  msg_dst_chipid,
                  msg_dst_x,
                  msg_dst_y,
                  msg_dst_fbits,
                  msg_length,
                  msg_type,
                  msg_mshrid,
                  msg_mesi,
                  msg_l2_miss,
                  msg_subline_id,
                  msg_last_subline};
end

endmodule
