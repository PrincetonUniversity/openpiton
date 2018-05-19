// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fsmuld_msb_ninf.s
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
* Name:   fsmuld_msb_ninf.s
* Date:   11/6/02
*
*
**********************************************************************/

#define ENABLE_T0_Fp_disabled_0x20
#include "boot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

.text
.global main

! Testing fsmuld with rounding mode ninf

!// fsmuld_msb_ninf
!//
!//	Test FSMULD on corner cases of carry into MSB out of multiplier
!//		in round to negative infinity mode
!//	Inputs are all combinations of positive and negative and:
!//		- fraction is 0
!//		- maximum fraction


main:

	! Common code

	wr		%g0, 0x4, %fprs		! make sure fef is 1 
	setx		source1, %l0, %l1
	setx		source2, %l0, %l2
	setx		result, %l0, %l3
	setx		fcc_result, %l0, %l4
	setx		cexc_flag, %l0, %l5
	setx		fsr_rounding_mode, %l0, %l6
	setx		scratch, %l0, %l7


	set		256, %g1		! Set loop count
	set		0x0, %g2		! Set loop iterator


fsmuld_loop:
	ldx		[%l6+0x0], %fsr


	! instruction specific code

	sll		%g2, 0x2, %g3

	ldx		[%l6], %fsr		! Load fsr with rounding mode
	ld		[%l1+%g3], %f0		! Load source 1
	ld		[%l2+%g3], %f2		! Load source 2
	fsmuld		%f0, %f2, %f4		! Perform the operation
	std		%f4, [%l7+0x0]		! Store the result for comparison
	stx		%fsr, [%l7+0x8]		! Store the fsr for comparison
	ldx		[%l7+0x0], %g4		! Load result from memory for comparison

        ldx     [%l7+0x8], %g5   ! Load fsr from memory for comparison
        sll     %g2, 0x3, %g3
        ldx     [%l5+%g3], %g6   ! Load fsr with expected cexc mode
        mov     0x0f, %g3              ! Mask for nv
        and     %g3, %g6, %g7          ! Mask off nv
        srl     %g7, 0x3, %g7          ! Shift to get of
        or      %g7, %g6, %g6          ! Generate correct nx with of
        mov     0x01, %g3              ! Mask to get nx
        and     %g3, %g6, %g7          ! Mask off all but nx
        sll     %g7, 0x2, %g7          ! Shift to align nx and uf
        or      %g7, 0x1b, %g7         ! Mask for all cexc bits
        and     %g7, %g6, %g6          ! Generate correct uf for denorm
	      sll     %g6, 0x5, %g7          ! Generate aexc
	      or      %g6, %g7, %g7          ! Generate expected fsr
	      ldx     [%l6], %g6        ! Load fsr with rounding mode
	      or      %g6, %g7, %g7          ! Generate expected fsr

	sll		%g2, 0x3, %g3
	ldx		[%l3+%g3], %g6		! Load expected result

	subcc		%g4, %g6, %g0		! Compare
	bne,a		test_fail		! If not equal, test failed
	nop
	subcc		%g5, %g7, %g0		! Compare
	bne,a		test_fail		! If not equal, test failed
	nop


	add		%g2, 0x1, %g2		! Increment loop iterator
	subcc		%g2, %g1, %g0		! Compare
	bne,a		fsmuld_loop		! Loop
	nop


/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
	ta		T_GOOD_TRAP

test_fail:
	ta		T_BAD_TRAP




/*******************************************************
* Data section
*******************************************************/
.data


fsr_rounding_mode:
	.xword		0x00000000c0000000


