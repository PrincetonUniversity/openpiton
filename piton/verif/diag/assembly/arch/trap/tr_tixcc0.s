// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tr_tixcc0.s
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
/***********************************************************************
 * Name:   tr_tixcc0.s
 * Date:   02/5/02
 *
 *
 *  Description:
 *  	
 *     Trap on integer condition codes.
 *     Based on CCR and CC forwarding.
 *
 **********************************************************************/
/*******************************************************
 * My handler externsions
 *******************************************************/
#define	H_T0_Trap_Instruction_0		/*tt=x120, trap x20 */
#define	H_T0_Trap_Instruction_1		/*tt=x121, trap x21 */

#define My_T0_Trap_Instruction_0 done; nop; nop; nop; nop; nop; nop; nop;
#define My_T0_Trap_Instruction_1 done; nop; nop; nop; nop; nop; nop; nop;

/*******************************************************/

#include "boot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

.text
.global main  

main:

	set		0x20, %l6
	set		0x01, %l7
	set		0x0, %l5

	! Depending on CCR

	set		0x2, %g1		! Max loop count
	set		0x0, %g2
ccr_loop:

	brz,a		%g2, tgt1
	wr		%g0, 0x0, %ccr
	wr		%g0, 0xff, %ccr
	
tgt1:

	! icc

	ta		%icc, %g0+0x2
	tn		%icc, %g0+0x21
	tne		%icc, %g0+0x2
	te		%icc, %g0+0x21
	tg		%icc, %g0+0x2
	tle		%icc, %g0+0x21
	tge		%icc, %g0+0x2
	tl		%icc, %g0+0x21
	tgu		%icc, %g0+0x2
	tleu		%icc, %g0+0x21
	tcc		%icc, %g0+0x2
	tcs		%icc, %g0+0x21
	tpos		%icc, %g0+0x2
	tneg		%icc, %g0+0x21
	tvc		%icc, %g0+0x2
	tvs		%icc, %g0+0x21

	! xcc

	ta		%xcc, %l6+%l7
	tn		%xcc, %l6+%l7
	tne		%xcc, %l6+%l7
	te		%xcc, %l6+%l7
	tg		%xcc, %l6+%l7
	tle		%xcc, %l6+%l7
	tge		%xcc, %l6+%l7
	tl		%xcc, %l6+%l7
	tgu		%xcc, %l6+%l7
	tleu		%xcc, %l6+%l7
	tcc		%xcc, %l6+%l7
	tcs		%xcc, %l6+%l7
	tpos		%xcc, %l6+%l7
	tneg		%xcc, %l6+%l7
	tvc		%xcc, %l6+%l7
	tvs		%xcc, %l6+%l7



	add		%g2, 0x1, %g2
	subcc		%g2, %g1, %g0

	bne,a		ccr_loop		! If not 0, go to test more
        nop

	! cc forwarding

	setx		int_data_i, %l0, %l4	! 
	setx		int_data_x, %l0, %l3	! 

	set		0x8, %g1		! Max loop count
	set		0x0, %g2		! inner loop iterator	

tixcc_loop:

	sll		%g2, 0x2, %g3		! Align address
	sll		%g2, 0x3, %g4		! Align address

	ld		[%l4+%g3], %l1		! single precision

	! icc

	subcc		%l1, %g0, %l1

	ta		%icc, %l6+%l7
	tn		%icc, %l6+%l7
	tne		%icc, %l6+%l7
	te		%icc, %l6+%l7
	tg		%icc, %l6+%l7
	tle		%icc, %l6+%l7
	tge		%icc, %l6+%l7
	tl		%icc, %l6+%l7
	tgu		%icc, %l6+%l7
	tleu		%icc, %l6+%l7
	tcc		%icc, %l6+%l7
	tcs		%icc, %l6+%l7
	tpos		%icc, %l6+%l7
	tneg		%icc, %l6+%l7
	tvc		%icc, %l6+%l7
	tvs		%icc, %l6+%l7

	! xcc

	ldx		[%l3+%g4], %l1		! single precision

	subcc		%l1, %g0, %l1

	ta		%icc, %g0+0x2
	tn		%icc, %g0+0x21
	tne		%icc, %g0+0x2
	te		%icc, %g0+0x21
	tg		%icc, %g0+0x2
	tle		%icc, %g0+0x21
	tge		%icc, %g0+0x2
	tl		%icc, %g0+0x21
	tgu		%icc, %g0+0x2
	tleu		%icc, %g0+0x21
	tcc		%icc, %g0+0x2
	tcs		%icc, %g0+0x21
	tpos		%icc, %g0+0x2
	tneg		%icc, %g0+0x21
	tvc		%icc, %g0+0x2
	tvs		%icc, %g0+0x21

	add		%g2, 0x1, %g2
	subcc		%g2, %g1, %g0

	bne,a		tixcc_loop		! If not 0, go to test more
        nop

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
	ta		T_GOOD_TRAP

test_fail:
	ta		T_BAD_TRAP

/*******************************************************
 * Data section 
 *******************************************************/
	
.data

int_data_x:
	.xword		0x0000000000000000	! 0
	.xword		0x0000000000000001	! 1
	.xword		0x7fffffffffffffff	!
	.xword		0xffffffffffffffff	!
	.xword		0xaaaaaaaaaaaaaaaa	! 0
	.xword		0x5555555555555555	! 1
	.xword		0x4000000000000000	!
	.xword		0x8000000000000000	!

int_data_i:
	.word		0x00000000		! 0
	.word		0x00000001		! 1
	.word		0x7fffffff		!
	.word		0xffffffff		!
	.word		0xaaaaaaaa		!
	.word		0x55555555		!
	.word		0x40000000		!
	.word		0x80000000		!

.align 256
