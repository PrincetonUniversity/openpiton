// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: v9_allinst.s
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

! fsqrts will cause this trap, and it should not cause a bad trap	
#define ENABLE_T0_Fp_disabled_0x20
#define ENABLE_T0_Fp_exception_other_0x22 1

	
#include "boot.s"

.text
.global main
.global sum3

main:
/*
 *****************************************************
 *
 *  This diag will test all the V.9 SPARC instructions
 *
 *****************************************************
 */

	/* enable fp since bootcode doesn't anymore */
        wr              %g0, 0x4, %fprs         ! make sure fef is 1 

	
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
 *****************************************************
 *	Branch on Integer Condition Codes 
 *
 *		Bicc
 *****************************************************
 */

!!-----------------------------------------------------
!!	BA	BA,a,pn
!!-----------------------------------------------------
	ba	next_ba0
	set	0x0,	%l0	/* exec */

	ba	diag_fail
	set	0xffff0000,	%l1

next_ba0:
	ba,a	next_ba1
	set	0x1,	%l0	/* not exected */

	ba	diag_fail
	set	0xffff0000,	%l1

next_ba1:
	brnz	%l0,	diag_fail
	set	0xffff0000,	%l1	

!!-----------------------------------------------------
!!	BN	BN,a,pn
!!-----------------------------------------------------
        bn     	diag_fail
        set     0x0,    %l0     /* executed */

        bn,a   	diag_fail
        set     0x2,    %l0     /* not exec */

next_bn1:
        brnz    %l0,    diag_fail
        set     0xffff0001,     %l1

!!-----------------------------------------------------
!!	BNE	BNE,a,pn	
!!-----------------------------------------------------
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l1,	%l3
	bne	next_bne0
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0002,	%l1

next_bne0:
	bne,a	next_bne1
	set	0x0,	%l0	/* executed */	

	ba	diag_fail
	set	0xffff0002,	%l1

next_bne1:
	brnz	%l0,	diag_fail
	set	0xffff0002,	%l1

	set	0x0,	%l0
	wr	%l0,	0x4,	%ccr
	nop			/* this nop is needed because of the pipeline */

	bne	diag_fail	/* when z=1 , op result should be equal to zero */ 
				/* thus, should not branch to fail */
	nop

!!-----------------------------------------------------
!!	BE	BE,a
!!-----------------------------------------------------
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l2,	%l3
	be	next_be0
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0003,	%l1

next_be0:
	be,a	next_be1
	set	0x0,	%l0	/* executed */	

	ba	diag_fail
	set	0xffff0003,	%l1

next_be1:
	brnz	%l0,	diag_fail
	set	0xffff0003,	%l1

	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop			/* this nop is needed because of the pipeline */

	be	diag_fail
	nop

!!-----------------------------------------------------
!!	BG	BG,a
!!-----------------------------------------------------
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l1,	%l3
	bg	next_bg0
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0004,	%l1

next_bg0:
	bg,a	next_bg1
	set	0x0,	%l0	/* executed */	

	ba	diag_fail
	set	0xffff0004,	%l1

next_bg1:
	brnz	%l0,	diag_fail
	set	0xffff0004,	%l1

	set	0x1,	%l0
	set	0x0,	%l1
	set	0x2,	%l2

	sub	%l1,	%l0,	%l3	
	sub	%l1,	%l2,	%l4	

	subcc	%l3,	%l4,	%l5

	bg	Test_ble
	nop

	ba	diag_fail
	set	0xffff0004,	%l1

!!-----------------------------------------------------
!!	BLE	BLE,a
!!-----------------------------------------------------
Test_ble:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l1,	%l0,	%l3
	ble	next_ble0	/* b on less */
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0005,	%l1

next_ble0:
	ble,a	next_ble1
	set	0x0,	%l0	/* executed */	

	ba	diag_fail
	set	0xffff0005,	%l1

next_ble1:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l2,	%l0,	%l3
	ble	next_ble2	/* b on equal */
	set	0x0,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0005,	%l1

next_ble2:
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1

!!-----------------------------------------------------
!!	BGE	BGE,a
!!-----------------------------------------------------
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l1,	%l3
	bge	next_bge0	/* b on greater */
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0005,	%l1

next_bge0:
	bge,a	next_bge1
	nop

	ba	diag_fail
	set	0xffff0005,	%l1

next_bge1:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l2,	%l0,	%l3
	bge	next_bge2	/* b on equal */
	set	0x0,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0005,	%l1

next_bge2:
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1

!!-----------------------------------------------------
!!	BL	BL,a
!!-----------------------------------------------------
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l1,	%l0,	%l3
	bl	next_bl0
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0006,	%l1

next_bl0:
	bl,a	next_bl1
	set	0x0,	%l0	/* executed */	

	ba	diag_fail
	set	0xffff0006,	%l1

next_bl1:
	brnz	%l0,	diag_fail
	set	0xffff0006,	%l1

!!-----------------------------------------------------
!!	BGU	BGU,a
!!-----------------------------------------------------
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l1,	%l3
	bgu	next_bgu0
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0007,	%l1

next_bgu0:
	bgu,a	next_bgu1
	set	0x0,	%l0	/* executed */	

	ba	diag_fail
	set	0xffff0007,	%l1

next_bgu1:
	brnz	%l0,	diag_fail
	set	0xffff0007,	%l1

	set	0x1,	%l0
	set	0x0,	%l1
	set	0x2,	%l2

	sub	%l1,	%l0,	%l3	
	sub	%l1,	%l2,	%l4	

	subcc	%l4,	%l3,	%l5	/* carry is set */

	bgu	diag_fail
	nop

!!-----------------------------------------------------
!!	BLEU	BLEU,a
!!-----------------------------------------------------
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l2,	%l3
	bleu	next_bleu0	/* b on equal */
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0008,	%l1

next_bleu0:
	bleu,a	next_bleu1
	set	0x0,	%l0	/* executed */	

	ba	diag_fail
	set	0xffff0008,	%l1

next_bleu1:
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1

	set	0x1,	%l0
	set	0x0,	%l1
	subcc	%l1,	%l0,	%l2	/* carry is set */

	bleu	Test_bcc
	nop

	ba	diag_fail
	set	0xffff0008,	%l1

!!-----------------------------------------------------
!!	BCC	BCC,a
!!-----------------------------------------------------
Test_bcc:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l1,	%l3
	bcc	next_bcc0	/* b on greater */
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0009,	%l1

next_bcc0:
	bcc,a	next_bcc1
	set	0x0,	%l0	/* executed */	

	ba	diag_fail
	set	0xffff0009,	%l1

next_bcc1:
	brnz	%l0,	diag_fail
	set	0xffff0009,	%l1

	set	0x1,	%l0
	set	0x0,	%l1

	subcc	%l1,	%l0,	%l2	/* carry is set */

	bcc,a	diag_fail	/* should not branch */
	set	0x0,	%l0	/* not exected */

	brz	%l0,	diag_fail
	set	0xffff0009,	%l1

!!-----------------------------------------------------
!!	BCS	BCS,a
!!-----------------------------------------------------
Test_bcs:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l1,	%l3
	bcs,a	diag_fail	/* not brch on greater */
	set	0x0,	%l0	/* not executed */

	brz,a	%l0,	diag_fail
	nop

	subcc	%l0,	%l2,	%l3
	bcs,a	diag_fail	/* not b on equal */
	set	0x0,	%l0	/* not executed */

	brz,a	%l0,	diag_fail
	nop

	subcc	%l1,	%l0,	%l3
	bcs	next_bcs0	/* b on carrier set */
	nop

	ba	diag_fail
	set	0xffff000a,	%l1

next_bcs0:
	bcs,a	next_bcs1
	set	0x0,	%l0	/* executed */	

	ba	diag_fail
	set	0xffff000a,	%l1

next_bcs1:
	brnz	%l0,	diag_fail
	set	0xffff000a,	%l1

!!-----------------------------------------------------
!!	BPOS	BPOS,a
!!-----------------------------------------------------
Test_bpos:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l1,	%l0,	%l3
	bpos,a	diag_fail	/* not brch on negative */
	set	0x0,	%l0	/* not executed */

	brz	%l0,	diag_fail
	nop

	subcc	%l0,	%l1,	%l3
	bpos	next_bpos0	/* b on positive */
	nop

	ba	diag_fail
	set	0xffff000b,	%l1

next_bpos0:
	bpos,a	next_bpos1
	set	0x0,	%l0	/* executed */	

	ba	diag_fail
	set	0xffff000b,	%l1

next_bpos1:
	set	0x1,	%l0
	set	0x1,	%l1
	subcc	%l0,	%l1,	%l2

	bpos	Test_bneg	/* branch on equal */
	nop

	ba	diag_fail
	set	0xffff000b,	%l1

!!-----------------------------------------------------
!!	BNEG	BNEG,a
!!-----------------------------------------------------
Test_bneg:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l1,	%l3
	bneg,a	diag_fail	/* not brch on positive */
	set	0x0,	%l0	/* not executed */

	brz	%l0,	diag_fail
	nop

	subcc	%l0,	%l2,	%l3
	bneg,a	diag_fail	/* not brch on equal */
	set	0x0,	%l0	/* not executed */

	brz	%l0,	diag_fail
	nop

	subcc	%l1,	%l0,	%l3
	bneg	next_bneg0	/* b on negative */
	nop

	ba	diag_fail
	set	0xffff000c,	%l1

next_bneg0:
	bneg,a	next_bneg1
	set	0x0,	%l0	/* executed */	

	ba	diag_fail
	set	0xffff000c,	%l1

next_bneg1:
	brnz	%l0,	diag_fail
	set	0xffff000c,	%l1

!!-----------------------------------------------------
!!	BVC	BVC,a
!!-----------------------------------------------------
	set	0x0,	%l0
	set	0x1,	%l1	

	subcc	%l0,	%l1,	%l2

	bvc	next_bvc0
	nop

	ba	diag_fail
	set	0xffff000d,	%l1

next_bvc0:
        set     0x80000000,     %l0
        set     0x7fffffff,     %l1

        subcc   %l0,    %l1,    %l2	/* V flag is set */ 
	set	0x0,	%l0

	bvc,a	diag_fail	/* not  taken */
	set	0x1,	%l0	/* not exec */

	brnz	%l0,	diag_fail
	nop

!!-----------------------------------------------------
!!	BVS	BVS,a
!!-----------------------------------------------------
	set	0x0,	%l0
	set	0x1,	%l1	

	subcc	%l0,	%l1,	%l2

	bvs,a	diag_fail
	set	0xffff000e,	%l1	/* not executed */

next_bvs0:
        set     0x80000000,     %l0
        set     0x7fffffff,     %l1

        subcc   %l0,    %l1,    %l2	/* V flag is set */ 

	set	0x0,	%l0

	bvs	next_bvs1	/*  taken */
	set	0x1,	%l0	/*  exec */

	ba	diag_fail
	set	0xffff000e,	%l0

next_bvs1:
	brz	%l0,	diag_fail
	nop

/*
 *****************************************************
 *	BPranch on Integer Condition Codes 
 *	with Prediction.
 *				BPPcc
 *****************************************************
 */

!!-----------------------------------------------------
!!	BPPA	BPPA,a,pn
!!-----------------------------------------------------
	set	0x0,	%l0
	set	0x0,	%l1

	sub	%l0,	%l1,	%l2
	ba	%icc,	next_iccbpa0
	set	0x0,	%l0	/* exec */

	ba	diag_fail
	set	0xffff0000,	%l1

next_iccbpa0:
	ba,a	%icc,	next_iccbpa1
	set	0x1,	%l0	/* not exected */

	ba	diag_fail
	set	0xffff0000,	%l1

next_iccbpa1:
	ba,a,pn	%icc,	next_iccbpa2
	set	0x2,	%l0	/* not exected */

	ba	diag_fail
	set	0xffff0000,	%l1

next_iccbpa2:
	ba,pn	%icc,	next_iccbpa3
	set	0x3,	%l0	/* exected */

	ba	diag_fail
	set	0xffff0000,	%l1

next_iccbpa3:
	set	0x3,	%l2
	sub	%l2,	%l0,	%l3

	brnz	%l3,	diag_fail
	set	0xffff0000,	%l1	

BPA_Xcc:
        ba      %xcc,   next_xccbpa0
        set     0x0,    %l0     /* exec */

        ba      diag_fail
        set     0xffff0000,     %l1

next_xccbpa0:
        ba,a    %xcc,   next_xccbpa1
        set     0x1,    %l0     /* not exected */

        ba      diag_fail
        set     0xffff0000,     %l1

next_xccbpa1:
        ba,a,pn %xcc,   next_xccbpa2
        set     0x2,    %l0     /* not exected */

        ba      diag_fail
        set     0xffff0000,     %l1

next_xccbpa2:
        ba,pn   %xcc,   next_xccbpa3
        set     0x3,    %l0     /* exected */

        ba      diag_fail
        set     0xffff0000,     %l1

next_xccbpa3:
        set     0x3,    %l2
        sub     %l2,    %l0,    %l3

        brnz    %l3,    diag_fail
        set     0xffff0000,     %l1

!!-----------------------------------------------------
!!	BPN	BPN,a,pn
!!-----------------------------------------------------
        bn     	%icc,	diag_fail
        set     0x0,    %l0     /* executed */

        bn,a   	%icc,	diag_fail
        set     0x2,    %l0     /* not exec */

        bn,pn  	%icc,	diag_fail
        set     0x3,    %l0     /* exec */

        bn,a,pn	%icc,	diag_fail
        set     0x4,    %l0     /* not exec */

next_bpn1:
	set	0x3,	%l1
	sub	%l0,	%l1,	%l3
        brnz    %l3,    diag_fail
        set     0xffff0001,     %l1

/*
 ***************
 * BPN Xcc
 ***************
 */
BPN_Xcc:
        bn     	%xcc,	diag_fail
        set     0x0,    %l0     /* executed */

        bn,a   	%xcc,	diag_fail
        set     0x2,    %l0     /* not exec */

        bn,pn  	%xcc,	diag_fail
        set     0x3,    %l0     /* delay slot exec */

        bn,a,pn	%xcc,	diag_fail
        set     0x4,    %l0     /* not exec */

next_xccbpn1:
	set	0x3,	%l1
	sub	%l0,	%l1,	%l3
        brnz    %l3,    diag_fail
        set     0xffff0001,     %l1

!!-----------------------------------------------------
!!	BPNE	BPNE,a,pn	
!!-----------------------------------------------------
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l1,	%l3
	bne	%icc,	next_bpne0
	set	0x0,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0002,	%l1

next_bpne0:
	subcc	%l0,	%l1,	%l3
	bne,a	%icc,	diag_fail
	set	0x2,	%l0	/* not executed */	

	bne,pn	%icc,	diag_fail
	set	0x3,	%l0	/* executed */	

	bne,a,pn %icc,	diag_fail
	set	0x4,	%l0	/* not executed */	

next_bpne1:
	set	0x3,	%l2
	sub	%l0,	%l2,	%l3

	brnz	%l3,	diag_fail
	set	0xffff0002,	%l1

	set	0x0,	%l0
	wr	%l0,	0x4,	%ccr
	nop			/* this nop is needed because of the pipeline */

	bne	%icc,	diag_fail /* when z=1 , op result should be equal to zero */ 
				  /* thus, should not branch to fail */
	nop

/*
 ****************************
 *	XCC 	BPNE 	
 ****************************
 */
        set     0x1,    %l0
        set     0x0,    %l1
        set     0x1,    %l2

        subcc   %l0,    %l1,    %l3
        bne     %xcc,   next_xccbpne0
        set     0x0,    %l0     /* executed */

        ba      diag_fail
        set     0xffff0002,     %l1

next_xccbpne0:
        subcc   %l0,    %l1,    %l3
        bne,a   %xcc,   diag_fail
        set     0x2,    %l0     /* not executed */

        bne,pn  %xcc,   diag_fail
        set     0x3,    %l0     /* executed */

        bne,a,pn %xcc,  diag_fail
        set     0x4,    %l0     /* not executed */

next_xccbpne1:
        set     0x3,    %l2
        sub     %l0,    %l2,    %l3

        brnz    %l3,    diag_fail
        set     0xffff0002,     %l1

        set     0x0,    %l0
        wr      %l0,    0x40,    %ccr
        nop                     /* this nop is needed because of the pipeline */

        bne     %xcc,   diag_fail /* when z=1 , op result should be equal to zero */
                                  /* thus, should not branch to fail */
        nop

!!-----------------------------------------------------
!!	BPE	BPE,a
!!-----------------------------------------------------
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l2,	%l3
	be	%icc,	next_bpe0
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0003,	%l1

next_bpe0:
	subcc	%l2,	%l1,	%l3	/* l2 > l1 */

	be,a	%icc,	diag_fail
	set	0x2,	%l0	/* not executed */	

	be,pn	%icc,	diag_fail
	set	0x3,	%l0	/* executed */	

	be,a,pn	%icc,	diag_fail
	set	0x4,	%l0	/* not executed */	

next_bpe1:
	set	0x3,	%l2
	sub	%l2,	%l0,	%l3
	
	brnz	%l3,	diag_fail
	set	0xffff0003,	%l1

	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop			/* this nop is needed because of the pipeline */

	be	%icc,	diag_fail
	nop

/*
 ***************
 * BPE Xcc
 ***************
 */
BPE_Xcc:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l2,	%l3
	be	%xcc,	next_xccbpe0
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0003,	%l1

next_xccbpe0:
	subcc	%l2,	%l1,	%l3	/* l2 > l1 */

	be,a	%xcc,	diag_fail
	set	0x2,	%l0	/* not executed */	

	be,pn	%xcc,	diag_fail
	set	0x3,	%l0	/* executed */	

	be,a,pn	%xcc,	diag_fail
	set	0x4,	%l0	/* not executed */	

