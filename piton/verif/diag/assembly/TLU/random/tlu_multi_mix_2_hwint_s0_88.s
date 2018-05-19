// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_88.s
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
   random seed:	939849853
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

	setx 0xcd5376de2f075a5a, %g1, %g0
	setx 0xe68533f4576ae950, %g1, %g1
	setx 0x6f4fa3851c281164, %g1, %g2
	setx 0x68812c68cb271e9c, %g1, %g3
	setx 0xce0b47882e0d9924, %g1, %g4
	setx 0x84c7bec961e4e09c, %g1, %g5
	setx 0x94ed118819c2c0db, %g1, %g6
	setx 0x8123db51da7a8d62, %g1, %g7
	setx 0x2479b366f03c4fe8, %g1, %r16
	setx 0xdae811b59d7b1058, %g1, %r17
	setx 0x9db793007a119d3b, %g1, %r18
	setx 0x36d2d43d915d0fd4, %g1, %r19
	setx 0xb2775b51fecfb688, %g1, %r20
	setx 0x29238522bc7c624f, %g1, %r21
	setx 0x59c89ce899b7e7da, %g1, %r22
	setx 0x252ea9d7e4c4413e, %g1, %r23
	setx 0x20ff1a1ec8032c31, %g1, %r24
	setx 0x056b86664a8b3b62, %g1, %r25
	setx 0x8841bd6d0794c235, %g1, %r26
	setx 0xb97c3f85d2becfb9, %g1, %r27
	setx 0x342c5da7f1ee5694, %g1, %r28
	setx 0x8466c3f176f39e95, %g1, %r29
	setx 0xb339ba0c5c0027b5, %g1, %r30
	setx 0xfd410bfe75d57ab0, %g1, %r31
	save
	setx 0x12c3bd41fef57fd9, %g1, %r16
	setx 0x9cfd18191f8f3da3, %g1, %r17
	setx 0x741912f45d1271c8, %g1, %r18
	setx 0x44d4cbf5064541c6, %g1, %r19
	setx 0xbb146d3ddcae70e3, %g1, %r20
	setx 0x72229bc6b7e0f05e, %g1, %r21
	setx 0xc45d582ad859d6b4, %g1, %r22
	setx 0xe0120c3c710a819d, %g1, %r23
	setx 0xc026a088c9a7400a, %g1, %r24
	setx 0x852ac7242703d33e, %g1, %r25
	setx 0xcf3035e57c9bbdc9, %g1, %r26
	setx 0x1011d981105831c3, %g1, %r27
	setx 0x5bf7b9a57c5fe5c7, %g1, %r28
	setx 0x8ac5825024081997, %g1, %r29
	setx 0x03b70af0fd6323af, %g1, %r30
	setx 0x40b2bab98a837735, %g1, %r31
	save
	setx 0x39050713c33c751d, %g1, %r16
	setx 0xd3a00e8a7cc9cf86, %g1, %r17
	setx 0x8d94a6b6d45ac36b, %g1, %r18
	setx 0xb1abdb226545ad08, %g1, %r19
	setx 0x0a2fbfb8922d035d, %g1, %r20
	setx 0xf4cdf2513a85a760, %g1, %r21
	setx 0x80f8b26254dfefa3, %g1, %r22
	setx 0x0e0bb734c9bc21d1, %g1, %r23
	setx 0xf3d40827aa9cb0b5, %g1, %r24
	setx 0x870f325fe072813e, %g1, %r25
	setx 0xef29e52b940f6227, %g1, %r26
	setx 0xb40743530d53887d, %g1, %r27
	setx 0x1f4a9f68eb932197, %g1, %r28
	setx 0x4a030284e1446085, %g1, %r29
	setx 0x078808364161713f, %g1, %r30
	setx 0x5c47efe54f8c07de, %g1, %r31
	save
	setx 0x2831cbe23a72f07d, %g1, %r16
	setx 0xc392db16dc82a1c2, %g1, %r17
	setx 0xb6cfba93ec4a6702, %g1, %r18
	setx 0x3f6c74fffcbbd8c6, %g1, %r19
	setx 0x060a6804853c6aad, %g1, %r20
	setx 0x9bcb639741ae2919, %g1, %r21
	setx 0x38e2556181ef5e8e, %g1, %r22
	setx 0x04fe16bbacdf1a62, %g1, %r23
	setx 0x821ba5baead7d195, %g1, %r24
	setx 0xb1bfc6edece4c22c, %g1, %r25
	setx 0x634e9ce54bf3a635, %g1, %r26
	setx 0xc9b9cffe59b669f4, %g1, %r27
	setx 0x8d93ab6239309757, %g1, %r28
	setx 0x1128543d3208bbed, %g1, %r29
	setx 0xe82db978f62803a4, %g1, %r30
	setx 0x88398f24f739da6b, %g1, %r31
	save
	setx 0xdffcf5e4e3e37782, %g1, %r16
	setx 0xf0cddee5d48d918e, %g1, %r17
	setx 0xcb243cf7233a5e6b, %g1, %r18
	setx 0x8e3a4fc3ac022291, %g1, %r19
	setx 0x78f69163489914d0, %g1, %r20
	setx 0x485ac64ccc690aff, %g1, %r21
	setx 0x37f3bc0a0cbaeab6, %g1, %r22
	setx 0x4aafe438c9872ef5, %g1, %r23
	setx 0xac33cf8ab491148d, %g1, %r24
	setx 0xd7764bc2e93f01ab, %g1, %r25
	setx 0xeac40a3cd044f205, %g1, %r26
	setx 0xeffeb21db7136049, %g1, %r27
	setx 0xe19e25635b168cf2, %g1, %r28
	setx 0xa3814bf645de9cc1, %g1, %r29
	setx 0x6bae8eb66a7e55b5, %g1, %r30
	setx 0x86b92b7f5fcab3f7, %g1, %r31
	save
	setx 0xb451787829937cdd, %g1, %r16
	setx 0xb647ffdb3a52a916, %g1, %r17
	setx 0x38685bbe9c376167, %g1, %r18
	setx 0xf5fe5b882898bbbe, %g1, %r19
	setx 0xbc23dbae3be31359, %g1, %r20
	setx 0xe240cba2e4253614, %g1, %r21
	setx 0x6a119a4456798bd9, %g1, %r22
	setx 0x5c90ef7496662ef9, %g1, %r23
	setx 0xa0ea174d49a1358e, %g1, %r24
	setx 0x5cfbf2082dea553a, %g1, %r25
	setx 0x2a45491133112f46, %g1, %r26
	setx 0x5ceed6c375aa4af8, %g1, %r27
	setx 0x8e49b16a634ab300, %g1, %r28
	setx 0x7dad854c9a39dddd, %g1, %r29
	setx 0xdf627cf07eeceb4c, %g1, %r30
	setx 0x983918eea984e5a5, %g1, %r31
	save
	setx 0x3f4eadbe9a721f32, %g1, %r16
	setx 0x6116c98ca702f8ed, %g1, %r17
	setx 0xd385393749ef4050, %g1, %r18
	setx 0xa0b1e1b1c164f60f, %g1, %r19
	setx 0x57877e0dfa60bb1a, %g1, %r20
	setx 0x9adfda7b733bd376, %g1, %r21
	setx 0xd48d8ee460acf687, %g1, %r22
	setx 0xd7603172459b8366, %g1, %r23
	setx 0xb1acb12e21ce2d17, %g1, %r24
	setx 0xcf87ea21af35499b, %g1, %r25
	setx 0xa9114512c67db435, %g1, %r26
	setx 0x8c9f3eabeee84306, %g1, %r27
	setx 0x2c8292e3b222fa13, %g1, %r28
	setx 0xfa1eff6facaabc81, %g1, %r29
	setx 0xff8bc9082417d298, %g1, %r30
	setx 0xd38d230dd2c592eb, %g1, %r31
	save
	setx 0x80a0799bcee440ea, %g1, %r16
	setx 0xc7a955e39d0ed402, %g1, %r17
	setx 0xd97f01a004ad5c7f, %g1, %r18
	setx 0x2feaf14733b6b4d5, %g1, %r19
	setx 0x854d539be7ac9a76, %g1, %r20
	setx 0xffd6a6cf9dc089b6, %g1, %r21
	setx 0x43ba1567aec5ac59, %g1, %r22
	setx 0xebf7dbc449e4f190, %g1, %r23
	setx 0xac8d5025871bfc2d, %g1, %r24
	setx 0xea7a6bff748970c7, %g1, %r25
	setx 0x171ab1b671a9ffa0, %g1, %r26
	setx 0x2b545d1ac12f784a, %g1, %r27
	setx 0x672ba7a0cb1459c4, %g1, %r28
	setx 0x0aba749b95c1ac37, %g1, %r29
	setx 0x51e34b1bde5f1b2a, %g1, %r30
	setx 0xda3bf7719cda67f5, %g1, %r31
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
	.word 0x8994a163  ! 1: WRPR_TICK_I	wrpr	%r18, 0x0163, %tick
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 34)
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb7e5a111  ! 6: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb434e1f5  ! 16: ORN_I	orn 	%r19, 0x01f5, %r26
	.word 0xb1e4e017  ! 17: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x8195e0a2  ! 18: WRPR_TPC_I	wrpr	%r23, 0x00a2, %tpc
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 30)
	.word 0xb5e4e1e2  ! 21: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x83946188  ! 24: WRPR_TNPC_I	wrpr	%r17, 0x0188, %tnpc
	.word 0xbbe52071  ! 27: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5e5216e  ! 30: SAVE_I	save	%r20, 0x0001, %r26
	.word 0x8594e180  ! 32: WRPR_TSTATE_I	wrpr	%r19, 0x0180, %tstate
	.word 0xb550c000  ! 36: RDPR_TT	<illegal instruction>
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 15)
	.word 0xb7e5e044  ! 47: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe5e149  ! 50: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e52084  ! 54: SAVE_I	save	%r20, 0x0001, %r28
	.word 0x9194a0d4  ! 55: WRPR_PIL_I	wrpr	%r18, 0x00d4, %pil
	mov	1, %r12
	.word 0x8f930000  ! 56: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfe46129  ! 58: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x81942189  ! 59: WRPR_TPC_I	wrpr	%r16, 0x0189, %tpc
	.word 0xb7504000  ! 61: RDPR_TNPC	<illegal instruction>
	.word 0xb7e52009  ! 62: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x839421b7  ! 65: WRPR_TNPC_I	wrpr	%r16, 0x01b7, %tnpc
	.word 0xbbe5618f  ! 67: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5e560d7  ! 71: SAVE_I	save	%r21, 0x0001, %r26
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 0)
	.word 0xb9e52039  ! 79: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1504000  ! 83: RDPR_TNPC	<illegal instruction>
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 22)
	.word 0xbde52071  ! 85: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5540000  ! 88: RDPR_GL	<illegal instruction>
	.word 0xb1e4e129  ! 90: SAVE_I	save	%r19, 0x0001, %r24
	setx	0x3df8f8e20000be0e, %g1, %r10
	.word 0x839a8000  ! 91: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb0bc4000  ! 92: XNORcc_R	xnorcc 	%r17, %r0, %r24
	.word 0xbe9d8000  ! 93: XORcc_R	xorcc 	%r22, %r0, %r31
	.word 0xb1e461ac  ! 94: SAVE_I	save	%r17, 0x0001, %r24
	setx	data_start_3, %g1, %r18
	.word 0x8d94a011  ! 97: WRPR_PSTATE_I	wrpr	%r18, 0x0011, %pstate
	.word 0xb3e4e0ef  ! 99: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5e520a7  ! 101: SAVE_I	save	%r20, 0x0001, %r26
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 3)
	.word 0xbfe461bc  ! 105: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7e4607e  ! 109: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7508000  ! 111: RDPR_TSTATE	<illegal instruction>
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 6)
	.word 0xb5e5a120  ! 115: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1e56101  ! 116: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbfe4a140  ! 117: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x89956049  ! 118: WRPR_TICK_I	wrpr	%r21, 0x0049, %tick
	.word 0xb5e4a03c  ! 119: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e5e078  ! 121: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbbe46120  ! 125: SAVE_I	save	%r17, 0x0001, %r29
	setx	0xa711c40e00002fde, %g1, %r10
	.word 0x819a8000  ! 126: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbde5e05e  ! 129: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde42015  ! 131: SAVE_I	save	%r16, 0x0001, %r30
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbb353001  ! 135: SRLX_I	srlx	%r20, 0x0001, %r29
	mov	2, %r12
	.word 0x8f930000  ! 136: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3e4e082  ! 138: SAVE_I	save	%r19, 0x0001, %r25
	mov	0, %r12
	.word 0x8f930000  ! 139: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8594e06a  ! 141: WRPR_TSTATE_I	wrpr	%r19, 0x006a, %tstate
	.word 0xbd518000  ! 142: RDPR_PSTATE	<illegal instruction>
	.word 0xb9e5208d  ! 143: SAVE_I	save	%r20, 0x0001, %r28
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 36)
	.word 0xbf504000  ! 152: RDPR_TNPC	<illegal instruction>
	.word 0xb551c000  ! 153: RDPR_TL	<illegal instruction>
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, e)
	.word 0xb3e4e16d  ! 155: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8395a01b  ! 156: WRPR_TNPC_I	wrpr	%r22, 0x001b, %tnpc
	.word 0xb7e521a4  ! 159: SAVE_I	save	%r20, 0x0001, %r27
	mov	2, %r12
	.word 0xa1930000  ! 162: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 22)
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbfe5202c  ! 169: SAVE_I	save	%r20, 0x0001, %r31
	setx	data_start_5, %g1, %r21
	.word 0xbf3c8000  ! 172: SRA_R	sra 	%r18, %r0, %r31
	.word 0xbf3dd000  ! 174: SRAX_R	srax	%r23, %r0, %r31
	.word 0xb41d8000  ! 175: XOR_R	xor 	%r22, %r0, %r26
	.word 0xb1e5a067  ! 179: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e4a0ab  ! 181: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbb641800  ! 183: MOVcc_R	<illegal instruction>
	.word 0xb1480000  ! 185: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbde5e0dd  ! 191: SAVE_I	save	%r23, 0x0001, %r30
	setx	0xc1d545e700004e48, %g1, %r10
	.word 0x819a8000  ! 194: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbde4e1fb  ! 196: SAVE_I	save	%r19, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x83942148  ! 204: WRPR_TNPC_I	wrpr	%r16, 0x0148, %tnpc
	.word 0x819420dc  ! 205: WRPR_TPC_I	wrpr	%r16, 0x00dc, %tpc
	.word 0xb01d4000  ! 206: XOR_R	xor 	%r21, %r0, %r24
	.word 0xb551c000  ! 207: RDPR_TL	<illegal instruction>
	.word 0xb205c000  ! 208: ADD_R	add 	%r23, %r0, %r25
	.word 0xb9e52147  ! 210: SAVE_I	save	%r20, 0x0001, %r28
	setx	data_start_6, %g1, %r18
	.word 0xbfe4e0c7  ! 214: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbb351000  ! 216: SRLX_R	srlx	%r20, %r0, %r29
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbde42052  ! 219: SAVE_I	save	%r16, 0x0001, %r30
	mov	2, %r12
	.word 0x8f930000  ! 220: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9e5a11a  ! 222: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x879520ef  ! 227: WRPR_TT_I	wrpr	%r20, 0x00ef, %tt
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8d942038  ! 232: WRPR_PSTATE_I	wrpr	%r16, 0x0038, %pstate
	.word 0xbbe46116  ! 239: SAVE_I	save	%r17, 0x0001, %r29
	setx	data_start_1, %g1, %r21
	.word 0xb7e520f6  ! 243: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e52160  ! 244: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb9e4601e  ! 245: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb0842115  ! 247: ADDcc_I	addcc 	%r16, 0x0115, %r24
	.word 0xbfe5a1a4  ! 253: SAVE_I	save	%r22, 0x0001, %r31
	setx	data_start_4, %g1, %r23
	setx	0xdd53ae2d0000da04, %g1, %r10
	.word 0x819a8000  ! 263: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3e46173  ! 269: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe420f4  ! 270: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e521ab  ! 271: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e5e1ae  ! 273: SAVE_I	save	%r23, 0x0001, %r25
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb1e4a1ce  ! 288: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e4e08d  ! 289: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde5a179  ! 291: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e4e0b9  ! 293: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x8995608f  ! 296: WRPR_TICK_I	wrpr	%r21, 0x008f, %tick
	setx	data_start_5, %g1, %r18
	.word 0xbde42073  ! 307: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb8b54000  ! 308: SUBCcc_R	orncc 	%r21, %r0, %r28
	.word 0xbde461be  ! 311: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x9195e1f3  ! 312: WRPR_PIL_I	wrpr	%r23, 0x01f3, %pil
	.word 0xb9e4a08e  ! 315: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e4a13f  ! 318: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9641800  ! 320: MOVcc_R	<illegal instruction>
	.word 0x8195e03e  ! 321: WRPR_TPC_I	wrpr	%r23, 0x003e, %tpc
	.word 0xb1e4206b  ! 324: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe5209e  ! 326: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe42062  ! 327: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e4e005  ! 330: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e4a099  ! 331: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbde5204a  ! 332: SAVE_I	save	%r20, 0x0001, %r30
	setx	data_start_2, %g1, %r23
	.word 0xbbe56003  ! 334: SAVE_I	save	%r21, 0x0001, %r29
	mov	2, %r12
	.word 0x8f930000  ! 336: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x9195a1ca  ! 339: WRPR_PIL_I	wrpr	%r22, 0x01ca, %pil
	.word 0x8195e0d9  ! 340: WRPR_TPC_I	wrpr	%r23, 0x00d9, %tpc
	.word 0xb2ac6118  ! 342: ANDNcc_I	andncc 	%r17, 0x0118, %r25
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb9e5e00c  ! 345: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe42162  ! 348: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e560ca  ! 352: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x8d9460ea  ! 360: WRPR_PSTATE_I	wrpr	%r17, 0x00ea, %pstate
	.word 0xbf51c000  ! 361: RDPR_TL	<illegal instruction>
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 23)
	.word 0xb7e4216f  ! 370: SAVE_I	save	%r16, 0x0001, %r27
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb3504000  ! 373: RDPR_TNPC	<illegal instruction>
	.word 0xb5e52062  ! 374: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbb540000  ! 377: RDPR_GL	<illegal instruction>
	.word 0xbfe56005  ! 378: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1500000  ! 379: RDPR_TPC	<illegal instruction>
	.word 0xbd540000  ! 380: RDPR_GL	<illegal instruction>
	setx	0x852e38900000790c, %g1, %r10
	.word 0x819a8000  ! 381: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x85956148  ! 382: WRPR_TSTATE_I	wrpr	%r21, 0x0148, %tstate
	.word 0xb5e421a8  ! 389: SAVE_I	save	%r16, 0x0001, %r26
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 31)
	.word 0xbfe520ed  ! 393: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x8994a085  ! 395: WRPR_TICK_I	wrpr	%r18, 0x0085, %tick
	.word 0xbc1d614f  ! 396: XOR_I	xor 	%r21, 0x014f, %r30
	.word 0xb1e5a05c  ! 402: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7504000  ! 405: RDPR_TNPC	<illegal instruction>
	.word 0xbfe4a08a  ! 406: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e520b8  ! 409: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e5a05f  ! 412: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb9e520ea  ! 413: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7540000  ! 414: RDPR_GL	<illegal instruction>
	.word 0xb9e5e05c  ! 415: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e5e12d  ! 417: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbb7c6401  ! 418: MOVR_I	movre	%r17, 0x1, %r29
	.word 0xb7e52099  ! 424: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb294e087  ! 426: ORcc_I	orcc 	%r19, 0x0087, %r25
	.word 0xb6bcc000  ! 430: XNORcc_R	xnorcc 	%r19, %r0, %r27
	.word 0xb3e4a1a3  ! 435: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe4601f  ! 439: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8195e0c7  ! 442: WRPR_TPC_I	wrpr	%r23, 0x00c7, %tpc
	.word 0xbbe5613e  ! 443: SAVE_I	save	%r21, 0x0001, %r29
	setx	data_start_2, %g1, %r16
	mov	2, %r12
	.word 0xa1930000  ! 448: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1e52085  ! 451: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8d956038  ! 452: WRPR_PSTATE_I	wrpr	%r21, 0x0038, %pstate
	.word 0xb5e4a05a  ! 457: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde421d8  ! 460: SAVE_I	save	%r16, 0x0001, %r30
	setx	data_start_0, %g1, %r18
	.word 0xb5e4a17d  ! 467: SAVE_I	save	%r18, 0x0001, %r26
	setx	0x6237f3b300001c1d, %g1, %r10
	.word 0x839a8000  ! 468: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8594a103  ! 469: WRPR_TSTATE_I	wrpr	%r18, 0x0103, %tstate
	.word 0xbbe42196  ! 471: SAVE_I	save	%r16, 0x0001, %r29
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 3)
	.word 0xb935b001  ! 476: SRLX_I	srlx	%r22, 0x0001, %r28
	mov	1, %r12
	.word 0x8f930000  ! 477: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x44aacb9200006a5a, %g1, %r10
	.word 0x819a8000  ! 478: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb500000  ! 480: RDPR_TPC	<illegal instruction>
	setx	0x43f6fd4a00006b8e, %g1, %r10
	.word 0x839a8000  ! 482: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9e5e060  ! 485: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe56129  ! 489: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5e5e0fe  ! 490: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb1e4e151  ! 491: SAVE_I	save	%r19, 0x0001, %r24
	setx	data_start_0, %g1, %r21
	.word 0xb951c000  ! 498: RDPR_TL	<illegal instruction>
	.word 0xbde42105  ! 499: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1518000  ! 502: RDPR_PSTATE	<illegal instruction>
	.word 0xbde52105  ! 503: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbd510000  ! 505: RDPR_TICK	<illegal instruction>
	.word 0xb9e4a17d  ! 507: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbde42042  ! 511: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbfe5a042  ! 512: SAVE_I	save	%r22, 0x0001, %r31
	setx	0x66b389ed00005fce, %g1, %r10
	.word 0x839a8000  ! 513: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5520000  ! 514: RDPR_PIL	<illegal instruction>
	.word 0x8395e140  ! 520: WRPR_TNPC_I	wrpr	%r23, 0x0140, %tnpc
	.word 0xbde4e0e3  ! 521: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e4216c  ! 526: SAVE_I	save	%r16, 0x0001, %r26
	.word 0x8d95e0ac  ! 527: WRPR_PSTATE_I	wrpr	%r23, 0x00ac, %pstate
	.word 0xb7e4e1d3  ! 528: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e5a07f  ! 529: SAVE_I	save	%r22, 0x0001, %r28
	mov	0, %r12
	.word 0xa1930000  ! 533: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_2, %g1, %r20
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 4)
	.word 0xb1e42081  ! 539: SAVE_I	save	%r16, 0x0001, %r24
	setx	data_start_0, %g1, %r19
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 18)
	.word 0xb1e56064  ! 550: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x8995a159  ! 553: WRPR_TICK_I	wrpr	%r22, 0x0159, %tick
	.word 0xb9e5e19b  ! 557: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb82da054  ! 562: ANDN_I	andn 	%r22, 0x0054, %r28
	.word 0xbde56090  ! 563: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb5e4208c  ! 564: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe4a1ea  ! 565: SAVE_I	save	%r18, 0x0001, %r29
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, c)
	.word 0xbde42175  ! 568: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e5a1a6  ! 569: SAVE_I	save	%r22, 0x0001, %r24
	mov	1, %r12
	.word 0x8f930000  ! 572: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbbe42102  ! 574: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb9e5a144  ! 579: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde420aa  ! 581: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbeb50000  ! 582: ORNcc_R	orncc 	%r20, %r0, %r31
	.word 0xbfe4e1e7  ! 584: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb0bde0a6  ! 589: XNORcc_I	xnorcc 	%r23, 0x00a6, %r24
	.word 0xb844e18f  ! 590: ADDC_I	addc 	%r19, 0x018f, %r28
	.word 0xb9e4a0b7  ! 591: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb9e5a0a2  ! 597: SAVE_I	save	%r22, 0x0001, %r28
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 12)
	.word 0xb4b44000  ! 601: SUBCcc_R	orncc 	%r17, %r0, %r26
	.word 0xb3e4e159  ! 605: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e42163  ! 613: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbfe5e1d6  ! 615: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe5e166  ! 617: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x9195e0de  ! 620: WRPR_PIL_I	wrpr	%r23, 0x00de, %pil
	.word 0xb3e4e069  ! 622: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe42190  ! 623: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e5207e  ! 624: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb9e5e138  ! 626: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e5600f  ! 628: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb9e4a1ef  ! 632: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb635215d  ! 633: SUBC_I	orn 	%r20, 0x015d, %r27
	.word 0xbb2d9000  ! 636: SLLX_R	sllx	%r22, %r0, %r29
	.word 0xb0854000  ! 639: ADDcc_R	addcc 	%r21, %r0, %r24
	.word 0xb5e4616b  ! 643: SAVE_I	save	%r17, 0x0001, %r26
	setx	0xe851fdc30000b952, %g1, %r10
	.word 0x839a8000  ! 645: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9e56005  ! 647: SAVE_I	save	%r21, 0x0001, %r28
	setx	data_start_6, %g1, %r17
	.word 0xb5e56007  ! 650: SAVE_I	save	%r21, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb5480000  ! 657: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb5e521d9  ! 664: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb751c000  ! 668: RDPR_TL	<illegal instruction>
	.word 0xbbe4219e  ! 669: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x8795219e  ! 672: WRPR_TT_I	wrpr	%r20, 0x019e, %tt
	.word 0xbd510000  ! 676: RDPR_TICK	<illegal instruction>
	.word 0xbfe4e1ee  ! 679: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb49dc000  ! 686: XORcc_R	xorcc 	%r23, %r0, %r26
	.word 0xb9518000  ! 687: RDPR_PSTATE	<illegal instruction>
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb9e4a0b8  ! 694: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8d95e06f  ! 697: WRPR_PSTATE_I	wrpr	%r23, 0x006f, %pstate
	.word 0xb7e460e1  ! 701: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe42154  ! 702: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbb643801  ! 703: MOVcc_I	<illegal instruction>
	.word 0xb1e42084  ! 704: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e4e0b4  ! 705: SAVE_I	save	%r19, 0x0001, %r26
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 2f)
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbe3dc000  ! 713: XNOR_R	xnor 	%r23, %r0, %r31
	mov	2, %r12
	.word 0x8f930000  ! 716: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8d95e0d8  ! 717: WRPR_PSTATE_I	wrpr	%r23, 0x00d8, %pstate
	.word 0xbfe4209c  ! 718: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb89ca1aa  ! 720: XORcc_I	xorcc 	%r18, 0x01aa, %r28
	.word 0xb7e4a051  ! 724: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x8195e191  ! 729: WRPR_TPC_I	wrpr	%r23, 0x0191, %tpc
	.word 0xb1e5a1e5  ! 730: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e461a2  ! 732: SAVE_I	save	%r17, 0x0001, %r27
	setx	0xc3f3024300002c92, %g1, %r10
	.word 0x819a8000  ! 735: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbbe4a16a  ! 736: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e5a023  ! 737: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7500000  ! 739: RDPR_TPC	<illegal instruction>
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 28)
	setx	data_start_2, %g1, %r22
	.word 0x919420d9  ! 747: WRPR_PIL_I	wrpr	%r16, 0x00d9, %pil
	.word 0xb7e4e021  ! 749: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb42c4000  ! 752: ANDN_R	andn 	%r17, %r0, %r26
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 15)
	.word 0x9195613c  ! 755: WRPR_PIL_I	wrpr	%r21, 0x013c, %pil
	setx	data_start_5, %g1, %r22
	.word 0xb81d0000  ! 763: XOR_R	xor 	%r20, %r0, %r28
	.word 0xb5510000  ! 764: RDPR_TICK	<illegal instruction>
	.word 0xb7e52192  ! 766: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbbe5215b  ! 768: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbb50c000  ! 771: RDPR_TT	<illegal instruction>
	.word 0x91946006  ! 772: WRPR_PIL_I	wrpr	%r17, 0x0006, %pil
	.word 0xb7e5e0a7  ! 773: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb37ca401  ! 775: MOVR_I	movre	%r18, 0x1, %r25
	.word 0x8194e014  ! 776: WRPR_TPC_I	wrpr	%r19, 0x0014, %tpc
	.word 0xb1e4217f  ! 777: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb62cc000  ! 780: ANDN_R	andn 	%r19, %r0, %r27
	.word 0xb5e52089  ! 781: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbbe4613e  ! 782: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe421fd  ! 785: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e4a034  ! 787: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde5e0d2  ! 789: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe5205e  ! 790: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7520000  ! 791: RDPR_PIL	<illegal instruction>
	.word 0xbde56025  ! 795: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe4e0a1  ! 797: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb751c000  ! 798: RDPR_TL	<illegal instruction>
	.word 0xb1e56078  ! 799: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde4a029  ! 800: SAVE_I	save	%r18, 0x0001, %r30
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 3a)
	.word 0x83956066  ! 808: WRPR_TNPC_I	wrpr	%r21, 0x0066, %tnpc
	.word 0xbbe5e0f9  ! 811: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x8794e095  ! 812: WRPR_TT_I	wrpr	%r19, 0x0095, %tt
	.word 0xbfe4a1ff  ! 813: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e5201a  ! 814: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9508000  ! 816: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe4e1bc  ! 817: SAVE_I	save	%r19, 0x0001, %r29
	setx	data_start_2, %g1, %r21
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbb2c1000  ! 826: SLLX_R	sllx	%r16, %r0, %r29
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 3d)
	.word 0x8995a1d3  ! 830: WRPR_TICK_I	wrpr	%r22, 0x01d3, %tick
	.word 0xb3510000  ! 833: RDPR_TICK	<illegal instruction>
	setx	data_start_6, %g1, %r16
	.word 0x819520fa  ! 836: WRPR_TPC_I	wrpr	%r20, 0x00fa, %tpc
	.word 0xbde4e0dd  ! 840: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1500000  ! 841: RDPR_TPC	<illegal instruction>
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 26)
	.word 0xb5e521cf  ! 843: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3e5e0ec  ! 846: SAVE_I	save	%r23, 0x0001, %r25
	setx	0x3f38adb200006ac6, %g1, %r10
	.word 0x839a8000  ! 852: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb4846124  ! 856: ADDcc_I	addcc 	%r17, 0x0124, %r26
	.word 0xbc054000  ! 861: ADD_R	add 	%r21, %r0, %r30
	.word 0xbd510000  ! 864: RDPR_TICK	<illegal instruction>
	.word 0xbfe56027  ! 866: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e5215d  ! 867: SAVE_I	save	%r20, 0x0001, %r26
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 16)
	.word 0xb7e5e10c  ! 870: SAVE_I	save	%r23, 0x0001, %r27
	mov	1, %r12
	.word 0xa1930000  ! 874: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfe46061  ! 875: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e5a17b  ! 876: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x879460be  ! 878: WRPR_TT_I	wrpr	%r17, 0x00be, %tt
	.word 0xb3e52071  ! 879: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbde5a18b  ! 881: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb4b5e07a  ! 882: ORNcc_I	orncc 	%r23, 0x007a, %r26
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, b)
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 20)
	.word 0xb1e461f4  ! 888: SAVE_I	save	%r17, 0x0001, %r24
	setx	data_start_0, %g1, %r18
	.word 0xb5e4204a  ! 892: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbf518000  ! 893: RDPR_PSTATE	<illegal instruction>
	.word 0xb1e4a031  ! 894: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5e421ad  ! 896: SAVE_I	save	%r16, 0x0001, %r26
	setx	data_start_0, %g1, %r16
	.word 0xb3e5a095  ! 898: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe4e012  ! 901: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e4a1c7  ! 903: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e560f1  ! 904: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe5a060  ! 905: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbe248000  ! 907: SUB_R	sub 	%r18, %r0, %r31
	.word 0xbbe5a12f  ! 909: SAVE_I	save	%r22, 0x0001, %r29
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 3b)
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb3e5e15c  ! 916: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8795e08e  ! 919: WRPR_TT_I	wrpr	%r23, 0x008e, %tt
	setx	0x8668e59b00003f89, %g1, %r10
	.word 0x819a8000  ! 920: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, 37)
	.word 0xb1e56145  ! 925: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde4e090  ! 926: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3e4219b  ! 929: SAVE_I	save	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8195e16f  ! 933: WRPR_TPC_I	wrpr	%r23, 0x016f, %tpc
	.word 0xbde5a0b4  ! 935: SAVE_I	save	%r22, 0x0001, %r30
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb1e4e13f  ! 940: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe461c3  ! 942: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbd50c000  ! 944: RDPR_TT	<illegal instruction>
	.word 0xb7e420a3  ! 947: SAVE_I	save	%r16, 0x0001, %r27
	mov	2, %r12
	.word 0xa1930000  ! 948: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbe058000  ! 949: ADD_R	add 	%r22, %r0, %r31
	.word 0xb9e5e0bd  ! 964: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbd50c000  ! 965: RDPR_TT	<illegal instruction>
	.word 0xb534a001  ! 968: SRL_I	srl 	%r18, 0x0001, %r26
	.word 0xbf520000  ! 971: RDPR_PIL	<illegal instruction>
	.word 0xb3e5e00e  ! 972: SAVE_I	save	%r23, 0x0001, %r25
	mov	2, %r12
	.word 0xa1930000  ! 975: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7500000  ! 980: RDPR_TPC	<illegal instruction>
	.word 0xba1cc000  ! 981: XOR_R	xor 	%r19, %r0, %r29
	.word 0xb3e5e02b  ! 982: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9e5e0d9  ! 985: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e56123  ! 990: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x8995216e  ! 993: WRPR_TICK_I	wrpr	%r20, 0x016e, %tick
	.word 0xb7e56155  ! 997: SAVE_I	save	%r21, 0x0001, %r27
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
	.word 0x899421a4  ! 1: WRPR_TICK_I	wrpr	%r16, 0x01a4, %tick
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 28)
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, b)
	.word 0xfa35c000  ! 8: STH_R	sth	%r29, [%r23 + %r0]
	.word 0xf02c8000  ! 9: STB_R	stb	%r24, [%r18 + %r0]
	.word 0xf63da1fe  ! 10: STD_I	std	%r27, [%r22 + 0x01fe]
	.word 0xf6344000  ! 11: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xf8254000  ! 15: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xb834e091  ! 16: ORN_I	orn 	%r19, 0x0091, %r28
	.word 0x8194a0c0  ! 18: WRPR_TPC_I	wrpr	%r18, 0x00c0, %tpc
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 29)
	.word 0xfa2d4000  ! 20: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xff3c2096  ! 22: STDF_I	std	%f31, [0x0096, %r16]
	.word 0x839521a4  ! 24: WRPR_TNPC_I	wrpr	%r20, 0x01a4, %tnpc
	.word 0xf82461e6  ! 25: STW_I	stw	%r28, [%r17 + 0x01e6]
	.word 0xfa344000  ! 26: STH_R	sth	%r29, [%r17 + %r0]
	.word 0x859561e0  ! 32: WRPR_TSTATE_I	wrpr	%r21, 0x01e0, %tstate
	.word 0xfe3560cc  ! 33: STH_I	sth	%r31, [%r21 + 0x00cc]
	.word 0xb550c000  ! 36: RDPR_TT	rdpr	%tt, %r26
	.word 0xf42d6151  ! 38: STB_I	stb	%r26, [%r21 + 0x0151]
	.word 0xfa258000  ! 39: STW_R	stw	%r29, [%r22 + %r0]
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 8)
	.word 0xfe2da051  ! 42: STB_I	stb	%r31, [%r22 + 0x0051]
	.word 0xf83d21b0  ! 43: STD_I	std	%r28, [%r20 + 0x01b0]
	.word 0xf4356005  ! 51: STH_I	sth	%r26, [%r21 + 0x0005]
	.word 0x9194a08f  ! 55: WRPR_PIL_I	wrpr	%r18, 0x008f, %pil
	mov	1, %r12
	.word 0x8f930000  ! 56: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8194e08d  ! 59: WRPR_TPC_I	wrpr	%r19, 0x008d, %tpc
	.word 0xb3504000  ! 61: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0x8395a16d  ! 65: WRPR_TNPC_I	wrpr	%r22, 0x016d, %tnpc
	.word 0xf0344000  ! 66: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xf33d4000  ! 70: STDF_R	std	%f25, [%r0, %r21]
	.word 0xf2254000  ! 73: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xfc35c000  ! 75: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xf035a081  ! 76: STH_I	sth	%r24, [%r22 + 0x0081]
	.word 0xf2344000  ! 77: STH_R	sth	%r25, [%r17 + %r0]
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 5)
	.word 0xf8754000  ! 80: STX_R	stx	%r28, [%r21 + %r0]
	.word 0xfc3c0000  ! 81: STD_R	std	%r30, [%r16 + %r0]
	.word 0xb1504000  ! 83: RDPR_TNPC	rdpr	%tnpc, %r24
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 9)
	.word 0xf23520d4  ! 87: STH_I	sth	%r25, [%r20 + 0x00d4]
	.word 0xbd540000  ! 88: RDPR_GL	<illegal instruction>
	setx	0xdb05edc0000048d3, %g1, %r10
	.word 0x839a8000  ! 91: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbabc4000  ! 92: XNORcc_R	xnorcc 	%r17, %r0, %r29
	.word 0xb69dc000  ! 93: XORcc_R	xorcc 	%r23, %r0, %r27
	setx	data_start_7, %g1, %r22
	.word 0x8d9421b3  ! 97: WRPR_PSTATE_I	wrpr	%r16, 0x01b3, %pstate
	.word 0xf42561a9  ! 98: STW_I	stw	%r26, [%r21 + 0x01a9]
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 2)
	.word 0xf03ca0a8  ! 103: STD_I	std	%r24, [%r18 + 0x00a8]
	.word 0xb9508000  ! 111: RDPR_TSTATE	rdpr	%tstate, %r28
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 28)
	.word 0x899420af  ! 118: WRPR_TICK_I	wrpr	%r16, 0x00af, %tick
	.word 0xf234e072  ! 122: STH_I	sth	%r25, [%r19 + 0x0072]
	setx	0x34089be900004d83, %g1, %r10
	.word 0x819a8000  ! 126: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf43c21b0  ! 128: STD_I	std	%r26, [%r16 + 0x01b0]
	.word 0xfc3d4000  ! 130: STD_R	std	%r30, [%r21 + %r0]
	.word 0xf2358000  ! 132: STH_R	sth	%r25, [%r22 + %r0]
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 2)
	.word 0xbd347001  ! 135: SRLX_I	srlx	%r17, 0x0001, %r30
	mov	0, %r12
	.word 0x8f930000  ! 136: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf6350000  ! 137: STH_R	sth	%r27, [%r20 + %r0]
	mov	2, %r12
	.word 0x8f930000  ! 139: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf23cc000  ! 140: STD_R	std	%r25, [%r19 + %r0]
	.word 0x8595e0b1  ! 141: WRPR_TSTATE_I	wrpr	%r23, 0x00b1, %tstate
	.word 0xb9518000  ! 142: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xf435e1a4  ! 145: STH_I	sth	%r26, [%r23 + 0x01a4]
	.word 0xf274211a  ! 148: STX_I	stx	%r25, [%r16 + 0x011a]
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 20)
	.word 0xb7504000  ! 152: RDPR_TNPC	<illegal instruction>
	.word 0xb951c000  ! 153: RDPR_TL	<illegal instruction>
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 30)
	.word 0x83956079  ! 156: WRPR_TNPC_I	wrpr	%r21, 0x0079, %tnpc
	.word 0xf67420ab  ! 160: STX_I	stx	%r27, [%r16 + 0x00ab]
	.word 0xfa2dc000  ! 161: STB_R	stb	%r29, [%r23 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 162: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 32)
	.word 0xf4250000  ! 165: STW_R	stw	%r26, [%r20 + %r0]
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 38)
	setx	data_start_4, %g1, %r22
	.word 0xb33cc000  ! 172: SRA_R	sra 	%r19, %r0, %r25
	.word 0xb73cd000  ! 174: SRAX_R	srax	%r19, %r0, %r27
	.word 0xb21dc000  ! 175: XOR_R	xor 	%r23, %r0, %r25
	.word 0xf07560d4  ! 176: STX_I	stx	%r24, [%r21 + 0x00d4]
	.word 0xfa75606b  ! 177: STX_I	stx	%r29, [%r21 + 0x006b]
	.word 0xbd641800  ! 183: MOVcc_R	<illegal instruction>
	.word 0xbf480000  ! 185: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	0x927fae2200005894, %g1, %r10
	.word 0x819a8000  ! 194: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf33c8000  ! 201: STDF_R	std	%f25, [%r0, %r18]
	.word 0x8395a045  ! 204: WRPR_TNPC_I	wrpr	%r22, 0x0045, %tnpc
	.word 0x8195e0ff  ! 205: WRPR_TPC_I	wrpr	%r23, 0x00ff, %tpc
	.word 0xb21c8000  ! 206: XOR_R	xor 	%r18, %r0, %r25
	.word 0xb951c000  ! 207: RDPR_TL	rdpr	%tl, %r28
	.word 0xbc040000  ! 208: ADD_R	add 	%r16, %r0, %r30
	.word 0xf874a16c  ! 211: STX_I	stx	%r28, [%r18 + 0x016c]
	setx	data_start_0, %g1, %r16
	.word 0xf0758000  ! 213: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xbd351000  ! 216: SRLX_R	srlx	%r20, %r0, %r30
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 13)
	mov	1, %r12
	.word 0x8f930000  ! 220: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf6748000  ! 224: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xf635c000  ! 226: STH_R	sth	%r27, [%r23 + %r0]
	.word 0x8794e1b6  ! 227: WRPR_TT_I	wrpr	%r19, 0x01b6, %tt
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8d95203a  ! 232: WRPR_PSTATE_I	wrpr	%r20, 0x003a, %pstate
	.word 0xff3cc000  ! 233: STDF_R	std	%f31, [%r0, %r19]
	.word 0xf53d0000  ! 238: STDF_R	std	%f26, [%r0, %r20]
	.word 0xf0246063  ! 241: STW_I	stw	%r24, [%r17 + 0x0063]
	setx	data_start_5, %g1, %r21
	.word 0xb085e04e  ! 247: ADDcc_I	addcc 	%r23, 0x004e, %r24
	.word 0xf4244000  ! 251: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xf0746112  ! 252: STX_I	stx	%r24, [%r17 + 0x0112]
	setx	data_start_0, %g1, %r18
	.word 0xfa74a192  ! 257: STX_I	stx	%r29, [%r18 + 0x0192]
	setx	0x3689a6a60000b9d6, %g1, %r10
	.word 0x819a8000  ! 263: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf43ce0e3  ! 265: STD_I	std	%r26, [%r19 + 0x00e3]
	.word 0xfd3c61d9  ! 272: STDF_I	std	%f30, [0x01d9, %r17]
	.word 0xfc75a100  ! 274: STX_I	stx	%r30, [%r22 + 0x0100]
	.word 0xf43cc000  ! 276: STD_R	std	%r26, [%r19 + %r0]
	.word 0xf43ce1e2  ! 281: STD_I	std	%r26, [%r19 + 0x01e2]
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 4)
	.word 0xf53d212d  ! 290: STDF_I	std	%f26, [0x012d, %r20]
	.word 0x8995a051  ! 296: WRPR_TICK_I	wrpr	%r22, 0x0051, %tick
	.word 0xf435c000  ! 298: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xfc3dc000  ! 299: STD_R	std	%r30, [%r23 + %r0]
	.word 0xf4348000  ! 300: STH_R	sth	%r26, [%r18 + %r0]
	.word 0xfa2d8000  ! 304: STB_R	stb	%r29, [%r22 + %r0]
	setx	data_start_4, %g1, %r23
	.word 0xbcb5c000  ! 308: SUBCcc_R	orncc 	%r23, %r0, %r30
	.word 0x9194a1d0  ! 312: WRPR_PIL_I	wrpr	%r18, 0x01d0, %pil
	.word 0xf53da1dd  ! 314: STDF_I	std	%f26, [0x01dd, %r22]
	.word 0xb5641800  ! 320: MOVcc_R	<illegal instruction>
	.word 0x8194608d  ! 321: WRPR_TPC_I	wrpr	%r17, 0x008d, %tpc
	.word 0xff3da081  ! 323: STDF_I	std	%f31, [0x0081, %r22]
	.word 0xf82de1e6  ! 325: STB_I	stb	%r28, [%r23 + 0x01e6]
	setx	data_start_4, %g1, %r18
	.word 0xf874c000  ! 335: STX_R	stx	%r28, [%r19 + %r0]
	mov	2, %r12
	.word 0x8f930000  ! 336: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc35c000  ! 337: STH_R	sth	%r30, [%r23 + %r0]
	.word 0x919461d3  ! 339: WRPR_PIL_I	wrpr	%r17, 0x01d3, %pil
	.word 0x8195a037  ! 340: WRPR_TPC_I	wrpr	%r22, 0x0037, %tpc
	.word 0xf6748000  ! 341: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xb4ace06f  ! 342: ANDNcc_I	andncc 	%r19, 0x006f, %r26
	.word 0xfc25614e  ! 343: STW_I	stw	%r30, [%r21 + 0x014e]
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 4)
	.word 0xfc354000  ! 353: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xf03c4000  ! 358: STD_R	std	%r24, [%r17 + %r0]
	.word 0x8d952099  ! 360: WRPR_PSTATE_I	wrpr	%r20, 0x0099, %pstate
	.word 0xb351c000  ! 361: RDPR_TL	rdpr	%tl, %r25
	.word 0xf73d8000  ! 362: STDF_R	std	%f27, [%r0, %r22]
	.word 0xf825e0db  ! 363: STW_I	stw	%r28, [%r23 + 0x00db]
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf53c4000  ! 367: STDF_R	std	%f26, [%r0, %r17]
	.word 0xf2254000  ! 368: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xf62c4000  ! 371: STB_R	stb	%r27, [%r17 + %r0]
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 11)
	.word 0xbf504000  ! 373: RDPR_TNPC	<illegal instruction>
	.word 0xfa340000  ! 376: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xb7540000  ! 377: RDPR_GL	<illegal instruction>
	.word 0xb1500000  ! 379: RDPR_TPC	<illegal instruction>
	.word 0xb1540000  ! 380: RDPR_GL	<illegal instruction>
	setx	0xa7d3582e00005f90, %g1, %r10
	.word 0x819a8000  ! 381: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8594e1ce  ! 382: WRPR_TSTATE_I	wrpr	%r19, 0x01ce, %tstate
	.word 0xfc74c000  ! 383: STX_R	stx	%r30, [%r19 + %r0]
	.word 0xfa758000  ! 387: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xf22de0bc  ! 388: STB_I	stb	%r25, [%r23 + 0x00bc]
	.word 0xf82d61a3  ! 390: STB_I	stb	%r28, [%r21 + 0x01a3]
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 35)
	.word 0x8995e108  ! 395: WRPR_TICK_I	wrpr	%r23, 0x0108, %tick
	.word 0xbc1d208b  ! 396: XOR_I	xor 	%r20, 0x008b, %r30
	.word 0xf53ca16c  ! 399: STDF_I	std	%f26, [0x016c, %r18]
	.word 0xfa35a05f  ! 401: STH_I	sth	%r29, [%r22 + 0x005f]
	.word 0xf27460e5  ! 403: STX_I	stx	%r25, [%r17 + 0x00e5]
	.word 0xfa24e12b  ! 404: STW_I	stw	%r29, [%r19 + 0x012b]
	.word 0xb7504000  ! 405: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xfe35e08e  ! 410: STH_I	sth	%r31, [%r23 + 0x008e]
	.word 0xfa758000  ! 411: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xb3540000  ! 414: RDPR_GL	<illegal instruction>
	.word 0xb57ca401  ! 418: MOVR_I	movre	%r18, 0x1, %r26
	.word 0xf83d2021  ! 420: STD_I	std	%r28, [%r20 + 0x0021]
	.word 0xfe35c000  ! 421: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xb29421f6  ! 426: ORcc_I	orcc 	%r16, 0x01f6, %r25
	.word 0xbebc4000  ! 430: XNORcc_R	xnorcc 	%r17, %r0, %r31
	.word 0xfb3c215e  ! 433: STDF_I	std	%f29, [0x015e, %r16]
	.word 0xf53d61ae  ! 438: STDF_I	std	%f26, [0x01ae, %r21]
	.word 0xfb3c20bd  ! 440: STDF_I	std	%f29, [0x00bd, %r16]
	.word 0x81946159  ! 442: WRPR_TPC_I	wrpr	%r17, 0x0159, %tpc
	.word 0xfc2ce008  ! 444: STB_I	stb	%r30, [%r19 + 0x0008]
	setx	data_start_2, %g1, %r16
	mov	1, %r12
	.word 0xa1930000  ! 448: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8d94e0f6  ! 452: WRPR_PSTATE_I	wrpr	%r19, 0x00f6, %pstate
	.word 0xf8248000  ! 453: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xf8258000  ! 455: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xf73d8000  ! 461: STDF_R	std	%f27, [%r0, %r22]
	setx	data_start_3, %g1, %r16
	.word 0xfe75c000  ! 464: STX_R	stx	%r31, [%r23 + %r0]
	setx	0x48b695e3000008cb, %g1, %r10
	.word 0x839a8000  ! 468: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x859560fb  ! 469: WRPR_TSTATE_I	wrpr	%r21, 0x00fb, %tstate
	.word 0xfe3da1b4  ! 472: STD_I	std	%r31, [%r22 + 0x01b4]
	.word 0xf13c4000  ! 473: STDF_R	std	%f24, [%r0, %r17]
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 12)
	.word 0xb735f001  ! 476: SRLX_I	srlx	%r23, 0x0001, %r27
	mov	1, %r12
	.word 0x8f930000  ! 477: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x6a4292a50000aa5c, %g1, %r10
	.word 0x819a8000  ! 478: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7500000  ! 480: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xf83d2077  ! 481: STD_I	std	%r28, [%r20 + 0x0077]
	setx	0x13e2f92f000079ce, %g1, %r10
	.word 0x839a8000  ! 482: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfb3c6195  ! 488: STDF_I	std	%f29, [0x0195, %r17]
	.word 0xfc250000  ! 493: STW_R	stw	%r30, [%r20 + %r0]
	setx	data_start_2, %g1, %r23
	.word 0xf6348000  ! 497: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xbf51c000  ! 498: RDPR_TL	rdpr	%tl, %r31
	.word 0xfe3c4000  ! 501: STD_R	std	%r31, [%r17 + %r0]
	.word 0xb3518000  ! 502: RDPR_PSTATE	<illegal instruction>
	.word 0xf03ce1d4  ! 504: STD_I	std	%r24, [%r19 + 0x01d4]
	.word 0xbd510000  ! 505: RDPR_TICK	<illegal instruction>
	.word 0xfa3ca078  ! 508: STD_I	std	%r29, [%r18 + 0x0078]
	setx	0x393c60a800002b99, %g1, %r10
	.word 0x839a8000  ! 513: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9520000  ! 514: RDPR_PIL	rdpr	%pil, %r28
	.word 0xfe758000  ! 517: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xf274a00e  ! 518: STX_I	stx	%r25, [%r18 + 0x000e]
	.word 0xf424615a  ! 519: STW_I	stw	%r26, [%r17 + 0x015a]
	.word 0x839560e1  ! 520: WRPR_TNPC_I	wrpr	%r21, 0x00e1, %tnpc
	.word 0x8d94e16d  ! 527: WRPR_PSTATE_I	wrpr	%r19, 0x016d, %pstate
	.word 0xfa754000  ! 532: STX_R	stx	%r29, [%r21 + %r0]
	mov	0, %r12
	.word 0xa1930000  ! 533: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_2, %g1, %r19
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 38)
	.word 0xf235e187  ! 543: STH_I	sth	%r25, [%r23 + 0x0187]
	setx	data_start_7, %g1, %r23
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 16)
	.word 0xfc240000  ! 552: STW_R	stw	%r30, [%r16 + %r0]
	.word 0x8995e147  ! 553: WRPR_TICK_I	wrpr	%r23, 0x0147, %tick
	.word 0xfa3cc000  ! 555: STD_R	std	%r29, [%r19 + %r0]
	.word 0xf2244000  ! 556: STW_R	stw	%r25, [%r17 + %r0]
	.word 0xf02da18a  ! 559: STB_I	stb	%r24, [%r22 + 0x018a]
	.word 0xbc2da081  ! 562: ANDN_I	andn 	%r22, 0x0081, %r30
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 1)
	.word 0xf42c0000  ! 571: STB_R	stb	%r26, [%r16 + %r0]
	mov	2, %r12
	.word 0x8f930000  ! 572: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc756130  ! 573: STX_I	stx	%r30, [%r21 + 0x0130]
	.word 0xbcb48000  ! 582: ORNcc_R	orncc 	%r18, %r0, %r30
	.word 0xf42dc000  ! 587: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xf474e03b  ! 588: STX_I	stx	%r26, [%r19 + 0x003b]
	.word 0xb2bc212e  ! 589: XNORcc_I	xnorcc 	%r16, 0x012e, %r25
	.word 0xb444e031  ! 590: ADDC_I	addc 	%r19, 0x0031, %r26
	.word 0xfc3421d0  ! 592: STH_I	sth	%r30, [%r16 + 0x01d0]
	.word 0xfc2d8000  ! 593: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xf73da058  ! 598: STDF_I	std	%f27, [0x0058, %r22]
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 25)
	.word 0xbeb40000  ! 601: SUBCcc_R	orncc 	%r16, %r0, %r31
	.word 0xfe34e0f5  ! 602: STH_I	sth	%r31, [%r19 + 0x00f5]
	.word 0xfc25c000  ! 607: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xf42d20ab  ! 616: STB_I	stb	%r26, [%r20 + 0x00ab]
	.word 0xf02d606c  ! 619: STB_I	stb	%r24, [%r21 + 0x006c]
	.word 0x9194e13c  ! 620: WRPR_PIL_I	wrpr	%r19, 0x013c, %pil
	.word 0xf0748000  ! 621: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xf73c0000  ! 627: STDF_R	std	%f27, [%r0, %r16]
	.word 0xfc74c000  ! 631: STX_R	stx	%r30, [%r19 + %r0]
	.word 0xb434e0e0  ! 633: SUBC_I	orn 	%r19, 0x00e0, %r26
	.word 0xb72dd000  ! 636: SLLX_R	sllx	%r23, %r0, %r27
	.word 0xf62c6150  ! 637: STB_I	stb	%r27, [%r17 + 0x0150]
	.word 0xbe844000  ! 639: ADDcc_R	addcc 	%r17, %r0, %r31
	.word 0xf22c8000  ! 640: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xfd3c202e  ! 644: STDF_I	std	%f30, [0x002e, %r16]
	setx	0x3b94364c0000ee45, %g1, %r10
	.word 0x839a8000  ! 645: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfe2d20f8  ! 653: STB_I	stb	%r31, [%r20 + 0x00f8]
	.word 0xbb480000  ! 657: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf824a1ac  ! 659: STW_I	stw	%r28, [%r18 + 0x01ac]
	.word 0xf43c8000  ! 665: STD_R	std	%r26, [%r18 + %r0]
	.word 0xb551c000  ! 668: RDPR_TL	<illegal instruction>
	.word 0xf625e06d  ! 670: STW_I	stw	%r27, [%r23 + 0x006d]
	.word 0xfa3ca0f3  ! 671: STD_I	std	%r29, [%r18 + 0x00f3]
	.word 0x8795e09e  ! 672: WRPR_TT_I	wrpr	%r23, 0x009e, %tt
	.word 0xf874c000  ! 674: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xf73c0000  ! 675: STDF_R	std	%f27, [%r0, %r16]
	.word 0xbd510000  ! 676: RDPR_TICK	rdpr	%tick, %r30
	.word 0xf43d604a  ! 677: STD_I	std	%r26, [%r21 + 0x004a]
	.word 0xf83da0e4  ! 678: STD_I	std	%r28, [%r22 + 0x00e4]
	.word 0xba9d8000  ! 686: XORcc_R	xorcc 	%r22, %r0, %r29
	.word 0xbb518000  ! 687: RDPR_PSTATE	<illegal instruction>
	.word 0xf025c000  ! 690: STW_R	stw	%r24, [%r23 + %r0]
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 26)
	.word 0xf4354000  ! 692: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xf8248000  ! 696: STW_R	stw	%r28, [%r18 + %r0]
	.word 0x8d95a1d4  ! 697: WRPR_PSTATE_I	wrpr	%r22, 0x01d4, %pstate
	.word 0xf83c20c7  ! 698: STD_I	std	%r28, [%r16 + 0x00c7]
	.word 0xf33de04a  ! 699: STDF_I	std	%f25, [0x004a, %r23]
	.word 0xbf643801  ! 703: MOVcc_I	<illegal instruction>
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 35)
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfe75a178  ! 712: STX_I	stx	%r31, [%r22 + 0x0178]
	.word 0xbc3d4000  ! 713: XNOR_R	xnor 	%r21, %r0, %r30
	mov	1, %r12
	.word 0x8f930000  ! 716: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8d94e046  ! 717: WRPR_PSTATE_I	wrpr	%r19, 0x0046, %pstate
	.word 0xb89de1c5  ! 720: XORcc_I	xorcc 	%r23, 0x01c5, %r28
	.word 0xf73d8000  ! 727: STDF_R	std	%f27, [%r0, %r22]
	.word 0x81956020  ! 729: WRPR_TPC_I	wrpr	%r21, 0x0020, %tpc
	.word 0xf03c61ac  ! 731: STD_I	std	%r24, [%r17 + 0x01ac]
	setx	0xb0cac5e700007c42, %g1, %r10
	.word 0x819a8000  ! 735: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfd3dc000  ! 738: STDF_R	std	%f30, [%r0, %r23]
	.word 0xb1500000  ! 739: RDPR_TPC	rdpr	%tpc, %r24
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 7)
	setx	data_start_3, %g1, %r21
	.word 0xf93dc000  ! 742: STDF_R	std	%f28, [%r0, %r23]
	.word 0xf82dc000  ! 745: STB_R	stb	%r28, [%r23 + %r0]
	.word 0x9195a00c  ! 747: WRPR_PIL_I	wrpr	%r22, 0x000c, %pil
	.word 0xf6248000  ! 748: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xfc742094  ! 750: STX_I	stx	%r30, [%r16 + 0x0094]
	.word 0xfd3de017  ! 751: STDF_I	std	%f30, [0x0017, %r23]
	.word 0xbc2c8000  ! 752: ANDN_R	andn 	%r18, %r0, %r30
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 13)
	.word 0x9194203c  ! 755: WRPR_PIL_I	wrpr	%r16, 0x003c, %pil
	.word 0xf93d0000  ! 756: STDF_R	std	%f28, [%r0, %r20]
	.word 0xff3c4000  ! 757: STDF_R	std	%f31, [%r0, %r17]
	.word 0xf33c6004  ! 759: STDF_I	std	%f25, [0x0004, %r17]
	.word 0xff3da0ca  ! 760: STDF_I	std	%f31, [0x00ca, %r22]
	setx	data_start_0, %g1, %r19
	.word 0xbe1c0000  ! 763: XOR_R	xor 	%r16, %r0, %r31
	.word 0xb7510000  ! 764: RDPR_TICK	rdpr	%tick, %r27
	.word 0xfe2d8000  ! 769: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xb550c000  ! 771: RDPR_TT	<illegal instruction>
	.word 0x9195a019  ! 772: WRPR_PIL_I	wrpr	%r22, 0x0019, %pil
	.word 0xb77c6401  ! 775: MOVR_I	movre	%r17, 0x1, %r27
	.word 0x819421e9  ! 776: WRPR_TPC_I	wrpr	%r16, 0x01e9, %tpc
	.word 0xb22c4000  ! 780: ANDN_R	andn 	%r17, %r0, %r25
	.word 0xb1520000  ! 791: RDPR_PIL	rdpr	%pil, %r24
	.word 0xf434e144  ! 794: STH_I	sth	%r26, [%r19 + 0x0144]
	.word 0xf83ce0f7  ! 796: STD_I	std	%r28, [%r19 + 0x00f7]
	.word 0xbd51c000  ! 798: RDPR_TL	<illegal instruction>
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 1)
	.word 0xf435a06c  ! 802: STH_I	sth	%r26, [%r22 + 0x006c]
	.word 0x839521e4  ! 808: WRPR_TNPC_I	wrpr	%r20, 0x01e4, %tnpc
	.word 0xf474a116  ! 809: STX_I	stx	%r26, [%r18 + 0x0116]
	.word 0xf235c000  ! 810: STH_R	sth	%r25, [%r23 + %r0]
	.word 0x8794208a  ! 812: WRPR_TT_I	wrpr	%r16, 0x008a, %tt
	.word 0xb5508000  ! 816: RDPR_TSTATE	rdpr	%tstate, %r26
	setx	data_start_0, %g1, %r18
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 9)
	.word 0xf33d215e  ! 823: STDF_I	std	%f25, [0x015e, %r20]
	.word 0xfc2d60fd  ! 824: STB_I	stb	%r30, [%r21 + 0x00fd]
	.word 0xb92d9000  ! 826: SLLX_R	sllx	%r22, %r0, %r28
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, 1)
	.word 0x8995a166  ! 830: WRPR_TICK_I	wrpr	%r22, 0x0166, %tick
	.word 0xbf510000  ! 833: RDPR_TICK	rdpr	%tick, %r31
	setx	data_start_1, %g1, %r19
	.word 0x8194a1f6  ! 836: WRPR_TPC_I	wrpr	%r18, 0x01f6, %tpc
	.word 0xf475c000  ! 838: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xbb500000  ! 841: RDPR_TPC	rdpr	%tpc, %r29
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 29)
	.word 0xf93de14d  ! 845: STDF_I	std	%f28, [0x014d, %r23]
	setx	0xd6649add0000bf09, %g1, %r10
	.word 0x839a8000  ! 852: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbe85a021  ! 856: ADDcc_I	addcc 	%r22, 0x0021, %r31
	.word 0xf33de14d  ! 858: STDF_I	std	%f25, [0x014d, %r23]
	.word 0xfe340000  ! 860: STH_R	sth	%r31, [%r16 + %r0]
	.word 0xbe05c000  ! 861: ADD_R	add 	%r23, %r0, %r31
	.word 0xf675205b  ! 863: STX_I	stx	%r27, [%r20 + 0x005b]
	.word 0xb9510000  ! 864: RDPR_TICK	rdpr	%tick, %r28
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, a)
	.word 0xf23d8000  ! 872: STD_R	std	%r25, [%r22 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 874: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8795e03c  ! 878: WRPR_TT_I	wrpr	%r23, 0x003c, %tt
	.word 0xb6b5a090  ! 882: ORNcc_I	orncc 	%r22, 0x0090, %r27
	.word 0xfe35e033  ! 885: STH_I	sth	%r31, [%r23 + 0x0033]
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 16)
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 3e)
	setx	data_start_1, %g1, %r22
	.word 0xf6348000  ! 891: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xbf518000  ! 893: RDPR_PSTATE	rdpr	%pstate, %r31
	setx	data_start_5, %g1, %r18
	.word 0xf63ce10e  ! 899: STD_I	std	%r27, [%r19 + 0x010e]
	.word 0xfc2ca0cf  ! 902: STB_I	stb	%r30, [%r18 + 0x00cf]
	.word 0xf825e0b4  ! 906: STW_I	stw	%r28, [%r23 + 0x00b4]
	.word 0xba250000  ! 907: SUB_R	sub 	%r20, %r0, %r29
	.word 0xf475c000  ! 908: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xf825e1b0  ! 913: STW_I	stw	%r28, [%r23 + 0x01b0]
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 15)
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 2a)
	.word 0xfb3ca0f7  ! 917: STDF_I	std	%f29, [0x00f7, %r18]
	.word 0xf13dc000  ! 918: STDF_R	std	%f24, [%r0, %r23]
	.word 0x8794a147  ! 919: WRPR_TT_I	wrpr	%r18, 0x0147, %tt
	setx	0x37fb168700000d07, %g1, %r10
	.word 0x819a8000  ! 920: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, 6)
	.word 0xfe2da0e7  ! 924: STB_I	stb	%r31, [%r22 + 0x00e7]
	.word 0xfa3cc000  ! 928: STD_R	std	%r29, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x81956050  ! 933: WRPR_TPC_I	wrpr	%r21, 0x0050, %tpc
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, 3a)
	.word 0xbf50c000  ! 944: RDPR_TT	rdpr	%tt, %r31
	.word 0xf435e1d1  ! 945: STH_I	sth	%r26, [%r23 + 0x01d1]
	mov	2, %r12
	.word 0xa1930000  ! 948: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb8044000  ! 949: ADD_R	add 	%r17, %r0, %r28
	.word 0xfc2521b4  ! 952: STW_I	stw	%r30, [%r20 + 0x01b4]
	.word 0xfd3ca067  ! 955: STDF_I	std	%f30, [0x0067, %r18]
	.word 0xf03d0000  ! 956: STD_R	std	%r24, [%r20 + %r0]
	.word 0xfe748000  ! 962: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xf42d4000  ! 963: STB_R	stb	%r26, [%r21 + %r0]
	.word 0xbd50c000  ! 965: RDPR_TT	rdpr	%tt, %r30
	.word 0xbf34a001  ! 968: SRL_I	srl 	%r18, 0x0001, %r31
	.word 0xf13d8000  ! 970: STDF_R	std	%f24, [%r0, %r22]
	.word 0xbb520000  ! 971: RDPR_PIL	<illegal instruction>
	.word 0xf93cc000  ! 973: STDF_R	std	%f28, [%r0, %r19]
	mov	0, %r12
	.word 0xa1930000  ! 975: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf23c211a  ! 976: STD_I	std	%r25, [%r16 + 0x011a]
	.word 0xf43dc000  ! 977: STD_R	std	%r26, [%r23 + %r0]
	.word 0xf13d0000  ! 978: STDF_R	std	%f24, [%r0, %r20]
	.word 0xf2356036  ! 979: STH_I	sth	%r25, [%r21 + 0x0036]
	.word 0xb9500000  ! 980: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xb41d8000  ! 981: XOR_R	xor 	%r22, %r0, %r26
	.word 0xf03c0000  ! 983: STD_R	std	%r24, [%r16 + %r0]
	.word 0xf4752094  ! 986: STX_I	stx	%r26, [%r20 + 0x0094]
	.word 0xfc3c6037  ! 987: STD_I	std	%r30, [%r17 + 0x0037]
	.word 0xf02d0000  ! 991: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xf8758000  ! 992: STX_R	stx	%r28, [%r22 + %r0]
	.word 0x8994210c  ! 993: WRPR_TICK_I	wrpr	%r16, 0x010c, %tick
	.word 0xf6346113  ! 995: STH_I	sth	%r27, [%r17 + 0x0113]
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
	.word 0x89956081  ! 1: WRPR_TICK_I	wrpr	%r21, 0x0081, %tick
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf4052023  ! 3: LDUW_I	lduw	[%r20 + 0x0023], %r26
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 36)
	.word 0xf61dc000  ! 5: LDD_R	ldd	[%r23 + %r0], %r27
	.word 0xfc140000  ! 7: LDUH_R	lduh	[%r16 + %r0], %r30
	.word 0xb435e119  ! 16: ORN_I	orn 	%r23, 0x0119, %r26
	.word 0x8195218c  ! 18: WRPR_TPC_I	wrpr	%r20, 0x018c, %tpc
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 4)
	.word 0xf00de16c  ! 23: LDUB_I	ldub	[%r23 + 0x016c], %r24
	.word 0x8395e0b8  ! 24: WRPR_TNPC_I	wrpr	%r23, 0x00b8, %tnpc
	.word 0xfc45e150  ! 29: LDSW_I	ldsw	[%r23 + 0x0150], %r30
	.word 0xfc1d0000  ! 31: LDD_R	ldd	[%r20 + %r0], %r30
	.word 0x8594e12d  ! 32: WRPR_TSTATE_I	wrpr	%r19, 0x012d, %tstate
	.word 0xfc04a0b3  ! 34: LDUW_I	lduw	[%r18 + 0x00b3], %r30
	.word 0xbd50c000  ! 36: RDPR_TT	<illegal instruction>
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 7)
	.word 0xfa0c4000  ! 44: LDUB_R	ldub	[%r17 + %r0], %r29
	.word 0xfc1d212c  ! 46: LDD_I	ldd	[%r20 + 0x012c], %r30
	.word 0x9194a1a9  ! 55: WRPR_PIL_I	wrpr	%r18, 0x01a9, %pil
	mov	2, %r12
	.word 0x8f930000  ! 56: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc0c0000  ! 57: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0x8194a042  ! 59: WRPR_TPC_I	wrpr	%r18, 0x0042, %tpc
	.word 0xf21dc000  ! 60: LDD_R	ldd	[%r23 + %r0], %r25
	.word 0xbd504000  ! 61: RDPR_TNPC	<illegal instruction>
	.word 0xf2154000  ! 63: LDUH_R	lduh	[%r21 + %r0], %r25
	.word 0xf0448000  ! 64: LDSW_R	ldsw	[%r18 + %r0], %r24
	.word 0x8394e034  ! 65: WRPR_TNPC_I	wrpr	%r19, 0x0034, %tnpc
	.word 0xf85c6022  ! 68: LDX_I	ldx	[%r17 + 0x0022], %r28
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 25)
	.word 0xb7504000  ! 83: RDPR_TNPC	<illegal instruction>
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 2f)
	.word 0xb9540000  ! 88: RDPR_GL	<illegal instruction>
	.word 0xfc054000  ! 89: LDUW_R	lduw	[%r21 + %r0], %r30
	setx	0x565336f00000295f, %g1, %r10
	.word 0x839a8000  ! 91: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb8bd4000  ! 92: XNORcc_R	xnorcc 	%r21, %r0, %r28
	.word 0xb09d8000  ! 93: XORcc_R	xorcc 	%r22, %r0, %r24
	setx	data_start_4, %g1, %r20
	.word 0x8d94a1f9  ! 97: WRPR_PSTATE_I	wrpr	%r18, 0x01f9, %pstate
	.word 0xf71de0a1  ! 100: LDDF_I	ldd	[%r23, 0x00a1], %f27
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 38)
	.word 0xfa5c605b  ! 104: LDX_I	ldx	[%r17 + 0x005b], %r29
	.word 0xf254c000  ! 107: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0xf2154000  ! 110: LDUH_R	lduh	[%r21 + %r0], %r25
	.word 0xbd508000  ! 111: RDPR_TSTATE	<illegal instruction>
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 3e)
	.word 0x899520d5  ! 118: WRPR_TICK_I	wrpr	%r20, 0x00d5, %tick
	.word 0xfa45e0a7  ! 120: LDSW_I	ldsw	[%r23 + 0x00a7], %r29
	.word 0xf21de0b5  ! 123: LDD_I	ldd	[%r23 + 0x00b5], %r25
	.word 0xf204e129  ! 124: LDUW_I	lduw	[%r19 + 0x0129], %r25
	setx	0xb14c887400000f12, %g1, %r10
	.word 0x819a8000  ! 126: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xff1de1ad  ! 133: LDDF_I	ldd	[%r23, 0x01ad], %f31
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, a)
	.word 0xbd347001  ! 135: SRLX_I	srlx	%r17, 0x0001, %r30
	mov	2, %r12
	.word 0x8f930000  ! 136: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	1, %r12
	.word 0x8f930000  ! 139: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x85956100  ! 141: WRPR_TSTATE_I	wrpr	%r21, 0x0100, %tstate
	.word 0xb1518000  ! 142: RDPR_PSTATE	<illegal instruction>
	.word 0xf71da02b  ! 144: LDDF_I	ldd	[%r22, 0x002b], %f27
	.word 0xff1c611d  ! 146: LDDF_I	ldd	[%r17, 0x011d], %f31
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 6)
	.word 0xbb504000  ! 152: RDPR_TNPC	<illegal instruction>
	.word 0xbb51c000  ! 153: RDPR_TL	<illegal instruction>
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 38)
	.word 0x8395a135  ! 156: WRPR_TNPC_I	wrpr	%r22, 0x0135, %tnpc
	mov	1, %r12
	.word 0xa1930000  ! 162: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 8)
	.word 0xf04d20c7  ! 166: LDSB_I	ldsb	[%r20 + 0x00c7], %r24
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 28)
	setx	data_start_1, %g1, %r18
	.word 0xbd3dc000  ! 172: SRA_R	sra 	%r23, %r0, %r30
	.word 0xf51d602f  ! 173: LDDF_I	ldd	[%r21, 0x002f], %f26
	.word 0xb13cd000  ! 174: SRAX_R	srax	%r19, %r0, %r24
	.word 0xb81c0000  ! 175: XOR_R	xor 	%r16, %r0, %r28
	.word 0xf4550000  ! 180: LDSH_R	ldsh	[%r20 + %r0], %r26
	.word 0xfa4d8000  ! 182: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xb1641800  ! 183: MOVcc_R	<illegal instruction>
	.word 0xbb480000  ! 185: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfe0d4000  ! 187: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xf45cc000  ! 188: LDX_R	ldx	[%r19 + %r0], %r26
	.word 0xfc45a03c  ! 189: LDSW_I	ldsw	[%r22 + 0x003c], %r30
	.word 0xfc14c000  ! 190: LDUH_R	lduh	[%r19 + %r0], %r30
	.word 0xf20de0b0  ! 192: LDUB_I	ldub	[%r23 + 0x00b0], %r25
	setx	0x957bfa480000f9ca, %g1, %r10
	.word 0x819a8000  ! 194: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc55a117  ! 200: LDSH_I	ldsh	[%r22 + 0x0117], %r30
	.word 0xf60c4000  ! 202: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0xfc1de0e9  ! 203: LDD_I	ldd	[%r23 + 0x00e9], %r30
	.word 0x8395e1bd  ! 204: WRPR_TNPC_I	wrpr	%r23, 0x01bd, %tnpc
	.word 0x819561ce  ! 205: WRPR_TPC_I	wrpr	%r21, 0x01ce, %tpc
	.word 0xb81d0000  ! 206: XOR_R	xor 	%r20, %r0, %r28
	.word 0xb951c000  ! 207: RDPR_TL	<illegal instruction>
	.word 0xbe044000  ! 208: ADD_R	add 	%r17, %r0, %r31
	.word 0xf64460bf  ! 209: LDSW_I	ldsw	[%r17 + 0x00bf], %r27
	setx	data_start_4, %g1, %r18
	.word 0xb7341000  ! 216: SRLX_R	srlx	%r16, %r0, %r27
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf05d6193  ! 218: LDX_I	ldx	[%r21 + 0x0193], %r24
	mov	2, %r12
	.word 0x8f930000  ! 220: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf605c000  ! 221: LDUW_R	lduw	[%r23 + %r0], %r27
	.word 0xf11d8000  ! 223: LDDF_R	ldd	[%r22, %r0], %f24
	.word 0xf60ca1b5  ! 225: LDUB_I	ldub	[%r18 + 0x01b5], %r27
	.word 0x87952106  ! 227: WRPR_TT_I	wrpr	%r20, 0x0106, %tt
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc55c000  ! 231: LDSH_R	ldsh	[%r23 + %r0], %r30
	.word 0x8d942018  ! 232: WRPR_PSTATE_I	wrpr	%r16, 0x0018, %pstate
	.word 0xf60c21ff  ! 234: LDUB_I	ldub	[%r16 + 0x01ff], %r27
	setx	data_start_4, %g1, %r18
	.word 0xfc5d4000  ! 246: LDX_R	ldx	[%r21 + %r0], %r30
	.word 0xb28521a3  ! 247: ADDcc_I	addcc 	%r20, 0x01a3, %r25
	.word 0xfe144000  ! 248: LDUH_R	lduh	[%r17 + %r0], %r31
	.word 0xfe4c0000  ! 249: LDSB_R	ldsb	[%r16 + %r0], %r31
	.word 0xf71c4000  ! 250: LDDF_R	ldd	[%r17, %r0], %f27
	.word 0xf8054000  ! 254: LDUW_R	lduw	[%r21 + %r0], %r28
	setx	data_start_5, %g1, %r17
	.word 0xf015e14f  ! 258: LDUH_I	lduh	[%r23 + 0x014f], %r24
	.word 0xf01d2154  ! 259: LDD_I	ldd	[%r20 + 0x0154], %r24
	setx	0x3002b510000598b, %g1, %r10
	.word 0x819a8000  ! 263: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfe0ce06d  ! 264: LDUB_I	ldub	[%r19 + 0x006d], %r31
	.word 0xf24c4000  ! 275: LDSB_R	ldsb	[%r17 + %r0], %r25
	.word 0xfa442162  ! 277: LDSW_I	ldsw	[%r16 + 0x0162], %r29
	.word 0xfe54e0bd  ! 278: LDSH_I	ldsh	[%r19 + 0x00bd], %r31
	.word 0xf0146057  ! 282: LDUH_I	lduh	[%r17 + 0x0057], %r24
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 22)
	.word 0xfe4c8000  ! 285: LDSB_R	ldsb	[%r18 + %r0], %r31
	.word 0xfc546017  ! 286: LDSH_I	ldsh	[%r17 + 0x0017], %r30
	.word 0xf20d0000  ! 292: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0x899520eb  ! 296: WRPR_TICK_I	wrpr	%r20, 0x00eb, %tick
	.word 0xfc54e1b2  ! 297: LDSH_I	ldsh	[%r19 + 0x01b2], %r30
	.word 0xfe5da095  ! 305: LDX_I	ldx	[%r22 + 0x0095], %r31
	setx	data_start_7, %g1, %r17
	.word 0xb6b40000  ! 308: SUBCcc_R	orncc 	%r16, %r0, %r27
	.word 0xf71de1ea  ! 310: LDDF_I	ldd	[%r23, 0x01ea], %f27
	.word 0x919421ac  ! 312: WRPR_PIL_I	wrpr	%r16, 0x01ac, %pil
	.word 0xf41c600e  ! 313: LDD_I	ldd	[%r17 + 0x000e], %r26
	.word 0xb1641800  ! 320: MOVcc_R	<illegal instruction>
	.word 0x8195a084  ! 321: WRPR_TPC_I	wrpr	%r22, 0x0084, %tpc
	.word 0xf44d2170  ! 328: LDSB_I	ldsb	[%r20 + 0x0170], %r26
	setx	data_start_7, %g1, %r19
	mov	2, %r12
	.word 0x8f930000  ! 336: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf51da13f  ! 338: LDDF_I	ldd	[%r22, 0x013f], %f26
	.word 0x9194a134  ! 339: WRPR_PIL_I	wrpr	%r18, 0x0134, %pil
	.word 0x819421f5  ! 340: WRPR_TPC_I	wrpr	%r16, 0x01f5, %tpc
	.word 0xbead6032  ! 342: ANDNcc_I	andncc 	%r21, 0x0032, %r31
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 19)
	.word 0xf64da07f  ! 347: LDSB_I	ldsb	[%r22 + 0x007f], %r27
	.word 0xf31d4000  ! 351: LDDF_R	ldd	[%r21, %r0], %f25
	.word 0xf11da10a  ! 354: LDDF_I	ldd	[%r22, 0x010a], %f24
	.word 0xff1de011  ! 357: LDDF_I	ldd	[%r23, 0x0011], %f31
	.word 0x8d95a015  ! 360: WRPR_PSTATE_I	wrpr	%r22, 0x0015, %pstate
	.word 0xb351c000  ! 361: RDPR_TL	<illegal instruction>
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, a)
	.word 0xff1c0000  ! 366: LDDF_R	ldd	[%r16, %r0], %f31
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 13)
	.word 0xb7504000  ! 373: RDPR_TNPC	<illegal instruction>
	.word 0xfa550000  ! 375: LDSH_R	ldsh	[%r20 + %r0], %r29
	.word 0xb5540000  ! 377: RDPR_GL	<illegal instruction>
	.word 0xb5500000  ! 379: RDPR_TPC	<illegal instruction>
	.word 0xb5540000  ! 380: RDPR_GL	<illegal instruction>
	setx	0xe903a8000000e806, %g1, %r10
	.word 0x819a8000  ! 381: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8594208d  ! 382: WRPR_TSTATE_I	wrpr	%r16, 0x008d, %tstate
	.word 0xfc5d8000  ! 385: LDX_R	ldx	[%r22 + %r0], %r30
	.word 0xfd1d4000  ! 386: LDDF_R	ldd	[%r21, %r0], %f30
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 4)
	.word 0xf84d4000  ! 394: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0x8995a07c  ! 395: WRPR_TICK_I	wrpr	%r22, 0x007c, %tick
	.word 0xbc1d61bb  ! 396: XOR_I	xor 	%r21, 0x01bb, %r30
	.word 0xfe0d4000  ! 398: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xb9504000  ! 405: RDPR_TNPC	<illegal instruction>
	.word 0xb7540000  ! 414: RDPR_GL	<illegal instruction>
	.word 0xb17d2401  ! 418: MOVR_I	movre	%r20, 0x1, %r24
	.word 0xf215c000  ! 422: LDUH_R	lduh	[%r23 + %r0], %r25
	.word 0xfa14a192  ! 423: LDUH_I	lduh	[%r18 + 0x0192], %r29
	.word 0xbe94e1b6  ! 426: ORcc_I	orcc 	%r19, 0x01b6, %r31
	.word 0xb2bd8000  ! 430: XNORcc_R	xnorcc 	%r22, %r0, %r25
	.word 0xf845a17f  ! 431: LDSW_I	ldsw	[%r22 + 0x017f], %r28
	.word 0xf80c619c  ! 434: LDUB_I	ldub	[%r17 + 0x019c], %r28
	.word 0x8195607f  ! 442: WRPR_TPC_I	wrpr	%r21, 0x007f, %tpc
	.word 0xf25c20e4  ! 445: LDX_I	ldx	[%r16 + 0x00e4], %r25
	setx	data_start_7, %g1, %r20
	.word 0xf65de0f7  ! 447: LDX_I	ldx	[%r23 + 0x00f7], %r27
	mov	1, %r12
	.word 0xa1930000  ! 448: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf24460b8  ! 449: LDSW_I	ldsw	[%r17 + 0x00b8], %r25
	.word 0x8d9421ce  ! 452: WRPR_PSTATE_I	wrpr	%r16, 0x01ce, %pstate
	.word 0xf01c4000  ! 456: LDD_R	ldd	[%r17 + %r0], %r24
	.word 0xf04de08a  ! 459: LDSB_I	ldsb	[%r23 + 0x008a], %r24
	setx	data_start_5, %g1, %r16
	.word 0xf855200e  ! 466: LDSH_I	ldsh	[%r20 + 0x000e], %r28
	setx	0x738fc6ed0000dd9e, %g1, %r10
	.word 0x839a8000  ! 468: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8594205b  ! 469: WRPR_TSTATE_I	wrpr	%r16, 0x005b, %tstate
	.word 0xf04ca0b5  ! 474: LDSB_I	ldsb	[%r18 + 0x00b5], %r24
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 14)
	.word 0xb535b001  ! 476: SRLX_I	srlx	%r22, 0x0001, %r26
	mov	1, %r12
	.word 0x8f930000  ! 477: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0xc80ada4b0000bd02, %g1, %r10
	.word 0x819a8000  ! 478: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbf500000  ! 480: RDPR_TPC	<illegal instruction>
	setx	0x9eb6207c00003a04, %g1, %r10
	.word 0x839a8000  ! 482: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc0c4000  ! 483: LDUB_R	ldub	[%r17 + %r0], %r30
	.word 0xf20d4000  ! 486: LDUB_R	ldub	[%r21 + %r0], %r25
	.word 0xf40c4000  ! 494: LDUB_R	ldub	[%r17 + %r0], %r26
	setx	data_start_3, %g1, %r19
	.word 0xf045a07c  ! 496: LDSW_I	ldsw	[%r22 + 0x007c], %r24
	.word 0xbd51c000  ! 498: RDPR_TL	rdpr	%tl, %r30
	.word 0xbf518000  ! 502: RDPR_PSTATE	<illegal instruction>
	.word 0xbb510000  ! 505: RDPR_TICK	<illegal instruction>
	.word 0xf6458000  ! 509: LDSW_R	ldsw	[%r22 + %r0], %r27
	.word 0xfb1d4000  ! 510: LDDF_R	ldd	[%r21, %r0], %f29
	setx	0xa8f2502000000dde, %g1, %r10
	.word 0x839a8000  ! 513: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbb520000  ! 514: RDPR_PIL	<illegal instruction>
	.word 0xf24d202a  ! 515: LDSB_I	ldsb	[%r20 + 0x002a], %r25
	.word 0xfe5c0000  ! 516: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0x83952158  ! 520: WRPR_TNPC_I	wrpr	%r20, 0x0158, %tnpc
	.word 0xf00d21c1  ! 522: LDUB_I	ldub	[%r20 + 0x01c1], %r24
	.word 0xfe1dc000  ! 524: LDD_R	ldd	[%r23 + %r0], %r31
	.word 0x8d95a076  ! 527: WRPR_PSTATE_I	wrpr	%r22, 0x0076, %pstate
	.word 0xf05c21e1  ! 530: LDX_I	ldx	[%r16 + 0x01e1], %r24
	.word 0xfa0ca08f  ! 531: LDUB_I	ldub	[%r18 + 0x008f], %r29
	mov	0, %r12
	.word 0xa1930000  ! 533: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf24d4000  ! 534: LDSB_R	ldsb	[%r21 + %r0], %r25
	setx	data_start_4, %g1, %r23
	.word 0xfc0d4000  ! 536: LDUB_R	ldub	[%r21 + %r0], %r30
	.word 0xf014c000  ! 537: LDUH_R	lduh	[%r19 + %r0], %r24
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, 3)
	.word 0xf8040000  ! 540: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xf2440000  ! 541: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0xf21c4000  ! 542: LDD_R	ldd	[%r17 + %r0], %r25
	.word 0xf21c20aa  ! 545: LDD_I	ldd	[%r16 + 0x00aa], %r25
	.word 0xfc0d8000  ! 546: LDUB_R	ldub	[%r22 + %r0], %r30
	setx	data_start_3, %g1, %r16
	.word 0xf65c4000  ! 548: LDX_R	ldx	[%r17 + %r0], %r27
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 15)
	.word 0xf85d2008  ! 551: LDX_I	ldx	[%r20 + 0x0008], %r28
	.word 0x8995a00b  ! 553: WRPR_TICK_I	wrpr	%r22, 0x000b, %tick
	.word 0xf61ce045  ! 554: LDD_I	ldd	[%r19 + 0x0045], %r27
	.word 0xf6040000  ! 561: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xb42ce04a  ! 562: ANDN_I	andn 	%r19, 0x004a, %r26
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf00d20a5  ! 567: LDUB_I	ldub	[%r20 + 0x00a5], %r24
	.word 0xf61d8000  ! 570: LDD_R	ldd	[%r22 + %r0], %r27
	mov	1, %r12
	.word 0x8f930000  ! 572: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf84c4000  ! 575: LDSB_R	ldsb	[%r17 + %r0], %r28
	.word 0xf24c8000  ! 577: LDSB_R	ldsb	[%r18 + %r0], %r25
	.word 0xb2b5c000  ! 582: ORNcc_R	orncc 	%r23, %r0, %r25
	.word 0xf6048000  ! 583: LDUW_R	lduw	[%r18 + %r0], %r27
	.word 0xf61ca153  ! 586: LDD_I	ldd	[%r18 + 0x0153], %r27
	.word 0xb4bc606b  ! 589: XNORcc_I	xnorcc 	%r17, 0x006b, %r26
	.word 0xb6456151  ! 590: ADDC_I	addc 	%r21, 0x0151, %r27
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 21)
	.word 0xb0b50000  ! 601: SUBCcc_R	orncc 	%r20, %r0, %r24
	.word 0xfa4dc000  ! 603: LDSB_R	ldsb	[%r23 + %r0], %r29
	.word 0xfc54a0fd  ! 604: LDSH_I	ldsh	[%r18 + 0x00fd], %r30
	.word 0xf11c4000  ! 614: LDDF_R	ldd	[%r17, %r0], %f24
	.word 0xf05c0000  ! 618: LDX_R	ldx	[%r16 + %r0], %r24
	.word 0x9195e1c2  ! 620: WRPR_PIL_I	wrpr	%r23, 0x01c2, %pil
	.word 0xf00520ec  ! 625: LDUW_I	lduw	[%r20 + 0x00ec], %r24
	.word 0xf254a088  ! 629: LDSH_I	ldsh	[%r18 + 0x0088], %r25
	.word 0xb434a02f  ! 633: SUBC_I	orn 	%r18, 0x002f, %r26
	.word 0xfe1d8000  ! 634: LDD_R	ldd	[%r22 + %r0], %r31
	.word 0xb72dd000  ! 636: SLLX_R	sllx	%r23, %r0, %r27
	.word 0xfd1d4000  ! 638: LDDF_R	ldd	[%r21, %r0], %f30
	.word 0xb4844000  ! 639: ADDcc_R	addcc 	%r17, %r0, %r26
	.word 0xf045a013  ! 641: LDSW_I	ldsw	[%r22 + 0x0013], %r24
	setx	0xc7e178b80000a91a, %g1, %r10
	.word 0x839a8000  ! 645: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf855a183  ! 646: LDSH_I	ldsh	[%r22 + 0x0183], %r28
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 1b)
	.word 0xb9480000  ! 657: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf65ce184  ! 658: LDX_I	ldx	[%r19 + 0x0184], %r27
	.word 0xf04d60f2  ! 661: LDSB_I	ldsb	[%r21 + 0x00f2], %r24
	.word 0xf044e171  ! 662: LDSW_I	ldsw	[%r19 + 0x0171], %r24
	.word 0xfe1c0000  ! 666: LDD_R	ldd	[%r16 + %r0], %r31
	.word 0xf61ce111  ! 667: LDD_I	ldd	[%r19 + 0x0111], %r27
	.word 0xb951c000  ! 668: RDPR_TL	<illegal instruction>
	.word 0x879521fc  ! 672: WRPR_TT_I	wrpr	%r20, 0x01fc, %tt
	.word 0xb7510000  ! 676: RDPR_TICK	<illegal instruction>
	.word 0xfe15e10b  ! 681: LDUH_I	lduh	[%r23 + 0x010b], %r31
	.word 0xf24d210c  ! 683: LDSB_I	ldsb	[%r20 + 0x010c], %r25
	.word 0xba9d0000  ! 686: XORcc_R	xorcc 	%r20, %r0, %r29
	.word 0xb1518000  ! 687: RDPR_PSTATE	<illegal instruction>
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 33)
	.word 0xf4142065  ! 693: LDUH_I	lduh	[%r16 + 0x0065], %r26
	.word 0xf80561aa  ! 695: LDUW_I	lduw	[%r21 + 0x01aa], %r28
	.word 0x8d94207a  ! 697: WRPR_PSTATE_I	wrpr	%r16, 0x007a, %pstate
	.word 0xb3643801  ! 703: MOVcc_I	<illegal instruction>
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 2a)
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, 30)
	.word 0xf0548000  ! 710: LDSH_R	ldsh	[%r18 + %r0], %r24
	.word 0xf64c607f  ! 711: LDSB_I	ldsb	[%r17 + 0x007f], %r27
	.word 0xb43d8000  ! 713: XNOR_R	xnor 	%r22, %r0, %r26
	.word 0xf81d8000  ! 714: LDD_R	ldd	[%r22 + %r0], %r28
	.word 0xf61520ce  ! 715: LDUH_I	lduh	[%r20 + 0x00ce], %r27
	mov	0, %r12
	.word 0x8f930000  ! 716: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8d94a1b2  ! 717: WRPR_PSTATE_I	wrpr	%r18, 0x01b2, %pstate
	.word 0xf21da0fb  ! 719: LDD_I	ldd	[%r22 + 0x00fb], %r25
	.word 0xb09d61e3  ! 720: XORcc_I	xorcc 	%r21, 0x01e3, %r24
	.word 0xf60c6098  ! 721: LDUB_I	ldub	[%r17 + 0x0098], %r27
	.word 0xfe4d4000  ! 722: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xf04dc000  ! 725: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xf60de05c  ! 726: LDUB_I	ldub	[%r23 + 0x005c], %r27
	.word 0xf24d8000  ! 728: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0x8194209b  ! 729: WRPR_TPC_I	wrpr	%r16, 0x009b, %tpc
	setx	0xcc6227a600007bc9, %g1, %r10
	.word 0x819a8000  ! 735: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb500000  ! 739: RDPR_TPC	<illegal instruction>
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 2d)
	setx	data_start_5, %g1, %r16
	.word 0xf11ce12f  ! 743: LDDF_I	ldd	[%r19, 0x012f], %f24
	.word 0xfc456010  ! 744: LDSW_I	ldsw	[%r21 + 0x0010], %r30
	.word 0xf91de06f  ! 746: LDDF_I	ldd	[%r23, 0x006f], %f28
	.word 0x9194615c  ! 747: WRPR_PIL_I	wrpr	%r17, 0x015c, %pil
	.word 0xb62dc000  ! 752: ANDN_R	andn 	%r23, %r0, %r27
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 37)
	.word 0x9194e085  ! 755: WRPR_PIL_I	wrpr	%r19, 0x0085, %pil
	.word 0xfd1d60b7  ! 761: LDDF_I	ldd	[%r21, 0x00b7], %f30
	setx	data_start_2, %g1, %r16
	.word 0xba1d8000  ! 763: XOR_R	xor 	%r22, %r0, %r29
	.word 0xb7510000  ! 764: RDPR_TICK	<illegal instruction>
	.word 0xf2040000  ! 767: LDUW_R	lduw	[%r16 + %r0], %r25
	.word 0xf8458000  ! 770: LDSW_R	ldsw	[%r22 + %r0], %r28
	.word 0xbd50c000  ! 771: RDPR_TT	<illegal instruction>
	.word 0x9195a1c9  ! 772: WRPR_PIL_I	wrpr	%r22, 0x01c9, %pil
	.word 0xbf7c6401  ! 775: MOVR_I	movre	%r17, 0x1, %r31
	.word 0x8195a181  ! 776: WRPR_TPC_I	wrpr	%r22, 0x0181, %tpc
	.word 0xf25cc000  ! 778: LDX_R	ldx	[%r19 + %r0], %r25
	.word 0xfe04a10b  ! 779: LDUW_I	lduw	[%r18 + 0x010b], %r31
	.word 0xb82c4000  ! 780: ANDN_R	andn 	%r17, %r0, %r28
	.word 0xfc5d2104  ! 786: LDX_I	ldx	[%r20 + 0x0104], %r30
	.word 0xfa554000  ! 788: LDSH_R	ldsh	[%r21 + %r0], %r29
	.word 0xbf520000  ! 791: RDPR_PIL	<illegal instruction>
	.word 0xf045a002  ! 792: LDSW_I	ldsw	[%r22 + 0x0002], %r24
	.word 0xb151c000  ! 798: RDPR_TL	<illegal instruction>
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 10)
	.word 0xfa14208a  ! 803: LDUH_I	lduh	[%r16 + 0x008a], %r29
	.word 0xf21ca1b1  ! 804: LDD_I	ldd	[%r18 + 0x01b1], %r25
	.word 0xfa4da0e8  ! 805: LDSB_I	ldsb	[%r22 + 0x00e8], %r29
	.word 0xf20ce1b0  ! 807: LDUB_I	ldub	[%r19 + 0x01b0], %r25
	.word 0x8394e0d1  ! 808: WRPR_TNPC_I	wrpr	%r19, 0x00d1, %tnpc
	.word 0x8794613b  ! 812: WRPR_TT_I	wrpr	%r17, 0x013b, %tt
	.word 0xb3508000  ! 816: RDPR_TSTATE	<illegal instruction>
	setx	data_start_3, %g1, %r18
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 31)
	.word 0xfc542013  ! 821: LDSH_I	ldsh	[%r16 + 0x0013], %r30
	.word 0xfe1dc000  ! 825: LDD_R	ldd	[%r23 + %r0], %r31
	.word 0xbf2d9000  ! 826: SLLX_R	sllx	%r22, %r0, %r31
	.word 0xfa0c8000  ! 827: LDUB_R	ldub	[%r18 + %r0], %r29
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 25)
	.word 0x89942115  ! 830: WRPR_TICK_I	wrpr	%r16, 0x0115, %tick
	.word 0xb1510000  ! 833: RDPR_TICK	rdpr	%tick, %r24
	setx	data_start_7, %g1, %r18
	.word 0x8195e136  ! 836: WRPR_TPC_I	wrpr	%r23, 0x0136, %tpc
	.word 0xb1500000  ! 841: RDPR_TPC	<illegal instruction>
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf24dc000  ! 849: LDSB_R	ldsb	[%r23 + %r0], %r25
	.word 0xf11c2048  ! 851: LDDF_I	ldd	[%r16, 0x0048], %f24
	setx	0x5a4f748e0000f90a, %g1, %r10
	.word 0x839a8000  ! 852: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf85d8000  ! 853: LDX_R	ldx	[%r22 + %r0], %r28
	.word 0xf215c000  ! 854: LDUH_R	lduh	[%r23 + %r0], %r25
	.word 0xb48521e9  ! 856: ADDcc_I	addcc 	%r20, 0x01e9, %r26
	.word 0xfa5da18b  ! 857: LDX_I	ldx	[%r22 + 0x018b], %r29
	.word 0xf40dc000  ! 859: LDUB_R	ldub	[%r23 + %r0], %r26
	.word 0xb6054000  ! 861: ADD_R	add 	%r21, %r0, %r27
	.word 0xb1510000  ! 864: RDPR_TICK	<illegal instruction>
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf11c0000  ! 871: LDDF_R	ldd	[%r16, %r0], %f24
	.word 0xf05ce181  ! 873: LDX_I	ldx	[%r19 + 0x0181], %r24
	mov	0, %r12
	.word 0xa1930000  ! 874: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf854202d  ! 877: LDSH_I	ldsh	[%r16 + 0x002d], %r28
	.word 0x8795605c  ! 878: WRPR_TT_I	wrpr	%r21, 0x005c, %tt
	.word 0xf84ce1d6  ! 880: LDSB_I	ldsb	[%r19 + 0x01d6], %r28
	.word 0xbab4e19a  ! 882: ORNcc_I	orncc 	%r19, 0x019a, %r29
	.word 0xfe5561b3  ! 883: LDSH_I	ldsh	[%r21 + 0x01b3], %r31
	.word 0xf91ca1e6  ! 884: LDDF_I	ldd	[%r18, 0x01e6], %f28
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 2c)
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, b)
	.word 0xfc4cc000  ! 889: LDSB_R	ldsb	[%r19 + %r0], %r30
	setx	data_start_3, %g1, %r23
	.word 0xbd518000  ! 893: RDPR_PSTATE	rdpr	%pstate, %r30
	setx	data_start_1, %g1, %r20
	.word 0xb825c000  ! 907: SUB_R	sub 	%r23, %r0, %r28
	.word 0xf80d4000  ! 910: LDUB_R	ldub	[%r21 + %r0], %r28
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 37)
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, 2c)
	.word 0x87952093  ! 919: WRPR_TT_I	wrpr	%r20, 0x0093, %tt
	setx	0x938ef310000dfc4, %g1, %r10
	.word 0x819a8000  ! 920: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf41421eb  ! 921: LDUH_I	lduh	[%r16 + 0x01eb], %r26
	.word 0xf654a133  ! 922: LDSH_I	ldsh	[%r18 + 0x0133], %r27
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfa454000  ! 927: LDSW_R	ldsw	[%r21 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8194a093  ! 933: WRPR_TPC_I	wrpr	%r18, 0x0093, %tpc
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, 32)
	.word 0xfb1da0a5  ! 937: LDDF_I	ldd	[%r22, 0x00a5], %f29
	.word 0xf204218d  ! 938: LDUW_I	lduw	[%r16 + 0x018d], %r25
	.word 0xf21ce17e  ! 941: LDD_I	ldd	[%r19 + 0x017e], %r25
	.word 0xf205a0a5  ! 943: LDUW_I	lduw	[%r22 + 0x00a5], %r25
	.word 0xbb50c000  ! 944: RDPR_TT	rdpr	%tt, %r29
	mov	1, %r12
	.word 0xa1930000  ! 948: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb8040000  ! 949: ADD_R	add 	%r16, %r0, %r28
	.word 0xfe158000  ! 958: LDUH_R	lduh	[%r22 + %r0], %r31
	.word 0xf855a192  ! 959: LDSH_I	ldsh	[%r22 + 0x0192], %r28
	.word 0xf64ca180  ! 961: LDSB_I	ldsb	[%r18 + 0x0180], %r27
	.word 0xb550c000  ! 965: RDPR_TT	<illegal instruction>
	.word 0xbd34e001  ! 968: SRL_I	srl 	%r19, 0x0001, %r30
	.word 0xb7520000  ! 971: RDPR_PIL	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 975: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbd500000  ! 980: RDPR_TPC	<illegal instruction>
	.word 0xbc1c4000  ! 981: XOR_R	xor 	%r17, %r0, %r30
	.word 0xfe146015  ! 989: LDUH_I	lduh	[%r17 + 0x0015], %r31
	.word 0x89942094  ! 993: WRPR_TICK_I	wrpr	%r16, 0x0094, %tick
	.word 0xfa0dc000  ! 994: LDUB_R	ldub	[%r23 + %r0], %r29
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0x89956122  ! 1: WRPR_TICK_I	wrpr	%r21, 0x0122, %tick
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 2c)
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 10)
	.word 0xb7a90820  ! 12: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb7a00020  ! 13: FMOVs	fmovs	%f0, %f27
	.word 0xb5a00560  ! 14: FSQRTq	fsqrt	
	.word 0xb434a1d1  ! 16: ORN_I	orn 	%r18, 0x01d1, %r26
	.word 0x8195e069  ! 18: WRPR_TPC_I	wrpr	%r23, 0x0069, %tpc
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 30)
	.word 0x8394208b  ! 24: WRPR_TNPC_I	wrpr	%r16, 0x008b, %tnpc
	.word 0xb3a589e0  ! 28: FDIVq	dis not found

	.word 0x8595600a  ! 32: WRPR_TSTATE_I	wrpr	%r21, 0x000a, %tstate
	.word 0xb9ab0820  ! 35: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb950c000  ! 36: RDPR_TT	<illegal instruction>
	.word 0xb3a508c0  ! 37: FSUBd	fsubd	%f20, %f0, %f56
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 34)
	.word 0xb3a509a0  ! 41: FDIVs	fdivs	%f20, %f0, %f25
	.word 0xb5aa8820  ! 45: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xbda4c840  ! 48: FADDd	faddd	%f50, %f0, %f30
	.word 0xbba80420  ! 49: FMOVRZ	dis not found

	.word 0xb1a588c0  ! 52: FSUBd	fsubd	%f22, %f0, %f24
	.word 0xb5aa4820  ! 53: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0x9194e057  ! 55: WRPR_PIL_I	wrpr	%r19, 0x0057, %pil
	mov	1, %r12
	.word 0x8f930000  ! 56: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8195a1a2  ! 59: WRPR_TPC_I	wrpr	%r22, 0x01a2, %tpc
	.word 0xbb504000  ! 61: RDPR_TNPC	<illegal instruction>
	.word 0x8395e153  ! 65: WRPR_TNPC_I	wrpr	%r23, 0x0153, %tnpc
	.word 0xbba98820  ! 69: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xbda488e0  ! 72: FSUBq	dis not found

	.word 0xbda509e0  ! 74: FDIVq	dis not found

hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb9a81c20  ! 82: FMOVRGEZ	dis not found

	.word 0xbd504000  ! 83: RDPR_TNPC	<illegal instruction>
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 32)
	.word 0xb7a54860  ! 86: FADDq	dis not found

	.word 0xbf540000  ! 88: RDPR_GL	<illegal instruction>
	setx	0xa76ff64700003ac9, %g1, %r10
	.word 0x839a8000  ! 91: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb6bc4000  ! 92: XNORcc_R	xnorcc 	%r17, %r0, %r27
	.word 0xb09dc000  ! 93: XORcc_R	xorcc 	%r23, %r0, %r24
	setx	data_start_2, %g1, %r18
	.word 0xbfa00560  ! 96: FSQRTq	fsqrt	
	.word 0x8d94e149  ! 97: WRPR_PSTATE_I	wrpr	%r19, 0x0149, %pstate
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 12)
	.word 0xb9a508e0  ! 106: FSUBq	dis not found

	.word 0xbfa00560  ! 108: FSQRTq	fsqrt	
	.word 0xbd508000  ! 111: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a4c920  ! 112: FMULs	fmuls	%f19, %f0, %f28
	.word 0xbda508c0  ! 113: FSUBd	fsubd	%f20, %f0, %f30
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 14)
	.word 0x899560a1  ! 118: WRPR_TICK_I	wrpr	%r21, 0x00a1, %tick
	setx	0xd770ac0400007913, %g1, %r10
	.word 0x819a8000  ! 126: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9a00560  ! 127: FSQRTq	fsqrt	
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, c)
	.word 0xbb357001  ! 135: SRLX_I	srlx	%r21, 0x0001, %r29
	mov	0, %r12
	.word 0x8f930000  ! 136: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	1, %r12
	.word 0x8f930000  ! 139: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8594a1a9  ! 141: WRPR_TSTATE_I	wrpr	%r18, 0x01a9, %tstate
	.word 0xbd518000  ! 142: RDPR_PSTATE	<illegal instruction>
	.word 0xbba84820  ! 147: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbda449e0  ! 149: FDIVq	dis not found

	.word 0xb5a508c0  ! 150: FSUBd	fsubd	%f20, %f0, %f26
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 13)
	.word 0xbd504000  ! 152: RDPR_TNPC	<illegal instruction>
	.word 0xb951c000  ! 153: RDPR_TL	<illegal instruction>
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 35)
	.word 0x839421e7  ! 156: WRPR_TNPC_I	wrpr	%r16, 0x01e7, %tnpc
	.word 0xbda80c20  ! 157: FMOVRLZ	dis not found

	.word 0xbfa48920  ! 158: FMULs	fmuls	%f18, %f0, %f31
	mov	2, %r12
	.word 0xa1930000  ! 162: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5a81c20  ! 163: FMOVRGEZ	dis not found

hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbba48820  ! 167: FADDs	fadds	%f18, %f0, %f29
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 26)
	setx	data_start_6, %g1, %r19
	.word 0xb5a5c8e0  ! 171: FSUBq	dis not found

	.word 0xbd3d0000  ! 172: SRA_R	sra 	%r20, %r0, %r30
	.word 0xb33d5000  ! 174: SRAX_R	srax	%r21, %r0, %r25
	.word 0xbc1d8000  ! 175: XOR_R	xor 	%r22, %r0, %r30
	.word 0xb5a4c840  ! 178: FADDd	faddd	%f50, %f0, %f26
	.word 0xb3641800  ! 183: MOVcc_R	<illegal instruction>
	.word 0xbba98820  ! 184: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb5480000  ! 185: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb7a48840  ! 186: FADDd	faddd	%f18, %f0, %f58
	.word 0xb9a80420  ! 193: FMOVRZ	dis not found

	setx	0x14eafe4b0000ae56, %g1, %r10
	.word 0x819a8000  ! 194: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5aa0820  ! 195: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb1a4c8a0  ! 197: FSUBs	fsubs	%f19, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba00540  ! 199: FSQRTd	fsqrt	
	.word 0x83942136  ! 204: WRPR_TNPC_I	wrpr	%r16, 0x0136, %tnpc
	.word 0x8195e0ec  ! 205: WRPR_TPC_I	wrpr	%r23, 0x00ec, %tpc
	.word 0xb21c4000  ! 206: XOR_R	xor 	%r17, %r0, %r25
	.word 0xbb51c000  ! 207: RDPR_TL	<illegal instruction>
	.word 0xb2050000  ! 208: ADD_R	add 	%r20, %r0, %r25
	setx	data_start_5, %g1, %r21
	.word 0xbbaa0820  ! 215: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb5349000  ! 216: SRLX_R	srlx	%r18, %r0, %r26
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 24)
	mov	2, %r12
	.word 0x8f930000  ! 220: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8795202c  ! 227: WRPR_TT_I	wrpr	%r20, 0x002c, %tt
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba40860  ! 230: FADDq	dis not found

	.word 0x8d95611a  ! 232: WRPR_PSTATE_I	wrpr	%r21, 0x011a, %pstate
	.word 0xbfa4c860  ! 235: FADDq	dis not found

	.word 0xb1abc820  ! 236: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb1a50860  ! 237: FADDq	dis not found

	.word 0xbda548c0  ! 240: FSUBd	fsubd	%f52, %f0, %f30
	setx	data_start_4, %g1, %r16
	.word 0xb085a073  ! 247: ADDcc_I	addcc 	%r22, 0x0073, %r24
	setx	data_start_4, %g1, %r22
	.word 0xbbab0820  ! 256: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbbaa8820  ! 260: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb7a448a0  ! 261: FSUBs	fsubs	%f17, %f0, %f27
	.word 0xbda508a0  ! 262: FSUBs	fsubs	%f20, %f0, %f30
	setx	0x7fe7b3f400002f45, %g1, %r10
	.word 0x819a8000  ! 263: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbba548e0  ! 266: FSUBq	dis not found

	.word 0xb9a81c20  ! 267: FMOVRGEZ	dis not found

	.word 0xb7a00520  ! 268: FSQRTs	fsqrt	
	.word 0xb3a00520  ! 279: FSQRTs	fsqrt	
	.word 0xbda80820  ! 280: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbda00020  ! 283: FMOVs	fmovs	%f0, %f30
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbfa409a0  ! 287: FDIVs	fdivs	%f16, %f0, %f31
	.word 0xb3a00540  ! 294: FSQRTd	fsqrt	
	.word 0xbdaa0820  ! 295: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0x8994218f  ! 296: WRPR_TICK_I	wrpr	%r16, 0x018f, %tick
	.word 0xb9aa4820  ! 301: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb9a84820  ! 302: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb3a54860  ! 303: FADDq	dis not found

	setx	data_start_1, %g1, %r16
	.word 0xbeb48000  ! 308: SUBCcc_R	orncc 	%r18, %r0, %r31
	.word 0xb9a81420  ! 309: FMOVRNZ	dis not found

	.word 0x9194603d  ! 312: WRPR_PIL_I	wrpr	%r17, 0x003d, %pil
	.word 0xbfa448e0  ! 316: FSUBq	dis not found

	.word 0xb9aa4820  ! 317: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xbfa80820  ! 319: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xbb641800  ! 320: MOVcc_R	<illegal instruction>
	.word 0x81952098  ! 321: WRPR_TPC_I	wrpr	%r20, 0x0098, %tpc
	.word 0xbfa94820  ! 322: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbfabc820  ! 329: FMOVVC	fmovs	%fcc1, %f0, %f31
	setx	data_start_3, %g1, %r23
	mov	2, %r12
	.word 0x8f930000  ! 336: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x9195a0f2  ! 339: WRPR_PIL_I	wrpr	%r22, 0x00f2, %pil
	.word 0x8195a09b  ! 340: WRPR_TPC_I	wrpr	%r22, 0x009b, %tpc
	.word 0xb2ada15a  ! 342: ANDNcc_I	andncc 	%r22, 0x015a, %r25
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 19)
	.word 0xb5aac820  ! 346: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xbfa48820  ! 349: FADDs	fadds	%f18, %f0, %f31
	.word 0xbba508a0  ! 350: FSUBs	fsubs	%f20, %f0, %f29
	.word 0xb3a00560  ! 355: FSQRTq	fsqrt	
	.word 0xb7a409e0  ! 356: FDIVq	dis not found

	.word 0xb7a409a0  ! 359: FDIVs	fdivs	%f16, %f0, %f27
	.word 0x8d95a11d  ! 360: WRPR_PSTATE_I	wrpr	%r22, 0x011d, %pstate
	.word 0xb351c000  ! 361: RDPR_TL	<illegal instruction>
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbda90820  ! 365: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbfa44860  ! 369: FADDq	dis not found

hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 22)
	.word 0xbf504000  ! 373: RDPR_TNPC	<illegal instruction>
	.word 0xbd540000  ! 377: RDPR_GL	<illegal instruction>
	.word 0xb1500000  ! 379: RDPR_TPC	<illegal instruction>
	.word 0xb1540000  ! 380: RDPR_GL	<illegal instruction>
	setx	0x447f5f690000fd4f, %g1, %r10
	.word 0x819a8000  ! 381: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8594e0c6  ! 382: WRPR_TSTATE_I	wrpr	%r19, 0x00c6, %tstate
	.word 0xb9a58940  ! 384: FMULd	fmuld	%f22, %f0, %f28
	.word 0xb7a508a0  ! 391: FSUBs	fsubs	%f20, %f0, %f27
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 9)
	.word 0x8994e0e0  ! 395: WRPR_TICK_I	wrpr	%r19, 0x00e0, %tick
	.word 0xb41ce192  ! 396: XOR_I	xor 	%r19, 0x0192, %r26
	.word 0xbfaa0820  ! 397: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbbaac820  ! 400: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb5504000  ! 405: RDPR_TNPC	<illegal instruction>
	.word 0xb3a81c20  ! 407: FMOVRGEZ	dis not found

	.word 0xb7a81c20  ! 408: FMOVRGEZ	dis not found

	.word 0xb1540000  ! 414: RDPR_GL	<illegal instruction>
	.word 0xb7a9c820  ! 416: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbb7d2401  ! 418: MOVR_I	movre	%r20, 0x1, %r29
	.word 0xb9a4c960  ! 419: FMULq	dis not found

	.word 0xb9aa8820  ! 425: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb295e1f0  ! 426: ORcc_I	orcc 	%r23, 0x01f0, %r25
	.word 0xb9a54820  ! 427: FADDs	fadds	%f21, %f0, %f28
	.word 0xb5a8c820  ! 428: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb7a5c9e0  ! 429: FDIVq	dis not found

	.word 0xb6bdc000  ! 430: XNORcc_R	xnorcc 	%r23, %r0, %r27
	.word 0xb1a44960  ! 432: FMULq	dis not found

	.word 0xb1a44920  ! 436: FMULs	fmuls	%f17, %f0, %f24
	.word 0xbbab4820  ! 437: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb7a90820  ! 441: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0x81952117  ! 442: WRPR_TPC_I	wrpr	%r20, 0x0117, %tpc
	setx	data_start_7, %g1, %r21
	mov	1, %r12
	.word 0xa1930000  ! 448: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9a549e0  ! 450: FDIVq	dis not found

	.word 0x8d94e12b  ! 452: WRPR_PSTATE_I	wrpr	%r19, 0x012b, %pstate
	.word 0xbda00020  ! 454: FMOVs	fmovs	%f0, %f30
	.word 0xbba00040  ! 458: FMOVd	fmovd	%f0, %f60
	.word 0xb3a80420  ! 462: FMOVRZ	dis not found

	setx	data_start_1, %g1, %r22
	.word 0xbba58860  ! 465: FADDq	dis not found

	setx	0xb7f33ddc00006dd7, %g1, %r10
	.word 0x839a8000  ! 468: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8595e192  ! 469: WRPR_TSTATE_I	wrpr	%r23, 0x0192, %tstate
	.word 0xb7a00020  ! 470: FMOVs	fmovs	%f0, %f27
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, c)
	.word 0xb5353001  ! 476: SRLX_I	srlx	%r20, 0x0001, %r26
	mov	2, %r12
	.word 0x8f930000  ! 477: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0xe9cc621700001dd7, %g1, %r10
	.word 0x819a8000  ! 478: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3aa4820  ! 479: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb1500000  ! 480: RDPR_TPC	<illegal instruction>
	setx	0xfc659e0000002ddf, %g1, %r10
	.word 0x839a8000  ! 482: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7a80420  ! 484: FMOVRZ	dis not found

	.word 0xbfa00560  ! 487: FSQRTq	fsqrt	
	.word 0xb9abc820  ! 492: FMOVVC	fmovs	%fcc1, %f0, %f28
	setx	data_start_7, %g1, %r18
	.word 0xb151c000  ! 498: RDPR_TL	<illegal instruction>
	.word 0xb3a54940  ! 500: FMULd	fmuld	%f52, %f0, %f56
	.word 0xbd518000  ! 502: RDPR_PSTATE	<illegal instruction>
	.word 0xb5510000  ! 505: RDPR_TICK	<illegal instruction>
	.word 0xb1a5c820  ! 506: FADDs	fadds	%f23, %f0, %f24
	setx	0x2c87053f00009d00, %g1, %r10
	.word 0x839a8000  ! 513: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd520000  ! 514: RDPR_PIL	<illegal instruction>
	.word 0x8395e12d  ! 520: WRPR_TNPC_I	wrpr	%r23, 0x012d, %tnpc
	.word 0xb9a40840  ! 523: FADDd	faddd	%f16, %f0, %f28
	.word 0xbfa00560  ! 525: FSQRTq	fsqrt	
	.word 0x8d9460df  ! 527: WRPR_PSTATE_I	wrpr	%r17, 0x00df, %pstate
	mov	0, %r12
	.word 0xa1930000  ! 533: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_5, %g1, %r19
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 14)
	.word 0xb7a81c20  ! 544: FMOVRGEZ	dis not found

	setx	data_start_6, %g1, %r17
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 7)
	.word 0x8995a027  ! 553: WRPR_TICK_I	wrpr	%r22, 0x0027, %tick
	.word 0xb1a58820  ! 558: FADDs	fadds	%f22, %f0, %f24
	.word 0xbda58860  ! 560: FADDq	dis not found

	.word 0xbe2ca1e4  ! 562: ANDN_I	andn 	%r18, 0x01e4, %r31
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, a)
	mov	1, %r12
	.word 0x8f930000  ! 572: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfa58920  ! 576: FMULs	fmuls	%f22, %f0, %f31
	.word 0xb7a00520  ! 578: FSQRTs	fsqrt	
	.word 0xb5a94820  ! 580: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb4b50000  ! 582: ORNcc_R	orncc 	%r20, %r0, %r26
	.word 0xb1aa4820  ! 585: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xbebd61d1  ! 589: XNORcc_I	xnorcc 	%r21, 0x01d1, %r31
	.word 0xb044e1cb  ! 590: ADDC_I	addc 	%r19, 0x01cb, %r24
	.word 0xb3a549e0  ! 594: FDIVq	dis not found

	.word 0xbda00540  ! 595: FSQRTd	fsqrt	
	.word 0xb9a98820  ! 596: FMOVNEG	fmovs	%fcc1, %f0, %f28
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 23)
	.word 0xb9a588c0  ! 600: FSUBd	fsubd	%f22, %f0, %f28
	.word 0xb6b5c000  ! 601: SUBCcc_R	orncc 	%r23, %r0, %r27
	.word 0xb3ab0820  ! 606: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb3aac820  ! 608: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb9a00540  ! 609: FSQRTd	fsqrt	
	.word 0xbfa94820  ! 610: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbfa84820  ! 611: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb9a449a0  ! 612: FDIVs	fdivs	%f17, %f0, %f28
	.word 0x9195218e  ! 620: WRPR_PIL_I	wrpr	%r20, 0x018e, %pil
	.word 0xbdaa0820  ! 630: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xba3561e0  ! 633: SUBC_I	orn 	%r21, 0x01e0, %r29
	.word 0xb7a80820  ! 635: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb52c5000  ! 636: SLLX_R	sllx	%r17, %r0, %r26
	.word 0xb4854000  ! 639: ADDcc_R	addcc 	%r21, %r0, %r26
	.word 0xbda94820  ! 642: FMOVCS	fmovs	%fcc1, %f0, %f30
	setx	0xe609be4900006d8b, %g1, %r10
	.word 0x839a8000  ! 645: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	data_start_7, %g1, %r23
	.word 0xb5a40820  ! 649: FADDs	fadds	%f16, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 23)
	.word 0xbba409e0  ! 654: FDIVq	dis not found

	.word 0xbfa94820  ! 655: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb1a5c8c0  ! 656: FSUBd	fsubd	%f54, %f0, %f24
	.word 0xb7480000  ! 657: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb9a449a0  ! 660: FDIVs	fdivs	%f17, %f0, %f28
	.word 0xb3aa4820  ! 663: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb151c000  ! 668: RDPR_TL	<illegal instruction>
	.word 0x8795a14e  ! 672: WRPR_TT_I	wrpr	%r22, 0x014e, %tt
	.word 0xb5a5c9a0  ! 673: FDIVs	fdivs	%f23, %f0, %f26
	.word 0xb3510000  ! 676: RDPR_TICK	<illegal instruction>
	.word 0xb3a549c0  ! 680: FDIVd	fdivd	%f52, %f0, %f56
	.word 0xb7a409a0  ! 682: FDIVs	fdivs	%f16, %f0, %f27
	.word 0xb3a50920  ! 684: FMULs	fmuls	%f20, %f0, %f25
	.word 0xb9a81c20  ! 685: FMOVRGEZ	dis not found

	.word 0xb49c8000  ! 686: XORcc_R	xorcc 	%r18, %r0, %r26
	.word 0xb1518000  ! 687: RDPR_PSTATE	<illegal instruction>
	.word 0xbba5c820  ! 688: FADDs	fadds	%f23, %f0, %f29
	.word 0xb7a81820  ! 689: FMOVRGZ	fmovs	%fcc3, %f0, %f27
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, 16)
	.word 0x8d95e0d5  ! 697: WRPR_PSTATE_I	wrpr	%r23, 0x00d5, %pstate
	.word 0xb5a449c0  ! 700: FDIVd	fdivd	%f48, %f0, %f26
	.word 0xbf643801  ! 703: MOVcc_I	<illegal instruction>
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 7)
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 13)
	.word 0xbda9c820  ! 708: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xbfa508c0  ! 709: FSUBd	fsubd	%f20, %f0, %f62
	.word 0xbe3cc000  ! 713: XNOR_R	xnor 	%r19, %r0, %r31
	mov	1, %r12
	.word 0x8f930000  ! 716: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8d95e1ba  ! 717: WRPR_PSTATE_I	wrpr	%r23, 0x01ba, %pstate
	.word 0xb29c61f8  ! 720: XORcc_I	xorcc 	%r17, 0x01f8, %r25
	.word 0xb7a00040  ! 723: FMOVd	fmovd	%f0, %f58
	.word 0x819560cd  ! 729: WRPR_TPC_I	wrpr	%r21, 0x00cd, %tpc
	.word 0xbba00540  ! 733: FSQRTd	fsqrt	
	.word 0xb9a449c0  ! 734: FDIVd	fdivd	%f48, %f0, %f28
	setx	0xd1939ee80000efc5, %g1, %r10
	.word 0x819a8000  ! 735: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7500000  ! 739: RDPR_TPC	<illegal instruction>
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 23)
	setx	data_start_3, %g1, %r19
	.word 0x9195a064  ! 747: WRPR_PIL_I	wrpr	%r22, 0x0064, %pil
	.word 0xb22d4000  ! 752: ANDN_R	andn 	%r21, %r0, %r25
	.word 0xbfa00540  ! 753: FSQRTd	fsqrt	
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 9)
	.word 0x91942090  ! 755: WRPR_PIL_I	wrpr	%r16, 0x0090, %pil
	.word 0xb7ab4820  ! 758: FMOVCC	fmovs	%fcc1, %f0, %f27
	setx	data_start_6, %g1, %r19
	.word 0xb81c4000  ! 763: XOR_R	xor 	%r17, %r0, %r28
	.word 0xbf510000  ! 764: RDPR_TICK	<illegal instruction>
	.word 0xb9a00540  ! 765: FSQRTd	fsqrt	
	.word 0xbb50c000  ! 771: RDPR_TT	<illegal instruction>
	.word 0x9194a128  ! 772: WRPR_PIL_I	wrpr	%r18, 0x0128, %pil
	.word 0xb7abc820  ! 774: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbd7ce401  ! 775: MOVR_I	movre	%r19, 0x1, %r30
	.word 0x8195e038  ! 776: WRPR_TPC_I	wrpr	%r23, 0x0038, %tpc
	.word 0xb82c4000  ! 780: ANDN_R	andn 	%r17, %r0, %r28
	.word 0xb3a00540  ! 783: FSQRTd	fsqrt	
	.word 0xb1aa8820  ! 784: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb3520000  ! 791: RDPR_PIL	<illegal instruction>
	.word 0xb5a00560  ! 793: FSQRTq	fsqrt	
	.word 0xb351c000  ! 798: RDPR_TL	<illegal instruction>
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 34)
	.word 0xbba449c0  ! 806: FDIVd	fdivd	%f48, %f0, %f60
	.word 0x839560aa  ! 808: WRPR_TNPC_I	wrpr	%r21, 0x00aa, %tnpc
	.word 0x879421bc  ! 812: WRPR_TT_I	wrpr	%r16, 0x01bc, %tt
	.word 0xb1a00560  ! 815: FSQRTq	fsqrt	
	.word 0xb3508000  ! 816: RDPR_TSTATE	<illegal instruction>
	setx	data_start_4, %g1, %r21
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb3aa0820  ! 820: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb1a81c20  ! 822: FMOVRGEZ	dis not found

	.word 0xb92c9000  ! 826: SLLX_R	sllx	%r18, %r0, %r28
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 16)
	.word 0xbfa4c860  ! 829: FADDq	dis not found

	.word 0x8995619e  ! 830: WRPR_TICK_I	wrpr	%r21, 0x019e, %tick
	.word 0xb3a00040  ! 831: FMOVd	fmovd	%f0, %f56
	.word 0xb3a50960  ! 832: FMULq	dis not found

	.word 0xb5510000  ! 833: RDPR_TICK	<illegal instruction>
	setx	data_start_7, %g1, %r23
	.word 0xbbabc820  ! 835: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0x819461ff  ! 836: WRPR_TPC_I	wrpr	%r17, 0x01ff, %tpc
	.word 0xbba80c20  ! 837: FMOVRLZ	dis not found

	.word 0xb1a488e0  ! 839: FSUBq	dis not found

	.word 0xb1500000  ! 841: RDPR_TPC	<illegal instruction>
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 10)
	.word 0xbba509c0  ! 844: FDIVd	fdivd	%f20, %f0, %f60
	.word 0xbba80820  ! 847: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xbda00520  ! 848: FSQRTs	fsqrt	
	.word 0xb9a4c9a0  ! 850: FDIVs	fdivs	%f19, %f0, %f28
	setx	0xd434e4ea00009b02, %g1, %r10
	.word 0x839a8000  ! 852: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbba88820  ! 855: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb085e152  ! 856: ADDcc_I	addcc 	%r23, 0x0152, %r24
	.word 0xbe050000  ! 861: ADD_R	add 	%r20, %r0, %r31
	.word 0xbda90820  ! 862: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb5510000  ! 864: RDPR_TICK	<illegal instruction>
	.word 0xbfa408a0  ! 865: FSUBs	fsubs	%f16, %f0, %f31
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 14)
	.word 0xb3a00040  ! 869: FMOVd	fmovd	%f0, %f56
	mov	2, %r12
	.word 0xa1930000  ! 874: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8795e1d3  ! 878: WRPR_TT_I	wrpr	%r23, 0x01d3, %tt
	.word 0xb8b4a0c8  ! 882: ORNcc_I	orncc 	%r18, 0x00c8, %r28
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 1a)
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, b)
	setx	data_start_4, %g1, %r20
	.word 0xb1518000  ! 893: RDPR_PSTATE	<illegal instruction>
	.word 0xb5a4c820  ! 895: FADDs	fadds	%f19, %f0, %f26
	setx	data_start_7, %g1, %r21
	.word 0xbba00540  ! 900: FSQRTd	fsqrt	
	.word 0xbc25c000  ! 907: SUB_R	sub 	%r23, %r0, %r30
	.word 0xbfa00540  ! 911: FSQRTd	fsqrt	
	.word 0xb9a4c9a0  ! 912: FDIVs	fdivs	%f19, %f0, %f28
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, 3b)
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 17)
	.word 0x87952054  ! 919: WRPR_TT_I	wrpr	%r20, 0x0054, %tt
	setx	0xc217f4d4000078d1, %g1, %r10
	.word 0x819a8000  ! 920: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 1f)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbdaa4820  ! 931: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xbba80820  ! 932: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0x8195e0d4  ! 933: WRPR_TPC_I	wrpr	%r23, 0x00d4, %tpc
	.word 0xb3abc820  ! 934: FMOVVC	fmovs	%fcc1, %f0, %f25
hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, 6)
	.word 0xb5a408a0  ! 939: FSUBs	fsubs	%f16, %f0, %f26
	.word 0xb150c000  ! 944: RDPR_TT	<illegal instruction>
	.word 0xbfabc820  ! 946: FMOVVC	fmovs	%fcc1, %f0, %f31
	mov	1, %r12
	.word 0xa1930000  ! 948: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb8050000  ! 949: ADD_R	add 	%r20, %r0, %r28
	.word 0xb7a5c860  ! 950: FADDq	dis not found

	.word 0xb3a80420  ! 951: FMOVRZ	dis not found

	.word 0xbda548a0  ! 953: FSUBs	fsubs	%f21, %f0, %f30
	.word 0xbfa5c860  ! 954: FADDq	dis not found

	.word 0xb7a448a0  ! 957: FSUBs	fsubs	%f17, %f0, %f27
	.word 0xbdaa8820  ! 960: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb550c000  ! 965: RDPR_TT	<illegal instruction>
	.word 0xb5a00040  ! 966: FMOVd	fmovd	%f0, %f26
	.word 0xb7ab4820  ! 967: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xbd346001  ! 968: SRL_I	srl 	%r17, 0x0001, %r30
	.word 0xb5a98820  ! 969: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb3520000  ! 971: RDPR_PIL	<illegal instruction>
	.word 0xb1a80820  ! 974: FMOVN	fmovs	%fcc1, %f0, %f24
	mov	2, %r12
	.word 0xa1930000  ! 975: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbf500000  ! 980: RDPR_TPC	<illegal instruction>
	.word 0xb81c0000  ! 981: XOR_R	xor 	%r16, %r0, %r28
	.word 0xb3a5c920  ! 984: FMULs	fmuls	%f23, %f0, %f25
	.word 0xb7aac820  ! 988: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0x899420be  ! 993: WRPR_TICK_I	wrpr	%r16, 0x00be, %tick
	.word 0xb1a00040  ! 996: FMOVd	fmovd	%f0, %f24
	.word 0xb7a549e0  ! 998: FDIVq	dis not found


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

	.xword	0xc136e7e8470c221f
	.xword	0x61fef4952cfff000
	.xword	0xeb4c4c81c4b3cbf3
	.xword	0x003f84dc71839a09
	.xword	0xe23539efad2b45e5
	.xword	0xdbb16338163508f6
	.xword	0x9a03994918ee5b57
	.xword	0x1a450ea5da770297
	.xword	0xb177c7e1e991200d
	.xword	0xf5c452256e179606
	.xword	0x88296cb7e76cedf3
	.xword	0x59b73e4be9f330a7
	.xword	0xdcb2a12ef3dcb6cd
	.xword	0xd28dd35499cdae75
	.xword	0xd78f48f417924ec3
	.xword	0x34ef92639697e8ba
	.xword	0x0555e099283a83e0
	.xword	0xf72b1581a73c4b97
	.xword	0xcdee06d2becafd87
	.xword	0x8d1c4a2516ab47d2
	.xword	0x3b9a45ab88e87c6f
	.xword	0x7bd0fecde596f16a
	.xword	0xee9be6be51f24263
	.xword	0x3ba9bb1d2de5c239
	.xword	0x3030f526e8c7769a
	.xword	0x932ceb859070e706
	.xword	0x06a42ef4e16650bc
	.xword	0x69d72e677866373d
	.xword	0xd17af77e5f7e885f
	.xword	0x77d639579da59a19
	.xword	0xd8cc149f597dd614
	.xword	0xa26b500bda2367f2
	.xword	0x3806d52bda625106
	.xword	0x27cd7a9d90bb22f2
	.xword	0x3a6948af06b205ab
	.xword	0xfb3bf51293b72540
	.xword	0x449b8b5b901a5c8a
	.xword	0x437a1ffa88cfca9d
	.xword	0xed029796b7ed9d4a
	.xword	0xd7ae6e3c2c057f2c
	.xword	0x14e1f35282db9a97
	.xword	0xa229060ee594fba8
	.xword	0x50dff450863d687e
	.xword	0xd64365599b179cff
	.xword	0x00a7a1b476349936
	.xword	0xe9e956da1f99358f
	.xword	0xe852ad0b31cedc32
	.xword	0xd4677d3197f714e4
	.xword	0xf65fdd37a5bc9a37
	.xword	0x066866c954ef28e0
	.xword	0x10a8b8b1b5469e36
	.xword	0x977a93631d042153
	.xword	0x5deecb635d01e8be
	.xword	0x71bb55c15162e22d
	.xword	0x08fa662672fa44f1
	.xword	0xe5ae8400c57ab3b4
	.xword	0xad10da3d35e3b2a1
	.xword	0x59747be9360b8911
	.xword	0x12a62f5909f79cc8
	.xword	0x7cb1feb3c17b00be
	.xword	0x44f4d99952f0dc0d
	.xword	0x7af0d95358290740
	.xword	0x9688e1c4e91e82d3
	.xword	0x446e40b6d691ab88
	.xword	0xe7fe95c5fe6dac18
	.xword	0x50908aa86a6bae3b
	.xword	0xdcb0544a5300014a
	.xword	0x205f7cba81f4feb1
	.xword	0xeec505da856b3e2a
	.xword	0x0fc5340021aa89ab
	.xword	0x2d893f3190a39c10
	.xword	0x9534bfa10572075e
	.xword	0xe79d76fd6ed6906c
	.xword	0x32e571374b562c5f
	.xword	0xd3007c32bdb0ad3d
	.xword	0x186dc0b66f48ef1f
	.xword	0x46ac275c09a36450
	.xword	0x3e0a1996fd055a7a
	.xword	0xba947f74a19f5815
	.xword	0xfd62191f13847fb0
	.xword	0x45d586ee084b802c
	.xword	0xc44464e08bfc4b26
	.xword	0x9a6bb928035aa1e6
	.xword	0xac41c70d1ccf3e86
	.xword	0x6d9469e55783ae61
	.xword	0xe2109dca82a323ce
	.xword	0x90f22cd71036489a
	.xword	0x5acd99a56762396f
	.xword	0x0499845dd9287f63
	.xword	0xe82ce1aee889a052
	.xword	0xbf9480832c7aaf69
	.xword	0xb73e64df0acfa87a
	.xword	0x44ab6abc4f884856
	.xword	0xf57a0e9a17449f6d
	.xword	0x9f947ac833a4aa9c
	.xword	0x0f9ff0c1f4786025
	.xword	0x3aa9d6a4aa2e659d
	.xword	0x82fec60a1a54213d
	.xword	0x50fecef364ff4106
	.xword	0x8326c95bd2fbddc1
	.xword	0xa6b3668b8e7748bb
	.xword	0x591c96feb485a07c
	.xword	0x70369d76681ed61c
	.xword	0x6fe53a7f35926da9
	.xword	0x74b0f1090a908ae5
	.xword	0x1521906754d80bb0
	.xword	0xdef96f6effc39b56
	.xword	0xb3de7fa031264208
	.xword	0xc45c198a748b4f08
	.xword	0xcd87cab6968be86a
	.xword	0xa187db5d415d5402
	.xword	0xc996de7707d21225
	.xword	0xcb8b98f09a9b3254
	.xword	0x03eff3860191ce70
	.xword	0xd697a5924362014e
	.xword	0x553968a5aa596f12
	.xword	0x832cb8d47f87a161
	.xword	0xca73675374710513
	.xword	0xdd600beac46c5bb9
	.xword	0xf0225aac3ea81d57
	.xword	0x19b51210671ac47f
	.xword	0xd33e717510e9fd69
	.xword	0xaa5a41b03c05f146
	.xword	0x14952fed644786a9
	.xword	0x7bec9f331ed870a4
	.xword	0xfbdae437e27d0c6f
	.xword	0xacfea0e7b0cb5562
	.xword	0xe7af743f1dd0a552
	.xword	0xfd03688a2e3e013e
	.xword	0x0a7ea95129916854
	.xword	0x45f1285c304933cd
	.xword	0xd87a19297ed60e40
	.xword	0x2d895bbc9627c2a4
	.xword	0x07b0deb904cf092c
	.xword	0x566b6102a1406d32
	.xword	0x90227ff09476ef57
	.xword	0x1744e5d273627f87
	.xword	0x952fd6954f245f0d
	.xword	0xb056e7a3ec2a77c8
	.xword	0x2d4a3a65ebf9b5e5
	.xword	0x636216a041c2a609
	.xword	0x0ad5a553610337b9
	.xword	0xb73bf69c28e9bc56
	.xword	0x96a47f28e0633e57
	.xword	0x8235ceb704318fb2
	.xword	0x07296d762cbbfa7e
	.xword	0xf77ce4f4a3b25297
	.xword	0x6b3edbd6a4319d9c
	.xword	0xc65e166fcd5a16ad
	.xword	0xc3787fb92ecee6c6
	.xword	0x4e9569d4204bd8c5
	.xword	0x854c3b854dc7a8f6
	.xword	0xcacf22acfbb3558a
	.xword	0x3543e64b95d1e097
	.xword	0xd1b556bfbdd2a814
	.xword	0xbe5e2a1377192ee7
	.xword	0x2ba2352ca31308a3
	.xword	0xe8841e64f7f66c04
	.xword	0xa5b0636c142b3154
	.xword	0x7c79046650cfaa38
	.xword	0x55e558eda243ed93
	.xword	0x3cdcf3d08525c5dd
	.xword	0xc75bac3cb337d691
	.xword	0x29108b9db6f8eb3d
	.xword	0xb13dad62a3614c66
	.xword	0x759e589620edc33d
	.xword	0x2754a8a7fd9f02f6
	.xword	0xa9f19ffdc28f8314
	.xword	0x620506ef36d036a1
	.xword	0x7bb2d3ff005c8607
	.xword	0xb0cbe0d5a66458e6
	.xword	0x142cb9a6227f688c
	.xword	0xd4f9cad792952748
	.xword	0x0ad22fd858b6c97e
	.xword	0xbda4bd93913748b5
	.xword	0x5a70aefb25fe54dc
	.xword	0x9d61ffb24c896953
	.xword	0x39d47a9acbdaa1b6
	.xword	0xa2781137331e0e11
	.xword	0xa06c4fad760eb725
	.xword	0x67ec6c10491c3737
	.xword	0x4481a4e0fb388be9
	.xword	0x83bf3999de905a40
	.xword	0x322c0d530a53bd0e
	.xword	0xbd13ce41c2c3009b
	.xword	0xec13531a527c091d
	.xword	0xee0b281ff9d2fd8e
	.xword	0x8df65e4a310d1549
	.xword	0x67144e364142df7a
	.xword	0x4b1a240f7b230ee9
	.xword	0x37d7b5b197421dad
	.xword	0xe9612694a9f811aa
	.xword	0x713cb5f9f8575f99
	.xword	0xf719dcc008cbfa43
	.xword	0xd46a5d0552665b4c
	.xword	0x879b0a49063570ce
	.xword	0x1928ceb23e42e69d
	.xword	0xfa38fe0978e22b19
	.xword	0xccbe05071d06901b
	.xword	0x34c173127247970a
	.xword	0x797816f6c4e3b9fe
	.xword	0x98d4691ae06cb706
	.xword	0x473fa4f6e8c10230
	.xword	0x75cb0afef12bdc37
	.xword	0x863c58640c978f67
	.xword	0x047e1021035310f3
	.xword	0x066ef6f82a1725a7
	.xword	0x8249ed263c79c29f
	.xword	0xde96b832d9fdcd6d
	.xword	0xe8052597735679a9
	.xword	0xf9629effac90a36b
	.xword	0x2f7ae24ece0a8956
	.xword	0x4b22eca32619d5d2
	.xword	0xd3ec7cf60326ec30
	.xword	0xcf169a16f291a992
	.xword	0x3758d0be78398b26
	.xword	0xe688d125c3e9faa3
	.xword	0xc9ef66754f19612d
	.xword	0xc26959521fe1a58d
	.xword	0x502a114233607eda
	.xword	0x67afc988f083f83a
	.xword	0x5b31644680beddfb
	.xword	0xf74610172024ccc7
	.xword	0x9e62a1197662cee3
	.xword	0x4f0fe086d795f762
	.xword	0xb2e8e4d275ab79c5
	.xword	0xb994ef80c56f431e
	.xword	0xfb9b2882b963daf8
	.xword	0x3a23c6948ddf0978
	.xword	0x41fe14c876cb1451
	.xword	0x628b795f42a479dd
	.xword	0xc15cade39d0485f3
	.xword	0x80ff7a99dd00fb7c
	.xword	0x2b3189008732004f
	.xword	0xc0309ffc043ece5d
	.xword	0xef961c80cb5680f3
	.xword	0x164e96d2a783c6e5
	.xword	0x68ef4a11bb2beac0
	.xword	0x2996c55ec6557585
	.xword	0x5dc37df0b6c947f7
	.xword	0xe37dce545306f075
	.xword	0x7aa2216496700b9d
	.xword	0x516a2a93c048ed34
	.xword	0x4d65b944f525eac7
	.xword	0x5b21797cc9fc3f88
	.xword	0x0116d4eacdebb75f
	.xword	0x705e02988af5eda2
	.xword	0xfc7cf3f986108884
	.xword	0x45088c23a54122f0
	.xword	0xde1cee5c8e1e9277
	.xword	0xf4a7e5911ac1e43d
	.xword	0x820a25d016ed9edd
	.xword	0xe8cc088ddc60c558
	.xword	0xc122636cac1e1d82
	.xword	0x0c35eea09082fa4f
	.xword	0xc1c895afbf5d1d7a
	.align 0x2000
	.data
