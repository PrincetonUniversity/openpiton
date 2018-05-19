// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mt_Ihit_sameset.s
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
  File:		mt_Ihit_sameset.s

  Description:
  -----------
  First, 4 threads each issue ihits, each to cache lines in
  its own iset. Second, 4 threads issue hits, all to cache
  lines in the same set.

  $Change: 17073 $
 *************************************************************/
		
#define THREAD_COUNT    4
#include "boot.s"

.text
.global main
.global run_th_0
.global run_th_1
.global run_th_2
.global run_th_3
.global test0
.global test1
.global test2
.global test3
.global common_test

main:

thread_jump:
	th_fork(run_th)
        ba diag_fail
	nop

run_th_0:
		set		0x10,			%i0
		set		th0_tags,		%o0
		set		offsets0,		%l0
		ba		th0_tags
		nop		
test0:
		addcc	%i0,	0,		%i0
		bne		diag_fail
		set		0x20,			%i0
		set		common,			%o0
		set		offsets0,		%l0
		ba		common
		nop
.align 32

run_th_1:
		set		0x10,			%i1
		set		th1_tags,		%o1
		set		offsets1,		%l1
		ba		th1_tags
		nop		
test1:
		addcc	%i1,	0,		%i1
		bne		diag_fail
		set		0x20,			%i0
		set		common,			%o0
		set		offsets0,		%l0
		ba		common
		nop
.align 32

run_th_2:
		set		0x10,			%i2
		set		th2_tags,		%o2
		set		offsets2,		%l2
		ba		th2_tags
		nop		
test2:
		addcc	%i2,	0,		%i2
		bne		diag_fail
		set		0x20,			%i0
		set		common,			%o0
		set		offsets0,		%l0
		ba		common
		nop
.align 32

run_th_3:
		set		0x10,			%i3
		set		th3_tags,		%o3
		set		offsets3,		%l3
		ba		th3_tags
		nop		
test3:
		addcc	%i3,	0,		%i3
		bne		diag_fail
		set		0x20,			%i0
		set		common,			%o0
		set		offsets0,		%l0
		ba		common
		nop
.align 32

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		
common_test:
		addcc	%i0,	0,		%i0
		bne		diag_fail
		nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
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

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		
.data

offsets0:
		.word	0x0000
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
		.word	0x1000
		.word	0x1800
		.word	0x1000
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
		.word	0x1800
		.word	0x1800
		.word	0x0800
		.word	0x1000

offsets1:
		.word	0x0000
		.word	0x0000
		.word	0x0800
		.word	0x1800
		.word	0x0000
		.word	0x0000
		.word	0x1800
		.word	0x0800
		.word	0x1000
		.word	0x0800
		.word	0x1800
		.word	0x0000
		.word	0x0000
		.word	0x0800
		.word	0x1800
		.word	0x1000
		.word	0x0800
		.word	0x0000
		.word	0x1000
		.word	0x1000
		.word	0x1800
		.word	0x1000
		.word	0x0800
		.word	0x0000
		.word	0x1800
		.word	0x1000
		.word	0x0800
		.word	0x1800
		.word	0x0800
		.word	0x1800
		.word	0x0000
		.word	0x1000
		.word	0x0000

offsets2:
		.word	0x0000
		.word	0x1800
		.word	0x0000
		.word	0x0000
		.word	0x1000
		.word	0x0800
		.word	0x1000
		.word	0x1000
		.word	0x1000
		.word	0x1800
		.word	0x1800
		.word	0x1000
		.word	0x1800
		.word	0x1800
		.word	0x1000
		.word	0x1000
		.word	0x1000
		.word	0x0800
		.word	0x1800
		.word	0x0000
		.word	0x0000
		.word	0x0800
		.word	0x0000
		.word	0x0000
		.word	0x0000
		.word	0x0800
		.word	0x1800
		.word	0x1000
		.word	0x1000
		.word	0x1800
		.word	0x1800
		.word	0x1000
		.word	0x1800

offsets3:
		.word	0x0000
		.word	0x0800
		.word	0x1800
		.word	0x1000
		.word	0x1800
		.word	0x1800
		.word	0x0000
		.word	0x0800
		.word	0x0000
		.word	0x1800
		.word	0x0000
		.word	0x1800
		.word	0x1000
		.word	0x0000
		.word	0x1000
		.word	0x1000
		.word	0x1800
		.word	0x0000
		.word	0x1800
		.word	0x1000
		.word	0x0000
		.word	0x0000
		.word	0x0800
		.word	0x0000
		.word	0x1800
		.word	0x0000
		.word	0x1000
		.word	0x1000
		.word	0x1000
		.word	0x0800
		.word	0x0800
		.word	0x1800
		.word	0x1000

barrier_w:      .word   0x00000000
                .word   0xaa5577ff
                .word   0x77aa55bb
                .word   0xaa55ff44
		
		
#define TAGS_TEXT_ADDR     0x020070000
#define TAGS_TEXT_ADDR_PA 0x1020070000
#define TAGS_TEXT_ADDR_RA  0x020070000
				