next_xccbpe1:
	set	0x3,	%l2
	sub	%l2,	%l0,	%l3
	
	brnz	%l3,	diag_fail
	set	0xffff0003,	%l1

	set	0x0,	%l0
	wr	%l0,	0x00,	%ccr
	nop			/* this nop is needed because of the pipeline */

	be	%xcc,	diag_fail
	nop

!!-----------------------------------------------------
!!	BPG	BPG,a
!!-----------------------------------------------------
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l1,	%l3
	bg	%icc,	next_bpg0
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0004,	%l1

next_bpg0:
	bg,a	%icc,	next_bpg1
	set	0x0,	%l0	/* executed */	

	ba	diag_fail
	set	0xffff0004,	%l1

next_bpg1:
	brnz	%l0,	diag_fail
	set	0xffff0004,	%l1

	set	0x1,	%l0
	set	0x0,	%l1
	set	0x2,	%l2

	sub	%l1,	%l0,	%l3	
	sub	%l1,	%l2,	%l4	

	subcc	%l4,	%l3,	%l5	/* l4 < l3 */

	bg,pn	%icc,	diag_fail	/* not taken */
	set	0x2,	%l0	/* executed */

	bg,a,pn	%icc,	diag_fail	/* not taken */
	set	0x3,	%l0	/* not executed */

	sub	%l0,	0x2,	%l6
	brnz	%l6,	diag_fail
	nop

	subcc	%l3,	%l4,	%l5
	bg	%icc,	BPG_Xcc
	nop

	ba	diag_fail
	set	0xffff0004,	%l1
/*
 ***********************
 *	BPG %xcc 
 ***********************
 */
BPG_Xcc:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l1,	%l3
	bg	%xcc,	next_xccbpg0
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0004,	%l1

next_xccbpg0:
	bg,a	%xcc,	next_xccbpg1
	set	0x0,	%l0	/* executed */	

	ba	diag_fail
	set	0xffff0004,	%l1

next_xccbpg1:
	brnz	%l0,	diag_fail
	set	0xffff0004,	%l1

	set	0x1,	%l0
	set	0x0,	%l1
	set	0x2,	%l2

	sub	%l1,	%l0,	%l3	
	sub	%l1,	%l2,	%l4	

	subcc	%l4,	%l3,	%l5	/* l4 < l3 */
	bg,pn	%xcc,	diag_fail	/* not taken */
	set	0x2,	%l0	/* executed */

	bg,a,pn	%xcc,	diag_fail	/* not taken */
	set	0x3,	%l0	/* not executed */

	sub	%l0,	0x2,	%l6
	brnz	%l6,	diag_fail
	nop

	subcc	%l3,	%l4,	%l5
	bg	%xcc,	Test_bple
	nop

	ba	diag_fail
	set	0xffff0004,	%l1

!!-----------------------------------------------------
!!	BPLE	BPLE,a
!!-----------------------------------------------------
Test_bple:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l1,	%l0,	%l3
	ble	%icc,	next_bple0	/* b on less */
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0005,	%l1

next_bple0:
	subcc	%l2,	%l1,	%l3	/* l2 > l1 */

	ble,a	%icc,	diag_fail	/* not b */
	set	0x2,	%l0	/* not executed */	

	ble,pn	%icc,	diag_fail
	set	0x3,	%l0	/* executed */	

	ble,a,pn	%icc,	diag_fail	/* not b */
	set	0x4,	%l0	/* not executed */	

next_bple2:
	sub	%l0,	0x3,	%l3

	brnz	%l3,	diag_fail
	set	0xffff0005,	%l1

next_bple3:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l2,	%l0,	%l3
	ble	%icc,	next_bple4	/* b on equal */
	set	0x0,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0005,	%l1

next_bple4:
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1
/*
 ***********************
 *	BPLE %xcc 
 ***********************
 */
BPLE_Xcc:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l1,	%l0,	%l3
	ble	%xcc,	next_xccbple0	/* b on less */
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0005,	%l1

next_xccbple0:
	subcc	%l2,	%l1,	%l3	/* l2 > l1 */

	ble,a	%xcc,	diag_fail	/* not b */
	set	0x2,	%l0	/* not executed */	

	ble,pn	%xcc,	diag_fail
	set	0x3,	%l0	/* executed */	

	ble,a,pn	%xcc,	diag_fail	/* not b */
	set	0x4,	%l0	/* not executed */	

next_xccbple2:
	sub	%l0,	0x3,	%l3

	brnz	%l3,	diag_fail
	set	0xffff0005,	%l1

next_xccbple3:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l2,	%l0,	%l3
	ble	%xcc,	next_xccbple4	/* b on equal */
	set	0x0,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0005,	%l1

next_xccbple4:
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1

!!-----------------------------------------------------
!!	BPGE	BPGE,a
!!-----------------------------------------------------
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l1,	%l3
	bge	%icc,	next_bpge0	/* b on greater */
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0005,	%l1

next_bpge0:
	subcc	%l1,	%l2,	%l3	/* l1 < l2 */

	bge,a	%icc,	diag_fail
	set	0x2,	%l0	/* not exec */

	bge,pn	%icc,	diag_fail
	set	0x3,	%l0	/* exec */

	bge,a,pn %icc,	diag_fail
	set	0x4,	%l0	/* exec */

next_bpge1:
	sub	%l0,	0x3,	%l3
	brnz	%l3,	diag_fail
	set	0xffff0005,	%l1
	
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l2,	%l0,	%l3
	bge	%icc,	next_bpge2	/* b on equal */
	set	0x0,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0005,	%l1

next_bpge2:
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1

/*
 ****************
 * BPGE Xcc
 ****************
 */
BPGE_Xcc:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l1,	%l3
	bge	%xcc,	next_xccbpge0	/* b on greater */
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0005,	%l1

next_xccbpge0:
	subcc	%l1,	%l2,	%l3	/* l1 < l2 */

	bge,a	%xcc,	diag_fail
	set	0x2,	%l0	/* not exec */

	bge,pn	%xcc,	diag_fail
	set	0x3,	%l0	/* exec */

	bge,a,pn %xcc,	diag_fail
	set	0x4,	%l0	/* exec */

next_xccbpge1:
	sub	%l0,	0x3,	%l3
	brnz	%l3,	diag_fail
	set	0xffff0005,	%l1
	
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l2,	%l0,	%l3
	bge	%xcc,	next_xccbpge2	/* b on equal */
	set	0x0,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0005,	%l1

next_xccbpge2:
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1

!!-----------------------------------------------------
!!	BPL	BPL,a
!!-----------------------------------------------------
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l1,	%l0,	%l3
	bl	%icc,	next_bpl0
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0006,	%l1

next_bpl0:
	subcc	%l2,	%l1,	%l3	/* l2 > l1 */

	bl,a	%icc,	diag_fail
	set	0x2,	%l0	/* not executed */	

	bl,pn	%icc,	diag_fail
	set	0x3,	%l0	/* executed */	

	bl,a,pn	%icc,	diag_fail
	set	0x4,	%l0	/* executed */	

next_bpl1:
	sub	%l0,	0x3,	%l3
	
	brnz	%l3,	diag_fail
	set	0xffff0006,	%l1

/*
 ******************
 * BPL Xcc	
 ******************
 */
BPL_Xcc:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l1,	%l0,	%l3
	bl	%xcc,	next_xccbpl0
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0006,	%l1

next_xccbpl0:
	subcc	%l2,	%l1,	%l3	/* l2 > l1 */

	bl,a	%xcc,	diag_fail
	set	0x2,	%l0	/* not executed */	

	bl,pn	%xcc,	diag_fail
	set	0x3,	%l0	/* executed */	

	bl,a,pn	%xcc,	diag_fail
	set	0x4,	%l0	/* executed */	

next_xccbpl1:
	sub	%l0,	0x3,	%l3
	brnz	%l3,	diag_fail
	set	0xffff0006,	%l1

!!-----------------------------------------------------
!!	BPGU	BPGU,a
!!-----------------------------------------------------
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l1,	%l3
	bgu	%icc,	next_bpgu0
	nop

	ba	diag_fail
	set	0xffff0007,	%l1

next_bpgu0:
	subcc	%l2,	%l0,	%l3	/* equal */

	bgu,a	%icc,	diag_fail
	set	0x2,	%l0	/* not executed */	

	bgu,pn	%icc,	diag_fail
	set	0x3,	%l0	/* executed */	

	bgu,a,pn	%icc,	diag_fail
	set	0x3,	%l0	/* not executed */	

next_bpgu1:
	sub	%l0,	0x3,	%l3
	brnz	%l3,	diag_fail
	set	0xffff0007,	%l1

	set	0x1,	%l0
	set	0x0,	%l1
	set	0x2,	%l2

	sub	%l1,	%l0,	%l3	
	sub	%l1,	%l2,	%l4	

	subcc	%l4,	%l3,	%l5	/* carry is set */

	bgu	%icc,	diag_fail
	set	0xffff0007,	%l1

/* 
 *************
 * BPGU Xcc
 *************
 */ 
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l1,	%l3
	bgu	%xcc,	next_xccbpgu0
	nop

	ba	diag_fail
	set	0xffff0007,	%l1

next_xccbpgu0:
	subcc	%l2,	%l0,	%l3	/* equal */

	bgu,a	%xcc,	diag_fail
	set	0x2,	%l0	/* not executed */	

	bgu,pn	%xcc,	diag_fail
	set	0x3,	%l0	/* executed */	

	bgu,a,pn	%xcc,	diag_fail
	set	0x3,	%l0	/* not executed */	

next_xccbpgu1:
	sub	%l0,	0x3,	%l3
	brnz	%l3,	diag_fail
	set	0xffff0007,	%l1

	set	0x1,	%l0
	set	0x0,	%l1
	set	0x2,	%l2

	sub	%l1,	%l0,	%l3	
	sub	%l1,	%l2,	%l4	

	subcc	%l4,	%l3,	%l5	/* carry is set */

	bgu	%xcc,	diag_fail
	set	0xffff0007,	%l1

!!-----------------------------------------------------
!!	BPLEU	BPLEU,a
!!-----------------------------------------------------
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l2,	%l3
	bleu	%icc,	next_bpleu0	/* b on equal */
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0008,	%l1

next_bpleu0:
	subcc	%l2,	%l1,	%l3	/* l2 > l1 */

	bleu,a	%icc,	diag_fail
	set	0x2,	%l0	/* not executed */	

	bleu,pn	%icc,	diag_fail
	set	0x3,	%l0	/* executed */	

	bleu,a,pn	%icc,	diag_fail
	set	0x4,	%l0	/* not executed */	

next_bpleu1:
	sub	%l0,	0x3,	%l3
	brnz	%l3,	diag_fail
	set	0xffff0008,	%l1

	set	0x1,	%l0
	set	0x0,	%l1
	subcc	%l1,	%l0,	%l2	/* carry is set */

	bleu	%icc,	BPLEU_Xcc
	nop

	ba	diag_fail
	set	0xffff0008,	%l1

/*
 ************
 * BPLEU Xcc
 ************
 */
BPLEU_Xcc:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l2,	%l3
	bleu	%xcc,	next_xccbpleu0	/* b on equal */
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0008,	%l1

next_xccbpleu0:
	subcc	%l2,	%l1,	%l3	/* l2 > l1 */

	bleu,a	%xcc,	diag_fail
	set	0x2,	%l0	/* not executed */	

	bleu,pn	%xcc,	diag_fail
	set	0x3,	%l0	/* executed */	

	bleu,a,pn	%xcc,	diag_fail
	set	0x4,	%l0	/* not executed */	

next_xccbpleu1:
	sub	%l0,	0x3,	%l3
	brnz	%l3,	diag_fail
	set	0xffff0008,	%l1

	set	0x1,	%l0
	set	0x0,	%l1
	subcc	%l1,	%l0,	%l2	/* carry is set */

	bleu	%xcc,	Test_bpcc
	nop

	ba	diag_fail
	set	0xffff0008,	%l1

!!-----------------------------------------------------
!!	BPCC	BPCC,a
!!-----------------------------------------------------
Test_bpcc:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l1,	%l3
	bcc	%icc,	next_bpcc0	/* b on greater */
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0009,	%l1

next_bpcc0:
	bcc,a	%icc,	next_bpcc1
	set	0x0,	%l0	/* executed */	

	ba	diag_fail
	set	0xffff0009,	%l1

next_bpcc1:
	brnz	%l0,	diag_fail
	set	0xffff0009,	%l1

	set	0x1,	%l0
	set	0x0,	%l1

	subcc	%l1,	%l0,	%l2	/* carry is set */

	bcc,a	%icc,	diag_fail	/* should not branch */
	set	0x2,	%l0	/* not exected */

	bcc,pn	%icc,	diag_fail	/* should not branch */
	set	0x3,	%l0	/*  exected */

	bcc,a,pn %icc,	diag_fail	/* should not branch */
	set	0x2,	%l0	/* not exected */

	sub	%l0,	0x3,	%l3
	brnz	%l3,	diag_fail
	set	0xffff0009,	%l1

/*
 ***********
 * BPCC Xcc
 ***********
 */
BPCC_Xcc:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l1,	%l3
	bcc	%xcc,	next_xccbpcc0	/* b on greater */
	set	0x1,	%l0	/* executed */

	ba	diag_fail
	set	0xffff0009,	%l1

next_xccbpcc0:
	bcc,a	%xcc,	next_xccbpcc1
	set	0x0,	%l0	/* executed */	

	ba	diag_fail
	set	0xffff0009,	%l1

next_xccbpcc1:
	brnz	%l0,	diag_fail
	set	0xffff0009,	%l1

	set	0x1,	%l0
	set	0x0,	%l1

	subcc	%l1,	%l0,	%l2	/* carry is set */

	bcc,a	%xcc,	diag_fail	/* should not branch */
	set	0x2,	%l0	/* not exected */

	bcc,pn	%xcc,	diag_fail	/* should not branch */
	set	0x3,	%l0	/*  exected */

	bcc,a,pn %xcc,	diag_fail	/* should not branch */
	set	0x2,	%l0	/* not exected */

	sub	%l0,	0x3,	%l3
	brnz	%l3,	diag_fail
	set	0xffff0009,	%l1

!!-----------------------------------------------------
!!	BPCS	BPCS,a
!!-----------------------------------------------------
Test_bpcs:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l1,	%l3

	bcs,a	%icc,	diag_fail	/* not brch on greater */
	set	0x2,	%l0	/* not executed */

	bcs,pn	%icc,	diag_fail	/* not brch on greater */
	set	0x3,	%l0	/*  executed */

	bcs,a,pn	%icc,	diag_fail	/* not brch on greater */
	set	0x4,	%l0	/* not executed */

	sub	%l0,	0x3,	%l3
	brnz	%l3,	diag_fail
	set	0xffff000a,	%l1

	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l2,	%l3

	bcs,a	%icc,	diag_fail	/* not b on equal */
	set	0x0,	%l0	/* not executed */

	subcc	%l1,	%l0,	%l3
	bcs	%icc,	next_bpcs0	/* b on carrier set */
	nop

	ba	diag_fail
	set	0xffff000a,	%l1

next_bpcs0:
	bcs,a	%icc,	next_bpcs1
	set	0x0,	%l0	/* executed */	

	ba	diag_fail
	set	0xffff000a,	%l1

next_bpcs1:
	brnz	%l0,	diag_fail
	set	0xffff000a,	%l1

/*
 ********************
 * BPCS Xcc 
 ********************
 */
BPCS_Xcc:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l1,	%l3

	bcs,a	%xcc,	diag_fail	/* not brch on greater */
	set	0x2,	%l0	/* not executed */

	bcs,pn	%xcc,	diag_fail	/* not brch on greater */
	set	0x3,	%l0	/*  executed */

	bcs,a,pn %xcc,	diag_fail	/* not brch on greater */
	set	0x4,	%l0	/* not executed */

	sub	%l0,	0x3,	%l3
	brnz	%l3,	diag_fail
	set	0xffff000a,	%l1

	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l2,	%l3

	bcs,a	%xcc,	diag_fail	/* not b on equal */
	set	0x0,	%l0	/* not executed */

	subcc	%l1,	%l0,	%l3
	bcs	%xcc,	next_xccbpcs0	/* b on carrier set */
	nop

	ba	diag_fail
	set	0xffff000a,	%l1

next_xccbpcs0:
	bcs,a	%xcc,	next_xccbpcs1
	set	0x0,	%l0	/* executed */	

	ba	diag_fail
	set	0xffff000a,	%l1

next_xccbpcs1:
	brnz	%l0,	diag_fail
	set	0xffff000a,	%l1

!!-----------------------------------------------------
!!	BPPOS	BPPOS,a
!!-----------------------------------------------------
Test_bppos:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l1,	%l0,	%l3

	bpos,a	%icc,	diag_fail	/* not brch on negative */
	set	0x2,	%l0	/* not executed */

	bpos,pn	%icc,	diag_fail	/* not brch on negative */
	set	0x3,	%l0	/*  executed */

	bpos,a,pn	%icc,	diag_fail	/* not brch on negative */
	set	0x4,	%l0	/* not executed */

	sub	%l0,	0x3,	%l3	
	brz	%l0,	diag_fail
	nop

	subcc	%l0,	%l1,	%l3
	bpos	%icc,	next_bppos0	/* b on positive */
	nop

	ba	diag_fail
	set	0xffff000b,	%l1

next_bppos0:
	bpos,a	%icc,	next_bppos1
	set	0x0,	%l0	/* executed */	

	ba	diag_fail
	set	0xffff000b,	%l1

