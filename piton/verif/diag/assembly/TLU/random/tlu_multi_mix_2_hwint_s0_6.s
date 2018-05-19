// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_6.s
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
   random seed:	913513183
   Jal tlu_multi_mix_2_hwint.j:	
********************************************************************************/



#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "my_intr_handlers.s"
#include "my_trap_handlers.s"
#include "tlu_custom_trap_handlers.s"

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:

! Register init code

	setx 0xbf074ac9adae641a, %g1, %g0
	setx 0x87606587e76f0cbc, %g1, %g1
	setx 0x6a469585a9411f8b, %g1, %g2
	setx 0xee68f7801a94e9c3, %g1, %g3
	setx 0x53c0c71fc933880e, %g1, %g4
	setx 0x34863751c184e77d, %g1, %g5
	setx 0xef527eee140b14cd, %g1, %g6
	setx 0x6b0090c64562ed5e, %g1, %g7
	setx 0x5088e2b748033f12, %g1, %r16
	setx 0x396db4b103ab1c4d, %g1, %r17
	setx 0x84782c9ce69f3962, %g1, %r18
	setx 0x995d0130a03d0bd9, %g1, %r19
	setx 0x4bfab7171e00f2e9, %g1, %r20
	setx 0xf86d896632e150aa, %g1, %r21
	setx 0x327909bbb3b98bc0, %g1, %r22
	setx 0xed3c80af5e35901a, %g1, %r23
	setx 0x17a8e1568e618851, %g1, %r24
	setx 0x0712e4e63bb56a9b, %g1, %r25
	setx 0xc47954201fb6f825, %g1, %r26
	setx 0xc5026ba82ea101fd, %g1, %r27
	setx 0x94d21b3d2a7c8ad0, %g1, %r28
	setx 0x9db9f40eed5af772, %g1, %r29
	setx 0x3392ad4bd174bef6, %g1, %r30
	setx 0x6dba71a2d6d041c3, %g1, %r31
	save
	setx 0x83671ba14f2289f1, %g1, %r16
	setx 0xad65c6ff3f7830db, %g1, %r17
	setx 0xf8a6cc89e8cc964e, %g1, %r18
	setx 0x8e0abff35200c46c, %g1, %r19
	setx 0x0b591214d074815e, %g1, %r20
	setx 0x84017b2c02bf2a60, %g1, %r21
	setx 0xa82dd9844f9373a8, %g1, %r22
	setx 0x2578f5010702d23a, %g1, %r23
	setx 0xc8fb13e98cef3026, %g1, %r24
	setx 0xc93124422f39aaec, %g1, %r25
	setx 0x6262d72b43f2e375, %g1, %r26
	setx 0x8432f8a92f2f951b, %g1, %r27
	setx 0x01173fdb6c3b9f4a, %g1, %r28
	setx 0xf3961a00b3e9717c, %g1, %r29
	setx 0x623e840f5dafac29, %g1, %r30
	setx 0x3d559d032b0079b5, %g1, %r31
	save
	setx 0xe8c4b0c888a8533f, %g1, %r16
	setx 0x235455ea10c6d0ad, %g1, %r17
	setx 0xf68e649e15f98c53, %g1, %r18
	setx 0xb9b809b34270c39e, %g1, %r19
	setx 0xd85bb8fd3d480f97, %g1, %r20
	setx 0x58e2bc5a7857e7fc, %g1, %r21
	setx 0xedde96bf80c07e37, %g1, %r22
	setx 0x63fee71fc04ff989, %g1, %r23
	setx 0x9695df8ad3bedb98, %g1, %r24
	setx 0xb8b3c42dd66c2bcf, %g1, %r25
	setx 0x3d43d5fa067c5731, %g1, %r26
	setx 0x30fb16ab18256d0f, %g1, %r27
	setx 0x48eb62020cd59fbf, %g1, %r28
	setx 0xfe636604f2fbe7f6, %g1, %r29
	setx 0xf63bfd3eec7558c5, %g1, %r30
	setx 0x8e298bd17fd7d671, %g1, %r31
	save
	setx 0xfdf45ce6a96cd9f9, %g1, %r16
	setx 0x0f475a65603daf97, %g1, %r17
	setx 0x60911d8e6d5fb1c4, %g1, %r18
	setx 0x8dd8fd94c5ed2198, %g1, %r19
	setx 0x376b60277cac5dfc, %g1, %r20
	setx 0xa1748b96c327a322, %g1, %r21
	setx 0x842496affb9c33db, %g1, %r22
	setx 0xc646aa2814db60b1, %g1, %r23
	setx 0xeecf023cfee1ae34, %g1, %r24
	setx 0xae385bba29dffa01, %g1, %r25
	setx 0x56fdf6f1e93a4c7c, %g1, %r26
	setx 0xaf9283815e7c4c4c, %g1, %r27
	setx 0xfff61cf0c83b5c18, %g1, %r28
	setx 0x79eb02bdf296db5f, %g1, %r29
	setx 0x64e8c0ab57ce35d5, %g1, %r30
	setx 0x75bed0982aea9449, %g1, %r31
	save
	setx 0xa0e4c0f7e88949d0, %g1, %r16
	setx 0xda6edb1fee37e20d, %g1, %r17
	setx 0x99975171af4847e8, %g1, %r18
	setx 0x74af1a0f1a7b55a3, %g1, %r19
	setx 0xfa595a1882042a68, %g1, %r20
	setx 0xd28932fe0e644416, %g1, %r21
	setx 0xa5c138cab3ba499d, %g1, %r22
	setx 0x7f8afac412140274, %g1, %r23
	setx 0xcee989d4fc795335, %g1, %r24
	setx 0xe0c5031ddffebe33, %g1, %r25
	setx 0xcf6ba9f568c2f26a, %g1, %r26
	setx 0x47203485065d2e2e, %g1, %r27
	setx 0x0ab1e6050bb46801, %g1, %r28
	setx 0xd04d310109081f18, %g1, %r29
	setx 0x134472f7c31739af, %g1, %r30
	setx 0xfc535be579e3e4e1, %g1, %r31
	save
	setx 0x96ee7d1b7cf14749, %g1, %r16
	setx 0x61a3b3103e3a78ce, %g1, %r17
	setx 0xedb933df0f6bc893, %g1, %r18
	setx 0x92a42f8e9a131e3b, %g1, %r19
	setx 0xaa4d96c7176bcbe1, %g1, %r20
	setx 0xce21b4400a1b1d68, %g1, %r21
	setx 0x66038a6a83e963a1, %g1, %r22
	setx 0x45c41a4f67a79b84, %g1, %r23
	setx 0xc64eb06bcb80686e, %g1, %r24
	setx 0xe0a299d9e1af41c8, %g1, %r25
	setx 0x6ce1d35404b24d01, %g1, %r26
	setx 0x53fcddc76a264648, %g1, %r27
	setx 0xd438493aaa4811e3, %g1, %r28
	setx 0x067f14cca3b2ad6a, %g1, %r29
	setx 0x3a762774849ecda2, %g1, %r30
	setx 0x5588c883df9ae781, %g1, %r31
	save
	setx 0x5f8401a99619210c, %g1, %r16
	setx 0x83c9303086c8ad02, %g1, %r17
	setx 0x53b08ff33ebdcd67, %g1, %r18
	setx 0x35d64e1f989291ad, %g1, %r19
	setx 0xf9faf07b4741bcc5, %g1, %r20
	setx 0xb5a4e6ddbfe8de43, %g1, %r21
	setx 0x3fabd89a9020e7c2, %g1, %r22
	setx 0x41fc7bb4e1831e55, %g1, %r23
	setx 0xa0d7bfb98bc648be, %g1, %r24
	setx 0x3adb2a2de9d8c337, %g1, %r25
	setx 0x4707305338349986, %g1, %r26
	setx 0xcd7d4b957fa88091, %g1, %r27
	setx 0xee25c97d335f6ba6, %g1, %r28
	setx 0xa8706141d137ecd8, %g1, %r29
	setx 0x2cd69f9881b84677, %g1, %r30
	setx 0x5445ed2a99ae88b6, %g1, %r31
	save
	setx 0x14da20f558ae1711, %g1, %r16
	setx 0x16855719bd9891d3, %g1, %r17
	setx 0x6dbe4147fab15d99, %g1, %r18
	setx 0x39b48eb92f3c58e1, %g1, %r19
	setx 0x3ce9c7e0057596af, %g1, %r20
	setx 0xf0c451ddc76d1c83, %g1, %r21
	setx 0x254f45979d8c0608, %g1, %r22
	setx 0xb955e5e5005baa9f, %g1, %r23
	setx 0x656258fd039e6950, %g1, %r24
	setx 0x841f20b5c70b3603, %g1, %r25
	setx 0x4e5ea2b3a9af37a8, %g1, %r26
	setx 0xa842f5f5b953aad8, %g1, %r27
	setx 0x15d3d0603878c7c7, %g1, %r28
	setx 0xb40c2b6b1003f9e4, %g1, %r29
	setx 0x28198d7f6c20333a, %g1, %r30
	setx 0x8e4ae9c66a76983b, %g1, %r31
	ta	%icc, T_CHANGE_HPRIV
	wr	%g0, 4, %fprs
	setx	data_start_0, %r1, %g7
	ldd	[%g7+0], %f0
	ldd	[%g7+8], %f2
	ldd	[%g7+16], %f4
	ldd	[%g7+24], %f6
	ldd	[%g7+32], %f8
	ldd	[%g7+40], %f10
	ldd	[%g7+48], %f12
	ldd	[%g7+56], %f14
	ldd	[%g7+64], %f16
	ldd	[%g7+72], %f18
	ldd	[%g7+80], %f20
	ldd	[%g7+88], %f22
	ldd	[%g7+96], %f24
	ldd	[%g7+104], %f26
	ldd	[%g7+112], %f28
	ldd	[%g7+120], %f30
	ldd	[%g7+128], %f32
	ldd	[%g7+136], %f34
	ldd	[%g7+144], %f36
	ldd	[%g7+152], %f38
	ldd	[%g7+160], %f40
	ldd	[%g7+168], %f42
	ldd	[%g7+176], %f44
	ldd	[%g7+184], %f46
	ldd	[%g7+192], %f48
	ldd	[%g7+200], %f50
	ldd	[%g7+208], %f52
	ldd	[%g7+216], %f54
	ldd	[%g7+224], %f56
	ldd	[%g7+232], %f58
	ldd	[%g7+240], %f60
	ldd	[%g7+248], %f62
	setx	fsr_data, %r1, %g7
	stx	%fsr, [%g7]
	ldx	[%g7], %g4
	setx	%hi(0x0f000000), %g1, %g3
	or	%g4, %g3, %g4
	stx	%g4, [%g7]
	ldx	[%g7], %fsr
	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffff; target strm = 0x2
	cmp	%o1, 1
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4
	cmp	%o1, 2
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8
	cmp	%o1, 3
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
	.word 0xb22d20d6  ! 3: ANDN_I	andn 	%r20, 0x00d6, %r25
	.word 0xb3e5e078  ! 4: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbfe4207b  ! 6: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb57d2401  ! 9: MOVR_I	movre	%r20, 0x1, %r26
	.word 0xbde5a114  ! 13: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbfe520c1  ! 15: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde5202d  ! 17: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde460e0  ! 18: SAVE_I	save	%r17, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe4e1e1  ! 23: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xba94a186  ! 26: ORcc_I	orcc 	%r18, 0x0186, %r29
	.word 0xbc2da14c  ! 27: ANDN_I	andn 	%r22, 0x014c, %r30
	.word 0xbb510000  ! 28: RDPR_TICK	<illegal instruction>
	.word 0xb9480000  ! 29: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb1e5e1de  ! 30: SAVE_I	save	%r23, 0x0001, %r24
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, e)
	.word 0xb49ce00c  ! 34: XORcc_I	xorcc 	%r19, 0x000c, %r26
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 1f)
	mov	2, %r12
	.word 0xa1930000  ! 44: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 27)
	.word 0xb9e4a11d  ! 48: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb551c000  ! 50: RDPR_TL	<illegal instruction>
	.word 0xb8ad6167  ! 53: ANDNcc_I	andncc 	%r21, 0x0167, %r28
	.word 0xb7e52047  ! 55: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde4a0eb  ! 56: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbf7d2401  ! 57: MOVR_I	movre	%r20, 0x1, %r31
	.word 0x8195e100  ! 60: WRPR_TPC_I	wrpr	%r23, 0x0100, %tpc
	.word 0xbde561f1  ! 61: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e421de  ! 62: SAVE_I	save	%r16, 0x0001, %r24
	setx	data_start_2, %g1, %r16
	.word 0xbc246122  ! 65: SUB_I	sub 	%r17, 0x0122, %r30
	.word 0xb9e5e012  ! 68: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb93c2001  ! 71: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0xb9e4617f  ! 72: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e4a19f  ! 76: SAVE_I	save	%r18, 0x0001, %r24
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 9)
	.word 0xb7e4e15a  ! 81: SAVE_I	save	%r19, 0x0001, %r27
	.word 0x89956100  ! 85: WRPR_TICK_I	wrpr	%r21, 0x0100, %tick
	.word 0xb80dc000  ! 86: AND_R	and 	%r23, %r0, %r28
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 3c)
	setx	0xc546ed7b00000e9c, %g1, %r10
	.word 0x819a8000  ! 89: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9e4a18e  ! 90: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1e421fe  ! 91: SAVE_I	save	%r16, 0x0001, %r24
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 8)
	.word 0x8395e1c5  ! 102: WRPR_TNPC_I	wrpr	%r23, 0x01c5, %tnpc
	.word 0xb9e461bc  ! 105: SAVE_I	save	%r17, 0x0001, %r28
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb3e5e165  ! 108: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x83952125  ! 110: WRPR_TNPC_I	wrpr	%r20, 0x0125, %tnpc
	.word 0xbbe52115  ! 113: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e4a0e4  ! 114: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e56169  ! 116: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e421ec  ! 118: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde42002  ! 119: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x8595a0be  ! 121: WRPR_TSTATE_I	wrpr	%r22, 0x00be, %tstate
	.word 0x9194a0e4  ! 122: WRPR_PIL_I	wrpr	%r18, 0x00e4, %pil
	.word 0xb9e46115  ! 125: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb2244000  ! 126: SUB_R	sub 	%r17, %r0, %r25
	setx	0x17b0c63f00009fc4, %g1, %r10
	.word 0x839a8000  ! 130: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5e4a0d8  ! 131: SAVE_I	save	%r18, 0x0001, %r26
	.word 0x8994216e  ! 132: WRPR_TICK_I	wrpr	%r16, 0x016e, %tick
	.word 0xbfe5e042  ! 133: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e56021  ! 135: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe5a1db  ! 137: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e46020  ! 138: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb150c000  ! 140: RDPR_TT	<illegal instruction>
	.word 0xb33c8000  ! 141: SRA_R	sra 	%r18, %r0, %r25
	.word 0x899520ca  ! 143: WRPR_TICK_I	wrpr	%r20, 0x00ca, %tick
	.word 0x8194e050  ! 149: WRPR_TPC_I	wrpr	%r19, 0x0050, %tpc
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb805e0a0  ! 159: ADD_I	add 	%r23, 0x00a0, %r28
	setx	0x4ad403600003d04, %g1, %r10
	.word 0x839a8000  ! 162: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb8bda0b1  ! 163: XNORcc_I	xnorcc 	%r22, 0x00b1, %r28
	.word 0x8d94a0b4  ! 165: WRPR_PSTATE_I	wrpr	%r18, 0x00b4, %pstate
	.word 0xb9e5e09b  ! 166: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x8d946183  ! 167: WRPR_PSTATE_I	wrpr	%r17, 0x0183, %pstate
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 28)
	.word 0xb7e46038  ! 172: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e5e107  ! 174: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e4e13a  ! 175: SAVE_I	save	%r19, 0x0001, %r25
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 13)
	.word 0xb7e421af  ! 177: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e56154  ! 180: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e5a197  ! 183: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb551c000  ! 184: RDPR_TL	<illegal instruction>
	.word 0x9195a111  ! 187: WRPR_PIL_I	wrpr	%r22, 0x0111, %pil
	.word 0xb5e5e113  ! 188: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e5e0a5  ! 190: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde4e1fc  ! 191: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e420bb  ! 192: SAVE_I	save	%r16, 0x0001, %r26
	.word 0x8d95a039  ! 196: WRPR_PSTATE_I	wrpr	%r22, 0x0039, %pstate
	.word 0xbbe52163  ! 197: SAVE_I	save	%r20, 0x0001, %r29
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb1e42008  ! 201: SAVE_I	save	%r16, 0x0001, %r24
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, d)
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbfe5203d  ! 205: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb2150000  ! 207: OR_R	or 	%r20, %r0, %r25
	.word 0xb9e5a032  ! 208: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde4217f  ! 209: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe5a0f0  ! 215: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde560c1  ! 217: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e5e098  ! 218: SAVE_I	save	%r23, 0x0001, %r24
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 17)
	.word 0xb7508000  ! 221: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e520f8  ! 222: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3e4e045  ! 230: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e52166  ! 236: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbd508000  ! 241: RDPR_TSTATE	<illegal instruction>
	.word 0xbf50c000  ! 242: RDPR_TT	<illegal instruction>
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 24)
	.word 0xb1500000  ! 246: RDPR_TPC	<illegal instruction>
	.word 0xb1520000  ! 250: RDPR_PIL	<illegal instruction>
	.word 0xbd50c000  ! 256: RDPR_TT	<illegal instruction>
	.word 0x8195e1cc  ! 257: WRPR_TPC_I	wrpr	%r23, 0x01cc, %tpc
	.word 0xb41c8000  ! 258: XOR_R	xor 	%r18, %r0, %r26
	mov	0, %r12
	.word 0x8f930000  ! 259: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1510000  ! 260: RDPR_TICK	<illegal instruction>
	.word 0xb33de001  ! 266: SRA_I	sra 	%r23, 0x0001, %r25
	.word 0xbf2da001  ! 267: SLL_I	sll 	%r22, 0x0001, %r31
	.word 0xbbe461b7  ! 271: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8d9560a8  ! 273: WRPR_PSTATE_I	wrpr	%r21, 0x00a8, %pstate
	.word 0xbbe561f3  ! 274: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e5613a  ! 277: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe4e077  ! 284: SAVE_I	save	%r19, 0x0001, %r31
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 34)
	.word 0x8994e050  ! 289: WRPR_TICK_I	wrpr	%r19, 0x0050, %tick
	.word 0xbfe56014  ! 290: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x8194e153  ! 291: WRPR_TPC_I	wrpr	%r19, 0x0153, %tpc
	.word 0x8795a1b5  ! 292: WRPR_TT_I	wrpr	%r22, 0x01b5, %tt
	.word 0xb1e560a5  ! 293: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e521c0  ! 295: SAVE_I	save	%r20, 0x0001, %r28
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 27)
	.word 0xb3e46073  ! 297: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1e4a164  ! 300: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1510000  ! 303: RDPR_TICK	<illegal instruction>
	.word 0x8194a1cd  ! 309: WRPR_TPC_I	wrpr	%r18, 0x01cd, %tpc
	.word 0xb7e56017  ! 311: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e5a027  ! 312: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbc9c4000  ! 313: XORcc_R	xorcc 	%r17, %r0, %r30
	.word 0xbb504000  ! 315: RDPR_TNPC	<illegal instruction>
	mov	1, %r12
	.word 0xa1930000  ! 317: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbde4215d  ! 319: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3504000  ! 320: RDPR_TNPC	<illegal instruction>
	.word 0xbfe5e0a7  ! 323: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e4a0fa  ! 328: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe420f3  ! 331: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x8795e020  ! 333: WRPR_TT_I	wrpr	%r23, 0x0020, %tt
	.word 0xb3e42179  ! 334: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbd50c000  ! 335: RDPR_TT	<illegal instruction>
	.word 0xb9e56140  ! 343: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe561dd  ! 345: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbc0d4000  ! 347: AND_R	and 	%r21, %r0, %r30
	.word 0xb5e4a163  ! 348: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbb2d9000  ! 349: SLLX_R	sllx	%r22, %r0, %r29
	.word 0xb5e460d0  ! 350: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x83942181  ! 352: WRPR_TNPC_I	wrpr	%r16, 0x0181, %tnpc
	.word 0xbfe560e7  ! 353: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e4e1ff  ! 358: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e460e9  ! 359: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e4a1f6  ! 361: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e5619b  ! 363: SAVE_I	save	%r21, 0x0001, %r27
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 18)
	.word 0xbfe5e198  ! 377: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e46193  ! 378: SAVE_I	save	%r17, 0x0001, %r24
	setx	data_start_0, %g1, %r16
	.word 0xb1e4e108  ! 380: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3e4e0a4  ! 383: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x85946134  ! 384: WRPR_TSTATE_I	wrpr	%r17, 0x0134, %tstate
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 31)
	setx	data_start_7, %g1, %r17
	.word 0xbd504000  ! 390: RDPR_TNPC	<illegal instruction>
	.word 0xbfe5e019  ! 391: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbd51c000  ! 392: RDPR_TL	<illegal instruction>
	.word 0xb8b4a045  ! 396: ORNcc_I	orncc 	%r18, 0x0045, %r28
	.word 0xbfe42092  ! 397: SAVE_I	save	%r16, 0x0001, %r31
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 37)
	.word 0xb9e5e1b1  ! 405: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e461a9  ! 406: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e5a1ac  ! 410: SAVE_I	save	%r22, 0x0001, %r26
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 9)
	.word 0x859520e3  ! 414: WRPR_TSTATE_I	wrpr	%r20, 0x00e3, %tstate
	.word 0xbde4e004  ! 415: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb151c000  ! 418: RDPR_TL	<illegal instruction>
	.word 0xb1e56027  ! 420: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe52134  ! 424: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5e5a075  ! 425: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e4e156  ! 426: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e5a0f7  ! 429: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e5e079  ! 431: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbbe56158  ! 433: SAVE_I	save	%r21, 0x0001, %r29
	mov	2, %r12
	.word 0x8f930000  ! 438: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbf504000  ! 441: RDPR_TNPC	<illegal instruction>
	.word 0x8794a052  ! 442: WRPR_TT_I	wrpr	%r18, 0x0052, %tt
	.word 0xb7500000  ! 443: RDPR_TPC	<illegal instruction>
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 33)
	.word 0x8395212e  ! 446: WRPR_TNPC_I	wrpr	%r20, 0x012e, %tnpc
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb1e4a1b2  ! 448: SAVE_I	save	%r18, 0x0001, %r24
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbde4a0bb  ! 452: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb615e0ce  ! 453: OR_I	or 	%r23, 0x00ce, %r27
	.word 0xbf500000  ! 454: RDPR_TPC	<illegal instruction>
	.word 0xbf50c000  ! 462: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe561dd  ! 467: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb4c5a131  ! 469: ADDCcc_I	addccc 	%r22, 0x0131, %r26
	.word 0xb7e5e022  ! 473: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe5e0d3  ! 475: SAVE_I	save	%r23, 0x0001, %r29
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbde4a07f  ! 478: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbb518000  ! 481: RDPR_PSTATE	<illegal instruction>
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 20)
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 39)
	.word 0xbbe46024  ! 490: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde5611c  ! 493: SAVE_I	save	%r21, 0x0001, %r30
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 39)
	.word 0x87956008  ! 498: WRPR_TT_I	wrpr	%r21, 0x0008, %tt
	.word 0xbfe4a1b2  ! 499: SAVE_I	save	%r18, 0x0001, %r31
	mov	2, %r12
	.word 0xa1930000  ! 505: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfe4a149  ! 506: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb5540000  ! 509: RDPR_GL	<illegal instruction>
	.word 0x8994604e  ! 512: WRPR_TICK_I	wrpr	%r17, 0x004e, %tick
	.word 0xbbe4a188  ! 513: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x8d956125  ! 514: WRPR_PSTATE_I	wrpr	%r21, 0x0125, %pstate
	.word 0xb5e420af  ! 515: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb3e4e0b8  ! 518: SAVE_I	save	%r19, 0x0001, %r25
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 11)
	.word 0xb1e5e19d  ! 520: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb0c5e1e1  ! 522: ADDCcc_I	addccc 	%r23, 0x01e1, %r24
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 1)
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 22)
	.word 0xb1e4e063  ! 528: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e52102  ! 534: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e4e16c  ! 535: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3500000  ! 537: RDPR_TPC	<illegal instruction>
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 22)
	setx	0x15133ba600000dca, %g1, %r10
	.word 0x819a8000  ! 541: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3e4e0f2  ! 545: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbfe5a01b  ! 546: SAVE_I	save	%r22, 0x0001, %r31
	mov	2, %r12
	.word 0xa1930000  ! 547: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbde4a16e  ! 553: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x839521c7  ! 563: WRPR_TNPC_I	wrpr	%r20, 0x01c7, %tnpc
	setx	data_start_7, %g1, %r22
	.word 0xb7e420af  ! 567: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb52c8000  ! 568: SLL_R	sll 	%r18, %r0, %r26
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 5)
	.word 0x8595613a  ! 576: WRPR_TSTATE_I	wrpr	%r21, 0x013a, %tstate
	.word 0xbe25a0ad  ! 579: SUB_I	sub 	%r22, 0x00ad, %r31
	.word 0xb3e5a136  ! 582: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb63d21cc  ! 583: XNOR_I	xnor 	%r20, 0x01cc, %r27
	mov	1, %r12
	.word 0x8f930000  ! 584: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9e4e0fe  ! 585: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbd3cd000  ! 588: SRAX_R	srax	%r19, %r0, %r30
	.word 0xbb50c000  ! 589: RDPR_TT	<illegal instruction>
	.word 0xb7343001  ! 593: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0xb61cc000  ! 594: XOR_R	xor 	%r19, %r0, %r27
	.word 0xb3e4e1c2  ! 595: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb69c6082  ! 598: XORcc_I	xorcc 	%r17, 0x0082, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e5e1a5  ! 609: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb93de001  ! 611: SRA_I	sra 	%r23, 0x0001, %r28
	.word 0xb6bd0000  ! 613: XNORcc_R	xnorcc 	%r20, %r0, %r27
	.word 0xb1e420b1  ! 623: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb6348000  ! 627: SUBC_R	orn 	%r18, %r0, %r27
	.word 0xb1342001  ! 629: SRL_I	srl 	%r16, 0x0001, %r24
	setx	0x2fef2d6a0000de81, %g1, %r10
	.word 0x839a8000  ! 632: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5e5e1cd  ! 634: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbe8c60d1  ! 638: ANDcc_I	andcc 	%r17, 0x00d1, %r31
	.word 0xbbe56183  ! 639: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5e5219a  ! 640: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb2956003  ! 641: ORcc_I	orcc 	%r21, 0x0003, %r25
	.word 0xb9e46079  ! 644: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbeb5619d  ! 645: ORNcc_I	orncc 	%r21, 0x019d, %r31
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 9)
	.word 0xb1500000  ! 649: RDPR_TPC	<illegal instruction>
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 10)
	.word 0xbde4e12e  ! 657: SAVE_I	save	%r19, 0x0001, %r30
	mov	1, %r12
	.word 0xa1930000  ! 660: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 17)
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 31)
	.word 0xb7e4a1ee  ! 666: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e4606e  ! 670: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xba3de0c5  ! 672: XNOR_I	xnor 	%r23, 0x00c5, %r29
	setx	0xee8e06e00007c95, %g1, %r10
	.word 0x819a8000  ! 674: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5e42112  ! 675: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e561d2  ! 676: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe4a1ab  ! 677: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe46121  ! 678: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e5204e  ! 683: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e4a1b9  ! 685: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbde4206d  ! 688: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x8194e1b5  ! 690: WRPR_TPC_I	wrpr	%r19, 0x01b5, %tpc
	.word 0xb134e001  ! 691: SRL_I	srl 	%r19, 0x0001, %r24
	.word 0x8d95216d  ! 694: WRPR_PSTATE_I	wrpr	%r20, 0x016d, %pstate
	.word 0xb5e461d1  ! 695: SAVE_I	save	%r17, 0x0001, %r26
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 9)
	.word 0xb1e42098  ! 698: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde4a170  ! 699: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb884217c  ! 702: ADDcc_I	addcc 	%r16, 0x017c, %r28
	.word 0xb7e52126  ! 704: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe42181  ! 705: SAVE_I	save	%r16, 0x0001, %r31
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb9e52163  ! 709: SAVE_I	save	%r20, 0x0001, %r28
	.word 0x8194e10d  ! 711: WRPR_TPC_I	wrpr	%r19, 0x010d, %tpc
	.word 0xbb643801  ! 712: MOVcc_I	<illegal instruction>
	.word 0xbde42054  ! 714: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb4b50000  ! 716: ORNcc_R	orncc 	%r20, %r0, %r26
	.word 0x839420e9  ! 717: WRPR_TNPC_I	wrpr	%r16, 0x00e9, %tnpc
	.word 0xbb504000  ! 719: RDPR_TNPC	<illegal instruction>
	.word 0xb3e56015  ! 724: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9510000  ! 725: RDPR_TICK	<illegal instruction>
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, 8)
	.word 0xb5e42140  ! 731: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e5e1a6  ! 735: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbbe4615e  ! 736: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x919561db  ! 741: WRPR_PIL_I	wrpr	%r21, 0x01db, %pil
	.word 0xb1e42190  ! 742: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e4a1b7  ! 744: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x8794a17f  ! 745: WRPR_TT_I	wrpr	%r18, 0x017f, %tt
	.word 0xb52c9000  ! 749: SLLX_R	sllx	%r18, %r0, %r26
	.word 0xb5e5e109  ! 750: SAVE_I	save	%r23, 0x0001, %r26
	setx	data_start_0, %g1, %r22
	.word 0x8794e157  ! 754: WRPR_TT_I	wrpr	%r19, 0x0157, %tt
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, 9)
	.word 0xb551c000  ! 760: RDPR_TL	<illegal instruction>
	setx	0xd54f2cf600003cd8, %g1, %r10
	.word 0x839a8000  ! 761: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1480000  ! 762: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb9e5e065  ! 768: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e42186  ! 769: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb08520a6  ! 775: ADDcc_I	addcc 	%r20, 0x00a6, %r24
	.word 0xbbe46129  ! 777: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8794a037  ! 781: WRPR_TT_I	wrpr	%r18, 0x0037, %tt
	mov	0, %r12
	.word 0x8f930000  ! 785: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_41), 16, 16)) -> intp(0, 0, 4)
	setx	0xc1dbdd0300002e51, %g1, %r10
	.word 0x819a8000  ! 788: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8394e1d1  ! 789: WRPR_TNPC_I	wrpr	%r19, 0x01d1, %tnpc
	.word 0x8194a1db  ! 794: WRPR_TPC_I	wrpr	%r18, 0x01db, %tpc
	.word 0xb824c000  ! 797: SUB_R	sub 	%r19, %r0, %r28
	.word 0xbe9c216c  ! 799: XORcc_I	xorcc 	%r16, 0x016c, %r31
	.word 0xb0958000  ! 800: ORcc_R	orcc 	%r22, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_42), 16, 16)) -> intp(0, 0, 18)
	.word 0xbb50c000  ! 809: RDPR_TT	<illegal instruction>
	.word 0xbbe52182  ! 811: SAVE_I	save	%r20, 0x0001, %r29
