// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_dma_template1.s
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
***  Test Description : randomly generated diag
***
**********************************************************************/

#ifndef HELPER_BASE_DATA_ADDR0
#define HELPER_BASE_DATA_ADDR0         0xd30000
#endif

#ifndef HELPER_BASE_DATA_ADDR_RA0
#define HELPER_BASE_DATA_ADDR_RA0    0x10d30000
#endif

#define ASI_SWVR_INTR_RECEIVE		0x72
#define ASI_SWVR_UDB_INTR_W		0x73
#define ASI_SWVR_UDB_INTR_R		0x74

#define H_T0_Trap_Instruction_0	
#define My_T0_Trap_Instruction_0	\
	ta	0x90;			\
	done;

#define H_HT0_HTrap_Instruction_0 intr0x190_custom_trap
#define H_HT0_Interrupt_0x60      intr0x60_custom_trap

#include "boot.s"

.text
.global main

main:
        wr      %g0, 0x4, %fprs         /* make sure fef is 1 */

th_fork(th_main, %l0)

th_main_0:
	set	0x0, %o0
	ta	0x30
	ta      T_CHANGE_PRIV
	setx	user_data_start,  %l0, %l1
	setx	user_data_start2, %l0, %l2
	setx	th00_private, %l0,      %l3

!=====================================================
! algorithm 1 - false sharing
!=====================================================

	setx	0xc0,	%i0, %i1
	setx	0x40,	%l0, %l4
	stx	%i1, [%l1 + %l4]

!==============================================
! algorithm 1 and sjm algorithm 1 - checker
!==============================================
	setx	0xc0,	%i0, %i1
	setx	0x40,	%l0, %l4
	ldx	[%l1 + %l4], %i2
	subcc	%i1, %i2, %g0
	bnz	bad_end

!------------------------------------------

!==============================================
!  algorithm 2 - block store
!==============================================
       	setx    0xc1,   %i0, %i1
       	setx    0x100,   %l0, %l4
	add	%l1, %l4, %l4
      	stx     %i1, [%l3]
	inc	%i1
       	stx     %i1, [%l3 + 0x8]
	inc	%i1
       	stx     %i1, [%l3 + 0x10]
	inc	%i1
       	stx     %i1, [%l3 + 0x18]
	inc	%i1
       	stx     %i1, [%l3 + 0x20]
	inc	%i1
       	stx     %i1, [%l3 + 0x28]
	inc	%i1
       	stx     %i1, [%l3 + 0x30]
	inc	%i1
	stx     %i1, [%l3 + 0x38]
	membar	0x40
	ldda	[%l3]0xf0, %f0
	stda	%f0, [%l4]0xf0
!	membar	0x40			! is this needed??
	
!=======================================================
! algorithm 2 - checker (ldda 0xf0 with comparison)
!=======================================================
       	setx    0xc1,   %i0, %i1
       	setx    0x100,   %l0, %l4
	add	%l1, %l4, %l4
      	stx     %i1, [%l3]
	inc	%i1
       	stx     %i1, [%l3 + 0x8]
	inc	%i1
       	stx     %i1, [%l3 + 0x10]
	inc	%i1
       	stx     %i1, [%l3 + 0x18]
	inc	%i1
       	stx     %i1, [%l3 + 0x20]
	inc	%i1
       	stx     %i1, [%l3 + 0x28]
	inc	%i1
       	stx     %i1, [%l3 + 0x30]
	inc	%i1
	stx     %i1, [%l3 + 0x38]
	inc	%i1
	ldda	[%l3]0xf0, %f0

