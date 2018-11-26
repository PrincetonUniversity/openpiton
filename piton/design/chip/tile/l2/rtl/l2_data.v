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
//  Filename      : l2_data.v
//  Created On    : 2014-02-24
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : The data array in the L2 cache
//
//
//==================================================================================================

`include "l2.tmp.h"
`include "define.tmp.h"

module l2_data(

    input wire clk,
    input wire rst_n,
    input wire clk_en,
    input wire rdw_en,
    input wire pdout_en,
    input wire deepsleep,

    input wire [`L2_DATA_INDEX_WIDTH-1:0] addr,
    input wire [`L2_DATA_ARRAY_WIDTH-1:0] data_in,
    input wire [`L2_DATA_ARRAY_WIDTH-1:0] data_mask_in,

    output wire [`L2_DATA_ARRAY_WIDTH-1:0] data_out,
    output wire [`L2_DATA_ARRAY_WIDTH-1:0] pdata_out,

    // sram interface
    output wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] srams_rtap_data,
    input wire  [`BIST_OP_WIDTH-1:0] rtap_srams_bist_command,
    input wire  [`SRAM_WRAPPER_BUS_WIDTH-1:0] rtap_srams_bist_data
);

/*
localparam reset = 2'd0;
localparam init  = 2'd1;
localparam done  = 2'd2;

reg [1:0] init_state_f;
reg [1:0] init_state_next;
reg [`L2_DATA_INDEX_WIDTH-1:0] init_counter_f;
reg [`L2_DATA_INDEX_WIDTH-1:0] init_counter_next;

reg [`L2_DATA_INDEX_WIDTH-1:0] addr_real;
reg rdw_en_real;
reg clk_en_real;
reg [`L2_DATA_ARRAY_WIDTH-1:0] data_in_real;
reg [`L2_DATA_ARRAY_WIDTH-1:0] data_mask_in_real;

always @ *
begin
    if (!rst_n)
    begin
        init_state_next = reset;
    end
    else
    begin
        if (init_state_f == reset)
        begin
            init_state_next = init;
        end
        else if ((init_state_f == init) && (init_counter_f == {`L2_DATA_INDEX_WIDTH{1'b1}}))
        begin
            init_state_next = done;
        end
        else
        begin
            init_state_next = init_state_f;
        end
    end
end

always @ (posedge clk)
begin
    init_state_f <= init_state_next;
end

always @ *
begin
    if ((init_state_f == reset) || (init_state_f == done))
    begin
        init_counter_next = {`L2_DATA_INDEX_WIDTH{1'b0}};
    end
    else
    begin
        init_counter_next = init_counter_f + 1;
    end
end


always @ (posedge clk)
begin
    init_counter_f <= init_counter_next;
end


always @ *
begin
    init_done = (init_state_f == done);
end


always @ *
begin
    init_done = (init_state_f == done);
end


always @ *
begin
    if (init_state_f == init)
    begin
        clk_en_real = 1'b1;
        rdw_en_real = 1'b0;
        addr_real = init_counter_f;
        data_in_real = {`L2_DATA_ARRAY_WIDTH{1'b0}};
        data_mask_in_real = {`L2_DATA_ARRAY_WIDTH{1'b1}};
    end
    else
    begin
        clk_en_real = clk_en;
        rdw_en_real = rdw_en;
        addr_real = addr;
        data_in_real = data_in;
        data_mask_in_real = data_mask_in;
    end
end

*/

// sram_1rw_4096x144 l2_data_array(
sram_l2_data l2_data_array(
    .MEMCLK     (clk),
    .RESET_N(rst_n),
    .CE         (clk_en),

    .A          (addr),
    .DIN        (data_in),
    .RDWEN      (rdw_en),
    .BW         (data_mask_in),
    .DOUT       (data_out),
    .BIST_COMMAND(rtap_srams_bist_command),
    .BIST_DIN(rtap_srams_bist_data),
    .BIST_DOUT(srams_rtap_data),
    .SRAMID(`BIST_ID_L2_DATA)
);


endmodule
