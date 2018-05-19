// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_usr_mode_sas3_rand_0.s
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
   random seed:	502512539
   Jal pio_rnd_basic4_usr_mode_sas3.j:	
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
ldda [%g3]ASI_BLK_P, %f16

! Register init code

	setx 0x29d6498875e0ce4e, %g1, %g0
	setx 0x56cca1688a8ee90e, %g1, %g1
	setx 0xee63d80a3efa3c3e, %g1, %g2
	setx 0xe9af36221e6838e9, %g1, %g3
	setx 0xcbc49eb324cbd816, %g1, %g4
	setx 0x72e9868d81a6fd63, %g1, %g5
	setx 0x5778e74fbac2b01a, %g1, %g6
	setx 0xd4fe1f5bb45afba7, %g1, %g7
	setx 0xb8c031cffb1e1464, %g1, %r16
	setx 0x63a12cba317bc835, %g1, %r17
	setx 0x6af0ebd0c6329913, %g1, %r18
	setx 0xa7d7ed8507da03bd, %g1, %r19
	setx 0x95e80cd09d182895, %g1, %r20
	setx 0x34baeaf1cbc5c77a, %g1, %r21
	setx 0x276c37e14a6f4b7b, %g1, %r22
	setx 0x9098caa27220c5a9, %g1, %r23
	setx 0xe255645cd6307da6, %g1, %r24
	setx 0x289d6ed514358abe, %g1, %r25
	setx 0xc5f326b9effca1e3, %g1, %r26
	setx 0xcc2f9284a77eea54, %g1, %r27
	setx 0xb28000cad321014f, %g1, %r28
	setx 0xad22a7cb130d9b27, %g1, %r29
	setx 0xc62028fe0c301654, %g1, %r30
	setx 0x0eba37953fdcc274, %g1, %r31
	save
	setx 0xac01fcffc1594342, %g1, %r16
	setx 0x57ec1f8681214991, %g1, %r17
	setx 0x1293c9e68815e669, %g1, %r18
	setx 0x7b7cd77a5eac13c5, %g1, %r19
	setx 0x3ade58a20879d075, %g1, %r20
	setx 0x8fb641d1a1016e58, %g1, %r21
	setx 0x1650fa7468b95a78, %g1, %r22
	setx 0x8740a80d07d10134, %g1, %r23
	setx 0x4dfc881afc73c4bd, %g1, %r24
	setx 0x9afe6f6152e163a1, %g1, %r25
	setx 0x329a85b3e2a5712b, %g1, %r26
	setx 0xf9a074ffbd6245c2, %g1, %r27
	setx 0x4575b577927e0d60, %g1, %r28
	setx 0x367ca4c643db08e8, %g1, %r29
	setx 0x14e87220be701cbc, %g1, %r30
	setx 0x33db58f0fa7b3a80, %g1, %r31
	save
	setx 0x8b937bf701fee340, %g1, %r16
	setx 0xed907527d672636e, %g1, %r17
	setx 0x6ee2b0862cf68390, %g1, %r18
	setx 0x0c9e3b9fb5e7fd9d, %g1, %r19
	setx 0x393f6859807aef8b, %g1, %r20
	setx 0xc34067efdbea7704, %g1, %r21
	setx 0xa5c34660cb802ff2, %g1, %r22
	setx 0xf45992117d5f5335, %g1, %r23
	setx 0x4d448b2f1a258fb5, %g1, %r24
	setx 0xfbe4081e88acab7b, %g1, %r25
	setx 0xb9416baa62b8987f, %g1, %r26
	setx 0xadcfeb6e171d0d23, %g1, %r27
	setx 0xb790fbd142dc7832, %g1, %r28
	setx 0xa1021f3321a93d83, %g1, %r29
	setx 0xba07af68e9b1fc24, %g1, %r30
	setx 0x8d6eac450db1ba0f, %g1, %r31
	restore
	mov	0, %r8
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d02ef1c0, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r9
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	stda	 %f16, [%r12]ASI_BLK_PL
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r10]ASI_BLK_P, %f16
	membar	 0x40
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r9
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe8298008  ! 4: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe4236008  ! 5: STW_I	stw	%r18, [%r13 + 0x0008]
	.word 0xe4598008  ! 6: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xe459a008  ! 7: LDX_I	ldx	[%r6 + 0x0008], %r18
	.word 0xe0330008  ! 8: STH_R	sth	%r16, [%r12 + %r8]
	stda	 %f0, [%r13]ASI_BLK_PL
	membar	 0x40
!DEBUG rnd_cnt = 1 
	ldda	[%r10]ASI_BLK_PL, %f16
	membar	 0x40
	.word 0xe8532000  ! 11: LDSH_I	ldsh	[%r12 + 0x0000], %r20
	setx	0x00000000d02ef000, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d04ef1c0, %r1, %r9
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d06ef1c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_PL
	membar	 0x40
	stda	 %f16, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r9
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xec034008  ! 16: LDUW_R	lduw	[%r13 + %r8], %r22
	.word 0xe8526030  ! 17: LDSH_I	ldsh	[%r9 + 0x0030], %r20
!DEBUG rnd_cnt = 0 
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe80aa020  ! 20: LDUB_I	ldub	[%r10 + 0x0020], %r20
	.word 0xe04a6038  ! 21: LDSB_I	ldsb	[%r9 + 0x0038], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe851a020  ! 25: LDSH_I	ldsh	[%r6 + 0x0020], %r20
	.word 0xec298008  ! 26: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe8330008  ! 27: STH_R	sth	%r20, [%r12 + %r8]
	.word 0xe8324008  ! 28: STH_R	sth	%r20, [%r9 + %r8]
	.word 0xec518008  ! 29: LDSH_R	ldsh	[%r6 + %r8], %r22
!DEBUG rnd_cnt = 0 
	ldda	[%r10]ASI_BLK_P, %f16
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_PL
	membar	 0x40
	.word 0xe85ac008  ! 32: LDX_R	ldx	[%r11 + %r8], %r20
!DEBUG rnd_cnt = 1 
	ldda	[%r6]ASI_BLK_PL, %f0
	membar	 0x40
	.word 0xe0028008  ! 34: LDUW_R	lduw	[%r10 + %r8], %r16
	stda	 %f0, [%r9]ASI_BLK_PL
	membar	 0x40
	.word 0xec4b0008  ! 36: LDSB_R	ldsb	[%r12 + %r8], %r22
	.word 0xe43b2028  ! 37: STD_I	std	%r18, [%r12 + 0x0028]
	stda	 %f0, [%r11]ASI_BLK_PL
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r12]ASI_BLK_P, %f16
	membar	 0x40
!DEBUG rnd_cnt = 1 
	ldda	[%r7]ASI_BLK_PL, %f16
	membar	 0x40
	.word 0xe00a6030  ! 41: LDUB_I	ldub	[%r9 + 0x0030], %r16
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d02ef000, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r9
	setx	0x00000000d04ef0c0, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xe4236000  ! 43: STW_I	stw	%r18, [%r13 + 0x0000]
!DEBUG rnd_cnt = 0 
	ldda	[%r12]ASI_BLK_P, %f16
	membar	 0x40
	.word 0xa812e030  ! 45: OR_I	or 	%r11, 0x0030, %r20
	.word 0xe0134008  ! 46: LDUH_R	lduh	[%r13 + %r8], %r16
	.word 0xe0432008  ! 47: LDSW_I	ldsw	[%r12 + 0x0008], %r16
	.word 0xe422a030  ! 48: STW_I	stw	%r18, [%r10 + 0x0030]
	.word 0xe00b6020  ! 49: LDUB_I	ldub	[%r13 + 0x0020], %r16
	.word 0xec4b6030  ! 50: LDSB_I	ldsb	[%r13 + 0x0030], %r22
	.word 0xec0b6038  ! 51: LDUB_I	ldub	[%r13 + 0x0038], %r22
	.word 0xe039a038  ! 52: STD_I	std	%r16, [%r6 + 0x0038]
!DEBUG rnd_cnt = 0 
	ldda	[%r10]ASI_BLK_P, %f16
	membar	 0x40
	stda	 %f0, [%r9]ASI_BLK_PL
	membar	 0x40
	.word 0xe0218008  ! 55: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d02ef180, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d04ef180, %r1, %r9
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d06ef0c0, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
!DEBUG rnd_cnt = 1 
	ldda	[%r7]ASI_BLK_PL, %f16
	membar	 0x40
	.word 0xe402e020  ! 59: LDUW_I	lduw	[%r11 + 0x0020], %r18
	.word 0xe8426008  ! 60: LDSW_I	ldsw	[%r9 + 0x0008], %r20
!DEBUG rnd_cnt = 0 
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04a4008  ! 62: LDSB_R	ldsb	[%r9 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xa8998008  ! 64: XORcc_R	xorcc 	%r6, %r8, %r20
	.word 0xe471a010  ! 65: STX_I	stx	%r18, [%r6 + 0x0010]
	.word 0xe041e010  ! 66: LDSW_I	ldsw	[%r7 + 0x0010], %r16
	.word 0xe8718008  ! 67: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe4228008  ! 68: STW_R	stw	%r18, [%r10 + %r8]
	.word 0xe03a8008  ! 69: STD_R	std	%r16, [%r10 + %r8]
	.word 0xe072c008  ! 70: STX_R	stx	%r16, [%r11 + %r8]
	stda	 %f0, [%r11]ASI_BLK_PL
	membar	 0x40
	.word 0xec42e000  ! 72: LDSW_I	ldsw	[%r11 + 0x0000], %r22
!DEBUG rnd_cnt = 1 
	ldda	[%r12]ASI_BLK_PL, %f16
	membar	 0x40
	.word 0xe0726010  ! 74: STX_I	stx	%r16, [%r9 + 0x0010]
	.word 0xac92c008  ! 75: ORcc_R	orcc 	%r11, %r8, %r22
	.word 0xe00aa010  ! 76: LDUB_I	ldub	[%r10 + 0x0010], %r16
	.word 0xe01b6018  ! 77: LDD_I	ldd	[%r13 + 0x0018], %r16
	.word 0xec330008  ! 78: STH_R	sth	%r22, [%r12 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4228008  ! 80: STW_R	stw	%r18, [%r10 + %r8]
	.word 0xe421e000  ! 81: STW_I	stw	%r18, [%r7 + 0x0000]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec22e000  ! 83: STW_I	stw	%r22, [%r11 + 0x0000]
	.word 0xe001a028  ! 84: LDUW_I	lduw	[%r6 + 0x0028], %r16
!DEBUG rnd_cnt = 0 
	ldda	[%r12]ASI_BLK_P, %f16
	membar	 0x40
	.word 0xe042c008  ! 86: LDSW_R	ldsw	[%r11 + %r8], %r16
	.word 0xec524008  ! 87: LDSH_R	ldsh	[%r9 + %r8], %r22
	.word 0xec4b0008  ! 88: LDSB_R	ldsb	[%r12 + %r8], %r22
	.word 0xe8024008  ! 89: LDUW_R	lduw	[%r9 + %r8], %r20
	.word 0xe85b0008  ! 90: LDX_R	ldx	[%r12 + %r8], %r20
	.word 0xe82b6030  ! 91: STB_I	stb	%r20, [%r13 + 0x0030]
!DEBUG rnd_cnt = 1 
	ldda	[%r11]ASI_BLK_PL, %f0
	membar	 0x40
	.word 0xe04b2010  ! 93: LDSB_I	ldsb	[%r12 + 0x0010], %r16
	.word 0xe0418008  ! 94: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe02a4008  ! 95: STB_R	stb	%r16, [%r9 + %r8]
!DEBUG rnd_cnt = 1 
	ldda	[%r11]ASI_BLK_PL, %f0
	membar	 0x40
	.word 0xe021c008  ! 97: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe40a4008  ! 98: LDUB_R	ldub	[%r9 + %r8], %r18
!DEBUG rnd_cnt = 0 
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0434008  ! 100: LDSW_R	ldsw	[%r13 + %r8], %r16
	.word 0xe431a008  ! 102: STH_I	sth	%r18, [%r6 + 0x0008]
	.word 0xe8332000  ! 103: STH_I	sth	%r20, [%r12 + 0x0000]
!DEBUG rnd_cnt = 0 
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d02ef0c0, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d04ef1c0, %r1, %r9
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d06ef140, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	stda	 %f0, [%r7]ASI_BLK_PL
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r9]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8234008  ! 108: STW_R	stw	%r20, [%r13 + %r8]
	.word 0xe872e000  ! 109: STX_I	stx	%r20, [%r11 + 0x0000]
	.word 0xe071a010  ! 110: STX_I	stx	%r16, [%r6 + 0x0010]
	.word 0xe012e028  ! 111: LDUH_I	lduh	[%r11 + 0x0028], %r16
	.word 0xec3aa038  ! 112: STD_I	std	%r22, [%r10 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe431e010  ! 114: STH_I	sth	%r18, [%r7 + 0x0010]
	.word 0xe021a028  ! 115: STW_I	stw	%r16, [%r6 + 0x0028]
!DEBUG rnd_cnt = 0 
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec41c008  ! 117: LDSW_R	ldsw	[%r7 + %r8], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
!DEBUG rnd_cnt = 1 
	ldda	[%r9]ASI_BLK_PL, %f0
	membar	 0x40
	.word 0xe072a020  ! 120: STX_I	stx	%r16, [%r10 + 0x0020]
!DEBUG rnd_cnt = 1 
	ldda	[%r10]ASI_BLK_PL, %f16
	membar	 0x40
	.word 0xe03b0008  ! 122: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe012a038  ! 123: LDUH_I	lduh	[%r10 + 0x0038], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe032c008  ! 126: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe0530008  ! 127: LDSH_R	ldsh	[%r12 + %r8], %r16
	.word 0xe041a038  ! 128: LDSW_I	ldsw	[%r6 + 0x0038], %r16
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r9
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe01a4008  ! 130: LDD_R	ldd	[%r9 + %r8], %r16
	.word 0xec232020  ! 131: STW_I	stw	%r22, [%r12 + 0x0020]
	.word 0xe0498008  ! 132: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe0728008  ! 133: STX_R	stx	%r16, [%r10 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1140, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r9
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	.word 0xec2b6038  ! 136: STB_I	stb	%r22, [%r13 + 0x0038]
	stda	 %f16, [%r10]ASI_BLK_PL
	membar	 0x40
	.word 0xe04ac008  ! 138: LDSB_R	ldsb	[%r11 + %r8], %r16
	.word 0xe0532028  ! 139: LDSH_I	ldsh	[%r12 + 0x0028], %r16
	.word 0xe831e010  ! 140: STH_I	sth	%r20, [%r7 + 0x0010]
	stda	 %f0, [%r7]ASI_BLK_PL
	membar	 0x40
	.word 0xe4218008  ! 142: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xec22e018  ! 143: STW_I	stw	%r22, [%r11 + 0x0018]
	stda	 %f16, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe039a008  ! 145: STD_I	std	%r16, [%r6 + 0x0008]
	.word 0xec428008  ! 146: LDSW_R	ldsw	[%r10 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_PL
	membar	 0x40
	.word 0xe01b4008  ! 148: LDD_R	ldd	[%r13 + %r8], %r16
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r9
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe0130008  ! 150: LDUH_R	lduh	[%r12 + %r8], %r16
!DEBUG rnd_cnt = 1 
	ldda	[%r11]ASI_BLK_PL, %f0
	membar	 0x40
	.word 0xe831a028  ! 152: STH_I	sth	%r20, [%r6 + 0x0028]
	.word 0xec718008  ! 153: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe02aa038  ! 154: STB_I	stb	%r16, [%r10 + 0x0038]
	.word 0xe472c008  ! 155: STX_R	stx	%r18, [%r11 + %r8]
	.word 0xe029e030  ! 156: STB_I	stb	%r16, [%r7 + 0x0030]
	.word 0xe0328008  ! 157: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe032e020  ! 158: STH_I	sth	%r16, [%r11 + 0x0020]
	.word 0xe4326008  ! 159: STH_I	sth	%r18, [%r9 + 0x0008]
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r9
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	stda	 %f16, [%r6]ASI_BLK_PL
	membar	 0x40
	.word 0xe81b2030  ! 162: LDD_I	ldd	[%r12 + 0x0030], %r20
	stda	 %f0, [%r13]ASI_BLK_PL
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec42e028  ! 165: LDSW_I	ldsw	[%r11 + 0x0028], %r22
	.word 0xe831a038  ! 166: STH_I	sth	%r20, [%r6 + 0x0038]
	.word 0xe039e038  ! 167: STD_I	std	%r16, [%r7 + 0x0038]
	.word 0xe01b6008  ! 168: LDD_I	ldd	[%r13 + 0x0008], %r16
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r9
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe01a4008  ! 170: LDD_R	ldd	[%r9 + %r8], %r16
!DEBUG rnd_cnt = 0 
	ldda	[%r10]ASI_BLK_P, %f16
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
!DEBUG rnd_cnt = 1 
	ldda	[%r9]ASI_BLK_PL, %f0
	membar	 0x40
	.word 0xe409a038  ! 174: LDUB_I	ldub	[%r6 + 0x0038], %r18
	.word 0xe821a010  ! 175: STW_I	stw	%r20, [%r6 + 0x0010]
	.word 0xe042c008  ! 176: LDSW_R	ldsw	[%r11 + %r8], %r16
	.word 0xe0326000  ! 177: STH_I	sth	%r16, [%r9 + 0x0000]
	.word 0xe00b6008  ! 178: LDUB_I	ldub	[%r13 + 0x0008], %r16
!DEBUG rnd_cnt = 0 
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0726000  ! 180: STX_I	stx	%r16, [%r9 + 0x0000]
	.word 0xe00b0008  ! 181: LDUB_R	ldub	[%r12 + %r8], %r16
	.word 0xe05b6010  ! 182: LDX_I	ldx	[%r13 + 0x0010], %r16
	.word 0xec31e028  ! 183: STH_I	sth	%r22, [%r7 + 0x0028]
	.word 0xe8536008  ! 184: LDSH_I	ldsh	[%r13 + 0x0008], %r20
	.word 0xa8898008  ! 185: ANDcc_R	andcc 	%r6, %r8, %r20
	.word 0xac898008  ! 186: ANDcc_R	andcc 	%r6, %r8, %r22
!DEBUG rnd_cnt = 0 
	ldda	[%r12]ASI_BLK_P, %f16
	membar	 0x40
	.word 0xe44aa038  ! 188: LDSB_I	ldsb	[%r10 + 0x0038], %r18
	.word 0xa8b1e038  ! 189: SUBCcc_I	orncc 	%r7, 0x0038, %r20
	.word 0xe05a4008  ! 190: LDX_R	ldx	[%r9 + %r8], %r16
	.word 0xe4236000  ! 191: STW_I	stw	%r18, [%r13 + 0x0000]
!DEBUG rnd_cnt = 0 
	ldda	[%r12]ASI_BLK_P, %f16
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r10]ASI_BLK_P, %f16
	membar	 0x40
	stda	 %f16, [%r12]ASI_BLK_PL
	membar	 0x40
	.word 0xe04b0008  ! 195: LDSB_R	ldsb	[%r12 + %r8], %r16
	stda	 %f16, [%r11]ASI_BLK_P
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r7]ASI_BLK_P, %f16
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_PL
	membar	 0x40
	.word 0xe0432030  ! 199: LDSW_I	ldsw	[%r12 + 0x0030], %r16
	stda	 %f0, [%r9]ASI_BLK_PL
	membar	 0x40
!DEBUG rnd_cnt = 1 
	ldda	[%r10]ASI_BLK_PL, %f16
	membar	 0x40
	.word 0xe00b6010  ! 202: LDUB_I	ldub	[%r13 + 0x0010], %r16
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d02ef080, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r9
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	stda	 %f0, [%r7]ASI_BLK_PL
	membar	 0x40
	.word 0xe8198008  ! 205: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xe81a4008  ! 206: LDD_R	ldd	[%r9 + %r8], %r20
	stda	 %f16, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f16, [%r6]ASI_BLK_PL
	membar	 0x40
	.word 0xe00a8008  ! 209: LDUB_R	ldub	[%r10 + %r8], %r16
	.word 0xe021e010  ! 210: STW_I	stw	%r16, [%r7 + 0x0010]
	.word 0xe82b6028  ! 211: STB_I	stb	%r20, [%r13 + 0x0028]
	.word 0xe021c008  ! 213: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe0226010  ! 214: STW_I	stw	%r16, [%r9 + 0x0010]
	.word 0xa4134008  ! 215: OR_R	or 	%r13, %r8, %r18
	.word 0xec71a010  ! 216: STX_I	stx	%r22, [%r6 + 0x0010]
	.word 0xec4b4008  ! 217: LDSB_R	ldsb	[%r13 + %r8], %r22
	.word 0xe422a008  ! 218: STW_I	stw	%r18, [%r10 + 0x0008]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe042a010  ! 220: LDSW_I	ldsw	[%r10 + 0x0010], %r16
!DEBUG rnd_cnt = 1 
	ldda	[%r9]ASI_BLK_PL, %f0
	membar	 0x40
!DEBUG rnd_cnt = 1 
	ldda	[%r9]ASI_BLK_PL, %f0
	membar	 0x40
!DEBUG rnd_cnt = 1 
	ldda	[%r12]ASI_BLK_PL, %f16
	membar	 0x40
	.word 0xe041e028  ! 224: LDSW_I	ldsw	[%r7 + 0x0028], %r16
	.word 0xe02aa028  ! 225: STB_I	stb	%r16, [%r10 + 0x0028]
	.word 0xe4236018  ! 226: STW_I	stw	%r18, [%r13 + 0x0018]
	.word 0xa4818008  ! 227: ADDcc_R	addcc 	%r6, %r8, %r18
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xe0198008  ! 229: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe03ae030  ! 230: STD_I	std	%r16, [%r11 + 0x0030]
!DEBUG rnd_cnt = 1 
	ldda	[%r13]ASI_BLK_PL, %f0
	membar	 0x40
	.word 0xe03b0008  ! 232: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe4330008  ! 233: STH_R	sth	%r18, [%r12 + %r8]
	.word 0xe431e008  ! 234: STH_I	sth	%r18, [%r7 + 0x0008]
	.word 0xe0036000  ! 235: LDUW_I	lduw	[%r13 + 0x0000], %r16
	.word 0xec732028  ! 236: STX_I	stx	%r22, [%r12 + 0x0028]
	stda	 %f0, [%r13]ASI_BLK_PL
	membar	 0x40
	.word 0xe80a8008  ! 238: LDUB_R	ldub	[%r10 + %r8], %r20
	.word 0xe83ac008  ! 239: STD_R	std	%r20, [%r11 + %r8]
!DEBUG rnd_cnt = 0 
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0234008  ! 241: STW_R	stw	%r16, [%r13 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xa0432008  ! 243: ADDC_I	addc 	%r12, 0x0008, %r16
!DEBUG rnd_cnt = 1 
	ldda	[%r10]ASI_BLK_PL, %f16
	membar	 0x40
	.word 0xec130008  ! 245: LDUH_R	lduh	[%r12 + %r8], %r22
!DEBUG rnd_cnt = 1 
	ldda	[%r9]ASI_BLK_PL, %f0
	membar	 0x40
	.word 0xe8324008  ! 247: STH_R	sth	%r20, [%r9 + %r8]
	.word 0xe011a000  ! 248: LDUH_I	lduh	[%r6 + 0x0000], %r16
	.word 0xe4736018  ! 249: STX_I	stx	%r18, [%r13 + 0x0018]
	.word 0xe811a028  ! 250: LDUH_I	lduh	[%r6 + 0x0028], %r20
	.word 0xe05b2000  ! 251: LDX_I	ldx	[%r12 + 0x0000], %r16
	.word 0xec0b4008  ! 252: LDUB_R	ldub	[%r13 + %r8], %r22
!DEBUG rnd_cnt = 1 
	ldda	[%r11]ASI_BLK_PL, %f0
	membar	 0x40
	.word 0xe03b2010  ! 254: STD_I	std	%r16, [%r12 + 0x0010]
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	.word 0xec41a030  ! 256: LDSW_I	ldsw	[%r6 + 0x0030], %r22
	.word 0xa8a36028  ! 257: SUBcc_I	subcc 	%r13, 0x0028, %r20
	.word 0xe0734008  ! 258: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe431c008  ! 259: STH_R	sth	%r18, [%r7 + %r8]
	.word 0xe0298008  ! 260: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xec336008  ! 261: STH_I	sth	%r22, [%r13 + 0x0008]
	.word 0xec59e028  ! 262: LDX_I	ldx	[%r7 + 0x0028], %r22
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r9
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe4118008  ! 264: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xe011c008  ! 265: LDUH_R	lduh	[%r7 + %r8], %r16
	.word 0xe45b2018  ! 266: LDX_I	ldx	[%r12 + 0x0018], %r18
	stda	 %f16, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec024008  ! 268: LDUW_R	lduw	[%r9 + %r8], %r22
!DEBUG rnd_cnt = 1 
	ldda	[%r9]ASI_BLK_PL, %f0
	membar	 0x40
	.word 0xe83a6028  ! 270: STD_I	std	%r20, [%r9 + 0x0028]
	.word 0xe0736000  ! 271: STX_I	stx	%r16, [%r13 + 0x0000]
	.word 0xe039a028  ! 272: STD_I	std	%r16, [%r6 + 0x0028]
!DEBUG rnd_cnt = 1 
	ldda	[%r12]ASI_BLK_PL, %f16
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe871c008  ! 275: STX_R	stx	%r20, [%r7 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec5b6028  ! 277: LDX_I	ldx	[%r13 + 0x0028], %r22
	.word 0xe8428008  ! 278: LDSW_R	ldsw	[%r10 + %r8], %r20
	.word 0xa82ae038  ! 279: ANDN_I	andn 	%r11, 0x0038, %r20
	.word 0xe812a000  ! 280: LDUH_I	lduh	[%r10 + 0x0000], %r20
	.word 0xe052e018  ! 281: LDSH_I	ldsh	[%r11 + 0x0018], %r16
	.word 0xe4318008  ! 282: STH_R	sth	%r18, [%r6 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
!DEBUG rnd_cnt = 1 
	ldda	[%r13]ASI_BLK_PL, %f0
	membar	 0x40
!DEBUG rnd_cnt = 0 
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe449e028  ! 287: LDSB_I	ldsb	[%r7 + 0x0028], %r18
	.word 0xe801a028  ! 288: LDUW_I	lduw	[%r6 + 0x0028], %r20
	.word 0xe012e008  ! 289: LDUH_I	lduh	[%r11 + 0x0008], %r16
	stda	 %f16, [%r10]ASI_BLK_PL
	membar	 0x40
	.word 0xe45b2030  ! 291: LDX_I	ldx	[%r12 + 0x0030], %r18
	.word 0xe8330008  ! 292: STH_R	sth	%r20, [%r12 + %r8]
!DEBUG rnd_cnt = 1 
	ldda	[%r12]ASI_BLK_PL, %f16
	membar	 0x40
	.word 0xec132038  ! 294: LDUH_I	lduh	[%r12 + 0x0038], %r22
	.word 0xe421e028  ! 295: STW_I	stw	%r18, [%r7 + 0x0028]
	stda	 %f0, [%r9]ASI_BLK_P
	membar	 0x40
	stda	 %f16, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe02a4008  ! 298: STB_R	stb	%r16, [%r9 + %r8]



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
        .skip 4000

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
	.xword	0x242b58842c694552
	.xword	0xcd0a3af9d812c680
	.xword	0x885ca626866140cb
	.xword	0x0a5cf7f1e12ef92c
	.xword	0x5ea66d039acc4426
	.xword	0xcb2dfdb99da0293b
	.xword	0xdd72d48b3cda5856
	.xword	0x76ef67b9d8b368bd
	.xword	0x277dc37c1859c852
	.xword	0x0ef3c9a30333f28f
	.xword	0xea1581b997618f80
	.xword	0xf75d5449d0de2d69
	.xword	0xda471dd0e207e816
	.xword	0x71a70bc658be5835
	.xword	0x549ec851896cc46c
	.xword	0xec17abbe614704ae
	.xword	0x59c1483f6b5fed37
	.xword	0x7a56514d8b53c17e
	.xword	0x30e5278808017bd3
	.xword	0x5118c8340d5a7009
	.xword	0x531c4d49b18d365e
	.xword	0x6e4d4a74fb04c2df
	.xword	0x1a3affeab05053a9
	.xword	0x6942f55a5fd2bf74
	.xword	0x2b3b9cdbe8308a66
	.xword	0xb2547f33f8d65a49
	.xword	0xeb4363b31f7818e7
	.xword	0x32c2055f334c17f5
	.xword	0x14a2e26d36ac815f
	.xword	0xeeac9f5e18408a82
	.xword	0xc59cc495be7ba794
	.xword	0x18423abf82f6e3d4
	.xword	0x8ebabc8e13404c4a
	.xword	0xc933f32990586384
	.xword	0xbe86973f3fd09220
	.xword	0xfd4e70af399294e4
	.xword	0x1aba39366e29eb11
	.xword	0x600f315c47316988
	.xword	0xbf6471007d51612d
	.xword	0xa08779c137798740
	.xword	0xc016c4ea650708d2
	.xword	0xa753d6afb95c6335
	.xword	0xeb28af86e5eb4172
	.xword	0x1c7b24827fa785cc
	.xword	0xb08a32a651a9984f
	.xword	0x349729751d5eff42
	.xword	0x9fd5d3fb16cb7da3
	.xword	0x235bca8d458fc67a
	.xword	0x42a750698505c5b9
	.xword	0xde63a76b66619de3
	.xword	0xf7147aa3b3a15c6c
	.xword	0xc57fc3866f40904d
	.xword	0x011b47aa68f67ea5
	.xword	0x8b13803f7e3053a1
	.xword	0xbde932761d8a3043
	.xword	0xdac24e4317656c50
	.xword	0xbddcd8fd2c5be6ec
	.xword	0x08450f58bd3f54c2
	.xword	0x971928f78b859a9d
	.xword	0x90ef819f65465e67
	.xword	0xc5d403e95f720d56
	.xword	0xb9d05aea4b2426aa
	.xword	0x30f1fcaf2abc06c1
	.xword	0x2dcf3f1d16303d4c
	.xword	0xe354d14e81b1b69d
	.xword	0xf07c29bbfb1ae7ea
	.xword	0xa926440ee74568f7
	.xword	0xa40fad38d88203ed
	.xword	0xbe93ec814b3fc53c
	.xword	0x1fc7c398ca591921
	.xword	0x3981aabfd4b46883
	.xword	0xcf8f0ec3964518ec
	.xword	0x0e4e4578e6ef797c
	.xword	0xdf95107e10042fac
	.xword	0x381baf71087a616b
	.xword	0x99a36d50139ce210
	.xword	0x8e76ae16f8f1fb20
	.xword	0x8c8d97ef1d1f93e7
	.xword	0xde478b49ca50465b
	.xword	0x9d28f1f9ade340e5
	.xword	0x27b7a4dddcecf732
	.xword	0x75185ce734e1b714
	.xword	0x193983c706cd0e48
	.xword	0x48a54497293d499d
	.xword	0xbf67e1cf51ba6978
	.xword	0xbc2290589b2d7549
	.xword	0x723c5fd44ef17cd7
	.xword	0xaa6d67d2b6a87742
	.xword	0x33e0b0f6864e919c
	.xword	0xba1de46db19bbcd2
	.xword	0x114765bef3caa3ea
	.xword	0xbd0f207417b7d112
	.xword	0xdb4e22401834d5aa
	.xword	0x1583d6edf27238fd
	.xword	0xa3b85f1bd4339b5b
	.xword	0xbe9a6ee5d4271259
	.xword	0x551a035aaf96ddf9
	.xword	0xdcb466bf07874441
	.xword	0xa2d5c1b910680406
	.xword	0x961f91d235266275
	.xword	0xb06ba89b2600966b
	.xword	0x4af628941d972de1
	.xword	0x1465621a1de268f3
	.xword	0xcd97a56b73ae5607
	.xword	0xe08e8b80bb39bc85
	.xword	0x4f9054c7375bcc01
	.xword	0x75d99d0f9ae8202b
	.xword	0x9aa47f33e7a79fc7
	.xword	0x589e608c32c01afd
	.xword	0x182ea7c4b39e7e2a
	.xword	0x116544720f815fb1
	.xword	0xf7ccfd0c1f479101
	.xword	0xbcb36220efb5c94c
	.xword	0xa8ec129540744633
	.xword	0x775f06c4f3e69da8
	.xword	0x2f3b4e5f1a3fc322
	.xword	0xcf83fc17b7e164e8
	.xword	0xf80e31523e26e8e3
	.xword	0x0fc752b9bdae2c2a
	.xword	0x40ba61b95987e7a8
	.xword	0x2624070bd4a01e9f
	.xword	0x77f97abb4a5e415a
	.xword	0x7c5c5cb85e4efa9f
	.xword	0x29a4b65442201b79
	.xword	0xaf58159d93fb82f1
	.xword	0x4897396f1af9503a
	.xword	0x3d5223f504d296b9
	.xword	0x1fa8ef73ef8c8ca2
	.xword	0xba63e715309d19e5
	.xword	0xa432aad113fb0763
	.xword	0xac9bdd70fff13c39
	.xword	0x625a4ae0e679b071
	.xword	0x2164e8ee30ab0463
	.xword	0x2c709e70b7d5c1a8
	.xword	0x9a4c82fd97c2092a
	.xword	0x13eaabe07cda9ce3
	.xword	0x4ba7d00a2c341e5d
	.xword	0xf9668972e1609dbd
	.xword	0x8e881851688e6d3c
	.xword	0x5f2c7ebd54b3268f
	.xword	0x0bb25ebeaaa930c8
	.xword	0x54dbbdff0d7930b8
	.xword	0x2e21f847158d6259
	.xword	0xe23edce7b882cd19
	.xword	0x2fcaec39342c3f41
	.xword	0xa1de3c9308b0ecb6
	.xword	0xb55b58bc66dff61a
	.xword	0x278d94ad06eb07f1
	.xword	0x5d24e22fd9763587
	.xword	0xc5765fa78f9d792f
	.xword	0xce95eedba3574861
	.xword	0x4a487645f2470db4
	.xword	0x4334e5ed428fd2d6
	.xword	0x2a14e56afa0b6450
	.xword	0x2a9438bdd8b270d3
	.xword	0x86e421853242fab3
	.xword	0xbf63885261f96cca
	.xword	0x3cac9820686a1232
	.xword	0x3612ca8ea4953f25
	.xword	0x5d8b20ccd048d5bf
	.xword	0xc33958612f3165bb
	.xword	0xfee9ad6423dac6fd
	.xword	0x8f314646e06a9b41
	.xword	0x4aaaf31c77149119
	.xword	0x1bd31fd00c706f4a
	.xword	0x5c2c81e6fc5d37e8
	.xword	0xb8bd0333dfe6588b
	.xword	0x6dbf844996d6c0d0
	.xword	0x003f9ac21d10c8e0
	.xword	0x252d2736b0cfb567
	.xword	0xea52b1073fd22bba
	.xword	0x05e8651f2219dd6a
	.xword	0x7cac2c78e6843842
	.xword	0xb9337cc1fd48e7ce
	.xword	0xc698696777d2d769
	.xword	0x838f1776545fc428
	.xword	0x79cb61e07a5d9746
	.xword	0x5d89b4aef842e031
	.xword	0xca6e066a6d51490b
	.xword	0x6210d55c43680263
	.xword	0xb9f52c42bac2d619
	.xword	0x18c50e2068e31bb3
	.xword	0xa0d9495dac2eb8ec
	.xword	0x322142337aa81f4f
	.xword	0xa6eb656a9db9918e
	.xword	0x3b8e9c385643ce46
	.xword	0xd7a58e678f0c15a4
	.xword	0x63e8f4a6a6effac5
	.xword	0x7b070a677df23be0
	.xword	0xe3744b82cb7628d2
	.xword	0x555f1950434a4b6c
	.xword	0xf7e2f7b429d36f20
	.xword	0x483af17f15ccf56e
	.xword	0x260d81ba25352a3b
	.xword	0xea50abbdbd776a62
	.xword	0xee4a97f5c5152df7
	.xword	0x2ee3c5cf7607421e
	.xword	0xdc8c7ab8cca52b78
	.xword	0x44c787c969ecd6f6
	.xword	0xbedb40f6431e8dbb
	.xword	0x79d075a921d68156
	.xword	0x588309f00bc3b4f3
	.xword	0x254824268375c0a6
	.xword	0x43ee973a176b058b
	.xword	0x9f5d1b478f64b13b
	.xword	0xa40011d38f04467b
	.xword	0x4956c65c46006733
	.xword	0xf0f18dbd08b9c131
	.xword	0x75d72877a991fc7d
	.xword	0x265f3740dbb37752
	.xword	0x2ecfa2443a605948
	.xword	0x83a9cd0fd705edf9
	.xword	0x52eeb988c4efb9ac
	.xword	0x70736b4cb64608ac
	.xword	0x33308c16b82a6c5d
	.xword	0xfeaf0719d31cefc0
	.xword	0x5ae87c9257c609f5
	.xword	0x15c1595ae11d5ef2
	.xword	0xea752f3dfa9caaba
	.xword	0xf23a8c5a45351e30
	.xword	0xc6239e75d3e8ac12
	.xword	0x1c56dbd18a241be7
	.xword	0x5a579fa30f01885a
	.xword	0x9b870da000baafa4
	.xword	0xe8fae5b800c0bb03
	.xword	0x80a66ec78e4b9175
	.xword	0x5bbb6f0e7a6fdc65
	.xword	0x8895603242dfa2f7
	.xword	0xeb61771de9e1674f
	.xword	0x67f887e2ec07c201
	.xword	0x07666e257b848c63
	.xword	0x50fbb90631894336
	.xword	0x6b874ae4dae14a1a
	.xword	0x9c4e41785841d33d
	.xword	0xd85ac83222fa831d
	.xword	0x13671c73c357953e
	.xword	0xe5d9c1738c360a77
	.xword	0xbef794bfd2c083de
	.xword	0x92fe22be97d7d2ad
	.xword	0xdae19b8d27d39bbf
	.xword	0x59804fec1c4263f3
	.xword	0x4e2f83ae3fcd1816
	.xword	0x0f0aa9e756199879
	.xword	0xd4915e6cb5e798ef
	.xword	0xde8f63bf44c6d13d
	.xword	0x7479abadf961a768
	.xword	0x1a08a943999fc947
	.xword	0x9c7e5dcf7b71a1fa
	.xword	0x87c7e1c13465af9f
	.xword	0xd600231ecb6a49b6
	.xword	0x56e7026d3224787c
	.xword	0xd2d48aab1b6c2fc1
	.xword	0xfb093d933fa192b6
	.xword	0x98264c1b5af248a8
	.xword	0xf1b9a5a7251163c8
	.xword	0x8585e50977e6cc71



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
	.xword	0x0a18858c05b58e4d
	.xword	0x4e2b29ed9456108f
	.xword	0x577a04b4b7d48b23
	.xword	0x824a8d2567822ada
	.xword	0x0a88b7b3006ec504
	.xword	0x0b852782c79624f0
	.xword	0x84faf5c66d5e890e
	.xword	0xdeec22f62547bb35
	.xword	0x8da0d141bbc5ec26
	.xword	0xdec85eb36f33f903
	.xword	0xfd171d5c2a70e1af
	.xword	0xfabb6ab9447bfa61
	.xword	0x9312b783452e193b
	.xword	0x71f24883caebfe18
	.xword	0xa2e508798a9ddc27
	.xword	0x1c3dec47f68320d5
	.xword	0x0a57c48885cf566b
	.xword	0xbdc6b7fd8bbd0c49
	.xword	0x9b76062809c60281
	.xword	0xf4dfb9ffd2d7abe4
	.xword	0xb8984f6b8cb3daa5
	.xword	0xa8a1a7959d1d6803
	.xword	0xfdc85d989110449e
	.xword	0x094c58c7e4378b71
	.xword	0x1114b5e12521c782
	.xword	0xebd5fbecd9c9bf0b
	.xword	0xd1f105608776ce50
	.xword	0x44d045237cb244ac
	.xword	0x6b4b8b672d35b9ae
	.xword	0x9c4a938d287686e8
	.xword	0x3e1e71ba1a4173b9
	.xword	0x1f1a0986bdf21e6d
	.xword	0x42f2fede528c4b00
	.xword	0x4ab79da3b4b31cb7
	.xword	0x244a0a448ad0a0e8
	.xword	0xb190718f22eb7e31
	.xword	0xc257d37992099468
	.xword	0xaf985421337c0b8b
	.xword	0x5adb15ea3d78e2da
	.xword	0x5f0f2910da01f88d
	.xword	0x0dff307fe5325675
	.xword	0x117d3bbc6cf17768
	.xword	0x91ef911d44fbc4ac
	.xword	0x06b055c8e234a735
	.xword	0x688ad550c2a64e17
	.xword	0xdc362dda51d5bf87
	.xword	0xdc1033a3469d1b91
	.xword	0x57eeeabe0d29dad3
	.xword	0xc74b9f79f057cbb3
	.xword	0x2608edaa90f7e781
	.xword	0x0b8db361f7cab87f
	.xword	0x02b3906011a585e8
	.xword	0x3bf32e13f36130e6
	.xword	0x7d6c876d828eed7b
	.xword	0xd068aa531bf26290
	.xword	0xa014097c6e270b8b
	.xword	0x44079791fe4abdc5
	.xword	0xc552f6ea2ede1f57
	.xword	0xd7667dd4edc1fab7
	.xword	0xb2b1b3854ab11987
	.xword	0xf3ecffcef1da5cc8
	.xword	0xbb914c7831fd6e5b
	.xword	0x2ad29d944f1ac814
	.xword	0xb6ab119eef390edd
	.xword	0x05cfd92fa95bd9f8
	.xword	0xf237332dc37733aa
	.xword	0x4d095bf716a92b71
	.xword	0x22c2f20883fb9656
	.xword	0xf2b5d3e68f3c2cda
	.xword	0xb68076c44596ddb7
	.xword	0x1fba7f1f20533e23
	.xword	0xdcc1b2e768c84808
	.xword	0xd559ade8caf0a023
	.xword	0xafba1bac31bd00f7
	.xword	0x8c8bb70ce2ef1b42
	.xword	0x886ddb52f2e6b5d7
	.xword	0xe30bc268b0519ffb
	.xword	0xf51b480cce6ca572
	.xword	0x38444056fc1ac240
	.xword	0xb2df372bc13e8c61
	.xword	0x74d241ecb66b5b0e
	.xword	0xfcdd5cd878a48ed7
	.xword	0x5f92b556f3af8c11
	.xword	0xe35450262bd9ddbc
	.xword	0xa30329ad4eb3f55e
	.xword	0xf39887f649a1b1a6
	.xword	0xcdf2a3237dc5b005
	.xword	0x03f34242d498d2ba
	.xword	0x871d9ecc46c03cc1
	.xword	0xeb92e0bf71f034e7
	.xword	0x93880e46f0ff28a0
	.xword	0xa1aaa867846dfa13
	.xword	0xc2373f0ea0e35f7c
	.xword	0x37c3fbba22800f71
	.xword	0x7adc21ba136dd5a6
	.xword	0x8ee4334feb95ebfa
	.xword	0x475f9e941290a781
	.xword	0x2541447d5e9c8f62
	.xword	0x3ab626e5e543a859
	.xword	0xefe9db9460c551dd
	.xword	0x613ec21850bcff81
	.xword	0xa245e15f48aff08d
	.xword	0x9b37769014627dd7
	.xword	0x6884e94b1d3eeaaa
	.xword	0x3079f7689d205a39
	.xword	0xd399d1997c050705
	.xword	0x3f79a4e62625a303
	.xword	0xf01f8d9fff3de7e2
	.xword	0x943896a293a05176
	.xword	0x1c2a4c31971ef493
	.xword	0x049a28dadeef1c72
	.xword	0x0116a1bac2fa9f7f
	.xword	0x9c687811705e43ac
	.xword	0x4bf0ebbcf12dec8a
	.xword	0x51fdc61d317d2d04
	.xword	0x7b47e627133804e9
	.xword	0x3847159bb33a18d2
	.xword	0x8e5ac7d8e6367d2a
	.xword	0x13a90a91e1bb5fc1
	.xword	0x9975d5a64024ea55
	.xword	0xe352f56c74a48f8a
	.xword	0xcce283e0b2258403
	.xword	0xc1c5e4814c653711
	.xword	0xd29ebb678c710ed2
	.xword	0x1f2fefeca3b4b864
	.xword	0x594c2e84f239045b
	.xword	0x90ca990f01917377
	.xword	0xac3083b4215dd5ab
	.xword	0xf74f47d81922d350
	.xword	0x03b0deefc91d1235
	.xword	0xbeea3c67b88c5471
	.xword	0xcbbe1a1eb5ed87c5
	.xword	0x40f31ab23695bf7f
	.xword	0xaf2982ca16e8e678
	.xword	0x59f0ed3a0ab80386
	.xword	0xa90d1d44b31e3137
	.xword	0x926be5194aad6f47
	.xword	0xbca31ff86213c520
	.xword	0x3fab2238bc2bf710
	.xword	0x9b4183595ce8402d
	.xword	0x2b9d874309c4dbb9
	.xword	0xbe70c6928f5a224f
	.xword	0x19b17d63a4fd890f
	.xword	0xc2ce8f402d054f55
	.xword	0xe85f523f2a25ffb4
	.xword	0x1f0a86cca43afc6f
	.xword	0x65cbc0aa9fb12872
	.xword	0xbe5557f7aba3ba53
	.xword	0xaf9108c39154f365
	.xword	0xdf83b0bf156e53c8
	.xword	0x54c4de0381238076
	.xword	0x8c79260616ef8e1e
	.xword	0xb95c26966323c36e
	.xword	0xae778fca4bfa0daa
	.xword	0x3b0d4d0ab7b3a4b5
	.xword	0xb66df71856e420e4
	.xword	0x35baeb9fa48729c3
	.xword	0x289df4c2bad659e5
	.xword	0x1766250d24e0813d
	.xword	0x434589a0e0e47d78
	.xword	0xcda3c1743ea93b0c
	.xword	0xa2fb5e686f8604bd
	.xword	0x244f79bcf413de6a
	.xword	0xfd6a52d2d770db9d
	.xword	0xef48eed2b61d3234
	.xword	0xdf5c413b5106fdc5
	.xword	0x022a977075ca3dfa
	.xword	0x7bfe70b6f4fcf31c
	.xword	0xf551f6c75b63689e
	.xword	0x86cb566710cba6ec
	.xword	0x5720fc84d093c61a
	.xword	0xb7298149f44b4676
	.xword	0x8b5efc76e6302b0d
	.xword	0xb7cb488ae40149e7
	.xword	0x3ada9956592eda45
	.xword	0xba1c8d239b0171f5
	.xword	0x3adab28979ebee5e
	.xword	0x9c041c6b6bf2c1d9
	.xword	0x7850fcca5f66ed92
	.xword	0x99fe56aed112ac02
	.xword	0xc1ed2f6b5df2f645
	.xword	0xd752b8595e999aaa
	.xword	0x4a8efc19ff909df6
	.xword	0xcd1938e53f2402b9
	.xword	0xf1e3ed0ea4b6385d
	.xword	0x14f5b069d1d95f00
	.xword	0x91bf932a51fd4cea
	.xword	0xe8d1b1712dd7d0f8
	.xword	0x2570a80a4b2aa03c
	.xword	0xac3aa58c5daf0c2c
	.xword	0xd54c5eff8e06669c
	.xword	0x74da2607d0fcc4b0
	.xword	0xf01a420eaebde327
	.xword	0x28ff8d84834d6c31
	.xword	0xdb94c62dd293b15d
	.xword	0xf06cd088c204a991
	.xword	0x9ef2232df695e056
	.xword	0x533f80ed09cdb5fe
	.xword	0xf502057788c56470
	.xword	0x513f04117f3cde52
	.xword	0x7db3d7a125523173
	.xword	0xdeaead90d91d75f8
	.xword	0xc2a914e8eb9fbae7
	.xword	0x355ed7e853d1fbb5
	.xword	0x73cad9aba5d88f76
	.xword	0x831d78188e8d742f
	.xword	0x945c69f58e2323c5
	.xword	0xa0e00c7767379b33
	.xword	0xe42511ebe282e49f
	.xword	0x8446422ff94c06b4
	.xword	0x9c0d3a8cc76f95b8
	.xword	0xcd5c4116f1475a71
	.xword	0xdd2d7be93aa852c0
	.xword	0x2d8ef5fa2085060b
	.xword	0x459dc842d9c7868b
	.xword	0x9c183083faf23e49
	.xword	0x04b57830f9362c8d
	.xword	0xb72c6e16ca715649
	.xword	0x40b10179afe79a84
	.xword	0x8f6aaa82b570fcda
	.xword	0xd713356394d192f7
	.xword	0x270d2645e01bb68d
	.xword	0x0f6a4a317ad3420a
	.xword	0x5f7e8b4b8cd27514
	.xword	0xd45b007783316dfc
	.xword	0x5d6bdd44e05e59a6
	.xword	0x5da4cdc3f5c2bf9a
	.xword	0x194a5c6f06ad4c77
	.xword	0x5f970eac8fe9dde2
	.xword	0x8996e06069c61a01
	.xword	0x263d823c1f4ff90f
	.xword	0x36a5710aafaa414e
	.xword	0xf7ae06a199a47d48
	.xword	0x926ca2b17d000e03
	.xword	0xfe1134a5edcea890
	.xword	0xfc2f95d55b59530c
	.xword	0x5673e7718258efd7
	.xword	0xf1080ce20e2a5824
	.xword	0x62a992d28d3dfd6f
	.xword	0x82204ae4f32b6267
	.xword	0x9f17a9e94286bcc4
	.xword	0x0cb7bf753ac6946b
	.xword	0x3472c62a34f7c3f5
	.xword	0xe338a4a1f56a1535
	.xword	0x0f460ddb08d75513
	.xword	0xf6e37b922e786548
	.xword	0x39651140a5ac6c0f
	.xword	0xc1d4b00b2854c6e9
	.xword	0x1b06982575fc02ae
	.xword	0x5734a913a8d2a805
	.xword	0x15089d499928cc44
	.xword	0x35a5a345dca8bb6b
	.xword	0xf64ed49f9518a589
	.xword	0xdff8a21b57e2a83f
	.xword	0xbda7eed8bf48edb2
	.xword	0xb602f98e507017b8



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
	.xword	0x6daee570b7b732cd
	.xword	0x86ad09d162e7a284
	.xword	0x2f2d3b56da86d3bc
	.xword	0x43006d284104c5c0
	.xword	0xbb8905cf695139ff
	.xword	0x9990f7aa7a16be80
	.xword	0x7ab398fa6817c1bd
	.xword	0xdb66f0440e7ae715
	.xword	0x7ba88e0c748cefd2
	.xword	0xc8bea3782b423843
	.xword	0xa6900e3c06e6ba68
	.xword	0x5991219baca3a508
	.xword	0x7196e2fb85dabf05
	.xword	0xd753f540e488880d
	.xword	0xa5213ed6866682d2
	.xword	0x71edce8ed3f02322
	.xword	0x6879621e34908f45
	.xword	0x71710acaf87b6b44
	.xword	0x5c7b537c42e9dbb4
	.xword	0x2dd54d41ac9cdbb2
	.xword	0x8c7f26e9d8ef1912
	.xword	0xd1a8e59148017811
	.xword	0x6d5621fafffcad96
	.xword	0x5539f02498e2bf88
	.xword	0xec07fd77e5e0cad5
	.xword	0x84268635dbe1d2e9
	.xword	0x49a1c2eb3e108477
	.xword	0xcceb00f236683d9b
	.xword	0x2d3389005d70bbd5
	.xword	0x54e04735065ef63f
	.xword	0x06d152a2514b461c
	.xword	0x4d2effdc325c626a
	.xword	0xafda3618a3783531
	.xword	0xa2f155e67ea436b3
	.xword	0x70b8799c249593f3
	.xword	0x7eaba18dc5a482a2
	.xword	0x0dd6465cd81c8742
	.xword	0xdb5ebb9f262ca328
	.xword	0x7ccf286829221dd4
	.xword	0x290dacf33a1d2eb7
	.xword	0x1a54fc1eb0e9f2f6
	.xword	0x5bf169757c6efc9c
	.xword	0x422895737bc559be
	.xword	0xbca5a29931d40737
	.xword	0xfee96d80aaf67169
	.xword	0x7438a32dd39ef65c
	.xword	0x2fa24f269696c07e
	.xword	0xd7a7a71bddb96a18
	.xword	0x9d596432ee810a09
	.xword	0xca46ffcb3a56926c
	.xword	0xb8c98e20b6f348dc
	.xword	0x9312b83418900d90
	.xword	0x014de19d8dddb95a
	.xword	0x38c3b6ba4c44cb37
	.xword	0x56ac87ac5558b45a
	.xword	0xff297b2d697a2159
	.xword	0xca8271fcfe98ddc2
	.xword	0x177b53f05bfcbfd3
	.xword	0x084758461664e145
	.xword	0x0fa603ded489b727
	.xword	0xc2a93e437eda9ddf
	.xword	0x6cb1e436a3a74a85
	.xword	0x50c5bdc670055820
	.xword	0xe30a2b0c5ae671be
	.xword	0x9b3ba8c187e24a18
	.xword	0x006ac79c20e5730b
	.xword	0xa946f7a3f0f1e44a
	.xword	0xc5efec8c1692d71e
	.xword	0xa29c0d7fa25a6f3c
	.xword	0xcf5a9ceb6f905359
	.xword	0x98c46f9f22c3fd47
	.xword	0x6423572f195ac706
	.xword	0xf4d106c5b8cf58b4
	.xword	0xd068e05d8a892846
	.xword	0xae5c2d7417cedcb8
	.xword	0x48e0d5fce1347889
	.xword	0x5d198d7efb7cbe1f
	.xword	0xfcb6442f1afb4e04
	.xword	0x93bc39cbb0bfdd8d
	.xword	0x57ab07787e24edeb
	.xword	0xadab7cc3dff0195a
	.xword	0x6d0dd7b60993036c
	.xword	0x1ee21a519950b7d4
	.xword	0x653ebd4ed7e1a834
	.xword	0xaab10b19b701da87
	.xword	0x6df4bc3f055e2f46
	.xword	0xbfec240d5a5e8526
	.xword	0xb64aee06fa78ba3d
	.xword	0xe657aab832528518
	.xword	0x3e37f45f841d64ba
	.xword	0xf17f5fd012c4f9e9
	.xword	0xcacef38d3745ec5a
	.xword	0x9bfa8d3d0f01747d
	.xword	0xc3d2d470648a7009
	.xword	0x4475a47560aefa72
	.xword	0x2b12a50801d61c5e
	.xword	0xfdd657f83aedf439
	.xword	0x8466ded52a741db9
	.xword	0x7fb72dfedc138efd
	.xword	0x236f663854650eb1
	.xword	0x20878f63d8d84322
	.xword	0x30c6f2ee289932ed
	.xword	0xd9a8e905f3f74afb
	.xword	0xddbfed8ef313b40c
	.xword	0x3fa55e63d2a84452
	.xword	0xcfa006b586ba62f4
	.xword	0x21b547201a1609d9
	.xword	0x6ecec673c961894f
	.xword	0x6579c25a4a96322c
	.xword	0x7c8b949a2464349d
	.xword	0xe4e3061b37f1aa9e
	.xword	0xcad9c9fac7842e02
	.xword	0x24bed86c13bdade7
	.xword	0x6c2275b229326c1c
	.xword	0x2ff4e7868cd1b699
	.xword	0xdbcc5a9f78f36936
	.xword	0xd38df7dec5176d19
	.xword	0x32d25d0a9fdea64b
	.xword	0xc8f7a15413faaa08
	.xword	0xe65aff010dd041c6
	.xword	0x01ec445fcc7e0b32
	.xword	0x793b987544cb26f3
	.xword	0xe847ca5eea09e2a1
	.xword	0x1e5268afafca1564
	.xword	0x8b9463891b108d6b
	.xword	0xd2eec456e4443500
	.xword	0x37fbe6967295f22d
	.xword	0x6be2f576b595ac85
	.xword	0x8da479883540501e
	.xword	0xaaed97014f17e8dc
	.xword	0xb9df80d22cb47bbe
	.xword	0xa6e783faea47e06f
	.xword	0x00e8e41b555e1b5f
	.xword	0xb2314e88c1610c11
	.xword	0xde9f5e8a5d83caab
	.xword	0xf2eaf3d40968b5d3
	.xword	0xe166d3a624f92318
	.xword	0x15af8f6d3eaf1f1e
	.xword	0x9e57c8bd9f456981
	.xword	0x819c2ce812757dc6
	.xword	0x117c15cfd16294f7
	.xword	0xcbca6ed500f87f7a
	.xword	0x9fe056f6ff1e4042
	.xword	0x581e1360e9dc0d9e
	.xword	0xfa1a208410efde88
	.xword	0x574afb5f3a7c60ce
	.xword	0x63a0cd93aeb44862
	.xword	0xb3f5a18e807ea5a3
	.xword	0x170e9be49c5fc038
	.xword	0x558757607248ded0
	.xword	0xf7c816e2fad37de8
	.xword	0xa3ea5e26e8ae17c9
	.xword	0xd8c30abd50f60b50
	.xword	0x919cefbf752fe256
	.xword	0x58035af70bff1b62
	.xword	0x03a213bc1cb1c935
	.xword	0x1027dbc2878bb7b9
	.xword	0x8d83044d2eea37e9
	.xword	0xfc685500b749390b
	.xword	0x52b43f0091f40d75
	.xword	0xb29caa76ee50cd32
	.xword	0x8e4e92d935193d38
	.xword	0xd839f175fc8e5672
	.xword	0x58d904bfe28b065a
	.xword	0x1f442663ec198047
	.xword	0x18b2e124609c98f9
	.xword	0x830f1cb154e95762
	.xword	0x740127a89579a512
	.xword	0xc6216d9122a8f599
	.xword	0x4440e660bea13c3c
	.xword	0xb69b2e0a3a842bc9
	.xword	0xaeeb8eb7746c430d
	.xword	0x9d604276a5149845
	.xword	0x28beaf3e65eeeb11
	.xword	0xb328df2b57d4c715
	.xword	0x8556fcdf5535c263
	.xword	0xc2282eff21d1c633
	.xword	0xa7c0400392a05eb0
	.xword	0xe9e397bc8501b06c
	.xword	0x12040e8658bd5e42
	.xword	0x25c56f967c1532c2
	.xword	0x9109ecddb5895569
	.xword	0xe02131becf836752
	.xword	0xb16143db1c5b7f11
	.xword	0x4cf61fbf72dfc929
	.xword	0x936f2886c540610a
	.xword	0xd161c09aafc570ed
	.xword	0x8389448efc9ae63b
	.xword	0x565df183fe9a79f9
	.xword	0xae16192c2b9e2563
	.xword	0x807fc3375a658303
	.xword	0xb6a8c4cd3ddd5eea
	.xword	0x52242a7513422d5d
	.xword	0x8e1ddcb482e2f795
	.xword	0xc7f7283800265478
	.xword	0x376c72f31b777622
	.xword	0x73111d9efdc31b8c
	.xword	0x67899255c295f066
	.xword	0xc26a269d69e813a3
	.xword	0x1441515ace22d279
	.xword	0x5026a96d4d3d63cc
	.xword	0x96a80db23c977f27
	.xword	0x7c1b86994820dbe9
	.xword	0xd397a812155bb954
	.xword	0x8cb12d1e8ea225b5
	.xword	0xc5b250c701d70228
	.xword	0x4486da9e73f2930b
	.xword	0xd7c2186388676d62
	.xword	0x88a03150063c14af
	.xword	0xcfa9631556eaa06b
	.xword	0x9ea26d2f1cd32224
	.xword	0xbd9735ba441508ee
	.xword	0x577e1191f18003c1
	.xword	0xfc48cb5dcb29315d
	.xword	0xa3230294100aa214
	.xword	0xcac873a085f01a2f
	.xword	0x972283cd8444e356
	.xword	0xfe44caae1725a5ea
	.xword	0xb02b1c6d69f33fca
	.xword	0x9e31e16b51248848
	.xword	0xbf01eabd1b86903e
	.xword	0x6fffb25066ce299c
	.xword	0x396a799551951b4f
	.xword	0x86eebd3244e38596
	.xword	0xe0c86f8280b80dc7
	.xword	0xfe67647e6bbe525d
	.xword	0x3bd9f2ec779471ba
	.xword	0x867cd655c139e398
	.xword	0x22735ce8e71326df
	.xword	0x12e6a5526f095912
	.xword	0x7c7e3e74dae7f86e
	.xword	0x6b18099693242b90
	.xword	0xf6408faa429cf084
	.xword	0xb55999a715c0dea0
	.xword	0x19935a6919055d29
	.xword	0x4b181c2dd1cdb2a7
	.xword	0x192e0672f25067c7
	.xword	0xca5d265194b756b8
	.xword	0xebe8f28f15f2d56e
	.xword	0x5ff756b3ac58d3ba
	.xword	0x2cf7ebd5d6c08561
	.xword	0x6ca41f2d99c6e254
	.xword	0x2ed623b91f445507
	.xword	0xc262c0e0bcb07b7f
	.xword	0x2c49ad1917b27f43
	.xword	0xda521af8324bb004
	.xword	0x92d257b93f38f17a
	.xword	0x2fdf7787418041f8
	.xword	0x9d797d26b5e3b222
	.xword	0x153485034de768d0
	.xword	0x42ae855c3ca41a8f
	.xword	0x30dc140faf2f645b
	.xword	0x120f89f2b11c1f86
	.xword	0xb55c744722eec9ff
	.xword	0x347554a1f5925d1e
	.xword	0x2341c3a6d1dfb917



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
	.xword	0x5ed57f5ca6c05385
	.xword	0x5ca1f33bec1af0ff
	.xword	0x2ff6e22c76a09e23
	.xword	0xc9dc551df6f3e3cd
	.xword	0x245adb3b71c251a3
	.xword	0xafe32e6c794722d5
	.xword	0xb1ab7f6ff57367eb
	.xword	0xb149816c6a8b738f
	.xword	0xe1d6c4bfa9d6f8cf
	.xword	0xdbea441f558eb32b
	.xword	0x32cc89275b13de85
	.xword	0x4bf018ccd1150f47
	.xword	0xbf636be9bf62d734
	.xword	0xb7af976f358111d3
	.xword	0x147f92c8559b9a12
	.xword	0xc7c546d558dc925d
	.xword	0x2216037bfcec2465
	.xword	0x4b47a3f28b4ad437
	.xword	0x0fb57a5bbe517754
	.xword	0x1fecaf5b33558b78
	.xword	0x2c47e8570113dda7
	.xword	0x0f6467c5d8f1fb55
	.xword	0xf96e962388c492e8
	.xword	0x42dd3a008e73c595
	.xword	0x3ec06c92448dc357
	.xword	0x7f6e73fef01943fd
	.xword	0x294acbfede15604b
	.xword	0x5613b1cdf5ce775b
	.xword	0x20ba5db545de7e85
	.xword	0xfad3a8b4d8d4cfe4
	.xword	0x989fda837afc93a0
	.xword	0x7d9a495f6813c890
	.xword	0x08e7f4d47a7a787f
	.xword	0x073dc0815b4f3665
	.xword	0xcca116ceba390436
	.xword	0x456396507fd16c8c
	.xword	0xfd805ed6cd61f71b
	.xword	0xc2721a6dfa0bb2bb
	.xword	0x0525d05f9ec96008
	.xword	0x6c4311a1c38b09f4
	.xword	0xda0040d17ee91dfe
	.xword	0x77ed7762a8f8480b
	.xword	0x6f3b41036c856e8f
	.xword	0xc592c52610cbaf16
	.xword	0x0342d2e2bc82280b
	.xword	0x5d8ee8b63d285903
	.xword	0x78fc93c19e463a32
	.xword	0x4950be3f5898f441
	.xword	0x2a53dc9849de70a5
	.xword	0x2e9905585d2367b2
	.xword	0x5cbf41a3147f5c2f
	.xword	0x0c695c1d4533d95a
	.xword	0xc834d222cc2798a7
	.xword	0xe7888fef75b9437a
	.xword	0xd7d70337c931d423
	.xword	0x7af4cfc138228be1
	.xword	0x0c5acff3675d56be
	.xword	0xcb9c9f7d6b61dee3
	.xword	0x35ec74c376b8e74b
	.xword	0x3d681023cbbcaa60
	.xword	0xfaa15fbd753e4bb9
	.xword	0x03afa8dd6a3655ff
	.xword	0x01bd15746d69a6b3
	.xword	0x7ff4b91207bdb730
	.xword	0xf315a1d69563ef4b
	.xword	0xcdf666c28b346320
	.xword	0x33b13a29da4940aa
	.xword	0x1d2031081d52fcc0
	.xword	0x99355576a464df81
	.xword	0x3345eb31727c7813
	.xword	0xe8fe1f6217dbfa21
	.xword	0x9d1f694e1ad4fdf5
	.xword	0xbc4d78afa2bc42d0
	.xword	0x679f263f0cfedf6f
	.xword	0xab80b8b14a8a3381
	.xword	0x957baa910a191849
	.xword	0xc1c4baa7c5b6a146
	.xword	0xc3f6da5ef5afd825
	.xword	0x76709e051a5c9d2c
	.xword	0xf8c9917a16026498
	.xword	0x971399df882b0f23
	.xword	0x466bdbb331838cd4
	.xword	0x563af803e60ead64
	.xword	0x96f95c06d0e32431
	.xword	0x642f5223e544bc60
	.xword	0xa917fd0834a928db
	.xword	0x6468e9a8743bdfe3
	.xword	0xa5d271e1572c368b
	.xword	0x2b71b189f3b4a124
	.xword	0x70668dcb6c2fd866
	.xword	0x48345320b5801a27
	.xword	0x1e39a36ed050f4ab
	.xword	0xa08817e20099daf9
	.xword	0x8491cd63a8c34c81
	.xword	0xc076daff1d5d7f47
	.xword	0xb3f87694bdfc80d0
	.xword	0x3d44312237c9bee1
	.xword	0x791500b790cf35a5
	.xword	0xadb26c439868724f
	.xword	0xfa6dfe97dcc28904
	.xword	0x7e4f2a352cc30a5a
	.xword	0xbb0ba0dbdb971ab5
	.xword	0x6038e5c76e8f7c44
	.xword	0xf99be861f1603b35
	.xword	0x6181e2756bf0eb46
	.xword	0x0a7cf229c36eca34
	.xword	0x8daf5224e507e2bf
	.xword	0x05df45953ea3e72f
	.xword	0xaee7a9e52681b7da
	.xword	0xd25655d133920398
	.xword	0xf39a2fd3bf1c774e
	.xword	0x86ba6a20e9d434f1
	.xword	0x22951ba2d0f9dfef
	.xword	0xe8114d0c62553f3e
	.xword	0xf0c657b4efe381b5
	.xword	0x207a87ac83d5ef70
	.xword	0xbe294acd0835ca90
	.xword	0x18ea426c569bfd7d
	.xword	0xef5e3929218466e7
	.xword	0x2607f4c606dc304c
	.xword	0x64fd065246e98104
	.xword	0x2f86d5b0b57aa74e
	.xword	0x51d8215d218c5c89
	.xword	0x22352fc287d78785
	.xword	0xe22ae2ab77f98a6f
	.xword	0x6542b937956676e2
	.xword	0xd97c882d509ea1c4
	.xword	0x7df491760ecd834e
	.xword	0x720f53b8f8978a05
	.xword	0x78904216fb72249a
	.xword	0xf3a770184f798070
	.xword	0xfdbd0c66b1307cdc
	.xword	0xc2e3245685e37ca6
	.xword	0x26f1c492ab2b5c45
	.xword	0xffd46c9b65cc57f5
	.xword	0x6213f19207836fc8
	.xword	0x9bed1819407f8f56
	.xword	0x13594639d65aa22e
	.xword	0x9ec16cf4c1eeac82
	.xword	0xe69b1d68bcfc01ff
	.xword	0xe4ea9511840df185
	.xword	0x724309c3b437782e
	.xword	0x3cb3b7d9c1dca329
	.xword	0x45deccf430023e97
	.xword	0x9fca5f6c34aff0a1
	.xword	0x01cf669abb76ce74
	.xword	0x50e750a606b217aa
	.xword	0xd231b57558123cae
	.xword	0x0c312ee63e6bae4e
	.xword	0xe8f232dcf1938fac
	.xword	0x08f33a168015c1d1
	.xword	0xc55ebb8d378a2a8e
	.xword	0x334aa2bff115803a
	.xword	0xa16e96a149466172
	.xword	0x9ea53aa0ee369a67
	.xword	0x83e5a9725b6a87bc
	.xword	0x3f2ec33961e11721
	.xword	0xcd7787a7aef3720b
	.xword	0x0a2d8bfd970ced4d
	.xword	0x1b0a983d0bf6ffac
	.xword	0x311b62418e134288
	.xword	0x719716894037a67d
	.xword	0xc6da6f365bd1528e
	.xword	0x42fb4f5b084fb729
	.xword	0x4e3195a824ad6393
	.xword	0xd700f43b515dfe59
	.xword	0xd8cf37d73df57d11
	.xword	0x664d8f3347895dc9
	.xword	0x868183bdc1e92337
	.xword	0x62571bcd1c1fd39e
	.xword	0x50d6ddfe84a040fd
	.xword	0x302cca2fe9d087e2
	.xword	0xbca86263e0ce8f7c
	.xword	0x74f4536e1823c9db
	.xword	0xe861ece20664c940
	.xword	0xd12587450187bde2
	.xword	0xf301e23666ff285d
	.xword	0x9e95e9a42e36d6ee
	.xword	0x26226dfefb2d3883
	.xword	0x23e97d7c46e9cd22
	.xword	0x501194c048fef86e
	.xword	0x7125fe865557fb15
	.xword	0x7488b52f2b022001
	.xword	0x54911faf7d361f58
	.xword	0x4ca3bd2fee6906bb
	.xword	0x63c3e7ba1063cdb5
	.xword	0x0581fb6235f2237f
	.xword	0x327020b95657b604
	.xword	0xfff427a8339a51ae
	.xword	0x8de1dc99009d9476
	.xword	0x627da571ac7a81d3
	.xword	0x851ccf35f46d6d9a
	.xword	0x333a5c8ca37832ed
	.xword	0x67fb31e2e7458d9b
	.xword	0x50468034bf04a86d
	.xword	0x26f3264fc434306a
	.xword	0x57188b45d221c1f3
	.xword	0x7bb8d18392aab9a6
	.xword	0xd21412b5265a1d52
	.xword	0x950b72a52ca2aa80
	.xword	0x5e6b9f488ceaa2b0
	.xword	0x67b9d03847c9ea95
	.xword	0xfc67462361616a54
	.xword	0xb9be58f9834a28c2
	.xword	0xb8268ae00f0106e9
	.xword	0x36daf99fe06dc128
	.xword	0x59b72c787487b15f
	.xword	0x16d49703a15acb2f
	.xword	0x2d063819f7fa0e89
	.xword	0x11ce126f9cd9e84f
	.xword	0xad14249195ba8707
	.xword	0x890ea68252253c84
	.xword	0x64c721f74892bee2
	.xword	0xf4a00e7059ad464f
	.xword	0x0642c7537944853d
	.xword	0x325337aa9f3b9abb
	.xword	0x7b348cca1b5754f0
	.xword	0xb0277ce800d5b67a
	.xword	0x6bfa323e8470c6d1
	.xword	0xdacaf0544f078548
	.xword	0xa387a2067cbb7de2
	.xword	0x8e8c463250e65472
	.xword	0x02202a4e07950581
	.xword	0x86f65059ea32fa34
	.xword	0x62df3577392d8bdd
	.xword	0x9af1884c4f112a1a
	.xword	0x588b775faf838e8e
	.xword	0x4be1de182e92f431
	.xword	0x96666abbc594c48e
	.xword	0x1c2d4a1e5fda9058
	.xword	0x579a861b9b21763f
	.xword	0xd836201c02200720
	.xword	0x9ed3c00e0d4f1e17
	.xword	0xeab8896707356f47
	.xword	0x7cb37636bfa81bec
	.xword	0x9c1d23ff7b882f26
	.xword	0xd770941cf05f61f8
	.xword	0x70e906c255115b76
	.xword	0x531ccb2c93884e9a
	.xword	0x868795e9302f9786
	.xword	0xcdc54e28c5ae38f4
	.xword	0x5e104d16ee6aa525
	.xword	0x5adc77ea0ec63f95
	.xword	0xe05c70abf35f9518
	.xword	0x8e6a353e71228e05
	.xword	0x601834b49e989c14
	.xword	0xed791bd757027dba
	.xword	0x1134ada2d63da329
	.xword	0xc09dbd9ab8bb93a9
	.xword	0x5e51a366e836e354
	.xword	0x7d5cade04b277fec
	.xword	0x22cebb254d4458ff
	.xword	0xb81d3be160f8210f
	.xword	0x858f8d462ff2cc55
	.xword	0x8485fc5a6235447e
	.xword	0x82dae9f292b9ed92



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
	.xword	0x5ecac8f185eebb65
	.xword	0xb06eaa3ae64aa6da
	.xword	0x06a739fde0645bdc
	.xword	0x060e04fd4182ead4
	.xword	0x33efe7d1c77fb82b
	.xword	0xdadaf53ba55c0aa0
	.xword	0x4acfc43fe91fc3dc
	.xword	0xe59e7e67c22f11f4
	.xword	0xfa3c23f0fc8bc2ab
	.xword	0x8a9290ec95df170c
	.xword	0xf1edc13a2ee178bd
	.xword	0x5cfd4df97b868119
	.xword	0xe6800a7b07cbdbde
	.xword	0x179f5ec250320683
	.xword	0x4adf21d05be7720c
	.xword	0x763a162085dda049
	.xword	0x94745243df42d9d1
	.xword	0x0fc46b71a90a4062
	.xword	0xeb0de5ca16df3093
	.xword	0x92feed75338423aa
	.xword	0x08380777bc66bbf8
	.xword	0xb346618dd2d20b2f
	.xword	0xf1cdc18c826047a5
	.xword	0xb19cfb8909a841c7
	.xword	0xd82319dd76f3be89
	.xword	0x1fceae23feb90984
	.xword	0x29f3300ac266433f
	.xword	0xf3f1c6ded44ebff7
	.xword	0x49ed1d9810bd23cc
	.xword	0x1478f9a7b4ef4f5c
	.xword	0x87c7f6a7751124dd
	.xword	0xd98b18bbf3a1f263
	.xword	0x5a7d3d75d825b0cf
	.xword	0x652f0d013789e9d0
	.xword	0x6a4ba9aee12034e0
	.xword	0xfd095ec40b16c3bf
	.xword	0x1fc00ee38825e664
	.xword	0x5bf9732927d067b4
	.xword	0x95f52144da8d1ff0
	.xword	0x2363c505afb55e4a
	.xword	0xc84690bb40975944
	.xword	0x2cfc781fa5f5cba8
	.xword	0x24906c400537fdb1
	.xword	0x4f610632eb181099
	.xword	0x055a45e42e57cb2a
	.xword	0x8c0301a205456215
	.xword	0x51f818c7a96b384b
	.xword	0x68d2ab1973f5a71c
	.xword	0xce99ec1f6efc350c
	.xword	0x2f4d0ae26ae7b60d
	.xword	0xa921082254fa239b
	.xword	0x4b5eb7ee566a8799
	.xword	0xc441f5c09ed7c29f
	.xword	0x66d1b826aa6cce00
	.xword	0x9fa3d21478e213fd
	.xword	0xdf9b0c60119d854e
	.xword	0xa2d6f24e8e1d8df6
	.xword	0xd8e6a24bd5c173af
	.xword	0x4f4a6cb991ccf135
	.xword	0x23c4444e1c4bffec
	.xword	0x01029bb00c36af13
	.xword	0x0823604da58a8579
	.xword	0xf70ffac1da53c2d0
	.xword	0x007bba3b1e3bd2c8
	.xword	0xb5e3f62757c5acff
	.xword	0x9ac68b0277df6310
	.xword	0x00b8f0d4b9839c26
	.xword	0xdbd935eac53db7a4
	.xword	0x85074ddb95a438ec
	.xword	0xed54c585af42064f
	.xword	0x518ad7049238c5f8
	.xword	0xe77a75901be7839c
	.xword	0x441808ad4dd956f6
	.xword	0x1eee6e4e6271388d
	.xword	0x7445cbb102ebf1d6
	.xword	0xf1b7e4d3449eba62
	.xword	0xeef330f84d5082bf
	.xword	0x420b0d4544b24166
	.xword	0x0441d66748f333f8
	.xword	0x72167872163ef8e1
	.xword	0x23f3525bafaf45bc
	.xword	0x6b5f4bc4143494c3
	.xword	0x8ff268093eb26ae3
	.xword	0x3ef38561330b0693
	.xword	0x8723540bc4761917
	.xword	0xb563a1712375a1f0
	.xword	0x679c65049ec8f6bc
	.xword	0xbf12f6ecc2afd4be
	.xword	0xe04b15644bb78e12
	.xword	0xfb231b44a7e7c4b7
	.xword	0xe64ef7ce6d27644a
	.xword	0x495919f8392f3138
	.xword	0x2591c4f6fad9045b
	.xword	0x2fc8c8f9f703c6d8
	.xword	0xe4742e9e13937576
	.xword	0x51671bd8dddd3f19
	.xword	0x671a6772e3fb2f0b
	.xword	0xc62a36902f6dee2d
	.xword	0x1a17641ca3f907de
	.xword	0x09f9fdae7dec2327
	.xword	0x2d7c7ca3072963da
	.xword	0xf596a83ce95c3b7f
	.xword	0xdc63d286bed7b09a
	.xword	0x70d9b2ff3a9c276e
	.xword	0x41f89ef6da9d1210
	.xword	0xf8083d1ff97324d3
	.xword	0xc26a8609b931b908
	.xword	0xf3a2e2ca5788e2e5
	.xword	0xe24c6d6c1ac77c24
	.xword	0x50d20ecb5d6f7a76
	.xword	0x7bbafb2018bb0a01
	.xword	0x6e1b98f86d7a3663
	.xword	0x8a79a197b4c62096
	.xword	0x273c2f5a3f6bcd95
	.xword	0x672eaa4c68ce53d7
	.xword	0xe80b3df4bb04a839
	.xword	0x624696210af6b945
	.xword	0x6a421286429c0bb6
	.xword	0x954fd7fa584b9147
	.xword	0xfb8429fa4826a475
	.xword	0xa2dec792a5e78ac4
	.xword	0xf8ad6545619f2755
	.xword	0x096d5d14bf1d3506
	.xword	0x34dc233390a8f940
	.xword	0x94fd803a5a97ed0f
	.xword	0xaf2bfb140ee1f823
	.xword	0x54e9ee510c386cf9
	.xword	0x8c671258dabad0af
	.xword	0x789e70d499713b0d
	.xword	0x77c0763e6753ad5e
	.xword	0x25270c241c2e97bf
	.xword	0x864102fd666aa1fe
	.xword	0xa60576670c618b4c
	.xword	0xd41e7ddfcac46b36
	.xword	0xe8bdaeac2b631111
	.xword	0x290af5397dabc5ea
	.xword	0x806095f47659f139
	.xword	0xc83e3f6dbd98cafd
	.xword	0x45c5680138a02629
	.xword	0xe6cd9ec5e996e450
	.xword	0x60fcae2bd3ccc7d3
	.xword	0x06ae68af8b4bbfd6
	.xword	0xc5ba78d8ea516869
	.xword	0x146b197f8260669e
	.xword	0x8b216366acba1677
	.xword	0x9379af07ad5ff9ab
	.xword	0x6bf6e90905f9c89d
	.xword	0x5c1c39f4a69ecd67
	.xword	0x7370dc729e6ad842
	.xword	0x931a4d4553165e41
	.xword	0x738c24c04eef9dcf
	.xword	0xc3bfc1b5e2041912
	.xword	0x10a404a657099f7d
	.xword	0x7ea23ba18a1ee43a
	.xword	0xf17cbe9a23a5e39e
	.xword	0x9693d72ff686b77d
	.xword	0x3dd78180743919d1
	.xword	0x124d189e161d6781
	.xword	0x3f433af0a82779b2
	.xword	0xa686ed544bdc9d9b
	.xword	0x1eba069cdf8ac351
	.xword	0x8601afe3895928c5
	.xword	0x0b65c1cb9c48b91a
	.xword	0x1b7bead5c66dd433
	.xword	0x9a8b5573e61419de
	.xword	0xff56a1f41013aaab
	.xword	0xa88c505ed54dff04
	.xword	0x8cdb2127eabfaff1
	.xword	0x0ddefe80d4c48814
	.xword	0x1e4d250e757ef6f2
	.xword	0x997f936a49823c44
	.xword	0xd3b47c4ef19a64d8
	.xword	0xff9249c6912bed43
	.xword	0xdc20276160486578
	.xword	0x7cc68b2ff4008a63
	.xword	0xabe2519f9854fb41
	.xword	0xac37ddb83ee3b8cc
	.xword	0xaae76870a6e5b453
	.xword	0x8ceb8e178e14b7c5
	.xword	0x3f1544a42dad2c1b
	.xword	0x26ac664846af37d5
	.xword	0x7c575ea213c2e823
	.xword	0xcf2da572bed5559a
	.xword	0x2942f1e92de90186
	.xword	0x888805770d8a1600
	.xword	0x06abb1ae4cd6ca9c
	.xword	0x444d92b81b1ed749
	.xword	0x43072f0e77a8c8af
	.xword	0x58df5810c51a4386
	.xword	0xc71bb322eeaaa338
	.xword	0x4a1c1498cb33ae38
	.xword	0x67aea34bf8f884f6
	.xword	0xec3d00204e1b9365
	.xword	0x662ff357327f01dc
	.xword	0x3d01a1d2e0b5dfa0
	.xword	0x58c2ef0e56dc8570
	.xword	0x75d183dcbbdac43c
	.xword	0x03c95317c8fd8b35
	.xword	0x79a548d8e0a25a8d
	.xword	0x41f1638f9f546c24
	.xword	0x440054099efe7f69
	.xword	0x13c2aab4ae58d5fd
	.xword	0x14ca007a419bb455
	.xword	0xbb170aa829996915
	.xword	0xa69ce78c6c6aa7f8
	.xword	0x02b5a9a392d8a241
	.xword	0x2d648a02d5a252f1
	.xword	0x9e7217b89df292ea
	.xword	0x8a593e1f2178a46c
	.xword	0x6566fd0ba8efc77e
	.xword	0xf3accf8951d0da07
	.xword	0x65c975bdb9360590
	.xword	0x555b01310dce0eb8
	.xword	0xb49f928a7e1e77b0
	.xword	0x95cf743479ef5216
	.xword	0xda73c4201f62fc8d
	.xword	0x3ad76cf000d06842
	.xword	0x61b24e57ee3e36df
	.xword	0x90a9f0b7f549ee6f
	.xword	0xf4ab141484b66f23
	.xword	0xf07dc74b5536c772
	.xword	0x73e80740526ad8fb
	.xword	0x6727d8df9398537f
	.xword	0x4b739a4ecad56fb5
	.xword	0x0ea0a2e1a9e0add7
	.xword	0x12b9825af00d7311
	.xword	0x588c6384ec38ebba
	.xword	0x0057dc5b66d2487b
	.xword	0xb32dc577449d897b
	.xword	0xbf1c189109a14195
	.xword	0xa5729ad5de64b8e6
	.xword	0xfa5796348d57a2f4
	.xword	0xdc700495181a6c26
	.xword	0x78994370626d50d5
	.xword	0x47809899ee7b654e
	.xword	0x8d3f5a774d1ced1a
	.xword	0x56ab195a36b1b5ec
	.xword	0xf00728bbf3a9e55b
	.xword	0x682604a045a6db83
	.xword	0x5be8f2be4617203d
	.xword	0xf9e393333abf7061
	.xword	0xb4239a06be72119c
	.xword	0xe32d011058dbe9ef
	.xword	0xd8176c2fee08af79
	.xword	0x41a28662279a25f5
	.xword	0x0e8009d499fb401f
	.xword	0xc4b9f209fe9e6354
	.xword	0x0351b6996be73d7a
	.xword	0x80c65134e945e141
	.xword	0x8feb3e30827eee91
	.xword	0x748e36db306a459d
	.xword	0x4a71581fbbdf465d
	.xword	0x4c872a841c28bb3a
	.xword	0x8a2b6f0446531e0e
	.xword	0xad78b0973c0c88f9
	.xword	0x417f0206acb7c759



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
	.xword	0x8c09f31de6da4661
	.xword	0xadd5978e1b8ad4b7
	.xword	0xc9e9827547119d3a
	.xword	0xa8660676f4dccedc
	.xword	0x35525c4f1fd3f7e3
	.xword	0x09aac7d1c8fa306a
	.xword	0x5b2a9462d168847b
	.xword	0xe0d1df7fe896d8b2
	.xword	0x9ef684547bd53171
	.xword	0x9acf522222ca755f
	.xword	0xddfbc8b539884ee9
	.xword	0x686625984435f434
	.xword	0x08f1a4b04a09a294
	.xword	0x532d1fd02a069e57
	.xword	0x98a92ffe7fd0193f
	.xword	0xcaa83073980f16bb
	.xword	0xe911d5c4f259975f
	.xword	0x8dfcfe221032cc56
	.xword	0x655eaa79c4493305
	.xword	0xf38d5f4c4bfe2dcb
	.xword	0x5b0188a864af90c6
	.xword	0x659082bfe5a1968e
	.xword	0xf3b3b43948d58756
	.xword	0x4c5f8fcb8beb1b14
	.xword	0x8519c2efcfd8d303
	.xword	0x0b7999f87a7114f1
	.xword	0x586f969c46f2141f
	.xword	0xecda3aad042b5824
	.xword	0x6d3f40719864f1b4
	.xword	0x3afa2b71ee18d36a
	.xword	0xd4aa071d5c2d61db
	.xword	0x105f7ae4fee394d9
	.xword	0x7ef01664709cd35b
	.xword	0x65297a580b2e9100
	.xword	0x5667b2557d5d9e8f
	.xword	0x9489b315b1cfe62a
	.xword	0x9494d8d39833ace8
	.xword	0xe2e45d69e59eba35
	.xword	0x1f2af54c56250239
	.xword	0xed7bc474343fee1a
	.xword	0x81d51924615e1f03
	.xword	0x11d78fc14c18754c
	.xword	0x1c8bc591b94fc2e4
	.xword	0xd251f6feac7988e9
	.xword	0xd6e01d1838b42353
	.xword	0x394157fad4ac7b65
	.xword	0x27c9cbab4fd869e1
	.xword	0x6e59677543ff12b2
	.xword	0x1b4238bc7e91aab1
	.xword	0x47d6a94056bd843b
	.xword	0xb7f9b8bdcc4072c4
	.xword	0x73b63754636ba36f
	.xword	0xe76c1e930dcc69e1
	.xword	0xbdd76e3026948d50
	.xword	0x49d3bc36316493a4
	.xword	0x7a1ee9d62c0b2bd1
	.xword	0xa85a3e6b47cc9f9f
	.xword	0x062d6f1208c99cae
	.xword	0xf22b6785e7b332b1
	.xword	0xcaca2afbf9f9e00a
	.xword	0x7052ca1538681208
	.xword	0x86119c50982e9c2d
	.xword	0xc0daaffce7872885
	.xword	0x2ab9def35ce8c6ca
	.xword	0x728404d28e7cb52a
	.xword	0x27307a37ae2b0999
	.xword	0x11062ea8b0db0b5e
	.xword	0x0d6d7fedc5743ef8
	.xword	0x38109839b8c8e2a0
	.xword	0x60bb4193965e23b2
	.xword	0x66d571e4ec447e13
	.xword	0x657460a398c8e445
	.xword	0x7156e3f4f72aafc4
	.xword	0xbdd65efd62a986c7
	.xword	0xe0ec1d7152ad6cc8
	.xword	0x9e6645b3f9ba257b
	.xword	0x5d5063328b10022f
	.xword	0x9b14d896a3af88f3
	.xword	0x132dba4ff0ec7721
	.xword	0x77bbea8437d52e85
	.xword	0x706ef58ae783727c
	.xword	0xf2c78b5fdb877117
	.xword	0x8e42e89864f3815d
	.xword	0x954bd5b98fdd773c
	.xword	0x7978b4d4c7de6ce5
	.xword	0xe4d63ad7a6d5dfe8
	.xword	0xaeda5b0c05cc28ac
	.xword	0xe8f14e0b2c253238
	.xword	0x4481f816fe3926bf
	.xword	0x71687bbbecb822f5
	.xword	0xce7cedc6d8e1b714
	.xword	0xbfb64b60e8ba67e8
	.xword	0x2b04faab950f5fef
	.xword	0x7e70f56f06faefff
	.xword	0x026ae456c7d434d1
	.xword	0x05ee8b6becd02f11
	.xword	0x1818a86e3a0f4cac
	.xword	0xedc4d4051259a934
	.xword	0x7be2c8504f960a2d
	.xword	0x27a82a9ede47d01c
	.xword	0x76a7e3ade65ce35d
	.xword	0x25c8da5688683ea1
	.xword	0x44615d35c9179409
	.xword	0x5d85d0c6071e5794
	.xword	0x6abc74c22df8f7a1
	.xword	0x873b4f288f8eb579
	.xword	0xc4065c94a1169429
	.xword	0x78446fb4799a6118
	.xword	0x93d4e29541a7d2e7
	.xword	0xa594e868fbb93083
	.xword	0x29c44549895deb29
	.xword	0x3db79f04e962a37f
	.xword	0x2e7aaca3faa43c15
	.xword	0x9de746ecc1524888
	.xword	0x2bcd2942efde5f6c
	.xword	0x0efb2acdd84a6007
	.xword	0x4615bd4053200048
	.xword	0x63efe5d69287fffb
	.xword	0xa0dcf217a11279a4
	.xword	0xeb117ed8394a630d
	.xword	0x6e0071029ebd105b
	.xword	0x9d0614de0347f06d
	.xword	0x025cbb762eeb40d1
	.xword	0x1304f0377493003d
	.xword	0xe5be72d87630051e
	.xword	0x89e8b00cdff25e6a
	.xword	0x9054ecfabc4cb051
	.xword	0x5934635cd4a36d2c
	.xword	0x4771adf73674a4dc
	.xword	0x4cb3999a2c0cbc2b
	.xword	0x9d5d66b6a256ef5d
	.xword	0xf27c194da53497e1
	.xword	0xba8bbb122966af97
	.xword	0xef13189f06dec80d
	.xword	0xb6b1fbb302cbc4c9
	.xword	0x80558f5178792534
	.xword	0xc64ccf3e7fc7d155
	.xword	0x48c781d955dd949a
	.xword	0x1ed741e8511c74e0
	.xword	0xd47042151dd75e31
	.xword	0xa9e8a927fb22beb3
	.xword	0x8d643e6265f04cf8
	.xword	0xc69c8f21f68e097a
	.xword	0xe3459a85a3f152fb
	.xword	0x96f22c005b455616
	.xword	0xe8cb3e3081632b44
	.xword	0xc025226aa3c253be
	.xword	0x9a12755b031032b1
	.xword	0x7e57f4a1ad78f8f7
	.xword	0x36c5d463c998dde5
	.xword	0x1bd9255e6efbae2c
	.xword	0xae6f0754350ff592
	.xword	0x7cfe3b5db24c273b
	.xword	0x5f83d2e6d8a961c1
	.xword	0xe944c53902a99f57
	.xword	0xed60fe3b144a61a0
	.xword	0x109ade9dfefe72cc
	.xword	0x70e9a8663cc18073
	.xword	0xa962d23dd395fd63
	.xword	0x6a062ccbf124f8af
	.xword	0xcd03037516c1c13f
	.xword	0x4791ff17267bc325
	.xword	0xb2c44ecdeb55be22
	.xword	0x467fc2734e8a7eef
	.xword	0x3eaf41c7c6721387
	.xword	0x8939422f7394f66f
	.xword	0x851183b75368051d
	.xword	0x2b9b1a31187ddd8d
	.xword	0x2dff1321b326dbf4
	.xword	0x128be98fc08dea71
	.xword	0xd0be8105307d0512
	.xword	0xa609f68ce5e10e3c
	.xword	0x2e586b5c9f254950
	.xword	0xae677594bb032f96
	.xword	0x8684c1c5417c76f4
	.xword	0x508e9f4d0af421e5
	.xword	0x229edf13929b5589
	.xword	0x6b40eb98d94a5c1e
	.xword	0x6b41c4a2b52987cd
	.xword	0x2c42eed19044e2ee
	.xword	0x110f951a7e619171
	.xword	0x2f48ba83d115bfde
	.xword	0x79f7f97796756699
	.xword	0x6bdecf7ba2348bb8
	.xword	0x58b512ae88982100
	.xword	0x9c4bd6093267aff6
	.xword	0xa1962934299cd9bb
	.xword	0x5e2c42f02eb456ec
	.xword	0x253283c73a4143d8
	.xword	0x94623fa99e584f48
	.xword	0xa9caf7258bb0bf0e
	.xword	0x56d69e0a21888581
	.xword	0x0636b8ee2422efd6
	.xword	0x36c05c84be01cf28
	.xword	0xc955b4dce95d17f5
	.xword	0xa09d82ba6695fab2
	.xword	0xfa42ad6f78b64482
	.xword	0x3977a42969bffeab
	.xword	0x59863bb995e31d0e
	.xword	0x719f35713f84e410
	.xword	0x9c81d3bd6a69af32
	.xword	0x562a31d88ffa164c
	.xword	0x26ecaf5a250018da
	.xword	0xb5ee66668de6cc1f
	.xword	0x958b546f6c21320d
	.xword	0xa74192cdfa8cf989
	.xword	0x2bb654b29d75249f
	.xword	0x6db2684a9c44469e
	.xword	0x2146df365bdc6e6e
	.xword	0xc1ebb59d7e560b0e
	.xword	0x555d27304eb54529
	.xword	0xadaae7def92e776b
	.xword	0xc4e4bd1753479755
	.xword	0xdcf3da761d278eca
	.xword	0x70ce26e286b3d90e
	.xword	0x036acae5069d6acd
	.xword	0x8c527c4d07875ebb
	.xword	0x6fee9cabc5dcf081
	.xword	0xaf38ba1c1892b02f
	.xword	0x8a059494901a2c2d
	.xword	0x070d6fd18b91e8ed
	.xword	0x030de3299f16c39f
	.xword	0xaa1ff71dbb34d7a0
	.xword	0xc9266fcbe8041fd9
	.xword	0xaa5cede264aed1f4
	.xword	0xacb41a6c232cdb69
	.xword	0x3290f921490f12ce
	.xword	0x6a078555815a497b
	.xword	0x6992fef74553340f
	.xword	0xe41b5da68ede2ea2
	.xword	0x7f7d12fe59400540
	.xword	0x5e0784240a942ce5
	.xword	0x5a970a29fa1adfeb
	.xword	0xa9934f6375b9f786
	.xword	0x1b0250ca9de2c746
	.xword	0xe937388d9a985a63
	.xword	0xc1ea246b02a14a43
	.xword	0xf2e5d282b78377bb
	.xword	0x94aef7200cf0f6ad
	.xword	0x39b98dcbffc764ed
	.xword	0xe68005f89b045ab6
	.xword	0xfbd48616cd791702
	.xword	0x107acc0542133a60
	.xword	0x4b0548e1ccea1b35
	.xword	0xaec6bfa8ebd2324d
	.xword	0xdcf54350e4e2b5f5
	.xword	0x0d781880051c201f
	.xword	0xf298edcf507ed8f7
	.xword	0xe774b4882585f67b
	.xword	0xea40d7c1e16f3257
	.xword	0x661b3a710acffe9a
	.xword	0xc50a5cdad199bca2
	.xword	0x3c7e5763dc84d968
	.xword	0x908181cb403ef646
	.xword	0x8be58392c357a1cc
	.xword	0xe84de9fed02a9115



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
	.xword	0xf5159874de63a9bb
	.xword	0x48cccf1989b4a0d6
	.xword	0xde3b2040eb2892a8
	.xword	0x1ba92bc3c8aa63be
	.xword	0x176a8780a34ef624
	.xword	0xbad7b385f49f5122
	.xword	0x912f34fa714f1ea0
	.xword	0xcc5ddb13c41004c3
	.xword	0xddfc908661484c20
	.xword	0x22e84505017542c0
	.xword	0x04dee188c4c36fd6
	.xword	0x84c04239bec2c267
	.xword	0xa1eb3026ea8ed2e5
	.xword	0x30f0d479af947134
	.xword	0xba21feb2685788c5
	.xword	0x928adf3413df0cb5
	.xword	0x0cb1459ca73677f5
	.xword	0xa6579552bdd3c7f3
	.xword	0x32bc053a5319ccc2
	.xword	0xdd2c8003412e0ff6
	.xword	0xc0501fd29526c91b
	.xword	0x0f413ac782028c75
	.xword	0x120a64a764c0cae3
	.xword	0x3739ee122c19c453
	.xword	0x726fa9f619d29301
	.xword	0x1cd7cd11a7e841bc
	.xword	0x23c83dc73096603b
	.xword	0xcc4e34662e31e4cf
	.xword	0xf10d52606fca583f
	.xword	0xb69d31dc4025aa29
	.xword	0x722675ebeb3733f8
	.xword	0x78ff4b7d61d78211
	.xword	0xd5b3bf1d397fc261
	.xword	0x437bb8ffdaf1a90f
	.xword	0x443942884d65c751
	.xword	0x928cd731969485a3
	.xword	0xd81776e23b82f235
	.xword	0xfb8ad9e9df216d20
	.xword	0xa06c6871f556f8e5
	.xword	0x7bf51c6d4e026b3f
	.xword	0xdab6fc90c7e46c7c
	.xword	0xbdd325130c5016f0
	.xword	0x3915f3909fc477e2
	.xword	0xc4e6e1133c211b6a
	.xword	0x81a7057496163445
	.xword	0x904bac93eb13b01d
	.xword	0x804fd4ef76fa3c1c
	.xword	0x60f3fcbab2b80efd
	.xword	0xe4f100f29ea7b72c
	.xword	0x3859c8b842a130ea
	.xword	0x311bba3e66ae1ae3
	.xword	0x368b0a8f88ba5d46
	.xword	0x893eeaf3f94c7c8e
	.xword	0x163e61ac3752d67b
	.xword	0xc94653653b0a19c1
	.xword	0x73586f164e48b625
	.xword	0x86b251ad36b7edbb
	.xword	0xcda0483593f02a89
	.xword	0xea719e1f0bd9273c
	.xword	0xa6cfac3ecf466842
	.xword	0xe2733701c94c5009
	.xword	0x6cf37a3f12b4cc27
	.xword	0x3467f8c8d035babe
	.xword	0x5a92d4d3589e8a87
	.xword	0x85d8dc027fd9b2d2
	.xword	0x2f3f8383780cb787
	.xword	0xf81dd6bd6af68284
	.xword	0x8686e88d70e22419
	.xword	0xbef196806945eed9
	.xword	0xc8cc0859197779cc
	.xword	0xa5ad20ac25372cfd
	.xword	0xb8ebd36b8dd5facb
	.xword	0x17fae75470feeb18
	.xword	0x20d45bc09aa463f4
	.xword	0xf764cbf5134e3836
	.xword	0xd819469daac6ca76
	.xword	0x18427e9e177c4aff
	.xword	0xcf76c7b7439d8dea
	.xword	0x4de4f804e06ca469
	.xword	0x46fe561c0b638b3f
	.xword	0x4896dcdfdefaf320
	.xword	0x2c8394719d4f5bd2
	.xword	0xf717967659555213
	.xword	0x213742e92d6bfb25
	.xword	0x531c1f52b11fadaf
	.xword	0xbd40ef4a9fdb000d
	.xword	0xa3cd35a63e69beab
	.xword	0x4c0dcec1c42c2d52
	.xword	0x74c9ab816026eb84
	.xword	0x2232d96e1f9c4ca8
	.xword	0x289049f6ed28bcac
	.xword	0x6e8b82e031834cda
	.xword	0xba4f084e899c8f6f
	.xword	0x79cf05922b54c473
	.xword	0xcfa4f6871d88e238
	.xword	0x3808ff1186c5b6cc
	.xword	0x14503ab8e535d016
	.xword	0x5c4d2afbea6d0c79
	.xword	0x2a68e8effe9ef527
	.xword	0x7dfbd3576d748cc2
	.xword	0x7f1f983d791c46fd
	.xword	0x3293b58f5b9fcd55
	.xword	0x78d43525b8d66cf4
	.xword	0x558fbda6ab4edc15
	.xword	0xc087482b8045f78e
	.xword	0x496fa952e367cbee
	.xword	0xe9046138d7ff6ef2
	.xword	0xe5760a1b65d46b9d
	.xword	0x28aa33ea2b123c48
	.xword	0x8a456f96451d029f
	.xword	0xd7e98deaa22030ea
	.xword	0x2247964c55d8ec03
	.xword	0xdb7a7cc0a11582fb
	.xword	0x9c29ec412572083b
	.xword	0xeae5e80a90f38cfa
	.xword	0x657d4e67a654f5c1
	.xword	0xc50926b0f6ac8b20
	.xword	0x14e2cfcf441eb12d
	.xword	0xe2a8c5e21cf61c5d
	.xword	0x60e968cbbbaf7d1f
	.xword	0xcf8efb091c14104b
	.xword	0x9ae9b4f7d3540b40
	.xword	0xa40132f8619ffd7e
	.xword	0x0829f7fd6a88f1cb
	.xword	0xca4a3d4ddef9ae27
	.xword	0xf5ad8dbce15fca96
	.xword	0xda839f47baecd95e
	.xword	0x0dd70a26b4d4f51b
	.xword	0x95304801db04dde0
	.xword	0x331638d01cdea5fe
	.xword	0x69a2b06a59cd417a
	.xword	0x8a1c286a65b50c6c
	.xword	0xbc118d3defc8791b
	.xword	0xb61e50e5e76bb619
	.xword	0xd42c905638902957
	.xword	0x168a20049f588cb7
	.xword	0x039f66de62e8b4cc
	.xword	0x074f45eb5d74ce7d
	.xword	0x7576d9a2da6718f0
	.xword	0x0b61b68d905469ac
	.xword	0x1afb7acde9b4aad0
	.xword	0x9c84b9f36b72f528
	.xword	0x48dd06b025225747
	.xword	0xc462da2c950e31a9
	.xword	0x9439ba9b5ef72cb1
	.xword	0xbda0e789f46e9e1c
	.xword	0x29b4c49948ae8bd6
	.xword	0xcd56ebcbf4f24c50
	.xword	0xa190e5d1095b2eb5
	.xword	0x6a5c4bf4de54a651
	.xword	0x72e8da420dd35bc2
	.xword	0x56cb9468377eacad
	.xword	0x0868802c2b10c6c9
	.xword	0xa4c0f6f65092f62f
	.xword	0xc1aa056839198886
	.xword	0x761e08a423c26d13
	.xword	0x6d7c02747c560906
	.xword	0x7072eeac1a07dbb3
	.xword	0x4352cd3c9381b3e2
	.xword	0x20b44c40225284eb
	.xword	0xdfcf9cc6a08287d6
	.xword	0x3cf25d0989d6dd27
	.xword	0xf7e9b98f1af91e4a
	.xword	0x4d6c64bcc8a169d9
	.xword	0xd3f2b1c2b080595e
	.xword	0xfd5444868aa1ccd3
	.xword	0x08821b0fcff8352d
	.xword	0x85c808d1152c515c
	.xword	0x391b55123649b7bf
	.xword	0xc70866931860f184
	.xword	0x5fa67ad05dd902ac
	.xword	0xbf72f2519ee1bb48
	.xword	0x52f39c2d2635888c
	.xword	0xa092f829be516ddf
	.xword	0x151b98d17d561cbc
	.xword	0x6902990aff90752e
	.xword	0xef0167647f7980df
	.xword	0x8e9e838fcef4681e
	.xword	0x94240052ede39c18
	.xword	0x876db646be631def
	.xword	0x2b8d99a55b68b20d
	.xword	0x19c2dd6aebf0ea45
	.xword	0xfb9dc4470fe17319
	.xword	0xeb5b01402aac7217
	.xword	0x6d43856be4088360
	.xword	0x23c3c4c8557c7bbf
	.xword	0xd064ae666c07171c
	.xword	0xf2c4f83354b0d485
	.xword	0xd5814341d360f925
	.xword	0xca335e3b63390671
	.xword	0xf1e22cbe229a4a6d
	.xword	0xa97fad91edba4cf0
	.xword	0x1aafbc7e477cb5f7
	.xword	0xe80ca207f6401463
	.xword	0x95f0e75598acd0dc
	.xword	0xad533363fb9e471c
	.xword	0xd27ec1a293c77a85
	.xword	0xb8ed95ea3074bd1d
	.xword	0x26a0668f2ad26ca4
	.xword	0x50dcb6d42dc77b69
	.xword	0x005f60a002b64f9e
	.xword	0x143763d90f5e443d
	.xword	0xe8fa6bb662878dc5
	.xword	0x3f5f4b24e09d85c8
	.xword	0x98c382399bdeed00
	.xword	0xf3c6a51f51a920fd
	.xword	0xba4d0d4a1aaf76a3
	.xword	0x74972ef12424ac7a
	.xword	0xe779f9f980ae0b5f
	.xword	0xf53f503a67aba84b
	.xword	0x7dc36ae7a0ff535b
	.xword	0x386ee1e4453c581d
	.xword	0x03d52a3089decaab
	.xword	0x9ccd78c81939629a
	.xword	0x0715b1db7a04c9d7
	.xword	0x092bfbfab890e2a2
	.xword	0xc18600e5e1aed8e0
	.xword	0x5826156bd9b39bd7
	.xword	0x6b5b1817b3c0da54
	.xword	0xaebaf8cd1fee3537
	.xword	0xc919f40a058fb0c0
	.xword	0x6e0d30b9efc0fc2f
	.xword	0x212d4f356c26db41
	.xword	0x52d78c06b84616c1
	.xword	0x9a2091abd642adc6
	.xword	0xf6d3cfca2fac4dae
	.xword	0x27f67da8c2acdf33
	.xword	0x1d11f950ece34abd
	.xword	0x8e4e5a662d5b2907
	.xword	0x66ca73adf34fc7e7
	.xword	0x91bf19c085a6fc47
	.xword	0x1b69ba05862fa673
	.xword	0x3eae5c6a213c2470
	.xword	0x3d1aba9721a92281
	.xword	0xcdf2d66fcfbfa9a8
	.xword	0x1a4a80a9aaf1e3c8
	.xword	0xaff25a8aa9c820a0
	.xword	0xd51165d533d7b5a0
	.xword	0x7a5eec5b5fcff338
	.xword	0xf789726466693422
	.xword	0xf87c9f5876a65a62
	.xword	0x50f69fa1bb2e7a95
	.xword	0x4099b9b928b3fdb7
	.xword	0xacfa2a52a44338ab
	.xword	0xa7bac7889395d4a3
	.xword	0xb7ed91e5e42bb031
	.xword	0xf1fe51b0cfac30d5
	.xword	0x3f0ad08e4eb4c753
	.xword	0x705f59d3e189624d
	.xword	0x21661c663916e150
	.xword	0x168a96afcc534cfb
	.xword	0xf57d854feccc6e41
	.xword	0xf7926b5e5426c8a3
	.xword	0xadd5f7c4c70996d2
	.xword	0xeabd1e76d4c3517f
	.xword	0xce11546020707ff0



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
	.xword	0x25790a18f3ac5474
	.xword	0x7e901b9f2f88a2a0
	.xword	0x1293216b37978cd9
	.xword	0x0d2fd832f37e8129
	.xword	0x688c67e7fefc56f2
	.xword	0x3bc58e7a10db0a5a
	.xword	0x2488e19a4da7e499
	.xword	0xdb7cc4f5bc31f2de
	.xword	0x3774c844c6f6cc61
	.xword	0xe2ae377459da3af7
	.xword	0x9f9dbcf66c55524c
	.xword	0x1ced9beb8dbe93db
	.xword	0xb1db926d425a5d78
	.xword	0xa79ba731f52e432e
	.xword	0x8d410207b486c940
	.xword	0x89d68e940b6dae52
	.xword	0xcba262ec03a33125
	.xword	0xe6ef16b3c53121fd
	.xword	0x7c52830edd1d5b1b
	.xword	0x5187d1f8658f403f
	.xword	0x21ac640582b63e6b
	.xword	0x2345949f12681479
	.xword	0xba1b7c831816cba7
	.xword	0xb9d22b9a8170889c
	.xword	0x53e5cc90324c830e
	.xword	0x633b18b9e2057e38
	.xword	0x74db1f1110f9fb72
	.xword	0x5fb4c3f3758e0b49
	.xword	0xe770d87c457d0a28
	.xword	0x68c2dce3e2c6c597
	.xword	0xc9d9f7a35d72c8b5
	.xword	0x5338702b619bdd78
	.xword	0x06ca6b4a55833b26
	.xword	0xc3139af59a58e001
	.xword	0x72f670e9f2112dc2
	.xword	0x3a7b1e3ca146cd3b
	.xword	0x4ff10679199e47f8
	.xword	0x08a80b0f1b384b5e
	.xword	0x07cb9805afa10629
	.xword	0xd96fe16012f00426
	.xword	0x47e35a0c976d8dec
	.xword	0xcd9fdd39b8b6f747
	.xword	0x5d52d90bbdc78e82
	.xword	0x335683e660c6a074
	.xword	0x42417d7efad4dc50
	.xword	0xb0eda015e8cf66e3
	.xword	0x995dc7863f3b72ce
	.xword	0x03e354459c7da7d5
	.xword	0xb17b14d8fddacb3c
	.xword	0xd2d55ce2d4a12025
	.xword	0xffb6b93e59967d5e
	.xword	0xa530a9fe4df79f0b
	.xword	0x0fb38f4fb573976f
	.xword	0x9c151c82b832d506
	.xword	0xf13d918ed3d82103
	.xword	0xf73c5f0fc8f827ad
	.xword	0x7b21630590117125
	.xword	0x5ed139af3166b963
	.xword	0x42560c06116a7b90
	.xword	0x2b5372725865aec0
	.xword	0xb821ccca67857715
	.xword	0xd7f0f63d09486a7c
	.xword	0x432e09f417e0883a
	.xword	0x7e5506956f8a0eb1
	.xword	0x7519f134d90544a4
	.xword	0x585f30177758667c
	.xword	0x9754da4622fb7312
	.xword	0xc9c28e2e15a2b14d
	.xword	0x20937ee405ae7f2a
	.xword	0x21d5fc3965e41608
	.xword	0x4426b716da39f89c
	.xword	0x6bf1eda004de7298
	.xword	0x13d7965ac2c89dca
	.xword	0xe51174288125e394
	.xword	0xc307e7b21943b531
	.xword	0xee203ebf410b2c11
	.xword	0x255800f7521cfb9a
	.xword	0xa297c0f62a11a4ac
	.xword	0x93cf87a4934f5c20
	.xword	0xc155df01c6ceb16d
	.xword	0xe9624def027d5ba5
	.xword	0xa935eb8367477239
	.xword	0x1488cfb1f9d0a2ac
	.xword	0x598837e9db471331
	.xword	0x89ad102466735714
	.xword	0x465aa6f0e96933fc
	.xword	0x83cfc8d496711ce1
	.xword	0xfe371c82da0c9931
	.xword	0xbb46eb7a81ed56fc
	.xword	0xb7174bc5c45177cd
	.xword	0xf57b69435052e812
	.xword	0xe746d58b815a5f0d
	.xword	0xc125eb83b49dc1a7
	.xword	0x18fcdbc19370e428
	.xword	0xf4c34951035d45fa
	.xword	0x9db177367cbd3275
	.xword	0xbb8f0a563ee36d8e
	.xword	0x050f694de9345168
	.xword	0xc7033e87241d340c
	.xword	0x18362236e7aab916
	.xword	0x18879671aeb26d1d
	.xword	0x940b2396a0d93361
	.xword	0x3d6c0c9f8659e13c
	.xword	0xdf6cb1fcccfb0a74
	.xword	0xa49b66264cd0e818
	.xword	0x5a7e7b6520ec61cf
	.xword	0xb22c83f5f790f5b4
	.xword	0x81a08754a39fa053
	.xword	0x2ab8d090c5c60dcf
	.xword	0xe4287a6bbc0d7a49
	.xword	0x86dc285c255c42bc
	.xword	0xbdadda1abeda4d93
	.xword	0xb811f58be47688fa
	.xword	0x817a8ebc32a2782a
	.xword	0x1639d61c9fc59edd
	.xword	0x8f86dcf70a4f2905
	.xword	0xba2644d019e05eae
	.xword	0x4a8c7c03804ae34d
	.xword	0xc4415bda26d08792
	.xword	0x11473585864e32bc
	.xword	0xf5c56b8885ecf494
	.xword	0x5f5058c55400cbcc
	.xword	0xa16c7ae01c9236f6
	.xword	0x233a120deaa74535
	.xword	0x66cc474806b66174
	.xword	0x5a853956b1e3da51
	.xword	0xcbd5c4ee02c7074d
	.xword	0x09020a8dcd406c63
	.xword	0x43530f9c177a56d1
	.xword	0x5fbcbae0a9dbeae7
	.xword	0x2852b62303e5cd9f
	.xword	0x1b75456c2ffa4e50
	.xword	0x6c1f95a0004c2f1f
	.xword	0x32c6be61eee66346
	.xword	0x267c0b4d55e9cfd1
	.xword	0x168c2e7b196c9813
	.xword	0x98b1442f61581d30
	.xword	0x63a531a0141ac18d
	.xword	0xfc830dbc4228552b
	.xword	0xb1a5069237361628
	.xword	0x841170bab91c4980
	.xword	0x52501ff8367001f0
	.xword	0x81c5fc693eee268f
	.xword	0x9e4ed8b4cf3b8f19
	.xword	0xcee2f64836e86fa7
	.xword	0x717a425b681a12f6
	.xword	0x1c561505fd9e08b6
	.xword	0x90637a04bfd57635
	.xword	0xca938357e4dc60cf
	.xword	0xe53af822b2549f4c
	.xword	0x9a94739a3b6792bb
	.xword	0xca40d317f74b8747
	.xword	0xfd30fd22d96886f7
	.xword	0x10e0908b9a1df2c0
	.xword	0xdaf31de77a2dd444
	.xword	0xa89c4231b1dfec8c
	.xword	0xc89f2e113f7ca59a
	.xword	0x9a25c1ecd61456bb
	.xword	0x17dddb45c927bbe1
	.xword	0x55544294b190b681
	.xword	0x37dc78e29784d2ef
	.xword	0x5d9d7e57e7c7062f
	.xword	0x1d4470714c6524f2
	.xword	0xbd2d29d7de7d10c3
	.xword	0x18747d60306ac8cb
	.xword	0xcd771fc4aafc3651
	.xword	0x370f40dfb86ba9f4
	.xword	0x3a51be3d5b878e26
	.xword	0xf386161ded80bfa0
	.xword	0x7fab1c1370549f20
	.xword	0x043455742c407307
	.xword	0xd3b41eef0f96e9a4
	.xword	0x1be5fdbae531276b
	.xword	0x778089d9cd97e086
	.xword	0x76c19338c5abe4a9
	.xword	0x4e535cf3ab57b8d5
	.xword	0xdd996efc42aecabb
	.xword	0xa83ff377f1625f99
	.xword	0xad3726dfc8c207b2
	.xword	0x6f8f26adf509c0cc
	.xword	0x7d56ac93c488f83a
	.xword	0x480907d95bb56b66
	.xword	0xce8d0a67c9412864
	.xword	0x60d26510c5915e66
	.xword	0x06b86d98a8a0265c
	.xword	0x07a9dfb5b9bb135e
	.xword	0x22213398f1128123
	.xword	0xec4ee7c6ea2cbc9b
	.xword	0xdd53a1dbc571625e
	.xword	0x8ecb92f67405b089
	.xword	0xf315e65d4711d6a2
	.xword	0x24283926d1288bf8
	.xword	0x14cf89e4005ecd16
	.xword	0x5691766c59e35cbf
	.xword	0xae29eaa0060cf276
	.xword	0x790b37fe1dd6cfc5
	.xword	0x4156ecf8c91b2540
	.xword	0x6b5befbca2db4c16
	.xword	0x84d710d52db16d73
	.xword	0x2b8191a23e57b963
	.xword	0x6b660dfcc345379b
	.xword	0xb1b01f2709e8ac0d
	.xword	0x0b82f2dfcd1368fb
	.xword	0xd4d0ea1538af49ea
	.xword	0xb57afad1d7b8d17b
	.xword	0x0614adf513de574f
	.xword	0xc1784b61981c269a
	.xword	0x18e40eb0e06e088a
	.xword	0xa746ad70c9267110
	.xword	0x50cab7353b7851c5
	.xword	0xe33915a73917ef7b
	.xword	0x9d86e81fd7730817
	.xword	0x1a4b0905545a98a8
	.xword	0x94a3a359f8feb8ab
	.xword	0xdac22ea36bd08c26
	.xword	0x14819873f40f3643
	.xword	0x89d95eac37d6d8a7
	.xword	0xae67337b6dedc9fb
	.xword	0xb6e2c9a201e91107
	.xword	0x378232cd5ae2f3ae
	.xword	0xd000df661ba0ad62
	.xword	0xf7960e8da5b77679
	.xword	0xe42877de23790aa6
	.xword	0x3054d3b20d8a56a0
	.xword	0x33aad5faea6049c9
	.xword	0xd741ab4599521f89
	.xword	0x42ab68c6b62b6145
	.xword	0x8d23bced2eb449ee
	.xword	0xb2f77d821fe27cbb
	.xword	0x4a77389d40301194
	.xword	0x4029f5b691e801b8
	.xword	0xf109c4b0d2063b11
	.xword	0x582bcb7157c293f0
	.xword	0x6fd809e2cc751a01
	.xword	0x74dc2a1f99caec41
	.xword	0xca687a9e935f6b22
	.xword	0xd1d8bbd4808829de
	.xword	0xa23ee07f88c8aecf
	.xword	0xaa52e0a0c24ec177
	.xword	0x86ce362e479a7745
	.xword	0x4043708e0cd305b3
	.xword	0x0d1972dd008d6ba5
	.xword	0x0dc082acd4772072
	.xword	0x0baf63dd6f611c40
	.xword	0x35a78be44593688c
	.xword	0xd551194a1092140b
	.xword	0x4af277012451eee8
	.xword	0x78bec64142c9b1d4
	.xword	0x05c2ae7b3d62249f
	.xword	0x90bc2fe23393774b
	.xword	0x205decc4333d4842
	.xword	0xaf9421670bf30e07
	.xword	0xa8f9131e6994404d
	.xword	0xa134285cf2a4c7b2
	.xword	0xfcc4c651beff2311
	.xword	0x845ed86b12599540



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
	.xword	0x501008b4b8044044
	.xword	0x9614587faa456ef6
	.xword	0xfa473a1d498b504a
	.xword	0xfbb2b1e63f028ee2
	.xword	0x7a57811b584708af
	.xword	0x2e7fe5d461379d37
	.xword	0xf9797a0dd1643f24
	.xword	0x34a2320d6ada7bf1
	.xword	0x79a3158c83b2b721
	.xword	0x2f90220ebc5deb06
	.xword	0xdceb33bd258ac8a6
	.xword	0x951882528518b7cf
	.xword	0x970ce5147ea3508c
	.xword	0x182f93068aa32fba
	.xword	0x54603d4620222da9
	.xword	0xe59265f8a1890e5e
	.xword	0x93e55f69cf90cae5
	.xword	0xcd3604174e6297ac
	.xword	0xa43d4f2b2c63a4ed
	.xword	0xc100e54a2ab41c76
	.xword	0x523af56dd81630c5
	.xword	0x1f8df4e623affb8b
	.xword	0x63f9873d913c4de6
	.xword	0x5a4702885578d347
	.xword	0x5ed1d89f1c5dc164
	.xword	0x421051f4b43c1da7
	.xword	0xe953b558191639f7
	.xword	0xe379d71381810c37
	.xword	0xe54a571de62c7fdf
	.xword	0xce2762e64f034ea7
	.xword	0x1408dc6cd8d1ab1d
	.xword	0xd82ab1fd7ebd53fc
	.xword	0x5b340cf051e0b324
	.xword	0xe332b9ecf1b48a64
	.xword	0x0db03a2963ff6955
	.xword	0x7b46ba3466da5de6
	.xword	0xb93b2792fa22c7d6
	.xword	0xec40b640bcb1d89a
	.xword	0xbc63ce241c44ad81
	.xword	0xdec4aad5956e03e4
	.xword	0x17f9274edc264bbe
	.xword	0xbd664a76b96537e7
	.xword	0x90a1d23bb1219847
	.xword	0x2004e6058e1d8132
	.xword	0x9bda610eee78c789
	.xword	0x4771f99d9c1a804f
	.xword	0xe4f6968f0e1addee
	.xword	0x3b9661f6a477ac2c
	.xword	0xa68c6f94c6a5b0b6
	.xword	0xdd1c6d7f20bde7f9
	.xword	0x57a70453acbaf1e4
	.xword	0x8f38e4a8c6c0ee5b
	.xword	0x67fddb2be463349c
	.xword	0x76c74c0e1e0c439b
	.xword	0x733084311a3f978b
	.xword	0xe073d15ade86df6d
	.xword	0x63802b8a7ec352e2
	.xword	0xa82307eb601c43bc
	.xword	0xb768b561b9759f1c
	.xword	0x129838c0e19d3a9e
	.xword	0x44c484d1b6240794
	.xword	0x555e80be84857c8d
	.xword	0xfa60b20c41a18ab6
	.xword	0x3fc69c128c8a3899
	.xword	0x59a2bb0428c12c84
	.xword	0x1cddecf20ca39030
	.xword	0x00c8ec933e307f7d
	.xword	0xcf5c811445e62cda
	.xword	0x6e5de44baf2e2ad4
	.xword	0x20ac3c9aae383cd7
	.xword	0xe7cb997ce18f5ba2
	.xword	0xf597717e45d619e8
	.xword	0x0e9b9a99d4feb44a
	.xword	0x8b7c58d2dc51951b
	.xword	0x02c7466d2c0cf282
	.xword	0x41fe7ac9df5c65b4
	.xword	0x4a42edda515faac8
	.xword	0x06411ae50682abe3
	.xword	0xfca7e8596f28c1a2
	.xword	0x1c032791926501fe
	.xword	0xf6fc603db469dc3d
	.xword	0xd0a2e9b50ffeb6ff
	.xword	0xd75944e90acd011e
	.xword	0x3de370310ed7caaf
	.xword	0x60c34676e87b793e
	.xword	0x0f09de5ba88ca12c
	.xword	0xe603fb77429a1194
	.xword	0x7d8461a0f33fd941
	.xword	0xcd5ae8a46c3d232b
	.xword	0x7c9afa34ec9b2068
	.xword	0xe4ed9b33d9447279
	.xword	0xdf381fe3d8cfc76e
	.xword	0x29c798200d74bebd
	.xword	0x97d3161ac96557ce
	.xword	0xc0b527160ab3787c
	.xword	0xd2a54d902b6632a4
	.xword	0x8496738a5d6b62ef
	.xword	0x9b2d5bd23c417850
	.xword	0xddb4a9fdf3d7df52
	.xword	0x75fca5be70788fc3
	.xword	0x34c8d7356577b3c0
	.xword	0x4cbeb0cfb627c2d5
	.xword	0x91290d0e0b2769bd
	.xword	0x7053664d42404191
	.xword	0xb12a32e876ce7f92
	.xword	0xf8208f1b21a217c6
	.xword	0x24654e2c61b6b4d9
	.xword	0x4e3b08124525ba5a
	.xword	0x900f8a8988725a4c
	.xword	0xf31b8e29a63f7e11
	.xword	0xafc8f95fb89aca11
	.xword	0xb922b1885dfeb1f8
	.xword	0x9838a5fabe40307c
	.xword	0xb2dfa03134428538
	.xword	0x15378624c52de9c9
	.xword	0x7e440fbc711ff253
	.xword	0x362234225659ff4c
	.xword	0xf68314f65c28fe26
	.xword	0xfbe9104d2e466fec
	.xword	0x7c52301b3570c75a
	.xword	0x0847214dd26ca679
	.xword	0x6931e4ca55725e9b
	.xword	0xa67cd086a9825df3
	.xword	0x63d08009053d7e8f
	.xword	0x859eb81ccdcdfeab
	.xword	0xd08826d060e8d823
	.xword	0xfb0c4b87e4026f26
	.xword	0x41faef3d03e7a907
	.xword	0x0d144492be2dad6f
	.xword	0x6a0602ac0b06782c
	.xword	0x4d3ca6c80dfa071b
	.xword	0xbbf7d89f0e833563
	.xword	0xeda598b94c37a2ea
	.xword	0x829105ec0750768a
	.xword	0x12eb945478eac04b
	.xword	0xba6473668c59c166
	.xword	0x0c7fc29398602b9b
	.xword	0x3b3b83d2250e923c
	.xword	0x699ab1319551816e
	.xword	0xb4b3a5519e2ecb51
	.xword	0x73b312159e4494c9
	.xword	0xa66958881a9d1960
	.xword	0x3149d6f0208cfbab
	.xword	0x21ddc9f87a252dfc
	.xword	0x7d637b587de059f5
	.xword	0x99731be214511c3b
	.xword	0x422a9c90aaa2740c
	.xword	0x9cd1df423a9dce7f
	.xword	0x3967dae3edcb0dce
	.xword	0x4566f4aed7585b87
	.xword	0xa24849c15b45eecf
	.xword	0xdc4619f707c1144a
	.xword	0x0d2cab4864fb5794
	.xword	0x91f2f15e6caf15b1
	.xword	0x264e58eef58e9dab
	.xword	0xeb297ead9fc33a82
	.xword	0x6d3b459d1d43c234
	.xword	0x0d3e5c4e9253635a
	.xword	0xabba7bd14d4e9f73
	.xword	0x133cebacdeddda5c
	.xword	0x76f3a64c278de34b
	.xword	0x74e549da36015d2b
	.xword	0xb39bdedc543c1121
	.xword	0xd818de5b6b81f42e
	.xword	0xfe0df90fdee37f3f
	.xword	0x51211e66e24a06b6
	.xword	0x257a23d8947642f0
	.xword	0xc7c45fd5238446a3
	.xword	0x81b020e087b3a2ca
	.xword	0x8f82500e113a7c02
	.xword	0x3440998255edec40
	.xword	0x9bc106ac67050fe3
	.xword	0xec2e974f4a68d708
	.xword	0xf3b91b0881d0c0e2
	.xword	0x5c632432e7fb8e73
	.xword	0xbe73ab4fbbc1a71f
	.xword	0x980cf96443408c7b
	.xword	0xe582a6e8d9d70f8d
	.xword	0x2f12f6786f8b23f2
	.xword	0x458c42d53fd01e62
	.xword	0x3cb9af8e27a79b9f
	.xword	0x43cc16b6ca3ce6ab
	.xword	0xefd467d35f27efdb
	.xword	0xb30ea54f5b273e26
	.xword	0xfab6f5e4da90eccf
	.xword	0x8a7fb83715822ac1
	.xword	0x6b7b218dc9240085
	.xword	0xf71e7f84f2fcc1b6
	.xword	0xa78d597b09092fc8
	.xword	0xcdb82bf39c360e7b
	.xword	0x23673902f06d70d1
	.xword	0x9d31dab4a2efc3d5
	.xword	0x59e75fcce92e4465
	.xword	0x7c65635e5e0f5ad8
	.xword	0x9e0ebba60fe532a1
	.xword	0xd6d95b61be28fef4
	.xword	0x2a33cd130e8af779
	.xword	0x5d7d1944f23272b0
	.xword	0xc2046a9997aa2a74
	.xword	0x4bbd3ff37f3684da
	.xword	0x5e95e8ec1ccf692a
	.xword	0x535900190574db87
	.xword	0x8c866704438d7b89
	.xword	0x800c4051d2c5c0ca
	.xword	0x86e2d633b460f03c
	.xword	0x35b61f67de6d6408
	.xword	0xccd58cef916fe11d
	.xword	0x0b804cd1e10cc41b
	.xword	0x9bc32f26af24e00a
	.xword	0xae314641eec227b7
	.xword	0x9f4a65472f1cc55f
	.xword	0x00acfcd904b9056e
	.xword	0xa48fa971053c8cce
	.xword	0x798ae7f2c0c080bd
	.xword	0x66cc628baf98af0c
	.xword	0xc5524e2786ec1d71
	.xword	0x60097080eb9f116e
	.xword	0xa15b98222975a2cb
	.xword	0x8e803dfe478f9a95
	.xword	0x758c82ef699fd7e7
	.xword	0x7b8c6d6e933f226c
	.xword	0x8770ebaf0fe946f3
	.xword	0x29e43311ff0ea592
	.xword	0x6b1c1c998e068c3c
	.xword	0x0b98d84cdd631e1b
	.xword	0x0e45c3a13ac761f1
	.xword	0x2d3b7b08a160b15d
	.xword	0xbe42c4bdb201dd18
	.xword	0xb791349d31f50a17
	.xword	0xbf22f65f54a1edeb
	.xword	0x64c6c18d10c5ad52
	.xword	0xbe4fbd158fb68e84
	.xword	0x484e79549acc7891
	.xword	0x3981778d7fac3bc3
	.xword	0xdd2a73ed26b74df7
	.xword	0xf17760e0698f4a7e
	.xword	0x5a12b52d7dbeac89
	.xword	0xb8f10b3b1fb12ce2
	.xword	0x06b788a230cbd704
	.xword	0x7236724443c71af7
	.xword	0xa1293f1dddb3ef8b
	.xword	0x9504020351229a9e
	.xword	0x97f1d0f3cc2a6680
	.xword	0x888d7b72155a15cc
	.xword	0xc88c72ecfdcc36ab
	.xword	0x81df2e46b714cc88
	.xword	0xfe2a8163bf643046
	.xword	0x4fc0005f127007a1
	.xword	0xb22477df1860e5f3
	.xword	0x058dc36948ed7c98
	.xword	0x8f7141856c8b9ba5
	.xword	0xafa8487e8aefea6a
	.xword	0x3076ffc227fa428f
	.xword	0x569b5bb401be50c4
	.xword	0xe9027aa3ab0607b4
	.xword	0x75fab38b24ce958e



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
	.xword	0xd3602597256200b3
	.xword	0x57e42b6d9cb6d6bd
	.xword	0xb98be2e43dad8fc5
	.xword	0x88d6f59e2da9bead
	.xword	0xd1b13d4906b216cb
	.xword	0xf09d8def534266d8
	.xword	0x8548ffb47138868f
	.xword	0x8c31d65bfb8e01f3
	.xword	0xdd79225ce69cfee0
	.xword	0x8e1256cbe43f1a02
	.xword	0xa44de839b299511a
	.xword	0x82594764a538e7ca
	.xword	0x8d33e022402fd853
	.xword	0x8dbdf87693e9c171
	.xword	0xf00f9b816d190b1c
	.xword	0xb94a6eceb729fe91
	.xword	0xd23a38e43ab5f18f
	.xword	0xa98f2bc2fb7ae51f
	.xword	0x1487e891a41b8c96
	.xword	0xae8bc37cf62aa5e8
	.xword	0x4a0b8a4fc1c267bc
	.xword	0xe443472eeda0e991
	.xword	0xbf40371fb32d5875
	.xword	0x8a00136a57f7878d
	.xword	0xbe704f8b058c20a8
	.xword	0x64b956f1d9e58f0c
	.xword	0xf36a8ca9223bc233
	.xword	0x699c3f151fa6059c
	.xword	0xf00a546027e97ac5
	.xword	0x42f57aa7e14cad6f
	.xword	0xc63bd4fa68659946
	.xword	0x75a00cbc2d33225b
	.xword	0x4e8775ad18f8a969
	.xword	0xe7b3b76a5bdb177d
	.xword	0x5df2948c2592d848
	.xword	0x359e685753f7c886
	.xword	0x1432784e5ee781d8
	.xword	0x565091fd9ce7cc7f
	.xword	0xe0be5fc4aafd5eff
	.xword	0x9273411e0f052090
	.xword	0x7b351bbdf68f25b2
	.xword	0x4e291d6543c2e717
	.xword	0x8641944724392de3
	.xword	0x3929e3d6c84201cc
	.xword	0x0fc92432e574790b
	.xword	0x3ca748e7cd417c96
	.xword	0x2808917f6728fea1
	.xword	0xc241006dc5985b7b
	.xword	0x5a278c7bdaa9ae53
	.xword	0x4a137c04a93a4162
	.xword	0xfe8644257d80ac29
	.xword	0x1d3434d0752b8b98
	.xword	0xcd4c86a9f3d88231
	.xword	0x1eb4e19955cec865
	.xword	0xcb45c1e0939d3b6f
	.xword	0xc7d48909c89c2668
	.xword	0x71bc4f40e9857949
	.xword	0x76921b599c26b824
	.xword	0xf3598e027ddf5f78
	.xword	0xdd957c01cc1bc63a
	.xword	0x43807b487b164d25
	.xword	0x86880a4185debcdf
	.xword	0x3d7e79b3d2d873e5
	.xword	0x10a70ae87b1a0115
	.xword	0x2fca5fd8f8eb2307
	.xword	0x0c95661f678d1606
	.xword	0xbfa535deb50b0e52
	.xword	0x08de431377c35f98
	.xword	0x228c62f00d4ee650
	.xword	0x5a7417334510a2cb
	.xword	0xaf2f353cadbf242f
	.xword	0x92bf5bfecb83d3ec
	.xword	0xfdd338318d1569c2
	.xword	0xd4e18cc40427f422
	.xword	0xad3743914f23fc35
	.xword	0xe62f320567c0a763
	.xword	0xa039cf7941ff8698
	.xword	0xc776a963c83de3a9
	.xword	0x8c68ad43ef767dbd
	.xword	0xa558014de6c2a3c1
	.xword	0x7fdab318e2c80789
	.xword	0x332b19f213e52032
	.xword	0xb7f442e117a7f82b
	.xword	0x44904a8de6a596dc
	.xword	0x314ba8e875ac813d
	.xword	0x3f941a484249001d
	.xword	0x4787df68ab2ac0c6
	.xword	0x96118918f2ff1f16
	.xword	0x49cb8f04e4775e76
	.xword	0x5a8707fd72afc661
	.xword	0xbfae7524fa5d1208
	.xword	0x04c891a70fe73c70
	.xword	0x529891894e8374df
	.xword	0xcc479674a0be6630
	.xword	0x5ac2e1b75e9180ab
	.xword	0x18315d814a97b6f8
	.xword	0x3c0b676d29d13cc8
	.xword	0x651c303501fee4cc
	.xword	0x80cd0f4661ce3ad3
	.xword	0x45a84271a94d4add
	.xword	0x8f0ff3626800a52c
	.xword	0x93cd44a7d624935b
	.xword	0x99f0646e27acd3a5
	.xword	0xeeca38289560a91b
	.xword	0xc2c81b75ad304bd0
	.xword	0x4245374c7353d53e
	.xword	0x895176398c813550
	.xword	0xf8b04f5896f20c10
	.xword	0xac7784b39921d007
	.xword	0x38680c386f779ae3
	.xword	0xc8c0eaa7577bd5eb
	.xword	0xddf19b3e329da6e4
	.xword	0x369245c3975290e2
	.xword	0x320b5274716cd30e
	.xword	0x6b60585023398b8e
	.xword	0xdf4a748155c55733
	.xword	0x2cecf9e0db9b9fa1
	.xword	0x91941da8f979c34a
	.xword	0x177fa1876c20bcab
	.xword	0xa868c930202d5694
	.xword	0x8037ff514b239d1e
	.xword	0x64948752e2660b68
	.xword	0x526db8cc2867db10
	.xword	0x7336a4f06f4bde87
	.xword	0xe35e2b86eafc8aea
	.xword	0xd80b1911405eb004
	.xword	0x5ee6d6dc6210f8e9
	.xword	0x6ace4bd7fba2c0bf
	.xword	0x3c7684b8488e405b
	.xword	0xb00e6e79fb5c0129
	.xword	0x26e488c294c38065
	.xword	0x39cd72bd0402853d
	.xword	0xd3db07e60419fc69
	.xword	0xb29b5b7086047ec0
	.xword	0x288f25cd2afa4bc4
	.xword	0x53a94855a5c17365
	.xword	0x43c332aabcd243f2
	.xword	0x3f643944d89a2c9b
	.xword	0x229e9b9a2780eeb1
	.xword	0x61dd2a8a66535b29
	.xword	0xbbfd4d02a481b2e4
	.xword	0x5dd5390cfd63197c
	.xword	0x91fccd41309e3646
	.xword	0xf6270526b0620542
	.xword	0xc5cc59d121cd54a2
	.xword	0x5afebbb835fd5f92
	.xword	0x1834277db803f0e5
	.xword	0x58df48f86a309c54
	.xword	0x93791852490deddd
	.xword	0x26931b8f63ad0030
	.xword	0x1568057240f9fbbb
	.xword	0x8e0320c373835de2
	.xword	0xc582015cd87e9d85
	.xword	0xeaac847450845308
	.xword	0x674952221913a373
	.xword	0x8eae5bdf9e49e5fc
	.xword	0x05338fdaa989a8e3
	.xword	0xc71c4670bb9f9983
	.xword	0xd36902c84eea9649
	.xword	0xe51f7ac6d2b28598
	.xword	0xcbdd5886934a688d
	.xword	0xa5ae23ebd313fae1
	.xword	0x0b19dbc58e9f3aa6
	.xword	0x536820c50544580c
	.xword	0xc3ab47b776b53d7a
	.xword	0x70c9eeaad7835d6f
	.xword	0x6d2a586d0858ef62
	.xword	0x46505d63538920d9
	.xword	0xfaf95f1064f40812
	.xword	0x981dd8ae01ad193d
	.xword	0xca3931bec9e02fd8
	.xword	0xbce0aca10ccab849
	.xword	0x923a2e31c9fde0a9
	.xword	0x184f46837e32ebf4
	.xword	0xf21d975204a14eba
	.xword	0x3ce451c70c238321
	.xword	0x2b6653aa5cfeb59e
	.xword	0x9b94bfea99440e47
	.xword	0x692588b70d686438
	.xword	0xd32fe23f97ceaf30
	.xword	0x7e009ad9f5a3ed68
	.xword	0xd8e99a43ddbfcceb
	.xword	0x9a14ab22edefaf28
	.xword	0x2fea44916de3f0ce
	.xword	0x4767686ef74a5185
	.xword	0x10c382249f935df5
	.xword	0x23f4969561fd4954
	.xword	0xf0afdb327bec7b0e
	.xword	0x5c785d94275341ff
	.xword	0xb3a04c8a52c35ecd
	.xword	0x055078f229c732b6
	.xword	0xbc47e33f99de7490
	.xword	0x1b6644d8f1248bb4
	.xword	0xe586374254335c2f
	.xword	0x7017fb519bf5663e
	.xword	0xb60cf1c3bfc3becd
	.xword	0x82093cfb19bfeefd
	.xword	0xb3403abc0f501ba5
	.xword	0xb5a6a161b0c8ecf8
	.xword	0xeccc47a87f2fa93d
	.xword	0xc704751abac50e4f
	.xword	0x7b7864491ae97a62
	.xword	0xe6e054ce9dc15e54
	.xword	0xb64fcf3051d9e2d0
	.xword	0x1f7006ed1bc7fc23
	.xword	0xbf83be50c6f95147
	.xword	0xd5acc381ca1894fd
	.xword	0xfe3f45faee589d22
	.xword	0x3f70a287bf54f5a5
	.xword	0x82633410f9b646b5
	.xword	0xbd07f96f85c103a4
	.xword	0x7cba5c63d8a1f6e4
	.xword	0x81fbb4ba1b93034a
	.xword	0x6d2f9d175447f3e5
	.xword	0x310d1a7e37515acd
	.xword	0xa0ea71923d1f4a7a
	.xword	0xe98cde669b6e9288
	.xword	0x113dfd4afab8ee47
	.xword	0x11f4f0ece4c63c94
	.xword	0x571b4a0b5fa33719
	.xword	0xc1f83c848ceb9cf4
	.xword	0x5c9743b73c8ed24e
	.xword	0x926cdf59be0c13c9
	.xword	0xc817c4b2f723823e
	.xword	0x30bb3e0540c4c043
	.xword	0xdae7db25f2f0eb0f
	.xword	0x8a3931a163ad69c0
	.xword	0x7eef980652235f16
	.xword	0xaebb58c7be536f2c
	.xword	0x75690177974926ac
	.xword	0xb7fb4de3cf21a63d
	.xword	0xb9990bbe8e5a1fb7
	.xword	0xa7513cccbd7e8ad0
	.xword	0x16901c061a082125
	.xword	0x2f66c2191a947a51
	.xword	0xc114e0e0221da1b4
	.xword	0xcfb1c1fcec4db261
	.xword	0x3a44dff3badcce34
	.xword	0x8f1086f4b0c4d922
	.xword	0x21784b1a7ee1854a
	.xword	0xd8571d4b4779e762
	.xword	0x26a2ada2de7383ff
	.xword	0x22bd64148b94e295
	.xword	0x5b494140cc51e593
	.xword	0x912105b5f2cd3ee8
	.xword	0x97cc4d6c5ab544b1
	.xword	0x135c19f7810d4451
	.xword	0x7a94bbfb74819e99
	.xword	0xd248a859184f851f
	.xword	0xe52c70ad970a82f7
	.xword	0xbcf8fa2a4476e10d
	.xword	0xbd43dbe6414e8f50
	.xword	0x7ed89593bc1bc092
	.xword	0xf43957f77f9276da
	.xword	0xe49de3349d45a34d
	.xword	0x701cc9684f072a31



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
	.xword	0x88861a023aaed3f5
	.xword	0x7162adaadb195a29
	.xword	0xb0a8fb138d3d5721
	.xword	0x1c0e3f9eea030d38
	.xword	0x7639871598da6c42
	.xword	0xd48cc99e62e3a6b2
	.xword	0x0cd4928c5362025b
	.xword	0x21e4006e2ff47e48
	.xword	0x129d9fe508ca316c
	.xword	0xe3652f8ed1ff0d03
	.xword	0x0d5c5be00c902d9e
	.xword	0xf3f70dcf16cd840d
	.xword	0x58929850566a9eb3
	.xword	0x5151a438011bd114
	.xword	0xd1b22618fc71321f
	.xword	0x3fa8b8f2185d237a
	.xword	0x4567406938211145
	.xword	0x14d31ff563ac6a16
	.xword	0xb738e42c52b7b9b8
	.xword	0x556ea60ff37394f8
	.xword	0x6ced4214fd571507
	.xword	0x6b9b33cf1bda5c3b
	.xword	0x3b683c345eeeb143
	.xword	0xf92f87c7ae9b5386
	.xword	0x5670e5b10d592a62
	.xword	0x5b99d55a7371007e
	.xword	0xcbc62133f50a1e79
	.xword	0x09f9564d7ebd0dcf
	.xword	0x2b5df991e74558e6
	.xword	0xb7df216712391bab
	.xword	0x545c6e987752db90
	.xword	0x6c4b8f553f651334
	.xword	0x450c7b88ef47b1c6
	.xword	0x14ad67d3407afa79
	.xword	0x99bf2e9b67243094
	.xword	0x1e877269ea13c40f
	.xword	0x55f4bb442d0aae6a
	.xword	0x8f05601c3d661c11
	.xword	0x66f297c6f3d251f7
	.xword	0x056de47de87bbbc3
	.xword	0xc0c965076cc969d0
	.xword	0xef76a382f5692d18
	.xword	0x7435f144e260baaa
	.xword	0x49b6783172f403b5
	.xword	0xc6a64913be8559a3
	.xword	0x3c6eeffcd4139692
	.xword	0xf79c048e44442bf1
	.xword	0xb3dd6a2310564ab1
	.xword	0x6e8cd90b122d7cc8
	.xword	0x60e32b08b65c8373
	.xword	0xd4edd0418886ce76
	.xword	0xae47e49b84730ddf
	.xword	0x114371bfa2678d17
	.xword	0xd1207ad138cd61cf
	.xword	0x13b146c940acbf8e
	.xword	0xec68727594b962da
	.xword	0xc4f474848a98031a
	.xword	0x0ae5aa7441ed37ba
	.xword	0xf707cf5e58aff483
	.xword	0x49285953c7d136c2
	.xword	0xa6f23fcf5c904062
	.xword	0xb37210fcf18f4af5
	.xword	0xe52210fffc0085fa
	.xword	0xda6ee27284750baf
	.xword	0xde0dfec519a48563
	.xword	0x07a058492401327d
	.xword	0x0e2114012df65ba7
	.xword	0xc97df5661dc84e80
	.xword	0x3ae11094cd51adf3
	.xword	0x97e8a388f3223662
	.xword	0x9bf9b47aa0c01637
	.xword	0x09d6c74f378cd54a
	.xword	0x0b5db2f0e3cc87c8
	.xword	0x625961b367f7f56a
	.xword	0x6ff05b484c93f2e0
	.xword	0xea84d1d0dc2bf223
	.xword	0xfe295da904876ad6
	.xword	0x5e128efd53bfbcfc
	.xword	0x2b5261450baf1f5c
	.xword	0x4f1252abcde8b340
	.xword	0xd82c694957e59bee
	.xword	0xc9648f6189c23274
	.xword	0xfbc74e66bd51c5d7
	.xword	0x27054a0d9c02b4df
	.xword	0x0c29eddb53c07060
	.xword	0x9c2391e549d3d4c0
	.xword	0xaad215bdd2afba18
	.xword	0x09989107bd40426e
	.xword	0xe3309088dbe83763
	.xword	0x41c68cf340c79018
	.xword	0x4b4618749855abf8
	.xword	0x0f63cd3c0fd4ca3b
	.xword	0xff3eb780ef7da534
	.xword	0xc9025865404079a5
	.xword	0x21492c98e23d0211
	.xword	0x70b7163b2de09b26
	.xword	0xb731eb042c246514
	.xword	0x99af35dce1a74d49
	.xword	0x1e91afcee9871edd
	.xword	0x8b1b629854748cdb
	.xword	0x280e3cc3bd71ffe7
	.xword	0xbdb67a3fa95f49bc
	.xword	0x25d22c56485f7605
	.xword	0x3c885e3fbf7d5c72
	.xword	0x45175a7ea756ea0c
	.xword	0x0de694e0742ea03a
	.xword	0xfd25a17398670e3e
	.xword	0xe1e45d0f50b872a2
	.xword	0xa31a521efe16d4c0
	.xword	0x69c899942053976b
	.xword	0x8bbe44a646ade795
	.xword	0xa9a41d426e166f23
	.xword	0xc22c233b529eb02f
	.xword	0x4dca7d2874c86800
	.xword	0x7a278b922380a476
	.xword	0xc1b6c2344ad606af
	.xword	0x24d89cc5d6cb502a
	.xword	0x57028d075096d715
	.xword	0xa7187a36b691d969
	.xword	0x1c69c102f387bf01
	.xword	0x5a6161333e0a78d7
	.xword	0x3849455dc60d07d6
	.xword	0x40273befb557a376
	.xword	0xbab380dcc0eb91b5
	.xword	0x5c1736a0899c07e2
	.xword	0xa19cfd1be6e7e330
	.xword	0xb6997cc766c35769
	.xword	0x98cb16d63bf02ca1
	.xword	0x85b6edde43d02cd2
	.xword	0xa0b29e364cbef4a7
	.xword	0x8b38987748541c12
	.xword	0xd6094bc1873ca1b1
	.xword	0x202d698cf03be6da
	.xword	0x15f22d95bba7ec78
	.xword	0xb292ad3bc14a65cd
	.xword	0x85f419964d660322
	.xword	0x6d67c11c102a0dbe
	.xword	0xbb9adc24b0350ba3
	.xword	0x6eb8b38246f4e386
	.xword	0xfb9b44ac1d346534
	.xword	0x81edc674cf4093cf
	.xword	0x5c9070b3fbe28b20
	.xword	0x637c229fa2cc2f04
	.xword	0x68539678b27eb425
	.xword	0xe9af97a9aae3f715
	.xword	0xfc078db472a7280e
	.xword	0x5a744b131093bffb
	.xword	0x68b0fa8024dce866
	.xword	0x332dcfce0e4184b5
	.xword	0x108e169aac104906
	.xword	0xb5ea676687e2b0fd
	.xword	0x1aa3952344c0b039
	.xword	0x5a725955bdb596bb
	.xword	0x561e6f6f37cc59da
	.xword	0x0e9b2bf40fb3e578
	.xword	0x1553a74275faa5c1
	.xword	0x4c4e6428ca33adf9
	.xword	0x94da8e4de8aca35d
	.xword	0xcd42a5f792718d37
	.xword	0xf160a695086d5aa0
	.xword	0x56205358d695c299
	.xword	0x2d083055a5b762c5
	.xword	0x6bd460ba2b0e8c96
	.xword	0x1b23891b4accdc32
	.xword	0xe895f821db213b3a
	.xword	0x494452f210c1573d
	.xword	0x90080922d9f5ebc8
	.xword	0x6c2070ab090052dd
	.xword	0xb9073976e06b6757
	.xword	0xbb95c28cb33d3510
	.xword	0xb1a5d2406b05da52
	.xword	0x6aa3183c93b32385
	.xword	0xa0a44389a6eaf3f4
	.xword	0x0d09e025327026d7
	.xword	0xd8dfa3eee798b93b
	.xword	0xc2193d4bce545d75
	.xword	0xed6413bf0a775cdb
	.xword	0x785b271c7302df0d
	.xword	0x37a2e419d3a2ede3
	.xword	0x60ecde6a9ca8595b
	.xword	0xeddef2c4640f73eb
	.xword	0x1d1ee61064ed8773
	.xword	0x31550ca26d07d339
	.xword	0x810ed214eae6386b
	.xword	0xd02223004f36372a
	.xword	0x3051a7aed7b37a4e
	.xword	0x211d6f0bdea5f617
	.xword	0x4abd214821afd494
	.xword	0xd6014d719729656a
	.xword	0x8b6053e095fba645
	.xword	0x5ea1f6e8f531af39
	.xword	0x0ae22791eb794b06
	.xword	0x2f2b26405e15f03c
	.xword	0x5018a597a084b706
	.xword	0xc9a34c23cd73fa12
	.xword	0xdc845835fca1f202
	.xword	0xc14826ee0458339e
	.xword	0x0c6bce6c5d98b94a
	.xword	0x50c63427bb370ea5
	.xword	0x5e2fcc01bdcbed6a
	.xword	0x749b0b5edbe0777b
	.xword	0x4e8ff973cddb3394
	.xword	0x88ba1a792a87fdaf
	.xword	0xd6a0b3528f8a31ca
	.xword	0xb12f324f68700b01
	.xword	0xf7d51d1f56672803
	.xword	0x23220322a4e40326
	.xword	0x0588c55f7ddb1a1e
	.xword	0x21b46eb7041084aa
	.xword	0x6af215cd32b4f5eb
	.xword	0xc8e18daefd6a97f2
	.xword	0x693c0a87e95a834c
	.xword	0x327c7ca9ccb0a244
	.xword	0x2f861610f33ef32f
	.xword	0xce1b55746f6a1bca
	.xword	0xf60477af304440d5
	.xword	0x50e2303734cabd98
	.xword	0x784b13f856d9c879
	.xword	0xafbb64e5b386fa2d
	.xword	0x0b876f41162c458a
	.xword	0x9f03859b5ed89650
	.xword	0x0b31ff8663a5de9f
	.xword	0xe73f6e600a62ab8a
	.xword	0xd65ae11876e315ad
	.xword	0x3e696f83872134b9
	.xword	0x9f88f0933682ea48
	.xword	0x78a3e08040700351
	.xword	0xf55f14ff69ce5fa1
	.xword	0xc773b685ef267737
	.xword	0x178de24be363d50b
	.xword	0xadb26bbe90dda171
	.xword	0xced8c3af59255889
	.xword	0x50d8e72d6d54dc86
	.xword	0x4c50dcc04b993b3e
	.xword	0x61977437a2d2ecfd
	.xword	0xe1b1aae32289775c
	.xword	0x9f75daa6001c8c95
	.xword	0x0e53c26ff6b6814c
	.xword	0x3bdcf75c067bbd4b
	.xword	0x17029306e7e23dde
	.xword	0xce8e418ebef34043
	.xword	0x7c9d833ab03ea3c3
	.xword	0xe8848768f4f7a230
	.xword	0x1f925afe85330d38
	.xword	0xd31fc09907e24306
	.xword	0xc04b979ac24daf93
	.xword	0x5e2381093c475a51
	.xword	0x9706f06747be7253
	.xword	0x27de388cd8676e4d
	.xword	0xb21f14786359d22d
	.xword	0xef3952d91893fbc7
	.xword	0x8fd7af6b5950457e
	.xword	0x50ce7afebd47d2d6
	.xword	0xf32ee57c20d5f7b0
	.xword	0x00477de4648c0585
	.xword	0x8243f6b5c78ef11e



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
	.xword	0x0e3ba1325556abd5
	.xword	0xbe27673684473774
	.xword	0x9cb85579a7fbf1a5
	.xword	0xd2f40b4755398833
	.xword	0xdc30236183fb1d3e
	.xword	0x6a70436547240795
	.xword	0xe6bf242c3fd6031e
	.xword	0xb5c7e410bf205415
	.xword	0x5131338621ecba42
	.xword	0xd70c980e12bbc27c
	.xword	0x30b059d1636948f9
	.xword	0x1463acd99ae6c32f
	.xword	0x6d1e4f228ff27c0f
	.xword	0x62b2cc41adc2bd01
	.xword	0x99890c70f00884e5
	.xword	0x5eab5496f94d6aff
	.xword	0x4d8010d8ff1d1612
	.xword	0x5c51272acafed823
	.xword	0x14c346cfd13405c5
	.xword	0x50cc86fbe7654eae
	.xword	0x5bc6349fc66f2b7f
	.xword	0x53fc79893afd8ed7
	.xword	0x4a3c6b96e9136188
	.xword	0xb4e4d08a87109bde
	.xword	0x54e207f1ccfab84c
	.xword	0xd65cb5356c4bbdf9
	.xword	0x743f87e3911bc362
	.xword	0x06a6faa0e2e9b13c
	.xword	0x0bef093b596dd8b4
	.xword	0x6c19fc8649802b87
	.xword	0x1230369a9a1c03d5
	.xword	0xfb9e0a4c3f34c709
	.xword	0xc0d104e05de91194
	.xword	0x7f4fd3aea194f921
	.xword	0x126ab5cbe16b6278
	.xword	0x854384e906cf3b64
	.xword	0x099585b08bcabc52
	.xword	0xf35fee66bec0d008
	.xword	0x6a3dfdc0aeed953b
	.xword	0x158d1f2ed12bd5a4
	.xword	0xc8740389187c2ea2
	.xword	0x1e84f888ef49c8ac
	.xword	0x68282b9f33073291
	.xword	0x3995509bdc50f02e
	.xword	0x30d6f763e5d40119
	.xword	0x3303cae58faff57d
	.xword	0x86e106e00a68da76
	.xword	0xc55313ebba8759ca
	.xword	0x20f108ad2dcde29a
	.xword	0x148de7194e7ab89c
	.xword	0x463aa3f8c0ebb681
	.xword	0xbeb33bc7afa630b4
	.xword	0xfbe5af33ea70f934
	.xword	0x6e9eba57e90ac3bd
	.xword	0x2b692ddd57dbab14
	.xword	0x0b8136fb5f9d4b42
	.xword	0x3e7f90ac67742ac6
	.xword	0xc8403085b21b077f
	.xword	0x737fc6848f2428ea
	.xword	0xd4acbe78e406d211
	.xword	0xe6e8838540b2d9ae
	.xword	0x31ea498bae43ce05
	.xword	0x97768536b56bff11
	.xword	0x950f89ac2d519a22
	.xword	0x3029fe70637b75dc
	.xword	0x4f5801dd7aa394c1
	.xword	0x1de34f71376497e8
	.xword	0xf73c3cb8f807d081
	.xword	0xfcd52af7be0702d5
	.xword	0xeaf73cf29d118439
	.xword	0xb41fc2c7d3e38343
	.xword	0xf099230f6cfb12cc
	.xword	0xc3bc72024db506fb
	.xword	0xd31751f5ec3133e8
	.xword	0x8120c2d656dc80e1
	.xword	0xc4f30c42b9e28ceb
	.xword	0x0d7cba9f7888024c
	.xword	0x8e20c1dc28956ad3
	.xword	0xeeb919538593d9cb
	.xword	0xeb031a78cc3a560f
	.xword	0xd23a8980d05dc808
	.xword	0x3e1267c78ffaf9d8
	.xword	0x99a397e69583184b
	.xword	0xe469f0f5afae61dd
	.xword	0x2fa99b84e70e0041
	.xword	0xc090e2dbfaa0ef5c
	.xword	0x4bedb383d308d8a3
	.xword	0xfe4cb114e498654f
	.xword	0x384f3211139eeb79
	.xword	0xa23ec783712e5fd5
	.xword	0x53fc5ca20e73049b
	.xword	0x1079cd3e1ed8a091
	.xword	0xcb1626540fbd470b
	.xword	0xce6ee07624f88f93
	.xword	0x8b21c2eaf51f95a4
	.xword	0x05a14ca7a5a3566a
	.xword	0xbcad087ddc1598d4
	.xword	0x623c427a1a28e71f
	.xword	0x5d9cdf3923949aae
	.xword	0x2d6a19ee8d8bc97e
	.xword	0x70ed056b565ec47c
	.xword	0x3dcf2db3c6b1d8e6
	.xword	0xe442688f4b9ff2f5
	.xword	0x2d5eaa24641aeee6
	.xword	0xd18bc9568f066d55
	.xword	0xfeeaf5107c8dbbd3
	.xword	0xc999afa6fd57d6fb
	.xword	0x2a938dc087365788
	.xword	0xcb123870f392fa72
	.xword	0x5d233678345b377d
	.xword	0x1e73b42656151676
	.xword	0x3ee44e7a206c4838
	.xword	0xe560475a63889abb
	.xword	0xad2012f2a916fadd
	.xword	0xd53ba6e69ed861ad
	.xword	0xacf7220f5ca4709e
	.xword	0x7e3467bbdffb9b2e
	.xword	0x6b0ca47549dc533e
	.xword	0xaf118c0230546c4a
	.xword	0x058f2749bfd054cc
	.xword	0xe57c0d9cc3efbdf7
	.xword	0xba61441d5081c2c8
	.xword	0x68a7d8c2c7a028b8
	.xword	0x58a2adbcaaa74db8
	.xword	0xa8285a555ad9dc1b
	.xword	0x2ccd98f84307e86b
	.xword	0xe4340822ea422000
	.xword	0x7f775c9d51c4636b
	.xword	0xb10504140359fadd
	.xword	0x9797eaa3931d95d8
	.xword	0x56f6c3822cacb5e5
	.xword	0x7c5cc2e554b8b42f
	.xword	0x615d50b0fa293c0f
	.xword	0xe0669b46f338c74e
	.xword	0xeff944b1fd31ff7d
	.xword	0x2e0beba2f2c0a1ec
	.xword	0x3aec53f2f5c3b764
	.xword	0x8e736a1f6e729b0f
	.xword	0xfd401c4fec29beb5
	.xword	0xd2bb29e0d15b6ccb
	.xword	0x9ae24656def9f0d6
	.xword	0x167f65011fd89643
	.xword	0x60cf16d874f26862
	.xword	0x04f0b4a7b945a4de
	.xword	0x38b2e7125c7b85aa
	.xword	0x6eb8afbd866659dc
	.xword	0xa0fa8a0d0659e620
	.xword	0x3c553ea354c6bcfa
	.xword	0xf20c6752e87c2cdf
	.xword	0x5008b874e7c4e97e
	.xword	0xb3d5cdb8154a7e1f
	.xword	0x1e6b65a9fd78cf4b
	.xword	0xe297d9d70ffb983a
	.xword	0x08fcf4c6160f7fb6
	.xword	0x72dcb40c29bb8014
	.xword	0xbc6ca6ae5da9b9cd
	.xword	0xb7ed28cbda5042d9
	.xword	0xae3c02156a1726f7
	.xword	0x782f27ede7eea8d7
	.xword	0x5744a73f092e4a9f
	.xword	0x6524181d953538f2
	.xword	0xcda625cf2b3169bf
	.xword	0x5a3860571e945ad2
	.xword	0x2f7c3484445fb515
	.xword	0x09bbd04490604b66
	.xword	0x83749f384119b5e7
	.xword	0x8a203aeec89c925d
	.xword	0x000ddd83a252aa40
	.xword	0x9c855245ed9e94e6
	.xword	0x2ce56bfb191b77a0
	.xword	0xfe1695d9de79767d
	.xword	0x53e9b334c99166fe
	.xword	0x8da1e6dd19f8d766
	.xword	0xe658e6a34da1ef66
	.xword	0x18200cb52ab78307
	.xword	0xbb2aa99da17645ac
	.xword	0x374f1bf8f8a66b4e
	.xword	0xf2d8bd0dffc9e00d
	.xword	0xc44a7f97fc546dae
	.xword	0xe4727582ab802106
	.xword	0xa95ccf96a1f078d5
	.xword	0x90d4f469be7d05a2
	.xword	0x1c224e0bff99a083
	.xword	0xef7f5d83f8ff6891
	.xword	0xd53b7ade0d404d2a
	.xword	0xba326c763d5dc61f
	.xword	0x141b0d7535ad895f
	.xword	0x3defc0a3b928a6d1
	.xword	0xb10b6a4016d74c2d
	.xword	0x40e85f95d3f6f02d
	.xword	0x13a80ae634121b37
	.xword	0xa8e49f7842dc4617
	.xword	0x4477f319af904bc9
	.xword	0xb7d9853d27d73229
	.xword	0xa819e0ce7247330e
	.xword	0x288c5fdaf5932a61
	.xword	0xce6a98d50e4e8479
	.xword	0x14cf27dffd326ee8
	.xword	0xb8c4e251f38b4e69
	.xword	0x90012ff78bfb82d2
	.xword	0xc8f05559fbf59f95
	.xword	0x18c77375863adef2
	.xword	0x4fbe7ddd832c62df
	.xword	0x198aa64fa67e9486
	.xword	0x5bdc3d7479f3ddef
	.xword	0x19bb486fe4870e57
	.xword	0xf996765c8306f263
	.xword	0xe3dbe9d2f50a275d
	.xword	0x20836bb5acfa3949
	.xword	0xc873853f34608942
	.xword	0x2f6399e4a3798575
	.xword	0xb0f18d477281dd8e
	.xword	0x13d98ec30deab1f6
	.xword	0x4b2509ea04171fd7
	.xword	0xb8aa81256173a6fc
	.xword	0xd7ede5dee8b9a002
	.xword	0xbe604f8323245a0d
	.xword	0x2b2ce6cc107db0a5
	.xword	0xdf48e37a8f4ff8c7
	.xword	0xba3d44e2af0253a7
	.xword	0xc539f9fe7f151887
	.xword	0x973679f952b0259b
	.xword	0x984fd8f74fc870de
	.xword	0xbadcd6b76dc2ec5f
	.xword	0x884ba99ea6549116
	.xword	0xa4ff5c6267d5d1a1
	.xword	0xa31a8c98595fb735
	.xword	0x45460e2785ff73da
	.xword	0xb1bd081f293ddb9d
	.xword	0x5a532a76e5a8ae10
	.xword	0xe7d2b919b4c55af0
	.xword	0xe72874a3711eec97
	.xword	0xafde222a521e201d
	.xword	0x7587e9abe3ac51da
	.xword	0x27ff1f9d3d5b34da
	.xword	0xefa152d69b818647
	.xword	0x4d5f0ddd6cc0aac2
	.xword	0x6738964418f39b83
	.xword	0xcb8adf995d17f5c5
	.xword	0xf866c46ee02a0c58
	.xword	0x81427c7855274253
	.xword	0x1173e5688bd6e35e
	.xword	0x869848f9de488fb8
	.xword	0x1cbfb5c833d207c0
	.xword	0xa30e6dd9e279f281
	.xword	0xb64a4e32ded7aa40
	.xword	0xc5d70384798ba2a1
	.xword	0xebf79809389d102d
	.xword	0xbd83d7701b015739
	.xword	0x3d0cf24b13f682f5
	.xword	0x983556b1b6a8cec9
	.xword	0xf4fb0ad4965c315d
	.xword	0x1f16589a85c02c76
	.xword	0x8ea6851d7e16d4a9
	.xword	0xaff67d378b50d868
	.xword	0x2a8db67ff38307e4



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
	.xword	0x9ffab52875c0ba10
	.xword	0x8d2ce16bbd3ea44e
	.xword	0x176c12a55716cee8
	.xword	0xb01a90fade3f1640
	.xword	0x5f7da377f092fdcd
	.xword	0x7dc6a7e38e11c5a3
	.xword	0xdf42736dee927bc1
	.xword	0x0198fe3ed5f44bd4
	.xword	0xdd957f46a6ad0dea
	.xword	0xa3256e340700528e
	.xword	0xc87ec8df5a42298a
	.xword	0xd96d948fc307e5e4
	.xword	0xb0519b0c5a851f61
	.xword	0x700e3275e1611f29
	.xword	0x3e94cc2c9fa70eb6
	.xword	0x99700a53e81359f3
	.xword	0xe6e15a20ac53a367
	.xword	0x85c8539d0ebe46dd
	.xword	0xdbf0d907c3f87216
	.xword	0x07f290bd6a77b827
	.xword	0xbe21a10ffd18a8ce
	.xword	0x03bb6d61d32a5a7a
	.xword	0xe0c467f3e3e27912
	.xword	0xa1ce54d75337789e
	.xword	0x462f04ba61fe9c9b
	.xword	0x90b2a9e44a615dfd
	.xword	0xb71780ffc102321f
	.xword	0xce0d4941110eac77
	.xword	0x2c275372031386e0
	.xword	0x3fe4d21fd4a1810e
	.xword	0x010f5ffcff2d850f
	.xword	0xaae05260eaf9d8d5
	.xword	0x56c388ad2667028f
	.xword	0x698d5d455e01b9c5
	.xword	0x787aedb6a39ba188
	.xword	0xcbb5cf249a23e38e
	.xword	0x0b917ca632755d2d
	.xword	0x3420d9bc20f4aa31
	.xword	0xe0881d1a0ad0b980
	.xword	0xfbc84db9c9260b81
	.xword	0xbcd1753ad79c4991
	.xword	0xe0650c1eddf59f43
	.xword	0x0e390afaf97a47f2
	.xword	0xaaa03973ad65168c
	.xword	0x74de44fcd465052c
	.xword	0x10c30dc079811d42
	.xword	0x67409edb1eca0e8a
	.xword	0x6975621ac6d25c3b
	.xword	0xfda09819e83198bc
	.xword	0x0a09738604a4680f
	.xword	0xe79eea3f0bddee58
	.xword	0x929d07ac761b72bc
	.xword	0xe2b15e6bb6950e90
	.xword	0x2b52c295f6e2e209
	.xword	0x7a5f41aa65472807
	.xword	0x6ce11a5f5de3bdcb
	.xword	0x71590d3bc8a62eee
	.xword	0x439e3b1857ce5ed3
	.xword	0xe58af854464eacd5
	.xword	0x0c8198e8d1bc0350
	.xword	0xf22629d139fd1ec6
	.xword	0xaaf8402372bcd81a
	.xword	0x66e620a51ac8c553
	.xword	0x189fe5e8f38fef69
	.xword	0x7570eb8e7c3dfe50
	.xword	0x13f77d22aa75b2c3
	.xword	0x5bf142e211470d00
	.xword	0x37fedd2eec86d46e
	.xword	0x3bfa477dbbe1f729
	.xword	0xbd61112f771fe44b
	.xword	0xd8e97a81f0db74f5
	.xword	0xd2b08c20095219dc
	.xword	0x052aec3bba95de6f
	.xword	0xf673be23b15088b1
	.xword	0x7625ae9229f8a5f5
	.xword	0x0fff9b1cff498ab6
	.xword	0xc812ef586c39af6b
	.xword	0xf41593c8e65697e9
	.xword	0x52a893ec63963015
	.xword	0x1d934fc9aa121b6c
	.xword	0xc187630a7230ff03
	.xword	0x33126a68ed639664
	.xword	0xf6d2e0beacd6aeb3
	.xword	0x521583eff4f368b3
	.xword	0xead1ceaee32efb00
	.xword	0x73f6a7ea525485e5
	.xword	0xe9776008eaf17c23
	.xword	0xbe1f9febb8f803db
	.xword	0x2668626fd70713a8
	.xword	0xcb8853e398250114
	.xword	0x7c72a4ff23177f50
	.xword	0xf0c6b195d0daa7ef
	.xword	0xbc7b4503b09e156a
	.xword	0x8122834236fb5ee0
	.xword	0xd9a314059543d17f
	.xword	0x7f8b83a6b5d6508c
	.xword	0x26446ccaaed94f45
	.xword	0xd0953e6634fb800c
	.xword	0x9dd519be4fe28a1a
	.xword	0x97ba61e74776106f
	.xword	0x314fc4761d7c6d7c
	.xword	0x647d3297881f3378
	.xword	0x017a5720a73a47bc
	.xword	0xc90e26c0741bf123
	.xword	0x0ec9383db83e4317
	.xword	0x335514ba73055969
	.xword	0xafbeca46af5301f9
	.xword	0x292827a8da8c365c
	.xword	0xc2283103519d6d34
	.xword	0xc7b4c068bbbec0fe
	.xword	0x3912dc249533bed1
	.xword	0x52156592d0cd0a27
	.xword	0x1e1263d3ba767d5d
	.xword	0x1a1b65606bad4f2c
	.xword	0x146a325aa6d8a54c
	.xword	0x1e25ce1469506aeb
	.xword	0x607111ef556fa018
	.xword	0x7d6b4c797fbec1e1
	.xword	0x2b1e3bab34b00bce
	.xword	0x3d838496dbd494a2
	.xword	0x4ef81dc9c1d4c2e3
	.xword	0x453fe53b09979af6
	.xword	0xf8d0df6c78639d88
	.xword	0x94f6d5eb7edc751c
	.xword	0xf0353fddee58e4c4
	.xword	0x47f722f024ec79db
	.xword	0x83c5c6b60b7bba91
	.xword	0xbd5a595242c8a75c
	.xword	0x61be4b44c7459a98
	.xword	0xacc7a664e1f26786
	.xword	0x33f3135614128489
	.xword	0x476fe2700dd22e7a
	.xword	0x2bf966fb3b9fa58a
	.xword	0x81678c7b1b2d79db
	.xword	0x245042f842f5df26
	.xword	0x7980095a5e330a4d
	.xword	0x6673531f7776aaa1
	.xword	0xfb9ecf567f57a1b7
	.xword	0x45834c069e71275a
	.xword	0x02a851ccdf482f97
	.xword	0x51af9884424df032
	.xword	0xb9cd5f5e5cd28ab6
	.xword	0xcfa02a0220eb0037
	.xword	0xe4d88d80f6359d4c
	.xword	0xaf961948f9a9586e
	.xword	0x7753e1d9b4d61f00
	.xword	0xec760a27aca36801
	.xword	0xd6554aae4f32934a
	.xword	0x8757a599b35605d0
	.xword	0xf0080c0ff9bbb94b
	.xword	0x852e7e0fdac310eb
	.xword	0x4e6710f0f140e372
	.xword	0x70b16c6bf95fa257
	.xword	0xeefb65ef1bd2a1d1
	.xword	0xdec75277065aa0f8
	.xword	0x5e7f8ab3d0e89960
	.xword	0xf0ec565664a81221
	.xword	0x9d9bfb55f2f36cd2
	.xword	0xf77ba929e92e19e7
	.xword	0x3e5b6f0bf768f380
	.xword	0x65db3982913d6091
	.xword	0x62df5b7005a693af
	.xword	0xa6b808a3881dfc9a
	.xword	0x4bf0048ebc25487c
	.xword	0x258e7811883433b3
	.xword	0x5c5168125b5118f8
	.xword	0x8bec5b53ed3e8763
	.xword	0xa29c31a1289def9c
	.xword	0x5dae9f9704587cfc
	.xword	0x7e6c3a8ff91baea5
	.xword	0x7c8acb1efc1f9fc2
	.xword	0xf724a9e8bb403d97
	.xword	0x21599a697716cae1
	.xword	0x7a985d9e5e93dad9
	.xword	0x31d3f0f66de6236a
	.xword	0x4fd720ae809c9ce0
	.xword	0x7f54f7e487c418f1
	.xword	0x7a1c620605aaa36a
	.xword	0xa6b055268104a252
	.xword	0x048e8cf9d4da4fe6
	.xword	0x5e2336d0c2dbc5db
	.xword	0x7bc13e280e041e83
	.xword	0xd363d197ee01faf4
	.xword	0x243331946e009009
	.xword	0x20bfb7ecaf6908f7
	.xword	0x8aa9beacedf2aa90
	.xword	0xf63218cb51939bac
	.xword	0x90ac27adae16c959
	.xword	0x8669f5d154e75131
	.xword	0x46ef2888ef7b4097
	.xword	0xc11603bd399e4b9d
	.xword	0xe8acf9d1797fb44c
	.xword	0xfc83a3cdc626120d
	.xword	0xef29fc600e78fb0c
	.xword	0x518eb5b89f83728a
	.xword	0x81f9ba69b1d3e226
	.xword	0x104fdd8759c535f9
	.xword	0x8fe1ca0418268cf0
	.xword	0x70ada93b9c52aac8
	.xword	0x1a938bfd0aa28191
	.xword	0x61e0629a2f2ed72f
	.xword	0xfdf9b672f8ba7fe6
	.xword	0xd8ed34b94fe60e57
	.xword	0x48caf30c904c1081
	.xword	0xb7266e9de1fd1556
	.xword	0x40b95ef83316f5fb
	.xword	0x6e3747a99ec83a5e
	.xword	0x139c60486a807132
	.xword	0x920809dcf15f7588
	.xword	0x4ea3eb15ebd43696
	.xword	0x9a987a3f835bcc0c
	.xword	0x3572c8a4fb66bd3e
	.xword	0xd9324de9036a8891
	.xword	0xbf0e6cebcff0eaec
	.xword	0xb8bbf57bbaa991ca
	.xword	0xe231577e2206eadb
	.xword	0xccf1c6e7797b0dcb
	.xword	0xdef96c115799a89b
	.xword	0x9b3ce7334757049e
	.xword	0x8e6c255c3b4b046d
	.xword	0xa0f4e45d76e3e336
	.xword	0x20610c90f96fc067
	.xword	0xe4f50a0b4cba615a
	.xword	0xdfa8fc9d288eaee8
	.xword	0x11e5ff0faba3c143
	.xword	0x28de1a9f014ca3db
	.xword	0x5e065cdb65aacf40
	.xword	0xa14a7edf28d74289
	.xword	0xc60b756d723bb40e
	.xword	0xc7f06ad6dfcfbb91
	.xword	0x518986b18150ff8a
	.xword	0x458a33e6b919a5b3
	.xword	0x033728f2fa03f5de
	.xword	0x96a49df6d7cfc29f
	.xword	0x05957f75c5486794
	.xword	0xf63ad79d195e7d73
	.xword	0x14bdf30fc78f7828
	.xword	0x2d4992be39caaedc
	.xword	0xa89261845d50c43f
	.xword	0x369f20e5c0adbc62
	.xword	0x9566c0fe516bc9de
	.xword	0xe8721329b060d1bb
	.xword	0x9f7c5b8b1874cccd
	.xword	0xb3f2b54ead3d88e0
	.xword	0x021d9bbc26ac87e7
	.xword	0xb1d16bbe1037191d
	.xword	0xac8c26265c43bff0
	.xword	0xea6a6764835b50e5
	.xword	0x76cc34265f1ae656
	.xword	0x3f61e7f7df51f227
	.xword	0xeda69532b7199300
	.xword	0x61b5263f4688bc92
	.xword	0xbd0815a323b4ef4b
	.xword	0x95602b8c180e4c1c
	.xword	0x406702ae777c79a4
	.xword	0x26c216c32747b2f4



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
	.xword	0xddb4b8f8ee2afc92
	.xword	0xb547abeccd2f767f
	.xword	0x1e3e80d3b272ff9a
	.xword	0x2863f9aa48f11a1f
	.xword	0xf2f02e1c52e7091b
	.xword	0x4fdb4cb8299d35f7
	.xword	0x85e1556973dea1a5
	.xword	0xa1a6ec3997939a34
	.xword	0x3ccaadbcc6ac4954
	.xword	0xaa2c4ca0ff1b0a21
	.xword	0x66d5b97ecf5a6e50
	.xword	0x68216072e3dd286a
	.xword	0x4408ab6d8e5eb3b2
	.xword	0xb7a22917d45c9b97
	.xword	0x399210c46a3029d1
	.xword	0x21c3a631b9f8755f
	.xword	0x3b58cfd1f20d0f83
	.xword	0xb73146e8a30b78fa
	.xword	0x5411eb522b49468d
	.xword	0x1e533b50b05749d6
	.xword	0x35a193ce40ad1725
	.xword	0x869cacfad6319a5f
	.xword	0x5ca66800308c8ef6
	.xword	0x5339b91f7b3640b6
	.xword	0x82ff1b7e3361e217
	.xword	0x1b4fca6b50761908
	.xword	0xda951889b67d471f
	.xword	0x3175ea449a60e2b9
	.xword	0xa579de5d1fbcced2
	.xword	0x395c4c097a7aed70
	.xword	0xac0e2d6f9f940d8f
	.xword	0x2028f7ba5113d771
	.xword	0xb6607682cc6eabaa
	.xword	0xf44f4cff03c2fa07
	.xword	0x573e56aa153e188b
	.xword	0xdc4e918396b3d712
	.xword	0xc3c7b9859cd77e2d
	.xword	0x522e220469d9bb15
	.xword	0xa30acf60aa828274
	.xword	0x125693016ef1ba31
	.xword	0x96b8027e88ab4117
	.xword	0xaa88be7428d305b7
	.xword	0x6e1d9051b90b9dd7
	.xword	0x061d0bbc8e722cbe
	.xword	0xcc1aaeb612a019b3
	.xword	0x6a49c044a6b117ba
	.xword	0x0b9c75655c1be31d
	.xword	0xcfc6eaba7c697fe6
	.xword	0x6fc2fb7c543861f2
	.xword	0x3f821ade5369652d
	.xword	0x0258f37ea9163050
	.xword	0xa5d049f17a79b5f6
	.xword	0x2e88b376aa592d84
	.xword	0x6f90ab9181d7448d
	.xword	0x8133119b75532319
	.xword	0x7de050789767685f
	.xword	0x4b710abac02b03c6
	.xword	0x923d02ee651403f5
	.xword	0x326be2c566c86a4f
	.xword	0x3462b19a14ac7409
	.xword	0xd0f7dfe68865add4
	.xword	0xfa531acd0bde2d4f
	.xword	0xc69bf854acaf702f
	.xword	0xe8eaa7b5890116cf
	.xword	0x7051e0d11a7159c2
	.xword	0x845005a2dc7a3e0a
	.xword	0x0ded58bfb5824cb6
	.xword	0xf1b0c1339e598d5d
	.xword	0x1f033a5a27ee744c
	.xword	0x3f408b65d5db0b7e
	.xword	0x8797c1a93e6251a7
	.xword	0x3fd3e78e0c13d6bf
	.xword	0xc2777c68ea2b431f
	.xword	0x4a30e08008cb1bab
	.xword	0xb3e4101d0a0a7418
	.xword	0x2821c16bb5b4542e
	.xword	0xe5e22b9718e54294
	.xword	0xe818e3c35028ca3a
	.xword	0xb88d2b4dffac1294
	.xword	0x9e559019dd409f10
	.xword	0x56d4939bef22e98a
	.xword	0x63ff1133f54707a2
	.xword	0x8832f2e567dc407b
	.xword	0x6bf3ccbabfb20587
	.xword	0xf27322f621830e69
	.xword	0xa209d687f7a50aab
	.xword	0x660f8b581c50a175
	.xword	0xf22d917e0c14df08
	.xword	0x65816333bb0833e0
	.xword	0xd806575c342be3bf
	.xword	0x4c7b0972747024a7
	.xword	0x19e54dda2dfb94e1
	.xword	0x7a60fd14626b52f3
	.xword	0xcc58696acb193663
	.xword	0x2dcb5a25db1d6831
	.xword	0x8dba25ea1d62c55a
	.xword	0x486ed903a1370427
	.xword	0x24caafdd2a13d3d0
	.xword	0xde4f1b0f1d86517d
	.xword	0x3ca2f6d932030c5e
	.xword	0x9e89948c2b807e7b
	.xword	0x9c529f1b55cc35bf
	.xword	0x7728c9e71c5b3770
	.xword	0x6383fd0cab29e739
	.xword	0xfc4e07b8e99b0015
	.xword	0x4d83628a56015329
	.xword	0x8d0e0b555bd8039d
	.xword	0x9d30c6b27742a6fb
	.xword	0x717690123a451e86
	.xword	0x89e36ba969db7abe
	.xword	0x0b2cdd51a2a623e2
	.xword	0x1c8a507cd22b57bb
	.xword	0xace936d6bc6f8b7c
	.xword	0x481b46ca4306ed1e
	.xword	0x64fa20d6a322d287
	.xword	0x4ba464366e217360
	.xword	0xc07c7b2192adac55
	.xword	0xd3b4fead854c0d5a
	.xword	0x454f3909443657a8
	.xword	0x81a7413e311e3fca
	.xword	0xa2a37594130a6a43
	.xword	0x4f258ebc3ccb34de
	.xword	0xca3807987e9aec9e
	.xword	0xc58a19927491c6d1
	.xword	0xe6d6501783fe01d6
	.xword	0xb5d3cd581eb90bf1
	.xword	0xbbaa8da7a2df46f4
	.xword	0xcfaac500c45ebfd1
	.xword	0xca5bf0013e992c18
	.xword	0x3effc4a3356d5ba8
	.xword	0x9b35dcfa407c5745
	.xword	0x7dcffc65ebfad19b
	.xword	0xfe2a8b86a48d0d59
	.xword	0x5d05358752cb0af5
	.xword	0x883321d86c6e5180
	.xword	0xdfb3110dbab085ce
	.xword	0x921e1004e1dd8e24
	.xword	0xe5a94c9688ba00bd
	.xword	0x48b4c4be5d08c774
	.xword	0x4cfd2ffa889b4984
	.xword	0xf4ea5af577bc7b17
	.xword	0xbfc205b2d37fc5c0
	.xword	0x7fbc7807bffe1619
	.xword	0xa933adec39a1a2bd
	.xword	0x894950929f413e10
	.xword	0x7bb78707e81b8da9
	.xword	0x57df6ec77d376467
	.xword	0x92f763da0e21532e
	.xword	0xd8545feb4a27c118
	.xword	0x360b621b3c0e2591
	.xword	0x3ad3bdf949f527c0
	.xword	0x1ef5b48801e3584e
	.xword	0x192fc5f72a49a252
	.xword	0x574456c93354b281
	.xword	0x892c18604dd4c60e
	.xword	0x4e5060a06f98c2c4
	.xword	0x3c009406982fbfc5
	.xword	0x9f27fd901d5755d8
	.xword	0x946ea28ef9dff508
	.xword	0x6a5b7185c16281e0
	.xword	0x142f57f1a359ed35
	.xword	0xa2f94adee7945110
	.xword	0x498053cedb4ebc0a
	.xword	0x64cb47d1d29966ce
	.xword	0xe0b79e47d376bd7e
	.xword	0xb0f37476676ee422
	.xword	0xd491b529e80449ec
	.xword	0x6748198c1cf179a4
	.xword	0xbcae143e8feae9f0
	.xword	0xe76cc933809ca12e
	.xword	0x208a85b96e18dada
	.xword	0x31a4c1171b19d942
	.xword	0x93804b032050dd3e
	.xword	0xc4cbc81355b9f356
	.xword	0xe3552f285d35b4c8
	.xword	0xef0e719188bae048
	.xword	0x0a621c7b62e6e0fe
	.xword	0x8e6991962d368e5d
	.xword	0x794c424d508fce13
	.xword	0x922e305f56ee5ba5
	.xword	0x5201d98503ffb145
	.xword	0x93f724ac2d9c54fb
	.xword	0xb5bd1c21213f27b1
	.xword	0x78563217dba3194c
	.xword	0x5adaf616001fc549
	.xword	0xd4f362bcd951eb3c
	.xword	0x44297357a8fae883
	.xword	0x3535dd1749a1b2f5
	.xword	0x62a03e6ec0fa9b22
	.xword	0x437f08b28c28d1b3
	.xword	0x8fced8fde5612847
	.xword	0xc630d87b0b0f31b7
	.xword	0x08b3474fbd7c8699
	.xword	0x360163c168d6fbb0
	.xword	0x70f8a1df61cef4db
	.xword	0x25b68e66cd736a80
	.xword	0xf26e0fb7e449d4bc
	.xword	0x71aad76ed2c2cc2b
	.xword	0xa4ac7c48b1e1dd13
	.xword	0xdc42fad30ae2b0a1
	.xword	0xa585f88681a3b0f5
	.xword	0xe082ead1a054beb6
	.xword	0x55fe43edc114b3ce
	.xword	0x6ec591981a18b031
	.xword	0x0345245c7a967d4c
	.xword	0x0ccad06a856e1dd3
	.xword	0xd508a4573f8148d2
	.xword	0x89baee70f62cf463
	.xword	0x692d48ad13d67608
	.xword	0xcf7083759b184ada
	.xword	0x06b693f74fa11533
	.xword	0x2491cb6a1089fb61
	.xword	0xca12a22089e15427
	.xword	0x5c36314ee95b4264
	.xword	0xb6c9a1d6b0cdde6c
	.xword	0x1facfed3c0640e86
	.xword	0x83688481d0567b21
	.xword	0xc7ae6f583837aa6e
	.xword	0x96289ab168a1eb85
	.xword	0xe63a1cb70d9f3acd
	.xword	0xb1238a584e3aa0c5
	.xword	0x13690e67b50828c3
	.xword	0x7a60baff01c0b8b4
	.xword	0x869d327074f13d4c
	.xword	0xe4e3472ce8141145
	.xword	0x081f13efe1d05828
	.xword	0x4679d22372b8fe3d
	.xword	0x0f1ccbd99c0e0e90
	.xword	0xfc2bf5c7ef895ede
	.xword	0xea332b3ab42e095f
	.xword	0xb78b72e444cc9699
	.xword	0xc3b0014edebd9e20
	.xword	0x9920db867e6d090d
	.xword	0x8aede87d11409956
	.xword	0xe456ad8616f97027
	.xword	0xe4cecffddb7e6e77
	.xword	0x2d1561dfb75a2d41
	.xword	0xd8c87b7e7d7de0e4
	.xword	0x83ae69c5d8a69d53
	.xword	0xccd81364313ecd5c
	.xword	0x8d2b6c8b0213df13
	.xword	0x47728b6650dc3db5
	.xword	0x41784cad7e450463
	.xword	0xf2f7aed1ef65cba1
	.xword	0x46d1f750a4192318
	.xword	0xf0eaee1a0a74df5e
	.xword	0x3e86133291e0193d
	.xword	0xf4f913194ef2332a
	.xword	0x089e4d28e3902132
	.xword	0xb4b8be5cd43238cb
	.xword	0x41cda4599146c3cb
	.xword	0xb351e5a556dd1ae2
	.xword	0xfb9bb9dfbb1b0bcb
	.xword	0xa6d7bacc1b442ff7
	.xword	0xd54dfdbc350c2d3e
	.xword	0x7dcc90fd07006128



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
	.xword	0xebe8f62bb4f89d98
	.xword	0x678b4ed59ea63932
	.xword	0x02eeab618be42046
	.xword	0xb5b3c6fb6db00ce3
	.xword	0xb439dedfd96d170e
	.xword	0x9e76cb0e76150e05
	.xword	0xbfde06c6010e1625
	.xword	0xea789e28c5bb5113
	.xword	0x7dca6566cd9bda87
	.xword	0xf50d28ee60ac2443
	.xword	0xb0b1360c85f26bf7
	.xword	0xe521c98f72f21088
	.xword	0xb40d94fb5f334761
	.xword	0x9af8542d84b7b058
	.xword	0x6578947af20bec9b
	.xword	0x1b6b0045d88905c9
	.xword	0x9be553117aea5798
	.xword	0x02a75385b6ca8a96
	.xword	0x551f9b46b4709ee1
	.xword	0xcef4e529cfca1d63
	.xword	0x6bf546a87eb82098
	.xword	0xed0cd6a7a35db7ac
	.xword	0x533c1fd225822454
	.xword	0x0373633227e0d560
	.xword	0x07ce7ed7e7dbd16b
	.xword	0xae8a7cba97a1bb41
	.xword	0xf2706ab52a7ebfd7
	.xword	0x4a08b04c43c688e6
	.xword	0x4e99a6fbecd90ea0
	.xword	0xb83896641f639067
	.xword	0xa5c64f1b6d296e3b
	.xword	0x5191bcc0d7425cb2
	.xword	0x53d375dbec98ba23
	.xword	0x12ba65d2f5a4172a
	.xword	0x2faae131b6c66ec1
	.xword	0x7fa8867dfe43fbce
	.xword	0x3da0075b4830ff42
	.xword	0xcd18d33fa5b1c02a
	.xword	0x314a2ec06d832589
	.xword	0xee6cf9f41a82cddf
	.xword	0x9e730117abb290a4
	.xword	0xff920a83f4b5c45e
	.xword	0x19cb62cd3d4b6ce4
	.xword	0x527607431ee6393b
	.xword	0xa56644cf923df169
	.xword	0x016af2ebf8b58686
	.xword	0x1a401f9867e25dde
	.xword	0xde4ac3226384689c
	.xword	0x19a96344078d0edf
	.xword	0x6c1c40591f83c58a
	.xword	0x7ebefab3bcc7da3b
	.xword	0x0fd6a17e708ac2f2
	.xword	0x7b0da3617dbf9796
	.xword	0x208cf034a931c8d9
	.xword	0x83e643366af16cca
	.xword	0x931df458ebecece3
	.xword	0x82ecfbd829a5771d
	.xword	0xc5fe8470567409de
	.xword	0xa235d3e421b99611
	.xword	0x549bcbbfb73f13b1
	.xword	0x8f79537ad3db6771
	.xword	0xf41f9c01c1133b95
	.xword	0xcfcbce1b0ac83411
	.xword	0x3f400ede8705ed1e
	.xword	0x585d725dd2d9144c
	.xword	0xae0eff568f1bd84b
	.xword	0x673e9cfca3b1eb40
	.xword	0xb117732471e489d2
	.xword	0xac33d6b3756257c4
	.xword	0x9a6ebe531f14d7a5
	.xword	0x46068a3730825622
	.xword	0xa5c37195cc0b8247
	.xword	0x53ce75af23c8b6b5
	.xword	0x5a6a83139af09d0e
	.xword	0x171729bc81cc42b3
	.xword	0xa0f228603d892dd9
	.xword	0xc0116af6afa91a71
	.xword	0xa87f0276147b86ef
	.xword	0x38b42085999bdc5f
	.xword	0xae5853a62073f8f7
	.xword	0xaa3b076d4271f088
	.xword	0xdce8067d4111e83c
	.xword	0x32d94ecc00311f3f
	.xword	0xa624ec41b3585307
	.xword	0x32a49369ead1c65e
	.xword	0xa193b764b9c49894
	.xword	0xd25df10dee319b45
	.xword	0x9c825e986a372e8e
	.xword	0xd2e030d9c5050719
	.xword	0xb6cbb55588260477
	.xword	0xee58fa5c56d9f2ad
	.xword	0xe38de0f2f1778d69
	.xword	0x3a0c2a5edb424c2c
	.xword	0xc3474e2ee2fb9923
	.xword	0x0a81e9ecfabef514
	.xword	0x873c6ce741570aa5
	.xword	0xf9a308f2bd284591
	.xword	0x41598cf074310385
	.xword	0x6683d54bd6956c49
	.xword	0x239d1da593e4097f
	.xword	0x7bf1a09c56bfeebd
	.xword	0xef4884b50f12e8bb
	.xword	0x45ee8d6d0c38aee9
	.xword	0x73c2a7bd4f6238cd
	.xword	0xdb58adf02478df39
	.xword	0xa8b0a417e0ef71bf
	.xword	0xb48f84d8c8c66689
	.xword	0xf63be92e77555b9c
	.xword	0xd9076f6bb3b25cd2
	.xword	0x205faa258ec48624
	.xword	0x6234736717cd4b3a
	.xword	0x24fd50628883d064
	.xword	0x260becce312025ed
	.xword	0x7f0429dd59b2d0c6
	.xword	0xa2dc45805a063099
	.xword	0x0f3f3a469bf77f31
	.xword	0x57550cf5a0902491
	.xword	0xf98b13a3433ce36f
	.xword	0x300f32f417952c65
	.xword	0x0487dbeb17f3a24e
	.xword	0x1abd51166b902ab0
	.xword	0x17da2a8dcc028e58
	.xword	0xbb1853a084f442a7
	.xword	0xb67bc0e3324cd2e8
	.xword	0x1fd473e8d4e1f4e6
	.xword	0x1e25aa219c626e24
	.xword	0x4cfb952cfee57f61
	.xword	0xdcdaa8b578425f99
	.xword	0x0249b7e6127c2a8c
	.xword	0xb2d3a3059c32aa94
	.xword	0x9eaa46f55552a476
	.xword	0xd236f44a3c11410d
	.xword	0x540cfca6dfae4d4f
	.xword	0x86a49b681c0b7c82
	.xword	0xa2e8977fe45447c3
	.xword	0x3e6180b5b3157b1a
	.xword	0xf20001eec1f56e31
	.xword	0xfac6e791f46ae0f3
	.xword	0x95c030b7260da9b9
	.xword	0x07841221a41dee28
	.xword	0x2dd0cf3a32575c18
	.xword	0xc37bb0647e39df6c
	.xword	0xc15fff2da6527cc7
	.xword	0xf1906decf8c332d0
	.xword	0x7584f91c024bacfa
	.xword	0xe4ad3739cafd242e
	.xword	0x766da2c7c06a3c8d
	.xword	0xd7703ba2ae9ea432
	.xword	0xf248c809ca9ce3f2
	.xword	0x7c06b4cf21432b1e
	.xword	0x1521e06ccff2effe
	.xword	0xfe1721615e6ea696
	.xword	0x615e81ad91bf077b
	.xword	0x287c13169c7039bb
	.xword	0xe9dcbdcfcfecd090
	.xword	0x93713e0653561453
	.xword	0x30888fedd2c6eb5a
	.xword	0xf024c1fe02ba9ff4
	.xword	0x74647d661b13ea3c
	.xword	0xc6f023515ccf1c0f
	.xword	0xe4764a47e6e8a012
	.xword	0x4d54cdcd4c20c9c7
	.xword	0x88a6d08df8e80966
	.xword	0x0ab77a3d94f8d427
	.xword	0xea8a213f2a0106ae
	.xword	0xd9f10d4143f78f15
	.xword	0x7c15496080570b5b
	.xword	0xc5ba36d8744fcd84
	.xword	0xbb5832fb96cb08b3
	.xword	0x9e51ba6d3ce2415c
	.xword	0x4addd4aa3067c892
	.xword	0x91f5ecc1c4cd8a20
	.xword	0x52bf5f14fbf40f88
	.xword	0x16769a61c970412d
	.xword	0xda822f13c57d5310
	.xword	0x166e42abc52b8f90
	.xword	0x1d87c9810f6220eb
	.xword	0x2ed2cda7bfc4c2ce
	.xword	0xf409842b59162903
	.xword	0x1515a07fceadf406
	.xword	0x5d42a356790aed07
	.xword	0x6cbe42b4420a64e2
	.xword	0xcafe6b30b2fb617a
	.xword	0xc8b416aa8f616ba9
	.xword	0x25e0b1fb3f0ca574
	.xword	0x05f5bd0bcad16ead
	.xword	0xe823f3267cf054de
	.xword	0x1d5f3d345fd1691a
	.xword	0xc94316b084b73b76
	.xword	0x15b6ca3f755f136c
	.xword	0x3f1ce686718dcf45
	.xword	0xde43ca28e72d7dd8
	.xword	0x4a18d83f2504084e
	.xword	0x103dce1358f89feb
	.xword	0x4a52df137a92bdb8
	.xword	0xdc10b5bc8f6e2b5f
	.xword	0xb60d41a63f14455b
	.xword	0x4a9c8c49ab1aa6c1
	.xword	0x2fab4817d62898a8
	.xword	0x4a48de2656a33a31
	.xword	0x73487f3df7e47647
	.xword	0x83bd458f637869e2
	.xword	0xf8ff1377ab07a9a2
	.xword	0x4664440dbd7802b7
	.xword	0x9de21d1b22835505
	.xword	0xdfbe82fe50f1edf0
	.xword	0x04b9464553e11593
	.xword	0x9ddb83e3ad551db2
	.xword	0x909420489cf682e1
	.xword	0x5286614458854cd1
	.xword	0x00b42e7d347e54b1
	.xword	0x2b6c727c2b384dd6
	.xword	0xe2d7ac755e7c7ef6
	.xword	0x0fe4b33ed276583c
	.xword	0xf5a6768e60672626
	.xword	0xd804714349d5f844
	.xword	0xaad00c7168116d00
	.xword	0x327bc5825424db34
	.xword	0xc24934f31580310e
	.xword	0xa5810b03837ab9e4
	.xword	0x140d2160f5302f7e
	.xword	0x596736fc243893fd
	.xword	0x31223daca93b9e2e
	.xword	0x3765074d3f8e2762
	.xword	0x7491aeeb4a3bd684
	.xword	0xcf1fe842cdb9c807
	.xword	0x861178382b659457
	.xword	0xb24a4cc80e183809
	.xword	0x53c29517cb9f66c4
	.xword	0xeec1f02e9fa1b9a4
	.xword	0x068797c6d403274a
	.xword	0x706ebdabe300c555
	.xword	0x709b553916697480
	.xword	0xe2296d186459a567
	.xword	0xe94ce36e4ee75fae
	.xword	0xdc7b99b14ab308c4
	.xword	0x58dc8b45785fda45
	.xword	0x8a0b51166355e271
	.xword	0x880a44fcbce1e6fb
	.xword	0xdf622c68670efc7e
	.xword	0x765e6b5ebc6d7fa9
	.xword	0xe70392633af75a0f
	.xword	0x53525ac767179ac0
	.xword	0x3f9ab483b3e8f908
	.xword	0x19840a230889c42e
	.xword	0x97efe28acaad4c0a
	.xword	0x5d44aa49972c4bc3
	.xword	0x268f2b64f259984b
	.xword	0x0ea84cfccea7dca4
	.xword	0xbc6e71d845de3ea7
	.xword	0xecf74cc25dbc9cde
	.xword	0xa7727c80d0cf2b5b
	.xword	0x0b8c980f64e3c2a2
	.xword	0x42c9dc3c3fe1ade4
	.xword	0x98daa40b567f5f48
	.xword	0x62c7332e8311b90d



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
	.xword	0x97f5265f4c93167c
	.xword	0x0b69fcb53f64180a
	.xword	0x89cb4a58ee3baf90
	.xword	0xedafc0e10225f3e2
	.xword	0xd7b04af713f624db
	.xword	0x83405725adcdd80e
	.xword	0x91b91b72127fec16
	.xword	0xddc8dc931e7804be
	.xword	0xd460dd807b86ecb0
	.xword	0xd358c66fefb12b90
	.xword	0xef66750fede65605
	.xword	0xa686593789e0ca02
	.xword	0x63d2f0d9123a90db
	.xword	0x73fdd29ada8e7646
	.xword	0xc0da248cc775b03c
	.xword	0x0c4d4a88b61a2119
	.xword	0xc5d41f47d413fdcf
	.xword	0x93bfa84cda8467b2
	.xword	0x10676a17fb9fa2de
	.xword	0x39b86002f64b033e
	.xword	0xf46673a7e7287ca1
	.xword	0xedc2a1ec01fbedd4
	.xword	0xba958a6b86370f04
	.xword	0x19fc819636df8e27
	.xword	0xec97abeb21d8ea95
	.xword	0xf7090529961b0f40
	.xword	0x125a7b293232e345
	.xword	0xc0f739853612e1e0
	.xword	0xdb5181c2b40750dc
	.xword	0xd97617292eb794fb
	.xword	0x6df18e548ede0e33
	.xword	0x758c810ba046e3a0
	.xword	0x5f1d989dac968ebe
	.xword	0x60e11157a81dee59
	.xword	0x4bf41f3e6e59ec11
	.xword	0x00d51fd5293db300
	.xword	0x971665334675dd58
	.xword	0x14bf2e451d776dba
	.xword	0x700deeec979187b7
	.xword	0xfd9182756fc63651
	.xword	0x3cfd79626836c195
	.xword	0xe90adc62c6dd8581
	.xword	0xdeaddbe815a79ba7
	.xword	0x2681102384d3d5fc
	.xword	0xf4bec502817a8ddd
	.xword	0xde09616d15a389c4
	.xword	0xf8fadf473602f193
	.xword	0x24720697429aad64
	.xword	0x4bae0fcc00ff0f3d
	.xword	0x66d9d70624256252
	.xword	0xe255c179e13db0fa
	.xword	0xf36a09b79e69f04b
	.xword	0xb827154bd09b531a
	.xword	0x4df0cc2a14986b2b
	.xword	0xb2f3853c64a7a727
	.xword	0x49902593854d587a
	.xword	0x4c2ecc3e202c18c5
	.xword	0x54c261081bac6151
	.xword	0xe710383c07203e9e
	.xword	0x76f184dfd392b75e
	.xword	0x9e0032902c785bc3
	.xword	0xbb09df568b0db4a2
	.xword	0xbbc8b7c472e98a38
	.xword	0x3f1104efa38649b3
	.xword	0x3f14a0a888a061d2
	.xword	0x38ec612a8e3ec19c
	.xword	0xdd26aa2cb1432492
	.xword	0x1894b8cdbe8f5db1
	.xword	0xcbca4c6714906649
	.xword	0xb9a4089786ddac7b
	.xword	0xcf8998602b10224b
	.xword	0xad2d55ac30dad816
	.xword	0x52a817fcf093e884
	.xword	0xcb9173c4c4e32320
	.xword	0x94ac8bff78b739dd
	.xword	0x7bb272462e666be8
	.xword	0x4d84f2c646a6f4f3
	.xword	0x69179df0cfa292b4
	.xword	0xe45e5bd0db055565
	.xword	0x49b7f8c3847f6df9
	.xword	0x1a58434fc071f209
	.xword	0x498a5b37bc3e2c9f
	.xword	0x0f0d98c030406dca
	.xword	0x620572cd97fadabf
	.xword	0xf1fab03d9e4945a1
	.xword	0xc6c1a198ec4e928f
	.xword	0xdacba130f95471fc
	.xword	0x83995b3da0bb3669
	.xword	0x6252aaea7a83d321
	.xword	0xf4b84a014e4081ee
	.xword	0xcd11fa38a21a579f
	.xword	0xb4c192a22aed2235
	.xword	0xeb3efb99e893b299
	.xword	0x5e1462300b291632
	.xword	0xdc5e6af7fdfd709a
	.xword	0x1b42e1dcab6ea9f5
	.xword	0x8007adca14e19bed
	.xword	0x456757c771b64d31
	.xword	0x39ea63504a1c9b1b
	.xword	0x0ceebe4ad40ec362
	.xword	0xe194a327ef8ea04a
	.xword	0xea5fe4f6e5b143ac
	.xword	0xc2974bd4253a55b7
	.xword	0xcd2543ee62e8c6e0
	.xword	0xa05e89bfc2dd50a4
	.xword	0x8d270a54c164ce06
	.xword	0xedd3b008ada3c976
	.xword	0xd36f641238d6a886
	.xword	0x6361aa7db4d81a0e
	.xword	0xf813670c52f75e75
	.xword	0x4e6fca1fb7f77f06
	.xword	0xee5f970f5b04bc8e
	.xword	0x6b4930c9bcb8255a
	.xword	0x51eaa08a9fdea573
	.xword	0xbb6d3abde08d088e
	.xword	0xa48995ed94fb9d40
	.xword	0x5738026216f6a09a
	.xword	0x1c37da82aca522d7
	.xword	0x6a9e3c24b0c54d96
	.xword	0x722bacd07658402c
	.xword	0x8b01a9732e0a5efe
	.xword	0x1055cc9cf4aa120c
	.xword	0x62214d76d54dd84e
	.xword	0xdb665c35ef307f82
	.xword	0x6cd735bebed2b5ee
	.xword	0x05a59c80d05e30cb
	.xword	0xaf79f80cfdd3eb3d
	.xword	0xde75a298e7488025
	.xword	0xad63fa51907b42ac
	.xword	0xc7a87f65a9fd9b26
	.xword	0x9c8878326a625922
	.xword	0x9bd1300906462364
	.xword	0x757bfbe6d3ae3666
	.xword	0xda266a82c5d3e7fd
	.xword	0x29f4cc37391ea74f
	.xword	0x7ae36ea0320b3124
	.xword	0xecd581b777fe4c12
	.xword	0x2e8e0be63dc6fc04
	.xword	0x7d5a71bc3781f92e
	.xword	0x315cf4b04bb97a05
	.xword	0x0a32fcc1f7bc4a5a
	.xword	0xb9c1018a7945ffc5
	.xword	0x3e93f9e3740a585c
	.xword	0x2ac478f033ced443
	.xword	0x137b7615865883ef
	.xword	0x1ca600004821ad0d
	.xword	0xff6be4b51d85a9d6
	.xword	0xb836322040bf7e13
	.xword	0x400377bb60611a4b
	.xword	0xc32292458aedb2a3
	.xword	0x443a91ebed70fc4b
	.xword	0xac69e5bf0164a338
	.xword	0x5fd93a57d1812f3a
	.xword	0x5545ce8c9dcf1c4e
	.xword	0xe803cf6706b366f3
	.xword	0x43549d20fcb6c3f1
	.xword	0x61cd72d002a5792b
	.xword	0x096a98af233884ff
	.xword	0x944ee84d31dafe17
	.xword	0xff07cdd12483f22e
	.xword	0x736e1bde6fae93ee
	.xword	0x3669a79300bfc7a9
	.xword	0xaa1745bb897333c6
	.xword	0x9c9f3508a5a9867c
	.xword	0xd875ffe016150556
	.xword	0xa4152dbf6126bd6c
	.xword	0x1cf48082bd787d59
	.xword	0x25779d20a3769105
	.xword	0x10777de939188492
	.xword	0xa08c519371dacea4
	.xword	0xe050e5f386d19350
	.xword	0x698bf4c953469a4d
	.xword	0x789cf47228fde207
	.xword	0x2d13443c2c33d9b9
	.xword	0x2c2399f9df57a202
	.xword	0xfda1d88071bbf457
	.xword	0xeae150cdc734b4eb
	.xword	0x90e7e6a7eacbf719
	.xword	0xbc7a046aaee2e60c
	.xword	0x36c8b0395b44c1a6
	.xword	0x363ed098b1a1bf1b
	.xword	0x09b6186f2b56166b
	.xword	0xa99b204c645dae7b
	.xword	0x5b335f7b9599a048
	.xword	0xffa21caf2adf7a68
	.xword	0x61b3062549394ced
	.xword	0x9d721a074b6ffbd0
	.xword	0x8b9847b4859eb57f
	.xword	0xff0b3faa055726dc
	.xword	0xef9b4857bc20a834
	.xword	0x61dcad7a98070c43
	.xword	0xddbbd8379231b609
	.xword	0x5deed19359c241ff
	.xword	0x7c0dcbf30de054e9
	.xword	0x0179038bb139f1ec
	.xword	0x6229aa18dbe295ce
	.xword	0x0ad8bd9a3a97e17d
	.xword	0xeb0997b1db64f5db
	.xword	0xbdd3e38753b068f5
	.xword	0xa72a3cb31ece6617
	.xword	0x502967e99082ffd9
	.xword	0x5b3cca99a4005c3a
	.xword	0x3f1f27d04eaed015
	.xword	0xff64ff164d721b6b
	.xword	0x4b5b43df8805df8e
	.xword	0x43aff68265b98d85
	.xword	0x0abda6ea21e37045
	.xword	0x3e89824247c67ed6
	.xword	0xf3634cc60cc42e80
	.xword	0x7117c3f842364bf4
	.xword	0x26ce7abc8c50f8b3
	.xword	0x8efd19c2f9ded2b3
	.xword	0x31aad03511eb7e1b
	.xword	0x33911e5cc0e7aba0
	.xword	0x50eee9dd94248a63
	.xword	0xbabf1209777aeb84
	.xword	0x355de3420f922268
	.xword	0xe30c681d227aaa12
	.xword	0xeb3a37921aa084f3
	.xword	0xa0f0f1451176bae4
	.xword	0x64529c84407d6da6
	.xword	0xbdde11c20ebbca9c
	.xword	0xb0cc36b636a2f5a9
	.xword	0x995210f8686b0ba0
	.xword	0xf1d7fbf2f3aeed3a
	.xword	0xcc80a4fdafc59c8e
	.xword	0x08e024cca9fa15f5
	.xword	0x71934ff0b4f3f148
	.xword	0x0e1bc070f5a2d94b
	.xword	0xffa1c07757aa730b
	.xword	0x617e8f01fa793257
	.xword	0x344e0c872c1dd4aa
	.xword	0xe79d13e5367719eb
	.xword	0x5d5ca8ee2c7bfbdb
	.xword	0x4d44098229e7dc0b
	.xword	0x260e54e519898ef9
	.xword	0x0673b59cf856b138
	.xword	0x2ec2bd6620bc99d3
	.xword	0xd78db4003b8e14b1
	.xword	0x69a3b8fdcb4fd47a
	.xword	0x17c83e648c40d4ae
	.xword	0x84e6d7b83e4f01b8
	.xword	0x9023c8dd480af2da
	.xword	0x1c5a3e02557501db
	.xword	0x540c4376f0b37900
	.xword	0x3fa6e4538ad22547
	.xword	0xfe005ef9ea6791a9
	.xword	0xceec6f384d6c6bdb
	.xword	0x77031c6d08eb5fd8
	.xword	0x00f6231e2d24ef59
	.xword	0x6fc2d3688ccc782f
	.xword	0x9d6f7cc10515e7fc
	.xword	0xb971edd12a86b98e
	.xword	0xc45d872e40176d42
	.xword	0xe82a2e8055e52e66
	.xword	0x92bab7fc7ca6a463



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
!!#   IJ_set_rvar ("diag.j", 103, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 105, wt_ld, "{30}");
!!#   IJ_set_rvar ("diag.j", 106, wt_st, "{30}");
!!#   IJ_set_rvar ("diag.j", 107, wt_bl, "{15}");
!!#   IJ_set_rvar ("diag.j", 108, wt_alu, "{3}");
!!# 
!!#   IJ_set_rvar ("diag.j", 111, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 112, Rv_Simm13, "13'b0 0000 rrrr r000");
!!#   IJ_set_rvar ("diag.j", 113, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 118, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 127, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 136, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 137, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 141, Rv_memaddr_pattern,
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
!!#   IJ_set_rvar ("diag.j", 157, Rv_jbiaddr_pattern0,
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
!!#   IJ_set_rvar ("diag.j", 171, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0010,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 184, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0011,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 196, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0100,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 208, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0101,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 220, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0110,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 232, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0111,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 244, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 255, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 263, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 271, ijdefault, Ft_Rs1, "{6,7,9,10,11,12,13}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 272, ijdefault, Ft_Rs2, "{8}");
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Rd, "{16..23}");
!!#   IJ_set_ropr_fld    ("diag.j", 274, ijdefault, Ft_Rd, "{16,18,20,22}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 277, ijdefault, Ft_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_ropr_fld    ("diag.j", 278, ijdefault, Ft_Imm_Asi, "{0}");
!!# 
!!#   IJ_bind_file_group("diag.j", 282, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 283, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 286, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 288, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 289, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 290, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 292, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 294, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 295, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 297, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 298, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 299, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 300, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 302, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 303, sjm_5, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 306, th_M, 3, 1, Rv_rand64);
!!#   IJ_printf ("diag.j", 307, th_M, "\tmov\t0, %%r8\n");
!!# 
!!#   IJ_printf ("diag.j", 309, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n", Rv_jbiaddr_pattern0);
!!#   IJ_printf ("diag.j", 310, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n", Rv_jbiaddr_pattern1);
!!#   IJ_printf ("diag.j", 311, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n", Rv_jbiaddr_pattern2);
!!#   IJ_printf ("diag.j", 312, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n", Rv_jbiaddr_pattern3);
!!#   IJ_printf ("diag.j", 313, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n", Rv_jbiaddr_pattern4);
!!#   IJ_printf ("diag.j", 314, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n", Rv_jbiaddr_pattern5);
!!#   IJ_printf ("diag.j", 315, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n", Rv_jbiaddr_pattern6);
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
!!#   IJ_printf ("diag.j", 347, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 348, sjm_5, "\n\nBA LABEL_0\n");
!!# 
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 353,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 355,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 360,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 804, th_M, $2);
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
!!#                    IJ_printf ("diag.j", 841, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 844, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 846, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 847, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 851, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 852, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 853, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 854, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 856, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 857, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 870, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 875, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 879, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 880, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 882, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 883, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 897, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 901, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 902, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 919, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 924, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 925, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 927, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 928, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 930, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 931, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 936, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 937, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 939, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 940, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 957, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 960, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 962, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 963, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 967, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 968, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 969, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 970, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 972, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 973, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 986, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 991, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 995, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 996, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 998, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 999, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 1014, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1017, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 1019, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 1020, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1035, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 1038, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1039, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1040, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1045, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1047, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 1061, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 1067, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 1071, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 1086, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1088, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 1090, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1096, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1097, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1124, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 1130, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1131, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1134, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1136, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1145, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1147, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1165, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1171, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1176, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1178, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 1196, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1199, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1201, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1202, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1205, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1206, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1207, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1208, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1210, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1211, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1224, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1229, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1233, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1234, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1236, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1237, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1251, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1255, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1256, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1273, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1278, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1279, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1281, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1282, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1284, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1285, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1290, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1291, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1293, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1294, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1311, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1314, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1316, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1317, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1321, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1322, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1323, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1324, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1326, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1327, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1340, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1345, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1349, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1350, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1352, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1353, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1369, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1372, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1374, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1375, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1390, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1393, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1394, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1395, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1400, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1402, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1416, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1422, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1426, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1441, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1443, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1445, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1451, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1452, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1479, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1485, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1486, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1489, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1491, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1500, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1502, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1520, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1526, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1531, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1533, sjm_5, "\n");
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
!!#                       IJ_printf ("diag.j", 1577, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern0);
!!#                       IJ_printf ("diag.j", 1579, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1581, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                               Rv_jbiaddr_pattern2);
!!#                       IJ_printf ("diag.j", 1583, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1585, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern4);
!!#                       IJ_printf ("diag.j", 1587, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1589, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_jbiaddr_pattern6);
!!#                       } else { 
!!#                       IJ_printf ("diag.j", 1592, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern1);
!!#                       IJ_printf ("diag.j", 1594, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1596, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                               Rv_jbiaddr_pattern3);
!!#                       IJ_printf ("diag.j", 1598, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1600, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern5);
!!#                       IJ_printf ("diag.j", 1602, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1604, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_memaddr_pattern);
!!# 
!!#                       }
!!# 
!!#                     } else { 
!!#                      if(random()%2 == 1) {
!!#                       IJ_printf ("diag.j", 1611, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern0);
!!#                       IJ_printf ("diag.j", 1613, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_jbiaddr_pattern1);
!!#                       IJ_printf ("diag.j", 1615, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                               Rv_jbiaddr_pattern2);
!!#                       IJ_printf ("diag.j", 1617, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_jbiaddr_pattern3);
!!#                       IJ_printf ("diag.j", 1619, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern4);
!!#                       IJ_printf ("diag.j", 1621, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_jbiaddr_pattern5);
!!#                       IJ_printf ("diag.j", 1623, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_jbiaddr_pattern6);
!!#                       } else { 
!!#                       IJ_printf ("diag.j", 1626, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1628, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1630, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1632, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1634, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1636, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1638, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
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
!!#                      rnd_cnt = random() %2;
!!#                      IJ_printf ("diag.j", 1650, th_M, "!DEBUG rnd_cnt = %d \n", rnd_cnt);
!!#                      printf ("!DEBUG: %d\n", rnd_cnt);
!!# 
!!#                      switch (rnd_cnt) {
!!#                       case 0 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1657, th_M, "\tldda\t[%%r6]ASI_BLK_P, %%f0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1658, th_M, "\tldda\t[%%r7]ASI_BLK_P, %%f16\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1659, th_M, "\tldda\t[%%r9]ASI_BLK_P, %%f0\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1660, th_M, "\tldda\t[%%r10]ASI_BLK_P, %%f16\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1661, th_M, "\tldda\t[%%r11]ASI_BLK_P, %%f0\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1662, th_M, "\tldda\t[%%r12]ASI_BLK_P, %%f16\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1663, th_M, "\tldda\t[%%r13]ASI_BLK_P, %%f0\n"); break;
!!#                         default : IJ_printf ("diag.j", 1664, th_M, "\tldda\t[%%r8]ASI_BLK_P, %%f16\n"); break;
!!#                         }
!!#                        } break;
!!#                       case 1 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1670, th_M, "\tldda\t[%%r6]ASI_BLK_PL, %%f0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1671, th_M, "\tldda\t[%%r7]ASI_BLK_PL, %%f16\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1672, th_M, "\tldda\t[%%r9]ASI_BLK_PL, %%f0\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1673, th_M, "\tldda\t[%%r10]ASI_BLK_PL, %%f16\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1674, th_M, "\tldda\t[%%r11]ASI_BLK_PL, %%f0\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1675, th_M, "\tldda\t[%%r12]ASI_BLK_PL, %%f16\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1676, th_M, "\tldda\t[%%r13]ASI_BLK_PL, %%f0\n"); break;
!!#                         default : IJ_printf ("diag.j", 1677, th_M, "\tldda\t[%%r8]ASI_BLK_PL, %%f16\n"); break;
!!#                         }
!!#                        }  break;
!!#                       case 2 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1683, th_M, "\tldda\t[%%r6]ASI_BLK_AIUP, %%f0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1684, th_M, "\tldda\t[%%r7]ASI_BLK_AIUP, %%f16\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1685, th_M, "\tldda\t[%%r9]ASI_BLK_AIUP, %%f0\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1686, th_M, "\tldda\t[%%r10]ASI_BLK_AIUP, %%f16\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1687, th_M, "\tldda\t[%%r11]ASI_BLK_AIUP, %%f0\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1688, th_M, "\tldda\t[%%r12]ASI_BLK_AIUP, %%f16\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1689, th_M, "\tldda\t[%%r13]ASI_BLK_AIUP, %%f0\n"); break;
!!#                         default : IJ_printf ("diag.j", 1690, th_M, "\tldda\t[%%r8]ASI_BLK_AIUP, %%f16\n"); break;
!!#                         }
!!#                        } break;
!!#                       case 3 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1696, th_M, "\tldda\t[%%r6]ASI_BLK_AIUPL, %%f0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1697, th_M, "\tldda\t[%%r7]ASI_BLK_AIUPL, %%f0\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1698, th_M, "\tldda\t[%%r9]ASI_BLK_AIUPL, %%f16\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1699, th_M, "\tldda\t[%%r10]ASI_BLK_AIUPL, %%f0\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1700, th_M, "\tldda\t[%%r11]ASI_BLK_AIUPL, %%f16\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1701, th_M, "\tldda\t[%%r12]ASI_BLK_AIUPL, %%f0\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1702, th_M, "\tldda\t[%%r13]ASI_BLK_AIUPL, %%f16\n"); break;
!!#                         default : IJ_printf ("diag.j", 1703, th_M, "\tldda\t[%%r8]ASI_BLK_AIUPL, %%f0\n"); break;
!!#                         }
!!#                        } break;
!!#                       case 4 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1709, th_M, "\tldda\t[%%r6]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1710, th_M, "\tldda\t[%%r7]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1711, th_M, "\tldda\t[%%r9]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1712, th_M, "\tldda\t[%%r10]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1713, th_M, "\tldda\t[%%r11]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1714, th_M, "\tldda\t[%%r12]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1715, th_M, "\tldda\t[%%r13]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         default : IJ_printf ("diag.j", 1716, th_M, "\tldda\t[%%r8]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         }
!!#                        } break;
!!#                       case 5 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1722, th_M, "\tldda\t[%%r6]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE, %%l0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1723, th_M, "\tldda\t[%%r7]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE, %%l0\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1724, th_M, "\tldda\t[%%r9]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE, %%l0\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1725, th_M, "\tldda\t[%%r10]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE, %%l0\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1726, th_M, "\tldda\t[%%r11]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE, %%l0\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1727, th_M, "\tldda\t[%%r12]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE, %%l0\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1728, th_M, "\tldda\t[%%r13]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE, %%l0\n"); break;
!!#                         default : IJ_printf ("diag.j", 1729, th_M, "\tldda\t[%%r8]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE, %%l0\n"); break;
!!#                         }
!!#                        } break;
!!#                       default : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1735, th_M, "\tldda\t[%%r6]ASI_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1736, th_M, "\tldda\t[%%r7]ASI_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1737, th_M, "\tldda\t[%%r9]ASI_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1738, th_M, "\tldda\t[%%r10]ASI_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1739, th_M, "\tldda\t[%%r11]ASI_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1740, th_M, "\tldda\t[%%r12]ASI_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1741, th_M, "\tldda\t[%%r13]ASI_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         default : IJ_printf ("diag.j", 1742, th_M, "\tldda\t[%%r8]ASI_BLK_INIT_ST_QUAD_LDD_P, %%l0\n"); break;
!!#                         }
!!#                        } break;
!!# 
!!#                      }
!!#                         IJ_printf ("diag.j", 1747, th_M, "\tmembar\t 0x40\n");
!!#                  }
!!# 
!!# ;
!!# 
!!# block_st :  set_block_st   %rvar  wt_bl
!!# ;
!!# set_block_st :  mSET_BLOCK_ST   %rvar  wt_bl
!!#                 {
!!#                      rnd_cnt = random() %2;
!!#                      !IJ_printf (th_M, "! DEBUG1 \trnd_cnt = %d\t\n", rnd_cnt);
!!#                      switch (rnd_cnt) {
!!#                       case 0 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!# 
!!#                         case 0 : IJ_printf ("diag.j", 1763, th_M, "\tstda\t %%f0, [%%r6]ASI_BLK_P\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1764, th_M, "\tstda\t %%f16, [%%r7]ASI_BLK_P\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1765, th_M, "\tstda\t %%f0, [%%r9]ASI_BLK_P\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1766, th_M, "\tstda\t %%f0, [%%r10]ASI_BLK_P\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1767, th_M, "\tstda\t %%f16, [%%r11]ASI_BLK_P\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1768, th_M, "\tstda\t %%f0, [%%r12]ASI_BLK_P\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1769, th_M, "\tstda\t %%f0, [%%r13]ASI_BLK_P\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1770, th_M, "\tstda\t %%f0, [%%r7]ASI_BLK_P\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1772, th_M, "\tmembar\t 0x40\n");
!!#                        } break;
!!# 
!!#                       case 1 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!# 
!!#                         case 0 : IJ_printf ("diag.j", 1779, th_M, "\tstda\t %%f16, [%%r6]ASI_BLK_PL\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1780, th_M, "\tstda\t %%f0, [%%r7]ASI_BLK_PL\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1781, th_M, "\tstda\t %%f0, [%%r9]ASI_BLK_PL\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1782, th_M, "\tstda\t %%f16, [%%r10]ASI_BLK_PL\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1783, th_M, "\tstda\t %%f0, [%%r11]ASI_BLK_PL\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1784, th_M, "\tstda\t %%f16, [%%r12]ASI_BLK_PL\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1785, th_M, "\tstda\t %%f0, [%%r13]ASI_BLK_PL\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1786, th_M, "\tstda\t %%f16, [%%r7]ASI_BLK_PL\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1788, th_M, "\tmembar\t 0x40\n");
!!#                        } break;
!!#                       case 2 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!# 
!!#                         case 0 : IJ_printf ("diag.j", 1794, th_M, "\tstda\t %%f0, [%%r6]ASI_BLK_AIUP\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1795, th_M, "\tstda\t %%f16, [%%r7]ASI_BLK_AIUP\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1796, th_M, "\tstda\t %%f0, [%%r9]ASI_BLK_AIUP\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1797, th_M, "\tstda\t %%f16, [%%r10]ASI_BLK_AIUP\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1798, th_M, "\tstda\t %%f0, [%%r11]ASI_BLK_AIUP\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1799, th_M, "\tstda\t %%f16, [%%r12]ASI_BLK_AIUP\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1800, th_M, "\tstda\t %%f0, [%%r13]ASI_BLK_AIUP\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1801, th_M, "\tstda\t %%f16, [%%r7]ASI_BLK_AIUP\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1803, th_M, "\tmembar\t 0x40\n");
!!#                        } break;
!!#                       case 3 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!# 
!!#                         case 0 : IJ_printf ("diag.j", 1809, th_M, "\tstda\t %%f0, [%%r6]ASI_BLK_AIUPL\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1810, th_M, "\tstda\t %%f16, [%%r7]ASI_BLK_AIUPL\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1811, th_M, "\tstda\t %%f0, [%%r9]ASI_BLK_AIUPL\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1812, th_M, "\tstda\t %%f16, [%%r10]ASI_BLK_AIUPL\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1813, th_M, "\tstda\t %%f0, [%%r11]ASI_BLK_AIUPL\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1814, th_M, "\tstda\t %%f16, [%%r12]ASI_BLK_AIUPL\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1815, th_M, "\tstda\t %%f0, [%%r13]ASI_BLK_AIUPL\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1816, th_M, "\tstda\t %%f16, [%%r7]ASI_BLK_AIUPL\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1818, th_M, "\tmembar\t 0x40\n");
!!#                        } break;
!!#                       case 4 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!# 
!!#                         case 0 : IJ_printf ("diag.j", 1824, th_M, "\tstxa\t %%l0, [%%r6]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1825, th_M, "\tstxa\t %%l0, [%%r7]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1826, th_M, "\tstxa\t %%l0, [%%r9]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1827, th_M, "\tstxa\t %%l0, [%%r10]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1828, th_M, "\tstxa\t %%l0, [%%r11]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1829, th_M, "\tstxa\t %%l0, [%%r12]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1830, th_M, "\tstxa\t %%l0, [%%r13]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1831, th_M, "\tstxa\t %%l0, [%%r7]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1833, th_M, "\tmembar\t 0x40\n");
!!#                        } break;
!!#                       case 5 : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!# 
!!#                         case 0 : IJ_printf ("diag.j", 1839, th_M, "\tstxa\t %%l0, [%%r6]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1840, th_M, "\tstxa\t %%l0, [%%r7]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1841, th_M, "\tstxa\t %%l0, [%%r9]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1842, th_M, "\tstxa\t %%l0, [%%r10]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1843, th_M, "\tstxa\t %%l0, [%%r11]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1844, th_M, "\tstxa\t %%l0, [%%r12]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1845, th_M, "\tstxa\t %%l0, [%%r13]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1846, th_M, "\tstxa\t %%l0, [%%r7]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1848, th_M, "\tmembar\t 0x40\n");
!!#                        } break;
!!#                       default : {
!!#                        rnd_cnt = random() %7;
!!#                        switch (rnd_cnt) {
!!# 
!!#                         case 0 : IJ_printf ("diag.j", 1854, th_M, "\tstxa\t %%l0, [%%r6]ASI_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1855, th_M, "\tstxa\t %%l0, [%%r7]ASI_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1856, th_M, "\tstxa\t %%l0, [%%r9]ASI_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1857, th_M, "\tstxa\t %%l0, [%%r10]ASI_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1858, th_M, "\tstxa\t %%l0, [%%r11]ASI_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1859, th_M, "\tstxa\t %%l0, [%%r12]ASI_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1860, th_M, "\tstxa\t %%l0, [%%r13]ASI_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1861, th_M, "\tstxa\t %%l0, [%%r7]ASI_BLK_INIT_ST_QUAD_LDD_P\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1863, th_M, "\tmembar\t 0x40\n");
!!#                        } break;
!!# 
!!#                     }
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
