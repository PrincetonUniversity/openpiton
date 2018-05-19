// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Dcache_war.s
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
  File:		Dcache_war.s

  Description:
  -----------
  One thread issues loads followed by stores (WAR
  anti-dependency).

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
		setx	0x0011223344556677,		%l1,	%l0
		set		data_segment,	%l7

		!! ldub followed by stb to the same address
		set		0xaa,			%l2
		ldub	[%l7],			%l1
		stb		%l0,	[%l7]
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop

		!! ldub followed by sth to the same address
		set		0x77,			%l2
		ldub	[%l7],			%l1
		sth		%l0,	[%l7]
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop

		!! ldub followed by stw to the same address
		set		0x66,			%l2
		ldub	[%l7],			%l1
		stw		%l0,	[%l7]
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop

		!! ldub followed by stx to the same address
		set		0x44,			%l2
		ldub	[%l7],			%l1
		stx		%l0,	[%l7]
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop

		!! lduh followed by stb to the same address
		set		0x0011,			%l2
		lduh	[%l7],			%l1
		stb		%l0,	[%l7]
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop

		!! lduh followed by sth to the same address
		set		0x7711,			%l2
		lduh	[%l7],			%l1
		sth		%l0,	[%l7]
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop

		!! lduh followed by stw to the same address
		set		0x6677,			%l2
		lduh	[%l7],			%l1
		stw		%l0,	[%l7]
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop

		!! lduh followed by stx to the same address
		set		0x4455,			%l2
		lduh	[%l7],			%l1
		stx		%l0,	[%l7]
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop

		!! lduw followed by stb to the same address
		set		0x00112233,		%l2
		lduw	[%l7],			%l1
		stb		%l0,	[%l7]
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop

		!! lduw followed by sth to the same address
		set		0x77112233,		%l2
		lduw	[%l7],			%l1
		sth		%l0,	[%l7]
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop

		!! lduw followed by stw to the same address
		set		0x66772233,		%l2
		lduw	[%l7],			%l1
		stw		%l0,	[%l7]
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop

		!! lduw followed by stx to the same address
		set		0x44556677,		%l2
		lduw	[%l7],			%l1
		stx		%l0,	[%l7]
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop

		!! ldx followed by stb to the same address
		setx	0x0011223344556677,		%l3,	%l2
		ldx		[%l7],			%l1
		stb		%l0,	[%l7]
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop

		!! ldx followed by sth to the same address
		setx	0x7711223344556677,		%l3,	%l2
		ldx		[%l7],			%l1
		sth		%l0,	[%l7]
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop

		!! ldx followed by stw to the same address
		setx	0x6677223344556677,		%l3,	%l2
		ldx		[%l7],			%l1
		stw		%l0,	[%l7]
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop

		!! ldx followed by stx to the same address
		setx	0x4455667744556677,		%l3,	%l2
		ldx		[%l7],			%l1
		stx		%l0,	[%l7]
		subcc	%l1,	%l2,	%l3
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
		
	.word	0xaaaabbbb
	.word	0xccccdddd

.end