next_bppos1:
	set	0x1,	%l0
	set	0x1,	%l1
	subcc	%l0,	%l1,	%l2

	bpos	%icc,	BPPOS_Xcc	/* branch on equal */
	nop

	ba	diag_fail
	set	0xffff000b,	%l1

/*
 ********************
 * BPPOS Xcc
 ********************
 */
BPPOS_Xcc:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l1,	%l0,	%l3

	bpos,a	%xcc,	diag_fail	/* not brch on negative */
	set	0x2,	%l0	/* not executed */

	bpos,pn	%xcc,	diag_fail	/* not brch on negative */
	set	0x3,	%l0	/*  executed */

	bpos,a,pn	%xcc,	diag_fail	/* not brch on negative */
	set	0x4,	%l0	/* not executed */

	sub	%l0,	0x3,	%l3	
	brz	%l0,	diag_fail
	nop

	subcc	%l0,	%l1,	%l3
	bpos	%xcc,	next_xccbppos0	/* b on positive */
	nop

	ba	diag_fail
	set	0xffff000b,	%l1

next_xccbppos0:
	bpos,a	%xcc,	next_xccbppos1
	set	0x0,	%l0	/* executed */	

	ba	diag_fail
	set	0xffff000b,	%l1

next_xccbppos1:
	set	0x1,	%l0
	set	0x1,	%l1
	subcc	%l0,	%l1,	%l2

	bpos	%xcc,	Test_bpneg	/* branch on equal */
	nop

	ba	diag_fail
	set	0xffff000b,	%l1

!!-----------------------------------------------------
!!	BPNEG	BPNEG,a
!!-----------------------------------------------------
Test_bpneg:
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l1,	%l3
	bneg,a	%icc,	diag_fail	/* not brch on positive */
	set	0x0,	%l0	/* not executed */

	brz	%l0,	diag_fail
	nop

	subcc	%l0,	%l2,	%l3

	bneg,a	%icc,	diag_fail	/* not brch on equal */
	set	0x2,	%l0	/* not executed */

	bneg,pn	%icc,	diag_fail	/* not brch on equal */
	set	0x3,	%l0	/*  executed */

	bneg,a,pn	%icc,	diag_fail	/* not brch on equal */
	set	0x4,	%l0	/*  not executed */

	sub	%l0,	0x3,	%l3
	brnz	%l3,	diag_fail
	set	0xffff000c,	%l1

	set	0x1,	%l0
	set	0x0,	%l1

	subcc	%l1,	%l0,	%l3
	bneg	%icc,	next_bpneg0	/* b on negative */
	nop

	ba	diag_fail
	set	0xffff000c,	%l1

next_bpneg0:
	bneg,a	%icc,	next_bpneg1
	set	0x0,	%l0	/* executed */	

	ba	diag_fail
	set	0xffff000c,	%l1

next_bpneg1:
	brnz	%l0,	diag_fail
	set	0xffff000c,	%l1

/*
 *****************
 * BNEG Xcc
 *****************
 */
	set	0x1,	%l0
	set	0x0,	%l1
	set	0x1,	%l2

	subcc	%l0,	%l1,	%l3
	bneg,a	%xcc,	diag_fail	/* not brch on positive */
	set	0x0,	%l0	/* not executed */

	brz	%l0,	diag_fail
	nop

	subcc	%l0,	%l2,	%l3

	bneg,a	%xcc,	diag_fail	/* not brch on equal */
	set	0x2,	%l0	/* not executed */

	bneg,pn	%xcc,	diag_fail	/* not brch on equal */
	set	0x3,	%l0	/*  executed */

	bneg,a,pn	%xcc,	diag_fail	/* not brch on equal */
	set	0x4,	%l0	/*  not executed */

	sub	%l0,	0x3,	%l3
	brnz	%l3,	diag_fail
	set	0xffff000c,	%l1

	set	0x1,	%l0
	set	0x0,	%l1

	subcc	%l1,	%l0,	%l3
	bneg	%xcc,	next_xccbpneg0	/* b on negative */
	nop

	ba	diag_fail
	set	0xffff000c,	%l1

next_xccbpneg0:
	bneg,a	%xcc,	next_xccbpneg1
	set	0x0,	%l0	/* executed */	

	ba	diag_fail
	set	0xffff000c,	%l1

next_xccbpneg1:
	brnz	%l0,	diag_fail
	set	0xffff000c,	%l1

!!-----------------------------------------------------
!!	BPVC	BPVC,a
!!-----------------------------------------------------
	set	0x0,	%l0
	set	0x1,	%l1	

	subcc	%l0,	%l1,	%l2

	bvc	%icc,	next_bpvc0
	nop

	ba	diag_fail
	set	0xffff000d,	%l1

next_bpvc0:
        set     0x80000000,     %l0
        set     0x7fffffff,     %l1

        subcc   %l0,    %l1,    %l2	/* V flag is set */ 
	set	0x0,	%l0

	bvc,a	%icc,	diag_fail	/* not  taken */
	set	0x1,	%l0	/* not exec */

	bvc,pn	%icc,	diag_fail	/* not  taken */
	set	0x2,	%l0	/*  exec */

	bvc,a,pn %icc,	diag_fail	/* not  taken */
	set	0x3,	%l0	/* not exec */

	sub	%l0,	0x2, 	%l3
	brnz	%l3,	diag_fail
	set	0xffff000d,	%l1

/*
 ********************
 *	BPVC_Xcc
 ********************
 */
BPVC_Xcc:
	set	0x0,	%l0
	set	0x1,	%l1	

	subcc	%l0,	%l1,	%l2

	bvc	%xcc,	next_xccbpvc0
	nop

	ba	diag_fail
	set	0xffff000d,	%l1

next_xccbpvc0:
	set	0x0,	%l2
        setx    0x8000000000000000,     %l2,	%l0
        setx    0x7fffffffffffffff,     %l2,	%l1

        subcc   %l0,    %l1,    %l2	/* V flag is set */ 
	set	0x0,	%l0

	bvc,a	%xcc,	diag_fail	/* not  taken */
	set	0x1,	%l0	/* not exec */

	bvc,pn	%xcc,	diag_fail	/* not  taken */
	set	0x2,	%l0	/*  exec */

	bvc,a,pn %xcc,	diag_fail	/* not  taken */
	set	0x3,	%l0	/* not exec */

	sub	%l0,	0x2, 	%l3
	brnz	%l3,	diag_fail
	set	0xffff000d,	%l1

!!-----------------------------------------------------
!!	BPVS	BPVS,a
!!-----------------------------------------------------
	set	0x0,	%l0
	set	0x1,	%l1	

	subcc	%l0,	%l1,	%l2

	bvs,a	%icc,	diag_fail
	set	0x1,	%l1	/* not executed */

	bvs,pn	%icc,	diag_fail
	set	0x2,	%l1	/* executed */

	bvs,a,pn	%icc,	diag_fail
	set	0x3,	%l1	/* not executed */

	sub	%l1,	0x2,	%l3
	brnz	%l3,	diag_fail
	set	0xffff000e,	%l1
	
next_bpvs0:
        set     0x80000000,     %l0
        set     0x7fffffff,     %l1

        subcc   %l0,    %l1,    %l2	/* V flag is set */ 
	set	0x0,	%l0
	bvs	%icc,	next_bpvs1	/*  taken */
	set	0x1,	%l0	/*  exec */

	ba	diag_fail
	set	0xffff000e,	%l0

next_bpvs1:
	brz	%l0,	diag_fail
	nop

/*
 ************************
 *  BPVS Xcc
 ************************
 */
	set	0x0,	%l0
	set	0x1,	%l1	

	subcc	%l0,	%l1,	%l2

	bvs,a	%xcc,	diag_fail
	set	0x1,	%l1	/* not executed */

	bvs,pn	%xcc,	diag_fail
	set	0x2,	%l1	/* executed */

	bvs,a,pn	%xcc,	diag_fail
	set	0x3,	%l1	/* not executed */

	sub	%l1,	0x2,	%l3
	brnz	%l3,	diag_fail
	set	0xffff000e,	%l1
	
next_xccbpvs0:
	set	0x0,	%l2
        setx     0x8000000000000000,     %l2,	%l0
        setx     0x7fffffffffffffff,     %l2,	%l1

        subcc   %l0,    %l1,    %l2	/* V flag is set */ 
	set	0x0,	%l0
	bvs	%xcc,	next_xccbpvs1	/*  taken */
	set	0x1,	%l0	/*  exec */

	ba	diag_fail
	set	0xffff000e,	%l0

next_xccbpvs1:
	brz	%l0,	diag_fail
	nop

/*
 **************************************
 *	Divide ( 64-bit / 32 bit ) 
 **************************************
 */
	call	test_div
	nop

!!--------------------------------
!!	UDIV
!!--------------------------------
test_div:
	set	0x4,	%l0
	set	0x2,	%l1

	udiv	%l0,	%l1,	%l2
	sub	%l2,	0x2,	%l3

	brnz	%l3,	diag_fail
	set	0xffff0001,	%l1	

	udiv	%l0,	0x2,	%l3
	sub	%l3,	0x2,	%l4
	brnz	%l4,	diag_fail
	set	0xffff0001,	%l1	

!!--------------------------------
!!	UDIVcc
!!--------------------------------
	set	0x0,	%l0	
	setx	0x0000000800000000, %l0, %l1
	set	0x2,	%l2
	
	udivcc	%l1,	%l2,	%l3
					/* zero bit is set for x_icc */

	bne,a	%icc,	diag_fail
	set	0xffff0000,	%l1

!!--------------------------------
!!	SDIV
!!--------------------------------
	set	0x4,	%l0
	sub	%l0,	0x6,	%l1	

	sdiv	%l0,	%l1,	%l2
	add	%l2,	0x2,	%l3

	brnz	%l3,	diag_fail
	set	0xffff0001,	%l1	

	sdiv	%l0,	-2,	%l3
	add	%l3,	0x2,	%l4
	brnz	%l4,	diag_fail
	set	0xffff0001,	%l1	

!!--------------------------------
!!	SDIVcc
!!--------------------------------
	set	0x4,	%l0
	sub	%l0,	0x6,	%l1	

	sdivcc	%l0,	%l1,	%l2
					/* neg bit is set for x_icc */
	bneg	%icc,	next_sdivcc0
	nop

	ba	diag_fail
	set	0xffff0002,	%l1

next_sdivcc0:
	bpos,a	%xcc,	diag_fail
	set	0xffff1112,	%l1

/*
 *****************************************
 *  convert floating point add/subtract
 *****************************************
 */
!!-------------------
!!	fstox
!!-------------------
	set	0x0,	%l0
	setx	fps_cvt_nmd1, 	%l0,	%l1
	
	ld	[%l1+%l0],	%f0 	/* f0 = 2 * (1+1/2) */
	add	%l0,	0x4,	%l0	
	
	ld	[%l1+%l0],	%f2	/* f2 = 4 * (1+1/2) */
	add	%l0,	0x4,	%l0	
	
	ld	[%l1+%l0],	%f4	/* f4 = 8 * (1+1/8) */
	add	%l0,	0x4,	%l0

	fstox	%f0,	%f8
	nop

	fstox	%f2,	%f12
	nop

	fstox	%f4,	%f16
	nop

	faddd	%f12,	%f8,	%f20

	fcmpd	%fcc0,	%f20,	%f16

	fbne	%fcc0,	diag_fail
	set	0xffff0001,	%l1
	
!!-------------------
!!	fdtox
!!-------------------
Test_FDTOX:
	set	0x0,	%l0
	setx	fpd_cvt_nmd1, 	%l0,	%l1
	
	ldd	[%l1+%l0],	%f0 	/* f0 = 2 * (1+1/2) */
	add	%l0,	0x8,	%l0	
	
	ldd	[%l1+%l0],	%f2	/* f2 = 4 * (1+1/2) */
	add	%l0,	0x8,	%l0	
	
	ldd	[%l1+%l0],	%f4	/* f4 = 8 * (1+1/8) */
	add	%l0,	0x8,	%l0

	fdtox	%f0,	%f8
	nop

	fdtox	%f2,	%f12
	nop

	fdtox	%f4,	%f16
	nop

	faddd	%f8,	%f12,	%f20

	fcmpd	%fcc0,	%f20,	%f16

	fbne	%fcc0,	diag_fail
	set	0xffff0002,	%l1

!!-------------------
!!	fstoi
!!-------------------
	set	0x0,	%l0
	setx	fps_cvt_nmd1, 	%l0,	%l1
	
	ld	[%l1+%l0],	%f0 	/* f0 = 2 * (1+1/2) */
	add	%l0,	0x4,	%l0	
	
	ld	[%l1+%l0],	%f1	/* f1 = 4 * (1+1/2) */
	add	%l0,	0x4,	%l0	
	
	ld	[%l1+%l0],	%f2	/* f2 = 8 * (1+1/8) */
	add	%l0,	0x4,	%l0

	fstoi	%f0,	%f4
	nop

	fstoi	%f1,	%f8
	nop

	fstoi	%f2,	%f12
	nop

	fadds	%f4,	%f8,	%f16

	fcmps	%fcc0,	%f12,	%f16

	fbne	%fcc0,	diag_fail
	set	0xffff0003,	%l1
	
!!-------------------
!!	fdtoi
!!-------------------
Test_FDTOI:
	set	0x0,	%l0
	setx	fpd_cvt_nmd1, 	%l0,	%l1
	
	ldd	[%l1+%l0],	%f0 	/* f0 = 2 * (1+1/2) */
	add	%l0,	0x8,	%l0	
	
	ldd	[%l1+%l0],	%f2	/* f2 = 4 * (1+1/2) */
	add	%l0,	0x8,	%l0	
	
	ldd	[%l1+%l0],	%f4	/* f4 = 8 * (1+1/8) */
	add	%l0,	0x8,	%l0

	fdtoi	%f0,	%f8
	nop

	fdtoi	%f2,	%f12
	nop

	fdtoi	%f4,	%f16
	nop

	fadds	%f8,	%f12,	%f20

	fcmps	%fcc0,	%f20,	%f16

	fbne	%fcc0,	diag_fail
	set	0xffff0004,	%l1

/*
 *************************************************
 *	Convert between Floating-Point formats
 *************************************************
 */
!!----------------- 
!!	fstod 
!!----------------- 
	/*
	 * load single value first 
	 */
        set     0x0,    %l0
        setx    fps_cvt_nmd1,   %l0,    %l1

        ld      [%l1+%l0],      %f0     /* f0 = 2 * (1+1/2) */
        add     %l0,    0x4,    %l0

        ld      [%l1+%l0],      %f2     /* f2 = 4 * (1+1/2) */
        add     %l0,    0x4,    %l0

        ld      [%l1+%l0],      %f4     /* f4 = 8 * (1+1/8) */
        add     %l0,    0x4,    %l0

	/* 
	 * load golden conversion data 
	 */
        set     0x0,    %l0
        setx    fpd_cvt_nmd1,   %l0,    %l1

        ldd     [%l1+%l0],      %f6     /* f6 = 2 * (1+1/2) */
        add     %l0,    0x8,    %l0

        ldd     [%l1+%l0],      %f8     /* f8 = 4 * (1+1/2) */
        add     %l0,    0x8,    %l0

        ldd     [%l1+%l0],      %f10     /* f10 = 8 * (1+1/8) */
        add     %l0,    0x8,    %l0

	/* do the conversion */  
	fstod	%f0,	%f12
	fcmpd	%fcc0,	%f12,	%f6

	fbne	%fcc0,	diag_fail
	set	0xffff0005,	%l1

!!---------------------------
!!	fdtos
!!---------------------------
	/* convert double to single */
	fdtos	%f6,	%f14

	fcmps	%fcc0,	%f14,	%f0

	fbne	%fcc0,	diag_fail
	set	0xffff0006,	%l1

!!---------------------------------
!! fqtod, fqtos, fstoq, fdtoq 
!! 	are not supported.
!!---------------------------------

/*
 *************************************
 *	convert integer to floating
 *	point.
 *************************************
 */
!!------------------
!!  fxtos	
!!------------------
	/* load integer value into fp reg */ 
	set	0x0,	%l0
	setx	int2fpd_nmd1, 	%l0,	%l1
	set	0x0,	%l0

	ldd	[%l1+%l0],	%f0	/* 1st 64-bit integer */
	add	%l0,	0x8,	%l0
	
	ldd	[%l1+%l0],	%f2	/* 2nd 64-bit integer 
	add	%l0,	0x8,	%l0

	/* load gd fp value into fp reg */ 
	set	0x0,	%l0
	setx	fps_cvt_nmd1, 	%l0,	%l1
	set	0x0,	%l0

	ld	[%l1+%l0],	%f4	/* 1st golden fp value */
	add	%l0,	0x4,	%l0
	
	ld	[%l1+%l0],	%f6	/* 2nd golden fp value */

	fxtos	%f0,	%f8
	fcmps	%fcc0,	%f8,	%f4
	fbne	%fcc0,	diag_fail
	set	0xffff0007,	%l1
	
	fxtos	%f2,	%f10
	fcmps	%fcc0,	%f10,	%f6
	fbne	%fcc0,	diag_fail
	set	0xffff0007,	%l1

!!-------------------
!!  fxtod	
!!-------------------
	/* load the golden 64 fp values */ 
	set	0x0,	%l0
	setx	fpd_cvt_nmd1, 	%l0,	%l1
	set	0x0,	%l0

	ldd	[%l1+%l0],	%f12	/* 1st 64-bit golden fp */
	add	%l0,	0x8,	%l0
	
	ldd	[%l1+%l0],	%f14	/* 2nd 64-bit golden fp */
	add	%l0,	0x8,	%l0

	fxtod	%f0,	%f16

	fcmpd	%fcc0,	%f16,	%f12

	fbne	%fcc0,	diag_fail
	set	0xffff0008,	%l1

