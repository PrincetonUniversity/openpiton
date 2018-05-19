// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: priv_rs1.s
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
 *  	rdpr/wrpr -> traps
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
        mov %g0, %l0        ! counter
        mov %g0, %l1        ! counter2

	
	ta T_CHANGE_NONPRIV

rdpr_priv:		
	.word (0x81500000 + (17<<14))

	ta T_CHANGE_PRIV

rdpr_ill:		
	.word (0x81500000 + (17<<14))
		
checking:       
        mov %l0, %l2
        cmp %l2, 1
        bne fail
        nop

        mov %l1, %l2
        cmp %l2, 1
        bne fail
        nop

	
pass:
	ta		T_GOOD_TRAP

fail:
	ta		T_BAD_TRAP
