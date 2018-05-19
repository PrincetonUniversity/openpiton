// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fdtox_ld0_near.s
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
* Name:   fdtox_ld0_near.s
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

! Testing fdtox with rounding mode near

!// fdtox_ld0_near
!//
!//	Test FDTOX generating leading 0's in round to nearest mode.
!//      Outputs are:
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
	.xword		0x0000000000000000


source1:
	.xword		0x0000000000000000
	.xword		0x3ff0000000000000
	.xword		0x4000000000000000
	.xword		0x4010000000000000
	.xword		0x4020000000000000
	.xword		0x4030000000000000
	.xword		0x4040000000000000
	.xword		0x4050000000000000
	.xword		0x4060000000000000
	.xword		0x4070000000000000
	.xword		0x4080000000000000
	.xword		0x4090000000000000
	.xword		0x40a0000000000000
	.xword		0x40b0000000000000
	.xword		0x40c0000000000000
	.xword		0x40d0000000000000
	.xword		0x40e0000000000000
	.xword		0x40f0000000000000
	.xword		0x4100000000000000
	.xword		0x4110000000000000
	.xword		0x4120000000000000
	.xword		0x4130000000000000
	.xword		0x4140000000000000
	.xword		0x4150000000000000
	.xword		0x4160000000000000
	.xword		0x4170000000000000
	.xword		0x4180000000000000
	.xword		0x4190000000000000
	.xword		0x41a0000000000000
	.xword		0x41b0000000000000
	.xword		0x41c0000000000000
	.xword		0x41d0000000000000
	.xword		0x41e0000000000000
	.xword		0x41f0000000000000
	.xword		0x4200000000000000
	.xword		0x4210000000000000
	.xword		0x4220000000000000
	.xword		0x4230000000000000
	.xword		0x4240000000000000
	.xword		0x4250000000000000
	.xword		0x4260000000000000
	.xword		0x4270000000000000
	.xword		0x4280000000000000
	.xword		0x4290000000000000
	.xword		0x42a0000000000000
	.xword		0x42b0000000000000
	.xword		0x42c0000000000000
	.xword		0x42d0000000000000
	.xword		0x42e0000000000000
	.xword		0x42f0000000000000
	.xword		0x4300000000000000
	.xword		0x4310000000000000
	.xword		0x4320000000000000
	.xword		0x4330000000000000
	.xword		0x4340000000000000
	.xword		0x4350000000000000
	.xword		0x4360000000000000
	.xword		0x4370000000000000
	.xword		0x4380000000000000
	.xword		0x4390000000000000
	.xword		0x43a0000000000000
	.xword		0x43b0000000000000
	.xword		0x43c0000000000000
	.xword		0x43d0000000000000
	.xword		0x400fffffffffffff
	.xword		0x401fffffffffffff
	.xword		0x402fffffffffffff
	.xword		0x403fffffffffffff
	.xword		0x404fffffffffffff
	.xword		0x405fffffffffffff
	.xword		0x406fffffffffffff
	.xword		0x407fffffffffffff
	.xword		0x408fffffffffffff
	.xword		0x409fffffffffffff
	.xword		0x40afffffffffffff
	.xword		0x40bfffffffffffff
	.xword		0x40cfffffffffffff
	.xword		0x40dfffffffffffff
	.xword		0x40efffffffffffff
	.xword		0x40ffffffffffffff
	.xword		0x410fffffffffffff
	.xword		0x411fffffffffffff
	.xword		0x412fffffffffffff
	.xword		0x413fffffffffffff
	.xword		0x414fffffffffffff
	.xword		0x415fffffffffffff
	.xword		0x416fffffffffffff
	.xword		0x417fffffffffffff
	.xword		0x418fffffffffffff
	.xword		0x419fffffffffffff
	.xword		0x41afffffffffffff
	.xword		0x41bfffffffffffff
	.xword		0x41cfffffffffffff
	.xword		0x41dfffffffffffff
	.xword		0x41efffffffffffff
	.xword		0x41ffffffffffffff
	.xword		0x420fffffffffffff
	.xword		0x421fffffffffffff
	.xword		0x422fffffffffffff
	.xword		0x423fffffffffffff
	.xword		0x424fffffffffffff
	.xword		0x425fffffffffffff
	.xword		0x426fffffffffffff
	.xword		0x427fffffffffffff
	.xword		0x428fffffffffffff
	.xword		0x429fffffffffffff
	.xword		0x42afffffffffffff
	.xword		0x42bfffffffffffff
	.xword		0x42cfffffffffffff
	.xword		0x42dfffffffffffff
	.xword		0x42efffffffffffff
	.xword		0x42ffffffffffffff
	.xword		0x430fffffffffffff
	.xword		0x431fffffffffffff
	.xword		0x432fffffffffffff
	.xword		0x433fffffffffffff
	.xword		0x434fffffffffffff
	.xword		0x435fffffffffffff
	.xword		0x436fffffffffffff
	.xword		0x437fffffffffffff
	.xword		0x438fffffffffffff
	.xword		0x439fffffffffffff
	.xword		0x43afffffffffffff
	.xword		0x43bfffffffffffff
	.xword		0x43cfffffffffffff
	.xword		0x43dfffffffffffff
	.xword		0xbff0000000000000
	.xword		0xc000000000000000
	.xword		0xc010000000000000
	.xword		0xc020000000000000
	.xword		0xc030000000000000
	.xword		0xc040000000000000
	.xword		0xc050000000000000
	.xword		0xc060000000000000
	.xword		0xc070000000000000
	.xword		0xc080000000000000
	.xword		0xc090000000000000
	.xword		0xc0a0000000000000
	.xword		0xc0b0000000000000
	.xword		0xc0c0000000000000
	.xword		0xc0d0000000000000
	.xword		0xc0e0000000000000
	.xword		0xc0f0000000000000
	.xword		0xc100000000000000
	.xword		0xc110000000000000
	.xword		0xc120000000000000
	.xword		0xc130000000000000
	.xword		0xc140000000000000
	.xword		0xc150000000000000
	.xword		0xc160000000000000
	.xword		0xc170000000000000
	.xword		0xc180000000000000
	.xword		0xc190000000000000
	.xword		0xc1a0000000000000
	.xword		0xc1b0000000000000
	.xword		0xc1c0000000000000
	.xword		0xc1d0000000000000
	.xword		0xc1e0000000000000
	.xword		0xc1f0000000000000
	.xword		0xc200000000000000
	.xword		0xc210000000000000
	.xword		0xc220000000000000
	.xword		0xc230000000000000
	.xword		0xc240000000000000
	.xword		0xc250000000000000
	.xword		0xc260000000000000
	.xword		0xc270000000000000
	.xword		0xc280000000000000
	.xword		0xc290000000000000
	.xword		0xc2a0000000000000
	.xword		0xc2b0000000000000
	.xword		0xc2c0000000000000
	.xword		0xc2d0000000000000
	.xword		0xc2e0000000000000
	.xword		0xc2f0000000000000
	.xword		0xc300000000000000
	.xword		0xc310000000000000
	.xword		0xc320000000000000
	.xword		0xc330000000000000
	.xword		0xc340000000000000
	.xword		0xc350000000000000
	.xword		0xc360000000000000
	.xword		0xc370000000000000
	.xword		0xc380000000000000
	.xword		0xc390000000000000
	.xword		0xc3a0000000000000
	.xword		0xc3b0000000000000
	.xword		0xc3c0000000000000
	.xword		0xc3d0000000000000
	.xword		0xc3e0000000000000
	.xword		0xc00fffffffffffff
	.xword		0xc01fffffffffffff
	.xword		0xc02fffffffffffff
	.xword		0xc03fffffffffffff
	.xword		0xc04fffffffffffff
	.xword		0xc05fffffffffffff
	.xword		0xc06fffffffffffff
	.xword		0xc07fffffffffffff
	.xword		0xc08fffffffffffff
	.xword		0xc09fffffffffffff
	.xword		0xc0afffffffffffff
	.xword		0xc0bfffffffffffff
	.xword		0xc0cfffffffffffff
	.xword		0xc0dfffffffffffff
	.xword		0xc0efffffffffffff
	.xword		0xc0ffffffffffffff
	.xword		0xc10fffffffffffff
	.xword		0xc11fffffffffffff
	.xword		0xc12fffffffffffff
	.xword		0xc13fffffffffffff
	.xword		0xc14fffffffffffff
	.xword		0xc15fffffffffffff
	.xword		0xc16fffffffffffff
	.xword		0xc17fffffffffffff
	.xword		0xc18fffffffffffff
	.xword		0xc19fffffffffffff
	.xword		0xc1afffffffffffff
	.xword		0xc1bfffffffffffff
	.xword		0xc1cfffffffffffff
	.xword		0xc1dfffffffffffff
	.xword		0xc1efffffffffffff
	.xword		0xc1ffffffffffffff
	.xword		0xc20fffffffffffff
	.xword		0xc21fffffffffffff
	.xword		0xc22fffffffffffff
	.xword		0xc23fffffffffffff
	.xword		0xc24fffffffffffff
	.xword		0xc25fffffffffffff
	.xword		0xc26fffffffffffff
	.xword		0xc27fffffffffffff
	.xword		0xc28fffffffffffff
	.xword		0xc29fffffffffffff
	.xword		0xc2afffffffffffff
	.xword		0xc2bfffffffffffff
	.xword		0xc2cfffffffffffff
	.xword		0xc2dfffffffffffff
	.xword		0xc2efffffffffffff
	.xword		0xc2ffffffffffffff
	.xword		0xc30fffffffffffff
	.xword		0xc31fffffffffffff
	.xword		0xc32fffffffffffff
	.xword		0xc33fffffffffffff
	.xword		0xc34fffffffffffff
	.xword		0xc35fffffffffffff
	.xword		0xc36fffffffffffff
	.xword		0xc37fffffffffffff
	.xword		0xc38fffffffffffff
	.xword		0xc39fffffffffffff
	.xword		0xc3afffffffffffff
	.xword		0xc3bfffffffffffff
	.xword		0xc3cfffffffffffff
	.xword		0xc3dfffffffffffff
.align 8


source2:
.align 8


result:
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
	.xword		0x003ffffffffffffe
	.xword		0x007ffffffffffffc
	.xword		0x00fffffffffffff8
	.xword		0x01fffffffffffff0
	.xword		0x03ffffffffffffe0
	.xword		0x07ffffffffffffc0
	.xword		0x0fffffffffffff80
	.xword		0x1fffffffffffff00
	.xword		0x3ffffffffffffe00
	.xword		0x7ffffffffffffc00
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
	.xword		0xffc0000000000002
	.xword		0xff80000000000004
	.xword		0xff00000000000008
	.xword		0xfe00000000000010
	.xword		0xfc00000000000020
	.xword		0xf800000000000040
	.xword		0xf000000000000080
	.xword		0xe000000000000100
	.xword		0xc000000000000200
	.xword		0x8000000000000400
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
.align 8


scratch:
	.xword		0x0000000000000000
	.xword		0x0000000000000000


