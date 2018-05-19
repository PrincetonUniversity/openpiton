// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Imiss_branches.s
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
  File:		Imiss_branches.s

  Description:
  -----------
  Jumps from one branch to another, and all the branches are
  at the end (highest addressed word) of the Icache line.

  $Change$
 *************************************************************/
		
#ifdef MT_TEMPLATE
#include "mt_body.h"
#else
#include "boot.s"
.global main
#endif

.text

main:

!! Conditional branches at end of every cache line, condition setting
!! instructions immediately before branch.
		
		set		0x0,		%i0
		set		0x3,		%i1

.align 32
		
				add		%i0,	1,		%i0
				sll		%i1,	1,		%i1
				nop
				nop
				nop
				nop
target_a0:		subcc	%i1,	6,		%i2
				be		target_a1
		
				add		%i0,	1,		%i0
				sll		%i1,	1,		%i1
				nop
				nop
				nop
				nop
target_a1:		subcc	%i1,	6,		%i2
				be		target_a2

				add		%i0,	1,		%i0
				sll		%i1,	1,		%i1
				nop
				nop
				nop
				nop
target_a2:		subcc	%i1,	6,		%i2
				be		target_a3
		
				add		%i0,	1,		%i0
				sll		%i1,	1,		%i1
				nop
				nop
				nop
				nop
target_a3:		subcc	%i1,	6,		%i2
				be		target_a4

				add		%i0,	1,		%i0
				sll		%i1,	1,		%i1
				nop
				nop
				nop
				nop
target_a4:		subcc	%i1,	6,		%i2
				be		target_a5

				add		%i0,	1,		%i0
				sll		%i1,	1,		%i1
				nop
				nop
				nop
				nop
target_a5:		subcc	%i1,	6,		%i2
				be		target_a6

				add		%i0,	1,		%i0
				sll		%i1,	1,		%i1
				nop
				nop
				nop
				nop
target_a6:		subcc	%i1,	6,		%i2
				be		target_a7

				add		%i0,	1,		%i0
				sll		%i1,	1,		%i1
				nop
				nop
				nop
				nop
target_a7:		subcc	%i1,	6,		%i2
				be		test_a

test_a:
		nop
		subcc	%i0,	8,		%i0
		bne		diag_fail
		nop


!! Unconditional branches at end of every cache line, no condition setting
!! instructions.
		
		set		0x0,		%i0
		set		0x0,		%i1

.align 32
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	2,		%i1
target_b0:		ba		target_b1
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	2,		%i1
target_b1:		ba		target_b2
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	2,		%i1
target_b2:		ba		target_b3
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	2,		%i1
target_b3:		ba		target_b4
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	2,		%i1
target_b4:		ba		target_b5
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	2,		%i1
target_b5:		ba		target_b6
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	2,		%i1
target_b6:		ba		target_b7
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	2,		%i1
target_b7:		ba		test_b
		

test_b:
		nop
		subcc	%i0,	8,		%i0
		bne		diag_fail
		subcc	%i1,	8,		%i1
		bne		diag_fail
		nop

		
!! Unconditional branches at end of every even cache line
		
		set		0x0,		%i0
		set		0x0,		%i1

.align 64
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				add		%i1,	5,		%i1
target_c0:		ba		target_c1
		
				add		%i0,	1,		%i0
				sll		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	%i1,	%i1
				ba		diag_fail
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				add		%i1,	5,		%i1
target_c1:		ba		target_c2
		
				add		%i0,	1,		%i0
				sll		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	%i1,	%i1
				ba		diag_fail
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				add		%i1,	5,		%i1
target_c2:		ba		target_c3
		
				add		%i0,	1,		%i0
				sll		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	%i1,	%i1
				ba		diag_fail
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				add		%i1,	5,		%i1
target_c3:		ba		target_c4
		
				add		%i0,	1,		%i0
				sll		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	%i1,	%i1
				ba		diag_fail
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				add		%i1,	5,		%i1
target_c4:		ba		target_c5
		
				add		%i0,	1,		%i0
				sll		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	%i1,	%i1
				ba		diag_fail
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				add		%i1,	5,		%i1
target_c5:		ba		target_c6
		
				add		%i0,	1,		%i0
				sll		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	%i1,	%i1
				ba		diag_fail
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				add		%i1,	5,		%i1
target_c6:		ba		target_c7
		
				add		%i0,	1,		%i0
				sll		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	%i1,	%i1
				ba		diag_fail
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				add		%i1,	5,		%i1
target_c7:		ba		test_c
		

test_c:
		nop
		subcc	%i0,	8,		%i0
		bne		diag_fail
		subcc	%i1,	7,		%i1
		bne		diag_fail
		nop


!! Unconditional branches at end of every odd cache line
		
		set		0x0,		%i0
		set		0x0,		%i1

.align 64

				add		%i0,	1,		%i0
				sll		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	%i1,	%i1
				sll		%i1,	%i0,	%i1
		
				add		%i0,	1,		%i0
				add		%i0,	%i1,	%i1
				nop
				nop
				nop
				nop
				add		%i1,	5,		%i1
target_d0:		ba		target_d1
		
				add		%i0,	1,		%i0
				sll		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	%i1,	%i1
				ba		diag_fail
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				add		%i1,	5,		%i1
target_d1:		ba		target_d2
		
				add		%i0,	1,		%i0
				sll		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	%i1,	%i1
				ba		diag_fail
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				add		%i1,	5,		%i1
target_d2:		ba		target_d3
		
				add		%i0,	1,		%i0
				sll		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	%i1,	%i1
				ba		diag_fail
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				add		%i1,	5,		%i1
target_d3:		ba		target_d4
		
				add		%i0,	1,		%i0
				sll		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	%i1,	%i1
				ba		diag_fail
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				add		%i1,	5,		%i1
target_d4:		ba		target_d5
		
				add		%i0,	1,		%i0
				sll		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	%i1,	%i1
				ba		diag_fail
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				add		%i1,	5,		%i1
target_d5:		ba		target_d6
		
				add		%i0,	1,		%i0
				sll		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	%i1,	%i1
				ba		diag_fail
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				add		%i1,	5,		%i1
target_d6:		ba		target_d7
		
				add		%i0,	1,		%i0
				sll		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				sll		%i1,	%i1,	%i1
				ba		diag_fail
		
				add		%i0,	1,		%i0
				add		%i0,	%i0,	%i1
				nop
				nop
				nop
				nop
				add		%i1,	5,		%i1
target_d7:		ba		test_d
		

test_d:
		nop
		subcc	%i0,	9,		%i0
		bne		%icc,	diag_fail
		subcc	%i1,	23,		%i1
		bne		%icc,	diag_fail
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

.end
