// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fsmuld_rnd_near.s
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
* Name:   fsmuld_rnd_near.s
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

! Testing fsmuld with rounding mode near

!// fsmuld_rnd_near
!//
!//	Tests FSMULD in round to nearest mode
!//	Inputs are positive and negative:
!//		- infinity and infinity
!//		- infinity and NaN
!//		- NaN and infinity
!//		- NaN and NaN
!//		- infinity and norm/denorm/zero
!//		- NaN and norm/denorm/zero
!//		- norm/denorm/zero and infinity
!//		- norm/denorm/zero and NaN
!//		- norm/denorm/zero and norm/denorm/zero


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


	set		324, %g1		! Set loop count
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
	.xword		0x0000000000000000


source1:
	.word		0x7f800000
	.word		0x7f800000
	.word		0xff800000
	.word		0xff800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0x7fabcdef
	.word		0xffabcdef
	.word		0x7ffedcba
	.word		0xfffedcba
	.word		0x7fabcdef
	.word		0xffabcdef
	.word		0x7ffedcba
	.word		0xfffedcba
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
.align 8


source2:
	.word		0x7f800000
	.word		0xff800000
	.word		0x7f800000
	.word		0xff800000
	.word		0x7fabcdef
	.word		0xffabcdef
	.word		0x7ffedcba
	.word		0xfffedcba
	.word		0x7fabcdef
	.word		0xffabcdef
	.word		0x7ffedcba
	.word		0xfffedcba
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0x7fabcdef
	.word		0xffabcdef
	.word		0x7ffedcba
	.word		0xfffedcba
	.word		0x7fabcdef
	.word		0xffabcdef
	.word		0x7ffedcba
	.word		0xfffedcba
	.word		0x7fabcdef
	.word		0xffabcdef
	.word		0x7ffedcba
	.word		0xfffedcba
	.word		0x7fabcdef
	.word		0xffabcdef
	.word		0x7ffedcba
	.word		0xfffedcba
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000000
	.word		0xff7fffff
	.word		0xbf800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0x7f800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0xff800000
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0x7fabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0xffabcdef
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0x7ffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0xfffedcba
	.word		0x7f7fffff
	.word		0x7f7fffff
	.word		0x7f7fffff
	.word		0x7f7fffff
	.word		0x7f7fffff
	.word		0x7f7fffff
	.word		0x7f7fffff
	.word		0x7f7fffff
	.word		0x7f7fffff
	.word		0x7f7fffff
	.word		0x7f7fffff
	.word		0x7f7fffff
	.word		0x3f800000
	.word		0x3f800000
	.word		0x3f800000
	.word		0x3f800000
	.word		0x3f800000
	.word		0x3f800000
	.word		0x3f800000
	.word		0x3f800000
	.word		0x3f800000
	.word		0x3f800000
	.word		0x3f800000
	.word		0x3f800000
	.word		0x00800000
	.word		0x00800000
	.word		0x00800000
	.word		0x00800000
	.word		0x00800000
	.word		0x00800000
	.word		0x00800000
	.word		0x00800000
	.word		0x00800000
	.word		0x00800000
	.word		0x00800000
	.word		0x00800000
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x007fffff
	.word		0x00000001
	.word		0x00000001
	.word		0x00000001
	.word		0x00000001
	.word		0x00000001
	.word		0x00000001
	.word		0x00000001
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
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0xff7fffff
	.word		0xff7fffff
	.word		0xff7fffff
	.word		0xff7fffff
	.word		0xff7fffff
	.word		0xff7fffff
	.word		0xff7fffff
	.word		0xff7fffff
	.word		0xff7fffff
	.word		0xff7fffff
	.word		0xff7fffff
	.word		0xff7fffff
	.word		0xbf800000
	.word		0xbf800000
	.word		0xbf800000
	.word		0xbf800000
	.word		0xbf800000
	.word		0xbf800000
	.word		0xbf800000
	.word		0xbf800000
	.word		0xbf800000
	.word		0xbf800000
	.word		0xbf800000
	.word		0xbf800000
	.word		0x80800000
	.word		0x80800000
	.word		0x80800000
	.word		0x80800000
	.word		0x80800000
	.word		0x80800000
	.word		0x80800000
	.word		0x80800000
	.word		0x80800000
	.word		0x80800000
	.word		0x80800000
	.word		0x80800000
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0x80000001
	.word		0x80000001
	.word		0x80000001
	.word		0x80000001
	.word		0x80000001
	.word		0x80000001
	.word		0x80000001
	.word		0x80000001
	.word		0x80000001
	.word		0x80000001
	.word		0x80000001
	.word		0x80000001
	.word		0x80000000
	.word		0x80000000
	.word		0x80000000
	.word		0x80000000
	.word		0x80000000
	.word		0x80000000
	.word		0x80000000
	.word		0x80000000
	.word		0x80000000
	.word		0x80000000
	.word		0x80000000
	.word		0x80000000
