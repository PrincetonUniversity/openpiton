// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: cpx_stall.v
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

// Cores randomly stall CPX
// (stall is gated if it will cause a IFILL1_RET and IFILL2_RET to be separated, since
//  this is illegal.)

module cpx_stall();

reg active;
wire clk;
wire ifill1_grant_0, ifill1_grant_1, ifill1_grant_2, ifill1_grant_3;
wire ifill1_grant_4, ifill1_grant_5, ifill1_grant_6, ifill1_grant_7;
wire stall0, stall1, stall2, stall3, stall4, stall5, stall6, stall7;
reg stall0_d1, stall1_d1, stall2_d1, stall3_d1, stall4_d1, stall5_d1, stall6_d1, stall7_d1;

integer seed, max_stall, min_stall;
integer count0, count1, count2, count3, count4, count5, count6, count7;
reg randstall0, randstall1, randstall2, randstall3, randstall4, randstall5, randstall6, randstall7;
   
// cpx stall and release signals driven by pli event.
reg [7:0] stall_on;
reg [7:0] free_on;
wire [7:0] pli_stall_next;
reg [7:0] pli_stall;


initial begin
    randstall0 = 0;
    randstall1 = 0;
    randstall2 = 0;
    randstall3 = 0;
    randstall4 = 0;
    randstall5 = 0;
    randstall6 = 0;
    randstall7 = 0;
    count0 = 0;
    count1 = 0;
    count2 = 0;
    count3 = 0;
    count4 = 0;
    count5 = 0;
    count6 = 0;
    count7 = 0;
    stall_on = 0;
    free_on  = 0;
    pli_stall = 0;

    if($test$plusargs("cpx_stall")) begin
        active = 1;

        if($value$plusargs("cpx_max_stall=%d", max_stall)) begin
        end
        else begin
            max_stall = 150;
        end

        if($value$plusargs("cpx_min_stall=%d", min_stall)) begin
        end
        else begin
            min_stall = 1;
        end

        if($value$plusargs("tg_seed=%d", seed)) begin
            $display("Random CPX stalling activated (tg_seed = %d, max stall = %d, min stall = %d)", seed, max_stall, min_stall);
        end
        else begin
            seed = 0;
            $display("Random CPX stalling activated (default seed = 0, max stall = %d, min stall = %d)", max_stall, min_stall);
        end
    end
    else begin
        active = 0;
    end
end


`ifdef MSS_SAT
`else
    always @(posedge clk) begin
        $pc_trigger_event(4, 2, stall_on, free_on);
    end