!!------------------------------
!!	fitos
!!------------------------------
        /* load integer value into fp reg */
        set     0x0,    %l0
        setx    int2fps_nmd1,    %l0,    %l1
        set     0x0,    %l0

        ld     	[%l1+%l0],      %f0     /* 1st 32-bit integer */
        add     %l0,    0x4,    %l0

        ld     	[%l1+%l0],      %f2     /* 2nd 32-bit integer
        add     %l0,    0x4,    %l0

        /* load gd fp value into fp reg */
        set     0x0,    %l0
        setx    fps_cvt_nmd1,   %l0,    %l1
        set     0x0,    %l0

        ld     	[%l1+%l0],      %f4     /* 1st 32-bit golden fp value */
        add     %l0,    0x4,    %l0

        ld     	[%l1+%l0],      %f6     /* 2nd golden fp value */

	/* convert 32bit int to 32 fp */
	fitos	%f0,	%f16
	fcmps	%fcc0,	%f16,	%f4

	fbne	%fcc0,	diag_fail
	set	0xffff0009,	%l1
	
!!------------------------------
!!	fitod
!!------------------------------
	/* load the 64bit golden values */
        set     0x0,    %l0
        setx    fpd_cvt_nmd1,   %l0,    %l1

        ldd     [%l1+%l0],      %f18     /* f18 = 2 * (1+1/2) */
        add     %l0,    0x8,    %l0

        ldd     [%l1+%l0],      %f20     /* f20 = 4 * (1+1/2) */
        add     %l0,    0x8,    %l0

	/* convert 32bit int to 64 bit fp value */
	fitod	%f0,	%f22
	fitod	%f2,	%f24

	fcmpd	%fcc0,	%f22,	%f18
	fbne	%fcc0,	diag_fail
	set	0xffff000a,	%l1

	fcmpd	%fcc0,	%f24,	%f20
	fbne	%fcc0,	diag_fail
	set	0xffff000a,	%l1

!!----------------------------------------------
!!	fitoq, fxtoq not supported 
!!----------------------------------------------

/*
 *****************************************
 *	Floating point move inst
 *****************************************
 */
!!-------------------------
!!	fmovs
!!-------------------------
        /* load gd fp value into fp reg */
        set     0x0,    %l0
        setx    fps_cvt_nmd1,   %l0,    %l1
        set     0x0,    %l0

        ld      [%l1+%l0],      %f0     /* 1st s fp value */
        add     %l0,    0x4,    %l0

        ld      [%l1+%l0],      %f2     /* 2nd s fp value */
        add     %l0,    0x4,    %l0
	
        ld      [%l1+%l0],      %f4     /* 3rd s fp value */
        add     %l0,    0x4,    %l0
	
	fmovs	%f0,	%f1
	fmovs	%f2,	%f3	
	fmovs	%f4,	%f5	

	fadds	%f1,	%f3,	%f7

	fcmps	%fcc0,	%f7,	%f5

	fbne	%fcc0,	diag_fail
	set	0xffff000b,	%l1

!!-------------------------
!!	fmovd
!!-------------------------
        /* load double fp value from MEM to fp reg */
        set     0x0,    %l0
        setx    fpd_cvt_nmd1,   %l0,    %l1
        set     0x0,    %l0

        ldd     [%l1+%l0],      %f6     /* 1st d fp value */
        add     %l0,    0x8,    %l0

        ldd     [%l1+%l0],      %f8     /* 2nd d fp value */
        add     %l0,    0x8,    %l0
	
        ldd     [%l1+%l0],      %f10     /* 3rd d fp value */
        add     %l0,    0x8,    %l0
	
	fmovd	%f6,	%f12
	fmovd	%f8,	%f14	
	fmovd	%f10,	%f16	

	faddd	%f12,	%f14,	%f18

	fcmpd	%fcc0,	%f16,	%f18

	fbne	%fcc0,	diag_fail
	set	0xffff000c,	%l1

!!----------------------------
!!  fmovq not supported
!!----------------------------
!!-----------------------
!!	fnegs
!!-----------------------
	fnegs	%f0,	%f12
	fnegs	%f12,	%f14

	fcmps	%fcc0,	%f0,	%f14

	fbne	%fcc0,	diag_fail
	set	0xffff000d,	%l1

!!-----------------------
!!	fnegd
!!-----------------------
	fnegd	%f6,	%f12
	fnegd	%f12,	%f14

	fcmpd	%fcc0,	%f14,	%f6

	fbne	%fcc0,	diag_fail
	set	0xffff000e,	%l1

!!-----------------------
!!	fabss
!!-----------------------
	fnegs	%f0,	%f12
	fabss	%f12,	%f14

	fcmps	%fcc0,	%f0,	%f14

	fbne	%fcc0,	diag_fail
	set	0xffff000f,	%l1

!!-----------------------
!!	fabsd
!!-----------------------
	fnegd	%f6,	%f12
	fabsd	%f12,	%f14

	fcmpd	%fcc0,	%f14,	%f6

	fbne	%fcc0,	diag_fail
	set	0xffff0010,	%l1

/*
 *************************************************
 *	Floating point multiply and divide  
 *************************************************
 */
!!----------------------------
!!	fmuls	
!!----------------------------
        /* load gd fp value into fp reg */
        set     0x0,    %l0
        setx    fps_muldv_nmd1,   %l0,    %l1
        set     0x0,    %l0

        ld      [%l1+%l0],      %f0     /* 1st s fp value */
        add     %l0,    0x4,    %l0

        ld      [%l1+%l0],      %f2     /* 2nd s fp value */
        add     %l0,    0x4,    %l0

        ld      [%l1+%l0],      %f4     /* 3rd s fp value */
        add     %l0,    0x4,    %l0

	fmuls	%f0,	%f2,	%f6

	fcmps	%fcc0,	%f6,	%f4
	
	fbne	%fcc0,	diag_fail
	set	0xffff0011,	%l1	

!!----------------------------
!!	fdivs	
!!----------------------------
	fdivs	%f4,	%f2,	%f6
	fcmps	%fcc0,	%f0,	%f6

	fbne	%fcc0,	diag_fail
	set	0xffff0012,	%l1	

!!----------------------------
!!	fmuld	
!!----------------------------
	set	0x0,	%l0
	setx	fpd_muldv_nmd1,	%l0,	%l1
	set	0x0,	%l0

	ldd	[%l1+%l0],	%f6
	add	%l0,	0x8,	%l0	

	ldd	[%l1+%l0],	%f8
	add	%l0,	0x8,	%l0	

	ldd	[%l1+%l0],	%f10
	add	%l0,	0x8,	%l0	

	fmuld	%f6,	%f8,	%f12

	fcmpd	%fcc0,	%f10,	%f12
	
	fbne	%fcc0,	diag_fail
	set	0xffff0013,	%l1	

!!----------------------------
!!	fdivd	
!!----------------------------
	fdivd	%f10,	%f8,	%f14
	fcmpd	%fcc0,	%f6,	%f14

	fbne	%fcc0,	diag_fail
	set	0xffff0014,	%l1	

!!----------------------------
!!	fsmuld	
!!----------------------------
	fsmuld	%f0,	%f2,	%f16

	fcmpd	%fcc0,	%f16,	%f10	

	fbne	%fcc0,	diag_fail
        set     0xffff0015,     %l1
!!--------------------------------------------
!!  fmulq, fdmulq, fdivq not supported !	
!!--------------------------------------------

/*
 **********************************************
 *	Floating point square root
 **********************************************
 */

!!----------------------------
!!	fsqrts
!!----------------------------
	set	0x0,	%l0
	setx	fps_sqr_nmd1, 	%l0,	%l1

	ld	[%l1+%l0],	%f0	/* f0 = 3 */
	add	%l0,	0x4,	%l0

	ld	[%l1+%l0],	%f1	/* f1 = 6 */
	add	%l0,	0x4,	%l0

	ld	[%l1+%l0],	%f2	/* f2 = 9 */
	add	%l0,	0x4,	%l0
	
	ld	[%l1+%l0],	%f3	/* f3 = 36 */
	add	%l0,	0x4,	%l0

	fsqrts	%f2,	%f4
	!fcmps	%fcc0,	%f4,	%f0

	!fbne	%fcc0,	diag_fail
	!set	0xffff0016,	%l1

	fsqrts	%f3,	%f4
	!fcmps	%fcc0,	%f4,	%f1

	!fbne	%fcc0,	diag_fail
	!set	0xffff0016,	%l1

!!----------------------------
!!	fsqrtd
!!----------------------------
	set	0x0,	%l0
	setx	fpd_sqr_nmd1, 	%l0,	%l1

	ldd	[%l1+%l0],	%f4	/* f4 = 3 */
	add	%l0,	0x8,	%l0

	ldd	[%l1+%l0],	%f6	/* f6 = 6 */
	add	%l0,	0x8,	%l0

	ldd	[%l1+%l0],	%f8	/* f8 = 9 */
	add	%l0,	0x8,	%l0
	
	ldd	[%l1+%l0],	%f10	/* f10 = 36 */
	add	%l0,	0x8,	%l0

	fsqrtd	%f8,	%f12
	!fcmpd	%fcc0,	%f4,	%f12

	!fbne	%fcc0,	diag_fail
	!set	0xffff0017,	%l1

	fsqrtd	%f10,	%f14
	!fcmpd	%fcc0,	%f14,	%f6

	!fbne	%fcc0,	diag_fail
	!set	0xffff0017,	%l1

!!----------------------------
!!	fsqrtq not supported 
!!----------------------------

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
 *  Multiply and Divide 
 ********************************
 */
!!-----------------------
!!	mulx
!!-----------------------
	set	0x0,	%l0

	set	0x3,	%l3
	set	0x9,	%l4
	set	0x1b,	%l5

	mulx	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0001,	%l1

	mulx	%l3,	0x9,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0001,	%l1

	sub	%l0,	3,	%l3
	sub	%l0,	9,	%l4
	mulx	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0001,	%l1

	mulx	%l3,	-9,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0001,	%l1

	sub	%l0,	3,	%l3
	sub	%l0,	27,	%l6
	set	0x9,	%l4

	mulx	%l3,	%l4,	%l7
	sub	%l6,	%l7,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xeeee0001,	%l1

	mulx	%l3,	0x9,	%l7
	sub	%l6,	%l7,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xeeee0001,	%l1

!!------------------------------------
!!	sdivx	( signed divide )
!!------------------------------------
	set	0x0,	%l0
	set	0x3,	%l3
	set	0x9,	%l4
	set	0x1b,	%l5
	
	sdivx	%l5,	%l3,	%l6
	sub	%l6,	%l4,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0002,	%l1

	sdivx	%l5,	0x3,	%l6
	sub	%l6,	%l4,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0002,	%l1

	sub	%l0,	3,	%l3	/* l3 = -3 */
	sdivx	%l5,	%l3,	%l6
	add	%l6,	%l4,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0002,	%l1

	sub	%l0,	3,	%l3	/* l3 = -3 */
	sub	%l0,	27,	%l5	/* l5 = -27 */

	sdivx	%l5,	%l3,	%l6
	sub	%l6,	%l4,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0002,	%l1
	
	sdivx	%l5,	-3,	%l6
	sub	%l6,	%l4,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0002,	%l1

!!------------------------------------
!!	udivx	( divide )
!!------------------------------------
	set	0x0,	%l0
	set	0x3,	%l3
	set	0x9,	%l4
	set	0x1b,	%l5
	
	udivx	%l5,	%l3,	%l6
	sub	%l6,	%l4,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0002,	%l1

	udivx	%l5,	0x3,	%l6
	sub	%l6,	%l4,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0002,	%l1

	sub	%l0,	3,	%l3	/* l3 = 0xfffffffffffffffd */
	udivx	%l5,	%l3,	%l6	/* l6 = l5/l3 = 0 round */
	brnz,a	%l6,	diag_fail
	set	0xeeee0002,	%l1

	sub	%l0,	3,	%l3	/* l3 = 0xfffffffffffffffd */
	sub	%l0,	27,	%l5	/* l5 = 0xffffffffffffffe5 */

	udivx	%l5,	%l3,	%l6	/* l6 = l5/l3 = 0 rounded */
	brnz,a	%l6,	diag_fail
	set	0xeeee0002,	%l1
	
	udivx	%l5,	-3,	%l6
	brnz,a	%l6,	diag_fail
	set	0xeeee0002,	%l1

!!-----------------------
!!	umul
!!-----------------------
	set	0x0,	%l0

	set	0x3,	%l3
	set	0x9,	%l4
	set	0x1b,	%l5

	umul	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0003,	%l1

	umul	%l3,	0x9,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0003,	%l1

!!-----------------------
!!	smul
!!-----------------------
	set	0x0,	%l0

	set	0x3,	%l3
	set	0x9,	%l4
	set	0x1b,	%l5

	smul	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0004,	%l1

	smul	%l3,	0x9,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0004,	%l1

	sub	%l0,	3,	%l3
	sub	%l0,	9,	%l4
	smul	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0004,	%l1

	smul	%l3,	-9,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0004,	%l1

	sub	%l0,	3,	%l3
	sub	%l0,	27,	%l6
	set	0x9,	%l4

	smul	%l3,	%l4,	%l7
	sub	%l6,	%l7,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xeeee0004,	%l1

	smul	%l3,	0x9,	%l7
	sub	%l6,	%l7,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xeeee0004,	%l1

!!-----------------------
!!	umulcc
!!-----------------------
	set	0x0,	%l0

	set	0x3,	%l3
	set	0x9,	%l4
	set	0x1b,	%l5

	umulcc	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0005,	%l1

	umulcc	%l3,	0x9,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0005,	%l1

	umulcc	%l3,	%l0,	%l2	/* Z set */
	bne,a	%icc,	diag_fail
	set	0xeeee0005,	%l1

	bne,a	%xcc,	diag_fail
	set	0xeeee0005,	%l1

	set	0x40000000,	%l3
	set	0x2,	%l4
	umulcc	%l3,	%l4,	%l2	/* icc.N set */
	bpos,a	%icc,	diag_fail
	set	0xeeee0005,	%l1
	
	set	0x0,	%l0	
	set	0xffffffff, 	%l3
	set	0xffffffff, 	%l4
	umulcc	%l3,	%l4,	%l2	/* XCC.N set */
	bpos,a	%xcc,	diag_fail
	set	0xeeee0005,	%l1
		
!!-----------------------
!!	smulcc
!!-----------------------
	set	0x0,	%l0

	set	0x3,	%l3
	set	0x9,	%l4
	set	0x1b,	%l5

	smulcc	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0006,	%l1

	smulcc	%l3,	0x9,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0006,	%l1

	sub	%l0,	3,	%l3
	sub	%l0,	9,	%l4
	smulcc	%l3,	%l4,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0006,	%l1

	smulcc	%l3,	-9,	%l6
	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xeeee0006,	%l1

	sub	%l0,	3,	%l3
	sub	%l0,	27,	%l6
	set	0x9,	%l4

	smulcc	%l3,	%l4,	%l7
	sub	%l6,	%l7,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xeeee0006,	%l1

	smulcc	%l3,	0x9,	%l7
	sub	%l6,	%l7,	%l2
	brnz,a	%l2,	diag_fail	
	set	0xeeee0006,	%l1

	set	0x0,	%l0
	smulcc	%l3,	%l0,	%l2	/* Z set */
	bne,a	%icc,	diag_fail
	set	0xeeee0005,	%l1

	bne,a	%xcc,	diag_fail
	set	0xeeee0005,	%l1

	set	0x40000000,	%l3
	set	0x2,	%l4
	smulcc	%l3,	%l4,	%l2	/* icc.N set */
	bpos,a	%icc,	diag_fail
	set	0xeeee0005,	%l1
		
	set	0x0,	%l0	
	set	0xffffffff,	%l3
	set	0x7fffffff,	%l4
	smulcc	%l3,	%l4,	%l2	/* XCC.N set */
	bpos,a	%xcc,	diag_fail
	set	0xeeee0005,	%l1

	/* smul signed value */
	set	0x0,	%l0
	set	0x4,	%l3
	set	0x2,	%l4

	sub	%l0,	%l3,	%l5
	smulcc	%l3,	%l5,	%l6	/* icc.N set */
	bpos,a	%icc,	diag_fail
	set	0xeeee0005,	%l1
		
	bpos,a	%xcc,	diag_fail
	set	0xeeee0005,	%l1
	
/*
 ********************************
 *  Multiply Step
 ********************************
 */
!!-----------------------
!!      mulscc
!!-----------------------
        set     0x0,    %l0

        set     0x0,    %l3
        set     0x9,    %l4
        set     0x1b,   %l5

	wr	%l0,	0x0,	%ccr
	nop

        /* y[0] = 1 , l3 = 0 */
        wr      %l0,    0x3,    %y
        nop

        mulscc  %l3,    %l4,    %l6
        nop
        rd      %y,     %l0     /* y should be 1 : right shift 1 bit */
        sub     %l0,    0x1,    %l1
        brnz,a  %l1,    diag_fail
        set     0xdddd0001,     %l1

        sub     %l6,    %l4,    %l7     /* l6 = l4 + right_shft1bit of %l3 */
        brnz,a  %l7,    diag_fail
        set     0xdddd0001,     %l1

        /* y[0] = 1 , l3 = 0 , mulscc regs, imm */
        set     0x0,    %l3
        set     0x0,    %l0

        wr      %l0,    0x3,    %y
        nop

        mulscc  %l3,    0x9,    %l6
        nop

        rd      %y,     %l0     /* y should be 1 : right shift 1 bit */
        sub     %l0,    0x1,    %l1
        brnz,a  %l1,    diag_fail
        set     0xdddd0001,     %l1

        sub     %l6,    %l4,    %l7     /* l6 = l4 + right_shft1bit of %l3 */
        brnz,a  %l7,    diag_fail
        set     0xdddd0001,     %l1

        /* y[0] = 0 , l3 = 0x000055af icc.n & icc.v are both 0 */
        set     0x0,    %l0
        set     0x000055af,     %l3
        wr      %l0,    0x2,    %y
        nop

        mulscc  %l3,    %l4,    %l6
        nop

        rd      %y,     %l0     /* y[0]=0 y[31] = REGrs[0] = 1 */
        set     0x80000001,     %l1
        sub     %l0,    %l1,    %l2

        brnz,a  %l2,    diag_fail
        set     0xdddd0001,     %l1

        set     0x2ad7, %l4     /*      55af >> 1 bit = 2ad7 */
        sub     %l6,    %l4,    %l7     /* l6 = 0 + right_shft1bit of %l3 */
        brnz,a  %l7,    diag_fail
        set     0xdddd0001,     %l1

        /* y[0] = 1 , l3 = 0x000055af (icc.n XOR icc.v) = 1 */
        set     0x9,    %l4
        set     0x0,    %l0
        set     0x000055af,     %l3

        wr      %l0,    0x8,    %ccr    /* icc.N set */
        nop

        wr      %l0,    0x3,    %y
        nop

        mulscc  %l3,    %l4,    %l6     /* l4 = 9 */
        nop

        rd      %y,     %l0     /* y[0]=1 y[31] = REGrs[0] = 1 */
        set     0x80000001,     %l1
        sub     %l0,    %l1,    %l2

        brnz,a  %l2,    diag_fail
        set     0xdddd0001,     %l1

        set     0x80002ae0,     %l7     /*      55af >> 1 bit = 2ad7 + 0x9 = 2ae0 */
                                        /*   REGrd [31] = 1 */
        sub     %l6,    %l7,    %l7     /* l6 = 0 + right_shft1bit of %l3 */
        brnz,a  %l7,    diag_fail
        set     0xdddd0001,     %l1

        /* y[0] = 1 , l3 = 0x000055af (icc.n XOR icc.v) = 1 */
        set     0x0,    %l0
        set     0x000055af,     %l3

        wr      %l0,    0x8,    %ccr    /* icc.N set */
        nop

        wr      %l0,    0x3,    %y
        nop

        mulscc  %l3,    0x9,    %l6     /* imm = 9 */
        nop

        rd      %y,     %l0     /* y[0]=1 y[31] = REGrs[0] = 1 */
        set     0x80000001,     %l1
        sub     %l0,    %l1,    %l2

        brnz,a  %l2,    diag_fail
        set     0xdddd0001,     %l1

        set     0x80002ae0,     %l7     /*      55af >> 1 bit = 2ad7 + 0x9 = 2ae0 */
                                        /*   REGrd [31] = 1 */
        sub     %l6,    %l7,    %l7     /* l6 = 0 + right_shft1bit of %l3 */
        brnz,a  %l7,    diag_fail
        set     0xdddd0001,     %l1

#if 0	
/*
 ********************************
 *      Population count
 ********************************
 */
!!-----------------------------
!!	popc
!!-----------------------------
	set	0xffaaffaa,	%l0
	popc	%l0,	%l2
	set	0x18,	%l3

	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffffaaaa,	%l1
	
	set	0x0,	%l0
	popc	%l0,	%l2
	set	0x0,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffffaaaa,	%l1
	
	popc	0x0,	%l2
	set	0x0,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffffaaaa,	%l1

	popc	0x1fff,	%l2	/* imm13 extended to 0xffffffffffffffff */
	set	0x40,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffffaaaa,	%l1

#endif	
/*
 ********************************
 *      Read State registers
 ********************************
 */
!!---------------------
!!	wr and rd %y
!!---------------------
	set	0xffaaffa5,	%l0
	wr	%l0,	0x0,	%y
	nop

	rd	%y,	%l1	
	nop

	sub	%l1,	%l0,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffdd01,	%l1

!!---------------------
!!	wr and rd %ccr
!!---------------------
	set	0xfa,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	rd	%ccr,	%l1	
	nop

	sub	%l1,	%l0,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffdd02,	%l1

!!---------------------
!!	wr and rd %asi
!!---------------------
	set	0x80,	%l0
	wr	%l0,	0x0,	%asi
	nop

	rd	%asi,	%l1	
	nop

	sub	%l1,	%l0,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffdd02,	%l1

!!---------------------
!!	wr and rd %fprs
!!---------------------
	set	0x7,	%l0
	wr	%l0,	0x0,	%fprs
	nop

	rd	%fprs,	%l1	
	nop

	sub	%l1,	%l0,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffdd02,	%l1

!!-----------------------------------------------------------
!!  Read ASR ( ancillary state register ) TBD
!!-----------------------------------------------------------

/*
 *********************************
 *	SETHI
 *********************************
 */
	sethi	0x3faacc,	%l1
	set	0x3faacc,	%l2
	sll	%l2,	10,	%l4
	sub	%l1,	%l4,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffdd00,	%l1

	sethi	%hi(0xabcd1234), %l1
	or	%l1,	0x234,	%l1
	set	0xabcd1234,	%l2
	sub	%l1,	%l2,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffdd00,	%l1

	set	0x1,	%l0
	sethi	0x0,	%l0	/* like a nop */

/*
 *********************************
 *	SHIFT 
 *********************************
 */
!!----------------------
!!	shift left 32b
!!----------------------
	set	0xffffffff,	%l0
	sll	%l0,	31,	%l1
	set	0x0,	%l0
	setx	0x7fffffff80000000, %l0, %l2
	sub	%l2,	%l1,	%l3
	brnz,a	%l3,	diag_fail
	set	0xfffeee01,	%l1	

	set	0x1,	%l0
	set	4,	%l1
	sll	%l0,	%l1,	%l2
	set	0x10,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xfffeee01,	%l1

!!----------------------
!!	shift left 64b
!!----------------------
	set	0xffffffff,	%l0
	sllx	%l0,	32,	%l1
	set	0x0,	%l0
	setx	0xffffffff00000000, %l0, %l2	
	sub	%l1,	%l2,	%l3
	brnz,a	%l3,	diag_fail
	set	0xfffeee01,	%l1	

	set	0xffffffff,	%l0
	sllx	%l0,	63,	%l1
	set	0x0,	%l0
	setx	0x8000000000000000, %l0, %l2	
	sub	%l1,	%l2,	%l3
	brnz,a	%l3,	diag_fail
	set	0xfffeee01,	%l1	

	set	0x1,	%l0
	set	4,	%l1
	sllx	%l0,	%l1,	%l2
	set	0x10,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xfffeee01,	%l1

!!----------------------
!!	shift right 32b
!!----------------------
	set	0x80000000,	%l0
	srl	%l0,	31,	%l1
	srl	%l1,	1,	%l2
	brnz,a	%l2,	diag_fail
	set	0xfffeee02,	%l1	

	set	0x800,	%l0
	set	4,	%l1
	srl	%l0,	%l1,	%l2
	set	0x80,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xfffeee02,	%l1

!!----------------------
!!	shift right 64b
!!----------------------
	set	0x0,	%l0
	setx	0x8000000000000000, %l0, %l1
	srlx	%l1,	63,	%l2
	srlx	%l2,	1,	%l3
	brnz,a	%l3,	diag_fail
	set	0xfffeee03,	%l1	

	set	0x0,	%l0
	setx	0x8000000000000000, %l0, %l1
	set	16,	%l2
	srlx	%l1,	%l2,	%l3
	srlx	%l3,	%l2,	%l4

	set	0x80000000,	%l5
	sub	%l5,	%l4,	%l6
	brnz,a	%l6,	diag_fail
	set	0xfffeee03,	%l1

!!----------------------
!!	shift right 32b
!!	  arithmetic
!!----------------------
	set	0x80000000,	%l0
	sra	%l0,	31,	%l1
	sra	%l1,	1,	%l2

	set	0x0,	%l3
	setx	0xffffffffffffffff, %l3, %l4	
	sub	%l2,	%l4,	%l5
	brnz,a	%l5,	diag_fail
	set	0xfffeee02,	%l1	

	set	0x800,	%l0
	set	4,	%l1
	sra	%l0,	%l1,	%l2
	set	0x80,	%l3
	sub	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xfffeee02,	%l1

!!----------------------
!!	shift right 64b
!!----------------------
	set	0x0,	%l0
	setx	0x8000000000000000, %l0, %l1
	srax	%l1,	63,	%l2
	srax	%l2,	1,	%l3
	
	set	0x0,	%l0
	setx	0xffffffffffffffff, %l0, %l4	
	sub	%l4,	%l3,	%l5
	brnz,a	%l5,	diag_fail
	set	0xfffeee03,	%l1	

	set	0x0,	%l0
	setx	0x8000000000000000, %l0, %l1
	set	16,	%l2
	srax	%l1,	%l2,	%l3
	srax	%l3,	%l2,	%l4

	set	0x0,	%l0
	setx	0xffffffff80000000, %l0, %l5
	sub	%l5,	%l4,	%l6
	brnz,a	%l6,	diag_fail
	set	0xfffeee03,	%l1

/*
 *****************************************
 *	floating point add/subtract
 *****************************************
 */
!!-------------------
!!	fadds
!!-------------------
	set	0x0,	%l0
	setx	fps_data, %l0,	%l1	
	ld	[%l1+%l0],	%f0	/* load 1st fp single */

	set	0x0,	%l0
	add	%l0,	0x4,	%l0
	ld	[%l1+%l0],	%f1	/* load 2nd fp single */

	add	%l0,	0x4,	%l0
	ld	[%l1+%l0],	%f2	/* load 3rd fp single */

	fadds	%f0,	%f1,	%f3

	fcmps	%fcc0,	%f3,	%f2	/* f2 should = f3 */
	
	fbe	Test_fsubs
	nop

	ba	diag_fail
	set	0xffff0001,	%l1

!!-------------------
!!	fsubs
!!-------------------
Test_fsubs:
	/* f2 - f1 = f0 */		
	fsubs	%f2,	%f1,	%f3

	fcmps	%fcc0,	%f0,	%f3

	fbne	diag_fail
	set	0xffff0002,	%l1

!!-------------------
!!	faddd
!!-------------------
	set	0x0,	%l0
	setx	fpd_data,	%l0,	%l1

	ldd	[%l1+%l0],	%f0	
	add	%l0,	0x8,	%l0

	ldd	[%l1+%l0],	%f2	
	add	%l0,	0x8,	%l0
	
	ldd	[%l1+%l0],	%f4	
	add	%l0,	0x8,	%l0

	faddd	%f0,	%f2,	%f6	

	fcmpd	%fcc0,	%f6,	%f4

	fbne	diag_fail
	set	0xffff0003,	%l1

!!-------------------
!!	fsubd
!!-------------------
Test_fsubd:
	/* f4 - f2 = f0 */		
	fsubd	%f4,	%f2,	%f6

	fcmpd	%fcc0,	%f6,	%f0

	fbne	diag_fail
	set	0xffff0004,	%l1

/*
 ***************************
 * Load FSR from Memory 
 ***************************
 */
!!------------------------
!! LDFSR 
!!------------------------
	set	0x0,	%l0
	setx	ldfsr_sdata,	%l0,	%l2

	ld	[%l2+%l0],	%fsr	/* %fcc0 = 10 fs1 > fs2 */
	add	%l0,	0x4,	%l0

	fble	%fcc0,	diag_fail
	set	0xffff0005,	%l1

	ld	[%l2+%l0],	%fsr	/* %fcc0 = 01 fs1 < fs2 */
	add	%l0,	0x4,	%l0

	fbge	%fcc0,	diag_fail
	set	0xffff0005,	%l1

	ld	[%l2+%l0],	%fsr	/* %fcc0 = 00 fs1 = fs2 */
	add	%l0,	0x4,	%l0

	fbne	%fcc0,	diag_fail
	set	0xffff0005,	%l1

!!------------------------
!! LDXFSR 
!!------------------------
	set	0x0,	%l0
	setx	ldfsr_ddata,	%l0,	%l2

	ldx	[%l2+%l0],	%fsr	/* %fcc0 = 10 fs1 > fs2 */
	add	%l0,	0x8,	%l0

	fble	%fcc0,	diag_fail
	set	0xffff0006,	%l1

	ldx	[%l2+%l0],	%fsr	/* %fcc0 = 01 fs1 < fs2 */
	add	%l0,	0x8,	%l0

	fbge	%fcc0,	diag_fail
	set	0xffff0006,	%l1

	ldx	[%l2+%l0],	%fsr	/* %fcc0 = 00 fs1 = fs2 */
	add	%l0,	0x8,	%l0

	fbne	%fcc0,	diag_fail
	set	0xffff0006,	%l1

#if 0
/*
 *	NOT supported by SIMICS 
 */

!!-------------------
!!	faddq
!!-------------------
	set	0x0,	%l0
	setx	fpquad_data,	%l0,	%l1

	ldq	[%l1+%l0],	%f0
	add	%l0,	0x10,	%l0

	ldq	[%l1+%l0],	%f4
	add	%l0,	0x10,	%l0

	ldq	[%l1+%l0],	%f8
	add	%l0,	0x10,	%l0

	faddq	%f0,	%f4,	%f12

	fcmpq	%fcc0,	%f12,	%f8

	fbne	diag_fail
	set	0xffff0005,	%l1

!!-------------------
!!	fsubq
!!-------------------
Test_fsubq:
	/* f8 - f4 = f0 */		
	fsubd	%f8,	%f4,	%f12

	fcmpd	%fcc0,	%f12,	%f0

	fbne	diag_fail
	set	0xffff0006,	%l1
#endif

/*
 *********************************
 *  Store Floating Point
 *********************************
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

	/* 
	 * store single
	 */
!!--------------------------
!!  st freg, [addr]	
!!--------------------------
	set	0x0,	%l0
	setx	stfsr_sdata,	%l0,	%l2		

	st	%f0,	[%l2+%l0]
	add	%l0,	0x4,	%l0

	st	%f2,	[%l2+%l0]
	add	%l0,	0x4,	%l0

	set	0x0,	%l0	
	ld	[%l2+%l0],	%f14	/* f14 should = f0 */
	add	%l0,	0x4,	%l0
	fcmps	%fcc0,	%f14,	%f0
	fbne,a	diag_fail
	set	0xffeeff01,	%l1

	ld	[%l2+%l0],	%f16	/* f16 should = f2 */
	nop
	fcmps	%fcc0,	%f16,	%f2
	fbne,a	diag_fail
	set	0xffeeff01,	%l1

	/* 
	 * store double
	 */
!!--------------------------
!!  std freg, [addr]	
!!--------------------------
	set	0x0,	%l0
	setx	stfsr_ddata,	%l0,	%l2		

	std	%f8,	[%l2+%l0]
	add	%l0,	0x8,	%l0

	std	%f10,	[%l2+%l0]
	add	%l0,	0x8,	%l0

	set	0x0,	%l0	
	ldd	[%l2+%l0],	%f14	/* f14 should = f8 */
	add	%l0,	0x8,	%l0

	fcmpd	%fcc0,	%f14,	%f8
	fbne,a	diag_fail
	set	0xffeeff81,	%l1

	ldd	[%l2+%l0],	%f16	/* f16 should = f10 */
	nop
	fcmpd	%fcc0,	%f16,	%f10
	fbne,a	diag_fail
	set	0xffeeff81,	%l1

	/* 
	 * store fsr : single
	 */
!!--------------------------
!!  st %fsr, [addr]	
!!--------------------------
        set     0x0,    %l0
        setx    ldfsr_sdata,    %l0,    %l2
        ld      [%l2+%l0],      %fsr    /* %fcc0 = 10 fs1 > fs2 */
        add     %l0,    0x4,    %l0

	set	0x0,	%l0
	setx	stfsr_sdata,	%l0,	%l2
	st	%fsr,	[%l2+%l0]
	nop

	ld	[%l2+%l0],	%fsr
	nop
        fble    %fcc0,  diag_fail
        set     0xffff5000,     %l1

	/* 
	 * store fsr : double
	 */
!!--------------------------
!!  stx %fsr, [addr]	
!!--------------------------
        set     0x0,    %l0
        setx    ldfsr_ddata,    %l0,    %l2
        ldx     [%l2+%l0],      %fsr    /* %fcc0 = 10 fs1 > fs2 */

	set	0x0,	%l0
	setx	stfsr_ddata,	%l0,	%l2
	stx	%fsr,	[%l2+%l0]
	nop

	ldx	[%l2+%l0],	%fsr
	nop
        fble    %fcc0,  diag_fail
        set     0xffff6000,     %l1

	/* 
	 * store single to alternate space
	 */
!!--------------------------
!!  sta freg, [addr] imm
!!--------------------------
	set	0x0,	%l0
	setx	stfsr_sdata,	%l0,	%l2		

	sta	%f0,	[%l2+%l0] 0x80
	add	%l0,	0x4,	%l0

	sta	%f2,	[%l2+%l0] 0x80

	set	0x0,	%l0	
	lda	[%l2+%l0] 0x80,	%f14	/* f14 should = f0 */
	add	%l0,	0x4,	%l0

	fcmps	%fcc0,	%f14,	%f0
	fbne,a	diag_fail
	set	0xffeeff01,	%l1

	lda	[%l2+%l0] 0x80,	%f16	/* f16 should = f2 */
	nop
	fcmps	%fcc0,	%f16,	%f2
	fbne,a	diag_fail
	set	0xffeeff01,	%l1

