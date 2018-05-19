// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_rptr_min_global.v
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

// global (bufrpt_grp4 used to buffer rst_l, scan signals) and mintiming buffers in this file 

// fpu_bufrpt_grp4: 4 bit wide to fix max trans time for scan, reset
module fpu_bufrpt_grp4 (
	in,
	out
);
	
	input [3:0] in;
	output [3:0] out;

	assign out[3:0] = in[3:0];

endmodule


// fpu_rptr_fp_cpx_grp16: 16 bit wide vertical MSB top mintiming buffer for fp_cpx*
module fpu_rptr_fp_cpx_grp16 (
	in,
	out
);

	input [15:0] in;
	output [15:0] out;

	assign out[15:0] = in[15:0];

endmodule


// fpu_rptr_pcx_fpio_grp16: 16 bit wide mintming vertical buffer, MSB top, for pcx_fpio*
// use minbuf_5x -> buf_5x -> buf_30x
module fpu_rptr_pcx_fpio_grp16 (
	in,
	out
);

	input [15:0] in;
	output [15:0] out;

	assign out[15:0] = in[15:0];

endmodule

// fpu_rptr_inq: 156 bits wide mintiming buffer for inq_sram din (matched to inq_sram bit order)
module fpu_rptr_inq (
	in,
	out
);
	
	input [155:0] in;
	output [155:0] out;

	assign out[155:0] = in[155:0];

endmodule

