// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fitos_rnd_ninf.s
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
* Name:   fitos_rnd_ninf.s
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

! Testing fitos with rounding mode ninf

!// fitos_rnd_ninf
!//
!//	Tests FITOS in round to negative infinity mode.
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


fitos_loop:
	ldx		[%l6+0x0], %fsr


	! instruction specific code

	sll		%g2, 0x2, %g3

	ldx		[%l6], %fsr		! Load fsr with rounding mode
	ld		[%l1+%g3], %f0		! Load source 1
	fitos		%f0, %f4		! Perform the operation
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
	bne,a		fitos_loop		! Loop
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
	.word		0x00000000
	.word		0x00000001
	.word		0x03fffff8
	.word		0x03fffff9
	.word		0x03fffffa
	.word		0x03fffffb
	.word		0x03fffffc
	.word		0x03fffffd
	.word		0x03fffffe
	.word		0x03ffffff
	.word		0x7fffff00
	.word		0x7fffff20
	.word		0x7fffff40
	.word		0x7fffff60
	.word		0x7fffff80
	.word		0x7fffffa0
	.word		0x7fffffc0
	.word		0x7fffffe0
	.word		0x7fffff01
	.word		0x7fffff41
	.word		0x7fffff81
	.word		0x7fffffc1
	.word		0x7fffffff
	.word		0xffffffff
	.word		0xfc000008
	.word		0xfc000007
	.word		0xfc000006
	.word		0xfc000005
	.word		0xfc000004
	.word		0xfc000003
	.word		0xfc000002
	.word		0xfc000001
	.word		0x80000100
	.word		0x800000e0
	.word		0x800000c0
	.word		0x800000a0
	.word		0x80000080
	.word		0x80000060
	.word		0x80000040
	.word		0x80000020
	.word		0x800000ff
	.word		0x800000bf
	.word		0x8000007f
	.word		0x8000003f
	.word		0x80000000
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
	.word		0x4efffffe
	.word		0x4efffffe
	.word		0x4efffffe
	.word		0x4efffffe
	.word		0x4effffff
	.word		0x4effffff
	.word		0x4effffff
	.word		0x4effffff
	.word		0x4efffffe
	.word		0x4efffffe
	.word		0x4effffff
	.word		0x4effffff
	.word		0x4effffff
	.word		0xbf800000
	.word		0xcc7ffffe
	.word		0xcc7fffff
	.word		0xcc7fffff
	.word		0xcc7fffff
	.word		0xcc7fffff
	.word		0xcc800000
	.word		0xcc800000
	.word		0xcc800000
	.word		0xcefffffe
	.word		0xceffffff
	.word		0xceffffff
	.word		0xceffffff
	.word		0xceffffff
	.word		0xcf000000
	.word		0xcf000000
	.word		0xcf000000
	.word		0xceffffff
	.word		0xceffffff
	.word		0xcf000000
	.word		0xcf000000
	.word		0xcf000000
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


