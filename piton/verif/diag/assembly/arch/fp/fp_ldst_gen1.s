// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fp_ldst_gen1.s
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
/***********************************************************************
 * Name:   fp_ldst_gen1.s
 *
 *  Description:
 *  	General fp load store test - should be using st load bypass.
 *
 **********************************************************************/

#define ENABLE_T0_Fp_disabled_0x20
#include "boot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

.text
.global main  

main:

        wr      	%g0, 0x04, %fprs         /* make sure fef is 1 */

	setx		data0, %l0, %l1
	setx		data1, %l0, %l2

/*******************************************************
 * Simple ld/st
 *******************************************************/

	set		0x09, %g2
	set		0x00, %g7		! just a flag

	ldst_loop0:

	sub		%g2, 0x01, %g2

	brz		%g7, dp_ldst			
	andn		%g7, 0x01, %g7		! flip
	ba,a		sp_ldst
	nop

dp_ldst:

	ldd		[%l1+0x00], %f0
	ldd		[%l1+0x08], %f2
	ldd		[%l1+0x010], %f32
	ldd		[%l1+0x018], %f34


	fdivd		%f0, %f0, %f0
	fdivd		%f2, %f0, %f2
	fdivd		%f32, %f0, %f32
	fdivd		%f34, %f0, %f34

!	fsqrtd		%f0, %f0
!	fsqrtd		%f2, %f2
!	fsqrtd		%f32, %f32
!	fsqrtd		%f34, %f34

	std		%f0, [%l1+0x00]
	std		%f2, [%l1+0x08]
	std		%f32, [%l1+0x010]
	std		%f34, [%l1+0x018]

	brnz,a		%g2, ldst_loop0
	nop
	ba		end_loop0
	nop

sp_ldst:

	ld		[%l1+0x04], %f1
	ld		[%l1+0x0c], %f3
	ld		[%l1+0x014], %f33
	ld		[%l1+0x01c], %f35

	fdivs		%f1, %f1, %f1
	fdivs		%f3, %f1, %f3
	fdivs		%f33, %f1, %f33
	fdivs		%f35, %f1, %f35

!	fsqrts		%f1, %f1
!	fsqrts		%f3, %f3
!	fsqrts		%f33, %f33
!	fsqrts		%f35, %f35

	st		%f1, [%l1+0x04]
	st		%f3, [%l1+0x0c]
	st		%f33, [%l1+0x014]
	st		%f35, [%l1+0x01c]

	brnz,a		%g2, ldst_loop0
	nop
	ba		end_loop0
	nop

end_loop0:

	ta		T_GOOD_TRAP

/*******************************************************
 * Data section 
 *******************************************************/
	
.data

data0:
	.word		0x0cabcd10
	.word		0x0cabcd11
	.word		0x0cabcd12
	.word		0x0cabcd13
	.word		0x0cabcd14
	.word		0x0cabcd15
	.word		0x0cabcd16
	.word		0x0cabcd17
	.word		0x0cabcd18
	.word		0x0cabcd19
	.word		0x0cabcd1a
	.word		0x0cabcd1b
	.word		0x0cabcd1c
	.word		0x0cabcd1d
	.word		0x0cabcd1e
	.word		0x0cabcd1f

.align 256

data1:
	.word		0x04abcd10
	.word		0x04abcd11
	.word		0x04abcd12
	.word		0x04abcd13
	.word		0x04abcd14
	.word		0x04abcd15
	.word		0x04abcd16
	.word		0x04abcd17
	.word		0x04abcd18
	.word		0x04abcd19
	.word		0x04abcd1a
	.word		0x04abcd1b
	.word		0x04abcd1c
	.word		0x04abcd1d
	.word		0x04abcd1e
	.word		0x04abcd1f
