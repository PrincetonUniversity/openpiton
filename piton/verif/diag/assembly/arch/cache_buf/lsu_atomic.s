// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: lsu_atomic.s
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
	set     0x80760b9e,     %l0
	set     0x55e9ba1b,     %l1
	set     0xd4929ba7,     %l2
	set     0x8198a84c,     %l3
	set     0xa8275c83,     %l4
	set     0x14e7da1f,     %l5
	set     0xac2a5585,     %l6
	set     0xf6157927,     %l7
	set     0x9ca26c77,     %i0
	set     0x74ef2d42,     %i1
	set     0x1d79fc62,     %i2
	set     0x347e02e1,     %i3
	set     0xf6ce5539,     %i4
	set     0x36a26c32,     %i5
	set     0x597406c6,     %i6
	set     0x1f9865d6,     %i7
	set     0x8f29649,     %o0
	set     0xc375dc1c,     %o1
	set     0x38865da3,     %o2
	set     0x13323bd4,     %o3
	set     0x2928a406,     %o4
	set     0x2505322d,     %o5
	set     0xea44d385,     %o6
	set     0xd2be1145,     %o7
        set     0xdeadbeef,     %g4  
        set     0xcafebabe,     %g5  
        set     0x01234567,     %g6  
        set     0x89abcdef,     %g7
  
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
	setx	dtte_4mb_data_0,	%l0,	%l2
	setx	dtte_4mb_data_end,	%l0,	%l1
	setx	dtte_8kb1_data_0,	%l0,	%g1
	setx	dtte_8kb1_data_end,	%l0,	%g2
	setx	dtte_8kb2_data_0,	%l0,	%g3
	mov	0x1,	%o0
	ldsb     [%l7+4],  %o3
	mov	0x2,	%o0
	ldsb     [%l6+0],  %i3
	ldsb     [%l5+2],  %i3
	mov	0x3,	%o0
	ldsb     [%l4+0],  %i2
	ldub     [%l3+6],  %o3
	mov	0x4,	%o0
	ldub     [%l2+1],  %i1
	ldub     [%l1+6],  %i2
	mov	0x5,	%o0
	ldsb     [%g1+4],  %i1
	ldsb     [%g2+2],  %i2
	mov	0x6,	%o0
	ldub     [%g3+2],  %o6

	/* stores */
	swap	[%l7],	%i2
	ldstub	[%l6],	%o6
	casa	[%l5] 0x80,	%o3, %l0
	swap	[%l4],	%o4
	ldstub	[%l3],	%i7
	casa	[%l2] 0x88,	%i6, %l0
	ldstub	[%l1],	%i7
	swap	[%g1],	%o5

	/* load mixed with store */
	ldub     [%l7+2],  %o7
	stx	%o3,	[%l7]
	ldsb     [%l6+6],  %i0
       stb      %o5,        [%l5]
       ldub     [%l4+4],  %i4
       stw      %i3,        [%l3]
       ldsb     [%l2+6],  %o7
       stw      %o5,        [%l1]
       ldub     [%g1+6],  %i1

	/*
	 *************************************************** 
	 *	test the raw condition
	 *************************************************** 
	 */

/*
 ************************
 * ld raw after one st
 ************************
 */ 
raw_tc0:
raw_tc0_0:    
	setx	dtte_8kb1_data_end,	%l0,	%l1		
	st	%o6,	[%l1+0]
	swap	[%l1+0],	%g4
	ldx	[%l1+0],	%o1
	sth	%o7,	[%l1+16]
	ldstub	[%l1+16],	%g4
	lduw	[%l1+16],	%o2
	stb	%o2,	[%l1+32]
	swap 	[%l1],	%g4
	ldsh	[%l1+32],	%o1
raw_tc0_1:    
	setx	dtte_64kb_data_6,	%l0,	%l1		
	st	%o1,	[%l1+0]
	swap	[%l1+0],	%g4
	ldx	[%l1+0],	%o1
	sth	%o7,	[%l1+18]
	ldstub	[%l1+18],	%g4
	lduw	[%l1+16],	%o2
	stb	%o7,	[%l1+35]
	swap 	[%l1],	%g4
	ldx	[%l1+32],	%o1
raw_tc0_2:    
	setx	dtte_64kb_data_5,	%l0,	%l1		
	st	%o0,	[%l1+0]
	swap	[%l1+0],	%g4
	ldx	[%l1+0],	%o1
	sth	%o1,	[%l1+16]
	ldstub	[%l1+16],	%g4
	ldsw	[%l1+16],	%o2
	stb	%o1,	[%l1+33]
	swap 	[%l1],	%g4
	lduw	[%l1+32],	%o1
raw_tc0_3:    
	setx	dtte_8kb_data_3,	%l0,	%l1		
	st	%o7,	[%l1+0]
	swap	[%l1+0],	%g4
	ldx	[%l1+0],	%o1
	sth	%o5,	[%l1+16]
	ldstub	[%l1+16],	%g4
	lduw	[%l1+16],	%o2
	stb	%o6,	[%l1+34]
	swap 	[%l1],	%g4
	lduh	[%l1+32],	%o1
/*
 ************************
 * ld raw against two sts
 ************************
 */ 
raw_tc1:
raw_tc1_0:    
	setx	dtte_4mb_data_3,	%l0,	%l1		
	add	%l1,	16, %l1
	st	%o1,	[%l1]
	casa	[%l1] 0x80,	%g4,	%g5
	casa	[%l1] 0x80,	%g5,	%g6
	st	%o1,	[%l1+0x4]
	ldx	[%l1],	%o1

	sth	%o4,	[%l1+0x10]
	swap	[%l1+0x10],	%g4
	sth	%o6,	[%l1+0x12]
	ldx	[%l1+0x10],	%o2

	stb	%o4,	[%l1+0x20]
	ldstub	[%l1+0x20],	%g4
	stb	%o4,	[%l1+0x21]
	ldx	[%l1+0x20],	%o1
raw_tc1_1:    
	setx	dtte_8kb1_data_0,	%l0,	%l1		
	add	%l1,	0, %l1
	st	%o7,	[%l1]
	casa	[%l1] 0x80,	%g4,	%g5
	casa	[%l1] 0x88,	%g5,	%g6
	st	%o0,	[%l1+0x4]
	ldx	[%l1],	%o1

	sth	%o1,	[%l1+0x10]
	swap	[%l1+0x10],	%g4
	sth	%o1,	[%l1+0x12]
	ldsw	[%l1+0x10],	%o2

	stb	%o0,	[%l1+0x20]
	ldstub	[%l1+0x20],	%g4
	stb	%o1,	[%l1+0x21]
	ldsh	[%l1+0x20],	%o1
raw_tc1_2:    
	setx	dtte_8kb1_data_5,	%l0,	%l1		
	add	%l1,	8, %l1
	st	%o2,	[%l1]
	casa	[%l1] 0x88,	%g4,	%g5
	casa	[%l1] 0x88,	%g5,	%g6
	st	%o3,	[%l1+0x4]
	ldx	[%l1],	%o1

	sth	%o7,	[%l1+0x10]
	swap	[%l1+0x10],	%g4
	sth	%o0,	[%l1+0x12]
	lduw	[%l1+0x10],	%o2

	stb	%o2,	[%l1+0x20]
	ldstub	[%l1+0x20],	%g4
	stb	%o1,	[%l1+0x21]
	ld	[%l1+0x20],	%o1
raw_tc1_3:    
	setx	dtte_512kb_data_3,	%l0,	%l1		
	add	%l1,	16, %l1
	st	%o6,	[%l1]
	casa	[%l1] 0x88,	%g4,	%g5
	casa	[%l1] 0x80,	%g5,	%g6
	st	%o4,	[%l1+0x4]
	ldx	[%l1],	%o1

	sth	%o6,	[%l1+0x10]
	swap	[%l1+0x10],	%g4
	sth	%o2,	[%l1+0x12]
	ldx	[%l1+0x10],	%o2

	stb	%o3,	[%l1+0x20]
	ldstub	[%l1+0x20],	%g4
	stb	%o3,	[%l1+0x21]
	ld	[%l1+0x20],	%o1

/*
 ********************************
 * ld raw against more stores
 ********************************
 */ 
raw_tc2:
raw_tc2_0:    
	setx	dtte_4mb_data_4,	%l0,	%l1		
	add	%l1,	32, %l1
	st	%o6,	[%l1]
	stb	%o3,	[%l1+6]
	ldstub  [%l1+6],     %g4
	sth	%o4,	[%l1+0]
	ldx	[%l1],	%o1

	setx	dtte_8kb1_data_end,	%l0,	%l1		
	add	%l1,	8, %l1
	swap	[%l1],	%g4
	stx	%o3,	[%l1]
	st	%o7,	[%l1+0]
	sth	%o5,	[%l1+4]
	stb	%o2,	[%l1+2];
	swap	[%l1],	%g4
	sth	%o0,	[%l1+0]
	stb	%o3,	[%l1+5];
	sth	%o0,	[%l1+2]
	ldx	[%l1],	%o1

	setx	dtte_4mb_data_end,	%l0,	%l1		
	add	%l1,	8, %l1
	stx	%o1,	[%l1]
	swap	[%l1],	%g4
	st	%o0,	[%l1+0]
	sth	%o2,	[%l1+2]
       casa    [%l1] 0x80,  %g4,    %g5
       casa    [%l1] 0x80,  %g5,    %g6
	stb	%o5,	[%l1+5];
	sth	%o7,	[%l1+4]
	stb	%o3,	[%l1+2];
	swap	[%l1],	%g4
	sth	%o2,	[%l1+4]
	lduw	[%l1],	%o1
raw_tc2_1:    
	setx	dtte_8kb1_data_3,	%l0,	%l1		
	add	%l1,	56, %l1
	st	%o2,	[%l1]
	stb	%o5,	[%l1+2]
	ldstub  [%l1+2],     %g4
	sth	%o5,	[%l1+2]
	lduh	[%l1],	%o1

	setx	dtte_8kb1_data_2,	%l0,	%l1		
	add	%l1,	56, %l1
	swap	[%l1],	%g4
	stx	%o3,	[%l1]
	st	%o2,	[%l1+0]
	sth	%o4,	[%l1+2]
	stb	%o1,	[%l1+1];
	swap	[%l1],	%g4
	sth	%o0,	[%l1+4]
	stb	%o6,	[%l1+4];
	sth	%o0,	[%l1+0]
	ldsw	[%l1],	%o1

	setx	dtte_4mb_data_0,	%l0,	%l1		
	add	%l1,	24, %l1
	stx	%o0,	[%l1]
	swap	[%l1],	%g4
	st	%o3,	[%l1+0]
	sth	%o1,	[%l1+4]
       casa    [%l1] 0x80,  %g4,    %g5
       casa    [%l1] 0x80,  %g5,    %g6
	stb	%o0,	[%l1+6];
	sth	%o4,	[%l1+2]
	stb	%o3,	[%l1+0];
	swap	[%l1],	%g4
	sth	%o0,	[%l1+0]
	lduw	[%l1],	%o1
raw_tc2_2:    
	setx	dtte_64kb_data_1,	%l0,	%l1		
	add	%l1,	40, %l1
	st	%o0,	[%l1]
	stb	%o4,	[%l1+3]
	ldstub  [%l1+3],     %g4
	sth	%o4,	[%l1+0]
	lduw	[%l1],	%o1

	setx	dtte_8kb1_data_4,	%l0,	%l1		
	add	%l1,	40, %l1
	swap	[%l1],	%g4
	stx	%o5,	[%l1]
	st	%o6,	[%l1+0]
	sth	%o1,	[%l1+0]
	stb	%o4,	[%l1+2];
	swap	[%l1],	%g4
	sth	%o2,	[%l1+4]
	stb	%o3,	[%l1+3];
	sth	%o4,	[%l1+2]
	ldsw	[%l1],	%o1

	setx	dtte_4mb_data_0,	%l0,	%l1		
	add	%l1,	32, %l1
	stx	%o5,	[%l1]
	swap	[%l1],	%g4
	st	%o6,	[%l1+0]
	sth	%o5,	[%l1+0]
       casa    [%l1] 0x88,  %g4,    %g5
       casa    [%l1] 0x80,  %g5,    %g6
	stb	%o1,	[%l1+4];
	sth	%o1,	[%l1+0]
	stb	%o5,	[%l1+5];
	swap	[%l1],	%g4
	sth	%o1,	[%l1+0]
	ldsw	[%l1],	%o1
raw_tc2_3:    
	setx	dtte_4mb_data_1,	%l0,	%l1		
	add	%l1,	16, %l1
	st	%o1,	[%l1]
	stb	%o3,	[%l1+2]
	ldstub  [%l1+2],     %g4
	sth	%o7,	[%l1+2]
	lduh	[%l1],	%o1

	setx	dtte_512kb_data_2,	%l0,	%l1		
	add	%l1,	0, %l1
	swap	[%l1],	%g4
	stx	%o1,	[%l1]
	st	%o3,	[%l1+0]
	sth	%o7,	[%l1+4]
	stb	%o2,	[%l1+6];
	swap	[%l1+4],	%g4
	sth	%o5,	[%l1+0]
	stb	%o2,	[%l1+2];
	sth	%o7,	[%l1+4]
	lduw	[%l1],	%o1

	setx	dtte_64kb_data_1,	%l0,	%l1		
	add	%l1,	40, %l1
	stx	%o7,	[%l1]
	swap	[%l1],	%g4
	st	%o3,	[%l1+0]
	sth	%o6,	[%l1+4]
       casa    [%l1] 0x80,  %g4,    %g5
       casa    [%l1] 0x80,  %g5,    %g6
	stb	%o2,	[%l1+1];
	sth	%o6,	[%l1+2]
	stb	%o5,	[%l1+4];
	swap	[%l1],	%g4
	sth	%o1,	[%l1+2]
	ldx	[%l1],	%o1


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
	setx	dtte_8kb_data_4,	%l0,	%l1		
	add	%l1,	40, %l1
	st	%o0,	[%l1]
	stb	%o5,	[%l1+3]
	sth	%o5,	[%l1+4]
	lduha [%l1] 0x10, %o1
	lduw	[%l1],	%o1	/* load will bypass */

	setx	dtte_8kb_data_3,	%l0,	%l1		
	add	%l1,	56, %l1
	stx	%o1,	[%l1]
	st	%o7,	[%l1+0]
	sth	%o6,	[%l1+2]
	stb	%o1,	[%l1+4];
	sth	%o2,	[%l1+4]
	stb	%o6,	[%l1+6];
	sth	%o4,	[%l1+4]
	ldxa	[%l1] 0x18,	%o1
	casa	[%l1] 0x10,  %o1,	%g5
	st	%o1,	[%l1+0]
	sth	%o5,	[%l1+2]
	stb	%o3,	[%l1+0];
	sth	%o0,	[%l1+0]
	stb	%o0,	[%l1+0];
	casa	[%l1] 0x18,  %o1,	%g5	
	ldxa	[%l1] 0x18,	%o1
	ldsw	[%l1],	%o1	/* load will bypass */
	setx	dtte_8kb_data_3,	%l0,	%l1		
	add	%l1,	0, %l1
	stx	%o5,	[%l1]
	st	%o0,	[%l1+0]
	sth	%o2,	[%l1+4]
	stb	%o3,	[%l1+0];
	sth	%o1,	[%l1+2]
	stb	%o3,	[%l1+4];
	sth	%o2,	[%l1+4]
	lduwa	[%l1] 0x80,	%o1
	swap 	[%l1],	%g5	
	stb	%o1,	[%l1+2];
	sth	%o7,	[%l1+4]
	stb	%o2,	[%l1+3];
	casa	[%l1] 0x18,  %o1,	%g5	
	st	%o5,	[%l1+0]
	sth	%o2,	[%l1+0]
	lduwa	[%l1] 0x88,	%o1
	ldx	[%l1],	%o1	/* load will bypass */
raw_tc3_1:    
	setx	dtte_4mb_data_0,	%l0,	%l1		
	add	%l1,	8, %l1
	st	%o6,	[%l1]
	stb	%o0,	[%l1+1]
	sth	%o3,	[%l1+4]
	ldswa [%l1] 0x80, %o1
	ldx	[%l1],	%o1	/* load will bypass */

	setx	dtte_8kb_data_4,	%l0,	%l1		
	add	%l1,	16, %l1
	stx	%o6,	[%l1]
	st	%o3,	[%l1+0]
	sth	%o5,	[%l1+2]
	stb	%o7,	[%l1+6];
	sth	%o1,	[%l1+2]
	stb	%o4,	[%l1+4];
	sth	%o4,	[%l1+0]
	ldswa	[%l1] 0x80,	%o1
	casa	[%l1] 0x10,  %o1,	%g5
	st	%o7,	[%l1+0]
	sth	%o4,	[%l1+2]
	stb	%o0,	[%l1+3];
	sth	%o6,	[%l1+0]
	stb	%o0,	[%l1+3];
	casa	[%l1] 0x18,  %o1,	%g5	
	ldxa	[%l1] 0x18,	%o1
	ldx	[%l1],	%o1	/* load will bypass */
	setx	dtte_4mb_data_2,	%l0,	%l1		
	add	%l1,	16, %l1
	stx	%o7,	[%l1]
	st	%o5,	[%l1+0]
	sth	%o6,	[%l1+4]
	stb	%o1,	[%l1+4];
	sth	%o3,	[%l1+4]
	stb	%o7,	[%l1+0];
	sth	%o5,	[%l1+0]
	ldswa	[%l1] 0x88,	%o1
	swap 	[%l1],	%g5	
	stb	%o4,	[%l1+4];
	sth	%o0,	[%l1+4]
	stb	%o1,	[%l1+1];
	casa	[%l1] 0x80,  %o1,	%g5	
	st	%o7,	[%l1+0]
	sth	%o6,	[%l1+4]
	lduwa	[%l1] 0x18,	%o1
	lduw	[%l1],	%o1	/* load will bypass */