data_start_1:

	.xword	0x64c1a51888b14fd7
	.xword	0x369ee17e927058c0
	.xword	0x615613327f212e71
	.xword	0x2bfc0f975831c777
	.xword	0x313deda68b76f894
	.xword	0x2e25c0557ee49cc3
	.xword	0xd3f1923b22983697
	.xword	0x5f4ef6ebfa772c17
	.xword	0xde319bcac673e3bf
	.xword	0x3a1cfc764d038625
	.xword	0x91428beeba89ce6d
	.xword	0x3759400802b6faa5
	.xword	0xfea59578696b001a
	.xword	0xed9bea822d4a6972
	.xword	0x87ecbce4db77c8f5
	.xword	0xf13775ffa6c95e15
	.xword	0xa0b3acd75658a2ed
	.xword	0xc7506cb3a6562722
	.xword	0xe4f661704793da76
	.xword	0x632caeeb823f214d
	.xword	0x3f05c563c8ed8e2e
	.xword	0xd593c60db4d896b8
	.xword	0xe59bf00d44abe000
	.xword	0x3e6304ee251627c2
	.xword	0xf3ededb35bacd38d
	.xword	0x9ea56d17f1712ece
	.xword	0x9e52e90d3bcc218e
	.xword	0x73ce0f6e2e76ce11
	.xword	0x6926dbc78cb920a5
	.xword	0x961557c62f46eb59
	.xword	0xf8894039af675fbc
	.xword	0x2acec27aeb3cc422
	.xword	0xd3a41fae7f4defc7
	.xword	0x543a9c3a47b13767
	.xword	0xc29126f13a7736c1
	.xword	0xb368934b79d123e6
	.xword	0x662f60a8ea67387d
	.xword	0x34fb72f9eaae21eb
	.xword	0x939b44519255405d
	.xword	0x07e3c9ba15e03bbf
	.xword	0x68389debd03743c7
	.xword	0x5ceb9b952a939062
	.xword	0x76f7c01f39e96b85
	.xword	0x6548ff23021edc30
	.xword	0x023a71acce56c395
	.xword	0x4c54c2d1d4cd00ea
	.xword	0x8bb54d09ce7ac671
	.xword	0xebb86ea884808791
	.xword	0xa23c7cfb7fdc25cd
	.xword	0xeca1439d941e10d4
	.xword	0x17ed5b140b4a7839
	.xword	0x21bc17a827e06fc2
	.xword	0x8414fe3e75fbf773
	.xword	0x4465facd9efe3e5b
	.xword	0xcd3d06aefa586215
	.xword	0x49a728b3673e34c3
	.xword	0x52371bff4e11a29d
	.xword	0x69319d146e53a90f
	.xword	0x70502cf5c5c4ccc2
	.xword	0xbee6628bd44b6f44
	.xword	0x7c5ab8bcbb86900e
	.xword	0xa6cae302c4e2d571
	.xword	0x7ed1e261f06a690d
	.xword	0x16a428dc139100f2
	.xword	0x745e7742cf8ac918
	.xword	0x1824782e7f1c6635
	.xword	0x8efbf50fd34420dd
	.xword	0x0a66fc086a91e33d
	.xword	0xdb538e966f031345
	.xword	0xffc96e27e14fedee
	.xword	0x103c88252dd2e8ff
	.xword	0x8f40a22bf8835f7c
	.xword	0xfa6df874d5142ddd
	.xword	0xa7dc6dd710b1531d
	.xword	0xe0c9dad0bac06547
	.xword	0xad489e07bcff0b70
	.xword	0x67a6d93a510f8b9f
	.xword	0x9139c22be43f34b6
	.xword	0x7ca03b5f90f16fb8
	.xword	0x82515b8d6e1931f9
	.xword	0xfcbdb6f9d67eda57
	.xword	0x3f3113a20579b91a
	.xword	0xb4819c374e6b864e
	.xword	0x4035ae7aa20331ef
	.xword	0x28c87c7f7c592992
	.xword	0xb52651bec8af4db9
	.xword	0x614dbfb9d1c0c0dd
	.xword	0x8c2db50d45f58e65
	.xword	0x55672ecee8aae5d7
	.xword	0x83fdc006f933642d
	.xword	0x258bc6b2547453e3
	.xword	0xf27dde0915b6d558
	.xword	0xbdab5d9adaaa1e68
	.xword	0x559bc76f53130d86
	.xword	0x24367e826c70e8f1
	.xword	0xd10033b364f9a73b
	.xword	0xba9df4f3b8248b88
	.xword	0x3450beff68c667d1
	.xword	0x74555d523523c33b
	.xword	0xa0e9a64db64c4c64
	.xword	0x1ab08ee622f6a355
	.xword	0x43a9684683e3a0f7
	.xword	0xb29c3cfc12308949
	.xword	0xaf4aa3eca83b77b5
	.xword	0xb694c37bd0e206d0
	.xword	0x287cfacb64783350
	.xword	0x29acb5895fdd2e84
	.xword	0x53c4171b5079bf61
	.xword	0xcb72f82d74c7433f
	.xword	0xf961e74c28c40e10
	.xword	0x0c80a75282632872
	.xword	0x08883a646bd0fbe2
	.xword	0x6dad8adb28fdc400
	.xword	0x77ed4b73ab3c1730
	.xword	0x2d48197420646835
	.xword	0x06d47f227dd76740
	.xword	0x7d1596cb84f76ea0
	.xword	0x0178bc18f2f957f5
	.xword	0x887e272ab18a9abd
	.xword	0x1739e0ef10c190d3
	.xword	0xf0acbb0a89352700
	.xword	0xb9e5e886bdca2909
	.xword	0x05d47bdbe4d14fc2
	.xword	0xb78aadab71a0e1a4
	.xword	0x0557008bb41b4533
	.xword	0x7c02cb9feb715d60
	.xword	0xd7f31ec21902fc32
	.xword	0x34f5d24367ac17f1
	.xword	0xdbd12b8f2c679912
	.xword	0x1db9838479b840e0
	.xword	0xf66018c02e1394e0
	.xword	0x27332adbb4734985
	.xword	0xe26543e320495657
	.xword	0x4c0ab5684aa64b80
	.xword	0x32210a74edccb4b3
	.xword	0xc3d7b1cf4ab53e2e
	.xword	0xcd503f3e3449652a
	.xword	0x809f339492569121
	.xword	0xcaacdf09bb83cf55
	.xword	0xec6329c5b7083463
	.xword	0x416f8f918234dd14
	.xword	0x309009e3aaf9dcb0
	.xword	0x406eeecab2915026
	.xword	0x2b0ab0c8239e50e0
	.xword	0x7d8bc6ef9747115b
	.xword	0xdc73617ecddf0001
	.xword	0xe6e67d0e75f24992
	.xword	0xb49e2b119c9c974d
	.xword	0xf1723c56f3c91e1b
	.xword	0x3109837292efd0db
	.xword	0xa8a85e3bf395cc72
	.xword	0xc98f6c4fee405f9f
	.xword	0xb1483807da611f75
	.xword	0x3b2040b58f6736a6
	.xword	0x49509d11ea4ab01a
	.xword	0xebede93ac0224e40
	.xword	0x417f4d63e0e91256
	.xword	0x27796377d916817a
	.xword	0xf26fe66f858bfd05
	.xword	0x0547f77e08bb2d15
	.xword	0x3cb6d2d6cb83985c
	.xword	0xa364f6aa3bfbccd7
	.xword	0xa2cb9d48145f654c
	.xword	0xbe5c3cd713d53e97
	.xword	0x804a8a8889854829
	.xword	0xa53ae3488084a5be
	.xword	0xeb3e4cbf867e0f49
	.xword	0xddb281adabf88785
	.xword	0x37742030c0779931
	.xword	0x514375fe220dabc5
	.xword	0x17d77cae817311dd
	.xword	0xb3e9e02e4b6a9c61
	.xword	0x33ef48ab789a9aa8
	.xword	0x39638f13e746f956
	.xword	0xab63cce89a74b43c
	.xword	0x4adc808b1e9d10cf
	.xword	0xc766605ac99f7b93
	.xword	0x954f843cb850bb62
	.xword	0x33f69f384310fa60
	.xword	0xfa61f003606089bb
	.xword	0xfb2b3e31937764d1
	.xword	0x2776f4f1f937a75b
	.xword	0x646bbf117197fced
	.xword	0x5ab6bc654eadca2d
	.xword	0xaad6f53cf0b18b33
	.xword	0xa841881e5f3b95b7
	.xword	0x52c85ed6f6c5bc53
	.xword	0x8cb78f5840d2690c
	.xword	0xae705268f33d3a72
	.xword	0x39a0f8928067827f
	.xword	0xbc5731dc1b80d42f
	.xword	0x8bb4869489613b01
	.xword	0xcb263958ae2bb0b1
	.xword	0xda93e0ef2aba03bf
	.xword	0x31fcf958ab476afc
	.xword	0xffcf94aeb32f6e52
	.xword	0x139538042b797ead
	.xword	0x46fd97e672230f59
	.xword	0x3e7a39edb9c1f97f
	.xword	0xf997957c0837c4ac
	.xword	0x31734538ce194962
	.xword	0x1483a3cf6a87e2d0
	.xword	0xc94ea563b89652e8
	.xword	0xf9fb9a4cbfcac592
	.xword	0x930c62b033508956
	.xword	0x23f01996ef0beb70
	.xword	0x4f8e49c7879ba847
	.xword	0xb3fe70ef8c283d04
	.xword	0x57f96ff54188a604
	.xword	0x24c23c8f138709b6
	.xword	0xb850d5b24b35fdbc
	.xword	0x2b910184a5299bbe
	.xword	0x0c6a16cd4675fcaa
	.xword	0x39e6e7d03afa60bd
	.xword	0xbd87480c42208e04
	.xword	0x97cafc30b6e0f65b
	.xword	0xdfcb510267e4608f
	.xword	0xaa1f3fa454ca3aa7
	.xword	0x3ae567ac67f5a5f2
	.xword	0xce9f8bd2a814732f
	.xword	0xb1b9f953d1cccf48
	.xword	0x8a0f673f068a4fdc
	.xword	0x2c4f47f26b5352c7
	.xword	0xe7ef203bc0edb964
	.xword	0x289a5496890812e6
	.xword	0x3861ae2f8188dec9
	.xword	0x8990f2df7c5131f8
	.xword	0xa1bed7d6058f162f
	.xword	0xbb0edaf4a5383323
	.xword	0x1020acd0d6551b8b
	.xword	0x281ca5bef4464b55
	.xword	0x36b33a3f09887d6d
	.xword	0x2334f6b17969b694
	.xword	0x312f73c3b850dd6a
	.xword	0x6b513a5477c1d9fb
	.xword	0x47fe911e4a87475c
	.xword	0x830ebe3c1ce99c5a
	.xword	0xae2635cafe316666
	.xword	0x02239b304fdb9c88
	.xword	0x5f0dcaab4f14f2af
	.xword	0x3bc9247237845281
	.xword	0x2d6fcca264997ee2
	.xword	0xf706b3c9b3010f62
	.xword	0x2fa325cc787a0746
	.xword	0xa09bbe90ee17edbe
	.xword	0x0010e03867bcda78
	.xword	0x0ce4b1db59b69743
	.xword	0x5bcc0a17993cc358
	.xword	0xa59f6eb3ba8708c4
	.xword	0xea3b9241bc0434a2
	.xword	0xd13f65d42566e97b
	.xword	0x8604fdbc0d541d95
	.xword	0x03dacc308c3885a3
	.xword	0x5e1aaea6e0dff387
	.xword	0xcbf8b850488ee3c0
	.xword	0xb15d3118721b96bf
	.align 0x4000
	.data
data_start_2:

	.xword	0x2c0647a2780d57d4
	.xword	0x6196dbaf931d4dd7
	.xword	0xd50415c1324914b7
	.xword	0xb7f0bdcca694cb6e
	.xword	0xc3c5e0b77686658c
	.xword	0xae875d920c8deae4
	.xword	0x38e42af14a8137f8
	.xword	0x0d5b23961156f0c2
	.xword	0xc24735f7eea8b538
	.xword	0xded8a2c955e7e81c
	.xword	0x10e77917e8bed3c3
	.xword	0x90994902b7436efa
	.xword	0xf469323d4f44ebd6
	.xword	0x30bb988ca152cfd1
	.xword	0xf218944a7658a9b8
	.xword	0x27729cfdcbf23415
	.xword	0xb8652c475bfe4f15
	.xword	0xebe52a0126dcdd9e
	.xword	0x31e9776d7488ac81
	.xword	0x4aeedce80c32b930
	.xword	0x09b3e15dbe404b59
	.xword	0xe9bfeb4758956ae2
	.xword	0x63fdae1ba5e1ec2f
	.xword	0x701bea9501b72714
	.xword	0x5cf201e2e0f5ceca
	.xword	0xb0f2824b362705b5
	.xword	0x3f9f5bf944af4f37
	.xword	0x27c0d64548be8664
	.xword	0x55bd843774e758ee
	.xword	0x9078b2767754524c
	.xword	0xca523d5153c1ff90
	.xword	0xdebb8a418fdec8ae
	.xword	0x70161b8d36fe0088
	.xword	0xa7b0ff3bd0f3a366
	.xword	0x4bfef4bb9b1cc268
	.xword	0x9a367b0f5cc012fe
	.xword	0x691e0eebbb002601
	.xword	0x162d6f87a8e3f138
	.xword	0xe45e384c43d857f3
	.xword	0x8e2cc13864ee2ec4
	.xword	0x27c037debcf43dac
	.xword	0x3960335f82cf83b3
	.xword	0x623788aa61244368
	.xword	0xe83827fc67e920d8
	.xword	0xf18961a9941c5b62
	.xword	0x903946ed4e093b68
	.xword	0xd98a89e98b3fa1c7
	.xword	0x1cb0a7bc0bc72c0b
	.xword	0x8ede76e7ae7d2d44
	.xword	0x6deca3c76c0cb536
	.xword	0xe532531ffa8da172
	.xword	0xdf1454111e31e174
	.xword	0xd48983d5790a1cd2
	.xword	0x050f9fea0ec94a8b
	.xword	0xf8f5655fc2ca074a
	.xword	0xfcf2aa030d1f8eeb
	.xword	0x6162db181c5aa7e6
	.xword	0xc321a553723b1c72
	.xword	0x102108d546388e7b
	.xword	0xb71fbbd762bd4ae2
	.xword	0x347fd2de0def7a32
	.xword	0x939078ad2d6cabd0
	.xword	0x7beb5579870892d5
	.xword	0x762a899e88eefcdb
	.xword	0xb13d3e5dea8bf039
	.xword	0xf90a156b69213735
	.xword	0xdcdc82de0fdcaab6
	.xword	0x574cd6f7c455ea6d
	.xword	0xfbbfd72f96c34457
	.xword	0x326bd22df085141f
	.xword	0xdc8e25fbd1b96d21
	.xword	0x6db9cc5a8ffc5430
	.xword	0x4485f1f1e9ccb69d
	.xword	0xb744369e12ad75b8
	.xword	0xf984e5c4841b06a4
	.xword	0x60b566f5531e1558
	.xword	0x63e57d41013918b0
	.xword	0x4cf2b72c962f412c
	.xword	0x3f00057485bb1a76
	.xword	0xf71d80eca58293b1
	.xword	0x2c1e1649d3a134f1
	.xword	0x72c2c94642f35bb7
	.xword	0xe496e511f22e7529
	.xword	0xbc13750824d9d937
	.xword	0xb0d65a4ccf9504a1
	.xword	0xe82b0159dea5ae6e
	.xword	0x97845711431dc05f
	.xword	0x730e261f63b69a32
	.xword	0x24788961f3322348
	.xword	0xe4c93952e2ba4ee8
	.xword	0x68623d610e8678ef
	.xword	0xd267cdc5469fdf27
	.xword	0x61be334fb12dd1c4
	.xword	0x2ed3ef75520201a6
	.xword	0x9b5a06e740fae479
	.xword	0x50148787ee6906bc
	.xword	0x4436a9ff22ebc43d
	.xword	0xe743bd638f6c52ce
	.xword	0xc1b83010107bc782
	.xword	0x7cc180d87e55fd3a
	.xword	0xe8ad5bcf42c3196e
	.xword	0xf999ecef7ae2dc56
	.xword	0xdb7c1a4ad9e69e1c
	.xword	0xba18cf20d94c116a
	.xword	0xcac564b70e8997fe
	.xword	0x9db0a895755106ff
	.xword	0xf61972bc86962833
	.xword	0xc6ae51ac62d45e16
	.xword	0x0363ec484fa13d4d
	.xword	0x771d73237616cd69
	.xword	0x3065909c4663989e
	.xword	0x1482d6f412ecd4d7
	.xword	0xeccf927ae10daf01
	.xword	0x8f1e719217370ea6
	.xword	0x5cc432ce94c6dbe6
	.xword	0x6b33107ba88e05d5
	.xword	0xf7e052ece2cd93be
	.xword	0xbc71990ac4521464
	.xword	0x6ca7dfcf5f0fa3cf
	.xword	0xb6ab63af51b50a6a
	.xword	0x56e91418ecbb4346
	.xword	0x2d8a831ab38e08c8
	.xword	0xeeb64b5c84d2a809
	.xword	0x266f6ccecca520b8
	.xword	0x3bea58e06f0cfe68
	.xword	0x0c444d7cfdabdc30
	.xword	0x6f879ab7bfd4f4e4
	.xword	0xb5771de3f37c76a5
	.xword	0x12e040cb88bf23a7
	.xword	0x768feb652ab4a412
	.xword	0x3b9555a39bcef92f
	.xword	0x8263e3f8c0983a5b
	.xword	0x514cc0734b6a70de
	.xword	0xb8f19f7874213f6c
	.xword	0x2cdb90f40f100e72
	.xword	0x2d58d98b89f3a1e8
	.xword	0xbd7908035116fe75
	.xword	0xb13d55f5b9a4c20b
	.xword	0x604847ea4c7996b8
	.xword	0xf2a49e46a17b490d
	.xword	0x283aa6b8ec284844
	.xword	0x8188fdf474a8604f
	.xword	0xc154b1215281d88e
	.xword	0xf5aae8c8e2e1699a
	.xword	0x91c370f8574d45c1
	.xword	0xce41b1f4c949d365
	.xword	0xcde103c7f2a3b65c
	.xword	0x7e95c8f3cf1db939
	.xword	0x6f1e32699663422d
	.xword	0x088ddf6ff3383d61
	.xword	0x7581de3e0f351ca5
	.xword	0x6d0f345b6ef70929
	.xword	0xa98189a887657bc6
	.xword	0x751ad2b7b9d3f865
	.xword	0x5a3ffb600198b127
	.xword	0x721a248057eab960
	.xword	0xc3c885f381df4627
	.xword	0xe9202b3b00389246
	.xword	0x3e679d5a92156304
	.xword	0xa42b3052c02ff112
	.xword	0xe5055b9a1ad5aacf
	.xword	0x401e1333bee5543d
	.xword	0x92bab7d808e84f3f
	.xword	0x773f332e1859d322
	.xword	0x0024dabf696220a6
	.xword	0x8f548cbbb589ee1d
	.xword	0x5c2407c21b890684
	.xword	0x7dc4a47a618c1d71
	.xword	0x0f33d6df6b93e306
	.xword	0x5f546fe69d1feb17
	.xword	0x5d6353352c7682b6
	.xword	0x7df6685a3aa8dbda
	.xword	0x3315405c3277c3cf
	.xword	0x7e37b254d34e5456
	.xword	0xf32fa4d05b745061
	.xword	0x9f7d57c882ef3629
	.xword	0xe2dd97d527d8ce53
	.xword	0xed7c43d892abe4c9
	.xword	0xfe8103fafab8637e
	.xword	0x9e0a29ed8468bd3c
	.xword	0x7ecdd907671977ed
	.xword	0x5fb2b2d5ce373c45
	.xword	0x1569bd797ca4dff1
	.xword	0xad53d3df016f0aab
	.xword	0x518a982f9a869fce
	.xword	0x167161fdc7f35dc7
	.xword	0x03c58cf674612ced
	.xword	0xf0cdace8cc544e7f
	.xword	0x637721dec7f33281
	.xword	0xa6e39275d60699ae
	.xword	0xb353704abc04c62d
	.xword	0x3602ef59cad887d9
	.xword	0x94e89ca8a7581946
	.xword	0xd77e5e1a1bbad3e1
	.xword	0xafddd93c0bc4ad04
	.xword	0xe16c0774be8fc4e9
	.xword	0x6fe9db02b5d97266
	.xword	0x794cccb62b8d08aa
	.xword	0xec955440d0479548
	.xword	0x784eec3c01d5f59b
	.xword	0xa3effbf8e8ff6495
	.xword	0x187b4516e63d4ba5
	.xword	0xa8215ba01e6c9472
	.xword	0x4323c3745c8da50f
	.xword	0x15333f2b9cf6083a
	.xword	0xee133c32cd06ae0a
	.xword	0x9f094c19d7cd6a14
	.xword	0x6aa631ee4793c52e
	.xword	0xdf74895d5a05c0b7
	.xword	0x40efd9ab89022fa1
	.xword	0x98345c856fb1ef80
	.xword	0x2ba68706258adde1
	.xword	0xaa830e2824ea7702
	.xword	0x64602061438a001c
	.xword	0xa401669e569f40c0
	.xword	0xaea6a61c905bf0ff
	.xword	0x671b42b28cf9f97a
	.xword	0xdea3534d506a832a
	.xword	0x6948bc54d8958067
	.xword	0x25458d81a4bd4865
	.xword	0x28600fd8a466b88d
	.xword	0x9d890278ae3f99cf
	.xword	0x324041153cb4af24
	.xword	0x6eed89b1afdd0a00
	.xword	0xd5f398e12ff6c5ad
	.xword	0x1cc5832c7d974413
	.xword	0x9033612c6433d430
	.xword	0xe650b0611f6accc6
	.xword	0x5dc3558f3a199ffc
	.xword	0x9655390f556d626b
	.xword	0x999f138634b98c76
	.xword	0x516ffdf2edb9b640
	.xword	0xdd00642fbd1fb8fc
	.xword	0xfc487844d32a33df
	.xword	0xee54125b7ea77925
	.xword	0x3386ee634d68b904
	.xword	0x96b1b1005dff0a10
	.xword	0xba85a26b08625c50
	.xword	0x4248c1b55ad6824b
	.xword	0x0003c24d69fd6796
	.xword	0x583b2bf98b1148af
	.xword	0x726d4919f8eda5a4
	.xword	0x620decc95876cc0f
	.xword	0x6ffa63efdaef9887
	.xword	0x511347db3642ea00
	.xword	0x3d2367397083b424
	.xword	0x01180f99fbcae50d
	.xword	0x3a8ec1b85b150ba1
	.xword	0x20bca531d9f65216
	.xword	0x78b95c5f678edba6
	.xword	0x2d1e1e4fa8442d91
	.xword	0x3d3edeb44007c579
	.xword	0x1731829a4938e1e7
	.xword	0x178ab4dd937b858f
	.xword	0x49dd0393ab2b8da7
	.xword	0x965efc98f38aeeb6
	.align 0x8000
	.data
