// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: v9_mov.s
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
#define ENABLE_T0_Fp_disabled_0x20

	
#include "boot.s"

.text
.global main
.global sum3

#define INT_IMM11_NEG   0x7ff
#define INT_IMM11_POS   0x3ff
#define INT_IMM11_RSTL  -1
#define INT_IMM10_NEG   0x3ff
#define INT_IMM10_POS   0x1ff
#define INT_IMM10_RSTL  -1

	
main:
	wr %g0, 4, %fprs
/*
 *****************************************************
 *
 *  This diag will test all the V.9 SPARC instructions
 *
 *****************************************************
 */
        /* load the fp data from the memory */
        /* load single fp */
        set     0x0,    %l0
        setx    fps_cvt_nmd1,   %l0,    %l1

        ld      [%l1+%l0],      %f0     /* f0 = 2 * (1+1/2) = 3 */
        add     %l0,    0x4,    %l0

        ld      [%l1+%l0],      %f2     /* f2 = 4 * (1+1/2) = 6 */
        add     %l0,    0x4,    %l0

        ld      [%l1+%l0],      %f4     /* f4 = 8 * (1+1/8) = 9 */
        nop

/*
 **************************************************
 *  Moving Integer Register 
 *	on Floating point Conditions (MOVcc)
 **************************************************
 */
        set     0x2,    %l2
        set     0x3,    %l3
  	set     0x4,    %l4
        set     0x5,    %l5

!!--------------------------
!!      mova %fccn
!!--------------------------
        /*
         * move based on %fcc0 : always 
         */
	fcmps	%fcc0,	%f0,	%f0	/* fcc0 = 0 */
        mova    %fcc0,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should = l3 */
        brnz,a  %l6,    diag_fail
        set     0xeeffff01,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f0,	%f2	/* fcc0 = 1 f0 < f2 */
        mova    %fcc0,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a  %l7,    diag_fail
        set     0xeeffff01,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f2,	%f0	/* fcc0 = 2 f2 > f0 */
        mova    %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a  %l7,    diag_fail
        set     0xeeffff01,     %l1

        /* if Unordered , should mov */
        /* set fcc0 = U */
        set     0x0,    %l0
        setx    ldfsr_sdata,    %l0,    %l2

        set     0xc,    %l0
        ld      [%l2+%l0],      %fsr    /* %fcc0 = 11 unordered */

        add     %l5,    0x0,    %l4     /* reset l4 */
        mova   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a   %l7,    diag_fail
        set     0xeeffff03,     %l1

!!--------------------------
!!      movn %fccn
!!--------------------------
        /*
         * move based on %fcc0 : always not 
         */
	fcmps	%fcc0,	%f0,	%f0	/* fcc0 = 0 */
        movn    %fcc0,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should != l3 */
        brz,a   %l6,    diag_fail
        set     0xeeffff01,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f0,	%f2	/* fcc0 = 1 f0 < f2 */
        movn    %fcc0,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff01,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f2,	%f0	/* fcc0 = 2 f2 > f0 */
        movn    %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff01,     %l1

        /* if Unordered , should not mov */
        /* set fcc0 = U */
        set     0x0,    %l0
        setx    ldfsr_sdata,    %l0,    %l2

        set     0xc,    %l0
        ld      [%l2+%l0],      %fsr    /* %fcc0 = 11 unordered */

        add     %l5,    0x0,    %l4     /* reset l4 */
        movn    %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff03,     %l1

!!--------------------------
!!      movu %fccn
!!--------------------------
        /*
         * move based on %fcc0 : unordered
         */
	fcmps	%fcc0,	%f0,	%f0	/* fcc0 = 0 */
        movu    %fcc0,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should != l3 */
        brz,a   %l6,    diag_fail
        set     0xeeffff03,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f0,	%f2	/* fcc0 = 1 f0 < f2 */
        movu    %fcc0,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff03,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f2,	%f0	/* fcc0 = 2 f2 > f0 */
        movu    %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff03,     %l1

	/* set fcc0 = U */ 
        set     0x0,    %l0
        setx    ldfsr_sdata,    %l0,    %l2

	set	0xc,	%l0
        ld      [%l2+%l0],      %fsr    /* %fcc0 = 11 unordered */

	add     %l5,    0x0,    %l4     /* reset l4 */
        movu    %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a   %l7,    diag_fail
        set     0xeeffff03,     %l1

