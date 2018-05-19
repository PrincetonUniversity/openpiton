// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fp_muldiv0_a.s
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
 * Name:   fp_muldiv0.s
 *
 *  Description:
 *  	This test is intended test fp mul and div
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
 * Simple data
 *******************************************************/

	! By default, mask is disabled

	ld		[%l3+0x0], %fsr		! Read it from memory - trap disabled

/*  Basic fp add and sub */

	! ones and 0s

	setx		data1, %l0, %l2		! Some data

	ld		[%l2+0x0], %f0		! 1.0
	ld		[%l2+0x4], %f2		! 0.0
	ld		[%l2+0x8], %f4		! -1.0
	ld		[%l2+0xc], %f6		! -0.0

	fmuls		%f0, %f0, %f1
	fmuls		%f0, %f2, %f3
	fmuls		%f0, %f4, %f5
	fmuls		%f0, %f6, %f10
	fsmuld		%f0, %f0, %f10
	fsmuld		%f0, %f2, %f10
	fsmuld		%f0, %f4, %f10
	fsmuld		%f0, %f6, %f10
	fdivs		%f0, %f0, %f12
	fdivs		%f0, %f2, %f14
	fdivs		%f0, %f3, %f16
	fdivs		%f0, %f6, %f18
	fdivs		%f2, %f0, %f20
	fdivs		%f2, %f4, %f22
	fdivs		%f2, %f6, %f24
	fdivs		%f4, %f0, %f26
	fdivs		%f4, %f2, %f28
	fdivs		%f4, %f6, %f30
	fdivs		%f6, %f0, %f27
	fdivs		%f6, %f2, %f29
	fdivs		%f6, %f4, %f31

	setx		ddata1, %l0, %l2	! Double precision boundaries

	ldd		[%l2+0x0], %f0		! 1.0
	ldd		[%l2+0x8], %f2		! 0.0
	ldd		[%l2+0x10], %f4		! -1.0
	ldd		[%l2+0x18], %f6		! -0.0
	
	fmuld		%f0, %f0, %f32
	fmuld		%f0, %f2, %f34
	fmuld		%f0, %f4, %f36
	fmuld		%f0, %f6, %f10
	fdivd		%f0, %f0, %f12
	fdivd		%f0, %f2, %f14
	fdivd		%f0, %f4, %f16
	fdivd		%f0, %f6, %f18
	fdivd		%f2, %f0, %f20
	fdivd		%f2, %f4, %f22
	fdivd		%f2, %f6, %f24
	fdivd		%f4, %f0, %f26
	fdivd		%f4, %f2, %f28
	fdivd		%f4, %f6, %f30
	fdivd		%f6, %f0, %f38
	fdivd		%f6, %f2, %f40
	fdivd		%f6, %f4, %f42

	fmulq		%f0, %f0, %f0		! This should cause - unimplemented fpop
	fdmulq		%f0, %f0, %f0		! This should cause - unimplemented fpop
	fdivq		%f0, %f0, %f0

	! -ve OF

	setx		sp_n_u_normal, %l0, %l4	! Largest -ve normal number
	setx		sp_p_u_normal, %l0, %l6	! Largest +ve normal number

	ld		[%l4+0x0], %f0		! 
	ld		[%l6+0x0], %f4		! 
	fdivs		%f0, %f4, %f6		! Should result in negative overflow

	! +ve UF (Not successful in generating UF) (??)

	setx		sp_p_denormal_0, %l0, %l4	! Small +ve normal number
	setx		sp_p_l_denormal, %l0, %l6	! Smallest +ve normal number

	ld		[%l4+0x0], %f0		! 
	ld		[%l6+0x0], %f4		! 
	fdivs		%f4, %f0, %f8		! Should result in negative underflow

	! Go thru normals and denormals - only adjacent mul/div

	setx		data1_denorm, %l0, %l4	! sp
	setx		ddata1_denorm, %l0, %l6	! dp

	set		0x4, %g6		! Max loop count rd
	set		0x30, %g1		! Max loop count

	set		0x0, %g7		! loop iterator	

	fmuldiv_rd_loop0:			! Rounding mode loop

	sll		%g7, 0x2, %g5		! Align address
	ld		[%l3+%g5], %fsr		! Read it from memory - trap disabled

	set		0x0, %g2		! inner loop iterator	

	fmuldiv_loop0:

	sll		%g2, 0x2, %g3		! Align address
	sll		%g2, 0x3, %g4		! Align address

	ld		[%l4+%g3], %f0		! single precision
	ldd		[%l6+%g4], %f2		! double precision

	add		%g3, 0x4, %g3
	add		%g4, 0x8, %g4

	ld		[%l4+%g3], %f4		! single precision
	ldd		[%l6+%g4], %f6		! double precision

	fmuls		%f0, %f4, %f10
	fmuls		%f4, %f0, %f12
	fsmuld		%f0, %f4, %f18
	fsmuld		%f4, %f0, %f20
	fdivs		%f0, %f4, %f14
	fdivs		%f4, %f0, %f16

	fmuld		%f2, %f6, %f20
	fmuld		%f6, %f2, %f22
	fdivd		%f2, %f6, %f24
	fdivd		%f6, %f2, %f26

	add		%g2, 0x1, %g2
	subcc		%g2, %g1, %g0

	bne,a		fmuldiv_loop0		! If not 0, go to test more
        nop

	add		%g7, 0x1, %g7
	subcc		%g7, %g6, %g0

	bne,a		fmuldiv_rd_loop0	! If not 0, go to test more
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

data0:
sp_n_u_quiet_nan:
	.word		0xffffffff	! -NaN (Quiet)		(S = 1, E = 255, F > 0)		00
sp_n_l_quiet_nan:
	.word		0xffc00001	! -NaN (Quiet)		(S = 1, E = 255, F > 0)		04
sp_n_ind_nan:
	.word		0xffc00000	! -NaN (Indeterminate)	(S = 1, E = 255, F > 0)		08
sp_n_u_signaling_nan:
	.word		0xffbfffff	! -NaN (Signaling)	(S = 1, E = 255, F > 0)		0c
sp_n_l_signaling_nan:
	.word		0xff800001	! -NaN (Signaling)	(S = 1, E = 255, F > 0)		10
sp_n_inf:
	.word		0xff800000	! -ve Infinity (ovf)	(S = 1, E = 255, F = 0)		14
sp_n_u_normal:
	.word		0xff7fffff	! -ve normalized	(S = 1, 0 < E < 255)		18
sp_n_l_normal:
	.word		0x80800000	! -ve normalized	(S = 1, 0 < E < 255)		1c
sp_n_u_denormal:
	.word		0x807fffff	! -ve denormalized	(S = 1, E=0, F is non-zero)	20
sp_n_l_denormal:
	.word		0x80000001	! -ve denormalized	(S = 1, E=0, F is non-zero)	24
sp_n_uf:
	.word		0x80000000	! -ve Underflow		(S = 1, E=0, F = 0)		28
sp_n_0:
	.word		0x80000000	! -ve 0			(S = 1, E=0, F = 0)		2c
sp_p_0:
	.word		0x00000000	! +ve 0			(S = 0, E=0, F = 0)		30
sp_p_uf:
	.word		0x00000000	! +ve Underflow		(S = 0, E=0, F = 0)		34
sp_p_l_denormal:
	.word		0x00000001	! +ve denormalized	(S = 0, E=0, F is non-zero)	38
sp_p_u_denormal:
	.word		0x007fffff	! +ve denormalized	(S = 0, E=0, F is non-zero)	3c
sp_p_l_normal:
	.word		0x00800000	! +ve normalized	(S = 0, 0 < E < 255)		40
sp_p_u_normal:
	.word		0x7f7fffff	! +ve normalized	(S = 0, 0 < E < 255)		44
sp_p_inf:
	.word		0x7f800000	! +ve Infinity (ovf)	(S = 0, E = 255, F = 0)		48
sp_p_l_signaling_nan:
	.word		0x7f800001	! +NaN (Signaling)	(S = 0, E = 255, F > 0)		4c
