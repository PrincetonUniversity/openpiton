// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tsub_imm_corner.s
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
 *  boundary cases for tsubcc instruction w/ immediate
 *
 **********************************************************************/
#define H_T0_Tag_Overflow
#define My_T0_Tag_Overflow done; nop

#include "boot.s"

.text
.global main  

#define DATA_NB 18
	
main:
	setx operand, %l0, %g1


imm_0:	
	mov %g0, %l1
	
loop_g1_0:	
	ldx [%g1 + %l1], %l3
tsubcc_0:	
	wr %g0, %g0, %ccr
	tsubcc %l3, 0, %g7
	rd %ccr, %g6

tsubcctv_0:		
	wr %g0, %g0, %ccr
	tsubcctv %l3, 0, %g7
	rd %ccr, %g6

	add %l1, 8, %l1
	cmp %l1, DATA_NB<<3
	bne loop_g1_0
	nop

imm_1:	
	mov %g0, %l1
	
loop_g1_1:	
	ldx [%g1 + %l1], %l3
tsubcc_1:	
	wr %g0, %g0, %ccr
	tsubcc %l3, 1, %g7
	rd %ccr, %g6

tsubccc_1:		
	wr %g0, %g0, %ccr
	tsubcctv %l3, 1, %g7
	rd %ccr, %g6

	add %l1, 8, %l1
	cmp %l1, DATA_NB<<3
	bne loop_g1_1
	nop

	
imm_0fff:	
	mov %g0, %l1
	
loop_g1_0fff:	
	ldx [%g1 + %l1], %l3
tsubcc_0fff:	
	wr %g0, %g0, %ccr
	tsubcc %l3, 0xfff, %g7
	rd %ccr, %g6

tsubccc_0fff:		
	wr %g0, %g0, %ccr
	tsubcctv %l3, 0xfff, %g7
	rd %ccr, %g6

	add %l1, 8, %l1
	cmp %l1, DATA_NB<<3
	bne loop_g1_0fff
	nop

	
imm_1000:	
	mov %g0, %l1
	
loop_g1_1000:	
	ldx [%g1 + %l1], %l3
tsubcc_1000:	
	wr %g0, %g0, %ccr
	tsubcc %l3, 0x1000, %g7
	rd %ccr, %g6

tsubccc_1000:		
	wr %g0, %g0, %ccr
	tsubcctv %l3, 0x1000, %g7
	rd %ccr, %g6

	add %l1, 8, %l1
	cmp %l1, DATA_NB<<3
	bne loop_g1_1000
	nop

	
imm_1fff:	
	mov %g0, %l1
		
loop_g1_1fff:	
	ldx [%g1 + %l1], %l3
tsubcc_1fff:	
	wr %g0, %g0, %ccr
	tsubcc %l3, 0x1fff, %g7
	rd %ccr, %g6

tsubccc_1fff:		
	wr %g0, %g0, %ccr
	tsubcctv %l3, 0x1fff, %g7
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

