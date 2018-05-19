// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mt_l1cache4.s
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
/*************************************************************
  File:		mt_Dhit_sameset.s

  Description:
  -----------
  4 threads issue loads/stores/atomics to 4 different tags
  belonging to the same set.

  $Change: 17073 $
 *************************************************************/
#define MAIN_PAGE_HV_ALSO	
#define THREAD_COUNT    4
#include "boot.s"

.text
.global main
.global run_th_0
.global run_th_1
.global run_th_2
.global run_th_3

main:

thread_jump:
	th_fork(run_th)

        ba diag_fail	/* should not come here */
	nop

run_th_0:
	ta	T_CHANGE_HPRIV
	nop

	mov 	0xd, %l0
	stxa	%l0, [%g0] 0x45		/* turn D-cache off */
	
	ta	T_CHANGE_NONHPRIV
	nop

		setx				data0,		%l0, %i0
		setx				data1,		%l0, %i1
		setx				data2,		%l0, %i2
		setx				data3,		%l0, %i3

	ld	[%i0], 	%l2	/* load DTLB entry : miss penality 22 cycles */

	mov  	0x1, %l0
	mov	0x40, %l1	/* loop counter */ 
th0_lp0:
	sth	%l0, 	[%i0]	
	sth	%l2, 	[%i1]	
	stb	%l2, 	[%i2]	
	stb	%l2, 	[%i3]	
	ld	[%i2],	%l3	/* 3rd load */
	ld	[%i1],	%l3	/* 2nd load */
	ld	[%i3],	%l3	/* 3rd load */
	ld	[%i0],	%l2	/* raw */
	add	%l0, 	1, %l0
	brgz,a	%l1, 	th0_lp0
	sub	%l1, 1, %l1

	ta	T_CHANGE_HPRIV
	nop

	mov 	0xf, %l0
	stxa	%l0, [%g0] 0x45		/* turn D-cache back on */
	
	ta	T_CHANGE_NONHPRIV
	nop

	mov  	0x1, %l0
	mov	0xc0, %l1	/* loop counter */ 
th0_lp1:
	sth	%l0, 	[%i0]	
	ld	[%i0],	%l2	/* raw */
	sth	%l2, 	[%i1]	
	ld	[%i1],	%l3	/* 2nd load */
	stb	%l2, 	[%i2]	
	ld	[%i2],	%l3	/* 3rd load */
	stb	%l2, 	[%i3]	
	ld	[%i3],	%l3	/* 3rd load */
	add	%l0, 	1, %l0
	brgz,a	%l1, 	th0_lp1
	sub	%l1, 1, %l1

		ba		diag_pass
		nop

run_th_1:
	ta	T_CHANGE_HPRIV
	nop

	mov 	0xd, %l0
	stxa	%l0, [%g0] 0x45		/* turn D-cache off */
	
	ta	T_CHANGE_NONHPRIV
	nop

                setx                             data0,           %l0, %i0
                setx                             data1,           %l0, %i1
                setx                             data2,           %l0, %i2
                setx                             data3,           %l0, %i3
	set  	0x1001, %l0
	mov	0x100, %l1	/* loop counter */ 
th1_lp0:
	sth	%l0, 	[%i1]	
	ld	[%i1],	%l2	/* raw */
	st	%l2, 	[%i0]	
	ld	[%i0],	%l3	/* 2nd load */
	sth	%l0, 	[%i2]	
	ld	[%i2],	%l2	/* raw */
	st	%l2, 	[%i3]	
	ld	[%i3],	%l3	/* 2nd load */

	add	%l0, 	1, %l0
	brgz,a	%l1, 	th1_lp0
	sub	%l1, 1, %l1
		ba		diag_pass
		nop

run_th_2:
	mov	0x30,	%l7
	call	delay_cycle
	nop
                setx                             data0,           %l0, %i0
                setx                             data1,           %l0, %i1
                setx                             data2,           %l0, %i2
                setx                             data3,           %l0, %i3
	set  	0x2001, %l0
	mov	0x100, %l1	/* loop counter */ 
th2_lp0:
	sth	%l0, 	[%i0]	
	sth	%l0, 	[%i1]	
	sth	%l0, 	[%i2]	
	sth	%l0, 	[%i3]	
	ld	[%i2],	%l2	/* raw */
	ld	[%i1],	%l2	/* raw */
	ld	[%i0],	%l2	/* raw */
	ld	[%i2],	%l2	/* raw */

	add	%l0, 	1, %l0
	brgz,a	%l1, 	th2_lp0
	sub	%l1, 1, %l1

		ba		diag_pass
		nop

run_th_3:
	mov	0x30,	%l7
	call	delay_cycle
	nop
                setx                             data0,           %l0, %i0
                setx                             data1,           %l0, %i1
                setx                             data2,           %l0, %i2
                setx                             data3,           %l0, %i3
	set  	0x3001, %l0
	mov	0x100, %l1	/* loop counter */ 
th3_lp0:
	sth	%l0, 	[%i3]	
	ld	[%i3],	%l2	/* raw */
	st	%l2, 	[%i3]	
	ld	[%i3+0x4],	%l3	/* 2nd load */
	sth	%l0, 	[%i0]	
	ld	[%i0],	%l2	/* raw */
	st	%l2, 	[%i1]	
	ld	[%i1],	%l3	/* 2nd load */

	add	%l0, 	1, %l0
	brgz,a	%l1, 	th3_lp0
	sub	%l1, 1, %l1

		ba		diag_pass
		nop


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!! Diag PASSED
		
diag_pass:
        set     0xaaddcafe,     %l0
        ta T_GOOD_TRAP
        nop

!! Diag FAILED

diag_fail:		
        set     0xdeadcafe,     %l0
        ta T_BAD_TRAP
        nop
        nop

.global delay_cycle	/* l7 : loop# */
delay_cycle:
	sllx	%l7, 1, %l7
	sub	%l7, 2, %l7
.global dly_lp
dly_lp:
	brnz,a	%l7, dly_lp
	sub	%l7, 1, %l7

	retl
	nop

.data

.align 0x2000

data0:
        .word 0x01010101
        .word 0x02020202
        .word 0x03030303
        .word 0x04040404

.align 0x800		/* L1 cache : PA bits[10:4] -> set index */

data1:
        .word 0x05050505
        .word 0x06060606
        .word 0x07070707
        .word 0x08080808

.align 0x800

data2:
        .word 0x09090909
        .word 0x0a0a0a0a
        .word 0x0b0b0b0b
        .word 0x0c0c0c0c

.align 0x800

data3:
        .word 0x0d0d0d0d
        .word 0x0e0e0e0e
        .word 0x0f0f0f0f
        .word 0xf0f0f0f0

.end
