// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Endian_page.s
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
  File:		Endian_page.s

  Description:
  -----------
  Test little endian support (signed and unsigned loads,
  stores, and swap) on a page level (TTE_IE = 1 in
  DTLB entry when PSTATE.CLE = 0). Also ensure big endian
  operation when TTE_IE = 1 and PSTATE.CLE = 1.

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
		
		set		le_data,		%l7

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
		
		ta		T_CHANGE_PRIV
		nop
		rdpr	%pstate,		%l3
		wrpr	%l3,	0x200,	%pstate   !! flip PSTATE.CLE bit to 1
		ta		T_CHANGE_NONPRIV
		nop

		add		%l7,	8,		%l7
		
		!! big endian unsigned loads

		lduh	[%l7],			%l1
		set		0x8899,			%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		lduw	[%l7],			%l1
		set		0x8899aabb,		%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		ldx		[%l7],			%l1
		setx	0x8899aabbccddeeff,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		!! big endian signed loads
		
		ldsh	[%l7],			%l1
		setx	0xffffffffffff8899,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		ldsw	[%l7],			%l1
		setx	0xffffffff8899aabb,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		!! big endian swap
		
		set		0xcafecafe,		%l1
		swap	[%l7],			%l1
		set		0x8899aabb,		%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop
		ldx		[%l7],			%l1
		setx	0xcafecafeccddeeff,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop
		
		!! big endian stores
		
		set		0x0011,			%l1
		sth		%l1,	[%l7]
		ldx		[%l7],			%l1
		setx	0x0011cafeccddeeff,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		set		0x00112233,		%l1
		stw		%l1,	[%l7]
		ldx		[%l7],			%l1
		setx	0x00112233ccddeeff,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		setx	0x0011223344556677,		%l3,	%l1
		stx		%l1,	[%l7]
		ldx		[%l7],			%l1
		setx	0x0011223344556677,		%l3,	%l2
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



#define LE_DATA_ADDR 0x20018000
#define LE_DATA_ADDR_RA 0x20018000

SECTION .LE_DATA DATA_VA=LE_DATA_ADDR
attr_data {
        Name = .LE_DATA,
        VA=LE_DATA_ADDR, PA=ra2pa(LE_DATA_ADDR_RA,0), RA=LE_DATA_ADDR_RA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=1, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global le_data

le_data:
	.word	0x00112233
	.word	0x44556677
	.word	0x8899aabb
	.word	0xccddeeff
	.word	0x8899aabb
	.word	0xccddeeff

.end