SECTION .TAGS TEXT_VA = TAGS_TEXT_ADDR
attr_text {
	Name = .TAGS,
	VA=TAGS_TEXT_ADDR,	PA=TAGS_TEXT_ADDR_PA, RA=TAGS_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global tags
.global th0_tags
.global th1_tags
.global th2_tags
.global th3_tags
		
tags:

! 0x170000
th0_tags:
		subcc	%i0,	1,		%i0
		be		test0
		add		%l0,	4,		%l0
		ld		[%l0],			%l4
		add		%o0,	%l4,	%l4
		jmp		%l4
		nop
.align 32

! 0x170020
th1_tags:
		subcc	%i1,	1,		%i1
		be		test1
		add		%l1,	4,		%l1
		ld		[%l1],			%l5
		add		%o1,	%l5,	%l5
		jmp		%l5
		nop
.align 32

! 0x170040
th2_tags:
		subcc	%i2,	1,		%i2
		be		test2
		add		%l2,	4,		%l2
		ld		[%l2],			%l6
		add		%o2,	%l6,	%l6
		jmp		%l6
		nop
.align 32

! 0x170060
th3_tags:
		subcc	%i3,	1,		%i3
		be		test3
		add		%l3,	4,		%l3
		ld		[%l3],			%l7
		add		%o3,	%l7,	%l7
		jmp		%l7
		nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.align 2048

! 0x170800
		subcc	%i0,	1,		%i0
		be		test0
		add		%l0,	4,		%l0
		ld		[%l0],			%l4
		add		%o0,	%l4,	%l4
		jmp		%l4
		nop
.align 32

! 0x170820
		subcc	%i1,	1,		%i1
		be		test1
		add		%l1,	4,		%l1
		ld		[%l1],			%l5
		add		%o1,	%l5,	%l5
		jmp		%l5
		nop
.align 32

! 0x170840
		subcc	%i2,	1,		%i2
		be		test2
		add		%l2,	4,		%l2
		ld		[%l2],			%l6
		add		%o2,	%l6,	%l6
		jmp		%l6
		nop
.align 32

! 0x170860
		subcc	%i3,	1,		%i3
		be		test3
		add		%l3,	4,		%l3
		ld		[%l3],			%l7
		add		%o3,	%l7,	%l7
		jmp		%l7
		nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.align 2048

! 0x171000
		subcc	%i0,	1,		%i0
		be		test0
		add		%l0,	4,		%l0
		ld		[%l0],			%l4
		add		%o0,	%l4,	%l4
		jmp		%l4
		nop
.align 32

! 0x171020
		subcc	%i1,	1,		%i1
		be		test1
		add		%l1,	4,		%l1
		ld		[%l1],			%l5
		add		%o1,	%l5,	%l5
		jmp		%l5
		nop
.align 32

! 0x171040
		subcc	%i2,	1,		%i2
		be		test2
		add		%l2,	4,		%l2
		ld		[%l2],			%l6
		add		%o2,	%l6,	%l6
		jmp		%l6
		nop
.align 32

! 0x171060
		subcc	%i3,	1,		%i3
		be		test3
		add		%l3,	4,		%l3
		ld		[%l3],			%l7
		add		%o3,	%l7,	%l7
		jmp		%l7
		nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.align 2048

! 0x171800
		subcc	%i0,	1,		%i0
		be		test0
		add		%l0,	4,		%l0
		ld		[%l0],			%l4
		add		%o0,	%l4,	%l4
		jmp		%l4
		nop
.align 32

! 0x171820
		subcc	%i1,	1,		%i1
		be		test1
		add		%l1,	4,		%l1
		ld		[%l1],			%l5
		add		%o1,	%l5,	%l5
		jmp		%l5
		nop
.align 32

! 0x171840
		subcc	%i2,	1,		%i2
		be		test2
		add		%l2,	4,		%l2
		ld		[%l2],			%l6
		add		%o2,	%l6,	%l6
		jmp		%l6
		nop
.align 32

! 0x171860
		subcc	%i3,	1,		%i3
		be		test3
		add		%l3,	4,		%l3
		ld		[%l3],			%l7
		add		%o3,	%l7,	%l7
		jmp		%l7
		nop


#define COMMON_TEXT_ADDR     0x020080000
#define COMMON_TEXT_ADDR_PA 0x1020080000
#define COMMON_TEXT_ADDR_RA  0x020080000
				
SECTION .COMMON TEXT_VA=COMMON_TEXT_ADDR
attr_text {
	Name = .COMMON,
	VA=COMMON_TEXT_ADDR,	PA=COMMON_TEXT_ADDR_PA, RA=COMMON_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global common

! 0x180000
common:
		subcc	%i0,	1,		%i0
		be		common_test
		add		%l0,	4,		%l0
		ld		[%l0],			%l4
		add		%o0,	%l4,	%l4
		jmp		%l4
		nop
.align 2048

! 0x180800
		subcc	%i0,	1,		%i0
		be		common_test
		add		%l0,	4,		%l0
		ld		[%l0],			%l4
		add		%o0,	%l4,	%l4
		jmp		%l4
		nop
.align 2048

! 0x181000
		subcc	%i0,	1,		%i0
		be		common_test
		add		%l0,	4,		%l0
		ld		[%l0],			%l4
		add		%o0,	%l4,	%l4
		jmp		%l4
		nop
.align 2048

! 0x181800
		subcc	%i0,	1,		%i0
		be		common_test
		add		%l0,	4,		%l0
		ld		[%l0],			%l4
		add		%o0,	%l4,	%l4
		jmp		%l4
		nop

.end	



