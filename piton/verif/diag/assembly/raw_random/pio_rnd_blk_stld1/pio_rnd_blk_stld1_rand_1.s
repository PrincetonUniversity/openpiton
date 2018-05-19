// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_blk_stld1_rand_1.s
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
/*
********************************************************************************
   random seed:	398099188
   Jal pio_rnd_blk_stld1.j:	
********************************************************************************/



#define JBI_CONFIG
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

wr      %g0, 0x4, %fprs         
th_fork(th_main, %l0)

th_main_0:
	ta	0x30

	setx	user_data_start, %l0, %l1
	setx	0xf0, %l0, %l2
!loop0:	
!	ldub	[%l1 + 0x7f], %l3
!	subcc	%l3, %l2, %g0
!	bnz	loop0
!	nop
!	prefetch [%l1 + 0x3f], #n_writes

normal_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

user_text_end:

!***********************************************************************
!  Test case data start
!***********************************************************************
.data
user_data_start:
	.skip 1000
user_data_end:

SECTION .MY_HYP_SEC TEXT_VA = 0x1100000000, DATA_VA = 0x1100160000
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

!!***********************************************************************
!!IOSYNC cycles to start sjm
!!***********************************************************************
!
!setx 0xdeadbeefdeadbeef, %g1, %g2
!setx 0xcf00beef00, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0xdeadbeefdeadbeef, %g1, %g2
!setx 0xef00beef00, %g1, %g3
!stx %g2, [%g3]
!!=====================

! initialize for block store and loads
! initalize
add 0x0, %g0, %g4
add 0x1, %g0, %g2
add 0x020, %g0, %g5
! FAKE DMA space
setx 0x8010000000, %g1, %g3
stloop0:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop0
nop

! initalize
add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x020, %g0, %g5
setx 0x800e000000, %g1, %g3
stloop1:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop1
nop

! initalize
add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x020, %g0, %g5
setx 0x800f000000, %g1, %g3
stloop2:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop2
nop

! initalize
add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x020, %g0, %g5
setx 0xc000000000, %g1, %g3
stloop3:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop3
nop

! initalize
add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x020, %g0, %g5
setx 0xd000000000, %g1, %g3
stloop4:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop4
nop

! initalize
add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x020, %g0, %g5
setx 0xe000000000, %g1, %g3
stloop5:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop5
nop

! initalize
add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x020, %g0, %g5
setx 0xf000000000, %g1, %g3
stloop6:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop6
nop

membar  0x40

!#define MAIN_PAGE_HV_ALSO
!
!#include "enable_traps.h"
!#include "boot.s"
!
!.text
!.global main
!
!main:
!
!  ta    T_CHANGE_HPRIV
!  //ta    T_CHANGE_NONHPRIV

	setx	0x0000000060109a0c, %r1, %r9
	setx	0x8000000008, %r1, %r10
	stx	%r9, [%r10]



!***********************************************************************
!IOSYNC cycles to start sjm
!***********************************************************************
	setx 0xdeadbeefdeadbeef, %g1, %g2
	setx 0xcf00beef00, %g1, %g3
	stx %g2, [%g3]
!***********************************************************************
!IOSYNC cycles to start sjm
!***********************************************************************
	setx 0xdeadbeefdeadbeef, %g1, %g2
	setx 0xef00beef00, %g1, %g3
	stx %g2, [%g3]



	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000010e0100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	ldx	[%r9], %r10
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000010b0100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	ldx	[%r9], %r10
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000010f0100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	ldx	[%r9], %r10
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000010a0100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000010b0100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000001010100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000001030100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000001090100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	ldx	[%r9], %r10
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000001090100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000001060100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000001050100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000001010100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000010d0100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000001080100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	ldx	[%r9], %r10
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000010b0100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000001000100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000001090100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	ldx	[%r9], %r10
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000001090100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000001030100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	ldx	[%r9], %r10
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e0000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000001030100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	ldx	[%r9], %r10
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000010d0100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000080100000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000008010000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800f000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000c000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000d000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40


done;

h_bad_end:
        ta T_BAD_TRAP

attr_data {
        Name=.MY_HYP_SEC,
        hypervisor
        }

.global my_hyp_data
.align 0x40
my_hyp_data:
        .skip 0x200

.end



