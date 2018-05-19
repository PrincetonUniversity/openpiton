// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: v9_add_bpr.s
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

!!-----------------------------------------
!!	Part one : 
!!		ADD instructions  
!!-----------------------------------------
Test_add:
!!===============
!!	add	
!!===============
	set 	0x5a5a5a5a, 	%l0
	set 	0xa5a5a5a5, 	%l1
	add 	%l0, 	%l1, 	%l2	

	/* now %l0 should be 0xffffffff */
	set 	0xffffffff,	%l3
	sub	%l3,	%l2,	%l4

	brnz	%l4,	diag_fail
	set	0xffff0000,	%l1
	nop

!!===============
!!	addc	
!!===============
	/* should add the Carry flag */
	set 	0x5a5a5a5a, 	%l0
	set 	0xa5a5a5a5, 	%l1
	addc 	%l0, 	%l1, 	%l2	

!!===============
!!	addcc	
!!===============
	set 	0x5a5a5a5a, 	%i0
	set 	0xa5a5a5a5,	%i1
	addcc	%i0, 	%i1, 	%i2	!! this will set CCR[3] (icc.n)

!!===============
!!	addccc	
!!===============
	setx 	0x5a5a5a5a5a5a5a5a, %l1, %o0
	setx 	0xa5a5a5a5a5a5a5a5, %l1, %o1
	addccc	%o0, 	%o1, 	%o2

!!-----------------------------------------
!!	Part 2 :  BPr
!!		Branch instructions  
!!-----------------------------------------
Test_BPr:
!!======================================
!!	brz :	
!!		branch on Zero value	
!!======================================
	set	0x0,	%l0
	brz	%l0,	pass_brz
	nop

	ba	diag_fail
	set	0xffff0001,	%l1	
	nop

pass_brz:	
!!======================================
!!	brlez :	
!!		branch on Zero value	
!!======================================
	set	0x0,	%l0
	brlez	%l0,	pass_brlez1
	nop

	ba	diag_fail
	set	0xffff0002,	%l1	
	nop

pass_brlez1:
	set 	0x0,	%l0
	sub	%l0,	1, 	%l1
	brlez	%l1,	pass_brlez2
	nop

	ba	diag_fail
	set	0xffff0003,	%l1	
	nop

pass_brlez2:
!!======================================
!!	brlz :	
!!		branch on neg value
!!======================================
	brlz	%l1,	pass_brlz
	nop

	ba	diag_fail
	set	0xffff0004,	%l1	
	nop

pass_brlz:
!!======================================
!!	brnz :	
!!		branch on not zero
!!======================================
	set	0x1,	%l0	
	brnz	%l0,	pass_brnz1
	nop
	
	ba	diag_fail
	set	0xffff0005,	%l1	
	nop

pass_brnz1:
	set	0x0,	%l0
	sub	%l0,	0x1,	%l2
	
	brnz	%l2,	pass_brnz2
	nop

	ba	diag_fail
	set	0xffff0006,	%l1	
	nop

pass_brnz2:
!!=======================================================
!!	brgz :	
!!		branch on greater than zero
!!=======================================================
	set	0x1,	%l0
	brgz	%l0,	pass_brgz1
	nop

	ba	diag_fail
	set	0xffff0007, %l1
	nop
	nop
	nop

pass_brgz1:
!!=======================================================
!!	brgez :	
!!		branch on greater or equal zero
!!=======================================================
	set	0x0,	%l0	
	brgez	%l0,	pass_brgez1
	nop

	ba	diag_fail
	set	0xffff0008,	%l1	
	nop

pass_brgez1:	
	set	0x1,	%l0
	brgez	%l0,	pass_brgez2
	nop

	ba	diag_fail
	set	0xffff0009,	%l1	
	nop

pass_brgez2:
/*
 **************************************************
 *	Testing the annul bit of the BPr
 **************************************************
 */
	set	0x1,	%l0
	set 	0x1,	%l1
	
	/* 
	 * this branch is not taken , annul bit
	 * is set. So, the delay slot is annulled 
	 */ 
	brz,a	%l0,	diag_fail
	set	0x0,	%l1

	/* if	%l1 is zero, the 
	 * annul bit is not working. 
	 */
	brz,a	%l1,	diag_fail
	set	0xffff000a,	%l1
	nop

	/* test annul bit for brlez */
	set	0x1,	%l0
	set	0x1,	%l1

	brlez,a		%l0,	diag_fail	
	set	0x0,	%l1

	brz	%l1,	diag_fail
	set	0xffff000b,	%l1

	/* test annul bit for brlz */
	set	0x0,	%l0
	set	0x1,	%l1

	sub	%l0,	0x1,	%l0

	/* branch is taken, annul bit doesn't count */
	brlz,a	%l0,	testanl_brlz		
	set	0x0,	%l1

