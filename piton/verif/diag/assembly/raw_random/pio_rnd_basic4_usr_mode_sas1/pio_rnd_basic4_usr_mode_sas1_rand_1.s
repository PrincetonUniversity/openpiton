// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_usr_mode_sas1_rand_1.s
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
   random seed:	558464284
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

	setx 0xd7670831e98ec9ba, %g1, %g0
	setx 0xe2e22dca091907c2, %g1, %g1
	setx 0x9691d3f6000e2a67, %g1, %g2
	setx 0xff5d5f0994566aad, %g1, %g3
	setx 0xe6e0380607d6ee5b, %g1, %g4
	setx 0xc5de38217ee444a6, %g1, %g5
	setx 0x0ae189ab69fdba75, %g1, %g6
	setx 0xf392228ddb23b0a2, %g1, %g7
	setx 0x0a8a9c2132642f17, %g1, %r16
	setx 0x589a7ba753162ebc, %g1, %r17
	setx 0x6e09b2cd85256657, %g1, %r18
	setx 0xb7879a5a284aea33, %g1, %r19
	setx 0xba01ee65834402a7, %g1, %r20
	setx 0xfa3bcb521f4ec676, %g1, %r21
	setx 0x60b8df7002c10194, %g1, %r22
	setx 0xfa8a4f78e37a0322, %g1, %r23
	setx 0x43301614d180b03d, %g1, %r24
	setx 0xcdda0c4127b0edf4, %g1, %r25
	setx 0x8756d01a364a8572, %g1, %r26
	setx 0xa5968f8a62b30267, %g1, %r27
	setx 0xdffb1471aec6c5c5, %g1, %r28
	setx 0xe5c57d95e5ac8850, %g1, %r29
	setx 0x2c29329d490af57a, %g1, %r30
	setx 0x02c118f3980a9939, %g1, %r31
	save
	setx 0xab373bb700ec3a2d, %g1, %r16
	setx 0x06b3754dce621133, %g1, %r17
	setx 0x530381a0885aed35, %g1, %r18
	setx 0xa90b20e378f6872a, %g1, %r19
	setx 0x0d9115975320a09c, %g1, %r20
	setx 0x10af9c93a5f0c743, %g1, %r21
	setx 0x9aff5fc44d0259a5, %g1, %r22
	setx 0xe1c725fac19dad74, %g1, %r23
	setx 0x204177af78541f8c, %g1, %r24
	setx 0x98a09af820befb47, %g1, %r25
	setx 0xc1fc21ce784e2768, %g1, %r26
	setx 0x85d93ddd93488729, %g1, %r27
	setx 0x2c495034eb0ba22d, %g1, %r28
	setx 0x8cf4eb235c6f04e6, %g1, %r29
	setx 0x5389d76fbb206985, %g1, %r30
	setx 0xf7ec59ca3197326f, %g1, %r31
	save
	setx 0x29cf702c2d7d2a83, %g1, %r16
	setx 0x88a17b11d18bdee5, %g1, %r17
	setx 0x78b10dcf65bd2c42, %g1, %r18
	setx 0x24870bbf1f4b7faa, %g1, %r19
	setx 0xbbf345944fb94140, %g1, %r20
	setx 0x4e253fd3a82e9d27, %g1, %r21
	setx 0xcf4fbe755026c2d4, %g1, %r22
	setx 0x2913f516aa50172b, %g1, %r23
	setx 0xb055c68a41728bf4, %g1, %r24
	setx 0xd80a18ca7277d2d3, %g1, %r25
	setx 0xa8ebaa88cc81e07f, %g1, %r26
	setx 0x56daafd2d209b774, %g1, %r27
	setx 0x848e65553431e418, %g1, %r28
	setx 0x3d3c21990f612f34, %g1, %r29
	setx 0x542df1f33af5838c, %g1, %r30
	setx 0x996013ea28bf0de3, %g1, %r31
	restore
	mov	0, %r8
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d02ef000, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r9
	setx	0x00000000d04ef140, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef100, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xea32c008  ! 1: STH_R	sth	%r21, [%r11 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe23b6008  ! 8: STD_I	std	%r17, [%r13 + 0x0008]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8328008  ! 13: STH_R	sth	%r20, [%r10 + %r8]
	.word 0xe20aa000  ! 14: LDUB_I	ldub	[%r10 + 0x0000], %r17
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xea39e030  ! 17: STD_I	std	%r21, [%r7 + 0x0030]
	.word 0xe6324008  ! 18: STH_R	sth	%r19, [%r9 + %r8]
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r9
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef0c0, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe851e030  ! 26: LDSH_I	ldsh	[%r7 + 0x0030], %r20
	.word 0xe6498008  ! 27: LDSB_R	ldsb	[%r6 + %r8], %r19
	.word 0xaac1a000  ! 28: ADDCcc_I	addccc 	%r6, 0x0000, %r21
	.word 0xe422c008  ! 29: STW_R	stw	%r18, [%r11 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xea71a008  ! 33: STX_I	stx	%r21, [%r6 + 0x0008]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8334008  ! 35: STH_R	sth	%r20, [%r13 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xee3a8008  ! 39: STD_R	std	%r23, [%r10 + %r8]
	.word 0xe0428008  ! 40: LDSW_R	ldsw	[%r10 + %r8], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec736010  ! 45: STX_I	stx	%r22, [%r13 + 0x0010]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec198008  ! 47: LDD_R	ldd	[%r6 + %r8], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa21aa020  ! 49: XOR_I	xor 	%r10, 0x0020, %r17
	.word 0xe2326038  ! 50: STH_I	sth	%r17, [%r9 + 0x0038]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072c008  ! 53: STX_R	stx	%r16, [%r11 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe421c008  ! 55: STW_R	stw	%r18, [%r7 + %r8]
	.word 0xec526038  ! 56: LDSH_I	ldsh	[%r9 + 0x0038], %r22
	.word 0xe229a038  ! 57: STB_I	stb	%r17, [%r6 + 0x0038]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r9
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef1c0, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa48b2028  ! 63: ANDcc_I	andcc 	%r12, 0x0028, %r18
	.word 0xee326038  ! 64: STH_I	sth	%r23, [%r9 + 0x0038]
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r9
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef0c0, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe439e038  ! 68: STD_I	std	%r18, [%r7 + 0x0038]
	.word 0xacb1e038  ! 69: ORNcc_I	orncc 	%r7, 0x0038, %r22
	.word 0xea198008  ! 70: LDD_R	ldd	[%r6 + %r8], %r21
	.word 0xee09a030  ! 71: LDUB_I	ldub	[%r6 + 0x0030], %r23
	.word 0xe23b4008  ! 72: STD_R	std	%r17, [%r13 + %r8]
	.word 0xe0332030  ! 73: STH_I	sth	%r16, [%r12 + 0x0030]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe42a8008  ! 76: STB_R	stb	%r18, [%r10 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec32a000  ! 78: STH_I	sth	%r22, [%r10 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83b0008  ! 81: STD_R	std	%r20, [%r12 + %r8]
	.word 0xe2726008  ! 82: STX_I	stx	%r17, [%r9 + 0x0008]
	.word 0xe84a4008  ! 83: LDSB_R	ldsb	[%r9 + %r8], %r20
	.word 0xec3a6010  ! 84: STD_I	std	%r22, [%r9 + 0x0010]
	.word 0xe64ac008  ! 85: LDSB_R	ldsb	[%r11 + %r8], %r19
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xee332038  ! 90: STH_I	sth	%r23, [%r12 + 0x0038]
	.word 0xee032030  ! 91: LDUW_I	lduw	[%r12 + 0x0030], %r23
	.word 0xee2a8008  ! 92: STB_R	stb	%r23, [%r10 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2ae020  ! 94: STB_I	stb	%r22, [%r11 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa8234008  ! 102: SUB_R	sub 	%r13, %r8, %r20
	.word 0xe0134008  ! 103: LDUH_R	lduh	[%r13 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xee3a6000  ! 105: STD_I	std	%r23, [%r9 + 0x0000]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xac12e018  ! 107: OR_I	or 	%r11, 0x0018, %r22
	.word 0xe871a030  ! 108: STX_I	stx	%r20, [%r6 + 0x0030]
	.word 0xe6536038  ! 109: LDSH_I	ldsh	[%r13 + 0x0038], %r19
	.word 0xec228008  ! 110: STW_R	stw	%r22, [%r10 + %r8]
	.word 0xe629e000  ! 111: STB_I	stb	%r19, [%r7 + 0x0000]
	.word 0xe0226018  ! 112: STW_I	stw	%r16, [%r9 + 0x0018]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8330008  ! 114: STH_R	sth	%r20, [%r12 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe8726020  ! 116: STX_I	stx	%r20, [%r9 + 0x0020]
	.word 0xe472a008  ! 117: STX_I	stx	%r18, [%r10 + 0x0008]
	.word 0xe229a000  ! 118: STB_I	stb	%r17, [%r6 + 0x0000]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe471e038  ! 123: STX_I	stx	%r18, [%r7 + 0x0038]
	.word 0xe402c008  ! 124: LDUW_R	lduw	[%r11 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe44b0008  ! 126: LDSB_R	ldsb	[%r12 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xea2b4008  ! 130: STB_R	stb	%r21, [%r13 + %r8]
	.word 0xe02aa000  ! 131: STB_I	stb	%r16, [%r10 + 0x0000]
	.word 0xea426018  ! 132: LDSW_I	ldsw	[%r9 + 0x0018], %r21
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0a30008  ! 134: SUBcc_R	subcc 	%r12, %r8, %r16
	.word 0xe0098008  ! 135: LDUB_R	ldub	[%r6 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xea39a010  ! 138: STD_I	std	%r21, [%r6 + 0x0010]
	.word 0xe22ac008  ! 139: STB_R	stb	%r17, [%r11 + %r8]
	.word 0xe8226038  ! 140: STW_I	stw	%r20, [%r9 + 0x0038]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe239c008  ! 142: STD_R	std	%r17, [%r7 + %r8]
	.word 0xec528008  ! 143: LDSH_R	ldsh	[%r10 + %r8], %r22
	.word 0xe6118008  ! 144: LDUH_R	lduh	[%r6 + %r8], %r19
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xee0a6020  ! 147: LDUB_I	ldub	[%r9 + 0x0020], %r23
	.word 0xa0128008  ! 148: OR_R	or 	%r10, %r8, %r16
	.word 0xe8734008  ! 149: STX_R	stx	%r20, [%r13 + %r8]
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xee3a4008  ! 151: STD_R	std	%r23, [%r9 + %r8]
	.word 0xee19a020  ! 152: LDD_I	ldd	[%r6 + 0x0020], %r23
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xee598008  ! 154: LDX_R	ldx	[%r6 + %r8], %r23
	.word 0xee5b2030  ! 155: LDX_I	ldx	[%r12 + 0x0030], %r23
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xea49a038  ! 158: LDSB_I	ldsb	[%r6 + 0x0038], %r21
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0336028  ! 160: STH_I	sth	%r16, [%r13 + 0x0028]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0034008  ! 162: LDUW_R	lduw	[%r13 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r9
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe41ac008  ! 165: LDD_R	ldd	[%r11 + %r8], %r18
	.word 0xe25aa018  ! 166: LDX_I	ldx	[%r10 + 0x0018], %r17
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe6224008  ! 169: STW_R	stw	%r19, [%r9 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xea4a4008  ! 171: LDSB_R	ldsb	[%r9 + %r8], %r21
	.word 0xe0018008  ! 172: LDUW_R	lduw	[%r6 + %r8], %r16
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0224008  ! 175: STW_R	stw	%r16, [%r9 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xee39e010  ! 177: STD_I	std	%r23, [%r7 + 0x0010]
	.word 0xe272a010  ! 178: STX_I	stx	%r17, [%r10 + 0x0010]
	.word 0xe042e000  ! 179: LDSW_I	ldsw	[%r11 + 0x0000], %r16
	.word 0xee398008  ! 180: STD_R	std	%r23, [%r6 + %r8]
	.word 0xe4324008  ! 181: STH_R	sth	%r18, [%r9 + %r8]
	.word 0xe819a000  ! 182: LDD_I	ldd	[%r6 + 0x0000], %r20
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe851a010  ! 184: LDSH_I	ldsh	[%r6 + 0x0010], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe22aa000  ! 189: STB_I	stb	%r17, [%r10 + 0x0000]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe83a8008  ! 191: STD_R	std	%r20, [%r10 + %r8]
	.word 0xea2b2008  ! 192: STB_I	stb	%r21, [%r12 + 0x0008]
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xea398008  ! 198: STD_R	std	%r21, [%r6 + %r8]
	.word 0xe859e030  ! 199: LDX_I	ldx	[%r7 + 0x0030], %r20
	.word 0xe031a028  ! 200: STH_I	sth	%r16, [%r6 + 0x0028]
	.word 0xe62b2030  ! 201: STB_I	stb	%r19, [%r12 + 0x0030]
	.word 0xee11a030  ! 202: LDUH_I	lduh	[%r6 + 0x0030], %r23
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe451a000  ! 205: LDSH_I	ldsh	[%r6 + 0x0000], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe41a4008  ! 208: LDD_R	ldd	[%r9 + %r8], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe251a038  ! 212: LDSH_I	ldsh	[%r6 + 0x0038], %r17
	.word 0xe4528008  ! 213: LDSH_R	ldsh	[%r10 + %r8], %r18
	.word 0xe43a8008  ! 214: STD_R	std	%r18, [%r10 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xee3a6010  ! 216: STD_I	std	%r23, [%r9 + 0x0010]
	.word 0xe8236028  ! 217: STW_I	stw	%r20, [%r13 + 0x0028]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xea59a030  ! 219: LDX_I	ldx	[%r6 + 0x0030], %r21
	.word 0xee51a018  ! 220: LDSH_I	ldsh	[%r6 + 0x0018], %r23
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec398008  ! 222: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe8398008  ! 223: STD_R	std	%r20, [%r6 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe222a030  ! 226: STW_I	stw	%r17, [%r10 + 0x0030]
	.word 0xe239c008  ! 227: STD_R	std	%r17, [%r7 + %r8]
	.word 0xa031c008  ! 228: ORN_R	orn 	%r7, %r8, %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xea19c008  ! 230: LDD_R	ldd	[%r7 + %r8], %r21
	.word 0xe2126020  ! 231: LDUH_I	lduh	[%r9 + 0x0020], %r17
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xee128008  ! 234: LDUH_R	lduh	[%r10 + %r8], %r23
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec09c008  ! 236: LDUB_R	ldub	[%r7 + %r8], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r9
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef100, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4230008  ! 246: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xec532010  ! 247: LDSH_I	ldsh	[%r12 + 0x0010], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe40a4008  ! 249: LDUB_R	ldub	[%r9 + %r8], %r18
	.word 0xe8398008  ! 250: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe65a6030  ! 251: LDX_I	ldx	[%r9 + 0x0030], %r19
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe2418008  ! 253: LDSW_R	ldsw	[%r6 + %r8], %r17
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xee024008  ! 256: LDUW_R	lduw	[%r9 + %r8], %r23
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa421a028  ! 259: SUB_I	sub 	%r6, 0x0028, %r18
	.word 0xa69b0008  ! 260: XORcc_R	xorcc 	%r12, %r8, %r19
	.word 0xee1b4008  ! 261: LDD_R	ldd	[%r13 + %r8], %r23
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec51e038  ! 263: LDSH_I	ldsh	[%r7 + 0x0038], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe471c008  ! 268: STX_R	stx	%r18, [%r7 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8398008  ! 272: STD_R	std	%r20, [%r6 + %r8]
	.word 0xee3aa010  ! 273: STD_I	std	%r23, [%r10 + 0x0010]
	.word 0xea418008  ! 274: LDSW_R	ldsw	[%r6 + %r8], %r21
	.word 0xa8926030  ! 275: ORcc_I	orcc 	%r9, 0x0030, %r20
	.word 0xe8232008  ! 276: STW_I	stw	%r20, [%r12 + 0x0008]
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d02ef000, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r9
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec034008  ! 281: LDUW_R	lduw	[%r13 + %r8], %r22
	.word 0xec518008  ! 282: LDSH_R	ldsh	[%r6 + %r8], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe431a008  ! 284: STH_I	sth	%r18, [%r6 + 0x0008]
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa42ac008  ! 286: ANDN_R	andn 	%r11, %r8, %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r9
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe2426008  ! 293: LDSW_I	ldsw	[%r9 + 0x0008], %r17
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xee398008  ! 295: STD_R	std	%r23, [%r6 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xee41e028  ! 298: LDSW_I	ldsw	[%r7 + 0x0028], %r23
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40



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
	.xword	0xd4ad8f45c921b6a9
	.xword	0xc0db7b85b3f507d9
	.xword	0xde940ae2864d989a
	.xword	0x8345ebb221f72025
	.xword	0x174262fa38836d59
	.xword	0x3bf3e7286d23b271
	.xword	0x53b89981070ec57f
	.xword	0x35c87112d949fde4
	.xword	0x3cd884ab246c1690
	.xword	0x81a9ba9d644608c5
	.xword	0xee8142014ab4d874
	.xword	0xae5e85f8e571dea7
	.xword	0xe37e045bab55d87a
	.xword	0xae1c751577ac897c
	.xword	0x7f9de73e2df4a18f
	.xword	0xe6e285324b06414e
	.xword	0xfc2d5839b09d866e
	.xword	0x1c5b97a024b605a9
	.xword	0x7f99de058af319db
	.xword	0xef4a6581d1da40c8
	.xword	0x72867fb301cf1c50
	.xword	0x5685669756306235
	.xword	0x9167abd8f727506e
	.xword	0x8aa0102dd481a265
	.xword	0x68f34a34592eac3b
	.xword	0xd46c03e701920379
	.xword	0xeb21c59ef8e419ee
	.xword	0x6f4ffef0514f7f8d
	.xword	0x71c6e39ee221c7a8
	.xword	0x32d859b432ca86ec
	.xword	0x80c616b8344ae3d6
	.xword	0x705edec00972f1ce
	.xword	0x63c4de7cee5b8ab0
	.xword	0x1ff7c3e26365010a
	.xword	0x7822afa49186fc17
	.xword	0xf367df5fd0901db7
	.xword	0x694ec7b53d50b90c
	.xword	0xe6abeb2720fa4726
	.xword	0xe90ef28671eb443b
	.xword	0xd8eceffe2554785a
	.xword	0xd0c51851a3a42984
	.xword	0x10ad683336858d0b
	.xword	0x76bf912129290bab
	.xword	0x4a406342b4d0aecc
	.xword	0xba5cc73e815ffe48
	.xword	0xe38602db17aecf27
	.xword	0xa9e12817380db867
	.xword	0x00525b4fd007df0a
	.xword	0xe308a47c05c5c419
	.xword	0x192b0738ef9477bd
	.xword	0xf8e71d8065ae5b6b
	.xword	0x797967ed8ebd2a4e
	.xword	0xb280eed2bd3b6ec7
	.xword	0xfee3039bde4e9753
	.xword	0xc5cdf1b9f7d66c2a
	.xword	0x408c5361de7502ea
	.xword	0x6b4b44ef9f54946b
	.xword	0xefef38181440b4b6
	.xword	0x3ca69b7bea096870
	.xword	0x2d755c1532e2c261
	.xword	0x96a5fc043544f86b
	.xword	0xccd8d2added6d183
	.xword	0x2120e1d1b0e0fa73
	.xword	0x7ac05504d8aedf8a
	.xword	0xbd97d1b19d6a206f
	.xword	0xb154a8b8f1cc9cba
	.xword	0x363906bcabff8500
	.xword	0x5e5183a26d435a89
	.xword	0x13c647375d87b163
	.xword	0x39dea16961ed55e9
	.xword	0x856a0784b6b78168
	.xword	0xc9c582446e7be424
	.xword	0x0744ba1c08f2d83e
	.xword	0x7093121e390adebb
	.xword	0x9815509c049e4936
	.xword	0xa9b50b0d936dd87e
	.xword	0xfdf9c05d3e5430a2
	.xword	0xa58ed2ebdd15d1c4
	.xword	0xf21fcf44e54ffaac
	.xword	0xa79ff810e7f2dc76
	.xword	0x254b0295d476913d
	.xword	0x8f69dbe6b0f4fff9
	.xword	0x9378abea17c39eae
	.xword	0xdab251bb77ee1c78
	.xword	0x4651837528d2f81e
	.xword	0x1183b1e355b75b2a
	.xword	0xb7548762863a320c
	.xword	0xa64e11715e2d135a
	.xword	0x8fbe665be39c193a
	.xword	0xcd6270f8bfac2620
	.xword	0x240e7c45776db229
	.xword	0x0e1c95ecca969f56
	.xword	0x401b29b536f3a093
	.xword	0x816921af086a5f43
	.xword	0xe798b43fa0b47873
	.xword	0xce09e141b5cc0b22
	.xword	0xbbe8e67fb2e682ba
	.xword	0xc8bea30631fd6f9d
	.xword	0x0a8f8fbfaaca8fbd
	.xword	0x5e5ab5eac9edd8a7
	.xword	0x8daaf4167dee9bbd
	.xword	0xbb2a3e66f467d293
	.xword	0x4e575b73c7ff80ab
	.xword	0xdbf93ee87eab5766
	.xword	0x2721604b2231c584
	.xword	0x4ba879325cf6ee50
	.xword	0x86bc44da4746d742
	.xword	0x543bfb82212c0625
	.xword	0x6e1ede0ea2174b80
	.xword	0x169f108b152560c8
	.xword	0xc5bf6581f0cd22dd
	.xword	0x9e67b4abe1baf1b0
	.xword	0x0a72276ea212a6cc
	.xword	0x0f6642c672dc7324
	.xword	0x86742a7570c75829
	.xword	0xef7570fd7c61b8c0
	.xword	0x7051290d5c5d5bd5
	.xword	0x12ef84aa0aaf7302
	.xword	0x06f26a32e00ae61c
	.xword	0x0887b537ea3d60b9
	.xword	0x98dd670395500b11
	.xword	0x576941719cdbb0bb
	.xword	0x9c79a221fb30fe19
	.xword	0x4055665b43834121
	.xword	0xe5904a4c3a1512f0
	.xword	0xfe49d232cbc3941c
	.xword	0xfd811b8c6b0fa3b6
	.xword	0xff00be2214409c03
	.xword	0x33b82975af0df768
	.xword	0xc295aea414653f42
	.xword	0xedb4a483469bb5d7
	.xword	0x74241092d2dc6c98
	.xword	0x390f69a01e6d5879
	.xword	0x8dcd4ef9bcc6eafe
	.xword	0xa9be9cd3db19a659
	.xword	0x366bac69cd3d23fe
	.xword	0x847edddfd8788e48
	.xword	0x6acab780f85b325e
	.xword	0xe71fdb87d8722231
	.xword	0x4ed2f04b8dcf4c59
	.xword	0x8132df376186c421
	.xword	0xee373b3324409b1d
	.xword	0xe3008e46a1a0daec
	.xword	0xe95d25f26ebafe3d
	.xword	0xf05b687faac535ee
	.xword	0xc34412d4ae166277
	.xword	0x9e3f515bd98b8f58
	.xword	0x699042350f2cbdf7
	.xword	0x3b3a3682cdfff7c0
	.xword	0x681c88fb19ad59d7
	.xword	0x1e6a21ef7e568b4a
	.xword	0x31ce0c9e27b37443
	.xword	0x4e0cd4a607e4795f
	.xword	0x6a8b49c5ab1e51ad
	.xword	0x03925da4fce80dd6
	.xword	0x1bcbef6054b378c4
	.xword	0xea52f2ef3b20a04e
	.xword	0x8081f9f11990bc69
	.xword	0xa1564765a3ebc85e
	.xword	0x13ebe47cc446bc3f
	.xword	0x0786ba4dc64c711f
	.xword	0x1c6190758f2a50b9
	.xword	0x34d2e754f75020d5
	.xword	0xc963bb30448810b6
	.xword	0xe04fc4673961203b
	.xword	0xcf7ea236766af49c
	.xword	0xceb2bdaa516b11c1
	.xword	0x25aee988c0a5266d
	.xword	0x79ef5b012b32ca2f
	.xword	0xfa642a46d0abe628
	.xword	0x6984b9650f819ccf
	.xword	0xe18b3b508f4b911e
	.xword	0x1dec76e961a81c4d
	.xword	0xd3fc46cad9bf4dac
	.xword	0xc9a2b60725665d0e
	.xword	0x2ea66e4410cc1a2a
	.xword	0xded21da0edace5c0
	.xword	0xcbf3b90186e22b3f
	.xword	0x12e00dc4f0d09812
	.xword	0x9e1fff92238d861c
	.xword	0xf445fdf27b133e75
	.xword	0x16ae7df5c4798f38
	.xword	0x8c944d62d0fcaff8
	.xword	0x2dbdbca27bf2d838
	.xword	0xb6ba7e609b07e2af
	.xword	0x6656301ad40b1ed0
	.xword	0xc92914fe0683242e
	.xword	0x13e2336aa966b30a
	.xword	0xa18bf7b560088fa9
	.xword	0xb801f0d5fa95f1af
	.xword	0x62a6139a894997bd
	.xword	0x50047bda33fdf31c
	.xword	0x6106f954bce81ddf
	.xword	0x56c104753a19bf89
	.xword	0x00a969191de923ef
	.xword	0x97855eaebd5818e8
	.xword	0xd45f581da97d7beb
	.xword	0x04747e064770bd93
	.xword	0x989609794db5ea3e
	.xword	0x0e37bdd75284abee
	.xword	0xb682da6ccceab3c7
	.xword	0xc9bc360fdab5c1c9
	.xword	0xe3a103fcdf304efa
	.xword	0x8406cb6517cd71a1
	.xword	0x58b4746713ace133
	.xword	0x3e7ceb13ba9d8ecf
	.xword	0x1128e3d635679b1c
	.xword	0x30083910a19c4c90
	.xword	0x75699d5d5d15fe6f
	.xword	0x6230718c7ec60635
	.xword	0x67f8b362257ad63b
	.xword	0x94418ac9bca80956
	.xword	0x92482800b6e39a33
	.xword	0xe6f2fdfbaf5414c0
	.xword	0xb98a40021617e2f1
	.xword	0xc393c981210108b8
	.xword	0x0f1a2e0d0f520e6e
	.xword	0xeab260dacb33029b
	.xword	0x9739c72c572d724b
	.xword	0x9db929f29eb0b091
	.xword	0x7c2165e747129d14
	.xword	0xd6802c67281c2de5
	.xword	0x9f42c37acb1b2fba
	.xword	0x73f93c1257c0f8fd
	.xword	0x7ec083c53ab94c53
	.xword	0x0f4f6a10f702326b
	.xword	0xc2c455a44816c96c
	.xword	0x9e5b52e8c03794ac
	.xword	0x49fd0d09d904889f
	.xword	0xca455e8594d9b2ba
	.xword	0x56e2cae6429142a7
	.xword	0x3c608157f946caa0
	.xword	0x73655f6a337d1006
	.xword	0x950b7f66d48f4da4
	.xword	0xa24fdd803e3508d6
	.xword	0xf9705938729e565a
	.xword	0xbf964150a372df4a
	.xword	0x47ee9237d1478858
	.xword	0x6ef67159d000e6ce
	.xword	0xd42a7c08cf3e939e
	.xword	0x5093bd76218890fa
	.xword	0x6dff7f80da835627
	.xword	0x103f6c376f50eecb
	.xword	0x9ecc83b6c62735ec
	.xword	0xb976c0e184f8bd6d
	.xword	0x3c83042887b1cdee
	.xword	0x2b82fbff55802337
	.xword	0xa9ca574a70376c4a
	.xword	0xe9a50f1e68368cb7
	.xword	0xad5aa98e52fdfff0
	.xword	0x428b5e5d27725573
	.xword	0x21babdc63b6650cc
	.xword	0xeca6e8a31004d990
	.xword	0x8c613dfae36eb811
	.xword	0x53038151ed2e7493
	.xword	0xddcd1f518013f56d



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
	.xword	0x8f04406c0a033135
	.xword	0xd860b1d452c387a3
	.xword	0xc13ad05aaeabff95
	.xword	0xc43aaeac6dd938a8
	.xword	0x6ecf5cc38584a98e
	.xword	0x5525900ad51f40bf
	.xword	0xd677afb6b42cfe84
	.xword	0x0c72734f63fe9481
	.xword	0xdc456da457ca81cd
	.xword	0x152127f9adbe53ef
	.xword	0x41907f93d23d7c77
	.xword	0x22847d533b5abb32
	.xword	0x5d362d8ef1e0cab4
	.xword	0x0d8f7e7e9f2737c3
	.xword	0x3f63a2c8341b30c0
	.xword	0x3a873a2c5e4494ce
	.xword	0x2c86a0c7b598b93b
	.xword	0x4c5b8180064b1253
	.xword	0xfa3a85a29c31a9f8
	.xword	0xdc9ab4bdf1c8f614
	.xword	0x05f140f71bae73cc
	.xword	0x931aa06734f10760
	.xword	0x43fee282d5f1b676
	.xword	0x62b59b50187bc7a7
	.xword	0x82f76ffb6ce1b595
	.xword	0x3ac1eafe882b8ff6
	.xword	0x1db0de86ac3136b3
	.xword	0x3253ae931caac5da
	.xword	0x141929da71281c8c
	.xword	0x3409793bbea99d47
	.xword	0x8f2ba0a8afd4b832
	.xword	0xb48f99d8c9f631e6
	.xword	0x9769ef529c093938
	.xword	0x21c8036f5c46acf6
	.xword	0x5494e3377542f982
	.xword	0x8ef4c3d01a0bfec6
	.xword	0x41697bca9d3ea7d3
	.xword	0x4992c0161d941297
	.xword	0x48bbbb3dc97106ed
	.xword	0x10cf33ab32ee70cc
	.xword	0xde02964b5b3c7cdf
	.xword	0x79cc470b622bfb2f
	.xword	0x78f1a9e1f9d2d270
	.xword	0xed1ba56eeefb4b8e
	.xword	0x9454a2638d4224fa
	.xword	0x7db36ae038ca76cc
	.xword	0x99f07a2a1e87fe6d
	.xword	0xa6b2e668b4138c6f
	.xword	0xffc7afb8d6d364b3
	.xword	0x14b11e3e0ab0a547
	.xword	0xd7dd94c4ee1b8dfc
	.xword	0xce549cb0ae4d268a
	.xword	0xebb1dce8b7d7c8c0
	.xword	0xcf7050ea5f7fce09
	.xword	0x940e0445ad1defbb
	.xword	0xfa1361e07a91dd1e
	.xword	0x78551731bb5e741c
	.xword	0x5d5e6c3861ad112f
	.xword	0xe8a8f53606ded793
	.xword	0x518119efb93265f9
	.xword	0xee99f4bff7ae7145
	.xword	0x36082fd5ee358237
	.xword	0x388fc06bd095999e
	.xword	0xc096753760a94657
	.xword	0x454b12d9a08ac5fb
	.xword	0x9057745f1f512b9c
	.xword	0x56520492fccf08d7
	.xword	0xf83b0378d07e2672
	.xword	0x90982f1c3148a51c
	.xword	0x77c8abfaebd6b669
	.xword	0x39997992dcef2dca
	.xword	0xcf3988b7447cc45b
	.xword	0x0985090f3f75162f
	.xword	0x2ae29f5de51354f9
	.xword	0xf45fa1147b8148c7
	.xword	0x8d5f8f90a559bfe2
	.xword	0x52ef909af9953f89
	.xword	0x0695959d9ea44efe
	.xword	0x341ef3bcfdb48e35
	.xword	0xc0d2ad81a49a51ea
	.xword	0x4157471d83fa1c07
	.xword	0x0538bb24d653f66a
	.xword	0x16a6c904ef3b71a1
	.xword	0x4c2ac7ef28e5da26
	.xword	0x84d2f75786ac55ae
	.xword	0x80ca43c8b84cd195
	.xword	0x4b403ee4ba1bb12c
	.xword	0xf97ab85dd1c83125
	.xword	0x94c9c8b418e7a7df
	.xword	0x1ab409cb57b03112
	.xword	0x3089da74b7f83fb3
	.xword	0x78d5274549621814
	.xword	0x9f7c9bf36b3a5408
	.xword	0xdb632d1c40dc6e65
	.xword	0x2650a9cc0efb2701
	.xword	0x669bd63b8e5294be
	.xword	0x938e6b5824dbd6e8
	.xword	0xd49bb6693c20ee31
	.xword	0x9ea19548c67176cb
	.xword	0xa18a7034b2d3334a
	.xword	0x6567c0d17e255bcd
	.xword	0x44690c20174bd84c
	.xword	0x62ba35e6d12e72d5
	.xword	0x763f577cd3cdca1d
	.xword	0x3b41b6047cae8664
	.xword	0x2619a560db71a1af
	.xword	0x7d1db8306ded18bb
	.xword	0x5867aff47dfdb2c2
	.xword	0xc29bd09596dd12ac
	.xword	0xbb9dd5de58feefcc
	.xword	0xda2dd77fd10fc92d
	.xword	0x5ec2e9ef0426838f
	.xword	0x670f3eac31950818
	.xword	0xb7552ec1b57a6604
	.xword	0xfba2293ff0933b7e
	.xword	0xd12d48d8085f36da
	.xword	0xa5958a140448b4f2
	.xword	0xae3bd2db76ccea0a
	.xword	0x637ac8341744dc3f
	.xword	0x4ae95348b058cfae
	.xword	0x0b4e02a3b4dd258f
	.xword	0x6bc7b6f397d4821c
	.xword	0x0c6e7e31c350d009
	.xword	0xd0d2630d6c21f1d2
	.xword	0xac7e2b0d155a8ba6
	.xword	0xfb0e3dfbbcb5fefb
	.xword	0x37af0058744d9488
	.xword	0x55c38e097939211a
	.xword	0x9bc48dcf73bb4225
	.xword	0xef50bf169d27844e
	.xword	0xe25add9134f21aa1
	.xword	0x0bdd73d3fcbd4c24
	.xword	0x9fa6eaf7d8983187
	.xword	0x2e5b937f062ddf4f
	.xword	0x76cc7bf9a0d39f8c
	.xword	0x101506c60e58d8f8
	.xword	0x1ff5b3e9b59ab0cd
	.xword	0x5d16af9b0fc7fd2c
	.xword	0xc4fc01cea0e78f18
	.xword	0xb2f923bdb0aa77cd
	.xword	0x541b097f86a8c772
	.xword	0x74db7a0e43be6644
	.xword	0xe0ed55430c72daa7
	.xword	0xde3a05e1abb460c3
	.xword	0x9aebaabab8be368f
	.xword	0x55f44a4f3eed991c
	.xword	0x43d1a18be142d218
	.xword	0x1ff80cb9bce72d65
	.xword	0xd8c37d55d396e9f0
	.xword	0x8c2334cd33acee92
	.xword	0x9cdbc57feff0df95
	.xword	0x4331b32820f077e4
	.xword	0x9aab3ee2312b0c3a
	.xword	0x9a881e73b35fa2b3
	.xword	0x3d410a86fdf7ed9b
	.xword	0x8df3cde508d130ab
	.xword	0xf6db70f062ddb9f8
	.xword	0xa117dd03746e87d7
	.xword	0x5eba1f13f7139cf4
	.xword	0xf3301ef0a977b145
	.xword	0xd1d56b6fbf5f128b
	.xword	0x1ec86f7e62b99eff
	.xword	0x0eaebec1d2b8c36f
	.xword	0x1955d1fb7acf5216
	.xword	0x1dd938de3e819f5d
	.xword	0x47095dbc73ee6680
	.xword	0x89d09b715bf7b47d
	.xword	0x00874ba608d87f58
	.xword	0x35529f7657a0e2c5
	.xword	0x7f9eb2fbf8891542
	.xword	0xe1cda93c634e1da6
	.xword	0xa54c82c25d3c31bb
	.xword	0xa9dabba9e085e41b
	.xword	0xb130fac75a2760b7
	.xword	0x818cfeb78cc61b2b
	.xword	0xadb5296f1e7445b1
	.xword	0xd36a5ab7ff54cd64
	.xword	0xc580351e7cb3eb3e
	.xword	0x9fd84f5d43b68f1f
	.xword	0x8ae95f8fbcf7149b
	.xword	0xdb4ea26bb20b1dee
	.xword	0x9d50fc963b866248
	.xword	0xed4b5e681e08289d
	.xword	0x60f3e309ee7ed3d7
	.xword	0x618447b18d732d38
	.xword	0xaaa63cc3af9315d3
	.xword	0x52922fd4e7fed17f
	.xword	0x573128aad500eda7
	.xword	0xbabe01a606abd14e
	.xword	0xcabb85aa220b839b
	.xword	0x9b2ace00e83f5309
	.xword	0x1825599016f225a0
	.xword	0x2d66bb64b0f2fd29
	.xword	0xb19f68607e428160
	.xword	0xe15ec2fb2fc1a953
	.xword	0x2c07321bfe8b29d3
	.xword	0x7797088f5d5bf3af
	.xword	0xe03c386063166a71
	.xword	0x3b1356a2b54da943
	.xword	0xcfc9e6432ffbea61
	.xword	0x2dae5a0743b88d7d
	.xword	0x005269c2f8936ddf
	.xword	0xb28f8ec5ff458527
	.xword	0xc5834a3ef38ed7fb
	.xword	0x4b01ebded068f666
	.xword	0xaa91d8a65ad69b54
	.xword	0x9ba96649cd667da7
	.xword	0xabe5a7c17fbd3499
	.xword	0xadc00479f7fdd801
	.xword	0xc9512ba78de77b12
	.xword	0x28be327d6947b139
	.xword	0x2dd492506c54b921
	.xword	0xee9c2107080f4e04
	.xword	0x6f091f2c4e204659
	.xword	0x4b9f52454a35a20c
	.xword	0x9c29b759f8261931
	.xword	0x1f588b5fa69bb61b
	.xword	0xb91d6f2846c435c1
	.xword	0xd5dd5a6404e32232
	.xword	0xbb625f9a98000c2e
	.xword	0x09dac982fc1de949
	.xword	0x86e1e6ae783cd3c4
	.xword	0xfb61a70f1f450885
	.xword	0x3129623596c91f2c
	.xword	0x5ddec8dc9e4aea0f
	.xword	0x523c035ff13b7551
	.xword	0x3a025336dbe60ca1
	.xword	0x3b23012be20a7b78
	.xword	0x209697dbd133ecf4
	.xword	0xf808d5525255c1db
	.xword	0xb82d8ead5de38e3c
	.xword	0xb44c1aa8cac2d725
	.xword	0x199fa611abcae35e
	.xword	0xa3349d3db6b3b8eb
	.xword	0x7a311b65a0d58188
	.xword	0x96ea97ab70596994
	.xword	0x23cf6168d418d525
	.xword	0x70e7743f41f95cee
	.xword	0x748844e79935e8bf
	.xword	0x75216506bd36a9fe
	.xword	0xddc47d745b4c9090
	.xword	0x56d119d268861715
	.xword	0x1466db63fd9337c6
	.xword	0x6656598219c9e098
	.xword	0x7a24c6979e1addb1
	.xword	0x6c4b7ace3bd4bbfb
	.xword	0x1d19d57571289747
	.xword	0xd9c70298f5bdcb15
	.xword	0x628083c6a097dd46
	.xword	0x900a2bf97ed9c1a9
	.xword	0xfc800f34fdcd4b02
	.xword	0xb48d272442b9b153
	.xword	0x138c073215a58e99
	.xword	0xe5f50b294c346d17
	.xword	0xfcccea3c3e4f43e4
	.xword	0xab14a228e7a89081



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
	.xword	0x02f9a6f50965beee
	.xword	0x3ff084ad3a52578f
	.xword	0x552963056e29e2db
	.xword	0xc7a4ea7e24fa9e24
	.xword	0x62ebbb5ea04923f1
	.xword	0xb5192ec4bf21b486
	.xword	0x91c9575556369618
	.xword	0xeab908af792a4864
	.xword	0x3f6fe515e21b9d05
	.xword	0x0beabc3222b840c5
	.xword	0xa20d320d96e64498
	.xword	0xbb9079c131bd222e
	.xword	0xf43f57a3515c1132
	.xword	0xe9287926bb97e152
	.xword	0x56f48d5daa55da64
	.xword	0xf69ad376e9d0fa26
	.xword	0x46691982db56cc77
	.xword	0xed9ff7ce082b7bc6
	.xword	0x2d2519236cd54e9d
	.xword	0x17e39b9a565c01de
	.xword	0xfe53fd62102dfde8
	.xword	0x19fabc948e384067
	.xword	0xd9755b92098c149e
	.xword	0xd24d3b776cbc848e
	.xword	0x6dc9f719ab9f3729
	.xword	0xd32badd468543c4b
	.xword	0xa9389423b0646b71
	.xword	0x61597cac61ebc909
	.xword	0xf841477da3ed4a92
	.xword	0x5814e7b0157f8643
	.xword	0x54ff6288ef2a15dd
	.xword	0x4c48d9f871db3adf
	.xword	0xda5c7f18073403ce
	.xword	0xf88f6bc6dd30c459
	.xword	0x35279e0f56229cbd
	.xword	0xa3eff06294e7797d
	.xword	0x827df2731bfe90ec
	.xword	0xf208ade89b666bff
	.xword	0x20049476302145c0
	.xword	0x871812763f1d82e7
	.xword	0x6b93e5defa94ebb9
	.xword	0x36377586290157e4
	.xword	0x4c00f129b74c0573
	.xword	0x900574c91878d3e6
	.xword	0x4aa285f5e46558f0
	.xword	0x5d92ab68ff5baef0
	.xword	0x16a87b0cefa61ac4
	.xword	0x3318b518c7fc8a79
	.xword	0x393573adba4d8cea
	.xword	0x0217cd563e9b5e86
	.xword	0x4429d575cd08ddfc
	.xword	0x4f5beab62d69599c
	.xword	0x36f57905a2255eaf
	.xword	0x4bdeb05d73daced7
	.xword	0x5b34176cd016c2f1
	.xword	0x8a03a66ceb75c263
	.xword	0x650fdb7174852dcd
	.xword	0xc88bbdcea942addd
	.xword	0x8ffd7934114211c9
	.xword	0x0c3e707dcc9ba3bf
	.xword	0x30ab002c03c93c2d
	.xword	0x1dc609d9357d2c92
	.xword	0x1249ea48cf6c0208
	.xword	0xfd5b954b5ac20b6e
	.xword	0xaed50ed52f5a02ae
	.xword	0xd57c8a98a24f9cfb
	.xword	0x398832c2a514ba78
	.xword	0xa8cc43f7140b76ff
	.xword	0xeb88620c99fdb546
	.xword	0x3e967522d8c04565
	.xword	0x0ad75027375f2ffa
	.xword	0x9c09a72b1cc19b05
	.xword	0xc9a2c2c889e293af
	.xword	0x5eb3afe0846f5459
	.xword	0x1c34c145eba7f1bd
	.xword	0xb4a34f8359683877
	.xword	0xd77f5259ea759d16
	.xword	0x773f347444af406a
	.xword	0x5b0da0e23e346d50
	.xword	0x2ab7a734cd8176a9
	.xword	0x2a9e86278bb07dfd
	.xword	0x74f7739ca29eec99
	.xword	0xde2903f7ddbbd98f
	.xword	0xa4554d60471328ec
	.xword	0x7ec7f9ebfd60602a
	.xword	0x347bab7dbdd85674
	.xword	0x304fa0e014e6cf67
	.xword	0x8cc01a29bb3cc033
	.xword	0x5eb24addb04953ad
	.xword	0x898fefb2b13c3625
	.xword	0xcd8940d12bc3c16d
	.xword	0x24aecf57ef1db845
	.xword	0x722a04eabea62285
	.xword	0xf358cf7d7f21d4ce
	.xword	0x57033d01e2f511e2
	.xword	0x67c8485cd3276da9
	.xword	0x8c6e599c16c7d5d2
	.xword	0x0275627a7f737286
	.xword	0x30880b91571ec7c1
	.xword	0xba42fc894e60a25e
	.xword	0xc7c1a7bb668595e6
	.xword	0xc3fa19b38a7ffd54
	.xword	0xf5a9d035679e3771
	.xword	0x8cdcd1a1b25f0732
	.xword	0xb57e53c8f15d6c85
	.xword	0x0f625428df3c2912
	.xword	0x535ce5f065f6ade9
	.xword	0x076177295a334ca9
	.xword	0x2c8910c6a1aed743
	.xword	0x422745fcc44df945
	.xword	0x957d2c00d6c9f4e5
	.xword	0x945d77c2b552b98d
	.xword	0x3275b06003d9da48
	.xword	0x5fe49b9635666082
	.xword	0x8d317f31b551de3a
	.xword	0x136f5ea6e2dbb68f
	.xword	0xf57f254a6898b569
	.xword	0xd57b77f757186d94
	.xword	0x48f4d4ed73ab0416
	.xword	0x95bd877930a00e8c
	.xword	0xa070df84aeaf5d53
	.xword	0xb01a140f5661c6e2
	.xword	0x7679ebd225234dbb
	.xword	0x6d24ae10cae37fac
	.xword	0x5d622aa17978c948
	.xword	0x531c06ce199cc978
	.xword	0x48f300abf1ce484f
	.xword	0xeacda463dc082b16
	.xword	0x7ba149f79e791a72
	.xword	0x31beab1d08599114
	.xword	0xf67217f352bda0aa
	.xword	0xd8be9c1ac69465e9
	.xword	0x43875bf0a271ed59
	.xword	0xaf13c6cdd6872998
	.xword	0x250db2aebbe99e77
	.xword	0x416e4dbf5f09fc01
	.xword	0x33085c93695380f7
	.xword	0xff618cdcadccb3a5
	.xword	0x3958d16debafba1b
	.xword	0x02b6e2e579c0484d
	.xword	0xb512f61967fb07bb
	.xword	0x9dad9870a92c57f0
	.xword	0x58364c9ca4bb2c02
	.xword	0xeddb5d4649c6aee0
	.xword	0x21a51a771ccf3d78
	.xword	0x4f10f21f40b7d161
	.xword	0x5943ad839823d53e
	.xword	0xfc9254b45bc8f7e2
	.xword	0x77a77ca158d3eefa
	.xword	0x0a22a3b72c47d150
	.xword	0x138633ed457f041c
	.xword	0xc6e639ddcc54e555
	.xword	0x2df802c6ce8c844a
	.xword	0xf5301318a0074d55
	.xword	0xeb95bf1dbaaeb211
	.xword	0xaed79dde1faee49d
	.xword	0xdda3acdb5d37bd10
	.xword	0x6caa3832a8af2010
	.xword	0x2c03de61cb6bdee3
	.xword	0x018204ae9f2fed72
	.xword	0x3a55798fa44bb3a7
	.xword	0x40a5e882796529e4
	.xword	0xde5818f1720c572e
	.xword	0x5d767d0b8595a438
	.xword	0xeb64b54d9b9de27d
	.xword	0xa80e536594186a88
	.xword	0x6a2709134ad82ed1
	.xword	0x1f3ea5e6134b7718
	.xword	0x12949acb3ea81e5e
	.xword	0x205d8840dd917300
	.xword	0x5c0f87b9aa2a854e
	.xword	0xa21942701b04dcc9
	.xword	0xaacc4664cd74ad4d
	.xword	0xbaa26c9733a0a6b2
	.xword	0x19e5f8ed65b96afb
	.xword	0x2f64a5c5276e86a6
	.xword	0xf670492627fdfc62
	.xword	0x0446b4a112e27b28
	.xword	0x975d9459f9adefd7
	.xword	0xf6a8bcc488bab858
	.xword	0x7907b95eca4b166d
	.xword	0x2c9031ae7eb289dd
	.xword	0x467b5a030962c304
	.xword	0x32753ffe24f52d10
	.xword	0x31b24d3629bcb4bd
	.xword	0x9df9ec1d762f27d7
	.xword	0x17f616f8ccd82393
	.xword	0x2637f444885f5a64
	.xword	0x62005b9e13fa80ff
	.xword	0x53e385ffe6b9317f
	.xword	0xbe34a3d3050258f2
	.xword	0x3c345c345eddc34a
	.xword	0x33e4f762f35a0a85
	.xword	0xff8e01449208a29b
	.xword	0xf8bfeba08ed8df41
	.xword	0xb0ff8f01b232da17
	.xword	0x203784db61a77e87
	.xword	0x05a8423361674c3e
	.xword	0xf7790b61949c9257
	.xword	0x0d6b978ffbb0576c
	.xword	0x1bf2c9aea9f2731c
	.xword	0x8779da302bd85d78
	.xword	0xb92b1a4f266e77fb
	.xword	0xd2ba8b598a08ef22
	.xword	0xababfd235b5cd6b3
	.xword	0x966087825a1d37b4
	.xword	0x6315c5fe23f9ba3a
	.xword	0xd79b7a0fda029858
	.xword	0x24317f4e9cef1adc
	.xword	0x6fec70f3f587be79
	.xword	0xc243b389e8e78da5
	.xword	0x45a335870c25c359
	.xword	0x1eeeeb921c9c8d6b
	.xword	0x8793b53433458a00
	.xword	0x7cddbfcb76cbe7f2
	.xword	0xa243cdadc90c7c78
	.xword	0xaa3d71fa0d0916ca
	.xword	0x5ed749163e029546
	.xword	0x04fa030215d11a93
	.xword	0x62bab8b1f53d7703
	.xword	0xc3212ff70598528b
	.xword	0x1a758e0935f8202f
	.xword	0x30940c044bcd5220
	.xword	0xd620f97ffd9b387c
	.xword	0xeabe26151ff2e9c7
	.xword	0x84485d63e76e1d93
	.xword	0xe479fef86c806aeb
	.xword	0x079d1aeeefd6663a
	.xword	0xaa1e01f23e177023
	.xword	0x3d1e14d2ea5f8d33
	.xword	0xfbfe33e71e3eec84
	.xword	0xbc915464329f4cc4
	.xword	0x73971f4f24a37099
	.xword	0x3ccadc8eef979866
	.xword	0x80758a64e3e4cf0d
	.xword	0x3da91b8f239ea7bd
	.xword	0x575afcf3110166f8
	.xword	0x030931842af5d258
	.xword	0x105f4e8e6fef6cb4
	.xword	0xb177d88300368c30
	.xword	0xb0821173c08db707
	.xword	0x9e66dcd7a4541260
	.xword	0x7404efc0663f85eb
	.xword	0x86ebe6050ca463f5
	.xword	0xc5d78d6271569995
	.xword	0x4bc589f2e72d9aa8
	.xword	0xe5e70fa347342814
	.xword	0x910e30295557dd76
	.xword	0x0bdd441d7502c967
	.xword	0x0fe296665c678911
	.xword	0xc9fde16b2f6a77f2
	.xword	0x16aefb17b2a677df
	.xword	0xd8d8c7e6c4c7d2e4
	.xword	0x265b508dac221d7f
	.xword	0xabd519672ac2e066
	.xword	0x2105acb9718a0a46



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
	.xword	0x81a028906f14f3c1
	.xword	0x35f95209163bd5ef
	.xword	0x0ea27bf439fdd35e
	.xword	0x7df638b5d0ac0c66
	.xword	0x9926799838900908
	.xword	0x88229e488f3eea73
	.xword	0x7130a035ef58e3c2
	.xword	0xd4442dec096a4bcf
	.xword	0x7dee1ae178033e1a
	.xword	0x8a2e29ca758ffcd7
	.xword	0xf01ae5d435c22743
	.xword	0x80f99577e45d7a07
	.xword	0xb86b22ec93924c82
	.xword	0xbaefd0ec6fc1a6ad
	.xword	0xe6e7cfa2e5ddbb6b
	.xword	0xd552dc1605cc92f6
	.xword	0x46a6a832810b4e62
	.xword	0x832f7c5b28c28c09
	.xword	0xa41023325b03c5b2
	.xword	0x6d47f50fc57feff7
	.xword	0x67e37a1fce0c3120
	.xword	0xa9a269c7fc503d73
	.xword	0xe56b7171c1fe94dc
	.xword	0x30de448fdddf94c4
	.xword	0x2cb4e37a659c4d29
	.xword	0xfd0da33b792942e9
	.xword	0x4eabf659bdcb28b5
	.xword	0x93c945dd043071d1
	.xword	0x838c5fab113e41e5
	.xword	0xb654c2ad1506558b
	.xword	0x9dfaa2244c360bb4
	.xword	0xe1030e3cc843c3ee
	.xword	0x9556e847f1402376
	.xword	0xcd3f3652161f06a3
	.xword	0x0ba5c598f070787e
	.xword	0x996c0b1393bb7d71
	.xword	0x4c0e5545733e333e
	.xword	0x547521bdd590310a
	.xword	0x4aad95003bf94a71
	.xword	0xa9f6ff4f84df6d02
	.xword	0xe1fd62203bbd3981
	.xword	0xda55807d69824ece
	.xword	0xb0e1f9190159ed72
	.xword	0x7d3e50b3fa38db52
	.xword	0x2ee4d158b7fa49dc
	.xword	0x7b954861372f803a
	.xword	0x752c496ca303ef4f
	.xword	0x40ff43af890be6dd
	.xword	0x41a98aea175fd24e
	.xword	0xee40cfdf1792d725
	.xword	0x728c8225bebd4b09
	.xword	0x0e4793613e0271de
	.xword	0xf50877a08e30dfc3
	.xword	0x048f2beaa89ab61b
	.xword	0x0ac3ee2ad042b4c9
	.xword	0xa1449857a63d0d85
	.xword	0xa579d75d14515a34
	.xword	0x9514da974773a234
	.xword	0xecea7b0825f1bc11
	.xword	0x32e9699279e17170
	.xword	0xf5bbcc6ac94a0dfd
	.xword	0x03af1c3d5be51daf
	.xword	0xa2028fc7aa7d25b4
	.xword	0x011f0901419a3cbe
	.xword	0x196e629b8b9d055d
	.xword	0x1ce4431fc667168e
	.xword	0x97032cc250ccb0b3
	.xword	0x413212cb131e82f4
	.xword	0x1e0f30acc05bb5f9
	.xword	0x4b1e8372f647876f
	.xword	0x857b49c2a1879408
	.xword	0x9c7d015b8b6901b6
	.xword	0x86b7c2d7a39ece3d
	.xword	0x6ece84b5b326ce93
	.xword	0xa2d3d109849b8249
	.xword	0xfe310ed7b2244c81
	.xword	0xd9f0e8ff648ae1c3
	.xword	0xc43432643efa6ed5
	.xword	0x154ffaaadb557e8f
	.xword	0xd10b0b6eaf88841c
	.xword	0x5aa0b7c5c15b8f9d
	.xword	0xceed39c72a8cfc5f
	.xword	0x923911e14d961721
	.xword	0xa1ed526bf84828c5
	.xword	0x71fb982fd9b54656
	.xword	0xda8bc83eaea3a6d8
	.xword	0xbf0093d4d0df6c2e
	.xword	0x6d2382189ccc4955
	.xword	0x22a6d4a17d58099e
	.xword	0x196eb0880b3614ea
	.xword	0xf60be8d195bebfbb
	.xword	0xd4883f95f37dc435
	.xword	0x25620d6b49c5278d
	.xword	0xdb9529a4993f78fe
	.xword	0x44ed4ae739b4fa1e
	.xword	0xea99f54a982624b2
	.xword	0x61718fb90e2b1a30
	.xword	0x2c12d130937728b2
	.xword	0x92cd5fbeb027fbe0
	.xword	0xaf4f0653b228fbd5
	.xword	0xa6f0bb43a028990f
	.xword	0xdf07136417bf5553
	.xword	0x46a3cb7ac766830e
	.xword	0x01075af5ba307149
	.xword	0xa4700703a2d43b74
	.xword	0xad85572286fde5e5
	.xword	0xa73746506e42d804
	.xword	0xf2247dbf5fd08d8a
	.xword	0x9cba328f98f3e009
	.xword	0xf6fec86b23a1ddb2
	.xword	0xcaa152f82c7bf616
	.xword	0x25b99db5f898978b
	.xword	0x5afac8986043a7e7
	.xword	0xcaf029857a8ce13b
	.xword	0xe86c776a75f7b0e2
	.xword	0x8f1231e79c7b454f
	.xword	0x45e1d1f5d50b9041
	.xword	0x1a2566a56038b1ec
	.xword	0x4fcf26f32a5c0731
	.xword	0x1e59f894a0940c03
	.xword	0x8895250d04de4428
	.xword	0x597ca0246a783965
	.xword	0x407272a56b41b114
	.xword	0x091181f887977305
	.xword	0x3c28503ed3bdc991
	.xword	0x44de4132dd4b9317
	.xword	0x408d7e76d111e836
	.xword	0x113ed4f450150a20
	.xword	0x7960b27ad3e8b71c
	.xword	0x38466b45ec3733cd
	.xword	0x606f820fa28d1cab
	.xword	0xe2eb721b9fde8d35
	.xword	0x5f455a1a20eb4f44
	.xword	0x96630cbf2806fc82
	.xword	0xb06ed03ec5f9c709
	.xword	0x89ca20d8b0b74752
	.xword	0x94e4efcaed1a666a
	.xword	0xc4eb84b9c0063384
	.xword	0x8b2ee41c727586bf
	.xword	0x6ec5314cc4628458
	.xword	0xfa0a879a5f99f5d3
	.xword	0xd08ed197b0b9fa35
	.xword	0x806386c6f556efb0
	.xword	0x0dc63bf7994d7cba
	.xword	0x4b948287b832f9f9
	.xword	0x496153663994b245
	.xword	0x32121a113d06498b
	.xword	0xc148d08ca9cca792
	.xword	0x73b540d17afbf6d8
	.xword	0x183c7aa746db5892
	.xword	0x6c7b9743d259359e
	.xword	0x1794bf8375bb7065
	.xword	0x2743bd48f1f3147c
	.xword	0x19ae0e41890491c8
	.xword	0x5b1256d0d165962f
	.xword	0xa1925716e800b2f5
	.xword	0x227f23fb97c1ab46
	.xword	0x28c60e65932944a1
	.xword	0x687bdac05864a5d1
	.xword	0x77bb68c0c5f37c52
	.xword	0xe8a087a781e985cf
	.xword	0x8e7a2ec908dee963
	.xword	0x41154654c608a7d1
	.xword	0xab36a5ae7c911cad
	.xword	0xe37a6396bf1d26bf
	.xword	0xe450c867ff567b8d
	.xword	0x533a88be95ccb0d7
	.xword	0xd0d0bd4f07d831f2
	.xword	0x3c689ddf945285b6
	.xword	0x08fad0c2acec183d
	.xword	0xe4dffb0cd6e44ffb
	.xword	0xb995d75f89520221
	.xword	0x0ad8fc20ececf3e2
	.xword	0xff19590efd530641
	.xword	0x287ec8dee0a353d3
	.xword	0x18ce0e9c220e7174
	.xword	0x38baafc8cead26d7
	.xword	0xd9471f698674a11a
	.xword	0x97425d2653c5302d
	.xword	0x044707ff3a73c4ab
	.xword	0x9491c9abe03d82fa
	.xword	0x3829aa8573f44869
	.xword	0x0716c85552d05365
	.xword	0x6c53602cd21208e4
	.xword	0x78fe7265df6af7ab
	.xword	0xd15c914c7ddb6b23
	.xword	0x54419ff92db2c51d
	.xword	0x406dc69a893fa5fc
	.xword	0x914d187435be65b2
	.xword	0x7a3c01616cc078bd
	.xword	0x116b9cb55b3c3a29
	.xword	0x143ff6ac88d69f14
	.xword	0x928fbc0a83670432
	.xword	0x57de77cb9ce89c03
	.xword	0x7b1d6aa53b2c4369
	.xword	0xad07e0281fa85310
	.xword	0x1ea61a0edd3ee84c
	.xword	0xdde1b7aa3c8e0861
	.xword	0x24b942c918fb6992
	.xword	0xc5a1aa90f9076a0c
	.xword	0x81266d67aface485
	.xword	0xf0828dd1dd585ec2
	.xword	0xd553a8bf092e41c9
	.xword	0xf4a4978f53632384
	.xword	0xdf867c90c543a849
	.xword	0x1f4ff222e8de4721
	.xword	0x767ad895a03cd003
	.xword	0x658236586eaf4561
	.xword	0xa80653db74697d0e
	.xword	0x7ffefcdc6d9266bd
	.xword	0xd2fe1f9e2f772295
	.xword	0x1936652a9fa26c27
	.xword	0x65022a9a9b6f4c84
	.xword	0xe6c1a8af014ab25f
	.xword	0x75ca227255b7772f
	.xword	0x9695787d232cd7da
	.xword	0x7b33fa48f80757ae
	.xword	0x9151a9d58ffe369e
	.xword	0xb780fa0b1bfd7bd4
	.xword	0x23eae0d9b206fbc0
	.xword	0x052754846b8eb1f1
	.xword	0x32980fc04f2ef15b
	.xword	0x2dca2420c7267574
	.xword	0x0dd09409a64bdfaf
	.xword	0xd0325179a7e2c9d6
	.xword	0xf0ae2fd39be24f3b
	.xword	0xd10c389de05f74fa
	.xword	0xd47b63e369109704
	.xword	0xa85bb0b25c7618d0
	.xword	0x3d9584938ad56555
	.xword	0x93eb5513faa4e289
	.xword	0xe0b5147c389586de
	.xword	0x1b31ad7b76d7bcff
	.xword	0x3d5eb33bf18ded56
	.xword	0x0c4934a9f5f93e9a
	.xword	0x851ac59417ec9d3e
	.xword	0x18698d3ae1770d1c
	.xword	0x4cbc98c7c6121c8b
	.xword	0x4eed2f45ee490d1e
	.xword	0x3046b9c61d1e7849
	.xword	0x372d1d841bd3b08c
	.xword	0xe882c28105d0278a
	.xword	0x3b43730f9022c7bd
	.xword	0xc4db3105e3f6bdf5
	.xword	0x6c074f85a0b7f428
	.xword	0xbbf0e8372364dc98
	.xword	0xa10cce10958a8d92
	.xword	0x653a3d599e57069e
	.xword	0x12282652ea7e7f05
	.xword	0x36792a41355732fe
	.xword	0x5f060f600396e3c3
	.xword	0x87e7534083fd8852
	.xword	0xb1564106f4abd84b
	.xword	0xd039e07453875c7c
	.xword	0x4dfe6450686f1330
	.xword	0x4afd8f15bcb82aed



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
	.xword	0x3e13fc5ae33bcaba
	.xword	0xcffef78b5e00e796
	.xword	0xe558b9778074c61d
	.xword	0xddc247bfe08507f6
	.xword	0x8ea03f42b58f5c85
	.xword	0xe5f159bbde17b6d4
	.xword	0xc64b92b8f9253ace
	.xword	0x13c5371f05492d8c
	.xword	0xbcd3afcd7f60cf64
	.xword	0xdd4fb93af09e64be
	.xword	0x0d97cf6cb7ecada7
	.xword	0x62e8e4cfa7377ccd
	.xword	0x7e0c43f0ea2ea831
	.xword	0x1501fd2c0258a5a2
	.xword	0x7387e0f7471298e2
	.xword	0x1028a02233c4c2ce
	.xword	0xb41d619633e0afa7
	.xword	0x9707e496053f1a97
	.xword	0xd471db79fae31d9c
	.xword	0x6b4a58ec6a81eba1
	.xword	0xe1d8bff19e70dc8c
	.xword	0xc1bc980d6d3027b4
	.xword	0xf0cf28644db28cf5
	.xword	0x16366e06a2d2b7bb
	.xword	0x24e6b935c97f2d86
	.xword	0x0cac9f57fc267c65
	.xword	0x3d69704b6969bc6f
	.xword	0x039806bc256d76db
	.xword	0xd1492f7baa8f7107
	.xword	0x27a2f814d43f615f
	.xword	0x68c55d5f2baa8a22
	.xword	0xe4c93c63a6ce9262
	.xword	0x67879574fec0563d
	.xword	0xfa06b08ca8c105cb
	.xword	0xe52bd670db93867a
	.xword	0x1f76bb80cb98e112
	.xword	0x51a1d916e64fbaa2
	.xword	0xac8fdc9d1cf99d99
	.xword	0x08ce70dc743efc89
	.xword	0x0829601f06fb39d5
	.xword	0xb53af4bb5f583019
	.xword	0x989ad08270a7daf7
	.xword	0xa851693486f29d10
	.xword	0x3b79f8e26454dd68
	.xword	0xeaa3e4b160069622
	.xword	0x4e6a7c56ae4cfc5b
	.xword	0x62f3acb78431570f
	.xword	0x41ca959845f084c7
	.xword	0xe3f7398f8485e45e
	.xword	0xbca4a7d5a2cd041e
	.xword	0xfa3762cf249c927a
	.xword	0x084f2d0d52f6bc1f
	.xword	0x2bca6a110c9f5874
	.xword	0x388b8f8c126f580b
	.xword	0x805880499ec3253c
	.xword	0x9ccd89cd0f5ffed1
	.xword	0x2db369e435dbf024
	.xword	0x94bfc79bb67fa914
	.xword	0xaebc119db204145d
	.xword	0x872d587b71e912fc
	.xword	0x4a6a94f3df0ac70f
	.xword	0x7690531c6b10ebb3
	.xword	0x6375200018ae7b6e
	.xword	0x25f22305a5f05856
	.xword	0xcdba6b0551ea4519
	.xword	0x164d90ff34092d51
	.xword	0xa57b3098f7709b9a
	.xword	0x39e61e93d4fff5c9
	.xword	0x03041c4de6b5396e
	.xword	0x97eefd6f46475e4e
	.xword	0xf08fb7776dccdd4b
	.xword	0x79c3cf34d04b8450
	.xword	0xed5f9d5a7d9ed0f2
	.xword	0x71e73b38cce07284
	.xword	0x00cb133762a52116
	.xword	0x2929aca88753b67e
	.xword	0xd9606b2abe0db639
	.xword	0x49c04e43c8aca328
	.xword	0xd38cc9c6f429169a
	.xword	0x4bf05685e398c112
	.xword	0x62e5b7cd7a9c6762
	.xword	0x38856d63c686e90f
	.xword	0xa318f1735911f056
	.xword	0xa0a4eef638121a75
	.xword	0x7fe372ef7d112630
	.xword	0xa90936df73e2ea14
	.xword	0x0b385691c7f5c5b1
	.xword	0x747219ae6be1dfd0
	.xword	0x834d21f739e51a96
	.xword	0x3ec7eb1c1111f4ac
	.xword	0x23f15503dba46fca
	.xword	0x0ce8f77d4b2e3060
	.xword	0x37e70e456402b776
	.xword	0x548113154e98a09c
	.xword	0x10b8b99253725278
	.xword	0x2b63300af7f37c74
	.xword	0x7aa807d938d113b5
	.xword	0x0642d6c30406c467
	.xword	0x56d96e67e22d48f8
	.xword	0x318c59bddfb066a5
	.xword	0x218483ac41fc86ea
	.xword	0x7a37e485197dfc7e
	.xword	0xcfd0c1610bf5b470
	.xword	0x4dc93b241b2cf3c7
	.xword	0xceb1655d5aea9c1d
	.xword	0xe1a69da83123208c
	.xword	0xc2e9a1374ff28b18
	.xword	0x08301e0ae9c58293
	.xword	0x706a769bb0d6aa6a
	.xword	0x6536ca1cbc90807b
	.xword	0x964b08d911d27481
	.xword	0xd09f2b02665d59d9
	.xword	0x579620460b15914d
	.xword	0xc65e886cd9b5e657
	.xword	0x96149c5a7520476c
	.xword	0x5918f94e5436365a
	.xword	0xa04bf29b7aee870c
	.xword	0x11c0a3a7ccffc35a
	.xword	0x02994f2406a3bd61
	.xword	0xac9f0037b668f484
	.xword	0xb1905d230b746c6f
	.xword	0x9b91106575979f6f
	.xword	0x810b363707732c9e
	.xword	0x28001879f60c7e02
	.xword	0x4a8035160d4a69fb
	.xword	0x8989de1f68b21af8
	.xword	0xe7e3f95cf76bb64f
	.xword	0xf4036a2731da59b1
	.xword	0xdac268cfdcd55206
	.xword	0x2cd88143b99eb1ad
	.xword	0xf895f2a950bd8645
	.xword	0x1f76641829833f20
	.xword	0x2caa9cd4f4d32ad9
	.xword	0xd8980cf0c268ebe4
	.xword	0xffff09d554b98ae3
	.xword	0xacf04eb2aa44dfac
	.xword	0x121c0a10f354c3bf
	.xword	0xf59ea1eac9f663cd
	.xword	0x3823220e359f5c8e
	.xword	0x95afb29b62fb0be5
	.xword	0x581689967e489d76
	.xword	0x0bb452428ca60f1b
	.xword	0xec6f32cc7659470c
	.xword	0xaff37ecf4afb2ddd
	.xword	0x4861cf657b1f7df0
	.xword	0x63e69a5cd3858a0f
	.xword	0x5207d4508846bb72
	.xword	0x0c9e21ed10a21d51
	.xword	0x8afabcc589a95862
	.xword	0x3e968946ed04c002
	.xword	0x29798c5522a59962
	.xword	0x2d41958d0149ba20
	.xword	0x98cd4ccb69e27670
	.xword	0x680cddc76e0c93ef
	.xword	0xc6eae596c9a42fcd
	.xword	0x4db985af2e82f134
	.xword	0xb402fda165d8b5bd
	.xword	0x998972c49f360f1a
	.xword	0x96764fad55c93dab
	.xword	0x434565ff12bcca8e
	.xword	0x4f9d5d6f5a40a6c9
	.xword	0x9c8a496cff24e6cf
	.xword	0x78d2a9661415f23b
	.xword	0x856e5bc02db23575
	.xword	0x8cdf7275ffc4ef0f
	.xword	0x29e08c9c751ba5cf
	.xword	0xeab183420cc02404
	.xword	0xd4b250a164862582
	.xword	0x418557e187f3e21c
	.xword	0x73c745c573690d2b
	.xword	0x0d77f28b4e2f2652
	.xword	0x50df2e94da4ed90c
	.xword	0xb1752019e7fe76aa
	.xword	0x3ba4c11401a9e91e
	.xword	0xbc30833d3b89641e
	.xword	0x5ecc286f78e70af5
	.xword	0x642737c345091575
	.xword	0x6bbc4c4087228f3b
	.xword	0x0431516f2f2b36ac
	.xword	0xa10f8e118452011f
	.xword	0x53ed956c274b760a
	.xword	0xdc809d155cf552ab
	.xword	0x4d75a152079192b9
	.xword	0x5de8ff58d9bed33c
	.xword	0xfc09aac7a3f93662
	.xword	0x44b9891551302e54
	.xword	0x0b936a1061ff6deb
	.xword	0x88f196aaa5b1dac4
	.xword	0xa27973a489c323d1
	.xword	0x99b5ee38533cd899
	.xword	0xe91a84eea8b186df
	.xword	0x7e4251c8c4da0d1a
	.xword	0x80cd56f2a4bb8a41
	.xword	0x50d49389a03e486c
	.xword	0x52483ef74268f1be
	.xword	0x4acd60f78c42a1d8
	.xword	0x1713acc05f2486f6
	.xword	0x5f6db41f6242ad87
	.xword	0x1dbeeb0abc71c31d
	.xword	0xc44b22586dd80340
	.xword	0x37ae67667ddcfd0e
	.xword	0x8b6ec65dea402f16
	.xword	0xa2af127e5373beae
	.xword	0xc0b6eeae28bbae50
	.xword	0xa58ae31e9b4b5587
	.xword	0x8652497698d1d3ed
	.xword	0x2e12974aa07a56c7
	.xword	0xdd1343d94d054626
	.xword	0x8a780ad2720ce04f
	.xword	0x824fd8c2be5d0917
	.xword	0x31d896c76b0b0bf9
	.xword	0x07594b26ddad551d
	.xword	0x3a05c42544e2e244
	.xword	0x3ad256d1bbd50b02
	.xword	0x3c9fd0bfdbbc0d03
	.xword	0x83a832dbc226c394
	.xword	0xffaffbc1c596859d
	.xword	0xdbac23e0fc1dfdc9
	.xword	0x0285664080b881bf
	.xword	0x65660c557f639a3d
	.xword	0x813825e905a22856
	.xword	0x551dca78a684c227
	.xword	0xc6567d54841f589f
	.xword	0x9776b808091527d7
	.xword	0xd09c4c0c02ddcd30
	.xword	0x219f4267b6299b32
	.xword	0xc80140e10424005a
	.xword	0x8d4f32c0b43cd541
	.xword	0x0676b3e226b17ba0
	.xword	0xbb1d7da5a8327119
	.xword	0x5e4580d1a41fab61
	.xword	0xbbc68ae1f56a7424
	.xword	0x04f7ac31dac55b9f
	.xword	0x795b0af415a1e8c0
	.xword	0x812704769829db63
	.xword	0xd20d2398dc199e5b
	.xword	0x5857b76f955de5d6
	.xword	0x28abe9ec254619b3
	.xword	0xbbf18faf48667d62
	.xword	0x3dc655144bd04cfd
	.xword	0xaa2d2533b28168ba
	.xword	0x1eedace7764e2271
	.xword	0xcb5ef20a08a4a922
	.xword	0x7afed7e7f74877ee
	.xword	0x4562b2dee476c63d
	.xword	0x994c3496dd9c0e2a
	.xword	0x12c0c67e5f0d0cc1
	.xword	0x5c8e483134c026ab
	.xword	0xaf549d699369b3a7
	.xword	0xf830e151d57ec407
	.xword	0xc040846fed2589de
	.xword	0x4b2772577829e32d
	.xword	0x0081d7f0dafc363b
	.xword	0x668e261566dad1d5
	.xword	0x4df3030253ccc367
	.xword	0x0468f40a643bcae6



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
	.xword	0x1cf9fc32f2878d8b
	.xword	0x4f6dbafff5b487c0
	.xword	0x62feedee918c36a5
	.xword	0x1a9eeea23a3561c3
	.xword	0xaf8453d5c6237f7f
	.xword	0x6f57511d8c6b7fd4
	.xword	0x106535ae268dd3b3
	.xword	0x66e466dd01a1945e
	.xword	0x0b0fa666002afc59
	.xword	0x7f24a87a364abdc3
	.xword	0x859f4b9f082b591c
	.xword	0xab44cc2f1af7eeb6
	.xword	0x8c9aef885a3b1101
	.xword	0x28d070f923e08555
	.xword	0x1c2fd12bc7209674
	.xword	0x83704d05cd0c94dd
	.xword	0x55f258b22bd2bcd2
	.xword	0xe825bbddde952f7f
	.xword	0xab269080647d5144
	.xword	0xa4201437def35bdc
	.xword	0x145e6dfe419f3650
	.xword	0xcf158cadc9e77f9c
	.xword	0x7e301f327aac1a44
	.xword	0x325363005333b29b
	.xword	0x9af9b6788a51f29a
	.xword	0x76767082a2727286
	.xword	0xfbd6a8a98d961a3c
	.xword	0x17eef579bbf867a2
	.xword	0x2469b579ac5a94a2
	.xword	0x75cc97624e8271b6
	.xword	0xca8d793301c6f3e7
	.xword	0x222b63a19113900c
	.xword	0xd37a4d46a382493f
	.xword	0xe1169ca2690fb168
	.xword	0x07ad46251523efc3
	.xword	0x6924c4d2d7bbe3c0
	.xword	0x9acbbf9d5bd06080
	.xword	0x3d14974f169702fd
	.xword	0x1e9d2f6a2fb9774a
	.xword	0x1b8fd7db4eb29f6c
	.xword	0x9bb3a40ff592527e
	.xword	0x14172f93fd711268
	.xword	0x95cd269593a39a94
	.xword	0x6e8cb1c96c681f78
	.xword	0x104d4c059f43cc0c
	.xword	0x4bbb0d764990e0ed
	.xword	0x45ac5317d2d04403
	.xword	0x09114a2ad652b589
	.xword	0x0bb71f135fbf17d5
	.xword	0x248146ea7c8037ca
	.xword	0xcdbae3ea9f2506f7
	.xword	0xd49f2a69975d3385
	.xword	0x135ce09abfce9ac1
	.xword	0x47a86e95da6064a1
	.xword	0xbbb182d4244f3976
	.xword	0xa23f56f8b699ba4b
	.xword	0x60d428556c5c5dc6
	.xword	0x0347e5e3249eada0
	.xword	0x8c0a24d1e0256973
	.xword	0x0825ecbb3e61931a
	.xword	0x4db9a078289f1332
	.xword	0x6dd2a1799c9b60ec
	.xword	0xf1153356dae48d71
	.xword	0x485df5dfef1d3fee
	.xword	0xbb19c81c7e2ca869
	.xword	0x5539bd9787edb940
	.xword	0x4b93038328a23a74
	.xword	0xb70bb8a929e2da85
	.xword	0x0a415af73d75f5e6
	.xword	0x84b8215f7f8ee428
	.xword	0x60f00141c4bba862
	.xword	0x49bb1ce8000f01b4
	.xword	0x9563a737dea087d4
	.xword	0x3cfc4ea2eed53bc6
	.xword	0xe7a6d361cb21a1d8
	.xword	0x23fff50330613759
	.xword	0x3c3026955145e607
	.xword	0xe8d06e33d44f88b0
	.xword	0x83c84f6df490685e
	.xword	0xbe0c0eadda1a94fe
	.xword	0xdf63c493bedec4bf
	.xword	0x9b8cc8ab01949d6c
	.xword	0x3eefbbe16f8067b1
	.xword	0xd34f6aed9b894d7a
	.xword	0x653e46725f6efe47
	.xword	0xc7fd925fc664d87c
	.xword	0x4f3ea5d05d0b2e06
	.xword	0x18e44c1f08ac5cdb
	.xword	0xd72d1b9e3864a050
	.xword	0xc5026d181319e117
	.xword	0x942d61d7ad79739c
	.xword	0xaa38500bc42ef3a9
	.xword	0x7d4d38112548a569
	.xword	0xeb21730be405304a
	.xword	0xa5d9966095af7b71
	.xword	0x4ce7b1c8c6b3644d
	.xword	0x2c0a6c19d0c26106
	.xword	0xb9ff6e53a75c1fb9
	.xword	0xf43fdd3f14b993eb
	.xword	0x37366dc520f81de4
	.xword	0x1e6d7faeef79563d
	.xword	0x4c9d8f0d5c6ca8a0
	.xword	0x4b638feb7d1b68c2
	.xword	0x0fca7c6f1350e519
	.xword	0xfc474d3e533d10b4
	.xword	0xf5c5c9a756a2d737
	.xword	0xa7e18b6de7bf1b43
	.xword	0x665ca0c6fd355ce0
	.xword	0xd886c56000252067
	.xword	0x4877a35024cc8974
	.xword	0x4dd8c7cd1545a0b4
	.xword	0x7aba283dedd9ab46
	.xword	0x683cbe1080da7a17
	.xword	0x1faebafc9690149d
	.xword	0x44cefd8eb3c5c125
	.xword	0x8c04eb675649ef17
	.xword	0xcf60137a2b36bae8
	.xword	0xc8081521b3353f07
	.xword	0x5dded5cbb38892fc
	.xword	0xfae6d03ac8703674
	.xword	0x02ce0219872c9cc1
	.xword	0xf111672aee8ab662
	.xword	0x88d9ac46d9f3d0c0
	.xword	0x767b4a6f3516bf0a
	.xword	0xaba5e4fbecbc24c4
	.xword	0x3cfb773b8243b8b9
	.xword	0xdd7260d8b8909106
	.xword	0x59abe724ff79d8fe
	.xword	0x9fa8e2fc72afbef3
	.xword	0x1970b147077c20cd
	.xword	0x6b145a96b1ad2a38
	.xword	0xc1dde912258827e9
	.xword	0x428554214cb525bf
	.xword	0x8cb8723a278cd4b5
	.xword	0x5397bfc09591fa9b
	.xword	0xeeed2153779e3835
	.xword	0x77c026d8b5f3bb8b
	.xword	0xd63dde4a9b44a4d2
	.xword	0x25b3048cf64206b2
	.xword	0xfafdd9031a1fa842
	.xword	0x96e43e4105fff506
	.xword	0xb06ca4da6d06f882
	.xword	0x5ddd1be1a4d4d772
	.xword	0x98abdf2f7fd2fa2c
	.xword	0x90ee53906a51c19d
	.xword	0x16a3e2736ae0411c
	.xword	0x165513c56dae16ff
	.xword	0xcd650a9992329968
	.xword	0x1d51b29d270ec42a
	.xword	0x61cb857e9bf73aad
	.xword	0x121288ce24ec2b32
	.xword	0x6d5cc72cb539d6ce
	.xword	0x4ddcfe6afbfe72c0
	.xword	0xea50a71d8e1259c9
	.xword	0x65523f915df9f605
	.xword	0x5617dd7e95d0a258
	.xword	0x2cc99bbc5c4690a6
	.xword	0x53e6eec1de1bdbc1
	.xword	0x3b5790ce5d3072a8
	.xword	0x188827aff19e6c3d
	.xword	0xb03270cae63e0f84
	.xword	0xb9ec5fd8623a2e8b
	.xword	0x0274bb3eb402a430
	.xword	0x360c7daec1cded73
	.xword	0xaed9fea2421d3353
	.xword	0x9f3f916a4eaf84d2
	.xword	0x9260f0587d0191cd
	.xword	0x1317264bc55a901d
	.xword	0x670dd5d7b2e7b3af
	.xword	0x9b15354c96e13490
	.xword	0x50640393ad08af04
	.xword	0x024fdc473a58a2c1
	.xword	0xcda97f59bfb6c211
	.xword	0x74c1067d7a0f55ac
	.xword	0x801c36bcf0086275
	.xword	0xefbe6511fca5289a
	.xword	0xe225a4cdc812527e
	.xword	0x765770f93f9ceb9b
	.xword	0xb7631e22e4fc6e03
	.xword	0xc90465e6d26b2db3
	.xword	0x8835763e249f01a2
	.xword	0x0a95f6382701ad67
	.xword	0x0f07948548036855
	.xword	0x1161fff41096f655
	.xword	0x2032cb9500dbec78
	.xword	0xbeb31f9143925981
	.xword	0x56bee5c59c9020b5
	.xword	0xd4af355e4e46582c
	.xword	0xc90a831386b7baa4
	.xword	0x61aa62718fa76912
	.xword	0x94b3ddfd88d92e3c
	.xword	0x6935ed3300481e5c
	.xword	0x7b46096ddfdaf765
	.xword	0xa767734929ca3279
	.xword	0x49ca43056c15bc46
	.xword	0x1d035fa0fd2865e9
	.xword	0x5517b185f6bd1cf9
	.xword	0xe2948728439979f5
	.xword	0xc8c7f6a2055d714b
	.xword	0x4f23bcf0d39c5bf6
	.xword	0x530c098530113881
	.xword	0x58c4ec1541a41c4a
	.xword	0x78111956b834fc95
	.xword	0xd0e7af421d2bbbfb
	.xword	0xc5189d96fae51d09
	.xword	0xc316f59af398ba6b
	.xword	0x9a365960b40cdcab
	.xword	0x9ddf2c436de7976b
	.xword	0xcd186a1466628281
	.xword	0x248ede38435a8f40
	.xword	0xaca84484e80d3773
	.xword	0x6f0fa4e08129375d
	.xword	0xe5121db3a478a58e
	.xword	0xb79c5c2c8d4ea77e
	.xword	0xf78814cdc7a5c774
	.xword	0xb9c9e775cdf90014
	.xword	0xc8bcb7d5fcdb9217
	.xword	0xe811554ddaccc261
	.xword	0x016dbbc81b4ca374
	.xword	0xf17ea864f5f81543
	.xword	0x89e8ac5fd969fea1
	.xword	0xc4cea3a25e0075c2
	.xword	0xd28152248778e410
	.xword	0x9af537165c62f7bb
	.xword	0xe423e73283ddde69
	.xword	0xe2dd208568790336
	.xword	0xdfec0727e336146e
	.xword	0xc33a0989334437dd
	.xword	0x83d25459cae2c1c7
	.xword	0xbc26401727e0e8aa
	.xword	0x1686ecdec563b2a3
	.xword	0xf36fc71c343ee7c5
	.xword	0x1f65ef9184661db0
	.xword	0x082e619c5c251f23
	.xword	0x277cef3a2b3c7bf3
	.xword	0x2fb8059b88592214
	.xword	0x2cc20a21f5348edd
	.xword	0x75793fa77ed3d1ec
	.xword	0xcff23f2ebe5a3470
	.xword	0xe8296d2b6a96ef0c
	.xword	0x9e28af6f35203ee1
	.xword	0xd1856b80419987ba
	.xword	0xe3a103e5344fbbe7
	.xword	0xe3ad9edb5b3808ae
	.xword	0x6fc9c41504129a63
	.xword	0x75bae671271873f7
	.xword	0xe623477a53d7cd24
	.xword	0x72216cccbee7c1d7
	.xword	0x98c342480ed5fd3e
	.xword	0xb726247242715ba0
	.xword	0xe1ba7ca56687c9a8
	.xword	0x2fb62db9196e7d45
	.xword	0x6637ffd0f07f3e23
	.xword	0x6a83f49c645baeb4
	.xword	0x29dcfcf4759a763b
	.xword	0x9903e33a0c2f321e



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
	.xword	0x1b0d28811b2a5ae1
	.xword	0x94e2f8102f8d71b3
	.xword	0xc3a91b21b01ed2f1
	.xword	0xa79900aa1a01ca87
	.xword	0xc2daf11a11f48d90
	.xword	0x900bbf3211e9f502
	.xword	0xfac3252f7470d1e9
	.xword	0x09bd5971ec47f87d
	.xword	0x8d14ecdeabf3b877
	.xword	0x4229ca7eafd1b199
	.xword	0xf13cfd7323191b6b
	.xword	0x0570117225a3e63e
	.xword	0x96bb8a49bd895fd9
	.xword	0xeaac408ff5777a0c
	.xword	0x7f343cc1e55b4c6f
	.xword	0xbe4474b3a5b9fa4e
	.xword	0x0bccc8c32e631337
	.xword	0xd827069cbb071616
	.xword	0x9fcf79e3039c011b
	.xword	0x3d24f86098d2f0c6
	.xword	0x7c566f74969ca8ff
	.xword	0xa38ade3e353d2eb8
	.xword	0x9848562b0d5a2724
	.xword	0x2a857f6bd976c127
	.xword	0x79e1b6b9e126d586
	.xword	0xb33a44a971fdb60e
	.xword	0x7499a693fdc30fca
	.xword	0x5bee546c468a1e2a
	.xword	0x4d3ab12f03c5e725
	.xword	0xea1145ade8952e73
	.xword	0x110452d4a850ed54
	.xword	0xcb869a5d134174fd
	.xword	0xe3c48e037fc89659
	.xword	0xbe74ab0bd750353e
	.xword	0x1d40c65d135727e6
	.xword	0x6aa480ba9e19043f
	.xword	0xbc10410066e02965
	.xword	0x20d33c0ae503d5b1
	.xword	0x39732019527eea9a
	.xword	0xa71327e69a232d9f
	.xword	0x2f876d3b3f0aecfd
	.xword	0x0f68327377028e32
	.xword	0x6904aac63b21c937
	.xword	0xdb36429dc7fee125
	.xword	0x922daadd1f2ef7ef
	.xword	0x000bc7e8b8a0cf22
	.xword	0x5ed86a376b39198d
	.xword	0x7fd484d51d0e2a2d
	.xword	0xab7edbec7ca48db7
	.xword	0xe72613cd37ed3521
	.xword	0xdb13dfa0bedac605
	.xword	0x0bbe3b120636370d
	.xword	0x149e0a48dff1ac70
	.xword	0xf74b17ca54fa09a4
	.xword	0xaf99dc4357e63a71
	.xword	0x7b03b133c83a319e
	.xword	0x692dbaf0c6587bb6
	.xword	0x3024dfa897d15c7f
	.xword	0x36bfbba43b549552
	.xword	0xd760a9bc93fa0212
	.xword	0x0325ef99f81bd639
	.xword	0xe0b71b0db23eee38
	.xword	0xade07d64a8628411
	.xword	0x6d7c020e836a96a6
	.xword	0x48b76c1ca288014e
	.xword	0x668b95d41e51b646
	.xword	0x8436c4edecad9ad2
	.xword	0x7984ffd69b5e43a0
	.xword	0x4920b18d60e690dc
	.xword	0x0817488c982ff288
	.xword	0x1bfcc4b3dd4879e4
	.xword	0xb583c055563d1115
	.xword	0x11f3167ce3f578df
	.xword	0xa546a8419b53f645
	.xword	0xf5e47deaa50cbd86
	.xword	0x59b2258420f4ca74
	.xword	0xbd3c49c76d45b0a1
	.xword	0xc957581cfb95dd9c
	.xword	0xe9dac4fe7eece7b8
	.xword	0x18dbf59b2d0c5de7
	.xword	0x9cd74334cabb1cda
	.xword	0xb5c2200cf6caff77
	.xword	0x0093b5d1a7013973
	.xword	0x1cc3b9e82eab68d5
	.xword	0xcf73b1aa3773b2dd
	.xword	0x4dc1034059ae8448
	.xword	0x5bec25f86af8ef41
	.xword	0x3123a5867fe3c065
	.xword	0xdf16c19515e3177b
	.xword	0xa419ea966bac43c1
	.xword	0xea9382b3365c1678
	.xword	0x61425e0587beb320
	.xword	0x045ab71c337809e1
	.xword	0x37ca2bc30b0a8cb6
	.xword	0xd679b3164e63342f
	.xword	0x34185f6253a42387
	.xword	0x82d0f188bdb745bc
	.xword	0x5ffa9fa9d2ae9200
	.xword	0xffa493da8355f882
	.xword	0xfac2752d8a2a3aa3
	.xword	0xbf04971002f5b8b3
	.xword	0xaead2e9ca2243615
	.xword	0xfdca415c32978bf6
	.xword	0xb4896942e8ce34cb
	.xword	0xa287f28cdd4a81b6
	.xword	0x3403dcb0cb21dec8
	.xword	0xce5593a5c0889d08
	.xword	0x749801ea9b2c6c9a
	.xword	0x2ea9ef6080d0d244
	.xword	0x4d7cd20193662bf5
	.xword	0x8e818185a511187e
	.xword	0x947d976961dadb12
	.xword	0x8b92465dea929cb0
	.xword	0xf2be3d69b23d6534
	.xword	0x2f237613b05816e0
	.xword	0xe2408b3b695c04b7
	.xword	0xa9d06bfb49604fab
	.xword	0xd62f1b88824ae7b4
	.xword	0x35fed9b9370a39e8
	.xword	0x8a736deaa334ec94
	.xword	0x74859bced2b84d24
	.xword	0x20271cf4b724bc0c
	.xword	0x55440422ff0e90bd
	.xword	0xa0cc48cdd85c3683
	.xword	0x07c2f7fc5e90b112
	.xword	0xf3b02ddac809f9f1
	.xword	0xcee8238bd66a5759
	.xword	0x698f21f53b9c7201
	.xword	0x416a94869376e0db
	.xword	0x633a46ca7da128e6
	.xword	0xebedcde82f56906f
	.xword	0x410b460967a01896
	.xword	0x7a43a9b34b7a3c03
	.xword	0xc159e1de24a36dad
	.xword	0x69092d455ec2f7cd
	.xword	0x60a1d2463f7a6ec5
	.xword	0x256e78ef0bde5c10
	.xword	0xe19c91f928551fda
	.xword	0x775e2025e6718625
	.xword	0xaab476ba4ffa61e4
	.xword	0x9b746a6c9416d92e
	.xword	0xbf2a1b76457c709d
	.xword	0x9f6d93e8b4b0d98e
	.xword	0x696fcb881595ae59
	.xword	0x2a35a97d4b7da5aa
	.xword	0x54edc556939c9b2c
	.xword	0xa0c4b046caa2e910
	.xword	0x69e8a87f0b2d0327
	.xword	0x60650e52db484d95
	.xword	0xa409bdf212c38348
	.xword	0x14a2a18495bbe8b2
	.xword	0x323d41f749b26510
	.xword	0xebb5c487366143f9
	.xword	0x164987da3234b128
	.xword	0x3ace7fd1955e7e97
	.xword	0xf1407a7179a1e89b
	.xword	0x0a2cc762e6ab9974
	.xword	0xe6271abbdfe38789
	.xword	0xa3fbf2204b4a387b
	.xword	0x2a253069a6e87127
	.xword	0x9792fdee534e4d91
	.xword	0x8c904dc6916a9e48
	.xword	0xcf9809f9328b2dfd
	.xword	0x1e74d5045ffe8753
	.xword	0x03f419b0170eed63
	.xword	0x31fbb432abe85fc8
	.xword	0xe65023cc14faa2d7
	.xword	0x4e41a783ccdb21a8
	.xword	0x2c22e4dc3346faac
	.xword	0xf57068a9032eebdc
	.xword	0x8dbb435154f9c974
	.xword	0xb096f2c83f8aee14
	.xword	0x72b97de13c2e20a7
	.xword	0x01d07dbbaa7b4fec
	.xword	0x75fc52372764a974
	.xword	0x2237404c52095e0d
	.xword	0xb803391a636fd9ac
	.xword	0xfa76b5f84bc33e93
	.xword	0x2a4fa2b73acd179c
	.xword	0xc3766cc48001b429
	.xword	0x8e3093e96411db49
	.xword	0xbe74b6054ba444c6
	.xword	0x410dd79f442474da
	.xword	0x0a38964c4d2504cc
	.xword	0xdc904d17e635c30f
	.xword	0xdfe200e090cba8db
	.xword	0x24c252868928916e
	.xword	0x041b547c4bc10850
	.xword	0xbcd22b5517bb99f1
	.xword	0x40161cb4e319cc45
	.xword	0x75441ce3bc8b3ab9
	.xword	0xe341a476da898fa8
	.xword	0xa2f7fd88ffac626d
	.xword	0x0728dde68c2f78b3
	.xword	0xd7cda7e027764ace
	.xword	0x2e8a9d607f5372d0
	.xword	0x1f2fc4c89179d66d
	.xword	0xf5fe828473522ba6
	.xword	0x96eb078c50dc0d0e
	.xword	0x4896cec43efb83c2
	.xword	0xcab5d639cf6f45e4
	.xword	0xe38cf54d14e6994c
	.xword	0x463dae8ecc6dde8e
	.xword	0x3bb41bb4e90f2660
	.xword	0x49cb71a0ecfa81e6
	.xword	0xcfe0ff6b8de93117
	.xword	0xaefb8fccddc15996
	.xword	0x24922a7a10896973
	.xword	0x3d7b5b8c4053f0c5
	.xword	0x43fb2d7f8ffcdd65
	.xword	0x69c1e2c3dd930906
	.xword	0x2ddf1a752f0d9751
	.xword	0xaa99f05ec148039d
	.xword	0xeb37b59822e62fb5
	.xword	0x1a0f0c11865b9ea5
	.xword	0x49f70b800b827bd5
	.xword	0x31c71e633d8f754b
	.xword	0x1412d1a40db10cfa
	.xword	0x376af9c1e15d0b2f
	.xword	0x27251a44a65869b7
	.xword	0x3b59ea299abca4dc
	.xword	0x764c94e8d470c0ef
	.xword	0xd38d9d3a74e7ef0d
	.xword	0xe29aef7b60555204
	.xword	0x865e78ef9634e74f
	.xword	0x1a81f4667a123188
	.xword	0x8b5e0375e163b1f2
	.xword	0xf0810d3ce70042dc
	.xword	0x7f1802afc1e6eac1
	.xword	0x9f9db9251d18e429
	.xword	0x83fc9018c16013c4
	.xword	0x83f4074458ea07ed
	.xword	0xc38dbfabb2cd6891
	.xword	0xa24d21de586ea074
	.xword	0x966473d2156bd0d7
	.xword	0x3a4a45e596fe5b8c
	.xword	0x4e5321461e519c33
	.xword	0xb31854d6647e45a5
	.xword	0x38a4cfdc3012fd47
	.xword	0x9af68ece21689d24
	.xword	0x2ca7806c25987ef8
	.xword	0x7e1ec1bd229cf6ba
	.xword	0x4e8ba2d6ece5f5ea
	.xword	0xf92f74eb94116193
	.xword	0x3a9c0026cc5b758a
	.xword	0x99fdbca48457453f
	.xword	0x53df36537450fde3
	.xword	0x1a0b9112bf0af0ea
	.xword	0x42022d74df695603
	.xword	0xff3f6bd44920be97
	.xword	0xe4a06a0044a66951
	.xword	0x291dfc7669eb4ee6
	.xword	0xf7dc4b9e58323faf
	.xword	0xf64fdf419de6a3f2
	.xword	0xfcea3812048bebeb
	.xword	0x96b964302c9fd144



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
	.xword	0x8dc7b2763f8f047d
	.xword	0xd822605412649359
	.xword	0x19aace770caf0714
	.xword	0x70c6124d46e85685
	.xword	0xc974f7d6d2270a19
	.xword	0xbddf1e912f401ce3
	.xword	0x58268fc1ac729e86
	.xword	0x2fde75f616a49aa9
	.xword	0xd4d3c04ded862687
	.xword	0x3cc82589b700d49a
	.xword	0x95457f1d079b8657
	.xword	0x7efe6e4785ff81c7
	.xword	0x59d45b4d3d8e3d69
	.xword	0x2d3171ae79cb73e2
	.xword	0x7bdcefa6ff8fcd02
	.xword	0x7b53fcd69e672e9e
	.xword	0x1e9ea042e2c4479b
	.xword	0x1b4ed986059ec314
	.xword	0xf585c35e4e705eb5
	.xword	0x877bd4bfcf984821
	.xword	0xd764e1816d5e2a4a
	.xword	0xd1f5fe5c7e3b7009
	.xword	0xce0c3e0c76041ce7
	.xword	0xcab0545e564c79cd
	.xword	0x4b7182a18498eb22
	.xword	0x7c6cebfa7b79a7d7
	.xword	0x11c39692a47a706f
	.xword	0x323f392ce1cd4033
	.xword	0xf7d336d6a50e76c9
	.xword	0xcd5bf3a092274e0e
	.xword	0x8e54308c313da846
	.xword	0xaef25c55ce55d7fa
	.xword	0x8ac2e92bcd322c05
	.xword	0x3bc7204efcf3ba4a
	.xword	0xaff104fb57b25244
	.xword	0xda7d675370a282b0
	.xword	0x81c944fb8ab8fc20
	.xword	0x821bdd5e9b507825
	.xword	0xa48e29f4a291afe3
	.xword	0x176fb774528a53bf
	.xword	0xf08b67de41660afc
	.xword	0x8a8aa99e80c96b20
	.xword	0x263a426b0641c8cd
	.xword	0x08426671a8ca6350
	.xword	0x5cc2e71ed60759ac
	.xword	0xc4288af69babb019
	.xword	0x4bf10d7689292336
	.xword	0xcf89f11831c7c6a6
	.xword	0x59e2053e52b4ebd0
	.xword	0xd6ff10ffc3661f0f
	.xword	0xa10e341c3ae84bf2
	.xword	0x1c0edbdfbd193821
	.xword	0x11ff2e6c06f21a97
	.xword	0x9ea6268cc86af51c
	.xword	0x7a3530f230f59daa
	.xword	0x44107da2af43ed79
	.xword	0x0bc4a107bd8ac5da
	.xword	0x81673fd779395a37
	.xword	0x2dac00cf075b8057
	.xword	0xf85ff807d177e0c1
	.xword	0xd0256639ced09d1c
	.xword	0x4902595125e41dec
	.xword	0x60b27937ffcea171
	.xword	0x7beb5fb714c12f03
	.xword	0xa5c04cd40f8c1c6c
	.xword	0x195eac0eecc3f23c
	.xword	0xb6a499500ee1730f
	.xword	0x82f17e0508d76b12
	.xword	0x72b77ab367b24f89
	.xword	0xe8af5bfe03a7fb6d
	.xword	0xb757171da6cf6a46
	.xword	0x40658863c0101ade
	.xword	0xbd5f6d008dc2a245
	.xword	0x60a054c9d8e8ec98
	.xword	0x764b0ed992acb2a5
	.xword	0x27e54f6cce9e2df0
	.xword	0xccca9a0de479faaf
	.xword	0xbd3d85a9cff64bcc
	.xword	0x1368c9d99f1b75d1
	.xword	0x96896257b78f0205
	.xword	0x70e021382abd38f9
	.xword	0x02abfc77ae6dfc22
	.xword	0x1cfaf2017f339144
	.xword	0x1042eb83cd749d36
	.xword	0xcebb7678a458c2bf
	.xword	0x5c22e19d94a5399b
	.xword	0xeb77be63dc729db7
	.xword	0x9252a390ac345fd1
	.xword	0xad88e0e5340ccdfa
	.xword	0x9fd50a1a9037c1f8
	.xword	0x660c7f0064159c0e
	.xword	0x40e31e6e009f2cb4
	.xword	0x876a981db6946e3f
	.xword	0xaad94d57b055847b
	.xword	0x59aeb9b0c6a9d8aa
	.xword	0x7ffdcb788d1420a9
	.xword	0x3e65010c2cbc1aa6
	.xword	0x107408e9bba70710
	.xword	0x15cfcfec20c28ec8
	.xword	0x90e3664f21d2c788
	.xword	0x5af555c453462ef4
	.xword	0x3d5b7f1b800011f6
	.xword	0x345b4f54cf1ef79f
	.xword	0x6d23492669fba22b
	.xword	0x897b9e3ae4350532
	.xword	0xb2d142318d61bfa2
	.xword	0xffe66acb09fa3923
	.xword	0xb00d9e4d9049c559
	.xword	0xfb8e523e392e0025
	.xword	0xf3cd2010d0ecd9ed
	.xword	0xd66938881b5f0c4c
	.xword	0x0b3fc3ce28c8db95
	.xword	0x52b61a93459c0d32
	.xword	0x1d69a2a5e4437882
	.xword	0xf69461147a36996f
	.xword	0xac1cc12c6943eeec
	.xword	0x88c24da316aee9b0
	.xword	0x7cbacbba712e1471
	.xword	0x5c8065e3022a1f97
	.xword	0xf2e1a7e174e57dcf
	.xword	0x03ee6125ed8c4b73
	.xword	0x619b2899300ed2f2
	.xword	0x821035340f2dd9f5
	.xword	0xdb857b4a61f156a8
	.xword	0x18111e150d1b93a9
	.xword	0x7f366572f372e0e0
	.xword	0x951313d9296df507
	.xword	0x8d4fd6bd2d58aa2f
	.xword	0xf36cdae648cebe4d
	.xword	0x1b3beb94e1e62a6b
	.xword	0xa065b8dc93f9085f
	.xword	0x4efb281622ab5f84
	.xword	0xc15872fc247ca43a
	.xword	0xb596cf5755d28f18
	.xword	0x030006797035e1e8
	.xword	0x8a5d8c774d60d358
	.xword	0x70934e04d46b3aae
	.xword	0xcee5902d28ccdba0
	.xword	0x2e9c931b865646c9
	.xword	0x541baff08f236338
	.xword	0xed1ee5bfea050925
	.xword	0xcf33d6f6286de7ad
	.xword	0xa8a5c43c3debeb44
	.xword	0x47e040d64e96ec25
	.xword	0x09d8ced5a6e59880
	.xword	0xe424312649c5f464
	.xword	0xdc40a43903a88a02
	.xword	0x4cdc7432d51cab01
	.xword	0x4984279f05a91f76
	.xword	0xe784dbaa714365dd
	.xword	0xf1c3053916e1b5d4
	.xword	0x9c40cccf2cc3e690
	.xword	0x06e7585dbb2b1357
	.xword	0x7e80722dd34da079
	.xword	0xa10adcf5b6f24b84
	.xword	0x916321938e77fe88
	.xword	0x1198cc779e17fdf2
	.xword	0xcde95f1d0297b146
	.xword	0x69b42919b5b6fb09
	.xword	0xf8f07ffeca37590e
	.xword	0x7453414da196ac1c
	.xword	0x1e4a2d0651b51a6d
	.xword	0xe04400a48fc3733d
	.xword	0x131cfec25f499f84
	.xword	0xa4fe963a328e4214
	.xword	0xca5e5511d7703320
	.xword	0xe8d19ffb3ad71815
	.xword	0x7ff03d589eeb279d
	.xword	0x171b34d07e1362e3
	.xword	0x87dd38466065ceb4
	.xword	0x1bfb4b24d7ff0b86
	.xword	0x340e8f24daa76886
	.xword	0xa793debcb62e0341
	.xword	0xae3933a6f5ca0bd7
	.xword	0xf59cdf76d5fa99d1
	.xword	0xa59feb593cf17938
	.xword	0x050840a241557897
	.xword	0xa8b04a4a7f4ba77c
	.xword	0xa4a41536913ea1c4
	.xword	0x2e65e2cda9d0be3c
	.xword	0x6628ee1ab35fad54
	.xword	0x3f9094d4f15be8bd
	.xword	0x6b29c18224814d59
	.xword	0x4b0d06e7343c7f1c
	.xword	0x127691001c8e2cef
	.xword	0x3b8c28baae88f077
	.xword	0xa0e0fa7d72f43d9b
	.xword	0x6b15b49fc848516c
	.xword	0xef8af300646d8d63
	.xword	0x837c6ac756441298
	.xword	0x5ddd6325ae011051
	.xword	0x7ebd75fcf0125b4f
	.xword	0xc888b9e6965dcffb
	.xword	0x00b7e0463ba5681d
	.xword	0x153436284e53d7ad
	.xword	0xf853fb5085ccd032
	.xword	0x9d83e5c7c12f507b
	.xword	0x191b45ba37f87554
	.xword	0xa4d4ae0638027ebd
	.xword	0xf93dacb8ca69df69
	.xword	0x899a3a386dc625ee
	.xword	0x17f3b73a2d26f42d
	.xword	0x11ec4d5546c2eebe
	.xword	0x98da18d9279fafd0
	.xword	0x7a4ad1ae5eed7283
	.xword	0xb1b3c5480a22b5a0
	.xword	0x9531b9deede99ea8
	.xword	0xdb1cd5569ffa065e
	.xword	0x61b891797e54f9d0
	.xword	0x1dffa27ecd5b5456
	.xword	0xfa622184b2594ac7
	.xword	0x5eed3055eb7b3aae
	.xword	0x3302ae1345d6175e
	.xword	0x865a52ee8f0e50bf
	.xword	0xce685516360a1275
	.xword	0x7bb8b8473e714092
	.xword	0xb46bf6edc8ed8ca2
	.xword	0xc2aaf0df94b6dfdd
	.xword	0x57268440698dc5c2
	.xword	0xf3ea24d26ab15361
	.xword	0x6ab802175a8f78d6
	.xword	0x9747a084aaf0fa1d
	.xword	0x621da25a06e2bb56
	.xword	0x117adab3c8f8c523
	.xword	0x0538a868d0ecfdf1
	.xword	0xc68774cb36092145
	.xword	0x9ea5ad3060d4569c
	.xword	0x8dae4ba562e1f2e7
	.xword	0x1157b59028aa517d
	.xword	0xd4cf1b62eafdfab3
	.xword	0x56c29f130c2c1781
	.xword	0x82380dd3ddad7b2c
	.xword	0xc465a6c997625201
	.xword	0x489aad32861585e5
	.xword	0xee99c8860728fdf0
	.xword	0x755a667077ce9642
	.xword	0xfbb827d511824ac1
	.xword	0x6088153b256b619f
	.xword	0x81f110deaae93629
	.xword	0x5ac56011c8046e4c
	.xword	0x5fe6805e3f245d4c
	.xword	0x80c5bf4a294a2c63
	.xword	0x72c87742b07e5ff6
	.xword	0x7dc0c00530c76595
	.xword	0x875f3a50b50936ad
	.xword	0x00179ea70bcaff8e
	.xword	0x370b225a5bbf55c6
	.xword	0x3679fe8e83007142
	.xword	0x562f61f0c3576980
	.xword	0xa9b5b0042b830e84
	.xword	0xed28c266e8ebd2ab
	.xword	0xfe99d2dc302ab6cb
	.xword	0x272b29f949e61010
	.xword	0x199af6c6c8574710
	.xword	0xa05a43c0c1b1bcd2
	.xword	0x06d42a457c083ec4



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
	.xword	0xca120c464ed4f5c1
	.xword	0xed38c3fec9295672
	.xword	0x7273de24ff926e99
	.xword	0x87ebe81d03d87411
	.xword	0xb474b2c720d10856
	.xword	0x2f1bf8e1399b9236
	.xword	0xa4a4a51cad84f220
	.xword	0xbb94c05cb2878863
	.xword	0x92a0a6c112fddcfa
	.xword	0xeb38a71be57302e0
	.xword	0x25695bf9333ca3a1
	.xword	0x3c20fa7558c0ccea
	.xword	0xcc9ea52c7a59b753
	.xword	0x277434e6f4e2e658
	.xword	0x4d282ca3665af210
	.xword	0x2ad1b2d27bf8ef47
	.xword	0xcb796b3a1530203f
	.xword	0x8e2540e0a91328dd
	.xword	0x5981a203e23a2143
	.xword	0x71d1ed6b6726c9aa
	.xword	0x2801ff060f7175b7
	.xword	0x79143972f7068651
	.xword	0x051fdb1a9087d1d8
	.xword	0x46a554602bdfff91
	.xword	0xade09b95d62a3825
	.xword	0xfe867ab401b48b96
	.xword	0xca2d3885ae85ea5a
	.xword	0xd685b97469d51c90
	.xword	0xe792030f7320d672
	.xword	0x1b26e72272dd7c79
	.xword	0x3af5c5436cee3398
	.xword	0x3a385d1c442e4b3c
	.xword	0xaa69a3bb9e5ec370
	.xword	0x7e2a2cfc93dd236f
	.xword	0x2948afde56ed316a
	.xword	0xa1033345cbaac4ad
	.xword	0xf2cbd66ed3f2cab0
	.xword	0x4e582e93c5a6ed99
	.xword	0xf3916c1489884ccf
	.xword	0x9ac075860d732787
	.xword	0xebf534c24aad9c22
	.xword	0x0d87db24cc937a61
	.xword	0x8fc672176aea85e4
	.xword	0x4edba93d38665107
	.xword	0x117dd87edfedaad2
	.xword	0x115d05c8c6a7f1cf
	.xword	0xd2a01016fd48255a
	.xword	0xa8af4c44b8c84f2d
	.xword	0x6189b240a732e8af
	.xword	0xe4cf628d4fcfebb2
	.xword	0x2fe714152a5f783e
	.xword	0x5f77dbda0c0ff382
	.xword	0x9795d32e7541ac7b
	.xword	0xdf38cb5f6e42949a
	.xword	0x6033539c5afaa28c
	.xword	0xd151e6f53324d1ee
	.xword	0x7ae8bf498d1a75a3
	.xword	0x771730bec2af6020
	.xword	0xf0e9140ebaf806b3
	.xword	0x97a77e150fda7c73
	.xword	0x348b3bb39bed9396
	.xword	0x95806dd8481b7721
	.xword	0xf3dbafc32614717d
	.xword	0xee4b94254e20bb4f
	.xword	0xe83b4065bde6a6a9
	.xword	0xe4c3f692317edd80
	.xword	0x44120edffa03e5dc
	.xword	0xd9db1e00893a8408
	.xword	0x85a6a2c458c569f4
	.xword	0x71b70699baf65817
	.xword	0x5aad8bcc681d3d26
	.xword	0x84ceb3b5414f3c55
	.xword	0xa668072dfc7a4977
	.xword	0x79c25ce48a929499
	.xword	0xabd59d3b12d2a387
	.xword	0x9b67105f7f981ede
	.xword	0x26bcdd6839adde87
	.xword	0xc8916a823424a6bf
	.xword	0x8d8d10c65fc34316
	.xword	0xf8b6f1de92cb9000
	.xword	0xe82087af6bbfe4f3
	.xword	0xa8639c680d0fc3ef
	.xword	0x1c4e74d2f7866042
	.xword	0xb813f0c9dec54750
	.xword	0x62509bb6240029df
	.xword	0xca4367a11c8a963d
	.xword	0x5d6342bbfec6507f
	.xword	0xc6f5952591477266
	.xword	0xbb949937b4b0f538
	.xword	0x30060361add596ce
	.xword	0x7e57b6b7adddc91c
	.xword	0x8668a81f1d77fe5b
	.xword	0x4ad014700b808502
	.xword	0xf1735eeb878e5616
	.xword	0xfd2e60ffa3ca1f09
	.xword	0x9f3a66a29eeae0d0
	.xword	0x10e5a19e23d826cc
	.xword	0x35f7c1bec261d85d
	.xword	0x7eeaf9a035975749
	.xword	0xba26bd83453318dc
	.xword	0x362e69495155b4d9
	.xword	0x1cedbc613732cdf5
	.xword	0xdd2a3f47b3e8815e
	.xword	0xf9a97fcce56c8d90
	.xword	0xa0e1576702063572
	.xword	0x43b9524b64c4131f
	.xword	0x493123c4e4573dda
	.xword	0xb86738f3808d2c04
	.xword	0x01a726fb40f27ead
	.xword	0x06ec7c6469866fb6
	.xword	0xb8ae761ec85d6306
	.xword	0x89b4db13ab9b01a3
	.xword	0x25dde0565a3ae6d3
	.xword	0xe1d06e5a28183d20
	.xword	0x210738275ad774ca
	.xword	0x60159e1819d9b5ed
	.xword	0x306f2d5a8b164139
	.xword	0x6bba58e5f27ad860
	.xword	0xc8a1f49c954a2a19
	.xword	0x0180aa3f281a2618
	.xword	0xfa9981d068ca0756
	.xword	0xfe76f7e6b2bb91d0
	.xword	0x7e3155c2ed8d69e0
	.xword	0x5804021278fe9685
	.xword	0x51da95aa023d49ea
	.xword	0x279986fab4dc2fbb
	.xword	0xcb6c31a28f0251bc
	.xword	0x6b49a6502e1f7517
	.xword	0xbde7893e425a67a4
	.xword	0x59a6196758d14257
	.xword	0x1e4ebcf00cc41d9c
	.xword	0xa9f1830275c7c443
	.xword	0x9ccfb87d2ac30061
	.xword	0xb46cacec7d6d14cb
	.xword	0xf657936f7eb421c9
	.xword	0xf50ded00eb4fde82
	.xword	0x15b4021953577108
	.xword	0x474ec7b5650696f5
	.xword	0x132a4504d633c441
	.xword	0x690a93c495ed9c68
	.xword	0x48b34cee8dddd229
	.xword	0xec45c2846cb783b6
	.xword	0xc1d6626ad474b89f
	.xword	0x8f52575b3904a90b
	.xword	0x10f90315858f59b3
	.xword	0x8bc060e689a35588
	.xword	0xb7fae80620f42460
	.xword	0x332a26b0dfdc7691
	.xword	0xfb27289f36e44409
	.xword	0x929363228b865d07
	.xword	0xf580d40b093e5532
	.xword	0x1801ccab5df75a5f
	.xword	0x6d1fb691fca6c432
	.xword	0xab1729355915621b
	.xword	0x491f494cf25d078d
	.xword	0xee7af5c106cee536
	.xword	0xbdc23339d23207ca
	.xword	0xb83dfdcc13f4af2c
	.xword	0xd63a4d9fda4b64fc
	.xword	0x248371ecb8d67303
	.xword	0xd06251c0d0437113
	.xword	0x438df14c37af5de1
	.xword	0x6add22b27d7b8e03
	.xword	0x50e323ac4a0d5ce0
	.xword	0xfca730bff30bf8dd
	.xword	0x1edf18a78fb2ceee
	.xword	0x2b835e102b1dc65f
	.xword	0x02b264eb99c603f7
	.xword	0x330fb84dd964bab8
	.xword	0xe7f0146e065a2199
	.xword	0x68f5b9987cd4cf59
	.xword	0x14a04d58bf803f35
	.xword	0xd0e56fcdfa971bbd
	.xword	0x1ef5a1dc2be9f0e2
	.xword	0x75af01e73b02e133
	.xword	0x6b0b37095e09363f
	.xword	0x9c8ccd0387328018
	.xword	0x3791d348a40566ef
	.xword	0xec6adc70e8d88dca
	.xword	0x1886c636b1ee721b
	.xword	0x5766b12f1862f578
	.xword	0xf0182b216d739de1
	.xword	0x48a89bd7e9eafede
	.xword	0x9b0fc024c398749d
	.xword	0xd4ea1b3236aac9c9
	.xword	0xf8b4e69a9743b335
	.xword	0x70f0de1b0e7a69f3
	.xword	0x24a05bcd33e33acd
	.xword	0xa6a97c2af0d0b56c
	.xword	0x9ab28e38d76411b6
	.xword	0xd03e913491109c98
	.xword	0xc38ca694d7772b07
	.xword	0xd7fdd06b81dc2791
	.xword	0x3a4fbb5679ba61f5
	.xword	0xeeece6f1c49e4ebc
	.xword	0x09fc1f4f952c53b9
	.xword	0x917b489fcf8df821
	.xword	0xd025008601789819
	.xword	0x8aa4afa16595ddcf
	.xword	0x89d2c8f5aa12b037
	.xword	0x8d2010b7bda1895e
	.xword	0xadc073302edf6df3
	.xword	0x94094ba1686a84d6
	.xword	0xb60db239d86bfcad
	.xword	0xfc7f2c4f412f1c80
	.xword	0xa588e9ff901914a3
	.xword	0xdb70ae5c04211a24
	.xword	0xb3e6547ef8b86686
	.xword	0x8b91152b4a1a2550
	.xword	0x8582839ff0137d1d
	.xword	0xf0384d32c61836e9
	.xword	0x028b8fb1b315ee4d
	.xword	0xf4d98c97c21a4e57
	.xword	0x933b0240da679e01
	.xword	0xc45cdd2569708ae4
	.xword	0x3fcc35991a2c2153
	.xword	0xf63adf7d35a53018
	.xword	0x4f56bb8dd6f82595
	.xword	0xdae0adec3794b155
	.xword	0xf383e0b0d61b4e41
	.xword	0x62dbd7b18a3fabff
	.xword	0xd5fb43ecb7dfe0fa
	.xword	0x519f225dc7acd637
	.xword	0x0201334ae0de68c7
	.xword	0xfb1da6dab53fb63e
	.xword	0x3bd1ab837116cc27
	.xword	0x2edb4e8fd696446d
	.xword	0x16bfbd079d2b21c3
	.xword	0xf5f134bed3fb44bb
	.xword	0xa4f5fa4541219169
	.xword	0x875dc461e3998991
	.xword	0x97c1ab7c741fa12f
	.xword	0x3baf0caafb04c491
	.xword	0x324cd576e61e570f
	.xword	0x61b2aa3b45305090
	.xword	0xc0d0e6e19df4e1a6
	.xword	0x4d746b4ca882ff86
	.xword	0x3c9fee851d573090
	.xword	0xb417ef52bc553c5e
	.xword	0x762551444b2a8179
	.xword	0xc68695aed78fa8c0
	.xword	0x5337843b0f2f86a5
	.xword	0x8ba484e0806f1993
	.xword	0x26a8b4e1d097bf1c
	.xword	0x6f4495f1d01df42b
	.xword	0x371405eff5c197bf
	.xword	0xbfe3835550f081f4
	.xword	0x48d8d31990cf1811
	.xword	0xc8fdc6f10263e805
	.xword	0x68af524389153743
	.xword	0x199c09131a7f130d
	.xword	0xd5eb512d9d81cb29
	.xword	0x854c25399cdd61b3
	.xword	0x313a495d42e92510
	.xword	0x117a113c3c0dc991
	.xword	0x9b4f0e71ed2fea88



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
	.xword	0xc4b5c25c665df0e4
	.xword	0xd2503c3c8bb2cfe4
	.xword	0xed708650f0390f57
	.xword	0xa5b7f9b0b1ba05b9
	.xword	0xf0a6417e466fdc9f
	.xword	0xa3cf1fbbd977968a
	.xword	0xd04a7c7f25e8f5ae
	.xword	0x4232e0d8f60db07f
	.xword	0xf2f856951a40727d
	.xword	0x08d8f1fa73a4c467
	.xword	0x5daed85f7c950fec
	.xword	0xdfb0d77904e162b5
	.xword	0x7e884620c13b3e48
	.xword	0xb808b3d81b5c17dc
	.xword	0xc733f557eb709a63
	.xword	0xde2bddcac27ba2c1
	.xword	0x40e040b9c20d29e8
	.xword	0xb144a7e4000b573c
	.xword	0x523fb106305bd5eb
	.xword	0x6d8f23c321a02918
	.xword	0xd3f1957379392522
	.xword	0xca4806e96b278817
	.xword	0xbc1780dfa0bf5cd4
	.xword	0x5e99cbb4d63e83b8
	.xword	0xc9f38e3c5f218216
	.xword	0xe42972c2d2798935
	.xword	0x529239d49a21e5f4
	.xword	0x55121c71df6ba62c
	.xword	0xa8e57307d012c9a9
	.xword	0xf0506b42586ec065
	.xword	0x933e98c168db35e5
	.xword	0xf16d00fe077b5d69
	.xword	0x2f6641c06c24a277
	.xword	0xdb814d64e6be7a7e
	.xword	0xa1890eab3cabadc5
	.xword	0x8826f384d702ae84
	.xword	0xd295a7b58cdfa814
	.xword	0x87ff7b1765cf9940
	.xword	0x8122aa20e5eedc2e
	.xword	0x8a1a8a2aa990a883
	.xword	0xbaa064b2da272def
	.xword	0xdc820cf1f89dd957
	.xword	0x15ce4b7ec31df074
	.xword	0x7ac1238ac01f271f
	.xword	0xafabc8a77e892e95
	.xword	0x661a043b700922fc
	.xword	0x18e753eef6a8a8b0
	.xword	0x41bd25f3407da77d
	.xword	0x27548b7fdb1b6a00
	.xword	0x32e937b345ee47ea
	.xword	0x04dedd7f6d747adf
	.xword	0x33fad0674320bb75
	.xword	0x30a6852ab97e9024
	.xword	0x6a1de81e01b86919
	.xword	0x55ce84d7d606d890
	.xword	0x901e00fd38369eff
	.xword	0x547cd95644d2078e
	.xword	0xd5ed71a0af2225da
	.xword	0x9c620557e989abd8
	.xword	0xcf9280e9b8adacc6
	.xword	0x6985d4eb8cc61d08
	.xword	0xf6a38562ef4f8408
	.xword	0xddd4150b2fb84827
	.xword	0x91dff067f10fcdbe
	.xword	0x4b68b8ad5033f318
	.xword	0xf553b38b512550ec
	.xword	0xbeb276f887580c0c
	.xword	0x5bac754483ab0c38
	.xword	0x76d20f3f786c5386
	.xword	0x5dfe80a484e4e1b6
	.xword	0xe78042483508ec0d
	.xword	0x5ba5fb4daacc8889
	.xword	0x3a0a5b339546d443
	.xword	0xe9d724e89929213a
	.xword	0x0b4693005bfbbc67
	.xword	0x47280b3afa8768e3
	.xword	0x3c80bce92fadaf49
	.xword	0x675ee8c35e305dce
	.xword	0xc5260741cbe1083d
	.xword	0x8979f20569de06da
	.xword	0x63184e24d123180d
	.xword	0xc8817b49ab8cbd50
	.xword	0x05f82fc4656c5076
	.xword	0x56395f69934dbed0
	.xword	0x2f94951869868a9f
	.xword	0x0f693e021462a114
	.xword	0xbb028a0ff202206c
	.xword	0x13a490d925bc3a05
	.xword	0xe1c4b18f953670ce
	.xword	0x9787cb6ffcf8eb84
	.xword	0x6ee940d4143a6d7d
	.xword	0x99a80a44a06a4b21
	.xword	0x5c43b45f1687e158
	.xword	0xd0653c650665f2b2
	.xword	0xb743f7b9cd461e2d
	.xword	0x25e62a1d769c0457
	.xword	0x343d4b0dffaeb621
	.xword	0xfba35171f68444c3
	.xword	0x71415d4a674d264c
	.xword	0x11b37338d16f4183
	.xword	0xc252b7069f08a76b
	.xword	0x4fcd42d9920985cc
	.xword	0x151a4e41c948fd20
	.xword	0x0d29a1551a9e63c0
	.xword	0x34d96309146e0bf4
	.xword	0x8c96d6c901b8120b
	.xword	0xbbd29346d7899a52
	.xword	0x8fc047582a0edea5
	.xword	0xdb5fe21648241a57
	.xword	0xe75f0b3bd9ef1524
	.xword	0x19451f010f4a9c99
	.xword	0xc9d899ed41fa0698
	.xword	0x9030f96214888827
	.xword	0x23b5eef951bb1795
	.xword	0x1d0a00ca85fb9724
	.xword	0xfa6284c35abfe710
	.xword	0x532f1f98a3e7b724
	.xword	0xb5f700df901d63fa
	.xword	0x0c0a860a7c95d5e0
	.xword	0xf27d9dd7c4515784
	.xword	0xe2623ad900990714
	.xword	0x3ba4223065dae75d
	.xword	0xa5d283a7658c34d3
	.xword	0xea9ab2cc1980b583
	.xword	0xad7ca119ef289db8
	.xword	0xf774ac48e6d17888
	.xword	0xa06d5bd7bae045fc
	.xword	0xc205a994c1deeb0a
	.xword	0xba4903b744fd8b4e
	.xword	0x77f36b03e929cb21
	.xword	0x516f8eb186553cfb
	.xword	0x48dc696f00694c40
	.xword	0x9b66951f8c2d5514
	.xword	0x0042b140e5c5ff4e
	.xword	0x384be0a2d710d536
	.xword	0xa4041b0d9ffb8d19
	.xword	0x47f57f0d16707cf7
	.xword	0x6feeda7c097f89ba
	.xword	0x320f97dbd6e98869
	.xword	0x9f059cb68c11e447
	.xword	0xedbd0dd8f74c7120
	.xword	0x83a4b5e6d961010c
	.xword	0x4f093b8ba751ca20
	.xword	0x4a0ba0c49d7d0446
	.xword	0xdea1895dba9714ad
	.xword	0x92c5f65f132e010a
	.xword	0x7a39b49e4a8cf341
	.xword	0x034f2ab19b17a8fd
	.xword	0xe367fe0480faeea0
	.xword	0x32031e9315850e87
	.xword	0x98096ee5f8c61585
	.xword	0xf96b3076b2f28cf4
	.xword	0xf4a1fbe1ae0197de
	.xword	0x2ac606d06bb56575
	.xword	0xd00713a9c9b8e909
	.xword	0x0f5b3942f7a90022
	.xword	0x88ddb7d0dffa2178
	.xword	0x8ffcb4507c9ea0a2
	.xword	0x51194ed68a184c73
	.xword	0x2edff95bd47bb8a0
	.xword	0xd93f411a1707bef5
	.xword	0x58677faba04e4553
	.xword	0x00d511e1793d3737
	.xword	0xb603849c1f0ae359
	.xword	0xd0242498c8a384f5
	.xword	0x109c87e1c5e35b0c
	.xword	0xa5d9eac8c668fa04
	.xword	0xfa9837d9857ca9f5
	.xword	0x0aa62fe129ac5b19
	.xword	0xbc787a6ddaedc414
	.xword	0xaa44c46bbba6da7f
	.xword	0x277038cfbc66a159
	.xword	0xf9cebaf888d997c8
	.xword	0xcdc2161138d1f3bc
	.xword	0x59271013208bccf4
	.xword	0xb1ef4e6c306a6709
	.xword	0x51822ed160fba685
	.xword	0x40567b9bd04c027b
	.xword	0xdcc1be8877e7873c
	.xword	0x13d0ed98a34ad3e1
	.xword	0x754462eaeee5e824
	.xword	0xa7376ede4ec9b570
	.xword	0xc08cbde03da0d29b
	.xword	0x0326a1d78cd82339
	.xword	0xcb92c58b72c178ef
	.xword	0x00dda5d948fcef83
	.xword	0xeccb75c0bc9aa0cb
	.xword	0x8b433822712ea665
	.xword	0xfd46e880092dd35b
	.xword	0xa4736314bff0bab9
	.xword	0x07b25e9ff21e9753
	.xword	0xd240ff19c868a46c
	.xword	0x5c7d7d6f98e5965c
	.xword	0x298e7269393d70ea
	.xword	0x0e0fbc6b6aea87b2
	.xword	0xa995dddd2f278ec7
	.xword	0x53dc94f11ef2e6e1
	.xword	0xd0ee5d6a2edf2c3f
	.xword	0xc0eb14fe841408cb
	.xword	0x21cd9679285a716e
	.xword	0xace1a58b5c084d8e
	.xword	0x9e763b7ff009b1bc
	.xword	0x7c48c3088e5ce16c
	.xword	0x411fadbcdda028fd
	.xword	0xcdf93df1247dec8b
	.xword	0xeb49c7f6184b594b
	.xword	0xf0781a8df2f2356a
	.xword	0x31c18e8efbfd83df
	.xword	0x0820f083fee03f29
	.xword	0xe670f5c838bad32e
	.xword	0x404cc5983110c3de
	.xword	0xb3be39455b13e540
	.xword	0x7dab57fe56b7331b
	.xword	0xf5420cb2072a08d8
	.xword	0x2dd69183541c6030
	.xword	0xe749f6610334b811
	.xword	0x5e9e7b8fddb7afde
	.xword	0x4583feb1a4956bf9
	.xword	0x09146c2732f5ab2d
	.xword	0xce943edb10f188be
	.xword	0xfd6992c195e44346
	.xword	0x36dcd40303e7f321
	.xword	0x34f6ba35a8c42a5d
	.xword	0x8455f9085e03bd26
	.xword	0xf45ee11756f2d1bc
	.xword	0x9a471323ca84ee08
	.xword	0x431081ba070aee36
	.xword	0xbccd2c8b4fcf2f53
	.xword	0xdb88c031c51b5290
	.xword	0xa21735569df4e3cf
	.xword	0x877ed24c4e662dc1
	.xword	0x182c4f9cf717789b
	.xword	0x66414fa6db0d3eb0
	.xword	0x1fcf0427412ca4f0
	.xword	0xf5a1fa8a0b12d1fb
	.xword	0x7a19130178a2af8a
	.xword	0xd4d36c707e986358
	.xword	0xe2f3c896ab2f5261
	.xword	0x9f5bf1da15136e77
	.xword	0x8763fd9d7a854093
	.xword	0x474a8ee2144de656
	.xword	0x477bc521853cba7a
	.xword	0x2056eb51facf0334
	.xword	0xb7f1b3a70877034d
	.xword	0xf09062f021512386
	.xword	0xeb207e4a3daf862d
	.xword	0xc07d2e8ac30dffbc
	.xword	0xd93a3ec08bb353b9
	.xword	0x92de84791b022453
	.xword	0xe00daec2700c4eac
	.xword	0xee11c881acb37066
	.xword	0xcf76d1f45aa9bbff
	.xword	0x693bd24044d50bde
	.xword	0x59b040429e5adfbc
	.xword	0x067d0adefc347e0f
	.xword	0x4c317c723f394973



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
	.xword	0xe24481ab171def3b
	.xword	0x24440a70aeb5deb5
	.xword	0xb8b380f8cfb979d0
	.xword	0x6a789c42b75be402
	.xword	0x1fc676a5de123f2a
	.xword	0xfa91d52aae252e55
	.xword	0x113a0d3d629ec095
	.xword	0xa1d0b3d8a4df79d9
	.xword	0xcae46288933eee78
	.xword	0x3916fe589c286a0e
	.xword	0x73d6baa8f840dc73
	.xword	0xf73c25722072bd47
	.xword	0x0d5aaa1586e43d60
	.xword	0x9b33dee7182f59ff
	.xword	0xd3ae79f2ca628b48
	.xword	0x8bd06a43182c9073
	.xword	0x23b644e3ee8dff80
	.xword	0x7e5dd559e6593d89
	.xword	0xd187e76011b3d673
	.xword	0x1bd19878994f3345
	.xword	0x335b4a61fc9bc87c
	.xword	0x54c854df3dafcae7
	.xword	0xa528aba89f14d807
	.xword	0x30b01b23377fde2f
	.xword	0x1eac180788bddcf1
	.xword	0xa47d8ee85c056db8
	.xword	0x1df869fdc80c9b61
	.xword	0x02cd30604adc689b
	.xword	0xfe8df8a719828ea2
	.xword	0xe7949cb6d99458d2
	.xword	0x4a358f5b9fbd34dd
	.xword	0xcdee5ba7da156c53
	.xword	0x190cc262c1bfa0f0
	.xword	0x664b267319848a5d
	.xword	0xf32b4634c8bed272
	.xword	0xcf9af5adb28bd8be
	.xword	0x9ccf5c93db14ca29
	.xword	0xcd9e817347b9dc6a
	.xword	0x4be47b19f2a87be1
	.xword	0xea618b42899ffc02
	.xword	0xd90e12d8fc6c6e63
	.xword	0x6d981644e25f77ad
	.xword	0xda02ed57f826f491
	.xword	0xe7809cd3dfdecd44
	.xword	0x029895daf9ed080b
	.xword	0x98c051e158a3483f
	.xword	0xf1397a997e6ec488
	.xword	0x9dd30284f0aa0cf4
	.xword	0xc88e6276cbfa49a4
	.xword	0x1bcff8988b5caa6b
	.xword	0xad84a7238d24e074
	.xword	0x99f447dd9cab0a26
	.xword	0xaae626326e0297fe
	.xword	0x9e0e2d65a16e7ce2
	.xword	0xccba19e83682254b
	.xword	0xeba0427eecea071a
	.xword	0x1b2ed3e51cf1500c
	.xword	0x009d3d122a78b877
	.xword	0xd18493864cfab126
	.xword	0x3569f07a21efaf78
	.xword	0x0ab9e5f73ada6c8e
	.xword	0xfd53c8b892b028a9
	.xword	0xde6f3e2b676af69e
	.xword	0x5d5376aed1a26d37
	.xword	0x678b351fb40877f0
	.xword	0x9d294881b09a0b35
	.xword	0x31e6b4650e299014
	.xword	0x1cdc66b21666eaa1
	.xword	0x0e8aa2f0aa634be6
	.xword	0x2d25da7fed31affd
	.xword	0xb36c8fead3e8c621
	.xword	0xd3b4a9a25d0312e7
	.xword	0xc78537c76f0f6bb8
	.xword	0x3e0ad6a9865b0cd8
	.xword	0x4f3e6fd4879d4ffd
	.xword	0x12fe783d3ae33a72
	.xword	0xe2cd6c76fa4d2f2d
	.xword	0xf889ef171e52182e
	.xword	0xbbb47769d2858453
	.xword	0xb9950b8d35a05316
	.xword	0xb5dc40f274bab840
	.xword	0x7f3fb911aefced37
	.xword	0x1146bf5b573de544
	.xword	0xb3fcfa2a9ab5a402
	.xword	0x9562d3aab2f26f8c
	.xword	0xca07ed9e1470ea9d
	.xword	0xacc1f5926bd5bc9e
	.xword	0xdb53129bc4096139
	.xword	0xd35c4beeeedc9ac4
	.xword	0xbdf314b56d47d4db
	.xword	0x203556b7092ab487
	.xword	0x815d52571360db0e
	.xword	0x4132f1cdad80f00e
	.xword	0xf92c6cb0946c2b79
	.xword	0x12dcbf269ae3c753
	.xword	0xa8f6b9112a307c48
	.xword	0xe9a4e9daf0414ceb
	.xword	0x0cfe9d50b3d12cae
	.xword	0xb37d0bdd4083b03a
	.xword	0xaa66e6b7a26d0cb9
	.xword	0xd56afea13e258608
	.xword	0xb5fd6f22a87747ee
	.xword	0xa09ebf14c8d05f53
	.xword	0xd2385338da80c734
	.xword	0x065f4d02c366d825
	.xword	0x0ff181208d171b6f
	.xword	0xc523fd88f58d9cb4
	.xword	0xc76bdc8882ab83a3
	.xword	0x106ee7a76ce0009f
	.xword	0xc950babcec04288c
	.xword	0xd12fe61b684c5b69
	.xword	0x120e2e1634eb6a0c
	.xword	0x0297f22e723050ff
	.xword	0x37d4b72479694bf3
	.xword	0x4cf3f655f7433886
	.xword	0x55a7d77304aeedd2
	.xword	0x67876a8606b48898
	.xword	0x9abf1a5d2bbc3c5a
	.xword	0x2e5df3a124d44e92
	.xword	0x6c431bd82188c044
	.xword	0x768a5dd2660218c0
	.xword	0xa4a6737e6abf09e1
	.xword	0xf121dd6460c0631c
	.xword	0x1a27b3c1e840546c
	.xword	0xad909d813170f95b
	.xword	0x751f569132670746
	.xword	0x247d5a4f558d3123
	.xword	0xb4ba4060d2a22bd7
	.xword	0x2ce1d0f7ca0cb404
	.xword	0xdd0db0a55e4236a3
	.xword	0xd9e63dd895435f38
	.xword	0x0d2f93df0cbaa866
	.xword	0x019fb6c993f865a3
	.xword	0x6d578145fd180622
	.xword	0x34bcc411abcc5b1c
	.xword	0x611f9d30483916f3
	.xword	0xc167c930fa7c7c3d
	.xword	0x3c73811100f25b57
	.xword	0x4e58490e21566184
	.xword	0xcfa2b39fb0e50505
	.xword	0xa10c608bba9270a6
	.xword	0x15e498861fbe9a0b
	.xword	0x75ea1ff5eab35bcd
	.xword	0xf486f967fd49b85e
	.xword	0x1cc6755d8bead5e9
	.xword	0x6c1c4c4ca9bf076e
	.xword	0xc9f571e461a1cc84
	.xword	0xf990f0b6a63b4879
	.xword	0x3300dde6d8a3a6a5
	.xword	0x918c06d8fbbe8c80
	.xword	0xbd42d165f3d787ad
	.xword	0xd10fa81477baa837
	.xword	0x13e0ae37bc7a1cb5
	.xword	0x3f595f7951b1cf09
	.xword	0xf93dc7129f3ecc27
	.xword	0x556e436b78514323
	.xword	0x0d492f4722070196
	.xword	0x255a8d4297213932
	.xword	0x9d5dce9a955b2a81
	.xword	0x7d4830bdbaff53aa
	.xword	0x443b793b06478e54
	.xword	0x8599fcc17360eec0
	.xword	0xc1c7b3014ccbc2f9
	.xword	0x7344b2712a575f46
	.xword	0x0677914c76df383c
	.xword	0x5c7371f3eefe6703
	.xword	0x65349167f3966dbc
	.xword	0x2bcf4de0d0ea792b
	.xword	0x94eb8de588027a54
	.xword	0x5f1e850bbd95812c
	.xword	0x2f24fe613871d644
	.xword	0xd474c0c870eda5c6
	.xword	0x6c16d616b595375a
	.xword	0xf993ecbce3c4b496
	.xword	0x49d33e92c4563b77
	.xword	0x10372deaa06af3c4
	.xword	0xfb1dc5fb66d7f2fa
	.xword	0x44cc7ef85c1c5188
	.xword	0x7737ef52e97aab4f
	.xword	0x86fefce9aeb9ee8c
	.xword	0x7a476d6415be3773
	.xword	0x642183f3158b841b
	.xword	0xa274149fcdbb1c49
	.xword	0x4e54aea049d13b8d
	.xword	0x718e044f9c070ad1
	.xword	0xb9e7d08aa89b80af
	.xword	0xbc58fb78d0713c8f
	.xword	0x648fb9d23e3a2884
	.xword	0xb50f6eb13bb282a9
	.xword	0x78ef33b4cc2b04ba
	.xword	0xb94847001a95fdf8
	.xword	0x7a526b810986a7be
	.xword	0xbb01c51dc65b7f32
	.xword	0x71f7e510fd2bd0b3
	.xword	0x25306447f10eee31
	.xword	0x3cec6a29b6cd6ade
	.xword	0x27b4dbd30f6c0347
	.xword	0x7df1516971ea17c0
	.xword	0x5436de3e528b8bc3
	.xword	0xe05757934c86ffd8
	.xword	0x7703837f8009d99e
	.xword	0x7d9d7d3b3e88e554
	.xword	0x6a401725a9545b88
	.xword	0x424fd8ee39c1f70e
	.xword	0xea853c3c0192987e
	.xword	0x3626fa40d909b941
	.xword	0xa5c6d10e5019cea3
	.xword	0xafcbfc5a5b9cc284
	.xword	0x7264c58e64807c53
	.xword	0x7a3117076e1f1b85
	.xword	0x1ef739b983d00fe3
	.xword	0xbe289d5cfe586656
	.xword	0xe02aeb867029622e
	.xword	0xdf17e9c761f3b473
	.xword	0x1107c034060d27c4
	.xword	0x198b7eff6471ecfc
	.xword	0xb66b09615d3521ef
	.xword	0xf62b8af733ada7bf
	.xword	0x07b57016f8c73f3c
	.xword	0x5e70306f208d8047
	.xword	0x42450d7c876dfe70
	.xword	0x6d699557f10cf7b4
	.xword	0x6a9753e85b2e9db9
	.xword	0xc6f87b85f51f5d01
	.xword	0xc1b4576744f91139
	.xword	0x349c60ce74a507c8
	.xword	0x1d63cc1a7704f34c
	.xword	0xee155f99e15189a8
	.xword	0x8d8e6c155719708c
	.xword	0xec391001de3e4628
	.xword	0xa56555dbff839b66
	.xword	0xd77c6545eefac208
	.xword	0x194d0e40f54e2c35
	.xword	0x6e5ec41047ff02bd
	.xword	0xca064e16ab7e9fa6
	.xword	0x0dda5a97395d34a2
	.xword	0x23ae49e9ec2c38f2
	.xword	0x0c8fc3db95f61441
	.xword	0xda27003740f6b2b5
	.xword	0xf5bb7feac014050d
	.xword	0xb37a1595de4239a6
	.xword	0xf2d3a67433cc0057
	.xword	0x1d99456b82d70ab1
	.xword	0xefda1e4e392b1fcd
	.xword	0xfd80390456a6fa57
	.xword	0xf11299a59f32f92d
	.xword	0x58292028d2c99d1e
	.xword	0x2e403e63a500ce55
	.xword	0x5a9874fbf6c37f50
	.xword	0xc8699ca7738286e6
	.xword	0xb81fe3edde29580c
	.xword	0x176a6c236051a24c
	.xword	0xf25855655378f3a8
	.xword	0x2a76e6127149e1f8
	.xword	0x3bbba3f144295c61
	.xword	0xb327c09591c627e5



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
	.xword	0xa2884d549267443d
	.xword	0xfd3e877cf5cd1f60
	.xword	0xe8337b26d35c2faa
	.xword	0xbed184d2db52eaf9
	.xword	0xdb26e0245715611a
	.xword	0x8bdea28fd20b4322
	.xword	0x0bca2b2205284265
	.xword	0x1ba301b14318c1e7
	.xword	0xdd29bc1a28afa1b2
	.xword	0xf20caaa60df529a1
	.xword	0x1041129d6be643de
	.xword	0x39c9cc48d2415b5c
	.xword	0x439bbd1aea22a7c6
	.xword	0xd3e6f925b2763647
	.xword	0x52a686ce0a18ffe6
	.xword	0x8a1ac2de0b66462c
	.xword	0x5a9d391bd0c4397e
	.xword	0xc5f7f9d51b042198
	.xword	0x0e47caaaed327435
	.xword	0x59e65f460e6e3918
	.xword	0x1829ff1d3a3f116f
	.xword	0xe3618dfe1f496a99
	.xword	0x6771a107d77c2d80
	.xword	0x331bc5c132fce8bb
	.xword	0x641c85b10a514cc8
	.xword	0x36e7c67eae3ee5e2
	.xword	0x5e3d520578e1be3f
	.xword	0x7a6f3f66218d66cb
	.xword	0x571cb1217c9afa6f
	.xword	0x1621fd1f86167a26
	.xword	0x577c57368ee98a79
	.xword	0xf02c2a9b9f49af5b
	.xword	0xde73580d9b7c9d9e
	.xword	0xea51fee9a93cbf88
	.xword	0x045a681804637280
	.xword	0xd8f3d0786a1af4ac
	.xword	0xaccf1e94a8e14df6
	.xword	0x4c30ce60ea214579
	.xword	0x33d676294b360fa1
	.xword	0x26138a2c070b5882
	.xword	0xa8df19acc9f05b97
	.xword	0x58059c1e1badd5ee
	.xword	0x41505c5a667bae53
	.xword	0xa8727998d3f2078f
	.xword	0xcfe79e736ea8de1e
	.xword	0x9c70e8a6cba5a1fb
	.xword	0x6ffd6bd2b5b73d96
	.xword	0x0cbb54f327285374
	.xword	0x95aa39d406f56e89
	.xword	0x66d2145eb5f96146
	.xword	0x44313e5cbaa205a5
	.xword	0xdc7c6dfe8692d07e
	.xword	0xb2829159bf9f620a
	.xword	0x31d0a70086c4e8ef
	.xword	0xae61f92be43973f1
	.xword	0x0fcf3ba8f4793637
	.xword	0x90023be8db47f170
	.xword	0x405493fe202f8652
	.xword	0x36150679b3746619
	.xword	0xbb5d82603b5a8ec9
	.xword	0x6a6871d21053a92b
	.xword	0x9dab5bd478bece97
	.xword	0x1eedc80c0bcd0e32
	.xword	0xab147b911ac45261
	.xword	0x4c0b3e8c58e705de
	.xword	0x8fc270d1d1806ac1
	.xword	0xb3bcc53f1a74377f
	.xword	0x0f7eca873eefbac0
	.xword	0x48d378dc82a02549
	.xword	0x31b81b58f634559e
	.xword	0x1a4b6f2a66e24509
	.xword	0xdac02c67d12ae23d
	.xword	0x8ca5ec9e4c79906a
	.xword	0xab208b2ec1417460
	.xword	0xec9c4484394f367a
	.xword	0x2e6493e54269b18c
	.xword	0x8eb083473b62a86a
	.xword	0x9d088fe93336981c
	.xword	0xe25871b062d063b6
	.xword	0x6d56282f3901568f
	.xword	0x79b72f9448041577
	.xword	0x9af5ac3c96ab0d66
	.xword	0x527e37b5f8059607
	.xword	0x921e312543aafa11
	.xword	0x025e00830e7d496e
	.xword	0xc887ff215edfad99
	.xword	0x1d060e745621e95c
	.xword	0xb8a0a75247bead78
	.xword	0x49548f1e99c92c44
	.xword	0xd06731d523b3eb80
	.xword	0xe6ae893d6e08bc03
	.xword	0x9b8ed19ef5d65907
	.xword	0x939ede008f598af9
	.xword	0x6ae594161d3ab6f9
	.xword	0xc3596945f9723fca
	.xword	0x12655cd518160564
	.xword	0x93baf3d0454926f4
	.xword	0xe7fc3e457680ae4f
	.xword	0xd679506502632e6c
	.xword	0x4e533647c49d5bbc
	.xword	0x61ee2c50c7aa1246
	.xword	0x5d27a847bdf29f3b
	.xword	0x19826e0d5c345474
	.xword	0xd89fb763d77c1a96
	.xword	0xeeb4bb515de2f718
	.xword	0x26a5f888a381f49f
	.xword	0x303d110889cd499f
	.xword	0xf030ac4aa4651314
	.xword	0x7fc8acb97b42fc81
	.xword	0xf244f34b6bb11647
	.xword	0x789e60fc23b3a088
	.xword	0x53cd0afb98e0c65a
	.xword	0x41d78601f672a859
	.xword	0x6e1daa8694eb1932
	.xword	0xcbe21d88a7300e1f
	.xword	0x14b107cf4e6dba91
	.xword	0x44ed620d3442f600
	.xword	0x19359b9335e5a668
	.xword	0xede79cc0ac6be291
	.xword	0x897cdd12df446d4c
	.xword	0x32dfd13e5f9f6047
	.xword	0x768af9b59ae12011
	.xword	0xa6104594430f487b
	.xword	0x3976c49cfb11fa57
	.xword	0x3c5e424e1a72b050
	.xword	0x386e0176180e0b22
	.xword	0x61b744bce689be8f
	.xword	0x5925535a8dc0555b
	.xword	0x3e0f29d37bfc95b3
	.xword	0x0eaa384292851d04
	.xword	0x2023fa4c2b02f7d9
	.xword	0x49c60a2012705f22
	.xword	0xb0f70a724c7e8dc0
	.xword	0xdb10624c8f7b0117
	.xword	0xf7ca251a84634665
	.xword	0xe411c0ee0a20f19d
	.xword	0x59d1afdb142ae4b3
	.xword	0x51ac25548f8db64a
	.xword	0x3bf1596a20223e19
	.xword	0xd7d3cd48d4b2fbe3
	.xword	0x70221bdb6b828ee0
	.xword	0x3cba60d36a460135
	.xword	0xe53b0e6093d9ce9b
	.xword	0x1fb430caf4bb7b0a
	.xword	0x9e0378c127ade9d1
	.xword	0x89536651d0b491dd
	.xword	0x7f13326436f99491
	.xword	0x23d91081d434841f
	.xword	0x3ef603f8bff30475
	.xword	0x85d2dfcb51b6b3f1
	.xword	0x61f962d4c7724c8b
	.xword	0x9a79225b8da761d7
	.xword	0x20b63f421f5fa174
	.xword	0xf87ed93f3b083fe2
	.xword	0x582ae3330cf62f73
	.xword	0x688ccff5f6f34671
	.xword	0xa0da124050de3cf8
	.xword	0x7c053c2c7654d718
	.xword	0xb88c331f1e19b239
	.xword	0x2d91a6fb116f2e05
	.xword	0xe1bfe4d0db665799
	.xword	0xf98951b4190598b0
	.xword	0x5cb7fa746059d2dc
	.xword	0xbbc03000391ba13c
	.xword	0x354d219b0ce5b1f8
	.xword	0x0076ca65dd5c0ab5
	.xword	0x6618bf8e588e8838
	.xword	0xc1536b1cf393cef5
	.xword	0x883ab28656d42a20
	.xword	0x1515586307fd6f97
	.xword	0xe19a703f5f47f637
	.xword	0xbffde7ca1d1db26f
	.xword	0x4436c1d34540d059
	.xword	0x409c9fd4c63e96e0
	.xword	0x0f3f7e6b14648f26
	.xword	0x592a3769347a4d7f
	.xword	0x793d0a19f65a3699
	.xword	0x78f2f43b08c3913d
	.xword	0x4f3c5c71c78ea765
	.xword	0x2124716fbeb8096b
	.xword	0xb74c14c5c472db09
	.xword	0x0d820db1e7c1cb38
	.xword	0xbb3dc8f0d49efd6a
	.xword	0x8d0aca1b18164584
	.xword	0x97825c6ee86f4806
	.xword	0x761bca1cdf6d8af2
	.xword	0xe3f406a85d586501
	.xword	0xb630f7c135ad1fc8
	.xword	0x45b0b2394ee301c5
	.xword	0x70675ecd5af5c546
	.xword	0x5ab3ee6304298b27
	.xword	0xf7eff3ca78be1c07
	.xword	0xf94a2ea310ed777f
	.xword	0xc57a3d99b07f585c
	.xword	0x7d38894db4e67d53
	.xword	0x3bf6f9b74c6caa17
	.xword	0x82fbfeed57d7ae39
	.xword	0x6a2d7a40c30ae597
	.xword	0x48460160c2480a86
	.xword	0x3d7d0705abf72457
	.xword	0xaac3341f0508a7b0
	.xword	0x8e50496275f6a9c3
	.xword	0x8e0ec663014a9deb
	.xword	0x8efe6acd1a02e0b5
	.xword	0xfa99ecdc0cf40352
	.xword	0xd07a9cfd59f0d7ba
	.xword	0xaa3d7b9a0088ae04
	.xword	0x123b6362e9496234
	.xword	0x68ea3399735a9553
	.xword	0x56703b8bdb22b070
	.xword	0x0d14f707aba4dd01
	.xword	0x7f449babd12b765f
	.xword	0x5dba1f54d52b735a
	.xword	0xcc7108bcfc151a3b
	.xword	0x87a7601fd338612e
	.xword	0x0ee6b0d9d54f68e0
	.xword	0x123f68aa75bda0c4
	.xword	0x165ee6c5f2c615ff
	.xword	0x710d8c630a611200
	.xword	0x421a0965ac3504b1
	.xword	0xa49b227d1c501f9e
	.xword	0x980bf343286da392
	.xword	0x18a20f8807720804
	.xword	0x75388e224f3bb098
	.xword	0x85f99e05fda81b97
	.xword	0x5439b9522837b0c0
	.xword	0xce6b4583eaae7842
	.xword	0xfd13c757e34169f8
	.xword	0xd5e98b0cbb9fe924
	.xword	0xefc7bc34c53fb896
	.xword	0x42a9a0fa287ef3d2
	.xword	0x92b66fb6a3389979
	.xword	0x3ab472dcd046a9da
	.xword	0x71e9a4e13524d6e3
	.xword	0xe2ae4f40343703d7
	.xword	0x8d91e35c2b8d915e
	.xword	0xb580b35a649eb01b
	.xword	0x76c64d50ac7a1f30
	.xword	0x0901bdd843e36d90
	.xword	0x6227da75591bbfe8
	.xword	0x28be6376ce39a6a5
	.xword	0xb24257d7ce903349
	.xword	0x8e6c25ec92905f51
	.xword	0x90b1b2be5fef95ff
	.xword	0x594ef7f0cf71191c
	.xword	0x816211a2dc59a3c2
	.xword	0xf97d39e3fb3b1e1a
	.xword	0x0cca509b8b20ae12
	.xword	0xdc09db54d9523f68
	.xword	0x4f2f8e4179995bc2
	.xword	0x8d85012e27df8280
	.xword	0xf1365b316a17e6d3
	.xword	0xda39d5518023f80e
	.xword	0x10f45e4d2b5af71e
	.xword	0x23d558b8d9bf23a9
	.xword	0xfdd160c8eb325928



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
	.xword	0x8c931b2e0af2273c
	.xword	0xb7e2139328e35067
	.xword	0xf4daf609da40543b
	.xword	0x77d2ac3a8ce2ba5b
	.xword	0xad62a96c7d273914
	.xword	0xe89de36552d0778c
	.xword	0xcd63bb15f3f54e0c
	.xword	0x635979244c0846a1
	.xword	0x7aa8f31268f85a46
	.xword	0x650f323fe4e000bf
	.xword	0xb68397bb15bd687e
	.xword	0xaaa58ca4bb44cf41
	.xword	0xf0f3d44122fcac14
	.xword	0x3aece80af507e558
	.xword	0xf0d82770c51b3f7b
	.xword	0x2acf53f7f15e43a8
	.xword	0x63f7cb7cbb693a41
	.xword	0xdbc465cb2f0c382c
	.xword	0xbda4cb205b14ca3d
	.xword	0x5c2c27ccbf6ab94b
	.xword	0x4d5ca4efa23b8bca
	.xword	0x0523177217966c29
	.xword	0xd730ee596d22a20e
	.xword	0x4c41caa99cc45844
	.xword	0xf79ec45a10039906
	.xword	0x0e95427acbf025fe
	.xword	0xdd0fa4ad1ffd8bc6
	.xword	0xa5924752b42e83bf
	.xword	0x50946de48e2feb71
	.xword	0x136ea34d302456a1
	.xword	0xf943fd9a03e1fe5c
	.xword	0xb08052c577c1e11a
	.xword	0x85f3f719b94d7edb
	.xword	0xb1b8f9a93cde42e9
	.xword	0x6e61a025f7154826
	.xword	0x76170e85b4f3eff4
	.xword	0x62d7ae24ede270e3
	.xword	0xbbb9cea495553b0e
	.xword	0xa7debaf45acfb6c0
	.xword	0x12879c801f0deed6
	.xword	0xa1b0b9b6595bb0da
	.xword	0xa6c4c77740e17abe
	.xword	0x5d0d410af4783c17
	.xword	0x7f1b009534dd0a93
	.xword	0xd13971626fdc5612
	.xword	0xe2e0610bfc677daa
	.xword	0xd288473ed5fad74f
	.xword	0x2ba5f80a5d242928
	.xword	0xe7b7d7baafdbbb17
	.xword	0x20cf72958fc84006
	.xword	0x2259c9ebd531bd29
	.xword	0x6b33d6a77a5ee0fe
	.xword	0xc606cd605d86fdca
	.xword	0x0d03317dd045a225
	.xword	0xc0c25fdcf1ab32b2
	.xword	0x6a9e55bfcd62ad9c
	.xword	0x119fbe4892b1235a
	.xword	0xc7d5d04e81d37339
	.xword	0xb51f54fe54a54500
	.xword	0xdad7416e5600b510
	.xword	0xb848ca9333136aaf
	.xword	0x0ea941eb8687336b
	.xword	0x86e8314a7f0fc2cb
	.xword	0x1e2e343309faa288
	.xword	0xec4986f22c11b5d9
	.xword	0xf0cfee4d0b4686ba
	.xword	0x136ce5f6c7768d02
	.xword	0xabed9ba41d80c70d
	.xword	0x569020aac1cc1035
	.xword	0x9063cbeda209f7c1
	.xword	0x134fd1b1734a16f0
	.xword	0xe7de8bde23c472ec
	.xword	0xd80a0f3ac1e9fc59
	.xword	0x0bfc730212dac2eb
	.xword	0x81095eeb3198e11a
	.xword	0x1cd8482bc4ac734d
	.xword	0xcd467e9c81c780ac
	.xword	0x5c8c4be69d731c07
	.xword	0x275464587e189a6e
	.xword	0xbaf35745c6802981
	.xword	0x3eeaab64097232e2
	.xword	0xcd3e42d244baf3ca
	.xword	0x9b1c4016e4ff7c6d
	.xword	0x383f2882ccb42b3b
	.xword	0xe3eeb86986a57746
	.xword	0x56db203cf4668e70
	.xword	0x1ad57b9d92f84929
	.xword	0xa3b0ac5e7918bff6
	.xword	0x0e8b8e97af6c7c61
	.xword	0xe4ed45f6e879d271
	.xword	0xfc2450c171294f98
	.xword	0x1dcfc349bf03c2b8
	.xword	0x6aa47fe74264432d
	.xword	0x8fbc2454f87967e4
	.xword	0x31cebbe5f4726ec9
	.xword	0xb10075f97ffc1c99
	.xword	0x1de44651f3ee182e
	.xword	0x3da66798505af55d
	.xword	0x59130a0da8d25c1b
	.xword	0xdfb47843e863f99c
	.xword	0x5cef14f73c8db1fc
	.xword	0xad45cae52151429b
	.xword	0x4987abd2ef4df90f
	.xword	0x90cbd7e8b1b42959
	.xword	0x1f3bae23f92dd658
	.xword	0x0489d8d328fff562
	.xword	0x36ba5ec730304f1b
	.xword	0xff3d591424477410
	.xword	0x73c2a23e919357c5
	.xword	0xfcc2d7d50838e26d
	.xword	0x8a2f7a3525d12d4a
	.xword	0xea3c57a666a2da34
	.xword	0xd2637ef39e8f867d
	.xword	0xadcc903795c2f58f
	.xword	0xaa40f5b46d94cef3
	.xword	0x978f6f61aebf60bc
	.xword	0x2893f0e0870ee8ce
	.xword	0xe2a743dc6b8cfe70
	.xword	0xf5838eccd3a46b6d
	.xword	0x92946a8b10f72a4b
	.xword	0x80d56674dbdf1d4e
	.xword	0xd4624912f9c76bcc
	.xword	0xab84241d08389a39
	.xword	0x51783325745e9e87
	.xword	0x04c63dad57f5b5ca
	.xword	0x479c31e242012466
	.xword	0x753b695a2d29feda
	.xword	0x687fcb084edf6623
	.xword	0x6b5ff6951c75ca1a
	.xword	0x1fca58744ff18cd0
	.xword	0xf24bb5dea8d34914
	.xword	0x06e3487c99aa99bf
	.xword	0x939c3a468b011f49
	.xword	0x7e883beaed7c6dc0
	.xword	0x4db7b364eed103a0
	.xword	0xbe8e141409fd3611
	.xword	0x775b416113b2266f
	.xword	0x421f9b35665baa0e
	.xword	0xdf854e08496583bd
	.xword	0x19bdd0a33b7a108f
	.xword	0x3ea2f3a375749580
	.xword	0x28a8a7e732796cb3
	.xword	0x202088a987819af4
	.xword	0x473e6e53bdb814fb
	.xword	0x287e52dc781f5ee9
	.xword	0x9f39960b7c5363c8
	.xword	0xd8d1d0efdaf7087e
	.xword	0x35f56a6abcf5a4bb
	.xword	0x394c6c1932e18c62
	.xword	0xc91119d4b94126e7
	.xword	0x95f97f549381e5e9
	.xword	0x046dad2fe66e91dd
	.xword	0x048339f85ff7718f
	.xword	0x12ff9d5d0697de7d
	.xword	0x38899dc37db4250a
	.xword	0x6caaa67a2cc9ea84
	.xword	0xc558807ba1ce2ac0
	.xword	0x70a0d7e224b9254a
	.xword	0xd47ab9eee93587f5
	.xword	0xa5f36f1811929168
	.xword	0x89766f74f96a83ce
	.xword	0x4e008eeb10e8a5c0
	.xword	0xfed352fc57cbb5c6
	.xword	0xa7168b49e698e2e8
	.xword	0xf79a07fb7ebf210a
	.xword	0xcb63b3e4cc5a2d20
	.xword	0xb7474619cf562da3
	.xword	0x93051091aee601c5
	.xword	0x19fb62009e15e8bb
	.xword	0xdfbb7d601d6f0e7e
	.xword	0x487ebdc37c89b3e2
	.xword	0xb823c27fa1851326
	.xword	0x7fb0c3e5ae34e57a
	.xword	0xe3731e24810c618f
	.xword	0xd9296ff8650b70a5
	.xword	0x531352ec112320b0
	.xword	0xd88b4e35de80840d
	.xword	0x46f1889e2bbcfec8
	.xword	0xab08d2311a46c2b6
	.xword	0x277544f502e87765
	.xword	0x33149c54d51555cc
	.xword	0xf8dd3e0ec1317c3c
	.xword	0xaedadd45719c3227
	.xword	0xcf1cb69d5a632be1
	.xword	0x1db8fc38ed49be19
	.xword	0xdb19a79cdd2db832
	.xword	0xf822c5c5af4ec1fa
	.xword	0x0fbeee808bf47f0c
	.xword	0xa0252031f0cb83ce
	.xword	0x3aeddfac4818c668
	.xword	0x874d0c94e3a28821
	.xword	0x437bcbdb958427a5
	.xword	0x7aad4cd29c1a6855
	.xword	0xacc3f2b326b1c783
	.xword	0x97b6c80ae46c4a7c
	.xword	0xf3e467d5579dc7f6
	.xword	0x15053d7a2603e132
	.xword	0xcadad882cce75ea6
	.xword	0x06a24c6c8741bcfc
	.xword	0x2b9dd273788a6d15
	.xword	0xb174b102f31ec398
	.xword	0xf61ac10abd760ae9
	.xword	0x902aba80d8809cf2
	.xword	0xc60277b7dbacb1fe
	.xword	0xe7594dcdca60b6cb
	.xword	0xab607b57bdb0fd2d
	.xword	0xa5882ee3a6e9594a
	.xword	0x3be60661abb99472
	.xword	0x3ff64e9279dda8f7
	.xword	0x0290e020593c3c1a
	.xword	0x730f12d5cfdb1c11
	.xword	0x9c60474a600ff376
	.xword	0x2c7772f25ac1f17d
	.xword	0xe968a3839ff7a388
	.xword	0xcde8af29140598fe
	.xword	0x0b793b87ead1795d
	.xword	0x8ac9eca06da736c5
	.xword	0x6d4e4138a03da64a
	.xword	0x81058d850f65779c
	.xword	0x2fea2912042ea8f1
	.xword	0xfe9a928a0c11c582
	.xword	0x38e0e127587eccc9
	.xword	0xa9903843d06ad0a5
	.xword	0xc072206fd1bde76f
	.xword	0x834924c2e4c2f0e9
	.xword	0xec0f090ab2903b1a
	.xword	0x57c92e8da53810e4
	.xword	0x96ee3e1da26e1743
	.xword	0xb215ff8c7076287d
	.xword	0x2dfb202b949dad7a
	.xword	0x84d5591b67c40176
	.xword	0x62accb3c86668302
	.xword	0x8e7b5d57510f93c0
	.xword	0x894c86707e6292ab
	.xword	0x16327b8070eee8cf
	.xword	0x9be246bdeaf9af55
	.xword	0x4de1cbf47430190c
	.xword	0x529111159deee1eb
	.xword	0x3218e163853c668a
	.xword	0xd6389463b67c9cd8
	.xword	0xe8dc1410d557ef66
	.xword	0x28f578a0b7999835
	.xword	0xa552cde11f768297
	.xword	0x1801c9c15bf7a118
	.xword	0x72100377d6c83174
	.xword	0x8a21ec99211c5ff2
	.xword	0xb571447654cee6d9
	.xword	0xde0331ee7a7f4936
	.xword	0xf763a6dd9a239f86
	.xword	0x5195195b339a17cc
	.xword	0xe8da02cb96bed94b
	.xword	0x97476c8a27adfd07
	.xword	0x40608180d8ceea5c
	.xword	0x2ba1d98b272cdd9d
	.xword	0x3c432da9b93fdf7e
	.xword	0xda532e48033bce5f



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
	.xword	0x3b04c0cdad8b78de
	.xword	0xb5b421e6b2af28a8
	.xword	0x43eb3c676a138fe8
	.xword	0xd32445c6e666af9a
	.xword	0x323605efdba78f90
	.xword	0x08393092d3e14a48
	.xword	0xe89101a4d4c6f1c2
	.xword	0x47d5b20dc0598774
	.xword	0xc81843195bb0891d
	.xword	0xc67b0352c91f2a61
	.xword	0x4650b66278fe4d94
	.xword	0x02d37e9070a56b94
	.xword	0x395258e77e3a43d8
	.xword	0x3980399fbe0e61f1
	.xword	0xbe80b107ff222628
	.xword	0x6a3bbb05179cfded
	.xword	0xb14c4e2abb3e7f88
	.xword	0x49ed24792458d47d
	.xword	0xfe0ca5dc4f077e63
	.xword	0x3ea3afcb80ef521a
	.xword	0x4fd6f5e57e66b89d
	.xword	0x2ce1b98c8728c048
	.xword	0xde5089f8b70706be
	.xword	0x8f0e6c015196c023
	.xword	0x7433bed13ec2f457
	.xword	0x552537f6a7aa4c8a
	.xword	0x8fc1c94e5ddfcaee
	.xword	0xa37d1dcd9f8741e3
	.xword	0x2803711ddc901fe1
	.xword	0xebd7ffd12350e261
	.xword	0x734a18af8c6d8d08
	.xword	0xc69c905149c69067
	.xword	0x3ee232c4b95a3f54
	.xword	0x9f4fa83b72d2ce15
	.xword	0xb7a944f793f75610
	.xword	0x6f3c65b2c1923d9c
	.xword	0x7eb689b5ffe81383
	.xword	0x3c4c13c61d1560b1
	.xword	0xf27bf61ec7f74ee2
	.xword	0x319a1bbd4538bf52
	.xword	0x9fea9b302f81d9f4
	.xword	0xf8c02725cff57e9c
	.xword	0xb59dce4b2eaea4e9
	.xword	0x13484808cb129293
	.xword	0x23466804a55e35a7
	.xword	0xec71e3aa74c03907
	.xword	0x806b2d5e88ff11b4
	.xword	0xd9532c92f36c2675
	.xword	0xc196943cf158b25e
	.xword	0x2595f2f03b47f698
	.xword	0xabf66dce6719e79a
	.xword	0xf0c35328db68f8fb
	.xword	0x5ca5d19d6d4d663d
	.xword	0x809e4915538b33ec
	.xword	0x9b8588cf37207a5f
	.xword	0x8caadbf88f8a3d5d
	.xword	0xd27560b37ef1d000
	.xword	0x8eddbded3bde87c7
	.xword	0xf0ec0783e53916f4
	.xword	0xc3e4e68beec4c44c
	.xword	0x20f1c553245092a2
	.xword	0xa5999cdf6aaf8f18
	.xword	0x75abdbaa31251cdb
	.xword	0x5a6b4f11641c2cf6
	.xword	0x565c956ed1119eac
	.xword	0xb8a818925fdb6cc8
	.xword	0xc1a61e859801a627
	.xword	0x5becafc888fbf684
	.xword	0x3abb60e254868947
	.xword	0xc90cb66afb881127
	.xword	0xefd7f9f4f7d2ab79
	.xword	0x540974827637441e
	.xword	0x9dd2c8301c4e0c6b
	.xword	0x882565a11c42fb96
	.xword	0x31d515abebb44dbd
	.xword	0x9ed8d4a981ef6be8
	.xword	0x0e0d2e0fcbcc8d82
	.xword	0xf789635c408c5863
	.xword	0x18460c3f04768dd5
	.xword	0xafc4e2618cbf2cb4
	.xword	0x274631d82f9072ad
	.xword	0xbfeb6d6c512402a6
	.xword	0x12726ac5bf428204
	.xword	0x1c7a672ca65a6e4f
	.xword	0x500cfd527fd046a8
	.xword	0xeca44eb54e0acf2a
	.xword	0x36d340abd24aed7b
	.xword	0xe5c3207ed6932de2
	.xword	0xbc2be14405d90513
	.xword	0x01464be98d99fde1
	.xword	0x84e8aa1dce6c83b6
	.xword	0x43dfc6736c24fae1
	.xword	0xf4bb8277aaff860a
	.xword	0xfc79c9ccea73c8e8
	.xword	0xf163459a9d8fd4c8
	.xword	0xe8c5b583284eae6c
	.xword	0x80b9c2fe9d6ee6e8
	.xword	0xf833e35a4c5f3440
	.xword	0x0f0bc4181dca14c1
	.xword	0x5a75e4ff9fa3ba45
	.xword	0x133e92be20fcff02
	.xword	0x008d8ddf50c386bf
	.xword	0xd0c5b1d42a3c6626
	.xword	0x262da95cbbb8c2f3
	.xword	0x9309034ca30ce8c7
	.xword	0x4bc0f3aff6bba4cf
	.xword	0xc13b6b50f3cee33b
	.xword	0x9d8347ee4e41bede
	.xword	0xbafe565bc61359ce
	.xword	0xade1a16f45286de5
	.xword	0xffd41d80d9a56318
	.xword	0x0be4abbe7745b23e
	.xword	0x138ed8e0e1c4b878
	.xword	0x2ea6b0a9b0be372c
	.xword	0xd3d5642a7e6ed6b3
	.xword	0x12dfb54f2678acca
	.xword	0x7b4737c37e1c07d2
	.xword	0x21fc189a88d106d8
	.xword	0xdcc9341ea0f55660
	.xword	0x7dee7b54b4abd61f
	.xword	0x8aebaec7b4f6fe0a
	.xword	0xd88243f8c2b9b154
	.xword	0xf263b61846380bef
	.xword	0x0b9865279e2a8931
	.xword	0x4e556e4f032f89e8
	.xword	0x181375ba3882e208
	.xword	0x6ddd143d016f63da
	.xword	0xa452ea5b4964609d
	.xword	0x88f4e41e7a344afd
	.xword	0xe0644937ec05fad5
	.xword	0x669111675c519887
	.xword	0x613ac640127c2d0b
	.xword	0x56dfabb119079f25
	.xword	0xc93679a4e827543f
	.xword	0x8e5bc6d1eba4c2ad
	.xword	0x9329a1e963bdccc0
	.xword	0xb9817bbe9d2bf7f6
	.xword	0x713a83de8e52bfc8
	.xword	0xae7b838978ce1b09
	.xword	0xfd2729a702aa060e
	.xword	0xca56498d75b16770
	.xword	0x8109cefa87639779
	.xword	0x2ac755921e870c98
	.xword	0xe74a4af4f26ff5a8
	.xword	0x33ec82a6e5eaabf0
	.xword	0xadf69c4821945bbf
	.xword	0x6a10a3c5a12574e9
	.xword	0x7ac2e3ee552942a3
	.xword	0x0346e97413c35f0a
	.xword	0xde56511fc4d82c53
	.xword	0x6f9e6bc257a49069
	.xword	0xc9776d1f7b938622
	.xword	0xd564fc871d8d6369
	.xword	0xd706f0346348e0ec
	.xword	0x43fc78b206f922c5
	.xword	0xf8bad57d952b5f08
	.xword	0xed39c0fef24ba459
	.xword	0x725d509ec219e4d9
	.xword	0x1bedb5b8c0fc0667
	.xword	0x770218c992a4c3c0
	.xword	0x1e6c8589619cab6b
	.xword	0x7b0292dfc2514f7b
	.xword	0xc621bdda0c7c3b91
	.xword	0xc2d69e29f70fb626
	.xword	0x5e5ad7b4b359255e
	.xword	0x426eb1b1a1a56e60
	.xword	0xd6b064b8d5553019
	.xword	0xd1b7200522ad48b1
	.xword	0xecc3a300483ca80e
	.xword	0x64b604d752fa2d35
	.xword	0x2ee5a455357443ac
	.xword	0x0253b47bd33000d0
	.xword	0x89ca216325cd5e3e
	.xword	0x776a2430189ca798
	.xword	0x5b124f44b8676b60
	.xword	0x419f363d09197209
	.xword	0x6dcbedc0b4d37c14
	.xword	0xd7014a52d2c7aab2
	.xword	0x56463a9f902d7cd3
	.xword	0xaae3d8394156dba7
	.xword	0x8667c2adf0d561d2
	.xword	0x11def3c1e1637728
	.xword	0x4eabfc259313f8b5
	.xword	0x40e033f357afd6fe
	.xword	0xd8cac258311fca5a
	.xword	0x47b2c7f264d46f79
	.xword	0x971d5a3be260d688
	.xword	0x387917206629b149
	.xword	0xb411ea97b91d89ec
	.xword	0xfe3120c0e62e6925
	.xword	0x8b6a992e33e7e128
	.xword	0x08f4b750c50be5c6
	.xword	0xff5ed89176cfbe84
	.xword	0xf093b0b6f14d63db
	.xword	0xa9086be70c79aabb
	.xword	0x40d9bffc36922b15
	.xword	0xba889c9b262d8834
	.xword	0xfdcb300b0a915087
	.xword	0xda1bc106fa7f7d4c
	.xword	0xbd1b4779eacea943
	.xword	0x388db673490a4e0d
	.xword	0xe1644e0705180224
	.xword	0x6b52ab099164f10f
	.xword	0x0c09e97629d162e6
	.xword	0xee96f3e92fb1d1bf
	.xword	0x8c72d9f5e3257cd5
	.xword	0xad532c7b5042538b
	.xword	0xa0209f29f43816c9
	.xword	0x1b0a75d8a7fce7fa
	.xword	0x26f91f2e6f891dce
	.xword	0x0a379daa16f6a926
	.xword	0xd0d6b11137494b98
	.xword	0xb3837e11a7d56c81
	.xword	0x095fc949265ba129
	.xword	0x9c1fb88a758dc474
	.xword	0x8c3699e1da43e928
	.xword	0xd9efeaf2ce112bd1
	.xword	0x909ba9fa8023e3fd
	.xword	0xd610009d36938eab
	.xword	0x01965c08559265bf
	.xword	0x2814b6203eef2f67
	.xword	0x87f594b726f50668
	.xword	0x074466dbba0411c5
	.xword	0xb6625b884b83b091
	.xword	0x5e876989dcf4eab7
	.xword	0xe4370f8e1a8c3a49
	.xword	0xb1281f5c211e7b6c
	.xword	0x7abb20cba6649a22
	.xword	0x79ca6cb0479b9406
	.xword	0x7e9d75c83bf10a8e
	.xword	0x50390eaf359bf658
	.xword	0x360f6501078966ec
	.xword	0x210b2e88a74f2bb3
	.xword	0xc40aeeef3b81322d
	.xword	0x2870f844988bcb2f
	.xword	0xc18a6abdc957544b
	.xword	0xb2d720040516637c
	.xword	0x1140d3c2dd01d1e0
	.xword	0x2436c581e56b9a31
	.xword	0xb10c98bf5b2da14d
	.xword	0xcd5eb165fd67d1a0
	.xword	0x1961653581249144
	.xword	0xe0f62a6aaaccc6dd
	.xword	0x1106e2a33f0167c1
	.xword	0x778a708fbc336df5
	.xword	0x136f40dca8bfeabe
	.xword	0xe4be57669cba9253
	.xword	0xb815d526f791b7de
	.xword	0xb8a4ce0b65e4d176
	.xword	0x42568ebefb0b26db
	.xword	0x1095582f76a72d62
	.xword	0x4de8990499d9e493
	.xword	0xca5e117852d72369
	.xword	0x5f5368384b01d761
	.xword	0x50082148fcb8ff43
	.xword	0x43b8145fb26a54b9



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
	.xword	0xf2363ee91f0f6e6a
	.xword	0x43a4d1cd419ffe0b
	.xword	0x353a61028f132bd5
	.xword	0xfa47ee4d59db4431
	.xword	0x4d81eff847770e41
	.xword	0xeb3552982111b540
	.xword	0xdb8e52b9e8b6e91b
	.xword	0xa43a8898c766ecc3
	.xword	0x2469f242d5602c2a
	.xword	0x618c0b15f6116ece
	.xword	0x147d096596b5dbac
	.xword	0x162f780f84833e9a
	.xword	0xc29abc6df5141924
	.xword	0xe242cde338e8cea3
	.xword	0x67a19ff34bbc3dfa
	.xword	0x659ec43a5e2a1cf4
	.xword	0x332d65839bb4c3e3
	.xword	0x4855e3eb7f868a4e
	.xword	0x42d0a38c80d3b3fe
	.xword	0x9b17381adf5fef9d
	.xword	0x3007a9df4c976c94
	.xword	0x9abf6932a0c6c23b
	.xword	0x9865c413a58995a2
	.xword	0xbda67d1f4625c49b
	.xword	0x74c075e0a31dc6e6
	.xword	0x811dd42becaa42a1
	.xword	0x3c66f6e03108c1c9
	.xword	0x60c32b8cc1a3550a
	.xword	0xee8b8fb46a43c2d3
	.xword	0x0c16816e174f80a2
	.xword	0xca069ae20c17ee55
	.xword	0x512d91df410f57a0
	.xword	0xa3f3281c47e1dc6d
	.xword	0x35a79767fdc8b82f
	.xword	0x07edfdb02d4d390c
	.xword	0x2af9323608817bbf
	.xword	0xae3c49953bf8c82f
	.xword	0x48e3e9f3f2f6fb13
	.xword	0xab2c7fffbd923d36
	.xword	0x650c7aec0428ba19
	.xword	0x5c2883f0b224e735
	.xword	0x394c816707bba16a
	.xword	0x5a040b197eaad83d
	.xword	0xbe30011f488456a1
	.xword	0x0635a73fe8e96d52
	.xword	0x1a244196ce550f4f
	.xword	0x1b1ddd3b5607bafe
	.xword	0x55df15038f570560
	.xword	0xbf6a4f44c6fb1ea5
	.xword	0x4f5f69aff5c74505
	.xword	0x24670d1fe80b5fe2
	.xword	0xa122fbba58694bf7
	.xword	0x8d6aaefedddd6088
	.xword	0xafd081a9172a506b
	.xword	0x4e21e12dabb07c68
	.xword	0xc809991631498ebb
	.xword	0xfc3b84aa78f4a668
	.xword	0xe6933d6500a7270f
	.xword	0x46b50d87830dba3f
	.xword	0xca71bbf4e597cffe
	.xword	0xc9aea453d3533b4f
	.xword	0xefe58eda15726108
	.xword	0xfbaee22ce41ed29a
	.xword	0xb7afeed14ecfd80f
	.xword	0x6210ebc0aa94baf7
	.xword	0x99ff104d905ae9b8
	.xword	0x072e47fb0209d23a
	.xword	0xb257b23d36b4ac8e
	.xword	0xe36a66af46107d1a
	.xword	0x1edfaa725c4aa7c6
	.xword	0xc06ad197099afaf3
	.xword	0x694f0a7c656c0e2b
	.xword	0x7e474e60bba1ec2e
	.xword	0xd4e37aefb1a90c28
	.xword	0xd07bf66f84ac1bf5
	.xword	0x796d8539fcf620eb
	.xword	0xfb108eaf8a389c22
	.xword	0x6609c610d5e020c7
	.xword	0x0fa9f9a1acfadd56
	.xword	0x210097e8e4deb952
	.xword	0xc2a075c6f8d506cc
	.xword	0xf147cafa9b6b10c8
	.xword	0x3c175f0afc39594e
	.xword	0xf218a078093370f1
	.xword	0x81a1be119be29a27
	.xword	0xd0c74ed02c8671b1
	.xword	0x7c31bee968d2f3be
	.xword	0x3142caec1f65d51f
	.xword	0x812e8eea3f7226af
	.xword	0xc7401bb80baddd9c
	.xword	0x1cbe85f7f2c73422
	.xword	0x18691bb1116a5bdb
	.xword	0x6968987e6aa447b3
	.xword	0x1cb4e8cb882cd450
	.xword	0x958dcfd596f1aeb5
	.xword	0x4ccc065da90f3de3
	.xword	0x6be526e9d4684ef3
	.xword	0xb1182e4ee3f7e5ab
	.xword	0xbd90d98f241e9830
	.xword	0xfcd3e0a16029d6ff
	.xword	0x20c932e22157672d
	.xword	0xf11d61dc93905794
	.xword	0x3af11fc0a4e43089
	.xword	0x6600269cf5dfefb2
	.xword	0x84f832e7dfb41de1
	.xword	0x2d3e592a42640d05
	.xword	0xe81f04d88aad606f
	.xword	0x88e272a46fa608ea
	.xword	0x61e8d98623030de5
	.xword	0xc929708f574325af
	.xword	0xa3552e4c200094cb
	.xword	0x1d1ef0806c992670
	.xword	0x27a98985242622ff
	.xword	0xaf59663ff2095011
	.xword	0x97bd0c3d7e20679e
	.xword	0x8724166953b1560b
	.xword	0x322622f3cbe331a9
	.xword	0xa5e92aa32fdc61fd
	.xword	0xdbe5b4fcc4f18237
	.xword	0x759a3a2190f13916
	.xword	0x787f678fd85a41b0
	.xword	0x5de756791a068e8b
	.xword	0x8475a844709ec38a
	.xword	0x71a326d80a380a5b
	.xword	0xd984895ec2445591
	.xword	0x158ea0a1674c6797
	.xword	0xc6309d57c43f2ba1
	.xword	0xd55e322352e52779
	.xword	0x20124901be6593f4
	.xword	0xc55f99e4f8d27606
	.xword	0xd227ecfd24ea9928
	.xword	0xc647a3ee139d0d38
	.xword	0x63a097cc388523fc
	.xword	0x4228ec7e0b3f920e
	.xword	0x1e806930c1337ae4
	.xword	0xa9d3ba6662197e81
	.xword	0x497c847914ce975a
	.xword	0x7cb8ca0aba192853
	.xword	0xed06fb08891c403e
	.xword	0x0100bd7141dec618
	.xword	0x4ccbc4383f44f2bf
	.xword	0x4021b2bc381585fa
	.xword	0xa7aa9b2be418b05f
	.xword	0x9741116e2fe91949
	.xword	0xa4cf6105dd9677b8
	.xword	0x7890644b3bdddc9a
	.xword	0x56e1a960b2710858
	.xword	0xfcda23890ec339dd
	.xword	0xff2bc3cd6422dc74
	.xword	0x3085dad7a4a0ddb2
	.xword	0xcca6612624cb94a7
	.xword	0x01f919cd0d0a7314
	.xword	0x94e50c9b070cc754
	.xword	0xe9e6c8f5225e7eea
	.xword	0x09973a6b9703cade
	.xword	0xb3085596882e6c4e
	.xword	0xea3e3d3db1ee0cf1
	.xword	0x280a353fba24fe32
	.xword	0xdbe8c90b86430749
	.xword	0x31da271fb9afb851
	.xword	0xf0a78d4eefc04908
	.xword	0x3cc11a5442dd99f4
	.xword	0x172110aa106f2fb4
	.xword	0xd636a803da0f9e95
	.xword	0x2b5fb47d4fc7f199
	.xword	0x1942a750eb94d0ba
	.xword	0x2301a648bba9bd7a
	.xword	0x8e0635abeba81ec9
	.xword	0x504089c2e63af049
	.xword	0x862a58a962c4d351
	.xword	0x38c0acf14bb31091
	.xword	0xce55eb1fc0a1b6ac
	.xword	0xff89c08c2dd6e0bf
	.xword	0x84dffa48ff9202a7
	.xword	0xe944ebc7bcb5d2d7
	.xword	0xc5669e12217bbd34
	.xword	0x5d6b6d780e12547a
	.xword	0xf0918c5c20b86b3c
	.xword	0xcbd5917d9b86fe1d
	.xword	0x7ca14ffcd35422e9
	.xword	0x5f71be391657acc5
	.xword	0x392feb88d544ddd9
	.xword	0x7758d1b8382730ac
	.xword	0xfba74c18c3658cdd
	.xword	0x428fee5316a204e3
	.xword	0x41456784ebaf1fe3
	.xword	0x8f4e0e3969f57395
	.xword	0xc81ae89e5254cfa4
	.xword	0x5a480d3be13e2fb3
	.xword	0xefbc84f5f7456243
	.xword	0x56c420fa872cbbd2
	.xword	0x3ab25176b2f124dd
	.xword	0x3ada8f2216302b8e
	.xword	0xb4e7fb730f519df8
	.xword	0x13c8e833f0bd0ea8
	.xword	0x4b4ee74402fb7cd9
	.xword	0x0d1b08ca32263ffa
	.xword	0x9c2988318466b546
	.xword	0xcbc46267c94464f1
	.xword	0x7896f4eea6cc7f1d
	.xword	0x63f06b057f5b05f8
	.xword	0x8a5235cbd5b6a26e
	.xword	0x09d531ee2c230a63
	.xword	0x8de3261319990649
	.xword	0xda6689610aa16911
	.xword	0xf20e9255e5bdf93e
	.xword	0x36004cc627fde5b6
	.xword	0xb87b879402619f18
	.xword	0xd6bfafe5c107baf4
	.xword	0xbc9647ba5db74355
	.xword	0x5eb4a93915d46fe7
	.xword	0xb6fe24ac16340795
	.xword	0x0f4ff861d5835f66
	.xword	0xfb4f47ccbd8dcbb1
	.xword	0x9ac8bd05f24dd48a
	.xword	0x9ca1fb07ba7649f7
	.xword	0x0c1cc1cfd008e7fa
	.xword	0x33cd4af4cf329720
	.xword	0x152a8b9dcc0347a0
	.xword	0x81133033769e0cfd
	.xword	0xca595aebd85f6765
	.xword	0x9a24f570ac3d5f53
	.xword	0x68c20d05f862fb83
	.xword	0xe902b003c4560ad3
	.xword	0x8c0ab735ce352164
	.xword	0x3c88eec77e434198
	.xword	0x605f8fda66d6bf80
	.xword	0x93c87c88b1fe2805
	.xword	0xd13a028079a914a0
	.xword	0xc1c555d4dc5df628
	.xword	0xe5cef8fb8f7a724b
	.xword	0xc3edd2502209876e
	.xword	0x4550ed596b305e4a
	.xword	0xb49263aa4cf5a099
	.xword	0xc58a981ce8e8c3ca
	.xword	0xcdf49371a7db09ec
	.xword	0x00fb8be89e657a18
	.xword	0x0de68ef00f00c982
	.xword	0xa9be898a6f5b980a
	.xword	0xf489264a3104498c
	.xword	0xe4d5cc24382ca92f
	.xword	0x109b99751bf84135
	.xword	0x8f9bc6a74c6c9dc6
	.xword	0xd401aad0d96090c6
	.xword	0x39a7683cd85c50b1
	.xword	0x9e383ad803da14a3
	.xword	0x163dde0903f2ce66
	.xword	0xae161e18483c37bf
	.xword	0x992891206f3de336
	.xword	0x29d6fcfc15b9bc39
	.xword	0x614d60bf2371da13
	.xword	0xe60e9b92f1fa93e6
	.xword	0xdf5d4dac787d39b0
	.xword	0x5efb6af1ee4b0cf4
	.xword	0x1c9f25223c5416c9
	.xword	0xa90376474e41c9c3



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
	.xword	0x9ae012e4177f7b8f
	.xword	0x70b9503aaf79904a
	.xword	0xa6b0da944d8d8d4d
	.xword	0x70fc3740cb43bc6a
	.xword	0x1c8a80ab4e8035ae
	.xword	0xa8e1120be7c4f248
	.xword	0x62a56c0b037bc4c2
	.xword	0x8bd607b9074d43f0
	.xword	0x79f9d4e31a6b5f83
	.xword	0x8aff8f831e490b66
	.xword	0x00c4b21b91cb3acb
	.xword	0x2a81992236edf2c3
	.xword	0xae643ff5dfa36c0d
	.xword	0xe514d4fe9bf55efb
	.xword	0x8230b40a198b5ac9
	.xword	0x3135734fc6400f9b
	.xword	0x9452a75c13d35439
	.xword	0xb9fc1aad3dfad376
	.xword	0x64ea08be3ca6d44c
	.xword	0xbfebdd568938bab4
	.xword	0x425d1f1375bc3e7d
	.xword	0xca61d2ac9f6f1f2c
	.xword	0x87d4ca911d6a89fb
	.xword	0x816b837f22836ec8
	.xword	0x4bfb12398439aa4f
	.xword	0xd2ec94284f6766d0
	.xword	0xd838f8297a0e1800
	.xword	0xca83810e485d1947
	.xword	0xc28f024c7e247a1d
	.xword	0x10b4a222ccc8ac3a
	.xword	0x93a453d1413c69ee
	.xword	0x2763276b9fd06f80
	.xword	0xf222913085a38bda
	.xword	0x280710fac148d5d3
	.xword	0x98e2c338b4b0c49b
	.xword	0xbdd08ef4ca88557f
	.xword	0x195d7c1ca29b8b82
	.xword	0x0dd0a13a3ae39c47
	.xword	0x5bbdc334d081cf7a
	.xword	0x6fa84baae8c8ae44
	.xword	0x3dc615967f883664
	.xword	0x7a576a49ea5ecb95
	.xword	0xf1409ef1e9c51cf8
	.xword	0xae371c2bc8182656
	.xword	0xf916459c327def25
	.xword	0x9124de0306026cb4
	.xword	0xa2998a5f911a6f2b
	.xword	0xbb67fcf234343922
	.xword	0x66b8aec5880c0760
	.xword	0xdc812c943b010f3b
	.xword	0x841e857c28a4c9c0
	.xword	0x8746fa0a7ab5756f
	.xword	0x1372474e4ba022a0
	.xword	0x656d61bf521badcf
	.xword	0xa124be881d65fad1
	.xword	0x517445f53cf2f0f2
	.xword	0xdf7e10f8ac156c16
	.xword	0x062e722fcdb73734
	.xword	0x754401f28392e25f
	.xword	0x2a018963fb8d10b9
	.xword	0xc1a342149e289257
	.xword	0xe39916e3e55a6ddc
	.xword	0x6421c9ce13d41074
	.xword	0x1a9b9871c9e8357a
	.xword	0x8fdd017a44d3bf47
	.xword	0x412c2486b6ff2b98
	.xword	0xf78f6dba6b7d9911
	.xword	0x8f91ab68b5c0b893
	.xword	0xc5db0be340aef016
	.xword	0x8a9b558b9c595ff0
	.xword	0x64afb1b73d9a0da9
	.xword	0x72ae9b6079ca7856
	.xword	0xfb79befca3b04359
	.xword	0x21f23d1a7ed560bf
	.xword	0x24049072ef898dd0
	.xword	0xc2b30354d259b6f8
	.xword	0xfca2b913d949074c
	.xword	0x36df800b539df4e0
	.xword	0xf868c5d8dc9dd9d7
	.xword	0x8a48d393512f23f9
	.xword	0x1fd05c9d12a049e3
	.xword	0x6b6a7b4a81cdba03
	.xword	0xea08fd603f82d232
	.xword	0xc084c1f25a165de5
	.xword	0xda5385a5d52ff896
	.xword	0x496205198e0ede82
	.xword	0x36a2d9e78494ac70
	.xword	0xfc11d3d6457d54d1
	.xword	0xb2ee17df3f17c25f
	.xword	0x1ca55099a5afe158
	.xword	0x80dfff2ac3b24088
	.xword	0xa57fe8338818cc4a
	.xword	0x6dc3efc7dfc756a5
	.xword	0x7767125d43f1c8d3
	.xword	0xc99a745e7acb5fdd
	.xword	0x54bd6ca766209392
	.xword	0x1aef3853541aa89f
	.xword	0xe0f085a5465f41ee
	.xword	0xf948cb5dde71aed3
	.xword	0xd83f93bffae5f019
	.xword	0xb0cff128cf1dc6a3
	.xword	0x68bccc5085df1df3
	.xword	0x1869df4300dcb365
	.xword	0x35abf1f255d839ce
	.xword	0xc4b0e64e77047b9a
	.xword	0xd4d2e6e17fd1bb88
	.xword	0xd18f57aef952725f
	.xword	0xe7b810926c87787c
	.xword	0x34a67dbbea0c0a20
	.xword	0x5e6517dfd20dd413
	.xword	0xcad03b3fdb4dfcb6
	.xword	0x3a2c7a41e64bd596
	.xword	0xe582d873fcc23d68
	.xword	0x9a6edaef284ba8c1
	.xword	0xe22c07c2dbd94775
	.xword	0xf8e6f6567859add8
	.xword	0xf4a50533679d9a56
	.xword	0x8588c1505dba2287
	.xword	0x76a63894ef749434
	.xword	0x8fafa132da25d39e
	.xword	0x93a622dd6afcb749
	.xword	0x477900f5da5387d2
	.xword	0x268c66991506d4d0
	.xword	0xeef26e98d2a8fa20
	.xword	0x47034b85d1ca0850
	.xword	0x3edb460fe65bc204
	.xword	0xd0cd5935033b5bcb
	.xword	0x43c9d1af494335fa
	.xword	0x539879881dfde47f
	.xword	0x92f02b90e2f3b476
	.xword	0x025b935008e176fa
	.xword	0xd1620d6ad7d42cbb
	.xword	0x32e627404fef5672
	.xword	0x553f1e6d56c3980a
	.xword	0x69e0ae8e17bb1548
	.xword	0x57c8488518b82201
	.xword	0x76e8964710a10e91
	.xword	0xdeb8f9bda9be1b84
	.xword	0x051c9f2afc6df9ad
	.xword	0xa3ce04fbaac24302
	.xword	0x33ddf9109460ce39
	.xword	0x8c2aec20896c56b2
	.xword	0x92573d5cecf13990
	.xword	0xb783cb8db898fbc3
	.xword	0x8a7f5fa22c816d1a
	.xword	0x96d9af61e1314d9c
	.xword	0xc98bd8239d1151cb
	.xword	0xf0a439d6b64b3384
	.xword	0xeb9e91e1b22ef0a6
	.xword	0x4fa4ad8ced79acc7
	.xword	0x184a6956c93e299c
	.xword	0x9bc09e5b4a13f2a5
	.xword	0x58dd9f5703d3480f
	.xword	0xc493752348651ed3
	.xword	0x451968a201666bdb
	.xword	0xb5ed75a3d309900e
	.xword	0x3b36c7b092477f0b
	.xword	0x786005b1510e07cb
	.xword	0xd7183f730ebe62a0
	.xword	0xe90dc7f4a996726b
	.xword	0x6e080d7b37581f14
	.xword	0x01ee6a851982f355
	.xword	0x990a1ba13eb42624
	.xword	0x0f80e909a35ddb05
	.xword	0xf779d1b19579edce
	.xword	0x24f249107c490d12
	.xword	0x9d12ea7ced87b5e8
	.xword	0xd618f93becbdbcda
	.xword	0xd134193ba3e02792
	.xword	0xc967cd88ed649b0d
	.xword	0x50ee9c952c355ff5
	.xword	0xcbc1bfcc1da1c2c0
	.xword	0xcbc660256f88d282
	.xword	0x4e5083841c6125a8
	.xword	0x228875bd25c3764b
	.xword	0xd0d381ce347fcff7
	.xword	0x9e4353544c06052b
	.xword	0x22901f46bbab2f6a
	.xword	0xaa7c4cc94b215250
	.xword	0x8107b18a7293230a
	.xword	0x9125cf9e3c2ab41f
	.xword	0x7f193c40f8b60a96
	.xword	0x2a5f83e8e43fbbc7
	.xword	0x65997d9b3389f340
	.xword	0xe6f4ad447fbbf629
	.xword	0x51ba8bf0d76bde33
	.xword	0xcb3c81e4c7d7dd97
	.xword	0x7c06e48655fd2100
	.xword	0xa3ec92cf30171c79
	.xword	0x9b74509660e9f5b7
	.xword	0xce4a5536d1c02f27
	.xword	0xff7ff80c895430f1
	.xword	0x2fa9bd65d22f384a
	.xword	0x0501194ee75fb8dd
	.xword	0x7e8555934358c017
	.xword	0xd3a75ec35ad153a2
	.xword	0xbb9688969a1bd4e3
	.xword	0x68a884f9fc3c3f33
	.xword	0xab664a9ad51cfe54
	.xword	0x80481b77b500c609
	.xword	0xc850ab0b54a0f23a
	.xword	0x179b40e6b795cad0
	.xword	0x316721e17b6e9720
	.xword	0x71c6b2917fe896fe
	.xword	0xdeb56e91de336b7c
	.xword	0xd962d301dc2b03c5
	.xword	0x1a2a95820c74658d
	.xword	0xc593a671054f0633
	.xword	0x53f6de9a9374d323
	.xword	0x822a5ba45f3a1433
	.xword	0x8e5b0c58d858cfc3
	.xword	0xb8d140fc8161739f
	.xword	0x8c8ede1cbc7c5cc4
	.xword	0x575383f540a0e6d4
	.xword	0x1ee804900881b232
	.xword	0x7d53de61cf1d99d8
	.xword	0xc7f8e57b410acf6a
	.xword	0xfc16ca1c4b0dcf95
	.xword	0x7f65f97dd8cb041e
	.xword	0x0f7579a44e3096a6
	.xword	0x81681432a8b3df1e
	.xword	0xf43f820bb24942d6
	.xword	0xd635971c62801c68
	.xword	0x6fd9fda578cd297c
	.xword	0xb369e0a37ee4d916
	.xword	0x24a2b1481703eda8
	.xword	0xa33ea24244dacef2
	.xword	0xdf01a6f168443729
	.xword	0x83544551bb8256bc
	.xword	0x52757bf6401082a3
	.xword	0x21be01a2974a1d1d
	.xword	0x3e73e1bac45d02ea
	.xword	0x6b33995c80559928
	.xword	0x9221616a9167f109
	.xword	0xf691220ca9c0c13b
	.xword	0xd67ae567f1d0c2ac
	.xword	0x08bf65b28f403f63
	.xword	0x1940a9f7d4c7679d
	.xword	0xcacbd195c79d0c9c
	.xword	0xc0638bdf18fbb00c
	.xword	0xeb13fa99a2ded69c
	.xword	0xb9e105647f3a7ea0
	.xword	0xc3e0a9f6f4794ed3
	.xword	0xeda6479706f1e637
	.xword	0x08fd5c44a7d58dce
	.xword	0xfee7f2635feb0519
	.xword	0x22c5fc112519cea5
	.xword	0xdf8974ec0abfb2d2
	.xword	0x37d3c04fea7ae909
	.xword	0x9de8449be6c64e71
	.xword	0xd9a3e412880df106
	.xword	0x440f320a35deb453
	.xword	0xeca77c98f10ed3e8
	.xword	0x4d5015c6b1c6cee3
	.xword	0xd70d1165f739ec10
	.xword	0x1dd9c65e2b45acd7



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
