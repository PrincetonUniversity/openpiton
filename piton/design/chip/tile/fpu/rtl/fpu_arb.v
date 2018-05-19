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

///////////////////////////////////////////////////////////////////////////////
//
//	Floating Point Unit to modified CCX interface wrapper.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_arb (
	arst_l,
	grst_l,
	gclk,
	cluster_cken,

    // spc0_pcx_atom_pq,
	pcx_fpio_data_rdy_px1,
    pcx_fpio_data_rdy_squashed,
	pcx_fpio_data_px2,

    l15_fp_rdy,
    // l15_fp_grant,

	fpu_arb_data_rdy,
	fpu_arb_data,
	fpu_arb_grant,

	ctu_tst_pre_grst_l,
	global_shift_enable,
	ctu_tst_scan_disable,
	ctu_tst_scanmode,
	ctu_tst_macrotest,
	ctu_tst_short_chain,

	si,

	so
);


input		    arst_l;			// chip async. reset- asserted low
input		    grst_l;			// chip sync. reset- asserted low
input		    gclk;			// chip clock
input		    cluster_cken;			// cluster clock enable

// input           spc0_pcx_atom_pq;
input		    pcx_fpio_data_rdy_px1;	// FPU request ready from PCX
input           pcx_fpio_data_rdy_squashed;  // FPU request ready from PCX
input [123:0]	pcx_fpio_data_px2;	// FPU request data from PCX

input           l15_fp_rdy;
// input           l15_fp_grant;

input			ctu_tst_pre_grst_l;
input			global_shift_enable;
input			ctu_tst_scan_disable;
input			ctu_tst_scanmode;
input 			ctu_tst_macrotest;
input 			ctu_tst_short_chain;
input           si;                     // scan in

output      	fpu_arb_data_rdy;		// FPU result request to CPX
output [144:0]	fpu_arb_data;		// FPU result to CPX
output reg      fpu_arb_grant;

output          so;                     // scan out

wire [7:0]   fp_cpx_req_cq;
wire [144:0] fp_cpx_data_ca;


//wire pcx_fpio_data_rdy_px2 = pcx_fpio_data_rdy_px1;

reg pcx_fpio_data_rdy_px2;
// reg pcx_fpio_data_rdy_px2_next;
// reg fp_req_val_px2;
// reg fp_req_val_px2_next;
// reg fp_req_val_px3;
// reg data_rdy_f;
// reg data_atm_f;
reg is_fp;

always @*
begin
    is_fp = pcx_fpio_data_px2[122:119] == 4'b0101;
    pcx_fpio_data_rdy_px2 = pcx_fpio_data_px2[123] && is_fp;
    // pcx_fpio_data_rdy_px2 = pcx_fpio_data_px2[123] && is_fp;
    // pcx_fpio_data_rdy_px2_next = pcx_fpio_data_rdy_px1 | (data_rdy_f & data_atm_f);
    // pcx_fpio_data_rdy_px2_next = pcx_fpio_data_rdy_px1 && !pcx_fpio_data_rdy_squashed && is_fp;
    fpu_arb_grant = 1'b0;
    // pcx_fpio_data_rdy_px2 = fp_req_val_px2 || fp_req_val_px3;
end

always @(posedge gclk)
begin
    if (~grst_l)
    begin
        // data_rdy_f <= 1'b0;
        // data_atm_f <= 1'b0;
        // pcx_fpio_data_rdy_px2 <= 1'b0;
    end
    else
    begin
        // data_rdy_f <= pcx_fpio_data_rdy_px1;
        // data_atm_f <= 1'b0;
        // pcx_fpio_data_rdy_px2 <= pcx_fpio_data_rdy_px2_next;
        // fp_req_val_px2 <= fp_req_val_px2_next;
        // fp_req_val_px3 <= fp_req_val_px2;
    end
end



///////////////////////////////////////////////////////////////////////////////
//
//      Instantiations.
//
///////////////////////////////////////////////////////////////////////////////

fpu fpu (
    .pcx_fpio_data_rdy_px2 (pcx_fpio_data_rdy_px2),
    .pcx_fpio_data_px2 (pcx_fpio_data_px2[123:0]),
    .arst_l (arst_l),
    .grst_l (grst_l),
    .gclk (gclk),
    .cluster_cken (cluster_cken),

    .fp_cpx_req_cq (fp_cpx_req_cq[7:0]),
    .fp_cpx_data_ca (fp_cpx_data_ca[144:0]),

    .ctu_tst_pre_grst_l (ctu_tst_pre_grst_l),
    .global_shift_enable (global_shift_enable),
    .ctu_tst_scan_disable (ctu_tst_scan_disable),
    .ctu_tst_scanmode (ctu_tst_scanmode),
    .ctu_tst_macrotest (ctu_tst_macrotest),
    .ctu_tst_short_chain (ctu_tst_short_chain),

    .si (si),
    .so (so)
);

fpu_buf fpu_buf (
    .rst_n (grst_l),
    .clk (gclk),

    .fp_cpx_req_cq (fp_cpx_req_cq[7:0]),
    .fp_cpx_data_ca (fp_cpx_data_ca[144:0]),

    .l15_fp_rdy (l15_fp_rdy),

    .fpu_arb_data_rdy (fpu_arb_data_rdy),
    .fpu_arb_data (fpu_arb_data[144:0])
);
endmodule

