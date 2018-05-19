// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_self_mod111.s
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
***  Program File: ecu_ic_self_mod111.s
***
***  Objective        : quasi-random self-modifying test.
***			test I$/D$ exclusivity also. Many prefetches
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

	setx 	label0, %l0,%o0			! prepare the addresses
	setx 	label1, %l0,%o1
	setx 	label2, %l0,%o2
	setx 	label3, %l0,%o3
	setx 	label4, %l0,%o4
	setx 	label5, %l0,%o5
	setx 	label6, %l0,%o6
	setx 	label7, %l0,%o7

	setx	0xdeadbeef, %l0, %i1		! bad data .

	setx 	0x20, %l0, %l2			! loop counter

	setx 	pref_label, %l0,%g1		! the good instruction
	ld	[%g1], %i0			! goes to %i0

	setx 	user_data_start, %l0,%g1
	or	%g0, 0x1, %i2			! some stores for noise...
	setx 	0x40, %l0, %l3

loop1:
	st	%i2, [%g1]
	add	%i2, 1, %i2
	add	%g1, 0x40, %g1			! addr + 0x40

	dec	%l3
        brnz,pt %l3, loop1
      	nop

out_of_loop1:

	membar #Sync

	setx 	user_data_start, %l0,%g1

	ba	label0a
	prefetch [%g1], #n_writes

pref_label:
	prefetch [%g1], #n_writes

! The real self-modifying code starts here.
!==========================================
label0a:
	st	%i0, [%o0]		! store good data to label0
	flush 	%o0
label0:
	ta	T_BAD_TRAP		! 
	ld	[%o1], %i3
	st	%i0, [%o1]		! store good data to label1
	flush 	%o0			! 
	add	%g1, 0x40, %g1		
	prefetch [%g1], #n_writes	! prefetches are for noise...
label1:
	ta	T_BAD_TRAP		! 
	ld	[%o2], %i3
	st	%i0, [%o2] 		! etc...
	flush 	%o0			! 
	prefetch [%g1], #n_writes
	prefetch [%g1], #n_writes
	add	%g1, 0x40, %g1		
label2:
	ta	T_BAD_TRAP		!
	ld	[%o3], %i3
	st	%i0, [%o3]
	flush 	%o0			!
	prefetch [%g1], #n_writes
	prefetch [%g1], #n_writes
	prefetch [%g1], #n_writes
	add	%g1, 0x40, %g1		
label3:
	ta	T_BAD_TRAP		!
	ld	[%o4], %i3
	st	%i0, [%o4]	!
	flush 	%o0			!
	prefetch [%g1], #n_writes
	prefetch [%g1], #n_writes
	prefetch [%g1], #n_writes
	prefetch [%g1], #n_writes
	add	%g1, 0x40, %g1		
label4:
	ta	T_BAD_TRAP		!
	ld	[%o5], %i3
	st	%i0, [%o5]	!
	flush 	%o0			!
	prefetch [%g1], #n_writes
	prefetch [%g1], #n_writes
	prefetch [%g1], #n_writes
	prefetch [%g1], #n_writes
	prefetch [%g1], #n_writes
	add	%g1, 0x40, %g1		
label5:
	ta	T_BAD_TRAP		!
	ld	[%o6], %i3
	st	%i0, [%o6]	!
	flush 	%o0			!
	prefetch [%g1], #n_writes
	prefetch [%g1], #n_writes
	prefetch [%g1], #n_writes
	prefetch [%g1], #n_writes
	prefetch [%g1], #n_writes
	prefetch [%g1], #n_writes
	add	%g1, 0x40, %g1		

label6:
	ta	T_BAD_TRAP		!
	ld	[%o7], %i3
	st	%i0, [%o7]	
	flush 	%o0			!
	prefetch [%g1], #n_writes
	prefetch [%g1], #n_writes
	prefetch [%g1], #n_writes
	prefetch [%g1], #n_writes
	prefetch [%g1], #n_writes
	prefetch [%g1], #n_writes
	prefetch [%g1], #n_writes
	add	%g1, 0x40, %g1		

label7:
	ta	T_BAD_TRAP		!
	ld	[%o0], %i3
	st	%i0, [%o0]
	flush 	%o0			!

	ld	[%o7], %i3
	ld	[%o1], %i3
	ld	[%o2], %i3
	ld	[%o3], %i3
	ld	[%o4], %i3
	ld	[%o5], %i3
	ld	[%o6], %i3
	ld	[%o7], %i3
	st	%i1, [%o0]		! store bad data to all the labels
	st	%i1, [%o1]	
	st	%i1, [%o2]	
	st	%i1, [%o3]	
	st	%i1, [%o4]	
	st	%i1, [%o5]	
	st	%i1, [%o6]	
	st	%i1, [%o7]	

	dec     %l2      		! and loop again.
        brnz,pt %l2, label0a
        prefetch [%g1], #n_writes

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

user_data_start:
	.skip 2048
user_data_end:
