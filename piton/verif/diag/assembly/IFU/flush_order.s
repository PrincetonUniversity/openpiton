// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: flush_order.s
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
#define CIOP
#define THREAD_MASK 0x0000000f
#define NO_TRAPCHECK
#include "boot.s"
	
.text
.global main

main:
	ta %icc, T_RD_THID
	cmp %o1, 0x0
	be cache_starv_loop_start
	nop
	cmp %o1, 0x1
	be cache_starv_loop_start
	nop
	cmp %o1, 0x2
	be cache_starv_loop_start
	nop
	setx self_modifying_code, %r31, %r1
	jmp %r1
	nop
	
cache_starv_loop_start:
	setx 0x400, %r31, %r1
	ba cache_starv_loop
	nop
.align 0x20
.skip 0x1c
cache_starv_loop:
	ba br_1
	cmp %r1, 0x0
.skip 0x18
br_1:
	bne cache_starv_loop
	dec %r1
	ta T_GOOD_TRAP

SECTION .SELF_MOD  TEXT_VA=0x70000000, DATA_VA=0x80000000
	
attr_text {

        Name = .SELF_MOD,

        VA= 0x70000000,
        RA= 0x180000000,
        PA= ra2pa(0x180000000,0),
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
}

attr_data {

        Name = .SELF_MOD,

        VA= 0x80000000,
        RA= 0x190000000,
        PA= ra2pa(0x190000000,0),
	uninitialized,
	end_va=0x80002000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
}

.text
	
.global self_modifying_code
self_modifying_code:
	setx 0x80000000, %r31, %r1
	stuw %r0, [%r1] ! Just so the TLB entry is not missed later
	setx self_mod_loc0, %r31, %r2
	lduw [%r2], %r31 ! Just so the TLB entry is not missed later
	setx 0x880120ff, %r31, %r3
	mov %r0, %r4		
	setx 0x40, %r31, %r5
wait_loop_start:	
	ba wait_loop_end
	cmp %r5, 0x0
wait_loop_end:	
	bne wait_loop_start
	dec %r5
.align 0x100
	nop
	nop
	stuw %r0, [%r1]
	nop
	nop
	nop
	stuw %r3, [%r2]
	flush %r2
self_mod_loc0:	
	add %r4, 0x1, %r4
	add %r4, 0x1, %r4
	add %r4, 0x1, %r4
	cmp %r4, 0x3
	be fail
	nop
	ta T_GOOD_TRAP

fail:
	ta T_BAD_TRAP
	nop


