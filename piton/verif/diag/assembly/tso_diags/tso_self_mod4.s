// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_self_mod4.s
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
/***************************************************************************
***
***  Program File: tso__self_mod4.s
***
***  Objective        : quasi-random self-modifying test
*** 
***  Test Description : modify a location and then use it.
***
**********************************************************************/

#define MAIN_BASE_DATA_ADDR     0x160000
#define MAIN_BASE_TEXT_ADDR     0x150000
#define MAIN_BASE_DATA_ADDR_RA   0x100160000
#define MAIN_BASE_TEXT_ADDR_RA   0x100150000

#define USER_PAGE_CUSTOM_MAP
#include "boot.s"

SECTION .MAIN  TEXT_VA=0x150000, DATA_VA=0x160000

attr_text {
        Name = .MAIN,
        VA=MAIN_BASE_TEXT_ADDR,
        RA=MAIN_BASE_TEXT_ADDR_RA,
        PA=ra2pa(MAIN_BASE_TEXT_ADDR_RA,0),
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }
attr_data {
        Name = .MAIN,
        VA=MAIN_BASE_DATA_ADDR,
        RA=MAIN_BASE_DATA_ADDR_RA,
        PA=ra2pa(MAIN_BASE_DATA_ADDR_RA,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }

.text
.global main

main:

	setx 	label0, %l0,%o0
	setx	0x01000000, %l0, %i0	! good data
	setx	0xdeadbeef, %l0, %i1	! bad data

	setx 	0x20, %l0, %l2		! loop counter

label0a:
	st	%i0, [%o0]		! store good data to label0
	flush 	%o0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
label0:
	ta	T_BAD_TRAP		! 0
	st	%i0, [%o0 + 0xc]	! 4 - store more good data
	flush 	%o0			! 8
	ta	T_BAD_TRAP		! c
	st	%i0, [%o0 + 0x18]	! 10
	flush 	%o0			! 14
	ta	T_BAD_TRAP		! 18
	st	%i0, [%o0 + 0x24]	! 1c
	flush 	%o0			! 20
	ta	T_BAD_TRAP		! 24
	st	%i0, [%o0 + 0x30]	! 28
	flush 	%o0			! 2c
	ta	T_BAD_TRAP		! 30
	st	%i0, [%o0 + 0x3c]	! 34
	flush 	%o0			! 38
	ta	T_BAD_TRAP		! 3c
	st	%i0, [%o0 + 0x48]	! 40
	flush 	%o0			! 44
	ta	T_BAD_TRAP		! 48

	st	%i1, [%o0]		! now store bad data
	st	%i1, [%o0 + 0xc]	!
	st	%i1, [%o0 + 0x18]	!
	st	%i1, [%o0 + 0x24]	!
	st	%i1, [%o0 + 0x30]	!
	st	%i1, [%o0 + 0x3c]	!
	st	%i1, [%o0 + 0x48]	!

	dec     %l2     		! and loop
        brnz,pt %l2, label0a
        nop

normal_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

user_text_end:

/***********************************************************************
   Test case data start
 ***********************************************************************/
.data
user_data_start:
	.word 0x0
user_data_end:
