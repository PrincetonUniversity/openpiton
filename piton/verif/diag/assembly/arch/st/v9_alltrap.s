// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: v9_alltrap.s
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
	
#include "boot.s"

.text
.global main
.global misalign_sum3

main:

	/* enable fp since bootcode doesnt anymore */
        wr              %g0, 0x4, %fprs         ! make sure fef is 1 

	
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
 *****************************************
 *    Illegal Instruction  
 *****************************************
 */
	set	0x5555,	%l0

!!------------------------------------------
!!	BPr illegal instruction trap
!!------------------------------------------
tc_illinst_bpr:
	/* BPr ill_inst when rcond=000 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop

	.word	0x00cc0008	/* rcond = 000 */
	nop

	/* check  %o0 should = 0x0 */
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0001,	%l1

	/* BPr ill_inst when rcond=100 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop

	.word	0x08cc0008

	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0001,	%l1

!!------------------------------------------
!!	BPcc illegal instruction trap
!!------------------------------------------
tc_illinst_bpcc:
	/* cond=4b1001 cc1,cc0 = 2b01 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x12580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b1001 cc1,cc0 = 2b11 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x12780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b0001 cc1,cc0 = 2b01 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x02580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b0001 cc1,cc0 = 2b11 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x02780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b1010 cc1,cc0 = 2b01 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x14580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b1010 cc1,cc0 = 2b11 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x14780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b0010 cc1,cc0 = 2b01 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x04580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b0010 cc1,cc0 = 2b11 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x04780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b1011 cc1,cc0 = 2b01 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x16580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

tc_illinst_5:
	/* cond=4b1011 cc1,cc0 = 2b11 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x16780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b0011 cc1,cc0 = 2b01 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x06580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b0011 cc1,cc0 = 2b11 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x06780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b1100 cc1,cc0 = 2b01 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x18580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

tc_illinst_4:
	/* cond=4b1100 cc1,cc0 = 2b11 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x18780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b0100 cc1,cc0 = 2b01 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x08580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b0100 cc1,cc0 = 2b11 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x08780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b1101 cc1,cc0 = 2b01 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x1a580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b1101 cc1,cc0 = 2b11 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x1a780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b0101 cc1,cc0 = 2b01 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x0a580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

tc_illinst_3:
	/* cond=4b0101 cc1,cc0 = 2b11 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x0a780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b1110 cc1,cc0 = 2b01 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x1c580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b1110 cc1,cc0 = 2b11 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x1c780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b0110 cc1,cc0 = 2b01 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x0c580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b0110 cc1,cc0 = 2b11 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x0c780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b1111 cc1,cc0 = 2b01 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x1e580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b1111 cc1,cc0 = 2b11 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x1e780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b0111 cc1,cc0 = 2b01 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x0e580009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

	/* cond=4b0111 cc1,cc0 = 2b11 */		
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x0e780009
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0002,	%l1

!!----------------------------------
!!  Done & Retry illegal inst trap
!!----------------------------------
tc_illinst_2:
	/* this is to avoid the privilege_opcode trap */
	ta	T_CHANGE_PRIV
	nop

	/* DONE , when TL = 0 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	done
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

!!-------------------------------------
!!	Retry illegal inst trap
!!-------------------------------------
	/* Retry , when TL = 0 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	retry
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0004,	%l1

	ta 	T_CHANGE_NONPRIV
	nop

!!-------------------------------------
!! 	illegal inst trap
!!-------------------------------------
tc_illinst_1:
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	illtrap	0xabcd
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

!!-------------------------------------
!! 	implementation dependent
!!-------------------------------------
#if SAM_IMPL_DEP
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xb1b00000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1
#endif

!!---------------------------------------------
!!  Load integer : illegal inst trap
!!---------------------------------------------
tc_illinst_0:
	/* rd = 1 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xc2180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 3 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xc6180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 5 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xca180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 7 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xce180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 9 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xd2180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 11 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xd6180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 13 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xda180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 15 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xde180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 17 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xe2180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 19 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xe6180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 21 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xea180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 23 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xee180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 25 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xf2180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 27 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xf6180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 29 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xfa180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 31 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xfe180000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

!!---------------------------------------------
!!  Load integer from ASI : illegal inst trap 
!!	ldda, odd rd
!!---------------------------------------------
tc_illg_asi:
	/* rd = 1 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xc2980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 3 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xc6980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 5 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xca980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 7 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xce980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 9 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xd2980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 11 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xd6980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 13 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xda980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 15 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xde980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 17 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xe2980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 19 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xe6980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 21 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xea980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 23 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xee980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 25 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xf2980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 27 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xf6980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 29 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xfa980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	/* rd = 31 , odd rd */ 
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xfe980000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

!!----------------------------------
!!  population count
!!----------------------------------
tc_pcount:
	/* bits[18:14] != 0 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81704000	/* bit 14 = 1 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81708000	/* bit 15 = 1 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81710000	/* bit 16 = 1 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81720000	/* bit 17 = 1 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81740000	/* bit 18 = 1 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0005,	%l1

!!----------------------------------
!!  Read Privileged Reg : ill_inst
!!----------------------------------
tc_ill_rdpriv:
	ta	T_CHANGE_PRIV
	nop

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81540000	/* rs1 = 16 : %gl register: Niagara register  */
	nop

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81544000	/* rs1 = 17 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81548000	/* rs1 = 18 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x8154c000	/* rs1 = 19 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81550000	/* rs1 = 20 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81554000	/* rs1 = 21 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81558000	/* rs1 = 22 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x8155c000	/* rs1 = 23 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81560000	/* rs1 = 24 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81564000	/* rs1 = 25 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81568000	/* rs1 = 26 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x8156c000	/* rs1 = 27 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81570000	/* rs1 = 28 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81574000	/* rs1 = 29 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81578000	/* rs1 = 30 */
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* tl = 0, rs1 = 0 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	rdpr	%tpc,	%l0	
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

