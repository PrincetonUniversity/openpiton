// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_72.s
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
   random seed:	537811279
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

	setx 0x50113ad16d4d421a, %g1, %g0
	setx 0xcebaa82f37f788dc, %g1, %g1
	setx 0x1c8ab585bd564a93, %g1, %g2
	setx 0xfa491340e45828cb, %g1, %g3
	setx 0xaf74fa67ae868a7e, %g1, %g4
	setx 0xc669cc91958f9435, %g1, %g5
	setx 0xd309899e2b2845dd, %g1, %g6
	setx 0xca6d72ded9780cbe, %g1, %g7
	setx 0xa3f23eefbaddf422, %g1, %r16
	setx 0x3de0e391c36d28a5, %g1, %r17
	setx 0xf563be7ce718de6a, %g1, %r18
	setx 0x2861d3588ff0c9b1, %g1, %r19
	setx 0x5c3809a70fd9b7a1, %g1, %r20
	setx 0x072e98467f407332, %g1, %r21
	setx 0x5f2645c3d4f06890, %g1, %r22
	setx 0xf5c6c76f78d297fa, %g1, %r23
	setx 0xa00d0216b7053351, %g1, %r24
	setx 0xa8a202e63f46fa93, %g1, %r25
	setx 0x0a333348b9018ea5, %g1, %r26
	setx 0x8980caf0f5c7dcdd, %g1, %r27
	setx 0x0b7d93ed530bcdf0, %g1, %r28
	setx 0xc1b0eee63029834a, %g1, %r29
	setx 0x2eedc39304dbc3ae, %g1, %r30
	setx 0x7af99c427107606b, %g1, %r31
	save
	setx 0x7a0b30a167f368b1, %g1, %r16
	setx 0x94bf8f8f37b38a1b, %g1, %r17
	setx 0x0f03d2a188f2e79e, %g1, %r18
	setx 0x9f925143f79f779c, %g1, %r19
	setx 0xebbd019c768070c6, %g1, %r20
	setx 0xf23eae5c64895ff0, %g1, %r21
	setx 0xbe6a02d4dd2a7dc8, %g1, %r22
	setx 0x0e16dd99a98dc512, %g1, %r23
	setx 0x82bee4a11522ee06, %g1, %r24
	setx 0x5e9ad1d2b4a4c7fc, %g1, %r25
	setx 0x1041e37bbe09c895, %g1, %r26
	setx 0x38e72569b251bfdb, %g1, %r27
	setx 0xba0691eb2dd1f712, %g1, %r28
	setx 0xbf924880374bfad4, %g1, %r29
	setx 0x4dea7657867e9d99, %g1, %r30
	setx 0x39080153af6471b5, %g1, %r31
	save
	setx 0xa084fae09d37e1cf, %g1, %r16
	setx 0xde1966eaa5a0bb95, %g1, %r17
	setx 0x574f045e030a3a13, %g1, %r18
	setx 0x1d99ec8b94c023ce, %g1, %r19
	setx 0xfe694515d04b0227, %g1, %r20
	setx 0x677ed8d2ad24c79c, %g1, %r21
	setx 0xfc8ab497208ccf97, %g1, %r22
	setx 0x8d16e40744f16f49, %g1, %r23
	setx 0x7bc2a2d2388838a0, %g1, %r24
	setx 0x6d6b453de71cc187, %g1, %r25
	setx 0x22a43bc27bdc9501, %g1, %r26
	setx 0x019eb2eb1e66c41f, %g1, %r27
	setx 0xfeeb53b2e2fa10ff, %g1, %r28
	setx 0x81b6860402ffefce, %g1, %r29
	setx 0x37a1647e39137915, %g1, %r30
	setx 0xf04320312d81b1d9, %g1, %r31
	save
	setx 0xf5f042c67ed60319, %g1, %r16
	setx 0x9f7aa22d0796fc8f, %g1, %r17
	setx 0x278c9f16cb1e0254, %g1, %r18
	setx 0xae9ceaaccb4dec88, %g1, %r19
	setx 0x64b3facf6e645d24, %g1, %r20
	setx 0x6a4c36ded3227d9a, %g1, %r21
	setx 0x8a30385f87156c73, %g1, %r22
	setx 0x8f6fe280d22804f9, %g1, %r23
	setx 0xf91e1a4c982612fc, %g1, %r24
	setx 0x8e125ad2a55baf19, %g1, %r25
	setx 0x4b836e111f97a364, %g1, %r26
	setx 0x6ac2bbe9a25fe08c, %g1, %r27
	setx 0xb4c160e03be372d0, %g1, %r28
	setx 0x58200cbda431cc6f, %g1, %r29
	setx 0x12db6413eef03b2d, %g1, %r30
	setx 0x37696c78c6de5239, %g1, %r31
	save
	setx 0x012d681ffa740dc0, %g1, %r16
	setx 0x88201aef956efab5, %g1, %r17
	setx 0xecd8cda1f6756d80, %g1, %r18
	setx 0x387218af2d3312d3, %g1, %r19
	setx 0x07291130122520a8, %g1, %r20
	setx 0x558a400ef4d8df9e, %g1, %r21
	setx 0x0a3f7acaeafd8f85, %g1, %r22
	setx 0x4adb11a42111ccbc, %g1, %r23
	setx 0x48696da4636c99f5, %g1, %r24
	setx 0xe874f285088f18f3, %g1, %r25
	setx 0x004d888df48df102, %g1, %r26
	setx 0xb091c9c528e9c7c6, %g1, %r27
	setx 0x4eace39546c12949, %g1, %r28
	setx 0x196ee56949b82e80, %g1, %r29
	setx 0xf6e5154f7f5df51f, %g1, %r30
	setx 0xfc3c42558cadd3b1, %g1, %r31
	save
	setx 0xa540534349582ba9, %g1, %r16
	setx 0x8b106108537e598e, %g1, %r17
	setx 0x0c1d8217913ff273, %g1, %r18
	setx 0x60ceaadef58f3f13, %g1, %r19
	setx 0x0a7854dfbaed4b21, %g1, %r20
	setx 0xa803ead0ef264c88, %g1, %r21
	setx 0x2cc425ba8b7e79e1, %g1, %r22
	setx 0x1dac7bf7701d48ec, %g1, %r23
	setx 0x18102ffbc22cbd6e, %g1, %r24
	setx 0xa2288c11966538b8, %g1, %r25
	setx 0x35fb3c3c1ef6d9a9, %g1, %r26
	setx 0xd2116227c56f71c8, %g1, %r27
	setx 0x3b98aebab499e7cb, %g1, %r28
	setx 0xa26dd7cc62c08cc2, %g1, %r29
	setx 0xa37e6914d6fc05d2, %g1, %r30
	setx 0xe24e3bbb21aacb61, %g1, %r31
	save
	setx 0xa3a17db1fe39c3fc, %g1, %r16
	setx 0x02376a107890161a, %g1, %r17
	setx 0x213446d33c9279ef, %g1, %r18
	setx 0x9329f50ff202fa3d, %g1, %r19
	setx 0xd6bf6e6b16c0e3ed, %g1, %r20
	setx 0xb2b9472d4ca5b71b, %g1, %r21
	setx 0x5605ffaad59f42aa, %g1, %r22
	setx 0xc1b75604c819d79d, %g1, %r23
	setx 0x01e49fc16396f4c6, %g1, %r24
	setx 0xf5ea70cd128802d7, %g1, %r25
	setx 0xcf1ce20bceb4ad7e, %g1, %r26
	setx 0x423ece4556add7b9, %g1, %r27
	setx 0x6368322d7cff4b0e, %g1, %r28
	setx 0x590a2a51743f6540, %g1, %r29
	setx 0x82c938180c887cbf, %g1, %r30
	setx 0x2dc4d60287381d9e, %g1, %r31
	save
	setx 0xf556b14539ffab19, %g1, %r16
	setx 0x59ce9fe962b17ceb, %g1, %r17
	setx 0x0be6974f9aea2cc9, %g1, %r18
	setx 0xf3df1ec9800a2501, %g1, %r19
	setx 0xf7eced78325ab4a7, %g1, %r20
	setx 0xef4019add43e167b, %g1, %r21
	setx 0xc9a0f81764c47850, %g1, %r22
	setx 0xb70bb9bd105ec447, %g1, %r23
	setx 0x3738dc3dcdc9f5b8, %g1, %r24
	setx 0x57d51185221e5363, %g1, %r25
	setx 0xf5ad976b28044de8, %g1, %r26
	setx 0x9b20575d626238c8, %g1, %r27
	setx 0x90581c60515862ef, %g1, %r28
	setx 0xffea25ebd163c25c, %g1, %r29
	setx 0x18f7a29ff312abba, %g1, %r30
	setx 0x3e1072dec03480eb, %g1, %r31
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
	.word 0xb7e4e042  ! 2: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e42035  ! 3: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde5e132  ! 5: SAVE_I	save	%r23, 0x0001, %r30
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 31)
	.word 0xb1e461f4  ! 11: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e4216f  ! 14: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x99c4d4190000da1c, %g1, %r10
	.word 0x839a8000  ! 15: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 0)
	.word 0x8995e0b1  ! 17: WRPR_TICK_I	wrpr	%r23, 0x00b1, %tick
	.word 0xb2c4a149  ! 20: ADDCcc_I	addccc 	%r18, 0x0149, %r25
	.word 0xb1510000  ! 22: RDPR_TICK	<illegal instruction>
	.word 0xbfe5e04b  ! 23: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe4a0e5  ! 26: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x8994212d  ! 33: WRPR_TICK_I	wrpr	%r16, 0x012d, %tick
	setx	data_start_0, %g1, %r23
	.word 0xb1e56179  ! 36: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1520000  ! 39: RDPR_PIL	<illegal instruction>
	.word 0xb1e4a0dd  ! 42: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e4619b  ! 43: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8194a1fe  ! 44: WRPR_TPC_I	wrpr	%r18, 0x01fe, %tpc
	.word 0xb3e461f1  ! 46: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde421a9  ! 49: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe56128  ! 52: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e5e035  ! 54: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5520000  ! 55: RDPR_PIL	<illegal instruction>
	.word 0xb7e4a01b  ! 57: SAVE_I	save	%r18, 0x0001, %r27
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbd51c000  ! 59: RDPR_TL	<illegal instruction>
	.word 0xbf643801  ! 60: MOVcc_I	<illegal instruction>
	.word 0x8194e1a4  ! 62: WRPR_TPC_I	wrpr	%r19, 0x01a4, %tpc
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 8)
	.word 0xb7e4e1d2  ! 67: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e4a0d5  ! 68: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb1e4a0ad  ! 70: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8395e0e3  ! 72: WRPR_TNPC_I	wrpr	%r23, 0x00e3, %tnpc
	.word 0xb9e4217f  ! 74: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb5e5a1dc  ! 76: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e46183  ! 77: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbf3d9000  ! 80: SRAX_R	srax	%r22, %r0, %r31
	.word 0xb43de15e  ! 85: XNOR_I	xnor 	%r23, 0x015e, %r26
	.word 0xb9e461be  ! 91: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbd50c000  ! 92: RDPR_TT	<illegal instruction>
	.word 0xbb50c000  ! 94: RDPR_TT	<illegal instruction>
	setx	data_start_4, %g1, %r18
	setx	0x30d0a66c0000fed0, %g1, %r10
	.word 0x819a8000  ! 97: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb1e4e0c0  ! 99: SAVE_I	save	%r19, 0x0001, %r24
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 26)
	.word 0xb9e42065  ! 103: SAVE_I	save	%r16, 0x0001, %r28
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb3e52061  ! 109: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb7e461c5  ! 112: SAVE_I	save	%r17, 0x0001, %r27
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 2e)
	.word 0x8d95e12e  ! 117: WRPR_PSTATE_I	wrpr	%r23, 0x012e, %pstate
	.word 0xbb480000  ! 119: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 20)
	.word 0xb3e4a141  ! 122: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde5a198  ! 123: SAVE_I	save	%r22, 0x0001, %r30
	setx	data_start_0, %g1, %r21
	.word 0xb5e4a15a  ! 125: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde5a094  ! 127: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x8194a073  ! 129: WRPR_TPC_I	wrpr	%r18, 0x0073, %tpc
	.word 0x8194e07a  ! 136: WRPR_TPC_I	wrpr	%r19, 0x007a, %tpc
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbfe560ee  ! 141: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbde52093  ! 143: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe5601c  ! 145: SAVE_I	save	%r21, 0x0001, %r31
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbde5a12b  ! 150: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe5a183  ! 151: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbb520000  ! 152: RDPR_PIL	<illegal instruction>
	.word 0xbde5203b  ! 156: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde4214c  ! 159: SAVE_I	save	%r16, 0x0001, %r30
	mov	1, %r12
	.word 0x8f930000  ! 160: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb7e56164  ! 161: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe560b3  ! 163: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x8395e1bc  ! 164: WRPR_TNPC_I	wrpr	%r23, 0x01bc, %tnpc
	setx	data_start_6, %g1, %r21
	.word 0xb2040000  ! 167: ADD_R	add 	%r16, %r0, %r25
	.word 0xb7520000  ! 176: RDPR_PIL	<illegal instruction>
	.word 0xbb508000  ! 179: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e56019  ! 181: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe5201a  ! 186: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5e5e1d9  ! 188: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb1e4a0fb  ! 189: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe5e068  ! 192: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e52147  ! 195: SAVE_I	save	%r20, 0x0001, %r25
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 17)
	.word 0xb5e56108  ! 198: SAVE_I	save	%r21, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e4a022  ! 205: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x8d95e18c  ! 206: WRPR_PSTATE_I	wrpr	%r23, 0x018c, %pstate
	.word 0xb1e5e110  ! 208: SAVE_I	save	%r23, 0x0001, %r24
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 3d)
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 21)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb4248000  ! 217: SUB_R	sub 	%r18, %r0, %r26
	setx	data_start_4, %g1, %r17
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 33)
	setx	0xe2ad7b9900003952, %g1, %r10
	.word 0x839a8000  ! 224: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e4e0e0  ! 225: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e4a128  ! 227: SAVE_I	save	%r18, 0x0001, %r24
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 26)
	.word 0xbde4a03c  ! 230: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x8d9561b1  ! 231: WRPR_PSTATE_I	wrpr	%r21, 0x01b1, %pstate
	.word 0xb2b58000  ! 232: ORNcc_R	orncc 	%r22, %r0, %r25
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb1518000  ! 240: RDPR_PSTATE	<illegal instruction>
	.word 0xb1540000  ! 246: RDPR_GL	<illegal instruction>
	.word 0xb9e421d1  ! 247: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe46184  ! 252: SAVE_I	save	%r17, 0x0001, %r31
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, e)
	.word 0xbfe5a0bf  ! 255: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb4bca114  ! 258: XNORcc_I	xnorcc 	%r18, 0x0114, %r26
	.word 0xbca4615f  ! 259: SUBcc_I	subcc 	%r17, 0x015f, %r30
	.word 0xbde5a1be  ! 260: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb61d0000  ! 266: XOR_R	xor 	%r20, %r0, %r27
	.word 0xbfe4e1f3  ! 268: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbd50c000  ! 269: RDPR_TT	<illegal instruction>
	.word 0xb750c000  ! 271: RDPR_TT	<illegal instruction>
	.word 0xb1e5a09b  ! 272: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb62d4000  ! 275: ANDN_R	andn 	%r21, %r0, %r27
	.word 0x91952133  ! 276: WRPR_PIL_I	wrpr	%r20, 0x0133, %pil
	.word 0x8d94e0f4  ! 280: WRPR_PSTATE_I	wrpr	%r19, 0x00f4, %pstate
	.word 0xbfe4207c  ! 283: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbf520000  ! 284: RDPR_PIL	<illegal instruction>
	.word 0xb7508000  ! 286: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e420a8  ! 288: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbc9de0e7  ! 296: XORcc_I	xorcc 	%r23, 0x00e7, %r30
	.word 0xb3e420d6  ! 298: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e4a1a4  ! 300: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb43460da  ! 303: ORN_I	orn 	%r17, 0x00da, %r26
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 3)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e56164  ! 315: SAVE_I	save	%r21, 0x0001, %r24
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 11)
	setx	0xd73126eb00001c53, %g1, %r10
	.word 0x819a8000  ! 318: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 34)
	.word 0xb17d6401  ! 323: MOVR_I	movre	%r21, 0x1, %r24
	.word 0x8995a10e  ! 325: WRPR_TICK_I	wrpr	%r22, 0x010e, %tick
	.word 0xbbe5a05f  ! 329: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e42135  ! 330: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x81946087  ! 331: WRPR_TPC_I	wrpr	%r17, 0x0087, %tpc
	.word 0x8d95216d  ! 332: WRPR_PSTATE_I	wrpr	%r20, 0x016d, %pstate
	.word 0xbd7c4400  ! 336: MOVR_R	movre	%r17, %r0, %r30
	.word 0x8395601b  ! 338: WRPR_TNPC_I	wrpr	%r21, 0x001b, %tnpc
	.word 0xb5e42072  ! 342: SAVE_I	save	%r16, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8195a16f  ! 346: WRPR_TPC_I	wrpr	%r22, 0x016f, %tpc
	.word 0xb1e4215d  ! 347: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbf500000  ! 349: RDPR_TPC	<illegal instruction>
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb5e46049  ! 353: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3e46197  ! 354: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3500000  ! 355: RDPR_TPC	<illegal instruction>
	.word 0xbbe5a02e  ! 359: SAVE_I	save	%r22, 0x0001, %r29
	mov	0, %r12
	.word 0xa1930000  ! 361: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5e5a136  ! 363: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe56196  ! 364: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb2acc000  ! 365: ANDNcc_R	andncc 	%r19, %r0, %r25
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb7e52112  ! 377: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe460bc  ! 378: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbfe4a030  ! 379: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb1e5a1a0  ! 380: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e5206e  ! 382: SAVE_I	save	%r20, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e5607a  ! 385: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e5a16f  ! 387: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x9194203f  ! 391: WRPR_PIL_I	wrpr	%r16, 0x003f, %pil
	.word 0xb5504000  ! 392: RDPR_TNPC	<illegal instruction>
	.word 0xb134e001  ! 393: SRL_I	srl 	%r19, 0x0001, %r24
	.word 0xb9e4e129  ! 398: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb88520a6  ! 400: ADDcc_I	addcc 	%r20, 0x00a6, %r28
	.word 0xb5e5a1c7  ! 402: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e42080  ! 404: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x87942181  ! 412: WRPR_TT_I	wrpr	%r16, 0x0181, %tt
	.word 0xb7e5a177  ! 414: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb3e521e9  ! 418: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb805218f  ! 428: ADD_I	add 	%r20, 0x018f, %r28
	.word 0xb1e4e1e5  ! 429: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e4e107  ! 432: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e46083  ! 440: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x89946197  ! 441: WRPR_TICK_I	wrpr	%r17, 0x0197, %tick
	.word 0xb7e42136  ! 442: SAVE_I	save	%r16, 0x0001, %r27
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 22)
	.word 0xb7e56138  ! 451: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x8795e175  ! 452: WRPR_TT_I	wrpr	%r23, 0x0175, %tt
	.word 0xb3e5a043  ! 453: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb751c000  ! 455: RDPR_TL	<illegal instruction>
	.word 0xb3e4e1d5  ! 458: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e521b3  ! 461: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde42168  ! 466: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e4219e  ! 472: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe5a0f1  ! 474: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x8594e1b3  ! 475: WRPR_TSTATE_I	wrpr	%r19, 0x01b3, %tstate
	.word 0xbde52191  ! 476: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe4a09a  ! 479: SAVE_I	save	%r18, 0x0001, %r31
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 12)
	.word 0x87946123  ! 488: WRPR_TT_I	wrpr	%r17, 0x0123, %tt
	.word 0xbfe521ea  ! 490: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1480000  ! 491: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbfe5e1c1  ! 492: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe4e130  ! 494: SAVE_I	save	%r19, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3e460e5  ! 501: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1e42028  ! 502: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x91956016  ! 503: WRPR_PIL_I	wrpr	%r21, 0x0016, %pil
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 1f)
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 38)
	.word 0xbfe4e103  ! 507: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7510000  ! 508: RDPR_TICK	<illegal instruction>
	.word 0x8794e070  ! 510: WRPR_TT_I	wrpr	%r19, 0x0070, %tt
	.word 0xbbe4a090  ! 512: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb2444000  ! 514: ADDC_R	addc 	%r17, %r0, %r25
	.word 0xb1e56116  ! 516: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e5611e  ! 517: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e4a1bd  ! 519: SAVE_I	save	%r18, 0x0001, %r28
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 21)
	.word 0xb1e5e1fd  ! 521: SAVE_I	save	%r23, 0x0001, %r24
	setx	data_start_6, %g1, %r22
	.word 0xbaac4000  ! 523: ANDNcc_R	andncc 	%r17, %r0, %r29
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 26)
	.word 0xbfe46072  ! 527: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e4618f  ! 530: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde4601d  ! 533: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb29d8000  ! 534: XORcc_R	xorcc 	%r22, %r0, %r25
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, f)
	setx	0x1ec5005000003bd2, %g1, %r10
	.word 0x819a8000  ! 536: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb3349000  ! 538: SRLX_R	srlx	%r18, %r0, %r25
	.word 0xb03c204d  ! 542: XNOR_I	xnor 	%r16, 0x004d, %r24
	.word 0xb9e4e180  ! 543: SAVE_I	save	%r19, 0x0001, %r28
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 1d)
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 11)
	setx	data_start_6, %g1, %r16
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb9540000  ! 551: RDPR_GL	<illegal instruction>
	.word 0xbbe42178  ! 559: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbe350000  ! 560: SUBC_R	orn 	%r20, %r0, %r31
	.word 0xb7e5600c  ! 565: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e5e19f  ! 566: SAVE_I	save	%r23, 0x0001, %r24
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 18)
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 30)
	.word 0xb1e4a125  ! 575: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e4a029  ! 587: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x8394e140  ! 588: WRPR_TNPC_I	wrpr	%r19, 0x0140, %tnpc
	.word 0xbd3d9000  ! 597: SRAX_R	srax	%r22, %r0, %r30
	.word 0xbbe5207e  ! 598: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb3e5a05d  ! 603: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e4a0ab  ! 607: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x42ef63ed0000688f, %g1, %r10
	.word 0x839a8000  ! 608: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbf500000  ! 609: RDPR_TPC	<illegal instruction>
	.word 0xb5e56163  ! 611: SAVE_I	save	%r21, 0x0001, %r26
	mov	2, %r12
	.word 0x8f930000  ! 612: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb884a145  ! 613: ADDcc_I	addcc 	%r18, 0x0145, %r28
	.word 0xbaad4000  ! 618: ANDNcc_R	andncc 	%r21, %r0, %r29
	.word 0xbd50c000  ! 619: RDPR_TT	<illegal instruction>
	.word 0xb8452157  ! 620: ADDC_I	addc 	%r20, 0x0157, %r28
	.word 0x89956025  ! 622: WRPR_TICK_I	wrpr	%r21, 0x0025, %tick
	.word 0xbfe5218e  ! 623: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e5206d  ! 628: SAVE_I	save	%r20, 0x0001, %r24
	setx	data_start_1, %g1, %r19
	.word 0xb7500000  ! 631: RDPR_TPC	<illegal instruction>
	.word 0xb5e5e073  ! 637: SAVE_I	save	%r23, 0x0001, %r26
	setx	0x27d4a8930000485a, %g1, %r10
	.word 0x819a8000  ! 639: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb40ce001  ! 641: AND_I	and 	%r19, 0x0001, %r26
	.word 0xbf500000  ! 642: RDPR_TPC	<illegal instruction>
	.word 0xbde420ca  ! 643: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e4e1bb  ! 646: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x8d94a101  ! 647: WRPR_PSTATE_I	wrpr	%r18, 0x0101, %pstate
	.word 0xbbe520be  ! 649: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e561e6  ! 651: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb6840000  ! 652: ADDcc_R	addcc 	%r16, %r0, %r27
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb7e4a154  ! 661: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbde5a05a  ! 663: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x859421d6  ! 665: WRPR_TSTATE_I	wrpr	%r16, 0x01d6, %tstate
	.word 0xb9518000  ! 669: RDPR_PSTATE	<illegal instruction>
	.word 0xb5510000  ! 672: RDPR_TICK	<illegal instruction>
	.word 0x8994a01b  ! 673: WRPR_TICK_I	wrpr	%r18, 0x001b, %tick
	.word 0xb9e5e14f  ! 674: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e560fb  ! 677: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x839460c1  ! 679: WRPR_TNPC_I	wrpr	%r17, 0x00c1, %tnpc
	.word 0xb7500000  ! 680: RDPR_TPC	<illegal instruction>
	setx	0xe6947d47000099d4, %g1, %r10
	.word 0x819a8000  ! 682: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7e460e1  ! 684: SAVE_I	save	%r17, 0x0001, %r27
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb7e4219d  ! 690: SAVE_I	save	%r16, 0x0001, %r27
	.word 0x83952195  ! 691: WRPR_TNPC_I	wrpr	%r20, 0x0195, %tnpc
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 31)
	.word 0xb3e5216a  ! 695: SAVE_I	save	%r20, 0x0001, %r25
	mov	2, %r12
	.word 0x8f930000  ! 696: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3e4e1d3  ! 698: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e42180  ! 699: SAVE_I	save	%r16, 0x0001, %r28
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, 10)
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, 3f)
	setx	data_start_4, %g1, %r21
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb815207f  ! 708: OR_I	or 	%r20, 0x007f, %r28
	.word 0x8d94202c  ! 709: WRPR_PSTATE_I	wrpr	%r16, 0x002c, %pstate
	.word 0xbde5a149  ! 712: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbd504000  ! 713: RDPR_TNPC	<illegal instruction>
	.word 0xb1520000  ! 717: RDPR_PIL	<illegal instruction>
	.word 0x8395e0b5  ! 719: WRPR_TNPC_I	wrpr	%r23, 0x00b5, %tnpc
	.word 0x8395a0d9  ! 725: WRPR_TNPC_I	wrpr	%r22, 0x00d9, %tnpc
	.word 0xb7500000  ! 727: RDPR_TPC	<illegal instruction>
	.word 0xb1e561bb  ! 729: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb48da09b  ! 732: ANDcc_I	andcc 	%r22, 0x009b, %r26
	.word 0xbfe4e03f  ! 733: SAVE_I	save	%r19, 0x0001, %r31
hwintr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_41), 16, 16)) -> intp(0, 0, 26)
	.word 0xb3e460c8  ! 743: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e5e12d  ! 745: SAVE_I	save	%r23, 0x0001, %r25
	mov	0, %r12
	.word 0xa1930000  ! 755: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_5, %g1, %r21
	.word 0xb12c9000  ! 760: SLLX_R	sllx	%r18, %r0, %r24
	.word 0xbbe4a183  ! 761: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e5613e  ! 762: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbaa4a191  ! 763: SUBcc_I	subcc 	%r18, 0x0191, %r29
	.word 0xb5e4a1c7  ! 770: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe5e1b0  ! 775: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e5e08a  ! 776: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e5e19b  ! 786: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8194209e  ! 787: WRPR_TPC_I	wrpr	%r16, 0x009e, %tpc
	.word 0xb9e5a137  ! 788: SAVE_I	save	%r22, 0x0001, %r28
	mov	2, %r12
	.word 0xa1930000  ! 789: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3e5a0e6  ! 790: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb1e4a07b  ! 791: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe5e0bd  ! 792: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e5e09d  ! 793: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e421b6  ! 794: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e4e169  ! 796: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e4a123  ! 798: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe4e06f  ! 799: SAVE_I	save	%r19, 0x0001, %r31
hwintr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_42), 16, 16)) -> intp(0, 0, 1)
	.word 0xb8c4a1fe  ! 802: ADDCcc_I	addccc 	%r18, 0x01fe, %r28
	.word 0xb551c000  ! 803: RDPR_TL	<illegal instruction>
	.word 0xb9e4a006  ! 805: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8d9460b0  ! 807: WRPR_PSTATE_I	wrpr	%r17, 0x00b0, %pstate
	.word 0xb1e5a1e8  ! 808: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x8794e087  ! 809: WRPR_TT_I	wrpr	%r19, 0x0087, %tt
	.word 0xb5e5217b  ! 811: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e4e151  ! 812: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbbe560a5  ! 816: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5350000  ! 818: SRL_R	srl 	%r20, %r0, %r26
	.word 0x81952134  ! 819: WRPR_TPC_I	wrpr	%r20, 0x0134, %tpc
	.word 0xbde5e011  ! 820: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe46159  ! 823: SAVE_I	save	%r17, 0x0001, %r29
hwintr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_43), 16, 16)) -> intp(0, 0, 1)
hwintr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_44), 16, 16)) -> intp(0, 0, 0)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe52021  ! 830: SAVE_I	save	%r20, 0x0001, %r29
hwintr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_45), 16, 16)) -> intp(0, 0, 39)
	.word 0xb03cc000  ! 836: XNOR_R	xnor 	%r19, %r0, %r24
	.word 0xb7e4a0ea  ! 843: SAVE_I	save	%r18, 0x0001, %r27
hwintr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_46), 16, 16)) -> intp(0, 0, 17)
	.word 0xbde4e133  ! 847: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x8795e12f  ! 848: WRPR_TT_I	wrpr	%r23, 0x012f, %tt
	.word 0x83956122  ! 850: WRPR_TNPC_I	wrpr	%r21, 0x0122, %tnpc
	.word 0xb7e4a18b  ! 853: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x8194a005  ! 857: WRPR_TPC_I	wrpr	%r18, 0x0005, %tpc
	.word 0xbbe4e10b  ! 858: SAVE_I	save	%r19, 0x0001, %r29
	setx	data_start_3, %g1, %r21
	mov	2, %r12
	.word 0xa1930000  ! 860: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb68461f5  ! 863: ADDcc_I	addcc 	%r17, 0x01f5, %r27
	.word 0xbfe520a2  ! 867: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x919560fc  ! 871: WRPR_PIL_I	wrpr	%r21, 0x00fc, %pil
	setx	data_start_1, %g1, %r21
	.word 0x89952117  ! 874: WRPR_TICK_I	wrpr	%r20, 0x0117, %tick
	.word 0xbde4605e  ! 876: SAVE_I	save	%r17, 0x0001, %r30
	setx	0xb4d992dc0000be07, %g1, %r10
	.word 0x839a8000  ! 877: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5e46148  ! 878: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e46028  ! 879: SAVE_I	save	%r17, 0x0001, %r27
hwintr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_47), 16, 16)) -> intp(0, 0, 4)
	.word 0xb1e421e4  ! 884: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1e460b6  ! 889: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x85956124  ! 895: WRPR_TSTATE_I	wrpr	%r21, 0x0124, %tstate
	.word 0xb5e4a0c7  ! 896: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7e4a091  ! 898: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5540000  ! 899: RDPR_GL	<illegal instruction>
	.word 0xb1350000  ! 900: SRL_R	srl 	%r20, %r0, %r24
	.word 0xbfe5206d  ! 902: SAVE_I	save	%r20, 0x0001, %r31
hwintr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_48), 16, 16)) -> intp(0, 0, 1)
	.word 0xb1e5e01c  ! 907: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb951c000  ! 908: RDPR_TL	<illegal instruction>
hwintr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_49), 16, 16)) -> intp(0, 0, d)
	.word 0xb5510000  ! 911: RDPR_TICK	<illegal instruction>
	.word 0x8195a17b  ! 912: WRPR_TPC_I	wrpr	%r22, 0x017b, %tpc
	.word 0xb5e521ab  ! 913: SAVE_I	save	%r20, 0x0001, %r26
	setx	0x486101a00005809, %g1, %r10
	.word 0x839a8000  ! 914: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_50), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbcbd0000  ! 920: XNORcc_R	xnorcc 	%r20, %r0, %r30
	.word 0xb1e42153  ! 921: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb151c000  ! 924: RDPR_TL	<illegal instruction>
hwintr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_51), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb9e52098  ! 929: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1520000  ! 932: RDPR_PIL	<illegal instruction>
	.word 0xb1e5a040  ! 934: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x919461b7  ! 935: WRPR_PIL_I	wrpr	%r17, 0x01b7, %pil
	.word 0xb1e5a0e8  ! 938: SAVE_I	save	%r22, 0x0001, %r24
hwintr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_52), 16, 16)) -> intp(0, 0, 14)
	.word 0xbbe4a11a  ! 941: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e5a04a  ! 942: SAVE_I	save	%r22, 0x0001, %r28
hwintr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_53), 16, 16)) -> intp(0, 0, 31)
	.word 0xbde4a05d  ! 954: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde5a1f4  ! 960: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbfe5e180  ! 961: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e52034  ! 965: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e4e12d  ! 968: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e420e1  ! 971: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb350c000  ! 972: RDPR_TT	<illegal instruction>
hwintr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_54), 16, 16)) -> intp(0, 0, 34)
	.word 0xbd50c000  ! 975: RDPR_TT	<illegal instruction>
	.word 0xb3e420f7  ! 977: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e4e12f  ! 978: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e5e0ce  ! 979: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbfe56033  ! 981: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3504000  ! 982: RDPR_TNPC	<illegal instruction>
	.word 0xbfe4605b  ! 985: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde5e05f  ! 988: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb9e46068  ! 989: SAVE_I	save	%r17, 0x0001, %r28
hwintr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_55), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb5e4e17a  ! 992: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde560ad  ! 995: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe52099  ! 996: SAVE_I	save	%r20, 0x0001, %r31
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
	.word 0xf23cc000  ! 6: STD_R	std	%r25, [%r19 + %r0]
	.word 0xf03ca166  ! 7: STD_I	std	%r24, [%r18 + 0x0166]
	.word 0xf83cc000  ! 8: STD_R	std	%r28, [%r19 + %r0]
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, f)
	.word 0xfe244000  ! 13: STW_R	stw	%r31, [%r17 + %r0]
	setx	0xe8e270b100001a9f, %g1, %r10
	.word 0x839a8000  ! 15: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 28)
	.word 0x8994a092  ! 17: WRPR_TICK_I	wrpr	%r18, 0x0092, %tick
	.word 0xfb3d0000  ! 18: STDF_R	std	%f29, [%r0, %r20]
	.word 0xb8c52106  ! 20: ADDCcc_I	addccc 	%r20, 0x0106, %r28
	.word 0xbb510000  ! 22: RDPR_TICK	rdpr	%tick, %r29
	.word 0xfe358000  ! 24: STH_R	sth	%r31, [%r22 + %r0]
	.word 0xfa750000  ! 25: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xf02cc000  ! 30: STB_R	stb	%r24, [%r19 + %r0]
	.word 0x8995e1fa  ! 33: WRPR_TICK_I	wrpr	%r23, 0x01fa, %tick
	.word 0xf435612f  ! 34: STH_I	sth	%r26, [%r21 + 0x012f]
	setx	data_start_0, %g1, %r20
	.word 0xb1520000  ! 39: RDPR_PIL	rdpr	%pil, %r24
	.word 0x819520aa  ! 44: WRPR_TPC_I	wrpr	%r20, 0x00aa, %tpc
	.word 0xfc25e04a  ! 45: STW_I	stw	%r30, [%r23 + 0x004a]
	.word 0xfe3d0000  ! 53: STD_R	std	%r31, [%r20 + %r0]
	.word 0xb7520000  ! 55: RDPR_PIL	rdpr	%pil, %r27
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 38)
	.word 0xbd51c000  ! 59: RDPR_TL	<illegal instruction>
	.word 0xb3643801  ! 60: MOVcc_I	<illegal instruction>
	.word 0x8194e092  ! 62: WRPR_TPC_I	wrpr	%r19, 0x0092, %tpc
	.word 0xf43ca19a  ! 63: STD_I	std	%r26, [%r18 + 0x019a]
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 18)
	.word 0xf33d4000  ! 69: STDF_R	std	%f25, [%r0, %r21]
	.word 0x8394a136  ! 72: WRPR_TNPC_I	wrpr	%r18, 0x0136, %tnpc
	.word 0xf62d202e  ! 79: STB_I	stb	%r27, [%r20 + 0x002e]
	.word 0xb33d5000  ! 80: SRAX_R	srax	%r21, %r0, %r25
	.word 0xfd3d0000  ! 81: STDF_R	std	%f30, [%r0, %r20]
	.word 0xbe3ca17d  ! 85: XNOR_I	xnor 	%r18, 0x017d, %r31
	.word 0xf62c61bf  ! 88: STB_I	stb	%r27, [%r17 + 0x01bf]
	.word 0xfc2d8000  ! 90: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xb150c000  ! 92: RDPR_TT	rdpr	%tt, %r24
	.word 0xf03c2191  ! 93: STD_I	std	%r24, [%r16 + 0x0191]
	.word 0xb950c000  ! 94: RDPR_TT	<illegal instruction>
	setx	data_start_5, %g1, %r20
	.word 0xf22d8000  ! 96: STB_R	stb	%r25, [%r22 + %r0]
	setx	0x499fc29200005d83, %g1, %r10
	.word 0x819a8000  ! 97: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa3c20d1  ! 100: STD_I	std	%r29, [%r16 + 0x00d1]
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 11)
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 2)
	.word 0xf025c000  ! 107: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xf83c4000  ! 111: STD_R	std	%r28, [%r17 + %r0]
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 4)
	.word 0x8d9421ee  ! 117: WRPR_PSTATE_I	wrpr	%r16, 0x01ee, %pstate
	.word 0xbd480000  ! 119: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 2b)
	setx	data_start_4, %g1, %r21
	.word 0x8195e123  ! 129: WRPR_TPC_I	wrpr	%r23, 0x0123, %tpc
	.word 0xfa754000  ! 132: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xfc3cc000  ! 133: STD_R	std	%r30, [%r19 + %r0]
	.word 0xf02421fe  ! 134: STW_I	stw	%r24, [%r16 + 0x01fe]
	.word 0x8195e180  ! 136: WRPR_TPC_I	wrpr	%r23, 0x0180, %tpc
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, c)
	.word 0xf13c6183  ! 146: STDF_I	std	%f24, [0x0183, %r17]
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 2c)
	.word 0xb1520000  ! 152: RDPR_PIL	rdpr	%pil, %r24
	.word 0xfa242065  ! 155: STW_I	stw	%r29, [%r16 + 0x0065]
	mov	2, %r12
	.word 0x8f930000  ! 160: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8395a15c  ! 164: WRPR_TNPC_I	wrpr	%r22, 0x015c, %tnpc
	setx	data_start_4, %g1, %r19
	.word 0xb0054000  ! 167: ADD_R	add 	%r21, %r0, %r24
	.word 0xf0254000  ! 170: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xfc3ca10f  ! 171: STD_I	std	%r30, [%r18 + 0x010f]
	.word 0xf23c0000  ! 172: STD_R	std	%r25, [%r16 + %r0]
	.word 0xfe3c6124  ! 175: STD_I	std	%r31, [%r17 + 0x0124]
	.word 0xbf520000  ! 176: RDPR_PIL	rdpr	%pil, %r31
	.word 0xb5508000  ! 179: RDPR_TSTATE	<illegal instruction>
	.word 0xf62d0000  ! 187: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xf22ce147  ! 190: STB_I	stb	%r25, [%r19 + 0x0147]
	.word 0xfa25c000  ! 194: STW_R	stw	%r29, [%r23 + %r0]
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, f)
	.word 0xf42d4000  ! 199: STB_R	stb	%r26, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf23d2056  ! 203: STD_I	std	%r25, [%r20 + 0x0056]
	.word 0x8d942064  ! 206: WRPR_PSTATE_I	wrpr	%r16, 0x0064, %pstate
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 11)
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 12)
	.word 0xf8246143  ! 212: STW_I	stw	%r28, [%r17 + 0x0143]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb624c000  ! 217: SUB_R	sub 	%r19, %r0, %r27
	.word 0xfe2d4000  ! 218: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xf83c8000  ! 219: STD_R	std	%r28, [%r18 + %r0]
	setx	data_start_1, %g1, %r18
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 29)
	.word 0xfa2d4000  ! 223: STB_R	stb	%r29, [%r21 + %r0]
	setx	0x22d46fa00000feda, %g1, %r10
	.word 0x839a8000  ! 224: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 32)
	.word 0x8d95214f  ! 231: WRPR_PSTATE_I	wrpr	%r20, 0x014f, %pstate
	.word 0xb0b58000  ! 232: ORNcc_R	orncc 	%r22, %r0, %r24
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 26)
	.word 0xf47421d7  ! 236: STX_I	stx	%r26, [%r16 + 0x01d7]
	.word 0xfc2de1c4  ! 238: STB_I	stb	%r30, [%r23 + 0x01c4]
	.word 0xf224e0c6  ! 239: STW_I	stw	%r25, [%r19 + 0x00c6]
	.word 0xbb518000  ! 240: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0xf73da171  ! 242: STDF_I	std	%f27, [0x0171, %r22]
	.word 0xf4354000  ! 244: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xbb540000  ! 246: RDPR_GL	<illegal instruction>
	.word 0xf4754000  ! 249: STX_R	stx	%r26, [%r21 + %r0]
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 27)
	.word 0xf875e00e  ! 257: STX_I	stx	%r28, [%r23 + 0x000e]
	.word 0xb4bca031  ! 258: XNORcc_I	xnorcc 	%r18, 0x0031, %r26
	.word 0xbea4e1ed  ! 259: SUBcc_I	subcc 	%r19, 0x01ed, %r31
	.word 0xf62c0000  ! 261: STB_R	stb	%r27, [%r16 + %r0]
	.word 0xf53ce09c  ! 263: STDF_I	std	%f26, [0x009c, %r19]
	.word 0xb41cc000  ! 266: XOR_R	xor 	%r19, %r0, %r26
	.word 0xfa750000  ! 267: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xb150c000  ! 269: RDPR_TT	<illegal instruction>
	.word 0xbb50c000  ! 271: RDPR_TT	<illegal instruction>
	.word 0xbc2c8000  ! 275: ANDN_R	andn 	%r18, %r0, %r30
	.word 0x919420ef  ! 276: WRPR_PIL_I	wrpr	%r16, 0x00ef, %pil
	.word 0xf42dc000  ! 277: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xfe2d6084  ! 279: STB_I	stb	%r31, [%r21 + 0x0084]
	.word 0x8d9561fc  ! 280: WRPR_PSTATE_I	wrpr	%r21, 0x01fc, %pstate
	.word 0xbb520000  ! 284: RDPR_PIL	rdpr	%pil, %r29
	.word 0xf6258000  ! 285: STW_R	stw	%r27, [%r22 + %r0]
	.word 0xbb508000  ! 286: RDPR_TSTATE	<illegal instruction>
	.word 0xf62cc000  ! 291: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xb29de18e  ! 296: XORcc_I	xorcc 	%r23, 0x018e, %r25
	.word 0xfa250000  ! 299: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xb835a176  ! 303: ORN_I	orn 	%r22, 0x0176, %r28
	.word 0xfa356186  ! 305: STH_I	sth	%r29, [%r21 + 0x0186]
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 2f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf434c000  ! 313: STH_R	sth	%r26, [%r19 + %r0]
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, c)
	setx	0x35b6c270000cc92, %g1, %r10
	.word 0x819a8000  ! 318: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf93d8000  ! 320: STDF_R	std	%f28, [%r0, %r22]
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 2)
	.word 0xb97d2401  ! 323: MOVR_I	movre	%r20, 0x1, %r28
	.word 0x899460cf  ! 325: WRPR_TICK_I	wrpr	%r17, 0x00cf, %tick
	.word 0xfe242140  ! 327: STW_I	stw	%r31, [%r16 + 0x0140]
	.word 0x8195a049  ! 331: WRPR_TPC_I	wrpr	%r22, 0x0049, %tpc
	.word 0x8d95a1eb  ! 332: WRPR_PSTATE_I	wrpr	%r22, 0x01eb, %pstate
	.word 0xfe35e1aa  ! 333: STH_I	sth	%r31, [%r23 + 0x01aa]
	.word 0xb97cc400  ! 336: MOVR_R	movre	%r19, %r0, %r28
	.word 0xfc758000  ! 337: STX_R	stx	%r30, [%r22 + %r0]
	.word 0x8394e0eb  ! 338: WRPR_TNPC_I	wrpr	%r19, 0x00eb, %tnpc
	.word 0xfc3c2191  ! 340: STD_I	std	%r30, [%r16 + 0x0191]
	.word 0xf42521b8  ! 341: STW_I	stw	%r26, [%r20 + 0x01b8]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8195a008  ! 346: WRPR_TPC_I	wrpr	%r22, 0x0008, %tpc
	.word 0xb5500000  ! 349: RDPR_TPC	rdpr	%tpc, %r26
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf62dc000  ! 352: STB_R	stb	%r27, [%r23 + %r0]
	.word 0xb3500000  ! 355: RDPR_TPC	<illegal instruction>
	.word 0xfa2521ce  ! 357: STW_I	stw	%r29, [%r20 + 0x01ce]
	.word 0xf22d4000  ! 358: STB_R	stb	%r25, [%r21 + %r0]
	mov	0, %r12
	.word 0xa1930000  ! 361: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb8ac0000  ! 365: ANDNcc_R	andncc 	%r16, %r0, %r28
	.word 0xf634c000  ! 367: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xf82de037  ! 368: STB_I	stb	%r28, [%r23 + 0x0037]
	.word 0xf824c000  ! 371: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xf83cc000  ! 374: STD_R	std	%r28, [%r19 + %r0]
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 33)
	.word 0xf93c20f0  ! 381: STDF_I	std	%f28, [0x00f0, %r16]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe3de073  ! 386: STD_I	std	%r31, [%r23 + 0x0073]
	.word 0xf874a0ce  ! 388: STX_I	stx	%r28, [%r18 + 0x00ce]
	.word 0xfd3c2182  ! 389: STDF_I	std	%f30, [0x0182, %r16]
	.word 0x919421e7  ! 391: WRPR_PIL_I	wrpr	%r16, 0x01e7, %pil
	.word 0xbf504000  ! 392: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xb1352001  ! 393: SRL_I	srl 	%r20, 0x0001, %r24
	.word 0xba84616f  ! 400: ADDcc_I	addcc 	%r17, 0x016f, %r29
	.word 0xf434c000  ! 407: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xf225a17b  ! 410: STW_I	stw	%r25, [%r22 + 0x017b]
	.word 0xf23ca1c5  ! 411: STD_I	std	%r25, [%r18 + 0x01c5]
	.word 0x8794e1ad  ! 412: WRPR_TT_I	wrpr	%r19, 0x01ad, %tt
	.word 0xf475e154  ! 413: STX_I	stx	%r26, [%r23 + 0x0154]
	.word 0xfc25c000  ! 417: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xfa3d4000  ! 422: STD_R	std	%r29, [%r21 + %r0]
	.word 0xf62c61d4  ! 424: STB_I	stb	%r27, [%r17 + 0x01d4]
	.word 0xbe042085  ! 428: ADD_I	add 	%r16, 0x0085, %r31
	.word 0xfc34209d  ! 435: STH_I	sth	%r30, [%r16 + 0x009d]
	.word 0xf82d205e  ! 437: STB_I	stb	%r28, [%r20 + 0x005e]
	.word 0x8994e083  ! 441: WRPR_TICK_I	wrpr	%r19, 0x0083, %tick
	.word 0xf4344000  ! 446: STH_R	sth	%r26, [%r17 + %r0]
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 35)
	.word 0xfa3c0000  ! 449: STD_R	std	%r29, [%r16 + %r0]
	.word 0xf075c000  ! 450: STX_R	stx	%r24, [%r23 + %r0]
	.word 0x8795a09f  ! 452: WRPR_TT_I	wrpr	%r22, 0x009f, %tt
	.word 0xb551c000  ! 455: RDPR_TL	rdpr	%tl, %r26
	.word 0xf67460b0  ! 457: STX_I	stx	%r27, [%r17 + 0x00b0]
	.word 0xfc252097  ! 463: STW_I	stw	%r30, [%r20 + 0x0097]
	.word 0xf42ca0a6  ! 470: STB_I	stb	%r26, [%r18 + 0x00a6]
	.word 0x859421a1  ! 475: WRPR_TSTATE_I	wrpr	%r16, 0x01a1, %tstate
	.word 0xf02c6000  ! 477: STB_I	stb	%r24, [%r17 + 0x0000]
	.word 0xf6744000  ! 486: STX_R	stx	%r27, [%r17 + %r0]
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 2d)
	.word 0x879561a9  ! 488: WRPR_TT_I	wrpr	%r21, 0x01a9, %tt
	.word 0xfe258000  ! 489: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xb9480000  ! 491: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf93d0000  ! 495: STDF_R	std	%f28, [%r0, %r20]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x9194a1ba  ! 503: WRPR_PIL_I	wrpr	%r18, 0x01ba, %pil
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 5)
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 33)
	.word 0xb3510000  ! 508: RDPR_TICK	rdpr	%tick, %r25
	.word 0xfe75603f  ! 509: STX_I	stx	%r31, [%r21 + 0x003f]
	.word 0x879560e7  ! 510: WRPR_TT_I	wrpr	%r21, 0x00e7, %tt
	.word 0xb645c000  ! 514: ADDC_R	addc 	%r23, %r0, %r27
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, e)
	setx	data_start_1, %g1, %r20
	.word 0xb8ac8000  ! 523: ANDNcc_R	andncc 	%r18, %r0, %r28
	.word 0xfc258000  ! 524: STW_R	stw	%r30, [%r22 + %r0]
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 31)
	.word 0xf53ce179  ! 526: STDF_I	std	%f26, [0x0179, %r19]
	.word 0xbc9d0000  ! 534: XORcc_R	xorcc 	%r20, %r0, %r30
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 38)
	setx	0xad7ff7f20000b90c, %g1, %r10
	.word 0x819a8000  ! 536: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, a)
	.word 0xb1345000  ! 538: SRLX_R	srlx	%r17, %r0, %r24
	.word 0xf63ca1aa  ! 539: STD_I	std	%r27, [%r18 + 0x01aa]
	.word 0xf425c000  ! 540: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xbc3da0b2  ! 542: XNOR_I	xnor 	%r22, 0x00b2, %r30
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 14)
	.word 0xf42c209a  ! 546: STB_I	stb	%r26, [%r16 + 0x009a]
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 2d)
	setx	data_start_1, %g1, %r21
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, 9)
	.word 0xb7540000  ! 551: RDPR_GL	rdpr	%-, %r27
	.word 0xf4750000  ! 553: STX_R	stx	%r26, [%r20 + %r0]
	.word 0xb2340000  ! 560: SUBC_R	orn 	%r16, %r0, %r25
	.word 0xf2340000  ! 567: STH_R	sth	%r25, [%r16 + %r0]
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf0358000  ! 570: STH_R	sth	%r24, [%r22 + %r0]
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, b)
	.word 0xf53dc000  ! 573: STDF_R	std	%f26, [%r0, %r23]
	.word 0xfe2c8000  ! 576: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xf824609b  ! 577: STW_I	stw	%r28, [%r17 + 0x009b]
	.word 0xf83de091  ! 578: STD_I	std	%r28, [%r23 + 0x0091]
	.word 0xf13d218a  ! 579: STDF_I	std	%f24, [0x018a, %r20]
	.word 0x839560f6  ! 588: WRPR_TNPC_I	wrpr	%r21, 0x00f6, %tnpc
	.word 0xfe24a085  ! 590: STW_I	stw	%r31, [%r18 + 0x0085]
	.word 0xb33c1000  ! 597: SRAX_R	srax	%r16, %r0, %r25
	setx	0x896d160a00000d19, %g1, %r10
	.word 0x839a8000  ! 608: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9500000  ! 609: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xfe2d4000  ! 610: STB_R	stb	%r31, [%r21 + %r0]
	mov	2, %r12
	.word 0x8f930000  ! 612: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb68521c2  ! 613: ADDcc_I	addcc 	%r20, 0x01c2, %r27
	.word 0xb8ac4000  ! 618: ANDNcc_R	andncc 	%r17, %r0, %r28
	.word 0xbd50c000  ! 619: RDPR_TT	rdpr	%tt, %r30
	.word 0xba456175  ! 620: ADDC_I	addc 	%r21, 0x0175, %r29
	.word 0x8994a159  ! 622: WRPR_TICK_I	wrpr	%r18, 0x0159, %tick
	setx	data_start_6, %g1, %r20
	.word 0xbd500000  ! 631: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xf23d21ff  ! 632: STD_I	std	%r25, [%r20 + 0x01ff]
	.word 0xf22ce1e3  ! 638: STB_I	stb	%r25, [%r19 + 0x01e3]
	setx	0xbd640f1e0000cd43, %g1, %r10
	.word 0x819a8000  ! 639: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf63c2121  ! 640: STD_I	std	%r27, [%r16 + 0x0121]
	.word 0xbe0da166  ! 641: AND_I	and 	%r22, 0x0166, %r31
	.word 0xb5500000  ! 642: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xf02ce081  ! 644: STB_I	stb	%r24, [%r19 + 0x0081]
	.word 0x8d94a04a  ! 647: WRPR_PSTATE_I	wrpr	%r18, 0x004a, %pstate
	.word 0xb0848000  ! 652: ADDcc_R	addcc 	%r18, %r0, %r24
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf025e19e  ! 662: STW_I	stw	%r24, [%r23 + 0x019e]
	.word 0x8594a138  ! 665: WRPR_TSTATE_I	wrpr	%r18, 0x0138, %tstate
	.word 0xb7518000  ! 669: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xb1510000  ! 672: RDPR_TICK	<illegal instruction>
	.word 0x899460d5  ! 673: WRPR_TICK_I	wrpr	%r17, 0x00d5, %tick
	.word 0xf53c4000  ! 675: STDF_R	std	%f26, [%r0, %r17]
	.word 0xf6758000  ! 676: STX_R	stx	%r27, [%r22 + %r0]
	.word 0x839460ee  ! 679: WRPR_TNPC_I	wrpr	%r17, 0x00ee, %tnpc
	.word 0xb5500000  ! 680: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xfe346028  ! 681: STH_I	sth	%r31, [%r17 + 0x0028]
	setx	0x81cd488300002c48, %g1, %r10
	.word 0x819a8000  ! 682: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa750000  ! 685: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xf43cc000  ! 686: STD_R	std	%r26, [%r19 + %r0]
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, d)
	.word 0x839521e2  ! 691: WRPR_TNPC_I	wrpr	%r20, 0x01e2, %tnpc
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 38)
	mov	0, %r12
	.word 0x8f930000  ! 696: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 5)
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, 31)
	.word 0xfa3c0000  ! 702: STD_R	std	%r29, [%r16 + %r0]
	setx	data_start_5, %g1, %r21
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, 9)
	.word 0xfe3c607c  ! 706: STD_I	std	%r31, [%r17 + 0x007c]
	.word 0xf4740000  ! 707: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xb4152104  ! 708: OR_I	or 	%r20, 0x0104, %r26
	.word 0x8d9460d1  ! 709: WRPR_PSTATE_I	wrpr	%r17, 0x00d1, %pstate
	.word 0xb1504000  ! 713: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xf13dc000  ! 715: STDF_R	std	%f24, [%r0, %r23]
	.word 0xb3520000  ! 717: RDPR_PIL	<illegal instruction>
	.word 0x8395a092  ! 719: WRPR_TNPC_I	wrpr	%r22, 0x0092, %tnpc
	.word 0xf23cc000  ! 720: STD_R	std	%r25, [%r19 + %r0]
	.word 0x8395e0c1  ! 725: WRPR_TNPC_I	wrpr	%r23, 0x00c1, %tnpc
	.word 0xb3500000  ! 727: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xf13d8000  ! 730: STDF_R	std	%f24, [%r0, %r22]
	.word 0xb48c21da  ! 732: ANDcc_I	andcc 	%r16, 0x01da, %r26
	.word 0xf0748000  ! 734: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xf4254000  ! 735: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xf0240000  ! 738: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xfa24e0fb  ! 740: STW_I	stw	%r29, [%r19 + 0x00fb]