source1:
	.word		0x5f000000
	.word		0x5f000000
	.word		0x5f000001
	.word		0x5f7fffff
	.word		0x5f800000
	.word		0x5f800000
	.word		0x5f800001
	.word		0x5fffffff
	.word		0x3f800000
	.word		0x3f800000
	.word		0x3f800001
	.word		0x3fffffff
	.word		0x40000000
	.word		0x40000000
	.word		0x40000001
	.word		0x407fffff
	.word		0x1f800000
	.word		0x1f800000
	.word		0x1f800001
	.word		0x1fffffff
	.word		0x1f800000
	.word		0x1f800000
	.word		0x1f800001
	.word		0x1fffffff
	.word		0x3f800000
	.word		0x3f800000
	.word		0x3f800001
	.word		0x3fffffff
	.word		0x3f000000
	.word		0x3f000000
	.word		0x3f000001
	.word		0x3f7fffff
	.word		0x5f800000
	.word		0x5fffffff
	.word		0x5fffffff
	.word		0x5fffffff
	.word		0x5f800000
	.word		0x5fffffff
	.word		0x5fffffff
	.word		0x5fffffff
	.word		0x3f800000
	.word		0x3fffffff
	.word		0x3fffffff
	.word		0x3fffffff
	.word		0x00000001
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x20000000
	.word		0x207fffff
	.word		0x207fffff
	.word		0x207fffff
	.word		0x1f800000
	.word		0x1fffffff
	.word		0x1fffffff
	.word		0x1fffffff
	.word		0x00000001
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x00000001
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x5f000000
	.word		0x5f000000
	.word		0x5f000001
	.word		0x5f7fffff
	.word		0x5f800000
	.word		0x5f800000
	.word		0x5f800001
	.word		0x5fffffff
	.word		0x3f800000
	.word		0x3f800000
	.word		0x3f800001
	.word		0x3fffffff
	.word		0x40000000
	.word		0x40000000
	.word		0x40000001
	.word		0x407fffff
	.word		0x1f800000
	.word		0x1f800000
	.word		0x1f800001
	.word		0x1fffffff
	.word		0x1f800000
	.word		0x1f800000
	.word		0x1f800001
	.word		0x1fffffff
	.word		0x3f800000
	.word		0x3f800000
	.word		0x3f800001
	.word		0x3fffffff
	.word		0x3f000000
	.word		0x3f000000
	.word		0x3f000001
	.word		0x3f7fffff
	.word		0x5f800000
	.word		0x5fffffff
	.word		0x5fffffff
	.word		0x5fffffff
	.word		0x5f800000
	.word		0x5fffffff
	.word		0x5fffffff
	.word		0x5fffffff
	.word		0x3f800000
	.word		0x3fffffff
	.word		0x3fffffff
	.word		0x3fffffff
	.word		0x00000001
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x20000000
	.word		0x207fffff
	.word		0x207fffff
	.word		0x207fffff
	.word		0x1f800000
	.word		0x1fffffff
	.word		0x1fffffff
	.word		0x1fffffff
	.word		0x00000001
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x00000001
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0xdf000000
	.word		0xdf000000
	.word		0xdf000001
	.word		0xdf7fffff
	.word		0xdf800000
	.word		0xdf800000
	.word		0xdf800001
	.word		0xdfffffff
	.word		0xbf800000
	.word		0xbf800000
	.word		0xbf800001
	.word		0xbfffffff
	.word		0xc0000000
	.word		0xc0000000
	.word		0xc0000001
	.word		0xc07fffff
	.word		0x9f800000
	.word		0x9f800000
	.word		0x9f800001
	.word		0x9fffffff
	.word		0x9f800000
	.word		0x9f800000
	.word		0x9f800001
	.word		0x9fffffff
	.word		0xbf800000
	.word		0xbf800000
	.word		0xbf800001
	.word		0xbfffffff
	.word		0xbf000000
	.word		0xbf000000
	.word		0xbf000001
	.word		0xbf7fffff
	.word		0xdf800000
	.word		0xdfffffff
	.word		0xdfffffff
	.word		0xdfffffff
	.word		0xdf800000
	.word		0xdfffffff
	.word		0xdfffffff
	.word		0xdfffffff
	.word		0xbf800000
	.word		0xbfffffff
	.word		0xbfffffff
	.word		0xbfffffff
	.word		0x80000001
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0xa0000000
	.word		0xa07fffff
	.word		0xa07fffff
	.word		0xa07fffff
	.word		0x9f800000
	.word		0x9fffffff
	.word		0x9fffffff
	.word		0x9fffffff
	.word		0x80000001
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0x80000001
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0xdf000000
	.word		0xdf000000
	.word		0xdf000001
	.word		0xdf7fffff
	.word		0xdf800000
	.word		0xdf800000
	.word		0xdf800001
	.word		0xdfffffff
	.word		0xbf800000
	.word		0xbf800000
	.word		0xbf800001
	.word		0xbfffffff
	.word		0xc0000000
	.word		0xc0000000
	.word		0xc0000001
	.word		0xc07fffff
	.word		0x9f800000
	.word		0x9f800000
	.word		0x9f800001
	.word		0x9fffffff
	.word		0x9f800000
	.word		0x9f800000
	.word		0x9f800001
	.word		0x9fffffff
	.word		0xbf800000
	.word		0xbf800000
	.word		0xbf800001
	.word		0xbfffffff
	.word		0xbf000000
	.word		0xbf000000
	.word		0xbf000001
	.word		0xbf7fffff
	.word		0xdf800000
	.word		0xdfffffff
	.word		0xdfffffff
	.word		0xdfffffff
	.word		0xdf800000
	.word		0xdfffffff
	.word		0xdfffffff
	.word		0xdfffffff
	.word		0xbf800000
	.word		0xbfffffff
	.word		0xbfffffff
	.word		0xbfffffff
	.word		0x80000001
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0xa0000000
	.word		0xa07fffff
	.word		0xa07fffff
	.word		0xa07fffff
	.word		0x9f800000
	.word		0x9fffffff
	.word		0x9fffffff
	.word		0x9fffffff
	.word		0x80000001
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0x80000001
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
.align 8


