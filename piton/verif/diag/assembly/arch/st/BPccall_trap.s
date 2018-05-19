// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: BPccall_trap.s
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
 *  	check all BPcc cc1/cc0 -> illegal instruction
 *
 **********************************************************************/
#define H_HT0_Illegal_instruction_0x10
#define My_HT0_Illegal_instruction_0x10 inc %l1; done; nop
	
#include "boot.s"

.text
.global main  
	
main:
	mov %g0, %l1 !counter
	
	wr %g0, %g0, %ccr
	ba %xcc, bpcc_illegal
	nop
	nop
	nop
	nop
	
bpcc_illegal:
	.word 0x02580004  !! cc1/cc0 = 01
	nop
	.word 0x02780004  !! cc1/cc0 = 11
	nop

	.word 0x04580004  !! cc1/cc0 = 01
	nop
	.word 0x04780004  !! cc1/cc0 = 11
	nop
	
	.word 0x06580004  !! cc1/cc0 = 01
	nop
	.word 0x06780004  !! cc1/cc0 = 11
	nop

	.word 0x08580004  !! cc1/cc0 = 01
	nop
	.word 0x08780004  !! cc1/cc0 = 11
	nop

	.word 0x0a580004  !! cc1/cc0 = 01
	nop
	.word 0x0a780004  !! cc1/cc0 = 11
	nop

	.word 0x0c580004  !! cc1/cc0 = 01
	nop
	.word 0x0c780004  !! cc1/cc0 = 11
	nop

	.word 0x0e580004  !! cc1/cc0 = 01
	nop
	.word 0x0e780004  !! cc1/cc0 = 11
	nop

	.word 0x12580004  !! cc1/cc0 = 01
	nop
	.word 0x12780004  !! cc1/cc0 = 11
	nop

	.word 0x14580004  !! cc1/cc0 = 01
	nop
	.word 0x14780004  !! cc1/cc0 = 11
	nop

	.word 0x16580004  !! cc1/cc0 = 01
	nop
	.word 0x16780004  !! cc1/cc0 = 11
	nop

	.word 0x18580004  !! cc1/cc0 = 01
	nop
	.word 0x18780004  !! cc1/cc0 = 11
	nop

	.word 0x1a580004  !! cc1/cc0 = 01
	nop
	.word 0x1a780004  !! cc1/cc0 = 11
	nop

	.word 0x1c580004  !! cc1/cc0 = 01
	nop
	.word 0x1c780004  !! cc1/cc0 = 11
	nop	
	
	.word 0x1e580004  !! cc1/cc0 = 01
	nop
	.word 0x1e780004  !! cc1/cc0 = 11
	nop	
	
	.word 0x00580004  !! bpn cc1/cc0 = 01
	nop
	.word 0x00780004  !! bpn cc1/cc0 = 11
	nop

	.word 0x10580004  !! bpa cc1/cc0 = 01
	nop
	.word 0x10780004  !! bpa cc1/cc0 = 11
	nop

checking:	
	cmp %l1, 32
	bne fail
	nop
	
	
pass:
	ta		T_GOOD_TRAP

fail:
	ta		T_BAD_TRAP