data_start_3:

	.xword	0x25f48bda66100f68
	.xword	0xefdf653fc6e8ad69
	.xword	0xbdbb832374fc6d53
	.xword	0xb196370085d847b0
	.xword	0x5797b8791923970a
	.xword	0xd979e201fadc58fe
	.xword	0xe6bd92a67c45fb52
	.xword	0x05b8b4ad002ae907
	.xword	0xca091833de2811c4
	.xword	0xbd2e0cd1d0cbdeb1
	.xword	0x907a79b551ed2e93
	.xword	0x15b61b46ad6de145
	.xword	0x8c0ff2e6751c14a8
	.xword	0x77a207d15b4bb183
	.xword	0xd4904a24c1758875
	.xword	0x034d555266dcac80
	.xword	0xd5f9fcf2e43ea126
	.xword	0x6b95bcbd3fb456ef
	.xword	0xc4749bf389ebb119
	.xword	0x9690ec1739f553be
	.xword	0x8a4a9b56d7e1b54f
	.xword	0xa99fb696dd1a0451
	.xword	0x22f91749dc7cbde1
	.xword	0xa13de54c38ad6f63
	.xword	0x6f0437e9eef47a98
	.xword	0x62fce1cc4a0e5e5e
	.xword	0x86f483899882acb4
	.xword	0x7beccdf8b95a49c8
	.xword	0x4adb1ccbfaaee5c8
	.xword	0x4efbca7a24c12b10
	.xword	0xe169d29cfae2cb4e
	.xword	0x8c5d5033492110b7
	.xword	0x6761cc8fcd5f9ab9
	.xword	0xdc2eff16b0b3eef3
	.xword	0x2a959637251091bd
	.xword	0x150a6d9bee1bc09b
	.xword	0x22cad2596a2df545
	.xword	0x07fda2ab4754bb36
	.xword	0x43a66e75cb99e28d
	.xword	0xb4f39c35f327f6c6
	.xword	0x8eae93e9e16e7ed9
	.xword	0xf67c2ad010b881c0
	.xword	0x6c03bb7f39131918
	.xword	0x3268df715b3d5b77
	.xword	0x4dc35b5bafe63a40
	.xword	0x035416624da323c9
	.xword	0x7bb89da630c03389
	.xword	0x8f1423c373e1c81d
	.xword	0x433e44385dfe246d
	.xword	0x1bdd53bf23f020a9
	.xword	0x0f216766e3ba3a88
	.xword	0x87905a33d9c56e59
	.xword	0x4c33d13a69dfa577
	.xword	0xa96a2c4af86d99e0
	.xword	0x42f5a047f4d4efe3
	.xword	0x2b63d55442531ba6
	.xword	0xaced617d541a57b8
	.xword	0x2ddfd7ff8c4265a1
	.xword	0xad8c9f612f2ffd6c
	.xword	0x725233c6091c17ac
	.xword	0x864cf2ad46bc631f
	.xword	0x275949d7ab45c77a
	.xword	0x09f5b41339e447ab
	.xword	0x4850e42fc3bb145f
	.xword	0x0b003da95896b772
	.xword	0xb34070c0353ae053
	.xword	0x01c5ffc37bb9d9ae
	.xword	0x0b44757ae42571d2
	.xword	0xe547d115257e5ff2
	.xword	0xfa8e05c97648304c
	.xword	0x1fe93d4ceb8dad3c
	.xword	0x78b32f7122e401e6
	.xword	0x336304d046992899
	.xword	0x1f7519dbdbc73d27
	.xword	0x55d3ba79e37b4246
	.xword	0xb75007ab6fc8969a
	.xword	0x0b01ce7cd6c2d871
	.xword	0xf07c2d28c94eedff
	.xword	0x095ee6a2c3956ae9
	.xword	0xb4c90a1463dfcaba
	.xword	0x2517fb02d935fa3a
	.xword	0xdc6446b8c44acc16
	.xword	0x14b9340cf4100c13
	.xword	0x73e60d9d5dfa1ee0
	.xword	0xe2a59ccb28148aac
	.xword	0x20396a7234564158
	.xword	0xf4e0a86332688cda
	.xword	0x8d807e1fb5f403c5
	.xword	0xe5e45c761750d84e
	.xword	0x596f3400cf70bad0
	.xword	0xabc3d831626f2cee
	.xword	0xc2b2961d551e538f
	.xword	0x8fca3ada4fc628f9
	.xword	0x8bb7431953acbfd4
	.xword	0x1a20f51554338d06
	.xword	0x93fb9db3eb4ec201
	.xword	0x5878934c3414e259
	.xword	0x1891d82940f9d358
	.xword	0x68ef1aa2842c6e62
	.xword	0xf86711c6b3f8347f
	.xword	0x33013b4fd3664c86
	.xword	0x3dd823cbb0357960
	.xword	0x739a201697f3f0d0
	.xword	0x7fbb4051ffaef013
	.xword	0x18051c4bd21eda63
	.xword	0x5feb95bc5795ba86
	.xword	0x6a73b64882944a8c
	.xword	0xfd93104b5570d28f
	.xword	0xdc5a3258039e75f2
	.xword	0xc4c655dc6a40002d
	.xword	0x17b9ec2a8a38ae46
	.xword	0xecadf7d4fc28a789
	.xword	0x492f85515b12c109
	.xword	0xd27710400b08a08e
	.xword	0xe37f38cf88add4e5
	.xword	0xfbc9ce06b8da8cda
	.xword	0xd4cd309e19f0a069
	.xword	0x301ddeddbdf1457c
	.xword	0xedc0cc511ded455b
	.xword	0xa8863963d0b24e95
	.xword	0xa86d6a7a8971ef83
	.xword	0xe507625adb1ac510
	.xword	0xf2d7a9d8f3487813
	.xword	0xaaadfbd4eb3cb1a9
	.xword	0xadb645c192f69993
	.xword	0x21be515d986603aa
	.xword	0xe272c1af4c5a60fd
	.xword	0x2d195c70ba00f5eb
	.xword	0x84cb293aecacdcb4
	.xword	0xbd86d793dc974272
	.xword	0x32a737fa8806a15f
	.xword	0xe7df42326883c20a
	.xword	0x9a7c8855e6f0d65d
	.xword	0xf9922cb70264e185
	.xword	0xb2992b4d913868d0
	.xword	0x435755aad9769235
	.xword	0x35108e7229448a97
	.xword	0x78a0d01cfb3d4d47
	.xword	0x963a1799b454521b
	.xword	0x8bdacfa9dba3d624
	.xword	0xe9a43ce628bac1c7
	.xword	0x7900d5fa6f4ebd21
	.xword	0x2352b9d079c6ae51
	.xword	0x6fd9639cd5b6c34d
	.xword	0xaa0bf6cd123dc7f4
	.xword	0xaea222d9cfaeb861
	.xword	0x82f712ece220a5ae
	.xword	0x9322ffa573e8ce12
	.xword	0x565955b2ee6807d1
	.xword	0x5b479d5a7e18eb50
	.xword	0xc8de4c7c82688264
	.xword	0x5e83c24c75052c00
	.xword	0x053cd7e462ac3dab
	.xword	0x8a0f944b4cc37002
	.xword	0xfde60fa8f3380850
	.xword	0xbfcf1b6805dfe216
	.xword	0xed7b2a116ce18445
	.xword	0x6194b21f71ea4ce1
	.xword	0xd81d9d3a79d48571
	.xword	0x5f0e2857685aba6f
	.xword	0xb535d44d0446eef1
	.xword	0xec70194ba4ccff57
	.xword	0x2d4747118d3a6131
	.xword	0x34064bfa948cf0a8
	.xword	0xc9c1a286ff1078ab
	.xword	0x47c572c781566cd1
	.xword	0x79f462676e685f58
	.xword	0xe1233689b88b89f2
	.xword	0x597b079aa9862d5a
	.xword	0x8b410a7f69c2efdc
	.xword	0xfc789efde73e5390
	.xword	0xbc7f6ffb990a7fb6
	.xword	0x72a2927a21848689
	.xword	0xddee7b95f07a7d1b
	.xword	0x92150417f9ee8f64
	.xword	0x11e6372a1736daf7
	.xword	0x30ff71986c988cfa
	.xword	0x3f76200d85a7f0ad
	.xword	0xd0365d4b9e7a8e69
	.xword	0xa6eee2330131dd32
	.xword	0xc676ed89240371af
	.xword	0x7a1a67e5239c5a32
	.xword	0x2b1ab04f4d9e5d93
	.xword	0xb7a256e2fdb10f5d
	.xword	0xe99584f99dcd45f2
	.xword	0xdc4eef0d03e8ecae
	.xword	0xa0702ce7ece70f44
	.xword	0x51999eb8ff3ecbac
	.xword	0xd0f0402109bc899b
	.xword	0xf32de692bfe51d55
	.xword	0xfc83a907f5882eea
	.xword	0xaef54a4a8a0c9c90
	.xword	0x5d8e8d50ca6995ba
	.xword	0xbdae988a114fadcd
	.xword	0x09d804d4df59e2d1
	.xword	0xae1b884ce8737bd2
	.xword	0x5cf2c72947f29112
	.xword	0x9e307ba63098be65
	.xword	0x8f23edb35b1a58c8
	.xword	0x0d6c9a52ba4b7c0a
	.xword	0xc9e5361e895c2e4d
	.xword	0xc6f97dd720db7fbc
	.xword	0x5575926165f77403
	.xword	0x822f97847739477e
	.xword	0x325609dcc699d262
	.xword	0x6f68b40ebc42e478
	.xword	0xb2021f4236b6a360
	.xword	0x2e7b459f7037cd09
	.xword	0xe839b8c6b03561ed
	.xword	0x1ed546f25197c737
	.xword	0x4109346379b0c398
	.xword	0x36d43772200fe052
	.xword	0xd9438124e110ed77
	.xword	0xe1fa03af4567696d
	.xword	0x2f379176f023d35b
	.xword	0x2c3ae58502be1bff
	.xword	0x5cc88287e2a99849
	.xword	0x0e05a29d51fc6653
	.xword	0xb4635ee49d140d77
	.xword	0xbb7a2c77f28cfb6b
	.xword	0x40051ce8d9e73b5c
	.xword	0x9406ee4a0a280fc9
	.xword	0x23478073b7289f11
	.xword	0xaff997016fa3c247
	.xword	0x0bf156f1e28a34dd
	.xword	0x6140668fb21f6f89
	.xword	0x290b608dfa290a5d
	.xword	0xe42d8ef948dffc3a
	.xword	0xb0ba853670355ad1
	.xword	0x172afcddad914558
	.xword	0x242cf623d7b9c9b3
	.xword	0x323f96b4e4d32561
	.xword	0x488b328e4b59c934
	.xword	0x80911794440519e8
	.xword	0x1bf78c4e7f344d8f
	.xword	0x738351906d8a561f
	.xword	0x08e922a8430c5862
	.xword	0xee6936da7805dfc7
	.xword	0x3346832cd332b1ef
	.xword	0x9f90d93f716a0c48
	.xword	0xcf73616d5006f827
	.xword	0x99224596cc487e07
	.xword	0xe5793d380225aaed
	.xword	0xf9d347d7dd48cde6
	.xword	0xbfc72cec349f8cbc
	.xword	0x78fb553af1129a4e
	.xword	0x52851707dc0d71e0
	.xword	0x7c29a6497cf502c7
	.xword	0x2ffe7ade687bdbb2
	.xword	0x4f0ce5fe0ee569c0
	.xword	0x370337e0df931c17
	.xword	0xf783af79e0124c5a
	.xword	0xe1bab998c8f3db3e
	.xword	0xf60a60de96087ba0
	.xword	0x53560d6b37954df4
	.xword	0x29c7a9407701c026
	.align 0x10000
	.data
data_start_4:

	.xword	0x5bd73b8d1024051c
	.xword	0x93e0ac7f7672db10
	.xword	0x8739c1616de22fc8
	.xword	0xea9b954680dfafb4
	.xword	0xff1c3853a71fba23
	.xword	0x4dfc76ef25e95208
	.xword	0xd6d2401dceca1832
	.xword	0x6b43bfa2c252d1e2
	.xword	0xe66bb0994fb1f40d
	.xword	0x6cc92521b159478a
	.xword	0xccd98445092f5494
	.xword	0x95960f178884990a
	.xword	0x44855524fa14536b
	.xword	0xf2a8b570b0644e76
	.xword	0x9c7eac99ddb023ff
	.xword	0x5f3e2e44ce1f87fd
	.xword	0x6fc911c8ab4d0c11
	.xword	0x79b21584a2fd2c7f
	.xword	0xab36e57525434d5f
	.xword	0xc7a92bcc619df604
	.xword	0x354f500154a64067
	.xword	0x992484cfd29e7bb1
	.xword	0x7840229f479cffb9
	.xword	0x81ad8a69b6171d34
	.xword	0xf0fb36c9ee4da053
	.xword	0xc59571689fad1056
	.xword	0x3a0baab0a7324369
	.xword	0xe8b0249c0c13e64d
	.xword	0x885120d4603ded1a
	.xword	0xa8dfafffdeda674e
	.xword	0x38cccec4d8567346
	.xword	0xcad23f2ebdd6ad9c
	.xword	0xad479cc82aab5ba3
	.xword	0xb46dcf3f7237e160
	.xword	0x2ea3f5103e1629b2
	.xword	0x6b51d27059800e00
	.xword	0x849d0e7045ee49d6
	.xword	0xac39945cdc48fc0a
	.xword	0x95a583a44c263f79
	.xword	0x5d8fafb9394c7bdb
	.xword	0xbc54c1c8d58823f5
	.xword	0x9a10db0c7663af17
	.xword	0xb818048dd171ed40
	.xword	0x08371e18b51dec9c
	.xword	0xce4cc9fc29b07ebd
	.xword	0xcf2acc56132bd73c
	.xword	0x4290e6d29c862699
	.xword	0xc78266c96ba42ccc
	.xword	0x458b151f7c3ce50e
	.xword	0x8c7be5a83e9081c9
	.xword	0x3d5ba142a75b9d2c
	.xword	0x5c17a21190f89d97
	.xword	0xcb94d5b7fbb2fef1
	.xword	0x24d6f9de40ba8541
	.xword	0x6bffd10444c73299
	.xword	0xb73ed3e337452bb3
	.xword	0x678c859b12d1175b
	.xword	0x51147938ad121d81
	.xword	0xc7aed6dfcd336c51
	.xword	0xe8878aafbca46992
	.xword	0x36e38873816fecb8
	.xword	0x274d1c1c7eb9d4be
	.xword	0x4374bb01b58a0fe4
	.xword	0x48ccbcd3214f9eb6
	.xword	0x20ed464249871745
	.xword	0x2a09d340cec75d16
	.xword	0x213ce44ba4485b45
	.xword	0xfce9b1fff4b5e33d
	.xword	0x70e4b0a90c1ab05f
	.xword	0x49318a93f4301e81
	.xword	0x1ade1a9d212b5f56
	.xword	0xda40cdcbdf923a89
	.xword	0x6350aff6b83e7e98
	.xword	0x044be85226c44bdf
	.xword	0x61c5925271d6a097
	.xword	0x682599cd14f7c42a
	.xword	0x2e243c9dfd0a79fa
	.xword	0x8a943cb6b1dbccd7
	.xword	0x7e5b02404198d542
	.xword	0xf74967e24150ada9
	.xword	0x1aed5b693d8abe32
	.xword	0xbe25bad172682379
	.xword	0xdd9e770d7bb5f0f2
	.xword	0x4abbd3954562215a
	.xword	0x648466bbb12de69c
	.xword	0x772f895bf89a84b4
	.xword	0xbdce6b0d6a4fef10
	.xword	0x76a9c7b9db01fd9c
	.xword	0xbe508a90c629432d
	.xword	0x7e90112cc766bc70
	.xword	0x685ea792ea3b6e50
	.xword	0xff2094ba901a32b3
	.xword	0xa0fa9f2d45a9126b
	.xword	0xecdc678e124fbf3e
	.xword	0x4b22fea0203e62a1
	.xword	0x4e67a7c4b6b11333
	.xword	0x662c49962784525a
	.xword	0x96bf933a0ed4d104
	.xword	0xa5961a70ee9b8fcd
	.xword	0x01403729c644bf07
	.xword	0x505f01f6435a7851
	.xword	0x061989a2fe7f04a4
	.xword	0xae918a6e61b26672
	.xword	0x6f2747731795012e
	.xword	0x7532ac74e3df1f1f
	.xword	0xdbce4d4fa7ac55d5
	.xword	0xa398f5464d8ac5ee
	.xword	0xd9f7e858a96e4f3a
	.xword	0xca26f97c980c771e
	.xword	0x22a4bdc158898429
	.xword	0xa40d97d833772ce7
	.xword	0x96361ab3748fdf62
	.xword	0xbcc509800837aef6
	.xword	0x879b56872080eee0
	.xword	0xdd3b6d84fca52bc1
	.xword	0x5af5485a8496169c
	.xword	0xefba6b3dfb13b74d
	.xword	0x0d9dd4056c65eac3
	.xword	0x33ff7c241b813392
	.xword	0x0f7143fba975baf3
	.xword	0x1ee4bef36e57032d
	.xword	0xc9701b101355b81d
	.xword	0x489841d234a5ba13
	.xword	0x765191630a75ae17
	.xword	0xf8ecfaf8b662f030
	.xword	0x2d28cdf0613fbfb1
	.xword	0x6550f661bb78709d
	.xword	0x7adab4d6af9ede5b
	.xword	0x96a71f332a0a6e38
	.xword	0x04061815fe3ab7be
	.xword	0x4974f7f91b21a9fa
	.xword	0xbe35e95b90f72148
	.xword	0xf4edf1f2a0171154
	.xword	0x40250724d8ba2392
	.xword	0xe4ce341b9bcd0e06
	.xword	0x323b1d04e336a989
	.xword	0x097ef5f82df98e08
	.xword	0x4ae6ef256f05a37a
	.xword	0x0d82d94322f1d8a9
	.xword	0x96c8c1b693a362d6
	.xword	0xf948abb570e6e66c
	.xword	0x1ecfe13757900f7e
	.xword	0x42b237a6d815674e
	.xword	0x04f21ff83991b35e
	.xword	0x57d66626fda3fd48
	.xword	0x3f885789adb51895
	.xword	0xb21f9e4d3158c60c
	.xword	0x680dc2a8d75e54d0
	.xword	0xf0a6367277efaf5f
	.xword	0x8ecfe73e84ac05d5
	.xword	0x220d8cd3398aa770
	.xword	0xe6d393c524935824
	.xword	0xcc1aeeac640ab0f4
	.xword	0x409e590afde078e3
	.xword	0x48b475d1f3bb41c5
	.xword	0x55c7bd86577bd13f
	.xword	0xa052031420da16fa
	.xword	0x687ba301ca701960
	.xword	0x896ec295fb45955c
	.xword	0x9059e0a1dc166019
	.xword	0xe82f02e47e5eb3b7
	.xword	0xd5338c293eedbf0e
	.xword	0xfd92f3fc9177c738
	.xword	0x39a93ad9e98de453
	.xword	0x6368a9a0e2f8091d
	.xword	0x8f4605a87008e93a
	.xword	0x26d3c9674d1c165d
	.xword	0x1ea4c19a68cebfe8
	.xword	0x0962b8db3f2ab4d4
	.xword	0xf4152ef66869a987
	.xword	0x82b84f4b8cecc59d
	.xword	0xf803d387eb1912e6
	.xword	0x94674656473b429a
	.xword	0x09fcca926ea83d2b
	.xword	0x8d2499938bbaef60
	.xword	0xbf870063e734af11
	.xword	0x511cb07695180192
	.xword	0xdb2ee2176c60e60f
	.xword	0x4ea8d0a8ca822a09
	.xword	0xecb65a59ea6c9601
	.xword	0xe2df3dad222e3de0
	.xword	0x3cca142d7ef1924d
	.xword	0x49878cfa4b8cb5b1
	.xword	0x397d29c064734c2a
	.xword	0xb2420eb36fd47d44
	.xword	0x43ea128fd6f96fc9
	.xword	0x2f44c80b79332908
	.xword	0xa5ac519daa11771d
	.xword	0x49e8fc5af32661e4
	.xword	0x81ab98b23f7589a3
	.xword	0x99011beb4e0a1d3a
	.xword	0x918e28b1c29919ca
	.xword	0xc08dddc878c1e330
	.xword	0xcbb0769267b960a4
	.xword	0xb8119205f126c9e0
	.xword	0x83c055384af214c7
	.xword	0x92aea366adbd9cea
	.xword	0xd40372a1389a2717
	.xword	0x7089c26b6ab718a7
	.xword	0x19131c8888ce494d
	.xword	0x5416649477dd9dbc
	.xword	0x2476cdae3c15a9e0
	.xword	0xc4577962e20bca40
	.xword	0xe29362ab4b27da46
	.xword	0x61a56ba4c7ee03df
	.xword	0x29284691d7a35eb5
	.xword	0xa07557eb38d9bdbf
	.xword	0x6d21e237412a1992
	.xword	0x892fe4520bd7fd53
	.xword	0x7dd5f00124b7c506
	.xword	0x8e6d489f0ca0b495
	.xword	0x17d24324a636f98d
	.xword	0x2d6fa88317d572e8
	.xword	0x5ea4ec4a6aadac13
	.xword	0xece08c4da4642f45
	.xword	0xa22b8aa70e01eca0
	.xword	0xf0385bae803fd595
	.xword	0x861fd5edc7aa3043
	.xword	0xe1ccbced3c15232c
	.xword	0x14a1f5a2579614aa
	.xword	0xc37b42b168f6694c
	.xword	0xe2e92477b88ddfcb
	.xword	0xd914cbdc28492117
	.xword	0xbc1521ae286b75ba
	.xword	0x26b1763d6db8983e
	.xword	0xa689f79bbb9c8dde
	.xword	0x9d609190b3e1da7b
	.xword	0xe14bdc4b2ecf0cea
	.xword	0xedc6d225df60930d
	.xword	0xe4b83abdd016a9a1
	.xword	0x1c817fce8c011487
	.xword	0x2d523493ec7a0a3a
	.xword	0x5a61441bd011e399
	.xword	0x83834103c6c793e2
	.xword	0xf935e88ea11808ac
	.xword	0xabe6615bae4e7dcd
	.xword	0x30c69da8bb9754b8
	.xword	0x1e85c72eca439c65
	.xword	0xa1b7276de76185d6
	.xword	0xe15f4ce9f957f639
	.xword	0xfa33f88dbfaf06ff
	.xword	0xdc31b17556140050
	.xword	0xc148379ec7b45c3c
	.xword	0x14fea7fe01010c51
	.xword	0x199431b6ba678c48
	.xword	0xc11aaffc9d1fecf8
	.xword	0xb27ccd99f696d6a0
	.xword	0xc7e5456a07edfbc3
	.xword	0xa4b9f33380abf650
	.xword	0x73fabf997751dc83
	.xword	0x4cd8c94db97a25f7
	.xword	0x172b0b4e5d9a6b22
	.xword	0x31291409b36f77ea
	.xword	0x3a132b00da197454
	.xword	0x319c750d416ccf7b
	.xword	0x77fe38cea00fc0d3
	.align 0x20000
	.data
data_start_5:

	.xword	0xa85714efbb322cd9
	.xword	0x6b549678d5bce2e5
	.xword	0x717732b29880022a
	.xword	0x94259d13a69167c3
	.xword	0xbdec2d67e9eba027
	.xword	0xa3b9fc44989d3981
	.xword	0x616684df865d0470
	.xword	0x4be9e7a2b4a5d742
	.xword	0xcbae48c683892c11
	.xword	0xce3a25387e0b5b5b
	.xword	0x53cc32254331ae3f
	.xword	0x4e698853af005b3d
	.xword	0xe46d0a8435d0b88c
	.xword	0x5f61a3398022b50d
	.xword	0x5a923be9501df174
	.xword	0xff04f6a2326c967b
	.xword	0x539d53d36d04792f
	.xword	0xccb8ad5c6399660c
	.xword	0x5114b4fb5a3a5329
	.xword	0xf3dae64d1fa49277
	.xword	0xff5589ee4583d9f4
	.xword	0xc2bca97f648fd107
	.xword	0x949bc8baab70f537
	.xword	0xc73be63e1195e2b0
	.xword	0xe529046bc3a4c27f
	.xword	0x4b510a2d22049b62
	.xword	0x4e07d345dcc2765c
	.xword	0xf06fdd2941929026
	.xword	0xee288317448da317
	.xword	0xf51e581a1e16d2a0
	.xword	0x3105fe69b02d47d6
	.xword	0xa2eb5b6094de470d
	.xword	0xe83c083f02a8155a
	.xword	0xd2295ac6de1f53ec
	.xword	0xec1126522962b6d5
	.xword	0x58e80a7ef88133fb
	.xword	0xcabd72ff162069d8
	.xword	0x6e19bacb1ff36f1c
	.xword	0x52894601137d3de3
	.xword	0x084e8ab0ef7b0b0a
	.xword	0x64b6a7ef274be408
	.xword	0xd3c2208950242416
	.xword	0x736c7e6ff085de4c
	.xword	0x48c79b976b616cf4
	.xword	0x6f77ef3caa52bb4f
	.xword	0x093d96f35c148421
	.xword	0xcb37e7dbd77ab07a
	.xword	0xd09b07da4ce02b49
	.xword	0x04ff6fec21b22a9f
	.xword	0x86aed3e01316d163
	.xword	0xd49f28e1f8386691
	.xword	0xf41f1328771e64dc
	.xword	0x491c5e3ee5b22e73
	.xword	0xaa50a13358612318
	.xword	0x54f4cb93471f7645
	.xword	0x5b778761cf73936e
	.xword	0x102e1c04c1a9381e
	.xword	0x5f7b5cc9d7307996
	.xword	0x150e7796e5078192
	.xword	0x41fb59bf2cc4a60a
	.xword	0xcfc544e4704b7e84
	.xword	0x91a1bf4be2775fdb
	.xword	0x50e538ffd29fc67e
	.xword	0xae8f55939df08131
	.xword	0xb549f4db41b77dcf
	.xword	0xc3f393b4656b767f
	.xword	0xeeaf7b45f99d44a8
	.xword	0x8cf8472eaf5f390f
	.xword	0x6832b4927877d54f
	.xword	0x0d828c7119a33801
	.xword	0x62f38a28d6a9484e
	.xword	0x7d43bd810e45fb7f
	.xword	0x5298eff1b665ae8f
	.xword	0x01f91795f344b93b
	.xword	0x9718edfc225453df
	.xword	0xb39a668b35b197fe
	.xword	0x878dd0da9ac85918
	.xword	0x15945b51970ec066
	.xword	0x95f8f2fd5dbe89fc
	.xword	0x47b065f8ad64251b
	.xword	0xb5a51d3c0744acb6
	.xword	0x71de534b1622c7ea
	.xword	0x2a3e844352e63d94
	.xword	0x0d005851d044f797
	.xword	0x437eaec02dc5b4c4
	.xword	0x0e8d6110ef6b5883
	.xword	0x294e13a6964a4919
	.xword	0x0f549f4f7849beed
	.xword	0x8025ecef80fd48d2
	.xword	0x2a5af3fe42f1cc1e
	.xword	0xeab41da078eeeade
	.xword	0x4b8394845044804b
	.xword	0xfbc4e0d7e1412aac
	.xword	0xf3c3e086393063c3
	.xword	0xd29fa0b5364444d5
	.xword	0xaa16e27b2939200f
	.xword	0x061be4b9847870ad
	.xword	0x995a2d1f9ed3ff22
	.xword	0x31057a4339efd32c
	.xword	0x75d986236e9b0320
	.xword	0xeb2500124e4d5936
	.xword	0xa47271ecd5767d26
	.xword	0x5bed6a7a03fb2bbc
	.xword	0xe6ea07e5cde5e7e9
	.xword	0x46aace59629a08d4
	.xword	0xbf6e955579eb26c5
	.xword	0xf61a1b1065c1445d
	.xword	0x915b319ca2f609e6
	.xword	0x779e467f8cc531a8
	.xword	0xcfe7680d2a8f173d
	.xword	0x4dd6d509e0de7889
	.xword	0xfa625eac4e96d346
	.xword	0x70b1ca2c17c2d72f
	.xword	0x69a3d088cd8a07d1
	.xword	0x78910262214db7c4
	.xword	0xce3b519206a22708
	.xword	0x83bc941c927297d8
	.xword	0xc29c9698e4b93c11
	.xword	0xad6073cd75947b35
	.xword	0x238923fcf9730679
	.xword	0x1406a6c3a0850f27
	.xword	0x042365b368018689
	.xword	0x9419ddba1a38b966
	.xword	0x2c63bc36c693837d
	.xword	0x1255e4f4a2dfd5b0
	.xword	0x362189898d1a8668
	.xword	0xaab5eb330598b545
	.xword	0xc1183896a59b2f5c
	.xword	0xa0653f62ddf06ca8
	.xword	0x5b7d6dd55d648969
	.xword	0xe3a418b1caaf7cea
	.xword	0x11d4b98afd2b37e8
	.xword	0xa46fa70b607b23cb
	.xword	0x2946285c047e4a95
	.xword	0xe5588e6f90866ac1
	.xword	0xd14e14c1c4fad896
	.xword	0x8bcdf4126f30ac98
	.xword	0xa62bff109453b9dd
	.xword	0xcac4d2089ecba6e4
	.xword	0xc01b4066489338f2
	.xword	0xa0af580fa26edc61
	.xword	0xae79b28ce8a5d69e
	.xword	0x22a359bc987119af
	.xword	0xe35c980826e489e7
	.xword	0x307a8846cea90f13
	.xword	0x9c60aaaafd39d202
	.xword	0xc24ac516c30dc20b
	.xword	0xd040be16535807bc
	.xword	0x871c363a5f20901c
	.xword	0x6f597f1e9d4878f7
	.xword	0x37b39e744e321ec7
	.xword	0xaecb6fb4094cdb5f
	.xword	0x1cee9aa3e6b30d58
	.xword	0x19cc8d1f1f4bdc08
	.xword	0xe6aa6aa2e1c907f0
	.xword	0x68b2ed684f42f2e9
	.xword	0xde246295cf819c49
	.xword	0xa4d21b03b82e5aa0
	.xword	0x1f47ec374fc2f741
	.xword	0xbce89280db8ebcfd
	.xword	0xacdbb718124aa32f
	.xword	0x459a3eb7f7dd82a9
	.xword	0xad11d982a5ce7d89
	.xword	0xe3f568a74467f379
	.xword	0xa5ea6d5879d26d21
	.xword	0xdd82e7711200a025
	.xword	0xe5a402fb02cea338
	.xword	0x88971f0bcc4cbb3d
	.xword	0xea45429ecf617803
	.xword	0xd979c09b2506dbd1
	.xword	0x5af79793ca082d98
	.xword	0x1fc6187caa4f7300
	.xword	0xe14aafa59e2a79d2
	.xword	0x480232f713eca234
	.xword	0x6f431fcc6582b537
	.xword	0x6269537ec3baca4e
	.xword	0x1a31bbd68b038364
	.xword	0xe3bc35161b9fd849
	.xword	0x2637d4618e92a070
	.xword	0xeb54b3ef570e976e
	.xword	0x3c906690cfcf5692
	.xword	0x753c5fa2aae937d6
	.xword	0x03fe2970ec289f86
	.xword	0x6cf1e276d62ea567
	.xword	0x92b7bdf0963754b0
	.xword	0x03d4cd0c452d4c8f
	.xword	0x6c9a99fc70e5197f
	.xword	0x2512820635e8f718
	.xword	0xca48c667fcfa25ab
	.xword	0xd3c7f82c88cf2799
	.xword	0x26c9766d56acd232
	.xword	0x09401a41284ffb1b
	.xword	0x2e0e7ff0f7633d34
	.xword	0x161d4cb2d1734955
	.xword	0x3554a5e1c47969ba
	.xword	0xb16d8e0025af2708
	.xword	0xc61dd38003017d0b
	.xword	0x255bc0ebe3caa6f8
	.xword	0x3deed000854bda3b
	.xword	0x4f64a4c68a725f3f
	.xword	0xbe9dbed3d7ce0a46
	.xword	0x00e7e0a734fea585
	.xword	0xca178551b25f0215
	.xword	0xa0dbc90766355f9b
	.xword	0xf2aaf07ad251c0d0
	.xword	0x9c7604ddbf2c426b
	.xword	0x8f3a45c8c4199e7e
	.xword	0xd1eaf60205ee93a3
	.xword	0x1c942f17a1e85481
	.xword	0xe3b6ca67600dc532
	.xword	0x8785753cb1dba6ee
	.xword	0x6934924cf0b804bb
	.xword	0x80928f2dedd72205
	.xword	0x57da53f2a42936e9
	.xword	0xa36686bb9d2453d3
	.xword	0x3376565ce4be6387
	.xword	0x77a8b0b3855db6d9
	.xword	0x8aad874d66d4f450
	.xword	0x5c6c6706169d4871
	.xword	0x4fe5d030be79ed04
	.xword	0x169423c135dc3fd9
	.xword	0x22d89e9d6abb1136
	.xword	0x914775618f0b99b3
	.xword	0x35a45bdf5e0a38b0
	.xword	0x7e370f38219dd8b3
	.xword	0x9994fea5fe64d8f8
	.xword	0xec5331400834a170
	.xword	0x9b95fb2c021756a5
	.xword	0x19af58902248f782
	.xword	0x2b1bb0a51597d7c3
	.xword	0x008de2682e518e6b
	.xword	0xca8e6cfca653b1c4
	.xword	0xbf286a8084c6e388
	.xword	0x6b20a1ce46ef5fe0
	.xword	0x8692b44ab51c1723
	.xword	0x24b3599c680f38fd
	.xword	0xdf996af9dc65e22a
	.xword	0x099beecbf98a1c41
	.xword	0x2288ee874af92983
	.xword	0x970a22b5584b923b
	.xword	0xd7a9576e881cc451
	.xword	0xa273ed7f28594d1e
	.xword	0x08932701751ca4d1
	.xword	0x2c19feccdf29df1d
	.xword	0xa99e44ccb2e33b31
	.xword	0x78d20e59b65ad007
	.xword	0x8c5c532c46cbf0c1
	.xword	0xdc2c7cd2c28ac27a
	.xword	0x4aa950934c20044c
	.xword	0xc8e4c2aa48aab20a
	.xword	0x4b3681f25b3a922d
	.xword	0x8439849a0c28e945
	.xword	0x98c02f7c388620d1
	.xword	0x73e7f2de0147e9b1
	.xword	0x8540536279be8908
	.xword	0xde7c932249ede4a2
	.align 0x40000
	.data