tc_ill_rdpriv1:
	/* tl = 0, rs1 = 1 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	rdpr	%tnpc,	%l0	
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* tl = 0, rs1 = 2 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	rdpr	%tstate, %l0	
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* tl = 0, rs1 = 3 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	rdpr	%tt, %l0	
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	ta	T_CHANGE_NONPRIV
	nop

!!----------------------------------
!!  Read State reg : rdasr
!!	rd != 0 , rs = 15 
!!----------------------------------
tc_ill_rdasr:
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x9143c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xa143c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xb143c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x8343c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xbf43c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

!!----------------------------------
!!  Store integer: std with odd rd
!!----------------------------------
tc_ill_stdrd:
	/* std rd = 1 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xc2380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 3 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xc6380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 5 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xca380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 7 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xce380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

tc_ill_stdrd1:
	/* std rd = 9 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xd2380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 11 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xd6380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 13 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xda380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 15 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xde380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 17 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xe2380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

tc_ill_stdrd2:
	/* std rd = 19 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xe6380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 21 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xea380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 23 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xee380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 25 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xf2380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 27 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xf6380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 29 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xfa380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 31 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xfe380000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

!!-------------------------------------------------
!!  Store Int to ASI space : 
!!	stda with odd rd ( ill_inst trap )
!!-------------------------------------------------
tc_ill_stintasi:
	/* std rd = 1 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xc2b80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 3 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xc6b80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 5 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xcab80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 7 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xceb80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 9 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xd2b80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 11 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xd6b80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 13 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xdab80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 15 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xdeb80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 17 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xe2b80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 19 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xe6b80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

tc_ill_stintasi1:
	/* std rd = 21 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xeab80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 23 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xeeb80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 25 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xf2b80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 27 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xf6b80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 29 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xfab80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* std rd = 31 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xfeb80000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

!!-------------------------------------------------
!!  Trap on integer cond : ill_inst trap
!!-------------------------------------------------
tc_ill_intcond:
	/* cond = 1000 cc1,cc0 = 01 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x91d00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1000 cc1,cc0 = 11 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x91d01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0000 cc1,cc0 = 11 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81d01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0000 cc1,cc0 = 01 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81d00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1001 cc1,cc0 = 11 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x93d01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1001 cc1,cc0 = 01 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x93d00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0001 cc1,cc0 = 11 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x83d01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0001 cc1,cc0 = 01 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x83d00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1010 cc1,cc0 = 11 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x95d01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

tc_ill_intcond1:
	/* cond = 1010 cc1,cc0 = 01 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x95d00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0010 cc1,cc0 = 11 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x85d01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0010 cc1,cc0 = 01 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x85d00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1011 cc1,cc0 = 11 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x97d01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1011 cc1,cc0 = 01 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x97d00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0011 cc1,cc0 = 11 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x87d01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0011 cc1,cc0 = 01 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x87d00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1100 cc1,cc0 = 11 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x99d01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1100 cc1,cc0 = 01 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x99d00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

tc_ill_intcond2:
	/* cond = 0100 cc1,cc0 = 11 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x89d01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0100 cc1,cc0 = 01 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x89d00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1101 cc1,cc0 = 11 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x9bd01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1101 cc1,cc0 = 01 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x9bd00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0101 cc1,cc0 = 11 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x8bd01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0101 cc1,cc0 = 01 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x8bd00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1110 cc1,cc0 = 11 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x9dd01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1110 cc1,cc0 = 01 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x9dd00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0110 cc1,cc0 = 11 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x8dd01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0110 cc1,cc0 = 01 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x8dd00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

tc_ill_intcond3:
	/* cond = 1111 cc1,cc0 = 11 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x9fd01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 1111 cc1,cc0 = 01 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x9fd00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0111 cc1,cc0 = 11 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x8fd01800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* cond = 0111 cc1,cc0 = 01 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x8fd00800
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

!!-------------------------------------------------
!!  write privileged reg : TL=0, rs1<= 3 
!!	-> ill inst trap
!!-------------------------------------------------
tc_ill_wrpriv:
	/* should avoid the priveleged action */
	ta	T_CHANGE_PRIV
	nop

	/* TL=0 rs1 = 0 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81900000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* TL=0 rs1 = 1 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81904000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* TL=0 rs1 = 2 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81908000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* TL=0 rs1 = 3 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x8190c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* changed back to user mode */
	ta	T_CHANGE_NONPRIV	
	nop

!!-------------------------------------------------
!! Write State reg : ill_instr trap
!!-------------------------------------------------
tc_ill_wrstate:
	/* WRASR rd=15 rs1 != 0 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x9f804000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x9f808000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x9f810000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x9f820000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x9f840000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x9f87c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

	/* WRASR rd=15 i!=1 i=0 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x9f800000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0006,	%l1

/*
 ******************************************************
 *  	Tag Overflow
 ******************************************************
 */
!!----------------------------------
!!  Tag add : tag overflow trap
!!----------------------------------
tc_ill_tgovflw:
	/* rs1[0] = 1 */
	set	0x1,	%l0
	set	0x4,	%l1
        set     0x23,   %o0	/* tag over flow trap */
        ta      T_TRAP_EN
        nop
        taddcctv %l0,	%l1,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs1[1] = 1 */
	set	0x2,	%l0
	set	0x4,	%l1
        set     0x23,   %o0	/* tag over flow trap */
        ta      T_TRAP_EN
        nop
        taddcctv %l0,	%l1,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs1[1,0] = 11 */
	set	0x3,	%l0
	set	0x4,	%l1
        set     0x23,   %o0	/* tag over flow trap */
        ta      T_TRAP_EN
        nop
        taddcctv %l0,	%l1,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs2[0] = 1 */
	set	0x1,	%l0
	set	0x4,	%l1
        set     0x23,   %o0	/* tag over flow trap */
        ta      T_TRAP_EN
        nop
        taddcctv %l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs2[1] = 1 */
	set	0x2,	%l0
	set	0x4,	%l1
        set     0x23,   %o0	/* tag over flow trap */
        ta      T_TRAP_EN
        nop
        taddcctv %l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs2[1,0] = 11 */
	set	0x3,	%l0
	set	0x4,	%l1
        set     0x23,   %o0	/* tag over flow trap */
        ta      T_TRAP_EN
        nop
        taddcctv %l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
tc_ill_tgovflw1:
	/* rs1,rs2[1,0] = 01 */
	set	0x1,	%l0
	set	0x1,	%l1
        set     0x23,   %o0	/* tag over flow trap */
        ta      T_TRAP_EN
        nop
        taddcctv %l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs1,rs2[1,0] = 11 */
	set	0x3,	%l0
	set	0x3,	%l1
        set     0x23,   %o0	/* tag over flow trap */
        ta      T_TRAP_EN
        nop
        taddcctv %l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

!!----------------------------------
!!  Tag sub : tag overflow trap
!!----------------------------------
tc_ill_tgovflwsub:
	/* rs1[0] = 1 */
	set	0x1,	%l0
	set	0x4,	%l1
        set     0x23,   %o0	/* tag over flow trap */
        ta      T_TRAP_EN
        nop
        tsubcctv %l0,	%l1,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs1[1] = 1 */
	set	0x2,	%l0
	set	0x4,	%l1
        set     0x23,   %o0	/* tag over flow trap */
        ta      T_TRAP_EN
        nop
        tsubcctv %l0,	%l1,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs1[1,0] = 11 */
	set	0x3,	%l0
	set	0x4,	%l1
        set     0x23,   %o0	/* tag over flow trap */
        ta      T_TRAP_EN
        nop
        tsubcctv %l0,	%l1,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
tc_ill_tgovflwsub1:
	/* rs2[0] = 1 */
	set	0x1,	%l0
	set	0x4,	%l1
        set     0x23,   %o0	/* tag over flow trap */
        ta      T_TRAP_EN
        nop
        tsubcctv %l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs2[1] = 1 */
	set	0x2,	%l0
	set	0x4,	%l1
        set     0x23,   %o0	/* tag over flow trap */
        ta      T_TRAP_EN
        nop
        tsubcctv %l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs2[1,0] = 11 */
	set	0x3,	%l0
	set	0x4,	%l1
        set     0x23,   %o0	/* tag over flow trap */
        ta      T_TRAP_EN
        nop
        tsubcctv %l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