loop00:
	ldx	[%l4 + 0x38], %i2
	brz	%i2, loop00
	nop

	ldda	[%l4]0xf0, %f16
        fcmpd   %fcc0, %f0, %f16
        fbne    %fcc0, bad_end
        fcmpd   %fcc0, %f2, %f18
        fbne    %fcc0, bad_end
        fcmpd   %fcc0, %f4, %f20
        fbne    %fcc0, bad_end
        fcmpd   %fcc0, %f6, %f22
        fbne    %fcc0, bad_end
        fcmpd   %fcc0, %f8, %f24
        fbne    %fcc0, bad_end
        fcmpd   %fcc0, %f10, %f26
        fbne    %fcc0, bad_end
        fcmpd   %fcc0, %f12, %f28
        fbne    %fcc0, bad_end
        fcmpd   %fcc0, %f14, %f30

!=======================================================
! algorithm 3 - binit store
!=======================================================
       	setx    0xc21,   %i0, %i2

       	setx    0x200,   %l0, %l4
	add	%l1, %l4, %l4

      	stxa    %i2, [%l4]0x22

	inc	%i2
	add	%l4, 0x8, %l4
      	stxa    %i2, [%l4]0x22
	inc	%i2
	add	%l4, 0x8, %l4
      	stxa    %i2, [%l4]0x22
	inc	%i2
	add	%l4, 0x8, %l4
      	stxa    %i2, [%l4]0x22
	inc	%i2
	add	%l4, 0x8, %l4
      	stxa    %i2, [%l4]0x22
	inc	%i2
	add	%l4, 0x8, %l4
      	stxa    %i2, [%l4]0x22
	inc	%i2
	add	%l4, 0x8, %l4
      	stxa    %i2, [%l4]0x22
	inc	%i2
	add	%l4, 0x8, %l4
      	stxa    %i2, [%l4]0x22
!	membar	0x40			! is this needed??

!=======================================================
! algorithm 3 - binit store - checker
!=======================================================
       	setx    0xc21,   %i0, %i2
	add	%i2, 0x1, %i3

       	setx    0x200,   %l0, %l4
	add	%l1, %l4, %l4

loop01:
	ldx	[%l4 + 0x38], %i6
	brz	%i6, loop01
	nop

	ldda	[%l4]0x22, %i6
	subcc	%i3, %i7, %g0
	bne	bad_end
	subcc	%i2, %i6, %g0
	bne	bad_end

	add	%i2, 0x2, %i2
	add	%i3, 0x2, %i3
	add	%l4, 0x10, %l4

	ldda	[%l4]0x22, %i6
	subcc	%i3, %i7, %g0
	bne	bad_end
	subcc	%i2, %i6, %g0
	bne	bad_end

	add	%i2, 0x2, %i2
	add	%i3, 0x2, %i3
	add	%l4, 0x10, %l4

	ldda	[%l4]0x22, %i6
	subcc	%i3, %i7, %g0
	bne	bad_end
	subcc	%i2, %i6, %g0
	bne	bad_end
	add	%i2, 0x2, %i2
	add	%i3, 0x2, %i3
	add	%l4, 0x10, %l4

	ldda	[%l4]0x22, %i6
	subcc	%i3, %i7, %g0
	bne	bad_end
	subcc	%i2, %i6, %g0
	bne	bad_end
	nop


!=======================================================
! algorithm 4  - block  store + flag  normal store
!=======================================================
       	setx    0xc1,   %i0, %i1
       	setx    0x300,   %l0, %l4
	add	%l1, %l4, %l4
      	stx     %g0, [%l4 + 0x40]

      	stx     %i1, [%l3]
	inc	%i1
       	stx     %i1, [%l3 + 0x8]
	inc	%i1
       	stx     %i1, [%l3 + 0x10]
	inc	%i1
       	stx     %i1, [%l3 + 0x18]
	inc	%i1
       	stx     %i1, [%l3 + 0x20]
	inc	%i1
       	stx     %i1, [%l3 + 0x28]
	inc	%i1
       	stx     %i1, [%l3 + 0x30]
	inc	%i1
	stx     %i1, [%l3 + 0x38]
	membar	0x40
	ldda	[%l3]0xf0, %f0
	stda	%f0, [%l4]0xf0
      	stx     %i1, [%l4 + 0x40]