hwintr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_43), 16, 16)) -> intp(0, 0, 36)
	.word 0x8595a16f  ! 813: WRPR_TSTATE_I	wrpr	%r22, 0x016f, %tstate
	.word 0xbfe560e7  ! 814: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3e420a4  ! 816: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x8995a03b  ! 817: WRPR_TICK_I	wrpr	%r22, 0x003b, %tick
	setx	0x9e44f3860000bc0c, %g1, %r10
	.word 0x839a8000  ! 818: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9e5a0f1  ! 821: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e420d9  ! 823: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb6a5a175  ! 825: SUBcc_I	subcc 	%r22, 0x0175, %r27
	.word 0xbfe4e014  ! 826: SAVE_I	save	%r19, 0x0001, %r31
hwintr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_44), 16, 16)) -> intp(0, 0, 10)
	.word 0xbab58000  ! 834: ORNcc_R	orncc 	%r22, %r0, %r29
	.word 0x8395e0f7  ! 838: WRPR_TNPC_I	wrpr	%r23, 0x00f7, %tnpc
	.word 0xb7e420d7  ! 839: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5520000  ! 840: RDPR_PIL	<illegal instruction>
	.word 0xbbe46178  ! 842: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe4a0a4  ! 848: SAVE_I	save	%r18, 0x0001, %r31
hwintr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_45), 16, 16)) -> intp(0, 0, 11)
	.word 0xb5e461e4  ! 852: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe560fc  ! 857: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde5e187  ! 858: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde4205e  ! 861: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7e4e168  ! 866: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde42135  ! 869: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb73dd000  ! 873: SRAX_R	srax	%r23, %r0, %r27
	.word 0xbf340000  ! 874: SRL_R	srl 	%r16, %r0, %r31
	.word 0xbde56162  ! 877: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x8595203d  ! 882: WRPR_TSTATE_I	wrpr	%r20, 0x003d, %tstate
	.word 0xb1e4e1a3  ! 883: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe4202c  ! 888: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb2454000  ! 889: ADDC_R	addc 	%r21, %r0, %r25
	.word 0xb625a1ca  ! 895: SUB_I	sub 	%r22, 0x01ca, %r27
	.word 0xb5e421dc  ! 898: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e5219b  ! 899: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e56068  ! 900: SAVE_I	save	%r21, 0x0001, %r26
hwintr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_46), 16, 16)) -> intp(0, 0, 36)
	.word 0xb9e5e0f1  ! 908: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e5e1e6  ! 910: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e4a13b  ! 917: SAVE_I	save	%r18, 0x0001, %r27
hwintr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_47), 16, 16)) -> intp(0, 0, 4)
	.word 0xb7e461ff  ! 923: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe5e0f6  ! 925: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe5a075  ! 930: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x919461ff  ! 933: WRPR_PIL_I	wrpr	%r17, 0x01ff, %pil
	.word 0xb9e560db  ! 939: SAVE_I	save	%r21, 0x0001, %r28
hwintr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_48), 16, 16)) -> intp(0, 0, 39)
	.word 0xb750c000  ! 945: RDPR_TT	<illegal instruction>
	.word 0x8594a12f  ! 952: WRPR_TSTATE_I	wrpr	%r18, 0x012f, %tstate
	.word 0xb52ca001  ! 953: SLL_I	sll 	%r18, 0x0001, %r26
hwintr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_49), 16, 16)) -> intp(0, 0, 8)
	.word 0xbb50c000  ! 962: RDPR_TT	<illegal instruction>
	.word 0xb1e5608d  ! 963: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbeb54000  ! 967: SUBCcc_R	orncc 	%r21, %r0, %r31
	.word 0xb1480000  ! 968: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x1a748a9b00001c88, %g1, %r10
	.word 0x839a8000  ! 969: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb0946047  ! 970: ORcc_I	orcc 	%r17, 0x0047, %r24
	.word 0xbfe5e1e2  ! 971: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9500000  ! 972: RDPR_TPC	<illegal instruction>
	.word 0xb3e4a05a  ! 974: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe4a01d  ! 975: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbb504000  ! 979: RDPR_TNPC	<illegal instruction>
	.word 0xb1e4205a  ! 981: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbd500000  ! 982: RDPR_TPC	<illegal instruction>
	.word 0xbfe5615a  ! 984: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbea56076  ! 986: SUBcc_I	subcc 	%r21, 0x0076, %r31
	.word 0xb3540000  ! 988: RDPR_GL	<illegal instruction>
	.word 0xb3e42088  ! 989: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e5a0f8  ! 991: SAVE_I	save	%r22, 0x0001, %r27
hwintr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_50), 16, 16)) -> intp(0, 0, d)
	.word 0xb1540000  ! 993: RDPR_GL	<illegal instruction>
	.word 0xb3e5206e  ! 994: SAVE_I	save	%r20, 0x0001, %r25
	mov	0, %r12
	.word 0xa1930000  ! 996: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5e560b5  ! 997: SAVE_I	save	%r21, 0x0001, %r26
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	setx	data_start_0, %g1, %r16
	setx	data_start_1, %g1, %r17
	setx	data_start_2, %g1, %r18
	setx	data_start_3, %g1, %r19
	setx	data_start_4, %g1, %r20
	setx	data_start_5, %g1, %r21
	setx	data_start_6, %g1, %r22
	setx	data_start_7, %g1, %r23
	.word 0xf6352072  ! 1: STH_I	sth	%r27, [%r20 + 0x0072]
	.word 0xb42ce1c9  ! 3: ANDN_I	andn 	%r19, 0x01c9, %r26
	.word 0xf42c8000  ! 7: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xff3c4000  ! 8: STDF_R	std	%f31, [%r0, %r17]
	.word 0xbb7de401  ! 9: MOVR_I	movre	%r23, 0x1, %r29
	.word 0xf0244000  ! 11: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xfc3cc000  ! 12: STD_R	std	%r30, [%r19 + %r0]
	.word 0xfb3cc000  ! 16: STDF_R	std	%f29, [%r0, %r19]
	.word 0xf2346052  ! 19: STH_I	sth	%r25, [%r17 + 0x0052]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xff3dc000  ! 25: STDF_R	std	%f31, [%r0, %r23]
	.word 0xb895e181  ! 26: ORcc_I	orcc 	%r23, 0x0181, %r28
	.word 0xba2da0c6  ! 27: ANDN_I	andn 	%r22, 0x00c6, %r29
	.word 0xb1510000  ! 28: RDPR_TICK	rdpr	%tick, %r24
	.word 0xb3480000  ! 29: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 7)
	.word 0xf33da1bc  ! 33: STDF_I	std	%f25, [0x01bc, %r22]
	.word 0xb69ca1cd  ! 34: XORcc_I	xorcc 	%r18, 0x01cd, %r27
	.word 0xf33c4000  ! 37: STDF_R	std	%f25, [%r0, %r17]
	.word 0xf874a0f3  ! 38: STX_I	stx	%r28, [%r18 + 0x00f3]
	.word 0xf624c000  ! 42: STW_R	stw	%r27, [%r19 + %r0]
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 1c)
	mov	2, %r12
	.word 0xa1930000  ! 44: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 3)
	.word 0xf42d8000  ! 46: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xb751c000  ! 50: RDPR_TL	rdpr	%tl, %r27
	.word 0xbaaca090  ! 53: ANDNcc_I	andncc 	%r18, 0x0090, %r29
	.word 0xb77c2401  ! 57: MOVR_I	movre	%r16, 0x1, %r27
	.word 0x8194e0d0  ! 60: WRPR_TPC_I	wrpr	%r19, 0x00d0, %tpc
	setx	data_start_3, %g1, %r23
	.word 0xb825a018  ! 65: SUB_I	sub 	%r22, 0x0018, %r28
	.word 0xbf3de001  ! 71: SRA_I	sra 	%r23, 0x0001, %r31
	.word 0xf274e18a  ! 74: STX_I	stx	%r25, [%r19 + 0x018a]
	.word 0xf02dc000  ! 79: STB_R	stb	%r24, [%r23 + %r0]
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 38)
	.word 0xf42de0fc  ! 82: STB_I	stb	%r26, [%r23 + 0x00fc]
	.word 0xfc352127  ! 83: STH_I	sth	%r30, [%r20 + 0x0127]
	.word 0x8995e1ac  ! 85: WRPR_TICK_I	wrpr	%r23, 0x01ac, %tick
	.word 0xb40d4000  ! 86: AND_R	and 	%r21, %r0, %r26
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 1a)
	setx	0x3970b90000989f, %g1, %r10
	.word 0x819a8000  ! 89: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 11)
	.word 0xf87520f6  ! 94: STX_I	stx	%r28, [%r20 + 0x00f6]
	.word 0xfa2d4000  ! 95: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xf13c2075  ! 96: STDF_I	std	%f24, [0x0075, %r16]
	.word 0xfc358000  ! 97: STH_R	sth	%r30, [%r22 + %r0]
	.word 0x8394602d  ! 102: WRPR_TNPC_I	wrpr	%r17, 0x002d, %tnpc
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 35)
	.word 0xf53c8000  ! 107: STDF_R	std	%f26, [%r0, %r18]
	.word 0x8395e02e  ! 110: WRPR_TNPC_I	wrpr	%r23, 0x002e, %tnpc
	.word 0xfe35a112  ! 111: STH_I	sth	%r31, [%r22 + 0x0112]
	.word 0x8594213c  ! 121: WRPR_TSTATE_I	wrpr	%r16, 0x013c, %tstate
	.word 0x9194600f  ! 122: WRPR_PIL_I	wrpr	%r17, 0x000f, %pil
	.word 0xbe25c000  ! 126: SUB_R	sub 	%r23, %r0, %r31
	.word 0xf02da112  ! 127: STB_I	stb	%r24, [%r22 + 0x0112]
	setx	0x478496f60000ba5c, %g1, %r10
	.word 0x839a8000  ! 130: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8994a113  ! 132: WRPR_TICK_I	wrpr	%r18, 0x0113, %tick
	.word 0xf63c4000  ! 136: STD_R	std	%r27, [%r17 + %r0]
	.word 0xb950c000  ! 140: RDPR_TT	rdpr	%tt, %r28
	.word 0xbd3d8000  ! 141: SRA_R	sra 	%r22, %r0, %r30
	.word 0x8994a18f  ! 143: WRPR_TICK_I	wrpr	%r18, 0x018f, %tick
	.word 0xf03d0000  ! 144: STD_R	std	%r24, [%r20 + %r0]
	.word 0xf475c000  ! 147: STX_R	stx	%r26, [%r23 + %r0]
	.word 0x819560f1  ! 149: WRPR_TPC_I	wrpr	%r21, 0x00f1, %tpc
	.word 0xfe34601d  ! 153: STH_I	sth	%r31, [%r17 + 0x001d]
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 0)
	.word 0xf6740000  ! 156: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xb00460f0  ! 159: ADD_I	add 	%r17, 0x00f0, %r24
	setx	0xcc62b6d600002cdf, %g1, %r10
	.word 0x839a8000  ! 162: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbabd6105  ! 163: XNORcc_I	xnorcc 	%r21, 0x0105, %r29
	.word 0xfe75a0ee  ! 164: STX_I	stx	%r31, [%r22 + 0x00ee]
	.word 0x8d94210c  ! 165: WRPR_PSTATE_I	wrpr	%r16, 0x010c, %pstate
	.word 0x8d952139  ! 167: WRPR_PSTATE_I	wrpr	%r20, 0x0139, %pstate
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, b)
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 21)
	.word 0xf62d0000  ! 179: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xf63ca116  ! 181: STD_I	std	%r27, [%r18 + 0x0116]
	.word 0xb951c000  ! 184: RDPR_TL	rdpr	%tl, %r28
	.word 0xf22de116  ! 185: STB_I	stb	%r25, [%r23 + 0x0116]
	.word 0x9194a0d8  ! 187: WRPR_PIL_I	wrpr	%r18, 0x00d8, %pil
	.word 0xfc24e03d  ! 189: STW_I	stw	%r30, [%r19 + 0x003d]
	.word 0xfa3cc000  ! 193: STD_R	std	%r29, [%r19 + %r0]
	.word 0x8d95e142  ! 196: WRPR_PSTATE_I	wrpr	%r23, 0x0142, %pstate
	.word 0xfa356151  ! 198: STH_I	sth	%r29, [%r21 + 0x0151]
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 1c)
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 35)
	.word 0xfe3c0000  ! 203: STD_R	std	%r31, [%r16 + %r0]
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 18)
	.word 0xf43d6118  ! 206: STD_I	std	%r26, [%r21 + 0x0118]
	.word 0xb0140000  ! 207: OR_R	or 	%r16, %r0, %r24
	.word 0xf0354000  ! 211: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xff3d8000  ! 214: STDF_R	std	%f31, [%r0, %r22]
	.word 0xf8752161  ! 216: STX_I	stx	%r28, [%r20 + 0x0161]
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, c)
	.word 0xbb508000  ! 221: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xf23c0000  ! 227: STD_R	std	%r25, [%r16 + %r0]
	.word 0xf4742058  ! 228: STX_I	stx	%r26, [%r16 + 0x0058]
	.word 0xfc34a10f  ! 240: STH_I	sth	%r30, [%r18 + 0x010f]
	.word 0xb5508000  ! 241: RDPR_TSTATE	<illegal instruction>
	.word 0xb950c000  ! 242: RDPR_TT	<illegal instruction>
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 2b)
	.word 0xb5500000  ! 246: RDPR_TPC	<illegal instruction>
	.word 0xf0240000  ! 249: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xb1520000  ! 250: RDPR_PIL	<illegal instruction>
	.word 0xf23c0000  ! 251: STD_R	std	%r25, [%r16 + %r0]
	.word 0xbf50c000  ! 256: RDPR_TT	<illegal instruction>
	.word 0x81942143  ! 257: WRPR_TPC_I	wrpr	%r16, 0x0143, %tpc
	.word 0xbe1dc000  ! 258: XOR_R	xor 	%r23, %r0, %r31
	mov	0, %r12
	.word 0x8f930000  ! 259: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5510000  ! 260: RDPR_TICK	rdpr	%tick, %r26
	.word 0xfa3d8000  ! 262: STD_R	std	%r29, [%r22 + %r0]
	.word 0xfe75a0ed  ! 263: STX_I	stx	%r31, [%r22 + 0x00ed]
	.word 0xf23d4000  ! 265: STD_R	std	%r25, [%r21 + %r0]
	.word 0xb53c6001  ! 266: SRA_I	sra 	%r17, 0x0001, %r26
	.word 0xbd2c2001  ! 267: SLL_I	sll 	%r16, 0x0001, %r30
	.word 0xf824e04e  ! 268: STW_I	stw	%r28, [%r19 + 0x004e]
	.word 0x8d9420f2  ! 273: WRPR_PSTATE_I	wrpr	%r16, 0x00f2, %pstate
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, c)
	.word 0xf02561b5  ! 286: STW_I	stw	%r24, [%r21 + 0x01b5]
	.word 0xf0340000  ! 288: STH_R	sth	%r24, [%r16 + %r0]
	.word 0x8995a0dd  ! 289: WRPR_TICK_I	wrpr	%r22, 0x00dd, %tick
	.word 0x8195e1e0  ! 291: WRPR_TPC_I	wrpr	%r23, 0x01e0, %tpc
	.word 0x879521ff  ! 292: WRPR_TT_I	wrpr	%r20, 0x01ff, %tt
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfe240000  ! 298: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xb9510000  ! 303: RDPR_TICK	rdpr	%tick, %r28
	.word 0xf62d6009  ! 304: STB_I	stb	%r27, [%r21 + 0x0009]
	.word 0xfe2521eb  ! 306: STW_I	stw	%r31, [%r20 + 0x01eb]
	.word 0x8194617c  ! 309: WRPR_TPC_I	wrpr	%r17, 0x017c, %tpc
	.word 0xbc9d4000  ! 313: XORcc_R	xorcc 	%r21, %r0, %r30
	.word 0xbb504000  ! 315: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xf275a174  ! 316: STX_I	stx	%r25, [%r22 + 0x0174]
	mov	0, %r12
	.word 0xa1930000  ! 317: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3504000  ! 320: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xf53c21ab  ! 322: STDF_I	std	%f26, [0x01ab, %r16]
	.word 0xf424c000  ! 332: STW_R	stw	%r26, [%r19 + %r0]
	.word 0x8795214d  ! 333: WRPR_TT_I	wrpr	%r20, 0x014d, %tt
	.word 0xbd50c000  ! 335: RDPR_TT	rdpr	%tt, %r30
	.word 0xf62dc000  ! 337: STB_R	stb	%r27, [%r23 + %r0]
	.word 0xf13cc000  ! 341: STDF_R	std	%f24, [%r0, %r19]
	.word 0xf4250000  ! 346: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xb60dc000  ! 347: AND_R	and 	%r23, %r0, %r27
	.word 0xb72dd000  ! 349: SLLX_R	sllx	%r23, %r0, %r27
	.word 0xf8740000  ! 351: STX_R	stx	%r28, [%r16 + %r0]
	.word 0x8394e047  ! 352: WRPR_TNPC_I	wrpr	%r19, 0x0047, %tnpc
	.word 0xf43d2025  ! 356: STD_I	std	%r26, [%r20 + 0x0025]
	.word 0xfc742117  ! 360: STX_I	stx	%r30, [%r16 + 0x0117]
	.word 0xf4346006  ! 366: STH_I	sth	%r26, [%r17 + 0x0006]
	.word 0xf83cc000  ! 371: STD_R	std	%r28, [%r19 + %r0]
	.word 0xfd3c205e  ! 375: STDF_I	std	%f30, [0x005e, %r16]
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 4)
	setx	data_start_3, %g1, %r21
	.word 0x8594e1ee  ! 384: WRPR_TSTATE_I	wrpr	%r19, 0x01ee, %tstate
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 34)
	setx	data_start_7, %g1, %r17
	.word 0xbb504000  ! 390: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xbb51c000  ! 392: RDPR_TL	<illegal instruction>
	.word 0xfc35a177  ! 393: STH_I	sth	%r30, [%r22 + 0x0177]
	.word 0xfe744000  ! 394: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xfa348000  ! 395: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xbeb5202e  ! 396: ORNcc_I	orncc 	%r20, 0x002e, %r31
	.word 0xfc2c8000  ! 398: STB_R	stb	%r30, [%r18 + %r0]
	.word 0xfc35c000  ! 402: STH_R	sth	%r30, [%r23 + %r0]
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 8)
	.word 0xf03c6189  ! 404: STD_I	std	%r24, [%r17 + 0x0189]
	.word 0xf834e0b9  ! 407: STH_I	sth	%r28, [%r19 + 0x00b9]
	.word 0xfe3c21b9  ! 408: STD_I	std	%r31, [%r16 + 0x01b9]
	.word 0xf4242040  ! 411: STW_I	stw	%r26, [%r16 + 0x0040]
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 17)
	.word 0x8594204d  ! 414: WRPR_TSTATE_I	wrpr	%r16, 0x004d, %tstate
	.word 0xf234206f  ! 416: STH_I	sth	%r25, [%r16 + 0x006f]
	.word 0xbf51c000  ! 418: RDPR_TL	rdpr	%tl, %r31
	.word 0xf23d4000  ! 419: STD_R	std	%r25, [%r21 + %r0]
	.word 0xf875a0de  ! 421: STX_I	stx	%r28, [%r22 + 0x00de]
	.word 0xf8740000  ! 432: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xf2354000  ! 435: STH_R	sth	%r25, [%r21 + %r0]
	mov	0, %r12
	.word 0x8f930000  ! 438: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9504000  ! 441: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0x8794a14e  ! 442: WRPR_TT_I	wrpr	%r18, 0x014e, %tt
	.word 0xbd500000  ! 443: RDPR_TPC	rdpr	%tpc, %r30
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 21)
	.word 0x839421c1  ! 446: WRPR_TNPC_I	wrpr	%r16, 0x01c1, %tnpc
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 1c)
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 6)
	.word 0xba15603a  ! 453: OR_I	or 	%r21, 0x003a, %r29
	.word 0xb3500000  ! 454: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xf82c4000  ! 455: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xfa75e1ad  ! 456: STX_I	stx	%r29, [%r23 + 0x01ad]
	.word 0xf03521cb  ! 458: STH_I	sth	%r24, [%r20 + 0x01cb]
	.word 0xf53c8000  ! 459: STDF_R	std	%f26, [%r0, %r18]
	.word 0xfe3d61e9  ! 460: STD_I	std	%r31, [%r21 + 0x01e9]
	.word 0xb950c000  ! 462: RDPR_TT	<illegal instruction>
	.word 0xf6350000  ! 463: STH_R	sth	%r27, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf22c61fc  ! 466: STB_I	stb	%r25, [%r17 + 0x01fc]
	.word 0xb2c5201b  ! 469: ADDCcc_I	addccc 	%r20, 0x001b, %r25
	.word 0xf42c8000  ! 471: STB_R	stb	%r26, [%r18 + %r0]
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 22)
	.word 0xf03dc000  ! 479: STD_R	std	%r24, [%r23 + %r0]
	.word 0xb5518000  ! 481: RDPR_PSTATE	<illegal instruction>
	.word 0xfc7461ec  ! 483: STX_I	stx	%r30, [%r17 + 0x01ec]
	.word 0xf82de15c  ! 484: STB_I	stb	%r28, [%r23 + 0x015c]
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 1)
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 15)
	.word 0xf625a041  ! 489: STW_I	stw	%r27, [%r22 + 0x0041]
	.word 0xfa25e168  ! 491: STW_I	stw	%r29, [%r23 + 0x0168]
	.word 0xf8758000  ! 492: STX_R	stx	%r28, [%r22 + %r0]
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 14)
	.word 0xf635a0aa  ! 497: STH_I	sth	%r27, [%r22 + 0x00aa]
	.word 0x879561aa  ! 498: WRPR_TT_I	wrpr	%r21, 0x01aa, %tt
	mov	2, %r12
	.word 0xa1930000  ! 505: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfc356084  ! 507: STH_I	sth	%r30, [%r21 + 0x0084]
	.word 0xbb540000  ! 509: RDPR_GL	rdpr	%-, %r29
	.word 0xf33d8000  ! 511: STDF_R	std	%f25, [%r0, %r22]
	.word 0x8995608b  ! 512: WRPR_TICK_I	wrpr	%r21, 0x008b, %tick
	.word 0x8d952035  ! 514: WRPR_PSTATE_I	wrpr	%r20, 0x0035, %pstate
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 17)
	.word 0xf03c0000  ! 521: STD_R	std	%r24, [%r16 + %r0]
	.word 0xb2c5e13d  ! 522: ADDCcc_I	addccc 	%r23, 0x013d, %r25
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, d)
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 1)
	.word 0xf025c000  ! 530: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xb5500000  ! 537: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xf02cc000  ! 538: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xfc354000  ! 539: STH_R	sth	%r30, [%r21 + %r0]
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 31)
	setx	0xe68c95e300005cd5, %g1, %r10
	.word 0x819a8000  ! 541: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf63d219f  ! 542: STD_I	std	%r27, [%r20 + 0x019f]
	mov	2, %r12
	.word 0xa1930000  ! 547: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf2740000  ! 550: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xf23d206f  ! 557: STD_I	std	%r25, [%r20 + 0x006f]
	.word 0xfa2de0b6  ! 560: STB_I	stb	%r29, [%r23 + 0x00b6]
	.word 0xf03dc000  ! 562: STD_R	std	%r24, [%r23 + %r0]
	.word 0x83952022  ! 563: WRPR_TNPC_I	wrpr	%r20, 0x0022, %tnpc
	setx	data_start_4, %g1, %r19
	.word 0xbd2d8000  ! 568: SLL_R	sll 	%r22, %r0, %r30
	.word 0xf474a105  ! 572: STX_I	stx	%r26, [%r18 + 0x0105]
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, 1e)
	.word 0x8595e003  ! 576: WRPR_TSTATE_I	wrpr	%r23, 0x0003, %tstate
	.word 0xba25a198  ! 579: SUB_I	sub 	%r22, 0x0198, %r29
	.word 0xf6250000  ! 580: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xb43de13f  ! 583: XNOR_I	xnor 	%r23, 0x013f, %r26
	mov	1, %r12
	.word 0x8f930000  ! 584: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf024e07b  ! 586: STW_I	stw	%r24, [%r19 + 0x007b]
	.word 0xbb3d9000  ! 588: SRAX_R	srax	%r22, %r0, %r29
	.word 0xb150c000  ! 589: RDPR_TT	rdpr	%tt, %r24
	.word 0xbf343001  ! 593: SRLX_I	srlx	%r16, 0x0001, %r31
	.word 0xb61dc000  ! 594: XOR_R	xor 	%r23, %r0, %r27
	.word 0xbc9ce030  ! 598: XORcc_I	xorcc 	%r19, 0x0030, %r30
	.word 0xf2756044  ! 599: STX_I	stx	%r25, [%r21 + 0x0044]
	.word 0xf6740000  ! 600: STX_R	stx	%r27, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf43d4000  ! 603: STD_R	std	%r26, [%r21 + %r0]
	.word 0xfd3dc000  ! 604: STDF_R	std	%f30, [%r0, %r23]
	.word 0xf62c4000  ! 605: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf8248000  ! 607: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xf23ca1ee  ! 610: STD_I	std	%r25, [%r18 + 0x01ee]
	.word 0xb13d6001  ! 611: SRA_I	sra 	%r21, 0x0001, %r24
	.word 0xb4bdc000  ! 613: XNORcc_R	xnorcc 	%r23, %r0, %r26
	.word 0xf43d0000  ! 619: STD_R	std	%r26, [%r20 + %r0]
	.word 0xfa2de097  ! 622: STB_I	stb	%r29, [%r23 + 0x0097]
	.word 0xfa34c000  ! 624: STH_R	sth	%r29, [%r19 + %r0]
	.word 0xfe340000  ! 625: STH_R	sth	%r31, [%r16 + %r0]
	.word 0xb0344000  ! 627: SUBC_R	orn 	%r17, %r0, %r24
	.word 0xbd352001  ! 629: SRL_I	srl 	%r20, 0x0001, %r30
	setx	0x6031f47a00005ed6, %g1, %r10
	.word 0x839a8000  ! 632: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf8748000  ! 636: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xb08d6041  ! 638: ANDcc_I	andcc 	%r21, 0x0041, %r24
	.word 0xbc94a0a9  ! 641: ORcc_I	orcc 	%r18, 0x00a9, %r30
	.word 0xbcb4a167  ! 645: ORNcc_I	orncc 	%r18, 0x0167, %r30
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 13)
	.word 0xfc34e0fe  ! 648: STH_I	sth	%r30, [%r19 + 0x00fe]
	.word 0xb5500000  ! 649: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xf0752095  ! 651: STX_I	stx	%r24, [%r20 + 0x0095]
	.word 0xfe75612f  ! 654: STX_I	stx	%r31, [%r21 + 0x012f]
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 38)
	mov	2, %r12
	.word 0xa1930000  ! 660: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, a)
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 7)
	.word 0xf475a0f7  ! 667: STX_I	stx	%r26, [%r22 + 0x00f7]
	.word 0xf43da037  ! 669: STD_I	std	%r26, [%r22 + 0x0037]
	.word 0xbe3ce0e5  ! 672: XNOR_I	xnor 	%r19, 0x00e5, %r31
	setx	0x6bc16cba0000fe94, %g1, %r10
	.word 0x819a8000  ! 674: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf824e014  ! 684: STW_I	stw	%r28, [%r19 + 0x0014]
	.word 0xf2248000  ! 686: STW_R	stw	%r25, [%r18 + %r0]
	.word 0x8194e1ee  ! 690: WRPR_TPC_I	wrpr	%r19, 0x01ee, %tpc
	.word 0xb935e001  ! 691: SRL_I	srl 	%r23, 0x0001, %r28
	.word 0xf6254000  ! 693: STW_R	stw	%r27, [%r21 + %r0]
	.word 0x8d9421f4  ! 694: WRPR_PSTATE_I	wrpr	%r16, 0x01f4, %pstate
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 20)
	.word 0xf82de136  ! 700: STB_I	stb	%r28, [%r23 + 0x0136]
	.word 0xb28420f7  ! 702: ADDcc_I	addcc 	%r16, 0x00f7, %r25
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 0)
	.word 0x8194a085  ! 711: WRPR_TPC_I	wrpr	%r18, 0x0085, %tpc
	.word 0xbb643801  ! 712: MOVcc_I	<illegal instruction>
	.word 0xf624e0e0  ! 713: STW_I	stw	%r27, [%r19 + 0x00e0]
	.word 0xfe75604b  ! 715: STX_I	stx	%r31, [%r21 + 0x004b]
	.word 0xb0b40000  ! 716: ORNcc_R	orncc 	%r16, %r0, %r24
	.word 0x8394219a  ! 717: WRPR_TNPC_I	wrpr	%r16, 0x019a, %tnpc
	.word 0xfe75c000  ! 718: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xb3504000  ! 719: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xfc3d4000  ! 720: STD_R	std	%r30, [%r21 + %r0]
	.word 0xfa75e095  ! 721: STX_I	stx	%r29, [%r23 + 0x0095]
	.word 0xf634c000  ! 722: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xff3de12c  ! 723: STDF_I	std	%f31, [0x012c, %r23]
	.word 0xb5510000  ! 725: RDPR_TICK	<illegal instruction>
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfd3ca0e8  ! 730: STDF_I	std	%f30, [0x00e8, %r18]
	.word 0xfe24c000  ! 734: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xf93d2143  ! 738: STDF_I	std	%f28, [0x0143, %r20]
	.word 0xf82da11f  ! 739: STB_I	stb	%r28, [%r22 + 0x011f]
	.word 0xf33d0000  ! 740: STDF_R	std	%f25, [%r0, %r20]
	.word 0x9195a06d  ! 741: WRPR_PIL_I	wrpr	%r22, 0x006d, %pil
	.word 0xfa2c61fc  ! 743: STB_I	stb	%r29, [%r17 + 0x01fc]
	.word 0x87952093  ! 745: WRPR_TT_I	wrpr	%r20, 0x0093, %tt
	.word 0xb52c9000  ! 749: SLLX_R	sllx	%r18, %r0, %r26
	.word 0xfc748000  ! 751: STX_R	stx	%r30, [%r18 + %r0]
	setx	data_start_6, %g1, %r17
	.word 0x8794e0a2  ! 754: WRPR_TT_I	wrpr	%r19, 0x00a2, %tt
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, 21)
	.word 0xf4742035  ! 756: STX_I	stx	%r26, [%r16 + 0x0035]
	.word 0xb751c000  ! 760: RDPR_TL	rdpr	%tl, %r27
	setx	0xc51c75e900009d1a, %g1, %r10
	.word 0x839a8000  ! 761: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1480000  ! 762: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf275e05a  ! 765: STX_I	stx	%r25, [%r23 + 0x005a]
	.word 0xf03d4000  ! 766: STD_R	std	%r24, [%r21 + %r0]
	.word 0xfe244000  ! 772: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xf674a069  ! 773: STX_I	stx	%r27, [%r18 + 0x0069]
	.word 0xbe84e05b  ! 775: ADDcc_I	addcc 	%r19, 0x005b, %r31
	.word 0xfb3d61de  ! 776: STDF_I	std	%f29, [0x01de, %r21]
	.word 0xfd3c60b2  ! 780: STDF_I	std	%f30, [0x00b2, %r17]
	.word 0x8794e0cf  ! 781: WRPR_TT_I	wrpr	%r19, 0x00cf, %tt
	.word 0xf02d0000  ! 782: STB_R	stb	%r24, [%r20 + %r0]
	mov	1, %r12
	.word 0x8f930000  ! 785: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_41), 16, 16)) -> intp(3, 0, 2d)
	setx	0x4dfbb6990000ac83, %g1, %r10
	.word 0x819a8000  ! 788: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8395218a  ! 789: WRPR_TNPC_I	wrpr	%r20, 0x018a, %tnpc
	.word 0xf93dc000  ! 792: STDF_R	std	%f28, [%r0, %r23]
	.word 0xf2758000  ! 793: STX_R	stx	%r25, [%r22 + %r0]
	.word 0x8194a1ec  ! 794: WRPR_TPC_I	wrpr	%r18, 0x01ec, %tpc
	.word 0xf834a0af  ! 795: STH_I	sth	%r28, [%r18 + 0x00af]
	.word 0xba250000  ! 797: SUB_R	sub 	%r20, %r0, %r29
	.word 0xbe9c21b4  ! 799: XORcc_I	xorcc 	%r16, 0x01b4, %r31
	.word 0xb0948000  ! 800: ORcc_R	orcc 	%r18, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf73c4000  ! 806: STDF_R	std	%f27, [%r0, %r17]
