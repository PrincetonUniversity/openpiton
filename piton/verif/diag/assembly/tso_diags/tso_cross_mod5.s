// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_cross_mod5.s
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
***  Test Description : One thread modifies code, the consumer thread
***  DOES NOT branch to the modified code but normally flows into it.
***  two nops between the wait for flag loop and the modified code
***  should be enough.
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
	clr	%l0

	th_fork(th_main,%l0)


! this thread modfifies the code
!===============================
th_main_0:

	set	0x40, %i7		! loop counting

	setx 	ready, 	  %l0, %l1	! pointers...
	setx 	noop, 	  %l0, %l2
	ld	[%l2], %o7		! %o7 contains the nop command

deliver_loop:

	setx 	modified1, %l0, %l3	!
deliver_loop1:
        ld      [%l1], %o0    		! read ready.
	tst	%o0			! should be 0.
	bne	deliver_loop1
	nop

	st	%o7, [%l3]		! modify the code.
	st	%o7, [%l3 + 4]		! and then flush.
	flush	%l3			! the register value does not matter

	setx 	modified2, %l0, %l3	!
deliver_loop2:
        ld      [%l1 + 0x4], %o0	! read ready.
	tst	%o0			! should be 0.
	bne	deliver_loop2
	nop

	st	%o7, [%l3]		! modify the code.
	st	%o7, [%l3 + 4]		! and then flush.
	flush	%l3			! the register value does not matter

	setx 	modified3, %l0, %l3	!
deliver_loop3:
        ld      [%l1 + 0x8], %o0	! read ready.
	tst	%o0			! should be 0.
	bne	deliver_loop3
	nop

	st	%o7, [%l3]		! modify the code.
	st	%o7, [%l3 + 4]		! and then flush.
	flush	%l3			! the register value does not matter

	deccc	%i7			! count
	bne	goon
	nop
	ba	final_stuff		! go to end if finished
	nop

goon:
	set	1, %i0			! set ready
	st	%i0, [%l1]		! 
	st	%i0, [%l1+4]		! 
	st	%i0, [%l1+8]		! 
	ba	deliver_loop		! repeat
	nop
	
final_stuff:
	set	0x1, %i0		! 55 means we are done.
	st	%i0, [%l1]		! 
	st	%i0, [%l1+4]		! 
	set	0x55, %i0		! 55 means we are done.
	st	%i0, [%l1+8]		! 
	ba	good_end
	nop

! these are the receivers
!------------------------
th_main_1:
th_main_2:
th_main_4:

	setx 	ready, %l0, %l1		! pointers...
	setx 	bad_end, %l0, %l2
	ld	[%l2], %o7		! o7 contains a ta 0x101

wait_loop:				! wait for ready flag
wait_loop1:				! wait for ready flag
        ld      [%l1], %o0    
        subcc   %o0, 0x1, %i1        	! code for available data
        bne	wait_loop1
	nop
	nop
modified1:
	ta	T_BAD_TRAP		! this data is overwritten
	ta	T_BAD_TRAP		! with nop-s, so diag goes on.

wait_loop2:				! wait for ready flag
        ld      [%l1+0x4], %o0    
        subcc   %o0, 0x1, %i1      	! check for end of test flag.
        bne	wait_loop2
	nop
	nop
modified2:
	ta	T_BAD_TRAP		! this data is overwritten
	ta	T_BAD_TRAP		! with nop-s, so diag goes on.

wait_loop3:				! wait for ready flag
        ld      [%l1+0x8], %o0    
        subcc   %o0, 0x55, %i1      	! check for end of test flag.
        be      good_end   		! end the test
        nop
        subcc   %o0, 0x1, %i1        	! code for available data
        bne	wait_loop3
	nop
	nop
modified3:
	ta	T_BAD_TRAP		! this data is overwritten
	ta	T_BAD_TRAP		! with nop-s, so diag goes on.

	setx 	modified1, %l0, %l3
	st	%o7, [%l3]		! now overwrite again to  ta T_BAD_TRAP
	st	%o7, [%l3 + 4]
	setx 	modified2, %l0, %l3
	st	%o7, [%l3]		! now overwrite again to  ta T_BAD_TRAP
	st	%o7, [%l3 + 4]
	setx 	modified3, %l0, %l3
	st	%o7, [%l3]		! now overwrite again to  ta T_BAD_TRAP
	st	%o7, [%l3 + 4]

	st	%g0, [%l1]		! reset the flags
	st	%g0, [%l1 + 4]
	st	%g0, [%l1 + 8]

        ba      wait_loop		! do it again
        nop
 
good_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP
noop:
	nop

!------------------------------------------------------------------------------

.data
.global ready
ready:
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        
.end