!	membar	0x40			! is this needed??
	
!=======================================================
! algorithm 4 - checker
!=======================================================
       	setx    0xc1,   %i0, %i1
       	setx    0x300,   %l0, %l4
	add	%l1, %l4, %l4
      	stx     %i1, [%l3]
	inc	%i1
       	stx     %i1, [%l3 + 0x8]
	inc	%i1
       	stx     %i1, [%l3 + 0x10]
	inc	%i1
       	stx     %i1, [%l3 + 0x18]
	inc	%i1
       	stx     %i1, [%l3 + 0x20]
	inc	%i1
       	stx     %i1, [%l3 + 0x28]
	inc	%i1
       	stx     %i1, [%l3 + 0x30]
	inc	%i1
	stx     %i1, [%l3 + 0x38]
	inc	%i1
	ldda	[%l3]0xf0, %f0

loop04:
	ldx	[%l4 + 0x40], %i2
	brz	%i2, loop04
	nop

	ldda	[%l4]0xf0, %f16
        fcmpd   %fcc0, %f0, %f16
        fbne    %fcc0, bad_end
        fcmpd   %fcc0, %f2, %f18
        fbne    %fcc0, bad_end
        fcmpd   %fcc0, %f4, %f20
        fbne    %fcc0, bad_end
        fcmpd   %fcc0, %f6, %f22
        fbne    %fcc0, bad_end
        fcmpd   %fcc0, %f8, %f24
        fbne    %fcc0, bad_end
        fcmpd   %fcc0, %f10, %f26
        fbne    %fcc0, bad_end
        fcmpd   %fcc0, %f12, %f28
        fbne    %fcc0, bad_end
        fcmpd   %fcc0, %f14, %f30

!=======================================================
! algorithm 5  - block  store + flag block store
!=======================================================
       	setx    0xc1,   %i0, %i1
       	setx    0x400,   %l0, %l4
	add	%l1, %l4, %l4
      	stx     %g0, [%l4 + 0x40]

      	stx     %i1, [%l3]
	inc	%i1
       	stx     %i1, [%l3 + 0x8]
	inc	%i1
       	stx     %i1, [%l3 + 0x10]
	inc	%i1
       	stx     %i1, [%l3 + 0x18]
	inc	%i1
       	stx     %i1, [%l3 + 0x20]
	inc	%i1
       	stx     %i1, [%l3 + 0x28]
	inc	%i1
       	stx     %i1, [%l3 + 0x30]
	inc	%i1
	stx     %i1, [%l3 + 0x38]
	membar	0x40
	ldda	[%l3]0xf0, %f0
	stda	%f0, [%l4]0xf0
	add	%l4, 0x40, %l4
	stda	%f0, [%l4]0xf0
!	membar	0x40			! is this needed??
	
!=======================================================
! algorithm 5 - checker
!=======================================================
       	setx    0xc1,   %i0, %i1
       	setx    0x400,   %l0, %l4
	add	%l1, %l4, %l4
      	stx     %i1, [%l3]
	inc	%i1
       	stx     %i1, [%l3 + 0x8]
	inc	%i1
       	stx     %i1, [%l3 + 0x10]
	inc	%i1
       	stx     %i1, [%l3 + 0x18]
	inc	%i1
       	stx     %i1, [%l3 + 0x20]
	inc	%i1
       	stx     %i1, [%l3 + 0x28]
	inc	%i1
       	stx     %i1, [%l3 + 0x30]
	inc	%i1
	stx     %i1, [%l3 + 0x38]
	inc	%i1
	ldda	[%l3]0xf0, %f0