data_start_6:

	.xword	0xe2f039d1e2fa3af6
	.xword	0x99cd56582a0b7e40
	.xword	0x6d6c69dd30cb77c6
	.xword	0x03164eaca9cdfd4c
	.xword	0x590484fd9bf9adb6
	.xword	0x976eb545f88f1611
	.xword	0x41dc1e8d9e6140b9
	.xword	0xe6c923cf7a84d4b8
	.xword	0xff35c80147773e4c
	.xword	0x3388c985f5dfafbe
	.xword	0xf426140bd437ec22
	.xword	0xca202f4c80b74e4b
	.xword	0x5f000a6f98f98a7e
	.xword	0xbe10a8996bd1e6d7
	.xword	0xce6fec49989f3022
	.xword	0x7ffacecedde3905d
	.xword	0x1f8bb6833b4d3f01
	.xword	0xad62f6fd4581340d
	.xword	0x3e2755981a3f6005
	.xword	0x6d1a37953abc7c7e
	.xword	0x1e8621c4c0316ec0
	.xword	0xf091fb4911a20fb2
	.xword	0xaaf613a3fa752abb
	.xword	0x83ccaf9918531c2c
	.xword	0xb165d74dcde6ff89
	.xword	0x4158e83518e4154b
	.xword	0x83a36c2913f44040
	.xword	0x7fc0118392e66572
	.xword	0xc2c78cd5bc078350
	.xword	0xebbf65b7009051d9
	.xword	0xf85fb5c3facde579
	.xword	0x18f214d37d7a6d19
	.xword	0x59da287e79b9dd9b
	.xword	0x42647ed6e1e92c1a
	.xword	0x7ee18471cf6ff9bb
	.xword	0x11fc802afa3b39b5
	.xword	0x5e381a587970a35b
	.xword	0x391ed57a96eba655
	.xword	0x75cf2973389b9bd3
	.xword	0xc60ae2a1d7c31fcf
	.xword	0x38f57ce9e3f2e835
	.xword	0x3c673ec23fa251de
	.xword	0xb2a44c1c5d6a229f
	.xword	0x0c8fe07a4c957d28
	.xword	0x2c18312bdabff2a6
	.xword	0xf7705c0ada827a07
	.xword	0x86c7f167a9db2442
	.xword	0x91585d6dd2923893
	.xword	0xab0464c5b3c3879b
	.xword	0x0676b56b8cf2eab1
	.xword	0xcb0bd8aba5c0934a
	.xword	0xc11a4cfb5de86bfc
	.xword	0x4ffb3c8b948286d8
	.xword	0x45c6411ddc56e6fd
	.xword	0xc70f80eef466fb62
	.xword	0x0a58eca9d33fa200
	.xword	0x79671a3dceb31670
	.xword	0x97559cc6ae62efaf
	.xword	0xea19fb2431111289
	.xword	0x7c9908039ea5cafd
	.xword	0xeddc16f10290dd1d
	.xword	0xbf2673f641ce94e8
	.xword	0x78d736774124dc24
	.xword	0x9c121d7ff219d7b7
	.xword	0x1857f21ef18a5487
	.xword	0xa755f3831401c5ae
	.xword	0x6f22c24512ef17f1
	.xword	0x85d6645530b5defa
	.xword	0x6d2e64d96be87eba
	.xword	0x190bf019c824c083
	.xword	0x264723c67e9cec5a
	.xword	0x4219851d1001255b
	.xword	0x1238bae04dcf5d15
	.xword	0x2fc8a39a1139b401
	.xword	0xa63660e9815646ec
	.xword	0x41a9c2424b851e2f
	.xword	0x4bdb7b1c01b7491a
	.xword	0xcf468493325bf71a
	.xword	0x8d77997c0b7680ac
	.xword	0x903ad3e5b922d953
	.xword	0xc5a960deb6132b99
	.xword	0xc1bfd5008cf7b4ba
	.xword	0x5a44094af63fee55
	.xword	0x1824e513ae0c0cdf
	.xword	0xa30b30fb105174a7
	.xword	0x6e9ababa61271103
	.xword	0xdc282e4f01198f47
	.xword	0x195de4212f77f739
	.xword	0x8ccf6fb3549de46b
	.xword	0x743b2c39bb102f29
	.xword	0x44ffaeb45760f600
	.xword	0x48ba942783605321
	.xword	0x94ec3c75f39a5bd4
	.xword	0x484aaf52f6f6e32d
	.xword	0x5fa694bcb5090fa3
	.xword	0xf122004b2ba9347b
	.xword	0xd54f9fc442477263
	.xword	0xfc51dfcb14b3f4be
	.xword	0x5e1038c6f925df69
	.xword	0x5c5e904558cdceb5
	.xword	0x90d44eca200af7be
	.xword	0xc687015d5924d511
	.xword	0x6ecc0028b920c04d
	.xword	0x10d6e9708c59279c
	.xword	0x615c6b13227247c3
	.xword	0x2f0bf60882c0e25f
	.xword	0x2cae7f2aa21e7ae1
	.xword	0x220aa2b7868bf88d
	.xword	0xb2e14590a9741b48
	.xword	0x49a3e81515f50664
	.xword	0x3ae6ad5c46832dc2
	.xword	0x6bd1d2e1266c9322
	.xword	0x72692c24caba8e77
	.xword	0xee7623a809adf5b0
	.xword	0x4ffb27bc6d35cc1e
	.xword	0x73e5ede60d1f28c9
	.xword	0xc7767b3c5caa8802
	.xword	0xe54e7b6e5c7e6923
	.xword	0x31d13d1929a287f4
	.xword	0x5b1c4a0ea9447942
	.xword	0xb7584afd5c3fbb45
	.xword	0x0c459b3ffff6f43c
	.xword	0x7caf35a9533ae75e
	.xword	0x0e2d6fff98b0670f
	.xword	0xa99659849d1df405
	.xword	0xce5489646f2a166e
	.xword	0x1df460b132aae2fb
	.xword	0xc9ed5ef15145ae3f
	.xword	0x697ae06a29b32c75
	.xword	0x4f744cad30565844
	.xword	0x7f9060f8ed3bada9
	.xword	0x1909c7b6d640f4c8
	.xword	0xee7651e7e852a333
	.xword	0x54208a743a5cee4e
	.xword	0x8c2c2b2e5b2f2224
	.xword	0x715ae093309eb51f
	.xword	0xc301d46695e33cf1
	.xword	0xe60d967744cb7190
	.xword	0xb4474703c680f009
	.xword	0xb544c799f8f392cb
	.xword	0xfeece8a566f11b87
	.xword	0x2d221eb546cd3b9f
	.xword	0x4c392c873edd7b57
	.xword	0x07c40c27a74f78d8
	.xword	0x368beb7deb29c38e
	.xword	0x358db7150e73ccdb
	.xword	0xeaebd8a46c6ee54c
	.xword	0x5572028be190bb06
	.xword	0x615f56108baa09ee
	.xword	0x2d35deb5c5db2b05
	.xword	0xb323fe96ef8066c6
	.xword	0xeb8742c24477c9ab
	.xword	0x386fcd45571926c9
	.xword	0xd9fa59ec5c1ee6b4
	.xword	0x03cbe558d54fe556
	.xword	0x0ad803093d28309c
	.xword	0xd4c7ccf5f97493e4
	.xword	0x1a8f01f6433bd1d3
	.xword	0x3def8082d0f5cc13
	.xword	0x04cff3fe56b440ba
	.xword	0x7ef17a8358153252
	.xword	0x4a6e224586bff705
	.xword	0xa30560f048f3b96e
	.xword	0xe23805765e40f140
	.xword	0xec477a755c2fee7c
	.xword	0xa3d12a5a2a528de6
	.xword	0x4edd2fb7f27c195c
	.xword	0x24b4e62ca8ddfc9e
	.xword	0x87f61fe37a9c3307
	.xword	0x70247bb5a0f641ff
	.xword	0x4cc42c67a1656ea1
	.xword	0xbaf35b24af9c4969
	.xword	0x1360e96362535b29
	.xword	0xb958d70a24256407
	.xword	0x19fcd74ec2c1fac3
	.xword	0xec23f30581581a5f
	.xword	0xc9d0c7d161b22135
	.xword	0xa987232c3a2f15f7
	.xword	0x3f5b1ceb376abe1d
	.xword	0xa1f1b5b4921bb9b4
	.xword	0x53b6a5dc6e58f37b
	.xword	0x829cf021896bbaf8
	.xword	0x00debaf60ea60aef
	.xword	0x332c097606eb8936
	.xword	0xee6236e919569d69
	.xword	0xa278bb71dbdf105c
	.xword	0x073a0d6c8877c793
	.xword	0xb26cf5873a31956d
	.xword	0x83df9cf4e5ca789b
	.xword	0xb2bdc5ca34a1771d
	.xword	0xbc88a9e46bd75b9f
	.xword	0xb5ae9db0609862b4
	.xword	0x758c5555db39b61f
	.xword	0x795ebac156295de1
	.xword	0x6eca5ef717199189
	.xword	0x1c28d48cc89a4658
	.xword	0x6569df6c75c064bd
	.xword	0xc98e5f1f86ade5be
	.xword	0xb4c2e6fb09e00db7
	.xword	0x3710a19475b70212
	.xword	0x26ee28262cd00f05
	.xword	0xedcb531259a585ee
	.xword	0x51972bb9d13384e2
	.xword	0x768be310d2992211
	.xword	0x7d4e73762db56bf3
	.xword	0x6e047fb2ab440620
	.xword	0x1c01d4399f526a8b
	.xword	0x644fb764ccdb9662
	.xword	0xfb53861fced5c74f
	.xword	0x630d9fb8724cc724
	.xword	0xde5e0dff9b66a73f
	.xword	0x8513aed89191ebee
	.xword	0x27990f83ee0df3e9
	.xword	0xf6bb2ca91b476cac
	.xword	0x284f3a90012f4d13
	.xword	0x5b1780b2563e03c6
	.xword	0x24a8b59fe7880ae3
	.xword	0x22a6776ce05bcd8b
	.xword	0x724ab3007456dff5
	.xword	0x5cffcee069e899a8
	.xword	0xc7139e1f4d098a89
	.xword	0x648664ad251b0ea2
	.xword	0x314f4ef55c468b2d
	.xword	0x58571e69d071caef
	.xword	0x400b2d515308e93b
	.xword	0xda128292a6ccfa82
	.xword	0xaa8666e55f5a23cd
	.xword	0x3a38297604633dde
	.xword	0xbef77816baf9c027
	.xword	0x8befcc5b60c93e29
	.xword	0xd1a2dc1c46999742
	.xword	0x3b82a02ee5c35e84
	.xword	0xb54b9bb2bd677529
	.xword	0xbc66bc1c7243a320
	.xword	0xaa93ee03f87cf91e
	.xword	0x3fa837b22b1c56c1
	.xword	0xf88a31c9834ddef2
	.xword	0x3a7014a13cec0f70
	.xword	0x42566efb7d20a842
	.xword	0x1addfd6918163720
	.xword	0x3f3f9cee190d9222
	.xword	0xbe61cb260be7500a
	.xword	0x69e3ae2e3a7ea8e8
	.xword	0x105a556c46f13fa7
	.xword	0x79972a2a4c863d8d
	.xword	0xefff206522cda8c1
	.xword	0x7aa00c5e9160ef3c
	.xword	0xad0224704f2281ec
	.xword	0x1946a412c6ca520f
	.xword	0x0afe2d92f5571acd
	.xword	0xb26962dd9d60b941
	.xword	0x76676af9a6af4d27
	.xword	0x1546ebe009bd0292
	.xword	0x04d009a539759a86
	.xword	0x9de79fd68e24be8d
	.xword	0xda37a303b0c03af7
	.align 0x80000
	.data
data_start_7:

	.xword	0xfe0a16d5bf661a22
	.xword	0x8491c992795c4b6b
	.xword	0x3456a8822dec7937
	.xword	0x6780af956110386d
	.xword	0x675d95e9ebc0d721
	.xword	0xffbb970ee39d774a
	.xword	0x364b928e6b14f987
	.xword	0x3b50960957fe85f3
	.xword	0xcebe47ea3a453446
	.xword	0x17a663773d0e03d9
	.xword	0xd7f70d1a5244720f
	.xword	0x5b421ead9e8d8205
	.xword	0xf4b459374e099f38
	.xword	0x2989c1e444b11da4
	.xword	0xbebaf29090416a13
	.xword	0xe4d0f5ab4b075dca
	.xword	0xe129c9333a28858d
	.xword	0x86058e8d575956fc
	.xword	0x827a26fa357ead70
	.xword	0x3e7e3135d5cba163
	.xword	0xfe7ce3f8692d953b
	.xword	0x78f3246699ec1be4
	.xword	0x8dd976c4de4ac87b
	.xword	0x8badedf9fcafc3c2
	.xword	0x5ae76db781d7c221
	.xword	0x00e69d8c80ed533e
	.xword	0x058bba806fa1144d
	.xword	0x924d86698380bacd
	.xword	0xaaedab22a7adfdc0
	.xword	0x689e52a641196e7f
	.xword	0xce4722f2dd64db6d
	.xword	0xb3d9c48d48cb6f9e
	.xword	0x85540fb1b9c89841
	.xword	0xb2f235685e567271
	.xword	0x9b0321fd71fb5cf3
	.xword	0xf2ff00df4536e17d
	.xword	0x274d4027f5972194
	.xword	0x38c470dadebd6c0e
	.xword	0x514279585199befe
	.xword	0x2420cea742673ce0
	.xword	0x6989adec351a301a
	.xword	0x7394ac3a850e3d07
	.xword	0x88d5623bf03f94e8
	.xword	0x937817df226efdc0
	.xword	0x709efd39ca54cded
	.xword	0x054bd99589b24bbf
	.xword	0x7e9b44da52b14b30
	.xword	0x80872290d429124d
	.xword	0xb7ddd08979be4863
	.xword	0x09129422befda3da
	.xword	0x40d9ddeeefa3957b
	.xword	0xe86d889ab138ba86
	.xword	0x4b85d5e4ae8e4b64
	.xword	0x0412ee6dd3162adf
	.xword	0xe9549d5342819c9e
	.xword	0x89a23b5a330a118e
	.xword	0x6f49ec2925fe5e9e
	.xword	0xfe765ad712797bca
	.xword	0x97e32396d5e47f20
	.xword	0xa03194984de5d3f4
	.xword	0xf8179059dca33428
	.xword	0xb9951ae1ab18e6a0
	.xword	0xe828ac046a1b0fbe
	.xword	0x517ae008edddd900
	.xword	0x52e8311a9404e105
	.xword	0x9d3f6685f2eb2923
	.xword	0x6ba22d54ae5f64c0
	.xword	0x7af9e60a8dc69a4d
	.xword	0x63c5f550988c878f
	.xword	0x34d18fba66141f3c
	.xword	0xa213c34ef9742ba7
	.xword	0x984afd6f56be9b7c
	.xword	0xd64b7882ed8be128
	.xword	0xe453f4025531114e
	.xword	0x7590cbd4f0af6437
	.xword	0x44d3795d8fa6029c
	.xword	0x1a219bad9f62ec87
	.xword	0x993849da61f6cb7a
	.xword	0xefc036715292a997
	.xword	0x93cbe2e48b7826b1
	.xword	0xe570f992ee891221
	.xword	0xcbe44d6e123cc0f1
	.xword	0x73717e9922524c02
	.xword	0x99dede6b1caa7956
	.xword	0x48eeeadab4a41375
	.xword	0x1500cb56e267ed07
	.xword	0xa1d5ee62a464c91c
	.xword	0x9695cd0c64c1cf2d
	.xword	0xf786fda9bb03862d
	.xword	0x469e418339764651
	.xword	0xa5590820309a37d2
	.xword	0x010d541247f8da13
	.xword	0x30c93af70c3ba126
	.xword	0x878b93d9d730d3c3
	.xword	0x6f1f7a8ce8ce775d
	.xword	0xcd5c80a5ef582a4f
	.xword	0x91630343d547377a
	.xword	0x28fd8d86cb422cea
	.xword	0x209c50ab6b0c549b
	.xword	0x6d1cfbca5039e968
	.xword	0x8d3bf7a224a1dbfa
	.xword	0xc43fa48dad3751df
	.xword	0x2413bf34922c751b
	.xword	0xb6315f45e6d65530
	.xword	0xc4bed5c1ad0c5269
	.xword	0xb3366db28e2ccb2e
	.xword	0xadda38f0c8d2107b
	.xword	0xa056b658013ccba0
	.xword	0x2b0c3a649bbf195f
	.xword	0x61b440bcb866eeb2
	.xword	0xc4dae2ee9cc1f71f
	.xword	0x7f68b2c7518165bf
	.xword	0x3d354d45418095f0
	.xword	0x836a5f3f8d74f06a
	.xword	0xd8e2583316cae5fc
	.xword	0x9bb9b4bd2aa6e063
	.xword	0x7cc1dba5a7de7ae5
	.xword	0x0b580702e55c308d
	.xword	0xa599b6156559bada
	.xword	0x15e5d43100e5cd21
	.xword	0x2304b62c1c0e04ed
	.xword	0x6bdd3ce36ed6c519
	.xword	0x12cde90d50b40e37
	.xword	0xf9b77c249e07f316
	.xword	0x36874eed380f61c5
	.xword	0x6a31f026d6d3c84f
	.xword	0x4406acb3a4238c87
	.xword	0xc6436e32ba89b9ef
	.xword	0x6aa709e889214013
	.xword	0xc15de12ae4217afb
	.xword	0xc07964b33edd0acc
	.xword	0x5c25530b1640324a
	.xword	0x5e1dea1cd23a0ca8
	.xword	0xaab46fb19be7970c
	.xword	0xcf58c333b5ae8cde
	.xword	0xa19e6794057d21d0
	.xword	0xede028f3f24aa7b5
	.xword	0xee6889d82f759fa8
	.xword	0xe9ac2bd11d196558
	.xword	0x7c69adc407250159
	.xword	0xaab81086350695f6
	.xword	0x743861b843c11f66
	.xword	0xcdce41426b3d38b1
	.xword	0xfd571caedc246eff
	.xword	0xeced9cd26e538eab
	.xword	0x011f5701013fe3ec
	.xword	0x8cb99ab095fd0fc6
	.xword	0xc5ba8f0b3063c436
	.xword	0x273627c41856ed13
	.xword	0xe270abcf72b7d531
	.xword	0xbdad13f4cb7682b0
	.xword	0x8ba3f540422a846b
	.xword	0x85d502f06a68293a
	.xword	0xc3be244a021b2110
	.xword	0x4f17f06d3b835cc4
	.xword	0xc0f6a554d84da454
	.xword	0x23489a86dded4d64
	.xword	0xcf83f552352f107b
	.xword	0x4e57f94b2c8cf30b
	.xword	0x2b675f740724c636
	.xword	0x80c457e41310edea
	.xword	0x14eef46c16b84274
	.xword	0x3352d08a44edfdfa
	.xword	0x5818408f796a8068
	.xword	0x4cccfb2b99834a48
	.xword	0x10cf0d9717504b29
	.xword	0x11ed13d1b5f345ed
	.xword	0x7f6284e5e021cfab
	.xword	0x21174a7c497275d1
	.xword	0x3a3a0eb5a13215ec
	.xword	0x78182d3cd322e1d0
	.xword	0x2befabad1f18c7b4
	.xword	0x7c13151d18abdb3e
	.xword	0xfb7628fabcac612c
	.xword	0x398ea7586e27393a
	.xword	0x46ffd549fe84f5fd
	.xword	0xf4c1709ef115605e
	.xword	0x56092d572437ee41
	.xword	0xd8db11d4011d5a36
	.xword	0x137dfa1658dd0c95
	.xword	0x044979e06ce103a1
	.xword	0x07ab3b8a3b64c7f3
	.xword	0x39e0babdff8105d4
	.xword	0x5cb77c1d1f7cb4ef
	.xword	0x43990c66ec678484
	.xword	0x8b702810d245f774
	.xword	0x5426ccd5fff37c11
	.xword	0x33fd2205c5396109
	.xword	0x586f661f6559df29
	.xword	0xc886fee441f18404
	.xword	0x122a1f2f25a72855
	.xword	0xa4cbe0ffa666292c
	.xword	0xd396fc4a422d579b
	.xword	0x7549d2b3dffe0db3
	.xword	0x9b282f10732f80c6
	.xword	0xed91f7dad867b6c6
	.xword	0xf5ce50a3ba4eb081
	.xword	0xfb5fd86c6aa15947
	.xword	0x8a36fb00661c1a56
	.xword	0x7cfc656583452e45
	.xword	0xddfef3110f5d9828
	.xword	0x0257c5811722ff01
	.xword	0xadc6a9e38c03f185
	.xword	0xd142cb22beb3031d
	.xword	0x1fe2a07d76ee42e2
	.xword	0x8fb7be91d24c134b
	.xword	0xdf5b334e58d92600
	.xword	0x1541be6e78339352
	.xword	0x175e59340604790f
	.xword	0xa7c70769b392445b
	.xword	0x28916f7cff544c84
	.xword	0xe43dc12b7597f750
	.xword	0x409f8436fd58c4a5
	.xword	0xf2aeafd9f8f5f1e5
	.xword	0x8b8eff4b057061c7
	.xword	0x6c0f7525701ffefd
	.xword	0xf6661e6bef3a9805
	.xword	0xa09b8d0debdbbf2b
	.xword	0xd3dd5b66059c171b
	.xword	0xb79372fbf4f89f9b
	.xword	0x2efdf4e42e5ae9f6
	.xword	0x2fba6fb3deea46d9
	.xword	0x3886a7023c89f264
	.xword	0x87dc9e6e900a94d0
	.xword	0xd07cd68f532225e1
	.xword	0x21dedbb5dd5b4a9e
	.xword	0x870e6e05c6cd054f
	.xword	0x6107fe7247bda200
	.xword	0x38992e54d46c2a08
	.xword	0x6262b7307d3c00d8
	.xword	0xe96d72cf2e77ca2f
	.xword	0x926bf9074f52d9e0
	.xword	0x0a7f35e7442b2029
	.xword	0xe7b4d2a88b5d6a6c
	.xword	0xff4727aa6544e1ef
	.xword	0x0d2b3a4c7b236ebb
	.xword	0x01131f513143c028
	.xword	0x80c19f765712986a
	.xword	0xabeeb4ab58d370a0
	.xword	0x4dea76deca513784
	.xword	0x965cde6f8712b8fd
	.xword	0x8ec0f4f9802b9008
	.xword	0x87974d021302877d
	.xword	0x0b7bb778e71e1c5f
	.xword	0x21f74a729ddb4363
	.xword	0x57e9ffd77e885a05
	.xword	0x1d34e20b7b84816b
	.xword	0x894680e21aa8af3d
	.xword	0x7d31ae61067da360
	.xword	0xed9dab5c116bca5c
	.xword	0xfb2ad02ea758eeef
	.xword	0xad4faa0a82a53f01
	.xword	0x6ed7a02719d88a92
	.xword	0x5c583d5e5d13f7b8
	.xword	0x5221a6bd95fe0db8
	.xword	0x71e3cb0fe430fe7f



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
