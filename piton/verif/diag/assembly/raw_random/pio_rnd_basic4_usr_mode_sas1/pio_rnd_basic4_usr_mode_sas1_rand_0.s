// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_usr_mode_sas1_rand_0.s
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
   random seed:	242392257
   Jal pio_rnd_basic4_usr_mode_sas1.j:	
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

#define H_HT0_Data_Access_Exception_0x30 My_0x30_trap

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:

th_fork(th_main, %l0)

th_main_0:
	ta	0x30

	setx	user_data_start, %l0, %l1
	setx	0xf0, %l0, %l2
        mov     0,%l4
        setx    ncdata_base0, %l0, %l2           ! nc data base
        setx    0x1000, %l0, %l3                ! nc datawork area
        add     %l2, %l3, %g3
!loop0:	
!	ldub	[%l1 + 0x7f], %l3
!	subcc	%l3, %l2, %g0
!	bnz	loop0
!	nop
!	prefetch [%l1 + 0x3f], #n_writes

! initalize 
setx    ncdata_base1, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3

setx 0x7766554433221100, %g1, %g2
add 0x0, %g0, %g4
!add 0x0, %g0, %g2
add 0x040, %g0, %g5
!setx 0x800e000000, %g1, %g3
stloop0:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop0
nop

! initalize 
setx    ncdata_base0, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3

add 0x0, %g0, %g4
!add 0x1, %g0, %g2
add 0x040, %g0, %g5
! FAKE DMA space
!setx 0x8010000000, %g1, %g3
stloop1:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop1
nop

! initalize
setx    ncdata_base2, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3
add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x040, %g0, %g5
!setx 0x800f000000, %g1, %g3
stloop2:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop2
nop

! initalize
setx    ncdata_base3, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3
add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x040, %g0, %g5
!setx 0xc000000000, %g1, %g3
stloop3:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop3
nop

! initalize
setx    ncdata_base4, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3
add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x040, %g0, %g5
!setx 0xd000000000, %g1, %g3
stloop4:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop4
nop

! initalize
setx    ncdata_base5, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3
add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x040, %g0, %g5
!setx 0xe000000000, %g1, %g3
stloop5:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop5
nop

! initalize
setx    ncdata_base6, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3
add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x040, %g0, %g5
!setx 0xf000000000, %g1, %g3
stloop6:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop6
nop
membar 0x40

wr    %g0, 7, %fprs

ldda [%g3]ASI_BLK_P, %f0

! Register init code

	setx 0x7f1c09f4faa512da, %g1, %g0
	setx 0x08d2515a85e8fea8, %g1, %g1
	setx 0x86760525018409d3, %g1, %g2
	setx 0x48663e9ec40a1d34, %g1, %g3
	setx 0x86dc1c712e95d792, %g1, %g4
	setx 0xd9c9a72bc9017cf9, %g1, %g5
	setx 0x7a00e212f526a4e2, %g1, %g6
	setx 0xc22bddfed1f0e5dc, %g1, %g7
	setx 0x94048c86929a4397, %g1, %r16
	setx 0x43298e8ab4b0f8c2, %g1, %r17
	setx 0xf1b1c02008b7d1da, %g1, %r18
	setx 0x7954ead1f66705e1, %g1, %r19
	setx 0xd5361631e99937d3, %g1, %r20
	setx 0xe63356f1617dff0d, %g1, %r21
	setx 0x9141c1f09c8bc161, %g1, %r22
	setx 0x2363a26eb50fc2a3, %g1, %r23
	setx 0xdf0e416de0dab235, %g1, %r24
	setx 0x40b7273dc6cba821, %g1, %r25
	setx 0x96ce98ca37044b94, %g1, %r26
	setx 0xe08bb5469ec9abdb, %g1, %r27
	setx 0x9b6047840a9692f4, %g1, %r28
	setx 0x792762c2c8a9cd51, %g1, %r29
	setx 0xaed388e3cd47cd18, %g1, %r30
	setx 0x5af998bc426480cb, %g1, %r31
	save
	setx 0xe3b15f8a130e06c1, %g1, %r16
	setx 0x1a5674ad016004bb, %g1, %r17
	setx 0x7ea5fd7bffbb4d40, %g1, %r18
	setx 0x6c8c56098297673b, %g1, %r19
	setx 0x0886a223438272e1, %g1, %r20
	setx 0xd6618dfc428c2b47, %g1, %r21
	setx 0x1babfe847ebc94a7, %g1, %r22
	setx 0xe1bc78c6d19ce52b, %g1, %r23
	setx 0x906f22bd269a27a4, %g1, %r24
	setx 0x93b75eaae5825975, %g1, %r25
	setx 0x47c972748c4976ec, %g1, %r26
	setx 0x69b8b22969b66d06, %g1, %r27
	setx 0x129682897b7a83ea, %g1, %r28
	setx 0xf3574c8a228f780b, %g1, %r29
	setx 0x6665b7d57a86c10b, %g1, %r30
	setx 0x1902d75d56062f28, %g1, %r31
	save
	setx 0xa8cc8a9511393ec0, %g1, %r16
	setx 0xaed4cbbeef63d7d3, %g1, %r17
	setx 0xac3d9087c3863b76, %g1, %r18
	setx 0x58919bfd79172063, %g1, %r19
	setx 0xec6fc284802a7d64, %g1, %r20
	setx 0xee994dfeccd050d9, %g1, %r21
	setx 0xfb4e7f3d0c448eb1, %g1, %r22
	setx 0x66fb3ede735e4746, %g1, %r23
	setx 0x4331170c66e0b167, %g1, %r24
	setx 0xee70b24af11f9f5e, %g1, %r25
	setx 0xab4c1a390c2372cc, %g1, %r26
	setx 0x13da444b8bd99da5, %g1, %r27
	setx 0x084faefb0b5e0ab5, %g1, %r28
	setx 0xc9d3d40d2917dfa0, %g1, %r29
	setx 0x9d246f90ccc4040d, %g1, %r30
	setx 0x8c167b8ad1bb6f84, %g1, %r31
	restore
	mov	0, %r8
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d02ef080, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r9
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe22a4008  ! 1: STB_R	stb	%r17, [%r9 + %r8]
	.word 0xee0b2008  ! 2: LDUB_I	ldub	[%r12 + 0x0008], %r23
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe6532030  ! 4: LDSH_I	ldsh	[%r12 + 0x0030], %r19
	.word 0xea718008  ! 5: STX_R	stx	%r21, [%r6 + %r8]
	.word 0xe8336030  ! 6: STH_I	sth	%r20, [%r13 + 0x0030]
	.word 0xe629a000  ! 7: STB_I	stb	%r19, [%r6 + 0x0000]
	.word 0xea198008  ! 8: LDD_R	ldd	[%r6 + %r8], %r21
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe63b4008  ! 10: STD_R	std	%r19, [%r13 + %r8]
	.word 0xe0226018  ! 11: STW_I	stw	%r16, [%r9 + 0x0018]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xe439a018  ! 15: STD_I	std	%r18, [%r6 + 0x0018]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa88b2008  ! 17: ANDcc_I	andcc 	%r12, 0x0008, %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec236010  ! 21: STW_I	stw	%r22, [%r13 + 0x0010]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0718008  ! 23: STX_R	stx	%r16, [%r6 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe071c008  ! 27: STX_R	stx	%r16, [%r7 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xee02a020  ! 29: LDUW_I	lduw	[%r10 + 0x0020], %r23
	.word 0xe6718008  ! 30: STX_R	stx	%r19, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d02ef000, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r9
	setx	0x00000000d04ef140, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xea22e018  ! 32: STW_I	stw	%r21, [%r11 + 0x0018]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec218008  ! 34: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe84b4008  ! 35: LDSB_R	ldsb	[%r13 + %r8], %r20
	.word 0xec734008  ! 36: STX_R	stx	%r22, [%r13 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe6732038  ! 39: STX_I	stx	%r19, [%r12 + 0x0038]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec39c008  ! 42: STD_R	std	%r22, [%r7 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe432c008  ! 47: STH_R	sth	%r18, [%r11 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xee31e030  ! 49: STH_I	sth	%r23, [%r7 + 0x0030]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xea02e010  ! 53: LDUW_I	lduw	[%r11 + 0x0010], %r21
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xee39a000  ! 55: STD_I	std	%r23, [%r6 + 0x0000]
	.word 0xec21c008  ! 56: STW_R	stw	%r22, [%r7 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xea52a038  ! 58: LDSH_I	ldsh	[%r10 + 0x0038], %r21
	.word 0xee132000  ! 59: LDUH_I	lduh	[%r12 + 0x0000], %r23
	.word 0xe03a4008  ! 60: STD_R	std	%r16, [%r9 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xee01a000  ! 63: LDUW_I	lduw	[%r6 + 0x0000], %r23
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xec2aa000  ! 65: STB_I	stb	%r22, [%r10 + 0x0000]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec224008  ! 68: STW_R	stw	%r22, [%r9 + %r8]
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04b4008  ! 72: LDSB_R	ldsb	[%r13 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe649c008  ! 77: LDSB_R	ldsb	[%r7 + %r8], %r19
	.word 0xe2526000  ! 78: LDSH_I	ldsh	[%r9 + 0x0000], %r17
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839c008  ! 84: STD_R	std	%r20, [%r7 + %r8]
	.word 0xea3b2030  ! 85: STD_I	std	%r21, [%r12 + 0x0030]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe6398008  ! 87: STD_R	std	%r19, [%r6 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xea1b2020  ! 89: LDD_I	ldd	[%r12 + 0x0020], %r21
	.word 0xec2a6028  ! 90: STB_I	stb	%r22, [%r9 + 0x0028]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe411e020  ! 92: LDUH_I	lduh	[%r7 + 0x0020], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe472a038  ! 94: STX_I	stx	%r18, [%r10 + 0x0038]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r9
	setx	0x00000000d04ef180, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef100, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec318008  ! 99: STH_R	sth	%r22, [%r6 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xea234008  ! 102: STW_R	stw	%r21, [%r13 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe6530008  ! 104: LDSH_R	ldsh	[%r12 + %r8], %r19
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xee130008  ! 107: LDUH_R	lduh	[%r12 + %r8], %r23
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4230008  ! 109: STW_R	stw	%r18, [%r12 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0018008  ! 112: ADD_R	add 	%r6, %r8, %r16
	.word 0xe8098008  ! 113: LDUB_R	ldub	[%r6 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec32e038  ! 120: STH_I	sth	%r22, [%r11 + 0x0038]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xee0aa008  ! 122: LDUB_I	ldub	[%r10 + 0x0008], %r23
	.word 0xea498008  ! 123: LDSB_R	ldsb	[%r6 + %r8], %r21
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe8198008  ! 126: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xec2ac008  ! 127: STB_R	stb	%r22, [%r11 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4218008  ! 129: STW_R	stw	%r18, [%r6 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe439a000  ! 133: STD_I	std	%r18, [%r6 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec236000  ! 136: STW_I	stw	%r22, [%r13 + 0x0000]
	.word 0xe02b0008  ! 137: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe4098008  ! 138: LDUB_R	ldub	[%r6 + %r8], %r18
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe80a6038  ! 140: LDUB_I	ldub	[%r9 + 0x0038], %r20
	.word 0xee5a6020  ! 141: LDX_I	ldx	[%r9 + 0x0020], %r23
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe2328008  ! 143: STH_R	sth	%r17, [%r10 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xea19e010  ! 145: LDD_I	ldd	[%r7 + 0x0010], %r21
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe622c008  ! 149: STW_R	stw	%r19, [%r11 + %r8]
	.word 0xe8126018  ! 150: LDUH_I	lduh	[%r9 + 0x0018], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe219a038  ! 152: LDD_I	ldd	[%r6 + 0x0038], %r17
	.word 0xe0118008  ! 153: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xee4a6030  ! 154: LDSB_I	ldsb	[%r9 + 0x0030], %r23
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe4226008  ! 157: STW_I	stw	%r18, [%r9 + 0x0008]
	.word 0xe6398008  ! 158: STD_R	std	%r19, [%r6 + %r8]
	.word 0xe2718008  ! 159: STX_R	stx	%r17, [%r6 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xee21a030  ! 161: STW_I	stw	%r23, [%r6 + 0x0030]
	.word 0xee39a008  ! 162: STD_I	std	%r23, [%r6 + 0x0008]
	.word 0xe402a010  ! 163: LDUW_I	lduw	[%r10 + 0x0010], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r9
	setx	0x00000000d04ef180, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xec42c008  ! 166: LDSW_R	ldsw	[%r11 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe44aa000  ! 169: LDSB_I	ldsb	[%r10 + 0x0000], %r18
	.word 0xe021c008  ! 170: STW_R	stw	%r16, [%r7 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe42aa000  ! 174: STB_I	stb	%r18, [%r10 + 0x0000]
	.word 0xe651a010  ! 175: LDSH_I	ldsh	[%r6 + 0x0010], %r19
	.word 0xe2034008  ! 176: LDUW_R	lduw	[%r13 + %r8], %r17
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec0b6010  ! 179: LDUB_I	ldub	[%r13 + 0x0010], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0a6020  ! 181: LDUB_I	ldub	[%r9 + 0x0020], %r22
	.word 0xe041a008  ! 182: LDSW_I	ldsw	[%r6 + 0x0008], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec12a000  ! 188: LDUH_I	lduh	[%r10 + 0x0000], %r22
	.word 0xe01ae030  ! 189: LDD_I	ldd	[%r11 + 0x0030], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec430008  ! 194: LDSW_R	ldsw	[%r12 + %r8], %r22
	.word 0xee21e020  ! 195: STW_I	stw	%r23, [%r7 + 0x0020]
	.word 0xe832e028  ! 196: STH_I	sth	%r20, [%r11 + 0x0028]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe63b2018  ! 199: STD_I	std	%r19, [%r12 + 0x0018]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r9
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec39a018  ! 205: STD_I	std	%r22, [%r6 + 0x0018]
	.word 0xe8732020  ! 206: STX_I	stx	%r20, [%r12 + 0x0020]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe411a010  ! 209: LDUH_I	lduh	[%r6 + 0x0010], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42ae000  ! 211: STB_I	stb	%r18, [%r11 + 0x0000]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe60b6010  ! 213: LDUB_I	ldub	[%r13 + 0x0010], %r19
	.word 0xe8318008  ! 214: STH_R	sth	%r20, [%r6 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe2130008  ! 216: LDUH_R	lduh	[%r12 + %r8], %r17
	.word 0xec5b0008  ! 217: LDX_R	ldx	[%r12 + %r8], %r22
	.word 0xee29e010  ! 218: STB_I	stb	%r23, [%r7 + 0x0010]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xea72e030  ! 221: STX_I	stx	%r21, [%r11 + 0x0030]
	.word 0xea21a010  ! 222: STW_I	stw	%r21, [%r6 + 0x0010]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d02ef100, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r9
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d06ef0c0, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xec3ae020  ! 227: STD_I	std	%r22, [%r11 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec018008  ! 229: LDUW_R	lduw	[%r6 + %r8], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0732010  ! 231: STX_I	stx	%r16, [%r12 + 0x0010]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe20b6038  ! 233: LDUB_I	ldub	[%r13 + 0x0038], %r17
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8298008  ! 236: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe8426028  ! 237: LDSW_I	ldsw	[%r9 + 0x0028], %r20
	.word 0xe0718008  ! 238: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xec318008  ! 239: STH_R	sth	%r22, [%r6 + %r8]
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe832a020  ! 242: STH_I	sth	%r20, [%r10 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xac430008  ! 245: ADDC_R	addc 	%r12, %r8, %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe2098008  ! 248: LDUB_R	ldub	[%r6 + %r8], %r17
	.word 0xe4236018  ! 249: STW_I	stw	%r18, [%r13 + 0x0018]
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xea526020  ! 251: LDSH_I	ldsh	[%r9 + 0x0020], %r21
	.word 0xe8198008  ! 252: LDD_R	ldd	[%r6 + %r8], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe6330008  ! 254: STH_R	sth	%r19, [%r12 + %r8]
	.word 0xec124008  ! 255: LDUH_R	lduh	[%r9 + %r8], %r22
	.word 0xe4432020  ! 256: LDSW_I	ldsw	[%r12 + 0x0020], %r18
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r9
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe62a4008  ! 260: STB_R	stb	%r19, [%r9 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xaa82a020  ! 263: ADDcc_I	addcc 	%r10, 0x0020, %r21
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xa0334008  ! 265: ORN_R	orn 	%r13, %r8, %r16
	.word 0xee3b4008  ! 266: STD_R	std	%r23, [%r13 + %r8]
	.word 0xe6124008  ! 267: LDUH_R	lduh	[%r9 + %r8], %r19
	.word 0xe2436028  ! 268: LDSW_I	ldsw	[%r13 + 0x0028], %r17
	.word 0xea2ae018  ! 269: STB_I	stb	%r21, [%r11 + 0x0018]
	.word 0xae3ac008  ! 270: XNOR_R	xnor 	%r11, %r8, %r23
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe23b0008  ! 272: STD_R	std	%r17, [%r12 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839e018  ! 275: STD_I	std	%r20, [%r7 + 0x0018]
	.word 0xec130008  ! 276: LDUH_R	lduh	[%r12 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xea334008  ! 278: STH_R	sth	%r21, [%r13 + %r8]
	.word 0xe82b4008  ! 279: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xe8426018  ! 280: LDSW_I	ldsw	[%r9 + 0x0018], %r20
	.word 0xe6124008  ! 281: LDUH_R	lduh	[%r9 + %r8], %r19
	.word 0xe21b2018  ! 282: LDD_I	ldd	[%r12 + 0x0018], %r17
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xaeab2000  ! 284: ANDNcc_I	andncc 	%r12, 0x0000, %r23
	.word 0xa612c008  ! 285: OR_R	or 	%r11, %r8, %r19
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0428008  ! 287: LDSW_R	ldsw	[%r10 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa22b4008  ! 292: ANDN_R	andn 	%r13, %r8, %r17
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec134008  ! 294: LDUH_R	lduh	[%r13 + %r8], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe632a000  ! 297: STH_I	sth	%r19, [%r10 + 0x0000]
	.word 0xa6b9a000  ! 298: XNORcc_I	xnorcc 	%r6, 0x0000, %r19



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

setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xcf00beef00, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xef00beef00, %g1, %g3
stx %g2, [%g3]
!=====================

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

done;

h_bad_end:
        ta T_BAD_TRAP

.global  My_0x30_trap

My_0x30_trap:
  !inc %l4
  done

SECTION .NCDATA0  DATA_VA=0xd01ee000

attr_data {
        Name = .NCDATA0,
        VA=0xd01ee000,
        RA=0x8010000000,
        PA=0x8010000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base0
ncdata_base0:
        .skip 1000

SECTION .NCDATA1  DATA_VA=0xd02ee000

attr_data {
        Name = .NCDATA1,
        VA=0xd02ee000,
        RA=0x800e000000,
        PA=0x800e000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base1
ncdata_base1:
        .skip 1000

SECTION .NCDATA2  DATA_VA=0xd03ee000

attr_data {
        Name = .NCDATA2,
        VA=0xd03ee000,
        RA=0x800f000000,
        PA=0x800f000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base2
ncdata_base2:
        .skip 1000

SECTION .NCDATA3  DATA_VA=0xd04ee000

attr_data {
        Name = .NCDATA3,
        VA=0xd04ee000,
        RA=0xc000000000,
        PA=0xc000000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base3
ncdata_base3:
        .skip 1000

SECTION .NCDATA4  DATA_VA=0xd05ee000

attr_data {
        Name = .NCDATA4,
        VA=0xd05ee000,
        RA=0xd000000000,
        PA=0xd000000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base4
ncdata_base4:
        .skip 1000

SECTION .NCDATA5  DATA_VA=0xd06ee000

attr_data {
        Name = .NCDATA5,
        VA=0xd06ee000,
        RA=0xe000000000,
        PA=0xe000000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base5
ncdata_base5:
        .skip 1000

SECTION .NCDATA6  DATA_VA=0xd07ee000

attr_data {
        Name = .NCDATA6,
        VA=0xd07ee000,
        RA=0xf000000000,
        PA=0xf000000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base6
ncdata_base6:
        .skip 1000

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
	.xword	0xc753197e8acc3b3d
	.xword	0xf2172aa124eca766
	.xword	0xbb1a32b88417df70
	.xword	0x600e0aeed199e275
	.xword	0x4c7f20e11eafee78
	.xword	0xf3a9710be01ad74b
	.xword	0xf808ab841ce5642d
	.xword	0xb4c4a5f93a0875f9
	.xword	0x17e1928f306b27c7
	.xword	0x75d9b46b286e20a2
	.xword	0x68b937ef07625857
	.xword	0x925d0b1e118c0dc9
	.xword	0x4f84c35154daa432
	.xword	0x742ab441b0484de7
	.xword	0x4c6225409339e7e3
	.xword	0xb10b56d08cae11c6
	.xword	0x6fe256cff36def18
	.xword	0x5dd68c41ec3fa3ac
	.xword	0xc78d4659f15f35ed
	.xword	0x4abf3bb4d08f2b11
	.xword	0x1e6a081f9bac5f57
	.xword	0x1a5ed3331fe1d072
	.xword	0xbd416af87fddf454
	.xword	0x89488caaa032fe00
	.xword	0x71d097815b4a991e
	.xword	0x392fedaf4fb91560
	.xword	0xa91b599458bf73d0
	.xword	0x741efca8a75db2b0
	.xword	0x1981204ea94c43a2
	.xword	0x3571d0f504c951d2
	.xword	0x7b6d5b3a0a1242c5
	.xword	0x4a28351b7d2d9967
	.xword	0x84ceb902f09eb68b
	.xword	0xb5e3e4607a37c6eb
	.xword	0x1c93e2fa639c2608
	.xword	0xfa8d77808d97919a
	.xword	0x933f2c230362af3c
	.xword	0xbca57147f6d57e06
	.xword	0xdc961d107e4eced2
	.xword	0xa9fc6dfd45b08bee
	.xword	0x1ce6f126d3923382
	.xword	0x65765199cd40d5b0
	.xword	0xe94421fa14ef1da1
	.xword	0xeee5a6d652025cbb
	.xword	0x161b7a95c8768445
	.xword	0x87c472e7324b3862
	.xword	0xf02638c48b238b1f
	.xword	0xe575ef34957ccd7c
	.xword	0xc157bf8ca8775385
	.xword	0x5ad609aa4c72bde4
	.xword	0xf3081c83dce53841
	.xword	0xc3b904ada797e7be
	.xword	0x76d02e0ef0efc71b
	.xword	0xea9458135aca61da
	.xword	0xefdeee77f9664cf4
	.xword	0x9298557b717c72a3
	.xword	0x0837c41f42850a80
	.xword	0xc667fa9d81f7239e
	.xword	0x0c2815bf396f83d7
	.xword	0x6b81aa6e6f786345
	.xword	0xa34b911b8b6b41d0
	.xword	0xd0e6e726ba90fc16
	.xword	0x41aed1b3bbcc67e1
	.xword	0x72340eb52f15c762
	.xword	0xa63a5a6d2737621e
	.xword	0xa451d1acbc705853
	.xword	0xa6dd11aa45f9feaa
	.xword	0xc8b3498ddd2b13c8
	.xword	0x49edb28e2a35d6c2
	.xword	0x99d5b6ecb914587d
	.xword	0xa19b9d8588b94936
	.xword	0xe2909a6fad65562d
	.xword	0x444235e42781ae09
	.xword	0x7ca7bb495cf28e10
	.xword	0xa5aa6e7d8786f852
	.xword	0x6b869767bbffda25
	.xword	0x1c72fd9c598e8148
	.xword	0x527ac81c1e98ca13
	.xword	0x7b0baf57113262d5
	.xword	0x1e5f474230c2f691
	.xword	0x64d7bd52d08bdf55
	.xword	0x767eb46076f56b6e
	.xword	0x8fc0570fa946083e
	.xword	0x7dbbe27fb977d444
	.xword	0x51d858f18ca19028
	.xword	0xa314cdc324d70b15
	.xword	0x4ef330ea31117380
	.xword	0x66e6ce3d73356de8
	.xword	0xb52993301a83958f
	.xword	0x10fab874f312e73e
	.xword	0xb54446074a12be8a
	.xword	0x68605a7836404856
	.xword	0x13c7a74717243f14
	.xword	0x95746ff8c5c63f15
	.xword	0x768cf644455b8651
	.xword	0x33e4e855938cc4d7
	.xword	0x6fa8bad7de7421cd
	.xword	0xa5ab017b974ef34c
	.xword	0x7f3c854c2eb3c732
	.xword	0xa2046df4f8b0d4d5
	.xword	0x3f8ecb5864dacfcb
	.xword	0xaadefd04fe11e658
	.xword	0xf3267c5f03ed0388
	.xword	0xebedc9f3edf19807
	.xword	0xa1b37496a13a79d0
	.xword	0x08fb5420a164b779
	.xword	0xfa198988f49c258d
	.xword	0xd9dd6cad04603591
	.xword	0xe5357bb900a19aeb
	.xword	0x94860e0156745f3b
	.xword	0xde01e5a4079dcae2
	.xword	0x0cd0937cfc1584a4
	.xword	0xba21e13379a7549e
	.xword	0x2305bbccb07938a2
	.xword	0x65eb5649dc8faf59
	.xword	0x4cb854ee11e685de
	.xword	0x820b82091106b392
	.xword	0x8c4bf11f3ba72f2d
	.xword	0xfa0a8bb442b60faa
	.xword	0xf8ecf7382af34a32
	.xword	0xf84ea8ceb6cd84f3
	.xword	0xd351ee981d89c02e
	.xword	0xaac494b347a255fe
	.xword	0xe30b57b870ed0616
	.xword	0xb4e359d0a8f45714
	.xword	0xa1d338cba429c472
	.xword	0xb3d2870831b9ba78
	.xword	0x307cae337e6d8c84
	.xword	0xdf12104560971a7e
	.xword	0x808c4d0dc1964c40
	.xword	0x542efb9da8af6ecd
	.xword	0xcc44d1a89beea29a
	.xword	0xd91558a7a9e95f97
	.xword	0xa5955fbad38ec1c3
	.xword	0x3e980f4b790af98d
	.xword	0x7b1b906b26816d48
	.xword	0x29cfc73035efbd53
	.xword	0x920af6516d176f97
	.xword	0xac411832f58cbbf8
	.xword	0x4856e1e5bb09ec23
	.xword	0xd9973d005e40dc4b
	.xword	0xf35bcf0a3cdc4c88
	.xword	0xcb0758b890982265
	.xword	0xd8628da5e8288489
	.xword	0xdb39c9f4ff63db02
	.xword	0xfa500a17ef7b5c69
	.xword	0x95584e79113779ad
	.xword	0xd2a884bd7817bc49
	.xword	0x2fa1f85d3e9a3cea
	.xword	0x8c8d7077e0e196ec
	.xword	0x53f7bdc99fd87bf8
	.xword	0x2e69a21d3067c4bf
	.xword	0xc65bd765823751c2
	.xword	0xd12060df73608593
	.xword	0xdb41f481641cc007
	.xword	0xf8c514bfff2afb25
	.xword	0xa320207e3b6320d9
	.xword	0x15a075e1a3940836
	.xword	0x5d3242e4af00eb32
	.xword	0xbd7dc3db82cb9e0f
	.xword	0x92479ed5c1566e4f
	.xword	0x91cba4f5eba05d4c
	.xword	0xcaaf50379fca7741
	.xword	0xfc56ecb240dad8e8
	.xword	0xbd6ef7999ac51632
	.xword	0x36ca6a7bdbeb74a7
	.xword	0x051566e940cc5a29
	.xword	0x7bb21549537e1b35
	.xword	0x3f7045086b1d86de
	.xword	0xc71ed49dcba41938
	.xword	0x8ed1c974f6436388
	.xword	0xc484257db7aa7bb8
	.xword	0xd556d78553781c30
	.xword	0xa94f822a4a7eb2ec
	.xword	0xb865a31ee587b1ec
	.xword	0x074f9233194ed442
	.xword	0x73b31b8a1728bc72
	.xword	0x17d26f533d933c2f
	.xword	0xdff2d451f84df2f5
	.xword	0xa3e9669c004945d2
	.xword	0x4364574b170d5d21
	.xword	0x3184a87bba9dc8a9
	.xword	0xeceb67a97deef933
	.xword	0x836af91695f9e3f1
	.xword	0x603ea9786d587ea8
	.xword	0xf7890432877394bc
	.xword	0x1b189b3a4acf3526
	.xword	0x423566673f56cf33
	.xword	0x5270288737340f1c
	.xword	0x4f87a37504fe8aec
	.xword	0x25dd26068d2cbbc6
	.xword	0x31374b2f4cee1081
	.xword	0x4cc86b680ed690ea
	.xword	0x20cf5fa279bac974
	.xword	0x9e2b864c5719a313
	.xword	0x52edd72d6cda5554
	.xword	0x712a386aa903f8d8
	.xword	0xf0626b35ea092e34
	.xword	0x1bdc0723d340a6f2
	.xword	0x000e5447d5305ebc
	.xword	0x203c78dddbeb058d
	.xword	0x684026eae61fc6c8
	.xword	0x9b7d204cb5c36ad6
	.xword	0x7d18e4b862e232b5
	.xword	0x89223aee6169a0c1
	.xword	0xa0cd8c4d971f6328
	.xword	0x0d865ef66728592d
	.xword	0x3c7bf4e9ffd03fa8
	.xword	0x18d14b8cf8e2a71a
	.xword	0xd3e43c9eef919a46
	.xword	0x4d43097db4d1c7cb
	.xword	0xdf1d34fbdbcc5459
	.xword	0xe880b838e9136a92
	.xword	0x04d9f1ef6d38b070
	.xword	0xebcb4d276d9ada68
	.xword	0x3ebb6b18fcf4c1d2
	.xword	0x715b88c144c0f444
	.xword	0x7cb2abe29f0732b3
	.xword	0xf3efb0b1ed5aaad6
	.xword	0x54f0554effe25446
	.xword	0xeb2a380596378fb2
	.xword	0x195a2ba804ce19d1
	.xword	0xa52fa2e442d19223
	.xword	0xd412a1e55c722cdc
	.xword	0x6f4ebf9afef84bc0
	.xword	0x83249beefe922cae
	.xword	0x4806f08c970c954c
	.xword	0x44c35b3b6574d162
	.xword	0x44a55e56bddf4323
	.xword	0x6d626b5e14683305
	.xword	0x08f9beb27aacd538
	.xword	0x13ee0c3d92b58858
	.xword	0xd9ba7e405d62b19f
	.xword	0x90cac8c594a37d9e
	.xword	0x0087f4de4ca09483
	.xword	0xa96124b08e56b774
	.xword	0x347575f4a0a94a90
	.xword	0x2af70b5e11550420
	.xword	0xbecab5e2efd95c0e
	.xword	0x2fa74c43c2f49f27
	.xword	0x767654ab236ec88d
	.xword	0x33027613f4df8ca4
	.xword	0xd599bcfee59e61dc
	.xword	0x5f97b102f22dbd71
	.xword	0x47c615cdf7ad5e6b
	.xword	0x50642d664e3344ac
	.xword	0xded755fddb64b831
	.xword	0x7c72814996a45d02
	.xword	0x4917855a416f722f
	.xword	0xaaa715c2c0d5a1b1
	.xword	0x16da1881faf5d3a1
	.xword	0x68f6d84bc729f8ae
	.xword	0xee07123fa3a32316
	.xword	0x91170e30a56b84ab
	.xword	0x0358076e74c45352
	.xword	0x323f108b8ea0b845



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
	.xword	0x936663c2bdc4dd13
	.xword	0x9946f4fb20dd27aa
	.xword	0x651c22215462a551
	.xword	0x62562a451305984a
	.xword	0x88056bd8c45660d2
	.xword	0xd816301b768c51d2
	.xword	0x0deaf0a810a8dbe5
	.xword	0x1d6c9994650ea9b9
	.xword	0x04f4d492f4d70a7b
	.xword	0xd22e14025d2fdb35
	.xword	0x30885931ef918334
	.xword	0xf72e6027aa926192
	.xword	0xebf445f362a9875f
	.xword	0x2c3e6b88e1f27cbb
	.xword	0xb2ad729e63fa6413
	.xword	0xbbfe10e088476adc
	.xword	0xbd8e83f25a9c4fc5
	.xword	0xc8555cdc29230a11
	.xword	0x4d1a1e5d9bd4c77f
	.xword	0xcb610db3850f5d3b
	.xword	0xf7b598d11f1bda04
	.xword	0x30464cd9076fdc0b
	.xword	0xce2c3c90f748b4e4
	.xword	0x11b04e89824a3cb1
	.xword	0xe5a9db1cb2fc5cbc
	.xword	0x3177532fb7bc9a3d
	.xword	0x3a71a6180d0d3489
	.xword	0x932101428926ee3b
	.xword	0x4801b57d6628293c
	.xword	0xff2bd0bec2dd8bc0
	.xword	0x6dcc3ed7dbd4eeb6
	.xword	0x35e52ce6d6809340
	.xword	0xf5c28e23a1d6a823
	.xword	0x3e9b2c3b957e20d3
	.xword	0xff1754cc0f862d88
	.xword	0x86c85fee59055177
	.xword	0x3a74b56b1f0fd5d4
	.xword	0xbb6d6d8511ea5392
	.xword	0x6ab1f9a651982e1c
	.xword	0x172229a9cc9f62d1
	.xword	0x86ae08b9aaed3150
	.xword	0x206ff4c99c8a80d4
	.xword	0x6a89536fe6cccf0f
	.xword	0x9c8affbad1eb44e4
	.xword	0x25149aa6569b43ef
	.xword	0x41674424f0008a2c
	.xword	0xc12b55fba030960c
	.xword	0xca7d537fd211e003
	.xword	0xd50d0eaac3b03fa6
	.xword	0x9290222192e9245b
	.xword	0x5c8dbe87604ef4c4
	.xword	0xc693e03a672fa30f
	.xword	0x8c1de3a470330d0f
	.xword	0xc7abe2b96e29dd1b
	.xword	0x63b472834ade4c64
	.xword	0x4d876a6177ecc965
	.xword	0x31c9367aae2b466d
	.xword	0xfb96d791356697ad
	.xword	0x5ff86e18959670c2
	.xword	0x155f9de85e92168e
	.xword	0x6fc98a36dbea19a4
	.xword	0x0923ebcff6952943
	.xword	0xeaa71c919d46f18e
	.xword	0xccb8cde14e2cc828
	.xword	0xf8ef92620b3f8b3d
	.xword	0xa99cc4bf7dbbffd5
	.xword	0x0f8e6b929739a533
	.xword	0x83b5d0e3c101d372
	.xword	0x4dbc97789c3d01bb
	.xword	0x3434c8c9b6ef668c
	.xword	0x27cc9f27b0ee9ac4
	.xword	0x2fba2ebbdc8d3568
	.xword	0x7430d0a182a91ce4
	.xword	0xa4cc07e56c891100
	.xword	0xac0e1d89e74738b6
	.xword	0x7bd43082a438114f
	.xword	0xb1890fbd56bceb00
	.xword	0x2470dc1a6efd11a0
	.xword	0x7cde3801b4f23481
	.xword	0x224b04b3badd2a04
	.xword	0x9cc78364f17d4697
	.xword	0xb59acbaaa4152955
	.xword	0xcd592628523f120e
	.xword	0x48c0f87d2dcbe0b4
	.xword	0x8ed2008c1e6a2fda
	.xword	0xdc4e12e342e109d6
	.xword	0xe251953289e0f5ef
	.xword	0x6ae86759bc50f7ea
	.xword	0x64dbf3e682d8398e
	.xword	0x7f44571534558609
	.xword	0x5a5691fe0e1a5d20
	.xword	0x53d57fb95b319aac
	.xword	0xd2ac9ec8c2c8a9ee
	.xword	0xedd6d6257ffeda39
	.xword	0x68b52bcd6461bcca
	.xword	0x8e19c4f97d75b3ed
	.xword	0xadc508aa1c898f0a
	.xword	0xce64b4673e5c2a72
	.xword	0xdb28a2bb2de3cb2b
	.xword	0x06fe466fae594524
	.xword	0x40612a844119062e
	.xword	0xb1b7ee1cf66866f8
	.xword	0xc2eb145821d40fd4
	.xword	0xf0c7d066e3b9b991
	.xword	0x9a5ae906e00d1e49
	.xword	0xc82ad7ac94f46105
	.xword	0x366eb988e0e92409
	.xword	0xdb317a2a41ca3ccb
	.xword	0x418cc6ae0381a56c
	.xword	0x92da9f8661605910
	.xword	0xa09413f2c511621b
	.xword	0x1844bbe94e73b7bc
	.xword	0xbccb4179eea705be
	.xword	0x99d4cbbb8d21b653
	.xword	0xf87a389e30089e66
	.xword	0xcd967851be79e6bf
	.xword	0xabf9f8d2db8c7570
	.xword	0x9b5562476cc0bd96
	.xword	0x45ae091302ba04a1
	.xword	0xc8c0a3ef1cd2f072
	.xword	0x537d55126129dffa
	.xword	0x88be8dbceabaed7c
	.xword	0xdf1243c334fb7e16
	.xword	0x4c900c8d0f35a23d
	.xword	0xf2e5188d7ffd8c8c
	.xword	0x760974e4bebc5b07
	.xword	0x5d8f4db57c31167f
	.xword	0x4a3c4e06d46d6daf
	.xword	0x3cf478b902798314
	.xword	0x3057181d5c1dea57
	.xword	0x1fb7c80a21648f37
	.xword	0xd32775bb446b4898
	.xword	0xbf5a8b9e216c02e2
	.xword	0x3464390d0f78989e
	.xword	0x0d4e8fbf3d5c0394
	.xword	0xb394c14dd5d647ca
	.xword	0x27f7d3aed30468b7
	.xword	0xe7dd2aaa88dee2e3
	.xword	0x4af15f5521048128
	.xword	0x017cbb3605790d32
	.xword	0x1077cdefd96f12e7
	.xword	0xe84d782822b8b034
	.xword	0x073274425fc401b2
	.xword	0x73a41ed633f76316
	.xword	0x542b4e75750064fb
	.xword	0x77c7424fc32f24ea
	.xword	0xf8c4956efa85b680
	.xword	0x365dea1ff944f4ab
	.xword	0x2302bdc6bcea4b0d
	.xword	0xdef3004679de3754
	.xword	0x73ad09354272d365
	.xword	0x9341607541c68393
	.xword	0x5acb13d664c3359b
	.xword	0xce648ec2bb8ab555
	.xword	0xd3d92b3d77aa6dc7
	.xword	0x0fe0e176f1c87c2f
	.xword	0x9ba8266c316c38f1
	.xword	0x4b0edaa578d58c07
	.xword	0xf4ca77f536326b25
	.xword	0xec9fee8db2523d79
	.xword	0xabe614089837beba
	.xword	0x0b9564981e109474
	.xword	0x1e1bdcaf1b6628e5
	.xword	0xdf24d20187545a91
	.xword	0x48a3fcf2063654ac
	.xword	0x8bf369f26ab2bf6f
	.xword	0x3ebf5019ecc6e5bc
	.xword	0xcfee17ffc46dd1c8
	.xword	0xed83217fd3ed7fde
	.xword	0x43d04f88c2e4d3aa
	.xword	0xd61fb297294777d7
	.xword	0x8ee9ddcd1f13b083
	.xword	0x4b2bfc09e8cbc4db
	.xword	0x479a00416dc2f341
	.xword	0xfb921e35e965f307
	.xword	0x4bcb70d4d2f3c03a
	.xword	0x226868fc8256eab1
	.xword	0xda8deb0f78a7573b
	.xword	0x8f1584889874beae
	.xword	0xfee457140229f528
	.xword	0x1a323d7bfaa3831a
	.xword	0xd3d902661447699d
	.xword	0xc12e3026ed52c1f9
	.xword	0x75a794ef4cbb3631
	.xword	0xe3f0e57d9bfaa8af
	.xword	0x073781ab15c9efd5
	.xword	0x6c50b08b7cac2901
	.xword	0x76c2205691bf0cf8
	.xword	0xb09f88748d74ed6c
	.xword	0x7852bd8352309601
	.xword	0x78557b33cc1e7bfd
	.xword	0x7888adfe97ce3e77
	.xword	0x365fc54dc15e619c
	.xword	0xb29587b3f8ffbdb9
	.xword	0x4012a9648a437cdd
	.xword	0x2652813e25722a54
	.xword	0xde753ec3b2fb2f3e
	.xword	0x2899b7f837a5c25a
	.xword	0x4b1436ffc42cd0df
	.xword	0xccd3c29d6cd82446
	.xword	0x906dea255080a18b
	.xword	0xc91932cd2cd257f3
	.xword	0x923191bd78575e17
	.xword	0x5ad56b6939ed8505
	.xword	0x65cd5779b4346349
	.xword	0xb937657f9c272fea
	.xword	0x91943a8a1865a114
	.xword	0x609f6be4b966425d
	.xword	0x71195ae989fc6d98
	.xword	0x3fe000ec12cd0d00
	.xword	0x428fc2d0d34f116e
	.xword	0x87d3461fd013f881
	.xword	0xdc7cb7408dee4147
	.xword	0x6691d60073132372
	.xword	0x63e98a2e1e550560
	.xword	0xdca739d2b13e4df7
	.xword	0xe43263f1396a5dcb
	.xword	0x99f390a11d3eff89
	.xword	0x237bd5b02cde429c
	.xword	0x30ec09c7df87a621
	.xword	0xdad821448eb51b2d
	.xword	0x1779fd989411f71c
	.xword	0x8b79089b1c99c822
	.xword	0x2e3b33ea25ca57b4
	.xword	0x3463e42791d1a825
	.xword	0x853a295f22794ca2
	.xword	0xbda6dde95e5ecb35
	.xword	0xf78e3f257fb46620
	.xword	0xa47cacaaa569be4d
	.xword	0xe92703bc753a8767
	.xword	0x04a3bcdb17ebed7b
	.xword	0xc65ace398a7fe882
	.xword	0x131fe3d075eab954
	.xword	0x34aa55f6ec865114
	.xword	0x8f9c8e7bbe466943
	.xword	0xa01befb25151ae08
	.xword	0x4ed417d083b2824d
	.xword	0x509f752863db9a6b
	.xword	0x7ca40ed386780058
	.xword	0xd4152900678371d8
	.xword	0xb9da259a68f33621
	.xword	0x8c7b744904e5d45b
	.xword	0x81824871a1531bfa
	.xword	0x0331cc410ea3e9c0
	.xword	0x2dee5f334169d36f
	.xword	0x1ebc87c24c05bee0
	.xword	0xf4033bcdc318041e
	.xword	0x9e14e33485351fdc
	.xword	0x18e76f38ed632a6e
	.xword	0xfeb4c9f24fdb6b45
	.xword	0xd1b4d7a8c6f11cbe
	.xword	0x8f6d6c9f83b7cd72
	.xword	0x032724b6f51e465e
	.xword	0xf96911be69efb085
	.xword	0xa3b285e695f328d2
	.xword	0x8df5983fd10554aa



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
	.xword	0xaacc1149c77de048
	.xword	0xd594c1abe849418a
	.xword	0x0b26b3e218c06b86
	.xword	0x2d17a651c54b0ccd
	.xword	0x0de716a8ec733cb2
	.xword	0xe8e14214665db33e
	.xword	0x5f103c74710b1f9b
	.xword	0x55f33e2b6f8e5331
	.xword	0xc61481198a4aef44
	.xword	0x9640d05bc5abb212
	.xword	0xb746e896a018aa86
	.xword	0x87adf0f652cdfef5
	.xword	0xa81eb198b9401153
	.xword	0x5e66d7911ffb39b2
	.xword	0x537437e0400cfbf0
	.xword	0x5c288aea5e23f21e
	.xword	0x12bee740f10817f0
	.xword	0x079aac48fc243a9f
	.xword	0xe312d8f534f48f14
	.xword	0xcc7f97b479a7e02c
	.xword	0x2357a409d695e1a1
	.xword	0xfcab98dde5512a9c
	.xword	0x02f3c5d7f517f26a
	.xword	0xaa20bbbbdc4c9734
	.xword	0xe420477ae943fbd9
	.xword	0x81343e52d78f4930
	.xword	0x80a686cf9a1ed582
	.xword	0x7e63113a786c5cc9
	.xword	0xa9412753510565a4
	.xword	0xc23f2c1592535fa9
	.xword	0x8d6b8646f690beb4
	.xword	0xd065361f927ec9f6
	.xword	0x53ee2a13fb0e16a6
	.xword	0xc21eeeb88e1fffa4
	.xword	0xe8be6a3141393a97
	.xword	0x3085d89ccd421314
	.xword	0x859708a05472d59a
	.xword	0x76f68ae168ea30b1
	.xword	0x18ff3220aa0dedce
	.xword	0x67969645586fe4e1
	.xword	0xa15b277097fb650f
	.xword	0x6e0ddd3d50e1d8ff
	.xword	0xee516100c500ebb7
	.xword	0x25300adfacb77a63
	.xword	0xab036c32746d25c4
	.xword	0xd527457026372527
	.xword	0x95820317a02d50f9
	.xword	0x0c891bd0e75e71ea
	.xword	0x015d47a8340c349c
	.xword	0x23ce94ce13cbf91c
	.xword	0xb95a8f92ed92cef9
	.xword	0x43e9088a69c2b59e
	.xword	0xb5bc15ccd9db505f
	.xword	0x64d95d9965276831
	.xword	0xc7787eaff40a46fe
	.xword	0x445a3845bd546065
	.xword	0x7e8563fcc38e3342
	.xword	0xaae57a6255af1d93
	.xword	0x2dc71f6a3048dc4a
	.xword	0xe41401f309e3c95e
	.xword	0xb660146bc9f05f58
	.xword	0xffe8dab04160e2f1
	.xword	0xba48e5ac6d633ef8
	.xword	0x3244c8726fb7b0e1
	.xword	0x13fc6d69a0260a6e
	.xword	0x193d1f3aee5c6ef6
	.xword	0xf310ec6a61a70c0d
	.xword	0xb474011a35554429
	.xword	0x18a6e44ad190e3b5
	.xword	0x19f0d51c10678806
	.xword	0xf55339e25aa486f8
	.xword	0x808c056c7fdd4615
	.xword	0x31b2565cfff6eac2
	.xword	0xafd67a77bd9c247d
	.xword	0x2c30981093538eeb
	.xword	0x29d497f061ffc95b
	.xword	0x9af0d73e0b35d175
	.xword	0xb4ccc8e9d9bc1ebb
	.xword	0x36d9e53a485edfac
	.xword	0xf7a4e3a0d40b529b
	.xword	0x0befca926c618a10
	.xword	0x88896500d82527c4
	.xword	0x2f427e181ec2ec33
	.xword	0xa0da68da105e6310
	.xword	0x51f29c647dbbdd9f
	.xword	0xd5e1bce465e1c7eb
	.xword	0xf2226d48f175ce55
	.xword	0x2a6b8079cd6ab6ae
	.xword	0x747fcffa3e7abea2
	.xword	0x34cb79da0b238d40
	.xword	0x6fe3c51e8496be57
	.xword	0xbdb7bce244f7ed5b
	.xword	0x9e31b0bdac21fd64
	.xword	0xb019ef8fac97b0f7
	.xword	0x7c68546a5527c796
	.xword	0xae3356bc9b5e76dc
	.xword	0xd17e140c33392e76
	.xword	0x8893415bfffe789a
	.xword	0x5f3acfb879b3a34a
	.xword	0x46f2ca9cb768e5a6
	.xword	0x65b33da2de36045d
	.xword	0xa1c9cd9cad329009
	.xword	0x7aa16f5e250614f4
	.xword	0xb180564d30af38a4
	.xword	0xe6a92943a437671f
	.xword	0x5c131063290b5a25
	.xword	0xd189b47b4c2f3d8a
	.xword	0x7ead36940474f5f8
	.xword	0x327a239dc5372748
	.xword	0x858693d7b32e6bdb
	.xword	0x8bd6af4a9bd344e4
	.xword	0x497cdc3931bed639
	.xword	0x7ae2da4736ca5f70
	.xword	0x6d8330fb704434f3
	.xword	0x7984b01624711267
	.xword	0x6c704868e8257984
	.xword	0xe4cbb68d07ec9de1
	.xword	0x53aa6bacd8af2c65
	.xword	0xd5a3db8f07f773ab
	.xword	0xb1e219ce933e3a8a
	.xword	0x2151c952f1cbb9e8
	.xword	0x7b548463cdca5108
	.xword	0x7311bdbd6165411f
	.xword	0x585356db1172c236
	.xword	0x884c59e6f3dc4c74
	.xword	0x614bbc5dd8189706
	.xword	0x4fca07c8472925c6
	.xword	0xf8fb82a0c4ddf7cc
	.xword	0xfcde0aacd5897e45
	.xword	0x17df9624d980b7b0
	.xword	0x575aaf52537e1d18
	.xword	0x3369e1f7e38557e1
	.xword	0x004c1430339087a2
	.xword	0x2a8ccabd12a28a60
	.xword	0xfbc1728e9d36ea8d
	.xword	0xfb358bda9ca6f730
	.xword	0xb5af5dbe87165893
	.xword	0xf816e56be581711f
	.xword	0xcbbf3fe9c54512f8
	.xword	0x69687a1462f12a26
	.xword	0x27227e5257918e2d
	.xword	0xa50228983185adfe
	.xword	0xdf4d7dbc31c0ed81
	.xword	0xec90fbe95e5f3c3c
	.xword	0x571ff8c6d67673e7
	.xword	0x58ba2eaeb8849c27
	.xword	0x76658f9db02d1714
	.xword	0x9ea4aa934479a569
	.xword	0xbe69a98c35f1ac3d
	.xword	0x5ad7366b97f69eb0
	.xword	0xb2758f6cd1629a1f
	.xword	0xe4f91f99d6e4ef2e
	.xword	0x93544a2e56f2b8fa
	.xword	0x7acd2566a07ee113
	.xword	0xe6934e97d1bdcce0
	.xword	0x8b8ab2d6d118816b
	.xword	0xbb9f47d8b75419e8
	.xword	0x2dd9a10c226f298d
	.xword	0xe8347d40d36b3fdb
	.xword	0x240bfec262ee5991
	.xword	0x11c71e61e3097e52
	.xword	0xf7d11d7fa79497fe
	.xword	0x5ba99a61fb774ade
	.xword	0x8212bbe41e1a9861
	.xword	0x84cab9a8374edef7
	.xword	0x134fe0d4027d68cc
	.xword	0x3eebe532ad9d85da
	.xword	0x512d999f36784429
	.xword	0x59c894a2099bdd53
	.xword	0xf42c36b3fcc935f7
	.xword	0x1ca37831f9bf4b04
	.xword	0x59e50a74188b5349
	.xword	0x9e3ab0c2c47260cd
	.xword	0x1e5956914cfa92f4
	.xword	0x91628078254547e6
	.xword	0x87d64b4de65e23d6
	.xword	0x5bf484a91468a48a
	.xword	0x613988a67e456201
	.xword	0x1981c44a21bd5804
	.xword	0xbe9e8aefabdbb6e2
	.xword	0xc42f0379278fa88c
	.xword	0x185ed1cf6a8637e6
	.xword	0x8a471e5f410f3464
	.xword	0xfb6268aacbed3bdd
	.xword	0xcd6111efb0032558
	.xword	0x811cb52011d995fa
	.xword	0xf898add3a2c97236
	.xword	0xe11ea2be23505cd8
	.xword	0x203332a3346f6e31
	.xword	0x8e7a0beed9219dff
	.xword	0xd7ead7997f24b4cf
	.xword	0x84c3a4271ce4d756
	.xword	0x3026d67a83862dff
	.xword	0x26fea41ae79993a2
	.xword	0xce71d7e5f92bd9ba
	.xword	0x6efd572f5cb3fb97
	.xword	0x0b506e52953d5ae0
	.xword	0x20ce8eacd1694b60
	.xword	0x1971f756961e52d7
	.xword	0x9bcc27dff4d2de0f
	.xword	0x4009a9fa7d93ce4e
	.xword	0x7425147b6855adc4
	.xword	0x9590bcec8891c596
	.xword	0x7ac975aec044bf51
	.xword	0x55f2be11b3a76124
	.xword	0xaf98f90bb628a025
	.xword	0xd00fdf6e7e86d1c5
	.xword	0xf77c8942f447ee26
	.xword	0xdee976c72dcd7860
	.xword	0x15eed4a986f2fc00
	.xword	0x0edd4f4a1ae647fc
	.xword	0x7ce0709b6d526c6f
	.xword	0x2c79d829a4a7e030
	.xword	0x310a12df28a9c9b6
	.xword	0xf4ec79e88654d2d6
	.xword	0x2e7a3d395a4ea855
	.xword	0x744c05cdae436480
	.xword	0x5ca980ed99af66d0
	.xword	0x8dfc9e5a681ed48b
	.xword	0xa9c99135f39306b7
	.xword	0x744bb794796ae7b2
	.xword	0x9ddbb7257f21c691
	.xword	0xa100cecc300bb617
	.xword	0x8c26e32fa9196f45
	.xword	0x03c07bf882bd5a29
	.xword	0xc290e1cf921e7e6e
	.xword	0xfd509a75b10540b3
	.xword	0xb7190ed66802774a
	.xword	0x0c07673ca5399e55
	.xword	0x5dbcb81c0a36c6b0
	.xword	0x626f0874e440858c
	.xword	0xbd941504faba6d97
	.xword	0x83f42a277a1ebece
	.xword	0x149df975cc6e9aac
	.xword	0x127666421d7a0a37
	.xword	0xcdf6281634a9dc08
	.xword	0x913f49a2b4de667f
	.xword	0x6f0a0b0d60296a4e
	.xword	0x9a4a0961c5e8941d
	.xword	0xa217602b8aedd5f7
	.xword	0xd4ad4ec20f4296ae
	.xword	0xed701d9bc60d6412
	.xword	0xf56feecd49792e42
	.xword	0x9657f8b31283a362
	.xword	0xfb0548242e7d72ee
	.xword	0x0bacbcdc6dc29ad9
	.xword	0x6f9ac2c8c54a0d02
	.xword	0xee239ef9990daecc
	.xword	0x2ffd30637a14d1ce
	.xword	0x3c3e7ffc9ea916f7
	.xword	0x1075d583d7f712c1
	.xword	0x7fe211d8eb644f6c
	.xword	0x3e54743b932baef3
	.xword	0x1ed2e9dc8512a254
	.xword	0x2eb8998ffb89bafd
	.xword	0x05f2e1f1413a78e0



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
	.xword	0x7974ae03a945459c
	.xword	0x39a4e760c01ae8d1
	.xword	0xa6baed15c0ba5649
	.xword	0xcecc5ee066e7f5da
	.xword	0x83299e6eac7d957f
	.xword	0x659691a88b824e57
	.xword	0xafa0debe607a0fb8
	.xword	0x9e2dd863074e5b0f
	.xword	0x11ba31df57cf7535
	.xword	0x2d48d0a4cc032277
	.xword	0xb3327792b9a3bf21
	.xword	0x97deb224912af89c
	.xword	0x79949c7bbf6c1984
	.xword	0x2de52235c4eff074
	.xword	0xc6265a21cad1483d
	.xword	0x3f92cb43e7dc6c38
	.xword	0x1ebc409cba976c82
	.xword	0x4cd4d64edae37e5d
	.xword	0x3ee1445e21cd1223
	.xword	0x3f587e7bd31e58cf
	.xword	0xbe9c9cd7af695e4a
	.xword	0xaa08aae526052c9f
	.xword	0xe1aad5169ed2a61e
	.xword	0x407196fc236404d3
	.xword	0x2dec58e606bd19e4
	.xword	0xb6e5c4b1b6a91a2a
	.xword	0x643cfd1dc9de79aa
	.xword	0x9df255a64b63b025
	.xword	0x9ec3da5399a94b20
	.xword	0xd5053409837c6149
	.xword	0x2ae84f5ab54c8895
	.xword	0x2d878e118577703b
	.xword	0x08c92c6da1553e1b
	.xword	0x56cd8d8ed6d377c4
	.xword	0xdb209fe6d84a860d
	.xword	0x16aaf7b22399b778
	.xword	0xd92e949d0cf5b9f7
	.xword	0x0dba9e00c51ebfe5
	.xword	0xfd75c7ec9d2791a6
	.xword	0x907b05467e53d3bf
	.xword	0x73337d4d3f8e5d15
	.xword	0x1bdda096db791f22
	.xword	0xb89290d8bd008545
	.xword	0xa246710123dfd708
	.xword	0xa3ec8635ffaaabde
	.xword	0xa6dc3d31ec5663cb
	.xword	0x6d75a0ca43b93656
	.xword	0x4b2454e94b41461e
	.xword	0x67f2108db2485c28
	.xword	0x84201d5637eeb8a6
	.xword	0x03cbecb0a941943d
	.xword	0xb31ef61d46a15e91
	.xword	0x12e266a5aec9bbcf
	.xword	0x968756282d5e8781
	.xword	0xf110c38d749edc8a
	.xword	0xdaebba77abe95cf2
	.xword	0xd09720910cd78d74
	.xword	0x458f0af7cb570301
	.xword	0x71a5fded2192cf41
	.xword	0xd19bd232d7a31510
	.xword	0x4a7b5571a1fe0ea1
	.xword	0x6d8ff80a999e6b46
	.xword	0x99ab486d7ef83846
	.xword	0xb00abab18bfe2c9a
	.xword	0x6f08f7d8b48e1e67
	.xword	0xcee741e9cc958490
	.xword	0xd435ba674c53135d
	.xword	0x0de1376111e3a928
	.xword	0xbc097e23777987b3
	.xword	0x909bc6a77d13a3fc
	.xword	0xd6d109065aab6731
	.xword	0x8be55b85e4b06a79
	.xword	0xdc8d107148686c18
	.xword	0x8312b1907e121233
	.xword	0x07393082284901ad
	.xword	0xe94cf705ced6f2b9
	.xword	0x4f7744a66b9130d9
	.xword	0xb244968189dbbefc
	.xword	0xfa6482661e52c3f1
	.xword	0x9caf83f6ec38583c
	.xword	0xd15ba52b48a35341
	.xword	0x718d91faf04ed840
	.xword	0xf478a6de59af89e9
	.xword	0x82e945f091841865
	.xword	0x620e9b5dd0b5760b
	.xword	0x0835f0f4ff9f69d6
	.xword	0x9b05d9346a1d0228
	.xword	0xd61cbf99b08125c0
	.xword	0x9ec897caa36b7b24
	.xword	0x7fe4a9a7a7677198
	.xword	0x75f831908fb87606
	.xword	0x4390f2caef39f453
	.xword	0x0071e73d68c3a5d0
	.xword	0xffefc29df2865d63
	.xword	0x67c94064124785c7
	.xword	0x8817b08e7825218e
	.xword	0x853f42e42dd1b4ab
	.xword	0x94eec1820dd6e5cf
	.xword	0x0f4f6f54ae95116e
	.xword	0xacb8e5bdbddde5be
	.xword	0xd9d73545fe382099
	.xword	0x224fa5c634c8db2a
	.xword	0xec7508a911574566
	.xword	0xf2524cd22a432909
	.xword	0x114f7cb3e2277a0f
	.xword	0x349eb57c520bb061
	.xword	0x1f2961721720377f
	.xword	0x8d7de28539141a73
	.xword	0xdca4379d2d4e6452
	.xword	0x4e5e0759fb6ce211
	.xword	0x96e9342209f2d77b
	.xword	0x6b001961400d3a17
	.xword	0xd70bee991688a804
	.xword	0x61e413cdb687f650
	.xword	0x6139046b05c0ee32
	.xword	0xaa1954778b6e50f5
	.xword	0x05ddb220d1cfac92
	.xword	0xea8233385e5796cf
	.xword	0xf66cc64ec53555c6
	.xword	0x1aeec3ed9c5e1073
	.xword	0x45d56f75f8541d3d
	.xword	0x6aa41dd5cd1e1f90
	.xword	0xc584c75e8eeaed5e
	.xword	0x8145a52197533b5b
	.xword	0xc47d9177af8fd591
	.xword	0x44e9e76997367c42
	.xword	0x935db7f4531d605f
	.xword	0x8d2bf1f7add191f5
	.xword	0x8ac8b73b415142cb
	.xword	0xa3e1b787291b0b88
	.xword	0x22ca0be7c5c793c7
	.xword	0xad039d01b0a3be86
	.xword	0x0b70528f5a1b7e48
	.xword	0xf18416dd526b3c93
	.xword	0x0975888317f222b5
	.xword	0x05c1b4615973e0de
	.xword	0x4ec59e2c30a09441
	.xword	0xc6f01162ad6f1d29
	.xword	0xfb4a6b0747e1d14d
	.xword	0x52f8f34bbbab4c01
	.xword	0x34c96f25974dc685
	.xword	0x0384dda1fa4970a3
	.xword	0x99e94b3cb2eb2714
	.xword	0x8cfaf714984bc5d9
	.xword	0x948265c5eb5a965e
	.xword	0xdc97eacd411709ce
	.xword	0x52df523e08d0119d
	.xword	0x0c36251e1e6cf11f
	.xword	0x56384f23dbd991f1
	.xword	0xf3701b8741d25d4a
	.xword	0x3442bd93074faff4
	.xword	0x96ada3f910f1a6ac
	.xword	0x66a1d8cb2ad1e5f7
	.xword	0xa7131e5f92e164ee
	.xword	0x4393f9080a49fb51
	.xword	0xdd0e0acff008e1d2
	.xword	0x77c81a1329f7bd44
	.xword	0x371b13bb67a94075
	.xword	0x912113cb3bde8dbc
	.xword	0xcab60eeef17bf616
	.xword	0x87f7f6d2e9399ae6
	.xword	0xd0439949509b9a16
	.xword	0x964d25f3284614a9
	.xword	0x591eef30bc94dedc
	.xword	0xfdcd99bbfbef6d19
	.xword	0x9c43fdb63398bb12
	.xword	0x805e74354d6f98c4
	.xword	0xc3bde8b693bab2a6
	.xword	0xa39f9022afa15d53
	.xword	0xbff2be65ef3b781b
	.xword	0x0055871c42256431
	.xword	0xe1933997e7a8496b
	.xword	0x7608243bfa273e0c
	.xword	0x759614d0d6c7df44
	.xword	0x0bd6e183fd7d0ef1
	.xword	0x7fa8e1b3e130b742
	.xword	0xc30dd716bedc0866
	.xword	0x85cfad0338a1a53e
	.xword	0x8fc65acff183d4dc
	.xword	0xe371b458d3aed79e
	.xword	0x610550a8dab6d35d
	.xword	0x7aa120cb598d517c
	.xword	0xd8ac893979831805
	.xword	0x54b8368cee2f840e
	.xword	0x9f9d490cd2070851
	.xword	0xef1753e20b8b1f89
	.xword	0x78ed34d115624713
	.xword	0xb39f8d7063a58f48
	.xword	0x92dce8ff7bb13b7e
	.xword	0xb4519543b0b9ac34
	.xword	0xb0752de048dfe44d
	.xword	0x74deb9d4eda8e21d
	.xword	0x0615db13a725eef7
	.xword	0x68aba40e992bb4b6
	.xword	0xaa7f7c1a0c148a30
	.xword	0x93805802bf43e60e
	.xword	0x7429470f8af4251f
	.xword	0x86bab8dabb476ceb
	.xword	0x9f210d89c63a7551
	.xword	0x525e939d3f340353
	.xword	0xf86ffc6c82baa611
	.xword	0x086c39182e95e9f5
	.xword	0xba679ec488795a3e
	.xword	0x19c8808dd9337abe
	.xword	0xcadf728f544e9231
	.xword	0x804d160c5eb78aad
	.xword	0x3450d10e78f06059
	.xword	0xa2b530638b4f20e7
	.xword	0xe5418238afcffa7a
	.xword	0xd5c8fe893162a995
	.xword	0xa9bf8209ca79e675
	.xword	0x1320a5f1c5a345cd
	.xword	0x341a998d89f26fef
	.xword	0x9028fa306adc9740
	.xword	0xc05a8524641568bb
	.xword	0xe8368388554020c5
	.xword	0x311df072e27f4003
	.xword	0x2dfe779bc87aca08
	.xword	0x5b1548fb6452292a
	.xword	0x52ececba2e48b0eb
	.xword	0xaa7eac40be5a2154
	.xword	0x3a22c4a3c6a11dc3
	.xword	0xc7888ad3a0b13307
	.xword	0xad7f7d41c7bbcb31
	.xword	0xc41d41a12f2290c6
	.xword	0xc78b0a47aad5bd49
	.xword	0xfdbd8c3e78a57dd0
	.xword	0x53d08b5027269032
	.xword	0x4b8638ebaffae90e
	.xword	0xfc73f277b2cf8f26
	.xword	0xc2448d39e9cd7e63
	.xword	0xf4086c970627610e
	.xword	0x207e5183eecc232c
	.xword	0xff798b2905255de5
	.xword	0xb7484e2d81233bc8
	.xword	0x2616d200dd33d7dc
	.xword	0x34ac5043ced4fede
	.xword	0xe73cbb269ca4ee62
	.xword	0x5508c753e698f702
	.xword	0x1cc7be0ed81a5e9e
	.xword	0xcbeab02d4a81f035
	.xword	0x075e05d765142573
	.xword	0x198e2605b711e07b
	.xword	0x06805034917f253b
	.xword	0xbd7d54db4ec44890
	.xword	0xbd54a67e4bcb5ef9
	.xword	0x217b96dcc1e2b5ef
	.xword	0x8464ba95fc548af2
	.xword	0x48788c47363ecf93
	.xword	0xd776d68956003ae6
	.xword	0xecc248a5f9b27fb2
	.xword	0xd1d1f5e9632d7a66
	.xword	0x69995efe084b0701
	.xword	0xcf8ce711bf712ac7
	.xword	0xb7e95c51aea5c099
	.xword	0x583bdcaea5407f46



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
	.xword	0x2e990c097ee6e704
	.xword	0x4d638a5823b90515
	.xword	0x280ffbcb2a27f8e3
	.xword	0xbf459085e2fa6225
	.xword	0x8a70ddf6dfd4a067
	.xword	0x45cba853b7de8a37
	.xword	0x1758d20ad76001df
	.xword	0x3b506487d073ce26
	.xword	0x1c494eaa54cbe957
	.xword	0xb848dc5279fa4458
	.xword	0x86ea8844154c11d1
	.xword	0x032e7367d90129b9
	.xword	0x12eaa1d8a65d71f8
	.xword	0x9c963bdc81a4828c
	.xword	0x0da8017ddce29ed7
	.xword	0x9148527e80f4c8d6
	.xword	0x0105a829aa0aa662
	.xword	0xa6a917752cc6a3fd
	.xword	0xaba6a85d36b44abf
	.xword	0x8b5f25df1fd166ec
	.xword	0x6c358dac5ea8ee73
	.xword	0xe53add71d91e2eee
	.xword	0x78625927db4b9de5
	.xword	0x84535c16d631488f
	.xword	0x2a522d42ad7bac7a
	.xword	0x1c7596f3ee66db1b
	.xword	0x29efff6454c2af02
	.xword	0xf91c62277c976e4c
	.xword	0x1c3581e17b2eeff4
	.xword	0x5280869eb1173cfb
	.xword	0x5c3e71e397afe7bb
	.xword	0x95914cf884917f1c
	.xword	0x4ba195c7cee453cb
	.xword	0xe2b5504d4b6dfc30
	.xword	0x63603dda6414d1f8
	.xword	0x1bb99b6a0cc980d1
	.xword	0x5e063ea88e619f60
	.xword	0xc45dfcacb632874f
	.xword	0x041d1439e605ca10
	.xword	0xfc1adf3c2d0e8560
	.xword	0x29cd88bf3db18fe1
	.xword	0xc3bb91f0d6cdb25c
	.xword	0x71bb8944d847192b
	.xword	0xf7982d1a92ac09b5
	.xword	0xbcfde313ffffed5b
	.xword	0x9cd33de27158360f
	.xword	0x582db256d07cc58f
	.xword	0x22502bd20107ce5b
	.xword	0xc5bab36700dce49b
	.xword	0x34b7421069acbe23
	.xword	0xb3d774a455328291
	.xword	0x5b707fff1fc64e70
	.xword	0x3e668a565800d304
	.xword	0xd2b3f2f80e442d1f
	.xword	0x8757c24c2e4da10c
	.xword	0xfa62c692d85d69a7
	.xword	0xdc4fa5d33e9d83d2
	.xword	0x38922903e4c8749c
	.xword	0xfb859e6482e3496a
	.xword	0x8cb8c04f25062d08
	.xword	0x5b5a706c9405acc1
	.xword	0xe3531e95234f0184
	.xword	0xe79a2ced4ae51839
	.xword	0xb0fc0bd968734dcf
	.xword	0x7a63dd64319feebf
	.xword	0xc8f2ca662e21344c
	.xword	0x145d7982e93c67c4
	.xword	0x04640ce28c56cf5b
	.xword	0xe36b86737fff5e39
	.xword	0x6d625c9b8aa52633
	.xword	0xcd76cc4e03149180
	.xword	0x567ecec140722566
	.xword	0xbba6adcb2cf4afae
	.xword	0xb316ec3e98860d6f
	.xword	0xa51175f6385a1a73
	.xword	0x02012e0de89e70d9
	.xword	0xd70238de8daea638
	.xword	0x7b24aa48113d33d8
	.xword	0xf82067b82521abc3
	.xword	0xe44c4c063f9381d0
	.xword	0x10b1386ca0f02eda
	.xword	0x25bf020d1a8f95b9
	.xword	0xa42bb064801caf80
	.xword	0x9820a36850378d8d
	.xword	0x2eb91da742bc29e0
	.xword	0x73816a050cda7629
	.xword	0x5d904611eb12a258
	.xword	0x10b8b4523c6dc459
	.xword	0x67b16f41ed893ce7
	.xword	0x952e083246533324
	.xword	0x4ed904f8b7ff2d46
	.xword	0x30979c6b0f48537f
	.xword	0xa3fa96c091861d14
	.xword	0xd1b8e645bc4fc400
	.xword	0xddcdf2f7b4ec5b42
	.xword	0x90bcec323432ca31
	.xword	0x3ff5fd44a76edd06
	.xword	0x708990bb8b99da25
	.xword	0xdf31b4dd7afbe3cc
	.xword	0xe4c7918b191e2fe4
	.xword	0x0c0b2cbca40e618d
	.xword	0x3b123380030416ec
	.xword	0x81cdc13c6eb93ffd
	.xword	0xfd37a2e94672e425
	.xword	0x8dc5e564a425fcf2
	.xword	0x9bfd33f5e6b2200e
	.xword	0xf66f8b510135d271
	.xword	0x5d809d0a937980ab
	.xword	0x976ff02d537674ed
	.xword	0x618371c2404f1b12
	.xword	0x4b08a2b304add749
	.xword	0xd5beca17c0d868a9
	.xword	0x72fc5d09cffa25c3
	.xword	0xd8190bba2b5104e5
	.xword	0xdc293ef9e70d5031
	.xword	0x00111d3b207ec408
	.xword	0x6e74fc3535dec83c
	.xword	0x9afb63e67894dcd6
	.xword	0xd9986a091ba80125
	.xword	0xddcb3d2f62b4825a
	.xword	0x0638cf8a3021f31d
	.xword	0xe34b255c877686fe
	.xword	0x7a93d3b425cc1311
	.xword	0xb5d24fd1352bebd1
	.xword	0x264dd40df4c810b5
	.xword	0x2c7ba67977a62d44
	.xword	0x3414dcd1447304cc
	.xword	0x22f22b5be2b4e72e
	.xword	0x91d5ae187f02e0d2
	.xword	0x96e7d84814e6cfbb
	.xword	0x9415533445da3c90
	.xword	0x7115e8ad79480511
	.xword	0x31028f5ccfccb985
	.xword	0x42a21ead8dce4613
	.xword	0x52b6940e3059879f
	.xword	0xd3f9a7023df5cd70
	.xword	0x58c1b19d0a6eb9eb
	.xword	0x4e84442f28cc75a2
	.xword	0xea616e483f9e4384
	.xword	0xed721a0651dabac9
	.xword	0xef8c61e0d07d9664
	.xword	0xd648abcdfef000f0
	.xword	0xc120fb919907c73a
	.xword	0x99eaae4ac4d96f12
	.xword	0xbdebaff9f1aab4d4
	.xword	0xc62f27161b39792c
	.xword	0xcf08be36a4861338
	.xword	0xc2a23ec6827038cd
	.xword	0x06390d80fc573f63
	.xword	0x67ae54460616f76e
	.xword	0x76d78b89fca23fc9
	.xword	0x6c3126918f040a33
	.xword	0x07bc406ce221803c
	.xword	0xb8fa15462891fa19
	.xword	0xe28b211f8fa93496
	.xword	0xeabbf01a3465bc76
	.xword	0xa31babdb1daf22d8
	.xword	0x4703ea85f518e793
	.xword	0xe5c12777dc990315
	.xword	0x736214ebbda66ed1
	.xword	0x3d9eb784c92a86c2
	.xword	0x6cc133bf3706c9e8
	.xword	0xf907f4aaa5b8bb0d
	.xword	0x54d9f642d9fdc357
	.xword	0x7835bee0da809f59
	.xword	0xdb90dd8713aa9431
	.xword	0xdce2d6bddc766c95
	.xword	0x47eb4d3a6fe007f5
	.xword	0x60c5dba6e54d7e54
	.xword	0x194699a58f485625
	.xword	0x7cd09f97cf9f8c27
	.xword	0x2a6efde7b29434b1
	.xword	0x721e33b718070274
	.xword	0xf248123ed3726fcf
	.xword	0x09b98a4a39be95ee
	.xword	0x29bdb9241069fe08
	.xword	0x401c6f61ce1c18d8
	.xword	0x539f30f890b98e3b
	.xword	0x0aa532fce71b64cc
	.xword	0xeaa89fd233e1db33
	.xword	0x45ecd4b8535ec5e4
	.xword	0x2edb6ae19485f916
	.xword	0x42a28fcf9c462f50
	.xword	0xd422c49368702499
	.xword	0xc8fdfd3d65211be2
	.xword	0x0381dc782302fb19
	.xword	0xed0b9a76f514404e
	.xword	0x9579a00cd2362861
	.xword	0x9b0fd0da74eeea51
	.xword	0xb65a1eace0019b17
	.xword	0x8424f109c8dc0f69
	.xword	0x1662807620bc4405
	.xword	0x31596501179dfd65
	.xword	0xfc46a9c5ffaf821c
	.xword	0xb819ef71e6222bf4
	.xword	0xa298359d1662af81
	.xword	0x76137565ebb542e6
	.xword	0x7700d190a0153c77
	.xword	0xbf87bfc4f52c1878
	.xword	0x5fa6cbca46986546
	.xword	0x6f82e01e6182b996
	.xword	0x2264b7406d065d1b
	.xword	0x27be862ee4e3f402
	.xword	0x6829d199281d35a5
	.xword	0xe3f0cfe31b3f9c3b
	.xword	0x5b8c5793efd64903
	.xword	0x5357388eee30713b
	.xword	0x74f3c38008b27a9e
	.xword	0x0d94cd0450ca8d7f
	.xword	0x7021e78873cbc910
	.xword	0xadbfe5647ad82ef7
	.xword	0xa50afa246ac4795b
	.xword	0x351bc864c0b03ee9
	.xword	0x5ecd1b10615eea0b
	.xword	0xec042202be663abc
	.xword	0x2306522eb247d6a6
	.xword	0x6c168b06f04ee964
	.xword	0x9f66ad4c783b7754
	.xword	0x37241664c566f57f
	.xword	0xbdf71f2af1775a39
	.xword	0x0a29e21e11101967
	.xword	0x510c17c357c3d42d
	.xword	0xefa0262b754abbbb
	.xword	0x57367657dbe32273
	.xword	0x35d83a87660d858c
	.xword	0x37dc4c86e3f26d19
	.xword	0x872fccfe05ad2097
	.xword	0xb3258a1565a6c5ea
	.xword	0x3807953fd96fdb4a
	.xword	0x90c6bcc9d9cb93c7
	.xword	0xe676a908664ace3a
	.xword	0xa2b12aa79dac9458
	.xword	0xbe8a50688acc4142
	.xword	0xed315f83e94bc46d
	.xword	0x21914eb2120cd345
	.xword	0xf1121ccb98f3bdaa
	.xword	0x410b63acedba273e
	.xword	0x6688f6e45c93fc1d
	.xword	0x705e094a19f90cc1
	.xword	0x39381ee56ef164c3
	.xword	0xb77c9e78020cd751
	.xword	0x81e6afc892ad34f2
	.xword	0x5a1cf729876c5fbe
	.xword	0xfb9a668eb7d2b7cd
	.xword	0xf433d86d9d5889bd
	.xword	0xa2c38cafb2ef14cd
	.xword	0x74b94246f0f412be
	.xword	0xdc3b7e74a89a40f9
	.xword	0xc9df32f6171092ee
	.xword	0x0e527c27c82f1fa2
	.xword	0xb1e4ed543ec89f59
	.xword	0x940d5c00926da475
	.xword	0x92dfbb711749e56f
	.xword	0x894b97915d84307e
	.xword	0x70b0576d4ad1a2a8
	.xword	0xb202d5b19b610640



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
	.xword	0x7511491d544c486d
	.xword	0xece948cf308fe3e4
	.xword	0x94e0c737fcbdff9a
	.xword	0xdee9e6aaee03d5d6
	.xword	0x5df02dfe215b0d16
	.xword	0xb9551c32f90a23bc
	.xword	0x5e31231d4433c8c2
	.xword	0x1793709da0344f30
	.xword	0x10c9b8b4074f290c
	.xword	0xb470409e4fb29f66
	.xword	0x67f6f87dacf04622
	.xword	0x5a1aac0977b1aa0f
	.xword	0xa172b7bc840597e0
	.xword	0x390c84bb484d40ed
	.xword	0xb65ed641dd1710b6
	.xword	0x9cd31825ceceb04d
	.xword	0x61d291d18b6f7b82
	.xword	0x6a2639a469901a34
	.xword	0x9f53c2d57e921869
	.xword	0x832174ed0726f1e5
	.xword	0x081ce9e461fb0917
	.xword	0xff1e5b0b2a30e7f3
	.xword	0xcf45b1e9323543cb
	.xword	0x1906896216d81f42
	.xword	0x0a4c3b83111f9dc6
	.xword	0xe940601015da7ce0
	.xword	0xa13c48a8a26919d0
	.xword	0x1698cf0ccdbb9405
	.xword	0x42cee6085e56da2b
	.xword	0xaa209226e3e558e9
	.xword	0x2077d3e557ae7de0
	.xword	0x40c61e55c60d774a
	.xword	0x1dc0dd352ee293d2
	.xword	0x358423087832a5a3
	.xword	0xdee8702f13ac2d60
	.xword	0x301caa4308388064
	.xword	0x938ee27bc78f9ecf
	.xword	0xff6bb06e8d55b164
	.xword	0x655d03bacd5c2c1b
	.xword	0x0f40f3454ff32295
	.xword	0x69369c3853209656
	.xword	0x51467b892046bc7c
	.xword	0x2150fae42cba9236
	.xword	0xb39a445bddbeb3d3
	.xword	0x0bdd6f83484b519f
	.xword	0x2b99c604acda9b9f
	.xword	0x8514b960962831b5
	.xword	0x2a54a7634dcf09bf
	.xword	0x4e46170aa8c1bb53
	.xword	0x543ba3070f09f5a3
	.xword	0x312f527420faaccc
	.xword	0x9ef7fd4824378cce
	.xword	0x45196939159826af
	.xword	0xdb66ba0ce5ef6610
	.xword	0x02ac8c40b3b6e6cc
	.xword	0xea683c6e325f7422
	.xword	0xcff87343f935e481
	.xword	0x8666664eafdf104c
	.xword	0x642f0bd829959037
	.xword	0x2a9ade64dc581ca1
	.xword	0x8421a976743c5b93
	.xword	0x1c68d12295536ee8
	.xword	0xe858b1d80f5e701b
	.xword	0x08a7ca6146b73793
	.xword	0x199e5739d2ab2286
	.xword	0xb37583d26b1782de
	.xword	0x75f462d640b7a56c
	.xword	0xcecc26bc8e1ecb8e
	.xword	0x4d09eef9afcdf3f3
	.xword	0xf72831125a537ed5
	.xword	0x837f00f32ade1293
	.xword	0xe0d962cd4d95a87d
	.xword	0x9f39e3f77e61d778
	.xword	0x129f1c22b8db4406
	.xword	0x5a2494e88656671f
	.xword	0x0b6e1376ccdadb67
	.xword	0x198cd2b06977a4b2
	.xword	0x44ffcea4db35e58d
	.xword	0xa81e43eb49b53f5f
	.xword	0x36ae14e8bfaef226
	.xword	0xf2e6673a6f7ad1a3
	.xword	0x296cc0c3ca056d94
	.xword	0x511b2e476faaf11b
	.xword	0x2de7dec675580e27
	.xword	0x75bfcdeec7188b69
	.xword	0x87c67a8f48af4073
	.xword	0x4f210d300676dbe6
	.xword	0x50de8f29fcf4cd09
	.xword	0x87914b7d2f5cb185
	.xword	0x22455db01a457d98
	.xword	0xa021810c1951d7cf
	.xword	0xbbfa201b4d9da487
	.xword	0x8dd66e20c488f225
	.xword	0x0cdaa4bb9e291a59
	.xword	0xfdeabfba4a9c860c
	.xword	0xd6b133e13459fbe5
	.xword	0x7c2a40122d55ea55
	.xword	0xb3a2934c1d8e1cd8
	.xword	0x103c5cde7fb014dc
	.xword	0xb9bb71a3dce80f95
	.xword	0x66e5f0b0c52781ac
	.xword	0x07e4079326c930a9
	.xword	0xaff4e2aafa4030f5
	.xword	0xa69844368475161f
	.xword	0x71a76d9cb55fb32e
	.xword	0x9f8c30bc10988c40
	.xword	0x81567a46b8988556
	.xword	0xe734ae56c6fb07fd
	.xword	0x70689f17bb2b2d04
	.xword	0x1d9500a86b1fdb8c
	.xword	0x884c87f5c87da1b8
	.xword	0xe5773bb7957244c3
	.xword	0xcdf1d7102a00dffb
	.xword	0xfa3690f7cb64cf38
	.xword	0x02edb552dbf7792e
	.xword	0x9c8d6580ed4ab0f0
	.xword	0x8168d26cdd9ebf36
	.xword	0x96edd129440b7be6
	.xword	0x27d617c3177ade29
	.xword	0xe3066241fe571d39
	.xword	0x8aa1d948ea5e5543
	.xword	0x693aae18f495eea3
	.xword	0x2c979229efae1da5
	.xword	0x8d2ff0fb08852eca
	.xword	0xe1bfa142b7065c20
	.xword	0xf83e89b875623236
	.xword	0x6eb8ef5b14fb2969
	.xword	0x4ac95213bdff4432
	.xword	0x2c1a7b5c57707d90
	.xword	0x1d479713a1423899
	.xword	0x7f3ff836d09a860a
	.xword	0x2130d34e4e45631e
	.xword	0x46b38dd8ea701200
	.xword	0xa9e0edd2c6cb56c7
	.xword	0x8b1e6fe65b101b95
	.xword	0xf8dcf45c96bee726
	.xword	0x12a61957f69c9162
	.xword	0x5852302f6abe772a
	.xword	0x564ce846acc73301
	.xword	0xec0c7dda9ba09a54
	.xword	0xea22a4d90c8cbad7
	.xword	0xec0cdf5ef60fa4d8
	.xword	0x9fd87a65cd70707f
	.xword	0x8fbc9a36a145b5f5
	.xword	0x6b0dd218ce575f27
	.xword	0xac7f37c7a343a089
	.xword	0x4ee8dc7fa88cb01d
	.xword	0xe8976c7ff5ca0622
	.xword	0x60fa322fd856707c
	.xword	0x6799c97ffaf83500
	.xword	0x7bd6ed582aa1ee86
	.xword	0x1ae410ca4378a375
	.xword	0xcc5fbfdf638df978
	.xword	0xf1642b3d92412004
	.xword	0x774354027523d90f
	.xword	0xdd9619c92a272392
	.xword	0x06143586bd9bc608
	.xword	0xe3c3142f423ebd3e
	.xword	0xd0e67e623e88083f
	.xword	0x21ce3c2c22e93539
	.xword	0xf2f5d280d545ef47
	.xword	0x085b54ffe315c24c
	.xword	0xd88de2e32792b81a
	.xword	0xdcaca10018980d27
	.xword	0xd742c8048e3f1968
	.xword	0x8316f191ec575139
	.xword	0xdb876146322df5b8
	.xword	0x878ef086315b8212
	.xword	0xdc769f4240ff246b
	.xword	0xfb8a51e006d405cf
	.xword	0x082765045a8359e5
	.xword	0xa7a68c221aa05b2e
	.xword	0x07d66b804e6f04ab
	.xword	0x802cc7673c2cc12e
	.xword	0xd4ab12b9ab968167
	.xword	0x951c3a0a78ae3c80
	.xword	0x21ddbc19c8b18393
	.xword	0x018662432658e837
	.xword	0x497e79ba2f43a7a3
	.xword	0x5fe49e4935fb5364
	.xword	0x64331e4b593b20b9
	.xword	0x20977a2bd1606e6f
	.xword	0xc8d44809870e3a0c
	.xword	0x6ed86c65a2c54254
	.xword	0x523f60540825e833
	.xword	0x59aecc5ed83dbaa6
	.xword	0x28258282705a5aad
	.xword	0xaf6b236f280c6f70
	.xword	0xc38885a711c7a75c
	.xword	0xf1dd7b8b4db5190f
	.xword	0xdf955ead2d191967
	.xword	0xde7677212cbcb5fe
	.xword	0x829e61f304711946
	.xword	0x5e7c9d2c9684d65d
	.xword	0x5231ee510d9ae2cf
	.xword	0x04d904766c505685
	.xword	0xcfab71635b04390a
	.xword	0x86940b373047ab24
	.xword	0xd9100ac567cd59cb
	.xword	0x4b7d1a6fbca3558c
	.xword	0x27d4038910aa3511
	.xword	0xe9b46084d535c8dd
	.xword	0x7e55a13f8e683959
	.xword	0xd47396172f9d19ba
	.xword	0x22ed8580bf2433da
	.xword	0x1f5c1ea43b8e39a2
	.xword	0xc3040225215cf6fe
	.xword	0xf809a65caaf65eb7
	.xword	0x411ef2623ba6187a
	.xword	0xefcfcf1e4aa3eeb7
	.xword	0x82a3fa4b934f18e8
	.xword	0x2322489be4653772
	.xword	0x24c35a48300b49ce
	.xword	0xd2c44bde0cb52158
	.xword	0xa4939651a0ed47be
	.xword	0xaec04e9b90bbbac3
	.xword	0x385cf0ae617fd45d
	.xword	0x210edbf9303f60ed
	.xword	0x8d5baedf4e7e6c78
	.xword	0x4e3559523c606c3c
	.xword	0xa7b0648f8383c239
	.xword	0xbd2e1d3064e8c617
	.xword	0x7815acfc08d362fb
	.xword	0x3a93d77b84de47a6
	.xword	0x4c1aa3ef2e173310
	.xword	0x1c299941d7a8c8c6
	.xword	0xb9625545f36d33ab
	.xword	0x7c98c6f9f65df559
	.xword	0x180b084f5c9431bf
	.xword	0x1053ffc0d364c157
	.xword	0x6bb2e49fc71e52e2
	.xword	0xc900daa7cb5fc2e2
	.xword	0x15aade18742e6478
	.xword	0x141ea8763c368529
	.xword	0x8e676bb74067615c
	.xword	0x34d7682b4b6379c9
	.xword	0xd4ccdad8d1075042
	.xword	0xeb0029e222b92c34
	.xword	0xe42b564e11992578
	.xword	0x8bd0b09ab00baf56
	.xword	0x81cc1a48cacbe676
	.xword	0x6429812c2af05568
	.xword	0x8005be95f2f8f58f
	.xword	0x73364220d5db4988
	.xword	0x36e07987a984281a
	.xword	0x2ad1a84c84d0dc1b
	.xword	0xad6d61167b6cfebd
	.xword	0x8f8a81deaeed126f
	.xword	0xd396d05edc388288
	.xword	0xe6158f3c1cfe46a7
	.xword	0x20cf0303df8377e6
	.xword	0x8f6549377bb0a21c
	.xword	0xf6f8e7812cec1c33
	.xword	0x166b09ad01c11092
	.xword	0x0fc305a140da82e8
	.xword	0xff714c3359cfcfac



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
	.xword	0xb8d2cc9c955fef0a
	.xword	0xbd78170dc5e0a6d9
	.xword	0x483f943b2f21d2ef
	.xword	0xf680095ed9ecd73f
	.xword	0x9ae3ae9283b8324b
	.xword	0xc2016c2f0fbd9d00
	.xword	0x8e005a7b18c0f125
	.xword	0x8539a3e1de8abf0a
	.xword	0xf53e321a91ebb109
	.xword	0x78dfa28485b0137d
	.xword	0x76c7891a0b56ade2
	.xword	0x925c507570cb8331
	.xword	0x4155aebcd5de0a4a
	.xword	0xdcda491f966bef67
	.xword	0x3ce44ed9380bfc01
	.xword	0x1b4774e8e5ee684b
	.xword	0xf8f9b35568ea04e2
	.xword	0x5fa8646f827e77fe
	.xword	0xb76147d3a8260998
	.xword	0x489ea9b5a50a9733
	.xword	0x000a15bdb75b874c
	.xword	0x51f5d0226ab3dedc
	.xword	0x1292a383c44af9b3
	.xword	0x44fbdf1025d82461
	.xword	0xe204ecc4c68ba387
	.xword	0x628a5e325b0f9c6c
	.xword	0xfd8b9ba86f99bfd2
	.xword	0x244d09cd1c9dbbb9
	.xword	0x07ad599351061c25
	.xword	0x5b6d3ebb531863bd
	.xword	0x39f66f61f88b8d75
	.xword	0xe88b05d2bdf86e4e
	.xword	0x3521060b23958934
	.xword	0x01f59a5b1f1a6873
	.xword	0xad7466efaad0d418
	.xword	0x0feeeb2f9e2a2f43
	.xword	0x20ffdf1525a00fb5
	.xword	0xa46efe0262b92b05
	.xword	0xddc671720b5cae86
	.xword	0x8398b51927a10ecd
	.xword	0x1cb035a667bb4347
	.xword	0xfc9c263a4ea53a90
	.xword	0x5a6d1fee180006a0
	.xword	0x7a0fbe6fde435471
	.xword	0x2d7f8069a62c718e
	.xword	0x51af709190843b63
	.xword	0xc25ba8fbd92752e6
	.xword	0x27df41fda27980b7
	.xword	0x779fa2516103931a
	.xword	0xa4df385315e91994
	.xword	0x98fe817aadd5d641
	.xword	0x3bb041b0cc6d5282
	.xword	0x70074244c7b9d02d
	.xword	0x36ba8f42069e8fac
	.xword	0x0a7b5c1083e613e0
	.xword	0xdde278ec0c0cebfc
	.xword	0x3f6bb5c1026865e5
	.xword	0x22f80164eb4a70ec
	.xword	0xe33db1beeb09635f
	.xword	0xb0291b7cdbff38fc
	.xword	0x50a37ee20e127f88
	.xword	0xea64cf694f2cdd59
	.xword	0xd9da1cd81834d2bb
	.xword	0xc9b14c51547568d9
	.xword	0xaf8789c43154d974
	.xword	0x1f1cc9c546c53c34
	.xword	0x9f4123e65687181c
	.xword	0x783c130fb5ee5ed1
	.xword	0x53ed20ab1f92efdd
	.xword	0x13759203689192f9
	.xword	0xd3f8e566df476ced
	.xword	0x427cd592c85dee08
	.xword	0xfc96dd93650ccfd0
	.xword	0x0eacfe244ba2746b
	.xword	0x3ac9ac8650be050c
	.xword	0x9ab7f62a5310b419
	.xword	0x3f9d1d267f92ea7c
	.xword	0xce3309bf07c72e32
	.xword	0x778a2745d79ddf06
	.xword	0x4abfd6916313abb1
	.xword	0xeec0c6060037c9e7
	.xword	0xcb715ba6ce53393b
	.xword	0x7c4fe6f285aff0c2
	.xword	0xb82c2092d4db240a
	.xword	0x3620a17a45bb5eef
	.xword	0x62954e652fc599b6
	.xword	0xeafaf7dc882303dd
	.xword	0xab338e1dc5b6bae9
	.xword	0xe05524c3c1ac2d79
	.xword	0x8e4fe5dfce06374f
	.xword	0x289fd6acf6d2ab69
	.xword	0x79331168a093f5ee
	.xword	0xd8b3d859a4580d70
	.xword	0x2c39fc715d50e24e
	.xword	0x4b3cb0dd6e784f6b
	.xword	0x2bed619662729cef
	.xword	0x83d9d5c8d50e18ac
	.xword	0x2233d45caa0fd5c1
	.xword	0xe8facb1a859d5975
	.xword	0xd6e80750c7bd8f07
	.xword	0xba885176d4fefcb1
	.xword	0x23cc1e24808314c4
	.xword	0x7ffea380956ccf64
	.xword	0x18f7b3f3b7863894
	.xword	0x0e20dfdf8d0a2d57
	.xword	0x6a08ea1db732d887
	.xword	0x78a59f9d8030a417
	.xword	0x1dab61f15e5d8e88
	.xword	0x61044b314975359a
	.xword	0x32a7da4d972f8fd8
	.xword	0x6d84abb829816ea4
	.xword	0x18a6820a23561ca5
	.xword	0x753f4eab1e10ad0b
	.xword	0x47ce484734ccdcc8
	.xword	0x5c43e9daad778c19
	.xword	0x93ebbe76b6a72534
	.xword	0xcc3e35c5a205f8f9
	.xword	0x94fa6d8a36354fdf
	.xword	0xc567ce2e74e98b02
	.xword	0xf80895e8fad073d0
	.xword	0x5fbf51095bbeb7fb
	.xword	0x64303e2d91b597d8
	.xword	0x5319ac8a39f752cd
	.xword	0x890ca6c9eda94b6b
	.xword	0x31902e360688d6af
	.xword	0x396d4e7106cbd689
	.xword	0xd063e73931a22d46
	.xword	0xcced40864943caf7
	.xword	0x9706482b35d08c2e
	.xword	0xad304cf7d883e919
	.xword	0xb514f2f7bd9d2ae7
	.xword	0x506b394da69c94b6
	.xword	0xcac43eddc4f6f33a
	.xword	0x257951200b2dfb13
	.xword	0xaef5b445cb850b53
	.xword	0x8f6cc48a38382ce8
	.xword	0xd3cec3b176ac0110
	.xword	0x6f55641b239548d9
	.xword	0xacc033209a5fffe9
	.xword	0xe289314b7ecf2f6a
	.xword	0xa45dcf53bdbd8ee5
	.xword	0xc2b7cb735b1ad466
	.xword	0x13fd1b5c9e3b8d88
	.xword	0x1ebd0161b2f70c00
	.xword	0x1406dec9cdf80ca9
	.xword	0x0f5968108d7820ff
	.xword	0x6b0f2b3403449cf2
	.xword	0x7cb832cb3b1d7420
	.xword	0x61dd3de7305b0e34
	.xword	0x9b2caed1c9f5112b
	.xword	0x00a6052295065d4d
	.xword	0x3722b08aa63a8d6d
	.xword	0x03fc36d0e7465133
	.xword	0x34c92483c8356ac1
	.xword	0x11983c42d7c445ce
	.xword	0x31e322a7c68267eb
	.xword	0x9096c5d1f383c6a7
	.xword	0x87fd0c60571f0308
	.xword	0x56b6be1d080c9811
	.xword	0xee35a5a15e67d580
	.xword	0x45a9b08b534b3da7
	.xword	0xc3a134e56b3938ed
	.xword	0x12bd9a77fd8a9d57
	.xword	0x294bc0698db49796
	.xword	0xa343c79b2c4995fb
	.xword	0xad0563b7c919ff54
	.xword	0x91008784e135d98f
	.xword	0x4a8777438419d028
	.xword	0x66b1b0c738e1d276
	.xword	0x5633ac864883304e
	.xword	0xb3b119fd32be5771
	.xword	0x5714bc8278dd43f1
	.xword	0x4255c7dd53bf9619
	.xword	0x6fbddbbecc4d2e81
	.xword	0xd081b9f782a42f15
	.xword	0xa27051cf5005a5e3
	.xword	0x283dfeff39c81469
	.xword	0xf3ea35129ea24179
	.xword	0x09f5e9db8a6392ea
	.xword	0xa55763da9675da54
	.xword	0x6ec066d81465d7f4
	.xword	0x223bbbd7baed32c8
	.xword	0xb51b8b877b1857ae
	.xword	0x0b25e1c7756e057a
	.xword	0xb046712dc1cd4276
	.xword	0x6ea9e72eca6a6004
	.xword	0x9af569b051e80181
	.xword	0x1b93f1dcf23b9cf0
	.xword	0xae04516786f76c22
	.xword	0x72285e7f0d887425
	.xword	0x2ea7713b95199549
	.xword	0x7a39a8a20a74a282
	.xword	0xb46b24724bb811b9
	.xword	0x41506a3eb02630d1
	.xword	0x89cd3fe7d5ebbd6f
	.xword	0x742ba79faa539b0b
	.xword	0x36914592cb13f08b
	.xword	0xf29b974e180f8b47
	.xword	0x8bf7d621ea80861d
	.xword	0x5587c48dee210a8d
	.xword	0xa0429cb27c25a592
	.xword	0xb3f60ea0e29e2fb2
	.xword	0xb6dc04769575e98c
	.xword	0x811eb3cc05355bac
	.xword	0x19135427c8c9de62
	.xword	0x891e4ed6b9d3cba6
	.xword	0x0b80a2c9713da68b
	.xword	0x747c5fa13892bb38
	.xword	0xf497ef63e7d4b6c4
	.xword	0x7dc72213278e9224
	.xword	0x4cf0d533606ceacc
	.xword	0x191b1431ee96d783
	.xword	0x36012d30e8ac0127
	.xword	0x9c7a1a9e85d2842b
	.xword	0x880533f7a4360ba5
	.xword	0xd13bd2ca8de270d4
	.xword	0x4e4e0dde2dc1f182
	.xword	0x3e795f2bc1e91d00
	.xword	0xe680d166b2586b8d
	.xword	0xb4cb1c4dcaf6a7cf
	.xword	0xdefc21f496acec24
	.xword	0xb43061c688086001
	.xword	0x27b2ca79a9ad9ee9
	.xword	0x8acb32d61877ccc0
	.xword	0xb47f12af381e4080
	.xword	0xcdd18827c98c7f1a
	.xword	0xfb4930768f4692ca
	.xword	0x30621f4c9951dce8
	.xword	0x3b0584da9f306e8d
	.xword	0x5edea3f74d259837
	.xword	0xd29877b78e4f8238
	.xword	0xf6ed0bcc55339c64
	.xword	0x28e1e942aa5a3100
	.xword	0xe3e6ef82dbebfc4d
	.xword	0xccb4f20224ee7ae5
	.xword	0x1225e4d8d4958853
	.xword	0x50091c4bb2b2ea76
	.xword	0xade7a4a524dacaa9
	.xword	0xe09e54683a654ccc
	.xword	0xdbc8a46f51b45756
	.xword	0x7ef344c5fc2f5c4e
	.xword	0xe24cdf79d3093f5c
	.xword	0x7d87236164bab6a8
	.xword	0xb1f3534f1308a3ed
	.xword	0xe6ce228a1841bb14
	.xword	0x9498034726c9d7fa
	.xword	0x30eb166c6d70a965
	.xword	0x573212a1e40367df
	.xword	0x3415de2b1d0961d0
	.xword	0x5a1cb71f6a9b7ec4
	.xword	0x5861e54fd3976c35
	.xword	0x17893184efe29875
	.xword	0xc6de10b8c07f69de
	.xword	0xc99c85ab278c712b
	.xword	0x991d57decabcd6aa
	.xword	0x979e8add1938cdeb



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
	.xword	0xa3d6da2b0d00b9e9
	.xword	0xfaa024b10f484136
	.xword	0x3af03884f9a93242
	.xword	0xaecf29ce4cee3308
	.xword	0x8ddcca20fe957a26
	.xword	0x74c8bef0ccc0687b
	.xword	0xd4d5de90d1197b8e
	.xword	0x93046f252a7fb554
	.xword	0xcf3a8484f13cfb4b
	.xword	0x818e345488346963
	.xword	0x98a19939ac992fdb
	.xword	0x8989ca84eca9c350
	.xword	0xe390dc37e6b0fd8b
	.xword	0xd41a960c356968b8
	.xword	0x0b0903df84be7154
	.xword	0x4db5ad2475fc58d7
	.xword	0x0c425a14890d544d
	.xword	0x2635572019226716
	.xword	0x6d8700c6ee4fb647
	.xword	0x25cbf3ac1e29a52a
	.xword	0x697513253c2b6420
	.xword	0xb6d58bcefa46f12c
	.xword	0x6d90ae5bd6ca7679
	.xword	0x85e128c6acf0f9e0
	.xword	0x7e6205146067a350
	.xword	0x31252d576b8f99bb
	.xword	0x6c648764e780e51d
	.xword	0x9325737fd4e4336f
	.xword	0x055f57f6664842ae
	.xword	0xbc2ebc6f822c11bb
	.xword	0x37b5d88b12e58339
	.xword	0x753a56b09b452d15
	.xword	0xc8a358f39b75a6d2
	.xword	0xefcbe0c67709b426
	.xword	0x7fb842da449dd72f
	.xword	0x3dd91605825d0290
	.xword	0xafcb882ea8795d9d
	.xword	0x7af5e13940b4e1bd
	.xword	0x6c11d38dbc4cc323
	.xword	0x37b809bb3fcaa51b
	.xword	0xdb5b7dde560120ec
	.xword	0x7ece12f4c4f7cea4
	.xword	0xcc403e77725d46da
	.xword	0xb4d65a829536eb9f
	.xword	0x6acfd6e495786e9d
	.xword	0x1366c2a595658e25
	.xword	0xe1971ea9e29a3bcd
	.xword	0x79c230cbdfc7dc35
	.xword	0x200f327f52a0eeab
	.xword	0x96f6e31813d6fd0f
	.xword	0xa674212bf9bb3b93
	.xword	0x25446952693b8bc7
	.xword	0x07e4073cc83fc159
	.xword	0xf967e72bfafe84ff
	.xword	0x744a08c5ce050906
	.xword	0xffbe673ffeb1d0f5
	.xword	0x82ceb97d0f8f1827
	.xword	0x06754af858a5d2c8
	.xword	0x090c82f52c2645fe
	.xword	0x3d1a2115bd627b8a
	.xword	0x0a7698462ec5ab54
	.xword	0xa766a97d264fd2fc
	.xword	0x1079a40e1e482174
	.xword	0xc73e22d2f50f7fe6
	.xword	0xa3871d51215bdb44
	.xword	0x24d8adf5513af941
	.xword	0x0b98dc68d00548de
	.xword	0xaa9c4e1eedbe7c39
	.xword	0x78e3c472d978d365
	.xword	0xb4f38c8adc37f337
	.xword	0x9f6af8ca5175894b
	.xword	0x1a81b6f5ea12170c
	.xword	0x083308bb0a166f71
	.xword	0x36f86911be7a1154
	.xword	0x7d531f3a4db813db
	.xword	0x22fd7a277e4a792f
	.xword	0xbc0ba6dfed4b1d22
	.xword	0x080138fbb4a48655
	.xword	0x6f872756379e76dd
	.xword	0x8e10ba5ab3d77421
	.xword	0xb7844a79f71bf259
	.xword	0x651994bd9d6ab878
	.xword	0x13ca8b145c9914f1
	.xword	0x9a181261c01f39ff
	.xword	0xaba7bf58a78ba585
	.xword	0x0917f832fa3e593e
	.xword	0x50ddb4f19a7374b2
	.xword	0xb588b1887f18fb28
	.xword	0x1eb7ddd16d56d979
	.xword	0x6beac6ade037e190
	.xword	0x66c8f5a0e8fcc237
	.xword	0x385b1d4e334c2426
	.xword	0x2aa8e131f1bf4ef6
	.xword	0x417b4c47a4602d60
	.xword	0xd56a508fc1d3b180
	.xword	0xeeb242d7135871ff
	.xword	0x6d73fb4fdd7c9177
	.xword	0xcd05d4210589879c
	.xword	0xa51afac2b9f9b54d
	.xword	0x53a143f68a74d81c
	.xword	0x777d3d7d37f4c62c
	.xword	0x7ada3d00e5c93396
	.xword	0xd2a83f6d304efd42
	.xword	0x8d446d6529ef6c89
	.xword	0x82641bb069cbb9d7
	.xword	0xe48f1b38c47eb23b
	.xword	0x42dcb31e58fd36d4
	.xword	0x98229a88542c0b07
	.xword	0xdd8ee585af99536c
	.xword	0x09bb1757133ba30d
	.xword	0x78ff3bd4cdcdaa0f
	.xword	0xa5fbb01093358b08
	.xword	0xbc7e46d25f3d184d
	.xword	0xbc4d5b723ed575a6
	.xword	0xb0023901f3173908
	.xword	0x14bdaf3e5bfb04aa
	.xword	0xe6556358fcb87bfa
	.xword	0x9b4838dcb2453509
	.xword	0x25401d3073b890dd
	.xword	0x9497becdf4e5d0bb
	.xword	0x967ad4ba110ad302
	.xword	0xf36d74577e5fd6cc
	.xword	0xd6ba9237c75777f1
	.xword	0xf670e859343d6c2e
	.xword	0x9f26e0a69c4dba3c
	.xword	0x140f570761521986
	.xword	0xcce5f8193971c880
	.xword	0x70f1239371d23861
	.xword	0xf83d30b38b0671f1
	.xword	0x984b236eefe24aad
	.xword	0xa5c201a48119092b
	.xword	0x78dad5c9b53ce4f5
	.xword	0x6b22b88ca1d3e210
	.xword	0xd89f24e6ea09c55c
	.xword	0xdc97a1b868418fb3
	.xword	0x2d17b1a4dc7a404c
	.xword	0x5792395cbc1b32d8
	.xword	0x940037e04231395c
	.xword	0x2125bfc1776c8b10
	.xword	0x2a8193da7d8d5979
	.xword	0x927e742ac896c218
	.xword	0x5ffd4bfcec56bf78
	.xword	0x7e6032256c8aa400
	.xword	0x4e9a187e70e88314
	.xword	0xcd2724c42438c195
	.xword	0x54526b15af891f8c
	.xword	0x2381d591e0685fa2
	.xword	0x23e6ecb0be664376
	.xword	0xcfdfebb813af3b2c
	.xword	0x2f1377163c831818
	.xword	0x3d595a220912f473
	.xword	0x25820240be03c5d1
	.xword	0xd814c477ad4f2a5c
	.xword	0x70b83086050a3e1d
	.xword	0x558d696f69e7a73d
	.xword	0x8e801ef8e701a2c3
	.xword	0x99f58b571056c7cb
	.xword	0x9901b1d421240398
	.xword	0xdc35b78e831a67c1
	.xword	0xb10c3df63a7fb932
	.xword	0x4b4116f13d50a332
	.xword	0x7cd9ac7b2621a444
	.xword	0x62d912b09b3568e3
	.xword	0x747bd461ec9ad24d
	.xword	0x409e8608b1749f31
	.xword	0x7f71892301119e9c
	.xword	0xe89fcbd1695e9a7c
	.xword	0xbf53f805384a0459
	.xword	0xc16ddd2dfa252069
	.xword	0xa0f23ee2bc7b97d3
	.xword	0xfaf5b0962903714b
	.xword	0xf25fa3f49e99484b
	.xword	0xb81b13612a19eda3
	.xword	0x2a89b7fc1943224d
	.xword	0xa145cb40b55e3b64
	.xword	0xc785e891c08d03dd
	.xword	0x642c809a74737f86
	.xword	0x9e0b28846a2d894f
	.xword	0x0aef02973a02c3fb
	.xword	0x5b509f10c9096b6c
	.xword	0x05a3646c623b0f9d
	.xword	0x2565b5a2e776946e
	.xword	0x2351bc80a52c8735
	.xword	0x1f5bf87d4ec61ced
	.xword	0xac12623c8a8f34eb
	.xword	0x035fc3528b2dd490
	.xword	0xaafa2772fe6cafdc
	.xword	0x8d7d065967e5c651
	.xword	0x99362ff9cf599831
	.xword	0x0cac1fcaafba7441
	.xword	0xe32adfeaa167d137
	.xword	0xdf557f44485b26ad
	.xword	0xf739b2146ed593e5
	.xword	0x39b78cfc32aceb38
	.xword	0x14410d9e37810f17
	.xword	0x4420f1a5c2632615
	.xword	0x4857631dd1eaf7a6
	.xword	0x56f33f9b851b97d3
	.xword	0xf740a66865a62161
	.xword	0xb183c283a25408ef
	.xword	0x534675f0863932fe
	.xword	0xea915c6a989dff51
	.xword	0x29b608f8a91cc65c
	.xword	0xe2d6bbe9ca06e7c4
	.xword	0x45551c855ab7ac32
	.xword	0xe6a6df0e47d3e712
	.xword	0x6b052c69e532ba7f
	.xword	0x8d707ddfc2cbb199
	.xword	0xd90ce1f6ace9e629
	.xword	0x4eb8bf86b7bea616
	.xword	0xbbf2599082778b6b
	.xword	0xeb15acec16878bc5
	.xword	0xff52140a629b3421
	.xword	0x1ee0d0387617a425
	.xword	0x183f6f1fe346a00b
	.xword	0x15a6822e8c9c78dd
	.xword	0x8820821c4e613e2e
	.xword	0x68732598e147e97d
	.xword	0xe23d4e1f523cb418
	.xword	0x3ecfe2f2ec7b4d85
	.xword	0x316a6a1ab6e112a9
	.xword	0x9b39ef70ea63a6ae
	.xword	0xf5e6235d015da781
	.xword	0x37880fd291782dbe
	.xword	0x5ecdb1febe004335
	.xword	0xd03f6e32fd372fc5
	.xword	0x8380c731f0b482f1
	.xword	0xeded9ed2a912a0a3
	.xword	0x694d1ee7c031fb1f
	.xword	0x52e8bf7f57fdddb5
	.xword	0x8084b83b3d1d7831
	.xword	0x4c3d229e23de4865
	.xword	0x6c20c23637cf8b43
	.xword	0x17d0e993f098dca5
	.xword	0xe26a126b4a8ad7ef
	.xword	0x1ebf00feeb6ce960
	.xword	0x51c6358affb1307c
	.xword	0xdcb9f13d08ea1aeb
	.xword	0xb9f77a33169afdab
	.xword	0x8620777b184f63be
	.xword	0xb23f86f991e76195
	.xword	0x1d358a2748cfd549
	.xword	0xa16f759eefdfe4f1
	.xword	0xa09c1bd9265e3828
	.xword	0x7f2f8ec17b1ea172
	.xword	0x2b8758130dfcd4b8
	.xword	0x0a6bb321564d4035
	.xword	0x4aa6975426d7cc29
	.xword	0x8dd75e485ce771ad
	.xword	0x03fe3d706536d501
	.xword	0xae3181e818430a7e
	.xword	0x28f61a0a1f7994be
	.xword	0x2f8118506279830d
	.xword	0xfe04e40cb8caa236
	.xword	0x12c55f6b12bcff22
	.xword	0xce50b087765a8283



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
	.xword	0xff31ef6f527e9dda
	.xword	0xce01c0843b5e5fca
	.xword	0xc13a327eeaf01c71
	.xword	0xdff838989fbfc682
	.xword	0x2d78579b10f81be1
	.xword	0xbf66244c43d91463
	.xword	0x08d8d9e6f2ebfaae
	.xword	0x6fa932ead373659a
	.xword	0x4ec3f2258024a8a0
	.xword	0x5c800cf538696f20
	.xword	0x91a9da6b6ecf5ba1
	.xword	0x62b2f5cf423c15d1
	.xword	0xae4002540e451548
	.xword	0xa141c9e61398f45e
	.xword	0x503e798c1e6c23dc
	.xword	0x76a453ad52b57180
	.xword	0x4fa0e83db73a95a3
	.xword	0x834d3394ed595d08
	.xword	0x3567511b1708a564
	.xword	0xc93d3c71eaff0d9a
	.xword	0xa3b39ecdb839f5af
	.xword	0xae31011415f173db
	.xword	0x253f5c48f817e335
	.xword	0x1df94afc130d6176
	.xword	0xd81659250a3ec9a8
	.xword	0xc69fdb76d14c2c5d
	.xword	0xd98bc6fb88b88a79
	.xword	0xdb38ac346a0abd06
	.xword	0x8c228593eb6e21db
	.xword	0xcf3c7b3337f07930
	.xword	0x982cf0c05a174f5f
	.xword	0x6f9d62a17e0188ba
	.xword	0xe722d5984e0532e0
	.xword	0x566fa339a5bdf64e
	.xword	0xb494a09af19a9a6e
	.xword	0x68542054bb4af578
	.xword	0x1f2d53f59a527c9f
	.xword	0xd5be320845184f91
	.xword	0xcd640e82cab8fdbd
	.xword	0xc0395c9365fbb793
	.xword	0x6604c1a9cc312b95
	.xword	0xcc1f7d50f66d3be3
	.xword	0xe18cd1363dbdfc80
	.xword	0xe02b7e6de6f5ae7d
	.xword	0xef6498992e6dbe77
	.xword	0x2dcf1aa1372e3a86
	.xword	0xefa46d2aa8ac8ca5
	.xword	0x0c39472a02a5b410
	.xword	0x5c94788dfc0c2fa8
	.xword	0x9de26ff71f1295f6
	.xword	0x80f2590bf61893b3
	.xword	0x9cf228e57b26207f
	.xword	0xfc7721800f62efb1
	.xword	0x083884047d3580c8
	.xword	0x78bf3e0abad1a27a
	.xword	0x3a1cd350926fb9cf
	.xword	0x869a1a4d4b6d33cc
	.xword	0x491be5119f30c8d7
	.xword	0xaff53478454b2bc0
	.xword	0x59da41c55e605d71
	.xword	0x1f1d728b6b6e9c92
	.xword	0x225529727c631637
	.xword	0x40bda7cb080ac395
	.xword	0x589580b05c2c838b
	.xword	0x97e15bbea851a0f9
	.xword	0x7104cdf366152724
	.xword	0x6189f5f7dbb9f7f4
	.xword	0x8badb374cd90abfa
	.xword	0x2abe74101005055e
	.xword	0xac18233869176b91
	.xword	0xadca9cd888872942
	.xword	0xe6bdeba1883fe285
	.xword	0xa8fd039459e79542
	.xword	0x8f94f5d64a5414ef
	.xword	0xbec05cea865f4d8b
	.xword	0x49ab6ad8e21b72c7
	.xword	0x6d6865dd95388d9a
	.xword	0x049f50880297d295
	.xword	0xdddaca0a7b56c459
	.xword	0x0066f38790e4353b
	.xword	0x71b903dadb07cfc0
	.xword	0x8c3860be6ea73d47
	.xword	0x2111fb2e9674c24e
	.xword	0x9074f563bc5cccfb
	.xword	0x43862cdb93492461
	.xword	0x86b40a50e0c65f10
	.xword	0x5a48eed40bd8d3f9
	.xword	0xda875cdb03b8528b
	.xword	0x741b0a133b77d273
	.xword	0x5da92ccf0afd6fb1
	.xword	0x6d323a4c7be7e215
	.xword	0x5a2d65aafe8dddc4
	.xword	0x044f964950bc8221
	.xword	0x23b9320ee1ebd276
	.xword	0xabb1ad38b5955e52
	.xword	0x4f14a267ca889d97
	.xword	0x43f03baa4afed4e2
	.xword	0x1717a5a29f349392
	.xword	0xa4f8ecd6d8163c44
	.xword	0xd50680b4234c6024
	.xword	0x9450997b3f307550
	.xword	0x0810df8cb56362fb
	.xword	0x6a5366139e352252
	.xword	0xd37bb50f3e9307b9
	.xword	0x470539a1f18cf06c
	.xword	0x662e78015b4c9771
	.xword	0xbf3b1692d9b2b8e1
	.xword	0x91343fb7034cd83b
	.xword	0x937a55a8d1903e45
	.xword	0xf5eda3989de64424
	.xword	0x7903a3af8ea3d90f
	.xword	0xddc29005dcaff866
	.xword	0x40e3aa23a4c40e19
	.xword	0x72230bebde913729
	.xword	0xff58e9bc261d8742
	.xword	0x65ecfb759b01fcd9
	.xword	0x01875281f11a0506
	.xword	0x54eed825fe047267
	.xword	0x06acdf171a6364db
	.xword	0xef42721e46497662
	.xword	0x8743c7bea2a8e6c8
	.xword	0x66c5201d9bfa7333
	.xword	0x20500f46e5ff8eb4
	.xword	0xb5f3286313f46a80
	.xword	0xf1d6d9623ef58806
	.xword	0x4f2e973ae157b6ee
	.xword	0xbb8b1bdee71524f5
	.xword	0xd4505df468f45000
	.xword	0x1eb85f4cc1f33144
	.xword	0x22cc377a3548782f
	.xword	0xcd8cf0313f99e089
	.xword	0xef2d3ef1e9c3931d
	.xword	0x4a029c777fc8fffb
	.xword	0x3e37743616dcd630
	.xword	0x01362e94e73d8918
	.xword	0xc26574498c4dda45
	.xword	0x906b4f976ca716b2
	.xword	0x2cd3cdad7a7ba4e5
	.xword	0xdd8de9b5ea9ac158
	.xword	0xd4c44308c4457dcd
	.xword	0xc7991b11ad589c9f
	.xword	0x8784d923c815f5e2
	.xword	0xcadc5cafe5e8742a
	.xword	0x9eef6e8c0dbea93e
	.xword	0xbda6286a80713e30
	.xword	0xa14e45cde35eeeb9
	.xword	0x897372a4644feb38
	.xword	0x646fcb78c9e19b26
	.xword	0x88975b7b6d187be8
	.xword	0xc6da7d16a3690e01
	.xword	0x379215efd2dd3f13
	.xword	0x3b895ef5f82ea7d9
	.xword	0x8245f196be600c2c
	.xword	0xfc5286489b365b62
	.xword	0xcd9cf03937b1081a
	.xword	0x69463763cf473528
	.xword	0xee6adc0be09ab6df
	.xword	0xa0c9b3774a27b4ee
	.xword	0x91c644dcf464f237
	.xword	0x8a733910d17ec724
	.xword	0xdbdecae4e2551e05
	.xword	0xf101706e24e01aca
	.xword	0x69ec3f9faf1766e5
	.xword	0x7e3165ab4014db37
	.xword	0x645cddfc185f631b
	.xword	0xbba2bbb6327ce05f
	.xword	0x5f8bafc9eb808101
	.xword	0xb31c66b9048202ee
	.xword	0xea82e18051a00387
	.xword	0xb70596549715a52a
	.xword	0x926707e20d06b725
	.xword	0x116ba7a43bb6da5c
	.xword	0xa137aa59d3dd253b
	.xword	0xb5c9da4465809610
	.xword	0xe209153c7de4f080
	.xword	0xb4f88d93d630d886
	.xword	0x9211e2137d4c4953
	.xword	0x2da66b5bf203e5ab
	.xword	0x81e7124e301c868a
	.xword	0x347003a82749efec
	.xword	0xe0803001a3a7a002
	.xword	0xd57d7117b4554904
	.xword	0xf6c4fe25dd5f893e
	.xword	0x96760bcb1798df67
	.xword	0xb5749d966523a467
	.xword	0xf3d80508c22aaff2
	.xword	0xa620674c10091856
	.xword	0xfc96657cce4dbc18
	.xword	0x219a4cd33bba48d0
	.xword	0x8a528bbbe94878fd
	.xword	0x76b90295eda24305
	.xword	0x28a5c753478fe3e3
	.xword	0x4011372b69176b52
	.xword	0x44604df8ef6f14e5
	.xword	0x92b5a40379142da4
	.xword	0x72b2e8a8b5fd3868
	.xword	0x472d2d26f6351246
	.xword	0xf4ff4fc1f197323c
	.xword	0xb60014b1609ef409
	.xword	0x490fa12878b57b39
	.xword	0x90b4d5469359f2a0
	.xword	0x967f9aff539456bf
	.xword	0x2a8c8c304f53f28f
	.xword	0xdfe5d4f6e99013d8
	.xword	0x58d3c6927830a86d
	.xword	0xe983e94e84beae2d
	.xword	0xf7155394df22a857
	.xword	0xd6839cc4d53e88fa
	.xword	0x382e481324c2dfc7
	.xword	0x180816e4fccf8f6a
	.xword	0xe3533e92a40ccc44
	.xword	0x3cec3067b12fec82
	.xword	0x636bb36f3de9901a
	.xword	0x7ac52931942a1313
	.xword	0x32c6b7553180c8b3
	.xword	0x0884fbf39630880b
	.xword	0xcde6e1fbd8ea1a51
	.xword	0xa56d6b43248dc7c5
	.xword	0x700027f989a35d48
	.xword	0xcd3189c768ef10f8
	.xword	0xa96dcfb273857fb0
	.xword	0x3bf9315998897620
	.xword	0x0e421b0314e767e3
	.xword	0xe09605be4f6d678a
	.xword	0xa10e9cadd5e89178
	.xword	0x45c2280176999c6c
	.xword	0x0e94a0463f9ed2bd
	.xword	0x942754d12f1af086
	.xword	0x1767c25bb4681e36
	.xword	0x8b584c0b67d795b1
	.xword	0xa05d888cd7bd81e9
	.xword	0x493c6abfb04dcb06
	.xword	0x0dc6a78c9d92e9b3
	.xword	0x1310109b055dae22
	.xword	0x8eed89e2d5dd8d29
	.xword	0x87b803b0b9bacae9
	.xword	0xe4d7eb8d314509f4
	.xword	0x7a1c4eb7597dbee4
	.xword	0x0e44aa071c39f44b
	.xword	0x86a2b2b96f27e853
	.xword	0x026111bbc189e7e9
	.xword	0x66479df0d8469b6a
	.xword	0x2292bbe88a36f69e
	.xword	0x4dcb9147add8609d
	.xword	0xd97681347aa5edff
	.xword	0xc3c037ffe60b7b4b
	.xword	0xad62a03ad9fd697a
	.xword	0x5ea8593271e18675
	.xword	0xeb038550e5049c55
	.xword	0x5be2f59a9757a178
	.xword	0xc3c50c0ec3b858b5
	.xword	0x4f8c5466da5e5127
	.xword	0x292331fcdd70b03b
	.xword	0xf8cadc3bfbf2f8d7
	.xword	0x8af431db89a136e3
	.xword	0xd721044d9a749ff0



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
	.xword	0x170a04f858184a56
	.xword	0x7e0c50dd0ed0fbf0
	.xword	0x3208fcdee98a5ebc
	.xword	0x945cbfe11c86619e
	.xword	0x55b05d877d531e5b
	.xword	0x875f457e61477761
	.xword	0x4c721bff8d87b349
	.xword	0x6a0e75a6f37b4a5c
	.xword	0xbac528a34fd6a297
	.xword	0x67b246d6e9a0fc53
	.xword	0xc367f6ad0c0f8d28
	.xword	0x47912b56aee8c321
	.xword	0x40d04f6d54e27917
	.xword	0x2ceabfb55d79e2f8
	.xword	0x838ec34389e1353d
	.xword	0x22fa531910fa5e67
	.xword	0x0a369970449fd0ea
	.xword	0xc168274ea59e2942
	.xword	0x0fe8886cf21c892a
	.xword	0x43fe18542baca8be
	.xword	0x85b8cbc471ed9149
	.xword	0xa24b927c169362c7
	.xword	0xa20a23e9d9c40668
	.xword	0x0515b2d184893cdd
	.xword	0x1a1439cc5bbb86d3
	.xword	0x12c405277a47f8b4
	.xword	0x33923c46b4c5c471
	.xword	0x5c2fa186a7686fb0
	.xword	0x070da9aebbc92b24
	.xword	0xd07e6ca128a5d513
	.xword	0x8ad43a1c32010e3c
	.xword	0x755801b4d12e1dad
	.xword	0xbdaa5f373dd1f9f0
	.xword	0x150a478ba68d0b86
	.xword	0x3aa48bd9885a0401
	.xword	0x44b61a9b44320a94
	.xword	0x1af8ea9e9b0723d7
	.xword	0x0a688e0548111f00
	.xword	0xa645c528c11d8439
	.xword	0x3592448485ba72c8
	.xword	0xd7cdd8ccbda36a0e
	.xword	0x16d0c49456b55897
	.xword	0xd67cbf54eb722ca6
	.xword	0x4963f9eb228cffb5
	.xword	0xcf5ba73cba3e80c8
	.xword	0x9ea2d3216ec46e29
	.xword	0x0cfe6601b82bfaa2
	.xword	0x9c29de5cef304c24
	.xword	0x5d0190632e2134ae
	.xword	0xe116fe4292046c94
	.xword	0x1e6a7aad03f62e75
	.xword	0xa93835fde7c07969
	.xword	0x2f8002772c4f80ed
	.xword	0xec1f63b0574532ca
	.xword	0xdf02733674e76687
	.xword	0x09210700ed38032c
	.xword	0x5ec207bbe6e1f593
	.xword	0x70600e7e3bb29308
	.xword	0x06c9d3616c6ecae1
	.xword	0x1588bcbdaf7a9040
	.xword	0x03059cc6bbbb6565
	.xword	0x7d84acd9e6d2cdd1
	.xword	0xdf2fd083b33f84ff
	.xword	0xfbd558661a8b59ed
	.xword	0xc736f7b7c6527ebf
	.xword	0xbd208533337cfb7b
	.xword	0xeffaa43df8f877a0
	.xword	0x736a113ab90aac98
	.xword	0xecc254a8468a0205
	.xword	0x34646da059fb0a66
	.xword	0xff72df1ce2284015
	.xword	0x96dab4a72f719777
	.xword	0xf9e2905c3f97ab2e
	.xword	0x2500ab2a08fd8f45
	.xword	0x15ea4d2e60eaad29
	.xword	0xc01963a866ce83a7
	.xword	0xcb1680a71f7d4936
	.xword	0xbd1677b0ffc5ad98
	.xword	0x5e5f04b49c4c8b11
	.xword	0x577f27362d65a69c
	.xword	0xacb0924eebde7111
	.xword	0xa7d4ef8d87bc9109
	.xword	0x8e85a765d5b807c3
	.xword	0x906297a6491e117e
	.xword	0x4a571e874de8ad20
	.xword	0x7748505c11c00513
	.xword	0xbb6d880f11a4f4e1
	.xword	0xef40e6d0fab24064
	.xword	0x67dc2917e6dde4b7
	.xword	0x5c28dfedd9171699
	.xword	0x48d8b2fc7330542e
	.xword	0x4863a556dad00368
	.xword	0xf8b826916565fa9a
	.xword	0x715891011bae5f83
	.xword	0x30f0a65693c1a359
	.xword	0x6ce47714592f5589
	.xword	0x34fdce804f25a142
	.xword	0x9aed5c2f72f2e72b
	.xword	0x8d65b9b516d8c045
	.xword	0xcf497b5b6b7dafde
	.xword	0xe52ef0d72a63c53d
	.xword	0x390555fe2fd452dd
	.xword	0x542e25ef04058703
	.xword	0x8bdbc227e39241c6
	.xword	0x46c0b8cfee464cb1
	.xword	0x3543f795622a92b5
	.xword	0xa36b1785650e7064
	.xword	0x5d5696a2dd6453e4
	.xword	0x36570ac159bf92cc
	.xword	0xf15ce6b08a985f66
	.xword	0xe40794ba8ddb44aa
	.xword	0x595fc5a43c18b0a5
	.xword	0xc1abeb6565c56ade
	.xword	0xa9b31b0f75c89c32
	.xword	0x4940d6870cc8a464
	.xword	0x14f5e5d38750f475
	.xword	0xde3aa3def35728f8
	.xword	0x099ea2fdd46bf958
	.xword	0xe6dad0d78276a1c8
	.xword	0xc63cfcbdfb9f89c8
	.xword	0xdae10723be5877c4
	.xword	0xe808a614ee7bbfcd
	.xword	0x26c295c34c3aa583
	.xword	0xa7697ecb446951f0
	.xword	0x04a5c74bdb5e0b8a
	.xword	0x8a519a8ca8508a6b
	.xword	0x6c3b8b9f13353fa8
	.xword	0x43a044b2a8f32ee6
	.xword	0xe5b3185fd8b71f4f
	.xword	0x9c2bb630d507e61f
	.xword	0xf100001ce7a77691
	.xword	0x392016cbfc7562ab
	.xword	0xc842b9a4d0265ac7
	.xword	0x8db9de224a5385c9
	.xword	0x11ade2c13574708a
	.xword	0xf090c76f1036fdf9
	.xword	0x622f4b4cbeb69845
	.xword	0x7407d74f0645480b
	.xword	0x5fb6aeb88f82c0dc
	.xword	0x3676d886ed7990db
	.xword	0xb5dfb733f63855dc
	.xword	0x8eb8c0fde324d5b5
	.xword	0xe88965da720abf95
	.xword	0x9c19250abe4e58b1
	.xword	0x1d549c2ac55e6422
	.xword	0xadf93b1238d56885
	.xword	0x165f79d25f1f5303
	.xword	0xac780433382926eb
	.xword	0xa42c78a2d1853c97
	.xword	0x6c69e1fc2ab5d495
	.xword	0x197369fbe75f954c
	.xword	0x4aebab6fd1779b7e
	.xword	0x971010826b1af17c
	.xword	0x4ac30f3b44d46aa9
	.xword	0xa0a52ed514af9937
	.xword	0x4a6d92319d74cbfc
	.xword	0x1cb289fc8c289973
	.xword	0xf8570aeb0e8caf10
	.xword	0x5890365664992dc2
	.xword	0x2e5ce02bb1439418
	.xword	0xb0d474db73e83022
	.xword	0x532844656b6bf947
	.xword	0x75a53a091565f073
	.xword	0x4a501982e49f0ed8
	.xword	0xa280e35498e9d111
	.xword	0x5dd373ed58fd2f74
	.xword	0x92957af52090e33f
	.xword	0xceffab9867a360f9
	.xword	0xf62c93c3f8369774
	.xword	0xb8f296955b526c9f
	.xword	0x97d69fa8b5afb755
	.xword	0x92995bc05ca458b9
	.xword	0x3979fc860934a4cf
	.xword	0x8508c4f287539264
	.xword	0xc3a21d2a01952c7b
	.xword	0xc34eddc6e7530ded
	.xword	0xc4f2db2f10fd8960
	.xword	0xe69c763019340889
	.xword	0x396202d06f9b1506
	.xword	0xf594e292b82be562
	.xword	0xd933eb12d406257a
	.xword	0x32981ee39e138913
	.xword	0xddf3d13c99ef9281
	.xword	0xc0f0724bbbc15a85
	.xword	0x6be50d1302ec42c4
	.xword	0x2bcba35f07dea8a6
	.xword	0x88b6ed40b5332a43
	.xword	0x058384320b23cc03
	.xword	0x10a14125ddf1dc52
	.xword	0xe2fdd16a5b5b0a8c
	.xword	0xffaf5c404cc46a24
	.xword	0x811160dbeb029ae2
	.xword	0xa2efeb3902b80ac6
	.xword	0x0b2c6e174a5a153c
	.xword	0xeb5b6fc707c96ec4
	.xword	0x242ccb9a48f13b5a
	.xword	0xd2031ea06ad9e702
	.xword	0x8c074e687e117572
	.xword	0x172bd5b90797782f
	.xword	0xbf8c0dd5661ce5b0
	.xword	0x0c0b2c79c5ed5497
	.xword	0xf5ba7101d9966595
	.xword	0x31a7d6fce4c74514
	.xword	0x783cd60c759c87cd
	.xword	0x23ae3955c3002426
	.xword	0xf3a533594e0f5a56
	.xword	0x06640c40052a6f2d
	.xword	0xfabbeb3d98fa2b70
	.xword	0x8c0404ef62425e11
	.xword	0x4ac97153c997777c
	.xword	0x87ce0803eba33408
	.xword	0xd8f824dc37ecccf4
	.xword	0x12cc4544e7079903
	.xword	0x87990c69210f94c6
	.xword	0xbf6373deb8f126b0
	.xword	0xffb1f5072a4e71a4
	.xword	0xb5e836f58bc2fbb2
	.xword	0xb31d86fe13728f98
	.xword	0xda138da08a052c80
	.xword	0x114034ae8cd00744
	.xword	0x8b87672d146c6044
	.xword	0x5862563c549c1337
	.xword	0xa652d50dba8db79d
	.xword	0x0e82e33a23c3a35b
	.xword	0x3ecfc8a2380cd354
	.xword	0xd9d847a1ad94e8f7
	.xword	0x506b929d8b84bb25
	.xword	0xed566f9460512858
	.xword	0x4ab179810aeb34bd
	.xword	0x96ae84aef473ec9d
	.xword	0x5c1ff844cc209ea6
	.xword	0x2917863731f17d9b
	.xword	0xe967c813e45892a7
	.xword	0x5a2a4bc7f9c9fd95
	.xword	0x9f4365ba6a925104
	.xword	0x1ccaaefaef8ab734
	.xword	0x856310bba099c09e
	.xword	0xf9f38c711d5af9c1
	.xword	0xc2a005b2bf5b5d5d
	.xword	0x3b75d97348cdc8d2
	.xword	0x66fbde4bb828e15e
	.xword	0x1c2bc11a81e69d4d
	.xword	0x80be757fcfbdd4cf
	.xword	0x8efdf2afacb200b3
	.xword	0x2c2771a451284571
	.xword	0x9d3917e4b8a0a734
	.xword	0x7b5f944dfaec01ad
	.xword	0xe2be16d7de37672f
	.xword	0x5e05a4d45f372a68
	.xword	0x63ef122486a00c96
	.xword	0xfa82a6d3447ce902
	.xword	0x88becd32e0956273
	.xword	0x3e7fadc453a69b3f
	.xword	0x50e2c4d6b96586da
	.xword	0xe0558bf4d2947be0
	.xword	0xeca1d659d75d7f4d



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
	.xword	0x63c7a0f102726dc1
	.xword	0x92b996fe7dfc3021
	.xword	0xb2c52d9284acd209
	.xword	0x558c6397baa9f2d7
	.xword	0xb93fade404e53c77
	.xword	0x9c40338123bf62ba
	.xword	0x6b44a090a84f6d11
	.xword	0xf649af3cc559432c
	.xword	0x1f96a7e3331881ee
	.xword	0x7624c39096e896e2
	.xword	0xc5ef5626d716defa
	.xword	0x46009cc434edcb9a
	.xword	0x7c377a899bcd2034
	.xword	0x0666f8980099f76f
	.xword	0xa1f1bcc99cc29b84
	.xword	0x0476a2690edfd0c0
	.xword	0xe62ea46edb13a7f5
	.xword	0x19ae127ef1dd0789
	.xword	0xbc0593f0ef2f8619
	.xword	0x9d32d9d7ebd7d621
	.xword	0x58447d9cc630be5d
	.xword	0xbc2206ff97189b15
	.xword	0x8fe6475d7a82b405
	.xword	0x1004526698e0f200
	.xword	0xfd77a8ecdd9daff9
	.xword	0x1ec69939a189fb9c
	.xword	0xe43d3da61eca0e4f
	.xword	0x697d74ad22293c1f
	.xword	0xff8c91e11aea1eb4
	.xword	0x7d75c01add76fa7f
	.xword	0xf75a241907851273
	.xword	0x5e71a72c23db3f1e
	.xword	0x96343b5b69488dde
	.xword	0x8d6bf18c00a0a461
	.xword	0xe7b5b92693ea4e65
	.xword	0x112a4bb8a4c7d46b
	.xword	0x780075bc143514ee
	.xword	0x0f50dfeac3adae0d
	.xword	0x17186fad52edef40
	.xword	0xe1c585fb8e0e7c12
	.xword	0x5aaaed8c184bf53d
	.xword	0x9afd5df89bb20828
	.xword	0x824d8b1e68b23130
	.xword	0x50b6c752e2ddd5c4
	.xword	0xb95d9caec26a4f4a
	.xword	0x3ac233db6535bd08
	.xword	0xb1c4a72c7fbc1fd1
	.xword	0xa80fb94bc627cb86
	.xword	0xef89e05f27038a43
	.xword	0xb6b110976bd97004
	.xword	0xdb458b76ae2b068d
	.xword	0x7dd281d4aaa99599
	.xword	0x9a1caf1ddd728c29
	.xword	0x07a8010291a69e32
	.xword	0x2430625ce8380d5f
	.xword	0x72ced373b69edad5
	.xword	0x8ab6d460d47da953
	.xword	0x51de04635d8a2441
	.xword	0x18efc8a14dae6a3f
	.xword	0xe8f63ad6d2620b49
	.xword	0x0d9c2452b7bfb0f2
	.xword	0x62c5004e979cdbb1
	.xword	0x5bb3474559900c8e
	.xword	0x1fffe62ff3db4e21
	.xword	0xdd50300635ed120d
	.xword	0x4e07bf9a79d6323a
	.xword	0xcf185ed39853a74c
	.xword	0x4ac807c608577c53
	.xword	0x0a4f9a940c4b0097
	.xword	0x9f4ae2ffb476395b
	.xword	0xbe1ccd2e8a5f66f3
	.xword	0xaf8b59eb0d4624fb
	.xword	0xd7d563052bf1d7c8
	.xword	0x39055bbd9c4d0647
	.xword	0xb1090023268c2188
	.xword	0xb7c1112c6a0dcee8
	.xword	0x533659dfce4b49ad
	.xword	0x28193651984c9f17
	.xword	0xbf664a8a5e522c55
	.xword	0x37ecf45e85f0a1e1
	.xword	0x50a3de79a1909153
	.xword	0xa3040a6a3cb28831
	.xword	0x9be5672f617d618e
	.xword	0x6d21aa32182e3c1f
	.xword	0xf2a883ea1437e1a9
	.xword	0x12955db6cca58f10
	.xword	0x70018d4e6cd9efe1
	.xword	0x799588d4a12d98a9
	.xword	0x7bbb9dc3331f0320
	.xword	0xb83344067cda3135
	.xword	0xbfbe47ee0a105a8e
	.xword	0xb60703bf6b9dd21f
	.xword	0x9a72a79d44839049
	.xword	0xc2333fb544713b00
	.xword	0x6d217db993831651
	.xword	0xac9ef61b977f584b
	.xword	0x6f6b3a6bfd25a66d
	.xword	0xc188f9ff6e693c92
	.xword	0x56ee396b1875b754
	.xword	0xaae7e03fa3036096
	.xword	0xb2c2009b369894eb
	.xword	0x3e66ca6b0721b519
	.xword	0xa4e53b4ea9ac5944
	.xword	0x85b522a2b3a5ebce
	.xword	0x8eedce61d443e672
	.xword	0x443c08091009eeb9
	.xword	0xfdb833a86e6a883a
	.xword	0x2227f76277375d4b
	.xword	0x52c0b0c5aeee38f7
	.xword	0x0ed89916bea4c3f4
	.xword	0x61145229292fe38c
	.xword	0x58583b5eac2ef449
	.xword	0xc474230cadacd8f1
	.xword	0x5fff0c63e957227b
	.xword	0x1e67b85879117055
	.xword	0xfb9a9ec6a7d82779
	.xword	0xb36e0318c024cff8
	.xword	0x68143f77aa48f934
	.xword	0x55c0b766141a66d4
	.xword	0xfa43ecb1a6c51ab5
	.xword	0x8dd7a9e9aaec9208
	.xword	0x80ded0877eb35406
	.xword	0x871fcc5c399eddbf
	.xword	0x5b4d7de1d2dd8b16
	.xword	0x9f3c5b4f3591108c
	.xword	0x3b19f13f69d3be89
	.xword	0xb95ff980df24f6ca
	.xword	0x01a06c3314adccfc
	.xword	0x61eb4eec17892ffc
	.xword	0xa8dfd180172e8176
	.xword	0x6d3fe054c377192a
	.xword	0xd5e78dcb9e106443
	.xword	0x75fbbe5c282b070d
	.xword	0x5b289851dfd02ac4
	.xword	0x1f098f2ed5aa7527
	.xword	0xd6f3222811235031
	.xword	0x064fe705545b9fe9
	.xword	0x8a2853ca8e66eca2
	.xword	0x6e33478ff9c519d0
	.xword	0xe354da3a85693762
	.xword	0xeba13a5e6a676a72
	.xword	0xc8c828dd8d03808d
	.xword	0x54975e4380c5eb5a
	.xword	0x1e272b3046cb1085
	.xword	0xeb5e8039cc123d0b
	.xword	0x663089837bda1760
	.xword	0x934b9be0902c56f6
	.xword	0x63acbcd3b1799e8b
	.xword	0x77a39cb4e0d53667
	.xword	0x4dce4c4b35772803
	.xword	0x3ff35c5151b5155b
	.xword	0xd6bcd43ac43e22ae
	.xword	0xd2eea73d7f3a5220
	.xword	0xd49226caca09ae3f
	.xword	0x9c40c9d239974be9
	.xword	0x5db3909ef295aed6
	.xword	0x515406e7d4681384
	.xword	0xdc1478db8bc2b571
	.xword	0xa204d79c2ff1f052
	.xword	0xc437c85b20eaeaf6
	.xword	0x230536e2e4406d25
	.xword	0x13f2d3ad44232aa3
	.xword	0xf66dd722e113452a
	.xword	0x9699c893e28fcc39
	.xword	0x1ba9586454331b4a
	.xword	0x5c72430070925ed7
	.xword	0xef18b81c2d61528b
	.xword	0xf6c7434f375c4a2c
	.xword	0x53f34656d10fefad
	.xword	0x29d3de182acc94fc
	.xword	0xdf446cd3648a7980
	.xword	0xf4ba87501d07db25
	.xword	0x25e8cba15aab36dc
	.xword	0xac2f6f5cfeb211e2
	.xword	0x660bf061d851997a
	.xword	0xf87229d32dabbb6b
	.xword	0x89ca87d825421703
	.xword	0x72037d74b5c25737
	.xword	0x787c7b06483ab6d3
	.xword	0xbdf34eac85d0c45c
	.xword	0xa1e180b13b3e6504
	.xword	0xc447ac6d4499e2a5
	.xword	0x4b2949b6e1750bbd
	.xword	0x6a196befc4a37ffe
	.xword	0xfc90add5bf8fe4a0
	.xword	0xa3f70148b5ae9824
	.xword	0x386f4489fecf6d7b
	.xword	0x2c8dbb58f6378508
	.xword	0x53d56a45ee72c223
	.xword	0xc97f2789d00e6c71
	.xword	0x33906022c952274a
	.xword	0x0c08543a1d495579
	.xword	0x8eb5cb04eef340fc
	.xword	0x84d4c50fb9abc43e
	.xword	0x2350715e791843e9
	.xword	0x78dd3c5d97e94384
	.xword	0xbb7d7b8bf19e4b29
	.xword	0x692390354dd1282e
	.xword	0x8f8ae687e7ea250b
	.xword	0xb7d141dfdc43830d
	.xword	0x26ca4ef2bd73ba2e
	.xword	0xdddde5a07efff149
	.xword	0x77c95d9206e49f8d
	.xword	0x2ca1e51b2912646e
	.xword	0xe372c9e6d8f0b433
	.xword	0xaf7730d718ecb163
	.xword	0xa3a6233597fe5a6d
	.xword	0xe0e4c297ffa71cf1
	.xword	0x0df8b84272ba5884
	.xword	0x9be2a7f295a70dfa
	.xword	0x6e436d3a00264352
	.xword	0x6c2f52282950a9c9
	.xword	0x3fb66d29e5dc37f7
	.xword	0x42d4d449f2aa16f3
	.xword	0x79cfdc6eeacb163d
	.xword	0x66d143557a9d77cb
	.xword	0x35f581d5decde241
	.xword	0xf8dee3beb8c57b20
	.xword	0x00925c45184bfb93
	.xword	0x7b4296d6abeedfcc
	.xword	0xb89ec4c4ef794c2d
	.xword	0xc597a65b32c3543b
	.xword	0xb3d2ac012dd13bb5
	.xword	0xf4258512f310c216
	.xword	0x4875843b100afa2b
	.xword	0x2b6b00b069970725
	.xword	0x980b3eeec577e338
	.xword	0x773d987568ab3b5b
	.xword	0x47305a8332b33e7c
	.xword	0x56d73e6b0659558c
	.xword	0xec0d3c749f39b20e
	.xword	0x2ed4f98d6d27f9ff
	.xword	0xd34a10f02113ccf4
	.xword	0x8278c47cd2a8d13f
	.xword	0x81232d09e9bb1b32
	.xword	0xded80a004da6a870
	.xword	0x422f5f509978b7f7
	.xword	0x8f3b97c9d9186524
	.xword	0xac481a0ff6fb44dd
	.xword	0xa2b3c70123d278a7
	.xword	0xa933144cf4b594e0
	.xword	0x62ced031f0d38e3d
	.xword	0xe9c5ed8bc0738333
	.xword	0xa84f7c0e2fa339bb
	.xword	0x0f794aaf85891e2a
	.xword	0x408f71586d7c28cd
	.xword	0xeb660b3040cfdbe0
	.xword	0x6f8d84b64344917c
	.xword	0xf0365b83bd3390ad
	.xword	0x1b3e1ea5f5c503fc
	.xword	0xdc6b6fb253ec3fef
	.xword	0xbc32f3c69138aba9
	.xword	0x85248960f18af44f
	.xword	0xe3f0ea7af9f2875c
	.xword	0x04303c33853a2d1d
	.xword	0xec7e087ff26d1fa3



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
	.xword	0x066e3c9a98413c34
	.xword	0x3d5ac39306ef43a7
	.xword	0x66e2b331dd34c859
	.xword	0x5d1e8043a40053d1
	.xword	0x645aca9c4a39c86e
	.xword	0xd052ea136cfb02d5
	.xword	0x07185839e591af7f
	.xword	0x31941f578edc83cc
	.xword	0xea4005aba529a525
	.xword	0x8799d1526d6807f0
	.xword	0xc1e45a972a6e2442
	.xword	0x10f4ebb65b7fed69
	.xword	0x8f1492a6e75611c9
	.xword	0x44c28c41d8bbe85a
	.xword	0xd468fb328b18cf6a
	.xword	0xfd24e1d680ede198
	.xword	0x9570ff1ce7c40601
	.xword	0x13401ee6fb280b3c
	.xword	0x1aead410a03b8cab
	.xword	0x080c366f8dd720d0
	.xword	0x68e4d1e915c1c010
	.xword	0x2cdef1cad08589b8
	.xword	0xb3f63da64e416d07
	.xword	0xf46f085194317111
	.xword	0x5de9c5d146af588b
	.xword	0x2c15843d03091832
	.xword	0x0452d97f334c8dee
	.xword	0x62a78d8b6cf1b057
	.xword	0x2f9fb3de7379f175
	.xword	0x90a457bc1f867537
	.xword	0x6d847d52b1bb0b84
	.xword	0xa124a4a7a292fe39
	.xword	0x4d4d1474884d7454
	.xword	0x5896aa292d52cc2b
	.xword	0x9b5dc365193ba3fd
	.xword	0x9885210d6edb9e20
	.xword	0x4795cfbb1b7c283b
	.xword	0x2208a96975e5403e
	.xword	0x82765435e1945a50
	.xword	0xdc26466c92db61da
	.xword	0x2e12dcba02b673f1
	.xword	0x542a7458d98b8adb
	.xword	0xc4ac0262ec7c959a
	.xword	0x0f3e7a0119862caf
	.xword	0x9a8335412583aeff
	.xword	0x8c186f285b3ba3e9
	.xword	0x521c95e31991c8be
	.xword	0x810807afc5eee522
	.xword	0xf2df2a398411c80f
	.xword	0x78a09425bb3d45ef
	.xword	0x2affa7b1f2388fb9
	.xword	0x012fe110db4e9189
	.xword	0xec7cf1cbeec24619
	.xword	0xcdba27b4a73cb9ad
	.xword	0x03ef947c82d907b6
	.xword	0x6c03ab0a1706d0ff
	.xword	0xed6a9bb0dafa7855
	.xword	0xd4c311f1e7959c2b
	.xword	0x3537164539797add
	.xword	0xd72312837fe4286e
	.xword	0x4239386f6dcd11fd
	.xword	0xbff4166f6fa64644
	.xword	0x916b7dada3bdf6c4
	.xword	0x94ea74c02ab91dbe
	.xword	0xff69cee853a1fe1f
	.xword	0xad000e2b8f6e29cf
	.xword	0x2db32e6984233a60
	.xword	0x8a993cc4f20cf047
	.xword	0x70c36aa74997cd79
	.xword	0x67f09085c0fdf437
	.xword	0x1429180fed414e59
	.xword	0x723d11d5a35dcea7
	.xword	0x4a9278d9d1cb105b
	.xword	0xc0a48a758f4fe14e
	.xword	0x93cfa31d57df7926
	.xword	0x0de157ac8d84773e
	.xword	0x791a324f6fdb252e
	.xword	0xdaddd771cdd03ff6
	.xword	0xf5cb3e002ba6a919
	.xword	0xda807255710b6152
	.xword	0xccbed017016c19ea
	.xword	0xc417195f06310a03
	.xword	0xc092cf7d389e9c76
	.xword	0x816b5ff7fc1fefd7
	.xword	0xc792b183b96c4708
	.xword	0x2596537d2bd0cf7b
	.xword	0xc860857313626f25
	.xword	0x2370a676a955a9ec
	.xword	0x49f0b4d8cd9fa57c
	.xword	0xb446cf01cbbb17e0
	.xword	0xce63177d95bc5777
	.xword	0xc913ed512ef32800
	.xword	0xf49c5a5e0a378ea2
	.xword	0xc60535a6332ba09f
	.xword	0x0069b02e2bab1559
	.xword	0x766d9adf54bba10f
	.xword	0x99fc3fba2e63fea4
	.xword	0x3b7f10c54ea30f11
	.xword	0x67b471d4082c8165
	.xword	0xe7fda706a0e5b684
	.xword	0x84cb59049c91efa5
	.xword	0x30492853644f49c6
	.xword	0x37d328e75eae2512
	.xword	0xecb145b720d62186
	.xword	0xfbe089e9b2092654
	.xword	0x498ce00324ce814d
	.xword	0x93051156d9437b7b
	.xword	0x82245f92caf2a6bd
	.xword	0x9b9160de010ddd26
	.xword	0x47b006aab76f5b20
	.xword	0x38f0f96fb8f04e22
	.xword	0xa7080a7b87d5c434
	.xword	0x1ce86bc8bba6dfe0
	.xword	0x4e32aa34c1cfc1ad
	.xword	0xfedf6c3ae768a314
	.xword	0x4757fc99f86f27c1
	.xword	0x36fe80f51202f9f8
	.xword	0x12388dd00d184ec0
	.xword	0xfa860053e56a5ee1
	.xword	0xdd3e7d54f364a943
	.xword	0xeb49ce69f2b6ba9d
	.xword	0x92298514727e257a
	.xword	0x2c9c246fd651d368
	.xword	0x5231bb20eb3d30bd
	.xword	0xf068e5e6a648a2b5
	.xword	0x81a18f2af646ea37
	.xword	0x639572fd96216c8f
	.xword	0xe17620ed65238cc0
	.xword	0x420ee596c0137376
	.xword	0xb81bad67f6167ca4
	.xword	0x1bf240eee8dab8e2
	.xword	0xde8bd5be359dbf52
	.xword	0x3c1a945d8287f5cd
	.xword	0x5021453f15c6a705
	.xword	0x13faa40059fde2e8
	.xword	0xeaea7b6b141d6c1f
	.xword	0x33d3b9d5ec3c5bce
	.xword	0x604281ffc27c0887
	.xword	0x88af3bbdac843641
	.xword	0xb7868d4e669f0bcf
	.xword	0x393b83c5fe00280e
	.xword	0xb900c74cd9b88d24
	.xword	0x967e98b693c5a610
	.xword	0x0deed607d0527996
	.xword	0x73613f64b76e18f6
	.xword	0xb952afc37b8184ed
	.xword	0x927f13f3ab0949ef
	.xword	0x5b5d0a0b872d15d6
	.xword	0x06ff8027f678dfa2
	.xword	0xf28d25b3142d18a1
	.xword	0xcb430e750872bf90
	.xword	0xc09bc2ee5619aeb9
	.xword	0x18cae5f8024518db
	.xword	0xdfae1b3c083cace6
	.xword	0x437e7619a4d70d0c
	.xword	0x72caef3818043673
	.xword	0x9a77445ec2e3f253
	.xword	0x3f188c6f7c8f4661
	.xword	0x16260987622de008
	.xword	0x69053b7431ebbe33
	.xword	0xe0d1833633a7ff2a
	.xword	0x99fb0babf9b6f119
	.xword	0x7a666e1b53e91079
	.xword	0xc727c6be9d17908b
	.xword	0x0fde11838f09fdef
	.xword	0x5f84871b7adfeaa8
	.xword	0x6dffa55788474b28
	.xword	0xa400a71dd37ab165
	.xword	0xdae46c4b9618c8cc
	.xword	0x25f53318c145af98
	.xword	0xc9703cbf73280a2f
	.xword	0x4abda3a96ab3ea4b
	.xword	0xfd561b98aaa19a2b
	.xword	0x5a69baeaf54533ae
	.xword	0xba49c2ded2b17462
	.xword	0x774b21fedf11ffd2
	.xword	0x8d98602e990c280e
	.xword	0xa97f0eaf27e85321
	.xword	0x5c031cc7f1a78dea
	.xword	0xfe10224cf3aeda85
	.xword	0xb65d9873b3617c37
	.xword	0x6b21e64915586711
	.xword	0xdb12cdc1a92453de
	.xword	0xd755c932fbb05907
	.xword	0x5393ac98216797d4
	.xword	0x80cd249402605069
	.xword	0xf35b343bf176fd27
	.xword	0x0f0813ffc35315f5
	.xword	0x0ec7f5b39f1549ae
	.xword	0x4a526ab823ce1b36
	.xword	0x6e93ac6c3ebefe5b
	.xword	0xd735e667947f0fa7
	.xword	0xa749aca5651f038d
	.xword	0xebcd604901b4fc6a
	.xword	0xb40e558bfab923aa
	.xword	0xfff88df9dd9f8414
	.xword	0xa3a9dba9e5913bd4
	.xword	0x5943a4415c11b176
	.xword	0xb279f9d9a50d4996
	.xword	0x0f60645968dc6a56
	.xword	0x04aaa970924443e3
	.xword	0x6c7ceb8b48ef897e
	.xword	0x10127b1c163e4162
	.xword	0xb48c804016a22c4b
	.xword	0xea0709d0e235d2d6
	.xword	0x2f87cc35b5e96f38
	.xword	0x58c0c685aa08c185
	.xword	0xac98c3503aa2dd3d
	.xword	0xb61a2b55baf008fc
	.xword	0x328e5a6c3dd16063
	.xword	0xc84214a6a5b6121a
	.xword	0x11ac66c12025ba66
	.xword	0x4a761c0f7bed5ba8
	.xword	0xe3c0891c3625dc5c
	.xword	0x0e1025436963bf1d
	.xword	0xaaa99d04912ee781
	.xword	0x9471260ae4c4b3df
	.xword	0x995a27f185e7b5e9
	.xword	0x57161a2b9f993a1e
	.xword	0x63bd69648da97858
	.xword	0x00a64676899da8ca
	.xword	0xc8ce049ebab2f500
	.xword	0x7a220639f2ac5b03
	.xword	0xe78b372bda9ff609
	.xword	0xda1a633ff710b38e
	.xword	0x25776db5f0bd4f16
	.xword	0x343c3f33854881db
	.xword	0xac6d4b65462ede2d
	.xword	0xc62cea08b32f2e4e
	.xword	0x7c9a297b7f1d6cbe
	.xword	0xe949f5d1e537f38c
	.xword	0xbcbef25cc70615de
	.xword	0x9d2f8d2bf5a98df2
	.xword	0x694a9598c1fda5f1
	.xword	0x49f4001b88b7898e
	.xword	0xe2b98dc3cd967ecd
	.xword	0x0d2c7eb5ec7e2822
	.xword	0x79f7fae728246a38
	.xword	0x2c46c68dccf082ac
	.xword	0x2a25c2965b308dd8
	.xword	0x1211bc3f593b7ec3
	.xword	0x610426da7f6061ac
	.xword	0xe3ca6be7a15c0cdb
	.xword	0x5d829b1db0bd122d
	.xword	0x65a5bb46ab7fdf7f
	.xword	0xf44e0bdb9041f4a3
	.xword	0x80135171f4634d3e
	.xword	0xd3e9209ce88429cd
	.xword	0x52afa4587a0f7ef4
	.xword	0x9146ed8652d5d0db
	.xword	0xca3b115da4248402
	.xword	0x36d0cbbeb2cb44ab
	.xword	0xe4ad902f2453f1c1
	.xword	0xe514cfcf3042936a
	.xword	0x4681c78739b8fc1c
	.xword	0x804bc10a1781bf3c



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
	.xword	0xcdec7375bd41ce57
	.xword	0xffde361b36ab7e5a
	.xword	0x66fd1da30cc11990
	.xword	0xcb737a1678c87b30
	.xword	0x9ae0bbf06082f4df
	.xword	0x8a8f4246ad6e633c
	.xword	0xda73f0f11e6ceb50
	.xword	0xdf69f73597b26d0d
	.xword	0xa384e682e8143a97
	.xword	0x2d0c693bfbacff68
	.xword	0x5eedc8910febdfc0
	.xword	0xe9c1c55c93f8c80c
	.xword	0xe120116cad32534f
	.xword	0xf1b65d68794d7758
	.xword	0x5bc2b46130cc554c
	.xword	0xc17bf4b32935f200
	.xword	0xcf96e5acc2170a68
	.xword	0xbd864dd461a683fd
	.xword	0x63344e6410f73045
	.xword	0xe92a47bf548f64af
	.xword	0x080c614e30c4ed3d
	.xword	0x7fd8495a9564e2a3
	.xword	0x81215c83c141adda
	.xword	0xc825d0a1f5e81248
	.xword	0xbc40ddc29747bb0d
	.xword	0xb2e8e74f82cf71da
	.xword	0x7747fae67c93e2dd
	.xword	0x5bfda9320835c070
	.xword	0x25dd4571c2e84a93
	.xword	0x827d42a342042013
	.xword	0x95db1f2b13650006
	.xword	0xd3c69fe311a9a27e
	.xword	0x62405ec66df8699b
	.xword	0x005f9706c774e9ce
	.xword	0x597d050c71e66450
	.xword	0xd10ee75d96acbca9
	.xword	0xa845521011efce20
	.xword	0x21bb5161e9d99df3
	.xword	0x4819259022835751
	.xword	0x4c0aa5ec706af0d5
	.xword	0x5eb5d1823fd4be88
	.xword	0xefa61cb48bc9d1c5
	.xword	0x67a97f46ffeb365d
	.xword	0xd0e6d4fb8005122e
	.xword	0x09f35667ec81c743
	.xword	0x5f9e50ded424d1b1
	.xword	0x93def94b83675a82
	.xword	0x1b29ad5605b17112
	.xword	0x893aa4de2d8fe89c
	.xword	0x77b83896bd2aa231
	.xword	0x863abaf630e78a1e
	.xword	0xc000c571e169d617
	.xword	0xd04b5a8d50b4b775
	.xword	0x3dac1136d3f83498
	.xword	0xce3789635004d617
	.xword	0x16d3c523d6c7eaf4
	.xword	0x4ccc0879e2f42fd7
	.xword	0x1fb3afbcc57830de
	.xword	0xd8c6924bd71fad40
	.xword	0xce3bbda7239be9fe
	.xword	0x1c3c4624c053eadd
	.xword	0x529a0560a156ad53
	.xword	0x929ba1ef940c4b7f
	.xword	0x00535c850c06a6df
	.xword	0xa86f25095394747e
	.xword	0x70cdb31b0703afcd
	.xword	0x804c0c786bb6be0b
	.xword	0xf4ba92c54c8d1220
	.xword	0x693d9b99579622a1
	.xword	0xbcb2af55e4ea45ba
	.xword	0x05d8430821e382cb
	.xword	0xa89eeb2deb6ac8a1
	.xword	0xf871f3d7e6ade258
	.xword	0x53af109b8d42af4e
	.xword	0xec38061f9efc09ff
	.xword	0x581f1dfa63e4e6f4
	.xword	0xe92411b3414a3edd
	.xword	0xcb206e623d38e019
	.xword	0xa33c933a18e4586e
	.xword	0x3918134b7186b871
	.xword	0x05f24c1ef47f4588
	.xword	0xb17cb2debdeba4df
	.xword	0x83ed5464e251a93b
	.xword	0xcf42238df9ad14f9
	.xword	0x512be11117fb470d
	.xword	0xf0579b23783f33ae
	.xword	0x3f69f891d5afbd99
	.xword	0xa47075f23ccd8be3
	.xword	0x1c82d63a86ae340d
	.xword	0x16cd4c770531c17f
	.xword	0x46372054b77d472e
	.xword	0xf4f4fd35ba52475e
	.xword	0xc9adad73c21fc3d7
	.xword	0xd956b0519f13075c
	.xword	0x18f0ff5733433a46
	.xword	0xdfaa560773e1c509
	.xword	0xb89e18e4986150ca
	.xword	0xea2f62bbdb9e4b10
	.xword	0xe96fd4a56341997e
	.xword	0xc3482a1191ef3294
	.xword	0x29a44165c54ce4ee
	.xword	0x87532790fd3e2887
	.xword	0x96e26ade4412c444
	.xword	0x71d26759c81357a1
	.xword	0x365c9c5d6724b173
	.xword	0xb9ba5a599e28bf12
	.xword	0xf197510feec0f0b8
	.xword	0x5b7b43ca83bc5462
	.xword	0x3add7a589423f7c0
	.xword	0xe4b9cd8f70969c76
	.xword	0x186c4eaa61d7a903
	.xword	0x149a754026499fa3
	.xword	0x15dd29a74ff00d65
	.xword	0xd39d4350aed5b3db
	.xword	0x7b45f02a72a2a2a6
	.xword	0x2741e21b84ddaedc
	.xword	0x257f6d99b97fd5c8
	.xword	0x174f6fa1186b9dc9
	.xword	0x2e42a739e7dafda8
	.xword	0x0bf3228e02860fe1
	.xword	0xb570e10a05b70c49
	.xword	0xe2f55ab14492f3f6
	.xword	0x42a5a436028ea6fb
	.xword	0xef56fa54c9b8720a
	.xword	0x1d61af124a20c423
	.xword	0x8569181356dc1034
	.xword	0xdc7e714c0d2c3a25
	.xword	0x5cadca582f86a358
	.xword	0xa7c5c1dd336145c2
	.xword	0x5084cff1ad128a8c
	.xword	0xa8887703cc271a59
	.xword	0xde9f239030bcecff
	.xword	0xf9f6048436bc9990
	.xword	0x680887b5c3050dfa
	.xword	0x51083ce7b28459c5
	.xword	0x27e9a9b1af9dc3ab
	.xword	0x0e7dbc663901849a
	.xword	0xb4869562ebdc17c3
	.xword	0x24eabcf5542137d7
	.xword	0x5e1030def2d8ae39
	.xword	0xac5fb0336cb64b88
	.xword	0xbe55a893a54b72f9
	.xword	0xdac5a44fe6e32929
	.xword	0xa08fdfd9ba7ff03b
	.xword	0x9461cbb026b6aea7
	.xword	0x4e8f49516f9b8c63
	.xword	0xd26f855b1cc73a0c
	.xword	0x3faa17bcf98ca969
	.xword	0x18ff7c7d44c51bc1
	.xword	0x5c05fc4f76873afc
	.xword	0xea0a6da31baa1920
	.xword	0x8d55ebda7467ade7
	.xword	0xbb267431aaa7c1aa
	.xword	0x52d1ca754abc74ab
	.xword	0xf8f1695e4d9d64c7
	.xword	0xe2163ddfaa12d6a8
	.xword	0x781b6239bba1522a
	.xword	0x19da3e41d5df205c
	.xword	0x2abfb92233bf7163
	.xword	0xad8e862ef8329a18
	.xword	0xd878586c322feb6c
	.xword	0xc6150b2905fa2249
	.xword	0xe0b1f51947be5420
	.xword	0x9f62cfde94de97a3
	.xword	0x82ca4c6721b7bc67
	.xword	0xcbc1a0a008c5917e
	.xword	0xb5181cd9f98ae59b
	.xword	0x77ab20cf30b0fd32
	.xword	0x9eb6592fa36beb93
	.xword	0xb7e27b708249bba0
	.xword	0xbdb4efe31f67db32
	.xword	0xc2703ae26c185a84
	.xword	0x574e5914bef7112f
	.xword	0xb5edb7703968949d
	.xword	0x55ca5f2e21effcd3
	.xword	0x6a443c398ba84610
	.xword	0xd56af20bcf5f732f
	.xword	0xeec6487d56155d8c
	.xword	0xbe542053c2e2f838
	.xword	0xefbcbd25e8dabf97
	.xword	0xb648ef4ac1097f08
	.xword	0x9d76b8062e0a6151
	.xword	0xb945a9eb1409348b
	.xword	0x2eb1705a9b7b2aa7
	.xword	0xe8271e63df9a93c9
	.xword	0xdae5f6f1bfd22a11
	.xword	0x4c2b0cd52647e625
	.xword	0xfc846ffb9ce14320
	.xword	0xf6516960709bf1b4
	.xword	0x052d9e20a3aa25d2
	.xword	0x2040fc528a3668b1
	.xword	0x299b84e827275766
	.xword	0xc421f4c1a4023f06
	.xword	0x16c9b12a1ae8363a
	.xword	0x37dcfeff1ae43e32
	.xword	0x3c3ff00e0a199ef3
	.xword	0x90ed801038ff796e
	.xword	0xce4bab16b13877f7
	.xword	0xb7d90d7f47375d9a
	.xword	0xc75e4cbfc0aaae7b
	.xword	0x031aa46cf9ff2e11
	.xword	0x0062d7d5e3d676e8
	.xword	0xb2329f209d3ab3e3
	.xword	0xcd8ec771b651561d
	.xword	0x318d9c1e851fad8e
	.xword	0xa5a089f755d19690
	.xword	0xd3360f911b1b42a0
	.xword	0xbbcb847e5f4c7cc3
	.xword	0xd1246ad563df2c24
	.xword	0xc6103a898e94ae68
	.xword	0x9ce6f88f75d6cb8a
	.xword	0xf46a2518c31dc5dd
	.xword	0xd94faad79397a04c
	.xword	0x9ed5ed5e433025ed
	.xword	0x7849603188559935
	.xword	0x4675723d87956a06
	.xword	0xccf059793d0b8d93
	.xword	0x501282d2925ba2b2
	.xword	0x9b864013a08b3bda
	.xword	0x30e632f3d2c66b36
	.xword	0x13dd779a5ece8cf8
	.xword	0x6f8807742815e250
	.xword	0x6b9b7fa394b8a788
	.xword	0x251b980171336d99
	.xword	0xb18d092695c2bc6e
	.xword	0x3f9e51a489f06707
	.xword	0x657b9cb415a18dd6
	.xword	0xd793324475cbeebc
	.xword	0x6220b9d6d8a9dc77
	.xword	0xca4888ea2c00341a
	.xword	0x84e60e14821d4a1a
	.xword	0xfc4bbc15a25f05a9
	.xword	0xd5b52bd3c815e99f
	.xword	0xf8513a6003b612a4
	.xword	0x476413c62c100c07
	.xword	0x97fbe71df279e0dd
	.xword	0x40845aee3353c1c3
	.xword	0x1f02741b95209ea9
	.xword	0x26e9266ceb928bf3
	.xword	0x03bd4cf3b15917fb
	.xword	0xd6804bb285bbd7d3
	.xword	0xa28d0e0d90526e6b
	.xword	0xffc5043cdc813724
	.xword	0x147ca649fc3d3cd0
	.xword	0x20f96acf3f535440
	.xword	0xb8d4dde7dd33b443
	.xword	0xda87935f75ffe8ff
	.xword	0xe2f26b68c90d6d75
	.xword	0x00fc0806dd583107
	.xword	0x972b4203328a7fc9
	.xword	0xe63eee66ae4caf64
	.xword	0xd443f883ee53256c
	.xword	0x05f603a06aee90cd
	.xword	0x5907f7fe9c924cfe
	.xword	0xc45ae1ec00459b40
	.xword	0xef015a3ce2a9318e



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
	.xword	0xdc24521220a522b7
	.xword	0x431d73068682342c
	.xword	0x0490532d9902f19a
	.xword	0x8391e00babbe5ebe
	.xword	0xb843ab171e9685e4
	.xword	0x47579710ec41c456
	.xword	0x89d6857576f40aa2
	.xword	0xbd5e8d092d64b7f7
	.xword	0x98a43fa6161093f2
	.xword	0xb9bf5dc256110291
	.xword	0xc06e16ea72af7caf
	.xword	0x944bccdd3b11f314
	.xword	0xf80268fd9885b3c3
	.xword	0x1b9f23fbb2131162
	.xword	0x053591516f263c9b
	.xword	0xc308a6413d82fc38
	.xword	0xf493104f37afb1f9
	.xword	0x3aae8871c36a23db
	.xword	0x56e6069aa4e18a54
	.xword	0xc5ade4a73c06367f
	.xword	0x3571b7f4be2398d3
	.xword	0xe6e36502a5c0145f
	.xword	0xa0ed8e987b698104
	.xword	0xe07cab0178406d9d
	.xword	0xc6aebc666911347d
	.xword	0x7069e739ed20ee83
	.xword	0xfc205d4e1aedc2ea
	.xword	0x90135938b038ac2b
	.xword	0x89f888a085e10711
	.xword	0xec7a678189fc1180
	.xword	0x61f836f6b4f3467f
	.xword	0x4c4b99b882c3c93c
	.xword	0xd933473ce62908a9
	.xword	0xec9b44a8c74542a8
	.xword	0x4e68f3e6da5cf319
	.xword	0x3b8f8c4c65b177d3
	.xword	0x68848def7c5c9f4d
	.xword	0xd2c2544aeb154a98
	.xword	0x9459237c862860b6
	.xword	0x052c20c2c7d9e930
	.xword	0x65b5ec26ba2149fe
	.xword	0xd8c1a5a2b73b4f8c
	.xword	0xa2470aee86dfc373
	.xword	0x585a0056371d879f
	.xword	0x21e92c671b1a699c
	.xword	0xd94095bbf939b609
	.xword	0x69454a5a246fd738
	.xword	0xddf1048feeb340f7
	.xword	0xf8df47a8d13f0a13
	.xword	0x8571b70998592706
	.xword	0xa1a513232b42f14a
	.xword	0x97a3695db420df4a
	.xword	0xb83c33e0cde28fa9
	.xword	0xb81d030e04a7d8a9
	.xword	0xd4b63ea4edb02b5f
	.xword	0x191bc2b087db3c65
	.xword	0x08eff9a4c5035822
	.xword	0xc943bfe872538324
	.xword	0xd5d9f71fb46c7044
	.xword	0xbb1acd99672cfa24
	.xword	0x4ffa68dc34e8e88c
	.xword	0x3fc75430f8b40bdd
	.xword	0x0fdab78d257eb2b7
	.xword	0x114e0ad25a0bcfdd
	.xword	0xf0f53e869ff340a8
	.xword	0x07ca9809d1732b7d
	.xword	0xd60b056bc3cd6ebd
	.xword	0x5d5ac783e729d2e6
	.xword	0x44553dd6e830e3e9
	.xword	0x84f6aab4dbc6af06
	.xword	0x7abd486635fe1129
	.xword	0x92e7185f27a3dabb
	.xword	0x87e4f3aaa0cde23e
	.xword	0x018644e03e545b76
	.xword	0xcc25ef4509065c64
	.xword	0x30dd5eb53830efb7
	.xword	0x29456878ddc8b2b8
	.xword	0x96dc9b5192728988
	.xword	0x9c84eea13ed29466
	.xword	0x52ad4bd9b622e985
	.xword	0x9de8f55fd7d96aa7
	.xword	0x2e6a2ba98ab42076
	.xword	0xc265cd28da3d980a
	.xword	0x1f0fdb851a4ccdb9
	.xword	0x2678a0584e926c63
	.xword	0xaea857187f06786f
	.xword	0x45c7be7618dc8257
	.xword	0x19993360ee8e4fbf
	.xword	0x6a4a0ffb20101c0a
	.xword	0xce026020ca7c9a5d
	.xword	0x7c92743a0a4a4bb3
	.xword	0xe59c4af0d099501e
	.xword	0x804bf23200ab86ce
	.xword	0x97c2a5c64565105d
	.xword	0xe05bb988a37e02f2
	.xword	0xc482ef06a0a65433
	.xword	0xb33cadb63f7c82d1
	.xword	0x09c188a74c910240
	.xword	0xbe5949f004f34aaf
	.xword	0x88540109733b2433
	.xword	0x50c259225ed5d0f9
	.xword	0xba739204cab4425d
	.xword	0x043a5657e819f182
	.xword	0x13a79f61a39bedc2
	.xword	0x23e8fcc931875ce1
	.xword	0xea28d02ecceaa6c9
	.xword	0x7e035f83c38bcc53
	.xword	0x183602d655d1c9d4
	.xword	0x18d4f237f32a14c6
	.xword	0x5096feef11dd28ec
	.xword	0xad8740e21f629e17
	.xword	0xcb9eccd691105403
	.xword	0xa594b6a967303b97
	.xword	0x8aac2ffac15ee3e3
	.xword	0xd8a759fde5ec0dca
	.xword	0x8245d1128dc6a584
	.xword	0x6b7ac53428b87d6f
	.xword	0x9d17720930cb6a13
	.xword	0x512ff9b5b8b799f7
	.xword	0x9299e89a66b6e834
	.xword	0x554a5bd57af309d2
	.xword	0x4032ba9997fe8c9f
	.xword	0xe0fb58c68d6ee450
	.xword	0x5988d4dbb71c626f
	.xword	0x36a8beb8d95da537
	.xword	0xc0d4695e1115fcf1
	.xword	0x65bf5c9da118e0a3
	.xword	0x00021608bd798922
	.xword	0xa2480cfa16aa15a1
	.xword	0x2ac01f073b3c2ea2
	.xword	0x90e5e11ab091185c
	.xword	0x5b91f8dc0ceb13f6
	.xword	0x4c3349ed951982ff
	.xword	0x410ef4f6bbf47f2c
	.xword	0x5c7d23cced3be0a0
	.xword	0x7f9373e385944eb2
	.xword	0x664e179b016cdbcf
	.xword	0xb288d08989f8121c
	.xword	0x00c16848e5c2899c
	.xword	0x08f0572e2ab5ada1
	.xword	0xcb0bd5a0a8b2b324
	.xword	0x13d6c6147798aef4
	.xword	0xb7c3460d42bca10c
	.xword	0x829228d1fa6136e8
	.xword	0x600b70d86f7e9d76
	.xword	0xc7a7418ea3726e51
	.xword	0x8101dbe00452e869
	.xword	0xae1cccbe19a2c498
	.xword	0xd3c339094e10b298
	.xword	0xc6855e9a33c0dfb6
	.xword	0x99aa8dc3fda8797e
	.xword	0x67914d44a1d67a4e
	.xword	0x26fced01f4f8a536
	.xword	0xa7f816fdbc1f7e61
	.xword	0xc04f9935c692ddcf
	.xword	0x07921e859b4f30a6
	.xword	0x73896c6720e53f20
	.xword	0x1dee49b192e55342
	.xword	0x872ca9b3619eac01
	.xword	0x3a10bf399c8b3c46
	.xword	0x46c8bbdcfea9bc8c
	.xword	0x5247f90d6c915c03
	.xword	0x4b1830b84a52c63c
	.xword	0xf7465c3fca57e596
	.xword	0xa87d7d8f0c6a565f
	.xword	0xe58390a56c0d7589
	.xword	0xf9901d8ed6813b68
	.xword	0x0f07e52987d6d3fa
	.xword	0x23f32e5f142c7bbf
	.xword	0x5669bceeaa786029
	.xword	0x9d138a1e7d280ac9
	.xword	0xf63c50ad82517cf6
	.xword	0xe1434035453e1073
	.xword	0xe65d954a4559941c
	.xword	0x34696f819646ba35
	.xword	0x49242add6b30a01d
	.xword	0x47a378d7285280ab
	.xword	0x07ef6405f6aca7b4
	.xword	0xb6d964804db40f7f
	.xword	0x5635b86eabb7c4f4
	.xword	0x2914e1133f2c6ad0
	.xword	0xf89c8efd1f75e087
	.xword	0x0a59e4431ea8a5ca
	.xword	0xf8360a099710533d
	.xword	0x4401a7ec51fef06e
	.xword	0x73ca8eb3b67edce1
	.xword	0x5f4acbd8a8cddac4
	.xword	0xb7fee88df413771d
	.xword	0xc540d0ee6369c3ae
	.xword	0x73a619981b0ddd97
	.xword	0x6a93020f3e0894fa
	.xword	0x3001237fd469202f
	.xword	0x88400369aa5a4975
	.xword	0x1b548bd49e766668
	.xword	0xa4a525fe6b38c2f2
	.xword	0x4bd13a6db3537c3c
	.xword	0x870c793507bb695a
	.xword	0xaf511b9d4f8eb95c
	.xword	0xb362df9ce2b61cab
	.xword	0x007542a34ee61ed7
	.xword	0x1906137b4d99af69
	.xword	0x0a75a74e01b7585a
	.xword	0x09401ba5a69e59fc
	.xword	0x978fa49669b83e29
	.xword	0xe35266ae20246b0e
	.xword	0x376186aea4fd6919
	.xword	0x45ae7441496de8e6
	.xword	0xc13e6ccacd4901ae
	.xword	0x89018f96e1d824a4
	.xword	0x85e93965ea1480c4
	.xword	0xe196bb4142f9757d
	.xword	0x995549b73f1d3a1e
	.xword	0x6ba3c531331553c4
	.xword	0x6b3f57ba875c7aa8
	.xword	0xcc717b61c7bc6972
	.xword	0xe0e6c510749d80c3
	.xword	0x60347d43a91f9be1
	.xword	0xdfff583197b26e81
	.xword	0x7180d721fc6f1ebe
	.xword	0x28654e703261f6b6
	.xword	0x02997b16d3cea67b
	.xword	0x0b5fdf14339ec86d
	.xword	0x58ef07fa60e31be3
	.xword	0x6486c1d0362721a2
	.xword	0xe542d3d50bf496c9
	.xword	0x6ec9625328e74a8b
	.xword	0xb9cb8b77349265ab
	.xword	0x078814f4dc38ad63
	.xword	0x21e2dfdeaf638c08
	.xword	0x79f490aec029c731
	.xword	0xc0fddf42a70c07e5
	.xword	0x4b25c837558f1978
	.xword	0x2b843750c1fc02a4
	.xword	0x0829bbb0848a6bc1
	.xword	0x25bf0b051378d6a0
	.xword	0x1a4441feec2ebbce
	.xword	0x71a17c801f2354d4
	.xword	0xd4e4e1429c787bcf
	.xword	0x6eb691420056a73c
	.xword	0x97690dc91335dcc6
	.xword	0x05bce0dfc2e52c0f
	.xword	0x8f17e523c64c0c7c
	.xword	0x549d2e2faeff49a4
	.xword	0xad89521d10acca95
	.xword	0xafa4dd731037039c
	.xword	0xfaa03b021cc77ba2
	.xword	0x63c51f133e58063d
	.xword	0x9ed269473a34ea3e
	.xword	0xd254ca5039f7ae71
	.xword	0x206b86b3098ed916
	.xword	0xf8e6c66f388074f7
	.xword	0xe6c2de69413d62a6
	.xword	0xd00bdb33b5aca0d7
	.xword	0xda58d447affceb72
	.xword	0xb835b637e507d90f
	.xword	0x58841b653c7b3154



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
	.xword	0xcda664b2f8ae8771
	.xword	0xa172fb87afbb4b79
	.xword	0xc987c83d2cc19890
	.xword	0x5e98b6cf7d005167
	.xword	0xc3ffa8b7d95c0cbf
	.xword	0x7f1817ec78204043
	.xword	0xbb9dcfcf0712de90
	.xword	0x5e9875e4f435f58a
	.xword	0x272fe56f9c362ee3
	.xword	0x7423384949031246
	.xword	0x0f2992f63f78a9ea
	.xword	0xdddde97a5357a417
	.xword	0xbfd5f4fc059b7b25
	.xword	0x47bc15e1ab8225be
	.xword	0xe0735caebe04a06a
	.xword	0xeb9b9b7362f0503f
	.xword	0x739f945a0507171a
	.xword	0x9cbdafe130a75e48
	.xword	0x9beffad004591994
	.xword	0xba3ddede848b2fb5
	.xword	0xc53c34e7d7f9e067
	.xword	0xafa8a0a3395c49bc
	.xword	0xe9572c3ce454efdc
	.xword	0xb140b94b868329d5
	.xword	0x669f7478b6f75136
	.xword	0x8bd17128e0642483
	.xword	0xbf5bdefb2e7280e8
	.xword	0x69ebb12ddf41eb8c
	.xword	0x43d76e41e53eb6bd
	.xword	0x0aa3082d4d69dd09
	.xword	0x289a297e9181a4eb
	.xword	0x2f44bdca64b3fad3
	.xword	0xbb644b0c5324ded4
	.xword	0x6b21d5aee885bb25
	.xword	0x2460c5af7cae71ba
	.xword	0x85c06e6f8aefbde9
	.xword	0x72966effcb5b56ea
	.xword	0xe174cf20b0067b32
	.xword	0x59219f53dca3876d
	.xword	0xaca2ba04338865f3
	.xword	0xfac504b59f70e4ab
	.xword	0xe91d87ca58bc152f
	.xword	0x524008849addb58f
	.xword	0xaf8b4685ceb4e7ab
	.xword	0x785d8f346d04a0eb
	.xword	0xaf36888f8be2d4eb
	.xword	0x35d2473b8391017e
	.xword	0x3d5df12b6054edc5
	.xword	0xf384def048e98057
	.xword	0x3d1421f758c7f1f1
	.xword	0x99ecf8e69999a953
	.xword	0xb68bb83fac8ab692
	.xword	0xda11555e5c46e478
	.xword	0x1beefe9004a64134
	.xword	0x4dbb1fc1619b97cf
	.xword	0xa7c989cab0e616db
	.xword	0xf81f196be8fe32b6
	.xword	0xe02bc138d2cffa7d
	.xword	0x3cffef1cb3d412d4
	.xword	0x6965dba07add77fa
	.xword	0xb6a9b6267b7615d3
	.xword	0x0ebcfffd82011595
	.xword	0x9dabc0af3a7a5dce
	.xword	0xb66a89454b752dbd
	.xword	0x3c972cb54ba5128b
	.xword	0x8296b20b25a52f1a
	.xword	0x7b181c3b61366d7a
	.xword	0x6413401ab7d61a0a
	.xword	0xa41b60ff867e8acf
	.xword	0x789c142838b083f1
	.xword	0x767af94111cda93a
	.xword	0x34166780d38fdf29
	.xword	0xe5b6251875c48ccc
	.xword	0xa961e1e931a564ac
	.xword	0x74f5dea07259c129
	.xword	0xf9b9382c0c228998
	.xword	0xf0f2a132d0ddf54a
	.xword	0x0c3871d73a53d601
	.xword	0x0af3be9c41b157e4
	.xword	0x5421ad9052073318
	.xword	0x448990e55ede4e4d
	.xword	0x61381620a746905b
	.xword	0x1645bfdb3c9e0507
	.xword	0xce349ab83afea3d9
	.xword	0x0c24e6c67bec8d34
	.xword	0xf1297c68b2efca8e
	.xword	0x3dc27d52f7efa2a6
	.xword	0x2c5a1d33b7f535ff
	.xword	0xe853f705a614c6c1
	.xword	0x8f887e3dcba95e12
	.xword	0x6e95382c065baa0c
	.xword	0xbefabbe3f6ede215
	.xword	0x6f693cc8a4249d2f
	.xword	0x106da9c92fd34525
	.xword	0x9ff875e43018a373
	.xword	0x373f345b614ff3bc
	.xword	0x8a8bdb57abd94c5d
	.xword	0x9f73fd7202ad7a1f
	.xword	0x7dd5d57828cba4ad
	.xword	0x077e4bee907a9a5b
	.xword	0x2bc9cd851b92fa54
	.xword	0xd09f59cd4cecd5d2
	.xword	0xa0df2166ec883ffe
	.xword	0xdb5e8f41cd1ccabc
	.xword	0x73da78ac78b84bfd
	.xword	0x109cef72c5251c5b
	.xword	0x29c35f50e7dbc38a
	.xword	0xb33835367445d59c
	.xword	0xb15da165732eaf7b
	.xword	0x7dc57b3362e9c05b
	.xword	0xf2db1730f8d01342
	.xword	0xe06ea11a68ca923e
	.xword	0x8f14a5a68de84ba2
	.xword	0x5bb7876ae5662908
	.xword	0x6de879519faab998
	.xword	0x75c256a9646b0de7
	.xword	0xbbe1ea55d3d79a55
	.xword	0x0e9c55a1c64f8e2d
	.xword	0x5b4c53cf1255f109
	.xword	0x02f536b9e80681f0
	.xword	0x3c8f9f59ff02df9c
	.xword	0xf82b4baf7902e379
	.xword	0x678808235e0a0991
	.xword	0xf5898101cb03ccde
	.xword	0x16ec384e91abea20
	.xword	0x3f35259c180e4905
	.xword	0x3e6a730daef064bf
	.xword	0x2a0ebd69fb2d5348
	.xword	0xbdbdcefc76904f48
	.xword	0xae2142e9d99d400f
	.xword	0x3f192497f80b96ed
	.xword	0x5a7622e385f02b44
	.xword	0xbb631dde66906c66
	.xword	0xdf0054df06241f8e
	.xword	0xd8cd0056c05b2c3b
	.xword	0x8ee1a9a8001e486e
	.xword	0x9b566f2ff25df9da
	.xword	0xda9b8ed799d42a1b
	.xword	0x945981b7b61de4e6
	.xword	0x0be5d4436dd1de9b
	.xword	0x6e0d9474236ff052
	.xword	0x23e61b40c424517b
	.xword	0x221096d98fae2d9d
	.xword	0x92c9c67702ae851a
	.xword	0x1d5cf6e10074209d
	.xword	0x3b10daf7a61967ca
	.xword	0xf98f9bde12517c99
	.xword	0xeb46d9aebaaf3c85
	.xword	0x06337817afc611ad
	.xword	0x34c04c5200969e3a
	.xword	0x785ae96f330f57fa
	.xword	0xcd0dd24360f41114
	.xword	0x466e1b8728d4596c
	.xword	0xd97633ea260d767d
	.xword	0x45c28c09d7fe9fb0
	.xword	0xdf6a1ee370f6b3f3
	.xword	0xf31d17f5553ffd7d
	.xword	0xe2135cc6f3131807
	.xword	0xfcf7a7049617ecbd
	.xword	0xf498d7680e5be742
	.xword	0x7e48f77fdd6a0487
	.xword	0x01f6aa5cf48551e0
	.xword	0x419e364421b9675b
	.xword	0x85efc01a9a4449c3
	.xword	0x3c01c80641a4ebbd
	.xword	0x757c1cadba16ffbc
	.xword	0xa006bf0697568e9f
	.xword	0x6b5db0f00d0e4dd2
	.xword	0xc550c0e5218867e4
	.xword	0x71ff84fc503cefb5
	.xword	0xcd675bc4256107ce
	.xword	0xfcedb8db965f64e7
	.xword	0x72a47b69b049be54
	.xword	0x185696e5ad0ac9e6
	.xword	0xc85c5d1af9e50937
	.xword	0x36f78122a600d87b
	.xword	0xd86c4ceeddd2555a
	.xword	0xce9431e1674811ab
	.xword	0x5b7e742dcbf9af18
	.xword	0x20d6387ee5451678
	.xword	0x903450f06777248c
	.xword	0x1403771a48497390
	.xword	0x47041dbf2c07259f
	.xword	0xad943691aeeea783
	.xword	0x81a71ffc9eee8aca
	.xword	0x5c8fe6ac1d65996d
	.xword	0x563b536953abd843
	.xword	0x8e571695790cbbb3
	.xword	0x54e53fa3650294eb
	.xword	0x1745408811850f75
	.xword	0x83e7fbc55a6077c8
	.xword	0x49ca74acdbb850fb
	.xword	0xbfbb64523bb51fa1
	.xword	0x3c48798fc5067dbb
	.xword	0x84d6a71b27397065
	.xword	0xa02abfff8ec0f041
	.xword	0x87ea9c133972b233
	.xword	0x7311910e416c09f6
	.xword	0xf5d60cedede9484a
	.xword	0xe35df0eb71fd31a9
	.xword	0xe8f4a49e7df5572a
	.xword	0x1ed5f5dc1e40a1a1
	.xword	0x05db18d1e3e3a295
	.xword	0x4dcb391672209ec7
	.xword	0x0d69754ee3a47579
	.xword	0x9409692e2095ccf6
	.xword	0xebf810072bf6b993
	.xword	0xb6c39b4ac0228c60
	.xword	0x7c49cd0fea5d1c58
	.xword	0xce4258110183cd2a
	.xword	0x49d7b1c27144c4b8
	.xword	0xc46e3f732bdff22f
	.xword	0xa519bc713a957b12
	.xword	0xdd51633765bb155c
	.xword	0x0dc5ec93ae08271b
	.xword	0x75a391d04ce43534
	.xword	0x143c78063f6d2ad3
	.xword	0x4b0c4a15f6208bc4
	.xword	0xe9dd36949c85a68f
	.xword	0x038b578dfb2d1727
	.xword	0xc55910ea0325b876
	.xword	0xefff65deb9fde15a
	.xword	0x57bb3d0045d1e3c0
	.xword	0x5352c47f5b77a012
	.xword	0x70c233e9490c7bbe
	.xword	0x3e527d8f12dd6598
	.xword	0x6505ffbc73eb6f89
	.xword	0x8f60cb6bc3c8227f
	.xword	0x501d1c69ab0ffd3d
	.xword	0x06135142500e14ae
	.xword	0x6c0e39c40625c918
	.xword	0x697a15f3ceff0897
	.xword	0x9f17876eb814a628
	.xword	0x017fbc0231c69c61
	.xword	0x99f91067d56c8290
	.xword	0x0119ad6399cd95c9
	.xword	0x2d6b2c7b077da3d8
	.xword	0x3477ce5344db362e
	.xword	0x4b13e721ca373e4f
	.xword	0x60100e3ecd8bb402
	.xword	0x07eefee36552cc9f
	.xword	0x0384546f8948b2ed
	.xword	0xa253a73d3adf5175
	.xword	0x8139814d9e2c07eb
	.xword	0x397a56e314904eba
	.xword	0x54a852c4727dc65d
	.xword	0x25ccdf80f1285434
	.xword	0x87cc2e671a02e270
	.xword	0x42351c1bbb3524b7
	.xword	0xeba741ad63949ca3
	.xword	0xea091c493a4cc3fd
	.xword	0x2217c459b414df23
	.xword	0xfbb99e370a3c23b4
	.xword	0x089e5d6b630570d5
	.xword	0x2a00e470a2a2701f
	.xword	0x53d98bba5fd4aebc



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
	.xword	0xb1d62158cddd2065
	.xword	0x3b910ad9db9ffedf
	.xword	0x0e90a3c475c99e35
	.xword	0x1e806b6a9a248e70
	.xword	0xdcc916fd0b867332
	.xword	0x6a4e86021cf892a3
	.xword	0x8a684c07875ca3c1
	.xword	0x963c34a31aa2fb60
	.xword	0xa904247c45eaf230
	.xword	0x8d0c323104b60c51
	.xword	0xb586628993e16d93
	.xword	0x0511694b77e61c10
	.xword	0xd616560856897086
	.xword	0xbd93a01138bdee60
	.xword	0x5d9d8f9cd38ded64
	.xword	0x83c94f0b2fe4c0aa
	.xword	0x17d3dc54f4b3c83a
	.xword	0x07298f3dc398d6a1
	.xword	0x19f28ac15fd0d607
	.xword	0x983b257dc6684173
	.xword	0xb6638697c1b91c0f
	.xword	0xa2189f8884a32869
	.xword	0x6a884f97a4c86a30
	.xword	0xcb757bcf189e1c33
	.xword	0xd74845fc9c269676
	.xword	0xfe60d84474e34cdb
	.xword	0x435a121a08eced6e
	.xword	0xb4e545fc36130baa
	.xword	0x69dad4bef5456b1c
	.xword	0x217eb988ccf0369f
	.xword	0x04c4a5a1870ce788
	.xword	0x4e04bb2f5c0b2963
	.xword	0x4c1187aca1d1c5e5
	.xword	0xce1de1016e705d6f
	.xword	0x9b214f3ca2725e43
	.xword	0x8d60504b9ce690b7
	.xword	0x0655be2471ae6c41
	.xword	0xb30384609537b3b9
	.xword	0x76488720b1f04534
	.xword	0xe23bb1cb0fdd0188
	.xword	0xca5e4b1906f7fe41
	.xword	0x06b19ef7bb605ed4
	.xword	0xb9626c88b154f2ae
	.xword	0x6169fab27e091f42
	.xword	0xf82c9f51fa3e7abd
	.xword	0xc316f7de8cd74095
	.xword	0xa0f4d6fa5dfaff22
	.xword	0x1d2170a949730745
	.xword	0xbddf53bfd5d81963
	.xword	0xec3cd34a8f86d43b
	.xword	0x249871d353d9dfe4
	.xword	0xe74e233991e34450
	.xword	0x9ea4fab76765174d
	.xword	0x2032b6606b0ade29
	.xword	0xbca636653ea87255
	.xword	0xb4aa97232bbc6403
	.xword	0x97ab3aaee076e109
	.xword	0x584985f09615377f
	.xword	0x52b2384874063f5d
	.xword	0xe17738d130634cb7
	.xword	0x6602b95c432773bd
	.xword	0xfec6e990b5ffa68f
	.xword	0x02c6f419d78ff80b
	.xword	0xc9da849ffe970687
	.xword	0xb9020672b3c48ed0
	.xword	0xa037ecd911e0bec1
	.xword	0xbeaa66582ebc52e2
	.xword	0x7b0083515f16083e
	.xword	0xbe80e4958c1c79ce
	.xword	0xf459f9b66c3b79ec
	.xword	0x02d65e6eb23d9a94
	.xword	0xf24dafc2ea8db968
	.xword	0xe0946c35b78172e8
	.xword	0x54a2307dff97a031
	.xword	0x4cefdd8082f44cf6
	.xword	0x36d6eef7923c4da9
	.xword	0x58376ada82449aea
	.xword	0x223868fd85fa13d3
	.xword	0x36ea419209221afa
	.xword	0xfe789857f96462f5
	.xword	0xe0e44c7034db5731
	.xword	0x06375eefefca0f1c
	.xword	0xbdb13cdfad209359
	.xword	0xcd9f4f0ef6516dee
	.xword	0xcfd67e6c8fc4db48
	.xword	0x1dac459d7bdc6bc3
	.xword	0x37861a84cf3b0f68
	.xword	0xd5d0f1a998029199
	.xword	0x9ed99850a164d6e4
	.xword	0x92a3623903ead7b1
	.xword	0x47e0d5f33497c181
	.xword	0x1d40669850dd5403
	.xword	0xf9fb9d52a5c007d5
	.xword	0x2fcd7cb11dbbcce8
	.xword	0xc1969f7d9fcd35a5
	.xword	0x641ac797bb2d4c10
	.xword	0xdcc46b6b84528a29
	.xword	0x24d0739a54de89c0
	.xword	0x73378f6f14066525
	.xword	0xb659a1efe5707e40
	.xword	0x38bc9ae9c7eaf9ac
	.xword	0x6f2f4033e7ed0d61
	.xword	0x2fc31d64aa19c361
	.xword	0x6a662e1f69a1f6fc
	.xword	0xb48561a222a94e50
	.xword	0xc8c6e7473c8c53b6
	.xword	0x07c076bd2858285f
	.xword	0xcb77b596cef17469
	.xword	0x8e889daed46ebd9c
	.xword	0x1fa1dbd39895e86c
	.xword	0xb94b104b42d6075e
	.xword	0x65c89bbe1c5ff77e
	.xword	0xb0ff9f0c0d462b80
	.xword	0x975e9e09164db42e
	.xword	0xe5ced5c2f9bf3115
	.xword	0x2f32f64ebf8a17da
	.xword	0x8da61d81fcab38d9
	.xword	0xde05a36471a0e76a
	.xword	0xde0d72448c3ee00f
	.xword	0x1a6a5b624ed7b9bc
	.xword	0xc2e18ec32839fdce
	.xword	0xee8747087311748b
	.xword	0x2cbacda8ebcc1a6c
	.xword	0xb9de60b87a29a25d
	.xword	0x1ea8387c3dac44c4
	.xword	0x2fb5523073bcc508
	.xword	0x8ef094950cf13e74
	.xword	0x1092f67e19dd06a4
	.xword	0xfc4d2cfbd45a5766
	.xword	0x07585fd9ff1c5c43
	.xword	0x9630a564de75ba64
	.xword	0xf65989a2fa2fb93d
	.xword	0x417285688a810a5a
	.xword	0x1d6491488bb0dced
	.xword	0x0aa3c452c7e4bbc3
	.xword	0xddc2117fee0bb087
	.xword	0x9d4f2e103db839fe
	.xword	0x3e115b3cd9827489
	.xword	0xa1aef94f51d2b775
	.xword	0x1b9689a7a8253057
	.xword	0x067855cfe9e39051
	.xword	0x98dedf1ea6ea1d3b
	.xword	0x40face01bc74c43b
	.xword	0x5028b634f6d885b4
	.xword	0x0330b7e2f1e786b4
	.xword	0xdca6e57b01ff4c2f
	.xword	0xd8057b0ada933c00
	.xword	0x4b9ea78505178f28
	.xword	0xf12ac055c52a5979
	.xword	0x11b8f44dd0952039
	.xword	0x8e2f52bc583ef1a4
	.xword	0x46498893261e3bfb
	.xword	0x761e6ebad82d2a5a
	.xword	0xc4f8b573588f8db3
	.xword	0x8e1828e9595566e4
	.xword	0xa989a6618038bb77
	.xword	0x3b84da76bb1ea639
	.xword	0xb9bd5e93cfcc19c8
	.xword	0xe2230f3a52e5ccb3
	.xword	0x3b0b95af68d3f913
	.xword	0xf8b5efd42266976f
	.xword	0x99aad996f1d12cd1
	.xword	0x38093f7da1123e09
	.xword	0x3c8ef2c853650572
	.xword	0x8605a1884c75e9b0
	.xword	0xc9507886cd2dea6d
	.xword	0x7c1bb8237d174fcf
	.xword	0xdaf6c7ad18ffc92d
	.xword	0xb6fcd573b56bd0f4
	.xword	0x5f32e78ab05d44df
	.xword	0x5bb038a8a4b74245
	.xword	0x913c6ca998b1c17b
	.xword	0xf60051d4a0709393
	.xword	0xabf0d4ae115bad8d
	.xword	0xd1bd95cce87d0cde
	.xword	0xc6aec7f3dbd99843
	.xword	0xfcf8bc05ba1f0a8b
	.xword	0x47996069b7a25e7f
	.xword	0xbd240a60eac2d731
	.xword	0x6157a18f2d3c35fe
	.xword	0xdcdadcb24e35f532
	.xword	0x3717a17b5a4a5304
	.xword	0x31d5426d73eb3bc4
	.xword	0x3f4add8ada2f56ea
	.xword	0xf74dc0666c56251f
	.xword	0x37845730692fceec
	.xword	0xd08dc6b2b8a23a22
	.xword	0xf2972b683a6862f8
	.xword	0x33c1472400a94db1
	.xword	0x4a748c4d5c26cfa4
	.xword	0xe9c9ab98f03d69e2
	.xword	0x2f86210906c0bc49
	.xword	0x5a896dbcb9753f35
	.xword	0x1fbf9761783bb051
	.xword	0x13c33225483c0585
	.xword	0x6a6b020b559c3b2a
	.xword	0xca5a110678d74597
	.xword	0x4890b4011cbd012b
	.xword	0xa8c60a3c0e3b20a6
	.xword	0xb369b4e5dd87638f
	.xword	0x40834672f43acd16
	.xword	0xe3d29acc28d42118
	.xword	0xcf6359f8094a1257
	.xword	0x8cc90872a5ef710d
	.xword	0x2eb925e434cb4570
	.xword	0x487776113b34d1b6
	.xword	0xc48f87fb5bb6484b
	.xword	0x3cb650dd38527db7
	.xword	0xa6edcbbd2c4cc8ed
	.xword	0x915956afbb8b6ca1
	.xword	0x0a975644afbb5502
	.xword	0x7961d5b0c2186f7b
	.xword	0x29c3745c15368c9e
	.xword	0xcebeca9768769752
	.xword	0xc24c4999aa8ef7ec
	.xword	0x2100d0f234e9f7f2
	.xword	0x1cbed4befee5f5c4
	.xword	0xf6a25dbaa38f4f15
	.xword	0x61ef2fb87cc71008
	.xword	0xcf8b604869e5a50e
	.xword	0x3f74b1e3fe5c2e06
	.xword	0x98d1222334270b38
	.xword	0x67de18b5a064375e
	.xword	0xfccca16a2007164d
	.xword	0xaf137cfe2e61dfc5
	.xword	0x717f9dcd1725470d
	.xword	0x178d09ea6b6bb04f
	.xword	0x71c0205818c1f6fc
	.xword	0xbfca97f195c6a04f
	.xword	0xf0323963af373428
	.xword	0x9452d1799ecdae08
	.xword	0x3780717519b6ac19
	.xword	0xf7be852c48886860
	.xword	0xcfbcb49219b2f0ca
	.xword	0x273423e1e6dca891
	.xword	0xbf84bc30f87f14ce
	.xword	0xc18cbcf77d0fb2e8
	.xword	0x66324e1a22b798c9
	.xword	0x6fc9a2da6115e7b0
	.xword	0x49402c3a8f5bee69
	.xword	0xfae5c1b5cbfab980
	.xword	0xb397de6a72ab1551
	.xword	0x428328e04e4c7beb
	.xword	0x9581eac616940b57
	.xword	0x7655aae94bc5f779
	.xword	0xd0089c9a8a2aeb2f
	.xword	0x7c8b39f8adfcb60c
	.xword	0x9cad8e31078d74ba
	.xword	0xbdee667594d49830
	.xword	0xda8d85c3ff5cdf12
	.xword	0xb07f39602f8083fd
	.xword	0x711595b17e97b5ef
	.xword	0x42210463746a9152
	.xword	0x422c9725c8568d9e
	.xword	0x0e61f64133e00a87
	.xword	0xd43086b987247b68



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
!!#   int addr_sel = 0;
!!#   int store_addr = 0;
!!#   int rnd_cnt = 0;
!!#   int invalid_config = 1;
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
!!# #define NCDATA0	2
!!# #define NCDATA1	3
!!# #define NCDATA2	4
!!# #define NCDATA3	5
!!# #define NCDATA4	6
!!# #define NCDATA5	7
!!# #define NCDATA6	8
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#   IJ_set_rvar ("diag.j", 101, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 103, wt_ld, "{30}");
!!#   IJ_set_rvar ("diag.j", 104, wt_st, "{30}");
!!#   IJ_set_rvar ("diag.j", 105, wt_bl, "{30}");
!!#   IJ_set_rvar ("diag.j", 106, wt_alu, "{3}");
!!# 
!!#   IJ_set_rvar ("diag.j", 109, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 110, Rv_Simm13, "13'b0 0000 rrrr r000");
!!#   IJ_set_rvar ("diag.j", 111, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 115, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 124, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 133, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 134, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 137, Rv_memaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 0001 0000 rrrr 0000 0001,"
!!#         "20'{0}");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 149, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0001,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   ! Since we are doing it in the user area, and .1000 are 
!!#   ! init to zeros 
!!#   ! the address is : 0xd01ee000
!!#   IJ_set_rvar ("diag.j", 163, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0010,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 176, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0011,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 188, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0100,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 200, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0101,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 212, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0110,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 224, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0111,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 234, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 245, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 253, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 261, ijdefault, Ft_Rs1, "{6,7,9,10,11,12,13}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 262, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 263, ijdefault, Ft_Rd, "{16..23}");
!!#   IJ_set_ropr_fld    ("diag.j", 264, Rv_ldstD, Ft_Rd, "{16,18,20,22}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 267, ijdefault, Ft_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_ropr_fld    ("diag.j", 268, ijdefault, Ft_Imm_Asi, "{0}");
!!# 
!!#   IJ_bind_file_group("diag.j", 272, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 273, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 276, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 278, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 279, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 280, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 282, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 284, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 285, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 287, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 288, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 289, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 290, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 292, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 293, sjm_5, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 296, th_M, 3, 1, Rv_rand64);
!!# 
!!#   IJ_printf ("diag.j", 298, th_M, "\tmov\t0, %%r8\n");
!!#   IJ_printf ("diag.j", 299, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n", Rv_jbiaddr_pattern0);
!!#   IJ_printf ("diag.j", 300, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n", Rv_jbiaddr_pattern1);
!!#   IJ_printf ("diag.j", 301, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n", Rv_jbiaddr_pattern2);
!!#   IJ_printf ("diag.j", 302, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n", Rv_jbiaddr_pattern3);
!!#   IJ_printf ("diag.j", 303, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n", Rv_jbiaddr_pattern4);
!!#   IJ_printf ("diag.j", 304, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n", Rv_jbiaddr_pattern5);
!!#   IJ_printf ("diag.j", 305, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n", Rv_jbiaddr_pattern6);
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
!!#   IJ_printf ("diag.j", 336, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 337, sjm_5, "\n\nBA LABEL_0\n");
!!# 
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 342,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 344,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 349,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 761, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: set_addr  %rvar  wt_alu |
!!#            load      %rvar  wt_ld |
!!#            alu       %rvar  wt_alu |
!!#            block_ld  %rvar  wt_bl |
!!#            block_st  %rvar  wt_bl |
!!#            store     %rvar  wt_ld | sjm4 | sjm5
!!# 
!!# !inst_type: set_addr load atomics alu store atomics_asi barier
!!# !{
!!# 		!IJ_generate (th_M, $2);
!!# 		!IJ_generate (th_M, $3);
!!# 		!IJ_generate (th_M, $4);
!!# 
!!# 		!IJ_generate (th_M, $5);
!!# 		!IJ_generate (th_M, $6);
!!# 		!IJ_generate (th_M, $7);
!!# !}
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
!!#                    IJ_printf ("diag.j", 797, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 800, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 802, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 803, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 807, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 808, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 809, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 810, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 812, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 813, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 826, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 831, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 835, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 836, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 838, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 839, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 853, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 857, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 858, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 875, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 880, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 881, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 883, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 884, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 886, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 887, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 892, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 893, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 895, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 896, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 913, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 916, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 918, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 919, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 923, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 924, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 925, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 926, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 928, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 929, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 942, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 947, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 951, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 952, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 954, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 955, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 970, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 973, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 975, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 976, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 991, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 994, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 995, Rv_rand32);
!!#                          IJ_printf ("diag.j", 996, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1001, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1003, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 1017, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 1023, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 1027, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 1042, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1044, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 1046, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1052, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1053, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1080, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 1086, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1087, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1090, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1092, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1101, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1103, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1121, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1127, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1132, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1134, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 1152, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1155, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1157, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1158, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1161, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1162, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1163, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1164, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1166, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1167, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1180, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1185, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1189, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1190, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1192, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1193, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1207, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1211, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1212, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1229, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1234, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1235, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1237, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1238, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1240, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1241, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1246, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1247, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1249, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1250, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1267, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1270, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1272, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1273, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1277, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1278, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1279, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1280, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1282, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1283, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1296, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1301, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1305, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1306, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1308, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1309, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1325, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1328, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1330, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1331, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1346, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1349, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1350, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1351, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1356, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1358, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1372, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1378, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1382, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1397, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1399, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1401, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1407, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1408, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1435, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1441, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1442, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1445, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1447, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1456, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1458, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1476, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1482, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1487, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1489, sjm_5, "\n");
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
!!# set_addr:  set_memaddr %rvar  wt_alu
!!# ;
!!# 
!!# set_memaddr: mSET_MEMADDR %rvar  wt_alu
!!#                 {
!!# 
!!#                         ! Update the JBI-CONFIG FIFO parameters
!!#                         !invalid_config = 1;
!!#                         !while (invalid_config) {
!!#                         !if (random()%2) {
!!#                         !jbi_config = IJ_get_rvar_val64(Rv_jbi_fifo_wr0_config);
!!#                         !IJ_update_rvar(Rv_jbi_fifo_wr0_config);
!!#                         !} else {
!!#                         !jbi_config = IJ_get_rvar_val64(Rv_jbi_fifo_wr1_config);
!!#                         !IJ_update_rvar(Rv_jbi_fifo_wr1_config);
!!#                         !}
!!#                         !if (((jbi_config>>24) & 0x7) < ((jbi_config>>28) & 0x7)) {
!!#                         !invalid_config = 0;
!!#                         ! }
!!#                         !}
!!# 
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!#                         !        jbi_config);
!!#                         !	IJ_printf (th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         !IJ_printf (th_M, "\tstx\t%%r6, [%%r10]\n");
!!# 
!!#                       IJ_printf ("diag.j", 1531, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern0);
!!#                       IJ_printf ("diag.j", 1533, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_jbiaddr_pattern1);
!!#                       IJ_printf ("diag.j", 1535, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                               Rv_jbiaddr_pattern2);
!!#                       IJ_printf ("diag.j", 1537, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_jbiaddr_pattern3);
!!#                       IJ_printf ("diag.j", 1539, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern4);
!!#                       IJ_printf ("diag.j", 1541, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_jbiaddr_pattern5);
!!#                       IJ_printf ("diag.j", 1543, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_jbiaddr_pattern6);
!!#                 }
!!# ;
!!# 
!!# block_ld :  set_block_ld   %rvar  wt_bl
!!# ;
!!# set_block_ld :  mSET_BLOCK_LD %rvar  wt_bl
!!#                 {
!!#                         rnd_cnt = random() %7;
!!#                         switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1554, th_M, "\tldda\t[%%r6]ASI_BLK_P, %%f0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1555, th_M, "\tldda\t[%%r7]ASI_BLK_P, %%f0\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1556, th_M, "\tldda\t[%%r9]ASI_BLK_P, %%f0\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1557, th_M, "\tldda\t[%%r10]ASI_BLK_P, %%f0\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1558, th_M, "\tldda\t[%%r11]ASI_BLK_P, %%f0\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1559, th_M, "\tldda\t[%%r12]ASI_BLK_P, %%f0\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1560, th_M, "\tldda\t[%%r13]ASI_BLK_P, %%f0\n"); break;
!!#                         default : IJ_printf ("diag.j", 1561, th_M, "\tldda\t[%%r8]ASI_BLK_P, %%f0\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1563, th_M, "\tmembar\t 0x40\n");
!!#                  }
!!# 
!!# ;
!!# 
!!# block_st :  set_block_st   %rvar  wt_bl
!!# ;
!!# set_block_st :  mSET_BLOCK_ST   %rvar  wt_bl
!!#                 {
!!#                         rnd_cnt = random() %7;
!!#                         switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1574, th_M, "\tstda\t %%f0, [%%r6]ASI_BLK_P\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1575, th_M, "\tstda\t %%f0, [%%r7]ASI_BLK_P\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1576, th_M, "\tstda\t %%f0, [%%r9]ASI_BLK_P\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1577, th_M, "\tstda\t %%f0, [%%r10]ASI_BLK_P\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1578, th_M, "\tstda\t %%f0, [%%r11]ASI_BLK_P\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1579, th_M, "\tstda\t %%f0, [%%r12]ASI_BLK_P\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1580, th_M, "\tstda\t %%f0, [%%r13]ASI_BLK_P\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1581, th_M, "\tstda\t %%f0, [%%r7]ASI_BLK_P\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1583, th_M, "\tmembar\t 0x40\n");
!!#                  }
!!# 
!!# ;
!!# 
!!# load: gLOAD  %rvar  wt_ld 
!!# ;
!!# 
!!# store: gSTORE  %rvar  wt_st
!!# ;
!!# 
!!# alu: gALU  %rvar  wt_alu
!!# ; 
!!# 
!!# ! add only non-asi and then extend it ( add CASA later ) 
!!# atomics : tSWAP_R | tSWAP_I | tLDSTUB_R | tLDSTUB_I
!!# ;
!!# 
!!# atomics_asi : tSWAPA_R | tSWAPA_I | tLDSTUBA_R | tLDSTUBA_I | tCASA_I | tCASA_R | tCASXA_I | tCASXA_R
!!# ;
!!# 
!!# barier      : tMEMBAR | tSTBAR 
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