loop05:
	ldx	[%l4 + 0x40], %i2
	brz	%i2, loop05
	nop

	ldda	[%l4]0xf0, %f16
        fcmpd   %fcc0, %f0, %f16
        fbne    %fcc0, bad_end
        fcmpd   %fcc0, %f2, %f18
        fbne    %fcc0, bad_end
        fcmpd   %fcc0, %f4, %f20
        fbne    %fcc0, bad_end
        fcmpd   %fcc0, %f6, %f22
        fbne    %fcc0, bad_end
        fcmpd   %fcc0, %f8, %f24
        fbne    %fcc0, bad_end
        fcmpd   %fcc0, %f10, %f26
        fbne    %fcc0, bad_end
        fcmpd   %fcc0, %f12, %f28
        fbne    %fcc0, bad_end
        fcmpd   %fcc0, %f14, %f30

!=============================================================
! algorithm 6  - binit  store + flag normal store 
!=============================================================

       	setx    0xc1,   %i0, %i2

       	setx    0x500,   %l0, %l4
	add	%l1, %l4, %l4

      	stxa    %i2, [%l4]0x22

	inc	%i2
	add	%l4, 0x8, %l4
      	stxa    %i2, [%l4]0x22
	inc	%i2
	add	%l4, 0x8, %l4
      	stxa    %i2, [%l4]0x22
	inc	%i2
	add	%l4, 0x8, %l4
      	stxa    %i2, [%l4]0x22
	inc	%i2
	add	%l4, 0x8, %l4
      	stxa    %i2, [%l4]0x22
	inc	%i2
	add	%l4, 0x8, %l4
      	stxa    %i2, [%l4]0x22
	inc	%i2
	add	%l4, 0x8, %l4
      	stxa    %i2, [%l4]0x22
	inc	%i2
	add	%l4, 0x8, %l4
      	stxa    %i2, [%l4]0x22
	add	%l4, 0x8, %l4
      	stx     %i2, [%l4]
!	membar	0x40			! is this needed??

!=============================================================
! algorithm 6 - binit store - checker
!=============================================================
       	setx    0xc1,  %i0, %i2
	add	%i2, 0x1, %i3

       	setx    0x500,   %l0, %l4
	add	%l1, %l4, %l4

loop06:
	ldx	[%l4 + 0x40], %i6
	brz	%i6, loop06
	nop

	ldda	[%l4]0x22, %i6
	subcc	%i3, %i7, %g0
	bne	bad_end
	subcc	%i2, %i6, %g0
	bne	bad_end

	add	%i2, 0x2, %i2
	add	%i3, 0x2, %i3
	add	%l4, 0x10, %l4

	ldda	[%l4]0x22, %i6
	subcc	%i3, %i7, %g0
	bne	bad_end
	subcc	%i2, %i6, %g0
	bne	bad_end

	add	%i2, 0x2, %i2
	add	%i3, 0x2, %i3
	add	%l4, 0x10, %l4

	ldda	[%l4]0x22, %i6
	subcc	%i3, %i7, %g0
	bne	bad_end
	subcc	%i2, %i6, %g0
	bne	bad_end
	add	%i2, 0x2, %i2
	add	%i3, 0x2, %i3
	add	%l4, 0x10, %l4

	ldda	[%l4]0x22, %i6
	subcc	%i3, %i7, %g0
	bne	bad_end
	subcc	%i2, %i6, %g0
	bne	bad_end
	nop

!=============================================================
! algorithm 7 - normal store + flag normal store 
!=============================================================

       	setx    0xc1,   %i0, %i2

       	setx    0x600,   %l0, %l4
	add	%l1, %l4, %l4

      	stx    %i2, [%l4]
      	stx    %i2, [%l4 + 0x8]

!=============================================================
! algorithm 7 - checker
!=============================================================
       	setx    0xc1,  %i0, %i2

       	setx    0x600,   %l0, %l4
	add	%l1, %l4, %l4

loop07:
	ldx	[%l4 + 0x8], %i6
	brz	%i6, loop07
	nop

	ldx	[%l4], %i6
	subcc	%i2, %i6, %g0
	bne	bad_end


