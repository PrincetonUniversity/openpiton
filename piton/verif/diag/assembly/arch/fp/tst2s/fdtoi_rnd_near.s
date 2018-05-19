// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fdtoi_rnd_near.s
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
* Name:   fdtoi_rnd_near.s
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

! Testing fdtoi with rounding mode near

!// fdtoi_rnd_near
!//
!//	Tests FDTOI in round to nearest mode.
!//	Inputs are positive and negative:
!//		- infinity
!//		- QNaN
!//		- SNaN
!//		- large- too large for result
!//		- large inexact
!//		- around 1
!//		- denorm
!//		- zero


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


	set		68, %g1		! Set loop count
	set		0x0, %g2		! Set loop iterator


fdtoi_loop:
	ldx		[%l6+0x0], %fsr


	! instruction specific code

	sll		%g2, 0x3, %g3

	ldx		[%l6], %fsr		! Load fsr with rounding mode
	ldd		[%l1+%g3], %f0		! Load source 1
	fdtoi		%f0, %f4		! Perform the operation
	st		%f4, [%l7+0x0]		! Store the result for comparison
	stx		%fsr, [%l7+0x8]		! Store the fsr for comparison
	ld		[%l7+0x0], %g4		! Load result from memory for comparison

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

	sll		%g2, 0x2, %g3
	ld		[%l3+%g3], %g6		! Load expected result

	subcc		%g4, %g6, %g0		! Compare
	bne,a		test_fail		! If not equal, test failed
	nop
	subcc		%g5, %g7, %g0		! Compare
	bne,a		test_fail		! If not equal, test failed
	nop


	add		%g2, 0x1, %g2		! Increment loop iterator
	subcc		%g2, %g1, %g0		! Compare
	bne,a		fdtoi_loop		! Loop
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
	.xword		0x0000000000000000


source1:
	.xword		0x7ff0000000000000
	.xword		0x7ff0123456789abc
	.xword		0x7fffedcba9876543
	.xword		0x7fefffffffffffff
	.xword		0x41e0000000200001
	.xword		0x41e0000000200000
	.xword		0x41e00000001fffff
	.xword		0x41e0000000000001
	.xword		0x41e0000000000000
	.xword		0x41dfffffffffffff
	.xword		0x41dfffffffc00001
	.xword		0x41dfffffffc00000
	.xword		0x41dfffffffbfffff
	.xword		0x41dfffffff800001
	.xword		0x41dfffffff800000
	.xword		0x416fffffe0000000
	.xword		0x416fffffc0000000
	.xword		0x416ffffe00000000
	.xword		0x415fffffe0000000
	.xword		0x415fffffc0000000
	.xword		0x415fffffa0000000
	.xword		0x415fffff80000000
	.xword		0x3ff8000000000001
	.xword		0x3ff8000000000000
	.xword		0x3ff7ffffffffffff
	.xword		0x3ff0000000000001
	.xword		0x3ff0000000000000
	.xword		0x3fefffffffffffff
	.xword		0x3fe0000000000001
	.xword		0x3fe0000000000000
	.xword		0x0010000000000000
	.xword		0x000fffffffffffff
	.xword		0x0000000000000001
	.xword		0x0000000000000000
	.xword		0xfff0000000000000
	.xword		0xfff0123456789abc
	.xword		0xffffedcba9876543
	.xword		0xffefffffffffffff
	.xword		0xc1e0000000200001
	.xword		0xc1e0000000200000
	.xword		0xc1e00000001fffff
	.xword		0xc1e0000000000001
	.xword		0xc1e0000000000000
	.xword		0xc1dfffffffffffff
	.xword		0xc1dfffffffc00001
	.xword		0xc1dfffffffc00000
	.xword		0xc1dfffffffbfffff
	.xword		0xc1dfffffff800001
	.xword		0xc1dfffffff800000
	.xword		0xc16fffffe0000000
	.xword		0xc16fffffc0000000
	.xword		0xc16ffffe00000000
	.xword		0xc15fffffe0000000
	.xword		0xc15fffffc0000000
	.xword		0xc15fffffa0000000
	.xword		0xc15fffff80000000
	.xword		0xbff8000000000001
	.xword		0xbff8000000000000
	.xword		0xbff7ffffffffffff
	.xword		0xbff0000000000001
	.xword		0xbff0000000000000
	.xword		0xbfefffffffffffff
	.xword		0xbfe0000000000001
	.xword		0xbfe0000000000000
	.xword		0x8010000000000000
	.xword		0x800fffffffffffff
	.xword		0x8000000000000001
	.xword		0x8000000000000000
.align 8


source2:
.align 8


result:
	.word		0x7fffffff
	.word		0x7fffffff
	.word		0x7fffffff
	.word		0x7fffffff
	.word		0x7fffffff
	.word		0x7fffffff
	.word		0x7fffffff
	.word		0x7fffffff
	.word		0x7fffffff
	.word		0x7fffffff
	.word		0x7fffffff
	.word		0x7fffffff
	.word		0x7ffffffe
	.word		0x7ffffffe
	.word		0x7ffffffe
	.word		0x00ffffff
	.word		0x00fffffe
	.word		0x00fffff0
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007ffffe
	.word		0x007ffffe
	.word		0x00000001
	.word		0x00000001
	.word		0x00000001
	.word		0x00000001
	.word		0x00000001
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x80000000
	.word		0x80000000
	.word		0x80000000
	.word		0x80000000
	.word		0x80000000
	.word		0x80000000
	.word		0x80000000
	.word		0x80000000
	.word		0x80000000
	.word		0x80000001
	.word		0x80000001
	.word		0x80000001
	.word		0x80000002
	.word		0x80000002
	.word		0x80000002
	.word		0xff000001
	.word		0xff000002
	.word		0xff000010
	.word		0xff800001
	.word		0xff800001
	.word		0xff800002
	.word		0xff800002
	.word		0xffffffff
	.word		0xffffffff
	.word		0xffffffff
	.word		0xffffffff
	.word		0xffffffff
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
.align 8
fcc_result:


cexc_flag:
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000000
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000001
	.xword		0x0000000000000000
	.xword		0x0000000000000001
	.xword		0x0000000000000000
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000000
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000000
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000000
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000000
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000001
	.xword		0x0000000000000000
	.xword		0x0000000000000001
	.xword		0x0000000000000000
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000000
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000000
.align 8


scratch:
	.xword		0x0000000000000000
	.xword		0x0000000000000000