hwintr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_42), 16, 16)) -> intp(3, 0, e)
	.word 0xf73da168  ! 808: STDF_I	std	%f27, [0x0168, %r22]
	.word 0xbd50c000  ! 809: RDPR_TT	rdpr	%tt, %r30
	.word 0xf4244000  ! 810: STW_R	stw	%r26, [%r17 + %r0]
hwintr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_43), 16, 16)) -> intp(3, 0, 14)
	.word 0x85946011  ! 813: WRPR_TSTATE_I	wrpr	%r17, 0x0011, %tstate
	.word 0xf8744000  ! 815: STX_R	stx	%r28, [%r17 + %r0]
	.word 0x8994a1d0  ! 817: WRPR_TICK_I	wrpr	%r18, 0x01d0, %tick
	setx	0x9d6602180000bbc8, %g1, %r10
	.word 0x839a8000  ! 818: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf03c0000  ! 824: STD_R	std	%r24, [%r16 + %r0]
	.word 0xbca520b4  ! 825: SUBcc_I	subcc 	%r20, 0x00b4, %r30
hwintr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_44), 16, 16)) -> intp(3, 0, 32)
	.word 0xf075a0d0  ! 830: STX_I	stx	%r24, [%r22 + 0x00d0]
	.word 0xfe24e028  ! 832: STW_I	stw	%r31, [%r19 + 0x0028]
	.word 0xb4b50000  ! 834: ORNcc_R	orncc 	%r20, %r0, %r26
	.word 0xf02d60c5  ! 836: STB_I	stb	%r24, [%r21 + 0x00c5]
	.word 0x8395e0b1  ! 838: WRPR_TNPC_I	wrpr	%r23, 0x00b1, %tnpc
	.word 0xb5520000  ! 840: RDPR_PIL	rdpr	%pil, %r26
	.word 0xf13c8000  ! 841: STDF_R	std	%f24, [%r0, %r18]
	.word 0xf675c000  ! 843: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xfe740000  ! 845: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xfa246005  ! 846: STW_I	stw	%r29, [%r17 + 0x0005]
hwintr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_45), 16, 16)) -> intp(3, 0, 10)
	.word 0xfa24a193  ! 854: STW_I	stw	%r29, [%r18 + 0x0193]
	.word 0xf8340000  ! 855: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xf834e09e  ! 863: STH_I	sth	%r28, [%r19 + 0x009e]
	.word 0xfe3c610f  ! 870: STD_I	std	%r31, [%r17 + 0x010f]
	.word 0xfc242012  ! 871: STW_I	stw	%r30, [%r16 + 0x0012]
	.word 0xfc2d0000  ! 872: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xbd3d1000  ! 873: SRAX_R	srax	%r20, %r0, %r30
	.word 0xb9340000  ! 874: SRL_R	srl 	%r16, %r0, %r28
	.word 0xfa75a131  ! 880: STX_I	stx	%r29, [%r22 + 0x0131]
	.word 0x8594a0ef  ! 882: WRPR_TSTATE_I	wrpr	%r18, 0x00ef, %tstate
	.word 0xf4348000  ! 884: STH_R	sth	%r26, [%r18 + %r0]
	.word 0xb2440000  ! 889: ADDC_R	addc 	%r16, %r0, %r25
	.word 0xf4348000  ! 890: STH_R	sth	%r26, [%r18 + %r0]
	.word 0xf474e005  ! 891: STX_I	stx	%r26, [%r19 + 0x0005]
	.word 0xfc254000  ! 892: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xb824e1bb  ! 895: SUB_I	sub 	%r19, 0x01bb, %r28
	.word 0xfa2d61ef  ! 896: STB_I	stb	%r29, [%r21 + 0x01ef]
hwintr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_46), 16, 16)) -> intp(3, 0, c)
	.word 0xf13ca0d0  ! 906: STDF_I	std	%f24, [0x00d0, %r18]
	.word 0xfa2ce0a3  ! 909: STB_I	stb	%r29, [%r19 + 0x00a3]
	.word 0xf42ce016  ! 912: STB_I	stb	%r26, [%r19 + 0x0016]
	.word 0xfe744000  ! 918: STX_R	stx	%r31, [%r17 + %r0]
hwintr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_47), 16, 16)) -> intp(3, 0, 18)
	.word 0xf2256105  ! 926: STW_I	stw	%r25, [%r21 + 0x0105]
	.word 0xff3c8000  ! 929: STDF_R	std	%f31, [%r0, %r18]
	.word 0x91942020  ! 933: WRPR_PIL_I	wrpr	%r16, 0x0020, %pil
	.word 0xf6754000  ! 935: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xf42c6170  ! 937: STB_I	stb	%r26, [%r17 + 0x0170]
hwintr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_48), 16, 16)) -> intp(3, 0, 32)
	.word 0xb350c000  ! 945: RDPR_TT	rdpr	%tt, %r25
	.word 0xf424a175  ! 949: STW_I	stw	%r26, [%r18 + 0x0175]
	.word 0x8594e13c  ! 952: WRPR_TSTATE_I	wrpr	%r19, 0x013c, %tstate
	.word 0xbf2d2001  ! 953: SLL_I	sll 	%r20, 0x0001, %r31
	.word 0xfe750000  ! 955: STX_R	stx	%r31, [%r20 + %r0]
hwintr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_49), 16, 16)) -> intp(3, 0, 22)
	.word 0xb350c000  ! 962: RDPR_TT	rdpr	%tt, %r25
	.word 0xfd3de0dc  ! 964: STDF_I	std	%f30, [0x00dc, %r23]
	.word 0xb8b5c000  ! 967: SUBCcc_R	orncc 	%r23, %r0, %r28
	.word 0xb5480000  ! 968: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	0x53631c2a00003b17, %g1, %r10
	.word 0x839a8000  ! 969: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb294616a  ! 970: ORcc_I	orcc 	%r17, 0x016a, %r25
	.word 0xbf500000  ! 972: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xf53d8000  ! 978: STDF_R	std	%f26, [%r0, %r22]
	.word 0xbb504000  ! 979: RDPR_TNPC	<illegal instruction>
	.word 0xbf500000  ! 982: RDPR_TPC	<illegal instruction>
	.word 0xf83ce0c5  ! 985: STD_I	std	%r28, [%r19 + 0x00c5]
	.word 0xb0a560e1  ! 986: SUBcc_I	subcc 	%r21, 0x00e1, %r24
	.word 0xbb540000  ! 988: RDPR_GL	<illegal instruction>
hwintr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_50), 16, 16)) -> intp(3, 0, 21)
	.word 0xb7540000  ! 993: RDPR_GL	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 996: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa3d2106  ! 998: STD_I	std	%r29, [%r20 + 0x0106]
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	setx	data_start_0, %g1, %r16
	setx	data_start_1, %g1, %r17
	setx	data_start_2, %g1, %r18
	setx	data_start_3, %g1, %r19
	setx	data_start_4, %g1, %r20
	setx	data_start_5, %g1, %r21
	setx	data_start_6, %g1, %r22
	setx	data_start_7, %g1, %r23
	.word 0xb62c21cb  ! 3: ANDN_I	andn 	%r16, 0x01cb, %r27
	.word 0xf00ce025  ! 5: LDUB_I	ldub	[%r19 + 0x0025], %r24
	.word 0xbb7c6401  ! 9: MOVR_I	movre	%r17, 0x1, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb495e0ef  ! 26: ORcc_I	orcc 	%r23, 0x00ef, %r26
	.word 0xb02ce1f9  ! 27: ANDN_I	andn 	%r19, 0x01f9, %r24
	.word 0xb1510000  ! 28: RDPR_TICK	<illegal instruction>
	.word 0xb5480000  ! 29: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf4544000  ! 31: LDSH_R	ldsh	[%r17 + %r0], %r26
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 0)
	.word 0xbc9ce1c2  ! 34: XORcc_I	xorcc 	%r19, 0x01c2, %r30
	.word 0xf054a1c5  ! 35: LDSH_I	ldsh	[%r18 + 0x01c5], %r24
	.word 0xfa0d0000  ! 40: LDUB_R	ldub	[%r20 + %r0], %r29
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, d)
	mov	0, %r12
	.word 0xa1930000  ! 44: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 19)
	.word 0xf25420f0  ! 47: LDSH_I	ldsh	[%r16 + 0x00f0], %r25
	.word 0xbf51c000  ! 50: RDPR_TL	<illegal instruction>
	.word 0xf6454000  ! 51: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xf60c8000  ! 52: LDUB_R	ldub	[%r18 + %r0], %r27
	.word 0xbaade0f8  ! 53: ANDNcc_I	andncc 	%r23, 0x00f8, %r29
	.word 0xfa0d0000  ! 54: LDUB_R	ldub	[%r20 + %r0], %r29
	.word 0xb37de401  ! 57: MOVR_I	movre	%r23, 0x1, %r25
	.word 0xfc44e0c6  ! 59: LDSW_I	ldsw	[%r19 + 0x00c6], %r30
	.word 0x81956046  ! 60: WRPR_TPC_I	wrpr	%r21, 0x0046, %tpc
	setx	data_start_7, %g1, %r17
	.word 0xbc25a195  ! 65: SUB_I	sub 	%r22, 0x0195, %r30
	.word 0xfe1ce191  ! 67: LDD_I	ldd	[%r19 + 0x0191], %r31
	.word 0xfc0c217c  ! 70: LDUB_I	ldub	[%r16 + 0x017c], %r30
	.word 0xbf3c6001  ! 71: SRA_I	sra 	%r17, 0x0001, %r31
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, d)
	.word 0x8994612a  ! 85: WRPR_TICK_I	wrpr	%r17, 0x012a, %tick
	.word 0xb40d4000  ! 86: AND_R	and 	%r21, %r0, %r26
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 25)
	setx	0x8925bb6500007d9c, %g1, %r10
	.word 0x819a8000  ! 89: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 2e)
	.word 0x8394e096  ! 102: WRPR_TNPC_I	wrpr	%r19, 0x0096, %tnpc
	.word 0xf41c619c  ! 103: LDD_I	ldd	[%r17 + 0x019c], %r26
	.word 0xf00cc000  ! 104: LDUB_R	ldub	[%r19 + %r0], %r24
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 3c)
	.word 0xfa1ca0dd  ! 109: LDD_I	ldd	[%r18 + 0x00dd], %r29
	.word 0x8395a14d  ! 110: WRPR_TNPC_I	wrpr	%r22, 0x014d, %tnpc
	.word 0xf65da1ec  ! 112: LDX_I	ldx	[%r22 + 0x01ec], %r27
	.word 0xf60d2026  ! 117: LDUB_I	ldub	[%r20 + 0x0026], %r27
	.word 0xf11c618b  ! 120: LDDF_I	ldd	[%r17, 0x018b], %f24
	.word 0x8594e1f7  ! 121: WRPR_TSTATE_I	wrpr	%r19, 0x01f7, %tstate
	.word 0x919421f6  ! 122: WRPR_PIL_I	wrpr	%r16, 0x01f6, %pil
	.word 0xbc250000  ! 126: SUB_R	sub 	%r20, %r0, %r30
	.word 0xf85c8000  ! 128: LDX_R	ldx	[%r18 + %r0], %r28
	setx	0xd45e8f1f00001d4c, %g1, %r10
	.word 0x839a8000  ! 130: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8994a0ed  ! 132: WRPR_TICK_I	wrpr	%r18, 0x00ed, %tick
	.word 0xb350c000  ! 140: RDPR_TT	<illegal instruction>
	.word 0xbf3dc000  ! 141: SRA_R	sra 	%r23, %r0, %r31
	.word 0xf655c000  ! 142: LDSH_R	ldsh	[%r23 + %r0], %r27
	.word 0x8994a0c8  ! 143: WRPR_TICK_I	wrpr	%r18, 0x00c8, %tick
	.word 0xf71ca193  ! 145: LDDF_I	ldd	[%r18, 0x0193], %f27
	.word 0xfe0420ae  ! 148: LDUW_I	lduw	[%r16 + 0x00ae], %r31
	.word 0x81952057  ! 149: WRPR_TPC_I	wrpr	%r20, 0x0057, %tpc
	.word 0xf644c000  ! 152: LDSW_R	ldsw	[%r19 + %r0], %r27
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 25)
	.word 0xf6452157  ! 155: LDSW_I	ldsw	[%r20 + 0x0157], %r27
	.word 0xfe4c8000  ! 157: LDSB_R	ldsb	[%r18 + %r0], %r31
	.word 0xf41c0000  ! 158: LDD_R	ldd	[%r16 + %r0], %r26
	.word 0xb605e13b  ! 159: ADD_I	add 	%r23, 0x013b, %r27
	.word 0xfe0d208e  ! 160: LDUB_I	ldub	[%r20 + 0x008e], %r31
	setx	0xa6a6fa930000da42, %g1, %r10
	.word 0x839a8000  ! 162: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb2bd2149  ! 163: XNORcc_I	xnorcc 	%r20, 0x0149, %r25
	.word 0x8d94e13d  ! 165: WRPR_PSTATE_I	wrpr	%r19, 0x013d, %pstate
	.word 0x8d9520ec  ! 167: WRPR_PSTATE_I	wrpr	%r20, 0x00ec, %pstate
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf614e0d1  ! 173: LDUH_I	lduh	[%r19 + 0x00d1], %r27
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 0)
	.word 0xf604a0e3  ! 178: LDUW_I	lduw	[%r18 + 0x00e3], %r27
	.word 0xfe4cc000  ! 182: LDSB_R	ldsb	[%r19 + %r0], %r31
	.word 0xbd51c000  ! 184: RDPR_TL	<illegal instruction>
	.word 0xf2054000  ! 186: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0x91956006  ! 187: WRPR_PIL_I	wrpr	%r21, 0x0006, %pil
	.word 0xff1dc000  ! 194: LDDF_R	ldd	[%r23, %r0], %f31
	.word 0x8d956188  ! 196: WRPR_PSTATE_I	wrpr	%r21, 0x0188, %pstate
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 31)
	.word 0xfa54c000  ! 200: LDSH_R	ldsh	[%r19 + %r0], %r29
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 1c)
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, c)
	.word 0xba144000  ! 207: OR_R	or 	%r17, %r0, %r29
	.word 0xf41460ea  ! 210: LDUH_I	lduh	[%r17 + 0x00ea], %r26
	.word 0xf91c8000  ! 213: LDDF_R	ldd	[%r18, %r0], %f28
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, a)
	.word 0xb3508000  ! 221: RDPR_TSTATE	<illegal instruction>
	.word 0xf00ce034  ! 223: LDUB_I	ldub	[%r19 + 0x0034], %r24
	.word 0xf65dc000  ! 225: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0xf24420f4  ! 226: LDSW_I	ldsw	[%r16 + 0x00f4], %r25
	.word 0xff1ca19e  ! 229: LDDF_I	ldd	[%r18, 0x019e], %f31
	.word 0xfa4c4000  ! 232: LDSB_R	ldsb	[%r17 + %r0], %r29
	.word 0xfe540000  ! 235: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0xf31dc000  ! 237: LDDF_R	ldd	[%r23, %r0], %f25
	.word 0xb1508000  ! 241: RDPR_TSTATE	<illegal instruction>
	.word 0xbf50c000  ! 242: RDPR_TT	<illegal instruction>
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 33)
	.word 0xf80c61dd  ! 244: LDUB_I	ldub	[%r17 + 0x01dd], %r28
	.word 0xb9500000  ! 246: RDPR_TPC	<illegal instruction>
	.word 0xbd520000  ! 250: RDPR_PIL	<illegal instruction>
	.word 0xfc5521fd  ! 252: LDSH_I	ldsh	[%r20 + 0x01fd], %r30
	.word 0xf20c20a1  ! 253: LDUB_I	ldub	[%r16 + 0x00a1], %r25
	.word 0xf45c4000  ! 254: LDX_R	ldx	[%r17 + %r0], %r26
	.word 0xfa0c8000  ! 255: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xbb50c000  ! 256: RDPR_TT	<illegal instruction>
	.word 0x8194a133  ! 257: WRPR_TPC_I	wrpr	%r18, 0x0133, %tpc
	.word 0xba1d4000  ! 258: XOR_R	xor 	%r21, %r0, %r29
	mov	1, %r12
	.word 0x8f930000  ! 259: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbf510000  ! 260: RDPR_TICK	<illegal instruction>
	.word 0xfd1da157  ! 264: LDDF_I	ldd	[%r22, 0x0157], %f30
	.word 0xb13c2001  ! 266: SRA_I	sra 	%r16, 0x0001, %r24
	.word 0xb92ce001  ! 267: SLL_I	sll 	%r19, 0x0001, %r28
	.word 0xf804a0a2  ! 270: LDUW_I	lduw	[%r18 + 0x00a2], %r28
	.word 0xfe44e09c  ! 272: LDSW_I	ldsw	[%r19 + 0x009c], %r31
	.word 0x8d9460d9  ! 273: WRPR_PSTATE_I	wrpr	%r17, 0x00d9, %pstate
	.word 0xf0048000  ! 275: LDUW_R	lduw	[%r18 + %r0], %r24
	.word 0xf25ca165  ! 276: LDX_I	ldx	[%r18 + 0x0165], %r25
	.word 0xfa542056  ! 282: LDSH_I	ldsh	[%r16 + 0x0056], %r29
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 36)
	.word 0xf40ce147  ! 287: LDUB_I	ldub	[%r19 + 0x0147], %r26
	.word 0x8995a0d7  ! 289: WRPR_TICK_I	wrpr	%r22, 0x00d7, %tick
	.word 0x8195215b  ! 291: WRPR_TPC_I	wrpr	%r20, 0x015b, %tpc
	.word 0x8794210c  ! 292: WRPR_TT_I	wrpr	%r16, 0x010c, %tt
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, 17)
	.word 0xbb510000  ! 303: RDPR_TICK	<illegal instruction>
	.word 0xf804e0f9  ! 305: LDUW_I	lduw	[%r19 + 0x00f9], %r28
	.word 0xf80c2121  ! 308: LDUB_I	ldub	[%r16 + 0x0121], %r28
	.word 0x819421e0  ! 309: WRPR_TPC_I	wrpr	%r16, 0x01e0, %tpc
	.word 0xb69d4000  ! 313: XORcc_R	xorcc 	%r21, %r0, %r27
	.word 0xbd504000  ! 315: RDPR_TNPC	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 317: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf444e172  ! 318: LDSW_I	ldsw	[%r19 + 0x0172], %r26
	.word 0xbd504000  ! 320: RDPR_TNPC	<illegal instruction>
	.word 0xfc54a1f7  ! 324: LDSH_I	ldsh	[%r18 + 0x01f7], %r30
	.word 0xfa044000  ! 329: LDUW_R	lduw	[%r17 + %r0], %r29
	.word 0xf054c000  ! 330: LDSH_R	ldsh	[%r19 + %r0], %r24
	.word 0x87952166  ! 333: WRPR_TT_I	wrpr	%r20, 0x0166, %tt
	.word 0xbd50c000  ! 335: RDPR_TT	<illegal instruction>
	.word 0xf04d4000  ! 336: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xfa44c000  ! 339: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0xfa044000  ! 340: LDUW_R	lduw	[%r17 + %r0], %r29
	.word 0xf6058000  ! 342: LDUW_R	lduw	[%r22 + %r0], %r27
	.word 0xb20dc000  ! 347: AND_R	and 	%r23, %r0, %r25
	.word 0xbf2c9000  ! 349: SLLX_R	sllx	%r18, %r0, %r31
	.word 0x8394a0b3  ! 352: WRPR_TNPC_I	wrpr	%r18, 0x00b3, %tnpc
	.word 0xfc454000  ! 354: LDSW_R	ldsw	[%r21 + %r0], %r30
	.word 0xf60c0000  ! 357: LDUB_R	ldub	[%r16 + %r0], %r27
	.word 0xfc144000  ! 362: LDUH_R	lduh	[%r17 + %r0], %r30
	.word 0xfe5d4000  ! 373: LDX_R	ldx	[%r21 + %r0], %r31
	.word 0xf41da1da  ! 374: LDD_I	ldd	[%r22 + 0x01da], %r26
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 10)
	setx	data_start_2, %g1, %r18
	.word 0xf91c2058  ! 382: LDDF_I	ldd	[%r16, 0x0058], %f28
	.word 0x85952088  ! 384: WRPR_TSTATE_I	wrpr	%r20, 0x0088, %tstate
	.word 0xfe04610f  ! 385: LDUW_I	lduw	[%r17 + 0x010f], %r31
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 1a)
	setx	data_start_7, %g1, %r21
	.word 0xbd504000  ! 390: RDPR_TNPC	<illegal instruction>
	.word 0xb351c000  ! 392: RDPR_TL	<illegal instruction>
	.word 0xb8b52058  ! 396: ORNcc_I	orncc 	%r20, 0x0058, %r28
	.word 0xfe4d6131  ! 399: LDSB_I	ldsb	[%r21 + 0x0131], %r31
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 32)
	.word 0xfb1de034  ! 409: LDDF_I	ldd	[%r23, 0x0034], %f29
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfa1d0000  ! 413: LDD_R	ldd	[%r20 + %r0], %r29
	.word 0x85946027  ! 414: WRPR_TSTATE_I	wrpr	%r17, 0x0027, %tstate
	.word 0xbd51c000  ! 418: RDPR_TL	rdpr	%tl, %r30
	.word 0xf0458000  ! 422: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xfe15c000  ! 427: LDUH_R	lduh	[%r23 + %r0], %r31
	.word 0xf85c6019  ! 428: LDX_I	ldx	[%r17 + 0x0019], %r28
	.word 0xf05c4000  ! 434: LDX_R	ldx	[%r17 + %r0], %r24
	.word 0xfa044000  ! 437: LDUW_R	lduw	[%r17 + %r0], %r29
	mov	1, %r12
	.word 0x8f930000  ! 438: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa05c000  ! 440: LDUW_R	lduw	[%r23 + %r0], %r29
	.word 0xb5504000  ! 441: RDPR_TNPC	<illegal instruction>
	.word 0x87942083  ! 442: WRPR_TT_I	wrpr	%r16, 0x0083, %tt
	.word 0xbd500000  ! 443: RDPR_TPC	<illegal instruction>
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 5)
	.word 0x8395a0ab  ! 446: WRPR_TNPC_I	wrpr	%r22, 0x00ab, %tnpc
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 21)
	.word 0xff1d4000  ! 449: LDDF_R	ldd	[%r21, %r0], %f31
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, c)
	.word 0xb015e168  ! 453: OR_I	or 	%r23, 0x0168, %r24
	.word 0xbb500000  ! 454: RDPR_TPC	<illegal instruction>
	.word 0xfa4dc000  ! 461: LDSB_R	ldsb	[%r23 + %r0], %r29
	.word 0xb350c000  ! 462: RDPR_TT	<illegal instruction>
	.word 0xf4150000  ! 464: LDUH_R	lduh	[%r20 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb4c461a7  ! 469: ADDCcc_I	addccc 	%r17, 0x01a7, %r26
	.word 0xfe554000  ! 470: LDSH_R	ldsh	[%r21 + %r0], %r31
	.word 0xf0158000  ! 472: LDUH_R	lduh	[%r22 + %r0], %r24
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 22)
	.word 0xb9518000  ! 481: RDPR_PSTATE	<illegal instruction>
	.word 0xf84c8000  ! 482: LDSB_R	ldsb	[%r18 + %r0], %r28
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf11cc000  ! 486: LDDF_R	ldd	[%r19, %r0], %f24
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 2)
	.word 0xfe554000  ! 494: LDSH_R	ldsh	[%r21 + %r0], %r31
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, 3c)
	.word 0x8795e088  ! 498: WRPR_TT_I	wrpr	%r23, 0x0088, %tt
	.word 0xf01d21d9  ! 502: LDD_I	ldd	[%r20 + 0x01d9], %r24
	.word 0xf20c4000  ! 504: LDUB_R	ldub	[%r17 + %r0], %r25
	mov	0, %r12
	.word 0xa1930000  ! 505: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbf540000  ! 509: RDPR_GL	<illegal instruction>
	.word 0xf015e101  ! 510: LDUH_I	lduh	[%r23 + 0x0101], %r24
	.word 0x8994a06e  ! 512: WRPR_TICK_I	wrpr	%r18, 0x006e, %tick
	.word 0x8d942193  ! 514: WRPR_PSTATE_I	wrpr	%r16, 0x0193, %pstate
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 38)
	.word 0xb0c5e196  ! 522: ADDCcc_I	addccc 	%r23, 0x0196, %r24
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 25)
	.word 0xf005c000  ! 524: LDUW_R	lduw	[%r23 + %r0], %r24
	.word 0xfa5c8000  ! 525: LDX_R	ldx	[%r18 + %r0], %r29
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 12)
	.word 0xf81d2060  ! 529: LDD_I	ldd	[%r20 + 0x0060], %r28
	.word 0xf85c604b  ! 531: LDX_I	ldx	[%r17 + 0x004b], %r28
	.word 0xf61dc000  ! 532: LDD_R	ldd	[%r23 + %r0], %r27
	.word 0xfc14c000  ! 536: LDUH_R	lduh	[%r19 + %r0], %r30
	.word 0xbf500000  ! 537: RDPR_TPC	<illegal instruction>
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 32)
	setx	0x221d0b5400003d00, %g1, %r10
	.word 0x819a8000  ! 541: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf11d0000  ! 544: LDDF_R	ldd	[%r20, %r0], %f24
	mov	1, %r12
	.word 0xa1930000  ! 547: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf415e13b  ! 549: LDUH_I	lduh	[%r23 + 0x013b], %r26
	.word 0xf2452066  ! 551: LDSW_I	ldsw	[%r20 + 0x0066], %r25
	.word 0xfc544000  ! 552: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xf05c608d  ! 555: LDX_I	ldx	[%r17 + 0x008d], %r24
	.word 0xfe544000  ! 556: LDSH_R	ldsh	[%r17 + %r0], %r31
	.word 0xfc5d60e1  ! 559: LDX_I	ldx	[%r21 + 0x00e1], %r30
	.word 0x83952051  ! 563: WRPR_TNPC_I	wrpr	%r20, 0x0051, %tnpc
	setx	data_start_6, %g1, %r22
	.word 0xb32d4000  ! 568: SLL_R	sll 	%r21, %r0, %r25
	.word 0xf4056070  ! 571: LDUW_I	lduw	[%r21 + 0x0070], %r26
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 31)
	.word 0x859460bc  ! 576: WRPR_TSTATE_I	wrpr	%r17, 0x00bc, %tstate
	.word 0xf51de0be  ! 578: LDDF_I	ldd	[%r23, 0x00be], %f26
	.word 0xb62461ab  ! 579: SUB_I	sub 	%r17, 0x01ab, %r27
	.word 0xb03d21ef  ! 583: XNOR_I	xnor 	%r20, 0x01ef, %r24
	mov	2, %r12
	.word 0x8f930000  ! 584: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb93cd000  ! 588: SRAX_R	srax	%r19, %r0, %r28
	.word 0xb750c000  ! 589: RDPR_TT	<illegal instruction>
	.word 0xf81c8000  ! 590: LDD_R	ldd	[%r18 + %r0], %r28
	.word 0xb534f001  ! 593: SRLX_I	srlx	%r19, 0x0001, %r26
	.word 0xb81dc000  ! 594: XOR_R	xor 	%r23, %r0, %r28
	.word 0xba9c213f  ! 598: XORcc_I	xorcc 	%r16, 0x013f, %r29
	.word 0xf204c000  ! 601: LDUW_R	lduw	[%r19 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb33ce001  ! 611: SRA_I	sra 	%r19, 0x0001, %r25
	.word 0xbabcc000  ! 613: XNORcc_R	xnorcc 	%r19, %r0, %r29
	.word 0xf0558000  ! 615: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xf44da0bd  ! 618: LDSB_I	ldsb	[%r22 + 0x00bd], %r26
	.word 0xf00de054  ! 620: LDUB_I	ldub	[%r23 + 0x0054], %r24
	.word 0xbe35c000  ! 627: SUBC_R	orn 	%r23, %r0, %r31
	.word 0xfe0d8000  ! 628: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xb535e001  ! 629: SRL_I	srl 	%r23, 0x0001, %r26
	.word 0xfa4d4000  ! 630: LDSB_R	ldsb	[%r21 + %r0], %r29
	setx	0xc312bab90000ef0a, %g1, %r10
	.word 0x839a8000  ! 632: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf44c2192  ! 635: LDSB_I	ldsb	[%r16 + 0x0192], %r26
	.word 0xb28c6106  ! 638: ANDcc_I	andcc 	%r17, 0x0106, %r25
	.word 0xb0956073  ! 641: ORcc_I	orcc 	%r21, 0x0073, %r24
	.word 0xf20d8000  ! 643: LDUB_R	ldub	[%r22 + %r0], %r25
	.word 0xbeb42137  ! 645: ORNcc_I	orncc 	%r16, 0x0137, %r31
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 37)
	.word 0xf8458000  ! 647: LDSW_R	ldsw	[%r22 + %r0], %r28
	.word 0xbd500000  ! 649: RDPR_TPC	<illegal instruction>
	.word 0xfc0c61dd  ! 652: LDUB_I	ldub	[%r17 + 0x01dd], %r30
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf25c0000  ! 658: LDX_R	ldx	[%r16 + %r0], %r25
	.word 0xf04ce03e  ! 659: LDSB_I	ldsb	[%r19 + 0x003e], %r24
	mov	1, %r12
	.word 0xa1930000  ! 660: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf655a0e4  ! 661: LDSH_I	ldsh	[%r22 + 0x00e4], %r27
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfa444000  ! 664: LDSW_R	ldsw	[%r17 + %r0], %r29
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 21)
	.word 0xf00d2170  ! 668: LDUB_I	ldub	[%r20 + 0x0170], %r24
	.word 0xf8040000  ! 671: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xb03de136  ! 672: XNOR_I	xnor 	%r23, 0x0136, %r24
	.word 0xf415613d  ! 673: LDUH_I	lduh	[%r21 + 0x013d], %r26
	setx	0x6baf68aa00008c1a, %g1, %r10
	.word 0x819a8000  ! 674: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf2548000  ! 679: LDSH_R	ldsh	[%r18 + %r0], %r25
	.word 0xf71d8000  ! 680: LDDF_R	ldd	[%r22, %r0], %f27
	.word 0x8194e12c  ! 690: WRPR_TPC_I	wrpr	%r19, 0x012c, %tpc
	.word 0xb534e001  ! 691: SRL_I	srl 	%r19, 0x0001, %r26
	.word 0x8d9461e1  ! 694: WRPR_PSTATE_I	wrpr	%r17, 0x01e1, %pstate
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 11)
	.word 0xf8044000  ! 697: LDUW_R	lduw	[%r17 + %r0], %r28
	.word 0xfa542043  ! 701: LDSH_I	ldsh	[%r16 + 0x0043], %r29
	.word 0xb484619e  ! 702: ADDcc_I	addcc 	%r17, 0x019e, %r26
	.word 0xf60d0000  ! 703: LDUB_R	ldub	[%r20 + %r0], %r27
	.word 0xf24d0000  ! 707: LDSB_R	ldsb	[%r20 + %r0], %r25
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, 19)
	.word 0x8195e1a5  ! 711: WRPR_TPC_I	wrpr	%r23, 0x01a5, %tpc
	.word 0xbb643801  ! 712: MOVcc_I	<illegal instruction>
	.word 0xbcb50000  ! 716: ORNcc_R	orncc 	%r20, %r0, %r30
	.word 0x83942122  ! 717: WRPR_TNPC_I	wrpr	%r16, 0x0122, %tnpc
	.word 0xb7504000  ! 719: RDPR_TNPC	<illegal instruction>
	.word 0xbf510000  ! 725: RDPR_TICK	<illegal instruction>
	.word 0xf05da057  ! 728: LDX_I	ldx	[%r22 + 0x0057], %r24
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 39)
	.word 0x9194a178  ! 741: WRPR_PIL_I	wrpr	%r18, 0x0178, %pil
	.word 0x8795200c  ! 745: WRPR_TT_I	wrpr	%r20, 0x000c, %tt
	.word 0xf8544000  ! 747: LDSH_R	ldsh	[%r17 + %r0], %r28
	.word 0xb92c5000  ! 749: SLLX_R	sllx	%r17, %r0, %r28
	setx	data_start_2, %g1, %r23
	.word 0x8795a1c9  ! 754: WRPR_TT_I	wrpr	%r22, 0x01c9, %tt
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, 14)
	.word 0xf80de035  ! 759: LDUB_I	ldub	[%r23 + 0x0035], %r28
	.word 0xb551c000  ! 760: RDPR_TL	<illegal instruction>
	setx	0x951a37fa00000a05, %g1, %r10
	.word 0x839a8000  ! 761: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbf480000  ! 762: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf844a0a9  ! 764: LDSW_I	ldsw	[%r18 + 0x00a9], %r28
	.word 0xff1de1a7  ! 767: LDDF_I	ldd	[%r23, 0x01a7], %f31
	.word 0xf204c000  ! 774: LDUW_R	lduw	[%r19 + %r0], %r25
	.word 0xb48460dd  ! 775: ADDcc_I	addcc 	%r17, 0x00dd, %r26
	.word 0xfa0521c6  ! 779: LDUW_I	lduw	[%r20 + 0x01c6], %r29
	.word 0x87946015  ! 781: WRPR_TT_I	wrpr	%r17, 0x0015, %tt
	.word 0xf055c000  ! 783: LDSH_R	ldsh	[%r23 + %r0], %r24
	.word 0xfc058000  ! 784: LDUW_R	lduw	[%r22 + %r0], %r30
	mov	0, %r12
	.word 0x8f930000  ! 785: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_41), 16, 16)) -> intp(2, 0, 30)
	setx	0x36727f6000004b43, %g1, %r10
	.word 0x819a8000  ! 788: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8394a07b  ! 789: WRPR_TNPC_I	wrpr	%r18, 0x007b, %tnpc
	.word 0xf05d20ec  ! 790: LDX_I	ldx	[%r20 + 0x00ec], %r24
	.word 0xf855e1b7  ! 791: LDSH_I	ldsh	[%r23 + 0x01b7], %r28
	.word 0x8194e000  ! 794: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xfa0d206e  ! 796: LDUB_I	ldub	[%r20 + 0x006e], %r29
	.word 0xb8258000  ! 797: SUB_R	sub 	%r22, %r0, %r28
	.word 0xf05421e3  ! 798: LDSH_I	ldsh	[%r16 + 0x01e3], %r24
	.word 0xbe9da14a  ! 799: XORcc_I	xorcc 	%r22, 0x014a, %r31
	.word 0xb2950000  ! 800: ORcc_R	orcc 	%r20, %r0, %r25
	.word 0xfe4c2073  ! 801: LDSB_I	ldsb	[%r16 + 0x0073], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf85d0000  ! 804: LDX_R	ldx	[%r20 + %r0], %r28
	.word 0xf41520e8  ! 805: LDUH_I	lduh	[%r20 + 0x00e8], %r26
