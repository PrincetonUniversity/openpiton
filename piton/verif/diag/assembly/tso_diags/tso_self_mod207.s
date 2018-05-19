// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_self_mod207.s
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
***  Program File: tso_self_mod207.s
***
***  Objective        : quasi-random self-modifying test. Uses CAS instr.
***
***  Test Description : modify a location and then use it.
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
main:

	setx 	label0, %l0,%o0
	setx 	label1, %l0,%o1
	setx 	label2, %l0,%o2
	setx 	label3, %l0,%o3
	setx 	label4, %l0,%o4
	setx 	label5, %l0,%o5
	setx 	label6, %l0,%o6
	setx 	label7, %l0,%o7
	setx	0x01000000, %l0, %i0	! nop
	setx	0xdeadbeef, %l0, %i1	! well, you know this one.
	setx 	0x20, %l0, %l2

label0a:
	ld	[%o0], %i2
	st	%i0, [%o0]		! store a nop to label0
	flush 	%o0
label0:
	ta	T_BAD_TRAP		! 
	ld	[%o1], %i2
        mov     %i0, %i2
        st      %o1, [%o1]              ! store a nop to label1
        cas     [%o1], %o1, %i2         ! store a nop to label1
	flush 	%o0			! 
	nop
label1:
	ta	T_BAD_TRAP		! 
	ld	[%o2], %i2
        mov     %i0, %i2
        st      %o2, [%o2]              ! store a nop to label1
        cas     [%o2], %o2, %i2         ! store a nop to label1
	flush 	%o0			! 
	nop
	nop
label2:
	ta	T_BAD_TRAP		!
	ld	[%o3], %i2
        mov     %i0, %i2
        st      %o3, [%o3]              ! store a nop to label1
        cas     [%o3], %o3, %i2         ! store a nop to label1
	flush 	%o0			!
	nop
	nop
	nop
label3:
	ta	T_BAD_TRAP		!
	ld	[%o4], %i2
	st	%i0, [%o4]		!
        mov     %i0, %i2
        st      %o4, [%o4]              ! store a nop to label1
        cas     [%o4], %o4, %i2         ! store a nop to label1
	nop
	nop
	nop
	nop
label4:
	ta	T_BAD_TRAP		!
	ld	[%o5], %i2
        mov     %i0, %i2
        st      %o5, [%o5]              ! store a nop to label1
        cas     [%o5], %o5, %i2         ! store a nop to label1
	flush 	%o0			!
	nop
	nop
	nop
	nop
	nop
label5:
	ta	T_BAD_TRAP		!
	ld	[%o6], %i2
        mov     %i0, %i2
        st      %o6, [%o6]              ! store a nop to label1
        cas     [%o6], %o6, %i2         ! store a nop to label1
	flush 	%o0			!
	nop
	nop
	nop
	nop
	nop
	nop

label6:
	ta	T_BAD_TRAP		!
	ld	[%o7], %i2
        mov     %i0, %i2
        st      %o7, [%o7]              ! store a nop to label1
        cas     [%o7], %o7, %i2         ! store a nop to label1
	flush 	%o0			!
	nop
	nop
	nop
	nop
	nop
	nop
	nop

label7:
	ta	T_BAD_TRAP		!
	ld	[%o0], %i2
        mov     %i0, %i2
        st      %o0, [%o0]              ! store a nop to label1
        cas     [%o0], %o0, %i2         ! store a nop to label1
	flush 	%o0			!

					! now put some bad data
        mov     %i1, %i2
        st      %o0, [%o0]              ! 
        cas     [%o0], %o0, %i2         
        mov     %i1, %i2
        st      %o0, [%o1]              
        cas     [%o1], %o0, %i2         
        mov     %i1, %i2
        st      %o0, [%o2]             
        cas     [%o2], %o0, %i2        
        mov     %i1, %i2
        st      %o0, [%o3]            
        cas     [%o3], %o0, %i2       
        mov     %i1, %i2
        st      %o0, [%o4]           
        cas     [%o4], %o0, %i2     
        mov     %i1, %i2
        st      %o0, [%o5]         
        cas     [%o5], %o0, %i2   
        mov     %i1, %i2
        st      %o0, [%o6]         
        cas     [%o6], %o0, %i2    
        mov     %i1, %i2
        st      %o0, [%o7]       
        cas     [%o7], %o0, %i2  

	dec     %l2			! and loop again.
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
