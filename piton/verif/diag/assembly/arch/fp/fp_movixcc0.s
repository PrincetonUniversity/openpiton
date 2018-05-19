// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fp_movixcc0.s
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
 * Name:   fp_movixcc0.s
 *
 *  Description:
 *  	This test is intended test fmov on integer condition codes.
 *
 **********************************************************************/

#define	H_T0_Fp_exception_ieee_754_0x21 T0_Fp_exception_ieee_754
#define	H_T0_Fp_exception_other_0x22 T0_Fp_exception_other

#define ENABLE_T0_Fp_disabled_0x20
#include "boot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

.text
.global main  

main:

        wr      	%g0, 0x4, %fprs         /* make sure fef is 1 */

	setx		fsr_tem_en, %l0, %l3	! fsr tem enable value

/*******************************************************
 * Simple conversion
 *******************************************************/

	! By default, mask is disabled

	ld		[%l3+0x0], %fsr		! Read it from memory - trap enabled

	! write all 0s to ccr

	wr		%g0, 0x0, %ccr

	! Test quads


	setx		ddata1, %l0, %l6	! dp

	ldd		[%l6+0x0], %f0		! double precision
	ldd		[%l6+0x8], %f4		! double precision

	fmovqa		%icc, %f0, %f4		! 
	fmovqn		%icc, %f0, %f4		! 
	fmovqne		%icc, %f0, %f4		! 
	fmovqe		%icc, %f0, %f4		! 
	fmovqg		%icc, %f0, %f4		! 
	fmovqle		%icc, %f0, %f4		! 
	fmovqge		%icc, %f0, %f4		! 
	fmovql		%icc, %f0, %f4		! 
	fmovqgu		%xcc, %f0, %f4		! 
	fmovqleu	%xcc, %f0, %f4		! 
	fmovqcc		%xcc, %f0, %f4		! 
	fmovqcs		%xcc, %f0, %f4		! 
	fmovqpos	%xcc, %f0, %f4		! 
	fmovqneg	%xcc, %f0, %f4		! 
	fmovqvc		%xcc, %f0, %f4		! 
	fmovqvs		%xcc, %f0, %f4		! 

	! Depending on CCR

	set		0x2, %g1		! Max loop count
	set		0x0, %g2

	ccr_loop:

	brz,a		%g2, tgt1
	wr		%g0, 0x0, %ccr
	wr		%g0, 0xff, %ccr
	
tgt1:

	! dp, icc

	setx		ddata1, %l0, %l2	! Non zero data with different data in f0 and f1
	ldd		[%l2+0x8], %f0

	ldd		[%l2+0x0], %f2		! 
	fmovda		%icc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdn		%icc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdne		%icc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovde		%icc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdg		%icc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdle		%icc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdge		%icc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdl		%icc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdgu		%icc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdleu	%icc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdcc		%icc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdcs		%icc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdpos	%icc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdneg	%icc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdvc		%icc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdvs		%icc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 

	! dp xcc

	ldd		[%l2+0x8], %f0

	ldd		[%l2+0x0], %f2		! 
	fmovda		%xcc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdn		%xcc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdne		%xcc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovde		%xcc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdg		%xcc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdle		%xcc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdge		%xcc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdl		%xcc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdgu		%xcc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdleu	%xcc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdcc		%xcc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdcs		%xcc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdpos	%xcc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdneg	%xcc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdvc		%xcc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 
	fmovdvs		%xcc, %f0, %f2		! 
	ldd		[%l2+0x0], %f2		! 

	! sp, icc

	ldd		[%l2+0x0], %f0
	fmovsa		%icc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsn		%icc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsne		%icc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovse		%icc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsg		%icc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsle		%icc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsge		%icc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsl		%icc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsgu		%icc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsleu	%icc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovscc		%icc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovscs		%icc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovspos	%icc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsneg	%icc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsvc		%icc, %f0, %f1		! 

	! sp, icc

	ldd		[%l2+0x0], %f0
	fmovsa		%xcc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsn		%xcc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsne		%xcc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovse		%xcc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsg		%xcc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsle		%xcc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsge		%xcc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsl		%xcc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsgu		%xcc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsleu	%xcc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovscc		%xcc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovscs		%xcc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovspos	%xcc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsneg	%xcc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsvc		%xcc, %f0, %f1		! 

	add		%g2, 0x1, %g2
	subcc		%g2, %g1, %g0

	bne,a		ccr_loop		! If not 0, go to test more
        nop

	! cc forwarding

	setx		int_data_x, %l0, %l4	! 

	set		0x8, %g1		! Max loop count
	set		0x0, %g2		! inner loop iterator	

	movixcc_loop:

	sll		%g2, 0x2, %g3		! Align address
	sll		%g2, 0x3, %g4		! Align address

	ldx		[%l4+%g4], %l1		! single precision

	! sp, icc

	setx		ddata1, %l0, %l2	! Non zero data with different data in f0 and f1

	subcc		%l1, %g0, %l1

	ldd		[%l2+0x0], %f0
	fmovsa		%xcc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsn		%xcc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsne		%xcc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovse		%xcc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsg		%xcc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsle		%xcc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsge		%xcc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsl		%icc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsgu		%icc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsleu	%icc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovscc		%icc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovscs		%icc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovspos	%icc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsneg	%icc, %f0, %f1		! 
	ldd		[%l2+0x0], %f0		! 
	fmovsvc		%icc, %f0, %f1		! 

	add		%g2, 0x1, %g2
	subcc		%g2, %g1, %g0

	bne,a		movixcc_loop		! If not 0, go to test more
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

data1:
	.word		0x3f800000
	.word		0x00000000
        .word           0xbf800000
        .word           0x80000000

.align 128

ddata1:
	.xword		0x800fffffffffffff
	.xword		0x800f000000000000

.align 128

int_data_x:
	.xword		0x0000000000000000	! 0
	.xword		0x0000000000000001	! 1
	.xword		0x7fffffffffffffff	!
	.xword		0xffffffffffffffff	!
	.xword		0xaaaaaaaaaaaaaaaa	! 0
	.xword		0x5555555555555555	! 1
	.xword		0x4000000000000000	!
	.xword		0x8000000000000000	!

int_data_i:
	.word		0x00000000		! 0
	.word		0x00000001		! 1
	.word		0x7fffffff		!
	.word		0xffffffff		!
	.word		0xaaaaaaaa		!
	.word		0x55555555		!
	.word		0x40000000		!
	.word		0x80000000		!

.align 256

fsr_tem_en:
	.word		0x0f800000	! TEM - all enabled - rd 0
	.word		0x4f800000	! TEM - all enabled - rd 1
	.word		0x8f800000	! TEM - all enabled - rd 2
	.word		0xcf800000	! TEM - all enabled - rd 3

fsr_tem_dis:
	.word		0x00000000	! TEM - all disabled

/*******************************************************
 * My own trap handlers
 *******************************************************/

SECTION .USER_TRAP_FOR_SUP TEXT_VA=0x20008000, DATA_VA=0x20018000
attr_text {
        Name = .USER_TRAP_FOR_SUP,
        RA=0x20008000,
        PA=ra2pa(0x20008000,0),
        part_0_i_ctx_zero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }
attr_data {
        Name = .USER_TRAP_FOR_SUP,
        RA=0x20018000,
        PA=ra2pa(0x20018000,0),
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=1
        }

.global	T0_Fp_exception_ieee_754
.global	T0_Fp_exception_other
T0_Fp_exception_ieee_754:	
	rdpr	%tpc, %i0
	rdpr	%tnpc, %i1
	rdpr	%tstate, %i1
	rdpr	%tt, %i1
	setx	scratch, %l0, %l5	! scratch
	stx	%fsr, [%l5+0x0]
	ldx	[%l5+0x0], %fsr		! Need to test the sync operation
	done
	nop

T0_Fp_exception_other:	
	rdpr	%tpc, %i0
	rdpr	%tnpc, %i1
	rdpr	%tstate, %i1
	rdpr	%tt, %i1
	setx	scratch, %l0, %l5	! scratch
	stx	%fsr, [%l5+0x0]
	ldx	[%l5+0x0], %fsr		! Need to test the sync operation
	done
	nop

.data
.align 128

scratch:
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000

