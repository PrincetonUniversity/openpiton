// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: lsu_align_rand.s
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

#define H_HT0_fast_data_access_MMU_miss  T0_fast_dmmu_miss

#include "boot.s"

!!-------------------------------------------------------------------------------
!!
!!      This file has the micro-code to test out the alignment 
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
	set     0x3009b3e4,     %l0
	set     0x957f43e9,     %l1
	set     0xeef55c5d,     %l2
	set     0xf29039ca,     %l3
	set     0x926f8329,     %l4
	set     0x3d6172cd,     %l5
	set     0xcb84ab9b,     %l6
	set     0xe92be485,     %l7
	set     0xc04c977d,     %i0
	set     0x6492e2d0,     %i1
	set     0xbe33ddd8,     %i2
	set     0xd0fb061f,     %i3
	set     0xaa1a6a9f,     %i4
	set     0x17492ca0,     %i5
	set     0x9abec99c,     %i6
	set     0x48c19ef4,     %i7
	set     0x4478dc0f,     %o0
	set     0xc4d9756a,     %o1
	set     0x4392b7d9,     %o2
	set     0xde4928d2,     %o3
	set     0xf8ffc02c,     %o4
	set     0xcdee525b,     %o5
	set     0xd6d8db1b,     %o6
	set     0x9ede1023,     %o7

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
	setx	dtte_512kb_data_0,	%l0,	%l4
	setx	dtte_512kb_data_end,	%l0,	%l3
	setx	dtte_4mb_data_0,	%l0,	%l2
	setx	dtte_4mb_data_end,	%l0,	%l1
	setx	dtte_8kb1_data_0,	%l0,	%g1
	setx	dtte_8kb1_data_end,	%l0,	%g2
	setx	dtte_8kb2_data_0,	%l0,	%g3
	mov	0x1,	%o0
	ldub     [%l7+5],  %i6
	mov	0x2,	%o0
	ldub     [%l6+1],  %o3
	ldsb     [%l5+2],  %i5
	mov	0x3,	%o0
	ldub     [%l4+3],  %o1
	ldub     [%l3+5],  %o7
	mov	0x4,	%o0
	ldub     [%l2+5],  %i4
	ldub     [%l1+2],  %i2
	mov	0x5,	%o0
	ldub     [%g1+1],  %i4
	ldsb     [%g2+0],  %i5
	mov	0x6,	%o0
	ldsb     [%g3+0],  %i5

	/* stores */
	stb	%o6,	[%l7]
	stw	%i5,	[%l6]
	st	%i5,	[%l5]
	stb	%i1,	[%l4]
	stx	%i1,	[%l3]
	stb	%o1,	[%l2]
	stx	%i5,	[%l1]
	stw	%o2,	[%g1]

	/* load mixed with store */
	ldub     [%l7+3],  %i3
	stb	%o1,	[%l7]
	ldsb     [%l6+3],  %i5
       stb      %i0,        [%l5]
       ldub     [%l4+2],  %o2
       stw      %i3,        [%l3]
       ldsb     [%l2+4],  %i7
       stw      %i3,        [%l1]
       ldsb     [%g1+6],  %o1

/*
 ************************
 * ld raw after one st
 ************************
 */ 

raw_tc0:
raw_tc0_0:    
	setx	dtte_8kb1_data_4,	%l0,	%l1		
	st	%o3,	[%l1+0]
	ldx	[%l1+0],	%o1
	sth	%o3,	[%l1+20]
	ldsw	[%l1+16],	%o2
	stb	%o4,	[%l1+36]
	ldsw	[%l1+32],	%o1
raw_tc0_1:    
	setx	dtte_8kb1_data_1,	%l0,	%l1		
	st	%o6,	[%l1+0]
	ldx	[%l1+0],	%o1
	sth	%o0,	[%l1+20]
	ldsw	[%l1+16],	%o2
	stb	%o5,	[%l1+38]
	lduw	[%l1+32],	%o1
raw_tc0_2:    
	setx	dtte_8kb_data_0,	%l0,	%l1		
	st	%o5,	[%l1+0]
	ldx	[%l1+0],	%o1
	sth	%o3,	[%l1+20]
	lduw	[%l1+16],	%o2
	stb	%o7,	[%l1+36]
	ldx	[%l1+32],	%o1
raw_tc0_3:    
	setx	dtte_8kb_data_2,	%l0,	%l1		
	st	%o1,	[%l1+0]
	ldx	[%l1+0],	%o1
	sth	%o5,	[%l1+18]
	ldx	[%l1+16],	%o2
	stb	%o5,	[%l1+35]
	lduw	[%l1+32],	%o1
raw_tc0_4:    
	setx	dtte_8kb_data_4,	%l0,	%l1		
	st	%o4,	[%l1+0]
	ldx	[%l1+0],	%o1
	sth	%o7,	[%l1+20]
	ldx	[%l1+16],	%o2
	stb	%o4,	[%l1+38]
	ldsw	[%l1+32],	%o1
raw_tc0_5:    
	setx	dtte_4mb_data_1,	%l0,	%l1		
	st	%o7,	[%l1+0]
	ldx	[%l1+0],	%o1
	sth	%o1,	[%l1+18]
	ldx	[%l1+16],	%o2
	stb	%o4,	[%l1+33]
	ldx	[%l1+32],	%o1
raw_tc0_6:    
	setx	dtte_4mb_data_2,	%l0,	%l1		
	st	%o3,	[%l1+0]
	ldx	[%l1+0],	%o1
	sth	%o1,	[%l1+16]
	lduw	[%l1+16],	%o2
	stb	%o1,	[%l1+34]
	ld	[%l1+32],	%o1
raw_tc0_7:    
	setx	dtte_8kb1_data_6,	%l0,	%l1		
	st	%o7,	[%l1+0]
	ldx	[%l1+0],	%o1
	sth	%o7,	[%l1+20]
	ldsw	[%l1+16],	%o2
	stb	%o2,	[%l1+37]
	ldsh	[%l1+32],	%o1
/*
 ************************
 * ld raw against two sts
 ************************
 */ 
raw_tc1:
raw_tc1_0:    
	setx	dtte_512kb_data_2,	%l0,	%l1		
	add	%l1,	8, %l1
	st	%o7,	[%l1]
	st	%o3,	[%l1+0x4]
	ldx	[%l1],	%o1
	sth	%o2,	[%l1+0x10]
	sth	%o3,	[%l1+0x12]
	ldsw	[%l1+0x10],	%o2
	stb	%o6,	[%l1+0x20]
	stb	%o2,	[%l1+0x21]
	lduw	[%l1+0x20],	%o1
raw_tc1_1:    
	setx	dtte_4mb_data_0,	%l0,	%l1		
	add	%l1,	8, %l1
	st	%o2,	[%l1]
	st	%o2,	[%l1+0x4]
	ldx	[%l1],	%o1
	sth	%o3,	[%l1+0x10]
	sth	%o6,	[%l1+0x12]
	ldsw	[%l1+0x10],	%o2
	stb	%o5,	[%l1+0x20]
	stb	%o3,	[%l1+0x21]
	ld	[%l1+0x20],	%o1
raw_tc1_2:    
	setx	dtte_8kb_data_2,	%l0,	%l1		
	add	%l1,	0, %l1
	st	%o4,	[%l1]
	st	%o7,	[%l1+0x4]
	ldx	[%l1],	%o1
	sth	%o0,	[%l1+0x10]
	sth	%o4,	[%l1+0x12]
	lduw	[%l1+0x10],	%o2
	stb	%o2,	[%l1+0x20]
	stb	%o4,	[%l1+0x21]
	lduh	[%l1+0x20],	%o1
raw_tc1_3:    
	setx	dtte_4mb_data_2,	%l0,	%l1		
	add	%l1,	0, %l1
	st	%o4,	[%l1]
	st	%o1,	[%l1+0x4]
	ldx	[%l1],	%o1
	sth	%o1,	[%l1+0x10]
	sth	%o6,	[%l1+0x12]
	ldx	[%l1+0x10],	%o2
	stb	%o7,	[%l1+0x20]
	stb	%o0,	[%l1+0x21]
	ldsh	[%l1+0x20],	%o1
raw_tc1_4:    
	setx	dtte_8kb_data_3,	%l0,	%l1		
	add	%l1,	8, %l1
	st	%o4,	[%l1]
	st	%o0,	[%l1+0x4]
	ldx	[%l1],	%o1
	sth	%o3,	[%l1+0x10]
	sth	%o2,	[%l1+0x12]
	lduw	[%l1+0x10],	%o2
	stb	%o3,	[%l1+0x20]
	stb	%o0,	[%l1+0x21]
	lduw	[%l1+0x20],	%o1
raw_tc1_5:    
	setx	dtte_64kb_data_end,	%l0,	%l1		
	add	%l1,	8, %l1
	st	%o1,	[%l1]
	st	%o0,	[%l1+0x4]
	ldx	[%l1],	%o1
	sth	%o4,	[%l1+0x10]
	sth	%o2,	[%l1+0x12]
	ldsw	[%l1+0x10],	%o2
	stb	%o7,	[%l1+0x20]
	stb	%o4,	[%l1+0x21]
	ldx	[%l1+0x20],	%o1
raw_tc1_6:    
	setx	dtte_64kb_data_3,	%l0,	%l1		
	add	%l1,	24, %l1
	st	%o0,	[%l1]
	st	%o3,	[%l1+0x4]
	ldx	[%l1],	%o1
	sth	%o0,	[%l1+0x10]
	sth	%o6,	[%l1+0x12]
	ldsw	[%l1+0x10],	%o2
	stb	%o3,	[%l1+0x20]
	stb	%o4,	[%l1+0x21]
	ldsh	[%l1+0x20],	%o1
raw_tc1_7:    
	setx	dtte_8kb_data_5,	%l0,	%l1		
	add	%l1,	24, %l1
	st	%o5,	[%l1]
	st	%o4,	[%l1+0x4]
	ldx	[%l1],	%o1
	sth	%o0,	[%l1+0x10]
	sth	%o5,	[%l1+0x12]
	ldsw	[%l1+0x10],	%o2
	stb	%o2,	[%l1+0x20]
	stb	%o6,	[%l1+0x21]
	lduw	[%l1+0x20],	%o1

/*
 ********************************
 * ld raw against more stores
 ********************************
 */ 