testanl_brlz:
	brnz	%l1,	diag_fail
	set	0xffff000c,	%l1
	nop

	/* test annul bit for brnz */
	set	0x0,	%l0
	set	0x1,	%l1

	/* branch not taken */
	brnz,a	%l0,	diag_fail	
	set	0x0,	%l1

	brz	%l1,	diag_fail
	set	0xffff000d,	%l1

	/* test annul bit for brgz */
	set	0x0,	%l0
	set	0x1,	%l1

	/* branch not taken */
	brgz,a	%l0,	diag_fail	
	set	0x0,	%l1

	brz	%l1,	diag_fail
	set	0xffff000e,	%l1

	/* test annul bit for brgz */
	set	0x0,	%l0
	set	0x1,	%l1
	sub	%l0,	0x1,	%l0

	/* branch not taken */
	brgez,a	%l0,	diag_fail	
	set	0x0,	%l1

	brz	%l1,	diag_fail
	set	0xffff000f,	%l1

/*
 **************************************************
 *	Testing the prediction bit of the BPr
 *	
 * 	We already tested the "pt" mode. Only need
 * 	to test the "pn" mode. "pt" mode is the 
 * 	default mode.
 **************************************************
 */
	set	0x1,	%l0
	/* branch should not be taken */
	brz,pn	%l0,	diag_fail
	set	0xffff0010, %l1

	set	0x0,	%l0
	/* branch should be taken */ 
	brz,pn	%l0,	testpn_brlez
	nop 

	/* otherwise, fail */
	ba	diag_fail
	set	0xffff0010,	%l1
	nop

testpn_brlez:
        set     0x1,    %l0
        /* branch should not be taken */
        brlez,pn  %l0,   diag_fail
	set	0xffff0011,	%l1	

        set     0x0,    %l0
        /* branch should be taken */
        brlez,pn  %l0,    testpn_brlz
        nop

        /* otherwise, fail */
        ba      diag_fail
        set     0xffff0011,     %l1
        nop
	
testpn_brlz:
        set     0x0,    %l0
        /* branch should not be taken */
        brlz,pn  %l0,    diag_fail
	set	0xffff0012,	%l1

	sub	%l0,	0x1,	%l0
        /* branch should be taken */
        brlz,pn  %l0,    testpn_brnz
        nop

        /* otherwise, fail */
        ba      diag_fail
        set     0xffff0012,     %l1
        nop

testpn_brnz:
        set     0x0,    %l0
        /* branch should not be taken */
        brnz,pn  %l0,    diag_fail
	set	0xffff0012,	%l1

        set     0x1,    %l0
        /* branch should be taken */
        brnz,pn  %l0,    testpn_brgz
        nop

        /* otherwise, fail */
        ba      diag_fail
        set     0xffff0012,     %l1
	nop

testpn_brgz:	
	set	0x0,	%l0
	/* branch should not be taken */
	brgz,pn	%l0,	diag_fail
	set	0xffff0013,	%l1
	
	/* branch taken */
	set	0x1,	%l0
	brgz,pn	%l0,	testpn_brgez
	nop

        /* otherwise, fail */
        ba      diag_fail
        set     0xffff0013,     %l1
	nop

testpn_brgez:
	set	0x0,	%l0
	sub	%l0,	0x1,	%l0

	/* branch not taken */
	brgez,pn	%l0,	diag_fail
	set	0xffff0014,	%l1

	set	0x1,	%l0
	/* branch taken */
	brgez,pn	%l0,	test_apbits
	nop
	
        /* otherwise, fail */
        ba      diag_fail
        set     0xffff0014,     %l1
	nop

test_apbits:
/*
 ******************************************************
 *	BPr instructions with Annul & Predic bits
 ******************************************************
 */
	set	0x1,	%l0
	/* branch not taken */ 
	brz,a,pn	%l0,	diag_fail
	set	0xffff0015,	%l1

	set	0x0,	%l0
	/* branch taken */ 
	brz,a,pn	%l0,	testap_brlez
	set	0xaaaaeeee,	%l1	/* always executed */

        /* otherwise, fail */
        ba      diag_fail
        set     0xffff0015,     %l1
	nop

