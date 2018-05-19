// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_blk_stld2_rand_1.s
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
   random seed:	820762879
   Jal pio_rnd_blk_stld2.j:	
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

!***********************************************************************
!IOSYNC cycles to start sjm
!***********************************************************************
!
!setx 0xdeadbeefdeadbeef, %g1, %g2
!setx 0xcf00beef00, %g1, %g3
!stx %g2, [%g3]
!=====================
!setx 0xdeadbeefdeadbeef, %g1, %g2
!setx 0xef00beef00, %g1, %g3
!stx %g2, [%g3]
!=====================

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

membar 0x40

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

	setx	0x00000010f0100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000003030c903, %r1, %r9
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



	setx	0x000000800e470748, %r1, %r9
	setx	0x0e10890ded630896, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9cc0d0, %r1, %r9
	setx	0x8a5a4942ad9be379, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8db73f4d0, %r1, %r9
	setx	0x79ba0e439d3b74fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbfd5c03e8, %r1, %r9
	setx	0x17284acdc5b9bb2f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x17284acdc5b9bb2f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e7ff325a30, %r1, %r9
	setx	0xdba86cda22ada4c3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xdba86cda22ada4c3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fe929a3018, %r1, %r9
	setx	0xd293bac7e2963ff3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xd293bac7e2963ff3, %r1, %r10
	stx	%r10, [%r9]
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
	setx	0x0000001080100000, %r1, %r9
	setx	0xd293bac7e2963ff3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000804eadc9f3, %r1, %r9
	setx	0x7ac37af1b8ae470c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e970eec, %r1, %r9
	setx	0x8d5d51ca7c19a086, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f264733, %r1, %r9
	setx	0xec3163428a2d6a61, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cec9aae97f, %r1, %r9
	setx	0x56eb45c31a9a44fb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d709b3ec35, %r1, %r9
	setx	0xe8e24fac65a35cee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb1938669d, %r1, %r9
	setx	0x766cf8e81e18ca2d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f7bd1ef054, %r1, %r9
	setx	0x220605a171cc9fa0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x220605a171cc9fa0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e1dc2b0, %r1, %r9
	setx	0xb670db0aaf9eaabf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb313dc, %r1, %r9
	setx	0x22c0d2de40307dca, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c3b99e4c84, %r1, %r9
	setx	0x0b7d189affe0fa4e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x0b7d189affe0fa4e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7d1fee300, %r1, %r9
	setx	0xe1c6685450c50fe7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea83b1625c, %r1, %r9
	setx	0xbdfb7d29d30788ab, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f87d5bd6bc, %r1, %r9
	setx	0x942b67cd110dc7fa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x942b67cd110dc7fa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ef59ba0, %r1, %r9
	setx	0x12adb45e9054572c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x12adb45e9054572c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f3b01b8, %r1, %r9
	setx	0x17b8165a51c2347f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc61d880e8, %r1, %r9
	setx	0xc589000df390a4f0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xc589000df390a4f0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000da2cf8aa88, %r1, %r9
	setx	0x0af16b15c36869a4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e372767f70, %r1, %r9
	setx	0x83eabb2a302ed984, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe59c3f608, %r1, %r9
	setx	0x27b2aeacedbe1ed4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e2a9878, %r1, %r9
	setx	0xe43f71cbed62a556, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xe43f71cbed62a556, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f00f7b0, %r1, %r9
	setx	0x9274437130bfb360, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce9eada488, %r1, %r9
	setx	0xda1b1e1c30b7aaed, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc7abcbfd0, %r1, %r9
	setx	0x248c7dce715d96bb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000edeb31e128, %r1, %r9
	setx	0x13feff3b190e6708, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x13feff3b190e6708, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f642a539d8, %r1, %r9
	setx	0xdadc94fd6236d884, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xdadc94fd6236d884, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000806411266d, %r1, %r9
	setx	0xdcb747fd6459f924, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec40c89, %r1, %r9
	setx	0x4577a4171d30be27, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fff3189, %r1, %r9
	setx	0x6c67544a8f2a7796, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x6c67544a8f2a7796, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cb8d539978, %r1, %r9
	setx	0xf5840af9b48a690c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d28ecb119f, %r1, %r9
	setx	0x45c6b21abebde287, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x45c6b21abebde287, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eabbfa0ffb, %r1, %r9
	setx	0x88177e56affc4a7d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x88177e56affc4a7d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fe5f83b6de, %r1, %r9
	setx	0x160b3f3062348ea6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e573de8, %r1, %r9
	setx	0xe1e9b70cc6552fda, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ffca140, %r1, %r9
	setx	0x843126146e687157, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf0c6ed3b0, %r1, %r9
	setx	0x6ea92d9b3287f967, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dafdfbbafc, %r1, %r9
	setx	0x0ab05adacf7fb72b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec6134b250, %r1, %r9
	setx	0xe3902bdba8e653c8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xe3902bdba8e653c8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f26379e0a4, %r1, %r9
	setx	0x32f56780ecc2b278, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea3d9e0, %r1, %r9
	setx	0x936f8f7b2c3db6f1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6a4580, %r1, %r9
	setx	0xab26429f4439554d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9490e7190, %r1, %r9
	setx	0x743e72e2377d9be2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3be58d088, %r1, %r9
	setx	0x66f363033ccad471, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000efb858bf00, %r1, %r9
	setx	0xb0d8d9770687b148, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4db412a38, %r1, %r9
	setx	0x4a7c2fd766ed8845, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cec9aae97f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r9
	setx	0x4a7c2fd766ed8845, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f264733, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ffca140, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e573de8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f87d5bd6bc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ea83b1625c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d7d1fee300, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f642a539d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000edeb31e128, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dc7abcbfd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ce9eada488, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ee744ca, %r1, %r9
	setx	0xc545a1fdde41c960, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fbb6ba8, %r1, %r9
	setx	0x25195c1601bd3e55, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0db6e79cc, %r1, %r9
	setx	0xb1c0e17dbb587572, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xb1c0e17dbb587572, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d7089276e0, %r1, %r9
	setx	0xe358918e46f77585, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xe358918e46f77585, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e6df36203a, %r1, %r9
	setx	0xc7c3fd21a6788dfa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fb2d89fe8e, %r1, %r9
	setx	0xe823867dba87b37b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xe823867dba87b37b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d28ecb119f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cb8d539978, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fff3189, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec40c89, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000806411266d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f7bd1ef054, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eb1938669d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e372767f70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da2cf8aa88, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x00000080c9bc59db, %r1, %r9
	setx	0xabdd75bbf94068f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e240d1b, %r1, %r9
	setx	0x86e3566ec15f89a6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x86e3566ec15f89a6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa14605, %r1, %r9
	setx	0x54fcf92b2b365fb0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc2823fe19, %r1, %r9
	setx	0x19695b048bf29734, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x19695b048bf29734, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d81d59339d, %r1, %r9
	setx	0x203d7cba819f0cae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e37ef10a32, %r1, %r9
	setx	0x1c99a86b9a802f01, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x1c99a86b9a802f01, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fbe6d83e2a, %r1, %r9
	setx	0x9a3d35b07f2a62d0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e445e80, %r1, %r9
	setx	0x813f677ed4f0a4c7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0eb2f4, %r1, %r9
	setx	0xd057af2feaf823a2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xd057af2feaf823a2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c02923cb50, %r1, %r9
	setx	0xcea7e552d2d72879, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7361a06d4, %r1, %r9
	setx	0x06a3fe39d71304b8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e9357308ec, %r1, %r9
	setx	0xc91d3baf07a07bcc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4226845b0, %r1, %r9
	setx	0x52b4769cb04c2d16, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eafcea0, %r1, %r9
	setx	0x837e572e5a14f8d2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc44b08, %r1, %r9
	setx	0x2443b61c7efadaac, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x2443b61c7efadaac, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cf9b338510, %r1, %r9
	setx	0x1f9638430cf56b48, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5a8ce6700, %r1, %r9
	setx	0xb61a47c1b4622ed1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e60e72e040, %r1, %r9
	setx	0x1c2feb2a9e0a7350, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f944afc418, %r1, %r9
	setx	0x8beca994858ea3ba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fff3189, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec40c89, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000806411266d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f7bd1ef054, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r9
	setx	0x8beca994858ea3ba, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000eb1938669d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ffca140, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e573de8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f87d5bd6bc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ea83b1625c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d7d1fee300, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c3b99e4c84, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fb313dc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e8c563c, %r1, %r9
	setx	0x551238495691de89, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f298cd4, %r1, %r9
	setx	0x0fe981c112dfcbb1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x0fe981c112dfcbb1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cc7c4ad074, %r1, %r9
	setx	0x522e499b1fe971d2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d9dc8e53bc, %r1, %r9
	setx	0x7f5efe5bb7d3f822, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5984b343c, %r1, %r9
	setx	0xcc1f2b05037ab463, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4783633b8, %r1, %r9
	setx	0x10a13a01bd431211, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x10a13a01bd431211, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ebe5d18, %r1, %r9
	setx	0xa60e6fa2e416e211, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb59310, %r1, %r9
	setx	0x2215a362c220f9ae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca2183b9d8, %r1, %r9
	setx	0x439a3d5666b4bbd5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9c3fe2558, %r1, %r9
	setx	0x790f6197b4e2f111, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e54b2a5978, %r1, %r9
	setx	0x79bc9800456d0b41, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f86cc27528, %r1, %r9
	setx	0x4e7e37f41653a7e3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4226845b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e9357308ec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d7361a06d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000805ebc903a, %r1, %r9
	setx	0x3466d64bd9fc1165, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8534b7, %r1, %r9
	setx	0xea3497e6c056c991, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f95220d, %r1, %r9
	setx	0x97b3c242d2629cf2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca7a191148, %r1, %r9
	setx	0xca7a329b79211461, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9f7972eb0, %r1, %r9
	setx	0x828f6634e0d88d36, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1ed8fa6e1, %r1, %r9
	setx	0x78c33f19304b408f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc4ab3f148, %r1, %r9
	setx	0x0e0e0dc62f02e7b7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x0e0e0dc62f02e7b7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e475d6c, %r1, %r9
	setx	0x86997e413ed0c7d1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x86997e413ed0c7d1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f3e2e5a, %r1, %r9
	setx	0xd786d4b9e7304562, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0dfdbc43e, %r1, %r9
	setx	0x777b73b3510d56a1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dcbeededf2, %r1, %r9
	setx	0x19dcca036c298413, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e40ac152dc, %r1, %r9
	setx	0x26b2959b4b1ac4c6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6cba68352, %r1, %r9
	setx	0xadebfab1068699a2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xadebfab1068699a2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800eff6f3c, %r1, %r9
	setx	0x9d13e437621650f1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4c6384, %r1, %r9
	setx	0x6eeac942d4bf3489, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c948b3be5c, %r1, %r9
	setx	0xf40545c801d9b53f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ddb3de9f50, %r1, %r9
	setx	0x08b2879f923a9d11, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x08b2879f923a9d11, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1fdf1c940, %r1, %r9
	setx	0x3a228af189e605e2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000faaa7d5684, %r1, %r9
	setx	0x7921988f3e2bf2a0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e37ef10a32, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d81d59339d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cc2823fe19, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fa14605, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e240d1b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080c9bc59db, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001010100000, %r1, %r9
	setx	0x7921988f3e2bf2a0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fb2d89fe8e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e6df36203a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d7089276e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e5984b343c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d9dc8e53bc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cc7c4ad074, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f298cd4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e7ff325a30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dbfd5c03e8, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x000000800e90519c, %r1, %r9
	setx	0x848876b491375d8a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x848876b491375d8a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff1c22c, %r1, %r9
	setx	0xdc5e8797f689861f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c21ac91aaa, %r1, %r9
	setx	0x8890258da41ddf95, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d454b29a2a, %r1, %r9
	setx	0x863f69b2af279a19, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x863f69b2af279a19, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef81b7fa6c, %r1, %r9
	setx	0x152c21ab0860a4f7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f68ec37e92, %r1, %r9
	setx	0x53657feec26a413d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e691718, %r1, %r9
	setx	0xf8c115c8f3ffc425, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xf8c115c8f3ffc425, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc33784, %r1, %r9
	setx	0xd66fb82bae5c96de, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c1c445a098, %r1, %r9
	setx	0x119e3d319a04776f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dac6543e94, %r1, %r9
	setx	0xd16b6d4523cc125c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e17183c530, %r1, %r9
	setx	0x94bfcf5cd7f909ab, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0d3828d9c, %r1, %r9
	setx	0x884d27dea493d9ec, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f95220d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e8534b7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r9
	setx	0x884d27dea493d9ec, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000805ebc903a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fbe6d83e2a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e37ef10a32, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f0eb2f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e445e80, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f26379e0a4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ec6134b250, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe929a3018, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e7ff325a30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dbfd5c03e8, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x00000080d4525dbd, %r1, %r9
	setx	0x9d24870ef41f3a2d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x9d24870ef41f3a2d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e5d04f2, %r1, %r9
	setx	0xa9d6600e5aecf949, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xa9d6600e5aecf949, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f194796, %r1, %r9
	setx	0xb5fe6669144434e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xb5fe6669144434e7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c9a32b9d27, %r1, %r9
	setx	0xe2474e443238d891, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d6ad2a2c4c, %r1, %r9
	setx	0x7e5cce8224d109e8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x7e5cce8224d109e8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e2b1dc9111, %r1, %r9
	setx	0x3657efaa3586fd9d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2b6e13480, %r1, %r9
	setx	0xf0f12934d3d1423b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xf0f12934d3d1423b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e880784, %r1, %r9
	setx	0xe00689accde152ec, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f68fee8, %r1, %r9
	setx	0xfebb8afc74bdfdc2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca9a340ccc, %r1, %r9
	setx	0xf0bc57349740d482, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d13d951b98, %r1, %r9
	setx	0x19ec355bdfdaacb2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x19ec355bdfdaacb2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000eb96e5bf98, %r1, %r9
	setx	0xc6b526b1fd10ca8f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000faced82784, %r1, %r9
	setx	0x04bdd64c19c10af7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x04bdd64c19c10af7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d454b29a2a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c21ac91aaa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff1c22c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e90519c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6cba68352, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e40ac152dc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dcbeededf2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d7361a06d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c02923cb50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000edeb31e128, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dc7abcbfd0, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x0000008071b86417, %r1, %r9
	setx	0x0108d73bca9860d2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e402f12, %r1, %r9
	setx	0x010dae2a1aa9052d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x010dae2a1aa9052d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe39bfd, %r1, %r9
	setx	0xa4b85a657dcdc3e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6bd1b6d20, %r1, %r9
	setx	0x5dd0584c357ad83e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d28ff77bed, %r1, %r9
	setx	0xf13a4da97f897caa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xf13a4da97f897caa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed3725fe9e, %r1, %r9
	setx	0xd56775577c6d13fb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xd56775577c6d13fb, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f22e48ec16, %r1, %r9
	setx	0x42d4cd6a581a027f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7e5aea, %r1, %r9
	setx	0x687971891eb8bef8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f44bc04, %r1, %r9
	setx	0x584c19bf1145f7e3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x584c19bf1145f7e3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c3c725d7c2, %r1, %r9
	setx	0xf34dcabb07e22672, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xf34dcabb07e22672, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d485b2d872, %r1, %r9
	setx	0x474dab73cabe4006, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e46ae43862, %r1, %r9
	setx	0x14201f99e9ef6379, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f7384f728c, %r1, %r9
	setx	0x26ea3d1188f4ace5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x26ea3d1188f4ace5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4c6384, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eff6f3c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4783633b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000802417194b, %r1, %r9
	setx	0x0a749172db304d20, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e059f22, %r1, %r9
	setx	0xf47e0b6580464494, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xf47e0b6580464494, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f5cf420, %r1, %r9
	setx	0x8a083769707e5e34, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0bc6cf1be, %r1, %r9
	setx	0xe1c22a5b8ba9121a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xe1c22a5b8ba9121a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d21156dced, %r1, %r9
	setx	0xd5a9c09e61845027, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xd5a9c09e61845027, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e67ffc62d8, %r1, %r9
	setx	0x59835eec61a7ba75, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f5416bd066, %r1, %r9
	setx	0x7d6806f4f8f2f354, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e64a9be, %r1, %r9
	setx	0x0e477ccaa664f9e2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x0e477ccaa664f9e2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ffb266e, %r1, %r9
	setx	0x055ddddd419068f8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2d6437e02, %r1, %r9
	setx	0xbfa1ec99a0c31b8f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de0f5b7128, %r1, %r9
	setx	0x48f81a72360ca8b3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x48f81a72360ca8b3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ea494ce974, %r1, %r9
	setx	0xf725cbc4043475bd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fee32d738a, %r1, %r9
	setx	0x87a3008f6d2061fb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9bb668, %r1, %r9
	setx	0x725887655a0ffcd5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f79a5a8, %r1, %r9
	setx	0x0a237e317c84d757, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x0a237e317c84d757, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cff8ba8b18, %r1, %r9
	setx	0x32608824cecc0b0d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4f4cf3ee0, %r1, %r9
	setx	0x7a387d159053a4df, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e650dd1e50, %r1, %r9
	setx	0xe2fa72d49182f29d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f9fbc58c88, %r1, %r9
	setx	0xfbe8292186336472, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e5d04f2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080d4525dbd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc4ab3f148, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e8c563c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4226845b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e9357308ec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d7361a06d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c02923cb50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f0eb2f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000804f905b90, %r1, %r9
	setx	0x1e111fd50d5160f6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efe2085, %r1, %r9
	setx	0x0a494200a6a1b509, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3eeee4, %r1, %r9
	setx	0x23796048b98ce6d9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x23796048b98ce6d9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c542e6b913, %r1, %r9
	setx	0x5921a1eee3c3e80a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x5921a1eee3c3e80a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d5d54d30b1, %r1, %r9
	setx	0x56dbe4869db0be3b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ebfdd587ea, %r1, %r9
	setx	0x3ab3feef9cdc826f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f116a1bdf2, %r1, %r9
	setx	0x4611824e7ff30f7d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ede5342, %r1, %r9
	setx	0xf586ae4aaf1e0999, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f6ac7f0, %r1, %r9
	setx	0xd9836d5e6bd8c1e2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1adfd0f7e, %r1, %r9
	setx	0x4f881aaa8b4bc6df, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x4f881aaa8b4bc6df, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d01fee9aaa, %r1, %r9
	setx	0x23a4e44cce96fcbf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e545272b9c, %r1, %r9
	setx	0x411f6a2f4f53d1bc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000faea9db5a8, %r1, %r9
	setx	0x048b73816f1aa95a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e4f96a0, %r1, %r9
	setx	0x9d417b67c7af326a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f900fb0, %r1, %r9
	setx	0x2f03db861a20a529, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4b5f6bc60, %r1, %r9
	setx	0x95af8e868ffcd367, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d937fe2bb0, %r1, %r9
	setx	0x30908f3bb94233c7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed27312588, %r1, %r9
	setx	0x23afb36874068b2d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f3e1630f98, %r1, %r9
	setx	0xdcaf3fbfeadbd4ae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xdcaf3fbfeadbd4ae, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ec40c89, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000806411266d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f7bd1ef054, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eb1938669d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001060100000, %r1, %r9
	setx	0xdcaf3fbfeadbd4ae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d709b3ec35, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cec9aae97f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f00f7b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e2a9878, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fe59c3f608, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e372767f70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da2cf8aa88, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cc61d880e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f3b01b8, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x0000001070100000, %r1, %r9
	setx	0xdcaf3fbfeadbd4ae, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e42c348, %r1, %r9
	setx	0xa79a324c8a7cf3a7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff72da8, %r1, %r9
	setx	0x5ad16e719d31e61d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb62cca950, %r1, %r9
	setx	0x9291ad3610de86d9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x9291ad3610de86d9, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ddb53300a8, %r1, %r9
	setx	0xea09cb6dd558a029, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xea09cb6dd558a029, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ee45e75ea8, %r1, %r9
	setx	0x9ffb77f44e9a185d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000febc4f4960, %r1, %r9
	setx	0xdcb21b3df8d825df, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xdcb21b3df8d825df, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e475d6c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fb2d89fe8e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f0eb2f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e445e80, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f26379e0a4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ec6134b250, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dafdfbbafc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cf0c6ed3b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cf9b338510, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fc44b08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eafcea0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4db412a38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000efb858bf00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d3be58d088, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000001000100000, %r1, %r9
	setx	0xdcb21b3df8d825df, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000809a8fc4ae, %r1, %r9
	setx	0x78059ee951f95a12, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3629d4, %r1, %r9
	setx	0x1b24b35fdd92a446, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f1b7f49, %r1, %r9
	setx	0x5b92c5c8995536fe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce5f3d944b, %r1, %r9
	setx	0xe1a07fe94a39f482, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1305d9064, %r1, %r9
	setx	0xe52a405fa625752f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3a7728559, %r1, %r9
	setx	0x63ea6b01f42901d6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa846ec9d0, %r1, %r9
	setx	0x8813c0a859f2327c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4c3e98, %r1, %r9
	setx	0xf3d5d73778b78b98, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f892b68, %r1, %r9
	setx	0xa235c4963f6fd6a7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8b8338098, %r1, %r9
	setx	0x9d6fb24b64e77cad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd087cfcd0, %r1, %r9
	setx	0x319bb3bdde0e82d8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x319bb3bdde0e82d8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000eee4a35428, %r1, %r9
	setx	0xbcf486b4917e7c62, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc119778c0, %r1, %r9
	setx	0xdd3567131256d034, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ddb3de9f50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x00000080d83e7905, %r1, %r9
	setx	0x8a710762c50fb146, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e52ba10, %r1, %r9
	setx	0xb36d2ad3f0068bb6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe61bae, %r1, %r9
	setx	0x966c2b7506d0328c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x966c2b7506d0328c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c23bdc2d80, %r1, %r9
	setx	0x76faff30e042bc83, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5d4b5ff7f, %r1, %r9
	setx	0x69f4a85e07d684e6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x69f4a85e07d684e6, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000eeeeff9403, %r1, %r9
	setx	0x8bfb256bc08c5ca3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc74311b9b, %r1, %r9
	setx	0xd4f936152186341f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e66c5f8, %r1, %r9
	setx	0x5ec77c8327c78a15, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f9c1a10, %r1, %r9
	setx	0x69c15d7cb939c2ab, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c43a7dc55c, %r1, %r9
	setx	0x6f7e0e0a96950604, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0658e4078, %r1, %r9
	setx	0xfd4793e8d260c23d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xfd4793e8d260c23d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e08759e248, %r1, %r9
	setx	0xd09db15b1dfec897, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fac7474664, %r1, %r9
	setx	0x09faca0450c8a1d3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x09faca0450c8a1d3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e59dd98, %r1, %r9
	setx	0xc3959da8e8186646, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xc3959da8e8186646, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f61b688, %r1, %r9
	setx	0x6a7296c5361ddf20, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x6a7296c5361ddf20, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cb420cd4c8, %r1, %r9
	setx	0x84533934b2a8f05a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0cd421910, %r1, %r9
	setx	0x41aa3a72f29d45fb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed1d1cfc48, %r1, %r9
	setx	0x187c7791626316bb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x187c7791626316bb, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f565543770, %r1, %r9
	setx	0x4ca296e29a67b55d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x4ca296e29a67b55d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e5d04f2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080d4525dbd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001060100000, %r1, %r9
	setx	0x4ca296e29a67b55d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc4ab3f148, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e1ed8fa6e1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001000100000, %r1, %r9
	setx	0x4ca296e29a67b55d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d9f7972eb0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fee32d738a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ea494ce974, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000de0f5b7128, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2d6437e02, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ffb266e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e64a9be, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d9dc8e53bc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cc7c4ad074, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e54b2a5978, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d9c3fe2558, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ca2183b9d8, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x0000001010100000, %r1, %r9
	setx	0x4ca296e29a67b55d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000803eb438b3, %r1, %r9
	setx	0x47c5202de2569cf0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x47c5202de2569cf0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e282e0a, %r1, %r9
	setx	0x370b8d0fb9a0f510, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4db7a2, %r1, %r9
	setx	0x76bca547584f8e34, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c87d7d1106, %r1, %r9
	setx	0xe1e3e6bda3285429, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3bf09afd9, %r1, %r9
	setx	0xd7b207c496a2719c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xd7b207c496a2719c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e59875f08b, %r1, %r9
	setx	0x0becb6b31aba0160, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f13a0058ac, %r1, %r9
	setx	0x6dbd79eb7063e78c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1dc8d8, %r1, %r9
	setx	0x0082291070f5fae1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f88a5f8, %r1, %r9
	setx	0x7b4438e6585c98eb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ccfe69d86c, %r1, %r9
	setx	0xdad30ab7b5fc988f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xdad30ab7b5fc988f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dfcbac54b4, %r1, %r9
	setx	0x6403a1be73e02ad5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x6403a1be73e02ad5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000eff736cc10, %r1, %r9
	setx	0x0633608aeba9d898, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f96b6c0ae0, %r1, %r9
	setx	0xdb27e1adfa007a5a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xdb27e1adfa007a5a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e615900, %r1, %r9
	setx	0xf4a2954454114874, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xf4a2954454114874, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ff60b30, %r1, %r9
	setx	0xcd59249b0035a49a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c878169180, %r1, %r9
	setx	0xfeb92fda12b6a275, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d863391cf8, %r1, %r9
	setx	0x05bcf6637027a255, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000efbb1e1db8, %r1, %r9
	setx	0x1c442a7e4b5837ea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x1c442a7e4b5837ea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcffcfff78, %r1, %r9
	setx	0xdbf1a5ad996bd1a0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dcbeededf2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c0dfdbc43e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f3e2e5a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e66c5f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000faced82784, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000803a8b18f4, %r1, %r9
	setx	0xfb7f67e6b8f60de9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed679a0, %r1, %r9
	setx	0x022f2c34c5506c28, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f20242a, %r1, %r9
	setx	0x1f8f667fcae9ac9f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x1f8f667fcae9ac9f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8975b81a7, %r1, %r9
	setx	0x359048127218b00a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0d6a633ad, %r1, %r9
	setx	0xaf566b17aaf29bb2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e23c3ca708, %r1, %r9
	setx	0x3139286974db85ea, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2afcd6767, %r1, %r9
	setx	0x27b8a4c16ef6f9c3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e76d0d8, %r1, %r9
	setx	0xc94e8f8a8c8a2dbc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f21c0aa, %r1, %r9
	setx	0x40a4d1a042a8adc0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2a142a25a, %r1, %r9
	setx	0x7918f892849de600, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4637a0446, %r1, %r9
	setx	0xb3460cec470d606b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef46ead264, %r1, %r9
	setx	0xd2a0b12a1ae21891, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fbe7520f92, %r1, %r9
	setx	0x0b354cc5ea69e4f3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e6e970c, %r1, %r9
	setx	0xde80a472ae4f8987, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f6a6fdc, %r1, %r9
	setx	0xe45535c02bc3863b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cebb54ad7c, %r1, %r9
	setx	0x7144e69f376de474, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7f4b7e9c8, %r1, %r9
	setx	0xc109e51c1170af48, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e31455982c, %r1, %r9
	setx	0x3b6f3642e772d61d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f3c84eba48, %r1, %r9
	setx	0xcae7e9cfb665b6dc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eea2e48, %r1, %r9
	setx	0x9b295655f4a4646b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x9b295655f4a4646b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f3cca10, %r1, %r9
	setx	0xdd37b3b18df2ffbf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xdd37b3b18df2ffbf, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cf98cbf970, %r1, %r9
	setx	0x44c4e4e1f6f2527d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9f65be6f8, %r1, %r9
	setx	0x4f3b89e8dfe0578c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e814a600b0, %r1, %r9
	setx	0xf08aeffeee72949c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xf08aeffeee72949c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f41f9cb908, %r1, %r9
	setx	0x1c0a508346966b4e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d454b29a2a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c21ac91aaa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff1c22c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e90519c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6cba68352, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r9
	setx	0x1c0a508346966b4e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e661ecc, %r1, %r9
	setx	0xf8de7c73c092be6c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd2f50e, %r1, %r9
	setx	0xd8ba79a3cc6ca6a1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c223ba2a54, %r1, %r9
	setx	0x09b1694aca8644ad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d85b5846bc, %r1, %r9
	setx	0xdd8c57e9f104a327, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2860941ae, %r1, %r9
	setx	0xc2d2bdc993a3db5f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fd3d49aac6, %r1, %r9
	setx	0x0cd864e1909714bb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x0cd864e1909714bb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ef3fd80, %r1, %r9
	setx	0x0b13faf1ce27c1b2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f8833d8, %r1, %r9
	setx	0x053ec0a7d741b00d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x053ec0a7d741b00d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cdf80cda20, %r1, %r9
	setx	0xfa643b020a12d289, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d75e72c6c0, %r1, %r9
	setx	0xdd5b0c9b42155143, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6a1564d94, %r1, %r9
	setx	0x6a35330e9773b904, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x6a35330e9773b904, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fe9c586624, %r1, %r9
	setx	0xf62612b9380b6ce1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ecc8e88, %r1, %r9
	setx	0xf6f6be0990201356, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fbfdf80, %r1, %r9
	setx	0x7965c463c6f606d4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c938d21770, %r1, %r9
	setx	0x97a5411948686264, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc90c465b8, %r1, %r9
	setx	0xdd290cda8774e51e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1e648eee0, %r1, %r9
	setx	0xdbf84aa510901bff, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe4c355ee0, %r1, %r9
	setx	0x59adf92377c1c9b5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x59adf92377c1c9b5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x0000001030100000, %r1, %r9
	setx	0x59adf92377c1c9b5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e51b970, %r1, %r9
	setx	0xa45fb4b3ea687c57, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f51ea2e, %r1, %r9
	setx	0x408b76dc718e1e86, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ce8a6f87f8, %r1, %r9
	setx	0xb8ada9b96f40d43b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ddaab8b544, %r1, %r9
	setx	0xff22989de96dbfd6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eae76a27da, %r1, %r9
	setx	0xf0d79cbbb8ba1bc6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe18a2f03e, %r1, %r9
	setx	0xbdf2df6a1d267b2b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e8a46e8, %r1, %r9
	setx	0x6b459bef2ed80382, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2d85c4, %r1, %r9
	setx	0xcac02df8b904532f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce1f8f71ac, %r1, %r9
	setx	0xf3fd99dac463a758, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000def94ea1e8, %r1, %r9
	setx	0x76289a3a6d001bef, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e96ba1f9b0, %r1, %r9
	setx	0xbfae5868f4b6d572, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f54d3f576c, %r1, %r9
	setx	0xd98e6b6a75d46976, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000008071b86417, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f2b6e13480, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001070100000, %r1, %r9
	setx	0xd98e6b6a75d46976, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e2b1dc9111, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d6ad2a2c4c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c9a32b9d27, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f194796, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d01fee9aaa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c1adfd0f7e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f6ac7f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ede5342, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fee32d738a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ea494ce974, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f79a5a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9bb668, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f86cc27528, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e54b2a5978, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x000000805ebc903a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fbe6d83e2a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e37ef10a32, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de0f5b7128, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2d6437e02, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f4c6384, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eff6f3c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x0000001010100000, %r1, %r9
	setx	0xd98e6b6a75d46976, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080dbc9dccf, %r1, %r9
	setx	0x0b3bcb3427846036, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef9938c, %r1, %r9
	setx	0xe741c0466eed8ffa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3c42c4, %r1, %r9
	setx	0x05ddeffdceb3b9f9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1e59e5758, %r1, %r9
	setx	0x468177fbf7fb7fae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x468177fbf7fb7fae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d07a600826, %r1, %r9
	setx	0x0a55df1ac151d33d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ebcf8c2c59, %r1, %r9
	setx	0xd4e8a6a77c66099c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xd4e8a6a77c66099c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f7c9266c5a, %r1, %r9
	setx	0x0d57921cf802fccc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef8ba72, %r1, %r9
	setx	0x690b84c204022606, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x690b84c204022606, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f19aef4, %r1, %r9
	setx	0x6ed236eae3e3a432, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c8d8389c56, %r1, %r9
	setx	0x39b8e56d02e72095, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x39b8e56d02e72095, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d821ad11a6, %r1, %r9
	setx	0x3333271b1772a467, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eee28ff930, %r1, %r9
	setx	0xfed3013e80218ce6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000feab571506, %r1, %r9
	setx	0xe4d4232d54bab66c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ead0028, %r1, %r9
	setx	0xb70736d5634e1cae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f651660, %r1, %r9
	setx	0xdfc6d2418af9b011, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xdfc6d2418af9b011, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c4adfa7368, %r1, %r9
	setx	0x8b63326f21f08e5e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6b59a4ea0, %r1, %r9
	setx	0x1465a1f06c026ef1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed56f5a100, %r1, %r9
	setx	0x0af9d0de1f825752, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f1c68935d8, %r1, %r9
	setx	0x61f8552a72dab33a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x61f8552a72dab33a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f13a0058ac, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e59875f08b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d3bf09afd9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c87d7d1106, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f4db7a2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e282e0a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001040100000, %r1, %r9
	setx	0x61f8552a72dab33a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000803eb438b3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fb59310, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ebe5d18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f944afc418, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e60e72e040, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r9
	setx	0x61f8552a72dab33a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x0000008055bd5612, %r1, %r9
	setx	0xf3f0bd8ed8e1666d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xf3f0bd8ed8e1666d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e2bf6bf, %r1, %r9
	setx	0x0c510803505b831d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f5dbb08, %r1, %r9
	setx	0x454878c5a81d8e9f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x454878c5a81d8e9f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cf4f065f7d, %r1, %r9
	setx	0x5b69f363f04a30f8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd08eda850, %r1, %r9
	setx	0x81b35b1863bf63b2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e91a209395, %r1, %r9
	setx	0xb87f223de81f554c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xb87f223de81f554c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fd94bee6a5, %r1, %r9
	setx	0x5bf853caa188a0d4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3eeee4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800efe2085, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000804f905b90, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f5416bd066, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e67ffc62d8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001090100000, %r1, %r9
	setx	0x5bf853caa188a0d4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d21156dced, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ea494ce974, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000de0f5b7128, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2d6437e02, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ffb266e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e64a9be, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f7384f728c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e46ae43862, %r1, %r12
	lduh	[%r12], %r11
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
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000001000100000, %r1, %r9
	setx	0x5bf853caa188a0d4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e23adfc, %r1, %r9
	setx	0x00980e18c4c0b3a3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x00980e18c4c0b3a3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f62d116, %r1, %r9
	setx	0xecc0418aac2dd300, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000caf7b5ea80, %r1, %r9
	setx	0xeced40737e572d9a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xeced40737e572d9a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2dc857768, %r1, %r9
	setx	0x54826c0b6375b92e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e8b3214444, %r1, %r9
	setx	0xcabf58f1011abf5c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0d5c730bc, %r1, %r9
	setx	0xf46b33b75842b721, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d7089276e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c0db6e79cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fbb6ba8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e66c5f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000faced82784, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eb96e5bf98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d13d951b98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ca9a340ccc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f68fee8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e880784, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c8b8338098, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f892b68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4c3e98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000febc4f4960, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ee45e75ea8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ddb53300a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cb62cca950, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000001020100000, %r1, %r9
	setx	0xf46b33b75842b721, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e99744c, %r1, %r9
	setx	0xd4f37f0dfa2ec375, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fbdff78, %r1, %r9
	setx	0x99f41cc4de4ec2de, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x99f41cc4de4ec2de, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cc2211a838, %r1, %r9
	setx	0xbce7db6174f26f06, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d116926b00, %r1, %r9
	setx	0x743f823973096f8a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x743f823973096f8a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1962493ca, %r1, %r9
	setx	0x763d2622f7ac7f99, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x763d2622f7ac7f99, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2c6d83ea0, %r1, %r9
	setx	0x2bdf0837fd16f765, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eef1214, %r1, %r9
	setx	0x822bda623ee89884, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fd97cc8, %r1, %r9
	setx	0xea5b29434ab175a1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9131b0e04, %r1, %r9
	setx	0xa7da79a14b2e581f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d1f9c9410c, %r1, %r9
	setx	0x68ef9159842f6edf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef86675208, %r1, %r9
	setx	0x470451eb32840972, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe7f797888, %r1, %r9
	setx	0x4344d7732d0d44a4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x4344d7732d0d44a4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e18a578, %r1, %r9
	setx	0x8adfb79c65901a3a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f26aee8, %r1, %r9
	setx	0x4bd4414edeb6d3e5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x4bd4414edeb6d3e5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca5f992f78, %r1, %r9
	setx	0xe825ae582267a895, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xe825ae582267a895, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d792c69b78, %r1, %r9
	setx	0xc8bae4fe81742a21, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xc8bae4fe81742a21, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000efe8adf4f0, %r1, %r9
	setx	0xdb2503c1ea09b91b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa7bbe6148, %r1, %r9
	setx	0xdd26c7a5d987a191, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f21c0aa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e76d0d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000faea9db5a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e545272b9c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d01fee9aaa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c1adfd0f7e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e1fdf1c940, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ddb3de9f50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c948b3be5c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f4c6384, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eff6f3c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4783633b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e5984b343c, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x000000800eac3658, %r1, %r9
	setx	0x904378ba6c222e48, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f822ea8, %r1, %r9
	setx	0x088ff627105bd6f3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x088ff627105bd6f3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c19fe66ba2, %r1, %r9
	setx	0x4120a4badf55df0f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x4120a4badf55df0f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d8182503e6, %r1, %r9
	setx	0xa4b1d648c10f063b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000efbc381b4a, %r1, %r9
	setx	0x814ff9adc33a12c3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f1a62bdeec, %r1, %r9
	setx	0xa290cc0c4c1e6872, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e48a7c4, %r1, %r9
	setx	0x01a3e6eb11362b90, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800feabf90, %r1, %r9
	setx	0xe0a617e87957d2e8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cbd0206b6c, %r1, %r9
	setx	0xb9cf609c988c8526, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xb9cf609c988c8526, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dce647b58c, %r1, %r9
	setx	0xfe651f1ce826f0fb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xfe651f1ce826f0fb, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e0c2cdf184, %r1, %r9
	setx	0x5e992cab49eb5873, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x5e992cab49eb5873, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa24da45d0, %r1, %r9
	setx	0x00159797a07193aa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x00159797a07193aa, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cb8d539978, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fff3189, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec40c89, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f6ac7f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ede5342, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ef59ba0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fe929a3018, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e7ff325a30, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x0000001030100000, %r1, %r9
	setx	0x00159797a07193aa, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080cec6eb4a, %r1, %r9
	setx	0x1ca6ccc6b995a344, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9fde6e, %r1, %r9
	setx	0x64c4f7291eae42c0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x64c4f7291eae42c0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f34394a, %r1, %r9
	setx	0xf4b2f35bbddde8d0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c705464ec7, %r1, %r9
	setx	0xe30a3649fd5a2343, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db254059e0, %r1, %r9
	setx	0xcafc5f789f09704c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e5795fc3b5, %r1, %r9
	setx	0x001d5fd02eb77694, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f42b0a929e, %r1, %r9
	setx	0x8d4f088474edfef8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x8d4f088474edfef8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e635fe2, %r1, %r9
	setx	0x98efdb83c8c7b7e4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fac8ef0, %r1, %r9
	setx	0x7cfbe9d176b9f344, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c9cad579e8, %r1, %r9
	setx	0x2c1b4f45d1ba5fc7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ddeb77b184, %r1, %r9
	setx	0x22dc661c4a8e9b87, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ebaa963e24, %r1, %r9
	setx	0x4a4cdfdbd5b6cb6c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fafde1e4a8, %r1, %r9
	setx	0x833ad4f4d8031a59, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3eeee4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r9
	setx	0x833ad4f4d8031a59, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800efe2085, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000804f905b90, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001040100000, %r1, %r9
	setx	0x833ad4f4d8031a59, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d454b29a2a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c21ac91aaa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff1c22c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e90519c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e880784, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0d3828d9c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x00000080dff77834, %r1, %r9
	setx	0xc27342cb663417af, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8780ee, %r1, %r9
	setx	0xa0cfb5914cb013bb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xa0cfb5914cb013bb, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f0735d4, %r1, %r9
	setx	0x5c6995f82a8f6c1b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c91d6ee3b9, %r1, %r9
	setx	0xb1014eda86fcf15f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d59f07caa8, %r1, %r9
	setx	0x3492033cbca7fff0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e04a43430f, %r1, %r9
	setx	0x1186b1fc999d3b55, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f68ba9e74e, %r1, %r9
	setx	0xfb1bcd46b7a3e7ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e73477e, %r1, %r9
	setx	0xe336b072d9924f8e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xe336b072d9924f8e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f94f1a2, %r1, %r9
	setx	0x45cfd8a4132897c2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c9fde90726, %r1, %r9
	setx	0xf8cde9a0cba7686a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d88c1d5402, %r1, %r9
	setx	0x4d008ee6668cbbf7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x4d008ee6668cbbf7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef850abd0a, %r1, %r9
	setx	0x58f5fb394daa1d01, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x58f5fb394daa1d01, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fec2ed2184, %r1, %r9
	setx	0x36d5afb5227829b0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ece2224, %r1, %r9
	setx	0xffc7aaa1f7e99706, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f7da928, %r1, %r9
	setx	0xb00fb34787d70a16, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xb00fb34787d70a16, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c191068e80, %r1, %r9
	setx	0xb26b2efb2b07fe96, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xb26b2efb2b07fe96, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d24adcb01c, %r1, %r9
	setx	0xbae276af0d2926a2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xbae276af0d2926a2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ecf906780c, %r1, %r9
	setx	0xb60f53257d075ef2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f08eb6db70, %r1, %r9
	setx	0x4670966ad3d7c9ad, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x4670966ad3d7c9ad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000809a8fc4ae, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001080100000, %r1, %r9
	setx	0x4670966ad3d7c9ad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f116a1bdf2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ebfdd587ea, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d5d54d30b1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0d3828d9c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e17183c530, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dac6543e94, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dc7abcbfd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ce9eada488, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f00f7b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e2a9878, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fe59c3f608, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e372767f70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da2cf8aa88, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x0000001040100000, %r1, %r9
	setx	0x4670966ad3d7c9ad, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080b2f8ec5f, %r1, %r9
	setx	0x5d054ccaf1ca3428, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x5d054ccaf1ca3428, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e0e3ccd, %r1, %r9
	setx	0x5f86e81a1e27653a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f51fee3, %r1, %r9
	setx	0xe5a7cd7852c9b865, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf60dac748, %r1, %r9
	setx	0x93d624dd89a24662, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d6ffea9344, %r1, %r9
	setx	0xa9750b733de7dcac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7643acd63, %r1, %r9
	setx	0x5ffe3fadd4d40ac7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f3411895fa, %r1, %r9
	setx	0x2772d906b45284ef, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7135e0, %r1, %r9
	setx	0xff82a59fc6428503, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xff82a59fc6428503, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f3616e0, %r1, %r9
	setx	0x865c0e3cd79bb130, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cbe8d8fee8, %r1, %r9
	setx	0x855171f2b1f106c6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x855171f2b1f106c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dae38235ac, %r1, %r9
	setx	0x6e9aaa0ac5fb6ed5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e18246b9ec, %r1, %r9
	setx	0x7779d6f98cda3399, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x7779d6f98cda3399, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f492f0b19c, %r1, %r9
	setx	0x1e8bacc0b1280030, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x1e8bacc0b1280030, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ebc0430, %r1, %r9
	setx	0x0a91bd4b8c764769, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb3bf30, %r1, %r9
	setx	0xb6cd70c98f58a0af, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xb6cd70c98f58a0af, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c0d7f16940, %r1, %r9
	setx	0x8bb753b8fabc31dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8518d1088, %r1, %r9
	setx	0x49caf9b6a65b3758, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e20af15d70, %r1, %r9
	setx	0x114ebabead30ddee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fb967988, %r1, %r9
	setx	0x605c90bdf64b8601, %r1, %r10
	stx	%r10, [%r9]
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
	setx	0x00000010b0100000, %r1, %r9
	setx	0x605c90bdf64b8601, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e35b4f6, %r1, %r9
	setx	0x73731d5e61955515, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f09e9d2, %r1, %r9
	setx	0x2cc6dbb81e61ed2d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x2cc6dbb81e61ed2d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cbabe0d342, %r1, %r9
	setx	0x6abbdc958fb82397, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5135f33c2, %r1, %r9
	setx	0x5f902f848b145f93, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x5f902f848b145f93, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ea989ee5e0, %r1, %r9
	setx	0x18cf9d0e68d53840, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4f2c50c26, %r1, %r9
	setx	0x95c1620d42d53bf9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ddeb77b184, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f3cca10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eea2e48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fcffcfff78, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000efbb1e1db8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d863391cf8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000001090100000, %r1, %r9
	setx	0x95c1620d42d53bf9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000802ecc54bb, %r1, %r9
	setx	0xc4cacb93fd5937c7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e71b20c, %r1, %r9
	setx	0x613629fc15ffb497, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd3ce8b, %r1, %r9
	setx	0x49ec90ff886f0610, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x49ec90ff886f0610, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c9a6f23e41, %r1, %r9
	setx	0xf039a647338396f7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xf039a647338396f7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d2587314b9, %r1, %r9
	setx	0x03f7cf70af938212, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea479bfb77, %r1, %r9
	setx	0xd0654d36d03b2875, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xd0654d36d03b2875, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f3ce37e8ae, %r1, %r9
	setx	0x3ef86a86e52a4f54, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef61b02, %r1, %r9
	setx	0xd46b5041f4634683, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xd46b5041f4634683, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f74c282, %r1, %r9
	setx	0x3b3449e5da1b674e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c4131abed0, %r1, %r9
	setx	0x096927f77a991f01, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5e1f60db4, %r1, %r9
	setx	0x18933fed49af13b3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x18933fed49af13b3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e85f0b4b46, %r1, %r9
	setx	0x66fc24c4da816cbf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f48e8a8bbc, %r1, %r9
	setx	0xb7dd3c52c0b68613, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e8deb64, %r1, %r9
	setx	0x8e15319758e42668, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f6ad7e0, %r1, %r9
	setx	0x31a7d3b6447c3cc3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd31b251d8, %r1, %r9
	setx	0x5a62c3f28b3f3050, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x5a62c3f28b3f3050, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000db76799250, %r1, %r9
	setx	0x909821f5a93b0ee0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e63e67b948, %r1, %r9
	setx	0xca76ae0becc5577a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc817b9880, %r1, %r9
	setx	0x50d9731100144ade, %r1, %r10
	stw	%r10, [%r9]
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
	setx	0x50d9731100144ade, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ecaa94a, %r1, %r9
	setx	0x87ce0b497023d1ad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff548fa, %r1, %r9
	setx	0x31935359d5c204af, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc50174100, %r1, %r9
	setx	0x1ea38ef69c976f72, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dfa8f02efa, %r1, %r9
	setx	0x240f4d96987edc8e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e40304867a, %r1, %r9
	setx	0x58d631c5ad6fb52a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f18ffc3fe6, %r1, %r9
	setx	0x0f6f0fe580cfce1c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x0f6f0fe580cfce1c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e0822d0, %r1, %r9
	setx	0x7d6715f765f4f1e1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff48454, %r1, %r9
	setx	0xd395504d4eb75606, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca83570aee, %r1, %r9
	setx	0xe282d3a3298d9cc9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d86c9e28c6, %r1, %r9
	setx	0x11bf951f24b0f80a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x11bf951f24b0f80a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e66b067f04, %r1, %r9
	setx	0x8eb5bc76114a849e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x8eb5bc76114a849e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fb16bb7c7c, %r1, %r9
	setx	0x16ad21612d7874b5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e56f078, %r1, %r9
	setx	0x6e341ec5f60dc8a7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f77c92c, %r1, %r9
	setx	0x69738f5e8e9a7ef8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x69738f5e8e9a7ef8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c67d0c15ac, %r1, %r9
	setx	0xbb5e0c6f20f1c43e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d2aaabcb9c, %r1, %r9
	setx	0x54ccbe97015d5578, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e30b66076c, %r1, %r9
	setx	0x8a1b454c4697dbea, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe415d1770, %r1, %r9
	setx	0x3845f5b12e8f58cc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x3845f5b12e8f58cc, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d81d59339d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cc2823fe19, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fa14605, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r9
	setx	0x3845f5b12e8f58cc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e240d1b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080c9bc59db, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fe5f83b6de, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r9
	setx	0x3845f5b12e8f58cc, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000010d0100000, %r1, %r9
	setx	0x3845f5b12e8f58cc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080a58f469b, %r1, %r9
	setx	0x560df24204d2e036, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee1ef4c, %r1, %r9
	setx	0x9b246a376397cdae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f53025e, %r1, %r9
	setx	0xc2a5ddf06d6dc4de, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca1f11535f, %r1, %r9
	setx	0x47b60417122d9fa6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df50c9a764, %r1, %r9
	setx	0x1fa0592111fc963e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed74e4568c, %r1, %r9
	setx	0xa0b8b514cb5a2f0d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f3ee62f439, %r1, %r9
	setx	0x709c6d091ae7bb71, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e95fd78, %r1, %r9
	setx	0xc9e734e2b346bd14, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f40c380, %r1, %r9
	setx	0x55a211a7395e3b03, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb7d690fd0, %r1, %r9
	setx	0x4d5cd58ea5f75642, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0863360f8, %r1, %r9
	setx	0x1e8efc61cf375da9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e175f59ee8, %r1, %r9
	setx	0x178900e2597b3012, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0c4595944, %r1, %r9
	setx	0x50af793e4886f88d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x50af793e4886f88d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e891d58, %r1, %r9
	setx	0x910d3f8ed9943d75, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f97d630, %r1, %r9
	setx	0x52221c5a367f3c6f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c024e42788, %r1, %r9
	setx	0x2109ab5400c35892, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dde80f4cc8, %r1, %r9
	setx	0xde1812745655db8f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e312ec8110, %r1, %r9
	setx	0x69a8da2bace070fb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe27a2a440, %r1, %r9
	setx	0xaa2b5db94a96cf9c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f3cca10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eea2e48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fcffcfff78, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000efbb1e1db8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d863391cf8, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x0000001010100000, %r1, %r9
	setx	0xaa2b5db94a96cf9c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ec84c40, %r1, %r9
	setx	0xeea0877a5b57184f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff8df5c, %r1, %r9
	setx	0x004601411a65f69b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd49638ebc, %r1, %r9
	setx	0x2ad8a7051e2e0502, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de9a30c9be, %r1, %r9
	setx	0x1948d51e8de7107e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e73e951a28, %r1, %r9
	setx	0x7e7551a86b58ceab, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f7b60ebe52, %r1, %r9
	setx	0xdf5fd0653e04d14a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1676d0, %r1, %r9
	setx	0x23dbc08ac01f02ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fefbdd8, %r1, %r9
	setx	0xdf90319a62c4434e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf734657c8, %r1, %r9
	setx	0x60893bcf67a0326c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd1fc64cb8, %r1, %r9
	setx	0xee96e805cce77d65, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e33fe4be18, %r1, %r9
	setx	0x8683e6aad85894e6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f80cd4e388, %r1, %r9
	setx	0xf86ce8edc47d01b7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6a4580, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea3d9e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f642a539d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000edeb31e128, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x0000001030100000, %r1, %r9
	setx	0xf86ce8edc47d01b7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800eddff94, %r1, %r9
	setx	0xf946f0c8ecad14d9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0a737c, %r1, %r9
	setx	0x95fba215c178662a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cad797ebb8, %r1, %r9
	setx	0xecf1548258b39988, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xecf1548258b39988, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dcc480fb50, %r1, %r9
	setx	0x6119fba663a0cc3d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e75accd660, %r1, %r9
	setx	0x7267c27df035a311, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x7267c27df035a311, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f23cc768c0, %r1, %r9
	setx	0x6deeb8f147625094, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e53c198, %r1, %r9
	setx	0x12a196bf0b7c6eb2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f524480, %r1, %r9
	setx	0x4fc9079a87f7c670, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x4fc9079a87f7c670, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce8750c240, %r1, %r9
	setx	0x0359ed403a635210, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d617b252e0, %r1, %r9
	setx	0xd862e9f2a646580d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8f24de760, %r1, %r9
	setx	0xdcf3635a279626be, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xdcf3635a279626be, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f5f1292418, %r1, %r9
	setx	0xd14ef64a635c7093, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3bf09afd9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r9
	setx	0xd14ef64a635c7093, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ef850abd0a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d88c1d5402, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c9fde90726, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f94f1a2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc817b9880, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e63e67b948, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000db76799250, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cd31b251d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f6ad7e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e8deb64, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000efbb1e1db8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d863391cf8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c878169180, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x0000001050100000, %r1, %r9
	setx	0xd14ef64a635c7093, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e7df230, %r1, %r9
	setx	0xf7fd27829f0c0416, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fca8f10, %r1, %r9
	setx	0x82e3bf01c9152fd4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x82e3bf01c9152fd4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4e8ce4924, %r1, %r9
	setx	0x462d78734f68ed03, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x462d78734f68ed03, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dfa2960f3c, %r1, %r9
	setx	0x0e0a176060144113, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x0e0a176060144113, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e69a9e527c, %r1, %r9
	setx	0x56c980d02a34d174, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fd9d295258, %r1, %r9
	setx	0x9f175a517509ec61, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f3eeee4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r9
	setx	0x9f175a517509ec61, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800efe2085, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000804f905b90, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d7d1fee300, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x00000010e0100000, %r1, %r9
	setx	0x9f175a517509ec61, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e3c793c, %r1, %r9
	setx	0xda9aa502e906ae05, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f609d1c, %r1, %r9
	setx	0xe65f1c28ac296ce2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf4796cd34, %r1, %r9
	setx	0x7ecf587ce9335f2e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db67a784e8, %r1, %r9
	setx	0xe9fa50b79df2e29b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xe9fa50b79df2e29b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e3cd66dc68, %r1, %r9
	setx	0x7b68eb3c46b74f77, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fd2062d0fc, %r1, %r9
	setx	0xa07e36443ba86f9f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e68c968, %r1, %r9
	setx	0xa7b1e0410e1272fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe5a800, %r1, %r9
	setx	0x9856bc2b7950a2b7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cbabb0a088, %r1, %r9
	setx	0x1e233756890149c9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4d8889498, %r1, %r9
	setx	0x367001fb6916c79f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb2e962380, %r1, %r9
	setx	0x30bc0bf0853274bf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x30bc0bf0853274bf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f35397fd50, %r1, %r9
	setx	0x5fd06bf5b2047fd8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e0e3ccd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001090100000, %r1, %r9
	setx	0x5fd06bf5b2047fd8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080b2f8ec5f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddeb77b184, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c9cad579e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fac8ef0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e635fe2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f1a62bdeec, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000efbc381b4a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d8182503e6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ef86675208, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d1f9c9410c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c9131b0e04, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fd97cc8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e304a80, %r1, %r9
	setx	0xf13aa41471ea4bfb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f479e08, %r1, %r9
	setx	0xb58e18e359a98da0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xb58e18e359a98da0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd472dbcca, %r1, %r9
	setx	0x1d8cf0e27455a45b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000deed02ae14, %r1, %r9
	setx	0x95561678b8281bb8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed79f77318, %r1, %r9
	setx	0x1995bd7928fbadcb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4c5f14e1c, %r1, %r9
	setx	0x7cf5991b7749793a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e674578, %r1, %r9
	setx	0x37f93e79473910cb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f993054, %r1, %r9
	setx	0xb5c5eea70ad3d4fd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xb5c5eea70ad3d4fd, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cd7e7412f4, %r1, %r9
	setx	0x25541b02e4148613, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x25541b02e4148613, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6444cb864, %r1, %r9
	setx	0xb098393d67acfad8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xb098393d67acfad8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000edc483c264, %r1, %r9
	setx	0xad8cf2cd45965142, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f3f9e4e2b0, %r1, %r9
	setx	0xfbac35d06ad3ded5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea86568, %r1, %r9
	setx	0x1449eeec00ec507e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb17b20, %r1, %r9
	setx	0xee29a7f30eacc3eb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xee29a7f30eacc3eb, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c4e6bd5b60, %r1, %r9
	setx	0x54cdb7fa90c4fd11, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d33fa91a70, %r1, %r9
	setx	0xfd7e251c65b41aec, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e035caa9f0, %r1, %r9
	setx	0x1b7c4e7b11945c2a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x1b7c4e7b11945c2a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f902e7c938, %r1, %r9
	setx	0xa1fdc0fa7721b9fd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2d85c4, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000e1962493ca, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d116926b00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cc2211a838, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ea3a9a0, %r1, %r9
	setx	0x54468b19b3a8d48c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fae4f3a, %r1, %r9
	setx	0xd9abda3557a38449, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xd9abda3557a38449, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6ea845ed4, %r1, %r9
	setx	0x1762f65037c21710, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de33945a80, %r1, %r9
	setx	0xf4e2d3078fc84c8c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e751540cd6, %r1, %r9
	setx	0xd1f4774cee92294e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f17a794e6a, %r1, %r9
	setx	0xf063d45dec687138, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e4be2d8, %r1, %r9
	setx	0xd0ed8acdda0abcbd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2ddb70, %r1, %r9
	setx	0x299812eaaec61148, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x299812eaaec61148, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c903e363f8, %r1, %r9
	setx	0x97fcfcee265f9611, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db44e273c0, %r1, %r9
	setx	0x498a36229c035541, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea724834a8, %r1, %r9
	setx	0x5abb3c84555ba052, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa5fe16968, %r1, %r9
	setx	0xea26992a1fb4a3da, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4783633b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e5984b343c, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x0000001070100000, %r1, %r9
	setx	0xea26992a1fb4a3da, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e904680, %r1, %r9
	setx	0x6bfabebc4a4f055b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f17bf06, %r1, %r9
	setx	0xcc8b77de1cf0b1a1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c064b6de22, %r1, %r9
	setx	0x5c4482c87bc7dd01, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d486b7b56a, %r1, %r9
	setx	0x32402e05698e0ff7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e60c217aba, %r1, %r9
	setx	0x27a2a0f783d56ac6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa23c1bd88, %r1, %r9
	setx	0x85fdb3324bd2e019, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800efc80c8, %r1, %r9
	setx	0xaa984cfbaf963e13, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fcb7868, %r1, %r9
	setx	0x0ef5dead7626e3fb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf30628188, %r1, %r9
	setx	0x81df3a2cc738eee0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d025ee9600, %r1, %r9
	setx	0x4959607b78cb04fa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea73e80bd0, %r1, %r9
	setx	0x9c596c2fe6144b1b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa90b7a6a8, %r1, %r9
	setx	0x32582b5cdbbeec98, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e1676d0, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x00000010c0100000, %r1, %r9
	setx	0x32582b5cdbbeec98, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080bd7e8eec, %r1, %r9
	setx	0xf7946327ffb4655f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xf7946327ffb4655f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ed85c1e, %r1, %r9
	setx	0xc326a440e5deb1c3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f39020b, %r1, %r9
	setx	0x739c2c30f790b3b0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c873a1550b, %r1, %r9
	setx	0x8f95e2b16c1cc792, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2edec5b6d, %r1, %r9
	setx	0x8f65e94149ca0280, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea501b770c, %r1, %r9
	setx	0x4efbe64843deb1e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0efad9b4b, %r1, %r9
	setx	0xf930a668f78742e0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e617a80, %r1, %r9
	setx	0x526a8ad89a5f2887, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff1f2da, %r1, %r9
	setx	0x217326fc1eadb17e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c6c0edda1a, %r1, %r9
	setx	0xbebd25724dc30d2d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d090aa19b6, %r1, %r9
	setx	0x38060c2a4e775381, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e39c27f79a, %r1, %r9
	setx	0x01b7af1bd40f3a63, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f56a157418, %r1, %r9
	setx	0x436a37ec24e33749, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed464b4, %r1, %r9
	setx	0x6716ba0d94b42029, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe60b5c, %r1, %r9
	setx	0x76d0d8355d4af32a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf5414bd30, %r1, %r9
	setx	0xdd1dc615a44d6e20, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d87c30c710, %r1, %r9
	setx	0xf6e325d20336c373, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e390a1b2a4, %r1, %r9
	setx	0x874ca451749df3b4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x874ca451749df3b4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa2d13e740, %r1, %r9
	setx	0x78fe696c233b7c68, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800edc3338, %r1, %r9
	setx	0x3c5e5aee9a5e4714, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa45400, %r1, %r9
	setx	0x6572ddb442d0c84e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc68316e78, %r1, %r9
	setx	0x321eb5be98ccdc1e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dde2e9a1f8, %r1, %r9
	setx	0xa750dc20aa312d82, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e88800e490, %r1, %r9
	setx	0x5e2e212bfe2cb1f6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6b8978590, %r1, %r9
	setx	0x4556ad65d274ab7d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea989ee5e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d5135f33c2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cbabe0d342, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f09e9d2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000008083e104d5, %r1, %r9
	setx	0xbca5c03c90f8bd5b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xbca5c03c90f8bd5b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eda7951, %r1, %r9
	setx	0xf14a795c4632bd36, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800feb7bc5, %r1, %r9
	setx	0x518b49c0fff9514e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5790f60bd, %r1, %r9
	setx	0xa2e88513cc242ea7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5e382f95e, %r1, %r9
	setx	0x9207cf71dfc84700, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x9207cf71dfc84700, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e487c78d80, %r1, %r9
	setx	0x5341b27275aad774, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fbe3d43a71, %r1, %r9
	setx	0x7d6aa5f51d60e588, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef4f99c, %r1, %r9
	setx	0x7a668245a25f1a04, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fbab064, %r1, %r9
	setx	0xd54a75bcc3f9e677, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c2d3f7b42c, %r1, %r9
	setx	0xd6a8d8cd182e4129, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xd6a8d8cd182e4129, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d88b97fc64, %r1, %r9
	setx	0x131c6bb73d14e453, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed3bd9d8d0, %r1, %r9
	setx	0xf60d25570374319a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fab63a911c, %r1, %r9
	setx	0x107bfcb5073c8cac, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eddab08, %r1, %r9
	setx	0xba2b6ffd006b1466, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f296330, %r1, %r9
	setx	0x9b5740177e6409dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3453607f8, %r1, %r9
	setx	0xe73280a8ebd03e51, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d491719d60, %r1, %r9
	setx	0x7bbbd652f683ff8f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x7bbbd652f683ff8f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e05ad8b500, %r1, %r9
	setx	0xf0ac340290517f7c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f714d48970, %r1, %r9
	setx	0x48197d9406c0f938, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x48197d9406c0f938, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f9fbc58c88, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x000000800e6cdc5e, %r1, %r9
	setx	0x498b66cd34426f16, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x498b66cd34426f16, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f90b39c, %r1, %r9
	setx	0x861c49ae64ad1c5b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c3f0fde85a, %r1, %r9
	setx	0x3f499d3da4495deb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x3f499d3da4495deb, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d47c8c6c46, %r1, %r9
	setx	0x4c2b9ca09737d776, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e379eda698, %r1, %r9
	setx	0x0cee92beef933c77, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x0cee92beef933c77, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2731d0940, %r1, %r9
	setx	0xfd172508bf1df124, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea7000c, %r1, %r9
	setx	0xee34f21c516408df, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xee34f21c516408df, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fed93e4, %r1, %r9
	setx	0xd7492edbe24d7b32, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xd7492edbe24d7b32, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cd76669840, %r1, %r9
	setx	0x8f1dce818ea0aa34, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d1fb41b2b4, %r1, %r9
	setx	0x2cc74b2ff213bb08, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5094df238, %r1, %r9
	setx	0x05391f77fcf0504f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f99b151dd4, %r1, %r9
	setx	0x13c7daacd914e14a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eab9bd0, %r1, %r9
	setx	0x5a80131dede4a2bd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc0dfa0, %r1, %r9
	setx	0xac495592b48afb50, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xac495592b48afb50, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c85b3ede40, %r1, %r9
	setx	0x4c07afe99588f4aa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x4c07afe99588f4aa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfd7b289d8, %r1, %r9
	setx	0x76604aaaa9b7bd41, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eedfc729d0, %r1, %r9
	setx	0x5433a13fd12bb2d9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8c8a53888, %r1, %r9
	setx	0x787f9a77f2c275c4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5135f33c2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cbabe0d342, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f09e9d2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e35b4f6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fec2ed2184, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ef850abd0a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fbfdf80, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x00000080c0207ec7, %r1, %r9
	setx	0x120f219be05506e8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x120f219be05506e8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ee73c24, %r1, %r9
	setx	0x6579b85351cb5a95, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd78535, %r1, %r9
	setx	0x2dc3be70c21b040a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c03899879c, %r1, %r9
	setx	0x9c34581e7d474211, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x9c34581e7d474211, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d8eb3819f3, %r1, %r9
	setx	0x042b27838ed7240c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e859cb1743, %r1, %r9
	setx	0x26de8fa2f6edb745, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f95df6b631, %r1, %r9
	setx	0x4bfb0d6311d27160, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eae556c, %r1, %r9
	setx	0x231d50fb455b0c9d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff1ea44, %r1, %r9
	setx	0x4868b15ca599f25d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x4868b15ca599f25d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ca980955dc, %r1, %r9
	setx	0x4529ae7c39070fbf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d13b85f320, %r1, %r9
	setx	0x19ddd6d5003e6f4c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e0f2486650, %r1, %r9
	setx	0x4439cf6037196280, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x4439cf6037196280, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f2541fde84, %r1, %r9
	setx	0xad8ab33bddcdc18a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xad8ab33bddcdc18a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080dff77834, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f42b0a929e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r9
	setx	0xad8ab33bddcdc18a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e5795fc3b5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000db254059e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cf30628188, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fcb7868, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000001060100000, %r1, %r9
	setx	0xad8ab33bddcdc18a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080456b1243, %r1, %r9
	setx	0x644c7895354c7d89, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x644c7895354c7d89, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ec7b618, %r1, %r9
	setx	0xcc48f8df698023b4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xcc48f8df698023b4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f6c21cc, %r1, %r9
	setx	0xa9f4fcc7f91519aa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce9467aa91, %r1, %r9
	setx	0x32fcdacacd01244f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d753c924a7, %r1, %r9
	setx	0xe87c0be97920084c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1a3d41838, %r1, %r9
	setx	0xe0ae42a25b9cb86e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xe0ae42a25b9cb86e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fd1f7c12c2, %r1, %r9
	setx	0x6ba04662a9532678, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7c49fa, %r1, %r9
	setx	0xcb7338b4094b3143, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8f476c, %r1, %r9
	setx	0x8efed7c226a69bb6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c9bca73a30, %r1, %r9
	setx	0x359564ac7461c7f2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d12b80e122, %r1, %r9
	setx	0x4a666b051307cdd0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e201a5c990, %r1, %r9
	setx	0xa55a9fd147e5809a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xa55a9fd147e5809a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f5a5374688, %r1, %r9
	setx	0xc5eae642b55b70ce, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e41e3c8, %r1, %r9
	setx	0xcfbcb37746533fb2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xcfbcb37746533fb2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc605d0, %r1, %r9
	setx	0xda99d5c1e2effc4c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5ae75c7e0, %r1, %r9
	setx	0x6197db0a9354b356, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x6197db0a9354b356, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d67af65158, %r1, %r9
	setx	0x5b25fe56bf6e2b91, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3cb05d4d0, %r1, %r9
	setx	0xdef7971385e520d1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fdf3288d30, %r1, %r9
	setx	0x75c7a1784f380eab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4637a0446, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2a142a25a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa5fe16968, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ea724834a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000db44e273c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c903e363f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000809d2f38c3, %r1, %r9
	setx	0x5bf84582ee9b5969, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e61554b, %r1, %r9
	setx	0xbf6b6cc26f59139f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe2b412, %r1, %r9
	setx	0xd4d92036f1d76f16, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c112f2f32b, %r1, %r9
	setx	0xf1dd77029338de50, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dda93985c6, %r1, %r9
	setx	0xb08eb3fb4fd9447e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xb08eb3fb4fd9447e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ecc4410a7d, %r1, %r9
	setx	0x438f521e2a7d2824, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fb032d718c, %r1, %r9
	setx	0x3ab7a68064943bb5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x3ab7a68064943bb5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e21d548, %r1, %r9
	setx	0x75eb9d2070768278, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f923a50, %r1, %r9
	setx	0x13fe2ed21a7390af, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x13fe2ed21a7390af, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c48ac1e440, %r1, %r9
	setx	0xbc40c5265447906b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d322e6ebe8, %r1, %r9
	setx	0x04f6ef6233bb106d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eca36b1660, %r1, %r9
	setx	0xe177752b2b93295e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f1b2c96ae8, %r1, %r9
	setx	0xa2fe44e5c27cf951, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d28ecb119f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cb8d539978, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fff3189, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001090100000, %r1, %r9
	setx	0xa2fe44e5c27cf951, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ec40c89, %r1, %r12
	ldub	[%r12], %r11
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
	setx	0x00000010e0100000, %r1, %r9
	setx	0xa2fe44e5c27cf951, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080df1b8ec9, %r1, %r9
	setx	0xa6373becf0d66603, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xa6373becf0d66603, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eab94bd, %r1, %r9
	setx	0xdfe0e6d172975fe5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xdfe0e6d172975fe5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f1f7206, %r1, %r9
	setx	0xf5c8d89bddc89ccc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd52eaa780, %r1, %r9
	setx	0x95f4f5abbbaf983c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d13a2df801, %r1, %r9
	setx	0x659bf04be452f3cf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e392ceabad, %r1, %r9
	setx	0x9ed09e9bd6916374, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f1e4351922, %r1, %r9
	setx	0x5d503c6c898a3426, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x5d503c6c898a3426, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ee912c0, %r1, %r9
	setx	0x9222ff42ec1d9e1b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6135a8, %r1, %r9
	setx	0xb6ae16028ca174ad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cac9b93f60, %r1, %r9
	setx	0x57954ccbac892485, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x57954ccbac892485, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d6c4cc4fe8, %r1, %r9
	setx	0x98e204585cca2d5b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e025d10ec8, %r1, %r9
	setx	0xead7e58cf649a87f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa9f85e1f8, %r1, %r9
	setx	0x624963c1f96e333e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ec7b618, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080456b1243, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001070100000, %r1, %r9
	setx	0x624963c1f96e333e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f95df6b631, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e859cb1743, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d8eb3819f3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c03899879c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e2860941ae, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d85b5846bc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c223ba2a54, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fd2f50e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e661ecc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fbe7520f92, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f3b01b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef59ba0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fe929a3018, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e7ff325a30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dbfd5c03e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c8db73f4d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f9cc0d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080fbb1ca49, %r1, %r9
	setx	0x1d112b3d8f60849f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3ea638, %r1, %r9
	setx	0x56ebae2edfedcccf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9433e0, %r1, %r9
	setx	0x56286ea2848c69a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c203e1fdc1, %r1, %r9
	setx	0xaba18ddff40306a1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd96df09c7, %r1, %r9
	setx	0xba3733554ccf277a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee0ac5f3db, %r1, %r9
	setx	0xf1426cc8a008d869, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f72e1866cc, %r1, %r9
	setx	0x4f88de88b98a4c0a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x4f88de88b98a4c0a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e4227c0, %r1, %r9
	setx	0x62ecdf41dfc10182, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f59b188, %r1, %r9
	setx	0xb63274f1b442cf5a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c42e76337e, %r1, %r9
	setx	0x8d35b4f69470ec59, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dbeb3dc2c4, %r1, %r9
	setx	0x5b30e00339bc220c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ee2dbabcf0, %r1, %r9
	setx	0x2bd9422e5560d411, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x2bd9422e5560d411, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fd925b0c90, %r1, %r9
	setx	0xd9ed8467eab6195c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e604678, %r1, %r9
	setx	0x3d4cf5dac5c423ab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f21f710, %r1, %r9
	setx	0x004c15db9402ddc4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf152e0c28, %r1, %r9
	setx	0xd265d5455a261d67, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xd265d5455a261d67, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d12b36b2f8, %r1, %r9
	setx	0x91f8ddab11d18aba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x91f8ddab11d18aba, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e0ffb24e60, %r1, %r9
	setx	0xbd682427893f1799, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xbd682427893f1799, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f59b25cf60, %r1, %r9
	setx	0x4f99a76aee470fe1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e66b067f04, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d86c9e28c6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca83570aee, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f609d1c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e3c793c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fd9d295258, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e69a9e527c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dfa2960f3c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c4e8ce4924, %r1, %r12
	lduw	[%r12], %r11
	setx	0x0000001050100000, %r1, %r9
	setx	0x4f99a76aee470fe1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e246636, %r1, %r9
	setx	0x4b49ef03764f7a1d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ffa6808, %r1, %r9
	setx	0x19377433b688edc1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x19377433b688edc1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c60515b734, %r1, %r9
	setx	0xa35d970d184e20cf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d50ce24c44, %r1, %r9
	setx	0x1366eb8a658f6c60, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e5e3170cec, %r1, %r9
	setx	0x3a16398d32cfd4e9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe92a65b88, %r1, %r9
	setx	0x4a1cde4418f10790, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e04a43430f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d59f07caa8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c91d6ee3b9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f0735d4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e8780ee, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080dff77834, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddb53300a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cb62cca950, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ff72da8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e42c348, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f3e1630f98, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x000000803977c366, %r1, %r9
	setx	0x7873ae1b9da266b2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x7873ae1b9da266b2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e7250d5, %r1, %r9
	setx	0xaed8ea0aaee98c7b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4bdedc, %r1, %r9
	setx	0x7da3d82840abbf4a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x7da3d82840abbf4a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c771681e81, %r1, %r9
	setx	0x57adcbe74503a8d8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da1daa289e, %r1, %r9
	setx	0x37d634caf25ef59e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8dbc727a1, %r1, %r9
	setx	0xf36a9f9421f16da9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f699c3aa47, %r1, %r9
	setx	0x09b8ee9d30f22e6a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x09b8ee9d30f22e6a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e58271c, %r1, %r9
	setx	0x5c63028a19a5d558, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x5c63028a19a5d558, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f8fc902, %r1, %r9
	setx	0x67867ec627334a0a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c5ed56478a, %r1, %r9
	setx	0xfd65d17e5d51ba70, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d9f8c86f5e, %r1, %r9
	setx	0x170d557cb9ea15db, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x170d557cb9ea15db, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e70beb5822, %r1, %r9
	setx	0x95d2a6fd351cedb3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6e81e0a00, %r1, %r9
	setx	0x269c150aa4d09b3e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9cc714, %r1, %r9
	setx	0xe7fc55ca9d67eabc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0a1db8, %r1, %r9
	setx	0xd5a39c99dbdb4bbc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c590c413d4, %r1, %r9
	setx	0xfc0fab6869cfab67, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3d17e3c4c, %r1, %r9
	setx	0x5e2797c110c37bd6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x5e2797c110c37bd6, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e9edb08474, %r1, %r9
	setx	0xc4f63e7325bc5a16, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f823030740, %r1, %r9
	setx	0x0087b0a72770f5b1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e307cd0, %r1, %r9
	setx	0xd1721b90ef4361df, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff4fc88, %r1, %r9
	setx	0xcc8613531d0a99dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xcc8613531d0a99dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca8dd3afe8, %r1, %r9
	setx	0x62a5bd82da5ff4c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfa9c2dee8, %r1, %r9
	setx	0xf32ce48ed22e1c72, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000edc091d048, %r1, %r9
	setx	0xf2393056103d28d3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f88eb5d540, %r1, %r9
	setx	0x2088b4a8dc15f302, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2afcd6767, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e23c3ca708, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ead0028, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x00000080ee415609, %r1, %r9
	setx	0xab3e7268ac0c1ed9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9f40b9, %r1, %r9
	setx	0xe94651bfd0352bce, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6d8a72, %r1, %r9
	setx	0xc77427fb9b651070, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c387e44913, %r1, %r9
	setx	0x3bb6c3aaceffc60d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x3bb6c3aaceffc60d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7afa1a798, %r1, %r9
	setx	0x04261f8e7a7a4621, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0fdad1d11, %r1, %r9
	setx	0xa906239f325cff40, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0e4f52864, %r1, %r9
	setx	0x25bcc5c0ce3b052b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1b662e, %r1, %r9
	setx	0xdaf15666b8544fcd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f9cdf36, %r1, %r9
	setx	0xf9ee5d66856d0412, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c80c2cd36c, %r1, %r9
	setx	0x4e40ba85da05defe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4cafffb76, %r1, %r9
	setx	0x8004fa6620e5e402, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x8004fa6620e5e402, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e1bb04f496, %r1, %r9
	setx	0x9e4f4d12db94755d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x9e4f4d12db94755d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fecbe98ef2, %r1, %r9
	setx	0xba2e23276a6400df, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef71768, %r1, %r9
	setx	0xb859bca3e927194b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f77abe8, %r1, %r9
	setx	0x5ac03a747a216704, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca605d31d0, %r1, %r9
	setx	0xaab9a4039855e28d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db8bb7f2e0, %r1, %r9
	setx	0xf1fecee4fbb0e16e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e89778a704, %r1, %r9
	setx	0x5d8784fdcbf5716e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x5d8784fdcbf5716e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f54c177f50, %r1, %r9
	setx	0xef4a4371addcbf75, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f34394a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001040100000, %r1, %r9
	setx	0xef4a4371addcbf75, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e9fde6e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080cec6eb4a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fd94bee6a5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e91a209395, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dd08eda850, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cf4f065f7d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dbeb3dc2c4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c42e76337e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f59b188, %r1, %r12
	lduh	[%r12], %r11
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
	setx	0x000000800e886ea0, %r1, %r9
	setx	0x73814172136209af, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f170602, %r1, %r9
	setx	0x8170bfa72e7dd0dd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x8170bfa72e7dd0dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf4da2cb7c, %r1, %r9
	setx	0xf3932d70b0be2ed2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xf3932d70b0be2ed2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db4016375c, %r1, %r9
	setx	0x4388e0c1799401a2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e4b420ecde, %r1, %r9
	setx	0x68a6c4a08f0c9c30, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x68a6c4a08f0c9c30, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f897d432bc, %r1, %r9
	setx	0xfea25dbb92d53783, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xfea25dbb92d53783, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e3c3e50, %r1, %r9
	setx	0xc2dee63c8a04ceab, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xc2dee63c8a04ceab, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fd949a8, %r1, %r9
	setx	0x028e19e3f3b3ba28, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x028e19e3f3b3ba28, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca2c8bfd64, %r1, %r9
	setx	0x9c4d31c099f39ba0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5e084caa4, %r1, %r9
	setx	0x19c3802f65476bd7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e83e1532fc, %r1, %r9
	setx	0xf50bc57a8ee73a8f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f9843c01d8, %r1, %r9
	setx	0x02ce9c84437fac9d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e87d1d8, %r1, %r9
	setx	0xc515b803f9c20c6f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xc515b803f9c20c6f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd49ec0, %r1, %r9
	setx	0x333d72f121dcdf09, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4c6c6bdf8, %r1, %r9
	setx	0x2b21b4c0fdbb471a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3523745d0, %r1, %r9
	setx	0xedb6717e65ee30f7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3453e6c68, %r1, %r9
	setx	0x88aa132e83facd61, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x88aa132e83facd61, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f834f29380, %r1, %r9
	setx	0x358788c32a5c4a22, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x358788c32a5c4a22, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800eff6f3c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4783633b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e5984b343c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e441194, %r1, %r9
	setx	0x484a67fafc8bcf06, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x484a67fafc8bcf06, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fce0248, %r1, %r9
	setx	0x907ae8fb0c649b7d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cad0e6244c, %r1, %r9
	setx	0x7dd49d5405c85fa9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0aa71709c, %r1, %r9
	setx	0x52f907d580e34585, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3df53fa7c, %r1, %r9
	setx	0x4f15d18ed338f937, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f314a04dd0, %r1, %r9
	setx	0xd5587345119075da, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ead5348, %r1, %r9
	setx	0x3f7dad83990dacd1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1bde28, %r1, %r9
	setx	0x117a857facbf5550, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x117a857facbf5550, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c54dc90c68, %r1, %r9
	setx	0x786350d2cd1e074c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x786350d2cd1e074c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d5603509f8, %r1, %r9
	setx	0x995c0f5322d6a83d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x995c0f5322d6a83d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e9bddf22e8, %r1, %r9
	setx	0x9974f3efc3e7d532, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fb32296278, %r1, %r9
	setx	0x5a6a78adb7e1db9e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f68fee8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e880784, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e312ec8110, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dde80f4cc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c024e42788, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f97d630, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e891d58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fb967988, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef284ce, %r1, %r9
	setx	0xddc3077123844e43, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f793b4c, %r1, %r9
	setx	0x2d15ea905bec03fe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca9592eca6, %r1, %r9
	setx	0xe812b155d0489811, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc0dbf52cc, %r1, %r9
	setx	0x1fa7ba51b3ad6102, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x1fa7ba51b3ad6102, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e6e1338986, %r1, %r9
	setx	0xd0eaeed4e3696837, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f7b6a5b59a, %r1, %r9
	setx	0x18d3d086f0e465c1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3fcdf8, %r1, %r9
	setx	0xa0f6b6997d396e6f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xa0f6b6997d396e6f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f58a690, %r1, %r9
	setx	0xdadb191e92218395, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c181885060, %r1, %r9
	setx	0x10548c63db35deac, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc396cede0, %r1, %r9
	setx	0xb48cb64d8ac30c5d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xb48cb64d8ac30c5d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e00a8b18b0, %r1, %r9
	setx	0x8f3f7b8a37c0e9e4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x8f3f7b8a37c0e9e4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4b219dac8, %r1, %r9
	setx	0xc6998486a9c2e435, %r1, %r10
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
	setx	0x000000800ee1dd58, %r1, %r9
	setx	0x75a8d2b3ea76acb3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f654422, %r1, %r9
	setx	0xa8e39ef0da4154da, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1d5ee8424, %r1, %r9
	setx	0xc8a0b93c6d0f6baf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4ea60f04a, %r1, %r9
	setx	0x30bdd881e9d0f542, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e885b0857e, %r1, %r9
	setx	0x5c40c181980e14cd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x5c40c181980e14cd, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f2480fc17c, %r1, %r9
	setx	0x1334c843f15c3fe9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fd94bee6a5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e91a209395, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dd08eda850, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001030100000, %r1, %r9
	setx	0x1334c843f15c3fe9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf4f065f7d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r9
	setx	0x1334c843f15c3fe9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5dbb08, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e2bf6bf, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f94f1a2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e73477e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fafde1e4a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ebaa963e24, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ddeb77b184, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ecb9558, %r1, %r9
	setx	0x985b0fda4bda316d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f7e5060, %r1, %r9
	setx	0x13fef1b791a934ba, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd79f75f18, %r1, %r9
	setx	0xc4749d1b7053b0f3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de0f670144, %r1, %r9
	setx	0xd1576452d6288201, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e639fa6cf0, %r1, %r9
	setx	0x0c7850cb49367f88, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2de6f2934, %r1, %r9
	setx	0x2e0248cb2daeb68f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000080dafbd036, %r1, %r9
	setx	0xf588e461098b3d9a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea3a15d, %r1, %r9
	setx	0x17a766f801f7c5be, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x17a766f801f7c5be, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f02c896, %r1, %r9
	setx	0xbc6eb07ceff606d2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xbc6eb07ceff606d2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cb2f0f054f, %r1, %r9
	setx	0x095b0324beaa01b3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd73f8c08d, %r1, %r9
	setx	0x836fd8b59524b494, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x836fd8b59524b494, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8d4fde0b2, %r1, %r9
	setx	0x10599ad87dcbcfce, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6c0d28a0f, %r1, %r9
	setx	0xc2b4238017346e14, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xc2b4238017346e14, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800efd6350, %r1, %r9
	setx	0x024e7f6c467d3e69, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f441d08, %r1, %r9
	setx	0xaf7f2e0aaab61c88, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xaf7f2e0aaab61c88, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ccfe102cba, %r1, %r9
	setx	0xc08f843588e9a51b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d11879cbaa, %r1, %r9
	setx	0x496375efc90a01b3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6445322b0, %r1, %r9
	setx	0xe178f9b724485c97, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fd538fe4ce, %r1, %r9
	setx	0xfedeb093911b4e03, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5c91d0, %r1, %r9
	setx	0x229ef423cb7f8f77, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f9ca750, %r1, %r9
	setx	0xa1d2f23a315e6bf4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c5dbd28494, %r1, %r9
	setx	0xba73b69b295b23c7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xba73b69b295b23c7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d1211172ac, %r1, %r9
	setx	0xd3c967eb874db4e1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e0ed5fd1b0, %r1, %r9
	setx	0x895d2f9e1ed34045, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f34188ffb0, %r1, %r9
	setx	0x8df735239ec50995, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e173c70, %r1, %r9
	setx	0xcbec061728035509, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe97cb0, %r1, %r9
	setx	0xc33fa898bfdac1bd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6b7f39130, %r1, %r9
	setx	0x92808797b06e38a0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd4fefcf48, %r1, %r9
	setx	0x8dac92e8eaa1ee3d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e689bbc810, %r1, %r9
	setx	0x1b3f79e04fd74919, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fb875acb80, %r1, %r9
	setx	0xbf02ac0a9a5ca806, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xbf02ac0a9a5ca806, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ef8ba72, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe18a2f03e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eee4a35428, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dd087cfcd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c8b8338098, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f892b68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4c3e98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000febc4f4960, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008023ab8545, %r1, %r9
	setx	0x799bc4ba451a21d7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e44f055, %r1, %r9
	setx	0x986f4538bb49ba77, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fbeadf0, %r1, %r9
	setx	0xb8ca786bf390e299, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xb8ca786bf390e299, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c770a7f302, %r1, %r9
	setx	0x4dd86b441efe5881, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d6504b6013, %r1, %r9
	setx	0x55571e06230737b2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef68ebe25a, %r1, %r9
	setx	0xade446578b9ff388, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0cc3c54f4, %r1, %r9
	setx	0xc4234fc0029321b3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e524908, %r1, %r9
	setx	0xddfb4b93a30a2fd9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xddfb4b93a30a2fd9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8f3e28, %r1, %r9
	setx	0xa855c500b3c5d601, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xa855c500b3c5d601, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ce2849e1c8, %r1, %r9
	setx	0x195d33e9fb316924, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3b3a33be8, %r1, %r9
	setx	0xf708a2c216c42eef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000edcc9fe5c8, %r1, %r9
	setx	0xcc1f6c78d252c6db, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f95426b6c0, %r1, %r9
	setx	0x53cb0b7887f73171, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000804f905b90, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f5416bd066, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e67ffc62d8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d21156dced, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c0bc6cf1be, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f5cf420, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de33945a80, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c6ea845ed4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fae4f3a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ea3a9a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4c5f14e1c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ed79f77318, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c3453607f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f296330, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eddab08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6b8978590, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e88800e490, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x00000010f0100000, %r1, %r9
	setx	0x53cb0b7887f73171, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e37528e, %r1, %r9
	setx	0x7f38b567f7482c3f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f7bcb82, %r1, %r9
	setx	0xd36a42d12853795f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c6d60c39fa, %r1, %r9
	setx	0xd692a4c6a772244b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dffd4503aa, %r1, %r9
	setx	0x7a9beaa7e6bb61ff, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x7a9beaa7e6bb61ff, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e538d638f2, %r1, %r9
	setx	0x66ada31584c4c39b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x66ada31584c4c39b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa69d51d98, %r1, %r9
	setx	0x9710a94e3777bf7e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x9710a94e3777bf7e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fff3189, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec40c89, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000806411266d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f7bd1ef054, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eb1938669d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e35b4f6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fec2ed2184, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ef850abd0a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d88c1d5402, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca2c8bfd64, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fd949a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e3c3e50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f54c177f50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e89778a704, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000db8bb7f2e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ca605d31d0, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x00000080b81f2484, %r1, %r9
	setx	0xd85383fbac360079, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e685d18, %r1, %r9
	setx	0xab4042af5bf53b82, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xab4042af5bf53b82, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7c5899, %r1, %r9
	setx	0xaddd51116f67e726, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9842a6068, %r1, %r9
	setx	0xba6761b9ed55fc85, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8a1d340ba, %r1, %r9
	setx	0x4868a3059ec985ac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x4868a3059ec985ac, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e64c2c5250, %r1, %r9
	setx	0x5dec1a27e2913dd8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8f3bf3f76, %r1, %r9
	setx	0xd2518958a9443dc9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xd2518958a9443dc9, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e15bcd8, %r1, %r9
	setx	0xce863c565e79f2a3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe3a3fc, %r1, %r9
	setx	0xc8b5421bf2f19221, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cecd50e038, %r1, %r9
	setx	0x5821500ba0221cb0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dcf9a8df48, %r1, %r9
	setx	0x2166aa6123c26ad4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x2166aa6123c26ad4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000edd27ebfd8, %r1, %r9
	setx	0xa5778ca01d92e5f4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xa5778ca01d92e5f4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f7b4241c30, %r1, %r9
	setx	0x6dadbe3671f5cc5f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb8d539978, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fff3189, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec40c89, %r1, %r12
	ldub	[%r12], %r11
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
	setx	0x6dadbe3671f5cc5f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca7a191148, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r9
	setx	0x6dadbe3671f5cc5f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fbdff78, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e99744c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0d5c730bc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e8b3214444, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d2dc857768, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000caf7b5ea80, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f62d116, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe7f797888, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef86675208, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d1f9c9410c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e54b2a5978, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d9c3fe2558, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ca2183b9d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fb59310, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ebe5d18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f944afc418, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e60e72e040, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x000000800eca55fc, %r1, %r9
	setx	0x3f38041218707ed8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f87eb80, %r1, %r9
	setx	0x8499e1c09dcbab32, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c56d7d1022, %r1, %r9
	setx	0x498c9d6ee2043dd1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6f723d7fa, %r1, %r9
	setx	0x7592eadb6c9c8146, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x7592eadb6c9c8146, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8fa2b0556, %r1, %r9
	setx	0xcf46b1ba30db760e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fb2018cec2, %r1, %r9
	setx	0xfe621efc072124cc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xfe621efc072124cc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f51ea2e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e51b970, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fd3d49aac6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e2860941ae, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f9fbc58c88, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e650dd1e50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d4f4cf3ee0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cff8ba8b18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f79a5a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9bb668, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f86cc27528, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x0000001050100000, %r1, %r9
	setx	0xfe621efc072124cc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080377c434f, %r1, %r9
	setx	0x9606718a57acf924, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4dfe1e, %r1, %r9
	setx	0x8288e9775be2e5df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f427713, %r1, %r9
	setx	0x124fc60837f6af3c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2eaf873fe, %r1, %r9
	setx	0x57290b251de8b95c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d22136e352, %r1, %r9
	setx	0x13066f8a3d8de145, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e93b760b0f, %r1, %r9
	setx	0x4cf53bf860ffc0bc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f3fc860007, %r1, %r9
	setx	0x6b7c1e8225024d37, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef8c4cc, %r1, %r9
	setx	0x0cfa4fb5acb18171, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f446554, %r1, %r9
	setx	0x975503dd66776987, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd007d258e, %r1, %r9
	setx	0xf19e3b985dcca124, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de0de0f0b4, %r1, %r9
	setx	0x888f272028afb6be, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e658b7b756, %r1, %r9
	setx	0x0b588ca8ff23d636, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x0b588ca8ff23d636, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fd8ca9cdba, %r1, %r9
	setx	0x0f57febf6ac7dfba, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x0f57febf6ac7dfba, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e2ea1f4, %r1, %r9
	setx	0xe194094645ed7a64, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fdc5b9c, %r1, %r9
	setx	0x5bcc672a0bb5b4e2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c208c4d86c, %r1, %r9
	setx	0x958a6f638715561d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d103a47fcc, %r1, %r9
	setx	0xff42c2edfbba8eb5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xff42c2edfbba8eb5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ebfd82afb0, %r1, %r9
	setx	0xb4172640ee6dbc36, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f22d0831e0, %r1, %r9
	setx	0x7451e09d6846bb9c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb305a0, %r1, %r9
	setx	0x01c69b4767d9936c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f49ab50, %r1, %r9
	setx	0x43b1ed04e2a9f61b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9a0967e60, %r1, %r9
	setx	0x82613970e4eb3dcc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da4e2cbbd0, %r1, %r9
	setx	0x619120f634cbd2c7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e67967c598, %r1, %r9
	setx	0x3f3ab1bc861ecc3a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x3f3ab1bc861ecc3a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f88315d520, %r1, %r9
	setx	0xc7ed515dc0dced3f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800efe2085, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000804f905b90, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001060100000, %r1, %r9
	setx	0xc7ed515dc0dced3f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f5416bd066, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e67ffc62d8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d21156dced, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e31455982c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d7f4b7e9c8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cebb54ad7c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f6a6fdc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e6e970c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f96b6c0ae0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eff736cc10, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x000000800e7dc32c, %r1, %r9
	setx	0x67ce44e355a679a3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f282a68, %r1, %r9
	setx	0xccb7d84c83273837, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xccb7d84c83273837, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c65e18e2b2, %r1, %r9
	setx	0x754321c6a91c595a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dfb6d02e80, %r1, %r9
	setx	0xdedaf36702f89394, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef8abf99ec, %r1, %r9
	setx	0x3c67ac6b70548b87, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fd1a0f4372, %r1, %r9
	setx	0x2e8d41afb9e3f70c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef17338, %r1, %r9
	setx	0xff181fec802a6045, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7654d0, %r1, %r9
	setx	0x563d34bf58e1fe78, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2962971c8, %r1, %r9
	setx	0xf3e92400c11966b1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xf3e92400c11966b1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d666afa3a0, %r1, %r9
	setx	0x13a15906d160bb81, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec1c1f6a38, %r1, %r9
	setx	0xe8a6976615c49158, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe49e425f8, %r1, %r9
	setx	0xfe00ca9dcb8d03fc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d21156dced, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fd949a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e3c3e50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f54c177f50, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x0000001000100000, %r1, %r9
	setx	0xfe00ca9dcb8d03fc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000008047d1bd39, %r1, %r9
	setx	0x18a4c8a9b70def96, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0811a0, %r1, %r9
	setx	0x5d47a4e2db0a346e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x5d47a4e2db0a346e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f84805c, %r1, %r9
	setx	0x32a054c462f1aa29, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c70448953c, %r1, %r9
	setx	0x48def5b4fca7da2f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df8ef617a3, %r1, %r9
	setx	0x2e675bb8f04c9aa7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee6c530dfa, %r1, %r9
	setx	0x9371b476126a7a34, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f81f5967a0, %r1, %r9
	setx	0x30cc15862db25840, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eea6628, %r1, %r9
	setx	0x767032813d811d06, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fb34fc4, %r1, %r9
	setx	0x4250137954e7880d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2232dea2c, %r1, %r9
	setx	0xf3e61c5ec0d252e5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xf3e61c5ec0d252e5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d8cf53efb6, %r1, %r9
	setx	0xefc021d3ac711b94, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xefc021d3ac711b94, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e9fa1c866a, %r1, %r9
	setx	0x82f16b8f83a22e97, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x82f16b8f83a22e97, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f60d71c9da, %r1, %r9
	setx	0xf39e83ae714dbba7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xf39e83ae714dbba7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e299b24, %r1, %r9
	setx	0x1e1857f788574c0a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fd25fd0, %r1, %r9
	setx	0xb9ea471915a1496d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c04247bf88, %r1, %r9
	setx	0xff91556e2c954a45, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dce1253718, %r1, %r9
	setx	0xad9578863d897274, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5217e4b58, %r1, %r9
	setx	0x43aa1eff8925e46b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f69d47b440, %r1, %r9
	setx	0x85fbd9515fed7f33, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e4fb9e8, %r1, %r9
	setx	0x1462f6bf1be1e14d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f742d10, %r1, %r9
	setx	0xf78b9758cdde5982, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3a3efdad8, %r1, %r9
	setx	0xb833916dd165bd56, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db24a76710, %r1, %r9
	setx	0xa664132e280e1b05, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e97c47dd40, %r1, %r9
	setx	0xfb99a2b7c0eb0304, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4e9fe5f48, %r1, %r9
	setx	0x04060f93efe546f9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x04060f93efe546f9, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f54c177f50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e89778a704, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000db8bb7f2e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ca605d31d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f77abe8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ef71768, %r1, %r12
	lduw	[%r12], %r11
	setx	0x0000001060100000, %r1, %r9
	setx	0x04060f93efe546f9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e14f5d2, %r1, %r9
	setx	0xf39c69c2f7566187, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fb0a090, %r1, %r9
	setx	0x853a566b6a727e8b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x853a566b6a727e8b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c20c6e8596, %r1, %r9
	setx	0x3552ac96da036cf2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x3552ac96da036cf2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d54eb5cc28, %r1, %r9
	setx	0x074a1abdebf44365, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e510266024, %r1, %r9
	setx	0x2ff980af886509f0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa765e6750, %r1, %r9
	setx	0xbfa9d06dcf78a1a9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e4edc98, %r1, %r9
	setx	0x597137ad7e23e7a5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc4e598, %r1, %r9
	setx	0xd9c74c806aac8ff2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xd9c74c806aac8ff2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cdf43c5ef8, %r1, %r9
	setx	0xb81ec8420f276bb9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d9add1fc34, %r1, %r9
	setx	0xc2e9f8ee0e3aadc7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xc2e9f8ee0e3aadc7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e73271ea48, %r1, %r9
	setx	0xf1edb315dfda4cd1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fb0ff00c5c, %r1, %r9
	setx	0x318dff741b7c74a1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x318dff741b7c74a1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e1f5b48, %r1, %r9
	setx	0xa2c4c0bcb2d12237, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6e8d68, %r1, %r9
	setx	0x3c5e8f2a9207e31c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cfbafedd80, %r1, %r9
	setx	0xb580d8771ff3261f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0fb249358, %r1, %r9
	setx	0x88c0dabe5dd825ea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7f95da450, %r1, %r9
	setx	0xa70c639f80488388, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xa70c639f80488388, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4487d3fa0, %r1, %r9
	setx	0x6e0303a0f6d9c539, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x6e0303a0f6d9c539, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d4ea60f04a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d9f65be6f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cf98cbf970, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f3cca10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eea2e48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fcffcfff78, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000001060100000, %r1, %r9
	setx	0x6e0303a0f6d9c539, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e3e4218, %r1, %r9
	setx	0xa60ccd97ff280759, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fd6c8b0, %r1, %r9
	setx	0x711c35a48030c85e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce94611104, %r1, %r9
	setx	0x3c256e6768acba6e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc14861884, %r1, %r9
	setx	0x535fb21bd893bd4f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e27183c5d4, %r1, %r9
	setx	0xee79961203a0b33e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f473b2d77c, %r1, %r9
	setx	0x382c204d97c1a7e4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c203e1fdc1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f9433e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e3ea638, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080fbb1ca49, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f1e4351922, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e392ceabad, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e538d638f2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dffd4503aa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c6d60c39fa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f7bcb82, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r9
	setx	0x382c204d97c1a7e4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eb45a90, %r1, %r9
	setx	0x72cd4cce5f32d190, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fa7f314, %r1, %r9
	setx	0x03b0463082f600e3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7868755dc, %r1, %r9
	setx	0xdab15a2db0dcd832, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5ccbb2b60, %r1, %r9
	setx	0xc569c8a59f9410b9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eddd94e26c, %r1, %r9
	setx	0x500d6bcc5023aeba, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8a8f65cb4, %r1, %r9
	setx	0xc745aa5892a64c5c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e56c230, %r1, %r9
	setx	0xbf53f51319ef3068, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xbf53f51319ef3068, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f36b338, %r1, %r9
	setx	0xd8ea33c3488a548c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4640ba0a0, %r1, %r9
	setx	0x6f87b3c116583268, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ddb8ab9ef8, %r1, %r9
	setx	0x909a550ad6d90af7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x909a550ad6d90af7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8f957c868, %r1, %r9
	setx	0x3adc57f5f4c7b7c4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x3adc57f5f4c7b7c4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f490cd44b8, %r1, %r9
	setx	0x8bd3638929e78924, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x8bd3638929e78924, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080dff77834, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fe60b5c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ed464b4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f3f9e4e2b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000edc483c264, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x8bd3638929e78924, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000806cdb2ee6, %r1, %r9
	setx	0xbd9af50cfd8437a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efe2f3b, %r1, %r9
	setx	0x2762da1fb5ecc8a3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fea1eec, %r1, %r9
	setx	0x2a44b8ae08914e5d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca9c65ac5e, %r1, %r9
	setx	0x2a6e2b2caf779a96, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x2a6e2b2caf779a96, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2220467d0, %r1, %r9
	setx	0x4913ee19367d4abb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eed2af5334, %r1, %r9
	setx	0x3a9c80b3def0f4c8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x3a9c80b3def0f4c8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6df434649, %r1, %r9
	setx	0x779d0ddae63db73a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x779d0ddae63db73a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ee48fee, %r1, %r9
	setx	0xc85bff15149a05b7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8d6fe6, %r1, %r9
	setx	0x17f162cc65a699aa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x17f162cc65a699aa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cdf525d0f4, %r1, %r9
	setx	0xcc8dd573f6d077a6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd1f020aea, %r1, %r9
	setx	0x98920c09a871b34c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x98920c09a871b34c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e517b59354, %r1, %r9
	setx	0x9afe72a20cfbd86e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f287dcb98a, %r1, %r9
	setx	0x085fcbe08590fe51, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7d8f30, %r1, %r9
	setx	0x6eecbfd5bc207541, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x6eecbfd5bc207541, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6b89fc, %r1, %r9
	setx	0x1f4c7a923b990387, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c56dc86330, %r1, %r9
	setx	0x4c7eac447c08b38b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x4c7eac447c08b38b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dcbeaa389c, %r1, %r9
	setx	0x0741bf409d3b4b57, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x0741bf409d3b4b57, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb65217380, %r1, %r9
	setx	0xaca5223e9f30f274, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe90e45be4, %r1, %r9
	setx	0x4ccb7fb62a978451, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec29ca0, %r1, %r9
	setx	0x940c0d55cd450f07, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd24cd8, %r1, %r9
	setx	0x6f84c0912fde6226, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c155f78dc8, %r1, %r9
	setx	0x1061b0e8e0eda851, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9bdb969c8, %r1, %r9
	setx	0xf293796599a43a44, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e726e02e88, %r1, %r9
	setx	0xffc9343ff9c3314e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f68bd2b490, %r1, %r9
	setx	0x3a23ab84bd71f7d9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x3a23ab84bd71f7d9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e23adfc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e3e4218, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fb0ff00c5c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e73271ea48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d9add1fc34, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cdf43c5ef8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fc4e598, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e4edc98, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x000000809bd01e26, %r1, %r9
	setx	0x453500ca6129ef7a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x453500ca6129ef7a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e99da8b, %r1, %r9
	setx	0xc6a186c489089b60, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xc6a186c489089b60, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f4a68e2, %r1, %r9
	setx	0xa1061535b5169cda, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5cdfcf94a, %r1, %r9
	setx	0xe8c1be2246e0d0f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d39f661094, %r1, %r9
	setx	0x1a99f92694bf1e43, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x1a99f92694bf1e43, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000efd344435a, %r1, %r9
	setx	0xcd6f5ff224bc3dd9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f74e210901, %r1, %r9
	setx	0xd0bf71ef85642a5a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xd0bf71ef85642a5a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e65edc8, %r1, %r9
	setx	0x6b5f5c43aa6ca637, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9da2e8, %r1, %r9
	setx	0xd9d1da51068eef7f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xd9d1da51068eef7f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c8cf097968, %r1, %r9
	setx	0x32107194dcc99673, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d705f312a8, %r1, %r9
	setx	0x21b205ddf972f369, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x21b205ddf972f369, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6ce2276f8, %r1, %r9
	setx	0x60c5ddd4e7b54774, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f55768a700, %r1, %r9
	setx	0xf03a28fd0b66d4f6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xf03a28fd0b66d4f6, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c5ed56478a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f8fc902, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e58271c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe92a65b88, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e5e3170cec, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d50ce24c44, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r9
	setx	0xf03a28fd0b66d4f6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080b9de080c, %r1, %r9
	setx	0x77207c3470e4edc0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x77207c3470e4edc0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e154463, %r1, %r9
	setx	0x9206db401da5b24d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x9206db401da5b24d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f6b2465, %r1, %r9
	setx	0x1a0a5e9456f3696a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd378ee55d, %r1, %r9
	setx	0x4c07b152b7058b39, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d28fb06bef, %r1, %r9
	setx	0xa1abb30b92cfa197, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xa1abb30b92cfa197, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000eaf045c18d, %r1, %r9
	setx	0xaab555eccb587a3c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f7610d5f5d, %r1, %r9
	setx	0x73e01fd0aa03dc40, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee4a3de, %r1, %r9
	setx	0x7653a699f401459e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f25cc2a, %r1, %r9
	setx	0x71dcbc4e1e475f75, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c03a59b750, %r1, %r9
	setx	0xb1f9796068c20554, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xb1f9796068c20554, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0911f2ad0, %r1, %r9
	setx	0xaafbba77a0811875, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e9a7a5178e, %r1, %r9
	setx	0x26b2a78233b927a5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f7a98e3ed4, %r1, %r9
	setx	0xbca7feac8e136f5a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e550478, %r1, %r9
	setx	0x2c6e919d061d4a1b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f786a40, %r1, %r9
	setx	0x58e1933e1641a783, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x58e1933e1641a783, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc5ae5c62c, %r1, %r9
	setx	0xc2be308b522f975d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db3a4a6f3c, %r1, %r9
	setx	0xe0a94fb7b60f70fe, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eaf7ae3c0c, %r1, %r9
	setx	0xca620e960f55aa5a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000faab3bdcc8, %r1, %r9
	setx	0xd23ddacc8f58d4aa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee7aba8, %r1, %r9
	setx	0x55bd98c639754a1a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f21e230, %r1, %r9
	setx	0xc3b130e9dad05a35, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c22cb47d98, %r1, %r9
	setx	0x2443aa98a4422553, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x2443aa98a4422553, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000da09d8a3a8, %r1, %r9
	setx	0x74ee451c546b26a9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee2721f7e8, %r1, %r9
	setx	0x9dc14050cdaafd32, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f225ff23a8, %r1, %r9
	setx	0x00dadc14334298cf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x00dadc14334298cf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eff736cc10, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dfcbac54b4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ccfe69d86c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f88a5f8, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x000000800e1472d8, %r1, %r9
	setx	0xddc70a9fd3b448a3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fce3318, %r1, %r9
	setx	0x11dbf45b4f40891b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca0b01aff8, %r1, %r9
	setx	0xa7a3d9bee22bb1f3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbc9de0b78, %r1, %r9
	setx	0x127b5752bc4a3778, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4cf2b5478, %r1, %r9
	setx	0x6b0c36f72dfee733, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x6b0c36f72dfee733, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f33113d638, %r1, %r9
	setx	0x71695aabe0f81fd7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x71695aabe0f81fd7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x0000001000100000, %r1, %r9
	setx	0x71695aabe0f81fd7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ea554b0, %r1, %r9
	setx	0x60d505ea1196a8f1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8c7138, %r1, %r9
	setx	0xf439f390a237616a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c88c119960, %r1, %r9
	setx	0x8f6818ba66f5d818, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db57106448, %r1, %r9
	setx	0x517679e4e4b41618, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x517679e4e4b41618, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000edc3ff5110, %r1, %r9
	setx	0x8d3c72524a27a175, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fbb3a75040, %r1, %r9
	setx	0xc54e5a88f999ff84, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fd8ca9cdba, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e658b7b756, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000de0de0f0b4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd007d258e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f446554, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ef8c4cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fb2018cec2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f96b6c0ae0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x0000001030100000, %r1, %r9
	setx	0xc54e5a88f999ff84, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000809cf412ff, %r1, %r9
	setx	0xbcedb850ccc8a014, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea2b2ad, %r1, %r9
	setx	0x74a9941e1570f896, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fdeb86e, %r1, %r9
	setx	0xa5270ea44b001c16, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3932d2f63, %r1, %r9
	setx	0x5c5b76f637c9821e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d00e03b1fd, %r1, %r9
	setx	0x000944b9c0bf8701, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9a9c3cc23, %r1, %r9
	setx	0x4c0c053771f8d82e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2aa04b3e3, %r1, %r9
	setx	0x4ef140ff5eb64074, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef72058, %r1, %r9
	setx	0x0be60aa0557fc6e5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5ebbde, %r1, %r9
	setx	0xc05f67b4c7c52e9c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c326821514, %r1, %r9
	setx	0x2e85ec192be3095a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8ad103f7a, %r1, %r9
	setx	0x294cbb973fa31359, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e85dbb4f4a, %r1, %r9
	setx	0x7810041e8724c12d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f250728fc2, %r1, %r9
	setx	0x22b1e6a0e3ee1a54, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e660388, %r1, %r9
	setx	0xa3e41f9813b81658, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xa3e41f9813b81658, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f4aec40, %r1, %r9
	setx	0xc0aeae9435a5c812, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb31035ab0, %r1, %r9
	setx	0xe8812737f8bf61bf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0b6f9bb18, %r1, %r9
	setx	0xe9a47341f3cad4a0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec44a715e8, %r1, %r9
	setx	0xc3cc83b93a949f1e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fb6965b2b8, %r1, %r9
	setx	0x9385bb40e303accd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x9385bb40e303accd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f55768a700, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e6ce2276f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d705f312a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c8cf097968, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x000000800e91d78a, %r1, %r9
	setx	0x9ad512bf1e977f03, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x9ad512bf1e977f03, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fadc596, %r1, %r9
	setx	0x820f58fa86fbf7e0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c4f17a4e66, %r1, %r9
	setx	0xd7d496280551e4a1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc07470bc2, %r1, %r9
	setx	0x76d376830fc948d9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6ac1c710a, %r1, %r9
	setx	0x6a97a5e262457c2c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6736b8b94, %r1, %r9
	setx	0xbc775913dfcf6f73, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef01248, %r1, %r9
	setx	0x6e1439271c38c6ae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x6e1439271c38c6ae, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f50abb0, %r1, %r9
	setx	0x0ca5a725f7cbf569, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9f21fc420, %r1, %r9
	setx	0x153f092061288b1f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de34da46d8, %r1, %r9
	setx	0xe092af018bc03fb6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xe092af018bc03fb6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3e9acb768, %r1, %r9
	setx	0x1125e9e47a7a75f7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fde73bb5d8, %r1, %r9
	setx	0xd1c0953752972e2e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xd1c0953752972e2e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7afa1a798, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001010100000, %r1, %r9
	setx	0xd1c0953752972e2e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c387e44913, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001000100000, %r1, %r9
	setx	0xd1c0953752972e2e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f79a5a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9bb668, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f86cc27528, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e54b2a5978, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d9c3fe2558, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000001050100000, %r1, %r9
	setx	0xd1c0953752972e2e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080eee28d3e, %r1, %r9
	setx	0x57dc4668e7b30e55, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec8879c, %r1, %r9
	setx	0x7d633faa07d30c4d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe09755, %r1, %r9
	setx	0x80f10843665bcf7e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x80f10843665bcf7e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cbc2dbbac1, %r1, %r9
	setx	0xa32e43a09ae79594, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xa32e43a09ae79594, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd1b97e424, %r1, %r9
	setx	0x33b5a6280101eeb8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e59649727e, %r1, %r9
	setx	0xca2163a255cb31c5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa5675839d, %r1, %r9
	setx	0xc75d09ae53a52c93, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4b40e0, %r1, %r9
	setx	0x71335e8694df865e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8b51a0, %r1, %r9
	setx	0xbc3e24c2e495071f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c41ec58440, %r1, %r9
	setx	0xf3fe46eb31f5ecfc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d90d398108, %r1, %r9
	setx	0x0ff4dd1ec2e09158, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x0ff4dd1ec2e09158, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e92c49cdf0, %r1, %r9
	setx	0xcbbac413cf619f9f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6b0bd5fa8, %r1, %r9
	setx	0xe94ad604ff7b88f2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2232dea2c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb34fc4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eea6628, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fd1a0f4372, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ef8abf99ec, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dfb6d02e80, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c65e18e2b2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e7135e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f08eb6db70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ecf906780c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d24adcb01c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c191068e80, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f7da928, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ece2224, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800ec154f6, %r1, %r9
	setx	0x9df915defcf100cd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f57c25e, %r1, %r9
	setx	0x68c155d52f9ca724, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c155e121d0, %r1, %r9
	setx	0xf12679909e2327ce, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xf12679909e2327ce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d13bb801f2, %r1, %r9
	setx	0xdfa6ea3824e0105e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e5f92661d6, %r1, %r9
	setx	0xd11864f2b9200234, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xd11864f2b9200234, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f819717da6, %r1, %r9
	setx	0xd358112349cb76e7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ee7adf8, %r1, %r9
	setx	0xd42df916c7cf02c2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff0a128, %r1, %r9
	setx	0x605b53a721535037, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca38543734, %r1, %r9
	setx	0xb52bfb668124a580, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d32ae6bafc, %r1, %r9
	setx	0x9d3105f212ef7da6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x9d3105f212ef7da6, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e02871f700, %r1, %r9
	setx	0xa3914cc3c877fdc1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xa3914cc3c877fdc1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8e07fd568, %r1, %r9
	setx	0xa393351dbb0cbcb4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0e4f52864, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r9
	setx	0xa393351dbb0cbcb4, %r1, %r10
	stx	%r10, [%r9]
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
	setx	0x000000800e935ad2, %r1, %r9
	setx	0x480cb4ba714f9784, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f6276fc, %r1, %r9
	setx	0xdd013a6292d30c53, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c43bbfa978, %r1, %r9
	setx	0x5ead0a9aa9ba036d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d30ac254e0, %r1, %r9
	setx	0x85a8749dd314ee20, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e97b75f59c, %r1, %r9
	setx	0xa2d8ed43ce81c029, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4e1d84c1c, %r1, %r9
	setx	0xd30a14ed1c82db33, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e58ff20, %r1, %r9
	setx	0x56fed213c2e01d7d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff8bf18, %r1, %r9
	setx	0x681770184a2bf4e5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x681770184a2bf4e5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c0700daa58, %r1, %r9
	setx	0x6dc4d57ec9fd9cea, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d6bda4b590, %r1, %r9
	setx	0x6ce0e693191e63cd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed260550b4, %r1, %r9
	setx	0x04590af27dc9887d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f12f567cf0, %r1, %r9
	setx	0xb3b3652124f8e812, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea8f5d4, %r1, %r9
	setx	0xb6014ea56fb17188, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xb6014ea56fb17188, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2a2e64, %r1, %r9
	setx	0x5b0ecbc2a408ee76, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x5b0ecbc2a408ee76, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c9b88d0e5c, %r1, %r9
	setx	0x6d98dd7b3c6a6515, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db2acd8350, %r1, %r9
	setx	0x3cc26c61d77ee1f5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6455984ec, %r1, %r9
	setx	0x2e73cacdf63910f9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe6e3f35cc, %r1, %r9
	setx	0xf3904c4f35721870, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e37c950, %r1, %r9
	setx	0xa21148901932b7d7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xa21148901932b7d7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9fac50, %r1, %r9
	setx	0x3c3b430f5fb3b3e6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x3c3b430f5fb3b3e6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8ef25c148, %r1, %r9
	setx	0x22a936c3641380fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x22a936c3641380fe, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d892710aa8, %r1, %r9
	setx	0x28c12da43aa92edb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e000a8a210, %r1, %r9
	setx	0x5d19321e68614fa1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f3c4d530a0, %r1, %r9
	setx	0x4980f4bebcbddb05, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080b81f2484, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0cc3c54f4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r9
	setx	0x4980f4bebcbddb05, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ef68ebe25a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d6504b6013, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c770a7f302, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fbeadf0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ff1c22c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e90519c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6cba68352, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e40ac152dc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dcbeededf2, %r1, %r12
	lduh	[%r12], %r11
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
	setx	0x0000001060100000, %r1, %r9
	setx	0x4980f4bebcbddb05, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e2e9a74, %r1, %r9
	setx	0x00b579f0a43cc8b1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f6494ec, %r1, %r9
	setx	0x7a585eaf8589b854, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c4101973e6, %r1, %r9
	setx	0xbe89117ea4b47166, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xbe89117ea4b47166, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd5bc99044, %r1, %r9
	setx	0xca7ec2349ae660ae, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xca7ec2349ae660ae, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e78a1ff83a, %r1, %r9
	setx	0xadfef990afc3fb00, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f3deb7497c, %r1, %r9
	setx	0x89c40b7fe7ca6e96, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x89c40b7fe7ca6e96, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e118580, %r1, %r9
	setx	0x33a31674bdf06969, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4b3898, %r1, %r9
	setx	0x9fa8aa9d09652447, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3b07afe00, %r1, %r9
	setx	0xf63a45c7634db359, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d504b62230, %r1, %r9
	setx	0xe8376796c2d400ba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7296f58a8, %r1, %r9
	setx	0x6a31975a2d375b9c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc96965870, %r1, %r9
	setx	0xd3a36076b764d87a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c771681e81, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f4bdedc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e7250d5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000803977c366, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e3584f8, %r1, %r9
	setx	0x6b3d42a360744e56, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f9fb90c, %r1, %r9
	setx	0x6c7bdd0af1055b61, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x6c7bdd0af1055b61, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cbf89fc710, %r1, %r9
	setx	0xe6f7f6e95cf10747, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dae8d70798, %r1, %r9
	setx	0x7f6ba591302400fb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e7ebf8e6cc, %r1, %r9
	setx	0xd2bb16854cb5a0a6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f254e21220, %r1, %r9
	setx	0x9ade38e5dd9401ed, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eda26c8, %r1, %r9
	setx	0x1ef43fc6fa17a291, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x1ef43fc6fa17a291, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f48dd48, %r1, %r9
	setx	0x5a1221edc9836883, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x5a1221edc9836883, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2e65eced8, %r1, %r9
	setx	0xbeebb182664a2b51, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbee3f83d0, %r1, %r9
	setx	0xccc6ee549cbd35a4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1fbfd27e8, %r1, %r9
	setx	0x89329e2fd10e7436, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x89329e2fd10e7436, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f9ae59c018, %r1, %r9
	setx	0xa029eb1e068b000e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc4ab3f148, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e1ed8fa6e1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d9f7972eb0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ca7a191148, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e1b662e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6e81e0a00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e70beb5822, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d9f8c86f5e, %r1, %r12
	lduh	[%r12], %r11
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
	setx	0x000000809bd01e26, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001000100000, %r1, %r9
	setx	0xa029eb1e068b000e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6df434649, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001070100000, %r1, %r9
	setx	0xa029eb1e068b000e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fe49e425f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ec1c1f6a38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d666afa3a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c2962971c8, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x00000080e97d712e, %r1, %r9
	setx	0xe7b76c18450dd327, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee747c4, %r1, %r9
	setx	0x2b55805e668915e4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd063cf, %r1, %r9
	setx	0x786221fcd46b0fba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c22aa9a668, %r1, %r9
	setx	0x2111c897587cf691, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de76a20ee3, %r1, %r9
	setx	0x66e0777d93b63136, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x66e0777d93b63136, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e933226983, %r1, %r9
	setx	0xe50d40ec5d3e1f82, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe02822a30, %r1, %r9
	setx	0xbc9d4e1248df756e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec584a6, %r1, %r9
	setx	0x340a7693b097f3cb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8ba98a, %r1, %r9
	setx	0x86658ec0b7bc5ffc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c8bdafc072, %r1, %r9
	setx	0x6cefeec1e9743f93, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dca910b9fc, %r1, %r9
	setx	0xb6dd622789c0b483, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000effdb51cf4, %r1, %r9
	setx	0x1d323b34a32a06ab, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f89dc2bd62, %r1, %r9
	setx	0xaab8de856e68d693, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e827130, %r1, %r9
	setx	0x01b73b1da99e20bf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f76e140, %r1, %r9
	setx	0x2365e53ca620fb40, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c39ccf9548, %r1, %r9
	setx	0x2e8fe4fc9f4731ce, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x2e8fe4fc9f4731ce, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d3a15feee4, %r1, %r9
	setx	0xbd28747f299fa091, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e84434e360, %r1, %r9
	setx	0xc6fa532047a575e0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f813cb3bac, %r1, %r9
	setx	0xf091ee1bc00f0af3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef605a8, %r1, %r9
	setx	0x21d3a437f6fc87d9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fbfc9f8, %r1, %r9
	setx	0x2ceac5fef8305ab0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce3b098b18, %r1, %r9
	setx	0x8ed049dc53bb5975, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2f5f25360, %r1, %r9
	setx	0x05cd26d14bc9bf5e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8f5b48f00, %r1, %r9
	setx	0x1f6ddc6a41820b5f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x1f6ddc6a41820b5f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc25800340, %r1, %r9
	setx	0xf118479fa86f4463, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xf118479fa86f4463, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e8a46e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe9c586624, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6a1564d94, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f7654d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef17338, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f88315d520, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e67967c598, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x00000010d0100000, %r1, %r9
	setx	0xf118479fa86f4463, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ec07dd8, %r1, %r9
	setx	0xa56e439b63c388d3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f85d0f8, %r1, %r9
	setx	0x63caf5aa53666e4a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x63caf5aa53666e4a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c66f2d8e80, %r1, %r9
	setx	0xe4017102f2ac9646, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df2db4fd10, %r1, %r9
	setx	0xac55421fb6acf308, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e300cd4018, %r1, %r9
	setx	0x3af5f411572a36c7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f29f177a00, %r1, %r9
	setx	0xe4eab375e39ae5a9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f1e4351922, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e392ceabad, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001070100000, %r1, %r9
	setx	0xe4eab375e39ae5a9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xe4eab375e39ae5a9, %r1, %r10
	ldx	[%r9], %r10
	setx	0x0000008064652c34, %r1, %r9
	setx	0x3465417c1c8f22fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8a67c7, %r1, %r9
	setx	0x6883f0ebbaa2810d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ffa163a, %r1, %r9
	setx	0x0ee65604233e7991, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2521dd5bf, %r1, %r9
	setx	0xe13ed7a46c383124, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de4f6a190e, %r1, %r9
	setx	0xdf93ffe24bfdf0ab, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e84e86090e, %r1, %r9
	setx	0x2c1b985ce77fd1d5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2f6268185, %r1, %r9
	setx	0x5fd68aa7eb5cb2fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea732b2, %r1, %r9
	setx	0xe7eeb8ff242a82b7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xe7eeb8ff242a82b7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f657f9a, %r1, %r9
	setx	0x78e60a67e8c39ea4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c097eb5d18, %r1, %r9
	setx	0xcb2569f173e141e0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d45df4e2ee, %r1, %r9
	setx	0x5e3e6c87e72dd812, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e75ee60762, %r1, %r9
	setx	0x75f5aabdc05207bf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x75f5aabdc05207bf, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f7fae9647e, %r1, %r9
	setx	0x7d0bf102eeca198f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x7d0bf102eeca198f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e78d0e4, %r1, %r9
	setx	0x70215dcb14a33f48, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x70215dcb14a33f48, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9b0228, %r1, %r9
	setx	0x92f0bbd1f9bba2fc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c0da6da6b8, %r1, %r9
	setx	0x25b8c2b852199ae2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x25b8c2b852199ae2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d5d30e2758, %r1, %r9
	setx	0xcd5c09fa194b01ef, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb705de088, %r1, %r9
	setx	0x44876c550b91c29e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f1f7861e64, %r1, %r9
	setx	0x80d1f0d3dbdf33b8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f6b89fc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fce3318, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e1472d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f225ff23a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ee2721f7e8, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x0000001050100000, %r1, %r9
	setx	0x80d1f0d3dbdf33b8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000008097102227, %r1, %r9
	setx	0x8d03165f01bbbd4c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec6745b, %r1, %r9
	setx	0xd3f099dd80061e91, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f158ba3, %r1, %r9
	setx	0xf22834ffdeb92490, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5d9c1d5a8, %r1, %r9
	setx	0xfb93ca0b1ae72eac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xfb93ca0b1ae72eac, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dff2637ac3, %r1, %r9
	setx	0x4ef617a73bb57c0c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e21ccf5358, %r1, %r9
	setx	0x0a8c8baa54d0e5b9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x0a8c8baa54d0e5b9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f08133f632, %r1, %r9
	setx	0x467f97f58f9227e5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de0de0f0b4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e639fa6cf0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000de0f670144, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cd79f75f18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f7e5060, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ecb9558, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f314a04dd0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e3df53fa7c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r9
	setx	0x467f97f58f9227e5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e2737c6, %r1, %r9
	setx	0xdeee1051b99e924b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fb1cabc, %r1, %r9
	setx	0x22f749dba2aa4ffa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c5361431bc, %r1, %r9
	setx	0xce2a55938f3d5b18, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc21b5df8e, %r1, %r9
	setx	0xc31142fe309b639a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xc31142fe309b639a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1524f078a, %r1, %r9
	setx	0xf7a9505fc97d9658, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f25770f9e4, %r1, %r9
	setx	0xaa92f8d240bcc60a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2b9860, %r1, %r9
	setx	0x2ac064d80c1619f4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f579fa4, %r1, %r9
	setx	0x8fc6707f459a13d5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ced75e3790, %r1, %r9
	setx	0xbffc2146d240f1bc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7adcde7f4, %r1, %r9
	setx	0x0ee74a345d940028, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ebe8770974, %r1, %r9
	setx	0xdeaa5d43595e93ca, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xdeaa5d43595e93ca, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f9cdcdf4e8, %r1, %r9
	setx	0x529b3a11be6a847e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb66f50, %r1, %r9
	setx	0x0f190f32f166acf3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe5f6f8, %r1, %r9
	setx	0x098bf7d33a34795f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x098bf7d33a34795f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cdb8b3b730, %r1, %r9
	setx	0xc1565df6aa26e89e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbee9635e0, %r1, %r9
	setx	0x4d7317ec33de80ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e881975210, %r1, %r9
	setx	0xdec58683111805c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xdec58683111805c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f9ad43f140, %r1, %r9
	setx	0x89c519034ad36aa6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6494ec, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e2e9a74, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4e1d84c1c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e8c563c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4226845b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e9357308ec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eddab08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6b8978590, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x0000001040100000, %r1, %r9
	setx	0x89c519034ad36aa6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000803351a564, %r1, %r9
	setx	0xcb5cfad3f8bd326c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e06328c, %r1, %r9
	setx	0x4030766b0857fd73, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x4030766b0857fd73, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f040f01, %r1, %r9
	setx	0x4ef5a53fc8b031d5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8b0cac495, %r1, %r9
	setx	0xadde77099af9c5e9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5046bc0f2, %r1, %r9
	setx	0xc0653696c3d8b1f3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec63eb3218, %r1, %r9
	setx	0x57ac6d9d4aa0181d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc5b794928, %r1, %r9
	setx	0xeb80ba372af2106e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xeb80ba372af2106e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e6863b0, %r1, %r9
	setx	0x2bced5ae5d85c79b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f19df9e, %r1, %r9
	setx	0x2800b23a9679dc5d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c94638339c, %r1, %r9
	setx	0x5cdbb53a29bd076e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd570f2eba, %r1, %r9
	setx	0x70f92b9826a65769, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x70f92b9826a65769, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e647de375c, %r1, %r9
	setx	0x4b0e7edda5739bf5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x4b0e7edda5739bf5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f9482e1126, %r1, %r9
	setx	0x9322ce765c834dab, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x9322ce765c834dab, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e7dd7b4, %r1, %r9
	setx	0x2fc0e0222792be30, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f19d1a4, %r1, %r9
	setx	0x2d5d4e4f7e27db8f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x2d5d4e4f7e27db8f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce05fbc4c0, %r1, %r9
	setx	0xf3bd0a4598276fad, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d030359e54, %r1, %r9
	setx	0xc2f84e0b327f1835, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e04648eb58, %r1, %r9
	setx	0xcd6c3fba4a62cce2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xcd6c3fba4a62cce2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f32763a874, %r1, %r9
	setx	0xadd9821eb1d62924, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xadd9821eb1d62924, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e1812b0, %r1, %r9
	setx	0x4e7e1474b17839e4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fffcaa0, %r1, %r9
	setx	0x510464620b756835, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce88ce0c40, %r1, %r9
	setx	0x2a51a0134edf9ef1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x2a51a0134edf9ef1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9f7f20f90, %r1, %r9
	setx	0xf3cd1d8238f0afcd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ebced0c280, %r1, %r9
	setx	0x86b1812a246a417e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcf5ac6ac0, %r1, %r9
	setx	0x61c8e0ddd3879bc9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f3616e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e7135e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f08eb6db70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cff8ba8b18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f79a5a8, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x0000001000100000, %r1, %r9
	setx	0x61c8e0ddd3879bc9, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080c7b17307, %r1, %r9
	setx	0x0796879cc23ce957, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efa7c34, %r1, %r9
	setx	0x64718f4d041f715f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6df4ad, %r1, %r9
	setx	0x9ea0a8df4d41c622, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c93faf73e0, %r1, %r9
	setx	0x01d03254c211db96, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7bca86469, %r1, %r9
	setx	0xdc688c96c0f88c8c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e942c829ef, %r1, %r9
	setx	0x4fdd82a0b60d9f81, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fecb43b579, %r1, %r9
	setx	0x56254f7661a3b6e3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efef072, %r1, %r9
	setx	0x8a331d2e77c23b67, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe75324, %r1, %r9
	setx	0x3a74b31e8c82498d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c7c70fbdb6, %r1, %r9
	setx	0x733850926af9d6ea, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8944e0d9e, %r1, %r9
	setx	0xa34b66df6aaa64a5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e0bd444200, %r1, %r9
	setx	0x6c3318f635d5c1dd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x6c3318f635d5c1dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f7fea9c882, %r1, %r9
	setx	0x33f0e1c48c8721cf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f1bde28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ead5348, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f834f29380, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e3453e6c68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d3523745d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r9
	setx	0x33f0e1c48c8721cf, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e418130, %r1, %r9
	setx	0x0994cd35fac9bff2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x0994cd35fac9bff2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f81d57a, %r1, %r9
	setx	0x698b95c793aa6c7a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cba2a41838, %r1, %r9
	setx	0x9e80860f79aa2705, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8fd431984, %r1, %r9
	setx	0xb02fe99ac9ebaa21, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e487a4ef10, %r1, %r9
	setx	0x02ad97546b8eebf6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f3768cd368, %r1, %r9
	setx	0x00124e7e418c870d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e19b0ec, %r1, %r9
	setx	0x887dcc68a88a12ee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f11de28, %r1, %r9
	setx	0x8e26efef8eb75e6a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c525ca859c, %r1, %r9
	setx	0x0542467b2b40f57d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de65e009cc, %r1, %r9
	setx	0x74ba6720a2707bec, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eab40f2adc, %r1, %r9
	setx	0x2afca13e7dcf34b7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x2afca13e7dcf34b7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f5c5e16b00, %r1, %r9
	setx	0x0016bc21a2506831, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e3fca50, %r1, %r9
	setx	0xc54aafa1e8a5de83, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xc54aafa1e8a5de83, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5e95f8, %r1, %r9
	setx	0xa0d255ba72714537, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6b82b7b70, %r1, %r9
	setx	0xe8f6c62a14f661d4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4312e7ec0, %r1, %r9
	setx	0x97df87dc2b902f43, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e715b27590, %r1, %r9
	setx	0x12eea3a78ff3e6bb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f78fc6a770, %r1, %r9
	setx	0x48b0f78d783563d6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ef71768, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f823030740, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e9edb08474, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d3d17e3c4c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c590c413d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f0a1db8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e9cc714, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000edeb31e128, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dc7abcbfd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ce9eada488, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f00f7b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e2a9878, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000001080100000, %r1, %r9
	setx	0x48b0f78d783563d6, %r1, %r10
	ldx	[%r9], %r10
	setx	0x0000008089238899, %r1, %r9
	setx	0x3bbb71996c5b3755, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e32c20c, %r1, %r9
	setx	0x154ff37034a295e3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd7c5e5, %r1, %r9
	setx	0xa3ffca595014a884, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce243c9433, %r1, %r9
	setx	0x05c321f4f3c85ecc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d48aba0f68, %r1, %r9
	setx	0x370521ffae22e977, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e662cbd131, %r1, %r9
	setx	0xe0cd54fb266f66b0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f371635abe, %r1, %r9
	setx	0x8e426aaa9d66146c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea19828, %r1, %r9
	setx	0x8ace136a87d81a94, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f34ed00, %r1, %r9
	setx	0x73c465a8164cdc27, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2b9c75010, %r1, %r9
	setx	0x59272c8b623ad2a6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x59272c8b623ad2a6, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d248de2b28, %r1, %r9
	setx	0xc843d0b42c39da93, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xc843d0b42c39da93, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e003444840, %r1, %r9
	setx	0xcfe696f4ae084bb4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xcfe696f4ae084bb4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fc77c478d0, %r1, %r9
	setx	0x2460dea18aaeac12, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ede5342, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fee32d738a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ea494ce974, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000de0f5b7128, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f4aec40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e660388, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fbb3a75040, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000edc3ff5110, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000db57106448, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c88c119960, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x000000800e9da028, %r1, %r9
	setx	0xba0cf4a234d16466, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f288610, %r1, %r9
	setx	0x60819fdfa2df23e1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6549dec48, %r1, %r9
	setx	0x496f5620b308fc4d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dad030f730, %r1, %r9
	setx	0x301d20b6d7a86238, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e2fc8391c8, %r1, %r9
	setx	0x4a497b9b7c36f291, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6c5c210a0, %r1, %r9
	setx	0x3c8d86106c059459, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x3c8d86106c059459, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf4f065f7d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f5dbb08, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e2bf6bf, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008055bd5612, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f7c9266c5a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ebcf8c2c59, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f473b2d77c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f41f9cb908, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e814a600b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d9f65be6f8, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000001090100000, %r1, %r9
	setx	0x3c8d86106c059459, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000008088d62ef7, %r1, %r9
	setx	0x248937a9aa08494a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x248937a9aa08494a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e7cbb4e, %r1, %r9
	setx	0x5117be5396bb16e8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x5117be5396bb16e8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f367730, %r1, %r9
	setx	0x3901d68672fffd17, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x3901d68672fffd17, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cdbc1e4880, %r1, %r9
	setx	0x918d5792c1c45832, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1795e997a, %r1, %r9
	setx	0x9e45b7dd2d922f93, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec455800e5, %r1, %r9
	setx	0x089fc4d903827dc2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f566a28811, %r1, %r9
	setx	0x1a8bd455a8cabce8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x1a8bd455a8cabce8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e374048, %r1, %r9
	setx	0x390112d1fbdf09f2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6ab1c8, %r1, %r9
	setx	0x3e4307cb838840ee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c056f0d488, %r1, %r9
	setx	0x8bbe7dd26acda97e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d05b9e6820, %r1, %r9
	setx	0xdcb004e4d76c7e16, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0563b2c38, %r1, %r9
	setx	0xa00fea84cdbfae4f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe4eccea58, %r1, %r9
	setx	0x92745aeaa35e0b47, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5361431bc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb1cabc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e2737c6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f7fae9647e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e75ee60762, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e604678, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa9f85e1f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e025d10ec8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d6c4cc4fe8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cac9b93f60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f6135a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r9
	setx	0x92745aeaa35e0b47, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e22f442, %r1, %r9
	setx	0xa93080fbe49a88bb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f4186c0, %r1, %r9
	setx	0x8207acda979f99f8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c017fc0396, %r1, %r9
	setx	0x9e56b81325911591, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de24a7840a, %r1, %r9
	setx	0x7d75e8f9400df977, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e691c77828, %r1, %r9
	setx	0xff03fbb500fa9d34, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f23db0bb8c, %r1, %r9
	setx	0x53774808509e4000, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1caf70, %r1, %r9
	setx	0x6219d593b8639341, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb3c0dc, %r1, %r9
	setx	0x46eed25fffdba7e3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c3bedfc3d4, %r1, %r9
	setx	0x8e1ee071ccdef9a1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d81e686eb8, %r1, %r9
	setx	0x6f60c87321eaf082, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e00958f994, %r1, %r9
	setx	0x1feb98710024ace8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x1feb98710024ace8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f640f4ed60, %r1, %r9
	setx	0xaaf6c61d711d94e9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xaaf6c61d711d94e9, %r1, %r10
	stx	%r10, [%r9]
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
	setx	0x00000080de7d3c57, %r1, %r9
	setx	0x2ab966143fdde237, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee22b1d, %r1, %r9
	setx	0x5571629062c36306, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fc212af, %r1, %r9
	setx	0xff9445fc14b1212b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cdcbcc9552, %r1, %r9
	setx	0x4f8b28a8610109a7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3d686838a, %r1, %r9
	setx	0xc70302d8eb80adc2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xc70302d8eb80adc2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e046c65bef, %r1, %r9
	setx	0x357686c512395e79, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f7e7e686b4, %r1, %r9
	setx	0x2123dd2dceacbd59, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed187d0, %r1, %r9
	setx	0xafbb7bf7b5aad155, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd92db2, %r1, %r9
	setx	0xb9ce011c36254829, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c667064be4, %r1, %r9
	setx	0xb7b88eb21635e8a3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4e4524bec, %r1, %r9
	setx	0xa20f2f7ccd62a6f7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e322b11aa6, %r1, %r9
	setx	0x585ca2374f33f242, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f81b6e25dc, %r1, %r9
	setx	0xe2edc5a88c1eccac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0e5518, %r1, %r9
	setx	0x3dd2858d9ba86083, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f07a12c, %r1, %r9
	setx	0x5964fa2c4a973dbc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x5964fa2c4a973dbc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5048f294c, %r1, %r9
	setx	0xfa6918375ccce6c7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc47459c00, %r1, %r9
	setx	0xece48e8e83f22a2b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e809123490, %r1, %r9
	setx	0xa64e166d5477d626, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4a11a02fc, %r1, %r9
	setx	0xe27019993ce3d3e6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f20242a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ed679a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r9
	setx	0xe27019993ce3d3e6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000803a8b18f4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f13a0058ac, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e59875f08b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001020100000, %r1, %r9
	setx	0xe27019993ce3d3e6, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d3bf09afd9, %r1, %r12
	ldub	[%r12], %r11
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
	setx	0x000000800eff6256, %r1, %r9
	setx	0x1d34ce561ba1389f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fa81ff6, %r1, %r9
	setx	0x9e069863a48d9d81, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cfc104fe28, %r1, %r9
	setx	0x01d47678c6daaab9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d604ee58ce, %r1, %r9
	setx	0xccc1a42730345e81, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ece875372e, %r1, %r9
	setx	0x26f99f4ae23031b5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x26f99f4ae23031b5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f3ef399088, %r1, %r9
	setx	0x4008093c52260734, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f79a5a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9bb668, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f86cc27528, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e54b2a5978, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r9
	setx	0x4008093c52260734, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800efe4be4, %r1, %r9
	setx	0x47034267e9359723, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4ed95c, %r1, %r9
	setx	0x735122162e6f95ce, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd00325790, %r1, %r9
	setx	0x4d0b39848a7931d5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x4d0b39848a7931d5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d575556b44, %r1, %r9
	setx	0x3cb9d9d8351ab913, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x3cb9d9d8351ab913, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e59568efdc, %r1, %r9
	setx	0x519269db53e41fbf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f405607ad0, %r1, %r9
	setx	0x0fa8418b88c4c827, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eec8ac0, %r1, %r9
	setx	0x00eda440f6440edd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7675f0, %r1, %r9
	setx	0x08ace2ececdf09b8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c549552270, %r1, %r9
	setx	0x0daa2bfc82ef3326, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x0daa2bfc82ef3326, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7f2f65b48, %r1, %r9
	setx	0x53f9ac9be9e75111, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x53f9ac9be9e75111, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e7be4f7ee8, %r1, %r9
	setx	0xf7ea05932070f19b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fd23c35f50, %r1, %r9
	setx	0xb2ff890469bda7ce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fb0ff00c5c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e73271ea48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d9add1fc34, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cdf43c5ef8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fc4e598, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e4edc98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r9
	setx	0xb2ff890469bda7ce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000008067b0ee12, %r1, %r9
	setx	0x6e31a2359e172b57, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2bed75, %r1, %r9
	setx	0xc448cda7ff005d16, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f8a9c66, %r1, %r9
	setx	0x989e742ee5986404, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3643de21f, %r1, %r9
	setx	0xce06bfd55aecec19, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8311c4b82, %r1, %r9
	setx	0x8f56622f0299886f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x8f56622f0299886f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0bb137ca1, %r1, %r9
	setx	0xffc6f806444e01c9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f5b3b6004d, %r1, %r9
	setx	0x00063c5319ae1647, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e69645a, %r1, %r9
	setx	0x3dd511a704ea3bd1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5f3a20, %r1, %r9
	setx	0xa639bafc5edf6e77, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ccb18389ba, %r1, %r9
	setx	0xf182e78d8a37d5cc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xf182e78d8a37d5cc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df8c16b9f8, %r1, %r9
	setx	0x0064aa07a1f82e7f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eec64347d0, %r1, %r9
	setx	0x0bba096bf6b1cda0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f1e8125a32, %r1, %r9
	setx	0x45f3dc3116a7ae33, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ee1b898, %r1, %r9
	setx	0x0682ddda8d9fcdda, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x0682ddda8d9fcdda, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ff496e8, %r1, %r9
	setx	0xc9cc9af834a599b9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd69128350, %r1, %r9
	setx	0xaad5f20d02118af3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db3b53fe18, %r1, %r9
	setx	0x343892ac29871ce9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7352f07b0, %r1, %r9
	setx	0x0b9e44e1959328be, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fd3d025de8, %r1, %r9
	setx	0x41bfbb2f0f141e53, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d47c8c6c46, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c3f0fde85a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f90b39c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cecd50e038, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fe3a3fc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r9
	setx	0x41bfbb2f0f141e53, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eb144d0, %r1, %r9
	setx	0xaf11aee54a255b6d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fa83f00, %r1, %r9
	setx	0x959d1e14bd1297c0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x959d1e14bd1297c0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c5373ba678, %r1, %r9
	setx	0xcc3c7c5d42748083, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dcf9db8210, %r1, %r9
	setx	0xffac330f03e8d861, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xffac330f03e8d861, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef393766a8, %r1, %r9
	setx	0xdcb25a2f4596aab3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fea72d1db4, %r1, %r9
	setx	0xc990f404a85bcd16, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000edcc9fe5c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d3b3a33be8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ce2849e1c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f8f3e28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e524908, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fb875acb80, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080e9e6f124, %r1, %r9
	setx	0x41ccb8523cce5045, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e923c8f, %r1, %r9
	setx	0x3e53049edbf8e778, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4d9029, %r1, %r9
	setx	0x854cc8389ab32488, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5a7e101ed, %r1, %r9
	setx	0xd600a336dd055b67, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xd600a336dd055b67, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d3e48a84f1, %r1, %r9
	setx	0xfb61d172e227aab1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e10426807f, %r1, %r9
	setx	0xe349580eb8cc0012, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f514becfa3, %r1, %r9
	setx	0x5ea2d4f9c2518067, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb5ba40, %r1, %r9
	setx	0x20f788a355d497a4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x20f788a355d497a4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fed3940, %r1, %r9
	setx	0x2b9917ecc58db0b1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c77b8af508, %r1, %r9
	setx	0x7240325652bdb437, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d82d429f88, %r1, %r9
	setx	0x88831bbb0fbbaa88, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x88831bbb0fbbaa88, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e82fd4e308, %r1, %r9
	setx	0x7e811b0f5fb30c40, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc3f074c70, %r1, %r9
	setx	0x6f4485c599115b0a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c70448953c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f84805c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e0811a0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008047d1bd39, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f3fc860007, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e8a46e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe9c586624, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6a1564d94, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d75e72c6c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e87d1d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f88eb5d540, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r9
	setx	0x6f4485c599115b0a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080165e6840, %r1, %r9
	setx	0x3a785e3e0294df89, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5fcdc1, %r1, %r9
	setx	0x3a58b682a57aa1e2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f08b0e8, %r1, %r9
	setx	0xf2a0fb7caeb2d8b0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca2a1ccbfc, %r1, %r9
	setx	0x7d22855b90e722f8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x7d22855b90e722f8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dc91bb91c0, %r1, %r9
	setx	0x007fa8e3c183237b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef527daa24, %r1, %r9
	setx	0xe888351350ccd75e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f5d6833358, %r1, %r9
	setx	0x09507fd637e447cc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e10ecf8, %r1, %r9
	setx	0x3fe57d32212efb3c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f67c3b8, %r1, %r9
	setx	0x1a38c489d595be96, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x1a38c489d595be96, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c8344fd758, %r1, %r9
	setx	0x6fb169ad96c8f552, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd6522ea60, %r1, %r9
	setx	0x196a166f4582fc7f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0b6a62d80, %r1, %r9
	setx	0x4cdf30fbe249587d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc96acc8d0, %r1, %r9
	setx	0x7c99f1c4325dc231, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f3e2e5a, %r1, %r12
	lduh	[%r12], %r11


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
	.xword	0x2d469c65fa43a4ac
	.xword	0x610177b8fe4d4e03
	.xword	0xad8958eaadb08948
	.xword	0x45c7188a06205060
	.xword	0xfd9fb8db7df49361
	.xword	0x614e50f7e44c5792
	.xword	0x130e93d24496e996
	.xword	0x05beed6fd89e9037
	.xword	0x1fe9eed5ecce17fb
	.xword	0x0d1c58d2e7025619
	.xword	0x8ce2ddd474696f8f
	.xword	0x6a05cda968c961ea
	.xword	0x24a5a46df2d876d9
	.xword	0x8c2804f3c55ba030
	.xword	0xeabacd9542f70ced
	.xword	0x5b1036f29a55f37e
	.xword	0xe0294fc9ac920b8f
	.xword	0x9c9ab7a83c4f545c
	.xword	0x7be26888168b8f7e
	.xword	0x84534942374e3493
	.xword	0xb684cfaa56bc6f17
	.xword	0x64ee657d1e94d3c5
	.xword	0xca5240cab07a5408
	.xword	0x2934990922634814
	.xword	0xf5007437f31e81f6
	.xword	0xc6f82a465d7aa16c
	.xword	0x76f5b1d783ed6dff
	.xword	0xd2b1c22dd0d2a91b
	.xword	0x351292ea5464240a
	.xword	0x6db54121d450e775
	.xword	0xb62f3d5f29e017dd
	.xword	0xf4ebffbcc08e082d
	.xword	0xae205f0d0add282d
	.xword	0x95eb397fd47ffce0
	.xword	0x191551ef09fcd142
	.xword	0x8b297d595551f406
	.xword	0xe81d2a7574522e02
	.xword	0x15ace60a00b1e0fe
	.xword	0x42a3b4f27521522d
	.xword	0x0667fcff96192ae5
	.xword	0x072e06f209a69dbb
	.xword	0x9fe87311ca142db2
	.xword	0x85e46d5d6414bb49
	.xword	0xeee453d398e6facd
	.xword	0xec4755f2f4ab46b2
	.xword	0x756bc27823e1dc39
	.xword	0xc33395153372036e
	.xword	0x73193a9765b74897
	.xword	0xbf72bc6c1e96442d
	.xword	0x3c989312b1004e49
	.xword	0xab61b0a5e79e8d89
	.xword	0x82565d67cb27936e
	.xword	0xebec1abbb9bb6ad8
	.xword	0x62056744e5a337e9
	.xword	0x03d4b91d9cf58051
	.xword	0x5bb789ae62bfea32
	.xword	0xfd4ee3bbad0bf699
	.xword	0x5bb307e68bec16ab
	.xword	0x96a7a96ec7354872
	.xword	0x90b742bb899b131b
	.xword	0xe3c38961db9ffc63
	.xword	0x22127a075c114664
	.xword	0x149bf80863403673
	.xword	0xb126a0b472f1bb16



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
	.xword	0xe42d94832368b95d
	.xword	0x294b902bab53290b
	.xword	0x542ac9563b79b8c1
	.xword	0x8146b9514cfcc9ec
	.xword	0xaa1eb82799ebac89
	.xword	0xb4b8d739f36842fd
	.xword	0xf43ca1dc1e8c2045
	.xword	0xa10484e197e7c23f
	.xword	0x971959165bc9ae1a
	.xword	0x2fa50c15547346b8
	.xword	0x61fad734450c2fd9
	.xword	0x5a3ea721ddb3c636
	.xword	0x0a1b15a52c6bb7f0
	.xword	0x156bdd1551be93a6
	.xword	0x9a7ee1a69899601e
	.xword	0x9b93e95dfbd19052
	.xword	0xe38bc5f901fdfc2b
	.xword	0xcbf1f208ae338321
	.xword	0x4c13ae0b2d868633
	.xword	0xc77a9d30d1ec79e4
	.xword	0x26c57daa3b5f491c
	.xword	0xfb33b24d86b916cc
	.xword	0x8993d5856a2168c0
	.xword	0x6f1ba49ddf64f398
	.xword	0x8dbeafd1dfa36249
	.xword	0x6dad893ca3956219
	.xword	0xdb98297c43336bdc
	.xword	0xc811cbb4159cf1bf
	.xword	0xe8e22a8e07cff497
	.xword	0x7475fd2d0c0f590e
	.xword	0xbb67af0158f6c51d
	.xword	0xba7190d95272394c
	.xword	0xd4035c106f84493e
	.xword	0xf213b43df535260f
	.xword	0x0b5270a6b4438721
	.xword	0x29fc38ce29ce44dc
	.xword	0x4ae2c31a62e727f3
	.xword	0xbf86d33965cd398b
	.xword	0x9ae19d77b9ec6c8e
	.xword	0x2d7d3a568a55073b
	.xword	0xf8ca24efd68d90a4
	.xword	0xb7a90595240e295d
	.xword	0xfc8f784d246b0b9c
	.xword	0xf9b57ffe22e1d2f7
	.xword	0x35d4671b1825415e
	.xword	0xa76420d5f6423503
	.xword	0xe83164cdb9928b57
	.xword	0xfa1f2f381732b82b
	.xword	0x6dc6e4b0fbfcc15d
	.xword	0x3f75b9bf6f21d079
	.xword	0x9b58aa56b13c3df8
	.xword	0xb90f8d510f445175
	.xword	0xbcf47b1592fbff55
	.xword	0x8f1ee060e402be02
	.xword	0xe0e4a47df7cc5891
	.xword	0x2257210f38aabcbe
	.xword	0xe9704dcce62918b0
	.xword	0x88403def709099ce
	.xword	0xa4465bea64ed945d
	.xword	0x51917b798ae33c9a
	.xword	0xf16e16476ba6c887
	.xword	0x46f8868e390a2f1e
	.xword	0x134d20228fac435d
	.xword	0x85afb8ae5908f562



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
	.xword	0x9162cec06c746f6f
	.xword	0x398739787b68d857
	.xword	0xc71909293c44485a
	.xword	0xd462208322f81fca
	.xword	0x868c7f1035b0c8de
	.xword	0x037560549f53470e
	.xword	0xa79dbc37223e4524
	.xword	0x28ecb691a917656a
	.xword	0x24ff0b6d9edf2f3d
	.xword	0x49b1b00f4997e391
	.xword	0x136fbed0d12826bd
	.xword	0xbfaeebb43a3758f7
	.xword	0x3d1ee3f075b56533
	.xword	0x600c78d4fce5b5ab
	.xword	0x33c7e6f118823fea
	.xword	0x9f619b22c036bd52
	.xword	0xa56248a57448e14f
	.xword	0x657c4bb5032a8351
	.xword	0x819ae5fda1a4fde7
	.xword	0xf0400c9bfc001b9b
	.xword	0x53a5e5397a61a8da
	.xword	0x2a1a609191067eda
	.xword	0x73cc40e7f37ea3ce
	.xword	0x294ec2fe8bb87c9a
	.xword	0x1520c6c7ac2114c0
	.xword	0xd6cc95448363af1f
	.xword	0x1e8f62ae1993b333
	.xword	0xd2730d14088dfc7a
	.xword	0xa1bf48ac5df14c43
	.xword	0x53fc31e3e781dc48
	.xword	0x8fa3869ad65b43cc
	.xword	0xbcd5fadf926a0193
	.xword	0x4e5699aea00e6673
	.xword	0xb8df4d188527d5e9
	.xword	0xf185450c15812dff
	.xword	0x9fdd763975bd23e4
	.xword	0xc68b3c45eb1b7a9a
	.xword	0x96df524061ab6113
	.xword	0x848431caa07e1ed3
	.xword	0x54f3a9645e714480
	.xword	0xa6b65312aaa36842
	.xword	0x183ea87f1dc422a0
	.xword	0x92b3d8bdce79b520
	.xword	0x0183ec16c7ef6b99
	.xword	0xdfe6ad3144e15e8e
	.xword	0xc4a67f2edb1d1b30
	.xword	0x55aeb2c24a8024ae
	.xword	0x765ad7e33d6e4a63
	.xword	0x56ac402ce16dba2b
	.xword	0x1b94b8aab752f3c8
	.xword	0x5dffb3c3b3341881
	.xword	0x04449320e7fd710a
	.xword	0x3207e376ed656a52
	.xword	0xd433402cda58b94f
	.xword	0xcd02548e2edce925
	.xword	0x53e31422b4d66a7d
	.xword	0x176e8402d48cb616
	.xword	0x9c9704fc4185fc18
	.xword	0x374a41a3027e3260
	.xword	0x436861a45e363568
	.xword	0xa9d5c19338313d8f
	.xword	0x4269f4c09092a570
	.xword	0xccb488a4bb39bdd4
	.xword	0x9ce818923fd2e5ce



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
	.xword	0xf7bf8f212f7e7f70
	.xword	0x864f5764212d3cb0
	.xword	0xc40d537b503c86db
	.xword	0x72c92b73b29d5bdd
	.xword	0xcd64f9d284c5527b
	.xword	0x80c31bb879c22345
	.xword	0x440a8e88b4001c88
	.xword	0xe714cfbd8ff3e4be
	.xword	0x884deaf7c1871336
	.xword	0x412145cfed173d7c
	.xword	0x18d3913843b2db19
	.xword	0x6de29f92d470b28e
	.xword	0x3d696d65e211663a
	.xword	0x37f1d8ec6e20c93c
	.xword	0xe9235d234d23e7e1
	.xword	0xeffe16aa92b7b2f0
	.xword	0xcfa0ef861d734350
	.xword	0x035a28f334059c86
	.xword	0x0a01848ee0939874
	.xword	0xac92ae686437d322
	.xword	0x535cb1ed36b48fbe
	.xword	0x189373e1572c2f9f
	.xword	0xba4f6c668c2c1b6e
	.xword	0x702867ce95606cd6
	.xword	0x561cbc3dd423bdb5
	.xword	0x48897e643633b101
	.xword	0xd4cc2c37f102f2f6
	.xword	0x88b5bf7ba7b913fd
	.xword	0xc1ab2eb57a5048d0
	.xword	0xb5f91dff41d57c6e
	.xword	0x0c9ab54acbdf4463
	.xword	0x04a95cbdd98027e3
	.xword	0x41576e248f06032d
	.xword	0x54b166c9b2cabec4
	.xword	0x8267ddfce910c3da
	.xword	0x1147acdc593ef932
	.xword	0x58b75f72594f593a
	.xword	0x618e6bfaea2b7c82
	.xword	0x803e16284abc249c
	.xword	0xb1757bc52a9558f1
	.xword	0xf942093cb95e7a3a
	.xword	0xe498b2d97507b022
	.xword	0x60bd27a3664b05d2
	.xword	0x25302d324469df52
	.xword	0x2a24e205024bf649
	.xword	0x1ad8517735e443fc
	.xword	0x37084280a53d110c
	.xword	0x1e04708aa9d47b52
	.xword	0xda73ae5aece0cfc8
	.xword	0xad43606b1c3020e5
	.xword	0xd32b33218bc39ff2
	.xword	0x47717b883df0ee51
	.xword	0x17b1d0c60f649433
	.xword	0x8412be81a63216b5
	.xword	0xb241905ef3a3b94a
	.xword	0x3f8a8bb98e4ab048
	.xword	0x83bc52a9d2ac75af
	.xword	0xff583153a95f4f27
	.xword	0x2f7ebb996c076f9c
	.xword	0x61d5c09327eb422e
	.xword	0x02907a034b3798e6
	.xword	0x2794ea3602901a71
	.xword	0xe9de1cbc44853a42
	.xword	0xf5984657200c362a



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
	.xword	0x9c8572e38d30e5a4
	.xword	0x42e4d1230794a8dd
	.xword	0xbac83d12f26ffb90
	.xword	0xf28a3e92fa6e1f47
	.xword	0xae5c0113a14976f7
	.xword	0x07fa9d7e90e7de12
	.xword	0x7f14698ec17685ae
	.xword	0x08c1a26568e04b09
	.xword	0xc50ea248418ccbd3
	.xword	0x68499fb1c582b007
	.xword	0x8086f4549acf2c2c
	.xword	0x1880cc4cc05dfe3a
	.xword	0x7880addb08202612
	.xword	0xd69aa42d3bed73a6
	.xword	0xc1ddf092060e3119
	.xword	0x85c1ca29407c5328
	.xword	0x2755384e92dc4b08
	.xword	0xd377728e9d2acc34
	.xword	0x36c9dd04834af8a9
	.xword	0xb24bd208900dc5e5
	.xword	0x14975482e8cba9f9
	.xword	0xada03f1b39a85b1a
	.xword	0xbdf679bf89860487
	.xword	0xe66203a6c4f50ff5
	.xword	0x80d25d1db0d9aea3
	.xword	0x53420d883c663a9e
	.xword	0xa9e4669543ba9f4a
	.xword	0x8ca2670a31f2b126
	.xword	0x182afc394b1a1f76
	.xword	0x7c556b51bfd03d26
	.xword	0x32da2890c7b14b12
	.xword	0xfb9127e3e8dda222
	.xword	0x0b7b1eb6c3457e74
	.xword	0xf9fbf520af054b33
	.xword	0x859a0ef8679153c4
	.xword	0xfca03039720950e0
	.xword	0x7bbdc30011e8093f
	.xword	0xd12745a64234abac
	.xword	0x9dcb7b5321f9ac40
	.xword	0xc45f0bf4d355a6ba
	.xword	0x0653f456058b475d
	.xword	0xff4b76fbfa7fb34f
	.xword	0x3c96870367de97d6
	.xword	0x0c64c13192436e6c
	.xword	0x3774153ff0488bb9
	.xword	0x7ddb2995a3e419d4
	.xword	0x24f088b01ec791f2
	.xword	0xd9f4659fe4155e2b
	.xword	0x5f63ee3e57414602
	.xword	0xeedb0361caac103f
	.xword	0xee84325470aaa646
	.xword	0x3e8ce443c34ed2dc
	.xword	0x180b9ec13bea95f5
	.xword	0xce8e50813c40dd31
	.xword	0x5b0410baa42ff7c2
	.xword	0xed69054ae590843b
	.xword	0xe32252540688eeaf
	.xword	0x81acd67f312699b1
	.xword	0x7396297efe05584a
	.xword	0x105b2b0a3b38e507
	.xword	0xa37a97b10812925d
	.xword	0x3bc6899125be359b
	.xword	0x13c5fd3815ebed29
	.xword	0x71e72258edfe5bf1



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
	.xword	0x6b4aeab2be7a2c4c
	.xword	0xb7c60ed138fb1b4f
	.xword	0x88fafa688e4ed1b1
	.xword	0xde837a36c85eaca6
	.xword	0xd063500c59501ec0
	.xword	0x9764be7776fd99e4
	.xword	0xee46768c917de3dd
	.xword	0xd82941619ad4a8b0
	.xword	0xf47aaa7e4bcc81ac
	.xword	0x3cb2e59805fa65dc
	.xword	0x0c2da9250c3c53fa
	.xword	0x44a8eb318406460d
	.xword	0x3fc5982c3b0212c6
	.xword	0x7b709fdeb7756765
	.xword	0xe36407dbf466cf85
	.xword	0xdad453f241699b56
	.xword	0x2e3c7db016d0b291
	.xword	0x9370d92340073d4f
	.xword	0x985c327487ac5310
	.xword	0xdb88b4784c6f304f
	.xword	0xebe23217328e63ec
	.xword	0x0ff9874343cfbe24
	.xword	0xb77b9dfb9e453126
	.xword	0xb3eb5bf3091a842d
	.xword	0x2fa7189e6f644f03
	.xword	0xf8dc0df8a3418428
	.xword	0x6bba049ca4dfffa9
	.xword	0xe633f92f5b84ccdb
	.xword	0x038a71e0bff35937
	.xword	0x733269c8311f6271
	.xword	0x178d54106a453815
	.xword	0xec87e4d07d04651f
	.xword	0xd702d08212cf54a0
	.xword	0xa4212f447cbac6e4
	.xword	0xf512455b2d63cb5f
	.xword	0xe320f70c961d7b5d
	.xword	0x6e983a2a63d04899
	.xword	0xc0bed6945063a193
	.xword	0x032fad148c963ee8
	.xword	0x9f81bcc35465caa1
	.xword	0x84383984bdeda7a9
	.xword	0x3442014ea3766262
	.xword	0xef6041ce283a6831
	.xword	0x1d8432b73bed98d3
	.xword	0x7d101c889a3421eb
	.xword	0x4f1c414ff2cea0c4
	.xword	0xfc9102def837c337
	.xword	0x8f92d679a70de79c
	.xword	0xe65ce1522261e3f1
	.xword	0x3c6a43bf664ae28f
	.xword	0xe5252ad438802a5a
	.xword	0x777ed9191076dfea
	.xword	0x68b014f8ce5c3628
	.xword	0xc2a98948dfbf761e
	.xword	0x85d4bbe1fa9a5212
	.xword	0xff7911fbec7840b3
	.xword	0x1c5369d082a94c93
	.xword	0xc71f0cdcbc3cc26c
	.xword	0x7c033924bf864b06
	.xword	0x2abec8bec127e2cc
	.xword	0xa7e2cd439397f0ca
	.xword	0x8fc5f112d4458f19
	.xword	0xf582400102fae86a
	.xword	0x0cb2b1363965a9d3



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
	.xword	0x8b88a7355ccc95fa
	.xword	0x233f50fa14df316e
	.xword	0x48efa60a9f9f6f57
	.xword	0xf78941a0ec2442f2
	.xword	0x80e1b5d5d443dd36
	.xword	0x45b087df6610d670
	.xword	0xe5b11e88a8da9a4c
	.xword	0xd5f48c7a8ab639dc
	.xword	0xc6e5930834e34d2b
	.xword	0x147dc92c4a6cce2e
	.xword	0x742c945eb1678b05
	.xword	0x38e1d55293886ece
	.xword	0x18042a2a12a747b6
	.xword	0x4b471ed9a4ebfe2f
	.xword	0x230f8ee62484a712
	.xword	0xd6fa66bc2aa756ba
	.xword	0x6536088547ff56bc
	.xword	0xa808d9a1b803cf2f
	.xword	0x600b34da9a5cf4e7
	.xword	0x7ee1263f11583d57
	.xword	0x066c2d483f05b865
	.xword	0x8b787b9959eb3290
	.xword	0x06b7188e74270625
	.xword	0xa5391735084b6419
	.xword	0xaabd32be310f1b35
	.xword	0xc720b5b5d931f95e
	.xword	0x6bce73f4e5b74bdb
	.xword	0x14c59e3ab3c1b076
	.xword	0x23f755b99e9c723e
	.xword	0x8362b9fef622efe2
	.xword	0x06c275481a9fb161
	.xword	0xf3650a003bb7d695
	.xword	0x6bf3b8cb24ca2f1c
	.xword	0x61220277b4629ec2
	.xword	0x8f4fa6f56e2476c7
	.xword	0x6e2de26e4ebe501b
	.xword	0xc41c7e0e7df0f500
	.xword	0xa4177335ffabff1c
	.xword	0xa3532d362eb1a4d9
	.xword	0x5b659fb6cb2cc804
	.xword	0xf8eae5e398625f6d
	.xword	0x49d86f9a8de2c89b
	.xword	0x3875cf837fb677dd
	.xword	0xc2ce0d6deb58f4a5
	.xword	0x1b7746de33e86d53
	.xword	0x3decdf3795d552f5
	.xword	0x1175d80097353c83
	.xword	0xd97f22a2d302cc0c
	.xword	0x370082d4b609e1c4
	.xword	0xcc59ac731fec4319
	.xword	0x9f5d59bccd0dd242
	.xword	0x8cb6cf46aa2a74d6
	.xword	0xedbfa3fe0e1d8dbe
	.xword	0x2ceb95a020106415
	.xword	0x9a7d1521dde4b387
	.xword	0x175bf51e3b99bbc3
	.xword	0xc21e461ffc59391e
	.xword	0xedc05ace2f86acb2
	.xword	0xdc04556fe4a91cba
	.xword	0x71da9734c6c4ea2d
	.xword	0x09c05fcca217aa2c
	.xword	0x3d3636e8a1f21ad1
	.xword	0xee576905dc2a93bd
	.xword	0xcfb0370bc91224ef



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
	.xword	0xdbbbbd10df6821bc
	.xword	0xc927e434b1ec080d
	.xword	0xe0a3a3d4d37badfe
	.xword	0x9849cc6d0cf53a38
	.xword	0xe5fe8d494fa902ca
	.xword	0xa24d109d162cfb89
	.xword	0xafad9466fc082a6e
	.xword	0xf5abf0a2bd65fe57
	.xword	0x0c50e5145fa29f89
	.xword	0x1069ecf671b1d0e9
	.xword	0x7a8bc2afb8dd928f
	.xword	0x960679c6c4501225
	.xword	0x1b51a983b9201715
	.xword	0x51563ac1011dd3d3
	.xword	0xbff0202e92087b0d
	.xword	0xecf93a0cc8c9ee7d
	.xword	0xcd933bc4a741b3e2
	.xword	0xa0a8a1fc113cea98
	.xword	0x0554c68f4dd92cf4
	.xword	0x973eb5a501af63a3
	.xword	0xd341e4916cd7b858
	.xword	0xbfcecfb292860323
	.xword	0x923e1a49004e7ce0
	.xword	0x829c4cce55b93448
	.xword	0xbc6a760c562fbf15
	.xword	0xecf1ec4d14b5ccec
	.xword	0xb0c46e200270abec
	.xword	0x761838038b28a5ae
	.xword	0xfc19b42fc29513ee
	.xword	0x1180b917f0db00b7
	.xword	0x8439c45f9ccc1e0b
	.xword	0x0eea1e8ea5c8507e
	.xword	0xe460ecea02c2a768
	.xword	0x4348f3d714732a7d
	.xword	0x21878276d8739dd3
	.xword	0xcfb4db4d946b17c2
	.xword	0xf6b5465ca5949b99
	.xword	0xbbdd70a9e0409209
	.xword	0x2b987b4404724252
	.xword	0x98cbb3bc45faeec3
	.xword	0x0b03b2bc1834bbd3
	.xword	0x4ce68b3b63abf4c7
	.xword	0xba9cb1fc2fd19838
	.xword	0x3f367393335cd73b
	.xword	0xf4bb32a49d8d6288
	.xword	0x63c5449b51c77983
	.xword	0x491faafcf5d4e558
	.xword	0xd926895d93877287
	.xword	0x29a495c374528505
	.xword	0xeef32b0ec0fc6e19
	.xword	0x032f2ad5bf18e145
	.xword	0x3c42ba18432bf954
	.xword	0xc629be1b11724714
	.xword	0xfe1a0606350e8c4d
	.xword	0x2ca55a641a24cd79
	.xword	0xb231b106b8670383
	.xword	0x4aba1fca49a478e0
	.xword	0x026a1afddd4e7eec
	.xword	0x949087e184cdbde5
	.xword	0xc9e418f0b956d89d
	.xword	0x04e252a1b5022185
	.xword	0xbedac120fbbbbb8c
	.xword	0xbc7ff07722e41de6
	.xword	0xa25a9bfbe4d13195



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
	.xword	0xcc1b0f32e9da8de6
	.xword	0xcce46e8d9919e00c
	.xword	0xbf8fb418a83ab8fb
	.xword	0x8b96bec8c695014f
	.xword	0x57740a2a20b72157
	.xword	0xd36a71dbf83933ce
	.xword	0x9e0dd1cfe16f7208
	.xword	0x2eff5f3235fe29ad
	.xword	0x73fb587b558187ba
	.xword	0x7bab687d331ca511
	.xword	0xf0bdd25fb24bb3f5
	.xword	0xbd2afa27992f2d56
	.xword	0xb96ba00b93bd0c93
	.xword	0x3ed58f58d198d07a
	.xword	0x9ceaaf0a7f4255a1
	.xword	0x08a9621534fbfaec
	.xword	0x51624d29bc06e2c3
	.xword	0x5864194102e258d2
	.xword	0xb1f6d87f7dc631d8
	.xword	0x34e91201195b8aee
	.xword	0x696eb62bbb3d32a9
	.xword	0x0dec8547b850a944
	.xword	0xe021179ce05205e2
	.xword	0x7b1f36adfa7a0535
	.xword	0x2dd5cbc217f20def
	.xword	0x697863c4c3bce831
	.xword	0x3274e6d849575fa6
	.xword	0xa97ed17b1e974af6
	.xword	0xd32a081df3d958ef
	.xword	0xd09ce55f668d338b
	.xword	0xc2e878acf4e65018
	.xword	0xe5fbf80c0289f208
	.xword	0x63273fd0ba2a2e00
	.xword	0x25face4a1b729acd
	.xword	0x2c29dc2ea41d55e7
	.xword	0x5392846d2cbf7dc8
	.xword	0xb869d35a291170e2
	.xword	0x4b4b33f8b21f3eb9
	.xword	0x873ce6d0baea89b3
	.xword	0x8b2c68e7d490a23d
	.xword	0x0abd48f38b89540f
	.xword	0xe7a821d53f97ace3
	.xword	0xa17a6a7f0823fd48
	.xword	0x4d391d7f6ac711d7
	.xword	0x828766e383f1db42
	.xword	0x653ad3583ab03fed
	.xword	0x466ca99aeba7e07b
	.xword	0x18d331c2fea97b82
	.xword	0xc806f91d5b2876a2
	.xword	0x4b13d8ba7496a6f6
	.xword	0xfe89bcd573ea9b21
	.xword	0x3264d3b95ad3c6cc
	.xword	0x41e21dd76e5b4999
	.xword	0x4d822153734c1504
	.xword	0x780b4e7f208b9337
	.xword	0x5e96f55792dd77e5
	.xword	0x23df1294443efd13
	.xword	0x27b44fb3a1b680b8
	.xword	0xd22250c36be9fc32
	.xword	0x99fcd50c302ee33d
	.xword	0xf7f31a8e19621761
	.xword	0xa51fed5ba2852d98
	.xword	0xa672605b2e14116b
	.xword	0x645c63d2f12197db



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
	.xword	0x2713eb5f0a15dcfa
	.xword	0xd8197989a8a6f04b
	.xword	0x570012423c1c4f28
	.xword	0xe91d7609b7af89bf
	.xword	0x2b966e35a17c9c45
	.xword	0x127abc3c136d694c
	.xword	0x20106796a170aa55
	.xword	0x86141be05985f6f1
	.xword	0xe8b05bfb0b3372b1
	.xword	0xb6d7dc3240e2a686
	.xword	0x03c9071232519c46
	.xword	0x82828fa02d30a618
	.xword	0x53dc505358c7d5cc
	.xword	0x45369947cc7545c1
	.xword	0x5e387f2c55d6e4cc
	.xword	0x0eb56f71a03f253c
	.xword	0xaab9be31bb863dcc
	.xword	0xb6d167cb04358004
	.xword	0x8dc74e099afb040a
	.xword	0x3566102efd3ba062
	.xword	0x24bbf1f0b9a16c7e
	.xword	0x4ba8ea453d0ea7ca
	.xword	0xea755d010fa9e244
	.xword	0x05409ed8e706ccc1
	.xword	0x39ded72f748b9ae3
	.xword	0x48ab2bc00365c157
	.xword	0x4abaa34b77dc32db
	.xword	0xceb51004edf49b30
	.xword	0x4c056467c50bab17
	.xword	0x3744162448ca9eb9
	.xword	0x13164ab4c43dbb8f
	.xword	0x4870f7e307679e03
	.xword	0x9fd8a5e7d6b9ffc2
	.xword	0x4e839df756a99776
	.xword	0x08143b28ad504576
	.xword	0x57e79bb6d242659a
	.xword	0xd166ab6b507895c7
	.xword	0x8cca0241e33e81e0
	.xword	0xf042e43b328a7ce6
	.xword	0xe2421547e10dbdb8
	.xword	0x4a0be486c8f66922
	.xword	0xf8defebb2542d97a
	.xword	0x07537f4cdfe242da
	.xword	0xf548a8dce4158eaa
	.xword	0xb22936e7bf918f87
	.xword	0xe7ed5103bfe174f7
	.xword	0x95a16bb26ffa3073
	.xword	0x6d7b4993aa243f29
	.xword	0x45be71b4cc26d131
	.xword	0x1efdbe7a78f31b8d
	.xword	0xea7a9626de6c0f13
	.xword	0x3451568d76eb458a
	.xword	0x9e53dbb609adf0ae
	.xword	0x697d07ce083979c4
	.xword	0xba6324432eed74a4
	.xword	0x0628d3c63447b07e
	.xword	0x60bba0fb9af2810b
	.xword	0x08f32a6b2770e256
	.xword	0xe26f4a8c44295743
	.xword	0x3a3e634914051bfa
	.xword	0xf368026d6d9b7b47
	.xword	0x608ecb4f0c9a6fd3
	.xword	0xc49621d9fe22e904
	.xword	0xcfb92b999b08c8d8



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
	.xword	0x05f1a7a64af6071c
	.xword	0x02fcf60e2539370a
	.xword	0xcdbf1fe3904ef23c
	.xword	0x2955221037f9719f
	.xword	0xc8eebe43e114798e
	.xword	0xcf3ea6fc87880fd4
	.xword	0x56ba34809174eefc
	.xword	0x2e5b35cf13608817
	.xword	0xabe49b333c63409e
	.xword	0xf18a26636cd7efe6
	.xword	0x31ae85be1d8276e6
	.xword	0xea58926c8bd9b7eb
	.xword	0x68cf0df305e6423b
	.xword	0x434688d9dc0133cd
	.xword	0x59f56e45c57f6a0c
	.xword	0x8b2527460c8e0a41
	.xword	0x0fa61e1e8ab3a492
	.xword	0x6ff302221f8d49f6
	.xword	0x59e68ff2a18350c5
	.xword	0x3366358bfe763240
	.xword	0x0b2d1cdf0f02faf0
	.xword	0xd287a5a290f3e480
	.xword	0xbb901850e6065981
	.xword	0xcdf53e2338b3e6f6
	.xword	0x7ac5d359cc5b7969
	.xword	0x446c5cdbdfbeaca0
	.xword	0xd11d171dfad86dd4
	.xword	0x9f881494dd71ff7a
	.xword	0x1a93a64d83a16852
	.xword	0x1119412064851d07
	.xword	0xf2070b8b3625d054
	.xword	0xec5d9f96925effb4
	.xword	0x6edbc6e0ad413c2f
	.xword	0x53f125d75189ef5b
	.xword	0xdf37503059e8bef3
	.xword	0xac11ee6588500782
	.xword	0x1f5d6185ca55a750
	.xword	0xe366976b621c2cec
	.xword	0xaf5299de781579e5
	.xword	0x78ea5e13341638f1
	.xword	0xb7b91c2b423d47bb
	.xword	0xffb36b78db65b45c
	.xword	0xafe570bcccb4f437
	.xword	0x4ab9db32a861b79e
	.xword	0x21eed99a9e955dc1
	.xword	0xb325fc94afb37db8
	.xword	0x3c763f9759270bbf
	.xword	0xc7d4c15d717ae0fa
	.xword	0x3e524173a73bd4f4
	.xword	0xe50ee2c9570f4e92
	.xword	0x75a53b3c0dd268bb
	.xword	0xfce5a3ad8a196a63
	.xword	0x5b02b0bbceff2571
	.xword	0x8be186d64b098d4e
	.xword	0xa91f4c0cb7a02a48
	.xword	0xaf72462764f0be47
	.xword	0x1c9ebe1e20daf75f
	.xword	0xb1eff1964a21a853
	.xword	0x6c51968d0c4d638f
	.xword	0xb7c1f02adcb20b3a
	.xword	0x4f6b30afa787b23e
	.xword	0x4baa29468ebed825
	.xword	0x5b15936820c1f5ed
	.xword	0x016624d4a2dc1a24



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
	.xword	0x139ae63c4f237543
	.xword	0xbd777e1df9c8ca34
	.xword	0x56eedeb666c51bd0
	.xword	0x1f74dbd7beb823b5
	.xword	0xc261b4fad0177e5c
	.xword	0xf1e31b6b9157bca2
	.xword	0x7f13be07cd4a29d5
	.xword	0x29883fcece42283b
	.xword	0x35ff4abe08582fdb
	.xword	0x65befbf61d15b3bf
	.xword	0x7c1096047330091a
	.xword	0x4e7ae66ab510f8db
	.xword	0x769df2adaa31e6e6
	.xword	0xc8cd59775746c266
	.xword	0xb6124ad511b224d0
	.xword	0x2c706e032e7b4f3c
	.xword	0x69bb7f799d77a9f8
	.xword	0x67e753e9adc819bf
	.xword	0xb8043db3b7bf5f3f
	.xword	0x53a72f78d73a825c
	.xword	0x455f84e9506e9117
	.xword	0xfbd0d0ab218609bc
	.xword	0xc116a50854a96f07
	.xword	0x715cc38f4334e1f8
	.xword	0xea3e4b9928161daa
	.xword	0x9fe52c36e508656e
	.xword	0x91699f7297bf7a08
	.xword	0xffd2c962d3ca06ed
	.xword	0x83b0ed7e2e095c2e
	.xword	0x268ceea4869d6cbd
	.xword	0xde387daa7020444e
	.xword	0xf7e286b72a33cf4d
	.xword	0x0877f60607a601f7
	.xword	0x4785cd87e48c5aa6
	.xword	0xa88638069b92b78b
	.xword	0xcb43c644a48892bb
	.xword	0x305257725627a7de
	.xword	0xc9f28e3e0c5fee85
	.xword	0x2be2bdad755d8a20
	.xword	0x78a0fb584beb43c9
	.xword	0xd16569fb21a06bef
	.xword	0x696878d1bc502c28
	.xword	0xbf5976906426075e
	.xword	0xc45b8929198353f7
	.xword	0x306c022b2a490507
	.xword	0x0cf0c4d4263c4cea
	.xword	0xd478787c4bfc1838
	.xword	0xd1bb610cdd6c0a08
	.xword	0x9b67cd412a70b5ef
	.xword	0x758f3cc4b18a73e4
	.xword	0x62b6c55271e35ba2
	.xword	0x8bf1c61cc15a27a9
	.xword	0x500494d51721da91
	.xword	0xbcd83c22a205635e
	.xword	0x9b046750c15ebf72
	.xword	0x41963c42ff2161ff
	.xword	0x39041a22d7390415
	.xword	0x99599c1019296dcb
	.xword	0xab4216f53e3ae202
	.xword	0xb3591ae60c8c5cbe
	.xword	0xe4d9b54ed6b8ced7
	.xword	0x96531b8a9d0be1c6
	.xword	0x74daa6126c7c9550
	.xword	0x27c94a0cc31cd8cc



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
	.xword	0x72a0786dea3c7b8f
	.xword	0x986f7c36b5dd180e
	.xword	0xbb4b0b2e0d26a02b
	.xword	0x38363575d41e7460
	.xword	0x167e4732e46fdc4d
	.xword	0xcda77f0d22c5da0c
	.xword	0x0bada502a21c907f
	.xword	0xb4e2e41b14a191f8
	.xword	0x718f605c3c3803bd
	.xword	0xca0aabb87edcbb8e
	.xword	0x6966dd9675b53186
	.xword	0xbbd382718ba86a7a
	.xword	0x11e0915f487830ae
	.xword	0x26816ea873a9088f
	.xword	0xe79a09ed398b61a4
	.xword	0xffbe1b9f01195a16
	.xword	0xe0389f6b3725b8b0
	.xword	0xa0a47ae2d4dfce57
	.xword	0x77195b045901b903
	.xword	0x8eb8e4f4b35513eb
	.xword	0xfdec5f7f4f21d6ac
	.xword	0xb4ef0f878636f6a9
	.xword	0x95be36653ea551f7
	.xword	0xb82d0684e49d58fa
	.xword	0x885360d3dc3bc8c0
	.xword	0x8f0fd6dfcbbc1009
	.xword	0xf32480f56a014cd7
	.xword	0xa0de1296ec15ce9d
	.xword	0xb5b87a7a62a172ac
	.xword	0x8220456388eb520b
	.xword	0x876d32707a367d3f
	.xword	0x7231f9f31dfe1bc3
	.xword	0xf7153723d9994ee1
	.xword	0x87b99f73cf5d7c61
	.xword	0x363ae0a9a9aaf417
	.xword	0xaf64f07a44287f2c
	.xword	0x84f117f891c35f3b
	.xword	0x75e289bb71c66132
	.xword	0xc151b60c5515ea04
	.xword	0x66bda65971ed43bc
	.xword	0x46a4e7b3ccc17d5d
	.xword	0xefcf0ee15d5cea03
	.xword	0xf455ff9010ce5366
	.xword	0xf67f5e90105fd4d1
	.xword	0x208c75422dbf81d8
	.xword	0x2a32c77b3944e2ec
	.xword	0xb38e347e24eb5ff6
	.xword	0x6148d20dd25830da
	.xword	0x003e74551580b841
	.xword	0x42c8a5675604b709
	.xword	0x6ccc7c74f51adfde
	.xword	0x5e2b35adfdb6dfe6
	.xword	0xf4f3639ecef62bf8
	.xword	0x2f943ed01abf808e
	.xword	0x847012a9f87c2b3e
	.xword	0x06b3c97c0943f3b9
	.xword	0xd18f08bc4ed29fde
	.xword	0xcfaf3c49e5687612
	.xword	0xe365b0ac8222b3be
	.xword	0x271f09cf0762af53
	.xword	0x81c3db242b5b9372
	.xword	0xbdfe1af2115ccfa5
	.xword	0xa55590194dd3e50a
	.xword	0xb6e349d91378c54e



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
	.xword	0xddda19cc87715ecd
	.xword	0xb04447efbb928908
	.xword	0x900517d75eaccd80
	.xword	0xbc715bb476cb7621
	.xword	0xad5a87f2fecc3439
	.xword	0xb75a31b9d6389520
	.xword	0x1953417b1e7720b5
	.xword	0xdc995339ab4b3a1b
	.xword	0x1b33bb85c283f5bc
	.xword	0x8b9f6b7dcbd8fc87
	.xword	0x120a2cbb44939345
	.xword	0xe0aea68406c7f1ad
	.xword	0x1fbe555819881eef
	.xword	0xb1d4d5da9e3133b4
	.xword	0x4ea4ca34cba4793e
	.xword	0xda3d21c4cf650774
	.xword	0x18f6326b62e128be
	.xword	0x76d3092280fd5643
	.xword	0xbe30f7418ff4dddb
	.xword	0xad11634d8ec6ec92
	.xword	0x4cce7d90e1877ee0
	.xword	0xf3b5b070ab903314
	.xword	0xd8654c02b3abb676
	.xword	0xc7991a52553b9290
	.xword	0x2eebddfd7ac12cc5
	.xword	0x8ecfef3b13b5d979
	.xword	0xb80214bba00c639f
	.xword	0xbbd035908be2ee92
	.xword	0x14371de4eb8046ec
	.xword	0xe638828cec3eefe0
	.xword	0x3cd757fef070d698
	.xword	0x5b335ab67c428509
	.xword	0x9704764c8fa8d548
	.xword	0x5d4f34ee09f94f26
	.xword	0x9efab15a1b87039d
	.xword	0x46c87bc60d0daaeb
	.xword	0x9094a726eea194c5
	.xword	0x4e7828071af35c28
	.xword	0xb1bf56ad5128659b
	.xword	0x76cf7e8ea8bd8816
	.xword	0x2eab12995e5b4810
	.xword	0xa32a512759b3073d
	.xword	0x4579f6c29d1148d6
	.xword	0xd10769dac9523538
	.xword	0x167fc71fe2672617
	.xword	0xed17875ae593db9a
	.xword	0x30fc80bd9b24e5a6
	.xword	0x64263186491f85be
	.xword	0xfec9369d08dda908
	.xword	0x4a7ba6c06f576c13
	.xword	0xcac7e8b6f854f48b
	.xword	0x1a26218519a7668d
	.xword	0x29f2e662b3c2a1d1
	.xword	0x567908849b568116
	.xword	0x50f3864bfe55265e
	.xword	0x119952e02af39f9c
	.xword	0xe24b7505c01f8816
	.xword	0xdb3fea90d2e26218
	.xword	0xe3349b2048e07096
	.xword	0xf9973b389807d99c
	.xword	0x95208ab7bc6c0c49
	.xword	0x92ed3df6003f3cd3
	.xword	0x74387370ac107a4b
	.xword	0xb840d611a4080979



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
	.xword	0xe26223a05c866e50
	.xword	0x82d474c4d7adc97f
	.xword	0xa60adc09607a9b7b
	.xword	0x3801fa8298919741
	.xword	0x3f47fe9d3fce7d2b
	.xword	0xeab9bb561c9237da
	.xword	0xbd7d16c6b87c6256
	.xword	0x31028d2021136079
	.xword	0xa8a86bd9396a606b
	.xword	0xb7c09ca1103303b0
	.xword	0x16e29a2333677c54
	.xword	0x50fecba16f929fc6
	.xword	0xe7d16f84f8a3e0e1
	.xword	0x2bc60daf776daaa2
	.xword	0x6f3d0e887db0b28d
	.xword	0x0c1627831f3a63ab
	.xword	0x249690037b1913d3
	.xword	0x75a330984b2553dd
	.xword	0x99f3f6da6778dcb6
	.xword	0x6c4aef9d4a5e404e
	.xword	0x71c8df3b4e3ab9d3
	.xword	0x93917c22c6f9bb87
	.xword	0xf613e5661f0391d0
	.xword	0xf8a57aa9f715acd9
	.xword	0xeaa0d8d27fb9485f
	.xword	0xeb21f13877c7dbb4
	.xword	0x628048480eb47e5f
	.xword	0x91693558ea44a017
	.xword	0xa0f514fe782d88a4
	.xword	0xb63630ef9c1a0d60
	.xword	0x4482f2be148c8b49
	.xword	0x5c7e9ee2192f882e
	.xword	0x211e885869f1fac7
	.xword	0x06cf3570a3a9b529
	.xword	0x1b8e49b78bde1146
	.xword	0xe603e38e8720c47e
	.xword	0x7ef3286aa189310d
	.xword	0x537303983258e55a
	.xword	0x3ff685c32a640190
	.xword	0x09e8f27a40094721
	.xword	0xae5fdd8e122392fd
	.xword	0xc48f4046c5285cae
	.xword	0xe79ecfa2185c9e5e
	.xword	0xd98105eb0ea74de5
	.xword	0xd6a78125bfcfa5bb
	.xword	0x8586e6afaff723a7
	.xword	0xecc849601c1fde5b
	.xword	0xaaa79d3991ae3463
	.xword	0xc87fbe68873e3195
	.xword	0x0e5939aa26579f8d
	.xword	0xbafa4d67c930189e
	.xword	0x4c9f6572428bb75d
	.xword	0xd2097389d7c32a4b
	.xword	0xc10626c802c570f0
	.xword	0x6e485c597a2204df
	.xword	0xb0ea819552984190
	.xword	0x42bfba8e69dbeb48
	.xword	0xd113c0ff1a969158
	.xword	0xc21c0e6a0b5a3188
	.xword	0x5d2fc6e7fba1e0d5
	.xword	0x73c5f6be2031cbbe
	.xword	0x570f2902681331bf
	.xword	0x53786a172054c3a7
	.xword	0x1891d53b91e81c1b



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
	.xword	0x6003a86590f6c09c
	.xword	0x43fce68866e3f2d8
	.xword	0xdf2dcac40d8e7fde
	.xword	0x4a32980153b1639a
	.xword	0x920da4868a2dd8e3
	.xword	0x13c57b39cd3910c3
	.xword	0xba77ff3c4ae96e15
	.xword	0xe48195702441eb56
	.xword	0x4675ffbc24a585e6
	.xword	0xdcd8145853d821b7
	.xword	0xc50010bb9a76bdf0
	.xword	0x1b96fadbb0360b5a
	.xword	0xbd89f4fdc0114d5d
	.xword	0x430aa6eef29879dc
	.xword	0x604977657c13c944
	.xword	0xdfd0f05e9073c480
	.xword	0xfdc409084dbea02c
	.xword	0xb90508d461f39eed
	.xword	0x9365d9feef529a59
	.xword	0x1c1f963ffaa9c297
	.xword	0x0fb0af39ca397c80
	.xword	0xba66c45adfd55c8e
	.xword	0x09e4d33284cad7f6
	.xword	0xb66fd91d9e10be21
	.xword	0xde763ed3c3092327
	.xword	0xb454c198a8d92939
	.xword	0xbc68d99a3a302d5e
	.xword	0x675e3ed3ce9f94b5
	.xword	0x89351c7f40acb492
	.xword	0xa3cd5422d73736e0
	.xword	0xf352ea23bae74f0d
	.xword	0x1d22aa1572022a02
	.xword	0x2538ccbbaff91950
	.xword	0x0bebe3548565ac0d
	.xword	0x6d9d64a0fc788139
	.xword	0xcb20438a9cabed64
	.xword	0xb45fdb02e6e88922
	.xword	0xb970b835ac1f736e
	.xword	0x220258957f31d700
	.xword	0xd068a1944fd60954
	.xword	0xff953169d6e51093
	.xword	0x283aa9648bbe1394
	.xword	0x9b64725dab49839c
	.xword	0xf1f2db1ae03a9093
	.xword	0x535c3ccbf97282dc
	.xword	0xf979f77218aeb0ff
	.xword	0xde405c16aba6b4de
	.xword	0x21354354a8a60f2e
	.xword	0xc3ac71aeb5c1fe12
	.xword	0x94784621afb1f0c4
	.xword	0x7fd1fd476b633740
	.xword	0x8f92bf94e4245664
	.xword	0x277ec8753a0873d6
	.xword	0xdab757518a0cc716
	.xword	0x7f9cac4c607ed340
	.xword	0xee2eb1de33a0e978
	.xword	0xcd2ac15f97436a92
	.xword	0x77aa9073c708c60b
	.xword	0xddf7e7a26d804607
	.xword	0xe47fcd36175e5b65
	.xword	0xd7e70cda7e5793f8
	.xword	0xe4d1d6b5b41062d3
	.xword	0x5a173bc4836ad64c
	.xword	0x599c7e09b53c8082



