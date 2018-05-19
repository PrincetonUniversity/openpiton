// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_cross_mod6_bug6372.s
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
***  Program File: tso_cross_mod1.s
***
***  Test Description : Testing I$ D$ mutual exclusivity.
***  reminds me of old FORTRAN compilers, hence the name.
***
**********************************************************************/

#define MAIN_BASE_DATA_ADDR     0x160000
#define MAIN_BASE_TEXT_ADDR  	0x150000
#define MAIN_BASE_DATA_ADDR_RA	0x100160000
#define MAIN_BASE_TEXT_ADDR_RA	0x100150000

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
	th_fork(th_main,%l0)


! this thread modfifies the code
!===============================
th_main_0:
	setx    user_data_start, %l0, %o0
	setx    0x10, %l0, %i0

loop0:	
	ld	[%o0], %l0		! 
	ld	[%o0+ 0x10], %l0	! 
	ld	[%o0+ 0x20], %l0	! 
	ld	[%o0+ 0x30], %l0	! 
	add	%o0, 0x40, %o0		!
	dec	%i0
	brnz	%i0, loop0		!
	nop				!

	ba	good_end

th_main_1:
	setx    user_data_start, %l0, %o0
	ba	loop1
	nop
	.align 0x20

loop1:
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0

	ba	loop1
	nop

	ba	good_end
	nop

th_main_2:
	setx    user_data_start, %l0, %o0

loop2:
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0
	ld	[%o0], %l0

	ba	loop2
	nop



	ba	good_end
th_main_3:
	setx    loop1, %l0, %o0
	or	%o0, 0x18, %o0
	add	%o0, 0x20, %o1
loop3:
	ld	[%o0], %l0
	ld	[%o1], %l0
	ld	[%o0], %l0
	ld	[%o1], %l0
	ld	[%o0], %l0
	ld	[%o1], %l0
	ld	[%o0], %l0
	ld	[%o1], %l0
	ld	[%o0], %l0
	ld	[%o1], %l0
	ld	[%o0], %l0
	ld	[%o1], %l0
	ld	[%o0], %l0
	ld	[%o1], %l0
	ld	[%o0], %l0
	ld	[%o1], %l0
	ld	[%o0], %l0
	ld	[%o1], %l0
	ba	loop3
	nop

	ba	good_end
	nop
 
good_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP
noop:
	nop

!------------------------------------------------------------------------------

.data
.global user_data_start
user_data_start:
	.skip 0x1000
        
.end