raw_tc2:
raw_tc2_0:    
	setx	dtte_8kb1_data_6,	%l0,	%l1		
	add	%l1,	56, %l1
	st	%o6,	[%l1]
	stb	%o2,	[%l1+6]
	sth	%o4,	[%l1+4]
	ldsh	[%l1],	%o1

	setx	dtte_4mb_data_4,	%l0,	%l1		
	add	%l1,	24, %l1
	stx	%o6,	[%l1]
	st	%o6,	[%l1+0]
	sth	%o5,	[%l1+0]
	stb	%o5,	[%l1+5];
	sth	%o7,	[%l1+4]
	stb	%o2,	[%l1+6];
	sth	%o5,	[%l1+2]
	lduw	[%l1],	%o1
raw_tc2_1:    
	setx	dtte_64kb_data_5,	%l0,	%l1		
	add	%l1,	16, %l1
	st	%o2,	[%l1]
	stb	%o6,	[%l1+6]
	sth	%o4,	[%l1+0]
	ldx	[%l1],	%o1

	setx	dtte_8kb1_data_2,	%l0,	%l1		
	add	%l1,	16, %l1
	stx	%o4,	[%l1]
	st	%o6,	[%l1+0]
	sth	%o4,	[%l1+4]
	stb	%o1,	[%l1+5];
	sth	%o1,	[%l1+0]
	stb	%o2,	[%l1+0];
	sth	%o0,	[%l1+4]
	ldx	[%l1],	%o1
raw_tc2_2:    
	setx	dtte_4mb_data_4,	%l0,	%l1		
	add	%l1,	24, %l1
	st	%o5,	[%l1]
	stb	%o4,	[%l1+5]
	sth	%o6,	[%l1+4]
	ldx	[%l1],	%o1

	setx	dtte_64kb_data_4,	%l0,	%l1		
	add	%l1,	40, %l1
	stx	%o7,	[%l1]
	st	%o6,	[%l1+0]
	sth	%o3,	[%l1+0]
	stb	%o1,	[%l1+3];
	sth	%o6,	[%l1+0]
	stb	%o5,	[%l1+0];
	sth	%o3,	[%l1+0]
	ldsw	[%l1],	%o1
raw_tc2_3:    
	setx	dtte_512kb_data_6,	%l0,	%l1		
	add	%l1,	8, %l1
	st	%o6,	[%l1]
	stb	%o5,	[%l1+0]
	sth	%o1,	[%l1+2]
	ldsh	[%l1],	%o1

	setx	dtte_8kb1_data_3,	%l0,	%l1		
	add	%l1,	56, %l1
	stx	%o6,	[%l1]
	st	%o0,	[%l1+0]
	sth	%o7,	[%l1+2]
	stb	%o0,	[%l1+2];
	sth	%o2,	[%l1+2]
	stb	%o3,	[%l1+5];
	sth	%o7,	[%l1+2]
	lduw	[%l1],	%o1
raw_tc2_4:    
	setx	dtte_4mb_data_5,	%l0,	%l1		
	add	%l1,	40, %l1
	st	%o3,	[%l1]
	stb	%o7,	[%l1+1]
	sth	%o6,	[%l1+4]
	ldx	[%l1],	%o1

	setx	dtte_4mb_data_1,	%l0,	%l1		
	add	%l1,	16, %l1
	stx	%o0,	[%l1]
	st	%o4,	[%l1+0]
	sth	%o6,	[%l1+2]
	stb	%o3,	[%l1+1];
	sth	%o0,	[%l1+2]
	stb	%o0,	[%l1+2];
	sth	%o3,	[%l1+2]
	ldx	[%l1],	%o1
raw_tc2_5:    
	setx	dtte_8kb1_data_0,	%l0,	%l1		
	add	%l1,	56, %l1
	st	%o7,	[%l1]
	stb	%o0,	[%l1+1]
	sth	%o1,	[%l1+2]
	lduh	[%l1],	%o1

	setx	dtte_64kb_data_2,	%l0,	%l1		
	add	%l1,	48, %l1
	stx	%o4,	[%l1]
	st	%o6,	[%l1+0]
	sth	%o1,	[%l1+0]
	stb	%o6,	[%l1+6];
	sth	%o3,	[%l1+0]
	stb	%o2,	[%l1+2];
	sth	%o3,	[%l1+2]
	ldx	[%l1],	%o1
raw_tc2_6:    
	setx	dtte_8kb_data_2,	%l0,	%l1		
	add	%l1,	0, %l1
	st	%o2,	[%l1]
	stb	%o4,	[%l1+5]
	sth	%o6,	[%l1+4]
	ldx	[%l1],	%o1

	setx	dtte_4mb_data_4,	%l0,	%l1		
	add	%l1,	32, %l1
	stx	%o2,	[%l1]
	st	%o6,	[%l1+0]
	sth	%o6,	[%l1+2]
	stb	%o7,	[%l1+2];
	sth	%o6,	[%l1+2]
	stb	%o1,	[%l1+2];
	sth	%o6,	[%l1+0]
	ldx	[%l1],	%o1
raw_tc2_7:    
	setx	dtte_64kb_data_0,	%l0,	%l1		
	add	%l1,	16, %l1
	st	%o1,	[%l1]
	stb	%o7,	[%l1+3]
	sth	%o3,	[%l1+4]
	ldsw	[%l1],	%o1

	setx	dtte_512kb_data_0,	%l0,	%l1		
	add	%l1,	0, %l1
	stx	%o0,	[%l1]
	st	%o0,	[%l1+0]
	sth	%o4,	[%l1+4]
	stb	%o2,	[%l1+6];
	sth	%o3,	[%l1+4]
	stb	%o1,	[%l1+4];
	sth	%o3,	[%l1+4]
	ldsw	[%l1],	%o1


	/*
	 ************************************ 
	 * Mix ASI ld/st with normal ld/st
	 ************************************ 
	 */ 
	ta	T_CHANGE_PRIV
	nop	

	
/*
 ************************************
 * ASI ld raw against more stores
 ************************************
 */ 
raw_tc3:
raw_tc3_0:    
	setx	dtte_4mb_data_2,	%l0,	%l1		
	add	%l1,	8, %l1
	st	%o5,	[%l1]
	stb	%o2,	[%l1+5]
	sth	%o1,	[%l1+0]
	ldxa [%l1] 0x18, %o1
	ldsw	[%l1],	%o1	/* load will bypass */

	setx	dtte_64kb_data_1,	%l0,	%l1		
	add	%l1,	32, %l1
	stx	%o7,	[%l1]
	st	%o5,	[%l1+0]
	sth	%o7,	[%l1+2]
	stb	%o4,	[%l1+5];
	sth	%o3,	[%l1+2]
	stb	%o4,	[%l1+4];
	sth	%o0,	[%l1+0]
	ldswa	[%l1] 0x88,	%o1
	ldx	[%l1],	%o1	/* load will bypass */
raw_tc3_1:    
	setx	dtte_8kb_data_1,	%l0,	%l1		
	add	%l1,	32, %l1
	st	%o6,	[%l1]
	stb	%o0,	[%l1+1]
	sth	%o4,	[%l1+0]
	ldxa [%l1] 0x88, %o1
	ldx	[%l1],	%o1	/* load will bypass */

	setx	dtte_64kb_data_5,	%l0,	%l1		
	add	%l1,	0, %l1
	stx	%o6,	[%l1]
	st	%o4,	[%l1+0]
	sth	%o3,	[%l1+4]
	stb	%o3,	[%l1+1];
	sth	%o5,	[%l1+4]
	stb	%o4,	[%l1+4];
	sth	%o0,	[%l1+2]
	ldxa	[%l1] 0x10,	%o1
	ldx	[%l1],	%o1	/* load will bypass */
raw_tc3_2:    
	setx	dtte_8kb1_data_0,	%l0,	%l1		
	add	%l1,	56, %l1
	st	%o1,	[%l1]
	stb	%o2,	[%l1+0]
	sth	%o4,	[%l1+2]
	ldxa [%l1] 0x88, %o1
	ldx	[%l1],	%o1	/* load will bypass */

	setx	dtte_512kb_data_4,	%l0,	%l1		
	add	%l1,	0, %l1
	stx	%o7,	[%l1]
	st	%o6,	[%l1+0]
	sth	%o6,	[%l1+0]
	stb	%o4,	[%l1+3];
	sth	%o6,	[%l1+4]
	stb	%o5,	[%l1+3];
	sth	%o0,	[%l1+0]
	ldxa	[%l1] 0x80,	%o1
	ldsw	[%l1],	%o1	/* load will bypass */
raw_tc3_3:    
	setx	dtte_8kb_data_6,	%l0,	%l1		
	add	%l1,	24, %l1
	st	%o6,	[%l1]
	stb	%o1,	[%l1+4]
	sth	%o2,	[%l1+0]
	ldxa [%l1] 0x88, %o1
	lduw	[%l1],	%o1	/* load will bypass */

	setx	dtte_64kb_data_4,	%l0,	%l1		
	add	%l1,	32, %l1
	stx	%o3,	[%l1]
	st	%o6,	[%l1+0]
	sth	%o2,	[%l1+2]
	stb	%o5,	[%l1+0];
	sth	%o2,	[%l1+2]
	stb	%o7,	[%l1+6];
	sth	%o6,	[%l1+0]
	ldxa	[%l1] 0x80,	%o1
	lduw	[%l1],	%o1	/* load will bypass */
raw_tc3_4:    
	setx	dtte_8kb_data_3,	%l0,	%l1		
	add	%l1,	40, %l1
	st	%o6,	[%l1]
	stb	%o3,	[%l1+5]
	sth	%o5,	[%l1+0]
	lduwa [%l1] 0x80, %o1
	ldx	[%l1],	%o1	/* load will bypass */

	setx	dtte_512kb_data_5,	%l0,	%l1		
	add	%l1,	32, %l1
	stx	%o2,	[%l1]
	st	%o2,	[%l1+0]
	sth	%o3,	[%l1+4]
	stb	%o6,	[%l1+2];
	sth	%o5,	[%l1+0]
	stb	%o0,	[%l1+5];
	sth	%o6,	[%l1+0]
	lduwa	[%l1] 0x10,	%o1
	ldsw	[%l1],	%o1	/* load will bypass */
raw_tc3_5:    
	setx	dtte_8kb1_data_2,	%l0,	%l1		
	add	%l1,	16, %l1
	st	%o6,	[%l1]
	stb	%o1,	[%l1+3]
	sth	%o4,	[%l1+2]
	ldxa [%l1] 0x10, %o1
	ldx	[%l1],	%o1	/* load will bypass */

	setx	dtte_8kb1_data_5,	%l0,	%l1		
	add	%l1,	16, %l1
	stx	%o3,	[%l1]
	st	%o4,	[%l1+0]
	sth	%o2,	[%l1+2]
	stb	%o5,	[%l1+1];
	sth	%o0,	[%l1+4]
	stb	%o0,	[%l1+5];
	sth	%o4,	[%l1+0]
	ldxa	[%l1] 0x10,	%o1
	ldx	[%l1],	%o1	/* load will bypass */