sp_p_u_signaling_nan:
	.word		0x7fbfffff	! +NaN (Signaling)	(S = 0, E = 255, F > 0)		50
sp_p_l_quiet_nan:
	.word		0x7fc00000	! +NaN (Quiet)		(S = 0, E = 255, F > 0)		54
sp_p_u_quiet_nan:
	.word		0x7fffffff	! +NaN (Quiet)		(S = 0, E = 255, F > 0)		5c

sp_n_quiet_nan_0:	
	.word		0xffefffff	! -NaN (Quiet)		(S = 1, E = 255, F > 0)		00
sp_n_quiet_nan_1:	
	.word		0xffc00002	! -NaN (Quiet)		(S = 1, E = 255, F > 0)		00
sp_p_quiet_nan_0:	
	.word		0x7fefffff	! -NaN (Quiet)		(S = 1, E = 255, F > 0)		00
sp_p_quiet_nan_1:	
	.word		0x7fc00002	! -NaN (Quiet)		(S = 1, E = 255, F > 0)		00

sp_n_signaling_nan_0:	
	.word		0xffa00000	! -NaN (Signaling)	(S = 1, E = 255, F > 0)		0c
sp_p_signaling_nan_0:	
	.word		0x7fa00000	! -NaN (Signaling)	(S = 1, E = 255, F > 0)		0c

sp_p_normal_0:
	.word		0x00800001	! +ve normalized	(S = 0, 0 < E < 255)		40
sp_p_denormal_0:
	.word		0x00000002	! +ve denormalized	(S = 0, E=0, F is non-zero)	38

.align 256

ddata0:
dp_n_u_quiet_nan:
	.xword		0xffffffffffffffff	! -NaN (Quiet)		(S = 1, E = 2047, F > 0)		00
dp_n_l_quiet_nan:
	.xword		0xfff8000000000001	! -NaN (Quiet)		(S = 1, E = 2047, F > 0)		04
dp_n_ind_nan:
	.xword		0xfff8000000000000	! -NaN (Indeterminate)	(S = 1, E = 2047, F > 0)		08
dp_n_u_signaling_nan:
	.xword		0xfff7ffffffffffff	! -NaN (Signaling)	(S = 1, E = 2047, F > 0)		0c
dp_n_l_signaling_nan:
	.xword		0xfff0000000000001	! -NaN (Signaling)	(S = 1, E = 2047, F > 0)		10
dp_n_inf:
	.xword		0xfff0000000000000	! -ve Infinity (ovf)	(S = 1, E = 2047, F = 0)		14
dp_n_u_normal:
	.xword		0xffefffffffffffff	! -ve normalized	(S = 1, 0 < E < 2047)			18
dp_n_l_normal:
	.xword		0x8010000000000000	! -ve normalized	(S = 1, 0 < E < 2047)			1c
dp_n_u_denormal:
	.xword		0x800fffffffffffff	! -ve denormalized	(S = 1, E=0, F is non-zero)		20
dp_n_l_denormal:
	.xword		0x8000000000000001	! -ve denormalized	(S = 1, E=0, F is non-zero)		24
dp_n_uf:
	.xword		0x8000000000000000	! -ve Underflow		(S = 1, E=0, F = 0)			28
dp_n_0:
	.xword		0x8000000000000000	! -ve 0			(S = 1, E=0, F = 0)			2c
dp_p_0:
	.xword		0x0000000000000000	! +ve 0			(S = 0, E=0, F = 0)			30
dp_p_uf:
	.xword		0x0000000000000000	! +ve Underflow		(S = 0, E=0, F = 0)			34
dp_p_l_denormal:
	.xword		0x0000000000000001	! +ve denormalized	(S = 0, E=0, F is non-zero)		38
dp_p_u_denormal:
	.xword		0x000fffffffffffff	! +ve denormalized	(S = 0, E=0, F is non-zero)		3c
dp_p_l_normal:
	.xword		0x0010000000000000	! +ve normalized	(S = 0, 0 < E < 2047)			40
