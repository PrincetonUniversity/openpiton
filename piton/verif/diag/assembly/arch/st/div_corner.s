// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: div_corner.s
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
 *  boundary cases for div(32) instruction
 *
 **********************************************************************/
#define H_T0_Tag_Overflow 
#define My_T0_Tag_Overflow done; nop
#define H_T0_Division_By_Zero
#define My_T0_Division_By_Zero done; nop
	
#include "boot.s"

.text
.global main  

#define DATA_NB 18

main:
	mov %g0, %l1
	mov %g0, %l2
	
	setx operand, %l0, %g1
	setx operand, %l0, %g2

loop_g1:	
	ldx [%g1 + %l1], %l3
loop_g2:	
	ldx [%g2 + %l2], %l4

divx:	
	wr %g0, %g0, %ccr
	udiv %l3, %l4, %g7
	rd %ccr, %g6
	rd %y, %g5
	
	wr %g0, %g0, %ccr
	sdiv %l3, %l4, %g7
	rd %ccr, %g6
	rd %y, %g5

	wr %g0, %g0, %ccr
	udivcc %l3, %l4, %g7
	rd %ccr, %g6
	rd %y, %g5
	
	wr %g0, %g0, %ccr
	sdivcc %l3, %l4, %g7
	rd %ccr, %g6
	rd %y, %g5
	
		
	add %l2, 8, %l2
	cmp %l2, DATA_NB<<3
	bne loop_g2
	nop

	mov %g0, %l2
	add %l1, 8, %l1
	cmp %l1, DATA_NB<<3
	bne loop_g1
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
	.xword 0x0000000000000010
	.xword 0x0000000000000011
	.xword 0x000000007ffffffc
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
	.xword 0xfffffffffffffffc
	.xword 0xfffffffffffffffe
	.xword 0xffffffffffffffff
