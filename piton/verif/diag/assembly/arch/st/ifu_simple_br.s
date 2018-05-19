// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: ifu_simple_br.s
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
/*
 *  Description:
 *      Simple branch instructions
 *
 *
 */

#include "boot.s"
.text
.global main

main:

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
        brgez,a,pn        %l0,	next_ba
	set	0xaaaaeeee,	%l1

        /* otherwise, fail */
        ba      diag_fail
        set     0xffff001a,     %l1
        nop

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
next_ba:
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

	wr	%g0,	%g0,	%y
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


diag_pass:
	set     0xc001dea1, %l3
	ta T_GOOD_TRAP
	nop
	nop


diag_fail:
        set     0xdeadcafe,     %l0
        ta T_BAD_TRAP
        nop
        nop