raw_tc3_6:    
	setx	dtte_64kb_data_2,	%l0,	%l1		
	add	%l1,	48, %l1
	st	%o6,	[%l1]
	stb	%o3,	[%l1+5]
	sth	%o7,	[%l1+4]
	lduwa [%l1] 0x88, %o1
	lduw	[%l1],	%o1	/* load will bypass */

	setx	dtte_8kb_data_6,	%l0,	%l1		
	add	%l1,	56, %l1
	stx	%o7,	[%l1]
	st	%o2,	[%l1+0]
	sth	%o6,	[%l1+2]
	stb	%o5,	[%l1+4];
	sth	%o7,	[%l1+4]
	stb	%o2,	[%l1+4];
	sth	%o2,	[%l1+4]
	lduwa	[%l1] 0x18,	%o1
	lduw	[%l1],	%o1	/* load will bypass */
raw_tc3_7:    
	setx	dtte_8kb1_data_4,	%l0,	%l1		
	add	%l1,	40, %l1
	st	%o4,	[%l1]
	stb	%o5,	[%l1+3]
	sth	%o6,	[%l1+0]
	ldswa [%l1] 0x10, %o1
	ldsw	[%l1],	%o1	/* load will bypass */

	setx	dtte_512kb_data_6,	%l0,	%l1		
	add	%l1,	56, %l1
	stx	%o6,	[%l1]
	st	%o5,	[%l1+0]
	sth	%o4,	[%l1+2]
	stb	%o7,	[%l1+5];
	sth	%o1,	[%l1+4]
	stb	%o0,	[%l1+5];
	sth	%o4,	[%l1+4]
	ldxa	[%l1] 0x88,	%o1
	ldsw	[%l1],	%o1	/* load will bypass */


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
	 *************************************************** 
	 *	test the raw condition
	 *************************************************** 
	 */

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
!!      8kb page size for custom trap handler
!!-----------------------------------------------------
#define DMMU_MISS_TRAPPG_VA     0x1600000

SECTION .DMMU_MISS_TRAPPG	TEXT_VA = DMMU_MISS_TRAPPG_VA
attr_text {
        Name = .DMMU_MISS_TRAPPG,
	hypervisor
        }

.text
.global  T0_fast_dmmu_miss

T0_fast_dmmu_miss:
        brz     %o0,    dmmu_standard_trap
        nop

	 sub	%o0,	0x1,	%o1
	 brz	%o1,	wrtte1
	 nop

	 sub	%o0,	0x2,	%o1
	 brz	%o1,	wrtte2
	 nop

	 sub	%o0,	0x3,	%o1
	 brz	%o1,	wrtte3
	 nop

	 sub	%o0,	0x4,	%o1
	 brz	%o1,	wrtte4
	 nop

	 sub	%o0,	0x5,	%o1
	 brz	%o1,	wrtte5
	 nop

	 sub	%o0,	0x6,	%o1
	 brz	%o1,	wrtte6
	 nop

	 ta	T_BAD_TRAP
	 nop

wrtte1:	
#define TAG_ACCESS1	0x000000000036e044
#define DATA_IN1	0x800000010036e003
	 setx	TAG_ACCESS1,  %l0, %g4
	 setx	DATA_IN1, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c
	 ba	dmiss_rtn
	 nop

wrtte2:	
#define TAG_ACCESS2	0x0000000000370044
#define DATA_IN2	0xa000000100370003
	 setx	TAG_ACCESS2,  %l0, %g4
	 setx	DATA_IN2, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c
	 ba	dmiss_rtn
	 nop

wrtte3:	
#define TAG_ACCESS3	0x0000000000380044
#define DATA_IN3	0xa000000100380003
	setx	TAG_ACCESS3,  %l0, %g4
	setx	DATA_IN3, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c
	mov	0x7,	%i1
	mov	0x0,	%i2	
add_pg64k_loop:
	set	0x10000,	%l0
	add	%l0,	%g4,	%g4		
	add	%l0,	%g5,	%g5		
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c

	add	%i2,	0x1,	%i2
	sub	%i2,	%i1,	%i7
	brlz	%i7,	add_pg64k_loop
	nop

	ba	dmiss_rtn
	nop

wrtte4:	
#define TAG_ACCESS4	0x0000000000400044
#define DATA_IN4	0xe000000100400003
	 setx	TAG_ACCESS4,  %l0, %g4
	 setx	DATA_IN4, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c
	 ba	dmiss_rtn
	 nop

wrtte5:	
#define TAG_ACCESS5	0x0000000000800044
#define DATA_IN5	0x8000000100800003
	 setx	TAG_ACCESS5,  %l0, %g4
	 setx	DATA_IN5, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c
	 ba	dmiss_rtn
	 nop

wrtte6:	
#define TAG_ACCESS6	0x0000000000802044
#define DATA_IN6	0x8000000100802003
	 setx	TAG_ACCESS6,  %l0, %g4
	 setx	DATA_IN6, %l0, %g5
        mov  0x30, %g3
        stxa  %g4, [ %g3 ] 0x58
        stxa  %g5, [ %g0 ] 0x5c

dmiss_rtn:
	mov	0x0,	%o0
	retry
	nop 	

dmmu_standard_trap:
#include "dmmu_miss_handler.s"
#include "dmmu_miss_handler_ext.s"


