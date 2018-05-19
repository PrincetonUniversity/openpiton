// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

//Testbench for data transfer from fpga->fpga over 16 bit interface

// mmckeown: switching to use test infrastructure
// for use with continuous integration
`include "test_infrstrct.v"

`define VERBOSITY 1
`define CHIP_PERIOD 3     
`define FPGA_PERIOD 6    
`define CHANNEL_PERIOD 1 

//randomly generate input delays
`define WRITE1_CHANCE 100
`define WRITE2_CHANCE 50
`define WRITE3_CHANCE 10

//randomly generate output delays
`define READ1_CHANCE 100
`define READ2_CHANCE 50
`define READ3_CHANCE 10

`timescale 1ns/1ps

module bridge_out_tb;

parameter DATASIZE = 255;

reg             boot_done;
reg             rst;
reg             send_clk;
reg             rcv_clk;
reg             intcnct_clk;
wire   [63:0]   network_in_1;
wire   [63:0]   network_in_2;
wire   [63:0]   network_in_3;
reg             data_in_val_1;
reg             data_in_val_2;
reg             data_in_val_3;
wire            data_in_rdy_1;
wire            data_in_rdy_2;
wire            data_in_rdy_3;
wire   [63:0]   network_out_1;
wire   [63:0]   network_out_2;
wire   [63:0]   network_out_3;
wire            data_out_val_1;
wire            data_out_val_2;
wire            data_out_val_3;
reg             data_out_rdy_1;
reg             data_out_rdy_2;
reg             data_out_rdy_3;

fpga_bridge_top dut(
    .rst(rst),
    .fpga_send_clk(send_clk),
    .fpga_rcv_clk(rcv_clk),
    .intcnct_clk(intcnct_clk),
    .network_in_1(network_in_1),
    .network_in_2(network_in_2),
    .network_in_3(network_in_3),
    .data_in_val_1(data_in_val_1),
    .data_in_val_2(data_in_val_2),
    .data_in_val_3(data_in_val_3),
    .data_in_rdy_1(data_in_rdy_1),
    .data_in_rdy_2(data_in_rdy_2),
    .data_in_rdy_3(data_in_rdy_3),
    .network_out_1(network_out_1),
    .network_out_2(network_out_2),
    .network_out_3(network_out_3),
    .data_out_val_1(data_out_val_1),
    .data_out_val_2(data_out_val_2),
    .data_out_val_3(data_out_val_3),
    .data_out_rdy_1(data_out_rdy_1),
    .data_out_rdy_2(data_out_rdy_2),
    .data_out_rdy_3(data_out_rdy_3)
);


integer i1, i2, i3;
integer j1, j2, j3;
integer seed1, seed2, seed3;
integer dbg1, dbg2, dbg3;
//integer all_passed = 1;

reg [63:0]  write_mem_1[DATASIZE:0];
reg [63:0]  write_mem_2[DATASIZE:0];
reg [63:0]  write_mem_3[DATASIZE:0];

assign network_in_1 = write_mem_1[i1];
assign network_in_2 = write_mem_2[i2];
assign network_in_3 = write_mem_3[i3];

event check_output;

initial begin

    //initialize clocks
    send_clk = 1;
    intcnct_clk = 1;
    rcv_clk = 1;



    #1  seed1 = $time;
    #1  seed2 = $time;
    #1  seed3 = $time;
    for( i1 = 0; i1 <= DATASIZE; i1 = i1 + 1)begin
        write_mem_1[i1] = {$random(seed1), $random(seed2)};
        write_mem_2[i1] = {$random(seed1), $random(seed2)};
        write_mem_3[i1] = {$random(seed2), $random(seed2)};
    end
    i1 = 0;
    i2 = 0;
    i3 = 0;
    j1 = 0;
    j2 = 0;
    j3 = 0;
    
    $dumpfile("dump.vcd");
    $dumpvars(0, dut);
    //all_passed = 1;
    $dumpon;
    boot_done = 0;
    rst = 0;
    #80
    rst = 1;
    #80
    rst = 0;
    #80
    boot_done = 1;

    #100000 //timeout
    
    // mmckeown: switching to use test infrastructure for
    // continuous integration pass/fail detection
    //$display( "    !TEST TIMEOUT!     ");
    //$display( " [ TEST BENCH FAILED ] ");
    `TEST_CHECK("Timeout check", 0, `VERBOSITY); 
    $finish;
end
/*****************************************************************
APPLY INPUTS
*****************************************************************/
//CHIP CLOCK
always
    #`CHIP_PERIOD send_clk <= ~send_clk;

//INTERCONNECT CLOCK
always
    #`CHANNEL_PERIOD intcnct_clk <= ~intcnct_clk;

