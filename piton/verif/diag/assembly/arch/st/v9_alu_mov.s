// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: v9_alu_mov.s
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

main:
	wr %g0, 4, %fprs
/*
 *****************************************************
 *
 *  This diag will test all the V.9 SPARC instructions
 *
 *****************************************************
 */

/*
 ********************************
 *	Logical Operations
 ********************************
 */
!!---------------
!! 	and
!!---------------
	set	0x0,	%l0	
	setx	0xa5aaff55aa5555ff, %l0, %l3 
	setx	0xaa5511aa55aaaa22, %l0, %l2

	and	%l3,	%l2,	%l4
	setx	0xa000110000000022, %l0, %l5
	sub	%l4,	%l5,	%l6
	brnz	%l6,	diag_fail
	set	0xffff0001,	%l1

!!-------------	
!! andcc
!!-------------	
	andcc	%l3,	%l2,	%l4	/* xcc.n set */
	bneg	%xcc,	next_andcc1
	nop

	ba	diag_fail
	set	0xffff0002,	%l1

next_andcc1:
	set	0xf0000000,	%l1
	set	0x80000000,	%l2

	andcc	%l2,	%l1,	%l3	/* icc.n set */
	bneg	%icc,	Test_andn
	nop

	ba	diag_fail
	set	0xffff0003,	%l1

!!-----------------	
!! andn , andncc
!!-----------------	
Test_andn:
	set	0x0,	%l0
	setx	0xffff5555aaaa5555, %l0, %l3	
	setx	0x7fff5555aaaa5555, %l0, %l2	
	andn	%l3,	%l2,	%l4
	nop

	setx	0x8000000000000000, %l0, %l5
	sub	%l5,	%l4,	%l6
	brnz,a	%l6,	diag_fail
	set	0xffff0004,	%l1

	andncc	%l3,	%l2,	%l4	/* xcc.n set */
	nop

	bneg	%xcc,	next_andncc1
	nop

	ba	diag_fail
	set	0xffff0004,	%l1

next_andncc1:
	set	0x811155ff,	%l0
	set	0x7fff5454,	%l1

	andn	%l0,	%l1,	%l2

	set	0x800001ab,	%l3

	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffff0004,	%l1

	andncc	%l0,	%l1,	%l2	/* icc.n set */
	bneg	%icc,	Test_or
	nop

	ba,a	diag_fail
	set	0xffff0004,	%l1

Test_or:
!!-------------	
!! or
!!-------------	
	set	0x0,	%l0
	setx	0xffff5555aaaa5555, %l0, %l3	
	setx	0xffffaaaa5555aaaa, %l0, %l2	

	or	%l3,	%l2,	%l4
	setx	0xffffffffffffffff, %l0, %l5
	sub	%l4,	%l5,	%l6
	brnz,a	%l6,	diag_fail
	set	0xffff0005,	%l1

!!-------------	
!!  ORcc
!!-------------	
	orcc	%l3,	%l2,	%l4	/* xcc.n set */
	bneg	%xcc,	next_orcc1
	nop

	ba	diag_fail
	set	0xffff0006,	%l1

next_orcc1:
	set	0xf0000000,	%l2
	set	0x0,	%l3

	orcc	%l2,	%l3,	%l4
	sub	%l4,	%l2,	%l5
	brnz,a 	%l5,	diag_fail
	set	0xffff0006,	%l1

	bneg	%icc,	Test_orn
	nop

	ba	diag_fail
	set	0xffff0006,	%l1

Test_orn:	
!!-------------	
!! orn
!!-------------	
	set	0x0,	%l0
	setx	0x0fff5555aaaa5555, %l0, %l3	
	setx	0x7fffaaaa5555aaaa, %l0, %l2	

	orn	%l3,	%l2,	%l4
	setx	0x8fff5555aaaa5555, %l0, %l5

	sub	%l4,	%l5,	%l6
	brnz,a	%l6,	diag_fail
	set	0xffff0007,	%l1

!!-------------	
!!  ORNcc
!!-------------	
	set	0x0,	%l4
	orncc	%l3,	%l2,	%l4	/* xcc.n set */

	bneg	%xcc,	next_orncc1
	nop

	ba	diag_fail
	set	0xffff0004,	%l1

next_orncc1:
	set	0x70000000,	%l2
	set	0x7fffffff,	%l3

	set	0x0,	%l4
	orncc	%l2,	%l3,	%l4
	set	0x0,	%l0
	setx	0xfffffffff0000000, %l0, %l6

	sub	%l4,	%l6,	%l5
	brnz,a 	%l5,	diag_fail
	set	0xffff0006,	%l1

	bneg	%icc,	Test_xor
	nop

	ba	diag_fail
	set	0xffff0004,	%l1

Test_xor:
!!-------------	
!! xor
!!-------------	
	set	0x0,	%l0
	setx	0xffff5555aaaa5555, %l0, %l3	
	setx	0x7fffaaaa5555aaaa, %l0, %l2	

	xor	%l3,	%l2,	%l4
	setx	0x8000ffffffffffff, %l0, %l5

	sub	%l4,	%l5,	%l6
	brnz,a	%l6,	diag_fail
	set	0xffff0007,	%l1

!!------------
!!  xorcc
!!------------
	set	0x0,	%l4
	xorcc	%l3,	%l2,	%l4

	setx	0x8000ffffffffffff, %l0, %l5

	sub	%l4,	%l5,	%l6
	brnz,a	%l6,	diag_fail
	set	0xffff0007,	%l1

	bneg	%xcc,	next_xorcc1
	nop

	ba	diag_fail
	set	0xffff0008,	%l1

next_xorcc1:
	set	0xffff5555,	%l3
	set	0x7fffaaaa,	%l4
	xorcc	%l3,	%l4,	%l5	/* icc.n set */
	set	0x8000ffff,	%l6
	sub	%l6,	%l5,	%l6

	brnz,a	%l6,	diag_fail
	set	0xffff0007,	%l1

	bneg	%icc,	Test_xnor
	nop	

	ba	diag_fail
	set	0xffff0008,	%l1

Test_xnor:
!!-------------	
!! xnor
!!-------------	
	set	0x0,	%l0
	setx	0xffff5555aaaa5555, %l0, %l3	
	setx	0xffffaaaa5555aaaa, %l0, %l2	

	xnor	%l3,	%l2,	%l4
	setx	0xffff000000000000, %l0, %l5

	sub	%l4,	%l5,	%l6
	brnz,a	%l6,	diag_fail
	set	0xffff0009,	%l1

!!------------
!!  xnorcc
!!------------
	set	0x0,	%l4
	xnorcc	%l3,	%l2,	%l4

	setx	0xffff000000000000, %l0, %l5

	sub	%l4,	%l5,	%l6
	brnz,a	%l6,	diag_fail
	set	0xffff000a,	%l1

	bneg	%xcc,	next_xnorcc1
	nop

	ba	diag_fail
	set	0xffff000a,	%l1

next_xnorcc1:
	set	0xffff5555,	%l3
	set	0xffffaaaa,	%l4
	xnorcc	%l3,	%l4,	%l5	/* icc.n set */

	set	0x0,	%l0
	setx	0xffffffffffff0000, %l0, %l6
	sub	%l6,	%l5,	%l7

	brnz,a	%l7,	diag_fail
	set	0xffff000a,	%l1

	bneg	%icc,	next_xnorcc2
	nop	

	ba	diag_fail
	set	0xffff000a,	%l1

next_xnorcc2:
	nop
/*
 ***************************************
 *  Moving Floating-Point register 
 *	on Condition (FMOV_fcc0)
 ***************************************
 */
	/* load the fp data from the memory */
	/* load single fp */ 
        set     0x0,    %l0
        setx    fps_cvt_nmd1,   %l0,    %l1

        ld      [%l1+%l0],      %f0     /* f0 = 2 * (1+1/2) */
        add     %l0,    0x4,    %l0

        ld      [%l1+%l0],      %f2     /* f2 = 4 * (1+1/2) */
        add     %l0,    0x4,    %l0

        ld      [%l1+%l0],      %f4     /* f4 = 8 * (1+1/8) */

	/* load double fp */
        set     0x0,    %l0
        setx    fpd_cvt_nmd1,   %l0,    %l1

        ldd     [%l1+%l0],      %f6     /* f6 = 2 * (1+1/2) */
        add     %l0,    0x8,    %l0

        ldd     [%l1+%l0],      %f8     /* f8 = 4 * (1+1/2) */
        add     %l0,    0x8,    %l0

        ldd     [%l1+%l0],      %f10     /* f10 = 8 * (1+1/8) */
        add     %l0,    0x8,    %l0

        ldd     [%l1+%l0],      %f12     /* f12 = 32 * (1+1/8) = 36 */
	nop

        ldd     [%l1+%l0],      %f14     /* f14 = 36 */
	nop

        ldd     [%l1+%l0],      %f16     /* f16 = 36 */
	nop

