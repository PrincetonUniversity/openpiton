// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tr_mmu2red.s
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
 * Name:   tr_mmu2red.s
 * Date:   05/17/02
 *
 *
 *  Description:
 *      * Set tl=5, take immu (and later dmmu) miss, bring the machine
 * 	  to red mode and bad to tl=0, and check if states are OK.
 *	* Self-checking
 *
 **********************************************************************/

/*******************************************************
 * My handler externsions
 *******************************************************/

#define My_RED_Mode_Other_Reset \
	rdpr	%pstate, %l1;	\
	rdpr	%tl, %l0;	\
	wrpr	%g0, 0, %tl;	\
	wrpr	%g0, 0, %gl;	\
	mov     0xf, %l3;       \
	stxa 	%l3, [%g0] ASI_LSU_CTL_REG; \
	jmp	%l7;		\
	wrhpr	0x800, %hpstate;

#define	FAIL()		ta T_BAD_TRAP

/*******************************************************/

#define MAIN_PAGE_HV_ALSO
#include "boot.s"

.text
.global main  

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
	ta	T_CHANGE_HPRIV
!case 1: immu miss to red mode
	setx	return_point1, %l0, %l7
	wrpr	5, %tl                     ! setup traplevel to 5, need one more to error.
	rdhpr   %hpstate, %g1
	mov     4, %g2
	wrhpr   %g1, %g2, %hpstate
	nop			           ! any instruction now will cause itlb miss.

	ta 	T_BAD_TRAP

return_point1:
	cmp	%l0, 6			!tl
	bne	test_fail
	cmp	%l1, 0x14		!pstate
	bne	test_fail
	nop

!case 2: dmmu miss to red mode
	ta	T_CHANGE_HPRIV
	wrpr	1, %tl
	ta	T_CHANGE_NONHPRIV
	setx	dtlb_miss_addr, %l1, %l0    	! will load itlb as well.

	ta	T_CHANGE_HPRIV
	setx	return_point2, %l1, %l7
	wrpr	5, %tl
	rdhpr   %hpstate, %g1
	mov     4, %g2
	wrhpr   %g1, %g2, %hpstate

	ldx	[%l0], %l7		! dmmu miss will take to error state.

	ta	T_BAD_TRAP

return_point2:
	cmp	%l0, 6
	bne	test_fail
	cmp	%l1, 0x14
	bne	test_fail
	nop

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
	ta		T_GOOD_TRAP

test_fail:
	ta		T_BAD_TRAP

/*******************************************************
 * My handler externsions
 *******************************************************/

/*******************************************************
 * Data section 
 *******************************************************/
.data
done_addr:
	.xword	test_fail			!overwritten in WDR handler
done_addr_buf:
	.xword	test_fail			!overwritten in main


SECTION .MISS_DATA_AREA DATA_VA=0x3008000
attr_data {
        Name = .MISS_DATA_AREA
        RA=0x3008000,
        PA=ra2pa(0x3008000,0),
        part_0_d_ctx_zero_ps0_tsb,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }
.data
.global dtlb_miss_addr
dtlb_miss_addr:
	.word 0
