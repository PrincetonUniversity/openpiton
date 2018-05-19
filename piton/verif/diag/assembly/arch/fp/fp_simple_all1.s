// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fp_simple_all1.s
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
 * Name:   fp_simple_all1.s
 *
 *  Description:
 *  	Same as fp_simple_all0.s except with st and ld to int reg
 *	for comparison with simics. Also 2 NOPs betwee st to ld.
 *
 *
 **********************************************************************/

#include "boot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

.text
.global main  

main:

        wr      	%g0, 0x7, %fprs         /* make sure fef is 1 */

	setx		data0, %l0, %l1
	setx		data1, %l0, %l2

/*******************************************************
        Initialize regs
 *******************************************************/
        ldd [%l1+0x50], %f0
        ldd [%l1+0x50], %f2
        ldd [%l1+0x50], %f4
        ldd [%l1+0x50], %f6
        ldd [%l1+0x50], %f8
        ldd [%l1+0x50], %f10
        ldd [%l1+0x50], %f12
        ldd [%l1+0x50], %f14
        ldd [%l1+0x50], %f16
        ldd [%l1+0x50], %f18
        ldd [%l1+0x50], %f20
        ldd [%l1+0x50], %f22
        ldd [%l1+0x50], %f24
        ldd [%l1+0x50], %f26
        ldd [%l1+0x50], %f28
        ldd [%l1+0x50], %f30
        ldd [%l1+0x50], %f32
/*******************************************************
 * Simple ld/st
 *******************************************************/

	ld		[%l1+0x0], %f0
	ld		[%l1+0x4], %f1
	ld		[%l1+0x8], %f2
	ld		[%l1+0xc], %f3

	ldd		[%l1+0x0], %f4
	ldd		[%l1+0x8], %f6
	ldd		[%l1+0x0], %f8
	ldd		[%l1+0x8], %f10

	nop; nop;

	st		%f8, [%l1+0x10]
	st		%f9, [%l1+0x14]
	st		%f10, [%l1+0x18]
	st		%f11, [%l1+0x1c]

	std		%f8, [%l1+0x20]
	std		%f10, [%l1+0x28]
	std		%f8, [%l1+0x30]
	std		%f10, [%l1+0x38]

	nop; nop;

	ld		[%l1+0x30], %f0
	ld		[%l1+0x34], %f1
	ld		[%l1+0x38], %f2
	ld		[%l1+0x3c], %f3
	
	ldd		[%l1+0x10], %f4
	ldd		[%l1+0x18], %f6

	std		%f0, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	std		%f2, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	std		%f4, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	std		%f6, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	std		%f8, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	std		%f10, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5

/*******************************************************
 * Arithmetic and CTI
 *******************************************************/

!	Just a few integer inst. to set cc and registers for moves

	subcc		%g0, 0x1, %g0		! This should set n and c
	set		0x1, %g1
	setx		0x80000000, %g2, %g3

	fadds		%f0, %f1, %f20
	std		%f20, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	faddd		%f0, %f2, %f22
	std		%f22, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fsubs		%f20, %f1, %f23
	std		%f22, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fsubd		%f22, %f2, %f22
	std		%f22, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fsubs		%f23, %f1, %f25
	std		%f24, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fsubd		%f22, %f2, %f24
	std		%f24, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fsubs		%f25, %f1, %f27
	std		%f26, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fsubd		%f24, %f2, %f26
	std		%f26, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5

	fcmps		%fcc0, %f0, %f1
	std		%f0, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fcmpd		%fcc1, %f0, %f2
	std		%f2, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fcmps		%fcc2, %f4, %f5
	std		%f4, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fcmpd		%fcc3, %f4, %f6
	std		%f6, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fcmps		%fcc1, %f0, %f1
	std		%f0, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fcmpd		%fcc2, %f0, %f2
	std		%f2, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fcmps		%fcc3, %f4, %f5
	std		%f4, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fcmpd		%fcc0, %f4, %f6
	std		%f6, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fcmps		%fcc2, %f0, %f1
	std		%f0, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fcmpd		%fcc3, %f0, %f2
	std		%f2, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fcmps		%fcc0, %f4, %f5
	std		%f4, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fcmpd		%fcc1, %f4, %f6
	std		%f6, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fcmps		%fcc3, %f0, %f1
	std		%f0, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fcmpd		%fcc0, %f0, %f2
	std		%f2, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fcmps		%fcc1, %f4, %f5
	std		%f4, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fcmpd		%fcc2, %f4, %f6
	std		%f6, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	
	fba,a		%fcc0, target1
	fba,a		test_fail		! This shouldnt be executed
	fcmpd		%fcc3, %f4, %f6		! This shouldnt be executed
	std		%f6, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5

target1:
	fbn,a		%fcc0, target2
	fbn,a		test_fail		! This shouldnt be executed

