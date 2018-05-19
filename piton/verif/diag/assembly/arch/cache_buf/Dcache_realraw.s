// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Dcache_realraw.s
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
  File:		Dcache_realraw.s

  Description:
  -----------
  First, one thread issues stores (hit and miss) of all sizes
  followed by loads of all sizes within the store size at
  all address positions within the store boundary.
  Second, load issued is dependent on more than 1 store.

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
		setx	0x0011223344556677,		%l1,	%l0

store_miss_then_load:
		
		set		data_segment,	%l7

		!! stx miss, followed by ldx to same address
		stx		%l0,	[%l7]
		ldx		[%l7],			%l1
		subcc	%l1,	%l0,	%l2
		bne		diag_fail
		nop

		!! stx miss, followed by lduw to lower 4B of same address
		add		%l7,	0x10,	%l7
		srlx	%l0,	32,		%l2
		stx		%l0,	[%l7]
		lduw	[%l7],			%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx miss, followed by lduw to upper 4B of same address
		add		%l7,	0x10,	%l7
		set		0xffffffff,		%l3
		and		%l0,	%l3,	%l2
		stx		%l0,	[%l7]
		lduw	[%l7+0x4],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx miss, followed by lduh to first 2B of same address
		add		%l7,	0x10,	%l7
		srlx	%l0,	48,		%l2
		stx		%l0,	[%l7]
		lduh	[%l7],			%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx miss, followed by lduh to second 2B of same address
		add		%l7,	0x10,	%l7
		srlx	%l0,	32,		%l2
		set		0xffff,			%l3
		and		%l2,	%l3,	%l2
		stx		%l0,	[%l7]
		lduh	[%l7+0x2],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx miss, followed by lduh to third 2B of same address
		add		%l7,	0x10,	%l7
		srl		%l0,	16,		%l2
		stx		%l0,	[%l7]
		lduh	[%l7+0x4],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx miss, followed by lduh to fourth 2B of same address
		add		%l7,	0x10,	%l7
		set		0xffff,			%l3
		and		%l0,	%l3,	%l2
		stx		%l0,	[%l7]
		lduh	[%l7+0x6],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx miss, followed by ldub to first 1B of same address
		add		%l7,	0x10,	%l7
		srlx	%l0,	56,		%l2
		stx		%l0,	[%l7]
		ldub	[%l7],			%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx miss, followed by ldub to second 1B of same address
		add		%l7,	0x10,	%l7
		srlx	%l0,	48,		%l2
		and		%l2,	0xff,	%l2
		stx		%l0,	[%l7]
		ldub	[%l7+0x1],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx miss, followed by ldub to third 1B of same address
		add		%l7,	0x10,	%l7
		srlx	%l0,	40,		%l2
		and		%l2,	0xff,	%l2
		stx		%l0,	[%l7]
		ldub	[%l7+0x2],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx miss, followed by ldub to fourth 1B of same address
		add		%l7,	0x10,	%l7
		srlx	%l0,	32,		%l2
		and		%l2,	0xff,	%l2
		stx		%l0,	[%l7]
		ldub	[%l7+0x3],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx miss, followed by ldub to fifth 1B of same address
		add		%l7,	0x10,	%l7
		srl		%l0,	24,		%l2
		stx		%l0,	[%l7]
		ldub	[%l7+0x4],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx miss, followed by ldub to sixth 1B of same address
		add		%l7,	0x10,	%l7
		srl		%l0,	16,		%l2
		and		%l2,	0xff,	%l2
		stx		%l0,	[%l7]
		ldub	[%l7+0x5],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx miss, followed by ldub to seventh 1B of same address
		add		%l7,	0x10,	%l7
		srl		%l0,	8,		%l2
		and		%l2,	0xff,	%l2
		stx		%l0,	[%l7]
		ldub	[%l7+0x6],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx miss, followed by ldub to eighth 1B of same address
		add		%l7,	0x10,	%l7
		and		%l0,	0xff,	%l2
		stx		%l0,	[%l7]
		ldub	[%l7+0x7],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		
		!! stw miss, followed by lduw to same address
		add		%l7,	0x10,	%l7
		set		0xffffffff,		%l3
		and		%l0,	%l3,	%l2
		stw		%l0,	[%l7]
		lduw	[%l7],			%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stw miss, followed by lduh to lower 2B of same address
		add		%l7,	0x10,	%l7
		srl		%l0,	16,		%l2
		stw		%l0,	[%l7]
		lduh	[%l7],			%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stw miss, followed by lduh to upper 2B of same address
		add		%l7,	0x10,	%l7
		set		0xffff,			%l3
		and		%l0,	%l3,	%l2
		stw		%l0,	[%l7]
		lduh	[%l7+0x2],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stw miss, followed by ldub to first 1B of same address
		add		%l7,	0x10,	%l7
		srl		%l0,	24,		%l2
		stw		%l0,	[%l7]
		ldub	[%l7],			%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stw miss, followed by ldub to second 1B of same address
		add		%l7,	0x10,	%l7
		srl		%l0,	16,		%l2
		and		%l2,	0xff,	%l2
		stw		%l0,	[%l7]
		ldub	[%l7+0x1],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stw miss, followed by ldub to third 1B of same address
		add		%l7,	0x10,	%l7
		srl		%l0,	8,		%l2
		and		%l2,	0xff,	%l2
		stw		%l0,	[%l7]
		ldub	[%l7+0x2],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stw miss, followed by ldub to fourth 1B of same address
		add		%l7,	0x10,	%l7
		and		%l0,	0xff,	%l2
		stw		%l0,	[%l7]
		ldub	[%l7+0x3],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

		!! sth miss, followed by lduh to same address
		add		%l7,	0x10,	%l7
		set		0xffff,			%l3
		and		%l0,	%l3,	%l2
		sth		%l0,	[%l7]
		lduh	[%l7],			%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! sth miss, followed by ldub to lower 1B of same address
		add		%l7,	0x10,	%l7
		srl		%l0,	8,		%l2
		and		%l2,	0xff,	%l2
		sth		%l0,	[%l7]
		ldub	[%l7],			%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! sth miss, followed by ldub to upper 1B of same address
		add		%l7,	0x10,	%l7
		and		%l0,	0xff,	%l2
		sth		%l0,	[%l7]
		ldub	[%l7+0x1],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

		!! stb miss, followed by ldub to same address
		add		%l7,	0x10,	%l7
		and		%l0,	0xff,	%l2
		stb		%l0,	[%l7]
		ldub	[%l7],			%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