!!--------------------------
!!  sta freg, [addr] %asi
!!--------------------------
	set	0x0,	%l0
	setx	stfsr_sdata,	%l0,	%l2		

	wr	%l0,	0x80,	%asi
	nop

	sta	%f0,	[%l2+0x0] %asi
	sta	%f2,	[%l2+0x4] %asi

	set	0x0,	%l0	
	lda	[%l2+0x0] %asi,	%f14	/* f14 should = f0 */
	add	%l0,	0x4,	%l0
	fcmps	%fcc0,	%f14,	%f0
	fbne,a	diag_fail
	set	0xffeeff01,	%l1

	lda	[%l2+0x4] %asi,	%f16	/* f16 should = f2 */
	nop
	fcmps	%fcc0,	%f16,	%f2
	fbne,a	diag_fail
	set	0xffeeff01,	%l1

	/* 
	 * store double
	 */
!!--------------------------
!!  stda freg, [addr] imm	
!!--------------------------
	set	0x0,	%l0
	setx	stfsr_ddata,	%l0,	%l2		

	stda	%f8,	[%l2+%l0] 0x80
	add	%l0,	0x8,	%l0

	stda	%f10,	[%l2+%l0] 0x80
	add	%l0,	0x8,	%l0

	set	0x0,	%l0	
	ldda	[%l2+%l0] 0x80,	%f14	/* f14 should = f8 */
	add	%l0,	0x8,	%l0

	fcmpd	%fcc0,	%f14,	%f8
	fbne,a	diag_fail
	set	0xffeeff81,	%l1

	ldda	[%l2+%l0] 0x80,	%f16	/* f16 should = f10 */
	nop
	fcmpd	%fcc0,	%f16,	%f10
	fbne,a	diag_fail
	set	0xffeeff81,	%l1

!!--------------------------
!!  stda freg, [addr] %asi
!!--------------------------
	set	0x0,	%l0
	setx	stfsr_ddata,	%l0,	%l2		

	wr	%l0,	0x80,	%asi
	nop

	stda	%f8,	[%l2+0x0] %asi
	stda	%f10,	[%l2+0x8] %asi

	set	0x0,	%l0	
	ldda	[%l2+0x0] %asi,	%f14	/* f14 should = f8 */
	fcmpd	%fcc0,	%f14,	%f8
	fbne,a	diag_fail
	set	0xffeeff81,	%l1

	ldda	[%l2+0x8] %asi,	%f16	/* f16 should = f10 */
	nop
	fcmpd	%fcc0,	%f16,	%f10
	fbne,a	diag_fail
	set	0xffeeff81,	%l1

!!--------------------------
!!  stqa freg, [reg+imm] %asi
!!  stqa freg, [reg] imm
!!	are not supported !!
!!--------------------------

/*
 *************************************************
 *	Load Floating point from Alternate Space
 *************************************************
 */
!!----------------------------
!!	LDFA
!!----------------------------
        /* load fp value into fp reg */
        set     0x0,    %l0
        setx    fps_cvt_nmd1,   %l0,    %l1
        set     0x0,    %l0

        lda     [%l1+%l0]0x80,  %f0     /* 1st s fp = 0x3 */
        add     %l0,    0x4,    %l0

        lda     [%l1+%l0]0x80,  %f2     /* 2nd s fp = 0x6 */
        add     %l0,    0x4,    %l0

        lda     [%l1+%l0]0x80,  %f4     /* 3rd s fp = 0x9 */
        add     %l0,    0x4,    %l0

	fadds	%f0,	%f2,	%f6

	fcmps	%fcc0,	%f6,	%f4

	fbne	%fcc0,	diag_fail
	set	0xffff0001,	%l1

!!----------------------------
!!	LDFA, %asi
!!----------------------------
        /* load fp value into fp reg */
        set     0x0,    %l0
        setx    fps_cvt_nmd1,   %l0,    %l1
        set     0x0,    %l0

	wr	%l0,	0x80,	%asi
	nop
	
        lda     [%l1+0x0] %asi,  %f0     /* 1st s fp = 0x3 */
	nop

        lda     [%l1+0x4] %asi,  %f2     /* 2nd s fp = 0x6 */
	nop

        lda     [%l1+0x8] %asi,  %f4     /* 3rd s fp = 0x9 */

	fadds	%f0,	%f2,	%f6

	fcmps	%fcc0,	%f6,	%f4

	fbne	%fcc0,	diag_fail
	set	0xffff0002,	%l1

!!----------------------------
!!	LDDFA
!!----------------------------
        /* load fp value into fp reg */
        set     0x0,    %l0
        setx    fpd_cvt_nmd1,   %l0,    %l1
        set     0x0,    %l0

        ldda    [%l1+%l0]0x80,  %f0     /* 1st s fp = 0x3 */
        add     %l0,    0x8,    %l0

        ldda    [%l1+%l0]0x80,  %f2     /* 2nd s fp = 0x6 */
        add     %l0,    0x8,    %l0

        ldda    [%l1+%l0]0x80,  %f4     /* 3rd s fp = 0x9 */
        add     %l0,    0x8,    %l0

	faddd	%f0,	%f2,	%f6

	fcmpd	%fcc0,	%f6,	%f4

	fbne	%fcc0,	diag_fail
	set	0xffff0003,	%l1

!!----------------------------
!!	LDFA, %asi
!!----------------------------
        /* load fp value into fp reg */
        set     0x0,    %l0
        setx    fpd_cvt_nmd1,   %l0,    %l1
        set     0x0,    %l0

	wr	%l0,	0x80,	%asi
	nop
	
        ldda     [%l1+0x0] %asi,  %f0     /* 1st s fp = 0x3 */
	nop

        ldda     [%l1+0x8] %asi,  %f2     /* 2nd s fp = 0x6 */
	nop

        ldda     [%l1+0x10] %asi,  %f4    /* 3rd s fp = 0x9 */

	faddd	%f0,	%f2,	%f6

	fcmpd	%fcc0,	%f6,	%f4

	fbne	%fcc0,	diag_fail
	set	0xffff0004,	%l1

!!-----------------------------------------
!!  ldqa,	ldqa,%asi not supported !
!!-----------------------------------------

/* 
 ***************************************
 *	Load Integer 
 ***************************************
 */
!!--------------------------------
!!	Load signed byte 
!!--------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	set	0x0,	%l0
	ldsb	[%l2+%l0],	%l3	/* l3 = 0x55 */
	add	%l0,	0x1,	%l0

	ldsb	[%l2+%l0],	%l4	/* l4 = 0xffffffffffffffaa */
	add	%l0,	0x1,	%l0

	ldsb	[%l2+%l0],	%l5	/* l5 = 0x11 */	
	add	%l0,	0x1,	%l0

	ldsb	[%l2+%l0],	%l6	/* l6 = 0xffffffffffffffbb */	
	nop

	sub	%l3,	0x55,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1
	
	sub	%l5,	0x11,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1

	set	0x0,	%l1
	setx	0xffffffffffffffaa, %l1, %l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1
	
	set	0x0,	%l1
	setx	0xffffffffffffffbb, %l1, %l0
	sub	%l6,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1
	
!!--------------------------------------
!!	Load signed 16-bit half word
!!		ldsh
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	set	0x4,	%l0
	ldsh	[%l2+%l0],	%l3	/* l3 = 0xffffffffffffaa55 */
	add	%l0,	0x2,	%l0

	ldsh	[%l2+%l0],	%l4	/* l4 = 0x77ff */

	set	0x0,	%l1
	setx	0xffffffffffffaa55, %l1, %l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0006,	%l1
	
	set	0x77ff, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0006,	%l1
	
!!--------------------------------------
!!	Load signed 32-bit word
!!		ldsw
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2

	set	0x8,	%l0
	ldsw	[%l2+%l0],	%l3	/* l3 = 0x77aa55bb */
	add	%l0,	0x4,	%l0

	ldsw	[%l2+%l0],	%l4	/* l4 = 0xffffffffaa55ff44 */
	add	%l0,	0x4,	%l0

	set	0x0,	%l1
	setx	0xffffffffaa55ff44, %l1, %l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0007,	%l1
	
	set	0x77aa55bb, 	%l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0007,	%l1

!!--------------------------------
!!	Load unsigned byte 
!!--------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	set	0x0,	%l0
	ldub	[%l2+%l0],	%l3	/* l3 = 0x55 */
	add	%l0,	0x1,	%l0

	ldub	[%l2+%l0],	%l4	/* l4 = 0xaa */
	add	%l0,	0x1,	%l0

	ldub	[%l2+%l0],	%l5	/* l5 = 0x11 */	
	add	%l0,	0x1,	%l0

	ldub	[%l2+%l0],	%l6	/* l6 = 0xbb */	
	nop

	sub	%l3,	0x55,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1
	
	sub	%l5,	0x11,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1

	set	0xaa, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1
	
	set	0xbb,	%l0	
	sub	%l6,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1
	
!!--------------------------------------
!!	Load unsigned 16-bit half word
!!		lduh
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	set	0x4,	%l0
	lduh	[%l2+%l0],	%l3	/* l3 = 0xaa55 */
	add	%l0,	0x2,	%l0

	lduh	[%l2+%l0],	%l4	/* l4 = 0x77ff */
	add	%l0,	0x2,	%l0

	set	0xaa55, 	%l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0009,	%l1
	
	set	0x77ff, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0009,	%l1
	
!!--------------------------------------
!!	Load unsigned 32-bit word
!!		lduw
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2

	set	0x8,	%l0
	lduw	[%l2+%l0],	%l3	/* l3 = 0x77aa55bb */
	add	%l0,	0x4,	%l0

	lduw	[%l2+%l0],	%l4	/* l4 = 0xaa55ff44 */
	add	%l0,	0x4,	%l0

	set	0xaa55ff44, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff000a,	%l1
	
	set	0x77aa55bb, 	%l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff000a,	%l1

!!----------------------------------
!!	load extended word
!!----------------------------------
	/* 	0x55aa11bbaa5577ff */
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2

	ldx	[%l2+%l0],	%l3	
	set	0x0,	%l0
	setx	0x55aa11bbaa5577ff, %l0, %l1

	sub	%l3,	%l1,	%l4

	brnz	%l4,	diag_fail
	set	0xffff000b,	%l1

!!----------------------------------------
!!	load double word not supported 
!!----------------------------------------

/* 
 ***************************************
 *	Load Integer from 
 *	Alternate Space
 ***************************************
 */
!!------------------------------------
!!	Load signed byte from AS imm
!!------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	set	0x0,	%l0
	ldsba	[%l2+%l0] 0x80,	%l3	/* l3 = 0x55 */
	add	%l0,	0x1,	%l0

	ldsba	[%l2+%l0] 0x80,	%l4	/* l4 = 0xffffffffffffffaa */
	add	%l0,	0x1,	%l0

	ldsba	[%l2+%l0] 0x80,	%l5	/* l5 = 0x11 */	
	add	%l0,	0x1,	%l0

	ldsba	[%l2+%l0] 0x80,	%l6	/* l6 = 0xffffffffffffffbb */	
	nop

	sub	%l3,	0x55,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1
	
	sub	%l5,	0x11,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1

	set	0x0,	%l1
	setx	0xffffffffffffffaa, %l1, %l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1
	
	set	0x0,	%l1
	setx	0xffffffffffffffbb, %l1, %l0
	sub	%l6,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1
	
!!--------------------------------------
!!	Load signed 16-bit half word
!!		ldsh from AS imm
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	set	0x4,	%l0
	ldsha	[%l2+%l0] 0x80,	%l3	/* l3 = 0xffffffffffffaa55 */
	add	%l0,	0x2,	%l0

	ldsha	[%l2+%l0] 0x80,	%l4	/* l4 = 0x77ff */

	set	0x0,	%l1
	setx	0xffffffffffffaa55, %l1, %l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0006,	%l1
	
	set	0x77ff, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0006,	%l1
	
!!--------------------------------------
!!	Load signed 32-bit word
!!		ldsw from AS imm
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2

	set	0x8,	%l0
	ldswa	[%l2+%l0] 0x80,	%l3	/* l3 = 0x77aa55bb */
	add	%l0,	0x4,	%l0

	ldswa	[%l2+%l0] 0x80,	%l4	/* l4 = 0xffffffffaa55ff44 */
	add	%l0,	0x4,	%l0

	set	0x0,	%l1
	setx	0xffffffffaa55ff44, %l1, %l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0007,	%l1
	
	set	0x77aa55bb, 	%l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0007,	%l1

!!--------------------------------------
!!	Load unsigned byte from AS imm
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	set	0x0,	%l0
	lduba	[%l2+%l0] 0x80,	%l3	/* l3 = 0x55 */
	add	%l0,	0x1,	%l0

	lduba	[%l2+%l0] 0x80,	%l4	/* l4 = 0xaa */
	add	%l0,	0x1,	%l0

	lduba	[%l2+%l0] 0x80,	%l5	/* l5 = 0x11 */	
	add	%l0,	0x1,	%l0

	lduba	[%l2+%l0] 0x80,	%l6	/* l6 = 0xbb */	
	nop

	sub	%l3,	0x55,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1
	
	sub	%l5,	0x11,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1

	set	0xaa, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1
	
	set	0xbb,	%l0	
	sub	%l6,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1
	
!!--------------------------------------
!!	Load unsigned 16-bit half word
!!		lduh from AS imm
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	set	0x4,	%l0
	lduha	[%l2+%l0] 0x80,	%l3	/* l3 = 0xaa55 */
	add	%l0,	0x2,	%l0

	lduha	[%l2+%l0] 0x80,	%l4	/* l4 = 0x77ff */
	add	%l0,	0x2,	%l0

	set	0xaa55, 	%l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0009,	%l1
	
	set	0x77ff, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0009,	%l1
	
!!--------------------------------------
!!	Load unsigned 32-bit word
!!		lduw	from AS imm
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2

	set	0x8,	%l0
	lduwa	[%l2+%l0] 0x80,	%l3	/* l3 = 0x77aa55bb */
	add	%l0,	0x4,	%l0

	lduwa	[%l2+%l0] 0x80,	%l4	/* l4 = 0xaa55ff44 */
	add	%l0,	0x4,	%l0

	set	0xaa55ff44, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff000a,	%l1
	
	set	0x77aa55bb, 	%l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff000a,	%l1

!!--------------------------------------
!!	load extended word from AS imm
!!--------------------------------------
	/* 	0x55aa11bbaa5577ff */
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2

	ldxa	[%l2+%l0] 0x80,	%l3	
	set	0x0,	%l0
	setx	0x55aa11bbaa5577ff, %l0, %l1

	sub	%l3,	%l1,	%l4

	brnz	%l4,	diag_fail
	set	0xffff000b,	%l1

!!----------------------------------------
!!	load double word not supported 
!!----------------------------------------

/*
 ******************************************
 *  Load integer from Alternate Space
 *	 using %asi
 ******************************************
 */

!!------------------------------------
!!	Load signed byte from AS %asi
!!------------------------------------
	set	0x0,	%l0
        wr      %l0,    0x80,   %asi
        nop
	
	setx	ldint_1, %l0,	%l2

	set	0x0,	%l0
	ldsba	[%l2+0x0] %asi,	%l3	/* l3 = 0x55 */

	ldsba	[%l2+0x1] %asi,	%l4	/* l4 = 0xffffffffffffffaa */

	ldsba	[%l2+0x2] %asi,	%l5	/* l5 = 0x11 */	

	ldsba	[%l2+0x3] %asi,	%l6	/* l6 = 0xffffffffffffffbb */	

	sub	%l3,	0x55,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1
	
	sub	%l5,	0x11,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1

	set	0x0,	%l1
	setx	0xffffffffffffffaa, %l1, %l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1
	
	set	0x0,	%l1
	setx	0xffffffffffffffbb, %l1, %l0
	sub	%l6,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0005,	%l1
	
!!--------------------------------------
!!	Load signed 16-bit half word
!!		ldsh from AS %asi,
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	ldsha	[%l2+0x4] %asi,	%l3	/* l3 = 0xffffffffffffaa55 */

	ldsha	[%l2+0x6] %asi,	%l4	/* l4 = 0x77ff */

	set	0x0,	%l1
	setx	0xffffffffffffaa55, %l1, %l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0006,	%l1
	
	set	0x77ff, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0006,	%l1
	
!!--------------------------------------
!!	Load signed 32-bit word
!!		ldsw from AS %asi,
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2

	ldswa	[%l2+0x8] %asi,	%l3	/* l3 = 0x77aa55bb */

	ldswa	[%l2+0xc] %asi,	%l4	/* l4 = 0xffffffffaa55ff44 */

	set	0x0,	%l1
	setx	0xffffffffaa55ff44, %l1, %l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0007,	%l1
	
	set	0x77aa55bb, 	%l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0007,	%l1

!!--------------------------------------
!!	Load unsigned byte from AS %asi,
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	lduba	[%l2+0x0] %asi,	%l3	/* l3 = 0x55 */

	lduba	[%l2+0x1] %asi,	%l4	/* l4 = 0xaa */

	lduba	[%l2+0x2] %asi,	%l5	/* l5 = 0x11 */	

	lduba	[%l2+0x3] %asi,	%l6	/* l6 = 0xbb */	

	sub	%l3,	0x55,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1
	
	sub	%l5,	0x11,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1

	set	0xaa, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1
	
	set	0xbb,	%l0	
	sub	%l6,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0008,	%l1
	
!!--------------------------------------
!!	Load unsigned 16-bit half word
!!		lduh from AS %asi,
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2
	
	lduha	[%l2+0x4] %asi,	%l3	/* l3 = 0xaa55 */

	lduha	[%l2+0x6] %asi,	%l4	/* l4 = 0x77ff */
	add	%l0,	0x2,	%l0

	set	0xaa55, 	%l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0009,	%l1
	
	set	0x77ff, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff0009,	%l1
	
