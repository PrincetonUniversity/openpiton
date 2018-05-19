// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_cnt_lead0_lvl4.v
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
///////////////////////////////////////////////////////////////////////////////
//
//	4th level of lead 0 counters.  Lead 0 count for 32 bits.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_cnt_lead0_lvl4 (
	din_31_16_eq_0,
	din_31_24_eq_0,
	lead0_16b_2_hi,
	lead0_16b_1_hi,
	lead0_16b_0_hi,
	din_15_0_eq_0,
	din_15_8_eq_0,
	lead0_16b_2_lo,
	lead0_16b_1_lo,
	lead0_16b_0_lo,

	din_31_0_eq_0,
	lead0_32b_3,
	lead0_32b_2,
	lead0_32b_1,
	lead0_32b_0
);


input		din_31_16_eq_0;		// data in[31:16] is zero
input		din_31_24_eq_0;		// data in[31:24] is zero
input		lead0_16b_2_hi;		// bit[2] of lead 0 count- din[31:16]
input		lead0_16b_1_hi;		// bit[1] of lead 0 count- din[31:16]
input		lead0_16b_0_hi;		// bit[0] of lead 0 count- din[31:16]
input		din_15_0_eq_0;		// data in[15:0] is zero
input		din_15_8_eq_0;		// data in[15:8] is zero
input		lead0_16b_2_lo;		// bit[2] of lead 0 count- din[15:0]
input		lead0_16b_1_lo;		// bit[1] of lead 0 count- din[15:0]
input		lead0_16b_0_lo;		// bit[0] of lead 0 count- din[15:0]

output		din_31_0_eq_0;		// data in[31:0] is zero
output		lead0_32b_3;		// bit[3] of lead 0 count
output		lead0_32b_2;		// bit[2] of lead 0 count
output		lead0_32b_1;		// bit[1] of lead 0 count
output		lead0_32b_0;		// bit[0] of lead 0 count


wire		din_31_0_eq_0;
wire		lead0_32b_3;
wire		lead0_32b_2;
wire		lead0_32b_1;
wire		lead0_32b_0;


assign din_31_0_eq_0= din_15_0_eq_0 && din_31_16_eq_0;

assign lead0_32b_3= ((!din_31_16_eq_0) && din_31_24_eq_0)
		|| (din_31_16_eq_0 && din_15_8_eq_0);

assign lead0_32b_2= ((!din_31_16_eq_0) && lead0_16b_2_hi)
		|| (din_31_16_eq_0 && lead0_16b_2_lo);

assign lead0_32b_1= ((!din_31_16_eq_0) && lead0_16b_1_hi)
		|| (din_31_16_eq_0 && lead0_16b_1_lo);

assign lead0_32b_0= ((!din_31_16_eq_0) && lead0_16b_0_hi)
		|| (din_31_16_eq_0 && lead0_16b_0_lo);


endmodule


