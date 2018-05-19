// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: add_imm_corner.s
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
 * Name:   
 * Date:   
 *
 *  Description:
 *  boundary cases for add instruction w/ immediate
 *
 **********************************************************************/

#ifdef MT_TEMPLATE	
#include "mt_body.h"
#else
#include "boot.s"
.global main

#endif

.text

#define DATA_NB 14
	
main:
	setx operand, %l0, %g1


imm_0:	
	mov %g0, %l1
	
loop_g1_0:	
	ldx [%g1 + %l1], %l3
add_0:	
	wr %g0, %g0, %ccr
	add %l3, 0, %g7
	rd %ccr, %g6

addc_0:		
	wr %g0, %g0, %ccr
	addc %l3, 0, %g7
	rd %ccr, %g6

addcc_0:		
	wr %g0, %g0, %ccr
	addcc %l3, 0, %g7
	rd %ccr, %g6
	wr %g0, 1, %ccr
	addcc %l3, 0, %g7
	rd %ccr, %g6
	wr %g0, 0x10, %ccr
	addcc %l3, 0, %g7
	rd %ccr, %g6
	wr %g0, 0x11, %ccr
	addcc %l3, 0, %g7
	rd %ccr, %g6

addccc_0:		
	wr %g0, %g0, %ccr
	addccc %l3, 0, %g7
	rd %ccr, %g6
	wr %g0, 1, %ccr
	addccc %l3, 0, %g7
	rd %ccr, %g6
	wr %g0, 0x10, %ccr
	addccc %l3, 0, %g7
	rd %ccr, %g6
	wr %g0, 0x11, %ccr
	addccc %l3, 0, %g7
	rd %ccr, %g6
		

	add %l1, 8, %l1
	cmp %l1, DATA_NB<<3
	bne loop_g1_0
	nop

imm_1:	
	mov %g0, %l1
	
loop_g1_1:	
	ldx [%g1 + %l1], %l3
add_1:	
	wr %g0, %g0, %ccr
	add %l3, 1, %g7
	rd %ccr, %g6

addc_1:		
	wr %g0, %g0, %ccr
	addc %l3, 1, %g7
	rd %ccr, %g6

addcc_1:		
	wr %g0, %g0, %ccr
	addcc %l3, 1, %g7
	rd %ccr, %g6
	wr %g0, 1, %ccr
	addcc %l3, 1, %g7
	rd %ccr, %g6
	wr %g0, 0x10, %ccr
	addcc %l3, 1, %g7
	rd %ccr, %g6
	wr %g0, 0x11, %ccr
	addcc %l3, 1, %g7
	rd %ccr, %g6

addccc_1:		
	wr %g0, %g0, %ccr
	addccc %l3, 1, %g7
	rd %ccr, %g6
	wr %g0, 1, %ccr
	addccc %l3, 1, %g7
	rd %ccr, %g6
	wr %g0, 0x10, %ccr
	addccc %l3, 1, %g7
	rd %ccr, %g6
	wr %g0, 0x11, %ccr
	addccc %l3, 1, %g7
	rd %ccr, %g6
		

	add %l1, 8, %l1
	cmp %l1, DATA_NB<<3
	bne loop_g1_1
	nop

	
imm_0fff:	
	mov %g0, %l1
	
loop_g1_0fff:	
	ldx [%g1 + %l1], %l3
add_0fff:	
	wr %g0, %g0, %ccr
	add %l3, 0xfff, %g7
	rd %ccr, %g6

addc_0fff:		
	wr %g0, %g0, %ccr
	addc %l3, 0xfff, %g7
	rd %ccr, %g6

addcc_0fff:		
	wr %g0, %g0, %ccr
	addcc %l3, 0xfff, %g7
	rd %ccr, %g6
	wr %g0, 1, %ccr
	addcc %l3, 0xfff, %g7
	rd %ccr, %g6
	wr %g0, 0x10, %ccr
	addcc %l3, 0xfff, %g7
	rd %ccr, %g6
	wr %g0, 0x11, %ccr
	addcc %l3, 0xfff, %g7
	rd %ccr, %g6