testap_brlez:
	/* check the delay slot executed or not */
	set	0xaaaaeeee,	%l0
	sub	%l0,	%l1,	%l2
	brz	%l2,	diag_fail
	set	0xffff0016, %l1
		
        set     0x1,    %l0
        /* branch not taken */
        brlez,a,pn        %l0,    diag_fail
        set     0xffff0016,     %l1

        set     0x0,    %l0
	sub	%l0,	0x1,	%l0
        /* branch taken */
        brlez,a,pn        %l0,    testap_brlz
        nop

        /* otherwise, fail */
        ba      diag_fail
        set     0xffff0016,     %l1
        nop

testap_brlz:
        set     0x0,    %l0
        /* branch not taken */
        brlz,a,pn        %l0,    diag_fail
        set     0xffff0017,     %l1

        sub     %l0,    0x1,    %l0
        /* branch taken */
        brlz,a,pn        %l0,    testap_brnz
        nop

        /* otherwise, fail */
        ba      diag_fail
        set     0xffff0017,     %l1
        nop

testap_brnz:
        set     0x0,    %l0
        /* branch not taken */
        brnz,a,pn        %l0,    diag_fail
        set     0xffff0018,     %l1

        sub     %l0,    0x1,    %l0
        /* branch taken */
        brlz,a,pn        %l0,    testap_brgz
        nop

        /* otherwise, fail */
        ba      diag_fail
        set     0xffff0018,     %l1
        nop

testap_brgz:
        set     0x0,    %l0
        /* branch not taken */
        brgz,a,pn        %l0,    diag_fail
        set     0xffff0019,     %l1

	set	0x1,	%l0
        /* branch taken */
        brgz,a,pn        %l0,    testap_brgez
        nop

        /* otherwise, fail */
        ba      diag_fail
        set     0xffff0019,     %l1
        nop

testap_brgez:
        set     0x0,    %l0
	sub	%l0,	0x1,	%l0
        /* branch not taken */
        brgez,a,pn        %l0,    diag_fail
        set     0xffff001a,     %l1

        set     0x1,    %l0
        /* branch taken */
        brgez,a,pn        %l0,	Test_fbfcc
	set	0xaaaaeeee,	%l1

        /* otherwise, fail */
        ba      diag_fail
        set     0xffff001a,     %l1
        nop

Test_fbfcc:
/*
 ******************************************************
 *  Part 3:
 *  		FBfcc 	Instructions	
 *
 *	Branch on Floating point condition codes 
 ******************************************************
 */
	/* check the delay slot first */
	set	0xaaaaeeee,	%l0
	sub	%l0,	%l1,	%l2
	brz	%l2,	diag_fail
	set	0xffff001b,	%l1

!!------------------------------------------
!!	FBA   FBA,a 
!!------------------------------------------
	fba	next_fba1
	set 	0x1,	%l0
	
	ba	diag_fail
	set	0xffff0000,	%l0
	
next_fba1:
	fba,a	next_fba2		
	set	0x0,	%l0	/* should not be executed */

	ba	diag_fail
	set	0xffff0000,	%l0	

next_fba2:
	brz	%l0,	diag_fail
	set 	0xffff0000,	%l1

	fba,a,pn %fcc0,	next_fba3
	set	0x0,	%l0	/* should not be executed */

	ba	diag_fail
	set	0xffff0000,	%l0	

next_fba3:
	brz	%l0,	diag_fail
	set 	0xffff0000,	%l1

	fba,pn	%fcc0,	next_fba4
	set	0x0,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0000,	%l0	

next_fba4:
	brnz	%l0,	diag_fail
	set 	0xffff0000,	%l1

!!------------------------------------------
!!	FBN   FBN,a 
!!------------------------------------------
	fbn	diag_fail
	set	0x0,	%l0	/* executed */

	fbn,a	diag_fail
	set	0x2,	%l0	/* not exec */

	fbn,pn	%fcc0,	diag_fail
	set	0x3,	%l0	/* executed */

	fbn,a,pn	%fcc0,	diag_fail
	set	0x4,	%l0	/* not exec */