!=============================================================
! algorithm 8   - normal store + flag normal store PIO
!=============================================================

       	setx    0xc1,   %i0, %i2

       	setx    0x700,   %l0, %l4
	add	%l1, %l4, %l4

      	stx    	%i2, [%l4]
	set	0x1, %o0
	ta	0x30

!=============================================================
! algorithm 9   - binit  store + flag normal store PIO
!=============================================================

       	setx    0xc1,   %i0, %i2

       	setx    0x800,   %l0, %l4
	add	%l1, %l4, %l4

      	stxa    %i2, [%l4]0x22

	inc	%i2
	add	%l4, 0x8, %l4
      	stxa    %i2, [%l4]0x22
	inc	%i2
	add	%l4, 0x8, %l4
      	stxa    %i2, [%l4]0x22
	inc	%i2
	add	%l4, 0x8, %l4
      	stxa    %i2, [%l4]0x22
	inc	%i2
	add	%l4, 0x8, %l4
      	stxa    %i2, [%l4]0x22
	inc	%i2
	add	%l4, 0x8, %l4
      	stxa    %i2, [%l4]0x22
	inc	%i2
	add	%l4, 0x8, %l4
      	stxa    %i2, [%l4]0x22
	inc	%i2
	add	%l4, 0x8, %l4
      	stxa    %i2, [%l4]0x22
!	membar	0x40			! is this needed??

	set	0x1,	%o0
	ta	0x30


!=============================================================
! algorithm 10  - block  store + flag normal store PIO
!=============================================================
       	setx    0xc1,   %i0, %i1
       	setx    0x900,   %l0, %l4
	add	%l1, %l4, %l4

      	stx     %i1, [%l3]
	inc	%i1
       	stx     %i1, [%l3 + 0x8]
	inc	%i1
       	stx     %i1, [%l3 + 0x10]
	inc	%i1
       	stx     %i1, [%l3 + 0x18]
	inc	%i1
       	stx     %i1, [%l3 + 0x20]
	inc	%i1
       	stx     %i1, [%l3 + 0x28]
	inc	%i1
       	stx     %i1, [%l3 + 0x30]
	inc	%i1
	stx     %i1, [%l3 + 0x38]
	membar	0x40
	ldda	[%l3]0xf0, %f0
	stda	%f0, [%l4]0xf0
	membar	0x40
	
	set	0x1,	%o0
	ta	0x30

!==================================================================
! algorithm 11 - checker
!==================================================================

       	setx    0x1,  %i0, %i2
	add	%i2, 0x1, %i3

       	setx    0xa00,   %l0, %l4
	add	%l1, %l4, %l4

loop10:
	ldx	[%l4 + 0x38], %i6
	brz	%i6, loop10
	nop

	ldda	[%l4]0x22, %i6
	subcc	%i3, %i7, %g0
	bne	bad_end
	subcc	%i2, %i6, %g0
	bne	bad_end

	add	%i2, 0x2, %i2
	add	%i3, 0x2, %i3
	add	%l4, 0x10, %l4

	ldda	[%l4]0x22, %i6
	subcc	%i3, %i7, %g0
	bne	bad_end
	subcc	%i2, %i6, %g0
	bne	bad_end

	add	%i2, 0x2, %i2
	add	%i3, 0x2, %i3
	add	%l4, 0x10, %l4

	ldda	[%l4]0x22, %i6
	subcc	%i3, %i7, %g0
	bne	bad_end
	subcc	%i2, %i6, %g0
	bne	bad_end
	add	%i2, 0x2, %i2
	add	%i3, 0x2, %i3
	add	%l4, 0x10, %l4

	ldda	[%l4]0x22, %i6
	subcc	%i3, %i7, %g0
	bne	bad_end
	subcc	%i2, %i6, %g0
	bne	bad_end
	nop

