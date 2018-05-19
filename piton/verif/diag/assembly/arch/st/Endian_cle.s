// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Endian_cle.s
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
  File:		Endian_cle.s

  Description:
  -----------
  Test little endian support (signed and unsigned loads,
  stores, and swap) when PSTATE.CLE is set.

  $Change: 49556 $
 *************************************************************/
		
#ifdef MT_TEMPLATE
#include "mt_body.h"
#else
#include "boot.s"
.global main
#endif
		
.text

main:
		set		data_segment,	%l7
		ta		T_CHANGE_PRIV
		nop
		rdpr	%pstate,		%l3
		wrpr	%l3,	0x200,	%pstate   !! flip PSTATE.CLE bit (PSTATE[9]) to 1
		ta		T_CHANGE_NONPRIV
		nop

		!! little endian unsigned loads
		
		lduh	[%l7],			%l1
		set		0x1100,			%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		lduw	[%l7],			%l1
		set		0x33221100,		%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		ldx		[%l7],			%l1
		setx	0x7766554433221100,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop
		
		!! little endian stores
		
		set		0x8899,			%l1
		sth		%l1,	[%l7]
		ldx		[%l7],			%l1
		setx	0x7766554433228899,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		set		0x8899aabb,		%l1
		stw		%l1,	[%l7]
		ldx		[%l7],			%l1
		setx	0x776655448899aabb,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		setx	0x8899aabbccddeeff,		%l3,	%l1
		stx		%l1,	[%l7]
		ld		[%l7],			%l1
		set		0xccddeeff,		%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		!! little endian signed loads
		
		add		%l7,	8,		%l7
		ldsh	[%l7],			%l1
		setx	0xffffffffffff9988,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		ldsw	[%l7],			%l1
		setx	0xffffffffbbaa9988,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		!! little endian swap
		
		set		0x00112233,		%l1
		swap	[%l7],			%l1
		set		0xbbaa9988,		%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop
		ldx		[%l7],			%l1
		setx	0xffeeddcc00112233,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
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
		
	.word	0x00112233
	.word	0x44556677
	.word	0x8899aabb
	.word	0xccddeeff

.end