dp_p_u_normal:
	.xword		0x7fefffffffffffff	! +ve normalized	(S = 0, 0 < E < 2047)			44
dp_p_inf:
	.xword		0x7ff0000000000000	! +ve Infinity (ovf)	(S = 0, E = 2047, F = 0)		48
dp_p_l_signaling_nan:
	.xword		0x7ff0000000000001	! +NaN (Signaling)	(S = 0, E = 2047, F > 0)		4c
dp_p_u_signaling_nan:
	.xword		0x7ff7ffffffffffff	! +NaN (Signaling)	(S = 0, E = 2047, F > 0)		50
dp_p_l_quiet_nan:
	.xword		0x7ff8000000000000	! +NaN (Quiet)		(S = 0, E = 2047, F > 0)		54
dp_p_u_quiet_nan:
	.xword		0x7fffffffffffffff	! +NaN (Quiet)		(S = 0, E = 2047, F > 0)		5c

dp_n_quiet_nan_0:	
	.xword		0xfffeffffffffffff	! -NaN (Quiet)		(S = 1, E = 255, F > 0)		00
dp_n_quiet_nan_1:	
	.xword		0xfff8000000000002	! -NaN (Quiet)		(S = 1, E = 255, F > 0)		00
dp_p_quiet_nan_0:	
	.xword		0x7ffeffffffffffff	! -NaN (Quiet)		(S = 1, E = 255, F > 0)		00
dp_p_quiet_nan_1:	
	.xword		0x7ff8000000000002	! -NaN (Quiet)		(S = 1, E = 255, F > 0)		00

dp_n_signaling_nan_0:	
	.xword		0xfff4000000000000	! -NaN (Signaling)	(S = 1, E = 255, F > 0)		0c
dp_p_signaling_nan_0:	
	.xword		0x7ff4000000000000	! -NaN (Signaling)	(S = 1, E = 255, F > 0)		0c

.align 256

data1:
	.word		0x3f800000	! 1.0							0x0
	.word		0x00000000	! 0.0							0x4
	.word		0xbf800000	! -1.0							0x8
	.word		0x80000000	! -0.0							0xc

	.word		0x4f000000	! Large positive number should cause NV on conversion	0x10
	.word		0xcf000000	! Large negative number should cause NV on conversion	0x14

	.word		0x5f0ac723	! Large positive number should cause NV on conversion	0x18
	.word		0xdf0ac723	! Large negative number should cause NV on conversion	0x1c

data1_denorm:

	.word		0x807fffff	! Denormal number -ve
	.word		0x80700000	! Denormal number -ve
	.word		0x803fffff	! Denormal number -ve
	.word		0x80400000	! Denormal number -ve
	.word		0x80400001	! Denormal number -ve
	.word		0x80000001	! Denormal number -ve
	.word		0x80000001	! Denormal number -ve
	.word		0x007fffff	! Denormal number +ve
	.word		0x007fffff	! Denormal number +ve
	.word		0x00700000	! Denormal number +ve
	.word		0x003fffff	! Denormal number +ve
	.word		0x00400000	! Denormal number +ve
	.word		0x00400001	! Denormal number +ve
	.word		0x00000001	! Denormal number +ve

data1_norm:

	.word		0xff7fffff	! Normal
	.word		0xff700000	! Normal
	.word		0xff7ffffe	! Normal
	.word		0xff7aaaaa	! Normal
	.word		0xff755555	! Normal
	.word		0xfe7fffff	! Normal
	.word		0xfe700000	! Normal
	.word		0xfe7ffffe	! Normal
	.word		0xfe7aaaaa	! Normal
	.word		0xfe755555	! Normal
	.word		0x80ffffff	! Normal
	.word		0x80f00000	! Normal
	.word		0x80c00001	! Normal
	.word		0x80c00000	! Normal
	.word		0x80800001	! Normal
	.word		0x80800000	! Normal
	.word		0x80800000	! Normal
	.word		0x00800000	! Normal
	.word		0x00800000	! Normal
	.word		0x00800001	! Normal
	.word		0x00c00000	! Normal
	.word		0x00c00001	! Normal
	.word		0x00f00000	! Normal
	.word		0x00ffffff	! Normal
	.word		0x7e755555	! Normal
	.word		0x7e7aaaaa	! Normal
	.word		0x7e7ffffe	! Normal
	.word		0x7e700000	! Normal
	.word		0x7e7fffff	! Normal
	.word		0x7f755555	! Normal
	.word		0x7f7aaaaa	! Normal
	.word		0x7f7ffffe	! Normal
	.word		0x7f700000	! Normal
	.word		0x7f7fffff	! Normal

