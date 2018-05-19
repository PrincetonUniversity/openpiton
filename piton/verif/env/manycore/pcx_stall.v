// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: pcx_stall.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
`include "cross_module.h"

// L2 banks randomly stall PCX
// (stall is gated if it will cause a CAS1_RQ and CAS2_RQ to be separated, since
//  this is legal only if the L2 IQ is full.)

module pcx_stall();

reg active;
wire clk;
wire cas1_grant_0, cas1_grant_1, cas1_grant_2, cas1_grant_3;
wire stall0, stall1, stall2, stall3;
reg stall0_d1, stall1_d1, stall2_d1, stall3_d1;

integer seed, max_stall, min_stall;
integer count0, count1, count2, count3, count4;
reg randstall0, randstall1, randstall2, randstall3, randstall4;

// pcx stall and release signals driven by pli event.
reg [3:0] stall_on;
reg [3:0] free_on;
wire [3:0] pli_stall_next;
reg [3:0] pli_stall;


initial begin
    randstall0 = 0;
    randstall1 = 0;
    randstall2 = 0;
    randstall3 = 0;
    randstall4 = 0;
    count0 = 0;
    count1 = 0;
    count2 = 0;
    count3 = 0;
    count4 = 0;
    stall_on = 0;
    free_on  = 0;
    pli_stall = 0;

    if($test$plusargs("pcx_stall")) begin
        active = 1;

        if($value$plusargs("pcx_max_stall=%d", max_stall)) begin
        end
        else begin
            max_stall = 150;
        end

        if($value$plusargs("pcx_min_stall=%d", min_stall)) begin
        end
        else begin
            min_stall = 1;
        end

        if($value$plusargs("tg_seed=%d", seed)) begin
            $display("Random PCX stalling activated (tg_seed = %d, max stall = %d, min stall = %d)", seed, max_stall, min_stall);
        end
        else begin
            seed = 0;
            $display("Random PCX stalling activated (default seed = 0, max stall = %d, min_stall=%d)", max_stall, min_stall);
        end
    end
    else begin
        active = 0;
    end
end


`ifdef MSS_SAT
`else
    always @(posedge clk) begin
        $pc_trigger_event(4, 1, stall_on, free_on);
    end
`endif


`ifdef RTL_CCX

    assign clk = `TOP_DESIGN.ccx.rclk;

    assign cas1_grant_0 = (`TOP_DESIGN.ccx.pcx.arb0.ccx_dest_data_rdy_x & `TOP_DESIGN.ccx.pcx.arb0.ccx_dest_atom_x);
    assign cas1_grant_1 = (`TOP_DESIGN.ccx.pcx.arb1.ccx_dest_data_rdy_x & `TOP_DESIGN.ccx.pcx.arb1.ccx_dest_atom_x);
    assign cas1_grant_2 = (`TOP_DESIGN.ccx.pcx.arb2.ccx_dest_data_rdy_x & `TOP_DESIGN.ccx.pcx.arb2.ccx_dest_atom_x);
    assign cas1_grant_3 = (`TOP_DESIGN.ccx.pcx.arb3.ccx_dest_data_rdy_x & `TOP_DESIGN.ccx.pcx.arb3.ccx_dest_atom_x);

    assign stall0 = (randstall0 | pli_stall[0]) & (`TOP_DESIGN.sctag0.iqctl.que_cnt < 5'd10);
    assign stall1 = (randstall1 | pli_stall[1]) & (`TOP_DESIGN.sctag1.iqctl.que_cnt < 5'd10);
    assign stall2 = (randstall2 | pli_stall[2]) & (`TOP_DESIGN.sctag2.iqctl.que_cnt < 5'd10);
    assign stall3 = (randstall3 | pli_stall[3]) & (`TOP_DESIGN.sctag3.iqctl.que_cnt < 5'd10);

    assign pli_stall_next = (stall_on | pli_stall) & ~free_on;

    always @(posedge clk) begin
        stall0_d1 <= stall0;
        stall1_d1 <= stall1;
        stall2_d1 <= stall2;
        stall3_d1 <= stall3;

        pli_stall <= pli_stall_next;

        // 1) CAS1_RQ and CAS2_RQ must not be separated by this stall while in-flight to the L2
        // 2) stall should be asserted only when L2 IQ has < 10 entries, so that it does not interfere with
        //    the stall from the L2
        force `TOP_DESIGN.ccx.pcx.arb0.arbctl.stall2_a = stall0 & ~(~stall0_d1 & cas1_grant_0);
        force `TOP_DESIGN.ccx.pcx.arb1.arbctl.stall2_a = stall1 & ~(~stall1_d1 & cas1_grant_1);
        force `TOP_DESIGN.ccx.pcx.arb2.arbctl.stall2_a = stall2 & ~(~stall2_d1 & cas1_grant_2);
        force `TOP_DESIGN.ccx.pcx.arb3.arbctl.stall2_a = stall3 & ~(~stall3_d1 & cas1_grant_3);

        // FP1 and FP2 can be separated while in-flight to the FPU
        force `TOP_DESIGN.ccx.pcx.arb4.arbctl.stall1_a = randstall4;
    end


    // L2 Bank 0
    always @(posedge clk) begin
        if(active) begin
            count0 = ({$random(seed)} % max_stall) + min_stall;
            repeat(count0) @(posedge clk);

            randstall0 = 1;    
    
            count0 = ({$random(seed)} % max_stall) + min_stall;
    		repeat(count0) @(posedge clk);
    
            randstall0 = 0;
        end
        else begin
            randstall0 = 0;
        end
    end

    // L2 Bank 1
    always @(posedge clk) begin
        if(active) begin
            count1 = ({$random(seed)} % max_stall) + min_stall;
            repeat(count1) @(posedge clk);
    
            randstall1 = 1;    
    
            count1 = ({$random(seed)} % max_stall) + min_stall;
    		repeat(count1) @(posedge clk);
    
            randstall1 = 0;    
        end
        else begin
            randstall1 = 0;
        end
    end

    // L2 Bank 2
    always @(posedge clk) begin
        if(active) begin
            count2 = ({$random(seed)} % max_stall) + min_stall;
            repeat(count2) @(posedge clk);
    
            randstall2 = 1;    
    
            count2 = ({$random(seed)} % max_stall) + min_stall;
    		repeat(count2) @(posedge clk);
    
            randstall2 = 0;    
        end
        else begin
            randstall2 = 0;
        end
    end

    // L2 Bank 3
    always @(posedge clk) begin
        if(active) begin
            count3 = ({$random(seed)} % max_stall) + min_stall;
            repeat(count3) @(posedge clk);
    
            randstall3 = 1;    
    
            count3 = ({$random(seed)} % max_stall) + min_stall;
    		repeat(count3) @(posedge clk);
    
            randstall3 = 0;    
        end
        else begin
            randstall3 = 0;
        end
    end

    // IOB & FPU
    always @(posedge clk) begin
        if(active) begin
            count4 = ({$random(seed)} % max_stall) + min_stall;
            repeat(count4) @(posedge clk);
    
            randstall4 = 1;
    
            count4 = ({$random(seed)} % max_stall) + min_stall;
    		repeat(count4) @(posedge clk);
    
            randstall4 = 0;  
        end
        else begin
            randstall4 = 0;
        end
    end

`endif
    
endmodule