!!-----------------------------------------------------
!!      8kb page size for I/D TTE
!!-----------------------------------------------------
#define RDM_8KB_PG_BASE_DATA_ADDR     0x36e000
#define RDM_8KB_PG_BASE_DATA_ADDR_PA  0x10036e000
SECTION .RDM_8KB_PAGE	DATA_VA = RDM_8KB_PG_BASE_DATA_ADDR
attr_data {
        Name = .RDM_8KB_PAGE
        VA=RDM_8KB_PG_BASE_DATA_ADDR, 
	RA=RDM_8KB_PG_BASE_DATA_ADDR_PA,
	PA=RDM_8KB_PG_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.data

.global  dtte_8kb_data_0
dtte_8kb_data_0:
		.word 0x40e5b12c
		.word 0x6f5bdec5
		.word 0x3457dbb6
		.word 0x584df8c2
		.word 0x27212e27
		.word 0xdff76ba4
		.word 0x784a55db
		.word 0xe759a8f8
		.word 0xce355cc3
		.word 0x4fd48f77
		.word 0xa45ec5a5
		.word 0x14adcedb
		.word 0x60685591
		.word 0x468b766d
		.word 0x71807707
		.word 0xd835c67d
.align 1024
	.word 0xc1253d67
	.word 0x6a110a65
	.word 0x291f53a0
	.word 0xd247cfc5
.align 512
.global  dtte_8kb_data_1
dtte_8kb_data_1:
		.word 0x85fc9f3f
		.word 0x6ad0110d
		.word 0xcf57a941
		.word 0x749f2ca6
		.word 0x1036005e
		.word 0x7aed972b
		.word 0x2cf154ab
		.word 0xe91d6e93
		.word 0x77a412b8
		.word 0x1c183d3a
		.word 0x9fe0549c
		.word 0x5c4ea731
		.word 0x69f2992
		.word 0xad273938
		.word 0xcb0d090c
		.word 0x933704e
.align 1024
	.word 0xaf1fd469
	.word 0xafc721be
	.word 0xdcaa2b3
	.word 0xc48eff11
.align 512
	.word 0x4c2dc412
	.word 0xbbbfd650
	.word 0xecc686cf
	.word 0xaf26b673
.align 256
.global  dtte_8kb_data_2
dtte_8kb_data_2:
		.word 0x3f755e22
		.word 0x924018f6
		.word 0x21a3ab23
		.word 0xbb43eced
		.word 0x3b18a28f
		.word 0xa550ad0b
		.word 0xf8212e42
		.word 0x599fd972
		.word 0xe1f64797
		.word 0xa75a0f54
		.word 0x97dbb00d
		.word 0xa7ecdba0
		.word 0x96ec2fe0
		.word 0xa1c51b54
		.word 0x3cad2e79
		.word 0xeaf9331
.align 1024
	.word 0xf4489ee0
	.word 0x897031dd
	.word 0x95a76a95
	.word 0x404d7ab7
.align 512
	.word 0x39efcf7e
	.word 0x137b4ea
	.word 0x37e119cb
	.word 0xd75df988
.align 256
	.word 0xb0f1d0f9
	.word 0xbf69ecac
	.word 0x770e6765
	.word 0x71a620f6
.align 128
.global  dtte_8kb_data_3
dtte_8kb_data_3:
		.word 0xd8a6ce09
		.word 0xf7eba9e2
		.word 0xfe618a53
		.word 0x96f688c3
		.word 0xda262243
		.word 0xf354396d
		.word 0x28b8732a
		.word 0x32a5fed3
		.word 0x8d4ee1c1
		.word 0x209c7d23
		.word 0x93e8d670
		.word 0xadafe23
		.word 0x84deb701
		.word 0xc663de3
		.word 0x804c1716
		.word 0xcd8120f9
.align 1024
	.word 0x777e3b0d
	.word 0xab9e0ae8
	.word 0xbfc0d545
	.word 0xcee7025d
.align 512
	.word 0xb0782bdc
	.word 0xd08b3a62
	.word 0xce70255d
	.word 0xf4d442c7
.align 256
.global  dtte_8kb_data_4
dtte_8kb_data_4:
		.word 0x5e4324f8
		.word 0xc686df42
		.word 0xf800b33a
		.word 0xf9aea419
		.word 0xdd5bbe60
		.word 0x5acbc855
		.word 0x75c255b8
		.word 0xe14070cf
		.word 0xed6735af
		.word 0xc55edc94
		.word 0x5200d679
		.word 0x4321a274
		.word 0xe375057c
		.word 0x453068b9
		.word 0xaa54f1e5
		.word 0xc8e87b57
.align 1024
	.word 0xd8b80f04
	.word 0xfb8c3215
	.word 0x2b6d371
	.word 0xaf5d877f
.align 512
.global  dtte_8kb_data_5
dtte_8kb_data_5:
		.word 0xdf763a06
		.word 0xddf762a0
		.word 0x9d859224
		.word 0x3d3a38db
		.word 0xea77aeee
		.word 0xfff8a251
		.word 0xddeb7157
		.word 0x66b892bd
		.word 0x2c2d0f35
		.word 0x2137f1b0
		.word 0x423ee9bc
		.word 0x5ead9889
		.word 0xc4565007
		.word 0x4d2919a9
		.word 0x6f7cbea0
		.word 0xbb4f73a9
.align 1024
	.word 0x36a1b25
	.word 0x794cc4a2
	.word 0x85f7a374
	.word 0x616384c3
.align 512
	.word 0xe497da0c
	.word 0xcb4194ce
	.word 0xbe1e3589
	.word 0x5b9fd42e
.align 256
.global  dtte_8kb_data_6
dtte_8kb_data_6:
		.word 0x903ccf57
		.word 0x799fcbc3
		.word 0x53004e1a
		.word 0x90ce95a1
		.word 0x5346e261
		.word 0xd72f574a
		.word 0x8348f08f
		.word 0x58f9b32d
		.word 0xf286012e
		.word 0xe0b15775
		.word 0xf0f25900
		.word 0xdbcf936c
		.word 0x35973c8a
		.word 0xc77371f7
		.word 0xa84deef7
		.word 0xf7d18efa
.align 1024
	.word 0xf2230272
	.word 0x2f7486af
	.word 0x60522079
	.word 0xf5efc924
.align 512
	.word 0x67da1ab3
	.word 0xc4479985
	.word 0x24bc6947
	.word 0x373d5fdf
.align 256
	.word 0xe63349d1
	.word 0xd5b0579
	.word 0x1eb60a61
	.word 0x45a326fc
.align 128
	.word 0x28a5be2a
	.word 0x6174cf9
	.word 0xee8e35cb
	.word 0x9c266298
.align 64
	.word 0xa33aab59
	.word 0x81aa1b72
	.word 0x5904b292
	.word 0x2abc34d8
.align 32
	.word 0xd212b7df
	.word 0x32874c28
.align 16
	.word 0x88cc3d11
	.word 0x13f9b2d6
.global  dtte_8kb_data_end
dtte_8kb_data_end:
		.word 0x19222100
		.word 0xc3f30a4a
.end


!!-----------------------------------------------------
!!      64kb page size for I/D TTE
!!-----------------------------------------------------
#define ITTE_64KB_PG_BASE_DATA_ADDR     0x370000
#define ITTE_64KB_PG_BASE_DATA_ADDR_PA  0x100370000

SECTION .ITTE_64KB_PAGE	DATA_VA = ITTE_64KB_PG_BASE_DATA_ADDR
attr_data {
        Name = .ITTE_64KB_PAGE,
        VA=ITTE_64KB_PG_BASE_DATA_ADDR, 
	RA=ITTE_64KB_PG_BASE_DATA_ADDR_PA,
	PA=ITTE_64KB_PG_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0x1, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.data

.global  dtte_64kb_data_0
dtte_64kb_data_0: 
		.word 0xf19c2770
		.word 0xa37bd4d6
		.word 0x9830b8ea
		.word 0x9d855e40
		.word 0xe19cfe6d
		.word 0xb1e1b5bc
		.word 0xa859231c
		.word 0x6c8bc48
		.word 0xe874365e
		.word 0xf9e6d5c2
		.word 0x4614f305
		.word 0xa91a6840
		.word 0x9cef2476
		.word 0xa0d25465
		.word 0x1b9990eb
		.word 0x290cc2c4
.align 8192
.global  dtte_64kb_data_1
dtte_64kb_data_1: 
		.word 0xa38dc847
		.word 0xee4b55a0
		.word 0xfd24090e
		.word 0x5bf8d37b
		.word 0x9d322987
		.word 0xe3f2065c
		.word 0xa210290d
		.word 0xab6da4ae
		.word 0x4e414e16
		.word 0xc71ff426
		.word 0xc798f87
		.word 0x8c01441a
		.word 0x97cf0c3f
		.word 0x6629ac22
		.word 0x1beb9205
		.word 0xa0f07d06
.align 8192
.global  dtte_64kb_data_2
dtte_64kb_data_2: 
		.word 0x63e3d3d
		.word 0xc9a6d53f
		.word 0x108f1d16
		.word 0xa7379f96
		.word 0xc7531401
		.word 0x68e539ab
		.word 0x8993f2bb
		.word 0x929fe961
		.word 0xd54d9c32
		.word 0xe1fe7389
		.word 0xad84eb05
		.word 0x3ae26342
		.word 0x597ea575
		.word 0x994f30e1
		.word 0x740d1afc
		.word 0x77ba486b
.align 8192
.global  dtte_64kb_data_3
dtte_64kb_data_3: 
		.word 0x87299eee
		.word 0xac8a42d8
		.word 0x60ae05c3
		.word 0xd5ce4abf
		.word 0xbaa2705
		.word 0xf290ec20
		.word 0xb3453bf9
		.word 0xf4f9485f
		.word 0x42fc536c
		.word 0xa5dd22b1
		.word 0x18420d61
		.word 0xc7f04685
		.word 0x8432f561
		.word 0x1ae1b8b8
		.word 0xd5230c4
		.word 0xeccc591
.align 8192
.global  dtte_64kb_data_4
dtte_64kb_data_4: 
		.word 0x70575e30
		.word 0x18fa0d0
		.word 0x7a568615
		.word 0x8edfc261
		.word 0x5be267fc
		.word 0x186ec16f
		.word 0xc7df56d6
		.word 0x5ba2f8e5
		.word 0xd7b6c6bd
		.word 0x8bac0ba2
		.word 0x681b8ba
		.word 0x73e33bf1
		.word 0x7680e58c
		.word 0x1265c8fc
		.word 0x6b4df68c
		.word 0x8c97f654
.align 8192
.global  dtte_64kb_data_5
dtte_64kb_data_5: 
		.word 0x1ee0d41e
		.word 0x39a54cb
		.word 0x87c9234f
		.word 0xfd89292a
		.word 0x3e07088d
		.word 0x51acb48d
		.word 0xa54a3ba5
		.word 0xd4267b6e
		.word 0xb9b4f95e
		.word 0x92b5c3a2
		.word 0x9ebd7974
		.word 0x5c072ed3
		.word 0x901ed3bf
		.word 0xdc0fe642
		.word 0x6ed6bdc6
		.word 0x4bb40dd3
.align 8192
.global  dtte_64kb_data_6
dtte_64kb_data_6: 
		.word 0x283bd210
		.word 0x5bf677b0
		.word 0x85e634f0
		.word 0xe4d9a707
		.word 0xb1e6f6a4
		.word 0xd3f167af
		.word 0x581098f6
		.word 0xfa1269b9
		.word 0xe30a2ec8
		.word 0xa558bb35
		.word 0x94deb62d
		.word 0x75d77b7
		.word 0x6a2a2203
		.word 0x3dc2e45e
		.word 0x222e1622
		.word 0x8650406a
.align 8192
	.word	0xaabbccdd
	.word	0xaabbccdd
	.word	0xaabbccdd
	.word	0xaabbccdd
.align 4096
	.word 0xa749319f
	.word 0xc6ec25a3
	.word 0x70c6f4ba
	.word 0xe15e3926
.align 2048
	.word 0x767c6c68
	.word 0xebd4744b
	.word 0x9e79e39a
	.word 0xf37346c2
.align 1024
	.word 0xebf57ab3
	.word 0xdeb48e21
	.word 0x4ae9bfc8
	.word 0xbfd2ac6b
.align 512
	.word 0xebf0c6a1
	.word 0x18423666
	.word 0x1f4cdd92
	.word 0xfaf593b5
.align 256
	.word 0x2a2764a4
	.word 0x43c6ce09
	.word 0x8ba8eae
	.word 0x654181f2
.align 128
	.word 0xb8588042
	.word 0xa40abb15
	.word 0xa64866a2
	.word 0xbd204ec7
.align 64
	.word 0x4a765119
	.word 0xd64b536a
	.word 0xb28ce166
	.word 0xe4886ffb
.align 32
	.word 0x653edc22
	.word 0x9983eaf
.align 16
	.word 0x61535047
	.word 0x879dae92
.align 8
.global  dtte_64kb_data_end
dtte_64kb_data_end:
		.word 0xf9c90539
		.word 0x95508386
.end

!!-----------------------------------------------------
!!      512kb page size for I/D TTE
!!-----------------------------------------------------
#define ITTE_512KB_PG_BASE_DATA_ADDR    0x380000
#define ITTE_512KB_PG_BASE_DATA_ADDR_PA 0x100380000

SECTION .ITTE_512KB_PAGE	DATA_VA = ITTE_512KB_PG_BASE_DATA_ADDR
attr_data {
        Name = .ITTE_512KB_PAGE,
        VA=ITTE_512KB_PG_BASE_DATA_ADDR, 
	PA=ITTE_512KB_PG_BASE_DATA_ADDR_PA,
	RA=ITTE_512KB_PG_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=1, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.data
.global  dtte_512kb_data_0
dtte_512kb_data_0: 
		.word 0x10a7310d
		.word 0x3bff991a
		.word 0x7212b4dc
		.word 0xd046b402
		.word 0xf61b535f
		.word 0x63dc4744
		.word 0xe0251632
		.word 0x5696ed55
		.word 0xf0937066
		.word 0xa23342b5
		.word 0x1730314f
		.word 0xb5b09ecd
		.word 0x921d18b1
		.word 0xf81da91e
		.word 0xb44f65b6
		.word 0x17c14c01
		.word 0x26cf1c58
.align 8192
		.word 0xa2addb89
.align 8192
		.word 0x7bc891f
.align 8192
		.word 0xd0ccbe47
.align 8192
		.word 0xb374d163
.align 8192
		.word 0x74a4ef6
.align 8192
		.word 0xef4fae79
.align 8192
		.word 0x23925968
.align 8192
.global  dtte_512kb_data_1
dtte_512kb_data_1: 
		.word 0x33cdc6c
		.word 0xbe8c5226
		.word 0xd485d931
		.word 0xaa268796
		.word 0x24f95f82
		.word 0x84e4dcb5
		.word 0x732920b4
		.word 0x3122709d
		.word 0x98f9b350
		.word 0x41d6bb6e
		.word 0xe6590833
		.word 0xa3bb7059
		.word 0xb6640e7e
		.word 0xc3b6adda
		.word 0xd05a0ea5
		.word 0xb6370068
		.word 0xec77bf56
.align 8192
		.word 0x63d7491a
.align 8192
		.word 0xa27fbb12
.align 8192
		.word 0x1247091f
.align 8192
		.word 0xcf86dbaa
.align 8192
		.word 0xbf0fb3f6
.align 8192
		.word 0xf5f4a90d
.align 8192
		.word 0xe125cdc1
.align 8192
.global  dtte_512kb_data_2
dtte_512kb_data_2: 
		.word 0xd5008af5
		.word 0x95e99035
		.word 0x30585981
		.word 0x1907e7ee
		.word 0x1bd34ec0
		.word 0xdfb3a52e
		.word 0x62cbb0
		.word 0x11ee0658
		.word 0x2100ed47
		.word 0x197c1f9f
		.word 0x833a2279
		.word 0xb04762bd
		.word 0x31b3e25c
		.word 0xe6ce7abc
		.word 0x8b26d9d9
		.word 0x35712310
		.word 0x56c07a8a
.align 8192
		.word 0x933e668b
.align 8192
		.word 0xc01750b3
.align 8192
		.word 0x3e2e19f9
.align 8192
		.word 0x4779fc7c
.align 8192
		.word 0xda8a3f6e
.align 8192
		.word 0x622baad3
.align 8192
		.word 0x18f59a80
.align 8192
.global  dtte_512kb_data_3
dtte_512kb_data_3: 
		.word 0x3d6684a0
		.word 0x56b4eb01
		.word 0xd28f4f30
		.word 0xd0af5304
		.word 0xbde27706
		.word 0xe9202e26
		.word 0xaf758671
		.word 0xa75d6371
		.word 0x346eab8e
		.word 0x92add05d
		.word 0x962fdb2
		.word 0x569522b1
		.word 0x8672b842
		.word 0x387f2058
		.word 0xca463187
		.word 0x4ba4763
		.word 0x41eefe00
.align 8192
		.word 0x5c4fadce
.align 8192
		.word 0xde7d0540
.align 8192
		.word 0x2cf767ca
.align 8192
		.word 0x32305b5c
.align 8192
		.word 0x81e14c8f
.align 8192
		.word 0x9d060a6e
.align 8192
		.word 0xa82a0507
.align 8192
.global  dtte_512kb_data_4
dtte_512kb_data_4: 
		.word 0xaa51a9c4
		.word 0xd3bcb4d8
		.word 0xa3003ca6
		.word 0xf5a7958a
		.word 0xc37568e4
		.word 0x29eb54e8
		.word 0x2f843584
		.word 0xe72442c6
		.word 0xd6643c4a
		.word 0x428427d2
		.word 0xa40e1cf2
		.word 0xf25b4e23
		.word 0x33e31f4d
		.word 0x3f2ea595
		.word 0x435fd9aa
		.word 0xe0a45139
		.word 0x46de732b
.align 8192
		.word 0x215c2069
.align 8192
		.word 0x813745f8
.align 8192
		.word 0xf9fcd3a
.align 8192
		.word 0xfdb54b71
.align 8192
		.word 0x6a29235b
.align 8192
		.word 0x18ac6cc4
.align 8192
		.word 0x59d8bdae
.align 8192
.global  dtte_512kb_data_5
dtte_512kb_data_5: 
		.word 0x56c29c9f
		.word 0x67dda61b
		.word 0xd9c812cf
		.word 0x61e02266
		.word 0xddf8310b
		.word 0x631c2a14
		.word 0x6123103d
		.word 0xe942b4aa
		.word 0x98398805
		.word 0x663d14bd
		.word 0x2a633e52
		.word 0x16083bb4
		.word 0x7363033b
		.word 0xf354db2e
		.word 0x2072fd80
		.word 0xc06f3462
		.word 0xa9cc065f
.align 8192
		.word 0xae38d2f6
.align 8192
		.word 0xb09c97a1
.align 8192
		.word 0xbe8ec026
.align 8192
		.word 0x53d8ed06
.align 8192
		.word 0xe0bfbc2b
.align 8192
		.word 0xb8830280
.align 8192
		.word 0x7fb40f40
.align 8192
.global  dtte_512kb_data_6
dtte_512kb_data_6: 
		.word 0x7c1bfad3
		.word 0x3db858c1
		.word 0x6e85c69d
		.word 0x74efba2f
		.word 0xb0d2a9d4
		.word 0x63e1a51f
		.word 0xa8b60e31
		.word 0xc29abe64
		.word 0x227efb2b
		.word 0x32d585ef
		.word 0xf45f206f
		.word 0x7ee21239
		.word 0xa932adf0
		.word 0xf18fff35
		.word 0x9784cd0c
		.word 0x7ee30420
		.word 0x731c8056
.align 8192
		.word 0xce4a48a3
.align 8192
		.word 0x6ade8c01
.align 8192
		.word 0x5d1d91f
.align 8192
		.word 0xf545df0c
.align 8192
		.word 0x3302532a
.align 8192
		.word 0x15fe558f
.align 8192
		.word 0xe3475e7b
.align 8192
.global  dtte_512kb_data_7
dtte_512kb_data_7: 
		.word 0xed71a6e5
		.word 0x6e7c93d4
		.word 0x74be7683
		.word 0xf66962b3
		.word 0xaff2dcba
		.word 0x1727d0
		.word 0x2d01e4bb
		.word 0x1e6d49af
		.word 0x985c7f8e
		.word 0x7aa2a5ce
		.word 0xe286d7e8
		.word 0x4d333039
		.word 0x9e59d8f4
		.word 0x10e6308d
		.word 0x2c43aa94
		.word 0x59ab52ac
	.word 0xcb10efad
.align 8192
	.word 0xeab99eb1
.align 8192
	.word 0xdfc24766
.align 8192
	.word 0xec9eaaea
.align 8192
	.word 0x7d670094
.align 8192
	.word 0xe4f9cbd9
.align 8192
	.word 0x636ea6a5
.align 8192
	.word 0x3e8ef993
.align 4096
	.word 0x1e9921be
	.word 0x364866f1
.align 2048
	.word 0x35111ffa
	.word 0x97f1ae73
.align 1024
	.word 0x8b1973dd
	.word 0xfc9d1c4
.align 512
	.word 0x65f59479
	.word 0x914c643b
.align 256
	.word 0x17c385e4
	.word 0xf928e5d4
.align 128
	.word 0x76ccb4e2
	.word 0xd5f0e373
.align 64
	.word 0xb780cef0
	.word 0xb351b26d
.align 32
	.word 0x3a64e823
	.word 0xc581e0af
.align 16
	.word 0x73a06266
	.word 0x8ad187f7
.align 8
.global  dtte_512kb_data_end
dtte_512kb_data_end:
		.word 0x7c2c9621
		.word 0x4d48ea00
.end

!!-----------------------------------------------------
!!      4MB page size for I/D TTE
!!-----------------------------------------------------
#define ITTE_4MB_PG_BASE_DATA_ADDR      0x400000
#define ITTE_4MB_PG_BASE_DATA_ADDR_PA   0x100400000

SECTION .ITTE_4MB_PAGE	DATA_VA = ITTE_4MB_PG_BASE_DATA_ADDR
attr_data {
        Name = .ITTE_4MB_PAGE,
        VA=ITTE_4MB_PG_BASE_DATA_ADDR, 
	PA=ITTE_4MB_PG_BASE_DATA_ADDR_PA,
	RA=ITTE_4MB_PG_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0x3, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.data
.global  dtte_4mb_data_0
dtte_4mb_data_0: 
		.word 0xa7b34258
		.word 0x72dbe48c
		.word 0x5e47dab7
		.word 0xf5f937ad
		.word 0x62f0f42c
		.word 0x19d915ca
		.word 0x471fe4fe
		.word 0xa4025423
		.word 0xfb3e3b7f
		.word 0x915ca3e9
		.word 0xd7f286ce
		.word 0x5350cf29
		.word 0x6b2a1f46
		.word 0x9aaeda0f
		.word 0x994cb885
		.word 0xa8a7057
		.word 0x12d39d36
.align 8192
		.word 0x3ff5ffe2
.align 8192
		.word 0xa7c31506
.align 8192
		.word 0xf0b69cc8
.align 8192
		.word 0x15ecaf65
.align 8192
		.word 0xfdc1185f
.align 8192
		.word 0xcee79204
.align 8192
		.word 0x621ae40e
.align 8192
		.word 0xed358831
.align 8192
		.word 0x5a7f39e9
.align 8192
		.word 0xcaabf880
.align 8192
		.word 0xd11ee866
.align 8192
		.word 0x12152860
.align 8192
		.word 0xae8bd3a5
.align 8192
		.word 0x3c54e18f
.align 8192
		.word 0x5d8a162c
.align 8192
		.word 0x8da2b389
.align 8192
		.word 0xf1297404
.align 8192
		.word 0xa8193b61
.align 8192
		.word 0x3aa0de90
.align 8192
		.word 0xebc526b1
.align 8192
		.word 0x5249e4a0
.align 8192
		.word 0x37c69a7e
.align 8192
		.word 0x12ce698a
.align 8192
		.word 0xc5455538
.align 8192
		.word 0x79baf4c
.align 8192
		.word 0x3582db51
.align 8192
		.word 0xa0e2f30b
.align 8192
		.word 0xb084ff6
.align 8192
		.word 0x1a426066
.align 8192
		.word 0x2c47d7ea
.align 8192
		.word 0x32be4774
.align 8192
		.word 0x27669aa0
.align 8192
		.word 0xe3201a6e
.align 8192
		.word 0x523e35ff
.align 8192
		.word 0xeac1134b
.align 8192
		.word 0x3af6d370
.align 8192
		.word 0xc2ec4edc
.align 8192
		.word 0x8fe89133
.align 8192
		.word 0x83d6fa2b
.align 8192
		.word 0x6668b105
.align 8192
		.word 0x1abcb02d
.align 8192
		.word 0xde60859a
.align 8192
		.word 0x7296a8fc
.align 8192
		.word 0x95777a87
.align 8192
		.word 0x8662b13e
.align 8192
		.word 0x5afb5e7c
.align 8192
		.word 0x4c145764
.align 8192
		.word 0x55c95e0e
.align 8192
		.word 0x5d5125de
.align 8192
		.word 0xd7c46d59
.align 8192
		.word 0xe3d66c7d
.align 8192
		.word 0x52034944
.align 8192
		.word 0xdde2d89d
.align 8192
		.word 0xaa974d2d
.align 8192
		.word 0xd233ac8
.align 8192
		.word 0x53af2848
.align 8192
		.word 0x8b1429ea
.align 8192
		.word 0x588495f5
.align 8192
		.word 0x3da0760
.align 8192
		.word 0xa00caed5
.align 8192
		.word 0xeb4f0c5c
.align 8192
		.word 0x8ccfc471
.align 8192
		.word 0x5578d072
.align 8192
.global  dtte_4mb_data_1
dtte_4mb_data_1: 
		.word 0xeac30fa3
		.word 0x5109f24f
		.word 0xaa7d5a2a
		.word 0x871386ec
		.word 0x67ec460c
		.word 0xc8ef80b3
		.word 0x915479b6
		.word 0x7018af74
		.word 0x1358d5f3
		.word 0xee4e1b20
		.word 0xc3a7833a
		.word 0x4f0a9e9b
		.word 0x877525e1
		.word 0xcaeb9d2c
		.word 0x9d6b752f
		.word 0x6c13c452
		.word 0x9927d770
.align 8192
		.word 0x2c4ad501
.align 8192
		.word 0x675e1569
.align 8192
		.word 0xd0cfba9c
.align 8192
		.word 0xe192c1ec
.align 8192
		.word 0xf3359329
.align 8192
		.word 0xae772655
.align 8192
		.word 0x4c0a0b85
.align 8192
		.word 0xd1167336
.align 8192
		.word 0xdc3763ab
.align 8192
		.word 0xd8e12c82
.align 8192
		.word 0xeecee252
.align 8192
		.word 0x62925aeb
.align 8192
		.word 0x75e2445c
.align 8192
		.word 0xaa7a8862
.align 8192
		.word 0x2d391bf9
.align 8192
		.word 0xf8da03c6
.align 8192
		.word 0x5d77ec6e
.align 8192
		.word 0x83a7e850
.align 8192
		.word 0x442c6ad3
.align 8192
		.word 0xecf9ff42
.align 8192
		.word 0x3127794c
.align 8192
		.word 0x1a4d56d4
.align 8192
		.word 0xdce1818f
.align 8192
		.word 0x506d6783
.align 8192
		.word 0xc9b894aa
.align 8192
		.word 0x3e536926
.align 8192
		.word 0xbb157969
.align 8192
		.word 0xfd0f1b76
.align 8192
		.word 0x697a67d7
.align 8192
		.word 0xad7251f0
.align 8192
		.word 0xa20ce79c
.align 8192
		.word 0x3ba01936
.align 8192
		.word 0x64ddf055
.align 8192
		.word 0xd554dc58
.align 8192
		.word 0x4aae5615
.align 8192
		.word 0xb36e9ab1
.align 8192
		.word 0xef8889aa
.align 8192
		.word 0xb3c1933d
.align 8192
		.word 0xf8ff1368
.align 8192
		.word 0x803fd88b
.align 8192
		.word 0xd824c078
.align 8192
		.word 0x5a9898bf
.align 8192
		.word 0xe4888e07
.align 8192
		.word 0xe1589742
.align 8192
		.word 0x1304c2cb
.align 8192
		.word 0x4d58f205
.align 8192
		.word 0x9cdbaeb0
.align 8192
		.word 0x39ee292
.align 8192
		.word 0x910b01b2
.align 8192
		.word 0x4fc84b3a
.align 8192
		.word 0xeccae627
.align 8192
		.word 0xa3919b1a
.align 8192
		.word 0x6a82d810
.align 8192
		.word 0xed8477d7
.align 8192
		.word 0x834ae225
.align 8192
		.word 0x4078ba3e
.align 8192
		.word 0x55dc4ab3
.align 8192
		.word 0x20f63327
.align 8192
		.word 0x13751d90
.align 8192
		.word 0x12fb704f
.align 8192
		.word 0x85db35a5
.align 8192
		.word 0xf190e508
.align 8192
		.word 0x5d26bfeb
.align 8192
.global  dtte_4mb_data_2
dtte_4mb_data_2: 
		.word 0xc7780e9
		.word 0xc2fb7ac2
		.word 0x8dc36eee
		.word 0x869800f
		.word 0x9447819c
		.word 0x15d1058a
		.word 0x78ba452d
		.word 0xc67b7e1b
		.word 0x2adbdece
		.word 0xed43b838
		.word 0x8f535876
		.word 0x4f2648a8
		.word 0x5a64cadf
		.word 0xf0f49613
		.word 0x5ea893a2
		.word 0x8f648141
		.word 0x98097b8e
.align 8192
		.word 0xd71abf03
.align 8192
		.word 0x19df1ae
.align 8192
		.word 0x6a58d411
.align 8192
		.word 0xc18b599b
.align 8192
		.word 0xa2fc1066
.align 8192
		.word 0x362c7006
.align 8192
		.word 0x6e9036de
.align 8192
		.word 0x6ffa06ac
.align 8192
		.word 0xbf0e7f24
.align 8192
		.word 0xd6f36106
.align 8192
		.word 0xb2b4a336
.align 8192
		.word 0x43075d74
.align 8192
		.word 0xe10c7f00
.align 8192
		.word 0x662de2bd
.align 8192
		.word 0xfd74bfe7
.align 8192
		.word 0xcfd8d011
.align 8192
		.word 0x90180b31
.align 8192
		.word 0xe4c27df3
.align 8192
		.word 0x6fb82db3
.align 8192
		.word 0xe425c8b5
.align 8192
		.word 0x52ad2431
.align 8192
		.word 0x16ff316d
.align 8192
		.word 0x157f6b44
.align 8192
		.word 0x1948f088
.align 8192
		.word 0xe4ddd6d4
.align 8192
		.word 0x68f46d6e
.align 8192
		.word 0x3449845d
.align 8192
		.word 0x2ce480cd
.align 8192
		.word 0x9c5f209b
.align 8192
		.word 0x7285c381
.align 8192
		.word 0x84c90052
.align 8192
		.word 0x8c180243
.align 8192
		.word 0x208f4549
.align 8192
		.word 0x3f6f4e76
.align 8192
		.word 0x1454c3ba
.align 8192
		.word 0xe5481ecd
.align 8192
		.word 0x7e1369b7
.align 8192
		.word 0xd5eb16a9
.align 8192
		.word 0x9818d962
.align 8192
		.word 0x415f6954
.align 8192
		.word 0x193387e4
.align 8192
		.word 0x5f91f689
.align 8192
		.word 0x3d65683
.align 8192
		.word 0x12793fec
.align 8192
		.word 0x24f91050
.align 8192
		.word 0xf7c7c358
.align 8192
		.word 0x2740ce37
.align 8192
		.word 0x31562c35
.align 8192
		.word 0xb085cc89
.align 8192
		.word 0xa1babe2f
.align 8192
		.word 0x92fb0829
.align 8192
		.word 0xef0b6603
.align 8192
		.word 0x855dd705
.align 8192
		.word 0xb1fa9145
.align 8192
		.word 0xa81bee8c
.align 8192
		.word 0x13555c41
.align 8192
		.word 0x81b8bc32
.align 8192
		.word 0xfd2b5d70
.align 8192
		.word 0x463fe74e
.align 8192
		.word 0xe40f6812
.align 8192
		.word 0xae9b18cb
.align 8192
		.word 0x129d9bea
.align 8192
		.word 0x4bba0c8c
.align 8192
.global  dtte_4mb_data_3
dtte_4mb_data_3: 
		.word 0x95d10e38
		.word 0x7bbb496d
		.word 0x66dbd858
		.word 0xfcbbf848
		.word 0xdad372b9
		.word 0x9048ff6a
		.word 0x93cb8708
		.word 0x50821758
		.word 0xa247e2bf
		.word 0xd8d8cedb
		.word 0x3a0e7b7a
		.word 0x31fdb7a1
		.word 0x997298bf
		.word 0x953209fb
		.word 0xde26c321
		.word 0x83554585
		.word 0x1f6b1ede
.align 8192
		.word 0x65ce7db3
.align 8192
		.word 0x9bb6e86a
.align 8192
		.word 0x6c266c99
.align 8192
		.word 0x3e95f38f
.align 8192
		.word 0xcdc0e370
.align 8192
		.word 0x4654e1fd
.align 8192
		.word 0x60fd0f9b
.align 8192
		.word 0xea015480
.align 8192
		.word 0x73b01c3c
.align 8192
		.word 0x9a063242
.align 8192
		.word 0xd22d4ba2
.align 8192
		.word 0x5b0953b6
.align 8192
		.word 0x20e2890c
.align 8192
		.word 0x49dffb26
.align 8192
		.word 0x686dfa97
.align 8192
		.word 0x8b459af6
.align 8192
		.word 0x21361456
.align 8192
		.word 0xe1ae0a1e
.align 8192
		.word 0xb97468e3
.align 8192
		.word 0x9a058167
.align 8192
		.word 0x1f96c0e7
.align 8192
		.word 0xac30206b
.align 8192
		.word 0xf5a93269
.align 8192
		.word 0x89c55774
.align 8192
		.word 0xe14ed1f2
.align 8192
		.word 0xc2acfba0
.align 8192
		.word 0xf5197ab7
.align 8192
		.word 0x63520cf7
.align 8192
		.word 0xa4a8e06b
.align 8192
		.word 0x788ee261
.align 8192
		.word 0x6c46f477
.align 8192
		.word 0xffe9593
.align 8192
		.word 0x460d7195
.align 8192
		.word 0xe6b5b96c
.align 8192
		.word 0xd4ac6c2b
.align 8192
		.word 0x64a0af61
.align 8192
		.word 0x5f4ae2da
.align 8192
		.word 0x1a66e4dd
.align 8192
		.word 0x8ff3ca19
.align 8192
		.word 0xa40efce
.align 8192
		.word 0x204fbeda
.align 8192
		.word 0x8b8379ad
.align 8192
		.word 0xb35bf83
.align 8192
		.word 0x79c43ac2
.align 8192
		.word 0xc48ccfc5
.align 8192
		.word 0xf131837b
.align 8192
		.word 0xa86a931b
.align 8192
		.word 0xcb930805
.align 8192
		.word 0xf5b582ed
.align 8192
		.word 0x4bad628f
.align 8192
		.word 0x2ab6c0b5
.align 8192
		.word 0xfda51ade
.align 8192
		.word 0xa8ea7196
.align 8192
		.word 0x41c4861a
.align 8192
		.word 0x75b5603e
.align 8192
		.word 0xbf9e8ffc
.align 8192
		.word 0xa7c32310
.align 8192
		.word 0x80cb06c2
.align 8192
		.word 0xfb8d87ec
.align 8192
		.word 0x2815659a
.align 8192
		.word 0xf0695c07
.align 8192
		.word 0x2af1e55e
.align 8192
		.word 0x8bf1db6
.align 8192
.global  dtte_4mb_data_4
dtte_4mb_data_4: 
		.word 0xade4e1dd
		.word 0xe8498f19
		.word 0x11fbf1fe
		.word 0xba66cc06
		.word 0xbee67b80
		.word 0x590142a9
		.word 0x4fab9f2d
		.word 0x4b800dad
		.word 0x98be28b2
		.word 0xc06d7ff2
		.word 0x12244579
		.word 0x32a78517
		.word 0xae2383e
		.word 0x60489f5f
		.word 0x3d1d9b33
		.word 0x634f12bf
		.word 0x50e518ec
.align 8192
		.word 0xe80618
.align 8192
		.word 0xe9706472
.align 8192
		.word 0xbe785ee4
.align 8192
		.word 0xb389b327
.align 8192
		.word 0xaa9fa8e0
.align 8192
		.word 0x2f6f9f5e
.align 8192
		.word 0x1f21ca7c
.align 8192
		.word 0x6c9138df
.align 8192
		.word 0xeb5a681d
.align 8192
		.word 0xe5f1b0aa
.align 8192
		.word 0x70dcfb69
.align 8192
		.word 0xdebb8fb0
.align 8192
		.word 0x1f539938
.align 8192
		.word 0xbc215462
.align 8192
		.word 0x52c577ea
.align 8192
		.word 0x6f61b943
.align 8192
		.word 0xc5cf5127
.align 8192
		.word 0xf76656e6
.align 8192
		.word 0x11810554
.align 8192
		.word 0xb3a3ddf4
.align 8192
		.word 0x22744447
.align 8192
		.word 0x15325a35
.align 8192
		.word 0x575abe00
.align 8192
		.word 0x969addb5
.align 8192
		.word 0x52c34f6e
.align 8192
		.word 0xa7e2b6e
.align 8192
		.word 0x1d251287
.align 8192
		.word 0x2a978b31
.align 8192
		.word 0xf255fe40
.align 8192
		.word 0xc886c94
.align 8192
		.word 0xe89e2a2c
.align 8192
		.word 0xeb77f534
.align 8192
		.word 0x594ea2c1
.align 8192
		.word 0xf02e9691
.align 8192
		.word 0xb0d55699
.align 8192
		.word 0xe5bd6249
.align 8192
		.word 0x33f9d22c
.align 8192
		.word 0xbb45977d
.align 8192
		.word 0x3dc78ece
.align 8192
		.word 0xf393e2a4
.align 8192
		.word 0x824a5b02
.align 8192
		.word 0xfde7911f
.align 8192
		.word 0x21542556
.align 8192
		.word 0xa8a69c42
.align 8192
		.word 0x26d60865
.align 8192
		.word 0xb5007bb3
.align 8192
		.word 0x8c0a2dbb
.align 8192
		.word 0x95aa354e
.align 8192
		.word 0xd08ac6a6
.align 8192
		.word 0x9bbbb0ed
.align 8192
		.word 0x362453b
.align 8192
		.word 0xe73900c6
.align 8192
		.word 0xcdb8fd1b
.align 8192
		.word 0xfb10a33e
.align 8192
		.word 0x17ffb2bb
.align 8192
		.word 0x8f32d15e
.align 8192
		.word 0xe3893136
.align 8192
		.word 0xc5cd4555
.align 8192
		.word 0x94cf11fb
.align 8192
		.word 0xce8c96a4
.align 8192
		.word 0x97c046d2
.align 8192
		.word 0x7860e5e8
.align 8192
		.word 0x9a87fe0a
.align 8192
.global  dtte_4mb_data_5
dtte_4mb_data_5: 
		.word 0x259a2864
		.word 0x516f1d0
		.word 0x1e9283b3
		.word 0xc97a6efc
		.word 0x1c9ee44d
		.word 0xb99e2ce2
		.word 0xaa79ddc0
		.word 0x4e7bedb
		.word 0x941801d4
		.word 0xbbf3c9a6
		.word 0x8fc2c3e9
		.word 0xbab289db
		.word 0x15fdc057
		.word 0x74a76df6
		.word 0x40b66b9b
		.word 0x9f2fddd0
		.word 0x1566d386
.align 8192
		.word 0x3e61927e
.align 8192
		.word 0x9ffeccdc
.align 8192
		.word 0xda976ce4
.align 8192
		.word 0xeacbb1fe
.align 8192
		.word 0xfe63568e
.align 8192
		.word 0xe6d44b8e
.align 8192
		.word 0x1337b784
.align 8192
		.word 0x4eddaa36
.align 8192
		.word 0xa90f3d30
.align 8192
		.word 0x938630f4
.align 8192
		.word 0x186e619a
.align 8192
		.word 0xe6bfe19e
.align 8192
		.word 0x9898277d
.align 8192
		.word 0x2452b975
.align 8192
		.word 0x35b42701
.align 8192
		.word 0x50aea205
.align 8192
		.word 0x4ff5202c
.align 8192
		.word 0x268bbaa0
.align 8192
		.word 0x160f2335
.align 8192
		.word 0xda03993a
.align 8192
		.word 0xaf0dcc6b
.align 8192
		.word 0x36512570
.align 8192
		.word 0x4635604a
.align 8192
		.word 0x554beef6
.align 8192
		.word 0xd7fc95f1
.align 8192
		.word 0x2ffae8d0
.align 8192
		.word 0xa9d4e11f
.align 8192
		.word 0x430f54f8
.align 8192
		.word 0x7d80e253
.align 8192
		.word 0xddff860
.align 8192
		.word 0xee159ad3
.align 8192
		.word 0xe8357572
.align 8192
		.word 0x98ceb97
.align 8192
		.word 0xc3c07b79
.align 8192
		.word 0x2bbd1176
.align 8192
		.word 0xe3e963a3
.align 8192
		.word 0xd5800e06
.align 8192
		.word 0x28f5686f
.align 8192
		.word 0x7da28c03
.align 8192
		.word 0x22b0f2c4
.align 8192
		.word 0x75579f46
.align 8192
		.word 0x7be81015
.align 8192
		.word 0x779e138e
.align 8192
		.word 0x97681728
.align 8192
		.word 0x192da2a7
.align 8192
		.word 0xd0785d85
.align 8192
		.word 0xc60bb1b9
.align 8192
		.word 0x3b2eb59e
.align 8192
		.word 0x15fdeebc
.align 8192
		.word 0x6820ce20
.align 8192
		.word 0x219fa26c
.align 8192
		.word 0x6d598519
.align 8192
		.word 0x651f982e
.align 8192
		.word 0x621365d3
.align 8192
		.word 0x75df6cc4
.align 8192
		.word 0xba5ce693
.align 8192
		.word 0x1269b5cc
.align 8192
		.word 0xc37b239c
.align 8192
		.word 0x155f174b
.align 8192
		.word 0x4eb2d72d
.align 8192
		.word 0x30d7d1e5
.align 8192
		.word 0xb0c1ba4c
.align 8192
		.word 0xd20eb6a
.align 8192
.global  dtte_4mb_data_6
dtte_4mb_data_6: 
		.word 0x472b609a
		.word 0xa5f39cd9
		.word 0xf871918e
		.word 0xbb697c1b
		.word 0xad292bbe
		.word 0x628eb4ed
		.word 0x33485327
		.word 0x5540e3e2
		.word 0x21421991
		.word 0xfcb0975f
		.word 0xab8e887e
		.word 0xcbf56dfd
		.word 0xbd60649
		.word 0xf04a0eba
		.word 0xac0d0c5f
		.word 0xc8831eda
		.word 0xfac1ab8
.align 8192
		.word 0x8380b26b
.align 8192
		.word 0x7d4154fb
.align 8192
		.word 0x2906cfc8
.align 8192
		.word 0x80c94ff2
.align 8192
		.word 0xad7a4b93
.align 8192
		.word 0x31fdda33
.align 8192
		.word 0x7b9ad1f1
.align 8192
		.word 0xbfb90932
.align 8192
		.word 0xc4b9331e
.align 8192
		.word 0xf3b41c15
.align 8192
		.word 0x75664c88
.align 8192
		.word 0xa9aae7fd
.align 8192
		.word 0xd197fd13
.align 8192
		.word 0x67a0da6
.align 8192
		.word 0xeb87ca3e
.align 8192
		.word 0x4e573e88
.align 8192
		.word 0x6b84052d
.align 8192
		.word 0x85b4e7e1
.align 8192
		.word 0xa116a9f9
.align 8192
		.word 0xefcdc456
.align 8192
		.word 0x197bb0ab
.align 8192
		.word 0x706fa900
.align 8192
		.word 0x88fe66c7
.align 8192
		.word 0xfc687125
.align 8192
		.word 0x714e7964
.align 8192
		.word 0x1003c3f9
.align 8192
		.word 0x4f31eb10
.align 8192
		.word 0x6256a20a
.align 8192
		.word 0x226a161d
.align 8192
		.word 0xe91ec44b
.align 8192
		.word 0xf9e4630b
.align 8192
		.word 0xdcd2ecda
.align 8192
		.word 0xc9e1541e
.align 8192
		.word 0x1697e9f9
.align 8192
		.word 0xcc584273
.align 8192
		.word 0xdf5845cc
.align 8192
		.word 0xc30e7602
.align 8192
		.word 0x433501d6
.align 8192
		.word 0xd0ac7179
.align 8192
		.word 0xa1515b5c
.align 8192
		.word 0x1bfc2bcf
.align 8192
		.word 0x13adfe03
.align 8192
		.word 0x481ad4fc
.align 8192
		.word 0xbf074c71
.align 8192
		.word 0xb3dd7846
.align 8192
		.word 0x193312b6
.align 8192
		.word 0xe89aa5f6
.align 8192
		.word 0x89431cc1
.align 8192
		.word 0x358e177b
.align 8192
		.word 0xbeb15b3c
.align 8192
		.word 0x270c4c39
.align 8192
		.word 0xb6678b74
.align 8192
		.word 0xcd9a3aa7
.align 8192
		.word 0xbc4e4b40
.align 8192
		.word 0xad3bb05c
.align 8192
		.word 0xdbff3007
.align 8192
		.word 0xf3e5ad3c
.align 8192
		.word 0xa552704d
.align 8192
		.word 0x8e6138ef
.align 8192
		.word 0x31150173
.align 8192
		.word 0x81f7b739
.align 8192
		.word 0x11404791
.align 8192
		.word 0x5298e6f5
.align 8192
.global  dtte_4mb_data_7
dtte_4mb_data_7: 
		.word 0x466bab8d
		.word 0x497250bf
		.word 0xa95c2be3
		.word 0xbd4a4593
		.word 0xf40a56b0
		.word 0xf7907ae4
		.word 0x44b6a006
		.word 0x6af32104
		.word 0xe9dbc598
		.word 0xe3f0d1c7
		.word 0xf61a792f
		.word 0x637238cf
		.word 0x7586ed90
		.word 0x5faeabe4
		.word 0x554adc4
		.word 0x560e613c
		.word 0xe8766cd0
.align 8192
		.word 0xb71d5aa9
.align 8192
		.word 0xc863cc66
.align 8192
		.word 0xe749c803
.align 8192
		.word 0xf876831f
.align 8192
		.word 0xb19e6049
.align 8192
		.word 0xfd795f31
.align 8192
		.word 0xbd585047
.align 8192
		.word 0xc1a770c0
.align 8192
		.word 0x5944aecf
.align 8192
		.word 0xf497bf42
.align 8192
		.word 0x7a0b39c2
.align 8192
		.word 0x23fc5f8b
.align 8192
		.word 0xf4844475
.align 8192
		.word 0x9b3b1c79
.align 8192
		.word 0xaf738740
.align 8192
		.word 0xdf5d3a59
.align 8192
		.word 0xb04eb936
.align 8192
		.word 0x6e24bd7f
.align 8192
		.word 0xea9fd851
.align 8192
		.word 0x820416a5
.align 8192
		.word 0xa5f291a1
.align 8192
		.word 0xd14bbc0a
.align 8192
		.word 0xf4f1aa39
.align 8192
		.word 0x4b15146f
.align 8192
		.word 0xe71c6aef
.align 8192
		.word 0x3466c15f
.align 8192
		.word 0x63d1342b
.align 8192
		.word 0x9f9d863
.align 8192
		.word 0x98b65457
.align 8192
		.word 0x5fb68718
.align 8192
		.word 0xe74652b6
.align 8192
		.word 0x9ff8043b
.align 8192
		.word 0x452e9a1
.align 8192
		.word 0xf0f12027
.align 8192
		.word 0xa570367f
.align 8192
		.word 0x9f0c5160
.align 8192
		.word 0xdc9702f9
.align 8192
		.word 0x5faa4e1a
.align 8192
		.word 0x6a3cca30
.align 8192
		.word 0xf58a31d7
.align 8192
		.word 0xc4ee0e05
.align 8192
		.word 0x4395669f
.align 8192
		.word 0xd35c03b0
.align 8192
		.word 0x339a1b5b
.align 8192
		.word 0xdd026439
.align 8192
		.word 0x41c18d4b
.align 8192
		.word 0xa77a9494
.align 8192
		.word 0xacaee0c5
.align 8192
		.word 0x8e343269
.align 8192
		.word 0x30b94596
.align 8192
		.word 0xa892add4
.align 8192
		.word 0x15acbdb4
.align 8192
		.word 0xe9dec59f
.align 8192
		.word 0x2a7aa12a
.align 8192
		.word 0xd2d8cac1
.align 8192
		.word 0xbf02f869
.align 8192
		.word 0x63e5512e
.align 8192
		.word 0x66cd8e5c
.align 8192
		.word 0xb7b5b736
.align 8192
		.word 0xc2a33df2
.align 8192
		.word 0xcafd8207
.align 8192
		.word 0x9cd20afa
.align 8192
	.word 0x8d9e450e
.align 4096
	.word 0x6ed01c8a
	.word 0xd0bf734a
.align 2048
	.word 0x17f83f47
	.word 0x65ac64d5
.align 1024
	.word 0x826e403f
	.word 0xd3e7d820
.align 512
	.word 0xaf30c543
	.word 0x75e495c1
.align 256
	.word 0xfc1a55d5
	.word 0x98b26ec7
.align 128
	.word 0xf543a02e
	.word 0x764de0e2
.align 64
	.word 0xf4ffb7ea
	.word 0x2b0010ee
.align 32
	.word 0x9b20a84f
	.word 0xeb1d398
.align 16
	.word 0x518a4a5a
	.word 0xdd5cf542
.align 8
.global  dtte_4mb_data_end
dtte_4mb_data_end:
		.word 0x70e46ef1
		.word 0x563d2d46
.end


!!-----------------------------------------------------
!!      8kb page size for I/D TTE
!!-----------------------------------------------------
#define RDM_8KB_PG1_BASE_DATA_ADDR     0x800000
#define RDM_8KB_PG1_BASE_DATA_ADDR_PA  0x100800000
SECTION .RDM_8KB_PAGE1	DATA_VA = RDM_8KB_PG1_BASE_DATA_ADDR
attr_data {
        Name = .RDM_8KB_PAGE1
        VA=RDM_8KB_PG1_BASE_DATA_ADDR, 
	PA=RDM_8KB_PG1_BASE_DATA_ADDR_PA,
	RA=RDM_8KB_PG1_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.data
.global  dtte_8kb1_data_0
dtte_8kb1_data_0:
		.word 0xaed027e4
		.word 0x9c30f648
		.word 0x5478dead
		.word 0x74913444
		.word 0x7236060d
		.word 0x16acf26d
		.word 0xcd691bef
		.word 0xc860e619
		.word 0xfb9b7344
		.word 0x5ca5995a
		.word 0xf8f469b2
		.word 0x41b476ea
		.word 0xcf8a5346
		.word 0xe2bd3a8d
		.word 0xa7e4168d
		.word 0x40a0d42c
.align 1024
	.word 0xe0b73dc3
	.word 0x9a436925
.align 512
.global  dtte_8kb1_data_1
dtte_8kb1_data_1:
		.word 0x5564b5f3
		.word 0x9be81ea0
		.word 0x94d6a341
		.word 0x394a88fc
		.word 0x9b6329b6
		.word 0xd34f81
		.word 0x82a4dc41
		.word 0x8ee098fa
		.word 0x71f23fcd
		.word 0xa5e47cf6
		.word 0x643d869f
		.word 0x59cea8
		.word 0x5445e856
		.word 0x471cd
		.word 0x23c0d53e
		.word 0x1470d703
.align 1024
	.word 0x131d47dd
	.word 0x74c58c6a
.align 512
	.word 0xf70bb5e4
	.word 0x58e9d092
.align 256
.global  dtte_8kb1_data_2
dtte_8kb1_data_2:
		.word 0xea4529de
		.word 0xbf8118fd
		.word 0xc31f161
		.word 0x64a252ba
		.word 0x61709788
		.word 0x39b39af2
		.word 0x91b7a9f7
		.word 0x3bca1651
		.word 0xa03d96c3
		.word 0x744fb9ad
		.word 0xcd79dbf5
		.word 0xc3a51370
		.word 0x76185574
		.word 0x8706c477
		.word 0x420bc4a4
		.word 0x27f1288c
.align 1024
	.word 0x390f44ff
	.word 0x570101b2
.align 512
	.word 0x7e495367
	.word 0x53169ec7
.align 256
	.word 0x5eceea0d
	.word 0x776f3d54
.align 128
.global  dtte_8kb1_data_3
dtte_8kb1_data_3:
		.word 0x6c3d091d
		.word 0xb4ec1f84
		.word 0xe924648f
		.word 0x7f024a92
		.word 0xbd79e9c9
		.word 0x2f4bef38
		.word 0x47d1f401
		.word 0x4ec6cdb
		.word 0x41f06475
		.word 0xd5418187
		.word 0x8c70fbf3
		.word 0x69dbdc07
		.word 0x854f5552
		.word 0x4673ba8f
		.word 0xded14cc4
		.word 0xc9cd7d0
.align 1024
	.word 0x5c708624
	.word 0x75e1717e
.align 512
	.word 0x30fdb4b1
	.word 0x3204fe80
.align 256
.global  dtte_8kb1_data_4
dtte_8kb1_data_4:
		.word 0x1a6250dc
		.word 0xe4b086a
		.word 0xae0a1d0d
		.word 0x53b0daec
		.word 0xd9964886
		.word 0xf0fd2d60
		.word 0x364fb7d1
		.word 0x8437dda0
		.word 0xabd70c65
		.word 0x5a5e18bd
		.word 0x23000157
		.word 0x610a355b
		.word 0x925a95b
		.word 0x7bdfdcbc
		.word 0x3a3f9a62
		.word 0x956f3abd
.align 1024
	.word 0x8cc12d8e
	.word 0x1a0f9a50
.align 512
.global  dtte_8kb1_data_5
dtte_8kb1_data_5:
		.word 0x30863e61
		.word 0x2652633e
		.word 0xeea15249
		.word 0x50a2af34
		.word 0xcc1159f4
		.word 0xb6f7ef62
		.word 0x48d7601f
		.word 0xb2e0313f
		.word 0xb05af
		.word 0x4291c82a
		.word 0x99d6b155
		.word 0xd5d64afc
		.word 0x66df691d
		.word 0xa9403fcd
		.word 0x38d87681
		.word 0xb04d7a
.align 1024
	.word 0xf256ca06
	.word 0x1f91a9a8
.align 512
	.word 0x9ea4a16e
	.word 0x6f7b8b5f
.align 256
.global  dtte_8kb1_data_6
dtte_8kb1_data_6:
		.word 0x84aacbf5
		.word 0x794efd72
		.word 0xa5441a42
		.word 0xc2f65143
		.word 0x4431a3f4
		.word 0x4a92f9b3
		.word 0xc2bea2e2
		.word 0xf5e58f3a
		.word 0xb3a24499
		.word 0x880c7976
		.word 0xf8490c95
		.word 0x632307b2
		.word 0x7a0c646
		.word 0x3023f13d
		.word 0x4e6ea3e7
		.word 0x85f177f
.align 1024
	.word 0x77728fab
	.word 0x55c74734
.align 512
	.word 0xfa0af6cf
	.word 0x8dae6b34
.align 256
	.word 0xc6ae028f
	.word 0xd21e7aaa
.align 128
	.word 0x4b975914
	.word 0x92ad35b4
.align 64
	.word 0x68b1b0d0
	.word 0xcf9ecebc
.align 32
	.word 0x94a1caeb
	.word 0xc86bc08
.align 16
	.word 0x10eb5da8
	.word 0x26196c52
.align 8
.global  dtte_8kb1_data_end
dtte_8kb1_data_end:
		.word 0x647925e5
		.word 0xe5c94a72

!!-----------------------------------------------------
!!      8kb page size for I/D TTE
!!-----------------------------------------------------
#define RDM_8KB_PG2_BASE_DATA_ADDR     0x802000
#define RDM_8KB_PG2_BASE_DATA_ADDR_PA  0x100802000
SECTION .RDM_8KB_PAGE2	DATA_VA = RDM_8KB_PG2_BASE_DATA_ADDR
attr_data {
        Name = .RDM_8KB_PAGE2
        VA=RDM_8KB_PG2_BASE_DATA_ADDR, 
	PA=RDM_8KB_PG2_BASE_DATA_ADDR_PA,
	RA=RDM_8KB_PG2_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.data
.global  dtte_8kb2_data_0
dtte_8kb2_data_0:
		.word 0x74b74f31
		.word 0x27bdaf4f
		.word 0x2774b407
		.word 0xaedbe6c1
		.word 0x6924b42a
		.word 0x89d69304
		.word 0x1fb953a
		.word 0xb56c53e6
		.word 0x587421fb
		.word 0xb48df1e5
		.word 0x3d296e5
		.word 0xcf813ac7
		.word 0x84f16ef6
		.word 0x22778c7e
		.word 0xbf7d61d8
		.word 0x25458c52
.align 8192
.end

