// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_blk_stld1_rand_0.s
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
   random seed:	991384062
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

	setx	0x000000002131fd0c, %r1, %r9
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
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000001070100000, %r1, %r9
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
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000010c0100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	ldx	[%r9], %r10
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
	setx	0x00000010f0100000, %r1, %r9
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
	setx	0x0000001020100000, %r1, %r9
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
	setx	0x000000f0000000c0, %r1, %r12
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
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000010c0100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	ldx	[%r9], %r10
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
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000010e0100000, %r1, %r9
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
	setx	0x000000f0000000c0, %r1, %r12
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
	setx	0x00000010b0100000, %r1, %r9
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
	setx	0x0000001040100000, %r1, %r9
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
	setx	0x00000010a0100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	stx	%r10, [%r9]
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
	setx	0x00000010e0100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	stx	%r10, [%r9]
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
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000010a0100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	ldx	[%r9], %r10


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
	.xword	0x0964d5411a12507a
	.xword	0x2c53e1dd7c059df9
	.xword	0x6d1cc4587edc1d39
	.xword	0xd34f83834cb9d6ff
	.xword	0x85b265d5f465a29b
	.xword	0x845c7b459ce5df6c
	.xword	0x2f43cf83534a677f
	.xword	0x24a27f12acbeeaee
	.xword	0xf812d735337bcc6b
	.xword	0x7bfbf159d991a320
	.xword	0x6334ff2955de3f1e
	.xword	0x81a342ba2b420850
	.xword	0xb4215571e107a8ed
	.xword	0x89bd15e71474ff50
	.xword	0x936bdec918a3ee0c
	.xword	0xc270589aea664438
	.xword	0xa624da39942b1145
	.xword	0xfacb116489c85c43
	.xword	0xe833bb264fe8ea8f
	.xword	0x9c05e732224587a4
	.xword	0xef5bcbcd48aea2a5
	.xword	0xe710df8a1cc43bd7
	.xword	0x6ba0a2a3b39a3927
	.xword	0xc961fe240b2c384d
	.xword	0xe059960938082707
	.xword	0xc1f60535b3588318
	.xword	0xab286d138ea192ce
	.xword	0xb1c04cd980666b85
	.xword	0x1b45005e8153b7ab
	.xword	0xbdaadcf90a460cd6
	.xword	0xbeece1ab35211fdc
	.xword	0x1a5607623e3279f6
	.xword	0xb37f12483923f40d
	.xword	0x458ac252ba678517
	.xword	0x7ebd4305eadd8bd7
	.xword	0xfd21e6ddd9e3c41f
	.xword	0xcbe31036dc670235
	.xword	0xd81590ac1d5ad64c
	.xword	0x546ebbd9d1729c6a
	.xword	0x2b8f1ad3de496877
	.xword	0x83978514881430ca
	.xword	0x98576a94b3a96e62
	.xword	0xc201cc5d4df84d86
	.xword	0x71528d3dea957520
	.xword	0xe794a8d4ddc8801c
	.xword	0xf3d2e30edc9a6780
	.xword	0x95c3d21df54ce13c
	.xword	0x664e2ed034ad94c2
	.xword	0x4700c141fc9b3bff
	.xword	0xe148af84a4cc18ea
	.xword	0xbb9b2560aa94d5c2
	.xword	0x53d2857c99ca87e9
	.xword	0x338676c247b8eee3
	.xword	0xac04e4f9d3b41069
	.xword	0x6db7ec234ceb4ebf
	.xword	0x4632bed124e045ce
	.xword	0x5373b6074f4fdfcb
	.xword	0x2d582b2767269165
	.xword	0xa6deabe261370e2f
	.xword	0x2be12b4dd66480b1
	.xword	0x07e142436233caf8
	.xword	0x545554d070af3edc
	.xword	0xb5d0fec376db57ef
	.xword	0x55974762157e7fe6



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
	.xword	0xde613988a7b50d3a
	.xword	0xfc35ace5b50535ef
	.xword	0x19a1f5e1911a6633
	.xword	0x112b07ca70de29c5
	.xword	0xd5ee1e4f04bd4986
	.xword	0xd80afad339b8687c
	.xword	0x8ef4c37241e0bc5b
	.xword	0xba1c9a3e147d4901
	.xword	0x76bb010a23125620
	.xword	0x12b4f4acd7c96bb5
	.xword	0x7760212ec5fb78f9
	.xword	0x5713209453055b7d
	.xword	0xbec87f7d27b770b2
	.xword	0xe6644dad5432d04e
	.xword	0x1386c197dee8f375
	.xword	0x247302208357c599
	.xword	0x828b97d2cd0ec66e
	.xword	0x3b144d2ea93865b5
	.xword	0x10e2d1a4cab2e168
	.xword	0x3ab63b45839a3c41
	.xword	0x27233ba8f4b4d1ca
	.xword	0x8a2d0703492ec8fa
	.xword	0x3d10b3ec5cbf44bc
	.xword	0xd3cf6a2362726995
	.xword	0xcbcd5d2af4b4b7de
	.xword	0x596e4412a5d20487
	.xword	0x374c7bb439cb0675
	.xword	0xc7bdc08b00e39761
	.xword	0x3451d41155904200
	.xword	0x6dfb8db504c0b98d
	.xword	0x72dff79ecaae8d1c
	.xword	0xa95319b34823ff69
	.xword	0x8511f5453a4312e8
	.xword	0x7663b94e0361d4d9
	.xword	0xabf0432bb721bbe1
	.xword	0xe87e26e1257c509c
	.xword	0xa37afb4f761e29d5
	.xword	0x1c76c7ba5761383a
	.xword	0x6c2f52f16aae45e9
	.xword	0x2b2c311b39fd0e8b
	.xword	0x90075299a6ec8db7
	.xword	0x5563507c654e0592
	.xword	0x766e99733e57e4f7
	.xword	0x01c065a618bc6a6e
	.xword	0x3d6e3b8e21d05f0b
	.xword	0xfa542653fce39cb6
	.xword	0x0e364eb6985de2ed
	.xword	0xdd87b02a173f45cd
	.xword	0xf3983515af20269f
	.xword	0x60323c9b83977d43
	.xword	0xb9d4e91f60be55b3
	.xword	0x5e93ac67577ea214
	.xword	0xcf9b3584eb7f5466
	.xword	0xd6be0dbf398ac8fb
	.xword	0xbbf7e3597de47b33
	.xword	0x44cfdeb37bf559bf
	.xword	0x6ecfadcc9cf1580b
	.xword	0x8b81d8357a902067
	.xword	0x8caf31f154d00cc6
	.xword	0x4f71344d672ee09d
	.xword	0xb57b34df8da2fe7d
	.xword	0xe82bcee9a3baaf5d
	.xword	0xd7d3dba94b30eae0
	.xword	0xc1b7d68d9c532599



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
	.xword	0xe26e45170a738ab7
	.xword	0xda55e86281bbcf1a
	.xword	0xd395fc92d7063739
	.xword	0x37ce872c086a5f0c
	.xword	0x902211b2363ded9d
	.xword	0x045c102757dd3586
	.xword	0x1ce46ecd28b1ad6b
	.xword	0xd86649939d1721c8
	.xword	0xb0e8b925e92fd551
	.xword	0x678cb1ade093bb93
	.xword	0x7c9fc875fe808f6f
	.xword	0x55edd99cf673ccbe
	.xword	0x5f6d4e1d37861e51
	.xword	0x721b7fc57c885e51
	.xword	0x6541131a445461eb
	.xword	0x5e77db34a9bf0996
	.xword	0xb1abe0f10432df74
	.xword	0x00d78d1deee7a2f1
	.xword	0xb5ff7f011093f7bf
	.xword	0xa9024350bae1fb92
	.xword	0x7a1b4000d5df3aae
	.xword	0x27d3671d66b3a632
	.xword	0x2f7b37ea2b5bdb80
	.xword	0x6392bed06d1d68ea
	.xword	0x24524c296c3cfa71
	.xword	0x02e67d314fcb57e2
	.xword	0x4cd51311dffaccdf
	.xword	0xfb095e9f3cf94b48
	.xword	0xfdf6e96ad5225d2e
	.xword	0x18bc5af5ecf1631b
	.xword	0x80f3bbd6f08b3b2e
	.xword	0x830ed4e0f676672b
	.xword	0xb160cea4fc10b441
	.xword	0xfabf7887f7da84d7
	.xword	0xe582c5c9de1168d7
	.xword	0x1f255e216ea9e709
	.xword	0xeca1e06597400b9e
	.xword	0x083210312b2af14b
	.xword	0x7796bb4e5db1a050
	.xword	0x89ebcee83210ef20
	.xword	0x99e1a3565b2ef488
	.xword	0x09f5aa9b28c05ba6
	.xword	0x205c529e6e2bbac6
	.xword	0x3f357359477bc62a
	.xword	0x60f252af3c36dfa8
	.xword	0x92171610eaaa82da
	.xword	0x33caaaaf224383d0
	.xword	0xd55d6e69bbd5585c
	.xword	0x153069549e7ec31b
	.xword	0x6a00d102213d3a2b
	.xword	0x3d98dbac6718a368
	.xword	0xd309a789d8c53076
	.xword	0x253d86080794b78f
	.xword	0x2aee5141e871e3c1
	.xword	0xeb13ddacc8457db1
	.xword	0xe8fc322eb6995e5f
	.xword	0x50d6da502c1c5f4f
	.xword	0xa43b97f1d03946f2
	.xword	0x50c90cbc57d9f602
	.xword	0xbfde25ff445e6045
	.xword	0x31056a809c17a85c
	.xword	0x635bc7374c04ae35
	.xword	0xe7c062b2c3a874b4
	.xword	0x3e795f0d3cdee406



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
	.xword	0x04294eaa9a3f5d4f
	.xword	0x5fb832b9252b8374
	.xword	0xb727ba99664b6504
	.xword	0xd3bd6310db5300e1
	.xword	0xf2bbc811b125255d
	.xword	0x0666d643fb76f9df
	.xword	0xfe79e54d294c9120
	.xword	0x6ec45a258e6d02e7
	.xword	0x96d137036beb05b3
	.xword	0xd789a29e85f52cc7
	.xword	0x3636d17b95b3a791
	.xword	0x8d52349afd7d7dad
	.xword	0xabd447abaca98126
	.xword	0xcb87f38738034c67
	.xword	0x07f911b2f134fc62
	.xword	0x337892f18c6241a0
	.xword	0xb47be39d31e17b84
	.xword	0xab2f25df65f8509f
	.xword	0x96603f6c76866365
	.xword	0x7db60280b90cbc38
	.xword	0x9aecabd2894aa45c
	.xword	0xa2e2fc267b356d9a
	.xword	0x38a880d167746b85
	.xword	0x6e54ab015e6ba158
	.xword	0xe3d7fe06036a69fb
	.xword	0x31eaa78a363c17e4
	.xword	0x7d871e9cab77ff20
	.xword	0x92dfd5a180d4995c
	.xword	0xa6b3e4d98c8ed8cf
	.xword	0xa1bf466aa5b26b26
	.xword	0xf2f361cdfb02f2f7
	.xword	0xb74f67c63e42c4d5
	.xword	0x5841cfed36f809af
	.xword	0x21eea961d99a451d
	.xword	0x1c13b02b21da1f8f
	.xword	0x72c64e5723f14dae
	.xword	0x6f161c19ec9bc230
	.xword	0x46c3c8878da978ce
	.xword	0x5d4df5ad7c476902
	.xword	0x68baf116bfa4075d
	.xword	0xd30836f77188002b
	.xword	0x17eef666249b2961
	.xword	0x2035ff7d6447f888
	.xword	0xef0645d8ca5c86c1
	.xword	0x18f2b4a53b3a5658
	.xword	0x239702e72ab3a604
	.xword	0x7eca04265569c31c
	.xword	0x2611229ebe21c701
	.xword	0xd0913a5a56ab4838
	.xword	0x9e90bf3bc746fe57
	.xword	0xae5bf17635f1b92e
	.xword	0xe4dd276f708e639c
	.xword	0x56cd511e6898397a
	.xword	0xf48433c51d410206
	.xword	0x1441d1c2d755a624
	.xword	0x8180d0589416f283
	.xword	0x01bb8298db7801c5
	.xword	0xfb09c810b4b1436c
	.xword	0x895b2f2fd9ca7cf7
	.xword	0xd3aa6ab92dbe1a8e
	.xword	0xcc68a8551c1c25ee
	.xword	0xc63263092a5ef349
	.xword	0xf02c913118913218
	.xword	0x02ad76ba621b075b



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
	.xword	0xf9eb2cbf52f47de0
	.xword	0x89b4b27181fcdc81
	.xword	0x90d6af7330e3149e
	.xword	0x8890e9e53785233b
	.xword	0xe4e41ff5c12f789f
	.xword	0xc91008ec25e72317
	.xword	0xcd9c8b1942bb8468
	.xword	0x912a04b5c9870b0a
	.xword	0xcbb17b287cc3bb24
	.xword	0x8babf661f4fea804
	.xword	0xf0b19386e6e00eb3
	.xword	0x0034dfb2441641ce
	.xword	0x2621ed6fd48dbd8b
	.xword	0xf203c5487975bef8
	.xword	0xce66f9438605ecac
	.xword	0xf078beabf3953682
	.xword	0xe3d4f4de60dc5aa6
	.xword	0xfa2050a755ac54cc
	.xword	0x304c9da9dadc6bd7
	.xword	0x870f3aba63de7e42
	.xword	0x152ce307d4588405
	.xword	0x38c801892e6bc69b
	.xword	0x48c380c56ce1e18a
	.xword	0x9418d478079fed03
	.xword	0x0937bf9c4fa06b4f
	.xword	0x481b3cc78e9f7e08
	.xword	0x033f3babccff3719
	.xword	0xc6a070194a9bb5c8
	.xword	0x75618e5e8c76720e
	.xword	0xa58355b8d266c35b
	.xword	0xb0b34c65b4daece6
	.xword	0xfcbffbffdd0d8525
	.xword	0xbc546cb5b6e4f7c1
	.xword	0x57a61164584ce2ae
	.xword	0x432812ba50f408ce
	.xword	0x78d1f0da2b4ace3e
	.xword	0x5fa41c1222174518
	.xword	0xd99b9d5082582803
	.xword	0xaee9780cec0967bd
	.xword	0x0261083adf9227d0
	.xword	0x8d42a2531535750f
	.xword	0x9ee2315e00fe7680
	.xword	0x77e4510ffc9b69c6
	.xword	0xec329d04093bb4c3
	.xword	0xaced133cbda05253
	.xword	0x8d4f047980756b91
	.xword	0x3ba627c995177f9c
	.xword	0x3686fa41fcf47e08
	.xword	0x586d401a0f17abb2
	.xword	0xe72c44e3285e6d89
	.xword	0x13962d6be3719b8e
	.xword	0xbe37d04a289a3116
	.xword	0xa801cfe8506aefea
	.xword	0xa734a66fc470ea87
	.xword	0xb7a7f25243234d5a
	.xword	0xc5667f35c03838fb
	.xword	0xe3b86106bec15ca1
	.xword	0xa52f57fd0fe6cba4
	.xword	0xda8b503d126d3752
	.xword	0xbe57479fb3d02c0a
	.xword	0xa3fee07f9850ceed
	.xword	0xe582ef95017d41df
	.xword	0xbc4fafd8dfe016ef
	.xword	0x5c31624a534c3c16



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
	.xword	0xd71acee197e44151
	.xword	0xa0d23de155770b89
	.xword	0xd476cf3090d25cd2
	.xword	0x294f51f3cd742c87
	.xword	0xe3d2f95e758c77e5
	.xword	0x71389ae826eaa039
	.xword	0x8e0c5ce4c89bbab0
	.xword	0x9a4fb289318850d1
	.xword	0x59faf902d5ee7f5c
	.xword	0x2f204559f17f34d4
	.xword	0x7b4bd9ed35f55c81
	.xword	0xbc705e64f2619659
	.xword	0xda4237d2fb4ed850
	.xword	0x0ba028cd7fadcd9c
	.xword	0xbddd0715e0a8e30f
	.xword	0xe16c64b302d44773
	.xword	0xad3d1729b9ad8dd7
	.xword	0x161a537ed4b7cf84
	.xword	0x3da852a32b12be43
	.xword	0x2e217de6971eaac0
	.xword	0x93422cc3b5b836bf
	.xword	0xefd0e969e88cba0e
	.xword	0xaaa59ae98554a0fb
	.xword	0x070459c8b888819e
	.xword	0x56874430ff84a777
	.xword	0x755554a91698a77a
	.xword	0x30f8fa35566609e2
	.xword	0xce6f0be89683a655
	.xword	0x6999a7c9b40f1679
	.xword	0xd3f60e97dd2b6125
	.xword	0x0f01138545c4ea05
	.xword	0xc39567115bc096ae
	.xword	0x4ffc3d27135c4abc
	.xword	0x8de8af62bb5a4446
	.xword	0xcc025647025b89de
	.xword	0x3ceec1604eab60ef
	.xword	0x47fc52720e3af86f
	.xword	0xd98083110548acf5
	.xword	0xa24568529313dde4
	.xword	0x8652ddcaca1a31d2
	.xword	0x2e0c2f4241954bab
	.xword	0xfb7dee7d2c5ba519
	.xword	0xf27fef03f8296555
	.xword	0xa9a978e11e66b7e6
	.xword	0x470a141ca6c20c77
	.xword	0xd2d0680b4728a349
	.xword	0x4fc365ff7f6b27e7
	.xword	0xe4ab3fc4db1cf859
	.xword	0x7f4433068d0c1c68
	.xword	0xf4afd0c74ec3cbb3
	.xword	0x6472755f414928ca
	.xword	0x1e4d86608b9683c3
	.xword	0x53cfbe2f97c78716
	.xword	0x10e888016b4cc0b0
	.xword	0xb7921a3acba87ba2
	.xword	0xfe8c90dce994f5b9
	.xword	0x2301a17ebd227cf6
	.xword	0xa8d314fc06b65208
	.xword	0x09efa8ce335f3227
	.xword	0xa6c2597966f84bdb
	.xword	0x123de433d29d4562
	.xword	0x0871c70c3dd4b329
	.xword	0xd97052086e6d430f
	.xword	0x3cf97196835740a7



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
	.xword	0x004dc0c3cee87ddd
	.xword	0xf324911ea2fa25e6
	.xword	0x9cbd420f292dbc17
	.xword	0xd2dbfce5f9ab8405
	.xword	0xe4e24a1e60c35554
	.xword	0x7510af12d9895ad8
	.xword	0x50565bec90dba26f
	.xword	0x586f250a8ef3e060
	.xword	0x37307919b3b2924b
	.xword	0xb3a95ab408a08577
	.xword	0x40567bcae71d3688
	.xword	0x0c77999ca372d708
	.xword	0x945d145d38354718
	.xword	0x89b7098f70367d2d
	.xword	0x61f51ec1ae1a85be
	.xword	0xcf662dee8be2885a
	.xword	0x4e10385fb4dcebe5
	.xword	0x2997cc914b1ba4ab
	.xword	0x7f57949a985391f6
	.xword	0xe6d683d64027625c
	.xword	0xc53f37d7c1c1e422
	.xword	0xab49403354f32815
	.xword	0xda11a8940af5af09
	.xword	0x80d75a3c778bf0b5
	.xword	0x75b6c7226be3f536
	.xword	0x2e3df5e0d35d1198
	.xword	0xa1001028000e3224
	.xword	0x85bcbfad7c8e3de1
	.xword	0xb50afb27b5ddc08c
	.xword	0xbdbe011289071286
	.xword	0x6d2bb1c8f68c8cd5
	.xword	0x08ea49d7f60edfe2
	.xword	0x6db9bd065962b728
	.xword	0x6964a489c507f3f0
	.xword	0xb6564e84d83245ac
	.xword	0x2b83149dbade2986
	.xword	0x9e1cbe7dc42e82bd
	.xword	0xcc9e93525ace2573
	.xword	0x83863568fb49cdac
	.xword	0x23d9ec6d027843f7
	.xword	0x7b16c9daddbf169e
	.xword	0x2bb94ace0c635c45
	.xword	0x2c85b524e554cd40
	.xword	0xfc04535cc6532309
	.xword	0x9b2b598ab054de8d
	.xword	0x90cbf8a89277a568
	.xword	0x32d892fc52902894
	.xword	0x51272d7031eb92ad
	.xword	0xce6f16c8cd892f06
	.xword	0x527689c337167e55
	.xword	0x6bd1ae64c6974b30
	.xword	0x4b92f33c1b4b6704
	.xword	0x239f644946555b90
	.xword	0x192b4d74bb23676e
	.xword	0xd8fd2c515baf3734
	.xword	0x1ecda4d4bc84e1ef
	.xword	0x45ad84170e3e7daa
	.xword	0x4c0d575baf3ab803
	.xword	0x1c20fea433f4d5e7
	.xword	0xb6c3b3cecd79504a
	.xword	0x8aa2e370ecebffd4
	.xword	0xe7ad9515fecd5ab7
	.xword	0xd26914be5d9ff662
	.xword	0x47dfe0ca6d033167



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
	.xword	0x0b28461807328405
	.xword	0xef4fdc5f516103f5
	.xword	0xca2b49bb10adb818
	.xword	0xc9bdf82b893340c3
	.xword	0x7312054032e2db85
	.xword	0x0787881eedd72c5e
	.xword	0x6d6b8dbf8391cc9b
	.xword	0x35e351f8a5262b0c
	.xword	0x54b25e49e5bfecdf
	.xword	0xa3f4a7466ac9119d
	.xword	0x47eaaa4e31b84e12
	.xword	0x6aef24a95cf14d83
	.xword	0x55beeb3e754fa766
	.xword	0xe4bd18b81757e404
	.xword	0xd6555b68aa43dbd9
	.xword	0xd2b848019b1d4b7c
	.xword	0xd1dd7a2e3ed92743
	.xword	0xabe2c0e10797e77a
	.xword	0x6bc7fcb8f48cda63
	.xword	0x2c10c593cd08b434
	.xword	0xe9d42f6fed3690e1
	.xword	0xe7f3708397a42b8f
	.xword	0xc224eac9e68d98ae
	.xword	0xb60a4a658ccbcd67
	.xword	0x1e171b98881356e1
	.xword	0x8a2ab0018eeb1b30
	.xword	0x4bb32fde036d09f7
	.xword	0x7c8a5594c83c5cf1
	.xword	0x643213f13895c865
	.xword	0xcc1810e0a0ad372d
	.xword	0xb86ca811b9a00500
	.xword	0x70fb38f6aa61714c
	.xword	0xa5ba81f9792918b2
	.xword	0x67d0ce5ab6cf09ac
	.xword	0xe67662773af365d4
	.xword	0x330408c4bc9300ef
	.xword	0x42822010e70b200e
	.xword	0x3bd34bf0ffab9bb9
	.xword	0xc3a60ab7cc9e671f
	.xword	0x2e5588d01168f1d8
	.xword	0x1af43a6d23a35b15
	.xword	0x15d18ac379a9c69f
	.xword	0x81c3b163798c3c53
	.xword	0x87132080793add7f
	.xword	0x407d30039088140b
	.xword	0x678f6d493986e0bd
	.xword	0xf0f5babe23e3343c
	.xword	0x1f32e2099640d295
	.xword	0xaf296330e52723fa
	.xword	0x998bb3c9f776e90f
	.xword	0xad312517a65b9469
	.xword	0xc93eec31ebcd915c
	.xword	0x222f59b5b07b7e98
	.xword	0xad321daea8f5ae40
	.xword	0xa7a6978e34a2bedd
	.xword	0x1d0d0f4b31d638ed
	.xword	0x2d469f564faf5033
	.xword	0xa636509a6745cbfb
	.xword	0x05966986a2b58de5
	.xword	0xc79fcdd47dc3fdd8
	.xword	0xda5737698f5a54c4
	.xword	0xa0d5f418fe141a71
	.xword	0xac58705e4d647eaf
	.xword	0x9766c9693d4ce6e5



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
	.xword	0xfc10594973c3a1da
	.xword	0x3fc1342df969ac24
	.xword	0x7cfda2e49cfcbfa9
	.xword	0xa8a13333851fe012
	.xword	0xf530884dfd336572
	.xword	0x389d8cab73d500da
	.xword	0x44a5f53ff71bbed1
	.xword	0x8e659e87259040a9
	.xword	0xcad52b40e31d8c7f
	.xword	0x10e7859aefe9a6d1
	.xword	0xf45a6b90a2035d83
	.xword	0x0ceae09bac4d69a0
	.xword	0x174f26a5cf8d7231
	.xword	0xb68781d3e0055f64
	.xword	0x1291e0d6c2d3315b
	.xword	0x580336051b7f8e90
	.xword	0xa480f20406268e3b
	.xword	0x9b73b23b45a295a4
	.xword	0xab12069e6debf035
	.xword	0x11fd961ca085ba06
	.xword	0x0331d688482a1e79
	.xword	0x1dbd390e028a72db
	.xword	0xaccb043ea494dd26
	.xword	0x448c9b07967589b8
	.xword	0xef7129d43741ef29
	.xword	0xfe57fedaadac0b55
	.xword	0xddd7f8cf070efe9b
	.xword	0x13e53400bc327afa
	.xword	0xaa444abc56cca67c
	.xword	0x9e3b5802f5562a80
	.xword	0x5be75968112865f8
	.xword	0xd5343eb4d8e23d56
	.xword	0x4f105ad56e2f9423
	.xword	0xb3e97debb22bb2ba
	.xword	0xae5389c7acb3d664
	.xword	0x4d35b7bff8266092
	.xword	0x021643371e2ebc90
	.xword	0x0443d97399a99002
	.xword	0x6e1c15c9ac1aed80
	.xword	0xeb86795024d0ce95
	.xword	0x212a1c6b2cb375ab
	.xword	0xf89efa2f6d996b5b
	.xword	0xe8329f88b16aa554
	.xword	0xe09b912daf7b46bb
	.xword	0x4894419f050b60e3
	.xword	0xc5f40bb84c884562
	.xword	0x8bb80014b6b0a1d6
	.xword	0x7e474be45e92f7a0
	.xword	0x5fd17f4a0454a5a2
	.xword	0xb54e2c91ce8fe513
	.xword	0x088ac6b7afbc9be8
	.xword	0xc2ef01a256348982
	.xword	0x52b83c5aab02b0d1
	.xword	0x6e6ac2d087f7d0eb
	.xword	0x0f37a9a5bf0b77cc
	.xword	0x64b7fc019cf1c14c
	.xword	0x239fe3b00df6efaf
	.xword	0x010ae1d053ee641b
	.xword	0x90199a3124842236
	.xword	0x39497910cb4bc788
	.xword	0x7463135417e49a1c
	.xword	0x78cde0c4ace8eefc
	.xword	0x597c258ed3b29c59
	.xword	0xe1fec83d9d94c7b7



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
	.xword	0x549f6a8275cdb510
	.xword	0xcb7d8df195075b81
	.xword	0x0c6a3818a01d4438
	.xword	0xdf3a66daf95e18b5
	.xword	0x35f546dceb4eea27
	.xword	0x8c8bac0c776df785
	.xword	0x70cdcb3c5ab90ff0
	.xword	0xff94eeeb9332eec5
	.xword	0x188a393af4692ca4
	.xword	0xef1aa264824bf871
	.xword	0x29fd2a922f253144
	.xword	0x4fab7a5733e58e02
	.xword	0x84c37279c8e18294
	.xword	0xd77cdf8c9d3f9c42
	.xword	0x1d9a64a448510f2d
	.xword	0x9d9da7d626300b28
	.xword	0x5827b22d2cebe8f4
	.xword	0xeacf7dbea83a5394
	.xword	0x292075016afd7b50
	.xword	0x67c6d3fe78038639
	.xword	0xcf158ae0d3cc7c80
	.xword	0xcbc991001077aa6e
	.xword	0x7bc77f53f034b4ed
	.xword	0x5252c36527be21ee
	.xword	0xbd5847b8ce9114ef
	.xword	0x27db1e0d6f0d6c05
	.xword	0x4c67c338dbc81b24
	.xword	0x7a38f720a6fc6c9f
	.xword	0x72ce806e5566813f
	.xword	0xa4ca5d39cb59c317
	.xword	0x94d9b3101a178d64
	.xword	0xd9e8dfa3c131da41
	.xword	0xf1d31452a379b6cb
	.xword	0xacf7ddf7ee79552d
	.xword	0x4c2f45a3a4fe3eea
	.xword	0x35f9ac5969df2dbf
	.xword	0x21321ef0d5906093
	.xword	0xa0e48e161ac6f15f
	.xword	0x43d18aeb8232fb55
	.xword	0xb47718400e4b193b
	.xword	0xeb86426861f8411d
	.xword	0x7c5fbbf4bff7bcac
	.xword	0x30587a9839180d7f
	.xword	0xf826ee4233f0d77e
	.xword	0x282dce032b93fb55
	.xword	0xc1e0789381e5879f
	.xword	0x7210670c33d8662e
	.xword	0xb1fdb11dbafc45f7
	.xword	0x97f07948239063a5
	.xword	0x9d46e7aeedda706f
	.xword	0x09d8eb5198106605
	.xword	0x2e1eb33fe2f39a55
	.xword	0x2d0f74fd5ed264e1
	.xword	0x2469b075bbf55c46
	.xword	0xb1c8085dcc2d1260
	.xword	0xf57c8413e8c0d83d
	.xword	0x0085859401aa8e1a
	.xword	0x0ca06fa151e707f2
	.xword	0xb515e20490e7a4c9
	.xword	0xbacd966d0616ece2
	.xword	0x5dcc8d3b4da1fdb1
	.xword	0x97506526612fa464
	.xword	0xc9aad1f0f3323e3e
	.xword	0xffb599340d60ba73



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
	.xword	0x327b8f3357735a12
	.xword	0x3f22d35613a959db
	.xword	0xa937f33b673a1d2f
	.xword	0x108c2bb102e4447c
	.xword	0x877a932d59aa8692
	.xword	0xb1e425e5258364f0
	.xword	0xf61dbec4953ab661
	.xword	0x3b66ec9246c95715
	.xword	0xa3596f06bfd8d431
	.xword	0x846a08d74755ec17
	.xword	0xa313b2f53bd221af
	.xword	0xa7aed8d96ccf003b
	.xword	0xe6daac9223cc2779
	.xword	0xc39e43dad5f21e42
	.xword	0x9e2abe2efbcd50c8
	.xword	0x76d454cfaec64093
	.xword	0xa7ecb4a8a784a5e5
	.xword	0x92e90b296afecead
	.xword	0x7541f58f6f40da70
	.xword	0x8ebeaab8fb56fd77
	.xword	0xc2e8831c126ffc8e
	.xword	0xbb9233729fbb1e6e
	.xword	0xdfa5917ff2e6a09e
	.xword	0x0dea51a04011f39b
	.xword	0x33b88da0976a2d68
	.xword	0x5b5b134f98153470
	.xword	0xfff120f76ce7d71c
	.xword	0xd30c18120baaf672
	.xword	0xd6a4424800bb96a6
	.xword	0x25ab6c0d84a691a4
	.xword	0x59606852ba49b7f7
	.xword	0x27c5a8c456ca8907
	.xword	0xe6f13fac300ca517
	.xword	0x52bbb59bffcb1070
	.xword	0x3e15de02923e6c2b
	.xword	0xbdba830d10a6ff54
	.xword	0xab976b9ab1997c4f
	.xword	0x89f139c1eb60de4d
	.xword	0x615106a41fc5d246
	.xword	0xb923112a45d7643b
	.xword	0x8f59205d110683fb
	.xword	0xbe12ca10d2ae4d08
	.xword	0x2c42ab45898c5b37
	.xword	0x49c628299626b0da
	.xword	0xf3e61e894ac7a12c
	.xword	0xea23b756538a1569
	.xword	0x8616cfd942f8bb18
	.xword	0xce90b9aba1c32ad5
	.xword	0x8a27dd159593c428
	.xword	0xbad2b0b142c8bfa5
	.xword	0xda880d695e0dcad4
	.xword	0x2c89e24ede8c2596
	.xword	0xfb42704cb6dbebad
	.xword	0x3d5c921dd58cf6e9
	.xword	0x64c7758f53a26ad7
	.xword	0x1bea860a03363fad
	.xword	0x214e37d4e384b3f8
	.xword	0x2ff78cb183fa260a
	.xword	0xc5561965cc7cf9a0
	.xword	0xf7aab08a3036168a
	.xword	0xdd717598949b2788
	.xword	0xbd73270c0a333392
	.xword	0xe98f500fc2009f42
	.xword	0x8ee525e4d3b1fa2d



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
	.xword	0x989a1248ef3bbae2
	.xword	0x07baf78f7011bde9
	.xword	0xd2c6d7ddd19861fd
	.xword	0x323afef3614ff13a
	.xword	0x59df45a64edee74b
	.xword	0x35564e131b2d4629
	.xword	0xa272a18eba5f0d0e
	.xword	0x228525119a3594d3
	.xword	0xfa07339ab2f8ff9b
	.xword	0x5923717c68cbdf6a
	.xword	0xa6fad5f4d9d7329e
	.xword	0x25619d153183d61e
	.xword	0xa6d1476e4b5d3228
	.xword	0x2d949ee08ed68290
	.xword	0x3ccccc0df81da60b
	.xword	0x0e022c6f44399d46
	.xword	0x953efde4624b709e
	.xword	0x0e6c0d2e72199044
	.xword	0x188e9f8901b25892
	.xword	0x33283f0b61b51c40
	.xword	0x8c6eca4da6f1f87d
	.xword	0x22f4e63fbbb30dd1
	.xword	0xa9613a971fadf8ef
	.xword	0x39d32e1a07e97edd
	.xword	0x369f1027a82c2df1
	.xword	0x5cac2cf48a4fa361
	.xword	0xbbf2a63e9be0491f
	.xword	0xb5db5288bfacd6e3
	.xword	0x0701ff1d634c19fc
	.xword	0x31964e7b1db1505c
	.xword	0xcb8844f6ccd524b1
	.xword	0x461181edd9ac778c
	.xword	0x0180f02665fcb309
	.xword	0xbacfb1edba61d48e
	.xword	0x24f837d89f7fc4bd
	.xword	0x2ad61cf42f161037
	.xword	0x9efae20d3ea011e6
	.xword	0x7bb60b98024eab39
	.xword	0xce6a5f4f4e53426f
	.xword	0x7b0a67d7fd708d83
	.xword	0x3134895d85d54c82
	.xword	0x780a566d04b80645
	.xword	0x46a84617ec9594b4
	.xword	0x1d38a3f7e9e901cc
	.xword	0x94ec2efa6fd3fe8d
	.xword	0x656d3d9c0a120065
	.xword	0x4d6eb44cfb317e3a
	.xword	0xc8d0867a676ba3f6
	.xword	0xd6352a9813a6868b
	.xword	0x88cdee1d3cedaad3
	.xword	0xe82afe210c230559
	.xword	0x37e2a42f9871d104
	.xword	0x8446a73d2f85c5bb
	.xword	0x762eb65c84e86a12
	.xword	0x8bcfd1b3eee8a247
	.xword	0xfc96b6b6879b6f6c
	.xword	0x77d3aeb8f11c2958
	.xword	0x465db090fef5e52d
	.xword	0x49f2729ec6e30d72
	.xword	0x53904788bf8bf8f6
	.xword	0x4c4866a2f86ff02e
	.xword	0xd67c1d93c8f72913
	.xword	0x14bbd7092e077229
	.xword	0x4999ea629e5937ff



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
	.xword	0xc03f91426849c136
	.xword	0x46a48c9258a56e23
	.xword	0x68d37b095e4e1ead
	.xword	0xcc9eedd464a6af28
	.xword	0xbd45900be75b7d8a
	.xword	0x3b0a2d84073bdd13
	.xword	0x3b93b51366ffb004
	.xword	0xf9817c62a7c79bea
	.xword	0x8e85059ad8c83d54
	.xword	0x907443147ec0cb67
	.xword	0xf69492b13027ee38
	.xword	0x3852de0637f7b95f
	.xword	0x9b277160456988e4
	.xword	0xfac564451e66f140
	.xword	0x2f0a251e23ee4478
	.xword	0xb13e21a4a588ac85
	.xword	0x61343467bd28237d
	.xword	0x36f3a13b4340d869
	.xword	0x2e60fc2fec260270
	.xword	0xea4e9d9e986c55ea
	.xword	0x3dd95fe3dfa7c8e7
	.xword	0xf242114fda5b5004
	.xword	0xab6e3757eae713bd
	.xword	0xdcebc977f575dfd1
	.xword	0xb7b73792fe113b1c
	.xword	0x7e01dda534d30855
	.xword	0x3dda26b7a5404b73
	.xword	0xdf82c4840e92be71
	.xword	0xef98e75e36a6b5f8
	.xword	0x9c11ccbf4825297e
	.xword	0x26d906fa4b49a952
	.xword	0x0917c0d8b589a238
	.xword	0xa87b3b20b0c28edf
	.xword	0x62833f1eb310bbc5
	.xword	0x12788fbbc8e1af13
	.xword	0xea2836d73565f534
	.xword	0x54215547c384fedb
	.xword	0xea21a40008ee14c5
	.xword	0x2cc9778ef8078ec5
	.xword	0x7f84c546299ac512
	.xword	0xdae18e4a4c12a700
	.xword	0x83ac2272e85cc060
	.xword	0x74a7419c565bd000
	.xword	0x611edfc0e7116573
	.xword	0xd4338e01487110fd
	.xword	0xd49fe97845a2d41b
	.xword	0xce072f64729082ab
	.xword	0x80d03d04ea95c1c1
	.xword	0x03fa2e2778d9e374
	.xword	0x9ef47e85a3d50e61
	.xword	0xf49f6c6a77f97c62
	.xword	0xb620371e7bed791c
	.xword	0x6c17a5b887d4e842
	.xword	0x1637931d398ca888
	.xword	0xe4f47e6ad87318b9
	.xword	0x6aad41305102ebca
	.xword	0x1aa0c8b07d4bc638
	.xword	0xa47b2e153904f649
	.xword	0x1852ad54f22a8e4f
	.xword	0xb161a574a3c15c67
	.xword	0xfe60902b19e2df73
	.xword	0x3f8fd5940e12bfd3
	.xword	0x84e1b8036d7bc98c
	.xword	0x87d351ec456c766d



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
	.xword	0xc1c7d1e58fa5755a
	.xword	0x083109d410e0f618
	.xword	0x851a21fb00d242ea
	.xword	0x108d2dda100589bb
	.xword	0x9252008cdfd7ea44
	.xword	0xc4e5c18014f53170
	.xword	0xa76187342fe4b566
	.xword	0x4f391c16cbbc9945
	.xword	0x76eeae093a632d44
	.xword	0x2c6c8be955852e6a
	.xword	0xd205032e31733e4a
	.xword	0x6bb8286bd520ea8d
	.xword	0xbde742a5adc4b37e
	.xword	0xb5bb476da213fbb2
	.xword	0x44a2621201e97378
	.xword	0xadfa927c8315787e
	.xword	0xe32cbdf860b0787e
	.xword	0xf705d0f5ce312f24
	.xword	0xf24b72df29a25fbb
	.xword	0x94767c9170f94f8c
	.xword	0xcb78c2159b280941
	.xword	0xf5c7c23fb7ab842c
	.xword	0x3ec4efeb754cf26a
	.xword	0x29164fea34ad2efe
	.xword	0xb6d422441f5fbd63
	.xword	0xadc7dec9d948dddf
	.xword	0x536d25c3ff486cdf
	.xword	0x931be390122bf4e7
	.xword	0x51ec7a5761e931ad
	.xword	0x3a601a4534e17f07
	.xword	0x1c50d1cb6860956c
	.xword	0xba12d40d699237db
	.xword	0xeab3b93d807230f0
	.xword	0xd7be1d17e8018019
	.xword	0x8e7978fd90014c5d
	.xword	0x34124cf43bbbd680
	.xword	0x9b39725d060369d4
	.xword	0x14d951b183342ccb
	.xword	0xfcfbbc480a1ba00e
	.xword	0x228f234309891c78
	.xword	0x6e83176a3737ad32
	.xword	0x5635b23a528167c9
	.xword	0x17c9b77730d86094
	.xword	0x1b95515b3097379c
	.xword	0x527673d209038141
	.xword	0x2b41d769f6c4f041
	.xword	0x4f8b50ea65c5dc06
	.xword	0x6fe65b34a3cb2cfb
	.xword	0x1b5be5560b7c0a5b
	.xword	0xc479acc24189908b
	.xword	0xd4af7b7a18ae8928
	.xword	0x44542609eb4c851e
	.xword	0xb4608b774bbe29d3
	.xword	0xcd5a1201c611ebff
	.xword	0xed5f5966aeffa0fc
	.xword	0x4425e5cf4b798589
	.xword	0xcdb734c5142abaf0
	.xword	0x72e21860a9e664df
	.xword	0xa2ccac1f06ad2a0a
	.xword	0xbc88ae2ba6c46042
	.xword	0xfc720f7ee2606c0f
	.xword	0xa31bcd9e5bf96fa7
	.xword	0x5d9d078c738e647d
	.xword	0x3bdef3d515f34d1f



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
	.xword	0x137be92c52583731
	.xword	0x7128185a797824ad
	.xword	0xf1ce0617617d998d
	.xword	0xeed31a8dc293f829
	.xword	0x150359e79759da6c
	.xword	0xf961191366eb4ee7
	.xword	0x2e1b43bda509635b
	.xword	0x2dfde16500c4d7f9
	.xword	0x7389d2153c42b6e1
	.xword	0xeb1865324530cc81
	.xword	0xc0f208424ae64b30
	.xword	0xd22856abe5ce1212
	.xword	0x15428ec1c03fb417
	.xword	0x1a442aa21ae052be
	.xword	0x767c6ef96200347e
	.xword	0x066ec0d55a200e25
	.xword	0xea39ac29f44ab6e7
	.xword	0xf916960434500c60
	.xword	0x29062290f59c5cc7
	.xword	0xa3b60cb1b59360c2
	.xword	0xcf73756fcfaece0f
	.xword	0x53491ce40e829c2c
	.xword	0x7c948535bd92cf44
	.xword	0xbc29c89f451b2755
	.xword	0x41bd41cb37ea71d7
	.xword	0xbc992d0dbbcb8aad
	.xword	0x439295b4617139db
	.xword	0x86a2ac48adc1098c
	.xword	0x01e40647ea513578
	.xword	0xf78c1edeb8dc5f82
	.xword	0x3de1de4d6c73e20a
	.xword	0x564fe9839c34952f
	.xword	0x0af92ec8a5fc2195
	.xword	0x7e91566f62d9b7fd
	.xword	0xcf66272d218cad1d
	.xword	0x455b074e79d7c7b0
	.xword	0xa6e48e037c6dca2c
	.xword	0x7b2d3d328ba3c2b5
	.xword	0x9446d28991625f85
	.xword	0x2fc06ea57863f544
	.xword	0xbb3e154aa213192a
	.xword	0x853be1eea13a3346
	.xword	0x7ed60f0f7afb632a
	.xword	0xf6c9d8554284c221
	.xword	0x927354218bf38504
	.xword	0xb8684cfe21de0d21
	.xword	0x2c03635e4de32f43
	.xword	0x3d74ad08fab2cd3f
	.xword	0x17e51a2922013c45
	.xword	0xf9db953ecafb4575
	.xword	0xb7f3aaa591da2bcb
	.xword	0x8aa5cf5f4064920e
	.xword	0xfcf549822657eb64
	.xword	0x9d4b69f725b76f77
	.xword	0x94dc6f467100f656
	.xword	0x0e252b5feb60c6df
	.xword	0x5f2f4257ccf0a864
	.xword	0xe2b8ca5062d95eba
	.xword	0xfdd9c8475c6aea67
	.xword	0x56429ef4587edbcf
	.xword	0xfe803d667bd06fce
	.xword	0x8a7b79af910b3401
	.xword	0xc22f60876ec3183a
	.xword	0x2f919cb5dbde0f40



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
	.xword	0x77c776303ff5a5fc
	.xword	0x78503f9b02961965
	.xword	0x7fd0c4713abcecf8
	.xword	0x0118eaaf72fc187f
	.xword	0x631cf103d3c78b07
	.xword	0x3d5d1407bf0d1247
	.xword	0x7b7102149d9625f7
	.xword	0x1914e7ec89fe13d7
	.xword	0xefd859c864084e85
	.xword	0xdda49db7eee22c41
	.xword	0xd77e137bb0f9b6aa
	.xword	0x91c1aebf01780d1c
	.xword	0x218eca5e16cb3a2d
	.xword	0x20ffa810de8ddb94
	.xword	0x17137c3548684a11
	.xword	0x345410c475557150
	.xword	0xfaee62f3d1c0def0
	.xword	0x5165c6cb7edefd72
	.xword	0x9a82e02ab95a6711
	.xword	0x1726d500e66d4981
	.xword	0x93aaf5663e7c6be0
	.xword	0xe0ded5b493fe90e1
	.xword	0x2cceaacf635e225d
	.xword	0x4f9a811e63d3e7b3
	.xword	0x0be1caadfaef55a9
	.xword	0xd13ab121497256e5
	.xword	0xfaca34733c91fab4
	.xword	0xb5b189fc22fadb22
	.xword	0x1ebab202d081f0b7
	.xword	0xcaeaa97920a2e485
	.xword	0x69976bc741e89a7b
	.xword	0x0733b1dfb5f36147
	.xword	0x00b3e63937eb459e
	.xword	0x3a62965272b00655
	.xword	0xae6f00400ddcd967
	.xword	0xf60bbbeb792d3646
	.xword	0xd3ed637edaad9f7d
	.xword	0x2f04e48132400cdb
	.xword	0xa0324d629ef5d36a
	.xword	0xabf2acefeeb1316f
	.xword	0x1b875f7ccf34b788
	.xword	0x374f30ea688e8c6f
	.xword	0x0507100daf3e0a65
	.xword	0x4de73eb24cacd52c
	.xword	0x5215f5ec918e47fb
	.xword	0x44cc054bc3d800b1
	.xword	0x11ad0d4fe85b3940
	.xword	0xec803cb36172dd9a
	.xword	0xcc8c6e98a281c3d9
	.xword	0x0dd29d984ccec368
	.xword	0x5af1edcb0100d98f
	.xword	0x5ce9e78eabbc4b23
	.xword	0x01fd0f4322de1bad
	.xword	0x91639f1e7d9e1c48
	.xword	0xccecaf90ed932e29
	.xword	0x4dc579253a8c68f7
	.xword	0xe3c3dfa909ca5df5
	.xword	0x3f55248586aa6272
	.xword	0x025aab8d45b2879b
	.xword	0xb6e90328a290b35d
	.xword	0x7725368d256827c8
	.xword	0x4019e1cbd5a84188
	.xword	0x67d4e8f3b36232a6
	.xword	0xbf4643efc20830d0



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