next_fbn1:
	set	0x3,	%l2
	sub	%l0,	%l2,	%l3
	brnz	%l3,	diag_fail
	set	0xffff0002,	%l1

	set	0x0,	%l1

!!----------------------------------------------
!!	FBU	FBU,a
!!	  these 2 insts are skipped since
!!	we have special diags to cover them
!!----------------------------------------------

!!------------------------------------------
!!	FBE	FBE,a	
!!------------------------------------------
	setx	fst_data, 	%l0, %l1
	set	0x0,	%l0
	ldd	[%l1+%l0],	%f0	

	add	%l0,	0x8,	%l0
	ldd	[%l1+%l0],	%f2	

	add	%l0,	0x8,	%l0
	ldd	[%l1+%l0],	%f4	

	fcmpd	%fcc0,	%f0,	%f2

	/* fcc0 should be 0 */
	fbe	next_fbe1
	set	0x0,	%l0	/* l0 set to 0 */

	ba	diag_fail
	set	0xffff0003,	%l1

next_fbe1:
	fcmpd	%fcc0,	%f0,	%f4

	fbe,a	diag_fail	
	set	0x2,	%l0	/* should not be executed */	
	
	fbe,pn	%fcc0,	diag_fail	
	set	0x3,	%l0	/* executed */	
	
	fbe,a,pn	%fcc0,	diag_fail	
	set	0x4,	%l0	/* should not be executed */	
	
next_fbe2:
	set	0x3,	%l2
	sub	%l0,	%l2,	%l3

	brnz	%l3,	diag_fail	/* l0 = 1 */
	set	0xffff0003,	%l1

!!------------------------------------------
!!	FBG	FBG,a	
!!------------------------------------------
	/* f4 > f2 , f2 = f0 */
	fcmpd	%fcc0,	%f4,	%f2	
	
	fbg	next_fbg1
	set	0x0,	%l0	/* taken */

	ba	diag_fail
	set	0xffff0004,	%l1

next_fbg1:
	fcmpd	%fcc0,	%f0,	%f2	

	fbg,a	diag_fail	
	set	0x2,	%l0	/* should not be executed */	
	
	fbg,pn	%fcc0,	diag_fail	
	set	0x3,	%l0	/* executed */	
	
	fbg,a,pn	%fcc0,	diag_fail	
	set	0x4,	%l0	/* not executed */	
	
next_fbg2:
	set	0x3,	%l2
	sub	%l0,	%l2,	%l3	
	brnz	%l3,	diag_fail
	set	0xffff0004,	%l1	
		
!!------------------------------------------
!!	FBUG	FBUG,a	
!!------------------------------------------
	/* f4 > f2 , f2 = f0 */
	fcmpd	%fcc0,	%f4,	%f2	
	
	fbug	next_fbug1
	set	0x0,	%l0	/* taken */

	ba	diag_fail
	set	0xffff0005,	%l1

next_fbug1:
	fcmpd	%fcc0,	%f0,	%f2	

	fbug,a	diag_fail	
	set	0x1,	%l0	/*  not executed */	
	
	fbug,pn	%fcc0,	diag_fail
	set	0x2,	%l0	/* executed */	
	
	fbug,a,pn	%fcc0,	diag_fail
	set	0x3,	%l0	/* not executed */	

next_fbug2:
	set	0x2,	%l2
	sub	%l0,	%l2,	%l3

	brnz	%l3,	diag_fail
	set	0xffff0005,	%l1	

!!------------------------------------------
!!	FBL	FBL,a	
!!------------------------------------------
	/* f4 > f2 , f2 = f0 */
	fcmpd	%fcc0,	%f2,	%f4	

	fbl	next_fbl1
	set	0x0,	%l0	/* taken */

	ba	diag_fail
	set	0xffff0006,	%l1

next_fbl1:
	fcmpd	%fcc0,	%f4,	%f2	

	fbl,a	diag_fail	
	set	0x2,	%l0	/* should not be executed */	
	
	fbl,pn	%fcc0,	diag_fail	
	set	0x3,	%l0	/*  executed */	
	
	fbl,a,pn %fcc0,	diag_fail	
	set	0x4,	%l0	/* should not be executed */	
	
next_fbl2:
	set	0x3,	%l2
	sub	%l0,	%l2,	%l3
	
	brnz	%l3,	diag_fail
	set	0xffff0006,	%l1	