raw_tc3_2:    
	setx	dtte_8kb_data_6,	%l0,	%l1		
	add	%l1,	24, %l1
	st	%o4,	[%l1]
	stb	%o2,	[%l1+1]
	sth	%o0,	[%l1+0]
	ldswa [%l1] 0x80, %o1
	ldx	[%l1],	%o1	/* load will bypass */

	setx	dtte_8kb_data_end,	%l0,	%l1		
	add	%l1,	16, %l1
	stx	%o0,	[%l1]
	st	%o7,	[%l1+0]
	sth	%o7,	[%l1+0]
	stb	%o2,	[%l1+1];
	sth	%o4,	[%l1+0]
	stb	%o2,	[%l1+4];
	sth	%o5,	[%l1+2]
	ldxa	[%l1] 0x80,	%o1
	casa	[%l1] 0x80,  %o1,	%g5
	st	%o1,	[%l1+0]
	sth	%o4,	[%l1+0]
	stb	%o0,	[%l1+0];
	sth	%o0,	[%l1+4]
	stb	%o7,	[%l1+3];
	casa	[%l1] 0x10,  %o1,	%g5	
	lduwa	[%l1] 0x80,	%o1
	ldsw	[%l1],	%o1	/* load will bypass */
	setx	dtte_512kb_data_6,	%l0,	%l1		
	add	%l1,	48, %l1
	stx	%o1,	[%l1]
	st	%o2,	[%l1+0]
	sth	%o4,	[%l1+4]
	stb	%o4,	[%l1+2];
	sth	%o2,	[%l1+2]
	stb	%o0,	[%l1+5];
	sth	%o4,	[%l1+0]
	ldxa	[%l1] 0x88,	%o1
	swap 	[%l1],	%g5	
	stb	%o2,	[%l1+0];
	sth	%o1,	[%l1+4]
	stb	%o7,	[%l1+5];
	casa	[%l1] 0x18,  %o1,	%g5	
	st	%o4,	[%l1+0]
	sth	%o7,	[%l1+0]
	ldxa	[%l1] 0x88,	%o1
	ldsw	[%l1],	%o1	/* load will bypass */
raw_tc3_3:    
	setx	dtte_8kb_data_4,	%l0,	%l1		
	add	%l1,	0, %l1
	st	%o7,	[%l1]
	stb	%o1,	[%l1+5]
	sth	%o5,	[%l1+2]
	ldxa [%l1] 0x80, %o1
	ldx	[%l1],	%o1	/* load will bypass */

	setx	dtte_4mb_data_0,	%l0,	%l1		
	add	%l1,	0, %l1
	stx	%o1,	[%l1]
	st	%o6,	[%l1+0]
	sth	%o6,	[%l1+2]
	stb	%o6,	[%l1+2];
	sth	%o0,	[%l1+4]
	stb	%o0,	[%l1+5];
	sth	%o2,	[%l1+4]
	lduwa	[%l1] 0x88,	%o1
	casa	[%l1] 0x10,  %o1,	%g5
	st	%o0,	[%l1+0]
	sth	%o7,	[%l1+0]
	stb	%o4,	[%l1+6];
	sth	%o6,	[%l1+0]
	stb	%o2,	[%l1+2];
	casa	[%l1] 0x88,  %o1,	%g5	
	lduwa	[%l1] 0x88,	%o1
	ldsw	[%l1],	%o1	/* load will bypass */
	setx	dtte_512kb_data_4,	%l0,	%l1		
	add	%l1,	40, %l1
	stx	%o4,	[%l1]
	st	%o7,	[%l1+0]
	sth	%o3,	[%l1+0]
	stb	%o2,	[%l1+1];
	sth	%o7,	[%l1+4]
	stb	%o4,	[%l1+0];
	sth	%o1,	[%l1+2]
	ldxa	[%l1] 0x80,	%o1
	swap 	[%l1],	%g5	
	stb	%o2,	[%l1+3];
	sth	%o0,	[%l1+2]
	stb	%o4,	[%l1+6];
	casa	[%l1] 0x80,  %o1,	%g5	
	st	%o6,	[%l1+0]
	sth	%o0,	[%l1+0]
	lduwa	[%l1] 0x80,	%o1
	ldx	[%l1],	%o1	/* load will bypass */


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
		.word 0xb84b4325
		.word 0x5a128a62
		.word 0xfadbab31
		.word 0x1757a108
		.word 0x97686eae
		.word 0x1107ea4e
		.word 0x2ef86e5
		.word 0xae67aced
		.word 0xd2ee7636
		.word 0x607bc268
		.word 0x47a2637f
		.word 0x3728c25f
		.word 0x59216e4b
		.word 0x5b8be02
		.word 0xe823d420
		.word 0xef3e005
.align 1024
	.word 0xb37579a2
	.word 0xf9455284
	.word 0xecbe8e75
	.word 0xed84bbbc
.align 512
.global  dtte_8kb_data_1
dtte_8kb_data_1:
		.word 0xa87160f4
		.word 0xaf05437f
		.word 0xcc379f3b
		.word 0x1961b6ce
		.word 0x29484522
		.word 0xc7e6d401
		.word 0xfe4de305
		.word 0x9b526163
		.word 0x7c59cf9f
		.word 0xaa21392a
		.word 0xe1b1c73d
		.word 0x27f64137
		.word 0x6eda850e
		.word 0x474f21ff
		.word 0xfac99768
		.word 0x6974cf8c
.align 1024
	.word 0x87dc1e29
	.word 0x109687e
	.word 0xdb16daad
	.word 0x455ae262
.align 512
	.word 0xc8080ae5
	.word 0xfa533ff1
	.word 0x8b558597
	.word 0xeb48f4e5
.align 256
.global  dtte_8kb_data_2
dtte_8kb_data_2:
		.word 0xe1dc83d3
		.word 0xa76a7487
		.word 0xd4b60419
		.word 0xdb590327
		.word 0x185ecdc9
		.word 0x5ba3901f
		.word 0x3c1f5fd2
		.word 0x8e59ed0f
		.word 0xc3b93c1
		.word 0x4722f867
		.word 0x6d770693
		.word 0x19699490
		.word 0xcb787b00
		.word 0x79c15a25
		.word 0x78bff51d
		.word 0x99562b1d
.align 1024
	.word 0xf468557a
	.word 0x567af5d4
	.word 0xe7bb4a2e
	.word 0xabc2625b
.align 512
	.word 0xcbc59674
	.word 0x80aea172
	.word 0xe4d085be
	.word 0xf38f7418
.align 256
	.word 0xcdeced6b
	.word 0xdb6a9398
	.word 0x7ba3f885
	.word 0x6cb357b
.align 128
.global  dtte_8kb_data_3
dtte_8kb_data_3:
		.word 0xae6c2b34
		.word 0x30524bca
		.word 0x3d2627c1
		.word 0xd8fa97d
		.word 0x75b7d564
		.word 0x908a2c10
		.word 0x1c4f2935
		.word 0x5e24c697
		.word 0xad1c0bf1
		.word 0x63ca97c5
		.word 0x4a653b74
		.word 0xa8c63bc
		.word 0x6323a519
		.word 0x5985abae
		.word 0xd1de1e5f
		.word 0x59ab808a
.align 1024
	.word 0x80faa382
	.word 0x5b27e34e
	.word 0x11deefeb
	.word 0xb9c35cbb
.align 512
	.word 0x9ff6aa2
	.word 0x162d3f77
	.word 0x72569127
	.word 0xbe2012e1
.align 256
.global  dtte_8kb_data_4
dtte_8kb_data_4:
		.word 0xb4085560
		.word 0x6e49c224
		.word 0x5dead77d
		.word 0x609aa52
		.word 0xf71992fb
		.word 0xec7d5386
		.word 0xf3b10e37
		.word 0x8a5fd460
		.word 0x88a16e2b
		.word 0x2cd8645c
		.word 0xeb2e8c45
		.word 0x4117c8cd
		.word 0xdf0f6285
		.word 0x1337e187
		.word 0xc9a6623c
		.word 0x7d56f57d
.align 1024
	.word 0x28fca423
	.word 0xb4944cdd
	.word 0x48564a2
	.word 0x175c756d
.align 512
.global  dtte_8kb_data_5
dtte_8kb_data_5:
		.word 0x4d62fd83
		.word 0xffe90f3d
		.word 0xc20e1668
		.word 0x941682e3
		.word 0x6ac927af
		.word 0x347657e2
		.word 0x1b7a37b7
		.word 0x86058e7
		.word 0xa01a009e
		.word 0x9c711cfc
		.word 0x9adffcef
		.word 0xd2b837f1
		.word 0x154e43da
		.word 0x285a117c
		.word 0xf78531ec
		.word 0xf70481e3
.align 1024
	.word 0x8266a962
	.word 0xd16da42f
	.word 0x1d2acd8a
	.word 0x95fa2139
.align 512
	.word 0x42ae8ed1
	.word 0xd62c5c0e
	.word 0x6a7fb96b
	.word 0xc425af7e
.align 256
.global  dtte_8kb_data_6
dtte_8kb_data_6:
		.word 0x271d8ebe
		.word 0x441c25d3
		.word 0xe091d1f7
		.word 0xbebc0f01
		.word 0x2730aa66
		.word 0xfad866cf
		.word 0x150062a3
		.word 0xed6e6bc9
		.word 0x19f9e988
		.word 0x9f8fe8fa
		.word 0xfb23a276
		.word 0x43c8d7c5
		.word 0x43af9490
		.word 0x626cf44b
		.word 0xa990f4c9
		.word 0xd961f647
.align 1024
	.word 0x9cf26cf7
	.word 0x2255294a
	.word 0xc99bf24e
	.word 0x19956ab3
.align 512
	.word 0xca9487e9
	.word 0x5c33f0e3
	.word 0x49f07e52
	.word 0xd0e9fe73
.align 256
	.word 0x2d20af27
	.word 0x72db957c
	.word 0xac626c46
	.word 0xeadfb22d
.align 128
	.word 0xc8fc6c2e
	.word 0x98b65948
	.word 0xdd3797b
	.word 0xa5f12e38
.align 64
	.word 0xf8fd2199
	.word 0xee421ddd
	.word 0xdd89f2c
	.word 0xd057464b
.align 32
	.word 0x77ead6c3
	.word 0x4e67104
.align 16
	.word 0x7ed400c1
	.word 0xadd48477
