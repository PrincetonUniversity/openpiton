// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: lsu_stb_rand.s
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/

#include "boot.s"

!!-------------------------------------------------------------------------------
!!
!!      This file has the micro-code to test out the atomic instructions
!!
!!-------------------------------------------------------------------------------
.global T0_fast_dmmu_miss
.global main
main:

	/*
	 *****************************************	 
	 * Initialize all the registers
	 ***************************************** 
	 */
	set     0x212efed1,     %l0
	set     0x5c2d18d2,     %l1
	set     0x90e5992,     %l2
	set     0xe58da75b,     %l3
	set     0x78736fe6,     %l4
	set     0xd7fb0d46,     %l5
	set     0xf5402720,     %l6
	set     0x5394fa26,     %l7
	set     0x6e5730a,     %i0
	set     0x74e50bd9,     %i1
	set     0x24596cad,     %i2
	set     0x6fa834d0,     %i3
	set     0x5af651fc,     %i4
	set     0xe6843d39,     %i5
	set     0xe2da50c1,     %i6
	set     0x640167b5,     %i7
	set     0x9ceabc3c,     %o0
	set     0x6c3a5693,     %o1
	set     0xb1e96c4e,     %o2
	set     0x91311ca3,     %o3
	set     0x8d7c5629,     %o4
	set     0xa0f77d14,     %o5
	set     0xbeae41e0,     %o6
	set     0xa2abd004,     %o7

	/*
	 ****************************************	
	 * consecutive ld/st to page_end-->
	 * 	next_page_start
	 ****************************************	
	 */
tc_0:
	mov	0x0,	%l0
	setx	dtte_8kb_data_end,	%l0,	%l7
	setx	dtte_64kb_data_0,	%l0,	%l6
	setx	dtte_64kb_data_end,	%l0,	%l5
	setx	dtte_512kb_data_0,	%l0,	%l4
	setx	dtte_512kb_data_end,	%l0,	%l3
	setx	dtte_8kb1_data_0,	%l0,	%g1
	setx	dtte_8kb1_data_end,	%l0,	%g2
	setx	dtte_8kb2_data_0,	%l0,	%g3
	mov	0x1,	%o0
	ldub     [%l7+1],  %i7
	mov	0x2,	%o0
	ldub     [%l6+3],  %o1
	ldub     [%l5+1],  %o6
	mov	0x3,	%o0
	ldsb     [%l4+6],  %o7
	ldsb     [%l3+5],  %o3
	mov	0x5,	%o0
	ldub     [%g1+4],  %i3
	ldsb     [%g2+5],  %o1
	mov	0x6,	%o0
	ldub     [%g3+5],  %o4

/*
 ********************************
 * ld raw against more stores
 ********************************
 */ 
stb_tc0:
stb_tc0_0:    
	mov	0x0,	%l0
	setx	dtte_64kb_data_5,	%l0,	%l1
	add	%l1,	32, %l2
	setx	dtte_64kb_data_3,	%l0,	%l1
	add	%l1,	8, %l3
	setx	dtte_8kb1_data_end,	%l0,	%l1
	add	%l1,	16, %l4
	setx	dtte_8kb_data_0,	%l0,	%l1
	add	%l1,	32, %l5
	setx	dtte_8kb_data_0,	%l0,	%l1
	add	%l1,	16, %l6
	setx	dtte_8kb_data_3,	%l0,	%l1
	add	%l1,	40, %l7
	setx	dtte_64kb_data_1,	%l0,	%l1
	add	%l1,	0, %g1
	setx	dtte_8kb_data_1,	%l0,	%l1
	add	%l1,	40, %g2
	setx	dtte_512kb_data_3,	%l0,	%l1
	add	%l1,	24, %g3
	setx	dtte_8kb_data_3,	%l0,	%l1
	add	%l1,	40, %g4
	setx	dtte_8kb1_data_1,	%l0,	%l1
	add	%l1,	48, %g5

	stx	%o6,	[%l1]
	st	%o0,	[%l2]
	sth	%o6,	[%l3]
	stx	%o4,	[%l4]
	sth	%o0,	[%l5]
	sth	%o3,	[%l6]
	st	%o4,	[%l7]
	stb	%o2,	[%g1]
	stb	%o4,	[%g2]
	sth	%o7,	[%g3]
	st	%o3,	[%g4]
	stb	%o1,	[%g5]
	ldub	[%g4],	%l0
	lduh	[%l7],	%l0
	st	%i0,	[%l1]
	stx	%i5,	[%l2]
	stb	%i6,	[%l3]
	stb	%i0,	[%l4]
	stb	%i5,	[%l5]
	sth	%i4,	[%l6]
	stx	%i3,	[%l7]
	stb	%i1,	[%g1]
	stx	%i6,	[%g2]
	st	%i6,	[%g3]
	st	%i2,	[%g4]
	st	%i4,	[%g5]
	ld	[%g5],	%l0
	ld	[%l6],	%l0

	stb	%o3,	[%g1]
	st	%o2,	[%g2]
	st	%o2,	[%g3]
	stb	%o6,	[%g4]
	sth	%o7,	[%g5]
	sth	%o6,	[%l1]
	stb	%o6,	[%l2]
	stx	%o1,	[%l3]
	stb	%o7,	[%l4]
	sth	%o5,	[%l5]
	st	%o7,	[%l6]
	sth	%o6,	[%l7]
	ldx	[%g4],	%l0
	ldub	[%l7],	%l0
	sth	%i1,	[%g1]
	stx	%i4,	[%g2]
	stb	%i2,	[%g3]
	stx	%i7,	[%g4]
	stx	%i6,	[%g5]
	sth	%i2,	[%l1]
	stx	%i4,	[%l2]
	stx	%i7,	[%l3]
	stx	%i5,	[%l4]
	st	%i5,	[%l5]
	stb	%i6,	[%l6]
	stx	%i6,	[%l7]
	lduh	[%g5],	%l0
	ldub	[%l6],	%l0

stb_tc0_1:    
	mov	0x0,	%l0
	setx	dtte_512kb_data_2,	%l0,	%l1
	add	%l1,	40, %l2
	setx	dtte_8kb_data_4,	%l0,	%l1
	add	%l1,	16, %l3
	setx	dtte_8kb_data_0,	%l0,	%l1
	add	%l1,	24, %l4
	setx	dtte_512kb_data_5,	%l0,	%l1
	add	%l1,	32, %l5
	setx	dtte_512kb_data_4,	%l0,	%l1
	add	%l1,	48, %l6
	setx	dtte_8kb1_data_3,	%l0,	%l1
	add	%l1,	8, %l7
	setx	dtte_512kb_data_2,	%l0,	%l1
	add	%l1,	56, %g1
	setx	dtte_8kb_data_1,	%l0,	%l1
	add	%l1,	48, %g2
	setx	dtte_64kb_data_4,	%l0,	%l1
	add	%l1,	32, %g3
	setx	dtte_64kb_data_3,	%l0,	%l1
	add	%l1,	48, %g4
	setx	dtte_64kb_data_2,	%l0,	%l1
	add	%l1,	56, %g5

	stx	%o3,	[%l1]
	st	%o5,	[%l2]
	stb	%o5,	[%l3]
	st	%o5,	[%l4]
	st	%o6,	[%l5]
	sth	%o0,	[%l6]
	st	%o6,	[%l7]
	st	%o0,	[%g1]
	stx	%o3,	[%g2]
	stb	%o5,	[%g3]
	stx	%o1,	[%g4]
	stb	%o5,	[%g5]
	ldub	[%g4],	%l0
	ldub	[%l7],	%l0
	stx	%i3,	[%l1]
	sth	%i7,	[%l2]
	sth	%i7,	[%l3]
	sth	%i3,	[%l4]
	st	%i6,	[%l5]
	stb	%i0,	[%l6]
	st	%i0,	[%l7]
	stx	%i5,	[%g1]
	st	%i4,	[%g2]
	stx	%i5,	[%g3]
	st	%i5,	[%g4]
	stx	%i2,	[%g5]
	ld	[%g5],	%l0
	ld	[%l6],	%l0

	stb	%o5,	[%g1]
	stx	%o6,	[%g2]
	stx	%o7,	[%g3]
	st	%o1,	[%g4]
	stx	%o4,	[%g5]
	sth	%o3,	[%l1]
	stx	%o7,	[%l2]
	stx	%o1,	[%l3]
	stb	%o5,	[%l4]
	sth	%o1,	[%l5]
	sth	%o0,	[%l6]
	sth	%o6,	[%l7]
	ldub	[%g4],	%l0
	ldub	[%l7],	%l0
	stx	%i3,	[%g1]
	sth	%i6,	[%g2]
	sth	%i7,	[%g3]
	stx	%i5,	[%g4]
	stx	%i3,	[%g5]
	sth	%i7,	[%l1]
	sth	%i3,	[%l2]
	st	%i1,	[%l3]
	st	%i3,	[%l4]
	stb	%i5,	[%l5]
	sth	%i2,	[%l6]
	sth	%i7,	[%l7]
	ld	[%g5],	%l0
	ldub	[%l6],	%l0

