// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_cnt_lead0_lvl3.v
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
//	3rd level of lead 0 counters.  Lead 0 count for 16 bits.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_cnt_lead0_lvl3 (
	din_15_8_eq_0,
	din_15_12_eq_0,
	lead0_8b_1_hi,
	lead0_8b_0_hi,
	din_7_0_eq_0,
	din_7_4_eq_0,
	lead0_8b_1_lo,
	lead0_8b_0_lo,

	din_15_0_eq_0,
	lead0_16b_2,
	lead0_16b_1,
	lead0_16b_0
);


input		din_15_8_eq_0;		// data in[15:8] is zero
input		din_15_12_eq_0;		// data in[15:12] is zero
input		lead0_8b_1_hi;		// bit[1] of lead 0 count- din[15:8]
input		lead0_8b_0_hi;		// bit[0] of lead 0 count- din[15:8]
input		din_7_0_eq_0;		// data in[7:0] is zero
input		din_7_4_eq_0;		// data in[7:4] is zero
input		lead0_8b_1_lo;		// bit[1] of lead 0 count- din[7:0]
input		lead0_8b_0_lo;		// bit[0] of lead 0 count- din[7:0]

output		din_15_0_eq_0;		// data in[15:0] is zero
output		lead0_16b_2;		// bit[2] of lead 0 count
output		lead0_16b_1;		// bit[1] of lead 0 count
output		lead0_16b_0;		// bit[0] of lead 0 count


wire		din_15_0_eq_0;
wire		lead0_16b_2;
wire		lead0_16b_1;
wire		lead0_16b_0;


assign din_15_0_eq_0= din_7_0_eq_0 && din_15_8_eq_0;

assign lead0_16b_2= ((!din_15_8_eq_0) && din_15_12_eq_0)
		|| (din_15_8_eq_0 && din_7_4_eq_0);

assign lead0_16b_1= ((!din_15_8_eq_0) && lead0_8b_1_hi)
		|| (din_15_8_eq_0 && lead0_8b_1_lo);

assign lead0_16b_0= ((!din_15_8_eq_0) && lead0_8b_0_hi)
		|| (din_15_8_eq_0 && lead0_8b_0_lo);


endmodule