.align 256

ddata1:
	.xword		0x3ff0000000000000	! 1.0						0x0
	.xword		0x0000000000000000	! 0.0						0x8
	.xword		0xbff0000000000000	! -1.0						0x10
	.xword		0x8000000000000000	! -0.0						0x18

	.xword		0x41e0000000000000	! Large positive number should cause NV on conversion	0x20
	.xword		0xc1e0000000000000	! Large negative number should cause NV on conversion	0x28

	.xword		0x43e158e460913d00	! Large positive number should cause NV on conversion to int	0x30
	.xword		0xc3e158e460913d00	! Large negative number should cause NV on conversion to int	0x38

ddata1_denorm:

	.xword		0x800fffffffffffff	! Denormal number -ve
	.xword		0x800f000000000000	! Denormal number -ve
	.xword		0x8007ffffffffffff	! Denormal number -ve
	.xword		0x8008000000000000	! Denormal number -ve
	.xword		0x8008000000000001	! Denormal number -ve
	.xword		0x8000000000000001	! Denormal number -ve
	.xword		0x8000000000000001	! Denormal number -ve
	.xword		0x000fffffffffffff	! Denormal number +ve
	.xword		0x000fffffffffffff	! Denormal number +ve
	.xword		0x000f000000000000	! Denormal number +ve
	.xword		0x0007ffffffffffff	! Denormal number +ve
	.xword		0x0008000000000000	! Denormal number +ve
	.xword		0x0008000000000001	! Denormal number +ve
	.xword		0x0000000000000001	! Denormal number +ve

ddata1_norm:

	.xword		0xffefffffffffffff	! Normal
	.xword		0xffef000000000000	! Normal
	.xword		0xffeffffffffffffe	! Normal
	.xword		0xffeaaaaaaaaaaaaa	! Normal
	.xword		0xffe5555555555555	! Normal
	.xword		0xffcfffffffffffff	! Normal
	.xword		0xffcf000000000000	! Normal
	.xword		0xffcffffffffffffe	! Normal
	.xword		0xffcaaaaaaaaaaaaa	! Normal
	.xword		0xffc5555555555555	! Normal
	.xword		0x801fffffffffffff	! Normal
	.xword		0x801f000000000000	! Normal
	.xword		0x8018000000000001	! Normal
	.xword		0x8018000000000000	! Normal
	.xword		0x8010000000000001	! Normal
	.xword		0x8010000000000000	! Normal
	.xword		0x8010000000000000	! Normal
	.xword		0x0010000000000000	! Normal
	.xword		0x0010000000000000	! Normal
	.xword		0x0010000000000001	! Normal
	.xword		0x0018000000000000	! Normal
	.xword		0x0018000000000001	! Normal
	.xword		0x001f000000000000	! Normal
	.xword		0x001fffffffffffff	! Normal
	.xword		0x7fc5555555555555	! Normal
	.xword		0x7fcaaaaaaaaaaaaa	! Normal
	.xword		0x7fcffffffffffffe	! Normal
	.xword		0x7fc7000000000000	! Normal
	.xword		0x7fc7ffffffffffff	! Normal
	.xword		0x7fe5555555555555	! Normal
	.xword		0x7fe5aaaaaaaaaaaa	! Normal
	.xword		0x7feffffffffffffe	! Normal
	.xword		0x7fef000000000000	! Normal
	.xword		0x7fefffffffffffff	! Normal

.align 512

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
	.word		0x40000000	! TEM - all disabled
	.word		0x80000000	! TEM - all disabled
	.word		0xc0000000	! TEM - all disabled

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