hwintr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_41), 16, 16)) -> intp(3, 0, 20)
	.word 0xfa24e106  ! 742: STW_I	stw	%r29, [%r19 + 0x0106]
	.word 0xfa2ce01b  ! 749: STB_I	stb	%r29, [%r19 + 0x001b]
	.word 0xfa748000  ! 752: STX_R	stx	%r29, [%r18 + %r0]
	mov	0, %r12
	.word 0xa1930000  ! 755: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xff3ca008  ! 756: STDF_I	std	%f31, [0x0008, %r18]
	.word 0xfa744000  ! 757: STX_R	stx	%r29, [%r17 + %r0]
	setx	data_start_5, %g1, %r21
	.word 0xb52d1000  ! 760: SLLX_R	sllx	%r20, %r0, %r26
	.word 0xbca4e192  ! 763: SUBcc_I	subcc 	%r19, 0x0192, %r30
	.word 0xf4750000  ! 765: STX_R	stx	%r26, [%r20 + %r0]
	.word 0xf63d0000  ! 771: STD_R	std	%r27, [%r20 + %r0]
	.word 0xf22d8000  ! 777: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xfa250000  ! 785: STW_R	stw	%r29, [%r20 + %r0]
	.word 0x8194212e  ! 787: WRPR_TPC_I	wrpr	%r16, 0x012e, %tpc
	mov	0, %r12
	.word 0xa1930000  ! 789: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf13ca1a9  ! 797: STDF_I	std	%f24, [0x01a9, %r18]
hwintr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_42), 16, 16)) -> intp(3, 0, 14)
	.word 0xbcc5e020  ! 802: ADDCcc_I	addccc 	%r23, 0x0020, %r30
	.word 0xbb51c000  ! 803: RDPR_TL	rdpr	%tl, %r29
	.word 0xfc252031  ! 804: STW_I	stw	%r30, [%r20 + 0x0031]
	.word 0x8d9461be  ! 807: WRPR_PSTATE_I	wrpr	%r17, 0x01be, %pstate
	.word 0x8794a1b9  ! 809: WRPR_TT_I	wrpr	%r18, 0x01b9, %tt
	.word 0xf83de02f  ! 810: STD_I	std	%r28, [%r23 + 0x002f]
	.word 0xf33cc000  ! 813: STDF_R	std	%f25, [%r0, %r19]
	.word 0xbb35c000  ! 818: SRL_R	srl 	%r23, %r0, %r29
	.word 0x8195e012  ! 819: WRPR_TPC_I	wrpr	%r23, 0x0012, %tpc
hwintr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_43), 16, 16)) -> intp(3, 0, e)
	.word 0xf225c000  ! 825: STW_R	stw	%r25, [%r23 + %r0]
hwintr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_44), 16, 16)) -> intp(3, 0, c)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfd3d4000  ! 832: STDF_R	std	%f30, [%r0, %r21]
hwintr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_45), 16, 16)) -> intp(3, 0, 2d)
	.word 0xff3de1af  ! 834: STDF_I	std	%f31, [0x01af, %r23]
	.word 0xfe3c0000  ! 835: STD_R	std	%r31, [%r16 + %r0]
	.word 0xba3d4000  ! 836: XNOR_R	xnor 	%r21, %r0, %r29
	.word 0xfa3dc000  ! 837: STD_R	std	%r29, [%r23 + %r0]
	.word 0xf63cc000  ! 844: STD_R	std	%r27, [%r19 + %r0]
hwintr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_46), 16, 16)) -> intp(3, 0, 10)
	.word 0x87946124  ! 848: WRPR_TT_I	wrpr	%r17, 0x0124, %tt
	.word 0xf625c000  ! 849: STW_R	stw	%r27, [%r23 + %r0]
	.word 0x83956176  ! 850: WRPR_TNPC_I	wrpr	%r21, 0x0176, %tnpc
	.word 0xfb3d0000  ! 854: STDF_R	std	%f29, [%r0, %r20]
	.word 0xf03c0000  ! 855: STD_R	std	%r24, [%r16 + %r0]
	.word 0xf2244000  ! 856: STW_R	stw	%r25, [%r17 + %r0]
	.word 0x8194a062  ! 857: WRPR_TPC_I	wrpr	%r18, 0x0062, %tpc
	setx	data_start_6, %g1, %r17
	mov	1, %r12
	.word 0xa1930000  ! 860: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf0250000  ! 862: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xb0852145  ! 863: ADDcc_I	addcc 	%r20, 0x0145, %r24
	.word 0xf87520b9  ! 864: STX_I	stx	%r28, [%r20 + 0x00b9]
	.word 0xf02c213b  ! 865: STB_I	stb	%r24, [%r16 + 0x013b]
	.word 0x9194a184  ! 871: WRPR_PIL_I	wrpr	%r18, 0x0184, %pil
	.word 0xfc75a183  ! 872: STX_I	stx	%r30, [%r22 + 0x0183]
	setx	data_start_6, %g1, %r18
	.word 0x8994a13d  ! 874: WRPR_TICK_I	wrpr	%r18, 0x013d, %tick
	setx	0x5f77aba900005804, %g1, %r10
	.word 0x839a8000  ! 877: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe758000  ! 880: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xf13c6194  ! 881: STDF_I	std	%f24, [0x0194, %r17]
hwintr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_47), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfa2421b7  ! 887: STW_I	stw	%r29, [%r16 + 0x01b7]
	.word 0xf825e1bd  ! 888: STW_I	stw	%r28, [%r23 + 0x01bd]
	.word 0xf434a029  ! 890: STH_I	sth	%r26, [%r18 + 0x0029]
	.word 0xfa75205c  ! 892: STX_I	stx	%r29, [%r20 + 0x005c]
	.word 0xf434c000  ! 893: STH_R	sth	%r26, [%r19 + %r0]
	.word 0x85956103  ! 895: WRPR_TSTATE_I	wrpr	%r21, 0x0103, %tstate
	.word 0xf424c000  ! 897: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xbd540000  ! 899: RDPR_GL	rdpr	%-, %r30
	.word 0xb3348000  ! 900: SRL_R	srl 	%r18, %r0, %r25
	.word 0xf025e1d4  ! 901: STW_I	stw	%r24, [%r23 + 0x01d4]
hwintr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_48), 16, 16)) -> intp(3, 0, 22)
	.word 0xbd51c000  ! 908: RDPR_TL	<illegal instruction>
hwintr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_49), 16, 16)) -> intp(3, 0, a)
	.word 0xfe746166  ! 910: STX_I	stx	%r31, [%r17 + 0x0166]
	.word 0xbf510000  ! 911: RDPR_TICK	<illegal instruction>
	.word 0x8194612b  ! 912: WRPR_TPC_I	wrpr	%r17, 0x012b, %tpc
	setx	0x550caac800004d58, %g1, %r10
	.word 0x839a8000  ! 914: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_50), 16, 16)) -> intp(3, 0, 4)
	.word 0xf434c000  ! 919: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xb0bcc000  ! 920: XNORcc_R	xnorcc 	%r19, %r0, %r24
	.word 0xf8240000  ! 922: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xf73c21e6  ! 923: STDF_I	std	%f27, [0x01e6, %r16]
	.word 0xbb51c000  ! 924: RDPR_TL	rdpr	%tl, %r29
hwintr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_51), 16, 16)) -> intp(3, 0, 8)
	.word 0xbd520000  ! 932: RDPR_PIL	<illegal instruction>
	.word 0x91942132  ! 935: WRPR_PIL_I	wrpr	%r16, 0x0132, %pil
hwintr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_52), 16, 16)) -> intp(3, 0, 36)
hwintr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_53), 16, 16)) -> intp(3, 0, 10)
	.word 0xfa34e1b2  ! 948: STH_I	sth	%r29, [%r19 + 0x01b2]
	.word 0xfa348000  ! 953: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xf33c0000  ! 955: STDF_R	std	%f25, [%r0, %r16]
	.word 0xf22d2159  ! 957: STB_I	stb	%r25, [%r20 + 0x0159]
	.word 0xfb3cc000  ! 963: STDF_R	std	%f29, [%r0, %r19]
	.word 0xf6340000  ! 964: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xf02ce11b  ! 967: STB_I	stb	%r24, [%r19 + 0x011b]
	.word 0xf674a11f  ! 969: STX_I	stx	%r27, [%r18 + 0x011f]
	.word 0xfa256155  ! 970: STW_I	stw	%r29, [%r21 + 0x0155]
	.word 0xbb50c000  ! 972: RDPR_TT	rdpr	%tt, %r29
hwintr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_54), 16, 16)) -> intp(3, 0, 24)
	.word 0xbf50c000  ! 975: RDPR_TT	<illegal instruction>
	.word 0xf63dc000  ! 980: STD_R	std	%r27, [%r23 + %r0]
	.word 0xb9504000  ! 982: RDPR_TNPC	<illegal instruction>
	.word 0xfb3c217d  ! 983: STDF_I	std	%f29, [0x017d, %r16]
	.word 0xf73c20a2  ! 986: STDF_I	std	%f27, [0x00a2, %r16]
	.word 0xf03d0000  ! 990: STD_R	std	%r24, [%r20 + %r0]
hwintr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_55), 16, 16)) -> intp(3, 0, b)
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
	.word 0xfa54c000  ! 4: LDSH_R	ldsh	[%r19 + %r0], %r29
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 1e)
	setx	0x2d28c9a600002c89, %g1, %r10
	.word 0x839a8000  ! 15: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 35)
	.word 0x8995a01a  ! 17: WRPR_TICK_I	wrpr	%r22, 0x001a, %tick
	.word 0xb0c520c8  ! 20: ADDCcc_I	addccc 	%r20, 0x00c8, %r24
	.word 0xb1510000  ! 22: RDPR_TICK	<illegal instruction>
	.word 0xfc1dc000  ! 27: LDD_R	ldd	[%r23 + %r0], %r30
	.word 0xf2154000  ! 32: LDUH_R	lduh	[%r21 + %r0], %r25
	.word 0x89942138  ! 33: WRPR_TICK_I	wrpr	%r16, 0x0138, %tick
	setx	data_start_4, %g1, %r17
	.word 0xf05dc000  ! 37: LDX_R	ldx	[%r23 + %r0], %r24
	.word 0xb5520000  ! 39: RDPR_PIL	<illegal instruction>
	.word 0xf41ce1bd  ! 41: LDD_I	ldd	[%r19 + 0x01bd], %r26
	.word 0x8194a1e0  ! 44: WRPR_TPC_I	wrpr	%r18, 0x01e0, %tpc
	.word 0xfa542133  ! 50: LDSH_I	ldsh	[%r16 + 0x0133], %r29
	.word 0xf00d0000  ! 51: LDUB_R	ldub	[%r20 + %r0], %r24
	.word 0xbf520000  ! 55: RDPR_PIL	<illegal instruction>
	.word 0xf6554000  ! 56: LDSH_R	ldsh	[%r21 + %r0], %r27
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 29)
	.word 0xb551c000  ! 59: RDPR_TL	<illegal instruction>
	.word 0xb1643801  ! 60: MOVcc_I	<illegal instruction>
	.word 0x81942121  ! 62: WRPR_TPC_I	wrpr	%r16, 0x0121, %tpc
	.word 0xf21cc000  ! 64: LDD_R	ldd	[%r19 + %r0], %r25
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf00d4000  ! 71: LDUB_R	ldub	[%r21 + %r0], %r24
	.word 0x8395e190  ! 72: WRPR_TNPC_I	wrpr	%r23, 0x0190, %tnpc
	.word 0xf2550000  ! 75: LDSH_R	ldsh	[%r20 + %r0], %r25
	.word 0xbd3c1000  ! 80: SRAX_R	srax	%r16, %r0, %r30
	.word 0xfe54e18e  ! 84: LDSH_I	ldsh	[%r19 + 0x018e], %r31
	.word 0xb43d2063  ! 85: XNOR_I	xnor 	%r20, 0x0063, %r26
	.word 0xf804615c  ! 87: LDUW_I	lduw	[%r17 + 0x015c], %r28
	.word 0xb950c000  ! 92: RDPR_TT	<illegal instruction>
	.word 0xb750c000  ! 94: RDPR_TT	<illegal instruction>
	setx	data_start_1, %g1, %r20
	setx	0x378038c00002ac2, %g1, %r10
	.word 0x819a8000  ! 97: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf255e19c  ! 98: LDSH_I	ldsh	[%r23 + 0x019c], %r25
	.word 0xf2044000  ! 101: LDUW_R	lduw	[%r17 + %r0], %r25
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf245a080  ! 104: LDSW_I	ldsw	[%r22 + 0x0080], %r25
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf64d4000  ! 106: LDSB_R	ldsb	[%r21 + %r0], %r27
	.word 0xf445a055  ! 110: LDSW_I	ldsw	[%r22 + 0x0055], %r26
	.word 0xf615e1b4  ! 113: LDUH_I	lduh	[%r23 + 0x01b4], %r27
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 6)
	.word 0xf00c0000  ! 115: LDUB_R	ldub	[%r16 + %r0], %r24
	.word 0xff1de1d5  ! 116: LDDF_I	ldd	[%r23, 0x01d5], %f31
	.word 0x8d956004  ! 117: WRPR_PSTATE_I	wrpr	%r21, 0x0004, %pstate
	.word 0xff1cc000  ! 118: LDDF_R	ldd	[%r19, %r0], %f31
	.word 0xb1480000  ! 119: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 36)
	setx	data_start_6, %g1, %r16
	.word 0xf41d8000  ! 128: LDD_R	ldd	[%r22 + %r0], %r26
	.word 0x8195e1c5  ! 129: WRPR_TPC_I	wrpr	%r23, 0x01c5, %tpc
	.word 0xfa544000  ! 130: LDSH_R	ldsh	[%r17 + %r0], %r29
	.word 0x81952081  ! 136: WRPR_TPC_I	wrpr	%r20, 0x0081, %tpc
	.word 0xf2054000  ! 137: LDUW_R	lduw	[%r21 + %r0], %r25
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf01c4000  ! 140: LDD_R	ldd	[%r17 + %r0], %r24
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 3c)
	.word 0xb1520000  ! 152: RDPR_PIL	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 160: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf24c21e9  ! 162: LDSB_I	ldsb	[%r16 + 0x01e9], %r25
	.word 0x8394a03f  ! 164: WRPR_TNPC_I	wrpr	%r18, 0x003f, %tnpc
	setx	data_start_3, %g1, %r22
	.word 0xb404c000  ! 167: ADD_R	add 	%r19, %r0, %r26
	.word 0xf64460d9  ! 173: LDSW_I	ldsw	[%r17 + 0x00d9], %r27
	.word 0xf445e01a  ! 174: LDSW_I	ldsw	[%r23 + 0x001a], %r26
	.word 0xb1520000  ! 176: RDPR_PIL	rdpr	%pil, %r24
	.word 0xfe5d8000  ! 178: LDX_R	ldx	[%r22 + %r0], %r31
	.word 0xbd508000  ! 179: RDPR_TSTATE	<illegal instruction>
	.word 0xf01dc000  ! 183: LDD_R	ldd	[%r23 + %r0], %r24
	.word 0xf00d21a5  ! 184: LDUB_I	ldub	[%r20 + 0x01a5], %r24
	.word 0xf71c8000  ! 191: LDDF_R	ldd	[%r18, %r0], %f27
	.word 0xfe540000  ! 193: LDSH_R	ldsh	[%r16 + %r0], %r31
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 31)
	.word 0xfa040000  ! 200: LDUW_R	lduw	[%r16 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8d94e04d  ! 206: WRPR_PSTATE_I	wrpr	%r19, 0x004d, %pstate
	.word 0xfa0c6118  ! 207: LDUB_I	ldub	[%r17 + 0x0118], %r29
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 11)
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 4)
	.word 0xf605c000  ! 211: LDUW_R	lduw	[%r23 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6456145  ! 214: LDSW_I	ldsw	[%r21 + 0x0145], %r27
	.word 0xfc048000  ! 216: LDUW_R	lduw	[%r18 + %r0], %r30
	.word 0xbc254000  ! 217: SUB_R	sub 	%r21, %r0, %r30
	setx	data_start_6, %g1, %r20
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 1c)
	.word 0xfa042140  ! 222: LDUW_I	lduw	[%r16 + 0x0140], %r29
	setx	0x9a93254e0000dc46, %g1, %r10
	.word 0x839a8000  ! 224: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 39)
	.word 0x8d95e0ea  ! 231: WRPR_PSTATE_I	wrpr	%r23, 0x00ea, %pstate
	.word 0xb6b58000  ! 232: ORNcc_R	orncc 	%r22, %r0, %r27
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf24c0000  ! 234: LDSB_R	ldsb	[%r16 + %r0], %r25
	.word 0xfe5ce188  ! 235: LDX_I	ldx	[%r19 + 0x0188], %r31
	.word 0xb5518000  ! 240: RDPR_PSTATE	<illegal instruction>
	.word 0xf805c000  ! 241: LDUW_R	lduw	[%r23 + %r0], %r28
	.word 0xfe454000  ! 243: LDSW_R	ldsw	[%r21 + %r0], %r31
	.word 0xb1540000  ! 246: RDPR_GL	<illegal instruction>
	.word 0xf71da1fd  ! 248: LDDF_I	ldd	[%r22, 0x01fd], %f27
	.word 0xfc54a038  ! 251: LDSH_I	ldsh	[%r18 + 0x0038], %r30
	.word 0xfa0d8000  ! 253: LDUB_R	ldub	[%r22 + %r0], %r29
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, 27)
	.word 0xfc5de063  ! 256: LDX_I	ldx	[%r23 + 0x0063], %r30
	.word 0xbabce0df  ! 258: XNORcc_I	xnorcc 	%r19, 0x00df, %r29
	.word 0xb4a5602a  ! 259: SUBcc_I	subcc 	%r21, 0x002a, %r26
	.word 0xbe1c8000  ! 266: XOR_R	xor 	%r18, %r0, %r31
	.word 0xb750c000  ! 269: RDPR_TT	<illegal instruction>
	.word 0xb950c000  ! 271: RDPR_TT	<illegal instruction>
	.word 0xbc2d8000  ! 275: ANDN_R	andn 	%r22, %r0, %r30
	.word 0x9195200c  ! 276: WRPR_PIL_I	wrpr	%r20, 0x000c, %pil
	.word 0xf31d6155  ! 278: LDDF_I	ldd	[%r21, 0x0155], %f25
	.word 0x8d95e0df  ! 280: WRPR_PSTATE_I	wrpr	%r23, 0x00df, %pstate
	.word 0xbb520000  ! 284: RDPR_PIL	<illegal instruction>
	.word 0xb9508000  ! 286: RDPR_TSTATE	<illegal instruction>
	.word 0xfb1ca0b2  ! 289: LDDF_I	ldd	[%r18, 0x00b2], %f29
	.word 0xf60ce0f5  ! 290: LDUB_I	ldub	[%r19 + 0x00f5], %r27
	.word 0xfa4d4000  ! 292: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0xf8450000  ! 295: LDSW_R	ldsw	[%r20 + %r0], %r28
	.word 0xbc9da124  ! 296: XORcc_I	xorcc 	%r22, 0x0124, %r30
	.word 0xb834e0e0  ! 303: ORN_I	orn 	%r19, 0x00e0, %r28
	.word 0xfe45e11d  ! 304: LDSW_I	ldsw	[%r23 + 0x011d], %r31
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfe454000  ! 307: LDSW_R	ldsw	[%r21 + %r0], %r31
	.word 0xfd1c603f  ! 310: LDDF_I	ldd	[%r17, 0x003f], %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc4de150  ! 312: LDSB_I	ldsb	[%r23 + 0x0150], %r30
	.word 0xf91d0000  ! 314: LDDF_R	ldd	[%r20, %r0], %f28
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, a)
	setx	0x93fda7680000bbd4, %g1, %r10
	.word 0x819a8000  ! 318: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 3)
	.word 0xf445c000  ! 322: LDSW_R	ldsw	[%r23 + %r0], %r26
	.word 0xb37d2401  ! 323: MOVR_I	movre	%r20, 0x1, %r25
	.word 0x899420c4  ! 325: WRPR_TICK_I	wrpr	%r16, 0x00c4, %tick
	.word 0xf2440000  ! 326: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0x8194a1cd  ! 331: WRPR_TPC_I	wrpr	%r18, 0x01cd, %tpc
	.word 0x8d9520e8  ! 332: WRPR_PSTATE_I	wrpr	%r20, 0x00e8, %pstate
	.word 0xfc5c616e  ! 335: LDX_I	ldx	[%r17 + 0x016e], %r30
	.word 0xb57d8400  ! 336: MOVR_R	movre	%r22, %r0, %r26
	.word 0x8395a1af  ! 338: WRPR_TNPC_I	wrpr	%r22, 0x01af, %tnpc
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfa4cc000  ! 345: LDSB_R	ldsb	[%r19 + %r0], %r29
	.word 0x8194a09d  ! 346: WRPR_TPC_I	wrpr	%r18, 0x009d, %tpc
	.word 0xfe5c60bf  ! 348: LDX_I	ldx	[%r17 + 0x00bf], %r31
	.word 0xbd500000  ! 349: RDPR_TPC	<illegal instruction>
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, 2c)
	.word 0xb1500000  ! 355: RDPR_TPC	<illegal instruction>
	.word 0xf244e01a  ! 356: LDSW_I	ldsw	[%r19 + 0x001a], %r25
	mov	0, %r12
	.word 0xa1930000  ! 361: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbead8000  ! 365: ANDNcc_R	andncc 	%r22, %r0, %r31
	.word 0xf04521c9  ! 372: LDSW_I	ldsw	[%r20 + 0x01c9], %r24
	.word 0xf04ce10e  ! 373: LDSB_I	ldsb	[%r19 + 0x010e], %r24
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 15)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf45420d1  ! 384: LDSH_I	ldsh	[%r16 + 0x00d1], %r26
	.word 0xf65d0000  ! 390: LDX_R	ldx	[%r20 + %r0], %r27
	.word 0x9194e0b8  ! 391: WRPR_PIL_I	wrpr	%r19, 0x00b8, %pil
	.word 0xb9504000  ! 392: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xbb356001  ! 393: SRL_I	srl 	%r21, 0x0001, %r29
	.word 0xf6156156  ! 394: LDUH_I	lduh	[%r21 + 0x0156], %r27
	.word 0xf615a1b1  ! 395: LDUH_I	lduh	[%r22 + 0x01b1], %r27
	.word 0xf24560b1  ! 397: LDSW_I	ldsw	[%r21 + 0x00b1], %r25
	.word 0xf8040000  ! 399: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xb0842071  ! 400: ADDcc_I	addcc 	%r16, 0x0071, %r24
	.word 0xf91c6090  ! 401: LDDF_I	ldd	[%r17, 0x0090], %f28
	.word 0xfa4da080  ! 403: LDSB_I	ldsb	[%r22 + 0x0080], %r29
	.word 0xfa440000  ! 406: LDSW_R	ldsw	[%r16 + %r0], %r29
	.word 0xfa1c204f  ! 408: LDD_I	ldd	[%r16 + 0x004f], %r29
	.word 0xfc0d60b5  ! 409: LDUB_I	ldub	[%r21 + 0x00b5], %r30
	.word 0x8795608a  ! 412: WRPR_TT_I	wrpr	%r21, 0x008a, %tt
	.word 0xf2448000  ! 425: LDSW_R	ldsw	[%r18 + %r0], %r25
	.word 0xf45460bc  ! 427: LDSH_I	ldsh	[%r17 + 0x00bc], %r26
	.word 0xb805610e  ! 428: ADD_I	add 	%r21, 0x010e, %r28
	.word 0xf045a1b1  ! 430: LDSW_I	ldsw	[%r22 + 0x01b1], %r24
	.word 0xf11de001  ! 431: LDDF_I	ldd	[%r23, 0x0001], %f24
	.word 0xf40c0000  ! 433: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0xfe4d4000  ! 434: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xf85c0000  ! 438: LDX_R	ldx	[%r16 + %r0], %r28
	.word 0xfa4ce160  ! 439: LDSB_I	ldsb	[%r19 + 0x0160], %r29
	.word 0x8994e0c0  ! 441: WRPR_TICK_I	wrpr	%r19, 0x00c0, %tick
	.word 0xfc14c000  ! 444: LDUH_R	lduh	[%r19 + %r0], %r30
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 18)
	.word 0x879521d4  ! 452: WRPR_TT_I	wrpr	%r20, 0x01d4, %tt
	.word 0xf44da1ff  ! 454: LDSB_I	ldsb	[%r22 + 0x01ff], %r26
	.word 0xb951c000  ! 455: RDPR_TL	<illegal instruction>
	.word 0xf40c0000  ! 464: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0xf40d0000  ! 468: LDUB_R	ldub	[%r20 + %r0], %r26
	.word 0xf445e076  ! 471: LDSW_I	ldsw	[%r23 + 0x0076], %r26
	.word 0x859521a1  ! 475: WRPR_TSTATE_I	wrpr	%r20, 0x01a1, %tstate
	.word 0xf0456004  ! 480: LDSW_I	ldsw	[%r21 + 0x0004], %r24
	.word 0xff1de03f  ! 483: LDDF_I	ldd	[%r23, 0x003f], %f31
	.word 0xfe1dc000  ! 485: LDD_R	ldd	[%r23 + %r0], %r31
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, e)
	.word 0x879520c3  ! 488: WRPR_TT_I	wrpr	%r20, 0x00c3, %tt
	.word 0xbb480000  ! 491: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfa5dc000  ! 496: LDX_R	ldx	[%r23 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe1d61b9  ! 498: LDD_I	ldd	[%r21 + 0x01b9], %r31
	.word 0xf00c4000  ! 500: LDUB_R	ldub	[%r17 + %r0], %r24
	.word 0x9194a022  ! 503: WRPR_PIL_I	wrpr	%r18, 0x0022, %pil
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 39)
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 30)
	.word 0xf415210a  ! 506: LDUH_I	lduh	[%r20 + 0x010a], %r26
	.word 0xb9510000  ! 508: RDPR_TICK	<illegal instruction>
	.word 0x8794e10a  ! 510: WRPR_TT_I	wrpr	%r19, 0x010a, %tt
	.word 0xfa542041  ! 513: LDSH_I	ldsh	[%r16 + 0x0041], %r29
	.word 0xb6458000  ! 514: ADDC_R	addc 	%r22, %r0, %r27
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 9)
	setx	data_start_5, %g1, %r20
	.word 0xb8acc000  ! 523: ANDNcc_R	andncc 	%r19, %r0, %r28
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, 4)
	.word 0xf6040000  ! 528: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xfc1c4000  ! 531: LDD_R	ldd	[%r17 + %r0], %r30
	.word 0xf20dc000  ! 532: LDUB_R	ldub	[%r23 + %r0], %r25
	.word 0xbe9d4000  ! 534: XORcc_R	xorcc 	%r21, %r0, %r31
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 27)
	setx	0x8edb88570000b9c5, %g1, %r10
	.word 0x819a8000  ! 536: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 3f)
	.word 0xbf34d000  ! 538: SRLX_R	srlx	%r19, %r0, %r31
	.word 0xb23d6185  ! 542: XNOR_I	xnor 	%r21, 0x0185, %r25
	.word 0xfa04c000  ! 544: LDUW_R	lduw	[%r19 + %r0], %r29
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 13)
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 1)
	setx	data_start_3, %g1, %r21
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf80c8000  ! 550: LDUB_R	ldub	[%r18 + %r0], %r28
	.word 0xb9540000  ! 551: RDPR_GL	<illegal instruction>
	.word 0xf60dc000  ! 554: LDUB_R	ldub	[%r23 + %r0], %r27
	.word 0xf65dc000  ! 556: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0xf604c000  ! 557: LDUW_R	lduw	[%r19 + %r0], %r27
	.word 0xba348000  ! 560: SUBC_R	orn 	%r18, %r0, %r29
	.word 0xf24c0000  ! 564: LDSB_R	ldsb	[%r16 + %r0], %r25
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 31)
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf51cc000  ! 572: LDDF_R	ldd	[%r19, %r0], %f26
	.word 0xf854a091  ! 574: LDSH_I	ldsh	[%r18 + 0x0091], %r28
	.word 0xf05c604a  ! 580: LDX_I	ldx	[%r17 + 0x004a], %r24
	.word 0xfc054000  ! 581: LDUW_R	lduw	[%r21 + %r0], %r30
	.word 0xfc140000  ! 582: LDUH_R	lduh	[%r16 + %r0], %r30
	.word 0xf044a1ca  ! 584: LDSW_I	ldsw	[%r18 + 0x01ca], %r24
	.word 0xf80560b1  ! 585: LDUW_I	lduw	[%r21 + 0x00b1], %r28
	.word 0x8395215a  ! 588: WRPR_TNPC_I	wrpr	%r20, 0x015a, %tnpc
	.word 0xfa5c60d4  ! 589: LDX_I	ldx	[%r17 + 0x00d4], %r29
	.word 0xf215e169  ! 592: LDUH_I	lduh	[%r23 + 0x0169], %r25
	.word 0xf25d20de  ! 594: LDX_I	ldx	[%r20 + 0x00de], %r25
	.word 0xf054e025  ! 596: LDSH_I	ldsh	[%r19 + 0x0025], %r24
	.word 0xb73d1000  ! 597: SRAX_R	srax	%r20, %r0, %r27
	.word 0xf404219c  ! 599: LDUW_I	lduw	[%r16 + 0x019c], %r26
	.word 0xfe144000  ! 602: LDUH_R	lduh	[%r17 + %r0], %r31
	.word 0xf80461ac  ! 606: LDUW_I	lduw	[%r17 + 0x01ac], %r28
	setx	0x352fdfcb0000ee85, %g1, %r10
	.word 0x839a8000  ! 608: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3500000  ! 609: RDPR_TPC	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 612: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbc84a185  ! 613: ADDcc_I	addcc 	%r18, 0x0185, %r30
	.word 0xf80d6198  ! 614: LDUB_I	ldub	[%r21 + 0x0198], %r28
	.word 0xb0ac0000  ! 618: ANDNcc_R	andncc 	%r16, %r0, %r24
	.word 0xb950c000  ! 619: RDPR_TT	<illegal instruction>
	.word 0xb844e08c  ! 620: ADDC_I	addc 	%r19, 0x008c, %r28
	.word 0x899521fc  ! 622: WRPR_TICK_I	wrpr	%r20, 0x01fc, %tick
	.word 0xfe5ca1e8  ! 627: LDX_I	ldx	[%r18 + 0x01e8], %r31
	.word 0xf8156076  ! 629: LDUH_I	lduh	[%r21 + 0x0076], %r28
	setx	data_start_5, %g1, %r19
	.word 0xb1500000  ! 631: RDPR_TPC	<illegal instruction>
	.word 0xfe550000  ! 633: LDSH_R	ldsh	[%r20 + %r0], %r31
	.word 0xf255e10b  ! 634: LDSH_I	ldsh	[%r23 + 0x010b], %r25
	.word 0xf8048000  ! 636: LDUW_R	lduw	[%r18 + %r0], %r28
	setx	0x1c4633580000bfce, %g1, %r10
	.word 0x819a8000  ! 639: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbc0c218a  ! 641: AND_I	and 	%r16, 0x018a, %r30
	.word 0xb9500000  ! 642: RDPR_TPC	<illegal instruction>
	.word 0xf65c4000  ! 645: LDX_R	ldx	[%r17 + %r0], %r27
	.word 0x8d95614f  ! 647: WRPR_PSTATE_I	wrpr	%r21, 0x014f, %pstate
	.word 0xf40c8000  ! 648: LDUB_R	ldub	[%r18 + %r0], %r26
	.word 0xb2848000  ! 652: ADDcc_R	addcc 	%r18, %r0, %r25
	.word 0xf814c000  ! 653: LDUH_R	lduh	[%r19 + %r0], %r28
	.word 0xf214a178  ! 654: LDUH_I	lduh	[%r18 + 0x0178], %r25
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 38)
	.word 0xf21dc000  ! 659: LDD_R	ldd	[%r23 + %r0], %r25
	.word 0xf44d4000  ! 660: LDSB_R	ldsb	[%r21 + %r0], %r26
	.word 0xf215e00b  ! 664: LDUH_I	lduh	[%r23 + 0x000b], %r25
	.word 0x8594e1d6  ! 665: WRPR_TSTATE_I	wrpr	%r19, 0x01d6, %tstate
	.word 0xf60da1ce  ! 666: LDUB_I	ldub	[%r22 + 0x01ce], %r27
	.word 0xb3518000  ! 669: RDPR_PSTATE	<illegal instruction>
	.word 0xb5510000  ! 672: RDPR_TICK	<illegal instruction>
	.word 0x899561d0  ! 673: WRPR_TICK_I	wrpr	%r21, 0x01d0, %tick
	.word 0xf21d8000  ! 678: LDD_R	ldd	[%r22 + %r0], %r25
	.word 0x8395e010  ! 679: WRPR_TNPC_I	wrpr	%r23, 0x0010, %tnpc
	.word 0xbb500000  ! 680: RDPR_TPC	<illegal instruction>
	setx	0x370d1a8000001f8a, %g1, %r10
	.word 0x819a8000  ! 682: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa0de024  ! 688: LDUB_I	ldub	[%r23 + 0x0024], %r29
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, d)
	.word 0x8395a1a6  ! 691: WRPR_TNPC_I	wrpr	%r22, 0x01a6, %tnpc
	.word 0xf40c20db  ! 692: LDUB_I	ldub	[%r16 + 0x00db], %r26
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 2c)
	mov	2, %r12
	.word 0x8f930000  ! 696: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, 34)
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 38)
	setx	data_start_5, %g1, %r18
	.word 0xf2148000  ! 704: LDUH_R	lduh	[%r18 + %r0], %r25
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, 3b)
	.word 0xba15e0c7  ! 708: OR_I	or 	%r23, 0x00c7, %r29
	.word 0x8d9461bb  ! 709: WRPR_PSTATE_I	wrpr	%r17, 0x01bb, %pstate
	.word 0xfa0520ce  ! 710: LDUW_I	lduw	[%r20 + 0x00ce], %r29
	.word 0xb3504000  ! 713: RDPR_TNPC	<illegal instruction>
	.word 0xbb520000  ! 717: RDPR_PIL	<illegal instruction>
	.word 0xf01c6013  ! 718: LDD_I	ldd	[%r17 + 0x0013], %r24
	.word 0x83956032  ! 719: WRPR_TNPC_I	wrpr	%r21, 0x0032, %tnpc
	.word 0xf8148000  ! 722: LDUH_R	lduh	[%r18 + %r0], %r28
	.word 0xf51d0000  ! 723: LDDF_R	ldd	[%r20, %r0], %f26
	.word 0x8394a140  ! 725: WRPR_TNPC_I	wrpr	%r18, 0x0140, %tnpc
	.word 0xf604614b  ! 726: LDUW_I	lduw	[%r17 + 0x014b], %r27
	.word 0xb3500000  ! 727: RDPR_TPC	<illegal instruction>
	.word 0xf80cc000  ! 728: LDUB_R	ldub	[%r19 + %r0], %r28
	.word 0xb28ce155  ! 732: ANDcc_I	andcc 	%r19, 0x0155, %r25
	.word 0xf2558000  ! 736: LDSH_R	ldsh	[%r22 + %r0], %r25
