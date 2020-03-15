/*
Copyright (c) 2018 Princeton University
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
`include "iop.h" 
module pico_decoder(
    input wire         clk,
    input wire         rst_n,
    
    input wire         pico_mem_valid,
    input wire [31:0]  pico_mem_addr,
    input wire [ 3:0]  pico_mem_wstrb,
    
    input wire [31:0]  pico_mem_wdata,
    input wire [`L15_AMO_OP_WIDTH-1:0] pico_mem_amo_op,
    input wire         l15_picodecoder_ack,
    input wire         l15_picodecoder_header_ack,
    
    // outputs pico uses                    
    output reg  [4:0]  picodecoder_l15_rqtype,
    output      [`L15_AMO_OP_WIDTH-1:0] picodecoder_l15_amo_op,
    output reg  [2:0]  picodecoder_l15_size,
    output wire        picodecoder_l15_val,
    output wire [39:0] picodecoder_l15_address,
    output wire [63:0] picodecoder_l15_data,
    output wire        picodecoder_l15_nc,
    
    
    // outputs pico doesn't use                    
    output wire [0:0]  picodecoder_l15_threadid,
    output wire        picodecoder_l15_prefetch,
    output wire        picodecoder_l15_invalidate_cacheline,
    output wire        picodecoder_l15_blockstore,
    output wire        picodecoder_l15_blockinitstore,
    output wire [1:0]  picodecoder_l15_l1rplway,
    output wire [63:0] picodecoder_l15_data_next_entry,
    output wire [32:0] picodecoder_l15_csm_data
);
    localparam ACK_IDLE = 1'b0;
    localparam ACK_WAIT = 1'b1;

    assign picodecoder_l15_amo_op = pico_mem_amo_op;

    reg current_val;
    reg prev_val;
    // is this a new request from pico?
    wire new_request = current_val & ~prev_val;
    always @ (posedge clk)
    begin
        if (!rst_n) begin
           current_val <= 0;
           prev_val <= 0;
        end
        else begin
           current_val <= pico_mem_valid;
           prev_val <= current_val;
        end
    end 

    // are we waiting for an ack
    reg ack_reg;
    reg ack_next;
    always @ (posedge clk) begin
        if (!rst_n) begin
            ack_reg <= 0;
        end
        else begin
            ack_reg <= ack_next;
        end
    end
    always @ (*) begin
        // be careful with these conditionals.
        if (l15_picodecoder_ack) begin
            ack_next = ACK_IDLE;
        end
        else if (new_request) begin
            ack_next = ACK_WAIT;
        end
        else begin
            ack_next = ack_reg;
        end
    end

    
    // if we haven't got an ack and it's an old request, valid should be high
    // otherwise if we got an ack valid should be high only if we got a new
    // request
	assign picodecoder_l15_val = (ack_reg == ACK_WAIT) ? pico_mem_valid 
                                 : (ack_reg == ACK_IDLE) ? new_request
                                 : pico_mem_valid;

    reg [31:0] pico_wdata_flipped;

    // unused wires tie to zero
	assign picodecoder_l15_threadid = 1'b0;
	assign picodecoder_l15_prefetch = 1'b0;
	assign picodecoder_l15_csm_data = 33'b0;
	assign picodecoder_l15_data_next_entry = 64'b0;

	assign picodecoder_l15_blockstore = 1'b0;
	assign picodecoder_l15_blockinitstore = 1'b0;
	// is this set when something in the l1 gets replaced? pico has no cache
	assign picodecoder_l15_l1rplway = 2'b0;
	// will pico ever need to invalidate cachelines?
	assign picodecoder_l15_invalidate_cacheline = 1'b0;

    // logic to check if a request is new
	assign picodecoder_l15_address = {{8{pico_mem_addr[31]}}, pico_mem_addr};

   	assign picodecoder_l15_nc = pico_mem_addr[31] | (picodecoder_l15_rqtype == `PCX_REQTYPE_AMO);

    assign picodecoder_l15_data = {pico_wdata_flipped, pico_wdata_flipped};
	// set rqtype specific data
	always @ *
	begin
        if (pico_mem_valid) begin
	        // store or atomic operation 
            if (pico_mem_wstrb) begin
	            picodecoder_l15_rqtype = `STORE_RQ;
                // endian wizardry
                pico_wdata_flipped = {pico_mem_wdata[7:0], pico_mem_wdata[15:8],
                                      pico_mem_wdata[23:16], pico_mem_wdata[31:24]};

                // if it's an atomic operation, modify the request type.
                // That's it
                if (pico_mem_amo_op != `L15_AMO_OP_NONE) begin
                    picodecoder_l15_rqtype = `PCX_REQTYPE_AMO;
                end

                case(pico_mem_wstrb)
		            4'b1111: begin
		                picodecoder_l15_size = `MSG_DATA_SIZE_4B;
		            end
		            4'b1100, 4'b0011: begin
		                picodecoder_l15_size = `MSG_DATA_SIZE_2B;
		            end
		            4'b1000, 4'b0100, 4'b0010, 4'b0001: begin
		                picodecoder_l15_size = `MSG_DATA_SIZE_1B;
		            end
		            // this should never happen
		            default: begin
		                picodecoder_l15_size = 0;
		            end
	            endcase
	        end
	        // load operation
	        else begin
	            pico_wdata_flipped = 32'b0;
                picodecoder_l15_rqtype = `LOAD_RQ;
	            picodecoder_l15_size = `MSG_DATA_SIZE_4B;
	        end 
        end
        else begin
            pico_wdata_flipped = 32'b0;
            picodecoder_l15_rqtype = 5'b0;
            picodecoder_l15_size = 3'b0;
        end
    end


endmodule