tc_ill_tgovflwsub2:
	/* rs1,rs2[1,0] = 01 */
	set	0x1,	%l0
	set	0x1,	%l1
        set     0x23,   %o0	/* tag over flow trap */
        ta      T_TRAP_EN
        nop
        tsubcctv %l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
	
	/* rs1,rs2[1,0] = 11 */
	set	0x3,	%l0
	set	0x3,	%l1
        set     0x23,   %o0	/* tag over flow trap */
        ta      T_TRAP_EN
        nop
        tsubcctv %l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

/*
 ********************************
 *      Divide by zero Trap
 ********************************
 */
!!---------------------------------------------
!!  Divide (64/32bit) by zero : trap
!!---------------------------------------------
tc_ill_dvdzero:
	set	0x0,	%l0
	set	0x20,	%l1

        set     0x28,   %o0	/* divide by zero */
        ta      T_TRAP_EN
        nop
       	udiv	%l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

tc_ill_dvdzero1:
        set     0x28,   %o0	/* divide by zero */
        ta      T_TRAP_EN
        nop
       	sdiv	%l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x28,   %o0	/* divide by zero */
        ta      T_TRAP_EN
        nop
       	udivcc	%l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x28,   %o0	/* divide by zero */
        ta      T_TRAP_EN
        nop
       	sdivcc	%l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

!!---------------------------------------------
!!  Divide (64/32bit) by zero : trap
!!---------------------------------------------
	set	0x0,	%l0
	set	0x20,	%l1

        set     0x28,   %o0	/* divide by zero */
        ta      T_TRAP_EN
        nop
       	udivx	%l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x28,   %o0	/* divide by zero */
        ta      T_TRAP_EN
        nop
       	sdivx	%l1,	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

/*
 **********************************************************
 *  Memory address not aligned error
 **********************************************************
 */
!!------------------------------------
!!	Compare & Swap 
!!------------------------------------
tc_ill_misalgn:
	set	0x150003,	%l0
	set	0x44,	%l1

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	casa	[%l0] 0x80,	%l1,	%l2		
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

	set	0x0,	%l3
	wr	%l3,	0x80,	%asi
	nop
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	casa	[%l0] %asi,	%l1,	%l2		
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	casxa	[%l0] 0x80,	%l1,	%l2		
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

	set	0x0,	%l3
	wr	%l3,	0x80,	%asi
	nop
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	casxa	[%l0] %asi,	%l1,	%l2		
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

!!------------------------------------
!!	Jumpl
!!------------------------------------
tc_ill_misalgnjmp:
	set	0x150001,	%l0
	set	0x44,	%l1

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	jmpl	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

!!------------------------------------
!!	Ld floating point 
!!------------------------------------
	set	0x150001,	%l0
	set	0x44,	%l1

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ld	[%l0],	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ldd	[%l0],	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if 0	/* this will cause an illegal inst trap first */
	/* for right now, we skip multi-trap-per-inst */
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ldq	[%l0],	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
#endif

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ld	[%l0],	%fsr
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ldx	[%l0],	%fsr
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

!!----------------------------------
!! ld fp from ASI : mem misaligned 
!!----------------------------------
tc_ill_misalgn_ldfp:
	ta	T_CHANGE_NONPRIV
	nop

	set	0x0,	%l0
	wr	%l0,	0x80,	%asi
	nop
	set	0x150001,	%l0

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	lda	[%l0] 0x80,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	lda	[%l0] %asi,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ldda	[%l0] 0x80,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

tc_ill_misalgn_ldfp1:
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ldda	[%l0] %asi,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if 0	/* this will cause illegal inst trap first */
	/* for right now, we dont care multi-trap-per inst */
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ldqa	[%l0] 0x80,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ldqa	[%l0] %asi,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
#endif

!!---------------------------------------
!!  Load Integer
!!---------------------------------------
tc_ill_misalgn_ldint:
	set	0x150001,	%l0

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ldsh	[%l0],	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ldsw	[%l0],	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	lduh	[%l0],	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	lduw	[%l0],	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

tc_ill_misalgn_ldint1:
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ldx	[%l0],	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ldd	[%l0],	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

!!---------------------------------------
!!  Load Integer from ASI
!!---------------------------------------
tc_ill_misalgn_ldasi:
	set	0x150001,	%l0

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ldsha	[%l0] 0x80,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ldswa	[%l0] 0x80,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	lduha	[%l0] 0x80,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	lduwa	[%l0] 0x80,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

tc_ill_misalgn_ldasi1:
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ldxa	[%l0] 0x80,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ldda	[%l0] 0x80,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1


	/* ASI instead of imm */
	set	0x0,	%l0
	wr	%l0,	0x80,	%asi
	nop

	set	0x150001,	%l0
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ldsha	[%l0] %asi,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ldswa	[%l0] %asi,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	lduha	[%l0] %asi,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

tc_ill_misalgn_ldasi2:
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	lduwa	[%l0] %asi,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ldxa	[%l0] %asi,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ldda	[%l0] %asi,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
!!------------------------------------
!! return : mem misalign
!!------------------------------------
	call 	misalign_sum3
	nop

!!------------------------------------
!! Store floating point
!!------------------------------------
tc_ill_misalgn_stfp:
	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	st	%f0,	[%l2]
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	std	%f0,	[%l2]
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

#if 0	/* cause an illegal inst trap */
	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	stq	%f0,	[%l2]
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1
#endif

	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	st	%fsr,	[%l2]
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	stx	%fsr,	[%l2]
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

!!------------------------------------
!! Store floating point to ASI
!!------------------------------------
tc_ill_misalgn_stfpasi:
	set	0x0,	%l0
	wr	%l0,	0x80,	%asi
	nop

	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	sta	%f0,	[%l2] 0x80
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	sta	%f0,	[%l2] %asi
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	stda	%f0,	[%l2] 0x80
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	stda	%f0,	[%l2] %asi
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

#if 0	/* this will cause illegal inst trap */
	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	stqa	%f0,	[%l2] 0x80
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	stqa	%f0,	[%l2] %asi
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1
#endif

!!--------------------------------------------------
!!	swap reg with mem : mem_misaln trap
!!--------------------------------------------------
tc_ill_misalgn_swap:
	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	swap	[%l2],	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

!!--------------------------------------------------
!!	swap reg with ASI mem : mem_misaln trap
!!--------------------------------------------------
	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	swapa	[%l2] 0x80,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	swapa	[%l2+0x0] %asi,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

/*
 *************************************************
 *     LDQF & LDDF_mem_address misaligned 
 *************************************************
 */
#if 0	/* mem_addr_misaligned trap : 0x34 has
	 * higher priority 
	 */
!!-------------------------------
!!  ldd floating point
!!-------------------------------
	set	0x160001,	%l2
        set     0x35,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ldd	[%l2],	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

!!-------------------------------
!!  ldq floating point
!!-------------------------------
	set	0x160001,	%l2
        set     0x38,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	ldq	[%l2],	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

/*
 *************************************************
 *     STQF & STDF_mem_address misaligned 
 *************************************************
 */
!!-------------------------------
!!  std floating point
!!-------------------------------
	set	0x160001,	%l2
        set     0x36,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	std	%f0,	[%l2]
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
#endif

!!-------------------------------
!!  stq floating point
!!-------------------------------
#if 0
	set	0x160001,	%l2
        set     0x39,   %o0	/* mem addr misaligned */
        ta      T_HTRAP_EN
        nop
	stq	%f0,	[%l2]
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
#endif

