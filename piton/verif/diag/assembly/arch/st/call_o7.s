// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: call_o7.s
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
 *  	This test is intended to test call/%o7
 *
 **********************************************************************/

#include "boot.s"

#define PSTATE_AM  3

	
.text
.global main, am_0, am_1
.global dummy, hi_dummy	

main:

am_0:		
	call dummy
	mov %o7, %g1
		
	setx am_0, %l0, %g2
	cmp %g1, %g2
	bne fail
	nop

	ta T_CHANGE_PRIV
        rdpr %pstate, %l0
	mov  1, %l1
	sll %l1, PSTATE_AM, %l1
	or  %l0, %l1, %l0
        wrpr %g0, %l0, %pstate

am_1:		
	call dummy
	mov %o7, %g1
		
	setx am_1, %l0, %g2
	cmp %g1, %g2
	bne fail
	nop

	ta T_CHANGE_PRIV
        rdpr %pstate, %l0
	mov  1, %l1
	sll %l1, PSTATE_AM, %l1
	xor %l1, %l1, %l1
	and %l0, %l1, %l0
        wrpr %g0, %l0, %pstate

	setx hi_am_0, %l0, %g1
	jmp %g1
	nop	
		
pass:
	ta		T_GOOD_TRAP

fail:
	ta		T_BAD_TRAP

dummy:  retl
        nop          

	
SECTION .MY_SECTION TEXT_VA=0x0ff0100000
attr_text {
        Name = .MY_SECTION,
        VA=0x0ff0100000, RA=0x0ff0100000, PA=ra2pa(0xff0100000,0),
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.global hi_am_0, hi_am_1
hi_am_0:		
	call hi_dummy
	mov %o7, %g1
		
	setx hi_am_0, %l0, %g2
	cmp %g1, %g2
	bne hi_fail
	nop

	ta T_CHANGE_PRIV
        rdpr %pstate, %l0
	mov  1, %l1
	sll %l1, PSTATE_AM, %l1
	or  %l0, %l1, %l0
        wrpr %g0, %l0, %pstate

hi_am_1:		
	call hi_dummy
	mov %o7, %g1
		
	setx hi_am_1, %l0, %g2
	cmp %g1, %g2
	bne hi_fail
	nop
	
hi_pass:
	ta		T_GOOD_TRAP

hi_fail:
	ta		T_BAD_TRAP

hi_dummy:  retl
        nop         


SECTION .MY_SECTION_AM_ALIAS TEXT_VA=0x0f0100000
attr_text {
        Name = .MY_SECTION_AM_ALIAS,
        VA=0x0f0100000, END_VA=0x0f0100100, RA=0xff0100000, PA=ra2pa(0xff0100000,0),
        uninitialized,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