hwintr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_41), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfa4d6142  ! 744: LDSB_I	ldsb	[%r21 + 0x0142], %r29
	.word 0xf005e16d  ! 747: LDUW_I	lduw	[%r23 + 0x016d], %r24
	mov	2, %r12
	.word 0xa1930000  ! 755: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf25d4000  ! 758: LDX_R	ldx	[%r21 + %r0], %r25
	setx	data_start_2, %g1, %r20
	.word 0xbd2dd000  ! 760: SLLX_R	sllx	%r23, %r0, %r30
	.word 0xb8a5a068  ! 763: SUBcc_I	subcc 	%r22, 0x0068, %r28
	.word 0xf85c8000  ! 766: LDX_R	ldx	[%r18 + %r0], %r28
	.word 0xf20d4000  ! 768: LDUB_R	ldub	[%r21 + %r0], %r25
	.word 0xfa5da13a  ! 769: LDX_I	ldx	[%r22 + 0x013a], %r29
	.word 0xfe150000  ! 779: LDUH_R	lduh	[%r20 + %r0], %r31
	.word 0xf6150000  ! 780: LDUH_R	lduh	[%r20 + %r0], %r27
	.word 0xfa1c604d  ! 781: LDD_I	ldd	[%r17 + 0x004d], %r29
	.word 0xf0458000  ! 782: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0x8194e09d  ! 787: WRPR_TPC_I	wrpr	%r19, 0x009d, %tpc
	mov	1, %r12
	.word 0xa1930000  ! 789: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf25d8000  ! 795: LDX_R	ldx	[%r22 + %r0], %r25
hwintr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_42), 16, 16)) -> intp(2, 0, 16)
	.word 0xf805e04c  ! 801: LDUW_I	lduw	[%r23 + 0x004c], %r28
	.word 0xbcc5e0e0  ! 802: ADDCcc_I	addccc 	%r23, 0x00e0, %r30
	.word 0xb551c000  ! 803: RDPR_TL	<illegal instruction>
	.word 0x8d95e12f  ! 807: WRPR_PSTATE_I	wrpr	%r23, 0x012f, %pstate
	.word 0x87942190  ! 809: WRPR_TT_I	wrpr	%r16, 0x0190, %tt
	.word 0xb534c000  ! 818: SRL_R	srl 	%r19, %r0, %r26
	.word 0x81952180  ! 819: WRPR_TPC_I	wrpr	%r20, 0x0180, %tpc
	.word 0xf44c0000  ! 822: LDSB_R	ldsb	[%r16 + %r0], %r26
hwintr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_43), 16, 16)) -> intp(2, 0, 24)
hwintr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_44), 16, 16)) -> intp(2, 0, 3)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc1cc000  ! 829: LDD_R	ldd	[%r19 + %r0], %r30
hwintr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_45), 16, 16)) -> intp(2, 0, 2d)
	.word 0xb23d8000  ! 836: XNOR_R	xnor 	%r22, %r0, %r25
	.word 0xfa150000  ! 838: LDUH_R	lduh	[%r20 + %r0], %r29
	.word 0xf055e004  ! 840: LDSH_I	ldsh	[%r23 + 0x0004], %r24
hwintr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_46), 16, 16)) -> intp(2, 0, 27)
	.word 0x8795a1bb  ! 848: WRPR_TT_I	wrpr	%r22, 0x01bb, %tt
	.word 0x8394614f  ! 850: WRPR_TNPC_I	wrpr	%r17, 0x014f, %tnpc
	.word 0xfe05e08a  ! 851: LDUW_I	lduw	[%r23 + 0x008a], %r31
	.word 0xf01c4000  ! 852: LDD_R	ldd	[%r17 + %r0], %r24
	.word 0x819420ce  ! 857: WRPR_TPC_I	wrpr	%r16, 0x00ce, %tpc
	setx	data_start_5, %g1, %r19
	mov	2, %r12
	.word 0xa1930000  ! 860: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb084e090  ! 863: ADDcc_I	addcc 	%r19, 0x0090, %r24
	.word 0xf60d21d0  ! 870: LDUB_I	ldub	[%r20 + 0x01d0], %r27
	.word 0x9194a0eb  ! 871: WRPR_PIL_I	wrpr	%r18, 0x00eb, %pil
	setx	data_start_1, %g1, %r22
	.word 0x8994e0f7  ! 874: WRPR_TICK_I	wrpr	%r19, 0x00f7, %tick
	.word 0xf44d4000  ! 875: LDSB_R	ldsb	[%r21 + %r0], %r26
	setx	0xa206d5fa00000812, %g1, %r10
	.word 0x839a8000  ! 877: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_47), 16, 16)) -> intp(2, 0, 4)
	.word 0xfe04c000  ! 883: LDUW_R	lduw	[%r19 + %r0], %r31
	.word 0xf84ca111  ! 886: LDSB_I	ldsb	[%r18 + 0x0111], %r28
	.word 0xfa450000  ! 891: LDSW_R	ldsw	[%r20 + %r0], %r29
	.word 0xf8154000  ! 894: LDUH_R	lduh	[%r21 + %r0], %r28
	.word 0x8595206b  ! 895: WRPR_TSTATE_I	wrpr	%r20, 0x006b, %tstate
	.word 0xb5540000  ! 899: RDPR_GL	<illegal instruction>
	.word 0xbd350000  ! 900: SRL_R	srl 	%r20, %r0, %r30
hwintr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_48), 16, 16)) -> intp(2, 0, 23)
	.word 0xfe0c0000  ! 905: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0xbd51c000  ! 908: RDPR_TL	<illegal instruction>
hwintr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_49), 16, 16)) -> intp(2, 0, 16)
	.word 0xbd510000  ! 911: RDPR_TICK	<illegal instruction>
	.word 0x8194e15d  ! 912: WRPR_TPC_I	wrpr	%r19, 0x015d, %tpc
	setx	0xa179a1db0000fd06, %g1, %r10
	.word 0x839a8000  ! 914: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_50), 16, 16)) -> intp(2, 0, 2)
	.word 0xf40c8000  ! 918: LDUB_R	ldub	[%r18 + %r0], %r26
	.word 0xb4bdc000  ! 920: XNORcc_R	xnorcc 	%r23, %r0, %r26
	.word 0xb751c000  ! 924: RDPR_TL	<illegal instruction>
	.word 0xf605a1ca  ! 925: LDUW_I	lduw	[%r22 + 0x01ca], %r27
hwintr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_51), 16, 16)) -> intp(2, 0, e)
	.word 0xf644e02f  ! 927: LDSW_I	ldsw	[%r19 + 0x002f], %r27
	.word 0xfc45c000  ! 930: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xf61d2131  ! 931: LDD_I	ldd	[%r20 + 0x0131], %r27
	.word 0xb3520000  ! 932: RDPR_PIL	<illegal instruction>
	.word 0x919420d3  ! 935: WRPR_PIL_I	wrpr	%r16, 0x00d3, %pil
	.word 0xff1c4000  ! 937: LDDF_R	ldd	[%r17, %r0], %f31
hwintr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_52), 16, 16)) -> intp(2, 0, 31)
	.word 0xfc554000  ! 943: LDSH_R	ldsh	[%r21 + %r0], %r30
	.word 0xf244603e  ! 945: LDSW_I	ldsw	[%r17 + 0x003e], %r25
hwintr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_53), 16, 16)) -> intp(2, 0, 31)
	.word 0xfc05a010  ! 949: LDUW_I	lduw	[%r22 + 0x0010], %r30
	.word 0xf01ca145  ! 952: LDD_I	ldd	[%r18 + 0x0145], %r24
	.word 0xfc5cc000  ! 956: LDX_R	ldx	[%r19 + %r0], %r30
	.word 0xfe4420e1  ! 958: LDSW_I	ldsw	[%r16 + 0x00e1], %r31
	.word 0xf4450000  ! 959: LDSW_R	ldsw	[%r20 + %r0], %r26
	.word 0xf11ca030  ! 962: LDDF_I	ldd	[%r18, 0x0030], %f24
	.word 0xbf50c000  ! 972: RDPR_TT	<illegal instruction>
hwintr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_54), 16, 16)) -> intp(2, 0, 7)
	.word 0xbb50c000  ! 975: RDPR_TT	<illegal instruction>
	.word 0xfa0c6030  ! 976: LDUB_I	ldub	[%r17 + 0x0030], %r29
	.word 0xbf504000  ! 982: RDPR_TNPC	<illegal instruction>
	.word 0xf60da103  ! 984: LDUB_I	ldub	[%r22 + 0x0103], %r27
	.word 0xf60d21c6  ! 987: LDUB_I	ldub	[%r20 + 0x01c6], %r27
hwintr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_55), 16, 16)) -> intp(2, 0, 16)
	.word 0xf44c8000  ! 998: LDSB_R	ldsb	[%r18 + %r0], %r26
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb9aa0820  ! 1: FMOVA	fmovs	%fcc1, %f0, %f28
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 19)
	.word 0xb5a90820  ! 10: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xbdaa4820  ! 12: FMOVNE	fmovs	%fcc1, %f0, %f30
	setx	0x9ffa54b80000be95, %g1, %r10
	.word 0x839a8000  ! 15: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, a)
	.word 0x8995a001  ! 17: WRPR_TICK_I	wrpr	%r22, 0x0001, %tick
	.word 0xbda589e0  ! 19: FDIVq	dis not found

	.word 0xb0c521a0  ! 20: ADDCcc_I	addccc 	%r20, 0x01a0, %r24
	.word 0xb1a80420  ! 21: FMOVRZ	dis not found

	.word 0xb5510000  ! 22: RDPR_TICK	<illegal instruction>
	.word 0xb9a90820  ! 28: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbba58920  ! 29: FMULs	fmuls	%f22, %f0, %f29
	.word 0xb9a4c940  ! 31: FMULd	fmuld	%f50, %f0, %f28
	.word 0x8995e025  ! 33: WRPR_TICK_I	wrpr	%r23, 0x0025, %tick
	setx	data_start_4, %g1, %r19
	.word 0xbba8c820  ! 38: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xbf520000  ! 39: RDPR_PIL	<illegal instruction>
	.word 0xbfa00560  ! 40: FSQRTq	fsqrt	
	.word 0x8194a0fe  ! 44: WRPR_TPC_I	wrpr	%r18, 0x00fe, %tpc
	.word 0xb7a4c860  ! 47: FADDq	dis not found

	.word 0xb1a00560  ! 48: FSQRTq	fsqrt	
	.word 0xbd520000  ! 55: RDPR_PIL	<illegal instruction>
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb151c000  ! 59: RDPR_TL	<illegal instruction>
	.word 0xb9643801  ! 60: MOVcc_I	<illegal instruction>
	.word 0xb1a00560  ! 61: FSQRTq	fsqrt	
	.word 0x8194612c  ! 62: WRPR_TPC_I	wrpr	%r17, 0x012c, %tpc
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, b)
	.word 0xbba44940  ! 66: FMULd	fmuld	%f48, %f0, %f60
	.word 0x8394a116  ! 72: WRPR_TNPC_I	wrpr	%r18, 0x0116, %tnpc
	.word 0xb5a00560  ! 73: FSQRTq	fsqrt	
	.word 0xb9abc820  ! 78: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb73c9000  ! 80: SRAX_R	srax	%r18, %r0, %r27
	.word 0xbba5c8a0  ! 82: FSUBs	fsubs	%f23, %f0, %f29
	.word 0xb1a81c20  ! 83: FMOVRGEZ	dis not found

	.word 0xb43ca1ea  ! 85: XNOR_I	xnor 	%r18, 0x01ea, %r26
	.word 0xb1a489c0  ! 86: FDIVd	fdivd	%f18, %f0, %f24
	.word 0xbfa4c840  ! 89: FADDd	faddd	%f50, %f0, %f62
	.word 0xbb50c000  ! 92: RDPR_TT	<illegal instruction>
	.word 0xb350c000  ! 94: RDPR_TT	<illegal instruction>
	setx	data_start_7, %g1, %r18
	setx	0x81230e910000a981, %g1, %r10
	.word 0x819a8000  ! 97: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 15)
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, a)
	.word 0xbba488c0  ! 108: FSUBd	fsubd	%f18, %f0, %f60
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 1b)
	.word 0x8d94e103  ! 117: WRPR_PSTATE_I	wrpr	%r19, 0x0103, %pstate
	.word 0xb9480000  ! 119: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 25)
	.word 0xb7a8c820  ! 121: FMOVL	fmovs	%fcc1, %f0, %f27
	setx	data_start_5, %g1, %r17
	.word 0xb7a81820  ! 126: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0x81942179  ! 129: WRPR_TPC_I	wrpr	%r16, 0x0179, %tpc
	.word 0xb5a00540  ! 131: FSQRTd	fsqrt	
	.word 0xbfab0820  ! 135: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0x819520fa  ! 136: WRPR_TPC_I	wrpr	%r20, 0x00fa, %tpc
	.word 0xb3a54840  ! 138: FADDd	faddd	%f52, %f0, %f56
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 35)
	.word 0xbba94820  ! 142: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb9aa0820  ! 144: FMOVA	fmovs	%fcc1, %f0, %f28
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 39)
	.word 0xb3ab4820  ! 148: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb5a00520  ! 149: FSQRTs	fsqrt	
	.word 0xb9520000  ! 152: RDPR_PIL	<illegal instruction>
	.word 0xb9ab4820  ! 153: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb5aac820  ! 154: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xbda90820  ! 157: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb5a50960  ! 158: FMULq	dis not found

	mov	0, %r12
	.word 0x8f930000  ! 160: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x83952127  ! 164: WRPR_TNPC_I	wrpr	%r20, 0x0127, %tnpc
	.word 0xb7a548a0  ! 165: FSUBs	fsubs	%f21, %f0, %f27
	setx	data_start_1, %g1, %r23
	.word 0xb004c000  ! 167: ADD_R	add 	%r19, %r0, %r24
	.word 0xb3ab4820  ! 168: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb9a00040  ! 169: FMOVd	fmovd	%f0, %f28
	.word 0xb7520000  ! 176: RDPR_PIL	<illegal instruction>
	.word 0xbba40960  ! 177: FMULq	dis not found

	.word 0xbb508000  ! 179: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa588a0  ! 180: FSUBs	fsubs	%f22, %f0, %f31
	.word 0xb7a40840  ! 182: FADDd	faddd	%f16, %f0, %f58
	.word 0xb1a81c20  ! 185: FMOVRGEZ	dis not found

hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 24)
	.word 0xb7a88820  ! 197: FMOVLE	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda409a0  ! 202: FDIVs	fdivs	%f16, %f0, %f30
	.word 0xb5a5c860  ! 204: FADDq	dis not found

	.word 0x8d95610f  ! 206: WRPR_PSTATE_I	wrpr	%r21, 0x010f, %pstate
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 8)
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 38)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a00540  ! 215: FSQRTd	fsqrt	
	.word 0xb4254000  ! 217: SUB_R	sub 	%r21, %r0, %r26
	setx	data_start_7, %g1, %r22
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 35)
	setx	0x61ef2eaa00001d1f, %g1, %r10
	.word 0x839a8000  ! 224: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbda94820  ! 226: FMOVCS	fmovs	%fcc1, %f0, %f30
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 35)
	.word 0xbfa4c9a0  ! 229: FDIVs	fdivs	%f19, %f0, %f31
	.word 0x8d942191  ! 231: WRPR_PSTATE_I	wrpr	%r16, 0x0191, %pstate
	.word 0xbeb5c000  ! 232: ORNcc_R	orncc 	%r23, %r0, %r31
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb9a00540  ! 237: FSQRTd	fsqrt	
	.word 0xb3518000  ! 240: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa4c9a0  ! 245: FDIVs	fdivs	%f19, %f0, %f31
	.word 0xb1540000  ! 246: RDPR_GL	<illegal instruction>
	.word 0xbfaac820  ! 250: FMOVGE	fmovs	%fcc1, %f0, %f31
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 14)
	.word 0xb2bce049  ! 258: XNORcc_I	xnorcc 	%r19, 0x0049, %r25
	.word 0xbca5602e  ! 259: SUBcc_I	subcc 	%r21, 0x002e, %r30
	.word 0xbda409e0  ! 262: FDIVq	dis not found

	.word 0xbba488a0  ! 264: FSUBs	fsubs	%f18, %f0, %f29
	.word 0xb3a549a0  ! 265: FDIVs	fdivs	%f21, %f0, %f25
	.word 0xb81c4000  ! 266: XOR_R	xor 	%r17, %r0, %r28
	.word 0xb950c000  ! 269: RDPR_TT	<illegal instruction>
	.word 0xb5a90820  ! 270: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb750c000  ! 271: RDPR_TT	<illegal instruction>
	.word 0xbdab4820  ! 273: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb9a90820  ! 274: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb82c0000  ! 275: ANDN_R	andn 	%r16, %r0, %r28
	.word 0x9194e054  ! 276: WRPR_PIL_I	wrpr	%r19, 0x0054, %pil
	.word 0x8d956092  ! 280: WRPR_PSTATE_I	wrpr	%r21, 0x0092, %pstate
	.word 0xb7a5c840  ! 281: FADDd	faddd	%f54, %f0, %f58
	.word 0xb7a50920  ! 282: FMULs	fmuls	%f20, %f0, %f27
	.word 0xbd520000  ! 284: RDPR_PIL	<illegal instruction>
	.word 0xbb508000  ! 286: RDPR_TSTATE	<illegal instruction>
	.word 0xbba88820  ! 287: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb3a9c820  ! 293: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb3a00560  ! 294: FSQRTq	fsqrt	
	.word 0xb89da097  ! 296: XORcc_I	xorcc 	%r22, 0x0097, %r28
	.word 0xb3a94820  ! 297: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbba84820  ! 301: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbda00520  ! 302: FSQRTs	fsqrt	
	.word 0xba3420c0  ! 303: ORN_I	orn 	%r16, 0x00c0, %r29
hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 20)
	.word 0xb3a84820  ! 308: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xbda00520  ! 309: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 2)
	.word 0xb9abc820  ! 317: FMOVVC	fmovs	%fcc1, %f0, %f28
	setx	0x315d6b1100008a5d, %g1, %r10
	.word 0x819a8000  ! 318: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9a84820  ! 319: FMOVE	fmovs	%fcc1, %f0, %f28
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 23)
	.word 0xb77d2401  ! 323: MOVR_I	movre	%r20, 0x1, %r27
	.word 0xb9a5c9a0  ! 324: FDIVs	fdivs	%f23, %f0, %f28
	.word 0x8994e00c  ! 325: WRPR_TICK_I	wrpr	%r19, 0x000c, %tick
	.word 0xb9a5c9a0  ! 328: FDIVs	fdivs	%f23, %f0, %f28
	.word 0x819460c9  ! 331: WRPR_TPC_I	wrpr	%r17, 0x00c9, %tpc
	.word 0x8d94615d  ! 332: WRPR_PSTATE_I	wrpr	%r17, 0x015d, %pstate
	.word 0xbfaac820  ! 334: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xbf7d8400  ! 336: MOVR_R	movre	%r22, %r0, %r31
	.word 0x8395e0ca  ! 338: WRPR_TNPC_I	wrpr	%r23, 0x00ca, %tnpc
	.word 0xb5a80c20  ! 339: FMOVRLZ	dis not found

	.word 0xbba488e0  ! 343: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8195a190  ! 346: WRPR_TPC_I	wrpr	%r22, 0x0190, %tpc
	.word 0xbf500000  ! 349: RDPR_TPC	<illegal instruction>
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb7a508c0  ! 351: FSUBd	fsubd	%f20, %f0, %f58
	.word 0xb9500000  ! 355: RDPR_TPC	<illegal instruction>
	.word 0xbda4c9a0  ! 360: FDIVs	fdivs	%f19, %f0, %f30
	mov	2, %r12
	.word 0xa1930000  ! 361: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7a00520  ! 362: FSQRTs	fsqrt	
	.word 0xbead0000  ! 365: ANDNcc_R	andncc 	%r20, %r0, %r31
	.word 0xbda44960  ! 366: FMULq	dis not found

	.word 0xbba409a0  ! 369: FDIVs	fdivs	%f16, %f0, %f29
	.word 0xb7a48960  ! 370: FMULq	dis not found

	.word 0xb7a80420  ! 375: FMOVRZ	dis not found

hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 13)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x9194e156  ! 391: WRPR_PIL_I	wrpr	%r19, 0x0156, %pil
	.word 0xb3504000  ! 392: RDPR_TNPC	<illegal instruction>
	.word 0xbd356001  ! 393: SRL_I	srl 	%r21, 0x0001, %r30
	.word 0xbda8c820  ! 396: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xbc846069  ! 400: ADDcc_I	addcc 	%r17, 0x0069, %r30
	.word 0xb5a48820  ! 405: FADDs	fadds	%f18, %f0, %f26
	.word 0x8794a074  ! 412: WRPR_TT_I	wrpr	%r18, 0x0074, %tt
	.word 0xb5a508a0  ! 415: FSUBs	fsubs	%f20, %f0, %f26
	.word 0xb9a409c0  ! 416: FDIVd	fdivd	%f16, %f0, %f28
	.word 0xbda50960  ! 419: FMULq	dis not found

	.word 0xb7a94820  ! 420: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb7a80820  ! 421: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xbfa44960  ! 423: FMULq	dis not found

	.word 0xbda88820  ! 426: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb60420b3  ! 428: ADD_I	add 	%r16, 0x00b3, %r27
	.word 0xb3ab0820  ! 436: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0x89952109  ! 441: WRPR_TICK_I	wrpr	%r20, 0x0109, %tick
	.word 0xb3a00040  ! 443: FMOVd	fmovd	%f0, %f56
	.word 0xb9a58820  ! 445: FADDs	fadds	%f22, %f0, %f28
	.word 0xbfa81820  ! 447: FMOVRGZ	fmovs	%fcc3, %f0, %f31
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 8)
	.word 0x879521d0  ! 452: WRPR_TT_I	wrpr	%r20, 0x01d0, %tt
	.word 0xbd51c000  ! 455: RDPR_TL	<illegal instruction>
	.word 0xbba80420  ! 456: FMOVRZ	dis not found

	.word 0xb9a80420  ! 459: FMOVRZ	dis not found

	.word 0xbfa90820  ! 460: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb5a48820  ! 462: FADDs	fadds	%f18, %f0, %f26
	.word 0xbba8c820  ! 465: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb9a4c9c0  ! 467: FDIVd	fdivd	%f50, %f0, %f28
	.word 0xbba00540  ! 469: FSQRTd	fsqrt	
	.word 0xb3a00520  ! 473: FSQRTs	fsqrt	
	.word 0x859460fa  ! 475: WRPR_TSTATE_I	wrpr	%r17, 0x00fa, %tstate
	.word 0xb9a84820  ! 478: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb9a00020  ! 481: FMOVs	fmovs	%f0, %f28
	.word 0xbfaac820  ! 482: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb3a00020  ! 484: FMOVs	fmovs	%f0, %f25
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 2e)
	.word 0x8795217d  ! 488: WRPR_TT_I	wrpr	%r20, 0x017d, %tt
	.word 0xbf480000  ! 491: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbba508e0  ! 493: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbba00560  ! 499: FSQRTq	fsqrt	
	.word 0x91942078  ! 503: WRPR_PIL_I	wrpr	%r16, 0x0078, %pil
hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 39)
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, 39)
	.word 0xb5510000  ! 508: RDPR_TICK	<illegal instruction>
	.word 0x879521bc  ! 510: WRPR_TT_I	wrpr	%r20, 0x01bc, %tt
	.word 0xbba488c0  ! 511: FSUBd	fsubd	%f18, %f0, %f60
	.word 0xb8450000  ! 514: ADDC_R	addc 	%r20, %r0, %r28
	.word 0xb5a80c20  ! 515: FMOVRLZ	dis not found

	.word 0xb5a00560  ! 518: FSQRTq	fsqrt	
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 3c)
	setx	data_start_7, %g1, %r20
	.word 0xbaac8000  ! 523: ANDNcc_R	andncc 	%r18, %r0, %r29
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 14)
	.word 0xbba98820  ! 529: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb09c0000  ! 534: XORcc_R	xorcc 	%r16, %r0, %r24
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 2)
	setx	0x7e21baff00008d5e, %g1, %r10
	.word 0x819a8000  ! 536: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 22)
	.word 0xb7341000  ! 538: SRLX_R	srlx	%r16, %r0, %r27
	.word 0xbda90820  ! 541: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb43d611d  ! 542: XNOR_I	xnor 	%r21, 0x011d, %r26
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 31)
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 7)
	setx	data_start_0, %g1, %r17
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, e)
	.word 0xb5540000  ! 551: RDPR_GL	<illegal instruction>
	.word 0xb7aac820  ! 552: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb7ab8820  ! 555: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb5aa4820  ! 558: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb0348000  ! 560: SUBC_R	orn 	%r18, %r0, %r24
	.word 0xbfa81c20  ! 561: FMOVRGEZ	dis not found

	.word 0xbfa488e0  ! 562: FSUBq	dis not found

	.word 0xb3a409e0  ! 563: FDIVq	dis not found

	.word 0xb3a00040  ! 568: FMOVd	fmovd	%f0, %f56
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 2a)
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb5a88820  ! 583: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb7aa0820  ! 586: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0x83956131  ! 588: WRPR_TNPC_I	wrpr	%r21, 0x0131, %tnpc
	.word 0xb3a9c820  ! 591: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb5a4c9a0  ! 593: FDIVs	fdivs	%f19, %f0, %f26
	.word 0xbfa88820  ! 595: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xbf3c1000  ! 597: SRAX_R	srax	%r16, %r0, %r31
	.word 0xbdab8820  ! 600: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb5a81820  ! 601: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb1a00520  ! 604: FSQRTs	fsqrt	
	.word 0xbbab0820  ! 605: FMOVGU	fmovs	%fcc1, %f0, %f29
	setx	0xef7a1e9200009ed0, %g1, %r10
	.word 0x839a8000  ! 608: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd500000  ! 609: RDPR_TPC	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 612: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb284e046  ! 613: ADDcc_I	addcc 	%r19, 0x0046, %r25
	.word 0xb3a00040  ! 615: FMOVd	fmovd	%f0, %f56
	.word 0xb3a00540  ! 616: FSQRTd	fsqrt	
	.word 0xb5a449c0  ! 617: FDIVd	fdivd	%f48, %f0, %f26
	.word 0xbaad4000  ! 618: ANDNcc_R	andncc 	%r21, %r0, %r29
	.word 0xbb50c000  ! 619: RDPR_TT	<illegal instruction>
	.word 0xba44e02b  ! 620: ADDC_I	addc 	%r19, 0x002b, %r29
	.word 0xbdaa4820  ! 621: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0x8995a051  ! 622: WRPR_TICK_I	wrpr	%r22, 0x0051, %tick
	.word 0xbfa9c820  ! 624: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbda88820  ! 625: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb9a84820  ! 626: FMOVE	fmovs	%fcc1, %f0, %f28
	setx	data_start_0, %g1, %r16
	.word 0xb7500000  ! 631: RDPR_TPC	<illegal instruction>
	.word 0xb1a81820  ! 635: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	setx	0xd912bc3c00004a50, %g1, %r10
	.word 0x819a8000  ! 639: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb00c215c  ! 641: AND_I	and 	%r16, 0x015c, %r24
	.word 0xb3500000  ! 642: RDPR_TPC	<illegal instruction>
	.word 0x8d9560e8  ! 647: WRPR_PSTATE_I	wrpr	%r21, 0x00e8, %pstate
	.word 0xb1a40840  ! 650: FADDd	faddd	%f16, %f0, %f24
	.word 0xb485c000  ! 652: ADDcc_R	addcc 	%r23, %r0, %r26
	.word 0xb3a00560  ! 655: FSQRTq	fsqrt	
	.word 0xb5a90820  ! 656: FMOVLEU	fmovs	%fcc1, %f0, %f26
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 20)
	.word 0xbda5c820  ! 658: FADDs	fadds	%f23, %f0, %f30
	.word 0x85956089  ! 665: WRPR_TSTATE_I	wrpr	%r21, 0x0089, %tstate
	.word 0xbda00540  ! 667: FSQRTd	fsqrt	
	.word 0xbba80c20  ! 668: FMOVRLZ	dis not found

	.word 0xbf518000  ! 669: RDPR_PSTATE	<illegal instruction>
	.word 0xbba94820  ! 670: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb3a4c9e0  ! 671: FDIVq	dis not found

	.word 0xb7510000  ! 672: RDPR_TICK	<illegal instruction>
	.word 0x899521fd  ! 673: WRPR_TICK_I	wrpr	%r20, 0x01fd, %tick
	.word 0x839520dd  ! 679: WRPR_TNPC_I	wrpr	%r20, 0x00dd, %tnpc
	.word 0xb5500000  ! 680: RDPR_TPC	<illegal instruction>
	setx	0xd9f66cda0000ed4b, %g1, %r10
	.word 0x819a8000  ! 682: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9a40960  ! 683: FMULq	dis not found

	.word 0xb3a88820  ! 687: FMOVLE	fmovs	%fcc1, %f0, %f25
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 18)
	.word 0x8395219a  ! 691: WRPR_TNPC_I	wrpr	%r20, 0x019a, %tnpc
	.word 0xb5a5c960  ! 693: FMULq	dis not found

hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, 3d)
	mov	2, %r12
	.word 0x8f930000  ! 696: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbdaa0820  ! 697: FMOVA	fmovs	%fcc1, %f0, %f30
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, f)
hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 20)
	setx	data_start_4, %g1, %r23
hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, 13)
	.word 0xb01421b4  ! 708: OR_I	or 	%r16, 0x01b4, %r24
	.word 0x8d956000  ! 709: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xb1a80420  ! 711: FMOVRZ	dis not found

	.word 0xbf504000  ! 713: RDPR_TNPC	<illegal instruction>
	.word 0xbfa50840  ! 714: FADDd	faddd	%f20, %f0, %f62
	.word 0xb9a5c8c0  ! 716: FSUBd	fsubd	%f54, %f0, %f28
	.word 0xb3520000  ! 717: RDPR_PIL	<illegal instruction>
	.word 0x8394a0e1  ! 719: WRPR_TNPC_I	wrpr	%r18, 0x00e1, %tnpc
	.word 0xbba40920  ! 721: FMULs	fmuls	%f16, %f0, %f29
	.word 0xb1a54940  ! 724: FMULd	fmuld	%f52, %f0, %f24
	.word 0x8394a136  ! 725: WRPR_TNPC_I	wrpr	%r18, 0x0136, %tnpc
	.word 0xb1500000  ! 727: RDPR_TPC	<illegal instruction>
	.word 0xb7ab0820  ! 731: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xbc8c20ed  ! 732: ANDcc_I	andcc 	%r16, 0x00ed, %r30
	.word 0xbba589c0  ! 737: FDIVd	fdivd	%f22, %f0, %f60
	.word 0xb3a81420  ! 739: FMOVRNZ	dis not found

hwintr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_41), 16, 16)) -> intp(1, 0, 25)
	.word 0xbba00540  ! 746: FSQRTd	fsqrt	
	.word 0xbda50960  ! 748: FMULq	dis not found

	.word 0xb5a448c0  ! 750: FSUBd	fsubd	%f48, %f0, %f26
	.word 0xbba00540  ! 751: FSQRTd	fsqrt	
	.word 0xbda4c9a0  ! 753: FDIVs	fdivs	%f19, %f0, %f30
	.word 0xbda548a0  ! 754: FSUBs	fsubs	%f21, %f0, %f30
	mov	0, %r12
	.word 0xa1930000  ! 755: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	data_start_6, %g1, %r23
	.word 0xb52d5000  ! 760: SLLX_R	sllx	%r21, %r0, %r26
	.word 0xb8a5e156  ! 763: SUBcc_I	subcc 	%r23, 0x0156, %r28
	.word 0xbfa00520  ! 764: FSQRTs	fsqrt	
	.word 0xbba90820  ! 767: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb9a40820  ! 772: FADDs	fadds	%f16, %f0, %f28
	.word 0xbfa5c9a0  ! 773: FDIVs	fdivs	%f23, %f0, %f31
	.word 0xb7a00040  ! 774: FMOVd	fmovd	%f0, %f58
	.word 0xb1aac820  ! 778: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb7abc820  ! 783: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbda90820  ! 784: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0x8194a09b  ! 787: WRPR_TPC_I	wrpr	%r18, 0x009b, %tpc
	mov	2, %r12
	.word 0xa1930000  ! 789: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_42), 16, 16)) -> intp(1, 0, 3)
	.word 0xb8c460d0  ! 802: ADDCcc_I	addccc 	%r17, 0x00d0, %r28
	.word 0xb351c000  ! 803: RDPR_TL	<illegal instruction>
	.word 0xb3a94820  ! 806: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0x8d94210a  ! 807: WRPR_PSTATE_I	wrpr	%r16, 0x010a, %pstate
	.word 0x87946041  ! 809: WRPR_TT_I	wrpr	%r17, 0x0041, %tt
	.word 0xb7a4c920  ! 814: FMULs	fmuls	%f19, %f0, %f27
	.word 0xb3ab8820  ! 815: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xbdab4820  ! 817: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb334c000  ! 818: SRL_R	srl 	%r19, %r0, %r25
	.word 0x8195e077  ! 819: WRPR_TPC_I	wrpr	%r23, 0x0077, %tpc
	.word 0xb1a548a0  ! 821: FSUBs	fsubs	%f21, %f0, %f24
hwintr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_43), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb1aa8820  ! 826: FMOVG	fmovs	%fcc1, %f0, %f24
hwintr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_44), 16, 16)) -> intp(1, 0, 1e)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1aa0820  ! 831: FMOVA	fmovs	%fcc1, %f0, %f24
hwintr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_45), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb23dc000  ! 836: XNOR_R	xnor 	%r23, %r0, %r25
	.word 0xb7a00040  ! 839: FMOVd	fmovd	%f0, %f58
	.word 0xb1a489e0  ! 841: FDIVq	dis not found

	.word 0xb3ab8820  ! 842: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xbba81c20  ! 845: FMOVRGEZ	dis not found

hwintr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_46), 16, 16)) -> intp(1, 0, 37)
	.word 0x8794e0ab  ! 848: WRPR_TT_I	wrpr	%r19, 0x00ab, %tt
	.word 0x839421ad  ! 850: WRPR_TNPC_I	wrpr	%r16, 0x01ad, %tnpc
	.word 0x8195a187  ! 857: WRPR_TPC_I	wrpr	%r22, 0x0187, %tpc
	setx	data_start_6, %g1, %r21
	mov	2, %r12
	.word 0xa1930000  ! 860: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5a48960  ! 861: FMULq	dis not found

	.word 0xbe85e093  ! 863: ADDcc_I	addcc 	%r23, 0x0093, %r31
	.word 0xb5abc820  ! 866: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb9a40960  ! 868: FMULq	dis not found

	.word 0xb1a409a0  ! 869: FDIVs	fdivs	%f16, %f0, %f24
	.word 0x9194200c  ! 871: WRPR_PIL_I	wrpr	%r16, 0x000c, %pil
	setx	data_start_3, %g1, %r17
	.word 0x899520cf  ! 874: WRPR_TICK_I	wrpr	%r20, 0x00cf, %tick
	setx	0xa449effc00005ddd, %g1, %r10
	.word 0x839a8000  ! 877: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_47), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbfa5c8a0  ! 885: FSUBs	fsubs	%f23, %f0, %f31
	.word 0x8594e0fe  ! 895: WRPR_TSTATE_I	wrpr	%r19, 0x00fe, %tstate
	.word 0xbd540000  ! 899: RDPR_GL	<illegal instruction>
	.word 0xbf348000  ! 900: SRL_R	srl 	%r18, %r0, %r31
	.word 0xb1a80820  ! 903: FMOVN	fmovs	%fcc1, %f0, %f24
hwintr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_48), 16, 16)) -> intp(1, 0, 13)
	.word 0xbda81420  ! 906: FMOVRNZ	dis not found

	.word 0xbd51c000  ! 908: RDPR_TL	<illegal instruction>
hwintr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_49), 16, 16)) -> intp(1, 0, 21)
	.word 0xb1510000  ! 911: RDPR_TICK	<illegal instruction>
	.word 0x8195a038  ! 912: WRPR_TPC_I	wrpr	%r22, 0x0038, %tpc
	setx	0x1e90829600008b08, %g1, %r10
	.word 0x839a8000  ! 914: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9a5c960  ! 915: FMULq	dis not found

	.word 0xb1a4c940  ! 916: FMULd	fmuld	%f50, %f0, %f24
hwintr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_50), 16, 16)) -> intp(1, 0, 30)
	.word 0xb0bc8000  ! 920: XNORcc_R	xnorcc 	%r18, %r0, %r24
	.word 0xb151c000  ! 924: RDPR_TL	<illegal instruction>
hwintr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_51), 16, 16)) -> intp(1, 0, 1)
	.word 0xb7a48860  ! 928: FADDq	dis not found

	.word 0xbb520000  ! 932: RDPR_PIL	<illegal instruction>
	.word 0xb5a589a0  ! 933: FDIVs	fdivs	%f22, %f0, %f26
	.word 0x9195e13e  ! 935: WRPR_PIL_I	wrpr	%r23, 0x013e, %pil
	.word 0xbdabc820  ! 936: FMOVVC	fmovs	%fcc1, %f0, %f30
hwintr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_52), 16, 16)) -> intp(1, 0, d)
	.word 0xb9a00020  ! 940: FMOVs	fmovs	%f0, %f28
	.word 0xbba84820  ! 944: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbba488a0  ! 946: FSUBs	fsubs	%f18, %f0, %f29
hwintr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_53), 16, 16)) -> intp(1, 0, 26)
	.word 0xbba80420  ! 950: FMOVRZ	dis not found

	.word 0xb3a4c9c0  ! 951: FDIVd	fdivd	%f50, %f0, %f56
	.word 0xb5a449c0  ! 966: FDIVd	fdivd	%f48, %f0, %f26
	.word 0xb950c000  ! 972: RDPR_TT	<illegal instruction>
	.word 0xb9a589a0  ! 973: FDIVs	fdivs	%f22, %f0, %f28
hwintr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_54), 16, 16)) -> intp(1, 0, 16)
	.word 0xb950c000  ! 975: RDPR_TT	<illegal instruction>
	.word 0xbf504000  ! 982: RDPR_TNPC	<illegal instruction>
hwintr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_55), 16, 16)) -> intp(1, 0, 23)
	.word 0xb5a588e0  ! 993: FSUBq	dis not found

	.word 0xb5a9c820  ! 994: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb5a84820  ! 997: FMOVE	fmovs	%fcc1, %f0, %f26

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

	.xword	0x40f52bd8d2222a6c
	.xword	0xda98e0943e8f3cf1
	.xword	0x1e2bacbe907f6980
	.xword	0x9c89c4da989bbf0d
	.xword	0xf050c9e64452da60
	.xword	0x70213d6c39d3b576
	.xword	0x05fb5e2565777fa0
	.xword	0xbf833d788942e568
	.xword	0x42c9eb5467dd4a3c
	.xword	0x2a81e2f0cf9cb3a8
	.xword	0x81e7277da5294881
	.xword	0x7cc29b835a3f7e01
	.xword	0x6b313edf19f7df5e
	.xword	0xaa2debc7db2f17b5
	.xword	0xda61976dd19dc87e
	.xword	0x1d1adb56fb649bce
	.xword	0x2852967618b3d7f1
	.xword	0x77e88a288a69727f
	.xword	0x36e23cf24b0bdd1c
	.xword	0xdf47978efc6a61a0
	.xword	0x17b0581d7ed40632
	.xword	0xce09cb00f069578b
	.xword	0x3edacf15452af8ff
	.xword	0x8c65c6a976f5afe8
	.xword	0xe931a04c3e02986b
	.xword	0xe19f63370c4625ed
	.xword	0x96490366e8749379
	.xword	0x31746fffe500c9d2
	.xword	0xa2a4cf8648e21bc2
	.xword	0xf8d0e929ccfb7211
	.xword	0xf6bb27a6898bc5b4
	.xword	0x779776e4a42fcaab
	.xword	0x1dabae77144b1e2c
	.xword	0x260d688bdd5ad9c5
	.xword	0x8f260d9722a946de
	.xword	0xc9c6642c46734073
	.xword	0x51b2547067e6c847
	.xword	0x6237df74b0a608a3
	.xword	0xa5422094762c1e30
	.xword	0xe4d6e01519fc0b58
	.xword	0x4b8e8850b6d29258
	.xword	0xd1c49ec5d805c0a9
	.xword	0x98964469ecb19690
	.xword	0x2a38f8433b76c4ee
	.xword	0x164317aa39b91459
	.xword	0x1a43fc9f998f2db8
	.xword	0x5a02e51ea3864895
	.xword	0xb3beae5070ae0f0e
	.xword	0xe5d0db02a64a3bd0
	.xword	0xfb1c29995f7ecc6f
	.xword	0x8c277234a31d6ea9
	.xword	0x9b3c035ca9061f0e
	.xword	0xf39d0509c7ab781a
	.xword	0x69104bac5e87237b
	.xword	0xd129a8c2a80b7cbf
	.xword	0x68eb985e81f9dd93
	.xword	0x09b2fc11dba0fd33
	.xword	0xc0bbcc9fbdc19d4f
	.xword	0x06ea7ada76ea35be
	.xword	0xe14fce1de14af7bb
	.xword	0x2e2c58964314bfda
	.xword	0xfb7a0e2d24f0bbf3
	.xword	0xcfd42df9a7cd0584
	.xword	0x7ae1eaad5f73f998
	.xword	0xa6d854543f3af213
	.xword	0x702aeaf04932dde1
	.xword	0xb28a461b8de5969d
	.xword	0x5daed275840bc5e8
	.xword	0x9ed216512a2a3b8e
	.xword	0xdee5363de2da25e5
	.xword	0xf75b407355af4df8
	.xword	0x46c1cd7b153672c0
	.xword	0x3352654bb2079c1e
	.xword	0x456744e9efd6aa92
	.xword	0x6646c9e2bb562ab1
	.xword	0xe53a14821c78d914
	.xword	0xc2552438d4c95718
	.xword	0x3efd782affcfadf8
	.xword	0x06cb83fa120a1450
	.xword	0x37517b0c32a18a09
	.xword	0xb9a9353f7b46a623
	.xword	0x95e428e5b8f05435
	.xword	0xb0af9d9bc0f1ccbd
	.xword	0x7ea0064010fe53df
	.xword	0x161ae04e1a8befaa
	.xword	0x71c6e0dc04faaba8
	.xword	0x6df85ae669ee60b5
	.xword	0x01223ad89cc56ee4
	.xword	0x89f11c47c0609619
	.xword	0x5fedee6b003c08bd
	.xword	0x5cfca3bdff77c437
	.xword	0x5c078268859c2d4d
	.xword	0xd995e70c37133e6e
	.xword	0xa0b80d83f67bd243
	.xword	0xbed8d1aa95661c78
	.xword	0x9996ddd21b45dd16
	.xword	0xad605fb0d2324775
	.xword	0x23f57b6d8438cd4b
	.xword	0x23a5112d2078cf7c
	.xword	0xbef64a47f76e51dd
	.xword	0x01f451f01448c821
	.xword	0xfdc1de60d36f2f56
	.xword	0x6b48c7b27dec9e4a
	.xword	0x4db3acde5f2409df
	.xword	0x5a8313d949ac875a
	.xword	0x874b754691da4cc0
	.xword	0xa10694808413843a
	.xword	0x19140f2876a2263e
	.xword	0xc79b7865cecb0f04
	.xword	0x73ed391c6667e73f
	.xword	0x2971f99ac5acd4ef
	.xword	0x590eaeffa039465b
	.xword	0x1a95d1c7b026fd17
	.xword	0xa15116ffaaf96d5f
	.xword	0x3cfff0a16a83f722
	.xword	0xe39fa23f5ef1f790
	.xword	0xef0c8b931dd95fb5
	.xword	0x9adaf87761f90460
	.xword	0x4db915d2432759dd
	.xword	0xa9ae6005c746e785
	.xword	0x44e7acdd8ebbafef
	.xword	0x3a7a1f8067a70066
	.xword	0xeb79ba14bdc6d0a6
	.xword	0xf9ee5b98093a5cd7
	.xword	0x2875bd81f0bace2f
	.xword	0xe71136dcac3cae8a
	.xword	0xbff3768fad321464
	.xword	0x0c80e7395cb60d17
	.xword	0xa570d5cecf5ba63f
	.xword	0xe6bd0c481b199a60
	.xword	0xf940e2b44ddc7c81
	.xword	0xe22bf834f97b984b
	.xword	0xa28a9cab3c2e5e65
	.xword	0x7e2fe74d26a00186
	.xword	0x208e2192d9cb038c
	.xword	0x3c19ea05b73ce15f
	.xword	0x6ce80be44d48ae05
	.xword	0xdf1edfed6668ff50
	.xword	0x43e49ea4a74906d2
	.xword	0x560e3bdb23f770c5
	.xword	0x345788b756227473
	.xword	0x13489570fc1a7ab7
	.xword	0xca43ac6c741ed6ab
	.xword	0x18e63ea714a3530c
	.xword	0xe0a7e6281f7d1f65
	.xword	0xe96710df019d11aa
	.xword	0x5917fa56953e2c66
	.xword	0x06099c32ef612d42
	.xword	0x355cd63303d1ea17
	.xword	0x4acb6eff257b47f0
	.xword	0x355302f2321c73ca
	.xword	0x809ea2cb912a8fe7
	.xword	0x63011fce5876c78e
	.xword	0x0d9af5eb06a127a2
	.xword	0xf873f040c08873a7
	.xword	0xc1513d3ad2457a20
	.xword	0x9e022f345c6aefb4
	.xword	0x88585bb07ab33e3d
	.xword	0xaeae6b632e3fbc36
	.xword	0x0678192dd90df951
	.xword	0xae068679adef8e37
	.xword	0xee1884284c2a08f5
	.xword	0x6821e9c45ab3735f
	.xword	0x9fae21c24a572804
	.xword	0xd99f48856541c31b
	.xword	0xd96dbab1e0d9301d
	.xword	0x0a4175194746d815
	.xword	0x04a0ce3a6fca46fb
	.xword	0xc5f6a8edc36ea1e1
	.xword	0x136fbbc96157f321
	.xword	0x2c4801a363ff1892
	.xword	0xb5510d3fafdddae6
	.xword	0x1e18590c801ba8b0
	.xword	0x2c1eeaf490e7e204
	.xword	0xb88ee6af8bdea6d2
	.xword	0x8226688e11050dc2
	.xword	0x55e01fe1206ed50e
	.xword	0x44a94b3185e8083b
	.xword	0x71b6b1fa23ffe0c1
	.xword	0x4f7bcdf76ae21980
	.xword	0x7ea927ac0a718ce3
	.xword	0xdf15c9dab94a0958
	.xword	0x0f8b2847c65da071
	.xword	0x625ff0f2df7808fa
	.xword	0x25c56367e351dba1
	.xword	0x2b397167cb2c3b57
	.xword	0xd9e247f08b2a4d90
	.xword	0x49543b16c87a746b
	.xword	0xb70f788431491693
	.xword	0xcd921bece7d3d5f9
	.xword	0xa3fc7152d15c0497
	.xword	0x675d16458c2c1858
	.xword	0xd84133b24906d2db
	.xword	0x74a713870b19842c
	.xword	0xbd4fb7b4b16da26c
	.xword	0x07233eb039cf13c8
	.xword	0x86dbce036022269f
	.xword	0x1378c8d9eb34278c
	.xword	0xe597f2dfc1108d44
	.xword	0xe184373b9c65b0ea
	.xword	0xb78f31b6b1873479
	.xword	0x86a27ae9a5e2b6e4
	.xword	0xe603e4a35acb1ee0
	.xword	0x853e98d6074207cf
	.xword	0xb959b7db356847ee
	.xword	0x1123dfc6467435ed
	.xword	0xa83eb8acfd0a0b50
	.xword	0xff8366b27cf3c5a7
	.xword	0x1069df4f0acf138f
	.xword	0x2a7b829bd80b3977
	.xword	0xd17a6d76c7006dc0
	.xword	0x613deca953512955
	.xword	0x86d47f41178fb457
	.xword	0x9c22e2e30a7670e1
	.xword	0x80abc0701e22cd21
	.xword	0x2f2f7820f8344cce
	.xword	0x41da11a7069f31fc
	.xword	0x877da338e1e64629
	.xword	0x71021ab004a86f6c
	.xword	0x9a180a5dbf561256
	.xword	0x6430a02b94a91904
	.xword	0x3d5bfcd9d5451c69
	.xword	0xc7832340b36a753d
	.xword	0x481c11c5e52179a6
	.xword	0xfd7822fd894f2807
	.xword	0x271a999e159b3607
	.xword	0xc7ac96145fcd1e51
	.xword	0x1056de783dcf1e23
	.xword	0x6d75cd4e7003752c
	.xword	0xccf0d45ad7753c66
	.xword	0x41598730a8788c56
	.xword	0xbe52b4391291987e
	.xword	0xf540c378ea4bc01c
	.xword	0x21d8dfb3f1f51082
	.xword	0x152668727011fd5e
	.xword	0x5db640112c7e8f5d
	.xword	0x14106ff5de273622
	.xword	0x2a2018a9fe5d5c3e
	.xword	0xc94b6b626c031ecd
	.xword	0x9272b39eacc3c28d
	.xword	0x802430235ba4571a
	.xword	0xa8355f35fa101641
	.xword	0x240763d39f1bb75f
	.xword	0x8613a7a97f0ed60f
	.xword	0x2c2f11ee3cd9d0f3
	.xword	0x74fafe2f48cad22e
	.xword	0xb33aa113a4a138de
	.xword	0xaf38b038f1c31603
	.xword	0x2cdd30fd2ac8348e
	.xword	0x02423124aaae4595
	.xword	0x9245cecfeab9dc46
	.xword	0xfac4f4296a6e6f3f
	.xword	0xc62594ebed8ca0f1
	.xword	0xd543f13574468ef3
	.xword	0x4c22154e3ec403b9
	.xword	0x9ae8337f51789264
	.align 0x2000
	.data
