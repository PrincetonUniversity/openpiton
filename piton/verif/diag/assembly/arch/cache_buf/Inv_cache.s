// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Inv_cache.s
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
/*************************************************************
  File:		Inv_cache.s

  Description:
  -----------
  First, issue imiss to an address that is already in the Dcache
  to test I$/D$ exclusiveness. Second, issue dmiss to an address
  that is already in the Icache.

  $Change$
 *************************************************************/
		
#ifdef MT_TEMPLATE
#include "mt_body.h"
#else
#include "boot.s"
.global main
#endif

.text

main:
/*
		!! write DTLB entry manually
		ta		T_CHANGE_PRIV
		nop
		set		0x30,			%o2
		set		0x170044,		%g4
		setx	0x8000000100170003,		%l0,	%g5
		stxa	%g4,	[%o2] 0x58
		stxa	%g5,	[%g0] 0x5c
		ta		T_CHANGE_NONPRIV
		nop
*/

		setx test_page, %l1, %l0
		jmp %l0
		nop



.end

#ifndef TEST_PAGE_TEXT_ADDR	
# define TEST_PAGE_TEXT_ADDR        0x20018000
#endif
#ifndef TEST_PAGE_TEXT_ADDR_RA		
# define TEST_PAGE_TEXT_ADDR_RA  0x20018000
#endif

	
		
SECTION .TEST_PAGE Text_VA=TEST_PAGE_TEXT_ADDR
attr_text { 
        Name = .TEST_PAGE,
        VA= TEST_PAGE_TEXT_ADDR, PA=ra2pa(TEST_PAGE_TEXT_ADDR_RA,0),
        RA=TEST_PAGE_TEXT_ADDR_RA,
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_nonzero_ps0_tsb,
#ifdef CSM_ENABLE
        part_0_i_ctx_nonzero_ps0_tsb_csm,
        part_0_d_ctx_nonzero_ps0_tsb_csm,
        TTE_HDID=0, TTE_HD_SIZE=mpeval(PITON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.text
.global test_page

test_page:
		
cacheline0:
		set		cacheline1,		%i0
		ld		[%i0],			%i1  !! D$ miss to some address ...
		set		0xa0002001,		%i2  !! (opcode of:	add %g0, 1, %l0)
		subcc	%i1,	%i2,	%i3
		bne		diag_fail
		nop
		
.align 32

cacheline1:
		add		%g0,	1,		%l0  !! ... I$ miss to same address
		nop
		add		%l0,	1,		%l0
		nop
		add		%l0,	1,		%l0
		nop

.align 32

cacheline2:
		set		cacheline2,		%i0  !! I$ miss to some address ...
		ld		[%i0],			%i1  !! .. D$ miss to same address
		set		0x31080060,		%i2  !!	(opcode of:	set cacheline2)	
		subcc	%i1,	%i2,	%i3
		bne		diag_fail
		nop

		
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!! Diag PASSED
		
diag_pass:		
        set     0xaaddcafe,     %l0
        ta T_GOOD_TRAP
        nop

		
!! Diag FAILED
		
diag_fail:		
        set     0xdeadcafe,     %l0
        ta T_BAD_TRAP
        nop
        nop


.end

		