.global  dtte_8kb_data_end
dtte_8kb_data_end:
		.word 0xc7f199b0
		.word 0xbe5e12cf
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
		.word 0x46c8fa52
		.word 0x10b9ef56
		.word 0xf3ac9b2c
		.word 0xa2ea48f1
		.word 0xd9841369
		.word 0x5b57f84
		.word 0x11846934
		.word 0x5179349
		.word 0xfe08da0b
		.word 0xf60df84e
		.word 0x79cbeb95
		.word 0x364095bf
		.word 0x2fd3e9f9
		.word 0xdf717a9
		.word 0xc89e06d3
		.word 0x54754b53
.align 8192
.global  dtte_64kb_data_1
dtte_64kb_data_1: 
		.word 0x709fa433
		.word 0xefe45166
		.word 0x3838094c
		.word 0xd639d673
		.word 0x1d3e5abd
		.word 0xa96f89a2
		.word 0xadab469b
		.word 0x7bf1828c
		.word 0xa804f4a4
		.word 0x8dcc8282
		.word 0xaa828541
		.word 0x1effcae2
		.word 0x996d4e43
		.word 0x1418f120
		.word 0xd09e2282
		.word 0x6cf27aa4
.align 8192
.global  dtte_64kb_data_2
dtte_64kb_data_2: 
		.word 0x447d9c2
		.word 0x58646dc0
		.word 0x7c54108c
		.word 0xc6a53a3a
		.word 0x9a4843df
		.word 0x144ab346
		.word 0x4a0f12de
		.word 0x99801de2
		.word 0xa83120f0
		.word 0x32ade1ec
		.word 0xea7adce7
		.word 0xd0f8097a
		.word 0xa29ee628
		.word 0xe0c5b92f
		.word 0x1900f6ed
		.word 0xb990fd9e
.align 8192
.global  dtte_64kb_data_3
dtte_64kb_data_3: 
		.word 0x45b2b319
		.word 0xb893fd0a
		.word 0xa6348d30
		.word 0x7a0fa1f5
		.word 0xee1af79
		.word 0x551d7a66
		.word 0x81098d4f
		.word 0x5488a0c8
		.word 0x81360128
		.word 0x2ca5ed0
		.word 0x5095b5e9
		.word 0x34d1a7d4
		.word 0xed9a9e71
		.word 0xf547d76c
		.word 0x3ae07c87
		.word 0xc5c12260
.align 8192
.global  dtte_64kb_data_4
dtte_64kb_data_4: 
		.word 0xa29b808f
		.word 0x53702b29
		.word 0xbe30edb8
		.word 0xc7e70090
		.word 0x7597fa73
		.word 0xd05dc435
		.word 0x4796eb7d
		.word 0xb43a1ffb
		.word 0x92fd37c4
		.word 0x7220dcb3
		.word 0x555f6de7
		.word 0xa8db297c
		.word 0xb7fb2827
		.word 0x89d6c2ab
		.word 0x3cf9a9fe
		.word 0x1ec6f845
.align 8192
.global  dtte_64kb_data_5
dtte_64kb_data_5: 
		.word 0x36865ac0
		.word 0xe95ce742
		.word 0x3cd42e5
		.word 0x325fde39
		.word 0x9d8df7
		.word 0xafc92d2a
		.word 0x6fdfe93b
		.word 0x2f565979
		.word 0x9f1f77e
		.word 0xea742a5b
		.word 0x7a2b0cc3
		.word 0x37ef0f3f
		.word 0x737d8893
		.word 0xbf95102
		.word 0x77688446
		.word 0x12d1feb
.align 8192
.global  dtte_64kb_data_6
dtte_64kb_data_6: 
		.word 0x8b82b282
		.word 0x585c33ba
		.word 0x97274fb7
		.word 0xc645285b
		.word 0xda256f6e
		.word 0xccc158f9
		.word 0x2267d898
		.word 0x672e847f
		.word 0x5f85934f
		.word 0x5d1c51cc
		.word 0x2d11549c
		.word 0x956da72b
		.word 0x403ea93e
		.word 0x3a1c07c6
		.word 0x1e882e8e
		.word 0x888b9b2e
.align 8192
	.word	0xaabbccdd
	.word	0xaabbccdd
	.word	0xaabbccdd
	.word	0xaabbccdd
.align 4096
	.word 0x50b1e0f0
	.word 0xf8b97635
	.word 0x97c79971
	.word 0xce5c01a4
.align 2048
	.word 0xf2c2d07f
	.word 0x2a5c4297
	.word 0x3edeb1e7
	.word 0xdb742188
.align 1024
	.word 0x44f80e70
	.word 0x2bcbe84c
	.word 0xead3d1d6
	.word 0x4b4adc8d
.align 512
	.word 0xb17ce7f1
	.word 0x915b6b8c
	.word 0x85f6fa48
	.word 0x9ea29d2d
.align 256
	.word 0xff91b762
	.word 0xbb28c79a
	.word 0xd9d67792
	.word 0x675b9201
.align 128
	.word 0x66cc9f16
	.word 0x54288c39
	.word 0xd59723b8
	.word 0x73ddca53
.align 64
	.word 0x1164ac5a
	.word 0xd495e5f
	.word 0xdfa3eb0f
	.word 0xc73007f1
.align 32
	.word 0x85dda6b5
	.word 0x2825028
.align 16
	.word 0x6cbe7724
	.word 0x26c95a44
.align 8
.global  dtte_64kb_data_end
dtte_64kb_data_end:
		.word 0xa90b0f71
		.word 0x4d5a440d
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
		.word 0x92b523dc
		.word 0x4178d6a0
		.word 0x43c5155a
		.word 0x36a5cf55
		.word 0x2aa0a2dc
		.word 0xfca001dc
		.word 0xc1280c5
		.word 0xd31c4fcb
		.word 0x87cdf12a
		.word 0x33b1bf25
		.word 0x3c36dbd3
		.word 0x233c28b0
		.word 0xe39f8314
		.word 0x22b0d80f
		.word 0x63445af6
		.word 0xca015af3
		.word 0x9dfaca50
.align 8192
		.word 0x1c8671ec
.align 8192
		.word 0xb6c549b4
.align 8192
		.word 0x4670ec9f
.align 8192
		.word 0xf3857a64
.align 8192
		.word 0xf2ba0461
.align 8192
		.word 0x2c08ffab
.align 8192
		.word 0x352ed394
.align 8192
.global  dtte_512kb_data_1
dtte_512kb_data_1: 
		.word 0x11482f48
		.word 0x4a99a535
		.word 0xaddca1d4
		.word 0x507b5779
		.word 0x9e825a49
		.word 0xcd7abd6c
		.word 0x1138340b
		.word 0xb9501ef0
		.word 0x3bd5992f
		.word 0xcba87b94
		.word 0xececbece
		.word 0xb245c0c
		.word 0xc0acdba1
		.word 0x3d16975e
		.word 0x25e88d44
		.word 0x862cbff
		.word 0x7f25fac8
.align 8192
		.word 0x8d443a6f
.align 8192
		.word 0x1772c781
.align 8192
		.word 0x77137e17
.align 8192
		.word 0xc20aa733
.align 8192
		.word 0xea242278
.align 8192
		.word 0x7d0fed08
.align 8192
		.word 0x66e695eb
.align 8192
.global  dtte_512kb_data_2
dtte_512kb_data_2: 
		.word 0x69cfd0fa
		.word 0xcd9c5083
		.word 0x2ed4f391
		.word 0x62ec7cd1
		.word 0xc360ee25
		.word 0xaf80d990
		.word 0xe1070e0b
		.word 0x851b3692
		.word 0xcfeec34e
		.word 0x9012ac60
		.word 0x39425fe3
		.word 0x7787cd60
		.word 0x7e4f9284
		.word 0xc244608f
		.word 0xfe422086
		.word 0xd2360907
		.word 0x36f8d472
.align 8192
		.word 0xc69462e8
.align 8192
		.word 0x8f325
.align 8192
		.word 0x13cfe563
.align 8192
		.word 0x6178dfc0
.align 8192
		.word 0x746d12f4
.align 8192
		.word 0xacd076b7
.align 8192
		.word 0x82b97c12
.align 8192
.global  dtte_512kb_data_3
dtte_512kb_data_3: 
		.word 0xa7d922b8
		.word 0x45f0a5d4
		.word 0x78135244
		.word 0x5a0d5569
		.word 0x7b7d32c
		.word 0x921fe250
		.word 0x2475415f
		.word 0xbe5854ab
		.word 0xb4723897
		.word 0x68a80a2f
		.word 0x4b80e4f3
		.word 0x7fabb378
		.word 0x47a6f482
		.word 0xba9584c8
		.word 0xcf6b5c42
		.word 0xcd0ec082
		.word 0x3fe9ed29
.align 8192
		.word 0x78ee1ed9
.align 8192
		.word 0x2789ea2b
.align 8192
		.word 0xc7c15587
.align 8192
		.word 0xbef9be5e
.align 8192
		.word 0x5f0ef396
.align 8192
		.word 0x20262aab
.align 8192
		.word 0xa65b387a
.align 8192
.global  dtte_512kb_data_4
dtte_512kb_data_4: 
		.word 0x6360d4ac
		.word 0x97d75305
		.word 0xe6219ca5
		.word 0x8fe3dc03
		.word 0xeb6a96be
		.word 0x436b3988
		.word 0x46a183e5
		.word 0xf8c1332a
		.word 0x9af74102
		.word 0xdced2cbb
		.word 0x67086762
		.word 0x7e138c4e
		.word 0x993f5788
		.word 0x75389180
		.word 0xe212afc3
		.word 0x9affa75b
		.word 0x4141d230
.align 8192
		.word 0xd6a2cf57
.align 8192
		.word 0xf0402a24
.align 8192
		.word 0x2dc77b3b
.align 8192
		.word 0xada66704
.align 8192
		.word 0xaf5ad4f2
.align 8192
		.word 0xd40c7319
.align 8192
		.word 0x5ba55e8d
.align 8192
.global  dtte_512kb_data_5
dtte_512kb_data_5: 
		.word 0x418f96e2
		.word 0x6963d208
		.word 0x3a148df2
		.word 0xb1648794
		.word 0x196e605e
		.word 0x9a13a69
		.word 0x2a682c40
		.word 0x4eed1771
		.word 0xd3a3bce6
		.word 0x48376652
		.word 0xdf296998
		.word 0xdca92494
		.word 0xeda4c26
		.word 0xa4e56402
		.word 0xad85ff96
		.word 0xe0b7870
		.word 0x5c4d1ac
.align 8192
		.word 0xe731ce8c
.align 8192
		.word 0xc5413624
.align 8192
		.word 0x93d7f46d
.align 8192
		.word 0x6b9468cf
.align 8192
		.word 0xbd8dbdef
.align 8192
		.word 0xb613fc
.align 8192
		.word 0xd658d223
.align 8192
.global  dtte_512kb_data_6
dtte_512kb_data_6: 
		.word 0xd44392cd
		.word 0xd52e2463
		.word 0x37ad936a
		.word 0x4aab32c4
		.word 0xa6018333
		.word 0x2f8d2cf5
		.word 0x6adcdf56
		.word 0x1a00b1d8
		.word 0x8fdb4e81
		.word 0xdf8a6f55
		.word 0xd89bdc81
		.word 0x755aef30
		.word 0x7376df0d
		.word 0x3a0cee
		.word 0x4da4830f
		.word 0xdf214414
		.word 0x5e8dd427
.align 8192
		.word 0x3fe00b37
.align 8192
		.word 0x42afcc44
.align 8192
		.word 0xed4017be
.align 8192
		.word 0xcb14af7d
.align 8192
		.word 0xf3967f48
.align 8192
		.word 0x9cd3892
.align 8192
		.word 0x3d84870c
.align 8192
.global  dtte_512kb_data_7
dtte_512kb_data_7: 
		.word 0xb4dcf4c1
		.word 0x58f25eb0
		.word 0x309e31d3
		.word 0x31de5370
		.word 0xdf471f88
		.word 0x8be40985
		.word 0x8f6ecdd2
		.word 0x665d4d2a
		.word 0xbf839375
		.word 0x354de1bb
		.word 0x44b9b50f
		.word 0xfe5eacb9
		.word 0x262fea96
		.word 0x139c83b9
		.word 0x213d31c3
		.word 0xe4b20f8e
	.word 0xd810460d
.align 8192
	.word 0xf517429
.align 8192
	.word 0x16a3ab21
.align 8192
	.word 0xe2c50c03
.align 8192
	.word 0x8f7a84f2
.align 8192
	.word 0x7b2a570f
.align 8192
	.word 0xe22210de
.align 8192
	.word 0x305f908a
.align 4096
	.word 0x49038578
	.word 0xa79c041d
.align 2048
	.word 0x192faf3
	.word 0x6f6a8229
.align 1024
	.word 0x945cd44e
	.word 0xe4fa0c44
.align 512
	.word 0x9cbd81a1
	.word 0x40dd4e25
.align 256
	.word 0xd8536e47
	.word 0x1418848e
.align 128
	.word 0x49e311b5
	.word 0x88662fd
.align 64
	.word 0xe4c6783c
	.word 0xb3bf2a2a
.align 32
	.word 0xd49fc10d
	.word 0x882dc499
.align 16
	.word 0xc9771130
	.word 0xff2233c8
.align 8
.global  dtte_512kb_data_end
dtte_512kb_data_end:
		.word 0x94dce75a
		.word 0xa6d02fc3
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
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=3, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.data
.global  dtte_4mb_data_0
dtte_4mb_data_0: 
		.word 0x1300a2b6
		.word 0xd0066427
		.word 0x994dff26
		.word 0xa1a480d6
		.word 0x4a5b538f
		.word 0x37b31eb
		.word 0x59ec1318
		.word 0xa18451b4
		.word 0xc5408096
		.word 0xa36f18b3
		.word 0xc3643b77
		.word 0xb6c02fd
		.word 0x88e35fe0
		.word 0xef0f676b
		.word 0xe8b1efec
		.word 0x1d55a47d
		.word 0xa2ee321f
.align 8192
		.word 0xf9261fde
.align 8192
		.word 0x3c66318b
.align 8192
		.word 0x74f570e5
.align 8192
		.word 0xd6a646
.align 8192
		.word 0x3bbdbb8e
.align 8192
		.word 0xdba8d114
.align 8192
		.word 0xe315d0bd
.align 8192
		.word 0x69a25372
.align 8192
		.word 0x8c7be9c7
.align 8192
		.word 0xb2115575
.align 8192
		.word 0x87bc1899
.align 8192
		.word 0xec5e6d08
.align 8192
		.word 0xfaa19af1
.align 8192
		.word 0x53494693
.align 8192
		.word 0x301e768a
.align 8192
		.word 0x541c151a
.align 8192
		.word 0x8fafed26
.align 8192
		.word 0x9e41e049
.align 8192
		.word 0x9306c2d7
.align 8192
		.word 0x2374f10e
.align 8192
		.word 0xc396ce04
.align 8192
		.word 0x21e371b0
.align 8192
		.word 0x89c527ed
.align 8192
		.word 0x43b1e481
.align 8192
		.word 0xde4b65c3
.align 8192
		.word 0xdcbceca0
.align 8192
		.word 0x2e90d593
.align 8192
		.word 0x20e81668
.align 8192
		.word 0xf7f19f89
.align 8192
		.word 0x249e6977
.align 8192
		.word 0xbc643361
.align 8192
		.word 0xeafea478
.align 8192
		.word 0xdfa562fc
.align 8192
		.word 0x2071a318
.align 8192
		.word 0xbb454672
.align 8192
		.word 0x55d1a8c7
.align 8192
		.word 0xcca55319
.align 8192
		.word 0x624faf36
.align 8192
		.word 0xf5c23e58
.align 8192
		.word 0x8ecd75b3
.align 8192
		.word 0x576a2643
.align 8192
		.word 0x7a0376d2
.align 8192
		.word 0xa4755d50
.align 8192
		.word 0x6ea72c02
.align 8192
		.word 0x1d52eb9f
.align 8192
		.word 0x2d1cb301
.align 8192
		.word 0x59e2afb6
.align 8192
		.word 0xd0860f4b
.align 8192
		.word 0x833fd19e
.align 8192
		.word 0xc9af71f3
.align 8192
		.word 0x673546ba
.align 8192
		.word 0xaf433c93
.align 8192
		.word 0xfefa41da
.align 8192
		.word 0x70186830
.align 8192
		.word 0x8888ea54
.align 8192
		.word 0x5b9ba73a
.align 8192
		.word 0xede26626
.align 8192
		.word 0x66de9223
.align 8192
		.word 0xb0c87675
.align 8192
		.word 0x158a8018
.align 8192
		.word 0x66476ae0
.align 8192
		.word 0x864ee9dc
.align 8192
		.word 0x48f8577e
.align 8192
.global  dtte_4mb_data_1
dtte_4mb_data_1: 
		.word 0x3dc06ae2
		.word 0x51511288
		.word 0x7ff73511
		.word 0x5847d9f5
		.word 0x848e25d2
		.word 0xfab66e96
		.word 0x74f12f65
		.word 0xf8bb4175
		.word 0x27df8787
		.word 0xbae6d187
		.word 0xb53f94ec
		.word 0x92ebdae6
		.word 0xd44df729
		.word 0x5d074e38
		.word 0x2692d0ee
		.word 0x697a7dee
		.word 0xd41fc2d0
.align 8192
		.word 0xe5785878
.align 8192
		.word 0x39e354eb
.align 8192
		.word 0x85a431a7
.align 8192
		.word 0x447bf826
.align 8192
		.word 0xbcbc5ad7
.align 8192
		.word 0x51abdbdf
.align 8192
		.word 0x912fe892
.align 8192
		.word 0x5370a34a
.align 8192
		.word 0x66d155c4
.align 8192
		.word 0x566e1dc7
.align 8192
		.word 0x41e787ca
.align 8192
		.word 0x7ae397f7
.align 8192
		.word 0x959cdbd6
.align 8192
		.word 0x8d0b763
.align 8192
		.word 0xcf3dad7c
.align 8192
		.word 0x136428e5
.align 8192
		.word 0xdf2aff69
.align 8192
		.word 0x804d4a3c
.align 8192
		.word 0x4ee4ea96
.align 8192
		.word 0xe856716e
.align 8192
		.word 0xd376056d
.align 8192
		.word 0x8f5218e8
.align 8192
		.word 0x903463be
.align 8192
		.word 0x3571575
.align 8192
		.word 0xd275f17a
.align 8192
		.word 0x5a2aa38c
.align 8192
		.word 0x1b810d85
.align 8192
		.word 0x29409b83
.align 8192
		.word 0x67943f26
.align 8192
		.word 0xf13708a1
.align 8192
		.word 0xc951f7dc
.align 8192
		.word 0x5e29c532
.align 8192
		.word 0x34915c9b
.align 8192
		.word 0xd9322dfb
.align 8192
		.word 0x18c95cc6
.align 8192
		.word 0xb94689ce
.align 8192
		.word 0x90aeba63
.align 8192
		.word 0x9c2f607