!!--------------------------
!!      movg %fccn
!!--------------------------
        /*
         * move based on %fcc0 : greater
         */
	fcmps	%fcc0,	%f0,	%f0	/* fcc0 = 0 */
        movg    %fcc0,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should != l3 */
        brz,a   %l6,    diag_fail
        set     0xeeffff04,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f0,	%f2	/* fcc0 = 1 f0 < f2 */
        movg    %fcc0,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff04,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f2,	%f0	/* fcc0 = 2 f2 > f0 */
        movg    %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a   %l7,    diag_fail
        set     0xeeffff04,     %l1

        /* if Unordered , should not mov */
        /* set fcc0 = U */
        set     0x0,    %l0
        setx    ldfsr_sdata,    %l0,    %l2

        set     0xc,    %l0
        ld      [%l2+%l0],      %fsr    /* %fcc0 = 11 unordered */

        add     %l5,    0x0,    %l4     /* reset l4 */
        movg   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff03,     %l1

!!--------------------------
!!      movug %fccn
!!--------------------------
        /*
         * move based on %fcc0 : unordered or greater
         */
	fcmps	%fcc0,	%f0,	%f0	/* fcc0 = 0 */
        movug   %fcc0,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should != l3 */
        brz,a   %l6,    diag_fail
        set     0xeeffff05,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f0,	%f2	/* fcc0 = 1 f0 < f2 */
        movug   %fcc0,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff05,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f2,	%f0	/* fcc0 = 2 f2 > f0 */
        movug   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a   %l7,    diag_fail
        set     0xeeffff05,     %l1

        /* set fcc0 = U */
        set     0x0,    %l0
        setx    ldfsr_sdata,    %l0,    %l2

        set     0xc,    %l0
        ld      [%l2+%l0],      %fsr    /* %fcc0 = 11 unordered */

        add     %l5,    0x0,    %l4     /* reset l4 */
        movug   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a   %l7,    diag_fail
        set     0xeeffff03,     %l1     

!!--------------------------
!!      movl %fccn
!!--------------------------
        /*
         * move based on %fcc0 : less
         */
	fcmps	%fcc0,	%f0,	%f0	/* fcc0 = 0 */
        movl    %fcc0,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should != l3 */
        brz,a   %l6,    diag_fail
        set     0xeeffff05,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f0,	%f2	/* fcc0 = 1 f0 < f2 */
        movl    %fcc0,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a   %l7,    diag_fail
        set     0xeeffff05,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f2,	%f0	/* fcc0 = 2 f2 > f0 */
        movl    %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff05,     %l1

        /* if Unordered , should not mov */
        /* set fcc0 = U */
        set     0x0,    %l0
        setx    ldfsr_sdata,    %l0,    %l2

        set     0xc,    %l0
        ld      [%l2+%l0],      %fsr    /* %fcc0 = 11 unordered */

        add     %l5,    0x0,    %l4     /* reset l4 */
        movl    %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff03,     %l1

!!--------------------------
!!      movul %fccn
!!--------------------------
        /*
         * move based on %fcc0 : less or unordered 
         */
	fcmps	%fcc0,	%f0,	%f0	/* fcc0 = 0 */
        movul   %fcc0,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should != l3 */
        brz,a   %l6,    diag_fail
        set     0xeeffff06,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f0,	%f2	/* fcc0 = 1 f0 < f2 */
        movul   %fcc0,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a   %l7,    diag_fail
        set     0xeeffff06,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f2,	%f0	/* fcc0 = 2 f2 > f0 */
        movul   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff06,     %l1

        /* set fcc0 = U */
        set     0x0,    %l0
        setx    ldfsr_sdata,    %l0,    %l2

        set     0xc,    %l0
        ld      [%l2+%l0],      %fsr    /* %fcc0 = 11 unordered */

        add     %l5,    0x0,    %l4     /* reset l4 */
        movul   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a  %l7,    diag_fail
        set     0xeeffff03,     %l1

