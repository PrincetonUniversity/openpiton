// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_blk_stld2_rand_0.s
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
   random seed:	553906064
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
	setx	0x00000010e0100000, %r1, %r9
	setx	0x0000000000000000, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000007431800c, %r1, %r9
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



	setx	0x000000800eec89c8, %r1, %r9
	setx	0x22f31601a480dad4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x22f31601a480dad4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f7134d2, %r1, %r9
	setx	0xda37c4ba2b6acf58, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xda37c4ba2b6acf58, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c62f58f918, %r1, %r9
	setx	0x117f7e22afc5c29b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d24c9fb360, %r1, %r9
	setx	0x3b0f85fedcdd616a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x3b0f85fedcdd616a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec2a43ac26, %r1, %r9
	setx	0x498da94c17c1e232, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f57aa3fb90, %r1, %r9
	setx	0x3b9fb0e541f2dd6a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x3b9fb0e541f2dd6a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e414fb8, %r1, %r9
	setx	0x875201bf2253cfa7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f647878, %r1, %r9
	setx	0x43de5026f109b8f2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7f48c3820, %r1, %r9
	setx	0xc77243f29bba81e4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d003793bcc, %r1, %r9
	setx	0xaccd9e6e91025bdd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed7f416b38, %r1, %r9
	setx	0x157309b1b173a63f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fad013cf50, %r1, %r9
	setx	0x1e03fab1e4a62755, %r1, %r10
	stw	%r10, [%r9]
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
	setx	0x1e03fab1e4a62755, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000804e63322b, %r1, %r9
	setx	0x641262cba84f9eea, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eaeef01, %r1, %r9
	setx	0x7a4ed51cd4e34d94, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f151780, %r1, %r9
	setx	0x7e4e0be6f2bb79cd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c94e87b5da, %r1, %r9
	setx	0xdc2ee75468b23088, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7d2200082, %r1, %r9
	setx	0xb9124e4de8ad502d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xb9124e4de8ad502d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3b518152c, %r1, %r9
	setx	0x4c46172e5e515936, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x4c46172e5e515936, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe7fcd4a0a, %r1, %r9
	setx	0x2e1c747dd513286f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x2e1c747dd513286f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e867c78, %r1, %r9
	setx	0x7f7d7eb60d51c62e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4dc88c, %r1, %r9
	setx	0x899829c6fa4cba43, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c8a2d390e8, %r1, %r9
	setx	0x4062eb0986cc5da0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4463a465c, %r1, %r9
	setx	0xd87bd78ec4e61ad2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e00ebdf814, %r1, %r9
	setx	0x295cd5b78da9b480, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8ce09806c, %r1, %r9
	setx	0xdfdd45a08962edcf, %r1, %r10
	stw	%r10, [%r9]
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
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000010a0100000, %r1, %r9
	setx	0xdfdd45a08962edcf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000008018050972, %r1, %r9
	setx	0x9423a30a410514cd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x9423a30a410514cd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e3f5320, %r1, %r9
	setx	0xddfe83780e6b1c2f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xddfe83780e6b1c2f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f0d20c3, %r1, %r9
	setx	0x772b5e40cfaa5fa4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf385dff36, %r1, %r9
	setx	0x861faaecd7da4d28, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4125a33ec, %r1, %r9
	setx	0xaf5fdee1853e76bc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e46b4465af, %r1, %r9
	setx	0x44b26da638c9a642, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f582937c36, %r1, %r9
	setx	0xac4d7f033b0428ff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8a2d390e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f4dc88c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e867c78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fad013cf50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ed7f416b38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d003793bcc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c7f48c3820, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x000000800e6dff30, %r1, %r9
	setx	0xdaaacc96acd031ef, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fa0e24c, %r1, %r9
	setx	0x50d4d22b403e66d9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c857c477c0, %r1, %r9
	setx	0xc4363550b5fb97df, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xc4363550b5fb97df, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d9ce9b7d90, %r1, %r9
	setx	0xe297d9d605c8088f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e16e2c013e, %r1, %r9
	setx	0xa3cd55d7461c144a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe7ca04c66, %r1, %r9
	setx	0xc3dc4ce92b7916ac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eec6548, %r1, %r9
	setx	0x32a162c843845bba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fefe698, %r1, %r9
	setx	0xea6d8d99f8b235e6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca0e13c470, %r1, %r9
	setx	0x948bc03d3da60ca5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9c3da6f78, %r1, %r9
	setx	0x8e4fa8a6823dc068, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1f2cbad48, %r1, %r9
	setx	0xed1b450d802f6c45, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f3135b3b38, %r1, %r9
	setx	0x20264e06d18914fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e867c78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fad013cf50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ed7f416b38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d003793bcc, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x00000010d0100000, %r1, %r9
	setx	0x20264e06d18914fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000807b86c9a7, %r1, %r9
	setx	0xfb92e2e6d3869f5c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee06636, %r1, %r9
	setx	0xbd1aeb9bf0e4e417, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f737c16, %r1, %r9
	setx	0x1efc594c03a44dac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5d01f78aa, %r1, %r9
	setx	0xb10b4e0691afe66b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc07238ab9, %r1, %r9
	setx	0x3c655056bad8ac7d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec0526dae9, %r1, %r9
	setx	0xa7a125b7b751d67d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f44ccc75b1, %r1, %r9
	setx	0xaf5ea43e35449036, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed22900, %r1, %r9
	setx	0x24757d7820f5ce6e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fcd60d4, %r1, %r9
	setx	0x952897e510ebf9f9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c3edd1975a, %r1, %r9
	setx	0x9930a48bf3344bda, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6d55e16f6, %r1, %r9
	setx	0x713d9cb96a77a59b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x713d9cb96a77a59b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000edd70a959a, %r1, %r9
	setx	0x8787cc3b8955e092, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fdcbb126c0, %r1, %r9
	setx	0x380f0b2fa9fc6411, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5cd2a8, %r1, %r9
	setx	0xc2a855c70d1c4c46, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f0aa7b8, %r1, %r9
	setx	0xfeda08845da2b342, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0b40bcd48, %r1, %r9
	setx	0xf612b160fdfff6eb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d32ac02ce8, %r1, %r9
	setx	0xc0fd07a1bde9dfc1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eaac35d638, %r1, %r9
	setx	0x97620cd8d0f40c05, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2d73f67b8, %r1, %r9
	setx	0x78b5837cc14c5db7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x78b5837cc14c5db7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed7f416b38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d003793bcc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c7f48c3820, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f647878, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x0000001090100000, %r1, %r9
	setx	0x78b5837cc14c5db7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000008024d47447, %r1, %r9
	setx	0xd5a8c267751e1d62, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ebc80d2, %r1, %r9
	setx	0xd504fd60856079e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fadb369, %r1, %r9
	setx	0x3bb563307111336b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c248a59387, %r1, %r9
	setx	0x3b39a460e283240d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8180f3391, %r1, %r9
	setx	0x83e1449861f0a7f4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x83e1449861f0a7f4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e820eab9c2, %r1, %r9
	setx	0x243c335838bc10a9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f3f4fd9ec9, %r1, %r9
	setx	0x2b33253f9298c325, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x2b33253f9298c325, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f0d20c3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e3f5320, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008018050972, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fe7fcd4a0a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e3b518152c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d7d2200082, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e5cd2a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f3135b3b38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e1f2cbad48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d9c3da6f78, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080604bba87, %r1, %r9
	setx	0xc4d9e575fa6fc22e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e350717, %r1, %r9
	setx	0xab4541e57c5c48f0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xab4541e57c5c48f0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f847a36, %r1, %r9
	setx	0x5e8f0166006de426, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x5e8f0166006de426, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c59825e5b3, %r1, %r9
	setx	0x48490aa55ac70a1b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ddc8551f4e, %r1, %r9
	setx	0x2e1e236c155dc32a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec4e47336a, %r1, %r9
	setx	0xf7764a09a4d1ecc1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xf7764a09a4d1ecc1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f9457955b3, %r1, %r9
	setx	0x1a962a395974db17, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e83de36, %r1, %r9
	setx	0x470a30d65ecdc434, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe78afc, %r1, %r9
	setx	0xc54b74a2754f4771, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cadb6f467c, %r1, %r9
	setx	0xd22d5cf04a432472, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1d8bd17c6, %r1, %r9
	setx	0x64f2a5fcf874a8e5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eb25cc7e7a, %r1, %r9
	setx	0x1886fae03b6e09b2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6f1ab18ba, %r1, %r9
	setx	0xa8c7446805fae726, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb67464, %r1, %r9
	setx	0xe59c6b2430fbbd4f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f36500c, %r1, %r9
	setx	0x314698e5ab532650, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc526be1e8, %r1, %r9
	setx	0x541db2ef821588c0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x541db2ef821588c0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5e11490ac, %r1, %r9
	setx	0x7e73df5b29fd78e7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea9c08a244, %r1, %r9
	setx	0x17e9659432c6f527, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f87398e9f8, %r1, %r9
	setx	0x0196634fae941b52, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec1c7b8, %r1, %r9
	setx	0xf4a38b55301f2425, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe4f9a0, %r1, %r9
	setx	0x4426b4ee1825e81a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd585b4a68, %r1, %r9
	setx	0x04f8a0f69787a2e3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x04f8a0f69787a2e3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dcc7c019a0, %r1, %r9
	setx	0x8749246ada2c0a99, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x8749246ada2c0a99, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e3128c7d20, %r1, %r9
	setx	0x4905a1667191f0cb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fd1365f9c8, %r1, %r9
	setx	0x3b06aeb19dec1c8e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf385dff36, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f0d20c3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e3f5320, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eb67464, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8ce09806c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e00ebdf814, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d4463a465c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c8a2d390e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fe4f9a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec1c7b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f2d73f67b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eaac35d638, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d32ac02ce8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c0b40bcd48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb51ce0, %r1, %r9
	setx	0xcbda8392faece73c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xcbda8392faece73c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f41b014, %r1, %r9
	setx	0x4260f7ac82b865fa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c20b9bf2dc, %r1, %r9
	setx	0x91ca9967714c6251, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dda83834f0, %r1, %r9
	setx	0x5ecdcc8a9c240beb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed4d95b564, %r1, %r9
	setx	0xc46b63cd3e003015, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8dc959528, %r1, %r9
	setx	0xb008dbb4c7b4e8ba, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f57aa3fb90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec2a43ac26, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d24c9fb360, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c62f58f918, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f7134d2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080f80c5f27, %r1, %r9
	setx	0x09157def89c9cf27, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e66a883, %r1, %r9
	setx	0xfac82d8059adfd40, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7e3b58, %r1, %r9
	setx	0xd86aa9714f43d376, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4eb8fe02c, %r1, %r9
	setx	0x834a744d94c311f1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d683c0da80, %r1, %r9
	setx	0x17e042d27a0a82b3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x17e042d27a0a82b3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9c3bb837b, %r1, %r9
	setx	0x89dedf669882df62, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe92a42220, %r1, %r9
	setx	0xf36ab17eaa78aa75, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e41553c, %r1, %r9
	setx	0xbe566d4d276c3084, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f198024, %r1, %r9
	setx	0x3a0fbacc7f0ecf2b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c25f68e2e6, %r1, %r9
	setx	0x7daf94e58aadf7f4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x7daf94e58aadf7f4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dd514d1866, %r1, %r9
	setx	0xfab45baa3f6e92a0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e22c932b10, %r1, %r9
	setx	0x4a6057b1ae6e54a2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc3806b9b4, %r1, %r9
	setx	0xf2aa82191f642443, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3b2b70, %r1, %r9
	setx	0x56ebc7c48e2c5b3e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x56ebc7c48e2c5b3e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fabf030, %r1, %r9
	setx	0xb0e6dbdc6c292b1d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1f65319c0, %r1, %r9
	setx	0x992e4318ccc3ccc4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2e814f348, %r1, %r9
	setx	0x405abcf7c96ed394, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x405abcf7c96ed394, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e20940f3f0, %r1, %r9
	setx	0x03c876169dcaf2eb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe4d564f00, %r1, %r9
	setx	0x5081fcd72c1ce7a6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c94e87b5da, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f151780, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eaeef01, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f57aa3fb90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f36500c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb67464, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8ce09806c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e00ebdf814, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d4463a465c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c8a2d390e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fe4f9a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec1c7b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f2d73f67b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000801f7deb50, %r1, %r9
	setx	0xbda38a4743c44506, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e71c748, %r1, %r9
	setx	0xf0ed9996f7143525, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff4f95a, %r1, %r9
	setx	0x69bc336b98f0d3f9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7e19bc600, %r1, %r9
	setx	0xe0df78811de65541, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xe0df78811de65541, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d7882050a9, %r1, %r9
	setx	0x437d7cf40cd45144, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e543efec59, %r1, %r9
	setx	0x90ca80fa12898808, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x90ca80fa12898808, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f44106d260, %r1, %r9
	setx	0x2539f6e29d35dbaf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e24c1e0, %r1, %r9
	setx	0x08e4980c7ce2bee5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4ce6f0, %r1, %r9
	setx	0xfbc4ecb68e4b2243, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xfbc4ecb68e4b2243, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c82bd9ade0, %r1, %r9
	setx	0x2796012f224de600, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2927e9150, %r1, %r9
	setx	0x64dcd91a12b52741, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ecbcd6ac88, %r1, %r9
	setx	0x8ff19ba50eb52e08, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x8ff19ba50eb52e08, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f9d422bf30, %r1, %r9
	setx	0xa023170be79866c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000807b86c9a7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f582937c36, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e46b4465af, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d4125a33ec, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cf385dff36, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r9
	setx	0xa023170be79866c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e16e2c013e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d9ce9b7d90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c857c477c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fa0e24c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6dff30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e43147a, %r1, %r9
	setx	0x93f2a3acbdfd72fe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f69aec0, %r1, %r9
	setx	0x402297bd04e1c733, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cbbed15ec2, %r1, %r9
	setx	0x57a68cbbfd667906, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc43986a1e, %r1, %r9
	setx	0x31b0c96d504c8844, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e5df27fd3e, %r1, %r9
	setx	0x4b065c8467a25358, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fbd48fc3bc, %r1, %r9
	setx	0x113b5ebf7c921d7e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ee81230, %r1, %r9
	setx	0xb37d1fba0d81ced8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xb37d1fba0d81ced8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f64126c, %r1, %r9
	setx	0xb5b78ac9da2488a5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c289c8f068, %r1, %r9
	setx	0x5fd20fc62dc9b131, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d54045e9d4, %r1, %r9
	setx	0xdc262455ac59f013, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xdc262455ac59f013, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7f811c0cc, %r1, %r9
	setx	0x4a58ab64e05b0001, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f7107f8b40, %r1, %r9
	setx	0x6b2b9eaa3eb1afe0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e9909b8, %r1, %r9
	setx	0x733afb7bb8e38917, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x733afb7bb8e38917, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd77e10, %r1, %r9
	setx	0xd3ce0baede21b05c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c83677baf8, %r1, %r9
	setx	0xd3d77283e5f3e631, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6108b7f48, %r1, %r9
	setx	0x5336885003436c09, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec8aaef0f0, %r1, %r9
	setx	0xf782166b0f969700, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f7b49abc58, %r1, %r9
	setx	0xc14b65f46a52c6d5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xc14b65f46a52c6d5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xc14b65f46a52c6d5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eb0b868, %r1, %r9
	setx	0x40c5d125a4ea46a4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f16ca40, %r1, %r9
	setx	0xd951cc372d8cc6bb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c051f35b70, %r1, %r9
	setx	0x5052daee64be2d01, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ddc9f4b8f0, %r1, %r9
	setx	0x42102a31c2572bf0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e140c58c78, %r1, %r9
	setx	0xb93f7ae235f20c45, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc9d7040e0, %r1, %r9
	setx	0x1b9651160c37c3f1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e43147a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc3806b9b4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e22c932b10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dd514d1866, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c25f68e2e6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f198024, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d4463a465c, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x0000001030100000, %r1, %r9
	setx	0x1b9651160c37c3f1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080145ec61f, %r1, %r9
	setx	0xb438f1610b22fb24, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0636d5, %r1, %r9
	setx	0xd869da0af53abbbd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff464b8, %r1, %r9
	setx	0xa4ea9f7f8ecc2d21, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c40ac8c5a4, %r1, %r9
	setx	0xfc6bce76e259eb7e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d03bf8b3a4, %r1, %r9
	setx	0x9a43f27d98105186, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e99c60863d, %r1, %r9
	setx	0xdf5a706b028fd434, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f3b0bb9fe5, %r1, %r9
	setx	0xfb8648a2a2c8fd1e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef84b14, %r1, %r9
	setx	0x4c79a27684472b9b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x4c79a27684472b9b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb5f39a, %r1, %r9
	setx	0x55c680701e5e1a89, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x55c680701e5e1a89, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7e641403a, %r1, %r9
	setx	0x80597db35d3ca1e8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x80597db35d3ca1e8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d20f42d316, %r1, %r9
	setx	0x0e011178b217007e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec27dc1312, %r1, %r9
	setx	0x75ca109d29ccccb9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8542b7276, %r1, %r9
	setx	0x17aec10080460fcc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e270754, %r1, %r9
	setx	0xa5fb8e369ec0fd6d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f3316e0, %r1, %r9
	setx	0xa05f6c379df185a1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c017830b48, %r1, %r9
	setx	0xf1ad4f2af1708d71, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d414d05738, %r1, %r9
	setx	0xd446e0058ba13585, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xd446e0058ba13585, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000efd3ca34cc, %r1, %r9
	setx	0x43567f524f15015e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f742046264, %r1, %r9
	setx	0xd7a323415d85090e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f582937c36, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e46b4465af, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001050100000, %r1, %r9
	setx	0xd7a323415d85090e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4125a33ec, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dc43986a1e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eb67464, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x000000800e1f77cc, %r1, %r9
	setx	0xbe0069111b3dfaac, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb7b3c0, %r1, %r9
	setx	0xdb0a68955e7955b2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xdb0a68955e7955b2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c9a2a9fa30, %r1, %r9
	setx	0x0c4d22112c62f77b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d83ae21dcc, %r1, %r9
	setx	0x397ba62998d8d33a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x397ba62998d8d33a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb1884c52c, %r1, %r9
	setx	0xcfcafcc5d94700f6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f25b3d5564, %r1, %r9
	setx	0xb4da3fba61606b94, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e6451c0, %r1, %r9
	setx	0xb50f08f48a913f4b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xb50f08f48a913f4b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fdb7440, %r1, %r9
	setx	0xbbe581cd1595429a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xbbe581cd1595429a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce3aa0fa68, %r1, %r9
	setx	0x1e82e505af028d40, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d71089c088, %r1, %r9
	setx	0xaf85dbf2d4b9339b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000edb924b880, %r1, %r9
	setx	0x2ee82642f45aa7b3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fd621b5f38, %r1, %r9
	setx	0xa0895da6cd75bf11, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xa0895da6cd75bf11, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c25f68e2e6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000efd3ca34cc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d414d05738, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c017830b48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f3316e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e270754, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f7107f8b40, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ec8aaef0f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d6108b7f48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c83677baf8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fd77e10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9909b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f9d422bf30, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0xa0895da6cd75bf11, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ef4df24, %r1, %r9
	setx	0x78252f5938633d58, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f2339bc, %r1, %r9
	setx	0x698da780d3c84040, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c12012ea08, %r1, %r9
	setx	0xeb89ff5a365bcf42, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xeb89ff5a365bcf42, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d6aaa54804, %r1, %r9
	setx	0x9d487996d3d71c96, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ea2d1ff4d4, %r1, %r9
	setx	0x279227daecaafed7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fbc53d7598, %r1, %r9
	setx	0x0d58dc5fbfcbde2d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x0d58dc5fbfcbde2d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eab8698, %r1, %r9
	setx	0x1e67c01928df3bff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f18b968, %r1, %r9
	setx	0x5c8a2e87dd5934d4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c5c04a9da4, %r1, %r9
	setx	0x7d88e398c2306a18, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5882704b8, %r1, %r9
	setx	0xbc4eec4508fbf6b7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xbc4eec4508fbf6b7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e73b2b8f24, %r1, %r9
	setx	0xa762b5644d9d22ef, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xa762b5644d9d22ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcf7dfa378, %r1, %r9
	setx	0x6975569fb46d1198, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ebf79a0, %r1, %r9
	setx	0x793e092d84a8c875, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6b5fe0, %r1, %r9
	setx	0x2c42288455fdbbd0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c97b807518, %r1, %r9
	setx	0x6f2fd44251d2b566, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da5f2be2c0, %r1, %r9
	setx	0xc8207c239402225b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7379b4cc8, %r1, %r9
	setx	0x73afbb9a587179c9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x73afbb9a587179c9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fd8484f6f8, %r1, %r9
	setx	0x0538880dfa530538, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4463a465c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e3b2b70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fd1365f9c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e3128c7d20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dcc7c019a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cd585b4a68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fe4f9a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080ed7850e8, %r1, %r9
	setx	0x2d9e79498c2466f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee174c2, %r1, %r9
	setx	0xd5bf68d3f6a2598e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7adb86, %r1, %r9
	setx	0x8dee9a1e8bcc3203, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x8dee9a1e8bcc3203, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca74821f1a, %r1, %r9
	setx	0x47aaa72c41f58740, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de0e8acd12, %r1, %r9
	setx	0xba2c7b34619a908e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea4f1027e8, %r1, %r9
	setx	0x982d177d82768528, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f7b961341e, %r1, %r9
	setx	0xed5e2e9bb3b25c6a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e682964, %r1, %r9
	setx	0xd9d3c3aa515d1412, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f449f70, %r1, %r9
	setx	0xc0214d072ca9bec7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xc0214d072ca9bec7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cf0cbbc178, %r1, %r9
	setx	0x0f625bdc14ab2b98, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dcb8d082b4, %r1, %r9
	setx	0xd36d3d4c4069c893, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb4f79503c, %r1, %r9
	setx	0x0a94d76af5acb51c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f571e7b604, %r1, %r9
	setx	0xbdebb93f69f513ed, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec27dc1312, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d20f42d316, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7e641403a, %r1, %r12
	lduh	[%r12], %r11
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
	setx	0x0000001040100000, %r1, %r9
	setx	0xbdebb93f69f513ed, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ec001e4, %r1, %r9
	setx	0x1eca05f332a6b6bb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f32a664, %r1, %r9
	setx	0xd3c0f570b6363a6c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xd3c0f570b6363a6c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4e95a8cb0, %r1, %r9
	setx	0x1f42bccbfbb78ce1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8a881ea08, %r1, %r9
	setx	0xbbfadd037f370e75, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e4187e2884, %r1, %r9
	setx	0x0f0b8cc8c30591e0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f21c3c1534, %r1, %r9
	setx	0x29257572f11650be, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x29257572f11650be, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7adb86, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ee174c2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080ed7850e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f3b0bb9fe5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e99c60863d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d03bf8b3a4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r9
	setx	0x29257572f11650be, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000808443d6e7, %r1, %r9
	setx	0x55efd084394a993f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9b77e0, %r1, %r9
	setx	0x08277b5092a247a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe0abbc, %r1, %r9
	setx	0x0ea841fe6bb4cb15, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc3516012f, %r1, %r9
	setx	0x5121a6fa91f377af, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df9cff2b41, %r1, %r9
	setx	0x77093437ea3455ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x77093437ea3455ee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e76e4bb55a, %r1, %r9
	setx	0x2f284f9a47470b17, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe14cc1971, %r1, %r9
	setx	0x01b6a1e05ccf35c3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec2ad48, %r1, %r9
	setx	0xe319fe504e9b7764, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f3bf70c, %r1, %r9
	setx	0x2295bd4083d617c4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c440f68330, %r1, %r9
	setx	0xe46807cbb708f099, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000da1451ad50, %r1, %r9
	setx	0x927f633618f5ec5a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec055633d8, %r1, %r9
	setx	0xc6a4c862f702fa13, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f90a2f14ec, %r1, %r9
	setx	0x7657add0011a2c24, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d24c9fb360, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c62f58f918, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f742046264, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000efd3ca34cc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d414d05738, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c017830b48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb0b868, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f7b49abc58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ec8aaef0f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d6108b7f48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c83677baf8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fd77e10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9909b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080f01512ea, %r1, %r9
	setx	0x44390957bafc89c8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ebe7de8, %r1, %r9
	setx	0xd614d515e6c2e210, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xd614d515e6c2e210, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f546558, %r1, %r9
	setx	0x8487487248ed59fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0fc02d40d, %r1, %r9
	setx	0x0c94a4bdc70615b1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d997f6638e, %r1, %r9
	setx	0xa76a51d98cc6cc16, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed0aca5a79, %r1, %r9
	setx	0xe9ab3e0d229544ef, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f390a9c11b, %r1, %r9
	setx	0x065a8d1b5f60b682, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e390cc4, %r1, %r9
	setx	0x0b525c6dfbb58fc3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc69140, %r1, %r9
	setx	0x001f67d69a9d7975, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x001f67d69a9d7975, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c1e6f6e762, %r1, %r9
	setx	0x3f50eb0d2ebbe230, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da0e9678b2, %r1, %r9
	setx	0x45e35f9e5e7684e1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e02b88049c, %r1, %r9
	setx	0x27941d522c204deb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc3a040948, %r1, %r9
	setx	0x4c4cba6e12e59e55, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x4c4cba6e12e59e55, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e09af70, %r1, %r9
	setx	0xbc1ed22a405ada93, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f567890, %r1, %r9
	setx	0x1d2a2d194d370fb2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c80182d990, %r1, %r9
	setx	0x86fd12432e535b71, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x86fd12432e535b71, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d1ac8e4ac0, %r1, %r9
	setx	0x4d953157a2a07e2f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x4d953157a2a07e2f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ebcd13a580, %r1, %r9
	setx	0xc43feaaf65e016df, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fdddb3d2e8, %r1, %r9
	setx	0x5925089b8702705d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7adb86, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ee174c2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080ed7850e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ebf79a0, %r1, %r12
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
	setx	0x0000001080100000, %r1, %r9
	setx	0x5925089b8702705d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e1251fe, %r1, %r9
	setx	0xb623a90df48e020c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xb623a90df48e020c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f398d8e, %r1, %r9
	setx	0xf2f7556fb4e1c746, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xf2f7556fb4e1c746, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb0a4a4ebc, %r1, %r9
	setx	0xc8ad3f348a4aea95, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1bcfd2ea6, %r1, %r9
	setx	0x847b42f97aeb41c4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2090d10ac, %r1, %r9
	setx	0x064fd53391b64184, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2739a50e0, %r1, %r9
	setx	0x37d8b388f194f79a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x37d8b388f194f79a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e0cebb4, %r1, %r9
	setx	0x433cf37a27aee80b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f8622e0, %r1, %r9
	setx	0x3c0f80f09b635b9b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x3c0f80f09b635b9b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cc9b7381c4, %r1, %r9
	setx	0x3e9ccacafefc789e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7dd7b5314, %r1, %r9
	setx	0x8bc7d2ec53592bb3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e414ebc68c, %r1, %r9
	setx	0xe86d1ab268b51061, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xe86d1ab268b51061, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f264acd864, %r1, %r9
	setx	0x095f20472780916e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000808443d6e7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f7b961341e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ea4f1027e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de0e8acd12, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r9
	setx	0x095f20472780916e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca74821f1a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f7adb86, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec1c7b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f2d73f67b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eaac35d638, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d32ac02ce8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e8d01be, %r1, %r9
	setx	0xf2a6660451ac12c2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd723ec, %r1, %r9
	setx	0x036a31c1c5618486, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c8e011262e, %r1, %r9
	setx	0x1aa70f4b9d9cf954, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d2341c20f4, %r1, %r9
	setx	0x43372f541f473736, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x43372f541f473736, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e39e68bd7e, %r1, %r9
	setx	0x3b3d35632bf9b025, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4385a2c20, %r1, %r9
	setx	0x81fa07b4f04e2ee9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eeab488, %r1, %r9
	setx	0xa68501264c80944e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f922f44, %r1, %r9
	setx	0x06bb68c448cbcf07, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x06bb68c448cbcf07, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c29b0df7bc, %r1, %r9
	setx	0x4979bc41baa55d2b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x4979bc41baa55d2b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d70fd99830, %r1, %r9
	setx	0x6c9609db4a938d8f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e4dde0bfa8, %r1, %r9
	setx	0x4b8c2db716aec109, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x4b8c2db716aec109, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8428bd438, %r1, %r9
	setx	0x3489ef1c2a80a0fb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee27a00, %r1, %r9
	setx	0xf030eda545ad33f6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7b7998, %r1, %r9
	setx	0xc12263e297d574e0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb70923298, %r1, %r9
	setx	0xb4cfdf43d022fb8c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9cb55b8a8, %r1, %r9
	setx	0x81314d12059ef06b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e58f6ccbd8, %r1, %r9
	setx	0x5d4d6501eb08832d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f80c980250, %r1, %r9
	setx	0x8c7ac0bac33382c4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080145ec61f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f44106d260, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e543efec59, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001040100000, %r1, %r9
	setx	0x8c7ac0bac33382c4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e7f811c0cc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d54045e9d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c289c8f068, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f64126c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ee81230, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8dc959528, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ed4d95b564, %r1, %r12
	lduw	[%r12], %r11
	setx	0x0000001090100000, %r1, %r9
	setx	0x8c7ac0bac33382c4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000807647a787, %r1, %r9
	setx	0x18edafdcbd39c18e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eac8c40, %r1, %r9
	setx	0x9ee97923d9b50812, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f18c7fa, %r1, %r9
	setx	0x8d6f62aa6c03fd48, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9b4344f25, %r1, %r9
	setx	0x5eefa07d7d7195a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8e246e67f, %r1, %r9
	setx	0xe2390b5a82bc483c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xe2390b5a82bc483c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec326cba89, %r1, %r9
	setx	0x3d7bf0de29ba917b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f328f0c9cb, %r1, %r9
	setx	0x2c95f3b7813ff00c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x2c95f3b7813ff00c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800efe1750, %r1, %r9
	setx	0x326b2a74cd19372e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f85c414, %r1, %r9
	setx	0x6758fdbdda3be0d9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c62cd13e5c, %r1, %r9
	setx	0xd061a9ba417e9863, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d6d5dde690, %r1, %r9
	setx	0x44e7ebd5b1627c3d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e1842c222c, %r1, %r9
	setx	0xb40c7344ae74c538, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f46c900a94, %r1, %r9
	setx	0x16eccd389827c5b0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x16eccd389827c5b0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e7cb3d8, %r1, %r9
	setx	0x60e848bcc0d60933, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x60e848bcc0d60933, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ff69ea0, %r1, %r9
	setx	0x34b649c3fe1c6b63, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x34b649c3fe1c6b63, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ce8bc39db8, %r1, %r9
	setx	0x2e6cf8a88c894cd6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x2e6cf8a88c894cd6, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000da3fe03dc8, %r1, %r9
	setx	0x0f4893a3d320da1a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e086c37e08, %r1, %r9
	setx	0x5f8d3e862ff57fec, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x5f8d3e862ff57fec, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f826167a48, %r1, %r9
	setx	0x5207eca66a70ca87, %r1, %r10
	stx	%r10, [%r9]
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
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000010b0100000, %r1, %r9
	setx	0x5207eca66a70ca87, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e6ed860, %r1, %r9
	setx	0xc7694e235b56e529, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xc7694e235b56e529, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f3b1824, %r1, %r9
	setx	0x2d5ee6212b1f5db0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x2d5ee6212b1f5db0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c5bf0baaf2, %r1, %r9
	setx	0x6bf4cc110da5f1ad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x6bf4cc110da5f1ad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8cd838c42, %r1, %r9
	setx	0xf84a60bb50b9600e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e80e5c6708, %r1, %r9
	setx	0x108e7bb9d8a09653, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f81cf06b76, %r1, %r9
	setx	0x0b5eddbfe3fe02d0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c5d01f78aa, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f737c16, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ee06636, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r9
	setx	0x0b5eddbfe3fe02d0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000807b86c9a7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r9
	setx	0x0b5eddbfe3fe02d0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f582937c36, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080cf757755, %r1, %r9
	setx	0xcf80c06eb56bb85e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5d6cb0, %r1, %r9
	setx	0x2bea90905bcc52a4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f092293, %r1, %r9
	setx	0x09abd82abdb585c6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x09abd82abdb585c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ccb823d3f2, %r1, %r9
	setx	0x2c4927e16163d895, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4d1ec215a, %r1, %r9
	setx	0x0e54bb6f3dadb6b4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e4c6a6c354, %r1, %r9
	setx	0x0ec418f90fffaef3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x0ec418f90fffaef3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fb5f227be8, %r1, %r9
	setx	0x02aac1a317ad27a9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x02aac1a317ad27a9, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e99c60863d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d03bf8b3a4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r9
	setx	0x02aac1a317ad27a9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c40ac8c5a4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ff464b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e0636d5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d20f42d316, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7e641403a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb5f39a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ef84b14, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe4f9a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000001060100000, %r1, %r9
	setx	0x02aac1a317ad27a9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000008072abe902, %r1, %r9
	setx	0x307dbd17d577e8b7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e21adf5, %r1, %r9
	setx	0xacadde855dd54e7e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f774ab7, %r1, %r9
	setx	0xc963a3ef82d32b28, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xc963a3ef82d32b28, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc189453f1, %r1, %r9
	setx	0xf17bf6b13d5e2346, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000daeefd80f8, %r1, %r9
	setx	0xc51dcb68957acf6b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e04d8a92b3, %r1, %r9
	setx	0x887363035d57fa7f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8c165c339, %r1, %r9
	setx	0x9bdff94921d7f5fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef98efe, %r1, %r9
	setx	0x4852547c9ffb571b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f11ace6, %r1, %r9
	setx	0x8c9e3c2b595be6aa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c674a6fcd0, %r1, %r9
	setx	0x8c04965a3d103584, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d2a6a40268, %r1, %r9
	setx	0xc1bef11ad7eb7a54, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e549c9ab0c, %r1, %r9
	setx	0x0fe816248d54ed6b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4ba011a7e, %r1, %r9
	setx	0x2208b2e7a23cfdc5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x2208b2e7a23cfdc5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e753078, %r1, %r9
	setx	0xaa2c3d3bc52489f9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xaa2c3d3bc52489f9, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f3bbf50, %r1, %r9
	setx	0xbdae7bb935490900, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xbdae7bb935490900, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0ce986318, %r1, %r9
	setx	0x87f3030aecadd702, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df504d7ec4, %r1, %r9
	setx	0x4707fd51b9e81ca7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x4707fd51b9e81ca7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e984cb1f40, %r1, %r9
	setx	0x03a1974fa3ea24dc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc85c4602c, %r1, %r9
	setx	0xb87d5254c1e4feca, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ecabc38, %r1, %r9
	setx	0xedddd5d694ea7dc5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xedddd5d694ea7dc5, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f796960, %r1, %r9
	setx	0xa9fdd3d37891d562, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cda05e4998, %r1, %r9
	setx	0x6aae83bc026a5974, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x6aae83bc026a5974, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d767aa1b30, %r1, %r9
	setx	0x7b0b713ad9a2cfc3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed09d51610, %r1, %r9
	setx	0xbe2e1b0e6f2768f4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fab02923a0, %r1, %r9
	setx	0xd57105ed3b715710, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de0e8acd12, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ca74821f1a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f7adb86, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ee174c2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080ed7850e8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e41553c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6f1ab18ba, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb25cc7e7a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1d8bd17c6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cadb6f467c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe78afc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ecabc38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f826167a48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e086c37e08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da3fe03dc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ce8bc39db8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ff69ea0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000001040100000, %r1, %r9
	setx	0xd57105ed3b715710, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eb7173c, %r1, %r9
	setx	0xe89310c597728173, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4bfc30, %r1, %r9
	setx	0x042c91aca9e5f06d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x042c91aca9e5f06d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c067c25a78, %r1, %r9
	setx	0x0ed0e4356abc93a4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x0ed0e4356abc93a4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8447541c4, %r1, %r9
	setx	0x5dfa65b52ef848ff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x5dfa65b52ef848ff, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e045cbb180, %r1, %r9
	setx	0xecc56d8224baee40, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f36c553a80, %r1, %r9
	setx	0x2e3956c252b4424e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea7fa88, %r1, %r9
	setx	0x76b08eddf9612adb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f585008, %r1, %r9
	setx	0xb62c0d344e2abf75, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0e3b6c1e8, %r1, %r9
	setx	0xa718b18b21603bad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4fe0933a8, %r1, %r9
	setx	0xce87b44c95b4441d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000efe0551380, %r1, %r9
	setx	0x2a587b9e21b43ead, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fb00c80420, %r1, %r9
	setx	0xd2148beda42979de, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xd2148beda42979de, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f7107f8b40, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e7f811c0cc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d54045e9d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c289c8f068, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f6b5fe0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r9
	setx	0xd2148beda42979de, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080372c4813, %r1, %r9
	setx	0x60491ab01ef1272a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e858557, %r1, %r9
	setx	0xcdde3df51f444bf2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f19af94, %r1, %r9
	setx	0x5ad14f3a7907c2ed, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c956d0326f, %r1, %r9
	setx	0x452b2bc92cb9b0e2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x452b2bc92cb9b0e2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d681ea9415, %r1, %r9
	setx	0x883bb20a20855615, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x883bb20a20855615, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e548d69703, %r1, %r9
	setx	0xa203dcd0a42cb2ca, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fd6184f417, %r1, %r9
	setx	0x58f95fbe9630fe9b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f546558, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ebe7de8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080f01512ea, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001090100000, %r1, %r9
	setx	0x58f95fbe9630fe9b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f8622e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e140c58c78, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ddc9f4b8f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000001010100000, %r1, %r9
	setx	0x58f95fbe9630fe9b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e195e98, %r1, %r9
	setx	0x59ba2d2feb1da784, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1cfb30, %r1, %r9
	setx	0x64b213cecd2fdf3f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c762565c98, %r1, %r9
	setx	0x7cee162a74aea59f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dae7249858, %r1, %r9
	setx	0x3cd19a910113365d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eac8b9fa60, %r1, %r9
	setx	0xd8760cddd73122ab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f35b239168, %r1, %r9
	setx	0xcc2c45c133fb866f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000807e7ca452, %r1, %r9
	setx	0x85725d6103faa946, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x85725d6103faa946, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ee41505, %r1, %r9
	setx	0xd72ba26babb4c499, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4be01b, %r1, %r9
	setx	0xaad38ad66fa567f6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2c27b35e8, %r1, %r9
	setx	0x743104842e2787c7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1cc8d9520, %r1, %r9
	setx	0xb129b3f842747715, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xb129b3f842747715, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000edc5058774, %r1, %r9
	setx	0xa179b4579cc192ec, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f16b918a19, %r1, %r9
	setx	0xa436a25bcbd6194a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xa436a25bcbd6194a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e8771f4, %r1, %r9
	setx	0x5bf38a7dbc100de3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0a2e10, %r1, %r9
	setx	0x8d7b032cc6790f47, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c453843944, %r1, %r9
	setx	0x712662d04aaf6cd2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da061cb9ea, %r1, %r9
	setx	0x2b54d2a93bbf005b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e15897c7d8, %r1, %r9
	setx	0xf6a47994e2c9615d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xf6a47994e2c9615d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f05884af74, %r1, %r9
	setx	0x5ef5edb56e962664, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ec10988, %r1, %r9
	setx	0x2e05a968ed15adbe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x2e05a968ed15adbe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f991848, %r1, %r9
	setx	0x6bbf939a13860c28, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cfacacddf0, %r1, %r9
	setx	0x71dbe048a993382d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d60a378578, %r1, %r9
	setx	0x9cf51f71fc529ae1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec2da10340, %r1, %r9
	setx	0xf35395eac0261cc6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xf35395eac0261cc6, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fc8c3e78b8, %r1, %r9
	setx	0xe5379518aeaa570c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xe5379518aeaa570c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f3b0bb9fe5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e99c60863d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d03bf8b3a4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c40ac8c5a4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ec055633d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da1451ad50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c440f68330, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f3bf70c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ec2ad48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f21c3c1534, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e4187e2884, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ed0d3c8, %r1, %r9
	setx	0xaaadba83b7d47d5c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xaaadba83b7d47d5c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f301fcc, %r1, %r9
	setx	0xc4a704b53440b422, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c32e774e68, %r1, %r9
	setx	0x6033a8d93f8a79ad, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7a8c3a000, %r1, %r9
	setx	0xfd9bb9376bfd998d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec79adb51c, %r1, %r9
	setx	0x92b6d7831ef1d094, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f80b44b458, %r1, %r9
	setx	0x36fe567d8507ea3e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e0ca1a0, %r1, %r9
	setx	0x158d343b783f0a8c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f936960, %r1, %r9
	setx	0x43e7efbcdcf6b29a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd1e5db680, %r1, %r9
	setx	0xe185fe8241b9623d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xe185fe8241b9623d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7c72e9908, %r1, %r9
	setx	0xc853804abb36fe95, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7d3fab1b8, %r1, %r9
	setx	0x75bdb6488d30bdab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x75bdb6488d30bdab, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f1d93660e8, %r1, %r9
	setx	0x3846ac0901ed6833, %r1, %r10
	stx	%r10, [%r9]
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
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000803c3c6c03, %r1, %r9
	setx	0xeef581f1eecbf8a8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e72dbbe, %r1, %r9
	setx	0x63e0789e849fe09f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x63e0789e849fe09f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fcd651b, %r1, %r9
	setx	0xd5c55cf30a0f6db7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c37c4edb23, %r1, %r9
	setx	0xb1699e832c3add2e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d72a646412, %r1, %r9
	setx	0xaab08af9d169f0e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e4d6f1aba7, %r1, %r9
	setx	0x248990ed7a76346e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f68250fc4d, %r1, %r9
	setx	0x8a53d70a37053574, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4c0448, %r1, %r9
	setx	0x07459d2912bdbee2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fef968c, %r1, %r9
	setx	0xb59d0de502201db6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc956fed1c, %r1, %r9
	setx	0x1f68b60e5132de9a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d99da669b4, %r1, %r9
	setx	0xaf4c1f98766f832e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xaf4c1f98766f832e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea924e0398, %r1, %r9
	setx	0xae2c2923330f7a18, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f99b6231b4, %r1, %r9
	setx	0xfa52e1474a8140a1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e4fdc90, %r1, %r9
	setx	0x6bd7484cb87cb5eb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5545d0, %r1, %r9
	setx	0x36887d221c8e8128, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf6a21cd10, %r1, %r9
	setx	0x91e8d4772700db56, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d47cedd288, %r1, %r9
	setx	0xe9833092c7c541a1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xe9833092c7c541a1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e7398197a0, %r1, %r9
	setx	0xe92cc49b84c7605d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6450b5980, %r1, %r9
	setx	0x4b788ca24ee32743, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x4b788ca24ee32743, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f8542b7276, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec27dc1312, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d20f42d316, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7e641403a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb5f39a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ef84b14, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fbd48fc3bc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d71089c088, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ce3aa0fa68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fdb7440, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e6451c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fc9d7040e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e140c58c78, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ddc9f4b8f0, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x0000001060100000, %r1, %r9
	setx	0x4b788ca24ee32743, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eeff1a8, %r1, %r9
	setx	0x4f522c836f15ab48, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f9b81e8, %r1, %r9
	setx	0x5bad77b05dd73860, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cec5c36930, %r1, %r9
	setx	0x7820c33dba59a033, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ddb95228b0, %r1, %r9
	setx	0xa48b4365139d08f5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e782ac0c28, %r1, %r9
	setx	0x7a7109f16635bc81, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f53e3ebc48, %r1, %r9
	setx	0xd76c4e23321d41e1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xd76c4e23321d41e1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d6d55e16f6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c3edd1975a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f7107f8b40, %r1, %r12
	lduw	[%r12], %r11
	setx	0x0000001040100000, %r1, %r9
	setx	0xd76c4e23321d41e1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080e003d861, %r1, %r9
	setx	0xfb0ffd9c55f137d8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xfb0ffd9c55f137d8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ed5f254, %r1, %r9
	setx	0x13d0602360e42e9a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x13d0602360e42e9a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd20d0c, %r1, %r9
	setx	0x82b27c664d50b386, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca3b1d5091, %r1, %r9
	setx	0x48a4bc901ad53d0e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d335179c81, %r1, %r9
	setx	0xf81efae356ea6bc8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e64d5945ba, %r1, %r9
	setx	0xad59ee24572595d9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe472184d6, %r1, %r9
	setx	0xe9838e8d5bdaa98b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xe9838e8d5bdaa98b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e131c28, %r1, %r9
	setx	0xb961fe41df1d6d53, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fae8230, %r1, %r9
	setx	0x3daa441d19aed74c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd01d36728, %r1, %r9
	setx	0x0dd0dda3906d417b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d697d9302c, %r1, %r9
	setx	0x853fbcffaec95a71, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb88bdc08c, %r1, %r9
	setx	0x51ea37863714418a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x51ea37863714418a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fdb8e1da0c, %r1, %r9
	setx	0xbfa40781ded66128, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f3bbf50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e753078, %r1, %r12
	lduw	[%r12], %r11
	setx	0x0000001070100000, %r1, %r9
	setx	0xbfa40781ded66128, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000806b342f7f, %r1, %r9
	setx	0xd6f0576f7d6ae6e9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eebc396, %r1, %r9
	setx	0x96cf5189ab4dbb73, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f58f929, %r1, %r9
	setx	0x07d032725e822b90, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c33f498f84, %r1, %r9
	setx	0xcc5e80f378fa9fe3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000daaaab7b2e, %r1, %r9
	setx	0x7ec55268ecbe5f33, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x7ec55268ecbe5f33, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e833d5415e, %r1, %r9
	setx	0x5f21afb2727029a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f810f7c6fe, %r1, %r9
	setx	0x913dfee27894e7e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0f66d8, %r1, %r9
	setx	0x2289ed856394c9a6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x2289ed856394c9a6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f595378, %r1, %r9
	setx	0xda512828a0f7a2ad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xda512828a0f7a2ad, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c1b651f9d4, %r1, %r9
	setx	0x2d453e7e0244fe03, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d09d3115f6, %r1, %r9
	setx	0xd71ec706361e6c22, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7f22ce7a2, %r1, %r9
	setx	0xcb969521ad688fab, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f1cac9119e, %r1, %r9
	setx	0xe68e4d382fbe0918, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xe68e4d382fbe0918, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e2c13b0, %r1, %r9
	setx	0x7676716e8c32c519, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f0f7f50, %r1, %r9
	setx	0xff91e55ceabb4330, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c86572f708, %r1, %r9
	setx	0xbdac2ff420190a57, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d36ae2d7e8, %r1, %r9
	setx	0x7a1a526d957247d7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea95c4ba28, %r1, %r9
	setx	0xcc42861a4ddc53c0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fd78f5ee38, %r1, %r9
	setx	0x7becaed270e03523, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f092293, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e5d6cb0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d5e11490ac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cc526be1e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f36500c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb67464, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8ce09806c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e00ebdf814, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ebe861c, %r1, %r9
	setx	0x3e12b77362ad23e3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fadf21e, %r1, %r9
	setx	0xf97d7e77377f9a1b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000caf1119334, %r1, %r9
	setx	0x56f81d163fcd23e7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ddc171a71c, %r1, %r9
	setx	0x9129cdaa9d79e69e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec7fd981de, %r1, %r9
	setx	0x3be36e7b32e62b90, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f5750e9e2e, %r1, %r9
	setx	0x41771e19a026e96f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1c33b8, %r1, %r9
	setx	0x6de0772051904f82, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f203418, %r1, %r9
	setx	0x3ab46354d4687913, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x3ab46354d4687913, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c1884c4b78, %r1, %r9
	setx	0x4533a4647aea3549, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d1626eb8f0, %r1, %r9
	setx	0x1d22d52818979a8f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eee78c7c8c, %r1, %r9
	setx	0xfeb834e6489b83bd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xfeb834e6489b83bd, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f5ab1fb000, %r1, %r9
	setx	0xc6ae745cd20c73cb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xc6ae745cd20c73cb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e390cc4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e3edc2a, %r1, %r9
	setx	0x7f0beb47399feb5c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x7f0beb47399feb5c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9d9c5a, %r1, %r9
	setx	0x23ab53ce851c139f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c4a3373914, %r1, %r9
	setx	0xac986c87cf89090a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d0fb2dadc6, %r1, %r9
	setx	0x1774befba48ac630, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e36f6d4db8, %r1, %r9
	setx	0x5a5b8381af1baae3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6f9a6271c, %r1, %r9
	setx	0xad8f0b0388eb3cc7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xad8f0b0388eb3cc7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2739a50e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e2090d10ac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1bcfd2ea6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb0a4a4ebc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f398d8e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e1251fe, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc3a040948, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e9909b8, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x000000f0000000c0, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e62d9b0, %r1, %r9
	setx	0xe4055d5e9b49c8a4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6ea108, %r1, %r9
	setx	0x2645d954a98f925f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x2645d954a98f925f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cd6c1e8858, %r1, %r9
	setx	0xc15bbf8d90eb7049, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db37ba04c8, %r1, %r9
	setx	0x727e4335e9550c19, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x727e4335e9550c19, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e8ce504a38, %r1, %r9
	setx	0x597e121a2698de2b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f7035cdad0, %r1, %r9
	setx	0x82cf95dd28a906cb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4187e2884, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d8a881ea08, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c4e95a8cb0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f32a664, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000808a7aabec, %r1, %r9
	setx	0x354babc735879641, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6a04d2, %r1, %r9
	setx	0xd58f42bb553c8e6e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f05be41, %r1, %r9
	setx	0xfbe693ac4e891dd1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7e87db89c, %r1, %r9
	setx	0x8d061edc95a1a45d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x8d061edc95a1a45d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1cb4b9a25, %r1, %r9
	setx	0x4543a35fe0a25098, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x4543a35fe0a25098, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e65df80666, %r1, %r9
	setx	0xd9e1c73ba9d2d937, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f9e0b2482e, %r1, %r9
	setx	0x4ca2df96098a11f4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e16eb08, %r1, %r9
	setx	0x86cf749e181813f7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f260688, %r1, %r9
	setx	0x0919eb9806605a91, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce88656590, %r1, %r9
	setx	0x7e25611849bd0505, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d658964f68, %r1, %r9
	setx	0xb4c9d918ed6aaf81, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4b5464f58, %r1, %r9
	setx	0xbb9265c35748b3f2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xbb9265c35748b3f2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f53c1b6510, %r1, %r9
	setx	0x0c2c17415607ff1c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080145ec61f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001070100000, %r1, %r9
	setx	0x0c2c17415607ff1c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f44106d260, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e543efec59, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d7882050a9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001020100000, %r1, %r9
	setx	0x0c2c17415607ff1c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7e19bc600, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ff4f95a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080cb7fc4c7, %r1, %r9
	setx	0x8e9ca0372a0e8bab, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ebab8f3, %r1, %r9
	setx	0x0aba8a3e6de39f3f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f573018, %r1, %r9
	setx	0xea5489f01cb366f0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c361205507, %r1, %r9
	setx	0x7660ce3343840eaa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd6e2cb72f, %r1, %r9
	setx	0xf57d5042ad1e6c44, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xf57d5042ad1e6c44, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e934c813a9, %r1, %r9
	setx	0xb023afa33516ebde, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4c69b2c5c, %r1, %r9
	setx	0x4d4d0893ee197c7c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0d8878, %r1, %r9
	setx	0x27f3c0a802e8de19, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f7f5a40, %r1, %r9
	setx	0xae73dd45b5a8d857, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c49b7ba074, %r1, %r9
	setx	0xd397db77d48d3470, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ddc6cc04b4, %r1, %r9
	setx	0x96e773c25d6a7aef, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e05464416a, %r1, %r9
	setx	0x52c7e143c31194f2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x52c7e143c31194f2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f989bf3aea, %r1, %r9
	setx	0xc5a2748b72fdf820, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e004700, %r1, %r9
	setx	0xc37d4de0e8a67bc0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xc37d4de0e8a67bc0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f5e4c30, %r1, %r9
	setx	0x8dcdf33573ce4b65, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c793ce4660, %r1, %r9
	setx	0xdd18308a0e47a674, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d817559c10, %r1, %r9
	setx	0x40300406739b846f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000edd59b6028, %r1, %r9
	setx	0x241936da8b6bc0d9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8145c7944, %r1, %r9
	setx	0x62328b8498a06c0f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x62328b8498a06c0f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc69140, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e390cc4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fbc53d7598, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ea2d1ff4d4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d6aaa54804, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c12012ea08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d817559c10, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c793ce4660, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f5e4c30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e004700, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f5ab1fb000, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eee78c7c8c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d1626eb8f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fd1365f9c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e3128c7d20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dcc7c019a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cd585b4a68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fe4f9a0, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x00000010b0100000, %r1, %r9
	setx	0x62328b8498a06c0f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ecc8600, %r1, %r9
	setx	0xa96f08921e988b23, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe1db10, %r1, %r9
	setx	0x3f94ef80d643e025, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c51743b970, %r1, %r9
	setx	0xe5232cc556116549, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xe5232cc556116549, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df13169868, %r1, %r9
	setx	0x6e90c53409facb36, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x6e90c53409facb36, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9185c07e8, %r1, %r9
	setx	0x20dce8d97ebe804b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fb9df4b498, %r1, %r9
	setx	0x72d4c6abdf91d984, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x72d4c6abdf91d984, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080948377f6, %r1, %r9
	setx	0xfe152aa6e66e4e9c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3afbc5, %r1, %r9
	setx	0x65f9c0fd91a328fd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f253712, %r1, %r9
	setx	0x27d7c1cf320d435f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c154a2b0e0, %r1, %r9
	setx	0xda48f6c172b8269a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d905059d1d, %r1, %r9
	setx	0x4ebfb4c4082da258, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb638a428c, %r1, %r9
	setx	0x152ada75ec7692c6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fd9fb88a66, %r1, %r9
	setx	0xf077d29e2ee4f888, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xf077d29e2ee4f888, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e6296e4, %r1, %r9
	setx	0xc1c2a1389ebf1d0c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ffc043a, %r1, %r9
	setx	0x76b8d3a2f1209af8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c213646dba, %r1, %r9
	setx	0x3f2c3feb9ecfd381, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x3f2c3feb9ecfd381, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d1d86b7ca4, %r1, %r9
	setx	0x8cfc8915e519ba73, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e21eba7c1e, %r1, %r9
	setx	0x6455aace3d501214, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f43133016e, %r1, %r9
	setx	0x7ab3c6fd0abe5395, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e956ac8, %r1, %r9
	setx	0x64d55448ef043845, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fabba78, %r1, %r9
	setx	0xc2ae39fa5179a1b2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c2bc46f420, %r1, %r9
	setx	0x0b0748e36d84174c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x0b0748e36d84174c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d959679320, %r1, %r9
	setx	0x44dcbb826987312b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e4b87f3068, %r1, %r9
	setx	0xd0966f5ab1769aac, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f1c8c4aa98, %r1, %r9
	setx	0x05035a99aa9ee999, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef770f8, %r1, %r9
	setx	0x9c2ec6ac12271071, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe17088, %r1, %r9
	setx	0xec536a71d604ede5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1d4d523c0, %r1, %r9
	setx	0x27e35cbb0b48074a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2bce3c480, %r1, %r9
	setx	0x7ab20d1426495dfc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9ba9e3908, %r1, %r9
	setx	0xb15563dd64cefbb6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f7f6ce3870, %r1, %r9
	setx	0x16f216e103d214ad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x16f216e103d214ad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da061cb9ea, %r1, %r12
	lduh	[%r12], %r11
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
	setx	0x000000806addfd24, %r1, %r9
	setx	0x9f0945feb0cca75e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x9f0945feb0cca75e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e549ae9, %r1, %r9
	setx	0x18649fa64597990c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd47049, %r1, %r9
	setx	0xee36ecac9397b572, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ccec21d3ee, %r1, %r9
	setx	0x743786924730731d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x743786924730731d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ddd1a93ff6, %r1, %r9
	setx	0x025906a775e32521, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ebe3223b99, %r1, %r9
	setx	0x3f4a30817e04264a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6b9172d0e, %r1, %r9
	setx	0x15e1f0656493945f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e63ac94, %r1, %r9
	setx	0x5ce98835f0e9e249, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x5ce98835f0e9e249, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f86fb58, %r1, %r9
	setx	0xe746d63cc8293196, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c715114b0a, %r1, %r9
	setx	0xf677b302709d26d9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d9b11c216e, %r1, %r9
	setx	0xda1059aa090454f8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eb7b9c1f60, %r1, %r9
	setx	0x35b825c29fa0e8ff, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x35b825c29fa0e8ff, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f29bc75b7e, %r1, %r9
	setx	0x62afc9558a2724e9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x62afc9558a2724e9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e4f49dc, %r1, %r9
	setx	0x89fe3e98217e10ff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x89fe3e98217e10ff, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1ea6b0, %r1, %r9
	setx	0x826736b06704cc5e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c3588d7e14, %r1, %r9
	setx	0x4d098c314567c76e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d93c286b0c, %r1, %r9
	setx	0x68cd603d814ad65f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x68cd603d814ad65f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4d1783300, %r1, %r9
	setx	0x1f7095429445584f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x1f7095429445584f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f0e8086868, %r1, %r9
	setx	0x0cb447eb378fc44f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000806addfd24, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fd9fb88a66, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eb638a428c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r9
	setx	0x0cb447eb378fc44f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e15897c7d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000da061cb9ea, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c453843944, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f0a2e10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e8771f4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4ba011a7e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e549c9ab0c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e753078, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f46c900a94, %r1, %r12
	lduw	[%r12], %r11
	setx	0x0000008033d9897f, %r1, %r9
	setx	0xed9772750c047bd9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea73059, %r1, %r9
	setx	0xc21537f11eff1dd7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3e9408, %r1, %r9
	setx	0xad2882de5eaacdb6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc6f77d92c, %r1, %r9
	setx	0x544876d6e35c02a2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc67e7872d, %r1, %r9
	setx	0xa17e7985660d4502, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7ec52dd44, %r1, %r9
	setx	0xedd8a0b5456055af, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f615998f62, %r1, %r9
	setx	0xc812f2c1aac5862f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e04b5a2, %r1, %r9
	setx	0xce3b2a34c5ef1dd0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xce3b2a34c5ef1dd0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f436010, %r1, %r9
	setx	0xf321ab097750b66b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xf321ab097750b66b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ce4f028a00, %r1, %r9
	setx	0x5bbc7f603ea3f290, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x5bbc7f603ea3f290, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da553c92ce, %r1, %r9
	setx	0x97fac7c524a5c32f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e085b690d0, %r1, %r9
	setx	0xda40dacb39d4ad58, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xda40dacb39d4ad58, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fa414b2e40, %r1, %r9
	setx	0xc5dd31c0c71c23e6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea55ff0, %r1, %r9
	setx	0x9136ba58f515374a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x9136ba58f515374a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f57fd84, %r1, %r9
	setx	0x5de4c80b22ed6bc9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x5de4c80b22ed6bc9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8bfde0fe4, %r1, %r9
	setx	0xae5be10f6b6c1aa0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d66669323c, %r1, %r9
	setx	0xd2eea5193f6974e6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xd2eea5193f6974e6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e2518cee60, %r1, %r9
	setx	0x5d100813298e769e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f669375eec, %r1, %r9
	setx	0x519324c1c0353f37, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e5049f0, %r1, %r9
	setx	0x833da312854f54ce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x833da312854f54ce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8f6988, %r1, %r9
	setx	0x813b4adf7a8078a0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cae12a79f0, %r1, %r9
	setx	0x6c3fbe04dcdc73c8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd3861ba10, %r1, %r9
	setx	0x40d782765d04da61, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3c69de6e8, %r1, %r9
	setx	0x6c6120ba4b7b5f49, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x6c6120ba4b7b5f49, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa878b3928, %r1, %r9
	setx	0x91d4be529b0e9242, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e5d6cb0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080cf757755, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r9
	setx	0x91d4be529b0e9242, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f328f0c9cb, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f1cac9119e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7f22ce7a2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e3128c7d20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dcc7c019a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cd585b4a68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fe4f9a0, %r1, %r12
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
	setx	0x0000001080100000, %r1, %r9
	setx	0x91d4be529b0e9242, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ede5250, %r1, %r9
	setx	0xfd77c6548a189094, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fd2e710, %r1, %r9
	setx	0x88e3c8669cc72294, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c032fe34e0, %r1, %r9
	setx	0x09477652f7fdd77c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x09477652f7fdd77c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d4ba19be40, %r1, %r9
	setx	0xfbb847985c6d2936, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e8296b8050, %r1, %r9
	setx	0x1c63fa9c6878995c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x1c63fa9c6878995c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f1d0b07214, %r1, %r9
	setx	0x214bc7d7b37ed5e2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e47acd0, %r1, %r9
	setx	0x0a03e0bc44dccadd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f73e898, %r1, %r9
	setx	0x4dc636e13c89024f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c48e4000a0, %r1, %r9
	setx	0x35d9ed7a00655618, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc03ecbf28, %r1, %r9
	setx	0xf73ca96f78adaa03, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eecad21ff0, %r1, %r9
	setx	0x760e2708915ebccd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f92101c7e8, %r1, %r9
	setx	0xc1b4915b6d96f684, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e6296e4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f989bf3aea, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e045cbb180, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d8447541c4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c067c25a78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f4bfc30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb7173c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc85c4602c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e984cb1f40, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f80c980250, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e58f6ccbd8, %r1, %r12
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
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e204584, %r1, %r9
	setx	0xd9e64ec4b45a5def, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2d7888, %r1, %r9
	setx	0x49e3db5f5f29a4d0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x49e3db5f5f29a4d0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca586ac138, %r1, %r9
	setx	0x6161fd85df9c75d6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db7e92cc0c, %r1, %r9
	setx	0xb5ac6a21e9409446, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ebbd6c0d84, %r1, %r9
	setx	0xfaa232be5445c262, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xfaa232be5445c262, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f1ab71f14c, %r1, %r9
	setx	0xd7941d1f92bab1ad, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e338d20, %r1, %r9
	setx	0xaefe9b562a2684c8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f675270, %r1, %r9
	setx	0x16226268f5d6c9d7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c53028ff98, %r1, %r9
	setx	0x071891413f5c980c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8c6861330, %r1, %r9
	setx	0x07d1409697120f4f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e5de7fcb98, %r1, %r9
	setx	0x9309de4e80982363, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x9309de4e80982363, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f5e87984e0, %r1, %r9
	setx	0x8f6440b143bf582d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x8f6440b143bf582d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x8f6440b143bf582d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800eb52c4c, %r1, %r9
	setx	0xfc79da83662fbb60, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fdd0b04, %r1, %r9
	setx	0x4a7fdf9e3473fb3c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1854ebf2c, %r1, %r9
	setx	0xf3958e15f1e674b4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ddbabd6bac, %r1, %r9
	setx	0x120f71ffdd0e2aa5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e5cf83d93e, %r1, %r9
	setx	0x3e05e8283b911b9d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f5de12ebf8, %r1, %r9
	setx	0x350758228630d863, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e09d668, %r1, %r9
	setx	0x030ce23d78f2db7c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x030ce23d78f2db7c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f176f24, %r1, %r9
	setx	0xfad942625e435524, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xfad942625e435524, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1befd6e58, %r1, %r9
	setx	0x9a2ad079ae1b3e4d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x9a2ad079ae1b3e4d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d86befac94, %r1, %r9
	setx	0x546da9309d1d8678, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e0c242f108, %r1, %r9
	setx	0x51997d70815d8932, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6832e8de8, %r1, %r9
	setx	0x58c09585da47cb8f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x58c09585da47cb8f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e68dc20, %r1, %r9
	setx	0x3faec171cd37488d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x3faec171cd37488d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f868b00, %r1, %r9
	setx	0x7550e1eeff5b28ed, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb2fa6f000, %r1, %r9
	setx	0xc9dbc8dfa0ae3f92, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d740182c78, %r1, %r9
	setx	0xe5b504318ae2b919, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e2f13d2170, %r1, %r9
	setx	0x6a3b299f021c94ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc36d7e688, %r1, %r9
	setx	0x6f4f5960c99b4afa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea95c4ba28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d36ae2d7e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c86572f708, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f0f7f50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e2c13b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6450b5980, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e7398197a0, %r1, %r12
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
	setx	0x00000010f0100000, %r1, %r9
	setx	0x6f4f5960c99b4afa, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e80c95a, %r1, %r9
	setx	0xbb3a6858037ef6cb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f97bbe8, %r1, %r9
	setx	0x1b0b644707119614, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cf0f27150c, %r1, %r9
	setx	0x39b1bfe717ad680c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5b16f577c, %r1, %r9
	setx	0x53af508a8543a1b5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e81629fa96, %r1, %r9
	setx	0xe59b210c5b8789f8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xe59b210c5b8789f8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f7b5ad7d88, %r1, %r9
	setx	0x2d2fbf4cd3a7dad8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9ac250, %r1, %r9
	setx	0x6f7dfcdfd33712c8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f22a130, %r1, %r9
	setx	0xf81c98995572876d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c007bb2b98, %r1, %r9
	setx	0x359400ae9fec3982, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d284767890, %r1, %r9
	setx	0xa382e58f5fd7cd71, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e04e81cfd0, %r1, %r9
	setx	0xf839a66e58d89b83, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fba2959d90, %r1, %r9
	setx	0x4da0def0faa4e97f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f68250fc4d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001010100000, %r1, %r9
	setx	0x4da0def0faa4e97f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e4d6f1aba7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d72a646412, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001090100000, %r1, %r9
	setx	0x4da0def0faa4e97f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000801f81e58a, %r1, %r9
	setx	0x4a0e4eab3a1c1e69, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x4a0e4eab3a1c1e69, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ebe8282, %r1, %r9
	setx	0x4cd03be176fa9461, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f767c8d, %r1, %r9
	setx	0xfbd9678cc56a3f8d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf0cf4eb5d, %r1, %r9
	setx	0xdc9a75dd056ec7d0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xdc9a75dd056ec7d0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d317e8c381, %r1, %r9
	setx	0x62a6de5a3696e702, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x62a6de5a3696e702, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000edb329f785, %r1, %r9
	setx	0x592bab1934e1d11c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f7869d4548, %r1, %r9
	setx	0x760d1d1d06b4d0ca, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x760d1d1d06b4d0ca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e956ff4, %r1, %r9
	setx	0xab7f30b0601d5c95, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f245674, %r1, %r9
	setx	0x9f4333ceb5717437, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x9f4333ceb5717437, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6ffc2f9b4, %r1, %r9
	setx	0xa25495cc40fa8f58, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xa25495cc40fa8f58, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de0ab292d4, %r1, %r9
	setx	0x6605327c78a692ad, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec0ffb083c, %r1, %r9
	setx	0xfc19ecaeb19b4d16, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f5f4e508cc, %r1, %r9
	setx	0x3c50c3d1876b71ee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dd514d1866, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c25f68e2e6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f198024, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e41553c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6f1ab18ba, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb25cc7e7a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c762565c98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f1cfb30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e195e98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fb00c80420, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000efe0551380, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d4fe0933a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080a3ca0a9f, %r1, %r9
	setx	0xfc101fe056830ea9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eeb1508, %r1, %r9
	setx	0xb0e06ece8e9460f6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f17cd6f, %r1, %r9
	setx	0x59ffa5d1af9f0bea, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c32e78b61a, %r1, %r9
	setx	0x491fcb120b4573e2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x491fcb120b4573e2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000daf8b406a5, %r1, %r9
	setx	0x30ac76d65262aead, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2c2f5870f, %r1, %r9
	setx	0x0c7328e978e94496, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f48e6a3497, %r1, %r9
	setx	0x4c9a630a20dfaa4d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x4c9a630a20dfaa4d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ef8ddf4, %r1, %r9
	setx	0x1b035a7a51922993, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe6900c, %r1, %r9
	setx	0xec60cfe9740347a4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cea464702e, %r1, %r9
	setx	0x633991933d608e3b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d23e799898, %r1, %r9
	setx	0x3de05841d5126162, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x3de05841d5126162, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000edf5accf16, %r1, %r9
	setx	0xe5f2eeeb911213d6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f1b770e900, %r1, %r9
	setx	0x2e59f4237055244b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e46f888, %r1, %r9
	setx	0x9093a763c65b66ae, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb02ec0, %r1, %r9
	setx	0x6d67681d248a8732, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c328602170, %r1, %r9
	setx	0x4a6742873cc3dbf9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x4a6742873cc3dbf9, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d7901cd8ec, %r1, %r9
	setx	0x73ede71cb8c0beef, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e1ce30d0a0, %r1, %r9
	setx	0x66117abbd4c83cdf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe79f898bc, %r1, %r9
	setx	0x591781384ea76fdf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb25cc7e7a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1d8bd17c6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cadb6f467c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe78afc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e83de36, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d7dd7b5314, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cc9b7381c4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f8622e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e0cebb4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f90a2f14ec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ec055633d8, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x591781384ea76fdf, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e5ec4c0, %r1, %r9
	setx	0x567dea443411d715, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f9a5430, %r1, %r9
	setx	0x132b73d4c2881138, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x132b73d4c2881138, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c85fef79e8, %r1, %r9
	setx	0xa17597424c4adaa5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xa17597424c4adaa5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d50ee1befc, %r1, %r9
	setx	0xf6fcdc589c8b10fa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5238a0340, %r1, %r9
	setx	0xf3083db79afa2e0f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xf3083db79afa2e0f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f06a425140, %r1, %r9
	setx	0xca67c0f441d5ac52, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0xca67c0f441d5ac52, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e5879a0, %r1, %r9
	setx	0xc8352020fc880b1a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6d9d40, %r1, %r9
	setx	0x7b0db0f35ee4f3e0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cad32c53b8, %r1, %r9
	setx	0x2a34deaf3e94975f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d16b563b18, %r1, %r9
	setx	0x5809a148e33bbf36, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e37788eef8, %r1, %r9
	setx	0xa2e6d4d27a1e260c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xa2e6d4d27a1e260c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fb6c5ddc18, %r1, %r9
	setx	0x6771a3d1468d1142, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x6771a3d1468d1142, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c793ce4660, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f5e4c30, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x0000008016b6ca39, %r1, %r9
	setx	0x76771783c2f678a5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e58c30c, %r1, %r9
	setx	0xfb957b4cd98f097b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fbeda20, %r1, %r9
	setx	0x9ef915a57305f46e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5cecac2da, %r1, %r9
	setx	0x8d88378441323330, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d6a507114b, %r1, %r9
	setx	0xb01f735748d8bfe7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6156b8a90, %r1, %r9
	setx	0xcd7dbac960b33aef, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xcd7dbac960b33aef, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fb2c2958a7, %r1, %r9
	setx	0x8811a792031029c0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800edc20b0, %r1, %r9
	setx	0xb5732b516d49ac28, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f390d9e, %r1, %r9
	setx	0xc16da13d61d53e46, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ceb1f6a6b2, %r1, %r9
	setx	0x022534d0fb8cc995, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d20e919a8e, %r1, %r9
	setx	0xc0f7df3b5640b8bd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e94ddc15b4, %r1, %r9
	setx	0xfe3c9ba08d213bb8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xfe3c9ba08d213bb8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fddc58b4, %r1, %r9
	setx	0xc44cb0c53ba04f92, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c674a6fcd0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f11ace6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ef98efe, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f81cf06b76, %r1, %r12
	lduh	[%r12], %r11
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
	setx	0x00000010b0100000, %r1, %r9
	setx	0xc44cb0c53ba04f92, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000804409c427, %r1, %r9
	setx	0x21bcc87dd43abb83, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e033f37, %r1, %r9
	setx	0x1d549511ac5ffb65, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f8ccaa2, %r1, %r9
	setx	0xef387585500e0669, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4b81d111b, %r1, %r9
	setx	0xe312851cdd6e5250, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dec88fb3e6, %r1, %r9
	setx	0x77209710d71c0372, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2f3696f89, %r1, %r9
	setx	0x3861e99c98a34066, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f7c6044d3c, %r1, %r9
	setx	0x62ed53eba55880c6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x62ed53eba55880c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf0cf4eb5d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f767c8d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ebe8282, %r1, %r12
	ldub	[%r12], %r11
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
	setx	0x0000008097e6916b, %r1, %r9
	setx	0x8f63e96568bf4c3a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e56994f, %r1, %r9
	setx	0x975ba60a3a9b0dae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f0b2d2f, %r1, %r9
	setx	0x427a58263a37054d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4f560969a, %r1, %r9
	setx	0xedfc311e2608d242, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xedfc311e2608d242, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d85b91d5cf, %r1, %r9
	setx	0x480f3c5c6cb42f8e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9c8d00ee4, %r1, %r9
	setx	0x3990a88e193ec16a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6c2203b7a, %r1, %r9
	setx	0x9dae34ec080d52fe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eccd6ee, %r1, %r9
	setx	0x11c45b22a9ba600d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f14209e, %r1, %r9
	setx	0x733cd048716d402c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cbd524d89a, %r1, %r9
	setx	0x81c34d797819d1cc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1b0439d0a, %r1, %r9
	setx	0x7105d0a6ed5a4db6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x7105d0a6ed5a4db6, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ee0eed70b2, %r1, %r9
	setx	0x1c77f63a08936ea5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fcffd1a020, %r1, %r9
	setx	0x1aed4ecda09a4224, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ede7d54, %r1, %r9
	setx	0x0b2a224482f6950f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f97acc4, %r1, %r9
	setx	0x4a9c5a4bb75acf10, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c1b23f5554, %r1, %r9
	setx	0x632d326607d5e32a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x632d326607d5e32a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d6be277310, %r1, %r9
	setx	0x1712327824e3cb93, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x1712327824e3cb93, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e0744b9da4, %r1, %r9
	setx	0x585b967ea25c46cd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0472fc7d8, %r1, %r9
	setx	0x4f2297b1de4d730d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x4f2297b1de4d730d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e1f7e48, %r1, %r9
	setx	0xe20e3dbaaa1fa352, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xe20e3dbaaa1fa352, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4f3cb8, %r1, %r9
	setx	0xaed4d780201d9b2a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5f28d81a0, %r1, %r9
	setx	0xb2eb692134680b9c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xb2eb692134680b9c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8e30fc2c8, %r1, %r9
	setx	0x6294717cd73eb1a3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x6294717cd73eb1a3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e6a4a20d90, %r1, %r9
	setx	0xb34f3838e01618d9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f946924630, %r1, %r9
	setx	0x6b43314922a9aa48, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd723ec, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e8d01be, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2739a50e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e2090d10ac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1bcfd2ea6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb0a4a4ebc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f398d8e, %r1, %r12
	lduh	[%r12], %r11
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
	setx	0x00000080f22793a3, %r1, %r9
	setx	0x0e76c70e8022f536, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e41cecf, %r1, %r9
	setx	0x281eb8e45eced4de, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x281eb8e45eced4de, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f415a9d, %r1, %r9
	setx	0x1dcda4d136ae7932, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x1dcda4d136ae7932, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c99653dd1c, %r1, %r9
	setx	0x3158b1cd3efe4374, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d580578855, %r1, %r9
	setx	0x2909a35fbd5f66a4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e217f4566f, %r1, %r9
	setx	0x6070a6f4940472a7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcbc8fe714, %r1, %r9
	setx	0x7970152554f1d975, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2fac44, %r1, %r9
	setx	0x1bd888363077f593, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x1bd888363077f593, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f701038, %r1, %r9
	setx	0x808fa7ac68ab869a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cce4db776e, %r1, %r9
	setx	0xc02461dbae7b02ee, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db903af9a8, %r1, %r9
	setx	0x931cb219e9afda12, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e63d730d4c, %r1, %r9
	setx	0x98bf807427aa6667, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f377a0f4d2, %r1, %r9
	setx	0x1766210dbfacd577, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea17500, %r1, %r9
	setx	0xb2b493d083095422, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1b9410, %r1, %r9
	setx	0xf7038266bca7e8e9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc82e34808, %r1, %r9
	setx	0xc27e67ad1e0f1225, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d891e7a8a8, %r1, %r9
	setx	0x1d9790afbb4cf477, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eebe08fc38, %r1, %r9
	setx	0x0530fc0d7c42a011, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f666565628, %r1, %r9
	setx	0xdb7fcb9d28443f5f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c213646dba, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ffc043a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6296e4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f989bf3aea, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e05464416a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ddc6cc04b4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c49b7ba074, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb4f79503c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dcb8d082b4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cf0cbbc178, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x000000f390a9c11b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ed0aca5a79, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d997f6638e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c0fc02d40d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f546558, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001090100000, %r1, %r9
	setx	0xdb7fcb9d28443f5f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f8542b7276, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d658964f68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ce88656590, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008047d3cd3b, %r1, %r9
	setx	0x99975c762fa3cd25, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5b5bfd, %r1, %r9
	setx	0x7b95b169651433e4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f033908, %r1, %r9
	setx	0xebb6871772ad31c2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xebb6871772ad31c2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c396fa5b39, %r1, %r9
	setx	0xc5c09929aa4743e3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2f50a1fe8, %r1, %r9
	setx	0x037d111e5e3f8b63, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3dd9b5e27, %r1, %r9
	setx	0x97803c5a8f4aff5f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x97803c5a8f4aff5f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f136a46503, %r1, %r9
	setx	0x705da9f835a64808, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea2737c, %r1, %r9
	setx	0x7f2aeaa6909da639, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f48ffea, %r1, %r9
	setx	0xbf2a2ad1c36d1755, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd2c32f8cc, %r1, %r9
	setx	0x933a88d3682418dc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d7a6e82298, %r1, %r9
	setx	0x2acb19c0177e0a4e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e37a34def6, %r1, %r9
	setx	0x9683726ffa4899f9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa4efd9c4e, %r1, %r9
	setx	0xcc2097049a8431c7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0xcc2097049a8431c7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e16e2c013e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d9ce9b7d90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c857c477c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fa0e24c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6dff30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f57aa3fb90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec2a43ac26, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r9
	setx	0xcc2097049a8431c7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e9f6250, %r1, %r9
	setx	0xd129429fb0c676a7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb2b370, %r1, %r9
	setx	0x1e46bb347258e572, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c28dc2bd08, %r1, %r9
	setx	0xf7f28e6239d40628, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2a469b880, %r1, %r9
	setx	0x2270fe5714d809fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1111e7740, %r1, %r9
	setx	0x3f93f19ac6b252a4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0882845a8, %r1, %r9
	setx	0x118e964d82a41bd8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x118e964d82a41bd8, %r1, %r10
	ldx	[%r9], %r10
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
	setx	0x000000f000000080, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000001060100000, %r1, %r9
	setx	0x118e964d82a41bd8, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ef16bf2, %r1, %r9
	setx	0xea1ebd8d58dccdad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fcc0f7e, %r1, %r9
	setx	0x55c8b66049a30f26, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cac7c89ecc, %r1, %r9
	setx	0xc701c22d9a013f8f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xc701c22d9a013f8f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d06a680bfc, %r1, %r9
	setx	0x119000fd3d51bae8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e1844f95e8, %r1, %r9
	setx	0x072742a078b2a141, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f45834cf1e, %r1, %r9
	setx	0xb9dbb639073d67f3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e42d1e0, %r1, %r9
	setx	0xb8b245d30d9c4166, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fcdfdc8, %r1, %r9
	setx	0xc3d89d98b8ee6c25, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb050c06c8, %r1, %r9
	setx	0x446c42daeebe21a6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd6fb32ed8, %r1, %r9
	setx	0xd8f6af430fb827a0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e642642998, %r1, %r9
	setx	0x10db53e63652a46f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa577301c8, %r1, %r9
	setx	0x84db8dfed487ccea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fabf030, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e3b2b70, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000001020100000, %r1, %r9
	setx	0x84db8dfed487ccea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e8c3416, %r1, %r9
	setx	0xfae9c4b142a36744, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f51e3ce, %r1, %r9
	setx	0xbe71abf901af02b5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c100abfd3e, %r1, %r9
	setx	0x5ee05c8f436520dc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4cc6af210, %r1, %r9
	setx	0x8f988074cf12432a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2de3b0596, %r1, %r9
	setx	0x81f43a331b5dd469, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x81f43a331b5dd469, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f81d006f96, %r1, %r9
	setx	0x2f0fc37cfda496aa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x2f0fc37cfda496aa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000008024d47447, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f44ccc75b1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ec0526dae9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dc07238ab9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001090100000, %r1, %r9
	setx	0x2f0fc37cfda496aa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e1a7afc, %r1, %r9
	setx	0xb2e4d4341de8dae7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xb2e4d4341de8dae7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f292dce, %r1, %r9
	setx	0xfc9eb5858e74b771, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1bd65136e, %r1, %r9
	setx	0xcbe69db8cd4acc9f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xcbe69db8cd4acc9f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d5592cd726, %r1, %r9
	setx	0x95d3bb46cd6356db, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000edc3486eda, %r1, %r9
	setx	0x3b6c9243457bf539, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4b3572a84, %r1, %r9
	setx	0xe71cb64daf65ef68, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ebc80d2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008024d47447, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f44ccc75b1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ec0526dae9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dc07238ab9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001040100000, %r1, %r9
	setx	0xe71cb64daf65ef68, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5d01f78aa, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f737c16, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fcffd1a020, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ee0eed70b2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1b0439d0a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cbd524d89a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f14209e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eccd6ee, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f53e3ebc48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x00000080d322e9de, %r1, %r9
	setx	0x79ed901429fbd958, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e612383, %r1, %r9
	setx	0x0055f126cf9521b0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3f115b, %r1, %r9
	setx	0xced7c9a8a07b7fd2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c240181d55, %r1, %r9
	setx	0xe3aa19fa78930adb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xe3aa19fa78930adb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000daf57d28f0, %r1, %r9
	setx	0x2b9e8f06d14ae23b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x2b9e8f06d14ae23b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e569855f4e, %r1, %r9
	setx	0x2be9fdadb48fc65e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x2be9fdadb48fc65e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f1c4329f7a, %r1, %r9
	setx	0xbd2f9bbbb0527ce8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4344d0, %r1, %r9
	setx	0x3f2bb0ea2b667b70, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5c0b08, %r1, %r9
	setx	0x4c2526cd6ea8f08e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c6d4aeff1c, %r1, %r9
	setx	0x10b82da540233437, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x10b82da540233437, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d35a363cb4, %r1, %r9
	setx	0x39da86e2d4e6dbde, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e4da9fb00c, %r1, %r9
	setx	0x32900d26ad81548b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x32900d26ad81548b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f7714a3dc0, %r1, %r9
	setx	0xe50663383d063dcc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xe50663383d063dcc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e8af8d8, %r1, %r9
	setx	0x691a2511c15942c0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ffc6728, %r1, %r9
	setx	0x5631a4cd0fdf331f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x5631a4cd0fdf331f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c129ecf930, %r1, %r9
	setx	0xc345cf18f858594f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xc345cf18f858594f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d57afc5cb8, %r1, %r9
	setx	0x035ed5a330fce63e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef03db00f0, %r1, %r9
	setx	0x0555d2c3d5ce1a74, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8769404d0, %r1, %r9
	setx	0xb80cc8c7531ec25c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8f6988, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5049f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f7f6ce3870, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e9ba9e3908, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d2bce3c480, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c1d4d523c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fe17088, %r1, %r12
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
	setx	0xb80cc8c7531ec25c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080bfee1364, %r1, %r9
	setx	0x0f943f61e16983de, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea0dc3e, %r1, %r9
	setx	0xe52693cb913a1051, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7763c8, %r1, %r9
	setx	0xed62647fdfb56af5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4eeeeefab, %r1, %r9
	setx	0x3ef36ccb8ef0247b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8eb824090, %r1, %r9
	setx	0x4b0b7674af2863cf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e204cc9738, %r1, %r9
	setx	0xdf4e84943c3b43a8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fbf8140acc, %r1, %r9
	setx	0xe56f012b2e85b58a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db903af9a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d86befac94, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c1befd6e58, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f176f24, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e09d668, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000803daff74b, %r1, %r9
	setx	0xf8748b0aff050bb7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e543800, %r1, %r9
	setx	0xec6a07bd6cf3deaf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xec6a07bd6cf3deaf, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fea3ec4, %r1, %r9
	setx	0x6d024eafd5545ee5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c52d64417b, %r1, %r9
	setx	0x0aff8e7a491ce044, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1ed6a5e48, %r1, %r9
	setx	0xf3895e32cd638368, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb8b9fb2bf, %r1, %r9
	setx	0x349f76e1102498a7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fadcd18ec7, %r1, %r9
	setx	0x547a9c5bebde541c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x547a9c5bebde541c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e643ca4, %r1, %r9
	setx	0xf550ccc0dfa40b75, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd1d50c, %r1, %r9
	setx	0x544c4639a9a41b5b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c07792838e, %r1, %r9
	setx	0x444b958b3ed9b86c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d59a7b5734, %r1, %r9
	setx	0x705ab3f2e110bf92, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eaa83ff7be, %r1, %r9
	setx	0x034222236a5e88f7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f5a941f640, %r1, %r9
	setx	0x24d7d3f61c2ceec6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9f85b8, %r1, %r9
	setx	0xaf2d3ae13278284e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f76fa90, %r1, %r9
	setx	0xbd371cba3db70983, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0xbd371cba3db70983, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c4b8b0c1f0, %r1, %r9
	setx	0x8b91170816e7a8fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1abaaf428, %r1, %r9
	setx	0xb42419d23a0e07c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3deb2e9f0, %r1, %r9
	setx	0x7fa440b37bddcfc6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0d8d4d910, %r1, %r9
	setx	0xd29a3da5b4570a06, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0xd29a3da5b4570a06, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce8bc39db8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ff69ea0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7cb3d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da553c92ce, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ce4f028a00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f436010, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e04b5a2, %r1, %r12
	lduh	[%r12], %r11
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
	setx	0x00000010d0100000, %r1, %r9
	setx	0xd29a3da5b4570a06, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e61c8d0, %r1, %r9
	setx	0x65e49168cf4ced0b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f324348, %r1, %r9
	setx	0xfb14c3c65c4619f7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce6dff9868, %r1, %r9
	setx	0x1bd26dcafaf3f4ec, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4fbe60590, %r1, %r9
	setx	0xa2c97a5d3f8bd664, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ead4a1dc48, %r1, %r9
	setx	0xad7e6815ac47170e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa8b17b100, %r1, %r9
	setx	0x872e99b1e6f20ecf, %r1, %r10
	stx	%r10, [%r9]
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
	setx	0x00000010c0100000, %r1, %r9
	setx	0x872e99b1e6f20ecf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e3c8490, %r1, %r9
	setx	0xb6a795b50cca59c6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f9b0934, %r1, %r9
	setx	0x9079cd2c83127ea4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000caea468aaa, %r1, %r9
	setx	0x971977f3d8f42890, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ded9d1659e, %r1, %r9
	setx	0xd540d4c9ae42f523, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xd540d4c9ae42f523, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e82756f92a, %r1, %r9
	setx	0x98b4287e146ca9c8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f3fe3ff728, %r1, %r9
	setx	0x191f2c16466913ad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e6db0b4, %r1, %r9
	setx	0xc9791c4e6ba4dfae, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xc9791c4e6ba4dfae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f74fcb0, %r1, %r9
	setx	0x38992bcff595e441, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x38992bcff595e441, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c809156c28, %r1, %r9
	setx	0xd0d3696d8787152f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d602b6612c, %r1, %r9
	setx	0x4574835923d7c143, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x4574835923d7c143, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e5e5aa01d4, %r1, %r9
	setx	0xaffe040891cc4654, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f173127fec, %r1, %r9
	setx	0xb3072294b863dd42, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e76e4bb55a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000df9cff2b41, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cc3516012f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fe0abbc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9b77e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ebf79a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fd621b5f38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000edb924b880, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d71089c088, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ce3aa0fa68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fdb7440, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e6451c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e915c4c, %r1, %r9
	setx	0x922b7755c0940d0e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fbb861c, %r1, %r9
	setx	0xbe4bf44f5ea12469, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xbe4bf44f5ea12469, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c20e421978, %r1, %r9
	setx	0x7a55f7c6774a5c12, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc6530020c, %r1, %r9
	setx	0x5346560364a98135, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x5346560364a98135, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e5317dda0c, %r1, %r9
	setx	0xabdfad5809d66c23, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f625bf6f18, %r1, %r9
	setx	0x28f3f6c8b4c98af7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x28f3f6c8b4c98af7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e512848, %r1, %r9
	setx	0x2d8d6d2c15c1cc43, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f28f520, %r1, %r9
	setx	0xf878bddd7d24c0dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c785a81758, %r1, %r9
	setx	0x2bc668b66a483db5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd88af9fc0, %r1, %r9
	setx	0x05576249e0816a33, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea8c8e1668, %r1, %r9
	setx	0x57aa1d19999fd186, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x57aa1d19999fd186, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f1a56474c8, %r1, %r9
	setx	0xb6644199c58c8731, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f43133016e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e956ac8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8145c7944, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x00000010b0100000, %r1, %r9
	setx	0xb6644199c58c8731, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e7eb2f2, %r1, %r9
	setx	0x42d02dbdc6bb993f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f9c1f20, %r1, %r9
	setx	0xb413c6ad79d763e4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc6287208c, %r1, %r9
	setx	0xc7092aa7981f984c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da39f58dec, %r1, %r9
	setx	0x2f5e638efc9a0da3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e370375ab2, %r1, %r9
	setx	0x514ed39a1d2b957e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f51839d3b4, %r1, %r9
	setx	0x241cffb60101026f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x241cffb60101026f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e7a37d0, %r1, %r9
	setx	0xbd9bff685438a56f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xbd9bff685438a56f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fd25f10, %r1, %r9
	setx	0xd019492b6cfe956d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ceb07a1664, %r1, %r9
	setx	0x418fb7a3d5c613d5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dba72ea048, %r1, %r9
	setx	0xf1ed6fbb15200688, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e4322851c4, %r1, %r9
	setx	0x7ef1eb4e32ffe184, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fec4dca510, %r1, %r9
	setx	0xd603220b584fb3d2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee09ab8, %r1, %r9
	setx	0x3491c4deb9a23432, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x3491c4deb9a23432, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff35f78, %r1, %r9
	setx	0x828ec3bf3e2d0fb9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x828ec3bf3e2d0fb9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cda5300d88, %r1, %r9
	setx	0xd350d6922372c225, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xd350d6922372c225, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dc8c5c9818, %r1, %r9
	setx	0xe9fefa244f21e722, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0b1a6d7f8, %r1, %r9
	setx	0x6a2faec17b4df5f1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fd91b70298, %r1, %r9
	setx	0x8c9ca03e15ecf5bf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e4344d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0472fc7d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e0744b9da4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d6be277310, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c1b23f5554, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f97acc4, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x000000800eebda18, %r1, %r9
	setx	0xcdf45ac51a8d999b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ffa1c38, %r1, %r9
	setx	0x39cf3b47be933231, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x39cf3b47be933231, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cf840f84d0, %r1, %r9
	setx	0xeae090f751c15fb1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d40a8ed7d8, %r1, %r9
	setx	0xb3ffa18cc8122aba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ecc0563d38, %r1, %r9
	setx	0xce90fcc1032d48ec, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2408dc418, %r1, %r9
	setx	0x3d879a1867f498d8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c248a59387, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fadb369, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ebc80d2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fcd60d4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f3bbf50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e9f6250, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000008047770c74, %r1, %r9
	setx	0xbe205c64cb684da4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2083b8, %r1, %r9
	setx	0xb64c98e36901e551, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3be976, %r1, %r9
	setx	0x16bcc18562e6d939, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc49b40dbc, %r1, %r9
	setx	0xb981b833c86aa8d3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d29a3b2489, %r1, %r9
	setx	0x79ca9722eecf65ce, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e99662ec8d, %r1, %r9
	setx	0x2c02dfa387ccaac1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcce1e6443, %r1, %r9
	setx	0x123b29159dee4dde, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e75e56c, %r1, %r9
	setx	0xf0d324033b2a9a71, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8faa50, %r1, %r9
	setx	0x5db058c4d8ab8e50, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c7fc7bef0c, %r1, %r9
	setx	0xbc24587383ff28c8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1dcfb7cae, %r1, %r9
	setx	0x03b17f89eb16332e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2244e8808, %r1, %r9
	setx	0xf9d265099fb6c71c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f791ad0490, %r1, %r9
	setx	0xbd4c0abbd2fc5027, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed9adac, %r1, %r9
	setx	0xfde5e37548b93317, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xfde5e37548b93317, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800fa15f6c, %r1, %r9
	setx	0xdfeb1cf69140cf8f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c86f5f1b74, %r1, %r9
	setx	0xe641480c33f30ee0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xe641480c33f30ee0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000db5c233090, %r1, %r9
	setx	0x26d8f8f45636e417, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000edcf565dd0, %r1, %r9
	setx	0x6fc01a1f5813c222, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x6fc01a1f5813c222, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fb00f32504, %r1, %r9
	setx	0xa00a7e3139488c7b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e2dc480, %r1, %r9
	setx	0x4e3834c908aebe55, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7f1680, %r1, %r9
	setx	0x2fba5288acae7779, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7125b65a8, %r1, %r9
	setx	0x3ee004f729d4f339, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da90c40088, %r1, %r9
	setx	0x14a6fd312466c142, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef9ea35ce0, %r1, %r9
	setx	0x4e152d0293fb76f4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x4e152d0293fb76f4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f9192b3678, %r1, %r9
	setx	0xc5872646a5135259, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e39e68bd7e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fb00c80420, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000efe0551380, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d4fe0933a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c0e3b6c1e8, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x0000001060100000, %r1, %r9
	setx	0xc5872646a5135259, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080986098cf, %r1, %r9
	setx	0xf4c57a9a94ad7f02, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0xf4c57a9a94ad7f02, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e2a731d, %r1, %r9
	setx	0x34d31816f046e11b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2b2432, %r1, %r9
	setx	0x0783e6dabe2dd558, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf75e65d47, %r1, %r9
	setx	0x7f9a93a32b2a761a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ddf79a6175, %r1, %r9
	setx	0x7c8a1beac8bd88ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e05391264e, %r1, %r9
	setx	0xcfb75fb220e10d00, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f3a5976e82, %r1, %r9
	setx	0x06170b611db71fd7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x06170b611db71fd7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e755078, %r1, %r9
	setx	0xb1ac955d8c86e061, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5ef614, %r1, %r9
	setx	0xdee0b7551931f5a2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c06b1c3f54, %r1, %r9
	setx	0x9bcfe7524300d36d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x9bcfe7524300d36d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d021801048, %r1, %r9
	setx	0xd3cb2af87199b523, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea57dc6108, %r1, %r9
	setx	0x5a7c940bc4c23853, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8b5347998, %r1, %r9
	setx	0xb37dceeb3fad3aea, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xb37dceeb3fad3aea, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e5d7b38, %r1, %r9
	setx	0xfd61ae86e75d4eb5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f065578, %r1, %r9
	setx	0x5930e1bad56a4b40, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x5930e1bad56a4b40, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c12b430420, %r1, %r9
	setx	0x0b3b74f7e64bb1ea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4cbbb3170, %r1, %r9
	setx	0xdef8dc344d092f2c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6aa2f8f18, %r1, %r9
	setx	0xd8ee4c58108e6c9f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f884fcaf28, %r1, %r9
	setx	0x09eefe5ef68bfd63, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x09eefe5ef68bfd63, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e56994f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008097e6916b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f7c6044d3c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e2f3696f89, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dec88fb3e6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001080100000, %r1, %r9
	setx	0x09eefe5ef68bfd63, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c4b81d111b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001070100000, %r1, %r9
	setx	0x09eefe5ef68bfd63, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f8ccaa2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r9
	setx	0x09eefe5ef68bfd63, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d7901cd8ec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c328602170, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x0000001010100000, %r1, %r9
	setx	0x09eefe5ef68bfd63, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eb5069e, %r1, %r9
	setx	0x8d658f63bd630588, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd275c6, %r1, %r9
	setx	0xc038e3de45156a36, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c69ae50ac6, %r1, %r9
	setx	0x502f478024739ef4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d80aa12948, %r1, %r9
	setx	0x4c92505635a0fbcd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x4c92505635a0fbcd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eea28a42c6, %r1, %r9
	setx	0x1be239044826b2a4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2b52e7f0e, %r1, %r9
	setx	0x430383b9247d7d55, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e8dbbd8, %r1, %r9
	setx	0xb97e17b56b3cffd9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f70e2b4, %r1, %r9
	setx	0xf04a596c26c7a0f0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c555b01d8c, %r1, %r9
	setx	0xa5f84c62a404c4ba, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xa5f84c62a404c4ba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1170d5818, %r1, %r9
	setx	0x08c354b01f2c72ea, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x08c354b01f2c72ea, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000effffdf930, %r1, %r9
	setx	0x65d8745ee5e22ed5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000feaefc9810, %r1, %r9
	setx	0x249d1715c966614a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f57aa3fb90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d32ac02ce8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c0b40bcd48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f0aa7b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5cd2a8, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x000000f000000000, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x0000001090100000, %r1, %r9
	setx	0x249d1715c966614a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eabbab0, %r1, %r9
	setx	0x846868f5867ede7e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f91bb58, %r1, %r9
	setx	0x4cad1a3107d8bc39, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5283af068, %r1, %r9
	setx	0x354b0cb2be14a8fc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6d72de5c0, %r1, %r9
	setx	0xdb4339e65fb138b6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e024c181a8, %r1, %r9
	setx	0xa001b0717e6d1616, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc7d82f2f0, %r1, %r9
	setx	0x477d6c0728cf911c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ea73059, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eee78c7c8c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d1626eb8f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c1884c4b78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f203418, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e1c33b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fdb8e1da0c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e4f0184, %r1, %r9
	setx	0x9c83148823860953, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc62558, %r1, %r9
	setx	0x3b50a66b8b016f99, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ced7bc9494, %r1, %r9
	setx	0x92299b3be68c3513, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d9d770cf88, %r1, %r9
	setx	0x1ddb61f99c23a40a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea5d386104, %r1, %r9
	setx	0x64db9d21c9e35587, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f9b7d66ce8, %r1, %r9
	setx	0x3ba441914c8432fe, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ebf79a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fd621b5f38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000edb924b880, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e6b90c0, %r1, %r9
	setx	0x9098668969e8abca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd83040, %r1, %r9
	setx	0x4d51fb550ed4ca12, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c021bed4c8, %r1, %r9
	setx	0x890d0ac7e9fec7e8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d09d9bb918, %r1, %r9
	setx	0x361020364b63e2c5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e64d2b9260, %r1, %r9
	setx	0x20e61b801d0a76ad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f76e519818, %r1, %r9
	setx	0x26f10d276da88c74, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ea0dc3e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001030100000, %r1, %r9
	setx	0x26f10d276da88c74, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080bfee1364, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r9
	setx	0x26f10d276da88c74, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f1c4329f7a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e569855f4e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000daf57d28f0, %r1, %r12
	ldub	[%r12], %r11
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
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x00000080a8dbc1d7, %r1, %r9
	setx	0x5318b521182b4661, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e80711a, %r1, %r9
	setx	0xd2a8a1cfeed62144, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb82f12, %r1, %r9
	setx	0x863875de32b47057, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x863875de32b47057, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c2aa3fd173, %r1, %r9
	setx	0x27d4543bcb180545, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd62ce2fd2, %r1, %r9
	setx	0x8a9f97fb49bed5da, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0fdf2da28, %r1, %r9
	setx	0x20190709b1c1d57d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x20190709b1c1d57d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f19df04608, %r1, %r9
	setx	0x27d7e8ca502dc8f3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x27d7e8ca502dc8f3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ec88b80, %r1, %r9
	setx	0x0c477374c8241425, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb0a6b0, %r1, %r9
	setx	0x08ddc815db220500, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c4a50d4674, %r1, %r9
	setx	0x3cd56cc2aa9bd69f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x3cd56cc2aa9bd69f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9c66f7cb0, %r1, %r9
	setx	0xe50fc5101fa3a20d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eeb2eaddc0, %r1, %r9
	setx	0x291857fe81d931f5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f214ce331c, %r1, %r9
	setx	0xe83298601ea8cea5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca3b1d5091, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fd20d0c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ed5f254, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r9
	setx	0xe83298601ea8cea5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080e003d861, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f5a941f640, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eaa83ff7be, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d8447541c4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c067c25a78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f4bfc30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb7173c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc85c4602c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e984cb1f40, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000df504d7ec4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f796960, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ecabc38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f826167a48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e086c37e08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da3fe03dc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ce8bc39db8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ee87522, %r1, %r9
	setx	0xf4cbb96790ce5e42, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xf4cbb96790ce5e42, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f53993e, %r1, %r9
	setx	0x2dca92aeb590e054, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cf68d09fb8, %r1, %r9
	setx	0xdafe9b621369a8b3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd4bcdcc6c, %r1, %r9
	setx	0x19b2258c3b8164ac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x19b2258c3b8164ac, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec619a0ccc, %r1, %r9
	setx	0x007a1d2dfa8a4c33, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f73b723f86, %r1, %r9
	setx	0x3f81a71336f32e5a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e182730, %r1, %r9
	setx	0xb3adbcd9229a8010, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xb3adbcd9229a8010, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc1b410, %r1, %r9
	setx	0xeb7854851ca4f4f9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c0cce74c24, %r1, %r9
	setx	0xe38374a75497833c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5f701d8dc, %r1, %r9
	setx	0xafde40cca57d234e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6fa3ea378, %r1, %r9
	setx	0xc653fd08e39e9c37, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2ef5b748c, %r1, %r9
	setx	0x25226481d6915cf5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e4244f8, %r1, %r9
	setx	0xf4a8883529a57f53, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f568738, %r1, %r9
	setx	0xf8846d58c6fb5cb0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca7f0dfed0, %r1, %r9
	setx	0x1e63ddf4378462ad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d419eefdf8, %r1, %r9
	setx	0x7f1e0c461cf8fe0d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e080995060, %r1, %r9
	setx	0xdd2f2ede1387810b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f5babf0c50, %r1, %r9
	setx	0x093a2bcc3bb4f023, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ecc0563d38, %r1, %r12
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
	setx	0x0000001070100000, %r1, %r9
	setx	0x093a2bcc3bb4f023, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800eb7e6a8, %r1, %r9
	setx	0xacfa2168a2a72990, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f252b28, %r1, %r9
	setx	0x058dc23142947f3e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x058dc23142947f3e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c9b9d41480, %r1, %r9
	setx	0x4d2713467b3f8015, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df3085b258, %r1, %r9
	setx	0x5faefe5b9939e31b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec2e9d90c8, %r1, %r9
	setx	0xf8f64b6d035c3dd2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0xf8f64b6d035c3dd2, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f26c2d8c70, %r1, %r9
	setx	0x8759d12562cf78e5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe4d564f00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e20940f3f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d2e814f348, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c1f65319c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000001010100000, %r1, %r9
	setx	0x8759d12562cf78e5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080121e719c, %r1, %r9
	setx	0x06d04032ae879d4f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6dbcce, %r1, %r9
	setx	0xd432a9f9cfd48cdc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3afb60, %r1, %r9
	setx	0x984a16672b8e900e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x984a16672b8e900e, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ce52fb2ec5, %r1, %r9
	setx	0xa65fce4c2cbf37bb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9267f2e94, %r1, %r9
	setx	0xa70c550e4a33e8d7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea8aa7025e, %r1, %r9
	setx	0x755bddabcc74e8a1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x755bddabcc74e8a1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6832c2b8c, %r1, %r9
	setx	0xdf289a9a0b00d705, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xdf289a9a0b00d705, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800e3f15c0, %r1, %r9
	setx	0x85e9b4a7b1c548cc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f7cb960, %r1, %r9
	setx	0x9ba507ec3bd14f03, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c75402743c, %r1, %r9
	setx	0x2eac80b8a18c0ad1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d1c7cd2964, %r1, %r9
	setx	0x4d14fe2d9ac928fc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e64608d9b0, %r1, %r9
	setx	0x460959521d3727fd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0x460959521d3727fd, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f987d2713c, %r1, %r9
	setx	0x3468f61c130ea84b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eeb1508, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080a3ca0a9f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f7869d4548, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001070100000, %r1, %r9
	setx	0x3468f61c130ea84b, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d4ba19be40, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c032fe34e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fd2e710, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ede5250, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f669375eec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e2518cee60, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef03db00f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d57afc5cb8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c129ecf930, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef0984a, %r1, %r9
	setx	0x255df17056ec2d0e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0fa2ba, %r1, %r9
	setx	0x0dab2c4a035bc52f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0314afb8c, %r1, %r9
	setx	0x673fcdbcac2b0368, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x673fcdbcac2b0368, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d43975e882, %r1, %r9
	setx	0x5c76f1f069d6280a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010f0100000, %r1, %r9
	setx	0x5c76f1f069d6280a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000efcfc76de2, %r1, %r9
	setx	0xd85e02d3d6ac0fca, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xd85e02d3d6ac0fca, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000fe8aedb334, %r1, %r9
	setx	0x6184d608a4d8bba2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e652c20, %r1, %r9
	setx	0x88ef929b67986ad1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8590d8, %r1, %r9
	setx	0x06f1e059d0377a38, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x06f1e059d0377a38, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c8bb289810, %r1, %r9
	setx	0x697156c4872083e2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbab42afa0, %r1, %r9
	setx	0x2d5d446b0138ca43, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea8effb310, %r1, %r9
	setx	0x2d098882211525ca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x2d098882211525ca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fbbfadec48, %r1, %r9
	setx	0x38d04d54bd13588c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ffc043a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6296e4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e270754, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f7107f8b40, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e7f811c0cc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d54045e9d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c289c8f068, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f64126c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d4fbe60590, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ce6dff9868, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f324348, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080b786b8cb, %r1, %r9
	setx	0xc9ff21375b8f8e24, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6c30ea, %r1, %r9
	setx	0xbaf799571560a5f9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0xbaf799571560a5f9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7604ee, %r1, %r9
	setx	0x7cb7576192dda5df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x7cb7576192dda5df, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c76a699c05, %r1, %r9
	setx	0x272d1da38d5baed4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x272d1da38d5baed4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dccc0b66a6, %r1, %r9
	setx	0x1aad07a50697aeb8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000edc82c43c3, %r1, %r9
	setx	0xb50d11c5393c5dee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4bf25d91d, %r1, %r9
	setx	0xf0483de76630dc2b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb4740c, %r1, %r9
	setx	0x190b7b5d6d48cb63, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fcf0de4, %r1, %r9
	setx	0x552e803a87592f69, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce2cc8b58c, %r1, %r9
	setx	0x1e34c76e73b1d9a3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d67c93c198, %r1, %r9
	setx	0x582dd8417595b44e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee1e2c1218, %r1, %r9
	setx	0x518446b58dc0aebe, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fd4167b2e0, %r1, %r9
	setx	0xc43805275027e003, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xc43805275027e003, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000803daff74b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fbf8140acc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e204cc9738, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ce88656590, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f260688, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e16eb08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f7035cdad0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e8ce504a38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000db37ba04c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000807b316913, %r1, %r9
	setx	0xbb3a37fdc05b8c2c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e03f0e0, %r1, %r9
	setx	0x3772d37bb678673e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f003449, %r1, %r9
	setx	0xa6f8254422e9a196, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xa6f8254422e9a196, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cdc7596447, %r1, %r9
	setx	0x39f197fede029b91, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x39f197fede029b91, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d51499396c, %r1, %r9
	setx	0x388b50ebcd456ce0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea4623978b, %r1, %r9
	setx	0x361447248e210642, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000feb3de2ba9, %r1, %r9
	setx	0xa73160e5e3871de7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec582e0, %r1, %r9
	setx	0x6125173c1eba8de1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2e64a4, %r1, %r9
	setx	0x5873da0f3118404b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x5873da0f3118404b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000caab303b98, %r1, %r9
	setx	0xcb486d774eb9a09b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ddcf8e0ac4, %r1, %r9
	setx	0x38087ad3bd4ae394, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3f6da2b88, %r1, %r9
	setx	0x6f76941e010d2cb8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0bbc1e2b4, %r1, %r9
	setx	0xed47bfee0f119c70, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e965dd8, %r1, %r9
	setx	0xc38cfe5411a93a4c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xc38cfe5411a93a4c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f88cfd8, %r1, %r9
	setx	0x3520703f8eab73af, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4316627e0, %r1, %r9
	setx	0x2ab34d2d900ca711, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc908ee3e8, %r1, %r9
	setx	0x2b59dec72d4e5a69, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x2b59dec72d4e5a69, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea36619e50, %r1, %r9
	setx	0x55f000a1b9e98eae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0x55f000a1b9e98eae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f782a69800, %r1, %r9
	setx	0x8f23dc782765fff0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0x8f23dc782765fff0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x0000001080100000, %r1, %r9
	setx	0x8f23dc782765fff0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080caab6bf2, %r1, %r9
	setx	0x235e25d20ece4d30, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efb46c6, %r1, %r9
	setx	0x6aeb04a83e9464c8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2f6ccc, %r1, %r9
	setx	0x9a204a9a6ad08e64, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1a9b1a712, %r1, %r9
	setx	0x0bbc4e9cfc002886, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dec6c718ab, %r1, %r9
	setx	0x55f05fade489fa3a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x55f05fade489fa3a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e6d361ab74, %r1, %r9
	setx	0x94115ede549322a1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x94115ede549322a1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe95b4f6c7, %r1, %r9
	setx	0xfa48d382ebe54df8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed597a2, %r1, %r9
	setx	0x007d267acb15afe0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fa72aac, %r1, %r9
	setx	0x6b86f4123ae5b574, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c62a578370, %r1, %r9
	setx	0x259d2d85a709f6e3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d22ec2eee2, %r1, %r9
	setx	0x3efcc82541d817a1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0x3efcc82541d817a1, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e9f5e098ca, %r1, %r9
	setx	0x353791b79a846e7f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f3853b72fe, %r1, %r9
	setx	0xcdbc48d6d61ee6ac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e8aad68, %r1, %r9
	setx	0xf0b7c84410bcd12f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9cf390, %r1, %r9
	setx	0xdf6db2a1a33e693f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c006aac418, %r1, %r9
	setx	0x06cb8ccdf2b7c574, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d94a5b8ea8, %r1, %r9
	setx	0xc398716f16aed742, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb05ae8d38, %r1, %r9
	setx	0x573415688f8a7e47, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcbffeb7f0, %r1, %r9
	setx	0x572d4a792a395635, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x572d4a792a395635, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e21eba7c1e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1d86b7ca4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c213646dba, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ffc043a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6296e4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f989bf3aea, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e05464416a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fc1b410, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e182730, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f214ce331c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eeb2eaddc0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d9c66f7cb0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c4a50d4674, %r1, %r12
	lduw	[%r12], %r11
	setx	0x0000008087ebd98b, %r1, %r9
	setx	0x74b6aa112ee3e7b2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1d7bbd, %r1, %r9
	setx	0x7d5718e8bc9fa4ed, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6eb41c, %r1, %r9
	setx	0x6b958f17b073c66f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c139ee0072, %r1, %r9
	setx	0x29a3108ded8f915a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da33a2664c, %r1, %r9
	setx	0xa9e757e7dbf1db29, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2aa75806b, %r1, %r9
	setx	0x31030ee3beeeced5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f7d53b3e14, %r1, %r9
	setx	0x073a620e14d911ff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2ed0ec, %r1, %r9
	setx	0x58073e730182bbfb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f4b0d34, %r1, %r9
	setx	0xda9d0563ff20c3a8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cdae038520, %r1, %r9
	setx	0xe6bb3af9f2b97d43, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d278fa662a, %r1, %r9
	setx	0x1dbbb1b33fede34f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x1dbbb1b33fede34f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e54d3f233a, %r1, %r9
	setx	0xa61f246b3b7e4298, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000facd9df80a, %r1, %r9
	setx	0x04df398291adfe69, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3d4a5c, %r1, %r9
	setx	0xac15525002b6caec, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb879b0, %r1, %r9
	setx	0x2d652e2ccb5ee7d7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c112ad5388, %r1, %r9
	setx	0xb8831258abbf9403, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0xb8831258abbf9403, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0e8bf3a30, %r1, %r9
	setx	0x2b170cc6ab90b26a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001070100000, %r1, %r9
	setx	0x2b170cc6ab90b26a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e487e47204, %r1, %r9
	setx	0x73604c20dba730c6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fb0d1feef8, %r1, %r9
	setx	0xf4a7f72208f1c873, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e833d5415e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000daaaab7b2e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c33f498f84, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f58f929, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r9
	setx	0xf4a7f72208f1c873, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000008046caa762, %r1, %r9
	setx	0x0670482a8e0c5da9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x0670482a8e0c5da9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e76f817, %r1, %r9
	setx	0x8cad16e9513d6f44, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa1b8b4, %r1, %r9
	setx	0x32d7d61b8eadd4e1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3030d4ecb, %r1, %r9
	setx	0x84f7e1aa6580d3c1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5579c9bfc, %r1, %r9
	setx	0x26b9622fbae9a0b1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0fb062c84, %r1, %r9
	setx	0x51a66066664002ae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fd819caefc, %r1, %r9
	setx	0x31c839f1d8c95b48, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c86572f708, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x0000001090100000, %r1, %r9
	setx	0x31c839f1d8c95b48, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e6417e0, %r1, %r9
	setx	0x8790b5c47c812c26, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f60c91c, %r1, %r9
	setx	0x1e5dd0a9df7cebbd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c89c17d356, %r1, %r9
	setx	0xa5b3818ac6d1df31, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8399883b4, %r1, %r9
	setx	0x262133e596bbb379, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed1b9b3560, %r1, %r9
	setx	0x760a656fc7c3d956, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc44ac0d38, %r1, %r9
	setx	0x555c0d3aa186fbf7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eea66e8, %r1, %r9
	setx	0xdf6aee7b5d285d88, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f333358, %r1, %r9
	setx	0x1cf49ebdae269e86, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c557499c30, %r1, %r9
	setx	0x367ff997fae3d2a7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1d807a3c8, %r1, %r9
	setx	0x7c0fabdf2ec99d7a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed7ea93e70, %r1, %r9
	setx	0xba4e96cca7a65d6e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f759edef38, %r1, %r9
	setx	0x7d9ae5b8eb029949, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce52fb2ec5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f3afb60, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e6dbcce, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000001080100000, %r1, %r9
	setx	0x7d9ae5b8eb029949, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f74fcb0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e6db0b4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f7714a3dc0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e4da9fb00c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d35a363cb4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f567890, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e09af70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fd8484f6f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e7379b4cc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da5f2be2c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c97b807518, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x000000800e676800, %r1, %r9
	setx	0x2870c7a7f7085b5e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fa7fbc4, %r1, %r9
	setx	0xd58030e1b044936b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c5384779be, %r1, %r9
	setx	0x23a8220851e43c14, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x23a8220851e43c14, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d19dc717e2, %r1, %r9
	setx	0x9589e9bfe832079e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7a63ea5e0, %r1, %r9
	setx	0xa48b6c7352e2f986, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f01415b7a8, %r1, %r9
	setx	0x0edbb017e8502d8a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x0edbb017e8502d8a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e2dba90, %r1, %r9
	setx	0xf73e1d934a76bc09, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fcaabb0, %r1, %r9
	setx	0x0e55713089b53ffc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca5252c9a8, %r1, %r9
	setx	0x2f29ac9cd83c2199, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d178914258, %r1, %r9
	setx	0xd1aa3d40e39180df, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef670042e0, %r1, %r9
	setx	0x5ea87ece5873cfe2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f5cc53ba78, %r1, %r9
	setx	0x3a1b3ae656108428, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c33f498f84, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r9
	setx	0x3a1b3ae656108428, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f58f929, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eebc396, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ea2737c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f377a0f4d2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e4244f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f76e519818, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e64d2b9260, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d09d9bb918, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c021bed4c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fd83040, %r1, %r12
	ldx	[%r12], %r11
	setx	0x00000080bcce8248, %r1, %r9
	setx	0xc6c27ff74f1f6e7d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xc6c27ff74f1f6e7d, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800ea44708, %r1, %r9
	setx	0x4f311d88c7ad2bc7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001050100000, %r1, %r9
	setx	0x4f311d88c7ad2bc7, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f26deed, %r1, %r9
	setx	0x487e2715bfa7d56b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x487e2715bfa7d56b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf42ad2299, %r1, %r9
	setx	0xd3ebaf521d847913, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de7b413819, %r1, %r9
	setx	0xa44b32dd8493cc93, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec1e21887f, %r1, %r9
	setx	0x94d78d6e8064e43a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe65be88c3, %r1, %r9
	setx	0xea50f72f74ce38a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xea50f72f74ce38a0, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f436010, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e04b5a2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f29bc75b7e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000da3fe03dc8, %r1, %r12
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
	setx	0x000000eb7b9c1f60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d9b11c216e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c715114b0a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f86fb58, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e63ac94, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f43133016e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f91bb58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eabbab0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eef472c, %r1, %r9
	setx	0xc829a495749026f9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd2c44a, %r1, %r9
	setx	0x43a26cd605889bcf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c6680b4dfc, %r1, %r9
	setx	0xc85669b9ac6dc696, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db22ea4f0c, %r1, %r9
	setx	0x93d3e16ae9f20185, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e722bbc58c, %r1, %r9
	setx	0xdc5b1ba2d05f3c4e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f78128eb62, %r1, %r9
	setx	0x56b03fdcb833dfa1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e269d28, %r1, %r9
	setx	0x2caee56b80c5ae27, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f687cf8, %r1, %r9
	setx	0x9a7883c60c74d4cd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c07b1820b0, %r1, %r9
	setx	0xbf60a97089c173c3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d87a0c30a8, %r1, %r9
	setx	0x827cfcd885652c2d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x827cfcd885652c2d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e53ee875f8, %r1, %r9
	setx	0xc1c275e6e248a0e6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f372f4e808, %r1, %r9
	setx	0x9ab4335cab76aac9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ea73059, %r1, %r12
	ldub	[%r12], %r11
	setx	0x0000008033d9897f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f6b9172d0e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r9
	setx	0x9ab4335cab76aac9, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ce3aa0fa68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fdb7440, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e6451c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000001050100000, %r1, %r9
	setx	0x9ab4335cab76aac9, %r1, %r10
	ldx	[%r9], %r10
	setx	0x00000080f8d09089, %r1, %r9
	setx	0x1c13d59c8995ab05, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efe558f, %r1, %r9
	setx	0x76dc3b99becb1524, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f982d08, %r1, %r9
	setx	0x1cee0ce24fce97ba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c135d21b77, %r1, %r9
	setx	0x58df8096a86a8db2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dac7f98a44, %r1, %r9
	setx	0xa232c9640cb6b97a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec4324b6ed, %r1, %r9
	setx	0xf62989e50a25ce2c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f216ffd514, %r1, %r9
	setx	0xe760774f189d5247, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xe760774f189d5247, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e7a2a44, %r1, %r9
	setx	0x97005c4fd3973815, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x97005c4fd3973815, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f8c7cc2, %r1, %r9
	setx	0xbde96295654c0f85, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xbde96295654c0f85, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000ce78945c5a, %r1, %r9
	setx	0xfeda1af2ca91fa1c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xfeda1af2ca91fa1c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d30e0900e2, %r1, %r9
	setx	0xab3ffff1e4267f81, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed147d73a0, %r1, %r9
	setx	0x9f3ff312d40615d3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x9f3ff312d40615d3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f9f1905130, %r1, %r9
	setx	0x8dbf9bcc1c56911c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea67208, %r1, %r9
	setx	0x8cf283f4dbf2c1c2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f1ae54c, %r1, %r9
	setx	0x5ee57f844e03faf0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd66aa9740, %r1, %r9
	setx	0x5e3b9d3350c3b49b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4fe4a8e68, %r1, %r9
	setx	0x9b5d197977167b4f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e2acdf1500, %r1, %r9
	setx	0xb1a46cdf66346b9c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f598c62180, %r1, %r9
	setx	0x0a33334a63402bb0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x0a33334a63402bb0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ea5c7e8, %r1, %r9
	setx	0xa8fbd73c085dd86f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0xa8fbd73c085dd86f, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f717a78, %r1, %r9
	setx	0x7b9ccef7b820f5c5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c472a67ab0, %r1, %r9
	setx	0xf1b710e11342168a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xf1b710e11342168a, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d4302fd900, %r1, %r9
	setx	0x07f8d28fbbe54411, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e08f2e9920, %r1, %r9
	setx	0x9f016b8250213e00, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x9f016b8250213e00, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000f3c8491710, %r1, %r9
	setx	0x165c434d0ee7475a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x165c434d0ee7475a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0882845a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e1111e7740, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d2a469b880, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c28dc2bd08, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x000000800e5dba10, %r1, %r9
	setx	0xac37ea25599c07e7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f634af8, %r1, %r9
	setx	0x63f369f4e30b00cc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c210f039e0, %r1, %r9
	setx	0x86c87f5c03ed4279, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de5368ae60, %r1, %r9
	setx	0x0520f9bef21299a1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1f7d4d100, %r1, %r9
	setx	0x59c26499a60adc7a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f512abfc78, %r1, %r9
	setx	0x186acae590f769ba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000080a9067286, %r1, %r9
	setx	0xe9135daa0b8c3491, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eba8d86, %r1, %r9
	setx	0x35489a5479a4058d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f238562, %r1, %r9
	setx	0x6984e22d5c680876, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1201df796, %r1, %r9
	setx	0x75bf1405948e7a63, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da95903505, %r1, %r9
	setx	0x24630ee2a31ee975, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e99464ec5c, %r1, %r9
	setx	0xaba035555a6e1604, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6392aa2cd, %r1, %r9
	setx	0x0f0da4c028ea8a07, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001000100000, %r1, %r9
	setx	0x0f0da4c028ea8a07, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e129e0e, %r1, %r9
	setx	0x8a058dfab59c76d3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f2ad3b8, %r1, %r9
	setx	0x0e76b4a2e0e6fd2b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c45a522802, %r1, %r9
	setx	0xe9254fdf7c2a0436, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d0a8ce01a0, %r1, %r9
	setx	0xfca866c4b07442bf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010b0100000, %r1, %r9
	setx	0xfca866c4b07442bf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e5e3e8bf2e, %r1, %r9
	setx	0x28ce74a25823562e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fd03aee3b6, %r1, %r9
	setx	0x0b19ead3a70bdab4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea65528, %r1, %r9
	setx	0x659d76c32a9f2fa7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f549c68, %r1, %r9
	setx	0x3c4c81761da24e09, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5faa70800, %r1, %r9
	setx	0x86f1d2e9f68e45a6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7dbb3b820, %r1, %r9
	setx	0x53d8436a0117e8c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e53bdefe08, %r1, %r9
	setx	0x92db996efbde02b8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f9ef93be10, %r1, %r9
	setx	0xa75e9a8a42f468ba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xa75e9a8a42f468ba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d683c0da80, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c4eb8fe02c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f7e3b58, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r9
	setx	0xa75e9a8a42f468ba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e66a883, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000080f80c5f27, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f9457955b3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ec4e47336a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ef98efe, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f81cf06b76, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e80e5c6708, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d8cd838c42, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c5bf0baaf2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f3b1824, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ebcd13a580, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d1ac8e4ac0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x0000001000100000, %r1, %r9
	setx	0xa75e9a8a42f468ba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000808c864ace, %r1, %r9
	setx	0x1144d36f534bb2af, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5af994, %r1, %r9
	setx	0x0755367a7fb1f60a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f877525, %r1, %r9
	setx	0x80767b0b115716aa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x80767b0b115716aa, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c6b5f6309a, %r1, %r9
	setx	0x8c624f2ff461a1cc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001080100000, %r1, %r9
	setx	0x8c624f2ff461a1cc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7492afe11, %r1, %r9
	setx	0xe020fb4dce382814, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xe020fb4dce382814, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e2f1c2b27b, %r1, %r9
	setx	0x42a09016748efa95, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x42a09016748efa95, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6768f4ea9, %r1, %r9
	setx	0xdf557261a8ee42aa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e536a30, %r1, %r9
	setx	0x8f1a963089cc919d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x8f1a963089cc919d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f398b4c, %r1, %r9
	setx	0xf29ef0d6b71f4a03, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cebbf0e818, %r1, %r9
	setx	0xfe1f8f8c3c9b4945, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d9fcc1a998, %r1, %r9
	setx	0xe623e0c570ccf41e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ebf6c943f4, %r1, %r9
	setx	0xf05a5ccd9e4abcc9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f64406bf34, %r1, %r9
	setx	0x26f58f7cfc45d809, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe78afc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e83de36, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fdcbb126c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000edd70a959a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d6d55e16f6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1c7cd2964, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c75402743c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f7cb960, %r1, %r12
	lduw	[%r12], %r11
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
	setx	0x00000010b0100000, %r1, %r9
	setx	0x26f58f7cfc45d809, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000805ac9cbd9, %r1, %r9
	setx	0xbcff36a0a876f31f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0ab059, %r1, %r9
	setx	0x058817318552c4e9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f0839b4, %r1, %r9
	setx	0x73e1ebd2698882fc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0db7e1e96, %r1, %r9
	setx	0xcd0ad6d224071195, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0xcd0ad6d224071195, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d16161ee4b, %r1, %r9
	setx	0xb9d315b996c30625, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8f5508baf, %r1, %r9
	setx	0x94a9f6392adae1ad, %r1, %r10
	stb	%r10, [%r9]
	setx	0x00000010d0100000, %r1, %r9
	setx	0x94a9f6392adae1ad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fb49adaff3, %r1, %r9
	setx	0xf1f8d1c7f13d85ed, %r1, %r10
	stb	%r10, [%r9]
	setx	0x0000001090100000, %r1, %r9
	setx	0xf1f8d1c7f13d85ed, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e588f78, %r1, %r9
	setx	0xd3ee35dd9e541853, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f563e60, %r1, %r9
	setx	0x4cd94a49af7e8c58, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x4cd94a49af7e8c58, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4dcfa4368, %r1, %r9
	setx	0x814e392af5f0c5bf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0x814e392af5f0c5bf, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000d8381b6768, %r1, %r9
	setx	0x58ebc4737b1ea817, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4f87e7490, %r1, %r9
	setx	0xd2d0c0d5632c05ed, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f718245b30, %r1, %r9
	setx	0x04cbd8fd13b4bb16, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e033f37, %r1, %r12
	ldub	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r9
	setx	0x04cbd8fd13b4bb16, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000804409c427, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fb2c2958a7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e6156b8a90, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d5592cd726, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c1bd65136e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e46f888, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f5f4e508cc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ec0ffb083c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000de0ab292d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c6ffc2f9b4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f245674, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cad32c53b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f6d9d40, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x00000010e0100000, %r1, %r9
	setx	0x04cbd8fd13b4bb16, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000802f553920, %r1, %r9
	setx	0x53790a4b8c25943c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb361dc, %r1, %r9
	setx	0xa3a8d4775ef7a54e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f00573e, %r1, %r9
	setx	0xbdc1ab3d4c172203, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1d86c81f7, %r1, %r9
	setx	0x03184d6edff17135, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de3d1c468b, %r1, %r9
	setx	0x249218daf23997ff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6f7eea94d, %r1, %r9
	setx	0x252de17313d22d56, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f911c4b2f7, %r1, %r9
	setx	0x5dc3d0c319952d07, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efb5ab4, %r1, %r9
	setx	0x9b6dcdc818387cac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f057eba, %r1, %r9
	setx	0xea3b4956392152cb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001040100000, %r1, %r9
	setx	0xea3b4956392152cb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9345c2402, %r1, %r9
	setx	0x39f5b45c0b1d4040, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001060100000, %r1, %r9
	setx	0x39f5b45c0b1d4040, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2d617312e, %r1, %r9
	setx	0x93f935c5e55a409e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e901aa60e2, %r1, %r9
	setx	0xd4618ab2a59e1883, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f26cf48ea2, %r1, %r9
	setx	0xae9073f5067b9e92, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0b7188, %r1, %r9
	setx	0x642af9ead9dc776a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2219d8, %r1, %r9
	setx	0xbd11ad62b8552212, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb6a714a94, %r1, %r9
	setx	0xb6efcc6951996d78, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dd3ae30118, %r1, %r9
	setx	0xd34f59891e91525f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e0080fdefc, %r1, %r9
	setx	0x132276ad62cc3c52, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f5dfb48b90, %r1, %r9
	setx	0x175f3ca9dbb798bf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e62a8c0, %r1, %r9
	setx	0x907634502cc804d3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff68c50, %r1, %r9
	setx	0x41407a115c7e557a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc50128a20, %r1, %r9
	setx	0x3db3e9ac5ab3abb2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d93f32ebb0, %r1, %r9
	setx	0xf90dd97a7bd76f43, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e096e46700, %r1, %r9
	setx	0x937914679173dc4d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f29413f8b8, %r1, %r9
	setx	0x3128d35c28694d81, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7a6e82298, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd2c32f8cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e1f7d4d100, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000de5368ae60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c210f039e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f634af8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5dba10, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x000000f000000040, %r1, %r12
	ldda	[%r12]ASI_BLK_P, %f0
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	setx	0x000000800e6c8bdc, %r1, %r9
	setx	0x0534527a95eec515, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f60cea4, %r1, %r9
	setx	0x3fb99a601fd372ab, %r1, %r10
	sth	%r10, [%r9]
	setx	0x00000010a0100000, %r1, %r9
	setx	0x3fb99a601fd372ab, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000cde9b64ab2, %r1, %r9
	setx	0x4ea3b2590e4e4d15, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4dfb9bd94, %r1, %r9
	setx	0x63706f94d00401ea, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eff6def6d0, %r1, %r9
	setx	0xcc490f2a278b2784, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fcbe3f1624, %r1, %r9
	setx	0xd71dbbda80225627, %r1, %r10
	sth	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0xd71dbbda80225627, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e99b0d8, %r1, %r9
	setx	0x58c1ed06f72890e3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0b67b8, %r1, %r9
	setx	0xc8ca248731f2f64d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c8c85a955c, %r1, %r9
	setx	0xc748c58f58cbca33, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d689e42044, %r1, %r9
	setx	0x4c671dd25eb9f0c3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001010100000, %r1, %r9
	setx	0x4c671dd25eb9f0c3, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000e7fd0b8ca8, %r1, %r9
	setx	0xbe35a8393181ca82, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f92edead58, %r1, %r9
	setx	0x79afdb9e78e6ff8c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c5283af068, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f91bb58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eabbab0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f884fcaf28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e6aa2f8f18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d4cbbb3170, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c12b430420, %r1, %r12
	ldx	[%r12], %r11
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
	setx	0x79afdb9e78e6ff8c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800edfd414, %r1, %r9
	setx	0x2abd76312f7b05f4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x00000010e0100000, %r1, %r9
	setx	0x2abd76312f7b05f4, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000800f595634, %r1, %r9
	setx	0xe6d3f77216b65560, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c70bb5dd74, %r1, %r9
	setx	0x82ba432c0e49eb8c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x0000001020100000, %r1, %r9
	setx	0x82ba432c0e49eb8c, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000dd9bf37a38, %r1, %r9
	setx	0x50b2282b9870bb11, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5bbacc690, %r1, %r9
	setx	0x80c2e619cb7aeff6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fce61acabc, %r1, %r9
	setx	0xc7e721d5b7434439, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e8ef248, %r1, %r9
	setx	0x249524b42ffe2b02, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8c6f68, %r1, %r9
	setx	0xdf0fb3936ddec654, %r1, %r10
	stx	%r10, [%r9]
	setx	0x0000001030100000, %r1, %r9
	setx	0xdf0fb3936ddec654, %r1, %r10
	ldx	[%r9], %r10
	setx	0x000000c68a7d2d28, %r1, %r9
	setx	0xcdb3faeb7c5a7585, %r1, %r10
	stx	%r10, [%r9]
	setx	0x00000010c0100000, %r1, %r9
	setx	0xcdb3faeb7c5a7585, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8820fecb8, %r1, %r9
	setx	0x71738ddf78775a3a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4dd68dd58, %r1, %r9
	setx	0xa9d4367f2cae724a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8b98ed228, %r1, %r9
	setx	0x1f0875aff0a683fc, %r1, %r10
	stx	%r10, [%r9]


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
	.xword	0x0d0470b35844a5e7
	.xword	0x9cf060bb87e74cd0
	.xword	0xdde8d446dcd37191
	.xword	0xf1faf14b7ebf8636
	.xword	0xb5274ff06cf9d4b6
	.xword	0x12ecebbdec752824
	.xword	0x9d2a17a58f16fdb6
	.xword	0x5772826bc694faab
	.xword	0x9bcbaea662f76c38
	.xword	0xda8a448314f30b0c
	.xword	0x92cf2adc502dda47
	.xword	0x4c6dc816691101d6
	.xword	0xa18fe7e164e3a1d4
	.xword	0x4bfe79ae223aef40
	.xword	0x490535a73f24952a
	.xword	0xcf7135b6ba65a2db
	.xword	0x90018326f6a90ac9
	.xword	0x55988f6e074b68a3
	.xword	0xd2a93177d9ff0a46
	.xword	0xd99987ac4382dc5b
	.xword	0x936d50fa04b42803
	.xword	0xda3ef1f5f2764f0d
	.xword	0x3b3bdd7782e1a5c8
	.xword	0xac26e0c3e2a4c9eb
	.xword	0x31627ec85b177c33
	.xword	0x39cf552565d4933f
	.xword	0x62fc1d9e06e665a2
	.xword	0xab14cd9eaed261d4
	.xword	0xd2a81130322d2c30
	.xword	0x973bd7ef55f8cb5e
	.xword	0x26751ee891cd6bd1
	.xword	0x621026fd377f604f
	.xword	0xa0b2704bf4b80387
	.xword	0xbf138c6e6191b3ee
	.xword	0xcb2a04b73cf28143
	.xword	0x95de83d07627eeef
	.xword	0x9295b37e6ca2f230
	.xword	0x2b99ba1e6005dc86
	.xword	0x89acee3e3da0d487
	.xword	0x48bd7bb943cadf1f
	.xword	0xb57f0d9bb979b905
	.xword	0xd2a044f29ddd451f
	.xword	0x8eef48e758e7ce50
	.xword	0xb967b4fc91ee0dea
	.xword	0xfcd0d98fe60aa365
	.xword	0xa5361bb44593ec22
	.xword	0xb6e370159e781370
	.xword	0x9ae12e469f58f646
	.xword	0x289bcaa590ac31d3
	.xword	0xba190014488e16b1
	.xword	0x2f90c1b58c3206ac
	.xword	0x7438a9128a044549
	.xword	0xe2d412364fbbc435
	.xword	0x9cba12699d709742
	.xword	0x252dbbd30b7289f1
	.xword	0x5644fbfe5cbbbe20
	.xword	0x6fa6c834a410379c
	.xword	0xb180ead8e365595b
	.xword	0x674f67ebb3519ca2
	.xword	0x526ba0a7e42df931
	.xword	0x08161c0f46c0b2cd
	.xword	0x9a4ec09396c6c7d0
	.xword	0xbdf36119bec9f6ff
	.xword	0x53b42f39f5c93895



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
	.xword	0xffa3061bc17e4702
	.xword	0x6fe28499906e8949
	.xword	0x4b8d510c101af1d7
	.xword	0xfff6b748ced6ee7c
	.xword	0x0d6f257516a431e0
	.xword	0x36d48825fa6cf423
	.xword	0x4b04f936f8b7e2dd
	.xword	0x120861ce7c457838
	.xword	0xfc9ddcf32c0dbfc0
	.xword	0x0bc1aa083ff6e1a3
	.xword	0x5ff7446e01337462
	.xword	0x87dd7d7aab2a336f
	.xword	0x89bbd5782ca19d6f
	.xword	0x4e6e52a04adb2eac
	.xword	0x10d4c356c77e6e35
	.xword	0xd5f430f750ff0b7d
	.xword	0x785c594d20c3812f
	.xword	0x033643bed41194b7
	.xword	0x538db3775e8eaf3c
	.xword	0xcb3a79d9b7f8e81c
	.xword	0x50991fdc847cad94
	.xword	0x3a90aa4c198b3477
	.xword	0x9c2a968887e7c02a
	.xword	0x2b26f1d73ad528e6
	.xword	0xcea46dd476f7bcfc
	.xword	0x6773f1c152442d13
	.xword	0x3a33243ec3942a30
	.xword	0x74eeb011bee3c041
	.xword	0xb037e3632ccbbfa2
	.xword	0x2064e5708f2905b9
	.xword	0xe9b4ead8b45c7b31
	.xword	0x918556de1bf71066
	.xword	0xc9fdeb373ab068e7
	.xword	0xab1344be80812125
	.xword	0x61d313311e8e2a25
	.xword	0xebffa2c9bbfa2f7b
	.xword	0xd39daa58967c105c
	.xword	0xa3163a990e938ff7
	.xword	0xbf3c53e2ff9c46ed
	.xword	0x9882286265ce8e0b
	.xword	0xf7ccf3e73f7210c9
	.xword	0x84ae594f020095b3
	.xword	0x5e63068df858a58f
	.xword	0x9e4990fc81823bd1
	.xword	0x9b48f9164fd67105
	.xword	0x17d1b5185a251ae8
	.xword	0xb73355195f1a7864
	.xword	0xac12d21a1e11b05e
	.xword	0x54ad37321e3a2663
	.xword	0xfb689bbe877cc5cd
	.xword	0xbfc1a2bd301d52ff
	.xword	0xf1bc0638ad9eb45c
	.xword	0xbaa9380076f2ac9e
	.xword	0xa0381d5600f048b2
	.xword	0x14983760cac706bc
	.xword	0xc325c34873393dca
	.xword	0xe5d3625d0676f0dd
	.xword	0x1bb5d68896f9476f
	.xword	0x3304a849225f78c0
	.xword	0x3ebde1c7b42b6fab
	.xword	0x535d42a24ec53f28
	.xword	0x3114df13134e6007
	.xword	0x993a7ab249b59c07
	.xword	0xa9896257e1afdeca



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
	.xword	0xa9c525869a3b6d36
	.xword	0x6f09f2bc9f9f5396
	.xword	0xa8cfbe4143f05749
	.xword	0x8d7e00474de6bce5
	.xword	0xd7abca0cd116ca20
	.xword	0x13bf19e65add2731
	.xword	0x018fd12762f817d2
	.xword	0xf22fbac741ca6a33
	.xword	0x0d100ce3c5d76f8b
	.xword	0x19dd8966a425f9ae
	.xword	0xaa4eac0332a2aad0
	.xword	0xf589510dfe3a7437
	.xword	0x9653b7d813c2d796
	.xword	0x0e78fcd94d2a826f
	.xword	0x2c4d216d71c834d8
	.xword	0x7eae6fe8677abfbf
	.xword	0xc5619f0dd7d3625c
	.xword	0x29a4d2d3b36f0992
	.xword	0xe29eae111b30ba73
	.xword	0xf5c28805c7521f90
	.xword	0x734b8dfe8a871753
	.xword	0x22be28b76c034fb0
	.xword	0x0099f4de3bcda142
	.xword	0xf8fa3eb97b207e8c
	.xword	0xbcbfd8337a736b07
	.xword	0xb193ee333898d4cf
	.xword	0xfd0cc372f7192e5c
	.xword	0x2f016c783aeba055
	.xword	0x0a4ee264deb4abb6
	.xword	0xbaa1494468866b8d
	.xword	0x66a633c29255f3e3
	.xword	0xaad325a0753ffe78
	.xword	0x88c6b92b3823a729
	.xword	0xd4c6e7958d35b722
	.xword	0x48e7ddb289de4dd3
	.xword	0x049e436144673771
	.xword	0xf1a20f2734f435a4
	.xword	0x0b034ae1f767d297
	.xword	0xd27f94ab3dd4835a
	.xword	0xef9fea0ff46e9d88
	.xword	0x0344410a775fe3e2
	.xword	0x74d7a71dcaf66070
	.xword	0x89f5467bc6f7f973
	.xword	0xda71d560116dc847
	.xword	0x8a41f912e3e85deb
	.xword	0x0bbc2def8bce96f2
	.xword	0x1a53f333f7dec81d
	.xword	0xec2de070557c4fd0
	.xword	0x90950c7db1260b26
	.xword	0x477be8a5a7abf862
	.xword	0xc5e1e26626b073ab
	.xword	0x9712a07cdd7183c5
	.xword	0x5edc077fad22cf4a
	.xword	0x13bf59b50779de4e
	.xword	0x88606e3030d2919c
	.xword	0xc12ff693b703f961
	.xword	0xb9df7eb02b374dbe
	.xword	0xcdb8e3bf2e8b8a46
	.xword	0x1a4976056f300921
	.xword	0x0e6c3e90e0d9a8e9
	.xword	0x0a9a8123b4a0713c
	.xword	0xce9270220dd76073
	.xword	0x7a92f1c2c66eea68
	.xword	0x61595e45f59662f3



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
	.xword	0xd6804d02ea368d0a
	.xword	0xf6390fb350dc8ba8
	.xword	0xf58663094b6667d9
	.xword	0xa7aa211252ceeca4
	.xword	0x890fdc66c043f208
	.xword	0x29e0c3af0cd73f79
	.xword	0xfba3e9291d481085
	.xword	0xe05050a27de3a3df
	.xword	0xe8f57972ace8d3c0
	.xword	0xbdbaa8120ee81749
	.xword	0xbfd4341225f3afe8
	.xword	0x8143baf1f83ee774
	.xword	0x8a6e7c1fd78610ec
	.xword	0x691396d5ded34a2a
	.xword	0x69b621974d776b76
	.xword	0xea6999d846773569
	.xword	0x8e1bdd05892c6308
	.xword	0x7be2513de5caff95
	.xword	0x5bd99ccb6548ca1c
	.xword	0x8f0aa2a2036c0b04
	.xword	0x3c219c00497d5855
	.xword	0xa6f3f13e97e4fd20
	.xword	0x9e2c02753dfc15c7
	.xword	0x5fac266272bc337f
	.xword	0x7b17493694ecc5ed
	.xword	0x3eef9b76b6a1e54b
	.xword	0xddccc1f52ea14faa
	.xword	0x82a95bd10e13342e
	.xword	0x1a21f9c990fe207d
	.xword	0x56c0200ab8074d36
	.xword	0x5287e18ffa3bc7b2
	.xword	0x940f89ab8128df42
	.xword	0xf8f5f582cab087d3
	.xword	0x665febc8af847850
	.xword	0x08e1863e954fbe85
	.xword	0xfbd1a6a0ed7ae13c
	.xword	0x390e4dd6fc500f27
	.xword	0x26f520408dd038e3
	.xword	0xe321ba9bc9fa54db
	.xword	0x58bb8633b62f65b7
	.xword	0x52fb2f46e23760fb
	.xword	0xf2e67659ba44be80
	.xword	0xa8bac58d2e89083d
	.xword	0x15b0a95301a66865
	.xword	0x1aa796bb5c2a1411
	.xword	0x482ee6fb7e0fc544
	.xword	0x367f87ff112dcc54
	.xword	0x86b8da4d2a7a169a
	.xword	0xb951086751635f72
	.xword	0xd6e0060154cd8aa0
	.xword	0x3e6ff2b4dd27d959
	.xword	0x307700725e43a347
	.xword	0x5edae16edd10428c
	.xword	0x0efe6fb9bb1f4042
	.xword	0x4f498c2b10870175
	.xword	0x19a490c5a7710353
	.xword	0x75205d3aa44e69a9
	.xword	0xdfa35be45a94055d
	.xword	0xe6fc7866ca5633ca
	.xword	0xec753617434a9a1a
	.xword	0xcd9be0db32d25eb4
	.xword	0xc8a2cf0cab185336
	.xword	0xa507706a79b940f8
	.xword	0x5693a9274c9116e3



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
	.xword	0xdc215bf48d5055da
	.xword	0xb43049437207dde9
	.xword	0xc7548853bb666895
	.xword	0x090e7122770a04b4
	.xword	0x8c02a8fb94ae681e
	.xword	0x71307c4014ca07c6
	.xword	0x466bff39f6ab0ce9
	.xword	0x58fec0b4c2c585af
	.xword	0x8626aa64b43485c9
	.xword	0xca5c8866545cb103
	.xword	0xb0589d7b73fcf50d
	.xword	0xc08203931a3865ec
	.xword	0x19589daa22a44b50
	.xword	0x294fa8204798727e
	.xword	0xbc4e8b7c732965dd
	.xword	0xdc8555b6e92c1a74
	.xword	0x3bc7ad56fc2809ca
	.xword	0xa35ef03f95f8e1d2
	.xword	0x3abfb82e3f29bf18
	.xword	0xb657ccf52cad18a9
	.xword	0xfbde8b0369b636b5
	.xword	0x0e28e5fad4842ad1
	.xword	0x82e70e180f011432
	.xword	0x5060b3665a6482c1
	.xword	0xcb66ec0b70404e0f
	.xword	0x806568af7206debe
	.xword	0xfd97f976e9045d70
	.xword	0x421efaf5f6b873ed
	.xword	0x777e21a949dd2fc6
	.xword	0x1c567c540956f3ab
	.xword	0x26128ac646ed765e
	.xword	0xe1f298b05915e7ae
	.xword	0xcb51dcf8340e1ccb
	.xword	0xed90a859c4c97d8c
	.xword	0xd6527ba639e74fca
	.xword	0xeae44c44f8ced1fd
	.xword	0x2fe2c773d04fe5bf
	.xword	0x3661430200ab6a6c
	.xword	0xde3064ce2e464ac6
	.xword	0x92db7aaf8e0f99d1
	.xword	0xa676b94ed3adccec
	.xword	0xccb04b573b6883a8
	.xword	0x3c35eb219b17ad5e
	.xword	0xbdfe5f4125dc3f72
	.xword	0x6e58ab69fe116624
	.xword	0x6ba9abcd1b9299f4
	.xword	0x21b9fee4593d8630
	.xword	0x40b5a0d39b3a5b07
	.xword	0x1d37f4bd3b498d29
	.xword	0xbf38cc08e655b15c
	.xword	0xe1791caf7050daa2
	.xword	0x3985d63babd06665
	.xword	0x43ea73569cfafbcc
	.xword	0x06c48f2e5c6b1b5f
	.xword	0x82c023f2752ddd8c
	.xword	0x1b3c95d7a21fed34
	.xword	0xc76f5441cc9864c1
	.xword	0x90bbe11e0664d2cd
	.xword	0x344315279b645f8c
	.xword	0x3c4819c0114d9c92
	.xword	0x9c507116f7af9b99
	.xword	0x5301d5c2ede48f50
	.xword	0x19a58b99400290f2
	.xword	0x5c1eba8ce23512b3



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
	.xword	0x479c1cfbb1f923b5
	.xword	0xc432162b6b47e24e
	.xword	0xef82a8bbd1494111
	.xword	0xc72093c2679ff83f
	.xword	0x3b47647ff5247686
	.xword	0xcd2c060697fdd0f1
	.xword	0x36440ae1221cd40b
	.xword	0xc5e7a39ed7068531
	.xword	0x400129a86f7f2bea
	.xword	0x6a6c7b26912e6034
	.xword	0x0db6720f9473b377
	.xword	0xab743a6b04bfe0fb
	.xword	0x7252732beae11af0
	.xword	0xe3c0d8be449b9f5a
	.xword	0x98adb34293b028ad
	.xword	0xbc997a1fa6a9cf1c
	.xword	0x2620ba89648239c8
	.xword	0x4d90f1ad719bb5b1
	.xword	0xd00958013b80580e
	.xword	0xdb1280dfa381f3b7
	.xword	0x31488f964aa1785e
	.xword	0x78ced9cdeaeb1080
	.xword	0x1bbc7ffb203e8747
	.xword	0x8eb273c9eac04251
	.xword	0xcb5ab97ffe1cc82f
	.xword	0x9123381acda55cec
	.xword	0xb1252111164887ed
	.xword	0xd10dd090dbcd217f
	.xword	0x4613fe24add7eee9
	.xword	0x0342d37411279339
	.xword	0xb37d42f90dd59468
	.xword	0xf776b1fd0dd7efd0
	.xword	0x79a8eda3faebd63b
	.xword	0x651ce63634c4baa5
	.xword	0x30c5c77aa0a4f6f7
	.xword	0x52168f39f85622d0
	.xword	0xe173929ea11912c4
	.xword	0x58aa2d9685a0160e
	.xword	0xc3fee74e4d0ef4aa
	.xword	0xc6e923ca7130da5a
	.xword	0x95f84eaf6da2c78e
	.xword	0x48159b097666f6a5
	.xword	0x54a7beaf37bbc932
	.xword	0x60d064d0270dcfcd
	.xword	0xfb811fd2b8b2c689
	.xword	0xd46eedbc92b45f1f
	.xword	0xadbc720d70690dcf
	.xword	0xe1e36ff4d290ba60
	.xword	0xa58b394bf0ebf2ca
	.xword	0x3336119f983c7cf3
	.xword	0x44493db83da9c588
	.xword	0x66dd7df851f09424
	.xword	0x7e8cfb133b6c6c73
	.xword	0xe4479e0ac253c1bc
	.xword	0xe43fcba7ed07c80c
	.xword	0xd7f9ec70e6e221d4
	.xword	0x92629f62084a25eb
	.xword	0xa4aaa9d22e812f08
	.xword	0x17e279bc2be31742
	.xword	0xc19abc736f651907
	.xword	0xc2b3a8da6d80a8e5
	.xword	0x10b6c138290fee43
	.xword	0x7fec450268cf346a
	.xword	0x76c738838a004088



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
	.xword	0x0e810a7bf67b1261
	.xword	0x77fc7f84e2e77956
	.xword	0x1c5794292df7522f
	.xword	0xb61f6729766622f8
	.xword	0xac4f2200d7efe92a
	.xword	0xd815dbd123ba228c
	.xword	0x030407e5531bb1dd
	.xword	0x7d73f68eefd5021e
	.xword	0x133670b0c8c712ff
	.xword	0xad332ddcab38f3ec
	.xword	0x377f232f504df9c2
	.xword	0xbd09e36bfacde3ad
	.xword	0x5ab58e62b1141848
	.xword	0x943bf2c593cf5700
	.xword	0x65de22a986d0e3f9
	.xword	0x6ec96e5060cfc9d3
	.xword	0x40610d60c72c7e17
	.xword	0x4627ed136a0a4907
	.xword	0x6fdfe743487f0f91
	.xword	0x53cfd77f02ddbac9
	.xword	0xf652bf96e677f7b8
	.xword	0x7b5c48a325c8f71b
	.xword	0xee3b655bdc85fb9c
	.xword	0xe7da22cf55d110f4
	.xword	0xce879eef37dd8786
	.xword	0x107c8801ae04491d
	.xword	0x78bdf18df35e7829
	.xword	0xd14494b31492a092
	.xword	0xa662dd5ce8d6c0e8
	.xword	0x67bb92316060b9a6
	.xword	0x4a569ff96005a1ab
	.xword	0xe34260119d4d058c
	.xword	0x545682ae7394b671
	.xword	0x698b6cebd52eeb67
	.xword	0x4c4db7dbde0df98b
	.xword	0xa81d8fdf7f6e012f
	.xword	0x6fc4e24dc602c8a5
	.xword	0x178abb4a63cf3bac
	.xword	0x5a01549069bcc130
	.xword	0xcd62a0b281021a45
	.xword	0x17548a42a5e409d3
	.xword	0x7befdd0595056cc7
	.xword	0x6aab27a968c0dc0e
	.xword	0x080decddaffc69de
	.xword	0xafad0138cc0eec0c
	.xword	0x4372ec54ecb27748
	.xword	0xf7ed60ace27bc9c6
	.xword	0xbea68136b9bb22ad
	.xword	0xcfef622d88a77625
	.xword	0xe6ec3743972b6bc0
	.xword	0x9276cf1204f0bb8b
	.xword	0xb6aebd53893f9841
	.xword	0x4755f7a56018653c
	.xword	0x2ffa79bb80df11e8
	.xword	0x0494a45bb6d827d6
	.xword	0xe1f94840e0b141fb
	.xword	0xf18864feb04e252f
	.xword	0xc3b49c5a3655ec0b
	.xword	0xfbe45e6912205124
	.xword	0x5cab406dd5362875
	.xword	0x204c1182ef5621db
	.xword	0x6461cbdc22a158bc
	.xword	0x7b43396d58aadec8
	.xword	0x7694ec02da636889



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
	.xword	0x23f6bbc2702cd0d3
	.xword	0xcfa3bcd6126d773f
	.xword	0x3501f3d4dfd1b840
	.xword	0x5918c180acee44d9
	.xword	0x949fbc3b11a82b31
	.xword	0x1a9b33d5b148a925
	.xword	0x2c6efe3acf614e90
	.xword	0xe9974712e5a58a56
	.xword	0xb564b11a6715850c
	.xword	0x18b613d3a57b9a55
	.xword	0x81660d394803c5e0
	.xword	0x25982378d6a3caf1
	.xword	0x807d631d0d97a55f
	.xword	0x1a883fa6708aa282
	.xword	0xaefe75724d8b4470
	.xword	0xdc64a9e821395807
	.xword	0x10e6950ea637afa1
	.xword	0xc4c9dc3d851a489b
	.xword	0x2052e6ecd1f0def7
	.xword	0x906ac25afb4ccc37
	.xword	0x1c2bf5836c04d74d
	.xword	0xc4016e2991ac8e72
	.xword	0xbba7c3872328746e
	.xword	0x799f34afcc0b2144
	.xword	0x74dbcbac212cf8b7
	.xword	0x083c4bb14d2ef202
	.xword	0x684100ea39eb11a5
	.xword	0xff054fee8c85e171
	.xword	0xf2885edab73ad23f
	.xword	0x01a9f44b7e0b19c0
	.xword	0x2c5884ea8ca16dd2
	.xword	0xee8ecd42419bf855
	.xword	0x00753b3c4a35f46f
	.xword	0x9d2644587015f695
	.xword	0xb5ec3f298c1028d6
	.xword	0xb041e7d1db6bb89b
	.xword	0x5913b8bad731b2b8
	.xword	0x0c2e2a8e0f853d79
	.xword	0x317ea48f8bf84c4b
	.xword	0x4d0552841684aed0
	.xword	0x608eda7a85b6f8ef
	.xword	0x66aae60ae233c9a4
	.xword	0x3821c48c53cede46
	.xword	0x1659ccda88f2a019
	.xword	0x7af4330618e1a72c
	.xword	0x634c2f2919f19dcc
	.xword	0x78f241d017b3db1d
	.xword	0x3b9a0bfb6d101065
	.xword	0xd230c81635681744
	.xword	0x602503055c6fe432
	.xword	0xc19f688d12c9da23
	.xword	0x24a9ad78a282c464
	.xword	0x8e48f63f79f40290
	.xword	0xbcf0e791e8312d9c
	.xword	0xb961ad07761e2643
	.xword	0x410b75c67fda38b6
	.xword	0xf7f937e9f55251b3
	.xword	0x18bef14a51e8f994
	.xword	0x985d43544b78b38b
	.xword	0xc4b87f558095bd4d
	.xword	0x0e704d515afc3b14
	.xword	0x6e809f749a08e1a2
	.xword	0x83ca0f95be50fa44
	.xword	0x43e93c870130b26f



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
	.xword	0x757466ec0bb1e72f
	.xword	0xac9b330b4178b59f
	.xword	0x64ba7ddedea412a2
	.xword	0x4553fb5c99f64153
	.xword	0x07e9817176ec66e7
	.xword	0x93e84c141570aa15
	.xword	0x00df3dc8a758160d
	.xword	0x2bd1624b5b4f069a
	.xword	0x3736905afd053e21
	.xword	0x7448c7d0ac0fcf18
	.xword	0x0f93d8f38e2ce577
	.xword	0x71911f314b7679ef
	.xword	0x40704e7749cfe42e
	.xword	0x7c5e54a5b050c708
	.xword	0x793dcddf9801ecbf
	.xword	0x36b88220c494dcac
	.xword	0x2ca504b5e98cc58e
	.xword	0x3362ba83d2cd98d1
	.xword	0x91feff8e133c20e4
	.xword	0x9c2ff0d90e6343bc
	.xword	0x3f5d27b44a9c72c7
	.xword	0x5f5c145292448ec7
	.xword	0xb0a65e03b4e86a8c
	.xword	0x510a8312bfe6cbc1
	.xword	0x2e56768e4c607ee6
	.xword	0x57284943fd7b50c8
	.xword	0x3ee722092af1087f
	.xword	0x7781dc6f6a75b027
	.xword	0xf537e637f4f2a3f3
	.xword	0x7f36e9e40ad165e5
	.xword	0xa38e9761fa6b86b5
	.xword	0x5b35960b03afc8dc
	.xword	0x34dd86ccb2db8829
	.xword	0x2e245b61e4684274
	.xword	0xe16a3704e4dedccb
	.xword	0x69af8c6ca17445c8
	.xword	0x735392d8ea0eabb6
	.xword	0xedf269954437a2cf
	.xword	0xa63ceb043c4a51c4
	.xword	0x69135770cafba934
	.xword	0xede799232d9f1e4d
	.xword	0xb49af4cefc07a4b5
	.xword	0xa030ad606f713729
	.xword	0xbb880a3ea4288870
	.xword	0x12aa4525521dd4c5
	.xword	0xca3ba49a9596437c
	.xword	0xfc74350b11ee4efa
	.xword	0x22df95c297a87d7e
	.xword	0x211d7ed0cb8321a9
	.xword	0xf3558482458098a9
	.xword	0x239b92ca52eb3aa3
	.xword	0xbd0671fe2d95b006
	.xword	0x33089829b69cfe40
	.xword	0xe9ca73e25a91c967
	.xword	0xb8aec89c70701fb6
	.xword	0xf7adab32f7588787
	.xword	0x7bfaed3b5d2c55fd
	.xword	0xa5a47fad570086f2
	.xword	0xe8ce4fe311b09183
	.xword	0x8e89cd47a8082798
	.xword	0xff81df5774319808
	.xword	0x551da9cbb64dde6f
	.xword	0x6c0494779ec0314e
	.xword	0xeebef17c46362f58



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
	.xword	0xf42096b318e98327
	.xword	0x13db41ceba940e30
	.xword	0xe6232c0c13f52032
	.xword	0x8cad6a3d27888ca0
	.xword	0x0ebfbf5d7370294b
	.xword	0xa5449aaf80590e75
	.xword	0x364a1211caff3069
	.xword	0x60fc5f9d4b12312d
	.xword	0xd5cb287a414c3d95
	.xword	0x73a7275f02312f83
	.xword	0xdce1669780fb37cf
	.xword	0xe98a7c5876d214c3
	.xword	0x00cf49578a0ed470
	.xword	0xfe84ea32fb00be5e
	.xword	0x0633162e10cbe86d
	.xword	0x41281df1de66e074
	.xword	0x37a1ca3ad45ef0e9
	.xword	0x03ad44728c603bb0
	.xword	0xe655382bb8a59b2e
	.xword	0xb61f37d8bfeff59a
	.xword	0xee4671073dd022a2
	.xword	0xcfc9b0995e36d003
	.xword	0xfd7b9af813bc0b47
	.xword	0xeac7ff432cc8a59e
	.xword	0xb8537ecfa78dff05
	.xword	0xefe6cfbcbae0c521
	.xword	0xab1b0b4ca0868029
	.xword	0xc63c559a9b34c4da
	.xword	0x548dbf0b4e1f33cd
	.xword	0xc32325739e21d725
	.xword	0xbaa3181b8a501597
	.xword	0x2542055c275a5de1
	.xword	0xcac604d7bf4e6911
	.xword	0xb368186805558800
	.xword	0xa202f0d3877a8aa5
	.xword	0xad3be04bb7194d38
	.xword	0xaa0daf9af734e5df
	.xword	0x395580b8bfafe01d
	.xword	0x6608208938948803
	.xword	0x02a09a6ca5257aea
	.xword	0xd96c70b1b5d48ed1
	.xword	0xa892b7772df15e4a
	.xword	0x5d952b98a4551e02
	.xword	0xf0524b0059fe78ec
	.xword	0x3683a419f193ef7c
	.xword	0xeef79bbbca0735db
	.xword	0xb97ade84abf0fd27
	.xword	0x775c79e07fc26f4c
	.xword	0xdd4d7de57ef1af07
	.xword	0xe58134dca0914559
	.xword	0x85b0869e6bb45c2b
	.xword	0x6c4821fdc00fecd8
	.xword	0x926e0ffa42f7ea81
	.xword	0x640ae674532feebd
	.xword	0x4b3ba6b69e5bd00b
	.xword	0x488520f927b7ac53
	.xword	0x9755343aeb114323
	.xword	0x42adee320ad2bf94
	.xword	0x2543623a04a4fddf
	.xword	0x1d88339094cefebf
	.xword	0xc3c5e9ad651cb139
	.xword	0x7cea5072fee77de2
	.xword	0x8e44121970d75d4b
	.xword	0x6b00c2744e057f1f



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
	.xword	0xf9a25c8d4ca908a4
	.xword	0xae01c5aa64030827
	.xword	0x8fd026539af5d325
	.xword	0x16c9df2e16b99ee3
	.xword	0x2049417c1e62e786
	.xword	0x47767a125c68ff43
	.xword	0x8170dba7b4cb2f04
	.xword	0xebf28e7f97c1a9e8
	.xword	0x51ce7e3f54204c33
	.xword	0xfc350e22d0e8ff48
	.xword	0xa3b9f5cc217a0f26
	.xword	0x3ba9953cb181cb67
	.xword	0x3e2abefeed24710d
	.xword	0x81216c6f134c7efe
	.xword	0xdffb954e89ba9b4e
	.xword	0x3421d16e6cffa9a3
	.xword	0x3e882d5630bf726d
	.xword	0xa6c0be4e3cfc7b49
	.xword	0x02bc31d9ca3c712b
	.xword	0x496c67a0e634c333
	.xword	0xfd6927dd1f7d3019
	.xword	0x4dcc02ad905df418
	.xword	0x45214175dc956cf3
	.xword	0x76b5c0f910c136c7
	.xword	0x478340f206a9a02d
	.xword	0xa8192ea591eec9db
	.xword	0x807ef6c1be6f3319
	.xword	0xa8d0d21768513b76
	.xword	0xb4a01398d3a33b10
	.xword	0x04873d92f30b0ab4
	.xword	0x2387013cc29c5132
	.xword	0x625d15963136d16b
	.xword	0xcdc36a800228b5ba
	.xword	0x5158d5aca4412ef5
	.xword	0x1d232beff5371ed3
	.xword	0xd81638c89c23e932
	.xword	0xb11e8bea5810e784
	.xword	0x5d6fb9e5b3c3e051
	.xword	0x2f0477134f1ac382
	.xword	0x9909b1e4093a816b
	.xword	0xfac314a82d3ec030
	.xword	0x49a88dbe57af8146
	.xword	0xbf0ff9e1bf8417d2
	.xword	0x12bae31062166c77
	.xword	0x5887b177fa299201
	.xword	0xd3b2d0c2630f625c
	.xword	0x5e7d1f5a8ebd70ce
	.xword	0x6e17d39529b52c4c
	.xword	0x3368c04e863babe2
	.xword	0xf630d0390f052663
	.xword	0x7913e06dd1f29900
	.xword	0x004bf099a7f777ca
	.xword	0xfedcd83a66ae5619
	.xword	0x343969ac8074a26e
	.xword	0xa22ab897f3f70dee
	.xword	0xa9fe752f3f209a1d
	.xword	0xb411f7e6bc2420bc
	.xword	0x9e12dd52f4b48a2b
	.xword	0x953b58beb896018c
	.xword	0xc7a894d755543e0f
	.xword	0xcb625aaa8aad180e
	.xword	0x13952430d57d36b8
	.xword	0x3452ffbebd580835
	.xword	0x7d61c0362af83d46



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
	.xword	0x4e7c8e14fae3df97
	.xword	0x81c40b3b27c2e593
	.xword	0xa7659e388ccf7074
	.xword	0x56ec0a29da174140
	.xword	0xfed8acd780f4fb53
	.xword	0x5b58dfb159a95e44
	.xword	0xb0f617ce9182fd21
	.xword	0xde6a25d10a100d09
	.xword	0x35a24ddfed55d178
	.xword	0x15e60a927b1489af
	.xword	0x0c60ae450d2e5a56
	.xword	0x6a54ceb7d018fac2
	.xword	0xef563ec68659a0b4
	.xword	0x9b5f5be18f7a2df7
	.xword	0x35974c222e05d449
	.xword	0xe18e9d4a42409bbe
	.xword	0xff03bda6df82c383
	.xword	0x28797f7fc625747a
	.xword	0xf89d3524b08abcdd
	.xword	0xa94540391e96e3a3
	.xword	0x4cae41e60272172b
	.xword	0x4b598d069bb7e723
	.xword	0x59d471701bcb17b9
	.xword	0xae1fb84e3cafcf76
	.xword	0x458e2cf2407ad67a
	.xword	0xb22c219add456e8e
	.xword	0x33316bd1f3c25183
	.xword	0x5ff4ea18b525e9de
	.xword	0x248879b109634405
	.xword	0x41a4df8ec2643011
	.xword	0xaffc1fb87bd7fba1
	.xword	0x299f8fe4af7b7706
	.xword	0x656e17783cbeeab6
	.xword	0xdb225d766c4994c8
	.xword	0x6287f5914bfaca12
	.xword	0xcb7525f01ccaa143
	.xword	0xc63238ea38c71a5a
	.xword	0x417657dfc004f166
	.xword	0x286efb4eb71e996f
	.xword	0x1f21c3dab1606a65
	.xword	0x8e4871c2316b7dd2
	.xword	0x5f775c3b584e5968
	.xword	0xb11a9169b424efd8
	.xword	0x25d682d9a96b7293
	.xword	0xea45c0e3daa703cb
	.xword	0xae9122e0cf24611b
	.xword	0x6298f08573aa54e8
	.xword	0x7efb9e31ca11710f
	.xword	0xdb63dbbb49f58fce
	.xword	0x2f90511de70312c2
	.xword	0x985e51d3a7090ccc
	.xword	0x7a402f9b683070cd
	.xword	0xe487ea077db5f45e
	.xword	0xfc0ed3e51d0f4000
	.xword	0xe552b376a4c94d51
	.xword	0x8f346b078d7bc876
	.xword	0x65b0c36369657f94
	.xword	0xe2bf3af29dbaca42
	.xword	0xf825afda54d16bae
	.xword	0x62c93aba4848c420
	.xword	0xaae9b2d61981dfb4
	.xword	0xb601bb5fb6f785a3
	.xword	0x89b3af35d2bbd6ba
	.xword	0x7f4f2382b8a93dd9



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
	.xword	0xff1e0a51ba75ccac
	.xword	0x6817719ad1b6e24e
	.xword	0xf6c8ca2cb5005944
	.xword	0x59c5979adad59f51
	.xword	0x1b909d935dd6370a
	.xword	0x1d2a38c4f0bcca5e
	.xword	0x9f75460a681efba9
	.xword	0x71e044c0f82e75b2
	.xword	0x99a1fa950cf9ee75
	.xword	0x35c9c7c718c71aff
	.xword	0xfaf9f4f17032c6be
	.xword	0xdb78d9286eb10c8c
	.xword	0x33ca29b76cc3580f
	.xword	0x3dfd603af0f28617
	.xword	0x3e2546211ca87ef7
	.xword	0xc4c0c35ef921a4b8
	.xword	0x25c7264cc35e5739
	.xword	0xe2cdac50a4e144d5
	.xword	0x4180ff059511604f
	.xword	0x9900ebca3d45eb62
	.xword	0x4601a65ff0a05b90
	.xword	0xb7b29cdba0adbf76
	.xword	0x46deb5bc2fed007d
	.xword	0x3daad9596e819f47
	.xword	0x7804d3e5d9fd793b
	.xword	0x992557e020adc0cf
	.xword	0xd25bfc47331e2718
	.xword	0x890eab23232fc19f
	.xword	0x2d26029d567dbaec
	.xword	0x3fe28934d5feb682
	.xword	0xce2539d57ceb8b05
	.xword	0x3d8d6c6ae3f379e2
	.xword	0x9f330fd6626857a0
	.xword	0x9a3351e0440c9db9
	.xword	0x1e95df267a924411
	.xword	0x3024fff57488815e
	.xword	0x6f4b3d018595dd42
	.xword	0x6fe7ac36ee7a598a
	.xword	0xf1e588d6159f8fa2
	.xword	0xb48ad10a7f823e54
	.xword	0xff1f431b1dcd9a7e
	.xword	0x211d00e7f6aef753
	.xword	0x7d35178e61c5bbad
	.xword	0x741a4cd99bdcc638
	.xword	0x3f969e04316bd734
	.xword	0xb6898f37668dd16d
	.xword	0xf68e83193e934ca3
	.xword	0x3f489ad1d0463ca6
	.xword	0x038db3680f73fd53
	.xword	0xd7aa9ef46859e3ef
	.xword	0x98d0d3f69e15cbc7
	.xword	0x07b5ddcbf93ff3e6
	.xword	0x8c90d001ed33aeee
	.xword	0x1be4120983bb134f
	.xword	0x364c10308174b624
	.xword	0xebb18904ac67f466
	.xword	0x808bb56ff0afd613
	.xword	0x622973999ac6ee32
	.xword	0x10e276f97faf8b67
	.xword	0x5ff7870fa83db6fa
	.xword	0x130afc8eb663ada7
	.xword	0x5d5e758d47b1c46c
	.xword	0xa6f3a2cb180a244c
	.xword	0x269ea99660566a85



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
	.xword	0xe591376335e73a0f
	.xword	0x6ec0b1b37845564c
	.xword	0x390d04d6c49d2ab4
	.xword	0x2673b45ea9fead41
	.xword	0xc53c700f10233f9e
	.xword	0xf07d5397e1c59ed4
	.xword	0x531f7622a84e22ef
	.xword	0x1fd85c07b4677f0e
	.xword	0x9aaf2712a80ee116
	.xword	0x3b1626a703f6e6aa
	.xword	0x9c3178f7303bbb21
	.xword	0xc904cb955dddf19a
	.xword	0xccdc891cffa84010
	.xword	0x7143469fdf020e90
	.xword	0x2c41eeba5473ebc3
	.xword	0x5336e950dc5651b8
	.xword	0x5e6021d6c4cd6214
	.xword	0x2ffd55bbb40ed5d7
	.xword	0xda18993429432eea
	.xword	0x4fdc87262d02ff4d
	.xword	0xe5099e14ca70e079
	.xword	0x31a95889f58436e8
	.xword	0x11365a889d4a7b21
	.xword	0xd6ec97df5a6f2eab
	.xword	0x8fc422a28b1ce578
	.xword	0xaa10fe98aed98b47
	.xword	0x89df5f47d6ef799f
	.xword	0xccbcc7be0b2b2c29
	.xword	0x0ee220fe23ad52aa
	.xword	0xba843ff705aadd5e
	.xword	0x6e129807b6bdacc1
	.xword	0x44444fb7945b0c69
	.xword	0xd93f545ec66fb3cd
	.xword	0xce94a44f722e5c68
	.xword	0xc8457aba6b0f0b68
	.xword	0x4e1b873e1cfee573
	.xword	0x330ce9a90dc96871
	.xword	0x5e43d5dae95a6eb3
	.xword	0xf7acb56a0827cd10
	.xword	0xde904a29dfa46797
	.xword	0x5951a46cf8e52b0c
	.xword	0x45ce980e99d7b9cd
	.xword	0x9eec1b8227f261c2
	.xword	0x7f4b12370d50e913
	.xword	0x6524204050027ddf
	.xword	0x1082312e513ae805
	.xword	0x183c437b2e754bb2
	.xword	0xc99ec779e3cb3047
	.xword	0xae7c79775891332f
	.xword	0xaa34528f2ad3c8a1
	.xword	0xa8bd6be29d5b54dc
	.xword	0xae0df4aef42c2290
	.xword	0x6cb0980fd27bbde2
	.xword	0x38f5437cb9df0667
	.xword	0x6762fa5768114b65
	.xword	0xc1d0723150b25bd1
	.xword	0x7f473e4c27ee18ba
	.xword	0x2706871c15460448
	.xword	0x3d38b5176740a9f0
	.xword	0x552fbe7ce2d6f314
	.xword	0xcba546f5b01bf9a8
	.xword	0xb4ba10ae0560c1aa
	.xword	0x22a50a9ddce9e76a
	.xword	0x881ea92eed4c64c2



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
	.xword	0xab2c3e10953cabd7
	.xword	0x4d9dea7a9b9a2525
	.xword	0xb13d680505ceecca
	.xword	0xa8b8c9e23fffb1ff
	.xword	0x7b5a3e24f82dfdf3
	.xword	0x67cbc9904c0adff7
	.xword	0xabcf5204e88e0621
	.xword	0xa0303bc30973766b
	.xword	0xedd2cf83303ea7c2
	.xword	0x6b17c078a0c14b1f
	.xword	0xdecf25ca23003c87
	.xword	0x3df24943e3d1ccd3
	.xword	0x89a460cb8cb848a6
	.xword	0x26ca653fdaff61c0
	.xword	0x022124c3cc33de7b
	.xword	0x5b72a91eeea98968
	.xword	0x129e04dd5b368a37
	.xword	0x151ecf6281ff4201
	.xword	0x109e6a420949631c
	.xword	0xe8eb6c4651b66f17
	.xword	0xbf25c9bb0c8783da
	.xword	0x71af977012e5ec2d
	.xword	0x3638f7d37696dd26
	.xword	0x43a52e995b71cf36
	.xword	0xbba852ab9cff4cab
	.xword	0xafb10b552c65ed28
	.xword	0x69c946b1cb7394aa
	.xword	0x0cabcd7a519d1c5d
	.xword	0x01aebb87213fbb35
	.xword	0xc902eeb4612ede9d
	.xword	0x2f7c9fb21248bb29
	.xword	0xb23dbc1e59456b26
	.xword	0x7ef54d5bd2364ff7
	.xword	0xc4f26a38b43dadfe
	.xword	0xf002c4db6df03704
	.xword	0x0a9ed006401618be
	.xword	0x23b7c5763e05e14f
	.xword	0x0405e26a11814cc8
	.xword	0x4a828cb800a77ba4
	.xword	0x5bce9da19ba845e5
	.xword	0x37531f64bae8a96c
	.xword	0x507127101ecbc4b9
	.xword	0x45825c3e1f615300
	.xword	0x187fda392963deca
	.xword	0x0e832c3158617472
	.xword	0x9c354e8ebf40b42d
	.xword	0xb5ed94e5c2f4b1c3
	.xword	0x5b40027d33363563
	.xword	0xdd25703611a94bda
	.xword	0xa35a6ba908d6b227
	.xword	0x077e2f60cf7a97d4
	.xword	0x7541f533001d889a
	.xword	0xb1c64ff40f70a20e
	.xword	0xf5e50b127241d547
	.xword	0xc4dbcf0d225a2ec6
	.xword	0xecb47aa74912a431
	.xword	0x204ba9925df5a2f3
	.xword	0x40757caa4bfc4336
	.xword	0xe6bd6a3f8230ec77
	.xword	0x6326ed8c59680ee9
	.xword	0x1ec3e96e832c05cc
	.xword	0xdc5dce3f224a311e
	.xword	0x44ff9c1870ffa153
	.xword	0xf002a842ddd7041d



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
	.xword	0x3b6e1165c51fe681
	.xword	0x4a831fd12966da12
	.xword	0x0c578091dc02df93
	.xword	0x7783a58d52ca766c
	.xword	0xc734977f91ce54b0
	.xword	0x1cbdf1a6e386d7bb
	.xword	0x6f4f8355d58abd34
	.xword	0xe7beadf92602095a
	.xword	0xf6537d0fa18c4e9d
	.xword	0x3ac247a9f7a6c9a7
	.xword	0x610dd421591854db
	.xword	0xdcb7025ca714fd15
	.xword	0xf0b7b2c9a98b447c
	.xword	0x1d664b33bc22c2af
	.xword	0xb590a6a9329027b1
	.xword	0xf826647eef841412
	.xword	0x1accaca15ea0c89d
	.xword	0x2ecf1bd62c6c14d6
	.xword	0x074789c9792e4c20
	.xword	0x2c573d31ce2531e9
	.xword	0x183c9cb9c5f181df
	.xword	0xf3c708a04aaf7e3a
	.xword	0x0d48af9be5a0c1cd
	.xword	0x91a2469dbf770aa3
	.xword	0x501becfe197f3255
	.xword	0xd625d3327577696f
	.xword	0xde722710f2061e4c
	.xword	0xc7c664b21283420f
	.xword	0x89dee4f6273c2366
	.xword	0xf94004ea1ca57a3b
	.xword	0x796d63ba678a775f
	.xword	0x66e70086ad8c87b2
	.xword	0x5c74dbf5ab5343cb
	.xword	0x31f88782e0a26b5f
	.xword	0x516858117122a61b
	.xword	0xc02b001c10648b66
	.xword	0xd859b024cdb945d6
	.xword	0xbd69c2df7a0ac53d
	.xword	0xd4c2b028a8d9b66b
	.xword	0xfca479b64509bebe
	.xword	0xef280a21d568fbb5
	.xword	0x54ebf6f541876c7f
	.xword	0xd71495e47a68fa2c
	.xword	0xee167512fdda12d9
	.xword	0xb75300dd3b9ca7bc
	.xword	0x175f25388764b175
	.xword	0x3912be14c40493d5
	.xword	0x3232d47f1a13c174
	.xword	0x9e83a77c8003494e
	.xword	0x2e930ac0dc119808
	.xword	0x479e1f27cc97806d
	.xword	0x46b0e57737e199e9
	.xword	0xb41386115cc42be5
	.xword	0xdd70b772f1795829
	.xword	0x1b92e3f941c4d827
	.xword	0x3b8843ebc26646c4
	.xword	0x43b4c941fde68308
	.xword	0x1cdf3d0f5e0b7b88
	.xword	0xa529f95a5bb50cda
	.xword	0x27f148dcc97e5424
	.xword	0xa642c635374c0911
	.xword	0x3e14a20dbab33885
	.xword	0x335d08e77c816e4c
	.xword	0x664c359ae8647581



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
!!#   ! only 60* or 61*
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
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 156, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 165, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 175, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 185, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 195, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 205, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 215, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 225, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! BYTE ALIGNED
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 236, Rv_jbi_b_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 245, Rv_jbi_b_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 255, Rv_jbi_b_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 265, Rv_jbi_b_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 275, Rv_jbi_b_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 285, Rv_jbi_b_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 295, Rv_jbi_b_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 305, Rv_ssi_b_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! HWORD ADDRESS
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 317, Rv_jbi_h_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 326, Rv_jbi_h_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 336, Rv_jbi_h_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 346, Rv_jbi_h_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 356, Rv_jbi_h_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 366, Rv_jbi_h_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 376, Rv_jbi_h_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 386, Rv_ssi_h_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! WORD Address
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 397, Rv_jbi_w_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 406, Rv_jbi_w_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 416, Rv_jbi_w_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 426, Rv_jbi_w_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 436, Rv_jbi_w_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 446, Rv_jbi_w_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 456, Rv_jbi_w_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 466, Rv_ssi_w_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
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
!!#   ! BLOCK LOAD STORE
!!#   ! Since limited space is initialized we do blk st and load
!!#   ! to that limited space only.
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 499, Rv_jbiaddr_pattern00,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0001 0000 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 508, Rv_jbiaddr_pattern01,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 518, Rv_jbiaddr_pattern02,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 528, Rv_jbiaddr_pattern03,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 0000 0000 0000 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 538, Rv_jbiaddr_pattern04,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 0000 0000 0000 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 548, Rv_jbiaddr_pattern05,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 0000 0000 0000 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 558, Rv_jbiaddr_pattern06,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 0000 0000 0000 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 568, Rv_ssiaddr_pattern00,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 0000 0000,"
!!#         "20'b 0000 0000 0000 rr00 0000,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 577, ijdefault, Ft_Rs1, "{9}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 578, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 579, ijdefault, Ft_Rd, "{16..23}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
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
!!#   IJ_printf ("diag.j", 639, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 640, sjm_5, "\n\nBA LABEL_0\n");
!!# 
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
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
!!#                    IJ_printf ("diag.j", 913, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 916, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 918, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 919, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
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
!!#                      !sjm4_cnt--;
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
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
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
!!#                    IJ_printf ("diag.j", 1029, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1032, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 1034, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 1035, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
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
!!#                        !case 0 : b_sz = 1; break;
!!#                        !case 1 : b_sz = 2; break;
!!#                        case 2 : b_sz = 4; break;
!!#                        case 3 : b_sz = 8; break;
!!#                        default :b_sz = 16; break;
!!#                       } 
!!# 
!!#                      sjm0_data_io1[sjm_wr0_io1][15] = b_sz; ! byte size in entry 15, for read
!!# 
!!#                       IJ_printf ("diag.j", 1107, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
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
!!#                      IJ_printf ("diag.j", 1196, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 1202, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1203, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1206, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1208, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1217, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1219, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1237, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1243, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1248, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1250, sjm_4, "\n");
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
!!#                      !sjm4_cnt--;
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
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
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
!!#                    IJ_printf ("diag.j", 1383, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1386, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1388, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1389, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
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
!!#                        !case 0 : b_sz = 1; break;
!!#                        !case 1 : b_sz = 2; break;
!!#                        case 2 : b_sz = 4; break;
!!#                        case 3 : b_sz = 8; break;
!!#                        default :b_sz = 16; break;
!!#                       } 
!!# 
!!#                      sjm1_data_io1[sjm_wr1_io1][15] = b_sz; ! byte size in entry 15, for read
!!# 
!!#                       IJ_printf ("diag.j", 1462, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
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
!!#                      IJ_printf ("diag.j", 1551, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1557, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1558, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1561, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1563, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1572, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1574, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1592, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1598, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1603, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1605, sjm_5, "\n");
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
!!#                         ! BLOCK LOAD AND STORES
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1645, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1646, Rv_memaddr_pattern);
!!# 
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1648, Rv_jbiaddr_pattern00);
!!# 
!!#                         ! to remove address not in dma-fake range
!!# 			! since using a limited space we dont need it right now
!!#                         !while (jbi0 < 550024249344 ) {
!!#                         !jbi0 = IJ_get_rvar_val64(Rv_jbiaddr_pattern00);
!!# 			!IJ_update_rvar(Rv_jbiaddr_pattern00);
!!#                         !}
!!# 
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1658, Rv_jbiaddr_pattern01);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1659, Rv_jbiaddr_pattern02);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1660, Rv_jbiaddr_pattern03);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1661, Rv_jbiaddr_pattern04);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1662, Rv_jbiaddr_pattern05);
!!# 
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1664, Rv_jbiaddr_pattern06);
!!#                         ! to remove address not in dma-fake range
!!# 			! since using a limited space we dont need it right now
!!#                         !while (jbi6 > 1095216660479)  {
!!#                         !jbi6 = IJ_get_rvar_val64(Rv_jbiaddr_pattern06);
!!# 			!IJ_update_rvar(Rv_jbiaddr_pattern06);
!!#                         !}
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
!!#                         bb_ADDR_ARRAY[bb_a_wr_cntr] = jbi0; bb_a_wr_cntr = bb_a_wr_cntr + 1; ! store the stx address
!!#                         bb_ADDR_ARRAY[bb_a_wr_cntr] = jbi1; bb_a_wr_cntr = bb_a_wr_cntr + 1; ! store the stx address
!!#                         bb_ADDR_ARRAY[bb_a_wr_cntr] = jbi2; bb_a_wr_cntr = bb_a_wr_cntr + 1; ! store the stx address
!!#                         bb_ADDR_ARRAY[bb_a_wr_cntr] = jbi3; bb_a_wr_cntr = bb_a_wr_cntr + 1; ! store the stx address
!!#                         bb_ADDR_ARRAY[bb_a_wr_cntr] = jbi4; bb_a_wr_cntr = bb_a_wr_cntr + 1; ! store the stx address
!!#                         bb_ADDR_ARRAY[bb_a_wr_cntr] = jbi5; bb_a_wr_cntr = bb_a_wr_cntr + 1; ! store the stx address
!!#                         bb_ADDR_ARRAY[bb_a_wr_cntr] = jbi6; bb_a_wr_cntr = bb_a_wr_cntr + 1; ! store the stx address
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
!!#  			! cache able store and load to main memory 
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
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!# !                                jbi_config);
!!# !                        IJ_printf (th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!# !                        IJ_printf (th_M, "\tstx\t%%r9, [%%r10]\n");
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
!!#                         ! to remove address not in dma-fake range
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
!!#                         ! to remove address not in dma-fake range
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
!!#                         !addr_sel = random() % 5;
!!# 			!IJ_update_rvar(Rv_addr_sel);
!!# 	                !printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!!#                         !store_addr = addr_sel;
!!# 
!!#                         !switch (addr_sel) {
!!#                         !case 1 : jbi_addr = jbi1; break;
!!#                         !case 2 : jbi_addr = jbi2; break;
!!#                         !case 3 : jbi_addr = jbi3; break;
!!#                         !case 4 : jbi_addr = jbi4; break;
!!#                         !case 5 : jbi_addr = jbi5; break;
!!#                         !case 0 : jbi_addr = jbi6; break;
!!#                         !default : jbi_addr = jbi5; break;
!!#                         !}
!!#                       if (random()%2 == 1) {
!!# 
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi0; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi1; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi2; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi3; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi4; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi5; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi6; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
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
!!#  			! cache able store and load to main memory 
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
!!#                         } ! end for 
!!# 
!!#                       } ! if (random()%2 == 1)
!!# 
!!#                         ! HALF WORD
!!#                         ! add a mechanism to control addr1, addr5 in range ??
!!#                         ! addr
!!# 
!!#                         while (jbi0 < 550024249344 ) {
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1863, Rv_jbi_h_addr_pattern1);
!!#                         IJ_update_rvar("diag.j", 1864, Rv_jbi_h_addr_pattern0);
!!#                         }
!!# 
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1867, Rv_jbi_h_addr_pattern6);
!!#                         ! to remove address not in dma-fake range
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
!!#                         !jbi6 = IJ_get_rvar_val64(Rv_jbi_h_addr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1880, Rv_jbi_h_addr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1881, Rv_jbi_h_addr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1882, Rv_jbi_h_addr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1883, Rv_jbi_h_addr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1884, Rv_jbi_h_addr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1885, Rv_jbi_h_addr_pattern6);
!!# 
!!#                         !addr_sel = random() % 5;
!!# 			!IJ_update_rvar(Rv_addr_sel);
!!# 	                !printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!!#                         !store_addr = addr_sel;
!!# 
!!#                       if (random()%2 == 1) {
!!# 
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi1; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi2; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi3; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi4; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi5; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi6; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
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
!!#                         ! cache able store and load to main memory
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
!!#                         } ! end for 
!!# 
!!#                        }
!!# 
!!#                         !  WORD
!!#                         ! add a mechanism to control addr1, addr5 in range ??
!!#                         ! addr
!!#                         while (jbi0 < 550024249344 ) {
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1938, Rv_jbi_w_addr_pattern1);
!!#                         IJ_update_rvar("diag.j", 1939, Rv_jbi_w_addr_pattern0);
!!#                         }
!!# 
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1942, Rv_jbi_w_addr_pattern6);
!!#                         ! to remove address not in dma-fake range
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
!!#                         !jbi6 = IJ_get_rvar_val64(Rv_jbi_w_addr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1955, Rv_jbi_w_addr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1956, Rv_jbi_w_addr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1957, Rv_jbi_w_addr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1958, Rv_jbi_w_addr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1959, Rv_jbi_w_addr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1960, Rv_jbi_w_addr_pattern6);
!!# 
!!#                       if (random()%2 == 1) {
!!# 
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi1; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi2; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi3; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi4; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi5; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi6; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
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
!!#                         ! cache able store and load to main memory
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
!!#                         } ! end for 
!!#                       }
!!# 
!!#                         ! Double WORD (x-word)
!!#                         ! add a mechanism to control addr1, addr5 in range ??
!!#                         ! addr
!!#                         while (jbi0 < 550024249344 ) {
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 2007, Rv_jbiaddr_pattern1);
!!#                         IJ_update_rvar("diag.j", 2008, Rv_jbiaddr_pattern0);
!!#                         }
!!# 
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 2011, Rv_jbiaddr_pattern6);
!!#                         ! to remove address not in dma-fake range
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
!!#                         !jbi6 = IJ_get_rvar_val64(Rv_jbiaddr_pattern6);
!!# 			IJ_update_rvar("diag.j", 2024, Rv_jbiaddr_pattern1);
!!# 			IJ_update_rvar("diag.j", 2025, Rv_jbiaddr_pattern2);
!!# 			IJ_update_rvar("diag.j", 2026, Rv_jbiaddr_pattern3);
!!# 			IJ_update_rvar("diag.j", 2027, Rv_jbiaddr_pattern4);
!!# 			IJ_update_rvar("diag.j", 2028, Rv_jbiaddr_pattern5);
!!# 			IJ_update_rvar("diag.j", 2029, Rv_jbiaddr_pattern6);
!!# 
!!#                         !addr_sel = random() % 5;
!!# 			!IJ_update_rvar(Rv_addr_sel);
!!# 	                !printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!!#                         !store_addr = addr_sel;
!!# 
!!#                       if (random()%2 == 1) {
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi1; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi2; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi3; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi4; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi5; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi6; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
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
!!#                         ! cache able store and load to main memory
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
!!#                         } ! end for 
!!#                       }
!!# 
!!#                         ! Loads (1/2/4/8)
!!#                         !for(i=0; i <60; i++){
!!#                         !IJ_printf (th_M, "!\tdata_array = 0x%016llx, addr_array %d = 0x%016llx  \n",b_DATA_ARRAY[i], i,b_ADDR_ARRAY[i]);
!!#                         !}
!!# 
!!#                         ! BYTE LOADS
!!#                         a_addr_sel = random() %500;
!!# 
!!#                       if (random()%2 == 1) {
!!#                         if(b_a_wr_cntr >= 10 ) {
!!#                         while (a_addr_sel + 9 >= b_a_wr_cntr ) {
!!#                         a_addr_sel = random() %500;
!!# 	                !IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!!#                         rnd_cnt = random() % 8; ! 4 ld(.) from random loc which is already stored
!!# 	                !IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, b_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,b_a_wr_cntr,a_addr_sel); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 2094, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 b_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 2096, th_M, "\tldub\t[%%r12], %%r11\n");
!!#                         !data_ld = b_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                         !        data_ld);
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r14\n",
!!#                         !        0x00000000000000ff);
!!#                         !IJ_printf (th_M, "\tand\t%%r10, %%r14, %%r10\n");
!!#                         !IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!#                         !IJ_printf (th_M, "\tbne h_bad_end\n");
!!#                         !IJ_printf (th_M, "\tnop\n");
!!# 
!!#  			! cache able store and load to main memory 
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
!!#                         } ! of if(b_a_wr_cntr >=10)
!!#                       }  ! if (random()%2 == 1)
!!# 
!!#                         ! HALF WORD LOADS
!!#                         a_addr_sel = random() %500;
!!# 
!!#                       if (random()%2 == 1) {
!!#                         if(h_a_wr_cntr >= 10 ) {
!!#                         while (a_addr_sel + 9 >= h_a_wr_cntr ) {
!!#                         a_addr_sel = random() %500;
!!# 	                !IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!!#                         rnd_cnt = random() % 8; ! 4 ld(.) from random loc which is already stored
!!# 	                !IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, h_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,h_a_wr_cntr,a_addr_sel); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 2141, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 h_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 2143, th_M, "\tlduh\t[%%r12], %%r11\n");
!!#                         !data_ld = h_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                         !        data_ld);
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r14\n",
!!#                         !        0x000000000000ffff);
!!#                         !IJ_printf (th_M, "\tand\t%%r10, %%r14, %%r10\n");
!!#                         !IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!#                         !IJ_printf (th_M, "\tbne h_bad_end\n");
!!#                         !IJ_printf (th_M, "\tnop\n");
!!#                         rnd_cnt--;
!!#                          }
!!#                         } ! of if(h_a_wr_cntr >=10)
!!#                       }  ! if (random()%2 == 1)
!!# 
!!#                         ! WORD LOADS
!!#                         a_addr_sel = random() %500;
!!#                       if (random()%2 == 1) {
!!# 
!!#                         if(w_a_wr_cntr >= 10 ) {
!!#                         while (a_addr_sel + 9 >= w_a_wr_cntr ) {
!!#                         a_addr_sel = random() %500;
!!# 	                !IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!!#                         rnd_cnt = random() % 8; ! 4 ld(.) from random loc which is already stored
!!# 	                !IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, w_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,w_a_wr_cntr,a_addr_sel); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 2172, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 w_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 2174, th_M, "\tlduw\t[%%r12], %%r11\n");
!!#                         !data_ld = w_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                         !        data_ld);
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r14\n",
!!#                         !        0x00000000ffffffff);
!!#                         !IJ_printf (th_M, "\tand\t%%r10, %%r14, %%r10\n");
!!#                         !IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!#                         !IJ_printf (th_M, "\tbne h_bad_end\n");
!!#                         !IJ_printf (th_M, "\tnop\n");
!!#                         rnd_cnt--;
!!#                          }
!!#                         } ! of if(w_a_wr_cntr >=10)
!!#                       }  ! if (random()%2 == 1)
!!# 
!!#                         ! X-WORD LOADS
!!#                         a_addr_sel = random() %500;
!!#                       if (random()%2 == 1) {
!!# 
!!#                         if(x_a_wr_cntr >= 10 ) {
!!#                         while (a_addr_sel + 9 >= x_a_wr_cntr ) {
!!#                         a_addr_sel = random() %500;
!!# 	                !IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!!#                         rnd_cnt = random() % 8; ! 4 ld(.) from random loc which is already stored
!!# 	                !IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, x_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,x_a_wr_cntr,a_addr_sel); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 2203, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 x_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 2205, th_M, "\tldx\t[%%r12], %%r11\n");
!!#                         !data_ld = x_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                         !        data_ld);
!!#                         !IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!#                         !IJ_printf (th_M, "\tbne h_bad_end\n");
!!#                         !IJ_printf (th_M, "\tnop\n");
!!#                         rnd_cnt--;
!!#                          }
!!#                         } ! of if(x_a_wr_cntr >=10)
!!#                       }  ! if (random()%2 == 1)
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