hwintr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_42), 16, 16)) -> intp(2, 0, 4)
	.word 0xb350c000  ! 809: RDPR_TT	<illegal instruction>
hwintr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_43), 16, 16)) -> intp(2, 0, 2)
	.word 0x8594a0f8  ! 813: WRPR_TSTATE_I	wrpr	%r18, 0x00f8, %tstate
	.word 0x899561ae  ! 817: WRPR_TICK_I	wrpr	%r21, 0x01ae, %tick
	setx	0x9788d42300003a80, %g1, %r10
	.word 0x839a8000  ! 818: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa15e1e5  ! 819: LDUH_I	lduh	[%r23 + 0x01e5], %r29
	.word 0xfc440000  ! 820: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0xbaa4615c  ! 825: SUBcc_I	subcc 	%r17, 0x015c, %r29
	.word 0xf0144000  ! 827: LDUH_R	lduh	[%r17 + %r0], %r24
	.word 0xf0148000  ! 828: LDUH_R	lduh	[%r18 + %r0], %r24
hwintr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_44), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf84560ad  ! 831: LDSW_I	ldsw	[%r21 + 0x00ad], %r28
	.word 0xb8b54000  ! 834: ORNcc_R	orncc 	%r21, %r0, %r28
	.word 0xfc5c609e  ! 835: LDX_I	ldx	[%r17 + 0x009e], %r30
	.word 0x8394e155  ! 838: WRPR_TNPC_I	wrpr	%r19, 0x0155, %tnpc
	.word 0xb3520000  ! 840: RDPR_PIL	<illegal instruction>
	.word 0xfc058000  ! 847: LDUW_R	lduw	[%r22 + %r0], %r30
	.word 0xfc04e016  ! 849: LDUW_I	lduw	[%r19 + 0x0016], %r30
	.word 0xf41da113  ! 850: LDD_I	ldd	[%r22 + 0x0113], %r26
hwintr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_45), 16, 16)) -> intp(2, 0, 13)
	.word 0xfe0c2037  ! 853: LDUB_I	ldub	[%r16 + 0x0037], %r31
	.word 0xfe55a05c  ! 856: LDSH_I	ldsh	[%r22 + 0x005c], %r31
	.word 0xf2458000  ! 859: LDSW_R	ldsw	[%r22 + %r0], %r25
	.word 0xf00421cb  ! 862: LDUW_I	lduw	[%r16 + 0x01cb], %r24
	.word 0xf855e1cc  ! 865: LDSH_I	ldsh	[%r23 + 0x01cc], %r28
	.word 0xfc4d20aa  ! 867: LDSB_I	ldsb	[%r20 + 0x00aa], %r30
	.word 0xf00dc000  ! 868: LDUB_R	ldub	[%r23 + %r0], %r24
	.word 0xbd3c5000  ! 873: SRAX_R	srax	%r17, %r0, %r30
	.word 0xb734c000  ! 874: SRL_R	srl 	%r19, %r0, %r27
	.word 0xf4448000  ! 881: LDSW_R	ldsw	[%r18 + %r0], %r26
	.word 0x859560a5  ! 882: WRPR_TSTATE_I	wrpr	%r21, 0x00a5, %tstate
	.word 0xbc440000  ! 889: ADDC_R	addc 	%r16, %r0, %r30
	.word 0xfc158000  ! 893: LDUH_R	lduh	[%r22 + %r0], %r30
	.word 0xfa44e03a  ! 894: LDSW_I	ldsw	[%r19 + 0x003a], %r29
	.word 0xb6242035  ! 895: SUB_I	sub 	%r16, 0x0035, %r27
hwintr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_46), 16, 16)) -> intp(2, 0, 26)
	.word 0xf0054000  ! 904: LDUW_R	lduw	[%r21 + %r0], %r24
	.word 0xfc548000  ! 905: LDSH_R	ldsh	[%r18 + %r0], %r30
	.word 0xfa440000  ! 911: LDSW_R	ldsw	[%r16 + %r0], %r29
	.word 0xfa44c000  ! 914: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0xfc5da0c9  ! 916: LDX_I	ldx	[%r22 + 0x00c9], %r30
	.word 0xfc5d8000  ! 920: LDX_R	ldx	[%r22 + %r0], %r30
hwintr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_47), 16, 16)) -> intp(2, 0, 1f)
	.word 0xfe144000  ! 922: LDUH_R	lduh	[%r17 + %r0], %r31
	.word 0xfa0cc000  ! 928: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0x919561d6  ! 933: WRPR_PIL_I	wrpr	%r21, 0x01d6, %pil
	.word 0xf815c000  ! 934: LDUH_R	lduh	[%r23 + %r0], %r28
hwintr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_48), 16, 16)) -> intp(2, 0, 16)
	.word 0xfc05616b  ! 943: LDUW_I	lduw	[%r21 + 0x016b], %r30
	.word 0xf20de131  ! 944: LDUB_I	ldub	[%r23 + 0x0131], %r25
	.word 0xbb50c000  ! 945: RDPR_TT	<illegal instruction>
	.word 0xf31cc000  ! 947: LDDF_R	ldd	[%r19, %r0], %f25
	.word 0xf84d4000  ! 948: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0x8594e06e  ! 952: WRPR_TSTATE_I	wrpr	%r19, 0x006e, %tstate
	.word 0xbb2d6001  ! 953: SLL_I	sll 	%r21, 0x0001, %r29
	.word 0xfc14c000  ! 954: LDUH_R	lduh	[%r19 + %r0], %r30
hwintr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_49), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf8158000  ! 957: LDUH_R	lduh	[%r22 + %r0], %r28
	.word 0xb550c000  ! 962: RDPR_TT	<illegal instruction>
	.word 0xfe4ca01b  ! 965: LDSB_I	ldsb	[%r18 + 0x001b], %r31
	.word 0xbcb58000  ! 967: SUBCcc_R	orncc 	%r22, %r0, %r30
	.word 0xb1480000  ! 968: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x30205e9e0000fd42, %g1, %r10
	.word 0x839a8000  ! 969: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb8952169  ! 970: ORcc_I	orcc 	%r20, 0x0169, %r28
	.word 0xb7500000  ! 972: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xf05d4000  ! 973: LDX_R	ldx	[%r21 + %r0], %r24
	.word 0xf00d20e3  ! 976: LDUB_I	ldub	[%r20 + 0x00e3], %r24
	.word 0xb9504000  ! 979: RDPR_TNPC	<illegal instruction>
	.word 0xf84d8000  ! 980: LDSB_R	ldsb	[%r22 + %r0], %r28
	.word 0xbb500000  ! 982: RDPR_TPC	<illegal instruction>
	.word 0xfa158000  ! 983: LDUH_R	lduh	[%r22 + %r0], %r29
	.word 0xbaa5a1a0  ! 986: SUBcc_I	subcc 	%r22, 0x01a0, %r29
	.word 0xb5540000  ! 988: RDPR_GL	<illegal instruction>
	.word 0xf0044000  ! 990: LDUW_R	lduw	[%r17 + %r0], %r24
hwintr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_50), 16, 16)) -> intp(2, 0, 17)
	.word 0xbb540000  ! 993: RDPR_GL	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 996: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xbda548c0  ! 2: FSUBd	fsubd	%f52, %f0, %f30
	.word 0xb02d2178  ! 3: ANDN_I	andn 	%r20, 0x0178, %r24
	.word 0xb37c2401  ! 9: MOVR_I	movre	%r16, 0x1, %r25
	.word 0xb7aa8820  ! 10: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb5a58840  ! 14: FADDd	faddd	%f22, %f0, %f26
	.word 0xbbaac820  ! 20: FMOVGE	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbba448e0  ! 22: FSUBq	dis not found

	.word 0xb3aa8820  ! 24: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xbe956023  ! 26: ORcc_I	orcc 	%r21, 0x0023, %r31
	.word 0xb82d60e8  ! 27: ANDN_I	andn 	%r21, 0x00e8, %r28
	.word 0xb1510000  ! 28: RDPR_TICK	<illegal instruction>
	.word 0xb9480000  ! 29: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 19)
	.word 0xb09c60cc  ! 34: XORcc_I	xorcc 	%r17, 0x00cc, %r24
	.word 0xbdaa8820  ! 36: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb9a00540  ! 39: FSQRTd	fsqrt	
	.word 0xb7a00520  ! 41: FSQRTs	fsqrt	
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 8)
	mov	0, %r12
	.word 0xa1930000  ! 44: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 9)
	.word 0xb9a508a0  ! 49: FSUBs	fsubs	%f20, %f0, %f28
	.word 0xbd51c000  ! 50: RDPR_TL	<illegal instruction>
	.word 0xbeac60b9  ! 53: ANDNcc_I	andncc 	%r17, 0x00b9, %r31
	.word 0xb97da401  ! 57: MOVR_I	movre	%r22, 0x1, %r28
	.word 0xbfab0820  ! 58: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0x81952167  ! 60: WRPR_TPC_I	wrpr	%r20, 0x0167, %tpc
	setx	data_start_5, %g1, %r21
	.word 0xbda4c8a0  ! 64: FSUBs	fsubs	%f19, %f0, %f30
	.word 0xba25607b  ! 65: SUB_I	sub 	%r21, 0x007b, %r29
	.word 0xb9a5c8a0  ! 66: FSUBs	fsubs	%f23, %f0, %f28
	.word 0xb1a488c0  ! 69: FSUBd	fsubd	%f18, %f0, %f24
	.word 0xb53ce001  ! 71: SRA_I	sra 	%r19, 0x0001, %r26
	.word 0xb9a549e0  ! 73: FDIVq	dis not found

	.word 0xbba81820  ! 75: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb1a9c820  ! 77: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb9aac820  ! 78: FMOVGE	fmovs	%fcc1, %f0, %f28
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 29)
	.word 0xb3a40860  ! 84: FADDq	dis not found

	.word 0x89942184  ! 85: WRPR_TICK_I	wrpr	%r16, 0x0184, %tick
	.word 0xb60c0000  ! 86: AND_R	and 	%r16, %r0, %r27
	.word 0xbba81c20  ! 87: FMOVRGEZ	dis not found

hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 1a)
	setx	0xa5d7d500005ec3, %g1, %r10
	.word 0x819a8000  ! 89: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7a40820  ! 92: FADDs	fadds	%f16, %f0, %f27
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbfa54940  ! 98: FMULd	fmuld	%f52, %f0, %f62
	.word 0xb3a40940  ! 99: FMULd	fmuld	%f16, %f0, %f56
	.word 0xbba80420  ! 100: FMOVRZ	dis not found

	.word 0xb9a00040  ! 101: FMOVd	fmovd	%f0, %f28
	.word 0x8395a1a8  ! 102: WRPR_TNPC_I	wrpr	%r22, 0x01a8, %tnpc
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 3b)
	.word 0x8394e1d2  ! 110: WRPR_TNPC_I	wrpr	%r19, 0x01d2, %tnpc
	.word 0xbda00040  ! 115: FMOVd	fmovd	%f0, %f30
	.word 0x859560c4  ! 121: WRPR_TSTATE_I	wrpr	%r21, 0x00c4, %tstate
	.word 0x91942149  ! 122: WRPR_PIL_I	wrpr	%r16, 0x0149, %pil
	.word 0xbda98820  ! 123: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb5aa8820  ! 124: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xbc258000  ! 126: SUB_R	sub 	%r22, %r0, %r30
	.word 0xbfa90820  ! 129: FMOVLEU	fmovs	%fcc1, %f0, %f31
	setx	0x900351f100001948, %g1, %r10
	.word 0x839a8000  ! 130: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8995e07e  ! 132: WRPR_TICK_I	wrpr	%r23, 0x007e, %tick
	.word 0xb7a48960  ! 134: FMULq	dis not found

	.word 0xb5aac820  ! 139: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb150c000  ! 140: RDPR_TT	<illegal instruction>
	.word 0xbd3d4000  ! 141: SRA_R	sra 	%r21, %r0, %r30
	.word 0x899421b9  ! 143: WRPR_TICK_I	wrpr	%r16, 0x01b9, %tick
	.word 0xbba81420  ! 146: FMOVRNZ	dis not found

	.word 0x8194a0cb  ! 149: WRPR_TPC_I	wrpr	%r18, 0x00cb, %tpc
	.word 0xb3a80420  ! 150: FMOVRZ	dis not found

	.word 0xb7a54960  ! 151: FMULq	dis not found

hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 16)
	.word 0xb205e0e1  ! 159: ADD_I	add 	%r23, 0x00e1, %r25
	.word 0xbfa00520  ! 161: FSQRTs	fsqrt	
	setx	0xd4313b6f00004906, %g1, %r10
	.word 0x839a8000  ! 162: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbebd20d6  ! 163: XNORcc_I	xnorcc 	%r20, 0x00d6, %r31
	.word 0x8d9421b2  ! 165: WRPR_PSTATE_I	wrpr	%r16, 0x01b2, %pstate
	.word 0x8d946056  ! 167: WRPR_PSTATE_I	wrpr	%r17, 0x0056, %pstate
	.word 0xb1a40920  ! 168: FMULs	fmuls	%f16, %f0, %f24
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb9a98820  ! 170: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb5a90820  ! 171: FMOVLEU	fmovs	%fcc1, %f0, %f26
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 23)
	.word 0xbf51c000  ! 184: RDPR_TL	<illegal instruction>
	.word 0x919461ba  ! 187: WRPR_PIL_I	wrpr	%r17, 0x01ba, %pil
	.word 0xb7a80420  ! 195: FMOVRZ	dis not found

	.word 0x8d9560c9  ! 196: WRPR_PSTATE_I	wrpr	%r21, 0x00c9, %pstate
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 2)
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 5)
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 38)
	.word 0xb214c000  ! 207: OR_R	or 	%r19, %r0, %r25
	.word 0xb7a5c960  ! 212: FMULq	dis not found

hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 7)
	.word 0xbba88820  ! 220: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xbf508000  ! 221: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a44840  ! 224: FADDd	faddd	%f48, %f0, %f56
	.word 0xbba00040  ! 231: FMOVd	fmovd	%f0, %f60
	.word 0xb1a5c820  ! 233: FADDs	fadds	%f23, %f0, %f24
	.word 0xbfa5c860  ! 234: FADDq	dis not found

	.word 0xb3a488a0  ! 238: FSUBs	fsubs	%f18, %f0, %f25
	.word 0xb1a80420  ! 239: FMOVRZ	dis not found

	.word 0xbf508000  ! 241: RDPR_TSTATE	<illegal instruction>
	.word 0xbb50c000  ! 242: RDPR_TT	<illegal instruction>
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 15)
	.word 0xb7a48820  ! 245: FADDs	fadds	%f18, %f0, %f27
	.word 0xb3500000  ! 246: RDPR_TPC	<illegal instruction>
	.word 0xb7a88820  ! 247: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb7a58860  ! 248: FADDq	dis not found

	.word 0xb5520000  ! 250: RDPR_PIL	<illegal instruction>
	.word 0xb750c000  ! 256: RDPR_TT	<illegal instruction>
	.word 0x81946053  ! 257: WRPR_TPC_I	wrpr	%r17, 0x0053, %tpc
	.word 0xbc1c0000  ! 258: XOR_R	xor 	%r16, %r0, %r30
	mov	1, %r12
	.word 0x8f930000  ! 259: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbf510000  ! 260: RDPR_TICK	<illegal instruction>
	.word 0xb5a00020  ! 261: FMOVs	fmovs	%f0, %f26
	.word 0xb33ca001  ! 266: SRA_I	sra 	%r18, 0x0001, %r25
	.word 0xb12ce001  ! 267: SLL_I	sll 	%r19, 0x0001, %r24
	.word 0xb1a54860  ! 269: FADDq	dis not found

	.word 0x8d946044  ! 273: WRPR_PSTATE_I	wrpr	%r17, 0x0044, %pstate
	.word 0xbba00540  ! 278: FSQRTd	fsqrt	
	.word 0xb1a81820  ! 279: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb5a80420  ! 280: FMOVRZ	dis not found

	.word 0xb1a4c860  ! 281: FADDq	dis not found

	.word 0xbfa449c0  ! 283: FDIVd	fdivd	%f48, %f0, %f62
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 14)
	.word 0x8994e1d7  ! 289: WRPR_TICK_I	wrpr	%r19, 0x01d7, %tick
	.word 0x8194e1ad  ! 291: WRPR_TPC_I	wrpr	%r19, 0x01ad, %tpc
	.word 0x87942114  ! 292: WRPR_TT_I	wrpr	%r16, 0x0114, %tt
	.word 0xb5a90820  ! 294: FMOVLEU	fmovs	%fcc1, %f0, %f26
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb1a00560  ! 299: FSQRTq	fsqrt	
	.word 0xb1ab8820  ! 301: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb7a588c0  ! 302: FSUBd	fsubd	%f22, %f0, %f58
	.word 0xbf510000  ! 303: RDPR_TICK	<illegal instruction>
	.word 0xb7a548c0  ! 307: FSUBd	fsubd	%f52, %f0, %f58
	.word 0x819561f4  ! 309: WRPR_TPC_I	wrpr	%r21, 0x01f4, %tpc
	.word 0xb7a80420  ! 310: FMOVRZ	dis not found

	.word 0xba9c4000  ! 313: XORcc_R	xorcc 	%r17, %r0, %r29
	.word 0xb9a589c0  ! 314: FDIVd	fdivd	%f22, %f0, %f28
	.word 0xb5504000  ! 315: RDPR_TNPC	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 317: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5504000  ! 320: RDPR_TNPC	<illegal instruction>
	.word 0xb9ab4820  ! 321: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb9a408a0  ! 325: FSUBs	fsubs	%f16, %f0, %f28
	.word 0xb9a88820  ! 326: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb3aa4820  ! 327: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0x87946016  ! 333: WRPR_TT_I	wrpr	%r17, 0x0016, %tt
	.word 0xb350c000  ! 335: RDPR_TT	<illegal instruction>
	.word 0xb7a80820  ! 338: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xbdab8820  ! 344: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbe0c4000  ! 347: AND_R	and 	%r17, %r0, %r31
	.word 0xb52c9000  ! 349: SLLX_R	sllx	%r18, %r0, %r26
	.word 0x8395a076  ! 352: WRPR_TNPC_I	wrpr	%r22, 0x0076, %tnpc
	.word 0xbba549c0  ! 355: FDIVd	fdivd	%f52, %f0, %f60
	.word 0xb7a00540  ! 364: FSQRTd	fsqrt	
	.word 0xb1a5c9e0  ! 365: FDIVq	dis not found

	.word 0xb5a00540  ! 367: FSQRTd	fsqrt	
	.word 0xb3a589c0  ! 368: FDIVd	fdivd	%f22, %f0, %f56
	.word 0xb5a80420  ! 369: FMOVRZ	dis not found

	.word 0xb5a00560  ! 370: FSQRTq	fsqrt	
	.word 0xb7a8c820  ! 372: FMOVL	fmovs	%fcc1, %f0, %f27
hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 16)
	setx	data_start_0, %g1, %r17
	.word 0xb9a00560  ! 381: FSQRTq	fsqrt	
	.word 0x8595a067  ! 384: WRPR_TSTATE_I	wrpr	%r22, 0x0067, %tstate
	.word 0xb5a00020  ! 386: FMOVs	fmovs	%f0, %f26
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 8)
	.word 0xb5a549a0  ! 388: FDIVs	fdivs	%f21, %f0, %f26
	setx	data_start_0, %g1, %r22
	.word 0xb7504000  ! 390: RDPR_TNPC	<illegal instruction>
	.word 0xb351c000  ! 392: RDPR_TL	<illegal instruction>
	.word 0xbeb560c1  ! 396: ORNcc_I	orncc 	%r21, 0x00c1, %r31
	.word 0xb9ab4820  ! 400: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xbfa00560  ! 401: FSQRTq	fsqrt	
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 9)
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 19)
	.word 0x85946019  ! 414: WRPR_TSTATE_I	wrpr	%r17, 0x0019, %tstate
	.word 0xb9a88820  ! 417: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb951c000  ! 418: RDPR_TL	<illegal instruction>
	.word 0xb5a4c840  ! 423: FADDd	faddd	%f50, %f0, %f26
	.word 0xbda44820  ! 430: FADDs	fadds	%f17, %f0, %f30
	.word 0xb1a94820  ! 436: FMOVCS	fmovs	%fcc1, %f0, %f24
	mov	2, %r12
	.word 0x8f930000  ! 438: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfa4c840  ! 439: FADDd	faddd	%f50, %f0, %f62
	.word 0xb3504000  ! 441: RDPR_TNPC	<illegal instruction>
	.word 0x8795219a  ! 442: WRPR_TT_I	wrpr	%r20, 0x019a, %tt
	.word 0xb5500000  ! 443: RDPR_TPC	<illegal instruction>
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 6)
	.word 0xb9a9c820  ! 445: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0x8394a001  ! 446: WRPR_TNPC_I	wrpr	%r18, 0x0001, %tnpc
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 8)
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb3a58920  ! 451: FMULs	fmuls	%f22, %f0, %f25
	.word 0xba1420ea  ! 453: OR_I	or 	%r16, 0x00ea, %r29
	.word 0xb5500000  ! 454: RDPR_TPC	<illegal instruction>
	.word 0xb3a589e0  ! 457: FDIVq	dis not found

	.word 0xb750c000  ! 462: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbba00020  ! 468: FMOVs	fmovs	%f0, %f29
	.word 0xb0c521ff  ! 469: ADDCcc_I	addccc 	%r20, 0x01ff, %r24
	.word 0xb9a488a0  ! 474: FSUBs	fsubs	%f18, %f0, %f28
	.word 0xbda5c960  ! 476: FMULq	dis not found

hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 11)
	.word 0xb5ab8820  ! 480: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb1518000  ! 481: RDPR_PSTATE	<illegal instruction>
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, a)
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 12)
	.word 0xb5a80820  ! 488: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb1a5c820  ! 495: FADDs	fadds	%f23, %f0, %f24
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 36)
	.word 0x879461cb  ! 498: WRPR_TT_I	wrpr	%r17, 0x01cb, %tt
	.word 0xbbab4820  ! 500: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb5a80420  ! 501: FMOVRZ	dis not found

	.word 0xb3aac820  ! 503: FMOVGE	fmovs	%fcc1, %f0, %f25
	mov	1, %r12
	.word 0xa1930000  ! 505: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7a98820  ! 508: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb1540000  ! 509: RDPR_GL	<illegal instruction>
	.word 0x89952122  ! 512: WRPR_TICK_I	wrpr	%r20, 0x0122, %tick
	.word 0x8d94a1ef  ! 514: WRPR_PSTATE_I	wrpr	%r18, 0x01ef, %pstate
	.word 0xb5a88820  ! 516: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb7a81820  ! 517: FMOVRGZ	fmovs	%fcc3, %f0, %f27
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 14)
	.word 0xbac4208b  ! 522: ADDCcc_I	addccc 	%r16, 0x008b, %r29
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 2a)
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbba00020  ! 527: FMOVs	fmovs	%f0, %f29
	.word 0xb3a50820  ! 533: FADDs	fadds	%f20, %f0, %f25
	.word 0xb1500000  ! 537: RDPR_TPC	<illegal instruction>
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 6)
	setx	0xb1ecb71a00001e95, %g1, %r10
	.word 0x819a8000  ! 541: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7a449a0  ! 543: FDIVs	fdivs	%f17, %f0, %f27
	mov	0, %r12
	.word 0xa1930000  ! 547: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7a94820  ! 548: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb9a40820  ! 554: FADDs	fadds	%f16, %f0, %f28
	.word 0xbba80c20  ! 558: FMOVRLZ	dis not found

	.word 0xb7a5c9a0  ! 561: FDIVs	fdivs	%f23, %f0, %f27
	.word 0x83952122  ! 563: WRPR_TNPC_I	wrpr	%r20, 0x0122, %tnpc
	.word 0xb3a00540  ! 564: FSQRTd	fsqrt	
	.word 0xbba94820  ! 565: FMOVCS	fmovs	%fcc1, %f0, %f29
	setx	data_start_6, %g1, %r23
	.word 0xb12c8000  ! 568: SLL_R	sll 	%r18, %r0, %r24
	.word 0xb7a81420  ! 569: FMOVRNZ	dis not found

	.word 0xbba449c0  ! 570: FDIVd	fdivd	%f48, %f0, %f60
	.word 0xbda00520  ! 573: FSQRTs	fsqrt	
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 23)
	.word 0xb9a98820  ! 575: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0x859460dd  ! 576: WRPR_TSTATE_I	wrpr	%r17, 0x00dd, %tstate
	.word 0xb9a408e0  ! 577: FSUBq	dis not found

	.word 0xb025609a  ! 579: SUB_I	sub 	%r21, 0x009a, %r24
	.word 0xbba58860  ! 581: FADDq	dis not found

	.word 0xb03ce050  ! 583: XNOR_I	xnor 	%r19, 0x0050, %r24
	mov	2, %r12
	.word 0x8f930000  ! 584: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1a00020  ! 587: FMOVs	fmovs	%f0, %f24
	.word 0xb33d5000  ! 588: SRAX_R	srax	%r21, %r0, %r25
	.word 0xbd50c000  ! 589: RDPR_TT	<illegal instruction>
	.word 0xbda80420  ! 591: FMOVRZ	dis not found

	.word 0xb5a549e0  ! 592: FDIVq	dis not found

	.word 0xbf35b001  ! 593: SRLX_I	srlx	%r22, 0x0001, %r31
	.word 0xbc1dc000  ! 594: XOR_R	xor 	%r23, %r0, %r30
	.word 0xbba48920  ! 596: FMULs	fmuls	%f18, %f0, %f29
	.word 0xb5a00520  ! 597: FSQRTs	fsqrt	
	.word 0xba9ca1d1  ! 598: XORcc_I	xorcc 	%r18, 0x01d1, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a94820  ! 606: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb1a508c0  ! 608: FSUBd	fsubd	%f20, %f0, %f24
	.word 0xb53c2001  ! 611: SRA_I	sra 	%r16, 0x0001, %r26
	.word 0xb5a90820  ! 612: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xbcbcc000  ! 613: XNORcc_R	xnorcc 	%r19, %r0, %r30
	.word 0xbdab4820  ! 614: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb1a80820  ! 616: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbfa81420  ! 617: FMOVRNZ	dis not found

	.word 0xb9a44860  ! 621: FADDq	dis not found

	.word 0xb3a80820  ! 626: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb034c000  ! 627: SUBC_R	orn 	%r19, %r0, %r24
	.word 0xb535e001  ! 629: SRL_I	srl 	%r23, 0x0001, %r26
	.word 0xbfa4c8c0  ! 631: FSUBd	fsubd	%f50, %f0, %f62
	setx	0x61c33aba0000091d, %g1, %r10
	.word 0x839a8000  ! 632: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3a409e0  ! 633: FDIVq	dis not found

	.word 0xb9a90820  ! 637: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xba8ca0bf  ! 638: ANDcc_I	andcc 	%r18, 0x00bf, %r29
	.word 0xb495e0df  ! 641: ORcc_I	orcc 	%r23, 0x00df, %r26
	.word 0xb7a00540  ! 642: FSQRTd	fsqrt	
	.word 0xbeb5a020  ! 645: ORNcc_I	orncc 	%r22, 0x0020, %r31
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 5)
	.word 0xb5500000  ! 649: RDPR_TPC	<illegal instruction>
	.word 0xbfa40860  ! 650: FADDq	dis not found

	.word 0xb5a4c940  ! 653: FMULd	fmuld	%f50, %f0, %f26
	.word 0xbba90820  ! 655: FMOVLEU	fmovs	%fcc1, %f0, %f29
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 17)
	mov	1, %r12
	.word 0xa1930000  ! 660: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9a00520  ! 662: FSQRTs	fsqrt	
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 28)
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 0)
	.word 0xb83c6032  ! 672: XNOR_I	xnor 	%r17, 0x0032, %r28
	setx	0x9d714ba200009e5c, %g1, %r10
	.word 0x819a8000  ! 674: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbba549a0  ! 681: FDIVs	fdivs	%f21, %f0, %f29
	.word 0xbfaac820  ! 682: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xbba81820  ! 687: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb9a90820  ! 689: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0x8194e028  ! 690: WRPR_TPC_I	wrpr	%r19, 0x0028, %tpc
	.word 0xb734a001  ! 691: SRL_I	srl 	%r18, 0x0001, %r27
	.word 0xb1a48860  ! 692: FADDq	dis not found

	.word 0x8d95e13f  ! 694: WRPR_PSTATE_I	wrpr	%r23, 0x013f, %pstate
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, e)
	.word 0xb884a149  ! 702: ADDcc_I	addcc 	%r18, 0x0149, %r28
	.word 0xb3a00520  ! 706: FSQRTs	fsqrt	
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 28)
	.word 0xbfa48960  ! 710: FMULq	dis not found

	.word 0x819520d1  ! 711: WRPR_TPC_I	wrpr	%r20, 0x00d1, %tpc
	.word 0xb5643801  ! 712: MOVcc_I	<illegal instruction>
	.word 0xbeb40000  ! 716: ORNcc_R	orncc 	%r16, %r0, %r31
	.word 0x8394e105  ! 717: WRPR_TNPC_I	wrpr	%r19, 0x0105, %tnpc
	.word 0xbd504000  ! 719: RDPR_TNPC	<illegal instruction>
	.word 0xbd510000  ! 725: RDPR_TICK	<illegal instruction>
	.word 0xb1aac820  ! 726: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xbba8c820  ! 727: FMOVL	fmovs	%fcc1, %f0, %f29
hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 39)
	.word 0xb5aa0820  ! 732: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb5ab4820  ! 733: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb9ab4820  ! 737: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0x9195e118  ! 741: WRPR_PIL_I	wrpr	%r23, 0x0118, %pil
	.word 0x879520aa  ! 745: WRPR_TT_I	wrpr	%r20, 0x00aa, %tt
	.word 0xbfab8820  ! 746: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb7a90820  ! 748: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb72d1000  ! 749: SLLX_R	sllx	%r20, %r0, %r27
	.word 0xbba81c20  ! 752: FMOVRGEZ	dis not found

	setx	data_start_6, %g1, %r21
	.word 0x8795e116  ! 754: WRPR_TT_I	wrpr	%r23, 0x0116, %tt
hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, 24)
	.word 0xbfa00540  ! 757: FSQRTd	fsqrt	
	.word 0xb5a509a0  ! 758: FDIVs	fdivs	%f20, %f0, %f26
	.word 0xb351c000  ! 760: RDPR_TL	<illegal instruction>
	setx	0x66e520f40000fd91, %g1, %r10
	.word 0x839a8000  ! 761: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3480000  ! 762: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb7a50960  ! 763: FMULq	dis not found

	.word 0xb9a449c0  ! 770: FDIVd	fdivd	%f48, %f0, %f28
	.word 0xb5a81820  ! 771: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb085a0b8  ! 775: ADDcc_I	addcc 	%r22, 0x00b8, %r24
	.word 0xbba58940  ! 778: FMULd	fmuld	%f22, %f0, %f60
	.word 0x879521b6  ! 781: WRPR_TT_I	wrpr	%r20, 0x01b6, %tt
	mov	1, %r12
	.word 0x8f930000  ! 785: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_41), 16, 16)) -> intp(1, 0, 30)
	.word 0xb9a84820  ! 787: FMOVE	fmovs	%fcc1, %f0, %f28
	setx	0x1af63f4800008e4f, %g1, %r10
	.word 0x819a8000  ! 788: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8394618f  ! 789: WRPR_TNPC_I	wrpr	%r17, 0x018f, %tnpc
	.word 0x8194e004  ! 794: WRPR_TPC_I	wrpr	%r19, 0x0004, %tpc
	.word 0xba254000  ! 797: SUB_R	sub 	%r21, %r0, %r29
	.word 0xb09d216b  ! 799: XORcc_I	xorcc 	%r20, 0x016b, %r24
	.word 0xba94c000  ! 800: ORcc_R	orcc 	%r19, %r0, %r29
	.word 0xbbab4820  ! 802: FMOVCC	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_42), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb550c000  ! 809: RDPR_TT	<illegal instruction>
hwintr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_43), 16, 16)) -> intp(1, 0, 3)
	.word 0x8595a005  ! 813: WRPR_TSTATE_I	wrpr	%r22, 0x0005, %tstate
	.word 0x8994e1e1  ! 817: WRPR_TICK_I	wrpr	%r19, 0x01e1, %tick
	setx	0xc398e23600002b0e, %g1, %r10
	.word 0x839a8000  ! 818: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1a40820  ! 822: FADDs	fadds	%f16, %f0, %f24
	.word 0xb6a5a13c  ! 825: SUBcc_I	subcc 	%r22, 0x013c, %r27
hwintr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_44), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbfa00560  ! 833: FSQRTq	fsqrt	
	.word 0xb8b48000  ! 834: ORNcc_R	orncc 	%r18, %r0, %r28
	.word 0xbda488a0  ! 837: FSUBs	fsubs	%f18, %f0, %f30
	.word 0x8395206f  ! 838: WRPR_TNPC_I	wrpr	%r20, 0x006f, %tnpc
	.word 0xb3520000  ! 840: RDPR_PIL	<illegal instruction>
	.word 0xb7ab4820  ! 844: FMOVCC	fmovs	%fcc1, %f0, %f27
hwintr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_45), 16, 16)) -> intp(1, 0, 21)
	.word 0xb3aa8820  ! 860: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb7a48840  ! 864: FADDd	faddd	%f18, %f0, %f58
	.word 0xb13cd000  ! 873: SRAX_R	srax	%r19, %r0, %r24
	.word 0xb3340000  ! 874: SRL_R	srl 	%r16, %r0, %r25
	.word 0xbdaa4820  ! 875: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb7a98820  ! 876: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb7a409c0  ! 878: FDIVd	fdivd	%f16, %f0, %f58
	.word 0xb5a589e0  ! 879: FDIVq	dis not found

	.word 0x859561ea  ! 882: WRPR_TSTATE_I	wrpr	%r21, 0x01ea, %tstate
	.word 0xb9a54960  ! 885: FMULq	dis not found

	.word 0xb5a589e0  ! 886: FDIVq	dis not found

	.word 0xb5a4c8c0  ! 887: FSUBd	fsubd	%f50, %f0, %f26
	.word 0xba44c000  ! 889: ADDC_R	addc 	%r19, %r0, %r29
	.word 0xbe242104  ! 895: SUB_I	sub 	%r16, 0x0104, %r31
	.word 0xb5a00020  ! 897: FMOVs	fmovs	%f0, %f26
	.word 0xb3ab8820  ! 901: FMOVPOS	fmovs	%fcc1, %f0, %f25
hwintr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_46), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbfa80c20  ! 903: FMOVRLZ	dis not found

	.word 0xb7a98820  ! 907: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xbdaa0820  ! 913: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xbda5c8a0  ! 915: FSUBs	fsubs	%f23, %f0, %f30
	.word 0xbba9c820  ! 919: FMOVVS	fmovs	%fcc1, %f0, %f29
hwintr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_47), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb9aa8820  ! 924: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb9ab0820  ! 927: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb5a488e0  ! 931: FSUBq	dis not found

	.word 0xb3a00020  ! 932: FMOVs	fmovs	%f0, %f25
	.word 0x9195a0ed  ! 933: WRPR_PIL_I	wrpr	%r22, 0x00ed, %pil
	.word 0xbda00560  ! 936: FSQRTq	fsqrt	
	.word 0xb1a4c840  ! 938: FADDd	faddd	%f50, %f0, %f24
	.word 0xb7a54940  ! 940: FMULd	fmuld	%f52, %f0, %f58
hwintr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_48), 16, 16)) -> intp(1, 0, 32)
	.word 0xbfa81420  ! 942: FMOVRNZ	dis not found

	.word 0xb150c000  ! 945: RDPR_TT	<illegal instruction>
	.word 0xb3a509a0  ! 946: FDIVs	fdivs	%f20, %f0, %f25
	.word 0xb3a81420  ! 950: FMOVRNZ	dis not found

	.word 0xb5a44860  ! 951: FADDq	dis not found

	.word 0x85942135  ! 952: WRPR_TSTATE_I	wrpr	%r16, 0x0135, %tstate
	.word 0xbf2c2001  ! 953: SLL_I	sll 	%r16, 0x0001, %r31
hwintr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_49), 16, 16)) -> intp(1, 0, 31)
	.word 0xbba50940  ! 958: FMULd	fmuld	%f20, %f0, %f60
	.word 0xb9abc820  ! 959: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xbfa80420  ! 960: FMOVRZ	dis not found

	.word 0xb3a00540  ! 961: FSQRTd	fsqrt	
	.word 0xbd50c000  ! 962: RDPR_TT	<illegal instruction>
	.word 0xb5a48920  ! 966: FMULs	fmuls	%f18, %f0, %f26
	.word 0xbab50000  ! 967: SUBCcc_R	orncc 	%r20, %r0, %r29
	.word 0xb1480000  ! 968: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x4a2a9350000299e, %g1, %r10
	.word 0x839a8000  ! 969: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb09560cb  ! 970: ORcc_I	orcc 	%r21, 0x00cb, %r24
	.word 0xbf500000  ! 972: RDPR_TPC	<illegal instruction>
	.word 0xb7a00540  ! 977: FSQRTd	fsqrt	
	.word 0xb3504000  ! 979: RDPR_TNPC	<illegal instruction>
	.word 0xb1500000  ! 982: RDPR_TPC	<illegal instruction>
	.word 0xb2a5a01c  ! 986: SUBcc_I	subcc 	%r22, 0x001c, %r25
	.word 0xb9a50820  ! 987: FADDs	fadds	%f20, %f0, %f28
	.word 0xbf540000  ! 988: RDPR_GL	<illegal instruction>
hwintr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_50), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb7540000  ! 993: RDPR_GL	<illegal instruction>
	.word 0xb9a84820  ! 995: FMOVE	fmovs	%fcc1, %f0, %f28
	mov	2, %r12
	.word 0xa1930000  ! 996: WRPR_GL_R	wrpr	%r12, %r0, %-

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)
	.data
fsr_data:

	.xword	0x0000000000000000
	.align 0x1000
	.data
data_start_0:

	.xword	0x787e0c58a0675874
	.xword	0x3bae1f3c9a50a607
	.xword	0x4479bdc6db2bb3b8
	.xword	0xe31f332660fbba78
	.xword	0xe4ccd27ea547a40a
	.xword	0x965807ac0d567ce8
	.xword	0xb8ef03a2c733d152
	.xword	0x32a5fcae6074b6ae
	.xword	0xad6904bd7823d307
	.xword	0xe290e5020878b0c2
	.xword	0xea0d58d629eb8106
	.xword	0xad03768dd29e7f49
	.xword	0xa8c57aad4ea7c6a4
	.xword	0x29499e7a24d4b14d
	.xword	0xba76fed9014def16
	.xword	0x01404d776e214f74
	.xword	0x51fa8e2fa7f29e1c
	.xword	0x8485fe53a9838dc7
	.xword	0x55d32b2e7ba6b11a
	.xword	0x1a31aaa69c50f437
	.xword	0x4c3ac673ace610d4
	.xword	0xa435a27e010ec714
	.xword	0x53ac260578483bce
	.xword	0xcb2a07e63290ed46
	.xword	0x2ace0a6f2edb96d6
	.xword	0x253fd331b4688fee
	.xword	0xa2bb82936b8ff857
	.xword	0x6f5d09813ed60a52
	.xword	0xad84e8ac0faac88f
	.xword	0xdbc632c4853f08a7
	.xword	0x93e095a13bd4c870
	.xword	0x1730a4128f95116a
	.xword	0xa16659ccee9715bc
	.xword	0xc8cd56b85f944221
	.xword	0xb691534854ba303b
	.xword	0x1da558fa8584faa3
	.xword	0x71058489004feeaa
	.xword	0x8cfc8c73d15f7ef4
	.xword	0x8ff1f3e347fd615a
	.xword	0x6c2dbf224d5ac578
	.xword	0x1101502d735601c0
	.xword	0x464cec2e44efc8b9
	.xword	0xb031ee174c907b32
	.xword	0x4e068ab4b07935ec
	.xword	0x45cd07dd784aa5b8
	.xword	0xe420616188aaa356
	.xword	0x7f9e6f44c812a37e
	.xword	0xcd4deb558024da99
	.xword	0xf4b264225ae989a9
	.xword	0xff056974a3dd8f96
	.xword	0x0ee6f8d6b33e434f
	.xword	0x9a2b7f0b2436e3c4
	.xword	0x382d4c3bdbe8276f
	.xword	0x4d1d3e7475a3a70b
	.xword	0x9ebfc2a3d320cd66
	.xword	0x1711419ea599edea
	.xword	0x188928f925cceac5
	.xword	0xf63d6bf488b76965
	.xword	0x641d8ce7af96511a
	.xword	0x429574d45e5d31a3
	.xword	0x6df2bd9ab409ad7f
	.xword	0x61abd829d2f00607
	.xword	0xd0e1e17258917659
	.xword	0x305504a627218f93
	.xword	0x3418a39566e5f7ae
	.xword	0x3202eb1666d299c0
	.xword	0xf0c58d54875147c5
	.xword	0xe43f8d36112e79e2
	.xword	0x42c0b6fb13e99bd1
	.xword	0x035374b59f4cd4f0
	.xword	0x960bca134b97c5a3
	.xword	0x50a16bc196fe3e32
	.xword	0xe2b87130ee8cc79a
	.xword	0xc23582b04c1a9669
	.xword	0x8c58de5751dab937
	.xword	0x4e3f0d7d2966eab1
	.xword	0x13d04ac6c2b4f9e2
	.xword	0xed930465013910d4
	.xword	0xd853decec0169505
	.xword	0xcfe87fbd03dce1d2
	.xword	0x820461056c98fedf
	.xword	0x12e1b85eda4263f7
	.xword	0x23d120d96b5b7d0e
	.xword	0x23449a1de5c67649
	.xword	0x04fcb40c0c387ffe
	.xword	0xd23d066eb83b6ed7
	.xword	0x6a6956cfa5674cc4
	.xword	0x75cc3fba9e35515f
	.xword	0xc0e568e466aff3bc
	.xword	0xe0606ac64ec15fe3
	.xword	0xecc47bb0e0c41e74
	.xword	0x628b18a9d92e9c45
	.xword	0xa18d46cdc3ffc1e1
	.xword	0x7dc3186ac3d248bf
	.xword	0x965fdd07b4f237de
	.xword	0xe180e5e339263cb5
	.xword	0x31d66a9d99b35b83
	.xword	0x685935f978861889
	.xword	0xb87d70a3df41724f
	.xword	0xb32497eb96009d5b
	.xword	0xdea5c69cef1dd605
	.xword	0x028833f5b375e5f6
	.xword	0xb2e15a62b93235ca
	.xword	0x7673c2de8fb5246e
	.xword	0xb1fefb17b6a91be0
	.xword	0x475bdec24d7b2933
	.xword	0x46994208b742b415
	.xword	0xe1de5ab821c74322
	.xword	0x0ddb280a37f2cc5f
	.xword	0xdf58ea53974f4d72
	.xword	0xdde96974e9afd29f
	.xword	0x517b4fa4e5a7f3ff
	.xword	0xfa6bdaf8508712fa
	.xword	0x7fa8ab592466b91d
	.xword	0xf2fb15bc847c581f
	.xword	0x1cb6eef8a4d6900e
	.xword	0x711c7afc39efd1b5
	.xword	0x9ab04f9f4c2aafc9
	.xword	0x0fec09e5482f8bc6
	.xword	0xf350759d8b6cb8e1
	.xword	0xc62e28c122eea77b
	.xword	0xf116cb8dd852befb
	.xword	0xbca94e6db674e1bc
	.xword	0x053976216f443c23
	.xword	0x71b9c2b2d0f80f52
	.xword	0xe09e993fb62bc232
	.xword	0x2f410ddb70e6aa75
	.xword	0xd1c19cc61132ad0a
	.xword	0xed35cd25846ff665
	.xword	0x755526c5dc16f258
	.xword	0x9fabe59ece7b4122
	.xword	0xc5166af5c4b634b9
	.xword	0x0bcfb8aa0893913e
	.xword	0xa808a721c8b0ce4e
	.xword	0x3e6f4287bf4ce8b2
	.xword	0xf79dbdccbfdcb75d
	.xword	0x29e37bf57ef3d1c6
	.xword	0x303ef8cbbfcf725d
	.xword	0x9a1aab6fd57dc923
	.xword	0x4562cc5df229d855
	.xword	0xa6d452486b81c72a
	.xword	0xbd49216238429212
	.xword	0x4d202f8f371bf370
	.xword	0x03259f43a5cefea2
	.xword	0x677c78a09e31b0fc
	.xword	0xb10a711d6f1c7479
	.xword	0xa491d84317d6fce6
	.xword	0xdb7ca8e91eff4b80
	.xword	0x8b62ffba7dd68538
	.xword	0x40875a081f1f9187
	.xword	0xa17653e0263320da
	.xword	0xf45b1ebf3c19d982
	.xword	0x51d4194a80ae590d
	.xword	0xd9e81c40ab7f1354
	.xword	0x247abd722680fddb
	.xword	0x2798243e75ca4769
	.xword	0xb22ebb8e7f78a717
	.xword	0xe260d909c62a559d
	.xword	0x8c06fa855f8cdbf9
	.xword	0x8c7285c844116310
	.xword	0x2db7871fc5188d27
	.xword	0xc2ed5d17a4c70722
	.xword	0x9377308481dadb51
	.xword	0xf301051f04f3de20
	.xword	0x172de8399241b782
	.xword	0x051913bc2e3710e7
	.xword	0xb1652d79083e448c
	.xword	0x6232f950ae18e30a
	.xword	0x3addadfa057bd8e2
	.xword	0x11b65e7a8292cbf9
	.xword	0x3fda931947726fdf
	.xword	0x76bc9b2b2b28949d
	.xword	0x99e0baf6f5a43ec4
	.xword	0x1e748b8beecbfb33
	.xword	0xc0b1195fb64dbd9b
	.xword	0x37de74fdf5ee8f9a
	.xword	0x815079cfb092d948
	.xword	0x704e53e3a7977077
	.xword	0x62f1393b90cccb74
	.xword	0xc5aea7a9774d5299
	.xword	0xdc5b7a88cafbef5a
	.xword	0x6b4e66c77992b031
	.xword	0xbbd49a17a4795559
	.xword	0x9b74f3c7e8a0df93
	.xword	0x0f3cbef610958852
	.xword	0x896edc5431677e1e
	.xword	0xe0baffde9a7c6282
	.xword	0x8f5a596aca5372d1
	.xword	0x963d09cced15923d
	.xword	0x1ec5b50af95b307b
	.xword	0xf508327e0b587e83
	.xword	0xb537eba5e11ae400
	.xword	0x35449baf43a8e9eb
	.xword	0x24896b31b15c9f62
	.xword	0x4bbfdab7e78c818e
	.xword	0xa02989658f3cac23
	.xword	0x7878e09e4ccb3d99
	.xword	0x06fd92694eb4fcf7
	.xword	0x29afb950be1829f5
	.xword	0xf014f82765461608
	.xword	0x469a1e6b314277ed
	.xword	0x1d87702ead6eee4e
	.xword	0x76726c5a4d756331
	.xword	0x0a06ff91baa55005
	.xword	0x354eac90f804329f
	.xword	0xd90d6fac793ff1da
	.xword	0xbb46aa9d517deeab
	.xword	0x75b7488c0984df21
	.xword	0xb261133034dcd6ab
	.xword	0xefea52bc27d25180
	.xword	0x8630f8c5cb8de102
	.xword	0x50e250d3c4b516ab
	.xword	0xa052ef5f561defda
	.xword	0x3390116707b60747
	.xword	0x450513d58a3aa443
	.xword	0xd2422e39a10e194d
	.xword	0x800834fb84056664
	.xword	0x9d6b4e834a667a3e
	.xword	0x7cfeda95de7086c0
	.xword	0x160833da0d8b5d4a
	.xword	0x261f2710b76ac65b
	.xword	0xe6fe176f6144f7e3
	.xword	0x6331c9e6ef82087a
	.xword	0xe5e4705bf051bfc9
	.xword	0x7625071b51b01b9c
	.xword	0xf374bd06cd1218f9
	.xword	0x7cec31980cc1ac02
	.xword	0x9aa48ffa480d9f06
	.xword	0xd98a3eda0c48febd
	.xword	0x39d4de745952d60f
	.xword	0xabf3c81ebd741977
	.xword	0x015d2c5808b7aec8
	.xword	0x3a60fce5d79eb945
	.xword	0xfec3b2aaf472d24e
	.xword	0xf212d550381e8715
	.xword	0xed31c15232297a0b
	.xword	0x8fdf66b12bb83673
	.xword	0xa55563d58b1efb34
	.xword	0x3c14c9ae559245d4
	.xword	0xd3494c3092c2e41a
	.xword	0x0582ac038d030312
	.xword	0xe9337be93c51012f
	.xword	0xf45c3242bf15fc1e
	.xword	0x9c61b86e9e9bd8f2
	.xword	0x4e4c43d71995c4cf
	.xword	0x04f128c0c61a0c5f
	.xword	0xd969d13e5a63c885
	.xword	0x3a8c5079107a4075
	.xword	0x2a565f72f993e58e
	.xword	0x8f6356358e1edc9e
	.xword	0x8389f362e1b4568e
	.xword	0xdafce94b4f4b2de6
	.xword	0x40e50feb5935d012
	.xword	0x93817c1b270322fc
	.xword	0xf49fe167eb4e551f
	.xword	0xb9185d2bfec9cf8b
	.align 0x2000
	.data