!!----------------------
!!  fmov{s,d,q}a
!!----------------------
	/* move single always */
	fcmps	%fcc0,	%f2,	%f0	/* f2 > f0 */
	fmovsa	%fcc0,	%f2,	%f12	/* fcc0 = 2 */	

	fcmps	%fcc0,	%f12,	%f2	/* f12 should = f2 */
	fbne,a	%fcc0,	diag_fail	
	set	0xffff0001,	%l1

	fmovsa	%fcc0,	%f12,	%f14	/* f14 = f2 = f12 */	
					/* fcc0 = 0 */
	fcmps	%fcc0,	%f14,	%f2	/* f12 should = f2 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff0001,	%l1
	
	fcmps	%fcc0,	%f0,	%f2	/* f0 < f2 */
					/* fcc0 = 1 */
	fmovsa	%fcc0,	%f2,	%f12	
	fcmps	%fcc0,	%f12,	%f2	/* f12 should = f2 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff0001,	%l1

	/* move double always */
	fcmpd	%fcc0,	%f8,	%f6	/* f8 > f6 */
	fmovda	%fcc0,	%f8,	%f12	/* fcc0 = 2 */	

	fcmpd	%fcc0,	%f12,	%f8	/* f12 should = f8 */
	fbne,a	%fcc0,	diag_fail	
	set	0xffff6001,	%l1

	fmovda	%fcc0,	%f12,	%f14	/* f14 = f8 = f12 */	
					/* fcc0 = 0 */
	fcmpd	%fcc0,	%f14,	%f8	/* f12 should = f8 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff6001,	%l1
	
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fcmpd	%fcc0,	%f6,	%f8	/* f6 < f8 */
					/* fcc0 = 1 */
	fmovda	%fcc0,	%f8,	%f12	
	fcmpd	%fcc0,	%f12,	%f8	/* f12 should = f8 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff6001,	%l1

!!----------------------
!!  fmov{s,d,q}n
!!----------------------
	/* move single never */
	fcmps	%fcc0,	%f2,	%f0	/* f2 > f0 */
	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fmovsa	%fcc0,	%f2,	%f14	/* f14 = f2 > f0 */

	fmovsn	%fcc0,	%f2,	%f12	/* fcc0 = 2 */	

	fcmps	%fcc0,	%f12,	%f2	/* f12 should != f2 */
	fbe,a	%fcc0,	diag_fail	
	set	0xffff0002,	%l1

	fcmps	%fcc0,	%f12,	%f4	/* f12 = f4 , fcc0 = 0 */
	fmovsn	%fcc0,	%f12,	%f14	/* f14 != f12 */
					/* fcc0 = 0 */
	fcmps	%fcc0,	%f14,	%f12	/* f12 != f14 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff0002,	%l1
	
	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f0,	%f2	/* f0 < f2 */
					/* fcc0 = 1 */
	fmovsn	%fcc0,	%f2,	%f12	
	fcmps	%fcc0,	%f12,	%f2	/* f12 should != f2 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff0002,	%l1

	/* move double never */
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fmovda	%fcc0,	%f16,	%f14	/* reset f12 & f14 */

	fcmpd	%fcc0,	%f8,	%f6	/* f8 > f6 */
	fmovdn	%fcc0,	%f8,	%f12	/* fcc0 = 2 */	

	fcmpd	%fcc0,	%f12,	%f8	/* f12 should != f8 */
	fbe,a	%fcc0,	diag_fail	
	set	0xffff6002,	%l1

	fmovda	%fcc0,	%f10,	%f12	/* f12 = f10 */
	fcmpd	%fcc0,	%f14,	%f16 	/* fcc0 = 0 */

	fmovdn	%fcc0,	%f12,	%f14	/* f14 != (f8 = f12) */	
	fcmpd	%fcc0,	%f14,	%f12	/* f14 should != f12 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff6002,	%l1
	
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fcmpd	%fcc0,	%f6,	%f8	/* f6 < f8 */
					/* fcc0 = 1 */
	fmovdn	%fcc0,	%f8,	%f12	
	fcmpd	%fcc0,	%f12,	%f8	/* f12 should ! = f8 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff6002,	%l1

!!----------------------
!!  fmov{s,d,q}u
!!----------------------
	/* move single never */
	fcmps	%fcc0,	%f2,	%f0	/* f2 > f0 */
	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fmovsa	%fcc0,	%f2,	%f14	/* f14 = f2 > f0 */

	fmovsu	%fcc0,	%f2,	%f12	/* fcc0 = 2 */	

	fcmps	%fcc0,	%f12,	%f2	/* f12 should != f2 */
	fbe,a	%fcc0,	diag_fail	
	set	0xffff0003,	%l1

	fcmps	%fcc0,	%f12,	%f4	/* f12 = f4 , fcc0 = 0 */
	fmovsu	%fcc0,	%f12,	%f14	/* f14 != f12 */
					/* fcc0 = 0 */
	fcmps	%fcc0,	%f14,	%f12	/* f12 != f14 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff0003,	%l1
	
	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f0,	%f2	/* f0 < f2 */
					/* fcc0 = 1 */
	fmovsu	%fcc0,	%f2,	%f12	
	fcmps	%fcc0,	%f12,	%f2	/* f12 should != f2 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff0003,	%l1

	/* move double never */
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fmovda	%fcc0,	%f16,	%f14	/* reset f12 & f14 */

	fcmpd	%fcc0,	%f8,	%f6	/* f8 > f6 */
	fmovdu	%fcc0,	%f8,	%f12	/* fcc0 = 2 */	

	fcmpd	%fcc0,	%f12,	%f8	/* f12 should != f8 */
	fbe,a	%fcc0,	diag_fail	
	set	0xffff6003,	%l1

	fmovda	%fcc0,	%f10,	%f12	/* f12 = f10 */
	fcmpd	%fcc0,	%f14,	%f16 	/* fcc0 = 0 */
	fmovdu	%fcc0,	%f12,	%f14	/* f14 != (f8 = f12) */	
	fcmpd	%fcc0,	%f14,	%f12	/* f14 should != f12 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff6003,	%l1
	
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fcmpd	%fcc0,	%f6,	%f8	/* f6 < f8 */
					/* fcc0 = 1 */
	fmovdu	%fcc0,	%f8,	%f12	
	fcmpd	%fcc0,	%f12,	%f8	/* f12 should ! = f8 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff6003,	%l1

	/* TBD : fmovdu, fmovsu : when unordered */

