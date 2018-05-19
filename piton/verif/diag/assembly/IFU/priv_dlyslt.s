// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: priv_dlyslt.s
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
! This diag tests the following condition:	
! 1 - when a priv page is in the delay slot of
!     an unconditional branch on the end of a user page, and the delay 
!     slot is annulled and the branch target hits and is non priv

	
#define CIOP
#define THREAD_MASK 0x0000000f
#define NO_TRAPCHECK
#include "boot.s"
	
.text
.global main

main:
	setx end_user_page, %r31, %r1
	jmp %r1
	nop
	
.global end_diag
end_diag:
	cmp %r16, 0x1
	bne fail_diag
	nop
	ta T_GOOD_TRAP
fail_diag:
	ta T_BAD_TRAP

	
SECTION .USER_PAGE TEXT_VA=0x80000000
	
attr_text {

        Name = .USER_PAGE,
        VA= 0x80000000,
        RA= 0x180000000,
        PA= ra2pa(0x180000000,0),
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
}

.text
.skip 0x1fa0
.global end_user_page
end_user_page: ! so that the priv page doesn't miss in the dlyslt
	ta T_CHANGE_PRIV
	setx begin_priv_page_0, %r31, %r1	
	jmp %r1 
	nop
.global setup_br_loop_0_cnt
setup_br_loop_0_cnt:
	ta T_CHANGE_NONPRIV
        mov 0x3, %r1
br_loop_0:
        dec %r1
        cmp %r1, 0x0
        bne annul_dlyslt
        nop
	setx end_diag, %r31, %r1
	jmp %r1
	nop
annul_dlyslt:	
        ba,a br_loop_0
	
SECTION .PRIV_PAGE TEXT_VA=0x80002000
	
attr_text {

        Name = .PRIV_PAGE,
        VA= 0x80002000,
        RA= 0x180002000,
        PA= ra2pa(0x180002000,0),
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
}

.text
.global begin_priv_page_0 
begin_priv_page_0:
	add %r0, 0x1, %r16 !r16 should NOT be updated when in the dlyslt
	setx setup_br_loop_0_cnt, %r31, %r1	
	jmp %r1
	nop


	