source2:
	.word		0x5f800000
	.word		0x5fffffff
	.word		0x5fffffff
	.word		0x5fffffff
	.word		0x5f800000
	.word		0x5fffffff
	.word		0x5fffffff
	.word		0x5fffffff
	.word		0x3f800000
	.word		0x3fffffff
	.word		0x3fffffff
	.word		0x3fffffff
	.word		0x00000001
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x20000000
	.word		0x207fffff
	.word		0x207fffff
	.word		0x207fffff
	.word		0x1f800000
	.word		0x1fffffff
	.word		0x1fffffff
	.word		0x1fffffff
	.word		0x00000001
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x00000001
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x5f000000
	.word		0x5f000000
	.word		0x5f000001
	.word		0x5f7fffff
	.word		0x5f800000
	.word		0x5f800000
	.word		0x5f800001
	.word		0x5fffffff
	.word		0x3f800000
	.word		0x3f800000
	.word		0x3f800001
	.word		0x3fffffff
	.word		0x40000000
	.word		0x40000000
	.word		0x40000001
	.word		0x407fffff
	.word		0x1f800000
	.word		0x1f800000
	.word		0x1f800001
	.word		0x1fffffff
	.word		0x1f800000
	.word		0x1f800000
	.word		0x1f800001
	.word		0x1fffffff
	.word		0x3f800000
	.word		0x3f800000
	.word		0x3f800001
	.word		0x3fffffff
	.word		0x3f000000
	.word		0x3f000000
	.word		0x3f000001
	.word		0x3f7fffff
	.word		0xdf800000
	.word		0xdfffffff
	.word		0xdfffffff
	.word		0xdfffffff
	.word		0xdf800000
	.word		0xdfffffff
	.word		0xdfffffff
	.word		0xdfffffff
	.word		0xbf800000
	.word		0xbfffffff
	.word		0xbfffffff
	.word		0xbfffffff
	.word		0x80000001
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0xa0000000
	.word		0xa07fffff
	.word		0xa07fffff
	.word		0xa07fffff
	.word		0x9f800000
	.word		0x9fffffff
	.word		0x9fffffff
	.word		0x9fffffff
	.word		0x80000001
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0x80000001
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0xdf000000
	.word		0xdf000000
	.word		0xdf000001
	.word		0xdf7fffff
	.word		0xdf800000
	.word		0xdf800000
	.word		0xdf800001
	.word		0xdfffffff
	.word		0xbf800000
	.word		0xbf800000
	.word		0xbf800001
	.word		0xbfffffff
	.word		0xc0000000
	.word		0xc0000000
	.word		0xc0000001
	.word		0xc07fffff
	.word		0x9f800000
	.word		0x9f800000
	.word		0x9f800001
	.word		0x9fffffff
	.word		0x9f800000
	.word		0x9f800000
	.word		0x9f800001
	.word		0x9fffffff
	.word		0xbf800000
	.word		0xbf800000
	.word		0xbf800001
	.word		0xbfffffff
	.word		0xbf000000
	.word		0xbf000000
	.word		0xbf000001
	.word		0xbf7fffff
	.word		0x5f800000
	.word		0x5fffffff
	.word		0x5fffffff
	.word		0x5fffffff
	.word		0x5f800000
	.word		0x5fffffff
	.word		0x5fffffff
	.word		0x5fffffff
	.word		0x3f800000
	.word		0x3fffffff
	.word		0x3fffffff
	.word		0x3fffffff
	.word		0x00000001
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x20000000
	.word		0x207fffff
	.word		0x207fffff
	.word		0x207fffff
	.word		0x1f800000
	.word		0x1fffffff
	.word		0x1fffffff
	.word		0x1fffffff
	.word		0x00000001
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x00000001
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x5f000000
	.word		0x5f000000
	.word		0x5f000001
	.word		0x5f7fffff
	.word		0x5f800000
	.word		0x5f800000
	.word		0x5f800001
	.word		0x5fffffff
	.word		0x3f800000
	.word		0x3f800000
	.word		0x3f800001
	.word		0x3fffffff
	.word		0x40000000
	.word		0x40000000
	.word		0x40000001
	.word		0x407fffff
	.word		0x1f800000
	.word		0x1f800000
	.word		0x1f800001
	.word		0x1fffffff
	.word		0x1f800000
	.word		0x1f800000
	.word		0x1f800001
	.word		0x1fffffff
	.word		0x3f800000
	.word		0x3f800000
	.word		0x3f800001
	.word		0x3fffffff
	.word		0x3f000000
	.word		0x3f000000
	.word		0x3f000001
	.word		0x3f7fffff
	.word		0xdf800000
	.word		0xdfffffff
	.word		0xdfffffff
	.word		0xdfffffff
	.word		0xdf800000
	.word		0xdfffffff
	.word		0xdfffffff
	.word		0xdfffffff
	.word		0xbf800000
	.word		0xbfffffff
	.word		0xbfffffff
	.word		0xbfffffff
	.word		0x80000001
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0xa0000000
	.word		0xa07fffff
	.word		0xa07fffff
	.word		0xa07fffff
	.word		0x9f800000
	.word		0x9fffffff
	.word		0x9fffffff
	.word		0x9fffffff
	.word		0x80000001
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0x80000001
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0xdf000000
	.word		0xdf000000
	.word		0xdf000001
	.word		0xdf7fffff
	.word		0xdf800000
	.word		0xdf800000
	.word		0xdf800001
	.word		0xdfffffff
	.word		0xbf800000
	.word		0xbf800000
	.word		0xbf800001
	.word		0xbfffffff
	.word		0xc0000000
	.word		0xc0000000
	.word		0xc0000001
	.word		0xc07fffff
	.word		0x9f800000
	.word		0x9f800000
	.word		0x9f800001
	.word		0x9fffffff
	.word		0x9f800000
	.word		0x9f800000
	.word		0x9f800001
	.word		0x9fffffff
	.word		0xbf800000
	.word		0xbf800000
	.word		0xbf800001
	.word		0xbfffffff
	.word		0xbf000000
	.word		0xbf000000
	.word		0xbf000001
	.word		0xbf7fffff
