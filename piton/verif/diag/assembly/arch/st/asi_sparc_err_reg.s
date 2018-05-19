// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: asi_sparc_err_reg.s
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
#define H_HT0_Illegal_instruction_0x10
#define My_HT0_Illegal_instruction_0x10 done; nop
#define H_HT0_Privileged_Action_0x37 
#define My_HT0_Privileged_Action_0x37 inc %l1; done; nop
	
#include "boot.s"

.text
.global main 

#define ASI_ERROR_INJECT_REG	0x43	
#ifndef ASI_SPARC_ERROR_EN_REG
#define ASI_SPARC_ERROR_EN_REG	0x4B
#endif
#define ASI_SPARC_ERROR_STATUS_REG 0x4C
#define ASI_SPARC_ERROR_ADDRESS_REG 0x4D		

	
main:
        mov %g0, %l1

	ta T_CHANGE_NONPRIV
	stxa %g0, [%g0]ASI_ERROR_INJECT_REG
	stxa %g0, [%g0]ASI_SPARC_ERROR_EN_REG
	stxa %g0, [%g0]ASI_SPARC_ERROR_STATUS_REG
	stxa %g0, [%g0]ASI_SPARC_ERROR_ADDRESS_REG


		
checking:       
        cmp %l1, 4
        bne fail
        nop

	
pass:
	ta		T_GOOD_TRAP

fail:
	ta		T_BAD_TRAP