!!----------------------
!!  fmov{s,d,q}g
!!----------------------
	/* move single when greater */
	fcmps	%fcc0,	%f2,	%f0	/* f2 > f0 */

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fmovsa	%fcc0,	%f2,	%f14	/* f14 = f2 > f0 */

	fmovsg	%fcc0,	%f2,	%f12	/* fcc0 = 2 */	

	fcmps	%fcc0,	%f12,	%f2	/* f12 should = f2 */
	fbne,a	%fcc0,	diag_fail	
	set	0xffff0004,	%l1

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f12,	%f4	/* f12 = f4 , fcc0 = 0 */

	fmovsg	%fcc0,	%f12,	%f14	/* f14 != f12 */
					/* fcc0 = 0 */
	fcmps	%fcc0,	%f14,	%f12	/* f12 != f14 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff0004,	%l1
	
	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f0,	%f2	/* f0 < f2 */
					/* fcc0 = 1 */
	fmovsg	%fcc0,	%f2,	%f12	
	fcmps	%fcc0,	%f12,	%f2	/* f12 should != f2 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff0004,	%l1

	/* move double when greater */
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fmovda	%fcc0,	%f16,	%f14	/* reset f12 & f14 */

	fcmpd	%fcc0,	%f8,	%f6	/* f8 > f6 */
	fmovdg	%fcc0,	%f8,	%f12	/* fcc0 = 2 */	

	fcmpd	%fcc0,	%f12,	%f8	/* f12 should = f8 */
	fbne,a	%fcc0,	diag_fail	
	set	0xffff6004,	%l1

	fmovda	%fcc0,	%f10,	%f12	/* f12 = f10 */
	fcmpd	%fcc0,	%f14,	%f16 	/* fcc0 = 0 */
	fmovdg	%fcc0,	%f12,	%f14	/* f14 != (f8 = f12) */	

	fcmpd	%fcc0,	%f14,	%f12	/* f14 should != f12 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff6004,	%l1
	
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fcmpd	%fcc0,	%f6,	%f8	/* f6 < f8 */
					/* fcc0 = 1 */
	fmovdg	%fcc0,	%f8,	%f12	
	fcmpd	%fcc0,	%f12,	%f8	/* f12 should ! = f8 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff6004,	%l1

!!----------------------
!!  fmov{s,d,q}ug
!!----------------------
	/* move single when unordered or greater */
	fcmps	%fcc0,	%f2,	%f0	/* f2 > f0 */

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fmovsa	%fcc0,	%f2,	%f14	/* f14 = f2 > f0 */

	fmovsug	%fcc0,	%f2,	%f12	/* fcc0 = 2 */	

	fcmps	%fcc0,	%f12,	%f2	/* f12 should = f2 */
	fbne,a	%fcc0,	diag_fail	
	set	0xffff0005,	%l1

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f12,	%f4	/* f12 = f4 , fcc0 = 0 */
	fmovsug	%fcc0,	%f12,	%f14	/* f14 != f12 */
					/* fcc0 = 0 */
	fcmps	%fcc0,	%f14,	%f12	/* f12 != f14 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff0005,	%l1
	
	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f0,	%f2	/* f0 < f2 */
					/* fcc0 = 1 */
	fmovsug	%fcc0,	%f2,	%f12	
	fcmps	%fcc0,	%f12,	%f2	/* f12 should != f2 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff0005,	%l1

	/* move double when unordered or greater */
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fmovda	%fcc0,	%f16,	%f14	/* reset f12 & f14 */

	fcmpd	%fcc0,	%f8,	%f6	/* f8 > f6 */
	fmovdug	%fcc0,	%f8,	%f12	/* fcc0 = 2 */	

	fcmpd	%fcc0,	%f12,	%f8	/* f12 should = f8 */
	fbne,a	%fcc0,	diag_fail	
	set	0xffff6005,	%l1

	fmovda	%fcc0,	%f10,	%f12	/* f12 = f10 */
	fcmpd	%fcc0,	%f14,	%f16 	/* fcc0 = 0 */
	fmovdug	%fcc0,	%f12,	%f14	/* f14 != (f8 = f12) */	

	fcmpd	%fcc0,	%f14,	%f12	/* f14 should != f12 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff6005,	%l1
	
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fcmpd	%fcc0,	%f6,	%f8	/* f6 < f8 */
					/* fcc0 = 1 */
	fmovdug	%fcc0,	%f8,	%f12	
	fcmpd	%fcc0,	%f12,	%f8	/* f12 should ! = f8 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff6005,	%l1

!!----------------------
!!  fmov{s,d,q}l
!!----------------------
	/* move single when less */
	fcmps	%fcc0,	%f2,	%f0	/* f2 > f0 */

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fmovsa	%fcc0,	%f2,	%f14	/* f14 = f2 > f0 */

	fmovsl	%fcc0,	%f2,	%f12	/* fcc0 = 2 */	

	fcmps	%fcc0,	%f12,	%f2	/* f12 should != f2 */
	fbe,a	%fcc0,	diag_fail	
	set	0xffff0006,	%l1

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f12,	%f4	/* f12 = f4 , fcc0 = 0 */
	fmovsl	%fcc0,	%f12,	%f14	/* f14 != f12 */
					/* fcc0 = 0 */
	fcmps	%fcc0,	%f14,	%f12	/* f12 != f14 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff0006,	%l1
	
	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f0,	%f2	/* f0 < f2 */
					/* fcc0 = 1 */
	fmovsl	%fcc0,	%f2,	%f12	
	fcmps	%fcc0,	%f12,	%f2	/* f12 should = f2 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff0006,	%l1

	/* move double when less */
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fmovda	%fcc0,	%f16,	%f14	/* reset f12 & f14 */

	fcmpd	%fcc0,	%f8,	%f6	/* f8 > f6 */
	fmovdl	%fcc0,	%f8,	%f12	/* fcc0 = 2 */	

	fcmpd	%fcc0,	%f12,	%f8	/* f12 should != f8 */
	fbe,a	%fcc0,	diag_fail	
	set	0xffff6006,	%l1

	fmovda	%fcc0,	%f10,	%f12	/* f12 = f10 */
	fcmpd	%fcc0,	%f14,	%f16 	/* fcc0 = 0 */
	fmovdl	%fcc0,	%f12,	%f14	/* f14 != (f8 = f12) */	

	fcmpd	%fcc0,	%f14,	%f12	/* f14 should != f12 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff6006,	%l1
	
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fcmpd	%fcc0,	%f6,	%f8	/* f6 < f8 */
					/* fcc0 = 1 */
	fmovdl	%fcc0,	%f8,	%f12	
	fcmpd	%fcc0,	%f12,	%f8	/* f12 should  = f8 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff6006,	%l1

!!----------------------
!!  fmov{s,d,q}ul
!!----------------------
	/* move single when unordered or less */
	fcmps	%fcc0,	%f2,	%f0	/* f2 > f0 */

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fmovsa	%fcc0,	%f2,	%f14	/* f14 = f2 > f0 */

	fmovsul	%fcc0,	%f2,	%f12	/* fcc0 = 2 */	

	fcmps	%fcc0,	%f12,	%f2	/* f12 should != f2 */
	fbe,a	%fcc0,	diag_fail	
	set	0xffff0007,	%l1

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f12,	%f4	/* f12 = f4 , fcc0 = 0 */
	fmovsul	%fcc0,	%f12,	%f14	/* f14 != f12 */
					/* fcc0 = 0 */
	fcmps	%fcc0,	%f14,	%f12	/* f12 != f14 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff0007,	%l1
	
	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f0,	%f2	/* f0 < f2 */
					/* fcc0 = 1 */
	fmovsul	%fcc0,	%f2,	%f12	
	fcmps	%fcc0,	%f12,	%f2	/* f12 should = f2 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff0007,	%l1

	/* move double when unordered or less */
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fmovda	%fcc0,	%f16,	%f14	/* reset f12 & f14 */

	fcmpd	%fcc0,	%f8,	%f6	/* f8 > f6 */
	fmovdul	%fcc0,	%f8,	%f12	/* fcc0 = 2 */	

	fcmpd	%fcc0,	%f12,	%f8	/* f12 should != f8 */
	fbe,a	%fcc0,	diag_fail	
	set	0xffff6007,	%l1

	fmovda	%fcc0,	%f10,	%f12	/* f12 = f10 */
	fcmpd	%fcc0,	%f14,	%f16 	/* fcc0 = 0 */
	fmovdul	%fcc0,	%f12,	%f14	/* f14 != (f8 = f12) */	

	fcmpd	%fcc0,	%f14,	%f12	/* f14 should != f12 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff6007,	%l1
	
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fcmpd	%fcc0,	%f6,	%f8	/* f6 < f8 */
					/* fcc0 = 1 */
	fmovdul	%fcc0,	%f8,	%f12	
	fcmpd	%fcc0,	%f12,	%f8	/* f12 should  = f8 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff6007,	%l1

!!----------------------
!!  fmov{s,d,q}lg
!!----------------------
	/* move single when less or greater */
	fcmps	%fcc0,	%f2,	%f0	/* f2 > f0 */

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fmovsa	%fcc0,	%f2,	%f14	/* f14 = f2 > f0 */

	fmovslg	%fcc0,	%f2,	%f12	/* fcc0 = 2 */	

	fcmps	%fcc0,	%f12,	%f2	/* f12 should = f2 */
	fbne,a	%fcc0,	diag_fail	
	set	0xffff0007,	%l1

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f12,	%f4	/* f12 = f4 , fcc0 = 0 */
	fmovslg	%fcc0,	%f12,	%f14	/* f14 != f12 */
					/* fcc0 = 0 */
	fcmps	%fcc0,	%f14,	%f12	/* f12 != f14 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff0007,	%l1
	
	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f0,	%f2	/* f0 < f2 */
					/* fcc0 = 1 */
	fmovslg	%fcc0,	%f2,	%f12	
	fcmps	%fcc0,	%f12,	%f2	/* f12 should = f2 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff0007,	%l1

	/* move double when less or greater */
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fmovda	%fcc0,	%f16,	%f14	/* reset f12 & f14 */

	fcmpd	%fcc0,	%f8,	%f6	/* f8 > f6 */
	fmovdlg	%fcc0,	%f8,	%f12	/* fcc0 = 2 */	

	fcmpd	%fcc0,	%f12,	%f8	/* f12 should = f8 */
	fbne,a	%fcc0,	diag_fail	
	set	0xffff6007,	%l1

	fmovda	%fcc0,	%f10,	%f12	/* f12 = f10 */
	fcmpd	%fcc0,	%f14,	%f16 	/* fcc0 = 0 */
	fmovdlg	%fcc0,	%f12,	%f14	/* f14 != (f8 = f12) */	

	fcmpd	%fcc0,	%f14,	%f12	/* f14 should != f12 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff6007,	%l1
	
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fcmpd	%fcc0,	%f6,	%f8	/* f6 < f8 */
					/* fcc0 = 1 */
	fmovdlg	%fcc0,	%f8,	%f12	
	fcmpd	%fcc0,	%f12,	%f8	/* f12 should  = f8 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff6007,	%l1

!!----------------------
!!  fmov{s,d,q}ne
!!----------------------
	/* move single when not equal */
	fcmps	%fcc0,	%f2,	%f0	/* f2 > f0 */

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fmovsa	%fcc0,	%f2,	%f14	/* f14 = f2 > f0 */

	fmovsne	%fcc0,	%f2,	%f12	/* fcc0 = 2 */	

	fcmps	%fcc0,	%f12,	%f2	/* f12 should = f2 */
	fbne,a	%fcc0,	diag_fail	
	set	0xffff0007,	%l1

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f12,	%f4	/* f12 = f4 , fcc0 = 0 */
	fmovsne	%fcc0,	%f12,	%f14	/* f14 != f12 */
					/* fcc0 = 0 */
	fcmps	%fcc0,	%f14,	%f12	/* f12 != f14 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff0007,	%l1
	
	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f0,	%f2	/* f0 < f2 */
					/* fcc0 = 1 */
	fmovsne	%fcc0,	%f2,	%f12	
	fcmps	%fcc0,	%f12,	%f2	/* f12 should = f2 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff0007,	%l1

	/* move double when not equal */
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fmovda	%fcc0,	%f16,	%f14	/* reset f12 & f14 */

	fcmpd	%fcc0,	%f8,	%f6	/* f8 > f6 */
	fmovdne	%fcc0,	%f8,	%f12	/* fcc0 = 2 */	

	fcmpd	%fcc0,	%f12,	%f8	/* f12 should = f8 */
	fbne,a	%fcc0,	diag_fail	
	set	0xffff6007,	%l1

	fmovda	%fcc0,	%f10,	%f12	/* f12 = f10 */
	fcmpd	%fcc0,	%f14,	%f16 	/* fcc0 = 0 */
	fmovdne	%fcc0,	%f12,	%f14	/* f14 != (f8 = f12) */	

	fcmpd	%fcc0,	%f14,	%f12	/* f14 should != f12 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff6007,	%l1
	
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fcmpd	%fcc0,	%f6,	%f8	/* f6 < f8 */
					/* fcc0 = 1 */
	fmovdne	%fcc0,	%f8,	%f12	
	fcmpd	%fcc0,	%f12,	%f8	/* f12 should  = f8 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff6007,	%l1

!!----------------------
!!  fmov{s,d,q}e
!!----------------------
	/* move single when equal */
	fcmps	%fcc0,	%f2,	%f0	/* f2 > f0 */

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fmovsa	%fcc0,	%f2,	%f14	/* f14 = f2 > f0 */

	fmovse	%fcc0,	%f2,	%f12	/* fcc0 = 2 */	

	fcmps	%fcc0,	%f12,	%f2	/* f12 should != f2 */
	fbe,a	%fcc0,	diag_fail	
	set	0xffff0007,	%l1

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f12,	%f4	/* f12 = f4 , fcc0 = 0 */
	fmovse	%fcc0,	%f12,	%f14	/* f14 != f12 */
					/* fcc0 = 0 */
	fcmps	%fcc0,	%f14,	%f12	/* f12 = f14 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff0007,	%l1
	
	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f0,	%f2	/* f0 < f2 */
					/* fcc0 = 1 */
	fmovse	%fcc0,	%f2,	%f12	
	fcmps	%fcc0,	%f12,	%f2	/* f12 should != f2 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff0007,	%l1

	/* move double when equal */
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fmovda	%fcc0,	%f16,	%f14	/* reset f12 & f14 */

	fcmpd	%fcc0,	%f8,	%f6	/* f8 > f6 */
	fmovde	%fcc0,	%f8,	%f12	/* fcc0 = 2 */	

	fcmpd	%fcc0,	%f12,	%f8	/* f12 should != f8 */
	fbe,a	%fcc0,	diag_fail	
	set	0xffff6007,	%l1

	fmovda	%fcc0,	%f10,	%f12	/* f12 = f10 */
	fcmpd	%fcc0,	%f14,	%f16 	/* fcc0 = 0 */
	fmovde	%fcc0,	%f12,	%f14	/* f14 = (f8 = f12) */	

	fcmpd	%fcc0,	%f14,	%f12	/* f14 should = f12 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff6007,	%l1
	
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fcmpd	%fcc0,	%f6,	%f8	/* f6 < f8 */
					/* fcc0 = 1 */
	fmovde	%fcc0,	%f8,	%f12	
	fcmpd	%fcc0,	%f12,	%f8	/* f12 should  != f8 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff6007,	%l1

!!----------------------
!!  fmov{s,d,q}ue
!!----------------------
	/* move single when equal or unordered */
	fcmps	%fcc0,	%f2,	%f0	/* f2 > f0 */

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fmovsa	%fcc0,	%f2,	%f14	/* f14 = f2 > f0 */

	fmovsue	%fcc0,	%f2,	%f12	/* fcc0 = 2 */	

	fcmps	%fcc0,	%f12,	%f2	/* f12 should != f2 */
	fbe,a	%fcc0,	diag_fail	
	set	0xffff0009,	%l1

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f12,	%f4	/* f12 = f4 , fcc0 = 0 */
	fmovsue	%fcc0,	%f12,	%f14	/* f14 != f12 */
					/* fcc0 = 0 */
	fcmps	%fcc0,	%f14,	%f12	/* f12 = f14 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff0009,	%l1
	
	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f0,	%f2	/* f0 < f2 */
					/* fcc0 = 1 */
	fmovsue	%fcc0,	%f2,	%f12	
	fcmps	%fcc0,	%f12,	%f2	/* f12 should != f2 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff0009,	%l1

	/* move double when equal or unordered */
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fmovda	%fcc0,	%f16,	%f14	/* reset f12 & f14 */

	fcmpd	%fcc0,	%f8,	%f6	/* f8 > f6 */
	fmovdue	%fcc0,	%f8,	%f12	/* fcc0 = 2 */	

	fcmpd	%fcc0,	%f12,	%f8	/* f12 should != f8 */
	fbe,a	%fcc0,	diag_fail	
	set	0xffff6009,	%l1

	fmovda	%fcc0,	%f10,	%f12	/* f12 = f10 */
	fcmpd	%fcc0,	%f14,	%f16 	/* fcc0 = 0 */
	fmovdue	%fcc0,	%f12,	%f14	/* f14 = (f8 = f12) */	

	fcmpd	%fcc0,	%f14,	%f12	/* f14 should = f12 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff6009,	%l1
	
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fcmpd	%fcc0,	%f6,	%f8	/* f6 < f8 */
					/* fcc0 = 1 */
	fmovdue	%fcc0,	%f8,	%f12	
	fcmpd	%fcc0,	%f12,	%f8	/* f12 should  != f8 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff6009,	%l1

!!----------------------
!!  fmov{s,d,q}ge
!!----------------------
	/* move single when equal or greater */
	fcmps	%fcc0,	%f2,	%f0	/* f2 > f0 */

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fmovsa	%fcc0,	%f2,	%f14	/* f14 = f2 > f0 */

	fmovsge	%fcc0,	%f2,	%f12	/* fcc0 = 2 */	

	fcmps	%fcc0,	%f12,	%f2	/* f12 should = f2 */
	fbne,a	%fcc0,	diag_fail	
	set	0xffff000a,	%l1

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f12,	%f4	/* f12 = f4 , fcc0 = 0 */
	fmovsge	%fcc0,	%f12,	%f14	/* f14 = f12 */
					/* fcc0 = 0 */
	fcmps	%fcc0,	%f14,	%f12	/* f12 = f14 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff000a,	%l1
	
	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f0,	%f2	/* f0 < f2 */
					/* fcc0 = 1 */
	fmovsge	%fcc0,	%f2,	%f12	
	fcmps	%fcc0,	%f12,	%f2	/* f12 should != f2 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff000a,	%l1

	/* move double when equal or greater */
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fmovda	%fcc0,	%f16,	%f14	/* reset f12 & f14 */

	fcmpd	%fcc0,	%f8,	%f6	/* f8 > f6 */
	fmovdge	%fcc0,	%f8,	%f12	/* fcc0 = 2 */	

	fcmpd	%fcc0,	%f12,	%f8	/* f12 should = f8 */
	fbne,a	%fcc0,	diag_fail	
	set	0xffff600a,	%l1

	fmovda	%fcc0,	%f10,	%f12	/* f12 = f10 */
	fcmpd	%fcc0,	%f14,	%f16 	/* fcc0 = 0 */
	fmovdge	%fcc0,	%f12,	%f14	/* f14 = (f10 = f12) */	

	fcmpd	%fcc0,	%f14,	%f12	/* f14 should = f12 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff600a,	%l1
	
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fcmpd	%fcc0,	%f6,	%f8	/* f6 < f8 */
					/* fcc0 = 1 */
	fmovdge	%fcc0,	%f8,	%f12	
	fcmpd	%fcc0,	%f12,	%f8	/* f12 should  != f8 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff600a,	%l1

!!----------------------
!!  fmov{s,d,q}uge
!!----------------------
	/* move single when unordered or equal or greater */
	fcmps	%fcc0,	%f2,	%f0	/* f2 > f0 */

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fmovsa	%fcc0,	%f2,	%f14	/* f14 = f2 > f0 */

	fmovsuge	%fcc0,	%f2,	%f12	/* fcc0 = 2 */	

	fcmps	%fcc0,	%f12,	%f2	/* f12 should = f2 */
	fbne,a	%fcc0,	diag_fail	
	set	0xffff000a,	%l1

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f12,	%f4	/* f12 = f4 , fcc0 = 0 */
	fmovsuge	%fcc0,	%f12,	%f14	/* f14 = f12 */
					/* fcc0 = 0 */
	fcmps	%fcc0,	%f14,	%f12	/* f12 = f14 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff000a,	%l1
	
	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f0,	%f2	/* f0 < f2 */
					/* fcc0 = 1 */
	fmovsuge	%fcc0,	%f2,	%f12	
	fcmps	%fcc0,	%f12,	%f2	/* f12 should != f2 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff000a,	%l1

	/* move double when unordered or equal or greater */
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fmovda	%fcc0,	%f16,	%f14	/* reset f12 & f14 */

	fcmpd	%fcc0,	%f8,	%f6	/* f8 > f6 */
	fmovduge	%fcc0,	%f8,	%f12	/* fcc0 = 2 */	

	fcmpd	%fcc0,	%f12,	%f8	/* f12 should = f8 */
	fbne,a	%fcc0,	diag_fail	
	set	0xffff600a,	%l1

	fmovda	%fcc0,	%f10,	%f12	/* f12 = f10 */
	fcmpd	%fcc0,	%f14,	%f16 	/* fcc0 = 0 */
	fmovduge	%fcc0,	%f12,	%f14	/* f14 = (f10 = f12) */	

	fcmpd	%fcc0,	%f14,	%f12	/* f14 should = f12 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff600a,	%l1
	
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fcmpd	%fcc0,	%f6,	%f8	/* f6 < f8 */
					/* fcc0 = 1 */
	fmovduge	%fcc0,	%f8,	%f12	
	fcmpd	%fcc0,	%f12,	%f8	/* f12 should  != f8 */
	fbe,a	%fcc0,	diag_fail
	set	0xffff600a,	%l1

