// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Dmiss_imiss.s
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
  File:		Dmiss_imiss.s

  Description:
  -----------
  First, one thread issues a load miss followed by an imiss
  in the next cycle. Second, one thread issues a store miss
  followed by an imiss 4 cycles later, such that both misses
  are determined in the same cycle.

  $Change: 49556 $
 *************************************************************/
		
#include "boot.s"

.text
.global main


main:
		setx	0x0011223344556677,		%l1,	%l0
		set		data_segment,	%l7
		ldx		[%l7],			%l1

.align 32

		!! dummy instructions
		add		%l1,	1,		%l2
		add		%l2,	1,		%l1
		add		%l1,	1,		%l2
		add		%l2,	1,		%l1
		add		%l1,	1,		%l2
		add		%l2,	1,		%l1
		add		%l7,	0x10,	%l7
		ld		[%l7],			%l1   !! load miss

.align 32    !! Icache line boundary here

		add		%l1,	%l1,	%l1	  !! inst miss
		subcc	%l1,	8,		%l2
		bne		diag_fail
		add		%l7,	0x10,	%l7
		st		%l0,	[%l7]         !! M: store miss
		add		%l1,	1,		%l1   !! E:	
		add		%l1,	1,		%l1   !! D:	
		add		%l1,	1,		%l1   !! S:	
		
.align 32    !! Icache line boundary here

		subcc	%l1,	11,		%l2
		bne		diag_fail
		nop


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
		
	.word	0x00000000
	.word	0x00000001
	.word	0x00000002
	.word	0x00000003
	.word	0x00000004
	.word	0x00000005
	.word	0x00000006
	.word	0x00000007
	.word	0x00000008
	.word	0x00000009
	.word	0x0000000a
	.word	0x0000000b
	.word	0x0000000c
	.word	0x0000000d
	.word	0x0000000e
	.word	0x0000000f

.end