!==================================================================
! algorithm 12 - checker
!==================================================================
       	setx    0x1,  %i0, %i2
	add	%i2, 0x1, %i3

       	setx    0xb00,   %l0, %l4
	add	%l1, %l4, %l4

loop11:
	ldx	[%l4 + 0x40], %i6
	brz	%i6, loop11
	nop

	ldda	[%l4]0x22, %i6
	subcc	%i3, %i7, %g0
	bne	bad_end
	subcc	%i2, %i6, %g0
	bne	bad_end

	add	%i2, 0x2, %i2
	add	%i3, 0x2, %i3
	add	%l4, 0x10, %l4

	ldda	[%l4]0x22, %i6
	subcc	%i3, %i7, %g0
	bne	bad_end
	subcc	%i2, %i6, %g0
	bne	bad_end

	add	%i2, 0x2, %i2
	add	%i3, 0x2, %i3
	add	%l4, 0x10, %l4

	ldda	[%l4]0x22, %i6
	subcc	%i3, %i7, %g0
	bne	bad_end
	subcc	%i2, %i6, %g0
	bne	bad_end
	add	%i2, 0x2, %i2
	add	%i3, 0x2, %i3
	add	%l4, 0x10, %l4

	ldda	[%l4]0x22, %i6
	subcc	%i3, %i7, %g0
	bne	bad_end
	subcc	%i2, %i6, %g0
	bne	bad_end
	nop

!==================================================================
! algorithm 13 - checker
!==================================================================
       	setx    0x1,  %i0, %i2
	add	%i2, 0x1, %i3

       	setx    0xc00,   %l0, %l4
	add	%l1, %l4, %l4

loop12:
	ldx	[%l4 + 0x40], %i6
	brz	%i6, loop12
	nop

	ldda	[%l4]0x22, %i6
	subcc	%i3, %i7, %g0
	bne	bad_end
	subcc	%i2, %i6, %g0
	bne	bad_end

	add	%i2, 0x2, %i2
	add	%i3, 0x2, %i3
	add	%l4, 0x10, %l4

	ldda	[%l4]0x22, %i6
	subcc	%i3, %i7, %g0
	bne	bad_end
	subcc	%i2, %i6, %g0
	bne	bad_end

	add	%i2, 0x2, %i2
	add	%i3, 0x2, %i3
	add	%l4, 0x10, %l4

	ldda	[%l4]0x22, %i6
	subcc	%i3, %i7, %g0
	bne	bad_end
	subcc	%i2, %i6, %g0
	bne	bad_end
	add	%i2, 0x2, %i2
	add	%i3, 0x2, %i3
	add	%l4, 0x10, %l4

	ldda	[%l4]0x22, %i6
	subcc	%i3, %i7, %g0
	bne	bad_end
	subcc	%i2, %i6, %g0
	bne	bad_end
	nop

!==================================================================
	ba	normal_end
	nop
!==================================================================
th_main_1:
	setx	user_data_start, %l0, %l1
	ba	normal_end
	nop

!==================================================================
th_main_2:
	setx	user_data_start, %l0, %l1
	ba	normal_end
	nop

!==================================================================
th_main_3:
	ba	normal_end
	nop

!==================================================================
th_main_4:
	ba	normal_end
	nop

!==================================================================
th_main_5:
	ba	normal_end
	nop

!==================================================================
th_main_6:
	ba	normal_end
	nop

!==================================================================
th_main_7:
	ba	normal_end
	nop

!==================================================================
th_main_8:
	ba	normal_end
	nop

!==================================================================
th_main_9:
	ba	normal_end
	nop

!==================================================================
th_main_10:
	ba	normal_end
	nop

!==================================================================
th_main_11:
	ba	normal_end
	nop

!==================================================================
th_main_12:
	ba	normal_end
	nop

!==================================================================
th_main_13:
	ba	normal_end
	nop

!==================================================================
th_main_14:
	ba	normal_end
	nop

!==================================================================
th_main_15:
	ba	normal_end
	nop