data_start_1:

	.xword	0xdacf0745ee50e6a4
	.xword	0x7311abdb0a729e89
	.xword	0x46f9c90ae0ecd162
	.xword	0x4fbe373cbc34fa04
	.xword	0x932299e5689a05f8
	.xword	0xd099542cf4b2f3e0
	.xword	0x4e430f3b5d02a16a
	.xword	0xad436f43ecb4e851
	.xword	0x762ffec6fc2e2873
	.xword	0xea4eeba9620ec7cb
	.xword	0x12fd51b19ca81e82
	.xword	0x5084e89a9687fe75
	.xword	0x005a84ef44b7e696
	.xword	0x979804db8599d4d7
	.xword	0xb1e6162e4cb34174
	.xword	0x808ecfc50274a745
	.xword	0x7dccbaa6c25aeeb1
	.xword	0x60173be3cf27e614
	.xword	0x217a95bab075428d
	.xword	0x5b101cb41605d15a
	.xword	0xdf7541c6dc6e9154
	.xword	0xab86bd89077e174e
	.xword	0xcef55a33332894cb
	.xword	0xe4487d3ddaabc173
	.xword	0xf3ac63990ac1b3b4
	.xword	0xa78b95aaf2686a8b
	.xword	0xa11d6cb301bcf9ee
	.xword	0xae76010e759771a1
	.xword	0x1431fbd39079ce64
	.xword	0x9f2e7da3f60614f7
	.xword	0x28b7bcbc4d6a33f4
	.xword	0x54424411a66cd58a
	.xword	0xfd94171ebf2a0fe1
	.xword	0xefd782ccfc0cb87a
	.xword	0xe55ea82c59e4322e
	.xword	0xebfdc13d3dadc92d
	.xword	0xc4789c4ce3cca6b6
	.xword	0x8a00081a94d021b4
	.xword	0x6122f1a32d498426
	.xword	0xe9140f94c729413b
	.xword	0x52ea76dc3c02813d
	.xword	0xbc47042a82cb13eb
	.xword	0x32831dee445f0ea9
	.xword	0x2d3e8e565cf41ec0
	.xword	0x6d202a4b7f956ff0
	.xword	0x6ea1f584370f380f
	.xword	0x362eed24dcd96a7d
	.xword	0xe8e783f3e36e50ae
	.xword	0xd95f728b293b81f5
	.xword	0x091ac48d37e697fe
	.xword	0x461b60de563a187d
	.xword	0xbc2dbace29aacfa5
	.xword	0x11ce1aeb1080dd76
	.xword	0x68c15a1248d5e6e1
	.xword	0x8eea3fe7724bc005
	.xword	0xe17d82c5bf7678c4
	.xword	0x74f001861e780d1e
	.xword	0x16e84f61ce60b9ef
	.xword	0xd089907184819dca
	.xword	0x59815ee80677f484
	.xword	0xb8d50889a48c93c6
	.xword	0x49f423ac39e5ae30
	.xword	0x7fd01cd7547e8929
	.xword	0x2e6ab11625119e35
	.xword	0x9ab604808aa721ba
	.xword	0xc3880c8b692717a7
	.xword	0xc6fafc9578657673
	.xword	0xa72000ecf360157d
	.xword	0xf8f854dbe33a5c79
	.xword	0x6e0e712cf7fb0683
	.xword	0xcd0e88d55aa63a2b
	.xword	0x600d849fc6cd5e24
	.xword	0x9db8a0c2b18b1ef5
	.xword	0xa4d78db2f9583d92
	.xword	0x5605fa5dc7b81966
	.xword	0x25be6bf394f961df
	.xword	0xaa5ecdb056d1d76a
	.xword	0x4b435f957d7c3c30
	.xword	0x3867d93cfbc07de8
	.xword	0x2acf68a2b3abdc8a
	.xword	0xa198447504c2b08b
	.xword	0x0ee8a9f68d4001ac
	.xword	0x1a1ebd0784ce5b44
	.xword	0x49b17446265dcc20
	.xword	0xf0b47d51caccb831
	.xword	0x92ee08830dee39b4
	.xword	0xb6225c4b96424718
	.xword	0x6aef782659c8d48c
	.xword	0xb2b9ab64e0d24377
	.xword	0xa0b318072eb7140d
	.xword	0x45f56cd981d2502d
	.xword	0x13ec44b367717111
	.xword	0xc793de6b0c083095
	.xword	0xae3d0abb6b209fc5
	.xword	0x1dd6f13b5ebf13b9
	.xword	0x800e47c336a7816a
	.xword	0xbb98791432689527
	.xword	0xd123cac527838d13
	.xword	0xf250bdbcce40df1e
	.xword	0x01124057e0e249fd
	.xword	0x69e826996c220add
	.xword	0xde0dcf7e0e2f31d6
	.xword	0xd7623e5f739200a5
	.xword	0xa97c4ac81fc1ad6a
	.xword	0x54bfd0a0f63a4c09
	.xword	0x95d3b1e6a8cbe337
	.xword	0xb91308b3963af8bc
	.xword	0xeeca6f917a4d01e5
	.xword	0x8bbc50a17cda0c53
	.xword	0x2da2e94880b10ff7
	.xword	0x80b597f1ec79600d
	.xword	0x64d535a8977a5ce0
	.xword	0xc43f6bc36c335fba
	.xword	0xea15a06f03465aff
	.xword	0x24140ae4f11dfccb
	.xword	0x820232b91460e9d8
	.xword	0x700700255718a7f5
	.xword	0x7350d5ab7c1809eb
	.xword	0xd4ad82c54f7688d1
	.xword	0x6cceaf3acf58ab0a
	.xword	0x25ad09039f7ca900
	.xword	0x08c0ab60cc729a40
	.xword	0xf81eda350d43aef7
	.xword	0x78cb089e4904bfb2
	.xword	0x0801bc61dfbae3f8
	.xword	0x2cbc660fe8844c72
	.xword	0x8f211f531a252786
	.xword	0x4c022b76269ea816
	.xword	0x1f913492a1aa1e81
	.xword	0xa4a9d157fb4f7345
	.xword	0x782ac40856885ad0
	.xword	0x1bf1e70b3774c007
	.xword	0x3046ed1369c8d5af
	.xword	0xef2c9cfaedd5808c
	.xword	0xc3cbaf5116355f57
	.xword	0x424589bf127fb999
	.xword	0x5637ad132427f53c
	.xword	0x3e96974b1f052031
	.xword	0x3be143c9bacfb658
	.xword	0x904935af1b88b3b2
	.xword	0xb0bced271fb8c08a
	.xword	0xc17bc0412f402269
	.xword	0x35d6b0aa4d6563ab
	.xword	0x451f16df35c5fd0e
	.xword	0xab31e9297cefd013
	.xword	0x45145d7d53f95227
	.xword	0x235128930b94d4dd
	.xword	0x9bef36b60dc086f7
	.xword	0x0a6a2ba95a9f438b
	.xword	0xfcfdcc6722de6d23
	.xword	0xd651695806af4a41
	.xword	0xb955694f7d44c508
	.xword	0xc77c81e2f7a74be7
	.xword	0x95c69e2e24bd33d7
	.xword	0x4e2d3ab0fc2f822f
	.xword	0x5ac68d4a186411a6
	.xword	0xd5fbdf371930badc
	.xword	0xe93eb503f9b17c16
	.xword	0x16f2fe22adda0692
	.xword	0xb69a32d71a16b9ac
	.xword	0xd732cd239d829b8a
	.xword	0x714818102166eaae
	.xword	0x8d8fab5bca85640d
	.xword	0x50ee73223ddf035f
	.xword	0x463bc840b8fccec1
	.xword	0x26648ff4fb53a097
	.xword	0xd94ded7b2a21c625
	.xword	0x2a4bb01628f69a5e
	.xword	0x10a6e43ac844aa81
	.xword	0xea9c4189aecd79a0
	.xword	0x29043e013d8a3017
	.xword	0x43d36b5baf7076a3
	.xword	0xe7b0dd295c6e45d6
	.xword	0x2bfcde5639fe123a
	.xword	0x000a8425583454c9
	.xword	0x7913909f81ce49b8
	.xword	0xb36f60d3a484dbe4
	.xword	0xba12966d2b63bca5
	.xword	0xb7a46cda881b795c
	.xword	0x983b5b2693569858
	.xword	0x2cbe4a5ed9689494
	.xword	0xd71e66f673a7f91d
	.xword	0xd9a24b5d93a14bdb
	.xword	0x078264ae48c691e7
	.xword	0xf03237e10d3837cf
	.xword	0x04ae48bfff734095
	.xword	0x9e1faf4e727d83b9
	.xword	0xa6ebc8aa982f7b5b
	.xword	0xfe424e03c2b5279b
	.xword	0xc459561484d22515
	.xword	0xd90ef38ebc79aaa2
	.xword	0xf54ac18a9d707d60
	.xword	0xa3c1d877a3268f17
	.xword	0xbb94a218fe798dfe
	.xword	0x04468b39b02d897b
	.xword	0xc13b1273c8555cfb
	.xword	0xb9aafbdceed717fe
	.xword	0x0eb3d591df2e6f40
	.xword	0xc31026731b8e93ca
	.xword	0x4ed895aedbe67702
	.xword	0x8c89ec0e13793454
	.xword	0x6fe69c3fca520796
	.xword	0x4c2760708c9c7820
	.xword	0xb43250c36cb5e81d
	.xword	0xa1e499aa6051ee42
	.xword	0xc9198cc9e6611f00
	.xword	0x9aa7290d719f9c2a
	.xword	0x201791e22750e7e9
	.xword	0xd17bdf35e478641d
	.xword	0x40849b4dd7881486
	.xword	0x45b1b8f6f25f7e90
	.xword	0xf1e5bad6dd3ade5b
	.xword	0xc9b6a16271e33851
	.xword	0x5bf17e25158ce09a
	.xword	0x557f0c55a0b4f28e
	.xword	0xac9432707a87bf0f
	.xword	0x667db2b65b590f70
	.xword	0xedb66b4f7890d656
	.xword	0xbe1c79948eb41e89
	.xword	0x07d6ffaedc545942
	.xword	0x19565e2631615e6d
	.xword	0x46065e865ae1da42
	.xword	0x649404d8afbbac53
	.xword	0xc80a21bccf0fff43
	.xword	0x2455d29d803c7103
	.xword	0x3c4bcd1c424a6f1f
	.xword	0xb8c34fed7bc43cc3
	.xword	0x95776091d901402f
	.xword	0x57bb11751926bcb1
	.xword	0x01f2ac4158fad303
	.xword	0xaeed53defbaf0f11
	.xword	0x05bdad448d18a6f5
	.xword	0x629e5d785bacaa73
	.xword	0xcc935cf6246de682
	.xword	0xf356a70a89c08365
	.xword	0x2bb3dc7cb48c14f0
	.xword	0x88834a75ae6e4416
	.xword	0x9c02673241c7216c
	.xword	0x15eccda1633d89a1
	.xword	0x033d8300620dc2dd
	.xword	0xa01a99f2905ba724
	.xword	0x42f34e3edbd18a49
	.xword	0x0ff0eb958d4ed278
	.xword	0xdb39afcd9c57e266
	.xword	0x5572f77d935add72
	.xword	0xa483aa6c4a82bd8e
	.xword	0x551208e47ce3e455
	.xword	0x8db19ad235753fa7
	.xword	0xdd28b63f360e3df7
	.xword	0x3ab7099596648cef
	.xword	0x33f7232af49c5195
	.xword	0x976f221099534730
	.xword	0x037b62c3eab59808
	.xword	0x43f897210741e957
	.xword	0x08e60513d3f43a7d
	.xword	0xd08c15ac8d9c85d1
	.align 0x4000
	.data
data_start_2:

	.xword	0x4910aa056cb63ae5
	.xword	0xc10abf06c40b66fb
	.xword	0x5059afc0827fbe67
	.xword	0xda9b7bc2b8b0fad2
	.xword	0x10937b78e37d54fb
	.xword	0x99feb282413df35f
	.xword	0x0241005729e3aec1
	.xword	0x95da68654d19e3bc
	.xword	0xfd1ed5ffa14acaab
	.xword	0x88f42e5bb3a5c35e
	.xword	0xe191c1bc9f370385
	.xword	0xf138d62b79641532
	.xword	0x17f3b08b71ebf4e3
	.xword	0x18b70a5aa2aea404
	.xword	0x4a17fdcc98a4da10
	.xword	0xdc2d3462ff8fa8b9
	.xword	0x95e0b4905c2c678d
	.xword	0x26f4564dca24d4a3
	.xword	0xeaec7c121ba386a6
	.xword	0x1758276da3bd3826
	.xword	0x076889705c7e57cd
	.xword	0x43175a514d463ba3
	.xword	0xd307c994b6604dc8
	.xword	0xd219e20479170c41
	.xword	0x43ccf57a76f6184b
	.xword	0x8d42310419758c0b
	.xword	0x4fe936745368101d
	.xword	0x3d348e872b79c352
	.xword	0x61a117667e5b09c7
	.xword	0x2090e7d714d90ce9
	.xword	0xab0934f5e8cdd652
	.xword	0xddc9975c442803b2
	.xword	0xbbbef90b8de49844
	.xword	0x0642b8012219fbec
	.xword	0x2f6cfd096a15ea46
	.xword	0xbf25c4e093376cd2
	.xword	0xc566c744a7c0c479
	.xword	0xd811a0e7f1f92cb9
	.xword	0xaa05ffd97a109a74
	.xword	0x7a678b19575ff9fd
	.xword	0x851c8fc9fec85e58
	.xword	0x3b83ac876e3f00d4
	.xword	0x0be6f33de9e9223a
	.xword	0xf81ab7da8a9f00c7
	.xword	0x468c435b00d9932e
	.xword	0xbc22a2c85c5aeeb4
	.xword	0xba25f3d0167eb1b3
	.xword	0xfe1bd5461e22e209
	.xword	0x4408eaf0b2bd5495
	.xword	0x0181c45d5be6490d
	.xword	0x90d149953a172647
	.xword	0xb875bcfb79fe2408
	.xword	0xd57e3e5a9cf8beed
	.xword	0xfad6a67653c51447
	.xword	0x7b4b9e3901cecd34
	.xword	0x3d9779d41b462af5
	.xword	0x80e10a5746ce7b01
	.xword	0xe470c4533c562ddc
	.xword	0xdbfea2beb643cb5d
	.xword	0x3cb23fc5b2e7bae9
	.xword	0xf34d454a247a078e
	.xword	0x06ad7ceaa8f51bc6
	.xword	0x17ec58e7fd6961b2
	.xword	0x701803cf702b4596
	.xword	0xd3c44ba190bbae11
	.xword	0xa90f6393324b43c6
	.xword	0xa2fb5fbd70011e7c
	.xword	0x90f228e3431738ca
	.xword	0x1a4328ef4f044e0a
	.xword	0xa62e8bd47caee318
	.xword	0xc118309e6b5ecb89
	.xword	0xfdf8cd72b974966e
	.xword	0x4513c0f7f4db728b
	.xword	0x20bbdbac11ca3ad4
	.xword	0x9add6fa51be1b9a7
	.xword	0x99994ba99c89b522
	.xword	0x0d171e395dc066d0
	.xword	0xdbbd4808a6d19ce6
	.xword	0x2efe577bc91290ab
	.xword	0x91b0f39d980cf06d
	.xword	0xb3e4b7908f5f233c
	.xword	0xfe56aa9d60710234
	.xword	0x13ae776729d4d341
	.xword	0xe9027837e6d77eb6
	.xword	0x769d7bf5ebbb7949
	.xword	0xdbea96205c6d66b5
	.xword	0x6138bbdb3d5783bb
	.xword	0x259166568a9d1b11
	.xword	0x4f82add5b7178003
	.xword	0x04d75130dd47a07d
	.xword	0x55dbe353076e75e0
	.xword	0x5ae1dfeca0618f76
	.xword	0xb1782a61f277790c
	.xword	0x784dea8f5c18e2eb
	.xword	0x0beea4fcd679e08b
	.xword	0xde84ce30eba7b9f5
	.xword	0x4c6d18bce786c762
	.xword	0xe49dad212e5bb72e
	.xword	0xd3582c36666e58b4
	.xword	0x5d9313024a48cf55
	.xword	0x1395c906541f6d9c
	.xword	0xabf5637a254a4c54
	.xword	0x6d0df5f29c9e174a
	.xword	0x0034fe20d7eca6f6
	.xword	0x636748e97b8ec7e3
	.xword	0xc9794ece672a4bff
	.xword	0x2113ec2c045fc018
	.xword	0x9ce3672fb704fca4
	.xword	0x79fbbd61c879a982
	.xword	0xca0f77bf172d996b
	.xword	0x0cec4d7cc807026a
	.xword	0xba233271c8643a61
	.xword	0x053d8166a8cc39a0
	.xword	0xfff84362f42a6b13
	.xword	0x2c0567e26c55ad78
	.xword	0xe376fec50edf3733
	.xword	0xdc0ebf872b97b18c
	.xword	0x7656a2308e68d2c1
	.xword	0xafeff65ad26377b9
	.xword	0xf888837ef9e003a1
	.xword	0x0d9c63055483a1f9
	.xword	0x051315eb24b93435
	.xword	0x8148ad7ffd4f6f2a
	.xword	0xe4a8cfb5989b0b5e
	.xword	0xb2110ce39b05cf6f
	.xword	0x4def92f3463bf7d2
	.xword	0xb9608fabe77b4c0f
	.xword	0xded7ff343217de77
	.xword	0x0aef94ba6e466f7a
	.xword	0xbad2b1fd8ede128f
	.xword	0xefb5c62274a08414
	.xword	0xf36840a1bb4cc6bc
	.xword	0x110d464ca61667bd
	.xword	0x9d5d57360be6e303
	.xword	0x2cf9a88e0caefcde
	.xword	0x2ada9064ba1e0ae8
	.xword	0xe0a8f3734d8801ca
	.xword	0x2b88e27536b1b0bc
	.xword	0xb5bbe2794274758a
	.xword	0x0db0e1ab3e4cfadf
	.xword	0x85b0f87bbfb94d9e
	.xword	0xf75cc6af0c720bd9
	.xword	0x2ccf9933da224104
	.xword	0xb70a63ed479521a8
	.xword	0x4305a2d5cacbba21
	.xword	0xa6c554225e6abb86
	.xword	0x64229ed3b1f11f33
	.xword	0xc8ade78d5d76697a
	.xword	0xe7eb46cde030fdd5
	.xword	0x47de27fa577b778d
	.xword	0xa31087155e0bfc5f
	.xword	0x625cd7461507c5a3
	.xword	0x7e118a0508ce76ad
	.xword	0x1873d21aa9e678c5
	.xword	0x3d55d55bde92326d
	.xword	0xd7db8a914fe88a35
	.xword	0x8f425f4a84213532
	.xword	0x8cb40034c6826938
	.xword	0xe9dd47a345e2abdd
	.xword	0xdf7b3227dbb891d4
	.xword	0x41088274be534bf1
	.xword	0xf78f90d3cd0fc61f
	.xword	0x7175162bf8dd764b
	.xword	0x2276d700a9e0d117
	.xword	0x4b75bf91fc279cd7
	.xword	0xfbabb455089871c4
	.xword	0x79ba6523d8b37130
	.xword	0x76aa760ddf5836a5
	.xword	0xdcde33644a55c163
	.xword	0xc6a48d8d94f2294d
	.xword	0x421599d916fc8e1a
	.xword	0x1b2ef262e69ef860
	.xword	0xd990923b78244f8f
	.xword	0xf691ef521c1ba851
	.xword	0xe4c0dc3317b78a12
	.xword	0x32a0eee266c401e4
	.xword	0xc34427d99399162d
	.xword	0xb9d234033d2da46b
	.xword	0x5c8d9c6a5168924b
	.xword	0x26468725b64fcd84
	.xword	0x2f351b67deacfe5b
	.xword	0xfe7c499b4c5f0e19
	.xword	0xccf5ddd599888bc9
	.xword	0x2c557ce16acb7506
	.xword	0xf041b28e43e80385
	.xword	0xa744e6ce35eec2db
	.xword	0x8e797a33929b8426
	.xword	0x436f4e87973183f0
	.xword	0x240101c7d132f1ae
	.xword	0x0d3dae8a7a9a0c63
	.xword	0xebc4625e4c989b62
	.xword	0xd195971da1c40f0c
	.xword	0x30f25125ffccae17
	.xword	0xbbe5bdb73cfdff59
	.xword	0xb2b1eedba17ec636
	.xword	0x305185a59af9f815
	.xword	0x1c339762084da40a
	.xword	0xfca7b7d56b8e3ec2
	.xword	0xb68b00046c022479
	.xword	0x4482b5f6a112e35c
	.xword	0x4362ff9235117546
	.xword	0x947bc896d8f0f8f0
	.xword	0xacb09313a4e51513
	.xword	0x28f936279f60721d
	.xword	0xc532be0e280907b6
	.xword	0x7571486451433e2c
	.xword	0x570f777711bb560a
	.xword	0x926e6d2eb6a581ed
	.xword	0xf380b1d5229c5b12
	.xword	0x106fed3f6d271c1c
	.xword	0xc31eac13b5699846
	.xword	0x9012cba2be95a27a
	.xword	0x8c2c72bed5412749
	.xword	0x08297a20f9aa640f
	.xword	0x4ebe68be7f95023b
	.xword	0x434b2f52236584ad
	.xword	0xcfbbab36a9f0c0ff
	.xword	0x029c7d0894a3c2f4
	.xword	0x4845d32253df15ae
	.xword	0xf5a26fef83bb0753
	.xword	0x7689b84cd569ef95
	.xword	0x47852c9be436e1bc
	.xword	0x6216e52d4563d4be
	.xword	0xbe8aaa17d8eddc55
	.xword	0xe7bc2c4f2ac7f94f
	.xword	0x7b383e753c43be90
	.xword	0x2f9e28a23121de4b
	.xword	0xb4734f2d6a060464
	.xword	0x1d2e03553535c02a
	.xword	0x064e9fdd6477e3b3
	.xword	0x5b7c22b3c4b4c9fb
	.xword	0x531872d59a9f635c
	.xword	0x19bf74f430cd3b0b
	.xword	0x9fe1a04ebcfc81f1
	.xword	0x48681a87108c9b89
	.xword	0xdd57282bb052cc1d
	.xword	0xa031183444808d9d
	.xword	0x853c2926ed1311a9
	.xword	0x8a146674b2a82b9e
	.xword	0xa4856deaac3d0d19
	.xword	0x7f77d864c6dc9e7d
	.xword	0x828c1515e150a0af
	.xword	0x46231a377af7bd2c
	.xword	0x3a9540098825b1ab
	.xword	0x6d836744578fc16f
	.xword	0x949dd69e4de00149
	.xword	0x5101713759bd277e
	.xword	0x1d90cbca816d943e
	.xword	0xb29855b4b7db555b
	.xword	0xcf35c8c1a4f0a4a1
	.xword	0xf4df3b985762969d
	.xword	0xe10d1c731a9bce97
	.xword	0x2a1288edf62b7292
	.xword	0x81e970ffbc8ccd7d
	.xword	0x4dafa1433b095333
	.xword	0xc9a945718e6cd215
	.align 0x8000
	.data
