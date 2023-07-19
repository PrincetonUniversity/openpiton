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
//  Filename      : cpxencoder.v
//  Created On    : 2014-03-26 18:58:51
//  Last Modified : 2015-01-22 17:08:52
//  Revision      :
//  Author        : Tri Nguyen
//  Company       : Princeton University
//  Email         : trin@princeton.edu
//
//  Description   :
//
//
//==================================================================================================
//cpxencoder.v

/* OLDNOTE (5/15/14) Note regarding l15_cpxencoder_blockinitstore
    in cpx.cc, the 125 bit of the return inval vector is set when block init store is set
*/
//`default_nettype none
module l15_cpxencoder(
    input wire          clk,
    input wire          rst_n,

    input wire          l15_cpxencoder_val,
    input wire [3:0]    l15_cpxencoder_returntype,
    input wire          l15_cpxencoder_l2miss,
    input wire [1:0]    l15_cpxencoder_error,
    input wire          l15_cpxencoder_noncacheable,
    input wire          l15_cpxencoder_atomic,
    input wire [`L15_THREADID_MASK]    l15_cpxencoder_threadid,
    input wire          l15_cpxencoder_prefetch,
    input wire          l15_cpxencoder_f4b,
    input wire [63:0]  l15_cpxencoder_data_0,
    input wire [63:0]  l15_cpxencoder_data_1,
    input wire [63:0]  l15_cpxencoder_data_2,
    input wire [63:0]  l15_cpxencoder_data_3,
    input wire          l15_cpxencoder_inval_icache_all_way,
    input wire          l15_cpxencoder_inval_dcache_all_way,
    input wire [15:4]   l15_cpxencoder_inval_address_15_4,
    input wire          l15_cpxencoder_cross_invalidate,
    input wire [1:0]    l15_cpxencoder_cross_invalidate_way,
    input wire          l15_cpxencoder_inval_dcache_inval,
    input wire          l15_cpxencoder_inval_icache_inval,
    input wire [1:0]    l15_cpxencoder_inval_way,
    input wire          l15_cpxencoder_blockinitstore,

    output reg uncore_spc_data_ready,
    output reg [`CPX_WIDTH-1:0] uncore_spc_data,

    output reg cpxencoder_l15_req_ack
    );

`define STATE_NORMAL 1'b0
`define STATE_SECONDHALF 1'b1

