// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: v9_trap_unimp_win.s
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
 ******************************************************
 *      Unimplemented LDD & STD
 ******************************************************
 */
!!----------------------------------------------------------
!!  Unimplemented LDD : ldd is implemented in SIMICS
!!----------------------------------------------------------
#if 0
        set     0x12,   %o0
        set     0x1,    %o1
        ta      T_HTRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_HTRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_HTRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_HTRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_HTRAP_EN_N_TIMES
        nop
        .word   0xc0384000
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        /* rd = 31, rs1 = 0 */
        set     0x12,   %o0
        set     0x1,    %o1
        ta      T_HTRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_HTRAP_EN_N_TIMES
        nop
        .word   0xc0b84000
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        /* rd = 31, rs1 = 0 */
        set     0x12,   %o0
        set     0x1,    %o1
        ta      T_HTRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
        nop
	/* do a SAVE to cause the trap */
	mov     0x1000, %sp
        save	%sp,	-96,	%sp	/* trap --> cwp+2 */
        nop

!        cmp     %o0,    0	
!        bne,a   diag_fail
!        set     0xffff0003,     %l1

!!----------------------------------
!!  spill_1_normal : tt = 0x84
!!----------------------------------
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
        nop
        /* do a SAVE to cause the trap */
	mov     0x1000, %sp
        save    %sp,    -96,    %sp     /* trap --> cwp+2 */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  spill_5_other : tt = 0xb4
!!----------------------------------
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
        nop
        /* do a RESTORE to cause the fill_n_normal trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

        !cmp     %o0,    0
        !bne,a   diag_fail
        !set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_1_normal : tt = 0xc4
!!----------------------------------
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
        nop
        /* do a RESTORE to cause the fill_n_normal trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

        !cmp     %o0,    0
        !bne,a   diag_fail
        !set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_2_normal : tt = 0xc8
!!----------------------------------
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
        nop
        /* do a RESTORE to cause the fill_n_normal trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

        !cmp     %o0,    0
        !bne,a   diag_fail
        !set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_3_normal : tt = 0xcc
!!----------------------------------
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
        nop
        /* do a RESTORE to cause the fill_n_normal trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

        !cmp     %o0,    0
        !bne,a   diag_fail
        !set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_4_normal : tt = 0xd0
!!----------------------------------
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
        nop
        /* do a RESTORE to cause the fill_n_normal trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

        !cmp     %o0,    0
        !bne,a   diag_fail
        !set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_5_normal : tt = 0xd4
!!----------------------------------
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
        nop
        /* do a RESTORE to cause the fill_n_other trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_3_other : tt = 0xec
!!----------------------------------
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
        nop
        /* do a RESTORE to cause the fill_n_other trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

!        cmp     %o0,    0
!        bne,a   diag_fail
!        set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_6_other : tt = 0xf8
!!----------------------------------
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
        nop
        /* do a RESTORE to cause the fill_n_other trap */
        restore			/* cwp = (cwp-1) module NWINDOW */
        nop

!       cmp     %o0,    0
!       bne,a   diag_fail
!       set     0xffff00e4,     %l1

!!----------------------------------
!!  fill_7_other : tt = 0xfc
!!----------------------------------
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
        nop
        /* do a call to the privileged action */
	call	idaexec_start
	nop

        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
#endif

/*
 *************************************************
 *  Data access exception trap 
 *	load: E=0 P=1 PRIV=0
 *************************************************
 */
        /* enable the trap */
        set     0x30,   %o0     /* Data access exception trap */
        set     0x1,    %o1
        ta      T_HTRAP_EN_N_TIMES
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
        set     0x1,    %o1
        ta      T_HTRAP_EN_N_TIMES
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
        add     %i0,    %i1,    %l7
        add     %l7,    %i2,    %l7

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1
        ta      T_TRAP_EN_N_TIMES
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