!!--------------------------
!!      movlg %fccn
!!--------------------------
        /*
         * move based on %fcc0 : less or greater
         */
	fcmps	%fcc0,	%f0,	%f0	/* fcc0 = 0 */
        movlg   %fcc0,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should != l3 */
        brz,a   %l6,    diag_fail
        set     0xeeffff06,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f0,	%f2	/* fcc0 = 1 f0 < f2 */
        movlg   %fcc0,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a   %l7,    diag_fail
        set     0xeeffff06,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f2,	%f0	/* fcc0 = 2 f2 > f0 */
        movlg   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a   %l7,    diag_fail
        set     0xeeffff06,     %l1

        /* if Unordered , should not mov */
        /* set fcc0 = U */
        set     0x0,    %l0
        setx    ldfsr_sdata,    %l0,    %l2

        set     0xc,    %l0
        ld      [%l2+%l0],      %fsr    /* %fcc0 = 11 unordered */

        add     %l5,    0x0,    %l4     /* reset l4 */
        movlg   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff06,     %l1

!!--------------------------
!!      movne %fccn
!!--------------------------
        /*
         * move based on %fcc0 : less or greater
         */
	fcmps	%fcc0,	%f0,	%f0	/* fcc0 = 0 */
        movne   %fcc0,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should != l3 */
        brz,a   %l6,    diag_fail
        set     0xeeffff07,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f0,	%f2	/* fcc0 = 1 f0 < f2 */
        movne   %fcc0,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a   %l7,    diag_fail
        set     0xeeffff07,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f2,	%f0	/* fcc0 = 2 f2 > f0 */
        movne   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a   %l7,    diag_fail
        set     0xeeffff07,     %l1

	/* if Unordered , should mov */ 
        /* set fcc0 = U */
        set     0x0,    %l0
        setx    ldfsr_sdata,    %l0,    %l2

        set     0xc,    %l0
        ld      [%l2+%l0],      %fsr    /* %fcc0 = 11 unordered */

        add     %l5,    0x0,    %l4     /* reset l4 */
        movne   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a   %l7,    diag_fail
        set     0xeeffff07,     %l1

!!--------------------------
!!      move %fccn
!!--------------------------
        /*
         * move based on %fcc0 : less or greater
         */
	fcmps	%fcc0,	%f0,	%f0	/* fcc0 = 0 */
        move   %fcc0,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should = l3 */
        brnz,a   %l6,    diag_fail
        set     0xeeffff08,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f0,	%f2	/* fcc0 = 1 f0 < f2 */
        move   %fcc0,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff08,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f2,	%f0	/* fcc0 = 2 f2 > f0 */
        move   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff08,     %l1

	/* if Unordered , should not mov */ 
        /* set fcc0 = U */
        set     0x0,    %l0
        setx    ldfsr_sdata,    %l0,    %l2

        set     0xc,    %l0
        ld      [%l2+%l0],      %fsr    /* %fcc0 = 11 unordered */

        add     %l5,    0x0,    %l4     /* reset l4 */
        move   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff08,     %l1

!!--------------------------
!!      movue %fccn
!!--------------------------
        /*
         * movue based on %fcc0 : less or greater
         */
	fcmps	%fcc0,	%f0,	%f0	/* fcc0 = 0 */
        movue   %fcc0,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should = l3 */
        brnz,a   %l6,    diag_fail
        set     0xeeffff08,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f0,	%f2	/* fcc0 = 1 f0 < f2 */
        movue   %fcc0,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff08,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f2,	%f0	/* fcc0 = 2 f2 > f0 */
        movue   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff08,     %l1

	/* if Unordered , should mov */ 
        /* set fcc0 = U */
        set     0x0,    %l0
        setx    ldfsr_sdata,    %l0,    %l2

        set     0xc,    %l0
        ld      [%l2+%l0],      %fsr    /* %fcc0 = 11 unordered */

        add     %l5,    0x0,    %l4     /* reset l4 */
        movue   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a   %l7,    diag_fail
        set     0xeeffff08,     %l1

