// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fadds_ieee_ninf2.s
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
* Name:   fadds_ieee_ninf2.s
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

! Testing fadds with rounding mode ninf



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


	set		311, %g1		! Set loop count
	set		0x0, %g2		! Set loop iterator


fadds_loop:
	ldx		[%l6+0x0], %fsr


	! instruction specific code

	sll		%g2, 0x2, %g3

	ldx		[%l6], %fsr		! Load fsr with rounding mode
	ld		[%l1+%g3], %f0		! Load source 1
	ld		[%l2+%g3], %f2		! Load source 2
	fadds		%f0, %f2, %f4		! Perform the operation
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
	bne,a		fadds_loop		! Loop
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
	.word		0x80000001
	.word		0x7f7fffff
	.word		0xff7fffff
	.word		0x3f800001
	.word		0xbf800000
	.word		0x7f000001
	.word		0xff000000
	.word		0x00800001
	.word		0x80800000
	.word		0xc0000000
	.word		0x40000001
	.word		0xfe800000
	.word		0x7e800001
	.word		0xbf800001
	.word		0x3f800000
	.word		0xff000001
	.word		0x7f000000
	.word		0x80800001
	.word		0x00800000
	.word		0x40000000
	.word		0xc0000001
	.word		0x7e800000
	.word		0xfe800001
	.word		0x00000002
	.word		0x80000001
	.word		0xbf800001
	.word		0x3f800002
	.word		0xff000001
	.word		0x7f000002
	.word		0x80800001
	.word		0x00800002
	.word		0x80000002
	.word		0x00000001
	.word		0x3f800001
	.word		0xbf800002
	.word		0x7f000001
	.word		0xff000002
	.word		0x00800001
	.word		0x80800002
	.word		0x80000003
	.word		0x00000002
	.word		0x00000003
	.word		0x80000002
	.word		0x40000004
	.word		0xc0000003
	.word		0x7e800004
	.word		0xfe800003
	.word		0xc0000004
	.word		0x40000003
	.word		0xfe800004
	.word		0x7e800003
	.word		0x407fffff
	.word		0xc07ffffe
	.word		0x7e7fffff
	.word		0xfe7ffffe
	.word		0x007fffff
	.word		0x807ffffe
	.word		0xff7ffffe
	.word		0x7f7fffff
	.word		0xc07fffff
	.word		0x407ffffe
	.word		0xfe7fffff
	.word		0x7e7ffffe
	.word		0x807fffff
	.word		0x007ffffe
	.word		0x7f7ffffe
	.word		0xff7fffff
	.word		0x007ffffd
	.word		0x807ffffe
	.word		0x807ffffd
	.word		0x007ffffe
	.word		0x3ffffffc
	.word		0xbffffffd
	.word		0xbffffffc
	.word		0x3ffffffd
	.word		0x007fffff
	.word		0x80800000
	.word		0x3fffffff
	.word		0xc0000000
	.word		0x017fffff
	.word		0x81800000
	.word		0x7effffff
	.word		0xff000000
	.word		0x00ffffff
	.word		0x81000000
	.word		0xfe800000
	.word		0x7e7fffff
	.word		0x40000000
	.word		0xbfffffff
	.word		0x7e800000
	.word		0xfe7fffff
	.word		0x01000000
	.word		0x80ffffff
	.word		0x01800000
	.word		0x817fffff
	.word		0x807fffff
	.word		0x00800000
	.word		0xfeffffff
	.word		0x7f000000
	.word		0x407fffff
	.word		0xc0800001
	.word		0xfd800001
	.word		0x7d7fffff
	.word		0x81000001
	.word		0x00ffffff
	.word		0x81800001
	.word		0x017fffff
	.word		0xc07fffff
	.word		0x40800001
	.word		0x7d800001
	.word		0xfd7fffff
	.word		0x01000001
	.word		0x80ffffff
	.word		0x01800001
	.word		0x817fffff
	.word		0x407fffff
	.word		0xc0800002
	.word		0x7e7fffff
	.word		0xfe800002
	.word		0x00ffffff
	.word		0x81000002
	.word		0xc07fffff
	.word		0x40800002
	.word		0xfe7fffff
	.word		0x7e800002
	.word		0x80ffffff
	.word		0x01000002
	.word		0x00ffffff
	.word		0x81000004
	.word		0x80ffffff
	.word		0x01000004
	.word		0x40000001
	.word		0xbf800001
	.word		0x01000001
	.word		0x80800001
	.word		0xc0000001
	.word		0x3f800001
	.word		0x81000001
	.word		0x00800001
	.word		0xfe800001
	.word		0x7f000001
	.word		0x7e800001
	.word		0xff000001
	.word		0x40000002
	.word		0xbf800001
	.word		0x7f000002
	.word		0xfe800001
	.word		0x01000002
	.word		0x80800001
	.word		0xc0000002
	.word		0x3f800001
	.word		0xff000002
	.word		0x7e800001
	.word		0x81000002
	.word		0x00800001
	.word		0x40000002
	.word		0xbf800003
	.word		0x7e800002
	.word		0xfe000003
	.word		0x01800002
	.word		0x81000003
	.word		0xc0000002
	.word		0x3f800003
	.word		0xfe800002
	.word		0x7e000003
	.word		0x81800002
	.word		0x01000003
	.word		0x3f800002
	.word		0xbf800000
	.word		0xbf800002
	.word		0x3f800000
	.word		0x3f800004
	.word		0xbf800000
	.word		0xbf800004
	.word		0x3f800000
	.word		0x3f800008
	.word		0xbf800000
	.word		0xbf800008
	.word		0x3f800000
	.word		0x41880000
	.word		0xc1800000
	.word		0xc1880000
	.word		0x41800000
	.word		0x41800000
	.word		0xc1880000
	.word		0x41100000
	.word		0xc1000000
	.word		0xc1100000
	.word		0x41000000
	.word		0x40a00000
	.word		0xc0800000
	.word		0xc0a00000
	.word		0x40800000
	.word		0x40400000
	.word		0xc0000000
	.word		0xc0400000
	.word		0x40000000
	.word		0x40000000
	.word		0x3f800001
	.word		0x41200000
	.word		0x3f800001
	.word		0x41980000
	.word		0x3f800001
	.word		0x42000000
	.word		0x3f800001
	.word		0x42820000
	.word		0x3f800001
	.word		0x43050000
	.word		0x3f800001
	.word		0x43820000
	.word		0x3f800001
	.word		0x44054000
	.word		0x3f800001
	.word		0x4480a000
	.word		0x3f800001
	.word		0x45000000
	.word		0x3f800001
	.word		0x45800800
	.word		0x3f800001
	.word		0x46000400
	.word		0x3f800001
	.word		0x46800000
	.word		0x3f800001
	.word		0x47000c00
	.word		0x3f800001
	.word		0x47800980
	.word		0x3f800001
	.word		0x48000000
	.word		0x3f800001
	.word		0x48806b00
	.word		0x3f800001
	.word		0x49002c80
	.word		0x3f800001
	.word		0x49802c80
	.word		0x3f800001
	.word		0x49ff74e0
	.word		0x3f800001
	.word		0x4a800002
	.word		0x3f800001
	.word		0x4b000001
	.word		0x3f800001
	.word		0x4b800000
	.word		0x40800001
	.word		0x4b800000
	.word		0x40000001
	.word		0xc0000000
	.word		0xbf800001
	.word		0xcb800000
	.word		0xc0800001
	.word		0xcb800000
	.word		0xc0000001
	.word		0x46fffe00
	.word		0x3f800000
	.word		0xc6fffe00
	.word		0xbf800000
	.word		0x4b7fffff
	.word		0x3f800000
	.word		0xcb7fffff
	.word		0xbf800000
	.word		0x3f800000
	.word		0x41700000
	.word		0xbf800000
	.word		0xc1700000
	.word		0x40000000
	.word		0x4b7ffffb
	.word		0xc0000000
	.word		0xcb7ffffb
	.word		0x007fffff
	.word		0x00000001
	.word		0x807fffff
	.word		0x80000001
	.word		0x00700000
	.word		0x00100000
	.word		0x80700000
	.word		0x80100000
	.word		0x40000000
	.word		0x46fffa00
	.word		0xc0000000
	.word		0xc6fffa00
	.word		0x3f800000
	.word		0x4b7ffffe
	.word		0xbf800000
	.word		0xcb7ffffe
	.word		0x40400000
	.word		0x4b7ffffa
	.word		0xc0400000
	.word		0xcb7ffffa
	.word		0x3f800000
	.word		0x41600000
	.word		0xbf800000
	.word		0xc1600000
	.word		0x40000000
	.word		0x41500000
	.word		0xc0000000
	.word		0xc1500000
	.word		0x007ffffe
	.word		0x00000001
	.word		0x807ffffe
	.word		0x80000001
	.word		0x00600000
	.word		0x00100000
	.word		0x80600000
	.word		0x80100000
	.word		0xbfffffff
	.word		0xb3800000
	.word		0xc07fffff
	.word		0xb3800000
	.word		0xc0ffffff
	.word		0xb3800000
	.word		0xfeffffff
	.word		0xbf800000