stb_tc0_2:    
	mov	0x0,	%l0
	setx	dtte_64kb_data_0,	%l0,	%l1
	add	%l1,	0, %l2
	setx	dtte_512kb_data_4,	%l0,	%l1
	add	%l1,	16, %l3
	setx	dtte_8kb_data_4,	%l0,	%l1
	add	%l1,	16, %l4
	setx	dtte_8kb1_data_2,	%l0,	%l1
	add	%l1,	40, %l5
	setx	dtte_512kb_data_3,	%l0,	%l1
	add	%l1,	0, %l6
	setx	dtte_8kb1_data_3,	%l0,	%l1
	add	%l1,	16, %l7
	setx	dtte_8kb1_data_5,	%l0,	%l1
	add	%l1,	0, %g1
	setx	dtte_8kb1_data_0,	%l0,	%l1
	add	%l1,	16, %g2
	setx	dtte_8kb_data_3,	%l0,	%l1
	add	%l1,	24, %g3
	setx	dtte_8kb_data_1,	%l0,	%l1
	add	%l1,	24, %g4
	setx	dtte_8kb_data_end,	%l0,	%l1
	add	%l1,	0, %g5

	sth	%o2,	[%l1]
	sth	%o1,	[%l2]
	st	%o5,	[%l3]
	stb	%o4,	[%l4]
	stx	%o1,	[%l5]
	sth	%o5,	[%l6]
	sth	%o5,	[%l7]
	st	%o7,	[%g1]
	stb	%o3,	[%g2]
	stx	%o0,	[%g3]
	stx	%o6,	[%g4]
	stx	%o0,	[%g5]
	ld	[%g4],	%l0
	ldub	[%l7],	%l0
	st	%i2,	[%l1]
	sth	%i6,	[%l2]
	stx	%i3,	[%l3]
	sth	%i2,	[%l4]
	st	%i1,	[%l5]
	st	%i2,	[%l6]
	stx	%i6,	[%l7]
	st	%i5,	[%g1]
	stb	%i2,	[%g2]
	stb	%i7,	[%g3]
	stb	%i3,	[%g4]
	stx	%i6,	[%g5]
	ldx	[%g5],	%l0
	ldub	[%l6],	%l0

	stx	%o6,	[%g1]
	stb	%o7,	[%g2]
	st	%o0,	[%g3]
	stx	%o5,	[%g4]
	stb	%o1,	[%g5]
	st	%o2,	[%l1]
	stb	%o3,	[%l2]
	sth	%o0,	[%l3]
	sth	%o1,	[%l4]
	stx	%o6,	[%l5]
	sth	%o5,	[%l6]
	stx	%o6,	[%l7]
	ld	[%g4],	%l0
	ldx	[%l7],	%l0
	stx	%i6,	[%g1]
	st	%i5,	[%g2]
	st	%i6,	[%g3]
	stx	%i3,	[%g4]
	stx	%i3,	[%g5]
	sth	%i4,	[%l1]
	stb	%i3,	[%l2]
	stb	%i1,	[%l3]
	stb	%i1,	[%l4]
	stb	%i7,	[%l5]
	sth	%i7,	[%l6]
	stb	%i7,	[%l7]
	ldub	[%g5],	%l0
	ld	[%l6],	%l0

stb_tc0_3:    
	mov	0x0,	%l0
	setx	dtte_8kb_data_4,	%l0,	%l1
	add	%l1,	24, %l2
	setx	dtte_512kb_data_0,	%l0,	%l1
	add	%l1,	0, %l3
	setx	dtte_512kb_data_3,	%l0,	%l1
	add	%l1,	0, %l4
	setx	dtte_8kb_data_5,	%l0,	%l1
	add	%l1,	8, %l5
	setx	dtte_8kb_data_4,	%l0,	%l1
	add	%l1,	24, %l6
	setx	dtte_8kb1_data_end,	%l0,	%l1
	add	%l1,	0, %l7
	setx	dtte_64kb_data_1,	%l0,	%l1
	add	%l1,	56, %g1
	setx	dtte_8kb_data_5,	%l0,	%l1
	add	%l1,	48, %g2
	setx	dtte_64kb_data_3,	%l0,	%l1
	add	%l1,	8, %g3
	setx	dtte_512kb_data_end,	%l0,	%l1
	add	%l1,	16, %g4
	setx	dtte_8kb_data_5,	%l0,	%l1
	add	%l1,	48, %g5

	sth	%o6,	[%l1]
	st	%o4,	[%l2]
	sth	%o3,	[%l3]
	stx	%o6,	[%l4]
	stb	%o7,	[%l5]
	stx	%o1,	[%l6]
	st	%o3,	[%l7]
	stb	%o5,	[%g1]
	stx	%o5,	[%g2]
	sth	%o6,	[%g3]
	stx	%o0,	[%g4]
	sth	%o7,	[%g5]
	lduh	[%g4],	%l0
	ld	[%l7],	%l0
	stb	%i1,	[%l1]
	stx	%i0,	[%l2]
	stx	%i5,	[%l3]
	stx	%i7,	[%l4]
	st	%i4,	[%l5]
	sth	%i6,	[%l6]
	stx	%i7,	[%l7]
	stb	%i0,	[%g1]
	stb	%i2,	[%g2]
	stb	%i6,	[%g3]
	sth	%i6,	[%g4]
	sth	%i3,	[%g5]
	ldub	[%g5],	%l0
	ldx	[%l6],	%l0

	sth	%o7,	[%g1]
	stx	%o2,	[%g2]
	sth	%o5,	[%g3]
	stx	%o4,	[%g4]
	stb	%o3,	[%g5]
	sth	%o3,	[%l1]
	stb	%o3,	[%l2]
	stb	%o3,	[%l3]
	st	%o5,	[%l4]
	st	%o1,	[%l5]
	stx	%o7,	[%l6]
	sth	%o2,	[%l7]
	lduh	[%g4],	%l0
	ld	[%l7],	%l0
	stb	%i0,	[%g1]
	sth	%i2,	[%g2]
	stb	%i4,	[%g3]
	st	%i4,	[%g4]
	st	%i5,	[%g5]
	st	%i5,	[%l1]
	st	%i0,	[%l2]
	stx	%i6,	[%l3]
	st	%i7,	[%l4]
	st	%i7,	[%l5]
	st	%i6,	[%l6]
	stb	%i5,	[%l7]
	ld	[%g5],	%l0
	lduh	[%l6],	%l0

stb_tc0_4:    
	mov	0x0,	%l0
	setx	dtte_512kb_data_4,	%l0,	%l1
	add	%l1,	48, %l2
	setx	dtte_8kb1_data_2,	%l0,	%l1
	add	%l1,	8, %l3
	setx	dtte_8kb1_data_3,	%l0,	%l1
	add	%l1,	8, %l4
	setx	dtte_64kb_data_end,	%l0,	%l1
	add	%l1,	16, %l5
	setx	dtte_64kb_data_end,	%l0,	%l1
	add	%l1,	48, %l6
	setx	dtte_8kb1_data_4,	%l0,	%l1
	add	%l1,	48, %l7
	setx	dtte_8kb_data_6,	%l0,	%l1
	add	%l1,	48, %g1
	setx	dtte_512kb_data_end,	%l0,	%l1
	add	%l1,	32, %g2
	setx	dtte_8kb_data_2,	%l0,	%l1
	add	%l1,	40, %g3
	setx	dtte_8kb1_data_end,	%l0,	%l1
	add	%l1,	24, %g4
	setx	dtte_64kb_data_4,	%l0,	%l1
	add	%l1,	8, %g5

	st	%o6,	[%l1]
	sth	%o1,	[%l2]
	sth	%o4,	[%l3]
	st	%o3,	[%l4]
	st	%o0,	[%l5]
	stx	%o3,	[%l6]
	stx	%o4,	[%l7]
	stx	%o3,	[%g1]
	stx	%o7,	[%g2]
	stb	%o2,	[%g3]
	st	%o4,	[%g4]
	stb	%o7,	[%g5]
	ldx	[%g4],	%l0
	ldub	[%l7],	%l0
	sth	%i7,	[%l1]
	st	%i3,	[%l2]
	stb	%i6,	[%l3]
	sth	%i7,	[%l4]
	st	%i6,	[%l5]
	sth	%i7,	[%l6]
	sth	%i3,	[%l7]
	st	%i7,	[%g1]
	st	%i2,	[%g2]
	st	%i4,	[%g3]
	stb	%i2,	[%g4]
	sth	%i2,	[%g5]
	ld	[%g5],	%l0
	ldx	[%l6],	%l0

	stx	%o3,	[%g1]
	st	%o3,	[%g2]
	st	%o5,	[%g3]
	st	%o0,	[%g4]
	stx	%o0,	[%g5]
	stb	%o0,	[%l1]
	stx	%o5,	[%l2]
	stb	%o7,	[%l3]
	st	%o6,	[%l4]
	st	%o6,	[%l5]
	stb	%o7,	[%l6]
	stb	%o7,	[%l7]
	lduh	[%g4],	%l0
	ldx	[%l7],	%l0
	stx	%i7,	[%g1]
	stx	%i3,	[%g2]
	stx	%i7,	[%g3]
	sth	%i5,	[%g4]
	stb	%i0,	[%g5]
	stx	%i1,	[%l1]
	stx	%i2,	[%l2]
	stb	%i1,	[%l3]
	st	%i4,	[%l4]
	stx	%i1,	[%l5]
	sth	%i2,	[%l6]
	stx	%i5,	[%l7]
	ldx	[%g5],	%l0
	lduh	[%l6],	%l0

stb_tc0_5:    
	mov	0x0,	%l0
	setx	dtte_8kb1_data_1,	%l0,	%l1
	add	%l1,	48, %l2
	setx	dtte_8kb1_data_4,	%l0,	%l1
	add	%l1,	32, %l3
	setx	dtte_8kb_data_6,	%l0,	%l1
	add	%l1,	0, %l4
	setx	dtte_8kb_data_6,	%l0,	%l1
	add	%l1,	40, %l5
	setx	dtte_8kb1_data_0,	%l0,	%l1
	add	%l1,	32, %l6
	setx	dtte_8kb_data_end,	%l0,	%l1
	add	%l1,	32, %l7
	setx	dtte_8kb1_data_5,	%l0,	%l1
	add	%l1,	8, %g1
	setx	dtte_8kb_data_0,	%l0,	%l1
	add	%l1,	56, %g2
	setx	dtte_8kb1_data_end,	%l0,	%l1
	add	%l1,	32, %g3
	setx	dtte_64kb_data_5,	%l0,	%l1
	add	%l1,	16, %g4
	setx	dtte_512kb_data_2,	%l0,	%l1
	add	%l1,	16, %g5

	stx	%o2,	[%l1]
	sth	%o7,	[%l2]
	sth	%o4,	[%l3]
	st	%o7,	[%l4]
	st	%o6,	[%l5]
	stb	%o7,	[%l6]
	stb	%o0,	[%l7]
	stx	%o1,	[%g1]
	st	%o5,	[%g2]
	st	%o2,	[%g3]
	st	%o7,	[%g4]
	st	%o3,	[%g5]
	ldub	[%g4],	%l0
	ld	[%l7],	%l0
	stb	%i0,	[%l1]
	stb	%i5,	[%l2]
	sth	%i0,	[%l3]
	sth	%i7,	[%l4]
	sth	%i5,	[%l5]
	stb	%i6,	[%l6]
	sth	%i7,	[%l7]
	sth	%i1,	[%g1]
	stb	%i7,	[%g2]
	stb	%i3,	[%g3]
	st	%i0,	[%g4]
	sth	%i2,	[%g5]
	lduh	[%g5],	%l0
	ldub	[%l6],	%l0

	sth	%o4,	[%g1]
	sth	%o3,	[%g2]
	stb	%o3,	[%g3]
	st	%o2,	[%g4]
	stb	%o6,	[%g5]
	sth	%o0,	[%l1]
	stb	%o4,	[%l2]
	stb	%o3,	[%l3]
	stb	%o6,	[%l4]
	st	%o4,	[%l5]
	sth	%o0,	[%l6]
	stx	%o1,	[%l7]
	ldx	[%g4],	%l0
	ldx	[%l7],	%l0
	st	%i0,	[%g1]
	sth	%i2,	[%g2]
	stb	%i6,	[%g3]
	stx	%i7,	[%g4]
	stb	%i3,	[%g5]
	stb	%i3,	[%l1]
	st	%i2,	[%l2]
	st	%i5,	[%l3]
	st	%i6,	[%l4]
	stb	%i0,	[%l5]
	st	%i0,	[%l6]
	st	%i0,	[%l7]
	lduh	[%g5],	%l0
	lduh	[%l6],	%l0

