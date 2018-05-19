// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fp_ldst_gen0.s
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
 *
 *  Description:
 *  	General fp load store test.
 *
 **********************************************************************/

#ifdef MT_TEMPLATE
#include "mt_body.h"
#else
#define ENABLE_T0_Fp_disabled_0x20
#include "boot.s"
.global main
#endif

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

.text

main:

        wr      	%g0, 0x7, %fprs         /* make sure fef is 1 */

	setx		data0, %l0, %l1
	setx		data1, %l0, %l2

/*******************************************************
 * Simple ld/st
 *******************************************************/

	ld		[%l1+0x0], %f0
	ld		[%l1+0x4], %f1
	ld		[%l1+0x8], %f2
	ld		[%l1+0xc], %f3

	ldd		[%l1+0x0], %f4
	ldd		[%l1+0x8], %f6

	st		%f0, [%l1+0x10]
	st		%f1, [%l1+0x14]
	st		%f2, [%l1+0x18]
	st		%f3, [%l1+0x1c]

	std		%f4, [%l1+0x20]
	std		%f6, [%l1+0x28]

  !! check that the stores go through
  ld    [%l1+0x10], %i0
  ld    [%l1+0x14], %i1
  ld    [%l1+0x18], %i2
  ld    [%l1+0x1c], %i3
  ldx   [%l1+0x20], %i4
  ldx   [%l1+0x28], %i5

	ld		[%l1+0x30], %f0
	ld		[%l1+0x34], %f1
	ld		[%l1+0x38], %f2
	ld		[%l1+0x3c], %f3
	
	ldd		[%l1+0x10], %f4
	ldd		[%l1+0x18], %f36

test_pass:
	
	ta		T_GOOD_TRAP

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
