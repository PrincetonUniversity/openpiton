// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fp_arth_exc0.s
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
 * Name:   fp_ldst_gen0.s
 * Date:   01/22/02
 *
 *  Description:
 *  	This test is intended to cause arithmetic exceptions.
 *
 **********************************************************************/

#define	H_T0_Fp_exception_ieee_754_0x21 T0_Fp_exception_ieee_754

#define ENABLE_T0_Fp_disabled_0x20
#include "boot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

.text
.global main  

main:

        wr      	%g0, 0x4, %fprs         /* make sure fef is 1 */

	setx		data0, %l0, %l1		! Single precision boundaries
	setx		data1, %l0, %l2		! Some data
	setx		fsr_tem_en, %l0, %l3	! fsr tem enable value
	setx		fsr_tem_dis, %l0, %l4	! fsr tem disable value
	setx		ddata0, %l0, %l6	! Double precision boundaries

/*******************************************************
 * Create arithmetic exceptions
 *******************************************************/

	! By default, mask is disabled

	ld		[%l4+0x0], %fsr		! Read it from memory - trap disabled
						! expect aexc fields to accrue

/* floating point integer Conversions */

	! Convert all the numbers into integer - put it in a loop

	set		0x17, %g1		! Max loop count
	set		0x0, %g2		! loop iterator	

fp_convert_loop0:

	sll		%g2, 0x2, %g3		! Align address
	sll		%g2, 0x3, %g4		! Align address
	ld		[%l1+%g3], %f0		! single precision
	ldd		[%l6+%g4], %f2		! double precision

	fstox		%f0, %f10		! Conversions
	fstoi		%f0, %f11		! Conversions

	setx		user_scratch, %l0, %l5	! scratch
	stx		%fsr, [%l5+0x0]		! Test out fsr
	ldx		[%l5+0x0], %fsr		! Need to test the sync operation

	fdtox		%f2, %f12		! Conversions
	fdtoi		%f2, %f13		! Conversions

	setx		user_scratch, %l0, %l5	! scratch
	stx		%fsr, [%l5+0x0]		! Test out fsr
	ldx		[%l5+0x0], %fsr		! Need to test the sync operation

	fstod		%f0, %f14		! Conversions
	fdtos		%f2, %f15		! Conversions - Should cause NX in some cases

	setx		user_scratch, %l0, %l5	! scratch
	stx		%fsr, [%l5+0x0]		! Test out fsr
	ldx		[%l5+0x0], %fsr		! Need to test the sync operation

	fstox		%f2, %f14		! Conversions
	fstoi		%f2, %f16		! Conversions

	fxtos		%f14, %f18		! Conversions
	fxtod		%f14, %f20		! Conversions
	fitos		%f16, %f18		! Conversions
	fitod		%f16, %f20		! Conversions

	fdtox		%f2, %f14		! Conversions
	fdtoi		%f2, %f16		! Conversions

	fxtos		%f14, %f18		! Conversions
	fxtod		%f14, %f20		! Conversions
	fitos		%f16, %f18		! Conversions
	fitod		%f16, %f20		! Conversions

	fdtoi		%f20, %f20		! Just to see how the registers are preserved

	setx		user_scratch, %l0, %l5	! scratch
	stx		%fsr, [%l5+0x0]		! Test out fsr
	ldx		[%l5+0x0], %fsr		! Need to test the sync operation

	add		%g2, 0x1, %g2
	subcc		%g2, %g1, %g0

	bne,a		fp_convert_loop0	! If not 0, go to test more
        wr      	%g0, 0x4, %fprs         ! set ul and ll to 0

/* floating add/sub/compare/multiply */

	ld		[%l3+0x0], %fsr		! Read it from memory - trap enabled

	set		0x16, %g1		! Max loop count
	set		0x0, %g2		! loop iterator	
		
