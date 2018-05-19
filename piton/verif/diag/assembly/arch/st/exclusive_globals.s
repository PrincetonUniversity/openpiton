// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: exclusive_globals.s
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
 *  	
 *
 **********************************************************************/

#define H_HT0_Illegal_instruction_0x10 my_illegal_instruction

	
#include "boot.s"

.text
.global main  

main:
        setx counter, %l0, %l1
        stx %g0, [%l1]

	ta T_CHANGE_PRIV

	rdpr %pstate, %l0
	and %l0, 0x3fe, %l0
	
	wrpr %l0, %g0, %pstate  ! mg=ig=ag=0

	mov 0x100, %g7
	wrpr %l0, 0x401, %pstate ! 
	mov 0x200, %g7
	wrpr %l0, 0xc00, %pstate ! 
	mov 0x300, %g7
	wrpr %l0, 0x801, %pstate ! 
	mov 0x400, %g7
	wrpr %l0, 0xc01, %pstate ! 

	checking:       
        setx counter, %l0, %l1
        ldx [%l1], %l2
/* 
 * Taken out by Sam.
 * 	This is a bogus diag. Write to %pstate will
	nop generate any illegal_instruction trap. 
	So the checking here doesn't make any sense
        cmp %l2, 4
        bne fail
        nop
 */
		
	
pass:
	ta		T_GOOD_TRAP

fail:
	ta		T_BAD_TRAP


SECTION .USER_TRAP_FOR_HYP TEXT_VA=0x13002000, DATA_VA=0x13004000
attr_text {
        Name = .USER_TRAP_FOR_HYP,
        hypervisor
        }
attr_data {
        Name = .USER_TRAP_FOR_HYP
        RA=0x13004000,
        PA=ra2pa(0x13004000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=0x44, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.global my_illegal_instruction
my_illegal_instruction:
        setx counter, %l0, %l1
        ldx [%l1], %l2
        inc %l2
        stx %l2, [%l1]
        done
        nop

/*******************************************************
 * Data section 
 *******************************************************/
	
.data
.global counter
counter:
        .xword 0

