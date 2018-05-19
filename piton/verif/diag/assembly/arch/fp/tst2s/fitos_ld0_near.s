// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fitos_ld0_near.s
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
* Name:   fitos_ld0_near.s
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

! Testing fitos with rounding mode near

!// fitos_ld0_near
!//
!//	Test FITOS leading 0s' counting in round to nearest mode.
!//	Inputs are:
!//		- single 1 after leading 0's- positive
!//		- all 1's after leading 0's- positive
!//		- single 1 after leading 0's- negative
!//		- all 1's after leading 0's- negative


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


	set		124, %g1		! Set loop count
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
	.xword		0x0000000000000000


source1:
	.word		0x00000000
	.word		0x00000001
	.word		0x00000002
	.word		0x00000004
	.word		0x00000008
	.word		0x00000010
	.word		0x00000020
	.word		0x00000040
	.word		0x00000080
	.word		0x00000100
	.word		0x00000200
	.word		0x00000400
	.word		0x00000800
	.word		0x00001000
	.word		0x00002000
	.word		0x00004000
	.word		0x00008000
	.word		0x00010000
	.word		0x00020000
	.word		0x00040000
	.word		0x00080000
	.word		0x00100000
	.word		0x00200000
	.word		0x00400000
	.word		0x00800000
	.word		0x01000000
	.word		0x02000000
	.word		0x04000000
	.word		0x08000000
	.word		0x10000000
	.word		0x20000000
	.word		0x40000000
	.word		0x00000003
	.word		0x00000007
	.word		0x0000000f
	.word		0x0000001f
	.word		0x0000003f
	.word		0x0000007f
	.word		0x000000ff
	.word		0x000001ff
	.word		0x000003ff
	.word		0x000007ff
	.word		0x00000fff
	.word		0x00001fff
	.word		0x00003fff
	.word		0x00007fff
	.word		0x0000ffff
	.word		0x0001ffff
	.word		0x0003ffff
	.word		0x0007ffff
	.word		0x000fffff
	.word		0x001fffff
	.word		0x003fffff
	.word		0x007fffff
	.word		0x00ffffff
	.word		0x01ffffff
	.word		0x03ffffff
	.word		0x07ffffff
	.word		0x0fffffff
	.word		0x1fffffff
	.word		0x3fffffff
	.word		0x7fffffff
	.word		0xffffffff
	.word		0xfffffffe
	.word		0xfffffffc
	.word		0xfffffff8
	.word		0xfffffff0
	.word		0xffffffe0
	.word		0xffffffc0
	.word		0xffffff80
	.word		0xffffff00
	.word		0xfffffe00
	.word		0xfffffc00
	.word		0xfffff800
	.word		0xfffff000
	.word		0xffffe000
	.word		0xffffc000
	.word		0xffff8000
	.word		0xffff0000
	.word		0xfffe0000
	.word		0xfffc0000
	.word		0xfff80000
	.word		0xfff00000
	.word		0xffe00000
	.word		0xffc00000
	.word		0xff800000
	.word		0xff000000
	.word		0xfe000000
	.word		0xfc000000
	.word		0xf8000000
	.word		0xf0000000
	.word		0xe0000000
	.word		0xc0000000
	.word		0x80000000
	.word		0xfffffffd
	.word		0xfffffff9
	.word		0xfffffff1
	.word		0xffffffe1
	.word		0xffffffc1
	.word		0xffffff81
	.word		0xffffff01
	.word		0xfffffe01
	.word		0xfffffc01
	.word		0xfffff801
	.word		0xfffff001
	.word		0xffffe001
	.word		0xffffc001
	.word		0xffff8001
	.word		0xffff0001
	.word		0xfffe0001
	.word		0xfffc0001
	.word		0xfff80001
	.word		0xfff00001
	.word		0xffe00001
	.word		0xffc00001
	.word		0xff800001
	.word		0xff000001
	.word		0xfe000001
	.word		0xfc000001
	.word		0xf8000001
	.word		0xf0000001
	.word		0xe0000001
	.word		0xc0000001
	.word		0x80000001
