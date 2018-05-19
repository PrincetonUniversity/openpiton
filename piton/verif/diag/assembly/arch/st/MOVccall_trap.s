// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: MOVccall_trap.s
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
 *  	check all MOVcc cc2/cc1/cc0 -> illegal instruction
 *
 **********************************************************************/
#define H_HT0_Illegal_instruction_0x10
#define My_HT0_Illegal_instruction_0x10 inc %l1; done; nop
	
#include "boot.s"

.text
.global main  
	
main:
	mov %g0, %l1 ! counter

cc_101:			
	.word	0x81662800     ! mova  %icc, 0, %g0
	.word	0x81642800     ! movn  %icc, 0, %g0
	.word   0x81666800     ! movne  %icc, 0, %g0
	.word   0x81646800     ! move  %icc, 0, %g0
	.word   0x8166a800     ! movg  %icc, 0, %g0
	.word   0x8164a800     ! movle  %icc, 0, %g0
	.word   0x8166e800     ! movge  %icc, 0, %g0
	.word   0x8164e800     ! movl  %icc, 0, %g0
	.word   0x81672800     ! movgu  %icc, 0, %g0
	.word   0x81652800     ! movleu  %icc, 0, %g0
	.word   0x81676800     ! movcc  %icc, 0, %g0
	.word   0x81656800     ! movcs  %icc, 0, %g0
	.word   0x8167a800     ! movpos  %icc, 0, %g0
	.word   0x8165a800     ! movneg  %icc, 0, %g0
	.word   0x8167e800     ! movvc  %icc, 0, %g0
	.word   0x8165e800     ! movvs  %icc, 0, %g0


cc_111:	
	.word	0x81663800     ! mova  %icc, 0, %g0
	.word	0x81643800     ! movn  %icc, 0, %g0
	.word   0x81667800     ! movne  %icc, 0, %g0
	.word   0x81647800     ! move  %icc, 0, %g0
	.word   0x8166b800     ! movg  %icc, 0, %g0
	.word   0x8164b800     ! movle  %icc, 0, %g0
	.word   0x8166f800     ! movge  %icc, 0, %g0
	.word   0x8164f800     ! movl  %icc, 0, %g0
	.word   0x81673800     ! movgu  %icc, 0, %g0
	.word   0x81653800     ! movleu  %icc, 0, %g0
	.word   0x81677800     ! movcc  %icc, 0, %g0
	.word   0x81657800     ! movcs  %icc, 0, %g0
	.word   0x8167b800     ! movpos  %icc, 0, %g0
	.word   0x8165b800     ! movneg  %icc, 0, %g0
	.word   0x8167f800     ! movvc  %icc, 0, %g0
	.word   0x8165f800     ! movvs  %icc, 0, %g0






	
checking:	
	cmp %l1, 32
	bne fail
	nop
	
	
pass:
	ta		T_GOOD_TRAP

fail:
	ta		T_BAD_TRAP