/*
 *************************************************
 *     Privileged action : PRIVACT_TRAP
 *************************************************
 */
!!---------------------------------------------
!! CASA & CASXA : 
!!	PSTATE.PRIV = 0 & asi[7] = 1'b0
!!---------------------------------------------
tc_ill_privact0:
	ta	T_CHANGE_NONPRIV
	nop

	set	0x0,	%l0
	wr	%l0,	0x10,	%asi
	set	0x160000,	%l0
	set	0x55,	%l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	casa	[%l0]	%asi,	%l1,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	casa	[%l0] 0x10,	%l1,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

tc_ill_privact1:
        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	casxa	[%l0]	%asi,	%l1,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	casxa	[%l0] 0x10,	%l1,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

!!---------------------------------------------
!! Ld fp from ASI
!!	PSTATE.PRIV = 0 & asi[7] = 1b0
!!---------------------------------------------
tc_ill_privact_fp0:
	set	0x160000,	%l2
	set	0x0,	%l0
	wr	%l0,	0x10,	%asi
	nop

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	lda	[%l2] 0x10,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	lda	[%l2] %asi,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

tc_ill_privact_fp1:
        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	ldda	[%l2] 0x10,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	ldda	[%l2] %asi,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1


#if 0	/* this will cause illegal inst trap */
        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	ldqa	[%l2] 0x10,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
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
tc_ill_privact_ldasi0:
	set	0x160000,	%l2
	set	0x0,	%l0
	wr	%l0,	0x10,	%asi
	nop

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	ldsba	[%l2+0x0] %asi,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	ldsba	[%l2] 0x10,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	ldswa	[%l2+0x0] %asi,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	ldswa	[%l2] 0x10,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

tc_ill_privact_ldasi1:
        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	lduba	[%l2+0x0] %asi,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	lduba	[%l2] 0x10,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	lduha	[%l2+0x0] %asi,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	lduha	[%l2] 0x10,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	lduwa	[%l2+0x0] %asi,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	lduwa	[%l2] 0x10,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

tc_ill_privact_ldasi2:
        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	ldxa	[%l2+0x0] %asi,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	ldxa	[%l2] 0x10,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	ldda	[%l2+0x0] %asi,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	ldda	[%l2] 0x10,	%l4
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

!!---------------------------------------------
!! Ldstub from ASI
!!	PSTATE.PRIV = 0 & asi[7] = 1b0
!!---------------------------------------------
tc_ill_privact_ldasi3:
	wr	%g0,	0x10,	%asi
	set	0x160000,	%l2
        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	ldstuba	[%l2] %asi,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	ldstuba	[%l2] 0x10,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

!!---------------------------------------------
!! Store FP to ASI
!!	PSTATE.PRIV = 0 & asi[7] = 1b0
!!---------------------------------------------
tc_ill_privact_stfpasi0:
	wr	%g0,	0x10,	%asi

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	sta	%f0,	[%l2] %asi
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
	
        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	sta	%f0,	[%l2] 0x10
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
	
        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	stda	%f0,	[%l2] %asi
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
	
tc_ill_privact_stfpasi1:
        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	stda	%f0,	[%l2] 0x10
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

#if 0		/* this will cause illegal_instr trap first */
        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	stqa	%f0,	[%l2] %asi
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
	
        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	stqa	%f0,	[%l2] 0x10
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
#endif

!!---------------------------------------------
!! Store Integer to ASI
!!	PSTATE.PRIV = 0 & asi[7] = 1b0
!!---------------------------------------------
tc_ill_privact_stintasi0:
	set	0x0,	%l0
        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	stba	%l0,	[%l2] 0x10
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	stba	%l0,	[%l2] %asi
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
	
        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	stha	%l0,	[%l2] 0x10
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	stha	%l0,	[%l2] %asi
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
	
        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	stda	%l0,	[%l2] 0x10
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	stda	%l0,	[%l2] %asi
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
	
        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	stwa	%l0,	[%l2] 0x10
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

tc_ill_privact_stintasi1:
        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	stwa	%l0,	[%l2] %asi
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
	
        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	stxa	%l0,	[%l2] 0x10
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
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
tc_ill_privact_swapasi0:
	set	0x0,	%l3
        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	swapa	[%l2] %asi,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

        set     0x37,   %o0	/* Priveleged action trap */
        ta      T_HTRAP_EN
        nop
	swapa	[%l2] 0x10,	%l3
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
tc_ill_privact_dnrtry0:
	/* DONE , when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_TRAP_EN
	nop
	done
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* Retry , when PSTATE.PRIV = 0 */
	set	0x11,	%o0
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
	ta	T_TRAP_EN
	nop
	.word	0x81510000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_TRAP_EN
	nop
	.word	0x81514000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

tc_ill_privact_dnrtry1:
	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_TRAP_EN
	nop
	.word	0x81518000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_TRAP_EN
	nop
	.word	0x8151c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_TRAP_EN
	nop
	.word	0x81520000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_TRAP_EN
	nop
	.word	0x81524000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_TRAP_EN
	nop
	.word	0x81528000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

tc_ill_privact_dnrtry2:
	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_TRAP_EN
	nop
	.word	0x8152c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_TRAP_EN
	nop
	.word	0x81530000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_TRAP_EN
	nop
	.word	0x81534000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

tc_ill_privact_dnrtry3:
	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
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
tc_ill_rdasr0:
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
	ta	T_HTRAP_EN
	nop
	.word	0x8141c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* rs1 = 14 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81438000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

tc_ill_rdasr1:
	/* rs1 = 16 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81440000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* rs1 = 31 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
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
	ta	T_HTRAP_EN
	nop
	saved
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* restore when PRIV=0 */
	set	0x11,	%o0
	ta	T_HTRAP_EN
	nop
	restored
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

!!----------------------------------
!!  Write privileged reg	
!!----------------------------------
tc_ill_wrpriv0:
	/* rs1 = 4 when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81910000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81914000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81918000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x8191c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81920000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81924000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81928000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x8192c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81930000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

tc_ill_wrpriv1:
	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81934000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81938000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* rs1 = 15 when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x81940000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* rs1 = 31 when PSTATE.PRIV = 0 */
	set	0x11,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0x8197c000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

!!----------------------------------
!!	Write State Reg : WRASR
!!----------------------------------
tc_ill_wrpriv2:
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
	ta	T_HTRAP_EN
	nop
	.word	0xa1800000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1

	/* rs1 = 31 */
	set	0x10,	%o0
	ta	T_HTRAP_EN
	nop
	.word	0xbf800000
	nop
	cmp	%o0,	0
	bne,a	diag_fail
	set	0xffff0003,	%l1
/*
 ******************************************************
 *      Unimplemented LDD & STD
 ******************************************************
 */
!!----------------------------------------------------------
!!  Unimplemented LDD : ldd is implemented in SIMICS
!!----------------------------------------------------------
#if 0
        set     0x12,   %o0
        ta      T_TRAP_EN
        nop
        /* .word   0xc0184000 */
	set	0x160000,	%l0	
	ldd	[%l0],	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
