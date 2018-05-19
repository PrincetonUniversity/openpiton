// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fdivs_ieee_near2.s
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
* Name:   fdivs_ieee_near2.s
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

! Testing fdivs with rounding mode near



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


	set		60, %g1		! Set loop count
	set		0x0, %g2		! Set loop iterator


fdivs_loop:
	ldx		[%l6+0x0], %fsr


	! instruction specific code

	sll		%g2, 0x2, %g3

	ldx		[%l6], %fsr		! Load fsr with rounding mode
	ld		[%l1+%g3], %f0		! Load source 1
	ld		[%l2+%g3], %f2		! Load source 2
	fdivs		%f0, %f2, %f4		! Perform the operation
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
	bne,a		fdivs_loop		! Loop
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
	.word		0x40400002
	.word		0xc0400002
	.word		0x40400002
	.word		0xc0400002
	.word		0x00600001
	.word		0x80600001
	.word		0x00600001
	.word		0x80600001
	.word		0x3f800000
	.word		0x3f800000
	.word		0x3f800000
	.word		0x3f800000
	.word		0xbf800000
	.word		0xbf800000
	.word		0x3f800000
	.word		0x3f7fffff
	.word		0x3f7ffffe
	.word		0x3f7fffff
	.word		0x3f7ffffd
	.word		0x3f7ffffe
	.word		0x3f7ffffc
	.word		0x3f7ffffa
	.word		0x3f800001
	.word		0x3f800002
	.word		0x3f800001
	.word		0x3f800003
	.word		0x3f800002
	.word		0x3f800003
	.word		0x3f800001
	.word		0x3f800005
	.word		0x00400000
	.word		0x80400000
	.word		0x80400000
	.word		0x00400000
	.word		0x3fc00001
	.word		0xbfc00001
	.word		0xbfc00001
	.word		0x3fc00001
	.word		0x3f800002
	.word		0xbf800002
	.word		0xbf800002
	.word		0x3f800002
	.word		0x3f800003
	.word		0x3f800004
	.word		0x3f800007
	.word		0x3f800009
	.word		0x3f7ffffe
	.word		0x3f7ffffd
	.word		0x3f7ffffd
	.word		0x3f7ffffc
	.word		0x3f7ffffc
	.word		0x3f7ffffc
	.word		0x3f7ffff8
	.word		0x3f7ffff7
	.word		0x3f7ffff8
	.word		0x3f7ffff7
	.word		0x007ffffe
	.word		0x807ffffe
	.word		0x807ffffe
	.word		0x007ffffe
.align 8


source2:
	.word		0x3f800001
	.word		0xbf800001
	.word		0xbf800001
	.word		0x3f800001
	.word		0x00800001
	.word		0x80800001
	.word		0x80800001
	.word		0x00800001
	.word		0x3f7ffffd
	.word		0x3f7ffffb
	.word		0x3f7ffff7
	.word		0x3f7fffff
	.word		0xbf7fffff
	.word		0x3f7fffff
	.word		0xbf7fffff
	.word		0x3f7ffffe
	.word		0x3f7ffffd
	.word		0x3f7ffffc
	.word		0x3f7ffffc
	.word		0x3f7ffff9
	.word		0x3f7ffff9
	.word		0x3f7ffff9
	.word		0x3f7fffff
	.word		0x3f7fffff
	.word		0x3f7ffffd
	.word		0x3f7fffff
	.word		0x3f7ffffd
	.word		0x3f7ffffd
	.word		0x3f7ffffb
	.word		0x3f7fffff
	.word		0x00ffffff
	.word		0x80ffffff
	.word		0x00ffffff
	.word		0x80ffffff
	.word		0x3f800001
	.word		0xbf800001
	.word		0x3f800001
	.word		0xbf800001
	.word		0x3f800001
	.word		0xbf800001
	.word		0x3f800001
	.word		0xbf800001
	.word		0x3f800001
	.word		0x3f800001
	.word		0x3f800002
	.word		0x3f800008
	.word		0x3f7fffff
	.word		0x3f7fffff
	.word		0x3f7ffffe
	.word		0x3f7fffff
	.word		0x3f7ffffe
	.word		0x3f7ffffd
	.word		0x3f7ffffd
	.word		0x3f7ffffe
	.word		0x3f7ffffc
	.word		0x3f7ffffb
	.word		0x00ffffff
	.word		0x80ffffff
	.word		0x00ffffff
	.word		0x80ffffff
.align 8


result:
	.word		0x40400000
	.word		0x40400000
	.word		0xc0400000
	.word		0xc0400000
	.word		0x3f400000
	.word		0x3f400000
	.word		0xbf400000
	.word		0xbf400000
	.word		0x3f800002
	.word		0x3f800003
	.word		0x3f800005
	.word		0x3f800001
	.word		0x3f800001
	.word		0xbf800001
	.word		0xbf800001
	.word		0x3f800001
	.word		0x3f800001
	.word		0x3f800002
	.word		0x3f800001
	.word		0x3f800003
	.word		0x3f800002
	.word		0x3f800001
	.word		0x3f800002
	.word		0x3f800003
	.word		0x3f800003
	.word		0x3f800004
	.word		0x3f800004
	.word		0x3f800005
	.word		0x3f800004
	.word		0x3f800006
	.word		0x3e800001
	.word		0x3e800001
	.word		0xbe800001
	.word		0xbe800001
	.word		0x3fc00000
	.word		0x3fc00000
	.word		0xbfc00000
	.word		0xbfc00000
	.word		0x3f800001
	.word		0x3f800001
	.word		0xbf800001
	.word		0xbf800001
	.word		0x3f800002
	.word		0x3f800003
	.word		0x3f800005
	.word		0x3f800001
	.word		0x3f7fffff
	.word		0x3f7ffffe
	.word		0x3f7fffff
	.word		0x3f7ffffd
	.word		0x3f7ffffe
	.word		0x3f7fffff
	.word		0x3f7ffffb
	.word		0x3f7ffff9
	.word		0x3f7ffffc
	.word		0x3f7ffffc
	.word		0x3efffffd
	.word		0x3efffffd
	.word		0xbefffffd
	.word		0xbefffffd
.align 8
fcc_result:


cexc_flag:
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