data_start_1:

	.xword	0x5b5418bfae9b0f59
	.xword	0x1e7475a947cdfcdb
	.xword	0x340e00f3b5748a97
	.xword	0xe0c10651e1bf1c64
	.xword	0xc94df9cd53a361e2
	.xword	0xe4cc0c03a9bd8880
	.xword	0x7270383201c84325
	.xword	0x5408eb955c8450b4
	.xword	0xc8921d08e4b4d778
	.xword	0x2054aa9eb95c4cfb
	.xword	0x2c75032457e9a8bc
	.xword	0xa6a57c81e21baf81
	.xword	0xd57c80f5b3a5b908
	.xword	0x1029844c093aa5f1
	.xword	0x53b82dd9d2645ca8
	.xword	0xa7442d900baea73f
	.xword	0x89864d6e130918f4
	.xword	0x2df3072a620f709a
	.xword	0x68ab9f66ef92ff46
	.xword	0x42cf4ae55cd96c61
	.xword	0xd565f72737f5f5e0
	.xword	0x80ae74177be3e1cc
	.xword	0xd822d36fe11d9e3c
	.xword	0x1006f2e5acd38d20
	.xword	0x1cb335f85da12a72
	.xword	0x723847f09183eb96
	.xword	0x0a33d45f4d583fa3
	.xword	0xf92e6f3d2bcce807
	.xword	0x557e58a9506861d2
	.xword	0xd4c8eb3d896bbb47
	.xword	0xe2ca6973fc56a1d5
	.xword	0x3c49ed9fcdd3f77e
	.xword	0x3b1df9826303a9f3
	.xword	0x7eea3aab646961c1
	.xword	0xcc813a17deaa7613
	.xword	0x54e8be91c8a4a820
	.xword	0x73a92f8456225f6f
	.xword	0x77084ffb389e3fe1
	.xword	0x32a424762aa5e34b
	.xword	0xf073071d820ad84e
	.xword	0x4034fd9aa7e40c90
	.xword	0xfb127e6359be858a
	.xword	0x5e9b20043b7da02a
	.xword	0x444e41a0347875ed
	.xword	0x7a8371019b1c9ecd
	.xword	0x7f302f65f8080b75
	.xword	0xefe7891b458b73af
	.xword	0x9441f5d6650f697f
	.xword	0x54684f8e46107d0e
	.xword	0xd733ece5101785f1
	.xword	0x98455183abb848cc
	.xword	0x9ac27af8762eb449
	.xword	0xd6139839771c60f2
	.xword	0x7bade2d3508840dc
	.xword	0xd3d80d8b6b2b549f
	.xword	0xdc75de851dd18ef7
	.xword	0x823f42ba8e31691a
	.xword	0x53bbc15fddd48928
	.xword	0x9e2a71613a13c7fb
	.xword	0xde9904f2f3433329
	.xword	0x3f72280aa4be0684
	.xword	0x605c4afcd5e4a99a
	.xword	0x78d207a46238ce20
	.xword	0x32138dfef864cff3
	.xword	0x56ea648ac81337a8
	.xword	0x4c1a6149e8259595
	.xword	0x8e3437d948425366
	.xword	0x300ee9e477f3acd7
	.xword	0x4c9e681dc07ae0ab
	.xword	0xbcd18a800d55994d
	.xword	0x2649d42400fda4ef
	.xword	0xcafa76aa21eb51a9
	.xword	0xcd7e1e4f958c49ef
	.xword	0xe9951cc6746026a0
	.xword	0xeaa7ff840e3f95cd
	.xword	0xa09a15db2af2beb4
	.xword	0xa2126ad12f58e6b8
	.xword	0xeab4823d0b18a7c0
	.xword	0x8fe56405d2f07df4
	.xword	0xa7121887a5b87415
	.xword	0x48d52e6041963f6a
	.xword	0x1377df9ddb0225b0
	.xword	0x56bd5fbf2c8de89f
	.xword	0x334b8bdca3c17900
	.xword	0xe334affd097020ce
	.xword	0x66ce378986a87401
	.xword	0x9b14f51c1dafb4d6
	.xword	0x9622fab52f19bbe1
	.xword	0x3691cbe1038ffe58
	.xword	0x23ad9ec6b8982e37
	.xword	0x46bc8a4ef79b9755
	.xword	0xea1a83627bdb2eb9
	.xword	0x45056dde8a3bd4f4
	.xword	0xc977e5597fd802bb
	.xword	0x28ac444ed57a2f1d
	.xword	0x0bf26ecc4440c07b
	.xword	0x2b5830aaa292cd25
	.xword	0x4bfdd15220d4e269
	.xword	0x740ab700bb561b8c
	.xword	0x93ccce89658a69c8
	.xword	0x105bd84688292711
	.xword	0x95c948ab822185bb
	.xword	0x4679c2ecd3bf6007
	.xword	0x9855539fd2cbd2d8
	.xword	0x192c0e5adef169f3
	.xword	0x6c9fff785a7ac1d3
	.xword	0xb4f523160b21d5bc
	.xword	0xc065f8d39cc4bb37
	.xword	0x803c2535d660c1f1
	.xword	0xcfdef0247a5edd2e
	.xword	0x48bf6d5cbc489967
	.xword	0xa329df91eb952053
	.xword	0xac56936626819836
	.xword	0xb5a02699308c5d91
	.xword	0x1f2a194d86f89a8c
	.xword	0x4c1fe47b71ef86bf
	.xword	0xa7d9ad91c545df14
	.xword	0x2e47f3eb9d64d0f5
	.xword	0xbbeb899d00a79ff5
	.xword	0x50ccbcc0e5c1c919
	.xword	0x370f12566c4a816b
	.xword	0x1ba2b1f407109d68
	.xword	0xa41cfda391f40078
	.xword	0x73833b533e7ab721
	.xword	0xb40e50351c8703b6
	.xword	0xb66a118ad652905a
	.xword	0xacd20b3eeaa12b5e
	.xword	0x754894dc4e406af8
	.xword	0x6e1dcced239406de
	.xword	0x4bb338449579087e
	.xword	0xcdc6d1dc708405cd
	.xword	0x95aff9cadf2458d4
	.xword	0xe6a374a6a8db7213
	.xword	0xa53f9803ae9dce6c
	.xword	0x5171e6b7ae01eb2e
	.xword	0x75fdee28982dbcee
	.xword	0x89e03a9424c71281
	.xword	0x95ac667a091e2d4e
	.xword	0x276b147b5673643e
	.xword	0x6efa008a8f29ebce
	.xword	0x91afaf61fb64e623
	.xword	0xb64b60486dcf3ffb
	.xword	0x5335068b18f2ac64
	.xword	0xdabab74837ca8066
	.xword	0x2f58e6738f3d59f5
	.xword	0x0f8cf90c58dd8bdf
	.xword	0xb35c40b147d5f710
	.xword	0x731518594e8d97af
	.xword	0x2c6f8a19a94c6b3f
	.xword	0x7dac8711fa2979f3
	.xword	0x7798cf85bc3288d3
	.xword	0x42f5b75ad18f79ec
	.xword	0x434aac9edf64793b
	.xword	0x6045fc779e532380
	.xword	0xf20e7a9233b6565e
	.xword	0x89ab3a5717739d61
	.xword	0xba7a75bf01488d50
	.xword	0x2754157aa0d1ddf3
	.xword	0x896b58a7147b2893
	.xword	0x97ea7facefca5b4b
	.xword	0xaec30ea4655406f6
	.xword	0x099e978deb2762da
	.xword	0x8160d173bd5a50dc
	.xword	0x25f1ce56e7007dfe
	.xword	0xf56030606f6dbd35
	.xword	0xced37bf234620d0f
	.xword	0x80815b24d18cb6f6
	.xword	0x0c2c8232cd39877d
	.xword	0x7ad4edbf9144c150
	.xword	0xd93e4fcea3102215
	.xword	0x034e20814d8f3900
	.xword	0x276f423c861e0699
	.xword	0x2595bd307cd8d22e
	.xword	0xe5a60f4181c3f4db
	.xword	0x352acec6e8bf94b2
	.xword	0x92afde9b16307053
	.xword	0x1017bd32bdc8d82d
	.xword	0x25040365bdb0ee29
	.xword	0x9438a31df387bde3
	.xword	0x5ae0f25fa1218975
	.xword	0xfc763b9b857bfd5c
	.xword	0xc66730d5bb51a924
	.xword	0xa26a17c59f648f7e
	.xword	0x2439162db559d254
	.xword	0xebe5f895792c4a74
	.xword	0x9d3704b220d932eb
	.xword	0xaf47c6d00ab7b6d8
	.xword	0x8b464bcd061b8fe2
	.xword	0x94f6d8dced71bbc6
	.xword	0x84f88a5910cda478
	.xword	0x785be5e73edb68a8
	.xword	0x65d200ab64cf0b35
	.xword	0xb65ae8b7b31f5c21
	.xword	0x3e25b9ffdfacf9fc
	.xword	0x74fef5b452920429
	.xword	0x48fef040bffc70b1
	.xword	0xead35be53ce37769
	.xword	0x2c8032cba3559917
	.xword	0x1f64242d6311d9c6
	.xword	0x77470ee25aca318a
	.xword	0x23a8f27057662168
	.xword	0xe2f1af2f068d9d1e
	.xword	0xbd02e2d195ab060e
	.xword	0x17cdffda8b1c5277
	.xword	0x82738c0cf266f46d
	.xword	0x8fb1758d7abae7e2
	.xword	0x426d680362837eed
	.xword	0x18355a638b485d4e
	.xword	0x0ed6b2d4c6d28dd1
	.xword	0x9268207b2a731c29
	.xword	0x0714bf31688001bb
	.xword	0x4322713920455a61
	.xword	0x23c6b3d62cade418
	.xword	0xfec8448d2c4db78c
	.xword	0x882b17439ff8c727
	.xword	0x772bb686606aa07a
	.xword	0xf37074b04a4ce2f8
	.xword	0xa9496ece197c4f9f
	.xword	0x6f072f5316a64700
	.xword	0x3d8369aabcc60999
	.xword	0x8857eafcf254fad0
	.xword	0x24904d17181383c8
	.xword	0x81b5fca14ce2ec0c
	.xword	0xcf76127e44a9013e
	.xword	0xd77cf36d78a3862e
	.xword	0xf4fb81125c38b12f
	.xword	0xeb77531a19cee4c9
	.xword	0xde0b5ef1f1dfdbd6
	.xword	0xdf6c518cbe969120
	.xword	0x31730eb6e6f4cc96
	.xword	0xc9a47c70a78499b6
	.xword	0xaf16d593ee60c018
	.xword	0x60c4c12d2be3a762
	.xword	0x6e660026cf5e338c
	.xword	0x46230234633e9ffe
	.xword	0xd4b8cefa314fbcbe
	.xword	0x508bb2c522e7622f
	.xword	0x4032576a5106f4ff
	.xword	0x56a363b4d79bdf37
	.xword	0xa3a6074e47b8d895
	.xword	0xd6dec9a2fc1296c3
	.xword	0xeb4482d9458c6fe2
	.xword	0x1fd088df02625dab
	.xword	0x72d624937908411f
	.xword	0x230ed24d95cb4e6a
	.xword	0x0ef3e60f92f6bf0a
	.xword	0x7af925fcb19165ab
	.xword	0x00c9a876b86a7216
	.xword	0x472cfe23f6a593b7
	.xword	0xf620390535c9463a
	.xword	0x313ddafc416619f8
	.xword	0x4cfdc57e894a2382
	.xword	0xb2a76f951ef62f65
	.xword	0x48d91b770fe4fb56
	.xword	0xa2f16d106347283b
	.xword	0xebc3e74bd6112d41
	.align 0x4000
	.data
data_start_2:

	.xword	0x931865f46dbd4b57
	.xword	0x56dc1f222b9fde2c
	.xword	0x3400a5238b66f7bf
	.xword	0xbbe46353c78c111f
	.xword	0x223ea80cf4336d0f
	.xword	0x1f95e0c3b00a8778
	.xword	0x8e6e2b11db26b227
	.xword	0x829253a15106a5b8
	.xword	0x22149d5dbef1566e
	.xword	0x573782bd1107bc14
	.xword	0xe98433512936cb70
	.xword	0xbf715ace4b984e1e
	.xword	0x1a013849f566ffaf
	.xword	0x636bc44dca24fc08
	.xword	0xa47209f7ff4eb1ed
	.xword	0xc895b88c7ecd871c
	.xword	0xb3dfa8131681e075
	.xword	0x65c20b4f4c27c5fc
	.xword	0x0775797918f79bd2
	.xword	0x18e3be46de7759da
	.xword	0x4f0d8626027a0689
	.xword	0xa622e963bf648839
	.xword	0xe5ac0f6103d3701a
	.xword	0x0163a32d29af42a4
	.xword	0x5a3004af864563d9
	.xword	0x28927d8acb4b740b
	.xword	0x9101ddfd3685d686
	.xword	0x13cc7bf3e8735ee9
	.xword	0x3572033534c03802
	.xword	0x608a9674ab1cce40
	.xword	0xa287e6426fbb0021
	.xword	0x4ba9d78cdd69dc53
	.xword	0xe39b60d2d65bf01b
	.xword	0x562aa42c2225721b
	.xword	0x47f862650e3535b7
	.xword	0x55365072782f194e
	.xword	0xd23869acd0dc1612
	.xword	0xf0f3bf66576fdd82
	.xword	0xe18ef3cd3a2d99f5
	.xword	0x6cf07683cc84ef94
	.xword	0x0b805a188949f0c6
	.xword	0x877e2619d6f5ecb0
	.xword	0x634dfbe4f8daf09e
	.xword	0xe00f0b601985b101
	.xword	0x44ea353f574d5024
	.xword	0xc27c5ba002c09139
	.xword	0xc1d04ad40c40fbc4
	.xword	0xc8e17d6b7948c011
	.xword	0xe984638add3c9084
	.xword	0x6b08e50cc16ba179
	.xword	0x502b273e4bf3aace
	.xword	0x98c0c990bff40e73
	.xword	0x35aef5f49f31602d
	.xword	0x4d41531a3c571aa9
	.xword	0xa144669ba5891a1e
	.xword	0xf883b303f27822ec
	.xword	0x9c52c116995938fc
	.xword	0x0c9753b8452fc576
	.xword	0x9d6e9398d5bc0348
	.xword	0x8ed3c0651499d588
	.xword	0x5f43db109122c686
	.xword	0x7f2aa17eec0e99b1
	.xword	0x4bba3ed77480cf69
	.xword	0x4a17f0d710a3fe3c
	.xword	0xb14290510c6a8b20
	.xword	0x92a5e64a1fdcfb7b
	.xword	0x6ab36073cd385af3
	.xword	0x4827a3178fc25c1e
	.xword	0xa81830878aac3e33
	.xword	0x45e407d4fa519fe7
	.xword	0xfc743a79e66cff08
	.xword	0x57dce298ac2e0800
	.xword	0x2a378c2810224e64
	.xword	0xf7d8ae8cb3be99e2
	.xword	0x7e1ddca2313320b7
	.xword	0xe726f389d91f6d6c
	.xword	0xe93e69fed00647ff
	.xword	0x63e55c3e2a802fd5
	.xword	0x95e8197a8652c7bc
	.xword	0xb5ad7cf8855862b6
	.xword	0xcf83f5ec8b7aae37
	.xword	0x21f0e585f5d53d41
	.xword	0x2f06309aa19628d2
	.xword	0x00ef06a5daadcb06
	.xword	0xa82036d90751b048
	.xword	0x9db0bac91ac5cfd9
	.xword	0x1381820830445bc6
	.xword	0xb3af9f8ed835a0cd
	.xword	0xeb1e59371762f741
	.xword	0x12543554c0f35e8f
	.xword	0x07bdd1205a230b80
	.xword	0x11601b5a93c35e55
	.xword	0xd486296a58e05c12
	.xword	0x9e86dd8952064e1e
	.xword	0x4a83342608999afd
	.xword	0xa20036e79f969f9c
	.xword	0x793d61d0c3ba731c
	.xword	0x80dab04c823dc145
	.xword	0xc23e600beaa7bcd5
	.xword	0x6942236b8af86c2d
	.xword	0x0abe9b51eb166cd1
	.xword	0x6ad81e0e6f5d1072
	.xword	0x1c7c3cdc85d773c8
	.xword	0xf1e94eeb98d0d9c0
	.xword	0x376d05c04ac29cae
	.xword	0xf1510f45dd273964
	.xword	0x4ccb595b45ea0270
	.xword	0x9bfe0bde3213ac93
	.xword	0xcb13843d1173e6c9
	.xword	0xa1bcba021a55ed3b
	.xword	0x76d34add328beccb
	.xword	0x6a3b2f33371d7958
	.xword	0x47366137a55c1355
	.xword	0x9a20493a0f0b090d
	.xword	0x84e64cf00edfa421
	.xword	0xa80d0cce23862375
	.xword	0x2c3d581c4bf65467
	.xword	0xc7c4ac8cc3e8433e
	.xword	0x9d4df136309c82dc
	.xword	0x71b555dba0607da6
	.xword	0xd6f68555b174ee50
	.xword	0x5e0d47630c3a023d
	.xword	0x0797540e776883fc
	.xword	0x1875abfa6ebda701
	.xword	0x011655ff2aba1c98
	.xword	0xc017955a018efc15
	.xword	0xe102ddd7ed7f699f
	.xword	0x716bbfd6889d519a
	.xword	0x6e5f12749398bc9b
	.xword	0xe965edca15541f24
	.xword	0x7f7ed25a26925fe6
	.xword	0x58e4d45cd66a6c08
	.xword	0xf802f932cc407490
	.xword	0x4f4a998cd9272348
	.xword	0x02caa7e101aa61c9
	.xword	0x8df7a9ff3bafc6df
	.xword	0x970de2837aee77ed
	.xword	0x2c5533c8d3fdbee2
	.xword	0xd71fcd778becddc9
	.xword	0x85ede6194eafff89
	.xword	0x83a9f8d15846d3e2
	.xword	0x66b7d30b6bafa2e3
	.xword	0x04606fccc166eb1a
	.xword	0xbb4e24325f3b7509
	.xword	0x61db7e2f4fba8983
	.xword	0x1e209dd95c57f308
	.xword	0x5c5431c0ebf695fb
	.xword	0xa6616e60fcac4d12
	.xword	0x75ec0dff8cb281a9
	.xword	0x0b5f940ea1a54731
	.xword	0x5afffb3846b6b767
	.xword	0xd3ae21f0ddf574aa
	.xword	0x14625d0e51dbf495
	.xword	0xbfc1fbda4afaf07c
	.xword	0x1aba2c5c7a521eed
	.xword	0x73f8bc7a7e8719c7
	.xword	0xcd78f1b5640ba6d1
	.xword	0x2d34e879e4f66c21
	.xword	0x78949bad9a8a3287
	.xword	0xf063d63f8345d3dc
	.xword	0x4bb0a8098d6027cb
	.xword	0xbf39101cedf8aab2
	.xword	0x81e22b36a9f0059e
	.xword	0x3301986d51f5e6f2
	.xword	0xa7161597a42044e3
	.xword	0xce63e9fa393007d7
	.xword	0xec183be4a3216c1d
	.xword	0xda0e7d8788868710
	.xword	0x4f0d8cc09f397276
	.xword	0xbde5947e76ecf2ec
	.xword	0x16f184ca7cfe7c42
	.xword	0x9f063fea6840dd40
	.xword	0xef784e3a18c32cfb
	.xword	0x02553ee734f1996a
	.xword	0x8bc056664d1ac576
	.xword	0x9e1984fd55f7f5ea
	.xword	0xc133875ae05dbe87
	.xword	0x4e43ad4d0f31543b
	.xword	0x927244c5e2853270
	.xword	0x7ffe4e3c505818c7
	.xword	0x7c244cf6000153ec
	.xword	0x36725316e0d809e9
	.xword	0xb6e9f6fb513b3f49
	.xword	0xd5e93ae353530f0f
	.xword	0x7bd188981d60ec3c
	.xword	0x1d2743ccf3b3cd82
	.xword	0x479d92e5eca4e96f
	.xword	0xed8304da5742d218
	.xword	0xadc74a045ce672a4
	.xword	0xf1d373ad8fe4c510
	.xword	0x4838f96b5e2df0a5
	.xword	0x979a59d1a6726a27
	.xword	0xbf016bc5479f65a5
	.xword	0xe423a01057735ebd
	.xword	0x7fe5dbb85193c638
	.xword	0xe6eb4979679f6356
	.xword	0xdc1340c90808f976
	.xword	0x9f93ee01a9ebf132
	.xword	0xa413f5757b93b934
	.xword	0x2d590402d4cca49e
	.xword	0x882a6c9cf38fb104
	.xword	0x81d1cca6ba0d9351
	.xword	0x50b59cc35d6c7b44
	.xword	0x72fc2d37a318b786
	.xword	0xaa9cf9262f34f89b
	.xword	0xa01bc8cf4b0ee7f3
	.xword	0xe3b19e8ddfe2fd3a
	.xword	0xb648e646d462535d
	.xword	0xf9ace497be9832a3
	.xword	0xf66402b2d6930b96
	.xword	0xe52df0283746fabc
	.xword	0xc96bb9b5e5be4ac9
	.xword	0xcb23e29b23d4be37
	.xword	0x1e9d375e68b70faa
	.xword	0xb202ec84c4a46761
	.xword	0x88e3be3d477fa215
	.xword	0xbd95ff415a8c63ee
	.xword	0x5ff14f5014fcd947
	.xword	0xa59cdee4bf468a44
	.xword	0x5aa459c150f07226
	.xword	0x125861156e1b16ae
	.xword	0x00b0a866adb110b9
	.xword	0x7c8bf4c3fe083693
	.xword	0x83a22195668dafa7
	.xword	0x76b235c503f241b0
	.xword	0x830af64a5f34d96f
	.xword	0x8a700c7233d2d340
	.xword	0xaef79324dbdc6d47
	.xword	0x06bb304eed7ef521
	.xword	0x8941214f3ff2511e
	.xword	0xf1b11d503ec6db66
	.xword	0x641e03a784a1df6f
	.xword	0xdd8cd88b18ed1e99
	.xword	0x5d4aedb48b8b6fa2
	.xword	0xea62f505d58e9f27
	.xword	0x7d70bc83afe6c552
	.xword	0xc3eb6d81ac20b87a
	.xword	0xdb358ada6e3a04e0
	.xword	0x4a38557796e4da08
	.xword	0x4b965c1430f2f6eb
	.xword	0xa2c52c4c4370a25c
	.xword	0x5ed3c68cde5f7c46
	.xword	0xfb19aa39795487d2
	.xword	0x2190c97eddb7ef94
	.xword	0x00fe5d391c7e5a0b
	.xword	0xc0383f2792fc5504
	.xword	0x8e0a7669f13ba5c4
	.xword	0x6a93a89e6c79ec9f
	.xword	0x13f5a049d45e8d55
	.xword	0x1ccb0b22512f1dda
	.xword	0x0152b6946f83ae88
	.xword	0x8ef17253b0ecf59b
	.xword	0x283e6fb43d342901
	.xword	0xe7472fea8c876c61
	.xword	0xe82adb3c00bc0707
	.xword	0xa62cb86aad19c866
	.align 0x8000
	.data
data_start_3:

	.xword	0x3b8a9e9f146f2c7d
	.xword	0x80f74beca4fa121b
	.xword	0xd7518fa7bcb0da12
	.xword	0x29d496184fda628f
	.xword	0xc386792385ca592f
	.xword	0xdb198a56254d18e7
	.xword	0xa33e77216cc3cbd5
	.xword	0xe517e546faaf7a88
	.xword	0x3eb079b0c0ebfa4f
	.xword	0x8c111b254152e4dc
	.xword	0x56dd9546a6a7e098
	.xword	0xbf4a70317737ba64
	.xword	0xc8a5dfbf0aaf075d
	.xword	0xf3bc209d1e720316
	.xword	0x9baee78d4985027b
	.xword	0x6a27be93a113403b
	.xword	0xf633d75bd83f8eb9
	.xword	0xc4f2a0c446914c38
	.xword	0x7ce4eddfd56407fe
	.xword	0x7a77f975a9448e48
	.xword	0x998439b177063b26
	.xword	0xa389cb1699124755
	.xword	0xb58ef7150fe7fd60
	.xword	0x935964d08f7df717
	.xword	0x11b9bdd7f50909c1
	.xword	0x36eef56bec9907ae
	.xword	0x2a7c17ae68d2a080
	.xword	0x349b2a9652d8c012
	.xword	0x521f112c1ff4a34a
	.xword	0x50cff569e821ce61
	.xword	0x5f1b6b813d3b6b8f
	.xword	0xa471d1e0fd668c7d
	.xword	0x3e27b340a1c0e258
	.xword	0x21eb9168b97ff893
	.xword	0xd645dc6590d56f43
	.xword	0x535241361e18d023
	.xword	0x11791ac035a2d97e
	.xword	0xabf65d0daccba7a3
	.xword	0x7731b633b901cbc7
	.xword	0x37b89bbe285468a8
	.xword	0xc2284040a6a11789
	.xword	0xfb5c297db9e41dd9
	.xword	0xdf3eb96200f944fc
	.xword	0x907c3b3da132589c
	.xword	0x394d85af64f8f79e
	.xword	0xee3b7ee7494cf519
	.xword	0x80443d91dfe35644
	.xword	0xd2a876fe00c27868
	.xword	0xd36beb5228c06767
	.xword	0x667f85f18c49fc04
	.xword	0xd2c7b3b049ab8084
	.xword	0xba347f91e1b836a9
	.xword	0x12828fc501cfdd95
	.xword	0x0628f5b340b947db
	.xword	0x557398682995eb66
	.xword	0x6ed62e09d5358568
	.xword	0x384307de82aa35f3
	.xword	0xf1d9fd95846c8934
	.xword	0xd86d416ba78d260b
	.xword	0x8f427bdf3c918592
	.xword	0xec96264168e71b89
	.xword	0xad4ea9aeadc2edf6
	.xword	0x841c259fb68edda4
	.xword	0x348d1aeabcd6f034
	.xword	0xd8e6b7e3be2f3854
	.xword	0xa996692a4ebf5daf
	.xword	0x74e247bbc75a365e
	.xword	0x7279590dc75fb67e
	.xword	0x6cdeed2c2a3a6a93
	.xword	0x5a011d190bb093df
	.xword	0x259b970aadb78339
	.xword	0x70aaf439029d72e5
	.xword	0x2913d4ecb3140153
	.xword	0x511cbb1df02d3c41
	.xword	0x0bbd83da5cf3c716
	.xword	0x7da60a15642f3be3
	.xword	0x9443d24e5704eb6d
	.xword	0xfd2bdb70f5cbbd94
	.xword	0xa4035d71c0ef8308
	.xword	0x06f804ed8f8612e3
	.xword	0x4e07eaab3879f1ab
	.xword	0x88742ee16aebdcc9
	.xword	0xf22ba4093116626d
	.xword	0xa599e26deda3eac0
	.xword	0x7dac66d6771b8b3b
	.xword	0xcd38920b3a44bb68
	.xword	0xae1f4df45be93c14
	.xword	0x3f12298b4b8a1d75
	.xword	0xf4689dd00d5c1121
	.xword	0x650480698dcbf531
	.xword	0x8ba5114be126c9a3
	.xword	0xcb682e9a0e81e8ee
	.xword	0x7d38439221da1e30
	.xword	0x62407df242fbad83
	.xword	0x39c28f7e44e10016
	.xword	0x147ab92c0d99bd1d
	.xword	0x423b3aa74ce2c531
	.xword	0x3f83c9b7f32ef63f
	.xword	0xf91f9422c5da150a
	.xword	0xe8520367255891ef
	.xword	0x48f0f2211d22f860
	.xword	0x4eedee6cf2762e5c
	.xword	0xe2f390719713fd60
	.xword	0xd30c28b5620623ca
	.xword	0x3ce6c7cfedc7136b
	.xword	0x4fa9827086b3c315
	.xword	0xf0cfe15103e74e60
	.xword	0xe99627724407fff3
	.xword	0x9addf9d678f68d30
	.xword	0x5e101a0409954a22
	.xword	0x611d14f161af2599
	.xword	0x834dd06d5dd60ebb
	.xword	0x0d3f135b0c0e2757
	.xword	0x87ce978f653090ea
	.xword	0xf606a1b4c315609f
	.xword	0x5ec62b446249f07f
	.xword	0x55e8e0c1478bbdc0
	.xword	0xc6c3efad1b0878de
	.xword	0xed405483e818b58a
	.xword	0xc0364d430cb32e51
	.xword	0xf3789d4aa621af6b
	.xword	0x56177b915ef574ef
	.xword	0xf41529b8c73b42a5
	.xword	0x2509fed0ecda5622
	.xword	0x7da8c1d5f3ce72f0
	.xword	0x1ba7d25c561d4ad5
	.xword	0xbf3c3cadc71c77e9
	.xword	0xe5778da17948ac75
	.xword	0x78c500dafa85b8ab
	.xword	0x121f5cdb982d8dc5
	.xword	0x680dd8a4d5b65152
	.xword	0x2d0a11d934b660d0
	.xword	0x56317313eb7dd97b
	.xword	0x016667d6d61452bd
	.xword	0xafed1e98ff284099
	.xword	0x23a373e4e6d40543
	.xword	0x87a77b9fd4688d34
	.xword	0xd4de1bd8733f841d
	.xword	0xfd8b59c802e37fed
	.xword	0x61784ca670f8007a
	.xword	0xbc2d2c87881e3f7e
	.xword	0xcb2127df893eea03
	.xword	0xfe8af464e7615579
	.xword	0xdc7360526e6dec78
	.xword	0x184be7961f286e5b
	.xword	0xe03fb4cb6ab54715
	.xword	0x6275f8d5e577b13f
	.xword	0xef4888d4b135df8e
	.xword	0x969d8f5bb177cf17
	.xword	0x0459b9393dbb594a
	.xword	0x7415784234a258eb
	.xword	0x9ceec829753be607
	.xword	0x2d557b8367449d40
	.xword	0x6dfbdc687d3827f3
	.xword	0x0bd58bcc34ee05e0
	.xword	0x32de261ecdf33070
	.xword	0xe89dbc02f21071d2
	.xword	0x64dbb1531e13f2ad
	.xword	0x048413ec44380f63
	.xword	0x4a6df60e81ac8fb4
	.xword	0xef4a60003a861d98
	.xword	0xdc2ad487044f0b56
	.xword	0x706dd5ceab85b001
	.xword	0xc3c6735f7e54523a
	.xword	0x214680ba2c768a95
	.xword	0x1e221c8450bbfbc9
	.xword	0xf2f8e18f3eabc830
	.xword	0x2b9cc3872a74f980
	.xword	0x630d6bd90267e5f7
	.xword	0x299a461534cd1e87
	.xword	0xe6f34ddb5cc11f52
	.xword	0xa2c275c0b7820595
	.xword	0x236ad7de8083213f
	.xword	0xe7640d2576191e2f
	.xword	0x0c9d3b054136f2bd
	.xword	0x6cae2031814d34d6
	.xword	0xe8e24413108bed8b
	.xword	0xfa2dcc2bf440d1a0
	.xword	0x06b248429b5fe486
	.xword	0xbac2fb2b81d29661
	.xword	0x3c98e569eb8a8751
	.xword	0xa6a979a9078a1115
	.xword	0xf5431cc78a724657
	.xword	0xfbc7e2de79a3300b
	.xword	0x96db5d4d45b13542
	.xword	0x7687a7213df2ced8
	.xword	0x0276ce95e954b6c8
	.xword	0xcf754921b8bf65b6
	.xword	0x9291e6308bae43d7
	.xword	0x47d56f38955b7959
	.xword	0x46f36effab8e9ad2
	.xword	0x202238373901fabc
	.xword	0xff8bc559f1ad467f
	.xword	0x595d7f3d343dec26
	.xword	0x4c73c917e419cf50
	.xword	0xd60a9b8ab8da4565
	.xword	0x5692c59704762245
	.xword	0x3d9cc746dd8e1042
	.xword	0x2743d4ea586f4c02
	.xword	0x7e0c103db63190a1
	.xword	0xf1551b50350863fc
	.xword	0x83b5f61f7affa52e
	.xword	0x99a00170214c6e20
	.xword	0x494f4044b1d85328
	.xword	0x06d762f32005f4de
	.xword	0xbc090e83594656a6
	.xword	0x512607f2590eb719
	.xword	0xbb50d9bbbeef1481
	.xword	0x39c33cf0be1867e6
	.xword	0xe79c20092d7bc634
	.xword	0xcecaaf458e99ba7b
	.xword	0x53dc83f7b8c92c6b
	.xword	0xd803545ad6903055
	.xword	0x4f601e1b7f486057
	.xword	0x54e971a024fc5edd
	.xword	0x1d4cb0bb1c58ac42
	.xword	0x7740b5eac70b9b2d
	.xword	0x297e603e5c492c46
	.xword	0xa68028d84a3995f1
	.xword	0xef7425a01f09ae57
	.xword	0xc7b79bcb952b8e3a
	.xword	0xb68ff2546fb78e70
	.xword	0x50b104766e9d958a
	.xword	0x7bc598408ff3bd01
	.xword	0xa6cd146948193386
	.xword	0x82f67b3e6dfe83ae
	.xword	0x0cb4f799822d9ab9
	.xword	0x1c7f047a1b61d707
	.xword	0x0946aa3466c72ea2
	.xword	0xca7680886e7fe974
	.xword	0xb52ff3ab36020a5b
	.xword	0x34521b802d078a2d
	.xword	0x0bcca12b2eeab39d
	.xword	0x294c35a47ded61df
	.xword	0xb0e7d05a2ccefc8d
	.xword	0xa1982fc1e93e5a02
	.xword	0xb571a02ec010db8e
	.xword	0x170bcc35750ce5d2
	.xword	0xd86136319eef166c
	.xword	0x2f26fc21c43234cd
	.xword	0x96e88f4755fb4cae
	.xword	0x9bbb627c670fb00d
	.xword	0x991e097eb856158d
	.xword	0xf80b554666041432
	.xword	0x40000e9bf36c59b2
	.xword	0x376075b8b3e57e6a
	.xword	0x2a7c52cc1c552b4a
	.xword	0x93d5ff296ff590d6
	.xword	0xd430f073ff5786fe
	.xword	0x9e0f9672a4623268
	.xword	0x5923f60a67564ea8
	.xword	0xce697b6fbb08b68e
	.xword	0x50fe50df8a716c74
	.xword	0x956a91ee28b5a3a2
	.xword	0x1b0935efee050117
	.xword	0x815d6e74dd3003f2
	.align 0x10000
	.data
