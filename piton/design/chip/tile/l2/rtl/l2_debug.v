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
//  Filename      : l2_debug.v
//  Created On    : 2014-04-03
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : Debugging module for the L2 cache
//
//
//====================================================================================================

`include "l2.tmp.h"
`include "define.tmp.h"

`ifndef SYNTHESIS

module l2_msg_type_parse(
    input wire [`MSG_TYPE_WIDTH-1:0] msg_type,
    output reg [15*8-1:0] msg_type_string
);


always @ *
begin
      case (msg_type)
        `MSG_TYPE_LOAD_REQ              : $sformat( msg_type_string, "    ld_req       ");
        `MSG_TYPE_PREFETCH_REQ          : $sformat( msg_type_string, "   pref_req      ");
        `MSG_TYPE_STORE_REQ             : $sformat( msg_type_string, "    st_req       ");
        `MSG_TYPE_BLK_STORE_REQ         : $sformat( msg_type_string, "  blk_st_req     ");
        `MSG_TYPE_BLKINIT_STORE_REQ     : $sformat( msg_type_string, " blkinit_st_req  ");
        `MSG_TYPE_CAS_REQ               : $sformat( msg_type_string, "    cas_req      ");
        `MSG_TYPE_CAS_P1_REQ            : $sformat( msg_type_string, "  cas_p1_req     ");
        `MSG_TYPE_CAS_P2Y_REQ           : $sformat( msg_type_string, "  cas_p2y_req    ");
        `MSG_TYPE_CAS_P2N_REQ           : $sformat( msg_type_string, "  cas_p2n_req    ");
        `MSG_TYPE_SWAP_REQ              : $sformat( msg_type_string, "    swap_req     ");
        `MSG_TYPE_SWAP_P1_REQ           : $sformat( msg_type_string, "  swap_p1_req    ");
        `MSG_TYPE_SWAP_P2_REQ           : $sformat( msg_type_string, "  swap_p2_req    ");
        `MSG_TYPE_WB_REQ                : $sformat( msg_type_string, "     wb_req      ");
        `MSG_TYPE_WBGUARD_REQ           : $sformat( msg_type_string, "   wbgrd_req     ");
        `MSG_TYPE_NC_LOAD_REQ           : $sformat( msg_type_string, "   nc_ld_req     ");
        `MSG_TYPE_NC_STORE_REQ          : $sformat( msg_type_string, "   nc_st_req     ");
        `MSG_TYPE_LOAD_FWD              : $sformat( msg_type_string, "     ld_fwd      ");
        `MSG_TYPE_STORE_FWD             : $sformat( msg_type_string, "     st_fwd      ");
        `MSG_TYPE_INV_FWD               : $sformat( msg_type_string, "    inv_fwd      ");
        `MSG_TYPE_LOAD_MEM              : $sformat( msg_type_string, "     ld_mem      ");
        `MSG_TYPE_STORE_MEM             : $sformat( msg_type_string, "     st_mem      ");
        `MSG_TYPE_LOAD_FWDACK           : $sformat( msg_type_string, "   ld_fwdack     ");
        `MSG_TYPE_STORE_FWDACK          : $sformat( msg_type_string, "   st_fwdack     ");
        `MSG_TYPE_INV_FWDACK            : $sformat( msg_type_string, "   inv_fwdack    ");
        `MSG_TYPE_LOAD_MEM_ACK          : $sformat( msg_type_string, "   ld_mem_ack    ");
        `MSG_TYPE_STORE_MEM_ACK         : $sformat( msg_type_string, "   st_mem_ack    ");
        `MSG_TYPE_NC_LOAD_MEM_ACK       : $sformat( msg_type_string, " nc_ld_mem_ack   ");
        `MSG_TYPE_NC_STORE_MEM_ACK      : $sformat( msg_type_string, " nc_st_mem_ack   ");
        `MSG_TYPE_NODATA_ACK            : $sformat( msg_type_string, "   nodata_ack    ");
        `MSG_TYPE_DATA_ACK              : $sformat( msg_type_string, "    data_ack     ");
        `MSG_TYPE_AMO_ADD_REQ           : $sformat( msg_type_string, "    amo_add_req  ");
        `MSG_TYPE_AMO_ADD_P1_REQ        : $sformat( msg_type_string, "  amo_add_p1_req ");
        `MSG_TYPE_AMO_ADD_P2_REQ        : $sformat( msg_type_string, "  amo_add_p2_req ");
        `MSG_TYPE_AMO_AND_REQ           : $sformat( msg_type_string, "    amo_and_req  ");
        `MSG_TYPE_AMO_AND_P1_REQ        : $sformat( msg_type_string, "  amo_and_p1_req ");
        `MSG_TYPE_AMO_AND_P2_REQ        : $sformat( msg_type_string, "  amo_and_p2_req ");
        `MSG_TYPE_AMO_OR_REQ            : $sformat( msg_type_string, "    amo_or_req   ");
        `MSG_TYPE_AMO_OR_P1_REQ         : $sformat( msg_type_string, "  amo_or_p1_req  ");
        `MSG_TYPE_AMO_OR_P2_REQ         : $sformat( msg_type_string, "  amo_or_p2_req  ");
        `MSG_TYPE_AMO_XOR_REQ           : $sformat( msg_type_string, "    amo_xor_req  ");
        `MSG_TYPE_AMO_XOR_P1_REQ        : $sformat( msg_type_string, "  amo_xor_p1_req ");
        `MSG_TYPE_AMO_XOR_P2_REQ        : $sformat( msg_type_string, "  amo_xor_p2_req ");
        `MSG_TYPE_AMO_MAX_REQ           : $sformat( msg_type_string, "    amo_max_req  ");
        `MSG_TYPE_AMO_MAX_P1_REQ        : $sformat( msg_type_string, "  amo_max_p1_req ");
        `MSG_TYPE_AMO_MAX_P2_REQ        : $sformat( msg_type_string, "  amo_max_p2_req ");
        `MSG_TYPE_AMO_MAXU_REQ          : $sformat( msg_type_string, "    amo_maxu_req ");
        `MSG_TYPE_AMO_MAXU_P1_REQ       : $sformat( msg_type_string, "  amo_maxu_p1_req");
        `MSG_TYPE_AMO_MAXU_P2_REQ       : $sformat( msg_type_string, "  amo_maxu_p2_req");
        `MSG_TYPE_AMO_MIN_REQ           : $sformat( msg_type_string, "    amo_min_req  ");
        `MSG_TYPE_AMO_MIN_P1_REQ        : $sformat( msg_type_string, "  amo_min_p1_req ");
        `MSG_TYPE_AMO_MIN_P2_REQ        : $sformat( msg_type_string, "  amo_min_p2_req ");
        `MSG_TYPE_AMO_MINU_REQ          : $sformat( msg_type_string, "    amo_minu_req ");
        `MSG_TYPE_AMO_MINU_P1_REQ       : $sformat( msg_type_string, "  amo_minu_p1_req");
        `MSG_TYPE_AMO_MINU_P2_REQ       : $sformat( msg_type_string, "  amo_minu_p2_req");
        default                         : $sformat( msg_type_string, "      undef    ");
      endcase
end


endmodule

`endif
