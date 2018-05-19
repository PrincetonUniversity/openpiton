// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_ldd_quad2.s
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
 *  Description: testing quad ldd. Multiple threads
 **********************************************************************/

#define base_reg	  		%i0
#define my_id_reg	  		%o3
#define cnt_reg	  			%o5
#define temp_reg	  		%o0

#define ITERATIONS 	  		0x40

#define MY_DATA_ADDR      0x160000
#define MY_DATA_ADDR_RA   0x100160000
#define MY_TEXT_ADDR      0x170000
#define MY_TEXT_ADDR_RA   0x100170000

#define H_T0_Trap_Instruction_0 intr0x30_custom_trap

#include "boot.s"

.global main

main:

        set     ITERATIONS,	cnt_reg 			! 
	mov	%g0, my_id_reg

th_fork(th_main,%l0)

th_main_0:
        add     my_id_reg, 0x00, my_id_reg			! this is my ID address
	ba	go
	nop

th_main_1:
        add     my_id_reg, 0x10, my_id_reg
	ba	go
	nop


th_main_2:
        add     my_id_reg, 0x20, my_id_reg
	ba	go
	nop

th_main_3:
        add     my_id_reg, 0x30, my_id_reg
	ba	go
	nop

th_main_4:
        add     my_id_reg, 0x40, my_id_reg
	ba	go
	nop

th_main_5:
        add     my_id_reg, 0x50, my_id_reg
	ba	go
	nop

th_main_6:
        add     my_id_reg, 0x60, my_id_reg
	ba	go
	nop

th_main_7:
        add     my_id_reg, 0x70, my_id_reg
	ba	go
	nop

go:
	add	my_id_reg, %g0, temp_reg
	setx	my_data, %l0, base_reg
	add	base_reg, my_id_reg, base_reg

goloop:
	deccc	cnt_reg
	bne	goloop
	ta	0x30

good_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

!==========================

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
	stx	temp_reg, [base_reg]
	add	temp_reg, 1, temp_reg
	stx	temp_reg, [base_reg + 0x8]
	
	ldda	[base_reg] 0x24, %l6

!==================
	stb	temp_reg, [base_reg+0xf]
	ldda	[base_reg] 0x24, %l6

!==================
	st	temp_reg, [base_reg+0xc]
	ldda	[base_reg] 0x24, %l6

!==================
	st	temp_reg, [base_reg+0x4]
	st	temp_reg, [base_reg+0x8]
	st	temp_reg, [base_reg+0xc]
	ldda	[base_reg] 0x24, %l6

!==================
	ld	[base_reg+0xc], temp_reg
!==================

!==================
	stb	temp_reg, [base_reg+0xf]
	ldda	[base_reg] 0x24, %l6

!==================
	st	temp_reg, [base_reg+0xc]
	ldda	[base_reg] 0x24, %l6

!==================
	st	temp_reg, [base_reg+0x4]
	st	temp_reg, [base_reg+0x8]
	st	temp_reg, [base_reg+0xc]
	ldda	[base_reg] 0x24, %l6

	done;

.data
.global my_data
my_data:
	.skip 0x1000
