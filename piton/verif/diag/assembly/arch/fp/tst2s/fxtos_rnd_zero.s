// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fxtos_rnd_zero.s
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
* Name:   fxtos_rnd_zero.s
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

! Testing fxtos with rounding mode zero

!// fxtos_rnd_zero
!//
!//	Tests FXTOS in round to zero mode.
!//      Inputs are:
!//              - zero
!//              - positive 1
!//		- smallest maximum precision positive
!//              - largest exact positive
!//              - largest positive
!//              - negative 1
!//		- smallest maximum precision negative
!//              - largest exact negative
!//              - largest negative


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


	set		45, %g1		! Set loop count
	set		0x0, %g2		! Set loop iterator


fxtos_loop:
	ldx		[%l6+0x0], %fsr


	! instruction specific code

	sll		%g2, 0x3, %g3

	ldx		[%l6], %fsr		! Load fsr with rounding mode
	ldd		[%l1+%g3], %f0		! Load source 1
	fxtos		%f0, %f4		! Perform the operation
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
	bne,a		fxtos_loop		! Loop
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
	.xword		0x0000000040000000


source1:
	.xword		0x0000000000000000
	.xword		0x0000000000000001
	.xword		0x0000000003fffff8
	.xword		0x0000000003fffff9
	.xword		0x0000000003fffffa
	.xword		0x0000000003fffffb
	.xword		0x0000000003fffffc
	.xword		0x0000000003fffffd
	.xword		0x0000000003fffffe
	.xword		0x0000000003ffffff
	.xword		0x7fffff0000000000
	.xword		0x7fffff2000000000
	.xword		0x7fffff4000000000
	.xword		0x7fffff6000000000
	.xword		0x7fffff8000000000
	.xword		0x7fffffa000000000
	.xword		0x7fffffc000000000
	.xword		0x7fffffe000000000
	.xword		0x7fffff0000000001
	.xword		0x7fffff4000000001
	.xword		0x7fffff8000000001
	.xword		0x7fffffc000000001
	.xword		0x7fffffffffffffff
	.xword		0xffffffffffffffff
	.xword		0xfffffffffc000008
	.xword		0xfffffffffc000007
	.xword		0xfffffffffc000006
	.xword		0xfffffffffc000005
	.xword		0xfffffffffc000004
	.xword		0xfffffffffc000003
	.xword		0xfffffffffc000002
	.xword		0xfffffffffc000001
	.xword		0x8000010000000000
	.xword		0x800000e000000000
	.xword		0x800000c000000000
	.xword		0x800000a000000000
	.xword		0x8000008000000000
	.xword		0x8000006000000000
	.xword		0x8000004000000000
	.xword		0x8000002000000000
	.xword		0x800000ffffffffff
	.xword		0x800000bfffffffff
	.xword		0x8000007fffffffff
	.xword		0x8000003fffffffff
	.xword		0x8000000000000000
.align 8


source2:
.align 8


result:
	.word		0x00000000
	.word		0x3f800000
	.word		0x4c7ffffe
	.word		0x4c7ffffe
	.word		0x4c7ffffe
	.word		0x4c7ffffe
	.word		0x4c7fffff
	.word		0x4c7fffff
	.word		0x4c7fffff
	.word		0x4c7fffff
	.word		0x5efffffe
	.word		0x5efffffe
	.word		0x5efffffe
	.word		0x5efffffe
	.word		0x5effffff
	.word		0x5effffff
	.word		0x5effffff
	.word		0x5effffff
	.word		0x5efffffe
	.word		0x5efffffe
	.word		0x5effffff
	.word		0x5effffff
	.word		0x5effffff
	.word		0xbf800000
	.word		0xcc7ffffe
	.word		0xcc7ffffe
	.word		0xcc7ffffe
	.word		0xcc7ffffe
	.word		0xcc7fffff
	.word		0xcc7fffff
	.word		0xcc7fffff
	.word		0xcc7fffff
	.word		0xdefffffe
	.word		0xdefffffe
	.word		0xdefffffe
	.word		0xdefffffe
	.word		0xdeffffff
	.word		0xdeffffff
	.word		0xdeffffff
	.word		0xdeffffff
	.word		0xdefffffe
	.word		0xdefffffe
	.word		0xdeffffff
	.word		0xdeffffff
	.word		0xdf000000
.align 8
fcc_result:


cexc_flag:
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
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
	.xword		0x0000000000000000
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000000
	.xword		0x0000000000000000
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
	.xword		0x0000000000000000
	.xword		0x0000000000000001
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