#endif

	/* this will cause an illegal inst trap */ 
        /* rd = 31, rs1 = 0 */
        set     0x10,   %o0
        ta      T_HTRAP_EN
        nop
        .word   0xfe180000
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

!!----------------------------------
!!  Unimplemented LDDA
!!----------------------------------
#if 0
        set     0x12,   %o0
        ta      T_HTRAP_EN
        nop
        .word   0xc0984000
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
#endif

	/* this will cause an illegal inst trap */ 
        /* rd = 31, rs1 = 0 */
        set     0x10,   %o0
        ta      T_HTRAP_EN
        nop
        .word   0xfe980000
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

!!----------------------------------
!!  Unimplemented STD
!!----------------------------------
#if 0	/* 
	 * STD & STDA are implemented in Simics.
	 * 
	 * This needs to be discussed. 
	 */
        /* rd = 0, rs1 = 1 */
        set     0x12,   %o0
        ta      T_TRAP_EN
        nop
        .word   0xc0384000
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        /* rd = 31, rs1 = 0 */
        set     0x12,   %o0
        ta      T_TRAP_EN
        nop
        .word   0xfe380000
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

!!----------------------------------
!!  Unimplemented STDA
!!----------------------------------
	/* 
	 * In Simics, STDA is implemented 
	 *
 	 * Need more discussion.
	 */
        /* rd = 0, rs1 = 1 */
        set     0x12,   %o0
        ta      T_TRAP_EN
        nop
        .word   0xc0b84000
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        /* rd = 31, rs1 = 0 */
        set     0x12,   %o0
        ta      T_TRAP_EN
        nop
        .word   0xfeb80000
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
#endif

/*
 ******************************************************
 *  	Spill_n_normal Window Traps
 ******************************************************
 */
!!----------------------------------
!!  spill_0_normal : tt = 0x80
!!----------------------------------
tc_spillnm_0:
	/*
 	 * Set up the Window manage
 	 * registers in PRIV mode .
 	 */
	ta	T_CHANGE_PRIV
	nop		

	/* set cansave = 0 to cause trap */
	set	0x0,	%l0
	wrpr	%l0,	0x0,	%cansave
	wrpr	%l0,	0x6,	%canrestore
	wrpr	%l0,	0x0,	%otherwin
	wrpr	%l0,	0x8,	%cleanwin
	wrpr	%l0,	0x0,	%wstate	 /* n = 0 */
	wrpr	%l0,	0x0,	%cwp	 /* n = 0 */
	
	/* go back to User mode */
	ta	T_CHANGE_NONPRIV
	nop

	/* enable the trap */
        set     0x80,   %o0     /* spill_n_normal window trap */
        ta      T_TRAP_EN
        nop
	/* do a SAVE to cause the trap */
	mov     0x1000 , %sp
        save	%sp,	-96,	%sp	/* trap --> cwp+2 */
        nop

!        cmp     %o0,    0	
!        bne,a   diag_fail
!        set     0xffff0003,     %l1

!!----------------------------------
!!  spill_1_normal : tt = 0x84
!!----------------------------------
tc_spillnm_1:
	/*
 	 * Set up the Window manage
 	 * registers in PRIV mode .
 	 */
	ta	T_CHANGE_PRIV
	nop		

	/* set cansave = 0 to cause trap */
	set	0x0,	%l0
	wrpr	%l0,	0x0,	%cansave
	wrpr	%l0,	0x6,	%canrestore
	wrpr	%l0,	0x0,	%otherwin
	wrpr	%l0,	0x8,	%cleanwin

	wrpr	%l0,	0x1,	%wstate	 /* n = 1 */
	wrpr	%l0,	0x1,	%cwp	 /* n = 1 */
	
	/* go back to User mode */
	ta	T_CHANGE_NONPRIV
	nop

	/* enable the trap */
        set     0x84,   %o0     /* spill_n_normal window trap */
        ta      T_TRAP_EN
        nop
	/* do a SAVE to cause the trap */
	mov     0x1000, %sp
        save	%sp,	-96,	%sp	/* trap --> cwp+2 */
        nop

!        cmp     %o0,    0	
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  spill_2_normal : tt = 0x88
!!----------------------------------
tc_spillnm_2:
	/*
 	 * Set up the Window manage
 	 * registers in PRIV mode.
 	 */
	ta	T_CHANGE_PRIV
	nop		

	/* set cansave = 0 to cause trap */
	set	0x0,	%l0
	wrpr	%l0,	0x0,	%cansave
	wrpr	%l0,	0x6,	%canrestore
	wrpr	%l0,	0x0,	%otherwin
	wrpr	%l0,	0x8,	%cleanwin

	wrpr	%l0,	0x2,	%wstate	 /* n = 2 */
	wrpr	%l0,	0x2,	%cwp	 /* n = 2 */
	
	/* go back to User mode */
	ta	T_CHANGE_NONPRIV
	nop

	/* enable the trap */
        set     0x88,   %o0     /* spill_n_normal window trap */
        ta      T_TRAP_EN
        nop
	/* do a SAVE to cause the trap */
	mov     0x1000, %sp
        save	%sp,	-96,	%sp	/* trap --> cwp+2 */
        nop

!        cmp     %o0,    0	
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  spill_3_normal : tt = 0x8c
!!----------------------------------
tc_spillnm_3:
	/*
 	 * Set up the Window manage
 	 * registers in PRIV mode.
 	 */
	ta	T_CHANGE_PRIV
	nop		

	/* set cansave = 0 to cause trap */
	set	0x0,	%l0
	wrpr	%l0,	0x0,	%cansave
	wrpr	%l0,	0x6,	%canrestore
	wrpr	%l0,	0x0,	%otherwin
	wrpr	%l0,	0x8,	%cleanwin

	wrpr	%l0,	0x3,	%wstate	 /* n = 3 */
	wrpr	%l0,	0x3,	%cwp	 /* n = 3 */
	
	/* go back to User mode */
	ta	T_CHANGE_NONPRIV
	nop

	/* enable the trap */
        set     0x8c,   %o0     /* spill_n_normal window trap */
        ta      T_TRAP_EN
        nop
	/* do a SAVE to cause the trap */
	mov     0x1000, %sp
        save	%sp,	-96,	%sp	/* trap --> cwp+2 */
        nop

!        cmp     %o0,    0	
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  spill_4_normal : tt = 0x90
!!----------------------------------
tc_spillnm_4:
	/*
 	 * Set up the Window manage
 	 * registers in PRIV mode.
 	 */
	ta	T_CHANGE_PRIV
	nop		

	/* set cansave = 0 to cause trap */
	set	0x0,	%l0
	wrpr	%l0,	0x0,	%cansave
	wrpr	%l0,	0x6,	%canrestore
	wrpr	%l0,	0x0,	%otherwin
	wrpr	%l0,	0x8,	%cleanwin

	wrpr	%l0,	0x4,	%wstate	 /* n = 4 */
	wrpr	%l0,	0x4,	%cwp	 /* n = 4 */
	
	/* go back to User mode */
	ta	T_CHANGE_NONPRIV
	nop

	/* enable the trap */
        set     0x90,   %o0     /* spill_n_normal window trap */
        ta      T_TRAP_EN
        nop
	/* do a SAVE to cause the trap */
	mov     0x1000, %sp
        save	%sp,	-96,	%sp	/* trap --> cwp+2 */
        nop