!!----------------------
!!  fmov{s,d,q}le
!!----------------------
	/* move single when equal or less */
	fcmps	%fcc0,	%f2,	%f0	/* f2 > f0 */

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fmovsa	%fcc0,	%f2,	%f14	/* f14 = f2 > f0 */

	fmovsle	%fcc0,	%f2,	%f12	/* fcc0 = 2 */	

	fcmps	%fcc0,	%f12,	%f2	/* f12 should != f2 */
	fbe,a	%fcc0,	diag_fail	
	set	0xffff000a,	%l1

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f12,	%f4	/* f12 = f4 , fcc0 = 0 */
	fmovsle	%fcc0,	%f12,	%f14	/* f14 = f12 */
					/* fcc0 = 0 */
	fcmps	%fcc0,	%f14,	%f12	/* f12 = f14 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff000a,	%l1
	
	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f0,	%f2	/* f0 < f2 */
					/* fcc0 = 1 */
	fmovsle	%fcc0,	%f2,	%f12	
	fcmps	%fcc0,	%f12,	%f2	/* f12 should = f2 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff000a,	%l1

	/* move double when equal or less */
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fmovda	%fcc0,	%f16,	%f14	/* reset f12 & f14 */

	fcmpd	%fcc0,	%f8,	%f6	/* f8 > f6 */
	fmovdle	%fcc0,	%f8,	%f12	/* fcc0 = 2 */	

	fcmpd	%fcc0,	%f12,	%f8	/* f12 should != f8 */
	fbe,a	%fcc0,	diag_fail	
	set	0xffff600a,	%l1

	fmovda	%fcc0,	%f10,	%f12	/* f12 = f10 */
	fcmpd	%fcc0,	%f14,	%f16 	/* fcc0 = 0 */
	fmovdle	%fcc0,	%f12,	%f14	/* f14 = (f10 = f12) */	

	fcmpd	%fcc0,	%f14,	%f12	/* f14 should = f12 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff600a,	%l1
	
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fcmpd	%fcc0,	%f6,	%f8	/* f6 < f8 */
					/* fcc0 = 1 */
	fmovdle	%fcc0,	%f8,	%f12	
	fcmpd	%fcc0,	%f12,	%f8	/* f12 should  = f8 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff600a,	%l1

!!----------------------
!!  fmov{s,d,q}ule
!!----------------------
	/* move single when unordered or equal or less */
	fcmps	%fcc0,	%f2,	%f0	/* f2 > f0 */

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fmovsa	%fcc0,	%f2,	%f14	/* f14 = f2 > f0 */

	fmovsule	%fcc0,	%f2,	%f12	/* fcc0 = 2 */	

	fcmps	%fcc0,	%f12,	%f2	/* f12 should != f2 */
	fbe,a	%fcc0,	diag_fail	
	set	0xffff000a,	%l1

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f12,	%f4	/* f12 = f4 , fcc0 = 0 */
	fmovsule	%fcc0,	%f12,	%f14	/* f14 = f12 */
					/* fcc0 = 0 */
	fcmps	%fcc0,	%f14,	%f12	/* f12 = f14 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff000a,	%l1
	
	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f0,	%f2	/* f0 < f2 */
					/* fcc0 = 1 */
	fmovsule	%fcc0,	%f2,	%f12	
	fcmps	%fcc0,	%f12,	%f2	/* f12 should = f2 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff000a,	%l1

	/* move double when unordered or equal or less */
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fmovda	%fcc0,	%f16,	%f14	/* reset f12 & f14 */

	fcmpd	%fcc0,	%f8,	%f6	/* f8 > f6 */
	fmovdule	%fcc0,	%f8,	%f12	/* fcc0 = 2 */	

	fcmpd	%fcc0,	%f12,	%f8	/* f12 should != f8 */
	fbe,a	%fcc0,	diag_fail	
	set	0xffff600a,	%l1

	fmovda	%fcc0,	%f10,	%f12	/* f12 = f10 */
	fcmpd	%fcc0,	%f14,	%f16 	/* fcc0 = 0 */
	fmovdule	%fcc0,	%f12,	%f14	/* f14 = (f10 = f12) */	

	fcmpd	%fcc0,	%f14,	%f12	/* f14 should = f12 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff600a,	%l1
	
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fcmpd	%fcc0,	%f6,	%f8	/* f6 < f8 */
					/* fcc0 = 1 */
	fmovdule	%fcc0,	%f8,	%f12	
	fcmpd	%fcc0,	%f12,	%f8	/* f12 should  = f8 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff600a,	%l1

!!----------------------
!!  fmov{s,d,q}o
!!----------------------
	/* move single when unordered or equal or less */
	fcmps	%fcc0,	%f2,	%f0	/* f2 > f0 */

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fmovsa	%fcc0,	%f2,	%f14	/* f14 = f2 > f0 */

	fmovso	%fcc0,	%f2,	%f12	/* fcc0 = 2 */	

	fcmps	%fcc0,	%f12,	%f2	/* f12 should = f2 */
	fbne,a	%fcc0,	diag_fail	
	set	0xffff000a,	%l1

	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f12,	%f4	/* f12 = f4 , fcc0 = 0 */
	fmovso	%fcc0,	%f12,	%f14	/* f14 = f12 */
					/* fcc0 = 0 */
	fcmps	%fcc0,	%f14,	%f12	/* f12 = f14 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff000a,	%l1
	
	fmovsa	%fcc0,	%f4,	%f12	/* f12 = f4 > f2 > f0 */
	fcmps	%fcc0,	%f0,	%f2	/* f0 < f2 */
					/* fcc0 = 1 */
	fmovso	%fcc0,	%f2,	%f12	
	fcmps	%fcc0,	%f12,	%f2	/* f12 should = f2 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff000a,	%l1

	/* move double when unordered or equal or less */
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fmovda	%fcc0,	%f16,	%f14	/* reset f12 & f14 */

	fcmpd	%fcc0,	%f8,	%f6	/* f8 > f6 */
	fmovdo	%fcc0,	%f8,	%f12	/* fcc0 = 2 */	

	fcmpd	%fcc0,	%f12,	%f8	/* f12 should = f8 */
	fbne,a	%fcc0,	diag_fail	
	set	0xffff600a,	%l1

	fmovda	%fcc0,	%f10,	%f12	/* f12 = f10 */
	fcmpd	%fcc0,	%f14,	%f16 	/* fcc0 = 0 */
	fmovdo	%fcc0,	%f12,	%f14	/* f14 = (f10 = f12) */	

	fcmpd	%fcc0,	%f14,	%f12	/* f14 should = f12 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff600a,	%l1
	
	fmovda	%fcc0,	%f16,	%f12	/* f12 = f14 = 36 */	
	fcmpd	%fcc0,	%f6,	%f8	/* f6 < f8 */
					/* fcc0 = 1 */
	fmovdo	%fcc0,	%f8,	%f12	
	fcmpd	%fcc0,	%f12,	%f8	/* f12 should  = f8 */
	fbne,a	%fcc0,	diag_fail
	set	0xffff600a,	%l1