stb_tc0_6:    
	mov	0x0,	%l0
	setx	dtte_8kb_data_6,	%l0,	%l1
	add	%l1,	56, %l2
	setx	dtte_8kb_data_2,	%l0,	%l1
	add	%l1,	8, %l3
	setx	dtte_512kb_data_3,	%l0,	%l1
	add	%l1,	0, %l4
	setx	dtte_8kb_data_5,	%l0,	%l1
	add	%l1,	56, %l5
	setx	dtte_8kb_data_3,	%l0,	%l1
	add	%l1,	16, %l6
	setx	dtte_8kb1_data_3,	%l0,	%l1
	add	%l1,	32, %l7
	setx	dtte_64kb_data_2,	%l0,	%l1
	add	%l1,	48, %g1
	setx	dtte_512kb_data_0,	%l0,	%l1
	add	%l1,	8, %g2
	setx	dtte_8kb1_data_4,	%l0,	%l1
	add	%l1,	56, %g3
	setx	dtte_8kb1_data_0,	%l0,	%l1
	add	%l1,	56, %g4
	setx	dtte_64kb_data_4,	%l0,	%l1
	add	%l1,	0, %g5

	st	%o5,	[%l1]
	stx	%o3,	[%l2]
	stb	%o7,	[%l3]
	sth	%o4,	[%l4]
	st	%o1,	[%l5]
	sth	%o3,	[%l6]
	stx	%o2,	[%l7]
	sth	%o6,	[%g1]
	st	%o5,	[%g2]
	sth	%o1,	[%g3]
	st	%o0,	[%g4]
	stx	%o6,	[%g5]
	ld	[%g4],	%l0
	ld	[%l7],	%l0
	stb	%i3,	[%l1]
	st	%i7,	[%l2]
	stx	%i7,	[%l3]
	sth	%i1,	[%l4]
	sth	%i4,	[%l5]
	sth	%i1,	[%l6]
	st	%i4,	[%l7]
	sth	%i3,	[%g1]
	st	%i3,	[%g2]
	stb	%i1,	[%g3]
	st	%i1,	[%g4]
	sth	%i4,	[%g5]
	ldub	[%g5],	%l0
	lduh	[%l6],	%l0

	stb	%o1,	[%g1]
	st	%o6,	[%g2]
	sth	%o6,	[%g3]
	sth	%o2,	[%g4]
	sth	%o0,	[%g5]
	stb	%o4,	[%l1]
	sth	%o4,	[%l2]
	st	%o4,	[%l3]
	stb	%o0,	[%l4]
	stx	%o5,	[%l5]
	st	%o0,	[%l6]
	stx	%o5,	[%l7]
	lduh	[%g4],	%l0
	ld	[%l7],	%l0
	stx	%i7,	[%g1]
	stx	%i6,	[%g2]
	stx	%i2,	[%g3]
	sth	%i2,	[%g4]
	stb	%i4,	[%g5]
	sth	%i0,	[%l1]
	sth	%i7,	[%l2]
	stx	%i0,	[%l3]
	stb	%i6,	[%l4]
	stx	%i5,	[%l5]
	st	%i6,	[%l6]
	stb	%i0,	[%l7]
	ldx	[%g5],	%l0
	ldub	[%l6],	%l0

stb_tc0_7:    
	mov	0x0,	%l0
	setx	dtte_64kb_data_end,	%l0,	%l1
	add	%l1,	56, %l2
	setx	dtte_8kb_data_5,	%l0,	%l1
	add	%l1,	56, %l3
	setx	dtte_64kb_data_1,	%l0,	%l1
	add	%l1,	48, %l4
	setx	dtte_8kb1_data_end,	%l0,	%l1
	add	%l1,	16, %l5
	setx	dtte_8kb_data_end,	%l0,	%l1
	add	%l1,	48, %l6
	setx	dtte_64kb_data_5,	%l0,	%l1
	add	%l1,	0, %l7
	setx	dtte_8kb1_data_4,	%l0,	%l1
	add	%l1,	8, %g1
	setx	dtte_64kb_data_6,	%l0,	%l1
	add	%l1,	32, %g2
	setx	dtte_64kb_data_3,	%l0,	%l1
	add	%l1,	24, %g3
	setx	dtte_8kb_data_6,	%l0,	%l1
	add	%l1,	8, %g4
	setx	dtte_8kb_data_4,	%l0,	%l1
	add	%l1,	0, %g5

	stb	%o6,	[%l1]
	stb	%o5,	[%l2]
	st	%o7,	[%l3]
	sth	%o6,	[%l4]
	sth	%o0,	[%l5]
	st	%o0,	[%l6]
	stb	%o2,	[%l7]
	st	%o2,	[%g1]
	st	%o0,	[%g2]
	stx	%o1,	[%g3]
	st	%o2,	[%g4]
	st	%o0,	[%g5]
	ld	[%g4],	%l0
	ldub	[%l7],	%l0
	st	%i3,	[%l1]
	stb	%i7,	[%l2]
	stb	%i4,	[%l3]
	sth	%i3,	[%l4]
	sth	%i5,	[%l5]
	sth	%i0,	[%l6]
	st	%i3,	[%l7]
	sth	%i4,	[%g1]
	st	%i5,	[%g2]
	stb	%i7,	[%g3]
	sth	%i2,	[%g4]
	sth	%i0,	[%g5]
	lduh	[%g5],	%l0
	ldub	[%l6],	%l0

	stb	%o5,	[%g1]
	sth	%o3,	[%g2]
	stb	%o5,	[%g3]
	sth	%o0,	[%g4]
	stx	%o2,	[%g5]
	stb	%o1,	[%l1]
	stb	%o6,	[%l2]
	sth	%o5,	[%l3]
	stx	%o2,	[%l4]
	st	%o1,	[%l5]
	st	%o7,	[%l6]
	stx	%o6,	[%l7]
	ldx	[%g4],	%l0
	lduh	[%l7],	%l0
	sth	%i6,	[%g1]
	stb	%i4,	[%g2]
	stb	%i2,	[%g3]
	stb	%i7,	[%g4]
	sth	%i3,	[%g5]
	st	%i1,	[%l1]
	sth	%i3,	[%l2]
	stx	%i4,	[%l3]
	stx	%i4,	[%l4]
	sth	%i1,	[%l5]
	sth	%i2,	[%l6]
	stb	%i0,	[%l7]
	lduh	[%g5],	%l0
	ld	[%l6],	%l0

stb_tc0_8:    
	mov	0x0,	%l0
	setx	dtte_8kb_data_3,	%l0,	%l1
	add	%l1,	24, %l2
	setx	dtte_8kb_data_5,	%l0,	%l1
	add	%l1,	0, %l3
	setx	dtte_512kb_data_4,	%l0,	%l1
	add	%l1,	8, %l4
	setx	dtte_8kb1_data_1,	%l0,	%l1
	add	%l1,	32, %l5
	setx	dtte_64kb_data_6,	%l0,	%l1
	add	%l1,	32, %l6
	setx	dtte_8kb1_data_0,	%l0,	%l1
	add	%l1,	32, %l7
	setx	dtte_8kb1_data_4,	%l0,	%l1
	add	%l1,	32, %g1
	setx	dtte_512kb_data_0,	%l0,	%l1
	add	%l1,	48, %g2
	setx	dtte_512kb_data_2,	%l0,	%l1
	add	%l1,	24, %g3
	setx	dtte_8kb1_data_5,	%l0,	%l1
	add	%l1,	40, %g4
	setx	dtte_512kb_data_0,	%l0,	%l1
	add	%l1,	0, %g5

	st	%o0,	[%l1]
	st	%o7,	[%l2]
	sth	%o7,	[%l3]
	stb	%o6,	[%l4]
	stx	%o1,	[%l5]
	st	%o7,	[%l6]
	st	%o4,	[%l7]
	st	%o6,	[%g1]
	stx	%o1,	[%g2]
	sth	%o0,	[%g3]
	stx	%o1,	[%g4]
	sth	%o0,	[%g5]
	ld	[%g4],	%l0
	ld	[%l7],	%l0
	st	%i6,	[%l1]
	st	%i1,	[%l2]
	stx	%i0,	[%l3]
	st	%i7,	[%l4]
	stx	%i3,	[%l5]
	sth	%i4,	[%l6]
	stx	%i7,	[%l7]
	st	%i4,	[%g1]
	sth	%i1,	[%g2]
	stb	%i2,	[%g3]
	st	%i0,	[%g4]
	stb	%i7,	[%g5]
	ld	[%g5],	%l0
	ld	[%l6],	%l0

	stx	%o0,	[%g1]
	stx	%o0,	[%g2]
	stb	%o2,	[%g3]
	sth	%o1,	[%g4]
	sth	%o4,	[%g5]
	stb	%o6,	[%l1]
	stb	%o4,	[%l2]
	st	%o7,	[%l3]
	sth	%o4,	[%l4]
	sth	%o0,	[%l5]
	sth	%o5,	[%l6]
	st	%o0,	[%l7]
	lduh	[%g4],	%l0
	lduh	[%l7],	%l0
	stx	%i7,	[%g1]
	stb	%i4,	[%g2]
	stx	%i5,	[%g3]
	stb	%i3,	[%g4]
	stx	%i3,	[%g5]
	sth	%i6,	[%l1]
	sth	%i4,	[%l2]
	st	%i4,	[%l3]
	st	%i2,	[%l4]
	sth	%i3,	[%l5]
	stx	%i3,	[%l6]
	stb	%i4,	[%l7]
	lduh	[%g5],	%l0
	ld	[%l6],	%l0

