// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: red_reset_handler.s
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
#ifndef CUSTOM_THREAD_START
	start_threads
#endif
	wrpr	0, %tl
	wrpr	cregs_pstate_imm, %pstate
	wr	%g0, cregs_fprs_imm, %fprs
	wr	%g0, cregs_ccr_imm, %ccr
	wr	%g0, cregs_asi_imm, %asi
	setx	cregs_tick_r64, %g1, %g2
	wrpr	%g2, %tick
	mov	%g0, %y
	wrpr	cregs_pil_imm, %pil
	wrpr	cregs_cwp_imm, %cwp
	wrpr	cregs_cansave_imm, %cansave
	wrpr	cregs_canrestore_imm, %canrestore
	wrpr	cregs_otherwin_imm, %otherwin
	wrpr	cregs_cleanwin_imm, %cleanwin
	wrpr	cregs_wstate_imm, %wstate
	
	! set trap base addr
	setx TRAP_BASE_ADDR, %l0, %l7
	wrpr %l7, %g0, %tba
	
	! set tsb base register
	setx immu_tsb_reg, %l0, %l1
	mov 0x28, %l2
	stxa %l1, [%l2] 0x50
	
	setx dmmu_tsb_reg, %l0, %l1
	stxa %l1, [%l2] 0x58

	! init tlb entry for the trap handlers
	! l5 tag		;  l6 data
	setx 0xa00000000000004e, %g1, %l6 ! W P E L
	setx TRAP_BASE_ADDR_PA, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	mov  0x30, %o2
	setx TRAP_BASE_ADDR, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x50
	stxa  %l6, [ %g0 ] 0x54

	! init dtsb entry for itsb
	setx 0xa00000000000004e, %g1, %l6 ! W P E L
	setx I_TSB_BASE_ADDR_PA, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	setx I_TSB_BASE_ADDR, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58
	stxa  %l6, [ %g0 ] 0x5c

	! init dtsb entry dtsb
	setx 0xa00000000000004e, %g1, %l6 ! W P E L
	setx D_TSB_BASE_ADDR_PA, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	setx D_TSB_BASE_ADDR, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58
	stxa  %l6, [ %g0 ] 0x5c

	! init dtsb entry for link area
	setx 0xa00000000000004e, %g1, %l6 ! W P E L
	setx LINK_AREA_BASE_ADDR_PA, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	mov  0x0, %o0	/* please don't delete this , used in customized IMMU miss trap */
	setx LINK_AREA_BASE_ADDR, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58
	stxa  %l6, [ %g0 ] 0x5c

	! enable L2-cache
	mov	0xa9, %g1
	sllx	%g1, 32, %g1
	stx	%g0, [%g1 + 0x000]
	stx	%g0, [%g1 + 0x080]
	stx	%g0, [%g1 + 0x100]
	stx	%g0, [%g1 + 0x180]
					
	mov 8, %l1
	stxa %g0, [%l1] 0x58
	mov 16, %l1
	stxa %g0, [%l1] 0x58	

	! set lsu control reg. enable dcache, icache, immu, dmmu
	setx	cregs_lsu_ctl_reg_r64, %g1, %l1

	! set pstate	
        setx	Priv_Reset_Handler, %g1, %g2
        jmp	%g2
	stxa	%l1, [%g0] ASI_LSU_CTL_REG
        nop
        nop