#define	INT_IMM11_NEG 	0x7ff
#define	INT_IMM11_POS 	0x3ff
#define	INT_IMM11_RSTL	-1
#define INT_IMM10_NEG   0x3ff
#define INT_IMM10_POS   0x1ff
#define INT_IMM10_RSTL  -1

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
 ***************************************
 *  Moving Integer Register 
 *	on Conditions (MOVcc)
 ***************************************
 */

/*
 -------------------------------------
 |	Move Int Reg for Integer CC
 -------------------------------------
 */
!!--------------------------
!!	mova i_xcc
!!--------------------------
	set	0x2,	%l2
	set	0x3,	%l3
	set	0x4,	%l4
	set	0x5,	%l5

	/* 
	 * move based on icc  : always 
	 */	
	subcc	%l3,	%l2,	%l6

	mova	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0001,	%l1	

	add	%l5,	0x0,	%l4	/* reset l4 */
	mova	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0001,	%l1	

	add	%l5,	0x0,	%l4	/* reset l4 */
	mova	%icc,	INT_IMM11_NEG, %l4	/* l4 is sign extended */
	set	0x0,	%l0
	setx	INT_IMM11_RSTL,	%l0,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0001,	%l1	

	/* set ccr explicitly */
	set	0x0,	%l0
	wr	%l0,	0xff,	%ccr
	nop

	add	%l5,	0x0,	%l4	/* reset l4 */
	mova	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0001,	%l1	

	add	%l5,	0x0,	%l4	/* reset l4 */
	mova	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0001,	%l1	
	
	/* 
	 * move based on xcc 
	 */	
	/* clr %ccr first */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	add	%l5,	0x0,	%l4	/* reset l4 */

	subcc	%l3,	%l2,	%l6

	mova	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0001,	%l1	

	add	%l5,	0x0,	%l4	/* reset l4 */
	mova	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0001,	%l1	

	/* set ccr explicitly */
	set	0x0,	%l0
	wr	%l0,	0xff,	%ccr
	nop

	add	%l5,	0x0,	%l4	/* reset l4 */
	mova	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0001,	%l1	

	add	%l5,	0x0,	%l4	/* reset l4 */
	mova	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0001,	%l1	
	
	add	%l5,	0x0,	%l4	/* reset l4 */
	mova	%xcc,	INT_IMM11_NEG, %l4	/* l4 is sign extended */
	set	0x0,	%l0
	setx	INT_IMM11_RSTL,	%l0,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0001,	%l1	

