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
//  Filename      : l2_mshr_decoder.v
//  Created On    : 2014-03-03
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : The mshr decoder in the L2 cache
//
//
//====================================================================================================


`include "l2.tmp.h"
`include "define.tmp.h"

module l2_mshr_decoder(

    input wire [`L2_MSHR_ARRAY_WIDTH-1:0] data_in,

    output reg [`L2_MSHR_ADDR_OUT_WIDTH-1:0] addr_out,
    output reg [`L2_WAYS_WIDTH-1:0] way_out,
    output reg [`MSG_MSHRID_WIDTH-1:0] mshrid_out,
    output reg [`MSG_CACHE_TYPE_WIDTH-1:0] cache_type_out,
    output reg [`MSG_DATA_SIZE_WIDTH-1:0] data_size_out,
    output reg [`MSG_TYPE_WIDTH-1:0] msg_type_out,
    output reg [`MSG_L2_MISS_BITS-1:0] msg_l2_miss_out,
    output reg [`MSG_SRC_CHIPID_WIDTH-1:0] src_chipid_out,
    output reg [`MSG_SRC_X_WIDTH-1:0] src_x_out,
    output reg [`MSG_SRC_Y_WIDTH-1:0] src_y_out,
    output reg [`MSG_SRC_FBITS_WIDTH-1:0] src_fbits_out,
    output reg [`MSG_SDID_WIDTH-1:0] sdid_out,
    output reg [`MSG_LSID_WIDTH-1:0] lsid_out,
    output reg [`MSG_LSID_WIDTH-1:0] miss_lsid_out,
    output reg smc_miss_out,
    output reg recycled,
    output reg inv_fwd_pending

);


always @ *
begin
    addr_out = data_in[`L2_MSHR_ADDR];
    way_out = data_in[`L2_MSHR_WAY];
    mshrid_out = data_in[`L2_MSHR_MSHRID];
    cache_type_out = data_in[`L2_MSHR_CACHE_TYPE];
    data_size_out = data_in[`L2_MSHR_DATA_SIZE];
    msg_type_out = data_in[`L2_MSHR_MSG_TYPE];
    msg_l2_miss_out = data_in[`L2_MSHR_L2_MISS];
    src_chipid_out = data_in[`L2_MSHR_SRC_CHIPID];
    src_x_out = data_in[`L2_MSHR_SRC_X];
    src_y_out = data_in[`L2_MSHR_SRC_Y];
    src_fbits_out = data_in[`L2_MSHR_SRC_FBITS];
    sdid_out = data_in[`L2_MSHR_SDID];
    lsid_out = data_in[`L2_MSHR_LSID];
    miss_lsid_out = data_in[`L2_MSHR_MISS_LSID];
    smc_miss_out = data_in[`L2_MSHR_SMC_MISS];
    recycled = data_in[`L2_MSHR_RECYCLED];
    inv_fwd_pending = data_in[`L2_MSHR_INV_FWD_PENDING];
end

endmodule
