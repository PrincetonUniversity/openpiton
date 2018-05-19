// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fp_ieee_flags.s
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


	setx		data1, %l0, %l2		! Some data

	ld		[%l2+0x0], %f0		! 1.0
	ld		[%l2+0x4], %f2		! 0.0
	ld		[%l2+0x8], %f4		! -1.0
	ld		[%l2+0xc], %f6		! -0.0

	fsmuld		%f0, %f0, %f10
	fsmuld		%f0, %f2, %f10
	fsmuld		%f0, %f4, %f10
	fsmuld		%f0, %f6, %f10

	setx		ddata1, %l0, %l2	! Double precision boundaries

	ldd		[%l2+0x0], %f0		! 1.0
	ldd		[%l2+0x8], %f2		! 0.0
	ldd		[%l2+0x10], %f4		! -1.0
	ldd		[%l2+0x18], %f6		! -0.0
	
	fmuld		%f0, %f0, %f32
	fmuld		%f0, %f2, %f34
	fmuld		%f0, %f4, %f36
	fmuld		%f0, %f6, %f10

	setx    newdata, %l0, %l6        ! Double precision data

	ldd     [%l6+%g0], %f0          ! double precision
        add     %g0, 0x8, %g4
        ldd     [%l6+%g4], %f2          ! double precision
	add     %g4, 0x8, %g4
        ldd     [%l6+%g4], %f4          ! double precision
        add     %g4, 0x8, %g4
	ldd     [%l6+%g4], %f6          ! double precision
        add     %g4, 0x8, %g4
        ldd     [%l6+%g4], %f8          ! double precision
        add     %g4, 0x8, %g4
        ldd     [%l6+%g4], %f10         ! double precision
	add     %g4, 0x8, %g4
        ldd     [%l6+%g4], %f12         ! double precision
	add     %g4, 0x8, %g4
        ldd     [%l6+%g4], %f14         ! double precision
	add     %g4, 0x8, %g4
        ldd     [%l6+%g4], %f16         ! double precision
	add     %g4, 0x8, %g4
        ldd     [%l6+%g4], %f18         ! double precision
	add     %g4, 0x8, %g4
        ldd     [%l6+%g4], %f20         ! double precision

        
	set		0x25, %g6		! Max loop count rd
	set		0x30, %g1		! Max loop count

	set		0x0, %g7		! loop iterator	

	fmuldiv_rd_loop0:			! Rounding mode loop

	sll		%g7, 0x2, %g5		! Align address
	ld		[%l3+%g5], %fsr		! Read it from memory - trap disabled


	faddd   %f2,  %f4,  %f22
	faddd   %f6,  %f8,  %f24
	faddd   %f10, %f12, %f26
	fdtos   %f16,       %f28
	fdivd   %f18, %f20, %f30
	fdtos   %f0,        %f14

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
        .word           0x00000000      ! TEM - walk through all values
        .word           0x0f800000
	.word           0x01000000
        .word           0x01800000
	.word           0x02000000
        .word           0x02800000
        .word           0x03000000
	.word           0x03800000
	.word           0x04000000
	.word           0x04800000
	.word           0x05000000
	.word           0x05800000
	.word           0x06000000
	.word           0x06800000
	.word           0x07000000
	.word           0x07800000
	.word           0x08000000
	.word           0x08800000
	.word           0x09000000
	.word           0x09800000
	.word           0x0a000000
	.word           0x0a800000
	.word           0x0b000000
	.word           0x0b800000
	.word           0x0c000000
	.word           0x0c800000
	.word           0x0d000000
	.word           0x0d800000
	.word           0x0e000000
	.word           0x0e800000
	.word           0x0f000000
	.word           0x0f800000
	.word           0x01800000
	.word           0x02800000
	.word           0x03800000
	.word           0x04800000
	

newdata:
       	.xword          0x3fffffffffffffff      ! f0
	
	.xword          0x7ff0000000000001      ! f2                
        .xword          0x0000000000000000      ! f4
	
	.xword          0x7fe0000000000000      ! f6
	.xword          0x7fe0000000000000      ! f8
        
	.xword          0x0000000000000001      ! f10   
        .xword          0x0000000000000001      ! f12 
	
	.xword          0x0000000000000000      ! f14
	.xword          0x380fffffffffffff      ! f16
	
	.xword          0x3ff0000000000001      ! f18 
	.xword          0x0000000000000000      ! f20
	
	
	
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
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }
attr_data {
        Name = .USER_TRAP_FOR_SUP,
        RA=0x20018000,
        PA=ra2pa(0x20018000,0),
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
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
