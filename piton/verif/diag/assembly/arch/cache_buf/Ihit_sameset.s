// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Ihit_sameset.s
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
  File:		Ihit_sameset.s

  Description:
  -----------
  One thread issues multiple instructions to the same set 
  in the Icache. Access instructions with 4 different tags
  but with the same index to cause Icache tag hits.
  Correct updating of the Icache tags is verified by the
  monitor l_cache_mon.v.

  $Change$
 *************************************************************/
		
#ifdef MT_TEMPLATE
#include "mt_body.h"
#else
#include "boot.s"
.global main
#endif

.text
.global test

main:
		set		0x20,			%i7
		set		tags,			%i0
		set		offsets,		%i1
		ba tags
		nop

test:
		addcc	%i7,	0,		%i7
		bne		diag_fail
		nop


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


.data

offsets:
		.word	0x0000  ! 0KB
		.word	0x0800  ! 2KB
		.word	0x1000  ! 4KB
		.word	0x1800  ! 6KB
		.word	0x1800
		.word	0x1000
		.word	0x0800
		.word	0x1800
		.word	0x0800
		.word	0x1800
		.word	0x1000
		.word	0x0000
		.word	0x0800
		.word	0x0800
		.word	0x0800
		.word	0x1800
		.word	0x0800
		.word	0x1800
		.word	0x1800
		.word	0x1000
		.word	0x0000
		.word	0x1000
		.word	0x0000
		.word	0x0000
		.word	0x1800
		.word	0x0000
		.word	0x1800
		.word	0x0800
		.word	0x1000
		.word	0x1000
		.word	0x1000
		.word	0x1800

.end
		

define(TAGS_TEXT_ADDR,    `0x'dnl' 
mpeval(MAIN_BASE_TEXT_VA + 0x20000, 16)dnl
)
define(TAGS_TEXT_ADDR_RA, `0x'dnl' 
mpeval(MAIN_BASE_TEXT_RA + 0x20000, 16)dnl
)
define(TAGS_TEXT_ADDR_PA,          ra2pa(TAGS_TEXT_ADDR_RA, 0))
				
changequote([, ])dnl
SECTION .TAGS TEXT_VA= [0x]mpeval( TAGS_TEXT_ADDR, 16 )
attr_text {
	Name = .TAGS,
	VA= [0x]mpeval( TAGS_TEXT_ADDR, 16 ),
	PA= [0x]mpeval( TAGS_TEXT_ADDR_PA, 16 ),
	RA= [0x]mpeval( TAGS_TEXT_ADDR_RA, 16 ),
	part_0_i_ctx_nonzero_ps0_tsb,
#ifdef CSM_ENABLE
	part_0_i_ctx_nonzero_ps0_tsb_csm,
    TTE_HDID=0, TTE_HD_SIZE=mpeval(PTON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
	TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}
changequote(`,')dnl'

.text
.global tags
		
tags:
		subcc	%i7,	1,		%i7
		be		test
		add		%i1,	4,		%i1
		ld		[%i1],			%i2
		add		%i0,	%i2,	%i3
		jmp		%i3
		nop

.align 2048
		
		subcc	%i7,	1,		%i7
		be		test
		add		%i1,	4,		%i1
		ld		[%i1],			%i2
		add		%i0,	%i2,	%i3
		jmp		%i3
		nop

.align 2048
		
		subcc	%i7,	1,		%i7
		be		test
		add		%i1,	4,		%i1
		ld		[%i1],			%i2
		add		%i0,	%i2,	%i3
		jmp		%i3
		nop

.align 2048
		
		subcc	%i7,	1,		%i7
		be		test
		add		%i1,	4,		%i1
		ld		[%i1],			%i2
		add		%i0,	%i2,	%i3
		jmp		%i3
		nop

.end	
			