!!--------------------------------------
!!	Load unsigned 32-bit word
!!		lduw	from AS %asi,
!!--------------------------------------
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2

	lduwa	[%l2+0x8] %asi,	%l3	/* l3 = 0x77aa55bb */
	lduwa	[%l2+0xc] %asi,	%l4	/* l4 = 0xaa55ff44 */

	set	0xaa55ff44, 	%l0
	sub	%l4,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff000a,	%l1
	
	set	0x77aa55bb, 	%l0
	sub	%l3,	%l0,	%l0
	brnz	%l0,	diag_fail
	set	0xffff000a,	%l1

!!--------------------------------------
!!	load extended word from AS %asi,
!!--------------------------------------
	/* 	0x55aa11bbaa5577ff */
	set	0x0,	%l0
	setx	ldint_1, %l0,	%l2

	ldxa	[%l2+0x0] %asi,	%l3	
	set	0x0,	%l0
	setx	0x55aa11bbaa5577ff, %l0, %l1

	sub	%l3,	%l1,	%l4

	brnz	%l4,	diag_fail
	set	0xffff000b,	%l1

!!----------------------------------------
!!	load double word  : ldda
!!	from Alternate Space not supported 
!!----------------------------------------

/*
 *************************************************
 *      load store unsigned byte
 *************************************************
 */
!!---------------------
!!  ldstub
!!---------------------
        set     0x0,    %l0
        setx    ldint_1, %l0,   %l1

        ldstub  [%l1+%l0],      %l2     /* l2 should = 0x55 */
        nop

        set     0x55,   %l3
        sub     %l3,    %l2,    %l5
        brnz    %l5,    diag_fail
        set     0xffff0001,     %l3

        ldub    [%l1+%l0],      %l4     /* l4 should = 0xff */
        set     0xff,   %l3
        sub     %l3,    %l4,    %l5

        brnz    %l5,    diag_fail
        set     0xffff0001,     %l1

!!---------------------
!!  ldstuba , imm
!!---------------------
        set     0x0,    %l0
        setx    ldint_1, %l0,   %l1

        set     0x2,    %l0
        ldstuba [%l1+%l0] 0x80, %l2     /* l2 should = 0x11 */
        nop

        set     0x11,   %l3
        sub     %l3,    %l2,    %l5
        brnz    %l5,    diag_fail
        set     0xffff0001,     %l3

        ldub    [%l1+%l0],      %l4     /* l4 should = 0xff */
        set     0xff,   %l3
        sub     %l3,    %l4,    %l5

        brnz    %l5,    diag_fail
        set     0xffff0001,     %l1

!!---------------------
!!  ldstuba , %asi
!!---------------------
        set     0x0,    %l0
        wr      %l0,    0x80,   %asi
        nop

        setx    ldint_1, %l0,   %l1

        ldstuba [%l1+0x3] %asi, %l2     /* l2 should = 0xbb */
        nop

        set     0xbb,   %l3
        sub     %l3,    %l2,    %l5
        brnz    %l5,    diag_fail
        set     0xffff0001,     %l3

        set     0x3,    %l0
        ldub    [%l1+%l0],      %l4     /* l4 should = 0xff */
        set     0xff,   %l3

        sub     %l3,    %l4,    %l5

        brnz    %l5,    diag_fail
        set     0xffff0001,     %l1

/*
 ********************************
 *  Store integer
 ********************************
 */
!!----------------------------
!!	store a byte
!!----------------------------
	set	0x7f,	%l2
	set	0xff,	%l3

	set	0x0,	%l0
	setx	stint_1, %l0,	%l1	
	stb	%l2,	[%l1+%l0]
	add	%l0,	4,	%l0
	stb	%l3,	[%l1+%l0]

	/* ld and compare */
	set	0x0,	%l0
	ldsw	[%l1+%l0],	%l5
	add	%l0,	4,	%l0
	set	0x7f000000,	%l7
	sub	%l7,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldsw	[%l1+%l0],	%l6
	set	0x0,	%l0
	setx	0xffffffffff000000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	set	0x4,	%l0
	lduw	[%l1+%l0], 	%l6
	set	0x0,	%l0
	setx	0xff000000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

!!----------------------------
!!	store a half-word
!!----------------------------
	set	0x7fff,	%l2
	set	0xffff,	%l3

	set	0x0,	%l0
	setx	stint_1, %l0,	%l1
	sth	%l2,	[%l1+%l0]
	add	%l0,	4,	%l0
	sth	%l3,	[%l1+%l0]

	/* ld and compare */
	set	0x0,	%l0
	ldsw	[%l1+%l0],	%l5
	add	%l0,	4,	%l0
	set	0x7fff0000,	%l7
	sub	%l7,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldsw	[%l1+%l0],	%l6
	set	0x0,	%l0
	setx	0xffffffffffff0000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	set	0x4,	%l0
	lduw	[%l1+%l0], 	%l6
	set	0x0,	%l0
	setx	0xffff0000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

!!----------------------------
!!	store a word
!!----------------------------
	set	0x7fffffff,	%l2
	set	0xf0ffffff,	%l3

	set	0x0,	%l0
	setx	stint_1, %l0,	%l1
	stw	%l2,	[%l1+%l0]
	add	%l0,	4,	%l0
	stw	%l3,	[%l1+%l0]

	/* ld and compare */
	set	0x0,	%l0
	ldsw	[%l1+%l0],	%l5
	add	%l0,	4,	%l0
	set	0x7fffffff,	%l7
	sub	%l7,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldsw	[%l1+%l0],	%l6
	set	0x0,	%l0
	setx	0xfffffffff0ffffff, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	set	0x4,	%l0
	lduw	[%l1+%l0], 	%l6
	set	0x0,	%l0
	setx	0xf0ffffff, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

!!----------------------------
!!	store an extended word
!!----------------------------
	set	0x0,	%l0
	setx	0x7fffffff55aaaa55, %l0, %l2
	setx	0xf0ffffff55aaaa55, %l0, %l3

	set	0x0, 	%l0
	setx	stint_1, %l0,	%l1
	stx	%l2,	[%l1+%l0]
	add	%l0,	8,	%l0
	stx	%l3,	[%l1+%l0]

	/* ld and compare */
	set	0x0,	%l0

	ldx	[%l1+%l0],	%l5
	add	%l0,	8,	%l0
	sub	%l2,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldx	[%l1+%l0],	%l6
	nop
	sub	%l6,	%l3,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2
/*
 ****************************************
 *  Store integer into Alternate
 *	space
 ****************************************
 */
!!----------------------------
!!  store a byte into ASI imm
!!----------------------------
	set	0x7f,	%l2
	set	0xff,	%l3

	set	0x0,	%l0
	setx	stint_asi1, %l0, %l1	
	stba	%l2,	[%l1+%l0] 0x80
	add	%l0,	4,	%l0
	stba	%l3,	[%l1+%l0] 0x80

	/* ld and compare */
	set	0x0,	%l0
	ldsw	[%l1+%l0],	%l5
	add	%l0,	4,	%l0
	set	0x7f000000,	%l7
	sub	%l7,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldsw	[%l1+%l0],	%l6
	set	0x0,	%l0
	setx	0xffffffffff000000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	set	0x4,	%l0
	lduw	[%l1+%l0], 	%l6
	set	0x0,	%l0
	setx	0xff000000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

!!----------------------------
!!  store a byte into ASI %asi
!!----------------------------
	set	0x7f,	%l2
	set	0xff,	%l3

	set	0x0,	%l0
	wr	%l0,	0x80,	%asi

	setx	stint_asi2, %l0, %l1	
	stba	%l2,	[%l1+0x0] %asi
	stba	%l3,	[%l1+0x4] %asi

	/* ld and compare */
	set	0x0,	%l0
	ldsw	[%l1+%l0],	%l5
	add	%l0,	4,	%l0
	set	0x7f000000,	%l7
	sub	%l7,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldsw	[%l1+%l0],	%l6
	set	0x0,	%l0
	setx	0xffffffffff000000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	set	0x4,	%l0
	lduw	[%l1+%l0], 	%l6
	set	0x0,	%l0
	setx	0xff000000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

!!--------------------------------------------
!! store a half-word into ASI (imm)
!!--------------------------------------------
	set	0x7fff,	%l2
	set	0xffff,	%l3

	set	0x0,	%l0
	setx	stint_asi1, %l0,	%l1
	stha	%l2,	[%l1+%l0] 0x80
	add	%l0,	4,	%l0
	stha	%l3,	[%l1+%l0] 0x80

	/* ld and compare */
	set	0x0,	%l0
	ldsw	[%l1+%l0],	%l5
	add	%l0,	4,	%l0
	set	0x7fff0000,	%l7
	sub	%l7,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldsw	[%l1+%l0],	%l6
	set	0x0,	%l0
	setx	0xffffffffffff0000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	set	0x4,	%l0
	lduw	[%l1+%l0], 	%l6
	set	0x0,	%l0
	setx	0xffff0000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

!!--------------------------------------------
!! store a half-word into ASI (%asi)
!!--------------------------------------------
	set	0x7fff,	%l2
	set	0xffff,	%l3

	set	0x0,	%l0
	wr	%l0,	0x80,	%asi
	setx	stint_asi2, %l0,	%l1

	stha	%l2,	[%l1+0x0] %asi
	stha	%l3,	[%l1+0x4] %asi

	/* ld and compare */
	set	0x0,	%l0
	ldsw	[%l1+%l0],	%l5
	add	%l0,	4,	%l0
	set	0x7fff0000,	%l7
	sub	%l7,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldsw	[%l1+%l0],	%l6
	set	0x0,	%l0
	setx	0xffffffffffff0000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	set	0x4,	%l0
	lduw	[%l1+%l0], 	%l6
	set	0x0,	%l0
	setx	0xffff0000, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

!!----------------------------
!! store a word to ASI (imm)
!!----------------------------
	set	0x7fffffff,	%l2
	set	0xf0ffffff,	%l3

	set	0x0,	%l0
	setx	stint_asi1, %l0,	%l1
	stwa	%l2,	[%l1+%l0] 0x80
	add	%l0,	4,	%l0
	stwa	%l3,	[%l1+%l0] 0x80

	/* ld and compare */
	set	0x0,	%l0
	ldsw	[%l1+%l0],	%l5
	add	%l0,	4,	%l0
	set	0x7fffffff,	%l7
	sub	%l7,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldsw	[%l1+%l0],	%l6
	set	0x0,	%l0
	setx	0xfffffffff0ffffff, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	set	0x4,	%l0
	lduw	[%l1+%l0], 	%l6
	set	0x0,	%l0
	setx	0xf0ffffff, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

!!----------------------------
!! store a word to ASI (%asi)
!!----------------------------
	set	0x7fffffff,	%l2
	set	0xf0ffffff,	%l3

	set	0x0,	%l0
	wr	%l0,	0x80,	%asi
	
	setx	stint_asi2, %l0,	%l1
	stwa	%l2,	[%l1+0x0] %asi
	stwa	%l3,	[%l1+0x4] %asi

	/* ld and compare */
	set	0x0,	%l0
	ldsw	[%l1+%l0],	%l5
	add	%l0,	4,	%l0
	set	0x7fffffff,	%l7
	sub	%l7,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldsw	[%l1+%l0],	%l6
	set	0x0,	%l0
	setx	0xfffffffff0ffffff, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	set	0x4,	%l0
	lduw	[%l1+%l0], 	%l6
	set	0x0,	%l0
	setx	0xf0ffffff, %l0, %l7
	sub	%l7,	%l6,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

!!----------------------------
!! store an extended word to 
!!	ASI ( imm )
!!----------------------------
	set	0x0,	%l0
	setx	0x7fffffff55aaaa55, %l0, %l2
	setx	0xf0ffffff55aaaa55, %l0, %l3

	set	0x0, 	%l0
	setx	stint_asi1, %l0,	%l1
	stxa	%l2,	[%l1+%l0] 0x80
	add	%l0,	8,	%l0
	stxa	%l3,	[%l1+%l0] 0x80

	/* ld and compare */
	set	0x0,	%l0

	ldx	[%l1+%l0],	%l5
	add	%l0,	8,	%l0
	sub	%l2,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldx	[%l1+%l0],	%l6
	nop
	sub	%l6,	%l3,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

!!----------------------------
!! store an extended word to 
!!	ASI ( %asi )
!!----------------------------
	set	0x0,	%l0
	setx	0x7fffffff55aaaa55, %l0, %l2
	setx	0xf0ffffff55aaaa55, %l0, %l3

	set	0x0, 	%l0
	wr	%l0,	0x80,	%asi
	setx	stint_asi2, %l0,	%l1
	stxa	%l2,	[%l1+0x0] %asi
	stxa	%l3,	[%l1+0x8] %asi

	/* ld and compare */
	set	0x0,	%l0

	ldx	[%l1+%l0],	%l5
	add	%l0,	8,	%l0
	sub	%l2,	%l5,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

	ldx	[%l1+%l0],	%l6
	nop
	sub	%l6,	%l3,	%l4
	brnz,a 	%l4,	diag_fail
	set	0xfffeee01,	%l2

/*
 ********************************
 *  Subtract     
 ********************************
 */
!!--------------------------
!!	subc
!!--------------------------
	set	0x1,	%l1
	set	0x2,	%l2
	set	0x3,	%l3
	set	0x0,	%l0

	wr	%l0,	0x1,	%ccr	/* icc.c set */
	nop

	subc	%l3,	%l2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffeeeee1,	%l1

	wr	%l0,	0x0,	%ccr	/* icc.c set to zero */
	nop

	set	0x1,	%l1
	subc	%l3,	%l2,	%l4
	sub	%l4,	%l1,	%l5
	brnz,a	%l5,	diag_fail
	set	0xffeeeee1,	%l1

	wr	%l0,	0x10,	%ccr	/* xcc.c set */
	nop

	set	0x1,	%l1
	subc	%l3,	%l2,	%l4	/* l4 should = 1 */ 
	sub	%l4,	%l1,	%l5	
	brnz,a	%l5,	diag_fail
	set	0xffeeeee1,	%l1

!!--------------------------
!!	subc
!!--------------------------
	set	0x1,	%l1
	set	0x2,	%l2
	set	0x3,	%l3
	set	0x0,	%l0

	wr	%l0,	0x1,	%ccr	/* icc.c set */
	nop

	subc	%l3,	0x2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffeeeee1,	%l1

	wr	%l0,	0x0,	%ccr	/* icc.c set to zero */
	nop

	set	0x1,	%l1
	subc	%l3,	0x2,	%l4
	sub	%l4,	%l1,	%l5
	brnz,a	%l5,	diag_fail
	set	0xffeeeee1,	%l1

	wr	%l0,	0x10,	%ccr	/* xcc.c set */
	nop

	set	0x1,	%l1
	subc	%l3,	0x2,	%l4	/* l4 should = 1 */ 
	sub	%l4,	%l1,	%l5	
	brnz,a	%l5,	diag_fail
	set	0xffeeeee1,	%l1

	wr	%l0,	0x0,	%ccr	/* xcc.c set */
	nop

	/* sub of the 13bit imm */
	set	0x0,	%l0
	subc	%l0,	0x1fff,	%l1	/* 0 - (-1) = 1 */	
	sub	%l1,	0x1,	%l2
	brnz,a	%l2,	diag_fail
	set	0xfffeee01,	%l1

!!----------------------------------
!!	subcc
!!----------------------------------
	set	0x2,	%l2
	set	0x3,	%l3

	/* set Z */
	subcc	%l2,	%l2,	%l4	/* x&icc.Z set */ 
	bne,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bne,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* Z not set */
	subcc	%l3,	%l2,	%l4	/* x&icc.Z not set */ 
	be,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	be,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* set N */
	subcc	%l2,	%l3,	%l4
	bpos,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bpos,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* N not set */
	subcc	%l3,	%l2,	%l4
	bneg,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bneg,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* V not set */
        subcc   %l3,    %l2,    %l4
        bvs,a   %icc,   diag_fail
        set     0xffeeff01,    %l1     /* not executed */

        bvs,a   %xcc,   diag_fail
        set     0xffeeff01,    %l1     /* not executed */

	/* icc.V flag set */
        set     0x80000000,     %l2
        set     0x7fffffff,     %l3

        subcc   %l2,    %l3,    %l4     /* icc.V flag is set */
        bvc,a   %icc,   diag_fail      /*  not taken */
        set     0xffeeff02,    %l1     /* not executed */

	/* xcc.V flag set */
        set     0x0,    %l0
        setx    0x8000000000000000,     %l0,   %l2
        setx    0x7fffffffffffffff,     %l0,   %l3

        subcc   %l2,    %l3,    %l4     /* xcc.V flag is set */
        bvc,a   %xcc,   diag_fail      /*  not taken */
        set     0xffeeff02,    %l1     /* not executed */

!!----------------------------------
!!	subcc ( rs1 - imm = rsd )
!!----------------------------------
	set	0x2,	%l2
	set	0x3,	%l3

	/* set Z */
	subcc	%l2,	0x2,	%l4	/* x&icc.Z set */ 
	bne,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bne,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* Z not set */
	subcc	%l3,	0x2,	%l4	/* x&icc.Z not set */ 
	be,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	be,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* set N */
	subcc	%l2,	0x3,	%l4
	bpos,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bpos,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* N not set */
	subcc	%l3,	0x2,	%l4
	bneg,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bneg,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* V not set */
        subcc   %l3,    0x2,    %l4
        bvs,a   %icc,   diag_fail
        set     0xffeeff01,    %l1     /* not executed */

        bvs,a   %xcc,   diag_fail
        set     0xffeeff01,    %l1     /* not executed */

        /* sub of the 13bit imm */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
        set     0x0,    %l0
        subcc    %l0,    0x1fff, %l1     /* 0 - (-1) = 1 */
        sub     %l1,    0x1,    %l2
        brnz,a  %l2,    diag_fail
        set     0xfffeee01,     %l1