!!--------------------------
!!	movn i_xcc
!!--------------------------
	/* clr %ccr first */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	add	%l5,	0x0,	%l4	/* reset l4 */

	/* 
	 * movn based on icc : always not
	 */	
	subcc	%l3,	%l2,	%l6

	movn	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0001,	%l1	

	add	%l5,	0x0,	%l4	/* reset l4 */
	movn	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0001,	%l1	

	add	%l5,	0x0,	%l4	/* reset l4 */
	movn	%xcc,	INT_IMM11_NEG, %l4	/* l4 is sign extended */
	set	0x0,	%l0
	setx	INT_IMM11_RSTL,	%l0,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0001,	%l1	

	/* set ccr explicitly */
	set	0x0,	%l0
	wr	%l0,	0xff,	%ccr
	nop

	add	%l5,	0x0,	%l4	/* reset l4 */
	movn	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0001,	%l1	

	add	%l5,	0x0,	%l4	/* reset l4 */
	movn	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0001,	%l1	
	
	/* 
	 * move based on xcc 
	 */	
	subcc	%l3,	%l2,	%l6

	add	%l5,	0x0,	%l4	/* reset l4 */
	movn	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0001,	%l1	

	add	%l5,	0x0,	%l4	/* reset l4 */
	movn	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0001,	%l1	

	/* set ccr explicitly */
	set	0x0,	%l0
	wr	%l0,	0xff,	%ccr
	nop

	add	%l5,	0x0,	%l4	/* reset l4 */
	movn	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0001,	%l1	

	add	%l5,	0x0,	%l4	/* reset l4 */
	movn	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0001,	%l1	
	
!!--------------------------
!!	movne i_xcc 
!!--------------------------
	/* clr %ccr first */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	add	%l5,	0x0,	%l4	/* reset l4 */

	/* 
	 * movne based on icc  : not Z
	 */	
	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	movne	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0002,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movne	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0002,	%l1	

	subcc	%l3,	%l3,	%l6	/* Z */
	movne	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0002,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movne	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0002,	%l1	

	subcc	%l2,	%l3,	%l6	/* l2 < l3 CR & NEG set */
	movne	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0002,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movne	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0002,	%l1	

	/* 
	 * move based on xcc 
	 */	

	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	movne	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0002,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movne	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0002,	%l1	

	subcc	%l3,	%l3,	%l6	/* Z */
	movne	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0002,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movne	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0002,	%l1	

	subcc	%l2,	%l3,	%l6	/* l2 < l3 CR & NEG set */
	movne	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0002,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movne	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0002,	%l1	

!!--------------------------
!!	move i_xcc 
!!--------------------------
	/* clr %ccr first */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	add	%l5,	0x0,	%l4	/* reset l4 */

	/* 
	 * move based on icc  :  Z
	 */	
	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	move	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0003,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	move	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0003,	%l1	

	subcc	%l3,	%l3,	%l6	/* Z */
	move	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0003,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	move	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0003,	%l1	

	subcc	%l2,	%l3,	%l6	/* l2 < l3 CR & NEG set */
	move	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0003,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	move	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0003,	%l1	

	/* 
	 * move based on xcc 
	 */	

	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	move	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0003,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	move	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0003,	%l1	

	subcc	%l3,	%l3,	%l6	/* Z */
	move	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0003,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	move	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0003,	%l1	

	subcc	%l2,	%l3,	%l6	/* l2 < l3 CR & NEG set */
	move	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0003,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	move	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0003,	%l1	

