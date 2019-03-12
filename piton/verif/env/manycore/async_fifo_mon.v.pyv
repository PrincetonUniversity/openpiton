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

//==================================================================================================
//  Filename      : async_mon.v
//  Created On    : 2014-09-01
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : Monitors for the async fifo, only works if the fpga clock equals the chip clock
//
//
//====================================================================================================





`include "sys.h"
`include "iop.h"
`include "define.tmp.h"
`include "cross_module.tmp.h"

module async_fifo_mon (
    input wire clk
);

reg [`NOC_DATA_WIDTH-1:0] chip_fpga_noc1_buffer [255:0];
reg [`NOC_DATA_WIDTH-1:0] chip_fpga_noc2_buffer [255:0];
reg [`NOC_DATA_WIDTH-1:0] chip_fpga_noc3_buffer [255:0];
reg [`NOC_DATA_WIDTH-1:0] fpga_chip_noc1_buffer [255:0];
reg [`NOC_DATA_WIDTH-1:0] fpga_chip_noc2_buffer [255:0];
reg [`NOC_DATA_WIDTH-1:0] fpga_chip_noc3_buffer [255:0];

reg [7:0] chip_fpga_buffer1_rd_ptr;
reg [7:0] chip_fpga_buffer1_wr_ptr;
reg [7:0] chip_fpga_buffer2_rd_ptr;
reg [7:0] chip_fpga_buffer2_wr_ptr;
reg [7:0] chip_fpga_buffer3_rd_ptr;
reg [7:0] chip_fpga_buffer3_wr_ptr;
reg [7:0] fpga_chip_buffer1_rd_ptr;
reg [7:0] fpga_chip_buffer1_wr_ptr;
reg [7:0] fpga_chip_buffer2_rd_ptr;
reg [7:0] fpga_chip_buffer2_wr_ptr;
reg [7:0] fpga_chip_buffer3_rd_ptr;
reg [7:0] fpga_chip_buffer3_wr_ptr;
integer chip_fpga_buffer1_counter;
integer chip_fpga_buffer2_counter;
integer chip_fpga_buffer3_counter;
integer fpga_chip_buffer1_counter;
integer fpga_chip_buffer2_counter;
integer fpga_chip_buffer3_counter;



initial begin
    chip_fpga_buffer1_rd_ptr = 0;    
    chip_fpga_buffer1_wr_ptr = 0;
    chip_fpga_buffer1_counter = 0;
    chip_fpga_buffer2_rd_ptr = 0;
    chip_fpga_buffer2_wr_ptr = 0;
    chip_fpga_buffer2_counter = 0;
    chip_fpga_buffer3_rd_ptr = 0;
    chip_fpga_buffer3_wr_ptr = 0;
    chip_fpga_buffer3_counter = 0;
    fpga_chip_buffer1_rd_ptr = 0;    
    fpga_chip_buffer1_wr_ptr = 0;
    fpga_chip_buffer1_counter = 0;
    fpga_chip_buffer2_rd_ptr = 0;
    fpga_chip_buffer2_wr_ptr = 0;
    fpga_chip_buffer2_counter = 0;
    fpga_chip_buffer3_rd_ptr = 0;
    fpga_chip_buffer3_wr_ptr = 0;
    fpga_chip_buffer3_counter = 0;
end