!!----------------------------------
!!	subccc
!!----------------------------------
	set	0x0,	%l0
	set	0x2,	%l2
	set	0x3,	%l3

	wr	%l0,	0x1,	%ccr	/* icc.C set */
	nop

	subccc	%l2,	%l2,	%l4	/* l4 = -1 */
	bpos,a	%icc,	diag_fail
	set	0xffeeeee4,	%l1
	
	/* set Z */
	wr	%l0,	0x0,	%ccr	/* clear %ccr */
	nop

	subccc	%l2,	%l2,	%l4	/* x&icc.Z set */ 
	bne,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bne,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* Z not set */
	subccc	%l3,	%l2,	%l4	/* x&icc.Z not set */ 
	be,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	be,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* set N */
	subccc	%l2,	%l3,	%l4
	bpos,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bpos,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* N not set */
	subccc	%l3,	%l2,	%l4
	bneg,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bneg,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* V not set */
        subccc   %l3,    %l2,    %l4
        bvs,a   %icc,   diag_fail
        set     0xffeeff01,    %l1     /* not executed */

        bvs,a   %xcc,   diag_fail
        set     0xffeeff01,    %l1     /* not executed */

	/* icc.V flag set */
        set     0x80000000,     %l2
        set     0x7fffffff,     %l3

        subccc   %l2,    %l3,    %l4     /* icc.V flag is set */
        set     0x0,    %l0
        bvc,a   %icc,   diag_fail      /*  not taken */
        set     0xffeeff02,    %l1     /* not executed */

	/* xcc.V flag set */
        set     0x0,    %l0
        setx    0x8000000000000000,     %l0,   %l2
        setx    0x7fffffffffffffff,     %l0,   %l3

        subccc   %l2,    %l3,    %l4     /* xcc.V flag is set */
        set     0x0,    %l0
        bvc,a   %xcc,   diag_fail      /*  not taken */
        set     0xffeeff02,    %l1     /* not executed */

!!----------------------------------
!!	subccc ( regs1-imm = rsd )
!!----------------------------------
	set	0x0,	%l0
	set	0x2,	%l2
	set	0x3,	%l3

	wr	%l0,	0x1,	%ccr	/* icc.C set */
	nop

	subccc	%l2,	0x2,	%l4	/* l4 = -1 */
	bpos,a	%icc,	diag_fail
	set	0xffeeeee4,	%l1
	
	/* set Z */
	wr	%l0,	0x0,	%ccr	/* clear %ccr */
	nop

	subccc	%l2,	0x2,	%l4	/* x&icc.Z set */ 
	bne,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bne,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* Z not set */
	subccc	%l3,	0x2,	%l4	/* x&icc.Z not set */ 
	be,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	be,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* set N */
	subccc	%l2,	0x3,	%l4
	bpos,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bpos,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* N not set */
	subccc	%l3,	0x2,	%l4
	bneg,a	%icc,	diag_fail
	set	0xffeeeee2,	%l1
	
	bneg,a	%xcc,	diag_fail
	set	0xffeeeee3,	%l1

	/* V not set */
        subccc   %l3,    0x2,    %l4
        bvs,a   %icc,   diag_fail
        set     0xffeeff01,    %l1     /* not executed */

        bvs,a   %xcc,   diag_fail
        set     0xffeeff01,    %l1     /* not executed */

        /* sub of the 13bit imm */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
        set     0x0,    %l0
        subcc    %l0,    0x1fff, %l1     /* 0 - (-1) = 1 */
        sub     %l1,    0x1,    %l2
        brnz,a  %l2,    diag_fail
        set     0xfffeee01,     %l1

/*
 ********************************
 *  Swap Register with Memory 
 ********************************
 */
	set	0x0,	%l0
	setx	stint_1,	%l0,	%l2			

	set	0x5555ffff,	%l3
	stw	%l3,	[%l2+%l0]

	set	0x7abbccdd,	%l4	
	set	0x7abbccdd,	%l5	

	swap	[%l2+%l0],	%l4	/* l4 swap with mem(l3) */
	nop	

	lduw	[%l2+%l0],	%l6	
	nop

	sub	%l4,	%l3,	%l7
	brnz,a	%l7,	diag_fail
	set	0xffffee07,	%l1

	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xffffee07,	%l1

/*
 ********************************
 *  Swap Register with ASI Memory 
 ********************************
 */
!!-------------------------------------------
!!	swapa [regaddr] imm_asi, REGrd
!!-------------------------------------------
	set	0x0,	%l0
	setx	stint_asi1,	%l0,	%l2			

	set	0xff55aaff,	%l3
	stw	%l3,	[%l2+%l0]

	set	0x7fffaa55,	%l4	
	set	0x7fffaa55,	%l5	

	set	0x0,	%l0
	swapa	[%l2+%l0] 0x80,	%l4	/* l4 swap with mem(l3) */
	nop	

	lduw	[%l2+%l0],	%l6	
	nop

	sub	%l4,	%l3,	%l7
	brnz,a	%l7,	diag_fail
	set	0xffffee07,	%l1

	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xffffee07,	%l1

!!-------------------------------------------
!!	swapa [reg+imm] %asi, REGrd
!!-------------------------------------------
	set	0x0,	%l0
	setx	stint_asi2,	%l0,	%l2			

	set	0xff55aaff,	%l3
	stw	%l3,	[%l2+%l0]

	set	0x7fffaa55,	%l4	

	set	0x0,	%l0
	wr	%l0,	0x80,	%asi
	set	0x7fffaa55,	%l5	

	swapa	[%l2+0x0] %asi,	%l4	/* l4 swap with mem(l3) */
	nop	

	lduw	[%l2+%l0],	%l6	
	nop

	sub	%l4,	%l3,	%l7
	brnz,a	%l7,	diag_fail
	set	0xffffee07,	%l1

	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xffffee07,	%l1

!!-------------------------------------------
!!	swapa [reg+imm] %asi, REGrd
!!-------------------------------------------
	set	0x0,	%l0
	setx	stint_asi2,	%l0,	%l2			

	set	0xff55aaff,	%l3
	stw	%l3,	[%l2+%l0]

	set	0x7fffaa55,	%l4	

	set	0x0,	%l0
	wr	%l0,	0x80,	%asi
	set	0x7fffaa55,	%l5	

	swapa	[%l2+0x0] %asi,	%l4	/* l4 swap with mem(l3) */
	nop	

	lduw	[%l2+%l0],	%l6	
	nop

	sub	%l4,	%l3,	%l7
	brnz,a	%l7,	diag_fail
	set	0xffffee07,	%l1

	sub	%l6,	%l5,	%l7
	brnz,a	%l7,	diag_fail
	set	0xffffee07,	%l1

/*
 ********************************
 *  tagged add 
 ********************************
 */
!!-----------------
!!  taddcc
!!-----------------
	set	0x8,	%l0
	set	0x4,	%l1

	taddcc	%l1,	%l0,	%l2
	nop

	sub	%l2,	0xc,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffeee0,	%l1

	/* add imm */
	set	0x4,	%l1
	taddcc	%l1,	0x8,	%l3
	sub	%l3,	0xc,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffeee0,	%l1

	set	0x4,	%l0
	taddcc	%l0,	0x1ffc,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffeee1,	%l1

	/* icc.V set since %l0[0] = 1 */
	set	0x1,	%l0
	set	0x4,	%l1

	taddcc	%l1,	%l0,	%l2
	nop

	rd	%ccr,	%l3
	nop
	sub	%l3,	0x2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffffeeea,	%l1

	/* clr %ccr */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	/* icc.V set since %l0[1] = 1 */
	set	0x2,	%l0
	set	0x4,	%l1

	taddcc	%l1,	%l0,	%l2
	nop

	rd	%ccr,	%l3
	nop
	sub	%l3,	0x2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffffeeea,	%l1
			
	/* clr %ccr */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	/* icc.V set since result overflow */
	set	0x40000000,	%l0
	set	0x40000000,	%l1

	taddcc	%l1,	%l0,	%l2
	nop

	rd	%ccr,	%l3	/* icc.N icc.V are set */
	nop

	sub	%l3,	0xa,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffffeeea,	%l1

!!-----------------
!!  taddcctv
!!-----------------
	set	0x8,	%l0
	set	0x4,	%l1

	taddcctv %l1,	%l0,	%l2
	nop

	sub	%l2,	0xc,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffeee0,	%l1

	/* add imm */
	set	0x4,	%l1
	taddcctv	%l1,	0x8,	%l3
	sub	%l3,	0xc,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffeee0,	%l1

	set	0x4,	%l0
	taddcctv	%l0,	0x1ffc,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffeee1,	%l1

/*
 ********************************
 *  tagged subtract 
 ********************************
 */
!!-----------------
!!  tsubcc
!!-----------------
	set	0x4,	%l0
	set	0x8,	%l1

	tsubcc	%l1,	%l0,	%l2
	nop

	sub	%l2,	0x4,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffeee0,	%l1

	/* sub imm */
	set	0x4,	%l1
	tsubcc	%l1,	0x2,	%l3
	sub	%l3,	0x2,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffeee0,	%l1

	set	0x0,	%l0
	sub	%l0,	4,	%l0
	tsubcc	%l0,	0x1ffc,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffeee1,	%l1

	/* icc.V set since %l0[0] = 1 */
	set	0x1,	%l0
	set	0x4,	%l1

	tsubcc	%l1,	%l0,	%l2
	nop

	rd	%ccr,	%l3
	nop
	sub	%l3,	0x2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffffeeea,	%l1

	/* clr %ccr */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	/* icc.V set since %l0[1] = 1 */
	set	0x2,	%l0
	set	0x4,	%l1

	tsubcc	%l1,	%l0,	%l2
	nop

	rd	%ccr,	%l3
	nop
	sub	%l3,	0x2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffffeeea,	%l1
			
	/* clr %ccr */
	set	0x0,	%l0
	wr	%l0,	0x0,	%ccr
	nop

	/* icc.V set since result overflow */
	set	0xfffffffe,	%l0
	set	0xfffffffc,	%l1

	tsubcc	%l0,	%l1,	%l2
	nop

	rd	%ccr,	%l3	/* icc.N icc.V are set */
	nop

	sub	%l3,	0x2,	%l4
	brnz,a	%l4,	diag_fail
	set	0xffffeeea,	%l1

!!-----------------
!!  tsubcctv 
!!-----------------
	set	0x4,	%l0
	set	0x8,	%l1

	tsubcctv	%l1,	%l0,	%l2
	nop

	sub	%l2,	0x4,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffeee0,	%l1

	/* sub imm */
	set	0x8,	%l1
	tsubcctv %l1,	0x4,	%l3
	sub	%l3,	0x4,	%l3
	brnz,a	%l3,	diag_fail
	set	0xffffeee0,	%l1

	set	0x0,	%l0
	sub	%l0,	4,	%l0
	tsubcctv	%l0,	0x1ffc,	%l2
	brnz,a	%l2,	diag_fail
	set	0xffffeee1,	%l1
/*
 ***********************************
 *      Call & Jmpl
 ***********************************
 */
#if 0
        set     0x1,    %o0
        set     0x2,    %o1
        call    sum3
        set     0x3,    %o2

        sub     %o0,    0x6,    %l0
        brnz    %l0,    diag_fail
        set     0xffff0001,     %l1

	nop
#endif

!!----------------------------------
!!      Compare and Swap word
!!----------------------------------
        set     0x0,    %l0
        setx    ldint_1, %l0,   %l2

        lduw    [%l2+%l0],      %l3     /* l3 = 55aa11bb */
        nop

        set     0x55aa11cc,     %l4
        set     0x55ffff00,     %l5
        casa    [%l2] 0x80,     %l4,    %l5     /* %l5 = [%l2+%l0] = %l3 */
        nop     /* do we need a nop here ? */
        sub     %l5,    %l3,    %l6
        brnz,a  %l6,    diag_fail

        set     0xffffaaa0,     %l1
        set     0x0,    %l0
        setx    0x00cc55ffff00, %l0, %l5
        add     %l5,    0x0,    %l6     /* keep old %l5 */
        add     %l3,    0,      %l4     /* %l4 = [%l2+%l0] */
        casa    [%l2] 0x80,     %l4, %l5        /* new %l5 = [%l2+%l0] */
                                                /* [%l2+%l0] = old %l5 */
        nop
        sub     %l5,    %l3,    %l7
        brnz,a  %l7,    diag_fail
        set     0xffffaaa1,     %l1

        set     0x0,    %l0
        setx    ldint_1, %l0,   %l2
        ldsw    [%l2+%l0],      %l1
        nop
        set     0x55ffff00,     %l6
        sub     %l6,    %l1,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffffaaa2,     %l1

!!---------------------------------------------
!!      Compare and Swap word in %asi
!!---------------------------------------------
        set     0x0,    %l0
        setx    ldint_1, %l0,   %l2

        lduw    [%l2+%l0],      %l3     /* l3 = 55aa11bb */
        nop

        set     0x55aa11cc,     %l4
        set     0x55ffff00,     %l5

        set     0x0,    %l0
        wr      %l0,    0x80,   %asi
        nop

        casa    [%l2] %asi,     %l4,    %l5     /* %l5 = [%l2+%l0] = %l3 */
        nop     /* do we need a nop here ? */
        sub     %l5,    %l3,    %l6
        brnz,a  %l6,    diag_fail

        set     0xffffaaa0,     %l1
        set     0x0,    %l0
        setx    0x00cc55ffff00, %l0, %l5
        add     %l5,    0x0,    %l6     /* keep old %l5 */
        add     %l3,    0,      %l4     /* %l4 = [%l2+%l0] */
        casa    [%l2] %asi,     %l4, %l5        /* new %l5 = [%l2+%l0] */
                                                /* [%l2+%l0] = old %l5 */
        nop
        sub     %l5,    %l3,    %l7
        brnz,a  %l7,    diag_fail
        set     0xffffaaa1,     %l1

        set     0x0,    %l0
        setx    ldint_1, %l0,   %l2
        ldsw    [%l2+%l0],      %l1
        nop
        set     0x55ffff00,     %l6
        sub     %l6,    %l1,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffffaaa2,     %l1

!!------------------------------------------------
!!      Compare and Swap extended word ( imm )
!!------------------------------------------------
        set     0x0,    %l0
        setx    0x33aa44bb55cc66dd, %l0, %l3
        setx    ldint_1, %l0,   %l2

        stx     %l3,    [%l2+%l0]
        nop

        set     0x0,    %l0
        setx    0x4322110055aa11cc, %l0, %l4
        setx    0x4322110055ffff00, %l0, %l5
        casxa   [%l2] 0x80,     %l4,    %l5     /* %l5 = [%l2+%l0] = %l3 */
        nop     /* do we need a nop here ? */
        sub     %l5,    %l3,    %l6
        brnz,a  %l6,    diag_fail
        set     0xffffaaa0,     %l1

        set     0x0,    %l0
        setx    0x442200cc55ffff00,     %l0, %l5
        add     %l5,    0x0,    %l6     /* keep old %l5 */
        add     %l3,    0,      %l4     /* %l4 = [%l2+%l0] */
        casxa   [%l2] 0x80,     %l4, %l5        /* new %l5 = [%l2+%l0] */
                                                /* [%l2+%l0] = old %l5 */
        nop
        sub     %l5,    %l3,    %l7
        brnz,a  %l7,    diag_fail
        set     0xffffaaa1,     %l1

        set     0x0,    %l0
        setx    ldint_1, %l0,   %l2
        ldx     [%l2+%l0],      %l1
        nop
        sub     %l6,    %l1,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffffaaa2,     %l1

!!------------------------------------------------
!!      Compare and Swap extended word ( %asi )
!!------------------------------------------------
        set     0x0,    %l0
        setx    0x33aa44bb55cc66dd, %l0, %l3
        setx    ldint_1, %l0,   %l2

        stx     %l3,    [%l2+%l0]
        nop

        set     0x0,    %l0
        wr      %l0,    0x80,   %asi
        setx    0x4322110055aa11cc, %l0, %l4
        setx    0x4322110055ffff00, %l0, %l5
        casxa   [%l2] %asi,     %l4,    %l5     /* %l5 = [%l2+%l0] = %l3 */
        nop     /* do we need a nop here ? */
        sub     %l5,    %l3,    %l6
        brnz,a  %l6,    diag_fail
        set     0xffffaaa0,     %l1

        set     0x0,    %l0
        setx    0x442200cc55ffff00,     %l0, %l5
        add     %l5,    0x0,    %l6     /* keep old %l5 */
        add     %l3,    0,      %l4     /* %l4 = [%l2+%l0] */
        casxa   [%l2] %asi,     %l4, %l5        /* new %l5 = [%l2+%l0] */
                                                /* [%l2+%l0] = old %l5 */
        nop
        sub     %l5,    %l3,    %l7
        brnz,a  %l7,    diag_fail
        set     0xffffaaa1,     %l1

        set     0x0,    %l0
        setx    ldint_1, %l0,   %l2
        ldx     [%l2+%l0],      %l1
        nop
        sub     %l6,    %l1,    %l4
        brnz,a  %l4,    diag_fail
        set     0xffffaaa2,     %l1

        /*
         * Restore the values in ldint_1
         *   cause, later on, some codes are
         *   hard-coded to the original values.
         */
        set     0x0,    %l0
        setx    ldint_1,        %l0,    %l2
        set     0x55aa11bb,   	%l3
	set	0xaa5577ff,     %l4

        stw     %l3,    [%l2+%l0]
	add	%l0,	0x4,	%l0

        stw     %l4,    [%l2+%l0]
	nop

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
