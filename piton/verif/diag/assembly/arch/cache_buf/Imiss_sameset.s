// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Imiss_sameset.s
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
  File:		Imiss_sameset.s

  Description:
  -----------
  One thread issues multiple misses to the same set 
  in the Icache. Access instructions with 12 different tags
  but with the same index to cause Icache tag misses and
  replacements. Correct updating of the Icache tags is
  verified by the monitor l_cache_mon.v.

  $Change$
 *************************************************************/
		
#include "boot.s"

.text
.global main
.global page1

main:
		set		0x10,		%i7

page1:	
		set		0x0,	%i0
		set		0x1,	%i1
		ba page1a
		nop

.align 2048
		
page1a:	
		add		%i0,	1,		%o0
		add		%i1,	1,		%o1
		ba page1b
		nop

.align 2048
		
page1b:
		sll		%o0,	2,		%o0
		sll		%o1,	2,		%o1
		ba page1c
		nop

.align 2048
				
page1c:	
		sub		%o0,	1,		%o0
		sub		%o1,	1,		%o1
		ba page2
		nop


define(PAGE2_TEXT_ADDR, `0x'dnl' 
mpeval(MAIN_BASE_TEXT_VA + 0x20000, 16)dnl
)
define(PAGE2_TEXT_ADDR_RA, `0x'dnl'
mpeval(MAIN_BASE_TEXT_RA + 0x20000, 16)dnl
)
define(PAGE2_TEXT_ADDR_PA, ra2pa(PAGE2_TEXT_ADDR_RA, 0))

changequote([, ])dnl
SECTION .PAGE2 TEXT_VA= [0x]mpeval(PAGE2_TEXT_ADDR, 16)
attr_text {
	Name = .PAGE2,
	VA= [0x]mpeval(PAGE2_TEXT_ADDR, 16),
	PA= [0x]mpeval(PAGE2_TEXT_ADDR_PA, 16),
	RA= [0x]mpeval(PAGE2_TEXT_ADDR_RA, 16),
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}
changequote(`,')dnl'

.text
.global page2

page2:	
		set		0x2,	%i2
		set		0x3,	%i3
		ba page2a
		nop

.align 2048
		
page2a:	
		add		%i2,	1,		%o2
		add		%i3,	1,		%o3
		ba page2b
		nop

.align 2048
		
page2b:
		sll		%o2,	2,		%o2
		sll		%o3,	2,		%o3
		ba page2c
		nop

.align 2048
				
page2c:	
		sub		%o2,	1,		%o2
		sub		%o3,	1,		%o3
		ba page3
		nop


define(PAGE3_TEXT_ADDR, `0x'dnl'
mpeval(MAIN_BASE_TEXT_VA + 0x30000, 16)dnl
)
define(PAGE3_TEXT_ADDR_RA, `0x'dnl'
mpeval(MAIN_BASE_TEXT_RA + 0x30000, 16)dnl
)
define(PAGE3_TEXT_ADDR_PA, ra2pa(PAGE3_TEXT_ADDR_RA, 0))
				
changequote([, ])dnl
SECTION .PAGE3 TEXT_VA= [0x]mpeval(PAGE3_TEXT_ADDR, 16)
attr_text {
	Name = .PAGE3,
	VA= [0x]mpeval(PAGE3_TEXT_ADDR, 16),
	PA= [0x]mpeval(PAGE3_TEXT_ADDR_PA, 16),
	RA= [0x]mpeval(PAGE3_TEXT_ADDR_RA, 16),
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}
changequote(`,')dnl'

.text
.global page3
.global page3a
.global page3b
.global page3c

page3:	
		set		0x2,	%i2
		set		0x3,	%i3
		ba page3a
		nop

.align 2048
		
page3a:	
		add		%i2,	1,		%o2
		add		%i3,	1,		%o3
		ba page3b
		nop

.align 2048
		
page3b:
		sll		%o2,	2,		%o2
		sll		%o3,	2,		%o3
		ba page3c
		nop

.align 2048
				
page3c:	
		sub		%o2,	1,		%o2
		sub		%o3,	1,		%o3


loop:	
		subcc	%i7,	1,		%i7
		bne		%icc,	page1
		nop


test:
		addcc	%i7,	0,		%i7
		bne		%icc,	diag_fail
				
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

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
