// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Imiss_oddeven.s
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
  File:		Imiss_oddeven.s

  Description:
  -----------
  Accesses to every other instruction, with combinations of
  anulled and non-annulled branches and branch and non-branch
  delay instructions.

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

!! Imisses to even words, non-annulled branches,
!! delay inst is not branch

		set		0x0,		%i0
.align 8
		
target_a0:		
		ba		target_a1
		add		%i0,	1,		%i0
target_a1:		
		ba		target_a2
		add		%i0,	1,		%i0
target_a2:		
		ba		target_a3
		add		%i0,	1,		%i0
target_a3:		
		ba		target_a4
		add		%i0,	1,		%i0
target_a4:		
		ba		target_a5
		add		%i0,	1,		%i0
target_a5:		
		ba		target_a6
		add		%i0,	1,		%i0
target_a6:		
		ba		target_a7
		add		%i0,	1,		%i0
target_a7:		
		ba		test_a
		add		%i0,	1,		%i0
test_a:
		subcc	%i0,	8,		%i0
		bne		diag_fail
		nop
		
!! Imisses to odd words, non-annulled branches,
!! delay inst is not branch

		set		0x0,		%i0
.align 8
		nop
		
target_b0:		
		ba		target_b1
		add		%i0,	1,		%i0
target_b1:		
		ba		target_b2
		add		%i0,	1,		%i0
target_b2:		
		ba		target_b3
		add		%i0,	1,		%i0
target_b3:		
		ba		target_b4
		add		%i0,	1,		%i0
target_b4:		
		ba		target_b5
		add		%i0,	1,		%i0
target_b5:		
		ba		target_b6
		add		%i0,	1,		%i0
target_b6:		
		ba		target_b7
		add		%i0,	1,		%i0
target_b7:		
		ba		test_b
		add		%i0,	1,		%i0
test_b:
		subcc	%i0,	8,		%i0
		bne		diag_fail
		nop

!! Imisses to even words, annulled branches,
!! delay inst is not branch

		set		0x0,		%i0
.align 8
		
target_c0:		
		ba,a		target_c1
		add		%i0,	1,		%i0
target_c1:		
		ba,a		target_c2
		add		%i0,	1,		%i0
target_c2:		
		ba,a		target_c3
		add		%i0,	1,		%i0
target_c3:		
		ba,a		target_c4
		add		%i0,	1,		%i0
target_c4:		
		ba,a		target_c5
		add		%i0,	1,		%i0
target_c5:		
		ba,a		target_c6
		add		%i0,	1,		%i0
target_c6:		
		ba,a		target_c7
		add		%i0,	1,		%i0
target_c7:		
		ba,a		test_c
		add		%i0,	1,		%i0
test_c:
		subcc	%i0,	0,		%i0
		bne		diag_fail
		nop

!! Imisses to odd words, annulled branches,
!! delay inst is not branch

		set		0x0,		%i0
.align 8
		nop
		
target_d0:		
		ba,a		target_d1
		add		%i0,	1,		%i0
target_d1:		
		ba,a		target_d2
		add		%i0,	1,		%i0
target_d2:		
		ba,a		target_d3
		add		%i0,	1,		%i0
target_d3:		
		ba,a		target_d4
		add		%i0,	1,		%i0
target_d4:		
		ba,a		target_d5
		add		%i0,	1,		%i0
target_d5:		
		ba,a		target_d6
		add		%i0,	1,		%i0
target_d6:		
		ba,a		target_d7
		add		%i0,	1,		%i0
target_d7:		
		ba,a		test_d
		add		%i0,	1,		%i0
test_d:
		subcc	%i0,	0,		%i0
		bne		diag_fail
		nop

!! Imisses to even words, non-annulled branches,
!! delay inst is a branch

.align 8
		
target_e0:		
		ba		target_e1
		ba		false_target
target_e1:		
		ba		target_e2
		ba		false_target
target_e2:		
		ba		target_e3
		ba		false_target
target_e3:		
		ba		target_e4
		ba		false_target
target_e4:		
		ba		target_e5
		ba		false_target
target_e5:		
		ba		target_e6
		ba		false_target
target_e6:		
		ba		target_e7
		ba		false_target
target_e7:		
		ba		test_e
		ba		false_target
false_target:
		nop
		ba		diag_fail
test_e:	
		nop

!! Imisses to odd words, non-annulled branches,
!! delay inst is a branch

.align 8
		nop
		
target_f0:		
		ba		target_f1
		ba		false_target
target_f1:		
		ba		target_f2
		ba		false_target
target_f2:		
		ba		target_f3
		ba		false_target
target_f3:		
		ba		target_f4
		ba		false_target
target_f4:		
		ba		target_f5
		ba		false_target
target_f5:		
		ba		target_f6
		ba		false_target
target_f6:		
		ba		target_f7
		ba		false_target
target_f7:		
		ba		test_f
		ba		false_target
test_f:
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