.align 8192
		.word 0x1c03664f
.align 8192
		.word 0x440b9738
.align 8192
		.word 0xfac98485
.align 8192
		.word 0x7b950554
.align 8192
		.word 0xc7c6dfbc
.align 8192
		.word 0x1b8e7d0d
.align 8192
		.word 0xb33f58d6
.align 8192
		.word 0x17f9dc54
.align 8192
		.word 0x70f34603
.align 8192
		.word 0x7e1ae608
.align 8192
		.word 0x36378e88
.align 8192
		.word 0xf4db4962
.align 8192
		.word 0xb8daeb7d
.align 8192
		.word 0x6b9783a4
.align 8192
		.word 0xa580e306
.align 8192
		.word 0xbcd47706
.align 8192
		.word 0x816f22d9
.align 8192
		.word 0x7bdb9005
.align 8192
		.word 0x53dca004
.align 8192
		.word 0xf4d71a78
.align 8192
		.word 0x560fa553
.align 8192
		.word 0x24c00a18
.align 8192
		.word 0xbf8d8ed1
.align 8192
		.word 0x43168662
.align 8192
		.word 0x152da826
.align 8192
.global  dtte_4mb_data_2
dtte_4mb_data_2: 
		.word 0xd8c60ff8
		.word 0x20924cef
		.word 0xb64aa5ea
		.word 0x5506553f
		.word 0xd0ddfb93
		.word 0xd557d5e4
		.word 0x5cf923ef
		.word 0xb1bf9b32
		.word 0x7e71258d
		.word 0x182a5652
		.word 0xd2934291
		.word 0xd86d8871
		.word 0x388a7264
		.word 0x7d779c45
		.word 0x181b26f7
		.word 0x1835a5ba
		.word 0xc6180dd4
.align 8192
		.word 0x5857b8cc
.align 8192
		.word 0x6feb9d4c
.align 8192
		.word 0x9c2903d1
.align 8192
		.word 0xa202f87c
.align 8192
		.word 0xad05a6ca
.align 8192
		.word 0xa4699909
.align 8192
		.word 0x34c4f06f
.align 8192
		.word 0xd27f4bc0
.align 8192
		.word 0x493b0b0d
.align 8192
		.word 0x4016f579
.align 8192
		.word 0x295867a
.align 8192
		.word 0xa5c257f1
.align 8192
		.word 0xbdff619f
.align 8192
		.word 0xaef23a7a
.align 8192
		.word 0x13748d75
.align 8192
		.word 0xb97a00ab
.align 8192
		.word 0xaeac2c5c
.align 8192
		.word 0xed876980
.align 8192
		.word 0x7c925c39
.align 8192
		.word 0x2232fb7e
.align 8192
		.word 0x6aecf6c4
.align 8192
		.word 0x7dd216df
.align 8192
		.word 0x41db2e5
.align 8192
		.word 0xfa91d4d0
.align 8192
		.word 0x5e9b4312
.align 8192
		.word 0x85515348
.align 8192
		.word 0x913ac012
.align 8192
		.word 0xe21cdf01
.align 8192
		.word 0x27c3b48d
.align 8192
		.word 0xaeb22994
.align 8192
		.word 0x5748c54b
.align 8192
		.word 0x2e936fd0
.align 8192
		.word 0x4a230b1d
.align 8192
		.word 0x247db4c0
.align 8192
		.word 0xbd790ebb
.align 8192
		.word 0x9bb10ffd
.align 8192
		.word 0x853ec420
.align 8192
		.word 0x75841238
.align 8192
		.word 0x4b13228
.align 8192
		.word 0xd201812e
.align 8192
		.word 0xe026747e
.align 8192
		.word 0xaf8db458
.align 8192
		.word 0x7eddc920
.align 8192
		.word 0x854be16
.align 8192
		.word 0xf9282ffa
.align 8192
		.word 0x7d70d92f
.align 8192
		.word 0x1b7a1a71
.align 8192
		.word 0x8ab058d3
.align 8192
		.word 0x119391cb
.align 8192
		.word 0xa3412985
.align 8192
		.word 0x206466dd
.align 8192
		.word 0xf78ddb97
.align 8192
		.word 0x7b4c3a6b
.align 8192
		.word 0x1a2bc41f
.align 8192
		.word 0x135dcd0e
.align 8192
		.word 0x4f0c0f8a
.align 8192
		.word 0x68a5d6ae
.align 8192
		.word 0x1df23940
.align 8192
		.word 0x4b0ff8c7
.align 8192
		.word 0x69b34def
.align 8192
		.word 0xe4110415
.align 8192
		.word 0x4c1b3a73
.align 8192
		.word 0xf562115c
.align 8192
.global  dtte_4mb_data_3
dtte_4mb_data_3: 
		.word 0x63cb3f85
		.word 0xb5c1a663
		.word 0x19180288
		.word 0xef899b64
		.word 0xf142ae2f
		.word 0xdeec8271
		.word 0x3609b9db
		.word 0xd9db41ac
		.word 0x3b104cd6
		.word 0xcdc3323e
		.word 0x6ac25adb
		.word 0xd92ab96d
		.word 0xd3fd998e
		.word 0x9032c64a
		.word 0x750daca
		.word 0x68c835c1
		.word 0xde3b3df7
.align 8192
		.word 0xb6daa823
.align 8192
		.word 0x8f209ac1
.align 8192
		.word 0x1e1d1e53
.align 8192
		.word 0xa73091e5
.align 8192
		.word 0xc2f6923f
.align 8192
		.word 0x9b064f7
.align 8192
		.word 0xe0d0fd56
.align 8192
		.word 0xb1ee2443
.align 8192
		.word 0x6a4fb10c
.align 8192
		.word 0x6a657a42
.align 8192
		.word 0xab7ad8b8
.align 8192
		.word 0x6cc56e34
.align 8192
		.word 0x90f64145
.align 8192
		.word 0x764373dc
.align 8192
		.word 0xa8726a96
.align 8192
		.word 0x1206147a
.align 8192
		.word 0x2c63f87
.align 8192
		.word 0x2b99fd6a
.align 8192
		.word 0x5f97ecf2
.align 8192
		.word 0x89035b1b
.align 8192
		.word 0xfbcefd24
.align 8192
		.word 0xf145ab3a
.align 8192
		.word 0x94206ca2
.align 8192
		.word 0x798aaf41
.align 8192
		.word 0xc7deae35
.align 8192
		.word 0x393170cc
.align 8192
		.word 0x7fdfd78b
.align 8192
		.word 0x431e6b61
.align 8192
		.word 0xdbf044f5
.align 8192
		.word 0x109a7b93
.align 8192
		.word 0xdb693a0f
.align 8192
		.word 0xa8d639a0
.align 8192
		.word 0x94b2e4d
.align 8192
		.word 0x987075fc
.align 8192
		.word 0xdaf0dfc3
.align 8192
		.word 0xe4f8b871
.align 8192
		.word 0xdf09c3aa
.align 8192
		.word 0x1d4876af
.align 8192
		.word 0x2e634b65
.align 8192
		.word 0x82784582
.align 8192
		.word 0x24b48616
.align 8192
		.word 0x90f92014
.align 8192
		.word 0x92df3a0c
.align 8192
		.word 0xf8b712d8
.align 8192
		.word 0xced7686
.align 8192
		.word 0x545ab418
.align 8192
		.word 0x7bf025a1
.align 8192
		.word 0x2594ea38
.align 8192
		.word 0x63081f70
.align 8192
		.word 0x660e2030
.align 8192
		.word 0x5ec9fa8d
.align 8192
		.word 0x950b42c9
.align 8192
		.word 0x6f2023a1
.align 8192
		.word 0x47da459d
.align 8192
		.word 0xc09df4b3
.align 8192
		.word 0x22c28cf6
.align 8192
		.word 0x9309664c
.align 8192
		.word 0xdf5f01f2
.align 8192
		.word 0xe2bd7a1
.align 8192
		.word 0x2355d899
.align 8192
		.word 0x4922065
.align 8192
		.word 0xa4d1bbd3
.align 8192
		.word 0xa531f601
.align 8192
.global  dtte_4mb_data_4
dtte_4mb_data_4: 
		.word 0x86a83955
		.word 0x6840772f
		.word 0x36f77fe
		.word 0x3b91bc55
		.word 0x8d018d43
		.word 0x203a6814
		.word 0x8f8cba8f
		.word 0xcb25b2e3
		.word 0xdbde89d0
		.word 0xaea01db4
		.word 0xd5ebb87f
		.word 0x67a12aed
		.word 0x47ba32e4
		.word 0xae8e023f
		.word 0xfb859d6d
		.word 0x64a10b25
		.word 0x33d52047
.align 8192
		.word 0x547d2307
.align 8192
		.word 0x247be9a1
.align 8192
		.word 0x28986f5f
.align 8192
		.word 0x4a613540
.align 8192
		.word 0xa30db950
.align 8192
		.word 0xe0b32c4c
.align 8192
		.word 0x1cbb0f88
.align 8192
		.word 0xbcbeae7e
.align 8192
		.word 0x25b0ec6a
.align 8192
		.word 0x6ce89e14
.align 8192
		.word 0xb5b2a1d6
.align 8192
		.word 0x8ee1aa3c
.align 8192
		.word 0xfc642101
.align 8192
		.word 0xf4285fd0
.align 8192
		.word 0x640bac40
.align 8192
		.word 0x68c58e9f
.align 8192
		.word 0xd40169b3
.align 8192
		.word 0xafa26190
.align 8192
		.word 0xd9197930
.align 8192
		.word 0x6745f262