!!------------------------------------------
!!	FBUL	FBUL,a	
!!------------------------------------------
	/* f4 > f2 , f2 = f0 */
	fcmpd	%fcc0,	%f2,	%f4	

	fbul	next_fbul1
	set	0x0,	%l0	/* taken */

	ba	diag_fail
	set	0xffff0007,	%l1

next_fbul1:
	fcmpd	%fcc0,	%f4,	%f2	

	fbul,a	diag_fail	
	set	0x2,	%l0	/* should not be executed */	
	
	fbul,pn	%fcc0,	diag_fail	
	set	0x3,	%l0	/* exec */
	
	fbul,a,pn 	%fcc0,	diag_fail	
	set	0x4,	%l0	/* not exec */
	
next_fbul2:
	set	0x3,	%l2
	sub	%l0,	%l2,	%l3

	brnz	%l3,	diag_fail
	set	0xffff0007,	%l1

!!------------------------------------------
!!	FBLG	FBLG,a
!!------------------------------------------
	/* f4 > f2 , f2 = f0 */
	fcmpd	%fcc0,	%f4,	%f2	

	fblg	next_fblg0
	set	0x0,	%l0	/* taken */

	ba	diag_fail
	set	0xffff0008,	%l1

next_fblg0:
	/* f4 > f2 , f2 = f0 */
	fcmpd	%fcc0,	%f2,	%f4	

	fblg	next_fblg1
	set	0x1,	%l0	/* taken */

	ba	diag_fail
	set	0xffff0008,	%l1

next_fblg1:
	fcmpd	%fcc0,	%f2,	%f0	

	fblg,a	diag_fail	
	set	0x2,	%l0	/* should not be executed */	
	
	fblg,pn	%fcc0,	diag_fail	
	set	0x3,	%l0	/* exec */
	
	fblg,a,pn  %fcc0,	diag_fail	
	set	0x4,	%l0	/* not exec */
	
next_fblg2:
	set	0x3,	%l2
	sub	%l0,	%l2,	%l3

	brnz	%l3,	diag_fail
	set	0xffff0008,	%l1

!!------------------------------------------
!!	FBNE	FBNE,a,pn
!!------------------------------------------
	/* f4 > f2 , f2 = f0 */
	fcmpd	%fcc0,	%f2,	%f4	

	fbne	next_fbne1
	set	0x0,	%l0	/* taken */

	ba	diag_fail
	set	0xffff000a,	%l1

next_fbne1:
	fcmpd	%fcc0,	%f0,	%f2	/* fcc0 = 0 */	

	fbne,a	diag_fail	
	set	0x2,	%l0	/* should not be executed */	
	
	fbne,pn	%fcc0,	diag_fail	
	set	0x3,	%l0	/* exec */
	
	fbne,a,pn  %fcc0,	diag_fail	
	set	0x4,	%l0	/* not exec */
	
next_fbne2:
	set	0x3,	%l2
	sub	%l0,	%l2,	%l3

	brnz	%l3,	diag_fail
	set	0xffff000a,	%l1

!!------------------------------------------
!!	FBUE	FBUE,a,pn
!!------------------------------------------
	/* f4 > f2 , f2 = f0 */
	fcmpd	%fcc0,	%f2,	%f0	

	fbue	next_fbue1
	set	0x0,	%l0	/* taken */

	ba	diag_fail
	set	0xffff000c,	%l1

next_fbue1:
	fcmpd	%fcc0,	%f4,	%f2	/* fcc0 = 2 f4>f2 */	

	fbue,a	diag_fail	
	set	0x2,	%l0	/* should not be executed */	
	
	fbue,pn	%fcc0,	diag_fail	
	set	0x3,	%l0	/* exec */
	
	fbue,a,pn  %fcc0,	diag_fail	
	set	0x4,	%l0	/* not exec */
	
next_fbue2:
	set	0x3,	%l2
	sub	%l0,	%l2,	%l3

	brnz	%l3,	diag_fail
	set	0xffff000c,	%l1

!!------------------------------------------
!!	FBGE	FBGE,a,pn
!!------------------------------------------
	/* f4 > f2 , f2 = f0 */
	fcmpd	%fcc0,	%f4,	%f0	

	fbge	next_fbge0
	set	0x0,	%l0	/* taken */

	ba	diag_fail
	set	0xffff000d,	%l1

next_fbge0:
	fcmpd	%fcc0,	%f2,	%f0	

	fbge	next_fbge1
	set	0x0,	%l0	/* taken */

	ba	diag_fail
	set	0xffff000d,	%l1