.align 8


source2:
.align 8


result:
	.word		0x00000000
	.word		0x3f800000
	.word		0x40000000
	.word		0x40800000
	.word		0x41000000
	.word		0x41800000
	.word		0x42000000
	.word		0x42800000
	.word		0x43000000
	.word		0x43800000
	.word		0x44000000
	.word		0x44800000
	.word		0x45000000
	.word		0x45800000
	.word		0x46000000
	.word		0x46800000
	.word		0x47000000
	.word		0x47800000
	.word		0x48000000
	.word		0x48800000
	.word		0x49000000
	.word		0x49800000
	.word		0x4a000000
	.word		0x4a800000
	.word		0x4b000000
	.word		0x4b800000
	.word		0x4c000000
	.word		0x4c800000
	.word		0x4d000000
	.word		0x4d800000
	.word		0x4e000000
	.word		0x4e800000
	.word		0x40400000
	.word		0x40e00000
	.word		0x41700000
	.word		0x41f80000
	.word		0x427c0000
	.word		0x42fe0000
	.word		0x437f0000
	.word		0x43ff8000
	.word		0x447fc000
	.word		0x44ffe000
	.word		0x457ff000
	.word		0x45fff800
	.word		0x467ffc00
	.word		0x46fffe00
	.word		0x477fff00
	.word		0x47ffff80
	.word		0x487fffc0
	.word		0x48ffffe0
	.word		0x497ffff0
	.word		0x49fffff8
	.word		0x4a7ffffc
	.word		0x4afffffe
	.word		0x4b7fffff
	.word		0x4c000000
	.word		0x4c800000
	.word		0x4d000000
	.word		0x4d800000
	.word		0x4e000000
	.word		0x4e800000
	.word		0x4f000000
	.word		0xbf800000
	.word		0xc0000000
	.word		0xc0800000
	.word		0xc1000000
	.word		0xc1800000
	.word		0xc2000000
	.word		0xc2800000
	.word		0xc3000000
	.word		0xc3800000
	.word		0xc4000000
	.word		0xc4800000
	.word		0xc5000000
	.word		0xc5800000
	.word		0xc6000000
	.word		0xc6800000
	.word		0xc7000000
	.word		0xc7800000
	.word		0xc8000000
	.word		0xc8800000
	.word		0xc9000000
	.word		0xc9800000
	.word		0xca000000
	.word		0xca800000
	.word		0xcb000000
	.word		0xcb800000
	.word		0xcc000000
	.word		0xcc800000
	.word		0xcd000000
	.word		0xcd800000
	.word		0xce000000
	.word		0xce800000
	.word		0xcf000000
	.word		0xc0400000
	.word		0xc0e00000
	.word		0xc1700000
	.word		0xc1f80000
	.word		0xc27c0000
	.word		0xc2fe0000
	.word		0xc37f0000
	.word		0xc3ff8000
	.word		0xc47fc000
	.word		0xc4ffe000
	.word		0xc57ff000
	.word		0xc5fff800
	.word		0xc67ffc00
	.word		0xc6fffe00
	.word		0xc77fff00
	.word		0xc7ffff80
	.word		0xc87fffc0
	.word		0xc8ffffe0
	.word		0xc97ffff0
	.word		0xc9fffff8
	.word		0xca7ffffc
	.word		0xcafffffe
	.word		0xcb7fffff
	.word		0xcc000000
	.word		0xcc800000
	.word		0xcd000000
	.word		0xcd800000
	.word		0xce000000
	.word		0xce800000
	.word		0xcf000000
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
	.xword		0x0000000000000001
	.xword		0x0000000000000001
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
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
.align 8


scratch:
	.xword		0x0000000000000000
	.xword		0x0000000000000000


