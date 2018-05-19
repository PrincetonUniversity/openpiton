// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mt_Imiss_sameset.s
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
/*************************************************************
  File:		mt_Imiss_sameset.s

  Description:
  -----------
  First, 4 threads each issue imisses, each to cache lines in
  its own iset. Second, 4 threads issue imisses, all to cache lines
  in 1 iset.

  $Change: 17073 $
 *************************************************************/
		
#define THREAD_COUNT    4
#include "boot.s"

.text
.global main
.global run_th_0
.global run_th_1
.global run_th_2
.global run_th_3
.global th0_tag0
.global th1_tag0
.global th2_tag0
.global th3_tag0

main:

thread_jump:
	th_fork(run_th)
        ba diag_fail
	nop

.align 32

!!=============================================================
!!  4 threads run different code, each imisses to its own iset
!!=============================================================

		
! 0x150040
run_th_0:
		set		0x10,			%i0
th0_tag0:		
		subcc	%i0,	1,		%i0
		bne		th0_tag1
		ba		test0
		nop
.align 32

		
! 0x150060
run_th_1:
		set		0x10,			%i1
th1_tag0:		
		subcc	%i1,	1,		%i1
		bne		th1_tag1
		ba		test1
		nop
.align 32

		
! 0x150080
run_th_2:
		set		0x10,			%i2
th2_tag0:		
		subcc	%i2,	1,		%i2
		bne		th2_tag1
		ba		test2
		nop
.align 32

		
! 0x1500a0
run_th_3:
		set		0x10,			%i3
th3_tag0:		
		subcc	%i3,	1,		%i3
		bne		th3_tag1
		ba		test3
		nop
		
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.align 2048

		
! 0x150800
th0_tag1:
		subcc	%i0,	1,		%i0
		bne		th0_tag2
		ba		test0
		nop
.align 32


! 0x150820
th1_tag1:
		subcc	%i1,	1,		%i1
		bne		th1_tag2
		ba		test1
		nop
.align 32


! 0x150840
th2_tag1:
		subcc	%i2,	1,		%i2
		bne		th2_tag2
		ba		test2
		nop
.align 32


! 0x150860
th3_tag1:
		subcc	%i3,	1,		%i3
		bne		th3_tag2
		ba		test3
		nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.align 2048

		
! 0x151000
th0_tag2:
		subcc	%i0,	1,		%i0
		bne		th0_tag3
		ba		test0
		nop
.align 32


! 0x151020
th1_tag2:
		subcc	%i1,	1,		%i1
		bne		th1_tag3
		ba		test1
		nop
.align 32


! 0x151040
th2_tag2:
		subcc	%i2,	1,		%i2
		bne		th2_tag3
		ba		test2
		nop
.align 32


! 0x151060
th3_tag2:
		subcc	%i3,	1,		%i3
		bne		th3_tag3
		ba		test3
		nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.align 2048


! 0x151800
th0_tag3:
		subcc	%i0,	1,		%i0
		bne		th0_tag4
		ba		test0
		nop
.align 32


! 0x151820
th1_tag3:
		subcc	%i1,	1,		%i1
		bne		th1_tag4
		ba		test1
		nop
.align 32


! 0x151840
th2_tag3:
		subcc	%i2,	1,		%i2
		bne		th2_tag4
		ba		test2
		nop
.align 32


! 0x151860
th3_tag3:
		subcc	%i3,	1,		%i3
		bne		th3_tag4
		ba		test3
		nop


!#define PAGE2_TEXT_ADDR 0x170000
#define PAGE2_TEXT_ADDR 0x20170000
#define PAGE2_TEXT_ADDR_PA 0x1100170000
#define PAGE2_TEXT_ADDR_RA 0x100170000
				
SECTION .PAGE2 TEXT_VA=PAGE2_TEXT_ADDR
attr_text {
	Name = .PAGE2,
	VA=PAGE2_TEXT_ADDR,	PA=PAGE2_TEXT_ADDR_PA, RA=PAGE2_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}

.text
.global page2
.global th0_tag4
.global th1_tag4
.global th2_tag4
.global th3_tag4
.global test0
.global test1
.global test2
.global test3

page2:


! 0x170000
th0_tag4:
		subcc	%i0,	1,		%i0
		bne		th0_tag5
		ba		test0
		nop
.align 32


! 0x170020
th1_tag4:
		subcc	%i1,	1,		%i1
		bne		th1_tag5
		ba		test1
		nop
.align 32


! 0x170040
th2_tag4:
		subcc	%i2,	1,		%i2
		bne		th2_tag5
		ba		test2
		nop
.align 32


! 0x170060
th3_tag4:
		subcc	%i3,	1,		%i3
		bne		th3_tag5
		ba		test3
		nop
		
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.align 2048


!0x170800
th0_tag5:
		subcc	%i0,	1,		%i0
		bne		th0_tag6
		ba		test0
		nop
.align 32


! 0x170820
th1_tag5:
		subcc	%i1,	1,		%i1
		bne		th1_tag6
		ba		test1
		nop
.align 32


