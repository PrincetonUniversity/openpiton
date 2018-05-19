// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_prod_cons_variation2_1.s
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
 * Name:   tso_prod_cons_variation2_1.s
 *
 *  Description: A variation of the producer consumer algorithm.
 *  thread 0 does st C st A thread 1 does st C, st B;
 *  thread 2 does ld A; ld B ld C;
 *  thread 3 does ld A ld B ld C ; Thread 2  and 3 must see same C 
 *  There is a fifth thread which checks what thread 2 and 3 saw.
 **********************************************************************/

#define addrA_reg  		%l0
#define addrB_reg		%l1
#define addrC_reg		%l2
#define result0_reg	  	%l3
#define result1_reg	  	%l4
#define ready0_reg	  	%l5
#define ready1_reg	  	%l6
#define finish_reg	  	%l7

#define global_cnt_reg	  	%i0

#define tmp0	  		%o2
#define tmp1	  		%o3
#define test_reg		%o4
#define test2_reg		%o5

#define tmp1			%i1
#define tmp2			%i2
#define tmp3			%i3

#define ITERATIONS 	  	0x2

#include "boot.s"

.global main

main:

	setx    addrA,		tmp0, addrA_reg
	setx    addrB, 		tmp0, addrB_reg
	setx    addrC, 		tmp0, addrC_reg
	setx    result0, 	tmp0, result0_reg
	setx    result1, 	tmp0, result1_reg
	setx    ready0, 	tmp0, ready0_reg
	setx    ready1, 	tmp0, ready1_reg
	setx    finish_area,	tmp0, finish_reg

        set     ITERATIONS,	global_cnt_reg 			! 

th_fork(th_main,tmp1)

!=====================================================
th_main_0:
loop00:
	mov	0x2,	tmp3
	st	tmp3, [addrC_reg]		!
	mov	0x1,	tmp3
	st	tmp3, [addrA_reg]		! store non-zero to A

loop01:						! wait for A to be zero again.
        ld    	[finish_reg], test_reg		! OR for the end
	sub	test_reg, 0x55, tmp2
	brz	tmp2, good_end
	nop

        ld    	[addrA_reg], test_reg
	brnz	test_reg, loop01
	nop

	nop; nop; nop; nop;

	ba	loop00				! loop
	nop

!=========================================================
th_main_1:

loop10:
	mov	0x3,	tmp3
	st	tmp3, [addrC_reg]		! 
	mov	0x1,	tmp3
	st	tmp3, [addrB_reg]		! store non-zero to B

loop11:						! wait for B to be zero again
        ld    	[finish_reg], test_reg		! or for the end.
	sub	test_reg, 0x55, tmp2
	brz	tmp2, good_end
	nop

        ld    	[addrB_reg], test_reg
	brnz	test_reg, loop11
	nop

	ba	loop10				! loop
	nop

!=========================================================
th_main_2:

	ba	good_end			! noise
	nop

!=========================================================
th_main_3:

loop30:

loop31:
        ld    	[finish_reg], test_reg		! check for an end
	sub	test_reg, 0x55, tmp2
	brz	tmp2, good_end
	nop

        ld    	[addrA_reg], test_reg		! load A until set
	brz	test_reg, loop31
	nop

loop32:
        ld    	[finish_reg], test_reg		! check for an end
	sub	test_reg, 0x55, tmp2
	brz	tmp2, good_end
	nop

        ld    	[addrB_reg], test_reg		! load B  until set
	brz	test_reg, loop32
	nop

        ld    	[addrC_reg], test_reg		! read C and store it.
	st	test_reg,    [result0_reg]	! to result place.

	mov	0x1, test_reg
	st	test_reg,    [ready0_reg]	! flag ready

loop33:
        ld    	[finish_reg], test_reg		! check for an end
	sub	test_reg, 0x55, tmp2
	brz	tmp2, good_end
	nop

        ld    	[ready0_reg], test_reg		! wait for ready to be cleared
	brnz	test_reg, loop33
	nop

	ba	loop30				! loop
	nop

!=========================================================
th_main_4:

loop40:

loop41:
        ld    	[finish_reg], test_reg		! check for an end
	sub	test_reg, 0x55, tmp2
	brz	tmp2, good_end
	nop

        ld    	[addrA_reg], test_reg		! load A until set
	brz	test_reg, loop41
	nop

loop42:
        ld    	[finish_reg], test_reg		! check for an end
	sub	test_reg, 0x55, tmp2
	brz	tmp2, good_end
	nop

        ld    	[addrB_reg], test_reg		! load B until set
	brz	test_reg, loop42
	nop

        ld    	[addrC_reg], test_reg		! load B and store it
	st	test_reg,    [result1_reg]	! to result place

	mov	0x1, test_reg
	st	test_reg,    [ready1_reg]	! flag ready

loop43:
        ld    	[finish_reg], test_reg		! check for an end
	sub	test_reg, 0x55, tmp2
	brz	tmp2, good_end
	nop

        ld    	[ready1_reg], test_reg		! wait for ready to be cleared
	brnz	test_reg, loop43
	nop

	ba	loop40				! loop
	nop

!=========================================================
th_main_5:

loop50:
        ld    	[ready0_reg], test_reg		! wait for ready0
	brz	test_reg, loop50
	nop

loop51:
        ld    	[ready1_reg], test_reg		! wait for ready1
	brz	test_reg, loop51
	nop

	ld	[result0_reg], test_reg		! load the 2 results,
	ld	[result1_reg], test2_reg
	subcc	test_reg, test2_reg, %g0	! if non-equal-> BAD
	bne	bad_end	
	nop

loop5_cont:
	st	%g0,   	[result0_reg]		! clear results
	st	%g0,   	[result1_reg]
	st	%g0,   	[addrA_reg]		! clear A and B
	st	%g0,   	[addrB_reg]
	st	%g0,   	[addrC_reg]
	st	%g0,    [ready0_reg]		! clear the ready
	st	%g0,    [ready1_reg]

	mov	0x0, tmp3			! check for end of test
	deccc	global_cnt_reg		
        move	%icc, 0x55, tmp3
	st	tmp3,    [finish_reg]		! and flag it
	brz	global_cnt_reg, good_end
	nop

	ba	loop50
	nop

!=========================================================

th_main_6:					! noise
	ba	good_end
	nop

th_main_7:					! noise
	ba	good_end
	nop

!=========================================================
good_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

!=========================================================

.data

.global addrA
.align 0x40
addrA:
	.word 0x0
	.skip 0x100
.global result0
result0:
	.word	0x0
.global ready0
ready0:
	.word	0x0

.global addrB
addrB:
	.word	0x0
	.skip 0x100
.global result1
result1:
	.word	0x0
.global ready1
ready1:
	.word	0x0
	
.global finish_area
finish_area:
	.word	0x0

.align 0x40
.global addrC
addrC:
	.word	0x0
	.skip 0x100

.end