.align 8


source2:
	.word		0x00000001
	.word		0xff7fffff
	.word		0x7f7fffff
	.word		0xbf800000
	.word		0x3f800001
	.word		0xff000000
	.word		0x7f000001
	.word		0x80800000
	.word		0x00800001
	.word		0x40000001
	.word		0xc0000000
	.word		0x7e800001
	.word		0xfe800000
	.word		0x3f800000
	.word		0xbf800001
	.word		0x7f000000
	.word		0xff000001
	.word		0x00800000
	.word		0x80800001
	.word		0xc0000001
	.word		0x40000000
	.word		0xfe800001
	.word		0x7e800000
	.word		0x80000001
	.word		0x00000002
	.word		0x3f800002
	.word		0xbf800001
	.word		0x7f000002
	.word		0xff000001
	.word		0x00800002
	.word		0x80800001
	.word		0x00000001
	.word		0x80000002
	.word		0xbf800002
	.word		0x3f800001
	.word		0xff000002
	.word		0x7f000001
	.word		0x80800002
	.word		0x00800001
	.word		0x00000002
	.word		0x80000003
	.word		0x80000002
	.word		0x00000003
	.word		0xc0000003
	.word		0x40000004
	.word		0xfe800003
	.word		0x7e800004
	.word		0x40000003
	.word		0xc0000004
	.word		0x7e800003
	.word		0xfe800004
	.word		0xc07ffffe
	.word		0x407fffff
	.word		0xfe7ffffe
	.word		0x7e7fffff
	.word		0x807ffffe
	.word		0x007fffff
	.word		0x7f7fffff
	.word		0xff7ffffe
	.word		0x407ffffe
	.word		0xc07fffff
	.word		0x7e7ffffe
	.word		0xfe7fffff
	.word		0x007ffffe
	.word		0x807fffff
	.word		0xff7fffff
	.word		0x7f7ffffe
	.word		0x807ffffe
	.word		0x007ffffd
	.word		0x007ffffe
	.word		0x807ffffd
	.word		0xbffffffd
	.word		0x3ffffffc
	.word		0x3ffffffd
	.word		0xbffffffc
	.word		0x80800000
	.word		0x007fffff
	.word		0xc0000000
	.word		0x3fffffff
	.word		0x81800000
	.word		0x017fffff
	.word		0xff000000
	.word		0x7effffff
	.word		0x81000000
	.word		0x00ffffff
	.word		0x7e7fffff
	.word		0xfe800000
	.word		0xbfffffff
	.word		0x40000000
	.word		0xfe7fffff
	.word		0x7e800000
	.word		0x80ffffff
	.word		0x01000000
	.word		0x817fffff
	.word		0x01800000
	.word		0x00800000
	.word		0x807fffff
	.word		0x7f000000
	.word		0xfeffffff
	.word		0xc0800001
	.word		0x407fffff
	.word		0x7d7fffff
	.word		0xfd800001
	.word		0x00ffffff
	.word		0x81000001
	.word		0x017fffff
	.word		0x81800001
	.word		0x40800001
	.word		0xc07fffff
	.word		0xfd7fffff
	.word		0x7d800001
	.word		0x80ffffff
	.word		0x01000001
	.word		0x817fffff
	.word		0x01800001
	.word		0xc0800002
	.word		0x407fffff
	.word		0xfe800002
	.word		0x7e7fffff
	.word		0x81000002
	.word		0x00ffffff
	.word		0x40800002
	.word		0xc07fffff
	.word		0x7e800002
	.word		0xfe7fffff
	.word		0x01000002
	.word		0x80ffffff
	.word		0x81000004
	.word		0x00ffffff
	.word		0x01000004
	.word		0x80ffffff
	.word		0xbf800001
	.word		0x40000001
	.word		0x80800001
	.word		0x01000001
	.word		0x3f800001
	.word		0xc0000001
	.word		0x00800001
	.word		0x81000001
	.word		0x7f000001
	.word		0xfe800001
	.word		0xff000001
	.word		0x7e800001
	.word		0xbf800001
	.word		0x40000002
	.word		0xfe800001
	.word		0x7f000002
	.word		0x80800001
	.word		0x01000002
	.word		0x3f800001
	.word		0xc0000002
	.word		0x7e800001
	.word		0xff000002
	.word		0x00800001
	.word		0x81000002
	.word		0xbf800003
	.word		0x40000002
	.word		0xfe000003
	.word		0x7e800002
	.word		0x81000003
	.word		0x01800002
	.word		0x3f800003
	.word		0xc0000002
	.word		0x7e000003
	.word		0xfe800002
	.word		0x01000003
	.word		0x81800002
	.word		0xbf800000
	.word		0x3f800002
	.word		0x3f800000
	.word		0xbf800002
	.word		0xbf800000
	.word		0x3f800004
	.word		0x3f800000
	.word		0xbf800004
	.word		0xbf800000
	.word		0x3f800008
	.word		0x3f800000
	.word		0xbf800008
	.word		0xc1800000
	.word		0x41880000
	.word		0x41800000
	.word		0xc1880000
	.word		0xc1880000
	.word		0x41800000
	.word		0xc1000000
	.word		0x41100000
	.word		0x41000000
	.word		0xc1100000
	.word		0xc0800000
	.word		0x40a00000
	.word		0x40800000
	.word		0xc0a00000
	.word		0xc0000000
	.word		0x40400000
	.word		0x40000000
	.word		0xc0400000
	.word		0x3f800001
	.word		0x40000000
	.word		0x3f800001
	.word		0x41200000
	.word		0x3f800001
	.word		0x41980000
	.word		0x3f800001
	.word		0x42000000
	.word		0x3f800001
	.word		0x42820000
	.word		0x3f800001
	.word		0x43050000
	.word		0x3f800001
	.word		0x43820000
	.word		0x3f800001
	.word		0x44054000
	.word		0x3f800001
	.word		0x4480a000
	.word		0x3f800001
	.word		0x45000000
	.word		0x3f800001
	.word		0x45800800
	.word		0x3f800001
	.word		0x46000400
	.word		0x3f800001
	.word		0x46800000
	.word		0x3f800001
	.word		0x47000c00
	.word		0x3f800001
	.word		0x47800980
	.word		0x3f800001
	.word		0x48000000
	.word		0x3f800001
	.word		0x48806b00
	.word		0x3f800001
	.word		0x49002c80
	.word		0x3f800001
	.word		0x49802c80
	.word		0x3f800001
	.word		0x49ff74e0
	.word		0x3f800001
	.word		0x4a800002
	.word		0x3f800001
	.word		0x4b000001
	.word		0x40800001
	.word		0x4b800000
	.word		0x40000001
	.word		0x4b800000
	.word		0xbf800001
	.word		0xc0000000
	.word		0xc0800001
	.word		0xcb800000
	.word		0xc0000001
	.word		0xcb800000
	.word		0x3f800000
	.word		0x46fffe00
	.word		0xbf800000
	.word		0xc6fffe00
	.word		0x3f800000
	.word		0x4b7fffff
	.word		0xbf800000
	.word		0xcb7fffff
	.word		0x41700000
	.word		0x3f800000
	.word		0xc1700000
	.word		0xbf800000
	.word		0x4b7ffffb
	.word		0x40000000
	.word		0xcb7ffffb
	.word		0xc0000000
	.word		0x00000001
	.word		0x007fffff
	.word		0x80000001
	.word		0x807fffff
	.word		0x00100000
	.word		0x00700000
	.word		0x80100000
	.word		0x80700000
	.word		0x46fffa00
	.word		0x40000000
	.word		0xc6fffa00
	.word		0xc0000000
	.word		0x4b7ffffe
	.word		0x3f800000
	.word		0xcb7ffffe
	.word		0xbf800000
	.word		0x4b7ffffa
	.word		0x40400000
	.word		0xcb7ffffa
	.word		0xc0400000
	.word		0x41600000
	.word		0x3f800000
	.word		0xc1600000
	.word		0xbf800000
	.word		0x41500000
	.word		0x40000000
	.word		0xc1500000
	.word		0xc0000000
	.word		0x00000001
	.word		0x007ffffe
	.word		0x80000001
	.word		0x807ffffe
	.word		0x00100000
	.word		0x00600000
	.word		0x80100000
	.word		0x80600000
	.word		0xb3800000
	.word		0xbfffffff
	.word		0xb3800000
	.word		0xc07fffff
	.word		0xb3800000
	.word		0xc0ffffff
	.word		0xbf800000
	.word		0xfeffffff
.align 8


result:
	.word		0x80000000
	.word		0x80000000
	.word		0x80000000
	.word		0x34000000
	.word		0x34000000
	.word		0x73800000
	.word		0x73800000
	.word		0x00000001
	.word		0x00000001
	.word		0x34800000
	.word		0x34800000
	.word		0x73000000
	.word		0x73000000
	.word		0xb4000000
	.word		0xb4000000
	.word		0xf3800000
	.word		0xf3800000
	.word		0x80000001
	.word		0x80000001
	.word		0xb4800000
	.word		0xb4800000
	.word		0xf3000000
	.word		0xf3000000
	.word		0x00000001
	.word		0x00000001
	.word		0x34000000
	.word		0x34000000
	.word		0x73800000
	.word		0x73800000
	.word		0x00000001
	.word		0x00000001
	.word		0x80000001
	.word		0x80000001
	.word		0xb4000000
	.word		0xb4000000
	.word		0xf3800000
	.word		0xf3800000
	.word		0x80000001
	.word		0x80000001
	.word		0x80000001
	.word		0x80000001
	.word		0x00000001
	.word		0x00000001
	.word		0x34800000
	.word		0x34800000
	.word		0x73000000
	.word		0x73000000
	.word		0xb4800000
	.word		0xb4800000
	.word		0xf3000000
	.word		0xf3000000
	.word		0x34800000
	.word		0x34800000
	.word		0x72800000
	.word		0x72800000
	.word		0x00000001
	.word		0x00000001
	.word		0x73800000
	.word		0x73800000
	.word		0xb4800000
	.word		0xb4800000
	.word		0xf2800000
	.word		0xf2800000
	.word		0x80000001
	.word		0x80000001
	.word		0xf3800000
	.word		0xf3800000
	.word		0x80000001
	.word		0x80000001
	.word		0x00000001
	.word		0x00000001
	.word		0xb4000000
	.word		0xb4000000
	.word		0x34000000
	.word		0x34000000
	.word		0x80000001
	.word		0x80000001
	.word		0xb4000000
	.word		0xb4000000
	.word		0x80000002
	.word		0x80000002
	.word		0xf3000000
	.word		0xf3000000
	.word		0x80000001
	.word		0x80000001
	.word		0xf2800000
	.word		0xf2800000
	.word		0x34000000
	.word		0x34000000
	.word		0x72800000
	.word		0x72800000
	.word		0x00000001
	.word		0x00000001
	.word		0x00000002
	.word		0x00000002
	.word		0x00000001
	.word		0x00000001
	.word		0x73000000
	.word		0x73000000
	.word		0xb5400000
	.word		0xb5400000
	.word		0xf2400000
	.word		0xf2400000
	.word		0x80000003
	.word		0x80000003
	.word		0x80000006
	.word		0x80000006
	.word		0x35400000
	.word		0x35400000
	.word		0x72400000
	.word		0x72400000
	.word		0x00000003
	.word		0x00000003
	.word		0x00000006
	.word		0x00000006
	.word		0xb5a00000
	.word		0xb5a00000
	.word		0xf3a00000
	.word		0xf3a00000
	.word		0x80000005
	.word		0x80000005
	.word		0x35a00000
	.word		0x35a00000
	.word		0x73a00000
	.word		0x73a00000
	.word		0x00000005
	.word		0x00000005
	.word		0x80000009
	.word		0x80000009
	.word		0x00000009
	.word		0x00000009
	.word		0x3f800001
	.word		0x3f800001
	.word		0x00800001
	.word		0x00800001
	.word		0xbf800001
	.word		0xbf800001
	.word		0x80800001
	.word		0x80800001
	.word		0x7e800001
	.word		0x7e800001
	.word		0xfe800001
	.word		0xfe800001
	.word		0x3f800003
	.word		0x3f800003
	.word		0x7e800003
	.word		0x7e800003
	.word		0x00800003
	.word		0x00800003
	.word		0xbf800003
	.word		0xbf800003
	.word		0xfe800003
	.word		0xfe800003
	.word		0x80800003
	.word		0x80800003
	.word		0x3f800001
	.word		0x3f800001
	.word		0x7e000001
	.word		0x7e000001
	.word		0x01000001
	.word		0x01000001
	.word		0xbf800001
	.word		0xbf800001
	.word		0xfe000001
	.word		0xfe000001
	.word		0x81000001
	.word		0x81000001
	.word		0x34800000
	.word		0x34800000
	.word		0xb4800000
	.word		0xb4800000
	.word		0x35000000
	.word		0x35000000
	.word		0xb5000000
	.word		0xb5000000
	.word		0x35800000
	.word		0x35800000
	.word		0xb5800000
	.word		0xb5800000
	.word		0x3f800000
	.word		0x3f800000
	.word		0xbf800000
	.word		0xbf800000
	.word		0xbf800000
	.word		0xbf800000
	.word		0x3f800000
	.word		0x3f800000
	.word		0xbf800000
	.word		0xbf800000
	.word		0x3f800000
	.word		0x3f800000
	.word		0xbf800000
	.word		0xbf800000
	.word		0x3f800000
	.word		0x3f800000
	.word		0xbf800000
	.word		0xbf800000
	.word		0x40400000
	.word		0x40400000
	.word		0x41300000
	.word		0x41300000
	.word		0x41a00000
	.word		0x41a00000
	.word		0x42040000
	.word		0x42040000
	.word		0x42840000
	.word		0x42840000
	.word		0x43060000
	.word		0x43060000
	.word		0x43828000
	.word		0x43828000
	.word		0x44058000
	.word		0x44058000
	.word		0x4480c000
	.word		0x4480c000
	.word		0x45001000
	.word		0x45001000
	.word		0x45801000
	.word		0x45801000
	.word		0x46000800
	.word		0x46000800
	.word		0x46800200
	.word		0x46800200
	.word		0x47000d00
	.word		0x47000d00
	.word		0x47800a00
	.word		0x47800a00
	.word		0x48000040
	.word		0x48000040
	.word		0x48806b20
	.word		0x48806b20
	.word		0x49002c90
	.word		0x49002c90
	.word		0x49802c88
	.word		0x49802c88
	.word		0x49ff74e8
	.word		0x49ff74e8
	.word		0x4a800004
	.word		0x4a800004
	.word		0x4b000002
	.word		0x4b000002
	.word		0x4b800002
	.word		0x4b800002
	.word		0x4b800001
	.word		0x4b800001
	.word		0xc0400001
	.word		0xc0400001
	.word		0xcb800003
	.word		0xcb800003
	.word		0xcb800002
	.word		0xcb800002
	.word		0x47000000
	.word		0x47000000
	.word		0xc7000000
	.word		0xc7000000
	.word		0x4b800000
	.word		0x4b800000
	.word		0xcb800000
	.word		0xcb800000
	.word		0x41800000
	.word		0x41800000
	.word		0xc1800000
	.word		0xc1800000
	.word		0x4b7ffffd
	.word		0x4b7ffffd
	.word		0xcb7ffffd
	.word		0xcb7ffffd
	.word		0x00800000
	.word		0x00800000
	.word		0x80800000
	.word		0x80800000
	.word		0x00800000
	.word		0x00800000
	.word		0x80800000
	.word		0x80800000
	.word		0x46fffe00
	.word		0x46fffe00
	.word		0xc6fffe00
	.word		0xc6fffe00
	.word		0x4b7fffff
	.word		0x4b7fffff
	.word		0xcb7fffff
	.word		0xcb7fffff
	.word		0x4b7ffffd
	.word		0x4b7ffffd
	.word		0xcb7ffffd
	.word		0xcb7ffffd
	.word		0x41700000
	.word		0x41700000
	.word		0xc1700000
	.word		0xc1700000
	.word		0x41700000
	.word		0x41700000
	.word		0xc1700000
	.word		0xc1700000
	.word		0x007fffff
	.word		0x007fffff
	.word		0x807fffff
	.word		0x807fffff
	.word		0x00700000
	.word		0x00700000
	.word		0x80700000
	.word		0x80700000
	.word		0xc0000000
	.word		0xc0000000
	.word		0xc0800000
	.word		0xc0800000
	.word		0xc1000000
	.word		0xc1000000
	.word		0xff000000
	.word		0xff000000
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
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
	.xword		0x0000000000000000
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
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
	.xword		0x0000000000000004
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