//WRITING TESTBENCH (CHIP SIDE)
always@(posedge send_clk) begin
    
    //network 1
    if (data_in_rdy_1 && data_in_val_1)
        i1 <= i1 + 1;
    
    if(({$random(seed1)%50 + 50} < `WRITE1_CHANCE) && 
       (boot_done) && 
       (i1 <= DATASIZE-1))begin
        data_in_val_1 <= 1'b1;
    end
    else begin
        data_in_val_1 <= 1'b0;
    end
    
    //network 2
    if (data_in_rdy_2 && data_in_val_2)
        i2 <= i2 + 1;
    
    if(({$random(seed1)%50 + 50} < `WRITE2_CHANCE) && 
       (boot_done) && 
       (i2 <= DATASIZE-1))begin
        data_in_val_2 <= 1'b1;
    end
    else begin
        data_in_val_2 <= 1'b0;
    end

    //network 3
    if (data_in_rdy_3 && data_in_val_3)
        i3 <= i3 + 1;
    
    if(({$random(seed1)%50 + 50} < `WRITE3_CHANCE) && 
       (boot_done) && 
       (i3 <= DATASIZE-1))begin
        data_in_val_3 <= 1'b1;
    end
    else begin
        data_in_val_3 <= 1'b0;
    end
end
//FPGA CLOCK
always
    #`FPGA_PERIOD rcv_clk <= ~rcv_clk;



//READING TESTBENCH (FPGA SIDE)
always @(posedge rcv_clk) begin
    //network 1
    if(  ({$random(seed1)%50+50} < `READ1_CHANCE) && 
         ( boot_done ) && 
         ( j1 <= DATASIZE-1 )
       ) begin
        data_out_rdy_1 <= 1'b1;
    end
    else begin
        data_out_rdy_1 <= 1'b0;
    end

    //network 2
    if(  ({$random(seed1)%50+50} < `READ1_CHANCE) && 
         ( boot_done ) && 
         ( j2 <= DATASIZE-1 )
       ) begin
        data_out_rdy_2 <= 1'b1;
    end
    else begin
        data_out_rdy_2 <= 1'b0;
    end

    //network 3
    if(  ({$random(seed1)%50+50} < `READ1_CHANCE) && 
         ( boot_done ) && 
         ( j3 <= DATASIZE-1 )
       ) begin
        data_out_rdy_3 <= 1'b1;
    end
    else begin
        data_out_rdy_3 <= 1'b0;
    end

    if(     (data_out_val_1)
         || (data_out_val_2)
         || (data_out_val_3) )
        -> check_output;
end  

/*****************************************************************
EVENTS
*****************************************************************/

always @( check_output ) begin

    //check channel 1
    if(data_out_val_1 && data_out_rdy_1 && j1 < DATASIZE - 1) begin
        // mmckeown: switching to test infrastructure
        /*if( network_out_1 != write_mem_1[j1] ) begin
            all_passed = 0;
            $display( " [ FAILED ] @%d channel=1, rdata=%h, expected=%h; ", j1, network_out_1, write_mem_1[j1][63:0]);
        end
        else if ( `VERBOSITY == 1 ) begin
            $display( " [ PASSED ] @%d channel=1, rdata=%h, expected=%h; ", j1, network_out_1, write_mem_1[j1][63:0]);
        end*/
        `TEST_EQ("test_sink channel1", write_mem_1[j1], network_out_1, `VERBOSITY) 
        j1 = j1+1;
    end

    //check channel 2
    if(data_out_val_2 && data_out_rdy_2 && j2 < DATASIZE - 1) begin
        // mmckeown: switching to test infrastructure
        /*if( network_out_2 != write_mem_2[j2] ) begin
            all_passed = 0;
            $display( " [ FAILED ] @%d channel=2, rdata=%h, expected=%h; ", j2, network_out_2, write_mem_2[j2][63:0]);
        end
        else if ( `VERBOSITY == 1 ) begin
            $display( " [ PASSED ] @%d channel=2, rdata=%h, expected=%h; ", j2, network_out_2, write_mem_2[j2][63:0]);
        end*/
        `TEST_EQ("test_sink channel2", write_mem_2[j2], network_out_2, `VERBOSITY)
        j2 = j2+1;
    end

    //check channel 1
    if(data_out_val_3 && data_out_rdy_3 && j3 < DATASIZE - 1) begin
        // mmckeown: switching to test infrastructure
        /*if( network_out_3 != write_mem_3[j3] ) begin
            all_passed = 0;
            $display( " [ FAILED ] @%d channel=3, rdata=%h, expected=%h; ", j3, network_out_3, write_mem_3[j3][63:0]);
        end
        else if ( `VERBOSITY == 1 ) begin
            $display( " [ PASSED ] @%d channel=3, rdata=%h, expected=%h; ", j3, network_out_3, write_mem_3[j3][63:0]);
        end*/
        `TEST_EQ("test_sink channel3", write_mem_3[j3], network_out_3, `VERBOSITY)
        j3 = j3+1;
    end

    if( (j1 >= DATASIZE-1 ) &&
        (j2 >= DATASIZE-1 ) &&
        (j3 >= DATASIZE-1 ) ) begin
        /*if( all_passed )
            $display( " [ TEST BENCH PASSED ] ");
        else
            $display( " [ TEST BENCH FAILED ] ");*/
        $finish;
    end

end

endmodule

