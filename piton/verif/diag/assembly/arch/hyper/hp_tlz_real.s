// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hp_tlz_real.s
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
 * Name:   hp_tlz.s
 *
 * Description:
 *	Self-checking diag to test trap-level-zero trap. 
 *      Trap-level-zero trap is delivered to the hypervisor when
 *      TL goes to 0 and HTSTATE[1].tlz = 1.
 **********************************************************************/

#define MAIN_PAGE_HV_ALSO
#define MAIN_BASE_TEXT_VA 0x20006000 
#define MAIN_BASE_TEXT_RA 0x20006000 
#include "boot.s"

.text
.global	main

/***********************************************************************/

attr_text {
        Name = .MAIN,
        VA=MAIN_BASE_TEXT_VA,
        RA=MAIN_BASE_TEXT_RA,
        tsbonly,
        part_0_i_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

main:
	ta		T_CHANGE_PRIV

	ta		T_CHANGE_TO_TL1

	ta		T_CHANGE_HPRIV

	! set HPSTATE.tlz = 1 
	rdhpr   %htstate, %g1
	or      %g1,0x1, %g1      
	wrhpr   %g1, %g0, %htstate

	ta		T_CHANGE_NONHPRIV

	! at this point we should be in
	! supervisor mode with TL=1

	! enable TLZ trap 
	mov		0x5f, %o0
	ta 		T_HTRAP_EN

	! setup %tpc and %tnpc
	setx		super_tl0, %g3, %g2
	wrpr		%g2, 0x0, %tpc
        add             %g2, 4, %g2
	wrpr		%g2, 0x0, %tnpc

        ! turnoff itlb
	ta		T_CHANGE_HPRIV
        ldxa [%g0] 0x45, %g1
        sllx %g1, 61, %g2
        srlx %g2, 63, %g2
        sllx %g2,  2, %g2
        xor  %g1,  %g2, %g1
        stxa %g1, [%g0] 0x45
	ta		T_CHANGE_NONHPRIV

	! retry should go to TL 0:
	retry

	

/*******************************************************
 * Exit code
 *******************************************************/
.global test_fail
test_fail:
FAIL:						/*jump here if FAIL*/
	ta	T_BAD_TRAP

.global test_pass
test_pass:
PASS:						/*jump here if PASS*/
	ta	T_GOOD_TRAP

	

/*******************************************************
 * Data section
 *******************************************************/
.data
	! put your data here
	.word	0xdeadbeef


SECTION .USER_TRAP_FOR_SUP TEXT_VA=0x20008000
attr_text {
        Name = .USER_TRAP_FOR_SUP,
        RA=0x20008000,
        PA=ra2pa(0x20008000,0),
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_i_ctx_zero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

.align 128
.global super_tl0
super_tl0:
	! nop should get a TLZ trap
	nop
	nop
	cmp		%o0, 0x0
	bne		test_fail
	nop
        ba		test_pass
        nop