data_start_4:

	.xword	0xbc2d89fa435fbd0e
	.xword	0x93c47162753f45b2
	.xword	0xc429d316db84bcbe
	.xword	0xb3bd96cf8cf7b53c
	.xword	0xee27f4c7e6c4730f
	.xword	0x9eb74f230c2172d3
	.xword	0x4889064debf4b158
	.xword	0x811446fd80b77184
	.xword	0x94164980f7182ae7
	.xword	0xb5177aa4c69a098d
	.xword	0x1128102d29ed546b
	.xword	0x46ba9f26d7f33025
	.xword	0xc423f59df7271c64
	.xword	0x6d8c06f8bb20ebfb
	.xword	0x7a9ffa9f5b8e69e6
	.xword	0x0b87604365860a70
	.xword	0x87597e35c596acdd
	.xword	0x82f19134c9db3e92
	.xword	0x8a7db620a6222b9d
	.xword	0x98397330371c1dd5
	.xword	0x69d02e583ee66c25
	.xword	0xe4aa3d78adf8e248
	.xword	0x1a97dafe8776424a
	.xword	0xde4cedb96d498164
	.xword	0xe32cee35e8ac0654
	.xword	0xb251ae098004cb01
	.xword	0x300bb7597ab85783
	.xword	0xc5f37d44eecdd204
	.xword	0x4af7e7c1a7e8539b
	.xword	0xd792bfb9adf40709
	.xword	0xd0f8ee5f18e28b0f
	.xword	0x995f060ffb854576
	.xword	0x781a3bc5178c8b40
	.xword	0xec2d1a0990cd4813
	.xword	0x3db6de76f1b02dd1
	.xword	0x4595cf77978ed013
	.xword	0x78357de56d364334
	.xword	0xfe029aefe889d1d5
	.xword	0x7596d54c04d2e617
	.xword	0xac49199f1be3651d
	.xword	0x1dbab86e81bd3628
	.xword	0x2176d4f90c9f3082
	.xword	0x18e9d63f32f338f6
	.xword	0x1ab56b6af1ae24cb
	.xword	0x44119a9e8887df57
	.xword	0xf58d5f070d9b261f
	.xword	0x9dee4cb5ef502aa1
	.xword	0x4b93a529ca682daf
	.xword	0xc1580f4395566e97
	.xword	0xb8adc3442ced20ea
	.xword	0xcd2e1f42e582f27c
	.xword	0x45423290a13bea09
	.xword	0x49f71202d3401708
	.xword	0x221b520e8859a2fa
	.xword	0x2af25ae7015d6a17
	.xword	0x93333c1501af33f1
	.xword	0x1bc93cb71611c3e9
	.xword	0xe46b1e292bcd0d4e
	.xword	0x5344cb6e51458a9d
	.xword	0xa241fde2dd84f15f
	.xword	0x0a8f76ca9b8e9bdd
	.xword	0xf150d93ef58872b2
	.xword	0x7269b90e901507dc
	.xword	0x0c6e4be09ff04eb8
	.xword	0xd6532d31b314b724
	.xword	0xefca11d54074c790
	.xword	0x7899f8aa166e20db
	.xword	0x5bab4bbb208a7299
	.xword	0xa0b9ce836a5d63f2
	.xword	0xc7e18cf7854f520f
	.xword	0x44a0740bae70f02b
	.xword	0xe265afad542c69d6
	.xword	0x6c8e40ee6f404cfb
	.xword	0x1a126045e09e19b6
	.xword	0x4c1fac07e2df76fc
	.xword	0x3bef501e2a3aa5a8
	.xword	0xa58a78e328931918
	.xword	0xccefe682a859aa99
	.xword	0xe32860b66a454588
	.xword	0x3e19afbc34f872ba
	.xword	0xcb974b50962a0395
	.xword	0x336eed535078d6ee
	.xword	0x6d9f7f8ef0a6d453
	.xword	0x7ef8d3be5f637bfa
	.xword	0x847e35cddf8784bd
	.xword	0x511d97121b636054
	.xword	0x3e9c6983f36067ff
	.xword	0x68e4961bd8088291
	.xword	0xd70c8c13b6e739f7
	.xword	0x2fad9785935a65b8
	.xword	0x4fffa48c6aa4fa26
	.xword	0xefc63f289b9e9a17
	.xword	0x7d74e2d6b1dfdab0
	.xword	0xae681cd9b6ee75f6
	.xword	0xa9b5a32a1e67a395
	.xword	0x4696a2b1dd62b9b2
	.xword	0x303670aca14f7d03
	.xword	0xc94a077740cab4d5
	.xword	0x3fb853dc534335f4
	.xword	0xb62bcfd10bf722b5
	.xword	0x59bb9848a37c037c
	.xword	0x20aad0d3ebec9877
	.xword	0x0743347533cdccae
	.xword	0x6a586d86cb957a73
	.xword	0x611159653ab79f7c
	.xword	0x9df4c42dc6e076e4
	.xword	0x894219d035db4c87
	.xword	0xca2485f7af4528c4
	.xword	0x62f4688a304e7294
	.xword	0x888949d133edbaa5
	.xword	0xe8e07bb523cb536b
	.xword	0x30f356f2d4b29c93
	.xword	0xdc292ef3dc113720
	.xword	0x2797aa7dfd3dd4cd
	.xword	0x3e1809a574ce799a
	.xword	0x90ec4456def55a5e
	.xword	0xd7f75c67fa94c984
	.xword	0xb8a9b5418bba6f91
	.xword	0xf072cc5503f0f42b
	.xword	0x2f896283714ce2dd
	.xword	0xc910fe0a23a01931
	.xword	0xaea73e62c48db240
	.xword	0xaa011beec775d387
	.xword	0x85c3f080d6d160ef
	.xword	0x31e4391fd05a388c
	.xword	0xd9ebd131f68070cb
	.xword	0x9033abcaa03f9ddb
	.xword	0xa229cd1cddc21aea
	.xword	0x00b3959865292072
	.xword	0xe35036e20e1c93e6
	.xword	0xd209b3b792e92901
	.xword	0xf9dd2fa1b3dad3fc
	.xword	0x8dcc4f0f7602d0a5
	.xword	0x574d7a9ce443231a
	.xword	0x45c43721e21c0005
	.xword	0xe6708dad5d9fc88c
	.xword	0x088925a41d916893
	.xword	0xa38d9caa21718804
	.xword	0xec505cbe906e19f0
	.xword	0x36457aa8081d4e44
	.xword	0x38e82fe698094d8e
	.xword	0xf0620b54fae18b44
	.xword	0x6552eaa5db858f85
	.xword	0xdde8e697c8b47604
	.xword	0x1aa8ab105a2f76dd
	.xword	0x088259415dd32882
	.xword	0xcaed2ae033d82018
	.xword	0x0838f70a7f2d01dd
	.xword	0xeb20158ecac8e488
	.xword	0xf4550aeabc88292c
	.xword	0x9c515f20419ace5a
	.xword	0xf8a1437df8d8d5a6
	.xword	0x5639d1eb2aeae94b
	.xword	0xfa4cd18b3c8702ce
	.xword	0x611f719ac83ca026
	.xword	0x27cbabc67ea560f8
	.xword	0x68d8aa56dd5e183a
	.xword	0x5f0ff6cbdb2814ef
	.xword	0x0f33c448c60d031b
	.xword	0x439a5cc9e940a313
	.xword	0xd218febeab839da3
	.xword	0x05122ba7cfb20955
	.xword	0x0dfd70a8f23fb8cb
	.xword	0x2116b30db9246f18
	.xword	0xd271c72aa97b90a2
	.xword	0xc68f3e2867891aa8
	.xword	0x0fd24d091139888a
	.xword	0x8529a4e182721c66
	.xword	0x4791fa89122b7452
	.xword	0x95b524f9bac5469c
	.xword	0x9babb62d9a237aec
	.xword	0xfffc2b13ea1d507d
	.xword	0xa047b70f5c79e70f
	.xword	0x7cb6b7253a1d2e77
	.xword	0xeb22e822ab5f6de7
	.xword	0x2cf120fb3d9853a6
	.xword	0x960b46b80cdb32ed
	.xword	0x7f78d9ef549e939b
	.xword	0xdc37de9b8d5074fe
	.xword	0xf684160c699f3635
	.xword	0x817cc346d3016788
	.xword	0x52b5a8d1e5daff45
	.xword	0x4ed883913101121f
	.xword	0x6eac332d154a7348
	.xword	0x176d350975107ed8
	.xword	0x3434ab37ab5ed7e1
	.xword	0x0270994d0113a12b
	.xword	0x3ce5e6adf4144f66
	.xword	0x35a7beb54e61bb18
	.xword	0xa0f8884d92e68605
	.xword	0x2d641d853a8c963b
	.xword	0x586499e13476b2b0
	.xword	0x473f8c9e2ac8b974
	.xword	0x0a8967bfd0ff9fd0
	.xword	0xffde3df0bfd5878c
	.xword	0x1b4214db2762ba56
	.xword	0x9e3fdc04bfe65ef6
	.xword	0x32e13a662705ac86
	.xword	0x4e89467e2e12bf83
	.xword	0xb6bd0d88172e9eae
	.xword	0x5c9d5db1bb4a19e9
	.xword	0x90249367e485fa28
	.xword	0xefa9d8fd5de7d0d2
	.xword	0x1964ec8d42ff0463
	.xword	0x1b26358a3a032242
	.xword	0xf5f332c21c8643ba
	.xword	0xda6df2bb964906cf
	.xword	0x352cc3617921fcba
	.xword	0xdfe1da8ec65344ae
	.xword	0x4d8941a43c421be5
	.xword	0xf0bca7ef6903eb4d
	.xword	0x23cfd9bb41373dbf
	.xword	0xfb5113dced4f9c00
	.xword	0xba04c2030a9331f2
	.xword	0x0c5b930f282f0a5e
	.xword	0xe9b94be4a5f77e78
	.xword	0x866502046a53f585
	.xword	0x9c74760c75be5645
	.xword	0x3f02ad87966b093d
	.xword	0x64a67ef4093e47ca
	.xword	0x0174814cbc56fc97
	.xword	0x954703253525e770
	.xword	0xa7f98917abd57d48
	.xword	0xa3aacd5ee54641bc
	.xword	0xfeb5fb05f8501676
	.xword	0x19c0d45071e2edec
	.xword	0x7b744b6da009fc8e
	.xword	0x290b48033afdd2c9
	.xword	0x16988b0cdede4990
	.xword	0xd869240299fb98b5
	.xword	0xdbc265a0b9af3281
	.xword	0x72fc068fcc70af27
	.xword	0x75ce0f7ba4ef9e0f
	.xword	0x050ab42599a389a6
	.xword	0xe239d0ed40bb5057
	.xword	0xa346b588e60acd4b
	.xword	0x79ab8fcaf44dd68a
	.xword	0x15715f2a93a02dd4
	.xword	0x778b245da982a365
	.xword	0xfb13276765dae1f6
	.xword	0x961ee6f79eaf063b
	.xword	0x2681430682be26d7
	.xword	0x7562a62ddca840a8
	.xword	0x415873f9675a3351
	.xword	0x74c71ebb2de0a206
	.xword	0xd7b216f96d3c4757
	.xword	0x2a359b0e2767a04d
	.xword	0x9c2bf0a72bfe18eb
	.xword	0x0fea02a1a9c16953
	.xword	0xd276ac57871d68b5
	.xword	0xbb0091681aecdcf1
	.xword	0x85ceb16d3a0dce6e
	.xword	0xf1cd5739e630108e
	.xword	0x0ce16324d9aba959
	.xword	0xe11667105e2ac7d5
	.xword	0x6fc169647c09cef8
	.align 0x20000
	.data
data_start_5:

	.xword	0x7803586a0ec6713b
	.xword	0xa850a90f4453c67d
	.xword	0xa6669b65491a1f15
	.xword	0x869511a935f706c9
	.xword	0xe96625206f9aa817
	.xword	0x5b34360ba2bae3db
	.xword	0x69ddefee112d56b9
	.xword	0xa887808c768bc34d
	.xword	0x53dd706c066b88e4
	.xword	0x88cb1a39138ac9a9
	.xword	0x445b415ca257e198
	.xword	0xabf6f3cd091a1111
	.xword	0x512ca4b831a5323a
	.xword	0xf97aeb854fa35770
	.xword	0xe3504756531df1fd
	.xword	0xf53e7b1b216ac716
	.xword	0xb9569d81620f9364
	.xword	0x09f77ba53134df74
	.xword	0x9d1ed5d02ec7f3af
	.xword	0x34c5eeffa74d1d5a
	.xword	0xff2a6280a353835d
	.xword	0x03b65c44d2125789
	.xword	0x51195ecf708d89e8
	.xword	0x21ffd167e61b66de
	.xword	0x1d12e646a2a0f063
	.xword	0x997b55172902c9f9
	.xword	0xce3644515c6440b3
	.xword	0x16a970369cb75ee7
	.xword	0x9362e9a7f1c9b0ff
	.xword	0x2aff4d135a15aeaa
	.xword	0x2498e3fff6e6225d
	.xword	0xaf6a7e763578c693
	.xword	0xdf5a17b39dbd232e
	.xword	0xd76821bda3bd6d49
	.xword	0xc02c234a27a0181e
	.xword	0x437cf4b7acbcc9d3
	.xword	0xe473797363c6dd39
	.xword	0x952258c747590b5b
	.xword	0xcce9ab057cbd1d57
	.xword	0x067540078c9aa0e8
	.xword	0x9fcecd3bd013297b
	.xword	0x9885c1a434b26974
	.xword	0x644db9d5d9115e88
	.xword	0x384cfecdff244693
	.xword	0xaa9ff6eab6a3814f
	.xword	0x5e5442357d0a45c4
	.xword	0x1f77327c4a09544e
	.xword	0xd89cd915d7a0268e
	.xword	0xbeebc864d43c7776
	.xword	0xf67a9bd32c6d4727
	.xword	0x99983f481bd3e875
	.xword	0xd4fec5a565936f5f
	.xword	0xd2b6536e7150e7bf
	.xword	0xc2974bb4fade1412
	.xword	0x9771bd1d78741dc5
	.xword	0x35267945f5ce003e
	.xword	0x51aac592acf066d9
	.xword	0x5a45d5e63fadcd36
	.xword	0x2f71e8b03878ae37
	.xword	0x95b61e00f9b2e0b0
	.xword	0x2a2b098516cd04d9
	.xword	0x0a5cb2b1a955822a
	.xword	0xe107dcefd2364066
	.xword	0x651aefba880ab42e
	.xword	0x91f2220333f280de
	.xword	0xe3c0696454836389
	.xword	0x2a0f93ad6eb6a28f
	.xword	0xa8a6953097f20c60
	.xword	0x481aa8c6dac39044
	.xword	0x2b5c1eccbc93f84d
	.xword	0x95689c532936e627
	.xword	0xd8f7c40fa9388431
	.xword	0xcc74006bb414ddc0
	.xword	0xcd3cc2e6f0324a44
	.xword	0xe883d86bfc4632d9
	.xword	0x8122bfd73359748c
	.xword	0x0d0d4712a315fc0b
	.xword	0x87dc478cb4d00946
	.xword	0x8dae93eaef1cf4b6
	.xword	0x876f2cfc34a74652
	.xword	0x9d3e994d01da2184
	.xword	0x5291a3b68cdef561
	.xword	0x7c44f4b2e056b9d6
	.xword	0x26a3507b03bfcae3
	.xword	0x82f1a70f0417ac36
	.xword	0x080a7d0354d6106c
	.xword	0xb78b886a971f4909
	.xword	0x7a6a672a7f6ce06d
	.xword	0xc3ee8b4bd7825b81
	.xword	0xdb36e076e57264fa
	.xword	0xb2017d2a7d1075c7
	.xword	0x4bdfaf7fa1a09eea
	.xword	0xc0b7acf611744989
	.xword	0x281bb8dd7c1cc867
	.xword	0xbb6cb8b69c103a92
	.xword	0x47c62dd311bee505
	.xword	0xd0e0370f2073e1b4
	.xword	0x46586adbd7a57581
	.xword	0x3ff180afdee27545
	.xword	0xe6e36cbb5819a597
	.xword	0x0b471f5fcf4e5892
	.xword	0x6d0972a442d01e02
	.xword	0x686f69fed02df95a
	.xword	0xadbdb39c4b187acb
	.xword	0x5d9b5ecc2c4487cd
	.xword	0x5dfa6983f4d5390a
	.xword	0xe6a7d86f6661ce5d
	.xword	0x82475ce57a4bd45f
	.xword	0xe3a839e46f3bf3b4
	.xword	0x749d4df18fd3f7af
	.xword	0x5cf085b8555af730
	.xword	0xc390ad76bbfde29d
	.xword	0x9c7908f404ac1b6d
	.xword	0xf2edf3562cd024c5
	.xword	0x4e1817871af6ea6a
	.xword	0xcc08c68727d21465
	.xword	0xb06b504beb0850bc
	.xword	0x37f64ec653595c3d
	.xword	0x653fdf5e054fba67
	.xword	0xa2d6f6053500d7d7
	.xword	0xc4b9afe50b01b18c
	.xword	0xf6fa6cf362394b83
	.xword	0x8dae0f3252c9b66c
	.xword	0x99d713a7960e3927
	.xword	0x06111ee59234c7e7
	.xword	0x54fba9333b51a393
	.xword	0xdb2ffce405dfe45f
	.xword	0x91342ddd389817ff
	.xword	0xd75890a0e2a9330a
	.xword	0xacdec3eb34dd8332
	.xword	0x495a72437ad39f33
	.xword	0xa2705f626dca0433
	.xword	0x63937b1d74763418
	.xword	0x56e3ea5268c0de54
	.xword	0x09047dd0fe9c6869
	.xword	0x42805552cd651251
	.xword	0xedd280c7dc4af650
	.xword	0xdac29cce1743ae50
	.xword	0x39568651dabb4581
	.xword	0x3494e391d62ed9bc
	.xword	0x377c8f4e76a9646a
	.xword	0x83f9a01eaefd5c1a
	.xword	0xc8a7aec8d0292e4c
	.xword	0x6f95e2a9d05d4da7
	.xword	0xa0b846c481f0602d
	.xword	0x6930e7029286bcc9
	.xword	0x410cda45a813dd29
	.xword	0xb9d5cc0c84e1e5d3
	.xword	0x112d16718771b6a9
	.xword	0xa604364b8b5f5aab
	.xword	0x055ff6132b74dd91
	.xword	0x9b56268bebf6eb55
	.xword	0xac0049831c2157ec
	.xword	0x54cff774b4ea1195
	.xword	0x7dfe65060962f633
	.xword	0x1ee70228beecb8a9
	.xword	0xb1b684266b1281d1
	.xword	0x543382c7c251dc19
	.xword	0x79592d476f0076cf
	.xword	0xe9af805fda9e9d15
	.xword	0xfc30bcb7e42d58ab
	.xword	0xcdf057abe07189ca
	.xword	0x978e32e3dd2347a1
	.xword	0x53316c9f7ceb1c6c
	.xword	0xff575d6396cdc41b
	.xword	0x7def7c275a53af7d
	.xword	0xed0b2c0814045281
	.xword	0xf0b22766edabac28
	.xword	0xa7515c0c77e5d746
	.xword	0x834bfb480e491454
	.xword	0xe4990e1c67c9b6dc
	.xword	0x7c946ec56cc6d757
	.xword	0x3bbead578551e968
	.xword	0x33edb2b385060b73
	.xword	0xffe01eceb2ab3e20
	.xword	0x195b3037f6c39bd8
	.xword	0x5227cad7b8aceae4
	.xword	0xed114e4410ec4be3
	.xword	0x99537702b48fb254
	.xword	0x5dbbd6455d125f0a
	.xword	0xcd56e7bef491f54c
	.xword	0x5957efa0fedc6bd1
	.xword	0xa5a50cd4eeca945e
	.xword	0xa4dc3156f3551ef4
	.xword	0xfe93928dd094428d
	.xword	0xfa847fec7c3a2cc1
	.xword	0x7d937584efcace49
	.xword	0x9188a091642a9548
	.xword	0x9041640fd516b0c5
	.xword	0x7f293304cdf367a5
	.xword	0x543bdb4e4ae3c5f3
	.xword	0x90a9f669bb76392b
	.xword	0x3cccbafa7e56499f
	.xword	0x45e8d5180234465e
	.xword	0xc5c96648572c7416
	.xword	0xb3a6c512202979f6
	.xword	0x400c6c1c5e635d29
	.xword	0xaaf6cc2a5e02f96c
	.xword	0x6b17b19e4768841f
	.xword	0xeb2826c04c7dcf8c
	.xword	0x37a36a96bf5eccef
	.xword	0x3ea5054256ce2828
	.xword	0x0914918d484c350b
	.xword	0x688992805d8fbe96
	.xword	0xb80f47dbbcc18d2d
	.xword	0x9061d8f5c0b86fcb
	.xword	0x8111eea3f7562d22
	.xword	0x11db3bb160fb8770
	.xword	0xe34c94012d686c4a
	.xword	0x12011b5c3af865ab
	.xword	0x171bd1adfd651e2e
	.xword	0x6f54db80e112b8d2
	.xword	0x51ea7967b687548b
	.xword	0x196e06fdf4e40444
	.xword	0x371a1d91da202bb7
	.xword	0xa4dafc7e0b29bca8
	.xword	0x77eb0033ea41eeec
	.xword	0x3f8894ed615b958c
	.xword	0x83aa1c8fec3db6b7
	.xword	0xcec06a63a24bf86d
	.xword	0x7f73cbdf691c3921
	.xword	0x04fa69d89ea3b333
	.xword	0x1f4dda6842220512
	.xword	0xd6348e255df82f43
	.xword	0x7fbb62f0fa3617e0
	.xword	0xe14eb26e147dce26
	.xword	0xb52f7f0af7b4d4f5
	.xword	0x2e4862ac7f6d578e
	.xword	0x3682a16aba4c2c24
	.xword	0xa9245bdef4c54073
	.xword	0x5665b6eb0adc280b
	.xword	0x96688d1e8256a2fa
	.xword	0xca13e3579bc2d333
	.xword	0x66da5e476558e301
	.xword	0x3c3651a5b53f3b5c
	.xword	0x865943c0edde9c31
	.xword	0xf07547e1f94557ee
	.xword	0xf868147fe0106b4b
	.xword	0x05e40a6a22f669ea
	.xword	0x87409ab328660e9b
	.xword	0x34566f6f62f4e032
	.xword	0xba00ac02ce495935
	.xword	0xc2bfe547b4727674
	.xword	0xe781e71fa99e7f6c
	.xword	0xc5d93d9df10e48d6
	.xword	0x6e6c37c9d03d4ab6
	.xword	0xe187cfbf00388e8d
	.xword	0x3fd3a88df45af83d
	.xword	0xee18a2d63441defc
	.xword	0x813055309f7a88d0
	.xword	0x963fee4c70087b05
	.xword	0xfa7b7b935a9c01eb
	.xword	0xa869138773588a4c
	.xword	0xb9cd9a9cb9cbb0e8
	.xword	0xe6f3f77445679ad3
	.xword	0x50cc57378df80ca4
	.align 0x40000
	.data
data_start_6:

	.xword	0x7a9afbf3a1d0c173
	.xword	0xbababcef724601c9
	.xword	0xda392776fad5b985
	.xword	0x971d4e5d3c99424b
	.xword	0xf11fb36f29cf4b2c
	.xword	0x8a8aa6b73c74cff1
	.xword	0xe37e1a32b6ca0ad3
	.xword	0x851915e75ffd6631
	.xword	0xc1b7cd7c4c261780
	.xword	0x1e9b7b8541325643
	.xword	0x39d13b2e494df50b
	.xword	0x15d6e487577f8ff3
	.xword	0x89bd516fd5016a1a
	.xword	0x741d3d97d12ca151
	.xword	0xc3933ce52b0560a7
	.xword	0xe28c219e0276359a
	.xword	0x07a62158ef1fef1e
	.xword	0xd879d3af7ca21052
	.xword	0xa6400118ecbbbbd4
	.xword	0x227bba3e47045217
	.xword	0xcfd66672fa291932
	.xword	0xe530c040b48b7f22
	.xword	0xc054c652afae06ad
	.xword	0x317a1df2557b8e3f
	.xword	0x2fe062293c29790b
	.xword	0xf4bea44e7dec761b
	.xword	0xf05c8936b4568023
	.xword	0x8ed0bfc07539061c
	.xword	0x41bdc6301ed1b29f
	.xword	0xaef601a1777cf10e
	.xword	0x97240ae816b02848
	.xword	0xc00e2e16051cba6f
	.xword	0x01d6ef3abc1fb285
	.xword	0x08379a07507b32e9
	.xword	0x64f9525ed5673a74
	.xword	0x6c7fe4f6ff3aabf7
	.xword	0xca31c473da7dcefe
	.xword	0x8b8639ebc98107be
	.xword	0x3e182d3658632589
	.xword	0xc71e3b7171196953
	.xword	0xea70d6fcb6366121
	.xword	0x3b3d762a1aa90e24
	.xword	0xe7bcb9270bd3169c
	.xword	0x94c725f02ab9a5a2
	.xword	0xa6e8d00fc8a10c5b
	.xword	0x28b54f60338e0283
	.xword	0x63c6f95942865a52
	.xword	0xd24806293198a8d4
	.xword	0x04999a0930eaa35a
	.xword	0x6fe8d0b21982f106
	.xword	0xf1374b0a108e943b
	.xword	0x7d953826e95a6e9d
	.xword	0xb8f11a35fbaa2a52
	.xword	0x116adee63151bd98
	.xword	0xe0df77f72ba3a3f1
	.xword	0xdaa49b29cf81816f
	.xword	0x627ae943713b4109
	.xword	0x81639ea4111c2fc0
	.xword	0x636a2dab5b31cb54
	.xword	0xbfa14f5968160489
	.xword	0x423b92aba06ae5e7
	.xword	0x88550cb989cf98df
	.xword	0xeed34652d4600563
	.xword	0x243bd708b9b3def6
	.xword	0xccfd5ad952979716
	.xword	0x70f94a7689fad8f3
	.xword	0xea92503622d844b6
	.xword	0xa2901b34208c3761
	.xword	0x20ec7b49b3b150ea
	.xword	0xc3d9ac29f245fe5f
	.xword	0xea22e560523439df
	.xword	0xadf50d1f43ecaec8
	.xword	0x80bc7ea6c57ab6d1
	.xword	0x097bb9b0058caafa
	.xword	0xe5c9573abc7071bd
	.xword	0x3aa644134dd6c385
	.xword	0x89ff3ad22b32d767
	.xword	0x6bbb1efd3636af5f
	.xword	0xf9077561a3f46044
	.xword	0x9acf8e4aa37f9e1a
	.xword	0x15b7b375b58a1c29
	.xword	0x2c49d0c602df8fb0
	.xword	0x30965ae6db2b7c77
	.xword	0x4c1ef8e310b13314
	.xword	0xe8feec72afa4871f
	.xword	0x4adaa0a5b7baeb8a
	.xword	0x269db50c66e61c51
	.xword	0xd279abd53736ddfc
	.xword	0x09a8477ae0846013
	.xword	0x4e302da21c3959dc
	.xword	0xfeb68644b9bbdcd5
	.xword	0x0058baa4b971f98f
	.xword	0x8425913d0318ccbf
	.xword	0xb7df5558afaad983
	.xword	0xef31b58e44ade8cb
	.xword	0x86246668b4713872
	.xword	0x149859843cf53c5a
	.xword	0x59266347488bcd6d
	.xword	0xeb8da8367a323089
	.xword	0x9d4863e7442ae0ee
	.xword	0x03068dd6bfdae32c
	.xword	0x39c3068887fb30f1
	.xword	0x01fe1b534eeb9003
	.xword	0xba526d1791b2d35d
	.xword	0xcfd8750b0f3f8825
	.xword	0xb622157c248d8cf9
	.xword	0x7b96114e677d5624
	.xword	0xd41b4893b1420ae3
	.xword	0xea3205a2998842cc
	.xword	0x34154bda9753bc14
	.xword	0x0b3d095a919e23ad
	.xword	0xc913d8b8e428b0a5
	.xword	0xe59ee034460d541f
	.xword	0x508d7a0c687f3445
	.xword	0xcf9bada4badf1c61
	.xword	0xc41ec8b6dcc60d37
	.xword	0xe4b328b88148043a
	.xword	0x19870956434728cd
	.xword	0xc1a8402bad690001
	.xword	0x182f2fb646fd21d0
	.xword	0xef9087ed70e778f3
	.xword	0x49e8b5e72dd78dbf
	.xword	0x4606a504450e6ad0
	.xword	0x818461a0523865b1
	.xword	0x651fdc0536c5c7c3
	.xword	0xddafe86271d6b100
	.xword	0xc21ac262a6abea61
	.xword	0x573f435f88aa007b
	.xword	0x7540d54a2e0da4d0
	.xword	0xacd6f65c7874003a
	.xword	0x801195cda6b06be6
	.xword	0x48b2e042fc7e8e21
	.xword	0xd668877eb36e78ba
	.xword	0x7c94370964d3e68a
	.xword	0xb1aec8cb3f0bf5b3
	.xword	0xf58168ef2a27ffaf
	.xword	0x0ec04b5e4f24329c
	.xword	0x1ce4451bac77520d
	.xword	0x191c81b07ed07426
	.xword	0xe65010b7c113a24e
	.xword	0x300887caa1449ede
	.xword	0xb1a143fe27957aa8
	.xword	0x84fdad0f1371c868
	.xword	0x34b87f90d2c72431
	.xword	0x2e56a08b10564121
	.xword	0xcea023c121c7d517
	.xword	0x5cb90561126dcca5
	.xword	0x4258fc2a5e31b08c
	.xword	0xd405ab2a78fccf8a
	.xword	0x0ba6c09fa01311d6
	.xword	0xc9430165df46c227
	.xword	0x06b743bc78602e63
	.xword	0x174784fd3c59ac20
	.xword	0xb67653bcbe1494f5
	.xword	0x55986c03d7bb3843
	.xword	0xb00729c45b7a7c43
	.xword	0xab295b5aae976f54
	.xword	0x1b54e6b080d27425
	.xword	0xb5af751bc7a1606f
	.xword	0x225dc826a3a72eca
	.xword	0x1515fc44732e04fb
	.xword	0xc985c2c2e1fc8d27
	.xword	0x22625e2e03124041
	.xword	0x2f6494b8e5143cd6
	.xword	0xb790845d67f32cb8
	.xword	0xfd3fa1485353bf05
	.xword	0x06d97b66ce503ce7
	.xword	0x85c5c48b347cb41e
	.xword	0xd980df7be485d331
	.xword	0xb85f1e57f08fb605
	.xword	0x5fbf00f3fa7fcde9
	.xword	0x07343f5978cec722
	.xword	0x2191faabc40984eb
	.xword	0x8944507ba185d391
	.xword	0xcb643b7cd8b9746e
	.xword	0x71d8af1610b85440
	.xword	0x70db2024637a49e6
	.xword	0xbcf290beb23296f8
	.xword	0x399c98db08b4e61b
	.xword	0x47ca8a7593d042b3
	.xword	0x1b39db6ef2bb4b64
	.xword	0xb16b0c1605a17a42
	.xword	0xd5d1612e53d795f6
	.xword	0x88010ca3d0916952
	.xword	0x18b3ff4ac597316d
	.xword	0x6ebef0687425fd5e
	.xword	0x6b892242dcdd9ce8
	.xword	0xa6c535841a8c2eb1
	.xword	0xa4dbbf311c543135
	.xword	0x1f60930e0b238a62
	.xword	0x03ebbece73a8f92b
	.xword	0x337dac957560c405
	.xword	0xec61386ada856d0d
	.xword	0xe7b5f209b78617a3
	.xword	0xc223e3472b862234
	.xword	0xfd7eb9a9f630bda3
	.xword	0x9b88eaf9fd4f1184
	.xword	0x0e773231de2273a6
	.xword	0x598baf5d366d9b13
	.xword	0x42c22cd7daebaf77
	.xword	0x51b0727b9e0474ee
	.xword	0xe510714029b60a20
	.xword	0x90323ff006d059bb
	.xword	0xb9d347b34d658e61
	.xword	0x70533b441786b513
	.xword	0x294f1da62518ff28
	.xword	0x673762c1ff9e5dc7
	.xword	0x3b55f6816eb1cf9d
	.xword	0x6865d5cf6281bd3f
	.xword	0xaff3e13f39ab5d97
	.xword	0x3ca1d4d4d7b3e229
	.xword	0x0ad26c50de110793
	.xword	0xc84ae4223528d5b7
	.xword	0x2edccbaffca0dd7d
	.xword	0xc6bf599df459cb36
	.xword	0x5cf7010050996d40
	.xword	0x5a79cb1f232e852a
	.xword	0xf8846ba758790d08
	.xword	0x35564d00410ea861
	.xword	0xb0e1926d8c7d048a
	.xword	0x6ef9954cbd98f11c
	.xword	0xdbb349f81083debe
	.xword	0x9c7de73b402caa42
	.xword	0x17ff58f962cb49e6
	.xword	0x83ab377844974ce2
	.xword	0x19feb0db4eeb5736
	.xword	0x5862fd45b77a381d
	.xword	0x0fedebea26d9facf
	.xword	0xae18abe8ede6d617
	.xword	0x3430379ce35ca3a8
	.xword	0xbfe702fb112d161a
	.xword	0xca1b7ecbcebdb258
	.xword	0x9db7a35ba3848e8f
	.xword	0xc9bd1106ef491d11
	.xword	0xe0d3b66efc35c2da
	.xword	0x7247e6592ad5544b
	.xword	0x807b3cc0b5d1f75d
	.xword	0xc9cd245f2ab8e0a4
	.xword	0xf640876b136212a6
	.xword	0x4105010e52679dd9
	.xword	0xa567edcd2c364760
	.xword	0x194fec925ea7d9f0
	.xword	0xf33c72349c15d1a8
	.xword	0x741219a9f14e6b36
	.xword	0xef48b56979740ab4
	.xword	0x41d5e7b9f29dc0a6
	.xword	0xe47e295373fb4a0a
	.xword	0x2b14bca32753482f
	.xword	0xb8d5b6c88ec39c6d
	.xword	0x061d018c4302d13d
	.xword	0x53fa3e01cdae4908
	.xword	0x8c574bb777617f14
	.xword	0x6563e6ee5cff3f16
	.xword	0xa6bb79ffdd138d76
	.xword	0xa43011c37c7985a8
	.xword	0xf677fe3db731ec90
	.align 0x80000
	.data