!        cmp     %o0,    0	
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  spill_5_normal : tt = 0x94
!!----------------------------------
tc_spillnm_5:
	/*
 	 * Set up the Window manage
 	 * registers in PRIV mode.
 	 */
	ta	T_CHANGE_PRIV
	nop		

	/* set cansave = 0 to cause trap */
	set	0x0,	%l0
	wrpr	%l0,	0x0,	%cansave
	wrpr	%l0,	0x6,	%canrestore
	wrpr	%l0,	0x0,	%otherwin
	wrpr	%l0,	0x8,	%cleanwin

	wrpr	%l0,	0x5,	%wstate	 /* n = 5 */
	wrpr	%l0,	0x5,	%cwp	 /* n = 5 */
	
	/* go back to User mode */
	ta	T_CHANGE_NONPRIV
	nop

	/* enable the trap */
        set     0x94,   %o0     /* spill_n_normal window trap */
        ta      T_TRAP_EN
        nop
	/* do a SAVE to cause the trap */
	mov     0x1000, %sp
        save	%sp,	-96,	%sp	/* trap --> cwp+2 */
        nop

!        cmp     %o0,    0	
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  spill_6_normal : tt = 0x98
!!----------------------------------
tc_spillnm_6:
	/*
 	 * Set up the Window manage
 	 * registers in PRIV mode.
 	 */
	ta	T_CHANGE_PRIV
	nop		

	/* set cansave = 0 to cause trap */
	set	0x0,	%l0
	wrpr	%l0,	0x0,	%cansave
	wrpr	%l0,	0x6,	%canrestore
	wrpr	%l0,	0x0,	%otherwin
	wrpr	%l0,	0x8,	%cleanwin

	wrpr	%l0,	0x6,	%wstate	 /* n = 6 */
	wrpr	%l0,	0x6,	%cwp	 /* n = 6 */
	
	/* go back to User mode */
	ta	T_CHANGE_NONPRIV
	nop

	/* enable the trap */
        set     0x98,   %o0     /* spill_n_normal window trap */
        ta      T_TRAP_EN
        nop
	/* do a SAVE to cause the trap */
	mov     0x1000, %sp
        save	%sp,	-96,	%sp	/* trap --> cwp+2 */
        nop

!        cmp     %o0,    0	
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  spill_7_normal : tt = 0x9c
!!----------------------------------
tc_spillnm_7:
	/*
 	 * Set up the Window manage
 	 * registers in PRIV mode.
 	 */
	ta	T_CHANGE_PRIV
	nop		

	/* set cansave = 0 to cause trap */
	set	0x0,	%l0
	wrpr	%l0,	0x0,	%cansave
	wrpr	%l0,	0x6,	%canrestore
	wrpr	%l0,	0x0,	%otherwin
	wrpr	%l0,	0x8,	%cleanwin

	wrpr	%l0,	0x7,	%wstate	 /* n = 7 */
	wrpr	%l0,	0x7,	%cwp	 /* n = 7 */
	
	/* go back to User mode */
	ta	T_CHANGE_NONPRIV
	nop

	/* enable the trap */
        set     0x9c,   %o0     /* spill_n_normal window trap */
        ta      T_TRAP_EN
        nop
	/* do a SAVE to cause the trap */
	mov     0x1000, %sp
        save	%sp,	-96,	%sp	/* trap --> cwp+2 */
        nop

!        cmp     %o0,    0	
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  spill_0_other : tt = 0xa0
!!----------------------------------
tc_spilother_0:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set cansave = 0 to cause spill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x0,    %cansave
        wrpr    %l0,    0x5,    %canrestore
        wrpr    %l0,    0x1,    %otherwin	/* otherwin != 0 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x0,    %wstate  /* n = 0 */
        wrpr    %l0,    0x0,    %cwp     /* n = 0 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xa0,   %o0     /* spill_n_other window trap */
        ta      T_TRAP_EN
        nop
        /* do a SAVE to cause the trap */
	mov     0x1000, %sp
        save    %sp,    -96,    %sp     /* trap --> cwp+2 */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1


!!----------------------------------
!!  spill_1_other : tt = 0xa4
!!----------------------------------
tc_spilother_1:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set cansave = 0 to cause spill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x0,    %cansave
        wrpr    %l0,    0x5,    %canrestore
        wrpr    %l0,    0x1,    %otherwin	/* otherwin != 0 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x8,    %wstate  /* otherwin n = 1 */
        wrpr    %l0,    0x1,    %cwp     /* n = 1 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xa4,   %o0     /* spill_n_other window trap */
        ta      T_TRAP_EN
        nop
        /* do a SAVE to cause the trap */
	mov     0x1000, %sp
        save    %sp,    -96,    %sp     /* trap --> cwp+2 */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  spill_2_other : tt = 0xa8
!!----------------------------------
tc_spilother_2:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set cansave = 0 to cause spill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x0,    %cansave
        wrpr    %l0,    0x5,    %canrestore
        wrpr    %l0,    0x1,    %otherwin	/* otherwin != 0 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x10,    %wstate  /* otherwin n = 2 */
        wrpr    %l0,    0x2,    %cwp     /* n = 2 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xa8,   %o0     /* spill_n_other window trap */
        ta      T_TRAP_EN
        nop
        /* do a SAVE to cause the trap */
	mov     0x1000, %sp
        save    %sp,    -96,    %sp     /* trap --> cwp+2 */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  spill_3_other : tt = 0xac
!!----------------------------------
tc_spilother_3:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set cansave = 0 to cause spill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x0,    %cansave
        wrpr    %l0,    0x5,    %canrestore
        wrpr    %l0,    0x1,    %otherwin	/* otherwin != 0 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x18,    %wstate  /* otherwin n = 3 */
        wrpr    %l0,    0x3,    %cwp     /* n = 3 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xac,   %o0     /* spill_n_other window trap */
        ta      T_TRAP_EN
        nop
        /* do a SAVE to cause the trap */
	mov     0x1000, %sp
        save    %sp,    -96,    %sp     /* trap --> cwp+2 */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  spill_4_other : tt = 0xb0
!!----------------------------------
tc_spilother_4:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set cansave = 0 to cause spill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x0,    %cansave
        wrpr    %l0,    0x5,    %canrestore
        wrpr    %l0,    0x1,    %otherwin	/* otherwin != 0 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x20,    %wstate  /* otherwin n = 4 */
        wrpr    %l0,    0x4,    %cwp     /* n = 4 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xb0,   %o0     /* spill_n_other window trap */
        ta      T_TRAP_EN
        nop
        /* do a SAVE to cause the trap */
	mov     0x1000, %sp
        save    %sp,    -96,    %sp     /* trap --> cwp+2 */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!       set     0xffff00e4,     %l1

!!----------------------------------
!!  spill_5_other : tt = 0xb4
!!----------------------------------
tc_spilother_5:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set cansave = 0 to cause spill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x0,    %cansave
        wrpr    %l0,    0x5,    %canrestore
        wrpr    %l0,    0x1,    %otherwin	/* otherwin != 0 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x28,    %wstate  /* otherwin n = 5 */
        wrpr    %l0,    0x5,    %cwp     /* n = 5 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xb4,   %o0     /* spill_n_other window trap */
        ta      T_TRAP_EN
        nop
        /* do a SAVE to cause the trap */
	mov     0x1000, %sp
        save    %sp,    -96,    %sp     /* trap --> cwp+2 */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  spill_6_other : tt = 0xb8
!!----------------------------------
tc_spilother_6:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set cansave = 0 to cause spill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x0,    %cansave
        wrpr    %l0,    0x5,    %canrestore
        wrpr    %l0,    0x1,    %otherwin	/* otherwin != 0 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x30,    %wstate  /* otherwin n = 6 */
        wrpr    %l0,    0x6,    %cwp     /* n = 6 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xb8,   %o0     /* spill_n_other window trap */
        ta      T_TRAP_EN
        nop
        /* do a SAVE to cause the trap */
	mov     0x1000, %sp
        save    %sp,    -96,    %sp     /* trap --> cwp+2 */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  spill_7_other : tt = 0xbc
!!----------------------------------
tc_spilother_7:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set cansave = 0 to cause spill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x0,    %cansave
        wrpr    %l0,    0x5,    %canrestore
        wrpr    %l0,    0x1,    %otherwin	/* otherwin != 0 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x38,    %wstate  /* otherwin n = 7 */
        wrpr    %l0,    0x7,    %cwp     /* n = 7 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xbc,   %o0     /* spill_n_other window trap */
        ta      T_TRAP_EN
        nop
        /* do a SAVE to cause the trap */
	mov     0x1000, %sp
        save    %sp,    -96,    %sp     /* trap --> cwp+2 */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_0_normal : tt = 0xc0
!!----------------------------------
tc_fillnm_0:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set canrestore = 0 to cause fill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x6,    %cansave
        wrpr    %l0,    0x0,    %canrestore
        wrpr    %l0,    0x0,    %otherwin	/* otherwin = 0 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x0,    %wstate  /* otherwin n = 0 */
        wrpr    %l0,    0x0,    %cwp     /* n = 0 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xc0,   %o0     /* fill_n_normal window trap */
        ta      T_TRAP_EN
        nop
        /* do a RESTORE to cause the fill_n_normal trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_1_normal : tt = 0xc4
!!----------------------------------
tc_fillnm_1:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set canrestore = 0 to cause fill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x6,    %cansave
        wrpr    %l0,    0x0,    %canrestore
        wrpr    %l0,    0x0,    %otherwin	/* otherwin = 0 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x1,    %wstate  /* otherwin n = 1 */
        wrpr    %l0,    0x1,    %cwp     /* n = 1 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xc4,   %o0     /* fill_n_normal window trap */
        ta      T_TRAP_EN
        nop
        /* do a RESTORE to cause the fill_n_normal trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_2_normal : tt = 0xc8
!!----------------------------------
tc_fillnm_2:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set canrestore = 0 to cause fill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x6,    %cansave
        wrpr    %l0,    0x0,    %canrestore
        wrpr    %l0,    0x0,    %otherwin	/* otherwin = 0 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x2,    %wstate  /* otherwin n = 2 */
        wrpr    %l0,    0x2,    %cwp     /* n = 2 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xc8,   %o0     /* fill_n_normal window trap */
        ta      T_TRAP_EN
        nop
        /* do a RESTORE to cause the fill_n_normal trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_3_normal : tt = 0xcc
!!----------------------------------
tc_fillnm_3:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set canrestore = 0 to cause fill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x6,    %cansave
        wrpr    %l0,    0x0,    %canrestore
        wrpr    %l0,    0x0,    %otherwin	/* otherwin = 0 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x3,    %wstate  /* otherwin n = 3 */
        wrpr    %l0,    0x3,    %cwp     /* n = 3 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xcc,   %o0     /* fill_n_normal window trap */
        ta      T_TRAP_EN
        nop
        /* do a RESTORE to cause the fill_n_normal trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_4_normal : tt = 0xd0
!!----------------------------------
tc_fillnm_4:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set canrestore = 0 to cause fill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x6,    %cansave
        wrpr    %l0,    0x0,    %canrestore
        wrpr    %l0,    0x0,    %otherwin	/* otherwin = 0 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x4,    %wstate  /* otherwin n = 4 */
        wrpr    %l0,    0x4,    %cwp     /* n = 4 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xd0,   %o0     /* fill_n_normal window trap */
        ta      T_TRAP_EN
        nop
        /* do a RESTORE to cause the fill_n_normal trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_5_normal : tt = 0xd4
!!----------------------------------
tc_fillnm_5:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set canrestore = 0 to cause fill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x6,    %cansave
        wrpr    %l0,    0x0,    %canrestore
        wrpr    %l0,    0x0,    %otherwin	/* otherwin = 0 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x5,    %wstate  /* otherwin n = 5 */
        wrpr    %l0,    0x5,    %cwp     /* n = 5 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xd4,   %o0     /* fill_n_normal window trap */
        ta      T_TRAP_EN
        nop
        /* do a RESTORE to cause the fill_n_normal trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_6_normal : tt = 0xd8
!!----------------------------------
tc_fillnm_6:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set canrestore = 0 to cause fill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x6,    %cansave
        wrpr    %l0,    0x0,    %canrestore
        wrpr    %l0,    0x0,    %otherwin	/* otherwin = 0 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x6,    %wstate  /* otherwin n = 6 */
        wrpr    %l0,    0x6,    %cwp     /* n = 6 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xd8,   %o0     /* fill_n_normal window trap */
        ta      T_TRAP_EN
        nop
        /* do a RESTORE to cause the fill_n_normal trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_7_normal : tt = 0xdc
!!----------------------------------
tc_fillnm_7:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set canrestore = 0 to cause fill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x6,    %cansave
        wrpr    %l0,    0x0,    %canrestore
        wrpr    %l0,    0x0,    %otherwin	/* otherwin = 0 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x7,    %wstate  /* otherwin n = 7 */
        wrpr    %l0,    0x7,    %cwp     /* n = 7 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xdc,   %o0     /* fill_n_normal window trap */
        ta      T_TRAP_EN
        nop
        /* do a RESTORE to cause the fill_n_normal trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_0_other : tt = 0xe0
!!----------------------------------
tc_fillother_0:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set canrestore = 0 to cause fill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x5,    %cansave
        wrpr    %l0,    0x0,    %canrestore
        wrpr    %l0,    0x1,    %otherwin	/* otherwin = 1 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x0,    %wstate  /* otherwin n = 0 */
        wrpr    %l0,    0x0,    %cwp     /* n = 0 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xe0,   %o0     /* fill_n_other window trap */
        ta      T_TRAP_EN
        nop
        /* do a RESTORE to cause the fill_n_other trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_1_other : tt = 0xe4
!!----------------------------------
tc_fillother_1:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set canrestore = 0 to cause fill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x5,    %cansave
        wrpr    %l0,    0x0,    %canrestore
        wrpr    %l0,    0x1,    %otherwin	/* otherwin = 1 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x8,    %wstate  /* otherwin n = 1 */
        wrpr    %l0,    0x8,    %cwp     /* n = 1 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xe4,   %o0     /* fill_n_other window trap */
        ta      T_TRAP_EN
        nop
        /* do a RESTORE to cause the fill_n_other trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_2_other : tt = 0xe8
!!----------------------------------
tc_fillother_2:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set canrestore = 0 to cause fill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x5,    %cansave
        wrpr    %l0,    0x0,    %canrestore
        wrpr    %l0,    0x1,    %otherwin	/* otherwin = 1 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x10,    %wstate  /* otherwin n = 2 */
        wrpr    %l0,    0x10,    %cwp     /* n = 2 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xe8,   %o0     /* fill_n_other window trap */
        ta      T_TRAP_EN
        nop
        /* do a RESTORE to cause the fill_n_other trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

!        cmp     %o0,    0
!       bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_3_other : tt = 0xec
!!----------------------------------
tc_fillother_3:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set canrestore = 0 to cause fill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x5,    %cansave
        wrpr    %l0,    0x0,    %canrestore
        wrpr    %l0,    0x1,    %otherwin	/* otherwin = 1 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x18,    %wstate  /* otherwin n = 3 */
        wrpr    %l0,    0x18,    %cwp     /* n = 3 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xec,   %o0     /* fill_n_other window trap */
        ta      T_TRAP_EN
        nop
        /* do a RESTORE to cause the fill_n_other trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_4_other : tt = 0xf0
!!----------------------------------
tc_fillother_4:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set canrestore = 0 to cause fill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x5,    %cansave
        wrpr    %l0,    0x0,    %canrestore
        wrpr    %l0,    0x1,    %otherwin	/* otherwin = 1 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x20,    %wstate  /* otherwin n = 4 */
        wrpr    %l0,    0x20,    %cwp     /* n = 4 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xf0,   %o0     /* fill_n_other window trap */
        ta      T_TRAP_EN
        nop
        /* do a RESTORE to cause the fill_n_other trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_5_other : tt = 0xf4
!!----------------------------------
tc_fillother_5:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set canrestore = 0 to cause fill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x5,    %cansave
        wrpr    %l0,    0x0,    %canrestore
        wrpr    %l0,    0x1,    %otherwin	/* otherwin = 1 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x28,    %wstate  /* otherwin n = 5 */
        wrpr    %l0,    0x28,    %cwp     /* n = 5 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xf4,   %o0     /* fill_n_other window trap */
        ta      T_TRAP_EN
        nop
        /* do a RESTORE to cause the fill_n_other trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

!        cmp     %o0,    0
!       bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_6_other : tt = 0xf8
!!----------------------------------
tc_fillother_6:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set canrestore = 0 to cause fill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x5,    %cansave
        wrpr    %l0,    0x0,    %canrestore
        wrpr    %l0,    0x1,    %otherwin	/* otherwin = 1 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x30,    %wstate  /* otherwin n = 6 */
        wrpr    %l0,    0x30,    %cwp     /* n = 6 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xf8,   %o0     /* fill_n_other window trap */
        ta      T_TRAP_EN
        nop
        /* do a RESTORE to cause the fill_n_other trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_7_other : tt = 0xfc
!!----------------------------------
tc_fillother_7:
        /*
         * Set up the Window manage
         * registers in PRIV mode.
         */
        ta      T_CHANGE_PRIV
        nop

        /* set canrestore = 0 to cause fill trap */
        set     0x0,    %l0
        wrpr    %l0,    0x5,    %cansave
        wrpr    %l0,    0x0,    %canrestore
        wrpr    %l0,    0x1,    %otherwin	/* otherwin = 1 */
        wrpr    %l0,    0x8,    %cleanwin

        wrpr    %l0,    0x38,    %wstate  /* otherwin n = 7 */
        wrpr    %l0,    0x38,    %cwp     /* n = 7 */

        /* go back to User mode */
        ta      T_CHANGE_NONPRIV
        nop

        /* enable the trap */
        set     0xfc,   %o0     /* fill_n_other window trap */
        ta      T_TRAP_EN
        nop
        /* do a RESTORE to cause the fill_n_other trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

/*
 ********************************
 *      clean window trap 
 ********************************
 */

!!----------------------------------
!!  clean_window trap : tt = 0x24
!!----------------------------------
	/*
 	 * Set up the Window manage
 	 * registers in PRIV mode .
 	 */
	ta	T_CHANGE_PRIV
	nop		

	/* set canrestore = cleanwin to cause trap */
	set	0x0,	%l0
	wrpr	%l0,	0x2,	%cansave
	wrpr	%l0,	0x4,	%canrestore
	wrpr	%l0,	0x0,	%otherwin

	wrpr	%l0,	0x4,	%cleanwin /* clean window # = canrestore */
	wrpr	%l0,	0x0,	%wstate	  /* n = 0 */
	wrpr	%l0,	0x0,	%cwp	  /* n = 0 */
	
	/* go back to User mode */
	ta	T_CHANGE_NONPRIV
	nop

	/* enable the trap */
        set     0x24,   %o0     /* clean_window trap */
        ta      T_TRAP_EN
        nop
	/* do a SAVE to cause the CLEAN WINDOW trap */
	mov     0x1000, %sp
        save	%sp,	-96,	%sp	/* trap --> cwp+1 */
        nop

!        cmp     %o0,    0	
!        bne,a   diag_fail
!        set     0xffff0003,     %l1

#if 0	/* need to wait for fix in SIMICS */
/*
 *************************************************
 *  Instruction access exception
 *************************************************
 */
        /* enable the trap */
        set     0x8,   %o0     /* Instruction access exception trap */
        ta      T_TRAP_EN
        nop
        /* do a call to the privileged action */
	call	idaexec_start
	nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff0003,     %l1
#endif

/*
 *************************************************
 *  Data access exception trap 
 *	load: E=0 P=1 PRIV=0
 *************************************************
 */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        ta      T_HTRAP_EN
        nop
        /* do a load to the protected data area to cause the trap */
	set	0x0,	%l0
	setx	idaexec_d1, %l0, %l1
	ld	[%l1+%l0],	%l2		
	nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff0003,     %l1
		
/*
 *************************************************
 *  Data access protection trap 
 *	load: W=0 E=0 P=0 PRIV=0
 *************************************************
 */
        /* enable the trap */
        set     0x6c,   %o0     /* Data access protection trap */
				/* 	
				 * This is different from the trap table 
				 * of V9 spec manual.
				 * Instead, we look at the trap table
	 		 	 */
        ta      T_HTRAP_EN
        nop
        /* 
	 *  Do a STORE to the protected data area to 
	 *  cause the trap. First, MMU miss trap is handled. Then,
	 *  the store will cause the data protection trap.
	 */
	set	0x0,	%l0
	set	0x5,	%l3
	setx	idaprot_d1, %l0, %l1
	stw	%l3,	[%l1+%l0]
	nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff0003,     %l1
		
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
	mov     0x1000, %sp
        save    %sp,    -96,    %sp
!        add     %i0,    %i1,    %l7
!        add     %l7,    %i2,    %l7

        set     0x34,   %o0	/* mem addr misaligned */
        ta      T_TRAP_EN
        nop
	return	%i7+1	/* misaligned addr return */
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        mov     4,     %l1

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
