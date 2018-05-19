// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fdtos_rnd_pinf.s
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
* Name:   fdtos_rnd_pinf.s
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

! Testing fdtos with rounding mode pinf

!// fdtos_rnd_pinf
!//
!//	Tests FDTOS in round to positive infinity mode.
!//	Inputs are positive and negative:
!//		- zero
!//		- smallest denorm
!//		- largest denorm
!//		- smallest norm
!//		- largest norm
!//		- QNaN
!//		- SNaN
!//		- infinity
!//	Outputs are positive and negative:
!//		- smallest denorm
!//		- largest denorm
!//		- smallest norm
!//		- largest norm


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


	set		122, %g1		! Set loop count
	set		0x0, %g2		! Set loop iterator


fdtos_loop:
	ldx		[%l6+0x0], %fsr


	! instruction specific code

	sll		%g2, 0x3, %g3

	ldx		[%l6], %fsr		! Load fsr with rounding mode
	ldd		[%l1+%g3], %f0		! Load source 1
	fdtos		%f0, %f4		! Perform the operation
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
	bne,a		fdtos_loop		! Loop
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
	.xword		0x0000000080000000


source1:
	.xword		0x0000000000000000
	.xword		0x0000000000000001
	.xword		0x000fffffffffffff
	.xword		0x0010000000000000
	.xword		0x36a0000000000000
	.xword		0x36a4000000000000
	.xword		0x36a8000000000000
	.xword		0x36ac000000000000
	.xword		0x36b0000000000000
	.xword		0x36b2000000000000
	.xword		0x36b4000000000000
	.xword		0x36b6000000000000
	.xword		0x36a0000000000001
	.xword		0x36a8000000000001
	.xword		0x36b0000000000001
	.xword		0x36b4000000000001
	.xword		0x380fffff80000000
	.xword		0x380fffff90000000
	.xword		0x380fffffa0000000
	.xword		0x380fffffb0000000
	.xword		0x380fffffc0000000
	.xword		0x380fffffd0000000
	.xword		0x380fffffe0000000
	.xword		0x380ffffff0000000
	.xword		0x380fffff80000001
	.xword		0x380fffffa0000001
	.xword		0x380fffffc0000001
	.xword		0x380fffffe0000001
	.xword		0x380fffffffffffff
	.xword		0x3810000000000000
	.xword		0x3810000008000000
	.xword		0x3810000010000000
	.xword		0x3810000018000000
	.xword		0x3810000020000000
	.xword		0x3810000028000000
	.xword		0x3810000030000000
	.xword		0x3810000038000000
	.xword		0x3810000000000001
	.xword		0x3810000010000001
	.xword		0x3810000020000001
	.xword		0x3810000030000001
	.xword		0x47efffffc0000000
	.xword		0x47efffffc8000000
	.xword		0x47efffffd0000000
	.xword		0x47efffffd8000000
	.xword		0x47efffffe0000000
	.xword		0x47efffffe8000000
	.xword		0x47effffff0000000
	.xword		0x47effffff8000000
	.xword		0x47efffffc0000001
	.xword		0x47efffffd0000001
	.xword		0x47efffffe0000001
	.xword		0x47effffff0000001
	.xword		0x47efffffefffffff
	.xword		0x47efffffffffffff
	.xword		0x47f0000000000000
	.xword		0x47f0000000000001
	.xword		0x7fefffffffffffff
	.xword		0x7fffedcba9876543
	.xword		0x7ff0123456789abc
	.xword		0x7ff0000000000000
	.xword		0x8000000000000000
	.xword		0x8000000000000001
	.xword		0x800fffffffffffff
	.xword		0x8010000000000000
	.xword		0xb6a0000000000000
	.xword		0xb6a4000000000000
	.xword		0xb6a8000000000000
	.xword		0xb6ac000000000000
	.xword		0xb6b0000000000000
	.xword		0xb6b2000000000000
	.xword		0xb6b4000000000000
	.xword		0xb6b6000000000000
	.xword		0xb6a0000000000001
	.xword		0xb6a8000000000001
	.xword		0xb6b0000000000001
	.xword		0xb6b4000000000001
	.xword		0xb80fffff80000000
	.xword		0xb80fffff90000000
	.xword		0xb80fffffa0000000
	.xword		0xb80fffffb0000000
	.xword		0xb80fffffc0000000
	.xword		0xb80fffffd0000000
	.xword		0xb80fffffe0000000
	.xword		0xb80ffffff0000000
	.xword		0xb80fffff80000001
	.xword		0xb80fffffa0000001
	.xword		0xb80fffffc0000001
	.xword		0xb80fffffe0000001
	.xword		0xb80fffffffffffff
	.xword		0xb810000000000000
	.xword		0xb810000008000000
	.xword		0xb810000010000000
	.xword		0xb810000018000000
	.xword		0xb810000020000000
	.xword		0xb810000028000000
	.xword		0xb810000030000000
	.xword		0xb810000038000000
	.xword		0xb810000000000001
	.xword		0xb810000010000001
	.xword		0xb810000020000001
	.xword		0xb810000030000001
	.xword		0xc7efffffc0000000
	.xword		0xc7efffffc8000000
	.xword		0xc7efffffd0000000
	.xword		0xc7efffffd8000000
	.xword		0xc7efffffe0000000
	.xword		0xc7efffffe8000000
	.xword		0xc7effffff0000000
	.xword		0xc7effffff8000000
	.xword		0xc7efffffc0000001
	.xword		0xc7efffffd0000001
	.xword		0xc7efffffe0000001
	.xword		0xc7effffff0000001
	.xword		0xc7efffffefffffff
	.xword		0xc7efffffffffffff
	.xword		0xc7f0000000000000
	.xword		0xc7f0000000000001
	.xword		0xffefffffffffffff
	.xword		0xffffedcba9876543
	.xword		0xfff0123456789abc
	.xword		0xfff0000000000000
.align 8


source2:
.align 8


result:
	.word		0x00000000
	.word		0x00000001
	.word		0x00000001
	.word		0x00000001
	.word		0x00000001
	.word		0x00000002
	.word		0x00000002
	.word		0x00000002
	.word		0x00000002
	.word		0x00000003
	.word		0x00000003
	.word		0x00000003
	.word		0x00000002
	.word		0x00000002
	.word		0x00000003
	.word		0x00000003
	.word		0x007ffffe
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x00800000
	.word		0x00800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x007fffff
	.word		0x00800000
	.word		0x00800000
	.word		0x00800000
	.word		0x00800000
	.word		0x00800001
	.word		0x00800001
	.word		0x00800001
	.word		0x00800001
	.word		0x00800002
	.word		0x00800002
	.word		0x00800002
	.word		0x00800001
	.word		0x00800001
	.word		0x00800002
	.word		0x00800002
	.word		0x7f7ffffe
	.word		0x7f7fffff
	.word		0x7f7fffff
	.word		0x7f7fffff
	.word		0x7f7fffff
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f7fffff
	.word		0x7f7fffff
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7fff6e5d
	.word		0x7fc091a2
	.word		0x7f800000
	.word		0x80000000
	.word		0x80000000
	.word		0x80000000
	.word		0x80000000
	.word		0x80000001
	.word		0x80000001
	.word		0x80000001
	.word		0x80000001
	.word		0x80000002
	.word		0x80000002
	.word		0x80000002
	.word		0x80000002
	.word		0x80000001
	.word		0x80000001
	.word		0x80000002
	.word		0x80000002
	.word		0x807ffffe
	.word		0x807ffffe
	.word		0x807ffffe
	.word		0x807ffffe
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807ffffe
	.word		0x807ffffe
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0x80800000
	.word		0x80800000
	.word		0x80800000
	.word		0x80800000
	.word		0x80800001
	.word		0x80800001
	.word		0x80800001
	.word		0x80800001
	.word		0x80800000
	.word		0x80800000
	.word		0x80800001
	.word		0x80800001
	.word		0xff7ffffe
	.word		0xff7ffffe
	.word		0xff7ffffe
	.word		0xff7ffffe
	.word		0xff7fffff
	.word		0xff7fffff
	.word		0xff7fffff
	.word		0xff7fffff
	.word		0xff7ffffe
	.word		0xff7ffffe
	.word		0xff7fffff
	.word		0xff7fffff
	.word		0xff7fffff
	.word		0xff7fffff
	.word		0xff7fffff
	.word		0xff7fffff
	.word		0xff7fffff
	.word		0xffff6e5d
	.word		0xffc091a2
	.word		0xff800000
.align 8
fcc_result:


cexc_flag:
	.xword		0x0000000000000000
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000004
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000004
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000004
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000004
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000000
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
	.xword		0x0000000000000001
	.xword		0x0000000000000000
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000000
	.xword		0x0000000000000009
	.xword		0x0000000000000009
	.xword		0x0000000000000009
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000009
	.xword		0x0000000000000009
	.xword		0x0000000000000009
	.xword		0x0000000000000009
	.xword		0x0000000000000008
	.xword		0x0000000000000009
	.xword		0x0000000000000009
	.xword		0x0000000000000000
	.xword		0x0000000000000010
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000004
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000004
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000004
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000004
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000005
	.xword		0x0000000000000000
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
	.xword		0x0000000000000001
	.xword		0x0000000000000000
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
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000008
	.xword		0x0000000000000009
	.xword		0x0000000000000009
	.xword		0x0000000000000000
	.xword		0x0000000000000010
	.xword		0x0000000000000000
.align 8


scratch:
	.xword		0x0000000000000000
	.xword		0x0000000000000000


