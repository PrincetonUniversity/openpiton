// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: logical_corner.s
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
 *
 *  Description:
 *  boundary cases for logical instructions
 *
 **********************************************************************/

#include "boot.s"

.text
.global main  

#define DATA_NB 14
	
main:
	setx operand, %l0, %g1
	setx operand, %l0, %g2

AND:		
	mov %g0, %l1
	mov %g0, %l2
		
loop_g1_and:	
	ldx [%g1 + %l1], %l3
loop_g2_and:	
	ldx [%g2 + %l2], %l4

and:	
	wr %g0, %g0, %ccr
	and %l3, %l4, %g7
	rd %ccr, %g6

andcc:		
	wr %g0, %g0, %ccr
	andcc %l3, %l4, %g7
	rd %ccr, %g6

	add %l2, 8, %l2
	cmp %l2, DATA_NB<<3
	bne loop_g2_and
	nop

	mov %g0, %l2
	add %l1, 8, %l1
	cmp %l1, DATA_NB<<3
	bne loop_g1_and
	nop



ANDN:		
	mov %g0, %l1
	mov %g0, %l2
		
loop_g1_andn:	
	ldx [%g1 + %l1], %l3
loop_g2_andn:	
	ldx [%g2 + %l2], %l4

andn:	
	wr %g0, %g0, %ccr
	andn %l3, %l4, %g7
	rd %ccr, %g6

andncc:		
	wr %g0, %g0, %ccr
	andncc %l3, %l4, %g7
	rd %ccr, %g6

	add %l2, 8, %l2
	cmp %l2, DATA_NB<<3
	bne loop_g2_andn
	nop

	mov %g0, %l2
	add %l1, 8, %l1
	cmp %l1, DATA_NB<<3
	bne loop_g1_andn
	nop


OR:		
	mov %g0, %l1
	mov %g0, %l2
		
loop_g1_or:	
	ldx [%g1 + %l1], %l3
loop_g2_or:	
	ldx [%g2 + %l2], %l4

or:	
	wr %g0, %g0, %ccr
	or %l3, %l4, %g7
	rd %ccr, %g6

orcc:		
	wr %g0, %g0, %ccr
	orcc %l3, %l4, %g7
	rd %ccr, %g6

	add %l2, 8, %l2
	cmp %l2, DATA_NB<<3
	bne loop_g2_or
	nop

	mov %g0, %l2
	add %l1, 8, %l1
	cmp %l1, DATA_NB<<3
	bne loop_g1_or
	nop


ORN:		
	mov %g0, %l1
	mov %g0, %l2
		
loop_g1_orn:	
	ldx [%g1 + %l1], %l3
loop_g2_orn:	
	ldx [%g2 + %l2], %l4

orn:	
	wr %g0, %g0, %ccr
	orn %l3, %l4, %g7
	rd %ccr, %g6

orncc:		
	wr %g0, %g0, %ccr
	orncc %l3, %l4, %g7
	rd %ccr, %g6

	add %l2, 8, %l2
	cmp %l2, DATA_NB<<3
	bne loop_g2_orn
	nop

	mov %g0, %l2
	add %l1, 8, %l1
	cmp %l1, DATA_NB<<3
	bne loop_g1_orn
	nop

XOR:		
	mov %g0, %l1
	mov %g0, %l2
		
loop_g1_xor:	
	ldx [%g1 + %l1], %l3
loop_g2_xor:	
	ldx [%g2 + %l2], %l4

xor:	
	wr %g0, %g0, %ccr
	xor %l3, %l4, %g7
	rd %ccr, %g6

xorcc:		
	wr %g0, %g0, %ccr
	xorcc %l3, %l4, %g7
	rd %ccr, %g6

	add %l2, 8, %l2
	cmp %l2, DATA_NB<<3
	bne loop_g2_xor
	nop

	mov %g0, %l2
	add %l1, 8, %l1
	cmp %l1, DATA_NB<<3
	bne loop_g1_xor
	nop

XNOR:		
	mov %g0, %l1
	mov %g0, %l2
		
loop_g1_xnor:	
	ldx [%g1 + %l1], %l3
loop_g2_xnor:	
	ldx [%g2 + %l2], %l4

xnor:	
	wr %g0, %g0, %ccr
	xnor %l3, %l4, %g7
	rd %ccr, %g6

xnorcc:		
	wr %g0, %g0, %ccr
	xnorcc %l3, %l4, %g7
	rd %ccr, %g6

	add %l2, 8, %l2
	cmp %l2, DATA_NB<<3
	bne loop_g2_xnor
	nop

	mov %g0, %l2
	add %l1, 8, %l1
	cmp %l1, DATA_NB<<3
	bne loop_g1_xnor
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