data_start_7:

	.xword	0xf7fc26b245608fa7
	.xword	0x3d5399810ea3bd5c
	.xword	0xfc6e27615b457d83
	.xword	0xd6d7134a9d20500b
	.xword	0x9e7f4c53babdb252
	.xword	0x21ab376ddaaa61d1
	.xword	0xd9137cbcce62bbd8
	.xword	0x8d9e79f4c34f5f09
	.xword	0x2500ead0a4939a15
	.xword	0xa80f7cda75c4cfb2
	.xword	0x15c0f10a0a271eda
	.xword	0x83804421bc551b22
	.xword	0x56a5c8837279852c
	.xword	0x153eb422c6a9cd51
	.xword	0xdd1e926d64dc88a9
	.xword	0x9148ff25b1b3f8c8
	.xword	0x7d406f74db1e95cb
	.xword	0x9df54ebeda58205f
	.xword	0x3d70eb147eb3a4e5
	.xword	0xe4684e3079cd210c
	.xword	0x497a1b8327a39b00
	.xword	0xf0cfef47c8e654b7
	.xword	0xb73d98955f0f68a5
	.xword	0x7777f92675b842f2
	.xword	0x5c6d3a9f223da79e
	.xword	0x75aae20c04c36ecd
	.xword	0x77ad054862b1b0b4
	.xword	0xc8b27d0c5c7ddafb
	.xword	0x13679aeccea9eda9
	.xword	0x068ee420cb51a225
	.xword	0x7cfe78da06113b19
	.xword	0x00336c06c57a860f
	.xword	0x3be10afa6e510378
	.xword	0xb942c155f9a897d5
	.xword	0xd8e08d95158aa7ef
	.xword	0x87135cb8fa699aba
	.xword	0x135f23725cff2c02
	.xword	0x66f3a70271aa4d3e
	.xword	0x4ee7b66e51287ea6
	.xword	0xc93abaa6577a1c78
	.xword	0x30c8390dcc737601
	.xword	0xfff4d21204a8f719
	.xword	0x4f85443e946c4be6
	.xword	0x50fa73108a96727d
	.xword	0xe0c818eeeebc76ed
	.xword	0xb332565fd66b1370
	.xword	0xc6dec7d3b169c8d1
	.xword	0xb2df3287be45b8ea
	.xword	0xb456aad4dce53968
	.xword	0x293f32d401e972a1
	.xword	0x4f86f713934e83ea
	.xword	0xe25c6c34fe8bf531
	.xword	0x2bf0401a8c2f9a42
	.xword	0x107f177e81feab3a
	.xword	0x0df31c8ff3917110
	.xword	0xb447ee30eb5e1541
	.xword	0x8d4328782fb3d5b5
	.xword	0xd2ea18e47e0fe88c
	.xword	0xd420272c7ebcabe8
	.xword	0x6dca112c524f747f
	.xword	0xa471c81df3f84e2f
	.xword	0x4dbc2ed0136e9aef
	.xword	0x725d08bac12517c8
	.xword	0xd03c6106773c88e1
	.xword	0x32d7f24f1b47b084
	.xword	0x6dedc0dc2d0aad68
	.xword	0xc22790a17b40772b
	.xword	0xbbabaedfca56f80d
	.xword	0x6d1682de3fc8d5cb
	.xword	0x832438a2531129bf
	.xword	0x33accb5c1eebe7d5
	.xword	0xe79481db284e8f46
	.xword	0x099fb561e190fb9b
	.xword	0xa06e06d54db6640c
	.xword	0x646d65973533cd1f
	.xword	0x19c6fbaa8b24325a
	.xword	0x2fbe97955b05f3f9
	.xword	0xdc805e8840d8e6c9
	.xword	0xe5f70794f487dcd7
	.xword	0xc6b467672a221615
	.xword	0x8781918cbf3fb0fe
	.xword	0x5b601b3f54703fe9
	.xword	0x215191b265d2f5cd
	.xword	0x48b7fcbd84e153b4
	.xword	0x88581931dcc7d379
	.xword	0x6355ea1a568b527c
	.xword	0x94b4a327ceaf8bdd
	.xword	0xb5e1b18b73cdaf34
	.xword	0xea63c2c79c892d7f
	.xword	0x0522e3d71a9cabb7
	.xword	0x8a61e9fdbe09c58e
	.xword	0xa98bab838d789e6f
	.xword	0x8b33d10e72b78542
	.xword	0x55c3ec4283205f0b
	.xword	0xa53266d0f9a3d72b
	.xword	0x3af02b6c5b456454
	.xword	0x6ee9ad797f1d4def
	.xword	0x9a1f73b0911aba0e
	.xword	0xeb70d3fa32204821
	.xword	0x85250c67fbe7d22b
	.xword	0x5d56404e536b1cea
	.xword	0xe293a8195707ef9c
	.xword	0x313155414e637c92
	.xword	0xdd32fe7bbd11825d
	.xword	0x49c544e0ce8a71fd
	.xword	0x04eeb1bf026096c8
	.xword	0x8ec41ee35f71754d
	.xword	0x5ea4de201fe73abd
	.xword	0xf9d872c9c58fe19b
	.xword	0xfe54e6ac1396db95
	.xword	0xf35d2765959652da
	.xword	0xb518418b8f94c2cb
	.xword	0x94f06bae9cd48517
	.xword	0xda439a43112a5f50
	.xword	0x674147b32b2408ee
	.xword	0x062c48110a34afc2
	.xword	0xe78872397b67fc9c
	.xword	0x152a3254decc3658
	.xword	0x6dd3a4cabc3a1c33
	.xword	0xe4e80b4972554321
	.xword	0x79ef6a2fbaff36d2
	.xword	0x727cc4c8cc5c23e0
	.xword	0x93cc9807dda99d69
	.xword	0xe086b8b0fadde1ed
	.xword	0x727652bf391c73c5
	.xword	0x7180808fd4212533
	.xword	0xfff05a55ccf9c621
	.xword	0x42af4cfb23796225
	.xword	0x735b8e2e6252ec0f
	.xword	0x8046736a55f93e40
	.xword	0xbb49a7f4d83b3697
	.xword	0xde4f1b5565558e9a
	.xword	0xa15efa502cebf6b5
	.xword	0x5fb56f62a1cfe2f7
	.xword	0xae615e5c0d34442f
	.xword	0x67312728564a6688
	.xword	0x3b94aaa42e9dc559
	.xword	0xc0f009b385fa21f6
	.xword	0x2e2d7a4f5a58f9c5
	.xword	0x0b76c701dc804c23
	.xword	0x51309c459c090f7f
	.xword	0x85e7e08b896dc083
	.xword	0x3b39f72f5cbc4c6b
	.xword	0x3150cbeca3e41b0f
	.xword	0x9aae20f1bca82663
	.xword	0xe68ac90bffb2d083
	.xword	0xcee151280569a1ef
	.xword	0xd2f97fdb97cbeb20
	.xword	0xefeb3d43277a48c6
	.xword	0x24af90c60ff75279
	.xword	0x73827c296c70cf34
	.xword	0xcd56f2d420823b09
	.xword	0xb8890af90507a251
	.xword	0xb877f84d2758f1cf
	.xword	0x03c02023b9cfc65f
	.xword	0xd44ddc102f752703
	.xword	0xe3aa5605cd64ac7f
	.xword	0x3dc355d338cd6f96
	.xword	0xc8d03b261747100b
	.xword	0x7c3edcb57cbe0f1f
	.xword	0x6375940841e27478
	.xword	0xa07fadf9e63dea08
	.xword	0xef7031d55b00542b
	.xword	0x006932c2d20b1357
	.xword	0x4facc6bfa60bb9cc
	.xword	0xb17999964c6ff39c
	.xword	0x616ce0f4a37f3639
	.xword	0xb52eb8c92130194b
	.xword	0x9d4824c6160f5fef
	.xword	0xa472315ec79f55db
	.xword	0xcf59641f0189cffe
	.xword	0x02a0b0c42edce4da
	.xword	0x51cba5f697486574
	.xword	0x9a63e233278bf02c
	.xword	0xda1b5666d6e7ff52
	.xword	0x9e3eb92af48a711b
	.xword	0x18d03dc7021d7d1a
	.xword	0xd612098e01a494be
	.xword	0x7cf1144994e8f839
	.xword	0xde8a9685df684246
	.xword	0x3f74bacabae0b836
	.xword	0x2321b286d5029403
	.xword	0x7b68c48f12d09e26
	.xword	0x6447710e56fdf3e7
	.xword	0x158a9c88850d3d87
	.xword	0xa93e0c2402cc919a
	.xword	0x1a90362d3022b42e
	.xword	0xc72291024b60381b
	.xword	0xa918b6d57e1cbd23
	.xword	0xb5e165005d66eab4
	.xword	0xd6a2ed63b1a61f03
	.xword	0x1e82692d3c44d03d
	.xword	0xc019d02a47b17d4c
	.xword	0x7a5b0390ee08daa4
	.xword	0xfef937d5d97a7361
	.xword	0xd6a181f8d44ee667
	.xword	0x0fed39083f9bca34
	.xword	0x8d68309258905602
	.xword	0xa57920689ad86149
	.xword	0xf552f774b7e592ee
	.xword	0x63d0ffdf9fb34696
	.xword	0x01ab6db5a2c80469
	.xword	0xdd370ae4a1cfcacb
	.xword	0x5d0d173af9625982
	.xword	0x8676325e54be5468
	.xword	0x662e6196dc10dc9f
	.xword	0x0c13deed4d68d8cf
	.xword	0x38dc8c2361ff0664
	.xword	0xf364ca7d303e9563
	.xword	0x127d896a790b72f8
	.xword	0x8668d1519bc208ab
	.xword	0xd487e96c7d6b66d1
	.xword	0x6c5d4cc3246635c4
	.xword	0x16bca217b0206314
	.xword	0x8b39205ebe89e0b3
	.xword	0x941f1398befba4e0
	.xword	0x1feccd8f7cc02c19
	.xword	0x16955300da4ec8f1
	.xword	0x4fb03bf438140e36
	.xword	0x5f4e4a55e4c8e441
	.xword	0x936828cf0a4aeb3b
	.xword	0xba66a1e5e9929cb5
	.xword	0xddf88e12f3443bd5
	.xword	0xee1b52a0d900660f
	.xword	0x936fb6043cf444c4
	.xword	0x6a9aef1bffbdc3db
	.xword	0x1a07c9891ab64180
	.xword	0x41e24ec246fa90e5
	.xword	0x7b866a055553bd98
	.xword	0x1316c5b0bdec05f8
	.xword	0xa0ce4448181b140d
	.xword	0xa86fa60a138681c4
	.xword	0xbeedace54002e13f
	.xword	0x7089d51f266a7ff2
	.xword	0xa85532bd50444d65
	.xword	0x14844ae817f07073
	.xword	0xa6ecea8b6d227c02
	.xword	0xc7ceaf8fd4418509
	.xword	0x0116933f08fb0326
	.xword	0x67f8efaa1028d252
	.xword	0x6722ce27f94d843f
	.xword	0x348919811a0f8688
	.xword	0x529309208a397716
	.xword	0xaad4be770f21175e
	.xword	0xe9624ff10b4254d1
	.xword	0x37c763f79770a153
	.xword	0x3a296ba5617ed3f2
	.xword	0xcb1e4eba8fdc85fa
	.xword	0x33e37a6ba4d2b2dd
	.xword	0x9ab7c86325d191cb
	.xword	0xec205713b1d1f0ab
	.xword	0x209b1ba47566bd98
	.xword	0xb4f3ef5d3e857dce
	.xword	0xf21b4f430559398f
	.xword	0x1a7cebdfff49a212
	.xword	0x019ad3b33b8b86d3



	.text
	ta	T_GOOD_TRAP

#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# 
!!#   int i, j;
!!#   int loop_cnt = 0;
!!# 
!!# 
!!# 
!!# my_imm_asi_to_rvar (int line, int rv_ro, field_type_t fld, void *data);
!!# 
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#   IJ_bind_thread_group("diag.j", 34, th_all,  0xf);
!!#   IJ_bind_thread_group("diag.j", 35, th_0,    0x1);
!!#   IJ_bind_thread_group("diag.j", 36, th_1,    0x2);
!!#   IJ_bind_thread_group("diag.j", 37, th_2,    0x4);
!!#   IJ_bind_thread_group("diag.j", 38, th_3,    0x8);
!!#   IJ_bind_thread_group("diag.j", 39, th_2_3,  0xc);
!!# 
!!#   IJ_set_default_rule_wt_rvar ( "diag.j", 41,"{16}" );
!!#   IJ_set_rvar ("diag.j", 42, Rv_low_wt, "{1}");
!!#   IJ_set_rvar ("diag.j", 43, Rv_mid_wt, "{8}");
!!# 
!!#   IJ_set_rvar ("diag.j", 45, Rv_thrdint_param, 
!!#                "46'{0},"     // RSVD0 
!!# 	       "2'brr,"      // Type
!!#                "3'b000,"     // RSVD1 
!!#                "5'brrrrr,"   // THREAD 
!!#                "2'b00,"      // RSVD2
!!#                "6'brr rrrr"  // VECTOR 
!!#               );
!!#   IJ_set_rvar ("diag.j", 53, Rv_ma_cntl, "12'b0001 r100 0000");
!!# 
!!#   // Random data pattern
!!#   IJ_set_rvar ("diag.j", 56, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!# 
!!#   // IO HW interrupt vector
!!#   IJ_set_rvar ("diag.j", 59, Rv_intr_vect, "6'brr rrrr");
!!# 
!!#   // ldst memory address
!!#   IJ_set_rvar ("diag.j", 62, Rv_data_sec, "{0..7}");
!!#   IJ_set_rvar ("diag.j", 63, Rv_ldst_var, "{16..23}");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 65, ijdefault, Ft_Rs1, "{16..23}");
!!#   IJ_set_ropr_fld ("diag.j", 66, ijdefault, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 67, ijdefault, Ft_Simm13, "13'b0 000r rrrr rrrr");
!!#   IJ_set_ropr_fld ("diag.j", 68, ijdefault, Ft_Rd, "{24..31}");
!!# 
!!#   // HPSTATE/HTSTATE write data
!!#   IJ_set_rvar ("diag.j", 71, Rv_hpstate, "48'hrrrr rrrr rrrr," "16'brrrr 1rrr rr0r rrrr");
!!#   IJ_set_ropr_fld ("diag.j", 72, Rop_hpstate_rs1, Ft_Rs1, "{10}");
!!#   IJ_set_rvar ("diag.j", 73, Rv_tl_lvl, "{0..2}");
!!#   IJ_set_ropr_fld ("diag.j", 74, Rop_tl_rs1, Ft_Rs1, "{12}");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 76, th_all, 8, 0, Rv_rand64);
!!# 
!!#   // Floating point register initializaation
!!#   IJ_printf ("diag.j", 79, th_all, "\tta\t%%icc, T_CHANGE_HPRIV\n");
!!#   IJ_printf ("diag.j", 80, th_all, "\twr\t%%g0, 4, %%fprs\n");
!!#   IJ_printf ("diag.j", 81, th_all, "\tsetx\tdata_start_0, %%r1, %%g7\n");
!!#   for (i = 0; i < 32; i++) {
!!# 	IJ_printf  ("diag.j", 83, th_all,"\tldd\t[%%g7+%d], %%f%d\n", (i*8), (i*2));
!!#   }
!!#   IJ_printf ("diag.j", 85, th_all, "\tsetx\tfsr_data, %%r1, %%g7\n");
!!#   IJ_printf ("diag.j", 86, th_all, "\tstx\t%%fsr, [%%g7]\n");
!!#   IJ_printf ("diag.j", 87, th_all, "\tldx\t[%%g7], %%g4\n");
!!#   IJ_printf ("diag.j", 88, th_all, "\tsetx\t%%hi(0x0f000000), %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 89, th_all, "\tor\t%%g4, %%g3, %%g4\n");
!!#   IJ_printf ("diag.j", 90, th_all, "\tstx\t%%g4, [%%g7]\n");
!!#   IJ_printf ("diag.j", 91, th_all, "\tldx\t[%%g7], %%fsr\n");
!!# 
!!#   IJ_th_fork("diag.j", 94,0x2, 0x4, 0x8, -1);;
!!# 
!!#      // Initialize Rs1 (va) for threads 2, 3
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 98, th_2_3, "\tsetx\tdata_start_%d, %%g1, %%r%d\n", i, (16+i));
!!#   }
!!# 
!!#   return 0;
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#   IJ_th_join("diag.j", 105,0xf);
!!#   IJ_th_start ("diag.j", 106,Seq_Start, NULL, 1);
!!# 
!!#   IJ_printf ("diag.j", 108, th_all, "\t.data\nfsr_data:\n\n");
!!#   IJ_printf  ("diag.j", 109, th_all,"\t.xword\t0x0000000000000000\n");
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 111, th_all, "\t.align 0x%x\n", (1<<(i+12)));
!!#     IJ_printf ("diag.j", 112, th_all, "\t.data\ndata_start_%d:\n\n", i);
!!#     for (j = 0; j < 256; j++) {
!!# 	IJ_printf  ("diag.j", 114, th_all,"\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!# }
!!# 
!!# %%
!!# %%section map
!!# 
!!# %%
!!# %%section grammar
!!# 
!!# 
!!# inst_block: inst_type
!!# 	    | inst_block inst_type
!!# ;
!!# 
!!# inst_type: 
!!# 	comm_inst
!!# 	{
!!# 	  IJ_generate ("diag.j", 152, th_all, $1);
!!# 	}
!!# 	| spill_trap 
!!# 	{
!!# 		IJ_generate ("diag.j", 156, th_0, $1);
!!# 	}
!!# 	| fp_all 
!!# 	{
!!# 		IJ_generate ("diag.j", 160, th_1, $1);
!!# 	}
!!# 	| load 
!!# 	{
!!# 		IJ_generate ("diag.j", 164, th_2, $1);
!!# 	}
!!# 	| store
!!# 	{
!!# 		IJ_generate ("diag.j", 168, th_3, $1);
!!# 	}
!!# 	| set_va %rvar  Rv_low_wt
!!# 	{
!!# 		IJ_generate ("diag.j", 172, th_2_3, $1);
!!# 	}
!!# 	| write_hpstate %rvar  Rv_low_wt
!!# 	{
!!# 	  IJ_generate ("diag.j", 176, th_all, $1);
!!# 	}
!!# ;
!!# 
!!# comm_inst:
!!# 	hw_intr
!!# 	| write_priv_asr
!!# 	| read_priv_asr
!!# 	| alu
!!# 	| spu_rsrv_illgl %rvar  Rv_low_wt
!!# 	| cntx_demap %rvar  Rv_low_wt
!!# ;
!!# 
!!# set_va: mSET_VA
!!# 	{
!!# 	  IJ_printf ("diag.j", 191, th_all, "\tsetx\tdata_start_%rd, %%g1, %%r%rd\n", Rv_data_sec, Rv_ldst_var);
!!#         } ;
!!# 
!!# write_hpstate:
!!# 	tWRHPR_HPSTATE_R %ropr  Rop_hpstate_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 197, th_all, "\tsetx\t0x%llrx, %%g1, %%r10\n", Rv_hpstate);
!!#         }
!!# 	| tWRHPR_HTSTATE_R %ropr  Rop_hpstate_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 201, th_all, "\tsetx\t0x%llrx, %%g1, %%r10\n", Rv_hpstate);
!!#         }
!!# ;
!!# 
!!# write_priv_asr:
!!# 	tWRPR_PSTATE_I
!!# 	| tWRPR_TPC_I 
!!# 	| tWRPR_TNPC_I 
!!# 	| tWRPR_TSTATE_I 
!!# 	| tWRPR_TT_I
!!# 	| tWRPR_TICK_I
!!# 	| tWRPR_TL_R %ropr  Rop_tl_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 214, th_all, "\tmov\t%rd, %%r12\n", Rv_tl_lvl);
!!#         }
!!# 	| tWRPR_GL_R %ropr  Rop_tl_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 218, th_all, "\tmov\t%rd, %%r12\n", Rv_tl_lvl);
!!#         }
!!# 	| tWRPR_PIL_I
!!# ;
!!# 
!!# read_priv_asr: 
!!# 	tRDPR_PSTATE
!!# 	| tRDHPR_HPSTATE
!!# 	| tRDPR_TPC 
!!# 	| tRDPR_TNPC 
!!# 	| tRDPR_TSTATE 
!!# 	| tRDPR_TT
!!# 	| tRDPR_TICK
!!# 	| tRDPR_TL
!!# 	| tRDPR_GL
!!# 	| tRDPR_PIL
!!# ;
!!# 
!!# load:	
!!# 	tLDSB_R | tLDSH_R | tLDSW_R | tLDUB_R | tLDUH_R | tLDUW_R | tLDX_R | tLDD_R 
!!# 	| tLDSB_I | tLDSH_I | tLDSW_I | tLDUB_I | tLDUH_I | tLDUW_I | tLDX_I | tLDD_I
!!# 	| tLDDF_I | tLDDF_R
!!# ;
!!# 
!!# store:
!!# 	tSTB_R | tSTH_R | tSTW_R | tSTX_R | tSTD_R | tSTB_I | tSTH_I 
!!# 	| tSTW_I | tSTX_I | tSTD_I 
!!# 	| tSTDF_I | tSTDF_R
!!# ;
!!# 
!!# fp_all:	fp_arith | fmov
!!# ;
!!# 
!!# fp_arith:
!!# 	tFADDs | tFADDd | tFADDq | tFSUBs | tFSUBd | tFSUBq | tFMULs | tFMULd | 
!!# 	tFMULq | tFDIVs | tFDIVd | tFDIVq | tFSQRTs | tFSQRTd | tFSQRTq
!!# ;
!!# 
!!# fmov:	tFMOVs | tFMOVd | tFMOVRLEZ | tFMOVRLZ | tFMOVRNZ | tFMOVRGZ | 
!!# 	tFMOVRGEZ | tFMOVA  | tFMOVN   | tFMOVNE  | tFMOVE   | tFMOVG  | 
!!# 	tFMOVLE | tFMOVGE | tFMOVL   | tFMOVGU  | tFMOVLEU | tFMOVCC | 
!!# 	tFMOVCS | tFMOVPOS | tFMOVNEG | tFMOVVC | tFMOVVS  | tFMOVRZ
!!# ;
!!# 
!!# spill_trap:
!!# 	tSAVE_I
!!# ;
!!# 
!!# cntx_demap: itlb_demap | dtlb_demap
!!# ;
!!# 
!!# itlb_demap: mIDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 272, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 273, th_all, "\tmov\t0, %%g1\n");
!!#           IJ_printf ("diag.j", 274, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 275, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 276, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 	};
!!# 
!!# dtlb_demap: mDDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 281, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 282, th_all, "\tmov\t8, %%g1\n");
!!#           IJ_printf ("diag.j", 283, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 284, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 285, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#           IJ_printf ("diag.j", 286, th_all, "\tflush\n");
!!# 	};
!!# 
!!# alu:	tADD_R | tADD_I | tADDcc_R | tADDcc_I | tADDC_R | tADDC_I | tADDCcc_R | tADDCcc_I 
!!# 	| tSUB_R | tSUB_I | tSUBcc_R | tSUBcc_I | tSUBC_R | tSUBC_I | tSUBCcc_R | tSUBCcc_I 
!!# 	| tAND_R | tAND_I | tANDcc_R | tANDcc_I | tANDN_R | tANDN_I | tANDNcc_R 
!!# 	| tANDNcc_I | tOR_R | tOR_I | tORcc_R | tORcc_I | tORN_R | tORN_I | tORNcc_R | tORNcc_I 
!!# 	| tXOR_R | tXOR_I | tXORcc_R | tXORcc_I | tXNOR_R | tXNOR_I | tXNORcc_R | tXNORcc_I 
!!# 	| tMOVR_R | tMOVR_I | tMOVcc_R | tMOVcc_I | tSRL_R | tSRL_I | tSRA_R | tSRA_I | tSRLX_R 
!!# 	| tSRLX_I | tSRAX_R | tSRAX_I | tSLL_R | tSLL_I | tSLLX_R | tSLLX_I
!!# ;
!!# 
!!# spu_rsrv_illgl: mSPU_ILLGL
!!# 	{
!!# 	  IJ_printf ("diag.j", 300, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!# 	  IJ_printf ("diag.j", 301, th_all, "\tmov\t0x80, %%g1\n");
!!# 	  IJ_printf ("diag.j", 302, th_all, "\tmov\t0x%rx, %%g2\n", Rv_ma_cntl);
!!# 	  IJ_printf ("diag.j", 303, th_all, "\tstxa\t%%g2, [%%g1] 0x40\n");
!!# 	  IJ_printf ("diag.j", 304, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#         }
!!# ;
!!# hw_intr:
!!# 	mHWINT
!!#         {
!!#           IJ_printf ("diag.j", 310, th_all, "hwintr_%y_%d:\n", loop_cnt);
!!#           IJ_printf ("diag.j", 311, th_all, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.hwintr_%y_%d), 16, 16)) -> intp(%y, 0, %rx)\n", loop_cnt, Rv_intr_vect);
!!#           loop_cnt++;
!!#         }
!!# ;
!!# 
!!# 
!!# %%
!!# %%section cbfunc
!!# 
!!# 
!!# 
!!# 
!!# 
!!# %%
!!# %%section stat
!!# 
!!# %%
#endif
