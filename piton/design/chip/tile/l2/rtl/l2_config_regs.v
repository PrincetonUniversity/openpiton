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
//  Filename      : l2_config_regs.v
//  Created On    : 2015-01-02
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : Config registers for the L2 cache
//
//
//==================================================================================================

`include "l2.tmp.h"
`include "define.tmp.h"

module l2_config_regs(

    input wire clk,
    input wire rst_n,

    input wire [`NOC_CHIPID_WIDTH-1:0] chipid,
    input wire [`NOC_X_WIDTH-1:0] coreid_x,
    input wire [`NOC_Y_WIDTH-1:0] coreid_y,
    input wire l2_access_valid,
    input wire l2_miss_valid,
    input wire data_ecc_corr_error,
    input wire data_ecc_uncorr_error,
    input wire [`L2_DATA_INDEX_WIDTH-1:0] data_ecc_addr,
    input wire [`PHY_ADDR_WIDTH-1:0] error_addr,
    input wire reg_rd_en,
    input wire reg_wr_en,
    input wire [`L2_ADDR_TYPE_WIDTH-1:0] reg_rd_addr_type,
    input wire [`L2_ADDR_TYPE_WIDTH-1:0] reg_wr_addr_type,
    input wire [`L2_REG_WIDTH-1:0] reg_data_in,

    output reg [`L2_REG_WIDTH-1:0] reg_data_out,
    output reg [`NOC_NODEID_WIDTH-1:0] my_nodeid,
    output reg [`L2_COREID_WIDTH-1:0] core_max,
    output reg csm_en,
    output reg [`L2_SMT_BASE_ADDR_WIDTH-1:0] smt_base_addr

);


reg [`L2_REG_WIDTH-1:0] ctrl_reg_f;
reg [`L2_REG_WIDTH-1:0] coreid_reg_f;
reg [`L2_REG_WIDTH-1:0] l2_access_counter_reg_f;
reg [`L2_REG_WIDTH-1:0] l2_miss_counter_reg_f;
reg [`L2_REG_WIDTH-1:0] error_status_reg_f;

reg ctrl_reg_wr_en;
reg coreid_reg_wr_en;
reg l2_access_counter_reg_wr_en;
reg l2_miss_counter_reg_wr_en;
reg error_status_reg_wr_en;
reg error_status_en;
reg l2_access_counter_inc_en;
reg l2_miss_counter_inc_en;

always @ *
begin
    ctrl_reg_wr_en = reg_wr_en && (reg_wr_addr_type == `L2_ADDR_TYPE_CTRL_REG); 
    coreid_reg_wr_en = reg_wr_en && (reg_wr_addr_type == `L2_ADDR_TYPE_COREID_REG); 
    l2_access_counter_reg_wr_en = reg_wr_en && (reg_wr_addr_type == `L2_ADDR_TYPE_ACCESS_COUNTER); 
    l2_miss_counter_reg_wr_en = reg_wr_en && (reg_wr_addr_type == `L2_ADDR_TYPE_MISS_COUNTER); 
    error_status_reg_wr_en = reg_wr_en && (reg_wr_addr_type == `L2_ADDR_TYPE_ERROR_STATUS_REG); 
    
end

always @ (posedge clk)
begin
    if (!rst_n)
    begin
        ctrl_reg_f <= 0;
    end
    else if (ctrl_reg_wr_en)
    begin
        ctrl_reg_f <= reg_data_in; 
    end
end

always @ (posedge clk)
begin
    if (!rst_n)
    begin
        coreid_reg_f <= {{(`L2_REG_WIDTH-`NOC_NODEID_WIDTH){1'b0}},chipid, coreid_x, coreid_y, `NOC_FBITS_L2};
    end
    else if (coreid_reg_wr_en)
    begin
        coreid_reg_f <= reg_data_in; 
    end
end

reg l2_access_counter_inc_en_f;
always @ (posedge clk)
begin
    if (!rst_n)
    begin
        l2_access_counter_reg_f <= 0;
    end
    else if (l2_access_counter_reg_wr_en)
    begin
        l2_access_counter_reg_f <= reg_data_in; 
    end
    // else if (l2_access_counter_inc_en && l2_access_valid)
    // begin
    //     l2_access_counter_reg_f <= l2_access_counter_reg_f + 1;
    // end 
    // trin: pipeline addition for timing
    l2_access_counter_inc_en_f <= l2_access_counter_inc_en && l2_access_valid;
    if (l2_access_counter_inc_en_f) begin
        l2_access_counter_reg_f <= l2_access_counter_reg_f + 1;
    end
end


reg l2_miss_counter_inc_en_f;
always @ (posedge clk)
begin
    if (!rst_n)
    begin
        l2_miss_counter_reg_f <= 0;
    end
    else if (l2_miss_counter_reg_wr_en)
    begin
        l2_miss_counter_reg_f <= reg_data_in; 
    end
    // else if (l2_miss_counter_inc_en && l2_miss_valid)
    // begin
    //     l2_miss_counter_reg_f <= l2_miss_counter_reg_f + 1;
    // end 
    // trin: pipeline addition for timing
    l2_miss_counter_inc_en_f <= l2_miss_counter_inc_en && l2_miss_valid;
    if (l2_miss_counter_inc_en_f) begin
        l2_miss_counter_reg_f <= l2_miss_counter_reg_f + 1;
    end
end

always @ (posedge clk)
begin
    if (!rst_n)
    begin
        error_status_reg_f <= 0;
    end
    else if (error_status_reg_wr_en)
    begin
        error_status_reg_f <= reg_data_in; 
    end
    else if (error_status_en && data_ecc_corr_error)
    begin
        if (|error_status_reg_f[1:0])
        begin
            error_status_reg_f <= {error_status_reg_f[63:55], error_addr, data_ecc_addr, 1'b1, 1'b0, 1'b1};
        end
        else
        begin
            error_status_reg_f <= {error_status_reg_f[63:55], error_addr, data_ecc_addr, 1'b0, 1'b0, 1'b1};
        end
    end
    else if (error_status_en && data_ecc_uncorr_error)
    begin
        if (|error_status_reg_f[1:0])
        begin
            error_status_reg_f <= {error_status_reg_f[63:55], error_addr, data_ecc_addr, 1'b1, 1'b1, 1'b0};
        end
        else
        begin
            error_status_reg_f <= {error_status_reg_f[63:55], error_addr, data_ecc_addr, 1'b0, 1'b1, 1'b0};
        end
    end

end


always @ * 
begin
    if (reg_rd_en)
    begin
        if (reg_rd_addr_type == `L2_ADDR_TYPE_CTRL_REG)
        begin
            reg_data_out = ctrl_reg_f;
        end
        else if (reg_rd_addr_type == `L2_ADDR_TYPE_COREID_REG)
        begin
            reg_data_out = coreid_reg_f;
        end
        else if (reg_rd_addr_type == `L2_ADDR_TYPE_ACCESS_COUNTER)
        begin
            reg_data_out = l2_access_counter_reg_f;
        end
        else if (reg_rd_addr_type == `L2_ADDR_TYPE_MISS_COUNTER)
        begin
            reg_data_out = l2_miss_counter_reg_f;
        end
        else if (reg_rd_addr_type == `L2_ADDR_TYPE_ERROR_STATUS_REG)
        begin
            reg_data_out = error_status_reg_f;
        end
        else
        begin
            reg_data_out = 0;
        end
    end
    else
    begin
        reg_data_out = 0;
    end
end

always @ * 
begin
    csm_en = ctrl_reg_f[0];
    error_status_en = ctrl_reg_f[1];
    l2_access_counter_inc_en = ctrl_reg_f[2];
    l2_miss_counter_inc_en = ctrl_reg_f[3];
    smt_base_addr = ctrl_reg_f[`L2_SMT_BASE_ADDR_WIDTH+32-1 : 32];
end

always @ * 
begin
    my_nodeid = coreid_reg_f[`NOC_NODEID_WIDTH-1 : 0]; 
    core_max = coreid_reg_f[`L2_COREID_WIDTH+`NOC_NODEID_WIDTH-1 : `NOC_NODEID_WIDTH];
end




endmodule
