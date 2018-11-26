// Copyright (c) 2018 Princeton University
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

`include "chipset_define.vh"
`include "define.tmp.h"

module test_end_checker(
    input clk,
    input rst_n,

    // be careful!! this isn't actually a val/rdy interface
    // for this module. instead it's observing the interface
    // from the chip to the packet filter
    input                       src_checker_noc2_val,
    input [`NOC_DATA_WIDTH-1:0] src_checker_noc2_data,
    input                       src_checker_noc2_rdy,

    input                       uart_boot_en,
    output                      test_good_end,
    output                      test_bad_end
);

    localparam IDLE = 2'b00;
    localparam TWOFLITS = 2'b01;
    localparam COUNTDOWN = 2'b10;

    reg [1:0] state_reg;
    reg [1:0] state_next;

    reg [`MSG_LENGTH_WIDTH-1:0] num_flits_reg;
    reg [`MSG_LENGTH_WIDTH-1:0] num_flits_next;

    reg test_good_end_reg;
    reg test_good_end_next;

    reg test_bad_end_reg;
    reg test_bad_end_next;

    reg future_good_end_reg;
    reg future_good_end_next;

    reg future_bad_end_reg;
    reg future_bad_end_next;

    assign test_good_end = test_good_end_reg;
    assign test_bad_end  = test_bad_end_reg;

    always @* begin
        case (state_reg)
        IDLE: begin
            test_good_end_next   = 1'b0;
            test_bad_end_next    = 1'b0;
            future_good_end_next = 1'b0;
            future_bad_end_next  = 1'b0;

            if (src_checker_noc2_val & src_checker_noc2_rdy) begin
                num_flits_next = src_checker_noc2_data[`MSG_LENGTH];
                // deal with one flit packets
                if (src_checker_noc2_data[`MSG_LENGTH] == `MSG_LENGTH_WIDTH'b0) begin
                    state_next = IDLE;
                end
                else begin
                    state_next = TWOFLITS;
                end
            end
            else begin
                num_flits_next = num_flits_reg;
                state_next = IDLE;
            end
        end
        TWOFLITS: begin
            test_good_end_next   = 1'b0;
            test_bad_end_next    = 1'b0;
            future_good_end_next = 1'b0;
            future_bad_end_next  = 1'b0;

            // check the test end possibilities
            if (src_checker_noc2_val & src_checker_noc2_rdy) begin
                num_flits_next = num_flits_reg - `MSG_LENGTH_WIDTH'b1;

                // deal with two flit packets
                if (num_flits_reg == `MSG_LENGTH_WIDTH'b1) begin
                    // check test good/bad
                    test_good_end_next = (src_checker_noc2_data[`MSG_ADDR_] == `PITON_TEST_GOOD_END) & uart_boot_en;
                    test_bad_end_next  = (src_checker_noc2_data[`MSG_ADDR_] == `PITON_TEST_BAD_END) & uart_boot_en;

                    state_next = IDLE;
                end
                else begin
                    // check test good/bad
                    future_good_end_next = (src_checker_noc2_data[`MSG_ADDR_] == `PITON_TEST_GOOD_END) & uart_boot_en;
                    future_bad_end_next  = (src_checker_noc2_data[`MSG_ADDR_] == `PITON_TEST_BAD_END) & uart_boot_en;

                    state_next = COUNTDOWN;
                end
            end
            else begin
                num_flits_next = num_flits_reg;
                state_next = TWOFLITS;
            end
        end
        COUNTDOWN: begin
            test_good_end_next   = 1'b0;
            test_bad_end_next    = 1'b0;
            future_good_end_next = future_good_end_reg;
            future_bad_end_next  = future_bad_end_reg;

            if (src_checker_noc2_val & src_checker_noc2_rdy) begin
                num_flits_next = num_flits_reg - `MSG_LENGTH_WIDTH'b1;
                if (num_flits_reg == `MSG_LENGTH_WIDTH'b1) begin
                    test_good_end_next = future_good_end_reg;
                    test_bad_end_next  = future_bad_end_reg;
                    state_next = IDLE;
                end
                else begin
                    state_next = COUNTDOWN;
                end
            end
            else begin
                num_flits_next = num_flits_reg;
                state_next = COUNTDOWN;
            end
        end
        default: begin
            test_good_end_next   = 1'bx;
            test_bad_end_next    = 1'bx;
            future_good_end_next = 1'bx;
            future_bad_end_next  = 1'bx;

            num_flits_next = {`MSG_LENGTH_WIDTH{1'bx}};
            state_next = 2'bxx;
        end
        endcase
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            state_reg           <= 2'b0;
            num_flits_reg       <= `MSG_LENGTH_WIDTH'b0;
            test_good_end_reg   <= 1'b0;
            test_bad_end_reg    <= 1'b0;
            future_good_end_reg <= 1'b0;
            future_bad_end_reg  <= 1'b0;
        end
        else begin
            state_reg           <= state_next;
            num_flits_reg       <= num_flits_next;
            test_good_end_reg   <= test_good_end_next;
            test_bad_end_reg    <= test_bad_end_next;
            future_good_end_reg <= future_good_end_next;
            future_bad_end_reg  <= future_bad_end_next;
        end
    end
endmodule