stb_tc0_9:    
	mov	0x0,	%l0
	setx	dtte_8kb_data_4,	%l0,	%l1
	add	%l1,	48, %l2
	setx	dtte_64kb_data_3,	%l0,	%l1
	add	%l1,	56, %l3
	setx	dtte_512kb_data_1,	%l0,	%l1
	add	%l1,	56, %l4
	setx	dtte_64kb_data_6,	%l0,	%l1
	add	%l1,	24, %l5
	setx	dtte_8kb1_data_3,	%l0,	%l1
	add	%l1,	40, %l6
	setx	dtte_8kb1_data_0,	%l0,	%l1
	add	%l1,	40, %l7
	setx	dtte_8kb_data_6,	%l0,	%l1
	add	%l1,	48, %g1
	setx	dtte_8kb_data_3,	%l0,	%l1
	add	%l1,	48, %g2
	setx	dtte_8kb1_data_end,	%l0,	%l1
	add	%l1,	40, %g3
	setx	dtte_64kb_data_1,	%l0,	%l1
	add	%l1,	16, %g4
	setx	dtte_8kb_data_end,	%l0,	%l1
	add	%l1,	48, %g5

	st	%o5,	[%l1]
	st	%o3,	[%l2]
	stb	%o5,	[%l3]
	stb	%o4,	[%l4]
	st	%o4,	[%l5]
	stb	%o0,	[%l6]
	stx	%o1,	[%l7]
	stb	%o7,	[%g1]
	stb	%o1,	[%g2]
	stx	%o6,	[%g3]
	stb	%o0,	[%g4]
	stb	%o5,	[%g5]
	ld	[%g4],	%l0
	ld	[%l7],	%l0
	stx	%i1,	[%l1]
	stx	%i3,	[%l2]
	stx	%i6,	[%l3]
	sth	%i3,	[%l4]
	stb	%i4,	[%l5]
	sth	%i2,	[%l6]
	stb	%i6,	[%l7]
	stx	%i4,	[%g1]
	st	%i6,	[%g2]
	sth	%i3,	[%g3]
	st	%i1,	[%g4]
	sth	%i2,	[%g5]
	ldub	[%g5],	%l0
	ld	[%l6],	%l0

	stb	%o4,	[%g1]
	stx	%o4,	[%g2]
	stb	%o6,	[%g3]
	st	%o3,	[%g4]
	st	%o6,	[%g5]
	st	%o7,	[%l1]
	stx	%o0,	[%l2]
	stx	%o7,	[%l3]
	st	%o2,	[%l4]
	sth	%o6,	[%l5]
	st	%o1,	[%l6]
	sth	%o5,	[%l7]
	ld	[%g4],	%l0
	ld	[%l7],	%l0
	st	%i4,	[%g1]
	sth	%i7,	[%g2]
	stx	%i0,	[%g3]
	stb	%i6,	[%g4]
	st	%i3,	[%g5]
	stx	%i0,	[%l1]
	st	%i0,	[%l2]
	sth	%i3,	[%l3]
	stx	%i0,	[%l4]
	sth	%i0,	[%l5]
	stb	%i0,	[%l6]
	stb	%i6,	[%l7]
	ld	[%g5],	%l0
	ld	[%l6],	%l0

stb_tc0_10:    
	mov	0x0,	%l0
	setx	dtte_8kb_data_4,	%l0,	%l1
	add	%l1,	56, %l2
	setx	dtte_8kb_data_end,	%l0,	%l1
	add	%l1,	24, %l3
	setx	dtte_8kb_data_0,	%l0,	%l1
	add	%l1,	16, %l4
	setx	dtte_64kb_data_end,	%l0,	%l1
	add	%l1,	56, %l5
	setx	dtte_64kb_data_2,	%l0,	%l1
	add	%l1,	48, %l6
	setx	dtte_8kb_data_6,	%l0,	%l1
	add	%l1,	40, %l7
	setx	dtte_512kb_data_5,	%l0,	%l1
	add	%l1,	56, %g1
	setx	dtte_512kb_data_2,	%l0,	%l1
	add	%l1,	16, %g2
	setx	dtte_8kb_data_2,	%l0,	%l1
	add	%l1,	48, %g3
	setx	dtte_64kb_data_4,	%l0,	%l1
	add	%l1,	32, %g4
	setx	dtte_8kb_data_end,	%l0,	%l1
	add	%l1,	0, %g5

	stx	%o0,	[%l1]
	sth	%o5,	[%l2]
	st	%o1,	[%l3]
	stb	%o2,	[%l4]
	stb	%o7,	[%l5]
	stb	%o1,	[%l6]
	st	%o1,	[%l7]
	stb	%o3,	[%g1]
	st	%o5,	[%g2]
	sth	%o7,	[%g3]
	stx	%o7,	[%g4]
	st	%o0,	[%g5]
	ldub	[%g4],	%l0
	lduh	[%l7],	%l0
	stx	%i6,	[%l1]
	sth	%i4,	[%l2]
	sth	%i1,	[%l3]
	st	%i1,	[%l4]
	st	%i1,	[%l5]
	sth	%i3,	[%l6]
	stx	%i4,	[%l7]
	st	%i1,	[%g1]
	st	%i5,	[%g2]
	stb	%i0,	[%g3]
	sth	%i6,	[%g4]
	stb	%i4,	[%g5]
	ldx	[%g5],	%l0
	ldx	[%l6],	%l0

	sth	%o5,	[%g1]
	stb	%o1,	[%g2]
	st	%o4,	[%g3]
	stb	%o6,	[%g4]
	st	%o1,	[%g5]
	st	%o2,	[%l1]
	stb	%o0,	[%l2]
	stx	%o2,	[%l3]
	stx	%o6,	[%l4]
	st	%o5,	[%l5]
	stx	%o0,	[%l6]
	sth	%o4,	[%l7]
	ldub	[%g4],	%l0
	ldub	[%l7],	%l0
	st	%i6,	[%g1]
	sth	%i1,	[%g2]
	st	%i4,	[%g3]
	stx	%i7,	[%g4]
	sth	%i5,	[%g5]
	stb	%i3,	[%l1]
	sth	%i2,	[%l2]
	sth	%i3,	[%l3]
	stx	%i6,	[%l4]
	st	%i2,	[%l5]
	st	%i4,	[%l6]
	sth	%i6,	[%l7]
	ldx	[%g5],	%l0
	lduh	[%l6],	%l0

stb_tc0_11:    
	mov	0x0,	%l0
	setx	dtte_64kb_data_6,	%l0,	%l1
	add	%l1,	40, %l2
	setx	dtte_64kb_data_3,	%l0,	%l1
	add	%l1,	32, %l3
	setx	dtte_8kb_data_1,	%l0,	%l1
	add	%l1,	32, %l4
	setx	dtte_64kb_data_2,	%l0,	%l1
	add	%l1,	0, %l5
	setx	dtte_8kb_data_5,	%l0,	%l1
	add	%l1,	48, %l6
	setx	dtte_512kb_data_0,	%l0,	%l1
	add	%l1,	16, %l7
	setx	dtte_8kb1_data_5,	%l0,	%l1
	add	%l1,	32, %g1
	setx	dtte_512kb_data_1,	%l0,	%l1
	add	%l1,	32, %g2
	setx	dtte_512kb_data_5,	%l0,	%l1
	add	%l1,	40, %g3
	setx	dtte_8kb1_data_2,	%l0,	%l1
	add	%l1,	48, %g4
	setx	dtte_512kb_data_1,	%l0,	%l1
	add	%l1,	8, %g5

	stb	%o7,	[%l1]
	st	%o0,	[%l2]
	sth	%o2,	[%l3]
	st	%o1,	[%l4]
	stb	%o3,	[%l5]
	sth	%o6,	[%l6]
	stb	%o7,	[%l7]
	stx	%o2,	[%g1]
	sth	%o2,	[%g2]
	stb	%o2,	[%g3]
	sth	%o6,	[%g4]
	st	%o7,	[%g5]
	ld	[%g4],	%l0
	ldub	[%l7],	%l0
	stx	%i0,	[%l1]
	sth	%i3,	[%l2]
	stx	%i1,	[%l3]
	sth	%i1,	[%l4]
	stb	%i2,	[%l5]
	stx	%i7,	[%l6]
	stb	%i1,	[%l7]
	sth	%i0,	[%g1]
	stb	%i4,	[%g2]
	sth	%i5,	[%g3]
	sth	%i5,	[%g4]
	st	%i5,	[%g5]
	ldx	[%g5],	%l0
	ldub	[%l6],	%l0

	sth	%o4,	[%g1]
	stx	%o2,	[%g2]
	st	%o3,	[%g3]
	stx	%o4,	[%g4]
	stb	%o7,	[%g5]
	sth	%o5,	[%l1]
	stx	%o5,	[%l2]
	stb	%o7,	[%l3]
	stb	%o3,	[%l4]
	stb	%o1,	[%l5]
	st	%o6,	[%l6]
	stx	%o6,	[%l7]
	lduh	[%g4],	%l0
	ld	[%l7],	%l0
	st	%i2,	[%g1]
	st	%i4,	[%g2]
	stx	%i0,	[%g3]
	sth	%i1,	[%g4]
	stx	%i3,	[%g5]
	stx	%i1,	[%l1]
	st	%i5,	[%l2]
	stx	%i3,	[%l3]
	st	%i7,	[%l4]
	st	%i3,	[%l5]
	st	%i5,	[%l6]
	stb	%i4,	[%l7]
	ldub	[%g5],	%l0
	ld	[%l6],	%l0

stb_tc0_12:    
	mov	0x0,	%l0
	setx	dtte_8kb1_data_2,	%l0,	%l1
	add	%l1,	16, %l2
	setx	dtte_64kb_data_5,	%l0,	%l1
	add	%l1,	8, %l3
	setx	dtte_512kb_data_1,	%l0,	%l1
	add	%l1,	32, %l4
	setx	dtte_8kb_data_1,	%l0,	%l1
	add	%l1,	40, %l5
	setx	dtte_64kb_data_2,	%l0,	%l1
	add	%l1,	8, %l6
	setx	dtte_8kb1_data_end,	%l0,	%l1
	add	%l1,	0, %l7
	setx	dtte_512kb_data_2,	%l0,	%l1
	add	%l1,	48, %g1
	setx	dtte_64kb_data_0,	%l0,	%l1
	add	%l1,	32, %g2
	setx	dtte_8kb1_data_5,	%l0,	%l1
	add	%l1,	24, %g3
	setx	dtte_512kb_data_0,	%l0,	%l1
	add	%l1,	24, %g4
	setx	dtte_8kb1_data_6,	%l0,	%l1
	add	%l1,	8, %g5

	stb	%o2,	[%l1]
	stb	%o2,	[%l2]
	stb	%o1,	[%l3]
	sth	%o0,	[%l4]
	stb	%o1,	[%l5]
	sth	%o3,	[%l6]
	st	%o5,	[%l7]
	stb	%o7,	[%g1]
	stx	%o2,	[%g2]
	stb	%o7,	[%g3]
	st	%o5,	[%g4]
	stx	%o7,	[%g5]
	ld	[%g4],	%l0
	ldub	[%l7],	%l0
	st	%i4,	[%l1]
	st	%i2,	[%l2]
	stx	%i4,	[%l3]
	st	%i4,	[%l4]
	st	%i1,	[%l5]
	sth	%i6,	[%l6]
	stx	%i3,	[%l7]
	stb	%i1,	[%g1]
	st	%i4,	[%g2]
	stx	%i5,	[%g3]
	stx	%i7,	[%g4]
	stx	%i5,	[%g5]
	ldub	[%g5],	%l0
	lduh	[%l6],	%l0

	stx	%o2,	[%g1]
	st	%o0,	[%g2]
	stx	%o4,	[%g3]
	st	%o1,	[%g4]
	stx	%o4,	[%g5]
	stb	%o5,	[%l1]
	stx	%o7,	[%l2]
	stx	%o0,	[%l3]
	stx	%o5,	[%l4]
	st	%o1,	[%l5]
	stx	%o4,	[%l6]
	stx	%o3,	[%l7]
	ld	[%g4],	%l0
	ldx	[%l7],	%l0
	stx	%i0,	[%g1]
	sth	%i5,	[%g2]
	sth	%i7,	[%g3]
	st	%i2,	[%g4]
	stb	%i3,	[%g5]
	sth	%i0,	[%l1]
	st	%i4,	[%l2]
	st	%i2,	[%l3]
	sth	%i4,	[%l4]
	sth	%i0,	[%l5]
	sth	%i2,	[%l6]
	stb	%i1,	[%l7]
	ldub	[%g5],	%l0
	ldub	[%l6],	%l0

