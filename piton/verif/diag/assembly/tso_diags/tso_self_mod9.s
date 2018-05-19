// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_self_mod9.s
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
***  Program File: tso_self_mod9.s
***
***  Objective        : quasi-random self-modifying test
***  Test Description : modify a location and then use it. Use block stores.
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

	wr      %g0, 0x4, %fprs         /* make sure fef is 1 */
	setx 	good_data, %l0,%o0		
	setx 	bad_data, %l0,%o1
	ldda    [%o0]ASI_BLK_P, %d0  	! good data contains nop-s
	ldda    [%o1]ASI_BLK_P, %d16   	! bad data contains ta T_BAD_TRAP-s
        membar  0x40

	setx 	label0, %l0,%o0		! prepare the address registers
	setx 	label1, %l0,%o1
	setx 	label2, %l0,%o2
	setx 	label3, %l0,%o3
	setx 	label4, %l0,%o4
	setx 	label5, %l0,%o5
	setx 	label6, %l0,%o6
	setx 	label7, %l0,%o7
	setx 	0x20, %l0, %l2

label0a:
	stda	%d0, [%o0]ASI_BLK_P	! store good data to label0
        membar  0x40
	flush 	%o0
	ba	label0			! go there
	nop

.align	0x40
label0:
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 

	stda	%d0, [%o1]ASI_BLK_P	! store good data to label1
        membar  0x40
	flush 	%o0			! 
	ba	label1			! go there
	nop

.align	0x40
label1:
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	stda	%d0, [%o2]ASI_BLK_P	! etc
        membar  0x40
	flush 	%o0			! 
	ba	label2
	nop

.align	0x40
label2:
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	stda	%d0, [%o3]ASI_BLK_P
        membar  0x40
	flush 	%o0			!
	ba	label3
	nop

.align	0x40
label3:
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	stda	%d0, [%o4]ASI_BLK_P
        membar  0x40
	flush 	%o0			!
	ba	label4
	nop

.align	0x40
label4:
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	stda	%d0, [%o5]ASI_BLK_P
        membar  0x40
	flush 	%o0			!
	ba	label5
	nop

.align	0x40
label5:
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	stda	%d0, [%o6]ASI_BLK_P
        membar  0x40
	flush 	%o0			!
	ba	label6
	nop

.align	0x40
label6:
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	stda	%d0, [%o7]ASI_BLK_P
        membar  0x40
	flush 	%o0			!
	ba	label7
	nop

.align	0x40
label7:
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	stda	%d0, [%o0]ASI_BLK_P
        membar  0x40
	flush 	%o0			!

	stda	%d16, [%o0]ASI_BLK_P	! now store bad data everywhere
	stda	%d16, [%o1]ASI_BLK_P
	stda	%d16, [%o2]ASI_BLK_P
	stda	%d16, [%o3]ASI_BLK_P
	stda	%d16, [%o4]ASI_BLK_P
	stda	%d16, [%o5]ASI_BLK_P
	stda	%d16, [%o6]ASI_BLK_P
	stda	%d16, [%o7]ASI_BLK_P
        membar  0x40

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
.align 0x100
good_data:

	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000

bad_data:
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef

user_data_end:
