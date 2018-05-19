// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_usr_mode_sas1_int_rand_1.s
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
   random seed:	632951945
   Jal pio_rnd_basic4_usr_mode_sas1_int.j:	
********************************************************************************/



#define JBI_CONFIG
#define ASI_SWVR_INTR_RECEIVE		0x72
#define ASI_SWVR_UDB_INTR_W		0x73
#define ASI_SWVR_UDB_INTR_R		0x74

#define  tmp0 %l0
#define  tmp1 %l1
#define  tmp2 %l2
#define  tmp3 %l3
#define  flagr %g5

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

	setx 0x26ee3e9842aa1b73, %g1, %g0
	setx 0xa6984f423cbc0a54, %g1, %g1
	setx 0x7d4de7047deaeee7, %g1, %g2
	setx 0xe8f96e4727ff74ea, %g1, %g3
	setx 0xa297b90aa70d0306, %g1, %g4
	setx 0x4d3b7612a1652d3a, %g1, %g5
	setx 0x18b99779c0e0e32e, %g1, %g6
	setx 0x51943fe7cc78b2f8, %g1, %g7
	setx 0x58672a38c52aa709, %g1, %r16
	setx 0x2d4bbcf6c21b9891, %g1, %r17
	setx 0x0d67ae56e8c8aae9, %g1, %r18
	setx 0x47d79656bdde8730, %g1, %r19
	setx 0x807e490cf7d9f8ca, %g1, %r20
	setx 0xdf96b1a27b256575, %g1, %r21
	setx 0xaaa246df9d6150b1, %g1, %r22
	setx 0xc7117b7d42e0f04a, %g1, %r23
	setx 0x5f8656ca345141a6, %g1, %r24
	setx 0x3049ccced34818a8, %g1, %r25
	setx 0xe4bced748e7a7e36, %g1, %r26
	setx 0x4d6fb20fc6f44527, %g1, %r27
	setx 0x945fec85846a8250, %g1, %r28
	setx 0x3e8a367445de8796, %g1, %r29
	setx 0x0d491446dfcab9b9, %g1, %r30
	setx 0xbf6fbf41b9441f73, %g1, %r31
	save
	setx 0xa097780258d3ec65, %g1, %r16
	setx 0xc94064aa503f1803, %g1, %r17
	setx 0x6dd5110a0f572a84, %g1, %r18
	setx 0x9bed973259012084, %g1, %r19
	setx 0x5a608130b87691e6, %g1, %r20
	setx 0x194082503ab6cf6d, %g1, %r21
	setx 0x0d75243298e0a53a, %g1, %r22
	setx 0x5ab4b9d48aafd350, %g1, %r23
	setx 0x7726943e52d694d5, %g1, %r24
	setx 0x68d110be0870831d, %g1, %r25
	setx 0x97dbfc9fb9e76fb6, %g1, %r26
	setx 0xa3d6e35d1b2676f1, %g1, %r27
	setx 0xf501deda865fa355, %g1, %r28
	setx 0x0c1dd19254008829, %g1, %r29
	setx 0x6672ee47dd8a7b46, %g1, %r30
	setx 0x6e3d02156f0248db, %g1, %r31
	save
	setx 0x7212e062ba3d65ad, %g1, %r16
	setx 0x2e47c849ff69e430, %g1, %r17
	setx 0xc9b2f87421000bf6, %g1, %r18
	setx 0x2e47e6156eb3b9bd, %g1, %r19
	setx 0x9494d0f45fd5928a, %g1, %r20
	setx 0x016de25357d53adc, %g1, %r21
	setx 0x8d8dff6cc31208f6, %g1, %r22
	setx 0x2dca5c8867fcd581, %g1, %r23
	setx 0xecee8e41e43b8713, %g1, %r24
	setx 0xd29a7bba5a8feb8b, %g1, %r25
	setx 0xeee4b12893675301, %g1, %r26
	setx 0x21e34c0191f89518, %g1, %r27
	setx 0x50b886a13263be8a, %g1, %r28
	setx 0xc1ec69c1ac151be0, %g1, %r29
	setx 0x1413a56130106f46, %g1, %r30
	setx 0x7ed8bf9296549184, %g1, %r31
	restore
	mov	0, %r8
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d02ef100, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r9
	setx	0x00000000d04ef140, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xea5b6000  ! 4: LDX_I	ldx	[%r13 + 0x0000], %r21
	.word 0xe0228008  ! 5: STW_R	stw	%r16, [%r10 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xee29a008  ! 8: STB_I	stb	%r23, [%r6 + 0x0008]
	.word 0xea29a038  ! 9: STB_I	stb	%r21, [%r6 + 0x0038]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe25a6008  ! 13: LDX_I	ldx	[%r9 + 0x0008], %r17
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xee4a6018  ! 17: LDSB_I	ldsb	[%r9 + 0x0018], %r23
	.word 0xe031a028  ! 18: STH_I	sth	%r16, [%r6 + 0x0028]
	.word 0xe051e018  ! 19: LDSH_I	ldsh	[%r7 + 0x0018], %r16
	.word 0xec42a030  ! 20: LDSW_I	ldsw	[%r10 + 0x0030], %r22
	.word 0xec218008  ! 21: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe6498008  ! 22: LDSB_R	ldsb	[%r6 + %r8], %r19
	.word 0xaa332010  ! 24: SUBC_I	orn 	%r12, 0x0010, %r21
	.word 0xea59a028  ! 27: LDX_I	ldx	[%r6 + 0x0028], %r21
	.word 0xe8224008  ! 28: STW_R	stw	%r20, [%r9 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xac1b0008  ! 33: XOR_R	xor 	%r12, %r8, %r22
	.word 0xe23a8008  ! 34: STD_R	std	%r17, [%r10 + %r8]
	.word 0xe471e008  ! 35: STX_I	stx	%r18, [%r7 + 0x0008]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe62ac008  ! 48: STB_R	stb	%r19, [%r11 + %r8]
	.word 0xea430008  ! 49: LDSW_R	ldsw	[%r12 + %r8], %r21
	.word 0xe41aa028  ! 51: LDD_I	ldd	[%r10 + 0x0028], %r18
	.word 0xe4030008  ! 54: LDUW_R	lduw	[%r12 + %r8], %r18
	.word 0xea328008  ! 55: STH_R	sth	%r21, [%r10 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xea218008  ! 60: STW_R	stw	%r21, [%r6 + %r8]
	.word 0xe0730008  ! 61: STX_R	stx	%r16, [%r12 + %r8]
	.word 0xa202e020  ! 62: ADD_I	add 	%r11, 0x0020, %r17
	.word 0xea098008  ! 63: LDUB_R	ldub	[%r6 + %r8], %r21
	.word 0xe81ac008  ! 65: LDD_R	ldd	[%r11 + %r8], %r20
	.word 0xa8298008  ! 67: ANDN_R	andn 	%r6, %r8, %r20
	.word 0xe43b2030  ! 68: STD_I	std	%r18, [%r12 + 0x0030]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe20b6038  ! 72: LDUB_I	ldub	[%r13 + 0x0038], %r17
	.word 0xe231e028  ! 80: STH_I	sth	%r17, [%r7 + 0x0028]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xec430008  ! 84: LDSW_R	ldsw	[%r12 + %r8], %r22
	.word 0xee01a008  ! 85: LDUW_I	lduw	[%r6 + 0x0008], %r23
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe6234008  ! 88: STW_R	stw	%r19, [%r13 + %r8]
	.word 0xe2330008  ! 89: STH_R	sth	%r17, [%r12 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe63ac008  ! 92: STD_R	std	%r19, [%r11 + %r8]
	.word 0xe2318008  ! 93: STH_R	sth	%r17, [%r6 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xee2b0008  ! 97: STB_R	stb	%r23, [%r12 + %r8]
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xe211c008  ! 100: LDUH_R	lduh	[%r7 + %r8], %r17
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xa8198008  ! 103: XOR_R	xor 	%r6, %r8, %r20
	.word 0xec72a000  ! 106: STX_I	stx	%r22, [%r10 + 0x0000]
	.word 0xe0218008  ! 108: STW_R	stw	%r16, [%r6 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe6230008  ! 113: STW_R	stw	%r19, [%r12 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe23a6020  ! 115: STD_I	std	%r17, [%r9 + 0x0020]
	.word 0xe871e020  ! 117: STX_I	stx	%r20, [%r7 + 0x0020]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r9
	setx	0x00000000d04ef0c0, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe6330008  ! 122: STH_R	sth	%r19, [%r12 + %r8]
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xe20b0008  ! 125: LDUB_R	ldub	[%r12 + %r8], %r17
	.word 0xee22c008  ! 126: STW_R	stw	%r23, [%r11 + %r8]
	.word 0xe6332030  ! 127: STH_I	sth	%r19, [%r12 + 0x0030]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xee134008  ! 130: LDUH_R	lduh	[%r13 + %r8], %r23
	.word 0xe0526028  ! 132: LDSH_I	ldsh	[%r9 + 0x0028], %r16
	.word 0xe0430008  ! 133: LDSW_R	ldsw	[%r12 + %r8], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe62b6030  ! 136: STB_I	stb	%r19, [%r13 + 0x0030]
	.word 0xee11e008  ! 137: LDUH_I	lduh	[%r7 + 0x0008], %r23
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe2524008  ! 139: LDSH_R	ldsh	[%r9 + %r8], %r17
	.word 0xe0318008  ! 141: STH_R	sth	%r16, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe452a018  ! 145: LDSH_I	ldsh	[%r10 + 0x0018], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xac11e028  ! 150: OR_I	or 	%r7, 0x0028, %r22
	.word 0xec226020  ! 151: STW_I	stw	%r22, [%r9 + 0x0020]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe651e020  ! 154: LDSH_I	ldsh	[%r7 + 0x0020], %r19
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xee0ae008  ! 157: LDUB_I	ldub	[%r11 + 0x0008], %r23
	.word 0xee2b2010  ! 158: STB_I	stb	%r23, [%r12 + 0x0010]
	.word 0xe81b2028  ! 159: LDD_I	ldd	[%r12 + 0x0028], %r20
	.word 0xe00a6028  ! 160: LDUB_I	ldub	[%r9 + 0x0028], %r16
	.word 0xee31a020  ! 161: STH_I	sth	%r23, [%r6 + 0x0020]
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe6224008  ! 166: STW_R	stw	%r19, [%r9 + %r8]
	.word 0xe0198008  ! 167: LDD_R	ldd	[%r6 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe05ac008  ! 171: LDX_R	ldx	[%r11 + %r8], %r16
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xee59e030  ! 175: LDX_I	ldx	[%r7 + 0x0030], %r23
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe602e028  ! 179: LDUW_I	lduw	[%r11 + 0x0028], %r19
	.word 0xea732030  ! 180: STX_I	stx	%r21, [%r12 + 0x0030]
	.word 0xe6728008  ! 181: STX_R	stx	%r19, [%r10 + %r8]
	.word 0xe6428008  ! 183: LDSW_R	ldsw	[%r10 + %r8], %r19
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe201e028  ! 185: LDUW_I	lduw	[%r7 + 0x0028], %r17
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe032e020  ! 189: STH_I	sth	%r16, [%r11 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xea328008  ! 197: STH_R	sth	%r21, [%r10 + %r8]
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d02ef080, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r9
	setx	0x00000000d04ef140, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef0c0, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe839c008  ! 204: STD_R	std	%r20, [%r7 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe01a6028  ! 209: LDD_I	ldd	[%r9 + 0x0028], %r16
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe631a018  ! 214: STH_I	sth	%r19, [%r6 + 0x0018]
	.word 0xe2228008  ! 217: STW_R	stw	%r17, [%r10 + %r8]
	.word 0xea2ac008  ! 220: STB_R	stb	%r21, [%r11 + %r8]
	.word 0xe6298008  ! 222: STB_R	stb	%r19, [%r6 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xee426010  ! 228: LDSW_I	ldsw	[%r9 + 0x0010], %r23
	.word 0xe8330008  ! 231: STH_R	sth	%r20, [%r12 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0498008  ! 235: LDSB_R	ldsb	[%r6 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe2128008  ! 239: LDUH_R	lduh	[%r10 + %r8], %r17
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r9
	setx	0x00000000d04ef180, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xee430008  ! 247: LDSW_R	ldsw	[%r12 + %r8], %r23
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe651a020  ! 250: LDSH_I	ldsh	[%r6 + 0x0020], %r19
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4518008  ! 253: LDSH_R	ldsh	[%r6 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82aa000  ! 255: STB_I	stb	%r20, [%r10 + 0x0000]
	.word 0xe039e010  ! 256: STD_I	std	%r16, [%r7 + 0x0010]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe449a018  ! 264: LDSB_I	ldsb	[%r6 + 0x0018], %r18
	.word 0xe2598008  ! 266: LDX_R	ldx	[%r6 + %r8], %r17
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82b4008  ! 271: STB_R	stb	%r20, [%r13 + %r8]
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe001a030  ! 280: LDUW_I	lduw	[%r6 + 0x0030], %r16
	.word 0xe8430008  ! 281: LDSW_R	ldsw	[%r12 + %r8], %r20
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe259c008  ! 288: LDX_R	ldx	[%r7 + %r8], %r17
	.word 0xe83aa038  ! 289: STD_I	std	%r20, [%r10 + 0x0038]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xee5b4008  ! 291: LDX_R	ldx	[%r13 + %r8], %r23
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec49c008  ! 293: LDSB_R	ldsb	[%r7 + %r8], %r22
	.word 0xe631a008  ! 294: STH_I	sth	%r19, [%r6 + 0x0008]
	.word 0xe8736000  ! 295: STX_I	stx	%r20, [%r13 + 0x0000]
	setx	0x0000000000000009, %r1, %r6
	setx	 page1a, %r1, %r26
	ldx	[%r26], flagr
	cmp	%r6, flagr
	bne	bad_end
	nop



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
        ! Check the correct vector is logged in the ASI interrupt registers.
        ldxa    [%g0] ASI_SWVR_UDB_INTR_R,     tmp0

       ! Read data J_INT_ADATA0
        !setx    0x0000009f00000600,     %l7,    tmp1
        !ldx     [tmp1], tmp2

       ! Read data J_INT_ADATA1
        !setx    0x0000009f00000700,     %l7,    tmp1
        !ldx     [tmp1], tmp2

       ! Clear interrupt busy bit.
        setx    0x0000009f00000b00,     %l7,    tmp1
        !ldx     [tmp1], tmp2
        stx     %g0,    [tmp1]

        setx   page1a,%l0,  %l7       ! set the data
        ldx   [%l7], tmp1
        inc     tmp1
        stx   tmp1, [%l7]

        !inc     flagr
	retry;

.global intr0x190_custom_trap
intr0x190_custom_trap:

       ! Clear interrupt busy bit.
        setx    0x0000009f00000b00,     %l7,    tmp1
        stx     %g0,    [tmp1]

! Initialize jbi interrupt vector.
        setx    0x0000009800000a00,     %l7,    tmp1
        set     0x4,        tmp2
        stx     tmp2,    [tmp1]

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

#define PAGE1A_ADDR 0x86660000
#define PAGE1A_ADDR_RA 0x86660000

SECTION .PAGE1A DATA_VA=PAGE1A_ADDR
attr_data {
        Name = .PAGE1A,
        VA=PAGE1A_ADDR, PA=PAGE1A_ADDR_RA, RA=PAGE1A_ADDR_RA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page1a

page1a :   .skip    256

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
	.xword	0xd18953ac9d50798d
	.xword	0xc6d7100720f581a1
	.xword	0xa194598b42d5bcbc
	.xword	0x1b3560ab2d96bad0
	.xword	0xacf0145340bf834b
	.xword	0x648ac11e8d624ae7
	.xword	0xbfd68efcb18e8b5a
	.xword	0x745e6801b610aa18
	.xword	0x4f44b3f673e913d6
	.xword	0xe8c657a53f00eb1d
	.xword	0x2da9309fc4f0bdb0
	.xword	0x794c1e0638d15fff
	.xword	0x7871a231274518c2
	.xword	0xc52ec4c7636498c1
	.xword	0x4501366bac2cb5e2
	.xword	0x38d67183b137c863
	.xword	0x4443b8077ef12a04
	.xword	0x765ec33a60e5ce0e
	.xword	0x13adbba16d0a756b
	.xword	0xe3e8c56a0264a983
	.xword	0xdc6f50d811e4f250
	.xword	0x1076b54a634bd9a1
	.xword	0xf2d16b479a58f7ca
	.xword	0x06618b368508564d
	.xword	0x64c1719e0f0ef080
	.xword	0x8e4c628b896135e3
	.xword	0x01d5e4b9b982ae69
	.xword	0xffe7b33f57f7e4ae
	.xword	0x307bd6117143bd89
	.xword	0x329e53d06a730a23
	.xword	0x882ca2f8948fe629
	.xword	0x88d600de0d583d69
	.xword	0xf930d75dae357a17
	.xword	0x5d59a62f7edf80ec
	.xword	0xa0dd943a9d2f85cb
	.xword	0x331a6e00a2941496
	.xword	0x675808e56484330f
	.xword	0x3e2d8322bf62fef5
	.xword	0x95acfb48a04cb290
	.xword	0x050ec191c4921bba
	.xword	0x6972aab7ce42451c
	.xword	0x0cddf95bbe95c98b
	.xword	0x067712b5183f4d43
	.xword	0x853a1da4827e9d21
	.xword	0xa2cc92992f35c58a
	.xword	0xe0a952821d4a323a
	.xword	0x983c3e437ad0f7f1
	.xword	0x4cc6958608f43f9c
	.xword	0xb72879345baef2f4
	.xword	0x8ab6f416a259c30e
	.xword	0xec168c13aab365e8
	.xword	0xab81bb0986b1b68f
	.xword	0x3280c57093b556dc
	.xword	0x8ef9b8180b8e5ec8
	.xword	0xca181f5cebab6ada
	.xword	0x57cc2a72971690e0
	.xword	0x4fdc9630b3341178
	.xword	0xca024933bb3c61a5
	.xword	0xecea014f362631b2
	.xword	0xd7174fcc8f7ddea4
	.xword	0x08d9a72a18fbdfc0
	.xword	0x049cfd05de916d03
	.xword	0x5caa40501d460334
	.xword	0x7f5622d783516535
	.xword	0xdef4a52107582442
	.xword	0xce169e36cfcbde13
	.xword	0x4d9a71033a70742a
	.xword	0x4f3106993b132a03
	.xword	0xfb20ac7ee5db7f2e
	.xword	0x060a5ef85ab7cb83
	.xword	0x44afc4058377b01b
	.xword	0x59ad920f3f526848
	.xword	0x0a7a9627f0e9d775
	.xword	0x3aa3d1f465cbf3b5
	.xword	0xd8b8dbac01313de2
	.xword	0xfee385710fb092a1
	.xword	0x0354a06ce41e48b5
	.xword	0x464006c33ad36001
	.xword	0x532c43ea142eba60
	.xword	0xe8196212438e6f2c
	.xword	0x88fe94db4b2ce7cb
	.xword	0xd7288a8d41ae6bbf
	.xword	0x4b695081d8a41d2f
	.xword	0x4483e5f48297e5b0
	.xword	0x941241376cca93d5
	.xword	0xf522a45423b68828
	.xword	0x07e6d66c85eed032
	.xword	0x440f97370f627f77
	.xword	0xdab957942e55e32a
	.xword	0xbb3a053884d0d968
	.xword	0xf6dbddd47193c83d
	.xword	0x9d516143530195d3
	.xword	0x4931dcf87b0d1d6c
	.xword	0xf027ea634596bd3f
	.xword	0xe07f448d5791c208
	.xword	0x3a4ae45b47821572
	.xword	0x560a61aa87fcd05b
	.xword	0x679fa8948f7b21af
	.xword	0x43929463e813585c
	.xword	0xec73632322d2a04e
	.xword	0x723b478facbe6328
	.xword	0x56bcd58210c22f61
	.xword	0x2268b0bff1e70170
	.xword	0x199473f27859f9ca
	.xword	0x8d3178785bccca5e
	.xword	0xc2d0fa276129d2b5
	.xword	0xb937e14a4bf7c912
	.xword	0x0768da3703c47287
	.xword	0x7a37be8c1f3e8b84
	.xword	0x1c86ffa40241e0dd
	.xword	0x8a85a8c70044de02
	.xword	0x1e7ed16cfe4616bc
	.xword	0xa01099d167fed453
	.xword	0x110178e5317ad159
	.xword	0xbe875978c867c537
	.xword	0x1ee3cb4dbdd2e900
	.xword	0xacab643dcae92b88
	.xword	0xaba5ab828eb5f1b7
	.xword	0xb74a0aa39d0650ca
	.xword	0xbc024e106244df5b
	.xword	0xb5c927e7ce77aecd
	.xword	0x54e758c6c7ee344d
	.xword	0x274e8b5a7e549cd8
	.xword	0x723ffc2c17a620ab
	.xword	0x4083a80724e91ccd
	.xword	0xb2571e6b1feb685f
	.xword	0xc7bb55a8f1c5d25c
	.xword	0x751e2f8fd2b27dec
	.xword	0x61889e96cd6e4b3e
	.xword	0xb4361ff1fe6216db
	.xword	0x9fc9e39e4112bfdd
	.xword	0x9245546c86f9066a
	.xword	0x0c7e07ab228d2f43
	.xword	0x2a8e55049d39e086
	.xword	0xfd93326f5a551c6a
	.xword	0x52e8333c3c676006
	.xword	0x7ab8214a66f3f5c6
	.xword	0x3e38c917b7264a69
	.xword	0x2bc570f1a72963b0
	.xword	0xb8f3e623a0ab8353
	.xword	0x8a6969f945c68f12
	.xword	0x04dcf97aaa34ad26
	.xword	0x42bad008d7f60694
	.xword	0xb9e06263608f6741
	.xword	0x23560a54a5795066
	.xword	0x156981fbacb1404d
	.xword	0x8d401b3bc1d4832e
	.xword	0x76bb2169d8de254a
	.xword	0x8113e72585110803
	.xword	0x0e4c2222905d0bde
	.xword	0x6b1dc04505d646c2
	.xword	0xd116106bc87b51b8
	.xword	0xffaba8411c9f34a2
	.xword	0x3d3ed0518d5e5e3a
	.xword	0xb2e835cbcb8e0a10
	.xword	0xab5ff15e280f5195
	.xword	0x3fab94217dc12eba
	.xword	0xb117471aa8263046
	.xword	0x30ab55811c2519fb
	.xword	0x7c863b4e74a9b804
	.xword	0x96608514f50765f7
	.xword	0x3929d43cb64be72f
	.xword	0xcdb2a48a65bbad46
	.xword	0x081703576f734cb6
	.xword	0x01810a889ddea04d
	.xword	0x1012fc18f6bb6291
	.xword	0x9fcd58e6aad80385
	.xword	0x132e1f57fad69f77
	.xword	0x2ac20453390b8aae
	.xword	0xd9727b658aa13daa
	.xword	0xf63a80aa9bacfef5
	.xword	0xab2217a641aedbb3
	.xword	0x602de0141d823df5
	.xword	0xf4af91fe331097fa
	.xword	0x5f323392f9737822
	.xword	0x0b599baa0b789826
	.xword	0x949608d60f5f1a58
	.xword	0x6686cab10d6227f2
	.xword	0x35554bfa7b5cc7e2
	.xword	0xd04e1be6d9d04bee
	.xword	0x15e93488dc45487e
	.xword	0x8f3ba74a12abb806
	.xword	0x45d3735c77f321fe
	.xword	0xd40362075e518bff
	.xword	0x9d9d5d3fac398e29
	.xword	0xb4fd9dd65d6120d9
	.xword	0x2652b3b4a7494e09
	.xword	0x4f0bdcf3a2d3e045
	.xword	0xc45c00c21f8c7a68
	.xword	0x2011143df1763ba3
	.xword	0x0fd91e9ab0d854ee
	.xword	0x906a3e310e5e4c48
	.xword	0xc01f44fa868fbb3e
	.xword	0x15849de186496915
	.xword	0x5b181cfd2750c006
	.xword	0xa746921d8b344339
	.xword	0xe23f3af9a03cf1a0
	.xword	0x95a1ed771feccab6
	.xword	0xabbc86ab043628d5
	.xword	0x1845664ea827e086
	.xword	0xa0f0aa31983f844b
	.xword	0xbfe58955f4311874
	.xword	0x553340d7bde7fafe
	.xword	0x011423097c5dffb2
	.xword	0x7564c62dcd584e99
	.xword	0x807ff8c7f8fad5eb
	.xword	0x06c3b93928197aa9
	.xword	0xf2f4c0e9dd121eea
	.xword	0x893c4317bddc3779
	.xword	0xbca09de9eed90062
	.xword	0xb61037b6fd286356
	.xword	0x5e7d186081a13985
	.xword	0xde4646b08fac788b
	.xword	0x679fd5bea5e62e9b
	.xword	0xd94c7e06f29c1730
	.xword	0x86a331d4ae8ad420
	.xword	0x6a225f35364c0ec5
	.xword	0x1c6dc64e0d20b389
	.xword	0xbeafc9484276774c
	.xword	0x2457823a00707fe2
	.xword	0xd77fc507a0197bcc
	.xword	0xd57aeb0d896a96d1
	.xword	0x4530e3e5f5cbf4f9
	.xword	0x5679400517cf3ac5
	.xword	0xa2f2a81b3b7c86b4
	.xword	0xaa88afb9c9414ece
	.xword	0x64cc8fa5ba4835b5
	.xword	0xea01762480f02c93
	.xword	0x1bb2ac7d17fc65fb
	.xword	0xeb5e53147662974d
	.xword	0xf62294a762f7e2c5
	.xword	0x38ed51dce238008f
	.xword	0xafcb93de62c3adb0
	.xword	0x089576256f234047
	.xword	0x2200a46702ece1e0
	.xword	0x452527f2b43fcf3a
	.xword	0xc815834a1de6bede
	.xword	0xbf88ed06bcefc838
	.xword	0x5fb4a9a74de2286e
	.xword	0x3bebe31cace2a5cb
	.xword	0x6ed10b7d09e598d3
	.xword	0x6fc58af1ce5f5da8
	.xword	0x09c1d508412390b9
	.xword	0xf63c0994c0d339d0
	.xword	0x9601525ee1349355
	.xword	0x5e0f2e8d3489b28c
	.xword	0x669d7b39c829b8cd
	.xword	0x05f73b0b15678213
	.xword	0xc60dc1bf8f41eb93
	.xword	0xa4e35357bd3a98d5
	.xword	0x582542d3ed3f907a
	.xword	0xca8deac7a935092d
	.xword	0x3e7dc1b16086b187
	.xword	0x1c27e7c41c7d017e
	.xword	0x58b8668db32cdbfd
	.xword	0x8d66c363bcfdaf1a



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
	.xword	0x04dff23900cb7a20
	.xword	0xc7f09c55fa772b1e
	.xword	0x9bd678bd79b6f550
	.xword	0x8f73430a5c311b19
	.xword	0x8c34b65cb3a0ec45
	.xword	0xbcfb74a715ff7caa
	.xword	0x91882d89d86037a0
	.xword	0x315d1a6769d51ce5
	.xword	0x3efb28a9dd7b3e8b
	.xword	0x1e40fa706ac7ab36
	.xword	0xcc25100152dad94b
	.xword	0x9d51063734c3515c
	.xword	0xb9dbb571f6cd825b
	.xword	0xe5f7d110d8757588
	.xword	0x1afc2a5ac200ce19
	.xword	0x16e3600cbf4c640a
	.xword	0x282e7b885e1dd74d
	.xword	0xec7be01a5e3698df
	.xword	0x56d579f1fa5ce160
	.xword	0x559c6c842740474f
	.xword	0x7b5b12fb4d482d29
	.xword	0x5c9ad7046a17a791
	.xword	0x581ce6245deab482
	.xword	0x6a7274f68fdf71b1
	.xword	0x93b18f35ffd40aa0
	.xword	0xb4e48618c46aa647
	.xword	0x5ad077ca97e177e1
	.xword	0x04ca72bd74cf7458
	.xword	0xfaaf0a9a3174bb05
	.xword	0x1f0b705f6185e37a
	.xword	0xf5ca8f1d0b994b48
	.xword	0xf68d715cb4c036e0
	.xword	0x65d6706eb13c4f94
	.xword	0x399a9d2ce1bb3e58
	.xword	0xf945b2aff8147364
	.xword	0x837403ac4fac0d96
	.xword	0xca4a3e46407a9cfc
	.xword	0x1ca3c147504aa833
	.xword	0x5a2002d7a7397591
	.xword	0x1f274fbb2da7b92f
	.xword	0x80fc7100f749ad6b
	.xword	0xfa454d123712cb79
	.xword	0x9343b7583bfb592e
	.xword	0x11bc6948249e86bb
	.xword	0x85b47b498914f0f6
	.xword	0xcc483827b57d8dfe
	.xword	0xf7f4b2bec9e85203
	.xword	0x1b3d35dd46dd8ed3
	.xword	0x73bb595a2b30609b
	.xword	0xb920a04e6130d495
	.xword	0xdf7f642082fb66fb
	.xword	0x44428c34f2a16440
	.xword	0x4c9f15aed688d2de
	.xword	0xa7de352d5a1730c2
	.xword	0x760b1f03c654073a
	.xword	0x6a31e2c8e5796b34
	.xword	0x5d4cd6a09d916a1a
	.xword	0xd74b11448fb6620b
	.xword	0x11101ae779aeb37a
	.xword	0x40e340035c4aad7b
	.xword	0xa88efa90b83ec092
	.xword	0x81a760fd4798ec2a
	.xword	0x26ded00b32d312a2
	.xword	0x63bda9031c6ec88b
	.xword	0x3e9b0029d47a93e5
	.xword	0x125ac6121e00461b
	.xword	0x3eca8298177776d1
	.xword	0x031abfe9301be08c
	.xword	0x317fba6c40892b17
	.xword	0x86968f654ebeb8ff
	.xword	0x9142e2ce46f259f5
	.xword	0xdbe13a30c7d91572
	.xword	0x97f9d2ff9f275c45
	.xword	0x5bb4652ac2ffb682
	.xword	0x36c6859b3f8775b7
	.xword	0x3759216de21586d0
	.xword	0x3cf7e92f5734622c
	.xword	0x0026428fe5b63690
	.xword	0x48047da6eaec1e81
	.xword	0xbdcef85947ecb8c1
	.xword	0x082494930a9f643b
	.xword	0x89478ab520fd66e7
	.xword	0x11fa1febd71d9367
	.xword	0x26c119bdab9adee7
	.xword	0xe47281050ed176e0
	.xword	0x4e6b1b5d79817227
	.xword	0x6c897e81dd4150ee
	.xword	0xb355d631dbcdbde5
	.xword	0x02d889eb51da7d19
	.xword	0xb065e8d030c9b3fd
	.xword	0xca3e504db979210e
	.xword	0x5748f2878377eded
	.xword	0xea0c7fdf8d2f4a7f
	.xword	0xb7b758d8c58d428f
	.xword	0x87e2fc58eb13234f
	.xword	0xcaf5b51942cb7fbf
	.xword	0xc5097ec28a07da7e
	.xword	0x80c3d23fc5f100a2
	.xword	0x7ab384277d42c953
	.xword	0xf223b81b9819aee5
	.xword	0x320cc5ab6ea07fe5
	.xword	0x99bc2640a3904ce4
	.xword	0x6e3bc3cfe7d7c224
	.xword	0x4857207fa502d686
	.xword	0x50851c5ea537ea1b
	.xword	0xa97d7952ab2ea60b
	.xword	0xa5c8664811439ca4
	.xword	0xb8a2847963f7580c
	.xword	0x7058fd9e86e5b0c8
	.xword	0xfc14aee1b3a98114
	.xword	0xf89c784a40c561ec
	.xword	0xa42e2c04ac08a8b6
	.xword	0xa615b2a02b0a368d
	.xword	0x0f174c4c476d2d75
	.xword	0x4e5a70bda7794aef
	.xword	0x4d27617b40288ca1
	.xword	0x6a17e85184c3f8bd
	.xword	0xb59a40096947ba73
	.xword	0x5f520c1f1c55991b
	.xword	0xacf112c7f91fe02c
	.xword	0xca4d8016a5a88301
	.xword	0xdf83a82399dd7aaf
	.xword	0x479ff03b8ced7231
	.xword	0x4b1c20f6a171972a
	.xword	0x1a71fec5077efc95
	.xword	0x4d4ab2a3cb7709cb
	.xword	0x9bcf396afc9869bd
	.xword	0xef5549199971a6a7
	.xword	0x8387b3dba57c56a5
	.xword	0x110c47df436e8664
	.xword	0x4efc9a07653431be
	.xword	0xc573465dbb277282
	.xword	0x467a28b0d8ca4c85
	.xword	0x7181a0d5f72b57c6
	.xword	0xfbb5247c7690d778
	.xword	0xde9a279e715fb9c6
	.xword	0x50ba2f336128ccec
	.xword	0x6f7139249b0b86e8
	.xword	0x2045005395c4c26f
	.xword	0xebc15c3ec796a1fb
	.xword	0xa5529e14129b6376
	.xword	0xf94e449e237b9b0a
	.xword	0xc3dc742845b736b0
	.xword	0xb18c324f349c30d9
	.xword	0x0871a204389802da
	.xword	0x4b4695c57cee47f5
	.xword	0xfcc90d55e3e9dd8b
	.xword	0x57d0f174f49f7ba4
	.xword	0x9c341726201a2ef6
	.xword	0x2dc1dd3c8ffd677f
	.xword	0xe83458dffd0ce7d7
	.xword	0x6be7cfc3852c4566
	.xword	0x4943184c64269411
	.xword	0x66460f43e602f7d4
	.xword	0x56cfe87df4c41638
	.xword	0x5f7a3e5d3d2611d5
	.xword	0x684045dc01eee9b6
	.xword	0xe56d04628554b1df
	.xword	0xee421d87eacc3f2d
	.xword	0x05d7b340abf805ad
	.xword	0x1bd2a78459710e95
	.xword	0x61b721b4b10710ab
	.xword	0xfda7b06bdd684ecd
	.xword	0x41011d0d475d8cde
	.xword	0xe61d5a517066c035
	.xword	0xeeff7cc889d4f45f
	.xword	0x54916654d2a3ef7c
	.xword	0x0020a00db52ba75d
	.xword	0x220fe47608dc4c0f
	.xword	0xcdffa29f99a2e041
	.xword	0xe944a6f0630a2a77
	.xword	0x93b649b7a2c90209
	.xword	0x417e6b670490753f
	.xword	0xb81970dfeea2f102
	.xword	0xdf90c4ef2c0ee66a
	.xword	0xa51cec4b5619dc18
	.xword	0x314d4540e517c9cd
	.xword	0x0ec55508a8685a11
	.xword	0x209aa531379c254c
	.xword	0xd4262739e87497d5
	.xword	0x2a2e94106c580567
	.xword	0x61f30738a3c16290
	.xword	0x2b06dedee190ebbf
	.xword	0x3051ca72909d16ee
	.xword	0xdfa20c179f4ab928
	.xword	0x8ec65f137c1ecedd
	.xword	0x62efa903441b79e3
	.xword	0x1ef9b8df94bd2a04
	.xword	0xaa419376697dadec
	.xword	0x4733b308fb5d2dd5
	.xword	0xb49bf58e29fc988d
	.xword	0xdc70042c315013ed
	.xword	0xd5572edebdfb996f
	.xword	0x04de49525a55fd30
	.xword	0xde4d58aae1b99557
	.xword	0xe7603f30f5ba8d04
	.xword	0x093eb29eaf3c676d
	.xword	0x614bfccbbd4d413e
	.xword	0xfedbb1c96aba8661
	.xword	0x6757738986f85dcb
	.xword	0x0b04dddc281811af
	.xword	0xbc021e178951f9a5
	.xword	0xfbe20a3aa28270b3
	.xword	0xff8023dd66b8e6a7
	.xword	0xa3563d70cb285673
	.xword	0x75a79631b004f147
	.xword	0x827115b4e4280aa3
	.xword	0x7e4f3c6e4f87a43f
	.xword	0x920553d6abdd4d24
	.xword	0x7d16f22682fe753d
	.xword	0x02343ea780b80a6d
	.xword	0x8397a88d6a382bd1
	.xword	0x24a7db05f5442131
	.xword	0xd5674c0a935c37f9
	.xword	0x42f1902bd8c6c41a
	.xword	0x4303a0f717660b23
	.xword	0x39286e9065640044
	.xword	0x6338ddfd0eef073a
	.xword	0x0991241dc49a6bba
	.xword	0xbdffc56785be71e2
	.xword	0x4f10e39f4a28446d
	.xword	0xf96ebd1c9367fafa
	.xword	0x1608b308b8b729ec
	.xword	0x4a43a2f228c037f6
	.xword	0x93d4913f804f2d12
	.xword	0xc748bced58c1de82
	.xword	0xe60e621732cc05d2
	.xword	0x9b035b6b309904e2
	.xword	0x4e3ebcbcb97b667a
	.xword	0xfa38b4594b798ce3
	.xword	0x14480202c9846a05
	.xword	0x93c04716d520ba4a
	.xword	0x2655da0c23f63404
	.xword	0x029c182e7b89f13f
	.xword	0x8a545294537d2b33
	.xword	0x162ae99342fc1d47
	.xword	0xd7cc8b6a413a2684
	.xword	0xbd863307dc4c52b8
	.xword	0xfed29cc554b5ec72
	.xword	0xb067988679e59d77
	.xword	0xb37d5810b55dafcf
	.xword	0x090eb0e937a2297a
	.xword	0xc01c1bb74075f678
	.xword	0x112cda9f69d8a1dd
	.xword	0x6502abf9c26f8867
	.xword	0x9cb28e422120d917
	.xword	0xa3b03563a506d8c6
	.xword	0xccce49c8905782a1
	.xword	0xa0814fe4bdf40040
	.xword	0x569f366201b90923
	.xword	0x935a7d6f8d61ae52
	.xword	0xde48dff79b4199b9
	.xword	0xd97b74bec9ceb6cd
	.xword	0xf51abcad30142926
	.xword	0xedec8db38847a0cb
	.xword	0x3e437871b33042dc



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
	.xword	0x06b04c648af805f8
	.xword	0x9944844e15e735ba
	.xword	0x9f477d7628a0474a
	.xword	0xf7cd03b0a32c6473
	.xword	0xb25579ee358396f0
	.xword	0x435990d35a817210
	.xword	0x3a77e2109ab1f371
	.xword	0x5233bc1b9c31869b
	.xword	0x90dfd20b3c9f8def
	.xword	0xd281dc99dca5dfd7
	.xword	0x8e6d4cc6c19d2a2b
	.xword	0x44cb19680ecc588e
	.xword	0x01acc4289340659c
	.xword	0x0b8d0207f5d99aea
	.xword	0x15657ca9e239ef2d
	.xword	0xd6030d1f8d141736
	.xword	0x82c06e20432b96f8
	.xword	0x46ff7431a225b15a
	.xword	0xdae5428116d9932d
	.xword	0x757b1ff79e5a7314
	.xword	0x3fb2d7ec7790191e
	.xword	0x0183e431084064f4
	.xword	0xa84867659918db8d
	.xword	0x45e3894d39d0158c
	.xword	0x491f5516aedda968
	.xword	0x6fdb49a0677a4dbc
	.xword	0xd1ffc62c4ed01564
	.xword	0x7260aba5970fa4ad
	.xword	0x180135bb815bca44
	.xword	0x22aa910d6f4f2db9
	.xword	0x34b5999fcda6a4dc
	.xword	0x1584f67387f9dff1
	.xword	0x054cae788d2f8660
	.xword	0xd1b3729df880273f
	.xword	0x73acaa0c8785fb57
	.xword	0xb42c3ef291fd8c3a
	.xword	0x57bd40bce4c4e409
	.xword	0x08d7174ce398797b
	.xword	0x4380b0ae8cb95134
	.xword	0xeeb90a659d1a3d84
	.xword	0xd6cbfb3d49f5afda
	.xword	0xb760de8b2aa5864b
	.xword	0x567df0e3685d1bb7
	.xword	0x2d2512b905193992
	.xword	0x5aa63e82b2d6bf78
	.xword	0x1384792e2e799b37
	.xword	0x4ce4ea91ba0171d0
	.xword	0x34bbd5519996204c
	.xword	0x72989e767cbb126b
	.xword	0x3e7b0b3f3b893e38
	.xword	0xcf665c563c9d8f81
	.xword	0xbfececfacd1250f1
	.xword	0x9f06d8da1c1a45d8
	.xword	0x695b38abc627aff9
	.xword	0xe520b0d59a05188f
	.xword	0x515a32dcc37d88a3
	.xword	0xd664ae391d2522e8
	.xword	0x5363a6663f9dea48
	.xword	0x20f11db2c679fc82
	.xword	0x22ca86369bf97fb2
	.xword	0xd701926092512367
	.xword	0x1b08a5084dde7b17
	.xword	0x8c515d68a4369b00
	.xword	0x7daf5f72ca386e7c
	.xword	0xcc867c4fa2308184
	.xword	0x998a0d43aabd9a28
	.xword	0x3c5fb1156aedf6dd
	.xword	0xb766e6eada55a537
	.xword	0x4abb02b408404595
	.xword	0xf31ea93634dab0b1
	.xword	0x7948eb8b2e05398e
	.xword	0xd259f3b2719cc7ea
	.xword	0x0cabfdb6603e06c8
	.xword	0x567cb1e208c97932
	.xword	0x277534975105f836
	.xword	0xf096690f2704601f
	.xword	0xd87cc465b6e7c657
	.xword	0x4fb7f7ad959e5b47
	.xword	0xbb961fcac2cea92b
	.xword	0xa14457e032b4491a
	.xword	0xde87cb3f2aceef52
	.xword	0x4ee916804f4a9def
	.xword	0xc96c8df1fd7f9202
	.xword	0xfa5966f779170047
	.xword	0x68c294cae43d02a3
	.xword	0xe723490d239693d5
	.xword	0xfa33cdae6adf9328
	.xword	0xb109530bf5c2e1dd
	.xword	0xa6651d903825cc76
	.xword	0x397296b90d0204f2
	.xword	0xede04d382b0ad80a
	.xword	0x39dfdc5ad67d67c0
	.xword	0xb8992b8649fd6477
	.xword	0x2eb74e90b132c9a7
	.xword	0x40685dc3d3252d3e
	.xword	0xfcd0ee732beb6e95
	.xword	0xa1050e83a2c58046
	.xword	0xfb851027ae9fcd2b
	.xword	0x7ddf2d2152e71b15
	.xword	0x67a754f75da7d7c8
	.xword	0x991ac6b92ab38175
	.xword	0x7ab2d7b554264160
	.xword	0xc9a73b5eb8bc84cf
	.xword	0xa23e0799f2583b2b
	.xword	0xc4af43b1eb4ec599
	.xword	0x175b1424dca97198
	.xword	0xa0c1ce76017cf2f9
	.xword	0x56fc371b6c34c48d
	.xword	0x952ea367e3ae30c6
	.xword	0x2baa03c334b55379
	.xword	0xbda49154b71b18b7
	.xword	0x9aa0d6232ec723a0
	.xword	0x9136349ca72ddb52
	.xword	0x8ad6c243bfbd840d
	.xword	0x2df717c59bac163f
	.xword	0xa49d81e90e06b1c9
	.xword	0x9dc7b3b1388f267f
	.xword	0x2cb8595bf8954084
	.xword	0xc6fede601515acaf
	.xword	0x9d0ef433f235eeea
	.xword	0xe75b0b94c926a096
	.xword	0x088c8246036bc901
	.xword	0x048db1725fd1a1a4
	.xword	0x5dedaf5dfea1c69b
	.xword	0x451f1b370f3fb8dc
	.xword	0x835761c73172a8c8
	.xword	0x7ba2e61f0ac9b6ef
	.xword	0x79917e1dc97b50d7
	.xword	0x20016038b9cf3ee5
	.xword	0xe5a85a3daa7639b2
	.xword	0xb4d81d97134fb3ca
	.xword	0xee4ce2522ccf0cb6
	.xword	0x5c07558f21d7ab65
	.xword	0x9c080e34b672dde0
	.xword	0x60e66c54f54395b9
	.xword	0xd9bf2fa3e2413283
	.xword	0x04a670e3dad659b0
	.xword	0x42fb38b66e4eb50a
	.xword	0x24793c20afb293cc
	.xword	0xc2c0443a6b0519ca
	.xword	0xc0f4c3ad38380dff
	.xword	0xbbf0a11bc428d28b
	.xword	0x2e001d6163604a8b
	.xword	0x1d50ed0ad343d40a
	.xword	0x5636af734c2edd04
	.xword	0x569be79ef9d5d272
	.xword	0x22bf2bd9b649d411
	.xword	0x12d1a2efd4b9bdfc
	.xword	0x495daa6b99caade7
	.xword	0x163e34720d6ead1e
	.xword	0x6dce2f4702ba4fc2
	.xword	0xbffddb699bee54f1
	.xword	0xd1ae6586d0e00cd3
	.xword	0x0e9037dcf4d72617
	.xword	0x169f2f180369d166
	.xword	0x40c54f407441c120
	.xword	0x81fdbeef78e4e4fb
	.xword	0x6cb33c822dc1ff37
	.xword	0x95f38dd593337392
	.xword	0xdbebdc529e5d4114
	.xword	0x481115bd366ae97b
	.xword	0x0fbeedf71a282c97
	.xword	0xc4cf9a14e50bcc27
	.xword	0x68983362b0f8a54e
	.xword	0xdc3aa59695e9796f
	.xword	0xf358aa2698fb0126
	.xword	0x9bde88d63ff748a1
	.xword	0xb04a9fd1f5cf433e
	.xword	0xf3c005d4e34f660c
	.xword	0x5f569a2569daf35a
	.xword	0xc8750457ce5e65a8
	.xword	0x1efd6aeab01c80a5
	.xword	0xbd7e30133f3448d2
	.xword	0x1b8f00cc80392acb
	.xword	0xe07f37833efac944
	.xword	0xedcadb218ec186dd
	.xword	0xc3d13f35324e4ce5
	.xword	0x10970ebc60d0738e
	.xword	0x5f97113d9952a4fd
	.xword	0x2dd82975be2859aa
	.xword	0x11e42110ae78b74c
	.xword	0xb25c8bb40948a4bd
	.xword	0x7134bb0b23692ea3
	.xword	0xaf3caf4d5ae4f11b
	.xword	0x609fbb63fa686206
	.xword	0x1257528c80e5f721
	.xword	0x7436a5d0845a9c05
	.xword	0x06c14cfc447bfaff
	.xword	0x7762cad865476ba1
	.xword	0x48f54c0a74868f47
	.xword	0x24bc2303b15e9fa6
	.xword	0x5b85bdcdb96cb674
	.xword	0xa6f20cfe824aa8d4
	.xword	0xe36107ff05d4f44f
	.xword	0xbd79d30aafe9505e
	.xword	0xc5b271b0f48466f6
	.xword	0x408676918be0920e
	.xword	0x3bd0737bd88b4b2d
	.xword	0x8eae68bae24042ce
	.xword	0x0e53a116a2cd09e8
	.xword	0x2474d09000c026b2
	.xword	0xc98746f171747f95
	.xword	0xfdd3d1dea8c8b327
	.xword	0x8ef0e345e264bdc1
	.xword	0x703ca8e9bdb46288
	.xword	0x525215edc5e7ceac
	.xword	0x892ffd2c5c30452d
	.xword	0x78e916b050f28e54
	.xword	0xfb2e1fb32e0d05f1
	.xword	0x1f52505cfc5ad821
	.xword	0x93cbd43e5edf2fe2
	.xword	0x4b31be7e0da3e252
	.xword	0x33795cd6e678850f
	.xword	0xfbb4a7d867a0a5e7
	.xword	0xfb5bd077855b0023
	.xword	0xe3f0e22219550778
	.xword	0x8d1eee76cdf02664
	.xword	0x27e50ab9ed84a18e
	.xword	0x2cb76522bc13a43a
	.xword	0x3b7a0a12a29df84f
	.xword	0x3b961de5d2fb46c9
	.xword	0xd3ae5edec0dc1454
	.xword	0xb7ec9cac1601690c
	.xword	0x7eb780f5473f98d8
	.xword	0xa988beded1f9fab8
	.xword	0x082267e2910f78d3
	.xword	0x4dd684d3feae9ae0
	.xword	0x76945ce493c6dbbd
	.xword	0x44919a06d4ced977
	.xword	0x171cba63f001a358
	.xword	0xf85a5200544a781e
	.xword	0xbfa4727abd712193
	.xword	0xca6b2a4d4d5fb14a
	.xword	0x86b4a3db1df1c578
	.xword	0x31ec87b803651849
	.xword	0x5339de516313d0f6
	.xword	0xcc437669a9ab775f
	.xword	0x4208999dab9d4f1e
	.xword	0xf99f5035988dfb4a
	.xword	0xd9117010fd174c7d
	.xword	0xab96d7581f1ba7bb
	.xword	0x09c5dbf762ba51bb
	.xword	0x649ae682c02c2ac8
	.xword	0x665e0f62d1930bb1
	.xword	0x1d1f7f5e86bf5551
	.xword	0x603dcc20226746fe
	.xword	0x23df67711c3fe544
	.xword	0xff901227f4bafc69
	.xword	0xa434e36e1bd430ee
	.xword	0xd1689e1415ec1e55
	.xword	0x61f704e580169d97
	.xword	0xe239371f4cd88f14
	.xword	0xa530954b3e7669d7
	.xword	0x946490e5ebc3cac0
	.xword	0x5290418effd123a1
	.xword	0xf832eddeb5d13607



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
	.xword	0x11a69b88aab34a15
	.xword	0x29022c09a5b495a6
	.xword	0x91f17722a655abcb
	.xword	0x4e6ea28c65cf2d63
	.xword	0x9243ab5117a75d20
	.xword	0x2361913d0e08ddf7
	.xword	0x8abf6145def13671
	.xword	0x5499323411dd8b04
	.xword	0xba178f7d2ff2f113
	.xword	0xb1cecd8ffc428bb5
	.xword	0x6ba9ee33deeb40a8
	.xword	0x0795b0395f697e05
	.xword	0x0bcbd1424e9ac29e
	.xword	0xe455df3b68fd12da
	.xword	0x9e2a02e4f311654d
	.xword	0xe79b97c59b7931be
	.xword	0x23e4e9f0cc33c648
	.xword	0x0ae6d31ee7cf3312
	.xword	0xc9e53f226faa025d
	.xword	0xc5387e97771de634
	.xword	0x0712851be90dfadb
	.xword	0x6e70d9d29c266a93
	.xword	0xa30713be4481838a
	.xword	0xee1562a1ff28162b
	.xword	0xafc3b9b72155e38b
	.xword	0x60349a197617ae08
	.xword	0x61e23d26da677625
	.xword	0x789499770a99d5eb
	.xword	0x01e7335e31e05c89
	.xword	0xd12fd792b3330698
	.xword	0xcd0cece49c859181
	.xword	0xdb9bbd431a0a622a
	.xword	0x405977d148a843ba
	.xword	0x94390ea51a05c709
	.xword	0x1bed6813c9ff5c9c
	.xword	0xad7721da994cf2b5
	.xword	0x73f41ce73507f1f6
	.xword	0x5dab298560154d77
	.xword	0xc31f4dd1a293aa0f
	.xword	0x1437023a7ab3ee4a
	.xword	0x4c4d73bb8b5f3518
	.xword	0x115c2c4ba13ce876
	.xword	0x6390adec3e8e32c8
	.xword	0x0192ed87926b17d8
	.xword	0x0ea960fae75001cc
	.xword	0x102653539b6da433
	.xword	0xcd408c996d9c9241
	.xword	0x7a78d6c5350de5b1
	.xword	0x0b4117c3125b8117
	.xword	0x659318f38d5e7c50
	.xword	0xf42c54caf1eecbbc
	.xword	0x6f1aba63558d3b72
	.xword	0x3164252364414f62
	.xword	0x78afae1869745d6e
	.xword	0xb3e0c4764b5c23e8
	.xword	0xea4499c6bbf5c838
	.xword	0x6222c8ac89aaff8c
	.xword	0x411a72aa8f8124ed
	.xword	0x23845819c0e18951
	.xword	0x88bda08d74a64411
	.xword	0xd470a244a6d10dee
	.xword	0x54250d1abc7f5ca3
	.xword	0x6292e2e14f7ce6d8
	.xword	0x8006f6db7610cd52
	.xword	0x24bdb3ac0e04d359
	.xword	0x11358b3026e95a29
	.xword	0xc75d2c964770ab51
	.xword	0x069fba4d15761dde
	.xword	0xf216cdb71623ee58
	.xword	0x0665632ceca353e9
	.xword	0x33071b1cb6e1ae56
	.xword	0x32db02c4e800536a
	.xword	0xf40043280a6ddf88
	.xword	0x7e745c9ca7069d5f
	.xword	0xc47dd927f31ce566
	.xword	0x181785a5d0e9efb4
	.xword	0x8c7d067e55b30367
	.xword	0x7267c982d2da1c7f
	.xword	0xd6616ab09106a2e6
	.xword	0xb39810e4dce5b854
	.xword	0x5ba54aef6e8f4716
	.xword	0xa57b57e6b5882812
	.xword	0xc2adfb73eaee8275
	.xword	0x9fbb0192ce6fcc18
	.xword	0x66c6117ff10a2ab9
	.xword	0x7f9dedba24be7207
	.xword	0xe917b98a5700dedf
	.xword	0xd625cfac2775297a
	.xword	0xbfb00f21797298ad
	.xword	0x5e0fcb3f77456093
	.xword	0x8e22a396623af3e0
	.xword	0xf74462099e79de69
	.xword	0x095938c5247b7a18
	.xword	0x865ef37393601551
	.xword	0xf13ca0762c7f48fd
	.xword	0x3c529523472357d9
	.xword	0xcb4f67cc64c7342c
	.xword	0x932b01ad21757a7e
	.xword	0x400bf2f23fbe917f
	.xword	0x006ca6b35c147056
	.xword	0x72ac68defe916e34
	.xword	0xa420816dd366702e
	.xword	0x92cd9298bd41aa78
	.xword	0xa0bc2ae446592269
	.xword	0xcbc634ee9ab58b93
	.xword	0x410e1b7e625d5df8
	.xword	0x7ef876df1ed9e7d2
	.xword	0x3fde1a46dd679ab3
	.xword	0x2b717d858f5154df
	.xword	0xd7975819dc718b27
	.xword	0x6dbecdf06f1093a0
	.xword	0x0d55f287eca9ea43
	.xword	0x3396f9d5c6bfa7dd
	.xword	0x3c392af841911c9f
	.xword	0x5192f3897034933a
	.xword	0xf2a2f89c5ebcdcac
	.xword	0x1a58a3d7de744cc1
	.xword	0x7a2e891ea9c54667
	.xword	0xe2c771d73bf725f4
	.xword	0x6cc4e25ceca7553b
	.xword	0x863c282a21bdd923
	.xword	0x0a5fc36dffa71dd2
	.xword	0x61564c189e8d3331
	.xword	0x4d89d34303214b6e
	.xword	0xf7261e0b5ae19b7c
	.xword	0xa1927aa685ed5690
	.xword	0xc0268dc958764210
	.xword	0xdd0fa5fb77306f9c
	.xword	0x67ebffb74da2d6a4
	.xword	0x7d22b2efd43fc8bd
	.xword	0x8bb3e9ab48e117fa
	.xword	0xfa5c77d81c7e6ccb
	.xword	0xf9437737a3c7cbb1
	.xword	0x811a7e0838666832
	.xword	0x4ea78d570556b693
	.xword	0x2d7b394b79df2883
	.xword	0xcecbe29950132ae8
	.xword	0x6cf315671bcea3f9
	.xword	0x7aa4e65896f50574
	.xword	0xf4df85876704d9a2
	.xword	0x9cc0fd4ad8c03922
	.xword	0x91791d4fc98112fc
	.xword	0x28ed40b2c531b4a6
	.xword	0x5622cd2e34587637
	.xword	0x37e51e4e2a42a7d1
	.xword	0xf29485953cace137
	.xword	0x2c056912f9b306de
	.xword	0xad8a6524c9d2700f
	.xword	0x9ce0d895c65ff1cf
	.xword	0xa19df3bd5cff1b33
	.xword	0x55911155a4f8ed4f
	.xword	0xfed4114a82308cb0
	.xword	0xd7ce370bda658d90
	.xword	0xc517e06d72866316
	.xword	0x6a864fd25c35b58d
	.xword	0x2f838d713f0f1d8b
	.xword	0xb9e000b04c49ec8f
	.xword	0x90b4bba78e07e067
	.xword	0x4e18730bbf2ca4ee
	.xword	0xf725904cfe049021
	.xword	0x56c6049bd2b957c4
	.xword	0x21e4e5223c667460
	.xword	0x75162523ec604422
	.xword	0xb301bc329209ea93
	.xword	0xeefb7641aee0d5ec
	.xword	0xed8cb373e5299063
	.xword	0xff9e403d0ea2d76e
	.xword	0x0d29f380637e3b91
	.xword	0x8b18c8bfb3f71147
	.xword	0xba1d051859d70077
	.xword	0x95ce54ebd108af31
	.xword	0x25a0d90fad8ea2b4
	.xword	0x3dc070a97c8e18cf
	.xword	0x398c0bb96c81a824
	.xword	0xd4dc5eb1b9ffdcef
	.xword	0x4c70096fa3ed2764
	.xword	0xbb377fe1a18d513a
	.xword	0x36dddfedff2799a8
	.xword	0xee3330dda3779b8b
	.xword	0x0d63a70aeacc6c39
	.xword	0xa60b83f101358685
	.xword	0x1e7e473ff6b62ae9
	.xword	0xa8f68ce2f21285b2
	.xword	0x2dde0ca44e3f8ac3
	.xword	0x2f3e623db52ce691
	.xword	0x9faaf680f1214f30
	.xword	0x1a3add550d3b366f
	.xword	0x855f4f7f263ca6f9
	.xword	0xfd7eaf8fc0fa0986
	.xword	0xd5664eec06d4a1bd
	.xword	0xc3f3d36ef74a45f4
	.xword	0xc67bb83d7456abe7
	.xword	0xf8ac9162ae4ed9de
	.xword	0xd6872c74b7fe6772
	.xword	0xfb5ae6cfb2b1b016
	.xword	0xc9b3f34c21f61b37
	.xword	0x26a8248e960ed098
	.xword	0x286d219f60e2ed8a
	.xword	0x7069201bdffdb74f
	.xword	0x094d6eb33d8832f5
	.xword	0x5b978d68b58ea0f2
	.xword	0xdab664543f55e317
	.xword	0xe0a64a5550c3b947
	.xword	0xfff63b0d2602a3f4
	.xword	0x5173d420774b1c9a
	.xword	0x42e08a5ad0b4a305
	.xword	0xbe273a0a7d588b2b
	.xword	0xee8e34bfae42294a
	.xword	0x413f5de23f8bf55f
	.xword	0xeeac883e1511515d
	.xword	0x49ac1f52ea8d8f09
	.xword	0x02c9f4882a5fde6f
	.xword	0x69d70f6fc029d506
	.xword	0x2324b4d15cf83a40
	.xword	0x1f8d1b04155e245f
	.xword	0x8f813a30cad08d63
	.xword	0xb686434b340dbd43
	.xword	0x0fe8f842b8fff180
	.xword	0x74aab82e25278b6b
	.xword	0xd0b5b1c6fd6b79d3
	.xword	0x230cd1525e59cd3f
	.xword	0xa406dfac9b9b4e74
	.xword	0xaeb41aa2a918214a
	.xword	0xbfe16136596069c4
	.xword	0x721231b9e3660ec3
	.xword	0x4c1f15f5a5bea12b
	.xword	0x619484e18f2969f1
	.xword	0xd97f50051c3628eb
	.xword	0xd61f9dfe99052207
	.xword	0xfd5f340b2d7fd384
	.xword	0x2189c60e311d4d17
	.xword	0xbca09c69c3451f84
	.xword	0x2ce6deb89b451770
	.xword	0x0dcbefc55ee1ec19
	.xword	0x24218a962dc04654
	.xword	0xc87c1f2f84f5c038
	.xword	0x91c3b156742e816b
	.xword	0xdce0905456cd1600
	.xword	0x1018a36e44507218
	.xword	0xc7079f41fb702c5e
	.xword	0xf60fb7d1d600df0b
	.xword	0xa3166db38ad12e61
	.xword	0xb34bc8b1b70840df
	.xword	0x2ec45f4f53a3d490
	.xword	0x889cce7d76401d65
	.xword	0xe8f01a50c12e5ec5
	.xword	0x8fc91ed595cc0988
	.xword	0xeb5d44dbd33ec5aa
	.xword	0x519d2c686c230cf7
	.xword	0x0fcf8c688b755f91
	.xword	0xfefcffc20ef513e9
	.xword	0x05961f446aa360b9
	.xword	0x6a4b77bc67463cb9
	.xword	0x764166600f7a006c
	.xword	0x86fbed4446683bca
	.xword	0x93be2842c392f38b



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
	.xword	0xea7ebb1a37ab8729
	.xword	0x47a7a4f4018eeee4
	.xword	0x2a8970a080b7e367
	.xword	0xb4a014b82d7ceffb
	.xword	0x507f3db5a9fdc904
	.xword	0xde3fd220bafcbe83
	.xword	0xeb448983fcb20b1b
	.xword	0x314360628115722c
	.xword	0xa6c4e7170b0c48e2
	.xword	0x7befd3f9267680e9
	.xword	0x227f4ad662bd2343
	.xword	0xbaef2222dd12fe32
	.xword	0x20eb9e715165f7bf
	.xword	0x2fa928db72f1246c
	.xword	0xa256b05a984b537c
	.xword	0x72f94ca51abc3383
	.xword	0x6919676018b5b5b1
	.xword	0x3c56a03b9db2dbc5
	.xword	0xec8f72cb11b316d5
	.xword	0x4326a4e25b806b1a
	.xword	0xbd47aa7e061f73b9
	.xword	0x1e62d261f52c59d3
	.xword	0x24a7dc7d03f4769c
	.xword	0xfd76697d91f0faec
	.xword	0xa0d45b5633e786fd
	.xword	0x688f3a3f4d55ad05
	.xword	0xedac24552accfba2
	.xword	0x58a41b10ca1ebe10
	.xword	0xd25164abb6a76f39
	.xword	0x3b5d5d1f9d23767f
	.xword	0xdb2d45b33716b012
	.xword	0x7940cf73e112bad6
	.xword	0x825a4e2296d0b9c0
	.xword	0x84b52881c483e4ba
	.xword	0x0070686548cf965c
	.xword	0x06664f860da930f4
	.xword	0xb0e862bbed6a87f0
	.xword	0xa704cb3ecbd62262
	.xword	0x5d6c05c551560398
	.xword	0x1e93909feb05d3aa
	.xword	0x337272930247b2d7
	.xword	0x510ec70f096bc61a
	.xword	0x45d337e098ee3b0f
	.xword	0xe25531b113f691cd
	.xword	0xd8924c23a2f82a16
	.xword	0xec8ac8e4eeac7544
	.xword	0xcf9fb9da8bd404c4
	.xword	0x60c31ec111193a91
	.xword	0xf766b7b6030fab6f
	.xword	0x5dbee662c5ef24df
	.xword	0x04dbdeab2fe7dc88
	.xword	0xb70f330e521e6a02
	.xword	0xc0c0ff0d02106519
	.xword	0x376889a5f650ed05
	.xword	0x380d41dcc5a2d4db
	.xword	0xe493e87ed8b323c3
	.xword	0xda6f58bb4e5b1512
	.xword	0x4f988d2befbf2446
	.xword	0x12b2375a7ddd7552
	.xword	0xca8ca83e2e04416c
	.xword	0x8eb3359e24fb7694
	.xword	0x464ef61fc83d0384
	.xword	0xc4d501ede5fde2d3
	.xword	0xe95fc714f0c17013
	.xword	0x502fa84ce15d8b4e
	.xword	0xcef5a4029e5df50b
	.xword	0xfcc3c223f225cdad
	.xword	0x1b6a157447c7cbf1
	.xword	0x6a3cc3f105983493
	.xword	0x8146b8a7ae46232d
	.xword	0x4d6561aaa7890828
	.xword	0xf3bd5a5c9b0d56a4
	.xword	0x1e45f23b9f4d7330
	.xword	0x05d785723baad5d3
	.xword	0x4ad076261dd6ed72
	.xword	0x24431da7ff150870
	.xword	0x285ecb1d5f6e2820
	.xword	0x7010ff2e756ddd58
	.xword	0x6d4ad7b6ecd28ef5
	.xword	0x1e4be9bfafe2ff93
	.xword	0xf259fd994056e46c
	.xword	0x99f4b458faac8677
	.xword	0xbd4c2fb2a4c6454d
	.xword	0x2735c6089495fafa
	.xword	0x75b3dc8ed0bcf699
	.xword	0xad3b57fbb0ad931c
	.xword	0xe86e7e3cffe85311
	.xword	0xe6d36bd8928b3e06
	.xword	0xa6399c075856561d
	.xword	0x0b35c6185d34585d
	.xword	0x484bf65069fdd158
	.xword	0xe4441cf4edde6d28
	.xword	0x842d47b2de9f5164
	.xword	0x85f0ce97a0e3f1af
	.xword	0xe2fab27a800f77ec
	.xword	0xce1d108d9c7919a5
	.xword	0x5ae4fafa00a65185
	.xword	0x63947dd7af52f1f0
	.xword	0xc7e82019bc8fb284
	.xword	0xfd58d507b158589b
	.xword	0xe7c7547fa08b102c
	.xword	0xcf5dbc0bccc344b9
	.xword	0xd7466966c13e7a48
	.xword	0x666314c50f13ed92
	.xword	0x4d6afb45130a3757
	.xword	0x90c8133decb1f641
	.xword	0xcb13b65287a79add
	.xword	0x0b2791abe70be760
	.xword	0x51dccc9de3395eca
	.xword	0xf5e3a17fd659ac85
	.xword	0xad5ae63d8145231f
	.xword	0xe86a944166387a3b
	.xword	0x2afb70596b425b89
	.xword	0x2614f00a48b4078f
	.xword	0xc18deae055da5832
	.xword	0xf6aa4ce8e8444f4a
	.xword	0xa21b298859aa8585
	.xword	0x371d5daa556ee6c5
	.xword	0xaadc4675a52612f5
	.xword	0x014aeaca52e564b1
	.xword	0xae83021c6a14f0e7
	.xword	0x186201950c32bf28
	.xword	0xafa33f9240249b90
	.xword	0xce0e389eb50ff1bf
	.xword	0xbc34b4772cfef5a0
	.xword	0xbf5f5e1ee764cee5
	.xword	0x2452de7c2301abda
	.xword	0xc666944bd5b94f08
	.xword	0x2ae8b56ff4ebd00d
	.xword	0x1fda86bec521b069
	.xword	0x4335e3c5be68d285
	.xword	0x1bc64c06478b92c0
	.xword	0xb12a2d7ce8149a78
	.xword	0x3dbee47db5d981b0
	.xword	0x04ef2ba1c232c4f5
	.xword	0x5defeda3ede3bdc1
	.xword	0x11eeb6303a484cd1
	.xword	0x854fea24357ad961
	.xword	0xf726b0f2abd5bd43
	.xword	0x8f369a914744883f
	.xword	0x5f0af4db84cb6b7e
	.xword	0x0ca8c3a0cba2823d
	.xword	0xd632b995562b6b5e
	.xword	0x428e934043c5ac11
	.xword	0x940e933d42483e97
	.xword	0xa90c6261847d9f46
	.xword	0x0f207ae1ef5b238b
	.xword	0xdc09ee3601d26b96
	.xword	0x4619a50dbf126192
	.xword	0x46ff07713ede24f5
	.xword	0x1d9b017da09aeaa1
	.xword	0xda67868433e8f201
	.xword	0x12fa5de67b613779
	.xword	0xfe089ea05fd15db3
	.xword	0x25033726e9b136d1
	.xword	0xa6b83fd950de0c18
	.xword	0x4201f27cd363d860
	.xword	0x2a0c2f017b4bf3dc
	.xword	0x02263a2035017793
	.xword	0x69915f5774311a34
	.xword	0xb99fb3c558b68cb6
	.xword	0xea4b11115fbd4c21
	.xword	0xf094e23cbef9c766
	.xword	0x1d1228392b318bfa
	.xword	0x32b3031fc07d8619
	.xword	0x8612fcd2c848997f
	.xword	0xba6a49f9c03247e0
	.xword	0x1d02de2c1d78b40b
	.xword	0xd6e5565bc1dfdf4d
	.xword	0x44a1f35464ea020d
	.xword	0x5cdd65bdd396e8ba
	.xword	0xe148c5367e577498
	.xword	0x37e10e5c7285d605
	.xword	0x2ca0aad3e2e7d5f7
	.xword	0x1bd46c428a785c69
	.xword	0x0062fae038a760e3
	.xword	0x1043a3fa67e7b578
	.xword	0xdf40a5933fbb33b9
	.xword	0x21c3ac995df70586
	.xword	0x29240e99809a1c7e
	.xword	0x98eb8a2fa717fd83
	.xword	0x3919be7376515035
	.xword	0x2eadf866781d0026
	.xword	0x4a92f8ea3df0f5f6
	.xword	0xcb648009d0d0f2fc
	.xword	0xe1b7db191d6828e2
	.xword	0xe182c48e5df90176
	.xword	0x7a0ab8338758766d
	.xword	0x633a926eccbb8b11
	.xword	0x999ebc4cb46de768
	.xword	0x78145087bcc2d54b
	.xword	0x6682cc4820a31594
	.xword	0xc175e37f32f023dd
	.xword	0xaca7f7dfe671a148
	.xword	0x1d7eb4900d030fb8
	.xword	0xb912436ac48d4118
	.xword	0x40ea7e7b61421938
	.xword	0x9d171b8deadbe3a0
	.xword	0x55db80c8b670172f
	.xword	0x1b8cb603ac567671
	.xword	0xeb88539f17ce5fd9
	.xword	0xbcfbf9e00ea0cb03
	.xword	0xeb8e2872384daa44
	.xword	0x1a22ebe3d9e3402d
	.xword	0x67932aa444a6eda8
	.xword	0x43b05d6f698792ce
	.xword	0xf59d810a9eabcad6
	.xword	0xe4a9381235d3bb95
	.xword	0xd105c3b7e157ac0e
	.xword	0x92019eaf530f1bc2
	.xword	0x1725573582df13f0
	.xword	0xd4e6d1483ccb024b
	.xword	0x1d908cb5929da539
	.xword	0x917c2e97bba4e962
	.xword	0x959a33c44764df69
	.xword	0x3f8955a80ca118bf
	.xword	0xd0917d0f22853101
	.xword	0x2edf9cc355c91e9b
	.xword	0xeaa8e5b83181702a
	.xword	0x20c37fd663bf89a8
	.xword	0xa22e518cd4d63428
	.xword	0x8ca04bf6aed091bc
	.xword	0xa978e3fc01e7db39
	.xword	0x1eec46de56f698d6
	.xword	0x36ab7a5af6fe1fea
	.xword	0x4943d8c73438f358
	.xword	0x9737cbedf7de7fff
	.xword	0x5ffd1bc1a19c998d
	.xword	0x289e9a5e60ae1231
	.xword	0x9ac51633801b5b39
	.xword	0x081fa0fbfec19663
	.xword	0xb956552feb2a7be7
	.xword	0x7680276a9311f94c
	.xword	0xbdc09cd38973287c
	.xword	0xa47687e6ded919e5
	.xword	0xc65e319011c76373
	.xword	0x831b831549477fb6
	.xword	0x3cfdb3604f215e0a
	.xword	0x8072cb5931bc4324
	.xword	0xa671323948db4f39
	.xword	0xc65186667c1171e9
	.xword	0x9891f70877610469
	.xword	0x0e2ac9a5e37cdc0f
	.xword	0x1c1e5348d1a284f2
	.xword	0x8191cdd1d15a5176
	.xword	0x378f1016e711ff2f
	.xword	0x909c22fa18e66024
	.xword	0x1a27ccaaebd1bd08
	.xword	0xae3d8738034dee9f
	.xword	0x481e2ad32a4818f3
	.xword	0xc1a0718c349cc232
	.xword	0xa026599abcfa5be4
	.xword	0xf6cccd2578c73f30
	.xword	0x9de41084c2033709
	.xword	0x7138f00031974633
	.xword	0xe2b0f0aa1f1ccd29



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
	.xword	0x3093a8b4a6ef1190
	.xword	0xa6014fc81190d133
	.xword	0x721efdd93f1dbc0b
	.xword	0x3c14055f2a8acc95
	.xword	0x949602c51047ac11
	.xword	0x1b5ae8afab3f4139
	.xword	0xe5c14cc439d97dcd
	.xword	0xd5970df24c828785
	.xword	0x7fc4b34456606c69
	.xword	0x0d633156844a972e
	.xword	0xf0500e877e40805b
	.xword	0xb81a8da0280a25b8
	.xword	0xfe4f33c4097683c7
	.xword	0x513eb201bf2f8a42
	.xword	0xc153cf79d6370158
	.xword	0xb85ebdb249cd57c0
	.xword	0x3e5712839f28c94a
	.xword	0xa36ae50e6a3e7618
	.xword	0xa1f7aa12e6f26527
	.xword	0x5f9d5b4f137e2592
	.xword	0xbed7cc8b9e97bd88
	.xword	0x23784ca644d41d35
	.xword	0x69db9800074c23c3
	.xword	0x81cfb7e6722baa0a
	.xword	0x941187e655669d53
	.xword	0x8cce98ba16bfe936
	.xword	0x5e2e8ef0ec3ab649
	.xword	0xab75ce508d5ec643
	.xword	0x5897a919ec3be027
	.xword	0xeae7d03de6f3f2b5
	.xword	0x0b1c0a24b5ad1e0b
	.xword	0x43ec5de0dfb95e2b
	.xword	0x874e3470c0eb5e82
	.xword	0xa21b43c7afda16d1
	.xword	0xb70ca52c5515f3f7
	.xword	0x7205c624ea8b4eae
	.xword	0x8a887c6fac857e43
	.xword	0x97387211b8bd2405
	.xword	0xce0ab0fad0fb6b16
	.xword	0xc65c69a527119b75
	.xword	0x3b57ecc95a2de736
	.xword	0x5b6440e8af7a440f
	.xword	0x7d4916e8dbd0b31a
	.xword	0xb64eb34fdb0d0df2
	.xword	0x41370bb41970bd89
	.xword	0x0c636fb565265474
	.xword	0x9c33262538bfd692
	.xword	0x759b8be15458e3b5
	.xword	0x290a45e59ce674ba
	.xword	0x6891aa7fc1658ba7
	.xword	0x631b3a553b2de1fb
	.xword	0x65b6cc65a24711af
	.xword	0x92e8898a470deeea
	.xword	0x9f5cec2a72f2bc57
	.xword	0xcbf4ec8bc8c0e672
	.xword	0x4de4a53758b0854a
	.xword	0xecba286b1ac812d3
	.xword	0x3cdaea1a9ddb18ab
	.xword	0x5877cd25f37a935f
	.xword	0xb2a07a4f952eddb7
	.xword	0x5ad8895d5f9c73a5
	.xword	0x95fdc50cf1936df1
	.xword	0x7bb861b5618ba18d
	.xword	0xe2d60c5b6600a85c
	.xword	0x98293e16370c7269
	.xword	0x63894319acebadfd
	.xword	0xddb00107be779fc7
	.xword	0x766aa18a7189aa9a
	.xword	0xae9ad4dfa80d5237
	.xword	0x33b2d3f06d7908e1
	.xword	0x165a19a8efd7e09a
	.xword	0xc36548b26411ec8d
	.xword	0x2042071498e3f460
	.xword	0xf61dcb7dd42e04f4
	.xword	0x003dc9700a734d8e
	.xword	0xe7e31228269c9bb5
	.xword	0x27229f395bfdef79
	.xword	0x73b4230aa892eabf
	.xword	0x3474e2c710036dde
	.xword	0x5ed135313ebf6912
	.xword	0x4fc8d6540f5a8011
	.xword	0xd123646d31e44745
	.xword	0xf9777aeded93c181
	.xword	0xdec8b69c8be454ad
	.xword	0x17fb8bc35e83da1f
	.xword	0xf4009a1b26ecaa5c
	.xword	0x3318e00e5af8e0f1
	.xword	0x32f86c24048c9c57
	.xword	0xde911106042feff3
	.xword	0x1e44c4e2bf1e76ed
	.xword	0xb484dd12671d62bb
	.xword	0x53f818b96238430e
	.xword	0xed98b3fa02fcc267
	.xword	0x289770aa8f55be32
	.xword	0xab9260a556f9e221
	.xword	0xffbc60747064c2e9
	.xword	0x709ea3de2e552e82
	.xword	0xfa43b4618e63ceb3
	.xword	0x54ab094ff4d3f74a
	.xword	0xc133af1a070c7e91
	.xword	0xf113477ca36228fe
	.xword	0xf9dee6747fcae6b6
	.xword	0xda53afe0739c7e87
	.xword	0x245cb2f7782f475e
	.xword	0x77e92565c9c48220
	.xword	0x74780e25e8cced8f
	.xword	0x1caed8213f384fdf
	.xword	0x1a177160ca480017
	.xword	0xa9773a9d45082b21
	.xword	0x357ec2e036c54d38
	.xword	0x2cd802ff98bc377e
	.xword	0xc6825a6f62ef97b0
	.xword	0xd28aeca956a35f64
	.xword	0xe387249dd9483036
	.xword	0x2ac574068bd9cd16
	.xword	0xde3c63443296ff9e
	.xword	0x04c3979f6a8d7d83
	.xword	0xe0a8c2d91b001a98
	.xword	0x867d0e9fae77c679
	.xword	0x9c196b905a2e3e6e
	.xword	0x7012adef9a9eb895
	.xword	0x55f8f37616f1f717
	.xword	0xbd2ecd0fe565f34f
	.xword	0xc182df692a1902ef
	.xword	0x9458544df893d370
	.xword	0xc6be28ee295090a8
	.xword	0xfeaadabb9c6dfa19
	.xword	0xd70b76397fdd7e31
	.xword	0xb1ec1220b54d069d
	.xword	0x986a1245ad868b63
	.xword	0x78f208b08ed38306
	.xword	0x558e83d118495879
	.xword	0xe2328ab34eac5454
	.xword	0xf0fd19dcc9c86475
	.xword	0x2716a3d2fac842a0
	.xword	0xd1a26a4a44964e70
	.xword	0xc63501a4c82b6bf1
	.xword	0x9223f7b488295c9b
	.xword	0x6e3df3c042a0e3fe
	.xword	0xa06fb65926334db7
	.xword	0x0d223883685d9e50
	.xword	0xd50751aeb05f21dc
	.xword	0x26edc0b843d31571
	.xword	0x50897528ac1b1b1e
	.xword	0x41cc627f045bf2ee
	.xword	0xec42e1a256465fb4
	.xword	0x65f067a0c5280a49
	.xword	0xc5384f41a15236e1
	.xword	0xb5174554001ffcc0
	.xword	0xf0e9fb2835792293
	.xword	0x9b8cd963d5e6d427
	.xword	0xce480984dfec6962
	.xword	0xb4f5bb9063bbbe52
	.xword	0x543ddf2ac637aa19
	.xword	0xe3b54d07fb953b84
	.xword	0xf9d02faeb58a946d
	.xword	0x7de6e8640d5de510
	.xword	0x9a7270ec4ea12d5d
	.xword	0x20a4d6d0296dd4e5
	.xword	0x7ad68c60dcaaea2e
	.xword	0xea58d82bab84de5f
	.xword	0x22d1388f18e5d396
	.xword	0xe7972e15925f98eb
	.xword	0x4c6adeaa9a512f3d
	.xword	0x687072064f12d524
	.xword	0xd76dc662a2593346
	.xword	0x1345473a4178de16
	.xword	0x90ad601293f48d33
	.xword	0x0a2b2105eb12760a
	.xword	0x54cbc0b0e6ed87f3
	.xword	0x11a530aa39a599e0
	.xword	0xf98ce60c847aa8d9
	.xword	0xbf0947b9cc1ba647
	.xword	0xbedeb17b91a76cda
	.xword	0xa41753052e3bde6e
	.xword	0xa66e4934facbec93
	.xword	0xbb685e71001067b8
	.xword	0x858074e0f201601b
	.xword	0x126cd6e3fb29dc60
	.xword	0xc892f4b7a9bc7b4f
	.xword	0xa7d83addcacbdf31
	.xword	0xf30d39a13419156c
	.xword	0x82522d0a69329fe1
	.xword	0xbd1737d8dd1f18e3
	.xword	0x336f4ac78df4f542
	.xword	0xe260fbc9cbe5eaec
	.xword	0xa86d141bb93b4444
	.xword	0xd07b0f013baeaa65
	.xword	0xd8033a07dced5fa8
	.xword	0xcc0699e3f392abb0
	.xword	0x3f40852a23026f97
	.xword	0xd304de4e9d4381b0
	.xword	0x1f66d57f820d7597
	.xword	0x82fde9c9ef5d28fa
	.xword	0x4936db39e4e87b3c
	.xword	0x06c63d8669d058fd
	.xword	0x8878ab3168de4ec8
	.xword	0x592b43c7e80ef4d0
	.xword	0x28d2d50b5536e2f5
	.xword	0x81b25014b8ebc8e9
	.xword	0xccce06d1921de2f5
	.xword	0x90a6bd6397d8d3d7
	.xword	0x41e1b39fc0cc5a0b
	.xword	0x2a78c52e9bbea14f
	.xword	0x14cc2898fa346298
	.xword	0xc33cf1f3db426f53
	.xword	0x8be7d6f84dd12382
	.xword	0x5c849862facb72cc
	.xword	0xa9205de6c6539c85
	.xword	0xaca3036dd70820c7
	.xword	0x48b032a71f8d53c1
	.xword	0xe550fbfdf53796eb
	.xword	0xad3965235ba0b29e
	.xword	0xc0ee92928040116c
	.xword	0x0be8c24398794637
	.xword	0xb497f80f5f2dd190
	.xword	0x18e3d78df1089a18
	.xword	0xcf18cd6e66e378aa
	.xword	0xe76693a3d0184f6f
	.xword	0x62befe95a734b1f4
	.xword	0x74bfa636a4969d88
	.xword	0x20f10c47fcfe3286
	.xword	0xffb4dd2f5257cf66
	.xword	0x7ceddcba9434adca
	.xword	0xa28d80dd2fd6abc4
	.xword	0x71a8daecef502006
	.xword	0x247ed0d5e6cacc15
	.xword	0xb8eeead875969c33
	.xword	0xe6b6208debe5575c
	.xword	0x4c02d6d57107e4af
	.xword	0x517f65fef93cb3f6
	.xword	0xd276a9dbbe306ac9
	.xword	0xb8e0ee9e0ac43f40
	.xword	0xdf8ddd5736c942c3
	.xword	0xeb13ef76b0c08df1
	.xword	0x293e389d96957ace
	.xword	0x71fdeee05ea24725
	.xword	0x326adb1ff17715b0
	.xword	0xf531b22456f6311c
	.xword	0x129a528262908c89
	.xword	0xfcdb582d50ee7a4b
	.xword	0x11864b9227579141
	.xword	0xce0aafc665ce9302
	.xword	0x6d5b37a5a6508d6a
	.xword	0xf7159b5114eaa5e6
	.xword	0x70c43575d6e076f1
	.xword	0x20c1e8d1ff8ce4d0
	.xword	0x1f8c09357e55deb1
	.xword	0x13fd2fd9afb8f1d4
	.xword	0x749998f8fe5e417c
	.xword	0x3ab9408c74d979db
	.xword	0x17225e673b26ed72
	.xword	0x8339a63938dd6030
	.xword	0x56fde7cb50c74c25
	.xword	0xd6f9760fca99a975
	.xword	0x1f8d07a841ee7f70



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
	.xword	0xdf657be96f47e895
	.xword	0xbcd6e7a195129545
	.xword	0xc04050814d37a601
	.xword	0x139d034391e6d5c7
	.xword	0xb1043ef08998d62f
	.xword	0x979868ea65b16877
	.xword	0xf32775f23181a7de
	.xword	0xbd3b39554c61265f
	.xword	0xf3c7f6cf255f139a
	.xword	0x18aa718bbb76a482
	.xword	0xb14e156238176f52
	.xword	0x1e9fadd8e09a5062
	.xword	0x710231c0a1eef0f6
	.xword	0xebe29c84f65b03cb
	.xword	0x9fff7cb8fc1c8d83
	.xword	0xd7fa73e7454f8e66
	.xword	0x961cffab69932e75
	.xword	0xcccbbe20c96a203a
	.xword	0x2f2f88a521967c71
	.xword	0x66635befc35dbfee
	.xword	0x8d522b3a6dd548fd
	.xword	0x5a3c5fc5768c6f5c
	.xword	0xa22a4ff88a13ce81
	.xword	0x9265ee20dd716768
	.xword	0x4423a07b1c5b5927
	.xword	0x64f2f1d5532b5339
	.xword	0xadab0a9b839775d1
	.xword	0x0e2125ce81b0bb5f
	.xword	0x5714d3e93ec0a03f
	.xword	0x20ff412571d12d16
	.xword	0xb701ac60faed58eb
	.xword	0x94d7d872c69d8310
	.xword	0x8be4146bf6d4ebe9
	.xword	0x64fa80b73844545e
	.xword	0x982515d9ea16c3b0
	.xword	0x2cc1dc0b3674de05
	.xword	0xc49abf416194d790
	.xword	0x6add2e02987284e4
	.xword	0x12b2ae901f82bc9e
	.xword	0xe4cbd728da1ab259
	.xword	0x095d4289adca0ff1
	.xword	0x52bad97b2a9f1f20
	.xword	0x31306d77d30db0e4
	.xword	0xd6357868df9bc00f
	.xword	0x40f7af17057dede7
	.xword	0x58bc179dbdb65d93
	.xword	0xac46ee4efdef5db7
	.xword	0xca7ca3131396e102
	.xword	0x9a409f455975c2e7
	.xword	0xadbe9ecb968b5e91
	.xword	0x3a3d5bcad244c39f
	.xword	0xdbd51863770b5efd
	.xword	0xaa200b96786c4284
	.xword	0x54dc021c327fe6e1
	.xword	0x0015600b0c633049
	.xword	0xf87eecd1c3c7f065
	.xword	0xb39433c95b4d7dfa
	.xword	0xdd721ad463c2598e
	.xword	0x7b343b7037d22eeb
	.xword	0x57be052377e758d1
	.xword	0xe7c8da1edddd2761
	.xword	0x5f61b03c20ed3f0b
	.xword	0x0e6f15c0181b8463
	.xword	0xc6f0850949ffae8e
	.xword	0x41f31c94ddc838b7
	.xword	0x4f461b699fb99e87
	.xword	0x7df59708551741a3
	.xword	0xffcdd728fe381b6a
	.xword	0xbb4250660d24f938
	.xword	0x7e08c7093ddd3e5d
	.xword	0xfbb8598706761ecd
	.xword	0x50b85167f5377b0e
	.xword	0x831790ffb5f439d7
	.xword	0x0e0fe8731ba14e38
	.xword	0x099017048a8e856f
	.xword	0xa863a29fa6f7e05e
	.xword	0xa752c4bcf815d4b5
	.xword	0xf305954c27cef163
	.xword	0x3e59e5af92ef2b06
	.xword	0x23b5f4d17f86a430
	.xword	0x409f0f1a54dc8a2c
	.xword	0xb11b03c7e19950d4
	.xword	0xa8291eadd5000c78
	.xword	0xf98cc33245b59471
	.xword	0xad106fc8ff22a869
	.xword	0x801f7b6b3436e807
	.xword	0x18fe748b37a98d4a
	.xword	0x1c67904fe1fd27ba
	.xword	0x35198d8367a2738d
	.xword	0xb66ab08735b048e2
	.xword	0xbca04901a57aa3e3
	.xword	0x2a660cf34ffebdb8
	.xword	0xcea48a226394ef9a
	.xword	0x3881f1b041448cbd
	.xword	0x4a64d46c067c75bc
	.xword	0x24866d544bd1ccff
	.xword	0x105d2e52f194a426
	.xword	0x631e5a1dd4a73d18
	.xword	0xd779faca5ca3186b
	.xword	0x4aa380f8bb5de9a2
	.xword	0x327d9814bf3887d2
	.xword	0x0fce666843fd3177
	.xword	0xee7ca3365b88666e
	.xword	0x9c0b391f45c1344f
	.xword	0xb109a9066fbcaea8
	.xword	0x1af9a421bcb3b3ae
	.xword	0xbdb48d36c61d62e9
	.xword	0x0a83d5d842f9dff8
	.xword	0xcb32be4535db4b80
	.xword	0x61d149621fc509a9
	.xword	0xdcd7de1bc2e6fb46
	.xword	0xd5efa96cfb3d8ed5
	.xword	0x03ce305faffe27cf
	.xword	0x1a0184869d3cfe6e
	.xword	0x05a9d34f311d9b48
	.xword	0x73609df516af2499
	.xword	0x52879c9d3045c3ea
	.xword	0x0a921789e24581d5
	.xword	0xa32cc3bf5197825a
	.xword	0xa16703fd862971a2
	.xword	0x84bb9c5d178536dc
	.xword	0x4b681fe5d6304dd1
	.xword	0xd3b20b13f60eaebb
	.xword	0xb93344d50d15328a
	.xword	0xbb79d34cb83804db
	.xword	0x2ff313a063eaa9a0
	.xword	0x4bbb252d3b3b29bf
	.xword	0xa71a907667d04a28
	.xword	0x1b53c3395cd8e26b
	.xword	0xd783adf6c12dca95
	.xword	0x26219f8c8b5941a6
	.xword	0x9964f6fe3d575bc7
	.xword	0x785f387da2a261d0
	.xword	0xa1624b5f4a784411
	.xword	0x0324df249129e913
	.xword	0xa1b15090891a285e
	.xword	0x3f252822874d4aff
	.xword	0x1d4a186c60270812
	.xword	0x5b363983270b5e27
	.xword	0x78031d71d8b341b1
	.xword	0x489aee9cb85f203f
	.xword	0xf9ce7e2afa0e6c10
	.xword	0xf9ee4238ec4a8277
	.xword	0x3646ff63eb668296
	.xword	0xd24768a4e9f19acd
	.xword	0xa62a84d08ca3483b
	.xword	0xe909af60a17cb0ea
	.xword	0x2832641e7e2c8a6b
	.xword	0xc17a87cd193ab147
	.xword	0x4eedda02ff39cb51
	.xword	0xe1470863f3538140
	.xword	0xb75d88783a554f6c
	.xword	0x17ac1f97c5a0f5ce
	.xword	0xe7791e42dfb1a710
	.xword	0x4dc2a78c07594a6e
	.xword	0x0bdc2770e80f89fb
	.xword	0xeb671b59fc346617
	.xword	0x0b05e74e119f3655
	.xword	0x17018bea938368ba
	.xword	0x1041d5b750211014
	.xword	0x433db7f933e88c54
	.xword	0x2b41014568f83b3d
	.xword	0xde032fcc14f46ffb
	.xword	0x385f6752c26fe677
	.xword	0x051ee122c4413f64
	.xword	0x3202c9095c748fb8
	.xword	0x5cb0e201849d88b6
	.xword	0x10a480183b7f50d8
	.xword	0x533c0f949cd564ab
	.xword	0x930717634d09b5f3
	.xword	0x0c3a0a35397f2425
	.xword	0xba811dbf9a53f600
	.xword	0x8b3371c67b5aa336
	.xword	0xa62e39ba683cc23c
	.xword	0xcddcf159a98b2d9e
	.xword	0x7a4274632e308fd8
	.xword	0x425faab101be3b56
	.xword	0x8bf918968351b52c
	.xword	0x4ca4880438f223a5
	.xword	0x24cd4b4c33f862cc
	.xword	0xac2cb860cde6ed79
	.xword	0x8e4e674f9bc83245
	.xword	0x2e1c3e5be7768602
	.xword	0x7382521e4ca84edb
	.xword	0xd374bb2361038273
	.xword	0x61cbfd605996e880
	.xword	0x536b9d799e759773
	.xword	0x7f5fc01f979a09bf
	.xword	0xb1bc7fa220dd833d
	.xword	0x9cf435797a83678b
	.xword	0x93ea6aa409a925a9
	.xword	0xc983ccd50ddae518
	.xword	0x79fd971ecf36a6dc
	.xword	0x561eddf1f8d20729
	.xword	0xede56a94ec07750f
	.xword	0xb0a765894295beca
	.xword	0xc1f03d34056d3172
	.xword	0x2cba888285c11630
	.xword	0x3f8d5c7a58343cf2
	.xword	0x0036192d5b5f86ab
	.xword	0x76488f416269605a
	.xword	0xd9081955e6008f7d
	.xword	0x7a71a68170a26e04
	.xword	0xb19e2a5ad1a2c4f7
	.xword	0xc60ab0467faef00c
	.xword	0x357cf519f3bef06f
	.xword	0x725e0ed55fe4e5b5
	.xword	0x788b7193bce5680c
	.xword	0xb0d87c1de6121d0c
	.xword	0xcc11e83b71f78c5a
	.xword	0x9898c6f9d2937e80
	.xword	0x9d61eb28eb78ddc4
	.xword	0xc552c675ead04b0e
	.xword	0x07b2c2410a4f9db7
	.xword	0xa477e36add3bfe68
	.xword	0x7fd4d6d9e271a2ca
	.xword	0x67f9b2a162cde4e3
	.xword	0x324c0d4e1525d5d9
	.xword	0x3c4ed7c2216a977f
	.xword	0x339deb6d4e5fa695
	.xword	0x183c68b2a661e990
	.xword	0x2003ab89c3713b1c
	.xword	0x5a446049b1d00761
	.xword	0xe798815fdf2e82e0
	.xword	0xf936cf5352d8e668
	.xword	0xbe9fa1970f47675c
	.xword	0x667099222c3ccb0d
	.xword	0xfd1878aa483ff96b
	.xword	0x75d89c93d3cd3bb2
	.xword	0xa7fd49fbd239a27a
	.xword	0x76e17fb0ac50e47d
	.xword	0x36a75010cea05ce4
	.xword	0x47ea2cabacac86d6
	.xword	0x26e9468b924a5215
	.xword	0x9cd239551875ccd3
	.xword	0xd19ad9828e2be31c
	.xword	0x51e26a9472d7d6ed
	.xword	0xd31a525ab6a54df7
	.xword	0x8da6fd5e6ac15257
	.xword	0x00ca202e7afb886d
	.xword	0x75902935378f3204
	.xword	0x2ed687dc97babd06
	.xword	0x4a4c8426686b8d3f
	.xword	0xa4fb8c7bb657180a
	.xword	0xf9d92657cbd3b9c1
	.xword	0x6d20000c7795c64f
	.xword	0xd977248e72cab133
	.xword	0x28434421423d9f88
	.xword	0x9ab7dea765d69657
	.xword	0x2dc532fd29892019
	.xword	0xe67287e54d2fc460
	.xword	0xb178c30b7f4cedea
	.xword	0xa25633e8bfc130ab
	.xword	0x29a406696a42e569
	.xword	0x64b0b26993ee104f
	.xword	0xc5b5d4fc8bbb7be1



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
	.xword	0xdea9cca3dd247f2f
	.xword	0x54807705fd7ee7c4
	.xword	0xabc2b12c368d7a01
	.xword	0x6d40e1bf5ebef605
	.xword	0xac77ff483c2eba48
	.xword	0x954f6c229166dc66
	.xword	0x26fdc52a951991e5
	.xword	0x5468e06ddb195dd6
	.xword	0xddd50c83d73e4f49
	.xword	0x5e59623ceba24c55
	.xword	0x489c60f66d8e8f38
	.xword	0x28e4e03570814fde
	.xword	0xf7f2a75b69483195
	.xword	0x8ab5bcaccf6acce4
	.xword	0x404c86de2d0dfae8
	.xword	0x73d832b08647bcc9
	.xword	0x5779b5e995d6845b
	.xword	0x67db7132cc330011
	.xword	0xd4d2039d843fbd95
	.xword	0x4eb0f45493bd79e8
	.xword	0xdea7c2431f23c0f6
	.xword	0x7257587a0a213d18
	.xword	0x9f7d0e3ca66d1e5f
	.xword	0x107f2258a26014a2
	.xword	0x16ed3d567750d0ca
	.xword	0x2224d78b0242f689
	.xword	0xf914261e12b3db72
	.xword	0x39d687047e479714
	.xword	0x32c5ca06e354d0e7
	.xword	0x8ad743af0c9faaff
	.xword	0x025a9a5be4af2f76
	.xword	0x52594add421f5475
	.xword	0x76b0bcc1512781f5
	.xword	0xfadb0e45792c4675
	.xword	0xe94a854df53b7e2e
	.xword	0x5d878005e30ac548
	.xword	0x980d5f5c58cb000f
	.xword	0xb0fb0bb1104fc647
	.xword	0x93d7e46febe0cdc1
	.xword	0x526239d2d3cda5c3
	.xword	0x44649baeb630eae3
	.xword	0xfd7b3f5b7cbd7cb6
	.xword	0xb76c51bb1dcd7e36
	.xword	0xd78e4923a17b7729
	.xword	0xb679504fd40f5026
	.xword	0xb93a48e8c4d0ac9d
	.xword	0x5d7cc051b7ec63cd
	.xword	0x7baf09cdacc6776e
	.xword	0xb31c12412b800abb
	.xword	0x479d294cebfc6731
	.xword	0x99a6c94abb4981ab
	.xword	0xc4eb5d167b44ba5b
	.xword	0xcb132e60b8729706
	.xword	0xc4a42ef319bd6946
	.xword	0x58272763adb226b2
	.xword	0xf729a2c4c697e7eb
	.xword	0x8f41afec2aea4e75
	.xword	0x0a348baac5d5ff8c
	.xword	0xfb76adcd22a240f8
	.xword	0xbe634c08d4e86d06
	.xword	0x1272794d2ee3bd1f
	.xword	0x1ed29788d89868b7
	.xword	0x7d6b1bbfe4b23c4e
	.xword	0xdbe2c9058d251e05
	.xword	0xad15ccbea86ae471
	.xword	0xca0edac15674ce1e
	.xword	0x60515dc8299a5f89
	.xword	0xe8f7d1aab2a055eb
	.xword	0x629ebfe82fbe8c36
	.xword	0x59b4b7b703d2035e
	.xword	0x59c48bc6e939db11
	.xword	0xa006e6e17538471b
	.xword	0x8b5cc448eea8daa9
	.xword	0x4e264e1d5e2c8132
	.xword	0xbaf508aa16cfcb48
	.xword	0x344552895ee85b45
	.xword	0x04df3cd47395baee
	.xword	0x069cdf4a272d3469
	.xword	0x7eb04096578edda9
	.xword	0x6abdcc766284b5c4
	.xword	0xd9b8b8049dee09de
	.xword	0xd37302bf0120f568
	.xword	0x2be801744b81a2a1
	.xword	0x0eb47082ba5e35f5
	.xword	0xd562f576a4c95e97
	.xword	0x41f591714b7fe73d
	.xword	0x48ffeb1a0c201ad7
	.xword	0x10d1cc4365a3f8cf
	.xword	0x7f0b917827e879f0
	.xword	0xab12b656e8183f2e
	.xword	0x6c0dcf1b1d774965
	.xword	0x2b16ed2008656263
	.xword	0x27cf88edbb2ffd50
	.xword	0xa2601259eb2fff8f
	.xword	0x9737757573b62dad
	.xword	0xe5301ec343efe89a
	.xword	0x1a553f2db4074c02
	.xword	0xc3aa69a06b972f4d
	.xword	0xc40e356f112a010c
	.xword	0x68a6c759f01a8d04
	.xword	0x07d09cc2baa50689
	.xword	0x0939019528e0043b
	.xword	0xdb18e266f13f4f89
	.xword	0x2de241e418cab939
	.xword	0x9e31d3956257c1ca
	.xword	0xfb7755fb42e0daad
	.xword	0x8674211e94825151
	.xword	0xfbacd86da763bbf3
	.xword	0x4758f183703808b8
	.xword	0x03f45b5b7cf914a2
	.xword	0x210d873fdaa22c26
	.xword	0x5d813c75782c46f9
	.xword	0x2e85b9c082aa1ea6
	.xword	0x0a28d07118c01df4
	.xword	0x17f94b4abb23d98b
	.xword	0x3ece5928eef3f5f5
	.xword	0x88ce391c7423a792
	.xword	0x1fd2dd725ff6b9ed
	.xword	0xb25dbbcc0aa6d7b5
	.xword	0xdf4351c60ad1f6f3
	.xword	0xea62b48d30101786
	.xword	0x5fe25af7da2c1877
	.xword	0x82c3d10223d17ba9
	.xword	0xb7ca9dd6447a15f4
	.xword	0xbb7c72ca9fd5e37d
	.xword	0x068c524a77ce91f1
	.xword	0x4edb59eddb19b586
	.xword	0x0cb156bd1709b3f4
	.xword	0xcc58f34444cd6774
	.xword	0xece757fc525f8628
	.xword	0x1c17529caefff514
	.xword	0xc6d43b9a5da43f79
	.xword	0xbac9650432a30e19
	.xword	0xafb98997474ef060
	.xword	0x3d5ba8a6f18b6e7e
	.xword	0x511585b63ab8133a
	.xword	0x1975604e75540e5e
	.xword	0x613c9e8046f6a5f5
	.xword	0xc4fff7933cd8758a
	.xword	0x51c3c4051df0d351
	.xword	0xa793de5a5752e552
	.xword	0x80863c02650c36f4
	.xword	0x3fd98d43f0472985
	.xword	0xcb31df05242cb774
	.xword	0x724f6bb0844a5166
	.xword	0xb189166dda89cfd2
	.xword	0xaeafcc5691594968
	.xword	0x2a8f74fc2d2b46fe
	.xword	0xd8ad73238076a1fb
	.xword	0xc15fd48a44695599
	.xword	0xf502773ac59c468d
	.xword	0x0d9e8cd2f3ca0517
	.xword	0xd7e3d9fd0fa4d856
	.xword	0x84fe5f8ea90c087e
	.xword	0x829bb421d065a24b
	.xword	0x12a74dc875e145c8
	.xword	0xcf3ab807f1716dc9
	.xword	0xd8f0dd1c188b6cc1
	.xword	0x14a0a14abdd2e99c
	.xword	0x780f6f9d0d9c8146
	.xword	0x5075779b3df66046
	.xword	0x44add6a114f5e52a
	.xword	0xfb8f036adf012c42
	.xword	0x9c752bb05cf81d8e
	.xword	0x7fc177289073339d
	.xword	0x13236aafe0f1a99c
	.xword	0xafb436ccc73635e6
	.xword	0x932fd57eeffdcaa3
	.xword	0x1e3bbad9a74b3c8c
	.xword	0x73717734cb033a9e
	.xword	0xd03472aab0241998
	.xword	0x19bc95dc51021976
	.xword	0xa9e46259e49f0ea5
	.xword	0x6da03c9eac6447b4
	.xword	0x717bb4dabc4d9034
	.xword	0x0ef3ca4e79f90b1a
	.xword	0x33054e25809c2646
	.xword	0xa58b6574131a5a9a
	.xword	0xc28051254e42dc87
	.xword	0x340af90150920300
	.xword	0xdd50f165fca8f04d
	.xword	0xd1d11589908a18dd
	.xword	0x23961339bc69a667
	.xword	0x3ee097206f8b3740
	.xword	0xa6f12780f371ddd8
	.xword	0xf013bb2ab07ac4aa
	.xword	0x3eb8757e6e65f1bd
	.xword	0x9cc76651ce5fac51
	.xword	0x355aa8dcec7270d1
	.xword	0xd3bce4f4b5f6b3da
	.xword	0x54b4bf8f73285547
	.xword	0x5065df22de705bd1
	.xword	0x8a20eb8df049118f
	.xword	0xed6f4d4da7dbd88e
	.xword	0xc1f7a6ab8b1e774b
	.xword	0x29f64693cc5526a6
	.xword	0xbe3367ead4f2b878
	.xword	0x51379edf1a446981
	.xword	0x1358012ce675cbd8
	.xword	0x56ccd21f25c2ab19
	.xword	0x723d8cce6c05ea08
	.xword	0x0ce298d4674572fa
	.xword	0x83acbe897ecf132a
	.xword	0x89595509ec050eb1
	.xword	0xe721953f9aec4cac
	.xword	0x90a730ca5dda1de1
	.xword	0x6de386ab6f544198
	.xword	0x7467878281d9e6ef
	.xword	0x497838c484e0f87d
	.xword	0x2957bc1f9cddd24c
	.xword	0x38e71eb068368e4d
	.xword	0x15998c79d1f0d468
	.xword	0xcabcbf95a3b11029
	.xword	0xdfb7471cf93ef241
	.xword	0xf0c75ec761e51e54
	.xword	0xc332c0795b7e5072
	.xword	0x6de828905bf7912d
	.xword	0x8889d63dab0a1af1
	.xword	0xfd5e6a7fc1316414
	.xword	0x284897ec11927a05
	.xword	0x5e0d9ac689eb096c
	.xword	0xcfc6f52a3c4d0a50
	.xword	0x4bee65b55c238174
	.xword	0x343028975b107db1
	.xword	0x005eff7879a08c74
	.xword	0x1a89ad15dcdcc57f
	.xword	0xd1e5e0a4eba8dc71
	.xword	0x80bf7784c96c3a41
	.xword	0xf150ee566a1ba18a
	.xword	0xc5daea9713148ca1
	.xword	0x0cd7aa989672f2aa
	.xword	0x9445746f72a32d35
	.xword	0x0635bec36fff975e
	.xword	0xef5a20eab9e815b1
	.xword	0x4190277444c64de9
	.xword	0x6cffdb99d5b3b3b9
	.xword	0x721a274ec0e8f8a6
	.xword	0xa05b6b4aac69a3c4
	.xword	0xfcc86455207e03df
	.xword	0xafeaf408fafe50a6
	.xword	0xa106619087081fa4
	.xword	0x5fec06de1bb46e78
	.xword	0x3ec782cfd86857a0
	.xword	0xc63aa19b6136708d
	.xword	0xde42585af0a22bf2
	.xword	0xfd74fc1948bf4a60
	.xword	0x937b9294711de4dc
	.xword	0x728479c72c26a736
	.xword	0xad3d427220d6b0b0
	.xword	0x496946e52616b284
	.xword	0x41bc4c9bb5aff553
	.xword	0xac02337a56b1d4b2
	.xword	0xe190e972976f5df9
	.xword	0x083d0551acdb8682
	.xword	0xe9e9e8ffabf41345
	.xword	0x5b8a73de7ed775bc



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
	.xword	0x006e33a5100537fc
	.xword	0x015e68dd3a93ba71
	.xword	0x04368a868192e10f
	.xword	0x6fdce757ebc8d633
	.xword	0x8378d8983c6709f5
	.xword	0x6b1a380f24ddac85
	.xword	0x3b39455682d0d08e
	.xword	0x07bbfc2608bc00ac
	.xword	0x94d21b047fa266cc
	.xword	0x7140fb250d176d10
	.xword	0xbd6de7a34ff3a62a
	.xword	0xef152f8008cc0115
	.xword	0x3a3926fccbea5332
	.xword	0x707c46b5038e4ced
	.xword	0xe4e850f1e688b46f
	.xword	0x7c2bfb0381c5af21
	.xword	0x10992976891ab95f
	.xword	0x00394344327d2eda
	.xword	0xe62e4d6a43107cba
	.xword	0x93c8ed19adea3fa1
	.xword	0x1a895f19a2072787
	.xword	0x4e3cd8d78bddd011
	.xword	0x2ad256f0b3eab5d5
	.xword	0xf195287ac5b305fb
	.xword	0xa5ca73af4d5dda4c
	.xword	0x173bcb330d927f14
	.xword	0x04a2b6bfe9d1a0e0
	.xword	0x2c8c64ed9e527b20
	.xword	0x22ac8067364667bb
	.xword	0x992270d6e254a6aa
	.xword	0x593913090809c9ec
	.xword	0x8e662c0c686c9ee2
	.xword	0x1bb343fb0e134bec
	.xword	0x690b0023c489e534
	.xword	0xfc31b1259594aa3d
	.xword	0xd0a722254e5d6af9
	.xword	0x2f718dad58fe7c8e
	.xword	0x5ec7b60ea59dfcff
	.xword	0xf75a06fdc294f419
	.xword	0x975f6e0acab205e6
	.xword	0x5336cc68320b411a
	.xword	0xa4e2553e9220f11e
	.xword	0x9ab2592d40ac2be4
	.xword	0x3dd2be6d30cd519f
	.xword	0x5671ea0b6a3ed7a0
	.xword	0xd51913bd47424389
	.xword	0x13c6debd3d1b02d8
	.xword	0x1902fe6f2651c3d0
	.xword	0xddd3b4444a83d0b7
	.xword	0x314f6f308b57f407
	.xword	0x8bef3772f3413de8
	.xword	0x472d901ec164cd13
	.xword	0x057f1884f2480bd5
	.xword	0x327a9f025bb0265b
	.xword	0xdeb0452c53ca9907
	.xword	0x54f478f71f07e57e
	.xword	0xbe56839d24f0d0cd
	.xword	0x029ac536383ded50
	.xword	0xd8d4684df6075c1e
	.xword	0x4780c8e427f3a2f6
	.xword	0xef9d39d0c88c5560
	.xword	0xf5bd3c7e0ca2e351
	.xword	0x52c15d13cd073bc1
	.xword	0xda3bece0cf2ba180
	.xword	0x8fdef320cf60d9d0
	.xword	0x40b5ee60d59fcd1a
	.xword	0x0c2fd4d1a54770e6
	.xword	0x75c7ce1989410e79
	.xword	0xe4db3faafa51eb86
	.xword	0x42f5df44038de9f5
	.xword	0x5452a7cd55d3e072
	.xword	0x6d5552a17535175b
	.xword	0xce09d3fcf7b7bb5e
	.xword	0x8024a89efcb80b4a
	.xword	0x3468b6cf45e5e572
	.xword	0x1860e430abe39306
	.xword	0x94b8f2eaede2b22c
	.xword	0xae319c91b74e7031
	.xword	0x2b0f3684e18471ff
	.xword	0xd237c07dc2efda5f
	.xword	0x435e4a1cdbf4f769
	.xword	0x35405ab3ba89e130
	.xword	0xe3c92e395a993273
	.xword	0xb19fa98ed50f9bea
	.xword	0x20047bf3a5560e46
	.xword	0xe84b8b10adc2a7dd
	.xword	0x483b8e05ce4f1183
	.xword	0x0d4544607829b05f
	.xword	0xb420c3639d395b4f
	.xword	0xd3fcfee5a806a76d
	.xword	0xe56537855ec32453
	.xword	0xb62801b54491688d
	.xword	0xa9b063d1a2e11e31
	.xword	0xd19649f560056011
	.xword	0x995e75fbd42e080d
	.xword	0x5903f49a72536561
	.xword	0xb58cca645ef439bc
	.xword	0x6e5fef7355348de6
	.xword	0x810a67eed61ab0cb
	.xword	0x692d4b55326c4643
	.xword	0xbfdc58392050edbd
	.xword	0x5f67bbfe7870e538
	.xword	0x25afdde36f269bca
	.xword	0xf93c45a1381c3aa2
	.xword	0xe95dd2198e2b3b92
	.xword	0xa94b10c121f6f29a
	.xword	0xe32ddaf7dac4567b
	.xword	0x78fb811f870304d5
	.xword	0x5fb9747da6afe49b
	.xword	0x981194137c781013
	.xword	0xaf87c5bf4803c91d
	.xword	0x0bd86bc18a967262
	.xword	0x1339d2db31fbaf7c
	.xword	0xda15f3d18baf5dad
	.xword	0xd48524714457a631
	.xword	0x3c55fcc719cea7e7
	.xword	0xb9c65505daeb45a4
	.xword	0xd69ca80425783df6
	.xword	0x881d3234084569b7
	.xword	0x5bb0e7f46ee516d6
	.xword	0xc60465905109e534
	.xword	0xf10d2a1a10396de5
	.xword	0x92036f845885cd0b
	.xword	0x14ff236a0f6bd62e
	.xword	0x7a3cd19e0e094bbd
	.xword	0x16c4479bbe49f6ed
	.xword	0xbf89f99bfb27b422
	.xword	0x59efc3bbcd2e941e
	.xword	0xc1d3aa92868c56a5
	.xword	0xe69fbfbe14a20b97
	.xword	0x32c8cd3dcb9a6c67
	.xword	0xb0da2aa7c0d5ef23
	.xword	0x2d486a87fc4c9beb
	.xword	0xc5447dc52498c7f8
	.xword	0xe12326f681cef8e0
	.xword	0x9034f944e2c4559c
	.xword	0x53c4393bc3ea918e
	.xword	0x0f634b53c5e6d057
	.xword	0xcee362fb44aeb209
	.xword	0x9f505d2874e7897c
	.xword	0xa0a48aaa7432ca41
	.xword	0x2a0a3cee2507918e
	.xword	0x53681dd1dede7b9b
	.xword	0x89e7bb87e397fdbf
	.xword	0xa56048a3e6cdec92
	.xword	0xe431989f1f8bdc69
	.xword	0x2bd144bcecf096c6
	.xword	0xab124e73167ec500
	.xword	0x93b4a1e125f16c46
	.xword	0xc1b5cbb502c2c928
	.xword	0x53d05613614d1b0e
	.xword	0x670f52ee9d2d3759
	.xword	0x4e4cefee3d0a447b
	.xword	0x6c63d8735f2d0de5
	.xword	0x5da0509574854a79
	.xword	0x11e4dbfbbd059f30
	.xword	0x8d213d2dfff94eb3
	.xword	0x879b35b08b30d25c
	.xword	0x4a8c467f47cae636
	.xword	0x80824aca6e568126
	.xword	0x8d5042d099f1c42e
	.xword	0x3d7e1d245f1a967f
	.xword	0xc55267e59482e695
	.xword	0xc43cf1ea03a55d09
	.xword	0xa94da6a39522db59
	.xword	0x1018e49be3e58a93
	.xword	0x5054afb11bb7cdf7
	.xword	0x33b26cdcdf1ad836
	.xword	0x8694c2eff6c5497b
	.xword	0x613e8d17bd922ab2
	.xword	0x8d3dce800486f73a
	.xword	0xde9592b2a43ee0a8
	.xword	0xf15c30f07489af3f
	.xword	0x77ff45f83dccab38
	.xword	0x24e529bc39ba5cfe
	.xword	0x5f63133c8c6a9dd7
	.xword	0x555e6fce12f9c730
	.xword	0xd328b3b8325eb418
	.xword	0x717a83f5634cbea1
	.xword	0x1f3a49cf74738591
	.xword	0xe22ba09353a16d58
	.xword	0x3a348a5d6d2fbfc9
	.xword	0x9e1d5a4b611f2a50
	.xword	0xe25fff29c3ca961d
	.xword	0x71dab6ffd10fe724
	.xword	0x9a10182d557986f2
	.xword	0xc3e9a8bd6f62e748
	.xword	0xdfa7c54b40219133
	.xword	0x500251fef6df93ca
	.xword	0xca71d4f5554b1260
	.xword	0x3630fb57883d07f3
	.xword	0xdaea85f73989829b
	.xword	0x03d7453914d4f518
	.xword	0xe2c0ea419f607e91
	.xword	0xaebbe7d8720fb506
	.xword	0xd43cc15865f10a09
	.xword	0x803447ec2bb77b82
	.xword	0x7b14107b1e769841
	.xword	0x3b1667735fc48851
	.xword	0x6b1ee4806226357b
	.xword	0x05176968eeb2ab85
	.xword	0x497cd6a97390b30f
	.xword	0xc2d8a28ffdf7f9e8
	.xword	0xad1da91ba4f1bbb6
	.xword	0xfe1285604a4048f4
	.xword	0x87a011e705abd473
	.xword	0xad529d135cbe8ffe
	.xword	0xde245c19c4918d00
	.xword	0xbb53fcc8ce5886e7
	.xword	0xfe645af0662e9ffc
	.xword	0x8dcd8473b3aa79e7
	.xword	0x15a9915ac2ba76a8
	.xword	0x6aef09ca830b3717
	.xword	0x2d3e009c2b57e461
	.xword	0x8ddf624568ce984f
	.xword	0x4441dcee3a5e68fb
	.xword	0x6c692ef9a1e8079a
	.xword	0xaf024fba54d07549
	.xword	0xf7c41799b829743c
	.xword	0x23e19043c18d9336
	.xword	0x749640e4c8693bdc
	.xword	0x56a0fff0634bb14d
	.xword	0xff8ecd3f5f0b2d43
	.xword	0x1cca42e64e801383
	.xword	0x783c6efc437597fb
	.xword	0xbf14bbeaf80bfad8
	.xword	0x302d7ffe6bd61a0a
	.xword	0x432c71e6e87b03f3
	.xword	0x141a964e140f09d4
	.xword	0x23ec5145e5738156
	.xword	0xe565a7c340c4f4b4
	.xword	0x48ce67f0fe8f2fe4
	.xword	0xff080b1bc842a637
	.xword	0x255e0da66cff28a0
	.xword	0x7e8f9ee78a37bf11
	.xword	0x5d3cb6017b74f070
	.xword	0x9af5512a0f1824d4
	.xword	0x027706cd46e195d2
	.xword	0x2ec3627d98aeb246
	.xword	0xc5a5200743c6114f
	.xword	0x15949d64a67c61c2
	.xword	0x14d53c3f29c8584f
	.xword	0x1ffc09cbf4bd742c
	.xword	0xc0547c8288c9da98
	.xword	0x7d7f9b20b82ec0c8
	.xword	0x8867dc37f6c9a84b
	.xword	0xa8afea63085bee74
	.xword	0x39d22222c0851c11
	.xword	0xd58b9135c2d94f61
	.xword	0xcceccf43df3d5530
	.xword	0x2cc281159c00b1bc
	.xword	0xda66ed035ec64a66
	.xword	0xc6388b2cd9303051
	.xword	0xf73c6ab1e70f96c6
	.xword	0x539e749f1f505f3e
	.xword	0xed240c2b41c6e21f



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
	.xword	0xe6be4aa97df5a52e
	.xword	0x7393274d9d1fb367
	.xword	0x71d158a118af42a6
	.xword	0xa0ed82e93dece2c9
	.xword	0xedac5993b1ce2b1b
	.xword	0xe431585f22255cd6
	.xword	0x0f5beabe21fa0402
	.xword	0x9db447a2f9c35fc7
	.xword	0x996fd406c845a6a1
	.xword	0x3e5c66ae68333976
	.xword	0x89c88b30c86077ef
	.xword	0x32a4b28579bbd93f
	.xword	0x0cbb23ebbeca31bb
	.xword	0xef5b34ce86facc92
	.xword	0x0bf418568c1a6065
	.xword	0x3417a25a44b16e4e
	.xword	0x64029d4a510b8e1e
	.xword	0x26cbf9e58651547b
	.xword	0xb9c0380386b27610
	.xword	0xe5dd691f470c15d8
	.xword	0x536727c6ade52a11
	.xword	0x91dc9edbb6625dce
	.xword	0x8a7060b559734189
	.xword	0x1cfc3294e01d5642
	.xword	0x5a15b8b1ac32b21f
	.xword	0xfd31ed16e34c01c4
	.xword	0x7aac47b5c6669240
	.xword	0x555d1b5abe217d2d
	.xword	0x54f83f923193d035
	.xword	0xc207c2f9a4565399
	.xword	0x7a726d7d0d1e29ba
	.xword	0xcc551d2ed981ec74
	.xword	0xb5ae18aaa9090ae2
	.xword	0xd081cfd753edbd2b
	.xword	0xcaaf513d287873a2
	.xword	0xb252441d9e7cebb4
	.xword	0xc3cb14ca2e305270
	.xword	0xe6a3a8cfc549c7e2
	.xword	0x37748d25e4fd1417
	.xword	0x14f69786179a4230
	.xword	0xf490a9510d241f40
	.xword	0xae2035ae0f34db4d
	.xword	0x36e3e35b7c243a6e
	.xword	0x08f409f9acb39b1f
	.xword	0xcf7b1a284484c34f
	.xword	0x8dadbdd9bad595e7
	.xword	0xbe2bcc396fb22c06
	.xword	0x6248241eb1b0592b
	.xword	0x66da9ce7236bad06
	.xword	0xffd5a5589c1dba3f
	.xword	0x0a8098ece90a8ed1
	.xword	0xdc349c44b1ceb84f
	.xword	0x4ec38f13a074c8f3
	.xword	0x30d6e45c5b265967
	.xword	0xc3e1df020f75bf2e
	.xword	0xf7cdc9098b55de96
	.xword	0xf79f689c8dee5964
	.xword	0x67913077d73617f6
	.xword	0x7fa2bb5310c91c46
	.xword	0xd32fe8316eaeb2f4
	.xword	0xf9555d0c3e6ebf35
	.xword	0xd9cc16ec19dc55dd
	.xword	0x993a76e663dd5771
	.xword	0x3a1b42df5a54b813
	.xword	0x2bbc6fe7faaee9b9
	.xword	0x9bc8e12af85e2c8e
	.xword	0x5bc8c11f81cd668d
	.xword	0xc04d0f619c9b30c7
	.xword	0x695f638f24d912a1
	.xword	0x6c59956f069be125
	.xword	0x69b8fe602c48bd35
	.xword	0xc6b0323edd383c53
	.xword	0x1763e6a2af7b3164
	.xword	0xe8a7a70cb4baba74
	.xword	0x665e0a28600b1275
	.xword	0x1ab2184d9e142f1f
	.xword	0x1e8c82c09c627ca2
	.xword	0x683b53ebeaa2fe0d
	.xword	0x1441817d587eaccf
	.xword	0x85b5e273bcb35943
	.xword	0x54afd44d9f8ebc47
	.xword	0x84c6829500e9b6c7
	.xword	0xa289845edd33c7ff
	.xword	0x2e0d0913d74db339
	.xword	0x4fd1624c0d7eeb63
	.xword	0xa7b6dd45b792c7ae
	.xword	0x4589a115b176b44a
	.xword	0xab76b0ae4491afb7
	.xword	0x58cbb1a4a74aa91d
	.xword	0x3b378c87a0a1ab66
	.xword	0x703c89640887b2b1
	.xword	0x2e23701627c2f5b7
	.xword	0x9acf0b634662bac1
	.xword	0x9628a8a7cad75734
	.xword	0xa8dab1a59866b7bb
	.xword	0x0688aca046ddf7b5
	.xword	0xc7ffec8bf250f563
	.xword	0x5257f58fcd82142c
	.xword	0x7fabafa13f210a92
	.xword	0xde2d8edf24da25ce
	.xword	0x2cc364d8d97bb4ac
	.xword	0x16aade66befa52b9
	.xword	0xa79588129e098e92
	.xword	0x7eef32ab08a5bbab
	.xword	0x4766b091c0432fd9
	.xword	0x71b07cb306d93113
	.xword	0x58932cf67537c9fc
	.xword	0xb745b45cf6f8fd25
	.xword	0x2b908581a01e931f
	.xword	0x33ad80d3d7bc9b45
	.xword	0xebef8b62188d49f7
	.xword	0xd5f3f1483dd09812
	.xword	0x0c90cd7e4b149128
	.xword	0x321bfb2477d80b57
	.xword	0x5d957cf78c88d71c
	.xword	0x15e1fc6f0b374d56
	.xword	0x3933a670bdef7a98
	.xword	0x6afae696283ac65c
	.xword	0x80b7d0b8f06a5df9
	.xword	0xb5ffbd609b786aa2
	.xword	0xcba54ca431674b7b
	.xword	0x613e4c1fb48cbffa
	.xword	0x9b356b4363e6bf1a
	.xword	0x6e3b8bb98bcc3c83
	.xword	0x2cb6f7961f8edf8f
	.xword	0xc43cd7d6bb60c00a
	.xword	0x63f55caffd676461
	.xword	0x30996005fa21c042
	.xword	0xeffcc05ce0e1c66d
	.xword	0x5e9c83cd3583f74e
	.xword	0x794f86b9d28a6a0c
	.xword	0xe232d79068fd1fa4
	.xword	0x3e336c68e2c3f65c
	.xword	0x8ec3dc95180e89fe
	.xword	0x8c543ac0d2c0a113
	.xword	0x0fe6b6a9d67e1ee5
	.xword	0x29871fbe4e3e58ff
	.xword	0x227280da9fd1abe1
	.xword	0x9dc2f6a7bdadd206
	.xword	0x16b3bb5482fad3d3
	.xword	0x0b5269f9b6ae479e
	.xword	0xfebc36c92f589408
	.xword	0xba381ea5b91425be
	.xword	0xdbcd169ceac250f6
	.xword	0x31a204e834175418
	.xword	0x41c433b771eaadcf
	.xword	0xd6907f182ba52408
	.xword	0x1d494560a40728e0
	.xword	0xb768b656f4576c17
	.xword	0xc7f3ee53d09b7755
	.xword	0x251995e2366bf02f
	.xword	0x7c18964efed167e8
	.xword	0x4b91944e83a5e08f
	.xword	0x668c932ed3c0d557
	.xword	0xb69a734902e883e8
	.xword	0xed06572c80a31eb1
	.xword	0x73ff286ad4866594
	.xword	0xc20afa1bdcbaa663
	.xword	0x8810b6e793139a16
	.xword	0x223c951261e8f48d
	.xword	0x8e433e53b1431770
	.xword	0x76685ee39e5bbbb7
	.xword	0xe45d82c3c5343627
	.xword	0xe812dc0f240d76a1
	.xword	0x53a8e416fa80904d
	.xword	0x87601778b94ce95c
	.xword	0xaee51c36244d4217
	.xword	0xa7752c86af9f9eeb
	.xword	0xaa5a9bb2cca5cdd7
	.xword	0x2ec4a796a29ad339
	.xword	0x6f662b0aeb1f71e5
	.xword	0x9fcf3c7428d10c81
	.xword	0x48d2cdff170c45e2
	.xword	0xaaeb6fe833a306c2
	.xword	0x890b104e7ad53f03
	.xword	0x8b70a3c5b1dcbe28
	.xword	0xa91bf10c3dc561be
	.xword	0x956948562f4b611b
	.xword	0x2c251dbb1b67811c
	.xword	0xb9295b8538e63c7c
	.xword	0xe60a81d98033c173
	.xword	0xdafc2aaa76fae727
	.xword	0xbc34e95bbead26f6
	.xword	0x5d99b7793bd97cb2
	.xword	0x0c6cbd1eb37803c5
	.xword	0xad5a8aacf93535ba
	.xword	0x2d44506ba53e4285
	.xword	0xb1c45ee2112137f0
	.xword	0xd3548900d16f175e
	.xword	0x90663d8f3a395408
	.xword	0x4660c2d9fe69e441
	.xword	0x8cbe76fc57d51891
	.xword	0x26e5277195475949
	.xword	0x45b0868b9407c1e2
	.xword	0x47d7db2aa86556ac
	.xword	0xc08fecab1531a885
	.xword	0x89db1638dd2a7565
	.xword	0x83cf11b91f678069
	.xword	0x72f6657c37f6579f
	.xword	0x395ef32ff57b4159
	.xword	0x58a5b40ecde9a413
	.xword	0x65122ccb37440aa9
	.xword	0xa62337c7ee6c27c0
	.xword	0x60b02c2518a21987
	.xword	0x5c288071bd0a3b67
	.xword	0xf12c55b59b126d72
	.xword	0x9e9a4758c526ea78
	.xword	0x8f4b5985ed089d92
	.xword	0x2f804ae4586b4e99
	.xword	0x02254d8685e54579
	.xword	0x58a02504912603c0
	.xword	0xba0f743f1cf06097
	.xword	0x0e48649740609521
	.xword	0x428ffff171688bc8
	.xword	0x63493584f5c56c2e
	.xword	0x6c54fc338a66e791
	.xword	0x6999eb415dcb3e53
	.xword	0x286254e8b3f5e025
	.xword	0xf1f1794b5b600a9e
	.xword	0x32fa51268c345f39
	.xword	0xb4176eaa23879da8
	.xword	0x42de8131e320b556
	.xword	0x225fd836fc760538
	.xword	0x82b8e6cb4b9472d8
	.xword	0x24bd5db141075402
	.xword	0x1516ced1f4ac60ae
	.xword	0x2a557d781b89a744
	.xword	0x6a517a721ae44bf3
	.xword	0x39f3d6627098655a
	.xword	0x98a7cafd73a13b99
	.xword	0x5a092a7d05e4fcd1
	.xword	0xa9f4cb8c249d517b
	.xword	0x8ad8f46f9e35a116
	.xword	0x7a99f014a5714159
	.xword	0x7c2d89f45b9817fb
	.xword	0x9408aebd8843f5e4
	.xword	0x43d2369cacd75868
	.xword	0x8e9063c55782afd4
	.xword	0x031442e61d908e99
	.xword	0xe1ef5861d6ed6f91
	.xword	0x569c68fbc5c423b2
	.xword	0x59f149f1b63a8343
	.xword	0x4a7fcc47e48409df
	.xword	0xdd0d60d2cd495275
	.xword	0x9c27e422bfa7cfa0
	.xword	0xc09585af56a8b6b7
	.xword	0x4e25eff58b7a5e65
	.xword	0x159737eaceea7a54
	.xword	0x2ea5312a6a875c46
	.xword	0x74457878fcd555b1
	.xword	0x8584525d93d4db81
	.xword	0xe7c9cdad5edb084e
	.xword	0x15e5b12ce5082fe7
	.xword	0x7bc87d2a92d33622
	.xword	0xc576505442ee9039
	.xword	0x137dac40a0b60659



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
	.xword	0x6eee36a9f30b039f
	.xword	0xcc52f4e6da6e7fe6
	.xword	0x49b38aa9ddb98554
	.xword	0x069d7eb0aa81de93
	.xword	0x5397025be0fb6bd7
	.xword	0xa413309593ca4d2e
	.xword	0x262feafb47e18684
	.xword	0x617cf092841b44e1
	.xword	0xe54e745e8c63e83f
	.xword	0x0837b139dae95e9c
	.xword	0x81ef3d6d79c41966
	.xword	0xb2aa8b2e981cdddd
	.xword	0xc4c90cd83cb9696e
	.xword	0xa9a6d658fb739852
	.xword	0x0b80868db6735c24
	.xword	0x9b918a4d747704ce
	.xword	0x854ec4c2da764243
	.xword	0xbebe09487230bc48
	.xword	0xa30c62d6e652cc1b
	.xword	0x54e15ef633fd06d9
	.xword	0x791201581a51981e
	.xword	0x937c96ca8da78695
	.xword	0x736ebf33c96447e8
	.xword	0xcd569a8e1618fc0e
	.xword	0x126f194e49ec4fb8
	.xword	0xb2cade14b82bb1ef
	.xword	0x8ed0ff6dd42db8ec
	.xword	0x3641c7c510f91f61
	.xword	0x6cd0e8459b5d0e91
	.xword	0x4fae00f1c8edb5bf
	.xword	0x90f57fb660cf98d0
	.xword	0xb955356ab68e4f91
	.xword	0xf9fd3e78eacec06c
	.xword	0x13c4caff7e9fdcbf
	.xword	0x08d6762620b14b71
	.xword	0x91f2ad19b580d8c4
	.xword	0xc07c93bd4cf8f3fe
	.xword	0x472644ac50fd5370
	.xword	0xba65f6cf63a81f08
	.xword	0x20ecdf90eab0a38f
	.xword	0x217574995c042f61
	.xword	0x862ec24122f6399e
	.xword	0x8c02953cb52f3ef9
	.xword	0x364d23ddfe804490
	.xword	0x4b6e3f696251dede
	.xword	0xebaa667e011c59d9
	.xword	0x91e21991b30b671d
	.xword	0x4cbe4e4f537ef8e7
	.xword	0x0f3ce2a571403d5d
	.xword	0xe059afa9a535bb01
	.xword	0x6b8a8ad7381b23c1
	.xword	0xb191e3fc6abad257
	.xword	0x8f1edf459baa3f49
	.xword	0xbe27344706a7e17c
	.xword	0xfbecb0f495ceb923
	.xword	0x57e523fad1e41273
	.xword	0xa96a65366db572f0
	.xword	0x2b5cc67f7a4ad55d
	.xword	0xd5149d24e4c4d640
	.xword	0x646609a41315432c
	.xword	0xd45584c3b6b42b59
	.xword	0x00a5553f2e6252ba
	.xword	0x8a814007ef8f6d7f
	.xword	0x13ce58b0b66a5daa
	.xword	0x7e90594ada0dbf49
	.xword	0x4d56047ec3b81561
	.xword	0xd9c96543c2c75400
	.xword	0x88f42a8fa6950d0f
	.xword	0x2507d2a8e2ed51a4
	.xword	0xef3096522bd741c3
	.xword	0x15ca3ea4bc6b9ce7
	.xword	0x219b5a7b1cba5f09
	.xword	0xcf595823a9331240
	.xword	0x0a5dc20226860c77
	.xword	0xc504e1c0092f213a
	.xword	0xd2095e360e4a44e2
	.xword	0x6a0a857e9dbeccea
	.xword	0x429a3b985e56fc9e
	.xword	0x23328dcb80d337b6
	.xword	0x8b9627ff42f5bf8e
	.xword	0x0e8bb8996a815254
	.xword	0xf48f96b8b32ba687
	.xword	0x895f27884e4c1ecf
	.xword	0x82be31edc053f9a4
	.xword	0x0e18cd0c3e94eda8
	.xword	0x4eb8a4c95bdafee8
	.xword	0x942462bef802e788
	.xword	0x9288edbeb505201c
	.xword	0xcc5c5346e1b86e94
	.xword	0x358243406ffa48bc
	.xword	0x7c009f95c080472f
	.xword	0x70d0148fe9e4d17a
	.xword	0x2280c8fe5b1fc4bc
	.xword	0x184078b5663034b0
	.xword	0x953066fa0b8f3d15
	.xword	0x5cb1af57b77c03c4
	.xword	0xdc63b8aeadb13cb7
	.xword	0x4b86be580ece77c1
	.xword	0x85aa9d55b8e005db
	.xword	0x82a5076aedb4f6d2
	.xword	0x0345b3ffb296a45f
	.xword	0x046273da9bc5725e
	.xword	0x0645cf3fc0f272ea
	.xword	0x9042e503ef2bbe81
	.xword	0xed16bc4dcba737fa
	.xword	0xe1fc871d27980610
	.xword	0x7d04021be54811e7
	.xword	0x95dee5fe1bc33f68
	.xword	0x051814b4fc478e80
	.xword	0x70284da5b8b61192
	.xword	0x640f4139586fc5fb
	.xword	0x104294950368f854
	.xword	0x6ff428c830e7b08b
	.xword	0x104f99ea5db30074
	.xword	0x9895bf46d198ad7a
	.xword	0xc71235af4998aba8
	.xword	0x7b9b2fec2fac3d08
	.xword	0x66853db9f2eef4c4
	.xword	0x4d7f0e531b938f85
	.xword	0xfd1e7641eb01478a
	.xword	0x24f29726fe211fcc
	.xword	0xa13a1351740a164e
	.xword	0x4388fd1086ad27f9
	.xword	0xbc09bf8092f245e7
	.xword	0xc8911adad82d9619
	.xword	0x0f2fc183b088ed60
	.xword	0x92e3823185309fd6
	.xword	0x60eb6f77384ac4f5
	.xword	0xa8325e6b7763a83a
	.xword	0x2a55138f19c4a054
	.xword	0xc3ef8cb5c0caf8ad
	.xword	0xfe3cd17260822bdb
	.xword	0x523b691a6b84ec2f
	.xword	0x4de8375da5bcfe4d
	.xword	0x315ac0a6d71142f0
	.xword	0x7a60fbf001263fda
	.xword	0xa857a501b33c9fb7
	.xword	0xaa7fd3590a7b3f2c
	.xword	0xc8a9a4fe9d77dd86
	.xword	0x77ff9df5ce487eef
	.xword	0xfc820461a315b42f
	.xword	0xdb976b44d74527a1
	.xword	0x118b3bf19eefdbf2
	.xword	0x86778091d178ec78
	.xword	0xc0b7fc02c2257fc1
	.xword	0x26eea52e698b5586
	.xword	0x9bb333f476aff628
	.xword	0xb915c38ad14b009e
	.xword	0xf9263cbc66d9124c
	.xword	0xda8ec6de467e21f5
	.xword	0xd3120542fbe260c0
	.xword	0x62e87500ce8d93e8
	.xword	0x1ffdecdf2a9b4c0b
	.xword	0x2aacf88b4f31257b
	.xword	0xd5621e0e25e56f9c
	.xword	0xc07fc9ed73ea2910
	.xword	0x791a847f4c08be10
	.xword	0xc6de7be0174f91e9
	.xword	0x43aa050656f2e7b3
	.xword	0xc42540a31b5a13a0
	.xword	0x115684b69c9fec7c
	.xword	0xa92197fc72dea1ec
	.xword	0xd24a02ec633cc86c
	.xword	0x47f29886f00d05b0
	.xword	0xb94df474c1ed325c
	.xword	0x45a2a4caa043036a
	.xword	0x65471af2a37aaa21
	.xword	0xec04ba12b4c5d9c6
	.xword	0x0de5e45f6e119739
	.xword	0x217358368621a348
	.xword	0x7f2d48f6ee25445f
	.xword	0x1ccec51f4eecea37
	.xword	0xaf37abab48749990
	.xword	0x7d0b723f37ef92e6
	.xword	0x16e046ef6cd03a09
	.xword	0x4b8bcfb02ae6b8b5
	.xword	0x92e8c8bc2defc9c9
	.xword	0x463fafc1880bbe2e
	.xword	0x884e3a09812f4491
	.xword	0x174f5bbc244eb9b7
	.xword	0xe4ade7c0c837d56d
	.xword	0xee98926c5186731b
	.xword	0x328c8b504aa48fa4
	.xword	0x86cdac0e47e487fb
	.xword	0xc66516004b2bdc71
	.xword	0x318da69663c22466
	.xword	0x83ac356196262737
	.xword	0xa92c5cf636ce9a3c
	.xword	0xad7468fa9b4ecfed
	.xword	0x50187884eb8a1821
	.xword	0xf75c15c10db37f1f
	.xword	0xefef6988c83b5765
	.xword	0x24fb10605e6347a5
	.xword	0x224170946f405740
	.xword	0x0cbe0df248ec962a
	.xword	0xea5e3d2ceb349739
	.xword	0x48000727ed0083a8
	.xword	0xd00758c184715f28
	.xword	0x59f47a1a9258952d
	.xword	0xaf854d27d7526e5c
	.xword	0xc47c9f10f20f962c
	.xword	0x519b0ce202dfc215
	.xword	0x058ac7bf9a548257
	.xword	0x102915bd4f59b7e6
	.xword	0x863f51c5687b10e0
	.xword	0xa0ac6665fe6ae5f0
	.xword	0xed9f1cce292101f9
	.xword	0xd7b4781180dfc1a3
	.xword	0xfe919e858d3b1e66
	.xword	0x0a7e7f1db2ac00b0
	.xword	0x89aee69f912cada4
	.xword	0x2a67934849b47b9d
	.xword	0x9b842447e3e47f7c
	.xword	0x6fa8493238d21807
	.xword	0x03da920840526dca
	.xword	0x45fdbbca9ef590db
	.xword	0x6aac97ee7ca73543
	.xword	0x4a2685e0f80e5bc2
	.xword	0xbd91b1885af0b258
	.xword	0x509722dd253e1c37
	.xword	0x6f003c2f76dbc57f
	.xword	0x22cf3b6b09403cfd
	.xword	0x65f14579802d1dce
	.xword	0x2685096d010456de
	.xword	0x13574dbeaa4668da
	.xword	0xbc70a949217460db
	.xword	0x214972824f6c5711
	.xword	0x7ba008225baec83b
	.xword	0x8a8a68d64afae446
	.xword	0xbe664104efaef285
	.xword	0x95b223dc9973e7e1
	.xword	0xac37f13ef4aa668d
	.xword	0x4f9de585d5daa3ec
	.xword	0x3078ed1c76f26ec8
	.xword	0xd92f08b12769241a
	.xword	0x132c0b2a5ee25141
	.xword	0x90669855c0476a64
	.xword	0x9f86a0e35792e6ed
	.xword	0xcf1f46a39c520790
	.xword	0x63b3386dfb31f285
	.xword	0xa8557c8090c46bd7
	.xword	0x5ec795f3130151d1
	.xword	0xdbb7142fa980d79c
	.xword	0x80ef9f2f8e4e0458
	.xword	0x5ea79a4009727ed8
	.xword	0x3470fc8d1a2468d1
	.xword	0x8b9ff161344b1bd1
	.xword	0xeff9e0260dfbe8fe
	.xword	0x3151fc36127a3510
	.xword	0xe782eb1eef9ced88
	.xword	0xf61328edef818d2d
	.xword	0xabd635760dbe9868
	.xword	0xd34749462719dbb4
	.xword	0xd6d06832f3290776
	.xword	0xe22759810f733e27
	.xword	0x242bdd14e10cddaf



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
	.xword	0x96f6f832b53f368d
	.xword	0x40772b10a56b3036
	.xword	0x58e1cb92d258742f
	.xword	0xd43e01a7db13b009
	.xword	0xadca4634bfbc118b
	.xword	0x3c6d4f61192d8f7e
	.xword	0x3aa9916e15ddfe4c
	.xword	0xd1e2c94418e5497b
	.xword	0x2d917601e0637064
	.xword	0x9774d7961cc6f005
	.xword	0xf856201b44567f3e
	.xword	0x430726034f54e41e
	.xword	0xd10260d1b0413a79
	.xword	0x447eb9647a0b1c5e
	.xword	0x9048f5d4f29ab2cd
	.xword	0x69efb0da9eac94b9
	.xword	0x317a894f1b1ffd72
	.xword	0x2d084027ae254266
	.xword	0x8ce94d50573a0f59
	.xword	0x53c1527bb6781c49
	.xword	0x2a30da9baf33cbfe
	.xword	0x75156d72d83d0073
	.xword	0xfd362dce2ef6f69b
	.xword	0x9c7a9a8c1ca26a82
	.xword	0xed1505db5fba6fc4
	.xword	0xa8171b5364077fc8
	.xword	0xa6bc3029d1eb5587
	.xword	0xd4998fbb776988a6
	.xword	0x0482009a10cccd8f
	.xword	0x9066cf4641d541c1
	.xword	0x8341ba14eb7b9f3a
	.xword	0x3c5d999c848b3a38
	.xword	0xf8922e3e369aafb1
	.xword	0x112dfd3776491c0e
	.xword	0x810dfce06c8d5f8c
	.xword	0xc12aa54147342f11
	.xword	0x7b069ed312053e75
	.xword	0x27936949d0971af6
	.xword	0xf98365f4e65f6ba8
	.xword	0x3831eb29f90bc8f6
	.xword	0xd66dfabab4cc0c74
	.xword	0x9037e6fad981f81a
	.xword	0xf6da6a0765f937f0
	.xword	0xc3bdbde730db4704
	.xword	0xe86c8b53126ad97b
	.xword	0xc425a5bc16b5a228
	.xword	0x148d13c1b9865790
	.xword	0x889f5fe10c5460ce
	.xword	0x44ec4960adc636be
	.xword	0x78844dc30e5138bf
	.xword	0xd61fdff89b988550
	.xword	0x93844712c7ca31ac
	.xword	0x46963cdd1d6aca47
	.xword	0x8bc7e68732043e8a
	.xword	0x1744bb479beb2a86
	.xword	0x588fb21908596a36
	.xword	0xdb1f62c27630e5a4
	.xword	0x108b901ca1feaf9d
	.xword	0xd780a700edad04fa
	.xword	0xb4144931a1c9c902
	.xword	0xbf2eedd709488714
	.xword	0x5496452ac42b71e1
	.xword	0x45c54e561f822343
	.xword	0xe6b92c97cc1bc5a2
	.xword	0xb463958589a7c38a
	.xword	0x9444c0d75e26de92
	.xword	0x6939e1f581125248
	.xword	0xd81fe1523a7f871b
	.xword	0x187d07ec4fef4dc1
	.xword	0x06a6f4e153d7758e
	.xword	0xd8b8c4a528b3df83
	.xword	0x3beafccb34c3f3e4
	.xword	0x6c4ff55f2c5aa682
	.xword	0x7bfecc28e0e5a325
	.xword	0xb6b7e4d9de2cc1a7
	.xword	0xed85baec3a2ff405
	.xword	0xa17f2a0e8ff0eb49
	.xword	0x5a690aba18f0e531
	.xword	0xd39f53dd1050d892
	.xword	0xa62d59fe2611065e
	.xword	0xd5cd023f049360d7
	.xword	0x98d0cdd10f74c6ae
	.xword	0x182e9d26a0fb48a6
	.xword	0x29484bb3b48ce119
	.xword	0x2574bd7d102adf10
	.xword	0x576b03dc7fbd3f9c
	.xword	0x0235aef9139cc051
	.xword	0xec3852335c1fb482
	.xword	0x4b990905ea4c7893
	.xword	0xbfd8f61fb78ed3b4
	.xword	0x7ef3e4f8598f048c
	.xword	0x69a47b03001503b0
	.xword	0xb02a33499dcf9c10
	.xword	0x00cae9173277efc9
	.xword	0x7ed8cab610a8f02e
	.xword	0x6271dcfb7daa7004
	.xword	0xe85f6a358d6e29a9
	.xword	0x25446a82eff74c8a
	.xword	0x1e41a12e13a7bca6
	.xword	0x0cc54314aa93bfb6
	.xword	0xf6815e9da7f0b2dd
	.xword	0x01111e2418ec7977
	.xword	0x925bc8a5c50f2da7
	.xword	0xe65825345539d03d
	.xword	0x9e4125019780b7d5
	.xword	0xb564e9fd24371a73
	.xword	0xe1ca942257edada0
	.xword	0xab0ee2555d76cb4e
	.xword	0x92be9c7b004f1301
	.xword	0x0ea469bf6465c6d5
	.xword	0x5f7d38426be31b01
	.xword	0x416bb8343dd3b9d2
	.xword	0x93d4c61a5ff3be66
	.xword	0x781d64318f737da1
	.xword	0x31941db302f0e499
	.xword	0x1e465465e692afae
	.xword	0xa3096f6dc3e38f96
	.xword	0x609e5e2992df28aa
	.xword	0x8bfe4a60c9660028
	.xword	0xd18a6d4e021afe02
	.xword	0xe7e5e7c45b46e905
	.xword	0x650c48ebaf160f2b
	.xword	0x851fb250cfe4e548
	.xword	0x17b4b13e72f53e62
	.xword	0x05524bbb63c3e834
	.xword	0xdad1e8e00e4e16cf
	.xword	0x405346d36dc1b389
	.xword	0x7a18866b751a4ec8
	.xword	0x44f9eb6036a1159e
	.xword	0x5f61ca0df9aec5e8
	.xword	0xd488983993e99013
	.xword	0x9da09f96dd501874
	.xword	0xa2c464535e0dbd64
	.xword	0xf76d77c685ce4667
	.xword	0x3627723821cdadff
	.xword	0x92b445e4aaf59e5e
	.xword	0x0f0794ed70c45a2c
	.xword	0x0cccc215dcd56dd5
	.xword	0x6d83dd389e9ee630
	.xword	0x64264b74f85c954f
	.xword	0x071eca4b76565677
	.xword	0x507d1eb5622b3bff
	.xword	0x1bc97a1c45143d8e
	.xword	0xf5ba5ab3adccc47c
	.xword	0x8a175ad5b6adf132
	.xword	0xbad37d34d417f5e5
	.xword	0x1fa42d5447a31f38
	.xword	0xcc08376927be01f2
	.xword	0x48d1029a408e9a4c
	.xword	0x106ed89178703f60
	.xword	0xe76fbb0d404ee86c
	.xword	0x4dba5eaa8232f5db
	.xword	0x83d0156dae52a08d
	.xword	0x1ca9981239936be1
	.xword	0x3dd9852225a2e285
	.xword	0x99b48fa3196f322d
	.xword	0xa0ee11e184cfa874
	.xword	0x0d8110c352165c4f
	.xword	0x292a7ea6979e8c0c
	.xword	0x9b74aa387edd2102
	.xword	0x4137cb5d0fd74d0d
	.xword	0xe5faac71586c0e13
	.xword	0x2f7c723bac7fdca5
	.xword	0x793d468cfa521724
	.xword	0x098544c71884c5f3
	.xword	0xa04791f2cd4cbc5c
	.xword	0x12e1dc92cda560fb
	.xword	0x3ff2ee0a664bc8e8
	.xword	0x4ace931335f57182
	.xword	0x9d5519495d0b1429
	.xword	0x0bfc0ed29f7f2f60
	.xword	0x24fea8f22f94993a
	.xword	0xbbeebd7dd686fece
	.xword	0x580160d7e0677b5f
	.xword	0x3578a783d3ce43d4
	.xword	0x8c9414929693e964
	.xword	0xd67325767c465606
	.xword	0xd35f76c7ca8fd6ae
	.xword	0xcff883e677e7f743
	.xword	0x79ce25fb8b5b88d3
	.xword	0x7fafc19a12fd6597
	.xword	0xb36ae50a19ca08be
	.xword	0x83a77a35c7bbb55e
	.xword	0x6da50a2b2c3f3c7e
	.xword	0xc4131785619d4f9b
	.xword	0x30aa372443fba2c5
	.xword	0xdf9ba64d124e931b
	.xword	0x20edab849c895052
	.xword	0x0c869bddbbf18ae1
	.xword	0x4366143677d0444b
	.xword	0x71e4b4b86e5fadf8
	.xword	0x1648acf28b02c7d5
	.xword	0x1a269240fb29f981
	.xword	0xdcdd5fa9a1d2cbf4
	.xword	0xfbefa5ea01125f54
	.xword	0x9109b51a929d45ad
	.xword	0x5f3418ab5447dfae
	.xword	0xd2f825d179aab889
	.xword	0x783f56e7e2650fca
	.xword	0x7ef888ac93f7fb94
	.xword	0xbabeef0f8f114d4e
	.xword	0x638b42830ba1884c
	.xword	0x2f82c003b9c3fed8
	.xword	0xbb76ac10d53869c2
	.xword	0x3fafffe747f797c3
	.xword	0x554d29c968885394
	.xword	0xa04e61b44095b13f
	.xword	0x8c5280fb1b735897
	.xword	0xc52e249bf9ba94cb
	.xword	0xe7dda683c251a5b8
	.xword	0x9e5a549d011ce772
	.xword	0x180919e62b8e3be6
	.xword	0xc1ba3f4fbdb963a4
	.xword	0xa68e649cff836ddf
	.xword	0x3cfa6f72f428eb29
	.xword	0xa5924a716d400abb
	.xword	0x983a3cee978b712c
	.xword	0x9be1e388aa19411e
	.xword	0x441f59ee490dd14c
	.xword	0x7a7d36a638efc5f4
	.xword	0x83ad88c4fbf0d87a
	.xword	0xba3f02f9d7735c57
	.xword	0xd95ff4454bbaee63
	.xword	0xd096d9d29043f0c8
	.xword	0xc264ae5648c7397a
	.xword	0x8ebd78139406b545
	.xword	0xc0c07aaa3b3ef126
	.xword	0x448b5c57c1fdc129
	.xword	0xc47969625e641f1b
	.xword	0xafd9c02b75c7acbc
	.xword	0xabbb07c4f8c21b45
	.xword	0x87047c07c0c620ed
	.xword	0x4ebaf22155353e1e
	.xword	0x6a5335b586a5d09c
	.xword	0x7e511be909150891
	.xword	0x5ee8e1334d731724
	.xword	0x5596572544cc462f
	.xword	0x0fcef8d5800a182e
	.xword	0xd206bcfffad77cbb
	.xword	0xd5222a68225074ec
	.xword	0xfd86df1b8f9d9756
	.xword	0xeaac0f9490016b4e
	.xword	0xa60c134ec861b89a
	.xword	0x74f5b8c761ec2453
	.xword	0x17b2bf798fd8c95b
	.xword	0x1e2ba78d03a6aac9
	.xword	0x0fabc9c2c8444d93
	.xword	0x92e9eb2cd643d76c
	.xword	0xce66496ac6f18992
	.xword	0x64d094504d2e3827
	.xword	0x8f6885a3b3fb5442
	.xword	0x88210650b0fd95fb
	.xword	0xc884f6986e67f01c
	.xword	0x3c421d1cdc8c21ba
	.xword	0x24af87c7622124e0
	.xword	0xd9cf1add8cabd458



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
	.xword	0x868f07c3e2f8c3d9
	.xword	0x633550a3824e8bd9
	.xword	0x1e159dbec5e15f5c
	.xword	0x63ae825192aed955
	.xword	0x1921b20fc9ad70a8
	.xword	0xd05b53ef98ea5c38
	.xword	0xd89b49c3cb2141d9
	.xword	0x6b97e859cf6f3b78
	.xword	0x0a24d80fc77de4e8
	.xword	0xf30a19d110aa7b18
	.xword	0x61e17a89b26b69d7
	.xword	0x5e99b2561f4eab29
	.xword	0x02e62d52187b678a
	.xword	0x459ac797918a017e
	.xword	0x6c7c51422ca83605
	.xword	0xfa8b3698ab328ef9
	.xword	0x09249b5e5a789a9f
	.xword	0x860d7d09acff35d9
	.xword	0x6b53c70f5aa47858
	.xword	0xaae51f6f36fcc4f1
	.xword	0x007ec40472338247
	.xword	0x08c8e3a7f897ff02
	.xword	0xf8126846f346ae04
	.xword	0x562674f9c2228654
	.xword	0x448d11ed628146ae
	.xword	0x333ae28e3e3211a8
	.xword	0xbf2b89977b9a5277
	.xword	0x118469ebfc77ef9b
	.xword	0xc6be83dfadeae651
	.xword	0x4615817cf3fc7620
	.xword	0x5bde311a41f8a77c
	.xword	0x441c0fe2d3e4d72e
	.xword	0x0e65af1e83e5ee4a
	.xword	0x9eac4fd055133654
	.xword	0x2ae7517a6f6923d7
	.xword	0x4b2badf77f43b493
	.xword	0x85dbdefd62cfe7cf
	.xword	0x5b9871f41b6c0ddf
	.xword	0x0a048048b8b61c68
	.xword	0x42afc8bb0500cc14
	.xword	0x573526a11048839d
	.xword	0x67f89a23b11a1037
	.xword	0x5234aa8c4b2f94a4
	.xword	0x26a7fb8088847572
	.xword	0x374c01585e2caf9c
	.xword	0x999da330758c404c
	.xword	0x1afe6087d7d96367
	.xword	0x3204970c9347c4d9
	.xword	0x2f4652a351cea353
	.xword	0xd4c08747742bfdeb
	.xword	0xc42e3e44a1f6d015
	.xword	0x17d6e42bf268017e
	.xword	0x4365ca203646fb5c
	.xword	0x702b326be868e8ce
	.xword	0xcf2035b0e469f008
	.xword	0x5b7b8d12902a3293
	.xword	0x83b0ca70eec65732
	.xword	0x64e2ef3657bcb9e1
	.xword	0x5b79ee9f302f4280
	.xword	0x2eb447044a2582e6
	.xword	0xc8de96b1a13f1efe
	.xword	0x4fdfe0d4e2156035
	.xword	0x37a63f3a16d2e09b
	.xword	0xa877e95a6e616f7e
	.xword	0xe770f2721fd0b599
	.xword	0x702ba6302ff4a87c
	.xword	0x96b0ce32d4d784e3
	.xword	0x944d897fca6ded3e
	.xword	0x2e0983710362ad52
	.xword	0x4a530493ca5a2d93
	.xword	0xa5b598d508a5ad71
	.xword	0x6c075c9997fc2520
	.xword	0x3df77f6aee653e0b
	.xword	0x5a9ac08820c493e3
	.xword	0x336f75fb873cc9ad
	.xword	0x02fb28dfd2606aec
	.xword	0x3b89f687e3db711a
	.xword	0xe4b894988ad758aa
	.xword	0xdf7a788550a1ff5f
	.xword	0x450971e70eed1a78
	.xword	0xb53d0ed9a424d7d2
	.xword	0x6dcb37677b03a5ee
	.xword	0x78c2d2bc365e2de7
	.xword	0x7f7d876ac1c1d753
	.xword	0x88340a0493e009d7
	.xword	0xa787329fcb0b4ba1
	.xword	0x7a4ddeb5eda5e685
	.xword	0xfcaf27a99e84dcb7
	.xword	0x35d1cad2127d462d
	.xword	0xf2b96f045f180af2
	.xword	0x4f1638a8065118f1
	.xword	0x7aa9fa71a1c7a7fd
	.xword	0x35744060bfe52e30
	.xword	0x7f6b70de2f5cd408
	.xword	0xbf124cd81e39f932
	.xword	0x473955777382cafb
	.xword	0x86d83814e04475ab
	.xword	0x578fef41e70ab7e0
	.xword	0x8efc9459032ea1b3
	.xword	0x78279834f6e45267
	.xword	0xd8c7d4a58bf6559e
	.xword	0x5a7f0b09ae01c701
	.xword	0x7622ca65e1f0cfe1
	.xword	0x6c8828e677cb01ed
	.xword	0xa1d8d8257bbfdec8
	.xword	0xbdac896aa8bc4116
	.xword	0xb5a0154ff5759f30
	.xword	0x8cf147114abc2c82
	.xword	0xb1ffdc6a6d695e42
	.xword	0xc29c56873a2e4481
	.xword	0x56417c4bb2b02986
	.xword	0x72d45b1b5f2763cb
	.xword	0x2298b2b4d90cf3a6
	.xword	0xe96847f456ac61d8
	.xword	0x944e76ad78df3d19
	.xword	0x33f1c4bff58fa0b1
	.xword	0x9e18bd221c66bf15
	.xword	0x3cf2a71c0be7dcaa
	.xword	0x7cfaa307df0b1921
	.xword	0x5e69554545593119
	.xword	0xbb236ce6ea407a92
	.xword	0x7ebeec2bf9e50a77
	.xword	0xb4ef9f37d9873993
	.xword	0xade50bd255fb63c5
	.xword	0xaa5465ac974234e5
	.xword	0x9668a41df2cd6b0e
	.xword	0x80103c4fe37c0746
	.xword	0xe79a1e31fc2b27f8
	.xword	0xd8c301b71b37bde4
	.xword	0x5feb2e6be65148ba
	.xword	0x4d82a51aa6fe7777
	.xword	0xc06986a173bfe9a4
	.xword	0x42d63118ae98ab53
	.xword	0xd0beca840839765e
	.xword	0xf2a497cd6b4b03be
	.xword	0x552e6a46e5e09612
	.xword	0x9cb275e69a5424a3
	.xword	0x8714ea8b5c3867a0
	.xword	0x4f258c56ed4b3bde
	.xword	0x86573b6d70222787
	.xword	0x9aa4bc24c546fe25
	.xword	0xed71454232933540
	.xword	0x1a678a87d8bcfcf3
	.xword	0xca73474cc10f4fb5
	.xword	0x38e20250b254154a
	.xword	0x4d78b5211ce0d762
	.xword	0xb5855890e0193e71
	.xword	0x7b4c454e9a543216
	.xword	0x96d016cc2571d259
	.xword	0x6bb33f6a6b4d978a
	.xword	0x79de93872c96cfb3
	.xword	0xcd2d695800f463f0
	.xword	0x25f21b77dd3300b4
	.xword	0x201956c9d324d62b
	.xword	0xc526e8be8d7f1d33
	.xword	0x479dea3d07d504db
	.xword	0x72581119c886e0b1
	.xword	0x01fc6168bafbf1c7
	.xword	0xd5c4b33da504567a
	.xword	0x22677507d1deba97
	.xword	0x7d11af3917e6423e
	.xword	0x24da8ed2eb956258
	.xword	0x08baa18951f62c63
	.xword	0x0a4468fbf4d435a9
	.xword	0xc7545c215076f33c
	.xword	0x61c0e37f10c46d1e
	.xword	0x0895462d950c7307
	.xword	0x68a2d300939bf244
	.xword	0x883ce51d5ddf022e
	.xword	0x901610023ada831f
	.xword	0x311436e53b887295
	.xword	0x94794bc9f5b76c1e
	.xword	0x0d80a3114e996459
	.xword	0x3fa45228b5418049
	.xword	0xbe5ae4498ea08563
	.xword	0x3b01729e3fba86be
	.xword	0xb7b78c0b88441aa3
	.xword	0x8d6508e09f748b21
	.xword	0xc9fc32e529805c46
	.xword	0x3e8bd3bce1098847
	.xword	0xc71360f028c0b6ec
	.xword	0xda4680d8d1319045
	.xword	0x3c464a7d06f1ea78
	.xword	0x8304ffa4313ced50
	.xword	0xdbd174e793e36cf7
	.xword	0x5e523b1df1ac2f16
	.xword	0xf7aad4d53db1ddd4
	.xword	0xd28a5d684aa49392
	.xword	0x33bdfe3944e51978
	.xword	0x8f071189cc5c88bc
	.xword	0xa49aec579fe5d91a
	.xword	0xaaa764b51aa6aadd
	.xword	0x3f6ab6d49676f4ce
	.xword	0x47f8dec9bfbe6cbe
	.xword	0x7554c03deaff67dd
	.xword	0x5521ee941638027f
	.xword	0xb9cb44d5b2f9e186
	.xword	0xda8f0ca2b3e93371
	.xword	0x0861447c820d87ff
	.xword	0xc87df0c4de9b7794
	.xword	0x098de401376afbaa
	.xword	0x62227e787ee27eb7
	.xword	0xd5f7535e68b23c50
	.xword	0x14d0b57270631454
	.xword	0x59899c075c7437a0
	.xword	0x8494ca0f198f49bf
	.xword	0x68d328677f94d0d4
	.xword	0xf050111821154be6
	.xword	0xbf407cd6a54aceb6
	.xword	0xdae103a70650116a
	.xword	0xb67b422514f458f6
	.xword	0x6c103e547ba6f20b
	.xword	0x3e949664abbfc3a3
	.xword	0xd381fd2a731df5b9
	.xword	0x94598ae6df38a55e
	.xword	0xf6e1154fb9ab8dc1
	.xword	0x1a836fb20c06803f
	.xword	0x3c34446525d491f9
	.xword	0x941737a55d946b72
	.xword	0xce969126a6922a3f
	.xword	0x090390c46f91de68
	.xword	0xb62af2720e885434
	.xword	0x9f49b301614b5b68
	.xword	0x95e671055537bd5e
	.xword	0xe75d9fbd8ffec3f4
	.xword	0xea357cbdbbd3431f
	.xword	0xa04adeb9805b74e7
	.xword	0x87c052d9aeefa8b0
	.xword	0xa925348fd0a609c3
	.xword	0x13e1eb4b9b339caf
	.xword	0x196033f918d02f2e
	.xword	0x05cf4de3b0717931
	.xword	0x4035a13c889a1e4a
	.xword	0x86698ca44d6d7d9f
	.xword	0xeaeb858603875ba5
	.xword	0x9bfdcc792e08bb1f
	.xword	0xb5689de63595af9a
	.xword	0xe515962c7fe8d114
	.xword	0x78462bf1c69d7f89
	.xword	0x54dc0c6df3279225
	.xword	0xa592c13e27e5fdc4
	.xword	0x207565a562801f03
	.xword	0xb49be7cad2525497
	.xword	0x9db503fd343106d7
	.xword	0xe207ba7888dc36f1
	.xword	0x3cb26235f2d06b54
	.xword	0x7ee3cec3cd1bb888
	.xword	0x40533c7d671d586d
	.xword	0x78edd87ac4955d0f
	.xword	0x195b1222f7b52451
	.xword	0xc1a7aec95800ce83
	.xword	0xb5fb2d183b1940a2
	.xword	0xbb2ae48d0f8c552f
	.xword	0x777f99401e94c00f
	.xword	0x8d8713e8b8414cb1
	.xword	0x2225af7432df0e1a



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
	.xword	0xca71283f1846145e
	.xword	0x9d1ff07d882bb711
	.xword	0x242d23bc538ce395
	.xword	0x49ffdebf2cde1d57
	.xword	0xa11c54db15d3cc1a
	.xword	0x6515d7b88c1564d9
	.xword	0xaea7a857d91c9f8f
	.xword	0x9c1793fe22b3b4a7
	.xword	0xa3ffb60859005456
	.xword	0x41d5513b46466a34
	.xword	0x7760462be4425646
	.xword	0x319364e2a9926b67
	.xword	0xb15eda4d785c7e99
	.xword	0x3e6d4f579fc1611f
	.xword	0x46c714f0d29de0a0
	.xword	0x181ade82d9eb9620
	.xword	0x9472c188ace05a3d
	.xword	0xf471b2c9f9337380
	.xword	0x767b8aa7ae63e062
	.xword	0xc8d76a50cb7f4816
	.xword	0xf18f4a7da29e007c
	.xword	0x13965c290f8220f9
	.xword	0x4e7cfe5d7febc969
	.xword	0x106f51abbf2e0139
	.xword	0xd2dfcb533ed5a9bb
	.xword	0x8d669c56173a82db
	.xword	0x84366fd416ea4646
	.xword	0x3c19364f75b52a03
	.xword	0x3bbbb52e28d71316
	.xword	0xd41ce6d155e0733f
	.xword	0x3c517d7f4ad1c9c7
	.xword	0x7b8d27f6fecf7402
	.xword	0xa366ba7df8485f10
	.xword	0xb50aef29e294e3f2
	.xword	0x9360860a5d41b73c
	.xword	0x26a2b11d916498d4
	.xword	0x3904d54de6a8246b
	.xword	0xddd3a8e246d2e7d0
	.xword	0x4aa1f1ce08d21264
	.xword	0x2b39b9f518f52478
	.xword	0xaabff05f868420f6
	.xword	0x54470322376ee5ad
	.xword	0x5883a333fb04c6e2
	.xword	0x9ffb87761aba12fd
	.xword	0x4b0bf5a8083bba4a
	.xword	0xafffab20642acfc1
	.xword	0xabf8504ca790456c
	.xword	0xc7f2cadb5d733f38
	.xword	0x83a69db15abf7679
	.xword	0xbbb25e1684fae2bd
	.xword	0x619c10676a3eb8db
	.xword	0x26c6ac4873521362
	.xword	0xeebcdd8e81439289
	.xword	0x83c9230fe611c212
	.xword	0x4fc6e271679d643f
	.xword	0xe0aeba13f28557c6
	.xword	0xd0f75e634361e1a6
	.xword	0xcea4ce112ae615f1
	.xword	0x175e4545bb8ec146
	.xword	0xb0dc889c7facf720
	.xword	0x3ef73b767fb36828
	.xword	0x631c69c5c2c2a5f2
	.xword	0x33d45919a41b207c
	.xword	0x2a5dfa9d49771cff
	.xword	0xe8972beb28e59d14
	.xword	0x53f07ad4a85d131a
	.xword	0x82441ddd6f10d0a3
	.xword	0x63306d77e9fabbcb
	.xword	0xf6639ce980a7d191
	.xword	0x96b82bea6891b167
	.xword	0x540f6e653f9df5e6
	.xword	0x6d8f597c9656119b
	.xword	0xe42ae80ee8ea8884
	.xword	0x74ae6e4d0fb108f9
	.xword	0xa81633e4cd52007d
	.xword	0x92e30ecec9701f28
	.xword	0xd73367db4e620d6e
	.xword	0xe8b53752c4953487
	.xword	0xa9a1c2cf634eca19
	.xword	0x55284f0547dfecd0
	.xword	0x2c3718fc016c7bf5
	.xword	0x5f4a0549a2c850ab
	.xword	0xce8eb23e56c593da
	.xword	0x2d58e9c1630a7cf7
	.xword	0xcb2bef79314046f1
	.xword	0xe9c99eaa2b199f23
	.xword	0x4d77de4af9ab401a
	.xword	0x0c13dbf0890a2f7c
	.xword	0x7c21e9fca809f42e
	.xword	0xaf01f50d4ffd7845
	.xword	0x7b08d4819bd330f3
	.xword	0xd5b9879e47e1899f
	.xword	0xc841c3aa5b0d13a0
	.xword	0xce84feb48306df5b
	.xword	0x747d9f7a0ae6c184
	.xword	0x266419955f34dea6
	.xword	0x75483f0caa9a552c
	.xword	0xab48807c34103296
	.xword	0xd832495117d0f513
	.xword	0xb7f26f67092b5230
	.xword	0x2b9b29830f21d13a
	.xword	0xcdf6475d17031cbd
	.xword	0x0d5883827a957a58
	.xword	0x658a5927d35fc02e
	.xword	0xeb7e9415b03f5c79
	.xword	0xba633a0a2ce9f4e1
	.xword	0xcb8998594fe7edbb
	.xword	0xd8355ac3bad4f5d4
	.xword	0x8f222724f4994d12
	.xword	0x0cda70cafe2a0a40
	.xword	0x11d0696ea8bb369f
	.xword	0xdcc9d0d08d73a5d3
	.xword	0x6f5381cc8dd47a39
	.xword	0x2767f5b34e6f79ec
	.xword	0x0c089572b7f7b6e0
	.xword	0xedc768505b801171
	.xword	0x74c2c84ac6b1a9fe
	.xword	0xd34c0252fd6218e3
	.xword	0xc8e47fe3b1a892a8
	.xword	0xb47277ea961d3e41
	.xword	0xa020dda6a28ad419
	.xword	0xb4043332a99aaac0
	.xword	0x66eb91270b745e8a
	.xword	0xaa5145a6e1953164
	.xword	0x02f216964f93b59d
	.xword	0xd09e6a7586378d6f
	.xword	0xca56eca36ca27c2b
	.xword	0x31bc15dba1018b20
	.xword	0x81b5ad82e9d1f6e2
	.xword	0xf6f39396e59d21af
	.xword	0xd15425c1733a7b14
	.xword	0x0d92b160c3a3e6f0
	.xword	0x678c2ed081b3a6b8
	.xword	0xdc2e1af8e2070833
	.xword	0x5a599a45bc61a588
	.xword	0x01017d8374c02ef6
	.xword	0x749e4ce83eab22da
	.xword	0xeeaa76d9010a68c4
	.xword	0xb8a75a8c573626d5
	.xword	0xfe4f0c3a7da562ac
	.xword	0x2e0bb4f086200e92
	.xword	0x7f409e552d973b0a
	.xword	0xebd36f087801d0cc
	.xword	0x5b35def0e2267377
	.xword	0x933098b3e0f7ee93
	.xword	0xfa9e860e8dd813f3
	.xword	0x69ff40f6c27da6ad
	.xword	0x6de7c3bcca629afc
	.xword	0xe8acbf055fe67373
	.xword	0x45d86487472e221f
	.xword	0xb17c0abc7937dfec
	.xword	0x854a75eb32edf13b
	.xword	0xe6de30a0f2f37256
	.xword	0xcaced56e986d9df2
	.xword	0xaff58a057f53f59c
	.xword	0x5ef244620e8d0dd9
	.xword	0xba51f2206536b35b
	.xword	0x2e2e7d40c4163262
	.xword	0xdf5a55ea13a403db
	.xword	0x78f2e06232736769
	.xword	0x6ac7c6d2fe6ca2bf
	.xword	0x5309784a54eabd9a
	.xword	0x09eabcde54246341
	.xword	0xdeba3bf550990b60
	.xword	0x574ed45e793f52e4
	.xword	0x1d68dda51268cf09
	.xword	0xc3622b132bb6cd5e
	.xword	0x2cf2b75baf6aa9fd
	.xword	0x3063ab1e65f90963
	.xword	0x34d9d91fab34a7df
	.xword	0xd74c414164ab616c
	.xword	0x97a4405db8cc904b
	.xword	0xd5dc2ae1222cfabe
	.xword	0x010ae2291862e846
	.xword	0x636f8aa5d54d0b51
	.xword	0xaa3aafaabacde410
	.xword	0xdcbc37b559936e90
	.xword	0xfbfab77e83b8bd2a
	.xword	0xedd1545cfbf42197
	.xword	0x33b66b5e0adb1d8f
	.xword	0x5acdff6e012f7b2e
	.xword	0xe0c001845b77114f
	.xword	0xf6ac31bddb9a2628
	.xword	0xea586e213743bea8
	.xword	0x5513984b74f755b2
	.xword	0x247913e811f1a805
	.xword	0x0fb62b7e9afca9c4
	.xword	0x31f0d0716269b67a
	.xword	0x99e47994a60c1883
	.xword	0x23a4681fa0b77a8a
	.xword	0x2fd0a748b8ce3c2e
	.xword	0x21b5b51736256181
	.xword	0xdcced4db43cbcd8f
	.xword	0x6de5621653d5175a
	.xword	0x3d0094003d81e031
	.xword	0x55a5ce88b8165c72
	.xword	0x4c80585411660c66
	.xword	0x9f0c623fdf4a5876
	.xword	0x19a4644aaf9097be
	.xword	0x5969c96406968db3
	.xword	0xe047ee53e382d0c3
	.xword	0xbefb513205cd7b1c
	.xword	0xf202d756aa502d5f
	.xword	0x438bcbd5d71e71ce
	.xword	0x45cc4f44dcf34ee5
	.xword	0x59fa968f6f4eaf7c
	.xword	0x05495aaf69c611bd
	.xword	0x1a3385a353151ecd
	.xword	0x3ddd110e4246c592
	.xword	0x02611b853bf1444d
	.xword	0xaccee877e4e0505a
	.xword	0x899c2a46a9025a66
	.xword	0xb5351d31c839c0fc
	.xword	0xfdf3b28af8620b77
	.xword	0x53ca9a1adb393851
	.xword	0x61575f3ab8ff189d
	.xword	0x1a6fe1bc964509cc
	.xword	0xde7895113edb37b4
	.xword	0x9a8c91642d91fb83
	.xword	0x9236c7b5c7d903ae
	.xword	0x1b84259555971d3b
	.xword	0xca8cd14fb21c63dd
	.xword	0x8b8824f22ccc338e
	.xword	0x507a8aab89a1a0d8
	.xword	0x2c37134d255d863f
	.xword	0x80cabda42668d96c
	.xword	0x4420b6a1773d6cc9
	.xword	0xb72db94b8a373c4a
	.xword	0x241697c74140144a
	.xword	0x7b54009ef3250049
	.xword	0xf7ee1a86fcf1017f
	.xword	0x08d899666247d60e
	.xword	0x4c920b91a4626f96
	.xword	0x2575a88c2b270aa9
	.xword	0xfcba39e648955fc2
	.xword	0x101fcbf9ed503df2
	.xword	0x1ba5055f5c589866
	.xword	0xeeb1453f2c6449b3
	.xword	0x5768eaf81bccf277
	.xword	0xfaa934c0a4a725af
	.xword	0x243368d233122e56
	.xword	0xd0638d3743ef152d
	.xword	0x804011243bfe866d
	.xword	0xea8a069121809902
	.xword	0xefb1bdac08ef60f9
	.xword	0x4e22a193c26e80ef
	.xword	0xfc8f002fe2059c00
	.xword	0xbba747f18e747a6b
	.xword	0x2c589fc04db3b72a
	.xword	0x4a1281bda4b7a713
	.xword	0xafc46c3dbf241ae2
	.xword	0x6e8bab5dc1869a03
	.xword	0x2776482be02b2f8a
	.xword	0x1863bf3582edae38
	.xword	0x5dce42e75b19bf24
	.xword	0x82cf263c50a5bd87



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
	.xword	0xf0f1f456d8b9911f
	.xword	0xc0e305a5da9bc5b1
	.xword	0x27116a90e89e04c2
	.xword	0x789b41c0664ed405
	.xword	0xb1a38701af224ddf
	.xword	0x667db164d581eb7d
	.xword	0x7031af431f99940d
	.xword	0xbb0c324639d1be7a
	.xword	0x6c55c0aeeaad90d4
	.xword	0x2658324fe5af8a87
	.xword	0xa8507fde0b4613da
	.xword	0xbe6e98626ac1e21a
	.xword	0x87eb3228fd75cb21
	.xword	0x580d426f695b4339
	.xword	0xecb00f0b0f2be82e
	.xword	0x29f1b1e74f071efa
	.xword	0x1da492f984ff2415
	.xword	0x86255471cb0a4463
	.xword	0x3138338fd0231947
	.xword	0x23042743b8f6e842
	.xword	0xaf01c7ab6bbfc127
	.xword	0x76c22204f9b38dc2
	.xword	0xbb56d3bb2235cb58
	.xword	0xb5a68cdcb4169f6b
	.xword	0x02ddf448a5a50d6f
	.xword	0xa91aac5876f65f49
	.xword	0x3431d91ac73f11f7
	.xword	0xecc90fd6bc4b9d96
	.xword	0x20015d18d5b184d9
	.xword	0x4948eb62acafb570
	.xword	0xfc225d22234469e8
	.xword	0x3f33686f82a4cebd
	.xword	0x00a81ae5f5f08885
	.xword	0x42337adc26f7cea0
	.xword	0xbf4bdd41c1e8a896
	.xword	0xde882797b67562a2
	.xword	0xb476f4c05bf458ff
	.xword	0xf25a5fd12a7c9de6
	.xword	0x0a2056ca3795ba87
	.xword	0x97f7d4991c13a648
	.xword	0x098a3f984062c521
	.xword	0x25c498b608a52633
	.xword	0xb9f6f135671c2da7
	.xword	0x7e324645b7a282d6
	.xword	0x11bea77313b0001e
	.xword	0xb1acc4779f3f61c0
	.xword	0xf5f71cbba9a8c46b
	.xword	0x30e7b1e922250382
	.xword	0x8afd32a1d9174820
	.xword	0x1e4325488c7a6d58
	.xword	0x3eb8a182e4bfacd1
	.xword	0xc4fdb2f8ffd850e0
	.xword	0x45372cb153fcbe05
	.xword	0xf27364bfcbb3548a
	.xword	0x3511f45f9f85e401
	.xword	0x83f59b07bfea461a
	.xword	0x3da3c2560fc316e7
	.xword	0x2e81aa4ee82c3c56
	.xword	0x1ea004101485acf0
	.xword	0xc79f298fcaf83d52
	.xword	0xb86c988ba449a94b
	.xword	0x556602f8d0dfa513
	.xword	0x0e81724ad3a1275a
	.xword	0x8e375af33e960677
	.xword	0xf33846290da340d1
	.xword	0x6a8c33c0a979368f
	.xword	0x613e7a0ed0f3925e
	.xword	0x221c6ef769408f8e
	.xword	0x80394d62c8a76e25
	.xword	0xa56299d65a5ddc21
	.xword	0x2383c7f33914d9ca
	.xword	0xc0094e8e00ae9980
	.xword	0xcd3af0c3d8ac3d17
	.xword	0x277bf02bfbaf388d
	.xword	0x0b85ecbce52e8907
	.xword	0xd9803e6625514b60
	.xword	0x9ae4ea024196b470
	.xword	0x8a91507142e89758
	.xword	0xdbc9b5a95153c57e
	.xword	0xb2ad1154dc929fef
	.xword	0x08ed92e60ff4fe87
	.xword	0x6caf1798ba293a78
	.xword	0xb2f2572856814113
	.xword	0xff8f7c13141448c2
	.xword	0xc0b67c24f66f78d9
	.xword	0xb56a3885891c2aad
	.xword	0x74d400dd0424aa1a
	.xword	0xc1ac3901bc58b61f
	.xword	0x257c73710aa99772
	.xword	0x420f223b909e0a7f
	.xword	0x7c70795c00155c3c
	.xword	0x5d7a369bd6e2d516
	.xword	0x8de31fd9957ce301
	.xword	0xf8416d3d1abe15f9
	.xword	0xf36d7e8586b3d7ea
	.xword	0x0428c427985f4cbc
	.xword	0x9b1a79a175e67379
	.xword	0x2283c01fd13c575e
	.xword	0xfd7fc8ab109d274f
	.xword	0x86dddfbce42ed753
	.xword	0x17d2f3b7fe50eff6
	.xword	0x00a91888758b0af2
	.xword	0xade3c415228e773f
	.xword	0x35085a623948a474
	.xword	0xb76316f477e6f269
	.xword	0xd632a15efd54a6e4
	.xword	0x1cd2f362e26e3e9e
	.xword	0x99c3e7a10efc50f7
	.xword	0x6951aafba363352b
	.xword	0xd08ca53b80937f6f
	.xword	0xc9d72b00328154b3
	.xword	0xc80ad955542c0840
	.xword	0x2ffc18f7544e176e
	.xword	0xfffc7dea9ab8fe3c
	.xword	0xbaab3514f05dd243
	.xword	0x1f1525b9d4aafa6b
	.xword	0x9a8d4f929d5675cb
	.xword	0xd42f2c6e5c34c6c9
	.xword	0xad0e7b315a7f57d3
	.xword	0x53635c23f3cd8511
	.xword	0x8ab47c5e600b0073
	.xword	0x40c9af2b5577ee24
	.xword	0xc548e93150b734c9
	.xword	0x51be4db3d1f790ff
	.xword	0x60d018b4000c352e
	.xword	0x0c2f1ca0872be662
	.xword	0x1e8be264be9f239a
	.xword	0xa059a9039b3b9be7
	.xword	0xdf2132140d3ab05d
	.xword	0x89ec9bcfa84bdd95
	.xword	0x4910fdd20f89029b
	.xword	0x77640432d2068a6f
	.xword	0xdd9f8516ad2407ed
	.xword	0xd3beacae26deba14
	.xword	0x46e217536911ddb1
	.xword	0x60e382514b07e16d
	.xword	0xdf830eb416233ad5
	.xword	0x796cdbb12c821165
	.xword	0x4b5d302592c25947
	.xword	0x5688fd023a5fb003
	.xword	0x45fdd5b32373f78c
	.xword	0x7cc17980f0932722
	.xword	0x6e307c58de24c419
	.xword	0x2be7d3723d1b163e
	.xword	0xceed9a37cfd7d46e
	.xword	0xb4e96a912617fef3
	.xword	0x36d2d983a9716109
	.xword	0xb03daedf9b622e4b
	.xword	0xd98c138dfb29ea4f
	.xword	0xe7e1c19023d0e91d
	.xword	0xf637c5ee25f8a24a
	.xword	0x1612fe155bf9300c
	.xword	0x262fadc076c7a5d0
	.xword	0x8a75c2dda92b429c
	.xword	0x5e17350180b18115
	.xword	0x8e0240d9fc164bfc
	.xword	0x9c0c704eef9e2801
	.xword	0x46c4d39c9d412163
	.xword	0x13b83019e7915a22
	.xword	0xb29447aa79d55d05
	.xword	0x1af6afb048b3f612
	.xword	0x310b03625bf3c2c5
	.xword	0x0eba8b96f934034b
	.xword	0x87c5be954bc7a855
	.xword	0xefb5c11b2bcd1b76
	.xword	0x98c5f9f432958c70
	.xword	0xa59a07f7d7f58bc7
	.xword	0x5cb9fb353fbd1cec
	.xword	0xf9892f6a6f50ce00
	.xword	0xdb597f6c3d178102
	.xword	0x8263657231efea60
	.xword	0xf0989f67390c70ca
	.xword	0xc46a9e93779cd266
	.xword	0x55e3f8514e83d4b0
	.xword	0x29734e150803201a
	.xword	0x85dab188622832a4
	.xword	0x36a3e6146e752f76
	.xword	0x4517246c60476580
	.xword	0x6661d7caec86dcdb
	.xword	0x122645fb2a1f7e5d
	.xword	0x4d4b871a6a7054d3
	.xword	0x200eb4286fb497c7
	.xword	0x614fd35f9de04324
	.xword	0x62968b4fbe5d8794
	.xword	0xfcb7ba0139929d1c
	.xword	0xb84febc5c98abe41
	.xword	0x19141799038254b3
	.xword	0xd478a5ad87d3e734
	.xword	0xc8cfd6ce7ea2d170
	.xword	0x18f2c830d91b3ce7
	.xword	0xda6a774f709058de
	.xword	0x5cf4f75814da7065
	.xword	0xb3f5ae6ad49577e0
	.xword	0xdb8edaebbe7080e8
	.xword	0x1a8218a9df01d346
	.xword	0x0b43de068b629746
	.xword	0x5a0c28aabf207054
	.xword	0xa108a263c814d5fc
	.xword	0x55c5e1b0233dc833
	.xword	0xe0c91e770c97a28d
	.xword	0x27a5a858fb939622
	.xword	0x83a49a176ccf127f
	.xword	0x48d1ac9ddc398137
	.xword	0x9efa07e1142de6f2
	.xword	0x9130aab443c9df38
	.xword	0x029a178a9ae2144f
	.xword	0x3f7f10d8979394c0
	.xword	0xab4f693643988e4e
	.xword	0x0701816d29fd5cd9
	.xword	0x74c137af1e5d8f5c
	.xword	0x560521f98177d238
	.xword	0x1eb2995b5eff48c1
	.xword	0xa8fb21c84f333ba5
	.xword	0xaf930c5a05b9a8ea
	.xword	0xfa23ad0a3f0b66ad
	.xword	0x20a032448056e673
	.xword	0x4b6c5eeeadfdd234
	.xword	0x53543c6d6f57fe93
	.xword	0xf04851097d849082
	.xword	0xa7d797c560f7dd6c
	.xword	0xd2af055e788ebb0e
	.xword	0xc0cdf3a953d953e5
	.xword	0x05eb54057fb28a75
	.xword	0xa2753685a65723e7
	.xword	0xe9c9c88fe060ddd4
	.xword	0x3b3e98b44ccb590e
	.xword	0x0d90fa1e3f642204
	.xword	0x9352dcec9bdf3476
	.xword	0xede673fadcc19794
	.xword	0xc321f00a08bcb197
	.xword	0x822b1a95740d7c62
	.xword	0x5a1567e57e0dc8f7
	.xword	0x03cd26211642f574
	.xword	0x8b3c5760c9a72a3f
	.xword	0x18c574f7126d13ee
	.xword	0xc1f4366b3c0211b8
	.xword	0x0921f5b57ea7cc38
	.xword	0x9790ff0f9fe32238
	.xword	0xee564b530ddbd342
	.xword	0x621379495442dc93
	.xword	0xf83efd1988a1d6a0
	.xword	0xa49599c3307c3d60
	.xword	0x88fed01e3e6e2fba
	.xword	0xb2ea93f6388d7594
	.xword	0x634f1e1e1dc3de4d
	.xword	0x7b4b2c1069cdaee4
	.xword	0x7ca880366bf02b08
	.xword	0x6f09481a175f1f59
	.xword	0x1b4c962bf311a4c5
	.xword	0xe6a363e43df1ce11
	.xword	0x5ffd74d4d6e0417e
	.xword	0x2fc6d6bc3ebe956a
	.xword	0x95cd171d78a0c3ae
	.xword	0x8b67b145c0dc3a64
	.xword	0xf317c3590bd5bddf
	.xword	0x9b0aa5d656ebc32a



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
	.xword	0xb81e3c688bd1e9bc
	.xword	0x37c06e106f3ae06a
	.xword	0xafc43294f9f43cd8
	.xword	0x8fcf2e2318f33144
	.xword	0x58a672a6350c2bbd
	.xword	0x7dffe330e162d598
	.xword	0xab741c3a3ad27337
	.xword	0x4ef0dd904538ed76
	.xword	0x74b69fecaf955248
	.xword	0xba8feb2791830261
	.xword	0x21d0eb4109ad6382
	.xword	0x855dfe8243646180
	.xword	0x15294a05c2a9d2af
	.xword	0x8394290620db7c77
	.xword	0xfbe8ce30fd0616ed
	.xword	0x62c1a83656f6d3ba
	.xword	0x745226c958f6150c
	.xword	0x835a008775493af2
	.xword	0x0ccc07d0bf0f9af7
	.xword	0x8ed1dd3f62475f01
	.xword	0x112d535fdb2db43d
	.xword	0x40dabfe8f74a7970
	.xword	0xde782303045bc35d
	.xword	0xaccf1474eb7182cd
	.xword	0x34dd471b4e3233c0
	.xword	0xc54b85647935192c
	.xword	0xc0ecfabf5211f9b8
	.xword	0x71c4a04b15e9a828
	.xword	0x7e476a830f3b32ed
	.xword	0x103066ff4fb3a8d1
	.xword	0x417acc2344f3495b
	.xword	0xcf1a8aec9a1c2e51
	.xword	0xab28b362ae276fca
	.xword	0x61dbbd65fd72aea5
	.xword	0xb347a2e9e8dcfbd6
	.xword	0xb05640e15035f6d0
	.xword	0xd8053da7a70d63d0
	.xword	0x5de05c056a0ba078
	.xword	0x3dbe355defd7a03f
	.xword	0xc27749fbf9f38069
	.xword	0x94b286626b84ab76
	.xword	0xf7e21ae27f444ae1
	.xword	0xf9350131dc4d2bd4
	.xword	0x6d6af5b3f9c9a3b3
	.xword	0xd28cb4966bda5f14
	.xword	0x8894790e0a9800d5
	.xword	0x62f428a2c413baf7
	.xword	0x229b32ed7c400436
	.xword	0xad3fc5fa05e84757
	.xword	0x73063c1cdd1517d6
	.xword	0xe765a5e5ab94b064
	.xword	0xa939350d9f4067ca
	.xword	0x38f192f95c5093c9
	.xword	0xb695ab286b83ce5e
	.xword	0xa43b23980ce53be1
	.xword	0x55299cf2dd058698
	.xword	0xfc1af6bcfb975a2b
	.xword	0x5f64f7d8861ad714
	.xword	0x1dee640cd8ba48f6
	.xword	0x5d4afdafc21d2bc8
	.xword	0x81cf596d0c7e1f7c
	.xword	0x44f9203e33b06f97
	.xword	0x6f98ad7a3190b0d4
	.xword	0xb5c525f6aee80dc2
	.xword	0x89477ddd5b2a3fbe
	.xword	0xf6769535514d7c00
	.xword	0x1f83141470a62f4c
	.xword	0xec797abcb935db29
	.xword	0xd9d58d37b7d683cd
	.xword	0x4e0168c5cc1f4ec1
	.xword	0x7795c78106d25921
	.xword	0xe3f75dc98f95723a
	.xword	0x1d17245cd5a2c40e
	.xword	0x37f052b22491e2f1
	.xword	0x6556da56f8d76520
	.xword	0x819211f24dbc9ced
	.xword	0x351b55d222bd22a5
	.xword	0x0e420d9b8136fd85
	.xword	0xe86ebce6220f71e9
	.xword	0x1f031cc93dcbb74e
	.xword	0x49636ddee61bf3a0
	.xword	0x2648462303a26691
	.xword	0x37ccc1e7fb577cb2
	.xword	0x7fb7a888aed61a3b
	.xword	0xe546a4e2fc2961ba
	.xword	0xa2a0b9bfcbd95611
	.xword	0x56f588d3cbfebae3
	.xword	0xa65c559881147a1a
	.xword	0x9c268b8f09966f55
	.xword	0x48833f8a83a7fdbd
	.xword	0xd1089291f37501bf
	.xword	0xa0844b1c424ff739
	.xword	0x74ee0cf90783353f
	.xword	0x448283d9364df7cd
	.xword	0xb412579bba51b568
	.xword	0xa67e941003e1a916
	.xword	0x6d5cbfc3aa685a06
	.xword	0x9b90ba85d6d5229a
	.xword	0xfb68b3a60b4139f9
	.xword	0x4509285c3e46ba17
	.xword	0x2c02f0cd970e17ea
	.xword	0x3a6fbd78fe15c090
	.xword	0x453e801ad5d08d8d
	.xword	0x72aeb8065af6b0a4
	.xword	0xd763184be80498ac
	.xword	0xc054a38ae46eb073
	.xword	0x04647543d1b6474d
	.xword	0x7be2bad6cf936328
	.xword	0x1f0d5f6f700ddd16
	.xword	0xca6ef4fdc5bbec1c
	.xword	0xb461de71a34fdf36
	.xword	0x446abb133eaedf9c
	.xword	0xb518bcf8b4efa420
	.xword	0x8a01311c1f07beec
	.xword	0xf4c49dc550f3f9d8
	.xword	0x0c22032c7eae168f
	.xword	0x8bbdfba84a59fe5c
	.xword	0x380f9266d869654b
	.xword	0xd374df7a610e7c45
	.xword	0x11c0e1ecf004b092
	.xword	0x9652f7c3aa5e1071
	.xword	0x26a5dba69daa92ee
	.xword	0xbbc2206be877bea6
	.xword	0x690ec30858685322
	.xword	0x6ec4c89aaaa475a3
	.xword	0x89ca9a5d44d2b2b9
	.xword	0xaee208358e8df089
	.xword	0xba0fdbfad920b923
	.xword	0x2aaa1a67df9a019b
	.xword	0x5f51e6fa1459b378
	.xword	0x61ee52767d2aaced
	.xword	0x3c5770bcbf32445f
	.xword	0x79fd1c201dce71f8
	.xword	0x23e103c5ed0131c2
	.xword	0xf54306fd2fd684b9
	.xword	0x0990072fd8620d92
	.xword	0xb88981a05afc235b
	.xword	0x6b28749d289501ed
	.xword	0xfbf3386e8d5fbcc2
	.xword	0x69e3bc696e08c65e
	.xword	0x5636bad9cd9288d6
	.xword	0x3aec8187f567de4e
	.xword	0x10716bc2b4c1f17d
	.xword	0x8f5c10ebf43b18ba
	.xword	0xc21996b07a55e59b
	.xword	0x9c342005eb86eb13
	.xword	0xe55b439f6542cf73
	.xword	0x4804c1bb029a66df
	.xword	0xbb1b1c699d889043
	.xword	0xf40c04e75937e98f
	.xword	0x5f6be64a0eb19e42
	.xword	0x261493b8a96f9b0e
	.xword	0x66890d155efd31d9
	.xword	0xc184c17fdb953f1f
	.xword	0x00ebc8de28740e3b
	.xword	0x21f3da11abd1a1eb
	.xword	0xcc1b0f20fc3586c6
	.xword	0x2466a6418de95f67
	.xword	0x4fa260d8c14bcfce
	.xword	0x137950a449ba82cc
	.xword	0x95b80db82b2c22d1
	.xword	0xdd72f08c9806ea12
	.xword	0x40b5d164a846cc57
	.xword	0x477c87f290a6d9da
	.xword	0x8a1778d98010579e
	.xword	0x6273cf68c39f17fe
	.xword	0x8ff6f0773b6078a7
	.xword	0xda6c0c9c2df463cf
	.xword	0x23aac9344b905915
	.xword	0xd4c5641320f9e006
	.xword	0xa520c69788e9bb15
	.xword	0xc52deeef3966dc7f
	.xword	0x5c38cbca4f662411
	.xword	0x66dde8cff18c3791
	.xword	0x4292f7b09ae91f9c
	.xword	0xe8af3cd80bcec375
	.xword	0xc1468ad9ed9ecb61
	.xword	0xf772261e237aa2d4
	.xword	0x9eeb68d77a75678d
	.xword	0xf5302e426c295979
	.xword	0xc96b1174d6bdcee2
	.xword	0xa3c54e592fab0f8b
	.xword	0x0d17c2b67ce9938c
	.xword	0x048cc6a94fcf787a
	.xword	0x92cc78df055768f0
	.xword	0x54f465a28b3f548b
	.xword	0xecc39d131b788511
	.xword	0xb49895ce802ed93f
	.xword	0xb054fa3ea887dc43
	.xword	0xea74e18d7de84531
	.xword	0xbd94a40e45f7d064
	.xword	0xfad7724bee7c7af7
	.xword	0x2da779b5fc8eb99e
	.xword	0xc64896da8463d3f9
	.xword	0x2ac719e6c0065f68
	.xword	0x7fe90c904c95566b
	.xword	0x93c065ee1c617dcc
	.xword	0x3ac0d1c58533c54d
	.xword	0x245f09ca1cf0ce5f
	.xword	0xcead27747608cbbc
	.xword	0x9bc417d59e555fbf
	.xword	0x51286232139096ce
	.xword	0x0f94b60575d4dd85
	.xword	0x978341e2526d1ac4
	.xword	0x01af80c945ad231d
	.xword	0xebd039e4e1d5565b
	.xword	0x24ff1a2c19659f23
	.xword	0xb87009f93ddea07a
	.xword	0xf3a184bd27d57799
	.xword	0xeabde127164f57ad
	.xword	0x181a5d203c269596
	.xword	0x02e6773b588d6cd7
	.xword	0xb09532aa1fb628ae
	.xword	0xdae1be21135fbf61
	.xword	0x80b845f3c6ea19e2
	.xword	0xa3428110c42aa7ab
	.xword	0xb4b88df3ec27ef1a
	.xword	0xc09d0babd262a2e2
	.xword	0x37281149abd4b13d
	.xword	0xbb4214f07ac59dbf
	.xword	0xada6e1375f95b320
	.xword	0x020357a8bbda4eb3
	.xword	0x69564a4c4bcc2fda
	.xword	0x40fce2e81f3bf5a6
	.xword	0x7aeedda7efd9b60d
	.xword	0xc7379d76200008b9
	.xword	0xf188a9823bf8a464
	.xword	0xa9c4a84ffe1c7215
	.xword	0x78c3b9d8625c0ade
	.xword	0x299294b7df40b905
	.xword	0xf4b5ec273a9554d8
	.xword	0x6f9308c557b99441
	.xword	0x5bc19018796ad9e4
	.xword	0x09e1d80215e35759
	.xword	0x46fcd23223031cc7
	.xword	0x4919a76244151de0
	.xword	0xc31a1ff384ec1d1d
	.xword	0xad89aca197f41846
	.xword	0x3118bd40b9ef7e69
	.xword	0x16a4dc75cee0e389
	.xword	0x8bfe6d760d6e8bcf
	.xword	0x053d2b74bf9a3151
	.xword	0xabb2acf4cb9ea953
	.xword	0xafd5a7ee3702deec
	.xword	0x9a751ab58b64419a
	.xword	0x76dec95602efba2a
	.xword	0x68976b6b0dd1e874
	.xword	0xe18b0842aa2d27de
	.xword	0x4f6cafb4065503c4
	.xword	0x44bd643a0492fe71
	.xword	0x27b393c50c98a404
	.xword	0x4661886c6b32a54f
	.xword	0x45f63e8122ec40e6
	.xword	0xb4069df0dde45147
	.xword	0xb56869b47f11810a
	.xword	0xa05992a652da5694



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
!!#   int int_cnt = 0;
!!#   int total_int =0;
!!# #define ISEG	0
!!# #define MY_HYP_SEC	1
!!# #define NCDATA0	2
!!# #define NCDATA1	3
!!# #define NCDATA2	4
!!# #define NCDATA3	5
!!# #define NCDATA4	6
!!# #define NCDATA5	7
!!# #define NCDATA6	8
!!# #define PAGE1A	9
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#   IJ_set_rvar ("diag.j", 103, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 105, wt_ld, "{30}");
!!#   IJ_set_rvar ("diag.j", 106, wt_st, "{30}");
!!#   IJ_set_rvar ("diag.j", 107, wt_bl, "{30}");
!!#   IJ_set_rvar ("diag.j", 108, wt_alu, "{3}");
!!# 
!!#   IJ_set_rvar ("diag.j", 111, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 112, Rv_Simm13, "13'b0 0000 rrrr r000");
!!#   IJ_set_rvar ("diag.j", 113, Rv_addr_sel, "3'brrr");
!!# 
!!#   ! keeping CPU ID 0, Agent 0-15 ??
!!#   IJ_set_rvar ("diag.j", 118, Rv_memaddr_pattern_int,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 1110 0000 0000 0000,"
!!#         "20'b 0000 0000 0000 0000 0000,");
!!# 
!!#   ! keeping CPU ID 0, Agent 0-15 ??
!!#   IJ_set_rvar ("diag.j", 126, Rv_memaddr_pattern_int1,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 1111 0000 0000 0000,"
!!#         "20'b 0000 0000 0000 0000 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 135, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 144, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 153, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 154, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 157, Rv_memaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 0001 0000 rrrr 0000 0001,"
!!#         "20'{0}");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 169, Rv_jbiaddr_pattern0,
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
!!#   IJ_set_rvar ("diag.j", 183, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0010,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 196, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0011,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 208, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0100,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 220, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0101,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 232, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0110,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 244, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0111,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 254, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 265, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 273, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 281, ijdefault, Ft_Rs1, "{6,7,9,10,11,12,13}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 282, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 283, ijdefault, Ft_Rd, "{16..23}");
!!#   IJ_set_ropr_fld    ("diag.j", 284, Rv_ldstD, Ft_Rd, "{16,18,20,22}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 287, ijdefault, Ft_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_ropr_fld    ("diag.j", 288, ijdefault, Ft_Imm_Asi, "{0}");
!!# 
!!#   IJ_bind_file_group("diag.j", 292, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 293, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 296, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 298, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 299, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 300, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 302, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 304, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 305, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 307, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 308, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 309, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 310, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 312, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 313, sjm_5, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 316, th_M, 3, 1, Rv_rand64);
!!# 
!!#   IJ_printf ("diag.j", 318, th_M, "\tmov\t0, %%r8\n");
!!#   IJ_printf ("diag.j", 319, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n", Rv_jbiaddr_pattern0);
!!#   IJ_printf ("diag.j", 320, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n", Rv_jbiaddr_pattern1);
!!#   IJ_printf ("diag.j", 321, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n", Rv_jbiaddr_pattern2);
!!#   IJ_printf ("diag.j", 322, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n", Rv_jbiaddr_pattern3);
!!#   IJ_printf ("diag.j", 323, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n", Rv_jbiaddr_pattern4);
!!#   IJ_printf ("diag.j", 324, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n", Rv_jbiaddr_pattern5);
!!#   IJ_printf ("diag.j", 325, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n", Rv_jbiaddr_pattern6);
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
!!#   !IJ_printf (sjm_4, "\n\nBA LABEL_0\n");
!!#   !IJ_printf (sjm_5, "\n\nBA LABEL_0\n");
!!# 
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 362,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 364,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_printf ("diag.j", 369, th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",total_int);
!!#   IJ_printf ("diag.j", 370, th_M, "\tsetx\t page1a, %%r1, %%r26\n");
!!#   IJ_printf ("diag.j", 371, th_M, "\tldx\t[%%r26], flagr\n");
!!#   IJ_printf ("diag.j", 372, th_M, "\tcmp\t%%r6, flagr\n");
!!#   IJ_printf ("diag.j", 373, th_M, "\tbne\tbad_end\n");
!!#   IJ_printf ("diag.j", 374, th_M, "\tnop\n");
!!#   IJ_th_start ("diag.j", 375,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 842, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: set_addr  %rvar  wt_alu |
!!#            load      %rvar  wt_ld |
!!#            alu       %rvar  wt_alu |
!!#            block_ld  %rvar  wt_bl |
!!#            block_st  %rvar  wt_bl |
!!#            store     %rvar  wt_ld | sjm4 %rvar  wt_ld | sjm5   %rvar  wt_ld
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
!!# sjm4: set_sjm4_wr_b | set_sjm4_rd_b |  set_sjm4_wr_b_io | set_sjm4_rd_b_io | set_sjm4_wr_io | set_sjm4_rd_io | set_sjm4_wr_m | set_sjm4_wr_m_io | set_sjm4_rd_m_io | set_sjm4_int  
!!# ;
!!# 
!!# set_sjm4_int : mSET_SJM4_INT   
!!#                 {
!!# 
!!#                  if (random()%1 == 0) {
!!#                    total_int++;
!!#                    IJ_printf ("diag.j", 879, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 881, Rv_memaddr_pattern_int);
!!#                      IJ_printf ("diag.j", 882, sjm_4, "INT  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 883, Rv_memaddr_pattern_int);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                         if(i==2) int_cnt++;
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          data_st = int_cnt;
!!#                          !data_st = IJ_get_rvar_val32(Rv_rand32);
!!# 			 !IJ_update_rvar(Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 891, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 892, sjm_4, "0x%08x ",data_st);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 894, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 895, sjm_4, "+\n");
!!#                           }
!!#                         }
!!#                          int_cnt++;
!!#                   }
!!#                 }
!!# 
!!# ;  
!!# set_sjm4_wr_b : mSET_SJM4_WR_B
!!#                 {
!!# 
!!#                   if (sjm4_cnt < 8) { 
!!#                    IJ_printf ("diag.j", 907, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 910, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 912, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 913, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 917, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 918, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 919, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 920, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 922, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 923, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 936, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 941, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 945, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 946, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 948, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 949, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 963, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 967, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 968, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 985, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 990, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 991, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 993, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 994, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 996, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 997, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1002, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1003, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1005, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 1006, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 1023, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1026, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 1028, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 1029, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 1033, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1034, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1035, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 1036, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1038, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 1039, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 1052, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 1057, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1061, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1062, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1064, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 1065, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 1080, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1083, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 1085, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 1086, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1101, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 1104, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1105, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1106, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1111, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1113, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 1127, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 1133, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 1137, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 1152, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1154, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 1156, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1162, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1163, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1190, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 1196, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1197, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1200, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1202, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1211, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1213, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1231, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1237, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1242, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1244, sjm_4, "\n");
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
!!# sjm5: set_sjm5_wr_b | set_sjm5_rd_b |  set_sjm5_wr_b_io | set_sjm5_rd_b_io | set_sjm5_wr_io | set_sjm5_rd_io | set_sjm5_wr_m | set_sjm5_wr_m_io | set_sjm5_rd_m_io | set_sjm5_int
!!# ;
!!# 
!!# set_sjm5_int : mSET_SJM5_INT   
!!#                 {
!!# 
!!#                  if (random()%1 == 0) {
!!#                    total_int++;
!!#                    IJ_printf ("diag.j", 1263, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1265, Rv_memaddr_pattern_int1);
!!#                      IJ_printf ("diag.j", 1266, sjm_5, "INT  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1267, Rv_memaddr_pattern_int1);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          data_st = IJ_get_rvar_val32("diag.j", 1271, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1272, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1273, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1274, sjm_5, "0x%08x ",data_st);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1276, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1277, sjm_5, "+\n");
!!#                           }
!!#                         }
!!#                   }
!!#                 }
!!# 
!!# ;  
!!# set_sjm5_wr_b : mSET_SJM5_WR_B
!!#                 {
!!# 
!!#                   if (sjm5_cnt < 8) { 
!!#                    IJ_printf ("diag.j", 1288, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1291, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1293, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1294, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1297, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1298, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1299, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1300, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1302, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1303, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1316, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1321, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1325, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1326, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1328, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1329, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1343, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1347, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1348, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1365, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1370, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1371, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1373, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1374, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1376, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1377, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1382, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1383, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1385, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1386, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1403, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1406, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1408, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1409, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1413, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1414, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1415, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1416, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1418, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1419, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1432, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1437, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1441, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1442, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1444, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1445, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1461, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1464, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1466, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1467, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1482, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1485, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1486, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1487, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1492, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1494, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1508, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1514, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1518, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1533, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1535, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1537, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1543, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1544, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1571, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1577, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1578, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1581, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1583, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1592, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1594, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1612, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1618, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1623, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1625, sjm_5, "\n");
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
!!#                       IJ_printf ("diag.j", 1667, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern0);
!!#                       IJ_printf ("diag.j", 1669, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_jbiaddr_pattern1);
!!#                       IJ_printf ("diag.j", 1671, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                               Rv_jbiaddr_pattern2);
!!#                       IJ_printf ("diag.j", 1673, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_jbiaddr_pattern3);
!!#                       IJ_printf ("diag.j", 1675, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern4);
!!#                       IJ_printf ("diag.j", 1677, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_jbiaddr_pattern5);
!!#                       IJ_printf ("diag.j", 1679, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
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
!!#                         case 0 : IJ_printf ("diag.j", 1690, th_M, "\tldda\t[%%r6]ASI_BLK_P, %%f0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1691, th_M, "\tldda\t[%%r7]ASI_BLK_P, %%f0\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1692, th_M, "\tldda\t[%%r9]ASI_BLK_P, %%f0\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1693, th_M, "\tldda\t[%%r10]ASI_BLK_P, %%f0\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1694, th_M, "\tldda\t[%%r11]ASI_BLK_P, %%f0\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1695, th_M, "\tldda\t[%%r12]ASI_BLK_P, %%f0\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1696, th_M, "\tldda\t[%%r13]ASI_BLK_P, %%f0\n"); break;
!!#                         default : IJ_printf ("diag.j", 1697, th_M, "\tldda\t[%%r8]ASI_BLK_P, %%f0\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1699, th_M, "\tmembar\t 0x40\n");
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
!!#                         case 0 : IJ_printf ("diag.j", 1710, th_M, "\tstda\t %%f0, [%%r6]ASI_BLK_P\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1711, th_M, "\tstda\t %%f0, [%%r7]ASI_BLK_P\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1712, th_M, "\tstda\t %%f0, [%%r9]ASI_BLK_P\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1713, th_M, "\tstda\t %%f0, [%%r10]ASI_BLK_P\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1714, th_M, "\tstda\t %%f0, [%%r11]ASI_BLK_P\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1715, th_M, "\tstda\t %%f0, [%%r12]ASI_BLK_P\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1716, th_M, "\tstda\t %%f0, [%%r13]ASI_BLK_P\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1717, th_M, "\tstda\t %%f0, [%%r7]ASI_BLK_P\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1719, th_M, "\tmembar\t 0x40\n");
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
