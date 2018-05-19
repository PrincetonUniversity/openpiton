// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Tcc_trap.s
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
 *  	check Tcc cc1/cc0={01,11} -> illegal_instruction
 *
 **********************************************************************/
#define H_HT0_Illegal_instruction_0x10
#define My_HT0_Illegal_instruction_0x10 inc %l1; done; nop
	
#include "boot.s"

.text
.global main  
	
main:
	mov %g0, %l1  ! counter

cc_01:	
	.word 0x91d02900     !ta  0x100
	.word 0x81d02900     !tn  0x100
	.word 0x93d02900     !tne  0x100
	.word 0x83d02900     !te  0x100
	.word 0x95d02900     !tg  0x100
	.word 0x85d02900     !tle  0x100
	.word 0x97d02900     !tge  0x100
	.word 0x87d02900     !tl  0x100
	.word 0x99d02900     !tgu  0x100
	.word 0x89d02900     !tleu  0x100
	.word 0x9bd02900     !tcc  0x100
	.word 0x8bd02900     !tcs  0x100
	.word 0x9dd02900     !tpos  0x100
	.word 0x8dd02900     !tneg  0x100
	.word 0x9fd02900     !tvc  0x100
	.word 0x8fd02900     !tvs  0x100

cc_11:	

	.word 0x91d03900     !ta  0x100
	.word 0x81d03900     !tn  0x100
	.word 0x93d03900     !tne  0x100
	.word 0x83d03900     !te  0x100
	.word 0x95d03900     !tg  0x100
	.word 0x85d03900     !tle  0x100
	.word 0x97d03900     !tge  0x100
	.word 0x87d03900     !tl  0x100
	.word 0x99d03900     !tgu  0x100
	.word 0x89d03900     !tleu  0x100
	.word 0x9bd03900     !tcc  0x100
	.word 0x8bd03900     !tcs  0x100
	.word 0x9dd03900     !tpos  0x100
	.word 0x8dd03900     !tneg  0x100
	.word 0x9fd03900     !tvc  0x100
	.word 0x8fd03900     !tvs  0x100

	
checking:	
	cmp %l1, 32
	bne fail
	nop
	
	
pass:
	ta		T_GOOD_TRAP

fail:
	ta		T_BAD_TRAP