stb_tc0_13:    
	mov	0x0,	%l0
	setx	dtte_8kb1_data_3,	%l0,	%l1
	add	%l1,	16, %l2
	setx	dtte_8kb_data_2,	%l0,	%l1
	add	%l1,	56, %l3
	setx	dtte_8kb_data_end,	%l0,	%l1
	add	%l1,	48, %l4
	setx	dtte_512kb_data_2,	%l0,	%l1
	add	%l1,	0, %l5
	setx	dtte_8kb_data_end,	%l0,	%l1
	add	%l1,	56, %l6
	setx	dtte_8kb1_data_3,	%l0,	%l1
	add	%l1,	16, %l7
	setx	dtte_8kb_data_3,	%l0,	%l1
	add	%l1,	8, %g1
	setx	dtte_64kb_data_5,	%l0,	%l1
	add	%l1,	16, %g2
	setx	dtte_512kb_data_2,	%l0,	%l1
	add	%l1,	0, %g3
	setx	dtte_8kb_data_end,	%l0,	%l1
	add	%l1,	16, %g4
	setx	dtte_512kb_data_end,	%l0,	%l1
	add	%l1,	56, %g5

	st	%o0,	[%l1]
	st	%o3,	[%l2]
	stb	%o7,	[%l3]
	sth	%o5,	[%l4]
	stx	%o3,	[%l5]
	stx	%o7,	[%l6]
	st	%o7,	[%l7]
	st	%o7,	[%g1]
	stb	%o0,	[%g2]
	stx	%o6,	[%g3]
	st	%o3,	[%g4]
	st	%o4,	[%g5]
	ldx	[%g4],	%l0
	ldx	[%l7],	%l0
	stx	%i3,	[%l1]
	stx	%i4,	[%l2]
	sth	%i5,	[%l3]
	stx	%i2,	[%l4]
	sth	%i4,	[%l5]
	stx	%i1,	[%l6]
	st	%i0,	[%l7]
	stx	%i7,	[%g1]
	stx	%i0,	[%g2]
	st	%i5,	[%g3]
	sth	%i0,	[%g4]
	stb	%i2,	[%g5]
	ld	[%g5],	%l0
	ldx	[%l6],	%l0

	stx	%o7,	[%g1]
	sth	%o5,	[%g2]
	sth	%o4,	[%g3]
	stx	%o2,	[%g4]
	stx	%o4,	[%g5]
	stb	%o2,	[%l1]
	st	%o2,	[%l2]
	stx	%o1,	[%l3]
	stx	%o5,	[%l4]
	st	%o5,	[%l5]
	stx	%o4,	[%l6]
	stx	%o5,	[%l7]
	ldub	[%g4],	%l0
	ldub	[%l7],	%l0
	sth	%i5,	[%g1]
	stx	%i1,	[%g2]
	sth	%i6,	[%g3]
	stb	%i6,	[%g4]
	stx	%i6,	[%g5]
	sth	%i3,	[%l1]
	stb	%i5,	[%l2]
	stb	%i4,	[%l3]
	stx	%i6,	[%l4]
	stb	%i3,	[%l5]
	stb	%i7,	[%l6]
	st	%i5,	[%l7]
	ld	[%g5],	%l0
	lduh	[%l6],	%l0

stb_tc0_14:    
	mov	0x0,	%l0
	setx	dtte_8kb_data_0,	%l0,	%l1
	add	%l1,	8, %l2
	setx	dtte_8kb1_data_2,	%l0,	%l1
	add	%l1,	8, %l3
	setx	dtte_8kb_data_6,	%l0,	%l1
	add	%l1,	24, %l4
	setx	dtte_64kb_data_4,	%l0,	%l1
	add	%l1,	16, %l5
	setx	dtte_8kb_data_end,	%l0,	%l1
	add	%l1,	0, %l6
	setx	dtte_8kb_data_0,	%l0,	%l1
	add	%l1,	48, %l7
	setx	dtte_8kb_data_end,	%l0,	%l1
	add	%l1,	40, %g1
	setx	dtte_512kb_data_1,	%l0,	%l1
	add	%l1,	0, %g2
	setx	dtte_64kb_data_3,	%l0,	%l1
	add	%l1,	56, %g3
	setx	dtte_512kb_data_end,	%l0,	%l1
	add	%l1,	0, %g4
	setx	dtte_64kb_data_4,	%l0,	%l1
	add	%l1,	48, %g5

	sth	%o3,	[%l1]
	stb	%o2,	[%l2]
	stx	%o5,	[%l3]
	stb	%o3,	[%l4]
	st	%o4,	[%l5]
	st	%o3,	[%l6]
	st	%o4,	[%l7]
	st	%o0,	[%g1]
	st	%o3,	[%g2]
	stx	%o4,	[%g3]
	sth	%o3,	[%g4]
	st	%o7,	[%g5]
	lduh	[%g4],	%l0
	lduh	[%l7],	%l0
	st	%i5,	[%l1]
	stb	%i3,	[%l2]
	sth	%i4,	[%l3]
	stx	%i5,	[%l4]
	stb	%i4,	[%l5]
	stb	%i4,	[%l6]
	stx	%i6,	[%l7]
	st	%i5,	[%g1]
	stx	%i3,	[%g2]
	st	%i3,	[%g3]
	sth	%i7,	[%g4]
	st	%i1,	[%g5]
	lduh	[%g5],	%l0
	lduh	[%l6],	%l0

	st	%o4,	[%g1]
	sth	%o4,	[%g2]
	stb	%o2,	[%g3]
	stx	%o1,	[%g4]
	stx	%o0,	[%g5]
	stx	%o3,	[%l1]
	stx	%o4,	[%l2]
	st	%o4,	[%l3]
	st	%o5,	[%l4]
	stx	%o5,	[%l5]
	st	%o0,	[%l6]
	stx	%o2,	[%l7]
	lduh	[%g4],	%l0
	ldub	[%l7],	%l0
	stx	%i5,	[%g1]
	stx	%i5,	[%g2]
	stx	%i0,	[%g3]
	st	%i1,	[%g4]
	stb	%i1,	[%g5]
	st	%i7,	[%l1]
	sth	%i2,	[%l2]
	stx	%i7,	[%l3]
	st	%i3,	[%l4]
	stb	%i0,	[%l5]
	sth	%i5,	[%l6]
	stb	%i7,	[%l7]
	ldx	[%g5],	%l0
	lduh	[%l6],	%l0

stb_tc0_15:    
	mov	0x0,	%l0
	setx	dtte_64kb_data_1,	%l0,	%l1
	add	%l1,	48, %l2
	setx	dtte_8kb_data_4,	%l0,	%l1
	add	%l1,	0, %l3
	setx	dtte_8kb1_data_6,	%l0,	%l1
	add	%l1,	32, %l4
	setx	dtte_8kb1_data_3,	%l0,	%l1
	add	%l1,	48, %l5
	setx	dtte_64kb_data_2,	%l0,	%l1
	add	%l1,	24, %l6
	setx	dtte_8kb_data_6,	%l0,	%l1
	add	%l1,	56, %l7
	setx	dtte_512kb_data_2,	%l0,	%l1
	add	%l1,	8, %g1
	setx	dtte_8kb1_data_2,	%l0,	%l1
	add	%l1,	24, %g2
	setx	dtte_64kb_data_0,	%l0,	%l1
	add	%l1,	16, %g3
	setx	dtte_512kb_data_end,	%l0,	%l1
	add	%l1,	0, %g4
	setx	dtte_512kb_data_4,	%l0,	%l1
	add	%l1,	56, %g5

	stx	%o5,	[%l1]
	st	%o0,	[%l2]
	sth	%o1,	[%l3]
	sth	%o4,	[%l4]
	st	%o2,	[%l5]
	st	%o1,	[%l6]
	sth	%o7,	[%l7]
	stb	%o2,	[%g1]
	st	%o1,	[%g2]
	sth	%o6,	[%g3]
	st	%o1,	[%g4]
	st	%o6,	[%g5]
	ldub	[%g4],	%l0
	ldub	[%l7],	%l0
	sth	%i7,	[%l1]
	stb	%i7,	[%l2]
	sth	%i4,	[%l3]
	stb	%i4,	[%l4]
	stb	%i6,	[%l5]
	sth	%i2,	[%l6]
	st	%i7,	[%l7]
	sth	%i0,	[%g1]
	sth	%i5,	[%g2]
	sth	%i3,	[%g3]
	stb	%i0,	[%g4]
	sth	%i6,	[%g5]
	ldx	[%g5],	%l0
	ldx	[%l6],	%l0

	stb	%o4,	[%g1]
	stb	%o3,	[%g2]
	st	%o2,	[%g3]
	stb	%o0,	[%g4]
	sth	%o1,	[%g5]
	sth	%o3,	[%l1]
	stx	%o4,	[%l2]
	stx	%o7,	[%l3]
	stb	%o5,	[%l4]
	st	%o1,	[%l5]
	stx	%o2,	[%l6]
	stx	%o4,	[%l7]
	ldub	[%g4],	%l0
	lduh	[%l7],	%l0
	st	%i7,	[%g1]
	sth	%i6,	[%g2]
	stx	%i3,	[%g3]
	stx	%i3,	[%g4]
	stx	%i6,	[%g5]
	sth	%i6,	[%l1]
	stx	%i5,	[%l2]
	st	%i7,	[%l3]
	stx	%i0,	[%l4]
	stx	%i7,	[%l5]
	stx	%i4,	[%l6]
	st	%i3,	[%l7]
	ldx	[%g5],	%l0
	ldub	[%l6],	%l0




