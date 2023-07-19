// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_cnt_lead0_lvl2.v
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
//	2nd level of lead 0 counters.  Lead 0 count for 8 bits.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_cnt_lead0_lvl2 (
	din_7_4_eq_0,
	din_7_6_eq_0,
	lead0_4b_0_hi,
	din_3_0_eq_0,
	din_3_2_eq_0,
	lead0_4b_0_lo,

	din_7_0_eq_0,
	lead0_8b_1,
	lead0_8b_0
);


input		din_7_4_eq_0;		// data in[7:4] is zero
input		din_7_6_eq_0;		// data in[7:6] is zero
input		lead0_4b_0_hi;		// bit[0] of lead 0 count- data in[7:4]
input		din_3_0_eq_0;		// data in[3:0] is zero
input		din_3_2_eq_0;		// data in[3:2] is zero
input		lead0_4b_0_lo;		// bit[0] of lead 0 count- data in[3:0]

output		din_7_0_eq_0;		// data in[7:0] is zero
output		lead0_8b_1;		// bit[1] of lead 0 count
output		lead0_8b_0;		// bit[0] of lead 0 count

wire		din_7_0_eq_0;
wire		lead0_8b_1;
wire		lead0_8b_0;


assign din_7_0_eq_0= din_3_0_eq_0 && din_7_4_eq_0;

assign lead0_8b_1= ((!din_7_4_eq_0) && din_7_6_eq_0)
		|| (din_7_4_eq_0 && din_3_2_eq_0);

assign lead0_8b_0= ((!din_7_4_eq_0) && lead0_4b_0_hi)
		|| (din_7_4_eq_0 && lead0_4b_0_lo);


endmodule


