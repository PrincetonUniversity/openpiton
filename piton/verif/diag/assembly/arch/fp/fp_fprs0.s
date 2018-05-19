// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fp_fprs0.s
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
 * Name:   fp_fprs0.s
 *
 *  Description:
 *  	Tests fprs
 *
 **********************************************************************/
#define H_T0_Fp_disabled_0x20 
#define My_T0_Fp_disabled_0x20 \
    rdpr %tstate, %i1; \
    rdpr %tt, %i1; \
    wr %g0, 0x4, %fprs; \
    rdpr	%tpc, %i0; \
    rdpr	%tnpc, %i1; \
    retry; \
    nop; nop;


#define ENABLE_T0_Fp_disabled_0x20
#include "boot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

.text
.global main  

main:

	setx		data0, %l0, %l1
	setx		data1, %l0, %l2

        wr      	%g0, 0x4, %fprs         ! Set fp enable

	ld		[%l1+0x0], %f0		! dl should be set
	rd		%fprs, %g1

	ldd		[%l2+0x0], %f32		! du should be set
	rd		%fprs, %g1

        wr      	%g0, 0x4, %fprs         ! Clear dl and du

	ba,a		tgt00			! in the delay slot
	ldd		[%l1+0x8], %f32

tgt00:

	rd		%fprs, %g1

	subcc		%g0, 0x1, %g0		! This should set n and c

	be,a		test_fail
	ldd		[%l1+0x8], %f32		! 

	rd		%fprs, %g1

	subcc		%g0, 0x1, %g0		! This should set n and c

	be,a		test_fail
	ldd		[%l1+0x8], %f0		! 

	rd		%fprs, %g1

	bne,a		tgt01
        wr      	%g0, 0x0, %fprs         ! Clear dl and du
	
tgt01:

	ldd		[%l1+0x8], %f0		! Should cause fp disabled trap

	rd		%fprs, %g1


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

.align 256

data1:
	.word		0x00000011
	.word		0x00000012
	.word		0x00000013
	.word		0x00000014


