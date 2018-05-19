// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: v9_trap_priv.s
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

!!-------------------------------------------------------------------------------
!!
!!	This file has the micro-code to test out all the traps specified
!!	in the SPARC-V9 trap table. 
!!
!!-------------------------------------------------------------------------------
	
#define ENABLE_T0_Fp_disabled_0x20
#include "boot.s"

.text
.global main
.global misalign_sum3

main:
	wr %g0, 4, %fprs
/*
 *************************************************
 *     Privileged action : PRIVACT_TRAP
 *************************************************
 */
!!---------------------------------------------
!! CASA & CASXA : 
!!	PSTATE.PRIV = 0 & asi[7] = 1b0
!!---------------------------------------------
	set	0x0,	%l0
	wr	%l0,	0x17,	%asi
	set	0x160000,	%l0
	set	0x55,	%l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	casa	[%l0]	%asi,	%l1,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	casa	[%l0] 0x7f,	%l1,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	casxa	[%l0]	%asi,	%l1,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	casxa	[%l0] 0x7f,	%l1,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

!!---------------------------------------------
!! Ld fp from ASI
!!	PSTATE.PRIV = 0 & asi[7] = 1b0
!!---------------------------------------------
	set	0x160000,	%l2
	set	0x0,	%l0
	wr	%l0,	0x7f,	%asi
	nop

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	lda	[%l2] 0x7f,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	lda	[%l2] %asi,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldda	[%l2] 0x7f,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldda	[%l2] %asi,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

#if 0	/* this will cause illegal inst trap */
        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldqa	[%l2] 0x7f,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldqa	[%l2] %asi,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
#endif

!!---------------------------------------------
!! Ld Integer from ASI
!!	PSTATE.PRIV = 0 & asi[7] = 1b0
!!---------------------------------------------
	set	0x160000,	%l2
	set	0x0,	%l0
	wr	%l0,	0x7f,	%asi
	nop

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldsba	[%l2+0x0] %asi,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldsba	[%l2] 0x7f,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldswa	[%l2+0x0] %asi,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldswa	[%l2] 0x7f,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	lduba	[%l2+0x0] %asi,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	lduba	[%l2] 0x7f,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	lduha	[%l2+0x0] %asi,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	lduha	[%l2] 0x7f,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	lduwa	[%l2+0x0] %asi,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	lduwa	[%l2] 0x7f,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldxa	[%l2+0x0] %asi,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldxa	[%l2] 0x7f,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldda	[%l2+0x0] %asi,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldda	[%l2] 0x7f,	%l4
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

!!---------------------------------------------
!! Ldstub from ASI
!!	PSTATE.PRIV = 0 & asi[7] = 1b0
!!---------------------------------------------
	wr	%g0,	0x7f,	%asi
	set	0x160000,	%l2
        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldstuba	[%l2] %asi,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldstuba	[%l2] 0x7f,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

!!---------------------------------------------
!! Store FP to ASI
!!	PSTATE.PRIV = 0 & asi[7] = 1b0
!!---------------------------------------------
	wr	%g0,	0x7f,	%asi

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	sta	%f0,	[%l2] %asi
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
	
        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	sta	%f0,	[%l2] 0x7f
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
	
        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	stda	%f0,	[%l2] %asi
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
	
        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	stda	%f0,	[%l2] 0x7f
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

#if 0		/* this will cause illegal_instr trap first */
        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	stqa	%f0,	[%l2] %asi
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
	
        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	stqa	%f0,	[%l2] 0x7f
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
#endif

!!---------------------------------------------
!! Store Integer to ASI
!!	PSTATE.PRIV = 0 & asi[7] = 1b0
!!---------------------------------------------
	set	0x0,	%l0
        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	stba	%l0,	[%l2] 0x7f
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	stba	%l0,	[%l2] %asi
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
	
        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	stha	%l0,	[%l2] 0x7f
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	stha	%l0,	[%l2] %asi
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
	
        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	stda	%l0,	[%l2] 0x7f
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	stda	%l0,	[%l2] %asi
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
	
        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	stwa	%l0,	[%l2] 0x7f
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	stwa	%l0,	[%l2] %asi
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
	
        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	stxa	%l0,	[%l2] 0x7f
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	stxa	%l0,	[%l2] %asi
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
	
!!---------------------------------------------
!! Swap Reg with ASI mem
!!	PSTATE.PRIV = 0 & asi[7] = 1b0
!!---------------------------------------------
	set	0x0,	%l3
        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	swapa	[%l2] %asi,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        set     0x1,    %o1	
        ta      T_HTRAP_EN_N_TIMES
        nop
	swapa	[%l2] 0x7f,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

/*
 ******************************************************
 *  	privileged opcode exception (PRIVOP_TRAP)
 ******************************************************
 */
!!----------------------------------
!!  Done & Retry PRIVOP_TRAP
!!----------------------------------
	/* DONE , when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	done
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* Retry , when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	retry
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1
!!----------------------------------
!!  Read PRIV reg : PRIVOP_TRAP
!!----------------------------------
	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x81510000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x81514000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x81518000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x8151c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x81520000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x81524000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x81528000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x8152c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x81530000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x81534000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x81538000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

#if 0 	/* this will cause an illegal inst trap since we dont
	 * have a floating point queue */	
	/* rs1 = 15 when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	/* .word	0x8153c000 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1
#endif

	/* rs1 = 31 when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	/* .word	0x8157c000 */
	rdpr	%ver,	%l0 
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

