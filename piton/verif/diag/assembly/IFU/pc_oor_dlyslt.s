// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pc_oor_dlyslt.s
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
#define MAIN_PAGE_HV_ALSO
#include "enable_traps.h"

#define H_HT0_Instruction_access_exception_0x08
#define My_HT0_Instruction_access_exception_0x08 \
        setx fail_diag, %r1, %r2; \
        jmp %r2 ; \
        nop ; 

#define H_T0_Instruction_access_exception_0x08
#define My_T0_Instruction_access_exception_0x08 \
        setx fail_diag, %r1, %r2; \
        jmp %r2 ; \
        nop ; 

#include "boot.s"

!SIMS: -non_shared
!SIMS: +spis

.text
.global main

main:

	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffff; target strm = 0x1
	cmp	%o1, 0
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x2
	cmp	%o1, 1
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4
	cmp	%o1, 2
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8
	cmp	%o1, 3
	setx	fork_lbl_0_4, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	setx	pc_oor, %g1, %g2
	jmp	%g2
	nop	
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	
fork_lbl_0_3:
	setx	pc_oor, %g1, %g2
	jmp	%g2
	nop		
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop

fork_lbl_0_2:
	setx	pc_oor, %g1, %g2
	jmp	%g2
	nop		
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
		
fork_lbl_0_1:
	setx	pc_oor, %g1, %g2
	jmp	%g2
	nop			
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop

.global fail_diag
fail_diag:
	ta    T_BAD_TRAP

.global join_lbl_0_0
join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 16, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 24, 16, 16)) -> intp(3, 1, 1)
	nop
	nop
	nop
	nop
	ta    T_GOOD_TRAP

SECTION .ISEG_0 TEXT_VA = 0x00007fffffffe000
attr_text {
        Name     = .ISEG_0,
	RA	 = 0x0000000090000000,
	PA	 = ra2pa(0x0000000090000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.skip 0x1fc8
end_diag:
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
.global pc_oor
pc_oor:
	mov 0x3, %r31
br_loop:
        dec %r31
	cmp %r31, 0x0
	be end_diag
	nop
	ba,a br_loop
	add %r0, 0x1, %r1
	sub %r1, 0x1, %r1	