! 0x170840
th2_tag5:
		subcc	%i2,	1,		%i2
		bne		th2_tag6
		ba		test2
		nop
.align 32


! 0x170860
th3_tag5:
		subcc	%i3,	1,		%i3
		bne		th3_tag6
		ba		test3
		nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.align 2048


! 171000
th0_tag6:
		subcc	%i0,	1,		%i0
		bne		th0_tag7
		ba		test0
		nop
.align 32


! 0x171020
th1_tag6:
		subcc	%i1,	1,		%i1
		bne		th1_tag7
		ba		test1
		nop
.align 32


! 0x171040
th2_tag6:
		subcc	%i2,	1,		%i2
		bne		th2_tag7
		ba		test2
		nop
.align 32


! 0x171060
th3_tag6:
		subcc	%i3,	1,		%i3
		bne		th3_tag7
		ba		test3
		nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.align 2048


! 0x171800
th0_tag7:
		subcc	%i0,	1,		%i0
		bne		th0_tag0
		ba		test0
		nop
.align 32


! 0x171820
th1_tag7:
		subcc	%i1,	1,		%i1
		bne		th1_tag0
		ba		test1
		nop
.align 32


! 0x171840
th2_tag7:
		subcc	%i2,	1,		%i2
		bne		th2_tag0
		ba		test2
		nop
.align 32


! 0x171860
th3_tag7:
		subcc	%i3,	1,		%i3
		bne		th3_tag0
		ba		test3
		nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

test0:
		addcc	%i0,	0,		%i0
		bne		diag_fail
		ba		page3
		nop
		
test1:
		addcc	%i1,	0,		%i1
		bne		diag_fail
		ba		page3
		nop
		
test2:
		addcc	%i2,	0,		%i2
		bne		diag_fail
		ba		page3
		nop
		
test3:
		addcc	%i3,	0,		%i3
		bne		diag_fail
		ba		page3
		nop

!!=============================================================
!!  4 threads run the same code, all imiss to the same iset
!!=============================================================

!#define PAGE3_TEXT_ADDR 0x180000
#define PAGE3_TEXT_ADDR 0x20180000
#define PAGE3_TEXT_ADDR_PA 0x1100180000
#define PAGE3_TEXT_ADDR_RA 0x100180000
				
SECTION .PAGE3 TEXT_VA=PAGE3_TEXT_ADDR
attr_text {
	Name = .PAGE3,
	VA=PAGE3_TEXT_ADDR,	PA=PAGE3_TEXT_ADDR_PA, RA=PAGE3_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb ,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}

.text
.global page3
.global common_tag0


! 0x180000
page3:
		set		0x10,			%i4
		set		0x0,			%i5

! 0x180008
common_tag0:
		subcc	%i4,	1,		%i4
		bne		common_tag1
		add		%i5,	1,		%i5
		ba		common_test
		nop
.align 2048


! 0x180800
common_tag1:
		subcc	%i4,	1,		%i4
		bne		common_tag2
		add		%i5,	1,		%i5
		ba		common_test
		nop
.align 2048

! 0x181000
common_tag2:
		subcc	%i4,	1,		%i4
		bne		common_tag3
		add		%i5,	1,		%i5
		ba		common_test
		nop
.align 2048


! 0x181800
common_tag3:
		subcc	%i4,	1,		%i4
		bne		common_tag4
		add		%i5,	1,		%i5
		ba		common_test
		nop
		

!#define PAGE4_TEXT_ADDR 0x190000
#define PAGE4_TEXT_ADDR 0x20190000
#define PAGE4_TEXT_ADDR_PA 0x1100190000
#define PAGE4_TEXT_ADDR_RA 0x100190000
				
SECTION .PAGE4 TEXT_VA=PAGE4_TEXT_ADDR
attr_text {
	Name = .PAGE4,
	VA=PAGE4_TEXT_ADDR,	PA=PAGE4_TEXT_ADDR_PA, RA=PAGE4_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}

.text
.global page4
.global common_tag4
.global	common_test
.global diag_fail

page4:

! 0x190000
common_tag4:
		subcc	%i4,	1,		%i4
		bne		common_tag5
		add		%i5,	1,		%i5
		ba		common_test
		nop
.align 2048


! 0x190800
common_tag5:
		subcc	%i4,	1,		%i4
		bne		common_tag6
		add		%i5,	1,		%i5
		ba		common_test
		nop
.align 2048


! 0x191000
common_tag6:
		subcc	%i4,	1,		%i4
		bne		common_tag7
		add		%i5,	1,		%i5
		ba		common_test
		nop
.align 2048

! 0x191800
common_tag7:
		subcc	%i4,	1,		%i4
		bne		common_tag0
		add		%i5,	1,		%i5
		ba		common_test
		nop
		
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

common_test:
		subcc	%i5,	0x10,	%i5
		bne		diag_fail
		nop


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!! Diag PASSED
		
diag_pass:
        set     0xaaddcafe,     %l0
        ta T_GOOD_TRAP
        nop

!! Diag FAILED

diag_fail:		
        set     0xdeadcafe,     %l0
        ta T_BAD_TRAP
        nop
        nop

.end