/*
 ********************************
 *      Diag PASSED !           *
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
        ta T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        set     0xdeadcafe,     %l0
        ta T_BAD_TRAP
        nop
        nop

/*
 **********************************************
 * Customized fast DMMU page fault handler
 *
 * Input :

        %o0 : if 0, use standard way to
                handle the DMMU miss;

        Otherwise, use propritary trap handler
 **********************************************
 */

!!-----------------------------------------------------
!!      8kb page size for I/D TTE
!!-----------------------------------------------------
#define RDM_8KB_PG_BASE_DATA_ADDR     0x36e000
#define RDM_8KB_PG_BASE_DATA_ADDR_PA  0x10036e000
SECTION .RDM_8KB_PAGE	DATA_VA=RDM_8KB_PG_BASE_DATA_ADDR
attr_data {
        Name = .RDM_8KB_PAGE
        VA=RDM_8KB_PG_BASE_DATA_ADDR, 
	PA=ra2pa(RDM_8KB_PG_BASE_DATA_ADDR,0),
	RA=RDM_8KB_PG_BASE_DATA_ADDR,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.data

.global  dtte_8kb_data_0
dtte_8kb_data_0:
		.word 0x7d04149d
		.word 0xb5e0446c
		.word 0x2731758c
		.word 0x9ca0c0a
		.word 0xc513e0db
		.word 0x9640f444
		.word 0xd8907e28
		.word 0x57b17d96
		.word 0xf1a41b88
		.word 0x6c67f062
		.word 0x8dc4fd23
		.word 0x68dffa5f
		.word 0x845922b4
		.word 0xe91ea2d2
		.word 0x858bb051
		.word 0x438ddae6
.align 1024
	.word 0x68e8aa1c
	.word 0x55f9e498
	.word 0x1ee1edb
	.word 0x3bb1e20c
.align 512
.global  dtte_8kb_data_1
dtte_8kb_data_1:
		.word 0xa1fc4387
		.word 0x2c87e84c
		.word 0x80007244
		.word 0xc7803bc4
		.word 0xc2098972
		.word 0x47d9b9ec
		.word 0x7b55bab
		.word 0x2f4e3309
		.word 0xb9afcfef
		.word 0xb98467ed
		.word 0x1eb4894d
		.word 0x6e26d312
		.word 0xb3c57fc9
		.word 0xb8632993
		.word 0xce4704e
		.word 0x246be7c4
.align 1024
	.word 0xd3d7fec
	.word 0x2a251682
	.word 0x55206eb8
	.word 0x73a21168
.align 512
	.word 0x86af5103
	.word 0xb6464393
	.word 0x4a089c3
	.word 0x613ddf9d
.align 256
.global  dtte_8kb_data_2
dtte_8kb_data_2:
		.word 0xcd2bf62
		.word 0xfabd58eb
		.word 0xc8284c56
		.word 0x91332790
		.word 0x7eea4f27
		.word 0x8da3f54a
		.word 0x536689ce
		.word 0xd7670969
		.word 0xac25c69b
		.word 0xb4b172a0
		.word 0x5d4808fd
		.word 0xc385908
		.word 0xfdb87add
		.word 0xb8c4dfe5
		.word 0x4f9b5b74
		.word 0x73595df0
.align 1024
	.word 0x70f542c1
	.word 0x22344429
	.word 0x59846505
	.word 0xc8711e83
.align 512
	.word 0x4d7c33f5
	.word 0xf7647eea
	.word 0x2f225783
	.word 0x9a9aa6f
.align 256
	.word 0x75a48e65
	.word 0xdb8e59a5
	.word 0xbdb326cb
	.word 0x70b41868
.align 128
.global  dtte_8kb_data_3
dtte_8kb_data_3:
		.word 0xfd0f79e0
		.word 0xcca9eaf
		.word 0x16abb908
		.word 0xbe222b17
		.word 0x70f679fb
		.word 0x37c84944
		.word 0xedec5731
		.word 0x4480d151
		.word 0xa992bc35
		.word 0xb22d22e0
		.word 0x23ad21d6
		.word 0xaf9df58c
		.word 0x3228a45b
		.word 0x4bd261cd
		.word 0xda368e1c
		.word 0xbc17508e
.align 1024
	.word 0x18153b2e
	.word 0xc0141cfd
	.word 0xb6362f06
	.word 0x4af73366
.align 512
	.word 0xe6f16342
	.word 0x2c83a919
	.word 0xcec04ef5
	.word 0xffff7ca0
.align 256
.global  dtte_8kb_data_4
dtte_8kb_data_4:
		.word 0x8ab8f828
		.word 0x6eba32d9
		.word 0xf4131d71
		.word 0xe6922cb3
		.word 0xef223bcf
		.word 0x190a2a96
		.word 0xca387529
		.word 0x242a4dbe
		.word 0x4f343627
		.word 0xd2a3551c
		.word 0x7aef7e38
		.word 0x2f4f2273
		.word 0xf7f0eb06
		.word 0x8ca695c5
		.word 0xb917b0a9
		.word 0x3216d053
.align 1024
	.word 0x9ed28a4f
	.word 0x67e3c5c2
	.word 0x7b6afb3d
	.word 0x7eecf91b
.align 512
.global  dtte_8kb_data_5
dtte_8kb_data_5:
		.word 0x9728fe50
		.word 0x77cd2cbb
		.word 0x3ced126b
		.word 0x50a4f77e
		.word 0xa577c6c
		.word 0x93d16e9b
		.word 0x3522ba7
		.word 0x6b26b313
		.word 0xa4c7fbf9
		.word 0xa0602a4
		.word 0xb6ffa8e7
		.word 0xc3803f90
		.word 0xd664b76b
		.word 0x821987c9
		.word 0x116d7862
		.word 0xbc15bb38
.align 1024
	.word 0x1fc61bb1
	.word 0x87268a3c
	.word 0x25d72c9a
	.word 0xf4c2092
.align 512
	.word 0xdf45c9df
	.word 0xa7748e44
	.word 0x2998109c
	.word 0x7fa2ff5b
.align 256
.global  dtte_8kb_data_6
dtte_8kb_data_6:
		.word 0x810d8f0c
		.word 0x9bbe7454
		.word 0x57dbc86
		.word 0x4afc50bc
		.word 0xd543767d
		.word 0x81728a59
		.word 0x8410ee4a
		.word 0x1f10dabf
		.word 0xfde25a02
		.word 0x85d1de53
		.word 0xca8caab0
		.word 0x8a02d6ff
		.word 0xe4e094a0
		.word 0xe019a627
		.word 0x9f37eaa1
		.word 0x32e7d09f
.align 1024
	.word 0x613cbb6f
	.word 0x303ad0b2
	.word 0xc05658a1
	.word 0x563ded7c
.align 512
	.word 0x28a280c5
	.word 0x23511421
	.word 0xef28e29d
	.word 0x50d016a6
.align 256
	.word 0xd1d82594
	.word 0x104c0d7f
	.word 0xabf23e6
	.word 0x63cfb40b
.align 128
	.word 0x94471d10
	.word 0x5b52458f
	.word 0xa2e6eb7d
	.word 0x3621ef75
.align 64
	.word 0x10f8c694
	.word 0x2e8f2edb
	.word 0x4c976290
	.word 0x449b2b5
.align 32
	.word 0x638a61c6
	.word 0x289a710c
.align 16
	.word 0xfb099744
	.word 0x8136d520
.global  dtte_8kb_data_end
dtte_8kb_data_end:
		.word 0x7c29a0f8
		.word 0x44b8157c
.end


!!-----------------------------------------------------
!!      64kb page size for I/D TTE
!!-----------------------------------------------------
#define ITTE_64KB_PG_BASE_DATA_ADDR     0x370000
#define ITTE_64KB_PG_BASE_DATA_ADDR_PA  0x100370000

SECTION .ITTE_64KB_PAGE	DATA_VA=ITTE_64KB_PG_BASE_DATA_ADDR
attr_data {
        Name = .ITTE_64KB_PAGE,
        VA=ITTE_64KB_PG_BASE_DATA_ADDR, 
	RA=ITTE_64KB_PG_BASE_DATA_ADDR,
	PA=ra2pa(ITTE_64KB_PG_BASE_DATA_ADDR, 0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, tte_size_ptr=0, TTE_Size=0x1, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.data

.global  dtte_64kb_data_0
dtte_64kb_data_0: 
		.word 0xfb886fb5
		.word 0x61d62c3a
		.word 0x78dd7dd1
		.word 0x8d166909
		.word 0x7a1e493a
		.word 0xa2c573b1
		.word 0x6275342c
		.word 0x4427a72c
		.word 0xbae6c7ed
		.word 0x3649408c
		.word 0x82b1873f
		.word 0x9d82c249
		.word 0x4b2f9a6a
		.word 0xcfd273a4
		.word 0xbdab500
		.word 0xe997dd47
.align 8192
.global  dtte_64kb_data_1
dtte_64kb_data_1: 
		.word 0x2efb35d5
		.word 0x8543df52
		.word 0x3037bbc3
		.word 0x273a4a63
		.word 0x9724ce22
		.word 0x84001469
		.word 0x2801d627
		.word 0x3bcb2341
		.word 0x9a950e90
		.word 0xdbd28a66
		.word 0x38b95133
		.word 0xebecce44
		.word 0x25eb5675
		.word 0x934696e6
		.word 0x376f20bb
		.word 0xf459051e
.align 8192
.global  dtte_64kb_data_2
dtte_64kb_data_2: 
		.word 0x40f77e41
		.word 0xbb31e858
		.word 0x7ae8d608
		.word 0x9f830aa
		.word 0x949c68bc
		.word 0xe15f77f2
		.word 0xe8badcb7
		.word 0xdaf22df8
		.word 0xf673e492
		.word 0x1fa326e8
		.word 0x3cf21e1
		.word 0x855dd0a9
		.word 0x9e10a211
		.word 0x946d7adb
		.word 0x518c897c
		.word 0xcb5b67d
.align 8192
.global  dtte_64kb_data_3
dtte_64kb_data_3: 
		.word 0x82434130
		.word 0x877a2d8f
		.word 0x5f35d600
		.word 0xaa8e402a
		.word 0x6f93bbd2
		.word 0xffab83e1
		.word 0x615ce64d
		.word 0x271c36f
		.word 0x7470b04c
		.word 0x79cf9ff7
		.word 0x2db16dcb
		.word 0x31854a67
		.word 0xc7aa5024
		.word 0x922c42b8
		.word 0xea408ad2
		.word 0xe9e97422
.align 8192
.global  dtte_64kb_data_4
dtte_64kb_data_4: 
		.word 0xdae6f71b
		.word 0x4f80b07f
		.word 0x9eacdf4c
		.word 0x9cf04a71
		.word 0xa91bae6e
		.word 0xccf4ad0a
		.word 0x223d0f99
		.word 0x8f7a2101
		.word 0xd0f32057
		.word 0xec66c2b8
		.word 0x1718cbb2
		.word 0x4e58d1aa
		.word 0xc0b1bfd9
		.word 0xa2fb48f3
		.word 0x8deac690
		.word 0xa6b9ea09
.align 8192
.global  dtte_64kb_data_5
dtte_64kb_data_5: 
		.word 0x3cce28bd
		.word 0x29f0ddea
		.word 0xffa03fce
		.word 0x2d8d9e4b
		.word 0x3860fbd7
		.word 0xacd64783
		.word 0xdb65038d
		.word 0xb9e9954b
		.word 0x2effbb8d
		.word 0xef88ef90
		.word 0x6f850497
		.word 0x8ec3e1df
		.word 0x96ca6c99
		.word 0x49226f40
		.word 0x52caf4c6
		.word 0x6953bd6f
.align 8192
.global  dtte_64kb_data_6
dtte_64kb_data_6: 
		.word 0x3fabff0d
		.word 0x586eddd7
		.word 0x2b857fa6
		.word 0x382ad7c6
		.word 0x7649c397
		.word 0x19ecd6a1
		.word 0x27d30b59
		.word 0xecf3502c
		.word 0xf61e7106
		.word 0xd1f36a24
		.word 0x3a6e23bb
		.word 0x4ebabb4
		.word 0x53017e0d
		.word 0x4ea96e94
		.word 0x2632f3c5
		.word 0xfbfb5cd1
.align 8192
	.word	0xaabbccdd
	.word	0xaabbccdd
	.word	0xaabbccdd
	.word	0xaabbccdd
.align 4096
	.word 0xbf23d345
	.word 0xd03ce38b
	.word 0x23387136
	.word 0xa8cfb02f
.align 2048
	.word 0x6b971978
	.word 0xd1805cf9
	.word 0xe8de1e6f
	.word 0x571a32c0
.align 1024
	.word 0x3705281c
	.word 0x92ffa958
	.word 0xc2d9869e
	.word 0x8506e514
.align 512
	.word 0xb491581c
	.word 0xbdfc2724
	.word 0xa5cd81f
	.word 0x3391cfed
.align 256
	.word 0x9435bede
	.word 0x76d47d8a
	.word 0x8a22411e
	.word 0x53c8ce12
.align 128
	.word 0x2a8a9581
	.word 0x7e62ac5f
	.word 0x82bdf280
	.word 0xae7f9f63
.align 64
	.word 0xd0065066
	.word 0x7b16a753
	.word 0xde52ed03
	.word 0xadc9992d
.align 32
	.word 0x63a92af2
	.word 0x8c42f065
.align 16
	.word 0xb5e4fca3
	.word 0x40ed87bf
.align 8
.global  dtte_64kb_data_end
dtte_64kb_data_end:
		.word 0xc2ef2b91
		.word 0xf773e599
.end

!!-----------------------------------------------------
!!      512kb page size for I/D TTE
!!-----------------------------------------------------
#define ITTE_512KB_PG_BASE_DATA_ADDR    0x380000
#define ITTE_512KB_PG_BASE_DATA_ADDR_PA 0x100380000

SECTION .ITTE_512KB_PAGE	DATA_VA=ITTE_512KB_PG_BASE_DATA_ADDR
attr_data {
        Name = .ITTE_512KB_PAGE,
        VA=ITTE_512KB_PG_BASE_DATA_ADDR, 
	RA=ITTE_512KB_PG_BASE_DATA_ADDR,
	PA=ra2pa(ITTE_512KB_PG_BASE_DATA_ADDR, 0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.data
.global  dtte_512kb_data_0
dtte_512kb_data_0: 
		.word 0x4944863f
		.word 0x11bd953d
		.word 0x1d0fe3fd
		.word 0x1801b5e9
		.word 0x8b370b7c
		.word 0xe68649b3
		.word 0xca4371bf
		.word 0xf7983178
		.word 0x204988e9
		.word 0x2364f86c
		.word 0xa53882f5
		.word 0xca6ee90d
		.word 0x45e81264
		.word 0x4a072e84
		.word 0xb55f6356
		.word 0x569f50be
		.word 0x4b2851bb
.align 8192
		.word 0x4cd9f6bc
.align 8192
		.word 0x706a5573
.align 8192
		.word 0x6aadd9eb
.align 8192
		.word 0xbb6acb95
.align 8192
		.word 0xd3c9068d
.align 8192
		.word 0xa8a3bc3f
.align 8192
		.word 0x7f36386e
.align 8192
.global  dtte_512kb_data_1
dtte_512kb_data_1: 
		.word 0xded10e93
		.word 0xca1b287f
		.word 0xd8bed8d1
		.word 0x71fa4710
		.word 0xf3c530b1
		.word 0xe7fa77ba
		.word 0x5cd02067
		.word 0xa8963f3e
		.word 0x51b13ef2
		.word 0x6c0c40dd
		.word 0x7666eae
		.word 0x7e1437fc
		.word 0x35cb833c
		.word 0xfb659c0e
		.word 0xa18e983f
		.word 0x83c42018
		.word 0x29c6c480
.align 8192
		.word 0xd671451
.align 8192
		.word 0x491f216d
.align 8192
		.word 0x225ca7a3
.align 8192
		.word 0xff83e51d
.align 8192
		.word 0x66daf01d
.align 8192
		.word 0x52421d3d
.align 8192
		.word 0x8fbccc9d
.align 8192
.global  dtte_512kb_data_2
dtte_512kb_data_2: 
		.word 0x26d48386
		.word 0xc956ef2c
		.word 0x9c0f78b5
		.word 0xceecfeef
		.word 0x71348121
		.word 0xa9b9192
		.word 0xfc6a3659
		.word 0xb67a0f9d
		.word 0x155a9372
		.word 0x80b83c11
		.word 0x19775df2
		.word 0x64335f3b
		.word 0x3fde4378
		.word 0xe45ccdab
		.word 0x4f2da491
		.word 0x67f8ffa0
		.word 0xa933ff57
.align 8192
		.word 0x20367a77
.align 8192
		.word 0xf9e910d3
.align 8192
		.word 0x90ddbcd9
.align 8192
		.word 0x5a262236
.align 8192
		.word 0xb3beffb8
.align 8192
		.word 0xbde1f65
.align 8192
		.word 0x23ac4160
.align 8192
.global  dtte_512kb_data_3
dtte_512kb_data_3: 
		.word 0xf8fc166a
		.word 0x66c2852b
		.word 0x56fc2bca
		.word 0x471dc98e
		.word 0x8eef5d3
		.word 0xaa51bf9f
		.word 0x9787215b
		.word 0x44041a4d
		.word 0x759d4c86
		.word 0xa11b28cb
		.word 0x79acb88f
		.word 0x6d8faf11
		.word 0x7b25e1ac
		.word 0xed7f605b
		.word 0x7dd9c47c
		.word 0xeaf65308
		.word 0x83abaaa9
.align 8192
		.word 0xec620a4b
.align 8192
		.word 0x78d8549d
.align 8192
		.word 0x6f4d998f
.align 8192
		.word 0x5a834c80
.align 8192
		.word 0x61f9be78
.align 8192
		.word 0x2e07aed5
.align 8192
		.word 0x21afe9e8
.align 8192
.global  dtte_512kb_data_4
dtte_512kb_data_4: 
		.word 0x2e6ccf75
		.word 0x16f6dd74
		.word 0x278b65b4
		.word 0x75fa122a
		.word 0x3d4268f3
		.word 0xd1825e99
		.word 0xfa5f0ef8
		.word 0x98da9578
		.word 0xc6af7fb0
		.word 0x2412eb60
		.word 0xd7105e55
		.word 0xe7cb2975
		.word 0x87114e0e
		.word 0xfd27dbf3
		.word 0xebb9a878
		.word 0xfa2016f6
		.word 0xa1d4c6c4
.align 8192
		.word 0xcbdee900
.align 8192
		.word 0x3cf31249
.align 8192
		.word 0x3ae071f9
.align 8192
		.word 0x91bb9fbd
.align 8192
		.word 0x9752a6cf
.align 8192
		.word 0x4a10f070
.align 8192
		.word 0x66d55cd6
.align 8192
.global  dtte_512kb_data_5
dtte_512kb_data_5: 
		.word 0x97aca73f
		.word 0xefd1d96
		.word 0xe16a1b1b
		.word 0x4e6dcab4
		.word 0xc451c750
		.word 0x723b130c
		.word 0xd3c939fd
		.word 0x92f7753e
		.word 0x50085b54
		.word 0x19c1d93b
		.word 0xd6d84c99
		.word 0x4184f995
		.word 0x95cebbfa
		.word 0x68a2b69a
		.word 0x7d85f2bf
		.word 0xe6e45087
		.word 0xeb242559
.align 8192
		.word 0x40943b5a
.align 8192
		.word 0x1f583957
.align 8192
		.word 0x2e881601
.align 8192
		.word 0x567e5b55
.align 8192
		.word 0xa7eb1800
.align 8192
		.word 0x3c98ef5c
.align 8192
		.word 0x357953c2
.align 8192
.global  dtte_512kb_data_6
dtte_512kb_data_6: 
		.word 0x124ab047
		.word 0xd4314933
		.word 0x1183c72b
		.word 0x498ec351
		.word 0x1a651dd
		.word 0xbe3acd6
		.word 0xce5ec7fe
		.word 0xdf81bb31
		.word 0x854003d
		.word 0xe9cb5459
		.word 0x41e9d3b2
		.word 0x9f483b52
		.word 0x47339370
		.word 0x2de9284c
		.word 0xa71a44d0
		.word 0xb09eccc9
		.word 0xe3e1f2fe
.align 8192
		.word 0xf83fb134
.align 8192
		.word 0xf2e3e8ca
.align 8192
		.word 0x192428c3
.align 8192
		.word 0x736e63d4
.align 8192
		.word 0xa23019a2
.align 8192
		.word 0x3320da84
.align 8192
		.word 0x5d13dab7
.align 8192
.global  dtte_512kb_data_7
dtte_512kb_data_7: 
		.word 0xb77c506e
		.word 0x58dcbd80
		.word 0xd0be0116
		.word 0x7acc51da
		.word 0xd8f6ef31
		.word 0x9f54daae
		.word 0x5d6a36d0
		.word 0x4b2015d8
		.word 0xdee6b18
		.word 0x4f7236cd
		.word 0xcc625c7d
		.word 0xc43912c0
		.word 0xe78c7293
		.word 0xf58ace59
		.word 0xded4dcec
		.word 0x3dd0303f
	.word 0xcb8850ab
.align 8192
	.word 0x3aa5e0fd
.align 8192
	.word 0x3afb64ab
.align 8192
	.word 0xc2eaa810
.align 8192
	.word 0x2860f469
.align 8192
	.word 0xcc04ef22
.align 8192
	.word 0x31b1d215
.align 8192
	.word 0x8a71cfb3
.align 4096
	.word 0x37258a78
	.word 0xf2c67cc8
.align 2048
	.word 0xfd3da18f
	.word 0xa411495c
.align 1024
	.word 0xeefb8d09
	.word 0x1471ad99
.align 512
	.word 0x25695a0e
	.word 0xbd12d02e
.align 256
	.word 0xa81b6df6
	.word 0x2a970e3b
.align 128
	.word 0x554bbddb
	.word 0x8ae13a8
.align 64
	.word 0xabeb3f2a
	.word 0x5a41ee5
.align 32
	.word 0xf64ac39a
	.word 0xf3b6565f
.align 16
	.word 0x1870fd3f
	.word 0xdacc7334
.align 8
.global  dtte_512kb_data_end
dtte_512kb_data_end:
		.word 0x3e669b88
		.word 0x73f6c3ed
.end

!!-----------------------------------------------------
!!      8kb page size for I/D TTE
!!-----------------------------------------------------
#define RDM_8KB_PG1_BASE_DATA_ADDR     0x400000
#define RDM_8KB_PG1_BASE_DATA_ADDR_PA  0x100400000
SECTION .RDM_8KB_PAGE1	DATA_VA=RDM_8KB_PG1_BASE_DATA_ADDR
attr_data {
        Name = .RDM_8KB_PAGE1
        VA=RDM_8KB_PG1_BASE_DATA_ADDR, 
	RA=RDM_8KB_PG1_BASE_DATA_ADDR,
	PA=ra2pa(RDM_8KB_PG1_BASE_DATA_ADDR, 0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.data
.global  dtte_8kb1_data_0
dtte_8kb1_data_0:
		.word 0x74cc6068
		.word 0x37c47b3f
		.word 0x7dd94503
		.word 0xc329b229
		.word 0xa5025790
		.word 0x5e3749e8
		.word 0x8ddb784f
		.word 0xeb864197
		.word 0x836291c3
		.word 0x2da1ec75
		.word 0x8827e896
		.word 0x2ba31122
		.word 0xd771b9cd
		.word 0xe9d4275e
		.word 0xe0e22230
		.word 0x4823f908
.align 1024
	.word 0x23c94820
	.word 0x2fffac68
.align 512
.global  dtte_8kb1_data_1
dtte_8kb1_data_1:
		.word 0x9b168925
		.word 0xfe940115
		.word 0x70080efa
		.word 0x793c1df2
		.word 0x5f5d3bef
		.word 0x52c0613
		.word 0xc7fce4c7
		.word 0x60f7738e
		.word 0x8481de83
		.word 0x1a59c280
		.word 0x47e710c3
		.word 0x1d2f93d3
		.word 0xa7ae9192
		.word 0x53e22e81
		.word 0xbd3e5de3
		.word 0xd6cb3770
.align 1024
	.word 0xd4b89a0c
	.word 0xbb56b17
.align 512
	.word 0xce2ef7f5
	.word 0xd7356984
.align 256
.global  dtte_8kb1_data_2
dtte_8kb1_data_2:
		.word 0xcc117ce5
		.word 0xd739ac8f
		.word 0x4e137705
		.word 0x5ec0392d
		.word 0x2c7931a
		.word 0xf835d83f
		.word 0x94f9bd03
		.word 0xd288705e
		.word 0x262d59f6
		.word 0xb3dbc96e
		.word 0xf1e589a2
		.word 0x41dd63f6
		.word 0x586f0391
		.word 0x2ffd7193
		.word 0x5d4de882
		.word 0xd7cd310d
.align 1024
	.word 0xe9d20b99
	.word 0x8f7747c2
.align 512
	.word 0x8980dd90
	.word 0x6a6fb90
.align 256
	.word 0xebd2d454
	.word 0x688dbb63
.align 128
.global  dtte_8kb1_data_3
dtte_8kb1_data_3:
		.word 0x136af3ad
		.word 0x4e4a020f
		.word 0xcc108fe4
		.word 0xb1a29e24
		.word 0x8df6918d
		.word 0xb4319ad5
		.word 0xdd37f9cd
		.word 0x6d82b930
		.word 0x371138e1
		.word 0xfa9b6e39
		.word 0xc821a4b4
		.word 0xb7db01a0
		.word 0x85a313b8
		.word 0x8c268233
		.word 0xc760e069
		.word 0x7682032
.align 1024
	.word 0x3da77422
	.word 0xf01eeb31
.align 512
	.word 0x7cc7c27
	.word 0x356a4038
.align 256
.global  dtte_8kb1_data_4
dtte_8kb1_data_4:
		.word 0x95b2a16
		.word 0x8a93362b
		.word 0xd15ae91a
		.word 0xf41259d2
		.word 0x965fd395
		.word 0xd78ddff4
		.word 0x393f8120
		.word 0x273d6b5f
		.word 0x22018b0e
		.word 0x3b9e6dd3
		.word 0x18cef5d3
		.word 0xf255630
		.word 0x1abe9804
		.word 0xc282fb52
		.word 0x288d2bc7
		.word 0x5af6527e
.align 1024
	.word 0xcd0705ed
	.word 0xa07c5155
.align 512
.global  dtte_8kb1_data_5
dtte_8kb1_data_5:
		.word 0x3c270610
		.word 0x34b32e9e
		.word 0xe024455d
		.word 0x40e3da6d
		.word 0x473ee606
		.word 0xc7c1cd72
		.word 0x4973b63
		.word 0xee3c086e
		.word 0xa41ae34b
		.word 0xfb1c9822
		.word 0x913d6333
		.word 0x5268ff3e
		.word 0xe8b0000d
		.word 0x5ebcd70c
		.word 0xbe73e605
		.word 0xea4898ef
.align 1024
	.word 0xcc75dd88
	.word 0x1c9d25f8
.align 512
	.word 0xb079cd3b
	.word 0x1bbe1710
.align 256
.global  dtte_8kb1_data_6
dtte_8kb1_data_6:
		.word 0x5e22b4ce
		.word 0x7f27790
		.word 0xf2c0b2c9
		.word 0x89b71540
		.word 0x342797ca
		.word 0x4c2d5c0e
		.word 0x66ed93d1
		.word 0xfbf49103
		.word 0xc9c13e81
		.word 0x583c7f36
		.word 0xe241a98c
		.word 0x41bc1ad8
		.word 0xccf1e49b
		.word 0x3ca49187
		.word 0xcd3d6c71
		.word 0xbc42848a
.align 1024
	.word 0x73fcfb22
	.word 0xb9110ad
.align 512
	.word 0x81ce258f
	.word 0x28e2a0c6
.align 256
	.word 0xbb45b288
	.word 0xd444a339
.align 128
	.word 0xee78b23e
	.word 0x1947e7ed
.align 64
	.word 0xaafda0ee
	.word 0x7686fb93
.align 32
	.word 0x26fa5df6
	.word 0xa1de162b
.align 16
	.word 0xf72108a3
	.word 0xe219762e
.align 8
.global  dtte_8kb1_data_end
dtte_8kb1_data_end:
		.word 0x1f02f67e
		.word 0xd25416c8

!!-----------------------------------------------------
!!      8kb page size for I/D TTE
!!-----------------------------------------------------
#define RDM_8KB_PG2_BASE_DATA_ADDR     0x402000
#define RDM_8KB_PG2_BASE_DATA_ADDR_PA  0x100402000
SECTION .RDM_8KB_PAGE2	DATA_VA=RDM_8KB_PG2_BASE_DATA_ADDR
attr_data {
        Name = .RDM_8KB_PAGE2
        VA=RDM_8KB_PG2_BASE_DATA_ADDR, 
	RA=RDM_8KB_PG2_BASE_DATA_ADDR,
	PA=ra2pa(RDM_8KB_PG2_BASE_DATA_ADDR,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.data
.global  dtte_8kb2_data_0
dtte_8kb2_data_0:
		.word 0xb81282ea
		.word 0xf11ae6fe
		.word 0x50397e48
		.word 0xca11d0be
		.word 0xe7001300
		.word 0x2dd64a27
		.word 0xa3ef211b
		.word 0xc065a88a
		.word 0x4357e55c
		.word 0xb3ff4bf6
		.word 0xa8fa4ef2
		.word 0x4f27cb46
		.word 0x5e333f38
		.word 0x661adc14
		.word 0x116e2124
		.word 0x33de96f7
		.word 0x92026250
		.word 0xc1013ff8
		.word 0x38806dc4
		.word 0xa050b424
		.word 0x802c68e9
		.word 0x444a589d
		.word 0x39332d4a
		.word 0xfd26b4a7
		.word 0x68025e14
		.word 0x364c0f75
		.word 0x7c1672
		.word 0xa9074bc6
		.word 0xea951633
		.word 0x385e1e9c
		.word 0xfbef9463
		.word 0x11b67385
		.word 0xf9f18bbc
		.word 0xdb95a850
		.word 0x2ea27b14
		.word 0x64711335
		.word 0x303fc43c
		.word 0x125e51a1
		.word 0xd3481deb
		.word 0xb443fb50
		.word 0x487c819f
		.word 0xcf7dd464
		.word 0x6ac8aca6
		.word 0xa1b64a88
		.word 0x1f4643ad
		.word 0x6a6a3c6d
		.word 0x73e5fa7e
		.word 0x640c901d
		.word 0x72ba5dd7
		.word 0xfaaa43fc
		.word 0xb9431389
		.word 0x42eb3f6e
		.word 0x84e72534
		.word 0xfb7a8377
		.word 0x7985445f
		.word 0x9c7448d3
		.word 0x9247ac5
		.word 0x55696859
		.word 0xdf8b7800
		.word 0x1964eba9
		.word 0x21f43600
		.word 0xc047276a
		.word 0xa9230ff5
		.word 0x9b7615ad
.align 8192
.end

