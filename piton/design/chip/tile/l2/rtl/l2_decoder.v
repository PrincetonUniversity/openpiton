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
//  Filename      : l2_decoder.v
//  Created On    : 2014-02-25
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : The message decoder in the L2 cache
//
//
//====================================================================================================

`include "l2.tmp.h"
`include "define.tmp.h"

module l2_decoder(

    input wire [`MSG_HEADER_WIDTH-1:0] msg_header,

    output reg [`MSG_TYPE_WIDTH-1:0] msg_type,
    output reg [`MSG_LENGTH_WIDTH-1:0] msg_length,
    output reg [`MSG_MSHRID_WIDTH-1:0] msg_mshrid,
    output reg [`MSG_DATA_SIZE_WIDTH-1:0] msg_data_size,
    output reg [`MSG_CACHE_TYPE_WIDTH-1:0] msg_cache_type,
    output reg [`MSG_SUBLINE_VECTOR_WIDTH-1:0] msg_subline_vector,
    output reg [`MSG_MESI_BITS-1:0] msg_mesi,
    output reg [`MSG_L2_MISS_BITS-1:0] msg_l2_miss,
    output reg [`MSG_SUBLINE_ID_WIDTH-1:0] msg_subline_id,
    output reg [`MSG_LAST_SUBLINE_WIDTH-1:0] msg_last_subline,
    output reg [`PHY_ADDR_WIDTH-1:0] msg_addr,
    output reg [`MSG_SRC_CHIPID_WIDTH-1:0] msg_src_chipid,
    output reg [`MSG_SRC_X_WIDTH-1:0] msg_src_x,
    output reg [`MSG_SRC_Y_WIDTH-1:0] msg_src_y,
    output reg [`MSG_SRC_FBITS_WIDTH-1:0] msg_src_fbits,
    output reg [`MSG_SDID_WIDTH-1:0] msg_sdid,
    output reg [`MSG_LSID_WIDTH-1:0] msg_lsid
);

always @ *
begin
    msg_type = msg_header[`MSG_TYPE];
    msg_length = msg_header[`MSG_LENGTH];
    msg_mshrid = msg_header[`MSG_MSHRID];
    msg_data_size = msg_header[`MSG_DATA_SIZE];
    msg_cache_type = msg_header[`MSG_CACHE_TYPE];
    msg_subline_vector = msg_header[`MSG_SUBLINE_VECTOR];
    msg_mesi = msg_header[`MSG_MESI];
    msg_l2_miss = msg_header[`MSG_L2_MISS];
    msg_subline_id = msg_header[`MSG_SUBLINE_ID];
    msg_last_subline = msg_header[`MSG_LAST_SUBLINE];
    msg_addr = msg_header[`MSG_ADDR];
    msg_src_chipid = msg_header[`MSG_SRC_CHIPID];
    msg_src_x = msg_header[`MSG_SRC_X];
    msg_src_y = msg_header[`MSG_SRC_Y];
    msg_src_fbits = msg_header[`MSG_SRC_FBITS];
    msg_sdid = msg_header[`MSG_SDID];
    msg_lsid = msg_header[`MSG_LSID];
end

endmodule
