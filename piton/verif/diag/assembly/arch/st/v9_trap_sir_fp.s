// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: v9_trap_sir_fp.s
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

/*
 *****************************************
 *  SIR trap
 *****************************************
 */

#ifdef SAMTRAP_SIR 
	SIR	0x55	/* as a NOP */

	/* changed to privilege mode */
	ta	T_CHANGE_PRIV
	nop

	SIR	0x55		/* not implemented in SIMICS */
	nop
#endif

	set	0x0,	%l0
	setx	fpdt_data,  %l0,	%l1	
	ldx	[%l1],	%l0
	nop

	ldd	[%l1], %f2
	nop

!!------------------------------------------
!!	Floating point disabled trap 
!!------------------------------------------
	/* changed to privilege mode */
	ta	T_CHANGE_PRIV
	nop

	/* disable FP unit */
	wr	%g0,	0x0,	%fprs
	ta	T_CHANGE_NONPRIV
	nop

fpdt_0:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        /* Floating Point move */
	fmovs	%f2,	%f4

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_1:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        /* fmovd */
	fmovd	%f2,	%f4

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_2:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        /* Floating Point move */
	fmovq	%f4,	%f8

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_3:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        /* fnegs */
	fnegs	%f4,	%f8

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_4:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        /* Floating Point move */
	fnegd	%f4,	%f8

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_5:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        /* fnegq */
	fnegq	%f4,	%f8

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_6:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        /* Floating Point move */
	fabsd	%f4,	%f8

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_7:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        /* fabss */
	fabss	%f4,	%f8

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_8:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        /* Floating Point move */
	fabsq	%f4,	%f8

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_9:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        /* floating point mul/div */
	fmuls	%f4,	%f8,	%f12

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_10:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        /* floating point mul/div */
	fmuld	%f4,	%f8,	%f12

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_11:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        /* floating point mul/div */
	fmulq	%f4,	%f8,	%f12

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_12:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        /* floating point mul/div */
	fdivs	%f4,	%f8,	%f12

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_13:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        /* floating point mul/div */
	fdivd	%f4,	%f8,	%f12

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_14:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        /* floating point mul/div */
	fdivq	%f4,	%f8,	%f12

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_15:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        /* floating point fsqrt */
	fsmuld	%f4,	%f8,	%f12

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_16:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        /* floating point fsqrt */
	fdmulq	%f4,	%f8,	%f12

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_17:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        /* floating point fsqrt */
	fsqrts	%f4,	%f8

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_18:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        /* floating point sqrt */
	fsqrtd	%f4,	%f8

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_19:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        /* floating point sqrt */
	fsqrtq	%f4,	%f8

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

	/*
	 *	loading fp from ASI 
	 */
#if FPLD_FIXED 
fpdt_20:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

	set	0x0,	%l0
	setx	fpdt_data,  %l0,	%l1	
	add	%l1,	0x10,	%l1
        /* floating point ld */
	lda	[%l1] 0x80,	%f4

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_21:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

	set	0x0,	%l0
	setx	fpdt_data,  %l0,	%l1	
	add	%l1,	0x10,	%l1
	wr	%g0,	0x80,	%asi
        /* floating point ld */
	lda	[%l1] %asi,	%f4

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_22:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

	set	0x0,	%l0
	setx	fpdt_data,  %l0,	%l1	
	add	%l1,	0x10,	%l1
        /* floating point ld */
	ldda	[%l1] 0x80,	%f4

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_23:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

	set	0x0,	%l0
	setx	fpdt_data,  %l0,	%l1	
	add	%l1,	0x10,	%l1
	wr	%g0,	0x80,	%asi
        /* floating point ld */
	ldda	[%l1] %asi,	%f4

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_24:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

	set	0x0,	%l0
	setx	fpdt_data,  %l0,	%l1	
	add	%l1,	0x10,	%l1
        /* floating point ld */
	ldqa	[%l1] 0x80,	%f4

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_25:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

	set	0x0,	%l0
	setx	fpdt_data,  %l0,	%l1	
	add	%l1,	0x10,	%l1
	wr	%g0,	0x80,	%asi
        /* floating point ld */
	ldqa	[%l1] %asi,	%f4

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1
#endif
	/*
	 * fp move on Integer register value 
	 */
fpdt_26:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop
	
	set	0x0,	%l0
        /* floating point MOV on Integer register */
	fmovrse	%l0,	%f4,	%f8	

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_27:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop
	
	set	0x0,	%l0
        /* floating point MOV on Integer register */
	fmovrslez %l0,	%f4,	%f8	

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_28:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop
	
	set	0x0,	%l0
        /* floating point MOV on Integer register */
	fmovrslz %l0,	%f4,	%f8	

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_29:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop
	
	set	0x0,	%l0
        /* floating point MOV on Integer register */
	fmovrsne %l0,	%f4,	%f8	

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_30:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop
	
	set	0x0,	%l0
        /* floating point MOV on Integer register */
	fmovrsgz %l0,	%f4,	%f8	

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_31:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop
	
	set	0x0,	%l0
        /* floating point MOV on Integer register */
	fmovrsgez %l0,	%f4,	%f8	

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

	
	/*
	 * FP condition code %fccn move 
	 */