.align 8192
		.word 0x62cdece3
.align 8192
		.word 0x963835df
.align 8192
		.word 0xecd82377
.align 8192
		.word 0xb10aebb4
.align 8192
		.word 0x922853cc
.align 8192
		.word 0x91fe554b
.align 8192
		.word 0x3e4eed81
.align 8192
		.word 0x96b0e960
.align 8192
		.word 0x61c696d9
.align 8192
		.word 0xfc8f9625
.align 8192
		.word 0x816457c9
.align 8192
		.word 0x8d327a2e
.align 8192
		.word 0x1813bb32
.align 8192
		.word 0x8bb9dc84
.align 8192
		.word 0x2638aa8e
.align 8192
		.word 0xd11ca689
.align 8192
		.word 0xa333559a
.align 8192
		.word 0x3af74690
.align 8192
		.word 0x6632e6c6
.align 8192
		.word 0x4e7cc061
.align 8192
		.word 0x6039e677
.align 8192
		.word 0xfb9758fc
.align 8192
		.word 0xc5375253
.align 8192
		.word 0xff00cd52
.align 8192
		.word 0x5f866332
.align 8192
		.word 0xb1afefd4
.align 8192
		.word 0x293e1374
.align 8192
		.word 0x2bb1ef05
.align 8192
		.word 0xcf1a80c1
.align 8192
		.word 0xe725f778
.align 8192
		.word 0xf2f38f7e
.align 8192
		.word 0x64426dd6
.align 8192
		.word 0x6b949381
.align 8192
		.word 0x949a31e7
.align 8192
		.word 0x167380ca
.align 8192
		.word 0xf15f49b7
.align 8192
		.word 0xbf471848
.align 8192
		.word 0xda068c40
.align 8192
		.word 0x5ecaf7f1
.align 8192
		.word 0x940f7553
.align 8192
		.word 0xea173aba
.align 8192
		.word 0xb29cc886
.align 8192
		.word 0x88fcbc36
.align 8192
.global  dtte_4mb_data_5
dtte_4mb_data_5: 
		.word 0x78291f76
		.word 0x9d8cecdb
		.word 0xd13f7fa3
		.word 0x2f06bf43
		.word 0xed87aeab
		.word 0xac1463e6
		.word 0x60fabfaf
		.word 0xf81e9818
		.word 0x39335326
		.word 0xda1a0e5c
		.word 0x5f71ca71
		.word 0xcc463940
		.word 0x375552e4
		.word 0xb8a7575f
		.word 0x728bb825
		.word 0xedb95645
		.word 0x96e27410
.align 8192
		.word 0xf4b7cb40
.align 8192
		.word 0x3f01027f
.align 8192
		.word 0x9dc72c65
.align 8192
		.word 0xd29729a8
.align 8192
		.word 0x49e37155
.align 8192
		.word 0x6f083bf0
.align 8192
		.word 0xbb3a285
.align 8192
		.word 0x36776660
.align 8192
		.word 0xd3746f10
.align 8192
		.word 0x57807727
.align 8192
		.word 0xa675f465
.align 8192
		.word 0xe7be39c6
.align 8192
		.word 0xc9cb484c
.align 8192
		.word 0xd2dc22da
.align 8192
		.word 0xe4da5d14
.align 8192
		.word 0x15479ba6
.align 8192
		.word 0x645650ea
.align 8192
		.word 0xd3f75dc5
.align 8192
		.word 0x45ef74a6
.align 8192
		.word 0xe24109af
.align 8192
		.word 0xff96239c
.align 8192
		.word 0xfc3106f2
.align 8192
		.word 0xb4ff3525
.align 8192
		.word 0xda93db56
.align 8192
		.word 0x43f23200
.align 8192
		.word 0x47ce0e3b
.align 8192
		.word 0xdbdedac5
.align 8192
		.word 0x8a466ff9
.align 8192
		.word 0xaabdc1f0
.align 8192
		.word 0x8e22c90d
.align 8192
		.word 0xf360135a
.align 8192
		.word 0x453f9b48
.align 8192
		.word 0xc3feec18
.align 8192
		.word 0x8764f6e
.align 8192
		.word 0xaf61310e
.align 8192
		.word 0xda9f3e0
.align 8192
		.word 0x3e8e6fc8
.align 8192
		.word 0x7f502540
.align 8192
		.word 0x51a1544e
.align 8192
		.word 0x7aeae838
.align 8192
		.word 0x3640700a
.align 8192
		.word 0xd220b3c6
.align 8192
		.word 0x4758c104
.align 8192
		.word 0x53fbbdc0
.align 8192
		.word 0x4e336df7
.align 8192
		.word 0xbd395767
.align 8192
		.word 0xf8e4d30b
.align 8192
		.word 0x6c30de47
.align 8192
		.word 0xd1641446
.align 8192
		.word 0x861105b2
.align 8192
		.word 0x53da45df
.align 8192
		.word 0xb5e179c
.align 8192
		.word 0x7e79a825
.align 8192
		.word 0x4a1ecfa2
.align 8192
		.word 0xbdc7c394
.align 8192
		.word 0x780cb178
.align 8192
		.word 0xdea8334b
.align 8192
		.word 0x5163c422
.align 8192
		.word 0x641def09
.align 8192
		.word 0xf6627d9a
.align 8192
		.word 0x7fc2bb4d
.align 8192
		.word 0xff51f6d2
.align 8192
		.word 0x93515d5d
.align 8192
.global  dtte_4mb_data_6
dtte_4mb_data_6: 
		.word 0xf6a74634
		.word 0x20691a31
		.word 0xd356af0b
		.word 0xe79e32a0
		.word 0x25483e85
		.word 0xa7e24c40
		.word 0xaa2a0321
		.word 0xbc1c55cd
		.word 0x5a0f59c6
		.word 0x8aed4720
		.word 0xea6663e7
		.word 0x644e6ff8
		.word 0xef3eac4a
		.word 0x40dfae21
		.word 0xe0edc77
		.word 0x18452ac3
		.word 0x219e3ae0
.align 8192
		.word 0x7a0af7d6
.align 8192
		.word 0xa7d30a32
.align 8192
		.word 0x5f136216
.align 8192
		.word 0xb28cdc7b
.align 8192
		.word 0x86d5d8e8
.align 8192
		.word 0x724c1105
.align 8192
		.word 0x75e73d0e
.align 8192
		.word 0xf30b1215
.align 8192
		.word 0x87810826
.align 8192
		.word 0x895e0fee
.align 8192
		.word 0x2ee76235
.align 8192
		.word 0x9cc0f8cf
.align 8192
		.word 0x9c6bafdf
.align 8192
		.word 0xc69dd9be
.align 8192
		.word 0xf932baf4
.align 8192
		.word 0xca6eba5c
.align 8192
		.word 0x71d2073
.align 8192
		.word 0x8152f620
.align 8192
		.word 0xd6547a45
.align 8192
		.word 0xfe491fa0
.align 8192
		.word 0x729e9827
.align 8192
		.word 0x15aa2ed9
.align 8192
		.word 0x88655aac
.align 8192
		.word 0x58ba2993
.align 8192
		.word 0xf7093439
.align 8192
		.word 0x852d2d50
.align 8192
		.word 0xa2e4767
.align 8192
		.word 0xf717d46b
.align 8192
		.word 0xbdd95f34
.align 8192
		.word 0xf0d7ec51
.align 8192
		.word 0xa72fe4e4
.align 8192
		.word 0x566168fa
.align 8192
		.word 0xe3da5085
.align 8192
		.word 0x536d020d
.align 8192
		.word 0xbfb5ac72
.align 8192
		.word 0x9c360054
.align 8192
		.word 0x9791714d
.align 8192
		.word 0xbd360665
.align 8192
		.word 0x54528f3b
.align 8192
		.word 0xc63d1db4
.align 8192
		.word 0xd93aba78
.align 8192
		.word 0xe16d9967
.align 8192
		.word 0xf7905472
.align 8192
		.word 0x1064829f
.align 8192
		.word 0x58e4600d
.align 8192
		.word 0x4d64ce18
.align 8192
		.word 0x4b7a26c8
.align 8192
		.word 0xe2e4a14a
.align 8192
		.word 0xf9495dc7
.align 8192
		.word 0x6a4dfd73
.align 8192
		.word 0xfe3e0523
.align 8192
		.word 0x6c2f5138
.align 8192
		.word 0x8fefb8e5
.align 8192
		.word 0xb345b2
.align 8192
		.word 0x84a80a91
.align 8192
		.word 0xb702aa27
.align 8192
		.word 0xbe088b3e
.align 8192
		.word 0x683f39cb
.align 8192
		.word 0x5f5c17a
.align 8192
		.word 0xbc14292c
.align 8192
		.word 0xaedd2b97
.align 8192
		.word 0xb3e2853d
.align 8192
		.word 0xe9aef615
.align 8192
.global  dtte_4mb_data_7
dtte_4mb_data_7: 
		.word 0x2f66841c
		.word 0x39760738
		.word 0xd9c9880b
		.word 0xd114bc1d
		.word 0xcd9ecf2e
		.word 0x38dd00bc
		.word 0x2c412f08
		.word 0x18e9bc3
		.word 0xcbd3d8de
		.word 0xe2266829
		.word 0x14da8c55
		.word 0x1f8919e6
		.word 0xfe9ce013
		.word 0xbe88e040
		.word 0x4a10f428
		.word 0xc0b80f80
		.word 0xf1d30883
.align 8192
		.word 0x9b7dc515
.align 8192
		.word 0x11aea1ce