!==================================================================
th_main_16:
	ba	normal_end
	nop

!==================================================================
th_main_17:
	ba	normal_end
	nop

!==================================================================
th_main_18:
	ba	normal_end
	nop

!==================================================================
th_main_19:
	ba	normal_end
	nop

!==================================================================
th_main_20:
	ba	normal_end
	nop

!==================================================================
th_main_21:
	ba	normal_end
	nop

!==================================================================
th_main_22:
	ba	normal_end
	nop

!==================================================================
th_main_23:
	ba	normal_end
	nop

!==================================================================
th_main_24:
	ba	normal_end
	nop

!==================================================================
th_main_25:
	ba	normal_end
	nop

!==================================================================
th_main_26:
	ba	normal_end
	nop

!==================================================================
th_main_27:
	ba	normal_end
	nop

!==================================================================
th_main_28:
	ba	normal_end
	nop

!==================================================================
th_main_29:
	ba	normal_end
	nop

!==================================================================
th_main_30:
	ba	normal_end
	nop

!==================================================================
th_main_31:
	ba	normal_end
	nop

!==================================================================
normal_end:
	ta	T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

user_text_end:

/***********************************************************************
   Test case data start
 ***********************************************************************/
.data
.align 0x40
user_data_start:
	.skip 70000
.align 0x40
th00_private:
	.skip	0x100
.align 0x40
th01_private:
	.skip	0x100
.align 0x40
th02_private:
	.skip	0x100
.align 0x40
th03_private:
	.skip	0x100
.align 0x40
th04_private:
	.skip	0x100
.align 0x40
th05_private:
	.skip	0x100
.align 0x40
th06_private:
	.skip	0x100
.align 0x40
th07_private:
	.skip	0x100
.align 0x40
th08_private:
	.skip	0x100
.align 0x40
th09_private:
	.skip	0x100
.align 0x40
th10_private:
	.skip	0x100
.align 0x40
th11_private:
	.skip	0x100
.align 0x40
th12_private:
	.skip	0x100
.align 0x40
th13_private:
	.skip	0x100
.align 0x40
th14_private:
	.skip	0x100
.align 0x40
th15_private:
	.skip	0x100
.align 0x40
th16_private:
	.skip	0x100
.align 0x40
th17_private:
	.skip	0x100
.align 0x40
th18_private:
	.skip	0x100
.align 0x40
th19_private:
	.skip	0x100
.align 0x40
th20_private:
	.skip	0x100
.align 0x40
th21_private:
	.skip	0x100
.align 0x40
th22_private:
	.skip	0x100
.align 0x40
th23_private:
	.skip	0x100
.align 0x40
th24_private:
	.skip	0x100
.align 0x40
th25_private:
	.skip	0x100
.align 0x40
th26_private:
.align 0x40
	.skip	0x100
th27_private:
.align 0x40
	.skip	0x100
.align 0x40
th28_private:
	.skip	0x100
.align 0x40
th29_private:
	.skip	0x100
.align 0x40
th30_private:
	.skip	0x100
.align 0x40
th31_private:
	.skip	0x100

user_data_end:

SECTION .HELPER0 \
        DATA_VA=HELPER_BASE_DATA_ADDR0

attr_data {
        NAME=.HELPER0,
        VA=HELPER_BASE_DATA_ADDR0,
        RA=HELPER_BASE_DATA_ADDR_RA0,
        PA=ra2pa(HELPER_BASE_DATA_ADDR_RA0, 0),
        part_0_d_ctx_nonzero_ps0_tsb,   
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1,
        TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
}       

.global user_data_start2
user_data_start2:
        .skip 0x4000

/*----------------------------------------------------------------*/

SECTION .MY_HYP_SEC TEXT_VA = 0x1100150000, DATA_VA = 0x1100160000
attr_text {
        Name=.MY_HYP_SEC,
        hypervisor
	}