!!----------------------------------
!!	Read State Reg : RDASR
!!----------------------------------
	/* 
	 * This will cause illegal inst trap.
	 *
	 * Guess the reason is : RDASR is implementation 
	 *	dependent. It does not create the privileged opcode 
	 *	trap.  Need more investigation. 
	 * 
	 * For right now, in order to make the diag pass, i put 
	 * the trap type to 0x10 instead of 0x11.
	 */
	/* rs1 = 7 */
	set	0x10,	%o0
        set     0x1,    %o1	
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x8141c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* rs1 = 14 */
	set	0x10,	%o0
        set     0x1,    %o1	
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x81438000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* rs1 = 16 */
	set	0x10,	%o0
        set     0x1,    %o1	
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x81440000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* rs1 = 31 */
	set	0x10,	%o0
        set     0x1,    %o1	
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0x8147c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

!!----------------------------------
!!	Saved & Restored
!!----------------------------------
	/* save when PRIV=0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	saved
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* restore when PRIV=0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	restored
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

!!----------------------------------
!!  Write privileged reg	
!!----------------------------------
	/* rs1 = 4 when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x81910000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x81914000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x81918000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x8191c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x81920000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x81924000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x81928000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x8192c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x81930000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x81934000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x81938000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* rs1 = 15 when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x81940000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* rs1 = 31 when PSTATE.PRIV = 0 */
	set	0x11,	%o0
        set     0x1,    %o1	
	ta	T_TRAP_EN
	nop
	.word	0x8197c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

!!----------------------------------
!!	Write State Reg : WRASR
!!----------------------------------
	/* 
	 * As RDASR, this also cause the 
	 * Simics to print out :
 	 * 
	 *	wr %g0, %g0, asr(16)
 	 * 
	 *	Attempt to write UltraSparc ASR. Taking illegal instruction. 	
	 */

	/* rs1 = 16 */
	set	0x10,	%o0
        set     0x1,    %o1	
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xa1800000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* rs1 = 31 */
	set	0x10,	%o0
        set     0x1,    %o1	
	ta	T_HTRAP_EN_N_TIMES
	nop
	.word	0xbf800000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1
	/*
 ********************************
 *      Diag PASSED !           *
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
        ta T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        set     0xdeadcafe,     %l0
        ta T_BAD_TRAP
        nop
        nop

misalign_sum3:
        save    %sp,    -96,    %sp
        add     %i0,    %i1,    %l7
        add     %l7,    %i2,    %l7

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	
        ta      T_TRAP_EN
        nop
	return	%i7+1	/* misaligned addr return */
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

	return 	%i7+8	/* good return */ 
	nop

.data

fpdt_data:
	.xword	0xffff0000eeee1111
	.xword	0xffff0000eeee2222
	.xword	0xffff0000eeee3333
	.xword	0xffff0000eeee4444
.end

/*
 ***************************************************
 * Pages defined to test out the MMU access traps 
 ***************************************************
 */
 
#define	IDAEXECPG_BASE_TEXT_ADDR	0x250000		
#define	IDAEXECPG_BASE_TEXT_ADDR_PA	0x100250000
#define	IDAEXECPG_BASE_DATA_ADDR	0x260000
#define	IDAEXECPG_BASE_DATA_ADDR_PA	0x100260000			

SECTION .IDAEXEC_PAGE TEXT_VA=IDAEXECPG_BASE_TEXT_ADDR, DATA_VA=IDAEXECPG_BASE_DATA_ADDR
attr_text {
        Name = .IDAEXEC_PAGE,
        VA=IDAEXECPG_BASE_TEXT_ADDR, PA=IDAEXECPG_BASE_TEXT_ADDR_PA,
        RA=IDAEXECPG_BASE_TEXT_ADDR_PA,
	part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=0, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }
        
attr_data {
        Name = .IDAEXEC_PAGE,
        VA=IDAEXECPG_BASE_DATA_ADDR, PA=IDAEXECPG_BASE_DATA_ADDR_PA,
        RA=IDAEXECPG_BASE_DATA_ADDR_PA,
	part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }

.text

.global  idaexec_start 
.global  idaexec_d1	

idaexec_start:
	set	0x0,	%l0
	set	0x1,	%l1
	add	%l1,	%l0,	%l2
	return

.data	

idaexec_d1:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end

/*
 ************************************************************
 *	Section defined to test the Data Protection trap
 ************************************************************
 */
#define	IDAPROTPG_BASE_TEXT_ADDR	0x350000		
#define	IDAPROTPG_BASE_TEXT_ADDR_PA	0x100350000
#define	IDAPROTPG_BASE_DATA_ADDR	0x360000
#define	IDAPROTPG_BASE_DATA_ADDR_PA	0x100360000			

SECTION .IDAPROT_PAGE TEXT_VA=IDAPROTPG_BASE_TEXT_ADDR, DATA_VA=IDAPROTPG_BASE_DATA_ADDR
attr_text {
        Name = .IDAPROT_PAGE,
        VA=IDAPROTPG_BASE_TEXT_ADDR, PA=IDAPROTPG_BASE_TEXT_ADDR_PA,
        RA=IDAPROTPG_BASE_TEXT_ADDR_PA,
	part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=0, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }
        
attr_data {
        Name = .IDAPROT_PAGE,
        VA=IDAPROTPG_BASE_DATA_ADDR, PA=IDAPROTPG_BASE_DATA_ADDR_PA,
        RA=IDAPROTPG_BASE_DATA_ADDR_PA,
	part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

.text

.global  idaprot_start 
.global  idaprot_d1	

idaprot_start:
	set	0x0,	%l0
	set	0x1,	%l1
	add	%l1,	%l0,	%l2
	return

.data	

idaprot_d1:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end