.align 8192
		.word 0xb4e28463
.align 8192
		.word 0xc3cb3156
.align 8192
		.word 0xf068e7e1
.align 8192
		.word 0x3b6828f2
.align 8192
		.word 0xc4850126
.align 8192
		.word 0x4b041209
.align 8192
		.word 0xb1dfb416
.align 8192
		.word 0x87e7371f
.align 8192
		.word 0x17f28c59
.align 8192
		.word 0x269ec195
.align 8192
		.word 0x6b9511b3
.align 8192
		.word 0x1d016983
.align 8192
		.word 0xff6bc6ff
.align 8192
		.word 0x86b60bcf
.align 8192
		.word 0x747098d9
.align 8192
		.word 0x70603af5
.align 8192
		.word 0xa026dc3d
.align 8192
		.word 0xc0b3912
.align 8192
		.word 0xa9acea9e
.align 8192
		.word 0xf2ab4e38
.align 8192
		.word 0x42ba384e
.align 8192
		.word 0x4cc52c1a
.align 8192
		.word 0xef424321
.align 8192
		.word 0x7e969881
.align 8192
		.word 0x73ab9
.align 8192
		.word 0xb068fa32
.align 8192
		.word 0xaa9f98de
.align 8192
		.word 0xa54a3036
.align 8192
		.word 0x21e157c6
.align 8192
		.word 0x2e016192
.align 8192
		.word 0xa05dd43
.align 8192
		.word 0xecb1c3f8
.align 8192
		.word 0x3f815d2d
.align 8192
		.word 0x66dcc201
.align 8192
		.word 0x83fe3283
.align 8192
		.word 0xc09dfde3
.align 8192
		.word 0x629bce11
.align 8192
		.word 0xe49f7bc2
.align 8192
		.word 0xf89d2aa9
.align 8192
		.word 0x85825714
.align 8192
		.word 0x3ec8a2c
.align 8192
		.word 0x54e2d8ad
.align 8192
		.word 0xfed263ef
.align 8192
		.word 0xff3e1f6b
.align 8192
		.word 0x8c79344a
.align 8192
		.word 0x4576e39b
.align 8192
		.word 0x7c251650
.align 8192
		.word 0x3007bd91
.align 8192
		.word 0x16ef0bfb
.align 8192
		.word 0x94dfd207
.align 8192
		.word 0xd233665b
.align 8192
		.word 0x4f7d6b3c
.align 8192
		.word 0x31982e83
.align 8192
		.word 0xd90de3f1
.align 8192
		.word 0xec539149
.align 8192
		.word 0x604ef1b1
.align 8192
		.word 0x58af7315
.align 8192
		.word 0xe4d8de05
.align 8192
		.word 0xd6134651
.align 8192
		.word 0xe0282a8a
.align 8192
	.word 0x39995640
.align 4096
	.word 0x31b681fd
	.word 0x6242c13b
.align 2048
	.word 0xb9bc48b9
	.word 0xacfba8a9
.align 1024
	.word 0xc8b5a942
	.word 0xbefe7a33
.align 512
	.word 0xf04e2dcc
	.word 0xcf14f4fa
.align 256
	.word 0xba3de5d9
	.word 0xa7037edf
.align 128
	.word 0xdf124f71
	.word 0xfe4fd11a
.align 64
	.word 0xd1adcd7d
	.word 0x90c7c8b3
.align 32
	.word 0x918af13d
	.word 0x8f1d8e9e
.align 16
	.word 0xe6f05307
	.word 0xb9912483
.align 8
.global  dtte_4mb_data_end
dtte_4mb_data_end:
		.word 0xe4c7b6a8
		.word 0x24e6fe7e
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
		.word 0x8ec3d216
		.word 0xfb5a7f59
		.word 0x487dd15c
		.word 0x41993c0b
		.word 0x68f3b0eb
		.word 0xd900ac88
		.word 0x1a7e4fae
		.word 0x5b3fb320
		.word 0x846fbc94
		.word 0x422cf901
		.word 0x7b644f6c
		.word 0xb07bd598
		.word 0x423aa34c
		.word 0x1051fe4
		.word 0xe8ad18d9
		.word 0xecbe33ff
.align 1024
	.word 0x6bdb3121
	.word 0x240d745a
.align 512
.global  dtte_8kb1_data_1
dtte_8kb1_data_1:
		.word 0xeb0865f5
		.word 0x2b2bed8b
		.word 0x5e9232d7
		.word 0xb02354a1
		.word 0x4fcf5a00
		.word 0xf656ab4c
		.word 0xe451230c
		.word 0x76433a68
		.word 0x674ed41
		.word 0xe29c9aa2
		.word 0xa48c059c
		.word 0xa02efc5c
		.word 0x2eaad103
		.word 0x64691af0
		.word 0xb3c31546
		.word 0xcb3e1502
.align 1024
	.word 0xc6220fdf
	.word 0x91e6128e
.align 512
	.word 0x4747278f
	.word 0xd2eb02c7
.align 256
.global  dtte_8kb1_data_2
dtte_8kb1_data_2:
		.word 0xd57eee41
		.word 0xd4391f03
		.word 0xad85eae6
		.word 0x8a4e1554
		.word 0xdf8bcf24
		.word 0xd6671474
		.word 0x80596308
		.word 0xf5e73c27
		.word 0x942f211f
		.word 0xa2ab8056
		.word 0x58a847a5
		.word 0x531daa5f
		.word 0x8e6497a5
		.word 0x31b9236a
		.word 0xbf5b2943
		.word 0xa9f563d6
.align 1024
	.word 0xe1ba3488
	.word 0x3d3396eb
.align 512
	.word 0x79848063
	.word 0x64e80774
.align 256
	.word 0xe4d5e5bf
	.word 0xef019100
.align 128
.global  dtte_8kb1_data_3
dtte_8kb1_data_3:
		.word 0xcad80ae1
		.word 0xabcf6ac2
		.word 0x7390bb68
		.word 0xbd1a7c77
		.word 0xb4701ba0
		.word 0x6a5dabd
		.word 0x9080fa0f
		.word 0xc6957b4
		.word 0x44a5c066
		.word 0x34c915ec
		.word 0x1b9c8d30
		.word 0xf08a0ee7
		.word 0x99aae203
		.word 0x9aaa53b4
		.word 0x46319dfa
		.word 0xd8c5c57c
.align 1024
	.word 0x81e3c2b9
	.word 0x2ba6eceb
.align 512
	.word 0x8c0b5255
	.word 0x3805c2d7
.align 256
.global  dtte_8kb1_data_4
dtte_8kb1_data_4:
		.word 0x8cef7ed7
		.word 0x1d6a79aa
		.word 0x9274f826
		.word 0x2cbbf641
		.word 0xad2573a6
		.word 0xe6f47866
		.word 0x302e20d1
		.word 0xa3b461c
		.word 0x2547b089
		.word 0x4c68d241
		.word 0xa18670ff
		.word 0x5e91e5e
		.word 0xb788d65f
		.word 0x5373d09e
		.word 0x220028a1
		.word 0x8354f23c
.align 1024
	.word 0xd406092b
	.word 0x977f57f2
.align 512
.global  dtte_8kb1_data_5
dtte_8kb1_data_5:
		.word 0xad44a733
		.word 0xd1d9a525
		.word 0xb3bbd7f7
		.word 0x4a807be1
		.word 0xe4267045
		.word 0x20380ef1
		.word 0xdc073ef4
		.word 0x4c01c089
		.word 0x24207436
		.word 0xe5d90f5a
		.word 0xd43227e6
		.word 0xc57f9d18
		.word 0xf07aa143
		.word 0xa958e4aa
		.word 0xe49d0cbe
		.word 0x1e7213a4
.align 1024
	.word 0x483800bf
	.word 0x77e4b9b6
.align 512
	.word 0x6c0da088
	.word 0x64b7723a
.align 256
.global  dtte_8kb1_data_6
dtte_8kb1_data_6:
		.word 0x5b72e4a3
		.word 0x5c0e9f0a
		.word 0xbdc4a287
		.word 0x54c19137
		.word 0xfa0fe949
		.word 0xec4b6365
		.word 0x7b3f9d
		.word 0x712822d6
		.word 0xc4f8cf74
		.word 0x9490ff67
		.word 0x3d8aa5f0
		.word 0x5857e80a
		.word 0x9e9c7293
		.word 0x72c38888
		.word 0xae86aecb
		.word 0x1a3fde8e
.align 1024
	.word 0x8f815f46
	.word 0x9609df4c
.align 512
	.word 0x78bec2c1
	.word 0x645abc39
.align 256
	.word 0x948cce21
	.word 0xbd028cb4
.align 128
	.word 0xe7a65c17
	.word 0x31844b96
.align 64
	.word 0xde7806af
	.word 0x916482f7
.align 32
	.word 0xfb58cb63
	.word 0x59ef7db4
.align 16
	.word 0x790a6eb8
	.word 0x101eb572
.align 8
.global  dtte_8kb1_data_end
dtte_8kb1_data_end:
		.word 0xcd822270
		.word 0xf8b4539

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
		.word 0x2d4ec9c7
		.word 0xb6c4bbdc
		.word 0xf316964
		.word 0x81718ebd
		.word 0x905e6ce6
		.word 0x1145f4bd
		.word 0x43b68224
		.word 0x9edcea54
		.word 0x68c56aab
		.word 0xf0cfdb20
		.word 0x91f05df7
		.word 0x24d6ba6c
		.word 0x32efb78
		.word 0x75938387
		.word 0x24966969
		.word 0xc298fbd9
.align 8192
.end

