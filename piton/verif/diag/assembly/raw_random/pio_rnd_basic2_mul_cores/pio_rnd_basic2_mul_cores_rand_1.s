// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic2_mul_cores_rand_1.s
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
   random seed:	543474642
   Jal pio_rnd_basic2_mul_cores.j:	
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

!	ta	0x30
!
!
!	setx	user_data_start, %l0, %l1
!	setx	0xf0, %l0, %l2
!        mov     0,%l4
!        setx    ncdata_base0, %l0, %l2           ! nc data base
!        setx    0x1000, %l0, %l3                ! nc datawork area
!        add     %l2, %l3, %g3
!!loop0:	
!!	ldub	[%l1 + 0x7f], %l3
!!	subcc	%l3, %l2, %g0
!!	bnz	loop0
!!	nop
!!	prefetch [%l1 + 0x3f], #n_writes
!
!! initalize 
!add 0x0, %g0, %g4
!add 0x0, %g0, %g2
!add 0x00f, %g0, %g5
!!setx 0x800e000000, %g1, %g3
!stloop0:
!stx %g2, [%g3 + %g4]
!inc %g2
!add 0x8, %g4, %g4
!deccc %g5
!bne stloop0
!nop
!

! Register init code

	setx 0x5c1b5858f3aac394, %g1, %g0
	setx 0xc67643f2900437e9, %g1, %g1
	setx 0x4edac67755d988d1, %g1, %g2
	setx 0x0194a7ca999d8398, %g1, %g3
	setx 0x753ce3bb07efa930, %g1, %g4
	setx 0x103667705784a950, %g1, %g5
	setx 0x40e9b2bcf661f6de, %g1, %g6
	setx 0x0a4357d20716420d, %g1, %g7
	setx 0xdc1b25085f5de16b, %g1, %r16
	setx 0x686323d3adac0eb8, %g1, %r17
	setx 0x7993d24ac06de612, %g1, %r18
	setx 0x133cc3935f349c97, %g1, %r19
	setx 0x9cf8b030fce9797c, %g1, %r20
	setx 0x14eda508c8e96d3d, %g1, %r21
	setx 0xa54b08ce86fa4aa4, %g1, %r22
	setx 0x083eadae52a87d40, %g1, %r23
	setx 0x79254aa01c8a8b4d, %g1, %r24
	setx 0xbb62476df04c9de2, %g1, %r25
	setx 0xcfb7d5313d2cabc8, %g1, %r26
	setx 0x6a168529925960ba, %g1, %r27
	setx 0x3015dcc70c4c25e2, %g1, %r28
	setx 0xd107a5e9d82ed36c, %g1, %r29
	setx 0xe109042568ba934c, %g1, %r30
	setx 0x71d19010aa9f4fc0, %g1, %r31
	save
	setx 0xd4de5daf26764d52, %g1, %r16
	setx 0x50f1226ba41b8210, %g1, %r17
	setx 0xe2b8569c0cc5a18e, %g1, %r18
	setx 0xf31c89653ce03bfa, %g1, %r19
	setx 0xf549ca6bdc99f648, %g1, %r20
	setx 0x2d691f4525308d7f, %g1, %r21
	setx 0x92adf58a00608b11, %g1, %r22
	setx 0xce7f66a96ea7ddc4, %g1, %r23
	setx 0xf1958f4d71bbb452, %g1, %r24
	setx 0xe6428d7f84a66e53, %g1, %r25
	setx 0x6696294f139cd064, %g1, %r26
	setx 0xb64305e22ea7a573, %g1, %r27
	setx 0x59ccbb0a0f1ddac6, %g1, %r28
	setx 0x8efbe7787cdd9adb, %g1, %r29
	setx 0x838ca35da642cba4, %g1, %r30
	setx 0x2874b0dd2a5f2524, %g1, %r31
	save
	setx 0xa3b7f9c7f6b8dd24, %g1, %r16
	setx 0xb7178de9ad70babb, %g1, %r17
	setx 0x27cb4786dec3e3e7, %g1, %r18
	setx 0x03712f04fd7779de, %g1, %r19
	setx 0xfbe06e298af04083, %g1, %r20
	setx 0xc1d37b6df74d7975, %g1, %r21
	setx 0xb136a7154f14056d, %g1, %r22
	setx 0x9065e64c75e5b0f5, %g1, %r23
	setx 0xbf9ca38e69cb9087, %g1, %r24
	setx 0xc9622fb545141e86, %g1, %r25
	setx 0x18efa2c3e888f25b, %g1, %r26
	setx 0x890136dda35f0e26, %g1, %r27
	setx 0xcdb814bfdd53f090, %g1, %r28
	setx 0x27f584d3d9ef18b9, %g1, %r29
	setx 0x13911bdb94d618e0, %g1, %r30
	setx 0xa1a66c9f935eabb9, %g1, %r31
	restore
	mov	0, %r8
	ta	0x30
	mov	0,%g4 
	setx	ncdata_base0, %g1, %g2 
	setx	0x1000, %g1, %g3 
	add	%g2, %g3, %g3 
	!	nitalize 
	add 0x0, %g0, %g4 
	add 0x0, %g0, %g2 
	add 0x00f, %g0, %g5 
	stloop0: 
	stx %g2, [%g3 + %g4] 
	inc %g2 
	add 0x8, %g4, %g4 
	deccc %g5 
	bne stloop0 
	nop 
	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffff; target strm = 0x1
	cmp	%o1, 0
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x2
	cmp	%o1, 1
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4
	cmp	%o1, 2
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8
	cmp	%o1, 3
	setx	fork_lbl_0_4, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x10
	cmp	%o1, 4
	setx	fork_lbl_0_5, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x20
	cmp	%o1, 5
	setx	fork_lbl_0_6, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x40
	cmp	%o1, 6
	setx	fork_lbl_0_7, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x80
	cmp	%o1, 7
	setx	fork_lbl_0_8, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 16, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 24, 16, 16)) -> intp(3, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 32, 16, 16)) -> intp(4, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 40, 16, 16)) -> intp(5, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 48, 16, 16)) -> intp(6, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 56, 16, 16)) -> intp(7, 1, 1)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_8:
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec418008  ! 1: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xaa39a010  ! 2: XNOR_I	xnor 	%r6, 0x0010, %r21
	.word 0xe871a010  ! 3: STX_I	stx	%r20, [%r6 + 0x0010]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe851a010  ! 7: LDSH_I	ldsh	[%r6 + 0x0010], %r20
	.word 0xae31a018  ! 8: ORN_I	orn 	%r6, 0x0018, %r23
	.word 0xe8318008  ! 9: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec498008  ! 13: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xa4c1a018  ! 14: ADDCcc_I	addccc 	%r6, 0x0018, %r18
	.word 0xe0718008  ! 15: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0198008  ! 19: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa6318008  ! 20: ORN_R	orn 	%r6, %r8, %r19
	.word 0xe0298008  ! 21: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe4118008  ! 25: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xa6818008  ! 26: ADDcc_R	addcc 	%r6, %r8, %r19
	.word 0xe0718008  ! 27: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe851a008  ! 31: LDSH_I	ldsh	[%r6 + 0x0008], %r20
	.word 0xac318008  ! 32: SUBC_R	orn 	%r6, %r8, %r22
	.word 0xe031a020  ! 33: STH_I	sth	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe4018008  ! 37: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xacb18008  ! 38: SUBCcc_R	orncc 	%r6, %r8, %r22
	.word 0xec71a030  ! 39: STX_I	stx	%r22, [%r6 + 0x0030]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe819a030  ! 43: LDD_I	ldd	[%r6 + 0x0030], %r20
	.word 0xae198008  ! 44: XOR_R	xor 	%r6, %r8, %r23
	.word 0xe421a018  ! 45: STW_I	stw	%r18, [%r6 + 0x0018]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe811a018  ! 49: LDUH_I	lduh	[%r6 + 0x0018], %r20
	.word 0xae118008  ! 50: OR_R	or 	%r6, %r8, %r23
	.word 0xe0298008  ! 51: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe8498008  ! 55: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xae81a018  ! 56: ADDcc_I	addcc 	%r6, 0x0018, %r23
	.word 0xe0218008  ! 57: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec19a028  ! 61: LDD_I	ldd	[%r6 + 0x0028], %r22
	.word 0xaa818008  ! 62: ADDcc_R	addcc 	%r6, %r8, %r21
	.word 0xec71a018  ! 63: STX_I	stx	%r22, [%r6 + 0x0018]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe019a018  ! 67: LDD_I	ldd	[%r6 + 0x0018], %r16
	.word 0xa0318008  ! 68: SUBC_R	orn 	%r6, %r8, %r16
	.word 0xec318008  ! 69: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec018008  ! 73: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xac39a030  ! 74: XNOR_I	xnor 	%r6, 0x0030, %r22
	.word 0xe439a038  ! 75: STD_I	std	%r18, [%r6 + 0x0038]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe841a038  ! 79: LDSW_I	ldsw	[%r6 + 0x0038], %r20
	.word 0xa4218008  ! 80: SUB_R	sub 	%r6, %r8, %r18
	.word 0xe0718008  ! 81: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe8498008  ! 85: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xae018008  ! 86: ADD_R	add 	%r6, %r8, %r23
	.word 0xe0298008  ! 87: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0098008  ! 91: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa2298008  ! 92: ANDN_R	andn 	%r6, %r8, %r17
	.word 0xe831a018  ! 93: STH_I	sth	%r20, [%r6 + 0x0018]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0018008  ! 97: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xa0b1a008  ! 98: SUBCcc_I	orncc 	%r6, 0x0008, %r16
	.word 0xe021a030  ! 99: STW_I	stw	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0098008  ! 103: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa0c1a018  ! 104: ADDCcc_I	addccc 	%r6, 0x0018, %r16
	.word 0xe871a008  ! 105: STX_I	stx	%r20, [%r6 + 0x0008]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe411a008  ! 109: LDUH_I	lduh	[%r6 + 0x0008], %r18
	.word 0xa891a038  ! 110: ORcc_I	orcc 	%r6, 0x0038, %r20
	.word 0xe4718008  ! 111: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe009a008  ! 115: LDUB_I	ldub	[%r6 + 0x0008], %r16
	.word 0xaa118008  ! 116: OR_R	or 	%r6, %r8, %r21
	.word 0xe471a030  ! 117: STX_I	stx	%r18, [%r6 + 0x0030]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe051a030  ! 121: LDSH_I	ldsh	[%r6 + 0x0030], %r16
	.word 0xaa318008  ! 122: ORN_R	orn 	%r6, %r8, %r21
	.word 0xe0298008  ! 123: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe4098008  ! 127: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xa639a028  ! 128: XNOR_I	xnor 	%r6, 0x0028, %r19
	.word 0xe0218008  ! 129: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0418008  ! 133: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa0c1a010  ! 134: ADDCcc_I	addccc 	%r6, 0x0010, %r16
	.word 0xe8218008  ! 135: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe049a020  ! 139: LDSB_I	ldsb	[%r6 + 0x0020], %r16
	.word 0xaab18008  ! 140: ORNcc_R	orncc 	%r6, %r8, %r21
	.word 0xe4218008  ! 141: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe059a008  ! 145: LDX_I	ldx	[%r6 + 0x0008], %r16
	.word 0xac218008  ! 146: SUB_R	sub 	%r6, %r8, %r22
	.word 0xe821a000  ! 147: STW_I	stw	%r20, [%r6 + 0x0000]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0518008  ! 151: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa839a008  ! 152: XNOR_I	xnor 	%r6, 0x0008, %r20
	.word 0xe4218008  ! 153: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe441a020  ! 157: LDSW_I	ldsw	[%r6 + 0x0020], %r18
	.word 0xa4b1a028  ! 158: ORNcc_I	orncc 	%r6, 0x0028, %r18
	.word 0xe829a038  ! 159: STB_I	stb	%r20, [%r6 + 0x0038]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe049a038  ! 163: LDSB_I	ldsb	[%r6 + 0x0038], %r16
	.word 0xacb1a038  ! 164: ORNcc_I	orncc 	%r6, 0x0038, %r22
	.word 0xec298008  ! 165: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe811a010  ! 169: LDUH_I	lduh	[%r6 + 0x0010], %r20
	.word 0xa691a028  ! 170: ORcc_I	orcc 	%r6, 0x0028, %r19
	.word 0xe8298008  ! 171: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe8418008  ! 175: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xacb18008  ! 176: ORNcc_R	orncc 	%r6, %r8, %r22
	.word 0xe0298008  ! 177: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe8598008  ! 181: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xac118008  ! 182: OR_R	or 	%r6, %r8, %r22
	.word 0xec31a020  ! 183: STH_I	sth	%r22, [%r6 + 0x0020]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0198008  ! 187: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa6a98008  ! 188: ANDNcc_R	andncc 	%r6, %r8, %r19
	.word 0xec298008  ! 189: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe809a020  ! 193: LDUB_I	ldub	[%r6 + 0x0020], %r20
	.word 0xae118008  ! 194: OR_R	or 	%r6, %r8, %r23
	.word 0xec318008  ! 195: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe8518008  ! 199: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xaa99a000  ! 200: XORcc_I	xorcc 	%r6, 0x0000, %r21
	.word 0xe029a038  ! 201: STB_I	stb	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe009a038  ! 205: LDUB_I	ldub	[%r6 + 0x0038], %r16
	.word 0xac91a030  ! 206: ORcc_I	orcc 	%r6, 0x0030, %r22
	.word 0xe821a020  ! 207: STW_I	stw	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe059a020  ! 211: LDX_I	ldx	[%r6 + 0x0020], %r16
	.word 0xa2318008  ! 212: SUBC_R	orn 	%r6, %r8, %r17
	.word 0xe871a038  ! 213: STX_I	stx	%r20, [%r6 + 0x0038]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe049a038  ! 217: LDSB_I	ldsb	[%r6 + 0x0038], %r16
	.word 0xa0b1a010  ! 218: ORNcc_I	orncc 	%r6, 0x0010, %r16
	.word 0xe8718008  ! 219: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0598008  ! 223: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xae91a008  ! 224: ORcc_I	orcc 	%r6, 0x0008, %r23
	.word 0xe8318008  ! 225: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec198008  ! 229: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xaab1a018  ! 230: SUBCcc_I	orncc 	%r6, 0x0018, %r21
	.word 0xe039a000  ! 231: STD_I	std	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe001a000  ! 235: LDUW_I	lduw	[%r6 + 0x0000], %r16
	.word 0xaca9a028  ! 236: ANDNcc_I	andncc 	%r6, 0x0028, %r22
	.word 0xe039a030  ! 237: STD_I	std	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec59a030  ! 241: LDX_I	ldx	[%r6 + 0x0030], %r22
	.word 0xa8398008  ! 242: XNOR_R	xnor 	%r6, %r8, %r20
	.word 0xe439a030  ! 243: STD_I	std	%r18, [%r6 + 0x0030]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe049a030  ! 247: LDSB_I	ldsb	[%r6 + 0x0030], %r16
	.word 0xa2b1a028  ! 248: SUBCcc_I	orncc 	%r6, 0x0028, %r17
	.word 0xe439a028  ! 249: STD_I	std	%r18, [%r6 + 0x0028]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec41a028  ! 253: LDSW_I	ldsw	[%r6 + 0x0028], %r22
	.word 0xa2398008  ! 254: XNOR_R	xnor 	%r6, %r8, %r17
	.word 0xe8718008  ! 255: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0098008  ! 259: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa4c1a030  ! 260: ADDCcc_I	addccc 	%r6, 0x0030, %r18
	.word 0xe839a028  ! 261: STD_I	std	%r20, [%r6 + 0x0028]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe019a028  ! 265: LDD_I	ldd	[%r6 + 0x0028], %r16
	.word 0xa4a98008  ! 266: ANDNcc_R	andncc 	%r6, %r8, %r18
	.word 0xec318008  ! 267: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec01a020  ! 271: LDUW_I	lduw	[%r6 + 0x0020], %r22
	.word 0xaeb9a030  ! 272: XNORcc_I	xnorcc 	%r6, 0x0030, %r23
	.word 0xe439a018  ! 273: STD_I	std	%r18, [%r6 + 0x0018]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe459a018  ! 277: LDX_I	ldx	[%r6 + 0x0018], %r18
	.word 0xa2818008  ! 278: ADDcc_R	addcc 	%r6, %r8, %r17
	.word 0xec21a028  ! 279: STW_I	stw	%r22, [%r6 + 0x0028]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec418008  ! 283: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xa6118008  ! 284: OR_R	or 	%r6, %r8, %r19
	.word 0xe029a028  ! 285: STB_I	stb	%r16, [%r6 + 0x0028]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec41a028  ! 289: LDSW_I	ldsw	[%r6 + 0x0028], %r22
	.word 0xa401a018  ! 290: ADD_I	add 	%r6, 0x0018, %r18
	.word 0xe831a030  ! 291: STH_I	sth	%r20, [%r6 + 0x0030]
	setx	0x00000000d01ef020, %r1, %r6
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe811a000  ! 1: LDUH_I	lduh	[%r6 + 0x0000], %r20
	.word 0xa6b9a010  ! 2: XNORcc_I	xnorcc 	%r6, 0x0010, %r19
	.word 0xe0318008  ! 3: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe059a010  ! 7: LDX_I	ldx	[%r6 + 0x0010], %r16
	.word 0xae99a028  ! 8: XORcc_I	xorcc 	%r6, 0x0028, %r23
	.word 0xe039a010  ! 9: STD_I	std	%r16, [%r6 + 0x0010]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe019a010  ! 13: LDD_I	ldd	[%r6 + 0x0010], %r16
	.word 0xa809a020  ! 14: AND_I	and 	%r6, 0x0020, %r20
	.word 0xe8298008  ! 15: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe841a028  ! 19: LDSW_I	ldsw	[%r6 + 0x0028], %r20
	.word 0xa631a018  ! 20: ORN_I	orn 	%r6, 0x0018, %r19
	.word 0xe071a020  ! 21: STX_I	stx	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe009a020  ! 25: LDUB_I	ldub	[%r6 + 0x0020], %r16
	.word 0xaaa18008  ! 26: SUBcc_R	subcc 	%r6, %r8, %r21
	.word 0xec718008  ! 27: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe8018008  ! 31: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xa8c1a018  ! 32: ADDCcc_I	addccc 	%r6, 0x0018, %r20
	.word 0xe031a020  ! 33: STH_I	sth	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe8198008  ! 37: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xa609a010  ! 38: AND_I	and 	%r6, 0x0010, %r19
	.word 0xe839a030  ! 39: STD_I	std	%r20, [%r6 + 0x0030]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe809a030  ! 43: LDUB_I	ldub	[%r6 + 0x0030], %r20
	.word 0xa4918008  ! 44: ORcc_R	orcc 	%r6, %r8, %r18
	.word 0xe4318008  ! 45: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe449a018  ! 49: LDSB_I	ldsb	[%r6 + 0x0018], %r18
	.word 0xa0298008  ! 50: ANDN_R	andn 	%r6, %r8, %r16
	.word 0xe8298008  ! 51: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe051a010  ! 55: LDSH_I	ldsh	[%r6 + 0x0010], %r16
	.word 0xae11a038  ! 56: OR_I	or 	%r6, 0x0038, %r23
	.word 0xe4398008  ! 57: STD_R	std	%r18, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe451a028  ! 61: LDSH_I	ldsh	[%r6 + 0x0028], %r18
	.word 0xa6218008  ! 62: SUB_R	sub 	%r6, %r8, %r19
	.word 0xe8298008  ! 63: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe019a018  ! 67: LDD_I	ldd	[%r6 + 0x0018], %r16
	.word 0xaa818008  ! 68: ADDcc_R	addcc 	%r6, %r8, %r21
	.word 0xe0718008  ! 69: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe411a030  ! 73: LDUH_I	lduh	[%r6 + 0x0030], %r18
	.word 0xaa11a010  ! 74: OR_I	or 	%r6, 0x0010, %r21
	.word 0xec718008  ! 75: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0098008  ! 79: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xacb98008  ! 80: XNORcc_R	xnorcc 	%r6, %r8, %r22
	.word 0xe8218008  ! 81: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe8118008  ! 85: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xacb1a038  ! 86: ORNcc_I	orncc 	%r6, 0x0038, %r22
	.word 0xe4318008  ! 87: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe0198008  ! 91: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa421a000  ! 92: SUB_I	sub 	%r6, 0x0000, %r18
	.word 0xe4318008  ! 93: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0598008  ! 97: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa2a98008  ! 98: ANDNcc_R	andncc 	%r6, %r8, %r17
	.word 0xe071a030  ! 99: STX_I	stx	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe811a030  ! 103: LDUH_I	lduh	[%r6 + 0x0030], %r20
	.word 0xa009a020  ! 104: AND_I	and 	%r6, 0x0020, %r16
	.word 0xe439a008  ! 105: STD_I	std	%r18, [%r6 + 0x0008]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe019a008  ! 109: LDD_I	ldd	[%r6 + 0x0008], %r16
	.word 0xa8918008  ! 110: ORcc_R	orcc 	%r6, %r8, %r20
	.word 0xe8718008  ! 111: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec51a008  ! 115: LDSH_I	ldsh	[%r6 + 0x0008], %r22
	.word 0xaeb1a000  ! 116: ORNcc_I	orncc 	%r6, 0x0000, %r23
	.word 0xe0298008  ! 117: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe851a030  ! 121: LDSH_I	ldsh	[%r6 + 0x0030], %r20
	.word 0xa2b18008  ! 122: ORNcc_R	orncc 	%r6, %r8, %r17
	.word 0xec21a020  ! 123: STW_I	stw	%r22, [%r6 + 0x0020]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe051a020  ! 127: LDSH_I	ldsh	[%r6 + 0x0020], %r16
	.word 0xacc18008  ! 128: ADDCcc_R	addccc 	%r6, %r8, %r22
	.word 0xe0318008  ! 129: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec11a020  ! 133: LDUH_I	lduh	[%r6 + 0x0020], %r22
	.word 0xa681a000  ! 134: ADDcc_I	addcc 	%r6, 0x0000, %r19
	.word 0xe4298008  ! 135: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec018008  ! 139: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xacb18008  ! 140: SUBCcc_R	orncc 	%r6, %r8, %r22
	.word 0xe021a008  ! 141: STW_I	stw	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe041a008  ! 145: LDSW_I	ldsw	[%r6 + 0x0008], %r16
	.word 0xaca9a028  ! 146: ANDNcc_I	andncc 	%r6, 0x0028, %r22
	.word 0xe4298008  ! 147: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe051a000  ! 151: LDSH_I	ldsh	[%r6 + 0x0000], %r16
	.word 0xa8b1a028  ! 152: ORNcc_I	orncc 	%r6, 0x0028, %r20
	.word 0xe829a020  ! 153: STB_I	stb	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe4498008  ! 157: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xa4318008  ! 158: ORN_R	orn 	%r6, %r8, %r18
	.word 0xe8318008  ! 159: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe809a038  ! 163: LDUB_I	ldub	[%r6 + 0x0038], %r20
	.word 0xaab1a030  ! 164: ORNcc_I	orncc 	%r6, 0x0030, %r21
	.word 0xe4218008  ! 165: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe851a010  ! 169: LDSH_I	ldsh	[%r6 + 0x0010], %r20
	.word 0xa231a038  ! 170: SUBC_I	orn 	%r6, 0x0038, %r17
	.word 0xe0218008  ! 171: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe009a030  ! 175: LDUB_I	ldub	[%r6 + 0x0030], %r16
	.word 0xa0818008  ! 176: ADDcc_R	addcc 	%r6, %r8, %r16
	.word 0xe0398008  ! 177: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe8598008  ! 181: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xa0198008  ! 182: XOR_R	xor 	%r6, %r8, %r16
	.word 0xe831a020  ! 183: STH_I	sth	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec198008  ! 187: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xa4298008  ! 188: ANDN_R	andn 	%r6, %r8, %r18
	.word 0xe4298008  ! 189: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec018008  ! 193: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xa2b18008  ! 194: SUBCcc_R	orncc 	%r6, %r8, %r17
	.word 0xe4718008  ! 195: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe4098008  ! 199: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xac098008  ! 200: AND_R	and 	%r6, %r8, %r22
	.word 0xe0718008  ! 201: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe8498008  ! 205: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xae818008  ! 206: ADDcc_R	addcc 	%r6, %r8, %r23
	.word 0xe871a020  ! 207: STX_I	stx	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0198008  ! 211: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa4b18008  ! 212: SUBCcc_R	orncc 	%r6, %r8, %r18
	.word 0xe4218008  ! 213: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe4418008  ! 217: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xa299a038  ! 218: XORcc_I	xorcc 	%r6, 0x0038, %r17
	.word 0xe829a030  ! 219: STB_I	stb	%r20, [%r6 + 0x0030]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe441a030  ! 223: LDSW_I	ldsw	[%r6 + 0x0030], %r18
	.word 0xa4a9a020  ! 224: ANDNcc_I	andncc 	%r6, 0x0020, %r18
	.word 0xe0398008  ! 225: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec59a010  ! 229: LDX_I	ldx	[%r6 + 0x0010], %r22
	.word 0xae81a020  ! 230: ADDcc_I	addcc 	%r6, 0x0020, %r23
	.word 0xe0718008  ! 231: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe049a000  ! 235: LDSB_I	ldsb	[%r6 + 0x0000], %r16
	.word 0xaa118008  ! 236: OR_R	or 	%r6, %r8, %r21
	.word 0xe421a030  ! 237: STW_I	stw	%r18, [%r6 + 0x0030]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec098008  ! 241: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xaa31a028  ! 242: ORN_I	orn 	%r6, 0x0028, %r21
	.word 0xe431a030  ! 243: STH_I	sth	%r18, [%r6 + 0x0030]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe441a030  ! 247: LDSW_I	ldsw	[%r6 + 0x0030], %r18
	.word 0xae018008  ! 248: ADD_R	add 	%r6, %r8, %r23
	.word 0xe0398008  ! 249: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0198008  ! 253: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa4198008  ! 254: XOR_R	xor 	%r6, %r8, %r18
	.word 0xe8718008  ! 255: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe059a020  ! 259: LDX_I	ldx	[%r6 + 0x0020], %r16
	.word 0xa8918008  ! 260: ORcc_R	orcc 	%r6, %r8, %r20
	.word 0xec31a028  ! 261: STH_I	sth	%r22, [%r6 + 0x0028]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe051a028  ! 265: LDSH_I	ldsh	[%r6 + 0x0028], %r16
	.word 0xa641a000  ! 266: ADDC_I	addc 	%r6, 0x0000, %r19
	.word 0xe871a020  ! 267: STX_I	stx	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe0518008  ! 271: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa401a008  ! 272: ADD_I	add 	%r6, 0x0008, %r18
	.word 0xe0718008  ! 273: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec11a018  ! 277: LDUH_I	lduh	[%r6 + 0x0018], %r22
	.word 0xa4198008  ! 278: XOR_R	xor 	%r6, %r8, %r18
	.word 0xec218008  ! 279: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe841a028  ! 283: LDSW_I	ldsw	[%r6 + 0x0028], %r20
	.word 0xaab1a008  ! 284: SUBCcc_I	orncc 	%r6, 0x0008, %r21
	.word 0xe439a028  ! 285: STD_I	std	%r18, [%r6 + 0x0028]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe409a028  ! 289: LDUB_I	ldub	[%r6 + 0x0028], %r18
	.word 0xa601a008  ! 290: ADD_I	add 	%r6, 0x0008, %r19
	.word 0xe4298008  ! 291: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec01a000  ! 1: LDUW_I	lduw	[%r6 + 0x0000], %r22
	.word 0xa829a010  ! 2: ANDN_I	andn 	%r6, 0x0010, %r20
	.word 0xec398008  ! 3: STD_R	std	%r22, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0018008  ! 7: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xa4998008  ! 8: XORcc_R	xorcc 	%r6, %r8, %r18
	.word 0xec39a010  ! 9: STD_I	std	%r22, [%r6 + 0x0010]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe809a010  ! 13: LDUB_I	ldub	[%r6 + 0x0010], %r20
	.word 0xa821a020  ! 14: SUB_I	sub 	%r6, 0x0020, %r20
	.word 0xec21a028  ! 15: STW_I	stw	%r22, [%r6 + 0x0028]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe851a028  ! 19: LDSH_I	ldsh	[%r6 + 0x0028], %r20
	.word 0xa2c1a010  ! 20: ADDCcc_I	addccc 	%r6, 0x0010, %r17
	.word 0xe0298008  ! 21: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe041a020  ! 25: LDSW_I	ldsw	[%r6 + 0x0020], %r16
	.word 0xac91a028  ! 26: ORcc_I	orcc 	%r6, 0x0028, %r22
	.word 0xe4398008  ! 27: STD_R	std	%r18, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0498008  ! 31: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xac99a028  ! 32: XORcc_I	xorcc 	%r6, 0x0028, %r22
	.word 0xe439a020  ! 33: STD_I	std	%r18, [%r6 + 0x0020]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe041a020  ! 37: LDSW_I	ldsw	[%r6 + 0x0020], %r16
	.word 0xae41a010  ! 38: ADDC_I	addc 	%r6, 0x0010, %r23
	.word 0xe0218008  ! 39: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe8498008  ! 43: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xa401a020  ! 44: ADD_I	add 	%r6, 0x0020, %r18
	.word 0xe431a018  ! 45: STH_I	sth	%r18, [%r6 + 0x0018]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe0418008  ! 49: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa6b18008  ! 50: SUBCcc_R	orncc 	%r6, %r8, %r19
	.word 0xe0218008  ! 51: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe4418008  ! 55: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xaaa18008  ! 56: SUBcc_R	subcc 	%r6, %r8, %r21
	.word 0xec71a028  ! 57: STX_I	stx	%r22, [%r6 + 0x0028]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe001a028  ! 61: LDUW_I	lduw	[%r6 + 0x0028], %r16
	.word 0xac81a018  ! 62: ADDcc_I	addcc 	%r6, 0x0018, %r22
	.word 0xe4718008  ! 63: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe819a018  ! 67: LDD_I	ldd	[%r6 + 0x0018], %r20
	.word 0xacb9a008  ! 68: XNORcc_I	xnorcc 	%r6, 0x0008, %r22
	.word 0xe829a030  ! 69: STB_I	stb	%r20, [%r6 + 0x0030]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe019a030  ! 73: LDD_I	ldd	[%r6 + 0x0030], %r16
	.word 0xa4918008  ! 74: ORcc_R	orcc 	%r6, %r8, %r18
	.word 0xec718008  ! 75: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe001a038  ! 79: LDUW_I	lduw	[%r6 + 0x0038], %r16
	.word 0xae998008  ! 80: XORcc_R	xorcc 	%r6, %r8, %r23
	.word 0xe0298008  ! 81: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe4498008  ! 85: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xa2a9a038  ! 86: ANDNcc_I	andncc 	%r6, 0x0038, %r17
	.word 0xe029a010  ! 87: STB_I	stb	%r16, [%r6 + 0x0010]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec51a010  ! 91: LDSH_I	ldsh	[%r6 + 0x0010], %r22
	.word 0xa8a1a008  ! 92: SUBcc_I	subcc 	%r6, 0x0008, %r20
	.word 0xe839a018  ! 93: STD_I	std	%r20, [%r6 + 0x0018]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0018008  ! 97: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xaa198008  ! 98: XOR_R	xor 	%r6, %r8, %r21
	.word 0xe8718008  ! 99: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe009a030  ! 103: LDUB_I	ldub	[%r6 + 0x0030], %r16
	.word 0xa2918008  ! 104: ORcc_R	orcc 	%r6, %r8, %r17
	.word 0xe039a008  ! 105: STD_I	std	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe4418008  ! 109: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xaca98008  ! 110: ANDNcc_R	andncc 	%r6, %r8, %r22
	.word 0xe029a008  ! 111: STB_I	stb	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec01a008  ! 115: LDUW_I	lduw	[%r6 + 0x0008], %r22
	.word 0xa401a038  ! 116: ADD_I	add 	%r6, 0x0038, %r18
	.word 0xe8718008  ! 117: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe851a030  ! 121: LDSH_I	ldsh	[%r6 + 0x0030], %r20
	.word 0xa0818008  ! 122: ADDcc_R	addcc 	%r6, %r8, %r16
	.word 0xe071a020  ! 123: STX_I	stx	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe8098008  ! 127: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xa6b98008  ! 128: XNORcc_R	xnorcc 	%r6, %r8, %r19
	.word 0xe471a020  ! 129: STX_I	stx	%r18, [%r6 + 0x0020]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe041a020  ! 133: LDSW_I	ldsw	[%r6 + 0x0020], %r16
	.word 0xa491a020  ! 134: ORcc_I	orcc 	%r6, 0x0020, %r18
	.word 0xe029a020  ! 135: STB_I	stb	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0418008  ! 139: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa0998008  ! 140: XORcc_R	xorcc 	%r6, %r8, %r16
	.word 0xe4718008  ! 141: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec41a008  ! 145: LDSW_I	ldsw	[%r6 + 0x0008], %r22
	.word 0xa4118008  ! 146: OR_R	or 	%r6, %r8, %r18
	.word 0xe431a000  ! 147: STH_I	sth	%r18, [%r6 + 0x0000]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe051a000  ! 151: LDSH_I	ldsh	[%r6 + 0x0000], %r16
	.word 0xa699a008  ! 152: XORcc_I	xorcc 	%r6, 0x0008, %r19
	.word 0xe8718008  ! 153: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe4018008  ! 157: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xac99a038  ! 158: XORcc_I	xorcc 	%r6, 0x0038, %r22
	.word 0xe831a038  ! 159: STH_I	sth	%r20, [%r6 + 0x0038]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec098008  ! 163: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xa489a008  ! 164: ANDcc_I	andcc 	%r6, 0x0008, %r18
	.word 0xe0318008  ! 165: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe409a010  ! 169: LDUB_I	ldub	[%r6 + 0x0010], %r18
	.word 0xacb9a018  ! 170: XNORcc_I	xnorcc 	%r6, 0x0018, %r22
	.word 0xe839a030  ! 171: STD_I	std	%r20, [%r6 + 0x0030]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec51a030  ! 175: LDSH_I	ldsh	[%r6 + 0x0030], %r22
	.word 0xa4c18008  ! 176: ADDCcc_R	addccc 	%r6, %r8, %r18
	.word 0xe471a008  ! 177: STX_I	stx	%r18, [%r6 + 0x0008]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe811a008  ! 181: LDUH_I	lduh	[%r6 + 0x0008], %r20
	.word 0xacc1a028  ! 182: ADDCcc_I	addccc 	%r6, 0x0028, %r22
	.word 0xe4718008  ! 183: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0418008  ! 187: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xac31a028  ! 188: ORN_I	orn 	%r6, 0x0028, %r22
	.word 0xe0718008  ! 189: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe001a020  ! 193: LDUW_I	lduw	[%r6 + 0x0020], %r16
	.word 0xa0b1a030  ! 194: SUBCcc_I	orncc 	%r6, 0x0030, %r16
	.word 0xec29a030  ! 195: STB_I	stb	%r22, [%r6 + 0x0030]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe009a030  ! 199: LDUB_I	ldub	[%r6 + 0x0030], %r16
	.word 0xaa398008  ! 200: XNOR_R	xnor 	%r6, %r8, %r21
	.word 0xec29a038  ! 201: STB_I	stb	%r22, [%r6 + 0x0038]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe051a038  ! 205: LDSH_I	ldsh	[%r6 + 0x0038], %r16
	.word 0xa6c1a010  ! 206: ADDCcc_I	addccc 	%r6, 0x0010, %r19
	.word 0xe0318008  ! 207: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe019a020  ! 211: LDD_I	ldd	[%r6 + 0x0020], %r16
	.word 0xa6418008  ! 212: ADDC_R	addc 	%r6, %r8, %r19
	.word 0xe0218008  ! 213: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0518008  ! 217: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xac91a020  ! 218: ORcc_I	orcc 	%r6, 0x0020, %r22
	.word 0xec318008  ! 219: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe019a030  ! 223: LDD_I	ldd	[%r6 + 0x0030], %r16
	.word 0xa421a000  ! 224: SUB_I	sub 	%r6, 0x0000, %r18
	.word 0xe0398008  ! 225: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe441a010  ! 229: LDSW_I	ldsw	[%r6 + 0x0010], %r18
	.word 0xae298008  ! 230: ANDN_R	andn 	%r6, %r8, %r23
	.word 0xe429a000  ! 231: STB_I	stb	%r18, [%r6 + 0x0000]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec518008  ! 235: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xa891a000  ! 236: ORcc_I	orcc 	%r6, 0x0000, %r20
	.word 0xe0218008  ! 237: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe841a030  ! 241: LDSW_I	ldsw	[%r6 + 0x0030], %r20
	.word 0xa0418008  ! 242: ADDC_R	addc 	%r6, %r8, %r16
	.word 0xe0218008  ! 243: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe851a030  ! 247: LDSH_I	ldsh	[%r6 + 0x0030], %r20
	.word 0xac318008  ! 248: ORN_R	orn 	%r6, %r8, %r22
	.word 0xe0718008  ! 249: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe809a028  ! 253: LDUB_I	ldub	[%r6 + 0x0028], %r20
	.word 0xa689a000  ! 254: ANDcc_I	andcc 	%r6, 0x0000, %r19
	.word 0xe871a020  ! 255: STX_I	stx	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe841a020  ! 259: LDSW_I	ldsw	[%r6 + 0x0020], %r20
	.word 0xa631a000  ! 260: ORN_I	orn 	%r6, 0x0000, %r19
	.word 0xe039a028  ! 261: STD_I	std	%r16, [%r6 + 0x0028]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0598008  ! 265: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xac318008  ! 266: ORN_R	orn 	%r6, %r8, %r22
	.word 0xec31a020  ! 267: STH_I	sth	%r22, [%r6 + 0x0020]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe8018008  ! 271: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xa8a9a018  ! 272: ANDNcc_I	andncc 	%r6, 0x0018, %r20
	.word 0xe431a018  ! 273: STH_I	sth	%r18, [%r6 + 0x0018]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe019a018  ! 277: LDD_I	ldd	[%r6 + 0x0018], %r16
	.word 0xa2a9a028  ! 278: ANDNcc_I	andncc 	%r6, 0x0028, %r17
	.word 0xe431a028  ! 279: STH_I	sth	%r18, [%r6 + 0x0028]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe0598008  ! 283: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa289a030  ! 284: ANDcc_I	andcc 	%r6, 0x0030, %r17
	.word 0xe0318008  ! 285: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe811a028  ! 289: LDUH_I	lduh	[%r6 + 0x0028], %r20
	.word 0xac31a038  ! 290: SUBC_I	orn 	%r6, 0x0038, %r22
	.word 0xe0298008  ! 291: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec59a000  ! 1: LDX_I	ldx	[%r6 + 0x0000], %r22
	.word 0xa0318008  ! 2: ORN_R	orn 	%r6, %r8, %r16
	.word 0xe871a010  ! 3: STX_I	stx	%r20, [%r6 + 0x0010]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe009a010  ! 7: LDUB_I	ldub	[%r6 + 0x0010], %r16
	.word 0xae218008  ! 8: SUB_R	sub 	%r6, %r8, %r23
	.word 0xe831a010  ! 9: STH_I	sth	%r20, [%r6 + 0x0010]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0598008  ! 13: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa6c1a000  ! 14: ADDCcc_I	addccc 	%r6, 0x0000, %r19
	.word 0xe4398008  ! 15: STD_R	std	%r18, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0198008  ! 19: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa6b18008  ! 20: SUBCcc_R	orncc 	%r6, %r8, %r19
	.word 0xe0298008  ! 21: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe019a020  ! 25: LDD_I	ldd	[%r6 + 0x0020], %r16
	.word 0xa889a010  ! 26: ANDcc_I	andcc 	%r6, 0x0010, %r20
	.word 0xec29a008  ! 27: STB_I	stb	%r22, [%r6 + 0x0008]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xec118008  ! 31: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xa6b98008  ! 32: XNORcc_R	xnorcc 	%r6, %r8, %r19
	.word 0xe821a020  ! 33: STW_I	stw	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe051a020  ! 37: LDSH_I	ldsh	[%r6 + 0x0020], %r16
	.word 0xa239a000  ! 38: XNOR_I	xnor 	%r6, 0x0000, %r17
	.word 0xe421a030  ! 39: STW_I	stw	%r18, [%r6 + 0x0030]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe8498008  ! 43: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xa2418008  ! 44: ADDC_R	addc 	%r6, %r8, %r17
	.word 0xe0398008  ! 45: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe041a018  ! 49: LDSW_I	ldsw	[%r6 + 0x0018], %r16
	.word 0xa8118008  ! 50: OR_R	or 	%r6, %r8, %r20
	.word 0xe021a010  ! 51: STW_I	stw	%r16, [%r6 + 0x0010]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe001a010  ! 55: LDUW_I	lduw	[%r6 + 0x0010], %r16
	.word 0xa2098008  ! 56: AND_R	and 	%r6, %r8, %r17
	.word 0xe021a028  ! 57: STW_I	stw	%r16, [%r6 + 0x0028]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0418008  ! 61: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa2118008  ! 62: OR_R	or 	%r6, %r8, %r17
	.word 0xe429a018  ! 63: STB_I	stb	%r18, [%r6 + 0x0018]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec41a018  ! 67: LDSW_I	ldsw	[%r6 + 0x0018], %r22
	.word 0xa8218008  ! 68: SUB_R	sub 	%r6, %r8, %r20
	.word 0xe0318008  ! 69: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe4198008  ! 73: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xa491a010  ! 74: ORcc_I	orcc 	%r6, 0x0010, %r18
	.word 0xec29a038  ! 75: STB_I	stb	%r22, [%r6 + 0x0038]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0418008  ! 79: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xac298008  ! 80: ANDN_R	andn 	%r6, %r8, %r22
	.word 0xe029a000  ! 81: STB_I	stb	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xec41a000  ! 85: LDSW_I	ldsw	[%r6 + 0x0000], %r22
	.word 0xa0198008  ! 86: XOR_R	xor 	%r6, %r8, %r16
	.word 0xe421a010  ! 87: STW_I	stw	%r18, [%r6 + 0x0010]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe809a010  ! 91: LDUB_I	ldub	[%r6 + 0x0010], %r20
	.word 0xa4298008  ! 92: ANDN_R	andn 	%r6, %r8, %r18
	.word 0xe439a018  ! 93: STD_I	std	%r18, [%r6 + 0x0018]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0118008  ! 97: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa8318008  ! 98: SUBC_R	orn 	%r6, %r8, %r20
	.word 0xe0298008  ! 99: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec51a030  ! 103: LDSH_I	ldsh	[%r6 + 0x0030], %r22
	.word 0xa2918008  ! 104: ORcc_R	orcc 	%r6, %r8, %r17
	.word 0xec318008  ! 105: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec018008  ! 109: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xa8b1a000  ! 110: SUBCcc_I	orncc 	%r6, 0x0000, %r20
	.word 0xe0218008  ! 111: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe8018008  ! 115: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xa0b9a030  ! 116: XNORcc_I	xnorcc 	%r6, 0x0030, %r16
	.word 0xe4718008  ! 117: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe8598008  ! 121: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xa099a028  ! 122: XORcc_I	xorcc 	%r6, 0x0028, %r16
	.word 0xe8218008  ! 123: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe451a020  ! 127: LDSH_I	ldsh	[%r6 + 0x0020], %r18
	.word 0xa4b1a000  ! 128: SUBCcc_I	orncc 	%r6, 0x0000, %r18
	.word 0xe0298008  ! 129: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe049a020  ! 133: LDSB_I	ldsb	[%r6 + 0x0020], %r16
	.word 0xaea9a020  ! 134: ANDNcc_I	andncc 	%r6, 0x0020, %r23
	.word 0xe039a020  ! 135: STD_I	std	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe049a020  ! 139: LDSB_I	ldsb	[%r6 + 0x0020], %r16
	.word 0xa6318008  ! 140: ORN_R	orn 	%r6, %r8, %r19
	.word 0xe0298008  ! 141: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe059a008  ! 145: LDX_I	ldx	[%r6 + 0x0008], %r16
	.word 0xa4b98008  ! 146: XNORcc_R	xnorcc 	%r6, %r8, %r18
	.word 0xe871a000  ! 147: STX_I	stx	%r20, [%r6 + 0x0000]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe059a000  ! 151: LDX_I	ldx	[%r6 + 0x0000], %r16
	.word 0xaca1a018  ! 152: SUBcc_I	subcc 	%r6, 0x0018, %r22
	.word 0xe831a020  ! 153: STH_I	sth	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec41a020  ! 157: LDSW_I	ldsw	[%r6 + 0x0020], %r22
	.word 0xac99a030  ! 158: XORcc_I	xorcc 	%r6, 0x0030, %r22
	.word 0xe871a038  ! 159: STX_I	stx	%r20, [%r6 + 0x0038]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec018008  ! 163: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xaa19a010  ! 164: XOR_I	xor 	%r6, 0x0010, %r21
	.word 0xe0718008  ! 165: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0198008  ! 169: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa6218008  ! 170: SUB_R	sub 	%r6, %r8, %r19
	.word 0xec318008  ! 171: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec51a030  ! 175: LDSH_I	ldsh	[%r6 + 0x0030], %r22
	.word 0xa4418008  ! 176: ADDC_R	addc 	%r6, %r8, %r18
	.word 0xe871a008  ! 177: STX_I	stx	%r20, [%r6 + 0x0008]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe059a008  ! 181: LDX_I	ldx	[%r6 + 0x0008], %r16
	.word 0xae918008  ! 182: ORcc_R	orcc 	%r6, %r8, %r23
	.word 0xe071a020  ! 183: STX_I	stx	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0198008  ! 187: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xae818008  ! 188: ADDcc_R	addcc 	%r6, %r8, %r23
	.word 0xe031a020  ! 189: STH_I	sth	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec018008  ! 193: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xac41a018  ! 194: ADDC_I	addc 	%r6, 0x0018, %r22
	.word 0xe821a030  ! 195: STW_I	stw	%r20, [%r6 + 0x0030]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec098008  ! 199: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xa681a020  ! 200: ADDcc_I	addcc 	%r6, 0x0020, %r19
	.word 0xe0298008  ! 201: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe001a038  ! 205: LDUW_I	lduw	[%r6 + 0x0038], %r16
	.word 0xa8198008  ! 206: XOR_R	xor 	%r6, %r8, %r20
	.word 0xec318008  ! 207: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe051a020  ! 211: LDSH_I	ldsh	[%r6 + 0x0020], %r16
	.word 0xae41a018  ! 212: ADDC_I	addc 	%r6, 0x0018, %r23
	.word 0xe8718008  ! 213: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe0018008  ! 217: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xa609a028  ! 218: AND_I	and 	%r6, 0x0028, %r19
	.word 0xe071a030  ! 219: STX_I	stx	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec518008  ! 223: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xa699a010  ! 224: XORcc_I	xorcc 	%r6, 0x0010, %r19
	.word 0xe021a010  ! 225: STW_I	stw	%r16, [%r6 + 0x0010]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe019a010  ! 229: LDD_I	ldd	[%r6 + 0x0010], %r16
	.word 0xaca98008  ! 230: ANDNcc_R	andncc 	%r6, %r8, %r22
	.word 0xe431a000  ! 231: STH_I	sth	%r18, [%r6 + 0x0000]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe801a000  ! 235: LDUW_I	lduw	[%r6 + 0x0000], %r20
	.word 0xaa31a038  ! 236: ORN_I	orn 	%r6, 0x0038, %r21
	.word 0xe071a030  ! 237: STX_I	stx	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0418008  ! 241: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xaa018008  ! 242: ADD_R	add 	%r6, %r8, %r21
	.word 0xe0398008  ! 243: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec198008  ! 247: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xa6b98008  ! 248: XNORcc_R	xnorcc 	%r6, %r8, %r19
	.word 0xe0718008  ! 249: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe851a028  ! 253: LDSH_I	ldsh	[%r6 + 0x0028], %r20
	.word 0xa0b98008  ! 254: XNORcc_R	xnorcc 	%r6, %r8, %r16
	.word 0xec71a020  ! 255: STX_I	stx	%r22, [%r6 + 0x0020]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xec418008  ! 259: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xae11a008  ! 260: OR_I	or 	%r6, 0x0008, %r23
	.word 0xe0318008  ! 261: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0118008  ! 265: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa8418008  ! 266: ADDC_R	addc 	%r6, %r8, %r20
	.word 0xe8398008  ! 267: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0198008  ! 271: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa211a028  ! 272: OR_I	or 	%r6, 0x0028, %r17
	.word 0xe471a018  ! 273: STX_I	stx	%r18, [%r6 + 0x0018]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec198008  ! 277: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xaaa18008  ! 278: SUBcc_R	subcc 	%r6, %r8, %r21
	.word 0xec29a028  ! 279: STB_I	stb	%r22, [%r6 + 0x0028]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe009a028  ! 283: LDUB_I	ldub	[%r6 + 0x0028], %r16
	.word 0xac91a010  ! 284: ORcc_I	orcc 	%r6, 0x0010, %r22
	.word 0xec718008  ! 285: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe051a028  ! 289: LDSH_I	ldsh	[%r6 + 0x0028], %r16
	.word 0xa889a030  ! 290: ANDcc_I	andcc 	%r6, 0x0030, %r20
	.word 0xe8318008  ! 291: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe811a000  ! 1: LDUH_I	lduh	[%r6 + 0x0000], %r20
	.word 0xaa41a028  ! 2: ADDC_I	addc 	%r6, 0x0028, %r21
	.word 0xec718008  ! 3: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0018008  ! 7: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xaa998008  ! 8: XORcc_R	xorcc 	%r6, %r8, %r21
	.word 0xec71a010  ! 9: STX_I	stx	%r22, [%r6 + 0x0010]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe851a010  ! 13: LDSH_I	ldsh	[%r6 + 0x0010], %r20
	.word 0xa6a98008  ! 14: ANDNcc_R	andncc 	%r6, %r8, %r19
	.word 0xec29a028  ! 15: STB_I	stb	%r22, [%r6 + 0x0028]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe4198008  ! 19: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xa0b1a038  ! 20: ORNcc_I	orncc 	%r6, 0x0038, %r16
	.word 0xe029a020  ! 21: STB_I	stb	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe8118008  ! 25: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xaab18008  ! 26: ORNcc_R	orncc 	%r6, %r8, %r21
	.word 0xe031a008  ! 27: STH_I	sth	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe4018008  ! 31: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xaec18008  ! 32: ADDCcc_R	addccc 	%r6, %r8, %r23
	.word 0xe8718008  ! 33: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0598008  ! 37: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa0418008  ! 38: ADDC_R	addc 	%r6, %r8, %r16
	.word 0xe031a030  ! 39: STH_I	sth	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe049a030  ! 43: LDSB_I	ldsb	[%r6 + 0x0030], %r16
	.word 0xa2898008  ! 44: ANDcc_R	andcc 	%r6, %r8, %r17
	.word 0xe0398008  ! 45: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe441a018  ! 49: LDSW_I	ldsw	[%r6 + 0x0018], %r18
	.word 0xa201a028  ! 50: ADD_I	add 	%r6, 0x0028, %r17
	.word 0xe0218008  ! 51: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe019a010  ! 55: LDD_I	ldd	[%r6 + 0x0010], %r16
	.word 0xaeb1a028  ! 56: ORNcc_I	orncc 	%r6, 0x0028, %r23
	.word 0xec39a028  ! 57: STD_I	std	%r22, [%r6 + 0x0028]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe001a028  ! 61: LDUW_I	lduw	[%r6 + 0x0028], %r16
	.word 0xa8818008  ! 62: ADDcc_R	addcc 	%r6, %r8, %r20
	.word 0xe021a018  ! 63: STW_I	stw	%r16, [%r6 + 0x0018]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe801a018  ! 67: LDUW_I	lduw	[%r6 + 0x0018], %r20
	.word 0xa0818008  ! 68: ADDcc_R	addcc 	%r6, %r8, %r16
	.word 0xe871a030  ! 69: STX_I	stx	%r20, [%r6 + 0x0030]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0098008  ! 73: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa611a038  ! 74: OR_I	or 	%r6, 0x0038, %r19
	.word 0xe4318008  ! 75: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe041a038  ! 79: LDSW_I	ldsw	[%r6 + 0x0038], %r16
	.word 0xa429a038  ! 80: ANDN_I	andn 	%r6, 0x0038, %r18
	.word 0xec218008  ! 81: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe451a000  ! 85: LDSH_I	ldsh	[%r6 + 0x0000], %r18
	.word 0xa4b1a010  ! 86: ORNcc_I	orncc 	%r6, 0x0010, %r18
	.word 0xec398008  ! 87: STD_R	std	%r22, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe409a010  ! 91: LDUB_I	ldub	[%r6 + 0x0010], %r18
	.word 0xacc1a030  ! 92: ADDCcc_I	addccc 	%r6, 0x0030, %r22
	.word 0xe0298008  ! 93: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0598008  ! 97: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xaa318008  ! 98: ORN_R	orn 	%r6, %r8, %r21
	.word 0xe0298008  ! 99: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe041a030  ! 103: LDSW_I	ldsw	[%r6 + 0x0030], %r16
	.word 0xa841a000  ! 104: ADDC_I	addc 	%r6, 0x0000, %r20
	.word 0xe8718008  ! 105: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0518008  ! 109: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa419a008  ! 110: XOR_I	xor 	%r6, 0x0008, %r18
	.word 0xe021a008  ! 111: STW_I	stw	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe001a008  ! 115: LDUW_I	lduw	[%r6 + 0x0008], %r16
	.word 0xa0418008  ! 116: ADDC_R	addc 	%r6, %r8, %r16
	.word 0xec31a030  ! 117: STH_I	sth	%r22, [%r6 + 0x0030]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe8418008  ! 121: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xac89a028  ! 122: ANDcc_I	andcc 	%r6, 0x0028, %r22
	.word 0xec718008  ! 123: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0518008  ! 127: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xaaa18008  ! 128: SUBcc_R	subcc 	%r6, %r8, %r21
	.word 0xec39a020  ! 129: STD_I	std	%r22, [%r6 + 0x0020]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe8418008  ! 133: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xae218008  ! 134: SUB_R	sub 	%r6, %r8, %r23
	.word 0xec318008  ! 135: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe0018008  ! 139: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xa8c1a008  ! 140: ADDCcc_I	addccc 	%r6, 0x0008, %r20
	.word 0xe831a008  ! 141: STH_I	sth	%r20, [%r6 + 0x0008]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe009a008  ! 145: LDUB_I	ldub	[%r6 + 0x0008], %r16
	.word 0xa6b98008  ! 146: XNORcc_R	xnorcc 	%r6, %r8, %r19
	.word 0xe0298008  ! 147: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec59a000  ! 151: LDX_I	ldx	[%r6 + 0x0000], %r22
	.word 0xaaa9a030  ! 152: ANDNcc_I	andncc 	%r6, 0x0030, %r21
	.word 0xe0318008  ! 153: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe049a020  ! 157: LDSB_I	ldsb	[%r6 + 0x0020], %r16
	.word 0xa2c1a018  ! 158: ADDCcc_I	addccc 	%r6, 0x0018, %r17
	.word 0xe439a038  ! 159: STD_I	std	%r18, [%r6 + 0x0038]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe049a038  ! 163: LDSB_I	ldsb	[%r6 + 0x0038], %r16
	.word 0xa6298008  ! 164: ANDN_R	andn 	%r6, %r8, %r19
	.word 0xe439a010  ! 165: STD_I	std	%r18, [%r6 + 0x0010]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe8018008  ! 169: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xa231a038  ! 170: ORN_I	orn 	%r6, 0x0038, %r17
	.word 0xe8718008  ! 171: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe8518008  ! 175: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xa8b98008  ! 176: XNORcc_R	xnorcc 	%r6, %r8, %r20
	.word 0xe471a008  ! 177: STX_I	stx	%r18, [%r6 + 0x0008]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe401a008  ! 181: LDUW_I	lduw	[%r6 + 0x0008], %r18
	.word 0xa0b18008  ! 182: ORNcc_R	orncc 	%r6, %r8, %r16
	.word 0xe4298008  ! 183: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe8018008  ! 187: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xa4998008  ! 188: XORcc_R	xorcc 	%r6, %r8, %r18
	.word 0xe0218008  ! 189: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec19a020  ! 193: LDD_I	ldd	[%r6 + 0x0020], %r22
	.word 0xac218008  ! 194: SUB_R	sub 	%r6, %r8, %r22
	.word 0xe4398008  ! 195: STD_R	std	%r18, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec11a030  ! 199: LDUH_I	lduh	[%r6 + 0x0030], %r22
	.word 0xa6298008  ! 200: ANDN_R	andn 	%r6, %r8, %r19
	.word 0xe0318008  ! 201: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe449a038  ! 205: LDSB_I	ldsb	[%r6 + 0x0038], %r18
	.word 0xa2a18008  ! 206: SUBcc_R	subcc 	%r6, %r8, %r17
	.word 0xe4298008  ! 207: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0598008  ! 211: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa241a030  ! 212: ADDC_I	addc 	%r6, 0x0030, %r17
	.word 0xe8398008  ! 213: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0518008  ! 217: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xac098008  ! 218: AND_R	and 	%r6, %r8, %r22
	.word 0xe0218008  ! 219: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe009a030  ! 223: LDUB_I	ldub	[%r6 + 0x0030], %r16
	.word 0xa2818008  ! 224: ADDcc_R	addcc 	%r6, %r8, %r17
	.word 0xe821a010  ! 225: STW_I	stw	%r20, [%r6 + 0x0010]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe8498008  ! 229: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xa8318008  ! 230: SUBC_R	orn 	%r6, %r8, %r20
	.word 0xe829a000  ! 231: STB_I	stb	%r20, [%r6 + 0x0000]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe811a000  ! 235: LDUH_I	lduh	[%r6 + 0x0000], %r20
	.word 0xa499a008  ! 236: XORcc_I	xorcc 	%r6, 0x0008, %r18
	.word 0xec218008  ! 237: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec59a030  ! 241: LDX_I	ldx	[%r6 + 0x0030], %r22
	.word 0xa691a030  ! 242: ORcc_I	orcc 	%r6, 0x0030, %r19
	.word 0xe0218008  ! 243: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe8018008  ! 247: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xa4c18008  ! 248: ADDCcc_R	addccc 	%r6, %r8, %r18
	.word 0xec398008  ! 249: STD_R	std	%r22, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe8598008  ! 253: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xa2b18008  ! 254: ORNcc_R	orncc 	%r6, %r8, %r17
	.word 0xe0218008  ! 255: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0198008  ! 259: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa6c1a008  ! 260: ADDCcc_I	addccc 	%r6, 0x0008, %r19
	.word 0xe0218008  ! 261: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe0418008  ! 265: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa831a010  ! 266: SUBC_I	orn 	%r6, 0x0010, %r20
	.word 0xe871a020  ! 267: STX_I	stx	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe049a020  ! 271: LDSB_I	ldsb	[%r6 + 0x0020], %r16
	.word 0xa601a030  ! 272: ADD_I	add 	%r6, 0x0030, %r19
	.word 0xe0398008  ! 273: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe801a018  ! 277: LDUW_I	lduw	[%r6 + 0x0018], %r20
	.word 0xa0918008  ! 278: ORcc_R	orcc 	%r6, %r8, %r16
	.word 0xe029a028  ! 279: STB_I	stb	%r16, [%r6 + 0x0028]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe009a028  ! 283: LDUB_I	ldub	[%r6 + 0x0028], %r16
	.word 0xac21a010  ! 284: SUB_I	sub 	%r6, 0x0010, %r22
	.word 0xe0318008  ! 285: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe4018008  ! 289: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xa0818008  ! 290: ADDcc_R	addcc 	%r6, %r8, %r16
	.word 0xe0218008  ! 291: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe049a000  ! 1: LDSB_I	ldsb	[%r6 + 0x0000], %r16
	.word 0xa411a030  ! 2: OR_I	or 	%r6, 0x0030, %r18
	.word 0xe8218008  ! 3: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe8598008  ! 7: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xa041a000  ! 8: ADDC_I	addc 	%r6, 0x0000, %r16
	.word 0xe8318008  ! 9: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe4498008  ! 13: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xa6c18008  ! 14: ADDCcc_R	addccc 	%r6, %r8, %r19
	.word 0xe0398008  ! 15: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xec118008  ! 19: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xa0898008  ! 20: ANDcc_R	andcc 	%r6, %r8, %r16
	.word 0xe871a020  ! 21: STX_I	stx	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe011a020  ! 25: LDUH_I	lduh	[%r6 + 0x0020], %r16
	.word 0xaa918008  ! 26: ORcc_R	orcc 	%r6, %r8, %r21
	.word 0xe8398008  ! 27: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe8418008  ! 31: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xa4998008  ! 32: XORcc_R	xorcc 	%r6, %r8, %r18
	.word 0xe471a020  ! 33: STX_I	stx	%r18, [%r6 + 0x0020]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe8018008  ! 37: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xa091a038  ! 38: ORcc_I	orcc 	%r6, 0x0038, %r16
	.word 0xe0298008  ! 39: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec518008  ! 43: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xac318008  ! 44: SUBC_R	orn 	%r6, %r8, %r22
	.word 0xe0718008  ! 45: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe859a018  ! 49: LDX_I	ldx	[%r6 + 0x0018], %r20
	.word 0xa0218008  ! 50: SUB_R	sub 	%r6, %r8, %r16
	.word 0xe0398008  ! 51: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec018008  ! 55: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xa8098008  ! 56: AND_R	and 	%r6, %r8, %r20
	.word 0xe0718008  ! 57: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe001a028  ! 61: LDUW_I	lduw	[%r6 + 0x0028], %r16
	.word 0xa439a018  ! 62: XNOR_I	xnor 	%r6, 0x0018, %r18
	.word 0xe0298008  ! 63: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0018008  ! 67: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xa831a030  ! 68: SUBC_I	orn 	%r6, 0x0030, %r20
	.word 0xe4298008  ! 69: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe059a030  ! 73: LDX_I	ldx	[%r6 + 0x0030], %r16
	.word 0xa6b18008  ! 74: ORNcc_R	orncc 	%r6, %r8, %r19
	.word 0xe421a038  ! 75: STW_I	stw	%r18, [%r6 + 0x0038]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe011a038  ! 79: LDUH_I	lduh	[%r6 + 0x0038], %r16
	.word 0xa4b1a000  ! 80: ORNcc_I	orncc 	%r6, 0x0000, %r18
	.word 0xe029a000  ! 81: STB_I	stb	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe0018008  ! 85: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xa4b18008  ! 86: ORNcc_R	orncc 	%r6, %r8, %r18
	.word 0xe831a010  ! 87: STH_I	sth	%r20, [%r6 + 0x0010]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe8418008  ! 91: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xa8898008  ! 92: ANDcc_R	andcc 	%r6, %r8, %r20
	.word 0xe0718008  ! 93: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0118008  ! 97: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xae298008  ! 98: ANDN_R	andn 	%r6, %r8, %r23
	.word 0xe0718008  ! 99: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0598008  ! 103: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa4118008  ! 104: OR_R	or 	%r6, %r8, %r18
	.word 0xe829a008  ! 105: STB_I	stb	%r20, [%r6 + 0x0008]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec01a008  ! 109: LDUW_I	lduw	[%r6 + 0x0008], %r22
	.word 0xac898008  ! 110: ANDcc_R	andcc 	%r6, %r8, %r22
	.word 0xec31a008  ! 111: STH_I	sth	%r22, [%r6 + 0x0008]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe859a008  ! 115: LDX_I	ldx	[%r6 + 0x0008], %r20
	.word 0xa0818008  ! 116: ADDcc_R	addcc 	%r6, %r8, %r16
	.word 0xe0718008  ! 117: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe8118008  ! 121: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xa241a020  ! 122: ADDC_I	addc 	%r6, 0x0020, %r17
	.word 0xec31a020  ! 123: STH_I	sth	%r22, [%r6 + 0x0020]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe009a020  ! 127: LDUB_I	ldub	[%r6 + 0x0020], %r16
	.word 0xa819a020  ! 128: XOR_I	xor 	%r6, 0x0020, %r20
	.word 0xe021a020  ! 129: STW_I	stw	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe419a020  ! 133: LDD_I	ldd	[%r6 + 0x0020], %r18
	.word 0xaea18008  ! 134: SUBcc_R	subcc 	%r6, %r8, %r23
	.word 0xe821a020  ! 135: STW_I	stw	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe4518008  ! 139: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xa4818008  ! 140: ADDcc_R	addcc 	%r6, %r8, %r18
	.word 0xe829a008  ! 141: STB_I	stb	%r20, [%r6 + 0x0008]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe051a008  ! 145: LDSH_I	ldsh	[%r6 + 0x0008], %r16
	.word 0xa0b1a000  ! 146: ORNcc_I	orncc 	%r6, 0x0000, %r16
	.word 0xec39a000  ! 147: STD_I	std	%r22, [%r6 + 0x0000]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe801a000  ! 151: LDUW_I	lduw	[%r6 + 0x0000], %r20
	.word 0xaa418008  ! 152: ADDC_R	addc 	%r6, %r8, %r21
	.word 0xe031a020  ! 153: STH_I	sth	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe849a020  ! 157: LDSB_I	ldsb	[%r6 + 0x0020], %r20
	.word 0xae31a010  ! 158: ORN_I	orn 	%r6, 0x0010, %r23
	.word 0xec71a038  ! 159: STX_I	stx	%r22, [%r6 + 0x0038]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec11a038  ! 163: LDUH_I	lduh	[%r6 + 0x0038], %r22
	.word 0xa4818008  ! 164: ADDcc_R	addcc 	%r6, %r8, %r18
	.word 0xe4718008  ! 165: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe8018008  ! 169: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xaa31a030  ! 170: SUBC_I	orn 	%r6, 0x0030, %r21
	.word 0xe8718008  ! 171: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe0098008  ! 175: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa2198008  ! 176: XOR_R	xor 	%r6, %r8, %r17
	.word 0xe0318008  ! 177: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe4018008  ! 181: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xa411a030  ! 182: OR_I	or 	%r6, 0x0030, %r18
	.word 0xe0398008  ! 183: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe041a020  ! 187: LDSW_I	ldsw	[%r6 + 0x0020], %r16
	.word 0xaab18008  ! 188: ORNcc_R	orncc 	%r6, %r8, %r21
	.word 0xe8218008  ! 189: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe859a020  ! 193: LDX_I	ldx	[%r6 + 0x0020], %r20
	.word 0xac198008  ! 194: XOR_R	xor 	%r6, %r8, %r22
	.word 0xe439a030  ! 195: STD_I	std	%r18, [%r6 + 0x0030]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0498008  ! 199: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xa429a038  ! 200: ANDN_I	andn 	%r6, 0x0038, %r18
	.word 0xe021a038  ! 201: STW_I	stw	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe059a038  ! 205: LDX_I	ldx	[%r6 + 0x0038], %r16
	.word 0xa8b98008  ! 206: XNORcc_R	xnorcc 	%r6, %r8, %r20
	.word 0xe0218008  ! 207: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe4098008  ! 211: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xaa41a038  ! 212: ADDC_I	addc 	%r6, 0x0038, %r21
	.word 0xe4318008  ! 213: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec418008  ! 217: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xa401a000  ! 218: ADD_I	add 	%r6, 0x0000, %r18
	.word 0xe0398008  ! 219: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe0198008  ! 223: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa0318008  ! 224: SUBC_R	orn 	%r6, %r8, %r16
	.word 0xec298008  ! 225: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe801a010  ! 229: LDUW_I	lduw	[%r6 + 0x0010], %r20
	.word 0xac91a030  ! 230: ORcc_I	orcc 	%r6, 0x0030, %r22
	.word 0xe431a000  ! 231: STH_I	sth	%r18, [%r6 + 0x0000]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe8098008  ! 235: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xa639a030  ! 236: XNOR_I	xnor 	%r6, 0x0030, %r19
	.word 0xe071a030  ! 237: STX_I	stx	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe809a030  ! 241: LDUB_I	ldub	[%r6 + 0x0030], %r20
	.word 0xa6218008  ! 242: SUB_R	sub 	%r6, %r8, %r19
	.word 0xe421a030  ! 243: STW_I	stw	%r18, [%r6 + 0x0030]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec518008  ! 247: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xa2318008  ! 248: ORN_R	orn 	%r6, %r8, %r17
	.word 0xe0298008  ! 249: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe819a028  ! 253: LDD_I	ldd	[%r6 + 0x0028], %r20
	.word 0xa8c18008  ! 254: ADDCcc_R	addccc 	%r6, %r8, %r20
	.word 0xe829a020  ! 255: STB_I	stb	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec598008  ! 259: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xa2418008  ! 260: ADDC_R	addc 	%r6, %r8, %r17
	.word 0xe0718008  ! 261: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe0098008  ! 265: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xaac1a020  ! 266: ADDCcc_I	addccc 	%r6, 0x0020, %r21
	.word 0xe031a020  ! 267: STH_I	sth	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0118008  ! 271: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa241a000  ! 272: ADDC_I	addc 	%r6, 0x0000, %r17
	.word 0xec71a018  ! 273: STX_I	stx	%r22, [%r6 + 0x0018]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe849a018  ! 277: LDSB_I	ldsb	[%r6 + 0x0018], %r20
	.word 0xa6218008  ! 278: SUB_R	sub 	%r6, %r8, %r19
	.word 0xec71a028  ! 279: STX_I	stx	%r22, [%r6 + 0x0028]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe4598008  ! 283: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xa6b9a018  ! 284: XNORcc_I	xnorcc 	%r6, 0x0018, %r19
	.word 0xe029a028  ! 285: STB_I	stb	%r16, [%r6 + 0x0028]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe049a028  ! 289: LDSB_I	ldsb	[%r6 + 0x0028], %r16
	.word 0xa0c18008  ! 290: ADDCcc_R	addccc 	%r6, %r8, %r16
	.word 0xe0318008  ! 291: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0598008  ! 1: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xaa398008  ! 2: XNOR_R	xnor 	%r6, %r8, %r21
	.word 0xe071a010  ! 3: STX_I	stx	%r16, [%r6 + 0x0010]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec098008  ! 7: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xa6a9a010  ! 8: ANDNcc_I	andncc 	%r6, 0x0010, %r19
	.word 0xe0718008  ! 9: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe809a010  ! 13: LDUB_I	ldub	[%r6 + 0x0010], %r20
	.word 0xa829a010  ! 14: ANDN_I	andn 	%r6, 0x0010, %r20
	.word 0xec29a028  ! 15: STB_I	stb	%r22, [%r6 + 0x0028]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe859a028  ! 19: LDX_I	ldx	[%r6 + 0x0028], %r20
	.word 0xa429a028  ! 20: ANDN_I	andn 	%r6, 0x0028, %r18
	.word 0xe031a020  ! 21: STH_I	sth	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe059a020  ! 25: LDX_I	ldx	[%r6 + 0x0020], %r16
	.word 0xac21a008  ! 26: SUB_I	sub 	%r6, 0x0008, %r22
	.word 0xe0718008  ! 27: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe819a008  ! 31: LDD_I	ldd	[%r6 + 0x0008], %r20
	.word 0xae19a000  ! 32: XOR_I	xor 	%r6, 0x0000, %r23
	.word 0xec218008  ! 33: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec098008  ! 37: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xa041a028  ! 38: ADDC_I	addc 	%r6, 0x0028, %r16
	.word 0xe0218008  ! 39: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe4198008  ! 43: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xa4a9a018  ! 44: ANDNcc_I	andncc 	%r6, 0x0018, %r18
	.word 0xec29a018  ! 45: STB_I	stb	%r22, [%r6 + 0x0018]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe8518008  ! 49: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xaa41a010  ! 50: ADDC_I	addc 	%r6, 0x0010, %r21
	.word 0xe421a010  ! 51: STW_I	stw	%r18, [%r6 + 0x0010]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe401a010  ! 55: LDUW_I	lduw	[%r6 + 0x0010], %r18
	.word 0xa2098008  ! 56: AND_R	and 	%r6, %r8, %r17
	.word 0xe031a028  ! 57: STH_I	sth	%r16, [%r6 + 0x0028]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe8118008  ! 61: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xa6c18008  ! 62: ADDCcc_R	addccc 	%r6, %r8, %r19
	.word 0xe4718008  ! 63: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe411a018  ! 67: LDUH_I	lduh	[%r6 + 0x0018], %r18
	.word 0xa0a98008  ! 68: ANDNcc_R	andncc 	%r6, %r8, %r16
	.word 0xe031a030  ! 69: STH_I	sth	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe8118008  ! 73: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xa0318008  ! 74: SUBC_R	orn 	%r6, %r8, %r16
	.word 0xe8298008  ! 75: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe8118008  ! 79: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xae418008  ! 80: ADDC_R	addc 	%r6, %r8, %r23
	.word 0xe0218008  ! 81: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe411a000  ! 85: LDUH_I	lduh	[%r6 + 0x0000], %r18
	.word 0xa809a000  ! 86: AND_I	and 	%r6, 0x0000, %r20
	.word 0xe421a010  ! 87: STW_I	stw	%r18, [%r6 + 0x0010]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe411a010  ! 91: LDUH_I	lduh	[%r6 + 0x0010], %r18
	.word 0xae91a018  ! 92: ORcc_I	orcc 	%r6, 0x0018, %r23
	.word 0xe471a018  ! 93: STX_I	stx	%r18, [%r6 + 0x0018]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec11a018  ! 97: LDUH_I	lduh	[%r6 + 0x0018], %r22
	.word 0xaa998008  ! 98: XORcc_R	xorcc 	%r6, %r8, %r21
	.word 0xec718008  ! 99: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec59a030  ! 103: LDX_I	ldx	[%r6 + 0x0030], %r22
	.word 0xa8318008  ! 104: SUBC_R	orn 	%r6, %r8, %r20
	.word 0xec398008  ! 105: STD_R	std	%r22, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0498008  ! 109: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xae818008  ! 110: ADDcc_R	addcc 	%r6, %r8, %r23
	.word 0xe431a008  ! 111: STH_I	sth	%r18, [%r6 + 0x0008]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0418008  ! 115: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xaa098008  ! 116: AND_R	and 	%r6, %r8, %r21
	.word 0xe039a030  ! 117: STD_I	std	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe401a030  ! 121: LDUW_I	lduw	[%r6 + 0x0030], %r18
	.word 0xa6318008  ! 122: SUBC_R	orn 	%r6, %r8, %r19
	.word 0xe0218008  ! 123: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec19a020  ! 127: LDD_I	ldd	[%r6 + 0x0020], %r22
	.word 0xa8118008  ! 128: OR_R	or 	%r6, %r8, %r20
	.word 0xec71a020  ! 129: STX_I	stx	%r22, [%r6 + 0x0020]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe4498008  ! 133: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xa4a18008  ! 134: SUBcc_R	subcc 	%r6, %r8, %r18
	.word 0xe831a020  ! 135: STH_I	sth	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe859a020  ! 139: LDX_I	ldx	[%r6 + 0x0020], %r20
	.word 0xa631a038  ! 140: ORN_I	orn 	%r6, 0x0038, %r19
	.word 0xe021a008  ! 141: STW_I	stw	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe0198008  ! 145: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xacb18008  ! 146: ORNcc_R	orncc 	%r6, %r8, %r22
	.word 0xe0298008  ! 147: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0198008  ! 151: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xaea9a038  ! 152: ANDNcc_I	andncc 	%r6, 0x0038, %r23
	.word 0xe8218008  ! 153: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe411a020  ! 157: LDUH_I	lduh	[%r6 + 0x0020], %r18
	.word 0xa8418008  ! 158: ADDC_R	addc 	%r6, %r8, %r20
	.word 0xe839a038  ! 159: STD_I	std	%r20, [%r6 + 0x0038]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe0518008  ! 163: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa2b98008  ! 164: XNORcc_R	xnorcc 	%r6, %r8, %r17
	.word 0xe029a010  ! 165: STB_I	stb	%r16, [%r6 + 0x0010]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe8498008  ! 169: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xaa298008  ! 170: ANDN_R	andn 	%r6, %r8, %r21
	.word 0xe0318008  ! 171: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0118008  ! 175: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa801a030  ! 176: ADD_I	add 	%r6, 0x0030, %r20
	.word 0xe4218008  ! 177: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe809a008  ! 181: LDUB_I	ldub	[%r6 + 0x0008], %r20
	.word 0xa411a020  ! 182: OR_I	or 	%r6, 0x0020, %r18
	.word 0xe4318008  ! 183: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe8198008  ! 187: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xae11a028  ! 188: OR_I	or 	%r6, 0x0028, %r23
	.word 0xe4218008  ! 189: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe801a020  ! 193: LDUW_I	lduw	[%r6 + 0x0020], %r20
	.word 0xa2318008  ! 194: SUBC_R	orn 	%r6, %r8, %r17
	.word 0xec21a030  ! 195: STW_I	stw	%r22, [%r6 + 0x0030]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe051a030  ! 199: LDSH_I	ldsh	[%r6 + 0x0030], %r16
	.word 0xa6298008  ! 200: ANDN_R	andn 	%r6, %r8, %r19
	.word 0xe0298008  ! 201: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe8498008  ! 205: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xa4b1a010  ! 206: ORNcc_I	orncc 	%r6, 0x0010, %r18
	.word 0xe829a020  ! 207: STB_I	stb	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe0098008  ! 211: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa2818008  ! 212: ADDcc_R	addcc 	%r6, %r8, %r17
	.word 0xe8398008  ! 213: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe051a038  ! 217: LDSH_I	ldsh	[%r6 + 0x0038], %r16
	.word 0xa409a030  ! 218: AND_I	and 	%r6, 0x0030, %r18
	.word 0xe039a030  ! 219: STD_I	std	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe441a030  ! 223: LDSW_I	ldsw	[%r6 + 0x0030], %r18
	.word 0xa2818008  ! 224: ADDcc_R	addcc 	%r6, %r8, %r17
	.word 0xe839a010  ! 225: STD_I	std	%r20, [%r6 + 0x0010]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe8118008  ! 229: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xaa398008  ! 230: XNOR_R	xnor 	%r6, %r8, %r21
	.word 0xe8398008  ! 231: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe4198008  ! 235: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xac01a020  ! 236: ADD_I	add 	%r6, 0x0020, %r22
	.word 0xe4398008  ! 237: STD_R	std	%r18, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe401a030  ! 241: LDUW_I	lduw	[%r6 + 0x0030], %r18
	.word 0xa0198008  ! 242: XOR_R	xor 	%r6, %r8, %r16
	.word 0xe4318008  ! 243: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec198008  ! 247: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xaeb9a028  ! 248: XNORcc_I	xnorcc 	%r6, 0x0028, %r23
	.word 0xec71a028  ! 249: STX_I	stx	%r22, [%r6 + 0x0028]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe819a028  ! 253: LDD_I	ldd	[%r6 + 0x0028], %r20
	.word 0xa829a020  ! 254: ANDN_I	andn 	%r6, 0x0020, %r20
	.word 0xe021a020  ! 255: STW_I	stw	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec51a020  ! 259: LDSH_I	ldsh	[%r6 + 0x0020], %r22
	.word 0xa809a028  ! 260: AND_I	and 	%r6, 0x0028, %r20
	.word 0xe439a028  ! 261: STD_I	std	%r18, [%r6 + 0x0028]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec19a028  ! 265: LDD_I	ldd	[%r6 + 0x0028], %r22
	.word 0xa4318008  ! 266: ORN_R	orn 	%r6, %r8, %r18
	.word 0xe421a020  ! 267: STW_I	stw	%r18, [%r6 + 0x0020]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec01a020  ! 271: LDUW_I	lduw	[%r6 + 0x0020], %r22
	.word 0xa039a018  ! 272: XNOR_I	xnor 	%r6, 0x0018, %r16
	.word 0xe4718008  ! 273: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe419a018  ! 277: LDD_I	ldd	[%r6 + 0x0018], %r18
	.word 0xa8318008  ! 278: SUBC_R	orn 	%r6, %r8, %r20
	.word 0xe421a028  ! 279: STW_I	stw	%r18, [%r6 + 0x0028]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xec49a028  ! 283: LDSB_I	ldsb	[%r6 + 0x0028], %r22
	.word 0xaa01a028  ! 284: ADD_I	add 	%r6, 0x0028, %r21
	.word 0xe871a028  ! 285: STX_I	stx	%r20, [%r6 + 0x0028]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe8018008  ! 289: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xaa398008  ! 290: XNOR_R	xnor 	%r6, %r8, %r21
	.word 0xe039a030  ! 291: STD_I	std	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef018, %r1, %r6
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0018008  ! 1: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xaca1a010  ! 2: SUBcc_I	subcc 	%r6, 0x0010, %r22
	.word 0xe0398008  ! 3: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe001a010  ! 7: LDUW_I	lduw	[%r6 + 0x0010], %r16
	.word 0xa8a98008  ! 8: ANDNcc_R	andncc 	%r6, %r8, %r20
	.word 0xec71a010  ! 9: STX_I	stx	%r22, [%r6 + 0x0010]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe011a010  ! 13: LDUH_I	lduh	[%r6 + 0x0010], %r16
	.word 0xac09a028  ! 14: AND_I	and 	%r6, 0x0028, %r22
	.word 0xe071a028  ! 15: STX_I	stx	%r16, [%r6 + 0x0028]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec518008  ! 19: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xa499a020  ! 20: XORcc_I	xorcc 	%r6, 0x0020, %r18
	.word 0xe421a020  ! 21: STW_I	stw	%r18, [%r6 + 0x0020]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe8598008  ! 25: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xa4098008  ! 26: AND_R	and 	%r6, %r8, %r18
	.word 0xe021a008  ! 27: STW_I	stw	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xec198008  ! 31: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xae81a020  ! 32: ADDcc_I	addcc 	%r6, 0x0020, %r23
	.word 0xec21a020  ! 33: STW_I	stw	%r22, [%r6 + 0x0020]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0098008  ! 37: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa081a030  ! 38: ADDcc_I	addcc 	%r6, 0x0030, %r16
	.word 0xe031a030  ! 39: STH_I	sth	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe009a030  ! 43: LDUB_I	ldub	[%r6 + 0x0030], %r16
	.word 0xa0098008  ! 44: AND_R	and 	%r6, %r8, %r16
	.word 0xe8298008  ! 45: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe411a018  ! 49: LDUH_I	lduh	[%r6 + 0x0018], %r18
	.word 0xac818008  ! 50: ADDcc_R	addcc 	%r6, %r8, %r22
	.word 0xe871a010  ! 51: STX_I	stx	%r20, [%r6 + 0x0010]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe8018008  ! 55: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xa639a028  ! 56: XNOR_I	xnor 	%r6, 0x0028, %r19
	.word 0xe839a028  ! 57: STD_I	std	%r20, [%r6 + 0x0028]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe8498008  ! 61: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xaea18008  ! 62: SUBcc_R	subcc 	%r6, %r8, %r23
	.word 0xe0718008  ! 63: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe8118008  ! 67: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xa8c1a030  ! 68: ADDCcc_I	addccc 	%r6, 0x0030, %r20
	.word 0xe4298008  ! 69: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0098008  ! 73: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa629a038  ! 74: ANDN_I	andn 	%r6, 0x0038, %r19
	.word 0xe431a038  ! 75: STH_I	sth	%r18, [%r6 + 0x0038]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe809a038  ! 79: LDUB_I	ldub	[%r6 + 0x0038], %r20
	.word 0xa4018008  ! 80: ADD_R	add 	%r6, %r8, %r18
	.word 0xec21a000  ! 81: STW_I	stw	%r22, [%r6 + 0x0000]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe0518008  ! 85: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa291a010  ! 86: ORcc_I	orcc 	%r6, 0x0010, %r17
	.word 0xec29a010  ! 87: STB_I	stb	%r22, [%r6 + 0x0010]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xec51a010  ! 91: LDSH_I	ldsh	[%r6 + 0x0010], %r22
	.word 0xaeb18008  ! 92: ORNcc_R	orncc 	%r6, %r8, %r23
	.word 0xe0298008  ! 93: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe041a018  ! 97: LDSW_I	ldsw	[%r6 + 0x0018], %r16
	.word 0xa641a030  ! 98: ADDC_I	addc 	%r6, 0x0030, %r19
	.word 0xe4218008  ! 99: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec01a030  ! 103: LDUW_I	lduw	[%r6 + 0x0030], %r22
	.word 0xa4b9a008  ! 104: XNORcc_I	xnorcc 	%r6, 0x0008, %r18
	.word 0xe0298008  ! 105: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0518008  ! 109: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa6a98008  ! 110: ANDNcc_R	andncc 	%r6, %r8, %r19
	.word 0xe439a008  ! 111: STD_I	std	%r18, [%r6 + 0x0008]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe451a008  ! 115: LDSH_I	ldsh	[%r6 + 0x0008], %r18
	.word 0xa8a18008  ! 116: SUBcc_R	subcc 	%r6, %r8, %r20
	.word 0xe0398008  ! 117: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0418008  ! 121: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa6098008  ! 122: AND_R	and 	%r6, %r8, %r19
	.word 0xec31a020  ! 123: STH_I	sth	%r22, [%r6 + 0x0020]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe841a020  ! 127: LDSW_I	ldsw	[%r6 + 0x0020], %r20
	.word 0xa4318008  ! 128: SUBC_R	orn 	%r6, %r8, %r18
	.word 0xe0398008  ! 129: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe841a020  ! 133: LDSW_I	ldsw	[%r6 + 0x0020], %r20
	.word 0xa6b9a020  ! 134: XNORcc_I	xnorcc 	%r6, 0x0020, %r19
	.word 0xec718008  ! 135: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe8198008  ! 139: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xa001a008  ! 140: ADD_I	add 	%r6, 0x0008, %r16
	.word 0xec31a008  ! 141: STH_I	sth	%r22, [%r6 + 0x0008]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe001a008  ! 145: LDUW_I	lduw	[%r6 + 0x0008], %r16
	.word 0xae198008  ! 146: XOR_R	xor 	%r6, %r8, %r23
	.word 0xe821a000  ! 147: STW_I	stw	%r20, [%r6 + 0x0000]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe449a000  ! 151: LDSB_I	ldsb	[%r6 + 0x0000], %r18
	.word 0xa439a020  ! 152: XNOR_I	xnor 	%r6, 0x0020, %r18
	.word 0xe029a020  ! 153: STB_I	stb	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe011a020  ! 157: LDUH_I	lduh	[%r6 + 0x0020], %r16
	.word 0xaca9a038  ! 158: ANDNcc_I	andncc 	%r6, 0x0038, %r22
	.word 0xe021a038  ! 159: STW_I	stw	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe0098008  ! 163: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa6b18008  ! 164: SUBCcc_R	orncc 	%r6, %r8, %r19
	.word 0xe429a010  ! 165: STB_I	stb	%r18, [%r6 + 0x0010]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe019a010  ! 169: LDD_I	ldd	[%r6 + 0x0010], %r16
	.word 0xae418008  ! 170: ADDC_R	addc 	%r6, %r8, %r23
	.word 0xe071a030  ! 171: STX_I	stx	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe4118008  ! 175: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xac91a008  ! 176: ORcc_I	orcc 	%r6, 0x0008, %r22
	.word 0xe8718008  ! 177: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0018008  ! 181: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xa2998008  ! 182: XORcc_R	xorcc 	%r6, %r8, %r17
	.word 0xe431a020  ! 183: STH_I	sth	%r18, [%r6 + 0x0020]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0018008  ! 187: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xaa01a020  ! 188: ADD_I	add 	%r6, 0x0020, %r21
	.word 0xe0398008  ! 189: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe451a020  ! 193: LDSH_I	ldsh	[%r6 + 0x0020], %r18
	.word 0xa429a030  ! 194: ANDN_I	andn 	%r6, 0x0030, %r18
	.word 0xe0298008  ! 195: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe019a030  ! 199: LDD_I	ldd	[%r6 + 0x0030], %r16
	.word 0xa881a038  ! 200: ADDcc_I	addcc 	%r6, 0x0038, %r20
	.word 0xe4718008  ! 201: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec19a038  ! 205: LDD_I	ldd	[%r6 + 0x0038], %r22
	.word 0xa411a020  ! 206: OR_I	or 	%r6, 0x0020, %r18
	.word 0xe4718008  ! 207: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe451a020  ! 211: LDSH_I	ldsh	[%r6 + 0x0020], %r18
	.word 0xa6c18008  ! 212: ADDCcc_R	addccc 	%r6, %r8, %r19
	.word 0xec398008  ! 213: STD_R	std	%r22, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec518008  ! 217: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xaa21a030  ! 218: SUB_I	sub 	%r6, 0x0030, %r21
	.word 0xe031a030  ! 219: STH_I	sth	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe041a030  ! 223: LDSW_I	ldsw	[%r6 + 0x0030], %r16
	.word 0xa0b18008  ! 224: ORNcc_R	orncc 	%r6, %r8, %r16
	.word 0xec718008  ! 225: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec598008  ! 229: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xaab1a000  ! 230: ORNcc_I	orncc 	%r6, 0x0000, %r21
	.word 0xec718008  ! 231: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe011a000  ! 235: LDUH_I	lduh	[%r6 + 0x0000], %r16
	.word 0xa699a030  ! 236: XORcc_I	xorcc 	%r6, 0x0030, %r19
	.word 0xec218008  ! 237: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe4118008  ! 241: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xaa318008  ! 242: SUBC_R	orn 	%r6, %r8, %r21
	.word 0xec318008  ! 243: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe809a030  ! 247: LDUB_I	ldub	[%r6 + 0x0030], %r20
	.word 0xae898008  ! 248: ANDcc_R	andcc 	%r6, %r8, %r23
	.word 0xec71a028  ! 249: STX_I	stx	%r22, [%r6 + 0x0028]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe019a028  ! 253: LDD_I	ldd	[%r6 + 0x0028], %r16
	.word 0xa0318008  ! 254: SUBC_R	orn 	%r6, %r8, %r16
	.word 0xe821a020  ! 255: STW_I	stw	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe059a020  ! 259: LDX_I	ldx	[%r6 + 0x0020], %r16
	.word 0xac318008  ! 260: ORN_R	orn 	%r6, %r8, %r22
	.word 0xe4298008  ! 261: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe4118008  ! 265: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xac318008  ! 266: ORN_R	orn 	%r6, %r8, %r22
	.word 0xe421a020  ! 267: STW_I	stw	%r18, [%r6 + 0x0020]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe459a020  ! 271: LDX_I	ldx	[%r6 + 0x0020], %r18
	.word 0xa4118008  ! 272: OR_R	or 	%r6, %r8, %r18
	.word 0xe4298008  ! 273: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0418008  ! 277: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xacb18008  ! 278: ORNcc_R	orncc 	%r6, %r8, %r22
	.word 0xe4298008  ! 279: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec59a028  ! 283: LDX_I	ldx	[%r6 + 0x0028], %r22
	.word 0xa2198008  ! 284: XOR_R	xor 	%r6, %r8, %r17
	.word 0xe4718008  ! 285: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec418008  ! 289: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xa4918008  ! 290: ORcc_R	orcc 	%r6, %r8, %r18
	.word 0xe021a030  ! 291: STW_I	stw	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef010, %r1, %r6

