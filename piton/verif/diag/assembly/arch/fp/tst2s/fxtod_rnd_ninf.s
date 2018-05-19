// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fxtod_rnd_ninf.s
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
* Name:   fxtod_rnd_ninf.s
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

! Testing fxtod with rounding mode ninf

!// fxtod_rnd_ninf
!//
!//	Tests FXTOD in round to negative infinity mode.
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


fxtod_loop:
	ldx		[%l6+0x0], %fsr


	! instruction specific code

	sll		%g2, 0x3, %g3

	ldx		[%l6], %fsr		! Load fsr with rounding mode
	ldd		[%l1+%g3], %f0		! Load source 1
	fxtod		%f0, %f4		! Perform the operation
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
	bne,a		fxtod_loop		! Loop
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
	.xword		0x0000000000000000
	.xword		0x0000000000000001
	.xword		0x007ffffffffffff8
	.xword		0x007ffffffffffff9
	.xword		0x007ffffffffffffa
	.xword		0x007ffffffffffffb
	.xword		0x007ffffffffffffc
	.xword		0x007ffffffffffffd
	.xword		0x007ffffffffffffe
	.xword		0x007fffffffffffff
	.xword		0x7ffffffffffff800
	.xword		0x7ffffffffffff900
	.xword		0x7ffffffffffffa00
	.xword		0x7ffffffffffffb00
	.xword		0x7ffffffffffffc00
	.xword		0x7ffffffffffffd00
	.xword		0x7ffffffffffffe00
	.xword		0x7fffffffffffff00
	.xword		0x7ffffffffffff801
	.xword		0x7ffffffffffffa01
	.xword		0x7ffffffffffffc01
	.xword		0x7ffffffffffffe01
	.xword		0x7fffffffffffffff
	.xword		0xffffffffffffffff
	.xword		0xff80000000000008
	.xword		0xff80000000000007
	.xword		0xff80000000000006
	.xword		0xff80000000000005
	.xword		0xff80000000000004
	.xword		0xff80000000000003
	.xword		0xff80000000000002
	.xword		0xff80000000000001
	.xword		0x8000000000000800
	.xword		0x8000000000000700
	.xword		0x8000000000000600
	.xword		0x8000000000000500
	.xword		0x8000000000000400
	.xword		0x8000000000000300
	.xword		0x8000000000000200
	.xword		0x8000000000000100
	.xword		0x80000000000007ff
	.xword		0x80000000000005ff
	.xword		0x80000000000003ff
	.xword		0x80000000000001ff
	.xword		0x8000000000000000
.align 8


source2:
.align 8


result:
	.xword		0x0000000000000000
	.xword		0x3ff0000000000000
	.xword		0x435ffffffffffffe
	.xword		0x435ffffffffffffe
	.xword		0x435ffffffffffffe
	.xword		0x435ffffffffffffe
	.xword		0x435fffffffffffff
	.xword		0x435fffffffffffff
	.xword		0x435fffffffffffff
	.xword		0x435fffffffffffff
	.xword		0x43dffffffffffffe
	.xword		0x43dffffffffffffe
	.xword		0x43dffffffffffffe
	.xword		0x43dffffffffffffe
	.xword		0x43dfffffffffffff
	.xword		0x43dfffffffffffff
	.xword		0x43dfffffffffffff
	.xword		0x43dfffffffffffff
	.xword		0x43dffffffffffffe
	.xword		0x43dffffffffffffe
	.xword		0x43dfffffffffffff
	.xword		0x43dfffffffffffff
	.xword		0x43dfffffffffffff
	.xword		0xbff0000000000000
	.xword		0xc35ffffffffffffe
	.xword		0xc35fffffffffffff
	.xword		0xc35fffffffffffff
	.xword		0xc35fffffffffffff
	.xword		0xc35fffffffffffff
	.xword		0xc360000000000000
	.xword		0xc360000000000000
	.xword		0xc360000000000000
	.xword		0xc3dffffffffffffe
	.xword		0xc3dfffffffffffff
	.xword		0xc3dfffffffffffff
	.xword		0xc3dfffffffffffff
	.xword		0xc3dfffffffffffff
	.xword		0xc3e0000000000000
	.xword		0xc3e0000000000000
	.xword		0xc3e0000000000000
	.xword		0xc3dfffffffffffff
	.xword		0xc3dfffffffffffff
	.xword		0xc3e0000000000000
	.xword		0xc3e0000000000000
	.xword		0xc3e0000000000000
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