!!--------------------------
!!	movg i_xcc 
!!--------------------------
	/* clr %ccr first */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	add	%l5,	0x0,	%l4	/* reset l4 */

	/* 
	 * movg based on icc  :  greater 
	 */	
	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	movg	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0004,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movg	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0004,	%l1	

	subcc	%l3,	%l3,	%l6	/* Z */
	movg	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0004,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movg	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0004,	%l1	

	subcc	%l2,	%l3,	%l6	/* l2 < l3 CR & NEG set */
	movg	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0004,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movg	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0004,	%l1	

	/* 
	 * movg based on xcc 
	 */	

	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	movg	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0004,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movg	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0004,	%l1	

	subcc	%l3,	%l3,	%l6	/* Z */
	movg	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0004,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movg	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0004,	%l1	

	subcc	%l2,	%l3,	%l6	/* l2 < l3 CR & NEG set */
	movg	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0004,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movg	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0004,	%l1	

!!--------------------------
!!	movle i_xcc 
!!--------------------------
	/* clr %ccr first */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	add	%l5,	0x0,	%l4	/* reset l4 */

	/* 
	 * movle based on icc  :  <= 
	 */	
	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	movle	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0005,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movle	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0005,	%l1	

	subcc	%l3,	%l3,	%l6	/* Z */
	movle	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0005,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movle	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0005,	%l1	

	subcc	%l2,	%l3,	%l6	/* l2 < l3 CR & NEG set */
	movle	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0005,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movle	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0005,	%l1	

	/* 
	 * movle based on xcc 
	 */	

	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	movle	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0005,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movle	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0005,	%l1	

	subcc	%l3,	%l3,	%l6	/* Z */
	movle	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0005,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movle	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0005,	%l1	

	subcc	%l2,	%l3,	%l6	/* l2 < l3 CR & NEG set */
	movle	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0005,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movle	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0005,	%l1	

!!--------------------------
!!	movge i_xcc 
!!--------------------------
	/* clr %ccr first */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	add	%l5,	0x0,	%l4	/* reset l4 */

	/* 
	 * movge based on icc  :  greater 
	 */	
	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	movge	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0006,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movge	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0006,	%l1	

	subcc	%l3,	%l3,	%l6	/* Z */
	movge	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0006,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movge	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0006,	%l1	

	subcc	%l2,	%l3,	%l6	/* l2 < l3 CR & NEG set */
	movge	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0006,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movge	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0006,	%l1	

	/* 
	 * movge based on xcc 
	 */	

	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	movge	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0006,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movge	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0006,	%l1	

	subcc	%l3,	%l3,	%l6	/* Z */
	movge	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0006,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movge	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0006,	%l1	

	subcc	%l2,	%l3,	%l6	/* l2 < l3 CR & NEG set */
	movge	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0006,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movge	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0006,	%l1	

!!--------------------------
!!	movl i_xcc 
!!--------------------------
	/* clr %ccr first */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	add	%l5,	0x0,	%l4	/* reset l4 */

	/* 
	 * movl based on icc  :  <
	 */	
	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	movl	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0007,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movl	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0007,	%l1	

	subcc	%l3,	%l3,	%l6	/* Z */
	movl	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0007,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movl	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0007,	%l1	

	subcc	%l2,	%l3,	%l6	/* l2 < l3 CR & NEG set */
	movl	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0007,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movl	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0007,	%l1	

	/* 
	 * movl based on xcc 
	 */	

	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	movl	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0007,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movl	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0007,	%l1	

	subcc	%l3,	%l3,	%l6	/* Z */
	movl	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0007,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movl	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0007,	%l1	

	subcc	%l2,	%l3,	%l6	/* l2 < l3 CR & NEG set */
	movl	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0007,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movl	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0007,	%l1	

!!--------------------------
!!	movgu i_xcc 
!!--------------------------
	/* clr %ccr first */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	add	%l5,	0x0,	%l4	/* reset l4 */

	/* 
	 * movgu based on icc  :  greater unsigned 
	 */	
	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	movgu	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0008,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movgu	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0008,	%l1	

	subcc	%l3,	%l3,	%l6	/* Z */
	movgu	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0008,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movgu	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0008,	%l1	

	subcc	%l2,	%l3,	%l6	/* l2 < l3 CR & NEG set */
	movgu	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0008,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movgu	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0008,	%l1	

	/* 
	 * movgu based on xcc 
	 */	

	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	movgu	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0008,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movgu	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0008,	%l1	

	subcc	%l3,	%l3,	%l6	/* Z */
	movgu	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0008,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movgu	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0008,	%l1	

	subcc	%l2,	%l3,	%l6	/* l2 < l3 CR & NEG set */
	movgu	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0008,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movgu	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0008,	%l1	

!!--------------------------
!!	movleu i_xcc 
!!--------------------------
	/* clr %ccr first */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	add	%l5,	0x0,	%l4	/* reset l4 */

	/* 
	 * movleu based on icc  :  <= 
	 */	
	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	movleu	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0009,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movleu	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0009,	%l1	

	subcc	%l3,	%l3,	%l6	/* Z */
	movleu	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0009,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movleu	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0009,	%l1	

	subcc	%l2,	%l3,	%l6	/* l2 < l3 CR & NEG set */
	movleu	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0009,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movleu	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0009,	%l1	

	/* 
	 * movleu based on xcc 
	 */	

	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	movleu	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff0009,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movleu	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff0009,	%l1	

	subcc	%l3,	%l3,	%l6	/* Z */
	movleu	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0009,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movleu	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0009,	%l1	

	subcc	%l2,	%l3,	%l6	/* l2 < l3 CR & NEG set */
	movleu	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff0009,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movleu	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff0009,	%l1	

!!--------------------------
!!	movcc i_xcc 
!!--------------------------
	/* clr %ccr first */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	add	%l5,	0x0,	%l4	/* reset l4 */

	/* 
	 * movcc based on icc  :  Carrier flag clear 
	 *	greater or equal, unsigned
	 */	
	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	movcc	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff000a,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movcc	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff000a,	%l1	

	subcc	%l3,	%l3,	%l6	/* Z */
	movcc	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff000a,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movcc	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff000a,	%l1	

	subcc	%l2,	%l3,	%l6	/* l2 < l3 CR & NEG set */
	movcc	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff000a,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movcc	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff000a,	%l1	

	/* 
	 * movcc based on xcc 
	 */	

	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	movcc	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff000a,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movcc	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff000a,	%l1	

	subcc	%l3,	%l3,	%l6	/* Z */
	movcc	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff000a,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movcc	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff000a,	%l1	

	subcc	%l2,	%l3,	%l6	/* l2 < l3 CR & NEG set */
	movcc	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff000a,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movcc	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff000a,	%l1	

!!--------------------------
!!	movcs i_xcc 
!!--------------------------
        set     0x0,    %l0
        setx    -5,     %l0,    %l2
        setx    -4,     %l0,    %l3
        setx    -3,     %l0,    %l4
        setx    -2,     %l0,    %l5

        /* clr %ccr first */
        set     0x0,    %l0
        wr      %l0,    0x0,    %ccr
        nop

        add     %l5,    0x0,    %l4     /* reset l4 */

        /*
         * movcs based on icc  :  <=
         */    
        subcc   %l3,    %l2,    %l6     /* l3 > l2 */
        movcs   %icc,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should != l3 */
        brz,a   %l6,    diag_fail
        set     0xeeff000b,     %l1
        add     %l5,    0x0,    %l4     /* reset l4 */
        movcs   %icc,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeff000b,     %l1

        subcc   %l3,    %l3,    %l6     /* Z */
        movcs   %icc,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should != l3 */
        brz,a   %l6,    diag_fail
        set     0xeeff000b,     %l1
        add     %l5,    0x0,    %l4     /* reset l4 */
        movcs   %icc,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeff000b,     %l1

        subcc   %l2,    %l3,    %l6     /* l2 < l3 CR & NEG set */
        movcs   %icc,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should = l3 */
        brnz,a  %l6,    diag_fail
        set     0xeeff000b,     %l1
        add     %l5,    0x0,    %l4     /* reset l4 */
        movcs   %icc,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a  %l7,    diag_fail
        set     0xeeff000b,     %l1

        /*
         * movcs based on xcc
         */

        subcc   %l3,    %l2,    %l6     /* l3 > l2 */
        movcs   %xcc,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should != l3 */
        brz,a   %l6,    diag_fail
        set     0xeeff000b,     %l1
        add     %l5,    0x0,    %l4     /* reset l4 */
        movcs   %xcc,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeff000b,     %l1

        subcc   %l3,    %l3,    %l6     /* Z */
        movcs   %xcc,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should != l3 */
        brz,a   %l6,    diag_fail
        set     0xeeff000b,     %l1
        add     %l5,    0x0,    %l4     /* reset l4 */
        movcs   %xcc,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeff000b,     %l1

        subcc   %l2,    %l3,    %l6     /* l2 < l3 CR & NEG set */
        movcs   %xcc,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should = l3 */
        brnz,a  %l6,    diag_fail
        set     0xeeff000b,     %l1
        add     %l5,    0x0,    %l4     /* reset l4 */
        movcs   %xcc,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a  %l7,    diag_fail
        set     0xeeff000b,     %l1