always @ (posedge clk)
begin
    if (`TOP_MOD.processor_offchip_noc1_valid)
    begin
        chip_fpga_noc1_buffer[chip_fpga_buffer1_wr_ptr] <= `TOP_MOD.processor_offchip_noc1_data;    
        chip_fpga_buffer1_wr_ptr <= chip_fpga_buffer1_wr_ptr + 1;  
        if (~`TOP_MOD.offfpga_fpga_noc1_valid)
        begin
            chip_fpga_buffer1_counter <= chip_fpga_buffer1_counter + 1;
        end
    end
    if (`TOP_MOD.offfpga_fpga_noc1_valid)
    begin
        if (chip_fpga_noc1_buffer[chip_fpga_buffer1_rd_ptr] != `TOP_MOD.offfpga_fpga_noc1_data)
        begin
            $display("%d : Simulation -> FAIL(%0s)", $time, "Async fifo chip->fpga noc1 output wrong data");
            `ifndef VERILATOR
            repeat(5)@(posedge clk);
            `endif
            `MONITOR_PATH.fail("async_fifo_mon: Async fifo output wrong data");
            
        end 
        else
        begin
            chip_fpga_buffer1_rd_ptr <= chip_fpga_buffer1_rd_ptr + 1;  
            if (~`TOP_MOD.processor_offchip_noc1_valid)
            begin
                chip_fpga_buffer1_counter <= chip_fpga_buffer1_counter - 1;
            end
        end
    end
    if (`TOP_MOD.processor_offchip_noc2_valid)
    begin
        chip_fpga_noc2_buffer[chip_fpga_buffer2_wr_ptr] <= `TOP_MOD.processor_offchip_noc2_data;    
        chip_fpga_buffer2_wr_ptr <= chip_fpga_buffer2_wr_ptr + 1;  
        if (~`TOP_MOD.offfpga_fpga_noc2_valid)
        begin
            chip_fpga_buffer2_counter <= chip_fpga_buffer2_counter + 1;
        end
    end
    if (`TOP_MOD.offfpga_fpga_noc2_valid)
    begin
        if (chip_fpga_noc2_buffer[chip_fpga_buffer2_rd_ptr] != `TOP_MOD.offfpga_fpga_noc2_data)
        begin
            $display("%d : Simulation -> FAIL(%0s)", $time, "Async fifo chip->fpga noc2 output wrong data");
            `ifndef VERILATOR
            repeat(5)@(posedge clk);
            `endif
            `MONITOR_PATH.fail("async_fifo_mon: Async fifo output wrong data");
            
        end 
        else
        begin
            chip_fpga_buffer2_rd_ptr <= chip_fpga_buffer2_rd_ptr + 1;  
            if (~`TOP_MOD.processor_offchip_noc2_valid)
            begin
                chip_fpga_buffer2_counter <= chip_fpga_buffer2_counter - 1;
            end
        end
    end
    if (`TOP_MOD.processor_offchip_noc3_valid)
    begin
        chip_fpga_noc3_buffer[chip_fpga_buffer3_wr_ptr] <= `TOP_MOD.processor_offchip_noc3_data;    
        chip_fpga_buffer3_wr_ptr <= chip_fpga_buffer3_wr_ptr + 1;  
        if (~`TOP_MOD.offfpga_fpga_noc3_valid)
        begin
            chip_fpga_buffer3_counter <= chip_fpga_buffer3_counter + 1;
        end
    end
    if (`TOP_MOD.offfpga_fpga_noc3_valid)
    begin
        if (chip_fpga_noc3_buffer[chip_fpga_buffer3_rd_ptr] != `TOP_MOD.offfpga_fpga_noc3_data)
        begin
            $display("%d : Simulation -> FAIL(%0s)", $time, "Async fifo chip->fpga noc3 output wrong data");
            `ifndef VERILATOR
            repeat(5)@(posedge clk);
            `endif
            `MONITOR_PATH.fail("async_fifo_mon: Async fifo output wrong data");
            
        end 
        else
        begin
            chip_fpga_buffer3_rd_ptr <= chip_fpga_buffer3_rd_ptr + 1;  
            if (~`TOP_MOD.processor_offchip_noc3_valid)
            begin
                chip_fpga_buffer3_counter <= chip_fpga_buffer3_counter - 1;
            end
        end
    end

    if (`TOP_MOD.fpga_offfpga_noc1_valid)
    begin
        fpga_chip_noc1_buffer[fpga_chip_buffer1_wr_ptr] <= `TOP_MOD.fpga_offfpga_noc1_data;    
        fpga_chip_buffer1_wr_ptr <= fpga_chip_buffer1_wr_ptr + 1;  
        if (~`TOP_MOD.fpga_offfpga_noc1_valid)
        begin
            fpga_chip_buffer1_counter <= fpga_chip_buffer1_counter + 1;
        end
    end
    if (`TOP_MOD.offchip_processor_noc1_valid)
    begin
        if (fpga_chip_noc1_buffer[fpga_chip_buffer1_rd_ptr] != `TOP_MOD.offchip_processor_noc1_data)
        begin
            $display("%d : Simulation -> FAIL(%0s)", $time, "Async fifo fpga->chip noc1 output wrong data");
            `ifndef VERILATOR
            repeat(5)@(posedge clk);
            `endif
            `MONITOR_PATH.fail("async_fifo_mon: Async fifo output wrong data");
            
        end 
        else
        begin
            fpga_chip_buffer1_rd_ptr <= fpga_chip_buffer1_rd_ptr + 1;  
            if (~`TOP_MOD.offchip_processor_noc1_valid)
            begin
                fpga_chip_buffer1_counter <= fpga_chip_buffer1_counter - 1;
            end
        end
    end
    if (`TOP_MOD.fpga_offfpga_noc2_valid)
    begin
        fpga_chip_noc2_buffer[fpga_chip_buffer2_wr_ptr] <= `TOP_MOD.fpga_offfpga_noc2_data;    
        fpga_chip_buffer2_wr_ptr <= fpga_chip_buffer2_wr_ptr + 1;  
        if (~`TOP_MOD.offchip_processor_noc2_valid)
        begin
            fpga_chip_buffer2_counter <= fpga_chip_buffer2_counter + 1;
        end
    end
    if (`TOP_MOD.offchip_processor_noc2_valid)
    begin
        if (fpga_chip_noc2_buffer[fpga_chip_buffer2_rd_ptr] != `TOP_MOD.offchip_processor_noc2_data)
        begin
            $display("%d : Simulation -> FAIL(%0s)", $time, "Async fifo fpga->chip noc2 output wrong data");
            `ifndef VERILATOR
            repeat(5)@(posedge clk);
            `endif
            `MONITOR_PATH.fail("async_fifo_mon: Async fifo output wrong data");
            
        end 
        else
        begin
            fpga_chip_buffer2_rd_ptr <= fpga_chip_buffer2_rd_ptr + 1;  
            if (~`TOP_MOD.fpga_offfpga_noc2_valid)
            begin
                fpga_chip_buffer2_counter <= fpga_chip_buffer2_counter - 1;
            end
        end
    end
    if (`TOP_MOD.fpga_offfpga_noc3_valid)
    begin
        fpga_chip_noc3_buffer[fpga_chip_buffer3_wr_ptr] <= `TOP_MOD.fpga_offfpga_noc3_data;    
        fpga_chip_buffer3_wr_ptr <= fpga_chip_buffer3_wr_ptr + 1;  
        if (~`TOP_MOD.fpga_offfpga_noc3_valid)
        begin
            fpga_chip_buffer3_counter <= fpga_chip_buffer3_counter + 1;
        end
    end
    if (`TOP_MOD.offchip_processor_noc3_valid)
    begin
        if (fpga_chip_noc3_buffer[fpga_chip_buffer3_rd_ptr] != `TOP_MOD.offchip_processor_noc3_data)
        begin
            $display("%d : Simulation -> FAIL(%0s)", $time, "Async fifo fpga->chip noc3 output wrong data");
            `ifndef VERILATOR
            repeat(5)@(posedge clk);
            `endif
            `MONITOR_PATH.fail("async_fifo_mon: Async fifo output wrong data");
            
        end 
        else
        begin
            fpga_chip_buffer3_rd_ptr <= fpga_chip_buffer3_rd_ptr + 1;  
            if (~`TOP_MOD.offchip_processor_noc3_valid)
            begin
                fpga_chip_buffer3_counter <= fpga_chip_buffer3_counter - 1;
            end
        end
    end
