// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: shift_corner.s
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
 *  boundary cases for add instruction	
 *
 **********************************************************************/

#include "boot.s"

.text
.global main  

#define DATA_NB 6
	
main:
	mov %g0, %l1
	mov %g0, %l4
	
	setx operand, %l0, %g1

loop_g1:	
	ldx [%g1 + %l1], %l3
loop_g2:	
	and %l4, 0x1f, %l5
		
	sll %l3, %l4, %o0
	srl %l3, %l4, %o1
	sra %l3, %l4, %o2

	sllx %l3, %l5, %o3
	srlx %l3, %l5, %o4
	srax %l3, %l5, %o5

	add %l4, 1, %l4
	cmp %l4, 64
	bne loop_g2
	nop

	mov %g0, %l4
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
	.xword 0x0000000000000001
	.xword 0x00a0a0a0a0000001	
	.xword 0xa0a0a0a000000000
	.xword 0xa0a0a0a000000001
	.xword 0x7fffffff7ffffffe
	.xword 0x7ffffffffffffffe