!!--------------------------
!!	movpos i_xcc 
!!--------------------------
        set     0x2,    %l2
        set     0x3,    %l3
        set     0x4,    %l4
        set     0x5,    %l5

	/* clr %ccr first */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	add	%l5,	0x0,	%l4	/* reset l4 */

	/* 
	 * movpos based on icc  :  greater 
	 */	
	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	movpos	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff000a,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movpos	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff000a,	%l1	

	subcc	%l3,	%l3,	%l6	/* Z */
	movpos	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff000a,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movpos	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff000a,	%l1	

	subcc	%l2,	%l3,	%l6	/* l2 < l3 CR & NEG set */
	movpos	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff000a,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movpos	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff000a,	%l1	

	/* 
	 * movpos based on xcc 
	 */	

	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	movpos	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff000a,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movpos	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff000a,	%l1	

	subcc	%l3,	%l3,	%l6	/* Z */
	movpos	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff000a,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movpos	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff000a,	%l1	

	subcc	%l2,	%l3,	%l6	/* l2 < l3 CR & NEG set */
	movpos	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff000a,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movpos	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff000a,	%l1	

!!--------------------------
!!	movneg i_xcc 
!!--------------------------
        set     0x0,    %l0
        setx    -5,     %l0,    %l2
        setx    -4,     %l0,    %l3
        setx    -3,     %l0,    %l4
        setx    -2,     %l0,    %l5

        /* clr %ccr first */
        set     0x0,    %l0
        wr      %l0,    0x0,    %ccr
        nop

        add     %l5,    0x0,    %l4     /* reset l4 */

        /*
         * movneg based on icc  :  <=
         */    
        subcc   %l3,    %l2,    %l6     /* l3 > l2 */
        movneg   %icc,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should != l3 */
        brz,a   %l6,    diag_fail
        set     0xeeff000b,     %l1
        add     %l5,    0x0,    %l4     /* reset l4 */
        movneg   %icc,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeff000b,     %l1

        subcc   %l3,    %l3,    %l6     /* Z */
        movneg   %icc,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should != l3 */
        brz,a   %l6,    diag_fail
        set     0xeeff000b,     %l1
        add     %l5,    0x0,    %l4     /* reset l4 */
        movneg   %icc,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeff000b,     %l1

        subcc   %l2,    %l3,    %l6     /* l2 < l3 CR & NEG set */
        movneg   %icc,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should = l3 */
        brnz,a  %l6,    diag_fail
        set     0xeeff000b,     %l1
        add     %l5,    0x0,    %l4     /* reset l4 */
        movneg   %icc,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a  %l7,    diag_fail
        set     0xeeff000b,     %l1

        /*
         * movneg based on xcc
         */

        subcc   %l3,    %l2,    %l6     /* l3 > l2 */
        movneg   %xcc,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should != l3 */
        brz,a   %l6,    diag_fail
        set     0xeeff000b,     %l1
        add     %l5,    0x0,    %l4     /* reset l4 */
        movneg   %xcc,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeff000b,     %l1

        subcc   %l3,    %l3,    %l6     /* Z */
        movneg   %xcc,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should != l3 */
        brz,a   %l6,    diag_fail
        set     0xeeff000b,     %l1
        add     %l5,    0x0,    %l4     /* reset l4 */
        movneg   %xcc,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should != l6 */
        brz,a   %l7,    diag_fail
        set     0xeeff000b,     %l1

        subcc   %l2,    %l3,    %l6     /* l2 < l3 CR & NEG set */
        movneg   %xcc,   %l3,    %l4
        sub     %l4,    %l3,    %l6     /* l4 should = l3 */
        brnz,a  %l6,    diag_fail
        set     0xeeff000b,     %l1
        add     %l5,    0x0,    %l4     /* reset l4 */
        movneg   %xcc,   INT_IMM11_POS, %l4
        set     INT_IMM11_POS,    %l6
        sub     %l4,    %l6,    %l7     /* l4 should = l6 */
        brnz,a  %l7,    diag_fail
        set     0xeeff000b,     %l1

!!--------------------------
!!	movvc i_xcc 
!!--------------------------
        set     0x2,    %l2
        set     0x3,    %l3
        set     0x4,    %l4
        set     0x5,    %l5

	/* clr %ccr first */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	/* 
	 * movvc based on icc  :  Overflow NOT set
	 */	
	add	%l5,	0x0,	%l4	/* reset l4 */

	/* V flag is clear */
	subcc	%l3,	%l2,	%l6	/* l3 > l2 */

	movvc	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff000a,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movvc	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff000a,	%l1	

	/* V flag is set */
	add	%l5,	0x0,	%l4	/* reset l4 */
        set     0x80000000,     %l6
        set     0x7fffffff,     %l7

        subcc   %l6,    %l7,    %l0     /* V flag is set */
	movvc	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff000a,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movvc	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff000a,	%l1	

	/* 
	 * movvc based on xcc 
	 */	
	/* V flag is clear */
	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	movvc	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff000a,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movvc	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff000a,	%l1	

	/*
	 * Xcc.V is set 
	 */
        set     0x0,    %l0
        setx    0x8000000000000000,     %l0,    %l6
        setx    0x7fffffffffffffff,     %l0,    %l7

        subcc   %l6,    %l7,    %l0     /* V flag is set */
	movvc	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff000a,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movvc	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff000a,	%l1	

!!--------------------------
!!	movvs i_xcc 
!!--------------------------
        set     0x2,    %l2
        set     0x3,    %l3
        set     0x4,    %l4
        set     0x5,    %l5

	/* clr %ccr first */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	/* 
	 * movvs based on icc  :  Overflow NOT set
	 */	
	add	%l5,	0x0,	%l4	/* reset l4 */

	/* V flag is clear */
	subcc	%l3,	%l2,	%l6	/* l3 > l2 */

	movvs	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff000a,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movvs	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff000a,	%l1	

	/* V flag is set */
	add	%l5,	0x0,	%l4	/* reset l4 */
        set     0x80000000,     %l6
        set     0x7fffffff,     %l7

        subcc   %l6,    %l7,    %l0     /* V flag is set */
	movvs	%icc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff000a,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movvs	%icc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff000a,	%l1	

	/* 
	 * movvs based on xcc 
	 */	
	/* V flag is clear */
	subcc	%l3,	%l2,	%l6	/* l3 > l2 */
	movvs	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should != l3 */
	brz,a	%l6,	diag_fail
	set	0xeeff000a,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movvs	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should != l6 */
	brz,a	%l7,	diag_fail
	set	0xeeff000a,	%l1	

	/*
	 * Xcc.V is set 
	 */
        set     0x0,    %l0
        setx    0x8000000000000000,     %l0,    %l6
        setx    0x7fffffffffffffff,     %l0,    %l7

        subcc   %l6,    %l7,    %l0     /* V flag is set */
	movvs	%xcc,	%l3,	%l4
	sub	%l4,	%l3,	%l6	/* l4 should = l3 */
	brnz,a	%l6,	diag_fail
	set	0xeeff000a,	%l1	
	add	%l5,	0x0,	%l4	/* reset l4 */
	movvs	%xcc,	INT_IMM11_POS, %l4
	set	INT_IMM11_POS,	%l6	
	sub	%l4,	%l6,	%l7	/* l4 should = l6 */
	brnz,a	%l7,	diag_fail
	set	0xeeff000a,	%l1

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
