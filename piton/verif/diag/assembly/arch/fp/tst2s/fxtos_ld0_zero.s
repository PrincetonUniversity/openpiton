// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fxtos_ld0_zero.s
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
* Name:   fxtos_ld0_zero.s
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

!// fxtos_ld0_zero
!//
!//	Test FXTOS leading 0s' counting in round to zero mode.
!//      Inputs are:
!//              - single 1 after leading 0's- positive
!//              - all 1's after leading 0's- positive
!//              - single 1 after leading 0's- negative
!//              - all 1's after leading 0's- negative


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


	set		252, %g1		! Set loop count
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
	.xword		0x0000000000000002
	.xword		0x0000000000000004
	.xword		0x0000000000000008
	.xword		0x0000000000000010
	.xword		0x0000000000000020
	.xword		0x0000000000000040
	.xword		0x0000000000000080
	.xword		0x0000000000000100
	.xword		0x0000000000000200
	.xword		0x0000000000000400
	.xword		0x0000000000000800
	.xword		0x0000000000001000
	.xword		0x0000000000002000
	.xword		0x0000000000004000
	.xword		0x0000000000008000
	.xword		0x0000000000010000
	.xword		0x0000000000020000
	.xword		0x0000000000040000
	.xword		0x0000000000080000
	.xword		0x0000000000100000
	.xword		0x0000000000200000
	.xword		0x0000000000400000
	.xword		0x0000000000800000
	.xword		0x0000000001000000
	.xword		0x0000000002000000
	.xword		0x0000000004000000
	.xword		0x0000000008000000
	.xword		0x0000000010000000
	.xword		0x0000000020000000
	.xword		0x0000000040000000
	.xword		0x0000000080000000
	.xword		0x0000000100000000
	.xword		0x0000000200000000
	.xword		0x0000000400000000
	.xword		0x0000000800000000
	.xword		0x0000001000000000
	.xword		0x0000002000000000
	.xword		0x0000004000000000
	.xword		0x0000008000000000
	.xword		0x0000010000000000
	.xword		0x0000020000000000
	.xword		0x0000040000000000
	.xword		0x0000080000000000
	.xword		0x0000100000000000
	.xword		0x0000200000000000
	.xword		0x0000400000000000
	.xword		0x0000800000000000
	.xword		0x0001000000000000
	.xword		0x0002000000000000
	.xword		0x0004000000000000
	.xword		0x0008000000000000
	.xword		0x0010000000000000
	.xword		0x0020000000000000
	.xword		0x0040000000000000
	.xword		0x0080000000000000
	.xword		0x0100000000000000
	.xword		0x0200000000000000
	.xword		0x0400000000000000
	.xword		0x0800000000000000
	.xword		0x1000000000000000
	.xword		0x2000000000000000
	.xword		0x4000000000000000
	.xword		0x0000000000000003
	.xword		0x0000000000000007
	.xword		0x000000000000000f
	.xword		0x000000000000001f
	.xword		0x000000000000003f
	.xword		0x000000000000007f
	.xword		0x00000000000000ff
	.xword		0x00000000000001ff
	.xword		0x00000000000003ff
	.xword		0x00000000000007ff
	.xword		0x0000000000000fff
	.xword		0x0000000000001fff
	.xword		0x0000000000003fff
	.xword		0x0000000000007fff
	.xword		0x000000000000ffff
	.xword		0x000000000001ffff
	.xword		0x000000000003ffff
	.xword		0x000000000007ffff
	.xword		0x00000000000fffff
	.xword		0x00000000001fffff
	.xword		0x00000000003fffff
	.xword		0x00000000007fffff
	.xword		0x0000000000ffffff
	.xword		0x0000000001ffffff
	.xword		0x0000000003ffffff
	.xword		0x0000000007ffffff
	.xword		0x000000000fffffff
	.xword		0x000000001fffffff
	.xword		0x000000003fffffff
	.xword		0x000000007fffffff
	.xword		0x00000000ffffffff
	.xword		0x00000001ffffffff
	.xword		0x00000003ffffffff
	.xword		0x00000007ffffffff
	.xword		0x0000000fffffffff
	.xword		0x0000001fffffffff
	.xword		0x0000003fffffffff
	.xword		0x0000007fffffffff
	.xword		0x000000ffffffffff
	.xword		0x000001ffffffffff
	.xword		0x000003ffffffffff
	.xword		0x000007ffffffffff
	.xword		0x00000fffffffffff
	.xword		0x00001fffffffffff
	.xword		0x00003fffffffffff
	.xword		0x00007fffffffffff
	.xword		0x0000ffffffffffff
	.xword		0x0001ffffffffffff
	.xword		0x0003ffffffffffff
	.xword		0x0007ffffffffffff
	.xword		0x000fffffffffffff
	.xword		0x001fffffffffffff
	.xword		0x003fffffffffffff
	.xword		0x007fffffffffffff
	.xword		0x00ffffffffffffff
	.xword		0x01ffffffffffffff
	.xword		0x03ffffffffffffff
	.xword		0x07ffffffffffffff
	.xword		0x0fffffffffffffff
	.xword		0x1fffffffffffffff
	.xword		0x3fffffffffffffff
	.xword		0x7fffffffffffffff
	.xword		0xffffffffffffffff
	.xword		0xfffffffffffffffe
	.xword		0xfffffffffffffffc
	.xword		0xfffffffffffffff8
	.xword		0xfffffffffffffff0
	.xword		0xffffffffffffffe0
	.xword		0xffffffffffffffc0
	.xword		0xffffffffffffff80
	.xword		0xffffffffffffff00
	.xword		0xfffffffffffffe00
	.xword		0xfffffffffffffc00
	.xword		0xfffffffffffff800
	.xword		0xfffffffffffff000
	.xword		0xffffffffffffe000
	.xword		0xffffffffffffc000
	.xword		0xffffffffffff8000
	.xword		0xffffffffffff0000
	.xword		0xfffffffffffe0000
	.xword		0xfffffffffffc0000
	.xword		0xfffffffffff80000
	.xword		0xfffffffffff00000
	.xword		0xffffffffffe00000
	.xword		0xffffffffffc00000
	.xword		0xffffffffff800000
	.xword		0xffffffffff000000
	.xword		0xfffffffffe000000
	.xword		0xfffffffffc000000
	.xword		0xfffffffff8000000
	.xword		0xfffffffff0000000
	.xword		0xffffffffe0000000
	.xword		0xffffffffc0000000
	.xword		0xffffffff80000000
	.xword		0xffffffff00000000
	.xword		0xfffffffe00000000
	.xword		0xfffffffc00000000
	.xword		0xfffffff800000000
	.xword		0xfffffff000000000
	.xword		0xffffffe000000000
	.xword		0xffffffc000000000
	.xword		0xffffff8000000000
	.xword		0xffffff0000000000
	.xword		0xfffffe0000000000
	.xword		0xfffffc0000000000
	.xword		0xfffff80000000000
	.xword		0xfffff00000000000
	.xword		0xffffe00000000000
	.xword		0xffffc00000000000
	.xword		0xffff800000000000
	.xword		0xffff000000000000
	.xword		0xfffe000000000000
	.xword		0xfffc000000000000
	.xword		0xfff8000000000000
	.xword		0xfff0000000000000
	.xword		0xffe0000000000000
	.xword		0xffc0000000000000
	.xword		0xff80000000000000
	.xword		0xff00000000000000
	.xword		0xfe00000000000000
	.xword		0xfc00000000000000
	.xword		0xf800000000000000
	.xword		0xf000000000000000
	.xword		0xe000000000000000
	.xword		0xc000000000000000
	.xword		0x8000000000000000
	.xword		0xfffffffffffffffd
	.xword		0xfffffffffffffff9
	.xword		0xfffffffffffffff1
	.xword		0xffffffffffffffe1
	.xword		0xffffffffffffffc1
	.xword		0xffffffffffffff81
	.xword		0xffffffffffffff01
	.xword		0xfffffffffffffe01
	.xword		0xfffffffffffffc01
	.xword		0xfffffffffffff801
	.xword		0xfffffffffffff001
	.xword		0xffffffffffffe001
	.xword		0xffffffffffffc001
	.xword		0xffffffffffff8001
	.xword		0xffffffffffff0001
	.xword		0xfffffffffffe0001
	.xword		0xfffffffffffc0001
	.xword		0xfffffffffff80001
	.xword		0xfffffffffff00001
	.xword		0xffffffffffe00001
	.xword		0xffffffffffc00001
	.xword		0xffffffffff800001
	.xword		0xffffffffff000001
	.xword		0xfffffffffe000001
	.xword		0xfffffffffc000001
	.xword		0xfffffffff8000001
	.xword		0xfffffffff0000001
	.xword		0xffffffffe0000001
	.xword		0xffffffffc0000001
	.xword		0xffffffff80000001
	.xword		0xffffffff00000001
	.xword		0xfffffffe00000001
	.xword		0xfffffffc00000001
	.xword		0xfffffff800000001
	.xword		0xfffffff000000001
	.xword		0xffffffe000000001
	.xword		0xffffffc000000001
	.xword		0xffffff8000000001
	.xword		0xffffff0000000001
	.xword		0xfffffe0000000001
	.xword		0xfffffc0000000001
	.xword		0xfffff80000000001
	.xword		0xfffff00000000001
	.xword		0xffffe00000000001
	.xword		0xffffc00000000001
	.xword		0xffff800000000001
	.xword		0xffff000000000001
	.xword		0xfffe000000000001
	.xword		0xfffc000000000001
	.xword		0xfff8000000000001
	.xword		0xfff0000000000001
	.xword		0xffe0000000000001
	.xword		0xffc0000000000001
	.xword		0xff80000000000001
	.xword		0xff00000000000001
	.xword		0xfe00000000000001
	.xword		0xfc00000000000001
	.xword		0xf800000000000001
	.xword		0xf000000000000001
	.xword		0xe000000000000001
	.xword		0xc000000000000001
	.xword		0x8000000000000001
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
	.word		0x4f000000
	.word		0x4f800000
	.word		0x50000000
	.word		0x50800000
	.word		0x51000000
	.word		0x51800000
	.word		0x52000000
	.word		0x52800000
	.word		0x53000000
	.word		0x53800000
	.word		0x54000000
	.word		0x54800000
	.word		0x55000000
	.word		0x55800000
	.word		0x56000000
	.word		0x56800000
	.word		0x57000000
	.word		0x57800000
	.word		0x58000000
	.word		0x58800000
	.word		0x59000000
	.word		0x59800000
	.word		0x5a000000
	.word		0x5a800000
	.word		0x5b000000
	.word		0x5b800000
	.word		0x5c000000
	.word		0x5c800000
	.word		0x5d000000
	.word		0x5d800000
	.word		0x5e000000
	.word		0x5e800000
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
	.word		0x4bffffff
	.word		0x4c7fffff
	.word		0x4cffffff
	.word		0x4d7fffff
	.word		0x4dffffff
	.word		0x4e7fffff
	.word		0x4effffff
	.word		0x4f7fffff
	.word		0x4fffffff
	.word		0x507fffff
	.word		0x50ffffff
	.word		0x517fffff
	.word		0x51ffffff
	.word		0x527fffff
	.word		0x52ffffff
	.word		0x537fffff
	.word		0x53ffffff
	.word		0x547fffff
	.word		0x54ffffff
	.word		0x557fffff
	.word		0x55ffffff
	.word		0x567fffff
	.word		0x56ffffff
	.word		0x577fffff
	.word		0x57ffffff
	.word		0x587fffff
	.word		0x58ffffff
	.word		0x597fffff
	.word		0x59ffffff
	.word		0x5a7fffff
	.word		0x5affffff
	.word		0x5b7fffff
	.word		0x5bffffff
	.word		0x5c7fffff
	.word		0x5cffffff
	.word		0x5d7fffff
	.word		0x5dffffff
	.word		0x5e7fffff
	.word		0x5effffff
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
	.word		0xcf800000
	.word		0xd0000000
	.word		0xd0800000
	.word		0xd1000000
	.word		0xd1800000
	.word		0xd2000000
	.word		0xd2800000
	.word		0xd3000000
	.word		0xd3800000
	.word		0xd4000000
	.word		0xd4800000
	.word		0xd5000000
	.word		0xd5800000
	.word		0xd6000000
	.word		0xd6800000
	.word		0xd7000000
	.word		0xd7800000
	.word		0xd8000000
	.word		0xd8800000
	.word		0xd9000000
	.word		0xd9800000
	.word		0xda000000
	.word		0xda800000
	.word		0xdb000000
	.word		0xdb800000
	.word		0xdc000000
	.word		0xdc800000
	.word		0xdd000000
	.word		0xdd800000
	.word		0xde000000
	.word		0xde800000
	.word		0xdf000000
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
	.word		0xcbffffff
	.word		0xcc7fffff
	.word		0xccffffff
	.word		0xcd7fffff
	.word		0xcdffffff
	.word		0xce7fffff
	.word		0xceffffff
	.word		0xcf7fffff
	.word		0xcfffffff
	.word		0xd07fffff
	.word		0xd0ffffff
	.word		0xd17fffff
	.word		0xd1ffffff
	.word		0xd27fffff
	.word		0xd2ffffff
	.word		0xd37fffff
	.word		0xd3ffffff
	.word		0xd47fffff
	.word		0xd4ffffff
	.word		0xd57fffff
	.word		0xd5ffffff
	.word		0xd67fffff
	.word		0xd6ffffff
	.word		0xd77fffff
	.word		0xd7ffffff
	.word		0xd87fffff
	.word		0xd8ffffff
	.word		0xd97fffff
	.word		0xd9ffffff
	.word		0xda7fffff
	.word		0xdaffffff
	.word		0xdb7fffff
	.word		0xdbffffff
	.word		0xdc7fffff
	.word		0xdcffffff
	.word		0xdd7fffff
	.word		0xddffffff
	.word		0xde7fffff
	.word		0xdeffffff
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
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
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
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
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
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
	.xword		0x0000000000000001
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