!!--------------------------
!!      movge %fccn
!!--------------------------
        /*
         * movge based on %fcc0 : equal or greater
         */
	fcmps	%fcc0,	%f0,	%f0	/* fcc0 = 0 */
        movge   %fcc0,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should = l3 */
        brnz,a   %l6,    diag_fail
        set     0xeeffff09,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f0,	%f2	/* fcc0 = 1 f0 < f2 */
        movge   %fcc0,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff09,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f2,	%f0	/* fcc0 = 2 f2 > f0 */
        movge   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a   %l7,    diag_fail
        set     0xeeffff09,     %l1

	/* if Unordered , should not mov */ 
        /* set fcc0 = U */
        set     0x0,    %l0
        setx    ldfsr_sdata,    %l0,    %l2

        set     0xc,    %l0
        ld      [%l2+%l0],      %fsr    /* %fcc0 = 11 unordered */

        add     %l5,    0x0,    %l4     /* reset l4 */
        movge   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff09,     %l1

!!--------------------------
!!      movuge %fccn
!!--------------------------
        /*
         * movuge based on %fcc0 : equal or greater or unordered 
         */
	fcmps	%fcc0,	%f0,	%f0	/* fcc0 = 0 */
        movuge   %fcc0,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should = l3 */
        brnz,a   %l6,    diag_fail
        set     0xeeffff09,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f0,	%f2	/* fcc0 = 1 f0 < f2 */
        movuge   %fcc0,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff09,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f2,	%f0	/* fcc0 = 2 f2 > f0 */
        movuge   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a   %l7,    diag_fail
        set     0xeeffff09,     %l1

	/* if Unordered , should mov */ 
        /* set fcc0 = U */
        set     0x0,    %l0
        setx    ldfsr_sdata,    %l0,    %l2

        set     0xc,    %l0
        ld      [%l2+%l0],      %fsr    /* %fcc0 = 11 unordered */

        add     %l5,    0x0,    %l4     /* reset l4 */
        movuge   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a   %l7,    diag_fail
        set     0xeeffff09,     %l1

!!--------------------------
!!      movle %fccn
!!--------------------------
        /*
         * movle based on %fcc0 : equal or less
         */
	fcmps	%fcc0,	%f0,	%f0	/* fcc0 = 0 */
        movle   %fcc0,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should = l3 */
        brnz,a   %l6,    diag_fail
        set     0xeeffff09,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f0,	%f2	/* fcc0 = 1 f0 < f2 */
        movle   %fcc0,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a   %l7,    diag_fail
        set     0xeeffff09,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f2,	%f0	/* fcc0 = 2 f2 > f0 */
        movle   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff09,     %l1

	/* if Unordered , should not mov */ 
        /* set fcc0 = U */
        set     0x0,    %l0
        setx    ldfsr_sdata,    %l0,    %l2

        set     0xc,    %l0
        ld      [%l2+%l0],      %fsr    /* %fcc0 = 11 unordered */

        add     %l5,    0x0,    %l4     /* reset l4 */
        movle   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff09,     %l1

!!--------------------------
!!      movule %fccn
!!--------------------------
        /*
         * movule based on %fcc0 : equal or less or unordered 
         */
	fcmps	%fcc0,	%f0,	%f0	/* fcc0 = 0 */
        movule   %fcc0,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should = l3 */
        brnz,a   %l6,    diag_fail
        set     0xeeffff09,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f0,	%f2	/* fcc0 = 1 f0 < f2 */
        movule   %fcc0,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a   %l7,    diag_fail
        set     0xeeffff09,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f2,	%f0	/* fcc0 = 2 f2 > f0 */
        movule   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff09,     %l1

	/* if Unordered , should mov */ 
        /* set fcc0 = U */
        set     0x0,    %l0
        setx    ldfsr_sdata,    %l0,    %l2

        set     0xc,    %l0
        ld      [%l2+%l0],      %fsr    /* %fcc0 = 11 unordered */

        add     %l5,    0x0,    %l4     /* reset l4 */
        movule   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a   %l7,    diag_fail
        set     0xeeffff09,     %l1