data_start_3:

	.xword	0x0a599f9e1a71cc94
	.xword	0x70141ad60a5de5d2
	.xword	0x084b319bf5c5a03c
	.xword	0x497d5da6e31f1fca
	.xword	0x46ad6f2ee8a6bf74
	.xword	0x2b794fe518c6320d
	.xword	0x945e21d87c64fa2a
	.xword	0x344796679f895eac
	.xword	0x5d3b811dd04d7a46
	.xword	0x36c87133d7cb6d9d
	.xword	0xe690cdd7c361d6d3
	.xword	0xb34fc251a6315148
	.xword	0x3852c18f2e6f38e1
	.xword	0xdbd6269b06f7a33c
	.xword	0x99f8dad2d024ab30
	.xword	0x75a03eb9899d28df
	.xword	0xe5a0c67e1cb03980
	.xword	0x0e96d08e6e5e0a04
	.xword	0x497d6c62450b3293
	.xword	0x014f0e6e9016a9a2
	.xword	0x230dfb53a5b2ad9c
	.xword	0x80d427d67b3c6c26
	.xword	0xcb29cb9e7e704a88
	.xword	0x1c1814c762f5131c
	.xword	0x2449e5a37227b632
	.xword	0x4048957a964612b3
	.xword	0x52a6863fb12b7713
	.xword	0xa9f3c3056b87e07e
	.xword	0x2c8d449a893c2e48
	.xword	0x22c198b4022cfba0
	.xword	0x06db63fc18876b65
	.xword	0xdf1c702be17632c8
	.xword	0xa1ae3431d8048a1e
	.xword	0xa1d92499d44e6ddf
	.xword	0xf899dfa6aed81b4f
	.xword	0x0f7f093f05bd3e09
	.xword	0x1f41ac187b060aaa
	.xword	0xcd8acb85578b134b
	.xword	0xa0a6443e19b65fb7
	.xword	0x5807dd8b96f1f81f
	.xword	0x3e080a929bfd72e4
	.xword	0x58ec6fad29f1f7d1
	.xword	0x880a8b8f2e0fc1e8
	.xword	0x6aff8c47b4a41df8
	.xword	0x6e6a6b380eabc6ac
	.xword	0xa64e61c230d82222
	.xword	0xb3b80c54a783b349
	.xword	0xf0d6ed599082624e
	.xword	0xa2dfbafc4f483a8e
	.xword	0x925d436c2cf27e12
	.xword	0xef10dedf2dbc7a18
	.xword	0xa8fcaa14dc9e8304
	.xword	0x36f581df6e131efd
	.xword	0x40e73d9c5293f882
	.xword	0x48933115cb639945
	.xword	0x9464407b4ceb4441
	.xword	0x52c169ba28eeee11
	.xword	0xf813a998507535e8
	.xword	0x33a69bd179edb576
	.xword	0x2e4da5fbe10f0a67
	.xword	0x810612fb6678a5b4
	.xword	0x5a5c1cbb6285fab8
	.xword	0x256054d48660888a
	.xword	0x4985c4055f485b32
	.xword	0xadc2e7b435ce41f1
	.xword	0x8d21f37a0af4911e
	.xword	0x5ad86a3a7b0658a7
	.xword	0x8a7de3b39833ae00
	.xword	0x928c1e5dc6e95bcc
	.xword	0x1c59e16f34579d9b
	.xword	0xa094dbbbbbf0ca93
	.xword	0x3f1a1e0f6c5541b9
	.xword	0x7478776efe15c6d6
	.xword	0x4264666ba1b0cfe4
	.xword	0x8472ba25c0e557b3
	.xword	0x90abb5eb2ba75d18
	.xword	0xac611277ebf5031d
	.xword	0xd2d86f17c69072b3
	.xword	0xa1aefcd0051a76f6
	.xword	0x07e778e63e882755
	.xword	0xf559b58a0040bd32
	.xword	0x6c3fb39ff36150bd
	.xword	0x949f302bbb805823
	.xword	0x296c9fc4799de16f
	.xword	0xe9dc3e20eecc271a
	.xword	0xc69b602ca7081c18
	.xword	0x7a020e660fe00b36
	.xword	0x4767336db4f81f64
	.xword	0x89a4f94cc6b9e3f4
	.xword	0x1c10aba580660366
	.xword	0x10e1057b58fdae4b
	.xword	0x8cf4aea71b9383dd
	.xword	0x60fdb0a7e87e34f3
	.xword	0x8eea59179ebb6366
	.xword	0x61255a9dd915efa2
	.xword	0x86fbeb27225aa1c7
	.xword	0x2b6a9166766f08da
	.xword	0xce3150c7ec654427
	.xword	0x1230958d3cc9e11e
	.xword	0x87d29b976283856c
	.xword	0x304c62104d857fea
	.xword	0xcb24726ed98d03b2
	.xword	0x8c15764b8b0e61a4
	.xword	0x73cc929fe38fc04a
	.xword	0xcfbc7269d032113c
	.xword	0x0d30a1e3e1617be9
	.xword	0xc4502f8744168f37
	.xword	0x07cb2242c955d36b
	.xword	0x94598ef2a61ef368
	.xword	0x9f869961f2da9d9f
	.xword	0xc9dae52440ed8191
	.xword	0x5cdbd91a5f595211
	.xword	0x142f91982fd5d87b
	.xword	0x6eed946fafb936a4
	.xword	0x57f89ec0315a1232
	.xword	0x313822cf53b48c57
	.xword	0xb0cf729a0465f341
	.xword	0xd4bb0f9c69b276d8
	.xword	0x372ff13f52409100
	.xword	0x0ed13d12dee053e7
	.xword	0x7f46fda04f7d895e
	.xword	0x039921b81c6e7b30
	.xword	0x34fccda563430fd8
	.xword	0x495e9d6803b524be
	.xword	0x22653dbb9fa05832
	.xword	0x2db21f4b6705ac94
	.xword	0xa5a164eb6542fad2
	.xword	0x014dc60b88710a1d
	.xword	0xda9481e780d6f851
	.xword	0xa267f845be34590d
	.xword	0x39e324ca6c3f90c7
	.xword	0x17dbb1c51338d8a9
	.xword	0x3c2d88608cda1e9c
	.xword	0xb4c289d523957b86
	.xword	0x558a458442cf1285
	.xword	0x221240b3ffc762cf
	.xword	0x8e45135e80702582
	.xword	0x1e23c97096b67f94
	.xword	0x710d765aaf86927f
	.xword	0x53d9f0096108b830
	.xword	0xe07c5f52615e26ce
	.xword	0x4dd39e243bf5563a
	.xword	0x584092a4ab7d07fa
	.xword	0x4370e1362b90aefa
	.xword	0xfabcfc5a1818383f
	.xword	0xb683d50c34e88e0e
	.xword	0x7566f7159b5a98e5
	.xword	0xd6c27de1b69a278a
	.xword	0xee39514bd3a08045
	.xword	0x12e8212f01ccb2a5
	.xword	0x7bdfadd3cd5db07c
	.xword	0xd244321488683ebe
	.xword	0xdd862dc9c67ca886
	.xword	0x078c2886593e24eb
	.xword	0xeaf4be2317ce198b
	.xword	0x182201e846293838
	.xword	0xd248d21fec77623c
	.xword	0x1ff69115475b5a95
	.xword	0xef4d97e97e473382
	.xword	0xce737b223f2af614
	.xword	0x92ade5f1e857c8e5
	.xword	0x9fc4d301071c4373
	.xword	0x93ac7f7d9c842391
	.xword	0xb886d419f236f455
	.xword	0x59d1775fbe89e208
	.xword	0x3eb4fd467efc72d8
	.xword	0x4d9d323511e71159
	.xword	0x20a47e1eca8283f9
	.xword	0x3c20642fa50123b1
	.xword	0x014f0f695b84f12d
	.xword	0xada9de16b0e0966a
	.xword	0xafd0172fb694a3dc
	.xword	0xf68233b789239956
	.xword	0x1c3a87e10653396b
	.xword	0x3c5276886ae0508f
	.xword	0x79b96288a3f5bc8e
	.xword	0xfd80088d806ef29f
	.xword	0x85e758231764d025
	.xword	0xc45f478d5a78e486
	.xword	0x8a415316987deb77
	.xword	0x3e1caac854585f7a
	.xword	0x885b3efa13100df0
	.xword	0x2ca2c07dd534787d
	.xword	0xb7407be9e46019b3
	.xword	0x761f4afaf0771086
	.xword	0x15c81cd8c3074c34
	.xword	0xe61f7870c38423ed
	.xword	0xc92766bbbf675c49
	.xword	0xe05807b720e5c658
	.xword	0x8398ebe3b697548c
	.xword	0xeb8975e255a41c79
	.xword	0x7502ba09e8ac0665
	.xword	0xb90113585f90d08e
	.xword	0x60ad8cbb5cef5fd3
	.xword	0xbf63d5838df0e9fd
	.xword	0x364b24aeca71b0ed
	.xword	0x72fe82311f0aab0a
	.xword	0xa4dc3871d350caa2
	.xword	0x152bff038f53b70c
	.xword	0x1e3abdaad3e00006
	.xword	0xdd9db8102f881a87
	.xword	0x505ba9a09115aed0
	.xword	0x51b27bcb3dc84a97
	.xword	0xaca22398dfc105f3
	.xword	0x45e7c41d11640004
	.xword	0xf2339dd1785c4ee5
	.xword	0x16f50da04346da03
	.xword	0x1c6ae30185cd8a91
	.xword	0x75fc3298bf103272
	.xword	0x92f29c569be16d5f
	.xword	0x175d494992b46a24
	.xword	0xd40257d2b0f8dfa4
	.xword	0xfaa51cdff0ce8344
	.xword	0x64a59f88f7706551
	.xword	0xa7a8d8af3c45d3de
	.xword	0x3aa8e3505f42d5f1
	.xword	0xecba03094d5182b7
	.xword	0xccb7ec0b1f964631
	.xword	0x8447c84677b64c86
	.xword	0x56477fc98f792af1
	.xword	0xabc37a664f947fa2
	.xword	0x66fe9ac34132db9c
	.xword	0xc83dfd5fb8d5d7a3
	.xword	0xba3ad08899c93154
	.xword	0x164b0f2e6297a202
	.xword	0x920f1ccdf703abfc
	.xword	0x7ae2da46aaa6bd3a
	.xword	0x06f260facd09c3b7
	.xword	0x6c58252dc8558a54
	.xword	0x9ca4dbf46202c54f
	.xword	0x435f8b858acf3678
	.xword	0x875efbe1419ba2fb
	.xword	0x45638e6ebbd39856
	.xword	0xced796b0c1fb0139
	.xword	0x7c46fd99552f9aae
	.xword	0x27095b680ab9d990
	.xword	0x8300a049d726b915
	.xword	0x6db08bad62c4e78e
	.xword	0x38d34a461c9d99f9
	.xword	0x7bfc3cbc64396847
	.xword	0xb65b530b65638d3d
	.xword	0xd3140bcaa952b25d
	.xword	0x06acc7cca0686323
	.xword	0x22af07674426c543
	.xword	0x1738bdb6441a21d4
	.xword	0x17c0b4cd2182d4c7
	.xword	0x5323ad76c6f40c6d
	.xword	0xd78472bc05985491
	.xword	0xb7cd1563f44c074e
	.xword	0x09fd568e4c5e594d
	.xword	0x31e2268cf2283db8
	.xword	0x80060c09ab5c222f
	.xword	0x22f8228e438eb03b
	.xword	0x8cf905ec405213be
	.xword	0xe5960c8a9274744e
	.xword	0xb33d074ddc3f55cc
	.align 0x10000
	.data
data_start_4:

	.xword	0x52cf441c99928501
	.xword	0xd76f9a92163540b1
	.xword	0x5d5ce9e692fc7ec0
	.xword	0x3e802247f17b97e0
	.xword	0x3ad9507c07af00b0
	.xword	0x60cabbc332fe924d
	.xword	0xe2c248105b6bd3ae
	.xword	0x16eed8e8cdb37c48
	.xword	0x1c2ad959ed32780d
	.xword	0xc071d98b369b033b
	.xword	0x738b1dbe54d48f1e
	.xword	0xd149275ae9b71058
	.xword	0xec2bcf5546ea7d25
	.xword	0x91cbf3dbc3fb333a
	.xword	0x0de4ed9e54c6313d
	.xword	0x3471023f03b1d29f
	.xword	0x97a987d0ccbee92f
	.xword	0xe80a22b33be5d639
	.xword	0x158e4eed22b3b316
	.xword	0x1c9313bcc377dbda
	.xword	0x8542c246c228ed21
	.xword	0xbb1a78dd0b0ff9b8
	.xword	0x496777752f54dda1
	.xword	0x4041db21d0de9605
	.xword	0xd23647ea2bed8d33
	.xword	0x5a8790636aa73a70
	.xword	0xba80483363cc11a9
	.xword	0xcec84256e0a264c6
	.xword	0x235a5efcfc79e325
	.xword	0x65ee082eb6f699fb
	.xword	0xc1964b93a3633a57
	.xword	0x24041ce16187ea21
	.xword	0x57a40788a21f2476
	.xword	0xb62d0265fe00a6af
	.xword	0xecf505c433da2122
	.xword	0x949b7ab6fd805c6b
	.xword	0x3b5ba84c10bbba22
	.xword	0x7aba4c1f013d594b
	.xword	0x4130849f931fd6d5
	.xword	0x3dc6880a851a56ec
	.xword	0x1edec099eba4ef99
	.xword	0xa18c5921f028c2e2
	.xword	0x9546e137d90de969
	.xword	0x2da7639d0d855bec
	.xword	0x060e028360fb7f6d
	.xword	0xf3e835f9e39d229a
	.xword	0x6970407f0b612385
	.xword	0xf6559672b0d34166
	.xword	0x5f24261c6b6c4720
	.xword	0x3ee34caae4718c51
	.xword	0x32c1790012fea10d
	.xword	0xc811b7b405185e6b
	.xword	0xa7528e373edb1c09
	.xword	0x6bab88c00b1623c1
	.xword	0x845913ad2c96786d
	.xword	0x3241d911849f7366
	.xword	0x30f4cc0bc4e045bb
	.xword	0x663b22456cf2b2c4
	.xword	0x82a3f1b48c885013
	.xword	0x82192e63c9fe3178
	.xword	0xdc31533e36934669
	.xword	0x97587dc67271ac73
	.xword	0x0ebb12f89fcc56ba
	.xword	0x51f8ba89d2eaadd2
	.xword	0xb672a95d57c25e3a
	.xword	0xa2275ededd93a76e
	.xword	0xf1655f8bffb78e4c
	.xword	0x90ecb049e47df3f7
	.xword	0x801396a98a1e50f7
	.xword	0x67b8691bc96d62da
	.xword	0xa1b459397675c92f
	.xword	0xfd32691fa526b0f1
	.xword	0x48a33412d330ec74
	.xword	0x6123eaae7a6e0271
	.xword	0x34344dd5081279dd
	.xword	0x9b7a4b45e3a2b07f
	.xword	0x9031afc20ab2cdf8
	.xword	0xadebf0ab8cfe1881
	.xword	0xf94cf24df72f2b42
	.xword	0x74258c0fc8a7808e
	.xword	0xc02a394b1dbace7c
	.xword	0x2b658a808a76ec71
	.xword	0x80359e30ac6efa3d
	.xword	0x265854dec5086d8b
	.xword	0xd5a1c0f239d490e7
	.xword	0xdb54f1a1a9f5138c
	.xword	0x585d968c2f5cc724
	.xword	0xb21197eb9d4259f1
	.xword	0xad8750dd007e7375
	.xword	0x4d7edacfc5408463
	.xword	0xc0817bdd97f29a53
	.xword	0x34b38510cdce2492
	.xword	0xe84b8ea95d82e691
	.xword	0x052fb427dfc8e340
	.xword	0x6c2383f952c1bdd0
	.xword	0xe31110633981fd35
	.xword	0xb6b0aea16f1f5cd4
	.xword	0xb660d846e20db6c5
	.xword	0xd7a36b596cbe6ff1
	.xword	0x76263db90d28b13a
	.xword	0xa56a1a2b9661998b
	.xword	0x87821d8781fc59ec
	.xword	0x7c08c3badf28a2c1
	.xword	0x762095f4307f238b
	.xword	0xc4674c5ba8e961fe
	.xword	0x7bb538d9a695e1a8
	.xword	0xda4db25f31c66ae4
	.xword	0x466f889e6f1a0c4f
	.xword	0x94d24299494360f8
	.xword	0x8ad60becb46e4f78
	.xword	0x90ee345d8e0f0aee
	.xword	0x4c540dfb343d3b87
	.xword	0xbaa3c935ca5977c7
	.xword	0xaa762bb31e0e0ab4
	.xword	0x8bad3b186de6bdca
	.xword	0xf900c3be99d934ae
	.xword	0xcad6491c947624d3
	.xword	0x8d56f2ae8875770d
	.xword	0xad84cc1af1a59aac
	.xword	0x088a97b8895bba6b
	.xword	0xa76bf023c6478a19
	.xword	0xbfba8822f6c5ffea
	.xword	0x0a79efb6068eb579
	.xword	0xf8fe84dba796ecbb
	.xword	0xb04a008d17ca2df0
	.xword	0xf6fa6a04303ff0ec
	.xword	0x2c144d99a204cd2e
	.xword	0x2abb856a3fcb18a2
	.xword	0x0f50db5417ec3e8b
	.xword	0x5d48266057ab6024
	.xword	0x9c8187ef92015cbe
	.xword	0x914539d360c06870
	.xword	0xa138628a59f44ce7
	.xword	0x0a40445e72149e56
	.xword	0x1080d12dbfa062ff
	.xword	0x75ef3349f821be5a
	.xword	0x881b569de515f8fc
	.xword	0xc729efee318ba427
	.xword	0x9719a6b683accf07
	.xword	0xd4770b40e723ded9
	.xword	0x31d6e8e236b4a1fd
	.xword	0x848303eaa355dcab
	.xword	0xe808bed3bcdb8398
	.xword	0x1ec0fdef1ee7ba06
	.xword	0xd741410e853a2e65
	.xword	0x478a9f03f3d4d37d
	.xword	0x6afab79af2ef8849
	.xword	0xff41c17225d0421b
	.xword	0xf87e27da6115ddeb
	.xword	0xb4c77b8720979d0a
	.xword	0xcf9e2b618263546b
	.xword	0x4d32b39a7d0b1fd1
	.xword	0x54782d5600af4401
	.xword	0x1763f7a93f08c027
	.xword	0x9702699fe7801366
	.xword	0xa33203e3fa9942c5
	.xword	0x314afa88fb29acc1
	.xword	0xd0004aa8afa26cb5
	.xword	0x8c7c87a61224dce9
	.xword	0x84d17c046dbb3020
	.xword	0xd08e0ce6e736c138
	.xword	0x9ba7b35931e7c077
	.xword	0xb6648dd521f7adbf
	.xword	0x70c339c5738f4109
	.xword	0xf761ae08699929c5
	.xword	0xa841c51b8ab1bdf7
	.xword	0x7365f56ec45dee32
	.xword	0x853c11bdf65798df
	.xword	0xb1c3b3f443c7dc5e
	.xword	0x58c4bcddd44b6f92
	.xword	0x1af940c768785b65
	.xword	0x7b2d8bb7d61e9d30
	.xword	0x93a3b13df1b0ea0f
	.xword	0x1d7847f1436377c0
	.xword	0x6817c535b12d3f9c
	.xword	0xba4ddd302112ad8b
	.xword	0xd479df0396da072b
	.xword	0x8b0574d09fe98cc2
	.xword	0x328d3d2d6f69bcf3
	.xword	0xc576242fb14a0820
	.xword	0x91b58679544611b9
	.xword	0x6a6d35f1d4196fad
	.xword	0x704d520c1583d5c7
	.xword	0xd7e9180fe482157a
	.xword	0xab68c75511128493
	.xword	0x44a68b069e81c5a0
	.xword	0xd386e61f8562e7eb
	.xword	0xf293340f34f145e2
	.xword	0x3a3a005ff9e63a56
	.xword	0x3c79ced6f0e474b0
	.xword	0x631c8dba1e14ac38
	.xword	0xb4d0c44ee2051883
	.xword	0x6a2562c0e5b3eda4
	.xword	0xcb937840b0c9234e
	.xword	0xafcf9aa11b30f750
	.xword	0x3be1b4717c63f9f9
	.xword	0xa6ee503ee441ac56
	.xword	0x225239ce9a6d05d9
	.xword	0xcab9a5dd2c91761a
	.xword	0x9e5d831084262164
	.xword	0xd54238729a07c8b0
	.xword	0x2e332b8bd6c6176b
	.xword	0xb233ff799ec3d838
	.xword	0x6c8fffc56e55c53b
	.xword	0xcb67e08b3e8bcb3c
	.xword	0xf99fa9e49fdf6bc2
	.xword	0x30ade57bbf0dfd39
	.xword	0xc69a4e4fe34a895e
	.xword	0xb585ac62fda2ebc5
	.xword	0x52689ac0fe6e69b1
	.xword	0xd4df99f303fa6e01
	.xword	0x5840f30b57da1f87
	.xword	0xd55224019ac417b4
	.xword	0x937598435a256646
	.xword	0xe13618bb74af5656
	.xword	0x0fa44c1c9728fb23
	.xword	0x0966787c02ea0dd8
	.xword	0x719e81240c639aa4
	.xword	0xd3c7305497e00701
	.xword	0xfe7c85db80025bbb
	.xword	0xcb98ed6d2fad5fa2
	.xword	0xe6d395611a015d92
	.xword	0xfa8ba2f02a40ec17
	.xword	0xc5154e1d8b8fb76f
	.xword	0xd8d27d74ee327546
	.xword	0xd24773ed4580cbdf
	.xword	0xa18c09ecdbf2fd9c
	.xword	0xfcf28eca60d4b272
	.xword	0xcd4a4ab37296dbd2
	.xword	0x7c9205577b812b86
	.xword	0x2b75d3e2702c49a7
	.xword	0xf10bdf481fa0d9a7
	.xword	0x5f4262fa4592551b
	.xword	0xd4b55a6452e9e6d5
	.xword	0x07a32d2c4739e3bd
	.xword	0xc1e47c8b28e9b6b8
	.xword	0x1107a7ea1194338c
	.xword	0x25746463945f0cc5
	.xword	0xc5fa9eb8cba3209e
	.xword	0x45ebb33c7c7bff05
	.xword	0x18550bb5dac5b550
	.xword	0xbd028c9124d82f97
	.xword	0xdbbbe9c154443e1b
	.xword	0xc560750e16d84ba5
	.xword	0x7709e6222bbfc3ac
	.xword	0x1519e79924ae0700
	.xword	0xd4d03e28e9ec0950
	.xword	0x0125cf649295e400
	.xword	0x60ca543eaa313158
	.xword	0x7d5bccb6be58ff7e
	.xword	0x5f521b4b5e7f9d99
	.xword	0xf5d823b7b9c359b5
	.xword	0x84d249ae30e18b91
	.xword	0x842b2c17e5f55e99
	.xword	0x74eac6050178b75c
	.xword	0x160dcbc50526bba9
	.align 0x20000
	.data
data_start_5:

	.xword	0x6061febc1022f499
	.xword	0xa6846d7cd7a5f907
	.xword	0x42333c1b23057887
	.xword	0x8cdb3406eb3c27f5
	.xword	0xf1f3b080dfb7ad59
	.xword	0x5c32fce68d6f26b6
	.xword	0x0cbc5a0603f6fd37
	.xword	0x5a000975cd740c3d
	.xword	0x7685aaa725eb8baf
	.xword	0xc689b64e119e0da4
	.xword	0x6dcca5b3216e89d7
	.xword	0xb740769002f5ccd6
	.xword	0xac8c69de520afae9
	.xword	0xd44d1bff7eb03277
	.xword	0x9b13ef2e86a12f82
	.xword	0xdd00387a35ee22c6
	.xword	0xaeed9f996d5fc697
	.xword	0xf0bf94c2e6c62dcd
	.xword	0x731c9c003cf2e899
	.xword	0x6ce40e94a03e78a3
	.xword	0x0b30d467b5095bcc
	.xword	0x4a5969c9180fea6a
	.xword	0x55dc6341ae5507b8
	.xword	0xffd3e776006aabda
	.xword	0x48c3fb36d0a24c16
	.xword	0x670061cfc971a96f
	.xword	0x565d40a6b2a3e8cd
	.xword	0xa509547226331817
	.xword	0x6e87a0b40894bcb9
	.xword	0xf0f7bbf71b07e49e
	.xword	0x159a2a7265aad76a
	.xword	0x1265218b62ad9082
	.xword	0x19e850badc78ab96
	.xword	0x68ffc37a6cb3eade
	.xword	0xe7b65bb5b89c8240
	.xword	0xc6169b4536cc5c29
	.xword	0x66312a01dc67697d
	.xword	0x7fd429b6908f4c7a
	.xword	0x560dab7377536be3
	.xword	0xa4ea55e58b1be973
	.xword	0xa6c73b8a7fe64c77
	.xword	0x5e1a452be2d102bb
	.xword	0x9cefa0db267c3675
	.xword	0x2b7829f20ea298b6
	.xword	0xfc51d6ae0225770d
	.xword	0x2a41e10def1ad7a7
	.xword	0x9b9ee3885b226aa6
	.xword	0x7995523e1f69e9f3
	.xword	0x7132078324910f72
	.xword	0x20c62d08afbef27e
	.xword	0x1fe387f6a24e4a54
	.xword	0x0f4e639c18ed3ea8
	.xword	0x057a8fb49991fc83
	.xword	0xc9f9f3d896085466
	.xword	0x327f06508af706b6
	.xword	0x48fd955a109870f5
	.xword	0xff83a6dff1ecdf02
	.xword	0xeb3d5beffe48310b
	.xword	0x0f554b054a16879b
	.xword	0x4a64d0bbfb3e0abb
	.xword	0x189463e18436dd55
	.xword	0x07b3b8954a7ee01c
	.xword	0xd0967f7f5369f318
	.xword	0xd170ce0b2de7fd6e
	.xword	0x560682f6b3cadeb1
	.xword	0xab01cf4e059dfaaa
	.xword	0xfaa4cc7db69e5079
	.xword	0x044cf6b959513484
	.xword	0x880cf4a8d3dcbec7
	.xword	0xae7c1fc664c42ee4
	.xword	0xde0cb9e76f0b9121
	.xword	0x1cbe27c339cac5d0
	.xword	0xfce767431db65363
	.xword	0x5eefa76a55aff035
	.xword	0xdac31fea5b678476
	.xword	0xc9144cd00e29475d
	.xword	0x4c2f4b67dc580cf5
	.xword	0x98f5867ad189d3b8
	.xword	0x0b7908cc66659fdf
	.xword	0x6fd1f1036137d852
	.xword	0x813f23244d54a521
	.xword	0xdf77e723c2be81fd
	.xword	0x9fba0d7be1d04bca
	.xword	0xb5ac1ab227e1c9a3
	.xword	0xa1eb8a2865d27bf5
	.xword	0x29cbd060e7443ebd
	.xword	0x04a8ea6f5dcfc47e
	.xword	0x4786b8a6001bc00f
	.xword	0xee37f37236f76091
	.xword	0xe429ecdd1045fc35
	.xword	0x404cdab4923e7483
	.xword	0xa1f28f5c86dc253a
	.xword	0x324c1964dcee7aa2
	.xword	0x3b56dc862f9ba36e
	.xword	0x3967d2d9e6036ac8
	.xword	0xae47ca5012f4852f
	.xword	0x828b71181b81ee19
	.xword	0xadc07c5c78877ff2
	.xword	0x7875126dbf709e24
	.xword	0x9d1252eac5f15bc0
	.xword	0x45f3854e98679542
	.xword	0xe8ede0f2f0d37f17
	.xword	0x81782d96aad2ced1
	.xword	0xd8f4b7027c44430f
	.xword	0xe76fecfa1305657c
	.xword	0x1bd7c1d9d09c3c21
	.xword	0xec9759b14c86b425
	.xword	0x3ce7edcaf5ddd0d4
	.xword	0xcfa293516bba21fa
	.xword	0xf82ada81a458cade
	.xword	0x7185d564dcf253a0
	.xword	0x996c50e40877b9fe
	.xword	0xba798818c8b33a4c
	.xword	0x94ab9ba5a1cb9935
	.xword	0xa52f7956fd7b0f87
	.xword	0x02ae2b6d7e78ff40
	.xword	0x96f4453435a459d9
	.xword	0xc2cd7e7476fc83f0
	.xword	0x926c4d004aed5c6a
	.xword	0x9e84e2260fc5f7e6
	.xword	0xee503a14f20af2a2
	.xword	0x061cd06827c558a0
	.xword	0xc5b91a29ccb1356d
	.xword	0xb59bab8df5546103
	.xword	0xced0ab67c0746643
	.xword	0xaa512fd7218bdc92
	.xword	0x85164668c324e0de
	.xword	0x24f0e4e25ea97e16
	.xword	0x068db03dfd228f43
	.xword	0xd05de5f8c4edafa0
	.xword	0xe3902480d48b06f1
	.xword	0x84750fa0a84a87a6
	.xword	0xa3428c8e8ee2afef
	.xword	0x62400060c692dbd0
	.xword	0x355d2f42bbcb19b5
	.xword	0x82e65da0d7930982
	.xword	0x6d5ecf89c7e567c0
	.xword	0xa6c1d22541e8b719
	.xword	0xeb169c95156f28f1
	.xword	0x6eae335d90dfd501
	.xword	0x5e778263a5da3e21
	.xword	0x842987d3aab97585
	.xword	0xbe723befad83bf93
	.xword	0xb427ecce550e7f57
	.xword	0x84ad965d8d63fd95
	.xword	0xcc39e3af2b9fcc4a
	.xword	0x35c934c3422ba3fb
	.xword	0xee5c949d3b17d7c8
	.xword	0xcd8375a509836a37
	.xword	0xff41531ad27f1c23
	.xword	0x2e776fffcd8d4694
	.xword	0x73dcddcfff795ba6
	.xword	0x0ac2700905bdc361
	.xword	0x1d0bb6964abe5e29
	.xword	0x300f701b2754fffd
	.xword	0xa779ee28535745a9
	.xword	0xec45cec0fb19b6f7
	.xword	0xf5129ae2e4d28015
	.xword	0x497ce71154311635
	.xword	0x35d97bdf4cb1e4fd
	.xword	0x5af844e15fc6a59d
	.xword	0x48a95b99e4c4d57d
	.xword	0x72b0a299aed9d219
	.xword	0xe344bc41aae21d76
	.xword	0x51be36abad217b0f
	.xword	0x9157d96fa74e7138
	.xword	0x0ca4c72a8ab77653
	.xword	0x7df218ff07ffa5ec
	.xword	0xa1f6c7652ad58b2e
	.xword	0xd7eff5a918e18396
	.xword	0xec0aeea7a160d068
	.xword	0x1b62b32ec91e1a99
	.xword	0x32364b50a0bf492f
	.xword	0x6e68570ab6c33ded
	.xword	0x30160203430ad055
	.xword	0xb63a8ae785c069aa
	.xword	0x1c0a998ba5819872
	.xword	0xd6dca07ddcc06303
	.xword	0xe8df8662517f4ad9
	.xword	0x7ce591ea5d04ae36
	.xword	0x3b6e19788baefd34
	.xword	0x805ab9eca0f9af77
	.xword	0xa011d6d13f94460b
	.xword	0xe9de868f3356b5f4
	.xword	0x58b3a83c2eff61bb
	.xword	0x36da1314654d960f
	.xword	0x329f6d9f29f32c64
	.xword	0x0022d11fda3454ec
	.xword	0x727a28f50e6ade8c
	.xword	0xf464e590711feda7
	.xword	0xc0d183759fc75714
	.xword	0x7329ab788710d14c
	.xword	0x27f90857e2ed049d
	.xword	0x3111fdafe53faf87
	.xword	0xcfb58298283b857e
	.xword	0x4465bf00c1dbcf5d
	.xword	0x92fdd4afe6a6aa40
	.xword	0xd0d6acb82afa131d
	.xword	0xe78803c840ae82d3
	.xword	0x4a56963462324054
	.xword	0x18c7fa3e03c47b12
	.xword	0x710ab372a4d9c938
	.xword	0xf757ba614eb3c3f7
	.xword	0xac45d9d3a83a5133
	.xword	0xd0000842b81f7ead
	.xword	0xbb0d726f696d9b0d
	.xword	0xa2cb8e92025ea2e8
	.xword	0x6de34ab6d1aec802
	.xword	0x28f220f3b9d495aa
	.xword	0x7114821260adf03d
	.xword	0x2fbbdd0cc4c01aa7
	.xword	0x553625dc7ffa2217
	.xword	0xd7d05b8dbb20dbfe
	.xword	0x57d633429779a6a5
	.xword	0x4163a17dea20db91
	.xword	0x4c27d9453d7054fb
	.xword	0x93f8e08a28e05599
	.xword	0x004f13a312691c56
	.xword	0xaa41a21958623207
	.xword	0x6c9f8f19f61bd5c9
	.xword	0x62681008da0d4317
	.xword	0x6c148bbcd9afcb00
	.xword	0x76bb035a031521dd
	.xword	0x76d9809562e43a69
	.xword	0xb3c0e70b28f362dc
	.xword	0xf4afdad6f845d338
	.xword	0xea243333f5dde7fc
	.xword	0xa38a8893def32722
	.xword	0x21a0589a52ea2d77
	.xword	0x49e7cb876e868cbd
	.xword	0xa5ee1b1328681679
	.xword	0xda871108c6d67f50
	.xword	0x898f3fc2bcda39fb
	.xword	0x8e91887c3898efb6
	.xword	0x7519ef4a55e5762c
	.xword	0x3824bcf68ddcf1bc
	.xword	0x477d5eb65697d401
	.xword	0xeaa240675fff3454
	.xword	0x3d12aec84e5634d5
	.xword	0x513c7f025a5da250
	.xword	0xc7c925079e990a3d
	.xword	0x02c873b109f9845e
	.xword	0x1755cc5b1556dc43
	.xword	0x3c28a4bfaf41d1d1
	.xword	0x9420daa3751e53fd
	.xword	0xe75fdcc81983f368
	.xword	0xf1ecaaf79d9edd3f
	.xword	0x34b946a53439d410
	.xword	0x638a9f94b7817e94
	.xword	0x4a55499f9656afbf
	.xword	0xaa3582f4c6662b4f
	.xword	0xbc95f1059660b85e
	.xword	0xe34d9dd16ff5f8bf
	.xword	0x95e123f8bf8f9839
	.xword	0xc38c8d1e58baa0be
	.xword	0x27e672d98a9141e7
	.align 0x40000
	.data