addccc_0fff:		
	wr %g0, %g0, %ccr
	addccc %l3, 0xfff, %g7
	rd %ccr, %g6
	wr %g0, 1, %ccr
	addccc %l3, 0xfff, %g7
	rd %ccr, %g6
	wr %g0, 0x10, %ccr
	addccc %l3, 0xfff, %g7
	rd %ccr, %g6
	wr %g0, 0x11, %ccr
	addccc %l3, 0xfff, %g7
	rd %ccr, %g6
		

	add %l1, 8, %l1
	cmp %l1, DATA_NB<<3
	bne loop_g1_0fff
	nop

	
imm_1000:	
	mov %g0, %l1
	
loop_g1_1000:	
	ldx [%g1 + %l1], %l3
add_1000:	
	wr %g0, %g0, %ccr
	add %l3, 0x1000, %g7
	rd %ccr, %g6

addc_1000:		
	wr %g0, %g0, %ccr
	addc %l3, 0x1000, %g7
	rd %ccr, %g6

addcc_1000:		
	wr %g0, %g0, %ccr
	addcc %l3, 0x1000, %g7
	rd %ccr, %g6
	wr %g0, 1, %ccr
	addcc %l3, 0x1000, %g7
	rd %ccr, %g6
	wr %g0, 0x10, %ccr
	addcc %l3, 0x1000, %g7
	rd %ccr, %g6
	wr %g0, 0x11, %ccr
	addcc %l3, 0x1000, %g7
	rd %ccr, %g6

addccc_1000:		
	wr %g0, %g0, %ccr
	addccc %l3, 0x1000, %g7
	rd %ccr, %g6
	wr %g0, 1, %ccr
	addccc %l3, 0x1000, %g7
	rd %ccr, %g6
	wr %g0, 0x10, %ccr
	addccc %l3, 0x1000, %g7
	rd %ccr, %g6
	wr %g0, 0x11, %ccr
	addccc %l3, 0x1000, %g7
	rd %ccr, %g6
		

	add %l1, 8, %l1
	cmp %l1, DATA_NB<<3
	bne loop_g1_1000
	nop

	
imm_1fff:	
	mov %g0, %l1
		
loop_g1_1fff:	
	ldx [%g1 + %l1], %l3
add_1fff:	
	wr %g0, %g0, %ccr
	add %l3, 0x1fff, %g7
	rd %ccr, %g6

addc_1fff:		
	wr %g0, %g0, %ccr
	addc %l3, 0x1fff, %g7
	rd %ccr, %g6

addcc_1fff:		
	wr %g0, %g0, %ccr
	addcc %l3, 0x1fff, %g7
	rd %ccr, %g6
	wr %g0, 1, %ccr
	addcc %l3, 0x1fff, %g7
	rd %ccr, %g6
	wr %g0, 0x10, %ccr
	addcc %l3, 0x1fff, %g7
	rd %ccr, %g6
	wr %g0, 0x11, %ccr
	addcc %l3, 0x1fff, %g7
	rd %ccr, %g6

addccc_1fff:		
	wr %g0, %g0, %ccr
	addccc %l3, 0x1fff, %g7
	rd %ccr, %g6
	wr %g0, 1, %ccr
	addccc %l3, 0x1fff, %g7
	rd %ccr, %g6
	wr %g0, 0x10, %ccr
	addccc %l3, 0x1fff, %g7
	rd %ccr, %g6
	wr %g0, 0x11, %ccr
	addccc %l3, 0x1fff, %g7
	rd %ccr, %g6
		

	add %l1, 8, %l1
	cmp %l1, DATA_NB<<3
	bne loop_g1_1fff
	nop

	
pass:
	ta		T_GOOD_TRAP

fail:
	ta		T_BAD_TRAP


/*******************************************************
 * Data section 
 *******************************************************/
	
.data

operand:		
	.xword 0x0000000000000000
	.xword 0x0000000000000001
	.xword 0x000000007ffffffe
	.xword 0x000000007fffffff
	.xword 0x0000000080000000
	.xword 0x0000000080000001	
	.xword 0x00000000fffffffe
	.xword 0x00000000ffffffff
	.xword 0x7ffffffffffffffe
	.xword 0x7fffffffffffffff
	.xword 0x8000000000000000
	.xword 0x8000000000000001
	.xword 0xfffffffffffffffe
	.xword 0xffffffffffffffff