store_hit_then_load:	
		set		data_segment,	%l7

		!! stx hit, followed by ldx to same address
		stx		%l0,	[%l7]
		ldx		[%l7],			%l1
		subcc	%l1,	%l0,	%l2
		bne		diag_fail
		nop
		
		!! stx hit, followed by lduw to lower 4B of same address
		add		%l7,	0x10,	%l7
		srlx	%l0,	32,		%l2
		stx		%l0,	[%l7]
		lduw	[%l7],			%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx hit, followed by lduw to upper 4B of same address
		add		%l7,	0x10,	%l7
		set		0xffffffff,		%l3
		and		%l0,	%l3,	%l2
		stx		%l0,	[%l7]
		lduw	[%l7+0x4],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx hit, followed by lduh to first 2B of same address
		add		%l7,	0x10,	%l7
		srlx	%l0,	48,		%l2
		stx		%l0,	[%l7]
		lduh	[%l7],			%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx hit, followed by lduh to second 2B of same address
		add		%l7,	0x10,	%l7
		srlx	%l0,	32,		%l2
		set		0xffff,			%l3
		and		%l2,	%l3,	%l2
		stx		%l0,	[%l7]
		lduh	[%l7+0x2],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx hit, followed by lduh to third 2B of same address
		add		%l7,	0x10,	%l7
		srl		%l0,	16,		%l2
		stx		%l0,	[%l7]
		lduh	[%l7+0x4],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx hit, followed by lduh to fourth 2B of same address
		add		%l7,	0x10,	%l7
		set		0xffff,			%l3
		and		%l0,	%l3,	%l2
		stx		%l0,	[%l7]
		lduh	[%l7+0x6],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx hit, followed by ldub to first 1B of same address
		add		%l7,	0x10,	%l7
		srlx	%l0,	56,		%l2
		stx		%l0,	[%l7]
		ldub	[%l7],			%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx hit, followed by ldub to second 1B of same address
		add		%l7,	0x10,	%l7
		srlx	%l0,	48,		%l2
		and		%l2,	0xff,	%l2
		stx		%l0,	[%l7]
		ldub	[%l7+0x1],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx hit, followed by ldub to third 1B of same address
		add		%l7,	0x10,	%l7
		srlx	%l0,	40,		%l2
		and		%l2,	0xff,	%l2
		stx		%l0,	[%l7]
		ldub	[%l7+0x2],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx hit, followed by ldub to fourth 1B of same address
		add		%l7,	0x10,	%l7
		srlx	%l0,	32,		%l2
		and		%l2,	0xff,	%l2
		stx		%l0,	[%l7]
		ldub	[%l7+0x3],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx hit, followed by ldub to fifth 1B of same address
		add		%l7,	0x10,	%l7
		srl		%l0,	24,		%l2
		stx		%l0,	[%l7]
		ldub	[%l7+0x4],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx hit, followed by ldub to sixth 1B of same address
		add		%l7,	0x10,	%l7
		srl		%l0,	16,		%l2
		and		%l2,	0xff,	%l2
		stx		%l0,	[%l7]
		ldub	[%l7+0x5],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx hit, followed by ldub to seventh 1B of same address
		add		%l7,	0x10,	%l7
		srl		%l0,	8,		%l2
		and		%l2,	0xff,	%l2
		stx		%l0,	[%l7]
		ldub	[%l7+0x6],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stx hit, followed by ldub to eighth 1B of same address
		add		%l7,	0x10,	%l7
		and		%l0,	0xff,	%l2
		stx		%l0,	[%l7]
		ldub	[%l7+0x7],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		
		!! stw hit, followed by lduw to same address
		add		%l7,	0x10,	%l7
		set		0xffffffff,		%l3
		and		%l0,	%l3,	%l2
		stw		%l0,	[%l7]
		lduw	[%l7],			%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stw hit, followed by lduh to lower 2B of same address
		add		%l7,	0x10,	%l7
		srl		%l0,	16,		%l2
		stw		%l0,	[%l7]
		lduh	[%l7],			%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stw hit, followed by lduh to upper 2B of same address
		add		%l7,	0x10,	%l7
		set		0xffff,			%l3
		and		%l0,	%l3,	%l2
		stw		%l0,	[%l7]
		lduh	[%l7+0x2],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stw hit, followed by ldub to first 1B of same address
		add		%l7,	0x10,	%l7
		srl		%l0,	24,		%l2
		stw		%l0,	[%l7]
		ldub	[%l7],			%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stw hit, followed by ldub to second 1B of same address
		add		%l7,	0x10,	%l7
		srl		%l0,	16,		%l2
		and		%l2,	0xff,	%l2
		stw		%l0,	[%l7]
		ldub	[%l7+0x1],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stw hit, followed by ldub to third 1B of same address
		add		%l7,	0x10,	%l7
		srl		%l0,	8,		%l2
		and		%l2,	0xff,	%l2
		stw		%l0,	[%l7]
		ldub	[%l7+0x2],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! stw hit, followed by ldub to fourth 1B of same address
		add		%l7,	0x10,	%l7
		and		%l0,	0xff,	%l2
		stw		%l0,	[%l7]
		ldub	[%l7+0x3],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

		!! sth hit, followed by lduh to same address
		add		%l7,	0x10,	%l7
		set		0xffff,			%l3
		and		%l0,	%l3,	%l2
		sth		%l0,	[%l7]
		lduh	[%l7],			%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! sth hit, followed by ldub to lower 1B of same address
		add		%l7,	0x10,	%l7
		srl		%l0,	8,		%l2
		and		%l2,	0xff,	%l2
		sth		%l0,	[%l7]
		ldub	[%l7],			%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!! sth hit, followed by ldub to upper 1B of same address
		add		%l7,	0x10,	%l7
		and		%l0,	0xff,	%l2
		sth		%l0,	[%l7]
		ldub	[%l7+0x1],		%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

		!! stb hit, followed by ldub to same address
		add		%l7,	0x10,	%l7
		and		%l0,	0xff,	%l2
		stb		%l0,	[%l7]
		ldub	[%l7],			%l1
		subcc	%l1,	%l2,	%l2
		bne		diag_fail
		nop

		!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

load_dependent_on_multiple_stores:
		
		set		data_segment,	%l7

		!! multiple stores, then 1 load dependent on all of them
		setx	0x00000000ff000000,		%l4,	%l3
		and		%l0,	%l3,	%l2
		sllx	%l0,	32,		%l3
		or		%l2,	%l3,	%l2
		and		%l0,	0xff,	%l3
		sll		%l3,	16,		%l3
		or		%l2,	%l3,	%l2
		set		0xffff,			%l3
		and		%l0,	%l3,	%l3
		or		%l2,	%l3,	%l2
		stw		%l0,	[%l7]
		stb		%l0,	[%l7+0x5]
		sth		%l0,	[%l7+0x6]
		ldx		[%l7],			%l1
		subcc	%l1,	%l2,	%l2
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
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
	.word	0x6b8b4567
	.word	0x327b23c6
	.word	0x643c9869
	.word	0x66334873
		
.end