reg [`CPX_WIDTH-1:0] out;
wire [2:0] cpuid = 3'b000;

reg state;
reg next_state;

// debugging signal
reg [1:0] inval_index_5_4;

always @ (posedge clk)
begin
    if (!rst_n)
    begin
        state <= `STATE_NORMAL;
    end
    else
    begin
        state <= next_state;
    end
end


always @ *
begin
    uncore_spc_data[`CPX_WIDTH-1:0] = out[`CPX_WIDTH-1:0];
    uncore_spc_data_ready = l15_cpxencoder_val;
    cpxencoder_l15_req_ack = (l15_cpxencoder_val && (next_state == `STATE_NORMAL));
end

always @ *
begin
    out[144] = l15_cpxencoder_val;
    out[143:140] = l15_cpxencoder_returntype;
    out[139:0] = 1'b0;
    next_state = `STATE_NORMAL;
    inval_index_5_4 = l15_cpxencoder_inval_address_15_4[5:4];
    if (l15_cpxencoder_val)
    begin
    case(l15_cpxencoder_returntype)
        `LOAD_RET:
        begin
            // load
            out[139] = l15_cpxencoder_l2miss;
            out[138:137] = l15_cpxencoder_error;
            out[136] = l15_cpxencoder_noncacheable;
            out[135:134] = l15_cpxencoder_threadid;
            out[133] = l15_cpxencoder_cross_invalidate;
            out[132:131] = l15_cpxencoder_cross_invalidate_way;
            // bit 130 is 1'b0
            out[129] = l15_cpxencoder_atomic;
            out[128] = l15_cpxencoder_prefetch;
            out[127:0] = {l15_cpxencoder_data_0, l15_cpxencoder_data_1};
        end

        `IFILL_RET:
        begin
            case (state)
                `STATE_NORMAL:
                begin
                    out[139] = l15_cpxencoder_l2miss;
                    out[138:137] = l15_cpxencoder_error;
                    out[136] = l15_cpxencoder_noncacheable;
                    out[135:134] = l15_cpxencoder_threadid;
                    out[133] = l15_cpxencoder_cross_invalidate;
                    out[132:131] = l15_cpxencoder_cross_invalidate_way;
                    out[130] = l15_cpxencoder_f4b;
                    out[129] = 1'b0;
                    out[128] = 1'b0;
                    out[127:0] = {l15_cpxencoder_data_0, l15_cpxencoder_data_1};
                    next_state = `STATE_SECONDHALF;
                end
                `STATE_SECONDHALF:
                begin
                    // no l2 miss
                    out[138:137] = l15_cpxencoder_error;
                    out[136] = l15_cpxencoder_noncacheable;
                    out[135:134] = l15_cpxencoder_threadid;
                    out[133] = l15_cpxencoder_cross_invalidate;
                    out[132:131] = l15_cpxencoder_cross_invalidate_way;
                    out[130] = 1'b0;
                    out[129] = 1'b1;
                    out[128] = 1'b0;
                    out[127:0] = {l15_cpxencoder_data_2, l15_cpxencoder_data_3};
                    next_state = `STATE_NORMAL;
                end
            endcase
        end

        `EVICT_REQ:
        begin
            // eviction
            out[136] = l15_cpxencoder_noncacheable;
            out[128] = 1'b0;
            // Invalidation vector generation
                out[127:126] = 2'b0;
                out[125] = l15_cpxencoder_blockinitstore;
                out[124:123] = {l15_cpxencoder_inval_icache_all_way,
                                l15_cpxencoder_inval_dcache_all_way};
                out[122:121] = l15_cpxencoder_inval_address_15_4[5:4];
                out[120:118] = cpuid[2:0];
                out[117:112] = l15_cpxencoder_inval_address_15_4[11:6];

                // out[`CPX_INV_PA_15_12] = l15_cpxencoder_inval_address_15_4[15:12];
                if (l15_cpxencoder_inval_dcache_inval == 1)
                begin
                    out[`CPX_INV_WAY] = l15_cpxencoder_inval_way;
                    out[`CPX_INV_DCACHE_VAL] = 1'b1;
                end
                // trin: icache inval not used; monitored
        end

        `ST_ACK:
        begin
            out[136] = l15_cpxencoder_noncacheable;
            out[135:134] = l15_cpxencoder_threadid;
            out[129] = l15_cpxencoder_atomic;
            // Invalidation vector generation
                out[127:126] = 2'b0;
                out[125] = l15_cpxencoder_blockinitstore;
                out[124:123] = {l15_cpxencoder_inval_icache_all_way,
                                l15_cpxencoder_inval_dcache_all_way};
                out[122:121] = l15_cpxencoder_inval_address_15_4[5:4];
                out[120:118] = cpuid[2:0];
                out[117:112] = l15_cpxencoder_inval_address_15_4[11:6];

                // out[`CPX_INV_PA_15_12] = l15_cpxencoder_inval_address_15_4[15:12];
                if (l15_cpxencoder_inval_dcache_inval == 1)
                begin
                    out[`CPX_INV_WAY] = l15_cpxencoder_inval_way;
                    out[`CPX_INV_DCACHE_VAL] = 1'b1;
                end
        end

        `INT_RET:
        begin
            // TODO
            // out[136] = l15_cpxencoder_flush;
            // out[127:0] = l15_cpxencoder_data[127:0];
            out[136] = l15_cpxencoder_noncacheable; // is the flush_bit
            out[63:0] = l15_cpxencoder_data_0;

            // bug: threadid must be set even though it's X's in the document
            out[135:134] = l15_cpxencoder_threadid;
        end

        `CPX_RESTYPE_ATOMIC_RES:
        begin
            case (state)
                `STATE_NORMAL:
                begin
                    // load return first
                    out[143:140] = `LOAD_RET;
                    out[139] = l15_cpxencoder_l2miss;
                    out[138:137] = l15_cpxencoder_error;
                    out[136] = l15_cpxencoder_noncacheable;
                    out[135:134] = l15_cpxencoder_threadid;
                    out[133] = l15_cpxencoder_cross_invalidate;
                    out[132:131] = l15_cpxencoder_cross_invalidate_way;
                    // bit 130 is 1'b0
                    out[129] = l15_cpxencoder_atomic;
                    out[128] = l15_cpxencoder_prefetch;
                    out[127:0] = {l15_cpxencoder_data_0, l15_cpxencoder_data_1};
                    next_state = `STATE_SECONDHALF;
                end
                `STATE_SECONDHALF:
                begin
                    // stack
                    out[143:140] = `ST_ACK;
                    out[136] = l15_cpxencoder_noncacheable;
                    out[135:134] = l15_cpxencoder_threadid;
                    out[129] = l15_cpxencoder_atomic;
                    // Invalidation vector generation
                        out[127:126] = 2'b0;
                        out[125] = l15_cpxencoder_blockinitstore;
                        out[124:123] = {l15_cpxencoder_inval_icache_all_way,
                                        l15_cpxencoder_inval_dcache_all_way};
                        out[122:121] = l15_cpxencoder_inval_address_15_4[5:4];
                        out[120:118] = cpuid[2:0];
                        out[117:112] = l15_cpxencoder_inval_address_15_4[11:6];
                        // trin: storeacks for CAS do not invalidate anything; monitored
                    next_state = `STATE_NORMAL;
                end
            endcase
        end

        `ERR_RET:
        begin
            out[138:137] = l15_cpxencoder_error;
            out[135] = 1'b0;
            out[134] = 1'b0;
        end

        default:
        begin
            out[144] = 1'b0;
        end
    endcase
    end
end



endmodule
