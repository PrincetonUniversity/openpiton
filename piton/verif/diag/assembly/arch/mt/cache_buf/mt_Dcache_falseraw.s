// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mt_Dcache_falseraw.s
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
  File:		mt_Dcache_falseraw.s

  Description:
  -----------
  One thread issues stores followed by loads that have false
  RAW dependencies on the stores (i.e. do not have RAW
  dependencies).

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
		set		0x89ab,			%l0
		set		data_segment,	%l7
		setx	0x7766554433221100,	%l1,	%l2
		sth		%l0,	[%l7]
		ldx		[%l7+0x8],		%l1
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop

run_th_1:
		set		0x9abc,			%l0
		set		data_segment,	%l7
		set		0x77665544,		%l2
		sth		%l0,	[%l7+0x2]
		lduw	[%l7+0x8],			%l1
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop

run_th_2:
		set		0xabcd,			%l0
		set		data_segment,	%l7
		set		0x7766,			%l2
		sth		%l0,	[%l7+0x4]
		lduh	[%l7+0x8],		%l1
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop

run_th_3:
		set		0xbcde,			%l0
		set		data_segment,	%l7
		set		0x77,			%l2
		sth		%l0,	[%l7+0x6]
		ldub	[%l7+0x8],		%l1
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
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

.data

data_segment:
		
	.word	0xaaaabbbb
	.word	0xccccdddd
	.word	0x77665544
	.word	0x33221100

.end
