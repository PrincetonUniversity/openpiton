// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_self_mod1.s
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
***  Program File: tso_self_mod1.s
***
***  Description : self-modifying code 
***
**********************************************************************/

#define MAIN_BASE_DATA_ADDR     0x160000
#define MAIN_BASE_TEXT_ADDR     0x150000
#define MAIN_BASE_DATA_ADDR_RA  0x100160000
#define MAIN_BASE_TEXT_ADDR_RA  0x100150000

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
main:	clr	%l0

firstExecuteMain1:
	set	main1,%i0
	jmpl	%i0,%o7          !the jump causes a new cache line to be
        nop                      !loaded into the l2 and the icache.
        nop
        nop


modifyCodeAtMain1:
	set	copied_code, %i0	!get some known data into the store reg.
	ld	[%i0],%l0       
	set	main1,%i0           	!change the data at main1
	st	%l0,[%i0]
	flush	%i0 		    	!flush is mandatory here


execute_main1_again:
        set     main1,%i0
        jmpl    %i0,%o7          	!the jump causes a new cache line to be
        nop                      	!loaded into the ecache and the icache.

	mov 7, %l1		 	! check that the modified instruction
	sub %l1, %l0, %l1	 	! is used and not the original
	brnz,pn %l1, bad_end
	nop

get_new_cache_line:			! do pretty much the same thing
	set	main2, %i0		! with another address
	ld	[%i0], %l0		! modify the address and then
	set	new_cache_line, %i0
	st	%l0,[%i0]
	flush	%i0       

execute_new_cache_line:			! execute
        set     new_cache_line,%i0
        jmpl    %i0,%o7          	!the jump causes a new cache line to be
        nop                      	!loaded into the ecache and the icache.
        nop
        set  0xbe, %l1
        sub %l1, %l0, %l1
        brnz,pn %l1, bad_end
        nop
 
normal_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP


!==========================================================================
! the point of these next two pages is to have text pages that
! can be written and read
! The first page holds 2 cache lines worth, the second page has 1 cache line.
!==========================================================================
main1:
        mov     1,%l0           ! Replaced with copied_code second pass
	jmpl	%o7+8, %g0
	nop
copied_code:
	mov	7,%l0
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
new_cache_line:
	mov	0xbad,%l0
	jmpl	%o7+8, %g0
        nop
        nop
user_text2_end:

main2:
        mov     0xbe,%l0           ! Replaced with copied_code second pass
	jmpl	%o7+8, %g0
	nop

!======================================
.data
user_data_start:
	.word 0x0
user_data_end:
