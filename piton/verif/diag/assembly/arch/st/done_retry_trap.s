// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: done_retry_trap.s
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
 *  	done/retry -> traps
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
        mov %g0, %l0     ! counter
        mov %g0, %l1     ! counter2
	
	ta T_CHANGE_NONPRIV
	done                  ! privileged_opcode
	retry

	ta T_CHANGE_PRIV
	done                  ! illegal
	retry

fcn:	
	.word 	0x85f00000
	.word 	0x87f00000
	.word 	0x89f00000
	.word 	0x8bf00000
	.word 	0x8df00000
	.word 	0x8ff00000
	.word 	0x91f00000
	.word 	0x93f00000
	.word 	0x95f00000
	.word 	0x97f00000
	.word 	0x99f00000
	.word 	0x9bf00000
	.word 	0x9df00000
	.word 	0x9ff00000
	.word 	0xa1f00000
	.word 	0xa3f00000
	.word 	0xa5f00000
	.word 	0xa7f00000
	.word 	0xa9f00000
	.word 	0xabf00000
	.word 	0xadf00000
	.word 	0xaff00000
	.word 	0xb1f00000
	.word 	0xb3f00000
	.word 	0xb5f00000
	.word 	0xb7f00000
	.word 	0xb9f00000
	.word 	0xbbf00000
	.word 	0xbdf00000
	.word 	0xbff00000

	ta  T_CHANGE_NONPRIV

fcn_nonpriv:	
	.word 	0x85f00000
	.word 	0x87f00000
	.word 	0x89f00000
	.word 	0x8bf00000
	.word 	0x8df00000
	.word 	0x8ff00000
	.word 	0x91f00000
	.word 	0x93f00000
	.word 	0x95f00000
	.word 	0x97f00000
	.word 	0x99f00000
	.word 	0x9bf00000
	.word 	0x9df00000
	.word 	0x9ff00000
	.word 	0xa1f00000
	.word 	0xa3f00000
	.word 	0xa5f00000
	.word 	0xa7f00000
	.word 	0xa9f00000
	.word 	0xabf00000
	.word 	0xadf00000
	.word 	0xaff00000
	.word 	0xb1f00000
	.word 	0xb3f00000
	.word 	0xb5f00000
	.word 	0xb7f00000
	.word 	0xb9f00000
	.word 	0xbbf00000
	.word 	0xbdf00000
	.word 	0xbff00000
		
checking:       
        mov %l0, %l2
        cmp %l2, 0x20
        bne fail
        nop

        mov %l1, %l2
        cmp %l2, 0x20
        bne fail
        nop

	
pass:
	ta		T_GOOD_TRAP

fail:
	ta		T_BAD_TRAP


SECTION .USER_TRAP_FOR_HYP TEXT_VA=0x13002000
attr_text {
        Name = .USER_TRAP_FOR_HYP,
        hypervisor
        }

.global my_illegal_instruction
my_illegal_instruction:
        inc %l0
        done
        nop


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

.global my_privileged_opcode
my_privileged_opcode:
        inc %l1
        done
        nop
