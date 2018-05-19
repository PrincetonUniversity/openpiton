// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_cross_mod4.s
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
***  Program File: tso_cross_mod4.s
***
***  Test Description : weird self-modifying code without synchronisation.
***  Just write into the instruction stream the same instruction that
***  is there in the first place.
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
	clr	%l0

	th_fork(th_main,%l0)


! this thread just times the operation
!=====================================
th_main_0:

	set	0x40, %i7		! loop counting
	setx	ready, %i0, %o0		! the address


loop:
	ld	[%o0], %i0		! 
	inc 	%i0
	st	%i0, [%o0 + 4]		!
	stx	%i0, [%o0]		! 
	casx	[%o0], %g0, %i0

	deccc	%i7			! count
	bne	loop
	prefetch [%o0], #n_reads

	ba	good_end
	nop

! these are the modified/modifier threads
! they just write into the instruction stream
! the same value as what the instruction is supposed to be.
! we are looking for hangs here.
!----------------------------------------
th_main_1:
th_main_2:
th_main_3:
th_main_4:
th_main_5:
th_main_6:
th_main_7:

	setx 	loop, %l0, %o0		! pointers...
	ld	[%o0 + 0], %i0
	ld	[%o0 + 4], %i1
	ld	[%o0 + 8], %i2
	ld	[%o0 + 12], %i3
	ld	[%o0 + 16], %i4
	ld	[%o0 + 20], %i5
	ld	[%o0 + 24], %i6
	ld	[%o0 + 28], %i7

mloop:				
	st	%i7, [%o0 + 28]
	st	%i6, [%o0 + 24]
	st	%i5, [%o0 + 20]
	st	%i4, [%o0 + 16]
	st	%i3, [%o0 + 12]
	st	%i2, [%o0 + 8]
	st	%i1, [%o0 + 4]
	st	%i0, [%o0 + 0]
	ld	[%o0 + 0], %i0		! I$/D$ exclusivity testing
	ld	[%o0 + 24], %i6
	
        ba      mloop
        nop

 
good_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP
noop:
	nop

.data
.global ready
ready:
        .word   0x0
	.skip   0x100
        
.end