!!--------------------------
!!      movo %fccn
!!--------------------------
        /*
         * move based on %fcc0 : less or greater
         */
	fcmps	%fcc0,	%f0,	%f0	/* fcc0 = 0 */
        movo   %fcc0,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should = l3 */
        brnz,a   %l6,    diag_fail
        set     0xeeffff06,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f0,	%f2	/* fcc0 = 1 f0 < f2 */
        movo   %fcc0,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a   %l7,    diag_fail
        set     0xeeffff06,     %l1

	add     %l5,    0x0,    %l4     /* reset l4 */
	fcmps	%fcc0,	%f2,	%f0	/* fcc0 = 2 f2 > f0 */
        movo   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a   %l7,    diag_fail
        set     0xeeffff06,     %l1

        /* if Unordered , should not mov */
        /* set fcc0 = U */
        set     0x0,    %l0
        setx    ldfsr_sdata,    %l0,    %l2

        set     0xc,    %l0
        ld      [%l2+%l0],      %fsr    /* %fcc0 = 11 unordered */

        add     %l5,    0x0,    %l4     /* reset l4 */
        movo   %fcc0,   INT_IMM11_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM11_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeffff06,     %l1
/*
 ***************************************
 *  Moving Integer Register
 *      on Register Conditions (MOVR)
 ***************************************
 */

!!--------------------------
!!      movrne
!!--------------------------
        set     0x3,    %l3
        set     0x4,    %l4
        set     0x5,    %l5

        set     0x0,    %l2     /* r = 0 */
        movrne  %l2,    %l3,    %l4     /* l4 should != l3 */
        sub     %l4,    %l3,    %l6
        brz,a   %l6,    diag_fail
        set     0xeeffee01,     %l1

        sub     %l2,    2,      %l2     /* r < 0 */
        add     %l5,    0x0,    %l4     /* reset l4 */
        movrne  %l2,    %l3,    %l4     /* l4 should = l3 */
        sub     %l4,    %l3,    %l6
        brnz,a  %l6,    diag_fail
        set     0xeeffee01,     %l1

        add     %l2,    3,      %l2     /* r > 0 */
        movrne  %l2,   INT_IMM10_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM10_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a  %l7,    diag_fail
        set     0xeeffee01,     %l1

        add     %l5,    0x0,    %l4     /* reset l4 */
        movrne  %l2,    INT_IMM10_POS, %l4
        set     INT_IMM10_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a  %l7,    diag_fail
        set     0xeeffee01,     %l1

!!--------------------------
!!      movre
!!--------------------------
        set     0x0,    %l2     /* r = 0 */
        add     %l5,    0x0,    %l4     /* reset l4 */

        movre   %l2,    %l3,    %l4     /* l4 should = l3 */
        sub     %l4,    %l3,    %l6
        brnz,a  %l6,    diag_fail
        set     0xeeffee02,     %l1

        sub     %l2,    2,      %l2     /* r < 0 */
        add     %l5,    0x0,    %l4     /* reset l4 */
        movre   %l2,    %l3,    %l4     /* l4 should != l3 */
        sub     %l4,    %l3,    %l6
        brz,a   %l6,    diag_fail
        set     0xeeffee02,     %l1

        add     %l2,    3,      %l2     /* r > 0 */
        movre   %l2,   INT_IMM10_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM10_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a  %l7,    diag_fail
        set     0xeeffee02,     %l1

        add     %l5,    0x0,    %l4     /* reset l4 */
        movre   %l2,    INT_IMM10_POS, %l4
        set     INT_IMM10_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a  %l7,    diag_fail
        set     0xeeffee02,     %l1

!!--------------------------
!!      movrgez
!!--------------------------
        set     0x3,    %l3
        set     0x4,    %l4
        set     0x5,    %l5

        set     0x0,    %l2     /* r = 0 */
        movrgez %l2,    %l3,    %l4     /* l4 should = l3 */
        sub     %l4,    %l3,    %l6
        brnz,a  %l6,    diag_fail
        set     0xeeffee02,     %l1

        sub     %l2,    2,      %l2     /* r < 0 */
        add     %l5,    0x0,    %l4     /* reset l4 */
        movrgez %l2,    %l3,    %l4     /* l4 should != l3 */
        sub     %l4,    %l3,    %l6
        brz,a   %l6,    diag_fail
        set     0xeeffee02,     %l1

        add     %l2,    3,      %l2     /* r > 0 */
        movrgez  %l2,   INT_IMM10_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM10_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a  %l7,    diag_fail
        set     0xeeffee02,     %l1

        add     %l5,    0x0,    %l4     /* reset l4 */
        movrgez  %l2,    INT_IMM10_POS, %l4
        set     INT_IMM10_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a  %l7,    diag_fail
        set     0xeeffee02,     %l1

!!--------------------------
!!      movrlz
!!--------------------------
        set     0x3,    %l3
        set     0x4,    %l4
        set     0x5,    %l5

        set     0x0,    %l2     /* r = 0 */
        movrlz  %l2,    %l3,    %l4     /* l4 should != l3 */
        sub     %l4,    %l3,    %l6
        brz,a   %l6,    diag_fail
        set     0xeeffee03,     %l1

        sub     %l2,    2,      %l2     /* r < 0 */
        add     %l5,    0x0,    %l4     /* reset l4 */
        movrlz  %l2,    %l3,    %l4     /* l4 should = l3 */
        sub     %l4,    %l3,    %l6
        brnz,a  %l6,    diag_fail
        set     0xeeffee03,     %l1

        add     %l2,    3,      %l2     /* r > 0 */
        movrlz  %l2,   INT_IMM10_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM10_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a  %l7,    diag_fail
        set     0xeeffee03,     %l1

        add     %l5,    0x0,    %l4     /* reset l4 */
        movrlz  %l2,    INT_IMM10_POS, %l4
        set     INT_IMM10_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a  %l7,    diag_fail
        set     0xeeffee03,     %l1

!!--------------------------
!!      movrlez
!!--------------------------
        set     0x3,    %l3
        set     0x4,    %l4
        set     0x5,    %l5

        set     0x0,    %l2     /* r = 0 */
        movrlez %l2,    %l3,    %l4     /* l4 should = l3 */
        sub     %l4,    %l3,    %l6
        brnz,a  %l6,    diag_fail
        set     0xeeffee04,     %l1

        sub     %l2,    2,      %l2     /* r < 0 */
        add     %l5,    0x0,    %l4     /* reset l4 */
        movrlez %l2,    %l3,    %l4     /* l4 should = l3 */
        sub     %l4,    %l3,    %l6
        brnz,a  %l6,    diag_fail
        set     0xeeffee04,     %l1

        add     %l2,    3,      %l2     /* r > 0 */
        movrlez  %l2,   INT_IMM10_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM10_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a  %l7,    diag_fail
        set     0xeeffee04,     %l1

        set     0x0,    %l2
        add     %l5,    0x0,    %l4     /* reset l4 */
        movrlez  %l2,    INT_IMM10_POS, %l4
        set     INT_IMM10_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a  %l7,    diag_fail
        set     0xeeffee04,     %l1

!!--------------------------
!!      movrgz
!!--------------------------
        set     0x3,    %l3
        set     0x4,    %l4
        set     0x5,    %l5

        set     0x0,    %l2     /* r = 0 */
        movrgz  %l2,    %l3,    %l4     /* l4 should != l3 */
        sub     %l4,    %l3,    %l6
        brz,a   %l6,    diag_fail
        set     0xeeffee05,     %l1

        sub     %l2,    2,      %l2     /* r < 0 */
        add     %l5,    0x0,    %l4     /* reset l4 */
        movrgz  %l2,    %l3,    %l4     /* l4 should != l3 */
        sub     %l4,    %l3,    %l6
        brz,a   %l6,    diag_fail
        set     0xeeffee05,     %l1

        add     %l2,    3,      %l2     /* r > 0 */
        movrgz  %l2,   INT_IMM10_NEG, %l4        /* l4 is sign extended */
        set     0x0,    %l0
        setx    INT_IMM10_RSTL,   %l0,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a  %l7,    diag_fail
        set     0xeeffee05,     %l1

        set     0x1,    %l2
        add     %l5,    0x0,    %l4     /* reset l4 */
        movrgz  %l2,    INT_IMM10_POS, %l4
        set     INT_IMM10_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a  %l7,    diag_fail
        set     0xeeffee05,     %l1

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

sum3:
        save    %sp,    -96,    %sp
        add     %i0,    %i1,    %l7
        add     %l7,    %i2,    %l7
        ret     /* this is equal to : jmpl [%i7 + 8], %g0 */
        restore %l7,    0,      %o0     /* move result to the out reg */

.data	

ldint_1:	.word	0x55aa11bb
		.word	0xaa5577ff
		.word	0x77aa55bb
		.word	0xaa55ff44

fst_data:       .xword  0x700f000000000000
                .xword  0x700f000000000000
                .xword  0x700ff00000000000
                .xword  0x700ff00000000000

stfsr_sdata:    .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000

stfsr_ddata:    .xword  0x0000000000000000
                .xword  0x0000000000000000
                .xword  0x0000000000000000
                .xword  0x0000000000000000

stfps_nmdata:   .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000

stfpd_nmdata:   .xword  0x0000000000000000
                .xword  0x0000000000000000
                .xword  0x0000000000000000
                .xword  0x0000000000000000

stint_1:        .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000

stint_asi1:     .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000

stint_asi2:     .word   0x00000000
                .word   0x00000000
                .word   0x00000000
                .word   0x00000000


ldfsr_sdata:    .word   0x00000800
                .word   0x00000400
                .word   0x00000000
                .word   0x00000c00

ldfsr_ddata:    .xword  0x0000000000000800
                .xword  0x0000000000000400
                .xword  0x0000000000000000
                .xword  0x0000000000000c00

fps_data:       .word   0x00200000
                .word   0x00400000
                .word   0x00600000
                .word   0x00a00000

fps_nmdata:     .word   0x70200000
                .word   0x70400000
                .word   0x70b00000
                .word   0x70b00000

fpd_data:       .xword  0x0002000000000000
                .xword  0x0004000000000000
                .xword  0x0006000000000000
                .xword  0x0008000000000000

fpd_nmdata:     .xword  0x7002000000000000
                .xword  0x7004000000000000
                .xword  0x700b000000000000
                .xword  0x700b000000000000

fpquad_data:    .xword  0x0000200000000000
                .xword  0x0000000000000000
                .xword  0x0000400000000000
                .xword  0x0000000000000000
                .xword  0x0000600000000000
                .xword  0x0000000000000000
                .xword  0x0000800000000000
                .xword  0x0000000000000000

fpquad_nmdata:  .xword  0x7000200000000000
                .xword  0x0000000000000000
                .xword  0x7000400000000000
                .xword  0x0000000000000000
                .xword  0x7000b00000000000
                .xword  0x0000000000000000
                .xword  0x7000b00000000000
                .xword  0x0000000000000000

fps_cvt_data1:	.word	0x00200000
		.word	0x00400000
		.word	0x00600000
		.word	0x00a00000

fps_cvt_nmd1:	.word	0x40400000	/* 3 */
		.word	0x40c00000	/* 6 */
		.word	0x41100000	/* 9 */
		.word	0x42100000	/* 36 */ 

fpd_cvt_data1:	.xword 	0x0002000000000000
		.xword 	0x0004000000000000
		.xword 	0x0006000000000000
		.xword 	0x0008000000000000

fpd_cvt_nmd1:	.xword 	0x4008000000000000	/* 3 */
		.xword 	0x4018000000000000	/* 6 */
		.xword 	0x4022000000000000	/* 9 */
		.xword 	0x4042000000000000	/* 36 */

int2fps_nmd1: 	.word	0x00000003
		.word	0x00000006
		.word	0x00000009
		.word	0x00000000

int2fpd_nmd1: 	.xword	0x0000000000000003
		.xword	0x0000000000000006
		.xword	0x0000000000000009
		.xword	0x0000000000000000

fps_muldv_nmd1:	.word	0x40400000	/* 3 */
		.word	0x40c00000	/* 6 */
		.word	0x41900000	/* 18 = 16*(1+1/8) */
		.word	0x42100000	/* 36 */

fpd_muldv_nmd1:	.xword 	0x4008000000000000	/* 3 */
		.xword 	0x4018000000000000	/* 6 */
		.xword 	0x4032000000000000	/* 18 */
		.xword 	0x4042000000000000	/* 36 */	 

fps_sqr_nmd1:	.word	0x40400000	/* 3 */
		.word	0x40c00000	/* 6 */
		.word	0x41100000	/* 9 = 8*(1+1/8) */
		.word	0x42100000	/* 36 = 32*(1+1/8) */

fpd_sqr_nmd1:	.xword 	0x4008000000000000	/* 3 */
		.xword 	0x4018000000000000	/* 6 */
		.xword 	0x4022000000000000	/* 9 */
		.xword 	0x4042000000000000	/* 36 */	 

.end