`endif


`ifdef RTL_CCX

    assign clk = `TOP_DESIGN.ccx.rclk;

    assign ifill1_grant_0 = (`TOP_DESIGN.ccx.cpx.arb0.ccx_arb.ccx_dest_data_rdy_x & `TOP_DESIGN.ccx.cpx.arb0.ccx_arb.ccx_dest_atom_x);
    assign ifill1_grant_1 = (`TOP_DESIGN.ccx.cpx.arb1.ccx_arb.ccx_dest_data_rdy_x & `TOP_DESIGN.ccx.cpx.arb1.ccx_arb.ccx_dest_atom_x);
    assign ifill1_grant_2 = (`TOP_DESIGN.ccx.cpx.arb2.ccx_arb.ccx_dest_data_rdy_x & `TOP_DESIGN.ccx.cpx.arb2.ccx_arb.ccx_dest_atom_x);
    assign ifill1_grant_3 = (`TOP_DESIGN.ccx.cpx.arb3.ccx_arb.ccx_dest_data_rdy_x & `TOP_DESIGN.ccx.cpx.arb3.ccx_arb.ccx_dest_atom_x);
    assign ifill1_grant_4 = (`TOP_DESIGN.ccx.cpx.arb4.ccx_arb.ccx_dest_data_rdy_x & `TOP_DESIGN.ccx.cpx.arb4.ccx_arb.ccx_dest_atom_x);
    assign ifill1_grant_5 = (`TOP_DESIGN.ccx.cpx.arb5.ccx_arb.ccx_dest_data_rdy_x & `TOP_DESIGN.ccx.cpx.arb5.ccx_arb.ccx_dest_atom_x);
    assign ifill1_grant_6 = (`TOP_DESIGN.ccx.cpx.arb6.ccx_arb.ccx_dest_data_rdy_x & `TOP_DESIGN.ccx.cpx.arb6.ccx_arb.ccx_dest_atom_x);
    assign ifill1_grant_7 = (`TOP_DESIGN.ccx.cpx.arb7.ccx_arb.ccx_dest_data_rdy_x & `TOP_DESIGN.ccx.cpx.arb7.ccx_arb.ccx_dest_atom_x);

    assign stall0 = (randstall0 | pli_stall[0]);
    assign stall1 = (randstall1 | pli_stall[1]);
    assign stall2 = (randstall2 | pli_stall[2]);
    assign stall3 = (randstall3 | pli_stall[3]);
    assign stall4 = (randstall4 | pli_stall[4]);
    assign stall5 = (randstall5 | pli_stall[5]);
    assign stall6 = (randstall6 | pli_stall[6]);
    assign stall7 = (randstall7 | pli_stall[7]);

    assign pli_stall_next = (stall_on | pli_stall) & ~free_on;

    always @(posedge clk) begin
        stall0_d1 <= stall0;
        stall1_d1 <= stall1;
        stall2_d1 <= stall2;
        stall3_d1 <= stall3;
        stall4_d1 <= stall4;
        stall5_d1 <= stall5;
        stall6_d1 <= stall6;
        stall7_d1 <= stall7;

        pli_stall <= pli_stall_next;

        force `TOP_DESIGN.ccx.cpx.arb0.ccx_arb.arbctl.stall2_a = stall0 & ~(~stall0_d1 & ifill1_grant_0);
        force `TOP_DESIGN.ccx.cpx.arb1.ccx_arb.arbctl.stall2_a = stall1 & ~(~stall1_d1 & ifill1_grant_1);
        force `TOP_DESIGN.ccx.cpx.arb2.ccx_arb.arbctl.stall2_a = stall2 & ~(~stall2_d1 & ifill1_grant_2);
        force `TOP_DESIGN.ccx.cpx.arb3.ccx_arb.arbctl.stall2_a = stall3 & ~(~stall3_d1 & ifill1_grant_3);
        force `TOP_DESIGN.ccx.cpx.arb4.ccx_arb.arbctl.stall2_a = stall4 & ~(~stall4_d1 & ifill1_grant_4);
        force `TOP_DESIGN.ccx.cpx.arb5.ccx_arb.arbctl.stall2_a = stall5 & ~(~stall5_d1 & ifill1_grant_5);
        force `TOP_DESIGN.ccx.cpx.arb6.ccx_arb.arbctl.stall2_a = stall6 & ~(~stall6_d1 & ifill1_grant_6);
        force `TOP_DESIGN.ccx.cpx.arb7.ccx_arb.arbctl.stall2_a = stall7 & ~(~stall7_d1 & ifill1_grant_7);
    end


    // Core 0
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

    // Core 1
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
    
    // Core 2
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
    
    // Core 3
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
    
    // Core 4
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
    
    // Core 5
    always @(posedge clk) begin
        if(active) begin
            count5 = ({$random(seed)} % max_stall) + min_stall;
            repeat(count5) @(posedge clk);
    
            randstall5 = 1;
    
            count5 = ({$random(seed)} % max_stall) + min_stall;
    		repeat(count5) @(posedge clk);
    
            randstall5 = 0;
        end
        else begin
            randstall5 = 0;
        end
    end    
    
    // Core 6
    always @(posedge clk) begin
        if(active) begin
            count6 = ({$random(seed)} % max_stall) + min_stall;
            repeat(count6) @(posedge clk);
    
            randstall6 = 1;
    
            count6 = ({$random(seed)} % max_stall) + min_stall;
    		repeat(count6) @(posedge clk);
    
            randstall6 = 0;
        end
        else begin
            randstall6 = 0;
        end
    end    
    
    // Core 7
    always @(posedge clk) begin
        if(active) begin
            count7 = ({$random(seed)} % max_stall) + min_stall;
            repeat(count7) @(posedge clk);
    
            randstall7 = 1;
    
            count7 = ({$random(seed)} % max_stall) + min_stall;
    		repeat(count7) @(posedge clk);
    
            randstall7 = 0;
        end
        else begin
            randstall7 = 0;
        end
    end    

`endif
    
endmodule
