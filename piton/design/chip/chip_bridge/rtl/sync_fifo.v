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
//  Filename      : sync_fifo.v
//  Created On    : 2014-10-13
//  Last Modified : 2014-10-13
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : A replacement for async fifo in case it doesn't work
//  Note          : It uses positive reset to be consistant with Sam's async fifo
//
//==================================================================================================


module sync_fifo 
#(
	parameter DSIZE = 64,
	parameter ASIZE = 5,
	parameter MEMSIZE = 16 // should be 2 ^ (ASIZE-1)
)
(
	rdata, 
	empty,
	clk,
	ren,
	wdata,
	full,
	wval,
	reset
	);

//Inputs and Outputs
output reg [DSIZE-1:0] 	rdata;
output reg			empty;
output reg			full;
input	[DSIZE-1:0]	wdata;
input			wval;
input			ren;
input			clk;
input 			reset;


reg [DSIZE-1:0] sync_buf_mem_f [MEMSIZE-1:0];
reg [ASIZE:0] sync_buf_counter_f;
reg [ASIZE:0] sync_buf_counter_next;
reg [ASIZE-2:0] sync_rd_ptr_f;
reg [ASIZE-2:0] sync_rd_ptr_next;
reg [ASIZE-2:0] sync_wr_ptr_f;
reg [ASIZE-2:0] sync_wr_ptr_next;

always @ *
begin
    empty = (sync_buf_counter_f == 0);
    full =  (sync_buf_counter_f ==  MEMSIZE);
end

always @ *
begin
    if (reset)
    begin
        sync_buf_counter_next = 0;
    end
    else if ((wval && !full) && (ren && !empty))
    begin
        sync_buf_counter_next = sync_buf_counter_f;
    end
    else if (wval && !full)
    begin
        sync_buf_counter_next = sync_buf_counter_f + 1;
    end
    else if (ren && !empty)
    begin
        sync_buf_counter_next = sync_buf_counter_f - 1;
    end
    else
    begin
        sync_buf_counter_next = sync_buf_counter_f;
    end
end


always @ (posedge clk)
begin
    sync_buf_counter_f <= sync_buf_counter_next;
end


always @ *
begin
    if (reset)
    begin   
        sync_rd_ptr_next = 0;
    end
    else if (ren && !empty)
    begin
        sync_rd_ptr_next = sync_rd_ptr_f + 1;
    end
    else
    begin
        sync_rd_ptr_next = sync_rd_ptr_f;
    end
end

always @ (posedge clk)
begin
    sync_rd_ptr_f <= sync_rd_ptr_next;
end

always @ *
begin
    if (reset)
    begin   
        sync_wr_ptr_next = 0;
    end
    else if (wval && !full)
    begin
        sync_wr_ptr_next = sync_wr_ptr_f + 1;
    end
    else
    begin
        sync_wr_ptr_next = sync_wr_ptr_f;
    end
end


always @ (posedge clk)
begin
    sync_wr_ptr_f <= sync_wr_ptr_next;
end

always @ *
begin
    rdata = sync_buf_mem_f[sync_rd_ptr_f];
end

always @ (posedge clk)
begin
    if (wval && !full)
    begin
        sync_buf_mem_f[sync_wr_ptr_f] <= wdata;
    end
    else
    begin 
        sync_buf_mem_f[sync_wr_ptr_f] <= sync_buf_mem_f[sync_wr_ptr_f];
    end
end



endmodule