.global intr0x60_custom_trap
intr0x60_custom_trap:
	ldxa	[%g0] ASI_SWVR_INTR_RECEIVE, %g2;
	ldxa	[%g0] ASI_SWVR_UDB_INTR_R, %g1;	
	retry;

.global intr0x190_custom_trap
intr0x190_custom_trap:

brnz	%o0, only_pio
nop

! programming the JBI - not quite rrugho
!=====================
!setx 0x0000000006040012, %g1, %g2
!setx 0x8503000010, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000100, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000000, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000400, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000108, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000101, %g1, %g2
!setx 0x9800000008, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000408, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000110, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000202, %g1, %g2
!setx 0x9800000010, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000410, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000118, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000303, %g1, %g2
!setx 0x9800000018, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000418, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000120, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000404, %g1, %g2
!setx 0x9800000020, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000420, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000128, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000505, %g1, %g2
!setx 0x9800000028, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000428, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000130, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000606, %g1, %g2
!setx 0x9800000030, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000430, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000138, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000707, %g1, %g2
!setx 0x9800000038, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000438, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000140, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000808, %g1, %g2
!setx 0x9800000040, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000440, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000148, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000909, %g1, %g2
!setx 0x9800000048, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000448, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000150, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000a0a, %g1, %g2
!setx 0x9800000050, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000450, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000158, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000b0b, %g1, %g2
!setx 0x9800000058, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000458, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000160, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000c0c, %g1, %g2
!setx 0x9800000060, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000460, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000168, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000d0d, %g1, %g2
!setx 0x9800000068, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000468, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000170, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000e0e, %g1, %g2
!setx 0x9800000070, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000470, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000178, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000f0f, %g1, %g2
!setx 0x9800000078, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000478, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x000000000000007f, %g1, %g2
!setx 0x8503000008, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000001010, %g1, %g2
!setx 0x9800000080, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000480, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000001111, %g1, %g2
!setx 0x9800000088, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000488, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9300000c00, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9300000e20, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9300000e28, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9300000e38, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000008, %g1, %g2
!setx 0x8503000018, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000828, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x8503000028, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000001, %g1, %g2
!setx 0x8503000020, %g1, %g3
!stx %g2, [%g3]
!!=====================

/***********************************************************************
  Disable L2 Cache Visibility Port
 ***********************************************************************/

setx 0x0000000000000000, %g1, %g2
setx 0x9800001800, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001820, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001828, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001830, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001838, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001840, %g1, %g3
stx %g2, [%g3]
!=====================

/***********************************************************************
  Disable IOBridge Visibility Ports
 ***********************************************************************/

setx 0x0000000000000000, %g1, %g2
setx 0x9800001000, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002000, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002008, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002100, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002140, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002160, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002180, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x98000021a0, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002148, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002168, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002188, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x98000021a8, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002150, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002170, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002190, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x98000021b0, %g1, %g3
stx %g2, [%g3]
!=====================

/***********************************************************************
 Configure jbi controller
 ***********************************************************************/

setx 0x03fb303e00000001, %g1, %g2
setx 0x8000000000, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x000000007033fe0f, %g1, %g2
setx 0x8000000008, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000003fc0000000, %g1, %g2
setx 0x80000100a0, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x00000000fe0003ff, %g1, %g2
setx 0x8000004100, %g1, %g3
stx %g2, [%g3]
!=====================

/***********************************************************************
 IOSYNC cycles to start sjm
 ***********************************************************************/

setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xcf00beef00, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xef00beef00, %g1, %g3
stx %g2, [%g3]
!=====================
done;

only_pio:
	setx 0xdeadbeefdeadbeef, %g1, %g2
	setx 0xcf00beef00, %g1, %g3
	stx %g2, [%g3]
	done;

attr_data {
        Name=.MY_HYP_SEC,
        hypervisor
	}

.global my_hyp_data
.align 0x40
my_hyp_data:
	.skip 0x200

.end