.align 8


result:
	.xword		0x7ff0000000000000
	.xword		0xfff0000000000000
	.xword		0xfff0000000000000
	.xword		0x7ff0000000000000
	.xword		0x7ffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0x7fffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0x7ffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0x7fffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0x7ffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0x7fffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0x7ffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0x7fffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0x7ffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0x7fffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0x7ffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0x7fffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0x7ff0000000000000
	.xword		0x7ff0000000000000
	.xword		0x7ff0000000000000
	.xword		0x7ff0000000000000
	.xword		0x7ff0000000000000
	.xword		0x7fffffffffffffff
	.xword		0xfff0000000000000
	.xword		0xfff0000000000000
	.xword		0xfff0000000000000
	.xword		0xfff0000000000000
	.xword		0xfff0000000000000
	.xword		0x7fffffffffffffff
	.xword		0xfff0000000000000
	.xword		0xfff0000000000000
	.xword		0xfff0000000000000
	.xword		0xfff0000000000000
	.xword		0xfff0000000000000
	.xword		0x7fffffffffffffff
	.xword		0x7ff0000000000000
	.xword		0x7ff0000000000000
	.xword		0x7ff0000000000000
	.xword		0x7ff0000000000000
	.xword		0x7ff0000000000000
	.xword		0x7fffffffffffffff
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0x7ff0000000000000
	.xword		0x7ff0000000000000
	.xword		0x7ff0000000000000
	.xword		0x7ff0000000000000
	.xword		0x7ff0000000000000
	.xword		0x7fffffffffffffff
	.xword		0xfff0000000000000
	.xword		0xfff0000000000000
	.xword		0xfff0000000000000
	.xword		0xfff0000000000000
	.xword		0xfff0000000000000
	.xword		0x7fffffffffffffff
	.xword		0xfff0000000000000
	.xword		0xfff0000000000000
	.xword		0xfff0000000000000
	.xword		0xfff0000000000000
	.xword		0xfff0000000000000
	.xword		0x7fffffffffffffff
	.xword		0x7ff0000000000000
	.xword		0x7ff0000000000000
	.xword		0x7ff0000000000000
	.xword		0x7ff0000000000000
	.xword		0x7ff0000000000000
	.xword		0x7fffffffffffffff
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0x7ffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0xfffd79bde0000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0x7fffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0xffffdb9740000000
	.xword		0x4fefffffc0000020
	.xword		0x47efffffe0000000
	.xword		0x400fffffe0000000
	.xword		0x400fffffa0000040
	.xword		0x3e9fffffe0000000
	.xword		0x0000000000000000
	.xword		0xcfefffffc0000020
	.xword		0xc7efffffe0000000
	.xword		0xc00fffffe0000000
	.xword		0xc00fffffa0000040
	.xword		0xbe9fffffe0000000
	.xword		0x8000000000000000
	.xword		0x47efffffe0000000
	.xword		0x3ff0000000000000
	.xword		0x3810000000000000
	.xword		0x380fffffc0000000
	.xword		0x36a0000000000000
	.xword		0x0000000000000000
	.xword		0xc7efffffe0000000
	.xword		0xbff0000000000000
	.xword		0xb810000000000000
	.xword		0xb80fffffc0000000
	.xword		0xb6a0000000000000
	.xword		0x8000000000000000
	.xword		0x400fffffe0000000
	.xword		0x3810000000000000
	.xword		0x3030000000000000
	.xword		0x302fffffc0000000
	.xword		0x2ec0000000000000
	.xword		0x0000000000000000
	.xword		0xc00fffffe0000000
	.xword		0xb810000000000000
	.xword		0xb030000000000000
	.xword		0xb02fffffc0000000
	.xword		0xaec0000000000000
	.xword		0x8000000000000000
	.xword		0x400fffffa0000040
	.xword		0x380fffffc0000000
	.xword		0x302fffffc0000000
	.xword		0x302fffff80000080
	.xword		0x2ebfffffc0000000
	.xword		0x0000000000000000
	.xword		0xc00fffffa0000040
	.xword		0xb80fffffc0000000
	.xword		0xb02fffffc0000000
	.xword		0xb02fffff80000080
	.xword		0xaebfffffc0000000
	.xword		0x8000000000000000
	.xword		0x3e9fffffe0000000
	.xword		0x36a0000000000000
	.xword		0x2ec0000000000000
	.xword		0x2ebfffffc0000000
	.xword		0x2d50000000000000
	.xword		0x0000000000000000
	.xword		0xbe9fffffe0000000
	.xword		0xb6a0000000000000
	.xword		0xaec0000000000000
	.xword		0xaebfffffc0000000
	.xword		0xad50000000000000
	.xword		0x8000000000000000
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
	.xword		0xcfefffffc0000020
	.xword		0xc7efffffe0000000
	.xword		0xc00fffffe0000000
	.xword		0xc00fffffa0000040
	.xword		0xbe9fffffe0000000
	.xword		0x8000000000000000
	.xword		0x4fefffffc0000020
	.xword		0x47efffffe0000000
	.xword		0x400fffffe0000000
	.xword		0x400fffffa0000040
	.xword		0x3e9fffffe0000000
	.xword		0x0000000000000000
	.xword		0xc7efffffe0000000
	.xword		0xbff0000000000000
	.xword		0xb810000000000000
	.xword		0xb80fffffc0000000
	.xword		0xb6a0000000000000
	.xword		0x8000000000000000
	.xword		0x47efffffe0000000
	.xword		0x3ff0000000000000
	.xword		0x3810000000000000
	.xword		0x380fffffc0000000
	.xword		0x36a0000000000000
	.xword		0x0000000000000000
	.xword		0xc00fffffe0000000
	.xword		0xb810000000000000
	.xword		0xb030000000000000
	.xword		0xb02fffffc0000000
	.xword		0xaec0000000000000
	.xword		0x8000000000000000
	.xword		0x400fffffe0000000
	.xword		0x3810000000000000
	.xword		0x3030000000000000
	.xword		0x302fffffc0000000
	.xword		0x2ec0000000000000
	.xword		0x0000000000000000
	.xword		0xc00fffffa0000040
	.xword		0xb80fffffc0000000
	.xword		0xb02fffffc0000000
	.xword		0xb02fffff80000080
	.xword		0xaebfffffc0000000
	.xword		0x8000000000000000
	.xword		0x400fffffa0000040
	.xword		0x380fffffc0000000
	.xword		0x302fffffc0000000
	.xword		0x302fffff80000080
	.xword		0x2ebfffffc0000000
	.xword		0x0000000000000000
	.xword		0xbe9fffffe0000000
	.xword		0xb6a0000000000000
	.xword		0xaec0000000000000
	.xword		0xaebfffffc0000000
	.xword		0xad50000000000000
	.xword		0x8000000000000000
	.xword		0x3e9fffffe0000000
	.xword		0x36a0000000000000
	.xword		0x2ec0000000000000
	.xword		0x2ebfffffc0000000
	.xword		0x2d50000000000000
	.xword		0x0000000000000000
	.xword		0x8000000000000000
	.xword		0x8000000000000000
	.xword		0x8000000000000000
	.xword		0x8000000000000000
	.xword		0x8000000000000000
	.xword		0x8000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
.align 8
fcc_result:


cexc_flag:
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000010
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000010
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000010
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
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
	.xword		0x0000000000000010
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000010
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000010
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
	.xword		0x0000000000000010
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