SECTION .ISEG_0 DATA_VA = 0x0000000000100000
attr_data {
	Name	 = .ISEG_0,
	RA	 = 0x0000000000100000,
	PA	 = ra2pa(0x0000000000100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x20761aaca189fd94
	.xword	0x7a50b2f59b215779
	.xword	0xf0743cd6a0683409
	.xword	0xdf3e69ef7caaa4d0
	.xword	0x54b11a6dbe5acf46
	.xword	0x1149b80515427e45
	.xword	0x8793446a52129e68
	.xword	0x0ae39354d29c22e2
	.xword	0x1b9a253ae4c41399
	.xword	0xde7bd4dc73732dd6
	.xword	0x3530046038e6eeb5
	.xword	0xafbbfe0524f15e76
	.xword	0x7a9c7266929f3278
	.xword	0x494642ee667dbf3c
	.xword	0xf6b60d1fb73b9e27
	.xword	0xd58cc49a98bd2bf5
	.xword	0x91810632049b29d0
	.xword	0xf32da234dcbf2932
	.xword	0x7d04d67f1d4e4a8c
	.xword	0x1057a7b7dee7e871
	.xword	0xfa1a702a0e99a548
	.xword	0x7ff80fcd8063942f
	.xword	0xc502b1f5bb2e1bbb
	.xword	0x492c25924679d23c
	.xword	0x50f13ed7f395ee49
	.xword	0xa84a8e5451c818ab
	.xword	0x173418d546adb997
	.xword	0x14cf84b658726e89
	.xword	0x8196ac0ec85caad8
	.xword	0xbd05d49d47de7da5
	.xword	0xaa86e81cb3ca6133
	.xword	0x4820b1483979d2c7
	.xword	0x992c8696449c15b8
	.xword	0x9db524d833976eef
	.xword	0x132b3f632eca0cac
	.xword	0x64cffbe0bbedf6d4
	.xword	0x69d7cf01fb25fb90
	.xword	0xed4133e5ac6cf6b0
	.xword	0x3a185f9834ad1fb8
	.xword	0x7e7da2799cbea91f
	.xword	0xfa9eacc3d28a2ddc
	.xword	0x62b64d9ffb8edadc
	.xword	0x3e930e7c9373bb19
	.xword	0xbab0a292015de484
	.xword	0x374f916028b982fb
	.xword	0x88ef3bff4743bfc8
	.xword	0x5d0c9d7cc46fbb9d
	.xword	0xd0c7f3a1b992bd89
	.xword	0x91ba7ce50eae205e
	.xword	0x6a28ab27c5157ea2
	.xword	0x4535218483cf0a7c
	.xword	0x2a2b8b6f0d9733d7
	.xword	0x37170d1c91315f8b
	.xword	0x739a58f65dee8046
	.xword	0x4150ebe88f8969a8
	.xword	0xf0c50a11a2588439
	.xword	0xcc5409c850e31a6d
	.xword	0xbd22ad039f47ddb1
	.xword	0x836f466e2c5479f0
	.xword	0x3516909cecbe725d
	.xword	0x0f6fd7fe922f344b
	.xword	0x1eac725c128331e6
	.xword	0xec0001786971ab34
	.xword	0xc06d6c58468be621



SECTION .ISEG_1 DATA_VA = 0x0000000010100000
attr_data {
	Name	 = .ISEG_1,
	RA	 = 0x0000000010100000,
	PA	 = ra2pa(0x0000000010100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x8326622458ccbb96
	.xword	0x33740304f2621eaa
	.xword	0x7a2b554073ffc912
	.xword	0xf01f6abd541cb0d4
	.xword	0xcee19be9318d5c54
	.xword	0x68ea96facbec54ba
	.xword	0x1cac4b681dad2214
	.xword	0x4931b75cfa0bd536
	.xword	0x6ea9f6074c82bd3f
	.xword	0x62a16058c2e548fe
	.xword	0x72da916e254e767b
	.xword	0x8f14c4f07591aaa5
	.xword	0xb5abe49b4283bd31
	.xword	0xe1b94c2ffed68326
	.xword	0x8e732ae909b8d235
	.xword	0x8bb6346241b4754d
	.xword	0xe51ccafcc5bb0be9
	.xword	0x01fc89ad8addf04d
	.xword	0x74cd845cf3af41c1
	.xword	0xef47aff379eaf07b
	.xword	0xf4e299fc028e0616
	.xword	0x7c8f95a1d0b90c0f
	.xword	0xab01c2b82a2c114b
	.xword	0x755336417196ae04
	.xword	0x9673919462ef1b53
	.xword	0xbca065225a644b5d
	.xword	0xf86c0e6b54d5e600
	.xword	0xbbd6e62b72f74dbf
	.xword	0x7c2cbf3ef44169b4
	.xword	0xd1db5ed164fe791e
	.xword	0x583ae10494ede898
	.xword	0x06d8874bd57845f5
	.xword	0x02df63556bbec2f1
	.xword	0x4a598a0862826284
	.xword	0xc3e2b7e40f4709b1
	.xword	0x884ecc7f2ea9f185
	.xword	0x0eb845c6a4913db8
	.xword	0xd30131f238870df7
	.xword	0xf62922d5649da67c
	.xword	0xd9663732e052d907
	.xword	0x277f3e0e60552761
	.xword	0xef4dcb2c2adc6f1f
	.xword	0x53de52f66a25ae34
	.xword	0x6fb104907fd41180
	.xword	0x5d67d5b55fcccea2
	.xword	0xf17416c68d11af9e
	.xword	0x32f50a635d83a32f
	.xword	0xa17091f246da266e
	.xword	0x0b6b52c4357ad7ab
	.xword	0xf561e2a33db6ed13
	.xword	0x70bda17eceb865a2
	.xword	0x480abff8e27c8da3
	.xword	0xf4b9ede46538d4bf
	.xword	0xb4fed194035e847d
	.xword	0x4ec3cc3e49cd9a9a
	.xword	0x0efe3fbed178fa6b
	.xword	0xc23e818de740f136
	.xword	0x2faee3be9fef4e1b
	.xword	0x11672dfce5ecf764
	.xword	0xd12e08027b44beed
	.xword	0xd70dfa14fb2ecf05
	.xword	0x4a9dd0b7e6bdb66c
	.xword	0xf32e09c5c86b569d
	.xword	0xf6929126eb6d67fd



SECTION .ISEG_2 DATA_VA = 0x0000000020100000
attr_data {
	Name	 = .ISEG_2,
	RA	 = 0x0000000020100000,
	PA	 = ra2pa(0x0000000020100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0xab7ee5a11e3777af
	.xword	0x3c3940f98e6a9992
	.xword	0xe1b9853a62f03051
	.xword	0xbc8d13f97d03f37b
	.xword	0x9450be61d5835c7a
	.xword	0xac3c97add022338b
	.xword	0xac6b595f31a028db
	.xword	0x3a982605673165d5
	.xword	0xd5c38cf66f35e586
	.xword	0xeefb48f636a3f916
	.xword	0x1bd3c20a743550c2
	.xword	0x772daaee4a409fd7
	.xword	0x4d984a867eacb0ac
	.xword	0x89252266f843f531
	.xword	0x0db74d3f982c158d
	.xword	0x7bd173f946017326
	.xword	0x1eb83bbc2992a855
	.xword	0xf539f7406c02ce3b
	.xword	0x613b78feafd4de69
	.xword	0x8e915a6550d62c76
	.xword	0xf0df48164f8f23c7
	.xword	0x72f92212abd5994b
	.xword	0xecea73ac72c6bd07
	.xword	0xa4ea913eac163c55
	.xword	0x6785f6a4fac9a652
	.xword	0x7b14ef7cfaefd622
	.xword	0x2d75d9e5a6c8ba5e
	.xword	0x08052cbfc116f73d
	.xword	0xb28ad122346c45c2
	.xword	0x25d99ed3b2b7f958
	.xword	0xbea991d3d5609320
	.xword	0xcf1f3de7bf6055f8
	.xword	0xf76fc9820405d4bd
	.xword	0x858b8ff8ef163acb
	.xword	0x32185a9442a8084b
	.xword	0xa9e66f06d271b170
	.xword	0xb8dfc01abf78003c
	.xword	0x91e17bd78ad3846d
	.xword	0x97721341b1c0092c
	.xword	0x7898863ed9904c50
	.xword	0x868731aaccee1035
	.xword	0xc5fafede9e04d62e
	.xword	0xfb8a43c0db098a8a
	.xword	0x8d66d72a8491aea0
	.xword	0x2524769b2dfbbce7
	.xword	0x1ca1aaac3a67d922
	.xword	0xabcff02f9ac1261d
	.xword	0x749151d05421b6af
	.xword	0x1729a13c279c6354
	.xword	0xbf79890668ccbf02
	.xword	0x70b8bdfe044e08fd
	.xword	0x7254bbdb0af39596
	.xword	0xfa9275eb78253523
	.xword	0xf5ac6b0b1cd63997
	.xword	0xcad3959395c6db8d
	.xword	0xf28e2721aea183e0
	.xword	0x7bce2449776a41c0
	.xword	0x26847b3be84bb5f9
	.xword	0x7d879c77a6523203
	.xword	0x466380ec50d15848
	.xword	0x148577f2cd49d59c
	.xword	0x53dc0b8cfb0b8b1b
	.xword	0x2a1f6c118455bd92
	.xword	0xdfe507634a4648e5



SECTION .ISEG_3 DATA_VA = 0x0000000030100000
attr_data {
	Name	 = .ISEG_3,
	RA	 = 0x0000000030100000,
	PA	 = ra2pa(0x0000000030100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0xa11b4cb2cb999035
	.xword	0xb59910adbb198cf6
	.xword	0xba0f52bfca40378e
	.xword	0xa6cfe9e4ad369a19
	.xword	0x72cbacdd4cc346d4
	.xword	0xba153b655bff43a1
	.xword	0x65c5b478913de4b0
	.xword	0xac337c7d7e8d0583
	.xword	0xaef8dc4913fce09c
	.xword	0x3a1148a567d31a81
	.xword	0x09c33c9f0bfc72d9
	.xword	0x292e8c18da8ebe15
	.xword	0xa95a04e3343fe0d2
	.xword	0x94d85f2d8d2493f8
	.xword	0x78c50a07e49c156e
	.xword	0x77a7d4b4873a01db
	.xword	0xace3addd6eda00bb
	.xword	0xb5751a976822390f
	.xword	0xd469ee447d57c551
	.xword	0x0ea12fc9d5673b96
	.xword	0x2adef55a1077f1b4
	.xword	0x6056c4c4ada76cda
	.xword	0x57157cc66e91b91c
	.xword	0xb83efa49046a821b
	.xword	0xa0ff6f5b33e153f3
	.xword	0x63297d38a54193a6
	.xword	0x4cd5fc900cd06c45
	.xword	0xe8ba41549010222e
	.xword	0x87052205bb162a34
	.xword	0x8491c4cc89574ab0
	.xword	0xa9343a43c1c524b0
	.xword	0xcb035700f3ce2cf8
	.xword	0x24ecddbb120f61da
	.xword	0x006d1c888663bec7
	.xword	0x57644ba26813dcff
	.xword	0x02f97be642c89b9e
	.xword	0xa5b076e9f0dec88e
	.xword	0x1a59a5effdef27b7
	.xword	0xb5b9236502dc9319
	.xword	0x1621ff0a4636271d
	.xword	0xa084934ccb1c78e1
	.xword	0xae383090daa673ec
	.xword	0xa505697e7b36c22d
	.xword	0x32d514f352590486
	.xword	0x1af4b1415503fe72
	.xword	0x46d1ac54ec9bc3cb
	.xword	0x02b97a6c499d2080
	.xword	0xc7e4288fc1b14910
	.xword	0x5b830acac78ae5c9
	.xword	0x0cc6febb549106ab
	.xword	0x29b9bc99e863eba7
	.xword	0x8016dc3500be9303
	.xword	0xe56e67a5247a4d7a
	.xword	0xecd3af20586c2fad
	.xword	0xabcc25de450266cc
	.xword	0x076b5ff5d83f813d
	.xword	0x9316da8a729c6b0c
	.xword	0xf5b1b615740d25b7
	.xword	0x172e0d01d95c6f67
	.xword	0xa344a1d222429e7d
	.xword	0x5241e3d0764467f3
	.xword	0xbc0d573c42d80d4f
	.xword	0x9660904a082d1200
	.xword	0xe96db9bc451fa8d2



SECTION .ISEG_4 DATA_VA = 0x0000000040100000
attr_data {
	Name	 = .ISEG_4,
	RA	 = 0x0000000040100000,
	PA	 = ra2pa(0x0000000040100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x0d398ca789a3ec14
	.xword	0x6fb77649f9ad114c
	.xword	0x962943a3144bfd0c
	.xword	0x99dfcb30fa4e9a36
	.xword	0x2cc37d893ae71f84
	.xword	0x9fbd9b0f117fdd51
	.xword	0x4a33cb808624b72c
	.xword	0xfb84c573a676a081
	.xword	0x95e344ce697a1f9d
	.xword	0x4eac9ac01dccb0e4
	.xword	0x02eed6dea4fc6315
	.xword	0xbe2618450f2ad6c0
	.xword	0x6dd6c982fd4ce7a0
	.xword	0x4154713d0bbebaaa
	.xword	0xedaf647e13f9772d
	.xword	0x1d966a0bca684a7e
	.xword	0xfb00f62620a12dc5
	.xword	0x4d7d632d43e00768
	.xword	0xd436a97b164094ec
	.xword	0x1f62596d7a771ed7
	.xword	0x3701d9f9824d90d9
	.xword	0xf1967ef9d742645c
	.xword	0xb7da92b34e0619ec
	.xword	0xb89b8de725f694f2
	.xword	0xdca88fa56fce391a
	.xword	0x8438b6ed253d83c1
	.xword	0x2c4848d65bece6ca
	.xword	0x9538516da264f4c4
	.xword	0xaa98203a54ec1c01
	.xword	0x4c53631c9c90f6c1
	.xword	0x5a4f4bbe416c674c
	.xword	0x6653fcaae9735838
	.xword	0xee8be9751dc533fc
	.xword	0xaee31e2fd7d01e01
	.xword	0x2e07de34396dee49
	.xword	0x48a7f620fa43d27b
	.xword	0x160824d2d94cc8ec
	.xword	0xf024cf94a85a8cf6
	.xword	0xeea2cb1c3816566a
	.xword	0xff4694584ca1772d
	.xword	0x9fab56b6765f4377
	.xword	0x2d01131a35e32db9
	.xword	0x93b4567990b28ed4
	.xword	0xe58fbf12d54f4177
	.xword	0x2bbb3b9a5c604920
	.xword	0x760afa3a25725d98
	.xword	0x5875bcbd572bfdac
	.xword	0x0a48d1a2e5ee8c1c
	.xword	0xc7dce88cf45ac17d
	.xword	0x35f8792eef874fed
	.xword	0xf840ac8b82b746e0
	.xword	0x4a64602460dc5427
	.xword	0xb7a5a092841995df
	.xword	0x4327ac95b3e73a83
	.xword	0x50371c23974ea45c
	.xword	0x1203505c93797ac7
	.xword	0x45166033a33319ec
	.xword	0x6071c609cf6bf91d
	.xword	0x3e7b6788a0f520bb
	.xword	0x5b7f615e8e6a985b
	.xword	0x78e94cc6ead03fa1
	.xword	0x012684001bc5570d
	.xword	0x78c1b9e835f16772
	.xword	0x2106297b652e184b



SECTION .ISEG_5 DATA_VA = 0x0000000050100000
attr_data {
	Name	 = .ISEG_5,
	RA	 = 0x0000000050100000,
	PA	 = ra2pa(0x0000000050100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0xd7802edae7f88b60
	.xword	0x055026361e14d695
	.xword	0x1b5b9f5c098fe715
	.xword	0xda78ee6082aee3a6
	.xword	0xabe9f45e2f477919
	.xword	0x27f48e4533e7470a
	.xword	0xa8ba7889109d87e4
	.xword	0x4b4a48323570989f
	.xword	0xadd36c58e5b6b60c
	.xword	0x45d47122c4c7a458
	.xword	0x69543e9603377fe6
	.xword	0x00d647b562c83160
	.xword	0x13a98f4a30fc0f6a
	.xword	0xba274214402c7d33
	.xword	0xeedeada5e20ceeee
	.xword	0xfb50f7bfd2fbe56e
	.xword	0x997f2bc6ebfed0d7
	.xword	0x76e715cef4ce55d9
	.xword	0x3754414f60e3f096
	.xword	0xf11cb0a5817e73ea
	.xword	0x65b46f4790413a8d
	.xword	0x6c8985c4bd4741ee
	.xword	0x0a4556babfe50551
	.xword	0xe59c548fd429b536
	.xword	0x986a54648b932ea5
	.xword	0xeeb69d1e7e10a762
	.xword	0x016f2e3733adf37f
	.xword	0x218bfd103c99fabd
	.xword	0x965a44d3070966d9
	.xword	0xa82b8de4086d2c00
	.xword	0x2ce4ff051c01caeb
	.xword	0xa1b58f848b6bb25d
	.xword	0xb7e04faa5686f193
	.xword	0x7d1b7ad3ad2e20b9
	.xword	0xa14e2cd7cac73a6c
	.xword	0xb6e99a21e0f1bcdd
	.xword	0xe84fbedea873ac4d
	.xword	0xce5f1e1e3cba6e30
	.xword	0xaec88ee81e10401a
	.xword	0x6435a611a3f588bd
	.xword	0x0e705a13bf01d72b
	.xword	0x4cf56c02dd90fcb1
	.xword	0xf2f48a2d28db68ac
	.xword	0xc045070287700154
	.xword	0x938656b61ecbeb9f
	.xword	0x3f2f72cefb158452
	.xword	0x81fa893d295dc26d
	.xword	0x6cc97910bcb795dd
	.xword	0xc18f4edbf9928bd6
	.xword	0xea025086b02abc1a
	.xword	0x5287bfc6cff4616e
	.xword	0x82955488565bbd08
	.xword	0x87b4476cac010b20
	.xword	0x98b3695e88bdc8f3
	.xword	0x0868f33c7abdd127
	.xword	0xdd8e5d51de0fd348
	.xword	0x93bb14d27cb9ea18
	.xword	0x257692a89192f542
	.xword	0xe9a42409817c4ad0
	.xword	0xccda9e5eccaabbc1
	.xword	0xe4243f06c97f1e1a
	.xword	0xc4609db8cdaee8a1
	.xword	0xb52ab7358dd310d9
	.xword	0xf5d6cc73f0a2ffce



SECTION .ISEG_6 DATA_VA = 0x0000000060100000
attr_data {
	Name	 = .ISEG_6,
	RA	 = 0x0000000060100000,
	PA	 = ra2pa(0x0000000060100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x2e69218965c39ab6
	.xword	0x2ec8365c91ef1d28
	.xword	0xe48e5c90ca0ab11f
	.xword	0x0093c131e8caf346
	.xword	0xbba60ca7f983ef30
	.xword	0x014eb1f918207329
	.xword	0x3bae060dcd0bf1b2
	.xword	0x9e362c08ba286dd7
	.xword	0xb100668e3e94cddc
	.xword	0x9106e7230a7cd088
	.xword	0x51dc380276946717
	.xword	0xc268e616b0af88bf
	.xword	0xb60fab30b7b2ac31
	.xword	0x5173022fd5c6f747
	.xword	0x22358c33d2efa6aa
	.xword	0x7ffa2216ec4be287
	.xword	0x3a2e91caaa2f0229
	.xword	0x0baf2a02c2740a6c
	.xword	0x17c97e10b7d6ed35
	.xword	0x7d6fa3955d06d409
	.xword	0x59a589ac2d9c680a
	.xword	0xf386d435a73e20ba
	.xword	0xb79fc644d6da6b70
	.xword	0x233b992be071e036
	.xword	0x741134064cf60d15
	.xword	0x5a2d3e3fbf5d50e4
	.xword	0xda8d0cf89e10b000
	.xword	0xd61ab58f82cd44dc
	.xword	0x29158b2c45753493
	.xword	0xf870e4aec76bc1fe
	.xword	0x5131024d9a616429
	.xword	0x6bc8585e326a8dac
	.xword	0xcec0d48b09e74185
	.xword	0xd8d730c8f34ef7ff
	.xword	0xdd9a8ccaeba91d1b
	.xword	0x52f9385620eff74a
	.xword	0x5b14b998be240d55
	.xword	0xf2b16fc37c813cac
	.xword	0xa6916a75054f698f
	.xword	0x230a6ca608a75542
	.xword	0x4b535d547e3c3bf7
	.xword	0x0d4c7adacf059fda
	.xword	0x4279fdb0ec1ed935
	.xword	0x86b23e441bd98733
	.xword	0x5e96dd8db499d65a
	.xword	0xd6e2b01de8185032
	.xword	0xe2430356ad19d1aa
	.xword	0xf3a27f1277aa9e97
	.xword	0xefb67d9796f60ede
	.xword	0x62f6cfccba622608
	.xword	0x8fe41841b44c2dae
	.xword	0xb6874fad0305611f
	.xword	0xfd0122c611c98498
	.xword	0x9b201d06651ee73f
	.xword	0xfa39440d993343af
	.xword	0x14cd233f5998af6a
	.xword	0x7f62d240a8ca06b1
	.xword	0x84eb41db7076f2a1
	.xword	0x03bec185db9c3bdb
	.xword	0xe179324540deb51d
	.xword	0x455054c2b13e14c8
	.xword	0xecfef747fa416d68
	.xword	0xf34eec703ef9b75c
	.xword	0x68ced0744a82ce78



SECTION .ISEG_7 DATA_VA = 0x0000000070100000
attr_data {
	Name	 = .ISEG_7,
	RA	 = 0x0000000070100000,
	PA	 = ra2pa(0x0000000070100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x3a89ee4d2249e233
	.xword	0xcf03b15c7e57b7c6
	.xword	0xcdeba9b544b3bf05
	.xword	0xe79fdbf53e8cac7f
	.xword	0xe0ab0110529bf111
	.xword	0xc2fa23df9e14b007
	.xword	0xc024c9370756440e
	.xword	0x6de287b4239e74e7
	.xword	0x3fabcf6ebd9039b7
	.xword	0x2e7a3f2a6f67420e
	.xword	0xf994eee65508a5f4
	.xword	0x9d6c61c7da91e517
	.xword	0xbff7ea6463dd35c3
	.xword	0x96ff94926d2a99a6
	.xword	0xcd661da1e5157650
	.xword	0xba961172c514358b
	.xword	0x3379f25565a6eb91
	.xword	0xcc350baf6cacae8f
	.xword	0xfbb79de523ae66c2
	.xword	0x560fe7c71066fbf8
	.xword	0x7a3d4115357eebd6
	.xword	0x01ff8bab6b67f69c
	.xword	0xc1da4e73f41b80b7
	.xword	0x782b8a2419b6f06e
	.xword	0x3ce0e017656a1e9a
	.xword	0xfd5749abda2cb919
	.xword	0x9c4e260e601081fc
	.xword	0xd002799a4cc381ac
	.xword	0x71aa699a84c1c3f5
	.xword	0x180138d4b0998cf1
	.xword	0xf493510758c68578
	.xword	0xf4cf0a210cdb89b1
	.xword	0x08879491db2a8581
	.xword	0x2ae0f1531e78e40e
	.xword	0x60424bc84f3ceee4
	.xword	0x419cf2534356615a
	.xword	0xbd5e9ca3f77e567b
	.xword	0x332fa35c85a7608a
	.xword	0x5222b38b8e2e3e10
	.xword	0xc445a5df002f8675
	.xword	0x6b7162b4b80eb942
	.xword	0x9ba81562535e8e7a
	.xword	0x166efa8bad4b378f
	.xword	0x2460d9feaad38053
	.xword	0x6548248ee71a7724
	.xword	0x8319298b6d5187e2
	.xword	0xe84db9cceb74be8d
	.xword	0x0ddac52a675295f1
	.xword	0xc1953b4177565f68
	.xword	0x765f573ca60019bd
	.xword	0xfc26820b092f083c
	.xword	0x78223d649c42447e
	.xword	0x465e93ba66142ef8
	.xword	0x5b01ab8284452078
	.xword	0x8725545ef85b7fb1
	.xword	0x0bccaa560766405a
	.xword	0xb73d0f2e453acec7
	.xword	0x00dfdecaf9f54538
	.xword	0x79f4082c9c7cd207
	.xword	0x15703eeab1b65ebc
	.xword	0xf1fbf19b160f61cb
	.xword	0x9ae488e8b6786f54
	.xword	0x00e4e9722ff795ef
	.xword	0xf98596112cb0768d



SECTION .ISEG_8 DATA_VA = 0x0000000080100000
attr_data {
	Name	 = .ISEG_8,
	RA	 = 0x0000000080100000,
	PA	 = ra2pa(0x0000000080100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x201d3ec41f237b33
	.xword	0x2a24c53f9176d945
	.xword	0xb22b43705b2475f2
	.xword	0x451fec59f16596a0
	.xword	0xdd7cc60d283ea959
	.xword	0x519d4efcd0725161
	.xword	0xfcb7b37080b05ad4
	.xword	0x70f648b2b1cdb855
	.xword	0x60d5bbb8bc46a272
	.xword	0x3a935f16f326c327
	.xword	0x0c3a13c7da69b013
	.xword	0xac86fa9d5f5218a3
	.xword	0xd342e91ae7967208
	.xword	0xca5935e27389b850
	.xword	0x730df210a346f101
	.xword	0x7b32c373864b7551
	.xword	0xd9735fb264c5488b
	.xword	0x27fd139b62eab812
	.xword	0xc02efcf3960f437b
	.xword	0x355277fdae643562
	.xword	0x82895281a501eb37
	.xword	0xa09fec20f9304b61
	.xword	0x4cf2c889b293de06
	.xword	0xedadc8e518b86846
	.xword	0x64ccd2b47fd2f880
	.xword	0xd3df5ba792ba38cc
	.xword	0x43fdcac41101da6b
	.xword	0xe7adcc74b363f133
	.xword	0x083b4a687d93cd71
	.xword	0x72cc1c8260496767
	.xword	0xa371c6085f05c1c8
	.xword	0xea04ddef021e17f1
	.xword	0xe652868bb56b1dfa
	.xword	0x63c1913822ab5087
	.xword	0x73948997535df2df
	.xword	0x1266af4d0034c240
	.xword	0xfaf1504a7aead289
	.xword	0x7a6b41d4fcc10735
	.xword	0xabae72d457804af5
	.xword	0x2338db75f0dbb61d
	.xword	0xf9fe6f1024313ff6
	.xword	0x055e3533fc88781f
	.xword	0xe92a3801c98a5507
	.xword	0x6127c13710955250
	.xword	0xbae28bb452f4c99b
	.xword	0xd0baa7e8f8197096
	.xword	0x7126fc6a22bbce13
	.xword	0xe6567677e16cd794
	.xword	0xbc23713dc4a92769
	.xword	0xdc0cd4e7f8938bfe
	.xword	0x1d14c28cc7dab851
	.xword	0x00bdc73a8452d169
	.xword	0x4081b746bae8cb1d
	.xword	0x793ae937a96ce617
	.xword	0x3925a6318fd34875
	.xword	0xb65e649e97edfb94
	.xword	0x524f8e540cb581e2
	.xword	0x1f6addb8e6a269c4
	.xword	0x2f5b1f1caa979577
	.xword	0xe811a35789f6b6b9
	.xword	0x1b23e506453465c5
	.xword	0x86149989c9bd530c
	.xword	0x1babd6cbae062e9d
	.xword	0x021b2ef77a000411



SECTION .ISEG_9 DATA_VA = 0x0000000090100000
attr_data {
	Name	 = .ISEG_9,
	RA	 = 0x0000000090100000,
	PA	 = ra2pa(0x0000000090100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0xe38144924482f45d
	.xword	0xa299651dae14e1e7
	.xword	0xadc967cd91acc8e3
	.xword	0x7dc9c99338f33836
	.xword	0xf4280a8c77ea0ddb
	.xword	0x144ceb7543aff39a
	.xword	0x8b7eea55d340fd91
	.xword	0xf52ad1d7ea378c1c
	.xword	0x7fa2e733583930b3
	.xword	0xbb2ad58464b1eeac
	.xword	0x1b89a6ee5ac4735a
	.xword	0x39bbb65b38515fc0
	.xword	0x64f8e11707ac0035
	.xword	0xa4dca69e272de52d
	.xword	0x780063dd876b2e35
	.xword	0x8abc62b35fa4fdab
	.xword	0x3af2d9645eb66681
	.xword	0x78d18871d9a8043c
	.xword	0xdace4d5d36610927
	.xword	0x0fba8d0d30c88ddc
	.xword	0x4ed9bc59c1347081
	.xword	0x252df8186a173f11
	.xword	0x4da1c4c4bceac07d
	.xword	0xde0cf1394c451027
	.xword	0x4687cbc03af196de
	.xword	0x657a9815e80a7247
	.xword	0xbfa7623afe7935e3
	.xword	0xc085e9c64feabbbe
	.xword	0xb7248d7794ec3bc3
	.xword	0x32551c2b1c054509
	.xword	0xe3dbe8a39e11526b
	.xword	0x20aee31eaaf79f87
	.xword	0x6ef55f9973790191
	.xword	0xdfe5c2e117292949
	.xword	0x091a62ac3680c86b
	.xword	0x374700d27c4f954d
	.xword	0x9eb3443a5aaf691b
	.xword	0xeb73c03bee5170e0
	.xword	0xfcaa7d75e4ad8caa
	.xword	0x3714157809d75846
	.xword	0x7beb9f7d73c20484
	.xword	0xf7efc3b23ba93e9a
	.xword	0xc832d7a802a77889
	.xword	0x79f75ff2c2921520
	.xword	0x304ee5778bc9389d
	.xword	0xdacfe128d8e14b93
	.xword	0xe30d4f05fb7bc530
	.xword	0xfe9c505d3e5afe57
	.xword	0x6e6e7f338394c387
	.xword	0x3cfa848d63d51370
	.xword	0xf36b0331addadc95
	.xword	0x564cab510b1bd691
	.xword	0xb7b175a71f068353
	.xword	0x0c362fb3edf71171
	.xword	0x84b41bc1de53e951
	.xword	0x6bcf94bd5cad0ffb
	.xword	0x520a5e0d39acb45c
	.xword	0x52c6f0f46cd64d31
	.xword	0x71fd7e317bfdf4a4
	.xword	0xc4fb2cd84bcc7420
	.xword	0x54bb2774a05cb6f0
	.xword	0x7a6781e88b9972db
	.xword	0xda5527f4385c7461
	.xword	0x50ee01fe5abbfd2f



SECTION .ISEG_10 DATA_VA = 0x00000000a0100000
attr_data {
	Name	 = .ISEG_10,
	RA	 = 0x00000000a0100000,
	PA	 = ra2pa(0x00000000a0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x4441be5772354466
	.xword	0x807fc55f755fdf2e
	.xword	0x07ad6e4c63917f67
	.xword	0xff78ca21e56b8f4d
	.xword	0x782f1b7a0a367207
	.xword	0x918f648b40810860
	.xword	0xeb7debcde366b539
	.xword	0x26734c90a3d1144c
	.xword	0xb977ec403c6763a4
	.xword	0xbcb278e797a3b0db
	.xword	0xea7382a6594d57fd
	.xword	0xa1864689016d6d54
	.xword	0x1cc3cc801175ac04
	.xword	0x0970b80ac993a41f
	.xword	0xecdec1ff873dc18c
	.xword	0xe9da94437d07b682
	.xword	0x6e8eb269dfecdcf3
	.xword	0x5b19ba3bf01ea418
	.xword	0xc2b95910f360734c
	.xword	0x52c83d9024a13f22
	.xword	0xa6dea83ecb81e3c5
	.xword	0x83b1dd444ac667b4
	.xword	0x8f56d6f5bf07c930
	.xword	0x413024b7bfa20db1
	.xword	0x5ed8ffbe02de8ae9
	.xword	0x057718594add5499
	.xword	0x663434a603494e95
	.xword	0x4779f05cfc5e3d2f
	.xword	0x037e0ff8af116082
	.xword	0x05ef83ef93340865
	.xword	0x0c5d4be0c04b3c20
	.xword	0x603c20e5dd8e58d0
	.xword	0x543f249796172728
	.xword	0x041b1888103968a6
	.xword	0xbe5a151e5984cd7f
	.xword	0xfcf06ca676a995d3
	.xword	0x0d4eac15be5807d3
	.xword	0x288ee52ef6ec50fc
	.xword	0xd531186aff0c7683
	.xword	0x1771e80be50acf85
	.xword	0x6b8cb42f8472e128
	.xword	0xa45336e2953655e4
	.xword	0x9cb403479bb157a1
	.xword	0x36a2e967b24db74c
	.xword	0x143a5857220c5b72
	.xword	0x64fe0643b25c5f53
	.xword	0xc4d7698f9b19fcad
	.xword	0x8d44c6d2e90fc5d4
	.xword	0x1217a11e3e7bf761
	.xword	0xa0a62173e2dd01a4
	.xword	0xd7e64d3579181cb7
	.xword	0x7fdbd3a6b5057a42
	.xword	0x76754d14ceeff312
	.xword	0xded7b3c734bed5c8
	.xword	0x66b9e01d03356952
	.xword	0x6374465f1a6e29e0
	.xword	0x291b8d6a87f7b118
	.xword	0x485db3a39affaf17
	.xword	0x4933d7c764e9cb0e
	.xword	0x70da69b9249f2dbc
	.xword	0x0d482113004a4300
	.xword	0xe827a9285dff5130
	.xword	0x300e9c501724a0e0
	.xword	0x37e585db5f29ec1e



SECTION .ISEG_11 DATA_VA = 0x00000000b0100000
attr_data {
	Name	 = .ISEG_11,
	RA	 = 0x00000000b0100000,
	PA	 = ra2pa(0x00000000b0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x4330547c4e5a2af2
	.xword	0xcd062964be8a5685
	.xword	0x98fa15114a2cd691
	.xword	0x8302c517167b3673
	.xword	0xfa06df0c613740aa
	.xword	0xb739982c8cee0f03
	.xword	0xb84a53f2d69f51cf
	.xword	0xe88c1985b453253d
	.xword	0x8c207e27301193e6
	.xword	0x9554e865a0509499
	.xword	0x2170aeb937410686
	.xword	0x4e8c2204934a3135
	.xword	0xc220a53d6b33eed4
	.xword	0xd059b0acb1ea176e
	.xword	0x7c9807f51548ee1c
	.xword	0x544956d8603c22c7
	.xword	0x37cd7b0a6f45830c
	.xword	0x6e7c95e3fbb1dca8
	.xword	0x13b0ddfdcfc1ea0d
	.xword	0xa8987dbb5cb05dd2
	.xword	0xc2e1f84b821570e4
	.xword	0xdac7d0ec8349520d
	.xword	0x850387600a2d0c8d
	.xword	0xf86b7cc71b13166c
	.xword	0xf0258769cda1e602
	.xword	0x09730e4964b34a75
	.xword	0xad4b54f5d0ab4cf7
	.xword	0x846a84195c877f75
	.xword	0x76f5aa05ca40afd3
	.xword	0xc5001f5e42623300
	.xword	0x13d770f8337cadb3
	.xword	0x2225e7ee84cee3f3
	.xword	0xdc5a3bb135c68dc0
	.xword	0x5b07c89df3e7cdf4
	.xword	0x1e6b998d2426fcc0
	.xword	0x58f6e3c90a445224
	.xword	0x90a65189710b6773
	.xword	0x555fa2de13aa3ae6
	.xword	0x79eb4514472fcd55
	.xword	0xcd1e256e498a8b1b
	.xword	0x18d95d138b196598
	.xword	0x9b2be8d967b94875
	.xword	0x6a63a6354db0330c
	.xword	0x33f33f96f0cb139f
	.xword	0xc726b48d5509cdbd
	.xword	0xe043687e26a04acc
	.xword	0xc789e8df77768118
	.xword	0xa2e150dc2874ae94
	.xword	0x8531185f88c02f7e
	.xword	0xfbff23b6ff1c462c
	.xword	0x11bf8d3354b41478
	.xword	0x6148c5b5cc8872f0
	.xword	0xa34e3f942fdc4121
	.xword	0x85e48b475ea90ad3
	.xword	0x96b79afc183b7dcf
	.xword	0x74bf22d9eb267548
	.xword	0x11120b28035a283c
	.xword	0x44a47a5f46829be4
	.xword	0x78cd4b38698e18da
	.xword	0xbd18fda7d922b5a2
	.xword	0xe29b3b038c13fe89
	.xword	0xc126d5257a849637
	.xword	0xd410c59331cb0258
	.xword	0xe48a8a573fede0f4



SECTION .ISEG_12 DATA_VA = 0x00000000c0100000
attr_data {
	Name	 = .ISEG_12,
	RA	 = 0x00000000c0100000,
	PA	 = ra2pa(0x00000000c0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0xb887f6b400fb722e
	.xword	0x8805b23a34c5eade
	.xword	0xe9c221d1b9bfe051
	.xword	0x108df1c514a0249f
	.xword	0xced101187ff6b356
	.xword	0xf58c396fef90a9d5
	.xword	0x7002e48ed378710b
	.xword	0x260fa898d68d07b0
	.xword	0xa52b2e6a0f51f410
	.xword	0xa10c11471270474c
	.xword	0xc5a199a86a9add56
	.xword	0xb63ef7b5d94cf93d
	.xword	0x76bde86b2a73fcf6
	.xword	0x5dcd85f2fdb70e25
	.xword	0x1e2f6f254c1df30d
	.xword	0xc868f788298d6784
	.xword	0xf738014b3c2459d3
	.xword	0x9662d0e9993d8571
	.xword	0x9c504e2245c8ccb4
	.xword	0x3a8faf2dc629a96a
	.xword	0x5e009deca67ba7dd
	.xword	0x26221f85e1606d89
	.xword	0xe9a93f266ab84b56
	.xword	0x7b214bf4daf8a658
	.xword	0xc6123decc7c5db26
	.xword	0x0d51b8569d937773
	.xword	0x78a4ab6b85cc7180
	.xword	0x0e2630de901f4301
	.xword	0x9b53f8b3b522933b
	.xword	0x03d477515c3f30f3
	.xword	0x5c6dfd7085281289
	.xword	0x106d57c013fee171
	.xword	0xf9bd7edd93ce8484
	.xword	0x386994e459e3f360
	.xword	0x958a2689da642f9d
	.xword	0x78bb63552b0a1559
	.xword	0x38033429cfd467cc
	.xword	0xfb18efcb288e1643
	.xword	0xc363d83f438873c5
	.xword	0x7c14c8c8a92e6b44
	.xword	0x06c869bd7cfdb514
	.xword	0x4c7bbdf34d060fcc
	.xword	0xdb100150b1ffaf55
	.xword	0xb6c3af0dc9ba340d
	.xword	0x89a74fafd9354a33
	.xword	0xd6f19578f8253740
	.xword	0x351fec04a65288a9
	.xword	0xd6127e22dcb125dc
	.xword	0x5cc55fce3a224958
	.xword	0x557079e07aaffa6b
	.xword	0x98721f23a95e005d
	.xword	0x57be0d53bc12e1eb
	.xword	0x37878059344d734b
	.xword	0x24e77a70642502ef
	.xword	0x5cadcf1ec1982a65
	.xword	0x084278e090f0753b
	.xword	0x92ea5d983836b9a5
	.xword	0x515bea4fe97caef7
	.xword	0xe910613969448538
	.xword	0x4de1e53b8cb805b0
	.xword	0x82136f3d42441762
	.xword	0xcc57c77f6a321762
	.xword	0xe536ddd97d7330d7
	.xword	0x044c7e21cc40d6f1



SECTION .ISEG_13 DATA_VA = 0x00000000d0100000
attr_data {
	Name	 = .ISEG_13,
	RA	 = 0x00000000d0100000,
	PA	 = ra2pa(0x00000000d0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x1341a806ff4924ab
	.xword	0x44d6af6eb8f0d1c7
	.xword	0xd6d4b74114fa58c6
	.xword	0x2de8d7939455b116
	.xword	0x68fe9dbfa99d5914
	.xword	0x00ae5608c37685c8
	.xword	0xca2c209ca471df15
	.xword	0xec60e6b5c74914af
	.xword	0xd2a6be5a8fce214b
	.xword	0xcf671059a0a4ad72
	.xword	0x0be6ca46e9e9dd33
	.xword	0xe64c62c70768fc15
	.xword	0xec461b387cc59e7a
	.xword	0x29279ac0a1fc3bea
	.xword	0x3686b2f9a9290a24
	.xword	0xa28b611a772b21d7
	.xword	0x2cdf643a36c2fa44
	.xword	0x96ce9c5fca9eb1e8
	.xword	0x2bc865b171a84255
	.xword	0x4085f4d3d8ed2436
	.xword	0x507895c97b39a631
	.xword	0x5e86366fe326be69
	.xword	0x9e569f8f8edc5e8a
	.xword	0x54f4a559373721c2
	.xword	0x76afa9c77734d059
	.xword	0xfd91a03db9217fb9
	.xword	0x8c7cf3a01f850c6a
	.xword	0xb521cfc7690ad0d4
	.xword	0x077fdd4fddbeefd0
	.xword	0x4aea13f24af7e0fa
	.xword	0xc5b971f75d79e1ff
	.xword	0x9d9f68a59b5ba4ac
	.xword	0x8f22dd1ef503c6bf
	.xword	0x09610f34c7716bc9
	.xword	0xf5e5d410ef61a56f
	.xword	0xebf6314a1189f014
	.xword	0x7fb2ab377b2f4ce4
	.xword	0xf8b3fcc2dfd5c8ef
	.xword	0x61540aa9d63d3cb2
	.xword	0xe7e5006c3608fd88
	.xword	0x58b027ded25bc5fd
	.xword	0x2ee5cdd6892d186f
	.xword	0x760d30990e074593
	.xword	0xf14c408a971ff64e
	.xword	0x68c96531aab79306
	.xword	0xa26650415eca235c
	.xword	0x57022843aa85fc45
	.xword	0xca5d931cd4cc5aae
	.xword	0xacb446de1e4adc75
	.xword	0x5eb9252e3c45f648
	.xword	0xaafaf7e89db12b2d
	.xword	0xf4eaa31163cd6eeb
	.xword	0x0ef2e46603bc3200
	.xword	0xad85c7510311ff1a
	.xword	0xf65da9c88589f20b
	.xword	0xde7341ec7c68f4c2
	.xword	0x512d044aa301ccbc
	.xword	0xeb66b75694883dbb
	.xword	0x837b565e8b72c4c3
	.xword	0xfb0855a37c24119f
	.xword	0x35bfd2f4d72be3d9
	.xword	0x6f822cb418c1a294
	.xword	0x8fe6345e3d262d42
	.xword	0xe03dd6f1a50d7572



SECTION .ISEG_14 DATA_VA = 0x00000000e0100000
attr_data {
	Name	 = .ISEG_14,
	RA	 = 0x00000000e0100000,
	PA	 = ra2pa(0x00000000e0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x62bb248e47617ab9
	.xword	0x418f923577f96e15
	.xword	0x89416ddca1676b09
	.xword	0x84f3f20040c30858
	.xword	0x0cf7442cab4d1a1a
	.xword	0xb6efe170943d090f
	.xword	0x4d7ea4bab32d2b77
	.xword	0x0b80a6a1134593f4
	.xword	0x1d86fd7ffb95f0c7
	.xword	0x75384b1a7dec827c
	.xword	0x220a743fc551063b
	.xword	0x43dca8afccf689a8
	.xword	0x133de6e9722af445
	.xword	0x203c973458a9de8f
	.xword	0x8caaa1dc0899c8fd
	.xword	0xee68ab55b93f92a4
	.xword	0xd7312937827bd1c7
	.xword	0x40a2c1b8fe437043
	.xword	0xf7158b7f30110c83
	.xword	0x774befbfe74d648d
	.xword	0x8596a94481d3a4e8
	.xword	0x9ea7f831543ca0dd
	.xword	0x882e686c984f7937
	.xword	0x3d4fa76bccb79f4a
	.xword	0xfe3ab5f262ee0d36
	.xword	0x2f8f08db7fe8a0c5
	.xword	0x8d182d67bdd9b843
	.xword	0x26ee17a2cd9748d0
	.xword	0x22a3d60714170211
	.xword	0x9f14d5840f9bfabe
	.xword	0x927956edcc1c77b6
	.xword	0x9791e2fb10cce4e5
	.xword	0xa14adb8be6661a72
	.xword	0x3468fd5d4ec813f5
	.xword	0xedcd434ea31da0d2
	.xword	0x97a227e405f18cbb
	.xword	0x234986e8ac41ab8d
	.xword	0xf565d503d5371931
	.xword	0x55f16bb3346a9890
	.xword	0xa0327622cd8ccbff
	.xword	0x3b6a01bdf6312353
	.xword	0x49cd9d099eefc554
	.xword	0x065588f46cf72168
	.xword	0x31ecfca23d78a48c
	.xword	0xdceb2be82c04c267
	.xword	0x810f644bb3adb12c
	.xword	0xb7acc8e5332b4752
	.xword	0x465979ca796e398e
	.xword	0xdb22260dc23ebcea
	.xword	0x59630f44474a8a9b
	.xword	0xdc81749a487c5d26
	.xword	0xfdd69b490caf9848
	.xword	0x1d5f720aa225bd83
	.xword	0x6d53477ad223f3be
	.xword	0x337a4d0e35b49608
	.xword	0xa9ed439baac525f6
	.xword	0x65115f146c631431
	.xword	0x1895bb7f5c43374e
	.xword	0x08fe5bda0e99df67
	.xword	0x5f51ebffeee72064
	.xword	0xd3c8303905a5cf55
	.xword	0xa7d164c90be4d4a8
	.xword	0x6300cb5ec12ccac5
	.xword	0x19791a78e0f862d6



SECTION .ISEG_15 DATA_VA = 0x00000000f0100000
attr_data {
	Name	 = .ISEG_15,
	RA	 = 0x00000000f0100000,
	PA	 = ra2pa(0x00000000f0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x7e2bd91b42440379
	.xword	0x63cd58f6818fbea9
	.xword	0xee7bb1261e0a5a9b
	.xword	0x42b7af5f2337e7d8
	.xword	0x227ba6f549cf4484
	.xword	0xbbd04e9cf05d3629
	.xword	0xb160aad128f43db6
	.xword	0xf99f52a2223ba9e5
	.xword	0x8f7a5307422c41c2
	.xword	0x07d0f2e9725ff9cf
	.xword	0x4451f16505ab35ae
	.xword	0x36feed32a076a25c
	.xword	0xf5d2e92193fbd33f
	.xword	0xbfd7a473bc601e64
	.xword	0x714fd20a1209ef36
	.xword	0x098e05e21af65f40
	.xword	0x1068e45242f91e75
	.xword	0x78775ec228c5e4f2
	.xword	0x066ad3dbda222625
	.xword	0x6031fe42146290f8
	.xword	0x7e29ea0de6454607
	.xword	0x65a0c39f679f89cb
	.xword	0x9f3fd967782f25e2
	.xword	0xca9bccc924e1248a
	.xword	0xef8d3a085523880d
	.xword	0x743dbdb681abe38f
	.xword	0x7fdedfc5c0f562b8
	.xword	0x0880304654e83653
	.xword	0x2197788c64f67d4e
	.xword	0xc7b69b7d664b1766
	.xword	0xde9bc807555523ed
	.xword	0xe21ae579f2ef7a5c
	.xword	0x453f00ee259b6d9a
	.xword	0x129fc60ce04ef04b
	.xword	0xf6b98f8ce9f352bc
	.xword	0x9cf941a64600bc1d
	.xword	0xa55e90a867fcab13
	.xword	0x3010be1cc0d42dd4
	.xword	0xc8c7db4c203af0e7
	.xword	0x6933e297aa67cd33
	.xword	0xc0cdcb5c65cf3fa8
	.xword	0xd87be7179b1e4a4d
	.xword	0x3c7e5ff2d8ecfe8c
	.xword	0x93f554ced2871067
	.xword	0x506b288481e8b29f
	.xword	0xbae984e946ebd1ae
	.xword	0x160b8627912f23d2
	.xword	0x11ed618aaf76f3c4
	.xword	0x3bbeb309eecc6e4a
	.xword	0xe98beb750fc369f2
	.xword	0x02be55d0c1f06194
	.xword	0x82416e22aaa3f5cc
	.xword	0xbe23859a15713981
	.xword	0xcd4f719804ef5264
	.xword	0xa4d8fe950d78e7a4
	.xword	0x2a7f98dd1b9d549f
	.xword	0x78f072ad95e4a6be
	.xword	0x4d924edf96c331f7
	.xword	0x88c893c4c7d93abf
	.xword	0x797272434e036aa8
	.xword	0xecdb6e4dfe9cd46f
	.xword	0x734cb718ae0a85b4
	.xword	0x95543daba7d1e59e
	.xword	0x26cf68618ce61917



#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# 
!!#   uint64 b_DATA_ARRAY[12000], h_DATA_ARRAY[12000], w_DATA_ARRAY[12000], x_DATA_ARRAY[12000];
!!#   uint64 b_ADDR_ARRAY[12000], h_ADDR_ARRAY[12000], w_ADDR_ARRAY[12000], x_ADDR_ARRAY[12000];
!!#   uint64 data_st = 0;
!!#   uint64 addr_st = 0;
!!#   uint64 noise_data_st = 0;
!!#   uint64 data_ld = 0;
!!#   int wr_cntr = 0;
!!#   int rd_cntr = 0;
!!#   int b_wr_cntr = 0;
!!#   int b_rd_cntr = 0;
!!#   int h_wr_cntr = 0;
!!#   int h_rd_cntr = 0;
!!#   int w_wr_cntr = 0;
!!#   int w_rd_cntr = 0;
!!#   int x_wr_cntr = 0;
!!#   int x_rd_cntr = 0;
!!#   int a_addr_sel = 0;
!!#   int a_wr_cntr = 0;
!!#   int a_rd_cntr = 0;
!!#   int b_a_wr_cntr = 0;
!!#   int b_a_rd_cntr = 0;
!!#   int h_a_wr_cntr = 0;
!!#   int h_a_rd_cntr = 0;
!!#   int w_a_wr_cntr = 0;
!!#   int w_a_rd_cntr = 0;
!!#   int x_a_wr_cntr = 0;
!!#   int x_a_rd_cntr = 0;
!!#   int i =0;
!!#   int j =0;
!!#   uint64 jbi0, jbi1, jbi2, jbi3, jbi4, jbi5, jbi6, jbi_addr,jbi_config,mem_ad;
!!#   int fr_done = 0;
!!#   int addr_sel = 0;
!!#   int store_addr = 0;
!!#   int rnd_cnt = 0;
!!#   int invalid_config = 1;
!!#   int config_cnt = 0;
!!# 
!!#   int sjm0_w_mask = 0, sjm1_w_mask = 0;
!!#   int m_tmp = 0;
!!#   uint64 mask = 0;
!!#   int sjm_rd0 = 0, sjm_wr0 = 0, sjm_rd1 = 0, sjm_wr1 = 0;
!!#   int sjm4_dat = 0, sjm5_dat = 0, sjm4_cnt = 0, sjm5_cnt = 0;
!!#   int sjm0_data[8][16];
!!#   int sjm1_data[8][16];
!!#   uint64 sjm0_addr[8], sj4_ad = 0;
!!#   uint64 sjm1_addr[8], sj5_ad = 0;
!!# 
!!#   int sjm_rd0_io = 0, sjm_wr0_io = 0, sjm_rd1_io = 0, sjm_wr1_io = 0;
!!#   int sjm4_cnt_io = 0, sjm5_cnt_io = 0;
!!#   int sjm0_data_io[8][16];
!!#   int sjm1_data_io[8][16];
!!#   uint64 sjm0_addr_io[8];
!!#   uint64 sjm1_addr_io[8];
!!# 
!!#   int sjm_rd0_io1 = 0, sjm_wr0_io1 = 0, sjm_rd1_io1 = 0, sjm_wr1_io1 = 0;
!!#   int sjm4_cnt_io1 = 0, sjm5_cnt_io1 = 0;
!!#   int sjm0_data_io1[8][16];
!!#   int sjm1_data_io1[8][16];
!!#   uint64 sjm0_addr_io1[8];
!!#   uint64 sjm1_addr_io1[8];
!!# 
!!#   int sjm0_w_mask_m_io = 0, sjm1_w_mask_m_io = 0;
!!#   int sjm_rd0_m_io = 0, sjm_wr0_m_io = 0, sjm_rd1_m_io = 0, sjm_wr1_m_io = 0;
!!#   int sjm4_cnt_m_io = 0, sjm5_cnt_m_io = 0;
!!#   int sjm0_data_m_io[8][16];
!!#   int sjm1_data_m_io[8][16];
!!#   uint64 sjm0_addr_m_io[8];
!!#   uint64 sjm1_addr_m_io[8];
!!#   int     rnd_n,b_sz;
!!# 
!!# #define ISEG	0
!!# #define MY_HYP_SEC	1
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#   IJ_set_rvar ("diag.j", 108, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 111, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 112, Rv_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_rvar ("diag.j", 113, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 117, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 126, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 135, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 136, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 139, Rv_memaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 0001 0000 rrrr 0000 0001,"
!!#         "20'{0}");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 150, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 159, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 169, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 179, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 189, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 199, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 209, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 219, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! BYTE ALIGNED
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 230, Rv_jbi_b_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 239, Rv_jbi_b_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 249, Rv_jbi_b_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 259, Rv_jbi_b_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 269, Rv_jbi_b_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 279, Rv_jbi_b_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 289, Rv_jbi_b_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 299, Rv_ssi_b_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! HWORD ADDRESS
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 311, Rv_jbi_h_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 320, Rv_jbi_h_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 330, Rv_jbi_h_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 340, Rv_jbi_h_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 350, Rv_jbi_h_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 360, Rv_jbi_h_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 370, Rv_jbi_h_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 380, Rv_ssi_h_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! WORD Address
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 391, Rv_jbi_w_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 400, Rv_jbi_w_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 410, Rv_jbi_w_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 420, Rv_jbi_w_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 430, Rv_jbi_w_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 440, Rv_jbi_w_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 450, Rv_jbi_w_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 460, Rv_ssi_w_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 469, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 477, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   ! BLOCK LOAD STORE
!!#   ! Since limited space is initialized we do blk st and load
!!#   ! to that limited space only.
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 493, Rv_jbiaddr_pattern00,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0001 0000 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 502, Rv_jbiaddr_pattern01,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 512, Rv_jbiaddr_pattern02,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 522, Rv_jbiaddr_pattern03,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 0000 0000 0000 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 532, Rv_jbiaddr_pattern04,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 0000 0000 0000 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 542, Rv_jbiaddr_pattern05,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 0000 0000 0000 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 552, Rv_jbiaddr_pattern06,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 0000 0000 0000 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 562, Rv_ssiaddr_pattern00,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 0000 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 571, ijdefault, Ft_Rs1, "{9}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 572, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 573, ijdefault, Ft_Rd, "{16..23}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 576, ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!# 
!!#   IJ_bind_file_group("diag.j", 579, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 580, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 583, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 585, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 586, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 587, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 589, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 591, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 592, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 594, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 595, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 596, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 597, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 599, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 600, sjm_5, "\n\nLABEL_0:\n");
!!# 
!!#   !IJ_printf (th_M, "\tmov\t0, %%r8\n");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!# !  IJ_printf(th_M,"\tnop\n\tta T_GOOD_TRAP\n\tnop\n");
!!# !  IJ_printf(th_M,"\ttest_fail:\n\tta T_BAD_TRAP\n\tnop\n");
!!#   IJ_printf ("diag.j", 633, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 634, sjm_5, "\n\nBA LABEL_0\n");
!!# 
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 639,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 64; j++) {
!!#     IJ_iseg_printf("diag.j", 641,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 646,Seq_Start, NULL, 2);
!!# 
!!# }
!!# 
!!# 
!!# 
!!# %%
!!# %%section map
!!# 
!!# 
!!#   SECTION .ISEG DATA_VA = "24'{0}, 20'b0000 0000 iiii 0000 0001, 20'{0}"
!!# 
!!#   attr_data {
!!#         Name = .ISEG,
!!#         RA = "24'{0}, 20'b0000 0000 iiii 0000 0001, 20'{0}",
!!#         part_0_d_ctx_nonzero_ps0_tsb,
!!#         TTE_G = 1, TTE_Context = PCONTEXT, TTE_V = 1, TTE_Size = 0,
!!#         TTE_NFO = 0, TTE_IE = 0, TTE_Soft2 = 0, TTE_Diag = 0, TTE_Soft = 0,
!!#         TTE_L = 0, TTE_CP = 1, TTE_CV = 1, TTE_E = 0, TTE_P = 0, TTE_W = 1
!!#   }
!!#   enumerate {
!!#         DATA_VA
!!#  }
!!# 
!!# 
!!# 
!!# 
!!# %%
!!# %%section grammar
!!# 
!!# 
!!# inst_block: inst_type
!!#             | inst_block inst_type
!!# 	{
!!# 		IJ_generate ("diag.j", 876, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: set_reg9  |
!!#            sjm4      |
!!#            sjm5
!!# 
!!# {
!!# 		!IJ_generate (th_all, $2);
!!# 		!IJ_generate (th_all, $3);
!!# 		!IJ_generate (th_all, $4);
!!# }
!!# 
!!# ;
!!# 
!!# sjm4: set_sjm4_wr_b | set_sjm4_rd_b |  set_sjm4_wr_b_io | set_sjm4_rd_b_io | set_sjm4_wr_io | set_sjm4_rd_io | set_sjm4_wr_m | set_sjm4_wr_m_io | set_sjm4_rd_m_io 
!!# ;
!!# 
!!# set_sjm4_wr_b : mSET_SJM4_WR_B
!!#                 {
!!# 
!!#                   if (sjm4_cnt < 8) { 
!!#                    IJ_printf ("diag.j", 904, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 907, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 909, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 910, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 914, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 915, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 916, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 917, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 919, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 920, sjm_4, "+\n");
!!#                           }
!!#                         }
!!#                       if (sjm_wr0 == 7) sjm_wr0 = 0; else sjm_wr0++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_rd_b : mSET_SJM4_RD_B
!!#                 {
!!# 
!!#                   if (sjm4_cnt > 0) { 
!!#                    IJ_printf ("diag.j", 933, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 938, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 942, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 943, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 945, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 946, sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd0 == 7) sjm_rd0 = 0; else sjm_rd0++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_wr_m : mSET_SJM4_WR_M
!!#                 {
!!# 
!!#                   if (sjm4_cnt > 0) { 
!!#                    IJ_printf ("diag.j", 960, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 964, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 965, Rv_rand_mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       mask  = 0;
!!#                      for (i=0;i<16;i++) {
!!#                       if (m_tmp & 0x1 ) {
!!#                         mask = mask << 4;
!!#                         mask = mask | 0xf;
!!#                         } else {
!!#                         mask = mask << 4;
!!#                        }
!!# 
!!#                       m_tmp = m_tmp >> 1;
!!#                      }
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 982, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 987, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 988, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 990, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 991, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 993, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 994, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 999, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1000, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1002, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 1003, sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!!#                       !if (sjm_rd0 == 7) sjm_rd0 = 0; else sjm_rd0++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_wr_b_io : mSET_SJM4_WR_B_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_io < 8) { 
!!#                    IJ_printf ("diag.j", 1020, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1023, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 1025, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 1026, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 1030, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1031, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1032, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 1033, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1035, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 1036, sjm_4, "+\n");
!!#                           }
!!#                         }
!!#                       if (sjm_wr0_io == 7) sjm_wr0_io = 0; else sjm_wr0_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_rd_b_io : mSET_SJM4_RD_B_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_io > 0) { 
!!#                    IJ_printf ("diag.j", 1049, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 1054, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1058, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1059, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1061, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 1062, sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd0_io == 7) sjm_rd0_io = 0; else sjm_rd0_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_wr_io : mSET_SJM4_WR_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_io1 < 8) { 
!!#                    IJ_printf ("diag.j", 1077, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1080, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 1082, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 1083, Rv_memaddr_pattern_io);
!!# 
!!#                      rnd_n = random()%5;
!!#                      switch (rnd_n) {
!!#                        case 0 : b_sz = 4; break;
!!#                        case 1 : b_sz = 8; break;
!!#                        !case 0 : b_sz = 1; break;
!!#                        !case 1 : b_sz = 2; break;
!!#                        case 2 : b_sz = 4; break;
!!#                        case 3 : b_sz = 8; break;
!!#                        default :b_sz = 16; break;
!!#                       } 
!!# 
!!#                      sjm0_data_io1[sjm_wr0_io1][15] = b_sz; ! byte size in entry 15, for read
!!# 
!!#                       IJ_printf ("diag.j", 1098, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 1101, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1102, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1103, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1108, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1110, sjm_4, "\n");
!!#                       }
!!# 
!!#                       if (sjm_wr0_io1 == 7) sjm_wr0_io1 = 0; else sjm_wr0_io1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_rd_io : mSET_SJM4_RD_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_io1 > 0) {
!!#                    IJ_printf ("diag.j", 1124, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 1130, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 1134, sjm_4, "0x%08x ",sjm4_dat);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break;
!!#                          if((i==1) && (b_sz == 8)) break;
!!#                         }
!!#                       if (sjm_rd0_io1 == 7) sjm_rd0_io1 = 0; else sjm_rd0_io1++;
!!#                     }
!!#                 }
!!# 
!!# ;
!!# 
!!# set_sjm4_wr_m_io : mSET_SJM4_WR_M_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_m_io < 8) { 
!!#                    IJ_printf ("diag.j", 1149, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1151, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 1153, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1159, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1160, Rv_rand_mask);
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf; ! 4 bits * 4 = 16 bit mask
!!#                       mask  = 0;
!!#                      for (i=0;i<4;i++) {
!!#                       if (m_tmp & 0x1 ) {
!!#                         mask = mask << 4;
!!#                         mask = mask | 0xf;
!!#                         } else {
!!#                         mask = mask << 4;
!!#                        }
!!# 
!!#                       m_tmp = m_tmp >> 1;
!!#                      }
!!# 
!!#                      !IJ_printf (sjm_4, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!!#                      ! mask_flip = 0;
!!#                      ! for (i=0;i<15;i++) { 
!!#                      !  fl_tmp = mask & 0xf;
!!#                      !  mask_flip = mask_flip | fl_tmp;
!!#                      !  mask_flip = mask_flip << 4;
!!#                      !  mask      = mask      >> 4;
!!#                      ! }
!!#                      !IJ_printf (sjm_4, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!!#                      !mask = mask_flip | mask;
!!# 
!!#                      IJ_printf ("diag.j", 1187, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 1193, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1194, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1197, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1199, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1208, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1210, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!!#                       if (sjm_wr0_m_io == 7) sjm_wr0_m_io = 0; else sjm_wr0_m_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_rd_m_io : mSET_SJM4_RD_M_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_m_io > 0) { 
!!#                    IJ_printf ("diag.j", 1228, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1234, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1239, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1241, sjm_4, "\n");
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd0_m_io == 7) sjm_rd0_m_io = 0; else sjm_rd0_m_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# sjm5: set_sjm5_wr_b | set_sjm5_rd_b |  set_sjm5_wr_b_io | set_sjm5_rd_b_io | set_sjm5_wr_io | set_sjm5_rd_io | set_sjm5_wr_m | set_sjm5_wr_m_io | set_sjm5_rd_m_io 
!!# ;
!!# 
!!# set_sjm5_wr_b : mSET_SJM5_WR_B
!!#                 {
!!# 
!!#                   if (sjm5_cnt < 8) { 
!!#                    IJ_printf ("diag.j", 1259, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1262, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1264, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1265, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1268, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1269, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1270, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1271, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1273, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1274, sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_wr1 == 7) sjm_wr1 = 0; else sjm_wr1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_rd_b : mSET_SJM5_RD_B
!!#                 {
!!# 
!!#                   if (sjm5_cnt > 0) { 
!!#                    IJ_printf ("diag.j", 1287, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1292, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1296, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1297, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1299, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1300, sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd1 == 7) sjm_rd1 = 0; else sjm_rd1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_wr_m : mSET_SJM5_WR_M
!!#                 {
!!# 
!!#                   if (sjm5_cnt > 0) { 
!!#                    IJ_printf ("diag.j", 1314, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1318, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1319, Rv_rand_mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       mask  = 0;
!!#                      for (i=0;i<16;i++) {
!!#                       if (m_tmp & 0x1 ) {
!!#                         mask = mask << 4;
!!#                         mask = mask | 0xf;
!!#                         } else {
!!#                         mask = mask << 4;
!!#                        }
!!# 
!!#                       m_tmp = m_tmp >> 1;
!!#                      }
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1336, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1341, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1342, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1344, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1345, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1347, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1348, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1353, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1354, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1356, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1357, sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!!#                       !if (sjm_rd1 == 7) sjm_rd1 = 0; else sjm_rd1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_wr_b_io : mSET_SJM5_WR_B_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_io < 8) { 
!!#                    IJ_printf ("diag.j", 1374, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1377, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1379, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1380, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1384, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1385, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1386, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1387, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1389, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1390, sjm_5, "+\n");
!!#                           }
!!#                         }
!!#                       if (sjm_wr1_io == 7) sjm_wr1_io = 0; else sjm_wr1_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_rd_b_io : mSET_SJM5_RD_B_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_io > 0) { 
!!#                    IJ_printf ("diag.j", 1403, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1408, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1412, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1413, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1415, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1416, sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd1_io == 7) sjm_rd1_io = 0; else sjm_rd1_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_wr_io : mSET_SJM5_WR_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_io1 < 8) { 
!!#                    IJ_printf ("diag.j", 1432, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1435, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1437, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1438, Rv_memaddr_pattern_io);
!!# 
!!#                      rnd_n = random()%5;
!!#                      switch (rnd_n) {
!!#                        case 0 : b_sz = 4; break;
!!#                        case 1 : b_sz = 8; break;
!!#                        !case 0 : b_sz = 1; break;
!!#                        !case 1 : b_sz = 2; break;
!!#                        case 2 : b_sz = 4; break;
!!#                        case 3 : b_sz = 8; break;
!!#                        default :b_sz = 16; break;
!!#                       } 
!!# 
!!#                      sjm1_data_io1[sjm_wr1_io1][15] = b_sz; ! byte size in entry 15, for read
!!# 
!!#                       IJ_printf ("diag.j", 1453, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1456, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1457, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1458, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1463, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1465, sjm_5, "\n");
!!#                       }
!!# 
!!#                       if (sjm_wr1_io1 == 7) sjm_wr1_io1 = 0; else sjm_wr1_io1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_rd_io : mSET_SJM5_RD_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_io1 > 0) {
!!#                    IJ_printf ("diag.j", 1479, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1485, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1489, sjm_5, "0x%08x ",sjm5_dat);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break;
!!#                          if((i==1) && (b_sz == 8)) break;
!!#                         }
!!#                       if (sjm_rd1_io1 == 7) sjm_rd1_io1 = 0; else sjm_rd1_io1++;
!!#                     }
!!#                 }
!!# 
!!# ;
!!# 
!!# set_sjm5_wr_m_io : mSET_SJM5_WR_M_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_m_io < 8) { 
!!#                    IJ_printf ("diag.j", 1504, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1506, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1508, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1514, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1515, Rv_rand_mask);
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf; ! 4 bits * 4 = 16 bit mask
!!#                       mask  = 0;
!!#                      for (i=0;i<4;i++) {
!!#                       if (m_tmp & 0x1 ) {
!!#                         mask = mask << 4;
!!#                         mask = mask | 0xf;
!!#                         } else {
!!#                         mask = mask << 4;
!!#                        }
!!# 
!!#                       m_tmp = m_tmp >> 1;
!!#                      }
!!# 
!!#                      !IJ_printf (sjm_5, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!!#                      ! mask_flip = 0;
!!#                      ! for (i=0;i<15;i++) { 
!!#                      !  fl_tmp = mask & 0xf;
!!#                      !  mask_flip = mask_flip | fl_tmp;
!!#                      !  mask_flip = mask_flip << 4;
!!#                      !  mask      = mask      >> 4;
!!#                      ! }
!!#                      !IJ_printf (sjm_5, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!!#                      !mask = mask_flip | mask;
!!# 
!!#                      IJ_printf ("diag.j", 1542, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1548, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1549, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1552, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1554, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1563, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1565, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!!#                       if (sjm_wr1_m_io == 7) sjm_wr1_m_io = 0; else sjm_wr1_m_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_rd_m_io : mSET_SJM5_RD_M_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_m_io > 0) { 
!!#                    IJ_printf ("diag.j", 1583, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1589, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1594, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1596, sjm_5, "\n");
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd1_m_io == 7) sjm_rd1_m_io = 0; else sjm_rd1_m_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_reg9:  set_memaddr9
!!# ;
!!# 
!!# set_memaddr9: mSET_MEMADDR9
!!#                 {
!!#                         ! add a mechanism to control addr1, addr5 in range ??
!!#                         ! addr
!!# 
!!#                         ! Update the JBI-CONFIG FIFO parameters
!!#                         invalid_config = 1;
!!#                         while (invalid_config) {
!!#                         if (random()%2) {
!!#                         !if (config_cnt > 500) {
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1624, Rv_jbi_fifo_wr0_config);
!!# 			IJ_update_rvar("diag.j", 1625, Rv_jbi_fifo_wr0_config);
!!#                         } else {
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1627, Rv_jbi_fifo_wr1_config);
!!# 			IJ_update_rvar("diag.j", 1628, Rv_jbi_fifo_wr1_config);
!!#                         }
!!#                         if (((jbi_config>>24) & 0x7) < ((jbi_config>>28) & 0x7)) {
!!#                         invalid_config = 0;
!!#                          }
!!#                         } config_cnt++;
!!# 
!!#                         if (fr_done == 0) {
!!#                          fr_done = 1;
!!#                         IJ_printf ("diag.j", 1637, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 jbi_config);
!!#                         IJ_printf ("diag.j", 1639, th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         IJ_printf ("diag.j", 1640, th_M, "\tstx\t%%r9, [%%r10]\n");
!!#                         IJ_printf ("diag.j", 1641, th_M, "\n\n\n");
!!#                         IJ_printf ("diag.j", 1642, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1643, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1644, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1645, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1646, th_M, "\tsetx 0xcf00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1647, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1648, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1649, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1650, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1651, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1652, th_M, "\tsetx 0xef00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1653, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1654, th_M, "\n\n\n");
!!#                         }
!!# 
!!#                         ! BLOCK LOAD AND STORES
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1659, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1660, Rv_memaddr_pattern);
!!# 
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1662, Rv_jbiaddr_pattern00);
!!# 
!!#                         ! to remove address not in dma-fake range
!!# 			! since using a limited space we dont need it right now
!!#                         !while (jbi0 < 550024249344 ) {
!!#                         !jbi0 = IJ_get_rvar_val64(Rv_jbiaddr_pattern00);
!!# 			!IJ_update_rvar(Rv_jbiaddr_pattern00);
!!#                         !}
!!# 
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1672, Rv_jbiaddr_pattern01);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1673, Rv_jbiaddr_pattern02);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1674, Rv_jbiaddr_pattern03);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1675, Rv_jbiaddr_pattern04);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1676, Rv_jbiaddr_pattern05);
!!# 
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1678, Rv_jbiaddr_pattern06);
!!#                         ! to remove address not in dma-fake range
!!# 			! since using a limited space we dont need it right now
!!#                         !while (jbi6 > 1095216660479)  {
!!#                         !jbi6 = IJ_get_rvar_val64(Rv_jbiaddr_pattern06);
!!# 			!IJ_update_rvar(Rv_jbiaddr_pattern06);
!!#                         !}
!!# 
!!# 			IJ_update_rvar("diag.j", 1686, Rv_jbiaddr_pattern00);
!!# 			IJ_update_rvar("diag.j", 1687, Rv_jbiaddr_pattern01);
!!# 			IJ_update_rvar("diag.j", 1688, Rv_jbiaddr_pattern02);
!!# 			IJ_update_rvar("diag.j", 1689, Rv_jbiaddr_pattern03);
!!# 			IJ_update_rvar("diag.j", 1690, Rv_jbiaddr_pattern04);
!!# 			IJ_update_rvar("diag.j", 1691, Rv_jbiaddr_pattern05);
!!# 			IJ_update_rvar("diag.j", 1692, Rv_jbiaddr_pattern06);
!!# 
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi0; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi1; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi2; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi3; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi4; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi5; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi6; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!# 
!!# 			! store already done
!!#                         !for (i=0;i<7;i++) {
!!#                         !b_DATA_ARRAY[b_wr_cntr] = IJ_get_rvar_val64(Rv_rand64);
!!# 			!IJ_update_rvar(Rv_rand64);
!!#                         !data_st = b_DATA_ARRAY[b_wr_cntr];
!!#                         !addr_st = b_ADDR_ARRAY[b_a_wr_cntr -7 + i];
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                         !        addr_st);
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                         !        data_st);
!!#                         !IJ_printf (th_M, "\tstb\t%%r10, [%%r9]\n");
!!# 
!!# 			! Block Loads and Block Stores
!!#                         for (i=0;i<7;i++) {
!!#                         IJ_printf ("diag.j", 1718, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 b_ADDR_ARRAY[b_a_wr_cntr -7 +i]);
!!#                         IJ_printf ("diag.j", 1720, th_M, "\tldda\t[%%r12]ASI_BLK_P, %%f0\n");
!!#                         IJ_printf ("diag.j", 1721, th_M, "\tstda\t %%f0, [%%r12]ASI_BLK_P\n");
!!#                         IJ_printf ("diag.j", 1722, th_M, "\tstda\t %%f0, [%%r12]ASI_BLK_P\n");
!!#                         IJ_printf ("diag.j", 1723, th_M, "\tstda\t %%f0, [%%r12]ASI_BLK_P\n");
!!#                         IJ_printf ("diag.j", 1724, th_M, "\tmembar\t 0x40\n");
!!#                         }
!!# 
!!#  			! cache able store and load to main memory 
!!#                         if(random()%4 == 0) {
!!#                         IJ_printf ("diag.j", 1729, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 mem_ad);
!!#                         IJ_printf ("diag.j", 1731, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         if(random()%2) {
!!#                         IJ_printf ("diag.j", 1734, th_M, "\tstx\t%%r10, [%%r9]\n");
!!#                         } else {
!!#                         IJ_printf ("diag.j", 1736, th_M, "\tldx\t[%%r9], %%r10\n"); 
!!#                         }
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1738, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1739, Rv_memaddr_pattern);
!!#                         }
!!# 
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!# !                                jbi_config);
!!# !                        IJ_printf (th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!# !                        IJ_printf (th_M, "\tstx\t%%r9, [%%r10]\n");
!!# 
!!# !                        mem_ad = IJ_get_rvar_val64(Rv_memaddr_pattern);
!!# !                        IJ_update_rvar(Rv_memaddr_pattern);
!!# !
!!# !                        jbi0 = IJ_get_rvar_val64(Rv_jbi_b_addr_pattern0);
!!# !
!!# !
!!# !                        // to remove address not in dma-fake range
!!# !                        while (jbi0 < 550024249344 ) {
!!# !                        jbi0 = IJ_get_rvar_val64(Rv_jbi_b_addr_pattern0);
!!# !			IJ_update_rvar(Rv_jbi_b_addr_pattern0);
!!# !                        }
!!# !                        
!!# !                        jbi1 = IJ_get_rvar_val64(Rv_jbi_b_addr_pattern1);
!!# !                        jbi2 = IJ_get_rvar_val64(Rv_jbi_b_addr_pattern2);
!!# !                        jbi3 = IJ_get_rvar_val64(Rv_jbi_b_addr_pattern3);
!!# !                        jbi4 = IJ_get_rvar_val64(Rv_jbi_b_addr_pattern4);
!!# !                        jbi5 = IJ_get_rvar_val64(Rv_jbi_b_addr_pattern5);
!!# !
!!# !                        jbi6 = IJ_get_rvar_val64(Rv_jbi_b_addr_pattern6);
!!# !                        // to remove address not in dma-fake range
!!# !                        while (jbi6 > 1095216660479)  {
!!# !                        jbi6 = IJ_get_rvar_val64(Rv_jbi_b_addr_pattern6);
!!# !			IJ_update_rvar(Rv_jbi_b_addr_pattern6);
!!# !                        }
!!# !                        
!!# !			IJ_update_rvar(Rv_jbi_b_addr_pattern0);
!!# !			IJ_update_rvar(Rv_jbi_b_addr_pattern1);
!!# !			IJ_update_rvar(Rv_jbi_b_addr_pattern2);
!!# !			IJ_update_rvar(Rv_jbi_b_addr_pattern3);
!!# !			IJ_update_rvar(Rv_jbi_b_addr_pattern4);
!!# !			IJ_update_rvar(Rv_jbi_b_addr_pattern5);
!!# !			IJ_update_rvar(Rv_jbi_b_addr_pattern6);
!!# !
!!# !                        //addr_sel = random() % 5;
!!# !			//IJ_update_rvar(Rv_addr_sel);
!!# !	                //printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!!# !                        //store_addr = addr_sel;
!!# !
!!# !                        //switch (addr_sel) {
!!# !                        //case 1 : jbi_addr = jbi1; break;
!!# !                        //case 2 : jbi_addr = jbi2; break;
!!# !                        //case 3 : jbi_addr = jbi3; break;
!!# !                        //case 4 : jbi_addr = jbi4; break;
!!# !                        //case 5 : jbi_addr = jbi5; break;
!!# !                        //case 0 : jbi_addr = jbi6; break;
!!# !                        //default : jbi_addr = jbi5; break;
!!# !                        //}
!!# !
!!# !                        b_ADDR_ARRAY[b_a_wr_cntr] = jbi0; b_a_wr_cntr = b_a_wr_cntr + 1; // store the stx address
!!# !                        b_ADDR_ARRAY[b_a_wr_cntr] = jbi1; b_a_wr_cntr = b_a_wr_cntr + 1; // store the stx address
!!# !                        b_ADDR_ARRAY[b_a_wr_cntr] = jbi2; b_a_wr_cntr = b_a_wr_cntr + 1; // store the stx address
!!# !                        b_ADDR_ARRAY[b_a_wr_cntr] = jbi3; b_a_wr_cntr = b_a_wr_cntr + 1; // store the stx address
!!# !                        b_ADDR_ARRAY[b_a_wr_cntr] = jbi4; b_a_wr_cntr = b_a_wr_cntr + 1; // store the stx address
!!# !                        b_ADDR_ARRAY[b_a_wr_cntr] = jbi5; b_a_wr_cntr = b_a_wr_cntr + 1; // store the stx address
!!# !                        b_ADDR_ARRAY[b_a_wr_cntr] = jbi6; b_a_wr_cntr = b_a_wr_cntr + 1; // store the stx address
!!# !
!!# !                        for (i=0;i<7;i++) {
!!# !                        b_DATA_ARRAY[b_wr_cntr] = IJ_get_rvar_val64(Rv_rand64);
!!# !			IJ_update_rvar(Rv_rand64);
!!# !                        data_st = b_DATA_ARRAY[b_wr_cntr];
!!# !                        addr_st = b_ADDR_ARRAY[b_a_wr_cntr -7 + i];
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!# !                                addr_st);
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!# !                                data_st);
!!# !                        IJ_printf (th_M, "\tstb\t%%r10, [%%r9]\n");
!!# !
!!# ! 			// cache able store and load to main memory 
!!# !                        if(random()%4 == 0) {
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!# !                                mem_ad);
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!# !                                data_st);
!!# !                        if(random()%2) {
!!# !                        IJ_printf (th_M, "\tstx\t%%r10, [%%r9]\n");
!!# !                        } else {
!!# !                        IJ_printf (th_M, "\tldx\t[%%r9], %%r10\n"); 
!!# !                        }
!!# !                        mem_ad = IJ_get_rvar_val64(Rv_memaddr_pattern);
!!# !                        IJ_update_rvar(Rv_memaddr_pattern);
!!# !                        }
!!# !
!!# !
!!# !                        b_wr_cntr++;
!!# !                        } // end for 
!!# !
!!# !
!!# !                        // Update the JBI-CONFIG FIFO parameters
!!# !                        invalid_config = 1;
!!# !                        while (invalid_config) {
!!# !                        if (random()%2) {
!!# !                        jbi_config = IJ_get_rvar_val64(Rv_jbi_fifo_wr0_config);
!!# !			IJ_update_rvar(Rv_jbi_fifo_wr0_config);
!!# !                        } else {
!!# !                        jbi_config = IJ_get_rvar_val64(Rv_jbi_fifo_wr1_config);
!!# !			IJ_update_rvar(Rv_jbi_fifo_wr1_config);
!!# !                        }
!!# !                        if (((jbi_config>>24) & 0x7) < ((jbi_config>>28) & 0x7)) {
!!# !                        invalid_config = 0;
!!# !                         }
!!# !                        }
!!# !
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!# !                                jbi_config);
!!# !                        IJ_printf (th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!# !                        IJ_printf (th_M, "\tstx\t%%r9, [%%r10]\n");
!!# !
!!# !
!!# 
!!# !                        mem_ad = IJ_get_rvar_val64(Rv_memaddr_pattern);
!!# !                        IJ_update_rvar(Rv_memaddr_pattern);
!!# !
!!# !                        jbi0 = IJ_get_rvar_val64(Rv_jbi_b_addr_pattern0);
!!# !
!!# !
!!# !                        // to remove address not in dma-fake range
!!# !                        while (jbi0 < 550024249344 ) {
!!# !                        jbi0 = IJ_get_rvar_val64(Rv_jbi_b_addr_pattern0);
!!# !			IJ_update_rvar(Rv_jbi_b_addr_pattern0);
!!# !                        }
!!# !                        
!!# !                        jbi1 = IJ_get_rvar_val64(Rv_jbi_b_addr_pattern1);
!!# !                        jbi2 = IJ_get_rvar_val64(Rv_jbi_b_addr_pattern2);
!!# !                        jbi3 = IJ_get_rvar_val64(Rv_jbi_b_addr_pattern3);
!!# !                        jbi4 = IJ_get_rvar_val64(Rv_jbi_b_addr_pattern4);
!!# !                        jbi5 = IJ_get_rvar_val64(Rv_jbi_b_addr_pattern5);
!!# !
!!# !                        jbi6 = IJ_get_rvar_val64(Rv_jbi_b_addr_pattern6);
!!# !                        // to remove address not in dma-fake range
!!# !                        while (jbi6 > 1095216660479)  {
!!# !                        jbi6 = IJ_get_rvar_val64(Rv_jbi_b_addr_pattern6);
!!# !			IJ_update_rvar(Rv_jbi_b_addr_pattern6);
!!# !                        }
!!# !                        
!!# !			IJ_update_rvar(Rv_jbi_b_addr_pattern0);
!!# !			IJ_update_rvar(Rv_jbi_b_addr_pattern1);
!!# !			IJ_update_rvar(Rv_jbi_b_addr_pattern2);
!!# !			IJ_update_rvar(Rv_jbi_b_addr_pattern3);
!!# !			IJ_update_rvar(Rv_jbi_b_addr_pattern4);
!!# !			IJ_update_rvar(Rv_jbi_b_addr_pattern5);
!!# !			IJ_update_rvar(Rv_jbi_b_addr_pattern6);
!!# !
!!# !                        //addr_sel = random() % 5;
!!# !			//IJ_update_rvar(Rv_addr_sel);
!!# !	                //printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!!# !                        //store_addr = addr_sel;
!!# !
!!# !                        //switch (addr_sel) {
!!# !                        //case 1 : jbi_addr = jbi1; break;
!!# !                        //case 2 : jbi_addr = jbi2; break;
!!# !                        //case 3 : jbi_addr = jbi3; break;
!!# !                        //case 4 : jbi_addr = jbi4; break;
!!# !                        //case 5 : jbi_addr = jbi5; break;
!!# !                        //case 0 : jbi_addr = jbi6; break;
!!# !                        //default : jbi_addr = jbi5; break;
!!# !                        //}
!!# !
!!# !                        b_ADDR_ARRAY[b_a_wr_cntr] = jbi0; b_a_wr_cntr = b_a_wr_cntr + 1; // store the stx address
!!# !                        b_ADDR_ARRAY[b_a_wr_cntr] = jbi1; b_a_wr_cntr = b_a_wr_cntr + 1; // store the stx address
!!# !                        b_ADDR_ARRAY[b_a_wr_cntr] = jbi2; b_a_wr_cntr = b_a_wr_cntr + 1; // store the stx address
!!# !                        b_ADDR_ARRAY[b_a_wr_cntr] = jbi3; b_a_wr_cntr = b_a_wr_cntr + 1; // store the stx address
!!# !                        b_ADDR_ARRAY[b_a_wr_cntr] = jbi4; b_a_wr_cntr = b_a_wr_cntr + 1; // store the stx address
!!# !                        b_ADDR_ARRAY[b_a_wr_cntr] = jbi5; b_a_wr_cntr = b_a_wr_cntr + 1; // store the stx address
!!# !                        b_ADDR_ARRAY[b_a_wr_cntr] = jbi6; b_a_wr_cntr = b_a_wr_cntr + 1; // store the stx address
!!# !
!!# !                        for (i=0;i<7;i++) {
!!# !                        b_DATA_ARRAY[b_wr_cntr] = IJ_get_rvar_val64(Rv_rand64);
!!# !			IJ_update_rvar(Rv_rand64);
!!# !                        data_st = b_DATA_ARRAY[b_wr_cntr];
!!# !                        addr_st = b_ADDR_ARRAY[b_a_wr_cntr -7 + i];
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!# !                                addr_st);
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!# !                                data_st);
!!# !                        IJ_printf (th_M, "\tstb\t%%r10, [%%r9]\n");
!!# !
!!# ! 			// cache able store and load to main memory 
!!# !                        if(random()%4 == 0) {
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!# !                                mem_ad);
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!# !                                data_st);
!!# !                        if(random()%2) {
!!# !                        IJ_printf (th_M, "\tstx\t%%r10, [%%r9]\n");
!!# !                        } else {
!!# !                        IJ_printf (th_M, "\tldx\t[%%r9], %%r10\n"); 
!!# !                        }
!!# !                        mem_ad = IJ_get_rvar_val64(Rv_memaddr_pattern);
!!# !                        IJ_update_rvar(Rv_memaddr_pattern);
!!# !                        }
!!# !
!!# !
!!# !                        b_wr_cntr++;
!!# !                        } // end for 
!!# !
!!# !
!!# !                        // Update the JBI-CONFIG FIFO parameters
!!# !                        invalid_config = 1;
!!# !                        while (invalid_config) {
!!# !                        if (random()%2) {
!!# !                        jbi_config = IJ_get_rvar_val64(Rv_jbi_fifo_wr0_config);
!!# !			IJ_update_rvar(Rv_jbi_fifo_wr0_config);
!!# !                        } else {
!!# !                        jbi_config = IJ_get_rvar_val64(Rv_jbi_fifo_wr1_config);
!!# !			IJ_update_rvar(Rv_jbi_fifo_wr1_config);
!!# !                        }
!!# !                        if (((jbi_config>>24) & 0x7) < ((jbi_config>>28) & 0x7)) {
!!# !                        invalid_config = 0;
!!# !                         }
!!# !                        }
!!# !
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!# !                                jbi_config);
!!# !                        IJ_printf (th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!# !                        IJ_printf (th_M, "\tstx\t%%r9, [%%r10]\n");
!!# !
!!# !
!!# !                        // HALF WORD
!!# !                        // add a mechanism to control addr1, addr5 in range ??
!!# !                        // addr
!!# !
!!# !
!!# !                        while (jbi0 < 550024249344 ) {
!!# !                        jbi0 = IJ_get_rvar_val64(Rv_jbi_h_addr_pattern1);
!!# !                        IJ_update_rvar(Rv_jbi_h_addr_pattern0);
!!# !                        }
!!# !
!!# !                        jbi6 = IJ_get_rvar_val64(Rv_jbi_h_addr_pattern6);
!!# !                        // to remove address not in dma-fake range
!!# !                        while (jbi6 > 1095216660479)  {
!!# !                        jbi6 = IJ_get_rvar_val64(Rv_jbi_h_addr_pattern6);
!!# !                        IJ_update_rvar(Rv_jbi_h_addr_pattern6);
!!# !                        }
!!# !
!!# !                        jbi1 = IJ_get_rvar_val64(Rv_jbi_h_addr_pattern1);
!!# !                        jbi2 = IJ_get_rvar_val64(Rv_jbi_h_addr_pattern2);
!!# !                        jbi3 = IJ_get_rvar_val64(Rv_jbi_h_addr_pattern3);
!!# !                        jbi4 = IJ_get_rvar_val64(Rv_jbi_h_addr_pattern4);
!!# !                        jbi5 = IJ_get_rvar_val64(Rv_jbi_h_addr_pattern5);
!!# !                        jbi6 = IJ_get_rvar_val64(Rv_jbi_h_addr_pattern6);
!!# !			IJ_update_rvar(Rv_jbi_h_addr_pattern1);
!!# !			IJ_update_rvar(Rv_jbi_h_addr_pattern2);
!!# !			IJ_update_rvar(Rv_jbi_h_addr_pattern3);
!!# !			IJ_update_rvar(Rv_jbi_h_addr_pattern4);
!!# !			IJ_update_rvar(Rv_jbi_h_addr_pattern5);
!!# !			IJ_update_rvar(Rv_jbi_h_addr_pattern6);
!!# !
!!# !                        //addr_sel = random() % 5;
!!# !			//IJ_update_rvar(Rv_addr_sel);
!!# !	                //printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!!# !                        //store_addr = addr_sel;
!!# !
!!# !
!!# !                        h_ADDR_ARRAY[h_a_wr_cntr] = jbi1; h_a_wr_cntr = h_a_wr_cntr + 1; // store the stx address
!!# !                        h_ADDR_ARRAY[h_a_wr_cntr] = jbi2; h_a_wr_cntr = h_a_wr_cntr + 1; // store the stx address
!!# !                        h_ADDR_ARRAY[h_a_wr_cntr] = jbi3; h_a_wr_cntr = h_a_wr_cntr + 1; // store the stx address
!!# !                        h_ADDR_ARRAY[h_a_wr_cntr] = jbi4; h_a_wr_cntr = h_a_wr_cntr + 1; // store the stx address
!!# !                        h_ADDR_ARRAY[h_a_wr_cntr] = jbi5; h_a_wr_cntr = h_a_wr_cntr + 1; // store the stx address
!!# !                        h_ADDR_ARRAY[h_a_wr_cntr] = jbi6; h_a_wr_cntr = h_a_wr_cntr + 1; // store the stx address
!!# !
!!# !                        for (i=0;i<6;i++) {
!!# !                        h_DATA_ARRAY[h_wr_cntr] = IJ_get_rvar_val64(Rv_rand64);
!!# !			IJ_update_rvar(Rv_rand64);
!!# !                        data_st = h_DATA_ARRAY[h_wr_cntr];
!!# !                        addr_st = h_ADDR_ARRAY[h_a_wr_cntr -6 + i];
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!# !                                addr_st);
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!# !                                data_st);
!!# !                        IJ_printf (th_M, "\tsth\t%%r10, [%%r9]\n");
!!# !
!!# !                        // cache able store and load to main memory
!!# !                        if(random()%4 == 0) {
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!# !                                mem_ad);
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!# !                                data_st);
!!# !                        if(random()%2) {
!!# !                        IJ_printf (th_M, "\tstx\t%%r10, [%%r9]\n");
!!# !                        } else {
!!# !                        IJ_printf (th_M, "\tldx\t[%%r9], %%r10\n");
!!# !                        }
!!# !                        mem_ad = IJ_get_rvar_val64(Rv_memaddr_pattern);
!!# !                        IJ_update_rvar(Rv_memaddr_pattern);
!!# !                        }
!!# !
!!# !
!!# !                        h_wr_cntr++;
!!# !                        } // end for 
!!# !
!!# !
!!# !                        //  WORD
!!# !                        // add a mechanism to control addr1, addr5 in range ??
!!# !                        // addr
!!# !                        while (jbi0 < 550024249344 ) {
!!# !                        jbi0 = IJ_get_rvar_val64(Rv_jbi_w_addr_pattern1);
!!# !                        IJ_update_rvar(Rv_jbi_w_addr_pattern0);
!!# !                        }
!!# !
!!# !                        jbi6 = IJ_get_rvar_val64(Rv_jbi_w_addr_pattern6);
!!# !                        // to remove address not in dma-fake range
!!# !                        while (jbi6 > 1095216660479)  {
!!# !                        jbi6 = IJ_get_rvar_val64(Rv_jbi_w_addr_pattern6);
!!# !                        IJ_update_rvar(Rv_jbi_w_addr_pattern6);
!!# !                        }
!!# !
!!# !                        jbi1 = IJ_get_rvar_val64(Rv_jbi_w_addr_pattern1);
!!# !                        jbi2 = IJ_get_rvar_val64(Rv_jbi_w_addr_pattern2);
!!# !                        jbi3 = IJ_get_rvar_val64(Rv_jbi_w_addr_pattern3);
!!# !                        jbi4 = IJ_get_rvar_val64(Rv_jbi_w_addr_pattern4);
!!# !                        jbi5 = IJ_get_rvar_val64(Rv_jbi_w_addr_pattern5);
!!# !                        jbi6 = IJ_get_rvar_val64(Rv_jbi_w_addr_pattern6);
!!# !			IJ_update_rvar(Rv_jbi_w_addr_pattern1);
!!# !			IJ_update_rvar(Rv_jbi_w_addr_pattern2);
!!# !			IJ_update_rvar(Rv_jbi_w_addr_pattern3);
!!# !			IJ_update_rvar(Rv_jbi_w_addr_pattern4);
!!# !			IJ_update_rvar(Rv_jbi_w_addr_pattern5);
!!# !			IJ_update_rvar(Rv_jbi_w_addr_pattern6);
!!# !
!!# !                        //addr_sel = random() % 5;
!!# !			//IJ_update_rvar(Rv_addr_sel);
!!# !	                //printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!!# !                        //store_addr = addr_sel;
!!# !
!!# !
!!# !                        w_ADDR_ARRAY[w_a_wr_cntr] = jbi1; w_a_wr_cntr = w_a_wr_cntr + 1; // store the stx address
!!# !                        w_ADDR_ARRAY[w_a_wr_cntr] = jbi2; w_a_wr_cntr = w_a_wr_cntr + 1; // store the stx address
!!# !                        w_ADDR_ARRAY[w_a_wr_cntr] = jbi3; w_a_wr_cntr = w_a_wr_cntr + 1; // store the stx address
!!# !                        w_ADDR_ARRAY[w_a_wr_cntr] = jbi4; w_a_wr_cntr = w_a_wr_cntr + 1; // store the stx address
!!# !                        w_ADDR_ARRAY[w_a_wr_cntr] = jbi5; w_a_wr_cntr = w_a_wr_cntr + 1; // store the stx address
!!# !                        w_ADDR_ARRAY[w_a_wr_cntr] = jbi6; w_a_wr_cntr = w_a_wr_cntr + 1; // store the stx address
!!# !
!!# !                        for (i=0;i<6;i++) {
!!# !                        w_DATA_ARRAY[w_wr_cntr] = IJ_get_rvar_val64(Rv_rand64);
!!# !			IJ_update_rvar(Rv_rand64);
!!# !                        data_st = w_DATA_ARRAY[w_wr_cntr];
!!# !                        addr_st = w_ADDR_ARRAY[w_a_wr_cntr -6 + i];
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!# !                                addr_st);
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!# !                                data_st);
!!# !                        IJ_printf (th_M, "\tstw\t%%r10, [%%r9]\n");
!!# !
!!# !                        // cache able store and load to main memory
!!# !                        if(random()%4 == 0) {
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!# !                                mem_ad);
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!# !                                data_st);
!!# !                        if(random()%2) {
!!# !                        IJ_printf (th_M, "\tstx\t%%r10, [%%r9]\n");
!!# !                        } else {
!!# !                        IJ_printf (th_M, "\tldx\t[%%r9], %%r10\n");
!!# !                        }
!!# !                        mem_ad = IJ_get_rvar_val64(Rv_memaddr_pattern);
!!# !                        IJ_update_rvar(Rv_memaddr_pattern);
!!# !                        }
!!# !
!!# !
!!# !                        w_wr_cntr++;
!!# !                        } // end for 
!!# !
!!# !                        // Double WORD (x-word)
!!# !                        // add a mechanism to control addr1, addr5 in range ??
!!# !                        // addr
!!# !                        while (jbi0 < 550024249344 ) {
!!# !                        jbi0 = IJ_get_rvar_val64(Rv_jbiaddr_pattern1);
!!# !                        IJ_update_rvar(Rv_jbiaddr_pattern0);
!!# !                        }
!!# !
!!# !                        jbi6 = IJ_get_rvar_val64(Rv_jbiaddr_pattern6);
!!# !                        // to remove address not in dma-fake range
!!# !                        while (jbi6 > 1095216660479)  {
!!# !                        jbi6 = IJ_get_rvar_val64(Rv_jbiaddr_pattern6);
!!# !                        IJ_update_rvar(Rv_jbiaddr_pattern6);
!!# !                        }
!!# !
!!# !                        jbi1 = IJ_get_rvar_val64(Rv_jbiaddr_pattern1);
!!# !                        jbi2 = IJ_get_rvar_val64(Rv_jbiaddr_pattern2);
!!# !                        jbi3 = IJ_get_rvar_val64(Rv_jbiaddr_pattern3);
!!# !                        jbi4 = IJ_get_rvar_val64(Rv_jbiaddr_pattern4);
!!# !                        jbi5 = IJ_get_rvar_val64(Rv_jbiaddr_pattern5);
!!# !                        jbi6 = IJ_get_rvar_val64(Rv_jbiaddr_pattern6);
!!# !			IJ_update_rvar(Rv_jbiaddr_pattern1);
!!# !			IJ_update_rvar(Rv_jbiaddr_pattern2);
!!# !			IJ_update_rvar(Rv_jbiaddr_pattern3);
!!# !			IJ_update_rvar(Rv_jbiaddr_pattern4);
!!# !			IJ_update_rvar(Rv_jbiaddr_pattern5);
!!# !			IJ_update_rvar(Rv_jbiaddr_pattern6);
!!# !
!!# !                        //addr_sel = random() % 5;
!!# !			//IJ_update_rvar(Rv_addr_sel);
!!# !	                //printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!!# !                        //store_addr = addr_sel;
!!# !
!!# !
!!# !                        x_ADDR_ARRAY[x_a_wr_cntr] = jbi1; x_a_wr_cntr = x_a_wr_cntr + 1; // store the stx address
!!# !                        x_ADDR_ARRAY[x_a_wr_cntr] = jbi2; x_a_wr_cntr = x_a_wr_cntr + 1; // store the stx address
!!# !                        x_ADDR_ARRAY[x_a_wr_cntr] = jbi3; x_a_wr_cntr = x_a_wr_cntr + 1; // store the stx address
!!# !                        x_ADDR_ARRAY[x_a_wr_cntr] = jbi4; x_a_wr_cntr = x_a_wr_cntr + 1; // store the stx address
!!# !                        x_ADDR_ARRAY[x_a_wr_cntr] = jbi5; x_a_wr_cntr = x_a_wr_cntr + 1; // store the stx address
!!# !                        x_ADDR_ARRAY[x_a_wr_cntr] = jbi6; x_a_wr_cntr = x_a_wr_cntr + 1; // store the stx address
!!# !
!!# !                        for (i=0;i<6;i++) {
!!# !                        x_DATA_ARRAY[x_wr_cntr] = IJ_get_rvar_val64(Rv_rand64);
!!# !			IJ_update_rvar(Rv_rand64);
!!# !                        data_st = x_DATA_ARRAY[x_wr_cntr];
!!# !                        addr_st = x_ADDR_ARRAY[x_a_wr_cntr -6 + i];
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!# !                                addr_st);
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!# !                                data_st);
!!# !                        IJ_printf (th_M, "\tstx\t%%r10, [%%r9]\n");
!!# !
!!# !
!!# !                        // cache able store and load to main memory
!!# !                        if(random()%4 == 0) {
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!# !                                mem_ad);
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!# !                                data_st);
!!# !                        if(random()%2) {
!!# !                        IJ_printf (th_M, "\tstx\t%%r10, [%%r9]\n");
!!# !                        } else {
!!# !                        IJ_printf (th_M, "\tldx\t[%%r9], %%r10\n");
!!# !                        }
!!# !                        mem_ad = IJ_get_rvar_val64(Rv_memaddr_pattern);
!!# !                        IJ_update_rvar(Rv_memaddr_pattern);
!!# !                        }
!!# !
!!# !                        x_wr_cntr++;
!!# !                        } // end for 
!!# !
!!# !                        // EXTRA NOISE STX
!!# !                        rnd_cnt =  addr_sel ;
!!# !                        while(rnd_cnt > 0 ) {
!!# !                        // noise load and store
!!# !                        while (addr_sel == store_addr ) {
!!# !                        //addr_sel = IJ_get_rvar_val64(Rv_addr_sel);
!!# !			//IJ_update_rvar(Rv_addr_sel);
!!# !                        addr_sel = random() % 5;
!!# !                        }
!!# !	                //printf ("!DEBUG 2: %d\n", addr_sel); 
!!# !                        switch (addr_sel) {
!!# !                        case 1 : jbi_addr = jbi1; break;
!!# !                        case 2 : jbi_addr = jbi2; break;
!!# !                        case 3 : jbi_addr = jbi3; break;
!!# !                        case 4 : jbi_addr = jbi4; break;
!!# !                        case 5 : jbi_addr = jbi5; break;
!!# !                        case 0 : jbi_addr = jbi6; break;
!!# !                        default : jbi_addr = jbi5; break;
!!# !                        }
!!# !
!!# !	                //printf ("!DEBUG 3: jbi_addr =  0x%016llx\n", jbi_addr); 
!!# !
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!# !                                jbi_addr);
!!# !                        noise_data_st = b_DATA_ARRAY[addr_sel];
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r13\n",
!!# !                                noise_data_st);
!!# !                        IJ_printf (th_M, "\tstx\t%%r13, [%%r12]\n");
!!# !                        rnd_cnt--;
!!# !                        addr_sel = IJ_get_rvar_val64(Rv_addr_sel);
!!# !			IJ_update_rvar(Rv_addr_sel);
!!# !                        }
!!# !
!!# !                        // Loads (1/2/4/8)
!!# !                        //for(i=0; i <60; i++){
!!# !                        //IJ_printf (th_M, "!\tdata_array = 0x%016llx, addr_array %d = 0x%016llx  \n",b_DATA_ARRAY[i], i,b_ADDR_ARRAY[i]);
!!# !                        //}
!!# !
!!# !                        // BYTE LOADS
!!# !                        a_addr_sel = random() %500;
!!# !
!!# !                        if(b_a_wr_cntr >= 10 ) {
!!# !                        while (a_addr_sel + 9 >= b_a_wr_cntr ) {
!!# !                        a_addr_sel = random() %500;
!!# !	                //IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!# !                         }
!!# !                        rnd_cnt = random() % 8; // 4 ld(.) from random loc which is already stored
!!# !	                //IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, b_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,b_a_wr_cntr,a_addr_sel); 
!!# !                        while(rnd_cnt > 0 ) {
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!# !                                b_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!# !                        IJ_printf (th_M, "\tldub\t[%%r12], %%r11\n");
!!# !                        data_ld = b_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!# !                                data_ld);
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r14\n",
!!# !                                0x00000000000000ff);
!!# !                        IJ_printf (th_M, "\tand\t%%r10, %%r14, %%r10\n");
!!# !                        IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!# !                        IJ_printf (th_M, "\tbne h_bad_end\n");
!!# !                        IJ_printf (th_M, "\tnop\n");
!!# !
!!# ! 			// cache able store and load to main memory 
!!# !                        if(random()%4 == 0) {
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!# !                                mem_ad);
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!# !                                data_st);
!!# !                        if(random()%2) {
!!# !                        IJ_printf (th_M, "\tstx\t%%r10, [%%r9]\n");
!!# !                        } else {
!!# !                        IJ_printf (th_M, "\tldx\t[%%r9], %%r10\n"); 
!!# !                        }
!!# !                        mem_ad = IJ_get_rvar_val64(Rv_memaddr_pattern);
!!# !                        IJ_update_rvar(Rv_memaddr_pattern);
!!# !                        }
!!# !
!!# !                        rnd_cnt--;
!!# !                         }
!!# !                        } // of if(b_a_wr_cntr >=10)
!!# !
!!# !
!!# !
!!# !                        // HALF WORD LOADS
!!# !                        a_addr_sel = random() %500;
!!# !
!!# !                        if(h_a_wr_cntr >= 10 ) {
!!# !                        while (a_addr_sel + 9 >= h_a_wr_cntr ) {
!!# !                        a_addr_sel = random() %500;
!!# !	                //IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!# !                         }
!!# !                        rnd_cnt = random() % 8; // 4 ld(.) from random loc which is already stored
!!# !	                //IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, h_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,h_a_wr_cntr,a_addr_sel); 
!!# !                        while(rnd_cnt > 0 ) {
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!# !                                h_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!# !                        IJ_printf (th_M, "\tlduh\t[%%r12], %%r11\n");
!!# !                        data_ld = h_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!# !                                data_ld);
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r14\n",
!!# !                                0x000000000000ffff);
!!# !                        IJ_printf (th_M, "\tand\t%%r10, %%r14, %%r10\n");
!!# !                        IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!# !                        IJ_printf (th_M, "\tbne h_bad_end\n");
!!# !                        IJ_printf (th_M, "\tnop\n");
!!# !                        rnd_cnt--;
!!# !                         }
!!# !                        } // of if(h_a_wr_cntr >=10)
!!# !
!!# !
!!# !
!!# !                        // WORD LOADS
!!# !                        a_addr_sel = random() %500;
!!# !
!!# !                        if(w_a_wr_cntr >= 10 ) {
!!# !                        while (a_addr_sel + 9 >= w_a_wr_cntr ) {
!!# !                        a_addr_sel = random() %500;
!!# !	                //IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!# !                         }
!!# !                        rnd_cnt = random() % 8; // 4 ld(.) from random loc which is already stored
!!# !	                //IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, w_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,w_a_wr_cntr,a_addr_sel); 
!!# !                        while(rnd_cnt > 0 ) {
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!# !                                w_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!# !                        IJ_printf (th_M, "\tlduw\t[%%r12], %%r11\n");
!!# !                        data_ld = w_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!# !                                data_ld);
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r14\n",
!!# !                                0x00000000ffffffff);
!!# !                        IJ_printf (th_M, "\tand\t%%r10, %%r14, %%r10\n");
!!# !                        IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!# !                        IJ_printf (th_M, "\tbne h_bad_end\n");
!!# !                        IJ_printf (th_M, "\tnop\n");
!!# !                        rnd_cnt--;
!!# !                         }
!!# !                        } // of if(w_a_wr_cntr >=10)
!!# !
!!# !
!!# !
!!# !                        // X-WORD LOADS
!!# !                        a_addr_sel = random() %500;
!!# !
!!# !                        if(x_a_wr_cntr >= 10 ) {
!!# !                        while (a_addr_sel + 9 >= x_a_wr_cntr ) {
!!# !                        a_addr_sel = random() %500;
!!# !	                //IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!# !                         }
!!# !                        rnd_cnt = random() % 8; // 4 ld(.) from random loc which is already stored
!!# !	                //IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, x_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,x_a_wr_cntr,a_addr_sel); 
!!# !                        while(rnd_cnt > 0 ) {
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!# !                                x_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!# !                        IJ_printf (th_M, "\tldx\t[%%r12], %%r11\n");
!!# !                        data_ld = x_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!# !                                data_ld);
!!# !                        IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!# !                        IJ_printf (th_M, "\tbne h_bad_end\n");
!!# !                        IJ_printf (th_M, "\tnop\n");
!!# !                        rnd_cnt--;
!!# !                         }
!!# !                        } // of if(x_a_wr_cntr >=10)
!!# 
!!#                         !i=0;
!!#                         !IJ_printf (th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,ADDR_ARRAY[i],rd_cntr, wr_cntr);
!!#                         !i=1;
!!#                         !IJ_printf (th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,ADDR_ARRAY[i],rd_cntr, wr_cntr);
!!#                         !i=2;
!!#                         !IJ_printf (th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,ADDR_ARRAY[i],rd_cntr, wr_cntr);
!!#                         !i=3;
!!#                         !IJ_printf (th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,ADDR_ARRAY[i],rd_cntr, wr_cntr);
!!# 
!!#                 }
!!# ;
!!# 
!!# 
!!# 
!!# 
!!# %%
!!# %%section cbfunc
!!# 
!!# %%
!!# %%section stat
!!# 
!!# %%
#endif
