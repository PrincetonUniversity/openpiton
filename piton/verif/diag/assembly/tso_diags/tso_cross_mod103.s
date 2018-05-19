// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_cross_mod103.s
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
***  Program File: tso_cross_mod103.s
***
***  Test Description : One thread modifies code, other thread(s) use it.
***                     Test the I$/D$ exclusivity also.
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
	clr	%l0

	th_fork(th_main,%l0)


! this thread modfifies the code
!===============================
th_main_0:

!--------------------------------------------------------------------
	setx 	exit_code1,%l0, %l1	! pointers...
	setx 	wait_loop1, %l0, %l3	!
	ld	[%l3], %o6		! get the instruction in the D$
	ld	[%l1], %o6		! 
	ld	[%l1+4], %o7		! 
	st	%o6, [%l3 + 8]		! modify the code.
	st	%o7, [%l3 + 4]		! the new code is a jump instruction
!--------------------------------------------------------------------
	setx 	exit_code2,%l0, %l1	! pointers...
	setx 	wait_loop2, %l0, %l3	!
	ld	[%l3], %o6		! 
	ld	[%l1], %o6		! 
	ld	[%l1+4], %o7		! 
	st	%o6, [%l3 + 8]		! modify the code.
	st	%o7, [%l3 + 4]		! store the jump
!--------------------------------------------------------------------
	setx 	exit_code3,%l0, %l1	! pointers...
	setx 	wait_loop3, %l0, %l3	!
	ld	[%l3], %o6		! 
	ld	[%l1], %o6		! 
	ld	[%l1+4], %o7		! 
	st	%o6, [%l3 + 8]		! modify the code.
	st	%o7, [%l3 + 4]		! store the jump
!--------------------------------------------------------------------
	setx 	exit_code4,%l0, %l1	! pointers...
	setx 	wait_loop4, %l0, %l3	!
	ld	[%l3], %o6		! 
	ld	[%l1], %o6		! 
	ld	[%l1+4], %o7		! 
	st	%o6, [%l3 + 8]		! modify the code.
	st	%o7, [%l3 + 4]		! store the jump
!--------------------------------------------------------------------
	setx 	exit_code5,%l0, %l1	! pointers...
	setx 	wait_loop5, %l0, %l3	!
	ld	[%l3], %o6		! 
	ld	[%l1], %o6		! 
	ld	[%l1+4], %o7		! 
	st	%o6, [%l3 + 8]		! modify the code.
	st	%o7, [%l3 + 4]		! store the jump
!--------------------------------------------------------------------
	setx 	exit_code6,%l0, %l1	! pointers...
	setx 	wait_loop6, %l0, %l3	!
	ld	[%l3], %o6		! 
	ld	[%l1], %o6		! 
	ld	[%l1+4], %o7		! 
	st	%o6, [%l3 + 8]		! modify the code.
	st	%o7, [%l3 + 4]		! store the jump
!--------------------------------------------------------------------
	setx 	exit_code7,%l0, %l1	! pointers...
	setx 	wait_loop7, %l0, %l3	!
	ld	[%l3], %o6		! 
	ld	[%l1], %o6		! 
	ld	[%l1+4], %o7		! 
	st	%o6, [%l3 + 8]		! modify the code.
	st	%o7, [%l3 + 4]		! store the jump
!--------------------------------------------------------------------
	setx 	exit_code8,%l0, %l1	! pointers...
	setx 	wait_loop8, %l0, %l3	!
	ld	[%l3], %o6		! 
	ld	[%l1], %o6		! 
	ld	[%l1+4], %o7		! 
	st	%o6, [%l3 + 8]		! modify the code.
	st	%o7, [%l3 + 4]		! store the jump
!--------------------------------------------------------------------
	setx 	exit_code9,%l0, %l1	! pointers...
	setx 	wait_loop9, %l0, %l3	!
	ld	[%l3], %o6		! 
	ld	[%l1], %o6		! 
	ld	[%l1+4], %o7		! 
	st	%o6, [%l3 + 8]		! modify the code.
	st	%o7, [%l3 + 4]		! store the jump
!--------------------------------------------------------------------
	setx 	exit_codea,%l0, %l1	! pointers...
	setx 	wait_loopa, %l0, %l3	!
	ld	[%l3], %o6		! 
	ld	[%l1], %o6		! 
	ld	[%l1+4], %o7		! 
	st	%o6, [%l3 + 8]		! modify the code.
	st	%o7, [%l3 + 4]		! store the jump
!--------------------------------------------------------------------
	setx 	exit_codeb,%l0, %l1	! pointers...
	setx 	wait_loopb, %l0, %l3	!
	ld	[%l3], %o6		! 
	ld	[%l1], %o6		! 
	ld	[%l1+4], %o7		! 
	st	%o6, [%l3 + 8]		! modify the code.
	st	%o7, [%l3 + 4]		! store the jump
	ba	good_end
	nop
!--------------------------------------------------------------------

! these are the receivers
!------------------------
.align 0x4
th_main_1:
th_main_2:
th_main_4:

!--------------------------------------------------------------
	set	goon1, %i0
	set	0x0,   %i1
wait_loop1:				! wait 
	nop				! this will be replaced
	nop				! this also (with a jump)
	nop
        ba      wait_loop1
        nop
goon1:
	subcc	%i1, 1, %i1
	bne	bad_end
	nop
	set	0x0,   %i1
	set	goon2, %i0
	ba	wait_loop2
	nop