fp_asmds_loop0:

	sll		%g2, 0x2, %g3		! Align address
	sll		%g2, 0x3, %g4		! Align address
	ld		[%l1+%g3], %f0		! single precision
	ldd		[%l6+%g4], %f2		! double precision

	add		%g3, 0x4, %g3
	add		%g4, 0x8, %g4
	ld		[%l1+%g3], %f4		! single precision
	ldd		[%l6+%g4], %f6		! double precision

	fadds		%f0, %f4, %f8
	faddd		%f2, %f6, %f10
	fsubs		%f0, %f4, %f8
	fsubd		%f2, %f6, %f10
	fsubs		%f4, %f0, %f32		! This should set fprs.ul
	fsubd		%f6, %f2, %f34
	fcmps		%fcc0, %f0, %f4
	fcmpd		%fcc1, %f2, %f6
	fcmpes		%fcc0, %f0, %f4
	fcmped		%fcc1, %f2, %f6
	fmuls		%f0, %f4, %f8
	fmuld		%f2, %f6, %f10
	fsmuld		%f0, %f4, %f8
	fdivs		%f0, %f4, %f8
	fdivs		%f4, %f0, %f8
	fdivd		%f2, %f6, %f10
	fdivd		%f6, %f2, %f10
!	fsqrts		%f2, %f8
!	fsqrtd		%f6, %f10

	setx		user_scratch, %l0, %l5	! scratch
	stx		%fsr, [%l5+0x0]		! Test out fsr
	ldx		[%l5+0x0], %fsr		! Need to test the sync operation

	add		%g2, 0x1, %g2
	subcc		%g2, %g1, %g0

	bne,a		fp_asmds_loop0		! If not 0, go to test more
        wr      	%g0, 0x4, %fprs         ! set ul and ll to 0

/* Floating point divide */

	! fdivs

	ld		[%l2+0x0], %f0
	ld		[%l2+0x4], %f1
	ld		[%l2+0x8], %f2

	fdivs		%f0, %f1, %f10		! This should cause fp divide-by-0 exception if enabled
	setx		user_scratch, %l0, %l5	! scratch
	stx		%fsr, [%l5+0x0]
	ldx		[%l5+0x0], %fsr		! Need to test the sync operation

	! Enable mask

	ld		[%l3+0x0], %fsr		! Read it from memory
	fdivs		%f0, %f1, %f10		! This should cause fp divide-by-0 exception if enabled
	setx		user_scratch, %l0, %l5	! scratch
	stx		%fsr, [%l5+0x8]
	ldx		[%l5+0x8], %g1		! Just read them from memory
	ldx		[%l5+0x0], %g2		! Just read them from memory

	! Disable mask

	ld		[%l4+0x0], %fsr		! Read it from memory
	fdivs		%f0, %f1, %f10		! This should cause fp divide-by-0 exception if enabled
	

	! Disable mask


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

data0:
	.word		0xffffffff	! -NaN (Quiet)		(S = 1, E = 255, F > 0)		00
	.word		0xffc00001	! -NaN (Quiet)		(S = 1, E = 255, F > 0)		04
	.word		0xffc00000	! -NaN (Indeterminate)	(S = 1, E = 255, F > 0)		08
	.word		0xffbfffff	! -NaN (Signaling)	(S = 1, E = 255, F > 0)		0c
	.word		0xff800001	! -NaN (Signaling)	(S = 1, E = 255, F > 0)		10
	.word		0xff800000	! -ve Infinity (ovf)	(S = 1, E = 255, F = 0)		14
	.word		0xff7fffff	! -ve normalized	(S = 1, 0 < E < 255)		18
	.word		0x80800000	! -ve normalized	(S = 1, 0 < E < 255)		1c
	.word		0x807fffff	! -ve denormalized	(S = 1, E=0, F is non-zero)	20
	.word		0x80000001	! -ve denormalized	(S = 1, E=0, F is non-zero)	24
	.word		0x80000000	! -ve Underflow		(S = 1, E=0, F = 0)		28
	.word		0x80000000	! -ve 0			(S = 1, E=0, F = 0)		2c
	.word		0x00000000	! +ve 0			(S = 0, E=0, F = 0)		30
	.word		0x00000000	! +ve Underflow		(S = 0, E=0, F = 0)		34
	.word		0x00000001	! +ve denormalized	(S = 0, E=0, F is non-zero)	38
	.word		0x007fffff	! +ve denormalized	(S = 0, E=0, F is non-zero)	3c
	.word		0x00800000	! +ve normalized	(S = 0, 0 < E < 255)		40
	.word		0x7f7fffff	! +ve normalized	(S = 0, 0 < E < 255)		44
	.word		0x7f800000	! +ve Infinity (ovf)	(S = 0, E = 255, F = 0)		48
	.word		0x7f800001	! +NaN (Signaling)	(S = 0, E = 255, F > 0)		4c
	.word		0x7fbfffff	! +NaN (Signaling)	(S = 0, E = 255, F > 0)		50
	.word		0x7fc00000	! +NaN (Quiet)		(S = 0, E = 255, F > 0)		54
	.word		0x7fffffff	! +NaN (Quiet)		(S = 0, E = 255, F > 0)		5c