data_start_6:

	.xword	0x75a515efca999bab
	.xword	0xbe29aa5747523787
	.xword	0x24f6c4fa804c0bfe
	.xword	0x5aa362b5d60ca8c3
	.xword	0xf4d8460271b9b7a5
	.xword	0x490c16ff37ec7e2a
	.xword	0xac02f2d11705d64f
	.xword	0xdd60db69b09e1713
	.xword	0x651578a82303c127
	.xword	0x61ed1a2e6c6d837d
	.xword	0xcbb6f4795d0db96f
	.xword	0x193c4c9711391273
	.xword	0x24ae60330f224cc4
	.xword	0x7ae9abacab77de5d
	.xword	0x40dd7b895ebc63f5
	.xword	0x965b32f50c682472
	.xword	0xed68d4d14ea11a95
	.xword	0x25a2a4236c2e7a14
	.xword	0xeba443a5835a0e55
	.xword	0x67ca3012e68403c4
	.xword	0xa94db8bc9e20e1d3
	.xword	0x4bcb232a2a68d5f8
	.xword	0xf3683b774a8565f5
	.xword	0xe6a7f5247146acce
	.xword	0xa4dcbf56dd244144
	.xword	0xe3fc599ac9a4f635
	.xword	0x3f561968a7d62115
	.xword	0xc6bcf94e78a68bb2
	.xword	0xc58247d6b8d405a6
	.xword	0x3f0b6882ebbd9338
	.xword	0x5813266946a51c38
	.xword	0xcbdbfb6b2ee8158d
	.xword	0x64998b42f2185641
	.xword	0xe344d99d0fa8b697
	.xword	0x58e26c5afffa9cea
	.xword	0xa9a152f463756d73
	.xword	0x30d3907aeb5e352c
	.xword	0xb351a97464e630fd
	.xword	0x155a8e5823ac3b98
	.xword	0x33ad0205e88091f6
	.xword	0x0a66fa788891930c
	.xword	0x80be64d756dbcca3
	.xword	0xcd664041790356b7
	.xword	0xd72aeb1ddefec353
	.xword	0x0c8ccb0c20839a7e
	.xword	0x5319ba80bf582c5b
	.xword	0xa4a525d7fa42010f
	.xword	0x27a5b4e7b35a62e2
	.xword	0x2c5c37959719f74c
	.xword	0x5c4a01cb71757a62
	.xword	0x37050404a340df64
	.xword	0x0bc9af37d221babd
	.xword	0xd652a095d8f00406
	.xword	0x53b67ef3a4e2f83a
	.xword	0xf9dff5cdea38c743
	.xword	0xed94806601cb239f
	.xword	0x3e16327770df391b
	.xword	0x9784f346a95653fa
	.xword	0x4bc71736f6e740d2
	.xword	0xab7e76418af1a18b
	.xword	0x44abd36ed716a076
	.xword	0x39d121ef1f2a533a
	.xword	0xf16a8feac47c9cc7
	.xword	0x5182fb49e28fdb7e
	.xword	0x5184a85403970575
	.xword	0x3e2ce9c6430f616e
	.xword	0xc952d0e0d7599b4b
	.xword	0xc6a6abc0764fa6df
	.xword	0xd9cb20a9ead2aaab
	.xword	0xa51c5e32aee6237f
	.xword	0x5be09ef54ee98b1b
	.xword	0x5a22e32da2e1c9af
	.xword	0x4f730b5af8381564
	.xword	0x15c567e34a95c346
	.xword	0xd04418fb5516ea5c
	.xword	0x936bd2b06d04fc7c
	.xword	0x41546b08d0d339ab
	.xword	0x101c8834c72bf84f
	.xword	0x5edd69f9c236327d
	.xword	0xb5aa9d6675830414
	.xword	0xc26c68344db75b51
	.xword	0x91dab5048ec0ad28
	.xword	0xa0b87bec66d6efe6
	.xword	0x00e2e425c394a5d4
	.xword	0x106c03db82b5015e
	.xword	0xc60f16d7fcc959d7
	.xword	0x1b764026682ed76f
	.xword	0xf51592a8b440d9b3
	.xword	0xce50533aff3e7ce6
	.xword	0x5f55fa4a7aa3f7c6
	.xword	0xde0c52346a06ac15
	.xword	0x4a7cf8fadaee64bd
	.xword	0x119dfca03d7b1fb3
	.xword	0x3e0233ac22073ed2
	.xword	0x5ff4e536fb71f1b7
	.xword	0x3c836229a3a35efd
	.xword	0x2a837c0ea83b9863
	.xword	0x69bcdc461c31d6f4
	.xword	0x9e9b73c1a31e9c65
	.xword	0xabbc77326ae8e248
	.xword	0x1658456812d53d7b
	.xword	0x9e0573faceb38f73
	.xword	0x878ee3dd67250bca
	.xword	0x13df9989b8a23e75
	.xword	0xd270df201cc0c84a
	.xword	0x3eb31a3088603e88
	.xword	0x35e41135d86bf2ea
	.xword	0x85736dff101d36f7
	.xword	0xf7356d9a6e509b3e
	.xword	0xf334e0fc1ee92da1
	.xword	0x73265c6be93790f1
	.xword	0x5156bd2d40075ede
	.xword	0x50a4813cac4069fe
	.xword	0xf5771bf5a7ef6ea8
	.xword	0x72849fa2b1b6a2c9
	.xword	0x3bb184e05e03b12c
	.xword	0xe0f75acc68aa729a
	.xword	0x93f2f5aaf63b1edd
	.xword	0xa2b99d07434a8ecc
	.xword	0x6b8831d0a9587121
	.xword	0xf343eef442ba461b
	.xword	0x92427d9acf58af83
	.xword	0x842d01792c58a053
	.xword	0xd82a95c65c0d55eb
	.xword	0x60eed56a7c9727c4
	.xword	0x735086cde84ef4d6
	.xword	0xd36b1031907669a8
	.xword	0x0f7d351a839b4336
	.xword	0x844d4c91db066f37
	.xword	0x73ca37a34dc54bcf
	.xword	0xad84ac7c941a62ff
	.xword	0x8887228cfd4c722f
	.xword	0x5f8e63373da70a4b
	.xword	0xb47ba980225a2a23
	.xword	0x9b379ec3e169ffff
	.xword	0x65b926dfca176d3b
	.xword	0xd16f6530d7fd1cc7
	.xword	0x1aba0080e2e9ec98
	.xword	0xa8e67997439c06ce
	.xword	0x8e6199d69f32ba84
	.xword	0x95277ad4815024a8
	.xword	0xaf9b5b806d10d29c
	.xword	0xed2e34ea14a100ad
	.xword	0x41284e3cb72fac6f
	.xword	0x75b7814a0e3aa1e3
	.xword	0x895be8fee8e3cf2e
	.xword	0x4b27dadbe16fd217
	.xword	0xca81f490ef6fb5ef
	.xword	0x16cb3a8b427283d4
	.xword	0xe11e918148ef290a
	.xword	0x70731055fdf0eef5
	.xword	0x0d5c016eb1845b86
	.xword	0xd35f7418d90ae3f0
	.xword	0x836f273d530c70c4
	.xword	0x81e6d6ddb36dbd96
	.xword	0x41bc5ad5ffdfb5dd
	.xword	0xdbaeba581cc755ac
	.xword	0x58ebe7442709fef4
	.xword	0x16f73b30d2450511
	.xword	0x927b71cc1427496f
	.xword	0xee16ef35afd9722c
	.xword	0x667ec052aab491e6
	.xword	0xc93ddd1fe5aa6431
	.xword	0x403554595df52162
	.xword	0xf175dfc2269018a0
	.xword	0x475c645cb40ed0e0
	.xword	0x4e56001a6790bdd2
	.xword	0xfda873103e4b2cec
	.xword	0x84a69c7cb8602d92
	.xword	0x41761a692bfec66e
	.xword	0xd32765873c928b40
	.xword	0x3602fc3565b7cb0e
	.xword	0xfbebb04d342635fa
	.xword	0x6db08ce1abaec255
	.xword	0x84d1555641542aa0
	.xword	0x72eb4c206dec016b
	.xword	0xc26509066668729d
	.xword	0xfdd18e29d9493eab
	.xword	0x55872a068c492cb9
	.xword	0x2c169a8cdf2cff39
	.xword	0x96d5932cb926e7bc
	.xword	0x47eaae86146e51bd
	.xword	0xa05fd5a06528ff00
	.xword	0xf77da3e77f9ba227
	.xword	0x3b027ee5bd072d8d
	.xword	0xf8da0cf5196c9591
	.xword	0x5151ef9b573ee5be
	.xword	0x1b9b3310da2738f3
	.xword	0x52b388f45a6aca3d
	.xword	0x365d11bac75d9fdf
	.xword	0x99706126933e12d3
	.xword	0x717ef00c65d23617
	.xword	0x78ec4c5626291cc8
	.xword	0x3d0da9a6ba34e0a8
	.xword	0x477a3ffb0dc15295
	.xword	0x2677f74e527c7758
	.xword	0xbeea530c51032f9e
	.xword	0x447db60b2332a772
	.xword	0x3492cdb878a6f6cc
	.xword	0x422fbbac8d2f60aa
	.xword	0xfa921b7daac6eb96
	.xword	0x23a564fbff50beb3
	.xword	0x6a10a409086ae566
	.xword	0xc27264e0906b3fa7
	.xword	0x236ee65ac68b332f
	.xword	0x1d2c5e8150058c55
	.xword	0xd3650d8e119994b8
	.xword	0x4e6e6bfabc3b1039
	.xword	0x008fff6cab2ed927
	.xword	0xa7f89c285659007a
	.xword	0xe14b601aff32fa7b
	.xword	0x0f0444b87e33948f
	.xword	0x1106cbbb6803835a
	.xword	0xfa1c5150802d1787
	.xword	0x457cb24a2f3931c7
	.xword	0x0a53daa8499c945d
	.xword	0x09beba6bbfad3f61
	.xword	0x9daa656a3ce3f82f
	.xword	0x6dd6bbe5204ed475
	.xword	0xb5885a16220d4d56
	.xword	0xb1793b372f7d8848
	.xword	0xe1b1bc4c404e733c
	.xword	0x9032e88883ecbfc3
	.xword	0xd5208e2cc8ff5e0f
	.xword	0xec37952b7b14b4f4
	.xword	0x9adac2fb978a8594
	.xword	0x3312c16afac2d26f
	.xword	0xab126279df61e2f3
	.xword	0x2ceca0d5a71fda5f
	.xword	0x1e956ef1ee4de30e
	.xword	0xedb6daa56ffcc2a5
	.xword	0xcf98603699c6fcb7
	.xword	0x620848227c07a487
	.xword	0x15db3054bda8088a
	.xword	0x58de84a0ca982ea7
	.xword	0xb69abdcd8cc72cbc
	.xword	0xaa1b36230e7bb49d
	.xword	0xca74c906bd6ac13e
	.xword	0x971a60f8a1153de7
	.xword	0x753a850e6b025a4f
	.xword	0x30efc83a8f8f0297
	.xword	0x10a0895f3d714a5d
	.xword	0x01cfe446693a6d16
	.xword	0x3d90eef4508432c0
	.xword	0x33acd06e33405077
	.xword	0x9f0e47ed9940ca88
	.xword	0xf12d32ab64150bbe
	.xword	0x809d52414a3e1b42
	.xword	0x5c51f590a8702ee0
	.xword	0x36b6b15c3471ce7a
	.xword	0x790db5e58f76c8aa
	.xword	0xfd32efd0bebdb991
	.xword	0xa124bac4f4075be6
	.xword	0xaa40dd63ccafd91e
	.xword	0x965cb6491084dc40
	.xword	0x10fcd6b9f981f7c8
	.align 0x80000
	.data
data_start_7:

	.xword	0xe8077f893e6d91b1
	.xword	0x5777e27294b589b8
	.xword	0x986ee9e0a8db082e
	.xword	0x93d2357fb8f963b2
	.xword	0x14c9168d4914eb4f
	.xword	0x204230fc42ae379e
	.xword	0x0ff54bf2542b795e
	.xword	0x9dffe89e76f68ce3
	.xword	0x4f2d67e75cc89a3b
	.xword	0xb90199375f6d4b6e
	.xword	0x48ed8b75f641bbf9
	.xword	0x6c7952b001d7fb14
	.xword	0x809dbd666efe4702
	.xword	0x81d7092b6374e72f
	.xword	0x3f24746f9b8c7ae8
	.xword	0x0e76f7b507946667
	.xword	0x441f59641c4ae970
	.xword	0x82880193705cfd11
	.xword	0xaca43e5f5da98b91
	.xword	0x45bdb5a3bb86cb11
	.xword	0xfefeeecd60c1479a
	.xword	0x836316be36194b42
	.xword	0x404e4220884d9b9e
	.xword	0xf4fbd7efcac67b8d
	.xword	0x55110abd93c15b06
	.xword	0xecc31689c506ad2f
	.xword	0x13937a12822a46b1
	.xword	0x86f5ea290c7cd3eb
	.xword	0xfa14cd171cb28b84
	.xword	0x0882bfb6951f479b
	.xword	0x702d8644649ae4c9
	.xword	0xada70dca995c055b
	.xword	0x2fafc06fbaeb9da9
	.xword	0xd91b1d53e04b0dca
	.xword	0xe757d18677a90c08
	.xword	0xe59ad2e685919d29
	.xword	0xccd2cc6229521b5e
	.xword	0xfa1d556f35c52ce6
	.xword	0x839944cb8239486c
	.xword	0x6b6cd6984a638ed9
	.xword	0xf2dc60fc73951869
	.xword	0x21124b11544042a0
	.xword	0xc7669fd5f8e0ffc7
	.xword	0x7ff1361aa70b84b6
	.xword	0xddc640c69d7058c0
	.xword	0xb561fa5e4f91871a
	.xword	0x20dd77cf9202f50b
	.xword	0x28beaca4ab9682fa
	.xword	0x867bce503d55c9c5
	.xword	0xb75aafa66770a171
	.xword	0x672a4c387b2f4842
	.xword	0xdbdcbf44f567d2fd
	.xword	0x07f3ab427be15fae
	.xword	0x87291666100fe3c6
	.xword	0xbecc7a43add6defb
	.xword	0x5b700f9fb2d580d2
	.xword	0xfca7cd31a21de615
	.xword	0x73d6e97a28a4763c
	.xword	0xfa7d2915a2a6084d
	.xword	0x89b09060a0083c92
	.xword	0xd28eefcb7909e862
	.xword	0xd7eb9af922f2ff24
	.xword	0x950caa7d0b95cedc
	.xword	0x1b55684fe587c7f5
	.xword	0xcce2ba49213d7d50
	.xword	0x64b9f3f98ce7e416
	.xword	0x8178f1d51f9e1290
	.xword	0x08f21c28270312e4
	.xword	0x505f634a74f67b47
	.xword	0xe31ee6b10c2b3826
	.xword	0xc2b8b855e6da9937
	.xword	0xf4ee990569348746
	.xword	0x050a1f0bda9c00b8
	.xword	0xa5301b8bff2c46cb
	.xword	0xeb3de991e73c651f
	.xword	0xf62ab5b07fa6c3fb
	.xword	0xc6a62bd937dd701c
	.xword	0x3e0ca93815fb6e9e
	.xword	0xe63979836ec8eb4b
	.xword	0x5b25460f075aef22
	.xword	0xb2fb0db8493c24b2
	.xword	0x69861d1d45afd632
	.xword	0x3fba83d2d9dc1ba0
	.xword	0x88e8bd186e3b8194
	.xword	0x2f2c0321ab4b030c
	.xword	0x7ad5ffba8c1ef924
	.xword	0xf228c244d4da39b6
	.xword	0x429f887a5295fb88
	.xword	0x2e90ec36d3a84296
	.xword	0xc689ce2a9be35e63
	.xword	0x9da1861651bd84e6
	.xword	0xb8b0440b031e6685
	.xword	0x5de6b7ecf5474037
	.xword	0x730ddeca30795a14
	.xword	0xc14875e5e6c6b2a0
	.xword	0xfe995b79e588034d
	.xword	0x3f52ce6f2158f102
	.xword	0xdd38bc2a01944992
	.xword	0xf16301dadd9929d7
	.xword	0x74a0c5a0a782e752
	.xword	0xa6bd3eb1476d10ac
	.xword	0x74195b052f92e4ad
	.xword	0xe6edf2dd4fca664a
	.xword	0xf22f71b9d3668476
	.xword	0xfebedf9f48cdd431
	.xword	0x77ea125e5dd74a7b
	.xword	0xbf2497d164f4fc7f
	.xword	0x1ebd6a349a3baf36
	.xword	0x8852d771c153f923
	.xword	0x433c1380bc7b15e8
	.xword	0x67708ad24ce47d1f
	.xword	0xfffcea138814c28a
	.xword	0xec77fc60d9de1766
	.xword	0x4eba385523c797f7
	.xword	0x25c5bc8f71940180
	.xword	0x12e476b2d0f5d48b
	.xword	0x9ee36973b442b529
	.xword	0x595b7a17b5747469
	.xword	0x67850eef3235034a
	.xword	0xa1e623f2e6e6221a
	.xword	0x59e68379e0128faf
	.xword	0x27aca05fda6ab285
	.xword	0xe64bbb6039d77034
	.xword	0xdecbb1f368d58f15
	.xword	0xd0ea2fe08ab35d0c
	.xword	0x59f385de2d337d43
	.xword	0x2084a2950e7a8dd4
	.xword	0x8166fc5086a369aa
	.xword	0x9881b9ee9514b5f0
	.xword	0x71a759bc6a25be53
	.xword	0x0fef976fd8b5f296
	.xword	0x387db354bfe39cbc
	.xword	0xc3554ccca45ae142
	.xword	0x2f1f2293e2dd83de
	.xword	0xf9ac018c51629108
	.xword	0x948482bf00eda1a5
	.xword	0x57d1f217247cfa30
	.xword	0x85ab8623a279afa6
	.xword	0x064ef625e193a423
	.xword	0x17acc4df2aa43313
	.xword	0x41a41197425f1ddf
	.xword	0x42e311e5713ff843
	.xword	0x06beb1a81c130c89
	.xword	0x99373e5ba8cac0bb
	.xword	0x356df54cb0cbd313
	.xword	0xb4a369202e7ae484
	.xword	0x8c90da2e71b5e366
	.xword	0xb623ba9295b2a36c
	.xword	0xfedab6e46ac75206
	.xword	0xcff6b660667a436b
	.xword	0x6d7e4b67a2614d05
	.xword	0xd0d5c6559cb8c0d6
	.xword	0xa1e16f73edde9d0e
	.xword	0x65a8f545038a8056
	.xword	0x3da9fa94d12322a3
	.xword	0xd2f7b074fa7cb07a
	.xword	0xa87cd68dfdc477a0
	.xword	0x49dad5828bbc9afa
	.xword	0xd1c6fa5d0e727744
	.xword	0x32204c210d938201
	.xword	0xe3ae737bef27837e
	.xword	0x0d7eb413afd93d7e
	.xword	0xd3b7cf2792e929cd
	.xword	0x4dbc7f5fac8cbbe2
	.xword	0x350aa3ed6f4ef469
	.xword	0x9ae18b5b06fdbe57
	.xword	0x9e31812432a3bd79
	.xword	0x225e98ce6153df71
	.xword	0x87fda678d071cc79
	.xword	0xf028e7eeeac9c2f5
	.xword	0x835190d570de3ae7
	.xword	0xf83d78168956cc53
	.xword	0xf3e69c9b1bcdf050
	.xword	0xa744678202d87958
	.xword	0x55a955aaa9807e73
	.xword	0xfac4daf0ae5cab34
	.xword	0x6ce9048b949bbde6
	.xword	0x0b458b2413ad77c1
	.xword	0x097ce6320848dec9
	.xword	0x364ca3f1cd2b86cf
	.xword	0xcd52cea2a347fec7
	.xword	0x0b851b59d9691124
	.xword	0x5422045c1cda1e10
	.xword	0xb06f20de63731c62
	.xword	0xa94ef3e550d2afc7
	.xword	0x1b4785cc942f8205
	.xword	0x1fee2fa7a861cbb0
	.xword	0xc73209c0b2d301f7
	.xword	0xbc5589897b95e22f
	.xword	0x6444b20209043730
	.xword	0x1548ffbf4f274f5d
	.xword	0x95e0fa32a57cbc64
	.xword	0xffbf60e3976d5f30
	.xword	0xed10821d4fd8aac3
	.xword	0x41f678d48d284a49
	.xword	0x70a31c219b96bf98
	.xword	0x9afba6c3730eee33
	.xword	0x72e378fb4820795d
	.xword	0x5b095bc60196b3a2
	.xword	0x029328fc0ec3e9e8
	.xword	0xe8ef657871dc5834
	.xword	0xab68b2e3a09a9f8b
	.xword	0x7eefd7565dc1f8fb
	.xword	0x9044a42e9b3d65d3
	.xword	0x19263004eb12b0f6
	.xword	0xdc01a4d31f01feb6
	.xword	0x27c5f5be4a87d4a9
	.xword	0xc0ec61ca001384f8
	.xword	0xf3b8ffe6abea849f
	.xword	0x1c8573dc2bd87afb
	.xword	0x5592b3cf0f54d1c6
	.xword	0xeed9c41456a3016d
	.xword	0x8519d3f9326c02ba
	.xword	0x02f2c2f30c167764
	.xword	0xcd382399e1905601
	.xword	0x33aa4ba97e3d1e71
	.xword	0xc4caf9c7e4f5e391
	.xword	0x246df66ca79f759b
	.xword	0x2ca1eed76e28dbb3
	.xword	0x032527b3bdce6e30
	.xword	0x6c83d08c45db4bbc
	.xword	0x7943f39f930bda69
	.xword	0xeca81e39de7f654f
	.xword	0xf6b71e394a17ef16
	.xword	0x591230d7cafc3acf
	.xword	0x866a598e8151cea3
	.xword	0xa6b475a3d4f41e65
	.xword	0x26e452e3612fa082
	.xword	0x1c91f09cae566321
	.xword	0xfccfe2698c8c60a1
	.xword	0x7957f8b45d7575ea
	.xword	0x7b677fd09890df0b
	.xword	0xa9b2a2ba1160de45
	.xword	0x0d09ad83aa00ebcc
	.xword	0x6f0f833c022c5c9c
	.xword	0x72b95d2dd9182ed0
	.xword	0xa780308a9bddabca
	.xword	0x5893150906b7df22
	.xword	0xe08d5d4b12e2acf1
	.xword	0xf4174f403bb87d5b
	.xword	0xf07a2ad3a8f44f12
	.xword	0x5f82aa9671a5599d
	.xword	0x94fee4ddca570c6d
	.xword	0x7ef916ab6d5158a4
	.xword	0xfcf36aa5047de396
	.xword	0xac93f155262b0acc
	.xword	0xba50eb8ffc6bb548
	.xword	0xd819a2d57d4abc43
	.xword	0xbc4dfee188fb977f
	.xword	0xa6586e94e510ef95
	.xword	0x2861f1b55f0d53f6
	.xword	0xfbc0c0462da18707
	.xword	0xa0b01dc027f9ea9c
	.xword	0xa9281b172e45f1f8
	.xword	0xd665a039a5a96a2c
	.xword	0x4b1cfa739f57840c



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