!--------------------------------------------------------------
wait_loop2:				! wait 
	nop				! this will be replaced
	nop				! this (with a jump)
	nop
        ba      wait_loop2
        nop
goon2:
	subcc	%i1, 1, %i1
	bne	bad_end
	nop
	set	0x0,   %i1
	set	goon3, %i0
	ba	wait_loop3
	nop
!--------------------------------------------------------------
wait_loop3:				! wait 
	nop				! this will be replaced
	nop				! this too
	nop
        ba      wait_loop3
        nop
goon3:
	subcc	%i1, 1, %i1
	bne	bad_end
	nop
	set	0x0,   %i1
	set	goon4, %i0
	ba	wait_loop4
	nop
!--------------------------------------------------------------
.align 0x4
wait_loop4:				! wait 
	nop				! this will be replaced
	nop				! this too
	nop
        ba      wait_loop4
        nop
goon4:
	subcc	%i1, 1, %i1
	bne	bad_end
	nop
	set	0x0,   %i1
	set	goon5, %i0
	ba	wait_loop5
	nop
!--------------------------------------------------------------
.align 0x4
wait_loop5:				! wait 
	nop				! this will be replaced
	nop				! this too
	nop
        ba      wait_loop5
        nop
goon5:
	subcc	%i1, 1, %i1
	bne	bad_end
	nop
	set	0x0,   %i1
	set	goon6, %i0
	ba	wait_loop6
	nop
!--------------------------------------------------------------
.align 0x4
wait_loop6:				! wait 
	nop				! this will be replaced
	nop				! this too
	nop
        ba      wait_loop6
        nop
goon6:
	subcc	%i1, 1, %i1
	bne	bad_end
	nop
	set	0x0,   %i1
	set	goon7, %i0
	ba	wait_loop7
	nop
!--------------------------------------------------------------
.align 0x4
wait_loop7:				! wait 
	nop				! this will be replaced
	nop				! this too
	nop
        ba      wait_loop7
        nop
goon7:
	subcc	%i1, 1, %i1
	bne	bad_end
	nop
	set	goon8, %i0
	ba	wait_loop8
	nop
!--------------------------------------------------------------
.align 0x4
wait_loop8:				! wait 
	nop				! this will be replaced
	nop				! this too
	nop
        ba      wait_loop8
        nop
goon8:
	subcc	%i1, 1, %i1
	bne	bad_end
	nop
	set	0x0,   %i1
	set	goon9, %i0
	ba	wait_loop9
	nop
!--------------------------------------------------------------
.align 0x4
wait_loop9:				! wait 
	nop				! this will be replaced
	nop				! this too
	nop
        ba      wait_loop9
        nop
goon9:
	subcc	%i1, 1, %i1
	bne	bad_end
	nop
	set	0x0,   %i1
	set	goona, %i0
	ba	wait_loopa
	nop
!--------------------------------------------------------------
.align 0x4
wait_loopa:				! wait 
	nop				! this too
	nop				! this too
	nop
        ba      wait_loopa
        nop
goona:
	subcc	%i1, 1, %i1
	bne	bad_end
	nop
	set	0x0,   %i1
	set	goonb, %i0
	ba	wait_loopb
	nop
!--------------------------------------------------------------
wait_loopb:				! wait 
	nop				! this too
	nop				! this too
	nop
        ba      wait_loopb
        nop
goonb:
	subcc	%i1, 1, %i1
	bne	bad_end
	nop
!--------------------------------------------------------------

good_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

!--------------------------------------------------------------
.align 0x4
exit_code1:
	set	0x1,	%i1
	jmpl    %i0,%o7
	set	0x0,	%i1
!--------------------------------------------------------------
.align 0x4
exit_code2:
	set	0x1,	%i1
	jmpl    %i0,%o7
	set	0x0,	%i1
!--------------------------------------------------------------
.align 0x4
exit_code3:
	set	0x1,	%i1
	jmpl    %i0,%o7
	set	0x0,	%i1
!--------------------------------------------------------------
.align 0x4
exit_code4:
	set	0x1,	%i1
	jmpl    %i0,%o7
	set	0x0,	%i1
!--------------------------------------------------------------
.align 0x4
exit_code5:
	set	0x1,	%i1
	jmpl    %i0,%o7
	set	0x0,	%i1
!--------------------------------------------------------------
.align 0x4
exit_code6:
	set	0x1,	%i1
	jmpl    %i0,%o7
	set	0x0,	%i1
!--------------------------------------------------------------
.align 0x4
exit_code7:
	set	0x1,	%i1
	jmpl    %i0,%o7
	set	0x0,	%i1
!--------------------------------------------------------------
.align 0x4
exit_code8:
	set	0x1,	%i1
	jmpl    %i0,%o7
	set	0x0,	%i1
!--------------------------------------------------------------
.align 0x4
exit_code9:
	set	0x1,	%i1
	jmpl    %i0,%o7
	set	0x0,	%i1
!--------------------------------------------------------------
.align 0x4
exit_codea:
	set	0x1,	%i1
	jmpl    %i0,%o7
	set	0x0,	%i1
!--------------------------------------------------------------
.align 0x4
exit_codeb:
	set	0x1,	%i1
	jmpl    %i0,%o7
	set	0x0,	%i1
!--------------------------------------------------------------

.data
.global ready
ready:
        .word   0x0
        
.end
