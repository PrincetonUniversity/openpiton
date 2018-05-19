// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mt_Isameline.s
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
  File:		mt_Isameline.s

  Description:
  -----------
  First, 4 threads miss on 2 lines, then 4 threads miss on 1
  line.

  $Change: 17073 $
 *************************************************************/
		
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
        ba diag_fail
	nop

run_th_0:
		ba		common1
		nop

run_th_1:
		ba		common1
		nop

run_th_2:
		ba		common2
		nop

run_th_3:
		ba		common2
		nop

.align 32

common1:
		set		0x0,	%i1				! dummy instruction
		add		%i1,	1,		%i1		! dummy instruction
		ba		common3
		nop

.align 32
		
common2:		
		set		0x0,	%i2				! dummy instruction
		add		%i2,	1,		%i2		! dummy instruction
		ba		common3
		nop

.align 32
		
common3:
		set		0x0,	%i3				! dummy instruction
		add		%i3,	1,		%i3		! dummy instruction



		
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
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