target2:
        fba,a,pt        %fcc1, target3
	fcmpd		%fcc2, %f4, %f6		! This shouldnt be executed

target3:
        fbn,a,pt        %fcc2, test_fail        ! This is not cauing trap (??)
        fbu,pt          %fcc3, target4

target4:
        fbg,a,pt        %fcc0, target5
	fcmps		%fcc1, %f4, %f5

target5:
        fbug,pt         %fcc2, target6
	fcmps		%fcc3, %f2, %f3

target6:
        fbl,a,pt        %fcc3, target7
	fcmps		%fcc0, %f1, %f1

target7:
        fbul,pt         %fcc0, target8
	fcmps		%fcc3, %f0, %f1

target8:
        fblg,a,pt       %fcc1, target9

target9:
        fbne,pt         %fcc2, target10

target10:
        fbe,pt          %fcc3, target11
	nop

target11:
        fbue,pt         %fcc0, target12
	fcmps		%fcc1, %f4, %f5
	
target12:
        fbge,pt         %fcc1, target13
	nop

target13:
        fbuge,a,pt      %fcc2, target14
	fcmps		%fcc3, %f4, %f5
	
target14:
        fble,pt         %fcc3, target15

target15:
        fbule,pt        %fcc0, target16

target16:
        fbo,pt          %fcc1, target17

target17:

	fmovsa		%icc, %f1, %f2
	std		%f2, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovsn		%icc, %f2, %f1
	std		%f0, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovsne		%icc, %f22, %f23
	std		%f22, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovsg		%icc, %f24, %f23
	std		%f22, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovsle		%icc, %f3, %f2
	std		%f2, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovsge		%icc, %f4, %f3
	std		%f2, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovsl		%icc, %f5, %f4
	std		%f4, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovsgu		%icc, %f6, %f5
	std		%f4, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovsleu	%icc, %f7, %f6
	std		%f6, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovscc		%icc, %f21, %f20
	std		%f20, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovscs		%icc, %f22, %f21
	std		%f20, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovspos	%icc, %f23, %f22
	std		%f22, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovsneg	%icc, %f24, %f23
	std		%f22, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovsvc		%icc, %f25, %f24
	std		%f24, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovsvs		%icc, %f26, %f25
	std		%f24, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5

	fmovda		%xcc, %f0, %f2
	std		%f2, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovdn		%xcc, %f2, %f0
	std		%f0, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovdne		%xcc, %f22, %f24
	std		%f24, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovdg		%xcc, %f24, %f24
	std		%f24, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovdle		%xcc, %f2, %f2
	std		%f2, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovdge		%xcc, %f4, %f2
	std		%f2, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovdl		%xcc, %f6, %f4
	std		%f4, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovdgu		%xcc, %f6, %f6
	std		%f6, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovdleu	%xcc, %f8, %f6
	std		%f6, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovdcc		%xcc, %f22, %f20
	std		%f20, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovdcs		%xcc, %f22, %f22
	std		%f22, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovdpos	%xcc, %f24, %f22
	std		%f22, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovdneg	%xcc, %f24, %f24
	std		%f24, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovdvc		%xcc, %f26, %f24
	std		%f24, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovdvs		%xcc, %f26, %f26
	std		%f26, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5

	fmovrse		%g0, %f25, %f26
	std		%f26, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovrde		%g0, %f24, %f26
	std		%f26, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovrslez	%g1, %f25, %f28
	std		%f28, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovrdlez	%g1, %f24, %f28
	std		%f28, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovrslz	%g3, %f25, %f30
	std		%f30, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fmovrdlz	%g3, %f24, %f30
	std		%f30, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5

	fstox		%f0, %f10
	std		%f10, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fdtox		%f2, %f10
	std		%f10, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fstoi		%f4, %f12
	std		%f12, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fdtox		%f4, %f12
	std		%f12, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5

	fxtos		%f10, %f0
	std		%f0, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fxtod		%f10, %f0
	std		%f0, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fitos		%f12, %f4
	std		%f4, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5
	fitod		%f12, %f4
	std		%f4, [%l1+0x0]
	nop; nop;
	ldx		[%l1+0x0], %g5

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
	.word		0x80000010
	.word		0x80000011
	.word		0x80000012
	.word		0x80000013
	.word		0x80000014
	.word		0x80000015
	.word		0x80000016
	.word		0x80000017
	.word		0x80000018
	.word		0x80000019
	.word		0x8000001a
	.word		0x8000001b
	.word		0x8000001c
	.word		0x8000001d
	.word		0x8000001e
	.word		0x8000001f
        .word 0x00000000, 0x00000000

.align 256

data1:
	.word		0x00000011
	.word		0x00000012
	.word		0x00000013
	.word		0x00000014
        
