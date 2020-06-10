// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Isets.s
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
  File:		Isets.s

  Description:
  -----------
  One thread issues multiple instructions branching among
  sets 0, 1, 2, 32, 48, 61, 62, 63 of the Icache.

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
		set		isets,			%i0
		set		offsets,		%i1
		ba isets
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
		.word	0x0000  ! set0  (0B)
		.word	0x0020  ! set1  (32B)
		.word	0x0040  ! set2  (64B)
		.word	0x0400  ! set32 (1024B)
		.word	0x0600  ! set48	(1536B)
		.word	0x07a0  ! set61 (1952B)
		.word	0x07c0  ! set62 (1984B)
		.word	0x07e0  ! set63 (2016B)
		.word	0x0600
		.word	0x0400
		.word	0x0020
		.word	0x07a0
		.word	0x0020
		.word	0x0600
		.word	0x0040
		.word	0x07c0
		.word	0x0020
		.word	0x07e0
		.word	0x0040
		.word	0x07a0
		.word	0x0040
		.word	0x07a0
		.word	0x07a0
		.word	0x0400
		.word	0x07c0
		.word	0x0040
		.word	0x07c0
		.word	0x0000
		.word	0x07a0
		.word	0x0000
		.word	0x0600
		.word	0x07e0
		.word	0x0400
		.word	0x0040
		.word	0x0400
		.word	0x07a0
		.word	0x07a0
		.word	0x0600
		.word	0x0020
		.word	0x0040

.end
		

define(ISETS_TEXT_ADDR,   `0x'dnl' 
mpeval(MAIN_BASE_TEXT_VA + 0x20000, 16)dnl
)
define(ISETS_TEXT_ADDR_RA, `0x'dnl'
mpeval(MAIN_BASE_TEXT_RA + 0x20000, 16)dnl
)
define(ISETS_TEXT_ADDR_PA, ra2pa(ISETS_TEXT_ADDR_RA,0))
				
changequote([, ])dnl
SECTION .ISETS TEXT_VA= [0x]mpeval(ISETS_TEXT_ADDR,16)
attr_text {
	Name = .ISETS,
	VA= [0x]mpeval(ISETS_TEXT_ADDR, 16),
	PA= [0x]mpeval(ISETS_TEXT_ADDR_PA, 16),
	RA= [0x]mpeval(ISETS_TEXT_ADDR_RA, 16),
	part_0_i_ctx_nonzero_ps0_tsb,

#ifdef CSM_ENABLE
	part_0_i_ctx_nonzero_ps0_tsb_csm,
    TTE_HDID=0, TTE_HD_SIZE=mpeval(PITON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif

	TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}
changequote(`,')dnl'

.text
.global isets

isets:	
		
set0:
		subcc	%i7,	1,		%i7
		be		test
		add		%i1,	4,		%i1
		ld		[%i1],			%i2
		add		%i0,	%i2,	%i3
		jmp		%i3
		nop

.align 32

set1:			
		subcc	%i7,	1,		%i7
		be		test
		add		%i1,	4,		%i1
		ld		[%i1],			%i2
		add		%i0,	%i2,	%i3
		jmp		%i3
		nop

.align 32

set2:		
		subcc	%i7,	1,		%i7
		be		test
		add		%i1,	4,		%i1
		ld		[%i1],			%i2
		add		%i0,	%i2,	%i3
		jmp		%i3
		nop

.align 1024

set32:
		subcc	%i7,	1,		%i7
		be		test
		add		%i1,	4,		%i1
		ld		[%i1],			%i2
		add		%i0,	%i2,	%i3
		jmp		%i3
		nop
		
.align 512

set48:
		subcc	%i7,	1,		%i7
		be		test
		add		%i1,	4,		%i1
		ld		[%i1],			%i2
		add		%i0,	%i2,	%i3
		jmp		%i3
		nop
		
.align 256

set56:	ba		test
		nop
		
.align 128

set60:	ba		test
		nop
		
.align 32

set61:
		subcc	%i7,	1,		%i7
		be		test
		add		%i1,	4,		%i1
		ld		[%i1],			%i2
		add		%i0,	%i2,	%i3
		jmp		%i3
		nop

.align 32

set62:
		subcc	%i7,	1,		%i7
		be		test
		add		%i1,	4,		%i1
		ld		[%i1],			%i2
		add		%i0,	%i2,	%i3
		jmp		%i3
		nop

.align 32

set63:
		subcc	%i7,	1,		%i7
		be		test
		add		%i1,	4,		%i1
		ld		[%i1],			%i2
		add		%i0,	%i2,	%i3
		jmp		%i3
		nop

.end	
			
