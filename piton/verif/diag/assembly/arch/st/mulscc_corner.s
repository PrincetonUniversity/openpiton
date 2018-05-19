// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mulscc_corner.s
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
 *  boundary cases for mulx instruction
 *
 **********************************************************************/
#define H_T0_Tag_Overflow my_tag_overflow

#include "boot.s"

.text
.global main  
	
#define DATA_NB 18

main:
	setx operand, %l0, %g1
	setx operand, %l0, %g2
	setx operand, %l0, %g3
	
	mov %g0, %l1
	mov %g0, %l2
	mov %g0, %l0

loop_g1:	
	ldx [%g1 + %l1], %l3
loop_g2:	
	ldx [%g2 + %l2], %l4
loop_g3:
	ldx [%g3 + %l0], %l5
	
mulscc:	
	wr %g0, %g0, %ccr
	wr %l5, %g0, %y
	mulscc %l3, %l4, %g7
	!rd %ccr, %g6
	rd %y, %g5

	add %l0, 8, %l0
	cmp %l0, DATA_NB<<3
	bne loop_g3
	nop	

	mov %g0, %l0
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


SECTION .USER_TRAP_FOR_SUP TEXT_VA=0x3006000
attr_text {
        Name = .USER_TRAP_FOR_SUP,
        RA=0x3006000,
        PA=ra2pa(0x3006000,0),
        part_0_i_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }

.global my_tag_overflow
my_tag_overflow:
        done
        nop