end

always @ (posedge clk)
begin
    if (chip_fpga_buffer1_counter > 256)
    begin
        $display("%d : Simulation -> FAIL(%0s)", $time, "Async fifo monitor chip->fpga buffer1 overflow");
        `ifndef VERILATOR
        repeat(5)@(posedge clk);
        `endif
        `MONITOR_PATH.fail("async_fifo_mon: chip->fpga buffer1 overflow");
    end
    if (chip_fpga_buffer2_counter > 256)
    begin
        $display("%d : Simulation -> FAIL(%0s)", $time, "Async fifo monitor chip->fpga buffer2 overflow");
        `ifndef VERILATOR
        repeat(5)@(posedge clk);
        `endif
        `MONITOR_PATH.fail("async_fifo_mon: chip->fpga buffer2 overflow");
    end
    if (chip_fpga_buffer3_counter > 256)
    begin
        $display("%d : Simulation -> FAIL(%0s)", $time, "Async fifo monitor chip->fpga buffer3 overflow");
        `ifndef VERILATOR
        repeat(5)@(posedge clk);
        `endif
        `MONITOR_PATH.fail("async_fifo_mon: chip->fpga buffer3 overflow");
    end
    if (fpga_chip_buffer1_counter > 256)
    begin
        $display("%d : Simulation -> FAIL(%0s)", $time, "Async fifo monitor fpga->chip buffer1 overflow");
        `ifndef VERILATOR
        repeat(5)@(posedge clk);
        `endif
        `MONITOR_PATH.fail("async_fifo_mon: fpga->chip buffer1 overflow");
    end
    if (fpga_chip_buffer2_counter > 256)
    begin
        $display("%d : Simulation -> FAIL(%0s)", $time, "Async fifo monitor fpga->chip buffer2 overflow");
        `ifndef VERILATOR
        repeat(5)@(posedge clk);
        `endif
        `MONITOR_PATH.fail("async_fifo_mon: fpga->chip buffer2 overflow");
    end
    if (fpga_chip_buffer3_counter > 256)
    begin
        $display("%d : Simulation -> FAIL(%0s)", $time, "Async fifo monitor fpga->chip buffer3 overflow");
        `ifndef VERILATOR
        repeat(5)@(posedge clk);
        `endif
        `MONITOR_PATH.fail("async_fifo_mon: fpga->chip buffer3 overflow");
    end

end

endmodule
