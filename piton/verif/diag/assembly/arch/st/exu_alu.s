// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: exu_alu.s
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
 *   Some simple alu ops 
 *
 *
 */

#ifdef MT_TEMPLATE
#include "mt_body.h"
#else
#include "boot.s"
.global main
#endif

.text

main:
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

!!----------------------
!!      shift right arithmetic 64b
!!----------------------
        set     0x0,    %l0
        setx    0x8000000000000000, %l0, %l1
        srax    %l1,    63,     %l2
        srax    %l2,    1,      %l3

        set     0x0,    %l0
        setx    0xffffffffffffffff, %l0, %l4
        sub     %l4,    %l3,    %l5
        brnz,a  %l5,    diag_fail
        set     0xfffeee03,     %l1

        set     0x0,    %l0
        setx    0x8000000000000000, %l0, %l1
        set     16,     %l2
        srax    %l1,    %l2,    %l3
        srax    %l3,    %l2,    %l4

        set     0x0,    %l0
        setx    0xffffffff80000000, %l0, %l5
        sub     %l5,    %l4,    %l6
        brnz,a  %l6,    diag_fail
        set     0xfffeee03,     %l1


!!----------------------
!!      shift right 32b
!!        arithmetic
!!----------------------
        set     0x80000000,     %l0
        sra     %l0,    31,     %l1
        sra     %l1,    1,      %l2

        set     0x0,    %l3
        setx    0xffffffffffffffff, %l3, %l4
        sub     %l2,    %l4,    %l5
        brnz,a  %l5,    diag_fail
        set     0xfffeee02,     %l1

        set     0x800,  %l0
        set     4,      %l1
        sra     %l0,    %l1,    %l2
        set     0x80,   %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail
        set     0xfffeee02,     %l1

!!----------------------
!!      shift right 64b
!!----------------------
        set     0x0,    %l0
        setx    0x8000000000000000, %l0, %l1
        srlx    %l1,    63,     %l2
        srlx    %l2,    1,      %l3
        brnz,a  %l3,    diag_fail
        set     0xfffeee03,     %l1

        set     0x0,    %l0
        setx    0x8000000000000000, %l0, %l1
        set     16,     %l2
        srlx    %l1,    %l2,    %l3
        srlx    %l3,    %l2,    %l4

!!----------------------
!!      shift right 32b
!!----------------------
        set     0x80000000,     %l5
        sub     %l5,    %l4,    %l6
        brnz,a  %l6,    diag_fail
	set	0x80000000, 	%l0
        srl     %l0,    31,     %l1
        srl     %l1,    1,      %l2
        brnz,a  %l2,    diag_fail
	set 	0xfffeee02,     %l1
	set     0x800,  %l0
        mov     4,      %l1
        srl     %l0,    %l1,    %l2
        mov     0x80,   %l3
        sub     %l3,    %l2,    %l4
        brnz,a  %l4,    diag_fail

        set     0xfffeee03,     %l1
	mov     0x80,   %l3

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




