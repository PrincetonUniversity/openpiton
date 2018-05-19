// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_self_mod202.s
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
****************************************************************************
***
***  Program File: tso_self_mod2.s
***
***  Objective        : test which self-modifies its code and tries to stress
***			this process. uses CAS to perform the self-modification.
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

       add     %g0, 0x20, %i3	! loop counter

main_loop:
	clr	%l1
execute1:
	set	main1,%i0
	jmpl	%i0,%o7
        nop 
	add	%l1, %l0, %l1
        nop
        nop

modify1:
	set	main2,%i0   	! get some known data into the store reg.
	set	main1,%i1  	! change the data at main1
	ld	[%i1],%l0       ! bring the data to D$ for testing
	ld	[%i0],%l0       
	st	%i1, [%i1]
	cas	[%i1], %i1, %l0
	flush	%i1 	

execute2:
        set     main1,%i0
        jmpl    %i0,%o7   	!the jump causes a new cache line to be
        nop             	!loaded into the ecache and the icache.
	add	%l1, %l0, %l1
        nop
        nop

modify2:
	set	main3,%i0    	!get some known data into the store reg.
	set	main1,%i1       !change the data at main1
	ld	[%i1],%l0       ! bring the data to D$ for testing
	ld	[%i0],%l0       
	st	%i1, [%i1]
	cas	[%i1], %i1, %l0
	flush	%i1 

execute3:
        set     main1,%i0
        jmpl    %i0,%o7  	!the jump causes a new cache line to be
        nop             	!loaded into the ecache and the icache.
	add	%l1, %l0, %l1
        nop
        nop

modify3:
	set	main4,%i0   	!get some known data into the store reg.
	set	main1,%i1     	!change the data at main1
	ld	[%i0],%l0       
	st	%i1, [%i1]
	cas	[%i1], %i1, %l0
	flush	%i1 

execute4:
        set     main1,%i0
        jmpl    %i0,%o7          !the jump causes a new cache line to be
        nop                      !loaded into the ecache and the icache.
	add	%l1, %l0, %l1
        nop
        nop

modify4:
	set	main5,%i0    	!get some known data into the store reg.
	set	main1,%i1   	!change the data at main1
	ld	[%i0],%l0       
	st	%i1, [%i1]
	cas	[%i1], %i1, %l0
	flush	%i1 	

execute5:
        set     main1,%i0
        jmpl    %i0,%o7       	!the jump causes a new cache line to be
        nop               	!loaded into the ecache and the icache.
	add	%l1, %l0, %l1
        nop
        nop

	set	15, %i0
	subcc	%i0, %l1, %i0
	bnz	bad_end
	nop

modify5:
	set	main6,%i0    	!get some known data into the store reg.
	set	main1,%i1    	!change the data at main1
	ld	[%i1],%l0       ! bring the data to D$ for testing
	ld	[%i0],%l0       
	st	%l0,[%i1]
	flush   %i1   

        dec %i3			! loop
        brnz %i3, main_loop
        nop

normal_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP


user_text_end:

!--------------------------------------------------------------
! the point of these next two pages is to have text pages that
! can be written and read
!--------------------------------------------------------------
ALIGN_PAGE_8K
user_text2_start:

main1:
        mov     1,%l0           ! Replaced with copied_code second pass
	jmpl	%o7+8, %g0
	nop
main2:
	mov	2,%l0
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
main3:
	mov	3,%l0
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
        nop
        nop
        nop
        nop
        nop
        nop

main4:
	mov	4,%l0
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
main5:
	mov	5,%l0
        nop
        nop
        nop
        nop
        nop

main6:
	mov	1,%l0
        nop
        nop
        nop
        nop
        nop
user_text2_end:

/***********************************************************************
   Test case data start
 ***********************************************************************/
.data

user_data_start:
	.word 0x0
user_data_end:
