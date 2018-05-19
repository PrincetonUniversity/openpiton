// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_prod_cons_variation1_pio.s
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
 *
 *  Description: A variation of the producer consumer algorithm.
 *  thread 0 does st A; thread 1 does st B; thread 2 does ld B; ld A;
 *  thread 3 does ld A ld B; Thread 2 cannot see new B and old A while
 *  thread 3 sees new A and old B. In order to make it work I have a 
 *  fifth thread which checks what thread 2 and 3 saw.
 *
 **********************************************************************/

#define addrA_reg  		%l0
#define addrB_reg		%l1
#define result0_reg	  	%l2
#define result1_reg	  	%l3
#define ready0_reg	  	%l4
#define ready1_reg	  	%l5
#define finish_reg	  	%l6

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
	setx    result0, 	tmp0, result0_reg
	setx    result1, 	tmp0, result1_reg
	setx    ready0, 	tmp0, ready0_reg
	setx    ready1, 	tmp0, ready1_reg
	setx    finish_area,	tmp0, finish_reg

        set     ITERATIONS,	global_cnt_reg 			! 

th_fork(th_main,tmp1)

!=====================================================
th_main_0:
	mov	0x1,	tmp3
loop00:
	st	tmp3, [addrA_reg]		! store non-zero to A

loop01:						! wait for A to be zero again.
        ld    	[finish_reg], test_reg		! check for end
	sub	test_reg, 0x55, tmp2
	brz	tmp2, good_end
	nop

        ld    	[addrA_reg], test_reg
	brnz	test_reg, loop01
	nop

! put a th_ sync here
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;

	ba	loop00				! loop
	nop

!=========================================================
th_main_1:

	mov	0x2,	tmp3
loop10:
	st	tmp3, [addrB_reg]		! store non-zero to B
loop11:						! wait for B to be zero again
        ld    	[finish_reg], test_reg		! check for an end
	sub	test_reg, 0x55, tmp2
	brz	tmp2, good_end
	nop

        ld    	[addrB_reg], test_reg
	brnz	test_reg, loop11
	nop

! put a th_ sync here
	ba	loop10				! loop
	nop

!=========================================================
th_main_2:

loop30:

loop31:
        ld    	[finish_reg], test_reg		! check for an end
	sub	test_reg, 0x55, tmp2
	brz	tmp2, good_end
	nop

        ld    	[addrB_reg], test_reg		! load B until set
	brz	test_reg, loop31
	nop

        ld    	[addrA_reg], test_reg		! read A and store it
	st	test_reg,    [result0_reg]	! to result place.

	mov	0x1, test_reg
	st	test_reg,    [ready0_reg]	! flag ready

loop32:
        ld    	[finish_reg], test_reg		! check for an end
	sub	test_reg, 0x55, tmp2
	brz	tmp2, good_end
	nop

        ld    	[ready0_reg], test_reg		! wait for ready to be cleared
	brnz	test_reg, loop32
	nop

! put a th_ sync here
	ba	loop30				! loop
	nop

!=========================================================
th_main_3:

loop40:

loop41:
        ld    	[finish_reg], test_reg		! check for an end
	sub	test_reg, 0x55, tmp2
	brz	tmp2, good_end
	nop

        ld    	[addrA_reg], test_reg		! load A until set
	brz	test_reg, loop41
	nop

        ld    	[addrB_reg], test_reg		! load B and store it
	st	test_reg,    [result1_reg]	! to result place

	mov	0x1, test_reg
	st	test_reg,    [ready1_reg]	! flag ready

loop42:
        ld    	[finish_reg], test_reg		! check for an end
	sub	test_reg, 0x55, tmp2
	brz	tmp2, good_end
	nop

        ld    	[ready1_reg], test_reg		! wait for ready to be cleared
	brnz	test_reg, loop42
	nop

! put a th_ sync here
	ba	loop40				! loop
	nop


!=========================================================
th_main_4:

loop50:
        ld    	[ready0_reg], test_reg		! wait for ready0
	brz	test_reg, loop50
	nop

loop51:
        ld    	[ready1_reg], test_reg		! wait for ready1
	brz	test_reg, loop51
	nop

	ld	[result0_reg], test_reg		! load the 2 results
	ld	[result1_reg], test2_reg
	brnz	test_reg, loop5_cont		! if non-zero-> new-> OK
	nop
	brz	test2_reg, bad_end		! if both 0 -> BAD!!!
	nop

loop5_cont:

	st	%g0,   	[result0_reg]		! clear results
	st	%g0,   	[result1_reg]
	st	%g0,   	[addrA_reg]		! clear A and B
	st	%g0,   	[addrB_reg]
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

th_main_5:
th_main_6:
th_main_7:
	ba	good_end
	nop

!====================================================================================
good_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

!==========================

SECTION .MY_DATA0  DATA_VA=0xd0100000
attr_data {
        Name = .MY_DATA0,
        VA= 0x0d0100000
#ifdef PIO1
        RA=0xcf00bee000,
        PA=0xcf00bee000,
#else
        RA= 0x1d0100000
        PA= ra2pa(0x1d0100000,0),
#endif
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

	.data

.global addrA
addrA:
	.word 0x0
	.skip 0x100
.global result0
result0:
	.word	0x0
.global ready0
ready0:
	.word	0x0

SECTION .MY_DATA1  DATA_VA=0xd1110000
attr_data {
        Name = .MY_DATA1,
        VA= 0x0d1110000,
#ifdef PIO2
        RA=0xef00bee000,
        PA=0xef00bee000,
#else
        RA= 0x1d1110000,
        PA= ra2pa(0x1d1110000,0),
#endif
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

	.data
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
.end
