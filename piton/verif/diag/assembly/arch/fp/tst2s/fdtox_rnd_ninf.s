// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fdtox_rnd_ninf.s
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
* Name:   fdtox_rnd_ninf.s
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

! Testing fdtox with rounding mode ninf

!// fdtox_rnd_ninf
!//
!//	Tests FDTOX in round to negative infinity mode.
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


	set		53, %g1		! Set loop count
	set		0x0, %g2		! Set loop iterator


fdtox_loop:
	ldx		[%l6+0x0], %fsr


	! instruction specific code

	sll		%g2, 0x3, %g3

	ldx		[%l6], %fsr		! Load fsr with rounding mode
	ldd		[%l1+%g3], %f0		! Load source 1
	fdtox		%f0, %f4		! Perform the operation
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
	bne,a		fdtox_loop		! Loop
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
	.xword		0x7ff0000000000000
	.xword		0x7ff0123456789abc
	.xword		0x7fffedcba9876543
	.xword		0x7fefffffffffffff
	.xword		0x43e0000000000000
	.xword		0x43dfffffffffffff
	.xword		0x43dffffffffffffe
	.xword		0x433fffffffffffff
	.xword		0x433ffffffffffffe
	.xword		0x433ffffffffffff0
	.xword		0x432fffffffffffff
	.xword		0x432ffffffffffffe
	.xword		0x432ffffffffffffd
	.xword		0x432ffffffffffffc
	.xword		0x3ff8000000000001
	.xword		0x3ff8000000000000
	.xword		0x3ff7ffffffffffff
	.xword		0x3ff0000000000001
	.xword		0x3ff0000000000000
	.xword		0x3fefffffffffffff
	.xword		0x3fe0000000000000
	.xword		0x3fdfffffffffffff
	.xword		0x0010000000000000
	.xword		0x000fffffffffffff
	.xword		0x0000000000000001
	.xword		0x0000000000000000
	.xword		0xfff0000000000000
	.xword		0xfff0123456789abc
	.xword		0xffffedcba9876543
	.xword		0xffefffffffffffff
	.xword		0xc3e0000000000001
	.xword		0xc3e0000000000000
	.xword		0xc3dfffffffffffff
	.xword		0xc3dffffffffffffe
	.xword		0xc33fffffffffffff
	.xword		0xc33ffffffffffffe
	.xword		0xc33ffffffffffff0
	.xword		0xc32fffffffffffff
	.xword		0xc32ffffffffffffe
	.xword		0xc32ffffffffffffd
	.xword		0xc32ffffffffffffc
	.xword		0xbff8000000000001
	.xword		0xbff8000000000000
	.xword		0xbff7ffffffffffff
	.xword		0xbff0000000000001
	.xword		0xbff0000000000000
	.xword		0xbfefffffffffffff
	.xword		0xbfe0000000000000
	.xword		0xbfdfffffffffffff
	.xword		0x8010000000000000
	.xword		0x800fffffffffffff
	.xword		0x8000000000000001
	.xword		0x8000000000000000
.align 8


source2:
.align 8


result:
	.xword		0x7fffffffffffffff
	.xword		0x7fffffffffffffff
	.xword		0x7fffffffffffffff
	.xword		0x7fffffffffffffff
	.xword		0x7fffffffffffffff
	.xword		0x7ffffffffffffc00
	.xword		0x7ffffffffffff800
	.xword		0x001fffffffffffff
	.xword		0x001ffffffffffffe
	.xword		0x001ffffffffffff0
	.xword		0x000fffffffffffff
	.xword		0x000fffffffffffff
	.xword		0x000ffffffffffffe
	.xword		0x000ffffffffffffe
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x8000000000000000
	.xword		0x8000000000000000
	.xword		0x8000000000000000
	.xword		0x8000000000000000
	.xword		0x8000000000000000
	.xword		0x8000000000000000
	.xword		0x8000000000000400
	.xword		0x8000000000000800
	.xword		0xffe0000000000001
	.xword		0xffe0000000000002
	.xword		0xffe0000000000010
	.xword		0xfff0000000000001
	.xword		0xfff0000000000001
	.xword		0xfff0000000000002
	.xword		0xfff0000000000002
	.xword		0xffffffffffffffff
	.xword		0xffffffffffffffff
	.xword		0xffffffffffffffff
	.xword		0xffffffffffffffff
	.xword		0xffffffffffffffff
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
.align 8
fcc_result:


cexc_flag:
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000000
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
	.xword		0x0000000000000000
	.xword		0x0000000000000000
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