next_fbge1:
	fcmpd	%fcc0,	%f2,	%f4	/* fcc0 = 1 f2 < f4 */

	fbge,a	diag_fail	
	set	0x2,	%l0	/* should not be executed */	
	
	fbge,pn	%fcc0,	diag_fail	
	set	0x3,	%l0	/* exec */
	
	fbge,a,pn  %fcc0,	diag_fail	
	set	0x4,	%l0	/* not exec */
	
next_fbge2:
	set	0x3,	%l2
	sub	%l0,	%l2,	%l3

	brnz	%l3,	diag_fail
	set	0xffff000d,	%l1

!!------------------------------------------
!!	FBUGE	FBUGE,a,pn
!!------------------------------------------
	/* f4 > f2 , f2 = f0 */
	fcmpd	%fcc0,	%f4,	%f0	

	fbuge	next_fbuge0
	set	0x0,	%l0	/* taken */

	ba	diag_fail
	set	0xffff000e,	%l1

next_fbuge0:
	fcmpd	%fcc0,	%f2,	%f0	

	fbuge	next_fbuge1
	set	0x0,	%l0	/* taken */

	ba	diag_fail
	set	0xffff000e,	%l1

next_fbuge1:
	fcmpd	%fcc0,	%f2,	%f4	/* fcc0 = 1 f2 < f4 */

	fbuge,a	diag_fail	
	set	0x2,	%l0	/* should not be executed */	
	
	fbuge,pn %fcc0,	diag_fail	
	set	0x3,	%l0	/* exec */
	
	fbuge,a,pn  %fcc0,	diag_fail	
	set	0x4,	%l0	/* not exec */
	
next_fbuge2:
	set	0x3,	%l2
	sub	%l0,	%l2,	%l3

	brnz	%l3,	diag_fail
	set	0xffff000e,	%l1

!!------------------------------------------
!!	FBLE	FBLE,a,pn
!!------------------------------------------
	/* f4 > f2 , f2 = f0 */
	fcmpd	%fcc0,	%f0,	%f4	

	fble	next_fble0
	set	0x0,	%l0	/* taken */

	ba	diag_fail
	set	0xffff000f,	%l1

next_fble0:
	fcmpd	%fcc0,	%f2,	%f0	

	fble	next_fble1
	set	0x0,	%l0	/* taken */

	ba	diag_fail
	set	0xffff000f,	%l1

next_fble1:
	fcmpd	%fcc0,	%f4,	%f2	/* fcc0 = 2 f4 > f2 */

	fble,a	diag_fail	
	set	0x2,	%l0	/* should not be executed */	
	
	fble,pn	%fcc0,	diag_fail	
	set	0x3,	%l0	/* exec */
	
	fble,a,pn  %fcc0,	diag_fail	
	set	0x4,	%l0	/* not exec */
	
next_fble2:
	set	0x3,	%l2
	sub	%l0,	%l2,	%l3

	brnz	%l3,	diag_fail
	set	0xffff000f,	%l1

!!------------------------------------------
!!	FBULE	FBULE,a,pn
!!------------------------------------------
	/* f4 > f2 , f2 = f0 */
	fcmpd	%fcc0,	%f0,	%f4	

	fbule	next_fbule0
	set	0x0,	%l0	/* taken */

	ba	diag_fail
	set	0xffff0010,	%l1

next_fbule0:
	fcmpd	%fcc0,	%f2,	%f0	

	fbule	next_fbule1
	set	0x0,	%l0	/* taken */

	ba	diag_fail
	set	0xffff0010,	%l1

next_fbule1:
	fcmpd	%fcc0,	%f4,	%f2	/* fcc0 = 2 f4 > f2 */

	fbule,a	diag_fail	
	set	0x2,	%l0	/* should not be executed */	
	
	fbule,pn	%fcc0,	diag_fail	
	set	0x3,	%l0	/* exec */
	
	fbule,a,pn  %fcc0,	diag_fail	
	set	0x4,	%l0	/* not exec */
	
next_fbule2:
	set	0x3,	%l2
	sub	%l0,	%l2,	%l3

	brnz	%l3,	diag_fail
	set	0xffff0010,	%l1

!!------------------------------------------
!!	FBO	FBO,a,pn
!!	  not tested yet 
!!------------------------------------------

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
