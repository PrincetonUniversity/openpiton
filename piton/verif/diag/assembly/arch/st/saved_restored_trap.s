// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: saved_restored_trap.s
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
 *  	saved/restored -> traps
 *
 **********************************************************************/
#define H_HT0_Illegal_instruction_0x10 
#define My_HT0_Illegal_instruction_0x10 inc %l0; done; nop
#define H_T0_Privileged_opcode_0x11
#define My_T0_Privileged_opcode_0x11 inc %l1; done; nop

#include "boot.s"

.text
.global main  

	
main:
        mov %g0, %l0  ! counter
        mov %g0, %l1  ! counter2

	
	ta T_CHANGE_NONPRIV
	saved                  ! privileged_opcode
	restored

	ta T_CHANGE_PRIV

fcn:	
	.word 	0x85880000
	.word 	0x87880000
	.word 	0x89880000
	.word 	0x8b880000
	.word 	0x8d880000
	.word 	0x8f880000
	.word 	0x91880000
	.word 	0x93880000
	.word 	0x95880000
	.word 	0x97880000
	.word 	0x99880000
	.word 	0x9b880000
	.word 	0x9d880000
	.word 	0x9f880000
	.word 	0xa1880000
	.word 	0xa3880000
	.word 	0xa5880000
	.word 	0xa7880000
	.word 	0xa9880000
	.word 	0xab880000
	.word 	0xad880000
	.word 	0xaf880000
	.word 	0xb1880000
	.word 	0xb3880000
	.word 	0xb5880000
	.word 	0xb7880000
	.word 	0xb9880000
	.word 	0xbb880000
	.word 	0xbd880000
	.word 	0xbf880000

	ta  T_CHANGE_NONPRIV

fcn_nonpriv:	
	.word 	0x85880000
	.word 	0x87880000
	.word 	0x89880000
	.word 	0x8b880000
	.word 	0x8d880000
	.word 	0x8f880000
	.word 	0x91880000
	.word 	0x93880000
	.word 	0x95880000
	.word 	0x97880000
	.word 	0x99880000
	.word 	0x9b880000
	.word 	0x9d880000
	.word 	0x9f880000
	.word 	0xa1880000
	.word 	0xa3880000
	.word 	0xa5880000
	.word 	0xa7880000
	.word 	0xa9880000
	.word 	0xab880000
	.word 	0xad880000
	.word 	0xaf880000
	.word 	0xb1880000
	.word 	0xb3880000
	.word 	0xb5880000
	.word 	0xb7880000
	.word 	0xb9880000
	.word 	0xbb880000
	.word 	0xbd880000
	.word 	0xbf880000
		
checking:       
        cmp %l0, 0x1E
        bne fail
        nop

        cmp %l1, 0x20
        bne fail
        nop

	
pass:
	ta		T_GOOD_TRAP

fail:
	ta		T_BAD_TRAP

