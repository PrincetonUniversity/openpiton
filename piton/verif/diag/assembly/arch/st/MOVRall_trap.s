// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: MOVRall_trap.s
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
 *  	check all MOVR rcond=000/100 -> illegal_instruction
 *
 **********************************************************************/
#define H_HT0_Illegal_instruction_0x10
#define My_HT0_Illegal_instruction_0x10 inc %l1; done; nop
	
#include "boot.s"

.text
.global main  
	
main:
	mov %g0, %l1  ! counter

rcond_000:	
	.word 0x81782000  !   movrne  %g0, 0, %g0
	.word 0x81782000  !   movre  %g0, 0, %g0
	.word 0x81782000    !  movrgez  %g0, 0, %g0
	.word 0x81782000    !  movrlz  %g0, 0, %g0
	.word 0x81782000    !  movrlez  %g0, 0, %g0
	.word 0x81782000    !  movrgz  %g0, 0, %g0

	


rcond_100:	
	.word 0x81783000  !   movrne  %g0, 0, %g0
	.word 0x81782000  !   movre  %g0, 0, %g0
	.word 0x81783000    !  movrgez  %g0, 0, %g0
	.word 0x81782000    !  movrlz  %g0, 0, %g0
	.word 0x81782000    !  movrlez  %g0, 0, %g0
	.word 0x81783000    !  movrgz  %g0, 0, %g0





	
checking:	
	cmp %l1, 12
	bne fail
	nop
	
	
pass:
	ta		T_GOOD_TRAP

fail:
	ta		T_BAD_TRAP