fpdt_32:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop
	
	set	0x0,	%l0
        /* mov on %fccn */
	mova 	%fcc0,	0x55,	%l0

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_33:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop
	
	set	0x0,	%l0
        /* MOV on %fccn */
	movn 	%fcc1,	0x55,	%l0

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_34:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop
	
	set	0x0,	%l0
        /* mov on %fccn */
	movu 	%fcc2,	0x55,	%l0

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_35:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop
	
	set	0x0,	%l0
        /* MOV on %fccn */
	movug 	%fcc3,	0x55,	%l0

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_36:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop
	
	set	0x0,	%l0
        /* mov on %fcc0 */
	movl 	%fcc0,	0x55,	%l0

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_37:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop
	
	set	0x0,	%l0
        /* MOV on %fcc0 */
	movul 	%fcc0,	0x55,	%l0

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_38:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop
	
	set	0x0,	%l0
        /* mov on %fcc0 */
	movlg 	%fcc0,	0x55,	%l0

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_39:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop
	
	set	0x0,	%l0
        /* MOV on %fcc0 */
	movne 	%fcc0,	0x55,	%l0

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_40:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop
	
	set	0x0,	%l0
        /* mov on %fcc0 */
	move 	%fcc0,	0x55,	%l0

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_41:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop
	
	set	0x0,	%l0
        /* MOV on %fcc0 */
	movue 	%fcc0,	0x55,	%l0

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_42:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop
	
	set	0x0,	%l0
        /* mov on %fcc0 */
	movge 	%fcc0,	0x55,	%l0

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_43:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop
	
	set	0x0,	%l0
        /* MOV on %fcc0 */
	movuge 	%fcc0,	0x55,	%l0

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_44:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop
	
	set	0x0,	%l0
        /* MOV on %fcc0 */
	movle 	%fcc0,	0x55,	%l0

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_45:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop
	
	set	0x0,	%l0
        /* MOV on %fcc0 */
	movule 	%fcc0,	0x55,	%l0

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

#if FPLD_FIXED 
fpdt_46:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop
	
	set	0x0,	%l0
        /* MOV on %fcc0 */
	movo 	%fcc0,	0x55,	%l0

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1
#endif

	/* 
	 * Floating point store to MEM 
	 */
fpdt_47:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        set     0x0,    %l0
	setx	fpdt_data, %l0, %l1
	add	%l1,	0x10,	%l1
       	/* store fp to ASI space */ 
	sta	%f4,	[%l1] 0x80
	nop

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_48:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        set     0x0,    %l0
	setx	fpdt_data, %l0, %l1
	add	%l1,	0x10,	%l1
	wr	%g0,	0x80,	%asi
       	/* store fp to ASI space */ 
	sta	%f4,	[%l1] %asi
	nop

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_49:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        set     0x0,    %l0
	setx	fpdt_data, %l0, %l1
	add	%l1,	0x10,	%l1
       	/* store fp to ASI space */ 
	stda	%f4,	[%l1] 0x80
	nop

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_50:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        set     0x0,    %l0
	setx	fpdt_data, %l0, %l1
	add	%l1,	0x10,	%l1
	wr	%g0,	0x80,	%asi
       	/* store fp to ASI space */ 
	stda	%f4,	[%l1] %asi
	nop

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

#if FPLD_FIXED 
fpdt_51:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        set     0x0,    %l0
	setx	fpdt_data, %l0, %l1
	add	%l1,	0x10,	%l1
       	/* store fp to ASI space */ 
	stqa	%f4,	[%l1] 0x80
	nop

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1

fpdt_52:
        /* Floating Point disabled trap */
        set     0x20,   %o0
        ta      T_TRAP_EN
        nop

        set     0x0,    %l0
	setx	fpdt_data, %l0, %l1
	add	%l1,	0x10,	%l1
	wr	%g0,	0x80,	%asi
       	/* store fp to ASI space */ 
	stqa	%f4,	[%l1] %asi
	nop

        /* check  %o0 should = 0x0 */
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0001,     %l1
#endif

	/* changed to privilege mode */
	ta	T_CHANGE_PRIV
	nop

	/* enable FP unit again */
	wr	%g0,	0x4,	%fprs
	ta	T_CHANGE_NONPRIV
	nop
/*

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
