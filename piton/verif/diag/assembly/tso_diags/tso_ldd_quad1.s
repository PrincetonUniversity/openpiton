// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_ldd_quad1.s
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
/***********************************************************************
 * Description:  testing quad ldd from a hypervisor trap
 **********************************************************************/

#define H_T0_Trap_Instruction_0 intr0x30_custom_trap

#include "boot.s"

#define MY_DATA_ADDR      0x160000
#define MY_DATA_ADDR_RA   0x100160000
#define MY_TEXT_ADDR      0x170000
#define MY_TEXT_ADDR_RA   0x100170000

.global main

main:

	ta 0x30
	ta T_GOOD_TRAP

good_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

SECTION .MY_ZERO_CTX   TEXT_VA=MY_TEXT_ADDR, DATA_VA=MY_DATA_ADDR

attr_text {
        Name = .MY_ZERO_CTX,
        VA=MY_TEXT_ADDR,
        RA=MY_TEXT_ADDR_RA,
        PA=ra2pa(MY_TEXT_ADDR_RA,0),
        part_0_i_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }

attr_data {
        Name = .MY_ZERO_CTX,
        RA=MY_DATA_ADDR_RA,
	PA=ra2pa(MY_DATA_ADDR_RA,0),
        part_0_d_ctx_zero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=1, TTE_W=1
        }

.text
.global intr0x30_custom_trap
intr0x30_custom_trap:
	setx	my_data, %l0, %i0
	set	0x1, %o0
	stx	%o0, [%i0]
	add	%o0, 1, %o0
	add	%i0, 8, %i0
	stx	%o0, [%i0]
	add	%o0, 1, %o0
	add	%i0, 8, %i0
	stx	%o0, [%i0]
	add	%o0, 1, %o0
	add	%i0, 8, %i0
	stx	%o0, [%i0]
	
	add	%o0, 1, %o0
	add	%i0, 8, %i0
	stx	%o0, [%i0]

	setx	my_data, %l0, %i0
	ldda	[%i0] 0x24, %l6

!==================
	stb	%o0, [%i0+0xf]
	ldda	[%i0] 0x24, %l6

!==================
	st	%o0, [%i0+0xc]
	ldda	[%i0] 0x24, %l6

!==================
	st	%o0, [%i0+0x4]
	st	%o0, [%i0+0x8]
	st	%o0, [%i0+0xc]
	ldda	[%i0] 0x24, %l6

!==================
	ld	[%i0+0xc], %o0
!==================

!==================
	stb	%o0, [%i0+0xf]
	ldda	[%i0] 0x24, %l6

!==================
	st	%o0, [%i0+0xc]
	ldda	[%i0] 0x24, %l6

!==================
	st	%o0, [%i0+0x4]
	st	%o0, [%i0+0x8]
	st	%o0, [%i0+0xc]
	ldda	[%i0] 0x24, %l6

	done;

.data
.global my_data
my_data:
	.skip 0x1000