join_lbl_0_0:



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
        RA=0x800e000000,
        PA=0x800e000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base0
ncdata_base0:
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
	.xword	0x7d858f2de66ccabe
	.xword	0xd8672a624649cd1e
	.xword	0x7f1acbb27421ae87
	.xword	0x22434e212bd726a3
	.xword	0x3b60a5e92f66ec4e
	.xword	0x2336df8868f5b6d5
	.xword	0xda416bef9cf3e265
	.xword	0xeacde023250b2dc4
	.xword	0x7310dc1c53b16e79
	.xword	0x6387efeccafc33c1
	.xword	0x2d0cc8df1bef9226
	.xword	0xeef867469b6b666a
	.xword	0xfe5e6c0d8b00b611
	.xword	0x5656d07a02da2e48
	.xword	0x0a003d9ab9ef3d55
	.xword	0x60b7b79c9e309055
	.xword	0x6f9db581f04d3f83
	.xword	0xdf4a53e8bde9ad3e
	.xword	0x9b1f83f532eb23df
	.xword	0x11f8b6178e793147
	.xword	0x3de13015303c8960
	.xword	0x054867bfd6571c98
	.xword	0x255994e1ef4f73ec
	.xword	0x198056a8679b8b7a
	.xword	0x34ebfb0dcc28d983
	.xword	0xcfa37139ca88c17c
	.xword	0xba598eba8d3db0d7
	.xword	0xd5b96dce9034e843
	.xword	0x6d687299e65b2970
	.xword	0xe96d55bc463fb804
	.xword	0x6c699b59b831daaf
	.xword	0x782e4536f9272523
	.xword	0x57a525a788c38acb
	.xword	0xa0e1de02aafe5bab
	.xword	0xf219576846d0c5f2
	.xword	0x6454465cdec49739
	.xword	0x488ce7a414209c25
	.xword	0xf7bad7f6bdf67d2e
	.xword	0xcd580e48820a2635
	.xword	0x2004e0cbf60e0248
	.xword	0xb42c643ebdf19520
	.xword	0x59bc94c19b734ef4
	.xword	0x78df8a89ba60a961
	.xword	0xb6b7818dc8d7ffae
	.xword	0x57ecebab5c79bf3a
	.xword	0xb175602af6c74ac4
	.xword	0x3cd39ccac7a9d244
	.xword	0xfaf3e55540bcc36e
	.xword	0x49f40a5df1f6e168
	.xword	0x3a852024153184cd
	.xword	0x6949478781d272d6
	.xword	0x60279b15fef3ff7f
	.xword	0x7d5db5a04fda3d7f
	.xword	0xe23129869eab7394
	.xword	0x1e6c0f2b67812516
	.xword	0x384477735bcec1f3
	.xword	0xd4539163328b8dbb
	.xword	0xc44386ad8ad644ae
	.xword	0xe45822e70f506a71
	.xword	0xbcfaf69a642d4afd
	.xword	0x12e17bd0d91cd010
	.xword	0xe07b0596f8dfda75
	.xword	0xd964feb4521e3752
	.xword	0xf956307308ece9f2
	.xword	0x5d9b4db160c30380
	.xword	0x842f2b19e3a6bc7e
	.xword	0x3e978289d97d5496
	.xword	0x6f96a4a29d409cb3
	.xword	0xd807dba3323b0ecc
	.xword	0x19d75f38830c0d7c
	.xword	0x4fcced6ff01fbd58
	.xword	0xc1530eaee55f99e1
	.xword	0x717875f2ad852c57
	.xword	0xfb0914191eaf8e8a
	.xword	0x02af8524e05f757a
	.xword	0xcd6717ab887416e3
	.xword	0x2f96362dcba863d1
	.xword	0xe08e207928d8cc78
	.xword	0x75e4e2a8074ea14c
	.xword	0x297eb21394aa7406
	.xword	0xd6d1f3e0655c35f9
	.xword	0x17104de0f7efa714
	.xword	0x0224557679a4dd67
	.xword	0x51992e0f06113dcf
	.xword	0x7ecdcd8907b9338e
	.xword	0xf556459736d35d4d
	.xword	0x08997e9771fc432b
	.xword	0x62f599102c873e6f
	.xword	0x6acf8465f68012a6
	.xword	0x668d17c99c83018c
	.xword	0x5060fd0fc8c4bc22
	.xword	0x69d55161f7a8816f
	.xword	0xc78e798d32963456
	.xword	0x58a3c31b03dfb4ff
	.xword	0x3e6096300587ae19
	.xword	0xfda6deb406069061
	.xword	0xf4b342074ef54508
	.xword	0x110f88c6809557bd
	.xword	0xf0c5ff47c63395d5
	.xword	0x3a660bd6992eaf25
	.xword	0x11c3c8b27a96874b
	.xword	0xca12830443eefbca
	.xword	0xd68cbcc7ac069111
	.xword	0xe355af1a44a0d25a
	.xword	0x3f7ba329c13b4fc1
	.xword	0x883fe677e4dd9f56
	.xword	0x61e62efddb2abc06
	.xword	0xd313e69eb584e810
	.xword	0xd3122858ad7a25df
	.xword	0x17106400beb2d208
	.xword	0x110068122caa328a
	.xword	0xa9a0940b05a5f31a
	.xword	0x000f4231d0122fce
	.xword	0x5e45043dae19dd9b
	.xword	0xa136b1f5810a111c
	.xword	0xbc4eaf165a1c07db
	.xword	0x854ba960b8312484
	.xword	0x1867799bbffe0536
	.xword	0x98554e8835154bfd
	.xword	0xb0db6b6bc3d6d661
	.xword	0x3bdd54c8becc14a9
	.xword	0x72abe17c24e4c852
	.xword	0xd0ba95862ddf38ba
	.xword	0xb3dc5b1140d7bc95
	.xword	0x983cc1253a21a0eb
	.xword	0xe1e69072188b93a7
	.xword	0xc7fb7f5ce4cc0bfa
	.xword	0xe8249da3ef421ede
	.xword	0xd558086f1989f348
	.xword	0xc9b0d8c913f765ad
	.xword	0xb348a42211074116
	.xword	0x237902ea35ec8879
	.xword	0xace59c33984a41fe
	.xword	0x249609c931513553
	.xword	0xae16be1e2395cfab
	.xword	0x3e06552114e43349
	.xword	0xfc6040c2b9f47f6d
	.xword	0x69d1ebe4fb6abb0c
	.xword	0x1ce2385360ce3aea
	.xword	0x3acbf1ca8cead609
	.xword	0x27cea4bf28d8fdac
	.xword	0x53bdd42d164ac43f
	.xword	0x31fc33bd17cce0c9
	.xword	0x051d09bda7f04f23
	.xword	0xb485cbcd64dbca36
	.xword	0x22c500e75f99430f
	.xword	0x38a6eb55eb4062fc
	.xword	0xfcdbf97733017dc7
	.xword	0x097e73a1eb8a3b3f
	.xword	0xf04f3f7afeb91c70
	.xword	0xa67dc422a9b9c1f7
	.xword	0xf329c89611b1ce7a
	.xword	0xf6b2986252a2a31b
	.xword	0xd9ef5a5b1185fe6a
	.xword	0x84c9a4bc4c86fe33
	.xword	0xf95a2801073a071c
	.xword	0x1bfe4b9b1fd1103a
	.xword	0xafca62c29527651d
	.xword	0xdd913442e0bef439
	.xword	0xeb5ea514ee45a1b9
	.xword	0x1e901ddb2742fce5
	.xword	0xdede57906980d23c
	.xword	0xe0ed82bbaaf4c543
	.xword	0xdc8423730c56028a
	.xword	0xde8c62885eb59d7c
	.xword	0xe8f98887e1527f07
	.xword	0x3dd423b26031a2f0
	.xword	0xac5159353e068494
	.xword	0xd1d33ff1cf6ab3e8
	.xword	0xc4bcfd306bb8b4ea
	.xword	0x8aebd17dac2f2a69
	.xword	0x7a6e7a1af6405fe2
	.xword	0x0a560dcc9bef4b6e
	.xword	0x81c43a45f5087f7a
	.xword	0x920d5b44429e0a7c
	.xword	0x51d1c092b1976ca0
	.xword	0x4aa35780ac3ec037
	.xword	0x0601548d7f69ae22
	.xword	0x98b179f691899143
	.xword	0xef3c05974c7f7e7b
	.xword	0x18424a567c9a85da
	.xword	0xf3e557c174042299
	.xword	0xd3ad18eb2e2fb9c5
	.xword	0x242abf38354e1d82
	.xword	0x4225cbb3f2751502
	.xword	0x1533393b0865d824
	.xword	0xe132f8816e2ebcdf
	.xword	0xc3d548aca6e0623d
	.xword	0xdf56d92b53064786
	.xword	0x52298bc6eb43d36e
	.xword	0xad324883d56e6e6a
	.xword	0x90cf9ee1cd046f1a
	.xword	0x88140a480a98aa7a
	.xword	0x906c45740fc05909
	.xword	0xdc0e0399daa546ed
	.xword	0xfcb516d8183c0d6d
	.xword	0x5d1f299ca1959e03
	.xword	0x2ce1dcfbffff04fe
	.xword	0x3e430a3211d3a464
	.xword	0x204d875dd77d84c9
	.xword	0xaa5b5712b8aa8f19
	.xword	0x5b6d9b16dc81c50f
	.xword	0x31fa16140b78e9df
	.xword	0xad1a9a165d58dfd6
	.xword	0x02139e4e2240d2c2
	.xword	0xe5a80d2efbc65f6e
	.xword	0x0bb502ab3ac0ba14
	.xword	0x5450f605941bf8ae
	.xword	0x0755a34d3a9fb580
	.xword	0xcc4d5073340d2f69
	.xword	0xc58938912b7359f7
	.xword	0x1f0f4d531d6095bc
	.xword	0xb8967653c693093f
	.xword	0x77e4d28828abcd92
	.xword	0x6036b13ec07c750e
	.xword	0xb91e1f5fafbb80b5
	.xword	0x2858faed46638db5
	.xword	0x4a9f77a44207599c
	.xword	0x6e75041a770be30e
	.xword	0x9cdff476489cc367
	.xword	0x9d5b526f95c4e0ae
	.xword	0xa168f1cb641aa328
	.xword	0xd4d3699fa833d397
	.xword	0x8817f2a9d5ca5196
	.xword	0x5f5e29c898a0e73b
	.xword	0x112148010f70e43c
	.xword	0x2ac3fb09e6feeeb6
	.xword	0x5d25ca1ff230ef14
	.xword	0x5afe1329fae111a8
	.xword	0x8082f422cc8e40a5
	.xword	0xc70e1d3a424c1430
	.xword	0xea842149e4ea3d3d
	.xword	0xab6a7be306674dc7
	.xword	0xae582a80cb061bc0
	.xword	0x0fde692b64c11f49
	.xword	0x182365bb3773c05c
	.xword	0x3552668451f3c0c8
	.xword	0x4babf285cc23a08e
	.xword	0x090e7043b1173c29
	.xword	0x608a4a54e9f629b0
	.xword	0x068b5d2fbf8b125e
	.xword	0xddaab6f14f41a91d
	.xword	0xd77dc9841f366718
	.xword	0x5cefa9f99284ffb4
	.xword	0x5aff0baf6a5b2a3b
	.xword	0x5d5f9b5240437c1b
	.xword	0xd3314a1114e053b1
	.xword	0xd517f35752a0dc15
	.xword	0xdada952d10ab4bfb
	.xword	0x0ff57893e26eebcf
	.xword	0x05a37b14ef7ae5b1
	.xword	0x114b2b0bd40892cb
	.xword	0x1a06b61692b223ed
	.xword	0xc5485dfa83d06b11
	.xword	0xd5b0cf2081024224
	.xword	0xed75674f8610c557



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
	.xword	0x13c889efe921640f
	.xword	0x2ea9d71c3df72e1c
	.xword	0x17833e345c7f533e
	.xword	0xb0e7826168eb4513
	.xword	0x97f149e20ad050ff
	.xword	0x0e306aec60cae2b9
	.xword	0x21b05cd5ce649a5f
	.xword	0xdcfe74f01a787d4c
	.xword	0xed08dc7d386abacd
	.xword	0x1efb5f985d6a194c
	.xword	0xbb43d0cdb8cf32bb
	.xword	0xa20c5bc0d22747da
	.xword	0xe9b74051910a383d
	.xword	0xe5e9257ac6de3300
	.xword	0x2ba422a5bf1b6002
	.xword	0xcc0bb29d1804abc6
	.xword	0x99d0a63c2be6ef54
	.xword	0x416861d1f9d663fb
	.xword	0x53e9f4f5496e887e
	.xword	0x25a82fe510b547a8
	.xword	0x49c7c5b5ae4a8a05
	.xword	0xee575b16c0455c9f
	.xword	0x339fbb5a158031aa
	.xword	0x1286002be840671b
	.xword	0x663c2940872e04ac
	.xword	0xf54b09b8918b0d81
	.xword	0x8ec230a0624570f0
	.xword	0xe5d7fe3b63c8f7fa
	.xword	0xc604cbca886c69b7
	.xword	0x747ef7cf01736919
	.xword	0xf460dcdce4235286
	.xword	0x317587c8053a13c6
	.xword	0xaf223d05a4d8b98c
	.xword	0x8660eee5b7099b83
	.xword	0x1bdd2f19b930a588
	.xword	0xc266c7d02805dbc8
	.xword	0xa0d86bb19d133d6c
	.xword	0x31e04414dbdcecc9
	.xword	0xc921e632ecca5445
	.xword	0x75f7f433b57229b8
	.xword	0xc23286a76d8afdde
	.xword	0xc7754cd13d0b5de6
	.xword	0x2b231f821d8100dc
	.xword	0x1e7fe25d24696dba
	.xword	0x90cc774253cb525e
	.xword	0xc0848f97857cae82
	.xword	0xe1b859b3da3bfa13
	.xword	0x3e5954f0b2f0cff8
	.xword	0x1c8a40ccc6445245
	.xword	0x880217360a921af2
	.xword	0xa70ce6a54728de30
	.xword	0xf6b854d2326705b7
	.xword	0x9cf39199ac51ec6c
	.xword	0x97ba83af7ecf49d9
	.xword	0x2c1f81c62a053b0b
	.xword	0xdffe5f262ad2561a
	.xword	0xbd00d4596cd1a20e
	.xword	0x16269199618e2cf9
	.xword	0x959ba591ee07e619
	.xword	0xd16f03235b300a28
	.xword	0xe511cf25c57e4f9b
	.xword	0x4da45022b23cbdb4
	.xword	0xb839d2a47ea78e13
	.xword	0x0ae88139760568f0
	.xword	0x7a4ee2ff66dd40cb
	.xword	0x418efb7e00bd3d44
	.xword	0xec0da7a092d4e92a
	.xword	0x903fb13bab156c83
	.xword	0x5482d1b0537817e1
	.xword	0x3f15ab33e35e3dfa
	.xword	0x8f95f15b7b888138
	.xword	0xf42788027256029d
	.xword	0x7101b0ce167f82ba
	.xword	0xb356fadb79c2dee0
	.xword	0x8bb9ae60328680f2
	.xword	0xa7a4eff959b5c6a2
	.xword	0x9b2a3fc33c6b6ab3
	.xword	0x3197b2fad13069f7
	.xword	0x21b7013da7f0e793
	.xword	0x211a53c696761c04
	.xword	0x66b26d2cc49a5581
	.xword	0x4e0008a8d61b361b
	.xword	0x777b4e7baabfa900
	.xword	0x50dd29afa5173631
	.xword	0xef2e70ddb20189d6
	.xword	0xb5b1f88e7848e3fa
	.xword	0x1d93dd448c9cb67e
	.xword	0xa017f6ceae4e7f41
	.xword	0xc4ece291523c3925
	.xword	0x07b5316e44bb6dd7
	.xword	0xea08ea50c9df728d
	.xword	0xf1d2618518276173
	.xword	0xd686d246d2cdd474
	.xword	0x6360034c318cc4a3
	.xword	0xe982a7e5e1b90c23
	.xword	0xaa4ce6706e2e5cd2
	.xword	0xaffb9711ead008b2
	.xword	0x7df0892374be3ac6
	.xword	0x3944f3449e140b76
	.xword	0x5c42d8a4c2ad691b
	.xword	0x4749dd93728e0508
	.xword	0x1373266d98dea040
	.xword	0x7df9fb3df6ac3e6b
	.xword	0xcd03afc04a1cafa8
	.xword	0x1b9b96098b3d5e5a
	.xword	0xf3ac4f0e0cd8aad9
	.xword	0x351970a7b4509473
	.xword	0xfd634ecb3b89d3fa
	.xword	0xfb51496243043fd7
	.xword	0x17c91740e761cc4b
	.xword	0x7f7e3564f876b868
	.xword	0x29697352bbddcab0
	.xword	0x420b7eda6e812e63
	.xword	0x87af8eebae80055a
	.xword	0x1ef147217e3255e8
	.xword	0x25380d1c8aa389f6
	.xword	0xf316100a23095e45
	.xword	0x166d927651bae6e7
	.xword	0x5dd6d548d299c033
	.xword	0x56e2ec4ebb689656
	.xword	0xe774f00e358e7662
	.xword	0x70c86a8e32dbbf9e
	.xword	0xa5625dfd8c23a5e3
	.xword	0x5b87f52155025f06
	.xword	0xd562f0a96559b139
	.xword	0x25fc4ab1c536ce62
	.xword	0x72d110a277c0bc3b
	.xword	0x6fa797749156c939
	.xword	0xfe7f18ee37ea9138
	.xword	0xcb5e903bc71b5a42
	.xword	0x326c2ffb17153bb5
	.xword	0xbd24db606639b34f
	.xword	0x2501203bf02d02ac
	.xword	0x133864a10156c8a0
	.xword	0x30e50ec063026347
	.xword	0x6ce8543631cf4ff6
	.xword	0x12a589a7c50525ae
	.xword	0xe7bfa5ade1f4102d
	.xword	0x2a48c13e6c0998dc
	.xword	0x30e64d4da162038c
	.xword	0x8e6baa928b3af9ea
	.xword	0x2e10de1903944130
	.xword	0x16e4cd237906c428
	.xword	0xf51c270557fac466
	.xword	0x7c47d6f88f307c09
	.xword	0xd1cc4f7986f640e6
	.xword	0x93a25cf113e57839
	.xword	0x2983c5312563a55c
	.xword	0xd3945b10ea7a095d
	.xword	0xdf7bb6d58f03e466
	.xword	0xddf49a13715e71d9
	.xword	0x8eb52e3e23dce1b8
	.xword	0xd7c67bbc3ce5a613
	.xword	0x86a629f6400ea187
	.xword	0x335f2bfe09add17b
	.xword	0x6033cf1bdf85e2a8
	.xword	0x0c53ded87dcf9e39
	.xword	0xe91fd8559eb97d20
	.xword	0x5e6ed55b2fa8616b
	.xword	0x4bc0089f4317e0e7
	.xword	0x54803537b4cf0b19
	.xword	0xbb988857edaa575f
	.xword	0x3501b4bcfb67caae
	.xword	0x281709ca0db5e2f0
	.xword	0xca395e03a9b4287c
	.xword	0x832cb21af718280a
	.xword	0xca086c4133dd9203
	.xword	0x65242ba90b59b78a
	.xword	0x9a7b9174ee05d7a2
	.xword	0x51f73c2cd7117d38
	.xword	0x59210a5f85761f38
	.xword	0x71e8323ce2810ea6
	.xword	0x875a05247f11b718
	.xword	0xe805ddc8516e225a
	.xword	0xbabb370806cc1b24
	.xword	0x5fe71feea6bccf51
	.xword	0xabe07d9a5c08e9f0
	.xword	0x37e974d96175326a
	.xword	0xd8b9cec69168bf53
	.xword	0x4c3cbf96e975ceb6
	.xword	0x328e6427c56cfa67
	.xword	0x028970f0e9ca36a7
	.xword	0x2291ddf997830e47
	.xword	0xc2b6db98afcd0ca2
	.xword	0x3ee05ae18c5ee713
	.xword	0x1aed7cd72436799c
	.xword	0x22a33c28d6eed2aa
	.xword	0x26575874c6f6ad7b
	.xword	0x281bd6b42deb55be
	.xword	0x9196c32dc137e7de
	.xword	0xf866a511e918945f
	.xword	0x80be5a5ba29d498a
	.xword	0x768dd6aba7c54c5f
	.xword	0x11e9e857721ee0fc
	.xword	0x1eaf19c0481902e8
	.xword	0x4f1a4ef9ef595ede
	.xword	0xcb49c4d528e5f821
	.xword	0x95d76f9715741f1e
	.xword	0x905b37f02a279d8a
	.xword	0xb423d94528456cc7
	.xword	0x3ec429adf583c5e3
	.xword	0x0d441e67c20c8355
	.xword	0xdab89c1dc2a751a7
	.xword	0x071f665d5a937257
	.xword	0x7e1ac212c548218b
	.xword	0xc8bf2f1d78154b25
	.xword	0x6c314f2fb1a61c61
	.xword	0x2951141436661e48
	.xword	0x97b1615f8af938e4
	.xword	0x4ece67873dc78d7e
	.xword	0x31828f5663643be6
	.xword	0x723173bcbbe3533a
	.xword	0x523a98cef99c9b43
	.xword	0x98a0ad3de32fdb3d
	.xword	0x6daabf1018e8d9a7
	.xword	0x55170ba9e0135573
	.xword	0xb222abbdbeb905dc
	.xword	0x7a314967ce5bd8b0
	.xword	0xde276e5cb4a6efff
	.xword	0x9687be1bae33bfd2
	.xword	0x45e60ce962012587
	.xword	0x58284e9ca183d2c5
	.xword	0xeda90f34cd920e57
	.xword	0xa5ad54c5ae70ac11
	.xword	0x008cef39d60aa38b
	.xword	0xbb2a72ad9d3b8b6a
	.xword	0xc424a45cda25ea90
	.xword	0xccf7d7a0180b6dca
	.xword	0x8d96cc9c4ca634ac
	.xword	0xfebadb3bb588dd78
	.xword	0x4272e19cd6982e3d
	.xword	0x75a00b76700049bf
	.xword	0xa548439009948101
	.xword	0x79b85cef8ee32e45
	.xword	0x6d941eb7a67afb60
	.xword	0xae6e7445b162e5d9
	.xword	0xc81290f28072da13
	.xword	0x2638797725e1c76b
	.xword	0xdc159859f7b2822e
	.xword	0x00e48cfcfe098e43
	.xword	0x85b3f2cb69a1998e
	.xword	0xc093d0fdee3fc2f9
	.xword	0x94ee78102e62a0d7
	.xword	0x060061ea9c533af8
	.xword	0x352a08d3057c3995
	.xword	0x4f0e8d89c8b1ba5f
	.xword	0xe1447fc7da445515
	.xword	0x8dc83b4883fb0d29
	.xword	0xe44e07ff7beb542e
	.xword	0x68b829424b64b404
	.xword	0xf025c9475440b06a
	.xword	0xf21bd1b73035e2e1
	.xword	0xf0b5b76886a597e6
	.xword	0x2b21fba0438248fc
	.xword	0xc81406196d1d513f
	.xword	0x12dbbfd79179b43b



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
	.xword	0x17443e00415b9b65
	.xword	0x2ef559745b5a22c1
	.xword	0x367b148e978a9d63
	.xword	0x5fd57766e63f5057
	.xword	0x4a2ffa2ecc9887c4
	.xword	0x75f3c9ad2f87bd6e
	.xword	0x84b02c5af43be321
	.xword	0xf7eed155b00a77a1
	.xword	0x3cb94e3dfc835c57
	.xword	0x921f91f6425b73f9
	.xword	0x04aabc980cfe2534
	.xword	0xb8eeb5d1ecbae976
	.xword	0x7140910c84031aaf
	.xword	0xe583f7c42f2e7193
	.xword	0x0a00a6113f052656
	.xword	0x1f4a004948db81a6
	.xword	0x22c3dc397b4a8e24
	.xword	0xe946cdda2e86bda8
	.xword	0x9d2f0a88e94f8660
	.xword	0x6b9ba1486787b123
	.xword	0x1a1da456bd55a199
	.xword	0x813ca6455f908b14
	.xword	0x66de5545d5825e33
	.xword	0x117b8b1a3f42d43d
	.xword	0xf54fd37120955424
	.xword	0xf2ef4afe7609b17a
	.xword	0xb1202ac57801db9f
	.xword	0x92e63e472fbe7346
	.xword	0xd44215e114f14cc3
	.xword	0x7c39b4ce9a05f6a6
	.xword	0x8fe44fb460136c55
	.xword	0x71b5f05f5d6b00b8
	.xword	0xd7d6648c2b81b148
	.xword	0xdb09208b1d7277e2
	.xword	0x1493eae60916497c
	.xword	0x798842408323dfbd
	.xword	0xc3c6978a344635ff
	.xword	0x61dec2786ecc25d0
	.xword	0x41fc2f7933fa3b00
	.xword	0x956405011878461b
	.xword	0x1ad097c38ae23aed
	.xword	0xabe9c2bbb1a37d60
	.xword	0x142dd176273aa41e
	.xword	0x3418d45774f59cc8
	.xword	0xfdb87b46241af6af
	.xword	0x13f6bc4c2db2d817
	.xword	0x061cde0859359b54
	.xword	0x6d6542b950269b99
	.xword	0x5d6f81358173dfe1
	.xword	0xd8f3ac1dd9a874c9
	.xword	0xf1ae1fb81a6c13e1
	.xword	0x98d48d196fce5978
	.xword	0x1d9b5460ff0b41a5
	.xword	0xafa48779cd46760e
	.xword	0x7e13b767fd096b24
	.xword	0x879093e458d38fc0
	.xword	0x1e1a50d55fbcdfc2
	.xword	0xdad9e6888b1302b6
	.xword	0xf6ca404462b5eee8
	.xword	0xda6cb2a1a97793a7
	.xword	0xbf104df14131ccc5
	.xword	0xe513d97e22f7cee5
	.xword	0x671cbedf1fd19919
	.xword	0x486e758b95b25129
	.xword	0x0954bebc855ad35e
	.xword	0xe40b7d65662624bf
	.xword	0x91bef52445d52ec6
	.xword	0x82b47b49f6c4d565
	.xword	0x3de60a4fe082630c
	.xword	0x22a9f288828edbaf
	.xword	0x70357a42b009562e
	.xword	0x9eb2ba2abb34f24e
	.xword	0x68e211e228e2fb6c
	.xword	0xa29e91ee3ad6d0d0
	.xword	0x64a14a3058e7ef52
	.xword	0xbe551eae6195cc8e
	.xword	0xb0b9e03c01d4e539
	.xword	0x4b8934f84c1628b4
	.xword	0x4b8f7a14194436ac
	.xword	0x57836847f5bd303b
	.xword	0xbca975dfccdc3af0
	.xword	0x5e06beff906c1a27
	.xword	0x0b892dc22b58029c
	.xword	0x19c0beb69242c791
	.xword	0x154da932d604bcf9
	.xword	0x875c9e69fd5dcb6e
	.xword	0x755726201670c646
	.xword	0xedb636f0ce35d5e7
	.xword	0x3112b4b45a8e6ebd
	.xword	0x3322d8ab14adccb7
	.xword	0x876fc432ee14834d
	.xword	0x363da39d2cac00ac
	.xword	0x4573465e21d1f15c
	.xword	0xa4d49c3e11faaaf0
	.xword	0x7f7c8ca1eab74ed2
	.xword	0x64d4dfcbb9000cda
	.xword	0x6a462e4dbdcdc4ef
	.xword	0x5f1756f4098ec964
	.xword	0xd40c8ae3691cbf27
	.xword	0xf123af0433dd9505
	.xword	0x4c098e08f2005cfb
	.xword	0xa73939ef614719b1
	.xword	0x2b9a7d185261ff2a
	.xword	0x00592fb8a654464b
	.xword	0xf4cbec182a4c95c1
	.xword	0xbfdc3f858f85f0c7
	.xword	0xae829ee037b07656
	.xword	0x06558338265d9ccb
	.xword	0x9362d2d691457768
	.xword	0x251555ce57f81cd6
	.xword	0x3d5f33ae741eed6e
	.xword	0xeba87f7d4adb6023
	.xword	0xeb5f2de2dbe416fd
	.xword	0x427079758484dba1
	.xword	0x3a0e6cdb202929d5
	.xword	0x330d7be796be4db1
	.xword	0x056bf41fcfb5ad44
	.xword	0x392fce9e483486f3
	.xword	0x98c9fad6d0009cf6
	.xword	0x64a2196f55a16710
	.xword	0xa2e84fe6e210bce6
	.xword	0xcf8c193a7cc14e64
	.xword	0xc0555ef5e1caa269
	.xword	0xb41ae67b5cada042
	.xword	0x2ad167fd9a40e5c7
	.xword	0x2fea3371b4b2c000
	.xword	0x0874f736241b4bba
	.xword	0x1dd0e1b8735ea876
	.xword	0xa537b84476f6300f
	.xword	0xb06d07a5b275696d
	.xword	0xd21c1bfc1c45d72b
	.xword	0x73955812156ad8e8
	.xword	0x33d08f3d9f5d8cf1
	.xword	0x76614d1b7d7ba32c
	.xword	0x21eccd38ca8752c2
	.xword	0x93421ed7f1e876c3
	.xword	0x9a1bf9b065b0709b
	.xword	0x5d5bb13a6f9c2827
	.xword	0xb4e4c7e4bea2e373
	.xword	0xd8b5528173833f35
	.xword	0x669c78450b075483
	.xword	0xf1e70964cea597a8
	.xword	0x55dbedb50444cec4
	.xword	0xc3213428adec3f5f
	.xword	0xfb496d1c3c3c0b01
	.xword	0x209b9108e3255380
	.xword	0xfe0f158726f87b8c
	.xword	0xc5d5500ff9fc5533
	.xword	0x6f2a05cfd434c8e1
	.xword	0x4768059af4334915
	.xword	0xb543b1b85f6bca36
	.xword	0x13b3d23e8d530403
	.xword	0xbaea4d55a984fca9
	.xword	0x704fc22068ea2977
	.xword	0xd019277cfa4071c0
	.xword	0x5613dfa4895887a1
	.xword	0xf017697dbd151567
	.xword	0x1ecacee3d2e90553
	.xword	0xc5026149193ea013
	.xword	0xa53674aedcb6c218
	.xword	0x4bd0ef53544f50d7
	.xword	0x236c559c499fa7dd
	.xword	0xe816bada74da076c
	.xword	0xe03ca3a120d5d4f2
	.xword	0x4fb48b16b420b4e7
	.xword	0x4731991afe86295e
	.xword	0xe37cafbc27b6cc4b
	.xword	0x17366d74af203e78
	.xword	0xe3f12707817562bd
	.xword	0xa37f7e48ed6fcaab
	.xword	0x48a57b5f90633378
	.xword	0x6b5b4b53f60c8e7d
	.xword	0x379e511ed040c6d0
	.xword	0x1ca3326563d5b779
	.xword	0x1b745dbfb7a3bfb4
	.xword	0x2cef97b313b3c89c
	.xword	0x057a1438efac8eec
	.xword	0x6254f0f67ad7fadf
	.xword	0x0bc70a32f587b6df
	.xword	0x0debb1a80b935741
	.xword	0x6e6b57581f6b0f28
	.xword	0x3fc140e359726aee
	.xword	0xd2beb733eeed3b02
	.xword	0x49de795ea5fc3908
	.xword	0xaadd4689b6cb81a6
	.xword	0x46d1748f71cbf81b
	.xword	0x8299ec91e4077302
	.xword	0x0cfc71d088314a52
	.xword	0x30f7454e97074be7
	.xword	0x50b3174e972e03df
	.xword	0xd6470ea45c74b290
	.xword	0x824ff97334ef7b85
	.xword	0x2bcb736c1f62f770
	.xword	0x53e24682e9421482
	.xword	0xab428da14190dca8
	.xword	0x1e83dd441206c0ab
	.xword	0x684e57d6ce669e80
	.xword	0x34933d85ac7f35a5
	.xword	0x83c921df0d206f1f
	.xword	0xcb56b78ac2dae593
	.xword	0xb9000294f49d6cc3
	.xword	0x366a1c0ca537f84b
	.xword	0x81cf145fbcd3f9ae
	.xword	0x548edf50006f9e3c
	.xword	0x812cbf6915db49d0
	.xword	0xbbaae41d3d7bfdba
	.xword	0x88943e37e1151cfa
	.xword	0x886ef769fb47cd5d
	.xword	0xb1ae70cb3a09f59e
	.xword	0x38d532d4619838ab
	.xword	0x86dca857397143ba
	.xword	0x16c9b059e6374638
	.xword	0xa1776e9c65c7ef9b
	.xword	0xd3e6a8cf78e93c16
	.xword	0x6544d5942272a12a
	.xword	0x2b8144a03f2c9c6d
	.xword	0x0a63795de056faf7
	.xword	0x696ac5b0da0b0486
	.xword	0xe8307e1c919e0617
	.xword	0x9d6dd13ebf9fe4e6
	.xword	0x0f8bf65df1389c09
	.xword	0x65e5e2424b840d91
	.xword	0xfcad4b540e579454
	.xword	0x042707446d220104
	.xword	0x21d9d388840093e2
	.xword	0x0e03c8420721f263
	.xword	0xa4ca95fc770739a5
	.xword	0xfd903803a8f3c7bf
	.xword	0x9406c6546594388c
	.xword	0x785aaf1295677beb
	.xword	0x7a8e3ece93642e36
	.xword	0x3a15b4073225a4e7
	.xword	0xdcbf50b664541511
	.xword	0x2ce92cc4af99ec18
	.xword	0xe39c9d6d262175f2
	.xword	0x40e7036a223ccf52
	.xword	0x9bf8aeb7328e9388
	.xword	0x2c7ec7a156bbf179
	.xword	0x4840b5ed9de8b0f0
	.xword	0x946be597955b63b0
	.xword	0xd3ebeaab3da5c519
	.xword	0x7b6a463db56d32aa
	.xword	0xff52f1642469ce20
	.xword	0x55b8fca704ba9b5a
	.xword	0x83e636e746c839c9
	.xword	0x5ba4782dc4a84ed0
	.xword	0x6b400cf46671c37b
	.xword	0x7e6a3180a07ae11b
	.xword	0x983272b37ae7311f
	.xword	0x82908e6136df2e23
	.xword	0xaaecfb110611602f
	.xword	0x3757df9c8ccd45bf
	.xword	0xd4d71533b4cdda9a
	.xword	0x2c246f9d8c1a829a
	.xword	0xbe7bf40154e286aa
	.xword	0x37ad8ab0f619f83e



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
	.xword	0x442902f025dff412
	.xword	0xf34041812bd68f27
	.xword	0x3b8b655a3c458922
	.xword	0x5ff995339cc2f48d
	.xword	0xbb4a890aa0e2334e
	.xword	0x558bd35fbbd69aa2
	.xword	0x50414fed7a620335
	.xword	0x17eb5748689a9355
	.xword	0xea26f429efdd23db
	.xword	0xb05d0febc840a71e
	.xword	0xf7190133cebd8510
	.xword	0xf0f95fd7422ae691
	.xword	0x856051837e5472a5
	.xword	0x693b72d72248872f
	.xword	0x6eae1a1fe11f1731
	.xword	0x81a3de1c5323be9e
	.xword	0x2247e6dcb8c0fcf9
	.xword	0x9c60e4dcf6f43ee4
	.xword	0xbf16ae53e2275e14
	.xword	0x6146b10dc9af7b34
	.xword	0xeea1dede8df802e6
	.xword	0x493d80c90e210e4d
	.xword	0xe336463e6af21118
	.xword	0x68d8b4aa572d562e
	.xword	0x71e5fe360d5b68f0
	.xword	0x4f4dd9b66c95b88a
	.xword	0x51f20c724a470af5
	.xword	0x73484fb14a6de6a6
	.xword	0x3ed3bf8148cf4fda
	.xword	0x199ec41687f983a3
	.xword	0xb2c8843e9b669bd6
	.xword	0x6567bab1ded6c4a9
	.xword	0x68456a26668d5e9a
	.xword	0x8adeb87bba229ca9
	.xword	0xbd785bbd7fa4f556
	.xword	0x617ecf6e3f277a24
	.xword	0x0d4bb61f56a2c982
	.xword	0x8b0851637bb048b2
	.xword	0x89682bbae0f8c4c7
	.xword	0xd5cdb2b872b964f1
	.xword	0xcc51031023331d8e
	.xword	0x369292365770d59b
	.xword	0xb86ebaa9b6fc11fd
	.xword	0x8b1a0f170a2fbc1a
	.xword	0x02806d8fe696c139
	.xword	0xc0088b8a4aeaaf34
	.xword	0x219ee6649ecc3d64
	.xword	0xcadaaa702728d758
	.xword	0x7be2a364e11cca45
	.xword	0x389cfc322418f22c
	.xword	0xc39dbd7c9f0cf6e7
	.xword	0xc0bf0f0dbca29a60
	.xword	0x2cb585e62c8cd769
	.xword	0x1d75ffc808926599
	.xword	0xf6520492006ad8fe
	.xword	0x625756d125a9a6ae
	.xword	0x9dd99cc967e9c32d
	.xword	0x6ff85bd2a6f05df1
	.xword	0x0312f9d0dc12fe25
	.xword	0x79764366b30e35df
	.xword	0xb5158dd56eef64ef
	.xword	0x4691c106003b6a99
	.xword	0xef18780bbc2ad78c
	.xword	0x5d8a59256e1a170a
	.xword	0x31487c9b33a4aadd
	.xword	0x9752e913104a6b12
	.xword	0x74763068e8f3dbe3
	.xword	0xefa666f1eb7a0113
	.xword	0x2f1d8f24daba5b7b
	.xword	0x337c924870e4735e
	.xword	0xd3db56a5231a3a44
	.xword	0xf613659645b34c4c
	.xword	0x4ce9f67b629b069d
	.xword	0xeae05aed7178ab56
	.xword	0x6816684af57f8224
	.xword	0x6a79a7a8d9e1b7e7
	.xword	0x20e2fff9825bd55a
	.xword	0x14e35b64c4bff9e9
	.xword	0x1d49ecb8511811a7
	.xword	0xe5b8dcaea1dbf93d
	.xword	0x3a926bf6b689c97e
	.xword	0x787f11fa0985029a
	.xword	0xfc9e6e0dfba3bbf9
	.xword	0x8a1c258c0e19b5bc
	.xword	0xb73780d9f2349707
	.xword	0x7f17ba91767bec17
	.xword	0x25969c782cafd532
	.xword	0x60e5f0f613a41e75
	.xword	0x56e2016bb50c5b39
	.xword	0xe80e088ce7216040
	.xword	0xc6bab1276f203f60
	.xword	0x8b163f461b49aa2c
	.xword	0xc26990ca61657bc7
	.xword	0x5f0d521a743b1ae7
	.xword	0x56c49a59578f1ff2
	.xword	0xc3a0fc1697c2cc85
	.xword	0x0ef7c8f8adad6b10
	.xword	0xc2127510c3f65030
	.xword	0x3be99931dac0d0d0
	.xword	0x485712a13c99ae87
	.xword	0xfbff55a62e6a87b8
	.xword	0x0ba87e62e9ec94c4
	.xword	0xe8fe7b0f58054b01
	.xword	0xfaf194b292114371
	.xword	0xc86b0c38f3d38d2c
	.xword	0x3aa4341c7b255e58
	.xword	0xd01758586d472c3f
	.xword	0x110eeeb9192341d7
	.xword	0x3a8a934efc2a248f
	.xword	0xdd3690029b785bda
	.xword	0xf288548e09779a84
	.xword	0x48dae70f4182f3ad
	.xword	0xb66674caa28e107c
	.xword	0x1ee501ac0386c16c
	.xword	0x3a9ad238c536ca1c
	.xword	0xc3a5dd2f0db7b210
	.xword	0x3da603eaf75e53b3
	.xword	0x71e585acde5fbcf0
	.xword	0x598d151c75208f29
	.xword	0x3340f3915fca13f4
	.xword	0x4d2831bdb562c53d
	.xword	0x86e72043627da252
	.xword	0x940cf8f42f4cc44d
	.xword	0xbd9f3701615c21a2
	.xword	0x560a76202ed10003
	.xword	0xf3b19006d9a55b72
	.xword	0x151378b412d9e471
	.xword	0x80ae3df9b688f6a5
	.xword	0xc219af4025400615
	.xword	0xc33b44b909ac0474
	.xword	0x25a5c7c059589d5b
	.xword	0xf3ab6e07a754c6ed
	.xword	0xa6f1a51da4738ff5
	.xword	0x92e633f10109a5cb
	.xword	0x8d906d0a75847ab8
	.xword	0xcd96842f4ec5a0e5
	.xword	0xf84cd8dd932d2ca3
	.xword	0x00595b3a3bdccc3c
	.xword	0x2673d3ffbcd547ec
	.xword	0x994d2cfb595d693b
	.xword	0x97c2799853ae1cfc
	.xword	0xa0c981c8ec7ab9e9
	.xword	0xac70e57e74978d1a
	.xword	0x43fdc156c2074c0f
	.xword	0xa9e9132227432c2c
	.xword	0xeef1cc12728116f1
	.xword	0xaca75e8691b29347
	.xword	0xb36b71a3e0b88c89
	.xword	0x6b475511c2e99683
	.xword	0x7551c4b11cd1678b
	.xword	0xfc6f7c942d644b5f
	.xword	0x99df66abe33820fe
	.xword	0x2fb8992561fd04eb
	.xword	0xc250e53c1d906871
	.xword	0xe1780cb1dadb9ed7
	.xword	0xbd6565c61980416d
	.xword	0xff71e418a94d8b28
	.xword	0x63203d2caba99e8b
	.xword	0x06677c223d5a507d
	.xword	0xad1afdefc5edfb53
	.xword	0x46b5dcf7210ab03a
	.xword	0x36e85d1b5c527eab
	.xword	0xb54556ab5bce7e30
	.xword	0xa4bd7302ab0e0c32
	.xword	0x36f2fecfb66095b1
	.xword	0x5c1e1907616f8a00
	.xword	0x4443ae96ad4d7a99
	.xword	0x6ebf5a94c5a24654
	.xword	0x7733705f7cbb7a7e
	.xword	0x65aa97eb85b4ac51
	.xword	0x426bcbe3c13c29a6
	.xword	0x8fd9b8249a1beb05
	.xword	0xcc2b41e5b5805e53
	.xword	0x6cb03a529f1b52fb
	.xword	0x15bad478b2b74a13
	.xword	0xbb29d5c903e29df9
	.xword	0x77d240cf420ccc6f
	.xword	0x22c16c03d44c5f14
	.xword	0x1bd93324055a2ca5
	.xword	0x85388436fe808426
	.xword	0x0e4b186caf6eb0af
	.xword	0x04588ff69687c686
	.xword	0xbcd965955b1ffe70
	.xword	0x9c4926d6d522a1f6
	.xword	0xf29bcc2cc5155eb6
	.xword	0xa8dc47ab19474199
	.xword	0x437606c2fe88d5e2
	.xword	0xe3582819aa02f0a6
	.xword	0xe581f8c44800eabd
	.xword	0xe806099d43c53d3d
	.xword	0xd89caab716ce8a53
	.xword	0xe9098faf598f9d78
	.xword	0xe8b289cc25ef11b4
	.xword	0x8fd4e99b2a2135e0
	.xword	0x82dddcfa015ce9b6
	.xword	0xf8e4d1d9d2b536d7
	.xword	0x19257f7771ca0c09
	.xword	0xdd57257b15a8a338
	.xword	0xabfd8586a0034627
	.xword	0x10f0a2eb62aa6a7c
	.xword	0x474a4a2a81e1fb8c
	.xword	0x621ba22054c28873
	.xword	0x8df7f1b6c507d379
	.xword	0x410a5bedc0a0d9fc
	.xword	0x6e3d68e04110d6c5
	.xword	0xe521df1dff8fe292
	.xword	0xcdd5b6a281ff34c9
	.xword	0x4a2869f6db39f722
	.xword	0x16239f04cbab1a3c
	.xword	0x0c7a6b7b78a7dc54
	.xword	0xbc2797c866f61796
	.xword	0x187437c4ba8b8155
	.xword	0xb3fe398650dc8b00
	.xword	0xd636db043c51300c
	.xword	0x9bc304b3f215c4fe
	.xword	0x48edc10f4403bcd6
	.xword	0x0b2f5d0bfb966623
	.xword	0x6b20b9b0b4b2c144
	.xword	0xf79cefafa9e81cbd
	.xword	0xd9d44c08a8f073a5
	.xword	0x4d26ba822f1b9fa3
	.xword	0x1107b774357835e1
	.xword	0xa873a987f54c7374
	.xword	0xf27d4612075a8703
	.xword	0x218eff020642f61a
	.xword	0xb89734b0468d7b72
	.xword	0x4178176c6266f6a0
	.xword	0x6273332615c1986a
	.xword	0x6b9ec1a443007fb4
	.xword	0x773ba014f4054eac
	.xword	0xa1409cbc51e2074c
	.xword	0x9a4d919b3d6016e3
	.xword	0x1d993921f98d5b94
	.xword	0xf53166fb52f7c045
	.xword	0x456d94233112c6f8
	.xword	0x2fb7a36b59880e9f
	.xword	0xd4de288d2ad9315a
	.xword	0xdecdf7294a34d8f4
	.xword	0x8a2d82284a7aa0fd
	.xword	0x7e6a89ab1c3e286c
	.xword	0x39da88bf0fd8a0d8
	.xword	0x1f52e764216313b9
	.xword	0x504d4c7bd807565d
	.xword	0xeaefa6179ec3aa04
	.xword	0xada5524f85ea8c67
	.xword	0xfef8a0885f660e87
	.xword	0x35bd9333f0b8f9ae
	.xword	0xc463f776f165e1fe
	.xword	0x0427382e01fdd78a
	.xword	0x830eeb5ec07e5914
	.xword	0xfd2018175d4a521f
	.xword	0x99ec655266ab6ca9
	.xword	0x630ff9bab4f38b72
	.xword	0x6840f1a96847af9d
	.xword	0x3720cdc468d3d817
	.xword	0x3b45cc52e1790d91



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
	.xword	0x3bba1913cc9244c6
	.xword	0x25d6eacd51900cad
	.xword	0x45255373e800228f
	.xword	0x644ecb8a5ecbe444
	.xword	0x4a888f12c87a1469
	.xword	0x5cb148762696e473
	.xword	0xde55a303ce937f7a
	.xword	0x327c0b37d9fed217
	.xword	0xa19e46b1a3f6c618
	.xword	0xc05efec89e4ccef0
	.xword	0xf8c5500ea9957e82
	.xword	0x26d685eb3e6d0d7e
	.xword	0x3e59cc8a1197ad28
	.xword	0x497c01ffd81dc22f
	.xword	0xb96bd072fce20278
	.xword	0x558e077aad625d31
	.xword	0x06635a75e176ab7f
	.xword	0xb53ff72558ef5738
	.xword	0xe1a0feab589dd739
	.xword	0x3d4b62cd81fd6bae
	.xword	0x8ce1d4e7915e09be
	.xword	0x383e68b76236692a
	.xword	0x74d2e326ffd18356
	.xword	0x1f149ed6ce5367ae
	.xword	0x96d717ff7a24f7d5
	.xword	0xc31dde3c04cecead
	.xword	0xa5d1c5e9718b269c
	.xword	0xff10705ebdcfdead
	.xword	0x23383e4607f5c539
	.xword	0xd37fd21551a022d3
	.xword	0x49ffcab6b77f6b6d
	.xword	0x64d56b0d1c96d926
	.xword	0x2ecf5a3c47125ec8
	.xword	0xec14992ffe317aa4
	.xword	0x60f9e20f00236d34
	.xword	0xeee82768279d29fa
	.xword	0xb8d93ca404a7d91b
	.xword	0xd2708ccf186c0a79
	.xword	0x6dee2a62d0552134
	.xword	0xcbdd69832eaaed33
	.xword	0xf86725d07b6492b1
	.xword	0xe599848157e4c218
	.xword	0x2f79f530de90eecb
	.xword	0x4ec2155df852bbbc
	.xword	0x44072d1a2d8f386b
	.xword	0xa9a0bd7458d89f58
	.xword	0x78971663c50e95ec
	.xword	0x2a832f06cde69818
	.xword	0xe147b725cc7eaf95
	.xword	0x9a382e4d098fbd34
	.xword	0x715e7067c6f2b174
	.xword	0xab0e97985f7206da
	.xword	0x2d48f8ef6f37ae7a
	.xword	0x89a78af5270a7e9a
	.xword	0x5c7ebf2d7e08d713
	.xword	0x60555add5543af44
	.xword	0xcd5e50e8b0a021c6
	.xword	0xefc59c1cf01e3d87
	.xword	0x401100590d5fe118
	.xword	0xbb8710f50fbe37de
	.xword	0xeec1f17979c0866b
	.xword	0x2a4463e9fc29f5f6
	.xword	0x2e7567ca2258eba2
	.xword	0x8ed8e1171c9d0192
	.xword	0x5a80991bcb2a985b
	.xword	0x7ec6ba23a22d4051
	.xword	0xd6dd06bc31799a70
	.xword	0x03c617271bdfdd37
	.xword	0xe01ca540e7f1dd70
	.xword	0x1c13d37b2349529e
	.xword	0x93f2ec053d6ec07a
	.xword	0xf423a2fc8d95e7c4
	.xword	0x3a7bcf9a1d789790
	.xword	0xef1bdaf9422b7e81
	.xword	0x9c1867d52d4bda52
	.xword	0xaaf62f8bd07ad537
	.xword	0x4a5cd6b06a367059
	.xword	0x0cd8ac825ed01d53
	.xword	0x76339b178a179c36
	.xword	0xef307a944102684b
	.xword	0x706c4169b5c7abad
	.xword	0xc1d8c9da81b3459e
	.xword	0x1ba1edce39a4166e
	.xword	0x5fe4bd85dbcdf6b6
	.xword	0x7df855379416ee5f
	.xword	0xce95f444fddf953f
	.xword	0x8b666d613f3e4805
	.xword	0x06a8b2e8b47168f8
	.xword	0x651050fcafe85988
	.xword	0x970dc783e90a25e3
	.xword	0x78de7fc3498a0939
	.xword	0xd918d1449ad76cf3
	.xword	0x5ff8034867b2ae3d
	.xword	0x529fc8f55c5c400d
	.xword	0xb5f71b325ed2d061
	.xword	0xc1f7625f8cb8d6d8
	.xword	0xf5e24db10ada1727
	.xword	0xca34d0c6660a1e8d
	.xword	0x6a0ea75e5334a614
	.xword	0x380a4e063df94c51
	.xword	0x911e73f2fdf57059
	.xword	0xfa2c25f18ee0d3cd
	.xword	0x60b487aecfbbfdf2
	.xword	0x5e9084f6b9b954a6
	.xword	0x1245fe0c204cc2dd
	.xword	0xf8f08f9177d9a400
	.xword	0xdd8b740bb3fa05c3
	.xword	0x40081e7c84e2efa6
	.xword	0xc6fb6050ae15de34
	.xword	0xcf4f003fbcb03bcc
	.xword	0xfb348d433f29151e
	.xword	0xd2f476c4b9888178
	.xword	0x12c0753091b336f4
	.xword	0x5094a01c01fb9e0b
	.xword	0x9b1eb69d5bd09359
	.xword	0x671c284ebeeeb9af
	.xword	0x24ac998e080dcbd5
	.xword	0x120612bed6f0ce03
	.xword	0xf51a910e22f8113d
	.xword	0x26c56ccdc9cbb633
	.xword	0x36216ce2434ab3f3
	.xword	0xc29b715d726b80e0
	.xword	0x6ed1f14842bc10ef
	.xword	0x4c5562cc230b7b09
	.xword	0xcda9df99e5b6b0dd
	.xword	0xce905fbecf1c5b71
	.xword	0x42deaa28e60f63da
	.xword	0xb5d9cbd82e51203d
	.xword	0xf7e9186d25d23620
	.xword	0xda1b9eb3d3795e53
	.xword	0x31ce7359c7987d82
	.xword	0x899a75d1e610e3d2
	.xword	0x90a1ca3f2221ba8e
	.xword	0x0ff71ca46e2dc826
	.xword	0x43fb7d177e9d8d95
	.xword	0x14605d04eb1c5485
	.xword	0x6931d07135fe0ace
	.xword	0x2fa055a069c256e8
	.xword	0xf4a0400aeeb6e496
	.xword	0x71167ac988129172
	.xword	0x6acf73dd3711578b
	.xword	0x270c40b0fc0b4923
	.xword	0x289602e5544d3ae2
	.xword	0x329c7fcd34aa761d
	.xword	0xec69bac758d9b9fc
	.xword	0x747e000cdaad1a2c
	.xword	0x67fa6a16f4e912ee
	.xword	0xf9ace5cd93e741d9
	.xword	0x0aed3ffcb635417a
	.xword	0x3565ab8add69567e
	.xword	0xb86c60c965d5a595
	.xword	0x35a3d10205beeb1e
	.xword	0xfd09f184fcf08e48
	.xword	0x962813694c1f072e
	.xword	0x9a2dfccbb6f40171
	.xword	0xe431a5ec20f8bb6a
	.xword	0xfda3802a375791e5
	.xword	0x7baa06b971f7bbd7
	.xword	0xc7090dcdbb22f150
	.xword	0x581cbab0900646e4
	.xword	0x410242fa15bd67c9
	.xword	0xc6e7c379084e22d7
	.xword	0x6f01d2dd786defec
	.xword	0x48a359b2f8212d68
	.xword	0x05a6af9f00a48510
	.xword	0xa33d5605e63066a1
	.xword	0x96c6daf6457c5fab
	.xword	0x70e3d8d4b30ba929
	.xword	0xfe4871cea199a7cf
	.xword	0xd5553bed3d29757c
	.xword	0x1de69bb134530357
	.xword	0xe13496335413b8be
	.xword	0x9f85ee3c0694ee77
	.xword	0x09ef6bba824457a9
	.xword	0x5a44ca7f03106cc2
	.xword	0x9c46d8406d73e3f6
	.xword	0x4b5c7c45459abc34
	.xword	0xeb851d2fc4118c57
	.xword	0x800d4fae52d491bd
	.xword	0x4beec3156edf351b
	.xword	0x934742010ea54bb4
	.xword	0x68f35efa1ee2fdb7
	.xword	0xc4788982d570e0e6
	.xword	0x69227034f411dc25
	.xword	0x3b67d4f65f1012d3
	.xword	0x154726918d1636e7
	.xword	0x407e3fe2e5f19a1e
	.xword	0xd48600299ca8685f
	.xword	0x03cb14d0915d630a
	.xword	0xa27958caa73d7b47
	.xword	0xbd699b0a701879ba
	.xword	0x3412665940e44ac7
	.xword	0x81e4244efd1443ad
	.xword	0xa3aab5aac05288bb
	.xword	0x43064d222810b446
	.xword	0x923ede62d092606c
	.xword	0xf6322021d93750f2
	.xword	0xabae3cc2fb1b6016
	.xword	0x1a732cfaa6dae2a2
	.xword	0xa0b40463be7562d3
	.xword	0xde2f8b5981515182
	.xword	0xa949bcd400cb71d6
	.xword	0x26c5d396fc9f293f
	.xword	0xb4120518023f156a
	.xword	0x494529c89ecdb05c
	.xword	0x197eedc074572146
	.xword	0x170672f2ee9a839e
	.xword	0x5d1e511bcffababa
	.xword	0x9a4254c227215801
	.xword	0xcf4f24ae5f714a20
	.xword	0xf9de207a478e3e8e
	.xword	0xce8b409b8191f055
	.xword	0x0733b2b51a4ea8f6
	.xword	0xfbe40c6820e09b5e
	.xword	0xebcd8fa99b27d26c
	.xword	0x39f639246bfc7539
	.xword	0x82ee38eabb5c142d
	.xword	0xc70df25a00b496ae
	.xword	0xd7c8f44e25668442
	.xword	0xed3b9f9682610940
	.xword	0xbac8a6add4ccee6b
	.xword	0x2eab50f021dda38e
	.xword	0xbc0fffc516e9a684
	.xword	0x7b1f2bc3c5c5b207
	.xword	0xf9b181c74373980f
	.xword	0x6a4b0f20e9ba4baa
	.xword	0xe764115b59d51a88
	.xword	0x80e83c40f4702429
	.xword	0x956e9266f3319b72
	.xword	0x06b24154eb1d3f28
	.xword	0x324c545665811d26
	.xword	0x7b0612d4e6e25f5d
	.xword	0x227d2ff7551660b3
	.xword	0xf61ac317703a0ec8
	.xword	0x52d5b673da4fdc52
	.xword	0x260f12c3479a0f83
	.xword	0x4b7e16b321dd2836
	.xword	0xf954890d5d93fc08
	.xword	0x414a7d6c5a124f8a
	.xword	0xa96cd55e0268c372
	.xword	0xf7ab10632c88655b
	.xword	0x202899f63323b72e
	.xword	0xd3bd73f4b30420a5
	.xword	0x97d9c13abe6f66eb
	.xword	0xaed6eea95d22d62d
	.xword	0x002f829f68bc6e5b
	.xword	0xbd18d1ee4e302693
	.xword	0x37aabe9275e4d85c
	.xword	0x8d355d1ccfd3b53f
	.xword	0x2f7924a1689c3f66
	.xword	0x8df8c609a907de10
	.xword	0x38bfaf6a3bfd60b1
	.xword	0xb2036b9fd2b4a907
	.xword	0x6637cf52ac4a90d3
	.xword	0xd8e3f73e8666d6ab
	.xword	0x87d76116efa42b63



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
	.xword	0x6cec777b9706b0ce
	.xword	0x54181dd7a731d642
	.xword	0xa8621fdf33c5bb54
	.xword	0x983f6a8ea3041eb2
	.xword	0x16995321ddbf23d7
	.xword	0xaa161ced402eccd8
	.xword	0x244ee90aa0263a4f
	.xword	0x4f8d5eba767cfa3e
	.xword	0xc02ede1178c239e1
	.xword	0x39e126a3d0907661
	.xword	0xf1a1e4ede337bdde
	.xword	0x57853c820ed6ec19
	.xword	0x53bc2b5f2062a7e8
	.xword	0x7c0e049d7b9f1ddb
	.xword	0xaf5a3d64187a7480
	.xword	0xfdcf81770c9dcb6c
	.xword	0xce7d6e7eb59df3f6
	.xword	0x31aec2d0b08d4fb0
	.xword	0x189e0193ae9ec7f3
	.xword	0x3e61f964b77276a3
	.xword	0x93537394c1b4ec98
	.xword	0x34003314d302c257
	.xword	0xd08c25115d7774da
	.xword	0x28e5218ab7613223
	.xword	0xa99d8d7fe1a29cac
	.xword	0xe8f10641282a87ab
	.xword	0x4ff7719f8d245ebc
	.xword	0x11cedc8fc8885979
	.xword	0xdf25ea41fe31072b
	.xword	0x98a07e52fdaa2db2
	.xword	0x1465adfe9e56a01d
	.xword	0x641ed1c7dc0b7ef1
	.xword	0x60ca76e68ab36131
	.xword	0xcf2a5c480ae6360e
	.xword	0x3277c4b0b1655d8f
	.xword	0xfd6771206a5869b4
	.xword	0x7b236ddae64555fc
	.xword	0x25b1066c056b20cf
	.xword	0x64d1bd014af773f7
	.xword	0x82f28de70a2068bc
	.xword	0xa8f13720b65b37e0
	.xword	0xf8dc4a3dd293938d
	.xword	0x8edf90df7c6730be
	.xword	0x879f6eb15a76dc8f
	.xword	0xcce28888d6eb9fbf
	.xword	0x1a35614c822b8cb4
	.xword	0x21d193cfc450344d
	.xword	0xd854bda63ff801c3
	.xword	0x06b11ca7ccdc8953
	.xword	0x004c46c581fddbea
	.xword	0x52455606fd898325
	.xword	0xd748783d5c0b6cc6
	.xword	0x067ff3dc300d75f5
	.xword	0x3c527663d78fc0a1
	.xword	0x533f44fadc825317
	.xword	0xe5b85d3c736a892b
	.xword	0x65ecf509f7f07ff2
	.xword	0x8082e2ee30508886
	.xword	0x5b1f6fffac6a1123
	.xword	0x7c84a2406d0e8a49
	.xword	0x7219604a2d7a31e4
	.xword	0xc9582874de994417
	.xword	0x2d666537731e4548
	.xword	0x89cc68ff8767b539
	.xword	0x61320d6d61c6b5a4
	.xword	0x12cd2f23e30d7a6f
	.xword	0x0d95e75e0830a3a3
	.xword	0x11d1fd0793a5f8d0
	.xword	0xdf1f3faf65a35902
	.xword	0x642fec42c00455e4
	.xword	0x9872fa7a6029ecb1
	.xword	0xc4126356c878ae37
	.xword	0xc6de06e4f82117b7
	.xword	0xbbb90f2d41942d99
	.xword	0xd8dc179a1134eebb
	.xword	0xb345e964b9c901ac
	.xword	0x27991497d99f272e
	.xword	0xef7682c2a3868070
	.xword	0xf1636ef254c2ec07
	.xword	0x59e807d655fba8c0
	.xword	0x03588d74ef9bf1b5
	.xword	0xf391eb2fc8f63efd
	.xword	0x313f3e70e0b38cb2
	.xword	0x222d5d5c7c3397c0
	.xword	0x7b84e19e06790c36
	.xword	0x5c1dda9c57087a58
	.xword	0x7db25c47139233e2
	.xword	0x51ffc7a1fed9b513
	.xword	0xdfdeb84ee683ed8c
	.xword	0xdbe36774ac236244
	.xword	0x960d147fe1a5f31a
	.xword	0xa9fd844933109016
	.xword	0xf166356ddf1f1a8c
	.xword	0x47ee142f254198af
	.xword	0x33c24d114c06e704
	.xword	0x20e3cbfa0d78a170
	.xword	0xf3d7a55579f7be51
	.xword	0x34e903d54cb16763
	.xword	0x5a06eb00aea9a19b
	.xword	0xa0675263788db942
	.xword	0xeb17bc3c04855a33
	.xword	0xc9fb8b1a110ea66c
	.xword	0xa8692905e29068e3
	.xword	0xf0feb298ed6cccb8
	.xword	0x77ac5137c7478d45
	.xword	0xc8748525258ee8c7
	.xword	0x4caa412b7411a4f1
	.xword	0x937d30093a894c2e
	.xword	0x9cac50a25249a663
	.xword	0xb2b87c5022d2e65b
	.xword	0xaf68f26e52ab43c1
	.xword	0x190874cf7ce57496
	.xword	0x4cfa0836de04eba1
	.xword	0x7bf67c0d21180c89
	.xword	0x7eb32e5dca3920a6
	.xword	0xc16ac24842be6e34
	.xword	0xa7dc2568ae7e5542
	.xword	0x0bbded5795be4423
	.xword	0x8fdf66d9bff87f99
	.xword	0xeae78cc65aa7b1f6
	.xword	0x0814ddef11885f1e
	.xword	0xa5d7b6c29cc8600e
	.xword	0x5ff434c3c87c6574
	.xword	0x6c3ad88b3a023e86
	.xword	0x0792008c698fad62
	.xword	0x83dbee5dc6d3acc6
	.xword	0xdad26492ccdc207d
	.xword	0x8663e526d5f41bcf
	.xword	0x7b87eb80e7229f11
	.xword	0x02a4fabca8e4d7b6
	.xword	0xb5e0adb65454a469
	.xword	0xa4ebda4a6645eae6
	.xword	0x934410b1085e1bf1
	.xword	0x47d1dc5cfba32478
	.xword	0x3c82a4f54f7322ff
	.xword	0x8b44181b71cbed84
	.xword	0x1388138cdc0ea430
	.xword	0xfda7304dbd6ae374
	.xword	0xda99a2cd13b53653
	.xword	0x4c4eefdb8e65ae1b
	.xword	0x73189595d6696e32
	.xword	0x80f875835086a773
	.xword	0xb00ea17b3ee64bee
	.xword	0x541bd1fbb9763a97
	.xword	0xe35c520f6e6f393b
	.xword	0x5bbebd3df004b5a8
	.xword	0xabde440e4725e8f6
	.xword	0xbec1caf1d2374332
	.xword	0x31b3344cba436015
	.xword	0x27b98f71e4c0377c
	.xword	0x9d515f71fe66d197
	.xword	0x6681399aa1a6d8cd
	.xword	0xe75cf12d31263878
	.xword	0x86aad7949ac99d78
	.xword	0xd581e7150487155e
	.xword	0xc67fe999524e6f35
	.xword	0x934aa8021264a717
	.xword	0xcfe1670d94d4245b
	.xword	0xd4aaacc8c10d144c
	.xword	0x84ece62db3333b61
	.xword	0x200a87d689a13ae2
	.xword	0xd7c03c5ac8052340
	.xword	0x8cab1e7264691305
	.xword	0x3d3901c39a53cbdc
	.xword	0x2d93c436724e1100
	.xword	0xa64bcd302f24dd48
	.xword	0x7bf58696391fab2d
	.xword	0xea45a7321b63e9c0
	.xword	0x255dc756f2ddd0d3
	.xword	0x390d6ef5b215c38e
	.xword	0xb6e40ad5245036c4
	.xword	0xf661e03fbcdf7121
	.xword	0xf326b494b2f475ae
	.xword	0xa0588171eea8a7ec
	.xword	0x30cf8d0fd568dcc3
	.xword	0x046e9d9ccdc9237e
	.xword	0xac62223574502d43
	.xword	0x73e41b160e9bebec
	.xword	0xda458540e9684c5c
	.xword	0x08831ed8350b4c8b
	.xword	0x5e340b4c808ac112
	.xword	0xc43578f752c95338
	.xword	0x089b1b293bcf3d99
	.xword	0xcb72515688ef73b7
	.xword	0x0d3d4fabbfaaa6a1
	.xword	0x87e3c74a6ae18712
	.xword	0xb6049a6afcdbe3d4
	.xword	0xf1ad56c08ca9ea30
	.xword	0x26e91a7122f9f1fb
	.xword	0x72cbdad5f32d0f97
	.xword	0xb9704e79a239ff5e
	.xword	0x522e0e2cf512740c
	.xword	0x14b66960394f83b0
	.xword	0xf01b48c6440ae23d
	.xword	0x28814a6fb7f0fc7f
	.xword	0x5277abc24d539f44
	.xword	0xbcf124aa7e7986b6
	.xword	0xd9009560203eee26
	.xword	0x02c7903dc545e5cb
	.xword	0x76a5262b1c4179d7
	.xword	0xe946f79f183f7ebe
	.xword	0xbf6855835571d5a1
	.xword	0x51943c67ca988c01
	.xword	0x9b06a216e949b118
	.xword	0xb138a1d9a0c36e19
	.xword	0x953c09be113307c8
	.xword	0xf4eb42865fbce8d4
	.xword	0x4b895030d16cf057
	.xword	0x92b6c73a48f4497a
	.xword	0x730f67ecba2abbab
	.xword	0xfb2191d5556ed64c
	.xword	0x6b6093be6482cef8
	.xword	0x73fc3470fcceea51
	.xword	0xf273201a16e4e735
	.xword	0xe0ba6cc12a81275c
	.xword	0x18b339e0810a7acb
	.xword	0x287674d5fb7329b8
	.xword	0x74aa197e70c5e249
	.xword	0x56f85890ee5459d7
	.xword	0x9b0dd4812e4ca221
	.xword	0x677844c9eb7052da
	.xword	0x60bc5b6c6b0e4251
	.xword	0xa0a36a053386ed8c
	.xword	0x8786dc729f62eef0
	.xword	0x838a0af7ea544799
	.xword	0x60c4acb3b5ac22ac
	.xword	0xb29c03446b9bd960
	.xword	0x2e3e758416576932
	.xword	0x0597c852f8246be3
	.xword	0x630b6fd7efd502cf
	.xword	0xa81e08da2d875990
	.xword	0x4e37bfb220ee8670
	.xword	0xcc6069540569188a
	.xword	0xf554e37af94a9d3a
	.xword	0x5db82956904ec675
	.xword	0x3c4464b9d48b814c
	.xword	0x86c7e80b99e10005
	.xword	0xec8773ddcc73b2b1
	.xword	0x0f47ef1960d3b527
	.xword	0x867d03b02bf2a0dc
	.xword	0x18f62a2deb8d5a72
	.xword	0x5776287708a83d44
	.xword	0x226e784dec0d48a1
	.xword	0x6143c2022575008b
	.xword	0xb2e5e3e79d3c15f1
	.xword	0x752493ddae279132
	.xword	0xc25879e1b95723d9
	.xword	0x066a116e9c26b6be
	.xword	0xf5073d710608497b
	.xword	0x009ae35f2b4e7c69
	.xword	0xc787405577da6ec1
	.xword	0x0a8bdc6f148a54a0
	.xword	0x514f349d7410aebc
	.xword	0xe4881dcc50c69796
	.xword	0xcf110c815a49963b
	.xword	0x7512cfa99b0a812a



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
	.xword	0x4ec99e18ac0087b7
	.xword	0x7c0dfc4729161c5e
	.xword	0x77157eac1e4160b3
	.xword	0x5ee94a006ccdd351
	.xword	0xd65e8cd88fa5b916
	.xword	0xf0ae7eabab6188de
	.xword	0x5575fe6db9717525
	.xword	0x985eeedbfb5bd3fd
	.xword	0x5f572421dab74a60
	.xword	0x7ba2f293f50c3152
	.xword	0xf7989b7cdb40590c
	.xword	0x2e434e8d5d96bff6
	.xword	0x90141f45b5e581ab
	.xword	0x9b80a14050d33c04
	.xword	0xa2753b4db625d5dd
	.xword	0x88ce2433584b7060
	.xword	0x4ea4e6bd1f4e3dc0
	.xword	0x1a4ee2552d1b871f
	.xword	0x2312ba3813951298
	.xword	0xa910ffd9466041bb
	.xword	0x4820b018a9ffb8d0
	.xword	0x7fcac5da26ff7ff3
	.xword	0xf5cb5f04ab454d4f
	.xword	0xd36fe9276a26f2c5
	.xword	0xfb717bbf00efeb2a
	.xword	0x8f3517ca9f4ea07e
	.xword	0x84928b057c458571
	.xword	0x0cc1ea7776a06b8d
	.xword	0x07884d280808e5d8
	.xword	0x3fa28af7a32c173e
	.xword	0xc893ffccecb6b242
	.xword	0x87b33f4c24752799
	.xword	0x0ac47b025cde65c2
	.xword	0x0f4ebec616ab943d
	.xword	0x71c1d6854caa62ae
	.xword	0x32b337502595271d
	.xword	0x00beae443910e22f
	.xword	0x3a9207c985f018de
	.xword	0x0baaab089fb014d8
	.xword	0xf91da4c4e140de1c
	.xword	0xdc72b54a7ddf72b6
	.xword	0xec73cdd38e25d6c0
	.xword	0x130d931d87bae664
	.xword	0x48278c8218875450
	.xword	0xf0bfb680cfd98975
	.xword	0x75031b1f1cbd7237
	.xword	0xfb6ff92bf21b1154
	.xword	0x9b62e7948bc1385a
	.xword	0x9d33bec89b1e82e9
	.xword	0x6d82caf84ad8e1f1
	.xword	0x1bb1c61b28c9b59c
	.xword	0xcdc6a517cc75ca63
	.xword	0x1310b1ee5404215e
	.xword	0x565cbc6519538aee
	.xword	0xbd96306ad89c2784
	.xword	0x411615d53c5f33f4
	.xword	0xfed664b77847298a
	.xword	0x1331f41c237e8965
	.xword	0xfd90c75fccc2c14d
	.xword	0x05b9d3ae982feeb6
	.xword	0xf90afb57fcfefc1f
	.xword	0xd8e1b6753d6201a0
	.xword	0x69ae0214e2b9933d
	.xword	0xc830c746785eb63d
	.xword	0x51613c49efbad2ec
	.xword	0xf4fc456429d508c2
	.xword	0xe38ec7ef7dcc17a9
	.xword	0xde16642f2dde6638
	.xword	0x9b0bd68e722a2189
	.xword	0x8ef4d9b3162a1532
	.xword	0xd0dc500c92d0b838
	.xword	0x48e1474896dc3da1
	.xword	0xb222d2a4c1731451
	.xword	0x781f4fd5dddec610
	.xword	0xa94b5e85e73736f5
	.xword	0x56b2bcb986bd6626
	.xword	0x02c619cb769e6523
	.xword	0x0fb7b7d36aa4971d
	.xword	0xfb7f4c7a4e3ce44c
	.xword	0xa09c0a18671dd406
	.xword	0xb2526fb821a6836e
	.xword	0x0999ed546e96f597
	.xword	0x47190317b3c8eeb0
	.xword	0x0e359c7aee3bacfc
	.xword	0x824fb3c6ab463b3f
	.xword	0x1684254828e1a94f
	.xword	0xba8db844fdd1a745
	.xword	0xdf71ab8efdd832e1
	.xword	0x68f4919a2498e873
	.xword	0xdb9b1051598ea2fb
	.xword	0x356939ca94a7828d
	.xword	0xe69bc12e4d7bfb2a
	.xword	0x1a00e734ae527881
	.xword	0xa006102aa3744fb2
	.xword	0x762603f8236da9f0
	.xword	0x4cca79fb9aeda3b4
	.xword	0x2b80cf3b79c23c70
	.xword	0xe2bdee3f1cbcd877
	.xword	0xd7725efdbfa4d733
	.xword	0xf0bc306d7ec6d9a6
	.xword	0x4b9e312bdea94255
	.xword	0x0b3685df6ada095f
	.xword	0x2b0af82cdd0ba7a1
	.xword	0xd10a41f4cade5a7e
	.xword	0x661deaf464f61838
	.xword	0x8b33bf4b6e60faae
	.xword	0x95f169d3223b900c
	.xword	0xa1c20640b78e4e5f
	.xword	0xb4b51aec2a5bd040
	.xword	0xa622d9e998c60f19
	.xword	0x988cf507551c5db4
	.xword	0x4c5ab615a4237947
	.xword	0x0fcf24efc6245c25
	.xword	0xe1869b30290ba68b
	.xword	0xb589293fe091b42b
	.xword	0xab4fef8aca7f82f0
	.xword	0x8fef7335d2aab6f6
	.xword	0xd52af724542c3754
	.xword	0xce5eafdfae6f0754
	.xword	0xdb8bc9246116d34e
	.xword	0x7bf092a7aef0242e
	.xword	0xe01cfb5139149925
	.xword	0x6cca8c8cf202f872
	.xword	0x0da04d4610306dfb
	.xword	0x7896c94768e67c44
	.xword	0xb14f25f837037f27
	.xword	0x6b48f335a6e55236
	.xword	0x8b47b7a612299947
	.xword	0x1c9fe47ed399ee00
	.xword	0x218d9c494e01c282
	.xword	0x4bc700fe8aec219d
	.xword	0xeac22b41f29fd88f
	.xword	0x5a4f8c638acd2a8c
	.xword	0x8ce93e070522d48c
	.xword	0x0ca9f5768cabb06f
	.xword	0x5c57ed8c625edb7c
	.xword	0x40944bf65faa4792
	.xword	0xdfea8e9d59361c27
	.xword	0xb5682f4ae05c7dc1
	.xword	0x611ec1d9358e6155
	.xword	0xe74407bacb13814c
	.xword	0x53445bf4b94e9d4c
	.xword	0xe64169e859a27a9f
	.xword	0x2e5c60e5be3a3332
	.xword	0x4c11b98c4b69a040
	.xword	0x487ca8f468d4c640
	.xword	0x1287252ca082c364
	.xword	0x24872d7d34e92657
	.xword	0x31be43f1adeffdb3
	.xword	0xd28d42a97d6194af
	.xword	0xab9d5e1b6171a600
	.xword	0x45ff5f322b2f71dd
	.xword	0x145bf0be5ac4bf93
	.xword	0xda72c2d6578fa957
	.xword	0xe8cf2dc65cda1139
	.xword	0xaa2850f02a69a09f
	.xword	0xc82c276d69e32186
	.xword	0x71c4294eb84c27b9
	.xword	0xe25b5c7492fc1742
	.xword	0xe09a93eeb2cce51b
	.xword	0xe0a1d15965322c7a
	.xword	0x76937ac4b570559c
	.xword	0x2ca6aa94aa88827b
	.xword	0xc832dc33896a6729
	.xword	0xc50143e88d3cda57
	.xword	0xb7a3e4c1f98513a7
	.xword	0x3c3c57ae691ede36
	.xword	0x2e9423180e2cf464
	.xword	0xdd1b15631dfe5b68
	.xword	0x41f0d0a98d28dc96
	.xword	0xde67afc7859b8429
	.xword	0x04f451a768bdf939
	.xword	0x82765f5c838c6549
	.xword	0x259069bd04c20aec
	.xword	0x666999458c245cf8
	.xword	0x577f45fe5d1b00d5
	.xword	0x59bbb92eec6fbcdb
	.xword	0xe675164e82b6464d
	.xword	0x7d29e6900f8f4f41
	.xword	0xe8a64933b21d33da
	.xword	0xf919d609b4e21826
	.xword	0xdcb06e6724d0797e
	.xword	0xaaa1d48a24a15827
	.xword	0x97b2901d31270eab
	.xword	0x8c663a87f972d24b
	.xword	0xa022c34e6d6d5824
	.xword	0x4ab52ee2d88d58a7
	.xword	0x3df2893d4607ebd5
	.xword	0x149ade77088cfae2
	.xword	0xa72181aa04d3c26c
	.xword	0x9c8c923ed8fa6798
	.xword	0xc36d4a3876c5f691
	.xword	0x9fb50d7e0d216e92
	.xword	0xad2385b713cc8a89
	.xword	0xfb81bf37fb8a6320
	.xword	0xb68cf8e8f44ae08f
	.xword	0x53578c2976645a16
	.xword	0x0f5e9cc7039ad690
	.xword	0x27cae498b8458f47
	.xword	0x355e3092530909c3
	.xword	0x58bfcb03fe131e53
	.xword	0x0f7f0ac3bd1558de
	.xword	0x1df5142675cdcc4e
	.xword	0x0c969c1ea72869ed
	.xword	0xbb13fcbd65b32bed
	.xword	0xfae5f10508e1a322
	.xword	0x2121325dd0870e4b
	.xword	0x5f99ca625d10952a
	.xword	0x916fbefb7c63e2fd
	.xword	0x3b5b1711ebaf2e5d
	.xword	0xe9e97c12ec85b668
	.xword	0x1404c136a78f42ce
	.xword	0xcc275ab0792cebf1
	.xword	0xbbf1281a919db6b7
	.xword	0x5c06eef37f267003
	.xword	0x0b92b46257ad91b5
	.xword	0x388be6fc78bf0bab
	.xword	0xbc26f50f86fcb079
	.xword	0x0c4be1c5af746d16
	.xword	0x115fce8bcdb1f17f
	.xword	0x7d2e4dc82ed56609
	.xword	0x22c1289620a42a95
	.xword	0x9c823cbb8c0dbe6a
	.xword	0x86e6a47ed260d291
	.xword	0x4c80070e8bbe87f4
	.xword	0x999b20c1850307e0
	.xword	0x3062450efdd26b60
	.xword	0x8d3e5b4b575c9101
	.xword	0x9d7ff6eeb2f9f8f8
	.xword	0x65f87960966d26b8
	.xword	0x9bb6d80d7ff15788
	.xword	0xd432061f9de66120
	.xword	0x7ea5cad98eb8e5ee
	.xword	0x9676ff85572fb1cd
	.xword	0x134493df15b51d00
	.xword	0x7c675ed3c2da904d
	.xword	0x18901fbc28a024ff
	.xword	0xb8ca96bfdbbf2d41
	.xword	0xc07549fc0235bcc7
	.xword	0x175eb08a99925689
	.xword	0xb94c50d92ce6fa41
	.xword	0xd16ae87d59405be2
	.xword	0x90273b77f3e4308b
	.xword	0x54109a95342a98d9
	.xword	0x6344e4ec3f4731d6
	.xword	0x4dc91abb79186e84
	.xword	0x664595a7d1a3109a
	.xword	0x3c0668d3e108ffb5
	.xword	0x74322506c1db53a6
	.xword	0x7f7e6848747d85f2
	.xword	0xe4e908e926f408d6
	.xword	0xac1e25c7dc7f737e
	.xword	0xce247ab909b6fe93
	.xword	0x59ca664dcc2507f4
	.xword	0x704e50ab7000ef9e
	.xword	0x0445613659c49d69



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
	.xword	0x2e960ce8a27cd7e1
	.xword	0xec49bbe3fd2ce525
	.xword	0x7b7070175343a800
	.xword	0xe164842e7dc4e679
	.xword	0x287b88faabcb7f0f
	.xword	0xad338fb5a33ef3a2
	.xword	0xd6a747319031cde7
	.xword	0x229ad8061d1654ef
	.xword	0x6a1d48d63d829577
	.xword	0x0c2c22ff590e4cfd
	.xword	0x7cefc2fc3a1bcdca
	.xword	0x285301874446ab3e
	.xword	0x7f47fc43889673f8
	.xword	0xad8c1c8f6380e34d
	.xword	0x58e0717613e5d7e2
	.xword	0xeb2f024c79b43d1e
	.xword	0xb45ca259291c1dde
	.xword	0xa4e0a8d8be962012
	.xword	0x88bf1b4ce3f24b0e
	.xword	0xb8cbe0e5cb07374f
	.xword	0x443189f58218b8e8
	.xword	0x8b1fdc58424ed6b1
	.xword	0x216f58f3c5238a91
	.xword	0x93f75a42ea2d03b8
	.xword	0x5446cfb0a9ac7d02
	.xword	0xc035554ea3ecdfb7
	.xword	0xbe38df7874b738bf
	.xword	0xd5b45e39a0293e98
	.xword	0xc5e8d920ce1d0796
	.xword	0x23acc52af0b0ea9a
	.xword	0x48b460536dcb3b37
	.xword	0xdd671f5956aa35d8
	.xword	0x220839909be1cb11
	.xword	0x3d4d85d148c3193c
	.xword	0x1a043bc5cef14a5b
	.xword	0x8257608e9396f2e9
	.xword	0xd9a8ed8949d0caca
	.xword	0xe916d284dcb3b890
	.xword	0xfe81c8bb37625ff5
	.xword	0x904315fb9f9ee0a4
	.xword	0xcd5931ba67b9e089
	.xword	0xcb55a7d98c9bfa82
	.xword	0x308c16dcdd660f25
	.xword	0x15672e1fe6c9fe79
	.xword	0xfbf00f3388a6b8d2
	.xword	0x0009ccfcea17e170
	.xword	0x747c8f2fe30a7941
	.xword	0x7ea7e2a4d93f4b74
	.xword	0x033d47c8b8acbab2
	.xword	0xe77f095cbfb801b6
	.xword	0x20422c78d9bba3cc
	.xword	0x7b08fbb4bb1e452d
	.xword	0x92ef65bee5bf929b
	.xword	0x4ebbd9c8c58b12de
	.xword	0xc536c091dcb391ac
	.xword	0x20f1184404c77fe8
	.xword	0x17a51f21d30653bc
	.xword	0x87dfed1cfb1e3026
	.xword	0x1060e49ddcd28c0f
	.xword	0x186e4fc7a31e3fde
	.xword	0xb0a72a87bd5ee73e
	.xword	0x5899db32f19a984d
	.xword	0x72b4b9d65076aaba
	.xword	0x846c788aa8822743
	.xword	0x8799a9aa014fa22b
	.xword	0x2ba83282b570cab8
	.xword	0x5f8975bc4d58f17d
	.xword	0xe01d2a3d7f6f13eb
	.xword	0xb597cfdbf0caa121
	.xword	0xd1408b1d4b912192
	.xword	0xef47d5d7a8fedc37
	.xword	0xe9ba0e52a424d165
	.xword	0xa99f77a6f6751cf9
	.xword	0x2bc7792a2a713cb5
	.xword	0x3de4d61263ffbe49
	.xword	0xab7a4f86caa1f3b9
	.xword	0xb41d1bea356fb558
	.xword	0xbab3fa8bc068c573
	.xword	0x1e42abe66878d1c6
	.xword	0x2b6d44fe3575519e
	.xword	0xc9e4de00e48c60ea
	.xword	0x7028d1650f98fa91
	.xword	0xecd9d5ac11a418b0
	.xword	0x161f949ecd381824
	.xword	0x28699760aaaaa2bb
	.xword	0xb3167f468cc0a803
	.xword	0xbec351dd93883807
	.xword	0x600c3194ecfcd14f
	.xword	0xf2cfa5727841f6b3
	.xword	0xc4cebd0df36cd073
	.xword	0x318ff94d0e0dd503
	.xword	0xf19d44013da3ba7c
	.xword	0x6745dbf52a857441
	.xword	0x43301c3b238643a1
	.xword	0x53f66eba99646208
	.xword	0x36599870ae1894b1
	.xword	0xa9808c400baf93d1
	.xword	0x18cf581506087d3f
	.xword	0x0ad86ff0c89253dc
	.xword	0xa815bf1e772646c5
	.xword	0x58363f372e54412c
	.xword	0xe171e3bb79675003
	.xword	0xe6b2546a71b1f630
	.xword	0x55b7244e14da1d88
	.xword	0x0e44bbb4b33affb1
	.xword	0x8d26a22392446a80
	.xword	0x75ec9fae864d8d76
	.xword	0xffc3d700a1be4ccb
	.xword	0x9eb40338aff68c63
	.xword	0xbb0d9ef8bcb8528c
	.xword	0xd3755602288a0c86
	.xword	0x6918e00d0ac8c9a6
	.xword	0xef72b3d2695b36e4
	.xword	0xa5692d3d2dcd3b9e
	.xword	0x59698788174da7be
	.xword	0xc3dd449a24d891f9
	.xword	0xbf559ff16d2766b4
	.xword	0x6a6426df48038f02
	.xword	0x39a4e3de408de1ba
	.xword	0xba73d349cbc9a9c3
	.xword	0x576f405133c224bc
	.xword	0xdeea0752de1e5b59
	.xword	0xef81cd69fc9aa4ef
	.xword	0x41034c6ddc1411f0
	.xword	0x7afda67a36f47066
	.xword	0x0125cdfced5a9668
	.xword	0x7bbcdb441b9fa9c6
	.xword	0x49b63938a505e7d2
	.xword	0x62c0c3c80c44c142
	.xword	0x0105ac87e1834452
	.xword	0xbdd55980d4bf431c
	.xword	0x851a94280589617e
	.xword	0xadd34da303366e18
	.xword	0x5061b8c96bf3a6e1
	.xword	0x9a32f69a72271f40
	.xword	0x497c58cb8116c760
	.xword	0x3add816b5d4ecd30
	.xword	0x65bd640736bcd7c7
	.xword	0x59035fbe05444c8f
	.xword	0x3e66818addf206c7
	.xword	0x63660a7c07f6d354
	.xword	0x6dd651c2958f94ab
	.xword	0xc1a9aa5a2dcbc4fa
	.xword	0xed60d540354b30f3
	.xword	0x4037bf776e44db27
	.xword	0x1e1d4c1487004829
	.xword	0xf228a18360e7762f
	.xword	0x6daa40b7aec391a9
	.xword	0xb4eb9f2466271899
	.xword	0x721bb6b7b8591510
	.xword	0xfce26488a4efb9f2
	.xword	0xa1f90d00afc546ed
	.xword	0x73f3020775211379
	.xword	0xe41942db27a3a652
	.xword	0x0cc585fcf17b8b62
	.xword	0x472deb2f0d98a58a
	.xword	0x733de310d487925a
	.xword	0xdf64c18bc17b9541
	.xword	0x4b0e50fa058b3038
	.xword	0x044dc86b74727ea8
	.xword	0x59765452c803b514
	.xword	0x28bdf4854638ed5b
	.xword	0x076408b9577c76b7
	.xword	0x965cb906feec1929
	.xword	0xcc3ae09b0fd57eec
	.xword	0xd557db76368dab45
	.xword	0xd769ba213d41bc51
	.xword	0xdeae9c4a693eb715
	.xword	0x3f59dd341c0fe0b7
	.xword	0x9f25c58115d526a7
	.xword	0xe891e08fc36e95c2
	.xword	0x22397adf5858bfae
	.xword	0x4d72b746df769119
	.xword	0x3ae58f44e4682d49
	.xword	0xa0ca986cd1853217
	.xword	0xf10f071f28147a8f
	.xword	0xc2983377ed8920d3
	.xword	0x2adcc37c76d71c2b
	.xword	0x7a947abbb359f994
	.xword	0x2d141caf424fd8fc
	.xword	0xd5407f9f81309dc1
	.xword	0x793c879fbc3cd73c
	.xword	0xe61df354e261fc8d
	.xword	0xf9fc3be4d330057e
	.xword	0x46d90658bee141d6
	.xword	0xe9235d4c83eed011
	.xword	0x36ab248d9d2976f6
	.xword	0x831fb8a39c8b94ea
	.xword	0xf44e900d6b587210
	.xword	0xec7b6ae7debbd82a
	.xword	0x496b122125ab3e2f
	.xword	0x1ce0820341ec09bf
	.xword	0x52957c2cbaecf0a6
	.xword	0xd284a5add2256a54
	.xword	0x61998c5c6f32fedf
	.xword	0xe97db62448ceabf7
	.xword	0xe357e37353ec3a23
	.xword	0x913d16e46fb391a2
	.xword	0xf701959533f72b14
	.xword	0xf9da819f569bda92
	.xword	0x593d037b583d7a13
	.xword	0xce112cc01a7c48d0
	.xword	0xf814193486b0f0a0
	.xword	0xe4fe177c69826245
	.xword	0x4b922f809409b650
	.xword	0x038297e4f94b71f8
	.xword	0x629c434f8c1cf4cf
	.xword	0x0f4c31b1981534a3
	.xword	0xbac4091519b70535
	.xword	0xa23138e0d204e35f
	.xword	0x772bda235c1726ef
	.xword	0x5be4a4ad49fe7faf
	.xword	0xcaee9b0b3df3f7ea
	.xword	0xcebb11d017e81fc4
	.xword	0xc2be0548a071982b
	.xword	0x8c3b21925105761a
	.xword	0xa7acd9485f39105c
	.xword	0xa0dd06323a418b5d
	.xword	0x1a5075eec5523789
	.xword	0x7de4ac3a6a44b4a0
	.xword	0x8b4fe5371dad610b
	.xword	0x141fcc5d64e8e62d
	.xword	0xfa2e59c5f5134f72
	.xword	0xfe06f923bd9cd43f
	.xword	0xa67d02b86b6cd92f
	.xword	0x84ebe54c786d225a
	.xword	0x9504907526f25e63
	.xword	0x9599e09c9b5c6b55
	.xword	0xddb661f7a0216dd0
	.xword	0x725ec131d8dbf658
	.xword	0x571096bc98ca587e
	.xword	0x9ad9e95151ea521b
	.xword	0x1e14c4278ac0118c
	.xword	0x5e0a52a03cf9537a
	.xword	0xd49491cf3852af5c
	.xword	0x40bbe46f82b6a663
	.xword	0x6a65c814368fab8b
	.xword	0x13f0c179793d93da
	.xword	0x00edbc78a110de49
	.xword	0xe3f41da1050a624c
	.xword	0xe7f9415f3789bc4d
	.xword	0x6d34da9faaf5817b
	.xword	0x09aebfb7a7f5955a
	.xword	0x9ad41fc7df5f206a
	.xword	0xfc9d3ff26ba42df9
	.xword	0x8b592165891ad956
	.xword	0x2ed8beaec13f6ed2
	.xword	0x8df80e5839d108dd
	.xword	0xfd25cac55ab1d6c5
	.xword	0x81d83002f013280b
	.xword	0x46159f2361c5348d
	.xword	0x281de70b9f7d8fc3
	.xword	0x33cb2ce17a6aab45
	.xword	0x5ceb547bed25d19a
	.xword	0x2d1ba2bfd987c479
	.xword	0xd5bcc520d4fd907d



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
	.xword	0x526b3e568cf15a79
	.xword	0x876e80914b00c1dd
	.xword	0xd42a54abb3a53a43
	.xword	0x0b0f7d9528baa84f
	.xword	0x61eb9560d3d0a7f8
	.xword	0xd77a0b7a5a6d6562
	.xword	0x2fb4c57356649715
	.xword	0x83f4257e4c5acd80
	.xword	0xc1b148aadbbc5d36
	.xword	0x8fcff4ac942a79b1
	.xword	0xd1495a0bf8651c6d
	.xword	0x2581466908d077f2
	.xword	0xb773ffcce263a632
	.xword	0x0a3e52c0a99a56cd
	.xword	0xe0153c2ad8c9e9db
	.xword	0xb2c495f7c6aba9ce
	.xword	0x2659247bd95b05c5
	.xword	0x8a1dae22f3d623fe
	.xword	0x162e2bca84eb4b35
	.xword	0xc863358b879ec7f6
	.xword	0x9d756ae52db91336
	.xword	0x8e0ccdb3f21c18a8
	.xword	0x9c68c1533178e25d
	.xword	0x18b394a6b59ceeea
	.xword	0x909163fa9d55cf4e
	.xword	0x5b5b9f4115c6cfa9
	.xword	0xcbf8a7228b26802e
	.xword	0x602b082e83e9fefb
	.xword	0xc4c11f6fdd85388f
	.xword	0xfe9fadc0b7946f46
	.xword	0xf8107d1e1a7d8f3a
	.xword	0x925f9c1dd78eef1d
	.xword	0x4b51263ffb635b98
	.xword	0x212252636a211abf
	.xword	0x8f3359f001d072fd
	.xword	0x5cfca83cee220117
	.xword	0x7b4a5b78e3db5c63
	.xword	0x0af247470458dc33
	.xword	0x391ee41029a412ca
	.xword	0x5fe0136928bbe373
	.xword	0x19db5f772b65a189
	.xword	0x42b8e8e2b5928c09
	.xword	0xa29d85215156884d
	.xword	0xb87b85ac6b19eca8
	.xword	0xceccaf9c9ef9920b
	.xword	0xcc23dcbff3321657
	.xword	0x8cf1d722ebf77d43
	.xword	0xa4ee360063e60f99
	.xword	0x4a25856fbdf67dd6
	.xword	0xc92ed559e681ac6c
	.xword	0x2c472ad0e580456e
	.xword	0x246df561b50caeb8
	.xword	0xc0efcbe87afa0c80
	.xword	0x86b76191359a48f0
	.xword	0xa9c0a3f379019315
	.xword	0x511e2b31dacc6d15
	.xword	0x62d586f96b4e6376
	.xword	0x951074dd82a12332
	.xword	0x0a08eb9826a5b798
	.xword	0x491f0bc5f743ce76
	.xword	0x4159a437b7e240e7
	.xword	0x08e2ce7112535aab
	.xword	0x6ac71c9cca1be402
	.xword	0x924ff8dceaa77825
	.xword	0xc41485ef4397998a
	.xword	0xc28f293c223eba53
	.xword	0x5cda07b403f9ab46
	.xword	0x8c890b8956240822
	.xword	0x8183c626b1f6f8be
	.xword	0x0f6bd1118b693f58
	.xword	0xc4ddbe6ac1be78c2
	.xword	0xa28e8dd627cc33be
	.xword	0xb2bfee412604cfb6
	.xword	0x5797ce0fe77556c4
	.xword	0x8562f976487748c7
	.xword	0x533cbd2fe157e4b1
	.xword	0x271bed121eef3772
	.xword	0xff0d2fa5228abf9f
	.xword	0xab93f21276950312
	.xword	0x91fb2b7c7548a695
	.xword	0xab358be2fcd2336b
	.xword	0x18cfa47c887f1a6e
	.xword	0xe9b298ea20629e91
	.xword	0x1ffd938707b6dfab
	.xword	0x379dde6c4451c706
	.xword	0xa53914a49b82da43
	.xword	0x4b695532e19aa035
	.xword	0x0c36b697ad55e3af
	.xword	0x820bfdd72bade617
	.xword	0xefb5d798323d5d5c
	.xword	0x4b50ea64fab2f027
	.xword	0x24d8c2aa2592b629
	.xword	0x0ab0f1e603104fdf
	.xword	0xae8ae547d2358309
	.xword	0xb139a852cc075fc9
	.xword	0x6c45c4d7f1a34ece
	.xword	0x5f1fc0f96e426269
	.xword	0xb454309987a515ce
	.xword	0x8be128e9c9760863
	.xword	0x24835bfdeb42efad
	.xword	0x41f02400f09f46b1
	.xword	0x97b041802f1bdce1
	.xword	0x00dc98099218a5cf
	.xword	0x5a354a7dc8573bf7
	.xword	0x594d70256b98bba6
	.xword	0x86cca96752f0fc3c
	.xword	0xfc5ffb2c1f6e723f
	.xword	0xcb7eb9aa06ef4e0a
	.xword	0xeb6a5991c13c9708
	.xword	0x0d992b9d9430ed40
	.xword	0xe0aabb5ad6333e82
	.xword	0x0da2fc18e28b7fa0
	.xword	0xf12a0c97e981629c
	.xword	0x1b346b4e7df7fe1e
	.xword	0x822cb41be45ac3e5
	.xword	0xdf14e6fcdeeef98c
	.xword	0x56438e8f0dce1ca6
	.xword	0x146d56a9f5e4a9b0
	.xword	0xa3b0108c5919c178
	.xword	0x794468923a88c8df
	.xword	0xa8f1dcfda0ec8ef5
	.xword	0x128f2f35fcec5f6a
	.xword	0x38cb4a4a9daac19d
	.xword	0x16ef8fc69ce37899
	.xword	0xe54f5bfcb193d19b
	.xword	0x055e19105740e77b
	.xword	0xed426fb00c1f1e35
	.xword	0xf07a98baef6ab977
	.xword	0x8c95bc346c8fa71a
	.xword	0x651eacda0564b340
	.xword	0x51c4304a0e09f084
	.xword	0x5503dfe652c7fcdd
	.xword	0xf97fbda5fc42d9ac
	.xword	0xe4a6cbc7b2bcbe51
	.xword	0x2eeefe36c7c20006
	.xword	0x06f5fc9b81daa1dd
	.xword	0x15cad0ae96e8cece
	.xword	0x878c32536516b620
	.xword	0x32e6f4bb20a95e40
	.xword	0x40df53d2fb5e681c
	.xword	0xdc06e4a990275ca7
	.xword	0x22c6c51490539710
	.xword	0x0f1b97dc9593ceab
	.xword	0x9b25182a1e7afddb
	.xword	0xac480a6c626909ee
	.xword	0xe5531bf47c4a2060
	.xword	0xb69ccd54f430fdda
	.xword	0xddf08c777c41e39c
	.xword	0xf933f34296367c4e
	.xword	0x05aa0b674424b676
	.xword	0x81c7cefeb9e30aa9
	.xword	0x70075f9408396c97
	.xword	0x7fdb23c8def41e1b
	.xword	0xb2027724ef3ae93e
	.xword	0xc0cafc9b9380cb3e
	.xword	0x916cfc8c02c184cf
	.xword	0x924265742b1925d0
	.xword	0x24dadb9ef4ae4e57
	.xword	0xdc21eb1975cc48ac
	.xword	0x26c3a940693d04d5
	.xword	0x7603901bd643816d
	.xword	0x8b170487fb42fc36
	.xword	0xed14a6e07511afa8
	.xword	0x3c1ab6afb4ac962f
	.xword	0xb3e5f7d81d7459a9
	.xword	0x4a359f8f9c816f5c
	.xword	0xa42e8f44aee0c61a
	.xword	0x4015a87d6220e351
	.xword	0x3f4ea33781ff9cb3
	.xword	0xaffdb7445275836d
	.xword	0x995d4b626e17665f
	.xword	0x6e4cb54715527ca8
	.xword	0xc4394bc7c88f9448
	.xword	0xaef5122f18485e65
	.xword	0xcd103acbdc916902
	.xword	0x40fae2c9c88701c1
	.xword	0x096b02b1487cb69f
	.xword	0x9c1a774901fef5a3
	.xword	0xc1a6cf48a34aedb7
	.xword	0xf45931ad63a27d03
	.xword	0x06314651f9c7c150
	.xword	0x91604af09e588e72
	.xword	0xeb95ec6abcabb864
	.xword	0x3a76382ff4f6b71f
	.xword	0xb7f562ea35b2dff9
	.xword	0xddd7c1ddebf90b59
	.xword	0x3be4467b6f6cd195
	.xword	0xbd215d84361098fd
	.xword	0x3b3a1e939e466e38
	.xword	0x7e4332fa9a8d41f3
	.xword	0x9637c1d870fb35fa
	.xword	0x14a2d3a7b878e427
	.xword	0x25602d69677a7e0e
	.xword	0x40695084fb6aedfa
	.xword	0x61d4f53b2b67392d
	.xword	0xd20b93846e291a01
	.xword	0x91379e2facd57e29
	.xword	0x94c2f2946122d5eb
	.xword	0x1da5dd5f697abbf6
	.xword	0x943bd578b255f665
	.xword	0x0a7b07ed3ddfd1ad
	.xword	0xe5d44b675dae5ac7
	.xword	0x1f2595283080e19a
	.xword	0x8d8d5f1ac28ced56
	.xword	0xa0cf9eeac191e08c
	.xword	0x5cf468d545aa543e
	.xword	0x53447269b3e103c1
	.xword	0x6875bf8474dfece5
	.xword	0x16e5d7944b6ed662
	.xword	0x0798f91e4246ad1a
	.xword	0x5cb63bedd67edec2
	.xword	0x1117542430efb64c
	.xword	0x4d56f1b6065b7b96
	.xword	0x7c064f378b0a5ccb
	.xword	0xa345607c237b05c6
	.xword	0xa941321e64193d1f
	.xword	0xd27c495c508fc24b
	.xword	0x389ccc159404a6e4
	.xword	0x9e10ed9fb7ffc651
	.xword	0xb97fee4dcde43ee5
	.xword	0x880a50abd48ece88
	.xword	0xc498dc73619b2333
	.xword	0x5efc053b8efd1f43
	.xword	0x93d548c897e5ab09
	.xword	0x0aed29bd9c6d5536
	.xword	0xdb21fea25010caed
	.xword	0x6375b495b837681f
	.xword	0x70ee782882b58d32
	.xword	0xc59b102e65e2b430
	.xword	0x60d8582162d5239e
	.xword	0xf854e332e990d94d
	.xword	0xb682a1bf68cb82ff
	.xword	0x472bea84307feb5b
	.xword	0x8bfed33fd5f06d0a
	.xword	0x8c0356a04c9164b0
	.xword	0x180c2c9e4c225409
	.xword	0xe1846310ffbe121e
	.xword	0x5dbad5b6e8d9ab81
	.xword	0x505dcbc13f4f9244
	.xword	0x113c2fbab2cab465
	.xword	0x6fc713ef0e5e8ee8
	.xword	0xa46cac512b0bd14a
	.xword	0x73aaab1b86a2100b
	.xword	0x1b9e49a0a32be77b
	.xword	0x9ae66880e6add1ba
	.xword	0xc358198a73273725
	.xword	0x2e600c7c9d871a65
	.xword	0x8cecdd8e44a7db19
	.xword	0xf03c0afde79bba59
	.xword	0x7b70ebbb8db142fc
	.xword	0x39c06286e464dd2e
	.xword	0x4a1ec84021a95c91
	.xword	0x2b84bd49496f2560
	.xword	0xe2d19c345e4dd723
	.xword	0xbef0fb8b74826cae
	.xword	0xdadeb26c18bb60ee



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
	.xword	0x70a6d67952691c79
	.xword	0xa624f01eb28c69fa
	.xword	0xa437506989ed93ea
	.xword	0x8c9038ad38b14254
	.xword	0x707fd51d249ce68b
	.xword	0x5dd08ab87d45b861
	.xword	0x63e0d5dcb756af3b
	.xword	0xb0e2365aa282cf79
	.xword	0xc4640d7e1d8e77c1
	.xword	0x45ccf1c78fcc471f
	.xword	0x5e8bd130cbf0fe27
	.xword	0x2e9da3bbe61ae67e
	.xword	0xc0183ba7c19ef5da
	.xword	0xe5279f00cc6f33c5
	.xword	0x197a041cd875e233
	.xword	0xb82353b9688f4e6d
	.xword	0x7400ed4cc9ed8fee
	.xword	0x5ff6879ab0cad322
	.xword	0xc0ed983547d10a1a
	.xword	0x12bf5df0b2a731ac
	.xword	0x555ac4a0f12e148a
	.xword	0xdc1b0ddc16d03647
	.xword	0x363c3ffdd3e6d5d3
	.xword	0xc47b3c57ccd07da8
	.xword	0xb98eea403e050eed
	.xword	0xb1c485072dd47c6d
	.xword	0x2950344d439b9df6
	.xword	0xf577558ff0a7456a
	.xword	0xdc469750d4755085
	.xword	0x9ef2a71c80ab94aa
	.xword	0x77e87a9ad4f977a8
	.xword	0x559e2293c280df4d
	.xword	0xc6b63464a97c38a0
	.xword	0xbc43e54b20313588
	.xword	0x0573baf709d095aa
	.xword	0x96c69503154659ec
	.xword	0x433eca88c1a940f8
	.xword	0x0c1e943d313d55da
	.xword	0x5038b46705645560
	.xword	0x9869f30853a80ad2
	.xword	0xe8a0b81a023644fe
	.xword	0xb4d2b71a95cb1896
	.xword	0xc251e033036da9d7
	.xword	0x1c584b82ec6ee393
	.xword	0xd92b4b856636e342
	.xword	0xfd26e2b3a89cd0ef
	.xword	0x4c65943bfb781fd1
	.xword	0xeca9976ef51f8823
	.xword	0x7f942b06a792e9c6
	.xword	0x7c1f4c6011976598
	.xword	0x278eb3c1c77fb891
	.xword	0x9a254e5dbd05b79b
	.xword	0xb6afec39144a6d66
	.xword	0x4c0972b6a89b4f93
	.xword	0x863fa26038a36e3c
	.xword	0x8a268fc7c59661ef
	.xword	0xb2ea17c1cbf6e384
	.xword	0x86be497be57b5ae5
	.xword	0xa11f441db3628337
	.xword	0x9632d58d47229293
	.xword	0xa903b8debf4fd895
	.xword	0xc36e85e90a9d9e08
	.xword	0x934e026ae5943ece
	.xword	0x872b24c3c1aa8a3d
	.xword	0xfd48c240bbb8cf5d
	.xword	0xcb614ad6e7eaa4e5
	.xword	0x9aed1454433fac86
	.xword	0xe9d49fb37bea75be
	.xword	0x59cdb1c42799a422
	.xword	0x75012bd74f53bc63
	.xword	0x3de66fe2ef252783
	.xword	0xbddfdcdcc8954bd4
	.xword	0xac84d537da3ca2c2
	.xword	0xd9121ffea3c10d7f
	.xword	0xd9cfba9d76505be5
	.xword	0xb5ebd854e5663a97
	.xword	0x96d26f9650277aad
	.xword	0xb30a1a50fd8dde94
	.xword	0x187d8e41fc33d5f6
	.xword	0x1ebb073a597956a6
	.xword	0x3d03fa8294c525f8
	.xword	0x50589de2a85df716
	.xword	0x4979e24e68a9196c
	.xword	0xf05fde9eed1ad632
	.xword	0x48ddcaf7707bdef5
	.xword	0x594497fc3e0d3169
	.xword	0x34a5d36e65906d45
	.xword	0x1212497ba61d489b
	.xword	0xebbc8d1f3bfddc97
	.xword	0x9c3b87be80c3bd51
	.xword	0x83fc6ad0c6ff2e26
	.xword	0x84cfbb856da40464
	.xword	0xa495e7b26d284d30
	.xword	0x51b5731e7e4b921d
	.xword	0xc6f1479461aadf09
	.xword	0x03b0f2881b3699e4
	.xword	0xfa3b2b23f477e355
	.xword	0xcfe8260b72bc0f39
	.xword	0xe4fd576b502cd196
	.xword	0x7f284fa8e0afd385
	.xword	0x560da18213a897c9
	.xword	0x3cf25234c4fae3e7
	.xword	0x9abaea8a11906461
	.xword	0x9f61cd5b2087ca07
	.xword	0xe0ef96e8f664574b
	.xword	0xe9b0df746926dbd6
	.xword	0xe89867632be758f9
	.xword	0x281b32adc2c5d439
	.xword	0xc8153b9cc1ed76f6
	.xword	0x822a2f4b6735747a
	.xword	0x37453dbab9bab76b
	.xword	0x29b4cd4699dc064f
	.xword	0x4028abe38f5f25f3
	.xword	0x58f5d506c11aa145
	.xword	0x7945fec849347d8e
	.xword	0x4ed16dbc269187b0
	.xword	0x57d8e75a2ae46735
	.xword	0x05b172dd5a725d51
	.xword	0xf017d5474335c314
	.xword	0x62f864e1290c1957
	.xword	0xbe59f8e5f44d79cc
	.xword	0x309d366e42e0ae72
	.xword	0xfae697c02d100701
	.xword	0x7c4b7375eda486d1
	.xword	0xb7e50762b16df109
	.xword	0xae725f460e635e2a
	.xword	0x2790a44e6a6eb16f
	.xword	0x0bec25297253593d
	.xword	0x7624ff91863005f0
	.xword	0x7be4eabce5fd9393
	.xword	0x3996e7c084c0238d
	.xword	0xa94ffd0adec68b74
	.xword	0xf4c929e041569ed0
	.xword	0xaf7c2c1019f06494
	.xword	0x87c767d9f51d8a03
	.xword	0x2bfbec1bdcf07860
	.xword	0x4b9d03fa0ddec356
	.xword	0xa18147394aaf16c7
	.xword	0xddce60e1e8834548
	.xword	0x844e54304eddb39d
	.xword	0xe8badb5a87d9eb09
	.xword	0xb7a1e5961e5a3704
	.xword	0xd00fc2fedcac8b0b
	.xword	0x884043ec87e63def
	.xword	0xd4f1bce287b723bd
	.xword	0xdcf8eef257d8c5ea
	.xword	0x5256ff55418de5de
	.xword	0x3e30f0f0a18b2173
	.xword	0xd0dff5f9ad4ab4d8
	.xword	0x9cf2c8d92fdceda9
	.xword	0x9067c2ede581d6fb
	.xword	0x8818c8ffa6980171
	.xword	0xa82b57a17566e6d4
	.xword	0x0baab661e541151e
	.xword	0x1b3a0ca2f8ee9fe0
	.xword	0x949a262891aea2a5
	.xword	0x2cd0c536bdb8c939
	.xword	0xae7cf1f2af2714a5
	.xword	0x6015c9ba20ac07c2
	.xword	0x97c28736b6282ca1
	.xword	0x8931c977eb0b2bc6
	.xword	0xb0df4b724b521aa7
	.xword	0x55771062777e2412
	.xword	0xaf3acff6a06afad8
	.xword	0x899a6415d2ae5a75
	.xword	0x08caba4439b14cd2
	.xword	0x8ca2d041a90a2bd3
	.xword	0x7949b91cf002831b
	.xword	0xf136e5e264aa839d
	.xword	0x4f288211efd6887f
	.xword	0x1c2a60269b0908aa
	.xword	0xc05b2d81a2274179
	.xword	0xc25554daf4ad5ad4
	.xword	0xd40ac82cba665706
	.xword	0xa60687a4de2e96a6
	.xword	0x479c547cd59320bd
	.xword	0x98b34b00201387dd
	.xword	0xc9889aff44380d3a
	.xword	0x142ed39da6ca3751
	.xword	0xfaff866fd78fde72
	.xword	0x7ca1133ccf770a38
	.xword	0xb35252860c88eba7
	.xword	0x4849fcd82ff2e2ca
	.xword	0xe41ad61f52857350
	.xword	0x5c98e4e243aef3b9
	.xword	0xec1fca4e9772f48b
	.xword	0x64d45b85118966a7
	.xword	0x2a5d36f05bcaab95
	.xword	0x050fa9018c718665
	.xword	0xf315cdc4723fc238
	.xword	0xdcd47ae1cd46a200
	.xword	0x784d65a5f9bc415e
	.xword	0x057a004b27eb9c51
	.xword	0xdbe7c4eec4a5edf0
	.xword	0x2f94a4c2fdf5b131
	.xword	0x294e9d30a6811b4b
	.xword	0xc3a9fd75dca31ec7
	.xword	0xa71bf52feb3946c1
	.xword	0x71afeca9620028c1
	.xword	0x5e907b815a73c61a
	.xword	0x78fd18a10bc2a154
	.xword	0x4caf34db8245f4ad
	.xword	0xe1db8bce32a3d380
	.xword	0xd6991e4f0cd1d9dd
	.xword	0x09f883b5a24bad81
	.xword	0x3698e05e97dbcace
	.xword	0xa5d35b9805d6c8d2
	.xword	0xdf46c6f775f2ff94
	.xword	0x39ec39d77a7a56ff
	.xword	0xc6081562dce27018
	.xword	0xd4b55223983ffea7
	.xword	0xc048a94eb67f237b
	.xword	0x77bd272c8d520fdc
	.xword	0x3048d27dc379dbc9
	.xword	0x39d891c8bfe3b76c
	.xword	0x334693f8a0b0cd81
	.xword	0x38289d64abc7f550
	.xword	0xce4d3d84c5607449
	.xword	0xa4274a94e7c9c11f
	.xword	0x1889ae2d6746e2a6
	.xword	0x0d2d2620b64e9049
	.xword	0x975deb0ec307062f
	.xword	0xaec0bcb72cf83d83
	.xword	0xb9bc73402dbe1551
	.xword	0x25c337113e15df40
	.xword	0xfd8d021552d71771
	.xword	0x5a9566b39dd3183f
	.xword	0xc16fc35df654f5f5
	.xword	0x116308dca220f365
	.xword	0x1fa56832f4ab3030
	.xword	0xc87ebe2e17b13f7a
	.xword	0xab99d806566a1b16
	.xword	0x92b40f4e921a49a3
	.xword	0x454a51a6eae4d208
	.xword	0x30962a1fc87a18cd
	.xword	0x344aebd4101dca86
	.xword	0xc7092c60e990c533
	.xword	0x851a899097e785e5
	.xword	0xb75dcd4106fb6752
	.xword	0x84760feb89f15d88
	.xword	0xc6b31017df4dea03
	.xword	0x3231690832789ce2
	.xword	0xe78075e80f5323f2
	.xword	0x0e64aa2c0a30676c
	.xword	0xcd21303381f83cd1
	.xword	0x3fc4670a6d923327
	.xword	0x492cfdb4e65fd1ae
	.xword	0xace56ffac39e11e2
	.xword	0x0b296b01a5d5e51e
	.xword	0xe4ca5fcd677a25c8
	.xword	0xbf302011a5bae454
	.xword	0x44d97044f22322d9
	.xword	0x190fed9bd413c975
	.xword	0xf51333bdb97580f1
	.xword	0x4541074237b69df9
	.xword	0x6259c76d1c9c4405



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
	.xword	0x75c656a54dbb60e9
	.xword	0x484c39292cc3082b
	.xword	0x696b455be4c28d72
	.xword	0xb160acb04669f715
	.xword	0x3a645b831a013d64
	.xword	0x25980185a58f810b
	.xword	0x93a822fb4aae5346
	.xword	0x47b645ccbb456175
	.xword	0x634a47dcfc8bdcdb
	.xword	0x97182d7d2ab14a15
	.xword	0xba212f779da659c6
	.xword	0x9b4c3d0642baedd3
	.xword	0x7433c11471656b61
	.xword	0xdb9a9188f3deb624
	.xword	0xcdecbf945d858a4c
	.xword	0xaa3ab8a5a19655dc
	.xword	0x286ea8bc6ede3f0a
	.xword	0xc3b5d863cad3b53c
	.xword	0x279d02106b900b15
	.xword	0xda7930bb463ed969
	.xword	0x3a4f596265d701a5
	.xword	0x344110ec128b6db4
	.xword	0x6c3bd9f3034a45b8
	.xword	0xa74941aa26f9598a
	.xword	0xdf460221618a250f
	.xword	0x7182fd9e0ef9b5d1
	.xword	0xf8a57dcca97ec18d
	.xword	0xc45a9b8de495f827
	.xword	0xe5f08ef32046958e
	.xword	0x46609878555b8919
	.xword	0x0da0efa52bd37d22
	.xword	0xa49291a8abd50db6
	.xword	0x1690afde72207485
	.xword	0x5daefe5fde9142a1
	.xword	0x2ee8db73a70c48b8
	.xword	0x1d29b762dda0b103
	.xword	0xcd2ce4736f8d500e
	.xword	0x8954b1ce75138e46
	.xword	0x1741ef09bf0712aa
	.xword	0xe1cc9146ccf3f347
	.xword	0x1546a0ade1bd8e40
	.xword	0x9b5938fadf2fb7f3
	.xword	0x1c9030fc2f78b287
	.xword	0xd45c5221bddface2
	.xword	0x5510a3a05d34d92c
	.xword	0x994d8a48c6237795
	.xword	0xaf6b22cd47ba8e7c
	.xword	0xf54021a6ae89de07
	.xword	0xd1e6ff7ae16f6110
	.xword	0x403465624274ff4f
	.xword	0x034c1e2ea00fddfe
	.xword	0x16d48532588fd6b4
	.xword	0xefd56200ad9e7ce4
	.xword	0xf7edec06a8506c96
	.xword	0x554c45a388d73480
	.xword	0x226f2c82a8191180
	.xword	0x13884fdcf01a9e95
	.xword	0x5bdecf077956ba50
	.xword	0xb1d31c3f29e23626
	.xword	0x3cf249c896810ee4
	.xword	0x7e76acaccc854bff
	.xword	0x15cc11701f25cec0
	.xword	0x6fcb7a4df7921d9f
	.xword	0xa76b4023a6266485
	.xword	0xc81ecb7ee6f731e2
	.xword	0x7dfd8724d73f7e0b
	.xword	0x9dc8b7e2d6756af3
	.xword	0xd91229c1cd87f6d1
	.xword	0xe72660a8dd87cb1c
	.xword	0x2a5f40d771975e89
	.xword	0xc983af077030034d
	.xword	0xeef4933b126fc066
	.xword	0xdb2f2b1d05b4bf0a
	.xword	0x6412929e58c14c09
	.xword	0x6f0b37288c2b827e
	.xword	0x42ea5ddf505dd40a
	.xword	0x14c3cc95def77153
	.xword	0xe5d67f25c6a90153
	.xword	0x46d6ef8742313c8f
	.xword	0x610e46565aea6b14
	.xword	0x773d275eda5fe49a
	.xword	0x743ed70650923886
	.xword	0x6c072d039e2e7f58
	.xword	0xb4f70e14209b9a03
	.xword	0x5c4e375217fbc2d8
	.xword	0x030d326b0ec60549
	.xword	0x0bf4910801350187
	.xword	0x47f3496725876ef7
	.xword	0xf54d8f266e250424
	.xword	0x2f9b455236e41c00
	.xword	0x12c4b244822c4e29
	.xword	0x2ad66833a88ab598
	.xword	0x287952cf8938b993
	.xword	0xef8029a040c87653
	.xword	0x8c47878366561a63
	.xword	0x8714c60938fbe9ce
	.xword	0x707590e890c217a7
	.xword	0x6af4e7753e7a7d4f
	.xword	0x9b239f81f2d99c33
	.xword	0x29fe1da626498c01
	.xword	0x9db5e8e4e4e46add
	.xword	0x1a013aa90e82a76c
	.xword	0x79df2a98d2604f63
	.xword	0x4785290d21f5d897
	.xword	0xecb4e4a9248e97e7
	.xword	0x6d251defa048024b
	.xword	0xf4ab112f6e5a5316
	.xword	0x2902b96cef9319b0
	.xword	0x72ed8e4d86fcb420
	.xword	0x1da6fb29ec035d40
	.xword	0x6ed82c5e6a1f36ef
	.xword	0xc7fbb98638de6fd0
	.xword	0x0b55919c90efbf53
	.xword	0x46716cf436bee739
	.xword	0x2d500981c0613595
	.xword	0x2c94f5cf8c98d07e
	.xword	0x5d2b12e1fc4a3f60
	.xword	0xce03ec9ed4f82df5
	.xword	0xdf7c40a18472c9a4
	.xword	0xa5a4167c892d41b2
	.xword	0x087f70c3b5117079
	.xword	0x951e5b89e8a95fa7
	.xword	0x873270fe87cb07df
	.xword	0x68f9477a653dada1
	.xword	0x342a35956ab76ec0
	.xword	0x6af15335fdd021b2
	.xword	0x35d7eb8be78e56c0
	.xword	0xb9602e1f17c82650
	.xword	0x380a78ad0fea9692
	.xword	0x3f82dad7ea71a555
	.xword	0xbc816fd21bedcbdc
	.xword	0x60593b3d07a23023
	.xword	0x29562277bda653c5
	.xword	0x0e91204fac9cc846
	.xword	0x78d7d5f78b654dc3
	.xword	0x92e99a8389922d79
	.xword	0xfb119512f61bf07c
	.xword	0x7b9e7d3306e526a0
	.xword	0x8ce6971ac3b0fb5e
	.xword	0x104b4c7b1cfcc780
	.xword	0x0db2ae529a2b03db
	.xword	0xdc7f0b489988e74e
	.xword	0x8d947e43c20d9212
	.xword	0xbfb07dc32ec391db
	.xword	0x802ad93da871185d
	.xword	0xfa1fbfba16be9122
	.xword	0x04eab7b379e222fd
	.xword	0xa79494deb5266c39
	.xword	0x2ec12290595234b5
	.xword	0x18da80d3a6e22dd7
	.xword	0xd1f257ae23d6f4e3
	.xword	0x917d1867919d4c7f
	.xword	0x1dc3878eb261fbff
	.xword	0x0e6618fac6cea95c
	.xword	0x5866bf98bf1af7dd
	.xword	0x282528147c8089e1
	.xword	0x3abfbc55246a9a5c
	.xword	0xbca1c1cb3633adec
	.xword	0xd50d7806a7ca4efc
	.xword	0x39fd286005611d55
	.xword	0xa8b08518cb8929a2
	.xword	0x28f752d7366e5a76
	.xword	0x076c7551c0fe9b39
	.xword	0xa49c3b29d1bf1143
	.xword	0xf767448c810db9bf
	.xword	0xea436e66f50c2737
	.xword	0x0f83e7b8e8d1233a
	.xword	0x8aabe04084b1ce37
	.xword	0xc25581435485b47a
	.xword	0x6d0df833e95e038a
	.xword	0x9d0b9283a56a8dfe
	.xword	0xffb3265163cc1bd7
	.xword	0x2016dbaeebe88a90
	.xword	0x565ddf9a94bbf00d
	.xword	0xd3ec6dd736c3aa09
	.xword	0x4c84bdd13ce0385a
	.xword	0xfd175716edc499c9
	.xword	0xc887209829e6d0ef
	.xword	0xbc7a1caa03ef787b
	.xword	0x2fdb551495d3413b
	.xword	0x99ec13749152e656
	.xword	0xf741c9c3da71ef8c
	.xword	0x6b153219a22bf577
	.xword	0x9f84f9558efea615
	.xword	0x247808523e3811ee
	.xword	0x06cb74740338d831
	.xword	0x1263778b94b14f5a
	.xword	0x7f44cc7b69b50e5e
	.xword	0x06061d43df1d0595
	.xword	0x84fe2946fcf715db
	.xword	0x5c51b743f9281644
	.xword	0x3d3649d7e6c017f0
	.xword	0x89377501f9745ce4
	.xword	0xa0560ad431191388
	.xword	0xcc00d1272a56f794
	.xword	0x81ba41d816dd88e0
	.xword	0x381a45bc9bf16ca0
	.xword	0x936bfafac2898e37
	.xword	0x7a56f1d29374ee62
	.xword	0xd28312e7327d9997
	.xword	0x27560a03ee6fdd80
	.xword	0xc958cbc5b1caa9cc
	.xword	0x1eb3701cae6a4f43
	.xword	0xade4ccff6cdf39ef
	.xword	0x2f600e02fc231e6a
	.xword	0x62304f3c72c25e69
	.xword	0xb170a58e87539314
	.xword	0x8055eca1cc0f3d61
	.xword	0x8f6992b4cc527d67
	.xword	0x62b1a8fdfab2cc3a
	.xword	0x488ac624157478cd
	.xword	0xf2df633ec655b8fe
	.xword	0xb16332786ca3767e
	.xword	0x762d09c4ecbc5cd1
	.xword	0x809edc880047fd47
	.xword	0xbbff16f4cd6b2040
	.xword	0x904a34ece0cdcc3c
	.xword	0xe8161b921e42c66c
	.xword	0xda4024d8518cbbbd
	.xword	0x012de3e47accb9c7
	.xword	0xc976f7fafe039d20
	.xword	0xad705aa990173f57
	.xword	0x9838b4c915a13359
	.xword	0x2d7ecbc0a9fd2c89
	.xword	0x7be2c8b0d5dbc17b
	.xword	0x94afe9d970462a9d
	.xword	0x496a9066295ef691
	.xword	0x44e63882c488b039
	.xword	0xb229bd038dbeb99c
	.xword	0x2de342032afef650
	.xword	0x9749e331729b2cda
	.xword	0x432b4f58234c67ac
	.xword	0x61ea780ede57abac
	.xword	0xa6f16a45a6163270
	.xword	0xdf828b56519b094f
	.xword	0x54bad5ee246458d6
	.xword	0x62b5fb9efd593bbf
	.xword	0x954b2453db1a080e
	.xword	0xf7d89246e92ef6ca
	.xword	0xb1128fbefdc8d7b8
	.xword	0xe144d7dbd7d40a38
	.xword	0xb4d4fb7801bc25c1
	.xword	0x8a637bcd7de1ea04
	.xword	0x69bdfe9e2b2feb08
	.xword	0x6358d1d80cf8b8dc
	.xword	0xed7ca28f402f0710
	.xword	0x846625e815888271
	.xword	0xdcf41ad52232b1e9
	.xword	0xc26577cc852b4e79
	.xword	0x3942be64878791ca
	.xword	0x22a153d0b50cf6ce
	.xword	0x8d1ac81aef1cad57
	.xword	0x2cbc574f7de74fb7
	.xword	0x7a415e36e78cde39
	.xword	0x24f0488957b5f7f2
	.xword	0xe348e3baa334d482



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
	.xword	0x650a3d9eb1c4b9ab
	.xword	0x068c73f6920e4524
	.xword	0x9b06fab6368d1a60
	.xword	0x79fa9f0198a31e28
	.xword	0x2e75fbc530087c46
	.xword	0xc8e487c26919b812
	.xword	0xd1e662229d9c160e
	.xword	0x912368d2cd5eb02f
	.xword	0xd6e97afd37ea121d
	.xword	0x5f044e8ca1e66c76
	.xword	0x35387ce9e130ad28
	.xword	0xacd27ba4166457ba
	.xword	0x37b75afdf0e32555
	.xword	0x9b96f1ee5cc08bd6
	.xword	0x182f9bd8b54109a3
	.xword	0x7f3364b7c78e1799
	.xword	0x3afb038da0e0908e
	.xword	0x77e023bc3ec01ba6
	.xword	0xba1190c699e04033
	.xword	0x9ecc95263cc3d9b3
	.xword	0x388bf8ae19012c7d
	.xword	0x4c588502918837ac
	.xword	0x62ba67c9037eb721
	.xword	0xe65feac51ed8f6ba
	.xword	0xa5326ecd7083cfb0
	.xword	0xc0ab3454ebcf8224
	.xword	0x100e92b41926691a
	.xword	0x41aa5229a28d7fa8
	.xword	0xc1f0cfc00b87885a
	.xword	0x6a7c6be3e60685f0
	.xword	0x30b05d6b08cd23be
	.xword	0xd0d9e5801d4f5edb
	.xword	0xc6a414a6efb82fd4
	.xword	0x2d1cfaa5c8ab657c
	.xword	0xa0bd961a96e0d3b7
	.xword	0xd116293b493c9ac5
	.xword	0xc6a2363cbde5c04f
	.xword	0x139c660a531dd6f8
	.xword	0xdfd64104841a57ce
	.xword	0x9edadf0b0c9eef8e
	.xword	0x796eef2743127314
	.xword	0xe1e0edd5b26f5b64
	.xword	0xe67fb1abe4ff3182
	.xword	0xb65dd3c6c5cc9169
	.xword	0xdb38d129202d62d1
	.xword	0x2ed1f742b9b47b74
	.xword	0x8f337e62fb1a99e0
	.xword	0x2f6f99bfd3b33103
	.xword	0x8a87c93cb0427932
	.xword	0xf2d94a3de2566b13
	.xword	0x9a454eb30ff5be4c
	.xword	0xb06f528329a2142c
	.xword	0xc2797ca099d44bc4
	.xword	0x55d700cc61778073
	.xword	0xb801c87beeb4d1ea
	.xword	0xf4b9388aac42335b
	.xword	0xf4ed00d1d506ed7d
	.xword	0xa41231f0a01cc0af
	.xword	0x5151622e48f4827e
	.xword	0xffd95644350711b2
	.xword	0x40ac3778a374b773
	.xword	0xcf6eee76522e930b
	.xword	0x0b7dca728b2a937e
	.xword	0xb5bc402327fdddf5
	.xword	0x4b6da8430031d731
	.xword	0x30b1b2c6a09df4bf
	.xword	0x27cdb6277e330867
	.xword	0x728476fe842bf79c
	.xword	0x30a70c11e0147b69
	.xword	0x0fc738ac19ae8d8b
	.xword	0x032a6e7877909006
	.xword	0xfc1b7b1201c8d105
	.xword	0x6f6ba19b1b754933
	.xword	0x16b25573455cd4ab
	.xword	0x196b38f4cc8386fc
	.xword	0xaadcb2bb14d30cb0
	.xword	0xab2bfa1438754f94
	.xword	0xbd900a74bc9dfb62
	.xword	0xf37c6a25e42bc759
	.xword	0x044709ab48cba5ca
	.xword	0x7533979bb83d0269
	.xword	0xeeb6e72318907fa1
	.xword	0x01bec0eb1d465dec
	.xword	0x225ddf0a5d854004
	.xword	0xcebd1afff04b135b
	.xword	0xfa90551e934532ef
	.xword	0x2d90047b17fbe0b6
	.xword	0x624cb7f6f99a1d87
	.xword	0xd5e99e18a03ff681
	.xword	0xf8eca98a30e5749d
	.xword	0x5968dadc2d1aac31
	.xword	0xe9e43235e0869d0b
	.xword	0x6c60dc389f162e92
	.xword	0x7e50eb091bc67f5b
	.xword	0x6f5983d4de009f14
	.xword	0xde30e0eb2fa550bc
	.xword	0x0eb52670e6e3429e
	.xword	0x00e96f74f4606bfb
	.xword	0x230811204a95d7ba
	.xword	0x4363661b9e5afa75
	.xword	0x901abb90d8a5afd1
	.xword	0x351e0ebca8a05296
	.xword	0x84a68664a9843bbf
	.xword	0xf6495dadcb0685db
	.xword	0xf3cb5bbb304ca5b9
	.xword	0xcb57499d6a968759
	.xword	0x3d01d9afa6c537cc
	.xword	0x8b01aa3c66cc923c
	.xword	0xa6e0bb34cf19482e
	.xword	0x9d64d1770221f264
	.xword	0x48f298cbc84f9114
	.xword	0x75e35da730386d2c
	.xword	0xc794cf952324a259
	.xword	0xa3a6818eb58db4e5
	.xword	0x6f931b083f31e6ea
	.xword	0x8caa73288b5296c9
	.xword	0x394afe7707b79b31
	.xword	0x814684fbaf298600
	.xword	0x9c31678d99223f76
	.xword	0x11cda09d28727ae5
	.xword	0x11e29b0248691d87
	.xword	0x03f24ae11e307a34
	.xword	0xf57e0235ee62e2f4
	.xword	0x21116f0f14eb929c
	.xword	0x691d72184e2ec2e4
	.xword	0x9cdd78865ebba807
	.xword	0x66c77037c53e4e23
	.xword	0x8d1936bdfc8437f7
	.xword	0x9a468abaa684f61d
	.xword	0x225f7f62ea34b922
	.xword	0xb60dba4098c484c6
	.xword	0xbffc07d9621f2c44
	.xword	0x819fa153efd284bd
	.xword	0xffd852e7d12c98a8
	.xword	0xa112b0c664ce2866
	.xword	0xb3f38c735a31dd60
	.xword	0x4925c3d6b1a2a1f2
	.xword	0x709f48781ac3b0d0
	.xword	0x1aa98748b59fa699
	.xword	0xca917cd30328645b
	.xword	0x34b4a45236f3996f
	.xword	0xd63990373f4df09b
	.xword	0x7dd1bc156606428b
	.xword	0xd1736a9dc07923fc
	.xword	0xa2ef335799f8f163
	.xword	0x8b76642fe1032f05
	.xword	0x2428e6477c683583
	.xword	0xa12be00b6f73f963
	.xword	0x84b5f7ef3f19d56e
	.xword	0x50d02d91965d0d37
	.xword	0xfcd3a26f0ca2e509
	.xword	0xb3cf1cfdda190ba8
	.xword	0xc0ab661783177408
	.xword	0x78f831deb099d995
	.xword	0x81af3d6641352c82
	.xword	0x9478b89c68b997fb
	.xword	0x333f01ca0d4de2c7
	.xword	0xb87e7d48a3cc62a9
	.xword	0x66ec2441ae0dabf5
	.xword	0xcb185f4714ee1639
	.xword	0xdf4803210fabd246
	.xword	0x765874f982d816e7
	.xword	0xc5e443132f5c17ac
	.xword	0x3d7646147181365a
	.xword	0x54f076e7cea554b7
	.xword	0x09df59882d2657f0
	.xword	0x5db1a1a61476bf09
	.xword	0x5982afc3d552609a
	.xword	0xab454a6baee036a6
	.xword	0x3fb8e55c2651706a
	.xword	0x89ad8f69121a875a
	.xword	0x6ce2496ab56c621c
	.xword	0xf2e1dd492d39458c
	.xword	0x65a5bf521138271c
	.xword	0xdf63d8fdf3068caa
	.xword	0x9fba7df10f2d5e38
	.xword	0xb721da7195fe3c03
	.xword	0x96e5bc011b328e12
	.xword	0x0a69acb0d5c093f0
	.xword	0x53336a0ce0d586b1
	.xword	0xa8586edbb8f1649e
	.xword	0x33741a9ee47d3b33
	.xword	0x0f29b10a7115c452
	.xword	0xca8b47d8c6c8cca3
	.xword	0x5e346772a1470165
	.xword	0x691c416e64003585
	.xword	0x871006890b6711ee
	.xword	0x2a7a576b31bf8915
	.xword	0xee970b57cebb6648
	.xword	0x85391c7f4fa16f70
	.xword	0x692ada126d0a401b
	.xword	0xef4cab005486aa36
	.xword	0xd2b7e60f5665c59b
	.xword	0x1bb58b6b35e3fb6b
	.xword	0x844da3699833e515
	.xword	0xade3f539649af2d8
	.xword	0xdcb4ad3dd6d20a3c
	.xword	0x869516c7a7de382d
	.xword	0x28002af128e1633b
	.xword	0x307e094b103872a3
	.xword	0xbec16b5052d19667
	.xword	0xf440da85390c61dd
	.xword	0x541c1f78425b22df
	.xword	0x6c92292649890195
	.xword	0xad8420e0f74e69c5
	.xword	0xa246307021fce429
	.xword	0xf478697249695ccc
	.xword	0x52327b6da327434a
	.xword	0xc1dc4fd27cb486b4
	.xword	0xc84d75c087606992
	.xword	0xd146c3418a6295dc
	.xword	0xc9325df68b75209b
	.xword	0xf9e47bc2699f825c
	.xword	0x23020a423bf9a7e6
	.xword	0x078e01e475352168
	.xword	0x1db1d68da210cf94
	.xword	0x4c7d42622c0cbca2
	.xword	0x2488d13d9348885d
	.xword	0x1682dff777905dd2
	.xword	0x2c5ade2c8a455129
	.xword	0x730c459afe85d56d
	.xword	0x92691698c47dd7fd
	.xword	0x69f50c03095ffebb
	.xword	0xaa10d670170c8706
	.xword	0xd2f96010adb8ad44
	.xword	0xa14474c3cb002b4f
	.xword	0x153e534a9ee806db
	.xword	0xd237956b9f538be1
	.xword	0xadfd4ee685c66b9d
	.xword	0x042f32ef804540b6
	.xword	0x1a2e2e7e545f8f7e
	.xword	0x1a6caf69f9559267
	.xword	0xc28e345cf4166780
	.xword	0xb2d219b0b9e89adf
	.xword	0xe5659eb1746eecd3
	.xword	0xe7b23454fafb9fad
	.xword	0xd4a727c101437615
	.xword	0x8e7456720cc91774
	.xword	0x03bfda7a4ddd9152
	.xword	0x47dfa693cfca7ee0
	.xword	0x2c94564d924671a2
	.xword	0x65d5bb5e5b530778
	.xword	0x452beea3287ba46c
	.xword	0x5fd48ff7d2c8c9b6
	.xword	0x0072dadb7d4bcc5d
	.xword	0xf7f8b28d4d579c47
	.xword	0xd21e4460e1b9df5b
	.xword	0x8d22842cc731ee82
	.xword	0x5d98b4d908c6987b
	.xword	0x2d62826931f00375
	.xword	0x2a579f9fa4b06dff
	.xword	0x03911ebf70588df9
	.xword	0xf91f7bd1223278ed
	.xword	0x647db2f5c94e2569
	.xword	0xb92cb89e1970372a
	.xword	0x938b7f67e0ef0019



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
	.xword	0xa1d2ca1bda86b934
	.xword	0xcebe45975dad1b7b
	.xword	0x0546f534ec6ebdd7
	.xword	0x4a3e8f6ae2d52134
	.xword	0x287567085e19b1d6
	.xword	0x7d6ec291e16f2d24
	.xword	0x022a40976cd38928
	.xword	0x9c293b40cc70c0c9
	.xword	0x514c39092be0854d
	.xword	0x7e89b51b36947790
	.xword	0xa5192097685749d2
	.xword	0xa351cbd970fa7201
	.xword	0x23182b77bb726295
	.xword	0xa617babccc636473
	.xword	0x9d77bcdcecc845ef
	.xword	0x46b61350fa590428
	.xword	0x7faf31f97374f5b4
	.xword	0x90d8aaeb68c2dfae
	.xword	0x71233747bbf4bc60
	.xword	0x9de26a702ea7a1c2
	.xword	0x6b32eeeab89eea2a
	.xword	0xf8413f3cda11c60a
	.xword	0x4891837282e4a73c
	.xword	0x13d7ab34c7cf95e1
	.xword	0x1a8bb1400a9f07a2
	.xword	0xa638e0cc8d364268
	.xword	0x90c2728d8101fd0c
	.xword	0xb85e1e97343ba5f9
	.xword	0x04cb6a4d79b0ccdb
	.xword	0x6dee702209862d2a
	.xword	0x369cc101bb7b6f71
	.xword	0xeb648fde11b4f9a2
	.xword	0x86d88d773401a3f5
	.xword	0x42ad503712a20c00
	.xword	0x21753c8d85ce9848
	.xword	0xfd60840f74816500
	.xword	0xca77cb3ccfba5280
	.xword	0x123b1e39a7be4504
	.xword	0x607761feaf6ca014
	.xword	0x838807b24690b530
	.xword	0x49891978a9337d37
	.xword	0xe9ae33930191c5cf
	.xword	0x59e2a6325dc08ec3
	.xword	0xc83a9bd35a44b967
	.xword	0x1c652a607e6c9d85
	.xword	0xd363fa0b9090c62e
	.xword	0x344156ae8e293ad3
	.xword	0x13e7665bdadae40a
	.xword	0x123c09582eeb0ef4
	.xword	0xb24dc6e7573065fd
	.xword	0xfbd849e792f52105
	.xword	0x2ad0a3c7079a0d4b
	.xword	0x414c27cc41908a7d
	.xword	0x42307f16fc643c01
	.xword	0x9554f442ebc0efc7
	.xword	0x9a8271fcfc8511cb
	.xword	0x4fe69de967ccc43d
	.xword	0xcd9a9de8c8eece36
	.xword	0x092a22b31d2cafdf
	.xword	0x0d8de4b07206d4f6
	.xword	0x35e2da8b5ca6d206
	.xword	0x935ad6fb80303cff
	.xword	0xdfc2bd5c5f670a20
	.xword	0xd3099b393666cba2
	.xword	0xdd17b17f19aab4c2
	.xword	0x3fc132a87a5aa761
	.xword	0x63981cbee7c18d29
	.xword	0xbace8056c4494c9b
	.xword	0x6e6f85653bd52dd3
	.xword	0x7fb14bc8e9b829c6
	.xword	0x568c8c1e6144ed53
	.xword	0x03bb3d2f9c783362
	.xword	0xe9120f0e3efd6f29
	.xword	0x1bf82b4f3e5bed9b
	.xword	0x95bbd986d9dec715
	.xword	0x008f0dcb407f7f52
	.xword	0x39d0971bc7e7fdf3
	.xword	0x4653f25d8eebf642
	.xword	0xaf4c4fdc37cb6e5b
	.xword	0xecd74c916177916f
	.xword	0x5a595c3e1d4f8cde
	.xword	0xf43b8d3beb34d899
	.xword	0x2a36a7763e1150a2
	.xword	0x2ac54acd6b0a725c
	.xword	0x73c940a2572f3de0
	.xword	0x22f19991b6a4486e
	.xword	0x1593912ceeac08e1
	.xword	0xdf453493725c2647
	.xword	0x46004a36599d6783
	.xword	0xd99ece7d3b73dd0d
	.xword	0xd677ff9fa93281c3
	.xword	0x99d0f417109dd103
	.xword	0x112282dec8883ef1
	.xword	0x2d8cb3c4c380b313
	.xword	0x0f541ec7d52f8585
	.xword	0xf08b2ae6a21c61bd
	.xword	0xc1967eef09d1f1e3
	.xword	0x48f1e2c1da056913
	.xword	0x7164cbbedc514b08
	.xword	0xf245bae4f31de745
	.xword	0x238dd5319db1ee3a
	.xword	0xdada4a81945ff871
	.xword	0x2d8e117e5f40a23e
	.xword	0xe4dff27481345947
	.xword	0x0b31e90c7e66b18a
	.xword	0xcc69fa9ad2537566
	.xword	0x10555bde15c02d9b
	.xword	0x58f78060f0179817
	.xword	0x735f514e6cf3a4d7
	.xword	0xfa46653ac5d9e4bb
	.xword	0x88114f8aca73e396
	.xword	0x5f2019e109b7a9e3
	.xword	0xae6c40c519572809
	.xword	0x8d9278b4f47d93e5
	.xword	0x31369e427a399c89
	.xword	0x41304015eb45e886
	.xword	0xc7d6c32f1118bd25
	.xword	0x3b7fdbb9ee87b021
	.xword	0xe281ca80900750a7
	.xword	0xe6ab7b6f2c77b282
	.xword	0x42868294a53a248b
	.xword	0xf10bcbc13d31564f
	.xword	0xe10e56a9195583b2
	.xword	0x985cdfc7e8a72bb6
	.xword	0x989394b658928e56
	.xword	0xb07274d916db39f7
	.xword	0xbc19bf69d92141a3
	.xword	0x1e52b02e99db140e
	.xword	0x417fc5bab74b60b8
	.xword	0x71badfad2790dbff
	.xword	0x658f7a9f4e2ef73b
	.xword	0x7c4936d3f5bc8161
	.xword	0x3d0a0593bd044e1d
	.xword	0x66832c04ef6a467d
	.xword	0x90be6a60df1cb0f7
	.xword	0x0abb3f9232e10cb0
	.xword	0x91aa1a4b615de795
	.xword	0xa9fda486a88db5e1
	.xword	0xf4ffff2dbb472e15
	.xword	0xde6aa249d789b060
	.xword	0x08e7030763e0aa3d
	.xword	0x5c1b35965c058369
	.xword	0xaf08569038b93e09
	.xword	0x73c2837070366702
	.xword	0xff4824f29602e238
	.xword	0x4e2f394ac53c45c1
	.xword	0xc7ae0321885cb792
	.xword	0x4779c059878fe3dc
	.xword	0xcd39d4663b7124b1
	.xword	0x91d70b357eac2ce0
	.xword	0xcd0021b1ee1b9a6f
	.xword	0xfd06d96eb3373ffa
	.xword	0xa78d89b4c6bfd7a2
	.xword	0x6e194649d4e651ad
	.xword	0x38a636efe3131ec5
	.xword	0x2548c52cc268f98e
	.xword	0xd36362151b78e361
	.xword	0x274c32a60811d243
	.xword	0x88fe18d93eeb8c09
	.xword	0xe35e7b771e1fcdaa
	.xword	0xe8845629e3c8a25c
	.xword	0x599d2acfc2d3a041
	.xword	0xa5cf37468ac334d8
	.xword	0xfd85ec6c1bb8256d
	.xword	0x448282bccd9b832f
	.xword	0x04ba13010fb8bdbb
	.xword	0x294a4d1c3407418f
	.xword	0xdf520560aca35150
	.xword	0x0a3725b63fd58222
	.xword	0xc9911309a8fe5211
	.xword	0x01f3c7affffc2899
	.xword	0xd84490a5af2551cb
	.xword	0xad4e0289fa5f7234
	.xword	0x68fdc80d3e2afc74
	.xword	0x526f0e6532649b97
	.xword	0x1e188fbf7d0e21a5
	.xword	0xb95a95abaead6cab
	.xword	0xa0720c1af21522f8
	.xword	0xc17f733d9b51f7eb
	.xword	0x3da519a0d314f693
	.xword	0x810c65fe549544f6
	.xword	0x2794a2a5b3ad4152
	.xword	0x640a3d422c2dab65
	.xword	0x6eb866f01980e1d0
	.xword	0x51b7e7be33e917ce
	.xword	0xd7d4700ea4984d5d
	.xword	0xe28092ae8c93b657
	.xword	0xc847212f3901ca52
	.xword	0x63d9503840cd7fa3
	.xword	0x1ca062f58d0f1334
	.xword	0xf25629e902fc9863
	.xword	0xf4e69c420261f05c
	.xword	0xa250bf8133aea42e
	.xword	0xc558c6502edb77e7
	.xword	0x3fcda59fcfa72025
	.xword	0x3d3279972f432b52
	.xword	0xabdba6ff72750cc5
	.xword	0xd1f815b0d5a7b435
	.xword	0xab4afb61167751a4
	.xword	0xa5d1720f31cb3f01
	.xword	0xedddd0b99a584f42
	.xword	0x4804cb903e20190b
	.xword	0x8dacf92c9e60b92a
	.xword	0xce8e4efa617811d1
	.xword	0x9f49eb9751e08b1e
	.xword	0x6ab2e6069ed44c57
	.xword	0xe2e0e186007038cd
	.xword	0xf3582cc3ce52177a
	.xword	0xe0775e13c630bd28
	.xword	0x87a4890405791627
	.xword	0x9ab09df1e08657c8
	.xword	0xcbd3d67326601f7a
	.xword	0xcfc4107b3c383144
	.xword	0xfc2ce2ce3a42c907
	.xword	0xfa7a38d604101a1b
	.xword	0xb8301541de5f301e
	.xword	0x08375ff314a8f0f1
	.xword	0x9dfcf31e70021b10
	.xword	0x75e002da43031c51
	.xword	0x08292007cdaf4301
	.xword	0xd262d02cc462ee2a
	.xword	0x925c6757b5f550f8
	.xword	0xc52dbe7fbe841ed5
	.xword	0x9aa946f7e7618bc7
	.xword	0x554b77884d5953fc
	.xword	0xe60203cfbd66aa84
	.xword	0xdf56ed411d707305
	.xword	0xb5025043f86a30f1
	.xword	0x78b39f0facdb600a
	.xword	0x14b7d065794d6818
	.xword	0x3f0101282bf7344f
	.xword	0xe38c9398cd1b57de
	.xword	0xcee662fa90115fa3
	.xword	0xca7619446f69da3d
	.xword	0x4d32554c0a744d27
	.xword	0x936709ca76ee577b
	.xword	0x656e707d0c5d2023
	.xword	0x5b6de67d56844e33
	.xword	0xe325b9d668cd8cd5
	.xword	0xc8ae8072705086d8
	.xword	0x91567a938f370a0a
	.xword	0xd7304105076e2878
	.xword	0x533993e242730324
	.xword	0x50622839b6ab1288
	.xword	0x557efaba23181159
	.xword	0x8eaf8777f9d789f9
	.xword	0xa4f2d52f3a8a4ce6
	.xword	0xe5308b189a197825
	.xword	0x095b6d201c3c4e1a
	.xword	0x5fbc34635a01f7ce
	.xword	0x35dfa608543dd33b
	.xword	0xd6adcf52f3d8982e
	.xword	0x4c54cd6f4fc428da
	.xword	0xf65eb9da73363b1c
	.xword	0x0d9d94686e5780fe
	.xword	0xbe5714d95e2e2d58



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
	.xword	0xcc5b3d96c8891bac
	.xword	0x59a504489651d8f5
	.xword	0xd1d379d958a5a4bf
	.xword	0x32c9fd05132ff92e
	.xword	0xdab5ab5327a27fe0
	.xword	0x0d5d9d1efe842510
	.xword	0x145e4316674969f2
	.xword	0xfbbce2053e2a7a78
	.xword	0x69d9d0a247829e99
	.xword	0x27bfe48c9e1bea49
	.xword	0x9cbca1d4f36360b1
	.xword	0x4f9b06c54c187203
	.xword	0xe45153c02f9039dc
	.xword	0x83bc353663090630
	.xword	0x8e951e7cb80465f4
	.xword	0xfbc9101fe0737d11
	.xword	0x445e898e51f1b677
	.xword	0x3e7bd34c3b6deb3f
	.xword	0x5853897c419b59ea
	.xword	0x706beb3dfd525a55
	.xword	0x231349c5f7eb6dcb
	.xword	0xa462bf10e78cf073
	.xword	0x34ae61070e03c1d0
	.xword	0x2b29e81a6b546756
	.xword	0x610a0a265aad3aed
	.xword	0x5970cda29dc6ae89
	.xword	0x769b8a226cd345e4
	.xword	0xb579457e73f00e6c
	.xword	0xa4a7ac2f9444df60
	.xword	0xb0a037f22375b8e6
	.xword	0x4f7fb3939208c8e1
	.xword	0xc510a89c75e16fd0
	.xword	0xd85d3b3a873094c5
	.xword	0x73df331fbaf1df39
	.xword	0x4811bcf3e4a15527
	.xword	0x8fc1d0d253a493a4
	.xword	0x12ee3095df4f3c90
	.xword	0x184c929cbbccd2d7
	.xword	0x3af82bbb93f29079
	.xword	0x04b760e23f2f8e59
	.xword	0x233b8797b8c584de
	.xword	0x1afd1f352c3b9f1c
	.xword	0xadbb424250dd1283
	.xword	0xb0b2ccf94aa82711
	.xword	0x660d976b669aa43f
	.xword	0x3c4c215fea7d4867
	.xword	0x48248d8cec2b197e
	.xword	0x5d900db3fe023c61
	.xword	0x7ab32dd8e7337fe0
	.xword	0x76997d98aa474716
	.xword	0x5e6c1ec16b374cfa
	.xword	0xb2892dc043d58c41
	.xword	0x3a810c18054a77ca
	.xword	0xac77e774bb7194e1
	.xword	0x5372993e65240f82
	.xword	0xa24b4ba268cecf68
	.xword	0x37146fa070a39f93
	.xword	0x67446d0672e9b42e
	.xword	0x12d576caf09a0a41
	.xword	0x3382bab7b35a5637
	.xword	0x8f2d55878f46ffe5
	.xword	0xa857a51054fda4c7
	.xword	0xad9236339a9ae90e
	.xword	0x6e7d41c5d2e5fa44
	.xword	0x00f6636ebd8af997
	.xword	0xaa653fe2092ff3a4
	.xword	0x43f9344e36beebbc
	.xword	0xeb8fb8cbec9336ed
	.xword	0xdecb2a987a642561
	.xword	0x13bf41bbeedb340c
	.xword	0xe69e310794fa6869
	.xword	0x079c0e0b71a7339d
	.xword	0xa606c0c07821e50b
	.xword	0x90deb680e16b06b4
	.xword	0x752a6dbd4743978c
	.xword	0x52b93b81ff5580fe
	.xword	0x7fd0e515a6a14531
	.xword	0x17152924545aa888
	.xword	0x5568c784c429ce25
	.xword	0xf6c0d311d3c52761
	.xword	0x1a2491d175394c84
	.xword	0xb86ee801b9cf8e8f
	.xword	0x2c4298b9b5c4cb63
	.xword	0x53c3e72490c58255
	.xword	0x98e064df8cafb6a8
	.xword	0xc7aa8d7f65e9818e
	.xword	0x5f92561774875aae
	.xword	0xbdb371d787fecf5c
	.xword	0xa8492feeaa721751
	.xword	0x2412a7bb2b4da97e
	.xword	0xbfc85d07412c7168
	.xword	0xfb51f319395044c5
	.xword	0x5cf904a334dadfa2
	.xword	0x7a0881ebb9f720ef
	.xword	0x245a514cf935b3f2
	.xword	0x0b4db314b144c9e3
	.xword	0xf2142eb3e61be6a0
	.xword	0x0485a08057c9eca7
	.xword	0xc4d486801f728608
	.xword	0xe2cd2b78a82c38bb
	.xword	0x6911f55568727488
	.xword	0xf467cc76f9683530
	.xword	0x08e95a1ed275b345
	.xword	0x42486746eeea8c57
	.xword	0x078dfcc25ff09e7a
	.xword	0xdb180f03af0fe1f1
	.xword	0xb173513b6afc5c4b
	.xword	0xf9d9edc588a3aaca
	.xword	0x2f421a1bcffdf20d
	.xword	0xfb93a92cdb5abe09
	.xword	0xae62e1aac6d55827
	.xword	0x9c3640980f97bd13
	.xword	0x4093e7b5e767f870
	.xword	0xde1edaa392e9b1ad
	.xword	0x86ac08d72367a770
	.xword	0x15de33b6372dd993
	.xword	0x961f974fc16b93bc
	.xword	0xf038673dd0b684fc
	.xword	0xf7c8709997f2d191
	.xword	0xd419f3943fa83b52
	.xword	0x64935fe4eb2a3e46
	.xword	0xc59463fadb1c10c3
	.xword	0x17aeba198af47f93
	.xword	0x262ceb776ddba93b
	.xword	0xed25875cc99c795f
	.xword	0x5b2b66c59ca9d571
	.xword	0xf175838be71ab353
	.xword	0xde6931d7c2c54a67
	.xword	0x20efd1a8b1d1526d
	.xword	0xb520a72d853fbf3e
	.xword	0xa37eafa1bf56f842
	.xword	0x0c6b118dc87c9fe4
	.xword	0x49e6d40f10523ea8
	.xword	0x77c06fe476ab6d07
	.xword	0x1e2294b56a74d8ca
	.xword	0xd9b3d421266078ca
	.xword	0x64601171c58da3b1
	.xword	0x8871d778f3ed7dd7
	.xword	0xd482f0256fff5bd1
	.xword	0x75106e2fb8ff824a
	.xword	0x77c2406acbad894a
	.xword	0x5a19f3e4b2c9195e
	.xword	0x815850964d5cbc40
	.xword	0xb7d46505550d4a63
	.xword	0x49275fa5cf26b7d3
	.xword	0x1ecf2d4182cc6911
	.xword	0xeb952a811d88e138
	.xword	0x4c0814375bff9bb5
	.xword	0xea6196b7f002b880
	.xword	0x9177b943cdf08be9
	.xword	0x7f4b5bd8ab38888f
	.xword	0x0429eeed49c00c5c
	.xword	0x751d4329709bc9bf
	.xword	0xefd2dbb7b6dde7f7
	.xword	0x61cb212cedfdbdd7
	.xword	0x0acb49ac1a54106c
	.xword	0x7c5f6ae7ce8c7dea
	.xword	0x5df738661f1bf052
	.xword	0x015ab95fe883beb7
	.xword	0x0d926e93e84c8d7b
	.xword	0xaa9142abb023dc0a
	.xword	0x3702f5e945650f91
	.xword	0x82d988c6494e59fb
	.xword	0xc3a2e9a135741e32
	.xword	0xeeb45f0831c9a9dc
	.xword	0x48c10c22bdaea629
	.xword	0xf7aefc8b185e51c1
	.xword	0x7c26cc266c9f89fe
	.xword	0xfd44390d79188c0c
	.xword	0x8b90f4c148933ef9
	.xword	0x1096bf49879d7ca8
	.xword	0xa30c40d5bc6fa2d9
	.xword	0x4dd4e17b0df01e53
	.xword	0x55e52d061ecf4995
	.xword	0xc782e1b323c37f52
	.xword	0x2c9c93e76dfff1b0
	.xword	0xcb55bb6bd46348c3
	.xword	0xe91aec0070ae6791
	.xword	0xd7840f06fc6ebb56
	.xword	0x58a0754cdda86dca
	.xword	0x1aa3a9b7a8d5ce83
	.xword	0xd6becdac8f61e640
	.xword	0x425d60ce3361508a
	.xword	0xa201a544b4bd6da7
	.xword	0x5559954373d5bb84
	.xword	0x70450a178a0786d4
	.xword	0xcf1f5f89c8f64647
	.xword	0x5eadbca15586d46f
	.xword	0x6fe768001f2172c3
	.xword	0xfe5d3674f2d1b352
	.xword	0xfbcd148035c8fd31
	.xword	0x8200ff7565643a42
	.xword	0x8bcf1c8f2b0546fd
	.xword	0x1fd782dc104efae9
	.xword	0x72d2f534d86c8cd3
	.xword	0x21cacb9518bdad23
	.xword	0xc8d5ab43896fcc58
	.xword	0xeb7c18be3dd1d8cb
	.xword	0x3ef0680c1edaf916
	.xword	0x6bbd01f2870d6c55
	.xword	0xfcd8323db0bc9e68
	.xword	0x9cde969938fec43b
	.xword	0xfcd17ed343e667ea
	.xword	0xb772c8ffb7884460
	.xword	0x280dba99dec74f56
	.xword	0x229ab3bc52fde273
	.xword	0x4dd22afc1bc5e927
	.xword	0x3c6147139978b147
	.xword	0x19a953455390c917
	.xword	0x1e2d588fdcc10f31
	.xword	0x008d3edf38b2cce6
	.xword	0xe368cd86afc1a524
	.xword	0xfd90572e8d9196a2
	.xword	0xc78d6f8fae224002
	.xword	0x1c09b062933e5a15
	.xword	0xcd2941801158f5b9
	.xword	0x6d75fe075a8d4ff1
	.xword	0xddbec5b4582fc338
	.xword	0x25dd6eb14ad60b45
	.xword	0x832e8902649394c2
	.xword	0xf70e3e20eea2ad77
	.xword	0xb3fc31a94b467ec6
	.xword	0x6fc72065b9719f87
	.xword	0x98df78a1da4620a1
	.xword	0x64d05aa2835f76cb
	.xword	0x7063f3918948f1fd
	.xword	0x61e73cec7b65f513
	.xword	0x9a179c1a407b0e9b
	.xword	0x091cc5adf85d4726
	.xword	0x324b5d0c96f4154d
	.xword	0x8b50ae6457cae845
	.xword	0x366d2c073b41436b
	.xword	0x42237c8735bc7203
	.xword	0x29c411621808d69d
	.xword	0x2e00d029a3649ad7
	.xword	0x6c1b0967240ba09f
	.xword	0xaa2dc3414e074345
	.xword	0xa6bc841924639266
	.xword	0xf02065947ab09330
	.xword	0x95bec04aad73de83
	.xword	0x02a6389c088e7a46
	.xword	0xa3951a379edd9869
	.xword	0x18f0872dfa30b000
	.xword	0xbca1046ffe047065
	.xword	0x834621b31f418d89
	.xword	0xac2c63d109ac9e1a
	.xword	0xfb6b817c3e9f06de
	.xword	0x095fe9ee4835ba86
	.xword	0xa0d37f6822a465f5
	.xword	0x721b3688826ca557
	.xword	0xa865d84f6051d263
	.xword	0x78a25b6d6dcc83eb
	.xword	0x672bf451cf4c8b00
	.xword	0x4825497b7f652497
	.xword	0xe208e4097086de62
	.xword	0x962699e7ae197e7e



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
	.xword	0xeac65946f1e2efc6
	.xword	0xce8f1c5882737033
	.xword	0xd8ba2b448476a174
	.xword	0xb8669a3f695a5610
	.xword	0x96f0e06826852805
	.xword	0xee10c3e2dd382b5a
	.xword	0xdc32574ec3c5d2f5
	.xword	0x5521f831314be1ec
	.xword	0xb3fa3a3c55866ef9
	.xword	0x42ea5b0828862667
	.xword	0x9f15d6673d07221a
	.xword	0xbf9aedd8da8df92e
	.xword	0xfaea259915587271
	.xword	0xf3859f8306e7a4cf
	.xword	0xc40e15b141b55fc6
	.xword	0x142575beffb38716
	.xword	0xaaa797d82c556a27
	.xword	0xeff66cfceac3beba
	.xword	0xe42182a50c451398
	.xword	0xda9b0f6bdbcb2754
	.xword	0x71fcb8cef60d52ac
	.xword	0x569baefc29d9c045
	.xword	0x708670bbb7abdcfa
	.xword	0x2a14096871fc74d7
	.xword	0x3b55e9aa20dabf81
	.xword	0x9d2f7dcca13c09eb
	.xword	0xa1bf59456ee1094b
	.xword	0xf097b9f6b8a9780c
	.xword	0x07fdbcc0c5984498
	.xword	0xb118bbd25c2222de
	.xword	0xf85ad732c3fcc6f1
	.xword	0x6c81100c28324c67
	.xword	0xd4c00705ac25b62a
	.xword	0x589e82680464f8db
	.xword	0x648f522f462ef731
	.xword	0x0c8a379ecdae0c5b
	.xword	0x6d81860587c5f7e7
	.xword	0xcbf53627c86b4fc6
	.xword	0xa19a03dfded1dafd
	.xword	0x91ad69e4f2feb124
	.xword	0xcdf54dad342c15c8
	.xword	0x65e375de140acd35
	.xword	0x4fff5ae9c8ff31e3
	.xword	0x4b362339b71e9091
	.xword	0x27ff092d04d50648
	.xword	0x7d87a21738678427
	.xword	0xe99cea675957eb07
	.xword	0x2430a697756d495b
	.xword	0x094c26186e23eeb7
	.xword	0x29a0599efdcd870d
	.xword	0x8a33d02f3fbc84ee
	.xword	0xf1db2ecaf42307ab
	.xword	0xdd0aeef7f3626a9b
	.xword	0x02ce5a334cb57a1d
	.xword	0xe9b909035cf54652
	.xword	0xcf6d1038da290f5f
	.xword	0x64c92604033be5e8
	.xword	0xd8e97c2ed6bc5a2a
	.xword	0x824be3f12be04091
	.xword	0xd6a9f53884227db1
	.xword	0x7598d5375f1bccdc
	.xword	0x571024d668a4ac5d
	.xword	0x104048fcf36caa42
	.xword	0x1a0c171816ef1515
	.xword	0x3583922305eea326
	.xword	0x4ae61c54bdf7dbf4
	.xword	0xf6ee77802eda052e
	.xword	0xdc875de9170e2f09
	.xword	0xfd788cb52c63bc56
	.xword	0x32ef4ea70f85872b
	.xword	0x84925d6e62577513
	.xword	0x4544cc91e15d11c4
	.xword	0xd1f127dc1d1b0bc5
	.xword	0x666121243130ee68
	.xword	0x000333978e087e4b
	.xword	0x90ecfc774a78d6af
	.xword	0xa66eedd38bf3fffb
	.xword	0xfbf9338612f5396b
	.xword	0xd35140ae122a1d62
	.xword	0x7c9d305e4aa269bb
	.xword	0xbaf500ccd5dd9a53
	.xword	0x774c67c98c7fb33f
	.xword	0x8eb0714a4a6edd78
	.xword	0xb69c69624fff335b
	.xword	0x19da4387eed4774f
	.xword	0x7d80ef424cc3d497
	.xword	0x24e3540d56d833ee
	.xword	0x55cac40388a1ce60
	.xword	0xd40af6ab1b51440d
	.xword	0x515395c816b84133
	.xword	0x03dd96977714abd8
	.xword	0xaee49967bcd074aa
	.xword	0xd30d4dd16bdd1777
	.xword	0x2edfa4d15e09ab0d
	.xword	0xef932a0f779ad914
	.xword	0xd312b142094d4888
	.xword	0xe33b09466dbae286
	.xword	0x1d40d43c3ad1d25e
	.xword	0x937525ddc711428b
	.xword	0xbb0e5f7018de369b
	.xword	0xcc3c6f9ac6977909
	.xword	0xcf508cb364a2a8d1
	.xword	0x402d6e717728129c
	.xword	0xfab3f48ea54ed59d
	.xword	0x6a2eb4c927669c2a
	.xword	0x40bde9123997edbd
	.xword	0x6d58d8dd3fed52fd
	.xword	0x4bc7c454a57dc600
	.xword	0x4a54a5957dc91dc3
	.xword	0x17eb74f7fba559d8
	.xword	0xca70e87416407ee0
	.xword	0xd298218403582d3a
	.xword	0xa497e4d9660a6eea
	.xword	0x199877d42704ea8a
	.xword	0xb49cf1ddad387945
	.xword	0xda3d6c64c2f3bef3
	.xword	0x9251efd7879b51d8
	.xword	0x418f15bb6b0bc70a
	.xword	0x19e53e50865a9a36
	.xword	0x472904bdc4ceb2c3
	.xword	0x3130c61d64798e5f
	.xword	0xe56e6aa856b4b897
	.xword	0xd005e188df94c88e
	.xword	0xa859b1d1415addb7
	.xword	0xbd4d9be99b90e4c0
	.xword	0xa9d05933bf36cd14
	.xword	0xd39ede7b46fac7db
	.xword	0x5d8d6f18df3ee8e8
	.xword	0x752a2ac705ba285c
	.xword	0xda2e1403bf117622
	.xword	0xa93947f381501249
	.xword	0xe5d38973d2f69617
	.xword	0x150b4f8bc23f3fd9
	.xword	0xdd4635fe0c998a3a
	.xword	0xfd29ec023ae03204
	.xword	0x948ff944e3dac923
	.xword	0xe2180b3147f17937
	.xword	0xa2fc9b741c238bd3
	.xword	0x75dcf05688ea8f7e
	.xword	0x23397ad303d2e240
	.xword	0x421c6709a48e9e51
	.xword	0x50379e3469525517
	.xword	0xd0ee7ae46edd070b
	.xword	0x1d07ddec2a1861b0
	.xword	0x27d7cf70202340e9
	.xword	0xd57f9bff097d26c3
	.xword	0xe41fa30bcd43ddec
	.xword	0xe9f5d0f644aee02c
	.xword	0x626e7b77ae854401
	.xword	0xf65ad22beef4a6a1
	.xword	0x9d5ef479f33a93cb
	.xword	0x5758a3cc70994e1b
	.xword	0xb95d0bba8c2ce449
	.xword	0x36bae51a0716ae57
	.xword	0xbe806d7b4df1cf96
	.xword	0x8baa0dd7d88aecd5
	.xword	0x77d2cf4ccc931970
	.xword	0xb6b27b90be9f76d1
	.xword	0x3dd569cb3c8a39b2
	.xword	0x83a7757973e13094
	.xword	0x2cca4a757c2dead3
	.xword	0x7c43c5f0e81982e0
	.xword	0x0be538be57fd4374
	.xword	0xe8e151f6facf5ada
	.xword	0x30db44dd0683d76d
	.xword	0x3df4cac804055cbc
	.xword	0x12df87e7bf797313
	.xword	0xacc222f4e36e81a5
	.xword	0x3024147b71a13ed5
	.xword	0xa984c833eb5b45af
	.xword	0x3b762b29ecad4345
	.xword	0xfcd894575c7f8e05
	.xword	0x324e9d76c450d855
	.xword	0x461e6c42814a2e89
	.xword	0x3a75235ec5c5ca80
	.xword	0x351c0295287c7641
	.xword	0x57d387680b41c5b8
	.xword	0x23c10d4ca3f73458
	.xword	0x3304427d62682cb8
	.xword	0x244aa4043ca49091
	.xword	0xe03d66f97ce03399
	.xword	0xe7867e637c8dcd6c
	.xword	0x173d50e9b90a87f0
	.xword	0x00c50e2b16d60462
	.xword	0x9139d1befa86d805
	.xword	0xd1776cf881018ca7
	.xword	0x148579c018443d4c
	.xword	0x547e4ccf8036c9c2
	.xword	0x96beb3f77b3db2f3
	.xword	0xddc9aa7fedb441d1
	.xword	0xa283d2a89a7bf8e5
	.xword	0x7ed973245eae28d9
	.xword	0x9d64b30298628acf
	.xword	0xd18b9ff98b1667bc
	.xword	0xa2cfe7b5696a81e9
	.xword	0xce79be260eeea4ee
	.xword	0x20a025e11e0b18ce
	.xword	0xd3dc94d3c43a9868
	.xword	0xf3fd532a0da02137
	.xword	0x5ef5368a531fc381
	.xword	0xc8d533d333b67f2b
	.xword	0x7f825cdf51eab450
	.xword	0x3ce63299eedaa6ad
	.xword	0xadc1c7d593c29461
	.xword	0xfe6bde41319aa17d
	.xword	0x9ce126450094dfd3
	.xword	0x3cd20c4482f35aa8
	.xword	0x2b69bea2be0dab37
	.xword	0x35b19742cb5949d8
	.xword	0xe5932fffd11963cb
	.xword	0x87895fa28615d602
	.xword	0xf473fdb3dbfc095d
	.xword	0x78bf24b9458f7a8b
	.xword	0x18a3feb2b0aca2f9
	.xword	0x3044f2e01cd00817
	.xword	0x8094982125ec9f31
	.xword	0xc6011c64f8a03c58
	.xword	0x47158e799270896e
	.xword	0xb4a86f752e1005d7
	.xword	0xb5815a9e6a35c4d7
	.xword	0xdf47ae26b9cd9364
	.xword	0xfd9d30baac888fc2
	.xword	0x5dc00c7416a28012
	.xword	0x0486a66c4c38017d
	.xword	0x3b1f90daf49f3d21
	.xword	0xf2a59996480e739d
	.xword	0x05c5e454b73d55b5
	.xword	0x25b34a2b1cd17c9e
	.xword	0x68ce17cc2edf81ef
	.xword	0x83fb4ee1028979d0
	.xword	0x6a7c9ed92515fa8f
	.xword	0x059abf4ea445f320
	.xword	0x82c0c749c9001b44
	.xword	0x6cb44ea3c2e3268e
	.xword	0xd3450392399784f5
	.xword	0x696be917d88522e0
	.xword	0xa4a64b6961a0827b
	.xword	0x952261e90fb2c742
	.xword	0x141c864901d2cd9b
	.xword	0xf862707cf9e9b4e4
	.xword	0x41d65338d0ca42ac
	.xword	0x43110bada83af8bb
	.xword	0x8053c2414cd1e089
	.xword	0x2d700a6c03ef2961
	.xword	0x9dafe3be9f1cf762
	.xword	0x5f308dd5dd633752
	.xword	0xbba3bdde9780554f
	.xword	0x08b2d287c3b2b8a0
	.xword	0x11e6fe6b31fd9eee
	.xword	0x7570b6653a5fac50
	.xword	0x1843a88601589649
	.xword	0x1485b0a5582d58a9
	.xword	0x70066fe0c4ba4aa8
	.xword	0xab5fe324c4b98e7c
	.xword	0x12bf587410c00a68
	.xword	0x486efdf5cdd0d58c



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
	.xword	0x80cee5f87efa0d67
	.xword	0x6ecdbfe17271a90b
	.xword	0xfa924d2e83304922
	.xword	0x8b119d964c03bc42
	.xword	0x52a1b3c6c9aa5c4c
	.xword	0x59b7fc75693625b5
	.xword	0xa9cdeb92857e04ed
	.xword	0x599231af86f41afc
	.xword	0x58a10810e7c35458
	.xword	0x453331ce1108d4b6
	.xword	0x9150e9218f98a0be
	.xword	0x3715743f07b02232
	.xword	0x5fc98fff7c5b0cbb
	.xword	0xf2845e741e98f07e
	.xword	0x1249a99a8591638d
	.xword	0x53fbe41e22bcdd0c
	.xword	0x37d549dc0ad8a26b
	.xword	0x4a8f559eac6416b8
	.xword	0x6735112a8cf86bc7
	.xword	0x929b9d633e86ab69
	.xword	0x54bece72a5ef8361
	.xword	0x1183d0d14080cb45
	.xword	0xa418229fe4de7bb1
	.xword	0xac19c8373f17ca28
	.xword	0xc747806f36a03db8
	.xword	0xfc5de485a0142842
	.xword	0xe16f8e53b16c3f7f
	.xword	0xbeec6464d356e663
	.xword	0xbf351ae799ef2571
	.xword	0x0309cbfb507de370
	.xword	0xb960d77a4944e195
	.xword	0xeb9ddd96dd9c5acb
	.xword	0x551d864788dfe4ea
	.xword	0x0944bea749c4090e
	.xword	0xf5a035f87c1227a4
	.xword	0x58a5af39e74678b0
	.xword	0xf03b47a7d7ec07a2
	.xword	0x6a0698fe9d904eac
	.xword	0x6f9dfca9ddc95f2b
	.xword	0xe897b9323f2ea05e
	.xword	0x1f5629ee77c9077e
	.xword	0x97172ecd42cc88f6
	.xword	0xa3dbf0fc215a9b08
	.xword	0x3feda2c8ca76a9bd
	.xword	0x62b3ceebf4fed594
	.xword	0xfad9b202ac8b8e8d
	.xword	0x70f414cfa7eaede4
	.xword	0xd813e4f9a8f89955
	.xword	0xb13cb3c859e426de
	.xword	0x4f33e282c2159223
	.xword	0xb86db50b26b9fc15
	.xword	0xa388411d3449a79f
	.xword	0x1c39418660de3211
	.xword	0xda692628d8309c1a
	.xword	0x207e70af46c913ee
	.xword	0x9ee7ea48035cf5f1
	.xword	0x1c535a116a23bc45
	.xword	0xe58e775a66b725ac
	.xword	0xe835e34dc5a035c6
	.xword	0x8f84520d589179a5
	.xword	0x1dcf525af378d660
	.xword	0xc6b5d20eb2902843
	.xword	0x924d4cff9a8bc93c
	.xword	0x925147484f3a37da
	.xword	0x390115138909cade
	.xword	0x31db5e5634b4e73e
	.xword	0xbbc146c203843552
	.xword	0x88b12e92aae15f41
	.xword	0xb4004af535a7576e
	.xword	0xc2d34354c6658094
	.xword	0xc242d86d72225228
	.xword	0x414c8dacdecc068a
	.xword	0xa43228938bbe0cb2
	.xword	0xce5c134eb0f14d08
	.xword	0xd3d9468731c5b587
	.xword	0x720ff7446ae462a0
	.xword	0x033f685e729b136e
	.xword	0xacf9cc0f7a03962b
	.xword	0x73b9bd3a0791913b
	.xword	0x02b39769e4845f64
	.xword	0xa6e049d2f4ba3774
	.xword	0xa8fe4059147f9fb6
	.xword	0xab708593f7638e85
	.xword	0x6a87f7889c647faf
	.xword	0x7a0e14615a7c558a
	.xword	0xbfb2df32b8ff2417
	.xword	0x7a126d0ea9d51e71
	.xword	0x31b50e19e47f476a
	.xword	0x17e7e1094c1b3d21
	.xword	0xd4c02c89672472c1
	.xword	0x554e0fc2bc5cfe5f
	.xword	0x1b8577b667f8e47d
	.xword	0x0a19f5d5ca325907
	.xword	0x9cd79e486ef22e0a
	.xword	0x7d63f736f51d88ad
	.xword	0xecbcf7ff2dbcb5ed
	.xword	0xe8aa4048c810c0bd
	.xword	0x1032c6eea98d81be
	.xword	0x48dc985a3240757d
	.xword	0x0f348af7b02a15df
	.xword	0xff5c2070b4362ce4
	.xword	0xd4cb55933ccd0e45
	.xword	0x6a934db91dbb79f0
	.xword	0xef1fb8988fa0df3a
	.xword	0x4d408b377f77a5b5
	.xword	0x15e5ade7215d2bd4
	.xword	0xd6c594cd85110287
	.xword	0x6904eaa23cf7a35e
	.xword	0x9a06ae344a6e28c8
	.xword	0xeb1d0f4a4b6c3f4b
	.xword	0x7f0294c46953225d
	.xword	0x3ed5f55a4ffe940d
	.xword	0x0fdb5ff5fbcf016c
	.xword	0x4ae48eb17566555b
	.xword	0x0630bb6fd2e87e25
	.xword	0xb291e19ebedfa40b
	.xword	0x28955bae4ff69b6d
	.xword	0x11ced4543b9ae3b5
	.xword	0xa0e3206764e207c9
	.xword	0x69f33ee87ac942b7
	.xword	0x1ff4336a270baf54
	.xword	0xf98ac9fa17e1c2d0
	.xword	0x8703dbc0423067ce
	.xword	0x425a967adffecad8
	.xword	0x575c44bef4229ad4
	.xword	0x7956fe89ea362811
	.xword	0xa14a510a2b6ded50
	.xword	0x606cf69e1c771e0a
	.xword	0x0e70c917b5973d80
	.xword	0x346f2c4d223a940b
	.xword	0x93db91b5c7b70f23
	.xword	0x3182ce2fa0d27489
	.xword	0xb23ab33317f01b5a
	.xword	0x81450fbfdf30190f
	.xword	0x9c770061aaf4c422
	.xword	0x6186240efba2d7a7
	.xword	0xfea3d01a8bddb559
	.xword	0xe513e935b0f23c58
	.xword	0xa49022d8c59769b5
	.xword	0xea9b7c81f9ccbcf4
	.xword	0x5a1733e43c1114f9
	.xword	0xff6dbf87f1c54c6f
	.xword	0xcf9b3652ba7ffff7
	.xword	0xb8615365c88a619f
	.xword	0xc4d38e6889bf0536
	.xword	0xe048b679291cfa84
	.xword	0xc98213efe7dbfc2c
	.xword	0x4421f2c096aa425a
	.xword	0xef7bc7c3dd3e9b46
	.xword	0x6a37f4844405df1b
	.xword	0x4528bd80d00f3b3d
	.xword	0x89902e57c60069b4
	.xword	0x3b9a183b00b92866
	.xword	0x75b0268219488d56
	.xword	0x6d2f1f714ea96cb8
	.xword	0x79d9562edd1ffc77
	.xword	0x4f7de940bf05d724
	.xword	0x2dffaa48257d4bce
	.xword	0x2ff355228ca698ba
	.xword	0xa7ee2e9b997da531
	.xword	0x8db4d9ff8c0e1240
	.xword	0xc5e5424c98295cfe
	.xword	0x686b5f2212e9d3f5
	.xword	0x6b7daa83d52ff255
	.xword	0xb21f0982337f39fb
	.xword	0x7d636acce8ab2068
	.xword	0xa17423996f2e89fb
	.xword	0xfde01fabd90c13af
	.xword	0x791403fca9cf86ad
	.xword	0x2af44fbac56a4409
	.xword	0xde1cbf50d7707998
	.xword	0x4da5fada079cd5ee
	.xword	0x059a5f8ebcba47a3
	.xword	0xba6b4193af655eff
	.xword	0x515207bd10a4bb4c
	.xword	0x3faf36001696affe
	.xword	0x3264a49636bc9150
	.xword	0x79df9df5eccc1b16
	.xword	0x51e9ff607f98f474
	.xword	0xb6598203bcfffdcd
	.xword	0x189fef16e710766c
	.xword	0x4b1b5b18fb21cb97
	.xword	0x358893fed1d38217
	.xword	0x9d914b7bfc220194
	.xword	0xc3da8a0393ea41a1
	.xword	0x4678a9cd8606c02b
	.xword	0xd322f9fef8aee18d
	.xword	0x05d9f11598c3f9e5
	.xword	0xa91037988f74b883
	.xword	0x6e22d658773c4f13
	.xword	0xd9274c88624fae0b
	.xword	0x57f0f7e46c44bf9c
	.xword	0x767562e07662e784
	.xword	0xdf7e054a5738f6ad
	.xword	0x8c9ee11ff680c234
	.xword	0xa8176326ca38e5dd
	.xword	0x1867cf6a9aea8625
	.xword	0x623630607a32477c
	.xword	0x2cdc5fe81dcdbee9
	.xword	0xfff431fc988aba11
	.xword	0x13259192d7d5088d
	.xword	0xaf42d6229bd543ab
	.xword	0x7cc8eed6dded8d60
	.xword	0xdf180e6812a2347d
	.xword	0xcf73d3fb0aedbcef
	.xword	0xac5e30ffc50a734d
	.xword	0x93ad6156ef2cc3cf
	.xword	0xd168b73eafe76948
	.xword	0x30ac7ca85d8c9dc2
	.xword	0x911cb194285df45b
	.xword	0x89e5570623567565
	.xword	0x2a3bbc8cb7000b23
	.xword	0x11470c478f997f8a
	.xword	0x08c211d81440a244
	.xword	0xa18d0bba732b0be5
	.xword	0x87514afd651e5c38
	.xword	0x0419e555e46b3558
	.xword	0x4ba98c34a7af929e
	.xword	0x471a946a4ea5beaa
	.xword	0x7f43ea8dca36c29d
	.xword	0x4dc929a999102a91
	.xword	0xdd42d18665d90d60
	.xword	0x1c6ef06aca62d369
	.xword	0xfbeb20b804a8151f
	.xword	0xcbbf1a4c683ad75b
	.xword	0xa293ea5d65164bbb
	.xword	0x19c4223194e45431
	.xword	0x3f23b1ea8cd07ee2
	.xword	0xf4ddfd1b6d0a17bf
	.xword	0xb84166aa6fc9fd9f
	.xword	0x8837d362d9331319
	.xword	0xecbff5da4b288dd4
	.xword	0x22e19c4b80a5918b
	.xword	0xc0167b20930ad415
	.xword	0x6ecc99b885df7b29
	.xword	0xbc4476fe9d3a4548
	.xword	0xc62f86d3c1b48062
	.xword	0x0d289a819b93b979
	.xword	0xe079be104939b4fb
	.xword	0x1e7c01cf9d0342b6
	.xword	0x0699cdab2f5a6229
	.xword	0x1a816941be2bec34
	.xword	0x4dea253cf13d5f7b
	.xword	0x15ee00a3c348a177
	.xword	0xb6dd9162041d3f8b
	.xword	0xcdb8e1b7c5e3d054
	.xword	0xeef841e2b9da625d
	.xword	0xdddabc48cb1520b8
	.xword	0xb9895cb4acf70c0f
	.xword	0x7ae617e9c9428f61
	.xword	0x8cf692552ef3a441
	.xword	0xc2b9ce48e93f8675
	.xword	0x9949fd57affa97dd
	.xword	0x70e0952bd1eafd31
	.xword	0x7f039ec2256cfd48
	.xword	0x01603457f5d1569a



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
!!# #define NCDATA0	2
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
!!#   IJ_set_rvar ("diag.j", 105, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 106, Rv_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_rvar ("diag.j", 107, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 111, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 120, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 129, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 130, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 133, Rv_memaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 0001 0000 rrrr 0000 0001,"
!!#         "20'{0}");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 144, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   ! Since we are doing it in the user area, and .1000 are 
!!#   ! init to zeros 
!!#   ! the address is : 0xd01ee000
!!#   IJ_set_rvar ("diag.j", 156, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0001,"
!!#         "20'b 1110 1111 0000 00rr r000,");
!!#          ! init only till 7fff 
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
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 230, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 238, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 246, ijdefault, Ft_Rs1, "{6}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 247, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 248, ijdefault, Ft_Rd, "{16..23}");
!!#   IJ_set_ropr_fld    ("diag.j", 249, Rv_ldstD, Ft_Rd, "{16,18,20,22}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 252, ijdefault, Ft_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_ropr_fld    ("diag.j", 253, ijdefault, Ft_Imm_Asi, "{0}");
!!# 
!!#   IJ_bind_thread_group("diag.j", 255, th_M, 0x1);
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 257, th_M, 3, 1, Rv_rand64);
!!#   IJ_printf ("diag.j", 258, th_M, "\tmov\t0, %%r8\n");
!!# 
!!#   IJ_printf ("diag.j", 262, th_M, "\tta\t0x30\n");
!!#   IJ_printf ("diag.j", 263, th_M, "\tmov\t0,\%%g4 \n");
!!#   IJ_printf ("diag.j", 264, th_M, "\tsetx\tncdata_base0, %%g1, %%g2 \n");        
!!#   IJ_printf ("diag.j", 265, th_M, "\tsetx\t0x1000, %%g1, %%g3 \n");               
!!#   IJ_printf ("diag.j", 266, th_M, "\tadd\t\%%g2, \%%g3, \%%g3 \n");
!!# 
!!#   IJ_printf ("diag.j", 268, th_M, "\t!\tnitalize \n");
!!#   IJ_printf ("diag.j", 269, th_M, "\tadd 0x0, %%g0, %%g4 \n");
!!#   IJ_printf ("diag.j", 270, th_M, "\tadd 0x0, %%g0, %%g2 \n");
!!#   IJ_printf ("diag.j", 271, th_M, "\tadd 0x00f, %%g0, %%g5 \n");
!!#   IJ_printf ("diag.j", 272, th_M, "\tstloop0: \n");
!!#   IJ_printf ("diag.j", 273, th_M, "\tstx %%g2, [%%g3 + %%g4] \n");
!!#   IJ_printf ("diag.j", 274, th_M, "\tinc %%g2 \n");
!!#   IJ_printf ("diag.j", 275, th_M, "\tadd 0x8, %%g4, %%g4 \n");
!!#   IJ_printf ("diag.j", 276, th_M, "\tdeccc %%g5 \n");
!!#   IJ_printf ("diag.j", 277, th_M, "\tbne stloop0 \n");
!!#   IJ_printf ("diag.j", 278, th_M, "\tnop \n");
!!# 
!!#   IJ_bind_thread_group("diag.j", 280, th_all, 0x000000ff); ! 2 cores 2 threads
!!#   IJ_th_fork_group("diag.j", 281, th_all);
!!# 
!!#   IJ_bind_file_group("diag.j", 284, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 285, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_printf ("diag.j", 289, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 290, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 291, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 293, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 295, sjm_4, "#==================================================\n");
!!# 
!!#   IJ_printf ("diag.j", 297, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 298, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 299, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 300, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 302, sjm_5, "#==================================================\n");
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
!!# 
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 335,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 337,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 342,Seq_Start, NULL, 2);
!!#   IJ_th_join_group("diag.j", 343, th_all);
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
!!# 		IJ_generate ("diag.j", 519, th_all, $2);
!!# 	}
!!# ;
!!# 
!!# !inst_type: set_addr load alu store 
!!# inst_type: set_addr load alu store sjm4 sjm5
!!# !inst_type: set_addr load atomics alu store atomics_asi barier
!!# {
!!# 		IJ_generate ("diag.j", 527, th_all, $2);
!!# 		IJ_generate ("diag.j", 528, th_all, $3);
!!# 		IJ_generate ("diag.j", 529, th_all, $4);
!!# 		!IJ_generate (th_all, $5);
!!# 		!IJ_generate (th_all, $6);
!!# 		!IJ_generate (th_all, $7);
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
!!#                    IJ_printf ("diag.j", 547, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 550, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 552, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 553, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 557, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 558, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 559, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 560, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 562, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 563, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 576, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 581, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 585, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 586, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 588, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 589, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 603, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 607, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 608, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 625, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 630, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 631, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 633, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 634, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 636, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 637, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 642, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 643, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 645, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 646, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 663, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 666, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 668, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 669, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 673, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 674, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 675, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 676, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 678, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 679, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 692, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 697, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 701, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 702, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 704, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 705, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 720, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 723, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 725, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 726, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 741, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 744, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 745, Rv_rand32);
!!#                          IJ_printf ("diag.j", 746, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 751, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 753, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 767, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 773, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 777, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 792, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 794, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 796, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 802, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 803, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 830, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 836, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 837, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 840, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 842, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 851, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 853, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 871, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 877, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 882, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 884, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 902, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 905, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 907, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 908, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 911, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 912, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 913, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 914, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 916, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 917, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 930, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 935, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 939, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 940, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 942, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 943, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 957, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 961, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 962, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 979, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 984, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 985, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 987, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 988, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 990, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 991, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 996, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 997, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 999, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1000, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1017, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1020, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1022, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1023, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1027, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1028, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1029, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1030, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1032, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1033, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1046, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1051, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1055, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1056, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1058, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1059, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1075, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1078, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1080, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1081, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1096, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1099, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1100, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1101, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1106, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1108, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1122, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1128, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1132, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1146, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1148, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1150, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1156, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1157, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1184, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1190, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1191, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1194, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1196, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1205, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1207, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1225, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1231, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1236, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1238, sjm_5, "\n");
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
!!# set_addr:  set_memaddr
!!# ;
!!# 
!!# set_memaddr: mSET_MEMADDR
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
!!#                       IJ_printf ("diag.j", 1280, th_all, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern1);
!!#                 }
!!# ;
!!# 
!!# load: gLOAD  %ropr  Rv_ldstD 
!!# ;
!!# 
!!# store: gSTORE  %ropr  Rv_ldstD
!!# ;
!!# 
!!# alu: gALU 
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