#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# 
!!#   uint64 b_DATA_ARRAY[12000], h_DATA_ARRAY[12000], w_DATA_ARRAY[12000], x_DATA_ARRAY[12000],bb_DATA_ARRAY[12000];
!!#   uint64 b_ADDR_ARRAY[12000], h_ADDR_ARRAY[12000], w_ADDR_ARRAY[12000], x_ADDR_ARRAY[12000],bb_ADDR_ARRAY[12000];
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
!!#   int bb_a_wr_cntr = 0;
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
!!#   IJ_set_rvar ("diag.j", 114, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 117, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 118, Rv_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_rvar ("diag.j", 119, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 123, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 132, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 141, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 142, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 145, Rv_memaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 0001 0000 rrrr 0000 0001,"
!!#         "20'{0}");
!!# 
!#   ! Define address patterns for all the various address
!#   ! spaces in JBI
!!# 
!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 156, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 165, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 175, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 185, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 195, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 205, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 215, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 225, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!#   ! BYTE ALIGNED
!!# 
!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 236, Rv_jbi_b_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 245, Rv_jbi_b_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 255, Rv_jbi_b_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 265, Rv_jbi_b_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 275, Rv_jbi_b_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 285, Rv_jbi_b_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 295, Rv_jbi_b_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 305, Rv_ssi_b_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!#   ! HWORD ADDRESS
!!# 
!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 317, Rv_jbi_h_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 326, Rv_jbi_h_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 336, Rv_jbi_h_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 346, Rv_jbi_h_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 356, Rv_jbi_h_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 366, Rv_jbi_h_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 376, Rv_jbi_h_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 386, Rv_ssi_h_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!#   ! WORD Address
!!# 
!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 397, Rv_jbi_w_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 406, Rv_jbi_w_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 416, Rv_jbi_w_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 426, Rv_jbi_w_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 436, Rv_jbi_w_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 446, Rv_jbi_w_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 456, Rv_jbi_w_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 466, Rv_ssi_w_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 475, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 483, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!#   ! BLOCK LOAD STORE
!#   ! Since limited space is initialized we do blk st and load
!#   ! to that limited space only.
!!# 
!#   ! Define address patterns for all the various address
!#   ! spaces in JBI
!!# 
!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 499, Rv_jbiaddr_pattern00,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0001 0000 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 508, Rv_jbiaddr_pattern01,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 518, Rv_jbiaddr_pattern02,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 528, Rv_jbiaddr_pattern03,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 0000 0000 0000 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 538, Rv_jbiaddr_pattern04,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 0000 0000 0000 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 548, Rv_jbiaddr_pattern05,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 0000 0000 0000 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 558, Rv_jbiaddr_pattern06,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 0000 0000 0000 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 568, Rv_ssiaddr_pattern00,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 0000 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!#   IJ_set_ropr_fld    ("diag.j", 577, ijdefault, Ft_Rs1, "{9}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 578, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 579, ijdefault, Ft_Rd, "{16..23}");
!!# 
!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 582, ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!# 
!!#   IJ_bind_file_group("diag.j", 585, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 586, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 589, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 591, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 592, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 593, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 595, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 597, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 598, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 600, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 601, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 602, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 603, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 605, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 606, sjm_5, "\n\nLABEL_0:\n");
!!# 
!#   !IJ_printf (th_M, "\tmov\t0, %%r8\n");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!# !  IJ_printf(th_M,"\tnop\n\tta T_GOOD_TRAP\n\tnop\n");
!# !  IJ_printf(th_M,"\ttest_fail:\n\tta T_BAD_TRAP\n\tnop\n");
!!#   IJ_printf ("diag.j", 639, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 640, sjm_5, "\n\nBA LABEL_0\n");
!!# 
!!#   int i,j;
!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 645,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 64; j++) {
!!#     IJ_iseg_printf("diag.j", 647,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 652,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 884, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: set_reg9  |
!!#            sjm4      |
!!#            sjm5
!!# 
!!# {
!# 		!IJ_generate (th_all, $2);
!# 		!IJ_generate (th_all, $3);
!# 		!IJ_generate (th_all, $4);
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
!!#                    IJ_printf ("diag.j", 913, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 916, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 918, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 919, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 923, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 924, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 925, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 926, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 928, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 929, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 942, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 947, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 951, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 952, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 954, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 955, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 969, sjm_4, "\n");
!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 973, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 974, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 991, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 996, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 997, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 999, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1000, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1002, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 1003, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1008, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1009, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1011, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 1012, sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!#                       !if (sjm_rd0 == 7) sjm_rd0 = 0; else sjm_rd0++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_wr_b_io : mSET_SJM4_WR_B_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_io < 8) { 
!!#                    IJ_printf ("diag.j", 1029, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1032, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 1034, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 1035, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 1039, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1040, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1041, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 1042, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1044, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 1045, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 1058, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 1063, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1067, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1068, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1070, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 1071, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 1086, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1089, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 1091, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 1092, Rv_memaddr_pattern_io);
!!# 
!!#                      rnd_n = random()%5;
!!#                      switch (rnd_n) {
!!#                        case 0 : b_sz = 4; break;
!!#                        case 1 : b_sz = 8; break;
!#                        !case 0 : b_sz = 1; break;
!#                        !case 1 : b_sz = 2; break;
!!#                        case 2 : b_sz = 4; break;
!!#                        case 3 : b_sz = 8; break;
!!#                        default :b_sz = 16; break;
!!#                       } 
!!# 
!#                      sjm0_data_io1[sjm_wr0_io1][15] = b_sz; ! byte size in entry 15, for read
!!# 
!!#                       IJ_printf ("diag.j", 1107, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 1110, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1111, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1112, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1117, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1119, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 1133, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 1139, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 1143, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 1158, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1160, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 1162, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1168, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1169, Rv_rand_mask);
!!# 
!#                       m_tmp = sjm0_w_mask_m_io & 0xf; ! 4 bits * 4 = 16 bit mask
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
!#                      !IJ_printf (sjm_4, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!#                      ! mask_flip = 0;
!#                      ! for (i=0;i<15;i++) { 
!#                      !  fl_tmp = mask & 0xf;
!#                      !  mask_flip = mask_flip | fl_tmp;
!#                      !  mask_flip = mask_flip << 4;
!#                      !  mask      = mask      >> 4;
!#                      ! }
!#                      !IJ_printf (sjm_4, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!#                      !mask = mask_flip | mask;
!!# 
!!#                      IJ_printf ("diag.j", 1196, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 1202, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1203, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1206, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1208, sjm_4, "\n"); 
!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1217, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1219, sjm_4, "\n"); 
!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!#                             !IJ_printf (sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 1237, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1243, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1248, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1250, sjm_4, "\n");
!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!#                             !IJ_printf (sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 1268, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1271, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1273, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1274, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1277, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1278, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1279, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1280, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1282, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1283, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1296, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1301, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1305, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1306, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1308, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1309, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1323, sjm_5, "\n");
!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1327, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1328, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1345, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1350, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1351, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1353, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1354, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1356, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1357, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1362, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1363, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1365, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1366, sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!#                       !if (sjm_rd1 == 7) sjm_rd1 = 0; else sjm_rd1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_wr_b_io : mSET_SJM5_WR_B_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_io < 8) { 
!!#                    IJ_printf ("diag.j", 1383, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1386, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1388, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1389, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1393, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1394, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1395, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1396, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1398, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1399, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1412, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1417, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1421, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1422, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1424, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1425, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1441, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1444, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1446, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1447, Rv_memaddr_pattern_io);
!!# 
!!#                      rnd_n = random()%5;
!!#                      switch (rnd_n) {
!!#                        case 0 : b_sz = 4; break;
!!#                        case 1 : b_sz = 8; break;
!#                        !case 0 : b_sz = 1; break;
!#                        !case 1 : b_sz = 2; break;
!!#                        case 2 : b_sz = 4; break;
!!#                        case 3 : b_sz = 8; break;
!!#                        default :b_sz = 16; break;
!!#                       } 
!!# 
!#                      sjm1_data_io1[sjm_wr1_io1][15] = b_sz; ! byte size in entry 15, for read
!!# 
!!#                       IJ_printf ("diag.j", 1462, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1465, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1466, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1467, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1472, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1474, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1488, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1494, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1498, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1513, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1515, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1517, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1523, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1524, Rv_rand_mask);
!!# 
!#                       m_tmp = sjm1_w_mask_m_io & 0xf; ! 4 bits * 4 = 16 bit mask
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
!#                      !IJ_printf (sjm_5, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!#                      ! mask_flip = 0;
!#                      ! for (i=0;i<15;i++) { 
!#                      !  fl_tmp = mask & 0xf;
!#                      !  mask_flip = mask_flip | fl_tmp;
!#                      !  mask_flip = mask_flip << 4;
!#                      !  mask      = mask      >> 4;
!#                      ! }
!#                      !IJ_printf (sjm_5, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!#                      !mask = mask_flip | mask;
!!# 
!!#                      IJ_printf ("diag.j", 1551, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1557, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1558, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1561, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1563, sjm_5, "\n"); 
!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1572, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1574, sjm_5, "\n"); 
!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!#                             !IJ_printf (sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1592, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1598, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1603, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1605, sjm_5, "\n");
!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!#                             !IJ_printf (sjm_5, "+\n");
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
!#                         ! add a mechanism to control addr1, addr5 in range ??
!#                         ! addr
!!# 
!#                         ! Update the JBI-CONFIG FIFO parameters
!!#                         invalid_config = 1;
!!#                         while (invalid_config) {
!!#                         if (random()%2) {
!#                         !if (config_cnt > 500) {
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1631, Rv_jbi_fifo_wr0_config);
!!# 			IJ_update_rvar("diag.j", 1632, Rv_jbi_fifo_wr0_config);
!!#                         } else {
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1634, Rv_jbi_fifo_wr1_config);
!!# 			IJ_update_rvar("diag.j", 1635, Rv_jbi_fifo_wr1_config);
!!#                         }
!!#                         if (((jbi_config>>24) & 0x7) < ((jbi_config>>28) & 0x7)) {
!!#                         invalid_config = 0;
!!#                          }
!!#                         } config_cnt++;
!!# 
!#                         ! BLOCK LOAD AND STORES
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1645, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1646, Rv_memaddr_pattern);
!!# 
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1648, Rv_jbiaddr_pattern00);
!!# 
!#                         ! to remove address not in dma-fake range
!# 			! since using a limited space we dont need it right now
!#                         !while (jbi0 < 550024249344 ) {
!#                         !jbi0 = IJ_get_rvar_val64(Rv_jbiaddr_pattern00);
!# 			!IJ_update_rvar(Rv_jbiaddr_pattern00);
!#                         !}
!!# 
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1658, Rv_jbiaddr_pattern01);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1659, Rv_jbiaddr_pattern02);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1660, Rv_jbiaddr_pattern03);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1661, Rv_jbiaddr_pattern04);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1662, Rv_jbiaddr_pattern05);
!!# 
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1664, Rv_jbiaddr_pattern06);
!#                         ! to remove address not in dma-fake range
!# 			! since using a limited space we dont need it right now
!#                         !while (jbi6 > 1095216660479)  {
!#                         !jbi6 = IJ_get_rvar_val64(Rv_jbiaddr_pattern06);
!# 			!IJ_update_rvar(Rv_jbiaddr_pattern06);
!#                         !}
!!# 
!!# 			IJ_update_rvar("diag.j", 1672, Rv_jbiaddr_pattern00);
!!# 			IJ_update_rvar("diag.j", 1673, Rv_jbiaddr_pattern01);
!!# 			IJ_update_rvar("diag.j", 1674, Rv_jbiaddr_pattern02);
!!# 			IJ_update_rvar("diag.j", 1675, Rv_jbiaddr_pattern03);
!!# 			IJ_update_rvar("diag.j", 1676, Rv_jbiaddr_pattern04);
!!# 			IJ_update_rvar("diag.j", 1677, Rv_jbiaddr_pattern05);
!!# 			IJ_update_rvar("diag.j", 1678, Rv_jbiaddr_pattern06);
!!# 
!!#                        if (random()%2 == 1) {
!#                         bb_ADDR_ARRAY[bb_a_wr_cntr] = jbi0; bb_a_wr_cntr = bb_a_wr_cntr + 1; ! store the stx address
!#                         bb_ADDR_ARRAY[bb_a_wr_cntr] = jbi1; bb_a_wr_cntr = bb_a_wr_cntr + 1; ! store the stx address
!#                         bb_ADDR_ARRAY[bb_a_wr_cntr] = jbi2; bb_a_wr_cntr = bb_a_wr_cntr + 1; ! store the stx address
!#                         bb_ADDR_ARRAY[bb_a_wr_cntr] = jbi3; bb_a_wr_cntr = bb_a_wr_cntr + 1; ! store the stx address
!#                         bb_ADDR_ARRAY[bb_a_wr_cntr] = jbi4; bb_a_wr_cntr = bb_a_wr_cntr + 1; ! store the stx address
!#                         bb_ADDR_ARRAY[bb_a_wr_cntr] = jbi5; bb_a_wr_cntr = bb_a_wr_cntr + 1; ! store the stx address
!#                         bb_ADDR_ARRAY[bb_a_wr_cntr] = jbi6; bb_a_wr_cntr = bb_a_wr_cntr + 1; ! store the stx address
!!# 
!# 			! store already done
!#                         !for (i=0;i<7;i++) {
!#                         !b_DATA_ARRAY[b_wr_cntr] = IJ_get_rvar_val64(Rv_rand64);
!# 			!IJ_update_rvar(Rv_rand64);
!#                         !data_st = b_DATA_ARRAY[b_wr_cntr];
!#                         !addr_st = b_ADDR_ARRAY[b_a_wr_cntr -7 + i];
!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!#                         !        addr_st);
!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!#                         !        data_st);
!#                         !IJ_printf (th_M, "\tstb\t%%r10, [%%r9]\n");
!!# 
!# 			! Block Loads and Block Stores
!!#                         rnd_cnt = random()%6;
!!#                         for (i=rnd_cnt;i<7;i++) {
!!#                         IJ_printf ("diag.j", 1706, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 bb_ADDR_ARRAY[bb_a_wr_cntr -7 +i]);
!!#                         IJ_printf ("diag.j", 1708, th_M, "\tldda\t[%%r12]ASI_BLK_P, %%f0\n");
!!#                         IJ_printf ("diag.j", 1709, th_M, "\tstda\t %%f0, [%%r12]ASI_BLK_P\n");
!!#                         IJ_printf ("diag.j", 1710, th_M, "\tstda\t %%f0, [%%r12]ASI_BLK_P\n");
!!#                         IJ_printf ("diag.j", 1711, th_M, "\tstda\t %%f0, [%%r12]ASI_BLK_P\n");
!!#                         IJ_printf ("diag.j", 1712, th_M, "\tmembar\t 0x40\n");
!!#                          }
!!#                        }
!!# 
!#  			! cache able store and load to main memory 
!!#                         if(random()%2 == 1) {
!!#                         IJ_printf ("diag.j", 1718, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 mem_ad);
!!#                         IJ_printf ("diag.j", 1720, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         if(random()%2) {
!!#                         IJ_printf ("diag.j", 1723, th_M, "\tstx\t%%r10, [%%r9]\n");
!!#                         } else {
!!#                         IJ_printf ("diag.j", 1725, th_M, "\tldx\t[%%r9], %%r10\n"); 
!!#                         }
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1727, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1728, Rv_memaddr_pattern);
!!#                         }
!!# 
!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!# !                                jbi_config);
!# !                        IJ_printf (th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!# !                        IJ_printf (th_M, "\tstx\t%%r9, [%%r10]\n");
!!# 
!!#                         if (fr_done == 0) {
!!#                          fr_done = 1;
!!#                         IJ_printf ("diag.j", 1742, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 jbi_config);
!!#                         IJ_printf ("diag.j", 1744, th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         IJ_printf ("diag.j", 1745, th_M, "\tstx\t%%r9, [%%r10]\n");
!!#                         IJ_printf ("diag.j", 1746, th_M, "\n\n\n");
!!#                         IJ_printf ("diag.j", 1747, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1748, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1749, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1750, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1751, th_M, "\tsetx 0xcf00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1752, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1753, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1754, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1755, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1756, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1757, th_M, "\tsetx 0xef00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1758, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1759, th_M, "\n\n\n");
!!#                         } 
!!# 
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1765, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1766, Rv_memaddr_pattern);
!!# 
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1768, Rv_jbi_b_addr_pattern0);
!!# 
!#                         ! to remove address not in dma-fake range
!!#                         while (jbi0 < 550024249344 ) {
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1773, Rv_jbi_b_addr_pattern0);
!!# 			IJ_update_rvar("diag.j", 1774, Rv_jbi_b_addr_pattern0);
!!#                         }
!!# 
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1777, Rv_jbi_b_addr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1778, Rv_jbi_b_addr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1779, Rv_jbi_b_addr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1780, Rv_jbi_b_addr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1781, Rv_jbi_b_addr_pattern5);
!!# 
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1783, Rv_jbi_b_addr_pattern6);
!#                         ! to remove address not in dma-fake range
!!#                         while (jbi6 > 1095216660479)  {
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1786, Rv_jbi_b_addr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1787, Rv_jbi_b_addr_pattern6);
!!#                         }
!!# 
!!# 			IJ_update_rvar("diag.j", 1790, Rv_jbi_b_addr_pattern0);
!!# 			IJ_update_rvar("diag.j", 1791, Rv_jbi_b_addr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1792, Rv_jbi_b_addr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1793, Rv_jbi_b_addr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1794, Rv_jbi_b_addr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1795, Rv_jbi_b_addr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1796, Rv_jbi_b_addr_pattern6);
!!# 
!#                         !addr_sel = random() % 5;
!# 			!IJ_update_rvar(Rv_addr_sel);
!# 	                !printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!#                         !store_addr = addr_sel;
!!# 
!#                         !switch (addr_sel) {
!#                         !case 1 : jbi_addr = jbi1; break;
!#                         !case 2 : jbi_addr = jbi2; break;
!#                         !case 3 : jbi_addr = jbi3; break;
!#                         !case 4 : jbi_addr = jbi4; break;
!#                         !case 5 : jbi_addr = jbi5; break;
!#                         !case 0 : jbi_addr = jbi6; break;
!#                         !default : jbi_addr = jbi5; break;
!#                         !}
!!#                       if (random()%2 == 1) {
!!# 
!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi0; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi1; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi2; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi3; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi4; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi5; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi6; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!# 
!!#                         for (i=0;i<7;i++) {
!!#                         b_DATA_ARRAY[b_wr_cntr] = IJ_get_rvar_val64("diag.j", 1823, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 1824, Rv_rand64);
!!#                         data_st = b_DATA_ARRAY[b_wr_cntr];
!!#                         addr_st = b_ADDR_ARRAY[b_a_wr_cntr -7 + i];
!!#                         IJ_printf ("diag.j", 1827, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 1829, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1831, th_M, "\tstb\t%%r10, [%%r9]\n");
!!# 
!#  			! cache able store and load to main memory 
!!#                         if(random()%4 == 0) {
!!#                         IJ_printf ("diag.j", 1835, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 mem_ad);
!!#                         IJ_printf ("diag.j", 1837, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         if(random()%2) {
!!#                         IJ_printf ("diag.j", 1840, th_M, "\tstx\t%%r10, [%%r9]\n");
!!#                         } else {
!!#                         IJ_printf ("diag.j", 1842, th_M, "\tldx\t[%%r9], %%r10\n"); 
!!#                         }
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1844, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1845, Rv_memaddr_pattern);
!!#                         }
!!# 
!!#                         b_wr_cntr++;
!#                         } ! end for 
!!# 
!#                       } ! if (random()%2 == 1)
!!# 
!#                         ! HALF WORD
!#                         ! add a mechanism to control addr1, addr5 in range ??
!#                         ! addr
!!# 
!!#                         while (jbi0 < 550024249344 ) {
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1863, Rv_jbi_h_addr_pattern1);
!!#                         IJ_update_rvar("diag.j", 1864, Rv_jbi_h_addr_pattern0);
!!#                         }
!!# 
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1867, Rv_jbi_h_addr_pattern6);
!#                         ! to remove address not in dma-fake range
!!#                         while (jbi6 > 1095216660479)  {
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1870, Rv_jbi_h_addr_pattern6);
!!#                         IJ_update_rvar("diag.j", 1871, Rv_jbi_h_addr_pattern6);
!!#                         }
!!# 
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1874, Rv_jbi_h_addr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1875, Rv_jbi_h_addr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1876, Rv_jbi_h_addr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1877, Rv_jbi_h_addr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1878, Rv_jbi_h_addr_pattern5);
!#                         !jbi6 = IJ_get_rvar_val64(Rv_jbi_h_addr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1880, Rv_jbi_h_addr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1881, Rv_jbi_h_addr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1882, Rv_jbi_h_addr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1883, Rv_jbi_h_addr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1884, Rv_jbi_h_addr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1885, Rv_jbi_h_addr_pattern6);
!!# 
!#                         !addr_sel = random() % 5;
!# 			!IJ_update_rvar(Rv_addr_sel);
!# 	                !printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!#                         !store_addr = addr_sel;
!!# 
!!#                       if (random()%2 == 1) {
!!# 
!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi1; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi2; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi3; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi4; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi5; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi6; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!# 
!!#                         for (i=0;i<6;i++) {
!!#                         h_DATA_ARRAY[h_wr_cntr] = IJ_get_rvar_val64("diag.j", 1902, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 1903, Rv_rand64);
!!#                         data_st = h_DATA_ARRAY[h_wr_cntr];
!!#                         addr_st = h_ADDR_ARRAY[h_a_wr_cntr -6 + i];
!!#                         IJ_printf ("diag.j", 1906, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 1908, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1910, th_M, "\tsth\t%%r10, [%%r9]\n");
!!# 
!#                         ! cache able store and load to main memory
!!#                         if(random()%4 == 0) {
!!#                         IJ_printf ("diag.j", 1914, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 mem_ad);
!!#                         IJ_printf ("diag.j", 1916, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         if(random()%2) {
!!#                         IJ_printf ("diag.j", 1919, th_M, "\tstx\t%%r10, [%%r9]\n");
!!#                         } else {
!!#                         IJ_printf ("diag.j", 1921, th_M, "\tldx\t[%%r9], %%r10\n");
!!#                         }
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1923, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1924, Rv_memaddr_pattern);
!!#                         }
!!# 
!!#                         h_wr_cntr++;
!#                         } ! end for 
!!# 
!!#                        }
!!# 
!#                         !  WORD
!#                         ! add a mechanism to control addr1, addr5 in range ??
!#                         ! addr
!!#                         while (jbi0 < 550024249344 ) {
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1938, Rv_jbi_w_addr_pattern1);
!!#                         IJ_update_rvar("diag.j", 1939, Rv_jbi_w_addr_pattern0);
!!#                         }
!!# 
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1942, Rv_jbi_w_addr_pattern6);
!#                         ! to remove address not in dma-fake range
!!#                         while (jbi6 > 1095216660479)  {
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1945, Rv_jbi_w_addr_pattern6);
!!#                         IJ_update_rvar("diag.j", 1946, Rv_jbi_w_addr_pattern6);
!!#                         }
!!# 
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1949, Rv_jbi_w_addr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1950, Rv_jbi_w_addr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1951, Rv_jbi_w_addr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1952, Rv_jbi_w_addr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1953, Rv_jbi_w_addr_pattern5);
!#                         !jbi6 = IJ_get_rvar_val64(Rv_jbi_w_addr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1955, Rv_jbi_w_addr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1956, Rv_jbi_w_addr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1957, Rv_jbi_w_addr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1958, Rv_jbi_w_addr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1959, Rv_jbi_w_addr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1960, Rv_jbi_w_addr_pattern6);
!!# 
!!#                       if (random()%2 == 1) {
!!# 
!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi1; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi2; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi3; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi4; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi5; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi6; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!# 
!!#                         for (i=0;i<6;i++) {
!!#                         w_DATA_ARRAY[w_wr_cntr] = IJ_get_rvar_val64("diag.j", 1973, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 1974, Rv_rand64);
!!#                         data_st = w_DATA_ARRAY[w_wr_cntr];
!!#                         addr_st = w_ADDR_ARRAY[w_a_wr_cntr -6 + i];
!!#                         IJ_printf ("diag.j", 1977, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 1979, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1981, th_M, "\tstw\t%%r10, [%%r9]\n");
!!# 
!#                         ! cache able store and load to main memory
!!#                         if(random()%4 == 0) {
!!#                         IJ_printf ("diag.j", 1985, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 mem_ad);
!!#                         IJ_printf ("diag.j", 1987, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         if(random()%2) {
!!#                         IJ_printf ("diag.j", 1990, th_M, "\tstx\t%%r10, [%%r9]\n");
!!#                         } else {
!!#                         IJ_printf ("diag.j", 1992, th_M, "\tldx\t[%%r9], %%r10\n");
!!#                         }
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1994, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1995, Rv_memaddr_pattern);
!!#                         }
!!# 
!!#                         w_wr_cntr++;
!#                         } ! end for 
!!#                       }
!!# 
!#                         ! Double WORD (x-word)
!#                         ! add a mechanism to control addr1, addr5 in range ??
!#                         ! addr
!!#                         while (jbi0 < 550024249344 ) {
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 2007, Rv_jbiaddr_pattern1);
!!#                         IJ_update_rvar("diag.j", 2008, Rv_jbiaddr_pattern0);
!!#                         }
!!# 
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 2011, Rv_jbiaddr_pattern6);
!#                         ! to remove address not in dma-fake range
!!#                         while (jbi6 > 1095216660479)  {
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 2014, Rv_jbiaddr_pattern6);
!!#                         IJ_update_rvar("diag.j", 2015, Rv_jbiaddr_pattern6);
!!#                         }
!!# 
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 2018, Rv_jbiaddr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 2019, Rv_jbiaddr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 2020, Rv_jbiaddr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 2021, Rv_jbiaddr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 2022, Rv_jbiaddr_pattern5);
!#                         !jbi6 = IJ_get_rvar_val64(Rv_jbiaddr_pattern6);
!!# 			IJ_update_rvar("diag.j", 2024, Rv_jbiaddr_pattern1);
!!# 			IJ_update_rvar("diag.j", 2025, Rv_jbiaddr_pattern2);
!!# 			IJ_update_rvar("diag.j", 2026, Rv_jbiaddr_pattern3);
!!# 			IJ_update_rvar("diag.j", 2027, Rv_jbiaddr_pattern4);
!!# 			IJ_update_rvar("diag.j", 2028, Rv_jbiaddr_pattern5);
!!# 			IJ_update_rvar("diag.j", 2029, Rv_jbiaddr_pattern6);
!!# 
!#                         !addr_sel = random() % 5;
!# 			!IJ_update_rvar(Rv_addr_sel);
!# 	                !printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!#                         !store_addr = addr_sel;
!!# 
!!#                       if (random()%2 == 1) {
!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi1; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi2; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi3; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi4; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi5; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi6; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!# 
!!#                         for (i=0;i<6;i++) {
!!#                         x_DATA_ARRAY[x_wr_cntr] = IJ_get_rvar_val64("diag.j", 2046, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 2047, Rv_rand64);
!!#                         data_st = x_DATA_ARRAY[x_wr_cntr];
!!#                         addr_st = x_ADDR_ARRAY[x_a_wr_cntr -6 + i];
!!#                         IJ_printf ("diag.j", 2050, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 2052, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 2054, th_M, "\tstx\t%%r10, [%%r9]\n");
!!# 
!#                         ! cache able store and load to main memory
!!#                         if(random()%4 == 0) {
!!#                         IJ_printf ("diag.j", 2059, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 mem_ad);
!!#                         IJ_printf ("diag.j", 2061, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         if(random()%2) {
!!#                         IJ_printf ("diag.j", 2064, th_M, "\tstx\t%%r10, [%%r9]\n");
!!#                         } else {
!!#                         IJ_printf ("diag.j", 2066, th_M, "\tldx\t[%%r9], %%r10\n");
!!#                         }
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 2068, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 2069, Rv_memaddr_pattern);
!!#                         }
!!# 
!!#                         x_wr_cntr++;
!#                         } ! end for 
!!#                       }
!!# 
!#                         ! Loads (1/2/4/8)
!#                         !for(i=0; i <60; i++){
!#                         !IJ_printf (th_M, "!\tdata_array = 0x%016llx, addr_array %d = 0x%016llx  \n",b_DATA_ARRAY[i], i,b_ADDR_ARRAY[i]);
!#                         !}
!!# 
!#                         ! BYTE LOADS
!!#                         a_addr_sel = random() %500;
!!# 
!!#                       if (random()%2 == 1) {
!!#                         if(b_a_wr_cntr >= 10 ) {
!!#                         while (a_addr_sel + 9 >= b_a_wr_cntr ) {
!!#                         a_addr_sel = random() %500;
!# 	                !IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!#                         rnd_cnt = random() % 8; ! 4 ld(.) from random loc which is already stored
!# 	                !IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, b_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,b_a_wr_cntr,a_addr_sel); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 2094, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 b_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 2096, th_M, "\tldub\t[%%r12], %%r11\n");
!#                         !data_ld = b_DATA_ARRAY[rnd_cnt+a_addr_sel];
!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!#                         !        data_ld);
!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r14\n",
!#                         !        0x00000000000000ff);
!#                         !IJ_printf (th_M, "\tand\t%%r10, %%r14, %%r10\n");
!#                         !IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!#                         !IJ_printf (th_M, "\tbne h_bad_end\n");
!#                         !IJ_printf (th_M, "\tnop\n");
!!# 
!#  			! cache able store and load to main memory 
!!#                         if(random()%4 == 0) {
!!#                         IJ_printf ("diag.j", 2109, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 mem_ad);
!!#                         IJ_printf ("diag.j", 2111, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         if(random()%2) {
!!#                         IJ_printf ("diag.j", 2114, th_M, "\tstx\t%%r10, [%%r9]\n");
!!#                         } else {
!!#                         IJ_printf ("diag.j", 2116, th_M, "\tldx\t[%%r9], %%r10\n"); 
!!#                         }
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 2118, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 2119, Rv_memaddr_pattern);
!!#                         }
!!# 
!!#                         rnd_cnt--;
!!#                          }
!#                         } ! of if(b_a_wr_cntr >=10)
!#                       }  ! if (random()%2 == 1)
!!# 
!#                         ! HALF WORD LOADS
!!#                         a_addr_sel = random() %500;
!!# 
!!#                       if (random()%2 == 1) {
!!#                         if(h_a_wr_cntr >= 10 ) {
!!#                         while (a_addr_sel + 9 >= h_a_wr_cntr ) {
!!#                         a_addr_sel = random() %500;
!# 	                !IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!#                         rnd_cnt = random() % 8; ! 4 ld(.) from random loc which is already stored
!# 	                !IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, h_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,h_a_wr_cntr,a_addr_sel); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 2141, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 h_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 2143, th_M, "\tlduh\t[%%r12], %%r11\n");
!#                         !data_ld = h_DATA_ARRAY[rnd_cnt+a_addr_sel];
!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!#                         !        data_ld);
!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r14\n",
!#                         !        0x000000000000ffff);
!#                         !IJ_printf (th_M, "\tand\t%%r10, %%r14, %%r10\n");
!#                         !IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!#                         !IJ_printf (th_M, "\tbne h_bad_end\n");
!#                         !IJ_printf (th_M, "\tnop\n");
!!#                         rnd_cnt--;
!!#                          }
!#                         } ! of if(h_a_wr_cntr >=10)
!#                       }  ! if (random()%2 == 1)
!!# 
!#                         ! WORD LOADS
!!#                         a_addr_sel = random() %500;
!!#                       if (random()%2 == 1) {
!!# 
!!#                         if(w_a_wr_cntr >= 10 ) {
!!#                         while (a_addr_sel + 9 >= w_a_wr_cntr ) {
!!#                         a_addr_sel = random() %500;
!# 	                !IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!#                         rnd_cnt = random() % 8; ! 4 ld(.) from random loc which is already stored
!# 	                !IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, w_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,w_a_wr_cntr,a_addr_sel); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 2172, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 w_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 2174, th_M, "\tlduw\t[%%r12], %%r11\n");
!#                         !data_ld = w_DATA_ARRAY[rnd_cnt+a_addr_sel];
!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!#                         !        data_ld);
!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r14\n",
!#                         !        0x00000000ffffffff);
!#                         !IJ_printf (th_M, "\tand\t%%r10, %%r14, %%r10\n");
!#                         !IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!#                         !IJ_printf (th_M, "\tbne h_bad_end\n");
!#                         !IJ_printf (th_M, "\tnop\n");
!!#                         rnd_cnt--;
!!#                          }
!#                         } ! of if(w_a_wr_cntr >=10)
!#                       }  ! if (random()%2 == 1)
!!# 
!#                         ! X-WORD LOADS
!!#                         a_addr_sel = random() %500;
!!#                       if (random()%2 == 1) {
!!# 
!!#                         if(x_a_wr_cntr >= 10 ) {
!!#                         while (a_addr_sel + 9 >= x_a_wr_cntr ) {
!!#                         a_addr_sel = random() %500;
!# 	                !IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!#                         rnd_cnt = random() % 8; ! 4 ld(.) from random loc which is already stored
!# 	                !IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, x_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,x_a_wr_cntr,a_addr_sel); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 2203, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 x_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 2205, th_M, "\tldx\t[%%r12], %%r11\n");
!#                         !data_ld = x_DATA_ARRAY[rnd_cnt+a_addr_sel];
!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!#                         !        data_ld);
!#                         !IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!#                         !IJ_printf (th_M, "\tbne h_bad_end\n");
!#                         !IJ_printf (th_M, "\tnop\n");
!!#                         rnd_cnt--;
!!#                          }
!#                         } ! of if(x_a_wr_cntr >=10)
!#                       }  ! if (random()%2 == 1)
!!# 
!#                         !i=0;
!#                         !IJ_printf (th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,ADDR_ARRAY[i],rd_cntr, wr_cntr);
!#                         !i=1;
!#                         !IJ_printf (th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,ADDR_ARRAY[i],rd_cntr, wr_cntr);
!#                         !i=2;
!#                         !IJ_printf (th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,ADDR_ARRAY[i],rd_cntr, wr_cntr);
!#                         !i=3;
!#                         !IJ_printf (th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,ADDR_ARRAY[i],rd_cntr, wr_cntr);
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
