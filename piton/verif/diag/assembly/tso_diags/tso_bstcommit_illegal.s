// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_bstcommit_illegal.s
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
***  Program File: tso_bstcommit_illegal.s
***
***  Test Description : block store commits are illegal. test this.
***  SAS is doing a lot of the job here. No self-checking.
***
**********************************************************************/

#define MAIN_BASE_DATA_ADDR     0x160000
#define MAIN_BASE_TEXT_ADDR     0x150000
#define MAIN_BASE_DATA_ADDR_RA   0x100160000
#define MAIN_BASE_TEXT_ADDR_RA   0x100150000

#define USER_PAGE_CUSTOM_MAP
#define ENABLE_HT0_Data_Access_Exception_0x30
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

	wr      %g0, 0x4, %fprs         ! make sure fef is 1 
	setx 	good_data, %l0,%o0	! prepare good and bad data
	setx 	bad_data, %l0,%o1	!
	ldda    [%o0]ASI_BLK_P, %d0	! in d0 and d16
	stda	%d0, [%o1]ASI_COMMIT_P	! store good data to label0
        membar  0x40
	ldda    [%o1]ASI_BLK_P, %d0	! in d0 and d16

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

.align 0x100
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
