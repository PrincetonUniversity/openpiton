// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: ffu_fpaddsub.s
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

!	 @(#)fpadd.s	1.5 01/16/94
/*-------------------------------------------------------------------------
*
* Test Name:		 fpadd
* Objective:		 To verify the operation of partitioned addition/subtraction.
*
*
* Test Description: 
* 		 A basic test to verify partitioned addition/subtraction operation. 
* 		 fpadd16, fpadd16s, fpadd32, fpadd32s, fpsub16, fpsub16s, fpsub32,
* 		 fpsub32s, fpmerge, fexpand instructions are used in the test. 
*		 All combinations of sign bits of both operands are considered.
*		 -carry from lower 16-bit segment should not propagate to
*		  upper 16-bit segment for fpadd16[s].
*		 -carry from lower 32-bit segment should not propagate to
*		  upper 32-bit segment for fpadd32[s].
*
*		 This test is self-checking. 
*		
*		 Even though 16-bit fixed number is used, but sign is ignored
*		 in partitioned add and subtract.
*
*
*
--------------------------------------------------------------------------*/

/**************************************************************************
* CONSTANTS, MACROS, TRAP TABLE
***************************************************************************/


#define ENABLE_T0_Fp_disabled_0x20
#include "boot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss


/****************START OF TEST*********************************************/


.text
.global main
ALIGN_PAGE_8K	
user_text_start:	
main:

	        wr      %g0, 0x4, %fprs         /* make sure fef is 1 */
	
		set	data1, %g1
		set	exp_result_start, %g3
		set	store_result, %g2
		mov	%g2, %g4
		mov	0x0, %l0

		ldd	[%g1],   %f0		!%f0 =0
		ldd	[%g1+8],  %f2
		ldd	[%g1+16], %f4
		ldd	[%g1+24], %f6

!fpadd with zero is same as fmov
!all combinations of even and odd registers as operands
tst_0s:
		fpadd16s	%f0, %f2, %f30		!0+xxxx=xxxx	%even %even %even
		fpsub16s	%f2, %f0, %f31		!xxxx-0=xxxx	%even %even %odd
		fcmps		%f30, %f31
		fbe		tst_0
		nop
		ta		BAD_TRAP

tst_0:
		fmovd		%f0, %f10
		fpadd16		%f10, %f2, %f30		!0 + xxxx = xxxx	
		fpsub16		%f2, %f10, %f32		!xxxx-0=xxxx	
		fcmpd		%f30, %f32
		fbe		tst_1s
		nop
		ta		BAD_TRAP
tst_1s:
		fpadd32s	%f0, %f3, %f30		!0 + xxxx xxxx = xxxx xxxx	%even %odd  %even
		fpsub32s	%f3, %f0, %f31		!xxxx xxxx - 0 = xxxx xxxx	%odd  %even %odd
		fcmps		%f30, %f31
		fbe		tst_1
		nop
		ta		BAD_TRAP

tst_1:
		fpadd32		%f10, %f6, %f26		!0 + xxxx xxxx = xxxx xxxx	
		fpsub32		%f6, %f10, %f28		!xxxx xxxx - 0 = xxxx xxxx	
		fcmpd		%f26, %f28
		fbe		tst_2s
		nop
		ta		BAD_TRAP
tst_2s:
		fpadd16s	%f1, %f3, %f27		!0 + xxxx =  xxxx	%odd  %odd  %odd
		fpsub16s	%f3, %f1, %f28		!xxxx - 0 =  xxxx	%odd  %odd  %even
		fcmps		%f27, %f28
		fbe		tst_3
		nop
		ta BAD_TRAP	


!16-bit addition operation. Carry from lower 16-bit segement should
!not propagate to upper 16-bit segment.
tst_3:
		fpadd16s	%f2, %f3, %f30		!5566+aa99=ffff, ffff+1=10000 
		fpadd32s	%f2, %f3, %f31		!5566+aa99+1(carry=1)=10000, ffff+1=10000 
		std		%f30, [%g2]		!store double, dw of %f30 ( inc. %31 ) is stored
tst_4:
		fpsub16s	%f4, %f5, %f30		!rs1 < rs2  4321-5432  7bcd-7df2
		fpsub32s	%f4, %f5, %f31		! 43217bcd - 54327df2
		std		%f30, [%g2+8]
tst_4a:
		fpsub16s	%f5, %f4, %f30		!rs1 > rs2 5432-4321  7df2-7bcd
		fpsub32s	%f5, %f4, %f31		! 54327df2 - 43217bcd
		std		%f30, [%g2+16]
tst_4b:
		fnegs		%f5, %f16
		fpsub16s	%f4, %f16, %f30		!rs1 < rs2 4321 - (-5432)
		fpsub32s	%f4, %f16, %f31	
		std		%f30, [%g2+24]
tst_4c:
		fpsub16s	%f16, %f4, %f30		!rs1 < rs2
		fpsub32s	%f16, %f4, %f31	
		std		%f30, [%g2+32]
		mov		5, %i0
		add		%g2, 40, %g2


!no carry or borrow from any 16-bit or 32-bit segement
fpaddsub1:
		set	data3, %g1
		ldd	[%g1], %f0
		mov	17, %i1
		add	%g1, 0x8, %g1

!all combination of carry and borrow
tst_5:
		ldd	[%g1], %f2
		fpadd16		%f0, %f2, %f32
		fpadd32		%f0, %f2, %f34
		fpsub16		%f2, %f0, %f36
		fpsub32		%f2, %f0, %f38
		fpadd16s	%f0, %f2, %f28
		fpadd32s	%f0, %f2, %f29
		fpsub16s	%f2, %f0, %f30
		fpsub32s	%f2, %f0, %f31
		std		%f32, [%g2+0]
		std		%f34, [%g2+8]
		std		%f36, [%g2+16]
		std		%f38, [%g2+24]
		std		%f28, [%g2+32]
		std		%f30, [%g2+40]
		add		%i0, 0x6, %i0
		add		%g2, 48, %g2
		sub		%i1, 1, %i1
		brnz,a		%i1,tst_5
		add		%g1, 0x8, %g1

!combination of positive and negative segment [4+1]
fpaddsub:
		set	data2, %g1

		ldd	[%g1],  %f2
		ldd	[%g1+16], %f4
		ldd	[%g1+24], %f6

!fpadd double carry from all four 16-bit segments
tst_8:
		fpadd16		%f2, %f4, %f32
		std		%f32, [%g2+0]
tst_8a:
		fpadd32		%f4, %f2, %f32
		std		%f32, [%g2+8]

!fpadd double no carry from  16-bit segments
tst_9:
		fpadd16		%f4, %f6, %f32
		std		%f32, [%g2+16]
tst_9a:
		fpadd32		%f6, %f4, %f32
		std		%f32, [%g2+24]
tst_10:
		fnegs		%f2, %f18
		fnegs		%f3, %f19
!		fpmerge		%f2, %f3, %f20
		fpsub16		%f2, %f4, %f32
		fpadd16		%f2, %f18, %f30		!rs1 < rs2
		fpadd32		%f2, %f18, %f34		!rs1 < rs2
		std		%f32, [%g2+32]
		std		%f30, [%g2+40]
		std		%f34, [%g2+48]
		add		%i0, 7, %i0
!final_check
final_check:
		ldx		[%g3+%l0], %o0
		ldx		[%g4+%l0], %o1
		sub		%o0, %o1, %o1
		brz,a		%o1, 1f			!why 1f?
		sub		%i0, 1, %i0
		ta		BAD_TRAP
1:		brnz,a		%i0, final_check
		add		%l0, 0x8, %l0

good_end:	ta 	GOOD_TRAP
		
user_text_end:

.seg "data"

ALIGN_PAGE_8K

user_data_start:

.align 8
data1:
		.word 0x0, 0x0
		.word 0x5566ffff, 0xaa990001
		.word 0x43217bcd, 0x54327df2
		.word 0x6bcdb436, 0x0 

.align 8
data2:
		.word 0x3f804135, 0x408040a0
		.word 0x3f80ceba, 0x4182df5e
		.word 0x456031fe, 0x401f5142

.align 8
data3:
		.word 	0x789a643b, 0x58ac6fe3
		.word 	0x12344321, 0x21345421
		.word	0x43223122, 0x5753ae23
		.word	0x72343b64, 0xb8a31e23
		.word	0x698a4567, 0xb7a3aebd
		.word	0x7f75d98f, 0x34562103
		.word	0x7634befd, 0x4532efff
		.word	0x0145f000, 0xb3333333
		.word	0x3232f0f0, 0xf0f0f0f0
		.word	0x89894545, 0x34534534
		.word	0xa5a55a5a, 0x5b5bc3c3
		.word	0xb4b44b4b, 0xa5a53c3c
		.word	0xc3c33c3c, 0xd2d29696
		.word	0xd2d29697, 0x4b4b2d2d
		.word	0xd2d29697, 0x4b4b2ddd
		.word	0xe1e1a5a5, 0x2d4ddd2d
		.word	0xe444cc53, 0xe1d3f0d2
		.word	0xf000e111, 0xd222c333


.align 8
exp_result_start:
		.word  0xffff0000, 0x00000000, 0xeeeffddb, 0xeeeefddb
		.word  0x11110225, 0x11110225, 0x6eeffddb, 0x6eeefddb 
		.word  0x91110225, 0x91110225, 0x8acea75c, 0x79e0c404
		.word  0x8acea75c, 0x79e0c404, 0x999adee6, 0xc888e43e
		.word  0x9999dee6, 0xc887e43e, 0x8acea75c, 0x8acea75c
		.word  0x999adee6, 0x9999dee6, 0xbbbc955d, 0xafff1e06
		.word  0xbbbc955d, 0xb0001e06, 0xca88cce7, 0xfea73e40
		.word  0xca87cce7, 0xfea73e40, 0xbbbc955d, 0xbbbc955d
		.word  0xca88cce7, 0xca87cce7, 0xeace9f9f, 0x114f8e06
		.word  0xeace9f9f, 0x114f8e06, 0xf99ad729, 0x5ff7ae40
		.word  0xf999d729, 0x5ff6ae40, 0xeace9f9f, 0xeace9f9f
		.word  0xf99ad729, 0xf999d729, 0xe224a9a2, 0x104f1ea0
		.word  0xe224a9a2, 0x10501ea0, 0xf0f0e12c, 0x5ef73eda
		.word  0xf0efe12c, 0x5ef73eda, 0xe224a9a2, 0xe224a9a2
		.word  0xf0f0e12c, 0xf0efe12c, 0xf80f3dca, 0x8d0290e6
		.word  0xf8103dca, 0x8d0290e6, 0x06db7554, 0xdbaab120
		.word  0x06db7554, 0xdba9b120, 0xf80f3dca, 0xf8103dca
		.word  0x06db7554, 0x06db7554, 0xeece2338, 0x9dde5fe2
		.word  0xeecf2338, 0x9ddf5fe2, 0xfd9a5ac2, 0xec86801c
		.word  0xfd9a5ac2, 0xec86801c, 0xeece2338, 0xeecf2338
		.word  0xfd9a5ac2, 0xfd9a5ac2, 0x79df543b, 0x0bdfa316
		.word  0x79e0543b, 0x0bdfa316, 0x88ab8bc5, 0x5a87c350
		.word  0x88ab8bc5, 0x5a86c350, 0x79df543b, 0x79e0543b
		.word  0x88ab8bc5, 0x88ab8bc5, 0xaacc552b, 0x499c60d3
		.word  0xaacd552b, 0x499d60d3, 0xb9988cb5, 0x9844810d
		.word  0xb9988cb5, 0x9844810d, 0xaacc552b, 0xaacd552b
		.word  0xb9988cb5, 0xb9988cb5, 0x0223a980, 0x8cffb517
		.word  0x0223a980, 0x8cffb517, 0x10efe10a, 0xdba7d551
		.word  0x10eee10a, 0xdba6d551, 0x0223a980, 0x0223a980
		.word  0x10efe10a, 0x10eee10a, 0x1e3fbe95, 0xb40733a6
		.word  0x1e3fbe95, 0xb40833a6, 0x2d0bf61f, 0x02af53e0
		.word  0x2d0af61f, 0x02af53e0, 0x1e3fbe95, 0x1e3fbe95
		.word  0x2d0bf61f, 0x2d0af61f, 0x2d4eaf86, 0xfe51ac1f
		.word  0x2d4eaf86, 0xfe51ac1f, 0x3c1ae710, 0x4cf9cc59
		.word  0x3c19e710, 0x4cf8cc59, 0x2d4eaf86, 0x2d4eaf86
		.word  0x3c1ae710, 0x3c19e710, 0x3c5da077, 0x2b7e0679
		.word  0x3c5da077, 0x2b7f0679, 0x4b29d801, 0x7a2626b3
		.word  0x4b28d801, 0x7a2626b3, 0x3c5da077, 0x3c5da077
		.word  0x4b29d801, 0x4b28d801, 0x4b6cfad2, 0xa3f79d10
		.word  0x4b6cfad2, 0xa3f79d10, 0x5a38325c, 0xf29fbd4a
		.word  0x5a38325c, 0xf29ebd4a, 0x4b6cfad2, 0x4b6cfad2
		.word  0x5a38325c, 0x5a38325c, 0x4b6cfad2, 0xa3f79dc0
		.word  0x4b6cfad2, 0xa3f79dc0, 0x5a38325c, 0xf29fbdfa
		.word  0x5a38325c, 0xf29ebdfa, 0x4b6cfad2, 0x4b6cfad2
		.word  0x5a38325c, 0x5a38325c, 0x5a7b09e0, 0x85f94d10
		.word  0x5a7c09e0, 0x85fa4d10, 0x6947416a, 0xd4a16d4a
		.word  0x6947416a, 0xd4a16d4a, 0x5a7b09e0, 0x5a7c09e0
		.word  0x6947416a, 0x6947416a, 0x5cde308e, 0x3a7f60b5
		.word  0x5cdf308e, 0x3a8060b5, 0x6baa6818, 0x892780ef
		.word  0x6baa6818, 0x892780ef, 0x5cde308e, 0x5cdf308e
		.word  0x6baa6818, 0x6baa6818, 0x689a454c, 0x2ace3316
		.word  0x689b454c, 0x2acf3316, 0x77667cd6, 0x79765350
		.word  0x77667cd6, 0x79765350, 0x689a454c, 0x689b454c
		.word  0x77667cd6, 0x77667cd6, 0x84e07333, 0x809f91e2
		.word  0x84e07333, 0x809f91e2, 0xbdfa9639, 0x98cbc125
		.word  0xbdfa9639, 0x98cbc125, 0xfa200f37, 0x0061ef5e
		.word  0xff00826a, 0x01008140, 0xff00826a, 0x01008140


.align 8
store_result:
		

user_data_end:
