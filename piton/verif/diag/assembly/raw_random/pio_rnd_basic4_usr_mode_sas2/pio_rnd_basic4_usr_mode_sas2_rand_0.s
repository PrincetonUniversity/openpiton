// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_usr_mode_sas2_rand_0.s
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
   random seed:	336784934
   Jal pio_rnd_basic4_usr_mode_sas2.j:	
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
add 0x020, %g0, %g5
!setx 0x800e000000, %g1, %g3
stloop0:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop0
nop

! initalize
setx    user_data_start, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3
add 0x0, %g0, %g4
add 0x040, %g0, %g5
dstloop6:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne dstloop6
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

	setx 0x55d41fea2183d26a, %g1, %g0
	setx 0xe3ac11eb52c95bff, %g1, %g1
	setx 0x9e8892b87e93a9c4, %g1, %g2
	setx 0x5cfb203bfe5b071a, %g1, %g3
	setx 0x47d09ebd201d60f8, %g1, %g4
	setx 0x00892553ba09ed5f, %g1, %g5
	setx 0x7a467f51d16df963, %g1, %g6
	setx 0x2e506bae00c51749, %g1, %g7
	setx 0x4e978f3b1922ab37, %g1, %r16
	setx 0x2dc974e41788dd21, %g1, %r17
	setx 0x9ea29adf92930011, %g1, %r18
	setx 0xe9906805c39c8323, %g1, %r19
	setx 0xf324327c2fcccc83, %g1, %r20
	setx 0xd59ef778d78931d1, %g1, %r21
	setx 0x2c5effdd6d5e4b50, %g1, %r22
	setx 0xcfb805c3955a665c, %g1, %r23
	setx 0x12f5c2d0673a4250, %g1, %r24
	setx 0x484ed2ab02942c4d, %g1, %r25
	setx 0xc6495d7bfcf2f727, %g1, %r26
	setx 0x9ad1534e41e5bbeb, %g1, %r27
	setx 0xefb075438b383feb, %g1, %r28
	setx 0x632b288451fc70bc, %g1, %r29
	setx 0x44bce414eb6924b1, %g1, %r30
	setx 0x5f8dd0adc56dfa35, %g1, %r31
	save
	setx 0x6735990b34f1631c, %g1, %r16
	setx 0x0bb88532d7596381, %g1, %r17
	setx 0x47597a067cb86e62, %g1, %r18
	setx 0x2daf8d3bf117c445, %g1, %r19
	setx 0xa28bbb0b3dea9b0b, %g1, %r20
	setx 0x554b70ea29eaaf02, %g1, %r21
	setx 0x4482d754a659d7d7, %g1, %r22
	setx 0xed4b5beff6aae812, %g1, %r23
	setx 0x4a424b80f2c55b3e, %g1, %r24
	setx 0x763f4711e6a7027d, %g1, %r25
	setx 0xd286bb94bf835fbf, %g1, %r26
	setx 0x0a2a9982744e956b, %g1, %r27
	setx 0xc842c7fc01965c99, %g1, %r28
	setx 0x592e2da47b4278bd, %g1, %r29
	setx 0xda02d8095129e7ff, %g1, %r30
	setx 0xf97f8d6f077469e6, %g1, %r31
	save
	setx 0x65ea908a8ce117f8, %g1, %r16
	setx 0x5c2a7b9c34009388, %g1, %r17
	setx 0x06009043e54afedd, %g1, %r18
	setx 0xf5dbe07855fd92ef, %g1, %r19
	setx 0x2cf924ed569a69ff, %g1, %r20
	setx 0xca19bd8095f44c55, %g1, %r21
	setx 0x28fc856060a93e9d, %g1, %r22
	setx 0x92cb58436f32bd24, %g1, %r23
	setx 0xc9535506ce9e58bd, %g1, %r24
	setx 0xf636759a40eb7efe, %g1, %r25
	setx 0xe0a71ffa907dcc25, %g1, %r26
	setx 0x1693107267b631cf, %g1, %r27
	setx 0x178575b626d3a2f3, %g1, %r28
	setx 0x952719be4d967712, %g1, %r29
	setx 0x4f6d4a1aa9809686, %g1, %r30
	setx 0xde3749f44647421d, %g1, %r31
	restore
	mov	0, %r8
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d02ef100, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r9
	setx	0x00000000d04ef140, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef0c0, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02b4008  ! 3: STB_R	stb	%r16, [%r13 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec534008  ! 8: LDSH_R	ldsh	[%r13 + %r8], %r22
	.word 0xec732030  ! 9: STX_I	stx	%r22, [%r12 + 0x0030]
	.word 0xe0130008  ! 10: LDUH_R	lduh	[%r12 + %r8], %r16
	setx	0x00000000d08e10c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e1080, %r1, %r9
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d08e1100, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82aa028  ! 14: STB_I	stb	%r20, [%r10 + 0x0028]
	.word 0xe0298008  ! 15: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe8098008  ! 16: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xe83a6020  ! 17: STD_I	std	%r20, [%r9 + 0x0020]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe072a028  ! 19: STX_I	stx	%r16, [%r10 + 0x0028]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8124008  ! 24: LDUH_R	lduh	[%r9 + %r8], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe84ac008  ! 26: LDSB_R	ldsb	[%r11 + %r8], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02a6018  ! 28: STB_I	stb	%r16, [%r9 + 0x0018]
	.word 0xe042c008  ! 29: LDSW_R	ldsw	[%r11 + %r8], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4036018  ! 33: LDUW_I	lduw	[%r13 + 0x0018], %r18
	.word 0xe43b0008  ! 34: STD_R	std	%r18, [%r12 + %r8]
	.word 0xe01ac008  ! 36: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xe821e028  ! 37: STW_I	stw	%r20, [%r7 + 0x0028]
	.word 0xe8098008  ! 38: LDUB_R	ldub	[%r6 + %r8], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4234008  ! 41: STW_R	stw	%r18, [%r13 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe8526000  ! 44: LDSH_I	ldsh	[%r9 + 0x0000], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xe42a6038  ! 47: STB_I	stb	%r18, [%r9 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe449a028  ! 49: LDSB_I	ldsb	[%r6 + 0x0028], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec134008  ! 51: LDUH_R	lduh	[%r13 + %r8], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021e030  ! 54: STW_I	stw	%r16, [%r7 + 0x0030]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03a4008  ! 56: STD_R	std	%r16, [%r9 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4726028  ! 59: STX_I	stx	%r18, [%r9 + 0x0028]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0b2e020  ! 64: SUBCcc_I	orncc 	%r11, 0x0020, %r16
	.word 0xe0298008  ! 65: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe8318008  ! 66: STH_R	sth	%r20, [%r6 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec318008  ! 69: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xec2b6028  ! 70: STB_I	stb	%r22, [%r13 + 0x0028]
	.word 0xe811e000  ! 71: LDUH_I	lduh	[%r7 + 0x0000], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe83ac008  ! 74: STD_R	std	%r20, [%r11 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4534008  ! 77: LDSH_R	ldsh	[%r13 + %r8], %r18
	.word 0xec530008  ! 78: LDSH_R	ldsh	[%r12 + %r8], %r22
	.word 0xe4234008  ! 79: STW_R	stw	%r18, [%r13 + %r8]
	.word 0xe802c008  ! 80: LDUW_R	lduw	[%r11 + %r8], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe4424008  ! 82: LDSW_R	ldsw	[%r9 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0732008  ! 84: STX_I	stx	%r16, [%r12 + 0x0008]
	.word 0xe80ae020  ! 85: LDUB_I	ldub	[%r11 + 0x0020], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8598008  ! 87: LDX_R	ldx	[%r6 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1000, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e1080, %r1, %r9
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d08e1080, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	.word 0xe041e008  ! 90: LDSW_I	ldsw	[%r7 + 0x0008], %r16
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa439a000  ! 92: XNOR_I	xnor 	%r6, 0x0000, %r18
	.word 0xe821e030  ! 93: STW_I	stw	%r20, [%r7 + 0x0030]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0728008  ! 95: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe40ac008  ! 96: LDUB_R	ldub	[%r11 + %r8], %r18
	.word 0xe012a020  ! 97: LDUH_I	lduh	[%r10 + 0x0020], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec71c008  ! 99: STX_R	stx	%r22, [%r7 + %r8]
	.word 0xe8598008  ! 100: LDX_R	ldx	[%r6 + %r8], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec3b4008  ! 102: STD_R	std	%r22, [%r13 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0498008  ! 104: LDSB_R	ldsb	[%r6 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04b6018  ! 107: LDSB_I	ldsb	[%r13 + 0x0018], %r16
	.word 0xe0432020  ! 108: LDSW_I	ldsw	[%r12 + 0x0020], %r16
	.word 0xe0518008  ! 109: LDSH_R	ldsh	[%r6 + %r8], %r16
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xec02e000  ! 111: LDUW_I	lduw	[%r11 + 0x0000], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec0b2020  ! 113: LDUB_I	ldub	[%r12 + 0x0020], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0318008  ! 115: STH_R	sth	%r16, [%r6 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02aa038  ! 117: STB_I	stb	%r16, [%r10 + 0x0038]
	.word 0xe0336020  ! 118: STH_I	sth	%r16, [%r13 + 0x0020]
	.word 0xe831a020  ! 119: STH_I	sth	%r20, [%r6 + 0x0020]
	.word 0xe85a6028  ! 120: LDX_I	ldx	[%r9 + 0x0028], %r20
	.word 0xe43b0008  ! 121: STD_R	std	%r18, [%r12 + %r8]
	.word 0xe4024008  ! 122: LDUW_R	lduw	[%r9 + %r8], %r18
	.word 0xe4730008  ! 123: STX_R	stx	%r18, [%r12 + %r8]
	.word 0xe4736038  ! 124: STX_I	stx	%r18, [%r13 + 0x0038]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0526020  ! 126: LDSH_I	ldsh	[%r9 + 0x0020], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe822e030  ! 131: STW_I	stw	%r20, [%r11 + 0x0030]
	.word 0xe409c008  ! 132: LDUB_R	ldub	[%r7 + %r8], %r18
	.word 0xe8318008  ! 133: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xec09a010  ! 134: LDUB_I	ldub	[%r6 + 0x0010], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec3a4008  ! 136: STD_R	std	%r22, [%r9 + %r8]
	.word 0xe4734008  ! 137: STX_R	stx	%r18, [%r13 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe029e018  ! 140: STB_I	stb	%r16, [%r7 + 0x0018]
	.word 0xe449e028  ! 141: LDSB_I	ldsb	[%r7 + 0x0028], %r18
	.word 0xec09e028  ! 142: LDUB_I	ldub	[%r7 + 0x0028], %r22
	.word 0xe43a6010  ! 143: STD_I	std	%r18, [%r9 + 0x0010]
	.word 0xec324008  ! 144: STH_R	sth	%r22, [%r9 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe431c008  ! 149: STH_R	sth	%r18, [%r7 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec534008  ! 152: LDSH_R	ldsh	[%r13 + %r8], %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec198008  ! 154: LDD_R	ldd	[%r6 + %r8], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe471a018  ! 156: STX_I	stx	%r18, [%r6 + 0x0018]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04b6030  ! 158: LDSB_I	ldsb	[%r13 + 0x0030], %r16
	.word 0xe02b2028  ! 159: STB_I	stb	%r16, [%r12 + 0x0028]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe059a008  ! 163: LDX_I	ldx	[%r6 + 0x0008], %r16
	.word 0xec39c008  ! 164: STD_R	std	%r22, [%r7 + %r8]
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xac1ae038  ! 169: XOR_I	xor 	%r11, 0x0038, %r22
	.word 0xe03ae030  ! 170: STD_I	std	%r16, [%r11 + 0x0030]
	.word 0xe009e010  ! 171: LDUB_I	ldub	[%r7 + 0x0010], %r16
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e1040, %r1, %r9
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d08e1140, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0336028  ! 175: STH_I	sth	%r16, [%r13 + 0x0028]
	.word 0xe0030008  ! 176: LDUW_R	lduw	[%r12 + %r8], %r16
	.word 0xec29a010  ! 177: STB_I	stb	%r22, [%r6 + 0x0010]
	.word 0xe01aa010  ! 178: LDD_I	ldd	[%r10 + 0x0010], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec11a018  ! 180: LDUH_I	lduh	[%r6 + 0x0018], %r22
	.word 0xe432a000  ! 181: STH_I	sth	%r18, [%r10 + 0x0000]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4518008  ! 183: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xe039a028  ! 184: STD_I	std	%r16, [%r6 + 0x0028]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42a4008  ! 187: STB_R	stb	%r18, [%r9 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe4328008  ! 189: STH_R	sth	%r18, [%r10 + %r8]
	.word 0xec126020  ! 190: LDUH_I	lduh	[%r9 + 0x0020], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe409c008  ! 192: LDUB_R	ldub	[%r7 + %r8], %r18
	.word 0xec31c008  ! 193: STH_R	sth	%r22, [%r7 + %r8]
	.word 0xe832e038  ! 194: STH_I	sth	%r20, [%r11 + 0x0038]
	.word 0xe0518008  ! 195: LDSH_R	ldsh	[%r6 + %r8], %r16
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe851a020  ! 197: LDSH_I	ldsh	[%r6 + 0x0020], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8326038  ! 199: STH_I	sth	%r20, [%r9 + 0x0038]
	.word 0xe8730008  ! 200: STX_R	stx	%r20, [%r12 + %r8]
	.word 0xe43a6018  ! 201: STD_I	std	%r18, [%r9 + 0x0018]
	.word 0xe00a6038  ! 202: LDUB_I	ldub	[%r9 + 0x0038], %r16
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0330008  ! 204: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xe001c008  ! 205: LDUW_R	lduw	[%r7 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d02ef040, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d04ef0c0, %r1, %r9
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d06ef140, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	.word 0xe0224008  ! 208: STW_R	stw	%r16, [%r9 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xe03b6030  ! 213: STD_I	std	%r16, [%r13 + 0x0030]
	.word 0xe8730008  ! 214: STX_R	stx	%r20, [%r12 + %r8]
	.word 0xe459a038  ! 215: LDX_I	ldx	[%r6 + 0x0038], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe842e038  ! 217: LDSW_I	ldsw	[%r11 + 0x0038], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe8232038  ! 219: STW_I	stw	%r20, [%r12 + 0x0038]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe001a000  ! 221: LDUW_I	lduw	[%r6 + 0x0000], %r16
	.word 0xe451c008  ! 222: LDSH_R	ldsh	[%r7 + %r8], %r18
	.word 0xe0234008  ! 223: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe009a000  ! 225: LDUB_I	ldub	[%r6 + 0x0000], %r16
	.word 0xe032c008  ! 226: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe0336038  ! 227: STH_I	sth	%r16, [%r13 + 0x0038]
	.word 0xa40ac008  ! 228: AND_R	and 	%r11, %r8, %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe82a4008  ! 234: STB_R	stb	%r20, [%r9 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe02b6030  ! 236: STB_I	stb	%r16, [%r13 + 0x0030]
	.word 0xe402e018  ! 237: LDUW_I	lduw	[%r11 + 0x0018], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03ae000  ! 240: STD_I	std	%r16, [%r11 + 0x0000]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0334008  ! 242: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xe8398008  ! 243: STD_R	std	%r20, [%r6 + %r8]
	.word 0xa841e028  ! 244: ADDC_I	addc 	%r7, 0x0028, %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec718008  ! 247: STX_R	stx	%r22, [%r6 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0236010  ! 250: STW_I	stw	%r16, [%r13 + 0x0010]
	.word 0xe8536018  ! 251: LDSH_I	ldsh	[%r13 + 0x0018], %r20
	.word 0xe051c008  ! 252: LDSH_R	ldsh	[%r7 + %r8], %r16
	.word 0xe059e038  ! 253: LDX_I	ldx	[%r7 + 0x0038], %r16
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec39e010  ! 263: STD_I	std	%r22, [%r7 + 0x0010]
	.word 0xec4aa018  ! 265: LDSB_I	ldsb	[%r10 + 0x0018], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe801e008  ! 268: LDUW_I	lduw	[%r7 + 0x0008], %r20
	.word 0xe4030008  ! 269: LDUW_R	lduw	[%r12 + %r8], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec41c008  ! 272: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xe001a030  ! 273: LDUW_I	lduw	[%r6 + 0x0030], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa8ab2018  ! 275: ANDNcc_I	andncc 	%r12, 0x0018, %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe872e010  ! 278: STX_I	stx	%r20, [%r11 + 0x0010]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe421e030  ! 280: STW_I	stw	%r18, [%r7 + 0x0030]
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xe0318008  ! 283: STH_R	sth	%r16, [%r6 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe80aa008  ! 289: LDUB_I	ldub	[%r10 + 0x0008], %r20
	.word 0xe009c008  ! 290: LDUB_R	ldub	[%r7 + %r8], %r16
	.word 0xe43a8008  ! 291: STD_R	std	%r18, [%r10 + %r8]
	.word 0xe012c008  ! 292: LDUH_R	lduh	[%r11 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0532000  ! 294: LDSH_I	ldsh	[%r12 + 0x0000], %r16
	.word 0xec71a010  ! 295: STX_I	stx	%r22, [%r6 + 0x0010]
	.word 0xe01aa000  ! 296: LDD_I	ldd	[%r10 + 0x0000], %r16
	.word 0xec134008  ! 297: LDUH_R	lduh	[%r13 + %r8], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r9
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13



normal_end:
        ta      T_GOOD_TRAP

bad_end:
        ta      T_BAD_TRAP

user_text_end:

!***********************************************************************
!  Test case data start
!***********************************************************************

SECTION .UDATA1  DATA_VA=0xd08e0000

attr_data {
        Name = .UDATA1,
        VA=0xd08e0000,
        RA=0x010e000000,
        PA=0x010e000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global user_data_start
user_data_start:
        .skip 1000

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
	.xword	0x77b4a5ec0a410f92
	.xword	0x91c79e6e85797e2d
	.xword	0x9a0eeafda73ceb15
	.xword	0xaf63cbbbaca2f524
	.xword	0xc9b4bcb97e44b030
	.xword	0xfa799e87c08bbd0b
	.xword	0x44c00309300bdfc8
	.xword	0x60c5d6c014ff4839
	.xword	0x40e1860e03848cc6
	.xword	0x5f3c059cd7f59bee
	.xword	0x5d7256c91fcde735
	.xword	0xad3a3b39827aa2ec
	.xword	0x170b16a1103ef74e
	.xword	0x6fcdfbfc59841c6a
	.xword	0xa5b16fa4897acd34
	.xword	0xaedcba6ebedecd34
	.xword	0x3d99cbb5161d8b07
	.xword	0x2929be286d248c20
	.xword	0xfd3edb1d8dd2d6f4
	.xword	0x4b4a476ad0b95fe8
	.xword	0x6d9e7156fecbc35d
	.xword	0x2ce46334922e6e6e
	.xword	0x38854076d428597c
	.xword	0x093fd4725317435b
	.xword	0x8977f5967d54e252
	.xword	0x166bc2eca420cd01
	.xword	0x2f26215a633cbfba
	.xword	0xbe98fe250c31ba66
	.xword	0xf25155461ecdc5b4
	.xword	0x875eed16db584898
	.xword	0xc33d0c4bd6ad1b48
	.xword	0xd41beeef3ff9c659
	.xword	0x2f038c3d1d6a992b
	.xword	0x46555a020893ffd3
	.xword	0x1dc79a277e353dbf
	.xword	0x5b47ea9cf48e440a
	.xword	0x14c3fe637e784fd0
	.xword	0xe8dbba8c68f1a9d6
	.xword	0x945d367588dc03c9
	.xword	0x050d1c466b9c2aee
	.xword	0x29e7a353ca67d825
	.xword	0x18d1d2ae26c3045e
	.xword	0x229dded6b3dd4ce6
	.xword	0x9540b6c1e7867375
	.xword	0x2842981bc5055439
	.xword	0xf5faf25d8ba7970e
	.xword	0x07c457e44367cefc
	.xword	0x63be78a59b7a66d3
	.xword	0x19c43bb9c747aa59
	.xword	0xd5e428820cbc3f3a
	.xword	0x44d6473a21dce80e
	.xword	0x0c8810dc14143840
	.xword	0xf2e966796fdd4903
	.xword	0x94d705d8dd511686
	.xword	0x0990a46ffc5ac76a
	.xword	0x1d9147046bd17fc8
	.xword	0xb1fc6213b19253fb
	.xword	0x15be56725a43281b
	.xword	0x281a3799540b4772
	.xword	0x2ae38d01315b66e2
	.xword	0xef1459361e996906
	.xword	0x3a3220c5be7f5321
	.xword	0x9a1f4a5127a772b1
	.xword	0xd593cc5f918d3dbc
	.xword	0xbf849942240a21e1
	.xword	0xc6d8bf43ec9ffc6c
	.xword	0x93d861dfeb9951d3
	.xword	0x84d1e714c15e2ee6
	.xword	0x998b7c41bba221de
	.xword	0x1f72482c94e408fe
	.xword	0xa81abc0a83c552ed
	.xword	0x359f0cb4fcf2cb74
	.xword	0xb327f552783eb292
	.xword	0x937d088eb5713c69
	.xword	0x07dc8341f92df274
	.xword	0x2b270c132dd2224f
	.xword	0xd6dee38677a2accf
	.xword	0x3f67bd7d90e3f712
	.xword	0xf76ab98da73fddf7
	.xword	0xce992d4bfb1d8e05
	.xword	0x036c0a7821c6b1f4
	.xword	0x43444cf671e7293d
	.xword	0x66f384f48c34c0da
	.xword	0x305be803e8d4a139
	.xword	0xae6819baf3d52730
	.xword	0x7212a2c7df861f0b
	.xword	0x25e21e7118f77a60
	.xword	0x762001398d90a72e
	.xword	0x18c8da66a1a008b4
	.xword	0x39700b4c045d12df
	.xword	0xd575c780128dfb9d
	.xword	0x5ad3371d5d6cd8f7
	.xword	0x2fa490a7956c8da7
	.xword	0xa8e9dd687911bbeb
	.xword	0xb5f760296781f9b2
	.xword	0x0fb8545a737813d9
	.xword	0x0de567c6336cce0e
	.xword	0xe80b2c03d8ee8cab
	.xword	0x73d90d4a4c6a9b9f
	.xword	0x09423e5764573af5
	.xword	0xb33d3e6bbe5c414f
	.xword	0x3ab9ffaff6619f1c
	.xword	0x3d6a3f9ef5b8252a
	.xword	0x2b4743342ff19c03
	.xword	0x151b8407d84f3e17
	.xword	0xad03dbaebce3ba8e
	.xword	0x0a7d07b46c19caf3
	.xword	0x0c6f19e033ccdabc
	.xword	0x70757555ce32cb37
	.xword	0xfc8623d1782f5981
	.xword	0x4b325015d98053a0
	.xword	0x36c63949a63c1f24
	.xword	0x0f0d4f5a5051bee1
	.xword	0x42dcccea493551f5
	.xword	0xc3ee3412d24d9daa
	.xword	0x2537910e2f0affac
	.xword	0x7d6ed0f9b078b66a
	.xword	0x50f49489039320de
	.xword	0xcf4f583c4df19e1d
	.xword	0x21653fbe1acaa404
	.xword	0x53ba5ebdca2876a2
	.xword	0xa124dedbe1d5fd15
	.xword	0x567d9a3968464f03
	.xword	0x59133e0ad4c49a91
	.xword	0x097d5d4894d6cf31
	.xword	0x26e8ea0ddfc3ac08
	.xword	0xe0bb6636741c1e36
	.xword	0xd6ef79dabb22ff51
	.xword	0x400ae9baede83766
	.xword	0x3ff7d0f48bd270c8
	.xword	0x95ef6c42cc531f86
	.xword	0x705fb54db1c2bb6f
	.xword	0xa8d4741a58406877
	.xword	0x76a27d81b47a84d3
	.xword	0x6f47b1ff9d671101
	.xword	0x9a222a47a4b59620
	.xword	0x04220a124bc25631
	.xword	0x10a8a38069f4a5ab
	.xword	0x2db65eff8b2212b4
	.xword	0x2a9aa65805026db4
	.xword	0x6aec5424b5e6b5a5
	.xword	0xc3ab71094278dc7b
	.xword	0x2b23c5a49f94ef81
	.xword	0xf0ddc339f534c5d9
	.xword	0x59191df86e620e7f
	.xword	0x40a16a500fe388c9
	.xword	0x76206e07270d8359
	.xword	0x0623d4cbd201670e
	.xword	0x175935116e12d791
	.xword	0x0c2efe1eaf466922
	.xword	0xaa127aaeb8069453
	.xword	0xdb05c7071e913239
	.xword	0x59792bd49141ec53
	.xword	0x6ffc5242d554c629
	.xword	0x61103ae9c029a8cc
	.xword	0xe677d56331f9ebd3
	.xword	0x80ff98f86e4e4ffc
	.xword	0x3b4d53ae4b9309cc
	.xword	0x36a25c9bb52c2a52
	.xword	0x7e0e08babdf39c6c
	.xword	0xf23b9726939f520d
	.xword	0x7a44c7f54aa3ef72
	.xword	0xe2a2e870733388c4
	.xword	0xe6bffa738e2780e0
	.xword	0x8824f02eec8d548e
	.xword	0xe7142bf701977d8f
	.xword	0x9d42c0685fb855e8
	.xword	0x9580553c4701571a
	.xword	0x113ab7da767ed628
	.xword	0x87db1c76d180f3c3
	.xword	0xcab0b64122e28ace
	.xword	0x6b887e58dd00fa97
	.xword	0xd592db5ac0732ce9
	.xword	0x2937137f07a12b68
	.xword	0x2dc377e027e97f34
	.xword	0x0c9bbaf9827ae1e9
	.xword	0x28db7187983c7178
	.xword	0xfa611b5fe4fc5bc1
	.xword	0x77660a0721b13c04
	.xword	0xe2aa92e623f646ad
	.xword	0x6c4e8535cab48306
	.xword	0xa47a5dbbda915c2a
	.xword	0xae8e72b2ec6a3c20
	.xword	0x6fae36f982f8fa68
	.xword	0x88e1c5aaedd30bde
	.xword	0x761508b8fd2f66f4
	.xword	0xdf6bbe1b125d08c8
	.xword	0xfecd9f8edfbd03ff
	.xword	0x55798a6bc328167d
	.xword	0xb1cc5daef5dad4e9
	.xword	0xcdccdd71c9bde645
	.xword	0xb206024f28f9ee21
	.xword	0xaaf7bcebe04ab921
	.xword	0xf3f20eadcb5e77a3
	.xword	0x4a03f112bfba7652
	.xword	0x55a8be206fcd3504
	.xword	0xeae4ab1b7f51b227
	.xword	0x40ec7bbc26d3db71
	.xword	0x6a1bb9426e5be3c2
	.xword	0x107758c36eac9765
	.xword	0x7f1a1cd479bb8280
	.xword	0xd9257340e218a435
	.xword	0x45bbe85565c6c0f5
	.xword	0x0548a16a949764a2
	.xword	0x6a0624b16b37a283
	.xword	0x4bd71f082659b4de
	.xword	0x054d62fbbaed9a9f
	.xword	0x6de38910b75c4c7f
	.xword	0x36d7f47ac649bb58
	.xword	0xba88d4a5f961b151
	.xword	0x15b4a3b2c35db3bc
	.xword	0xd6b2302a145cf44e
	.xword	0xbccdaf1b04a2ef25
	.xword	0xa6b32ea5d6052407
	.xword	0xb7d3ba68e4034c5d
	.xword	0xf12a21855e33e958
	.xword	0x4ce5162762a86dc6
	.xword	0x44a0788406774570
	.xword	0xacf46cca6b769a7e
	.xword	0x2ef98a2af7bb3863
	.xword	0xcb84dd9e1c6cf412
	.xword	0xc7fb797767bb767e
	.xword	0x0a884508b19a6aa2
	.xword	0x4f1772927d7686db
	.xword	0x0bf040de3c62d7cb
	.xword	0x1f145fc45db2105b
	.xword	0xdc096c4abccae09b
	.xword	0xefd119db63c829d0
	.xword	0x26218beab6575d65
	.xword	0xa51828ed009788d0
	.xword	0xa9819e81e91d5543
	.xword	0x2918f97c7fb9b848
	.xword	0x313576f2572aec87
	.xword	0xdcf56cf0e13ff513
	.xword	0xe0ff5ee2767be680
	.xword	0x36badfaed886d1e4
	.xword	0xfd8ebbe3d4664723
	.xword	0xd047838713f26dd9
	.xword	0x67ff161afe3ebfb0
	.xword	0x33c5cb083e4b24cc
	.xword	0x74c5db91b4ce1298
	.xword	0xdc0323aca5ca11cb
	.xword	0xdb63b1382408769b
	.xword	0x2407ff095f245b52
	.xword	0x6a90cf69bba9d355
	.xword	0x2476db262393661f
	.xword	0x0cd34f8bb72b13de
	.xword	0xa3ed89f82dc3545e
	.xword	0x2f31d58ae0d9c5fc
	.xword	0xabc0069ee78013c8
	.xword	0x6318775fe3af663e
	.xword	0xa21db0c46091725d
	.xword	0x2efad7c40654ca90
	.xword	0x0114a60adb2f6878
	.xword	0xab049ca50eedbb05
	.xword	0x029df079fd02f61c



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
	.xword	0xe74f9ebf0c31d1d2
	.xword	0x3e057e4e1b020698
	.xword	0x5b39ed3f39160d78
	.xword	0xa99518b26cd16759
	.xword	0x1f72719dfcad390f
	.xword	0xabeec51ad3516957
	.xword	0x709a7d25f15ed6ec
	.xword	0x33eada791aafc424
	.xword	0x24d78d536842828b
	.xword	0x1a7f6521d7a4da5c
	.xword	0x3c0dccfa23a56fd4
	.xword	0xc3f3db191c594341
	.xword	0xb8a7a1c879727b3a
	.xword	0x804dda89799a0043
	.xword	0x6cb3621ba3bea1ca
	.xword	0x5a333f10f91ff48b
	.xword	0xedde977fc1858274
	.xword	0x96508637ee0d23f9
	.xword	0xf852e5d83f29613e
	.xword	0xabd9a674de9f8571
	.xword	0x2bc8c78487f90820
	.xword	0xc079caecc624dc25
	.xword	0x5bf77b5acf7601a5
	.xword	0xfd36e08d4325a650
	.xword	0x7ef2b8fbeae1cfa8
	.xword	0xfd85e711ebe8870b
	.xword	0x979afbf029a9d496
	.xword	0xb48a83b749366fe9
	.xword	0xfb333152c2f42430
	.xword	0x4a52d0a1ae9062ba
	.xword	0xcf18b3831e8e9f09
	.xword	0x5063b720189223f6
	.xword	0x6d0cd032c8ec4b5b
	.xword	0x4e654b64af99dfde
	.xword	0x843ebd18248ae783
	.xword	0x71285d53556f144e
	.xword	0xa300b17efbb69e4d
	.xword	0xf822c240f82239fe
	.xword	0x6b9cf8e9381bfac1
	.xword	0x9cc7d0235f462cfd
	.xword	0x1fc7e05e942a5461
	.xword	0xed5a13a1ff2ec1d6
	.xword	0xa89001481fa1ead9
	.xword	0xfb6256f5e7021659
	.xword	0xa124de9d2434add1
	.xword	0xa6572b88df7daa1a
	.xword	0xef050b6dac093ebd
	.xword	0xd68da0c17699baca
	.xword	0xd2000bf974bddfb7
	.xword	0xee6c6aac4105f5a1
	.xword	0xaeaecbf9119a4098
	.xword	0xfdc9c1c783f8d8e7
	.xword	0x4de0cf90e466fd9c
	.xword	0x1d939e3e7e0617fc
	.xword	0xa48e6569aaab9a6c
	.xword	0xfb571f606ed9b137
	.xword	0xf6b3c300c6f9214b
	.xword	0x33026d6c14c13aa4
	.xword	0x2c668a332d37854c
	.xword	0xd042c295fc80edb0
	.xword	0x941d61ee63a22723
	.xword	0x0747bb111b0b322d
	.xword	0xc9b848cbdf4d5498
	.xword	0x22c1f18363bffac8
	.xword	0xa75363d8f90e364b
	.xword	0x33939ebecb42500c
	.xword	0xdeea51a6001abf00
	.xword	0xc10bc44dc3d0a8df
	.xword	0x4645adf727e9b79f
	.xword	0x4d26d4644280c6d6
	.xword	0x7fcddeaa06323702
	.xword	0xb0bd216d5badcb6a
	.xword	0x99d7d89f3cfcec28
	.xword	0xc2bee254297dcd03
	.xword	0xf112611beb6b8fd8
	.xword	0x50cb07d6c1a9fcd4
	.xword	0x774296ee0bcceb07
	.xword	0xb64254f44a469b03
	.xword	0x14bb28f0de2c4610
	.xword	0xd4d412d587be9ad6
	.xword	0xc4d85984a2b7fbe9
	.xword	0xc4ee8fca7cbdbe31
	.xword	0x4d617a70f25e8633
	.xword	0xd7653e32cc5b7295
	.xword	0xeab7ac040bf6961c
	.xword	0x030105f53c46ed96
	.xword	0xb7ad8aec2ad78125
	.xword	0x817345c03999f26a
	.xword	0x1c57b545de591d3c
	.xword	0x8e0ae305f9d0db2b
	.xword	0x3b402a4f7c48399d
	.xword	0x8a77ecbc56241f8e
	.xword	0x8635c8bf67cf5b8c
	.xword	0x850c21ec1b22d563
	.xword	0xf35f1012c7bf5775
	.xword	0x09d215080b424355
	.xword	0xe677698e22fd8b02
	.xword	0xfd1100b1140b3c69
	.xword	0xb2515fc3021f3f8c
	.xword	0xe8f6f388074e7ff0
	.xword	0x34ed81e03c5d191b
	.xword	0x6305a49ae0cab88d
	.xword	0xedf83f4a151a701d
	.xword	0xb6e8655b7d4d364a
	.xword	0x7c717f53967d4af6
	.xword	0x847dd6e984467a67
	.xword	0x952f0fdb1e1aebb9
	.xword	0xb2351fdf93fb2652
	.xword	0xf4be528add1aee3a
	.xword	0x16235b54fe74cbca
	.xword	0x832ab2964790a2ce
	.xword	0x41eea8f77ff1dc37
	.xword	0x2141578668c8baee
	.xword	0x7cf220854a8ff043
	.xword	0x348a3d1d446489e6
	.xword	0x4ce7069cefa6bd4e
	.xword	0x1b1bbb28b1911884
	.xword	0x15b34e1c37b71dd7
	.xword	0xa190842e63f3ab1d
	.xword	0x6c6f8d6c438c416b
	.xword	0x9159e6c8be4eee4a
	.xword	0xa980f0e1bb6a8b21
	.xword	0x90793afc6784cc96
	.xword	0x21498a6939455a67
	.xword	0x477c84708e57d5f8
	.xword	0x446715e37e126b11
	.xword	0xe52d8cb86e8ec983
	.xword	0x830b8b53b1fd2f28
	.xword	0x7223bb165531129d
	.xword	0x71a577ffef28368e
	.xword	0x88f8d47e792cf988
	.xword	0xcbde53b67249a007
	.xword	0x08f0de39ab217231
	.xword	0x7720598d53720c28
	.xword	0xdf4888e96ac50614
	.xword	0xa1f9426660c92d4a
	.xword	0x01e632e5abbb24f9
	.xword	0x5e1dd28b56d654b7
	.xword	0x4d7b98e4151fecf1
	.xword	0xa4255b0abe34501b
	.xword	0xaca73fe382de0c61
	.xword	0x13e8d03b868bf4bd
	.xword	0x08524783a4af628c
	.xword	0x3e5b03a3fd1113a5
	.xword	0xa7235a7ae7d63d49
	.xword	0xdf0ce2acd977925b
	.xword	0x011a31aaff775e07
	.xword	0x14b1743fbe73b15d
	.xword	0xb225ab8e8efd77fa
	.xword	0xc93b31466f509c3d
	.xword	0x99310826809a99b9
	.xword	0xa48520009f1f6f21
	.xword	0xc3cb8a331ecab130
	.xword	0x4a5f83bac3939079
	.xword	0x505514ca6a29e457
	.xword	0x79c06049b79a7958
	.xword	0x73aae042e958c0cb
	.xword	0x8156535a6e725795
	.xword	0x2eef0fdd1a8e0003
	.xword	0x0f130d994aaa510c
	.xword	0x72dc2252de3427df
	.xword	0x94f51c160a8b7e4b
	.xword	0x864a3f12136a13a8
	.xword	0x900857acd6d75c54
	.xword	0xd720b83354b0858d
	.xword	0xab3940f291067c48
	.xword	0xbdade36ef1e8cff3
	.xword	0x663ed8d9f0848740
	.xword	0xca67d063c29fb3f8
	.xword	0x79a206332beaf152
	.xword	0x4132d3b62139f4f8
	.xword	0x48f2e47a7d5e903a
	.xword	0xd99c1c5a8e0bed68
	.xword	0x8da973a78411e152
	.xword	0x0f88d1d815e7e32a
	.xword	0xe23850d67e02bba6
	.xword	0x192da4dc796ccfa4
	.xword	0xefb0aa9f350ae23b
	.xword	0x9c84cb3770a56ef1
	.xword	0x365d626ebcfcce8c
	.xword	0x8acff787cd72daf0
	.xword	0x8e31bf3bb583ed40
	.xword	0xf19795d248269950
	.xword	0x1f392f81f3e1cc66
	.xword	0x3fd0fde7c2d1bdca
	.xword	0x00b873364f708060
	.xword	0xda9829014a9e2ee4
	.xword	0x55ac751576a625d0
	.xword	0x157f5a4d50e66671
	.xword	0xe9c4f6a74dd3844a
	.xword	0x0b42061b6be78488
	.xword	0x515b045fe50f8e02
	.xword	0xd2996d5e141beb17
	.xword	0x452aa1dbd15bcb89
	.xword	0xf82686aa93c192ca
	.xword	0x9b6c4aa2b3160e4f
	.xword	0xc0e1b379da48139a
	.xword	0xba33b39f4e141c9f
	.xword	0x1ee3148dde1cd964
	.xword	0x1cd60bd5bd05cff4
	.xword	0xbc1e5f285a9ecdeb
	.xword	0xafe160d422baf353
	.xword	0x7dc2e1481daa4360
	.xword	0x74513d62d3f34822
	.xword	0x3d4a6cc79b758a72
	.xword	0x02ffc6e5a9548af7
	.xword	0xa87de9984d15d8eb
	.xword	0x5623a36ed4439faf
	.xword	0x40a437eb463ee1bc
	.xword	0x7b3ac0d217d31a89
	.xword	0x62f77098dc743041
	.xword	0xdb7b2613043eb686
	.xword	0x4d3ca68d6f8fe443
	.xword	0x95a263c3ba8b2e6a
	.xword	0x8be89f27ef47ae57
	.xword	0x7e9a0aa945b31e57
	.xword	0x2f6f94edd1b31376
	.xword	0xdce8502ce17f7c53
	.xword	0x50cf8fe528e67cd7
	.xword	0xc644b6c40bcab513
	.xword	0xb3bfca9030edd6e3
	.xword	0x10087e42043bb2ed
	.xword	0xcfde7996f175a845
	.xword	0x7a4162d112054986
	.xword	0x4da7219c5b2bc332
	.xword	0xf342f607cc5bf5cf
	.xword	0xba8f33798cde3699
	.xword	0x833bf2102cfd0884
	.xword	0xef0e9cf17f1ba280
	.xword	0x2b1ffdc8419afd56
	.xword	0x18fda4be0a3d3a57
	.xword	0x319e79f453fb31c9
	.xword	0x658da53ed8e46ce7
	.xword	0xae2ae7198b2a0d9f
	.xword	0x1f2c613355aa7e84
	.xword	0xf55320e73f01191b
	.xword	0xfee698853610a697
	.xword	0xca7acb342b0504a8
	.xword	0x0779004d6b694d07
	.xword	0x36e78150ae2fb88f
	.xword	0xf1a20da8954bde04
	.xword	0xd85952efc6057787
	.xword	0xc15579febfa99787
	.xword	0xfc505a95d76a2802
	.xword	0x01cd48137c4c94de
	.xword	0x45fe9e0534f86627
	.xword	0xd9b3614dade8fc19
	.xword	0xab03d7ccf3bef543
	.xword	0x601f3d8b431fa195
	.xword	0x655cba44060c099d
	.xword	0x5ee27852151eba15
	.xword	0xcc90513634766f0a
	.xword	0x369720b4bea7563a
	.xword	0x40761d45c427664b
	.xword	0x07ed6c237bc0054d
	.xword	0xed99d3a5cb8f1ddf



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
	.xword	0x3fbb0df255112816
	.xword	0xa3136880a7ecde9e
	.xword	0x69075b33439a3053
	.xword	0x271be0f8cf13b122
	.xword	0xaf25b189b6cdcfae
	.xword	0x2195740c9a310d35
	.xword	0x5e54e65ef3d00786
	.xword	0x95092a7ff7eede52
	.xword	0xc3bf47335198279b
	.xword	0xa12afbdd99b3eb7f
	.xword	0xff01a87abd8f852f
	.xword	0xc408e72acdd82f2d
	.xword	0xe244f5aa1ea77394
	.xword	0xcdb210c12064bbc2
	.xword	0x6c81834fc94c0c6f
	.xword	0x9f45e1a440714d72
	.xword	0xbdb3421a6e0ae746
	.xword	0xad4603f667384da0
	.xword	0xf4ccada10aaccfa2
	.xword	0x42e148b72bf7f89f
	.xword	0xbc84dfe9d8cf3d2a
	.xword	0xa855bb7091783928
	.xword	0xfc3e6d3add6bbbdc
	.xword	0xd440b76ab59c3fd6
	.xword	0x09bf9f3797bf6f0a
	.xword	0x90005fb799d3f190
	.xword	0x22c0833583ceb65c
	.xword	0xad3c626a884198d6
	.xword	0xf09a09afcd01cf6b
	.xword	0x86daec66c9e78f4f
	.xword	0x108cbff3ff224801
	.xword	0x3ea05574424d1cb4
	.xword	0xa884f79edc7b06de
	.xword	0x6840d52c1404e1a1
	.xword	0x5a3c5f79dd83e281
	.xword	0xf472ebcc21c1e67d
	.xword	0xb8b3fb18da76d7a8
	.xword	0xa8b604809c47204f
	.xword	0xf6310b417ae3379d
	.xword	0x3d52b1b000ff56dc
	.xword	0x63724bbc91ad4886
	.xword	0xcbd55089d21af26e
	.xword	0x727442d0f7b5dfbb
	.xword	0xf5173d464d74962b
	.xword	0x6e36b93dd97a8160
	.xword	0xbe17a8790eadae8c
	.xword	0xcda02a7f9f5c9b18
	.xword	0xd212bf3b835f2c47
	.xword	0x3aa736f3e73f3b74
	.xword	0xb0757280625df207
	.xword	0xd929d1693a36efb8
	.xword	0x836abb534122f273
	.xword	0x06f2541b6134946b
	.xword	0x0b06a23f7af28b79
	.xword	0x0fd3129079624ea2
	.xword	0xeb7eb20975542e15
	.xword	0xc5a65c3acf2ef1c1
	.xword	0x7bd7c64c392237c3
	.xword	0xc6836e8fab480142
	.xword	0x15b2d3d80c8b9c32
	.xword	0x7c325009c33361ce
	.xword	0xdfbaed9a55fa8f00
	.xword	0x2ee0daefc52245f7
	.xword	0x9cfe54cc443a5f5c
	.xword	0xaf59fb1815ae49d7
	.xword	0x20bd4276bf60c83a
	.xword	0xabe782fb6915b723
	.xword	0xdae0d4f2b7d0e54f
	.xword	0x4689151434f5c4a6
	.xword	0xaa9b41d2cb0a07d7
	.xword	0xf92a918db523ae8d
	.xword	0x437c4c18486e3ab3
	.xword	0xc5840baf3cfad4f9
	.xword	0xe7fcf8a16e97aef0
	.xword	0x0e5bc79a585f1397
	.xword	0x0120a718842a5481
	.xword	0xc8cdebc9640dc7c7
	.xword	0xe8606a3be516fa11
	.xword	0xcdd5128a3fa4c614
	.xword	0xfa10e6b2c0ec174e
	.xword	0x573aac7accc8ede9
	.xword	0x6df930129e434338
	.xword	0x23207bad48dba5f6
	.xword	0x89b7d338e7ff7700
	.xword	0x3c4d3bfd5bb388f4
	.xword	0x5d53def1d606980f
	.xword	0x841107efa7eb6ee6
	.xword	0xf2a338ce2078405a
	.xword	0xa0f702f7b3527c4c
	.xword	0xc770ff5cf6a0eedf
	.xword	0x6e19372611a50e20
	.xword	0x6950fe346418fa34
	.xword	0x3eb5e8f6459fd11d
	.xword	0x7f6c02ae94ae3769
	.xword	0x37e8882f761b3af3
	.xword	0x3b69d160773683d2
	.xword	0x5e3faad9761c1246
	.xword	0xb3d2fff87e1c06f5
	.xword	0x2dd5e0c44326cb23
	.xword	0x0dec5eeccb547d52
	.xword	0x322676f145c384a5
	.xword	0x0fc223505060805e
	.xword	0x1b9fbbec059815c8
	.xword	0xd0c0252be05b4f58
	.xword	0xb38a16c3327e4a5a
	.xword	0x0d860476085afd57
	.xword	0x48acdffbd11468a0
	.xword	0xe42e02c2576172b6
	.xword	0xd7718e637ef6acf2
	.xword	0x761d35cdab1cb028
	.xword	0x63eefed75798893c
	.xword	0xf369deee7ff95e98
	.xword	0x3aa38efd7ed4a3cc
	.xword	0x010eb2c5397b764c
	.xword	0xd34ec7f6afd065d8
	.xword	0x80de181075109009
	.xword	0x209e40d6a27c50f3
	.xword	0x49dd78ca02590a2d
	.xword	0xd9d2be0556309ba2
	.xword	0xabdd5f0ab068783e
	.xword	0x07eb8ef04f864d1c
	.xword	0x2d076cca6795e24e
	.xword	0x645def0d7cd89dc7
	.xword	0x68a86cb15370c2d8
	.xword	0x2a58b09c5088dd52
	.xword	0x0d6fa124d31a288f
	.xword	0xd397aa0f23a3d14a
	.xword	0xb7d4943a10189981
	.xword	0x077708c70393e565
	.xword	0x059b57a2ff865bbc
	.xword	0xb83e8b75f72ad053
	.xword	0xc457a84fe98c06a8
	.xword	0x9e08bab2d6c3fec0
	.xword	0x86641ee46d063fdd
	.xword	0xac48813503eb3cde
	.xword	0x2449bd91333a16c4
	.xword	0x01ebf055843f2c4e
	.xword	0x26221e3b8d4fc9ac
	.xword	0x86dbc58a9f53081e
	.xword	0x0af14ea70ba48f58
	.xword	0x015f8dccef06a242
	.xword	0xb4483bb13ce2408b
	.xword	0xfe5bea47fabe40a9
	.xword	0x27350d15c5ffbf95
	.xword	0x7f2613cdeceaeefe
	.xword	0xf659235feda25631
	.xword	0x226536c108420a14
	.xword	0x64acb39e1bfea833
	.xword	0x11ec84cc359975fe
	.xword	0x5749a4b10b6b2c29
	.xword	0x9c7bf45e17d01111
	.xword	0xad5ec287c8f82607
	.xword	0x16578b7a83c78424
	.xword	0x43cbd8f29a6738e5
	.xword	0x40f87d21cbddad5e
	.xword	0x8374335278e6e08e
	.xword	0x013cec0fcd780262
	.xword	0xfcf92c28d9ed52f0
	.xword	0x8a631557f7c444e6
	.xword	0x98e17a80930f81ec
	.xword	0x1fa5cdddf6b7a231
	.xword	0xef47d74ac38fcb4a
	.xword	0x1f8e470f69930f0e
	.xword	0x9bb61875f5e0849a
	.xword	0x2a3d779593278d0a
	.xword	0x9dabef9169ee99d2
	.xword	0x7f5ee6741a96e362
	.xword	0x681757ddd31e2d85
	.xword	0x0eb99ce661596090
	.xword	0x98f8be1ad4276beb
	.xword	0x9ad779a9fa8d72e0
	.xword	0x3b59a6bd7e527ed2
	.xword	0x7b43f437d84f0129
	.xword	0x198b14abfc02d764
	.xword	0x778e69a8560aad22
	.xword	0x1bb4bdba67ae2b39
	.xword	0x5b3232ae2159c969
	.xword	0xbca8670f7ddd88c8
	.xword	0x640a6a3cc849d411
	.xword	0x84154ca153234fec
	.xword	0x952444b9b0241fd2
	.xword	0xc21d6dd258618fd5
	.xword	0x69507fde100c2bdb
	.xword	0x33fa9bbf05320dfb
	.xword	0xb5a2a71b404a3a54
	.xword	0x12b8b15ac31faa88
	.xword	0x083242bac90fd209
	.xword	0xeef62d4b3d49a29a
	.xword	0x9cdb81bcd738f206
	.xword	0x82f6e5c22354aa71
	.xword	0xc924e6183c99560e
	.xword	0x12b2c80961754d0e
	.xword	0x68f28dcd82d678c6
	.xword	0x5437f69a2638dce7
	.xword	0x6167dbdc30d73705
	.xword	0xbd5e59980c5890b8
	.xword	0x6418252bfce324d9
	.xword	0x0afd0e2cb908fc6d
	.xword	0x88deef51d7d33a86
	.xword	0x5b485e4a8eddf72c
	.xword	0x51761fa10635aeda
	.xword	0xa32cfb44fa0b2d59
	.xword	0x038275334f2292d6
	.xword	0xc6073d1ce79d4c0a
	.xword	0x13b1efabe8e31087
	.xword	0xddc0109e4a9c8792
	.xword	0x8fdf2865aa9b326e
	.xword	0xfa70c93714646354
	.xword	0x717b30a8e7bd858e
	.xword	0x23cfe80ec15bcba5
	.xword	0x5d124646beab0f86
	.xword	0x5aaa265316af103e
	.xword	0x57368c1cd801be39
	.xword	0x00f7a8017448f8c5
	.xword	0x5f30ef64495494ee
	.xword	0xd6c5c70e057fce3e
	.xword	0xb66574b4ea460971
	.xword	0x586be3ad8b62660d
	.xword	0x5f47665f3db56545
	.xword	0x6b1a6428e41db699
	.xword	0xa70b4f2509bc9bfc
	.xword	0xb8df42e830d5890c
	.xword	0x99e13be5a81cea6e
	.xword	0x02b9a49f21d17981
	.xword	0x41709ae4e04addf8
	.xword	0x7345c3652b2d3053
	.xword	0x949395ec042903f8
	.xword	0xeba51ff7d90af1a3
	.xword	0x0277aec418348c07
	.xword	0xbc5f8218ee60845d
	.xword	0x7f093c56f69cce3d
	.xword	0x4b3605dd571c58e3
	.xword	0x59af48e42800f999
	.xword	0xf436c4a4357fbd08
	.xword	0x0831ee42c37e0bd5
	.xword	0x3a51cfd9208d2946
	.xword	0x838462ebf4b39eab
	.xword	0x8b2bc379ab12d1a3
	.xword	0x41b0b4fbbd0bdd01
	.xword	0x6175b250937500e7
	.xword	0x3bea767036e6ce0c
	.xword	0x6434fec9a37576a7
	.xword	0xa23fe80f365a952d
	.xword	0x1fe81062b5deb3d9
	.xword	0x69a4aadc31d35e64
	.xword	0x023bca2a35c63789
	.xword	0x10b9e0e14af24080
	.xword	0x65982ea02af73517
	.xword	0x1016a8b675b79dc9
	.xword	0x57e40266c6f3efde
	.xword	0x6ca780dc08d79090
	.xword	0x8f05e19ce3044aa8
	.xword	0x342545b3f2c1cb80
	.xword	0xa44c3855357137d0
	.xword	0x8fca1e3a3f67d3b6
	.xword	0x559dfd1fbfc26afc



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
	.xword	0x4417bc2f6ddd3b1a
	.xword	0x27cb8e7be87d718c
	.xword	0x1e6d82cbf83ddb5f
	.xword	0xa6662690bd1af72f
	.xword	0x9f3779927ec704e7
	.xword	0xc4def3115151a822
	.xword	0x1673bf462d3aefc7
	.xword	0x7fb454cd5017dcba
	.xword	0x4aaa49217d1fd1ba
	.xword	0xa640d8f5589284d5
	.xword	0x07473c4be088331d
	.xword	0x257ff32039fbee9d
	.xword	0xb832ff5d311e136c
	.xword	0xc6b5b6f50eab0e1c
	.xword	0x21759bb079861c9c
	.xword	0x101bf31e79706c4c
	.xword	0x4c2324d3ddeed6da
	.xword	0xe294f690eb0898e1
	.xword	0x092158e102c0ea5f
	.xword	0xcf80dcb8d77514d5
	.xword	0xc05dfca0a65a98b4
	.xword	0x78644ad4ba832ab9
	.xword	0xabace62eea6c8fdc
	.xword	0x1955394f2df7f1d1
	.xword	0x194b6b9ed317e58c
	.xword	0x893e94aa56438230
	.xword	0x84aa5a8dcb4f68bc
	.xword	0x5109f012227929dc
	.xword	0x233b95c2f47ba6a6
	.xword	0x871e2fb31bcf6744
	.xword	0xc754cbfe462f64a4
	.xword	0xbdd8a6bb27bf1e90
	.xword	0x430742c3ebca315b
	.xword	0x2069b6070c3e0c03
	.xword	0x5a8d098eadc76166
	.xword	0xc9b9662fabc4aa8a
	.xword	0x603551ec6973d932
	.xword	0xee045b14742aece6
	.xword	0x3356b55f3329caed
	.xword	0xd970bea797b9ea01
	.xword	0x9f2127d93e388d85
	.xword	0xb3e023caae2f4e90
	.xword	0x27e7916f385da8a7
	.xword	0xf08c3f5e8df291e7
	.xword	0xf60ef961dbddd357
	.xword	0x508103de7957e3cc
	.xword	0xd14fc291026a5814
	.xword	0x6529fdecc946a057
	.xword	0xb5e1acd73d324a3c
	.xword	0x3820bf26c4ed7d2c
	.xword	0x78f7d877182125b8
	.xword	0xfaf55315a79ca27d
	.xword	0xfe0865bedb84b266
	.xword	0xfc16a1b02f887598
	.xword	0xf0c65ecd3afd1eb1
	.xword	0x14a48c2e14dcfb9d
	.xword	0x1731271487494a3f
	.xword	0x1d94b6db7c4236b1
	.xword	0xeee9dd694be20c8d
	.xword	0x1b2f2da611217ef2
	.xword	0xe114bcf89373d550
	.xword	0xe94656d427863461
	.xword	0xbcc7e386dfffd9fa
	.xword	0xc688273bf0c106ac
	.xword	0xef5da82e33981ad4
	.xword	0x5fa968ae3a87103a
	.xword	0x86249a64d5a7876f
	.xword	0xd327128cc168ce16
	.xword	0xff0dd8ca1f96e076
	.xword	0xd3673439242e0d59
	.xword	0xe2a90bbd6c09cffc
	.xword	0x5e5b13a23488ea27
	.xword	0x88d7db2636142223
	.xword	0xe2068ca6f94feccf
	.xword	0x7fd22420c8632c07
	.xword	0x9193a55072a68b8c
	.xword	0x6b293eb47822b23f
	.xword	0xefe1abd53d5fd6fe
	.xword	0xb4e6f6fb794456a1
	.xword	0x90a527dff9631776
	.xword	0xa8b63bd2292689ed
	.xword	0x595cd92a8181d8f2
	.xword	0x10da7a42147099b1
	.xword	0x2e66c13b79d74ae5
	.xword	0x9711167c81ca3047
	.xword	0x4681266d732abd8f
	.xword	0x9743f021917f2644
	.xword	0xdcf161211f05ecb8
	.xword	0xa1f42022947a104c
	.xword	0x0d29088d08d34c62
	.xword	0x7bde1178a7e548e7
	.xword	0xa7f6c87e918b5105
	.xword	0x692ab6dea3c5cda5
	.xword	0xcdff6252519cb863
	.xword	0xf8f64ec6de7978b1
	.xword	0x81f1697cc34e46fd
	.xword	0x07f882bce698e8ed
	.xword	0x56fe198da4144b86
	.xword	0xde9bfc01eb22cf67
	.xword	0x60f0759882c59458
	.xword	0x3048f8192bdbafb8
	.xword	0x8f70e43c97cb74ec
	.xword	0xaa17c69296ba9d92
	.xword	0x883f18de3d69c585
	.xword	0x2a3360b65942a6ee
	.xword	0xe395504263a4496b
	.xword	0x8e0322ad4fce7426
	.xword	0xa1485d82441b295e
	.xword	0x176e5ae77c3acbb9
	.xword	0x1778df639a24aca5
	.xword	0x93170f60b20e9594
	.xword	0x25954457789db167
	.xword	0x3164a581527e7dcc
	.xword	0xba019f0a07e5af62
	.xword	0x72d25b5ef4498bd7
	.xword	0x764144fbec403ec3
	.xword	0xe0adbd97e9faafe3
	.xword	0x46e258af96be4708
	.xword	0xf9defa9b41ca0e60
	.xword	0x958afd877da4167c
	.xword	0x14a26af2b944be1f
	.xword	0xbf55ace2bcec72a1
	.xword	0x9af74d6a31d94f06
	.xword	0xb20dacd2b8de5584
	.xword	0x0d919e00fbbe56c0
	.xword	0xeed1441a1bba566b
	.xword	0xdc2888258dccf587
	.xword	0xba8ba979d4e170b9
	.xword	0x5a0e76275142cc0c
	.xword	0xfd82e36e7b49c9bd
	.xword	0x91e39afe8bc02e25
	.xword	0x1ad1e3bfab64542c
	.xword	0x7e49c99f0f01945a
	.xword	0x93ad276d22054228
	.xword	0x277526db9e3364af
	.xword	0xbc963bd097e056c9
	.xword	0xc7764ced48236ec5
	.xword	0x7861be2f521fb25c
	.xword	0x9f2b5ab92e1cdfe4
	.xword	0x9d07ee35da10cf78
	.xword	0x45a75d6c1b1b2bc7
	.xword	0x7c681fba78124b06
	.xword	0x3c2a7c1bee32e460
	.xword	0xf3310694d5d73896
	.xword	0x2e73971f69221977
	.xword	0x79dbddc070163254
	.xword	0x85d8b796f145582a
	.xword	0x0b8bedf0b8ee29fe
	.xword	0xc12966f471df3b6c
	.xword	0xa8aec56b317172ec
	.xword	0x45d428880dbb2027
	.xword	0xec94f32527850326
	.xword	0x3dea5d456ec43de9
	.xword	0x68e3d204568ecc8d
	.xword	0x02a167da10f4dc45
	.xword	0x49dfd0daecc4659e
	.xword	0x72e4db63c820586c
	.xword	0xa80402737e2f13aa
	.xword	0xe20e794d81d14ffd
	.xword	0xa50d146c2a7e5e94
	.xword	0xf8b2074317418384
	.xword	0x16bf44436b274bcb
	.xword	0xa097a47335b8792c
	.xword	0xfdbe4d5fee20d10d
	.xword	0xe34136ffc4f72bc0
	.xword	0xc731242c5a2dbd24
	.xword	0x73595ccd1670b6f8
	.xword	0x3232a0c18ccbfe14
	.xword	0x25fe6810b499eb59
	.xword	0xc6090e27887267bd
	.xword	0x11d68394a4408db3
	.xword	0x284b1d0433dc2721
	.xword	0x56435569966260c4
	.xword	0xd214ef05a9aede74
	.xword	0x8b318a344f6157ea
	.xword	0x1473d08829c6cff2
	.xword	0xbb11ca7d63cc74f5
	.xword	0xa5183f70e774d9b7
	.xword	0x00370d093dd94566
	.xword	0x955b886ef28f8537
	.xword	0xa6a79b4133c507b1
	.xword	0x778a4a80ea84fd24
	.xword	0x3f6a507b081eacdd
	.xword	0xdedaac296fb826ee
	.xword	0xaa8e07e31744a145
	.xword	0xbdc5171d0dc2256b
	.xword	0xbff199777b4f7bcf
	.xword	0x0e6081775f7bb20d
	.xword	0xbbb684df75270dde
	.xword	0x4dbb53edcd60d852
	.xword	0x6d1be9eecfa47db6
	.xword	0x6bd66c90e4fae5d2
	.xword	0xd5f72e6666a62885
	.xword	0xe6a1748d13271262
	.xword	0x96992d9ca7a9e8bb
	.xword	0xdf3b42d985f181ac
	.xword	0x0f6cc793b563a81f
	.xword	0x420e131cb36865c9
	.xword	0xb5c77149aa5daad2
	.xword	0x985f523852bd61a3
	.xword	0x0e8c3e6812c6ef23
	.xword	0xfaa20636e4a40775
	.xword	0x0a5c283ebf1337ed
	.xword	0x0faae7e5637094e1
	.xword	0x65d9db4c9486ceb4
	.xword	0xdc5eda34b487a309
	.xword	0x6c1bed6442323189
	.xword	0xb7a19177df8805e6
	.xword	0x7233d8b5e0cd69cc
	.xword	0x04992bd46749ba59
	.xword	0x4c4ee5b2e91ddbbd
	.xword	0x5f725853e45bda7a
	.xword	0x62d6d9beba0829d7
	.xword	0xb1e82770417cca98
	.xword	0xa3fe20c3168739ea
	.xword	0x8cc46a7b77d4be4e
	.xword	0xc16e4139ea4750ba
	.xword	0x1ec85bfcce325623
	.xword	0x264565c1c0d8d8c1
	.xword	0xa02787347752eb77
	.xword	0x225e41d826128185
	.xword	0xe9c798207e0db79f
	.xword	0x163672edc6559a63
	.xword	0xe9e2d6a82ec77d6d
	.xword	0x633a8cccdcddcac4
	.xword	0x40b68228eea47bc1
	.xword	0xec07993edbcdefe3
	.xword	0x3f16095738491c01
	.xword	0x14c45bda795960e4
	.xword	0xa455f43fce0d719e
	.xword	0xaca1dcb16e5e7d91
	.xword	0xfb3a312094cf4ecb
	.xword	0x422bd070347ea937
	.xword	0x0e603c5b1f171d1a
	.xword	0x19e49036757443e4
	.xword	0x042eb8278ae1d3fa
	.xword	0x95b165af70ca5b31
	.xword	0xe82b6534a0693047
	.xword	0xfe9ba6313f770e82
	.xword	0x0f248d35d5e87605
	.xword	0x523edeacaec199ef
	.xword	0x0c375d5525fb3c3f
	.xword	0x814d3166366e2928
	.xword	0xdf996c555879fe5e
	.xword	0x6ac0371b445f8343
	.xword	0x11fb93e924cbb8de
	.xword	0xc4ee326f232c3c41
	.xword	0xfb43af7b617229fb
	.xword	0x8bd809b9b9556153
	.xword	0xf553289e75659c98
	.xword	0xcd140206120e5342
	.xword	0x01694c34a765197a
	.xword	0xd257e8e1ba7391c9
	.xword	0x4e79f5b48aa4343f
	.xword	0x136cb693c35140c3
	.xword	0x8526cd8a900ff93c



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
	.xword	0x4a266148242dd8de
	.xword	0xb993d3401dcd4209
	.xword	0x6956cb1cf8f30120
	.xword	0x5214118fb995e6ee
	.xword	0x64330dc608b16f23
	.xword	0x3ca9261f4745722d
	.xword	0x4fa6d58c62610ab7
	.xword	0x2d90975e10c1e0b1
	.xword	0x7416575e639be7d1
	.xword	0xda1ef8e9a89d7cd6
	.xword	0x15721c9b55657956
	.xword	0x9ea01e097679fa92
	.xword	0x0b6b84cb5fb5ad9f
	.xword	0xc6ee167d74fbfa0f
	.xword	0xb7dfd31d80c6472a
	.xword	0xa81b2c7dc3ae1c9e
	.xword	0x1fc17b27308a6edb
	.xword	0xc20a1c9494f53ebe
	.xword	0x4e48309320d37029
	.xword	0x1eedea1453df9c23
	.xword	0x4f0e5b9279ddbd0c
	.xword	0x0c3b0a17d59aa0ea
	.xword	0xe02b695838a66c0e
	.xword	0x8578bd5a44f1ffd5
	.xword	0x1277848d18534393
	.xword	0xa1e20aeb53003211
	.xword	0xa03991beb8006529
	.xword	0x7ec03356ba0b17b0
	.xword	0x2725025077373186
	.xword	0xefc7d77495a1d649
	.xword	0x845803a33891a65f
	.xword	0xaa89919f153e7d30
	.xword	0xc186bccb9206dbb6
	.xword	0x9a0e64dc9e5032ab
	.xword	0x72038d61a88d921e
	.xword	0x7bb4262d0bbd429a
	.xword	0xd04845582731363e
	.xword	0x87465cf08d1f6396
	.xword	0xa44b9042d00b6500
	.xword	0x19d3f09bab70222a
	.xword	0xb076a898ee78d9aa
	.xword	0x5899a3df4080e417
	.xword	0xe0d7da444b30752f
	.xword	0xe0b31fd511e55d75
	.xword	0x73fe89b05d3781be
	.xword	0xe4437f1b7b2efe8a
	.xword	0xf086a42f660ad266
	.xword	0xd3ffa7a4f69ab3bc
	.xword	0x54c4e670dccdd0e4
	.xword	0x913bffc6059d3744
	.xword	0xb1ac7449a2fa74bb
	.xword	0xfb5077e012b0183d
	.xword	0x19ede56f9edd3ffc
	.xword	0x2d5a3de2b2a00d5a
	.xword	0x1f9f8c45a6d13dc8
	.xword	0x163367add2c14a27
	.xword	0x7ca5993e995c576b
	.xword	0xdd36ad1e681cdf10
	.xword	0x7f91d7ab639f6b81
	.xword	0x95fd1e7ec6ad4cf2
	.xword	0x78eee7197c67ec1a
	.xword	0xe8a701736634a964
	.xword	0x7338b9ea4202cbd9
	.xword	0xa1f74fd2a3f66497
	.xword	0x32931722f3b9a009
	.xword	0xa97b760da92c43f0
	.xword	0x3910a6276bd335f5
	.xword	0xfbb7223becb49c4e
	.xword	0xef614de4d5d0fda6
	.xword	0xf460a7e0385c9754
	.xword	0x7b88210ffc8abb67
	.xword	0xe055ec642c1ca0f9
	.xword	0x4118df5cb848ea95
	.xword	0x26ca3bee5713f9a2
	.xword	0x92d5c1533fb07e3a
	.xword	0x381f55f8c5d25b09
	.xword	0x4d5dec5e9fdbe78e
	.xword	0x3d8bb25aca7e273d
	.xword	0x2d3d721230c95996
	.xword	0x0f5b5d893862173a
	.xword	0xa226e70687821fc0
	.xword	0x2a6562c8836f068a
	.xword	0xb3f89556d91405f7
	.xword	0x7864fc93c9091773
	.xword	0xc2cacc42cb9f843a
	.xword	0xd3daec815738fd5a
	.xword	0x5a76617d776e5a5f
	.xword	0x1e0f3cdb465a8eee
	.xword	0xbcfd995809e83499
	.xword	0x36c23d6064484c3a
	.xword	0x6523b1e0b0513511
	.xword	0x4d1645685b07fee7
	.xword	0x47b9d2315019bc37
	.xword	0xbbee9b31a5106de8
	.xword	0x515e5310e0966bc2
	.xword	0x416d2b7cc4f54997
	.xword	0x9970124ef66e56d0
	.xword	0x6cc4f46a4cdc8041
	.xword	0x6ad16df075648a0a
	.xword	0x360de1243bb4f244
	.xword	0xa919e5bad3391463
	.xword	0xa8d1776e7d2bb3d0
	.xword	0x2528e5e94c30b375
	.xword	0xc68ae6a47986d18b
	.xword	0x5edfd8f5ec0922f8
	.xword	0x408f9e9578d7de85
	.xword	0xe4582e8e12790eaa
	.xword	0x11860cb1be5036b3
	.xword	0xc85e9e6e4611ec3b
	.xword	0x4ac4ff13219edf47
	.xword	0xb3896b2bdec9440d
	.xword	0x84c24ab9846641af
	.xword	0x3f1980258da56695
	.xword	0x9163394091664dee
	.xword	0x1a3792a3b4b096fe
	.xword	0x017e0e186cbc80ab
	.xword	0xb72157b45d5439fc
	.xword	0x86faf6d18320606c
	.xword	0x4c6be02eb46f5479
	.xword	0xdcb0a62034625d2b
	.xword	0xadccd3c0d7c82442
	.xword	0x8d3323c812aef7bf
	.xword	0x395442a0d69596f2
	.xword	0xac5b15bf3431628b
	.xword	0x2980e6b2c3e40d6e
	.xword	0x4bc6e87687d37d91
	.xword	0x36250d14e16f235c
	.xword	0x5a98ed5af6162a23
	.xword	0x19935bb4074bf916
	.xword	0x4660dd0b2f13f803
	.xword	0xe13a20a58fc7d69d
	.xword	0x7f121c13a10ef937
	.xword	0xe9ce513e43990512
	.xword	0x6cb08e4ff038bf05
	.xword	0x55e417d2224aefbb
	.xword	0x9f528eada4bfd8a4
	.xword	0x7ce640990e4a45da
	.xword	0x241330a575a61956
	.xword	0x5ebed374561fd2ab
	.xword	0x8658fc609197de4e
	.xword	0x7c0ddf377d3b5725
	.xword	0x6f3e4cd111967ec2
	.xword	0xa98f881e958c3761
	.xword	0x0b34585b0e6851a0
	.xword	0x94a5d1c6f9b1d9eb
	.xword	0x7a5e286c9cc69e5f
	.xword	0xf9f5c7abfdecd12e
	.xword	0x58b382d89d68e47c
	.xword	0x041b9ad29a923c24
	.xword	0x2c255b3e78f9c992
	.xword	0xc44b43e89bcf69de
	.xword	0xd65973117bcb68aa
	.xword	0xee5f81217acd596b
	.xword	0x4202ea3c8014233e
	.xword	0x0141d2b4fb5c0b72
	.xword	0x7f7f1a03a4028b22
	.xword	0x836eab7d3a0727bb
	.xword	0xf680e54a7b121b62
	.xword	0x6f23829ce13525f5
	.xword	0xdf0be298185057ac
	.xword	0xe1270bc6068d5b8d
	.xword	0x4ac589b17181f155
	.xword	0x879daca60ff72d8e
	.xword	0x5cac32fbfa67c2f0
	.xword	0x107f35796f610176
	.xword	0x53cea42f6dfeb641
	.xword	0x8c9b2d751efa0750
	.xword	0x39a1ae4c58e3bec5
	.xword	0x40db290372804f8b
	.xword	0x3cd52c5cfb7c0afc
	.xword	0x13750cfcbc36f2af
	.xword	0x61ad52584da1d499
	.xword	0xbdd21c764977fb83
	.xword	0x775391ddb519f4ff
	.xword	0x7bbcf539cf4cb57f
	.xword	0x9b3fa2d8abf66eb4
	.xword	0xabe2d49c9d63c1d7
	.xword	0x2944ded0f9705401
	.xword	0xfda6a4e7d1189bee
	.xword	0xcb80a6c02645f551
	.xword	0xc3dd7eaaa9fa9803
	.xword	0x780c65aa10d73fd5
	.xword	0xd082958fdc382999
	.xword	0xf596962e297f1327
	.xword	0x439ac12dd57c4a5e
	.xword	0x2afa0993f7695902
	.xword	0xfa646596a13cf08a
	.xword	0x69a36dbf5aeb8309
	.xword	0x1a82ce32266d65e7
	.xword	0x227b3b086d1cd4e9
	.xword	0xb81f853ace544a05
	.xword	0x13031b7403473034
	.xword	0xb5ee499083daf54e
	.xword	0x8b745bce6c622c85
	.xword	0xc6ebbd96444364e0
	.xword	0x7a7c9d21a43e9069
	.xword	0x0db6bd0ebdb912c7
	.xword	0x96d1c1a5664b4f91
	.xword	0x3d6a1d1eab47633e
	.xword	0x198d11c0105abb48
	.xword	0x91a82b530e888102
	.xword	0x76932c3110348f93
	.xword	0x86de12dc2128e916
	.xword	0x975e49656b2bf81b
	.xword	0x3aad7623c674ff60
	.xword	0x32fdb203f2dc6c7a
	.xword	0x55b818be37231290
	.xword	0x3210188e710d0450
	.xword	0x17f3234ee725d84b
	.xword	0x29e8ed4c95eb131c
	.xword	0x5316146846d958a0
	.xword	0xae19e8406134eab0
	.xword	0xcf5011975e5122cd
	.xword	0x4e42b7c623532378
	.xword	0xb142149c6821fd72
	.xword	0x4c01aee523e6d98a
	.xword	0xcfcaca1402ed255e
	.xword	0x4600169dd6625231
	.xword	0x946ad37be40c63ac
	.xword	0x17f829e7116a4e94
	.xword	0x1aa66af6ac659a08
	.xword	0xec7fbe7dcfd9330b
	.xword	0x64cd6b6cdf64dd47
	.xword	0xcabfe3458afaed5f
	.xword	0xb777fe0bb35d8bfb
	.xword	0x351c63f9d8ad6f6a
	.xword	0xef7752abdccb2c3d
	.xword	0xbcde19c3b9f6f1aa
	.xword	0xcc07f642616262b4
	.xword	0xdb01f9186c06c7c7
	.xword	0xf07d7fdc24c2616d
	.xword	0x5f1035a8b4235b17
	.xword	0xe16f8fe2802ffd42
	.xword	0xf9ca3e6e29c83a99
	.xword	0x5587886c5703a6a2
	.xword	0xafd526325feb3d9d
	.xword	0xca7d90eb7eaeb40f
	.xword	0xbad9ccb14d10c93c
	.xword	0x428b1077b75d5c43
	.xword	0x6194681139a436f9
	.xword	0xba6d65671e5b3c3b
	.xword	0x9a8fb8ce22e32b81
	.xword	0xb388dbd9756903ac
	.xword	0xa984837c6b0348d1
	.xword	0x46ff9af14c4286a4
	.xword	0x32a9c6bea7cda32d
	.xword	0x55b8bf84fd1b6b92
	.xword	0x2a043692a5fbea88
	.xword	0x20601997410b47c0
	.xword	0x658e9555b0f5fc12
	.xword	0x3f27a719fc844e46
	.xword	0x476925202f2eeae9
	.xword	0xb10a0b4f39d2ff4e
	.xword	0xe592d360dbc14eb4
	.xword	0x2545ff5832821c57
	.xword	0xe1ce618b9d9efd9e



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
	.xword	0x2c4d4802d9711dfc
	.xword	0xe90c94aae8eedbbb
	.xword	0x5594a3cc396ba0d1
	.xword	0x21e677a5945b7b44
	.xword	0x5f9d3200bdcdb4ab
	.xword	0x8ab0bdc211004878
	.xword	0xc18c8239e08762ea
	.xword	0x8879686ef342f89a
	.xword	0x11e43bdf49120693
	.xword	0x5b51a5a7bfcfbaa5
	.xword	0x3951358b6f152ad8
	.xword	0x0e1ccb3eb2bf8efd
	.xword	0x34a5909b3e51e3a9
	.xword	0x3bdcdf484237a0e8
	.xword	0x6d56a599c3b1a3d5
	.xword	0x386cf37d5d414981
	.xword	0x3ceabd83c339b5e5
	.xword	0xde350046a79e4bf8
	.xword	0x557475feb60c0cc9
	.xword	0x033eecb45e0f83a8
	.xword	0x0748c88328edfe0d
	.xword	0x9885f58b614afd94
	.xword	0x65bc1487cc711b95
	.xword	0x679b66c9fc9ead04
	.xword	0xdfc9290ff2acb99b
	.xword	0x6741634c7af2f3e6
	.xword	0x14a37e633b7bbf9c
	.xword	0x30463fdf4d6ba8ff
	.xword	0xe4fd5ace13b549f6
	.xword	0xd18b187ddaa4d78b
	.xword	0x491f7a62e34e940c
	.xword	0x484fa5e0089fb9f4
	.xword	0x37d47b7fcb98f7be
	.xword	0xd71b5ef9d7b2f739
	.xword	0xd20652a656b51aa0
	.xword	0x630467fbcc6c2af0
	.xword	0x550f6e4abc1e93f3
	.xword	0x966ca763f0aeced8
	.xword	0xaa278cf9bf375135
	.xword	0x0923946081b96823
	.xword	0xfed9818b9e4173c1
	.xword	0xf0606a8c409d9aa3
	.xword	0x0e38e91de102d1bd
	.xword	0x092da1adc9cf507c
	.xword	0x2a07c3583d817e69
	.xword	0x853acde43c291f8a
	.xword	0xeb2262485d6ca2d0
	.xword	0x4027789dc64c4c80
	.xword	0x5d7b99a2096c6ba0
	.xword	0x2354db8ea749e451
	.xword	0x8b60858b37d05a1f
	.xword	0xc8934e4e969698fd
	.xword	0x991c9885a6683352
	.xword	0x0a36d930fc869aed
	.xword	0x7c26b4691023b953
	.xword	0x5cdd1ce50e35e5de
	.xword	0x6fab1c159514b4c1
	.xword	0xe161256c65978472
	.xword	0x769ee78f01494f78
	.xword	0x60c4fc08b2144e5b
	.xword	0x1b1efff256fa38a5
	.xword	0x84de46ecbf776c03
	.xword	0x5abaa2d14dc7d001
	.xword	0x5b84405f6e2be08e
	.xword	0x23cd07ba58aae4f8
	.xword	0xe5923a4f190db295
	.xword	0x2c3948e9e7aed435
	.xword	0xa67091dc7d0d838b
	.xword	0x002f46e4426c4999
	.xword	0x9cda7cd96d9f7069
	.xword	0x98f9af254ed6e50b
	.xword	0xb06c8fb5ee7ac67d
	.xword	0x85dbea5c54d5d477
	.xword	0xfacc1ba962c3d589
	.xword	0x8cac5ab062f56d13
	.xword	0xffbe023ac5958930
	.xword	0xdcc9d24cb851f970
	.xword	0x9f849b8b6cc89dbe
	.xword	0xea507333f2939396
	.xword	0xc642ff3580c2a503
	.xword	0x87e4c1dae9a054f1
	.xword	0x1b4577ae867d3bbf
	.xword	0x33c15ff753a59f52
	.xword	0x355f1ab5b50fa619
	.xword	0x0a800a5ce1fc835f
	.xword	0x67cb7926d0ca5381
	.xword	0xd7a8322ee9f97c84
	.xword	0x19601ae0a99cca41
	.xword	0x433a9fdc7541b184
	.xword	0x7a4317b1df533118
	.xword	0xd7ceae6be4bbcd5e
	.xword	0x9f2a7c88043b9092
	.xword	0x685ca62150e3ca3a
	.xword	0x9d2ad17471b6a129
	.xword	0x8781d1bbc0bb3d62
	.xword	0x1a614cea6e884adc
	.xword	0xfcf850096644bb9a
	.xword	0x2648bcde75f13ad1
	.xword	0x1d67613f4bc0059b
	.xword	0xc113a9a09d4f070c
	.xword	0x6839af2fdd28b569
	.xword	0x45c703efe7d41ad2
	.xword	0x2c8ed156daa92d6d
	.xword	0xe8abd380ac42f994
	.xword	0x1b4a440f2a33692b
	.xword	0x2df81b219ea2879f
	.xword	0x4a4be3c4a260f976
	.xword	0x2934094df5bdcbbb
	.xword	0x66f56662b3c3f65d
	.xword	0x1f1917a0c42861bf
	.xword	0x7034699bef5cc787
	.xword	0xa17bfd704566b3b3
	.xword	0xb529f618daf03037
	.xword	0xbd46ffbf920cd551
	.xword	0xd39e3d1244dba724
	.xword	0xe037bc0eb647ca9f
	.xword	0x84c1dfb3953cea17
	.xword	0xada71fa9336895ad
	.xword	0x4a248c340e97b329
	.xword	0xd1c97ba0a5361ff5
	.xword	0x5ad659ad858aabc3
	.xword	0x9eacb98ed05e6b03
	.xword	0xd2df61480ce42e08
	.xword	0x59e70e883f9659ca
	.xword	0xad38b1891bc29868
	.xword	0xc1cccd0ce9eca82a
	.xword	0x1653b9234a2ff6e8
	.xword	0xb185bd5f81162b51
	.xword	0x9949ecf12ac8f5e7
	.xword	0x96818cf3687aa96d
	.xword	0x4ea99e0513b19949
	.xword	0xbfe0022fa7fab79b
	.xword	0x464d89f0d11ccc3e
	.xword	0x8dd7502c4ffa4ebd
	.xword	0x899d0fad5b01c072
	.xword	0x4fa75d3fd53e2ef9
	.xword	0x5098f2c4bc988cbf
	.xword	0x55b2ad80aca14783
	.xword	0x3997a76f035e0017
	.xword	0x18da3088b9742b17
	.xword	0x72e60d42920d5746
	.xword	0x9b95d0b692759a59
	.xword	0x33f1096edb7010aa
	.xword	0x75035f27da887bfa
	.xword	0xad7f266435a0d89b
	.xword	0x9491aa7ff2ad308d
	.xword	0x28aafb7ebf867bb3
	.xword	0xff586cd9fadd961c
	.xword	0xa0a49238d548d860
	.xword	0x65d91477a9aedde7
	.xword	0xf71e843e08e2999e
	.xword	0x0fb01a41b225e625
	.xword	0x85610a54bd35344b
	.xword	0x021bdd16a73db15a
	.xword	0x497d087e897a4251
	.xword	0xb2c89d07e5531d31
	.xword	0x3102c1cc2f499a79
	.xword	0xc57bb79b38038f07
	.xword	0x2d03b3c54bd407b0
	.xword	0x8103a69275b4ecfe
	.xword	0x9cd5b44d4ad1d845
	.xword	0xd4cf63dc1b1ffd54
	.xword	0xff661100c815c671
	.xword	0x96b686afaf8eb698
	.xword	0xd797e49bdf7b4243
	.xword	0xd99aaffb4c65a61e
	.xword	0xd4ce7c8593936697
	.xword	0x3f0c81f11596ba1c
	.xword	0x73267d5cae65a65d
	.xword	0xd3b012a3a3be26b4
	.xword	0x05f4eaf34e05ce71
	.xword	0xbb8a518535e15783
	.xword	0xd396b20917bce91b
	.xword	0x5e29ed78fc6b5434
	.xword	0xfabc3ccdfb41ae26
	.xword	0x8e8b60f515ca4850
	.xword	0xd59e39020db6c78d
	.xword	0x843c9344b60442e3
	.xword	0x8d3af2703f84bd1b
	.xword	0xf934f58b3718526b
	.xword	0x847c83ef0efa5fad
	.xword	0x8fbe9724baa540c9
	.xword	0x7dd92fb159ce34af
	.xword	0x82b1fe5dacfe2232
	.xword	0xc111c789b54f97f8
	.xword	0x1999166f64d965a3
	.xword	0xab27284c801768e4
	.xword	0xcecaca75b29fc4a6
	.xword	0xeee397594eecc88d
	.xword	0xaf498bd2fc7c0948
	.xword	0xf87848a5f3656880
	.xword	0x068e7b5b9144fdca
	.xword	0x5ffa0a2ae109063c
	.xword	0x40d00c121df26bc4
	.xword	0x8e6ba1dd37666d32
	.xword	0x0d055ba9d88246b2
	.xword	0xea0d07b4d3f49246
	.xword	0x35d60e69133ca6a7
	.xword	0x365b9ae6432a2510
	.xword	0x43162f19064a4b4b
	.xword	0x1e070a86ad03d411
	.xword	0x44f193bf9a4cdd98
	.xword	0x21facff1f5552f32
	.xword	0xc3f21df02acf5a2a
	.xword	0xdb3167c59655ec91
	.xword	0xfa6c49ed0d14c258
	.xword	0xb0bf7eee4735d961
	.xword	0xe0ef7f07613a1de4
	.xword	0xd42ccd8edca16450
	.xword	0xfc350b57ff4c4d31
	.xword	0x33d6fd6022ff7c59
	.xword	0xc284574bd67b2898
	.xword	0x0632227a7498a381
	.xword	0x129c865d9f3eeb5c
	.xword	0xf9a1597a4a40060d
	.xword	0x924f77fe547b5d33
	.xword	0x22a9b0d016b157f1
	.xword	0xffdaafd4fcebad91
	.xword	0xa8cb460315572b5a
	.xword	0xb892b4698d295669
	.xword	0xaa24d1790d2fb3a2
	.xword	0x2a22ded0717b8318
	.xword	0xe4daab678b60d4ae
	.xword	0x559689af823c5328
	.xword	0x661dbdbf306ec257
	.xword	0x50921cae66a96586
	.xword	0x1dd62348a5f371e1
	.xword	0x1a8117861c15ac30
	.xword	0x4d02a18931225a20
	.xword	0x4a70c95ca6164c1d
	.xword	0x7bf35ff2c806fc1a
	.xword	0xc501493c39abc8f9
	.xword	0x47a006630d1f8a42
	.xword	0x15d643f290caf295
	.xword	0x6693c224f77a1279
	.xword	0x64e72aa0f5831e1e
	.xword	0x1e0096cc6edfcc1a
	.xword	0x2e29f5b7402bd8a5
	.xword	0xe2d87e85dc648769
	.xword	0x6e2d872210bb8565
	.xword	0xe72a16e0c971d016
	.xword	0x9cb12cb6b6cb6566
	.xword	0x812327cc58119e3f
	.xword	0xac9ef93557693845
	.xword	0xa8ab62d039385177
	.xword	0xbba15502d9514720
	.xword	0x0374d7f06f8ad81b
	.xword	0x3d6bc2f78899e733
	.xword	0x08061a68b37f056b
	.xword	0x8692641915f66fcf
	.xword	0x651167640f267cfc
	.xword	0x067d664ce63c97db
	.xword	0x7a2aae9cfadc5f7c
	.xword	0x4008344cf1237073
	.xword	0xfb5ae05b4817480c
	.xword	0x9fbea1df7378add2



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
	.xword	0xc4f9caaccc3b192a
	.xword	0x4b3d22bca3ff3825
	.xword	0xec5ec71e7e38c47c
	.xword	0xdf7f25d229d7c1c0
	.xword	0x35d5910d4a79ee52
	.xword	0x537ac6dead900f7d
	.xword	0x6b0a027534b97b61
	.xword	0x154218bfe9cc0a7c
	.xword	0x4be0a0cd3f2fc08c
	.xword	0x8e095f8c0424bcab
	.xword	0x76e842f83eff6bfc
	.xword	0x0826f7df95fdedd3
	.xword	0x97221679e25f2dc8
	.xword	0x213e0f4db2828601
	.xword	0x65791ed5af1b61c6
	.xword	0x30c23b668eacf1c5
	.xword	0xe917d73bd5750c98
	.xword	0xac936f258381c9f4
	.xword	0x7452fc397a4ff326
	.xword	0x4a092ddf43b8cdfc
	.xword	0x7dde936b9f9d7ae4
	.xword	0x168f3bec05c41fee
	.xword	0x1cad11337e2fc1c2
	.xword	0x1fa1a9be587768e8
	.xword	0xfd511c37d01b4b93
	.xword	0xc918a0b8769f718b
	.xword	0xab5b27c605940209
	.xword	0x26dd1168f1bc1545
	.xword	0xfd242171b4262c8b
	.xword	0x1df05f4c99bbd05d
	.xword	0x9668b5f486676ff4
	.xword	0x1c879c74ffbf39a3
	.xword	0xdd70e549fe43b25b
	.xword	0xf53c103b42ee54f3
	.xword	0x6c27331b7ed6e1f8
	.xword	0xe9642fd45ccd4af3
	.xword	0xb3d5c6050cf55b76
	.xword	0x724189576c1cadd1
	.xword	0xc5236163710a59ab
	.xword	0x4630cf81207cb864
	.xword	0x1f8f91534c84626c
	.xword	0xfa5eece0a29a029b
	.xword	0xc517638e19fee902
	.xword	0x02dc5905100688eb
	.xword	0x095503dbcc9971e7
	.xword	0x66f3f5fea7ab8da5
	.xword	0x1d29ee0403fa98ad
	.xword	0x8f2fe6fa9fbfe4a3
	.xword	0xc2bb4c05c9804218
	.xword	0x1946f9b334f582ce
	.xword	0x34cc435f793a584b
	.xword	0xadb2e483442612fb
	.xword	0xad9696852dc7eb36
	.xword	0xc351770c043a6c03
	.xword	0x25f5f85641352e73
	.xword	0xfdf13707bd02cd6b
	.xword	0x53d24d1edbe1056b
	.xword	0xe50f69ea699329a9
	.xword	0x71f63eda8c2ee49e
	.xword	0x4d00b67c1688b76b
	.xword	0xed880278b97a34f2
	.xword	0xeed3e02c793ae175
	.xword	0xb40ca4c43ff4b8b2
	.xword	0xf064a09e8fe63850
	.xword	0xe3b52b774f7f1489
	.xword	0x1581da6a48965a78
	.xword	0x5dc678ae61bed373
	.xword	0xdfd6356daa6a18c9
	.xword	0x6da87eb343528704
	.xword	0xc163a1552e4c6792
	.xword	0x42beb893175b9163
	.xword	0x5c0fa6bac37cbbc0
	.xword	0x802bd65f75b27d5c
	.xword	0x08103669cb2f9587
	.xword	0x3f9070538706b7b0
	.xword	0x4e1b4ec5208161c1
	.xword	0x748b6554d8d34eb2
	.xword	0xe3df0c605235e3d5
	.xword	0x28d15f676dc2ad37
	.xword	0x8aba74ae5402f0d8
	.xword	0xff5e7f720a71ad0d
	.xword	0xcd64b22f80e5cdf7
	.xword	0xb1bb1cdf5f1d6ec6
	.xword	0x8a8d9ee1aa7eb4ed
	.xword	0x30508abe4c9c26ce
	.xword	0x8d8f4ed064ba2303
	.xword	0x5530b72b4460b492
	.xword	0x0c5674f157ccb4cd
	.xword	0xed9833cc732180c8
	.xword	0xdfbf6aed4dd2a5f4
	.xword	0x67664d09367e3b4d
	.xword	0xc651466de16e79f0
	.xword	0xbe1935c63be79e04
	.xword	0x211d85e2d3e87882
	.xword	0x057fd4f9181d53c1
	.xword	0x4c39cff59caf505e
	.xword	0x1b4888ea7534e8a2
	.xword	0xaa4530f5bfef3aa6
	.xword	0x2f67ebfc287e3245
	.xword	0x81dfb689729af9d0
	.xword	0x2099c0da05ae371a
	.xword	0x5e1687c282e81ee3
	.xword	0xdf513120b484537d
	.xword	0x4d581f4db0cf6948
	.xword	0x08ceac2ef41685c3
	.xword	0xb0172c3fc8ea46f8
	.xword	0xc66a8ee95b111411
	.xword	0xb9aef78161356e7f
	.xword	0x9b3f445816a1ea32
	.xword	0xf4f8e581cc860998
	.xword	0x4377d118789f7f56
	.xword	0x3fa30301ee764de1
	.xword	0x85969ad0e696b2f7
	.xword	0xb01fe8e9443544f6
	.xword	0x19eccd45d9f2cdc7
	.xword	0x4e1f5c10e15391c3
	.xword	0x768979d9965a492c
	.xword	0x4036838e06552908
	.xword	0xee592a657202f95d
	.xword	0x27135e2b6f9f54fc
	.xword	0xe569ca3ff91949f0
	.xword	0x6aee4286e377c92f
	.xword	0xc2c945b3f04c20e4
	.xword	0xb351bd8a222e51d0
	.xword	0xa700ee23f89427f3
	.xword	0x0c09a6128274f226
	.xword	0xb763f5c1f09f011f
	.xword	0xf0f1cd517651e0f3
	.xword	0xa19bd08b3361bfd4
	.xword	0xa58bdb730021225c
	.xword	0x04e441c3efcb47a3
	.xword	0xa35c317057f68515
	.xword	0xa57821e2429e2304
	.xword	0x87742aafa96d230a
	.xword	0x17b8a6dffedab8fc
	.xword	0x2471382b99de51a4
	.xword	0x52198567feb300e3
	.xword	0xc8f3fe9f8cabfb45
	.xword	0xbfa14fb63f17a7de
	.xword	0xf2b3c2b91af763bc
	.xword	0x38147c158389cd4d
	.xword	0xfcfced15c65f21c7
	.xword	0x10dce864e3e14fb3
	.xword	0xdd02cbfdf6bc05ce
	.xword	0x83b0e08f5566fcbf
	.xword	0xaba14b768ec0a821
	.xword	0x8bfe74bd74963864
	.xword	0x2624f0c8823e5e36
	.xword	0x09e6da357a1170a6
	.xword	0x98ff0f8a91301346
	.xword	0x96aa12bb9ff96c50
	.xword	0x4e42386c4b58d44a
	.xword	0xae8434254baafd4f
	.xword	0x767b84b7daf882da
	.xword	0xd94665af7b9afa88
	.xword	0x051c3ba692349c01
	.xword	0x78e473b1e9c6cd04
	.xword	0x35b7818d4371c737
	.xword	0xa7ac48f300d30a8f
	.xword	0xe73b09665e0f115c
	.xword	0x5c7d1210a33a5680
	.xword	0xc33151659d51fad6
	.xword	0x315a1a438baf94fe
	.xword	0xf6c92b8a58906bea
	.xword	0xd9a5a13a68e7731a
	.xword	0x99f354a65b46bf8a
	.xword	0x77cec304c6d54e3e
	.xword	0x342e937ae0dfb0b6
	.xword	0x2f893961b4217f49
	.xword	0x0a0cc5f6d1dbf1f0
	.xword	0x04249e7fe387ceea
	.xword	0x07198ac4d6b6954b
	.xword	0xb198641ef73b5b97
	.xword	0x4fbb72e3574eee44
	.xword	0x9e858dde8dd12599
	.xword	0xa1f48a7bb59252fb
	.xword	0xa576c6ed0652a955
	.xword	0xcc698a2f480ac225
	.xword	0x9b93ba07a3a35291
	.xword	0x4d4fda2d2b1f4a3b
	.xword	0x79a0b46ea332ff9a
	.xword	0x611e7dff57ac44ce
	.xword	0x6a60248457a0b80a
	.xword	0xc5ba92ac7a94ea70
	.xword	0xd4af22883334cf20
	.xword	0x89cce1ae1a9d6815
	.xword	0x74ac2c9a6c5aaebc
	.xword	0x8b560dd6879c8880
	.xword	0x20d6bcacff9b3027
	.xword	0xe7eb7cae57c848a9
	.xword	0x894c5a8cd51239b5
	.xword	0xdd69c6d4af24d200
	.xword	0x311fba7f328912f8
	.xword	0xc3c7ad97537d5623
	.xword	0x0f2e11605011ceec
	.xword	0xfdbb394236896cc1
	.xword	0xc16f77f3ab3c739e
	.xword	0x388337fd7f12ff8c
	.xword	0xe7efe4b572ce441d
	.xword	0x94ea677bc8093e84
	.xword	0xa4f26abf8824f493
	.xword	0x3a82df0285979dd8
	.xword	0x13fe1d0280c77bb2
	.xword	0xfc302385d97f12f3
	.xword	0xc277302447181888
	.xword	0x7ab1445d2d844f52
	.xword	0xb6f4e7349fc1bf20
	.xword	0x1475762a1db1c275
	.xword	0x41cb9503d4debdf8
	.xword	0x63984fe4c40a268c
	.xword	0x2e3f0de8474ca3c9
	.xword	0x692e1c79193bca57
	.xword	0x0a4c1f6db2fdc92c
	.xword	0x5e3dd2cf3b5115f5
	.xword	0x23ac0a146551362c
	.xword	0x09519813b3f1e8e4
	.xword	0x3207dacb9cba4021
	.xword	0xf1dc4bf38f64b415
	.xword	0x22607665b1430c9f
	.xword	0xe9d8fe01cde786ce
	.xword	0x6b5e6ef69752d3c1
	.xword	0xb08be9abb0ecc1aa
	.xword	0xa852fb5acf43df9c
	.xword	0xae58e84891f58fe2
	.xword	0x4bac9f24a686762b
	.xword	0xc169d87f0a5e407e
	.xword	0xa510dfd110c5d658
	.xword	0xad1a98582d5ed118
	.xword	0xeb5a12649f524d2f
	.xword	0x4e8f49027e4ba2e2
	.xword	0x5ba5d5f9a4bae517
	.xword	0x2c036de4164d37d3
	.xword	0x87f42bc38146b19f
	.xword	0x85d9170477d8bb5c
	.xword	0x6f6910a4ca4bd374
	.xword	0xf22c6fd828be4ca6
	.xword	0x99d3238782be6e4a
	.xword	0xd6298396c1f2057e
	.xword	0xd22d62170033e937
	.xword	0x9de51971df365f12
	.xword	0x697b0cf3258e40f5
	.xword	0xbd48d6f93b3438a4
	.xword	0x091c6cd3c4458af4
	.xword	0x783ce632d4e7ab74
	.xword	0x71dda1ace410b8c4
	.xword	0xa1bbfd2ee99d78f0
	.xword	0x295a1046afbd8c0a
	.xword	0x08e41bed1961d926
	.xword	0x48ce2183d096a04b
	.xword	0xe0799fc1713087de
	.xword	0x6241f13c4d0ebcb1
	.xword	0xeab2b11506ee2c74
	.xword	0x944cec245fcef30c
	.xword	0xb0f0f8e851db0f5c
	.xword	0xcce233404e9a5c9c
	.xword	0x169b2e951a0ad5c6



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
	.xword	0x7a1aa59c87c50eac
	.xword	0xfa8ae2c71b36622b
	.xword	0x84c30796689fdd5e
	.xword	0x80fcedf055b141d4
	.xword	0xa7a6e6067fd3f834
	.xword	0xd4f0b60221934c3e
	.xword	0x095fcecc49cd9280
	.xword	0x414ee4c396caf5a6
	.xword	0x143cd4b9d689d49c
	.xword	0x16f38104275d74b6
	.xword	0x98ede737f8c7a04d
	.xword	0xbd27abd20aaa96d8
	.xword	0x4064e352ace60c66
	.xword	0x69aac7d9ee985e4e
	.xword	0x3e0e3cfcc9f460d6
	.xword	0xab4bbcdf75ec060f
	.xword	0xe32eb62c880912b6
	.xword	0xfd0036296a48b24c
	.xword	0x129f3a2acf83bd00
	.xword	0x8d7808577d37025f
	.xword	0x24e031477e93a69b
	.xword	0xc587812b2408d95d
	.xword	0x4fd69020a6df7c59
	.xword	0x05afe1c6a57a6620
	.xword	0xd707081cf22f4a67
	.xword	0xc94469bc3c46a820
	.xword	0x630d7d9369bbf30d
	.xword	0x5db40182fdb385f8
	.xword	0x97c3fd838a569055
	.xword	0xfb6907f045c39d75
	.xword	0x2f37dfecda3b912e
	.xword	0x23c77356bee81b66
	.xword	0x26ff2a3a29952d6b
	.xword	0xeecd55bc25ef73f0
	.xword	0x8a117d4b2ea32b74
	.xword	0xae22864e87d03717
	.xword	0xfc1671c1b06100d9
	.xword	0x8ebec1afc4242a30
	.xword	0xdc6efa5608723d12
	.xword	0x8ecb4ff3e3e979bd
	.xword	0x429094cf375269a6
	.xword	0x2e5a33c44272f27b
	.xword	0x490081b1b3172e47
	.xword	0x8dfeb7b831eafeee
	.xword	0xc318ed1a00583fc2
	.xword	0x90aae5ebde54d120
	.xword	0xc43e9d36aef93947
	.xword	0x0b7022d5d67a3f0d
	.xword	0x8ece51597d0a2f2e
	.xword	0x21240e0a3c6ad545
	.xword	0xff31631e5946807d
	.xword	0xb522f18a18a6b434
	.xword	0xefa2037c1480604c
	.xword	0xb86746e3c9f153c0
	.xword	0xb60005a95225368b
	.xword	0x690b11082992cb5a
	.xword	0xafdb0e4b436381ac
	.xword	0xc682e720acb464fe
	.xword	0x7f95114625078b17
	.xword	0x12f069e7cbb52f82
	.xword	0x0465557f7e5e49ad
	.xword	0x6d276d21c69508fd
	.xword	0x69f15660d3ed8fa6
	.xword	0x4e32d1040ad1ec90
	.xword	0xf8bfa7aadb8127eb
	.xword	0x27fb5dcd6d816be4
	.xword	0x8d3205128b9019fa
	.xword	0x4ebc33b2a216455c
	.xword	0xef938d7a6bc6561e
	.xword	0x25d93e3bbe7be8fa
	.xword	0x1242d3fad6c435a0
	.xword	0x9c8d3837410777f8
	.xword	0xa182cffd8265bdac
	.xword	0x8a5dcdf4f9768320
	.xword	0xf125c01af4d8f7a8
	.xword	0x58ccc172c6f1ac41
	.xword	0xa44c96fd52893ecd
	.xword	0x6b87bf6784a325ec
	.xword	0xfdbcd0076aa7ebe8
	.xword	0x3a9917fe7f3594be
	.xword	0x7b01380de6a3b577
	.xword	0x47c766f5a477dc9e
	.xword	0x6a308b16b2e59efd
	.xword	0x1b941e7f16524822
	.xword	0x21970805ffac507a
	.xword	0x2e7114f9e853ea37
	.xword	0xad037048771deef7
	.xword	0x241145dd16ca88b8
	.xword	0xb40366b8071eb63e
	.xword	0x64d73734bf147c0a
	.xword	0xddecc58d46fdfcbf
	.xword	0x074cb42592f550e6
	.xword	0xf34719703bdadfde
	.xword	0x8ce66a18fdea9e02
	.xword	0x30027a0b6fb70bc9
	.xword	0x39a61e4b6b124275
	.xword	0x83046c83494c3565
	.xword	0x22e305c041370296
	.xword	0xbbf081b7c1a864d2
	.xword	0x9375d37cb09f7c50
	.xword	0x83ba80571746afeb
	.xword	0x1d47fa56fb61bd92
	.xword	0x04a3eaf3dfcefae8
	.xword	0x8d290ddad4acdbf7
	.xword	0x8304dc1b4a676236
	.xword	0x05ad044a1f0ae3d8
	.xword	0x015f87d27cdfd56e
	.xword	0x2ad9c4a932b81609
	.xword	0xda9bf9d5923e5398
	.xword	0x0883b3ad6c6e7cec
	.xword	0x05b4ee85d2e42c1d
	.xword	0x799ea996546f79f7
	.xword	0x0e3e2e0027318ac2
	.xword	0x913179de089fce0f
	.xword	0xea5ec90ade4df739
	.xword	0x36c5e0ff69e1f47e
	.xword	0xb360df5bf672504a
	.xword	0x5722f14d0fffd73b
	.xword	0x3511b2e4dff2660d
	.xword	0x0f0b618a95bf51f9
	.xword	0x4254a53b212748fe
	.xword	0xa2c27eb5ff9edde8
	.xword	0x7ae8461d4b65e252
	.xword	0x1b982312b904587c
	.xword	0x2795c20b9a1bc58a
	.xword	0xf18b01ed36f35dfd
	.xword	0xca2ecc2be51de774
	.xword	0x3b87fb29c73fd658
	.xword	0x532cc59497e67dbe
	.xword	0xa8c006977df8fa3a
	.xword	0xf08abeb658e69433
	.xword	0x26fdb8d7db29e86f
	.xword	0x6c93522278fcc3dc
	.xword	0x37767024aec9d19a
	.xword	0x2000c7dadc3f59a4
	.xword	0x5bac8265838681ff
	.xword	0x410246e66c71f86b
	.xword	0x3868cec44c056583
	.xword	0x71e243938b3938e2
	.xword	0x29d74d6fab3a30ee
	.xword	0x8bc558ee6b6143cd
	.xword	0x943fe8dd4cd36111
	.xword	0x25db96e3fbbcbdc4
	.xword	0x154cdf7f15211785
	.xword	0xe5fa71bd0122e01a
	.xword	0x4b1056ce3f3f71b6
	.xword	0x2bde2ac7fdd3e11d
	.xword	0xc57268998ca6687b
	.xword	0x0f0fe430fbac8422
	.xword	0x5d2620b0850e6ba9
	.xword	0x396c68e7917314a4
	.xword	0xaff08584cf640028
	.xword	0x2378a75b9e7c117d
	.xword	0x2ad9290399ed8a31
	.xword	0x92b1ce8c5dec7cc3
	.xword	0x2a30b3a4ce4c52da
	.xword	0xde2f35a02838b5bd
	.xword	0x043c07c9e6804310
	.xword	0x305f5fc69484fd6a
	.xword	0xcf7ce98abc6075df
	.xword	0x9bd0066d904a942f
	.xword	0xd33d9c776e12c236
	.xword	0x1a8103961619bc30
	.xword	0x321e8064f0688a25
	.xword	0xf5b582aa819aa256
	.xword	0xa36b45f5ea8d2092
	.xword	0x76c8714561445624
	.xword	0x4f774e6952637232
	.xword	0x26bfb8626e1fac8c
	.xword	0xa32c9510a0fe53c4
	.xword	0xa15cfb40a28eee31
	.xword	0x56618bd545f94121
	.xword	0x4de452a80b7a3e59
	.xword	0xcee051c6e25dbb89
	.xword	0xc27478551693fad3
	.xword	0x735491ced2927180
	.xword	0x9c2f5864add81491
	.xword	0x007f2be8cd42cd28
	.xword	0xf4dbf138a763df5f
	.xword	0x629b640a1ea4df98
	.xword	0xc34d45b55ff913fe
	.xword	0x5a21c2a362d68760
	.xword	0xa6347be4cc076a53
	.xword	0x664cee278dc7c0ab
	.xword	0x08159b92b01da423
	.xword	0xf6864cf523cdea13
	.xword	0xb0b2f0b8824f9964
	.xword	0xc0568d2d19208d6d
	.xword	0xbccb4d4db823a348
	.xword	0x907bb8747ce7d427
	.xword	0x0079dcac50cffc00
	.xword	0x8514fc81507b30ac
	.xword	0xc5b50072e0d91dca
	.xword	0x4df2b35d6a6a1c7d
	.xword	0x69bbb6989b80ef37
	.xword	0x5418e7e8b4cd53fc
	.xword	0xc671d8241010a265
	.xword	0x2ad285122b790324
	.xword	0x7972dd2c5c653b3f
	.xword	0x99976d5be9a093cb
	.xword	0xefd02cfadda77309
	.xword	0x11dc890bd3005cd4
	.xword	0x60f3425ffdcf305e
	.xword	0xc801ddce5c7a7bf6
	.xword	0x6eb6cc88c25a498e
	.xword	0x7e12fee778245ad4
	.xword	0x0f80120eaaa8ed76
	.xword	0x7d8b7bb307026f41
	.xword	0x0561fb7d27fe6c22
	.xword	0xc0666cd9259b0b9d
	.xword	0x667e4c6c994a7ce2
	.xword	0x2a279b0b68a43a1a
	.xword	0x67423b15641b34fe
	.xword	0xda278ba28d03f465
	.xword	0xb89ce94754b4eb0c
	.xword	0x3b419a00e9708009
	.xword	0x030dca6304487dde
	.xword	0xa9183e619168c98a
	.xword	0x5cb71a0ad1f110dc
	.xword	0x7624ca6bbf21254b
	.xword	0xb5c60a063981ad00
	.xword	0x769fce24a964a0fd
	.xword	0x42cfd5bd0f66dcdf
	.xword	0x7b7134542b413566
	.xword	0x07a94aaf68fd3f20
	.xword	0xf243074aa74a344c
	.xword	0x9b2e2f0bf78728d0
	.xword	0x2e74f9f4a7101353
	.xword	0x2f9f608d93759150
	.xword	0xa8a9b64ba866aa30
	.xword	0x339af8bab759fc52
	.xword	0x90e9e2e31e4b369e
	.xword	0x3d01939594cfbb61
	.xword	0xca6c211c95b6bd94
	.xword	0x483875d7fad6574a
	.xword	0x0bbfc7752275019e
	.xword	0x6cba8a3d68cc4b3b
	.xword	0x2a4baf95a3059819
	.xword	0xfd9d54587481e6b0
	.xword	0x565c3be4757b3b07
	.xword	0x6cbe96760e7a6d9a
	.xword	0xe69d4514dc3669b8
	.xword	0x54890450e4b4a296
	.xword	0xee189d6fab2f2485
	.xword	0x97d27baebd201c51
	.xword	0x25c85941f2cc8cc9
	.xword	0x4780166bdeea21b2
	.xword	0x7fbac2e8d364fd77
	.xword	0xe6efd07dfa293097
	.xword	0xd80e063bc12dc91c
	.xword	0x5e0a437f0fb2463b
	.xword	0x0370d40f876fc16e
	.xword	0xcbcd76cbb9da58e6
	.xword	0xec5b29fd688aaa6f
	.xword	0xca5d6b248f7bc7c4
	.xword	0xdcdbc099f2605024



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
	.xword	0x3bac1b060e3b9b98
	.xword	0x110b4a0f114db617
	.xword	0xfa08df01a4ca5ab8
	.xword	0x6d3127d40c26e987
	.xword	0xb094dc34c85a7d79
	.xword	0x3ab8484093ed6cc9
	.xword	0xe213ae95ed978626
	.xword	0xbdfcc11da07ec8c2
	.xword	0x749091b76060d278
	.xword	0x21d015479cefacfc
	.xword	0x44207ff14f829427
	.xword	0x04c6df8c7dc5f083
	.xword	0xbe605f1063bda28b
	.xword	0xce94bcbd8e44554b
	.xword	0x8b4c4f4b24a33244
	.xword	0x1645790d0225a2e2
	.xword	0x68601062312e3b67
	.xword	0xdeb72434e412b187
	.xword	0x4a05ce799349af98
	.xword	0xa28b1b7a920b9ef4
	.xword	0x60d9284afe3f4cc8
	.xword	0x14dd1f3e7ffafc20
	.xword	0x4e30379da6ad743a
	.xword	0x7908fd514df0f578
	.xword	0x5591ed6bf909b279
	.xword	0x36879b4566f96710
	.xword	0xbc4df7933f38f4e2
	.xword	0xbb806df0f1473ed5
	.xword	0xff3a0235ff8a3014
	.xword	0x1f97fcd8cc65e81f
	.xword	0xda249a9fdcad6a4d
	.xword	0x303e6db8b503411b
	.xword	0x007d9f9b38c6de2f
	.xword	0x1da32458f410631b
	.xword	0x55aacc513a6d96d5
	.xword	0x2b95cb4abb0da71f
	.xword	0x6a6f7005c46e596d
	.xword	0xc32b7c6f1f4d5805
	.xword	0xb7b30e824f3ddc4a
	.xword	0x24c210c8303bdf67
	.xword	0xf216a37d29a2e370
	.xword	0x179f2c59c2dfda00
	.xword	0x13f418d77abd99a7
	.xword	0x520fcc62dc462824
	.xword	0x5ab2c548aa6c17c3
	.xword	0x0f63b944683db55e
	.xword	0xa737f6b05c4bdb97
	.xword	0x3594681e5e040505
	.xword	0x780764573764e0f0
	.xword	0x3785751e81480121
	.xword	0x17d34374c42488b3
	.xword	0x2ea56692d4359b35
	.xword	0xf4c7c79823893636
	.xword	0xa6d42566c01a2dea
	.xword	0x7eb303cc252b7660
	.xword	0xcc37fdb9a7bd9c83
	.xword	0x6d41a4e3893e6db2
	.xword	0xe55c09735693fd5f
	.xword	0x5a5d9c38387a6b6c
	.xword	0x4b6d11e3c2d10f64
	.xword	0x46f526b33d978111
	.xword	0xb3c1b152d0f49249
	.xword	0xa65ca47e31a24b9f
	.xword	0x84361e7801b4bf2e
	.xword	0x730d395e3b22fb5d
	.xword	0xd633f9039439b91c
	.xword	0x0f9fe188d5b0337f
	.xword	0x2ed28c5a421a485b
	.xword	0x27dfcc4d09136e94
	.xword	0xf7bb721b93d0949c
	.xword	0x8587ca40fab49952
	.xword	0x5121ba188ff6d39b
	.xword	0x1fe780432084f00d
	.xword	0xeeb4f30321a308a3
	.xword	0xa323a80e117261f9
	.xword	0xce3d6ad0c1a61d68
	.xword	0x663f37e8eb335d8b
	.xword	0x73a6c5f8a164f666
	.xword	0xd127724927b81b0c
	.xword	0xd3e8a9339508d5e2
	.xword	0xbf59090ca479e643
	.xword	0xc4619519eaedda54
	.xword	0x2a95e1c84bc37460
	.xword	0xaa311d51f27eb400
	.xword	0xfa44187fb1216660
	.xword	0xe521ebcd65dd6ac6
	.xword	0x08ecd87881734df9
	.xword	0xf663b8e5258d03e2
	.xword	0x4c4fcfdc9c0f8917
	.xword	0x404e25fd856092d3
	.xword	0x781d57c8cdc47998
	.xword	0x790e79520edf571a
	.xword	0xe3d720ac9f7e11d9
	.xword	0xc3ffd3a6a4780b4e
	.xword	0x600c69511d4f378e
	.xword	0xf03ec4c49bf729af
	.xword	0x0e1fcc901cf801b7
	.xword	0x785b2620681e32f6
	.xword	0xfe3149a400232902
	.xword	0x5d0237713ea91f8f
	.xword	0x04f539502822963d
	.xword	0x67dd991e981d2802
	.xword	0x3f99267163def72b
	.xword	0xbdb251fe69c79e25
	.xword	0xac93eb3bb0e209b2
	.xword	0x4179d8edb59ed6ee
	.xword	0x84f45f60ce4a0427
	.xword	0xbfb2cedb4ab66b86
	.xword	0x30ffe1d328ac888e
	.xword	0xbde4cd93e8fd8160
	.xword	0x76519e14c252d222
	.xword	0x1e80711dea486731
	.xword	0xb70991e3c637e7dc
	.xword	0x684e5581ca614a96
	.xword	0xf8ea27e6e3c5e3ed
	.xword	0x4fb52fff11a41dd2
	.xword	0x0ffc9c6b75822768
	.xword	0xac50754b5914975f
	.xword	0x788da52988d888f2
	.xword	0xd4d514cb799850ac
	.xword	0x06730a7177d923fb
	.xword	0x954cfa380e3426e1
	.xword	0xb7ceca7fd87d64b1
	.xword	0x93c1db262ae1f219
	.xword	0x73b8e6ada5e0e297
	.xword	0xe9195c234faf1406
	.xword	0x01dd79cee22d25c1
	.xword	0x9af704c7a6e6388d
	.xword	0xea708c6d8bc6a98b
	.xword	0x9c19d4333f83159d
	.xword	0x4aa37751142b404c
	.xword	0xa82e127df3bac92d
	.xword	0xe44fd9795f27f0c7
	.xword	0x3c79f03e3b59bda5
	.xword	0x80c676483d3519e7
	.xword	0xf59d493981e1982d
	.xword	0xc719be8e48e59de2
	.xword	0x393d32ae01d9f63c
	.xword	0x5ca6a7518c13d16c
	.xword	0xdd831cde57be149b
	.xword	0x09c9db25c0538bf3
	.xword	0x274bb64c9705c4ca
	.xword	0xb53f7b3a46c93475
	.xword	0x2111e81b536e31b4
	.xword	0x8c1b32c23d8386ff
	.xword	0x311349b3eff7d9f6
	.xword	0xdbf51bdf5a75dc32
	.xword	0x3a94de34489973f1
	.xword	0xc89e85ce1b8baaba
	.xword	0x8dc4a94083ac65cf
	.xword	0xea8db9a5ae3cedb1
	.xword	0x7afa64f989679b8b
	.xword	0xd9582bdddaf03bc8
	.xword	0xba7c6e83c19cb5b7
	.xword	0xfe1816a30eb890a3
	.xword	0x9d441b4f1517b0ce
	.xword	0xc8e6fa798c67f8aa
	.xword	0x4aa167b2b3ae643b
	.xword	0x5bf326943c06f281
	.xword	0x9041c5d7e4a8219b
	.xword	0x5f28fa710a32821b
	.xword	0x18b298adccda28a1
	.xword	0xe0ea5328581537f3
	.xword	0x92ea525347e72894
	.xword	0xf0cc478aa16b13d6
	.xword	0xdebfb86619a07b6e
	.xword	0x268940821d9f2d02
	.xword	0xf1f2830f85cf27fb
	.xword	0x8523379cce78157f
	.xword	0xeb5827fc2df4e967
	.xword	0xb397bc84e2f6dfcc
	.xword	0x24642fce84e82c30
	.xword	0xd76df4fee5223ef9
	.xword	0x4c68591c7e96d6b5
	.xword	0x3941a5a392483a56
	.xword	0xd6fe2a3b48085c12
	.xword	0x10a0380f385873e8
	.xword	0xf3866770e68ad597
	.xword	0x31aeb1bf1bf7d0b7
	.xword	0xce3bb15c51f88e20
	.xword	0x3e854c1b9b9c46fd
	.xword	0x34e0bd3993e0b444
	.xword	0x94c15d5a2af7de18
	.xword	0xde7d4eab2aabf098
	.xword	0x0039b1a7725b6c8e
	.xword	0x1f30d3f43a3f1156
	.xword	0x5925f0238b8a94f7
	.xword	0xaf5c91be80114bc9
	.xword	0x6e1e8418a709e37d
	.xword	0x7e339d990d34ade4
	.xword	0xd58ccd84718159a9
	.xword	0xcea26111332c62cd
	.xword	0xa7a2bfa056d8f6ea
	.xword	0xfea3ab2d1f29f530
	.xword	0x95814894fab0f54c
	.xword	0x84c39ecad0afb133
	.xword	0x755c1f6182d1dc14
	.xword	0xfe5a540d34bb5054
	.xword	0x32d676bf95fd8656
	.xword	0xe498c4491236390a
	.xword	0xd4a3acac6d5a9e9a
	.xword	0xefd08de28dae79b3
	.xword	0x6275dfa4fd6c703e
	.xword	0xc1c202ca4c9eab4a
	.xword	0xeaf91a5c13709b4c
	.xword	0xe325e1561b5ebb0e
	.xword	0x0cff7c2e6f9c99b1
	.xword	0xdf9694b14c09d372
	.xword	0x4b6df5167cc87ade
	.xword	0x5c8ebed954da7820
	.xword	0x89af90ed495ec5a4
	.xword	0x91409fb2c70b6315
	.xword	0xd30f821f606b3099
	.xword	0x2a2cf4c18b30df5c
	.xword	0xab1671fa171a2956
	.xword	0x2d749cc7303d32ce
	.xword	0xd3556bc764ca040a
	.xword	0xac6bb9a2b52e5d58
	.xword	0x81da2f027026d51d
	.xword	0x1495144258991072
	.xword	0xf2893b08adfe846a
	.xword	0xeae66b34402b20c8
	.xword	0x6f56f227b3cbabb0
	.xword	0xcab40616aef5227b
	.xword	0xd85d148667cc86a0
	.xword	0x02dfbe50a4afa06b
	.xword	0xf4557e42326ea9ab
	.xword	0x8e4a3f5825702480
	.xword	0x7f44a54d390d78f1
	.xword	0x5bd377a9dd328e03
	.xword	0x71d95e5301992f40
	.xword	0x4ba3bc356ea3d236
	.xword	0x8871a70d70c58314
	.xword	0x8f2f4add706f7e9d
	.xword	0xb3b26d1fa4a346fb
	.xword	0x8575491f2d333a61
	.xword	0xe5010098452cca70
	.xword	0xd87c3e60e47c775f
	.xword	0x8ec1fad93fdf2e64
	.xword	0x53d9e08029e82ca1
	.xword	0x91984b31c8354fbc
	.xword	0x6bf926daa8df72fc
	.xword	0xaf8d88edf3f5c7a0
	.xword	0xc59eb46f13cfc16a
	.xword	0x38158a5202c65bdc
	.xword	0x5b39ed61c06fe611
	.xword	0x8e07cdf7cb2fa96c
	.xword	0xfad4903377be1dbd
	.xword	0xc25157f2bafbb750
	.xword	0xf34e1a7179a733ba
	.xword	0xdb79b914113c1c3b
	.xword	0x76b236c040b1d73c
	.xword	0x779dceb9f1281278
	.xword	0x5b8c3039361974bb
	.xword	0xd79fa4ae9b105e97
	.xword	0x9ef167526b806320



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
	.xword	0xf9b01b1bd2b43c5d
	.xword	0x04137e0b2c70b5ac
	.xword	0x8a82bd7d04807c18
	.xword	0xa837d838a707a001
	.xword	0x4dee3ff328e5e52a
	.xword	0xd5e92eae74037623
	.xword	0x2a93f4df4faeafef
	.xword	0x17f19c24bd7c86bb
	.xword	0xc779aed00e112180
	.xword	0xd3419b2dd1516785
	.xword	0xb51573167f5bdad1
	.xword	0x1870e58e1905eb13
	.xword	0x53e9059e0acd3755
	.xword	0x8d159c773222bbfd
	.xword	0x1ab32cf1035254b1
	.xword	0x3a078d13234ce82c
	.xword	0xc18ebe8272f9442b
	.xword	0x7dacdc93c6405e25
	.xword	0x3648be4d003d9a4c
	.xword	0x471f70b027f87594
	.xword	0xb01277b2ae8cb1ef
	.xword	0x981265b3923c5e92
	.xword	0x65bd56ccd740dcad
	.xword	0xe6e86f5ad81be960
	.xword	0x93396b98c46eeaba
	.xword	0xd1c9b5fb480413b4
	.xword	0x8c47d7a40f27c7ae
	.xword	0xee38402f6d3c8a38
	.xword	0xfd1809e8cd0495b2
	.xword	0xb624a4f43e83bf5f
	.xword	0x6e8458cce0dbda92
	.xword	0x984b6401c778a607
	.xword	0x04412251ce6067f8
	.xword	0x0c9e0481df3f0b43
	.xword	0x34d5540ccb57001e
	.xword	0x88a373f272cb7c26
	.xword	0x44c6919fe310cd93
	.xword	0xd77b0ef8f27bb8d1
	.xword	0xc347fb01f9135a90
	.xword	0x62fbfee181f3158b
	.xword	0x07769a8ce8110ae4
	.xword	0xb77e593d2a492deb
	.xword	0x76965ab3185cf904
	.xword	0xa252d4b170392cc3
	.xword	0xfde4c5bc7b4fccd6
	.xword	0x54c094d29e5d253d
	.xword	0x4be95a36557184c0
	.xword	0xf2b34268d9cbccc7
	.xword	0xe7b964570179adc8
	.xword	0xa3fa425948ba48d7
	.xword	0x5d8b91f7c741ed42
	.xword	0x8edb950c30ee200b
	.xword	0x3df576ab53fce948
	.xword	0x32bc940124f85fd2
	.xword	0x42179e71ee84d1fb
	.xword	0xb369231e24768643
	.xword	0x8219f7301ed54620
	.xword	0x78b3b2b41a07c1af
	.xword	0xbf88d3f8def89e96
	.xword	0x7060d5f3bcf30b33
	.xword	0xb3b7c9354025557f
	.xword	0xe8ae80ef6ff4b068
	.xword	0xc602199b18560a70
	.xword	0x660cb6291dae331b
	.xword	0xaf07ba582637c0ac
	.xword	0x2951fe8982cc8d8c
	.xword	0x96763f1ef01c0bcd
	.xword	0x80b8060c9430dffa
	.xword	0x6c50adea85a9267b
	.xword	0x29218ff829df3edd
	.xword	0x789ff3b116523a14
	.xword	0x5641959ab4314981
	.xword	0xc425a65079949598
	.xword	0x270c7f51ed39a0aa
	.xword	0xebb6bdc711de2f1d
	.xword	0x81a7aac373a95b2b
	.xword	0x64c76b6bbc0dea31
	.xword	0xeca73aebf9e0350d
	.xword	0xcf994f207fb0c0fa
	.xword	0xf720e2a14b4ca363
	.xword	0xc8f042ce9aa42b4d
	.xword	0x9033f008a3030c9d
	.xword	0xaea67aa277da7126
	.xword	0x3c13d88fe80b48c5
	.xword	0xf32a27d4e25fe215
	.xword	0xbc9911f81366cfcb
	.xword	0x0731043e4398b87f
	.xword	0x7e17db654154c6e1
	.xword	0x995287a834921aa5
	.xword	0xb81938e690128cee
	.xword	0x8b5db2f22c7fd856
	.xword	0x11d1cba5b4d5d257
	.xword	0x196c03e60b41fa47
	.xword	0x3ceb835a0b508348
	.xword	0x7f358140c883a29f
	.xword	0x9be54a0a4ab486a3
	.xword	0x1ee39d3a7d012328
	.xword	0xce21df80fb4f33e7
	.xword	0x4571098757799be9
	.xword	0x6a740ee8e3ec1f94
	.xword	0xd2b274a5398bedff
	.xword	0xb7c460d828687e7d
	.xword	0x486fe7ee121cd08f
	.xword	0x3877f3f2014bb870
	.xword	0xed379f7fe01379bc
	.xword	0x6fbd5663a4190300
	.xword	0x961b270ffc749828
	.xword	0x0f3f37bff16b72ef
	.xword	0x8d6e5b01dc55751b
	.xword	0x343caf1f1d59b165
	.xword	0x4fa7a28486b3fc8c
	.xword	0xe5dc25fbd99bd3a3
	.xword	0x3cd5785056e40eb1
	.xword	0xe3ae32a9cad9d53a
	.xword	0xc6931e81bb769f7b
	.xword	0x433a900cef3949c5
	.xword	0xcb2b20b4484dca27
	.xword	0x5c7473530739eaa0
	.xword	0x362eeb623e4064a7
	.xword	0x5288a400f6f5c0e2
	.xword	0x387d2042512ddbb7
	.xword	0xe1da1d2d3e721206
	.xword	0x3ff722b895103c38
	.xword	0xe625bf84b5234462
	.xword	0x0edb6681655423e1
	.xword	0xe0a7cacd2e966269
	.xword	0xc8ce7f3efa7841a3
	.xword	0x48b4da6bc45f4d94
	.xword	0x832e8deb539e9475
	.xword	0xbd5a77cf19308e51
	.xword	0xd819480899aead16
	.xword	0xd95d3af64de26929
	.xword	0xe5c6b923c120112a
	.xword	0xf161055bbbe71abb
	.xword	0x0f8d7a943111c9f9
	.xword	0xb42597a1633283db
	.xword	0x7b88f8e09d604ed3
	.xword	0x60a60087d335b67c
	.xword	0xe65129829a627a52
	.xword	0xf810f66eb8cebc3e
	.xword	0xf351e9dbb81458b5
	.xword	0xbeb6f23ffd3fb9fe
	.xword	0x13d274f59fa05532
	.xword	0x2ec8299baf717383
	.xword	0x761aada5fa82a307
	.xword	0x54dbdfe92f6004ec
	.xword	0x83a4b85578a10e31
	.xword	0x35a2d291a075f241
	.xword	0xdec613a08a9396ad
	.xword	0x8349106faa5e7ec4
	.xword	0x24f88e2fdd8bc003
	.xword	0x2f6d8ce1a0164069
	.xword	0x0ce3525955828e48
	.xword	0x3fb48059733a998a
	.xword	0x160f2e804f6da556
	.xword	0x1992918a356095ba
	.xword	0xa438db73ab9359a9
	.xword	0xab7ad41a5d0175f4
	.xword	0x9faa53c66716aba9
	.xword	0xcfcd3b6da3d5fea5
	.xword	0x0feaaf77c06af50b
	.xword	0xc9ac9df0484d9557
	.xword	0x469e328f33d90d54
	.xword	0xb6bedbaacf8308e8
	.xword	0x9e731323da6d3be2
	.xword	0xfe557968e18459fe
	.xword	0xc32133c483aff3f2
	.xword	0x7ee612fdf97e770c
	.xword	0x2159ba93fb607a1c
	.xword	0x3eab0161d7ea46c0
	.xword	0xade1ae6784121fd0
	.xword	0x0d65f1ac34edceec
	.xword	0x3a1016d83de06caa
	.xword	0xffada4a607669c0b
	.xword	0x60a38cda933c6f80
	.xword	0x2afb08a790d2c4c0
	.xword	0x4a4c075dfb8198a4
	.xword	0xbec6d985063049e0
	.xword	0xc5bb474d48e066a0
	.xword	0x9bf13404c391259c
	.xword	0x8063b2f0ea2c440a
	.xword	0x84b94bd9c64b47f7
	.xword	0x58527b79b0060ab7
	.xword	0x3cda39a0f37ea1ef
	.xword	0xaefdd596099e753f
	.xword	0xa4ed392a71e1ab05
	.xword	0xed8d9d96f93ab3de
	.xword	0x0a2c9359d73c40fd
	.xword	0x59a385e894f6b41d
	.xword	0x39194eb1ea4ec21e
	.xword	0x75985b4f0f53cdcb
	.xword	0xc89e7a9758f3b242
	.xword	0xd44542295d4ada17
	.xword	0x143d74ed5305cd19
	.xword	0x0a4a51171a0529c3
	.xword	0x3486ea7a350b2512
	.xword	0x09ca0cf84ef29d1a
	.xword	0x0577b15b33315d8d
	.xword	0x9706737a262ab251
	.xword	0x0f62d51f05708b8d
	.xword	0x2b4d1430c25d2f1b
	.xword	0x394eb4de505a6fa7
	.xword	0xd85b8e3fcaf90cfe
	.xword	0x47d188bfa9d3aeb9
	.xword	0xa86a15465a54acce
	.xword	0x831d68c9470a9c6f
	.xword	0xa34f581a261b34e0
	.xword	0x25b62dd07ad1a05a
	.xword	0x065a8504167d604d
	.xword	0x944c81f567c700e0
	.xword	0x6209902c5a90d2c7
	.xword	0xb5466277deb0cdf3
	.xword	0xb21a5b576b482e4c
	.xword	0xe05c7ef7d44741ab
	.xword	0x3a79adcb35f2f4f0
	.xword	0xc98b8fa770c5e9ec
	.xword	0x329cca95c42770e4
	.xword	0xb8e55e1100f6616c
	.xword	0x172f7eeab8a6bdc6
	.xword	0xb6f32190a75393b3
	.xword	0x826a45396b1fb7a7
	.xword	0x89eebe6856e80328
	.xword	0x34c5108515de19d6
	.xword	0xdbf5f0a0d28b1884
	.xword	0x9cf94ce00a59042f
	.xword	0x0e19bcc2e4fc66e3
	.xword	0x951f55a54de95650
	.xword	0x9171c369a8004184
	.xword	0x194acd20632a724e
	.xword	0x2170ad017e6462fd
	.xword	0x0157f6fdcef6d475
	.xword	0xd923b46767da6f6b
	.xword	0x8b542f691ce0ee08
	.xword	0xb3afb9017e6ff5ac
	.xword	0x611c59ac5df4418c
	.xword	0x330a99662729bb54
	.xword	0x556efd2f1aebf626
	.xword	0xb9b2098900dd2fb2
	.xword	0x5e6d05f3f296efa6
	.xword	0x30bc922b3d083ec5
	.xword	0x09b256d6d57a1b02
	.xword	0xb65eb69d0e3425d6
	.xword	0x4bd6c5cb3dbdcba9
	.xword	0x1e0c083a1bcd9e00
	.xword	0x5fbc4f3525d97022
	.xword	0x8371079f7a8c61ea
	.xword	0xa0e5ae92f59ddf9f
	.xword	0xaf68a9fbbed099e1
	.xword	0xddf123d0ba1d02d4
	.xword	0xd18ea7d3c52497a4
	.xword	0xf57b4f01e7137fc6
	.xword	0x52a9697065055cb0
	.xword	0x93e19a63a93561a9
	.xword	0xf4dc5ef5043593e4
	.xword	0x7033d280d4ef2a6e
	.xword	0xe662fa4ee30cef30



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
	.xword	0xcde0ef019fcd1f86
	.xword	0x88a031d8458d69a9
	.xword	0x5654d12b12ea518f
	.xword	0x6ccda40f670af918
	.xword	0x57d3f465f6766740
	.xword	0x2479f7b0041b30e1
	.xword	0x8bbae2f1788abc54
	.xword	0x04a330a7095399f8
	.xword	0xf8d4ab79992fa395
	.xword	0xba89325619709bba
	.xword	0x5afee2bf3e1af987
	.xword	0xe4d9c9c9d7eaf87f
	.xword	0x6b73f7205133de6d
	.xword	0x452f417000e505c6
	.xword	0x8e4c1d0efdbf3b9f
	.xword	0xcfde6458c7b7a629
	.xword	0x0eeb1e8e59fe1cf4
	.xword	0x29a65c4d1018877d
	.xword	0x1940f4c56c7d4186
	.xword	0x3dac515cfeee3492
	.xword	0x33cd9cbf99c6e490
	.xword	0xeb53658edc2dbcf6
	.xword	0x777c8ddf7524b58f
	.xword	0x9ec649221d8c993b
	.xword	0x1ac1c911430fc770
	.xword	0xbd30d9a46a3d555b
	.xword	0x248b5cf3041f8e7a
	.xword	0x4e8069331b21a42f
	.xword	0xda1e23c05efca6fc
	.xword	0x3a11febb1fd5afa3
	.xword	0x232d0815c6bf146b
	.xword	0xed239b5dc4ac8cb2
	.xword	0x8a8a74ed5a6ded2b
	.xword	0x08930a8f07aff790
	.xword	0x9769761e348b9538
	.xword	0x69936ab10e83098c
	.xword	0xef3bc57cab3419b0
	.xword	0xb53db415b4f06ffc
	.xword	0x9dd7599ea77798e3
	.xword	0xfef29c1a0824a46d
	.xword	0x23bd380bec433ace
	.xword	0x4c270abb50ceda04
	.xword	0x3b17257036b87a94
	.xword	0x6dcbf904ec6280c9
	.xword	0x4a3721a139eabf34
	.xword	0x7e057f19cbc1f462
	.xword	0xfbd76c6b2cd50337
	.xword	0x35a0decd7f13279c
	.xword	0x1de34a5881604de6
	.xword	0x8c5420c9b1159e85
	.xword	0x916f6ea0b4360750
	.xword	0x3143c021348b2ea0
	.xword	0xcf627d276fdaa6e2
	.xword	0xcdff5b7df8015721
	.xword	0xcab80624cf2b7a43
	.xword	0x37149407168567de
	.xword	0x5528e722906ac0ad
	.xword	0x70d977234acd1253
	.xword	0x67c1eaf428bf2820
	.xword	0xb421e41fe9a21ce1
	.xword	0x96494b7e88c2a9b9
	.xword	0x2b38b3b4706940a7
	.xword	0xd551d1f32c5cba2e
	.xword	0xc52b719b759cbc82
	.xword	0x580ced67604c5bbe
	.xword	0x39aca30e20b05ce8
	.xword	0xbd7f4456993aea8a
	.xword	0x0a630a54f01f8dd5
	.xword	0x7896dc2cb668f721
	.xword	0x4894b96c4fd77d4c
	.xword	0x6377c32298390bea
	.xword	0xc73a361a9bf91fb3
	.xword	0xe85bfcaac3d50a37
	.xword	0xd51440b8768973f6
	.xword	0x60d5b9293f03e7ae
	.xword	0xfe221c810ad07e6e
	.xword	0x03fcab704313fc11
	.xword	0xaacc3db798e0ac79
	.xword	0x590da66030cf1149
	.xword	0x80dacb9c908dfa0e
	.xword	0x9f586c2adef340a7
	.xword	0xeb814e8db5857370
	.xword	0x131cb6c938fe47a5
	.xword	0x353d596e7c408aaa
	.xword	0x0eecd2cc0d13afd3
	.xword	0xac65af1d41d77942
	.xword	0xbad2183b3b56e6c9
	.xword	0x0c5baf7a21cd443e
	.xword	0x2448a58b53f1c2d9
	.xword	0xe549c7984c157c7d
	.xword	0x30d678d6103f6c5d
	.xword	0xfe095c1da1ef5658
	.xword	0xd5e1ce06605a9916
	.xword	0xa35bb191cc8561c2
	.xword	0xbb7b3ec7ac96b577
	.xword	0x7e0f406c6e2b80fb
	.xword	0x6a96908696202140
	.xword	0xafc03a60a09f9283
	.xword	0xf738b7e4aebfe83b
	.xword	0xef1379d5e5841752
	.xword	0x3f0dbc57aa6903b0
	.xword	0xdb92784213b14ee2
	.xword	0x2c4897cf11287114
	.xword	0x735b55fca8004858
	.xword	0x55108ffa0a45653a
	.xword	0x0f4cf73b62115878
	.xword	0x127bef462dbba48d
	.xword	0x2aec57f84bdebcb5
	.xword	0x963a4a1a704d4a2f
	.xword	0x8e5a2c60051e3572
	.xword	0x1b03e37509551bca
	.xword	0xc42b240e5142eb0f
	.xword	0xf0a9c8243a866d5a
	.xword	0x084e4f61bd0e0d08
	.xword	0x3d0add5f4ca9207b
	.xword	0x9d36a6930b7a24dc
	.xword	0x3d521611ee72e1a5
	.xword	0xb798ac6de66bbacc
	.xword	0xb41cd552fe7eed1e
	.xword	0xe1b41dc7aa663a02
	.xword	0x442471e86d6030b0
	.xword	0x2917d6018a39fabe
	.xword	0xd326b3cb01f85b56
	.xword	0x1e083bd74b05cbb6
	.xword	0x08f294e5b459f819
	.xword	0xd4e634767d992ec1
	.xword	0x1e3da4370127e698
	.xword	0xc6be94dd212c8dad
	.xword	0xa63e0cf19f876360
	.xword	0xc5ecf92859094bd2
	.xword	0x4b94327569d5c0e7
	.xword	0x05fa8b82cb1e35be
	.xword	0x8e04684e1a240cce
	.xword	0x79313be8cff08d3e
	.xword	0x119e1787cb360e65
	.xword	0x7a5da5e2a24962c7
	.xword	0x977f2f047f6e5263
	.xword	0x5465f06a38a0d99f
	.xword	0xefa5fa8376c7c870
	.xword	0xe7c4ccf8d3678a49
	.xword	0xbd4f87f97208ff92
	.xword	0x6cabe55ac502b94e
	.xword	0x258a9a4081051b1e
	.xword	0x3b7df66ee0efc67a
	.xword	0xa0038dd71a992e88
	.xword	0x7c4e75dba2bfa953
	.xword	0x9891fccca0132948
	.xword	0xed994cd10eab633f
	.xword	0xd88b8a6f9a3ee825
	.xword	0x7c7ef237b2bed778
	.xword	0x8066c8dcf964c877
	.xword	0x9a80b353a8cfb8ab
	.xword	0x87c3bc7998c21b95
	.xword	0xf5085a52386248ee
	.xword	0x6f3eb9cad096b659
	.xword	0x252b7ebe855ea766
	.xword	0x12ef142a3d1851d4
	.xword	0xdfa448353ad895f3
	.xword	0x038cb195353966f0
	.xword	0x55b45273dfa40316
	.xword	0x1a76978e0cfd42f1
	.xword	0x34abdefb3070564a
	.xword	0x6ffb456aa0943745
	.xword	0x02968c3780a26a6e
	.xword	0xc4c7b776de49d373
	.xword	0xe50d928a3fd3a946
	.xword	0x4360fc1f7fb4066e
	.xword	0x0a039454887ec1bf
	.xword	0xab7732a33b5db64f
	.xword	0xf2d4a7adf59015bd
	.xword	0x14ba456dbb356eb4
	.xword	0x835e4d49a0057bec
	.xword	0x202176d4105146c7
	.xword	0xee9758813416094d
	.xword	0xf3ffa1c5936ec52f
	.xword	0xf176fbc5e9d4efab
	.xword	0x9b05a514646b5459
	.xword	0xf77f4b4e4620e0fd
	.xword	0xdd8911447d889b8d
	.xword	0x9c8d03c5a5542f20
	.xword	0xe74cfe9c577c137e
	.xword	0x7b5abad2eb5a20ea
	.xword	0xfd7d722c06c83395
	.xword	0x64b2b9bd169a600d
	.xword	0x88438393af90117c
	.xword	0xb287c8dced1a8c7c
	.xword	0x3dc68d82804390a9
	.xword	0xbf939eb2d985533a
	.xword	0x1c9751cf12e3c8f8
	.xword	0x3c3e872e50f86eb4
	.xword	0xbdedff55cf154f09
	.xword	0x7d4eaf3a385a863b
	.xword	0x9960c31d199f29f1
	.xword	0x6f4a97d650b243e4
	.xword	0x72f18ae3836ba4cd
	.xword	0xc91efa8016eb951f
	.xword	0xbb707aeb2ee85064
	.xword	0x234c0ae719f09516
	.xword	0x25960d05d0195ca7
	.xword	0xaa8513708eba2f80
	.xword	0x1cc1cf65e6477702
	.xword	0xe48d8065d925ef36
	.xword	0xe31e90dd80397fb7
	.xword	0xb0ceaa32e8ddb97c
	.xword	0x4ee28206eb1673b8
	.xword	0xc29df6745262dcf6
	.xword	0x29f3910d7646fd65
	.xword	0xc95b9a4b1fabc854
	.xword	0x82733b417381bfa2
	.xword	0x4c20a566d36a6fc7
	.xword	0xfc12019d672e987d
	.xword	0x2e6a764b53f10fa6
	.xword	0x50d067a90783fda3
	.xword	0x41e44ae73c3c1085
	.xword	0xbd1b692ea9a15572
	.xword	0xdb39901d55a47e65
	.xword	0x0adebd71b8907e98
	.xword	0xf000735578eb64aa
	.xword	0x2ad87b139aa01620
	.xword	0xf247d3b17d843d28
	.xword	0x36ca21543065455f
	.xword	0x34f6b42adbb5b1f5
	.xword	0x818f0aa55d1cc802
	.xword	0x49e92994fb45163b
	.xword	0xf4a6c54df9f4a74c
	.xword	0x46ed59aa106e9976
	.xword	0xe5443dd6a81a5ba3
	.xword	0xf362057a4d538557
	.xword	0x620c10ef86677c54
	.xword	0xa5bebe778ea231b7
	.xword	0x8ede0cf6f789fc06
	.xword	0x2ce9af00229b0657
	.xword	0x2393776ed8c68d2b
	.xword	0x40148a51ef46edba
	.xword	0xabfb966bcf947ab3
	.xword	0xadf40e8ff0935a40
	.xword	0x1537138e77dea700
	.xword	0x06476f4c92cd0337
	.xword	0xe44c55383c761062
	.xword	0x3b8e077ac97d42a8
	.xword	0x021d6c2200b05b52
	.xword	0xacb4da17557f4f8a
	.xword	0x2a005e8dc17f3b77
	.xword	0x9b86e39ac4d50cbd
	.xword	0x74a5b8852a97a0aa
	.xword	0xd8128ea7be6e0946
	.xword	0xdeca74ef7ae727f9
	.xword	0x2bb6547bc7a15a82
	.xword	0x81439fe38111188e
	.xword	0xf111a99e6baaba90
	.xword	0x3d0e7051537b87f9
	.xword	0x203814dfd9a5fbdf
	.xword	0xf400b269c6b5f7c8
	.xword	0x4c355b683ae8b902
	.xword	0x74738cc9a7f3e7c3
	.xword	0xf524fc758e7cec7d



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
	.xword	0x10e403e81e7fd4a0
	.xword	0x07688564121cc801
	.xword	0xed197a7413cf10c5
	.xword	0x544240fedc83d7db
	.xword	0x3d20386e64828812
	.xword	0xe033d2624fda9cb8
	.xword	0x34ff1a6649ebb9a8
	.xword	0x0915cec906219a20
	.xword	0xbb978fc7259da1d6
	.xword	0xc226c4e95484209d
	.xword	0x7639dc615bed6e20
	.xword	0xd1972e7d36ac03ef
	.xword	0x4e7b311d49e6bfbf
	.xword	0xc67d7cfba6d69130
	.xword	0xc009dcb805b256c1
	.xword	0x67b98b790dc14d6b
	.xword	0x744a27afe153da83
	.xword	0x750e4bf3a65bf9ac
	.xword	0x4627c90348336d32
	.xword	0xccdbb2c49d4aab90
	.xword	0x6a7dcf639415a320
	.xword	0x6ef12eaa788f6ef2
	.xword	0xdb96b570e5995a78
	.xword	0x11402ea06702d831
	.xword	0x106ba1879af4e2c0
	.xword	0xcd4dbc7eb029554d
	.xword	0x3a76afa22a907ed5
	.xword	0x05e233eb481d204b
	.xword	0xc9b87d9b573241ac
	.xword	0x3da1613897e3202b
	.xword	0xb0a8af23b925575d
	.xword	0xc0d288fb4c50e768
	.xword	0x3d162d5fa3804658
	.xword	0x98954e25c3ce5e62
	.xword	0xdb121db308e21698
	.xword	0x325082a937345c32
	.xword	0x707435130e5cc97a
	.xword	0x7b63112b316b7708
	.xword	0x47abef4186aeb1d5
	.xword	0xae73cdbee2059f1e
	.xword	0x3a43d824a67f7e54
	.xword	0xae500fbb5481e90b
	.xword	0xc76d1e6948c978de
	.xword	0x4a678d035215fa3b
	.xword	0xabe7d39e813a75d6
	.xword	0x859e4b9b2601391a
	.xword	0xe3726b0a5132c186
	.xword	0x0771fd83bdc19b99
	.xword	0xa8ddf0ebfab2f910
	.xword	0x8e0a942595561a9f
	.xword	0x05481467034c6dbe
	.xword	0xc2f4968f643c71f9
	.xword	0x374893701c204a74
	.xword	0x4a81c175b52ee39e
	.xword	0xf3761b1e850e57aa
	.xword	0xfb837c6a27665be8
	.xword	0x4f6a8a8ed35e8f8b
	.xword	0xf846d1fa44186f38
	.xword	0xd0897a17edf164f5
	.xword	0xdb943df3f4428820
	.xword	0x556d66713b15e2fe
	.xword	0xb735fec5fd84a6a4
	.xword	0x88b92fe1f30c6e16
	.xword	0x583c935b9c493aef
	.xword	0x66e036d1cd3b7137
	.xword	0x98345a7cdd8d6933
	.xword	0x41941e4cdd2da87a
	.xword	0x0b16bb3e085987e9
	.xword	0xf98f4e4d2cc12398
	.xword	0x0365fdd871e947bc
	.xword	0x7c804fffd3b7a28f
	.xword	0x85f6f54249a5ca4b
	.xword	0x6fa1fdc9f465bcbf
	.xword	0x860b4a180cc7e815
	.xword	0x24e222f1481d6d19
	.xword	0x0d5436a39e00e00c
	.xword	0xd2fcb7156147137d
	.xword	0x4faaca452e4592d9
	.xword	0xb2380809479b1a39
	.xword	0x7fb6e474335fe2e8
	.xword	0xc8b0f47a27b9475d
	.xword	0x61d6de1d70ad2f6b
	.xword	0xb5a2e45fab05f89d
	.xword	0x85c1e7dcb946a2e5
	.xword	0xde498b32fb951577
	.xword	0xa937e21d2e2b219b
	.xword	0x9df4f9a5e97ee78d
	.xword	0x1504c4982d95ad4b
	.xword	0x9d3947fac9c73680
	.xword	0x59762f24dc42c2cf
	.xword	0x95fb37831fcccd27
	.xword	0x3f527610cc7b0633
	.xword	0xafe27ea762136993
	.xword	0xfa02fd44b25a9fd0
	.xword	0xa453dee219365dd6
	.xword	0xf98cd2ffaa8a1bcf
	.xword	0xba45b04d44b2771f
	.xword	0x2d4327bcfbf7795e
	.xword	0xf3a94e42ea8ea0e9
	.xword	0xaa5db9f49b4b9961
	.xword	0x5188d15e1a179078
	.xword	0x5ff425725521cc60
	.xword	0x4ff672acd302f4eb
	.xword	0x3fc3ac32a12bbb27
	.xword	0x52defec6b0e8f925
	.xword	0xc32100ca952615a7
	.xword	0x3ea4356f40c2b5f3
	.xword	0x61e425c2e7357e59
	.xword	0x1b6b429400d0adac
	.xword	0x67242b18c2e3c2aa
	.xword	0xf4b2579cef109bf1
	.xword	0xd65ed5ba78797193
	.xword	0xbfd6c06e23556496
	.xword	0x4332be297bd6c00e
	.xword	0xdc25638e315f0766
	.xword	0x6adc637f3bd2e80d
	.xword	0xfd3a5019b8c51865
	.xword	0xd31c931b8a8b127e
	.xword	0x1534ac5bac72bfb7
	.xword	0x075eab48cb22c0b3
	.xword	0x52e0fea385dff9ef
	.xword	0x78d655ea5e2768f9
	.xword	0x9703337f9dbd3057
	.xword	0x607ba7165aa7fa4e
	.xword	0xafbf8f8ebb585f07
	.xword	0x1730bb05a2401df1
	.xword	0xd20c62a398d91de4
	.xword	0xfbc1a6cd7fa819c5
	.xword	0x08786b3be0463b1f
	.xword	0xd1118ec463f82fc0
	.xword	0x521dd9b815bd0849
	.xword	0xb3d355ff296f6bb0
	.xword	0x35247183b1fc9a7e
	.xword	0xbadc6946b53babad
	.xword	0xf48c59e103a602ba
	.xword	0x860eba94f8c54b2d
	.xword	0xe24ce6dcbfa5e252
	.xword	0x1bbb2e9c6776ea10
	.xword	0x75c6c4a56fccf481
	.xword	0xad5a917069e88784
	.xword	0x2207ea04091c4b7b
	.xword	0x693292a74d16363e
	.xword	0xfcc741b485abd44b
	.xword	0xefc1673004ff66a4
	.xword	0x2774b052c7741adf
	.xword	0xdac7e259718f60e1
	.xword	0xf3a758b2bee30d8e
	.xword	0xadd3fb83f0c0b71c
	.xword	0x4d642f2bedfa3130
	.xword	0x9a57f0a17f9a7d90
	.xword	0x01c7fbdfe8f9eeb9
	.xword	0xd6088902b26f1411
	.xword	0xa336a3b75c3f4257
	.xword	0xb31810cfdfd12bda
	.xword	0x57f39cf8580e7262
	.xword	0xb85d5f7bb1b789d1
	.xword	0xbffe0a065822f066
	.xword	0x5f32d761b0c9e610
	.xword	0xc7df8d4178554286
	.xword	0x7fb9a7383e7eaa78
	.xword	0x846b02e71c4209be
	.xword	0x0c0470636df1f897
	.xword	0x29b6f11c2624669c
	.xword	0x9665cd8add939cde
	.xword	0xc6da13ee559ebd66
	.xword	0xf0ab4c2aefba1172
	.xword	0x41147dc2589feabb
	.xword	0xf092a9af4a69534a
	.xword	0x007123a1d265c25d
	.xword	0x4e7879b5858d213f
	.xword	0xb91dbf7974d951e4
	.xword	0xb4566d171082dbe5
	.xword	0xbc00a6c4de054769
	.xword	0xe8cd51ca9ebe1bac
	.xword	0x93993b62226ea257
	.xword	0x43ff01f0185d2f7a
	.xword	0xe9f04218bbbb55ca
	.xword	0x236be4dec3d3cb6e
	.xword	0xc6049684982ec03a
	.xword	0x4c93cbabd806d58a
	.xword	0xcd56787e8f5769ef
	.xword	0xf86238a997b9274c
	.xword	0xcb294e8f2957014b
	.xword	0x6eeda1aacd83d116
	.xword	0xd47bc6dc3e8eeeff
	.xword	0x8543281f8c311bae
	.xword	0x93b46a903ad65b80
	.xword	0xd6d66d265ef0c9f2
	.xword	0x46ae4a2c3a2be085
	.xword	0xe0c9570c289d62f8
	.xword	0xfd9895d2128be289
	.xword	0x9bd3200c25f8f4b1
	.xword	0xd2c276dfdaa55e67
	.xword	0xe55ab6bb62f2e853
	.xword	0x0b9b76a1675731ff
	.xword	0x639c7c9a1cf9c234
	.xword	0x49ee4a8cd889aea4
	.xword	0xd1b9b969f5254473
	.xword	0x4fcb21912b571a66
	.xword	0x6b38ecc039610049
	.xword	0x54e18ad960d324f1
	.xword	0xd4beb11957ce4418
	.xword	0xff5b0fb54ad87b03
	.xword	0xe5be7777bc5b9e3b
	.xword	0xf0983fffa8af9caf
	.xword	0x0b75b3e44a8063f0
	.xword	0xbbcbbc5b3878c73f
	.xword	0x1eda93197b4e9e0e
	.xword	0x20e9215e0be19219
	.xword	0x2e3ebd2dee9e61d0
	.xword	0x12f14d5fdd0c5bde
	.xword	0x2e9559b1afa14738
	.xword	0x33860ecb8ae9aaeb
	.xword	0x229436fc4b14986b
	.xword	0x5a3fce0ae3955d1c
	.xword	0x5e8460c691856f40
	.xword	0x32be92630ba6861d
	.xword	0x6881966b6eb86147
	.xword	0x0ce93185b8de4b21
	.xword	0x5ceaa4f493d03fc8
	.xword	0xc9deceac81ca6005
	.xword	0x17563eb5994dfd62
	.xword	0xccc5ffa8b209812d
	.xword	0x11f06c449a5c7e71
	.xword	0x8308dfcb3e4b4e16
	.xword	0xa7bd057bb1994322
	.xword	0xbc9400e47a1ec8e1
	.xword	0x501d0928fcd02b86
	.xword	0xfb1e4a26f2417127
	.xword	0x2815ef5de36051e4
	.xword	0xe9c575d515295df2
	.xword	0xdfc20cc057061d3c
	.xword	0xd8ac5af762218ec9
	.xword	0xffc04ca952277ee3
	.xword	0x3f669c2441d55247
	.xword	0x810ecd8dc03d422b
	.xword	0x8085530cab5c8190
	.xword	0xad67078663f2ac4d
	.xword	0x820e97343b652e62
	.xword	0x642bb37ec2bd10e8
	.xword	0x132d35b16c26032a
	.xword	0x5e235008a5d12f41
	.xword	0x56ed4072919e33b1
	.xword	0x44ed2674a5f7faab
	.xword	0x93b778cc78225cb3
	.xword	0x903a3c6375388d0c
	.xword	0x491b9e8b1cd3375d
	.xword	0xb4b3163125167fb0
	.xword	0xac692bac1f98b8fe
	.xword	0x80d6243491f54d4d
	.xword	0x2017d778215ea9c7
	.xword	0xe7f6970ac39d8534
	.xword	0x306d39730a72c74c
	.xword	0x7351aa593c115c89
	.xword	0xd458eb76ab5270d2
	.xword	0xc5331174657d18b6



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
	.xword	0x8c3a01a6f3b083c3
	.xword	0x84ce4a11221ee6c4
	.xword	0x6e51487e1fe3f818
	.xword	0xa6f62a9e57ec5eca
	.xword	0xcc9f7d9355e6b596
	.xword	0xf52578604730b42d
	.xword	0x940004eea1250ae0
	.xword	0x486383c32d2d1cb6
	.xword	0x69c56df3fd6939ca
	.xword	0x9331e2a2bf9ec07e
	.xword	0x060f9465457cc5e5
	.xword	0x2b1be707064688d9
	.xword	0xdee4d69646d08f27
	.xword	0x2d284ac13da95d4f
	.xword	0xd06df30d74fda41c
	.xword	0x9b3d73922608645f
	.xword	0x929e44365114a439
	.xword	0x4c587350dc28e58a
	.xword	0x16b63a0b4c324b3b
	.xword	0xe7daf5475c4b19bd
	.xword	0x582d56b873dd420a
	.xword	0xd77538552d99b368
	.xword	0xc73e7cf6a449f733
	.xword	0x317adb398a4f36cd
	.xword	0xd4827f2fde4fa51b
	.xword	0x91165506f4da1040
	.xword	0xa0b1c37dfe74e5fd
	.xword	0xf5ec5df120bff641
	.xword	0xe57e400c7bdc373f
	.xword	0xee143b1803e24206
	.xword	0x2c8e2cd87992bd83
	.xword	0x8feda8abaed1282d
	.xword	0x1414a6c04cd3ebae
	.xword	0x27a36793726c5caf
	.xword	0x7fbde6baaa45e073
	.xword	0xbc043909c48ebf96
	.xword	0xf8e3e122a947891c
	.xword	0x4be0775105ada82d
	.xword	0xf5b6682932ae4485
	.xword	0xd5e45832d14a2ba5
	.xword	0xea4aa6bf24277fec
	.xword	0xfbb8e8b7afc10426
	.xword	0x8969ffa04977645e
	.xword	0x6a5f4021df16febc
	.xword	0x6670cfb7592e4b2d
	.xword	0xd87040f828bcfb65
	.xword	0xc33030a8e20fa1e1
	.xword	0x2fd7a84115dad4be
	.xword	0xfc283feb63c91276
	.xword	0xdef802c6d063611b
	.xword	0x76e67ad0b62d074d
	.xword	0x5941da1fe0c64800
	.xword	0x3d9b86979b4baf22
	.xword	0x6597b89b417cda12
	.xword	0xea435dd1fcbce606
	.xword	0xd96021e9e2e0b572
	.xword	0x5a2b9eba2d0ac437
	.xword	0xe70f2aeb1535f6c2
	.xword	0x2c7e983f7237a3d8
	.xword	0x26dc3c4b136d880d
	.xword	0xc30609513b8fe8a2
	.xword	0x066a239c74b4a581
	.xword	0x082e88b79b149879
	.xword	0x460ef19899c85b5f
	.xword	0xb1d967080f65ff85
	.xword	0x6da2234d3c60ac0f
	.xword	0x309aab912daa429a
	.xword	0xa00162f44e7ca39e
	.xword	0xa212c4e34b946487
	.xword	0xf7943acdd8ae36bf
	.xword	0xccac45e094e6a607
	.xword	0x933de3f6e0144a73
	.xword	0x6a745b1798ca7f78
	.xword	0xa42a9e38092b5a5e
	.xword	0xa3ccc41db73e7a46
	.xword	0xa4dcbcdfcaf7c62e
	.xword	0xa5b076a551e49b32
	.xword	0xbf6af3b2510ad140
	.xword	0xc750056960365240
	.xword	0x8aaaea96dd1f3566
	.xword	0x7a863be13803af0e
	.xword	0x054b78d78507903a
	.xword	0x8b4ae759386e18f5
	.xword	0x01cda14867261929
	.xword	0xcd23974d20a19b52
	.xword	0x3b4f637d494cb461
	.xword	0xe8470b6cb2d31f53
	.xword	0x09fe91ab68c6a2bd
	.xword	0xc973047c5aab0789
	.xword	0x4d75d3fc000c0864
	.xword	0xa39532087bd55f01
	.xword	0x1b09ca0903e06f96
	.xword	0x06003e2bb42d516f
	.xword	0x5cf48f5ff47c6a0f
	.xword	0x86433a1c26c1bdf5
	.xword	0x2c36b0d3c8fe704b
	.xword	0x50ac2af4671c1300
	.xword	0x9ed467f0e7318659
	.xword	0x388546432dd9dcca
	.xword	0xb29b42d5db5c92be
	.xword	0xdb6fa304372f9c25
	.xword	0x72159d569fca0fd1
	.xword	0x7c8ebc55cdfe59ac
	.xword	0xb3e726123ddb91f3
	.xword	0xcdad44b2f7f3d0f7
	.xword	0x1cb354d6ac82ae0b
	.xword	0x74063a49072594d0
	.xword	0x82f86aac40d17c2e
	.xword	0xef4791f8813c12a0
	.xword	0x7b653abb8097a8df
	.xword	0xe49093a2968ccbec
	.xword	0x5f2907094c45a831
	.xword	0x3147ca28ddc40810
	.xword	0x34467f65a18ac4b3
	.xword	0x59530e2a8371a3f2
	.xword	0x9dd8ca9db7445eaa
	.xword	0xa63c593c25763487
	.xword	0x54110554a78d30a0
	.xword	0x8523478cb8ee219d
	.xword	0xc9b0ae1918d0ac54
	.xword	0x80ba1176c98b48be
	.xword	0x8b703bf49331962f
	.xword	0x6c7ddc319b1df3e6
	.xword	0x8f0d6d15c06843c8
	.xword	0x917a8b862ca867e4
	.xword	0xadb92e62e6b7100b
	.xword	0xea638b925b11b49e
	.xword	0x1d0e592832c34d0d
	.xword	0x0485de2b1d6486d4
	.xword	0xdc947d4c51ec5a40
	.xword	0x6bf8feba77b7cac1
	.xword	0x6e633c3cedfd92ac
	.xword	0x9f62e62dbbc23b64
	.xword	0xd07f5985f139e006
	.xword	0xcdc0bd6786c18608
	.xword	0xcb2783f6662f9c77
	.xword	0xad6db7cc1725ac6d
	.xword	0x3c5a27683ed336a1
	.xword	0x7aa88b97ac43b9c6
	.xword	0x967fe16181f07a58
	.xword	0x51b5e75fb90f7fc1
	.xword	0x269765302915787b
	.xword	0xfb2836b009c7b9e3
	.xword	0x1e4625209b2e3292
	.xword	0x4e51de08523d08c0
	.xword	0xe20c5b00a46f585c
	.xword	0x2411041ac0faa84a
	.xword	0x18ae1bded77fe81e
	.xword	0xd44ed939eb846a6b
	.xword	0x6e6636212363a3da
	.xword	0x7c6be0f59e1fd99c
	.xword	0xdef5c48ea79e61bb
	.xword	0xb362a668ac54f404
	.xword	0x60075950e7a9f470
	.xword	0x6202abd6ebdd0b81
	.xword	0xb77dd2d4629bd02b
	.xword	0x1e4955ec1c53a735
	.xword	0xd994da8e54687243
	.xword	0xb2441064e34f872d
	.xword	0x575c29497e1e9f38
	.xword	0x7d7a48e884e7ba0c
	.xword	0xf7c3e12ed9886726
	.xword	0x5b95cfe82679d029
	.xword	0x347884cf7b7e0f12
	.xword	0xe268978ea8ddb53b
	.xword	0x8c8cf986bd4f1080
	.xword	0x42fb82dc5d70fa57
	.xword	0x7be9282e11c5dc97
	.xword	0x6b0930f4af7d592e
	.xword	0x44c9a64a1220149c
	.xword	0xa5c4e11994d8e2cf
	.xword	0xdd32fc5707084b90
	.xword	0xccc4a4c7ae063e8e
	.xword	0x18a95e56b3de463d
	.xword	0x83ac236e2adecf92
	.xword	0x6f7b7ca4903ee2a9
	.xword	0xa355051cefa1b1a6
	.xword	0x14389ee76dfd95e2
	.xword	0xaea88b74324ef55f
	.xword	0xd385190911141b38
	.xword	0x7ffeadef99006fb0
	.xword	0x6738ae0a74759b9c
	.xword	0xd591726e2305fad4
	.xword	0x6e1dfd0ff77bef15
	.xword	0x5708a965d6c22cf5
	.xword	0xc95d4a8dc91f5f2d
	.xword	0x7c0871b8667c36bd
	.xword	0xf33802c16b73e41b
	.xword	0xf7a1f98e4764e990
	.xword	0xdf2ad99a23ba7e44
	.xword	0x7bb2343f33118369
	.xword	0x5730807b4dd4b119
	.xword	0x4f165ac1c42095c3
	.xword	0xbdc74fdfa35ca24e
	.xword	0xb230ce8d73c977fa
	.xword	0x58ddb379ebc91073
	.xword	0xa0f2f956c566f72f
	.xword	0x2d8f368e0fcb774d
	.xword	0x1d55298b19864004
	.xword	0xa636edfa1b5070cd
	.xword	0x634a1b4491dd8d1f
	.xword	0x260b04edf5ae0483
	.xword	0x4a470ac914ee5bb4
	.xword	0xe8276918c35e400d
	.xword	0x556aa5a825815542
	.xword	0x27dac763b5700400
	.xword	0x7593ca1e90d9b623
	.xword	0xebb42724e9e07fe9
	.xword	0xf87a20e9cce783ad
	.xword	0x53f3f2903c41fd19
	.xword	0xdbec3dbf4f8a2f4c
	.xword	0xf690c376bdb049a1
	.xword	0x19d129387b38fb15
	.xword	0x50d600f856514777
	.xword	0xaee68af3c7db7592
	.xword	0x6f2edaa578a6c2f2
	.xword	0x4814312af607ef29
	.xword	0x99bb008219e18834
	.xword	0x3ca7b821befa0b2c
	.xword	0x9bfb4ed88f17f05a
	.xword	0xa0c4c2d3cfccc76d
	.xword	0x9d177db49c824725
	.xword	0xce9a2ba30bb054f0
	.xword	0xa765d0333900a44f
	.xword	0x920c6343788e3c04
	.xword	0xa736b902ab58fceb
	.xword	0x52ba4a35577fccd4
	.xword	0xf1ae68b9af25a3f0
	.xword	0xcacbe9fc05f2b46d
	.xword	0x6073dafb84acc7a4
	.xword	0xf97fab55f243825b
	.xword	0x3134b7a4e87fa1a4
	.xword	0xb72a502a6209b1a1
	.xword	0x6058a4312cfe7da4
	.xword	0x529123eb1d15c7cd
	.xword	0xc0966ab5ea7c4a98
	.xword	0xc49e60e5d22f6288
	.xword	0x78b2285bac27824b
	.xword	0x1326fc16bc707d06
	.xword	0x7322837967aebf7f
	.xword	0x4f2c8ad0f71dda1a
	.xword	0x294d3d0fedd20fe0
	.xword	0x69f01a1dcd07bdf5
	.xword	0xcbbf928316962dda
	.xword	0xc8184a36355a66f8
	.xword	0x9f8d0127daa97d04
	.xword	0x942a7dc457a1a05a
	.xword	0xe92b7e6aa285cb86
	.xword	0x4655671e7eddf7ad
	.xword	0xc717346b2032d487
	.xword	0x898094bf333cfdc7
	.xword	0xa217a5ef5df969f9
	.xword	0xcd59acfcacb13476
	.xword	0x4fc37b69442c2724
	.xword	0x6cde7d7397e652fd
	.xword	0x90d5e6f1d99d197f



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
	.xword	0x70de1dfa19b1c8ef
	.xword	0x2ccb5c9d1a699ce7
	.xword	0x0c1f4d4fd184be45
	.xword	0x74146f6a014ff8dd
	.xword	0x9683283270ab3fe6
	.xword	0x72b743668586ea93
	.xword	0x421b4f44c7890e31
	.xword	0x16542ffb4f6b2019
	.xword	0x0553b3b415d63fd9
	.xword	0xa6362dbb0ec5d0d4
	.xword	0xd0f7c5161730efec
	.xword	0xbc4b384590ac9a12
	.xword	0x8c6c8f3ff25a96fb
	.xword	0x35ed0a07acacf596
	.xword	0xac025d9fccfe204c
	.xword	0x0e5c90c6c3d37adc
	.xword	0x2a389b1ad413df51
	.xword	0x8877bb9b5568e98c
	.xword	0x3d5792839327a997
	.xword	0x8952335269e55f73
	.xword	0x7050bbb00ba79f82
	.xword	0xadf237e98e062dd0
	.xword	0x566a052c0ac0144f
	.xword	0x678d68e1cd164c14
	.xword	0xdc590e90f179fbd2
	.xword	0xffcb95d4788c846b
	.xword	0xc73aba35ddba1979
	.xword	0x5394f20d3e6ba785
	.xword	0x758f1aca11d352be
	.xword	0x3356132ac888aaef
	.xword	0xf8dc1e4981416caf
	.xword	0xcd3b9cc1b7341dc2
	.xword	0x97d180bc43a7c440
	.xword	0xa844bd82740dbf7e
	.xword	0x71175b5698ad4dcf
	.xword	0x1c4eb76d3013281c
	.xword	0x2c592b515f4cf4af
	.xword	0xd96c93de74e7b3ce
	.xword	0xd319796d512c5f4c
	.xword	0x889392d2d7a8c8eb
	.xword	0x0bf141bd5f23b868
	.xword	0x2d09d25c83f60d99
	.xword	0x0704e70b5c065d9c
	.xword	0xad7c9f51b8b12c50
	.xword	0x1e896c0b9fe1291d
	.xword	0x487101bced66033b
	.xword	0xe6bd518596d65b61
	.xword	0x44adc54a6858871c
	.xword	0xa347ba83ac511e9f
	.xword	0xe929f007133fadeb
	.xword	0x78c56282300ed059
	.xword	0x984538f202694312
	.xword	0xafd28ab3e9b772d8
	.xword	0x2320b806ba463aec
	.xword	0x509110f9299833f6
	.xword	0x18b1f03888981c67
	.xword	0x78d74f48fd25f883
	.xword	0xe536d152018dd16a
	.xword	0x16df6ffb55b27a4d
	.xword	0x40d9272bc73a4991
	.xword	0x9c019a02e0855427
	.xword	0x2518975b633f614b
	.xword	0x4ed349500ed7b65c
	.xword	0x3eb1695480ecbd24
	.xword	0x412fffa53494d337
	.xword	0xf3fb0559faa9e7b4
	.xword	0xc5a6cba8213e83b3
	.xword	0x23d1e49676e1cc62
	.xword	0x51624c885c8870c3
	.xword	0xe1f38b352d98c5d9
	.xword	0x790102565da4b4ef
	.xword	0x1e7e72f92175fb54
	.xword	0x7c40ec5f6465ec02
	.xword	0xf4e3ea6e103de45a
	.xword	0xbae3c5320dba07ae
	.xword	0x2791fa5e8f243a5c
	.xword	0x9ef77fc1e0cdd84b
	.xword	0xc79db65964be5f1f
	.xword	0xc776ca2722bfc866
	.xword	0x43dd7c2bb8710333
	.xword	0xba97f1c14161f3a5
	.xword	0x4b29565d07128f3b
	.xword	0x79cfd9f28fe5ccd3
	.xword	0x9c50e4c799a5c09b
	.xword	0xca7231cf52b6a977
	.xword	0x32ec6bc4cafbdc99
	.xword	0x24db02bde6631ad4
	.xword	0x4922d9789248e654
	.xword	0xc54e7333d003eaec
	.xword	0xf19b7bcf3e3b0c09
	.xword	0x1a6146203ffd9224
	.xword	0x5b251200394a0ca9
	.xword	0xa3ccdc3cef0098cd
	.xword	0x52118aad6103560d
	.xword	0xdab4e066b720b9ee
	.xword	0xa600a3ddbee2013a
	.xword	0x297afaaae270cd4b
	.xword	0x93b4b0664d0cc9e3
	.xword	0xd46695bd3615fcfc
	.xword	0xee28c118a95c5ef4
	.xword	0xb1245119f578a648
	.xword	0x0e76d76f4bc911bf
	.xword	0xf97010ce9353fdac
	.xword	0x66dfcc3099043914
	.xword	0x383dfd35ce4b4bf4
	.xword	0x2f44fa70382b0126
	.xword	0xdd6e7bfd6bc38645
	.xword	0xe74ad44c8c2dd3bc
	.xword	0x54da3ce17f7db450
	.xword	0x0162eeffc325cb4e
	.xword	0xeae4c591e637a62c
	.xword	0x301467c82f2d7368
	.xword	0x2387649b2990f3c6
	.xword	0x6d1b2627d7667565
	.xword	0xac1cbdb2a6270093
	.xword	0x1fc1db09b846443a
	.xword	0x268416a9fb849ff1
	.xword	0x59ccd6dad7600daa
	.xword	0xcaec75e61ea07871
	.xword	0x918a962d64c8b2c4
	.xword	0xaf69f84ff91b2f1d
	.xword	0xf7dce389629fc831
	.xword	0x3439b9aae3e04533
	.xword	0xcedd46323b8990a6
	.xword	0x66a7359e23b63720
	.xword	0x0e440f2242652c56
	.xword	0xe21019926fa3ac9b
	.xword	0x123c777080eac636
	.xword	0xc132c6548bf077e3
	.xword	0xa714c64c8941cefb
	.xword	0x683f30da5942a891
	.xword	0x13ce0cc5ce103502
	.xword	0xec1fe5854d19857c
	.xword	0x03bdd5554190ae2c
	.xword	0xf842ae709e194c32
	.xword	0xe7baff6bdd23796c
	.xword	0x146cd14a5770fd89
	.xword	0x2a040e1ebcdd9ef0
	.xword	0x33d7ce85c5d9c3e1
	.xword	0xe6501361ce1847c6
	.xword	0x6d6c97c9bb10e22a
	.xword	0x8ede13c72be0520f
	.xword	0xb3f189d5f547db91
	.xword	0x21a2e1c55a91cd84
	.xword	0x1fe77ad4b40c746d
	.xword	0x6284720651e9cc49
	.xword	0x622e1a5aaad588b3
	.xword	0xff2657cfc59a1efe
	.xword	0x2b27af19e2523853
	.xword	0xf7aa14e62af2ce81
	.xword	0x717cbe313f7b0e72
	.xword	0xd3b0b46bb42f8b5e
	.xword	0x4126c7bfa6b43cd7
	.xword	0x61dfda44c04dd857
	.xword	0x50fe82286ce3d3ce
	.xword	0x7c79e1cf54d0b4b5
	.xword	0x8ebb95756a2ac45c
	.xword	0x5d293afbe694365f
	.xword	0x0cca0c5083457c6e
	.xword	0x20b7ec90f515a248
	.xword	0x00992d8c54657af1
	.xword	0x307da2fd648b92ca
	.xword	0x2b6397bf625958ba
	.xword	0x8c439a5811f45219
	.xword	0x9ebc990638881dd2
	.xword	0x830d61c3fd51f137
	.xword	0x08a5b27d7a288ec3
	.xword	0x7219306240b511a6
	.xword	0xf87d4fc4ba00a0ab
	.xword	0xaa4513de417e7c7f
	.xword	0x2f270e2ef6d3f1bc
	.xword	0x26910988b64cff35
	.xword	0x3b32adc2a55d402c
	.xword	0x390cc1922559e8f7
	.xword	0x38d39b93b9f9676f
	.xword	0x2e0bb20af6e2333e
	.xword	0x8fd5550879388329
	.xword	0xe548738e73187513
	.xword	0x63561c1f0eeead4d
	.xword	0x65f213f763229164
	.xword	0xa4704213febd01f9
	.xword	0x57705fe696b31d62
	.xword	0xca776dc4f2f1d3ac
	.xword	0xa0766e16c535956d
	.xword	0x1ceb437d3f5a41fe
	.xword	0x4ad93f31080957d1
	.xword	0xb1329a449a4e71d2
	.xword	0x73e2f85cdecddc63
	.xword	0xcac3c9142c439486
	.xword	0x34883ede5bbd1edd
	.xword	0x209b5230f3d1512a
	.xword	0x66d75df76717be03
	.xword	0x0068fe9627e235c7
	.xword	0xd3c0cc9eb7b36a85
	.xword	0xafad73025415dd90
	.xword	0x3847ec31cf4c8c8c
	.xword	0x00fcd56f341c3662
	.xword	0xab982f15bba0c394
	.xword	0xbf2c5b7f92e2ea57
	.xword	0x8c59ced19e37fb52
	.xword	0x07a014b6fe988655
	.xword	0x1a7e0d3fbd4ea292
	.xword	0xe17f825eb83df8e1
	.xword	0x80ee32c6c5265818
	.xword	0x08d7de7b0d385208
	.xword	0xda85a7b0b62e922c
	.xword	0xb4445aada9a96197
	.xword	0x24b8959778391f0b
	.xword	0x01d8a9fe2a6fd81e
	.xword	0xcc0bad55a4af4d9b
	.xword	0x3f5e37cf85ca3841
	.xword	0x98a0d2bd46be2e43
	.xword	0x73b188f233ecf895
	.xword	0x7f52ff53547e17c1
	.xword	0x209f81ed5762e139
	.xword	0xad31a7531d0228b7
	.xword	0x4a614c9fc4e40fbd
	.xword	0x3b7a73df7e0df028
	.xword	0xab88e4a548d05d79
	.xword	0xf334422624f52e29
	.xword	0x6142f74042a08318
	.xword	0xdd161efabdefbca9
	.xword	0x1bca1f8fa6f983b2
	.xword	0x07033dea40c57bcc
	.xword	0x82810d7a9d9c07e8
	.xword	0x1dbdb3dd5038ce04
	.xword	0x606b7ab82eb684cb
	.xword	0x0ed63686e0328cc4
	.xword	0xc8f578968d729a2a
	.xword	0xf2ca55cd7460ea78
	.xword	0x7bb499729b81814d
	.xword	0xec130e161d944ffb
	.xword	0x51d6e9693b204cb2
	.xword	0xd68bebe1476cb613
	.xword	0x3a27bcf19657d100
	.xword	0x02998bb559f998cc
	.xword	0x03fcf49994d8042b
	.xword	0xfa5483eb35918f0c
	.xword	0xa274f2c41128f1ab
	.xword	0x7f0240cc8ba8f4b2
	.xword	0x7dc5ae0bb32bebb3
	.xword	0x46d276a747fb0378
	.xword	0xd4fd1bdbb3303e1e
	.xword	0x54d496d0ab62a218
	.xword	0x25090eac741cce6d
	.xword	0xd74d5b17e8892e3c
	.xword	0x58a02e2d2063a78e
	.xword	0x1f9c3013dffb0b8f
	.xword	0x50cbeffc9097b96b
	.xword	0x7ebe24e61b714376
	.xword	0xf2f92da583706610
	.xword	0x81ebb79aa1e56fce
	.xword	0xebfea371362bce93
	.xword	0xa259f243ebeacbb2
	.xword	0x8fded3790bc13f56
	.xword	0x8b72945c9f4475ba



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
	.xword	0xda36a8e860668077
	.xword	0x5a3ccf29604cdf5e
	.xword	0x5a3398b7a47bfd38
	.xword	0x7647abc0ae0f8e2e
	.xword	0x82eb9feb5b561d16
	.xword	0x1872b1efba4f18d1
	.xword	0x01c2356f73a24ee9
	.xword	0xda3f6333a11971b6
	.xword	0x2c7e8b0b2c0afe6d
	.xword	0x0ecf72f91377a388
	.xword	0xab29287e12dee1b1
	.xword	0x27b6be6ce3f7cbda
	.xword	0x10f97b8b10248c5c
	.xword	0x43a11407b7090fb8
	.xword	0x7f370ae935ab564c
	.xword	0x8a778afaaffa5524
	.xword	0x4f311f5cc4ddfa46
	.xword	0x9463e1c6ddea7a45
	.xword	0x155cd72419ca5609
	.xword	0xbde97040d3036815
	.xword	0x127249e5036e5cf8
	.xword	0xf7d28a3e71d2b6c5
	.xword	0x9078b84866a736c6
	.xword	0x0ee5ccafdb5bdebd
	.xword	0xd76bd943d2c8ce10
	.xword	0xc479c2f803dc05a9
	.xword	0xc7d65531283b7aef
	.xword	0x9ed9e5960145f7b5
	.xword	0x27db095a461b06b9
	.xword	0xa40541aa3199edca
	.xword	0x0f452da9fe9417a9
	.xword	0xfa40e520d474d1fd
	.xword	0xe822b577d5f24bb2
	.xword	0xfd9c3f5239dae379
	.xword	0x591e1be59b57ddb3
	.xword	0x5fc6f3f69bc302dc
	.xword	0x06669a4326f89dbf
	.xword	0x43fccbace38e6936
	.xword	0xc2098884a7f1e708
	.xword	0x5c07ffd2a4b299de
	.xword	0x937b68b1e778677b
	.xword	0x10b01a0a7be08ca8
	.xword	0xa87b838018e3c15c
	.xword	0x1931f1f9dc2141a5
	.xword	0xa62c87276d9b250d
	.xword	0x560c9df5bd8e4441
	.xword	0xb480ec8ac875773d
	.xword	0x2d7208d8526b0d7c
	.xword	0x1964c3c459f58998
	.xword	0xb23d701000da3166
	.xword	0xa67b39310da8cee2
	.xword	0xfc2a74b0d25340e3
	.xword	0x0e88e8eca5082841
	.xword	0x0e229cf0e1440fb6
	.xword	0xd273bc2f61a80ded
	.xword	0x6534fa81827b051a
	.xword	0xd3d39aea70548c27
	.xword	0xadb45db7ef53584a
	.xword	0x8473c71701b90a55
	.xword	0x8fa783ab5fa20497
	.xword	0xc062f829ef53b0b5
	.xword	0x8a95aff7f54a0cea
	.xword	0x08ddf90a8d4dd886
	.xword	0x3e65c642711ebbee
	.xword	0xe88493ed4c4195a6
	.xword	0x55a5e39a28d330fa
	.xword	0x2f121e575819ca91
	.xword	0x9e55b60c10ae95c4
	.xword	0xe8f11d3d4f083788
	.xword	0x5f0bdb47201c5829
	.xword	0xd548601512123811
	.xword	0x5273317f8a47eb80
	.xword	0x9c9ba78f9b99348c
	.xword	0x47621616512bc080
	.xword	0x61911e69e3cdfb92
	.xword	0x29c3aab3a33f53f5
	.xword	0xdfdcf5e97b3c1689
	.xword	0x74cab3a2db367114
	.xword	0x132e5af441ce5ed0
	.xword	0x1defeda6f5d0fb48
	.xword	0x3cc7b3e021795e87
	.xword	0xea68730954d63168
	.xword	0xebb384f2173e8b3a
	.xword	0x640f86c2795769e9
	.xword	0x9435bc43b872a786
	.xword	0x0bb350e85528be35
	.xword	0xfa1fb40fef28d01b
	.xword	0xd8b2cd19eb312dbf
	.xword	0xdf4f28a93a70a768
	.xword	0x3f668fcefe94cb54
	.xword	0x122581a87cb54ff8
	.xword	0xce363e795a1cab10
	.xword	0x75995af848fb1657
	.xword	0x44e066d15ca4b362
	.xword	0x2f981055c0769127
	.xword	0xac51154f064e53ad
	.xword	0x26b109a64da3fed8
	.xword	0x6a18cfc9a161606a
	.xword	0x4e6a3744be482134
	.xword	0xea8311492b791bcc
	.xword	0xbc9316e60e946b82
	.xword	0x44c2b9b672367624
	.xword	0xe7c4e1c210b5985f
	.xword	0x0051d49fa2fd8fc3
	.xword	0x2d47b11d84a7d161
	.xword	0x14a9cc6de3c8ae95
	.xword	0xf48eb28edd6a6e0c
	.xword	0x53d07f31c00479e0
	.xword	0x8fc686c9c5b65802
	.xword	0x0e59aca3369990ed
	.xword	0x12cd1898217a3777
	.xword	0x33b2616aafa44393
	.xword	0xfa478789cd0d6254
	.xword	0x591e23e977ebdcdf
	.xword	0x0f4e1c473ac383ed
	.xword	0x5b408604ab3fd6d8
	.xword	0x4ee84d7e0b74667d
	.xword	0xaa561c4496dcc238
	.xword	0x55b06b4a8aec9bfe
	.xword	0xbadaf07869e85d79
	.xword	0xb68483c930b67d68
	.xword	0xfe83dd1d37493423
	.xword	0x2f069c5d52ac7a90
	.xword	0xae76be8426ff08f2
	.xword	0x1aa9d0fda76f852b
	.xword	0x9cdd68c22c590318
	.xword	0x8a52733b4a6bd85e
	.xword	0xe493983c7c10ea39
	.xword	0x7f536ea9d4a08942
	.xword	0x24320cefa237c750
	.xword	0x95a5996376c865ea
	.xword	0x9fe91960c825f32e
	.xword	0xa825aa28b4e12b31
	.xword	0x63a40e536dbdfd01
	.xword	0x3cc02ce20ffeed58
	.xword	0x719d6b4b82ede76a
	.xword	0xf6da14b3fe6fb35f
	.xword	0x8f15736b462eb4a8
	.xword	0x46cb914ce6cbfe00
	.xword	0x371acee350848778
	.xword	0x9508adbb3756dce9
	.xword	0x0d0b0d35f8b41de4
	.xword	0xeef21fc20d2499f5
	.xword	0xd5abc63a2285ddc5
	.xword	0x73a834b7d7b4ee35
	.xword	0x2b65ce3f093b4378
	.xword	0xd034be178cd4a0a5
	.xword	0x9bce95246d2dcb44
	.xword	0x9476d0fd65f4b7c5
	.xword	0x7a8d66fe71853ecf
	.xword	0x0825dfb5ae62631d
	.xword	0x7ffd8d72338135c6
	.xword	0xe7de8a6e91e12730
	.xword	0xfb34e5f2b4a4062c
	.xword	0x351332308fabc2ff
	.xword	0x17a171b1f26b0fa7
	.xword	0x01d382fed14b3be7
	.xword	0x618989b6936f299a
	.xword	0x0858fc3f266cb872
	.xword	0x217287f61aeb5299
	.xword	0xc315c4ba015e728a
	.xword	0xe6517e45f1850fee
	.xword	0x066ab19232720ea1
	.xword	0x6b2667b5e523627b
	.xword	0x90332a96bbf084a7
	.xword	0xe5a4ba77a8338f24
	.xword	0x86ff335d8908bd1d
	.xword	0xf68228c3c8ef94b3
	.xword	0x18eba6e2c96054dd
	.xword	0xa25e580fc4d416a4
	.xword	0x2ad9c14378c7be18
	.xword	0x424da1c06eee6c4e
	.xword	0x3842db524cf09b44
	.xword	0x05e66bee08e61b6b
	.xword	0x59f2194993234b0c
	.xword	0xa65aad8f48a5391c
	.xword	0x466eba98a943e134
	.xword	0x685b435f15fe8a02
	.xword	0x4900fa90876eefb1
	.xword	0x3eb71d2b29f94bcd
	.xword	0xd1220d10bba685b7
	.xword	0x31a41e8edbc336f2
	.xword	0xaebb46534667f74c
	.xword	0x41f31e1e994d2952
	.xword	0xe357fde7f3a06af7
	.xword	0x1b16685cb392861f
	.xword	0x217df840e3a4c9fe
	.xword	0x60d0c388454e1be2
	.xword	0x03f75c9c1710b1ab
	.xword	0x56a1c1375f074005
	.xword	0x3f6c1f135849db0c
	.xword	0x6f514165829aad2a
	.xword	0x8e99abb3f667350d
	.xword	0x3b799cac761c154f
	.xword	0xd6f6d701d0e12ab5
	.xword	0x45c2bb1f7b696f96
	.xword	0xc8260257974ccf4b
	.xword	0x6e20a32b124453ce
	.xword	0x1250de0041ccfbbe
	.xword	0xdc9359052696a821
	.xword	0x57a0b652ada7effc
	.xword	0x4f2666d1036eefc4
	.xword	0x36a307ddc4b91e4a
	.xword	0xa9f7a1bb916d524b
	.xword	0x16138446272135b8
	.xword	0x1a255afc0b1ab133
	.xword	0x2dce8d2d2d60b09d
	.xword	0x48f5922738b79bac
	.xword	0x7c67c756697dd2b9
	.xword	0xd0054c0bfb5a02fa
	.xword	0xfeec800163b00047
	.xword	0x943bb0496bbcf068
	.xword	0xc4803fdd849504b3
	.xword	0x44c5b2b4d506c71d
	.xword	0x81b1d6c5d419088d
	.xword	0xfae92dd60874704d
	.xword	0x5e226d3c47929697
	.xword	0x62021cc4097d5028
	.xword	0xbd62fab97698d069
	.xword	0x68bd76a93c9c8da0
	.xword	0x68b91186504096d9
	.xword	0x8a1f7027623e7965
	.xword	0xc344695aee299f93
	.xword	0xec0c9a8865f0e746
	.xword	0x00af32a10d8755be
	.xword	0x1230a2768bc339ff
	.xword	0x33307782237e3cff
	.xword	0xa8944b96977bcda9
	.xword	0x835549ac5822cfbe
	.xword	0x3c58d109d49f46b5
	.xword	0xed3e3fbb982a9379
	.xword	0x69c630c3f7b52e14
	.xword	0x1e600aec4523111d
	.xword	0xe6ace4d41bccc8ee
	.xword	0x47194568d2590e2b
	.xword	0xd487def980845862
	.xword	0x97fffa9d8a9d66c1
	.xword	0x03df66cd4136c548
	.xword	0x68d5f0dcf0e4bae4
	.xword	0x84eb12c7b7a90949
	.xword	0x81b9b5afaab3ce02
	.xword	0xb9ee089af14477df
	.xword	0x7e59975cc5a1a270
	.xword	0x737f24bc8fdec98e
	.xword	0xcf5999d2e1844cae
	.xword	0x4f730e64b4674419
	.xword	0xc05ab85e6dfb48ef
	.xword	0x2ee0ed2606c23433
	.xword	0x4535722415e61dd6
	.xword	0xbee58f74bf80b772
	.xword	0x3e09802976acdb7b
	.xword	0xf893a94f5df2b6d0
	.xword	0x33dc3872235615a2
	.xword	0xb15c0f74d03ebac5
	.xword	0x29b053721c8bd1f9
	.xword	0x34416d84e4dbd51b



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
	.xword	0x57690a493074318e
	.xword	0x1ee32f2c9cad38c0
	.xword	0xc31c0394aef5b6ca
	.xword	0xeb23377f80caa6f0
	.xword	0x4d9d98a02c130b87
	.xword	0xe1ba1e92a5d42d4a
	.xword	0xaba1cbe49d86527d
	.xword	0x2297b09789e74461
	.xword	0x1db546640260b4a0
	.xword	0x961f93f381edb07f
	.xword	0x2249f43b74254dfc
	.xword	0x8b97d929d1924972
	.xword	0x1f264c646bcd0b85
	.xword	0xb7bcbdb52666339e
	.xword	0x75ad440aab4f6669
	.xword	0xdb1b1473bbd2d37e
	.xword	0x1727d56956b5473a
	.xword	0x34999b34d63c303c
	.xword	0x38d19ec3bff8a5ac
	.xword	0xd024658d83db273e
	.xword	0xde597259dfaa21e3
	.xword	0x49a6d901f27725b9
	.xword	0xd223c68bff0bd699
	.xword	0x00e5ba81f666109d
	.xword	0x6494f71146cf043b
	.xword	0x3c7dd3d27f88d1ca
	.xword	0xf29f671f46e088b6
	.xword	0xe50f0ce8e064cf46
	.xword	0x4d3085fb58f7e530
	.xword	0xe2e38a8f19217af0
	.xword	0x1fe8b5035a483903
	.xword	0xde89421a5e26470e
	.xword	0x599fedcc422cc74c
	.xword	0x605d3ffc98959a84
	.xword	0x90279156533a7a99
	.xword	0x1b5a0cf3149bfdef
	.xword	0x0602bf26dbe3fcf1
	.xword	0xbbf365fb3df70dde
	.xword	0xd6f051bf88f4d5a2
	.xword	0x138846b170e29c91
	.xword	0x88ed829d746991b9
	.xword	0x0b252bac85f747ba
	.xword	0x6282e549bd7cf632
	.xword	0x2ec3049afb957d18
	.xword	0xb912d2d6f5635659
	.xword	0xb4c1cccb8dcdadcf
	.xword	0xf8e378608a0a881a
	.xword	0x4619e7e291f5f69f
	.xword	0xb8b892b4a4aea48d
	.xword	0x501eba4b802db791
	.xword	0x758d677f8cc46a07
	.xword	0xc5d22709c177b2de
	.xword	0x79e5bbe20ed6b188
	.xword	0x7eb03678d8bfb2f4
	.xword	0x19b8b86b716eacc8
	.xword	0x809805223f8604bc
	.xword	0x9b07379d2f889a13
	.xword	0x615e4362f4e36793
	.xword	0x70e8ee8b3f9aa6c3
	.xword	0x7858d7c28f0bdded
	.xword	0x942c373fa3bd474b
	.xword	0x0ffa91627539008f
	.xword	0x397fe1a006976395
	.xword	0xf85427a4d4a30839
	.xword	0xb1e10ffab5da4e6b
	.xword	0xa70098e4ce127fe3
	.xword	0xda14cdb837c3fecc
	.xword	0xd10c4fa0d0030ade
	.xword	0xaae0b4b924307072
	.xword	0x9ed491c7d023c3e4
	.xword	0xb4872ad0ad8b261c
	.xword	0x0212cf2429668f2b
	.xword	0xc807b6e4df104709
	.xword	0x2e05ae7501525f41
	.xword	0x14aa60e910e51097
	.xword	0x3fec522ef9d4409b
	.xword	0x25dc1f1ccc7a4c1b
	.xword	0x05438d32abeb7451
	.xword	0xd05531a72797f8cb
	.xword	0xe1a198c8dd3d1cea
	.xword	0xad947d668b3b5294
	.xword	0xbc265321267a2498
	.xword	0xc141f48b150690f6
	.xword	0x3a985c0692c5b362
	.xword	0x016c21f135bcb47b
	.xword	0x9278f0a36252aec7
	.xword	0xa84078dc6edc9772
	.xword	0x046861725d27c04b
	.xword	0xbd0ac8c9ca875697
	.xword	0xa839f5f5419fcac4
	.xword	0xdd339ecbda2d5ccd
	.xword	0x5b22d3417684f5b0
	.xword	0xdec8a4c1d4bedc68
	.xword	0x8bd44772492614aa
	.xword	0xdc83a7ca016091f9
	.xword	0x1a2688c448d89374
	.xword	0x06650cf7edbe73b0
	.xword	0xe94034cd9bcee744
	.xword	0xd8c79cbb77389a53
	.xword	0xe4c9b3e7cbd03bf9
	.xword	0x5058f08d39f8e561
	.xword	0x3dd1e3a56168d52d
	.xword	0xc39f7f56d05fc012
	.xword	0xdede3db9ae3ee123
	.xword	0x888a9820263c9d72
	.xword	0x6936a649d3ee71ad
	.xword	0x78dbb941cfd05fb5
	.xword	0x6b6b8305a2eb5910
	.xword	0xea56ae606cfd987e
	.xword	0x20555fc90fa3c8ab
	.xword	0xf06fa2a9da4fbc0c
	.xword	0x2b440345c4107b33
	.xword	0xb648449eeb25cab0
	.xword	0xb927b5e03ce35b83
	.xword	0xd8b9a72091fc3d89
	.xword	0x7e8e4fc174a33acc
	.xword	0x04c9e72293a7807e
	.xword	0xd0db58ec543a8a82
	.xword	0xb3bf4be142033c2a
	.xword	0x8f4c1d2202cd6212
	.xword	0x39a8b29a70843673
	.xword	0x145019cca374b381
	.xword	0x90ad5db02f271f68
	.xword	0x6bbec9a956bd2f8a
	.xword	0x09a9ae04427265e9
	.xword	0x18b7b78480b8eb60
	.xword	0x8eb271f8c7f3ba05
	.xword	0xf464d9d7dd556db4
	.xword	0x2a2f7a60e3d7e8fa
	.xword	0xd8b6d0fbbf8f92ac
	.xword	0x6c780b40ab633924
	.xword	0xbe2d804259982500
	.xword	0x3551ff267fe18cad
	.xword	0x93307b619d4dca3a
	.xword	0xe233d1ad6a45801b
	.xword	0x3f4f367d397476a1
	.xword	0x6e4f56dda7a04624
	.xword	0xcf24ee6b2fa67419
	.xword	0xbaf3fb88b161bcd3
	.xword	0x20d6cefbcae0270d
	.xword	0xdece59ba832a38fb
	.xword	0x596ba5b3544b5c6d
	.xword	0x0793def3e62a4807
	.xword	0x8a97679308ed904e
	.xword	0xaf5488f1a63ef56c
	.xword	0x504ee1b2ae6ad4c8
	.xword	0x902affd11129b430
	.xword	0x0f02261da6cb992a
	.xword	0x3cc4409e5282d1db
	.xword	0xfb265a8b1f708e45
	.xword	0x0744f62ba6883cc3
	.xword	0xee1b9ce0de39da26
	.xword	0x65495ce07f1801ce
	.xword	0x54b85e695ab569f5
	.xword	0x7ecbf64e7456a59d
	.xword	0xdbc51b6b76f129c4
	.xword	0xd1e28449f0003ee9
	.xword	0x8ef35ac710315f59
	.xword	0x2d54394506b5b21f
	.xword	0x0f623d0b310d9d48
	.xword	0x4eea38afe03f63c7
	.xword	0xec69cdd14885d058
	.xword	0x580fc7bdd647ae8a
	.xword	0x28303e5bf5efab8a
	.xword	0x7a4e7b80b4640af9
	.xword	0xeea23f5b19ac70aa
	.xword	0xf3ac3fd2f17fd77b
	.xword	0xa313305b65cae86b
	.xword	0x76a6b7837640e302
	.xword	0xb0193da7c5360dff
	.xword	0x3ad3689dbe9a2497
	.xword	0x77f45c5ee0385aa6
	.xword	0xf13f71e94bb7c3d9
	.xword	0x798332a0629f7132
	.xword	0xce29c256daef389b
	.xword	0x0054d5691d1d7603
	.xword	0x8c5649ee6605fb6e
	.xword	0x25185d0e4a3c26ad
	.xword	0x905c6af834d7ad45
	.xword	0x97de54d8a650d101
	.xword	0x77acc635d628e8d5
	.xword	0x2e3325601e9d2964
	.xword	0x94c0c8de5a8ce230
	.xword	0x0e9ae82bdd03517e
	.xword	0xc3f682f7e977842a
	.xword	0x620890852b219551
	.xword	0x7cec0c609e0e9f92
	.xword	0x90eea082b117f3f9
	.xword	0xe43725f9de5d3c67
	.xword	0xa43549d04ba2225a
	.xword	0x39d8e96beaa7d292
	.xword	0xde99354f69b66811
	.xword	0x91bb6468a87742bc
	.xword	0x4a041fd63925b8e7
	.xword	0xae7f1fe2366161e4
	.xword	0x23fcdf3fb70eb491
	.xword	0xc077d6fc49711348
	.xword	0xcfc3cbf56345e00a
	.xword	0x9bdf75ada81cdcdb
	.xword	0x89c7cfb6f1ce6d74
	.xword	0xc34fe35ad548aabf
	.xword	0x91fc2fb82502df7e
	.xword	0xa38e25c830078cb8
	.xword	0x55823f800175e073
	.xword	0xf9b02b7a65e1d7a1
	.xword	0x9c34a423f36909f9
	.xword	0x84ad5269b212b130
	.xword	0x045accefcd8cbca3
	.xword	0x361d7632fa50f3da
	.xword	0x88aefcff41ebb7ec
	.xword	0x997a9e46d8529b13
	.xword	0x0dbe0adedaa01f84
	.xword	0xbac841ede77fcd45
	.xword	0x0b651cc8ef9a4e72
	.xword	0xddd09ad2df1604b0
	.xword	0xdaf2a8f090fb6ad9
	.xword	0xcece68441364db72
	.xword	0xb9506e51186dd7b2
	.xword	0x0b6ff34ba5fceb22
	.xword	0x20162479b0707291
	.xword	0x201fa34c7c3da887
	.xword	0x9cbc0d167caafce1
	.xword	0x966ec79342090372
	.xword	0x06a4dec678f27888
	.xword	0x1841bff29ab79b4c
	.xword	0x411f62bc38bebcaf
	.xword	0x5769e9590adf3dee
	.xword	0xeba86ba608d21e03
	.xword	0x5d1bd3d2af693183
	.xword	0xdcf0d154e6843fb3
	.xword	0x3d3556fe4af2de7b
	.xword	0xbbb28e922a915542
	.xword	0x8a9d2580b87817f3
	.xword	0x9600cbe13bc3ef17
	.xword	0xe8f0c4ab0e5a2ed4
	.xword	0x6dfd91c7b9ea5498
	.xword	0xbf597be6cdc9b0b9
	.xword	0x4ce9c5518df432b1
	.xword	0x4fddc13676bc7f23
	.xword	0x8e9c755297efc303
	.xword	0xcd7e495ece1c1567
	.xword	0x6dbc5ab2f8cb8897
	.xword	0xb03023ce97fc0259
	.xword	0xc96578a8699dd644
	.xword	0x53c79f34537b32c5
	.xword	0x753079d5e10493b7
	.xword	0x188ac97bac07139c
	.xword	0x0d118003f26e6edb
	.xword	0xafec02234c852d4a
	.xword	0x6f5ce04e0d5b934d
	.xword	0x6ca6f976caa6eaae
	.xword	0xcf949e3bc6fbf6ac
	.xword	0xa8af56fba7cd0d53
	.xword	0x38670bad80dd464e
	.xword	0x6e5fa4e3a96ce8fd
	.xword	0x2820214754c35064



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
!!# #define UDATA1	1
!!# #define MY_HYP_SEC	2
!!# #define NCDATA0	3
!!# #define NCDATA1	4
!!# #define NCDATA2	5
!!# #define NCDATA3	6
!!# #define NCDATA4	7
!!# #define NCDATA5	8
!!# #define NCDATA6	9
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#   IJ_set_rvar ("diag.j", 102, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 104, wt_ld, "{30}");
!!#   IJ_set_rvar ("diag.j", 105, wt_st, "{30}");
!!#   IJ_set_rvar ("diag.j", 106, wt_bl, "{30}");
!!#   IJ_set_rvar ("diag.j", 107, wt_alu, "{3}");
!!# 
!!#   IJ_set_rvar ("diag.j", 110, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 111, Rv_Simm13, "13'b0 0000 rrrr r000");
!!#   IJ_set_rvar ("diag.j", 112, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 116, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 125, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 134, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 135, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 138, Rv_memaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 1000,"
!!#         "20'b 1110 0001 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#         !"20'b 0001 0000 rrrr 0000 0001,"
!!#         !"20'{0}");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 154, Rv_jbiaddr_pattern0,
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
!!#   IJ_set_rvar ("diag.j", 168, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0010,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 181, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0011,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 193, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0100,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 205, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0101,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 217, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0110,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 229, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0111,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 239, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 250, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 258, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 266, ijdefault, Ft_Rs1, "{6,7,9,10,11,12,13}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 267, ijdefault, Ft_Rs2, "{8}");
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Rd, "{16..23}");
!!#   !IJ_set_ropr_fld    (Rv_ldstD, Ft_Rd, "{16,18,20,22}");
!!#   IJ_set_ropr_fld    ("diag.j", 270, ijdefault, Ft_Rd, "{16,18,20,22}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 273, ijdefault, Ft_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_ropr_fld    ("diag.j", 274, ijdefault, Ft_Imm_Asi, "{0}");
!!# 
!!#   IJ_bind_file_group("diag.j", 278, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 279, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 282, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 284, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 285, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 286, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 288, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 290, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 291, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 293, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 294, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 295, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 296, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 298, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 299, sjm_5, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 302, th_M, 3, 1, Rv_rand64);
!!#   IJ_printf ("diag.j", 303, th_M, "\tmov\t0, %%r8\n");
!!# 
!!#   IJ_printf ("diag.j", 305, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n", Rv_jbiaddr_pattern0);
!!#   IJ_printf ("diag.j", 306, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n", Rv_jbiaddr_pattern1);
!!#   IJ_printf ("diag.j", 307, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n", Rv_jbiaddr_pattern2);
!!#   IJ_printf ("diag.j", 308, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n", Rv_jbiaddr_pattern3);
!!#   IJ_printf ("diag.j", 309, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n", Rv_jbiaddr_pattern4);
!!#   IJ_printf ("diag.j", 310, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n", Rv_jbiaddr_pattern5);
!!#   IJ_printf ("diag.j", 311, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n", Rv_jbiaddr_pattern6);
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
!!#   IJ_printf ("diag.j", 343, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 344, sjm_5, "\n\nBA LABEL_0\n");
!!# 
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 349,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 351,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 356,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 802, th_M, $2);
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
!!#                    IJ_printf ("diag.j", 838, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 841, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 843, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 844, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 848, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 849, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 850, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 851, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 853, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 854, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 867, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 872, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 876, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 877, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 879, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 880, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 894, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 898, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 899, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 916, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 921, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 922, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 924, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 925, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 927, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 928, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 933, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 934, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 936, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 937, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 954, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 957, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 959, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 960, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 964, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 965, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 966, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 967, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 969, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 970, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 983, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 988, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 992, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 993, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 995, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 996, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 1011, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1014, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 1016, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 1017, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1032, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 1035, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1036, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1037, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1042, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1044, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 1058, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 1064, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 1068, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 1083, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1085, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 1087, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1093, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1094, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1121, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 1127, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1128, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1131, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1133, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1142, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1144, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1162, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1168, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1173, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1175, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 1193, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1196, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1198, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1199, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1202, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1203, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1204, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1205, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1207, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1208, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1221, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1226, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1230, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1231, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1233, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1234, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1248, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1252, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1253, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1270, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1275, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1276, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1278, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1279, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1281, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1282, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1287, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1288, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1290, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1291, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1308, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1311, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1313, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1314, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1318, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1319, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1320, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1321, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1323, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1324, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1337, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1342, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1346, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1347, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1349, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1350, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1366, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1369, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1371, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1372, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1387, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1390, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1391, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1392, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1397, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1399, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1413, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1419, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1423, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1438, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1440, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1442, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1448, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1449, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1476, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1482, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1483, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1486, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1488, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1497, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1499, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1517, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1523, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1528, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1530, sjm_5, "\n");
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
!!#                    if(random()%2 == 1) {
!!#                      if(random()%2 == 1) {
!!#                       IJ_printf ("diag.j", 1574, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern0);
!!#                       IJ_printf ("diag.j", 1576, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1578, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                               Rv_jbiaddr_pattern2);
!!#                       IJ_printf ("diag.j", 1580, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1582, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern4);
!!#                       IJ_printf ("diag.j", 1584, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1586, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_jbiaddr_pattern6);
!!#                       } else { 
!!#                       IJ_printf ("diag.j", 1589, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern1);
!!#                       IJ_printf ("diag.j", 1591, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1593, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                               Rv_jbiaddr_pattern3);
!!#                       IJ_printf ("diag.j", 1595, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1597, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern5);
!!#                       IJ_printf ("diag.j", 1599, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1601, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_memaddr_pattern);
!!# 
!!#                       }
!!# 
!!#                     } else { 
!!#                      if(random()%2 == 1) {
!!#                       IJ_printf ("diag.j", 1608, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern0);
!!#                       IJ_printf ("diag.j", 1610, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_jbiaddr_pattern1);
!!#                       IJ_printf ("diag.j", 1612, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                               Rv_jbiaddr_pattern2);
!!#                       IJ_printf ("diag.j", 1614, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_jbiaddr_pattern3);
!!#                       IJ_printf ("diag.j", 1616, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern4);
!!#                       IJ_printf ("diag.j", 1618, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_jbiaddr_pattern5);
!!#                       IJ_printf ("diag.j", 1620, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_jbiaddr_pattern6);
!!#                       } else { 
!!#                       IJ_printf ("diag.j", 1623, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1625, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1627, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1629, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1631, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1633, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1635, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_memaddr_pattern);
!!#                       }
!!#                      }
!!#         }
!!# ;
!!# 
!!# block_ld :  set_block_ld   %rvar  wt_bl
!!# ;
!!# set_block_ld :  mSET_BLOCK_LD %rvar  wt_bl
!!#                 {
!!#                         rnd_cnt = random() %7;
!!#                         switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1648, th_M, "\tldda\t[%%r6]ASI_BLK_P, %%f0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1649, th_M, "\tldda\t[%%r7]ASI_BLK_P, %%f0\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1650, th_M, "\tldda\t[%%r9]ASI_BLK_P, %%f0\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1651, th_M, "\tldda\t[%%r10]ASI_BLK_P, %%f0\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1652, th_M, "\tldda\t[%%r11]ASI_BLK_P, %%f0\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1653, th_M, "\tldda\t[%%r12]ASI_BLK_P, %%f0\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1654, th_M, "\tldda\t[%%r13]ASI_BLK_P, %%f0\n"); break;
!!#                         default : IJ_printf ("diag.j", 1655, th_M, "\tldda\t[%%r8]ASI_BLK_P, %%f0\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1657, th_M, "\tmembar\t 0x40\n");
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
!!#                         case 0 : IJ_printf ("diag.j", 1668, th_M, "\tstda\t %%f0, [%%r6]ASI_BLK_P\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1669, th_M, "\tstda\t %%f0, [%%r7]ASI_BLK_P\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1670, th_M, "\tstda\t %%f0, [%%r9]ASI_BLK_P\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1671, th_M, "\tstda\t %%f0, [%%r10]ASI_BLK_P\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1672, th_M, "\tstda\t %%f0, [%%r11]ASI_BLK_P\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1673, th_M, "\tstda\t %%f0, [%%r12]ASI_BLK_P\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1674, th_M, "\tstda\t %%f0, [%%r13]ASI_BLK_P\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1675, th_M, "\tstda\t %%f0, [%%r7]ASI_BLK_P\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1677, th_M, "\tmembar\t 0x40\n");
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