.align 256

ddata0:
	.xword		0xffffffffffffffff	! -NaN (Quiet)		(S = 1, E = 2047, F > 0)		00
	.xword		0xfff8000000000001	! -NaN (Quiet)		(S = 1, E = 2047, F > 0)		04
	.xword		0xfff8000000000000	! -NaN (Indeterminate)	(S = 1, E = 2047, F > 0)		08
	.xword		0xfff7ffffffffffff	! -NaN (Signaling)	(S = 1, E = 2047, F > 0)		0c
	.xword		0xfff0000000000001	! -NaN (Signaling)	(S = 1, E = 2047, F > 0)		10
	.xword		0xfff0000000000000	! -ve Infinity (ovf)	(S = 1, E = 2047, F = 0)		14
	.xword		0xffefffffffffffff	! -ve normalized	(S = 1, 0 < E < 2047)			18
	.xword		0x8010000000000000	! -ve normalized	(S = 1, 0 < E < 2047)			1c
	.xword		0x800fffffffffffff	! -ve denormalized	(S = 1, E=0, F is non-zero)		20
	.xword		0x8000000000000001	! -ve denormalized	(S = 1, E=0, F is non-zero)		24
	.xword		0x8000000000000000	! -ve Underflow		(S = 1, E=0, F = 0)			28
	.xword		0x8000000000000000	! -ve 0			(S = 1, E=0, F = 0)			2c
	.xword		0x0000000000000000	! +ve 0			(S = 0, E=0, F = 0)			30
	.xword		0x0000000000000000	! +ve Underflow		(S = 0, E=0, F = 0)			34
	.xword		0x0000000000000001	! +ve denormalized	(S = 0, E=0, F is non-zero)		38
	.xword		0x000fffffffffffff	! +ve denormalized	(S = 0, E=0, F is non-zero)		3c
	.xword		0x0010000000000000	! +ve normalized	(S = 0, 0 < E < 2047)			40
	.xword		0x7fefffffffffffff	! +ve normalized	(S = 0, 0 < E < 2047)			44
	.xword		0x7ff0000000000000	! +ve Infinity (ovf)	(S = 0, E = 2047, F = 0)		48
	.xword		0x7ff0000000000001	! +NaN (Signaling)	(S = 0, E = 2047, F > 0)		4c
	.xword		0x7ff7ffffffffffff	! +NaN (Signaling)	(S = 0, E = 2047, F > 0)		50
	.xword		0x7ff8000000000000	! +NaN (Quiet)		(S = 0, E = 2047, F > 0)		54
	.xword		0x7fffffffffffffff	! +NaN (Quiet)		(S = 0, E = 2047, F > 0)		5c

.align 256

data1:
	.word		0x3f800000	! 1.0
	.word		0x00000000	! 0.0
	.word		0xbf800000	! -1.0


.align 128

fsr_tem_en:
	.word		0x0f800000	! TEM - all enabled

fsr_tem_dis:
	.word		0x00000000	! TEM - all disabled
	.word		0x00000000

.align 128

user_scratch:
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000


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

.global T0_Fp_exception_ieee_754
T0_Fp_exception_ieee_754:	
	rdpr	%tpc, %i0
	rdpr	%tnpc, %i1
	rdpr	%tstate, %i1
	rdpr	%tt, %i1
	setx	scratch, %l0, %l5	! scratch
	stx	%fsr, [%l5+0x0]
	ldx	[%l5+0x0], %fsr		! 
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