.align 8


result:
	.xword		0x47e0000000000000
	.xword		0x47efffffe0000000
	.xword		0x47f000000fffffe0
	.xword		0x47ffffffc0000020
	.xword		0x47f0000000000000
	.xword		0x47ffffffe0000000
	.xword		0x480000000fffffe0
	.xword		0x480fffffc0000020
	.xword		0x3ff0000000000000
	.xword		0x3fffffffe0000000
	.xword		0x400000000fffffe0
	.xword		0x400fffffc0000020
	.xword		0x36b0000000000000
	.xword		0x381fffffc0000000
	.xword		0x381fffffffffff80
	.xword		0x382fffffa0000040
	.xword		0x3800000000000000
	.xword		0x380fffffe0000000
	.xword		0x381000000fffffe0
	.xword		0x381fffffc0000020
	.xword		0x37f0000000000000
	.xword		0x37ffffffe0000000
	.xword		0x380000000fffffe0
	.xword		0x380fffffc0000020
	.xword		0x36a0000000000000
	.xword		0x380fffffc0000000
	.xword		0x380fffffffffff80
	.xword		0x381fffffa0000040
	.xword		0x3690000000000000
	.xword		0x37ffffffc0000000
	.xword		0x37ffffffffffff80
	.xword		0x380fffffa0000040
	.xword		0x47e0000000000000
	.xword		0x47efffffe0000000
	.xword		0x47f000000fffffe0
	.xword		0x47ffffffc0000020
	.xword		0x47f0000000000000
	.xword		0x47ffffffe0000000
	.xword		0x480000000fffffe0
	.xword		0x480fffffc0000020
	.xword		0x3ff0000000000000
	.xword		0x3fffffffe0000000
	.xword		0x400000000fffffe0
	.xword		0x400fffffc0000020
	.xword		0x36b0000000000000
	.xword		0x381fffffc0000000
	.xword		0x381fffffffffff80
	.xword		0x382fffffa0000040
	.xword		0x3800000000000000
	.xword		0x380fffffe0000000
	.xword		0x381000000fffffe0
	.xword		0x381fffffc0000020
	.xword		0x37f0000000000000
	.xword		0x37ffffffe0000000
	.xword		0x380000000fffffe0
	.xword		0x380fffffc0000020
	.xword		0x36a0000000000000
	.xword		0x380fffffc0000000
	.xword		0x380fffffffffff80
	.xword		0x381fffffa0000040
	.xword		0x3690000000000000
	.xword		0x37ffffffc0000000
	.xword		0x37ffffffffffff80
	.xword		0x380fffffa0000040
	.xword		0xc7e0000000000000
	.xword		0xc7efffffe0000000
	.xword		0xc7f000000fffffe0
	.xword		0xc7ffffffc0000020
	.xword		0xc7f0000000000000
	.xword		0xc7ffffffe0000000
	.xword		0xc80000000fffffe0
	.xword		0xc80fffffc0000020
	.xword		0xbff0000000000000
	.xword		0xbfffffffe0000000
	.xword		0xc00000000fffffe0
	.xword		0xc00fffffc0000020
	.xword		0xb6b0000000000000
	.xword		0xb81fffffc0000000
	.xword		0xb81fffffffffff80
	.xword		0xb82fffffa0000040
	.xword		0xb800000000000000
	.xword		0xb80fffffe0000000
	.xword		0xb81000000fffffe0
	.xword		0xb81fffffc0000020
	.xword		0xb7f0000000000000
	.xword		0xb7ffffffe0000000
	.xword		0xb80000000fffffe0
	.xword		0xb80fffffc0000020
	.xword		0xb6a0000000000000
	.xword		0xb80fffffc0000000
	.xword		0xb80fffffffffff80
	.xword		0xb81fffffa0000040
	.xword		0xb690000000000000
	.xword		0xb7ffffffc0000000
	.xword		0xb7ffffffffffff80
	.xword		0xb80fffffa0000040
	.xword		0xc7e0000000000000
	.xword		0xc7efffffe0000000
	.xword		0xc7f000000fffffe0
	.xword		0xc7ffffffc0000020
	.xword		0xc7f0000000000000
	.xword		0xc7ffffffe0000000
	.xword		0xc80000000fffffe0
	.xword		0xc80fffffc0000020
	.xword		0xbff0000000000000
	.xword		0xbfffffffe0000000
	.xword		0xc00000000fffffe0
	.xword		0xc00fffffc0000020
	.xword		0xb6b0000000000000
	.xword		0xb81fffffc0000000
	.xword		0xb81fffffffffff80
	.xword		0xb82fffffa0000040
	.xword		0xb800000000000000
	.xword		0xb80fffffe0000000
	.xword		0xb81000000fffffe0
	.xword		0xb81fffffc0000020
	.xword		0xb7f0000000000000
	.xword		0xb7ffffffe0000000
	.xword		0xb80000000fffffe0
	.xword		0xb80fffffc0000020
	.xword		0xb6a0000000000000
	.xword		0xb80fffffc0000000
	.xword		0xb80fffffffffff80
	.xword		0xb81fffffa0000040
	.xword		0xb690000000000000
	.xword		0xb7ffffffc0000000
	.xword		0xb7ffffffffffff80
	.xword		0xb80fffffa0000040
	.xword		0xc7e0000000000000
	.xword		0xc7efffffe0000000
	.xword		0xc7f000000fffffe0
	.xword		0xc7ffffffc0000020
	.xword		0xc7f0000000000000
	.xword		0xc7ffffffe0000000
	.xword		0xc80000000fffffe0
	.xword		0xc80fffffc0000020
	.xword		0xbff0000000000000
	.xword		0xbfffffffe0000000
	.xword		0xc00000000fffffe0
	.xword		0xc00fffffc0000020
	.xword		0xb6b0000000000000
	.xword		0xb81fffffc0000000
	.xword		0xb81fffffffffff80
	.xword		0xb82fffffa0000040
	.xword		0xb800000000000000
	.xword		0xb80fffffe0000000
	.xword		0xb81000000fffffe0
	.xword		0xb81fffffc0000020
	.xword		0xb7f0000000000000
	.xword		0xb7ffffffe0000000
	.xword		0xb80000000fffffe0
	.xword		0xb80fffffc0000020
	.xword		0xb6a0000000000000
	.xword		0xb80fffffc0000000
	.xword		0xb80fffffffffff80
	.xword		0xb81fffffa0000040
	.xword		0xb690000000000000
	.xword		0xb7ffffffc0000000
	.xword		0xb7ffffffffffff80
	.xword		0xb80fffffa0000040
	.xword		0xc7e0000000000000
	.xword		0xc7efffffe0000000
	.xword		0xc7f000000fffffe0
	.xword		0xc7ffffffc0000020
	.xword		0xc7f0000000000000
	.xword		0xc7ffffffe0000000
	.xword		0xc80000000fffffe0
	.xword		0xc80fffffc0000020
	.xword		0xbff0000000000000
	.xword		0xbfffffffe0000000
	.xword		0xc00000000fffffe0
	.xword		0xc00fffffc0000020
	.xword		0xb6b0000000000000
	.xword		0xb81fffffc0000000
	.xword		0xb81fffffffffff80
	.xword		0xb82fffffa0000040
	.xword		0xb800000000000000
	.xword		0xb80fffffe0000000
	.xword		0xb81000000fffffe0
	.xword		0xb81fffffc0000020
	.xword		0xb7f0000000000000
	.xword		0xb7ffffffe0000000
	.xword		0xb80000000fffffe0
	.xword		0xb80fffffc0000020
	.xword		0xb6a0000000000000
	.xword		0xb80fffffc0000000
	.xword		0xb80fffffffffff80
	.xword		0xb81fffffa0000040
	.xword		0xb690000000000000
	.xword		0xb7ffffffc0000000
	.xword		0xb7ffffffffffff80
	.xword		0xb80fffffa0000040
	.xword		0x47e0000000000000
	.xword		0x47efffffe0000000
	.xword		0x47f000000fffffe0
	.xword		0x47ffffffc0000020
	.xword		0x47f0000000000000
	.xword		0x47ffffffe0000000
	.xword		0x480000000fffffe0
	.xword		0x480fffffc0000020
	.xword		0x3ff0000000000000
	.xword		0x3fffffffe0000000
	.xword		0x400000000fffffe0
	.xword		0x400fffffc0000020
	.xword		0x36b0000000000000
	.xword		0x381fffffc0000000
	.xword		0x381fffffffffff80
	.xword		0x382fffffa0000040
	.xword		0x3800000000000000
	.xword		0x380fffffe0000000
	.xword		0x381000000fffffe0
	.xword		0x381fffffc0000020
	.xword		0x37f0000000000000
	.xword		0x37ffffffe0000000
	.xword		0x380000000fffffe0
	.xword		0x380fffffc0000020
	.xword		0x36a0000000000000
	.xword		0x380fffffc0000000
	.xword		0x380fffffffffff80
	.xword		0x381fffffa0000040
	.xword		0x3690000000000000
	.xword		0x37ffffffc0000000
	.xword		0x37ffffffffffff80
	.xword		0x380fffffa0000040
	.xword		0x47e0000000000000
	.xword		0x47efffffe0000000
	.xword		0x47f000000fffffe0
	.xword		0x47ffffffc0000020
	.xword		0x47f0000000000000
	.xword		0x47ffffffe0000000
	.xword		0x480000000fffffe0
	.xword		0x480fffffc0000020
	.xword		0x3ff0000000000000
	.xword		0x3fffffffe0000000
	.xword		0x400000000fffffe0
	.xword		0x400fffffc0000020
	.xword		0x36b0000000000000
	.xword		0x381fffffc0000000
	.xword		0x381fffffffffff80
	.xword		0x382fffffa0000040
	.xword		0x3800000000000000
	.xword		0x380fffffe0000000
	.xword		0x381000000fffffe0
	.xword		0x381fffffc0000020
	.xword		0x37f0000000000000
	.xword		0x37ffffffe0000000
	.xword		0x380000000fffffe0
	.xword		0x380fffffc0000020
	.xword		0x36a0000000000000
	.xword		0x380fffffc0000000
	.xword		0x380fffffffffff80
	.xword		0x381fffffa0000040
	.xword		0x3690000000000000
	.xword		0x37ffffffc0000000
	.xword		0x37ffffffffffff80
	.xword		0x380fffffa0000040
.align 8
fcc_result:


cexc_flag:
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
.align 8


scratch:
	.xword		0x0000000000000000
	.xword		0x0000000000000000


