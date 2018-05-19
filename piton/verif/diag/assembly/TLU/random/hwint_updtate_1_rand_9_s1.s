// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_9_s1.s
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
   random seed:	145957238
   Jal hwint_updtate_1.j:	
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

	setx 0x3d4aa4357bbcdbb7, %g1, %g0
	setx 0x94d9a4b76f10dc1a, %g1, %g1
	setx 0x34fe56baaee67a1f, %g1, %g2
	setx 0xcd9037c93479f20f, %g1, %g3
	setx 0x30476ba2efe27957, %g1, %g4
	setx 0xb6abd43d44a20139, %g1, %g5
	setx 0x244c7002f4b71847, %g1, %g6
	setx 0x8bc6244c6f255df9, %g1, %g7
	setx 0xdcb9a84772e1e985, %g1, %r16
	setx 0xedc85f0eb173d0bd, %g1, %r17
	setx 0xa40fe411d0d5f984, %g1, %r18
	setx 0x5a1afa51dcdc0410, %g1, %r19
	setx 0xced57f8ffd5354fe, %g1, %r20
	setx 0xc41a0a931dd54342, %g1, %r21
	setx 0xff2b75f7a347ca58, %g1, %r22
	setx 0x37588096fc8bf362, %g1, %r23
	setx 0x7cfd66e0f91a0c63, %g1, %r24
	setx 0x489c72dac3a2dba8, %g1, %r25
	setx 0xcce7f7e4c7e07888, %g1, %r26
	setx 0x329d42c308963ce9, %g1, %r27
	setx 0x4b513cba8a5fe703, %g1, %r28
	setx 0x3d223c055ef0e124, %g1, %r29
	setx 0x45fbb4185f072fd8, %g1, %r30
	setx 0xefdcd60d6f854e20, %g1, %r31
	save
	setx 0x92190bae37006813, %g1, %r16
	setx 0x781b20b5d8ce04ad, %g1, %r17
	setx 0x451d179b23aee8d3, %g1, %r18
	setx 0xd06d9ede57c005a4, %g1, %r19
	setx 0x8241c3f1e37f7ca5, %g1, %r20
	setx 0x25e6daef2eda309a, %g1, %r21
	setx 0xda541dd0f607d0e3, %g1, %r22
	setx 0x679894563e23d5c4, %g1, %r23
	setx 0x195014770f4ffae4, %g1, %r24
	setx 0x782221efe7108f5b, %g1, %r25
	setx 0x3d6659237e642ac8, %g1, %r26
	setx 0x7abf660fdec25ee7, %g1, %r27
	setx 0x0f3975a440fa0e56, %g1, %r28
	setx 0xf15d732808ac45bd, %g1, %r29
	setx 0xd48abb962bfcbc23, %g1, %r30
	setx 0x8d449da4ac18598c, %g1, %r31
	save
	setx 0x4167db310b9d7aac, %g1, %r16
	setx 0x3bcee869b52915de, %g1, %r17
	setx 0x6281fd796bc94f4f, %g1, %r18
	setx 0xae9ed5cecd024cef, %g1, %r19
	setx 0x612efa318134e03a, %g1, %r20
	setx 0x44997c8a365cc1d3, %g1, %r21
	setx 0xf89900d0e6b81ae5, %g1, %r22
	setx 0x2688c959a49f6a73, %g1, %r23
	setx 0x4e741798a00a5708, %g1, %r24
	setx 0x1122d2eb7faf021a, %g1, %r25
	setx 0x3dfa9df5e18502c9, %g1, %r26
	setx 0x4242005275d0f302, %g1, %r27
	setx 0xd430587fd46ced9b, %g1, %r28
	setx 0x06d590fc0a5ebe7b, %g1, %r29
	setx 0xcf37664b0e01a7ad, %g1, %r30
	setx 0x550ab05e83614ed7, %g1, %r31
	save
	setx 0x09b21a38547acc07, %g1, %r16
	setx 0x5751588c4fdb0c3c, %g1, %r17
	setx 0xa5c7c0142bc80524, %g1, %r18
	setx 0xe5cf571af1b8751f, %g1, %r19
	setx 0x74d23d35bdbeb8e7, %g1, %r20
	setx 0xd0c4e1648c6db326, %g1, %r21
	setx 0x2b49be317113db04, %g1, %r22
	setx 0xdf3e032a248b3cb2, %g1, %r23
	setx 0xf95144b2018553d0, %g1, %r24
	setx 0x844872b206e16fb4, %g1, %r25
	setx 0x8794fab0e4fa8a0d, %g1, %r26
	setx 0xf9da45c4f3d09ef1, %g1, %r27
	setx 0x939de7665bd99835, %g1, %r28
	setx 0x0f022063856e5c85, %g1, %r29
	setx 0x64de252fa6d43dc6, %g1, %r30
	setx 0x57fe0907a36e128a, %g1, %r31
	save
	setx 0xa6a29766411912ed, %g1, %r16
	setx 0x94618f2075c54af7, %g1, %r17
	setx 0x8f4767c5ba9ff479, %g1, %r18
	setx 0xf06b752d1e6aaa22, %g1, %r19
	setx 0xf20c1c096382a332, %g1, %r20
	setx 0x3a1bc2afdff0f994, %g1, %r21
	setx 0xf9e04579a952eb32, %g1, %r22
	setx 0x2c89264f12080c89, %g1, %r23
	setx 0xd99cae2c03bd71ab, %g1, %r24
	setx 0x9dc27ee958f2634a, %g1, %r25
	setx 0x35a4ae4d0a090690, %g1, %r26
	setx 0xd24e868195d7940a, %g1, %r27
	setx 0x3446b22f73501253, %g1, %r28
	setx 0x68800843aec96da3, %g1, %r29
	setx 0x3aa624fec7d32882, %g1, %r30
	setx 0xc54aa1928b77fe91, %g1, %r31
	save
	setx 0xf203ef2f173dbd40, %g1, %r16
	setx 0xdf8ba0356b15c557, %g1, %r17
	setx 0xce14699c7f3dfd29, %g1, %r18
	setx 0x5712c9e669ca8f40, %g1, %r19
	setx 0x6aa8180a62d793c5, %g1, %r20
	setx 0xfd836df78739087a, %g1, %r21
	setx 0xfa45cb6be0983645, %g1, %r22
	setx 0x31609b64ff09d2f3, %g1, %r23
	setx 0xf1f18cedc9db5ca1, %g1, %r24
	setx 0xda64b589a017e58f, %g1, %r25
	setx 0xcd3f71bd9d21f9c2, %g1, %r26
	setx 0x0f6f086fd9b85c4b, %g1, %r27
	setx 0x79ebc43f6ea09216, %g1, %r28
	setx 0xc0af0e9e76ffe593, %g1, %r29
	setx 0xc039f0dfe1782010, %g1, %r30
	setx 0x66a4e6709dd2eda4, %g1, %r31
	save
	setx 0x7ebb3dcf177d3508, %g1, %r16
	setx 0xd5959ebd5d78ceaf, %g1, %r17
	setx 0x5303674c2b964af2, %g1, %r18
	setx 0x69cb68946db9cc78, %g1, %r19
	setx 0x06cf780a4c3d7f51, %g1, %r20
	setx 0xe7f1e66790957277, %g1, %r21
	setx 0xbfae10889f415644, %g1, %r22
	setx 0x7e53eff9190ef013, %g1, %r23
	setx 0x408be3fc4255babe, %g1, %r24
	setx 0x9c880192787a28d5, %g1, %r25
	setx 0x46db2560e54e0ff0, %g1, %r26
	setx 0xeec8594d79e2446c, %g1, %r27
	setx 0x70c990d69c883fb7, %g1, %r28
	setx 0x662f2aca8958c752, %g1, %r29
	setx 0x0eb54f6118c3bda4, %g1, %r30
	setx 0x7f9de909a0882fa4, %g1, %r31
	save
	setx 0x8fe0bce13ec7fa31, %g1, %r16
	setx 0x2a355a90b105a5f0, %g1, %r17
	setx 0xe1aeb943d61e3fcc, %g1, %r18
	setx 0x89b2202362ed2af1, %g1, %r19
	setx 0xca930090f8613130, %g1, %r20
	setx 0xbf864442fc5a036d, %g1, %r21
	setx 0xf44e75a01d81aed0, %g1, %r22
	setx 0x7a8874d098c44c35, %g1, %r23
	setx 0x50e959ca11ffdae5, %g1, %r24
	setx 0xb3325d933713ae2e, %g1, %r25
	setx 0xb4417a448731fa74, %g1, %r26
	setx 0x042f7cfc69a28ad5, %g1, %r27
	setx 0xffcc7bfa7735225a, %g1, %r28
	setx 0xf90e4a637b155c41, %g1, %r29
	setx 0xffedacb6cc4a00ca, %g1, %r30
	setx 0x272ed34c15857d7d, %g1, %r31
	ta	T_CHANGE_HPRIV
	wrpr	%g0, 0, %pil
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
	setx	%hi(0x1ffe0000f), %g1, %g2
	stxa	%g2, [%g0] 0x45
	mov	0x38, %g3
	setx	data_start_0, %g1, %g2
	stxa	%g2, [%g3] 0x58
Init_scratchpad:
	wr	%g0, 0x4f, %asi
	stxa	%l0, [0x0] %asi
	stxa	%l1, [0x8] %asi
	stxa	%l2, [0x10] %asi
	stxa	%l3, [0x18] %asi
	stxa	%l4, [0x20] %asi
	stxa	%l5, [0x28] %asi
	stxa	%l6, [0x30] %asi
	stxa	%l7, [0x38] %asi
	ta	T_CHANGE_NONHPRIV
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
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_rd_0:
	mov	0x3c8, %r14
	.word 0xf0db8400  ! 6: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbde4c000  ! 7: SAVE_R	save	%r19, %r0, %r30
	.word 0xb3e5a0fb  ! 8: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_wr_0:
	mov	0x2f, %r14
	.word 0xf2f38e60  ! 11: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_wr_1:
	mov	0x9, %r14
	.word 0xfcf38e80  ! 12: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_wr_2:
	mov	0x34, %r14
	.word 0xfcf38e40  ! 13: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb5e5608b  ! 16: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_wr_3:
	mov	0x3c2, %r14
	.word 0xfef389e0  ! 22: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 34)
	.word 0xb9e48000  ! 24: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_0:
	setx	0x1e0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb435a0b4  ! 28: SUBC_I	orn 	%r22, 0x00b4, %r26
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_wr_4:
	mov	0x30, %r14
	.word 0xfaf389e0  ! 37: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb9e50000  ! 41: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_wr_5:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 47: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 9)
	.word 0xb5e50000  ! 49: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_1:
	setx	0x1c022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 51: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_2:
	setx	0x1e0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4bd217a  ! 58: XNORcc_I	xnorcc 	%r20, 0x017a, %r26
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_3:
	setx	0x1e011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_4:
	setx	0x1c0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 67: SAVE_R	save	%r17, %r0, %r25
	.word 0xb73ca001  ! 68: SRA_I	sra 	%r18, 0x0001, %r27
	.word 0xb334b001  ! 69: SRLX_I	srlx	%r18, 0x0001, %r25
	.word 0xb3643801  ! 70: MOVcc_I	<illegal instruction>
T0_asi_reg_wr_6:
	mov	0x31, %r14
	.word 0xfcf38e80  ! 74: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_0_5:
	setx	0x1f031c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_7:
	mov	0xd, %r14
	.word 0xf2f38e40  ! 79: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_6:
	setx	0x1d0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 83: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_rd_1:
	mov	0x3c2, %r14
	.word 0xf2db8e80  ! 87: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb9e4e018  ! 88: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_rd_2:
	mov	0x3c1, %r14
	.word 0xf2db84a0  ! 92: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_0_7:
	setx	0x1e0237, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_8:
	mov	0x22, %r14
	.word 0xf6f389e0  ! 99: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb5e40000  ! 101: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_wr_9:
	mov	0x36, %r14
	.word 0xfaf38e60  ! 102: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 12)
cpu_intr_0_8:
	setx	0x1e0035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_9:
	setx	0x1d0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 108: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 21)
	.word 0xbde40000  ! 110: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_10:
	setx	0x1d0013, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_10:
	mov	0x2f, %r14
	.word 0xfef389e0  ! 114: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb7e58000  ! 120: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_11:
	setx	0x1f000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 125: SAVE_R	save	%r22, %r0, %r24
	.word 0xb750c000  ! 127: RDPR_TT	<illegal instruction>
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_12:
	setx	0x1e0238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, b)
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb1e56108  ! 137: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_13:
	setx	0x1f022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a19b  ! 139: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbc9ce073  ! 142: XORcc_I	xorcc 	%r19, 0x0073, %r30
	.word 0xbbe48000  ! 145: SAVE_R	save	%r18, %r0, %r29
	.word 0xb1e5613a  ! 146: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_14:
	setx	0x1d0231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, 6)
	.word 0xb1e4c000  ! 153: SAVE_R	save	%r19, %r0, %r24
	.word 0xb77c4400  ! 154: MOVR_R	movre	%r17, %r0, %r27
	.word 0xb9e48000  ! 156: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_15:
	setx	0x1d030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_3:
	mov	0x2f, %r14
	.word 0xfedb8e40  ! 160: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5e40000  ! 163: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_rd_4:
	mov	0x3c1, %r14
	.word 0xf0db8400  ! 167: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 18)
	.word 0xbde58000  ! 169: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_rd_5:
	mov	0x10, %r14
	.word 0xf6db84a0  ! 170: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_16:
	setx	0x1c023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e560d6  ! 175: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb295e0da  ! 177: ORcc_I	orcc 	%r23, 0x00da, %r25
cpu_intr_0_17:
	setx	0x1e0108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 179: SAVE_R	save	%r23, %r0, %r30
	.word 0xbde5e134  ! 183: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_wr_11:
	mov	0x3c1, %r14
	.word 0xf2f389e0  ! 184: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb9e5e1b5  ! 186: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe4615f  ! 188: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_18:
	setx	0x1e0337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_19:
	setx	0x1d030b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_20:
	setx	0x1f0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00da0f9  ! 193: AND_I	and 	%r22, 0x00f9, %r24
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 32)
cpu_intr_0_21:
	setx	0x1e020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 202: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_wr_12:
	mov	0x1c, %r14
	.word 0xf4f389e0  ! 206: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb3e4e03e  ! 209: SAVE_I	save	%r19, 0x0001, %r25
cpu_intr_0_22:
	setx	0x1c0331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_23:
	setx	0x1e0026, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_6:
	mov	0x31, %r14
	.word 0xf8db89e0  ! 218: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_rd_7:
	mov	0x32, %r14
	.word 0xf8db8e80  ! 219: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbfe44000  ! 220: SAVE_R	save	%r17, %r0, %r31
	.word 0xb5e4e029  ! 221: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_rd_8:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 222: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb5e40000  ! 225: SAVE_R	save	%r16, %r0, %r26
	.word 0xb1e4a04f  ! 226: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe5a15d  ! 227: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb12d3001  ! 228: SLLX_I	sllx	%r20, 0x0001, %r24
cpu_intr_0_24:
	setx	0x1c001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 231: SAVE_R	save	%r16, %r0, %r28
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_25:
	setx	0x1f010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 2)
	.word 0x85942136  ! 243: WRPR_TSTATE_I	wrpr	%r16, 0x0136, %tstate
	.word 0xbbe58000  ! 244: SAVE_R	save	%r22, %r0, %r29
	.word 0xb7e5a1fd  ! 246: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_26:
	setx	0x1c0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a05e  ! 253: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e56162  ! 254: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_rd_9:
	mov	0x30, %r14
	.word 0xf0db8e40  ! 257: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_27:
	setx	0x1e0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e1fe  ! 260: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e521fc  ! 263: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_28:
	setx	0x1c031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_10:
	mov	0x3c2, %r14
	.word 0xf8db8400  ! 271: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T0_asi_reg_wr_13:
	mov	0x3c2, %r14
	.word 0xfcf38e80  ! 273: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_29:
	setx	0x1e001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e1d7  ! 280: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe5a052  ! 282: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde48000  ! 286: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_rd_11:
	mov	0x3c1, %r14
	.word 0xf6db89e0  ! 287: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_rd_12:
	mov	0x9, %r14
	.word 0xf2db8400  ! 290: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb7e5a184  ! 291: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb23dc000  ! 294: XNOR_R	xnor 	%r23, %r0, %r25
cpu_intr_0_30:
	setx	0x1e0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9344000  ! 297: SRL_R	srl 	%r17, %r0, %r28
	.word 0xb5e4a10d  ! 301: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e44000  ! 302: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 12)
	.word 0xb8c4617c  ! 304: ADDCcc_I	addccc 	%r17, 0x017c, %r28
	.word 0xb7e42121  ! 305: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbab46086  ! 306: ORNcc_I	orncc 	%r17, 0x0086, %r29
	.word 0xb1e5e1dc  ! 307: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbab5607c  ! 308: SUBCcc_I	orncc 	%r21, 0x007c, %r29
	.word 0xb5e4a016  ! 309: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_rd_13:
	mov	0x3c6, %r14
	.word 0xf8db8e60  ! 311: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb8442000  ! 312: ADDC_I	addc 	%r16, 0x0000, %r28
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 37)
	.word 0xb5e4a0dc  ! 315: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_rd_14:
	mov	0x1a, %r14
	.word 0xf4db8e60  ! 316: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb7e40000  ! 317: SAVE_R	save	%r16, %r0, %r27
cpu_intr_0_31:
	setx	0x1f010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 321: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_32:
	setx	0x1f003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 21)
cpu_intr_0_33:
	setx	0x1d0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2c3001  ! 326: SLLX_I	sllx	%r16, 0x0001, %r30
	.word 0xb9e44000  ! 329: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_wr_14:
	mov	0x22, %r14
	.word 0xf0f38e60  ! 336: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb815c000  ! 340: OR_R	or 	%r23, %r0, %r28
T0_asi_reg_rd_15:
	mov	0x15, %r14
	.word 0xfcdb8e60  ! 341: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbfe50000  ! 342: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_34:
	setx	0x1f000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e521a1  ! 345: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e4e118  ! 347: SAVE_I	save	%r19, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe4619d  ! 354: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb41d6086  ! 355: XOR_I	xor 	%r21, 0x0086, %r26
	.word 0xb7e421e7  ! 362: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e50000  ! 363: SAVE_R	save	%r20, %r0, %r26
	.word 0xb3e4c000  ! 368: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_35:
	setx	0x1e032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_36:
	setx	0x1c0007, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_37:
	setx	0x1f003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e42114  ! 377: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb334e001  ! 379: SRL_I	srl 	%r19, 0x0001, %r25
cpu_intr_0_38:
	setx	0x1c0120, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_16:
	mov	0x3c2, %r14
	.word 0xfadb8e60  ! 384: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, 13)
	.word 0xb9e5e0e6  ! 389: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_rd_17:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 392: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_18:
	mov	0x12, %r14
	.word 0xf0db8e40  ! 396: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7e4e0b0  ! 398: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_39:
	setx	0x1d0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb804e080  ! 400: ADD_I	add 	%r19, 0x0080, %r28
cpu_intr_0_40:
	setx	0x1e023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_15:
	mov	0x1c, %r14
	.word 0xfaf389e0  ! 407: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_0_41:
	setx	0x1d011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 412: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb1e54000  ! 419: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_42:
	setx	0x1c0101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_43:
	setx	0x1d0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 424: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_19:
	mov	0x23, %r14
	.word 0xfedb8e80  ! 425: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T0_asi_reg_rd_20:
	mov	0x1d, %r14
	.word 0xfedb8e60  ! 429: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_44:
	setx	0x1c0005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_45:
	setx	0x1f0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 432: SAVE_R	save	%r16, %r0, %r25
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 27)
	.word 0xba8dc000  ! 437: ANDcc_R	andcc 	%r23, %r0, %r29
cpu_intr_0_46:
	setx	0x1c0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e52109  ! 441: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_47:
	setx	0x1c0027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_48:
	setx	0x1d0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a0fb  ! 449: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_49:
	setx	0x1d0016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_50:
	setx	0x1f0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe40000  ! 454: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 29)
	.word 0xbbe4e05f  ! 458: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb2c4615a  ! 459: ADDCcc_I	addccc 	%r17, 0x015a, %r25
	.word 0xb3e421c8  ! 460: SAVE_I	save	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_rd_21:
	mov	0x3c8, %r14
	.word 0xf6db84a0  ! 466: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 23)
T0_asi_reg_wr_16:
	mov	0x3c3, %r14
	.word 0xf8f384a0  ! 471: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb5e4a088  ! 472: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9e4c000  ! 474: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_rd_22:
	mov	0x14, %r14
	.word 0xf2db89e0  ! 476: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb8bcc000  ! 482: XNORcc_R	xnorcc 	%r19, %r0, %r28
	.word 0xb52d8000  ! 485: SLL_R	sll 	%r22, %r0, %r26
	.word 0xbbe48000  ! 486: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_51:
	setx	0x23032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_52:
	setx	0x230120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, 9)
	.word 0xb12c1000  ! 499: SLLX_R	sllx	%r16, %r0, %r24
	.word 0xbde4619a  ! 501: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e58000  ! 502: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_53:
	setx	0x230034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 506: SAVE_R	save	%r20, %r0, %r27
	.word 0xb5e5c000  ! 508: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb1e40000  ! 519: SAVE_R	save	%r16, %r0, %r24
	.word 0xbac420d4  ! 521: ADDCcc_I	addccc 	%r16, 0x00d4, %r29
	.word 0xbfe4e059  ! 525: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_54:
	setx	0x22030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_55:
	setx	0x220326, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_17:
	mov	0x14, %r14
	.word 0xf8f384a0  ! 529: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T0_asi_reg_rd_23:
	mov	0x26, %r14
	.word 0xf6db8e80  ! 531: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb49c4000  ! 532: XORcc_R	xorcc 	%r17, %r0, %r26
	.word 0xb4bd8000  ! 534: XNORcc_R	xnorcc 	%r22, %r0, %r26
T0_asi_reg_rd_24:
	mov	0x2, %r14
	.word 0xfedb89e0  ! 535: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_0_56:
	setx	0x230133, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_18:
	mov	0x2a, %r14
	.word 0xfef38e40  ! 539: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_57:
	setx	0x210107, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 9)
	.word 0xb9e48000  ! 553: SAVE_R	save	%r18, %r0, %r28
	.word 0xb7518000  ! 554: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5e5e050  ! 562: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbde44000  ! 563: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_58:
	setx	0x230130, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_59:
	setx	0x210018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 573: SAVE_R	save	%r21, %r0, %r30
	.word 0xb1e4c000  ! 574: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 15)
	.word 0xbd510000  ! 578: RDPR_TICK	<illegal instruction>
	.word 0xb1e5a174  ! 579: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_25:
	mov	0x27, %r14
	.word 0xf0db84a0  ! 581: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_0_60:
	setx	0x23033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_26:
	mov	0x19, %r14
	.word 0xfcdb8e80  ! 584: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_61:
	setx	0x20003e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_19:
	mov	0x17, %r14
	.word 0xfef38e60  ! 592: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb5e4e0d9  ! 596: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e40000  ! 597: SAVE_R	save	%r16, %r0, %r27
	.word 0xb68ce127  ! 599: ANDcc_I	andcc 	%r19, 0x0127, %r27
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 21)
	.word 0xbfe5a1e7  ! 604: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 16)
	.word 0xb9e4a088  ! 606: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_27:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 608: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb7e520e7  ! 610: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e5c000  ! 611: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_62:
	setx	0x230117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb354000  ! 617: SRL_R	srl 	%r21, %r0, %r29
T0_asi_reg_rd_28:
	mov	0x10, %r14
	.word 0xfadb89e0  ! 618: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb5e460b1  ! 619: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe4c000  ! 620: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_rd_29:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 621: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb60420c8  ! 624: ADD_I	add 	%r16, 0x00c8, %r27
cpu_intr_0_63:
	setx	0x23030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_20:
	mov	0x31, %r14
	.word 0xfcf384a0  ! 632: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbaa58000  ! 633: SUBcc_R	subcc 	%r22, %r0, %r29
	.word 0xbea4a192  ! 634: SUBcc_I	subcc 	%r18, 0x0192, %r31
	.word 0xbbe5c000  ! 635: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_wr_21:
	mov	0x30, %r14
	.word 0xfef389e0  ! 638: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_64:
	setx	0x210204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a1f4  ! 642: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9e44000  ! 645: SAVE_R	save	%r17, %r0, %r28
	.word 0xbd3c3001  ! 646: SRAX_I	srax	%r16, 0x0001, %r30
cpu_intr_0_65:
	setx	0x200214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e19d  ! 649: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e42081  ! 653: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde48000  ! 654: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_66:
	setx	0x210305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd508000  ! 660: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e46107  ! 661: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 5)
	.word 0xbb344000  ! 663: SRL_R	srl 	%r17, %r0, %r29
	.word 0xb5e4c000  ! 671: SAVE_R	save	%r19, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_67:
	setx	0x21021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a052  ! 675: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_68:
	setx	0x20012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 682: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_69:
	setx	0x200206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 685: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_30:
	mov	0x4, %r14
	.word 0xf2db8e40  ! 687: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbde4c000  ! 689: SAVE_R	save	%r19, %r0, %r30
	.word 0xb5e5c000  ! 690: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_70:
	setx	0x220124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e00b  ! 692: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe4a0d8  ! 695: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_wr_22:
	mov	0x3c1, %r14
	.word 0xfef38e80  ! 696: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_0_71:
	setx	0x22033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe521c7  ! 698: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_72:
	setx	0x22003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_31:
	mov	0x11, %r14
	.word 0xf6db8e40  ! 703: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbde4c000  ! 706: SAVE_R	save	%r19, %r0, %r30
	.word 0xb3e42008  ! 707: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e58000  ! 709: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, a)
	.word 0xb485a1f1  ! 717: ADDcc_I	addcc 	%r22, 0x01f1, %r26
	.word 0xb5e5c000  ! 718: SAVE_R	save	%r23, %r0, %r26
	.word 0xb3e5c000  ! 721: SAVE_R	save	%r23, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbe40000  ! 725: SAVE_R	save	%r16, %r0, %r29
	.word 0xbde4c000  ! 726: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 0)
	.word 0xbbe52087  ! 728: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb3e46174  ! 733: SAVE_I	save	%r17, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb950c000  ! 738: RDPR_TT	<illegal instruction>
	.word 0xb3e5c000  ! 739: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_wr_23:
	mov	0x28, %r14
	.word 0xf0f38e60  ! 740: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_0_73:
	setx	0x200228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb3e40000  ! 745: SAVE_R	save	%r16, %r0, %r25
	.word 0xb7e460f8  ! 746: SAVE_I	save	%r17, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb13db001  ! 749: SRAX_I	srax	%r22, 0x0001, %r24
	.word 0xb5e52188  ! 750: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_wr_24:
	mov	0x36, %r14
	.word 0xfef384a0  ! 752: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb4842092  ! 755: ADDcc_I	addcc 	%r16, 0x0092, %r26
	.word 0xbbe40000  ! 756: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_rd_32:
	mov	0x19, %r14
	.word 0xf8db8e40  ! 758: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_74:
	setx	0x200229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_75:
	setx	0x22020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a12d  ! 765: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_76:
	setx	0x20012e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_77:
	setx	0x210201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_78:
	setx	0x230015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb034a020  ! 773: SUBC_I	orn 	%r18, 0x0020, %r24
	.word 0xb0344000  ! 774: SUBC_R	orn 	%r17, %r0, %r24
	.word 0xbde56098  ! 777: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe460b3  ! 779: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbfe40000  ! 780: SAVE_R	save	%r16, %r0, %r31
	.word 0xb1e40000  ! 783: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_79:
	setx	0x22020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a093  ! 789: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_80:
	setx	0x21033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_25:
	mov	0x2e, %r14
	.word 0xf8f38e40  ! 798: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, 14)
	.word 0xbfe52150  ! 801: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbfe4a09d  ! 802: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe54000  ! 803: SAVE_R	save	%r21, %r0, %r29
T0_asi_reg_wr_26:
	mov	0x18, %r14
	.word 0xf8f389e0  ! 806: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb2b4c000  ! 807: SUBCcc_R	orncc 	%r19, %r0, %r25
	.word 0xb3e58000  ! 809: SAVE_R	save	%r22, %r0, %r25
	.word 0xb5e520a7  ! 810: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb03421c0  ! 811: SUBC_I	orn 	%r16, 0x01c0, %r24
	.word 0xb7e44000  ! 813: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 35)
	.word 0xb3e44000  ! 820: SAVE_R	save	%r17, %r0, %r25
	.word 0xb9e5612f  ! 825: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb37ce401  ! 826: MOVR_I	movre	%r19, 0x1, %r25
	.word 0xb9e54000  ! 827: SAVE_R	save	%r21, %r0, %r28
	.word 0xb3e58000  ! 833: SAVE_R	save	%r22, %r0, %r25
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 35)
	.word 0xb5e44000  ! 838: SAVE_R	save	%r17, %r0, %r26
	.word 0xb83c8000  ! 839: XNOR_R	xnor 	%r18, %r0, %r28
T0_asi_reg_rd_33:
	mov	0x21, %r14
	.word 0xf0db8e40  ! 840: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_81:
	setx	0x230013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_82:
	setx	0x23022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_34:
	mov	0x18, %r14
	.word 0xf0db8e80  ! 850: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T0_asi_reg_rd_35:
	mov	0x14, %r14
	.word 0xf6db8e40  ! 851: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 6)
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, 34)
	.word 0xb3e56061  ! 857: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe4e01a  ! 858: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 36)
	.word 0xbbe48000  ! 861: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_wr_27:
	mov	0x33, %r14
	.word 0xfcf38e40  ! 862: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_rd_36:
	mov	0x3c6, %r14
	.word 0xfadb8400  ! 864: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_0_83:
	setx	0x20023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4600a  ! 867: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb7e44000  ! 870: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, 3e)
	.word 0xbde40000  ! 872: SAVE_R	save	%r16, %r0, %r30
	.word 0xbbe5c000  ! 873: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_84:
	setx	0x20011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4246052  ! 881: SUB_I	sub 	%r17, 0x0052, %r26
cpu_intr_0_85:
	setx	0x21033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12d5000  ! 885: SLLX_R	sllx	%r21, %r0, %r24
T0_asi_reg_wr_28:
	mov	0x3c3, %r14
	.word 0xf8f38e80  ! 886: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb3e4c000  ! 889: SAVE_R	save	%r19, %r0, %r25
	.word 0xbbe5c000  ! 890: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_86:
	setx	0x200011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 892: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_29:
	mov	0x2a, %r14
	.word 0xfaf38e40  ! 895: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 37)
	.word 0xb9e40000  ! 897: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_rd_37:
	mov	0x1d, %r14
	.word 0xf4db8e80  ! 899: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb7e46123  ! 903: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe4c000  ! 904: SAVE_R	save	%r19, %r0, %r31
	.word 0xbfe50000  ! 905: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_rd_38:
	mov	0x16, %r14
	.word 0xf4db84a0  ! 907: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T0_asi_reg_wr_30:
	mov	0x3c2, %r14
	.word 0xf2f38400  ! 909: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbbe5612c  ! 910: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_wr_31:
	mov	0x22, %r14
	.word 0xfef38e80  ! 912: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb1e420cf  ! 917: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1e420ec  ! 918: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb8b50000  ! 921: SUBCcc_R	orncc 	%r20, %r0, %r28
	.word 0xbfe50000  ! 922: SAVE_R	save	%r20, %r0, %r31
	.word 0xbbe50000  ! 924: SAVE_R	save	%r20, %r0, %r29
	.word 0xb3e44000  ! 926: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_87:
	setx	0x24021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_39:
	mov	0x31, %r14
	.word 0xf8db8e80  ! 931: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb43d0000  ! 933: XNOR_R	xnor 	%r20, %r0, %r26
cpu_intr_0_88:
	setx	0x26022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_32:
	mov	0x3c3, %r14
	.word 0xf2f38e80  ! 938: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb5e4a1d2  ! 943: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7e50000  ! 944: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 33)
	.word 0xbfe50000  ! 947: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_89:
	setx	0x250002, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_40:
	mov	0xb, %r14
	.word 0xf4db84a0  ! 950: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_90:
	setx	0x240109, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_33:
	mov	0x1d, %r14
	.word 0xfef389e0  ! 955: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_0_91:
	setx	0x250007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_92:
	setx	0x250110, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_41:
	mov	0x1, %r14
	.word 0xf2db8e60  ! 964: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbde4a18b  ! 966: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e5202a  ! 967: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbfe5e186  ! 968: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbb7d4400  ! 971: MOVR_R	movre	%r21, %r0, %r29
	.word 0xb1e4e1f1  ! 972: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb63d218c  ! 974: XNOR_I	xnor 	%r20, 0x018c, %r27
T0_asi_reg_wr_34:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 975: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3e58000  ! 976: SAVE_R	save	%r22, %r0, %r25
	.word 0xb40ca1d5  ! 977: AND_I	and 	%r18, 0x01d5, %r26
	.word 0xb9e50000  ! 980: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_rd_42:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 985: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb3e58000  ! 987: SAVE_R	save	%r22, %r0, %r25
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_93:
	setx	0x250022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_94:
	setx	0x270310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_wr_35:
	mov	0x1a, %r14
	.word 0xf4f38e80  ! 1001: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 27)
	.word 0xb5e5619f  ! 1006: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde50000  ! 1008: SAVE_R	save	%r20, %r0, %r30
	.word 0xbc85e045  ! 1009: ADDcc_I	addcc 	%r23, 0x0045, %r30
T0_asi_reg_rd_43:
	mov	0x34, %r14
	.word 0xf0db89e0  ! 1011: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbde5c000  ! 1014: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_rd_44:
	mov	0x3c7, %r14
	.word 0xf2db8e80  ! 1015: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb7e40000  ! 1018: SAVE_R	save	%r16, %r0, %r27
	.word 0xb3e50000  ! 1019: SAVE_R	save	%r20, %r0, %r25
	.word 0xb4456126  ! 1021: ADDC_I	addc 	%r21, 0x0126, %r26
	.word 0xb5e5204e  ! 1022: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5e5c000  ! 1024: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_95:
	setx	0x260305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_96:
	setx	0x250328, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_36:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 1028: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbcc5e070  ! 1037: ADDCcc_I	addccc 	%r23, 0x0070, %r30
cpu_intr_0_97:
	setx	0x270117, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_37:
	mov	0xc, %r14
	.word 0xf4f384a0  ! 1040: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T0_asi_reg_rd_45:
	mov	0x32, %r14
	.word 0xf0db89e0  ! 1041: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T0_asi_reg_wr_38:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 1050: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_rd_46:
	mov	0x2, %r14
	.word 0xf8db8400  ! 1052: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T0_asi_reg_wr_39:
	mov	0x9, %r14
	.word 0xf2f38e60  ! 1053: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb1e56070  ! 1054: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_rd_47:
	mov	0x27, %r14
	.word 0xf2db8e80  ! 1055: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_0_98:
	setx	0x240202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a08f  ! 1062: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe561d4  ! 1064: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e5e014  ! 1065: SAVE_I	save	%r23, 0x0001, %r27
	.word 0x8995e064  ! 1066: WRPR_TICK_I	wrpr	%r23, 0x0064, %tick
T0_asi_reg_wr_40:
	mov	0xa, %r14
	.word 0xf0f38e40  ! 1067: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb3e50000  ! 1069: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_rd_48:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 1071: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb9e5a1ec  ! 1072: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe4a01d  ! 1079: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e4c000  ! 1080: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_rd_49:
	mov	0x8, %r14
	.word 0xf8db89e0  ! 1081: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_wr_41:
	mov	0xf, %r14
	.word 0xf0f38e40  ! 1082: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb1e5c000  ! 1085: SAVE_R	save	%r23, %r0, %r24
	.word 0xbde40000  ! 1090: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_99:
	setx	0x270020, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_50:
	mov	0x28, %r14
	.word 0xf2db8e60  ! 1093: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T0_asi_reg_rd_51:
	mov	0x1f, %r14
	.word 0xf6db89e0  ! 1098: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbbe44000  ! 1101: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_100:
	setx	0x270217, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_52:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 1104: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_42:
	mov	0xb, %r14
	.word 0xfcf384a0  ! 1108: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_0_101:
	setx	0x270037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 1113: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_102:
	setx	0x26021f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbde5c000  ! 1119: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_103:
	setx	0x26003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 23)
	.word 0xbfe5614f  ! 1132: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e52014  ! 1133: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e52177  ! 1134: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_rd_53:
	mov	0x3c3, %r14
	.word 0xfedb89e0  ! 1138: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb2244000  ! 1140: SUB_R	sub 	%r17, %r0, %r25
	.word 0xb1e54000  ! 1141: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_wr_43:
	mov	0x3c6, %r14
	.word 0xfcf38e60  ! 1143: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbde5c000  ! 1144: SAVE_R	save	%r23, %r0, %r30
	.word 0xbde58000  ! 1148: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_104:
	setx	0x270108, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_54:
	mov	0x3c5, %r14
	.word 0xf6db8400  ! 1155: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb9e40000  ! 1157: SAVE_R	save	%r16, %r0, %r28
	.word 0xb9e4a091  ! 1160: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_105:
	setx	0x260326, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_wr_44:
	mov	0xc, %r14
	.word 0xfef38e60  ! 1169: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb1e48000  ! 1172: SAVE_R	save	%r18, %r0, %r24
	.word 0xb9e461db  ! 1173: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb9e4a0d1  ! 1175: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe5c000  ! 1177: SAVE_R	save	%r23, %r0, %r31
	.word 0xb2b5c000  ! 1179: ORNcc_R	orncc 	%r23, %r0, %r25
	.word 0xb1e54000  ! 1181: SAVE_R	save	%r21, %r0, %r24
	.word 0xbbe5c000  ! 1183: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_106:
	setx	0x240207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8da127  ! 1186: ANDcc_I	andcc 	%r22, 0x0127, %r30
	.word 0xbde54000  ! 1189: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 17)
	.word 0xbbe54000  ! 1191: SAVE_R	save	%r21, %r0, %r29
	.word 0xb7e5e004  ! 1192: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb48cc000  ! 1194: ANDcc_R	andcc 	%r19, %r0, %r26
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbde4a126  ! 1205: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e54000  ! 1206: SAVE_R	save	%r21, %r0, %r26
	.word 0xbbe46090  ! 1210: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_rd_55:
	mov	0x2c, %r14
	.word 0xf8db8400  ! 1211: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_0_107:
	setx	0x240215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_rd_56:
	mov	0x2e, %r14
	.word 0xf0db8e40  ! 1218: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb1e4c000  ! 1223: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_108:
	setx	0x27012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 1227: SAVE_R	save	%r23, %r0, %r29
	.word 0xb1e40000  ! 1229: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_wr_45:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 1232: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbde421cf  ! 1235: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xba354000  ! 1236: ORN_R	orn 	%r21, %r0, %r29
cpu_intr_0_109:
	setx	0x260210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 1246: SAVE_R	save	%r16, %r0, %r26
	.word 0xbfe421aa  ! 1247: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb22ca139  ! 1251: ANDN_I	andn 	%r18, 0x0139, %r25
	.word 0xb7e4e1e5  ! 1252: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_110:
	setx	0x250003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 34)
	.word 0xbde4e146  ! 1265: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_wr_46:
	mov	0x3c7, %r14
	.word 0xfaf38400  ! 1266: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb3e4e125  ! 1268: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_47:
	mov	0x2f, %r14
	.word 0xf8f38400  ! 1269: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_rd_57:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 1272: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbbe5e096  ! 1274: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_111:
	setx	0x270007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_112:
	setx	0x270233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8258000  ! 1283: SUB_R	sub 	%r22, %r0, %r28
T0_asi_reg_rd_58:
	mov	0x3c5, %r14
	.word 0xfcdb84a0  ! 1285: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb5e42156  ! 1292: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb60da0f3  ! 1293: AND_I	and 	%r22, 0x00f3, %r27
T0_asi_reg_rd_59:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 1295: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1e58000  ! 1297: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, 23)
	.word 0xbbe4e162  ! 1300: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb5355000  ! 1301: SRLX_R	srlx	%r21, %r0, %r26
cpu_intr_0_113:
	setx	0x26000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_60:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 1303: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_61:
	mov	0x30, %r14
	.word 0xfadb8e80  ! 1304: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb4b50000  ! 1305: ORNcc_R	orncc 	%r20, %r0, %r26
cpu_intr_0_114:
	setx	0x270111, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_48:
	mov	0x0, %r14
	.word 0xf4f38e60  ! 1309: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb1e4a0f6  ! 1310: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe40000  ! 1312: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_115:
	setx	0x270226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5213e  ! 1316: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe5e1a7  ! 1320: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_wr_49:
	mov	0x1a, %r14
	.word 0xfaf38400  ! 1321: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_116:
	setx	0x260118, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_62:
	mov	0x3, %r14
	.word 0xfadb8e40  ! 1323: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_rd_63:
	mov	0x3c7, %r14
	.word 0xf6db89e0  ! 1324: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_0_117:
	setx	0x25002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e126  ! 1328: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 0)
	.word 0xbde40000  ! 1336: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_118:
	setx	0x250127, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_64:
	mov	0x3c4, %r14
	.word 0xf6db84a0  ! 1341: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbfe521a7  ! 1343: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_119:
	setx	0x240031, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_65:
	mov	0x14, %r14
	.word 0xfcdb8e60  ! 1350: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb93d2001  ! 1352: SRA_I	sra 	%r20, 0x0001, %r28
	.word 0xbc9d4000  ! 1355: XORcc_R	xorcc 	%r21, %r0, %r30
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb0b4c000  ! 1360: SUBCcc_R	orncc 	%r19, %r0, %r24
	.word 0xbfe48000  ! 1361: SAVE_R	save	%r18, %r0, %r31
	.word 0xbbe4c000  ! 1362: SAVE_R	save	%r19, %r0, %r29
	.word 0xbb500000  ! 1370: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_120:
	setx	0x240106, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_66:
	mov	0x1b, %r14
	.word 0xfadb8e40  ! 1374: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_67:
	mov	0x3c6, %r14
	.word 0xfadb89e0  ! 1382: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_wr_50:
	mov	0x24, %r14
	.word 0xf6f38e40  ! 1392: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_121:
	setx	0x2b0100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_68:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 1398: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xba35e1b3  ! 1401: SUBC_I	orn 	%r23, 0x01b3, %r29
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_wr_51:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 1410: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_122:
	setx	0x2b0327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_123:
	setx	0x2b0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e52195  ! 1425: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_rd_69:
	mov	0x3c7, %r14
	.word 0xf0db89e0  ! 1428: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T0_asi_reg_rd_70:
	mov	0x3c4, %r14
	.word 0xfcdb8e80  ! 1429: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbde5e077  ! 1431: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_wr_52:
	mov	0x30, %r14
	.word 0xfcf389e0  ! 1436: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbfe4c000  ! 1437: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_rd_71:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 1438: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb3e58000  ! 1439: SAVE_R	save	%r22, %r0, %r25
	.word 0xb5e54000  ! 1442: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_wr_53:
	mov	0x3c6, %r14
	.word 0xf6f389e0  ! 1446: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T0_asi_reg_rd_72:
	mov	0x34, %r14
	.word 0xfedb8e40  ! 1447: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbfe58000  ! 1448: SAVE_R	save	%r22, %r0, %r31
	.word 0xb3e58000  ! 1449: SAVE_R	save	%r22, %r0, %r25
	.word 0xb7e420fb  ! 1450: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_124:
	setx	0x2a0216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_125:
	setx	0x290038, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_54:
	mov	0x3c1, %r14
	.word 0xf4f38e60  ! 1457: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_126:
	setx	0x280103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 1463: SAVE_R	save	%r17, %r0, %r29
	.word 0xb7e40000  ! 1464: SAVE_R	save	%r16, %r0, %r27
	.word 0xa1902000  ! 1466: WRPR_GL_I	wrpr	%r0, 0x0000, %-
T0_asi_reg_wr_55:
	mov	0x7, %r14
	.word 0xfaf384a0  ! 1467: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 12)
	.word 0xbbe5603c  ! 1470: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 16)
	.word 0xb5e461a8  ! 1472: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde4c000  ! 1474: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_127:
	setx	0x2b0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 1476: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_rd_73:
	mov	0x2, %r14
	.word 0xfedb89e0  ! 1479: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb9e461da  ! 1483: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_wr_56:
	mov	0x3c4, %r14
	.word 0xf8f389e0  ! 1485: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb52c5000  ! 1486: SLLX_R	sllx	%r17, %r0, %r26
cpu_intr_0_128:
	setx	0x2b0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8150000  ! 1490: OR_R	or 	%r20, %r0, %r28
	.word 0xbfe5619b  ! 1492: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_129:
	setx	0x280006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_130:
	setx	0x2a0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a073  ! 1497: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_rd_74:
	mov	0xe, %r14
	.word 0xf6db84a0  ! 1501: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_0_131:
	setx	0x280003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e0a3  ! 1504: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_132:
	setx	0x290119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_133:
	setx	0x280215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 1512: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_134:
	setx	0x2a031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 5)
	.word 0xbd3cc000  ! 1519: SRA_R	sra 	%r19, %r0, %r30
	.word 0xb3e48000  ! 1522: SAVE_R	save	%r18, %r0, %r25
	.word 0xbe0c8000  ! 1523: AND_R	and 	%r18, %r0, %r31
cpu_intr_0_135:
	setx	0x28020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb1e50000  ! 1528: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_136:
	setx	0x2b0304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_wr_57:
	mov	0x3c4, %r14
	.word 0xfaf384a0  ! 1535: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb08c20f1  ! 1538: ANDcc_I	andcc 	%r16, 0x00f1, %r24
cpu_intr_0_137:
	setx	0x28013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 22)
	.word 0xb7e4c000  ! 1546: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 11)
	.word 0xbbe521fe  ! 1553: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_wr_58:
	mov	0x3c0, %r14
	.word 0xfef38e60  ! 1554: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_138:
	setx	0x2a0031, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_59:
	mov	0x21, %r14
	.word 0xf2f384a0  ! 1560: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T0_asi_reg_wr_60:
	mov	0xf, %r14
	.word 0xf8f38400  ! 1561: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_rd_75:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 1562: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_139:
	setx	0x28001b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_140:
	setx	0x2a001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_141:
	setx	0x2a001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_142:
	setx	0x280139, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_61:
	mov	0x33, %r14
	.word 0xfcf384a0  ! 1578: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb5e58000  ! 1580: SAVE_R	save	%r22, %r0, %r26
	.word 0xbd7d2401  ! 1581: MOVR_I	movre	%r20, 0x1, %r30
	.word 0xbc3d4000  ! 1582: XNOR_R	xnor 	%r21, %r0, %r30
	.word 0xb3e4205c  ! 1583: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_143:
	setx	0x280026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_144:
	setx	0x290222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 1590: SAVE_R	save	%r19, %r0, %r25
	.word 0xb950c000  ! 1593: RDPR_TT	<illegal instruction>
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_wr_62:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 1598: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb1e4e14c  ! 1599: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe48000  ! 1601: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_145:
	setx	0x2b0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba2c4000  ! 1606: ANDN_R	andn 	%r17, %r0, %r29
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_wr_63:
	mov	0xb, %r14
	.word 0xfaf38e80  ! 1610: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb3e4c000  ! 1611: SAVE_R	save	%r19, %r0, %r25
	.word 0xb015a01c  ! 1613: OR_I	or 	%r22, 0x001c, %r24
T0_asi_reg_wr_64:
	mov	0x28, %r14
	.word 0xfef389e0  ! 1615: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb9e5e0c7  ! 1619: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e54000  ! 1621: SAVE_R	save	%r21, %r0, %r24
	.word 0xbde5e177  ! 1622: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_wr_65:
	mov	0x12, %r14
	.word 0xfef38e80  ! 1623: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0x8994a14c  ! 1629: WRPR_TICK_I	wrpr	%r18, 0x014c, %tick
	.word 0xb2bd4000  ! 1632: XNORcc_R	xnorcc 	%r21, %r0, %r25
	.word 0xb97d4400  ! 1636: MOVR_R	movre	%r21, %r0, %r28
T0_asi_reg_wr_66:
	mov	0x1a, %r14
	.word 0xf6f38e40  ! 1644: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_67:
	mov	0x4, %r14
	.word 0xfcf38e40  ! 1651: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7e44000  ! 1653: SAVE_R	save	%r17, %r0, %r27
	.word 0xbcb58000  ! 1654: SUBCcc_R	orncc 	%r22, %r0, %r30
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, 26)
	.word 0xb635607f  ! 1657: ORN_I	orn 	%r21, 0x007f, %r27
	.word 0xb1e5a0bd  ! 1658: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_146:
	setx	0x2a0201, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_76:
	mov	0x3c5, %r14
	.word 0xf0db8400  ! 1663: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_0_147:
	setx	0x2b0221, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_77:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 1668: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbc8c4000  ! 1671: ANDcc_R	andcc 	%r17, %r0, %r30
	.word 0xb4bd2140  ! 1672: XNORcc_I	xnorcc 	%r20, 0x0140, %r26
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_148:
	setx	0x2b0206, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_78:
	mov	0x33, %r14
	.word 0xf6db8e40  ! 1681: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_149:
	setx	0x2b0317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_150:
	setx	0x2a0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe520f3  ! 1692: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_wr_68:
	mov	0x31, %r14
	.word 0xf0f389e0  ! 1693: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb7e44000  ! 1694: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_rd_79:
	mov	0x30, %r14
	.word 0xfedb8e80  ! 1703: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb5e44000  ! 1704: SAVE_R	save	%r17, %r0, %r26
	.word 0xb7e58000  ! 1708: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_rd_80:
	mov	0x1, %r14
	.word 0xfadb8e40  ! 1713: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_rd_81:
	mov	0x3c6, %r14
	.word 0xf6db8e60  ! 1715: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_0_151:
	setx	0x28001d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_152:
	setx	0x2b0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e54000  ! 1720: SAVE_R	save	%r21, %r0, %r26
	.word 0xb1e40000  ! 1721: SAVE_R	save	%r16, %r0, %r24
	.word 0xb1e50000  ! 1723: SAVE_R	save	%r20, %r0, %r24
	.word 0xb9e5c000  ! 1725: SAVE_R	save	%r23, %r0, %r28
	.word 0xb7e58000  ! 1726: SAVE_R	save	%r22, %r0, %r27
	.word 0xbfe48000  ! 1730: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_153:
	setx	0x2a013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 1733: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_wr_69:
	mov	0xd, %r14
	.word 0xf4f38e80  ! 1737: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb7e56000  ! 1738: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_154:
	setx	0x290130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e095  ! 1741: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb7e56143  ! 1743: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_wr_70:
	mov	0x26, %r14
	.word 0xfef389e0  ! 1744: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T0_asi_reg_wr_71:
	mov	0x22, %r14
	.word 0xf6f384a0  ! 1747: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbde54000  ! 1748: SAVE_R	save	%r21, %r0, %r30
	.word 0xb1e4201a  ! 1750: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb68c4000  ! 1751: ANDcc_R	andcc 	%r17, %r0, %r27
	.word 0xb7e44000  ! 1754: SAVE_R	save	%r17, %r0, %r27
	.word 0xbfe4e1e6  ! 1758: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5e5c000  ! 1760: SAVE_R	save	%r23, %r0, %r26
	.word 0xbfe54000  ! 1761: SAVE_R	save	%r21, %r0, %r31
	.word 0xb3e5e1e0  ! 1764: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbfe56018  ! 1768: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe46133  ! 1773: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb534b001  ! 1776: SRLX_I	srlx	%r18, 0x0001, %r26
	.word 0xb1e54000  ! 1784: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_rd_82:
	mov	0x20, %r14
	.word 0xfadb8e60  ! 1785: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_155:
	setx	0x2a0115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_156:
	setx	0x29032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5201d  ! 1795: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbfe5c000  ! 1797: SAVE_R	save	%r23, %r0, %r31
	.word 0xb7e5a010  ! 1804: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_rd_83:
	mov	0xd, %r14
	.word 0xf0db8e40  ! 1806: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9e50000  ! 1809: SAVE_R	save	%r20, %r0, %r28
	.word 0xb7e46110  ! 1811: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe4e039  ! 1812: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1e5a124  ! 1813: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 1f)
cpu_intr_0_157:
	setx	0x2a0228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88de09f  ! 1819: ANDcc_I	andcc 	%r23, 0x009f, %r28
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbbe4e0e7  ! 1822: SAVE_I	save	%r19, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_84:
	mov	0x1, %r14
	.word 0xf0db84a0  ! 1831: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_0_158:
	setx	0x2d0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe420ff  ! 1838: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_159:
	setx	0x2f031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, d)
	.word 0xb52df001  ! 1842: SLLX_I	sllx	%r23, 0x0001, %r26
cpu_intr_0_160:
	setx	0x2c0207, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_85:
	mov	0xf, %r14
	.word 0xfcdb8e80  ! 1850: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb935a001  ! 1851: SRL_I	srl 	%r22, 0x0001, %r28
cpu_intr_0_161:
	setx	0x2f0123, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_162:
	setx	0x2e0313, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_86:
	mov	0x3c8, %r14
	.word 0xf4db8e80  ! 1860: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbbe421e5  ! 1863: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_rd_87:
	mov	0x4, %r14
	.word 0xfcdb8e40  ! 1866: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_163:
	setx	0x2e012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4c000  ! 1868: SAVE_R	save	%r19, %r0, %r29
	.word 0xb7e521bd  ! 1869: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbbe5a196  ! 1870: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e5c000  ! 1871: SAVE_R	save	%r23, %r0, %r26
	.word 0xb7e40000  ! 1874: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_wr_72:
	mov	0x3c5, %r14
	.word 0xfef389e0  ! 1875: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T0_asi_reg_wr_73:
	mov	0x10, %r14
	.word 0xf2f384a0  ! 1878: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_0_164:
	setx	0x2f022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_rd_88:
	mov	0x35, %r14
	.word 0xf6db8e40  ! 1883: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_165:
	setx	0x2f022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_74:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 1887: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_166:
	setx	0x2e003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5606b  ! 1890: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e4208e  ! 1891: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3643801  ! 1892: MOVcc_I	<illegal instruction>
cpu_intr_0_167:
	setx	0x2f033b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 38)
	.word 0xb5e4612b  ! 1902: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_rd_89:
	mov	0x19, %r14
	.word 0xf6db84a0  ! 1911: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb9e4e080  ! 1913: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb6452075  ! 1914: ADDC_I	addc 	%r20, 0x0075, %r27
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb1e5a0c7  ! 1917: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e44000  ! 1918: SAVE_R	save	%r17, %r0, %r25
	.word 0xb6c44000  ! 1919: ADDCcc_R	addccc 	%r17, %r0, %r27
	.word 0xb5e44000  ! 1920: SAVE_R	save	%r17, %r0, %r26
	.word 0xb3e4e1c4  ! 1922: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 22)
cpu_intr_0_168:
	setx	0x2e0009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 1927: RDPR_TL	<illegal instruction>
	.word 0xbbe5c000  ! 1928: SAVE_R	save	%r23, %r0, %r29
	.word 0xbfe48000  ! 1929: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_169:
	setx	0x2d010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7340000  ! 1934: SRL_R	srl 	%r16, %r0, %r27
	.word 0xbfe44000  ! 1935: SAVE_R	save	%r17, %r0, %r31
	.word 0xbfe5604f  ! 1938: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 8)
	.word 0xb9e54000  ! 1946: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_170:
	setx	0x2e0333, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_171:
	setx	0x2f023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_172:
	setx	0x2d0211, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_wr_75:
	mov	0x3c6, %r14
	.word 0xf2f389e0  ! 1951: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb9e5c000  ! 1953: SAVE_R	save	%r23, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e48000  ! 1955: SAVE_R	save	%r18, %r0, %r24
	.word 0xb3e5c000  ! 1956: SAVE_R	save	%r23, %r0, %r25
	.word 0xb5e42187  ! 1960: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 28)
	.word 0xb7e4e171  ! 1966: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe44000  ! 1968: SAVE_R	save	%r17, %r0, %r31
	.word 0xbbe520cd  ! 1970: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_173:
	setx	0x2f003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 1975: SAVE_R	save	%r19, %r0, %r31
	.word 0xb0c44000  ! 1978: ADDCcc_R	addccc 	%r17, %r0, %r24
cpu_intr_0_174:
	setx	0x2e0001, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_90:
	mov	0x1a, %r14
	.word 0xfedb8e80  ! 1981: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T0_asi_reg_wr_76:
	mov	0x3c1, %r14
	.word 0xfef389e0  ! 1982: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, 7)
	.word 0xb3e5e1c8  ! 1987: SAVE_I	save	%r23, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_91:
	mov	0x2, %r14
	.word 0xfcdb8e60  ! 1991: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T0_asi_reg_rd_92:
	mov	0x2b, %r14
	.word 0xfedb89e0  ! 1993: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbbe48000  ! 1994: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_wr_77:
	mov	0x24, %r14
	.word 0xf6f38e40  ! 1995: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, e)
	.word 0xb9e5c000  ! 1999: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_rd_93:
	mov	0x3c3, %r14
	.word 0xf2db8e80  ! 2001: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 33)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb2b5c000  ! 2010: SUBCcc_R	orncc 	%r23, %r0, %r25
	.word 0xbca44000  ! 2011: SUBcc_R	subcc 	%r17, %r0, %r30
T0_asi_reg_wr_78:
	mov	0x20, %r14
	.word 0xf0f38e80  ! 2012: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbde54000  ! 2019: SAVE_R	save	%r21, %r0, %r30
	.word 0xbde5c000  ! 2023: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_175:
	setx	0x2f0331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_176:
	setx	0x2c0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba356018  ! 2029: SUBC_I	orn 	%r21, 0x0018, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe52069  ! 2031: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_wr_79:
	mov	0x3c3, %r14
	.word 0xf8f384a0  ! 2033: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb3e44000  ! 2036: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_177:
	setx	0x2c0223, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_80:
	mov	0x3c4, %r14
	.word 0xfaf38e80  ! 2039: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbe52108  ! 2046: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_178:
	setx	0x2e032c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 24)
	.word 0xb3e4204b  ! 2050: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_rd_94:
	mov	0x3c2, %r14
	.word 0xf0db84a0  ! 2052: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbde5c000  ! 2053: SAVE_R	save	%r23, %r0, %r30
	.word 0xb5e42136  ! 2054: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbe144000  ! 2055: OR_R	or 	%r17, %r0, %r31
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 1e)
cpu_intr_0_179:
	setx	0x2e0109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_rd_95:
	mov	0x5, %r14
	.word 0xf6db8400  ! 2061: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 3)
	.word 0xb6a40000  ! 2065: SUBcc_R	subcc 	%r16, %r0, %r27
T0_asi_reg_wr_81:
	mov	0x3c3, %r14
	.word 0xfef384a0  ! 2069: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbfe54000  ! 2071: SAVE_R	save	%r21, %r0, %r31
	.word 0xb1e4617f  ! 2076: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde5e0d8  ! 2079: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e5e1d6  ! 2083: SAVE_I	save	%r23, 0x0001, %r27
cpu_intr_0_180:
	setx	0x2d011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_96:
	mov	0x3c0, %r14
	.word 0xf0db8400  ! 2087: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T0_asi_reg_rd_97:
	mov	0x3c1, %r14
	.word 0xf6db8e60  ! 2088: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb5e4a11e  ! 2091: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe5e057  ! 2097: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e40000  ! 2099: SAVE_R	save	%r16, %r0, %r24
	.word 0xbde460fd  ! 2100: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e44000  ! 2103: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_181:
	setx	0x2f001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a48000  ! 2106: SUBcc_R	subcc 	%r18, %r0, %r26
T0_asi_reg_wr_82:
	mov	0x3c3, %r14
	.word 0xfef389e0  ! 2108: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T0_asi_reg_rd_98:
	mov	0xc, %r14
	.word 0xfcdb89e0  ! 2109: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbde4a1a2  ! 2110: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_rd_99:
	mov	0x3c6, %r14
	.word 0xf6db8400  ! 2111: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_100:
	mov	0x1, %r14
	.word 0xfcdb8e40  ! 2114: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_wr_83:
	mov	0x22, %r14
	.word 0xfaf38e40  ! 2115: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb6c460b9  ! 2118: ADDCcc_I	addccc 	%r17, 0x00b9, %r27
	.word 0xb7e5a04f  ! 2120: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_182:
	setx	0x2f0337, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_101:
	mov	0x2d, %r14
	.word 0xfcdb84a0  ! 2124: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbbe4206b  ! 2125: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb43d60e9  ! 2126: XNOR_I	xnor 	%r21, 0x00e9, %r26
	.word 0xbbe40000  ! 2128: SAVE_R	save	%r16, %r0, %r29
	.word 0xb9e4c000  ! 2135: SAVE_R	save	%r19, %r0, %r28
	.word 0xbbe460c2  ! 2136: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_183:
	setx	0x2f0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 2139: SAVE_R	save	%r21, %r0, %r27
	.word 0xb1e4c000  ! 2140: SAVE_R	save	%r19, %r0, %r24
	.word 0xb2c4607e  ! 2141: ADDCcc_I	addccc 	%r17, 0x007e, %r25
	.word 0xb7e58000  ! 2142: SAVE_R	save	%r22, %r0, %r27
	.word 0xb3e4c000  ! 2143: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_184:
	setx	0x2e013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a1e0  ! 2145: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, d)
	.word 0xbbe4c000  ! 2151: SAVE_R	save	%r19, %r0, %r29
	.word 0xba2ce0f5  ! 2153: ANDN_I	andn 	%r19, 0x00f5, %r29
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 38)
	.word 0xb3e4600d  ! 2157: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbebd4000  ! 2161: XNORcc_R	xnorcc 	%r21, %r0, %r31
	.word 0xb7e48000  ! 2164: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb5e48000  ! 2168: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbbe421bc  ! 2170: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_wr_84:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 2172: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbd3c5000  ! 2173: SRAX_R	srax	%r17, %r0, %r30
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_wr_85:
	mov	0x3c4, %r14
	.word 0xf0f38e80  ! 2177: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T0_asi_reg_wr_86:
	mov	0x1f, %r14
	.word 0xf8f38e80  ! 2179: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbde560f9  ! 2183: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_wr_87:
	mov	0x20, %r14
	.word 0xf2f38e60  ! 2184: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb1e4c000  ! 2185: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_185:
	setx	0x2c0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bc612c  ! 2187: XNORcc_I	xnorcc 	%r17, 0x012c, %r25
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_186:
	setx	0x2f011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 2197: SAVE_R	save	%r20, %r0, %r28
	.word 0xb7e58000  ! 2198: SAVE_R	save	%r22, %r0, %r27
	.word 0xb6954000  ! 2199: ORcc_R	orcc 	%r21, %r0, %r27
	.word 0xb1e50000  ! 2200: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_187:
	setx	0x2f030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_188:
	setx	0x2c0301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_189:
	setx	0x2f0339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 2208: SAVE_R	save	%r22, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 4)
	.word 0xb0452122  ! 2213: ADDC_I	addc 	%r20, 0x0122, %r24
	.word 0xb4854000  ! 2216: ADDcc_R	addcc 	%r21, %r0, %r26
	.word 0xbfe48000  ! 2218: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_rd_102:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 2224: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_wr_88:
	mov	0xe, %r14
	.word 0xf0f38400  ! 2226: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_0_190:
	setx	0x2f0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c5a0af  ! 2228: ADDCcc_I	addccc 	%r22, 0x00af, %r25
T0_asi_reg_wr_89:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 2230: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, a)
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_103:
	mov	0x2a, %r14
	.word 0xf4db8e60  ! 2233: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_0_191:
	setx	0x2f0328, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_104:
	mov	0x29, %r14
	.word 0xfcdb8e40  ! 2237: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_rd_105:
	mov	0x12, %r14
	.word 0xfcdb8e40  ! 2238: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xba956001  ! 2239: ORcc_I	orcc 	%r21, 0x0001, %r29
	.word 0xbde54000  ! 2243: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_192:
	setx	0x2c0037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_wr_90:
	mov	0x36, %r14
	.word 0xf2f389e0  ! 2251: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb9e5e047  ! 2252: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_rd_106:
	mov	0x3c6, %r14
	.word 0xfedb8e60  ! 2254: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_193:
	setx	0x2c0113, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_194:
	setx	0x2d0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 2263: RDPR_TL	<illegal instruction>
T0_asi_reg_rd_107:
	mov	0x17, %r14
	.word 0xfcdb8e60  ! 2264: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb9e44000  ! 2265: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, 1f)
cpu_intr_0_195:
	setx	0x2c021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 2273: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_196:
	setx	0x2e0218, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 1d)
T0_asi_reg_rd_108:
	mov	0x3c3, %r14
	.word 0xfcdb89e0  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T0_asi_reg_wr_91:
	mov	0x23, %r14
	.word 0xf2f389e0  ! 2293: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbbe4c000  ! 2294: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_197:
	setx	0x300216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6a561e6  ! 2300: SUBcc_I	subcc 	%r21, 0x01e6, %r27
T0_asi_reg_rd_109:
	mov	0x5, %r14
	.word 0xfcdb8e80  ! 2303: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_rd_110:
	mov	0x3c4, %r14
	.word 0xf0db8400  ! 2305: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_0_198:
	setx	0x32002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_111:
	mov	0x34, %r14
	.word 0xf8db89e0  ! 2314: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbde54000  ! 2315: SAVE_R	save	%r21, %r0, %r30
	.word 0xbde4606d  ! 2316: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_199:
	setx	0x31020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_92:
	mov	0x19, %r14
	.word 0xf4f38400  ! 2320: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbde4a06f  ! 2322: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe50000  ! 2323: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_wr_93:
	mov	0x1, %r14
	.word 0xf0f38400  ! 2324: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 23)
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_200:
	setx	0x300320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b44000  ! 2331: SUBCcc_R	orncc 	%r17, %r0, %r24
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, 34)
	.word 0xb1e5a06d  ! 2335: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e4e00e  ! 2338: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e42014  ! 2339: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe58000  ! 2341: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 16)
	.word 0xba25e0ad  ! 2345: SUB_I	sub 	%r23, 0x00ad, %r29
cpu_intr_0_201:
	setx	0x32010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_94:
	mov	0x3c4, %r14
	.word 0xf6f389e0  ! 2347: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, a)
	.word 0xb7e40000  ! 2357: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_wr_95:
	mov	0xc, %r14
	.word 0xf0f38e80  ! 2361: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb7e4c000  ! 2362: SAVE_R	save	%r19, %r0, %r27
	.word 0xbbe5600b  ! 2363: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_rd_112:
	mov	0x2, %r14
	.word 0xfadb8e40  ! 2364: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_96:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 2366: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_0_202:
	setx	0x330001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 26)
	.word 0xb1e40000  ! 2371: SAVE_R	save	%r16, %r0, %r24
	.word 0xbbe4e13f  ! 2373: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb3e4a14e  ! 2380: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_203:
	setx	0x300214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 2390: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb1e5a110  ! 2393: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_wr_97:
	mov	0x3c7, %r14
	.word 0xfcf384a0  ! 2394: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T0_asi_reg_wr_98:
	mov	0x1a, %r14
	.word 0xf0f38400  ! 2395: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_wr_99:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 2399: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_204:
	setx	0x31013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_rd_113:
	mov	0x14, %r14
	.word 0xf6db84a0  ! 2407: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T0_asi_reg_rd_114:
	mov	0x27, %r14
	.word 0xfedb8e40  ! 2408: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_rd_115:
	mov	0x0, %r14
	.word 0xf0db89e0  ! 2412: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb9e4a0ae  ! 2414: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_116:
	mov	0x3c0, %r14
	.word 0xfedb8400  ! 2415: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T0_asi_reg_wr_100:
	mov	0x35, %r14
	.word 0xf8f38400  ! 2416: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_rd_117:
	mov	0x3c5, %r14
	.word 0xf8db84a0  ! 2420: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb9e4e077  ! 2421: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde46051  ! 2422: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_rd_118:
	mov	0x3c7, %r14
	.word 0xf2db84a0  ! 2423: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_205:
	setx	0x310335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33ca001  ! 2433: SRA_I	sra 	%r18, 0x0001, %r25
	.word 0xb68c4000  ! 2434: ANDcc_R	andcc 	%r17, %r0, %r27
	.word 0xb7e5a117  ! 2438: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe48000  ! 2439: SAVE_R	save	%r18, %r0, %r29
	.word 0xb9e5e1aa  ! 2441: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_wr_101:
	mov	0x14, %r14
	.word 0xf0f38e80  ! 2442: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb72da001  ! 2443: SLL_I	sll 	%r22, 0x0001, %r27
cpu_intr_0_206:
	setx	0x310023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a1ee  ! 2445: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e52188  ! 2447: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_207:
	setx	0x32032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 2456: RDPR_GL	<illegal instruction>
cpu_intr_0_208:
	setx	0x310110, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_102:
	mov	0x8, %r14
	.word 0xf0f38e80  ! 2462: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_0_209:
	setx	0x30013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3cc000  ! 2467: SRA_R	sra 	%r19, %r0, %r31
	.word 0xbbe48000  ! 2468: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, e)
	.word 0xb83d211a  ! 2472: XNOR_I	xnor 	%r20, 0x011a, %r28
T0_asi_reg_wr_103:
	mov	0x3c2, %r14
	.word 0xf6f38e80  ! 2473: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb815c000  ! 2476: OR_R	or 	%r23, %r0, %r28
	.word 0xbde421f9  ! 2478: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_210:
	setx	0x33033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e520bf  ! 2480: SAVE_I	save	%r20, 0x0001, %r25
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, 11)
	.word 0xb32c9000  ! 2488: SLLX_R	sllx	%r18, %r0, %r25
	.word 0xb9e42016  ! 2492: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7e5e034  ! 2493: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e54000  ! 2498: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_211:
	setx	0x30002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_212:
	setx	0x310137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 21)
	.word 0xbc0dc000  ! 2512: AND_R	and 	%r23, %r0, %r30
	.word 0xbfe5c000  ! 2513: SAVE_R	save	%r23, %r0, %r31
	.word 0xbb34e001  ! 2516: SRL_I	srl 	%r19, 0x0001, %r29
cpu_intr_0_213:
	setx	0x31023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 2519: SAVE_R	save	%r21, %r0, %r30
	.word 0xb3e48000  ! 2520: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_rd_119:
	mov	0x3c8, %r14
	.word 0xf8db89e0  ! 2521: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb3e58000  ! 2522: SAVE_R	save	%r22, %r0, %r25
	.word 0xb5e40000  ! 2524: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_wr_104:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 2527: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 34)
	.word 0xb3e5e146  ! 2531: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9e5e0c5  ! 2535: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_wr_105:
	mov	0x37, %r14
	.word 0xfcf38400  ! 2537: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb0b54000  ! 2538: SUBCcc_R	orncc 	%r21, %r0, %r24
	.word 0xbbe4a17d  ! 2542: SAVE_I	save	%r18, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_214:
	setx	0x31030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_120:
	mov	0x3c4, %r14
	.word 0xf2db84a0  ! 2549: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T0_asi_reg_rd_121:
	mov	0x20, %r14
	.word 0xfedb8e40  ! 2550: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_106:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 2552: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbbe5e0f3  ! 2553: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_wr_107:
	mov	0x14, %r14
	.word 0xfcf38400  ! 2556: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb9e5e088  ! 2559: SAVE_I	save	%r23, 0x0001, %r28
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 11)
	.word 0xbfe56115  ! 2565: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_rd_122:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 2576: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb5e5e0ce  ! 2578: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe5219d  ! 2579: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde48000  ! 2584: SAVE_R	save	%r18, %r0, %r30
	.word 0xb3e54000  ! 2585: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_wr_108:
	mov	0x17, %r14
	.word 0xf8f38400  ! 2588: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb5e58000  ! 2601: SAVE_R	save	%r22, %r0, %r26
	.word 0xbde4c000  ! 2602: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_215:
	setx	0x31023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e561bd  ! 2606: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 21)
	.word 0xb7e521d4  ! 2611: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_216:
	setx	0x330339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_217:
	setx	0x330317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_218:
	setx	0x33021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_109:
	mov	0x2e, %r14
	.word 0xfaf38e40  ! 2618: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb9e44000  ! 2619: SAVE_R	save	%r17, %r0, %r28
	.word 0xb5e5a0ce  ! 2620: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e40000  ! 2622: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_wr_110:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 2623: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbbe48000  ! 2625: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, 36)
	.word 0xba046152  ! 2638: ADD_I	add 	%r17, 0x0152, %r29
cpu_intr_0_219:
	setx	0x32021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e0a7  ! 2647: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_220:
	setx	0x310200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87952106  ! 2651: WRPR_TT_I	wrpr	%r20, 0x0106, %tt
T0_asi_reg_rd_123:
	mov	0xd, %r14
	.word 0xf8db8e40  ! 2652: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 8)
	.word 0xb9e54000  ! 2654: SAVE_R	save	%r21, %r0, %r28
	.word 0xbbe4a0ea  ! 2655: SAVE_I	save	%r18, 0x0001, %r29
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_221:
	setx	0x31031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5215c  ! 2666: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_222:
	setx	0x320301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 2674: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_223:
	setx	0x32002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e0e3  ! 2680: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e4e1d8  ! 2682: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e5618e  ! 2684: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 5)
	.word 0xb1e54000  ! 2688: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_wr_111:
	mov	0x8, %r14
	.word 0xf0f389e0  ! 2690: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb4b5c000  ! 2691: ORNcc_R	orncc 	%r23, %r0, %r26
T0_asi_reg_rd_124:
	mov	0x3, %r14
	.word 0xf0db8e40  ! 2692: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_224:
	setx	0x310028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5209e  ! 2694: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_wr_112:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 2697: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_225:
	setx	0x330020, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_125:
	mov	0x1a, %r14
	.word 0xf0db8e40  ! 2704: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb92c7001  ! 2706: SLLX_I	sllx	%r17, 0x0001, %r28
cpu_intr_0_226:
	setx	0x30010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, b)
	.word 0xb3e4a028  ! 2714: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_227:
	setx	0x320337, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_113:
	mov	0x13, %r14
	.word 0xf6f38e80  ! 2718: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbbe4c000  ! 2721: SAVE_R	save	%r19, %r0, %r29
	.word 0xb035c000  ! 2722: SUBC_R	orn 	%r23, %r0, %r24
	.word 0xb9480000  ! 2727: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
T0_asi_reg_wr_114:
	mov	0x25, %r14
	.word 0xf4f38e40  ! 2730: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbbe4c000  ! 2731: SAVE_R	save	%r19, %r0, %r29
	.word 0xb8bda11a  ! 2736: XNORcc_I	xnorcc 	%r22, 0x011a, %r28
cpu_intr_0_228:
	setx	0x320139, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_115:
	mov	0x3c3, %r14
	.word 0xf6f38e60  ! 2738: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_0_229:
	setx	0x35021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_230:
	setx	0x37012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 2745: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_rd_126:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 2746: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_231:
	setx	0x350325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe521d5  ! 2752: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_232:
	setx	0x35013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_233:
	setx	0x370106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbbe58000  ! 2760: SAVE_R	save	%r22, %r0, %r29
	.word 0xb9e44000  ! 2761: SAVE_R	save	%r17, %r0, %r28
	.word 0xbbe40000  ! 2762: SAVE_R	save	%r16, %r0, %r29
	.word 0xbbe5a1ce  ! 2767: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_234:
	setx	0x370116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, 21)
	.word 0xb1e520dd  ! 2772: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_235:
	setx	0x360103, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_127:
	mov	0x5, %r14
	.word 0xf6db89e0  ! 2777: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xba940000  ! 2778: ORcc_R	orcc 	%r16, %r0, %r29
cpu_intr_0_236:
	setx	0x360139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde56004  ! 2782: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_wr_116:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 2783: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xba9d0000  ! 2789: XORcc_R	xorcc 	%r20, %r0, %r29
T0_asi_reg_wr_117:
	mov	0x2, %r14
	.word 0xf6f38e80  ! 2792: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, f)
	.word 0xbbe4a041  ! 2796: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe4a1f5  ! 2797: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_118:
	mov	0xa, %r14
	.word 0xf0f38e60  ! 2798: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb095c000  ! 2799: ORcc_R	orcc 	%r23, %r0, %r24
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_rd_128:
	mov	0x22, %r14
	.word 0xf2db8e60  ! 2807: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb1e420f7  ! 2809: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e4e062  ! 2811: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb2048000  ! 2812: ADD_R	add 	%r18, %r0, %r25
	.word 0xbe85604c  ! 2818: ADDcc_I	addcc 	%r21, 0x004c, %r31
T0_asi_reg_wr_119:
	mov	0x31, %r14
	.word 0xfcf389e0  ! 2819: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_0_237:
	setx	0x35001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e0b2  ! 2825: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_238:
	setx	0x370333, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_129:
	mov	0x2c, %r14
	.word 0xf6db89e0  ! 2830: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb2c4a100  ! 2839: ADDCcc_I	addccc 	%r18, 0x0100, %r25
	.word 0xb3e4c000  ! 2842: SAVE_R	save	%r19, %r0, %r25
	.word 0xbbe5a13a  ! 2843: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 13)
	.word 0xb61c218a  ! 2847: XOR_I	xor 	%r16, 0x018a, %r27
T0_asi_reg_wr_120:
	mov	0xb, %r14
	.word 0xf6f384a0  ! 2851: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbfe50000  ! 2853: SAVE_R	save	%r20, %r0, %r31
	.word 0xb7e52033  ! 2855: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe48000  ! 2856: SAVE_R	save	%r18, %r0, %r31
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_239:
	setx	0x360335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 2862: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_wr_121:
	mov	0x21, %r14
	.word 0xf0f38e80  ! 2864: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbde5a069  ! 2865: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 12)
	.word 0xbde44000  ! 2872: SAVE_R	save	%r17, %r0, %r30
	.word 0xb7347001  ! 2874: SRLX_I	srlx	%r17, 0x0001, %r27
cpu_intr_0_240:
	setx	0x360306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e1c2  ! 2879: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e58000  ! 2880: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_rd_130:
	mov	0x1f, %r14
	.word 0xf0db8e60  ! 2883: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_0_241:
	setx	0x340239, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_131:
	mov	0x1a, %r14
	.word 0xf6db8e80  ! 2885: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T0_asi_reg_wr_122:
	mov	0x1f, %r14
	.word 0xf0f384a0  ! 2886: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbec4c000  ! 2887: ADDCcc_R	addccc 	%r19, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e44000  ! 2889: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_132:
	mov	0x3c4, %r14
	.word 0xfcdb8e60  ! 2891: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 35)
	.word 0xbfe56196  ! 2894: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e4c000  ! 2895: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_242:
	setx	0x37031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4203f  ! 2897: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_rd_133:
	mov	0x17, %r14
	.word 0xfcdb8e80  ! 2898: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_wr_123:
	mov	0xa, %r14
	.word 0xfef384a0  ! 2901: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb5e44000  ! 2904: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_243:
	setx	0x340036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbde40000  ! 2915: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_rd_134:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 2917: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb9e44000  ! 2918: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, 16)
T0_asi_reg_rd_135:
	mov	0x3c5, %r14
	.word 0xfadb8e60  ! 2921: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_244:
	setx	0x340202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_245:
	setx	0x370008, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_124:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 2926: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7e5a1cf  ! 2928: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 33)
	.word 0xb5357001  ! 2932: SRLX_I	srlx	%r21, 0x0001, %r26
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_rd_136:
	mov	0x38, %r14
	.word 0xf6db8e40  ! 2938: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfe42009  ! 2940: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e5c000  ! 2946: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_246:
	setx	0x360018, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_137:
	mov	0x15, %r14
	.word 0xfadb8e80  ! 2949: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb7e460fc  ! 2951: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_247:
	setx	0x340227, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb3e421cd  ! 2962: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e58000  ! 2963: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_248:
	setx	0x360311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_249:
	setx	0x370002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_wr_125:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 2981: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_rd_138:
	mov	0x31, %r14
	.word 0xf2db8e80  ! 2983: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb1e58000  ! 2985: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 26)
	.word 0xb9e5a10e  ! 2988: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_250:
	setx	0x34002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e520a4  ! 2991: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbbe48000  ! 2993: SAVE_R	save	%r18, %r0, %r29
	.word 0xb1e5a013  ! 2997: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 17)
	.word 0xbde58000  ! 3001: SAVE_R	save	%r22, %r0, %r30
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_rd_139:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 3004: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbde5a04b  ! 3010: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_wr_126:
	mov	0x29, %r14
	.word 0xf2f384a0  ! 3015: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbbe54000  ! 3016: SAVE_R	save	%r21, %r0, %r29
cpu_intr_0_251:
	setx	0x370216, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_140:
	mov	0x38, %r14
	.word 0xf8db8e40  ! 3019: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_252:
	setx	0x370326, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 28)
	.word 0xb1e40000  ! 3027: SAVE_R	save	%r16, %r0, %r24
	.word 0xb3e50000  ! 3029: SAVE_R	save	%r20, %r0, %r25
	.word 0xb3e4608a  ! 3031: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_253:
	setx	0x34012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a050  ! 3033: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_wr_127:
	mov	0x24, %r14
	.word 0xf0f38e80  ! 3039: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_254:
	setx	0x340217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 3043: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_rd_141:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 3044: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_wr_128:
	mov	0x1e, %r14
	.word 0xfef38e40  ! 3045: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_255:
	setx	0x35030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_256:
	setx	0x360031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a0fa  ! 3053: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_257:
	setx	0x340232, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 3f)
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, f)
cpu_intr_0_258:
	setx	0x360310, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_129:
	mov	0x1c, %r14
	.word 0xf2f389e0  ! 3063: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbbe5a03b  ! 3065: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 33)
	.word 0xbde44000  ! 3067: SAVE_R	save	%r17, %r0, %r30
	.word 0xb5e4a085  ! 3069: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_wr_130:
	mov	0x25, %r14
	.word 0xf8f38e80  ! 3072: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e54000  ! 3076: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_142:
	mov	0x22, %r14
	.word 0xf6db8e40  ! 3078: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb5e54000  ! 3079: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_rd_143:
	mov	0x16, %r14
	.word 0xfedb84a0  ! 3080: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T0_asi_reg_rd_144:
	mov	0x3c4, %r14
	.word 0xf8db84a0  ! 3082: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbc358000  ! 3083: ORN_R	orn 	%r22, %r0, %r30
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, 30)
	.word 0xb3e560e3  ! 3091: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb8148000  ! 3097: OR_R	or 	%r18, %r0, %r28
	.word 0xb6348000  ! 3098: ORN_R	orn 	%r18, %r0, %r27
T0_asi_reg_rd_145:
	mov	0x25, %r14
	.word 0xf6db8400  ! 3102: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb3e58000  ! 3103: SAVE_R	save	%r22, %r0, %r25
	.word 0xb485a0b9  ! 3105: ADDcc_I	addcc 	%r22, 0x00b9, %r26
	.word 0xb4ac60e2  ! 3107: ANDNcc_I	andncc 	%r17, 0x00e2, %r26
	.word 0xbfe4c000  ! 3108: SAVE_R	save	%r19, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_259:
	setx	0x34033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e0f9  ! 3113: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb8854000  ! 3114: ADDcc_R	addcc 	%r21, %r0, %r28
	.word 0xb9e42146  ! 3115: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb9e44000  ! 3118: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_rd_146:
	mov	0x3c6, %r14
	.word 0xfedb8e60  ! 3119: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T0_asi_reg_wr_131:
	mov	0x3c4, %r14
	.word 0xfcf389e0  ! 3120: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb5e52090  ! 3122: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_260:
	setx	0x350012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_261:
	setx	0x340202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 3133: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_262:
	setx	0x37001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 3138: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_wr_132:
	mov	0x3c4, %r14
	.word 0xf0f38e80  ! 3139: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb9e56074  ! 3142: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 11)
	.word 0xb1e5c000  ! 3144: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_263:
	setx	0x36000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_133:
	mov	0x36, %r14
	.word 0xfef384a0  ! 3150: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T0_asi_reg_rd_147:
	mov	0x1d, %r14
	.word 0xfcdb8e60  ! 3152: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T0_asi_reg_wr_134:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 3153: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5e4602b  ! 3154: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde5a120  ! 3156: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e5208f  ! 3157: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb4240000  ! 3159: SUB_R	sub 	%r16, %r0, %r26
	.word 0xbde4e1bd  ! 3160: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe420c4  ! 3163: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_wr_135:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 3164: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb7e48000  ! 3167: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 19)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e5601e  ! 3180: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e5c000  ! 3181: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_264:
	setx	0x370302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_265:
	setx	0x360039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 3192: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_266:
	setx	0x37001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 3198: SAVE_R	save	%r20, %r0, %r29
	.word 0xbfe4a0f1  ! 3200: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_rd_148:
	mov	0x1a, %r14
	.word 0xf8db89e0  ! 3205: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb7e4614d  ! 3207: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe48000  ! 3210: SAVE_R	save	%r18, %r0, %r29
	.word 0xb3e5a1d6  ! 3214: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_wr_136:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 3216: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb3e521be  ! 3219: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb095e1c2  ! 3221: ORcc_I	orcc 	%r23, 0x01c2, %r24
	.word 0xbbe4616c  ! 3223: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe4c000  ! 3225: SAVE_R	save	%r19, %r0, %r31
	.word 0xa1902000  ! 3227: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xbde4e068  ! 3228: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_wr_137:
	mov	0x21, %r14
	.word 0xf6f384a0  ! 3229: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_0_267:
	setx	0x3b0311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_268:
	setx	0x380221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e138  ! 3237: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3e4e0aa  ! 3238: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_269:
	setx	0x380018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe460cb  ! 3248: SAVE_I	save	%r17, 0x0001, %r31
cpu_intr_0_270:
	setx	0x38002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_138:
	mov	0x3c2, %r14
	.word 0xfef384a0  ! 3250: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbaa58000  ! 3257: SUBcc_R	subcc 	%r22, %r0, %r29
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_271:
	setx	0x3a000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe354000  ! 3266: ORN_R	orn 	%r21, %r0, %r31
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_wr_139:
	mov	0x3c7, %r14
	.word 0xf4f384a0  ! 3270: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb1341000  ! 3271: SRLX_R	srlx	%r16, %r0, %r24
	.word 0xb4ac6122  ! 3272: ANDNcc_I	andncc 	%r17, 0x0122, %r26
	.word 0xbbe54000  ! 3276: SAVE_R	save	%r21, %r0, %r29
T0_asi_reg_wr_140:
	mov	0x22, %r14
	.word 0xf6f38e80  ! 3278: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbab5e079  ! 3279: ORNcc_I	orncc 	%r23, 0x0079, %r29
T0_asi_reg_wr_141:
	mov	0x1d, %r14
	.word 0xf8f38400  ! 3282: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_rd_149:
	mov	0x3c6, %r14
	.word 0xfcdb8400  ! 3283: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_0_272:
	setx	0x390309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 3288: SAVE_R	save	%r23, %r0, %r27
	.word 0x8995a026  ! 3289: WRPR_TICK_I	wrpr	%r22, 0x0026, %tick
	.word 0xbbe44000  ! 3290: SAVE_R	save	%r17, %r0, %r29
	.word 0xbde58000  ! 3291: SAVE_R	save	%r22, %r0, %r30
	.word 0xb9e5e074  ! 3293: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe58000  ! 3302: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_wr_142:
	mov	0xe, %r14
	.word 0xf8f38e60  ! 3306: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_0_273:
	setx	0x38001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_143:
	mov	0x1f, %r14
	.word 0xf4f38e60  ! 3309: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbcb5e00c  ! 3312: SUBCcc_I	orncc 	%r23, 0x000c, %r30
cpu_intr_0_274:
	setx	0x39001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_275:
	setx	0x3b0113, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_144:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 3318: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb1e461d6  ! 3322: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_276:
	setx	0x39031f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_277:
	setx	0x390320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5603c  ! 3330: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe5e1e4  ! 3333: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbde5c000  ! 3334: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_278:
	setx	0x390018, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 25)
	.word 0xb1e5e118  ! 3340: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_wr_145:
	mov	0x19, %r14
	.word 0xf2f38e60  ! 3344: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_0_279:
	setx	0x3b0206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 3348: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_rd_150:
	mov	0x3c4, %r14
	.word 0xf4db89e0  ! 3350: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_rd_151:
	mov	0x19, %r14
	.word 0xf4db84a0  ! 3353: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb1e54000  ! 3358: SAVE_R	save	%r21, %r0, %r24
	.word 0xb1e4e136  ! 3360: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde4e088  ! 3368: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, f)
cpu_intr_0_280:
	setx	0x390107, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_152:
	mov	0x20, %r14
	.word 0xf6db8400  ! 3377: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb5e54000  ! 3381: SAVE_R	save	%r21, %r0, %r26
	.word 0xbfe5c000  ! 3382: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_281:
	setx	0x3b0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_282:
	setx	0x390213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 3387: SAVE_R	save	%r20, %r0, %r28
	.word 0xb6b5c000  ! 3388: SUBCcc_R	orncc 	%r23, %r0, %r27
T0_asi_reg_wr_146:
	mov	0x2a, %r14
	.word 0xfcf384a0  ! 3390: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T0_asi_reg_rd_153:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 3394: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb3e48000  ! 3395: SAVE_R	save	%r18, %r0, %r25
	.word 0xb7e5c000  ! 3396: SAVE_R	save	%r23, %r0, %r27
	.word 0xbc9dc000  ! 3397: XORcc_R	xorcc 	%r23, %r0, %r30
	.word 0xbde520be  ! 3398: SAVE_I	save	%r20, 0x0001, %r30
cpu_intr_0_283:
	setx	0x390226, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_154:
	mov	0x21, %r14
	.word 0xfadb8e80  ! 3402: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T0_asi_reg_wr_147:
	mov	0x23, %r14
	.word 0xf6f38e40  ! 3403: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbb643801  ! 3404: MOVcc_I	<illegal instruction>
T0_asi_reg_rd_155:
	mov	0x3c6, %r14
	.word 0xf6db84a0  ! 3408: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 28)
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_wr_148:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 3412: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb485e0cb  ! 3413: ADDcc_I	addcc 	%r23, 0x00cb, %r26
	.word 0xbde5a015  ! 3415: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_rd_156:
	mov	0x3c0, %r14
	.word 0xfadb8400  ! 3418: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbfe58000  ! 3419: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_284:
	setx	0x3a0112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 5)
	.word 0xbfe50000  ! 3424: SAVE_R	save	%r20, %r0, %r31
	.word 0xb7e54000  ! 3425: SAVE_R	save	%r21, %r0, %r27
	.word 0xbcc48000  ! 3427: ADDCcc_R	addccc 	%r18, %r0, %r30
	.word 0xbfe44000  ! 3428: SAVE_R	save	%r17, %r0, %r31
	.word 0xb5e44000  ! 3430: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_285:
	setx	0x3a0213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_286:
	setx	0x38032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_287:
	setx	0x38020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe52190  ! 3437: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_288:
	setx	0x380137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_wr_149:
	mov	0x2, %r14
	.word 0xfef38400  ! 3442: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_289:
	setx	0x3b0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e1dd  ! 3446: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde4c000  ! 3448: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_150:
	mov	0x3, %r14
	.word 0xf8f384a0  ! 3452: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb3e52028  ! 3453: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb7e5200d  ! 3455: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 1d)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb5e58000  ! 3465: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_rd_157:
	mov	0x24, %r14
	.word 0xfadb8e40  ! 3467: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb7e40000  ! 3468: SAVE_R	save	%r16, %r0, %r27
	.word 0xbde5c000  ! 3470: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, 23)
	.word 0xbbe5a0d3  ! 3474: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb83c207a  ! 3477: XNOR_I	xnor 	%r16, 0x007a, %r28
cpu_intr_0_290:
	setx	0x39032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_291:
	setx	0x390014, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_151:
	mov	0xa, %r14
	.word 0xf2f384a0  ! 3487: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_0_292:
	setx	0x3a033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_293:
	setx	0x38033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeade065  ! 3499: ANDNcc_I	andncc 	%r23, 0x0065, %r31
	.word 0xb3e58000  ! 3500: SAVE_R	save	%r22, %r0, %r25
	.word 0xbde5c000  ! 3502: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_294:
	setx	0x3b0116, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_158:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 3505: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_295:
	setx	0x390113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 3507: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_296:
	setx	0x390206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba45619a  ! 3509: ADDC_I	addc 	%r21, 0x019a, %r29
	.word 0xbbe4a06e  ! 3515: SAVE_I	save	%r18, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbd643801  ! 3517: MOVcc_I	<illegal instruction>
	.word 0xb1e48000  ! 3519: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_297:
	setx	0x3a000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 3526: SAVE_R	save	%r23, %r0, %r24
	.word 0xbde54000  ! 3527: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 8)
	.word 0xb7e560e8  ! 3532: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_rd_159:
	mov	0xf, %r14
	.word 0xfcdb84a0  ! 3535: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb7e5e02e  ! 3539: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e5a098  ! 3540: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_298:
	setx	0x390039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e083  ! 3546: SAVE_I	save	%r23, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_299:
	setx	0x3b0108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 14)
	.word 0xbde58000  ! 3556: SAVE_R	save	%r22, %r0, %r30
	.word 0xbbe54000  ! 3557: SAVE_R	save	%r21, %r0, %r29
cpu_intr_0_300:
	setx	0x390028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e00c  ! 3562: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbde48000  ! 3564: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_rd_160:
	mov	0x23, %r14
	.word 0xfedb8e80  ! 3567: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb9e4c000  ! 3569: SAVE_R	save	%r19, %r0, %r28
	.word 0xb1e56040  ! 3574: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb9357001  ! 3579: SRLX_I	srlx	%r21, 0x0001, %r28
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 6)
	.word 0xbde5c000  ! 3582: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_wr_152:
	mov	0x1b, %r14
	.word 0xfaf38400  ! 3586: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 33)
	.word 0xbfe42183  ! 3593: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_rd_161:
	mov	0x38, %r14
	.word 0xf6db84a0  ! 3601: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T0_asi_reg_rd_162:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 3602: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3e54000  ! 3604: SAVE_R	save	%r21, %r0, %r25
	.word 0xb7e44000  ! 3607: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_301:
	setx	0x390137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3520bf  ! 3614: SUBC_I	orn 	%r20, 0x00bf, %r29
	.word 0xbb2d6001  ! 3615: SLL_I	sll 	%r21, 0x0001, %r29
T0_asi_reg_wr_153:
	mov	0x26, %r14
	.word 0xf8f38e60  ! 3617: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 2b)
	.word 0xbbe50000  ! 3622: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_wr_154:
	mov	0x2d, %r14
	.word 0xfaf38e80  ! 3623: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb1e5e016  ! 3625: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_302:
	setx	0x3b012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_303:
	setx	0x39010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1de129  ! 3630: XOR_I	xor 	%r23, 0x0129, %r30
T0_asi_reg_rd_163:
	mov	0xd, %r14
	.word 0xf6db8e80  ! 3632: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T0_asi_reg_wr_155:
	mov	0x18, %r14
	.word 0xf4f389e0  ! 3634: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T0_asi_reg_rd_164:
	mov	0x3c4, %r14
	.word 0xf2db8400  ! 3636: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, 25)
	.word 0xb3352001  ! 3641: SRL_I	srl 	%r20, 0x0001, %r25
	.word 0xbfe5e040  ! 3642: SAVE_I	save	%r23, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb8948000  ! 3645: ORcc_R	orcc 	%r18, %r0, %r28
T0_asi_reg_wr_156:
	mov	0x3c5, %r14
	.word 0xfef389e0  ! 3646: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb3e4e1a7  ! 3647: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, d)
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 37)
	.word 0xbbe54000  ! 3653: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_rd_165:
	mov	0x2a, %r14
	.word 0xfedb8e80  ! 3657: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 16)
	.word 0xb1e44000  ! 3666: SAVE_R	save	%r17, %r0, %r24
	.word 0xbfe4a19e  ! 3670: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe58000  ! 3672: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 33)
	.word 0xb3e4a168  ! 3676: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_304:
	setx	0x3c0202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 14)
	.word 0xb1e50000  ! 3683: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_wr_157:
	mov	0x3c0, %r14
	.word 0xfef38e60  ! 3684: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_0_305:
	setx	0x3e0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc350000  ! 3687: ORN_R	orn 	%r20, %r0, %r30
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_306:
	setx	0x3c0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e46004  ! 3695: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb695a188  ! 3696: ORcc_I	orcc 	%r22, 0x0188, %r27
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_wr_158:
	mov	0x38, %r14
	.word 0xf4f38e40  ! 3698: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb3e56121  ! 3699: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_307:
	setx	0x3e0307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_308:
	setx	0x3c021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_309:
	setx	0x3d0120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_310:
	setx	0x3c0120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_311:
	setx	0x3f011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_166:
	mov	0x20, %r14
	.word 0xf4db8e60  ! 3721: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbbe48000  ! 3722: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_rd_167:
	mov	0xc, %r14
	.word 0xfadb8e60  ! 3728: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb7e48000  ! 3729: SAVE_R	save	%r18, %r0, %r27
	.word 0xb9e58000  ! 3730: SAVE_R	save	%r22, %r0, %r28
	.word 0xb3e561f7  ! 3732: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb2454000  ! 3735: ADDC_R	addc 	%r21, %r0, %r25
cpu_intr_0_312:
	setx	0x3f0319, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_159:
	mov	0x7, %r14
	.word 0xf8f38e60  ! 3745: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T0_asi_reg_wr_160:
	mov	0x2a, %r14
	.word 0xf8f38400  ! 3747: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_wr_161:
	mov	0x3c4, %r14
	.word 0xfcf38e80  ! 3749: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 19)
	.word 0xb5e5c000  ! 3751: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_wr_162:
	mov	0x38, %r14
	.word 0xf2f38400  ! 3753: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb5e4a0d8  ! 3756: SAVE_I	save	%r18, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e58000  ! 3759: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb7353001  ! 3766: SRLX_I	srlx	%r20, 0x0001, %r27
	.word 0xb1e5c000  ! 3769: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_313:
	setx	0x3c0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 3771: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 1)
	.word 0xb1e50000  ! 3776: SAVE_R	save	%r20, %r0, %r24
	.word 0xbde42178  ! 3777: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_163:
	mov	0x3c1, %r14
	.word 0xfcf384a0  ! 3780: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbde58000  ! 3782: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_314:
	setx	0x3c0300, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_168:
	mov	0xd, %r14
	.word 0xf4db8400  ! 3784: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbde5c000  ! 3786: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, 18)
	.word 0xb9e561f2  ! 3793: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e58000  ! 3794: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_rd_169:
	mov	0xe, %r14
	.word 0xf2db8e40  ! 3795: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_315:
	setx	0x3f002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb80da020  ! 3804: AND_I	and 	%r22, 0x0020, %r28
	.word 0xbbe54000  ! 3805: SAVE_R	save	%r21, %r0, %r29
	.word 0xb1e5208e  ! 3808: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e5c000  ! 3809: SAVE_R	save	%r23, %r0, %r25
	.word 0xb4b5e140  ! 3812: SUBCcc_I	orncc 	%r23, 0x0140, %r26
	.word 0xb1e4c000  ! 3813: SAVE_R	save	%r19, %r0, %r24
	.word 0xbbe420d2  ! 3814: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb884a041  ! 3827: ADDcc_I	addcc 	%r18, 0x0041, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbc9d0000  ! 3829: XORcc_R	xorcc 	%r20, %r0, %r30
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb5e54000  ! 3832: SAVE_R	save	%r21, %r0, %r26
	.word 0xb9e44000  ! 3836: SAVE_R	save	%r17, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_170:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 3839: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 9)
	.word 0xb1e4c000  ! 3842: SAVE_R	save	%r19, %r0, %r24
	.word 0xb5e48000  ! 3846: SAVE_R	save	%r18, %r0, %r26
	.word 0xb9e56011  ! 3854: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb8b58000  ! 3856: ORNcc_R	orncc 	%r22, %r0, %r28
	.word 0xb9e5e1c3  ! 3857: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_wr_164:
	mov	0x2a, %r14
	.word 0xfaf38400  ! 3859: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbde58000  ! 3860: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_316:
	setx	0x3f032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e461fe  ! 3863: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e4a1aa  ! 3864: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, b)
	.word 0xb2b5a147  ! 3866: SUBCcc_I	orncc 	%r22, 0x0147, %r25
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 22)
	.word 0xb7e44000  ! 3878: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 24)
	.word 0xbfe5a095  ! 3884: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 12)
	.word 0xb1e46016  ! 3887: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e4e0b8  ! 3890: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb20d20f3  ! 3894: AND_I	and 	%r20, 0x00f3, %r25
cpu_intr_0_317:
	setx	0x3d0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b50000  ! 3898: ORNcc_R	orncc 	%r20, %r0, %r26
cpu_intr_0_318:
	setx	0x3f0333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb46152  ! 3900: ORNcc_I	orncc 	%r17, 0x0152, %r30
	.word 0xb0a4215e  ! 3901: SUBcc_I	subcc 	%r16, 0x015e, %r24
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, b)
	.word 0xb7e58000  ! 3906: SAVE_R	save	%r22, %r0, %r27
	.word 0xb1e5a05d  ! 3907: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbfe4c000  ! 3909: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_rd_171:
	mov	0x3c4, %r14
	.word 0xf8db8e80  ! 3911: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb8ac211f  ! 3915: ANDNcc_I	andncc 	%r16, 0x011f, %r28
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_wr_165:
	mov	0x3c3, %r14
	.word 0xf0f38400  ! 3921: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb1e54000  ! 3922: SAVE_R	save	%r21, %r0, %r24
	.word 0xb7e5c000  ! 3924: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 0)
	.word 0xb9e48000  ! 3933: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 16)
	.word 0xbbe48000  ! 3937: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_wr_166:
	mov	0x32, %r14
	.word 0xf8f384a0  ! 3938: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb635c000  ! 3940: ORN_R	orn 	%r23, %r0, %r27
	.word 0xbbe5618d  ! 3941: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e58000  ! 3945: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_319:
	setx	0x3d0022, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_167:
	mov	0x2f, %r14
	.word 0xfcf389e0  ! 3949: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbbe44000  ! 3953: SAVE_R	save	%r17, %r0, %r29
	.word 0xb5e4a1c3  ! 3954: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9e460d8  ! 3957: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, c)
	.word 0xb1e54000  ! 3967: SAVE_R	save	%r21, %r0, %r24
	.word 0xb5e5c000  ! 3969: SAVE_R	save	%r23, %r0, %r26
	.word 0xbfe4c000  ! 3970: SAVE_R	save	%r19, %r0, %r31
	.word 0xbde40000  ! 3971: SAVE_R	save	%r16, %r0, %r30
	.word 0xb9e5a1c8  ! 3972: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 2)
	.word 0xb5e5e148  ! 3975: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e5a1e1  ! 3978: SAVE_I	save	%r22, 0x0001, %r26
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_320:
	setx	0x3e000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_172:
	mov	0x2d, %r14
	.word 0xf8db8e40  ! 3981: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9e58000  ! 3983: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_321:
	setx	0x3e023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb3e5a12b  ! 3989: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e5c000  ! 3991: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_wr_168:
	mov	0x1a, %r14
	.word 0xfaf38e40  ! 3995: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb9e521bf  ! 3996: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e58000  ! 3997: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_wr_169:
	mov	0x26, %r14
	.word 0xf6f38e80  ! 4000: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb03c614f  ! 4002: XNOR_I	xnor 	%r17, 0x014f, %r24
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbfe4e0fe  ! 4005: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb08c600d  ! 4006: ANDcc_I	andcc 	%r17, 0x000d, %r24
	.word 0xb09d8000  ! 4008: XORcc_R	xorcc 	%r22, %r0, %r24
T0_asi_reg_wr_170:
	mov	0x15, %r14
	.word 0xf6f38e60  ! 4009: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_0_322:
	setx	0x3d0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0ac8000  ! 4012: ANDNcc_R	andncc 	%r18, %r0, %r24
cpu_intr_0_323:
	setx	0x3f020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe58000  ! 4014: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_rd_173:
	mov	0x3c1, %r14
	.word 0xf2db89e0  ! 4015: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb5e5a0f3  ! 4016: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x85942174  ! 4019: WRPR_TSTATE_I	wrpr	%r16, 0x0174, %tstate
	.word 0xbbe56120  ! 4027: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe54000  ! 4033: SAVE_R	save	%r21, %r0, %r31
	.word 0xbfe58000  ! 4034: SAVE_R	save	%r22, %r0, %r31
	.word 0xb9e5210a  ! 4035: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde44000  ! 4036: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_324:
	setx	0x3c012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_171:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 4039: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb1e4e1f5  ! 4040: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe44000  ! 4042: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_wr_172:
	mov	0x3c4, %r14
	.word 0xf2f389e0  ! 4043: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_rd_174:
	mov	0x1a, %r14
	.word 0xf4db8e60  ! 4048: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_wr_173:
	mov	0xb, %r14
	.word 0xf2f389e0  ! 4054: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_wr_174:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 4055: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_175:
	mov	0x1f, %r14
	.word 0xfadb84a0  ! 4056: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb3e44000  ! 4060: SAVE_R	save	%r17, %r0, %r25
	.word 0xb6844000  ! 4061: ADDcc_R	addcc 	%r17, %r0, %r27
cpu_intr_0_325:
	setx	0x3e0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 4064: SAVE_R	save	%r22, %r0, %r28
	.word 0xbde54000  ! 4066: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_wr_175:
	mov	0x15, %r14
	.word 0xf0f389e0  ! 4067: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_326:
	setx	0x3c0320, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_176:
	mov	0x12, %r14
	.word 0xfadb8e80  ! 4073: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T0_asi_reg_rd_177:
	mov	0x21, %r14
	.word 0xf0db8e80  ! 4078: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_0_327:
	setx	0x3d0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 4085: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_328:
	setx	0x3e0336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_329:
	setx	0x3e023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_330:
	setx	0x3e000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 4090: SAVE_R	save	%r18, %r0, %r27
	.word 0xbbe4a102  ! 4091: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde461f7  ! 4093: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 22)
	.word 0xb9e4e1f3  ! 4097: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7e5a056  ! 4100: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e4a0b5  ! 4101: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_wr_176:
	mov	0x12, %r14
	.word 0xf4f384a0  ! 4103: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_0_331:
	setx	0x3d002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_178:
	mov	0x2, %r14
	.word 0xf4db8e80  ! 4107: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb8248000  ! 4109: SUB_R	sub 	%r18, %r0, %r28
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb5e461d8  ! 4111: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e50000  ! 4112: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_wr_177:
	mov	0x1d, %r14
	.word 0xf4f38e40  ! 4114: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_332:
	setx	0x40032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_178:
	mov	0x10, %r14
	.word 0xf8f38e80  ! 4118: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_wr_179:
	mov	0x1c, %r14
	.word 0xf8f38e80  ! 4119: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_0_333:
	setx	0x40020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 4122: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 7)
	.word 0xb1e5615a  ! 4125: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_334:
	setx	0x420324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88c8000  ! 4129: ANDcc_R	andcc 	%r18, %r0, %r28
cpu_intr_0_335:
	setx	0x430227, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_179:
	mov	0x4, %r14
	.word 0xf4db89e0  ! 4132: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb9349000  ! 4133: SRLX_R	srlx	%r18, %r0, %r28
	.word 0xbf500000  ! 4134: RDPR_TPC	<illegal instruction>
cpu_intr_0_336:
	setx	0x420002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_337:
	setx	0x420029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4204a  ! 4141: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_338:
	setx	0x400019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_339:
	setx	0x40000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 4145: SAVE_R	save	%r22, %r0, %r30
	.word 0xb3e50000  ! 4146: SAVE_R	save	%r20, %r0, %r25
	.word 0xb61c0000  ! 4149: XOR_R	xor 	%r16, %r0, %r27
T0_asi_reg_rd_180:
	mov	0x3c6, %r14
	.word 0xfadb8400  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 39)
	.word 0xb7e5e18e  ! 4158: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_wr_180:
	mov	0x2c, %r14
	.word 0xf0f389e0  ! 4159: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T0_asi_reg_rd_181:
	mov	0x1e, %r14
	.word 0xfadb8e40  ! 4160: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_181:
	mov	0x2b, %r14
	.word 0xf4f38e40  ! 4161: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_340:
	setx	0x430309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe420e1  ! 4168: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 34)
	.word 0xb9e58000  ! 4170: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_341:
	setx	0x43003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe58000  ! 4173: SAVE_R	save	%r22, %r0, %r31
	.word 0xbde4a15b  ! 4174: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb935a001  ! 4175: SRL_I	srl 	%r22, 0x0001, %r28
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 15)
	.word 0xb62c2178  ! 4178: ANDN_I	andn 	%r16, 0x0178, %r27
cpu_intr_0_342:
	setx	0x420020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_343:
	setx	0x42023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2856079  ! 4188: ADDcc_I	addcc 	%r21, 0x0079, %r25
cpu_intr_0_344:
	setx	0x430026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 4191: SAVE_R	save	%r21, %r0, %r27
	.word 0xb8148000  ! 4204: OR_R	or 	%r18, %r0, %r28
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 29)
	.word 0xbbe50000  ! 4212: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_182:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 4213: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbde5216e  ! 4219: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, 18)
	.word 0xbde56192  ! 4225: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb5e420a5  ! 4226: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_345:
	setx	0x420017, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_346:
	setx	0x430209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_347:
	setx	0x42012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 11)
	.word 0xbfe58000  ! 4233: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_348:
	setx	0x40002f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 2b)
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 33)
	.word 0xb7e40000  ! 4247: SAVE_R	save	%r16, %r0, %r27
	.word 0xb5500000  ! 4248: RDPR_TPC	<illegal instruction>
T0_asi_reg_wr_182:
	mov	0xf, %r14
	.word 0xf0f38e60  ! 4249: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb9e5c000  ! 4250: SAVE_R	save	%r23, %r0, %r28
cpu_intr_0_349:
	setx	0x43023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_183:
	mov	0x26, %r14
	.word 0xfadb8400  ! 4260: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T0_asi_reg_rd_184:
	mov	0x1, %r14
	.word 0xfcdb89e0  ! 4261: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbfe54000  ! 4262: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_350:
	setx	0x420021, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_183:
	mov	0x32, %r14
	.word 0xfcf38e40  ! 4266: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb8350000  ! 4272: ORN_R	orn 	%r20, %r0, %r28
cpu_intr_0_351:
	setx	0x40030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e421d5  ! 4276: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_rd_185:
	mov	0x3, %r14
	.word 0xf4db89e0  ! 4277: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb7e5c000  ! 4278: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_rd_186:
	mov	0x3c6, %r14
	.word 0xf2db8400  ! 4280: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_0_352:
	setx	0x43033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_353:
	setx	0x430105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 4285: SAVE_R	save	%r18, %r0, %r28
	.word 0xb1e50000  ! 4287: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_354:
	setx	0x410309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 4290: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_355:
	setx	0x420229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a14d  ! 4294: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe5a04e  ! 4296: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7e4e06f  ! 4297: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde56129  ! 4301: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb9e48000  ! 4303: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_356:
	setx	0x43022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 4312: SAVE_R	save	%r23, %r0, %r26
	.word 0xbfe4e178  ! 4314: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe56180  ! 4315: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbf641800  ! 4316: MOVcc_R	<illegal instruction>
	.word 0xbfe5a01d  ! 4324: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_357:
	setx	0x420016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 4329: SAVE_R	save	%r16, %r0, %r28
	.word 0xb22d6103  ! 4331: ANDN_I	andn 	%r21, 0x0103, %r25
T0_asi_reg_wr_184:
	mov	0x2b, %r14
	.word 0xfaf38e80  ! 4335: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbde40000  ! 4336: SAVE_R	save	%r16, %r0, %r30
	.word 0xbfe48000  ! 4341: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_wr_185:
	mov	0x36, %r14
	.word 0xf0f38e80  ! 4344: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_358:
	setx	0x420207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a0da  ! 4350: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_wr_186:
	mov	0x19, %r14
	.word 0xf6f38400  ! 4352: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T0_asi_reg_rd_187:
	mov	0xe, %r14
	.word 0xf2db8e40  ! 4356: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_359:
	setx	0x43022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_360:
	setx	0x410104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_361:
	setx	0x41031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 34)
	.word 0xbebde081  ! 4362: XNORcc_I	xnorcc 	%r23, 0x0081, %r31
	.word 0xb9e40000  ! 4367: SAVE_R	save	%r16, %r0, %r28
	.word 0xb9e42016  ! 4368: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_362:
	setx	0x43010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a0ff  ! 4372: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_rd_188:
	mov	0x3c6, %r14
	.word 0xf8db8e60  ! 4375: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T0_asi_reg_rd_189:
	mov	0xe, %r14
	.word 0xf4db8e40  ! 4377: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb5e4c000  ! 4381: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb73d5000  ! 4384: SRAX_R	srax	%r21, %r0, %r27
cpu_intr_0_363:
	setx	0x400307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_364:
	setx	0x430017, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_190:
	mov	0xb, %r14
	.word 0xf8db8e40  ! 4389: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_365:
	setx	0x400216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde46128  ! 4406: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde44000  ! 4407: SAVE_R	save	%r17, %r0, %r30
	.word 0xb1e58000  ! 4408: SAVE_R	save	%r22, %r0, %r24
	.word 0xbde50000  ! 4409: SAVE_R	save	%r20, %r0, %r30
	.word 0xb3e52036  ! 4410: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_366:
	setx	0x430312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe520dc  ! 4413: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb550c000  ! 4414: RDPR_TT	<illegal instruction>
cpu_intr_0_367:
	setx	0x40000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_368:
	setx	0x410119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_369:
	setx	0x410307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe560b7  ! 4425: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e46101  ! 4426: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 2)
	.word 0xb5e50000  ! 4429: SAVE_R	save	%r20, %r0, %r26
	.word 0xb9e4c000  ! 4430: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_370:
	setx	0x420114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 4434: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_wr_187:
	mov	0xb, %r14
	.word 0xf4f38400  ! 4439: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbd2c0000  ! 4445: SLL_R	sll 	%r16, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde46044  ! 4449: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe50000  ! 4451: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_191:
	mov	0x15, %r14
	.word 0xfadb8e60  ! 4454: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb5641800  ! 4455: MOVcc_R	<illegal instruction>
cpu_intr_0_371:
	setx	0x410139, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_372:
	setx	0x410317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa5a157  ! 4460: SUBcc_I	subcc 	%r22, 0x0157, %r29
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 34)
	.word 0xb1e4e1a1  ! 4466: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e5c000  ! 4468: SAVE_R	save	%r23, %r0, %r24
	.word 0xbbe46107  ! 4469: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_wr_188:
	mov	0x26, %r14
	.word 0xfaf389e0  ! 4475: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb7e54000  ! 4476: SAVE_R	save	%r21, %r0, %r27
	.word 0xb234e09a  ! 4477: ORN_I	orn 	%r19, 0x009a, %r25
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, 34)
	.word 0xb3e5a070  ! 4480: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 34)
	.word 0xb5e461db  ! 4484: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_373:
	setx	0x400106, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_189:
	mov	0x3c5, %r14
	.word 0xf4f384a0  ! 4486: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb0250000  ! 4487: SUB_R	sub 	%r20, %r0, %r24
	.word 0xbfe520ea  ! 4488: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_wr_190:
	mov	0x3, %r14
	.word 0xfcf384a0  ! 4491: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_0_374:
	setx	0x410117, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_191:
	mov	0x3c6, %r14
	.word 0xfef38e60  ! 4494: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbbe5e1d0  ! 4495: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_375:
	setx	0x430218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5219c  ! 4500: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3e40000  ! 4501: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_376:
	setx	0x400229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_377:
	setx	0x420004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 39)
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb9e46053  ! 4508: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbde4a0fa  ! 4511: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_378:
	setx	0x420339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 4513: SAVE_R	save	%r16, %r0, %r25
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, 25)
	.word 0xbfe54000  ! 4517: SAVE_R	save	%r21, %r0, %r31
	.word 0xb3e40000  ! 4519: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_379:
	setx	0x400337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 4521: SAVE_R	save	%r19, %r0, %r25
	.word 0xb845e109  ! 4523: ADDC_I	addc 	%r23, 0x0109, %r28
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 13)
	.word 0xb2a4205c  ! 4526: SUBcc_I	subcc 	%r16, 0x005c, %r25
	.word 0xb7e5c000  ! 4535: SAVE_R	save	%r23, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e5e163  ! 4540: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_380:
	setx	0x42022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc05c000  ! 4543: ADD_R	add 	%r23, %r0, %r30
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_192:
	mov	0x3c3, %r14
	.word 0xf8db8e80  ! 4545: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_wr_192:
	mov	0xa, %r14
	.word 0xf0f384a0  ! 4553: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbde40000  ! 4555: SAVE_R	save	%r16, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7e5610b  ! 4557: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbbe4214c  ! 4563: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_wr_193:
	mov	0x27, %r14
	.word 0xf6f384a0  ! 4564: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_0_381:
	setx	0x41001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_193:
	mov	0xc, %r14
	.word 0xfadb8e40  ! 4566: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb7e5a13e  ! 4567: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb7e4e08f  ! 4568: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_382:
	setx	0x42031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_383:
	setx	0x430011, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_384:
	setx	0x42013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_194:
	mov	0x9, %r14
	.word 0xfaf38e80  ! 4574: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_rd_194:
	mov	0x14, %r14
	.word 0xf8db8e80  ! 4576: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_0_385:
	setx	0x430326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe0d0000  ! 4578: AND_R	and 	%r20, %r0, %r31
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, 2b)
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, 16)
	.word 0xb33c6001  ! 4585: SRA_I	sra 	%r17, 0x0001, %r25
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, 29)
	.word 0xbebde1fb  ! 4588: XNORcc_I	xnorcc 	%r23, 0x01fb, %r31
	.word 0xb9e4a0bb  ! 4591: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_195:
	mov	0x1e, %r14
	.word 0xf6db8e60  ! 4592: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb9e420ab  ! 4593: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_386:
	setx	0x41012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a17f  ! 4597: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xba2ca0e5  ! 4598: ANDN_I	andn 	%r18, 0x00e5, %r29
T0_asi_reg_wr_195:
	mov	0x9, %r14
	.word 0xf8f38e80  ! 4599: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_rd_196:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 4603: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_rd_197:
	mov	0x1e, %r14
	.word 0xfedb8e60  ! 4607: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_387:
	setx	0x46030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_388:
	setx	0x470104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 4612: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_rd_198:
	mov	0x3c0, %r14
	.word 0xf8db8e80  ! 4617: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb1e44000  ! 4618: SAVE_R	save	%r17, %r0, %r24
	.word 0xbfe48000  ! 4619: SAVE_R	save	%r18, %r0, %r31
	.word 0xb9e5612a  ! 4621: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbe94e0a6  ! 4626: ORcc_I	orcc 	%r19, 0x00a6, %r31
	.word 0xb3e561f6  ! 4632: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e48000  ! 4633: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_wr_196:
	mov	0x3c4, %r14
	.word 0xf6f389e0  ! 4636: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T0_asi_reg_rd_199:
	mov	0x3c1, %r14
	.word 0xf8db8400  ! 4639: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb3e5a05e  ! 4643: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e5a10f  ! 4644: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e48000  ! 4647: SAVE_R	save	%r18, %r0, %r25
	.word 0xb2bd8000  ! 4651: XNORcc_R	xnorcc 	%r22, %r0, %r25
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 8)
cpu_intr_0_389:
	setx	0x45002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_197:
	mov	0x10, %r14
	.word 0xfaf38e60  ! 4656: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb9e54000  ! 4657: SAVE_R	save	%r21, %r0, %r28
	.word 0xb2352025  ! 4658: ORN_I	orn 	%r20, 0x0025, %r25
cpu_intr_0_390:
	setx	0x440137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 26)
	.word 0xb1e5a029  ! 4667: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e54000  ! 4668: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_391:
	setx	0x44023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 4670: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_rd_200:
	mov	0x1c, %r14
	.word 0xfadb84a0  ! 4671: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb9e420f0  ! 4673: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde5c000  ! 4674: SAVE_R	save	%r23, %r0, %r30
	.word 0xbfe5c000  ! 4677: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_rd_201:
	mov	0x2e, %r14
	.word 0xfedb8e40  ! 4678: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_392:
	setx	0x460113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 4685: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb5e5c000  ! 4688: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_393:
	setx	0x47012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_202:
	mov	0x25, %r14
	.word 0xf0db84a0  ! 4693: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_0_394:
	setx	0x44021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, 13)
	.word 0xb5e4a1e2  ! 4703: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e5c000  ! 4704: SAVE_R	save	%r23, %r0, %r26
	.word 0xb7e5a0cf  ! 4708: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_rd_203:
	mov	0x3c3, %r14
	.word 0xfedb89e0  ! 4709: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbfe5a197  ! 4711: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e5c000  ! 4712: SAVE_R	save	%r23, %r0, %r26
	.word 0xb9e44000  ! 4717: SAVE_R	save	%r17, %r0, %r28
	.word 0xb9e460d9  ! 4719: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e5e083  ! 4720: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e4a106  ! 4722: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde4206e  ! 4724: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_395:
	setx	0x36, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 4726: SAVE_R	save	%r20, %r0, %r27
	.word 0xb7e40000  ! 4728: SAVE_R	save	%r16, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_396:
	setx	0x45031e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb2b5c000  ! 4734: ORNcc_R	orncc 	%r23, %r0, %r25
	.word 0xb3e420a6  ! 4738: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbfe4c000  ! 4742: SAVE_R	save	%r19, %r0, %r31
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_wr_198:
	mov	0x1c, %r14
	.word 0xf4f38e40  ! 4752: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb1e54000  ! 4754: SAVE_R	save	%r21, %r0, %r24
	.word 0xb3e44000  ! 4756: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_397:
	setx	0x440222, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_204:
	mov	0x3c6, %r14
	.word 0xfcdb8e60  ! 4758: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb695a059  ! 4763: ORcc_I	orcc 	%r22, 0x0059, %r27
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 3b)
	.word 0xa1902002  ! 4765: WRPR_GL_I	wrpr	%r0, 0x0002, %-
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_rd_205:
	mov	0x28, %r14
	.word 0xf8db84a0  ! 4768: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb1e5c000  ! 4769: SAVE_R	save	%r23, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_398:
	setx	0x470305, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_206:
	mov	0x6, %r14
	.word 0xfcdb8e40  ! 4773: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_399:
	setx	0x470006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_400:
	setx	0x470038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4206d  ! 4788: SAVE_I	save	%r16, 0x0001, %r24
T0_asi_reg_wr_199:
	mov	0x19, %r14
	.word 0xf4f38e40  ! 4790: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_401:
	setx	0x440336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e40000  ! 4795: SAVE_R	save	%r16, %r0, %r27
	.word 0xb9e54000  ! 4798: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_wr_200:
	mov	0x2e, %r14
	.word 0xfef389e0  ! 4801: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T0_asi_reg_wr_201:
	mov	0x30, %r14
	.word 0xf0f38e40  ! 4802: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb7e5603b  ! 4803: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_wr_202:
	mov	0x20, %r14
	.word 0xfcf38e40  ! 4808: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb1e52060  ! 4820: SAVE_I	save	%r20, 0x0001, %r24
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 1e)
cpu_intr_0_402:
	setx	0x470114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, 33)
	.word 0xb7e421e4  ! 4827: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 24)
	.word 0xbbe40000  ! 4830: SAVE_R	save	%r16, %r0, %r29
	.word 0xbfe48000  ! 4832: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_wr_203:
	mov	0x15, %r14
	.word 0xf4f38e40  ! 4834: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_204:
	mov	0x3, %r14
	.word 0xfcf38e40  ! 4836: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbbe54000  ! 4840: SAVE_R	save	%r21, %r0, %r29
T0_asi_reg_wr_205:
	mov	0x25, %r14
	.word 0xfef38e40  ! 4841: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbc85a19a  ! 4842: ADDcc_I	addcc 	%r22, 0x019a, %r30
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, 12)
	.word 0xb9e5c000  ! 4845: SAVE_R	save	%r23, %r0, %r28
	.word 0xb1e50000  ! 4846: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_wr_206:
	mov	0x22, %r14
	.word 0xfef389e0  ! 4847: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_207:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 4851: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbbe56105  ! 4853: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5e50000  ! 4854: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_403:
	setx	0x470124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_wr_207:
	mov	0x3c4, %r14
	.word 0xfcf38e60  ! 4861: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbde56195  ! 4864: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbde40000  ! 4866: SAVE_R	save	%r16, %r0, %r30
	.word 0xb1e48000  ! 4867: SAVE_R	save	%r18, %r0, %r24
	.word 0xb1e40000  ! 4870: SAVE_R	save	%r16, %r0, %r24
	.word 0xb3e52059  ! 4872: SAVE_I	save	%r20, 0x0001, %r25
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_rd_208:
	mov	0x3c2, %r14
	.word 0xf2db84a0  ! 4881: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb7e42189  ! 4882: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, 32)
	.word 0xb1643801  ! 4884: MOVcc_I	<illegal instruction>
	.word 0xb5e5c000  ! 4885: SAVE_R	save	%r23, %r0, %r26
	.word 0xbfe5e11f  ! 4887: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_rd_209:
	mov	0x1a, %r14
	.word 0xfedb84a0  ! 4891: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_404:
	setx	0x450214, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_405:
	setx	0x440138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_406:
	setx	0x450307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 34)
	.word 0xbaa5c000  ! 4899: SUBcc_R	subcc 	%r23, %r0, %r29
	.word 0xb5e54000  ! 4900: SAVE_R	save	%r21, %r0, %r26
	.word 0xbbe5e0f8  ! 4903: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbbe50000  ! 4909: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbbe520cd  ! 4921: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_rd_210:
	mov	0x38, %r14
	.word 0xfadb8e40  ! 4922: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_407:
	setx	0x45010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, 8)
	.word 0xbde5e097  ! 4927: SAVE_I	save	%r23, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb695210b  ! 4935: ORcc_I	orcc 	%r20, 0x010b, %r27
	.word 0xb9e44000  ! 4936: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_408:
	setx	0x470226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_409:
	setx	0x47021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 4948: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_410:
	setx	0x46000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_208:
	mov	0x1, %r14
	.word 0xf6f38400  ! 4952: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb9e58000  ! 4953: SAVE_R	save	%r22, %r0, %r28
	.word 0xbde44000  ! 4954: SAVE_R	save	%r17, %r0, %r30
	.word 0xbfe420c3  ! 4955: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbde5212a  ! 4956: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe4c000  ! 4957: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_wr_209:
	mov	0x22, %r14
	.word 0xf2f38e40  ! 4963: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfe54000  ! 4965: SAVE_R	save	%r21, %r0, %r31
	.word 0xb3e40000  ! 4966: SAVE_R	save	%r16, %r0, %r25
	.word 0xbbe40000  ! 4968: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, 18)
	.word 0xb3e54000  ! 4971: SAVE_R	save	%r21, %r0, %r25
	.word 0xbfe421e0  ! 4973: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_411:
	setx	0x460134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_412:
	setx	0x460132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_413:
	setx	0x470132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 4986: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_210:
	mov	0x2f, %r14
	.word 0xf2f38e40  ! 4992: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_414:
	setx	0x460303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe52165  ! 4997: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 3c)
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
	.word 0xfaa42171  ! 2: STWA_I	stwa	%r29, [%r16 + 0x0171] %asi
	.word 0xfa2c8000  ! 3: STB_R	stb	%r29, [%r18 + %r0]
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_rd_0:
	mov	0x12, %r14
	.word 0xf2db8e40  ! 6: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_wr_0:
	mov	0x25, %r14
	.word 0xf6f384a0  ! 11: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T3_asi_reg_wr_1:
	mov	0x16, %r14
	.word 0xfaf389e0  ! 12: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T3_asi_reg_wr_2:
	mov	0x3c7, %r14
	.word 0xf2f389e0  ! 13: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf4b58020  ! 15: STHA_R	stha	%r26, [%r22 + %r0] 0x01
	.word 0xf4ad6176  ! 17: STBA_I	stba	%r26, [%r21 + 0x0176] %asi
	.word 0xf42ca008  ! 18: STB_I	stb	%r26, [%r18 + 0x0008]
	.word 0xfa35c000  ! 20: STH_R	sth	%r29, [%r23 + %r0]
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_wr_3:
	mov	0x35, %r14
	.word 0xf2f38e40  ! 22: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_0:
	setx	0x1d000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb834e0f9  ! 28: SUBC_I	orn 	%r19, 0x00f9, %r28
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfa25a1ff  ! 30: STW_I	stw	%r29, [%r22 + 0x01ff]
	ta	T_CHANGE_HPRIV
	.word 0xf4b4215e  ! 33: STHA_I	stha	%r26, [%r16 + 0x015e] %asi
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 6)
	.word 0xf235a177  ! 35: STH_I	sth	%r25, [%r22 + 0x0177]
	.word 0xfa340000  ! 36: STH_R	sth	%r29, [%r16 + %r0]
T3_asi_reg_wr_4:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 37: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf0ada049  ! 38: STBA_I	stba	%r24, [%r22 + 0x0049] %asi
	.word 0xf8a5a1d2  ! 40: STWA_I	stwa	%r28, [%r22 + 0x01d2] %asi
	.word 0xf434e04b  ! 42: STH_I	sth	%r26, [%r19 + 0x004b]
T3_asi_reg_wr_5:
	mov	0x32, %r14
	.word 0xf2f384a0  ! 47: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 1a)
cpu_intr_3_1:
	setx	0x1e0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_2:
	setx	0x1c0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982a1a  ! 55: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1a, %hpstate
	.word 0xfa754000  ! 56: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xb8bce13d  ! 58: XNORcc_I	xnorcc 	%r19, 0x013d, %r28
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_3:
	setx	0x1f0303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_4:
	setx	0x1c0228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf5611c  ! 65: STXA_I	stxa	%r29, [%r21 + 0x011c] %asi
	.word 0xbd3d2001  ! 68: SRA_I	sra 	%r20, 0x0001, %r30
	.word 0xbd343001  ! 69: SRLX_I	srlx	%r16, 0x0001, %r30
	.word 0xb1643801  ! 70: MOVcc_I	<illegal instruction>
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_6:
	mov	0x18, %r14
	.word 0xfaf38e40  ! 74: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
cpu_intr_3_5:
	setx	0x1c0336, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_7:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 79: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_6:
	setx	0x1d0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf0ad4020  ! 86: STBA_R	stba	%r24, [%r21 + %r0] 0x01
T3_asi_reg_rd_1:
	mov	0x21, %r14
	.word 0xf2db8e60  ! 87: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T3_asi_reg_rd_2:
	mov	0x18, %r14
	.word 0xf0db8400  ! 92: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	ta	T_CHANGE_TO_TL1
cpu_intr_3_7:
	setx	0x1e0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb58020  ! 97: STHA_R	stha	%r30, [%r22 + %r0] 0x01
T3_asi_reg_wr_8:
	mov	0x5, %r14
	.word 0xf2f389e0  ! 99: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf22dc000  ! 100: STB_R	stb	%r25, [%r23 + %r0]
T3_asi_reg_wr_9:
	mov	0x3c1, %r14
	.word 0xfaf38e60  ! 102: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 26)
	.word 0xf8ad6070  ! 105: STBA_I	stba	%r28, [%r21 + 0x0070] %asi
cpu_intr_3_8:
	setx	0x1c011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_9:
	setx	0x1c0134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_10:
	setx	0x1d031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_10:
	mov	0x3c1, %r14
	.word 0xfcf389e0  ! 114: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf434214c  ! 116: STH_I	sth	%r26, [%r16 + 0x014c]
	.word 0xfc748000  ! 118: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xfa742113  ! 121: STX_I	stx	%r29, [%r16 + 0x0113]
	.word 0xfea58020  ! 122: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
	.word 0xfaace1e3  ! 123: STBA_I	stba	%r29, [%r19 + 0x01e3] %asi
cpu_intr_3_11:
	setx	0x1c011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ad8020  ! 126: STBA_R	stba	%r25, [%r22 + %r0] 0x01
	.word 0xb750c000  ! 127: RDPR_TT	rdpr	%tt, %r27
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_12:
	setx	0x1c031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_13:
	setx	0x1d0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb09ce171  ! 142: XORcc_I	xorcc 	%r19, 0x0171, %r24
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x819839da  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19da, %hpstate
	.word 0xf035e0d2  ! 144: STH_I	sth	%r24, [%r23 + 0x00d2]
	.word 0xf2a48020  ! 147: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
cpu_intr_3_14:
	setx	0x1f0016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 1c)
	.word 0xbf7c0400  ! 154: MOVR_R	movre	%r16, %r0, %r31
cpu_intr_3_15:
	setx	0x1d0138, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_3:
	mov	0x21, %r14
	.word 0xf0db8e60  ! 160: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_rd_4:
	mov	0x7, %r14
	.word 0xfadb8e40  ! 167: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 39)
T3_asi_reg_rd_5:
	mov	0x3c4, %r14
	.word 0xf2db8e60  ! 170: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_16:
	setx	0x1f0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983b58  ! 176: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b58, %hpstate
	.word 0xba942134  ! 177: ORcc_I	orcc 	%r16, 0x0134, %r29
cpu_intr_3_17:
	setx	0x1c0130, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_11:
	mov	0x10, %r14
	.word 0xf4f38e60  ! 184: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_3_18:
	setx	0x1d0231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_19:
	setx	0x1d001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_20:
	setx	0x1c001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc0da01c  ! 193: AND_I	and 	%r22, 0x001c, %r30
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 7)
	.word 0xf62da037  ! 200: STB_I	stb	%r27, [%r22 + 0x0037]
cpu_intr_3_21:
	setx	0x1e0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4748000  ! 204: STX_R	stx	%r26, [%r18 + %r0]
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_wr_12:
	mov	0xc, %r14
	.word 0xfcf38400  ! 206: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_3_22:
	setx	0x1f0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b5c020  ! 212: STHA_R	stha	%r28, [%r23 + %r0] 0x01
	.word 0xfef5a117  ! 215: STXA_I	stxa	%r31, [%r22 + 0x0117] %asi
cpu_intr_3_23:
	setx	0x1f021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_6:
	mov	0x3c4, %r14
	.word 0xfcdb8e60  ! 218: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T3_asi_reg_rd_7:
	mov	0x19, %r14
	.word 0xf2db8e60  ! 219: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T3_asi_reg_rd_8:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 222: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfc74617e  ! 223: STX_I	stx	%r30, [%r17 + 0x017e]
	.word 0xf8ad21b4  ! 224: STBA_I	stba	%r28, [%r20 + 0x01b4] %asi
	.word 0xb12d3001  ! 228: SLLX_I	sllx	%r20, 0x0001, %r24
cpu_intr_3_24:
	setx	0x1c0330, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, e)
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_25:
	setx	0x1d0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, 5)
	.word 0x8594a1da  ! 243: WRPR_TSTATE_I	wrpr	%r18, 0x01da, %tstate
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, 0)
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_26:
	setx	0x1e0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ac8020  ! 255: STBA_R	stba	%r27, [%r18 + %r0] 0x01
T3_asi_reg_rd_9:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 257: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_27:
	setx	0x1e0021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_28:
	setx	0x1f0034, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 16)
	.word 0xf02c211d  ! 269: STB_I	stb	%r24, [%r16 + 0x011d]
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_rd_10:
	mov	0x8, %r14
	.word 0xfadb8e80  ! 271: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf2f5e183  ! 272: STXA_I	stxa	%r25, [%r23 + 0x0183] %asi
T3_asi_reg_wr_13:
	mov	0x3c2, %r14
	.word 0xf4f38e80  ! 273: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 17)
	.word 0xf825a14f  ! 275: STW_I	stw	%r28, [%r22 + 0x014f]
	.word 0xfcb5207c  ! 276: STHA_I	stha	%r30, [%r20 + 0x007c] %asi
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983b82  ! 277: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b82, %hpstate
	.word 0xfc25a1a7  ! 278: STW_I	stw	%r30, [%r22 + 0x01a7]
cpu_intr_3_29:
	setx	0x1e0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa350000  ! 283: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xf42c0000  ! 284: STB_R	stb	%r26, [%r16 + %r0]
T3_asi_reg_rd_11:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 287: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 33)
	.word 0xf635e00f  ! 289: STH_I	sth	%r27, [%r23 + 0x000f]
T3_asi_reg_rd_12:
	mov	0x3c0, %r14
	.word 0xf0db84a0  ! 290: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf625c000  ! 292: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xf2f561e3  ! 293: STXA_I	stxa	%r25, [%r21 + 0x01e3] %asi
	.word 0xba3d0000  ! 294: XNOR_R	xnor 	%r20, %r0, %r29
cpu_intr_3_30:
	setx	0x1d0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5344000  ! 297: SRL_R	srl 	%r17, %r0, %r26
	.word 0xfa2ca005  ! 299: STB_I	stb	%r29, [%r18 + 0x0005]
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 33)
	.word 0xbcc4a096  ! 304: ADDCcc_I	addccc 	%r18, 0x0096, %r30
	.word 0xb6b461fa  ! 306: ORNcc_I	orncc 	%r17, 0x01fa, %r27
	.word 0xbeb5a1a0  ! 308: SUBCcc_I	orncc 	%r22, 0x01a0, %r31
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_rd_13:
	mov	0x15, %r14
	.word 0xfcdb84a0  ! 311: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb6452141  ! 312: ADDC_I	addc 	%r20, 0x0141, %r27
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_rd_14:
	mov	0x3c8, %r14
	.word 0xf0db84a0  ! 316: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xfe754000  ! 318: STX_R	stx	%r31, [%r21 + %r0]
cpu_intr_3_31:
	setx	0x1e022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2744000  ! 320: STX_R	stx	%r25, [%r17 + %r0]
cpu_intr_3_32:
	setx	0x1c0304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_33:
	setx	0x1d010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2cf001  ! 326: SLLX_I	sllx	%r19, 0x0001, %r29
	.word 0xfab560bd  ! 327: STHA_I	stha	%r29, [%r21 + 0x00bd] %asi
	.word 0xfcb4e0e8  ! 330: STHA_I	stha	%r30, [%r19 + 0x00e8] %asi
	.word 0xf6b420e9  ! 332: STHA_I	stha	%r27, [%r16 + 0x00e9] %asi
	.word 0xf62cc000  ! 333: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xf4a40020  ! 334: STWA_R	stwa	%r26, [%r16 + %r0] 0x01
T3_asi_reg_wr_14:
	mov	0x3c3, %r14
	.word 0xf0f389e0  ! 336: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf22c4000  ! 338: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xfcb4c020  ! 339: STHA_R	stha	%r30, [%r19 + %r0] 0x01
	.word 0xbe150000  ! 340: OR_R	or 	%r20, %r0, %r31
T3_asi_reg_rd_15:
	mov	0x3c2, %r14
	.word 0xf4db8e60  ! 341: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfa35a045  ! 343: STH_I	sth	%r29, [%r22 + 0x0045]
cpu_intr_3_34:
	setx	0x1c0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0258000  ! 352: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xbe1de1b1  ! 355: XOR_I	xor 	%r23, 0x01b1, %r31
	.word 0xf8aca1cb  ! 356: STBA_I	stba	%r28, [%r18 + 0x01cb] %asi
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xfc7521cd  ! 365: STX_I	stx	%r30, [%r20 + 0x01cd]
	.word 0xfa74a130  ! 366: STX_I	stx	%r29, [%r18 + 0x0130]
cpu_intr_3_35:
	setx	0x1d0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8740000  ! 372: STX_R	stx	%r28, [%r16 + %r0]
cpu_intr_3_36:
	setx	0x1c0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_3_37:
	setx	0x1f0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7352001  ! 379: SRL_I	srl 	%r20, 0x0001, %r27
	.word 0xfc74a0b9  ! 380: STX_I	stx	%r30, [%r18 + 0x00b9]
	.word 0xf2f4e198  ! 381: STXA_I	stxa	%r25, [%r19 + 0x0198] %asi
cpu_intr_3_38:
	setx	0x1c001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_16:
	mov	0x19, %r14
	.word 0xf0db8e40  ! 384: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf6ad21f9  ! 390: STBA_I	stba	%r27, [%r20 + 0x01f9] %asi
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_17:
	mov	0x20, %r14
	.word 0xfadb84a0  ! 392: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T3_asi_reg_rd_18:
	mov	0x13, %r14
	.word 0xfadb84a0  ! 396: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_3_39:
	setx	0x1d0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0520c1  ! 400: ADD_I	add 	%r20, 0x00c1, %r29
cpu_intr_3_40:
	setx	0x1c0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a4a157  ! 404: STWA_I	stwa	%r28, [%r18 + 0x0157] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfcad4020  ! 406: STBA_R	stba	%r30, [%r21 + %r0] 0x01
T3_asi_reg_wr_15:
	mov	0x8, %r14
	.word 0xf0f38e40  ! 407: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_41:
	setx	0x1d0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0758000  ! 409: STX_R	stx	%r24, [%r22 + %r0]
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, 27)
cpu_intr_3_42:
	setx	0x1c0131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_43:
	setx	0x1e0009, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_19:
	mov	0x13, %r14
	.word 0xf2db8e60  ! 425: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf475e0ec  ! 426: STX_I	stx	%r26, [%r23 + 0x00ec]
T3_asi_reg_rd_20:
	mov	0x2b, %r14
	.word 0xf6db8e80  ! 429: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_3_44:
	setx	0x1f0203, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_45:
	setx	0x1c0206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b40020  ! 433: STHA_R	stha	%r28, [%r16 + %r0] 0x01
	ta	T_CHANGE_HPRIV
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 13)
	.word 0xbc8d0000  ! 437: ANDcc_R	andcc 	%r20, %r0, %r30
cpu_intr_3_46:
	setx	0x1c001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_47:
	setx	0x1e032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_48:
	setx	0x1e0320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_49:
	setx	0x1d0337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_50:
	setx	0x1e0024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 21)
	.word 0xb2c46144  ! 459: ADDCcc_I	addccc 	%r17, 0x0144, %r25
	.word 0xfeac60b9  ! 461: STBA_I	stba	%r31, [%r17 + 0x00b9] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_rd_21:
	mov	0x9, %r14
	.word 0xf0db84a0  ! 466: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982c9a  ! 467: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9a, %hpstate
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_wr_16:
	mov	0x13, %r14
	.word 0xf6f38e40  ! 471: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf024c000  ! 473: STW_R	stw	%r24, [%r19 + %r0]
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_rd_22:
	mov	0x31, %r14
	.word 0xf2db8e80  ! 476: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xfa2c8000  ! 477: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xbcbc8000  ! 482: XNORcc_R	xnorcc 	%r18, %r0, %r30
	ta	T_CHANGE_TO_TL0
	.word 0xb72cc000  ! 485: SLL_R	sll 	%r19, %r0, %r27
cpu_intr_3_51:
	setx	0x220226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_52:
	setx	0x21031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 7)
	ta	T_CHANGE_NONHPRIV
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 0)
	.word 0xb52d1000  ! 499: SLLX_R	sllx	%r20, %r0, %r26
	.word 0xf0ad4020  ! 500: STBA_R	stba	%r24, [%r21 + %r0] 0x01
cpu_intr_3_53:
	setx	0x200008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b58020  ! 505: STHA_R	stha	%r28, [%r22 + %r0] 0x01
	.word 0xf8a4a046  ! 509: STWA_I	stwa	%r28, [%r18 + 0x0046] %asi
	.word 0xfeb4e1ce  ! 511: STHA_I	stha	%r31, [%r19 + 0x01ce] %asi
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 14)
	ta	T_CHANGE_TO_TL1
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983c92  ! 515: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c92, %hpstate
	.word 0xfcac20a1  ! 516: STBA_I	stba	%r30, [%r16 + 0x00a1] %asi
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 23)
	.word 0xf035a1b4  ! 520: STH_I	sth	%r24, [%r22 + 0x01b4]
	.word 0xb2c5a102  ! 521: ADDCcc_I	addccc 	%r22, 0x0102, %r25
	ta	T_CHANGE_TO_TL0
cpu_intr_3_54:
	setx	0x20002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6254000  ! 527: STW_R	stw	%r27, [%r21 + %r0]
cpu_intr_3_55:
	setx	0x220213, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_17:
	mov	0x33, %r14
	.word 0xf8f38400  ! 529: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfe74e0ac  ! 530: STX_I	stx	%r31, [%r19 + 0x00ac]
T3_asi_reg_rd_23:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 531: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb09c4000  ! 532: XORcc_R	xorcc 	%r17, %r0, %r24
	.word 0xbcbcc000  ! 534: XNORcc_R	xnorcc 	%r19, %r0, %r30
T3_asi_reg_rd_24:
	mov	0x1b, %r14
	.word 0xf6db8e80  ! 535: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf6758000  ! 536: STX_R	stx	%r27, [%r22 + %r0]
cpu_intr_3_56:
	setx	0x23031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_18:
	mov	0x2a, %r14
	.word 0xf2f389e0  ! 539: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf8a42050  ! 543: STWA_I	stwa	%r28, [%r16 + 0x0050] %asi
	ta	T_CHANGE_HPRIV
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983f00  ! 545: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f00, %hpstate
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 19)
	.word 0xf0b4a05c  ! 547: STHA_I	stha	%r24, [%r18 + 0x005c] %asi
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_57:
	setx	0x230019, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 9)
	.word 0xbd518000  ! 554: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xfe25200f  ! 556: STW_I	stw	%r31, [%r20 + 0x000f]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf274e1ba  ! 559: STX_I	stx	%r25, [%r19 + 0x01ba]
	.word 0xfcade080  ! 560: STBA_I	stba	%r30, [%r23 + 0x0080] %asi
	.word 0xf22c21ed  ! 561: STB_I	stb	%r25, [%r16 + 0x01ed]
cpu_intr_3_58:
	setx	0x230332, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0a48020  ! 568: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
	.word 0xf8f4e066  ! 569: STXA_I	stxa	%r28, [%r19 + 0x0066] %asi
	ta	T_CHANGE_HPRIV
cpu_intr_3_59:
	setx	0x230021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6aca07e  ! 575: STBA_I	stba	%r27, [%r18 + 0x007e] %asi
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 26)
	.word 0xb1510000  ! 578: RDPR_TICK	<illegal instruction>
T3_asi_reg_rd_25:
	mov	0x24, %r14
	.word 0xfcdb84a0  ! 581: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_3_60:
	setx	0x20033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f4a0ec  ! 583: STXA_I	stxa	%r24, [%r18 + 0x00ec] %asi
T3_asi_reg_rd_26:
	mov	0x8, %r14
	.word 0xf0db8e60  ! 584: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, a)
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_61:
	setx	0x20021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_19:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 592: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 3)
	.word 0xbc8d6066  ! 599: ANDcc_I	andcc 	%r21, 0x0066, %r30
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfeace1dd  ! 601: STBA_I	stba	%r31, [%r19 + 0x01dd] %asi
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_rd_27:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 608: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfcf561be  ! 609: STXA_I	stxa	%r30, [%r21 + 0x01be] %asi
	.word 0xf4b4a01b  ! 613: STHA_I	stha	%r26, [%r18 + 0x001b] %asi
cpu_intr_3_62:
	setx	0x200329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb934c000  ! 617: SRL_R	srl 	%r19, %r0, %r28
T3_asi_reg_rd_28:
	mov	0x8, %r14
	.word 0xf6db8e60  ! 618: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T3_asi_reg_rd_29:
	mov	0x10, %r14
	.word 0xfcdb8e40  ! 621: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbe04e012  ! 624: ADD_I	add 	%r19, 0x0012, %r31
	.word 0xf4352159  ! 625: STH_I	sth	%r26, [%r20 + 0x0159]
	.word 0xfa75a0bf  ! 628: STX_I	stx	%r29, [%r22 + 0x00bf]
cpu_intr_3_63:
	setx	0x200134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf5606c  ! 630: STXA_I	stxa	%r30, [%r21 + 0x006c] %asi
	.word 0xf274c000  ! 631: STX_R	stx	%r25, [%r19 + %r0]
T3_asi_reg_wr_20:
	mov	0x2e, %r14
	.word 0xfef38e40  ! 632: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb2a58000  ! 633: SUBcc_R	subcc 	%r22, %r0, %r25
	.word 0xbca4a02b  ! 634: SUBcc_I	subcc 	%r18, 0x002b, %r30
	.word 0xf2ade13d  ! 637: STBA_I	stba	%r25, [%r23 + 0x013d] %asi
T3_asi_reg_wr_21:
	mov	0x20, %r14
	.word 0xfcf38400  ! 638: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_64:
	setx	0x210121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf275210a  ! 641: STX_I	stx	%r25, [%r20 + 0x010a]
	.word 0xf4f4e040  ! 644: STXA_I	stxa	%r26, [%r19 + 0x0040] %asi
	.word 0xb93d3001  ! 646: SRAX_I	srax	%r20, 0x0001, %r28
	.word 0xf035a122  ! 647: STH_I	sth	%r24, [%r22 + 0x0122]
cpu_intr_3_65:
	setx	0x200128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc24a000  ! 651: STW_I	stw	%r30, [%r18 + 0x0000]
	.word 0xf22d2086  ! 652: STB_I	stb	%r25, [%r20 + 0x0086]
cpu_intr_3_66:
	setx	0x230315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf275c000  ! 658: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xb5508000  ! 660: RDPR_TSTATE	rdpr	%tstate, %r26
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, 1a)
	.word 0xb7358000  ! 663: SRL_R	srl 	%r22, %r0, %r27
	.word 0xf2f42149  ! 665: STXA_I	stxa	%r25, [%r16 + 0x0149] %asi
	.word 0xf0f5a0a5  ! 667: STXA_I	stxa	%r24, [%r22 + 0x00a5] %asi
	.word 0xf8b5a0c2  ! 668: STHA_I	stha	%r28, [%r22 + 0x00c2] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_67:
	setx	0x21010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaadc020  ! 677: STBA_R	stba	%r29, [%r23 + %r0] 0x01
cpu_intr_3_68:
	setx	0x230211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe344000  ! 679: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xf4b44020  ! 680: STHA_R	stha	%r26, [%r17 + %r0] 0x01
	.word 0xfe348000  ! 683: STH_R	sth	%r31, [%r18 + %r0]
cpu_intr_3_69:
	setx	0x21022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_30:
	mov	0x1f, %r14
	.word 0xfedb8e40  ! 687: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_70:
	setx	0x23010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf8b5a05d  ! 694: STHA_I	stha	%r28, [%r22 + 0x005d] %asi
T3_asi_reg_wr_22:
	mov	0x3c1, %r14
	.word 0xf6f38400  ! 696: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_3_71:
	setx	0x21000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6748000  ! 699: STX_R	stx	%r27, [%r18 + %r0]
cpu_intr_3_72:
	setx	0x210002, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_31:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 703: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 1d)
	.word 0xb885213b  ! 717: ADDcc_I	addcc 	%r20, 0x013b, %r28
	.word 0xfc2d0000  ! 719: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xfc244000  ! 720: STW_R	stw	%r30, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 1)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb950c000  ! 738: RDPR_TT	rdpr	%tt, %r28
T3_asi_reg_wr_23:
	mov	0x6, %r14
	.word 0xf8f38e40  ! 740: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_73:
	setx	0x200025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02520d9  ! 742: STW_I	stw	%r24, [%r20 + 0x00d9]
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 2c)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb53df001  ! 749: SRAX_I	srax	%r23, 0x0001, %r26
T3_asi_reg_wr_24:
	mov	0x3c7, %r14
	.word 0xf0f389e0  ! 752: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf8f52099  ! 753: STXA_I	stxa	%r28, [%r20 + 0x0099] %asi
	.word 0xb085e178  ! 755: ADDcc_I	addcc 	%r23, 0x0178, %r24
	.word 0xf6a5a0af  ! 757: STWA_I	stwa	%r27, [%r22 + 0x00af] %asi
T3_asi_reg_rd_32:
	mov	0x34, %r14
	.word 0xf0db8e40  ! 758: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf8a4e070  ! 760: STWA_I	stwa	%r28, [%r19 + 0x0070] %asi
cpu_intr_3_74:
	setx	0x220003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_75:
	setx	0x22013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_76:
	setx	0x210007, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_77:
	setx	0x23020c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 3)
cpu_intr_3_78:
	setx	0x20013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb434a155  ! 773: SUBC_I	orn 	%r18, 0x0155, %r26
	.word 0xbe35c000  ! 774: SUBC_R	orn 	%r23, %r0, %r31
	.word 0xf6b5e042  ! 775: STHA_I	stha	%r27, [%r23 + 0x0042] %asi
	.word 0xf2b48020  ! 778: STHA_R	stha	%r25, [%r18 + %r0] 0x01
	.word 0xf62c60c8  ! 781: STB_I	stb	%r27, [%r17 + 0x00c8]
	.word 0xfaac60e8  ! 784: STBA_I	stba	%r29, [%r17 + 0x00e8] %asi
cpu_intr_3_79:
	setx	0x200334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf474c000  ! 787: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xf42c4000  ! 790: STB_R	stb	%r26, [%r17 + %r0]
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, b)
	.word 0xf02561c7  ! 793: STW_I	stw	%r24, [%r21 + 0x01c7]
cpu_intr_3_80:
	setx	0x22002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_25:
	mov	0x3c7, %r14
	.word 0xfaf384a0  ! 798: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_wr_26:
	mov	0x3c5, %r14
	.word 0xfef384a0  ! 806: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbcb58000  ! 807: SUBCcc_R	orncc 	%r22, %r0, %r30
	.word 0xba3560db  ! 811: SUBC_I	orn 	%r21, 0x00db, %r29
	.word 0xf8358000  ! 816: STH_R	sth	%r28, [%r22 + %r0]
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 1)
	.word 0xbf7d2401  ! 826: MOVR_I	movre	%r20, 0x1, %r31
	.word 0xf8ad0020  ! 828: STBA_R	stba	%r28, [%r20 + %r0] 0x01
	.word 0xf4ac0020  ! 829: STBA_R	stba	%r26, [%r16 + %r0] 0x01
	ta	T_CHANGE_HPRIV
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfa256141  ! 837: STW_I	stw	%r29, [%r21 + 0x0141]
	.word 0xb43cc000  ! 839: XNOR_R	xnor 	%r19, %r0, %r26
T3_asi_reg_rd_33:
	mov	0x3c6, %r14
	.word 0xfcdb89e0  ! 840: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfaade1c3  ! 841: STBA_I	stba	%r29, [%r23 + 0x01c3] %asi
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_81:
	setx	0x230122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_82:
	setx	0x210125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f5a053  ! 848: STXA_I	stxa	%r28, [%r22 + 0x0053] %asi
T3_asi_reg_rd_34:
	mov	0x17, %r14
	.word 0xf0db89e0  ! 850: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T3_asi_reg_rd_35:
	mov	0x3c2, %r14
	.word 0xf4db89e0  ! 851: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 2b)
	ta	T_CHANGE_TO_TL1
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_wr_27:
	mov	0x30, %r14
	.word 0xfef38e40  ! 862: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf0f460b2  ! 863: STXA_I	stxa	%r24, [%r17 + 0x00b2] %asi
T3_asi_reg_rd_36:
	mov	0x26, %r14
	.word 0xfedb8e60  ! 864: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_83:
	setx	0x20012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22c4000  ! 866: STB_R	stb	%r25, [%r17 + %r0]
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, 36)
	.word 0xf6754000  ! 869: STX_R	stx	%r27, [%r21 + %r0]
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 8)
	.word 0xfead20f9  ! 874: STBA_I	stba	%r31, [%r20 + 0x00f9] %asi
	.word 0xfcb5e0e8  ! 877: STHA_I	stha	%r30, [%r23 + 0x00e8] %asi
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_84:
	setx	0x230331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb625e1cd  ! 881: SUB_I	sub 	%r23, 0x01cd, %r27
cpu_intr_3_85:
	setx	0x20032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b5e02b  ! 883: STHA_I	stha	%r26, [%r23 + 0x002b] %asi
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982952  ! 884: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0952, %hpstate
	.word 0xbf2cd000  ! 885: SLLX_R	sllx	%r19, %r0, %r31
T3_asi_reg_wr_28:
	mov	0xc, %r14
	.word 0xfef38e80  ! 886: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_3_86:
	setx	0x230123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf424a18b  ! 893: STW_I	stw	%r26, [%r18 + 0x018b]
T3_asi_reg_wr_29:
	mov	0x3c7, %r14
	.word 0xf8f38400  ! 895: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_rd_37:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 899: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_rd_38:
	mov	0x20, %r14
	.word 0xf2db8e40  ! 907: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_wr_30:
	mov	0x2, %r14
	.word 0xf6f38e40  ! 909: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfaa5e162  ! 911: STWA_I	stwa	%r29, [%r23 + 0x0162] %asi
T3_asi_reg_wr_31:
	mov	0xa, %r14
	.word 0xf4f38e60  ! 912: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, c)
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, 27)
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, 20)
	.word 0xbeb48000  ! 921: SUBCcc_R	orncc 	%r18, %r0, %r31
	.word 0xfc34e004  ! 927: STH_I	sth	%r30, [%r19 + 0x0004]
cpu_intr_3_87:
	setx	0x240138, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_39:
	mov	0x3c5, %r14
	.word 0xfcdb84a0  ! 931: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbe3d4000  ! 933: XNOR_R	xnor 	%r21, %r0, %r31
cpu_intr_3_88:
	setx	0x270018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2244000  ! 935: STW_R	stw	%r25, [%r17 + %r0]
	.word 0xfea4a11a  ! 937: STWA_I	stwa	%r31, [%r18 + 0x011a] %asi
T3_asi_reg_wr_32:
	mov	0xd, %r14
	.word 0xf8f389e0  ! 938: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xfa74a0fe  ! 940: STX_I	stx	%r29, [%r18 + 0x00fe]
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_89:
	setx	0x24012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_40:
	mov	0x31, %r14
	.word 0xfcdb8e40  ! 950: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, c)
cpu_intr_3_90:
	setx	0x25012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_33:
	mov	0x28, %r14
	.word 0xf6f38e40  ! 955: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_91:
	setx	0x270113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa4e02a  ! 958: STWA_I	stwa	%r29, [%r19 + 0x002a] %asi
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983ed8  ! 959: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed8, %hpstate
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_92:
	setx	0x250008, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_41:
	mov	0x2e, %r14
	.word 0xf2db84a0  ! 964: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfcb520f6  ! 969: STHA_I	stha	%r30, [%r20 + 0x00f6] %asi
	.word 0xbd7c4400  ! 971: MOVR_R	movre	%r17, %r0, %r30
	.word 0xb23de03b  ! 974: XNOR_I	xnor 	%r23, 0x003b, %r25
T3_asi_reg_wr_34:
	mov	0x32, %r14
	.word 0xfaf38e40  ! 975: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbc0da19c  ! 977: AND_I	and 	%r22, 0x019c, %r30
	ta	T_CHANGE_NONHPRIV
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf6ac4020  ! 983: STBA_R	stba	%r27, [%r17 + %r0] 0x01
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983c8a  ! 984: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c8a, %hpstate
T3_asi_reg_rd_42:
	mov	0x13, %r14
	.word 0xf2db8e40  ! 985: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 30)
	.word 0xf4b50020  ! 990: STHA_R	stha	%r26, [%r20 + %r0] 0x01
cpu_intr_3_93:
	setx	0x240303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b5e084  ! 992: STHA_I	stha	%r25, [%r23 + 0x0084] %asi
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_94:
	setx	0x24002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa342021  ! 996: STH_I	sth	%r29, [%r16 + 0x0021]
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 33)
T3_asi_reg_wr_35:
	mov	0x15, %r14
	.word 0xf2f38e40  ! 1001: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, 21)
	.word 0xf8aca14d  ! 1004: STBA_I	stba	%r28, [%r18 + 0x014d] %asi
	.word 0xb2842052  ! 1009: ADDcc_I	addcc 	%r16, 0x0052, %r25
	.word 0xfe24e16a  ! 1010: STW_I	stw	%r31, [%r19 + 0x016a]
T3_asi_reg_rd_43:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 1011: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf475a0b2  ! 1012: STX_I	stx	%r26, [%r22 + 0x00b2]
T3_asi_reg_rd_44:
	mov	0x32, %r14
	.word 0xf6db8e80  ! 1015: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb244214b  ! 1021: ADDC_I	addc 	%r16, 0x014b, %r25
cpu_intr_3_95:
	setx	0x240102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_96:
	setx	0x26033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_36:
	mov	0xd, %r14
	.word 0xf2f38400  ! 1028: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf4744000  ! 1029: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xf234a153  ! 1030: STH_I	sth	%r25, [%r18 + 0x0153]
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 16)
	.word 0xf625c000  ! 1034: STW_R	stw	%r27, [%r23 + %r0]
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 25)
	.word 0xbac421fa  ! 1037: ADDCcc_I	addccc 	%r16, 0x01fa, %r29
	.word 0xfa74e0b3  ! 1038: STX_I	stx	%r29, [%r19 + 0x00b3]
cpu_intr_3_97:
	setx	0x27000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_37:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 1040: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_45:
	mov	0x3c8, %r14
	.word 0xf2db8400  ! 1041: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xfa2c8000  ! 1043: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xfaa54020  ! 1047: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
	.word 0xf62c0000  ! 1048: STB_R	stb	%r27, [%r16 + %r0]
T3_asi_reg_wr_38:
	mov	0x26, %r14
	.word 0xf2f384a0  ! 1050: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_rd_46:
	mov	0x37, %r14
	.word 0xf8db8e40  ! 1052: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_wr_39:
	mov	0x2b, %r14
	.word 0xf0f38e40  ! 1053: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_rd_47:
	mov	0x1e, %r14
	.word 0xf8db8e40  ! 1055: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_98:
	setx	0x270006, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983e92  ! 1058: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e92, %hpstate
	.word 0xf6ac0020  ! 1060: STBA_R	stba	%r27, [%r16 + %r0] 0x01
	.word 0xfaaca095  ! 1063: STBA_I	stba	%r29, [%r18 + 0x0095] %asi
	.word 0x8994a0ae  ! 1066: WRPR_TICK_I	wrpr	%r18, 0x00ae, %tick
T3_asi_reg_wr_40:
	mov	0x29, %r14
	.word 0xf2f38e60  ! 1067: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_rd_48:
	mov	0x3c2, %r14
	.word 0xf8db8e60  ! 1071: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf62d8000  ! 1074: STB_R	stb	%r27, [%r22 + %r0]
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983a1a  ! 1077: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a1a, %hpstate
T3_asi_reg_rd_49:
	mov	0x2f, %r14
	.word 0xf6db89e0  ! 1081: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T3_asi_reg_wr_41:
	mov	0x14, %r14
	.word 0xf4f38e40  ! 1082: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
	.word 0xf8b50020  ! 1086: STHA_R	stha	%r28, [%r20 + %r0] 0x01
	.word 0xfa34e130  ! 1087: STH_I	sth	%r29, [%r19 + 0x0130]
	.word 0xfea5c020  ! 1088: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
cpu_intr_3_99:
	setx	0x250100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc75e0e8  ! 1092: STX_I	stx	%r30, [%r23 + 0x00e8]
T3_asi_reg_rd_50:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 1093: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_rd_51:
	mov	0x27, %r14
	.word 0xf8db89e0  ! 1098: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_100:
	setx	0x240233, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_52:
	mov	0x33, %r14
	.word 0xfcdb8e60  ! 1104: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfaf460b8  ! 1105: STXA_I	stxa	%r29, [%r17 + 0x00b8] %asi
	.word 0xfcad2121  ! 1106: STBA_I	stba	%r30, [%r20 + 0x0121] %asi
T3_asi_reg_wr_42:
	mov	0x24, %r14
	.word 0xf0f38e60  ! 1108: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_101:
	setx	0x26033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ad8020  ! 1110: STBA_R	stba	%r24, [%r22 + %r0] 0x01
	.word 0xf42d0000  ! 1111: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xfab54020  ! 1114: STHA_R	stha	%r29, [%r21 + %r0] 0x01
cpu_intr_3_102:
	setx	0x25031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf625e0e8  ! 1117: STW_I	stw	%r27, [%r23 + 0x00e8]
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 28)
	.word 0xf4b4c020  ! 1120: STHA_R	stha	%r26, [%r19 + %r0] 0x01
	.word 0xfa748000  ! 1124: STX_R	stx	%r29, [%r18 + %r0]
cpu_intr_3_103:
	setx	0x260335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ac0020  ! 1127: STBA_R	stba	%r27, [%r16 + %r0] 0x01
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_rd_53:
	mov	0x22, %r14
	.word 0xf6db8400  ! 1138: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf434c000  ! 1139: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xb8240000  ! 1140: SUB_R	sub 	%r16, %r0, %r28
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983b1a  ! 1142: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b1a, %hpstate
T3_asi_reg_wr_43:
	mov	0x38, %r14
	.word 0xfaf38e80  ! 1143: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL0
cpu_intr_3_104:
	setx	0x240315, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf22c8000  ! 1152: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xf4a4e033  ! 1153: STWA_I	stwa	%r26, [%r19 + 0x0033] %asi
T3_asi_reg_rd_54:
	mov	0x3c7, %r14
	.word 0xf8db84a0  ! 1155: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	ta	T_CHANGE_NONHPRIV
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 25)
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_105:
	setx	0x27032f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_wr_44:
	mov	0x2d, %r14
	.word 0xfcf38e60  ! 1169: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf8ad6059  ! 1174: STBA_I	stba	%r28, [%r21 + 0x0059] %asi
	.word 0xf025c000  ! 1176: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xbab40000  ! 1179: ORNcc_R	orncc 	%r16, %r0, %r29
	.word 0xfeb50020  ! 1180: STHA_R	stha	%r31, [%r20 + %r0] 0x01
cpu_intr_3_106:
	setx	0x26033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8ce1ad  ! 1186: ANDcc_I	andcc 	%r19, 0x01ad, %r30
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 8)
	.word 0xbe8d8000  ! 1194: ANDcc_R	andcc 	%r22, %r0, %r31
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 17)
	.word 0xf8746168  ! 1200: STX_I	stx	%r28, [%r17 + 0x0168]
	.word 0xf2250000  ! 1201: STW_R	stw	%r25, [%r20 + %r0]
	.word 0xf0b4611e  ! 1203: STHA_I	stha	%r24, [%r17 + 0x011e] %asi
	.word 0xfe75e04a  ! 1207: STX_I	stx	%r31, [%r23 + 0x004a]
T3_asi_reg_rd_55:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 1211: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_107:
	setx	0x270001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_rd_56:
	mov	0x11, %r14
	.word 0xf4db89e0  ! 1218: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf4b48020  ! 1219: STHA_R	stha	%r26, [%r18 + %r0] 0x01
	.word 0xfeb4c020  ! 1220: STHA_R	stha	%r31, [%r19 + %r0] 0x01
	.word 0xfea58020  ! 1222: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
	.word 0xf6a460df  ! 1225: STWA_I	stwa	%r27, [%r17 + 0x00df] %asi
cpu_intr_3_108:
	setx	0x260006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_wr_45:
	mov	0x3c8, %r14
	.word 0xf2f384a0  ! 1232: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf0f4a0f2  ! 1234: STXA_I	stxa	%r24, [%r18 + 0x00f2] %asi
	.word 0xba358000  ! 1236: ORN_R	orn 	%r22, %r0, %r29
	.word 0xf635a1fe  ! 1238: STH_I	sth	%r27, [%r22 + 0x01fe]
	.word 0xf82d8000  ! 1239: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xfc7461c5  ! 1241: STX_I	stx	%r30, [%r17 + 0x01c5]
	ta	T_CHANGE_HPRIV
	.word 0xf874e0a7  ! 1243: STX_I	stx	%r28, [%r19 + 0x00a7]
	.word 0xfcb48020  ! 1244: STHA_R	stha	%r30, [%r18 + %r0] 0x01
cpu_intr_3_109:
	setx	0x270305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, 35)
	.word 0xf8adc020  ! 1249: STBA_R	stba	%r28, [%r23 + %r0] 0x01
	.word 0xb42d2149  ! 1251: ANDN_I	andn 	%r20, 0x0149, %r26
	.word 0xf825a1e9  ! 1254: STW_I	stw	%r28, [%r22 + 0x01e9]
cpu_intr_3_110:
	setx	0x240316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf875a0fa  ! 1257: STX_I	stx	%r28, [%r22 + 0x00fa]
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, 2a)
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_wr_46:
	mov	0x18, %r14
	.word 0xf2f38e80  ! 1266: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_wr_47:
	mov	0x28, %r14
	.word 0xf6f38e80  ! 1269: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T3_asi_reg_rd_57:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 1272: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_111:
	setx	0x270002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_112:
	setx	0x26023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe24c000  ! 1283: SUB_R	sub 	%r19, %r0, %r31
	.word 0xf6744000  ! 1284: STX_R	stx	%r27, [%r17 + %r0]
T3_asi_reg_rd_58:
	mov	0x30, %r14
	.word 0xfcdb8e60  ! 1285: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf6246124  ! 1289: STW_I	stw	%r27, [%r17 + 0x0124]
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, 3a)
	.word 0xb00d21d5  ! 1293: AND_I	and 	%r20, 0x01d5, %r24
T3_asi_reg_rd_59:
	mov	0x3c6, %r14
	.word 0xf0db8400  ! 1295: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 7)
	.word 0xb5355000  ! 1301: SRLX_R	srlx	%r21, %r0, %r26
cpu_intr_3_113:
	setx	0x240102, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_60:
	mov	0x35, %r14
	.word 0xf6db8e40  ! 1303: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_rd_61:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 1304: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbeb40000  ! 1305: ORNcc_R	orncc 	%r16, %r0, %r31
cpu_intr_3_114:
	setx	0x250128, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_48:
	mov	0x1f, %r14
	.word 0xf0f38e40  ! 1309: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfe2da125  ! 1311: STB_I	stb	%r31, [%r22 + 0x0125]
cpu_intr_3_115:
	setx	0x270314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b44020  ! 1319: STHA_R	stha	%r28, [%r17 + %r0] 0x01
T3_asi_reg_wr_49:
	mov	0x3c5, %r14
	.word 0xf8f38e60  ! 1321: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_3_116:
	setx	0x27030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_62:
	mov	0x21, %r14
	.word 0xf2db8e40  ! 1323: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_rd_63:
	mov	0x3c2, %r14
	.word 0xfadb89e0  ! 1324: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982c88  ! 1325: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c88, %hpstate
cpu_intr_3_117:
	setx	0x270225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 1e)
	ta	T_CHANGE_TO_TL0
	.word 0xfe35e0d7  ! 1338: STH_I	sth	%r31, [%r23 + 0x00d7]
cpu_intr_3_118:
	setx	0x27032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b4c020  ! 1340: STHA_R	stha	%r25, [%r19 + %r0] 0x01
T3_asi_reg_rd_64:
	mov	0x5, %r14
	.word 0xfcdb84a0  ! 1341: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_3_119:
	setx	0x240334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b5a0e4  ! 1348: STHA_I	stha	%r24, [%r22 + 0x00e4] %asi
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_65:
	mov	0x2f, %r14
	.word 0xf4db8e40  ! 1350: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbf3d6001  ! 1352: SRA_I	sra 	%r21, 0x0001, %r31
	.word 0xf0a54020  ! 1353: STWA_R	stwa	%r24, [%r21 + %r0] 0x01
	.word 0xfc34a043  ! 1354: STH_I	sth	%r30, [%r18 + 0x0043]
	.word 0xbc9c8000  ! 1355: XORcc_R	xorcc 	%r18, %r0, %r30
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 39)
	.word 0xfe74c000  ! 1359: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xbeb48000  ! 1360: SUBCcc_R	orncc 	%r18, %r0, %r31
	.word 0xf625c000  ! 1369: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xb9500000  ! 1370: RDPR_TPC	rdpr	%tpc, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_120:
	setx	0x250224, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_66:
	mov	0xa, %r14
	.word 0xf2db89e0  ! 1374: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfea521ff  ! 1375: STWA_I	stwa	%r31, [%r20 + 0x01ff] %asi
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 5)
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_rd_67:
	mov	0x3c1, %r14
	.word 0xfadb89e0  ! 1382: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfe74e164  ! 1384: STX_I	stx	%r31, [%r19 + 0x0164]
	.word 0xf8b40020  ! 1387: STHA_R	stha	%r28, [%r16 + %r0] 0x01
	.word 0xfcb40020  ! 1388: STHA_R	stha	%r30, [%r16 + %r0] 0x01
	.word 0xfa25a150  ! 1389: STW_I	stw	%r29, [%r22 + 0x0150]
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_wr_50:
	mov	0xe, %r14
	.word 0xfef389e0  ! 1392: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_3_121:
	setx	0x290204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_rd_68:
	mov	0x19, %r14
	.word 0xf4db89e0  ! 1398: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf8a5606d  ! 1400: STWA_I	stwa	%r28, [%r21 + 0x006d] %asi
	.word 0xb834e1dc  ! 1401: SUBC_I	orn 	%r19, 0x01dc, %r28
	.word 0xfeb4a121  ! 1404: STHA_I	stha	%r31, [%r18 + 0x0121] %asi
	.word 0xf8ac61f4  ! 1406: STBA_I	stba	%r28, [%r17 + 0x01f4] %asi
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 14)
	.word 0xf0acc020  ! 1409: STBA_R	stba	%r24, [%r19 + %r0] 0x01
T3_asi_reg_wr_51:
	mov	0x30, %r14
	.word 0xf2f38400  ! 1410: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_3_122:
	setx	0x29021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ad0020  ! 1412: STBA_R	stba	%r24, [%r20 + %r0] 0x01
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_123:
	setx	0x290136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02d6035  ! 1420: STB_I	stb	%r24, [%r21 + 0x0035]
	ta	T_CHANGE_TO_TL0
	.word 0xfaac2180  ! 1424: STBA_I	stba	%r29, [%r16 + 0x0180] %asi
	.word 0xf02d8000  ! 1426: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xf6a5e083  ! 1427: STWA_I	stwa	%r27, [%r23 + 0x0083] %asi
T3_asi_reg_rd_69:
	mov	0x2b, %r14
	.word 0xf0db8e60  ! 1428: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T3_asi_reg_rd_70:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 1429: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 26)
	.word 0xfe746161  ! 1435: STX_I	stx	%r31, [%r17 + 0x0161]
T3_asi_reg_wr_52:
	mov	0x4, %r14
	.word 0xf4f38e40  ! 1436: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_rd_71:
	mov	0x37, %r14
	.word 0xf6db8400  ! 1438: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf6a48020  ! 1440: STWA_R	stwa	%r27, [%r18 + %r0] 0x01
	.word 0xf4b561a6  ! 1444: STHA_I	stha	%r26, [%r21 + 0x01a6] %asi
	.word 0xfaf521df  ! 1445: STXA_I	stxa	%r29, [%r20 + 0x01df] %asi
T3_asi_reg_wr_53:
	mov	0x1a, %r14
	.word 0xfcf38e40  ! 1446: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_rd_72:
	mov	0x2, %r14
	.word 0xf2db8e60  ! 1447: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_3_124:
	setx	0x290322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf624c000  ! 1453: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xf025e150  ! 1454: STW_I	stw	%r24, [%r23 + 0x0150]
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_125:
	setx	0x280027, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_54:
	mov	0x0, %r14
	.word 0xf0f38400  ! 1457: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_126:
	setx	0x28031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f4e111  ! 1461: STXA_I	stxa	%r24, [%r19 + 0x0111] %asi
	.word 0xa1902001  ! 1466: WRPR_GL_I	wrpr	%r0, 0x0001, %-
T3_asi_reg_wr_55:
	mov	0x3c0, %r14
	.word 0xfef38400  ! 1467: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 4)
cpu_intr_3_127:
	setx	0x28010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_73:
	mov	0xc, %r14
	.word 0xf0db8e80  ! 1479: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfe258000  ! 1480: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xfe252116  ! 1481: STW_I	stw	%r31, [%r20 + 0x0116]
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_wr_56:
	mov	0x7, %r14
	.word 0xf6f384a0  ! 1485: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb52d9000  ! 1486: SLLX_R	sllx	%r22, %r0, %r26
cpu_intr_3_128:
	setx	0x2a0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82d4000  ! 1488: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xf6adc020  ! 1489: STBA_R	stba	%r27, [%r23 + %r0] 0x01
	.word 0xb8140000  ! 1490: OR_R	or 	%r16, %r0, %r28
cpu_intr_3_129:
	setx	0x280027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_130:
	setx	0x2a0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f5e195  ! 1498: STXA_I	stxa	%r28, [%r23 + 0x0195] %asi
T3_asi_reg_rd_74:
	mov	0x3c1, %r14
	.word 0xfcdb89e0  ! 1501: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_131:
	setx	0x28031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf234e040  ! 1505: STH_I	sth	%r25, [%r19 + 0x0040]
cpu_intr_3_132:
	setx	0x2b0113, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_133:
	setx	0x290124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_134:
	setx	0x28000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, c)
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819838c2  ! 1517: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c2, %hpstate
	.word 0xf0acc020  ! 1518: STBA_R	stba	%r24, [%r19 + %r0] 0x01
	.word 0xbf3d8000  ! 1519: SRA_R	sra 	%r22, %r0, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xb80d8000  ! 1523: AND_R	and 	%r22, %r0, %r28
cpu_intr_3_135:
	setx	0x290108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f4a1f7  ! 1525: STXA_I	stxa	%r28, [%r18 + 0x01f7] %asi
	.word 0xf6ac6092  ! 1526: STBA_I	stba	%r27, [%r17 + 0x0092] %asi
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_136:
	setx	0x2b000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca5a1c9  ! 1532: STWA_I	stwa	%r30, [%r22 + 0x01c9] %asi
	.word 0xf8354000  ! 1533: STH_R	sth	%r28, [%r21 + %r0]
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_wr_57:
	mov	0x1b, %r14
	.word 0xf4f384a0  ! 1535: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf2f5e118  ! 1537: STXA_I	stxa	%r25, [%r23 + 0x0118] %asi
	.word 0xb88da0ce  ! 1538: ANDcc_I	andcc 	%r22, 0x00ce, %r28
cpu_intr_3_137:
	setx	0x290230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b42134  ! 1541: STHA_I	stha	%r27, [%r16 + 0x0134] %asi
	.word 0xf8a52140  ! 1542: STWA_I	stwa	%r28, [%r20 + 0x0140] %asi
	.word 0xf0340000  ! 1543: STH_R	sth	%r24, [%r16 + %r0]
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 1c)
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x8198294a  ! 1545: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094a, %hpstate
	.word 0xf4b421f7  ! 1547: STHA_I	stha	%r26, [%r16 + 0x01f7] %asi
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 39)
	.word 0xf035e144  ! 1549: STH_I	sth	%r24, [%r23 + 0x0144]
	.word 0xf8aca1b8  ! 1551: STBA_I	stba	%r28, [%r18 + 0x01b8] %asi
T3_asi_reg_wr_58:
	mov	0x16, %r14
	.word 0xf2f38e40  ! 1554: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_138:
	setx	0x2a033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_59:
	mov	0x18, %r14
	.word 0xfef384a0  ! 1560: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T3_asi_reg_wr_60:
	mov	0x3c7, %r14
	.word 0xf2f38e80  ! 1561: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_rd_75:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 1562: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf4ade1ae  ! 1564: STBA_I	stba	%r26, [%r23 + 0x01ae] %asi
	.word 0xfe742159  ! 1567: STX_I	stx	%r31, [%r16 + 0x0159]
	.word 0xf42dc000  ! 1568: STB_R	stb	%r26, [%r23 + %r0]
cpu_intr_3_139:
	setx	0x29002f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_140:
	setx	0x290202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_141:
	setx	0x28022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_142:
	setx	0x2b0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0254000  ! 1577: STW_R	stw	%r24, [%r21 + %r0]
T3_asi_reg_wr_61:
	mov	0xf, %r14
	.word 0xf6f384a0  ! 1578: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982808  ! 1579: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0808, %hpstate
	.word 0xbd7ce401  ! 1581: MOVR_I	movre	%r19, 0x1, %r30
	.word 0xb43d0000  ! 1582: XNOR_R	xnor 	%r20, %r0, %r26
	.word 0xf23520ed  ! 1584: STH_I	sth	%r25, [%r20 + 0x00ed]
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 21)
cpu_intr_3_143:
	setx	0x2b033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_144:
	setx	0x2b0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcac0020  ! 1592: STBA_R	stba	%r30, [%r16 + %r0] 0x01
	.word 0xb950c000  ! 1593: RDPR_TT	rdpr	%tt, %r28
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 30)
	.word 0xf034a077  ! 1597: STH_I	sth	%r24, [%r18 + 0x0077]
T3_asi_reg_wr_62:
	mov	0x3c1, %r14
	.word 0xf4f38e80  ! 1598: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_3_145:
	setx	0x290002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f5a0c3  ! 1605: STXA_I	stxa	%r24, [%r22 + 0x00c3] %asi
	.word 0xbc2cc000  ! 1606: ANDN_R	andn 	%r19, %r0, %r30
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_wr_63:
	mov	0x3c8, %r14
	.word 0xfcf389e0  ! 1610: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb415e072  ! 1613: OR_I	or 	%r23, 0x0072, %r26
T3_asi_reg_wr_64:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 1615: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf4aca0a9  ! 1616: STBA_I	stba	%r26, [%r18 + 0x00a9] %asi
T3_asi_reg_wr_65:
	mov	0x3c1, %r14
	.word 0xf2f384a0  ! 1623: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0x89946182  ! 1629: WRPR_TICK_I	wrpr	%r17, 0x0182, %tick
	.word 0xbcbdc000  ! 1632: XNORcc_R	xnorcc 	%r23, %r0, %r30
	.word 0xbd7dc400  ! 1636: MOVR_R	movre	%r23, %r0, %r30
	.word 0xf6b58020  ! 1637: STHA_R	stha	%r27, [%r22 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_66:
	mov	0x13, %r14
	.word 0xf4f38e80  ! 1644: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf674e0e4  ! 1646: STX_I	stx	%r27, [%r19 + 0x00e4]
	.word 0xf2f4a199  ! 1649: STXA_I	stxa	%r25, [%r18 + 0x0199] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_67:
	mov	0x19, %r14
	.word 0xf4f38e40  ! 1651: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb6b44000  ! 1654: SUBCcc_R	orncc 	%r17, %r0, %r27
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, 25)
	.word 0xb63521e6  ! 1657: ORN_I	orn 	%r20, 0x01e6, %r27
	.word 0xfca5e127  ! 1659: STWA_I	stwa	%r30, [%r23 + 0x0127] %asi
cpu_intr_3_146:
	setx	0x2a021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeace1cf  ! 1662: STBA_I	stba	%r31, [%r19 + 0x01cf] %asi
T3_asi_reg_rd_76:
	mov	0x33, %r14
	.word 0xf4db84a0  ! 1663: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf8b4e149  ! 1664: STHA_I	stha	%r28, [%r19 + 0x0149] %asi
	.word 0xf4ac211d  ! 1665: STBA_I	stba	%r26, [%r16 + 0x011d] %asi
cpu_intr_3_147:
	setx	0x2b013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_77:
	mov	0xa, %r14
	.word 0xfadb84a0  ! 1668: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfaf46109  ! 1669: STXA_I	stxa	%r29, [%r17 + 0x0109] %asi
	.word 0xb48d4000  ! 1671: ANDcc_R	andcc 	%r21, %r0, %r26
	.word 0xbabd218f  ! 1672: XNORcc_I	xnorcc 	%r20, 0x018f, %r29
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_148:
	setx	0x29030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca54020  ! 1677: STWA_R	stwa	%r30, [%r21 + %r0] 0x01
	.word 0xfaf521a2  ! 1679: STXA_I	stxa	%r29, [%r20 + 0x01a2] %asi
T3_asi_reg_rd_78:
	mov	0x3c1, %r14
	.word 0xfcdb84a0  ! 1681: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf82420ff  ! 1682: STW_I	stw	%r28, [%r16 + 0x00ff]
cpu_intr_3_149:
	setx	0x2b013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a4e0df  ! 1685: STWA_I	stwa	%r27, [%r19 + 0x00df] %asi
	.word 0xfc2cc000  ! 1686: STB_R	stb	%r30, [%r19 + %r0]
cpu_intr_3_150:
	setx	0x28020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_68:
	mov	0x13, %r14
	.word 0xfaf389e0  ! 1693: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf0ad0020  ! 1695: STBA_R	stba	%r24, [%r20 + %r0] 0x01
	.word 0xfa35c000  ! 1700: STH_R	sth	%r29, [%r23 + %r0]
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982f10  ! 1702: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f10, %hpstate
T3_asi_reg_rd_79:
	mov	0x31, %r14
	.word 0xfcdb8e60  ! 1703: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf2340000  ! 1705: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xfead6139  ! 1706: STBA_I	stba	%r31, [%r21 + 0x0139] %asi
	.word 0xfeac619f  ! 1707: STBA_I	stba	%r31, [%r17 + 0x019f] %asi
	.word 0xf4740000  ! 1709: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xf4ac4020  ! 1710: STBA_R	stba	%r26, [%r17 + %r0] 0x01
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_rd_80:
	mov	0x23, %r14
	.word 0xf6db8e40  ! 1713: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfea54020  ! 1714: STWA_R	stwa	%r31, [%r21 + %r0] 0x01
T3_asi_reg_rd_81:
	mov	0x18, %r14
	.word 0xf6db8e60  ! 1715: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_3_151:
	setx	0x2a0105, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 21)
cpu_intr_3_152:
	setx	0x280302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a42111  ! 1728: STWA_I	stwa	%r28, [%r16 + 0x0111] %asi
cpu_intr_3_153:
	setx	0x2b0226, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_69:
	mov	0x0, %r14
	.word 0xf0f38e80  ! 1737: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_3_154:
	setx	0x280019, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983c40  ! 1740: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c40, %hpstate
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_wr_70:
	mov	0x3c7, %r14
	.word 0xf2f384a0  ! 1744: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982d52  ! 1745: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d52, %hpstate
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983cd8  ! 1746: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd8, %hpstate
T3_asi_reg_wr_71:
	mov	0x17, %r14
	.word 0xfaf38e40  ! 1747: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb28cc000  ! 1751: ANDcc_R	andcc 	%r19, %r0, %r25
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x8198380a  ! 1755: WRHPR_HPSTATE_I	wrhpr	%r0, 0x180a, %hpstate
	.word 0xfa35c000  ! 1756: STH_R	sth	%r29, [%r23 + %r0]
	.word 0xfe740000  ! 1759: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xf67460cb  ! 1762: STX_I	stx	%r27, [%r17 + 0x00cb]
	.word 0xfe25a099  ! 1766: STW_I	stw	%r31, [%r22 + 0x0099]
	ta	T_CHANGE_TO_TL0
	.word 0xfeac2068  ! 1772: STBA_I	stba	%r31, [%r16 + 0x0068] %asi
	.word 0xfa34609f  ! 1774: STH_I	sth	%r29, [%r17 + 0x009f]
	.word 0xb934f001  ! 1776: SRLX_I	srlx	%r19, 0x0001, %r28
	.word 0xf82cc000  ! 1781: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xf0344000  ! 1783: STH_R	sth	%r24, [%r17 + %r0]
T3_asi_reg_rd_82:
	mov	0xd, %r14
	.word 0xf2db8e40  ! 1785: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfea40020  ! 1786: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
cpu_intr_3_155:
	setx	0x280333, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_156:
	setx	0x29021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62c4000  ! 1793: STB_R	stb	%r27, [%r17 + %r0]
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983890  ! 1794: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1890, %hpstate
	.word 0xf435c000  ! 1799: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xfeac61db  ! 1801: STBA_I	stba	%r31, [%r17 + 0x01db] %asi
T3_asi_reg_rd_83:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 1806: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_157:
	setx	0x2a022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xb48ce15e  ! 1819: ANDcc_I	andcc 	%r19, 0x015e, %r26
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, a)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf074c000  ! 1826: STX_R	stx	%r24, [%r19 + %r0]
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982e4a  ! 1827: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4a, %hpstate
	.word 0xfea4e09a  ! 1830: STWA_I	stwa	%r31, [%r19 + 0x009a] %asi
T3_asi_reg_rd_84:
	mov	0x3c6, %r14
	.word 0xfadb8400  ! 1831: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf4b54020  ! 1834: STHA_R	stha	%r26, [%r21 + %r0] 0x01
	.word 0xf0b4c020  ! 1835: STHA_R	stha	%r24, [%r19 + %r0] 0x01
cpu_intr_3_158:
	setx	0x2d0034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_159:
	setx	0x2f033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 3e)
	.word 0xb12d3001  ! 1842: SLLX_I	sllx	%r20, 0x0001, %r24
	ta	T_CHANGE_TO_TL1
cpu_intr_3_160:
	setx	0x2e0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeac8020  ! 1849: STBA_R	stba	%r31, [%r18 + %r0] 0x01
T3_asi_reg_rd_85:
	mov	0x7, %r14
	.word 0xf6db84a0  ! 1850: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb5346001  ! 1851: SRL_I	srl 	%r17, 0x0001, %r26
	.word 0xfaad0020  ! 1855: STBA_R	stba	%r29, [%r20 + %r0] 0x01
	.word 0xfeb560d2  ! 1856: STHA_I	stha	%r31, [%r21 + 0x00d2] %asi
cpu_intr_3_161:
	setx	0x2f030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_162:
	setx	0x2d0034, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_86:
	mov	0x6, %r14
	.word 0xfcdb89e0  ! 1860: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfe34a1de  ! 1861: STH_I	sth	%r31, [%r18 + 0x01de]
T3_asi_reg_rd_87:
	mov	0x3, %r14
	.word 0xfedb8e40  ! 1866: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_163:
	setx	0x2c0333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead2085  ! 1872: STBA_I	stba	%r31, [%r20 + 0x0085] %asi
T3_asi_reg_wr_72:
	mov	0x7, %r14
	.word 0xfef38e80  ! 1875: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T3_asi_reg_wr_73:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 1878: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_164:
	setx	0x2e0238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_rd_88:
	mov	0x6, %r14
	.word 0xfedb84a0  ! 1883: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf8a4c020  ! 1884: STWA_R	stwa	%r28, [%r19 + %r0] 0x01
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 2)
cpu_intr_3_165:
	setx	0x2d003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_74:
	mov	0x3c0, %r14
	.word 0xf2f38e80  ! 1887: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf8344000  ! 1888: STH_R	sth	%r28, [%r17 + %r0]
cpu_intr_3_166:
	setx	0x2f0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 1892: MOVcc_I	<illegal instruction>
cpu_intr_3_167:
	setx	0x2c011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b5c020  ! 1896: STHA_R	stha	%r27, [%r23 + %r0] 0x01
	.word 0xf4f460a2  ! 1897: STXA_I	stxa	%r26, [%r17 + 0x00a2] %asi
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf8340000  ! 1904: STH_R	sth	%r28, [%r16 + %r0]
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983b98  ! 1905: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b98, %hpstate
	.word 0xf034e181  ! 1907: STH_I	sth	%r24, [%r19 + 0x0181]
	ta	T_CHANGE_NONHPRIV
	.word 0xf8b58020  ! 1909: STHA_R	stha	%r28, [%r22 + %r0] 0x01
	.word 0xfa748000  ! 1910: STX_R	stx	%r29, [%r18 + %r0]
T3_asi_reg_rd_89:
	mov	0x1b, %r14
	.word 0xf8db8e80  ! 1911: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbc4420d2  ! 1914: ADDC_I	addc 	%r16, 0x00d2, %r30
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 25)
	.word 0xf02c0000  ! 1916: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xbec40000  ! 1919: ADDCcc_R	addccc 	%r16, %r0, %r31
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 3c)
cpu_intr_3_168:
	setx	0x2f032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 1927: RDPR_TL	rdpr	%tl, %r31
	.word 0xf6ad21ca  ! 1930: STBA_I	stba	%r27, [%r20 + 0x01ca] %asi
	.word 0xfa2dc000  ! 1931: STB_R	stb	%r29, [%r23 + %r0]
cpu_intr_3_169:
	setx	0x2d0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1340000  ! 1934: SRL_R	srl 	%r16, %r0, %r24
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf8a5a1d1  ! 1945: STWA_I	stwa	%r28, [%r22 + 0x01d1] %asi
cpu_intr_3_170:
	setx	0x30038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_171:
	setx	0x2e0104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_172:
	setx	0x2c0002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_wr_75:
	mov	0x3c4, %r14
	.word 0xfef384a0  ! 1951: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf8a52136  ! 1952: STWA_I	stwa	%r28, [%r20 + 0x0136] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf82de127  ! 1961: STB_I	stb	%r28, [%r23 + 0x0127]
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, 36)
	.word 0xf035e1e5  ! 1971: STH_I	sth	%r24, [%r23 + 0x01e5]
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982cc0  ! 1973: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc0, %hpstate
cpu_intr_3_173:
	setx	0x2c010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xb0c5c000  ! 1978: ADDCcc_R	addccc 	%r23, %r0, %r24
cpu_intr_3_174:
	setx	0x2f001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62ce09e  ! 1980: STB_I	stb	%r27, [%r19 + 0x009e]
T3_asi_reg_rd_90:
	mov	0x8, %r14
	.word 0xf4db84a0  ! 1981: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T3_asi_reg_wr_76:
	mov	0xc, %r14
	.word 0xf0f389e0  ! 1982: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, d)
	.word 0xf674c000  ! 1986: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xfcadc020  ! 1988: STBA_R	stba	%r30, [%r23 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfcf46056  ! 1990: STXA_I	stxa	%r30, [%r17 + 0x0056] %asi
T3_asi_reg_rd_91:
	mov	0x19, %r14
	.word 0xfadb84a0  ! 1991: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x819838c2  ! 1992: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c2, %hpstate
T3_asi_reg_rd_92:
	mov	0x3c2, %r14
	.word 0xf6db8e60  ! 1993: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T3_asi_reg_wr_77:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 1995: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_rd_93:
	mov	0x2d, %r14
	.word 0xf2db8e40  ! 2001: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 1e)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe24a0ee  ! 2005: STW_I	stw	%r31, [%r18 + 0x00ee]
	.word 0xbeb44000  ! 2010: SUBCcc_R	orncc 	%r17, %r0, %r31
	.word 0xb0a40000  ! 2011: SUBcc_R	subcc 	%r16, %r0, %r24
T3_asi_reg_wr_78:
	mov	0x3c6, %r14
	.word 0xf4f389e0  ! 2012: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf8a561fb  ! 2013: STWA_I	stwa	%r28, [%r21 + 0x01fb] %asi
	.word 0xf82d4000  ! 2014: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xf274e079  ! 2016: STX_I	stx	%r25, [%r19 + 0x0079]
	.word 0xf835a0e3  ! 2017: STH_I	sth	%r28, [%r22 + 0x00e3]
	.word 0xfa75219c  ! 2020: STX_I	stx	%r29, [%r20 + 0x019c]
cpu_intr_3_175:
	setx	0x2e000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983d10  ! 2027: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d10, %hpstate
cpu_intr_3_176:
	setx	0x2d001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe35e04e  ! 2029: SUBC_I	orn 	%r23, 0x004e, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_79:
	mov	0x3c4, %r14
	.word 0xf2f389e0  ! 2033: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_3_177:
	setx	0x2f0108, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_80:
	mov	0x34, %r14
	.word 0xfcf389e0  ! 2039: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf42d0000  ! 2044: STB_R	stb	%r26, [%r20 + %r0]
cpu_intr_3_178:
	setx	0x2c022d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 36)
	.word 0xf435609d  ! 2049: STH_I	sth	%r26, [%r21 + 0x009d]
T3_asi_reg_rd_94:
	mov	0x3c6, %r14
	.word 0xf0db8e60  ! 2052: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbc154000  ! 2055: OR_R	or 	%r21, %r0, %r30
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_179:
	setx	0x2d0125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_rd_95:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 2061: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf2f4a118  ! 2064: STXA_I	stxa	%r25, [%r18 + 0x0118] %asi
	.word 0xbea48000  ! 2065: SUBcc_R	subcc 	%r18, %r0, %r31
	.word 0xf0748000  ! 2066: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xf6758000  ! 2068: STX_R	stx	%r27, [%r22 + %r0]
T3_asi_reg_wr_81:
	mov	0x32, %r14
	.word 0xfcf384a0  ! 2069: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf8246189  ! 2073: STW_I	stw	%r28, [%r17 + 0x0189]
	.word 0xfe2d0000  ! 2077: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xf2a40020  ! 2078: STWA_R	stwa	%r25, [%r16 + %r0] 0x01
	.word 0xf4a520c6  ! 2081: STWA_I	stwa	%r26, [%r20 + 0x00c6] %asi
cpu_intr_3_180:
	setx	0x2e0211, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_96:
	mov	0x4, %r14
	.word 0xfedb89e0  ! 2087: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T3_asi_reg_rd_97:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 2088: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982c1a  ! 2089: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1a, %hpstate
	.word 0xf275c000  ! 2092: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xf47521b1  ! 2095: STX_I	stx	%r26, [%r20 + 0x01b1]
	.word 0xf0b460a7  ! 2098: STHA_I	stha	%r24, [%r17 + 0x00a7] %asi
	.word 0xf0a54020  ! 2104: STWA_R	stwa	%r24, [%r21 + %r0] 0x01
cpu_intr_3_181:
	setx	0x2c0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca40000  ! 2106: SUBcc_R	subcc 	%r16, %r0, %r30
	.word 0xf435e01a  ! 2107: STH_I	sth	%r26, [%r23 + 0x001a]
T3_asi_reg_wr_82:
	mov	0x3c4, %r14
	.word 0xf8f38e60  ! 2108: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T3_asi_reg_rd_98:
	mov	0x27, %r14
	.word 0xfadb8e80  ! 2109: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T3_asi_reg_rd_99:
	mov	0x3c3, %r14
	.word 0xf0db8e80  ! 2111: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 1)
	.word 0xf6246078  ! 2113: STW_I	stw	%r27, [%r17 + 0x0078]
T3_asi_reg_rd_100:
	mov	0x2d, %r14
	.word 0xf4db8e80  ! 2114: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_wr_83:
	mov	0x3c1, %r14
	.word 0xf8f38e60  ! 2115: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbcc4a126  ! 2118: ADDCcc_I	addccc 	%r18, 0x0126, %r30
	.word 0xf8a40020  ! 2119: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
	.word 0xf0a54020  ! 2122: STWA_R	stwa	%r24, [%r21 + %r0] 0x01
cpu_intr_3_182:
	setx	0x2f0015, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_101:
	mov	0x3c5, %r14
	.word 0xfcdb8e60  ! 2124: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbe3ca118  ! 2126: XNOR_I	xnor 	%r18, 0x0118, %r31
	.word 0xfeac8020  ! 2132: STBA_R	stba	%r31, [%r18 + %r0] 0x01
cpu_intr_3_183:
	setx	0x2c003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0c4e106  ! 2141: ADDCcc_I	addccc 	%r19, 0x0106, %r24
cpu_intr_3_184:
	setx	0x2e011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 15)
	.word 0xf4ac4020  ! 2148: STBA_R	stba	%r26, [%r17 + %r0] 0x01
	.word 0xf0a44020  ! 2149: STWA_R	stwa	%r24, [%r17 + %r0] 0x01
	.word 0xb82de1f2  ! 2153: ANDN_I	andn 	%r23, 0x01f2, %r28
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 20)
	.word 0xf27421ab  ! 2158: STX_I	stx	%r25, [%r16 + 0x01ab]
	.word 0xfaa44020  ! 2159: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
	.word 0xb8bd4000  ! 2161: XNORcc_R	xnorcc 	%r21, %r0, %r28
	.word 0xf0f520f9  ! 2166: STXA_I	stxa	%r24, [%r20 + 0x00f9] %asi
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_wr_84:
	mov	0xa, %r14
	.word 0xfef389e0  ! 2172: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbb3c5000  ! 2173: SRAX_R	srax	%r17, %r0, %r29
	.word 0xfe254000  ! 2174: STW_R	stw	%r31, [%r21 + %r0]
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_wr_85:
	mov	0x1, %r14
	.word 0xf8f38e40  ! 2177: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfcb56095  ! 2178: STHA_I	stha	%r30, [%r21 + 0x0095] %asi
T3_asi_reg_wr_86:
	mov	0x3, %r14
	.word 0xf8f38e80  ! 2179: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T3_asi_reg_wr_87:
	mov	0x31, %r14
	.word 0xf0f38e60  ! 2184: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_185:
	setx	0x2c0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bde030  ! 2187: XNORcc_I	xnorcc 	%r23, 0x0030, %r28
	.word 0xf4358000  ! 2188: STH_R	sth	%r26, [%r22 + %r0]
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, 2f)
	ta	T_CHANGE_HPRIV
cpu_intr_3_186:
	setx	0x2d000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb094c000  ! 2199: ORcc_R	orcc 	%r19, %r0, %r24
cpu_intr_3_187:
	setx	0x2e012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_188:
	setx	0x2e0011, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_189:
	setx	0x2c0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d0000  ! 2206: STB_R	stb	%r31, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 33)
	.word 0xfca42023  ! 2211: STWA_I	stwa	%r30, [%r16 + 0x0023] %asi
	.word 0xf875610e  ! 2212: STX_I	stx	%r28, [%r21 + 0x010e]
	.word 0xbc4560dc  ! 2213: ADDC_I	addc 	%r21, 0x00dc, %r30
	.word 0xfaad8020  ! 2214: STBA_R	stba	%r29, [%r22 + %r0] 0x01
	.word 0xf6ad8020  ! 2215: STBA_R	stba	%r27, [%r22 + %r0] 0x01
	.word 0xb0850000  ! 2216: ADDcc_R	addcc 	%r20, %r0, %r24
	ta	T_CHANGE_TO_TL1
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982900  ! 2222: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0900, %hpstate
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982dca  ! 2223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dca, %hpstate
T3_asi_reg_rd_102:
	mov	0x1e, %r14
	.word 0xfadb89e0  ! 2224: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_wr_88:
	mov	0x3c7, %r14
	.word 0xfef38e80  ! 2226: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_3_190:
	setx	0x2f001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c4615a  ! 2228: ADDCcc_I	addccc 	%r17, 0x015a, %r28
T3_asi_reg_wr_89:
	mov	0x2e, %r14
	.word 0xfcf38400  ! 2230: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_rd_103:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 2233: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_191:
	setx	0x2c032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_104:
	mov	0x2e, %r14
	.word 0xfedb8400  ! 2237: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T3_asi_reg_rd_105:
	mov	0x38, %r14
	.word 0xf8db8e40  ! 2238: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb29460e7  ! 2239: ORcc_I	orcc 	%r17, 0x00e7, %r25
	.word 0xf0b50020  ! 2240: STHA_R	stha	%r24, [%r20 + %r0] 0x01
	.word 0xf0356047  ! 2241: STH_I	sth	%r24, [%r21 + 0x0047]
cpu_intr_3_192:
	setx	0x2e001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a421d1  ! 2249: STWA_I	stwa	%r24, [%r16 + 0x01d1] %asi
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_wr_90:
	mov	0x1e, %r14
	.word 0xfcf384a0  ! 2251: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf074c000  ! 2253: STX_R	stx	%r24, [%r19 + %r0]
T3_asi_reg_rd_106:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 2254: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983e9a  ! 2255: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e9a, %hpstate
	.word 0xf0b5a158  ! 2258: STHA_I	stha	%r24, [%r22 + 0x0158] %asi
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, b)
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_193:
	setx	0x2c0012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_194:
	setx	0x2e021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 2263: RDPR_TL	rdpr	%tl, %r31
T3_asi_reg_rd_107:
	mov	0x3c7, %r14
	.word 0xf8db89e0  ! 2264: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 38)
	.word 0xf435e05b  ! 2270: STH_I	sth	%r26, [%r23 + 0x005b]
cpu_intr_3_195:
	setx	0x2c0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb504000  ! 2273: RDPR_TNPC	<illegal instruction>
	.word 0xfaa420df  ! 2274: STWA_I	stwa	%r29, [%r16 + 0x00df] %asi
	.word 0xfeade064  ! 2275: STBA_I	stba	%r31, [%r23 + 0x0064] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_196:
	setx	0x2c021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ac4020  ! 2281: STBA_R	stba	%r26, [%r17 + %r0] 0x01
	.word 0xf2a5e093  ! 2283: STWA_I	stwa	%r25, [%r23 + 0x0093] %asi
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, 24)
	ta	T_CHANGE_TO_TL1
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_rd_108:
	mov	0x16, %r14
	.word 0xf8db8e60  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf075619f  ! 2291: STX_I	stx	%r24, [%r21 + 0x019f]
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_91:
	mov	0x3c4, %r14
	.word 0xf8f38400  ! 2293: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL1
cpu_intr_3_197:
	setx	0x31023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a521b0  ! 2300: SUBcc_I	subcc 	%r20, 0x01b0, %r26
	.word 0xfc34e009  ! 2301: STH_I	sth	%r30, [%r19 + 0x0009]
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_109:
	mov	0x3c3, %r14
	.word 0xf4db89e0  ! 2303: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T3_asi_reg_rd_110:
	mov	0x3c3, %r14
	.word 0xf4db8400  ! 2305: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfc75a140  ! 2306: STX_I	stx	%r30, [%r22 + 0x0140]
cpu_intr_3_198:
	setx	0x31013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa754000  ! 2309: STX_R	stx	%r29, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_111:
	mov	0x14, %r14
	.word 0xf6db84a0  ! 2314: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_199:
	setx	0x33013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_92:
	mov	0xd, %r14
	.word 0xf8f38e40  ! 2320: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_wr_93:
	mov	0x6, %r14
	.word 0xf0f38e80  ! 2324: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_200:
	setx	0x310032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b5c000  ! 2331: SUBCcc_R	orncc 	%r23, %r0, %r28
	ta	T_CHANGE_TO_TL0
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, 2)
	.word 0xf0758000  ! 2336: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xf4ad614e  ! 2337: STBA_I	stba	%r26, [%r21 + 0x014e] %asi
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfaad0020  ! 2343: STBA_R	stba	%r29, [%r20 + %r0] 0x01
	.word 0xf8ac0020  ! 2344: STBA_R	stba	%r28, [%r16 + %r0] 0x01
	.word 0xb82520ea  ! 2345: SUB_I	sub 	%r20, 0x00ea, %r28
cpu_intr_3_201:
	setx	0x300225, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_94:
	mov	0x38, %r14
	.word 0xf6f38400  ! 2347: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 15)
	.word 0xf0758000  ! 2349: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xf0f4a029  ! 2350: STXA_I	stxa	%r24, [%r18 + 0x0029] %asi
	.word 0xf82560e0  ! 2356: STW_I	stw	%r28, [%r21 + 0x00e0]
	.word 0xf4348000  ! 2359: STH_R	sth	%r26, [%r18 + %r0]
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_wr_95:
	mov	0x14, %r14
	.word 0xf6f389e0  ! 2361: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T3_asi_reg_rd_112:
	mov	0x27, %r14
	.word 0xfadb8e80  ! 2364: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T3_asi_reg_wr_96:
	mov	0x3c7, %r14
	.word 0xfef38e60  ! 2366: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_202:
	setx	0x320316, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983890  ! 2368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1890, %hpstate
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, f)
	.word 0xfa246164  ! 2372: STW_I	stw	%r29, [%r17 + 0x0164]
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 1c)
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfe2de122  ! 2376: STB_I	stb	%r31, [%r23 + 0x0122]
	.word 0xf8a5a0c3  ! 2378: STWA_I	stwa	%r28, [%r22 + 0x00c3] %asi
	ta	T_CHANGE_HPRIV
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf6b58020  ! 2383: STHA_R	stha	%r27, [%r22 + %r0] 0x01
	.word 0xf4356147  ! 2385: STH_I	sth	%r26, [%r21 + 0x0147]
	ta	T_CHANGE_NONHPRIV
	.word 0xfe2d617a  ! 2387: STB_I	stb	%r31, [%r21 + 0x017a]
	ta	T_CHANGE_TO_TL0
cpu_intr_3_203:
	setx	0x33003b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_wr_97:
	mov	0x23, %r14
	.word 0xf2f38e60  ! 2394: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_wr_98:
	mov	0x34, %r14
	.word 0xfaf38e40  ! 2395: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfcb42067  ! 2397: STHA_I	stha	%r30, [%r16 + 0x0067] %asi
T3_asi_reg_wr_99:
	mov	0x3c8, %r14
	.word 0xfcf384a0  ! 2399: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_3_204:
	setx	0x30020e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf4ac209c  ! 2405: STBA_I	stba	%r26, [%r16 + 0x009c] %asi
T3_asi_reg_rd_113:
	mov	0x19, %r14
	.word 0xfadb8400  ! 2407: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T3_asi_reg_rd_114:
	mov	0x3c1, %r14
	.word 0xfedb8e80  ! 2408: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf834c000  ! 2409: STH_R	sth	%r28, [%r19 + %r0]
T3_asi_reg_rd_115:
	mov	0x2, %r14
	.word 0xf4db8e40  ! 2412: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_116:
	mov	0x3c4, %r14
	.word 0xfedb84a0  ! 2415: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T3_asi_reg_wr_100:
	mov	0x2a, %r14
	.word 0xf6f389e0  ! 2416: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_rd_117:
	mov	0x1a, %r14
	.word 0xf8db8e80  ! 2420: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T3_asi_reg_rd_118:
	mov	0x36, %r14
	.word 0xfadb8e60  ! 2423: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 28)
	.word 0xfc74e1eb  ! 2428: STX_I	stx	%r30, [%r19 + 0x01eb]
	.word 0xf8ad8020  ! 2429: STBA_R	stba	%r28, [%r22 + %r0] 0x01
cpu_intr_3_205:
	setx	0x300328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8256146  ! 2432: STW_I	stw	%r28, [%r21 + 0x0146]
	.word 0xbf3de001  ! 2433: SRA_I	sra 	%r23, 0x0001, %r31
	.word 0xb48d4000  ! 2434: ANDcc_R	andcc 	%r21, %r0, %r26
	.word 0xf22cc000  ! 2435: STB_R	stb	%r25, [%r19 + %r0]
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_101:
	mov	0x3c8, %r14
	.word 0xf2f38e60  ! 2442: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb72ce001  ! 2443: SLL_I	sll 	%r19, 0x0001, %r27
cpu_intr_3_206:
	setx	0x320126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b56086  ! 2446: STHA_I	stha	%r27, [%r21 + 0x0086] %asi
cpu_intr_3_207:
	setx	0x310033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea50020  ! 2452: STWA_R	stwa	%r31, [%r20 + %r0] 0x01
	.word 0xfe2d205f  ! 2453: STB_I	stb	%r31, [%r20 + 0x005f]
	.word 0xfa24214e  ! 2454: STW_I	stw	%r29, [%r16 + 0x014e]
	.word 0xbb540000  ! 2456: RDPR_GL	rdpr	%-, %r29
	.word 0xf22dc000  ! 2457: STB_R	stb	%r25, [%r23 + %r0]
	.word 0xf6ad8020  ! 2458: STBA_R	stba	%r27, [%r22 + %r0] 0x01
cpu_intr_3_208:
	setx	0x30031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819829ca  ! 2461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09ca, %hpstate
T3_asi_reg_wr_102:
	mov	0x28, %r14
	.word 0xf4f38e80  ! 2462: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_3_209:
	setx	0x32032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3d8000  ! 2467: SRA_R	sra 	%r22, %r0, %r29
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 1b)
	.word 0xb23da0b2  ! 2472: XNOR_I	xnor 	%r22, 0x00b2, %r25
T3_asi_reg_wr_103:
	mov	0x3c8, %r14
	.word 0xf8f38e60  ! 2473: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf434e013  ! 2474: STH_I	sth	%r26, [%r19 + 0x0013]
	.word 0xb414c000  ! 2476: OR_R	or 	%r19, %r0, %r26
	.word 0xfcb460a0  ! 2477: STHA_I	stha	%r30, [%r17 + 0x00a0] %asi
cpu_intr_3_210:
	setx	0x310236, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, 10)
	.word 0xfaa48020  ! 2483: STWA_R	stwa	%r29, [%r18 + %r0] 0x01
	.word 0xf02ce0b8  ! 2487: STB_I	stb	%r24, [%r19 + 0x00b8]
	.word 0xb92c1000  ! 2488: SLLX_R	sllx	%r16, %r0, %r28
	.word 0xfc742014  ! 2489: STX_I	stx	%r30, [%r16 + 0x0014]
	.word 0xf8348000  ! 2494: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xfe748000  ! 2500: STX_R	stx	%r31, [%r18 + %r0]
cpu_intr_3_211:
	setx	0x310131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 3)
cpu_intr_3_212:
	setx	0x30001e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 6)
	.word 0xfc754000  ! 2511: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xba0d0000  ! 2512: AND_R	and 	%r20, %r0, %r29
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982a9a  ! 2515: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9a, %hpstate
	.word 0xbb35a001  ! 2516: SRL_I	srl 	%r22, 0x0001, %r29
cpu_intr_3_213:
	setx	0x310239, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_119:
	mov	0xe, %r14
	.word 0xf4db84a0  ! 2521: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfc34611f  ! 2523: STH_I	sth	%r30, [%r17 + 0x011f]
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982a4a  ! 2525: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4a, %hpstate
T3_asi_reg_wr_104:
	mov	0x35, %r14
	.word 0xfaf38e60  ! 2527: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 15)
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983dd0  ! 2532: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd0, %hpstate
	.word 0xf6a520c6  ! 2533: STWA_I	stwa	%r27, [%r20 + 0x00c6] %asi
T3_asi_reg_wr_105:
	mov	0x3c1, %r14
	.word 0xfcf38e80  ! 2537: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb2b54000  ! 2538: SUBCcc_R	orncc 	%r21, %r0, %r25
	.word 0xfe34c000  ! 2539: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf675e0df  ! 2540: STX_I	stx	%r27, [%r23 + 0x00df]
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_214:
	setx	0x310001, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_120:
	mov	0x7, %r14
	.word 0xf8db84a0  ! 2549: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T3_asi_reg_rd_121:
	mov	0x8, %r14
	.word 0xfedb8e40  ! 2550: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982cc8  ! 2551: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc8, %hpstate
T3_asi_reg_wr_106:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 2552: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf474616c  ! 2554: STX_I	stx	%r26, [%r17 + 0x016c]
T3_asi_reg_wr_107:
	mov	0x1, %r14
	.word 0xf6f38400  ! 2556: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf274c000  ! 2557: STX_R	stx	%r25, [%r19 + %r0]
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 37)
	.word 0xfc35e081  ! 2566: STH_I	sth	%r30, [%r23 + 0x0081]
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, b)
	.word 0xf275c000  ! 2574: STX_R	stx	%r25, [%r23 + %r0]
T3_asi_reg_rd_122:
	mov	0x3c0, %r14
	.word 0xf6db8e80  ! 2576: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfaa5a1cc  ! 2582: STWA_I	stwa	%r29, [%r22 + 0x01cc] %asi
	.word 0xf2b50020  ! 2587: STHA_R	stha	%r25, [%r20 + %r0] 0x01
T3_asi_reg_wr_108:
	mov	0x27, %r14
	.word 0xfcf38400  ! 2588: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xfe754000  ! 2589: STX_R	stx	%r31, [%r21 + %r0]
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_215:
	setx	0x33031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf234e114  ! 2607: STH_I	sth	%r25, [%r19 + 0x0114]
	.word 0xf22d4000  ! 2608: STB_R	stb	%r25, [%r21 + %r0]
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_216:
	setx	0x300223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 2e)
	.word 0xfeadc020  ! 2615: STBA_R	stba	%r31, [%r23 + %r0] 0x01
cpu_intr_3_217:
	setx	0x300132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_218:
	setx	0x30011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_109:
	mov	0x2e, %r14
	.word 0xf2f38e80  ! 2618: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf0b5e1c3  ! 2621: STHA_I	stha	%r24, [%r23 + 0x01c3] %asi
T3_asi_reg_wr_110:
	mov	0x3c7, %r14
	.word 0xfcf38e80  ! 2623: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xfe2c0000  ! 2628: STB_R	stb	%r31, [%r16 + %r0]
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 2b)
	.word 0xfc2421aa  ! 2631: STW_I	stw	%r30, [%r16 + 0x01aa]
	.word 0xfeb5e0f9  ! 2633: STHA_I	stha	%r31, [%r23 + 0x00f9] %asi
	.word 0xf2750000  ! 2634: STX_R	stx	%r25, [%r20 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xf22ce17d  ! 2637: STB_I	stb	%r25, [%r19 + 0x017d]
	.word 0xb404e14f  ! 2638: ADD_I	add 	%r19, 0x014f, %r26
	.word 0xf4a460e6  ! 2640: STWA_I	stwa	%r26, [%r17 + 0x00e6] %asi
	.word 0xf02da165  ! 2641: STB_I	stb	%r24, [%r22 + 0x0165]
	.word 0xf874a018  ! 2644: STX_I	stx	%r28, [%r18 + 0x0018]
cpu_intr_3_219:
	setx	0x330314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2acc020  ! 2646: STBA_R	stba	%r25, [%r19 + %r0] 0x01
cpu_intr_3_220:
	setx	0x330114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795619c  ! 2651: WRPR_TT_I	wrpr	%r21, 0x019c, %tt
T3_asi_reg_rd_123:
	mov	0x22, %r14
	.word 0xfadb8400  ! 2652: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 11)
	.word 0xf42de072  ! 2656: STB_I	stb	%r26, [%r23 + 0x0072]
	ta	T_CHANGE_NONHPRIV
	.word 0xf0244000  ! 2660: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xf6b5c020  ! 2661: STHA_R	stha	%r27, [%r23 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_221:
	setx	0x31001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe248000  ! 2670: STW_R	stw	%r31, [%r18 + %r0]
cpu_intr_3_222:
	setx	0x300009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2cc000  ! 2672: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xf2a5c020  ! 2676: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
cpu_intr_3_223:
	setx	0x30021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc344000  ! 2681: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xfca4a1b0  ! 2685: STWA_I	stwa	%r30, [%r18 + 0x01b0] %asi
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 18)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_111:
	mov	0x3c8, %r14
	.word 0xfef389e0  ! 2690: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbab40000  ! 2691: ORNcc_R	orncc 	%r16, %r0, %r29
T3_asi_reg_rd_124:
	mov	0x3c7, %r14
	.word 0xf4db8e60  ! 2692: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_3_224:
	setx	0x33020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_112:
	mov	0x14, %r14
	.word 0xf2f38e40  ! 2697: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfaf5a1c4  ! 2700: STXA_I	stxa	%r29, [%r22 + 0x01c4] %asi
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_225:
	setx	0x320332, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_125:
	mov	0x29, %r14
	.word 0xf2db8400  ! 2704: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb12d3001  ! 2706: SLLX_I	sllx	%r20, 0x0001, %r24
cpu_intr_3_226:
	setx	0x33033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_227:
	setx	0x300103, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_113:
	mov	0x11, %r14
	.word 0xf0f38e80  ! 2718: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xba358000  ! 2722: SUBC_R	orn 	%r22, %r0, %r29
	.word 0xfeade1f4  ! 2723: STBA_I	stba	%r31, [%r23 + 0x01f4] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xbb480000  ! 2727: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf474c000  ! 2728: STX_R	stx	%r26, [%r19 + %r0]
T3_asi_reg_wr_114:
	mov	0x33, %r14
	.word 0xf6f38e80  ! 2730: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf224e0b9  ! 2733: STW_I	stw	%r25, [%r19 + 0x00b9]
	.word 0xbcbda118  ! 2736: XNORcc_I	xnorcc 	%r22, 0x0118, %r30
cpu_intr_3_228:
	setx	0x30032a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_115:
	mov	0x14, %r14
	.word 0xf0f38e60  ! 2738: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_229:
	setx	0x340220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8358000  ! 2740: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xf42d0000  ! 2741: STB_R	stb	%r26, [%r20 + %r0]
cpu_intr_3_230:
	setx	0x340311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d6002  ! 2743: STB_I	stb	%r29, [%r21 + 0x0002]
T3_asi_reg_rd_126:
	mov	0x29, %r14
	.word 0xfcdb84a0  ! 2746: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf4b46131  ! 2748: STHA_I	stha	%r26, [%r17 + 0x0131] %asi
cpu_intr_3_231:
	setx	0x360103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, 20)
	.word 0xfc3421cc  ! 2755: STH_I	sth	%r30, [%r16 + 0x01cc]
cpu_intr_3_232:
	setx	0x36013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_233:
	setx	0x34033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf224a0d0  ! 2758: STW_I	stw	%r25, [%r18 + 0x00d0]
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 10)
	.word 0xfa2c20ec  ! 2763: STB_I	stb	%r29, [%r16 + 0x00ec]
	.word 0xf275217b  ! 2765: STX_I	stx	%r25, [%r20 + 0x017b]
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_234:
	setx	0x36001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_235:
	setx	0x34001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_127:
	mov	0x11, %r14
	.word 0xf2db8e80  ! 2777: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbe948000  ! 2778: ORcc_R	orcc 	%r18, %r0, %r31
cpu_intr_3_236:
	setx	0x350229, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_116:
	mov	0x1d, %r14
	.word 0xfcf38e80  ! 2783: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xfcb48020  ! 2785: STHA_R	stha	%r30, [%r18 + %r0] 0x01
	.word 0xfeac6028  ! 2787: STBA_I	stba	%r31, [%r17 + 0x0028] %asi
	.word 0xbc9d4000  ! 2789: XORcc_R	xorcc 	%r21, %r0, %r30
T3_asi_reg_wr_117:
	mov	0x10, %r14
	.word 0xf0f389e0  ! 2792: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_wr_118:
	mov	0x3c0, %r14
	.word 0xfef384a0  ! 2798: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb0948000  ! 2799: ORcc_R	orcc 	%r18, %r0, %r24
	.word 0xfc25e1f8  ! 2800: STW_I	stw	%r30, [%r23 + 0x01f8]
	.word 0xf2350000  ! 2801: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xf8a5e1f3  ! 2803: STWA_I	stwa	%r28, [%r23 + 0x01f3] %asi
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 23)
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983a5a  ! 2805: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a5a, %hpstate
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_rd_128:
	mov	0x20, %r14
	.word 0xfadb8e40  ! 2807: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf4a56015  ! 2808: STWA_I	stwa	%r26, [%r21 + 0x0015] %asi
	.word 0xb2040000  ! 2812: ADD_R	add 	%r16, %r0, %r25
	.word 0xfaa4e135  ! 2815: STWA_I	stwa	%r29, [%r19 + 0x0135] %asi
	.word 0xf8340000  ! 2816: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xf4a5a09b  ! 2817: STWA_I	stwa	%r26, [%r22 + 0x009b] %asi
	.word 0xb28460dd  ! 2818: ADDcc_I	addcc 	%r17, 0x00dd, %r25
T3_asi_reg_wr_119:
	mov	0x19, %r14
	.word 0xf6f38e40  ! 2819: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_237:
	setx	0x360034, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
cpu_intr_3_238:
	setx	0x34010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_129:
	mov	0x1b, %r14
	.word 0xf0db8e40  ! 2830: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfead0020  ! 2836: STBA_R	stba	%r31, [%r20 + %r0] 0x01
	.word 0xb2c421fe  ! 2839: ADDCcc_I	addccc 	%r16, 0x01fe, %r25
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, d)
	.word 0xf02d4000  ! 2845: STB_R	stb	%r24, [%r21 + %r0]
	.word 0xb01da0f7  ! 2847: XOR_I	xor 	%r22, 0x00f7, %r24
	.word 0xfe244000  ! 2850: STW_R	stw	%r31, [%r17 + %r0]
T3_asi_reg_wr_120:
	mov	0x26, %r14
	.word 0xf0f38400  ! 2851: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf2b4c020  ! 2852: STHA_R	stha	%r25, [%r19 + %r0] 0x01
	.word 0xf6248000  ! 2854: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xf4ad0020  ! 2857: STBA_R	stba	%r26, [%r20 + %r0] 0x01
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_239:
	setx	0x37023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_121:
	mov	0x3c1, %r14
	.word 0xf4f38400  ! 2864: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 24)
	.word 0xf874a11f  ! 2870: STX_I	stx	%r28, [%r18 + 0x011f]
	.word 0xf82c8000  ! 2871: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xf874a16f  ! 2873: STX_I	stx	%r28, [%r18 + 0x016f]
	.word 0xbf353001  ! 2874: SRLX_I	srlx	%r20, 0x0001, %r31
	.word 0xfe2da05a  ! 2877: STB_I	stb	%r31, [%r22 + 0x005a]
cpu_intr_3_240:
	setx	0x35022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_130:
	mov	0x6, %r14
	.word 0xf6db8e40  ! 2883: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_241:
	setx	0x370123, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_131:
	mov	0x2f, %r14
	.word 0xfadb8e60  ! 2885: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T3_asi_reg_wr_122:
	mov	0x27, %r14
	.word 0xf6f384a0  ! 2886: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb2c5c000  ! 2887: ADDCcc_R	addccc 	%r23, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_rd_132:
	mov	0x3c7, %r14
	.word 0xf4db8400  ! 2891: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_242:
	setx	0x360205, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_133:
	mov	0x17, %r14
	.word 0xf0db8400  ! 2898: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T3_asi_reg_wr_123:
	mov	0x2e, %r14
	.word 0xfef38e40  ! 2901: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_243:
	setx	0x350018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeac20b6  ! 2906: STBA_I	stba	%r31, [%r16 + 0x00b6] %asi
	.word 0xf0a46005  ! 2907: STWA_I	stwa	%r24, [%r17 + 0x0005] %asi
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, f)
T3_asi_reg_rd_134:
	mov	0x1a, %r14
	.word 0xf2db8e40  ! 2917: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_rd_135:
	mov	0x3c3, %r14
	.word 0xf0db89e0  ! 2921: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_3_244:
	setx	0x36002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_245:
	setx	0x350139, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_124:
	mov	0x1, %r14
	.word 0xf2f38400  ! 2926: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, 9)
	.word 0xb9357001  ! 2932: SRLX_I	srlx	%r21, 0x0001, %r28
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 11)
	.word 0xf02dc000  ! 2935: STB_R	stb	%r24, [%r23 + %r0]
T3_asi_reg_rd_136:
	mov	0x2a, %r14
	.word 0xfcdb84a0  ! 2938: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xfc2ca167  ! 2943: STB_I	stb	%r30, [%r18 + 0x0167]
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_246:
	setx	0x340309, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_137:
	mov	0x3c6, %r14
	.word 0xf2db8400  ! 2949: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	ta	T_CHANGE_NONHPRIV
	.word 0xf0750000  ! 2953: STX_R	stx	%r24, [%r20 + %r0]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_247:
	setx	0x370327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf0752102  ! 2965: STX_I	stx	%r24, [%r20 + 0x0102]
cpu_intr_3_248:
	setx	0x350335, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfaa54020  ! 2974: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
	.word 0xf875212f  ! 2975: STX_I	stx	%r28, [%r20 + 0x012f]
cpu_intr_3_249:
	setx	0x370212, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 33)
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_125:
	mov	0x30, %r14
	.word 0xf2f38e80  ! 2981: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_rd_138:
	mov	0x21, %r14
	.word 0xf8db8e60  ! 2983: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 1a)
cpu_intr_3_250:
	setx	0x370130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf234c000  ! 2990: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xf6a460a9  ! 2992: STWA_I	stwa	%r27, [%r17 + 0x00a9] %asi
	ta	T_CHANGE_TO_TL1
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 9)
	.word 0xf834e0ac  ! 3002: STH_I	sth	%r28, [%r19 + 0x00ac]
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_rd_139:
	mov	0x3c2, %r14
	.word 0xfcdb8400  ! 3004: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf8242141  ! 3005: STW_I	stw	%r28, [%r16 + 0x0141]
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_wr_126:
	mov	0x2c, %r14
	.word 0xfef38e80  ! 3015: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_3_251:
	setx	0x340104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d0000  ! 3018: STB_R	stb	%r27, [%r20 + %r0]
T3_asi_reg_rd_140:
	mov	0x31, %r14
	.word 0xfedb8e80  ! 3019: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_3_252:
	setx	0x34023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f4e13d  ! 3022: STXA_I	stxa	%r28, [%r19 + 0x013d] %asi
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 5)
	.word 0xfab50020  ! 3026: STHA_R	stha	%r29, [%r20 + %r0] 0x01
	.word 0xf82d8000  ! 3030: STB_R	stb	%r28, [%r22 + %r0]
cpu_intr_3_253:
	setx	0x340231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaac4020  ! 3035: STBA_R	stba	%r29, [%r17 + %r0] 0x01
	.word 0xf62d60d5  ! 3038: STB_I	stb	%r27, [%r21 + 0x00d5]
T3_asi_reg_wr_127:
	mov	0x3c1, %r14
	.word 0xf2f38e80  ! 3039: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_254:
	setx	0x37012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_141:
	mov	0x1d, %r14
	.word 0xfedb8400  ! 3044: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T3_asi_reg_wr_128:
	mov	0x1d, %r14
	.word 0xf4f38e60  ! 3045: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xfe2d21a8  ! 3046: STB_I	stb	%r31, [%r20 + 0x01a8]
cpu_intr_3_255:
	setx	0x37003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_256:
	setx	0x34031f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_257:
	setx	0x340126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfe242153  ! 3057: STW_I	stw	%r31, [%r16 + 0x0153]
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_258:
	setx	0x36010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaac0020  ! 3062: STBA_R	stba	%r29, [%r16 + %r0] 0x01
T3_asi_reg_wr_129:
	mov	0x3, %r14
	.word 0xf0f38e40  ! 3063: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_wr_130:
	mov	0x24, %r14
	.word 0xfaf38e60  ! 3072: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0xf224c000  ! 3077: STW_R	stw	%r25, [%r19 + %r0]
T3_asi_reg_rd_142:
	mov	0x1e, %r14
	.word 0xf6db84a0  ! 3078: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T3_asi_reg_rd_143:
	mov	0x3c8, %r14
	.word 0xf0db8e80  ! 3080: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfc35a0e4  ! 3081: STH_I	sth	%r30, [%r22 + 0x00e4]
T3_asi_reg_rd_144:
	mov	0x14, %r14
	.word 0xf0db8e80  ! 3082: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xba348000  ! 3083: ORN_R	orn 	%r18, %r0, %r29
	.word 0xfc744000  ! 3085: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xf6ad21d1  ! 3086: STBA_I	stba	%r27, [%r20 + 0x01d1] %asi
	.word 0xf4ad4020  ! 3087: STBA_R	stba	%r26, [%r21 + %r0] 0x01
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf62d2089  ! 3090: STB_I	stb	%r27, [%r20 + 0x0089]
	.word 0xf4a46165  ! 3093: STWA_I	stwa	%r26, [%r17 + 0x0165] %asi
	.word 0xfa35a113  ! 3094: STH_I	sth	%r29, [%r22 + 0x0113]
	.word 0xfaf4a0c6  ! 3095: STXA_I	stxa	%r29, [%r18 + 0x00c6] %asi
	.word 0xb614c000  ! 3097: OR_R	or 	%r19, %r0, %r27
	.word 0xb2354000  ! 3098: ORN_R	orn 	%r21, %r0, %r25
	.word 0xf8a44020  ! 3100: STWA_R	stwa	%r28, [%r17 + %r0] 0x01
	.word 0xf475e100  ! 3101: STX_I	stx	%r26, [%r23 + 0x0100]
T3_asi_reg_rd_145:
	mov	0x27, %r14
	.word 0xfedb8e40  ! 3102: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xba842043  ! 3105: ADDcc_I	addcc 	%r16, 0x0043, %r29
	.word 0xbaaca18f  ! 3107: ANDNcc_I	andncc 	%r18, 0x018f, %r29
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_259:
	setx	0x35001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2844000  ! 3114: ADDcc_R	addcc 	%r17, %r0, %r25
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 3)
	.word 0xf0f46094  ! 3117: STXA_I	stxa	%r24, [%r17 + 0x0094] %asi
T3_asi_reg_rd_146:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 3119: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_wr_131:
	mov	0xb, %r14
	.word 0xf0f38e40  ! 3120: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf02c8000  ! 3121: STB_R	stb	%r24, [%r18 + %r0]
	.word 0xf6a44020  ! 3124: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
	.word 0xf8a4e193  ! 3125: STWA_I	stwa	%r28, [%r19 + 0x0193] %asi
cpu_intr_3_260:
	setx	0x20020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_261:
	setx	0x340037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42d8000  ! 3131: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xf6354000  ! 3134: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xf22dc000  ! 3135: STB_R	stb	%r25, [%r23 + %r0]
cpu_intr_3_262:
	setx	0x360313, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_132:
	mov	0x36, %r14
	.word 0xfaf38e80  ! 3139: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 3)
	.word 0xf8acc020  ! 3145: STBA_R	stba	%r28, [%r19 + %r0] 0x01
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, 3a)
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d08  ! 3147: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d08, %hpstate
	.word 0xfa24a0a0  ! 3148: STW_I	stw	%r29, [%r18 + 0x00a0]
cpu_intr_3_263:
	setx	0x37020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_133:
	mov	0x3c6, %r14
	.word 0xf8f38e80  ! 3150: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfaa52005  ! 3151: STWA_I	stwa	%r29, [%r20 + 0x0005] %asi
T3_asi_reg_rd_147:
	mov	0x36, %r14
	.word 0xfcdb8400  ! 3152: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T3_asi_reg_wr_134:
	mov	0x23, %r14
	.word 0xf4f38e40  ! 3153: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbc24c000  ! 3159: SUB_R	sub 	%r19, %r0, %r30
T3_asi_reg_wr_135:
	mov	0x21, %r14
	.word 0xf4f384a0  ! 3164: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 3)
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982e40  ! 3175: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e40, %hpstate
	.word 0xfead8020  ! 3177: STBA_R	stba	%r31, [%r22 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_264:
	setx	0x360210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6f5a10a  ! 3185: STXA_I	stxa	%r27, [%r22 + 0x010a] %asi
	.word 0xf075c000  ! 3187: STX_R	stx	%r24, [%r23 + %r0]
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_265:
	setx	0x37011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf835c000  ! 3191: STH_R	sth	%r28, [%r23 + %r0]
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_266:
	setx	0x350118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2dc000  ! 3201: STB_R	stb	%r29, [%r23 + %r0]
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_rd_148:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 3205: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf4b5c020  ! 3208: STHA_R	stha	%r26, [%r23 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_136:
	mov	0x7, %r14
	.word 0xfcf38400  ! 3216: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf0ad6025  ! 3218: STBA_I	stba	%r24, [%r21 + 0x0025] %asi
	.word 0xba94a10b  ! 3221: ORcc_I	orcc 	%r18, 0x010b, %r29
	.word 0xf434c000  ! 3224: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xa1902001  ! 3227: WRPR_GL_I	wrpr	%r0, 0x0001, %-
T3_asi_reg_wr_137:
	mov	0x29, %r14
	.word 0xf6f38e40  ! 3229: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_267:
	setx	0x380222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_268:
	setx	0x3a0320, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 33)
	.word 0xfe256165  ! 3244: STW_I	stw	%r31, [%r21 + 0x0165]
	.word 0xf075609d  ! 3246: STX_I	stx	%r24, [%r21 + 0x009d]
cpu_intr_3_269:
	setx	0x3a012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_270:
	setx	0x39020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_138:
	mov	0x12, %r14
	.word 0xfaf389e0  ! 3250: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf2ade1a1  ! 3252: STBA_I	stba	%r25, [%r23 + 0x01a1] %asi
	.word 0xf4a44020  ! 3255: STWA_R	stwa	%r26, [%r17 + %r0] 0x01
	.word 0xb6a54000  ! 3257: SUBcc_R	subcc 	%r21, %r0, %r27
	.word 0xfe240000  ! 3259: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xf6354000  ! 3260: STH_R	sth	%r27, [%r21 + %r0]
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 3)
cpu_intr_3_271:
	setx	0x38000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc354000  ! 3266: ORN_R	orn 	%r21, %r0, %r30
	.word 0xf675e041  ! 3267: STX_I	stx	%r27, [%r23 + 0x0041]
	.word 0xfc24a19d  ! 3268: STW_I	stw	%r30, [%r18 + 0x019d]
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_wr_139:
	mov	0x11, %r14
	.word 0xf6f389e0  ! 3270: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb1341000  ! 3271: SRLX_R	srlx	%r16, %r0, %r24
	.word 0xbcad2059  ! 3272: ANDNcc_I	andncc 	%r20, 0x0059, %r30
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	.word 0xfea4c020  ! 3277: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
T3_asi_reg_wr_140:
	mov	0x22, %r14
	.word 0xf2f38e80  ! 3278: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb8b46029  ! 3279: ORNcc_I	orncc 	%r17, 0x0029, %r28
	.word 0xfcb40020  ! 3281: STHA_R	stha	%r30, [%r16 + %r0] 0x01
T3_asi_reg_wr_141:
	mov	0x17, %r14
	.word 0xf8f384a0  ! 3282: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T3_asi_reg_rd_149:
	mov	0x3c3, %r14
	.word 0xf4db89e0  ! 3283: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982a1a  ! 3284: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1a, %hpstate
	.word 0xfea46040  ! 3286: STWA_I	stwa	%r31, [%r17 + 0x0040] %asi
cpu_intr_3_272:
	setx	0x3b0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8994e1ae  ! 3289: WRPR_TICK_I	wrpr	%r19, 0x01ae, %tick
	.word 0xf6252013  ! 3292: STW_I	stw	%r27, [%r20 + 0x0013]
	.word 0xf02d60bc  ! 3294: STB_I	stb	%r24, [%r21 + 0x00bc]
	.word 0xfcf4e07a  ! 3296: STXA_I	stxa	%r30, [%r19 + 0x007a] %asi
	.word 0xf0ad8020  ! 3297: STBA_R	stba	%r24, [%r22 + %r0] 0x01
	.word 0xfab46070  ! 3298: STHA_I	stha	%r29, [%r17 + 0x0070] %asi
	.word 0xf425e001  ! 3305: STW_I	stw	%r26, [%r23 + 0x0001]
T3_asi_reg_wr_142:
	mov	0x24, %r14
	.word 0xf2f38e40  ! 3306: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_273:
	setx	0x3b0028, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_143:
	mov	0x19, %r14
	.word 0xf6f384a0  ! 3309: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfe748000  ! 3311: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xb2b5e01a  ! 3312: SUBCcc_I	orncc 	%r23, 0x001a, %r25
cpu_intr_3_274:
	setx	0x3b001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_275:
	setx	0x3b033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_144:
	mov	0x3c1, %r14
	.word 0xfcf38e80  ! 3318: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf4350000  ! 3320: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xfab56133  ! 3323: STHA_I	stha	%r29, [%r21 + 0x0133] %asi
cpu_intr_3_276:
	setx	0x3b013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_277:
	setx	0x390301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b58020  ! 3327: STHA_R	stha	%r27, [%r22 + %r0] 0x01
	.word 0xf8b4a079  ! 3332: STHA_I	stha	%r28, [%r18 + 0x0079] %asi
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_278:
	setx	0x390110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ac2040  ! 3337: STBA_I	stba	%r28, [%r16 + 0x0040] %asi
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 3a)
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_145:
	mov	0x2a, %r14
	.word 0xfef38e40  ! 3344: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfc744000  ! 3345: STX_R	stx	%r30, [%r17 + %r0]
cpu_intr_3_279:
	setx	0x39010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f56154  ! 3349: STXA_I	stxa	%r24, [%r21 + 0x0154] %asi
T3_asi_reg_rd_150:
	mov	0x3c0, %r14
	.word 0xf2db8e60  ! 3350: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_rd_151:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 3353: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf0acc020  ! 3356: STBA_R	stba	%r24, [%r19 + %r0] 0x01
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982e5a  ! 3359: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5a, %hpstate
	.word 0xf635c000  ! 3364: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xfc2d6007  ! 3366: STB_I	stb	%r30, [%r21 + 0x0007]
	ta	T_CHANGE_HPRIV
	.word 0xf474a033  ! 3372: STX_I	stx	%r26, [%r18 + 0x0033]
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, c)
cpu_intr_3_280:
	setx	0x3a0021, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_152:
	mov	0x3c8, %r14
	.word 0xfedb84a0  ! 3377: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf0a520b4  ! 3383: STWA_I	stwa	%r24, [%r20 + 0x00b4] %asi
cpu_intr_3_281:
	setx	0x3a0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_282:
	setx	0x390114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab40000  ! 3388: SUBCcc_R	orncc 	%r16, %r0, %r29
T3_asi_reg_wr_146:
	mov	0x25, %r14
	.word 0xf2f38e60  ! 3390: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf0b44020  ! 3391: STHA_R	stha	%r24, [%r17 + %r0] 0x01
	.word 0xf034e0a5  ! 3392: STH_I	sth	%r24, [%r19 + 0x00a5]
	.word 0xf2f420e0  ! 3393: STXA_I	stxa	%r25, [%r16 + 0x00e0] %asi
T3_asi_reg_rd_153:
	mov	0x19, %r14
	.word 0xf6db89e0  ! 3394: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb09cc000  ! 3397: XORcc_R	xorcc 	%r19, %r0, %r24
	.word 0xf6a42061  ! 3399: STWA_I	stwa	%r27, [%r16 + 0x0061] %asi
cpu_intr_3_283:
	setx	0x3b0007, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_154:
	mov	0x29, %r14
	.word 0xf4db8e60  ! 3402: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_wr_147:
	mov	0x18, %r14
	.word 0xf8f384a0  ! 3403: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbf643801  ! 3404: MOVcc_I	<illegal instruction>
T3_asi_reg_rd_155:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 3408: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 31)
	.word 0xfe35c000  ! 3411: STH_R	sth	%r31, [%r23 + %r0]
T3_asi_reg_wr_148:
	mov	0x8, %r14
	.word 0xf4f389e0  ! 3412: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbe84614c  ! 3413: ADDcc_I	addcc 	%r17, 0x014c, %r31
	.word 0xfaada00a  ! 3417: STBA_I	stba	%r29, [%r22 + 0x000a] %asi
T3_asi_reg_rd_156:
	mov	0x1f, %r14
	.word 0xfcdb8e60  ! 3418: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_284:
	setx	0x3a0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaac4020  ! 3421: STBA_R	stba	%r29, [%r17 + %r0] 0x01
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 20)
	.word 0xfaf4206d  ! 3426: STXA_I	stxa	%r29, [%r16 + 0x006d] %asi
	.word 0xbec54000  ! 3427: ADDCcc_R	addccc 	%r21, %r0, %r31
cpu_intr_3_285:
	setx	0x3a0211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_286:
	setx	0x38012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_287:
	setx	0x380232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_288:
	setx	0x3b001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, 12)
	.word 0xf4342180  ! 3440: STH_I	sth	%r26, [%r16 + 0x0180]
T3_asi_reg_wr_149:
	mov	0x9, %r14
	.word 0xf6f38e40  ! 3442: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf82d200d  ! 3443: STB_I	stb	%r28, [%r20 + 0x000d]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_289:
	setx	0x39013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_150:
	mov	0x3c5, %r14
	.word 0xf0f38e60  ! 3452: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfe25a1c1  ! 3457: STW_I	stw	%r31, [%r22 + 0x01c1]
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 12)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 25)
	.word 0xfc748000  ! 3461: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf824e10c  ! 3464: STW_I	stw	%r28, [%r19 + 0x010c]
	.word 0xfc75a04c  ! 3466: STX_I	stx	%r30, [%r22 + 0x004c]
T3_asi_reg_rd_157:
	mov	0x2d, %r14
	.word 0xf8db89e0  ! 3467: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf2ad201a  ! 3471: STBA_I	stba	%r25, [%r20 + 0x001a] %asi
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 31)
	.word 0xb63d2059  ! 3477: XNOR_I	xnor 	%r20, 0x0059, %r27
cpu_intr_3_290:
	setx	0x3a0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b421d8  ! 3480: STHA_I	stha	%r27, [%r16 + 0x01d8] %asi
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983990  ! 3481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1990, %hpstate
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 18)
	.word 0xf02cc000  ! 3484: STB_R	stb	%r24, [%r19 + %r0]
cpu_intr_3_291:
	setx	0x39031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_151:
	mov	0x1a, %r14
	.word 0xfcf38e80  ! 3487: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_3_292:
	setx	0x3a0033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, 3f)
	.word 0xfaada027  ! 3490: STBA_I	stba	%r29, [%r22 + 0x0027] %asi
cpu_intr_3_293:
	setx	0x3a030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead4020  ! 3497: STBA_R	stba	%r31, [%r21 + %r0] 0x01
	.word 0xbaada169  ! 3499: ANDNcc_I	andncc 	%r22, 0x0169, %r29
	.word 0xfcade057  ! 3501: STBA_I	stba	%r30, [%r23 + 0x0057] %asi
cpu_intr_3_294:
	setx	0x39030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983fca  ! 3504: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fca, %hpstate
T3_asi_reg_rd_158:
	mov	0x1d, %r14
	.word 0xf2db84a0  ! 3505: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_3_295:
	setx	0x3a030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_296:
	setx	0x3b0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb445603d  ! 3509: ADDC_I	addc 	%r21, 0x003d, %r26
	.word 0xfe34e0d5  ! 3511: STH_I	sth	%r31, [%r19 + 0x00d5]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1643801  ! 3517: MOVcc_I	<illegal instruction>
	.word 0xfc2d8000  ! 3518: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xfcb561c2  ! 3520: STHA_I	stha	%r30, [%r21 + 0x01c2] %asi
cpu_intr_3_297:
	setx	0x3b022a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_rd_159:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 3535: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf835e163  ! 3538: STH_I	sth	%r28, [%r23 + 0x0163]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_298:
	setx	0x3b0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_299:
	setx	0x3a0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2758000  ! 3552: STX_R	stx	%r25, [%r22 + %r0]
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 9)
	.word 0xf634a17f  ! 3554: STH_I	sth	%r27, [%r18 + 0x017f]
	.word 0xfe3461e2  ! 3555: STH_I	sth	%r31, [%r17 + 0x01e2]
cpu_intr_3_300:
	setx	0x3b0206, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_160:
	mov	0x1d, %r14
	.word 0xfedb89e0  ! 3567: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 23)
	.word 0xf0acc020  ! 3577: STBA_R	stba	%r24, [%r19 + %r0] 0x01
	.word 0xf4b4e0c5  ! 3578: STHA_I	stha	%r26, [%r19 + 0x00c5] %asi
	.word 0xb934b001  ! 3579: SRLX_I	srlx	%r18, 0x0001, %r28
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 1c)
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, 11)
T3_asi_reg_wr_152:
	mov	0x6, %r14
	.word 0xf0f38400  ! 3586: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfa7520eb  ! 3588: STX_I	stx	%r29, [%r20 + 0x00eb]
	.word 0xfc2d8000  ! 3589: STB_R	stb	%r30, [%r22 + %r0]
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, c)
	.word 0xfaa4c020  ! 3595: STWA_R	stwa	%r29, [%r19 + %r0] 0x01
	.word 0xf82c61d9  ! 3597: STB_I	stb	%r28, [%r17 + 0x01d9]
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_rd_161:
	mov	0x11, %r14
	.word 0xfedb8e40  ! 3601: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_rd_162:
	mov	0x3c3, %r14
	.word 0xf8db8400  ! 3602: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfa34c000  ! 3605: STH_R	sth	%r29, [%r19 + %r0]
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 1d)
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 14)
	.word 0xfa744000  ! 3611: STX_R	stx	%r29, [%r17 + %r0]
cpu_intr_3_301:
	setx	0x390024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc34a0e9  ! 3614: SUBC_I	orn 	%r18, 0x00e9, %r30
	.word 0xbb2ca001  ! 3615: SLL_I	sll 	%r18, 0x0001, %r29
T3_asi_reg_wr_153:
	mov	0x2f, %r14
	.word 0xf4f38e80  ! 3617: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_wr_154:
	mov	0x8, %r14
	.word 0xf8f38e60  ! 3623: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfaac0020  ! 3624: STBA_R	stba	%r29, [%r16 + %r0] 0x01
cpu_intr_3_302:
	setx	0x380222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_303:
	setx	0x3a030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f4e1e9  ! 3629: STXA_I	stxa	%r26, [%r19 + 0x01e9] %asi
	.word 0xbc1c2077  ! 3630: XOR_I	xor 	%r16, 0x0077, %r30
T3_asi_reg_rd_163:
	mov	0x1b, %r14
	.word 0xf8db8e60  ! 3632: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf024a105  ! 3633: STW_I	stw	%r24, [%r18 + 0x0105]
T3_asi_reg_wr_155:
	mov	0x17, %r14
	.word 0xf2f38e60  ! 3634: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_rd_164:
	mov	0x18, %r14
	.word 0xfedb8e40  ! 3636: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf6b5613e  ! 3638: STHA_I	stha	%r27, [%r21 + 0x013e] %asi
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf8a4c020  ! 3640: STWA_R	stwa	%r28, [%r19 + %r0] 0x01
	.word 0xb9346001  ! 3641: SRL_I	srl 	%r17, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbe954000  ! 3645: ORcc_R	orcc 	%r21, %r0, %r31
T3_asi_reg_wr_156:
	mov	0x26, %r14
	.word 0xfcf384a0  ! 3646: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_rd_165:
	mov	0x0, %r14
	.word 0xf4db8400  ! 3657: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf62c4000  ! 3659: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf874e07e  ! 3664: STX_I	stx	%r28, [%r19 + 0x007e]
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 7)
	.word 0xfab5e13a  ! 3667: STHA_I	stha	%r29, [%r23 + 0x013a] %asi
	.word 0xfe350000  ! 3668: STH_R	sth	%r31, [%r20 + %r0]
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 3)
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 6)
	.word 0xf42560bf  ! 3675: STW_I	stw	%r26, [%r21 + 0x00bf]
cpu_intr_3_304:
	setx	0x3f0131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf225e197  ! 3680: STW_I	stw	%r25, [%r23 + 0x0197]
T3_asi_reg_wr_157:
	mov	0x15, %r14
	.word 0xf4f389e0  ! 3684: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xfeb5a087  ! 3685: STHA_I	stha	%r31, [%r22 + 0x0087] %asi
cpu_intr_3_305:
	setx	0x3e0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe340000  ! 3687: ORN_R	orn 	%r16, %r0, %r31
	.word 0xfa758000  ! 3688: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xf835e00a  ! 3689: STH_I	sth	%r28, [%r23 + 0x000a]
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, 14)
cpu_intr_3_306:
	setx	0x3f012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0952094  ! 3696: ORcc_I	orcc 	%r20, 0x0094, %r24
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_wr_158:
	mov	0xc, %r14
	.word 0xf8f38e40  ! 3698: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfef4607b  ! 3702: STXA_I	stxa	%r31, [%r17 + 0x007b] %asi
cpu_intr_3_307:
	setx	0x3c001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa4c020  ! 3706: STWA_R	stwa	%r29, [%r19 + %r0] 0x01
	.word 0xf234c000  ! 3708: STH_R	sth	%r25, [%r19 + %r0]
cpu_intr_3_308:
	setx	0x3f011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ad0020  ! 3711: STBA_R	stba	%r25, [%r20 + %r0] 0x01
cpu_intr_3_309:
	setx	0x3f0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf824a1b8  ! 3715: STW_I	stw	%r28, [%r18 + 0x01b8]
	ta	T_CHANGE_HPRIV
cpu_intr_3_310:
	setx	0x3f0223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_311:
	setx	0x3f030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_166:
	mov	0x1d, %r14
	.word 0xf8db8e40  ! 3721: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf835c000  ! 3724: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xf024e068  ! 3725: STW_I	stw	%r24, [%r19 + 0x0068]
T3_asi_reg_rd_167:
	mov	0x25, %r14
	.word 0xf2db8e80  ! 3728: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf8a521d4  ! 3733: STWA_I	stwa	%r28, [%r20 + 0x01d4] %asi
	.word 0xb0444000  ! 3735: ADDC_R	addc 	%r17, %r0, %r24
	ta	T_CHANGE_HPRIV
	.word 0xfa2d60ab  ! 3738: STB_I	stb	%r29, [%r21 + 0x00ab]
	.word 0xf22c6061  ! 3740: STB_I	stb	%r25, [%r17 + 0x0061]
cpu_intr_3_312:
	setx	0x3c0319, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_159:
	mov	0x4, %r14
	.word 0xfcf38e60  ! 3745: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_wr_160:
	mov	0x1c, %r14
	.word 0xf6f38400  ! 3747: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T3_asi_reg_wr_161:
	mov	0x28, %r14
	.word 0xfef384a0  ! 3749: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_wr_162:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 3753: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf8a4a0ed  ! 3755: STWA_I	stwa	%r28, [%r18 + 0x00ed] %asi
	.word 0xfa35a1dd  ! 3757: STH_I	sth	%r29, [%r22 + 0x01dd]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf235e1d4  ! 3760: STH_I	sth	%r25, [%r23 + 0x01d4]
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf8b4a029  ! 3764: STHA_I	stha	%r28, [%r18 + 0x0029] %asi
	.word 0xb1353001  ! 3766: SRLX_I	srlx	%r20, 0x0001, %r24
	.word 0xfcb40020  ! 3768: STHA_R	stha	%r30, [%r16 + %r0] 0x01
cpu_intr_3_313:
	setx	0x3e003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 7)
	.word 0xf62cc000  ! 3778: STB_R	stb	%r27, [%r19 + %r0]
T3_asi_reg_wr_163:
	mov	0x0, %r14
	.word 0xf2f38400  ! 3780: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982d82  ! 3781: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d82, %hpstate
cpu_intr_3_314:
	setx	0x3e0023, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_168:
	mov	0x3c2, %r14
	.word 0xf4db84a0  ! 3784: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf43521a2  ! 3787: STH_I	sth	%r26, [%r20 + 0x01a2]
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 2d)
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_169:
	mov	0x3c1, %r14
	.word 0xfedb84a0  ! 3795: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xfc35a087  ! 3796: STH_I	sth	%r30, [%r22 + 0x0087]
cpu_intr_3_315:
	setx	0x3c0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6248000  ! 3801: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xb20c61e2  ! 3804: AND_I	and 	%r17, 0x01e2, %r25
	.word 0xfe2c60d8  ! 3810: STB_I	stb	%r31, [%r17 + 0x00d8]
	.word 0xbeb5e10c  ! 3812: SUBCcc_I	orncc 	%r23, 0x010c, %r31
	.word 0xfcad211f  ! 3815: STBA_I	stba	%r30, [%r20 + 0x011f] %asi
	.word 0xfef56063  ! 3818: STXA_I	stxa	%r31, [%r21 + 0x0063] %asi
	.word 0xfead603f  ! 3819: STBA_I	stba	%r31, [%r21 + 0x003f] %asi
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 12)
	.word 0xf82560a8  ! 3823: STW_I	stw	%r28, [%r21 + 0x00a8]
	.word 0xf62d2079  ! 3824: STB_I	stb	%r27, [%r20 + 0x0079]
	.word 0xbe8560ad  ! 3827: ADDcc_I	addcc 	%r21, 0x00ad, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb49d8000  ! 3829: XORcc_R	xorcc 	%r22, %r0, %r26
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 29)
	.word 0xf6b561b9  ! 3833: STHA_I	stha	%r27, [%r21 + 0x01b9] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_170:
	mov	0x13, %r14
	.word 0xf0db84a0  ! 3839: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 15)
	.word 0xf0744000  ! 3843: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xf0b58020  ! 3847: STHA_R	stha	%r24, [%r22 + %r0] 0x01
	.word 0xf4ad2023  ! 3848: STBA_I	stba	%r26, [%r20 + 0x0023] %asi
	.word 0xf8a5211e  ! 3851: STWA_I	stwa	%r28, [%r20 + 0x011e] %asi
	.word 0xb8b40000  ! 3856: ORNcc_R	orncc 	%r16, %r0, %r28
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_164:
	mov	0x16, %r14
	.word 0xf2f38e60  ! 3859: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_3_316:
	setx	0x3e0127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 23)
	.word 0xb0b4a1b2  ! 3866: SUBCcc_I	orncc 	%r18, 0x01b2, %r24
	.word 0xf2b4603a  ! 3869: STHA_I	stha	%r25, [%r17 + 0x003a] %asi
	.word 0xfc74e114  ! 3870: STX_I	stx	%r30, [%r19 + 0x0114]
	.word 0xf2758000  ! 3871: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xfc35617b  ! 3872: STH_I	sth	%r30, [%r21 + 0x017b]
	.word 0xfef4a0b4  ! 3873: STXA_I	stxa	%r31, [%r18 + 0x00b4] %asi
	.word 0xfca5c020  ! 3875: STWA_R	stwa	%r30, [%r23 + %r0] 0x01
	.word 0xf0a5208e  ! 3876: STWA_I	stwa	%r24, [%r20 + 0x008e] %asi
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 33)
	.word 0xfe75c000  ! 3883: STX_R	stx	%r31, [%r23 + %r0]
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 15)
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x8198295a  ! 3893: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095a, %hpstate
	.word 0xbe0da04b  ! 3894: AND_I	and 	%r22, 0x004b, %r31
	.word 0xf235e07c  ! 3895: STH_I	sth	%r25, [%r23 + 0x007c]
cpu_intr_3_317:
	setx	0x3d002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab48000  ! 3898: ORNcc_R	orncc 	%r18, %r0, %r29
cpu_intr_3_318:
	setx	0x3c011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b4e1d6  ! 3900: ORNcc_I	orncc 	%r19, 0x01d6, %r27
	.word 0xb6a5e085  ! 3901: SUBcc_I	subcc 	%r23, 0x0085, %r27
	.word 0xf2ad2045  ! 3902: STBA_I	stba	%r25, [%r20 + 0x0045] %asi
	.word 0xf074601e  ! 3903: STX_I	stx	%r24, [%r17 + 0x001e]
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 1)
	.word 0xf0b58020  ! 3905: STHA_R	stha	%r24, [%r22 + %r0] 0x01
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_rd_171:
	mov	0x3c7, %r14
	.word 0xfedb8400  ! 3911: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf8a44020  ! 3913: STWA_R	stwa	%r28, [%r17 + %r0] 0x01
	.word 0xf825215b  ! 3914: STW_I	stw	%r28, [%r20 + 0x015b]
	.word 0xb8ad61b6  ! 3915: ANDNcc_I	andncc 	%r21, 0x01b6, %r28
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf624c000  ! 3917: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xf2244000  ! 3918: STW_R	stw	%r25, [%r17 + %r0]
T3_asi_reg_wr_165:
	mov	0x8, %r14
	.word 0xf0f38e40  ! 3921: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf834a10e  ! 3925: STH_I	sth	%r28, [%r18 + 0x010e]
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf875a021  ! 3935: STX_I	stx	%r28, [%r22 + 0x0021]
T3_asi_reg_wr_166:
	mov	0x26, %r14
	.word 0xf0f38e40  ! 3938: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb634c000  ! 3940: ORN_R	orn 	%r19, %r0, %r27
	.word 0xf0b5e0a7  ! 3942: STHA_I	stha	%r24, [%r23 + 0x00a7] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0xf6ade13c  ! 3946: STBA_I	stba	%r27, [%r23 + 0x013c] %asi
cpu_intr_3_319:
	setx	0x3c022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b4c020  ! 3948: STHA_R	stha	%r24, [%r19 + %r0] 0x01
T3_asi_reg_wr_167:
	mov	0x5, %r14
	.word 0xf6f38e80  ! 3949: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf82d6190  ! 3950: STB_I	stb	%r28, [%r21 + 0x0190]
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982f52  ! 3951: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f52, %hpstate
	.word 0xf6f5e14b  ! 3952: STXA_I	stxa	%r27, [%r23 + 0x014b] %asi
	.word 0xf6a42168  ! 3955: STWA_I	stwa	%r27, [%r16 + 0x0168] %asi
	.word 0xfe25a0a3  ! 3956: STW_I	stw	%r31, [%r22 + 0x00a3]
	.word 0xf8b40020  ! 3958: STHA_R	stha	%r28, [%r16 + %r0] 0x01
	ta	T_CHANGE_HPRIV
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 37)
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983e88  ! 3973: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e88, %hpstate
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_320:
	setx	0x3c032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_172:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 3981: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfca521b6  ! 3982: STWA_I	stwa	%r30, [%r20 + 0x01b6] %asi
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_321:
	setx	0x3e0338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 19)
	.word 0xf8b50020  ! 3994: STHA_R	stha	%r28, [%r20 + %r0] 0x01
T3_asi_reg_wr_168:
	mov	0x35, %r14
	.word 0xf8f38e60  ! 3995: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_169:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 4000: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb03d6044  ! 4002: XNOR_I	xnor 	%r21, 0x0044, %r24
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 2e)
	.word 0xba8d61a6  ! 4006: ANDcc_I	andcc 	%r21, 0x01a6, %r29
	.word 0xba9d4000  ! 4008: XORcc_R	xorcc 	%r21, %r0, %r29
T3_asi_reg_wr_170:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 4009: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_3_322:
	setx	0x3e0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62c20b6  ! 4011: STB_I	stb	%r27, [%r16 + 0x00b6]
	.word 0xbeac0000  ! 4012: ANDNcc_R	andncc 	%r16, %r0, %r31
cpu_intr_3_323:
	setx	0x3e003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_173:
	mov	0x26, %r14
	.word 0xf2db8e60  ! 4015: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf6b5c020  ! 4017: STHA_R	stha	%r27, [%r23 + %r0] 0x01
	.word 0x8595e13c  ! 4019: WRPR_TSTATE_I	wrpr	%r23, 0x013c, %tstate
	.word 0xf824e14a  ! 4020: STW_I	stw	%r28, [%r19 + 0x014a]
	.word 0xf875a184  ! 4024: STX_I	stx	%r28, [%r22 + 0x0184]
	.word 0xfe2c0000  ! 4026: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xf2354000  ! 4032: STH_R	sth	%r25, [%r21 + %r0]
cpu_intr_3_324:
	setx	0x3d000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_171:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 4039: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf475c000  ! 4041: STX_R	stx	%r26, [%r23 + %r0]
T3_asi_reg_wr_172:
	mov	0x2, %r14
	.word 0xf0f38400  ! 4043: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_rd_174:
	mov	0x3c7, %r14
	.word 0xf2db89e0  ! 4048: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, 2c)
	.word 0xfa2ca14a  ! 4052: STB_I	stb	%r29, [%r18 + 0x014a]
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_wr_173:
	mov	0x16, %r14
	.word 0xf2f38e40  ! 4054: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_174:
	mov	0x1f, %r14
	.word 0xf8f38e40  ! 4055: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_rd_175:
	mov	0xd, %r14
	.word 0xfadb84a0  ! 4056: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xba850000  ! 4061: ADDcc_R	addcc 	%r20, %r0, %r29
cpu_intr_3_325:
	setx	0x3f013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_175:
	mov	0x31, %r14
	.word 0xfef38e80  ! 4067: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 1)
	ta	T_CHANGE_NONHPRIV
	.word 0xfead8020  ! 4070: STBA_R	stba	%r31, [%r22 + %r0] 0x01
	.word 0xf474a010  ! 4071: STX_I	stx	%r26, [%r18 + 0x0010]
cpu_intr_3_326:
	setx	0x3e0329, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_176:
	mov	0x3c7, %r14
	.word 0xfadb84a0  ! 4073: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T3_asi_reg_rd_177:
	mov	0x34, %r14
	.word 0xfcdb8e80  ! 4078: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfc2d0000  ! 4079: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xf8a54020  ! 4082: STWA_R	stwa	%r28, [%r21 + %r0] 0x01
cpu_intr_3_327:
	setx	0x3e003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_328:
	setx	0x3d0313, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_329:
	setx	0x3e0303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_330:
	setx	0x3c0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22d21f4  ! 4092: STB_I	stb	%r25, [%r20 + 0x01f4]
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfe248000  ! 4095: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xfc240000  ! 4098: STW_R	stw	%r30, [%r16 + %r0]
	.word 0xf4246020  ! 4102: STW_I	stw	%r26, [%r17 + 0x0020]
T3_asi_reg_wr_176:
	mov	0x35, %r14
	.word 0xfef389e0  ! 4103: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_3_331:
	setx	0x3e0121, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_178:
	mov	0x1c, %r14
	.word 0xf6db8e40  ! 4107: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_TO_TL0
	.word 0xb4244000  ! 4109: SUB_R	sub 	%r17, %r0, %r26
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_wr_177:
	mov	0x20, %r14
	.word 0xfcf38e60  ! 4114: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_332:
	setx	0x40030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_178:
	mov	0xc, %r14
	.word 0xfef38e60  ! 4118: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T3_asi_reg_wr_179:
	mov	0x5, %r14
	.word 0xfef384a0  ! 4119: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfcb44020  ! 4120: STHA_R	stha	%r30, [%r17 + %r0] 0x01
cpu_intr_3_333:
	setx	0x40032c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_334:
	setx	0x420131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b5a0a8  ! 4127: STHA_I	stha	%r26, [%r22 + 0x00a8] %asi
	.word 0xb88cc000  ! 4129: ANDcc_R	andcc 	%r19, %r0, %r28
cpu_intr_3_335:
	setx	0x420234, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_179:
	mov	0x1f, %r14
	.word 0xfedb84a0  ! 4132: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbf351000  ! 4133: SRLX_R	srlx	%r20, %r0, %r31
	.word 0xb7500000  ! 4134: RDPR_TPC	rdpr	%tpc, %r27
cpu_intr_3_336:
	setx	0x40012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_337:
	setx	0x41013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0348000  ! 4137: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xf2ad4020  ! 4140: STBA_R	stba	%r25, [%r21 + %r0] 0x01
cpu_intr_3_338:
	setx	0x400220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_339:
	setx	0x40023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1dc000  ! 4149: XOR_R	xor 	%r23, %r0, %r30
	.word 0xfc3521ca  ! 4151: STH_I	sth	%r30, [%r20 + 0x01ca]
T3_asi_reg_rd_180:
	mov	0x6, %r14
	.word 0xfcdb8400  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_wr_180:
	mov	0x16, %r14
	.word 0xf4f38400  ! 4159: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T3_asi_reg_rd_181:
	mov	0x3c5, %r14
	.word 0xfadb89e0  ! 4160: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_wr_181:
	mov	0x3c6, %r14
	.word 0xfcf384a0  ! 4161: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfe250000  ! 4162: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xfcac0020  ! 4165: STBA_R	stba	%r30, [%r16 + %r0] 0x01
cpu_intr_3_340:
	setx	0x420321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf424e14d  ! 4167: STW_I	stw	%r26, [%r19 + 0x014d]
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_341:
	setx	0x410014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf356001  ! 4175: SRL_I	srl 	%r21, 0x0001, %r31
	.word 0xf4342040  ! 4176: STH_I	sth	%r26, [%r16 + 0x0040]
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 37)
	.word 0xbe2da1a0  ! 4178: ANDN_I	andn 	%r22, 0x01a0, %r31
cpu_intr_3_342:
	setx	0x41011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4adc020  ! 4184: STBA_R	stba	%r26, [%r23 + %r0] 0x01
cpu_intr_3_343:
	setx	0x40010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba84e056  ! 4188: ADDcc_I	addcc 	%r19, 0x0056, %r29
cpu_intr_3_344:
	setx	0x400039, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982e98  ! 4197: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e98, %hpstate
	.word 0xfc348000  ! 4199: STH_R	sth	%r30, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xfab4c020  ! 4201: STHA_R	stha	%r29, [%r19 + %r0] 0x01
	.word 0xba14c000  ! 4204: OR_R	or 	%r19, %r0, %r29
	.word 0xf2250000  ! 4208: STW_R	stw	%r25, [%r20 + %r0]
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 24)
	.word 0xf82c61bd  ! 4211: STB_I	stb	%r28, [%r17 + 0x01bd]
T3_asi_reg_rd_182:
	mov	0x34, %r14
	.word 0xfedb89e0  ! 4213: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf87420ac  ! 4216: STX_I	stx	%r28, [%r16 + 0x00ac]
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, 3)
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf0744000  ! 4223: STX_R	stx	%r24, [%r17 + %r0]
cpu_intr_3_345:
	setx	0x420103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_346:
	setx	0x3032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42c610b  ! 4229: STB_I	stb	%r26, [%r17 + 0x010b]
cpu_intr_3_347:
	setx	0x430301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_348:
	setx	0x400028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22560b5  ! 4238: STW_I	stw	%r25, [%r21 + 0x00b5]
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 1)
	.word 0xb7500000  ! 4248: RDPR_TPC	rdpr	%tpc, %r27
T3_asi_reg_wr_182:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 4249: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_349:
	setx	0x420309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe25c000  ! 4252: STW_R	stw	%r31, [%r23 + %r0]
	.word 0xfcadc020  ! 4254: STBA_R	stba	%r30, [%r23 + %r0] 0x01
	.word 0xfeb4a123  ! 4256: STHA_I	stha	%r31, [%r18 + 0x0123] %asi
	.word 0xfe24a144  ! 4257: STW_I	stw	%r31, [%r18 + 0x0144]
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_183:
	mov	0x20, %r14
	.word 0xfedb89e0  ! 4260: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T3_asi_reg_rd_184:
	mov	0xd, %r14
	.word 0xf0db89e0  ! 4261: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_350:
	setx	0x42020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_183:
	mov	0x1e, %r14
	.word 0xf6f389e0  ! 4266: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf2750000  ! 4267: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xf2340000  ! 4271: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xb835c000  ! 4272: ORN_R	orn 	%r23, %r0, %r28
cpu_intr_3_351:
	setx	0x420332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8750000  ! 4274: STX_R	stx	%r28, [%r20 + %r0]
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982d08  ! 4275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d08, %hpstate
T3_asi_reg_rd_185:
	mov	0x17, %r14
	.word 0xf4db8e40  ! 4277: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_rd_186:
	mov	0x3c3, %r14
	.word 0xf6db8e60  ! 4280: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_3_352:
	setx	0x400227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_353:
	setx	0x420233, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_3_354:
	setx	0x42003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa4c020  ! 4289: STWA_R	stwa	%r29, [%r19 + %r0] 0x01
cpu_intr_3_355:
	setx	0x42031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf434c000  ! 4299: STH_R	sth	%r26, [%r19 + %r0]
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 23)
	.word 0xfab5600c  ! 4304: STHA_I	stha	%r29, [%r21 + 0x000c] %asi
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 19)
	.word 0xfc2d4000  ! 4308: STB_R	stb	%r30, [%r21 + %r0]
cpu_intr_3_356:
	setx	0x40001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8356078  ! 4313: STH_I	sth	%r28, [%r21 + 0x0078]
	.word 0xb3641800  ! 4316: MOVcc_R	<illegal instruction>
	.word 0xf2b40020  ! 4317: STHA_R	stha	%r25, [%r16 + %r0] 0x01
	.word 0xf835a1d2  ! 4320: STH_I	sth	%r28, [%r22 + 0x01d2]
cpu_intr_3_357:
	setx	0x400219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42ce061  ! 4328: STB_I	stb	%r26, [%r19 + 0x0061]
	.word 0xf235e09a  ! 4330: STH_I	sth	%r25, [%r23 + 0x009a]
	.word 0xb22ce1a2  ! 4331: ANDN_I	andn 	%r19, 0x01a2, %r25
	.word 0xf6a4e0aa  ! 4334: STWA_I	stwa	%r27, [%r19 + 0x00aa] %asi
T3_asi_reg_wr_184:
	mov	0x36, %r14
	.word 0xf6f38400  ! 4335: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf42c4000  ! 4343: STB_R	stb	%r26, [%r17 + %r0]
T3_asi_reg_wr_185:
	mov	0x2a, %r14
	.word 0xfcf389e0  ! 4344: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfaf52127  ! 4347: STXA_I	stxa	%r29, [%r20 + 0x0127] %asi
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_358:
	setx	0x430133, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_186:
	mov	0x35, %r14
	.word 0xfcf38e80  ! 4352: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T3_asi_reg_rd_187:
	mov	0x34, %r14
	.word 0xfadb89e0  ! 4356: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_3_359:
	setx	0x430207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_360:
	setx	0x42003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_361:
	setx	0x410332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 15)
	.word 0xb2bd61b0  ! 4362: XNORcc_I	xnorcc 	%r21, 0x01b0, %r25
	.word 0xf8344000  ! 4366: STH_R	sth	%r28, [%r17 + %r0]
cpu_intr_3_362:
	setx	0x41032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8340000  ! 4373: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xfcb5a02b  ! 4374: STHA_I	stha	%r30, [%r22 + 0x002b] %asi
T3_asi_reg_rd_188:
	mov	0x3c8, %r14
	.word 0xf0db8e60  ! 4375: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T3_asi_reg_rd_189:
	mov	0x3c8, %r14
	.word 0xf6db84a0  ! 4377: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 11)
	.word 0xf4b5a013  ! 4383: STHA_I	stha	%r26, [%r22 + 0x0013] %asi
	.word 0xb93dd000  ! 4384: SRAX_R	srax	%r23, %r0, %r28
cpu_intr_3_363:
	setx	0x40010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_364:
	setx	0x420132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf835c000  ! 4388: STH_R	sth	%r28, [%r23 + %r0]
T3_asi_reg_rd_190:
	mov	0x1, %r14
	.word 0xf6db8e80  ! 4389: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfe25c000  ! 4390: STW_R	stw	%r31, [%r23 + %r0]
	.word 0xf42d20c1  ! 4391: STB_I	stb	%r26, [%r20 + 0x00c1]
	.word 0xf0a4e1fe  ! 4392: STWA_I	stwa	%r24, [%r19 + 0x01fe] %asi
	.word 0xf6248000  ! 4395: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xf0f5211d  ! 4396: STXA_I	stxa	%r24, [%r20 + 0x011d] %asi
	ta	T_CHANGE_TO_TL0
cpu_intr_3_365:
	setx	0x400237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcac616c  ! 4402: STBA_I	stba	%r30, [%r17 + 0x016c] %asi
	.word 0xf6b58020  ! 4404: STHA_R	stha	%r27, [%r22 + %r0] 0x01
	.word 0xfa2c0000  ! 4405: STB_R	stb	%r29, [%r16 + %r0]
cpu_intr_3_366:
	setx	0x40033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 4414: RDPR_TT	rdpr	%tt, %r31
cpu_intr_3_367:
	setx	0x40021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_368:
	setx	0x40033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 34)
	ta	T_CHANGE_TO_TL1
	.word 0xf8a5c020  ! 4423: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
cpu_intr_3_369:
	setx	0x430120, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_370:
	setx	0x430232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d8000  ! 4432: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xf02d8000  ! 4436: STB_R	stb	%r24, [%r22 + %r0]
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_187:
	mov	0x29, %r14
	.word 0xfcf38e40  ! 4439: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf434e18c  ! 4440: STH_I	sth	%r26, [%r19 + 0x018c]
	.word 0xfa74c000  ! 4441: STX_R	stx	%r29, [%r19 + %r0]
	.word 0xbb2dc000  ! 4445: SLL_R	sll 	%r23, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfaac0020  ! 4448: STBA_R	stba	%r29, [%r16 + %r0] 0x01
	.word 0xfa24c000  ! 4453: STW_R	stw	%r29, [%r19 + %r0]
T3_asi_reg_rd_191:
	mov	0x3c1, %r14
	.word 0xfadb84a0  ! 4454: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb7641800  ! 4455: MOVcc_R	<illegal instruction>
cpu_intr_3_371:
	setx	0x43033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_372:
	setx	0x42003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb50020  ! 4459: STHA_R	stha	%r31, [%r20 + %r0] 0x01
	.word 0xbea4a1f4  ! 4460: SUBcc_I	subcc 	%r18, 0x01f4, %r31
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 36)
	ta	T_CHANGE_TO_TL0
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982b98  ! 4467: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b98, %hpstate
	.word 0xfc2460e5  ! 4472: STW_I	stw	%r30, [%r17 + 0x00e5]
T3_asi_reg_wr_188:
	mov	0xe, %r14
	.word 0xf8f384a0  ! 4475: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb434a1ad  ! 4477: ORN_I	orn 	%r18, 0x01ad, %r26
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 2a)
	.word 0xfaac60da  ! 4482: STBA_I	stba	%r29, [%r17 + 0x00da] %asi
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_373:
	setx	0x410035, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_189:
	mov	0x13, %r14
	.word 0xf8f38e60  ! 4486: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb4258000  ! 4487: SUB_R	sub 	%r22, %r0, %r26
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_190:
	mov	0x3c0, %r14
	.word 0xf0f384a0  ! 4491: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_3_374:
	setx	0x41033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_191:
	mov	0x3c4, %r14
	.word 0xfaf389e0  ! 4494: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfef560aa  ! 4496: STXA_I	stxa	%r31, [%r21 + 0x00aa] %asi
cpu_intr_3_375:
	setx	0x410027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_376:
	setx	0x41022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_377:
	setx	0x410327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, f)
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, 27)
	.word 0xfaa520e5  ! 4507: STWA_I	stwa	%r29, [%r20 + 0x00e5] %asi
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, 4)
	.word 0xf8b48020  ! 4510: STHA_R	stha	%r28, [%r18 + %r0] 0x01
cpu_intr_3_378:
	setx	0x42010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 17)
cpu_intr_3_379:
	setx	0x410332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0752034  ! 4522: STX_I	stx	%r24, [%r20 + 0x0034]
	.word 0xb444a1bc  ! 4523: ADDC_I	addc 	%r18, 0x01bc, %r26
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, 16)
	.word 0xb8a4e189  ! 4526: SUBcc_I	subcc 	%r19, 0x0189, %r28
	.word 0xf8b44020  ! 4528: STHA_R	stha	%r28, [%r17 + %r0] 0x01
	.word 0xf2f420c9  ! 4529: STXA_I	stxa	%r25, [%r16 + 0x00c9] %asi
	.word 0xf6a5606c  ! 4530: STWA_I	stwa	%r27, [%r21 + 0x006c] %asi
	.word 0xfaf4204b  ! 4531: STXA_I	stxa	%r29, [%r16 + 0x004b] %asi
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983998  ! 4532: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1998, %hpstate
	.word 0xf2248000  ! 4536: STW_R	stw	%r25, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe24201a  ! 4539: STW_I	stw	%r31, [%r16 + 0x001a]
cpu_intr_3_380:
	setx	0x400213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8058000  ! 4543: ADD_R	add 	%r22, %r0, %r28
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_rd_192:
	mov	0x3c6, %r14
	.word 0xf0db8e80  ! 4545: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	ta	T_CHANGE_TO_TL0
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_wr_192:
	mov	0x3c2, %r14
	.word 0xfef384a0  ! 4553: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf4358000  ! 4559: STH_R	sth	%r26, [%r22 + %r0]
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982818  ! 4560: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0818, %hpstate
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_wr_193:
	mov	0x22, %r14
	.word 0xf6f38e40  ! 4564: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_381:
	setx	0x40020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_193:
	mov	0x1f, %r14
	.word 0xf8db8e40  ! 4566: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_382:
	setx	0x43000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_383:
	setx	0x420330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_384:
	setx	0x410223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ad0020  ! 4573: STBA_R	stba	%r28, [%r20 + %r0] 0x01
T3_asi_reg_wr_194:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 4574: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_rd_194:
	mov	0x3c6, %r14
	.word 0xfadb8e60  ! 4576: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_3_385:
	setx	0x43022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40c4000  ! 4578: AND_R	and 	%r17, %r0, %r26
	.word 0xf635a1db  ! 4580: STH_I	sth	%r27, [%r22 + 0x01db]
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf02c6079  ! 4584: STB_I	stb	%r24, [%r17 + 0x0079]
	.word 0xbd3c2001  ! 4585: SRA_I	sra 	%r16, 0x0001, %r30
	.word 0xfa2d0000  ! 4586: STB_R	stb	%r29, [%r20 + %r0]
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, 7)
	.word 0xb0bc6182  ! 4588: XNORcc_I	xnorcc 	%r17, 0x0182, %r24
	.word 0xf6a54020  ! 4590: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
T3_asi_reg_rd_195:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 4592: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_386:
	setx	0x410218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2c6141  ! 4598: ANDN_I	andn 	%r17, 0x0141, %r31
T3_asi_reg_wr_195:
	mov	0x19, %r14
	.word 0xfcf38e40  ! 4599: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, b)
	.word 0xf2ad2091  ! 4601: STBA_I	stba	%r25, [%r20 + 0x0091] %asi
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_rd_196:
	mov	0x3c3, %r14
	.word 0xfedb8400  ! 4603: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfe35a13d  ! 4605: STH_I	sth	%r31, [%r22 + 0x013d]
T3_asi_reg_rd_197:
	mov	0x21, %r14
	.word 0xf0db8e40  ! 4607: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_387:
	setx	0x470232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf075e025  ! 4610: STX_I	stx	%r24, [%r23 + 0x0025]
cpu_intr_3_388:
	setx	0x470304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_rd_198:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 4617: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf2b561f2  ! 4620: STHA_I	stha	%r25, [%r21 + 0x01f2] %asi
	.word 0xf6350000  ! 4623: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xf4ac2059  ! 4624: STBA_I	stba	%r26, [%r16 + 0x0059] %asi
	.word 0xfc75c000  ! 4625: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xb495e062  ! 4626: ORcc_I	orcc 	%r23, 0x0062, %r26
	ta	T_CHANGE_TO_TL1
	.word 0xf8a4a15f  ! 4634: STWA_I	stwa	%r28, [%r18 + 0x015f] %asi
T3_asi_reg_wr_196:
	mov	0x8, %r14
	.word 0xf0f384a0  ! 4636: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf8ade10e  ! 4637: STBA_I	stba	%r28, [%r23 + 0x010e] %asi
T3_asi_reg_rd_199:
	mov	0x34, %r14
	.word 0xfadb8e80  ! 4639: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfaa58020  ! 4640: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
	.word 0xf2250000  ! 4641: STW_R	stw	%r25, [%r20 + %r0]
	.word 0xf6750000  ! 4642: STX_R	stx	%r27, [%r20 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xf6240000  ! 4649: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xbabd8000  ! 4651: XNORcc_R	xnorcc 	%r22, %r0, %r29
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_389:
	setx	0x45002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_197:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 4656: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb03460eb  ! 4658: ORN_I	orn 	%r17, 0x00eb, %r24
cpu_intr_3_390:
	setx	0x460032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf424a07e  ! 4660: STW_I	stw	%r26, [%r18 + 0x007e]
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 1d)
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 6)
	ta	T_CHANGE_TO_TL1
	.word 0xf225a1ab  ! 4666: STW_I	stw	%r25, [%r22 + 0x01ab]
cpu_intr_3_391:
	setx	0x450236, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_200:
	mov	0x1d, %r14
	.word 0xf2db8e40  ! 4671: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf275615e  ! 4676: STX_I	stx	%r25, [%r21 + 0x015e]
T3_asi_reg_rd_201:
	mov	0x3c5, %r14
	.word 0xfedb8400  ! 4678: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf6740000  ! 4679: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xf6246092  ! 4682: STW_I	stw	%r27, [%r17 + 0x0092]
	.word 0xf8a56143  ! 4683: STWA_I	stwa	%r28, [%r21 + 0x0143] %asi
cpu_intr_3_392:
	setx	0x114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf2ad61a0  ! 4689: STBA_I	stba	%r25, [%r21 + 0x01a0] %asi
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 24)
	.word 0xf83560e5  ! 4691: STH_I	sth	%r28, [%r21 + 0x00e5]
cpu_intr_3_393:
	setx	0x450024, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_202:
	mov	0x8, %r14
	.word 0xf8db84a0  ! 4693: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf875c000  ! 4694: STX_R	stx	%r28, [%r23 + %r0]
cpu_intr_3_394:
	setx	0x460115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf074e1bd  ! 4696: STX_I	stx	%r24, [%r19 + 0x01bd]
	.word 0xf6748000  ! 4697: STX_R	stx	%r27, [%r18 + %r0]
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 5)
	.word 0xf8748000  ! 4699: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xf2b48020  ! 4707: STHA_R	stha	%r25, [%r18 + %r0] 0x01
T3_asi_reg_rd_203:
	mov	0x35, %r14
	.word 0xfcdb89e0  ! 4709: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf0a5e1c8  ! 4713: STWA_I	stwa	%r24, [%r23 + 0x01c8] %asi
	.word 0xfcad8020  ! 4718: STBA_R	stba	%r30, [%r22 + %r0] 0x01
	.word 0xfa74218a  ! 4723: STX_I	stx	%r29, [%r16 + 0x018a]
cpu_intr_3_395:
	setx	0x470118, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_396:
	setx	0x460108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 31)
	.word 0xb4b50000  ! 4734: ORNcc_R	orncc 	%r20, %r0, %r26
	.word 0xf22c4000  ! 4740: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xf4a560aa  ! 4746: STWA_I	stwa	%r26, [%r21 + 0x00aa] %asi
	.word 0xf674e0a9  ! 4747: STX_I	stx	%r27, [%r19 + 0x00a9]
	ta	T_CHANGE_TO_TL0
	.word 0xf6b54020  ! 4749: STHA_R	stha	%r27, [%r21 + %r0] 0x01
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, 20)
	.word 0xf2f560f2  ! 4751: STXA_I	stxa	%r25, [%r21 + 0x00f2] %asi
T3_asi_reg_wr_198:
	mov	0x3c1, %r14
	.word 0xfcf38e80  ! 4752: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_3_397:
	setx	0x45022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_204:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 4758: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf4ad4020  ! 4759: STBA_R	stba	%r26, [%r21 + %r0] 0x01
	.word 0xf42c215f  ! 4761: STB_I	stb	%r26, [%r16 + 0x015f]
	.word 0xb694e1f4  ! 4763: ORcc_I	orcc 	%r19, 0x01f4, %r27
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, b)
	.word 0xa1902002  ! 4765: WRPR_GL_I	wrpr	%r0, 0x0002, %-
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_rd_205:
	mov	0x1e, %r14
	.word 0xf0db84a0  ! 4768: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_398:
	setx	0x450020, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_206:
	mov	0xe, %r14
	.word 0xfedb89e0  ! 4773: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfc744000  ! 4775: STX_R	stx	%r30, [%r17 + %r0]
cpu_intr_3_399:
	setx	0x470038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6f4205f  ! 4781: STXA_I	stxa	%r27, [%r16 + 0x005f] %asi
cpu_intr_3_400:
	setx	0x44022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe250000  ! 4787: STW_R	stw	%r31, [%r20 + %r0]
T3_asi_reg_wr_199:
	mov	0x1a, %r14
	.word 0xf2f384a0  ! 4790: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf2358000  ! 4791: STH_R	sth	%r25, [%r22 + %r0]
cpu_intr_3_401:
	setx	0x44030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4340000  ! 4800: STH_R	sth	%r26, [%r16 + %r0]
T3_asi_reg_wr_200:
	mov	0x0, %r14
	.word 0xf4f38400  ! 4801: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T3_asi_reg_wr_201:
	mov	0x34, %r14
	.word 0xfaf38e60  ! 4802: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf8b58020  ! 4804: STHA_R	stha	%r28, [%r22 + %r0] 0x01
	.word 0xf8ade071  ! 4805: STBA_I	stba	%r28, [%r23 + 0x0071] %asi
T3_asi_reg_wr_202:
	mov	0x3c5, %r14
	.word 0xf8f38e60  ! 4808: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, 11)
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982a90  ! 4810: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a90, %hpstate
	.word 0xfea44020  ! 4814: STWA_R	stwa	%r31, [%r17 + %r0] 0x01
	.word 0xf675a11a  ! 4815: STX_I	stx	%r27, [%r22 + 0x011a]
	.word 0xfc25a163  ! 4817: STW_I	stw	%r30, [%r22 + 0x0163]
	.word 0xf035a1e7  ! 4819: STH_I	sth	%r24, [%r22 + 0x01e7]
	.word 0xfc34e026  ! 4821: STH_I	sth	%r30, [%r19 + 0x0026]
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, 14)
cpu_intr_3_402:
	setx	0x450302, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, 16)
	.word 0xf6240000  ! 4828: STW_R	stw	%r27, [%r16 + %r0]
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_wr_203:
	mov	0x31, %r14
	.word 0xf0f384a0  ! 4834: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T3_asi_reg_wr_204:
	mov	0xe, %r14
	.word 0xf2f38e40  ! 4836: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_205:
	mov	0x2, %r14
	.word 0xf8f38400  ! 4841: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb484e180  ! 4842: ADDcc_I	addcc 	%r19, 0x0180, %r26
	.word 0xfaa52181  ! 4843: STWA_I	stwa	%r29, [%r20 + 0x0181] %asi
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_wr_206:
	mov	0x32, %r14
	.word 0xf6f38e40  ! 4847: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, 12)
	.word 0xf2b4e0be  ! 4849: STHA_I	stha	%r25, [%r19 + 0x00be] %asi
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_rd_207:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 4851: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_403:
	setx	0x44032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, 14)
	.word 0xfcb52079  ! 4858: STHA_I	stha	%r30, [%r20 + 0x0079] %asi
T3_asi_reg_wr_207:
	mov	0x1a, %r14
	.word 0xfaf389e0  ! 4861: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf6a40020  ! 4863: STWA_R	stwa	%r27, [%r16 + %r0] 0x01
	.word 0xf225a035  ! 4869: STW_I	stw	%r25, [%r22 + 0x0035]
	ta	T_CHANGE_TO_TL1
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, 25)
	.word 0xfe74e17c  ! 4876: STX_I	stx	%r31, [%r19 + 0x017c]
T3_asi_reg_rd_208:
	mov	0xc, %r14
	.word 0xf6db89e0  ! 4881: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, a)
	.word 0xb1643801  ! 4884: MOVcc_I	<illegal instruction>
T3_asi_reg_rd_209:
	mov	0x25, %r14
	.word 0xf2db8400  ! 4891: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf2b5e1d9  ! 4892: STHA_I	stha	%r25, [%r23 + 0x01d9] %asi
cpu_intr_3_404:
	setx	0x45001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_405:
	setx	0x460319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ac4020  ! 4896: STBA_R	stba	%r24, [%r17 + %r0] 0x01
cpu_intr_3_406:
	setx	0x440016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, 27)
	.word 0xbea54000  ! 4899: SUBcc_R	subcc 	%r21, %r0, %r31
	.word 0xf2a4a13f  ! 4901: STWA_I	stwa	%r25, [%r18 + 0x013f] %asi
	.word 0xf0240000  ! 4902: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xf6240000  ! 4904: STW_R	stw	%r27, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982c52  ! 4911: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c52, %hpstate
	.word 0xf274c000  ! 4912: STX_R	stx	%r25, [%r19 + %r0]
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, 3)
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819838c8  ! 4915: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c8, %hpstate
	.word 0xfaa40020  ! 4916: STWA_R	stwa	%r29, [%r16 + %r0] 0x01
T3_asi_reg_rd_210:
	mov	0x3c8, %r14
	.word 0xfadb89e0  ! 4922: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_3_407:
	setx	0x470132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf874c000  ! 4924: STX_R	stx	%r28, [%r19 + %r0]
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, 19)
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982a12  ! 4928: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a12, %hpstate
	.word 0xfea54020  ! 4929: STWA_R	stwa	%r31, [%r21 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb29461a8  ! 4935: ORcc_I	orcc 	%r17, 0x01a8, %r25
	.word 0xf4ac4020  ! 4938: STBA_R	stba	%r26, [%r17 + %r0] 0x01
cpu_intr_3_408:
	setx	0x440228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_409:
	setx	0x44022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a5e0b5  ! 4946: STWA_I	stwa	%r25, [%r23 + 0x00b5] %asi
	.word 0xf0b5c020  ! 4947: STHA_R	stha	%r24, [%r23 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
cpu_intr_3_410:
	setx	0x460018, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_208:
	mov	0x37, %r14
	.word 0xf4f38400  ! 4952: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T3_asi_reg_wr_209:
	mov	0x2d, %r14
	.word 0xfcf38400  ! 4963: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, 35)
	.word 0xf6b520dd  ! 4972: STHA_I	stha	%r27, [%r20 + 0x00dd] %asi
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, 2)
	.word 0xf0a44020  ! 4978: STWA_R	stwa	%r24, [%r17 + %r0] 0x01
cpu_intr_3_411:
	setx	0x470233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_412:
	setx	0x450303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_413:
	setx	0x44003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6758000  ! 4985: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xf4240000  ! 4989: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xf22d0000  ! 4990: STB_R	stb	%r25, [%r20 + %r0]
T3_asi_reg_wr_210:
	mov	0x18, %r14
	.word 0xf4f38e60  ! 4992: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_3_414:
	setx	0x460034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf825214c  ! 4996: STW_I	stw	%r28, [%r20 + 0x014c]
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, a)
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
	.word 0xf44c4000  ! 1: LDSB_R	ldsb	[%r17 + %r0], %r26
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_0:
	mov	0xd, %r14
	.word 0xf6db8e40  ! 6: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf60d21f8  ! 9: LDUB_I	ldub	[%r20 + 0x01f8], %r27
	.word 0xf214c000  ! 10: LDUH_R	lduh	[%r19 + %r0], %r25
T2_asi_reg_wr_0:
	mov	0x3c8, %r14
	.word 0xfaf389e0  ! 11: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T2_asi_reg_wr_1:
	mov	0x2, %r14
	.word 0xf6f38400  ! 12: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T2_asi_reg_wr_2:
	mov	0x3c8, %r14
	.word 0xfaf384a0  ! 13: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_wr_3:
	mov	0x4, %r14
	.word 0xfcf38e60  ! 22: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_0:
	setx	0x1c0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40c2127  ! 27: LDUB_I	ldub	[%r16 + 0x0127], %r26
	.word 0xbe35e0f5  ! 28: SUBC_I	orn 	%r23, 0x00f5, %r31
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 2a)
	ta	T_CHANGE_HPRIV
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_wr_4:
	mov	0x12, %r14
	.word 0xf4f384a0  ! 37: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfc0c6072  ! 39: LDUB_I	ldub	[%r17 + 0x0072], %r30
	.word 0xfa94c020  ! 43: LDUHA_R	lduha	[%r19, %r0] 0x01, %r29
	.word 0xf80520b2  ! 44: LDUW_I	lduw	[%r20 + 0x00b2], %r28
	.word 0xfc0ce19a  ! 45: LDUB_I	ldub	[%r19 + 0x019a], %r30
	.word 0xf8dce16f  ! 46: LDXA_I	ldxa	[%r19, + 0x016f] %asi, %r28
T2_asi_reg_wr_5:
	mov	0x17, %r14
	.word 0xf0f38e40  ! 47: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_1:
	setx	0x1d0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecde160  ! 52: LDSBA_I	ldsba	[%r23, + 0x0160] %asi, %r31
	.word 0xfe0de082  ! 53: LDUB_I	ldub	[%r23 + 0x0082], %r31
cpu_intr_2_2:
	setx	0x1f0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982c4a  ! 55: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4a, %hpstate
	.word 0xb8bca174  ! 58: XNORcc_I	xnorcc 	%r18, 0x0174, %r28
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, 4)
cpu_intr_2_3:
	setx	0x1e0336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_4:
	setx	0x1f033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe940020  ! 64: LDUHA_R	lduha	[%r16, %r0] 0x01, %r31
	.word 0xf0cce0a6  ! 66: LDSBA_I	ldsba	[%r19, + 0x00a6] %asi, %r24
	.word 0xbf3d6001  ! 68: SRA_I	sra 	%r21, 0x0001, %r31
	.word 0xbf34f001  ! 69: SRLX_I	srlx	%r19, 0x0001, %r31
	.word 0xb9643801  ! 70: MOVcc_I	<illegal instruction>
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_6:
	mov	0xa, %r14
	.word 0xf6f38e40  ! 74: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
cpu_intr_2_5:
	setx	0x1e011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_7:
	mov	0x34, %r14
	.word 0xf8f389e0  ! 79: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_2_6:
	setx	0x1c0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28d8020  ! 81: LDUBA_R	lduba	[%r22, %r0] 0x01, %r25
	.word 0xf68dc020  ! 82: LDUBA_R	lduba	[%r23, %r0] 0x01, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xf49461d7  ! 85: LDUHA_I	lduha	[%r17, + 0x01d7] %asi, %r26
T2_asi_reg_rd_1:
	mov	0x14, %r14
	.word 0xf8db89e0  ! 87: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf85de16b  ! 89: LDX_I	ldx	[%r23 + 0x016b], %r28
T2_asi_reg_rd_2:
	mov	0x2, %r14
	.word 0xf0db84a0  ! 92: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_TO_TL1
	.word 0xf805e154  ! 95: LDUW_I	lduw	[%r23 + 0x0154], %r28
cpu_intr_2_7:
	setx	0x1e011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8dc2015  ! 98: LDXA_I	ldxa	[%r16, + 0x0015] %asi, %r28
T2_asi_reg_wr_8:
	mov	0x3c3, %r14
	.word 0xf4f389e0  ! 99: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T2_asi_reg_wr_9:
	mov	0x2f, %r14
	.word 0xf8f38e40  ! 102: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf0550000  ! 103: LDSH_R	ldsh	[%r20 + %r0], %r24
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_8:
	setx	0x1d002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_9:
	setx	0x1e0337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_10:
	setx	0x1e0108, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_10:
	mov	0x2d, %r14
	.word 0xf6f384a0  ! 114: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf2940020  ! 115: LDUHA_R	lduha	[%r16, %r0] 0x01, %r25
	.word 0xfa5d6148  ! 117: LDX_I	ldx	[%r21 + 0x0148], %r29
	.word 0xfa5d2000  ! 119: LDX_I	ldx	[%r20 + 0x0000], %r29
cpu_intr_2_11:
	setx	0x1c0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 127: RDPR_TT	<illegal instruction>
	.word 0xf0cd8020  ! 128: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r24
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 29)
cpu_intr_2_12:
	setx	0x1e0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d5e0ac  ! 133: LDSHA_I	ldsha	[%r23, + 0x00ac] %asi, %r24
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, b)
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 27)
cpu_intr_2_13:
	setx	0x1c023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf645a10d  ! 140: LDSW_I	ldsw	[%r22 + 0x010d], %r27
	.word 0xb09da083  ! 142: XORcc_I	xorcc 	%r22, 0x0083, %r24
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982f08  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f08, %hpstate
	.word 0xfe45a090  ! 148: LDSW_I	ldsw	[%r22 + 0x0090], %r31
	.word 0xf0544000  ! 149: LDSH_R	ldsh	[%r17 + %r0], %r24
cpu_intr_2_14:
	setx	0x1d0233, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 20)
	.word 0xf05d4000  ! 152: LDX_R	ldx	[%r21 + %r0], %r24
	.word 0xbd7d0400  ! 154: MOVR_R	movre	%r20, %r0, %r30
	.word 0xfa44e066  ! 157: LDSW_I	ldsw	[%r19 + 0x0066], %r29
cpu_intr_2_15:
	setx	0x1c023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c50020  ! 159: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r25
T2_asi_reg_rd_3:
	mov	0x1c, %r14
	.word 0xfadb8e80  ! 160: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf695a101  ! 162: LDUHA_I	lduha	[%r22, + 0x0101] %asi, %r27
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 31)
	.word 0xfe950020  ! 165: LDUHA_R	lduha	[%r20, %r0] 0x01, %r31
T2_asi_reg_rd_4:
	mov	0x3c3, %r14
	.word 0xf8db8e60  ! 167: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_rd_5:
	mov	0x14, %r14
	.word 0xf4db89e0  ! 170: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf284214f  ! 171: LDUWA_I	lduwa	[%r16, + 0x014f] %asi, %r25
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, 20)
	.word 0xf814a0f6  ! 173: LDUH_I	lduh	[%r18 + 0x00f6], %r28
cpu_intr_2_16:
	setx	0x1e0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982f4a  ! 176: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4a, %hpstate
	.word 0xba94e1d3  ! 177: ORcc_I	orcc 	%r19, 0x01d3, %r29
cpu_intr_2_17:
	setx	0x1f0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc85e053  ! 180: LDUWA_I	lduwa	[%r23, + 0x0053] %asi, %r30
	.word 0xfc4da0ed  ! 181: LDSB_I	ldsb	[%r22 + 0x00ed], %r30
T2_asi_reg_wr_11:
	mov	0xc, %r14
	.word 0xf6f384a0  ! 184: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf6d50020  ! 187: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r27
cpu_intr_2_18:
	setx	0x1f012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_19:
	setx	0x1f0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8450000  ! 191: LDSW_R	ldsw	[%r20 + %r0], %r28
cpu_intr_2_20:
	setx	0x1f031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00da045  ! 193: AND_I	and 	%r22, 0x0045, %r24
	.word 0xf095e0fc  ! 194: LDUHA_I	lduha	[%r23, + 0x00fc] %asi, %r24
	.word 0xf4cdc020  ! 197: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r26
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_21:
	setx	0x1c013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc52151  ! 203: LDSWA_I	ldswa	[%r20, + 0x0151] %asi, %r30
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_wr_12:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 206: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfe958020  ! 208: LDUHA_R	lduha	[%r22, %r0] 0x01, %r31
	.word 0xf085e078  ! 210: LDUWA_I	lduwa	[%r23, + 0x0078] %asi, %r24
cpu_intr_2_22:
	setx	0x1e001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_23:
	setx	0x1d030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_6:
	mov	0x3c6, %r14
	.word 0xf0db8400  ! 218: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_rd_7:
	mov	0x3c7, %r14
	.word 0xfcdb8e60  ! 219: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T2_asi_reg_rd_8:
	mov	0x2e, %r14
	.word 0xf4db89e0  ! 222: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb52cb001  ! 228: SLLX_I	sllx	%r18, 0x0001, %r26
cpu_intr_2_24:
	setx	0x1f0305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 14)
	.word 0xf695c020  ! 233: LDUHA_R	lduha	[%r23, %r0] 0x01, %r27
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf685613e  ! 235: LDUWA_I	lduwa	[%r21, + 0x013e] %asi, %r27
cpu_intr_2_25:
	setx	0x1c0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfe14a1ec  ! 241: LDUH_I	lduh	[%r18 + 0x01ec], %r31
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 2d)
	.word 0x859561bb  ! 243: WRPR_TSTATE_I	wrpr	%r21, 0x01bb, %tstate
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_26:
	setx	0x1f013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe84e154  ! 252: LDUWA_I	lduwa	[%r19, + 0x0154] %asi, %r31
	.word 0xf25ca02e  ! 256: LDX_I	ldx	[%r18 + 0x002e], %r25
T2_asi_reg_rd_9:
	mov	0x31, %r14
	.word 0xf8db8e40  ! 257: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf204209c  ! 258: LDUW_I	lduw	[%r16 + 0x009c], %r25
cpu_intr_2_27:
	setx	0x1f032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_28:
	setx	0x1c0112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, 16)
	.word 0xf45d6073  ! 268: LDX_I	ldx	[%r21 + 0x0073], %r26
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_10:
	mov	0x16, %r14
	.word 0xf2db8e60  ! 271: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T2_asi_reg_wr_13:
	mov	0x11, %r14
	.word 0xfef389e0  ! 273: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 19)
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983c0a  ! 277: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c0a, %hpstate
cpu_intr_2_29:
	setx	0x1f021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c58020  ! 285: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r27
T2_asi_reg_rd_11:
	mov	0x1d, %r14
	.word 0xf4db8e60  ! 287: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_rd_12:
	mov	0x3c5, %r14
	.word 0xf8db89e0  ! 290: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb83c0000  ! 294: XNOR_R	xnor 	%r16, %r0, %r28
cpu_intr_2_30:
	setx	0x1d0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7358000  ! 297: SRL_R	srl 	%r22, %r0, %r27
	.word 0xfad4c020  ! 298: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r29
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 14)
	.word 0xbcc4e020  ! 304: ADDCcc_I	addccc 	%r19, 0x0020, %r30
	.word 0xb8b5a042  ! 306: ORNcc_I	orncc 	%r22, 0x0042, %r28
	.word 0xb8b42178  ! 308: SUBCcc_I	orncc 	%r16, 0x0178, %r28
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_rd_13:
	mov	0x21, %r14
	.word 0xf4db8e80  ! 311: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb4446005  ! 312: ADDC_I	addc 	%r17, 0x0005, %r26
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 31)
	.word 0xfe956168  ! 314: LDUHA_I	lduha	[%r21, + 0x0168] %asi, %r31
T2_asi_reg_rd_14:
	mov	0x31, %r14
	.word 0xfadb8e80  ! 316: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_2_31:
	setx	0x20e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_32:
	setx	0x1f0234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_33:
	setx	0x1d0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2df001  ! 326: SLLX_I	sllx	%r23, 0x0001, %r31
	.word 0xf41461e2  ! 331: LDUH_I	lduh	[%r17 + 0x01e2], %r26
	.word 0xf28c0020  ! 335: LDUBA_R	lduba	[%r16, %r0] 0x01, %r25
T2_asi_reg_wr_14:
	mov	0x2, %r14
	.word 0xfaf38e40  ! 336: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb6140000  ! 340: OR_R	or 	%r16, %r0, %r27
T2_asi_reg_rd_15:
	mov	0x29, %r14
	.word 0xf6db89e0  ! 341: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_34:
	setx	0x1e0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2552145  ! 346: LDSH_I	ldsh	[%r20 + 0x0145], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4d44020  ! 350: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r26
	.word 0xf0cdc020  ! 353: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r24
	.word 0xbc1ca06f  ! 355: XOR_I	xor 	%r18, 0x006f, %r30
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xf2d5a1d6  ! 360: LDSHA_I	ldsha	[%r22, + 0x01d6] %asi, %r25
	.word 0xf6540000  ! 361: LDSH_R	ldsh	[%r16 + %r0], %r27
	.word 0xfa84e095  ! 369: LDUWA_I	lduwa	[%r19, + 0x0095] %asi, %r29
cpu_intr_2_35:
	setx	0x1f023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf614c000  ! 371: LDUH_R	lduh	[%r19 + %r0], %r27
cpu_intr_2_36:
	setx	0x1c0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf615a1eb  ! 375: LDUH_I	lduh	[%r22 + 0x01eb], %r27
cpu_intr_2_37:
	setx	0x1e0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb335e001  ! 379: SRL_I	srl 	%r23, 0x0001, %r25
cpu_intr_2_38:
	setx	0x1e013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf095a14c  ! 383: LDUHA_I	lduha	[%r22, + 0x014c] %asi, %r24
T2_asi_reg_rd_16:
	mov	0x3c2, %r14
	.word 0xfadb89e0  ! 384: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf8c4201a  ! 385: LDSWA_I	ldswa	[%r16, + 0x001a] %asi, %r28
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 32)
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_17:
	mov	0x15, %r14
	.word 0xf2db84a0  ! 392: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfa840020  ! 395: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
T2_asi_reg_rd_18:
	mov	0x12, %r14
	.word 0xfadb84a0  ! 396: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf6cd2125  ! 397: LDSBA_I	ldsba	[%r20, + 0x0125] %asi, %r27
cpu_intr_2_39:
	setx	0x1e0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb204211d  ! 400: ADD_I	add 	%r16, 0x011d, %r25
	.word 0xfc850020  ! 401: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r30
cpu_intr_2_40:
	setx	0x1d000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_15:
	mov	0x3c5, %r14
	.word 0xf8f38e60  ! 407: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_2_41:
	setx	0x1d0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cd0020  ! 410: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r26
	.word 0xfe4cc000  ! 411: LDSB_R	ldsb	[%r19 + %r0], %r31
	.word 0xfe8460b9  ! 414: LDUWA_I	lduwa	[%r17, + 0x00b9] %asi, %r31
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 13)
	.word 0xf2c50020  ! 417: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r25
cpu_intr_2_42:
	setx	0x1f0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0dd612b  ! 422: LDXA_I	ldxa	[%r21, + 0x012b] %asi, %r24
cpu_intr_2_43:
	setx	0x1c023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_19:
	mov	0x31, %r14
	.word 0xf0db89e0  ! 425: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T2_asi_reg_rd_20:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 429: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_44:
	setx	0x1f011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_45:
	setx	0x1d022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 2)
	.word 0xbc8cc000  ! 437: ANDcc_R	andcc 	%r19, %r0, %r30
	.word 0xfa156057  ! 439: LDUH_I	lduh	[%r21 + 0x0057], %r29
cpu_intr_2_46:
	setx	0x1c032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4554000  ! 442: LDSH_R	ldsh	[%r21 + %r0], %r26
	.word 0xf68ce1cb  ! 443: LDUBA_I	lduba	[%r19, + 0x01cb] %asi, %r27
	.word 0xfa0521db  ! 445: LDUW_I	lduw	[%r20 + 0x01db], %r29
cpu_intr_2_47:
	setx	0x1f0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe140000  ! 447: LDUH_R	lduh	[%r16 + %r0], %r31
cpu_intr_2_48:
	setx	0x1d0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04d8000  ! 450: LDSB_R	ldsb	[%r22 + %r0], %r24
cpu_intr_2_49:
	setx	0x1e0201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_50:
	setx	0x1f0108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 28)
	.word 0xbcc5211c  ! 459: ADDCcc_I	addccc 	%r20, 0x011c, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 26)
	.word 0xfcc46079  ! 465: LDSWA_I	ldswa	[%r17, + 0x0079] %asi, %r30
T2_asi_reg_rd_21:
	mov	0x18, %r14
	.word 0xf2db8400  ! 466: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983d8a  ! 467: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d8a, %hpstate
	.word 0xf44ca0c6  ! 468: LDSB_I	ldsb	[%r18 + 0x00c6], %r26
	.word 0xf8c40020  ! 469: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r28
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_wr_16:
	mov	0x3c7, %r14
	.word 0xfaf38e80  ! 471: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_rd_22:
	mov	0x3c7, %r14
	.word 0xfcdb8e60  ! 476: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf44da11f  ! 479: LDSB_I	ldsb	[%r22 + 0x011f], %r26
	.word 0xb4bc8000  ! 482: XNORcc_R	xnorcc 	%r18, %r0, %r26
	ta	T_CHANGE_TO_TL0
	.word 0xf6840020  ! 484: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r27
	.word 0xb92dc000  ! 485: SLL_R	sll 	%r23, %r0, %r28
cpu_intr_2_51:
	setx	0x21010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_52:
	setx	0x210308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 0)
	.word 0xfa04618d  ! 494: LDUW_I	lduw	[%r17 + 0x018d], %r29
	ta	T_CHANGE_NONHPRIV
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 8)
	.word 0xfedc20e9  ! 497: LDXA_I	ldxa	[%r16, + 0x00e9] %asi, %r31
	.word 0xb92cd000  ! 499: SLLX_R	sllx	%r19, %r0, %r28
cpu_intr_2_53:
	setx	0x20021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d5c020  ! 507: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r24
	.word 0xf004e1e9  ! 510: LDUW_I	lduw	[%r19 + 0x01e9], %r24
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, b)
	ta	T_CHANGE_TO_TL1
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983950  ! 515: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1950, %hpstate
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 17)
	.word 0xb4c4a0ca  ! 521: ADDCcc_I	addccc 	%r18, 0x00ca, %r26
	.word 0xf695c020  ! 522: LDUHA_R	lduha	[%r23, %r0] 0x01, %r27
	ta	T_CHANGE_TO_TL0
	.word 0xf0d58020  ! 524: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r24
cpu_intr_2_54:
	setx	0x200329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_55:
	setx	0x210117, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_17:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 529: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_rd_23:
	mov	0x15, %r14
	.word 0xf8db8400  ! 531: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xba9dc000  ! 532: XORcc_R	xorcc 	%r23, %r0, %r29
	.word 0xb4bd8000  ! 534: XNORcc_R	xnorcc 	%r22, %r0, %r26
T2_asi_reg_rd_24:
	mov	0x3c6, %r14
	.word 0xf2db8e80  ! 535: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_2_56:
	setx	0x220138, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_18:
	mov	0x3c6, %r14
	.word 0xf8f384a0  ! 539: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf494c020  ! 542: LDUHA_R	lduha	[%r19, %r0] 0x01, %r26
	ta	T_CHANGE_HPRIV
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982d08  ! 545: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d08, %hpstate
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_57:
	setx	0x210014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf245c000  ! 551: LDSW_R	ldsw	[%r23 + %r0], %r25
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, 5)
	.word 0xb7518000  ! 554: RDPR_PSTATE	<illegal instruction>
	.word 0xfa146128  ! 555: LDUH_I	lduh	[%r17 + 0x0128], %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf2854020  ! 558: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r25
	.word 0xfc048000  ! 564: LDUW_R	lduw	[%r18 + %r0], %r30
cpu_intr_2_58:
	setx	0x230020, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0xfa0dc000  ! 571: LDUB_R	ldub	[%r23 + %r0], %r29
cpu_intr_2_59:
	setx	0x200239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, c)
	.word 0xfecce08a  ! 577: LDSBA_I	ldsba	[%r19, + 0x008a] %asi, %r31
	.word 0xbd510000  ! 578: RDPR_TICK	<illegal instruction>
T2_asi_reg_rd_25:
	mov	0x1a, %r14
	.word 0xfcdb8e80  ! 581: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_2_60:
	setx	0x20003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_26:
	mov	0x2e, %r14
	.word 0xfcdb8400  ! 584: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 38)
	.word 0xf0d42089  ! 586: LDSHA_I	ldsha	[%r16, + 0x0089] %asi, %r24
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_61:
	setx	0x200221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60c4000  ! 591: LDUB_R	ldub	[%r17 + %r0], %r27
T2_asi_reg_wr_19:
	mov	0x36, %r14
	.word 0xfaf38400  ! 592: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfcc40020  ! 593: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r30
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, c)
	.word 0xb28c2175  ! 599: ANDcc_I	andcc 	%r16, 0x0175, %r25
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, 4)
	.word 0xf85de0dd  ! 603: LDX_I	ldx	[%r23 + 0x00dd], %r28
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 35)
	.word 0xfa05618e  ! 607: LDUW_I	lduw	[%r21 + 0x018e], %r29
T2_asi_reg_rd_27:
	mov	0xe, %r14
	.word 0xf4db8e60  ! 608: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfac48020  ! 615: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r29
cpu_intr_2_62:
	setx	0x21020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd348000  ! 617: SRL_R	srl 	%r18, %r0, %r30
T2_asi_reg_rd_28:
	mov	0x2b, %r14
	.word 0xf8db8e60  ! 618: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T2_asi_reg_rd_29:
	mov	0x3c8, %r14
	.word 0xfcdb8e80  ! 621: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf814e067  ! 622: LDUH_I	lduh	[%r19 + 0x0067], %r28
	.word 0xba04a09e  ! 624: ADD_I	add 	%r18, 0x009e, %r29
	.word 0xfac520db  ! 627: LDSWA_I	ldswa	[%r20, + 0x00db] %asi, %r29
cpu_intr_2_63:
	setx	0x20010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_20:
	mov	0x20, %r14
	.word 0xfcf38e80  ! 632: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb0a44000  ! 633: SUBcc_R	subcc 	%r17, %r0, %r24
	.word 0xb4a56054  ! 634: SUBcc_I	subcc 	%r21, 0x0054, %r26
	.word 0xf8c4e136  ! 636: LDSWA_I	ldswa	[%r19, + 0x0136] %asi, %r28
T2_asi_reg_wr_21:
	mov	0x2c, %r14
	.word 0xf2f38400  ! 638: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 6)
cpu_intr_2_64:
	setx	0x210100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13c7001  ! 646: SRAX_I	srax	%r17, 0x0001, %r24
cpu_intr_2_65:
	setx	0x23020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc14a015  ! 650: LDUH_I	lduh	[%r18 + 0x0015], %r30
cpu_intr_2_66:
	setx	0x20030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d42015  ! 657: LDSHA_I	ldsha	[%r16, + 0x0015] %asi, %r25
	.word 0xb9508000  ! 660: RDPR_TSTATE	<illegal instruction>
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, c)
	.word 0xb934c000  ! 663: SRL_R	srl 	%r19, %r0, %r28
	.word 0xfc5d61ab  ! 664: LDX_I	ldx	[%r21 + 0x01ab], %r30
	.word 0xf00dc000  ! 666: LDUB_R	ldub	[%r23 + %r0], %r24
	.word 0xf2148000  ! 669: LDUH_R	lduh	[%r18 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_67:
	setx	0x210137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0de026  ! 674: LDUB_I	ldub	[%r23 + 0x0026], %r29
	.word 0xf0c52068  ! 676: LDSWA_I	ldswa	[%r20, + 0x0068] %asi, %r24
cpu_intr_2_68:
	setx	0x20021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_69:
	setx	0x200301, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_30:
	mov	0x3c8, %r14
	.word 0xfcdb8e80  ! 687: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_2_70:
	setx	0x22013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_22:
	mov	0x3c4, %r14
	.word 0xfcf38e60  ! 696: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_71:
	setx	0x23021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_72:
	setx	0x230107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80ca023  ! 701: LDUB_I	ldub	[%r18 + 0x0023], %r28
T2_asi_reg_rd_31:
	mov	0x2, %r14
	.word 0xfadb8e60  ! 703: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xfacc60bf  ! 705: LDSBA_I	ldsba	[%r17, + 0x00bf] %asi, %r29
	.word 0xf4552068  ! 711: LDSH_I	ldsh	[%r20 + 0x0068], %r26
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, d)
	.word 0xbe8520fb  ! 717: ADDcc_I	addcc 	%r20, 0x00fb, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 11)
	.word 0xf0040000  ! 730: LDUW_R	lduw	[%r16 + %r0], %r24
	.word 0xf20dc000  ! 731: LDUB_R	ldub	[%r23 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbd50c000  ! 738: RDPR_TT	<illegal instruction>
T2_asi_reg_wr_23:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 740: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_73:
	setx	0x21030b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 38)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbb3df001  ! 749: SRAX_I	srax	%r23, 0x0001, %r29
	.word 0xfa4d6090  ! 751: LDSB_I	ldsb	[%r21 + 0x0090], %r29
T2_asi_reg_wr_24:
	mov	0x1e, %r14
	.word 0xfaf38e40  ! 752: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb084613b  ! 755: ADDcc_I	addcc 	%r17, 0x013b, %r24
T2_asi_reg_rd_32:
	mov	0x3c4, %r14
	.word 0xf4db8e80  ! 758: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xfad5e015  ! 759: LDSHA_I	ldsha	[%r23, + 0x0015] %asi, %r29
	.word 0xf2dd6133  ! 761: LDXA_I	ldxa	[%r21, + 0x0133] %asi, %r25
cpu_intr_2_74:
	setx	0x21020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_75:
	setx	0x23013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_76:
	setx	0x23020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_77:
	setx	0x230018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe14a1f0  ! 768: LDUH_I	lduh	[%r18 + 0x01f0], %r31
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_78:
	setx	0x22020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb634e1e3  ! 773: SUBC_I	orn 	%r19, 0x01e3, %r27
	.word 0xba35c000  ! 774: SUBC_R	orn 	%r23, %r0, %r29
	.word 0xfed5e084  ! 782: LDSHA_I	ldsha	[%r23, + 0x0084] %asi, %r31
	.word 0xfc14a0b5  ! 785: LDUH_I	lduh	[%r18 + 0x00b5], %r30
cpu_intr_2_79:
	setx	0x23030b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, 3)
	.word 0xf60d217d  ! 792: LDUB_I	ldub	[%r20 + 0x017d], %r27
	.word 0xf245e125  ! 794: LDSW_I	ldsw	[%r23 + 0x0125], %r25
	.word 0xf085212e  ! 795: LDUWA_I	lduwa	[%r20, + 0x012e] %asi, %r24
	.word 0xf68d8020  ! 796: LDUBA_R	lduba	[%r22, %r0] 0x01, %r27
cpu_intr_2_80:
	setx	0x21033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_25:
	mov	0x32, %r14
	.word 0xf4f38400  ! 798: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 25)
	.word 0xf085e178  ! 804: LDUWA_I	lduwa	[%r23, + 0x0178] %asi, %r24
T2_asi_reg_wr_26:
	mov	0x11, %r14
	.word 0xfef384a0  ! 806: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb4b48000  ! 807: SUBCcc_R	orncc 	%r18, %r0, %r26
	.word 0xf2d5e1ec  ! 808: LDSHA_I	ldsha	[%r23, + 0x01ec] %asi, %r25
	.word 0xbe34e04d  ! 811: SUBC_I	orn 	%r19, 0x004d, %r31
	.word 0xfedd2112  ! 815: LDXA_I	ldxa	[%r20, + 0x0112] %asi, %r31
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 6)
	.word 0xfa0d8000  ! 822: LDUB_R	ldub	[%r22 + %r0], %r29
	.word 0xf20d8000  ! 823: LDUB_R	ldub	[%r22 + %r0], %r25
	.word 0xfc0c205d  ! 824: LDUB_I	ldub	[%r16 + 0x005d], %r30
	.word 0xbb7ca401  ! 826: MOVR_I	movre	%r18, 0x1, %r29
	ta	T_CHANGE_HPRIV
	.word 0xfc146085  ! 831: LDUH_I	lduh	[%r17 + 0x0085], %r30
	.word 0xfa554000  ! 835: LDSH_R	ldsh	[%r21 + %r0], %r29
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, b)
	.word 0xb43c4000  ! 839: XNOR_R	xnor 	%r17, %r0, %r26
T2_asi_reg_rd_33:
	mov	0x13, %r14
	.word 0xfadb8e60  ! 840: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_81:
	setx	0x220137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85c8000  ! 846: LDX_R	ldx	[%r18 + %r0], %r28
cpu_intr_2_82:
	setx	0x3010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_34:
	mov	0x5, %r14
	.word 0xfedb8e40  ! 850: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_rd_35:
	mov	0xf, %r14
	.word 0xf2db84a0  ! 851: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf254c000  ! 852: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0xfa4560c5  ! 853: LDSW_I	ldsw	[%r21 + 0x00c5], %r29
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 31)
	ta	T_CHANGE_TO_TL1
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_wr_27:
	mov	0x11, %r14
	.word 0xf0f38e40  ! 862: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_rd_36:
	mov	0x3c2, %r14
	.word 0xfadb84a0  ! 864: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_2_83:
	setx	0x230011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 26)
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_84:
	setx	0x21030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb224a0fc  ! 881: SUB_I	sub 	%r18, 0x00fc, %r25
cpu_intr_2_85:
	setx	0x10138, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983cc2  ! 884: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc2, %hpstate
	.word 0xb12dd000  ! 885: SLLX_R	sllx	%r23, %r0, %r24
T2_asi_reg_wr_28:
	mov	0xf, %r14
	.word 0xf8f38400  ! 886: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf4140000  ! 887: LDUH_R	lduh	[%r16 + %r0], %r26
cpu_intr_2_86:
	setx	0x220001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64c21dd  ! 894: LDSB_I	ldsb	[%r16 + 0x01dd], %r27
T2_asi_reg_wr_29:
	mov	0x3c2, %r14
	.word 0xf2f38400  ! 895: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf6558000  ! 898: LDSH_R	ldsh	[%r22 + %r0], %r27
T2_asi_reg_rd_37:
	mov	0x2a, %r14
	.word 0xfedb8400  ! 899: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf285a0cb  ! 900: LDUWA_I	lduwa	[%r22, + 0x00cb] %asi, %r25
	.word 0xf8144000  ! 901: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xf8054000  ! 902: LDUW_R	lduw	[%r21 + %r0], %r28
T2_asi_reg_rd_38:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 907: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf494c020  ! 908: LDUHA_R	lduha	[%r19, %r0] 0x01, %r26
T2_asi_reg_wr_30:
	mov	0x32, %r14
	.word 0xfcf38e80  ! 909: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_wr_31:
	mov	0x34, %r14
	.word 0xfef38e40  ! 912: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 18)
	.word 0xf64dc000  ! 915: LDSB_R	ldsb	[%r23 + %r0], %r27
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, 38)
	.word 0xfc050000  ! 920: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xbab5c000  ! 921: SUBCcc_R	orncc 	%r23, %r0, %r29
	.word 0xfcccc020  ! 923: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r30
	.word 0xfa05a1c3  ! 928: LDUW_I	lduw	[%r22 + 0x01c3], %r29
	.word 0xf8dda0aa  ! 929: LDXA_I	ldxa	[%r22, + 0x00aa] %asi, %r28
cpu_intr_2_87:
	setx	0x26021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_39:
	mov	0x19, %r14
	.word 0xfedb8e80  ! 931: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb63d0000  ! 933: XNOR_R	xnor 	%r20, %r0, %r27
cpu_intr_2_88:
	setx	0x240212, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_32:
	mov	0x3c0, %r14
	.word 0xf6f38e80  ! 938: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf60c215f  ! 942: LDUB_I	ldub	[%r16 + 0x015f], %r27
	.word 0xf20dc000  ! 945: LDUB_R	ldub	[%r23 + %r0], %r25
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_89:
	setx	0x250039, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_40:
	mov	0x25, %r14
	.word 0xf6db8e40  ! 950: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfa5de019  ! 951: LDX_I	ldx	[%r23 + 0x0019], %r29
	.word 0xf8c5c020  ! 952: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r28
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_90:
	setx	0x27030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_33:
	mov	0x2c, %r14
	.word 0xfcf38e80  ! 955: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_91:
	setx	0x26032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00d6037  ! 957: LDUB_I	ldub	[%r21 + 0x0037], %r24
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982ec8  ! 959: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec8, %hpstate
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 30)
cpu_intr_2_92:
	setx	0x270121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa148000  ! 962: LDUH_R	lduh	[%r18 + %r0], %r29
T2_asi_reg_rd_41:
	mov	0x7, %r14
	.word 0xf6db84a0  ! 964: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb37d0400  ! 971: MOVR_R	movre	%r20, %r0, %r25
	.word 0xb43da1eb  ! 974: XNOR_I	xnor 	%r22, 0x01eb, %r26
T2_asi_reg_wr_34:
	mov	0x3c4, %r14
	.word 0xf8f38e80  ! 975: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb60ce1ef  ! 977: AND_I	and 	%r19, 0x01ef, %r27
	ta	T_CHANGE_NONHPRIV
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 0)
	.word 0xfa15e127  ! 982: LDUH_I	lduh	[%r23 + 0x0127], %r29
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983b02  ! 984: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b02, %hpstate
T2_asi_reg_rd_42:
	mov	0xd, %r14
	.word 0xfcdb8e60  ! 985: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf28cc020  ! 989: LDUBA_R	lduba	[%r19, %r0] 0x01, %r25
cpu_intr_2_93:
	setx	0x260305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20d8000  ! 993: LDUB_R	ldub	[%r22 + %r0], %r25
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_94:
	setx	0x27032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, 7)
	.word 0xf04421d5  ! 999: LDSW_I	ldsw	[%r16 + 0x01d5], %r24
	.word 0xf6cd4020  ! 1000: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r27
T2_asi_reg_wr_35:
	mov	0x27, %r14
	.word 0xfef38e60  ! 1001: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 10)
	.word 0xfa5cc000  ! 1003: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xb684a0fa  ! 1009: ADDcc_I	addcc 	%r18, 0x00fa, %r27
T2_asi_reg_rd_43:
	mov	0x36, %r14
	.word 0xf4db8400  ! 1011: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T2_asi_reg_rd_44:
	mov	0x13, %r14
	.word 0xf4db8e40  ! 1015: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf65dc000  ! 1016: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0xb845a12d  ! 1021: ADDC_I	addc 	%r22, 0x012d, %r28
	.word 0xf45d8000  ! 1023: LDX_R	ldx	[%r22 + %r0], %r26
cpu_intr_2_95:
	setx	0x250317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacd4020  ! 1026: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r29
cpu_intr_2_96:
	setx	0x270313, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_36:
	mov	0x15, %r14
	.word 0xf0f38e60  ! 1028: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, b)
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 4)
	.word 0xf68c8020  ! 1036: LDUBA_R	lduba	[%r18, %r0] 0x01, %r27
	.word 0xb4c5e118  ! 1037: ADDCcc_I	addccc 	%r23, 0x0118, %r26
cpu_intr_2_97:
	setx	0x260328, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_37:
	mov	0x1a, %r14
	.word 0xfcf38e60  ! 1040: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_rd_45:
	mov	0x15, %r14
	.word 0xfedb8400  ! 1041: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf4cd210c  ! 1042: LDSBA_I	ldsba	[%r20, + 0x010c] %asi, %r26
	.word 0xfa5ca102  ! 1044: LDX_I	ldx	[%r18 + 0x0102], %r29
	.word 0xf65c8000  ! 1045: LDX_R	ldx	[%r18 + %r0], %r27
T2_asi_reg_wr_38:
	mov	0xd, %r14
	.word 0xfcf38e80  ! 1050: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf005c000  ! 1051: LDUW_R	lduw	[%r23 + %r0], %r24
T2_asi_reg_rd_46:
	mov	0x0, %r14
	.word 0xf2db8e60  ! 1052: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T2_asi_reg_wr_39:
	mov	0x33, %r14
	.word 0xfaf38e40  ! 1053: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_rd_47:
	mov	0xb, %r14
	.word 0xf0db8e40  ! 1055: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_98:
	setx	0x27032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819838c2  ! 1058: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c2, %hpstate
	.word 0x89956116  ! 1066: WRPR_TICK_I	wrpr	%r21, 0x0116, %tick
T2_asi_reg_wr_40:
	mov	0x25, %r14
	.word 0xf4f38e40  ! 1067: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_rd_48:
	mov	0x2f, %r14
	.word 0xfcdb8e40  ! 1071: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf414e161  ! 1076: LDUH_I	lduh	[%r19 + 0x0161], %r26
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982e52  ! 1077: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e52, %hpstate
	.word 0xfa944020  ! 1078: LDUHA_R	lduha	[%r17, %r0] 0x01, %r29
T2_asi_reg_rd_49:
	mov	0x5, %r14
	.word 0xfedb89e0  ! 1081: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T2_asi_reg_wr_41:
	mov	0x3c3, %r14
	.word 0xf0f38400  ! 1082: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL1
cpu_intr_2_99:
	setx	0x250316, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_50:
	mov	0x34, %r14
	.word 0xfedb8e60  ! 1093: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xfa54619f  ! 1094: LDSH_I	ldsh	[%r17 + 0x019f], %r29
	.word 0xf6550000  ! 1095: LDSH_R	ldsh	[%r20 + %r0], %r27
	.word 0xfe04e1f9  ! 1097: LDUW_I	lduw	[%r19 + 0x01f9], %r31
T2_asi_reg_rd_51:
	mov	0x1e, %r14
	.word 0xf6db8e60  ! 1098: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_100:
	setx	0x26021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_52:
	mov	0x1a, %r14
	.word 0xf8db8e80  ! 1104: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf2444000  ! 1107: LDSW_R	ldsw	[%r17 + %r0], %r25
T2_asi_reg_wr_42:
	mov	0xc, %r14
	.word 0xf4f38e80  ! 1108: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_2_101:
	setx	0x27013b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_102:
	setx	0x240116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2dce0a9  ! 1116: LDXA_I	ldxa	[%r19, + 0x00a9] %asi, %r25
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 2d)
	.word 0xfec4c020  ! 1121: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r31
	.word 0xf08c4020  ! 1123: LDUBA_R	lduba	[%r17, %r0] 0x01, %r24
cpu_intr_2_103:
	setx	0x25011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe552086  ! 1128: LDSH_I	ldsh	[%r20 + 0x0086], %r31
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_rd_53:
	mov	0x3c4, %r14
	.word 0xf0db89e0  ! 1138: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb8258000  ! 1140: SUB_R	sub 	%r22, %r0, %r28
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983c98  ! 1142: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c98, %hpstate
T2_asi_reg_wr_43:
	mov	0x15, %r14
	.word 0xf2f389e0  ! 1143: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL0
cpu_intr_2_104:
	setx	0x260139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6056192  ! 1150: LDUW_I	lduw	[%r21 + 0x0192], %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_54:
	mov	0xb, %r14
	.word 0xf0db8400  ! 1155: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf4cca0bc  ! 1156: LDSBA_I	ldsba	[%r18, + 0x00bc] %asi, %r26
	ta	T_CHANGE_NONHPRIV
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 17)
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_105:
	setx	0x250111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_wr_44:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 1169: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf8c5600d  ! 1170: LDSWA_I	ldswa	[%r21, + 0x000d] %asi, %r28
	.word 0xfccca0f5  ! 1171: LDSBA_I	ldsba	[%r18, + 0x00f5] %asi, %r30
	.word 0xf454c000  ! 1178: LDSH_R	ldsh	[%r19 + %r0], %r26
	.word 0xb8b4c000  ! 1179: ORNcc_R	orncc 	%r19, %r0, %r28
	.word 0xfa048000  ! 1182: LDUW_R	lduw	[%r18 + %r0], %r29
cpu_intr_2_106:
	setx	0x240203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe946083  ! 1185: LDUHA_I	lduha	[%r17, + 0x0083] %asi, %r31
	.word 0xb28c20e6  ! 1186: ANDcc_I	andcc 	%r16, 0x00e6, %r25
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 27)
	.word 0xfacd207a  ! 1193: LDSBA_I	ldsba	[%r20, + 0x007a] %asi, %r29
	.word 0xbc8dc000  ! 1194: ANDcc_R	andcc 	%r23, %r0, %r30
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf2944020  ! 1197: LDUHA_R	lduha	[%r17, %r0] 0x01, %r25
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 13)
	.word 0xf84d61c8  ! 1208: LDSB_I	ldsb	[%r21 + 0x01c8], %r28
T2_asi_reg_rd_55:
	mov	0x2b, %r14
	.word 0xf4db8e40  ! 1211: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfc148000  ! 1212: LDUH_R	lduh	[%r18 + %r0], %r30
	.word 0xf65ca0ed  ! 1213: LDX_I	ldx	[%r18 + 0x00ed], %r27
	.word 0xfed4c020  ! 1214: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r31
cpu_intr_2_107:
	setx	0x27000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed56017  ! 1216: LDSHA_I	ldsha	[%r21, + 0x0017] %asi, %r31
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_rd_56:
	mov	0x6, %r14
	.word 0xfedb8e60  ! 1218: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xfe8460f8  ! 1221: LDUWA_I	lduwa	[%r17, + 0x00f8] %asi, %r31
cpu_intr_2_108:
	setx	0x250237, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf085e1cd  ! 1231: LDUWA_I	lduwa	[%r23, + 0x01cd] %asi, %r24
T2_asi_reg_wr_45:
	mov	0x0, %r14
	.word 0xfef38e80  ! 1232: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf6cc8020  ! 1233: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r27
	.word 0xb0340000  ! 1236: ORN_R	orn 	%r16, %r0, %r24
	.word 0xf8c5a09b  ! 1240: LDSWA_I	ldswa	[%r22, + 0x009b] %asi, %r28
	ta	T_CHANGE_HPRIV
cpu_intr_2_109:
	setx	0x240010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 15)
	.word 0xbc2d20f7  ! 1251: ANDN_I	andn 	%r20, 0x00f7, %r30
cpu_intr_2_110:
	setx	0x27012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d40020  ! 1259: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r24
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 3)
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
	.word 0xf08421eb  ! 1263: LDUWA_I	lduwa	[%r16, + 0x01eb] %asi, %r24
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_wr_46:
	mov	0x3c6, %r14
	.word 0xf0f389e0  ! 1266: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T2_asi_reg_wr_47:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 1269: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf8454000  ! 1270: LDSW_R	ldsw	[%r21 + %r0], %r28
	.word 0xfc85a03c  ! 1271: LDUWA_I	lduwa	[%r22, + 0x003c] %asi, %r30
T2_asi_reg_rd_57:
	mov	0x11, %r14
	.word 0xf2db89e0  ! 1272: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf0d5c020  ! 1276: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r24
cpu_intr_2_111:
	setx	0x270005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 31)
	.word 0xf60c0000  ! 1279: LDUB_R	ldub	[%r16 + %r0], %r27
cpu_intr_2_112:
	setx	0x260239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24ca0e2  ! 1281: LDSB_I	ldsb	[%r18 + 0x00e2], %r25
	.word 0xb6254000  ! 1283: SUB_R	sub 	%r21, %r0, %r27
T2_asi_reg_rd_58:
	mov	0x3c1, %r14
	.word 0xfcdb84a0  ! 1285: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 34)
	.word 0xf084a109  ! 1291: LDUWA_I	lduwa	[%r18, + 0x0109] %asi, %r24
	.word 0xb60da06a  ! 1293: AND_I	and 	%r22, 0x006a, %r27
T2_asi_reg_rd_59:
	mov	0x11, %r14
	.word 0xfcdb89e0  ! 1295: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf0d4e174  ! 1296: LDSHA_I	ldsha	[%r19, + 0x0174] %asi, %r24
	.word 0xf8cdc020  ! 1298: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r28
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 24)
	.word 0xb934d000  ! 1301: SRLX_R	srlx	%r19, %r0, %r28
cpu_intr_2_113:
	setx	0x26000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_60:
	mov	0x35, %r14
	.word 0xf2db8e40  ! 1303: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_rd_61:
	mov	0x3c8, %r14
	.word 0xf2db89e0  ! 1304: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb2b40000  ! 1305: ORNcc_R	orncc 	%r16, %r0, %r25
	.word 0xf0558000  ! 1307: LDSH_R	ldsh	[%r22 + %r0], %r24
cpu_intr_2_114:
	setx	0x240000, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_48:
	mov	0x1a, %r14
	.word 0xfef38e40  ! 1309: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfed58020  ! 1314: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r31
cpu_intr_2_115:
	setx	0x250334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf044e059  ! 1317: LDSW_I	ldsw	[%r19 + 0x0059], %r24
T2_asi_reg_wr_49:
	mov	0x3c3, %r14
	.word 0xf2f38e80  ! 1321: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_116:
	setx	0x270322, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_62:
	mov	0x26, %r14
	.word 0xfcdb8400  ! 1323: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T2_asi_reg_rd_63:
	mov	0x2c, %r14
	.word 0xfcdb89e0  ! 1324: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982840  ! 1325: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0840, %hpstate
cpu_intr_2_117:
	setx	0x250133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfac5a05a  ! 1327: LDSWA_I	ldswa	[%r22, + 0x005a] %asi, %r29
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 7)
	.word 0xf2cda1fa  ! 1332: LDSBA_I	ldsba	[%r22, + 0x01fa] %asi, %r25
	.word 0xfc54a0a3  ! 1333: LDSH_I	ldsh	[%r18 + 0x00a3], %r30
	ta	T_CHANGE_TO_TL0
cpu_intr_2_118:
	setx	0x25023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_64:
	mov	0x3c8, %r14
	.word 0xf6db8400  ! 1341: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_2_119:
	setx	0x24003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2dda1bd  ! 1346: LDXA_I	ldxa	[%r22, + 0x01bd] %asi, %r25
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_65:
	mov	0x30, %r14
	.word 0xf4db8e40  ! 1350: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf28c4020  ! 1351: LDUBA_R	lduba	[%r17, %r0] 0x01, %r25
	.word 0xb33de001  ! 1352: SRA_I	sra 	%r23, 0x0001, %r25
	.word 0xb69c4000  ! 1355: XORcc_R	xorcc 	%r17, %r0, %r27
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 36)
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 2c)
	.word 0xbcb4c000  ! 1360: SUBCcc_R	orncc 	%r19, %r0, %r30
	.word 0xfa4ca04c  ! 1363: LDSB_I	ldsb	[%r18 + 0x004c], %r29
	.word 0xf604c000  ! 1364: LDUW_R	lduw	[%r19 + %r0], %r27
	.word 0xf484213e  ! 1365: LDUWA_I	lduwa	[%r16, + 0x013e] %asi, %r26
	.word 0xf60c20f4  ! 1367: LDUB_I	ldub	[%r16 + 0x00f4], %r27
	.word 0xfacc0020  ! 1368: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r29
	.word 0xbb500000  ! 1370: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_120:
	setx	0x25031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_66:
	mov	0xa, %r14
	.word 0xf2db89e0  ! 1374: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfc4d0000  ! 1377: LDSB_R	ldsb	[%r20 + %r0], %r30
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_rd_67:
	mov	0x3c6, %r14
	.word 0xfadb8e80  ! 1382: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf05d0000  ! 1383: LDX_R	ldx	[%r20 + %r0], %r24
	.word 0xf0958020  ! 1385: LDUHA_R	lduha	[%r22, %r0] 0x01, %r24
	.word 0xf8858020  ! 1386: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r28
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_wr_50:
	mov	0x23, %r14
	.word 0xf0f38e60  ! 1392: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_2_121:
	setx	0x2a023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf055a085  ! 1394: LDSH_I	ldsh	[%r22 + 0x0085], %r24
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, c)
	.word 0xfc84e161  ! 1397: LDUWA_I	lduwa	[%r19, + 0x0161] %asi, %r30
T2_asi_reg_rd_68:
	mov	0x1c, %r14
	.word 0xfadb8e80  ! 1398: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf25da1e9  ! 1399: LDX_I	ldx	[%r22 + 0x01e9], %r25
	.word 0xb835a1f6  ! 1401: SUBC_I	orn 	%r22, 0x01f6, %r28
	.word 0xfc5c4000  ! 1403: LDX_R	ldx	[%r17 + %r0], %r30
	.word 0xf4844020  ! 1405: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r26
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_51:
	mov	0x11, %r14
	.word 0xf0f38e40  ! 1410: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_122:
	setx	0x28001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, d)
	.word 0xf6d54020  ! 1416: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r27
cpu_intr_2_123:
	setx	0x2a020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_69:
	mov	0x32, %r14
	.word 0xf8db8e60  ! 1428: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T2_asi_reg_rd_70:
	mov	0x38, %r14
	.word 0xf2db89e0  ! 1429: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, f)
	.word 0xf0dca122  ! 1434: LDXA_I	ldxa	[%r18, + 0x0122] %asi, %r24
T2_asi_reg_wr_52:
	mov	0x3c0, %r14
	.word 0xf0f38e80  ! 1436: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T2_asi_reg_rd_71:
	mov	0x35, %r14
	.word 0xf6db8e40  ! 1438: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf0158000  ! 1443: LDUH_R	lduh	[%r22 + %r0], %r24
T2_asi_reg_wr_53:
	mov	0x34, %r14
	.word 0xf6f38e40  ! 1446: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_rd_72:
	mov	0x7, %r14
	.word 0xfedb84a0  ! 1447: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_2_124:
	setx	0x2b023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, 2c)
cpu_intr_2_125:
	setx	0x28000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_54:
	mov	0x3c6, %r14
	.word 0xf4f38e60  ! 1457: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_126:
	setx	0x2a0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20d610d  ! 1460: LDUB_I	ldub	[%r21 + 0x010d], %r25
	.word 0xf24da035  ! 1462: LDSB_I	ldsb	[%r22 + 0x0035], %r25
	.word 0xf0cc8020  ! 1465: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r24
	.word 0xa1902001  ! 1466: WRPR_GL_I	wrpr	%r0, 0x0001, %-
T2_asi_reg_wr_55:
	mov	0x15, %r14
	.word 0xf8f389e0  ! 1467: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, b)
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, 2b)
cpu_intr_2_127:
	setx	0x2a020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4d4000  ! 1478: LDSB_R	ldsb	[%r21 + %r0], %r29
T2_asi_reg_rd_73:
	mov	0x19, %r14
	.word 0xfadb8400  ! 1479: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_wr_56:
	mov	0x3c8, %r14
	.word 0xfaf38e80  ! 1485: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb12dd000  ! 1486: SLLX_R	sllx	%r23, %r0, %r24
cpu_intr_2_128:
	setx	0x290116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc14c000  ! 1490: OR_R	or 	%r19, %r0, %r30
cpu_intr_2_129:
	setx	0x290235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa444000  ! 1495: LDSW_R	ldsw	[%r17 + %r0], %r29
cpu_intr_2_130:
	setx	0x28003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcdca0e9  ! 1499: LDXA_I	ldxa	[%r18, + 0x00e9] %asi, %r30
T2_asi_reg_rd_74:
	mov	0x29, %r14
	.word 0xf6db89e0  ! 1501: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_131:
	setx	0x2b0202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_132:
	setx	0x2a0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4c0000  ! 1508: LDSB_R	ldsb	[%r16 + %r0], %r30
	.word 0xf88461e5  ! 1509: LDUWA_I	lduwa	[%r17, + 0x01e5] %asi, %r28
cpu_intr_2_133:
	setx	0x2b0320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_134:
	setx	0x28002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa454000  ! 1515: LDSW_R	ldsw	[%r21 + %r0], %r29
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 31)
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x8198380a  ! 1517: WRHPR_HPSTATE_I	wrhpr	%r0, 0x180a, %hpstate
	.word 0xbf3d0000  ! 1519: SRA_R	sra 	%r20, %r0, %r31
	.word 0xfe4ca0a7  ! 1520: LDSB_I	ldsb	[%r18 + 0x00a7], %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xb00d0000  ! 1523: AND_R	and 	%r20, %r0, %r24
cpu_intr_2_135:
	setx	0x28030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_136:
	setx	0x28002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44da1ec  ! 1531: LDSB_I	ldsb	[%r22 + 0x01ec], %r26
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_wr_57:
	mov	0x1, %r14
	.word 0xf0f38400  ! 1535: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, b)
	.word 0xb68ce0a9  ! 1538: ANDcc_I	andcc 	%r19, 0x00a9, %r27
cpu_intr_2_137:
	setx	0x2a0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5d0000  ! 1540: LDX_R	ldx	[%r20 + %r0], %r29
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, 30)
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983f5a  ! 1545: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f5a, %hpstate
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_wr_58:
	mov	0x26, %r14
	.word 0xf0f38400  ! 1554: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf80d21a7  ! 1555: LDUB_I	ldub	[%r20 + 0x01a7], %r28
	.word 0xfecda1fe  ! 1556: LDSBA_I	ldsba	[%r22, + 0x01fe] %asi, %r31
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 1c)
cpu_intr_2_138:
	setx	0x280326, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_59:
	mov	0x3c3, %r14
	.word 0xf0f38e60  ! 1560: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T2_asi_reg_wr_60:
	mov	0x33, %r14
	.word 0xfef38e80  ! 1561: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T2_asi_reg_rd_75:
	mov	0xc, %r14
	.word 0xfadb8e40  ! 1562: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf0cd8020  ! 1569: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r24
cpu_intr_2_139:
	setx	0x29022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2cda094  ! 1571: LDSBA_I	ldsba	[%r22, + 0x0094] %asi, %r25
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_140:
	setx	0x28012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_141:
	setx	0x290208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_142:
	setx	0x2a000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_61:
	mov	0x14, %r14
	.word 0xf6f384a0  ! 1578: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982998  ! 1579: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0998, %hpstate
	.word 0xb77c6401  ! 1581: MOVR_I	movre	%r17, 0x1, %r27
	.word 0xba3d4000  ! 1582: XNOR_R	xnor 	%r21, %r0, %r29
	.word 0xf04d8000  ! 1585: LDSB_R	ldsb	[%r22 + %r0], %r24
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_143:
	setx	0x290000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_144:
	setx	0x280021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb350c000  ! 1593: RDPR_TT	<illegal instruction>
	.word 0xf6554000  ! 1595: LDSH_R	ldsh	[%r21 + %r0], %r27
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_wr_62:
	mov	0xe, %r14
	.word 0xf0f389e0  ! 1598: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf64d0000  ! 1600: LDSB_R	ldsb	[%r20 + %r0], %r27
cpu_intr_2_145:
	setx	0x2b0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf044206c  ! 1604: LDSW_I	ldsw	[%r16 + 0x006c], %r24
	.word 0xb22d0000  ! 1606: ANDN_R	andn 	%r20, %r0, %r25
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 19)
	.word 0xfe8da05b  ! 1609: LDUBA_I	lduba	[%r22, + 0x005b] %asi, %r31
T2_asi_reg_wr_63:
	mov	0x12, %r14
	.word 0xf2f38400  ! 1610: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb61461ef  ! 1613: OR_I	or 	%r17, 0x01ef, %r27
T2_asi_reg_wr_64:
	mov	0x2b, %r14
	.word 0xf4f38e40  ! 1615: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf40c4000  ! 1617: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xfac421aa  ! 1618: LDSWA_I	ldswa	[%r16, + 0x01aa] %asi, %r29
T2_asi_reg_wr_65:
	mov	0x3c6, %r14
	.word 0xf4f38e60  ! 1623: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf68da1a8  ! 1628: LDUBA_I	lduba	[%r22, + 0x01a8] %asi, %r27
	.word 0x89956058  ! 1629: WRPR_TICK_I	wrpr	%r21, 0x0058, %tick
	.word 0xf09521f5  ! 1630: LDUHA_I	lduha	[%r20, + 0x01f5] %asi, %r24
	.word 0xb8bdc000  ! 1632: XNORcc_R	xnorcc 	%r23, %r0, %r28
	.word 0xf0548000  ! 1633: LDSH_R	ldsh	[%r18 + %r0], %r24
	.word 0xf4dd604e  ! 1635: LDXA_I	ldxa	[%r21, + 0x004e] %asi, %r26
	.word 0xb77d0400  ! 1636: MOVR_R	movre	%r20, %r0, %r27
	.word 0xfe15a02e  ! 1640: LDUH_I	lduh	[%r22 + 0x002e], %r31
	.word 0xf8948020  ! 1642: LDUHA_R	lduha	[%r18, %r0] 0x01, %r28
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_66:
	mov	0x26, %r14
	.word 0xf8f38e40  ! 1644: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfe4ca18f  ! 1645: LDSB_I	ldsb	[%r18 + 0x018f], %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_67:
	mov	0x32, %r14
	.word 0xf6f38e40  ! 1651: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf2446132  ! 1652: LDSW_I	ldsw	[%r17 + 0x0132], %r25
	.word 0xb0b5c000  ! 1654: SUBCcc_R	orncc 	%r23, %r0, %r24
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 29)
	.word 0xb435a0a7  ! 1657: ORN_I	orn 	%r22, 0x00a7, %r26
cpu_intr_2_146:
	setx	0x2b0021, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_76:
	mov	0x3c7, %r14
	.word 0xf8db8e60  ! 1663: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_2_147:
	setx	0x29022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_77:
	mov	0x12, %r14
	.word 0xf8db8e40  ! 1668: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf2056196  ! 1670: LDUW_I	lduw	[%r21 + 0x0196], %r25
	.word 0xb88d0000  ! 1671: ANDcc_R	andcc 	%r20, %r0, %r28
	.word 0xb8bc61c2  ! 1672: XNORcc_I	xnorcc 	%r17, 0x01c2, %r28
	.word 0xf21560c2  ! 1673: LDUH_I	lduh	[%r21 + 0x00c2], %r25
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_148:
	setx	0x2b0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5de0e6  ! 1678: LDX_I	ldx	[%r23 + 0x00e6], %r29
T2_asi_reg_rd_78:
	mov	0x20, %r14
	.word 0xf2db8e60  ! 1681: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf6858020  ! 1683: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r27
cpu_intr_2_149:
	setx	0x280128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5da145  ! 1688: LDX_I	ldx	[%r22 + 0x0145], %r29
	.word 0xfccc60cd  ! 1689: LDSBA_I	ldsba	[%r17, + 0x00cd] %asi, %r30
	.word 0xf6154000  ! 1690: LDUH_R	lduh	[%r21 + %r0], %r27
cpu_intr_2_150:
	setx	0x2b0302, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_68:
	mov	0x31, %r14
	.word 0xf2f38e80  ! 1693: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf20da12f  ! 1696: LDUB_I	ldub	[%r22 + 0x012f], %r25
	.word 0xf8c56119  ! 1698: LDSWA_I	ldswa	[%r21, + 0x0119] %asi, %r28
	.word 0xf8848020  ! 1701: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r28
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983ed2  ! 1702: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed2, %hpstate
T2_asi_reg_rd_79:
	mov	0x3c6, %r14
	.word 0xfadb8400  ! 1703: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, 39)
	.word 0xf014210e  ! 1712: LDUH_I	lduh	[%r16 + 0x010e], %r24
T2_asi_reg_rd_80:
	mov	0x22, %r14
	.word 0xfcdb8e40  ! 1713: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_rd_81:
	mov	0x8, %r14
	.word 0xfedb8e60  ! 1715: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_2_151:
	setx	0x2a0138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 2)
cpu_intr_2_152:
	setx	0x2a0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88c6056  ! 1722: LDUBA_I	lduba	[%r17, + 0x0056] %asi, %r28
	.word 0xf88d2194  ! 1724: LDUBA_I	lduba	[%r20, + 0x0194] %asi, %r28
	.word 0xf2d50020  ! 1731: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r25
cpu_intr_2_153:
	setx	0x2a000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa54e137  ! 1736: LDSH_I	ldsh	[%r19 + 0x0137], %r29
T2_asi_reg_wr_69:
	mov	0x2f, %r14
	.word 0xf2f38e40  ! 1737: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_154:
	setx	0x28030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982f82  ! 1740: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f82, %hpstate
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_wr_70:
	mov	0xf, %r14
	.word 0xf4f384a0  ! 1744: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983cd0  ! 1745: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd0, %hpstate
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982aca  ! 1746: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0aca, %hpstate
T2_asi_reg_wr_71:
	mov	0x2, %r14
	.word 0xf0f38400  ! 1747: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb68c0000  ! 1751: ANDcc_R	andcc 	%r16, %r0, %r27
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983fc0  ! 1755: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc0, %hpstate
	.word 0xf64c0000  ! 1757: LDSB_R	ldsb	[%r16 + %r0], %r27
	.word 0xf654e1be  ! 1765: LDSH_I	ldsh	[%r19 + 0x01be], %r27
	ta	T_CHANGE_TO_TL0
	.word 0xb935b001  ! 1776: SRLX_I	srlx	%r22, 0x0001, %r28
	.word 0xfa54c000  ! 1777: LDSH_R	ldsh	[%r19 + %r0], %r29
	.word 0xfe854020  ! 1780: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r31
T2_asi_reg_rd_82:
	mov	0x3c2, %r14
	.word 0xfadb89e0  ! 1785: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf455e0c0  ! 1787: LDSH_I	ldsh	[%r23 + 0x00c0], %r26
	.word 0xf4cc4020  ! 1788: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r26
cpu_intr_2_155:
	setx	0x290019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_156:
	setx	0x2b023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8d4020  ! 1792: LDUBA_R	lduba	[%r21, %r0] 0x01, %r30
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982a92  ! 1794: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a92, %hpstate
	.word 0xf00d0000  ! 1796: LDUB_R	ldub	[%r20 + %r0], %r24
	.word 0xfacce0fe  ! 1798: LDSBA_I	ldsba	[%r19, + 0x00fe] %asi, %r29
	.word 0xfa0da1bb  ! 1800: LDUB_I	ldub	[%r22 + 0x01bb], %r29
T2_asi_reg_rd_83:
	mov	0x21, %r14
	.word 0xfcdb89e0  ! 1806: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfe0d20af  ! 1807: LDUB_I	ldub	[%r20 + 0x00af], %r31
	.word 0xf0cd8020  ! 1808: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r24
	.word 0xf0cd613b  ! 1810: LDSBA_I	ldsba	[%r21, + 0x013b] %asi, %r24
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_157:
	setx	0x2b0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfadde126  ! 1817: LDXA_I	ldxa	[%r23, + 0x0126] %asi, %r29
	ta	T_CHANGE_TO_TL0
	.word 0xb88ca0be  ! 1819: ANDcc_I	andcc 	%r18, 0x00be, %r28
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, a)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982ad2  ! 1827: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad2, %hpstate
	.word 0xfe4c61e0  ! 1828: LDSB_I	ldsb	[%r17 + 0x01e0], %r31
	.word 0xf8054000  ! 1829: LDUW_R	lduw	[%r21 + %r0], %r28
T2_asi_reg_rd_84:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 1831: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf214a1be  ! 1832: LDUH_I	lduh	[%r18 + 0x01be], %r25
	.word 0xf88c4020  ! 1833: LDUBA_R	lduba	[%r17, %r0] 0x01, %r28
cpu_intr_2_158:
	setx	0x2f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_159:
	setx	0x2f003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48560c7  ! 1840: LDUWA_I	lduwa	[%r21, + 0x00c7] %asi, %r26
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 35)
	.word 0xb32df001  ! 1842: SLLX_I	sllx	%r23, 0x0001, %r25
	ta	T_CHANGE_TO_TL1
cpu_intr_2_160:
	setx	0x2f0228, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_85:
	mov	0x2b, %r14
	.word 0xf6db8e80  ! 1850: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb334a001  ! 1851: SRL_I	srl 	%r18, 0x0001, %r25
	.word 0xf40c4000  ! 1852: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xf6458000  ! 1854: LDSW_R	ldsw	[%r22 + %r0], %r27
cpu_intr_2_161:
	setx	0x2f0026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_162:
	setx	0x2d0204, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_86:
	mov	0x21, %r14
	.word 0xf4db8400  ! 1860: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfcc4a0e5  ! 1862: LDSWA_I	ldswa	[%r18, + 0x00e5] %asi, %r30
	.word 0xf804a048  ! 1864: LDUW_I	lduw	[%r18 + 0x0048], %r28
	.word 0xfcd50020  ! 1865: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r30
T2_asi_reg_rd_87:
	mov	0x3c8, %r14
	.word 0xf4db8400  ! 1866: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_2_163:
	setx	0x2e020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4440000  ! 1873: LDSW_R	ldsw	[%r16 + %r0], %r26
T2_asi_reg_wr_72:
	mov	0x1e, %r14
	.word 0xf8f384a0  ! 1875: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf2858020  ! 1876: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r25
T2_asi_reg_wr_73:
	mov	0x1, %r14
	.word 0xf0f38e80  ! 1878: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_164:
	setx	0x2f0031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 32)
	.word 0xfe5c8000  ! 1882: LDX_R	ldx	[%r18 + %r0], %r31
T2_asi_reg_rd_88:
	mov	0x6, %r14
	.word 0xfadb89e0  ! 1883: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_165:
	setx	0x2d012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_74:
	mov	0x3c6, %r14
	.word 0xf4f38400  ! 1887: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_2_166:
	setx	0x2c0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1643801  ! 1892: MOVcc_I	<illegal instruction>
	.word 0xf6d54020  ! 1893: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r27
	.word 0xf28de1e4  ! 1894: LDUBA_I	lduba	[%r23, + 0x01e4] %asi, %r25
cpu_intr_2_167:
	setx	0x2e010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, c)
	.word 0xf2550000  ! 1899: LDSH_R	ldsh	[%r20 + %r0], %r25
	.word 0xf65521ed  ! 1901: LDSH_I	ldsh	[%r20 + 0x01ed], %r27
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982c50  ! 1905: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c50, %hpstate
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_89:
	mov	0x19, %r14
	.word 0xfadb8e40  ! 1911: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb2452192  ! 1914: ADDC_I	addc 	%r20, 0x0192, %r25
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 3d)
	.word 0xb4c44000  ! 1919: ADDCcc_R	addccc 	%r17, %r0, %r26
	.word 0xf80d8000  ! 1921: LDUB_R	ldub	[%r22 + %r0], %r28
	.word 0xfa140000  ! 1923: LDUH_R	lduh	[%r16 + %r0], %r29
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_168:
	setx	0x2e0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 1927: RDPR_TL	rdpr	%tl, %r26
cpu_intr_2_169:
	setx	0x2e033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7354000  ! 1934: SRL_R	srl 	%r21, %r0, %r27
	.word 0xf8d4c020  ! 1937: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r28
	.word 0xf6c44020  ! 1939: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r27
	.word 0xfc458000  ! 1940: LDSW_R	ldsw	[%r22 + %r0], %r30
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_170:
	setx	0x2c0115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_171:
	setx	0x2d010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_172:
	setx	0x2e0139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_wr_75:
	mov	0x17, %r14
	.word 0xfcf384a0  ! 1951: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe5d0000  ! 1957: LDX_R	ldx	[%r20 + %r0], %r31
	.word 0xf2144000  ! 1958: LDUH_R	lduh	[%r17 + %r0], %r25
	.word 0xfa1461df  ! 1962: LDUH_I	lduh	[%r17 + 0x01df], %r29
	.word 0xf0cc61cb  ! 1963: LDSBA_I	ldsba	[%r17, + 0x01cb] %asi, %r24
	.word 0xfad44020  ! 1964: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r29
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 8)
	.word 0xf0548000  ! 1972: LDSH_R	ldsh	[%r18 + %r0], %r24
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x8198299a  ! 1973: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099a, %hpstate
cpu_intr_2_173:
	setx	0x2f0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xb2c48000  ! 1978: ADDCcc_R	addccc 	%r18, %r0, %r25
cpu_intr_2_174:
	setx	0x2f000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_90:
	mov	0x3, %r14
	.word 0xf6db8e40  ! 1981: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_wr_76:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 1982: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfe148000  ! 1983: LDUH_R	lduh	[%r18 + %r0], %r31
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 20)
	.word 0xfc046159  ! 1985: LDUW_I	lduw	[%r17 + 0x0159], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_91:
	mov	0x3c2, %r14
	.word 0xfadb8e60  ! 1991: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x8198294a  ! 1992: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094a, %hpstate
T2_asi_reg_rd_92:
	mov	0x3c2, %r14
	.word 0xf6db84a0  ! 1993: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T2_asi_reg_wr_77:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 1995: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, f)
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_rd_93:
	mov	0x3c0, %r14
	.word 0xfadb84a0  ! 2001: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 13)
	.word 0xf644c000  ! 2003: LDSW_R	ldsw	[%r19 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf85d6130  ! 2006: LDX_I	ldx	[%r21 + 0x0130], %r28
	.word 0xf484c020  ! 2008: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r26
	.word 0xfc5cc000  ! 2009: LDX_R	ldx	[%r19 + %r0], %r30
	.word 0xbab44000  ! 2010: SUBCcc_R	orncc 	%r17, %r0, %r29
	.word 0xbca50000  ! 2011: SUBcc_R	subcc 	%r20, %r0, %r30
T2_asi_reg_wr_78:
	mov	0x11, %r14
	.word 0xfcf384a0  ! 2012: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf0c54020  ! 2022: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r24
	.word 0xf0440000  ! 2024: LDSW_R	ldsw	[%r16 + %r0], %r24
cpu_intr_2_175:
	setx	0x2d010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4848020  ! 2026: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r26
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982c40  ! 2027: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c40, %hpstate
cpu_intr_2_176:
	setx	0x2f0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0352028  ! 2029: SUBC_I	orn 	%r20, 0x0028, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf205a1b8  ! 2032: LDUW_I	lduw	[%r22 + 0x01b8], %r25
T2_asi_reg_wr_79:
	mov	0x23, %r14
	.word 0xfcf389e0  ! 2033: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf4148000  ! 2037: LDUH_R	lduh	[%r18 + %r0], %r26
cpu_intr_2_177:
	setx	0x2f033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_80:
	mov	0x3c8, %r14
	.word 0xf2f384a0  ! 2039: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf20ce191  ! 2041: LDUB_I	ldub	[%r19 + 0x0191], %r25
	.word 0xf48560a0  ! 2045: LDUWA_I	lduwa	[%r21, + 0x00a0] %asi, %r26
cpu_intr_2_178:
	setx	0x2c0302, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, 28)
T2_asi_reg_rd_94:
	mov	0x2a, %r14
	.word 0xfcdb84a0  ! 2052: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb215c000  ! 2055: OR_R	or 	%r23, %r0, %r25
	.word 0xf6c4e1ea  ! 2056: LDSWA_I	ldswa	[%r19, + 0x01ea] %asi, %r27
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 15)
	.word 0xf6c421b0  ! 2058: LDSWA_I	ldswa	[%r16, + 0x01b0] %asi, %r27
cpu_intr_2_179:
	setx	0x2d0012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_rd_95:
	mov	0x28, %r14
	.word 0xfedb8e40  ! 2061: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 32)
	.word 0xf0d5a107  ! 2063: LDSHA_I	ldsha	[%r22, + 0x0107] %asi, %r24
	.word 0xbea54000  ! 2065: SUBcc_R	subcc 	%r21, %r0, %r31
	.word 0xf0dca0d3  ! 2067: LDXA_I	ldxa	[%r18, + 0x00d3] %asi, %r24
T2_asi_reg_wr_81:
	mov	0x3c5, %r14
	.word 0xfcf389e0  ! 2069: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf644e1b0  ! 2070: LDSW_I	ldsw	[%r19 + 0x01b0], %r27
	.word 0xfe4c8000  ! 2074: LDSB_R	ldsb	[%r18 + %r0], %r31
	.word 0xfe85a051  ! 2080: LDUWA_I	lduwa	[%r22, + 0x0051] %asi, %r31
	.word 0xf6844020  ! 2084: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r27
cpu_intr_2_180:
	setx	0x2f0038, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_96:
	mov	0x3c6, %r14
	.word 0xfedb8e60  ! 2087: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T2_asi_reg_rd_97:
	mov	0x3c6, %r14
	.word 0xf8db8e60  ! 2088: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982cc2  ! 2089: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc2, %hpstate
	.word 0xfed5a1b5  ! 2090: LDSHA_I	ldsha	[%r22, + 0x01b5] %asi, %r31
	.word 0xf20da05b  ! 2096: LDUB_I	ldub	[%r22 + 0x005b], %r25
	.word 0xf64c6008  ! 2101: LDSB_I	ldsb	[%r17 + 0x0008], %r27
cpu_intr_2_181:
	setx	0x2f0309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a54000  ! 2106: SUBcc_R	subcc 	%r21, %r0, %r28
T2_asi_reg_wr_82:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 2108: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_rd_98:
	mov	0x28, %r14
	.word 0xf0db8e40  ! 2109: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_rd_99:
	mov	0xb, %r14
	.word 0xf4db89e0  ! 2111: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_rd_100:
	mov	0x3c7, %r14
	.word 0xf2db8e60  ! 2114: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T2_asi_reg_wr_83:
	mov	0x3c1, %r14
	.word 0xf0f389e0  ! 2115: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xfe94c020  ! 2116: LDUHA_R	lduha	[%r19, %r0] 0x01, %r31
	.word 0xf4dc6091  ! 2117: LDXA_I	ldxa	[%r17, + 0x0091] %asi, %r26
	.word 0xb0c5a16d  ! 2118: ADDCcc_I	addccc 	%r22, 0x016d, %r24
cpu_intr_2_182:
	setx	0x2e030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_101:
	mov	0x15, %r14
	.word 0xf0db8400  ! 2124: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb03c219e  ! 2126: XNOR_I	xnor 	%r16, 0x019e, %r24
	.word 0xfac52152  ! 2127: LDSWA_I	ldswa	[%r20, + 0x0152] %asi, %r29
	.word 0xf68421f2  ! 2129: LDUWA_I	lduwa	[%r16, + 0x01f2] %asi, %r27
	.word 0xf04d4000  ! 2130: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xf2048000  ! 2131: LDUW_R	lduw	[%r18 + %r0], %r25
	.word 0xf88c0020  ! 2137: LDUBA_R	lduba	[%r16, %r0] 0x01, %r28
cpu_intr_2_183:
	setx	0x2d0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c5608c  ! 2141: ADDCcc_I	addccc 	%r21, 0x008c, %r26
cpu_intr_2_184:
	setx	0x2d033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 16)
	.word 0xf685c020  ! 2152: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r27
	.word 0xb02d60a3  ! 2153: ANDN_I	andn 	%r21, 0x00a3, %r24
	.word 0xfe548000  ! 2154: LDSH_R	ldsh	[%r18 + %r0], %r31
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 24)
	.word 0xf4ccc020  ! 2156: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r26
	ta	T_CHANGE_TO_TL0
	.word 0xb8bc4000  ! 2161: XNORcc_R	xnorcc 	%r17, %r0, %r28
	.word 0xf4552028  ! 2165: LDSH_I	ldsh	[%r20 + 0x0028], %r26
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, c)
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_wr_84:
	mov	0x27, %r14
	.word 0xf0f38e40  ! 2172: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb73d1000  ! 2173: SRAX_R	srax	%r20, %r0, %r27
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 36)
	.word 0xf2458000  ! 2176: LDSW_R	ldsw	[%r22 + %r0], %r25
T2_asi_reg_wr_85:
	mov	0x28, %r14
	.word 0xf6f38400  ! 2177: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T2_asi_reg_wr_86:
	mov	0x3c5, %r14
	.word 0xf4f389e0  ! 2179: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf44da033  ! 2180: LDSB_I	ldsb	[%r22 + 0x0033], %r26
T2_asi_reg_wr_87:
	mov	0x18, %r14
	.word 0xf0f38e80  ! 2184: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_185:
	setx	0x2e022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bce02c  ! 2187: XNORcc_I	xnorcc 	%r19, 0x002c, %r27
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, 37)
	ta	T_CHANGE_HPRIV
	.word 0xf45c21e4  ! 2195: LDX_I	ldx	[%r16 + 0x01e4], %r26
cpu_intr_2_186:
	setx	0x2c0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba954000  ! 2199: ORcc_R	orcc 	%r21, %r0, %r29
cpu_intr_2_187:
	setx	0x2c0010, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_188:
	setx	0x2d0106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_189:
	setx	0x2e021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20c8000  ! 2207: LDUB_R	ldub	[%r18 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, 15)
	.word 0xb044e126  ! 2213: ADDC_I	addc 	%r19, 0x0126, %r24
	.word 0xb2854000  ! 2216: ADDcc_R	addcc 	%r21, %r0, %r25
	.word 0xfc0c0000  ! 2217: LDUB_R	ldub	[%r16 + %r0], %r30
	ta	T_CHANGE_TO_TL1
	.word 0xfa850020  ! 2221: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r29
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983ad2  ! 2222: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad2, %hpstate
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982e42  ! 2223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e42, %hpstate
T2_asi_reg_rd_102:
	mov	0x36, %r14
	.word 0xfcdb84a0  ! 2224: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_wr_88:
	mov	0x33, %r14
	.word 0xf4f38e80  ! 2226: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_2_190:
	setx	0x2d010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c5e1b4  ! 2228: ADDCcc_I	addccc 	%r23, 0x01b4, %r28
T2_asi_reg_wr_89:
	mov	0x27, %r14
	.word 0xf4f389e0  ! 2230: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_rd_103:
	mov	0x11, %r14
	.word 0xf4db8e60  ! 2233: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_2_191:
	setx	0x2f0013, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_104:
	mov	0x1e, %r14
	.word 0xfcdb8e40  ! 2237: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_rd_105:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 2238: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb895a1a5  ! 2239: ORcc_I	orcc 	%r22, 0x01a5, %r28
	.word 0xfc8c20e2  ! 2242: LDUBA_I	lduba	[%r16, + 0x00e2] %asi, %r30
	.word 0xf0044000  ! 2244: LDUW_R	lduw	[%r17 + %r0], %r24
	.word 0xfc954020  ! 2246: LDUHA_R	lduha	[%r21, %r0] 0x01, %r30
cpu_intr_2_192:
	setx	0x2f032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_wr_90:
	mov	0x3c2, %r14
	.word 0xfaf38400  ! 2251: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T2_asi_reg_rd_106:
	mov	0x28, %r14
	.word 0xf8db8400  ! 2254: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983b40  ! 2255: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b40, %hpstate
	.word 0xf445a1ea  ! 2256: LDSW_I	ldsw	[%r22 + 0x01ea], %r26
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_193:
	setx	0x2d023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_194:
	setx	0x2d0307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 2263: RDPR_TL	rdpr	%tl, %r29
T2_asi_reg_rd_107:
	mov	0x10, %r14
	.word 0xf0db84a0  ! 2264: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xfe14c000  ! 2266: LDUH_R	lduh	[%r19 + %r0], %r31
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 7)
	.word 0xf044c000  ! 2269: LDSW_R	ldsw	[%r19 + %r0], %r24
cpu_intr_2_195:
	setx	0x2c0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84c4000  ! 2272: LDSB_R	ldsb	[%r17 + %r0], %r28
	.word 0xb1504000  ! 2273: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_196:
	setx	0x2e030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf2d5a136  ! 2286: LDSHA_I	ldsha	[%r22, + 0x0136] %asi, %r25
	ta	T_CHANGE_TO_TL1
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_rd_108:
	mov	0x30, %r14
	.word 0xfedb84a0  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_91:
	mov	0x2d, %r14
	.word 0xfcf38e40  ! 2293: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf6cc60b0  ! 2295: LDSBA_I	ldsba	[%r17, + 0x00b0] %asi, %r27
	ta	T_CHANGE_TO_TL1
cpu_intr_2_197:
	setx	0x320235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0a5a0e6  ! 2300: SUBcc_I	subcc 	%r22, 0x00e6, %r24
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_109:
	mov	0x16, %r14
	.word 0xf8db8400  ! 2303: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf4858020  ! 2304: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r26
T2_asi_reg_rd_110:
	mov	0x3c3, %r14
	.word 0xf8db8400  ! 2305: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_2_198:
	setx	0x320219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8558000  ! 2311: LDSH_R	ldsh	[%r22 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_111:
	mov	0x3c5, %r14
	.word 0xf2db89e0  ! 2314: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfc5c607a  ! 2317: LDX_I	ldx	[%r17 + 0x007a], %r30
cpu_intr_2_199:
	setx	0x320016, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_92:
	mov	0x1e, %r14
	.word 0xf2f38e80  ! 2320: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf8d561a2  ! 2321: LDSHA_I	ldsha	[%r21, + 0x01a2] %asi, %r28
T2_asi_reg_wr_93:
	mov	0xe, %r14
	.word 0xf2f384a0  ! 2324: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfe4ce055  ! 2325: LDSB_I	ldsb	[%r19 + 0x0055], %r31
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, 27)
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, 38)
	.word 0xf24421dd  ! 2329: LDSW_I	ldsw	[%r16 + 0x01dd], %r25
cpu_intr_2_200:
	setx	0x31013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b48000  ! 2331: SUBCcc_R	orncc 	%r18, %r0, %r24
	ta	T_CHANGE_TO_TL0
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 0)
	.word 0xf415c000  ! 2334: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0xfa5d8000  ! 2340: LDX_R	ldx	[%r22 + %r0], %r29
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 2b)
	.word 0xb8256031  ! 2345: SUB_I	sub 	%r21, 0x0031, %r28
cpu_intr_2_201:
	setx	0x33012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_94:
	mov	0x11, %r14
	.word 0xf0f38e60  ! 2347: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, c)
	.word 0xf04d208e  ! 2351: LDSB_I	ldsb	[%r20 + 0x008e], %r24
	.word 0xfedd2171  ! 2353: LDXA_I	ldxa	[%r20, + 0x0171] %asi, %r31
	.word 0xf64ce146  ! 2354: LDSB_I	ldsb	[%r19 + 0x0146], %r27
	.word 0xfa8ce05c  ! 2355: LDUBA_I	lduba	[%r19, + 0x005c] %asi, %r29
	.word 0xfacc21b2  ! 2358: LDSBA_I	ldsba	[%r16, + 0x01b2] %asi, %r29
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 28)
T2_asi_reg_wr_95:
	mov	0x18, %r14
	.word 0xf2f38400  ! 2361: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T2_asi_reg_rd_112:
	mov	0x31, %r14
	.word 0xfadb8e40  ! 2364: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf8444000  ! 2365: LDSW_R	ldsw	[%r17 + %r0], %r28
T2_asi_reg_wr_96:
	mov	0x24, %r14
	.word 0xfcf38e60  ! 2366: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_202:
	setx	0x31033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983992  ! 2368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1992, %hpstate
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 31)
	.word 0xf0cc217b  ! 2370: LDSBA_I	ldsba	[%r16, + 0x017b] %asi, %r24
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, f)
	.word 0xf6544000  ! 2377: LDSH_R	ldsh	[%r17 + %r0], %r27
	ta	T_CHANGE_HPRIV
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, 17)
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
cpu_intr_2_203:
	setx	0x330309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45420de  ! 2391: LDSH_I	ldsh	[%r16 + 0x00de], %r26
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_wr_97:
	mov	0x9, %r14
	.word 0xfef389e0  ! 2394: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_wr_98:
	mov	0x3c6, %r14
	.word 0xfcf389e0  ! 2395: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_wr_99:
	mov	0x20, %r14
	.word 0xf2f38e80  ! 2399: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_204:
	setx	0x300130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_rd_113:
	mov	0x3c4, %r14
	.word 0xfcdb8e80  ! 2407: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T2_asi_reg_rd_114:
	mov	0x17, %r14
	.word 0xfcdb8400  ! 2408: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf2dda09b  ! 2411: LDXA_I	ldxa	[%r22, + 0x009b] %asi, %r25
T2_asi_reg_rd_115:
	mov	0x1f, %r14
	.word 0xfadb8e40  ! 2412: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_116:
	mov	0x3c5, %r14
	.word 0xf2db8e80  ! 2415: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T2_asi_reg_wr_100:
	mov	0x3c6, %r14
	.word 0xf8f384a0  ! 2416: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf60dc000  ! 2417: LDUB_R	ldub	[%r23 + %r0], %r27
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, 5)
T2_asi_reg_rd_117:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 2420: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_rd_118:
	mov	0x3, %r14
	.word 0xfadb8e40  ! 2423: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfed461c0  ! 2424: LDSHA_I	ldsha	[%r17, + 0x01c0] %asi, %r31
	.word 0xf85c8000  ! 2425: LDX_R	ldx	[%r18 + %r0], %r28
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 1)
	.word 0xf2d5a083  ! 2427: LDSHA_I	ldsha	[%r22, + 0x0083] %asi, %r25
cpu_intr_2_205:
	setx	0x330234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3c2001  ! 2433: SRA_I	sra 	%r16, 0x0001, %r31
	.word 0xbe8c0000  ! 2434: ANDcc_R	andcc 	%r16, %r0, %r31
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_101:
	mov	0x1, %r14
	.word 0xfaf38e80  ! 2442: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbb2de001  ! 2443: SLL_I	sll 	%r23, 0x0001, %r29
cpu_intr_2_206:
	setx	0x300112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28ce0b5  ! 2448: LDUBA_I	lduba	[%r19, + 0x00b5] %asi, %r25
cpu_intr_2_207:
	setx	0x31000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 2456: RDPR_GL	<illegal instruction>
cpu_intr_2_208:
	setx	0x30021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf615c000  ! 2460: LDUH_R	lduh	[%r23 + %r0], %r27
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983e50  ! 2461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e50, %hpstate
T2_asi_reg_wr_102:
	mov	0x29, %r14
	.word 0xf0f38e40  ! 2462: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_209:
	setx	0x310007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfac4606b  ! 2464: LDSWA_I	ldswa	[%r17, + 0x006b] %asi, %r29
	.word 0xbd3c8000  ! 2467: SRA_R	sra 	%r18, %r0, %r30
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 15)
	.word 0xbc3de033  ! 2472: XNOR_I	xnor 	%r23, 0x0033, %r30
T2_asi_reg_wr_103:
	mov	0x3c0, %r14
	.word 0xf8f384a0  ! 2473: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbe148000  ! 2476: OR_R	or 	%r18, %r0, %r31
cpu_intr_2_210:
	setx	0x30003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf885a045  ! 2484: LDUWA_I	lduwa	[%r22, + 0x0045] %asi, %r28
	.word 0xf4448000  ! 2485: LDSW_R	ldsw	[%r18 + %r0], %r26
	.word 0xbd2c9000  ! 2488: SLLX_R	sllx	%r18, %r0, %r30
	.word 0xf4cc0020  ! 2490: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r26
	.word 0xf015e0cf  ! 2491: LDUH_I	lduh	[%r23 + 0x00cf], %r24
	.word 0xfe95e1aa  ! 2495: LDUHA_I	lduha	[%r23, + 0x01aa] %asi, %r31
cpu_intr_2_211:
	setx	0x300231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, b)
	.word 0xf0d4e1c6  ! 2506: LDSHA_I	ldsha	[%r19, + 0x01c6] %asi, %r24
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_212:
	setx	0x30002a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, 18)
	.word 0xb80d0000  ! 2512: AND_R	and 	%r20, %r0, %r28
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982e50  ! 2515: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e50, %hpstate
	.word 0xbf356001  ! 2516: SRL_I	srl 	%r21, 0x0001, %r31
	.word 0xf88ca04c  ! 2517: LDUBA_I	lduba	[%r18, + 0x004c] %asi, %r28
cpu_intr_2_213:
	setx	0x330339, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_119:
	mov	0x2f, %r14
	.word 0xfcdb8400  ! 2521: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982ac0  ! 2525: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac0, %hpstate
T2_asi_reg_wr_104:
	mov	0x22, %r14
	.word 0xfef384a0  ! 2527: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, 6)
	.word 0xfc0d4000  ! 2529: LDUB_R	ldub	[%r21 + %r0], %r30
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x819838d0  ! 2532: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d0, %hpstate
	.word 0xf484a052  ! 2536: LDUWA_I	lduwa	[%r18, + 0x0052] %asi, %r26
T2_asi_reg_wr_105:
	mov	0x24, %r14
	.word 0xf0f38e80  ! 2537: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb8b58000  ! 2538: SUBCcc_R	orncc 	%r22, %r0, %r28
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_214:
	setx	0x330015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa540000  ! 2547: LDSH_R	ldsh	[%r16 + %r0], %r29
T2_asi_reg_rd_120:
	mov	0x3c8, %r14
	.word 0xf0db8e60  ! 2549: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_rd_121:
	mov	0xa, %r14
	.word 0xf6db89e0  ! 2550: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982802  ! 2551: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0802, %hpstate
T2_asi_reg_wr_106:
	mov	0x38, %r14
	.word 0xf4f389e0  ! 2552: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf4c5209e  ! 2555: LDSWA_I	ldswa	[%r20, + 0x009e] %asi, %r26
T2_asi_reg_wr_107:
	mov	0x16, %r14
	.word 0xf4f38e60  ! 2556: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf0840020  ! 2558: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r24
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, d)
	.word 0xfcc4e0bd  ! 2562: LDSWA_I	ldswa	[%r19, + 0x00bd] %asi, %r30
	.word 0xf8cd20d4  ! 2563: LDSBA_I	ldsba	[%r20, + 0x00d4] %asi, %r28
	.word 0xfe5c0000  ! 2568: LDX_R	ldx	[%r16 + %r0], %r31
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 36)
	.word 0xf2444000  ! 2572: LDSW_R	ldsw	[%r17 + %r0], %r25
	.word 0xf0cd4020  ! 2573: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r24
	.word 0xf204c000  ! 2575: LDUW_R	lduw	[%r19 + %r0], %r25
T2_asi_reg_rd_122:
	mov	0x19, %r14
	.word 0xfcdb84a0  ! 2576: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf405e0ae  ! 2577: LDUW_I	lduw	[%r23 + 0x00ae], %r26
	.word 0xfc5cc000  ! 2580: LDX_R	ldx	[%r19 + %r0], %r30
	.word 0xf0dc60ef  ! 2583: LDXA_I	ldxa	[%r17, + 0x00ef] %asi, %r24
	.word 0xfc84a1c8  ! 2586: LDUWA_I	lduwa	[%r18, + 0x01c8] %asi, %r30
T2_asi_reg_wr_108:
	mov	0x24, %r14
	.word 0xfcf38e80  ! 2588: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf0c44020  ! 2590: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r24
	.word 0xf2044000  ! 2591: LDUW_R	lduw	[%r17 + %r0], %r25
	.word 0xfc5ce035  ! 2592: LDX_I	ldx	[%r19 + 0x0035], %r30
	.word 0xfe5da169  ! 2593: LDX_I	ldx	[%r22 + 0x0169], %r31
	.word 0xfed5c020  ! 2594: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r31
	.word 0xfc540000  ! 2596: LDSH_R	ldsh	[%r16 + %r0], %r30
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 1)
	.word 0xfa55c000  ! 2603: LDSH_R	ldsh	[%r23 + %r0], %r29
cpu_intr_2_215:
	setx	0x33012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84c2188  ! 2609: LDSB_I	ldsb	[%r16 + 0x0188], %r28
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 2)
	.word 0xf0cc2172  ! 2612: LDSBA_I	ldsba	[%r16, + 0x0172] %asi, %r24
cpu_intr_2_216:
	setx	0x30020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_217:
	setx	0x330126, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_218:
	setx	0x320136, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_109:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 2618: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_wr_110:
	mov	0x3c6, %r14
	.word 0xf4f38e80  ! 2623: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf24da197  ! 2624: LDSB_I	ldsb	[%r22 + 0x0197], %r25
	.word 0xf49521a1  ! 2626: LDUHA_I	lduha	[%r20, + 0x01a1] %asi, %r26
	.word 0xf654a089  ! 2629: LDSH_I	ldsh	[%r18 + 0x0089], %r27
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, e)
	.word 0xf2444000  ! 2632: LDSW_R	ldsw	[%r17 + %r0], %r25
	ta	T_CHANGE_NONHPRIV
	.word 0xb605e19c  ! 2638: ADD_I	add 	%r23, 0x019c, %r27
	.word 0xfe15a0c9  ! 2639: LDUH_I	lduh	[%r22 + 0x00c9], %r31
	.word 0xf65de077  ! 2643: LDX_I	ldx	[%r23 + 0x0077], %r27
cpu_intr_2_219:
	setx	0x32013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_220:
	setx	0x310236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf604215c  ! 2649: LDUW_I	lduw	[%r16 + 0x015c], %r27
	.word 0xf80c0000  ! 2650: LDUB_R	ldub	[%r16 + %r0], %r28
	.word 0x8795a168  ! 2651: WRPR_TT_I	wrpr	%r22, 0x0168, %tt
T2_asi_reg_rd_123:
	mov	0x33, %r14
	.word 0xf4db89e0  ! 2652: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 35)
	.word 0xf0144000  ! 2657: LDUH_R	lduh	[%r17 + %r0], %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xfe8c2148  ! 2659: LDUBA_I	lduba	[%r16, + 0x0148] %asi, %r31
	ta	T_CHANGE_NONHPRIV
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_221:
	setx	0x330033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcdca106  ! 2669: LDXA_I	ldxa	[%r18, + 0x0106] %asi, %r30
cpu_intr_2_222:
	setx	0x330126, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_223:
	setx	0x320232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe05a17c  ! 2679: LDUW_I	lduw	[%r22 + 0x017c], %r31
	.word 0xf4d5a168  ! 2683: LDSHA_I	ldsha	[%r22, + 0x0168] %asi, %r26
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 37)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_111:
	mov	0x10, %r14
	.word 0xfef38e80  ! 2690: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb6b54000  ! 2691: ORNcc_R	orncc 	%r21, %r0, %r27
T2_asi_reg_rd_124:
	mov	0x3c6, %r14
	.word 0xf6db8e60  ! 2692: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_2_224:
	setx	0x300107, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_112:
	mov	0x13, %r14
	.word 0xf8f389e0  ! 2697: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xfc55a0ec  ! 2701: LDSH_I	ldsh	[%r22 + 0x00ec], %r30
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_225:
	setx	0x31020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_125:
	mov	0x31, %r14
	.word 0xf0db8e40  ! 2704: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfecc0020  ! 2705: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r31
	.word 0xbd2db001  ! 2706: SLLX_I	sllx	%r22, 0x0001, %r30
cpu_intr_2_226:
	setx	0x310001, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 2)
cpu_intr_2_227:
	setx	0x300205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5de178  ! 2716: LDX_I	ldx	[%r23 + 0x0178], %r31
	.word 0xf0c4e0b2  ! 2717: LDSWA_I	ldswa	[%r19, + 0x00b2] %asi, %r24
T2_asi_reg_wr_113:
	mov	0x5, %r14
	.word 0xfcf38e40  ! 2718: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbe350000  ! 2722: SUBC_R	orn 	%r20, %r0, %r31
	ta	T_CHANGE_TO_TL1
	.word 0xf4844020  ! 2726: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r26
	.word 0xb5480000  ! 2727: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xfc5de0c6  ! 2729: LDX_I	ldx	[%r23 + 0x00c6], %r30
T2_asi_reg_wr_114:
	mov	0x38, %r14
	.word 0xfaf384a0  ! 2730: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb4bc217f  ! 2736: XNORcc_I	xnorcc 	%r16, 0x017f, %r26
cpu_intr_2_228:
	setx	0x30022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_115:
	mov	0xc, %r14
	.word 0xfaf38e80  ! 2738: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_229:
	setx	0x370112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_230:
	setx	0x35032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_126:
	mov	0xd, %r14
	.word 0xf4db8e80  ! 2746: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xfacde0dc  ! 2749: LDSBA_I	ldsba	[%r23, + 0x00dc] %asi, %r29
	.word 0xf6ccc020  ! 2750: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r27
cpu_intr_2_231:
	setx	0x350112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 2)
cpu_intr_2_232:
	setx	0x360305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_233:
	setx	0x370208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 17)
	.word 0xf2552076  ! 2764: LDSH_I	ldsh	[%r20 + 0x0076], %r25
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_234:
	setx	0x35002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf205e14c  ! 2773: LDUW_I	lduw	[%r23 + 0x014c], %r25
cpu_intr_2_235:
	setx	0x340000, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_127:
	mov	0x3c5, %r14
	.word 0xf2db8e40  ! 2777: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb0940000  ! 2778: ORcc_R	orcc 	%r16, %r0, %r24
cpu_intr_2_236:
	setx	0x340130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf414c000  ! 2781: LDUH_R	lduh	[%r19 + %r0], %r26
T2_asi_reg_wr_116:
	mov	0x36, %r14
	.word 0xfef384a0  ! 2783: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfa446008  ! 2784: LDSW_I	ldsw	[%r17 + 0x0008], %r29
	.word 0xf08d21c4  ! 2788: LDUBA_I	lduba	[%r20, + 0x01c4] %asi, %r24
	.word 0xba9cc000  ! 2789: XORcc_R	xorcc 	%r19, %r0, %r29
	.word 0xf0048000  ! 2791: LDUW_R	lduw	[%r18 + %r0], %r24
T2_asi_reg_wr_117:
	mov	0xc, %r14
	.word 0xf4f38e40  ! 2792: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 22)
	.word 0xf2c40020  ! 2794: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r25
T2_asi_reg_wr_118:
	mov	0x3c1, %r14
	.word 0xf8f38e60  ! 2798: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb4958000  ! 2799: ORcc_R	orcc 	%r22, %r0, %r26
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 29)
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982ed0  ! 2805: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed0, %hpstate
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_rd_128:
	mov	0x3c3, %r14
	.word 0xf6db8e80  ! 2807: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbe050000  ! 2812: ADD_R	add 	%r20, %r0, %r31
	.word 0xfc84a080  ! 2813: LDUWA_I	lduwa	[%r18, + 0x0080] %asi, %r30
	.word 0xbc852144  ! 2818: ADDcc_I	addcc 	%r20, 0x0144, %r30
T2_asi_reg_wr_119:
	mov	0x20, %r14
	.word 0xfaf38400  ! 2819: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_2_237:
	setx	0x360115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfac4a124  ! 2821: LDSWA_I	ldswa	[%r18, + 0x0124] %asi, %r29
	ta	T_CHANGE_TO_TL1
	.word 0xfe94c020  ! 2823: LDUHA_R	lduha	[%r19, %r0] 0x01, %r31
	ta	T_CHANGE_HPRIV
	.word 0xfe440000  ! 2827: LDSW_R	ldsw	[%r16 + %r0], %r31
	ta	T_CHANGE_HPRIV
cpu_intr_2_238:
	setx	0x360132, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_129:
	mov	0x6, %r14
	.word 0xf6db8e60  ! 2830: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf004216e  ! 2831: LDUW_I	lduw	[%r16 + 0x016e], %r24
	.word 0xf2dde129  ! 2832: LDXA_I	ldxa	[%r23, + 0x0129] %asi, %r25
	.word 0xfc45c000  ! 2833: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xf695600e  ! 2834: LDUHA_I	lduha	[%r21, + 0x000e] %asi, %r27
	.word 0xf24d21f9  ! 2837: LDSB_I	ldsb	[%r20 + 0x01f9], %r25
	.word 0xfa54a171  ! 2838: LDSH_I	ldsh	[%r18 + 0x0171], %r29
	.word 0xb6c461eb  ! 2839: ADDCcc_I	addccc 	%r17, 0x01eb, %r27
	.word 0xf8948020  ! 2840: LDUHA_R	lduha	[%r18, %r0] 0x01, %r28
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 21)
	.word 0xfec44020  ! 2846: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r31
	.word 0xb01da1af  ! 2847: XOR_I	xor 	%r22, 0x01af, %r24
T2_asi_reg_wr_120:
	mov	0x2d, %r14
	.word 0xfaf38e40  ! 2851: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf295e135  ! 2858: LDUHA_I	lduha	[%r23, + 0x0135] %asi, %r25
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_239:
	setx	0x360135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4c8000  ! 2863: LDSB_R	ldsb	[%r18 + %r0], %r31
T2_asi_reg_wr_121:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 2864: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf0458000  ! 2867: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xbf343001  ! 2874: SRLX_I	srlx	%r16, 0x0001, %r31
	.word 0xf68c4020  ! 2876: LDUBA_R	lduba	[%r17, %r0] 0x01, %r27
cpu_intr_2_240:
	setx	0x340321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfac560a2  ! 2881: LDSWA_I	ldswa	[%r21, + 0x00a2] %asi, %r29
	.word 0xf4c5e1f1  ! 2882: LDSWA_I	ldswa	[%r23, + 0x01f1] %asi, %r26
T2_asi_reg_rd_130:
	mov	0x1c, %r14
	.word 0xfcdb84a0  ! 2883: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_2_241:
	setx	0x34012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_131:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 2885: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_wr_122:
	mov	0x21, %r14
	.word 0xf2f389e0  ! 2886: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb6c4c000  ! 2887: ADDCcc_R	addccc 	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_rd_132:
	mov	0x5, %r14
	.word 0xf4db8e80  ! 2891: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_242:
	setx	0x37010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_133:
	mov	0x11, %r14
	.word 0xf6db89e0  ! 2898: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf2dce054  ! 2899: LDXA_I	ldxa	[%r19, + 0x0054] %asi, %r25
T2_asi_reg_wr_123:
	mov	0x32, %r14
	.word 0xf0f389e0  ! 2901: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xfc94e14e  ! 2903: LDUHA_I	lduha	[%r19, + 0x014e] %asi, %r30
cpu_intr_2_243:
	setx	0x37001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2cc20cc  ! 2908: LDSBA_I	ldsba	[%r16, + 0x00cc] %asi, %r25
	.word 0xfad50020  ! 2909: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r29
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 1)
	.word 0xf6d4a0a9  ! 2916: LDSHA_I	ldsha	[%r18, + 0x00a9] %asi, %r27
T2_asi_reg_rd_134:
	mov	0x3c7, %r14
	.word 0xf2db89e0  ! 2917: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf685a0c9  ! 2919: LDUWA_I	lduwa	[%r22, + 0x00c9] %asi, %r27
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_rd_135:
	mov	0x3c2, %r14
	.word 0xfadb8400  ! 2921: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_2_244:
	setx	0x360322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc952086  ! 2924: LDUHA_I	lduha	[%r20, + 0x0086] %asi, %r30
cpu_intr_2_245:
	setx	0x370230, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_124:
	mov	0x25, %r14
	.word 0xfcf38e80  ! 2926: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf00ca085  ! 2927: LDUB_I	ldub	[%r18 + 0x0085], %r24
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 4)
	.word 0xfecc217e  ! 2930: LDSBA_I	ldsba	[%r16, + 0x017e] %asi, %r31
	.word 0xb9343001  ! 2932: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0xf205c000  ! 2933: LDUW_R	lduw	[%r23 + %r0], %r25
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, f)
	.word 0xf2c5e1f0  ! 2937: LDSWA_I	ldswa	[%r23, + 0x01f0] %asi, %r25
T2_asi_reg_rd_136:
	mov	0x13, %r14
	.word 0xfadb8e60  ! 2938: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	ta	T_CHANGE_TO_TL1
	.word 0xf0dca046  ! 2944: LDXA_I	ldxa	[%r18, + 0x0046] %asi, %r24
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_246:
	setx	0x35010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_137:
	mov	0x3c2, %r14
	.word 0xf4db8e60  ! 2949: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
cpu_intr_2_247:
	setx	0x350008, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 34)
	.word 0xf60c214f  ! 2964: LDUB_I	ldub	[%r16 + 0x014f], %r27
cpu_intr_2_248:
	setx	0x35012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, e)
	.word 0xf85520ce  ! 2973: LDSH_I	ldsh	[%r20 + 0x00ce], %r28
	.word 0xfa054000  ! 2977: LDUW_R	lduw	[%r21 + %r0], %r29
cpu_intr_2_249:
	setx	0x35020e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 0)
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_125:
	mov	0x7, %r14
	.word 0xf6f38400  ! 2981: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_rd_138:
	mov	0x3c5, %r14
	.word 0xf8db8e80  ! 2983: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xfa15a04d  ! 2984: LDUH_I	lduh	[%r22 + 0x004d], %r29
	.word 0xf6dda0ad  ! 2986: LDXA_I	ldxa	[%r22, + 0x00ad] %asi, %r27
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_250:
	setx	0x36021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05c2095  ! 2995: LDX_I	ldx	[%r16 + 0x0095], %r24
	ta	T_CHANGE_TO_TL1
	.word 0xf4048000  ! 2999: LDUW_R	lduw	[%r18 + %r0], %r26
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, b)
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_rd_139:
	mov	0x1b, %r14
	.word 0xf4db8e40  ! 3004: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf0446121  ! 3007: LDSW_I	ldsw	[%r17 + 0x0121], %r24
	.word 0xfa5ce154  ! 3012: LDX_I	ldx	[%r19 + 0x0154], %r29
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_wr_126:
	mov	0x0, %r14
	.word 0xf0f38e40  ! 3015: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_251:
	setx	0x35021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_140:
	mov	0x3c0, %r14
	.word 0xf2db8e60  ! 3019: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_252:
	setx	0x340126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf245200a  ! 3023: LDSW_I	ldsw	[%r20 + 0x000a], %r25
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 33)
	.word 0xf8150000  ! 3028: LDUH_R	lduh	[%r20 + %r0], %r28
cpu_intr_2_253:
	setx	0x35000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa858020  ! 3034: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r29
	.word 0xf68da0be  ! 3037: LDUBA_I	lduba	[%r22, + 0x00be] %asi, %r27
T2_asi_reg_wr_127:
	mov	0x1a, %r14
	.word 0xf6f38e40  ! 3039: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, e)
	.word 0xfa548000  ! 3041: LDSH_R	ldsh	[%r18 + %r0], %r29
cpu_intr_2_254:
	setx	0x350304, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_141:
	mov	0x4, %r14
	.word 0xf6db89e0  ! 3044: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T2_asi_reg_wr_128:
	mov	0xd, %r14
	.word 0xf2f38400  ! 3045: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_2_255:
	setx	0x340125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 2)
cpu_intr_2_256:
	setx	0x350210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_257:
	setx	0x350124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 0)
cpu_intr_2_258:
	setx	0x340215, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_129:
	mov	0x36, %r14
	.word 0xf4f38e40  ! 3063: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 1c)
	.word 0xfe4c0000  ! 3070: LDSB_R	ldsb	[%r16 + %r0], %r31
	.word 0xfa0c2002  ! 3071: LDUB_I	ldub	[%r16 + 0x0002], %r29
T2_asi_reg_wr_130:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 3072: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf0054000  ! 3073: LDUW_R	lduw	[%r21 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_142:
	mov	0x17, %r14
	.word 0xf2db89e0  ! 3078: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T2_asi_reg_rd_143:
	mov	0x19, %r14
	.word 0xfedb8e80  ! 3080: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T2_asi_reg_rd_144:
	mov	0x3c5, %r14
	.word 0xf2db89e0  ! 3082: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbe358000  ! 3083: ORN_R	orn 	%r22, %r0, %r31
	.word 0xf0dce1a2  ! 3084: LDXA_I	ldxa	[%r19, + 0x01a2] %asi, %r24
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 31)
	.word 0xfa84616d  ! 3096: LDUWA_I	lduwa	[%r17, + 0x016d] %asi, %r29
	.word 0xb0144000  ! 3097: OR_R	or 	%r17, %r0, %r24
	.word 0xb435c000  ! 3098: ORN_R	orn 	%r23, %r0, %r26
	.word 0xfc55c000  ! 3099: LDSH_R	ldsh	[%r23 + %r0], %r30
T2_asi_reg_rd_145:
	mov	0x3c4, %r14
	.word 0xf0db89e0  ! 3102: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb68520e1  ! 3105: ADDcc_I	addcc 	%r20, 0x00e1, %r27
	.word 0xb4ac60d0  ! 3107: ANDNcc_I	andncc 	%r17, 0x00d0, %r26
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_259:
	setx	0x360215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc850000  ! 3114: ADDcc_R	addcc 	%r20, %r0, %r30
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_rd_146:
	mov	0x5, %r14
	.word 0xf6db8e60  ! 3119: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T2_asi_reg_wr_131:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 3120: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf20cc000  ! 3123: LDUB_R	ldub	[%r19 + %r0], %r25
cpu_intr_2_260:
	setx	0x35023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4c8000  ! 3129: LDSB_R	ldsb	[%r18 + %r0], %r29
cpu_intr_2_261:
	setx	0x35011b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_262:
	setx	0x360212, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_132:
	mov	0xa, %r14
	.word 0xf0f38e40  ! 3139: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfe4cc000  ! 3140: LDSB_R	ldsb	[%r19 + %r0], %r31
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 32)
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982a5a  ! 3147: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5a, %hpstate
cpu_intr_2_263:
	setx	0x350105, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_133:
	mov	0x30, %r14
	.word 0xf4f38e80  ! 3150: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T2_asi_reg_rd_147:
	mov	0x28, %r14
	.word 0xf8db8e80  ! 3152: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T2_asi_reg_wr_134:
	mov	0x3c3, %r14
	.word 0xf6f38e60  ! 3153: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb0248000  ! 3159: SUB_R	sub 	%r18, %r0, %r24
	.word 0xf6cde10d  ! 3161: LDSBA_I	ldsba	[%r23, + 0x010d] %asi, %r27
T2_asi_reg_wr_135:
	mov	0x2d, %r14
	.word 0xf4f38e40  ! 3164: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfcd5e139  ! 3168: LDSHA_I	ldsha	[%r23, + 0x0139] %asi, %r30
	.word 0xf004e144  ! 3169: LDUW_I	lduw	[%r19 + 0x0144], %r24
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, 7)
	.word 0xf8cd8020  ! 3172: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r28
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983bc2  ! 3175: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc2, %hpstate
	.word 0xfe446176  ! 3176: LDSW_I	ldsw	[%r17 + 0x0176], %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_264:
	setx	0x360200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c54020  ! 3184: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r26
	.word 0xfc856184  ! 3186: LDUWA_I	lduwa	[%r21, + 0x0184] %asi, %r30
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_265:
	setx	0x370330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d5a063  ! 3190: LDSHA_I	ldsha	[%r22, + 0x0063] %asi, %r25
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 21)
	.word 0xfa15a046  ! 3195: LDUH_I	lduh	[%r22 + 0x0046], %r29
cpu_intr_2_266:
	setx	0x34010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cda1cd  ! 3202: LDSBA_I	ldsba	[%r22, + 0x01cd] %asi, %r24
	.word 0xf2446195  ! 3203: LDSW_I	ldsw	[%r17 + 0x0195], %r25
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_rd_148:
	mov	0x3c4, %r14
	.word 0xfcdb8400  ! 3205: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf294e0da  ! 3206: LDUHA_I	lduha	[%r19, + 0x00da] %asi, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xf05d8000  ! 3215: LDX_R	ldx	[%r22 + %r0], %r24
T2_asi_reg_wr_136:
	mov	0xd, %r14
	.word 0xfaf38e40  ! 3216: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf2450000  ! 3217: LDSW_R	ldsw	[%r20 + %r0], %r25
	.word 0xf85d0000  ! 3220: LDX_R	ldx	[%r20 + %r0], %r28
	.word 0xb8952078  ! 3221: ORcc_I	orcc 	%r20, 0x0078, %r28
	.word 0xa1902000  ! 3227: WRPR_GL_I	wrpr	%r0, 0x0000, %-
T2_asi_reg_wr_137:
	mov	0x30, %r14
	.word 0xfef38e40  ! 3229: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_267:
	setx	0x3b033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa840020  ! 3233: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
cpu_intr_2_268:
	setx	0x380025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf614c000  ! 3235: LDUH_R	lduh	[%r19 + %r0], %r27
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 31)
	.word 0xfe8c2156  ! 3240: LDUBA_I	lduba	[%r16, + 0x0156] %asi, %r31
cpu_intr_2_269:
	setx	0x3a002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_270:
	setx	0x3b0031, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_138:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 3250: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf20520e4  ! 3251: LDUW_I	lduw	[%r20 + 0x00e4], %r25
	.word 0xf65de150  ! 3253: LDX_I	ldx	[%r23 + 0x0150], %r27
	.word 0xf20c4000  ! 3254: LDUB_R	ldub	[%r17 + %r0], %r25
	.word 0xb2a4c000  ! 3257: SUBcc_R	subcc 	%r19, %r0, %r25
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 17)
	.word 0xf64d8000  ! 3262: LDSB_R	ldsb	[%r22 + %r0], %r27
cpu_intr_2_271:
	setx	0x3b021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba354000  ! 3266: ORN_R	orn 	%r21, %r0, %r29
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_wr_139:
	mov	0x3c5, %r14
	.word 0xf4f38e80  ! 3270: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb1359000  ! 3271: SRLX_R	srlx	%r22, %r0, %r24
	.word 0xbaaca110  ! 3272: ANDNcc_I	andncc 	%r18, 0x0110, %r29
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_140:
	mov	0x3c6, %r14
	.word 0xfef38400  ! 3278: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbcb560e6  ! 3279: ORNcc_I	orncc 	%r21, 0x00e6, %r30
T2_asi_reg_wr_141:
	mov	0x3c8, %r14
	.word 0xfef38e40  ! 3282: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_149:
	mov	0x1, %r14
	.word 0xf0db8e80  ! 3283: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983980  ! 3284: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1980, %hpstate
cpu_intr_2_272:
	setx	0x38001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8995a011  ! 3289: WRPR_TICK_I	wrpr	%r22, 0x0011, %tick
	.word 0xf8dc21b6  ! 3295: LDXA_I	ldxa	[%r16, + 0x01b6] %asi, %r28
	.word 0xf20d4000  ! 3300: LDUB_R	ldub	[%r21 + %r0], %r25
T2_asi_reg_wr_142:
	mov	0x2e, %r14
	.word 0xf2f38e80  ! 3306: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_273:
	setx	0x39000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_143:
	mov	0x2c, %r14
	.word 0xfaf38400  ! 3309: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb2b5a102  ! 3312: SUBCcc_I	orncc 	%r22, 0x0102, %r25
	.word 0xf6854020  ! 3313: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r27
cpu_intr_2_274:
	setx	0x390027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_275:
	setx	0x39032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4550000  ! 3317: LDSH_R	ldsh	[%r20 + %r0], %r26
T2_asi_reg_wr_144:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 3318: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_276:
	setx	0x38001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_277:
	setx	0x3b030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c40020  ! 3328: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r28
	.word 0xfe04e1af  ! 3331: LDUW_I	lduw	[%r19 + 0x01af], %r31
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 3c)
cpu_intr_2_278:
	setx	0x3b0302, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 39)
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_145:
	mov	0x10, %r14
	.word 0xf0f384a0  ! 3344: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf8156051  ! 3346: LDUH_I	lduh	[%r21 + 0x0051], %r28
cpu_intr_2_279:
	setx	0x390233, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_150:
	mov	0x3c5, %r14
	.word 0xfadb8e80  ! 3350: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 17)
	.word 0xf485c020  ! 3352: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r26
T2_asi_reg_rd_151:
	mov	0x3c2, %r14
	.word 0xfedb8e60  ! 3353: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf6144000  ! 3354: LDUH_R	lduh	[%r17 + %r0], %r27
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x8198299a  ! 3359: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099a, %hpstate
	.word 0xfa0d20e9  ! 3363: LDUB_I	ldub	[%r20 + 0x00e9], %r29
	.word 0xf404215a  ! 3365: LDUW_I	lduw	[%r16 + 0x015a], %r26
	ta	T_CHANGE_HPRIV
	.word 0xf20ce04f  ! 3371: LDUB_I	ldub	[%r19 + 0x004f], %r25
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, 26)
	.word 0xf25de1ce  ! 3374: LDX_I	ldx	[%r23 + 0x01ce], %r25
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 0)
cpu_intr_2_280:
	setx	0x3b012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_152:
	mov	0x3c6, %r14
	.word 0xf4db89e0  ! 3377: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf805610f  ! 3378: LDUW_I	lduw	[%r21 + 0x010f], %r28
	.word 0xf6150000  ! 3379: LDUH_R	lduh	[%r20 + %r0], %r27
cpu_intr_2_281:
	setx	0x380108, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_282:
	setx	0x390309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab58000  ! 3388: SUBCcc_R	orncc 	%r22, %r0, %r29
	.word 0xfc5c4000  ! 3389: LDX_R	ldx	[%r17 + %r0], %r30
T2_asi_reg_wr_146:
	mov	0x24, %r14
	.word 0xf8f38e60  ! 3390: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T2_asi_reg_rd_153:
	mov	0x22, %r14
	.word 0xf8db8400  ! 3394: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb69cc000  ! 3397: XORcc_R	xorcc 	%r19, %r0, %r27
cpu_intr_2_283:
	setx	0x390004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf014e161  ! 3401: LDUH_I	lduh	[%r19 + 0x0161], %r24
T2_asi_reg_rd_154:
	mov	0x3c6, %r14
	.word 0xf0db84a0  ! 3402: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T2_asi_reg_wr_147:
	mov	0x3c7, %r14
	.word 0xf4f38400  ! 3403: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbd643801  ! 3404: MOVcc_I	<illegal instruction>
T2_asi_reg_rd_155:
	mov	0x14, %r14
	.word 0xf6db89e0  ! 3408: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_wr_148:
	mov	0x2f, %r14
	.word 0xfef38e40  ! 3412: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb2842008  ! 3413: ADDcc_I	addcc 	%r16, 0x0008, %r25
	.word 0xfc84e0c1  ! 3416: LDUWA_I	lduwa	[%r19, + 0x00c1] %asi, %r30
T2_asi_reg_rd_156:
	mov	0x23, %r14
	.word 0xfcdb89e0  ! 3418: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_2_284:
	setx	0x3b023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 2e)
	.word 0xb6c54000  ! 3427: ADDCcc_R	addccc 	%r21, %r0, %r27
	.word 0xfc4560d3  ! 3429: LDSW_I	ldsw	[%r21 + 0x00d3], %r30
cpu_intr_2_285:
	setx	0x3b033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_286:
	setx	0x3a030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf894215e  ! 3434: LDUHA_I	lduha	[%r16, + 0x015e] %asi, %r28
cpu_intr_2_287:
	setx	0x380317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_288:
	setx	0x3a0120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, 13)
	.word 0xf24d606b  ! 3441: LDSB_I	ldsb	[%r21 + 0x006b], %r25
T2_asi_reg_wr_149:
	mov	0x1a, %r14
	.word 0xf2f38e60  ! 3442: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_289:
	setx	0x3b0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc448000  ! 3449: LDSW_R	ldsw	[%r18 + %r0], %r30
	.word 0xf6c5c020  ! 3450: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r27
	.word 0xf6d44020  ! 3451: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r27
T2_asi_reg_wr_150:
	mov	0x29, %r14
	.word 0xfaf38e40  ! 3452: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 16)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 26)
	.word 0xf8c4a176  ! 3462: LDSWA_I	ldswa	[%r18, + 0x0176] %asi, %r28
	.word 0xf65ca0bb  ! 3463: LDX_I	ldx	[%r18 + 0x00bb], %r27
T2_asi_reg_rd_157:
	mov	0x2e, %r14
	.word 0xf8db8e60  ! 3467: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfa050000  ! 3469: LDUW_R	lduw	[%r20 + %r0], %r29
	.word 0xf8dd212c  ! 3472: LDXA_I	ldxa	[%r20, + 0x012c] %asi, %r28
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf0140000  ! 3475: LDUH_R	lduh	[%r16 + %r0], %r24
	.word 0xfe0d8000  ! 3476: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xbc3d2037  ! 3477: XNOR_I	xnor 	%r20, 0x0037, %r30
cpu_intr_2_290:
	setx	0x38033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982d50  ! 3481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d50, %hpstate
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_291:
	setx	0x3a022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_151:
	mov	0x3c0, %r14
	.word 0xf6f384a0  ! 3487: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_2_292:
	setx	0x3b033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_293:
	setx	0x3b0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe140000  ! 3493: LDUH_R	lduh	[%r16 + %r0], %r31
	.word 0xfe056103  ! 3494: LDUW_I	lduw	[%r21 + 0x0103], %r31
	.word 0xfa95a0c3  ! 3496: LDUHA_I	lduha	[%r22, + 0x00c3] %asi, %r29
	.word 0xbcad2163  ! 3499: ANDNcc_I	andncc 	%r20, 0x0163, %r30
cpu_intr_2_294:
	setx	0x390215, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f50  ! 3504: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f50, %hpstate
T2_asi_reg_rd_158:
	mov	0x2c, %r14
	.word 0xf8db8e40  ! 3505: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_295:
	setx	0x3a0325, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_296:
	setx	0x3a002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe44a072  ! 3509: ADDC_I	addc 	%r18, 0x0072, %r31
	.word 0xf494e1a4  ! 3512: LDUHA_I	lduha	[%r19, + 0x01a4] %asi, %r26
	.word 0xf25d4000  ! 3513: LDX_R	ldx	[%r21 + %r0], %r25
	.word 0xfa5d8000  ! 3514: LDX_R	ldx	[%r22 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3643801  ! 3517: MOVcc_I	<illegal instruction>
cpu_intr_2_297:
	setx	0x380130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d44020  ! 3522: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r25
	.word 0xf05d0000  ! 3525: LDX_R	ldx	[%r20 + %r0], %r24
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 22)
	.word 0xf2cd20c0  ! 3531: LDSBA_I	ldsba	[%r20, + 0x00c0] %asi, %r25
T2_asi_reg_rd_159:
	mov	0x3c5, %r14
	.word 0xfedb8e80  ! 3535: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfa556161  ! 3536: LDSH_I	ldsh	[%r21 + 0x0161], %r29
	.word 0xf60d0000  ! 3537: LDUB_R	ldub	[%r20 + %r0], %r27
	ta	T_CHANGE_TO_TL1
cpu_intr_2_298:
	setx	0x3b0128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4042040  ! 3545: LDUW_I	lduw	[%r16 + 0x0040], %r26
	.word 0xf004a069  ! 3548: LDUW_I	lduw	[%r18 + 0x0069], %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_299:
	setx	0x3a0322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 25)
cpu_intr_2_300:
	setx	0x39012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecda148  ! 3559: LDSBA_I	ldsba	[%r22, + 0x0148] %asi, %r31
	.word 0xf4dc61f1  ! 3561: LDXA_I	ldxa	[%r17, + 0x01f1] %asi, %r26
	.word 0xfeccc020  ! 3563: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r31
	.word 0xfa442001  ! 3566: LDSW_I	ldsw	[%r16 + 0x0001], %r29
T2_asi_reg_rd_160:
	mov	0x2, %r14
	.word 0xf2db8e60  ! 3567: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf4846020  ! 3572: LDUWA_I	lduwa	[%r17, + 0x0020] %asi, %r26
	.word 0xf88c0020  ! 3573: LDUBA_R	lduba	[%r16, %r0] 0x01, %r28
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 1)
	.word 0xb5343001  ! 3579: SRLX_I	srlx	%r16, 0x0001, %r26
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_wr_152:
	mov	0x3c8, %r14
	.word 0xfcf384a0  ! 3586: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 28)
	.word 0xf6ccc020  ! 3591: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r27
	.word 0xf0cd21af  ! 3592: LDSBA_I	ldsba	[%r20, + 0x01af] %asi, %r24
	.word 0xf00d2098  ! 3594: LDUB_I	ldub	[%r20 + 0x0098], %r24
	.word 0xf6442027  ! 3598: LDSW_I	ldsw	[%r16 + 0x0027], %r27
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_rd_161:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 3601: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_rd_162:
	mov	0x0, %r14
	.word 0xfedb8e60  ! 3602: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xfe054000  ! 3603: LDUW_R	lduw	[%r21 + %r0], %r31
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 0)
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_301:
	setx	0x380137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf845e0e6  ! 3613: LDSW_I	ldsw	[%r23 + 0x00e6], %r28
	.word 0xb435e145  ! 3614: SUBC_I	orn 	%r23, 0x0145, %r26
	.word 0xb52d2001  ! 3615: SLL_I	sll 	%r20, 0x0001, %r26
	.word 0xf84de0bd  ! 3616: LDSB_I	ldsb	[%r23 + 0x00bd], %r28
T2_asi_reg_wr_153:
	mov	0x22, %r14
	.word 0xfcf38e40  ! 3617: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 17)
	.word 0xfa4c8000  ! 3620: LDSB_R	ldsb	[%r18 + %r0], %r29
	.word 0xf2c48020  ! 3621: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r25
T2_asi_reg_wr_154:
	mov	0x20, %r14
	.word 0xfef384a0  ! 3623: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_2_302:
	setx	0x390227, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_303:
	setx	0x380236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1ca07f  ! 3630: XOR_I	xor 	%r18, 0x007f, %r29
T2_asi_reg_rd_163:
	mov	0x3c4, %r14
	.word 0xf2db89e0  ! 3632: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T2_asi_reg_wr_155:
	mov	0x9, %r14
	.word 0xf0f38e80  ! 3634: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T2_asi_reg_rd_164:
	mov	0x11, %r14
	.word 0xf0db8e40  ! 3636: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf20d4000  ! 3637: LDUB_R	ldub	[%r21 + %r0], %r25
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 2e)
	.word 0xb9356001  ! 3641: SRL_I	srl 	%r21, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb0944000  ! 3645: ORcc_R	orcc 	%r17, %r0, %r24
T2_asi_reg_wr_156:
	mov	0x3c7, %r14
	.word 0xf8f389e0  ! 3646: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 22)
	.word 0xfa158000  ! 3650: LDUH_R	lduh	[%r22 + %r0], %r29
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 2)
	.word 0xfa142146  ! 3652: LDUH_I	lduh	[%r16 + 0x0146], %r29
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, 20)
	.word 0xf45d4000  ! 3656: LDX_R	ldx	[%r21 + %r0], %r26
T2_asi_reg_rd_165:
	mov	0x2f, %r14
	.word 0xf4db8e40  ! 3657: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfedce1cc  ! 3658: LDXA_I	ldxa	[%r19, + 0x01cc] %asi, %r31
	.word 0xfe8d4020  ! 3661: LDUBA_R	lduba	[%r21, %r0] 0x01, %r31
	.word 0xf00de0ad  ! 3663: LDUB_I	ldub	[%r23 + 0x00ad], %r24
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 36)
	.word 0xfa4c4000  ! 3669: LDSB_R	ldsb	[%r17 + %r0], %r29
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, 13)
	.word 0xf814e11b  ! 3677: LDUH_I	lduh	[%r19 + 0x011b], %r28
cpu_intr_2_304:
	setx	0x3c0136, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, b)
	.word 0xfe5d0000  ! 3681: LDX_R	ldx	[%r20 + %r0], %r31
	.word 0xfc050000  ! 3682: LDUW_R	lduw	[%r20 + %r0], %r30
T2_asi_reg_wr_157:
	mov	0x3c0, %r14
	.word 0xf0f384a0  ! 3684: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_2_305:
	setx	0x3e011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb235c000  ! 3687: ORN_R	orn 	%r23, %r0, %r25
	.word 0xf805e1b9  ! 3690: LDUW_I	lduw	[%r23 + 0x01b9], %r28
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_306:
	setx	0x3d0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb494e12b  ! 3696: ORcc_I	orcc 	%r19, 0x012b, %r26
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_wr_158:
	mov	0x36, %r14
	.word 0xf2f38e80  ! 3698: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_307:
	setx	0x3e001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65ca1b1  ! 3707: LDX_I	ldx	[%r18 + 0x01b1], %r27
cpu_intr_2_308:
	setx	0x3c0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf214a137  ! 3710: LDUH_I	lduh	[%r18 + 0x0137], %r25
	.word 0xf245a098  ! 3712: LDSW_I	ldsw	[%r22 + 0x0098], %r25
cpu_intr_2_309:
	setx	0x3e003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_2_310:
	setx	0x3e0328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_311:
	setx	0x3f0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_166:
	mov	0x29, %r14
	.word 0xf8db8e40  ! 3721: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf844214b  ! 3726: LDSW_I	ldsw	[%r16 + 0x014b], %r28
	.word 0xf214a0d4  ! 3727: LDUH_I	lduh	[%r18 + 0x00d4], %r25
T2_asi_reg_rd_167:
	mov	0x28, %r14
	.word 0xf6db8400  ! 3728: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbc454000  ! 3735: ADDC_R	addc 	%r21, %r0, %r30
	ta	T_CHANGE_HPRIV
	.word 0xfe45617d  ! 3737: LDSW_I	ldsw	[%r21 + 0x017d], %r31
	.word 0xf8142052  ! 3739: LDUH_I	lduh	[%r16 + 0x0052], %r28
	.word 0xf64c8000  ! 3741: LDSB_R	ldsb	[%r18 + %r0], %r27
cpu_intr_2_312:
	setx	0x3f0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08d8020  ! 3743: LDUBA_R	lduba	[%r22, %r0] 0x01, %r24
	.word 0xf0cc6169  ! 3744: LDSBA_I	ldsba	[%r17, + 0x0169] %asi, %r24
T2_asi_reg_wr_159:
	mov	0x3c8, %r14
	.word 0xfef38400  ! 3745: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf284a027  ! 3746: LDUWA_I	lduwa	[%r18, + 0x0027] %asi, %r25
T2_asi_reg_wr_160:
	mov	0x2a, %r14
	.word 0xf8f384a0  ! 3747: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfe4d60e2  ! 3748: LDSB_I	ldsb	[%r21 + 0x00e2], %r31
T2_asi_reg_wr_161:
	mov	0x24, %r14
	.word 0xf8f38e40  ! 3749: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 28)
	.word 0xf84d6015  ! 3752: LDSB_I	ldsb	[%r21 + 0x0015], %r28
T2_asi_reg_wr_162:
	mov	0x3c7, %r14
	.word 0xf0f38e80  ! 3753: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf68ce00c  ! 3754: LDUBA_I	lduba	[%r19, + 0x000c] %asi, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 12)
	.word 0xf24d8000  ! 3765: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xbf34b001  ! 3766: SRLX_I	srlx	%r18, 0x0001, %r31
	.word 0xfccd8020  ! 3767: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r30
cpu_intr_2_313:
	setx	0x3e012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d42025  ! 3772: LDSHA_I	ldsha	[%r16, + 0x0025] %asi, %r27
	.word 0xf24c0000  ! 3773: LDSB_R	ldsb	[%r16 + %r0], %r25
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 39)
	.word 0xf4dda0b6  ! 3779: LDXA_I	ldxa	[%r22, + 0x00b6] %asi, %r26
T2_asi_reg_wr_163:
	mov	0xc, %r14
	.word 0xf8f38e40  ! 3780: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983b40  ! 3781: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b40, %hpstate
cpu_intr_2_314:
	setx	0x3c0035, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_168:
	mov	0x31, %r14
	.word 0xfcdb8400  ! 3784: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf08c606e  ! 3785: LDUBA_I	lduba	[%r17, + 0x006e] %asi, %r24
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 36)
	ta	T_CHANGE_HPRIV
	.word 0xf84d4000  ! 3791: LDSB_R	ldsb	[%r21 + %r0], %r28
T2_asi_reg_rd_169:
	mov	0x9, %r14
	.word 0xf8db8e80  ! 3795: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_2_315:
	setx	0x3c0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf694e09c  ! 3799: LDUHA_I	lduha	[%r19, + 0x009c] %asi, %r27
	.word 0xfa0c2097  ! 3800: LDUB_I	ldub	[%r16 + 0x0097], %r29
	.word 0xb20d61f9  ! 3804: AND_I	and 	%r21, 0x01f9, %r25
	.word 0xf04c2077  ! 3807: LDSB_I	ldsb	[%r16 + 0x0077], %r24
	.word 0xf6858020  ! 3811: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r27
	.word 0xbab520a0  ! 3812: SUBCcc_I	orncc 	%r20, 0x00a0, %r29
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 3b)
	.word 0xfe45c000  ! 3821: LDSW_R	ldsw	[%r23 + %r0], %r31
	.word 0xf084c020  ! 3822: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r24
	.word 0xfe0c0000  ! 3826: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0xb28421d0  ! 3827: ADDcc_I	addcc 	%r16, 0x01d0, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbe9dc000  ! 3829: XORcc_R	xorcc 	%r23, %r0, %r31
	.word 0xfed5e12b  ! 3830: LDSHA_I	ldsha	[%r23, + 0x012b] %asi, %r31
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 34)
	.word 0xf0dd2113  ! 3834: LDXA_I	ldxa	[%r20, + 0x0113] %asi, %r24
	.word 0xfe8c20b4  ! 3835: LDUBA_I	lduba	[%r16, + 0x00b4] %asi, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_170:
	mov	0x3c5, %r14
	.word 0xf2db8400  ! 3839: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf8152131  ! 3844: LDUH_I	lduh	[%r20 + 0x0131], %r28
	.word 0xf8948020  ! 3850: LDUHA_R	lduha	[%r18, %r0] 0x01, %r28
	.word 0xfe4ce165  ! 3855: LDSB_I	ldsb	[%r19 + 0x0165], %r31
	.word 0xb8b58000  ! 3856: ORNcc_R	orncc 	%r22, %r0, %r28
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_164:
	mov	0xd, %r14
	.word 0xfef384a0  ! 3859: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_2_316:
	setx	0x3d0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecce1be  ! 3862: LDSBA_I	ldsba	[%r19, + 0x01be] %asi, %r31
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 39)
	.word 0xb2b4614e  ! 3866: SUBCcc_I	orncc 	%r17, 0x014e, %r25
	.word 0xf0cda014  ! 3867: LDSBA_I	ldsba	[%r22, + 0x0014] %asi, %r24
	.word 0xf695e103  ! 3874: LDUHA_I	lduha	[%r23, + 0x0103] %asi, %r27
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf25c206d  ! 3882: LDX_I	ldx	[%r16 + 0x006d], %r25
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 5)
	.word 0xfc5ce0e4  ! 3888: LDX_I	ldx	[%r19 + 0x00e4], %r30
	.word 0xf2cc0020  ! 3891: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r25
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983ed2  ! 3893: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed2, %hpstate
	.word 0xb80d2126  ! 3894: AND_I	and 	%r20, 0x0126, %r28
	.word 0xf0dd2118  ! 3896: LDXA_I	ldxa	[%r20, + 0x0118] %asi, %r24
cpu_intr_2_317:
	setx	0x3d022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb54000  ! 3898: ORNcc_R	orncc 	%r21, %r0, %r30
cpu_intr_2_318:
	setx	0x3f022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b420f0  ! 3900: ORNcc_I	orncc 	%r16, 0x00f0, %r26
	.word 0xbea4a199  ! 3901: SUBcc_I	subcc 	%r18, 0x0199, %r31
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_rd_171:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 3911: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf6cc60eb  ! 3912: LDSBA_I	ldsba	[%r17, + 0x00eb] %asi, %r27
	.word 0xb6aca170  ! 3915: ANDNcc_I	andncc 	%r18, 0x0170, %r27
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_wr_165:
	mov	0x2c, %r14
	.word 0xfef38400  ! 3921: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf0142008  ! 3923: LDUH_I	lduh	[%r16 + 0x0008], %r24
	.word 0xf015a09c  ! 3926: LDUH_I	lduh	[%r22 + 0x009c], %r24
	.word 0xfadca162  ! 3927: LDXA_I	ldxa	[%r18, + 0x0162] %asi, %r29
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, d)
	.word 0xfa04a15f  ! 3929: LDUW_I	lduw	[%r18 + 0x015f], %r29
	.word 0xf014c000  ! 3930: LDUH_R	lduh	[%r19 + %r0], %r24
	.word 0xf6dc203d  ! 3932: LDXA_I	ldxa	[%r16, + 0x003d] %asi, %r27
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 25)
	.word 0xf08cc020  ! 3936: LDUBA_R	lduba	[%r19, %r0] 0x01, %r24
T2_asi_reg_wr_166:
	mov	0x1e, %r14
	.word 0xfcf384a0  ! 3938: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf25d61d9  ! 3939: LDX_I	ldx	[%r21 + 0x01d9], %r25
	.word 0xb635c000  ! 3940: ORN_R	orn 	%r23, %r0, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xfc0da17d  ! 3944: LDUB_I	ldub	[%r22 + 0x017d], %r30
cpu_intr_2_319:
	setx	0x3d0233, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_167:
	mov	0x16, %r14
	.word 0xf4f38e40  ! 3949: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982e92  ! 3951: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e92, %hpstate
	.word 0xf84c4000  ! 3959: LDSB_R	ldsb	[%r17 + %r0], %r28
	ta	T_CHANGE_HPRIV
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 7)
	.word 0xf015e00f  ! 3964: LDUH_I	lduh	[%r23 + 0x000f], %r24
	.word 0xf8cd0020  ! 3966: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r28
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983b10  ! 3973: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b10, %hpstate
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf4150000  ! 3977: LDUH_R	lduh	[%r20 + %r0], %r26
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_320:
	setx	0x3e0315, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_172:
	mov	0x10, %r14
	.word 0xfcdb84a0  ! 3981: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 0)
	.word 0xfecd8020  ! 3985: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r31
cpu_intr_2_321:
	setx	0x3c0133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 23)
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 3c)
T2_asi_reg_wr_168:
	mov	0x3c3, %r14
	.word 0xfef384a0  ! 3995: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_169:
	mov	0x1d, %r14
	.word 0xf0f384a0  ! 4000: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xba3da118  ! 4002: XNOR_I	xnor 	%r22, 0x0118, %r29
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 33)
	.word 0xfe5d8000  ! 4004: LDX_R	ldx	[%r22 + %r0], %r31
	.word 0xb08d6180  ! 4006: ANDcc_I	andcc 	%r21, 0x0180, %r24
	.word 0xf815e18d  ! 4007: LDUH_I	lduh	[%r23 + 0x018d], %r28
	.word 0xb89d8000  ! 4008: XORcc_R	xorcc 	%r22, %r0, %r28
T2_asi_reg_wr_170:
	mov	0x28, %r14
	.word 0xf2f38e60  ! 4009: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_322:
	setx	0x3c0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6ac4000  ! 4012: ANDNcc_R	andncc 	%r17, %r0, %r27
cpu_intr_2_323:
	setx	0x3f002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_173:
	mov	0x24, %r14
	.word 0xf6db89e0  ! 4015: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0x85952197  ! 4019: WRPR_TSTATE_I	wrpr	%r20, 0x0197, %tstate
	.word 0xf6dd2046  ! 4023: LDXA_I	ldxa	[%r20, + 0x0046] %asi, %r27
	.word 0xf8c4a169  ! 4025: LDSWA_I	ldswa	[%r18, + 0x0169] %asi, %r28
	.word 0xf4542149  ! 4029: LDSH_I	ldsh	[%r16 + 0x0149], %r26
	.word 0xf61521b6  ! 4037: LDUH_I	lduh	[%r20 + 0x01b6], %r27
cpu_intr_2_324:
	setx	0x3d0114, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_171:
	mov	0x14, %r14
	.word 0xf4f38e40  ! 4039: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_wr_172:
	mov	0xd, %r14
	.word 0xf0f389e0  ! 4043: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xfec52006  ! 4044: LDSWA_I	ldswa	[%r20, + 0x0006] %asi, %r31
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 31)
T2_asi_reg_rd_174:
	mov	0x1d, %r14
	.word 0xf8db8e60  ! 4048: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf28ce1c9  ! 4050: LDUBA_I	lduba	[%r19, + 0x01c9] %asi, %r25
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 1a)
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_wr_173:
	mov	0x21, %r14
	.word 0xfef38e40  ! 4054: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_wr_174:
	mov	0x11, %r14
	.word 0xf4f38e40  ! 4055: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_rd_175:
	mov	0x8, %r14
	.word 0xf4db8e40  ! 4056: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb285c000  ! 4061: ADDcc_R	addcc 	%r23, %r0, %r25
cpu_intr_2_325:
	setx	0x3c031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_175:
	mov	0x3c0, %r14
	.word 0xfaf384a0  ! 4067: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 4)
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_326:
	setx	0x3e0136, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_176:
	mov	0x12, %r14
	.word 0xfcdb8e40  ! 4073: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfed58020  ! 4074: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r31
	.word 0xf2050000  ! 4076: LDUW_R	lduw	[%r20 + %r0], %r25
T2_asi_reg_rd_177:
	mov	0x1f, %r14
	.word 0xfadb8400  ! 4078: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf045c000  ! 4080: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xfecd4020  ! 4081: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r31
cpu_intr_2_327:
	setx	0x3f0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc550000  ! 4084: LDSH_R	ldsh	[%r20 + %r0], %r30
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, 12)
cpu_intr_2_328:
	setx	0x3f0213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_329:
	setx	0x3d0330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_330:
	setx	0x3e0111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_wr_176:
	mov	0x17, %r14
	.word 0xf8f38e80  ! 4103: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_2_331:
	setx	0x3f0232, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_178:
	mov	0x31, %r14
	.word 0xfcdb8e60  ! 4107: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	ta	T_CHANGE_TO_TL0
	.word 0xbe250000  ! 4109: SUB_R	sub 	%r20, %r0, %r31
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf654a0e9  ! 4113: LDSH_I	ldsh	[%r18 + 0x00e9], %r27
T2_asi_reg_wr_177:
	mov	0x3c4, %r14
	.word 0xf6f389e0  ! 4114: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf05cc000  ! 4115: LDX_R	ldx	[%r19 + %r0], %r24
	.word 0xf245e09c  ! 4116: LDSW_I	ldsw	[%r23 + 0x009c], %r25
cpu_intr_2_332:
	setx	0x410119, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_178:
	mov	0x18, %r14
	.word 0xfef38e80  ! 4118: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T2_asi_reg_wr_179:
	mov	0x15, %r14
	.word 0xf4f38e60  ! 4119: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_2_333:
	setx	0x43001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_334:
	setx	0x43031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8dc000  ! 4129: ANDcc_R	andcc 	%r23, %r0, %r30
	.word 0xf2954020  ! 4130: LDUHA_R	lduha	[%r21, %r0] 0x01, %r25
cpu_intr_2_335:
	setx	0x42011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_179:
	mov	0x20, %r14
	.word 0xf0db8400  ! 4132: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbd341000  ! 4133: SRLX_R	srlx	%r16, %r0, %r30
	.word 0xb5500000  ! 4134: RDPR_TPC	<illegal instruction>
cpu_intr_2_336:
	setx	0x430035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_337:
	setx	0x43031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c48020  ! 4138: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r28
cpu_intr_2_338:
	setx	0x410202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_339:
	setx	0x410328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc55c000  ! 4147: LDSH_R	ldsh	[%r23 + %r0], %r30
	.word 0xb01c4000  ! 4149: XOR_R	xor 	%r17, %r0, %r24
	.word 0xfc45c000  ! 4150: LDSW_R	ldsw	[%r23 + %r0], %r30
T2_asi_reg_rd_180:
	mov	0x13, %r14
	.word 0xfedb8400  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_wr_180:
	mov	0x14, %r14
	.word 0xf8f38e60  ! 4159: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T2_asi_reg_rd_181:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 4160: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_181:
	mov	0x3c6, %r14
	.word 0xf6f38e60  ! 4161: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfe050000  ! 4163: LDUW_R	lduw	[%r20 + %r0], %r31
cpu_intr_2_340:
	setx	0x400008, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, 19)
	.word 0xf055e089  ! 4171: LDSH_I	ldsh	[%r23 + 0x0089], %r24
cpu_intr_2_341:
	setx	0x42022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1352001  ! 4175: SRL_I	srl 	%r20, 0x0001, %r24
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 1f)
	.word 0xba2de0c7  ! 4178: ANDN_I	andn 	%r23, 0x00c7, %r29
	.word 0xfa840020  ! 4179: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
	.word 0xfe44a0fd  ! 4181: LDSW_I	ldsw	[%r18 + 0x00fd], %r31
cpu_intr_2_342:
	setx	0x400316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88460d7  ! 4183: LDUWA_I	lduwa	[%r17, + 0x00d7] %asi, %r28
	.word 0xf084a166  ! 4185: LDUWA_I	lduwa	[%r18, + 0x0166] %asi, %r24
cpu_intr_2_343:
	setx	0x40010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68d8020  ! 4187: LDUBA_R	lduba	[%r22, %r0] 0x01, %r27
	.word 0xbc84a16c  ! 4188: ADDcc_I	addcc 	%r18, 0x016c, %r30
cpu_intr_2_344:
	setx	0x43032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6556091  ! 4192: LDSH_I	ldsh	[%r21 + 0x0091], %r27
	.word 0xf015a1fa  ! 4193: LDUH_I	lduh	[%r22 + 0x01fa], %r24
	.word 0xf0540000  ! 4194: LDSH_R	ldsh	[%r16 + %r0], %r24
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f48  ! 4197: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f48, %hpstate
	.word 0xfe0d2076  ! 4198: LDUB_I	ldub	[%r20 + 0x0076], %r31
	ta	T_CHANGE_HPRIV
	.word 0xf6942115  ! 4202: LDUHA_I	lduha	[%r16, + 0x0115] %asi, %r27
	.word 0xbe148000  ! 4204: OR_R	or 	%r18, %r0, %r31
	.word 0xf6848020  ! 4209: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r27
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_rd_182:
	mov	0x13, %r14
	.word 0xfcdb8e40  ! 4213: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf6dd20e4  ! 4214: LDXA_I	ldxa	[%r20, + 0x00e4] %asi, %r27
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, 35)
	.word 0xf2d50020  ! 4221: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r25
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 29)
cpu_intr_2_345:
	setx	0x400310, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_346:
	setx	0x40030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_347:
	setx	0x42003c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf6550000  ! 4234: LDSH_R	ldsh	[%r20 + %r0], %r27
	.word 0xfe05a1cd  ! 4236: LDUW_I	lduw	[%r22 + 0x01cd], %r31
cpu_intr_2_348:
	setx	0x410337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 31)
	.word 0xfa448000  ! 4240: LDSW_R	ldsw	[%r18 + %r0], %r29
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 2)
	.word 0xf6454000  ! 4242: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xfc8c60ad  ! 4243: LDUBA_I	lduba	[%r17, + 0x00ad] %asi, %r30
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 26)
	.word 0xfc554000  ! 4246: LDSH_R	ldsh	[%r21 + %r0], %r30
	.word 0xbd500000  ! 4248: RDPR_TPC	<illegal instruction>
T2_asi_reg_wr_182:
	mov	0x32, %r14
	.word 0xfaf389e0  ! 4249: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_2_349:
	setx	0x40032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf684a033  ! 4255: LDUWA_I	lduwa	[%r18, + 0x0033] %asi, %r27
	ta	T_CHANGE_TO_TL0
	.word 0xfc4c4000  ! 4259: LDSB_R	ldsb	[%r17 + %r0], %r30
T2_asi_reg_rd_183:
	mov	0x6, %r14
	.word 0xf4db8400  ! 4260: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T2_asi_reg_rd_184:
	mov	0x3c0, %r14
	.word 0xfadb8e80  ! 4261: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_350:
	setx	0x43033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_183:
	mov	0x3c8, %r14
	.word 0xf6f38e80  ! 4266: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfa050000  ! 4268: LDUW_R	lduw	[%r20 + %r0], %r29
	.word 0xb2358000  ! 4272: ORN_R	orn 	%r22, %r0, %r25
cpu_intr_2_351:
	setx	0x430123, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982f82  ! 4275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f82, %hpstate
T2_asi_reg_rd_185:
	mov	0x3c5, %r14
	.word 0xf6db89e0  ! 4277: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T2_asi_reg_rd_186:
	mov	0x22, %r14
	.word 0xf4db8400  ! 4280: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_2_352:
	setx	0x430010, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_353:
	setx	0x400326, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_2_354:
	setx	0x40030b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_355:
	setx	0x400031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c56124  ! 4295: LDSWA_I	ldswa	[%r21, + 0x0124] %asi, %r24
	.word 0xf295201b  ! 4298: LDUHA_I	lduha	[%r20, + 0x001b] %asi, %r25
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 25)
	.word 0xfe844020  ! 4306: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r31
cpu_intr_2_356:
	setx	0x40021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe54e0aa  ! 4310: LDSH_I	ldsh	[%r19 + 0x00aa], %r31
	.word 0xf8cd0020  ! 4311: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r28
	.word 0xb1641800  ! 4316: MOVcc_R	<illegal instruction>
	.word 0xfa5d8000  ! 4318: LDX_R	ldx	[%r22 + %r0], %r29
	.word 0xfa5561e5  ! 4319: LDSH_I	ldsh	[%r21 + 0x01e5], %r29
cpu_intr_2_357:
	setx	0x430020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8d0020  ! 4327: LDUBA_R	lduba	[%r20, %r0] 0x01, %r30
	.word 0xb02c213d  ! 4331: ANDN_I	andn 	%r16, 0x013d, %r24
T2_asi_reg_wr_184:
	mov	0x18, %r14
	.word 0xf8f38e40  ! 4335: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf294a113  ! 4337: LDUHA_I	lduha	[%r18, + 0x0113] %asi, %r25
	.word 0xfc95e004  ! 4339: LDUHA_I	lduha	[%r23, + 0x0004] %asi, %r30
	.word 0xf8d5c020  ! 4340: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r28
T2_asi_reg_wr_185:
	mov	0x35, %r14
	.word 0xf6f38400  ! 4344: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_358:
	setx	0x410204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65d4000  ! 4351: LDX_R	ldx	[%r21 + %r0], %r27
T2_asi_reg_wr_186:
	mov	0x3c7, %r14
	.word 0xf2f38e60  ! 4352: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfccda006  ! 4355: LDSBA_I	ldsba	[%r22, + 0x0006] %asi, %r30
T2_asi_reg_rd_187:
	mov	0x3c3, %r14
	.word 0xfadb89e0  ! 4356: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_2_359:
	setx	0x400207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_360:
	setx	0x430320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_361:
	setx	0x410108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcdde0ff  ! 4360: LDXA_I	ldxa	[%r23, + 0x00ff] %asi, %r30
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 0)
	.word 0xb4bca1d7  ! 4362: XNORcc_I	xnorcc 	%r18, 0x01d7, %r26
	.word 0xf894e0a5  ! 4363: LDUHA_I	lduha	[%r19, + 0x00a5] %asi, %r28
	.word 0xf28c2046  ! 4364: LDUBA_I	lduba	[%r16, + 0x0046] %asi, %r25
	.word 0xfa4cc000  ! 4365: LDSB_R	ldsb	[%r19 + %r0], %r29
	.word 0xf0948020  ! 4370: LDUHA_R	lduha	[%r18, %r0] 0x01, %r24
cpu_intr_2_362:
	setx	0x43023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_188:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 4375: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_rd_189:
	mov	0x10, %r14
	.word 0xf0db8400  ! 4377: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf60de1bb  ! 4378: LDUB_I	ldub	[%r23 + 0x01bb], %r27
	.word 0xf0c40020  ! 4380: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r24
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 2e)
	.word 0xbd3d5000  ! 4384: SRAX_R	srax	%r21, %r0, %r30
	.word 0xf45dc000  ! 4385: LDX_R	ldx	[%r23 + %r0], %r26
cpu_intr_2_363:
	setx	0x430117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_364:
	setx	0x420122, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_190:
	mov	0x19, %r14
	.word 0xf6db8e80  ! 4389: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf41421ce  ! 4394: LDUH_I	lduh	[%r16 + 0x01ce], %r26
	.word 0xf0cce03b  ! 4397: LDSBA_I	ldsba	[%r19, + 0x003b] %asi, %r24
	.word 0xfe058000  ! 4398: LDUW_R	lduw	[%r22 + %r0], %r31
	ta	T_CHANGE_TO_TL0
cpu_intr_2_365:
	setx	0x43011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcdce072  ! 4403: LDXA_I	ldxa	[%r19, + 0x0072] %asi, %r30
cpu_intr_2_366:
	setx	0x43020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85ce194  ! 4412: LDX_I	ldx	[%r19 + 0x0194], %r28
	.word 0xbb50c000  ! 4414: RDPR_TT	rdpr	%tt, %r29
cpu_intr_2_367:
	setx	0x400324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_368:
	setx	0x410210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 11)
	ta	T_CHANGE_TO_TL1
	.word 0xf6054000  ! 4422: LDUW_R	lduw	[%r21 + %r0], %r27
cpu_intr_2_369:
	setx	0x430112, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_370:
	setx	0x430332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe148000  ! 4435: LDUH_R	lduh	[%r18 + %r0], %r31
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_187:
	mov	0x6, %r14
	.word 0xf0f389e0  ! 4439: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf2cd0020  ! 4443: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r25
	.word 0xbd2dc000  ! 4445: SLL_R	sll 	%r23, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf65ce052  ! 4450: LDX_I	ldx	[%r19 + 0x0052], %r27
	.word 0xfc4ca13d  ! 4452: LDSB_I	ldsb	[%r18 + 0x013d], %r30
T2_asi_reg_rd_191:
	mov	0x3c7, %r14
	.word 0xfedb8400  ! 4454: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb7641800  ! 4455: MOVcc_R	<illegal instruction>
cpu_intr_2_371:
	setx	0x400330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_372:
	setx	0x42010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4dc000  ! 4458: LDSB_R	ldsb	[%r23 + %r0], %r29
	.word 0xb0a5e026  ! 4460: SUBcc_I	subcc 	%r23, 0x0026, %r24
	.word 0xf6c4e162  ! 4462: LDSWA_I	ldswa	[%r19, + 0x0162] %asi, %r27
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 9)
	ta	T_CHANGE_TO_TL0
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983802  ! 4467: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1802, %hpstate
	.word 0xf48dc020  ! 4473: LDUBA_R	lduba	[%r23, %r0] 0x01, %r26
T2_asi_reg_wr_188:
	mov	0x1f, %r14
	.word 0xf0f384a0  ! 4475: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb635e0e8  ! 4477: ORN_I	orn 	%r23, 0x00e8, %r27
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, 3)
	.word 0xfa550000  ! 4479: LDSH_R	ldsh	[%r20 + %r0], %r29
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_373:
	setx	0x43010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_189:
	mov	0x36, %r14
	.word 0xf2f38e40  ! 4486: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb6244000  ! 4487: SUB_R	sub 	%r17, %r0, %r27
	.word 0xf20c6035  ! 4489: LDUB_I	ldub	[%r17 + 0x0035], %r25
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_190:
	mov	0x37, %r14
	.word 0xfaf38e60  ! 4491: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_2_374:
	setx	0x42012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf204e06e  ! 4493: LDUW_I	lduw	[%r19 + 0x006e], %r25
T2_asi_reg_wr_191:
	mov	0x2d, %r14
	.word 0xf4f38e40  ! 4494: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_375:
	setx	0x400313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4144000  ! 4498: LDUH_R	lduh	[%r17 + %r0], %r26
cpu_intr_2_376:
	setx	0x40021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_377:
	setx	0x430100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, a)
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_378:
	setx	0x410203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6444000  ! 4514: LDSW_R	ldsw	[%r17 + %r0], %r27
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, 23)
	.word 0xf4dce140  ! 4516: LDXA_I	ldxa	[%r19, + 0x0140] %asi, %r26
cpu_intr_2_379:
	setx	0x420215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb444214f  ! 4523: ADDC_I	addc 	%r16, 0x014f, %r26
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, 2)
	.word 0xbca5a0ee  ! 4526: SUBcc_I	subcc 	%r22, 0x00ee, %r30
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819829d0  ! 4532: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d0, %hpstate
	.word 0xfa154000  ! 4537: LDUH_R	lduh	[%r21 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf05c219d  ! 4541: LDX_I	ldx	[%r16 + 0x019d], %r24
cpu_intr_2_380:
	setx	0x410337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6050000  ! 4543: ADD_R	add 	%r20, %r0, %r27
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, 1f)
T2_asi_reg_rd_192:
	mov	0x3c3, %r14
	.word 0xfadb8400  ! 4545: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf844214e  ! 4546: LDSW_I	ldsw	[%r16 + 0x014e], %r28
	ta	T_CHANGE_TO_TL0
	.word 0xf8050000  ! 4549: LDUW_R	lduw	[%r20 + %r0], %r28
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 26)
	.word 0xf0dd6181  ! 4552: LDXA_I	ldxa	[%r21, + 0x0181] %asi, %r24
T2_asi_reg_wr_192:
	mov	0xa, %r14
	.word 0xfaf38e40  ! 4553: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfa44c000  ! 4558: LDSW_R	ldsw	[%r19 + %r0], %r29
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982940  ! 4560: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0940, %hpstate
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_wr_193:
	mov	0x27, %r14
	.word 0xf6f38400  ! 4564: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_2_381:
	setx	0x43022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_193:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 4566: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_382:
	setx	0x430135, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_383:
	setx	0x410114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_384:
	setx	0x430202, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_194:
	mov	0x26, %r14
	.word 0xfcf38e60  ! 4574: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xfec54020  ! 4575: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r31
T2_asi_reg_rd_194:
	mov	0x18, %r14
	.word 0xf6db8e80  ! 4576: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_2_385:
	setx	0x410113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb80cc000  ! 4578: AND_R	and 	%r19, %r0, %r28
	.word 0xf25c6160  ! 4579: LDX_I	ldx	[%r17 + 0x0160], %r25
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 13)
	.word 0xfa5c8000  ! 4582: LDX_R	ldx	[%r18 + %r0], %r29
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, 1e)
	.word 0xbd3ce001  ! 4585: SRA_I	sra 	%r19, 0x0001, %r30
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 3)
	.word 0xb4bde0f3  ! 4588: XNORcc_I	xnorcc 	%r23, 0x00f3, %r26
	.word 0xf2540000  ! 4589: LDSH_R	ldsh	[%r16 + %r0], %r25
T2_asi_reg_rd_195:
	mov	0x33, %r14
	.word 0xf2db8e40  ! 4592: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfed521f4  ! 4594: LDSHA_I	ldsha	[%r20, + 0x01f4] %asi, %r31
cpu_intr_2_386:
	setx	0x43032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2da1a4  ! 4598: ANDN_I	andn 	%r22, 0x01a4, %r31
T2_asi_reg_wr_195:
	mov	0x1f, %r14
	.word 0xf4f38e40  ! 4599: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 3c)
T2_asi_reg_rd_196:
	mov	0x21, %r14
	.word 0xf4db8e40  ! 4603: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_rd_197:
	mov	0x3c5, %r14
	.word 0xf2db89e0  ! 4607: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_2_387:
	setx	0x460134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_388:
	setx	0x450034, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_rd_198:
	mov	0x22, %r14
	.word 0xf2db8e60  ! 4617: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb6956129  ! 4626: ORcc_I	orcc 	%r21, 0x0129, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xfad5a09d  ! 4631: LDSHA_I	ldsha	[%r22, + 0x009d] %asi, %r29
T2_asi_reg_wr_196:
	mov	0x3c1, %r14
	.word 0xf8f389e0  ! 4636: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T2_asi_reg_rd_199:
	mov	0x2b, %r14
	.word 0xf2db8e40  ! 4639: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_TO_TL0
	.word 0xf4c46069  ! 4646: LDSWA_I	ldswa	[%r17, + 0x0069] %asi, %r26
	.word 0xf4440000  ! 4648: LDSW_R	ldsw	[%r16 + %r0], %r26
	.word 0xf4544000  ! 4650: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xb8bd4000  ! 4651: XNORcc_R	xnorcc 	%r21, %r0, %r28
	.word 0xf6cca117  ! 4652: LDSBA_I	ldsba	[%r18, + 0x0117] %asi, %r27
	.word 0xf84dc000  ! 4653: LDSB_R	ldsb	[%r23 + %r0], %r28
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 30)
cpu_intr_2_389:
	setx	0x440214, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_197:
	mov	0x1, %r14
	.word 0xf0f38e80  ! 4656: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb834200f  ! 4658: ORN_I	orn 	%r16, 0x000f, %r28
cpu_intr_2_390:
	setx	0x450037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, d)
	ta	T_CHANGE_TO_TL1
	.word 0xf4050000  ! 4665: LDUW_R	lduw	[%r20 + %r0], %r26
cpu_intr_2_391:
	setx	0x45012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_200:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 4671: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf84d4000  ! 4672: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xf89460dd  ! 4675: LDUHA_I	lduha	[%r17, + 0x00dd] %asi, %r28
T2_asi_reg_rd_201:
	mov	0x33, %r14
	.word 0xf8db8e60  ! 4678: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_2_392:
	setx	0x470238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0c0000  ! 4686: LDUB_R	ldub	[%r16 + %r0], %r30
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_393:
	setx	0x470034, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_202:
	mov	0xd, %r14
	.word 0xf0db8e40  ! 4693: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_394:
	setx	0x470316, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfa4d219b  ! 4701: LDSB_I	ldsb	[%r20 + 0x019b], %r29
	.word 0xfa5c20ba  ! 4705: LDX_I	ldx	[%r16 + 0x00ba], %r29
	.word 0xfcd54020  ! 4706: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r30
T2_asi_reg_rd_203:
	mov	0x3c1, %r14
	.word 0xfadb8e80  ! 4709: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf0d4a0c9  ! 4714: LDSHA_I	ldsha	[%r18, + 0x00c9] %asi, %r24
	.word 0xfe54c000  ! 4715: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xf645618b  ! 4716: LDSW_I	ldsw	[%r21 + 0x018b], %r27
	.word 0xfc44c000  ! 4721: LDSW_R	ldsw	[%r19 + %r0], %r30
cpu_intr_2_395:
	setx	0x47011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf40d2177  ! 4730: LDUB_I	ldub	[%r20 + 0x0177], %r26
	.word 0xfe4d0000  ! 4731: LDSB_R	ldsb	[%r20 + %r0], %r31
cpu_intr_2_396:
	setx	0x47021f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 11)
	.word 0xb6b40000  ! 4734: ORNcc_R	orncc 	%r16, %r0, %r27
	.word 0xf28ca14d  ! 4736: LDUBA_I	lduba	[%r18, + 0x014d] %asi, %r25
	.word 0xf85d2041  ! 4737: LDX_I	ldx	[%r20 + 0x0041], %r28
	.word 0xf85d2053  ! 4739: LDX_I	ldx	[%r20 + 0x0053], %r28
	.word 0xfad52026  ! 4744: LDSHA_I	ldsha	[%r20, + 0x0026] %asi, %r29
	.word 0xfec56034  ! 4745: LDSWA_I	ldswa	[%r21, + 0x0034] %asi, %r31
	ta	T_CHANGE_TO_TL0
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_wr_198:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 4752: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf284e009  ! 4755: LDUWA_I	lduwa	[%r19, + 0x0009] %asi, %r25
cpu_intr_2_397:
	setx	0x460331, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_204:
	mov	0x26, %r14
	.word 0xfcdb8e80  ! 4758: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf4c4e019  ! 4762: LDSWA_I	ldswa	[%r19, + 0x0019] %asi, %r26
	.word 0xb694e12e  ! 4763: ORcc_I	orcc 	%r19, 0x012e, %r27
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, 22)
	.word 0xa1902001  ! 4765: WRPR_GL_I	wrpr	%r0, 0x0001, %-
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_rd_205:
	mov	0x12, %r14
	.word 0xf8db84a0  ! 4768: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_398:
	setx	0x440304, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_206:
	mov	0x3c3, %r14
	.word 0xf6db89e0  ! 4773: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf8c4201d  ! 4774: LDSWA_I	ldswa	[%r16, + 0x001d] %asi, %r28
	.word 0xf845a04b  ! 4776: LDSW_I	ldsw	[%r22 + 0x004b], %r28
cpu_intr_2_399:
	setx	0x47011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4dce1ed  ! 4779: LDXA_I	ldxa	[%r19, + 0x01ed] %asi, %r26
	.word 0xf0c5e0be  ! 4780: LDSWA_I	ldswa	[%r23, + 0x00be] %asi, %r24
	.word 0xf455e0a1  ! 4782: LDSH_I	ldsh	[%r23 + 0x00a1], %r26
cpu_intr_2_400:
	setx	0x470126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf254a0d6  ! 4784: LDSH_I	ldsh	[%r18 + 0x00d6], %r25
	.word 0xfe0d20a2  ! 4785: LDUB_I	ldub	[%r20 + 0x00a2], %r31
T2_asi_reg_wr_199:
	mov	0x1c, %r14
	.word 0xfaf38e80  ! 4790: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_401:
	setx	0x460118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5c8000  ! 4794: LDX_R	ldx	[%r18 + %r0], %r30
	.word 0xfe8d2134  ! 4796: LDUBA_I	lduba	[%r20, + 0x0134] %asi, %r31
T2_asi_reg_wr_200:
	mov	0x21, %r14
	.word 0xfaf38e40  ! 4801: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_wr_201:
	mov	0x35, %r14
	.word 0xf6f384a0  ! 4802: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf414a09d  ! 4807: LDUH_I	lduh	[%r18 + 0x009d], %r26
T2_asi_reg_wr_202:
	mov	0x34, %r14
	.word 0xf8f38e80  ! 4808: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 17)
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983c52  ! 4810: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c52, %hpstate
	.word 0xf85d4000  ! 4812: LDX_R	ldx	[%r21 + %r0], %r28
	.word 0xfed42089  ! 4813: LDSHA_I	ldsha	[%r16, + 0x0089] %asi, %r31
	.word 0xf2058000  ! 4818: LDUW_R	lduw	[%r22 + %r0], %r25
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_402:
	setx	0x47022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 39)
	.word 0xfa0c0000  ! 4831: LDUB_R	ldub	[%r16 + %r0], %r29
	.word 0xf65cc000  ! 4833: LDX_R	ldx	[%r19 + %r0], %r27
T2_asi_reg_wr_203:
	mov	0x3c1, %r14
	.word 0xfef38e80  ! 4834: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf4558000  ! 4835: LDSH_R	ldsh	[%r22 + %r0], %r26
T2_asi_reg_wr_204:
	mov	0x36, %r14
	.word 0xfef38e40  ! 4836: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfa456158  ! 4837: LDSW_I	ldsw	[%r21 + 0x0158], %r29
	ta	T_CHANGE_HPRIV
	.word 0xf44d0000  ! 4839: LDSB_R	ldsb	[%r20 + %r0], %r26
T2_asi_reg_wr_205:
	mov	0x3c1, %r14
	.word 0xf8f389e0  ! 4841: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbc85e0ee  ! 4842: ADDcc_I	addcc 	%r23, 0x00ee, %r30
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_wr_206:
	mov	0x9, %r14
	.word 0xfcf38e60  ! 4847: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_rd_207:
	mov	0x22, %r14
	.word 0xf6db8400  ! 4851: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_2_403:
	setx	0x460121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, 22)
	.word 0xfcd54020  ! 4859: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r30
	.word 0xf64460f0  ! 4860: LDSW_I	ldsw	[%r17 + 0x00f0], %r27
T2_asi_reg_wr_207:
	mov	0x6, %r14
	.word 0xfcf38e80  ! 4861: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xfa546062  ! 4865: LDSH_I	ldsh	[%r17 + 0x0062], %r29
	ta	T_CHANGE_TO_TL1
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, c)
	.word 0xf80d4000  ! 4875: LDUB_R	ldub	[%r21 + %r0], %r28
	.word 0xf0cde151  ! 4877: LDSBA_I	ldsba	[%r23, + 0x0151] %asi, %r24
	.word 0xfe954020  ! 4878: LDUHA_R	lduha	[%r21, %r0] 0x01, %r31
T2_asi_reg_rd_208:
	mov	0x2c, %r14
	.word 0xf8db84a0  ! 4881: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, 3e)
	.word 0xb1643801  ! 4884: MOVcc_I	<illegal instruction>
T2_asi_reg_rd_209:
	mov	0x8, %r14
	.word 0xf4db8e40  ! 4891: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_404:
	setx	0x460323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_405:
	setx	0x46003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_406:
	setx	0x440136, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, 31)
	.word 0xb2a58000  ! 4899: SUBcc_R	subcc 	%r22, %r0, %r25
	ta	T_CHANGE_HPRIV
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982848  ! 4911: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0848, %hpstate
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, 21)
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819839c8  ! 4915: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c8, %hpstate
	.word 0xf84cc000  ! 4917: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xf845208a  ! 4919: LDSW_I	ldsw	[%r20 + 0x008a], %r28
	.word 0xf495e07c  ! 4920: LDUHA_I	lduha	[%r23, + 0x007c] %asi, %r26
T2_asi_reg_rd_210:
	mov	0x3c2, %r14
	.word 0xfedb8400  ! 4922: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_2_407:
	setx	0x460135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4044000  ! 4925: LDUW_R	lduw	[%r17 + %r0], %r26
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, 15)
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983e02  ! 4928: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e02, %hpstate
	.word 0xfec420f0  ! 4931: LDSWA_I	ldswa	[%r16, + 0x00f0] %asi, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf4842144  ! 4933: LDUWA_I	lduwa	[%r16, + 0x0144] %asi, %r26
	.word 0xb6942134  ! 4935: ORcc_I	orcc 	%r16, 0x0134, %r27
	.word 0xf4c5e0f7  ! 4937: LDSWA_I	ldswa	[%r23, + 0x00f7] %asi, %r26
	.word 0xf29520bd  ! 4939: LDUHA_I	lduha	[%r20, + 0x00bd] %asi, %r25
	.word 0xf04d615b  ! 4940: LDSB_I	ldsb	[%r21 + 0x015b], %r24
cpu_intr_2_408:
	setx	0x470328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4d2185  ! 4943: LDSB_I	ldsb	[%r20 + 0x0185], %r31
cpu_intr_2_409:
	setx	0x450111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc05c000  ! 4949: LDUW_R	lduw	[%r23 + %r0], %r30
	ta	T_CHANGE_TO_TL1
cpu_intr_2_410:
	setx	0x44010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_208:
	mov	0x21, %r14
	.word 0xf8f38e80  ! 4952: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf8550000  ! 4958: LDSH_R	ldsh	[%r20 + %r0], %r28
	.word 0xfe0c8000  ! 4959: LDUB_R	ldub	[%r18 + %r0], %r31
	.word 0xf60d4000  ! 4960: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0xfc85c020  ! 4961: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r30
	.word 0xfec44020  ! 4962: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r31
T2_asi_reg_wr_209:
	mov	0x1f, %r14
	.word 0xf4f38e80  ! 4963: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfc15204b  ! 4967: LDUH_I	lduh	[%r20 + 0x004b], %r30
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, 27)
	.word 0xfed421f3  ! 4974: LDSHA_I	ldsha	[%r16, + 0x01f3] %asi, %r31
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, 24)
	.word 0xfc046164  ! 4976: LDUW_I	lduw	[%r17 + 0x0164], %r30
cpu_intr_2_411:
	setx	0x46010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5ce025  ! 4981: LDX_I	ldx	[%r19 + 0x0025], %r29
cpu_intr_2_412:
	setx	0x47013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5da10e  ! 4983: LDX_I	ldx	[%r22 + 0x010e], %r31
cpu_intr_2_413:
	setx	0x44020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88460ab  ! 4987: LDUWA_I	lduwa	[%r17, + 0x00ab] %asi, %r28
T2_asi_reg_wr_210:
	mov	0x23, %r14
	.word 0xfaf389e0  ! 4992: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf2958020  ! 4993: LDUHA_R	lduha	[%r22, %r0] 0x01, %r25
cpu_intr_2_414:
	setx	0x47003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa840020  ! 4995: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
	.word 0xfcdce02e  ! 4998: LDXA_I	ldxa	[%r19, + 0x002e] %asi, %r30
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, 17)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbba00540  ! 5: FSQRTd	fsqrt	
T1_asi_reg_rd_0:
	mov	0x21, %r14
	.word 0xfedb8e80  ! 6: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T1_asi_reg_wr_0:
	mov	0x35, %r14
	.word 0xfef389e0  ! 11: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_wr_1:
	mov	0xd, %r14
	.word 0xf8f38e40  ! 12: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_wr_2:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 13: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7a90820  ! 14: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbda489c0  ! 19: FDIVd	fdivd	%f18, %f0, %f30
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_wr_3:
	mov	0x26, %r14
	.word 0xf4f38400  ! 22: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_0:
	setx	0x1c0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00520  ! 26: FSQRTs	fsqrt	
	.word 0xba356042  ! 28: SUBC_I	orn 	%r21, 0x0042, %r29
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 7)
	.word 0xb1a00540  ! 31: FSQRTd	fsqrt	
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_wr_4:
	mov	0x26, %r14
	.word 0xf4f389e0  ! 37: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_wr_5:
	mov	0x26, %r14
	.word 0xf8f38400  ! 47: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_1:
	setx	0x1d002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_2:
	setx	0x10315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a90820  ! 57: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbcbca153  ! 58: XNORcc_I	xnorcc 	%r18, 0x0153, %r30
	.word 0xb3aac820  ! 59: FMOVGE	fmovs	%fcc1, %f0, %f25
iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_3:
	setx	0x1f031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_4:
	setx	0x1c0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda448c0  ! 63: FSUBd	fsubd	%f48, %f0, %f30
	.word 0xb73d6001  ! 68: SRA_I	sra 	%r21, 0x0001, %r27
	.word 0xb3347001  ! 69: SRLX_I	srlx	%r17, 0x0001, %r25
	.word 0xbf643801  ! 70: MOVcc_I	<illegal instruction>
	.word 0xbfa00020  ! 71: FMOVs	fmovs	%f0, %f31
	.word 0xb7a90820  ! 72: FMOVLEU	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_6:
	mov	0x1b, %r14
	.word 0xf4f384a0  ! 74: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb7ab0820  ! 75: FMOVGU	fmovs	%fcc1, %f0, %f27
	lda	[%r23 + %g0] 0xf0, %f2
cpu_intr_1_5:
	setx	0x1d0004, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_7:
	mov	0x19, %r14
	.word 0xf2f38e80  ! 79: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_1_6:
	setx	0x1c0313, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_1:
	mov	0xf, %r14
	.word 0xfedb8e60  ! 87: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb1aa8820  ! 90: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb1a488c0  ! 91: FSUBd	fsubd	%f18, %f0, %f24
T1_asi_reg_rd_2:
	mov	0x3c6, %r14
	.word 0xf8db84a0  ! 92: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb5ab8820  ! 94: FMOVPOS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_7:
	setx	0x1c0007, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_8:
	mov	0x3c1, %r14
	.word 0xf8f389e0  ! 99: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T1_asi_reg_wr_9:
	mov	0xf, %r14
	.word 0xf4f38e40  ! 102: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_8:
	setx	0x1f031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_9:
	setx	0x1c0131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 35)
	.word 0xb3a4c8c0  ! 111: FSUBd	fsubd	%f50, %f0, %f56
	.word 0xb3a80820  ! 112: FMOVN	fmovs	%fcc1, %f0, %f25
cpu_intr_1_10:
	setx	0x1f030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_10:
	mov	0x3c4, %r14
	.word 0xfef38400  ! 114: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_1_11:
	setx	0x1d032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 127: RDPR_TT	<illegal instruction>
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, 37)
	.word 0xbfa00020  ! 130: FMOVs	fmovs	%f0, %f31
cpu_intr_1_12:
	setx	0x1d010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa8820  ! 132: FMOVG	fmovs	%fcc1, %f0, %f24
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, 22)
	.word 0xb7a54920  ! 135: FMULs	fmuls	%f21, %f0, %f27
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_13:
	setx	0x1d0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c820  ! 141: FADDs	fadds	%f23, %f0, %f29
	.word 0xb49d21c0  ! 142: XORcc_I	xorcc 	%r20, 0x01c0, %r26
cpu_intr_1_14:
	setx	0x1f0038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, e)
	.word 0xb77c8400  ! 154: MOVR_R	movre	%r18, %r0, %r27
	.word 0xb7a81820  ! 155: FMOVRGZ	fmovs	%fcc3, %f0, %f27
cpu_intr_1_15:
	setx	0x1e0011, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_3:
	mov	0xc, %r14
	.word 0xf4db84a0  ! 160: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb1a80820  ! 161: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 26)
	.word 0xbba84820  ! 166: FMOVE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_4:
	mov	0x9, %r14
	.word 0xfedb8e80  ! 167: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_rd_5:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 170: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_16:
	setx	0x1d000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89520bb  ! 177: ORcc_I	orcc 	%r20, 0x00bb, %r28
cpu_intr_1_17:
	setx	0x1c0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a488e0  ! 182: FSUBq	dis not found

T1_asi_reg_wr_11:
	mov	0x3c8, %r14
	.word 0xf0f38e60  ! 184: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb1a80c20  ! 185: FMOVRLZ	dis not found

cpu_intr_1_18:
	setx	0x1d0227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_19:
	setx	0x1f0035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_20:
	setx	0x1c0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00d2190  ! 193: AND_I	and 	%r20, 0x0190, %r24
	.word 0xbfa449c0  ! 195: FDIVd	fdivd	%f48, %f0, %f62
	.word 0xb5a00560  ! 196: FSQRTq	fsqrt	
	.word 0xbda00540  ! 198: FSQRTd	fsqrt	
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_21:
	setx	0x1f0210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_wr_12:
	mov	0x29, %r14
	.word 0xf6f38e40  ! 206: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbda00540  ! 207: FSQRTd	fsqrt	
cpu_intr_1_22:
	setx	0x1f0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00540  ! 213: FSQRTd	fsqrt	
	.word 0xb1a509c0  ! 214: FDIVd	fdivd	%f20, %f0, %f24
cpu_intr_1_23:
	setx	0x1d0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab4820  ! 217: FMOVCC	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_6:
	mov	0x3c4, %r14
	.word 0xf4db8e60  ! 218: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T1_asi_reg_rd_7:
	mov	0x37, %r14
	.word 0xfcdb8e60  ! 219: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T1_asi_reg_rd_8:
	mov	0x3c2, %r14
	.word 0xfedb84a0  ! 222: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb92cf001  ! 228: SLLX_I	sllx	%r19, 0x0001, %r28
cpu_intr_1_24:
	setx	0x1c0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa4820  ! 230: FMOVNE	fmovs	%fcc1, %f0, %f31
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 3c)
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbfa508e0  ! 236: FSUBq	dis not found

cpu_intr_1_25:
	setx	0x1d0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda409c0  ! 238: FDIVd	fdivd	%f16, %f0, %f30
	.word 0xb9a80820  ! 240: FMOVN	fmovs	%fcc1, %f0, %f28
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, 26)
	.word 0x85942119  ! 243: WRPR_TSTATE_I	wrpr	%r16, 0x0119, %tstate
	.word 0xbba00540  ! 245: FSQRTd	fsqrt	
	.word 0xbda00540  ! 247: FSQRTd	fsqrt	
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 3)
	.word 0xb7abc820  ! 249: FMOVVC	fmovs	%fcc1, %f0, %f27
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_26:
	setx	0x1d0127, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_9:
	mov	0x38, %r14
	.word 0xf6db8e60  ! 257: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_1_27:
	setx	0x1e023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00040  ! 261: FMOVd	fmovd	%f0, %f58
	.word 0xb7a50840  ! 262: FADDd	faddd	%f20, %f0, %f58
cpu_intr_1_28:
	setx	0x1f0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81820  ! 265: FMOVRGZ	fmovs	%fcc3, %f0, %f30
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbda88820  ! 267: FMOVLE	fmovs	%fcc1, %f0, %f30
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_rd_10:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 271: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T1_asi_reg_wr_13:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 273: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_29:
	setx	0x1f0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81820  ! 281: FMOVRGZ	fmovs	%fcc3, %f0, %f29
T1_asi_reg_rd_11:
	mov	0x34, %r14
	.word 0xfcdb8e40  ! 287: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_rd_12:
	mov	0x28, %r14
	.word 0xf2db84a0  ! 290: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbe3c0000  ! 294: XNOR_R	xnor 	%r16, %r0, %r31
	.word 0xb1a50940  ! 295: FMULd	fmuld	%f20, %f0, %f24
cpu_intr_1_30:
	setx	0x1c000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7348000  ! 297: SRL_R	srl 	%r18, %r0, %r27
	.word 0xb5a54840  ! 300: FADDd	faddd	%f52, %f0, %f26
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 33)
	.word 0xb2c42163  ! 304: ADDCcc_I	addccc 	%r16, 0x0163, %r25
	.word 0xbeb52139  ! 306: ORNcc_I	orncc 	%r20, 0x0139, %r31
	.word 0xb2b5e014  ! 308: SUBCcc_I	orncc 	%r23, 0x0014, %r25
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_rd_13:
	mov	0x1b, %r14
	.word 0xfcdb8e40  ! 311: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xba4521f3  ! 312: ADDC_I	addc 	%r20, 0x01f3, %r29
iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_rd_14:
	mov	0x3c4, %r14
	.word 0xfedb84a0  ! 316: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_1_31:
	setx	0x1d023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda40840  ! 322: FADDd	faddd	%f16, %f0, %f30
cpu_intr_1_32:
	setx	0x1f033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, 37)
cpu_intr_1_33:
	setx	0x1f0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72cf001  ! 326: SLLX_I	sllx	%r19, 0x0001, %r27
	.word 0xbba00540  ! 328: FSQRTd	fsqrt	
T1_asi_reg_wr_14:
	mov	0x35, %r14
	.word 0xfcf38e60  ! 336: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb3a448e0  ! 337: FSUBq	dis not found

	.word 0xb2144000  ! 340: OR_R	or 	%r17, %r0, %r25
T1_asi_reg_rd_15:
	mov	0xd, %r14
	.word 0xf2db8400  ! 341: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_1_34:
	setx	0x1f002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a9c820  ! 349: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbda548c0  ! 351: FSUBd	fsubd	%f52, %f0, %f30
	.word 0xb41de177  ! 355: XOR_I	xor 	%r23, 0x0177, %r26
	.word 0xbfa88820  ! 357: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb7a84820  ! 364: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb3a548c0  ! 367: FSUBd	fsubd	%f52, %f0, %f56
cpu_intr_1_35:
	setx	0x1c022c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_36:
	setx	0x1f0035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_37:
	setx	0x1f0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a58960  ! 378: FMULq	dis not found

	.word 0xb735a001  ! 379: SRL_I	srl 	%r22, 0x0001, %r27
cpu_intr_1_38:
	setx	0x1f0201, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_16:
	mov	0x2c, %r14
	.word 0xf4db89e0  ! 384: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_rd_17:
	mov	0x1, %r14
	.word 0xf6db89e0  ! 392: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb9a00520  ! 394: FSQRTs	fsqrt	
T1_asi_reg_rd_18:
	mov	0x3c5, %r14
	.word 0xfcdb8e80  ! 396: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_1_39:
	setx	0x1f030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6046108  ! 400: ADD_I	add 	%r17, 0x0108, %r27
cpu_intr_1_40:
	setx	0x1f0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab4820  ! 403: FMOVCC	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_15:
	mov	0x1e, %r14
	.word 0xfef389e0  ! 407: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_41:
	setx	0x1d0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa8820  ! 413: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb9a80c20  ! 415: FMOVRLZ	dis not found

iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbfa588e0  ! 418: FSUBq	dis not found

	.word 0xb9a00040  ! 420: FMOVd	fmovd	%f0, %f28
cpu_intr_1_42:
	setx	0x1d013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_43:
	setx	0x1d0318, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_19:
	mov	0x2a, %r14
	.word 0xf6db8e40  ! 425: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfa448c0  ! 427: FSUBd	fsubd	%f48, %f0, %f62
	.word 0xb5a9c820  ! 428: FMOVVS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_20:
	mov	0x22, %r14
	.word 0xf6db84a0  ! 429: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_1_44:
	setx	0x1e0335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_45:
	setx	0x1f0132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 12)
	.word 0xb48d8000  ! 437: ANDcc_R	andcc 	%r22, %r0, %r26
	.word 0xb1a5c920  ! 438: FMULs	fmuls	%f23, %f0, %f24
cpu_intr_1_46:
	setx	0x1c020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab8820  ! 444: FMOVPOS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_47:
	setx	0x1d0103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_48:
	setx	0x1d0232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_49:
	setx	0x1c0209, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_50:
	setx	0x1c0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80c20  ! 455: FMOVRLZ	dis not found

iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 33)
	.word 0xbfa8c820  ! 457: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb2c4607f  ! 459: ADDCcc_I	addccc 	%r17, 0x007f, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbda00520  ! 464: FSQRTs	fsqrt	
T1_asi_reg_rd_21:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 466: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_wr_16:
	mov	0x24, %r14
	.word 0xf2f38e40  ! 471: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_rd_22:
	mov	0x3, %r14
	.word 0xf0db8400  ! 476: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb7a00040  ! 478: FMOVd	fmovd	%f0, %f58
	.word 0xb3a4c920  ! 480: FMULs	fmuls	%f19, %f0, %f25
	.word 0xb5a509e0  ! 481: FDIVq	dis not found

	.word 0xbebcc000  ! 482: XNORcc_R	xnorcc 	%r19, %r0, %r31
	.word 0xb52d4000  ! 485: SLL_R	sll 	%r21, %r0, %r26
cpu_intr_1_51:
	setx	0x22022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda48860  ! 488: FADDq	dis not found

	.word 0xb9ab4820  ! 489: FMOVCC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_52:
	setx	0x200314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa449e0  ! 491: FDIVq	dis not found

iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbfa44960  ! 493: FMULq	dis not found

iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb9a408a0  ! 498: FSUBs	fsubs	%f16, %f0, %f28
	.word 0xb52d5000  ! 499: SLLX_R	sllx	%r21, %r0, %r26
	.word 0xb3a00040  ! 503: FMOVd	fmovd	%f0, %f56
cpu_intr_1_53:
	setx	0x20013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00040  ! 512: FMOVd	fmovd	%f0, %f28
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb5a9c820  ! 517: FMOVVS	fmovs	%fcc1, %f0, %f26
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbec420f2  ! 521: ADDCcc_I	addccc 	%r16, 0x00f2, %r31
cpu_intr_1_54:
	setx	0x230125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_55:
	setx	0x220324, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_17:
	mov	0xc, %r14
	.word 0xfef38e60  ! 529: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T1_asi_reg_rd_23:
	mov	0x31, %r14
	.word 0xf2db8e60  ! 531: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb69d4000  ! 532: XORcc_R	xorcc 	%r21, %r0, %r27
	.word 0xb7a84820  ! 533: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xbcbd4000  ! 534: XNORcc_R	xnorcc 	%r21, %r0, %r30
T1_asi_reg_rd_24:
	mov	0x28, %r14
	.word 0xf2db8400  ! 535: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb5a40960  ! 537: FMULq	dis not found

cpu_intr_1_56:
	setx	0x210334, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_18:
	mov	0x2a, %r14
	.word 0xf8f384a0  ! 539: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbda88820  ! 540: FMOVLE	fmovs	%fcc1, %f0, %f30
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, f)
	.word 0xb7aa8820  ! 548: FMOVG	fmovs	%fcc1, %f0, %f27
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_57:
	setx	0x210307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 30)
	.word 0xb7518000  ! 554: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_58:
	setx	0x200018, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbda00540  ! 567: FSQRTd	fsqrt	
cpu_intr_1_59:
	setx	0x200007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 24)
	.word 0xb5510000  ! 578: RDPR_TICK	<illegal instruction>
	.word 0xb3a48940  ! 580: FMULd	fmuld	%f18, %f0, %f56
T1_asi_reg_rd_25:
	mov	0x4, %r14
	.word 0xfcdb8e40  ! 581: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_60:
	setx	0x23010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_26:
	mov	0x2b, %r14
	.word 0xfcdb89e0  ! 584: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 28)
	.word 0xb5a80820  ! 588: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
cpu_intr_1_61:
	setx	0x210306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 590: FSQRTs	fsqrt	
T1_asi_reg_wr_19:
	mov	0x3c5, %r14
	.word 0xf4f38e80  ! 592: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb5a44960  ! 594: FMULq	dis not found

iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 13)
	.word 0xb3a58820  ! 598: FADDs	fadds	%f22, %f0, %f25
	.word 0xb08d2045  ! 599: ANDcc_I	andcc 	%r20, 0x0045, %r24
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbfa00560  ! 602: FSQRTq	fsqrt	
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_rd_27:
	mov	0x27, %r14
	.word 0xf8db8e60  ! 608: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbba509e0  ! 612: FDIVq	dis not found

	.word 0xbba88820  ! 614: FMOVLE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_62:
	setx	0x230107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3340000  ! 617: SRL_R	srl 	%r16, %r0, %r25
T1_asi_reg_rd_28:
	mov	0x37, %r14
	.word 0xf6db89e0  ! 618: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T1_asi_reg_rd_29:
	mov	0x35, %r14
	.word 0xf4db8e60  ! 621: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb9a98820  ! 623: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbc0420fb  ! 624: ADD_I	add 	%r16, 0x00fb, %r30
	.word 0xb9ab8820  ! 626: FMOVPOS	fmovs	%fcc1, %f0, %f28
cpu_intr_1_63:
	setx	0x220000, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_20:
	mov	0x9, %r14
	.word 0xf4f38e60  ! 632: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbca44000  ! 633: SUBcc_R	subcc 	%r17, %r0, %r30
	.word 0xb8a5a105  ! 634: SUBcc_I	subcc 	%r22, 0x0105, %r28
T1_asi_reg_wr_21:
	mov	0x3c8, %r14
	.word 0xfaf389e0  ! 638: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 38)
cpu_intr_1_64:
	setx	0x21030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a508a0  ! 643: FSUBs	fsubs	%f20, %f0, %f24
	.word 0xb53cb001  ! 646: SRAX_I	srax	%r18, 0x0001, %r26
cpu_intr_1_65:
	setx	0x200127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a40940  ! 655: FMULd	fmuld	%f16, %f0, %f56
cpu_intr_1_66:
	setx	0x220028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c8c0  ! 659: FSUBd	fsubd	%f54, %f0, %f58
	.word 0xb5508000  ! 660: RDPR_TSTATE	<illegal instruction>
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 13)
	.word 0xbd350000  ! 663: SRL_R	srl 	%r20, %r0, %r30
	.word 0xbda5c9e0  ! 670: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_67:
	setx	0x23001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_68:
	setx	0x22010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda94820  ! 681: FMOVCS	fmovs	%fcc1, %f0, %f30
cpu_intr_1_69:
	setx	0x20001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a98820  ! 686: FMOVNEG	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_30:
	mov	0x13, %r14
	.word 0xf8db8e80  ! 687: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbda88820  ! 688: FMOVLE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_70:
	setx	0x210028, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_22:
	mov	0xf, %r14
	.word 0xfaf38e40  ! 696: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_71:
	setx	0x23030d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_72:
	setx	0x210128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 702: FMOVNEG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_31:
	mov	0x0, %r14
	.word 0xf4db8e40  ! 703: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb5aac820  ! 704: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb5a409e0  ! 708: FDIVq	dis not found

	.word 0xbda588e0  ! 710: FSUBq	dis not found

iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 12)
	.word 0xbda80820  ! 714: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb5ab0820  ! 715: FMOVGU	fmovs	%fcc1, %f0, %f26
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 7)
	.word 0xb4842004  ! 717: ADDcc_I	addcc 	%r16, 0x0004, %r26
	.word 0xb7a50920  ! 722: FMULs	fmuls	%f20, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7a00560  ! 724: FSQRTq	fsqrt	
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb7a00520  ! 729: FSQRTs	fsqrt	
	.word 0xbda488e0  ! 732: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbba4c840  ! 735: FADDd	faddd	%f50, %f0, %f60
	.word 0xbba80820  ! 736: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xbfa00020  ! 737: FMOVs	fmovs	%f0, %f31
	.word 0xbf50c000  ! 738: RDPR_TT	<illegal instruction>
T1_asi_reg_wr_23:
	mov	0xf, %r14
	.word 0xfaf38e40  ! 740: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_73:
	setx	0x22031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 23)
	.word 0xb1a8c820  ! 744: FMOVL	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa80420  ! 748: FMOVRZ	dis not found

	.word 0xbd3c3001  ! 749: SRAX_I	srax	%r16, 0x0001, %r30
T1_asi_reg_wr_24:
	mov	0x14, %r14
	.word 0xf6f38400  ! 752: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb5abc820  ! 754: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb284a1b8  ! 755: ADDcc_I	addcc 	%r18, 0x01b8, %r25
T1_asi_reg_rd_32:
	mov	0x22, %r14
	.word 0xf8db8400  ! 758: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_1_74:
	setx	0x23022c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_75:
	setx	0x210323, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r19 + %g0] 0xf0, %f2
cpu_intr_1_76:
	setx	0x210233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_77:
	setx	0x22030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 26)
	.word 0xb5a94820  ! 770: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xbda8c820  ! 771: FMOVL	fmovs	%fcc1, %f0, %f30
cpu_intr_1_78:
	setx	0x210100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe3520d8  ! 773: SUBC_I	orn 	%r20, 0x00d8, %r31
	.word 0xb4340000  ! 774: SUBC_R	orn 	%r16, %r0, %r26
	lda	[%r19 + %g0] 0xf0, %f2
cpu_intr_1_79:
	setx	0x220213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 788: FMOVN	fmovs	%fcc1, %f0, %f24
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_80:
	setx	0x220314, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_25:
	mov	0x1a, %r14
	.word 0xfcf38e60  ! 798: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb1aa8820  ! 805: FMOVG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_26:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 806: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb8b54000  ! 807: SUBCcc_R	orncc 	%r21, %r0, %r28
	.word 0xba35e16b  ! 811: SUBC_I	orn 	%r23, 0x016b, %r29
	.word 0xb5abc820  ! 812: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbda58860  ! 814: FADDq	dis not found

iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 2f)
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 39)
	.word 0xb7a4c840  ! 819: FADDd	faddd	%f50, %f0, %f58
	.word 0xb9a5c940  ! 821: FMULd	fmuld	%f54, %f0, %f28
	.word 0xb77de401  ! 826: MOVR_I	movre	%r23, 0x1, %r27
	.word 0xb3a9c820  ! 832: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbda00520  ! 834: FSQRTs	fsqrt	
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 1)
	.word 0xb83d4000  ! 839: XNOR_R	xnor 	%r21, %r0, %r28
T1_asi_reg_rd_33:
	mov	0x1, %r14
	.word 0xf2db8e40  ! 840: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbdaa0820  ! 843: FMOVA	fmovs	%fcc1, %f0, %f30
cpu_intr_1_81:
	setx	0x220212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa4820  ! 845: FMOVNE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_82:
	setx	0x21020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a489e0  ! 849: FDIVq	dis not found

T1_asi_reg_rd_34:
	mov	0x18, %r14
	.word 0xf2db8e40  ! 850: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_rd_35:
	mov	0xc, %r14
	.word 0xf0db8e60  ! 851: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, f)
	.word 0xbfa549c0  ! 859: FDIVd	fdivd	%f52, %f0, %f62
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_wr_27:
	mov	0x7, %r14
	.word 0xf2f38e40  ! 862: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_rd_36:
	mov	0x3c2, %r14
	.word 0xf2db8e60  ! 864: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_1_83:
	setx	0x220225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 37)
	.word 0xb3a509c0  ! 875: FDIVd	fdivd	%f20, %f0, %f56
	.word 0xb5a81820  ! 876: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbda4c960  ! 878: FMULq	dis not found

iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_84:
	setx	0x20011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb425212f  ! 881: SUB_I	sub 	%r20, 0x012f, %r26
cpu_intr_1_85:
	setx	0x21031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2c1000  ! 885: SLLX_R	sllx	%r16, %r0, %r31
T1_asi_reg_wr_28:
	mov	0x2d, %r14
	.word 0xf2f384a0  ! 886: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbba00560  ! 888: FSQRTq	fsqrt	
cpu_intr_1_86:
	setx	0x21021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_29:
	mov	0x2b, %r14
	.word 0xf6f38e60  ! 895: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_rd_37:
	mov	0x31, %r14
	.word 0xfcdb84a0  ! 899: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb9a448c0  ! 906: FSUBd	fsubd	%f48, %f0, %f28
T1_asi_reg_rd_38:
	mov	0x2c, %r14
	.word 0xf6db8e60  ! 907: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T1_asi_reg_wr_30:
	mov	0x1f, %r14
	.word 0xfef38400  ! 909: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T1_asi_reg_wr_31:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 912: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, f)
iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 17)
	.word 0xbda4c940  ! 916: FMULd	fmuld	%f50, %f0, %f30
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, c)
	.word 0xb8b44000  ! 921: SUBCcc_R	orncc 	%r17, %r0, %r28
	.word 0xb9a80c20  ! 925: FMOVRLZ	dis not found

cpu_intr_1_87:
	setx	0x25032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_39:
	mov	0x11, %r14
	.word 0xfadb8400  ! 931: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbda94820  ! 932: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xbe3cc000  ! 933: XNOR_R	xnor 	%r19, %r0, %r31
cpu_intr_1_88:
	setx	0x25031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81c20  ! 936: FMOVRGEZ	dis not found

T1_asi_reg_wr_32:
	mov	0x22, %r14
	.word 0xfcf38e40  ! 938: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7a5c960  ! 939: FMULq	dis not found

	.word 0xb5a40840  ! 941: FADDd	faddd	%f16, %f0, %f26
iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_89:
	setx	0x25031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c8e0  ! 949: FSUBq	dis not found

T1_asi_reg_rd_40:
	mov	0x36, %r14
	.word 0xf6db8400  ! 950: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_90:
	setx	0x25013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_33:
	mov	0x2a, %r14
	.word 0xfcf38e40  ! 955: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_91:
	setx	0x270234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 24)
cpu_intr_1_92:
	setx	0x26030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a409c0  ! 963: FDIVd	fdivd	%f16, %f0, %f56
T1_asi_reg_rd_41:
	mov	0x3c7, %r14
	.word 0xf6db84a0  ! 964: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbda449c0  ! 965: FDIVd	fdivd	%f48, %f0, %f30
	.word 0xb3a80420  ! 970: FMOVRZ	dis not found

	.word 0xb57d8400  ! 971: MOVR_R	movre	%r22, %r0, %r26
	.word 0xbfa80820  ! 973: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb43da14f  ! 974: XNOR_I	xnor 	%r22, 0x014f, %r26
T1_asi_reg_wr_34:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 975: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb20da1f4  ! 977: AND_I	and 	%r22, 0x01f4, %r25
	.word 0xb1a81820  ! 979: FMOVRGZ	fmovs	%fcc3, %f0, %f24
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_rd_42:
	mov	0x1d, %r14
	.word 0xfadb8e40  ! 985: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb5a508e0  ! 986: FSUBq	dis not found

iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_93:
	setx	0x270327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_94:
	setx	0x240015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00040  ! 997: FMOVd	fmovd	%f0, %f28
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_wr_35:
	mov	0x14, %r14
	.word 0xf6f38e80  ! 1001: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 35)
	.word 0xb5a00540  ! 1005: FSQRTd	fsqrt	
	.word 0xb5aac820  ! 1007: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb88561dc  ! 1009: ADDcc_I	addcc 	%r21, 0x01dc, %r28
T1_asi_reg_rd_43:
	mov	0x2a, %r14
	.word 0xf6db84a0  ! 1011: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbba90820  ! 1013: FMOVLEU	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_44:
	mov	0x1c, %r14
	.word 0xfadb8400  ! 1015: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbba4c840  ! 1017: FADDd	faddd	%f50, %f0, %f60
	.word 0xb5a00560  ! 1020: FSQRTq	fsqrt	
	.word 0xb244e152  ! 1021: ADDC_I	addc 	%r19, 0x0152, %r25
cpu_intr_1_95:
	setx	0x270217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_96:
	setx	0x27033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_36:
	mov	0x18, %r14
	.word 0xfaf38400  ! 1028: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbdab0820  ! 1031: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb3a5c840  ! 1032: FADDd	faddd	%f54, %f0, %f56
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 3)
	.word 0xb8c5a145  ! 1037: ADDCcc_I	addccc 	%r22, 0x0145, %r28
cpu_intr_1_97:
	setx	0x25033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_37:
	mov	0xd, %r14
	.word 0xfef38e40  ! 1040: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_45:
	mov	0x12, %r14
	.word 0xfadb84a0  ! 1041: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb5a4c820  ! 1046: FADDs	fadds	%f19, %f0, %f26
	.word 0xb3a81420  ! 1049: FMOVRNZ	dis not found

T1_asi_reg_wr_38:
	mov	0x11, %r14
	.word 0xf4f38e40  ! 1050: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_46:
	mov	0x3c0, %r14
	.word 0xf4db84a0  ! 1052: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T1_asi_reg_wr_39:
	mov	0x3c2, %r14
	.word 0xfef384a0  ! 1053: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T1_asi_reg_rd_47:
	mov	0x2, %r14
	.word 0xf0db89e0  ! 1055: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_1_98:
	setx	0x250319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aac820  ! 1057: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb1aa8820  ! 1059: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb9aac820  ! 1061: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0x89952148  ! 1066: WRPR_TICK_I	wrpr	%r20, 0x0148, %tick
T1_asi_reg_wr_40:
	mov	0x1c, %r14
	.word 0xf4f389e0  ! 1067: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb1a4c8a0  ! 1068: FSUBs	fsubs	%f19, %f0, %f24
	.word 0xbba48860  ! 1070: FADDq	dis not found

T1_asi_reg_rd_48:
	mov	0xb, %r14
	.word 0xf2db8e60  ! 1071: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb1a80820  ! 1073: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb3a90820  ! 1075: FMOVLEU	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_49:
	mov	0xc, %r14
	.word 0xf8db8e80  ! 1081: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T1_asi_reg_wr_41:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 1082: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb3ab4820  ! 1083: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbba549e0  ! 1089: FDIVq	dis not found

cpu_intr_1_99:
	setx	0x240007, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_50:
	mov	0x1a, %r14
	.word 0xfadb8400  ! 1093: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb3a5c940  ! 1096: FMULd	fmuld	%f54, %f0, %f56
T1_asi_reg_rd_51:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 1098: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbda00560  ! 1099: FSQRTq	fsqrt	
	.word 0xb7a48820  ! 1100: FADDs	fadds	%f18, %f0, %f27
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_100:
	setx	0x260005, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_52:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 1104: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_wr_42:
	mov	0x1b, %r14
	.word 0xf6f384a0  ! 1108: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_101:
	setx	0x26031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a98820  ! 1112: FMOVNEG	fmovs	%fcc1, %f0, %f27
cpu_intr_1_102:
	setx	0x27012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 11)
	.word 0xbba548c0  ! 1122: FSUBd	fsubd	%f52, %f0, %f60
cpu_intr_1_103:
	setx	0x240112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a9c820  ! 1126: FMOVVS	fmovs	%fcc1, %f0, %f27
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 6)
	.word 0xb1a00020  ! 1130: FMOVs	fmovs	%f0, %f24
	.word 0xb5a449e0  ! 1131: FDIVq	dis not found

	.word 0xb3a81820  ! 1135: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xbda509a0  ! 1137: FDIVs	fdivs	%f20, %f0, %f30
T1_asi_reg_rd_53:
	mov	0x1a, %r14
	.word 0xfcdb8400  ! 1138: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb0244000  ! 1140: SUB_R	sub 	%r17, %r0, %r24
T1_asi_reg_wr_43:
	mov	0x1a, %r14
	.word 0xf6f389e0  ! 1143: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb7a80420  ! 1145: FMOVRZ	dis not found

	lda	[%r22 + %g0] 0xf0, %f2
cpu_intr_1_104:
	setx	0x240220, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	lda	[%r22 + %g0] 0xf0, %f2
T1_asi_reg_rd_54:
	mov	0x14, %r14
	.word 0xf8db8e60  ! 1155: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbfa90820  ! 1159: FMOVLEU	fmovs	%fcc1, %f0, %f31
iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 0)
	.word 0xb7a8c820  ! 1163: FMOVL	fmovs	%fcc1, %f0, %f27
cpu_intr_1_105:
	setx	0x260226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a40820  ! 1166: FADDs	fadds	%f16, %f0, %f26
	.word 0xbfa81c20  ! 1167: FMOVRGEZ	dis not found

iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_wr_44:
	mov	0x38, %r14
	.word 0xfaf389e0  ! 1169: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb6b40000  ! 1179: ORNcc_R	orncc 	%r16, %r0, %r27
cpu_intr_1_106:
	setx	0x24000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68ca089  ! 1186: ANDcc_I	andcc 	%r18, 0x0089, %r27
	.word 0xb3aa8820  ! 1187: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xbba508e0  ! 1188: FSUBq	dis not found

iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, 33)
	.word 0xb48c4000  ! 1194: ANDcc_R	andcc 	%r17, %r0, %r26
	.word 0xb9a50820  ! 1195: FADDs	fadds	%f20, %f0, %f28
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 25)
	.word 0xb7a44960  ! 1199: FMULq	dis not found

	.word 0xb9a81c20  ! 1202: FMOVRGEZ	dis not found

	.word 0xb7aa0820  ! 1204: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb5a81820  ! 1209: FMOVRGZ	fmovs	%fcc3, %f0, %f26
T1_asi_reg_rd_55:
	mov	0x33, %r14
	.word 0xf2db84a0  ! 1211: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_1_107:
	setx	0x26033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_rd_56:
	mov	0xf, %r14
	.word 0xfedb8e40  ! 1218: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbfa81820  ! 1224: FMOVRGZ	fmovs	%fcc3, %f0, %f31
cpu_intr_1_108:
	setx	0x260208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a88820  ! 1228: FMOVLE	fmovs	%fcc1, %f0, %f28
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_wr_45:
	mov	0x3c3, %r14
	.word 0xf8f389e0  ! 1232: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbc35c000  ! 1236: ORN_R	orn 	%r23, %r0, %r30
	.word 0xb7a588c0  ! 1237: FSUBd	fsubd	%f22, %f0, %f58
cpu_intr_1_109:
	setx	0x24030a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, 12)
	.word 0xbbabc820  ! 1250: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xba2d20a1  ! 1251: ANDN_I	andn 	%r20, 0x00a1, %r29
	.word 0xbfab0820  ! 1253: FMOVGU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_110:
	setx	0x270238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a409c0  ! 1256: FDIVd	fdivd	%f16, %f0, %f58
	.word 0xb3a44940  ! 1258: FMULd	fmuld	%f48, %f0, %f56
iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 7)
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_wr_46:
	mov	0x3c6, %r14
	.word 0xf8f38e80  ! 1266: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbda44940  ! 1267: FMULd	fmuld	%f48, %f0, %f30
T1_asi_reg_wr_47:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 1269: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_57:
	mov	0x16, %r14
	.word 0xfcdb84a0  ! 1272: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb1a8c820  ! 1273: FMOVL	fmovs	%fcc1, %f0, %f24
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_111:
	setx	0x270035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_112:
	setx	0x270002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00540  ! 1282: FSQRTd	fsqrt	
	.word 0xb0254000  ! 1283: SUB_R	sub 	%r21, %r0, %r24
T1_asi_reg_rd_58:
	mov	0x1d, %r14
	.word 0xf4db8e60  ! 1285: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb3a81c20  ! 1286: FMOVRGEZ	dis not found

	.word 0xb9a589c0  ! 1287: FDIVd	fdivd	%f22, %f0, %f28
	.word 0xbfa8c820  ! 1288: FMOVL	fmovs	%fcc1, %f0, %f31
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 9)
	.word 0xb20c21c7  ! 1293: AND_I	and 	%r16, 0x01c7, %r25
	.word 0xb3a88820  ! 1294: FMOVLE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_59:
	mov	0x1a, %r14
	.word 0xfedb8e40  ! 1295: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, 35)
	.word 0xbf349000  ! 1301: SRLX_R	srlx	%r18, %r0, %r31
cpu_intr_1_113:
	setx	0x27013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_60:
	mov	0x33, %r14
	.word 0xf4db8e40  ! 1303: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_61:
	mov	0x2d, %r14
	.word 0xf6db8e80  ! 1304: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb6b5c000  ! 1305: ORNcc_R	orncc 	%r23, %r0, %r27
	lda	[%r22 + %g0] 0xf0, %f2
cpu_intr_1_114:
	setx	0x27010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_48:
	mov	0x1e, %r14
	.word 0xf4f384a0  ! 1309: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbfaac820  ! 1313: FMOVGE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_115:
	setx	0x24020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a58820  ! 1318: FADDs	fadds	%f22, %f0, %f25
T1_asi_reg_wr_49:
	mov	0x2, %r14
	.word 0xf4f38e80  ! 1321: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_1_116:
	setx	0x260323, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_62:
	mov	0x3c4, %r14
	.word 0xfcdb8e80  ! 1323: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T1_asi_reg_rd_63:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 1324: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_117:
	setx	0x27023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00560  ! 1329: FSQRTq	fsqrt	
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 20)
	.word 0xbba58940  ! 1331: FMULd	fmuld	%f22, %f0, %f60
	.word 0xb7a81420  ! 1335: FMOVRNZ	dis not found

	.word 0xb9a40940  ! 1337: FMULd	fmuld	%f16, %f0, %f28
cpu_intr_1_118:
	setx	0x27010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_64:
	mov	0x24, %r14
	.word 0xf2db8e40  ! 1341: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbba00540  ! 1342: FSQRTd	fsqrt	
cpu_intr_1_119:
	setx	0x24022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81c20  ! 1345: FMOVRGEZ	dis not found

	.word 0xb7ab8820  ! 1347: FMOVPOS	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_65:
	mov	0x30, %r14
	.word 0xf6db8e60  ! 1350: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbb3de001  ! 1352: SRA_I	sra 	%r23, 0x0001, %r29
	.word 0xb09c8000  ! 1355: XORcc_R	xorcc 	%r18, %r0, %r24
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 39)
	.word 0xb9a88820  ! 1357: FMOVLE	fmovs	%fcc1, %f0, %f28
iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 37)
	.word 0xbcb44000  ! 1360: SUBCcc_R	orncc 	%r17, %r0, %r30
	.word 0xbfa588c0  ! 1366: FSUBd	fsubd	%f22, %f0, %f62
	.word 0xb9500000  ! 1370: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a81c20  ! 1372: FMOVRGEZ	dis not found

cpu_intr_1_120:
	setx	0x25003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_66:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 1374: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbba50860  ! 1376: FADDq	dis not found

iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb5a00560  ! 1380: FSQRTq	fsqrt	
	.word 0xb9a00520  ! 1381: FSQRTs	fsqrt	
T1_asi_reg_rd_67:
	mov	0x3c1, %r14
	.word 0xf0db84a0  ! 1382: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb3a549e0  ! 1391: FDIVq	dis not found

T1_asi_reg_wr_50:
	mov	0x3c1, %r14
	.word 0xf6f38e80  ! 1392: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_1_121:
	setx	0x28020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, a)
	.word 0xb7a44840  ! 1396: FADDd	faddd	%f48, %f0, %f58
T1_asi_reg_rd_68:
	mov	0x1d, %r14
	.word 0xf2db8e40  ! 1398: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb2346089  ! 1401: SUBC_I	orn 	%r17, 0x0089, %r25
	.word 0xb7a48920  ! 1402: FMULs	fmuls	%f18, %f0, %f27
	.word 0xb7a40840  ! 1407: FADDd	faddd	%f16, %f0, %f58
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_wr_51:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 1410: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_122:
	setx	0x28003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 36)
	.word 0xb9a90820  ! 1415: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbfa48920  ! 1417: FMULs	fmuls	%f18, %f0, %f31
cpu_intr_1_123:
	setx	0x2b021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda54820  ! 1419: FADDs	fadds	%f21, %f0, %f30
	.word 0xb5a9c820  ! 1421: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb7a80820  ! 1423: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_69:
	mov	0x3c2, %r14
	.word 0xf4db8e40  ! 1428: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_70:
	mov	0x17, %r14
	.word 0xf0db8e40  ! 1429: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbdabc820  ! 1430: FMOVVC	fmovs	%fcc1, %f0, %f30
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbfa58860  ! 1433: FADDq	dis not found

T1_asi_reg_wr_52:
	mov	0xf, %r14
	.word 0xf0f38400  ! 1436: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T1_asi_reg_rd_71:
	mov	0x8, %r14
	.word 0xf6db8400  ! 1438: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbdab4820  ! 1441: FMOVCC	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_53:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 1446: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_rd_72:
	mov	0x29, %r14
	.word 0xf8db8e40  ! 1447: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_124:
	setx	0x28011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a54820  ! 1452: FADDs	fadds	%f21, %f0, %f28
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 6)
cpu_intr_1_125:
	setx	0x2b0237, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_54:
	mov	0x21, %r14
	.word 0xfaf38e60  ! 1457: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_126:
	setx	0x2a0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xa1902000  ! 1466: WRPR_GL_I	wrpr	%r0, 0x0000, %-
T1_asi_reg_wr_55:
	mov	0x3c6, %r14
	.word 0xf6f389e0  ! 1467: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 38)
	.word 0xb7a44820  ! 1469: FADDs	fadds	%f17, %f0, %f27
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbfa00540  ! 1473: FSQRTd	fsqrt	
cpu_intr_1_127:
	setx	0x2a0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81820  ! 1477: FMOVRGZ	fmovs	%fcc3, %f0, %f28
T1_asi_reg_rd_73:
	mov	0x2c, %r14
	.word 0xf2db8e60  ! 1479: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb9a44820  ! 1482: FADDs	fadds	%f17, %f0, %f28
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_wr_56:
	mov	0x3c4, %r14
	.word 0xf4f38400  ! 1485: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbf2c5000  ! 1486: SLLX_R	sllx	%r17, %r0, %r31
cpu_intr_1_128:
	setx	0x2a020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb014c000  ! 1490: OR_R	or 	%r19, %r0, %r24
	.word 0xbfa588e0  ! 1491: FSUBq	dis not found

	lda	[%r19 + %g0] 0xf0, %f2
cpu_intr_1_129:
	setx	0x290021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_130:
	setx	0x2a010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a58820  ! 1500: FADDs	fadds	%f22, %f0, %f27
T1_asi_reg_rd_74:
	mov	0x18, %r14
	.word 0xfadb89e0  ! 1501: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_1_131:
	setx	0x29023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00520  ! 1503: FSQRTs	fsqrt	
	.word 0xb9a80820  ! 1506: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
cpu_intr_1_132:
	setx	0x290031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_133:
	setx	0x2a0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a40960  ! 1511: FMULq	dis not found

	.word 0xbba00520  ! 1513: FSQRTs	fsqrt	
cpu_intr_1_134:
	setx	0x280335, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, 18)
	.word 0xb13c4000  ! 1519: SRA_R	sra 	%r17, %r0, %r24
	.word 0xb40dc000  ! 1523: AND_R	and 	%r23, %r0, %r26
cpu_intr_1_135:
	setx	0x280322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 4)
	.word 0xb9abc820  ! 1529: FMOVVC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_136:
	setx	0x2b0221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_wr_57:
	mov	0x3c6, %r14
	.word 0xfef38400  ! 1535: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 4)
	.word 0xba8ce0d1  ! 1538: ANDcc_I	andcc 	%r19, 0x00d1, %r29
cpu_intr_1_137:
	setx	0x2a000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, c)
	.word 0xbfa00040  ! 1550: FMOVd	fmovd	%f0, %f62
	.word 0xb9ab0820  ! 1552: FMOVGU	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_58:
	mov	0x1d, %r14
	.word 0xf4f38400  ! 1554: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb5a00560  ! 1557: FSQRTq	fsqrt	
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_138:
	setx	0x2b001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_59:
	mov	0x31, %r14
	.word 0xf2f38e40  ! 1560: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_wr_60:
	mov	0x14, %r14
	.word 0xfef384a0  ! 1561: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T1_asi_reg_rd_75:
	mov	0x1a, %r14
	.word 0xf4db8e60  ! 1562: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbba48920  ! 1563: FMULs	fmuls	%f18, %f0, %f29
	.word 0xbda589e0  ! 1565: FDIVq	dis not found

	.word 0xbda00520  ! 1566: FSQRTs	fsqrt	
cpu_intr_1_139:
	setx	0x2b012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_140:
	setx	0x2b021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a48840  ! 1574: FADDd	faddd	%f18, %f0, %f56
cpu_intr_1_141:
	setx	0x2b0026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_142:
	setx	0x2a0108, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_61:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 1578: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb17ce401  ! 1581: MOVR_I	movre	%r19, 0x1, %r24
	.word 0xb23c8000  ! 1582: XNOR_R	xnor 	%r18, %r0, %r25
	.word 0xb5a81c20  ! 1586: FMOVRGEZ	dis not found

iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, b)
cpu_intr_1_143:
	setx	0x2b001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_144:
	setx	0x2a0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 1591: FSQRTq	fsqrt	
	.word 0xbf50c000  ! 1593: RDPR_TT	<illegal instruction>
	.word 0xb9a80820  ! 1594: FMOVN	fmovs	%fcc1, %f0, %f28
iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_wr_62:
	mov	0x3c1, %r14
	.word 0xfcf384a0  ! 1598: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb5a489a0  ! 1602: FDIVs	fdivs	%f18, %f0, %f26
cpu_intr_1_145:
	setx	0x280021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc2d4000  ! 1606: ANDN_R	andn 	%r21, %r0, %r30
	.word 0xb9a84820  ! 1607: FMOVE	fmovs	%fcc1, %f0, %f28
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_wr_63:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 1610: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb9a4c960  ! 1612: FMULq	dis not found

	.word 0xb015216f  ! 1613: OR_I	or 	%r20, 0x016f, %r24
	.word 0xbba508c0  ! 1614: FSUBd	fsubd	%f20, %f0, %f60
T1_asi_reg_wr_64:
	mov	0x0, %r14
	.word 0xf2f38400  ! 1615: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb1a40940  ! 1620: FMULd	fmuld	%f16, %f0, %f24
T1_asi_reg_wr_65:
	mov	0x2b, %r14
	.word 0xf4f38e40  ! 1623: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb3a81420  ! 1624: FMOVRNZ	dis not found

	.word 0xbba408a0  ! 1625: FSUBs	fsubs	%f16, %f0, %f29
	.word 0xb7abc820  ! 1626: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbda88820  ! 1627: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0x8995a1c9  ! 1629: WRPR_TICK_I	wrpr	%r22, 0x01c9, %tick
	.word 0xb7a448c0  ! 1631: FSUBd	fsubd	%f48, %f0, %f58
	.word 0xbabd0000  ! 1632: XNORcc_R	xnorcc 	%r20, %r0, %r29
	.word 0xb3a54860  ! 1634: FADDq	dis not found

	.word 0xb57dc400  ! 1636: MOVR_R	movre	%r23, %r0, %r26
	.word 0xbda54820  ! 1638: FADDs	fadds	%f21, %f0, %f30
	.word 0xb1a5c860  ! 1639: FADDq	dis not found

	.word 0xbda44920  ! 1641: FMULs	fmuls	%f17, %f0, %f30
T1_asi_reg_wr_66:
	mov	0x3c8, %r14
	.word 0xfef38400  ! 1644: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb5a80420  ! 1647: FMOVRZ	dis not found

	.word 0xbfa80420  ! 1648: FMOVRZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_67:
	mov	0x3c8, %r14
	.word 0xf2f38e80  ! 1651: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbcb54000  ! 1654: SUBCcc_R	orncc 	%r21, %r0, %r30
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 28)
	.word 0xb5a50940  ! 1656: FMULd	fmuld	%f20, %f0, %f26
	.word 0xb635a0f1  ! 1657: ORN_I	orn 	%r22, 0x00f1, %r27
cpu_intr_1_146:
	setx	0x290203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00540  ! 1661: FSQRTd	fsqrt	
T1_asi_reg_rd_76:
	mov	0x38, %r14
	.word 0xfcdb89e0  ! 1663: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_1_147:
	setx	0x2a003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a488a0  ! 1667: FSUBs	fsubs	%f18, %f0, %f24
T1_asi_reg_rd_77:
	mov	0x9, %r14
	.word 0xfcdb84a0  ! 1668: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb28d4000  ! 1671: ANDcc_R	andcc 	%r21, %r0, %r25
	.word 0xb4bd6043  ! 1672: XNORcc_I	xnorcc 	%r21, 0x0043, %r26
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb1a90820  ! 1675: FMOVLEU	fmovs	%fcc1, %f0, %f24
cpu_intr_1_148:
	setx	0x2a002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00020  ! 1680: FMOVs	fmovs	%f0, %f26
T1_asi_reg_rd_78:
	mov	0x4, %r14
	.word 0xf0db8e40  ! 1681: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_149:
	setx	0x280102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab8820  ! 1687: FMOVPOS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_150:
	setx	0x2b003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_68:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 1693: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb7a589a0  ! 1697: FDIVs	fdivs	%f22, %f0, %f27
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_rd_79:
	mov	0x3c2, %r14
	.word 0xf2db8e80  ! 1703: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_rd_80:
	mov	0x3c8, %r14
	.word 0xfedb84a0  ! 1713: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T1_asi_reg_rd_81:
	mov	0x16, %r14
	.word 0xf4db8400  ! 1715: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_1_151:
	setx	0x29033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, c)
	.word 0xbfabc820  ! 1718: FMOVVC	fmovs	%fcc1, %f0, %f31
cpu_intr_1_152:
	setx	0x2b010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80420  ! 1727: FMOVRZ	dis not found

	.word 0xb7a54860  ! 1729: FADDq	dis not found

cpu_intr_1_153:
	setx	0x280004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80c20  ! 1734: FMOVRLZ	dis not found

	.word 0xb7a488e0  ! 1735: FSUBq	dis not found

T1_asi_reg_wr_69:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 1737: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_154:
	setx	0x290228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_wr_70:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 1744: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T1_asi_reg_wr_71:
	mov	0x6, %r14
	.word 0xf0f389e0  ! 1747: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb3a90820  ! 1749: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb88d4000  ! 1751: ANDcc_R	andcc 	%r21, %r0, %r28
	.word 0xb7a488c0  ! 1763: FSUBd	fsubd	%f18, %f0, %f58
	.word 0xbbab8820  ! 1769: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbda409a0  ! 1770: FDIVs	fdivs	%f16, %f0, %f30
	.word 0xb1a84820  ! 1771: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb1ab8820  ! 1775: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb1353001  ! 1776: SRLX_I	srlx	%r20, 0x0001, %r24
	.word 0xbfa588a0  ! 1778: FSUBs	fsubs	%f22, %f0, %f31
	.word 0xbba94820  ! 1779: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb1ab0820  ! 1782: FMOVGU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_82:
	mov	0x37, %r14
	.word 0xf8db8e40  ! 1785: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbfa90820  ! 1789: FMOVLEU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_155:
	setx	0x2a0026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_156:
	setx	0x290339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa8820  ! 1802: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb9ab8820  ! 1803: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb7a8c820  ! 1805: FMOVL	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_83:
	mov	0xe, %r14
	.word 0xfcdb8e40  ! 1806: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 35)
	.word 0xb1a4c8e0  ! 1815: FSUBq	dis not found

cpu_intr_1_157:
	setx	0x2b031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8ce1e9  ! 1819: ANDcc_I	andcc 	%r19, 0x01e9, %r29
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbda448a0  ! 1821: FSUBs	fsubs	%f17, %f0, %f30
	.word 0xb1a84820  ! 1823: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb7a81420  ! 1824: FMOVRNZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_84:
	mov	0x34, %r14
	.word 0xfadb8e40  ! 1831: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_158:
	setx	0x2d003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa8820  ! 1837: FMOVG	fmovs	%fcc1, %f0, %f24
cpu_intr_1_159:
	setx	0x2d0226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 33)
	.word 0xb92d3001  ! 1842: SLLX_I	sllx	%r20, 0x0001, %r28
	.word 0xb1a84820  ! 1843: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb5a00520  ! 1844: FSQRTs	fsqrt	
	.word 0xb5abc820  ! 1845: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb7a50840  ! 1847: FADDd	faddd	%f20, %f0, %f58
cpu_intr_1_160:
	setx	0x2c0001, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_85:
	mov	0x16, %r14
	.word 0xf4db84a0  ! 1850: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb735a001  ! 1851: SRL_I	srl 	%r22, 0x0001, %r27
	.word 0xb9a00520  ! 1853: FSQRTs	fsqrt	
cpu_intr_1_161:
	setx	0x2d0102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_162:
	setx	0x2e0138, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_86:
	mov	0x2f, %r14
	.word 0xf4db8e80  ! 1860: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_rd_87:
	mov	0x3c4, %r14
	.word 0xf4db8e80  ! 1866: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_1_163:
	setx	0x2c000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_72:
	mov	0x11, %r14
	.word 0xfcf389e0  ! 1875: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb9a589e0  ! 1877: FDIVq	dis not found

T1_asi_reg_wr_73:
	mov	0x26, %r14
	.word 0xfcf38e40  ! 1878: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_164:
	setx	0x2f0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa4820  ! 1880: FMOVNE	fmovs	%fcc1, %f0, %f29
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, c)
T1_asi_reg_rd_88:
	mov	0xc, %r14
	.word 0xfcdb89e0  ! 1883: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_165:
	setx	0x2f002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_74:
	mov	0x9, %r14
	.word 0xfaf384a0  ! 1887: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_1_166:
	setx	0x2f0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3643801  ! 1892: MOVcc_I	<illegal instruction>
cpu_intr_1_167:
	setx	0x2c0323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb1a50960  ! 1900: FMULq	dis not found

	.word 0xb3a80820  ! 1903: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb9a80c20  ! 1906: FMOVRLZ	dis not found

T1_asi_reg_rd_89:
	mov	0x35, %r14
	.word 0xfadb8400  ! 1911: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb5a98820  ! 1912: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xba44e0d2  ! 1914: ADDC_I	addc 	%r19, 0x00d2, %r29
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 11)
	.word 0xb8c4c000  ! 1919: ADDCcc_R	addccc 	%r19, %r0, %r28
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb7a80c20  ! 1925: FMOVRLZ	dis not found

cpu_intr_1_168:
	setx	0x2d012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb351c000  ! 1927: RDPR_TL	<illegal instruction>
cpu_intr_1_169:
	setx	0x2e0235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00520  ! 1933: FSQRTs	fsqrt	
	.word 0xbf34c000  ! 1934: SRL_R	srl 	%r19, %r0, %r31
	.word 0xb5a4c940  ! 1936: FMULd	fmuld	%f50, %f0, %f26
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 39)
	.word 0xbba84820  ! 1942: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbfa4c940  ! 1943: FMULd	fmuld	%f50, %f0, %f62
	.word 0xb9a81c20  ! 1944: FMOVRGEZ	dis not found

cpu_intr_1_170:
	setx	0x2d0115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_171:
	setx	0x2d0037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_172:
	setx	0x2f0231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_wr_75:
	mov	0x3c5, %r14
	.word 0xf0f38e80  ! 1951: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a00520  ! 1959: FSQRTs	fsqrt	
iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb3a40860  ! 1967: FADDq	dis not found

	.word 0xbfaa4820  ! 1969: FMOVNE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_173:
	setx	0x2e0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab8820  ! 1977: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb8c40000  ! 1978: ADDCcc_R	addccc 	%r16, %r0, %r28
cpu_intr_1_174:
	setx	0x2c012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_90:
	mov	0x2a, %r14
	.word 0xfadb84a0  ! 1981: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_wr_76:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 1982: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 1f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_91:
	mov	0x2b, %r14
	.word 0xf6db8e40  ! 1991: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_rd_92:
	mov	0x15, %r14
	.word 0xf2db8e80  ! 1993: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T1_asi_reg_wr_77:
	mov	0x3c0, %r14
	.word 0xf0f38e60  ! 1995: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	lda	[%r21 + %g0] 0xf0, %f2
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, d)
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_rd_93:
	mov	0x23, %r14
	.word 0xfedb8e60  ! 2001: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 1f)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a00540  ! 2007: FSQRTd	fsqrt	
	.word 0xb2b5c000  ! 2010: SUBCcc_R	orncc 	%r23, %r0, %r25
	.word 0xb8a5c000  ! 2011: SUBcc_R	subcc 	%r23, %r0, %r28
T1_asi_reg_wr_78:
	mov	0x27, %r14
	.word 0xfaf38e60  ! 2012: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb1a88820  ! 2015: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbba9c820  ! 2018: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb3a488e0  ! 2021: FSUBq	dis not found

cpu_intr_1_175:
	setx	0x2f0319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_176:
	setx	0x2c0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2346038  ! 2029: SUBC_I	orn 	%r17, 0x0038, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_79:
	mov	0x26, %r14
	.word 0xf4f38e80  ! 2033: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbfa44820  ! 2034: FADDs	fadds	%f17, %f0, %f31
	.word 0xbfa94820  ! 2035: FMOVCS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_177:
	setx	0x2f0323, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_80:
	mov	0x21, %r14
	.word 0xf2f38400  ! 2039: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9a4c940  ! 2042: FMULd	fmuld	%f50, %f0, %f28
	.word 0xb3a48960  ! 2043: FMULq	dis not found

cpu_intr_1_178:
	setx	0x2e0003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 34)
	.word 0xb9a80820  ! 2051: FMOVN	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_94:
	mov	0x8, %r14
	.word 0xf8db8e60  ! 2052: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb2154000  ! 2055: OR_R	or 	%r21, %r0, %r25
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_179:
	setx	0x2d0216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_rd_95:
	mov	0xf, %r14
	.word 0xfcdb8e80  ! 2061: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, d)
	.word 0xb2a5c000  ! 2065: SUBcc_R	subcc 	%r23, %r0, %r25
T1_asi_reg_wr_81:
	mov	0x3c8, %r14
	.word 0xf0f38e60  ! 2069: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb1aa8820  ! 2072: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xbdaa8820  ! 2075: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xbdab0820  ! 2082: FMOVGU	fmovs	%fcc1, %f0, %f30
cpu_intr_1_180:
	setx	0x2d022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aa8820  ! 2086: FMOVG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_96:
	mov	0x1f, %r14
	.word 0xf6db89e0  ! 2087: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T1_asi_reg_rd_97:
	mov	0x1b, %r14
	.word 0xf6db8e60  ! 2088: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb1abc820  ! 2093: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb7a84820  ! 2094: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb1ab0820  ! 2102: FMOVGU	fmovs	%fcc1, %f0, %f24
cpu_intr_1_181:
	setx	0x2f0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbea40000  ! 2106: SUBcc_R	subcc 	%r16, %r0, %r31
T1_asi_reg_wr_82:
	mov	0x15, %r14
	.word 0xfef38400  ! 2108: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T1_asi_reg_rd_98:
	mov	0x3c4, %r14
	.word 0xf6db84a0  ! 2109: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T1_asi_reg_rd_99:
	mov	0x3c3, %r14
	.word 0xf6db89e0  ! 2111: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_rd_100:
	mov	0x3c5, %r14
	.word 0xf8db8400  ! 2114: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T1_asi_reg_wr_83:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 2115: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb6c5e1db  ! 2118: ADDCcc_I	addccc 	%r23, 0x01db, %r27
	.word 0xb1a80c20  ! 2121: FMOVRLZ	dis not found

cpu_intr_1_182:
	setx	0x2e001c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_101:
	mov	0x29, %r14
	.word 0xf2db8e40  ! 2124: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb23ce12f  ! 2126: XNOR_I	xnor 	%r19, 0x012f, %r25
	.word 0xbba00540  ! 2133: FSQRTd	fsqrt	
	.word 0xbbabc820  ! 2134: FMOVVC	fmovs	%fcc1, %f0, %f29
cpu_intr_1_183:
	setx	0x2d0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c42056  ! 2141: ADDCcc_I	addccc 	%r16, 0x0056, %r28
cpu_intr_1_184:
	setx	0x2f0211, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 29)
	.word 0xb1a509e0  ! 2147: FDIVq	dis not found

	.word 0xbda44940  ! 2150: FMULd	fmuld	%f48, %f0, %f30
	.word 0xba2ce01e  ! 2153: ANDN_I	andn 	%r19, 0x001e, %r29
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb2bc0000  ! 2161: XNORcc_R	xnorcc 	%r16, %r0, %r25
	.word 0xb7a449c0  ! 2162: FDIVd	fdivd	%f48, %f0, %f58
	.word 0xb7aa0820  ! 2163: FMOVA	fmovs	%fcc1, %f0, %f27
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 12)
	.word 0xb1a5c960  ! 2171: FMULq	dis not found

T1_asi_reg_wr_84:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 2172: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbb3c1000  ! 2173: SRAX_R	srax	%r16, %r0, %r29
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_wr_85:
	mov	0x33, %r14
	.word 0xfef38e80  ! 2177: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_wr_86:
	mov	0x3, %r14
	.word 0xfef38400  ! 2179: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb1a48820  ! 2181: FADDs	fadds	%f18, %f0, %f24
	.word 0xbba81420  ! 2182: FMOVRNZ	dis not found

T1_asi_reg_wr_87:
	mov	0x10, %r14
	.word 0xf8f38400  ! 2184: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_1_185:
	setx	0x2f0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0bc20dc  ! 2187: XNORcc_I	xnorcc 	%r16, 0x00dc, %r24
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 30)
	.word 0xbfa50920  ! 2190: FMULs	fmuls	%f20, %f0, %f31
	.word 0xb5a84820  ! 2191: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb5a4c960  ! 2193: FMULq	dis not found

	.word 0xb7a5c8c0  ! 2194: FSUBd	fsubd	%f54, %f0, %f58
cpu_intr_1_186:
	setx	0x2c000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6954000  ! 2199: ORcc_R	orcc 	%r21, %r0, %r27
cpu_intr_1_187:
	setx	0x2c0121, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_188:
	setx	0x2e003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_189:
	setx	0x2c0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00520  ! 2204: FSQRTs	fsqrt	
	.word 0xb9aa0820  ! 2205: FMOVA	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 3)
	.word 0xb245614d  ! 2213: ADDC_I	addc 	%r21, 0x014d, %r25
	.word 0xb8844000  ! 2216: ADDcc_R	addcc 	%r17, %r0, %r28
	.word 0xb5a508a0  ! 2219: FSUBs	fsubs	%f20, %f0, %f26
T1_asi_reg_rd_102:
	mov	0x2, %r14
	.word 0xf6db8e40  ! 2224: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_wr_88:
	mov	0x23, %r14
	.word 0xf6f38e40  ! 2226: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_190:
	setx	0x2f0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c4209b  ! 2228: ADDCcc_I	addccc 	%r16, 0x009b, %r25
	.word 0xbba00560  ! 2229: FSQRTq	fsqrt	
T1_asi_reg_wr_89:
	mov	0x18, %r14
	.word 0xf6f38e60  ! 2230: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_rd_103:
	mov	0x22, %r14
	.word 0xf2db89e0  ! 2233: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb3a98820  ! 2234: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb9a4c9c0  ! 2235: FDIVd	fdivd	%f50, %f0, %f28
cpu_intr_1_191:
	setx	0x2d0028, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_104:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 2237: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_105:
	mov	0x31, %r14
	.word 0xf2db8e40  ! 2238: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbc94e09a  ! 2239: ORcc_I	orcc 	%r19, 0x009a, %r30
	.word 0xb9aa4820  ! 2245: FMOVNE	fmovs	%fcc1, %f0, %f28
	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_192:
	setx	0x2d033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_wr_90:
	mov	0x29, %r14
	.word 0xf2f38e80  ! 2251: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T1_asi_reg_rd_106:
	mov	0x7, %r14
	.word 0xf2db89e0  ! 2254: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb3a00540  ! 2257: FSQRTd	fsqrt	
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 6)
cpu_intr_1_193:
	setx	0x2e0231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_194:
	setx	0x2f011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 2263: RDPR_TL	<illegal instruction>
T1_asi_reg_rd_107:
	mov	0x29, %r14
	.word 0xf8db8e80  ! 2264: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 14)
	.word 0xb9aa0820  ! 2268: FMOVA	fmovs	%fcc1, %f0, %f28
cpu_intr_1_195:
	setx	0x2c031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 2273: RDPR_TNPC	<illegal instruction>
	.word 0xbfab4820  ! 2276: FMOVCC	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a40920  ! 2278: FMULs	fmuls	%f16, %f0, %f24
	.word 0xb1a408a0  ! 2279: FSUBs	fsubs	%f16, %f0, %f24
cpu_intr_1_196:
	setx	0x2f0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a588c0  ! 2282: FSUBd	fsubd	%f22, %f0, %f26
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb5a81820  ! 2285: FMOVRGZ	fmovs	%fcc3, %f0, %f26
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbfa80820  ! 2289: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_108:
	mov	0x17, %r14
	.word 0xf2db8e80  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T1_asi_reg_wr_91:
	mov	0x3c6, %r14
	.word 0xf4f389e0  ! 2293: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb1ab4820  ! 2297: FMOVCC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_197:
	setx	0x32031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c9c0  ! 2299: FDIVd	fdivd	%f50, %f0, %f30
	.word 0xb2a4e1e3  ! 2300: SUBcc_I	subcc 	%r19, 0x01e3, %r25
T1_asi_reg_rd_109:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 2303: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_rd_110:
	mov	0x3, %r14
	.word 0xf6db8e80  ! 2305: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_1_198:
	setx	0x310336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80420  ! 2308: FMOVRZ	dis not found

	.word 0xb5a84820  ! 2310: FMOVE	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7a81420  ! 2313: FMOVRNZ	dis not found

T1_asi_reg_rd_111:
	mov	0x25, %r14
	.word 0xfadb8e40  ! 2314: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb7a589a0  ! 2318: FDIVs	fdivs	%f22, %f0, %f27
cpu_intr_1_199:
	setx	0x330104, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_92:
	mov	0x6, %r14
	.word 0xf6f38e40  ! 2320: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_wr_93:
	mov	0x2a, %r14
	.word 0xf4f38e40  ! 2324: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 7)
iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, 32)
	.word 0xb5ab4820  ! 2328: FMOVCC	fmovs	%fcc1, %f0, %f26
cpu_intr_1_200:
	setx	0x310008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b44000  ! 2331: SUBCcc_R	orncc 	%r17, %r0, %r27
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 5)
	.word 0xbe24a060  ! 2345: SUB_I	sub 	%r18, 0x0060, %r31
cpu_intr_1_201:
	setx	0x330106, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_94:
	mov	0x3c1, %r14
	.word 0xf2f38e80  ! 2347: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 0)
	.word 0xb9a84820  ! 2352: FMOVE	fmovs	%fcc1, %f0, %f28
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_wr_95:
	mov	0x8, %r14
	.word 0xfaf384a0  ! 2361: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T1_asi_reg_rd_112:
	mov	0x2c, %r14
	.word 0xf4db8400  ! 2364: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T1_asi_reg_wr_96:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 2366: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_202:
	setx	0x320107, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, b)
iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, 22)
	.word 0xb7a549c0  ! 2379: FDIVd	fdivd	%f52, %f0, %f58
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 24)
	.word 0xb1a5c940  ! 2384: FMULd	fmuld	%f54, %f0, %f24
cpu_intr_1_203:
	setx	0x33002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_wr_97:
	mov	0x3c3, %r14
	.word 0xf4f384a0  ! 2394: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T1_asi_reg_wr_98:
	mov	0x33, %r14
	.word 0xf4f38e80  ! 2395: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 7)
	.word 0xbfaac820  ! 2398: FMOVGE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_99:
	mov	0x37, %r14
	.word 0xf2f38e40  ! 2399: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbda449e0  ! 2400: FDIVq	dis not found

cpu_intr_1_204:
	setx	0x320322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, 20)
	.word 0xb7a80820  ! 2403: FMOVN	fmovs	%fcc1, %f0, %f27
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, e)
	.word 0xb9a80820  ! 2406: FMOVN	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_113:
	mov	0x16, %r14
	.word 0xfcdb8400  ! 2407: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_rd_114:
	mov	0x1f, %r14
	.word 0xf0db8e80  ! 2408: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb5a80c20  ! 2410: FMOVRLZ	dis not found

T1_asi_reg_rd_115:
	mov	0x3c5, %r14
	.word 0xf6db8400  ! 2412: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_rd_116:
	mov	0xa, %r14
	.word 0xf2db84a0  ! 2415: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T1_asi_reg_wr_100:
	mov	0x2a, %r14
	.word 0xf0f384a0  ! 2416: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbda48840  ! 2418: FADDd	faddd	%f18, %f0, %f30
iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_rd_117:
	mov	0x3c3, %r14
	.word 0xf0db89e0  ! 2420: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T1_asi_reg_rd_118:
	mov	0xd, %r14
	.word 0xf2db8400  ! 2423: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbfa84820  ! 2430: FMOVE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_205:
	setx	0x32000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3ca001  ! 2433: SRA_I	sra 	%r18, 0x0001, %r29
	.word 0xb28d4000  ! 2434: ANDcc_R	andcc 	%r21, %r0, %r25
	.word 0xb7a4c8e0  ! 2436: FSUBq	dis not found

T1_asi_reg_wr_101:
	mov	0x18, %r14
	.word 0xfef38400  ! 2442: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb32ce001  ! 2443: SLL_I	sll 	%r19, 0x0001, %r25
cpu_intr_1_206:
	setx	0x33003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a94820  ! 2449: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xbba9c820  ! 2450: FMOVVS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_207:
	setx	0x310308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00520  ! 2455: FSQRTs	fsqrt	
	.word 0xbf540000  ! 2456: RDPR_GL	<illegal instruction>
cpu_intr_1_208:
	setx	0x330336, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_102:
	mov	0x3c8, %r14
	.word 0xfaf384a0  ! 2462: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_1_209:
	setx	0x300118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab8820  ! 2465: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb1aa0820  ! 2466: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb13c8000  ! 2467: SRA_R	sra 	%r18, %r0, %r24
	.word 0xb7a80820  ! 2469: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbc3c21af  ! 2472: XNOR_I	xnor 	%r16, 0x01af, %r30
T1_asi_reg_wr_103:
	mov	0x3c6, %r14
	.word 0xf6f38e80  ! 2473: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbfa81820  ! 2475: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb8148000  ! 2476: OR_R	or 	%r18, %r0, %r28
cpu_intr_1_210:
	setx	0x31020e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, 34)
	.word 0xb1a54840  ! 2486: FADDd	faddd	%f52, %f0, %f24
	.word 0xb12c5000  ! 2488: SLLX_R	sllx	%r17, %r0, %r24
	.word 0xbfa5c9e0  ! 2496: FDIVq	dis not found

	.word 0xbfa54840  ! 2497: FADDd	faddd	%f52, %f0, %f62
	.word 0xb9a00020  ! 2499: FMOVs	fmovs	%f0, %f28
cpu_intr_1_211:
	setx	0x31012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, d)
	.word 0xbda408c0  ! 2503: FSUBd	fsubd	%f16, %f0, %f30
	.word 0xb9abc820  ! 2504: FMOVVC	fmovs	%fcc1, %f0, %f28
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_212:
	setx	0x330302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa4820  ! 2509: FMOVNE	fmovs	%fcc1, %f0, %f30
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 24)
	.word 0xb40c8000  ! 2512: AND_R	and 	%r18, %r0, %r26
	.word 0xbba509a0  ! 2514: FDIVs	fdivs	%f20, %f0, %f29
	.word 0xb135e001  ! 2516: SRL_I	srl 	%r23, 0x0001, %r24
cpu_intr_1_213:
	setx	0x310126, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_119:
	mov	0x1b, %r14
	.word 0xf8db8e40  ! 2521: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb1a88820  ! 2526: FMOVLE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_104:
	mov	0x12, %r14
	.word 0xf6f38400  ! 2527: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 2)
	.word 0xb1a8c820  ! 2530: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xbda80c20  ! 2534: FMOVRLZ	dis not found

T1_asi_reg_wr_105:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 2537: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbab44000  ! 2538: SUBCcc_R	orncc 	%r17, %r0, %r29
	.word 0xbba488c0  ! 2541: FSUBd	fsubd	%f18, %f0, %f60
	.word 0xb7a48860  ! 2544: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_214:
	setx	0x300138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba4c820  ! 2548: FADDs	fadds	%f19, %f0, %f29
T1_asi_reg_rd_120:
	mov	0x3c1, %r14
	.word 0xf2db8e60  ! 2549: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T1_asi_reg_rd_121:
	mov	0x22, %r14
	.word 0xfcdb8400  ! 2550: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_wr_106:
	mov	0x3c2, %r14
	.word 0xfef38e80  ! 2552: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_wr_107:
	mov	0x1e, %r14
	.word 0xf8f38e60  ! 2556: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb5a5c8a0  ! 2560: FSUBs	fsubs	%f23, %f0, %f26
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 21)
	.word 0xbba54820  ! 2564: FADDs	fadds	%f21, %f0, %f29
	.word 0xbda588a0  ! 2567: FSUBs	fsubs	%f22, %f0, %f30
	.word 0xbbaa8820  ! 2569: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb7a48840  ! 2570: FADDd	faddd	%f18, %f0, %f58
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_rd_122:
	mov	0x14, %r14
	.word 0xf0db8e40  ! 2576: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbba9c820  ! 2581: FMOVVS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_108:
	mov	0x7, %r14
	.word 0xfaf389e0  ! 2588: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb7a489c0  ! 2595: FDIVd	fdivd	%f18, %f0, %f58
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, 34)
	.word 0xb5a81420  ! 2598: FMOVRNZ	dis not found

	.word 0xbda00520  ! 2599: FSQRTs	fsqrt	
	.word 0xb5a8c820  ! 2600: FMOVL	fmovs	%fcc1, %f0, %f26
cpu_intr_1_215:
	setx	0x33000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab8820  ! 2605: FMOVPOS	fmovs	%fcc1, %f0, %f28
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_216:
	setx	0x300019, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_217:
	setx	0x32033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_218:
	setx	0x33011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_109:
	mov	0x4, %r14
	.word 0xfef38e40  ! 2618: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_wr_110:
	mov	0x2, %r14
	.word 0xf6f389e0  ! 2623: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb7a5c8c0  ! 2627: FSUBd	fsubd	%f54, %f0, %f58
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 20)
	.word 0xbda4c8c0  ! 2636: FSUBd	fsubd	%f50, %f0, %f30
	.word 0xb805a193  ! 2638: ADD_I	add 	%r22, 0x0193, %r28
	.word 0xb5a5c960  ! 2642: FMULq	dis not found

cpu_intr_1_219:
	setx	0x320226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_220:
	setx	0x320334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87942126  ! 2651: WRPR_TT_I	wrpr	%r16, 0x0126, %tt
T1_asi_reg_rd_123:
	mov	0x4, %r14
	.word 0xf2db89e0  ! 2652: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 17)
	.word 0xb7a44820  ! 2662: FADDs	fadds	%f17, %f0, %f27
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_221:
	setx	0x320304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a589c0  ! 2667: FDIVd	fdivd	%f22, %f0, %f24
	.word 0xb9a9c820  ! 2668: FMOVVS	fmovs	%fcc1, %f0, %f28
cpu_intr_1_222:
	setx	0x300336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda90820  ! 2673: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb7a588a0  ! 2675: FSUBs	fsubs	%f22, %f0, %f27
cpu_intr_1_223:
	setx	0x300021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00540  ! 2678: FSQRTd	fsqrt	
iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_wr_111:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 2690: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbeb50000  ! 2691: ORNcc_R	orncc 	%r20, %r0, %r31
T1_asi_reg_rd_124:
	mov	0x11, %r14
	.word 0xfedb8e60  ! 2692: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_1_224:
	setx	0x31023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab8820  ! 2695: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a44940  ! 2696: FMULd	fmuld	%f48, %f0, %f26
T1_asi_reg_wr_112:
	mov	0x3c4, %r14
	.word 0xf8f38400  ! 2697: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb7a40860  ! 2698: FADDq	dis not found

	.word 0xb7a00540  ! 2699: FSQRTd	fsqrt	
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_225:
	setx	0x30013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_125:
	mov	0xc, %r14
	.word 0xfcdb89e0  ! 2704: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb12d3001  ! 2706: SLLX_I	sllx	%r20, 0x0001, %r24
cpu_intr_1_226:
	setx	0x300115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaac820  ! 2708: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb1a549e0  ! 2709: FDIVq	dis not found

	.word 0xbfa589e0  ! 2711: FDIVq	dis not found

	.word 0xbfaa8820  ! 2712: FMOVG	fmovs	%fcc1, %f0, %f31
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_227:
	setx	0x300114, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_113:
	mov	0x1c, %r14
	.word 0xf4f38e80  ! 2718: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb7a80c20  ! 2719: FMOVRLZ	dis not found

	.word 0xb3a80820  ! 2720: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb2354000  ! 2722: SUBC_R	orn 	%r21, %r0, %r25
	.word 0xb9aa8820  ! 2724: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb9480000  ! 2727: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
T1_asi_reg_wr_114:
	mov	0x33, %r14
	.word 0xf4f38e40  ! 2730: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb7a00520  ! 2732: FSQRTs	fsqrt	
	.word 0xb9a00040  ! 2734: FMOVd	fmovd	%f0, %f28
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xbebde123  ! 2736: XNORcc_I	xnorcc 	%r23, 0x0123, %r31
cpu_intr_1_228:
	setx	0x300023, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_115:
	mov	0x6, %r14
	.word 0xfef389e0  ! 2738: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_229:
	setx	0x34023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_230:
	setx	0x370109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80420  ! 2744: FMOVRZ	dis not found

T1_asi_reg_rd_126:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 2746: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb5a90820  ! 2747: FMOVLEU	fmovs	%fcc1, %f0, %f26
cpu_intr_1_231:
	setx	0x35031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 2)
	.word 0xbfa90820  ! 2754: FMOVLEU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_232:
	setx	0x360033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_233:
	setx	0x35032d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 22)
	lda	[%r18 + %g0] 0xf0, %f2
iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_234:
	setx	0x360311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 22)
	.word 0xb7a54920  ! 2771: FMULs	fmuls	%f21, %f0, %f27
cpu_intr_1_235:
	setx	0x370314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa4820  ! 2775: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb9a8c820  ! 2776: FMOVL	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_127:
	mov	0x20, %r14
	.word 0xf0db89e0  ! 2777: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbc94c000  ! 2778: ORcc_R	orcc 	%r19, %r0, %r30
	.word 0xbda5c9a0  ! 2779: FDIVs	fdivs	%f23, %f0, %f30
cpu_intr_1_236:
	setx	0x370017, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_116:
	mov	0x3c4, %r14
	.word 0xf6f38e80  ! 2783: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb7a58940  ! 2786: FMULd	fmuld	%f22, %f0, %f58
	.word 0xb69dc000  ! 2789: XORcc_R	xorcc 	%r23, %r0, %r27
	.word 0xbfa80420  ! 2790: FMOVRZ	dis not found

T1_asi_reg_wr_117:
	mov	0x36, %r14
	.word 0xf6f38e40  ! 2792: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 25)
	.word 0xbfa4c840  ! 2795: FADDd	faddd	%f50, %f0, %f62
T1_asi_reg_wr_118:
	mov	0x2d, %r14
	.word 0xf2f38e80  ! 2798: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xba95c000  ! 2799: ORcc_R	orcc 	%r23, %r0, %r29
	.word 0xb3a81820  ! 2802: FMOVRGZ	fmovs	%fcc3, %f0, %f25
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_rd_128:
	mov	0x1c, %r14
	.word 0xfcdb8e40  ! 2807: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb9a409c0  ! 2810: FDIVd	fdivd	%f16, %f0, %f28
	.word 0xb6054000  ! 2812: ADD_R	add 	%r21, %r0, %r27
	.word 0xb3aac820  ! 2814: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb08520b3  ! 2818: ADDcc_I	addcc 	%r20, 0x00b3, %r24
T1_asi_reg_wr_119:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 2819: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_237:
	setx	0x34001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a449c0  ! 2826: FDIVd	fdivd	%f48, %f0, %f56
cpu_intr_1_238:
	setx	0x36023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_129:
	mov	0xa, %r14
	.word 0xfcdb8e80  ! 2830: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb1a84820  ! 2835: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb0c5211d  ! 2839: ADDCcc_I	addccc 	%r20, 0x011d, %r24
	.word 0xbda4c8a0  ! 2841: FSUBs	fsubs	%f19, %f0, %f30
iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb81c60cf  ! 2847: XOR_I	xor 	%r17, 0x00cf, %r28
	.word 0xb1a409c0  ! 2848: FDIVd	fdivd	%f16, %f0, %f24
	.word 0xb7aa4820  ! 2849: FMOVNE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_120:
	mov	0x7, %r14
	.word 0xfef38e40  ! 2851: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbda00520  ! 2859: FSQRTs	fsqrt	
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_239:
	setx	0x350119, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_121:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 2864: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 22)
	.word 0xbfabc820  ! 2868: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb3a508a0  ! 2869: FSUBs	fsubs	%f20, %f0, %f25
	.word 0xb935b001  ! 2874: SRLX_I	srlx	%r22, 0x0001, %r28
	.word 0xb1ab0820  ! 2875: FMOVGU	fmovs	%fcc1, %f0, %f24
cpu_intr_1_240:
	setx	0x360304, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_130:
	mov	0x3c7, %r14
	.word 0xf4db84a0  ! 2883: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_1_241:
	setx	0x360132, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_131:
	mov	0x1, %r14
	.word 0xf8db89e0  ! 2885: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T1_asi_reg_wr_122:
	mov	0x21, %r14
	.word 0xf0f38e80  ! 2886: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbec50000  ! 2887: ADDCcc_R	addccc 	%r20, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_rd_132:
	mov	0x35, %r14
	.word 0xfadb8400  ! 2891: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_242:
	setx	0x340334, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_133:
	mov	0x1e, %r14
	.word 0xf4db8400  ! 2898: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb5a54860  ! 2900: FADDq	dis not found

T1_asi_reg_wr_123:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 2901: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb1a00520  ! 2902: FSQRTs	fsqrt	
cpu_intr_1_243:
	setx	0x36021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a508c0  ! 2910: FSUBd	fsubd	%f20, %f0, %f28
	.word 0xb7a00520  ! 2911: FSQRTs	fsqrt	
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 14)
	.word 0xbda4c940  ! 2913: FMULd	fmuld	%f50, %f0, %f30
	.word 0xbba00560  ! 2914: FSQRTq	fsqrt	
T1_asi_reg_rd_134:
	mov	0x15, %r14
	.word 0xf0db8e40  ! 2917: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_rd_135:
	mov	0x21, %r14
	.word 0xfcdb8400  ! 2921: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb9a00560  ! 2922: FSQRTq	fsqrt	
cpu_intr_1_244:
	setx	0x35021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_245:
	setx	0x36023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_124:
	mov	0x31, %r14
	.word 0xf2f389e0  ! 2926: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb7a00560  ! 2931: FSQRTq	fsqrt	
	.word 0xb535f001  ! 2932: SRLX_I	srlx	%r23, 0x0001, %r26
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 26)
	.word 0xb9a00520  ! 2936: FSQRTs	fsqrt	
T1_asi_reg_rd_136:
	mov	0x32, %r14
	.word 0xfedb8e60  ! 2938: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbda44940  ! 2939: FMULd	fmuld	%f48, %f0, %f30
	.word 0xb7a409a0  ! 2941: FDIVs	fdivs	%f16, %f0, %f27
	.word 0xb7a54840  ! 2945: FADDd	faddd	%f52, %f0, %f58
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_246:
	setx	0x360307, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_137:
	mov	0x15, %r14
	.word 0xf2db8e40  ! 2949: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1a408e0  ! 2952: FSUBq	dis not found

cpu_intr_1_247:
	setx	0x340131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a509e0  ! 2956: FDIVq	dis not found

iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 1)
	.word 0xbdabc820  ! 2958: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb3a44860  ! 2959: FADDq	dis not found

	.word 0xbfa00520  ! 2960: FSQRTs	fsqrt	
	.word 0xb3ab8820  ! 2961: FMOVPOS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_248:
	setx	0x360113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba409c0  ! 2967: FDIVd	fdivd	%f16, %f0, %f60
	.word 0xb1a548a0  ! 2968: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xb5aa0820  ! 2969: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbfa81820  ! 2970: FMOVRGZ	fmovs	%fcc3, %f0, %f31
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 35)
	.word 0xb9a5c8e0  ! 2972: FSUBq	dis not found

	.word 0xb1a50960  ! 2976: FMULq	dis not found

cpu_intr_1_249:
	setx	0x370213, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_wr_125:
	mov	0x2, %r14
	.word 0xf6f389e0  ! 2981: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_rd_138:
	mov	0x3c6, %r14
	.word 0xf0db89e0  ! 2983: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_250:
	setx	0x340104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c840  ! 2994: FADDd	faddd	%f50, %f0, %f26
	.word 0xb7a88820  ! 2996: FMOVLE	fmovs	%fcc1, %f0, %f27
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_rd_139:
	mov	0x17, %r14
	.word 0xfadb8e60  ! 3004: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb7a00560  ! 3006: FSQRTq	fsqrt	
	.word 0xbfa84820  ! 3008: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a00560  ! 3009: FSQRTq	fsqrt	
	.word 0xb9a54940  ! 3011: FMULd	fmuld	%f52, %f0, %f28
	.word 0xbfab0820  ! 3013: FMOVGU	fmovs	%fcc1, %f0, %f31
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_wr_126:
	mov	0x3c4, %r14
	.word 0xf2f384a0  ! 3015: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_1_251:
	setx	0x350005, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_140:
	mov	0x20, %r14
	.word 0xf4db8e40  ! 3019: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_252:
	setx	0x360326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81820  ! 3021: FMOVRGZ	fmovs	%fcc3, %f0, %f30
iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 19)
	.word 0xb9a448e0  ! 3025: FSUBq	dis not found

cpu_intr_1_253:
	setx	0x360020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00520  ! 3036: FSQRTs	fsqrt	
T1_asi_reg_wr_127:
	mov	0x1c, %r14
	.word 0xf0f389e0  ! 3039: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_254:
	setx	0x360132, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_141:
	mov	0x9, %r14
	.word 0xfedb8400  ! 3044: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T1_asi_reg_wr_128:
	mov	0x32, %r14
	.word 0xf8f38e80  ! 3045: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb7a54940  ! 3047: FMULd	fmuld	%f52, %f0, %f58
cpu_intr_1_255:
	setx	0x370239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a90820  ! 3049: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb7a94820  ! 3050: FMOVCS	fmovs	%fcc1, %f0, %f27
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_256:
	setx	0x370230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab0820  ! 3054: FMOVGU	fmovs	%fcc1, %f0, %f28
cpu_intr_1_257:
	setx	0x37010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 10)
	.word 0xb5a00020  ! 3058: FMOVs	fmovs	%f0, %f26
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 23)
	.word 0xbda80820  ! 3060: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
cpu_intr_1_258:
	setx	0x35030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_129:
	mov	0x3c3, %r14
	.word 0xf2f38400  ! 3063: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbda00020  ! 3064: FMOVs	fmovs	%f0, %f30
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb5a508c0  ! 3068: FSUBd	fsubd	%f20, %f0, %f26
T1_asi_reg_wr_130:
	mov	0xf, %r14
	.word 0xfaf38400  ! 3072: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_142:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 3078: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_rd_143:
	mov	0x1, %r14
	.word 0xfedb89e0  ! 3080: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_rd_144:
	mov	0x35, %r14
	.word 0xfadb84a0  ! 3082: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb0350000  ! 3083: ORN_R	orn 	%r20, %r0, %r24
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, a)
	.word 0xb1a549e0  ! 3089: FDIVq	dis not found

	.word 0xb5a44940  ! 3092: FMULd	fmuld	%f48, %f0, %f26
	.word 0xbc144000  ! 3097: OR_R	or 	%r17, %r0, %r30
	.word 0xb834c000  ! 3098: ORN_R	orn 	%r19, %r0, %r28
T1_asi_reg_rd_145:
	mov	0x3c4, %r14
	.word 0xf4db84a0  ! 3102: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb7a9c820  ! 3104: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb885e098  ! 3105: ADDcc_I	addcc 	%r23, 0x0098, %r28
	.word 0xb3a98820  ! 3106: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xbcace10c  ! 3107: ANDNcc_I	andncc 	%r19, 0x010c, %r30
	.word 0xbda80820  ! 3109: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_259:
	setx	0x35032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2844000  ! 3114: ADDcc_R	addcc 	%r17, %r0, %r25
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_rd_146:
	mov	0x10, %r14
	.word 0xfcdb84a0  ! 3119: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T1_asi_reg_wr_131:
	mov	0x2e, %r14
	.word 0xf4f384a0  ! 3120: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb1a8c820  ! 3126: FMOVL	fmovs	%fcc1, %f0, %f24
cpu_intr_1_260:
	setx	0x36031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda408c0  ! 3128: FSUBd	fsubd	%f16, %f0, %f30
cpu_intr_1_261:
	setx	0x36012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81420  ! 3132: FMOVRNZ	dis not found

	.word 0xbfa5c940  ! 3136: FMULd	fmuld	%f54, %f0, %f62
cpu_intr_1_262:
	setx	0x360223, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_132:
	mov	0x28, %r14
	.word 0xf0f38400  ! 3139: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb7aa8820  ! 3141: FMOVG	fmovs	%fcc1, %f0, %f27
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_263:
	setx	0x37020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_133:
	mov	0x10, %r14
	.word 0xf8f38400  ! 3150: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_rd_147:
	mov	0x1b, %r14
	.word 0xf0db8e80  ! 3152: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T1_asi_reg_wr_134:
	mov	0x3c1, %r14
	.word 0xf0f38400  ! 3153: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb5abc820  ! 3155: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb7a81420  ! 3158: FMOVRNZ	dis not found

	.word 0xb2248000  ! 3159: SUB_R	sub 	%r18, %r0, %r25
	.word 0xbbabc820  ! 3162: FMOVVC	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_135:
	mov	0x36, %r14
	.word 0xf2f38400  ! 3164: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb9a98820  ! 3165: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb1a9c820  ! 3166: FMOVVS	fmovs	%fcc1, %f0, %f24
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbda40920  ! 3173: FMULs	fmuls	%f16, %f0, %f30
	.word 0xbda80820  ! 3174: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbda48820  ! 3178: FADDs	fadds	%f18, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_264:
	setx	0x36033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00560  ! 3183: FSQRTq	fsqrt	
cpu_intr_1_265:
	setx	0x37010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a409c0  ! 3193: FDIVd	fdivd	%f16, %f0, %f58
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_266:
	setx	0x34020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81c20  ! 3197: FMOVRGEZ	dis not found

	.word 0xb1ab8820  ! 3199: FMOVPOS	fmovs	%fcc1, %f0, %f24
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_rd_148:
	mov	0xf, %r14
	.word 0xf8db8e80  ! 3205: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb7a8c820  ! 3211: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb5a00540  ! 3212: FSQRTd	fsqrt	
	.word 0xbba50820  ! 3213: FADDs	fadds	%f20, %f0, %f29
T1_asi_reg_wr_136:
	mov	0x5, %r14
	.word 0xf8f38400  ! 3216: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xba95e163  ! 3221: ORcc_I	orcc 	%r23, 0x0163, %r29
	.word 0xb5a80c20  ! 3222: FMOVRLZ	dis not found

	.word 0xb3a4c8e0  ! 3226: FSUBq	dis not found

	.word 0xa1902002  ! 3227: WRPR_GL_I	wrpr	%r0, 0x0002, %-
T1_asi_reg_wr_137:
	mov	0x3, %r14
	.word 0xfcf38e40  ! 3229: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb1a80420  ! 3230: FMOVRZ	dis not found

cpu_intr_1_267:
	setx	0x39033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00020  ! 3232: FMOVs	fmovs	%f0, %f30
cpu_intr_1_268:
	setx	0x3b0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba48820  ! 3236: FADDs	fadds	%f18, %f0, %f29
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb5aac820  ! 3241: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xbba488e0  ! 3242: FSUBq	dis not found

	.word 0xbba408c0  ! 3243: FSUBd	fsubd	%f16, %f0, %f60
	.word 0xb7a00520  ! 3245: FSQRTs	fsqrt	
cpu_intr_1_269:
	setx	0x3a0201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_270:
	setx	0x390333, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_138:
	mov	0x2b, %r14
	.word 0xf8f38400  ! 3250: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbba00560  ! 3256: FSQRTq	fsqrt	
	.word 0xb2a40000  ! 3257: SUBcc_R	subcc 	%r16, %r0, %r25
	.word 0xb3abc820  ! 3258: FMOVVC	fmovs	%fcc1, %f0, %f25
iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb1a80420  ! 3263: FMOVRZ	dis not found

cpu_intr_1_271:
	setx	0x3b002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab8820  ! 3265: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb435c000  ! 3266: ORN_R	orn 	%r23, %r0, %r26
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 3d)
T1_asi_reg_wr_139:
	mov	0x1, %r14
	.word 0xfcf384a0  ! 3270: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbb345000  ! 3271: SRLX_R	srlx	%r17, %r0, %r29
	.word 0xb6ac218e  ! 3272: ANDNcc_I	andncc 	%r16, 0x018e, %r27
	.word 0xbfaa0820  ! 3275: FMOVA	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_140:
	mov	0x3c1, %r14
	.word 0xfaf389e0  ! 3278: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb6b5e1ad  ! 3279: ORNcc_I	orncc 	%r23, 0x01ad, %r27
	.word 0xb1a94820  ! 3280: FMOVCS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_141:
	mov	0x31, %r14
	.word 0xfaf38400  ! 3282: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_rd_149:
	mov	0x21, %r14
	.word 0xf6db84a0  ! 3283: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	lda	[%r18 + %g0] 0xf0, %f2
cpu_intr_1_272:
	setx	0x3a0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x89946113  ! 3289: WRPR_TICK_I	wrpr	%r17, 0x0113, %tick
	.word 0xbfa84820  ! 3299: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbba81c20  ! 3301: FMOVRGEZ	dis not found

	.word 0xbda80c20  ! 3303: FMOVRLZ	dis not found

	.word 0xb3a40920  ! 3304: FMULs	fmuls	%f16, %f0, %f25
T1_asi_reg_wr_142:
	mov	0x8, %r14
	.word 0xf6f38e40  ! 3306: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_273:
	setx	0x39033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a9c820  ! 3308: FMOVVS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_143:
	mov	0x12, %r14
	.word 0xfcf389e0  ! 3309: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb5a58920  ! 3310: FMULs	fmuls	%f22, %f0, %f26
	.word 0xbcb521e9  ! 3312: SUBCcc_I	orncc 	%r20, 0x01e9, %r30
cpu_intr_1_274:
	setx	0x380029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_275:
	setx	0x380223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab4820  ! 3316: FMOVCC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_144:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 3318: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbda4c9c0  ! 3321: FDIVd	fdivd	%f50, %f0, %f30
cpu_intr_1_276:
	setx	0x3a0027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_277:
	setx	0x380038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a88820  ! 3326: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb1a48960  ! 3329: FMULq	dis not found

iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_278:
	setx	0x380101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab4820  ! 3338: FMOVCC	fmovs	%fcc1, %f0, %f25
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb5a81820  ! 3341: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbba40940  ! 3342: FMULd	fmuld	%f16, %f0, %f60
T1_asi_reg_wr_145:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 3344: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_279:
	setx	0x3b0019, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_150:
	mov	0x2b, %r14
	.word 0xfadb8e80  ! 3350: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_rd_151:
	mov	0x3, %r14
	.word 0xf0db89e0  ! 3353: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb5aa8820  ! 3355: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xbba88820  ! 3357: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xbba449e0  ! 3361: FDIVq	dis not found

	.word 0xbfabc820  ! 3362: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb9a448c0  ! 3367: FSUBd	fsubd	%f48, %f0, %f28
	.word 0xbba589a0  ! 3369: FDIVs	fdivs	%f22, %f0, %f29
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 6)
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_280:
	setx	0x3b001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_152:
	mov	0xd, %r14
	.word 0xf6db8e40  ! 3377: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfa40960  ! 3380: FMULq	dis not found

cpu_intr_1_281:
	setx	0x3a011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_282:
	setx	0x390033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b44000  ! 3388: SUBCcc_R	orncc 	%r17, %r0, %r24
T1_asi_reg_wr_146:
	mov	0x3c6, %r14
	.word 0xfcf38400  ! 3390: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T1_asi_reg_rd_153:
	mov	0x2a, %r14
	.word 0xfadb89e0  ! 3394: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb89c4000  ! 3397: XORcc_R	xorcc 	%r17, %r0, %r28
cpu_intr_1_283:
	setx	0x3b022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_154:
	mov	0x18, %r14
	.word 0xf4db8e40  ! 3402: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_147:
	mov	0x1a, %r14
	.word 0xf8f389e0  ! 3403: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb5643801  ! 3404: MOVcc_I	<illegal instruction>
	.word 0xbba84820  ! 3405: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb3ab0820  ! 3406: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb5a00560  ! 3407: FSQRTq	fsqrt	
T1_asi_reg_rd_155:
	mov	0x3c1, %r14
	.word 0xf6db89e0  ! 3408: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, f)
iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_wr_148:
	mov	0x1f, %r14
	.word 0xf2f38e60  ! 3412: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xba85a0b7  ! 3413: ADDcc_I	addcc 	%r22, 0x00b7, %r29
	.word 0xb3a98820  ! 3414: FMOVNEG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_156:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 3418: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_1_284:
	setx	0x3a0103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, c)
	.word 0xb9a00540  ! 3423: FSQRTd	fsqrt	
	.word 0xb6c58000  ! 3427: ADDCcc_R	addccc 	%r22, %r0, %r27
	.word 0xb9a80c20  ! 3431: FMOVRLZ	dis not found

cpu_intr_1_285:
	setx	0x38003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_286:
	setx	0x380119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_287:
	setx	0x3a0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a589e0  ! 3436: FDIVq	dis not found

cpu_intr_1_288:
	setx	0x380304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_wr_149:
	mov	0x15, %r14
	.word 0xfaf389e0  ! 3442: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_289:
	setx	0x3b021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a88820  ! 3447: FMOVLE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_150:
	mov	0x10, %r14
	.word 0xf6f38e80  ! 3452: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb9a8c820  ! 3454: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb3a548e0  ! 3456: FSUBq	dis not found

iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 1)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_rd_157:
	mov	0xc, %r14
	.word 0xfedb84a0  ! 3467: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 29)
	.word 0xba3ce115  ! 3477: XNOR_I	xnor 	%r19, 0x0115, %r29
	.word 0xb7a50820  ! 3478: FADDs	fadds	%f20, %f0, %f27
cpu_intr_1_290:
	setx	0x3a0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a44860  ! 3482: FADDq	dis not found

iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_291:
	setx	0x380312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab4820  ! 3486: FMOVCC	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_151:
	mov	0x13, %r14
	.word 0xf0f384a0  ! 3487: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_1_292:
	setx	0x3b0303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_293:
	setx	0x39022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab8820  ! 3492: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbda81420  ! 3495: FMOVRNZ	dis not found

	.word 0xb9a00540  ! 3498: FSQRTd	fsqrt	
	.word 0xbead20bf  ! 3499: ANDNcc_I	andncc 	%r20, 0x00bf, %r31
cpu_intr_1_294:
	setx	0x3a032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_158:
	mov	0x20, %r14
	.word 0xf0db8400  ! 3505: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_1_295:
	setx	0x390316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_296:
	setx	0x38022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba45606c  ! 3509: ADDC_I	addc 	%r21, 0x006c, %r29
	.word 0xb7a40920  ! 3510: FMULs	fmuls	%f16, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbb643801  ! 3517: MOVcc_I	<illegal instruction>
cpu_intr_1_297:
	setx	0x3a001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80820  ! 3523: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb7a00540  ! 3524: FSQRTd	fsqrt	
	.word 0xb7a408c0  ! 3528: FSUBd	fsubd	%f16, %f0, %f58
	.word 0xbda81820  ! 3529: FMOVRGZ	fmovs	%fcc3, %f0, %f30
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 34)
	.word 0xb1a80820  ! 3533: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb7aac820  ! 3534: FMOVGE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_159:
	mov	0x19, %r14
	.word 0xf6db8e40  ! 3535: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbda449a0  ! 3541: FDIVs	fdivs	%f17, %f0, %f30
cpu_intr_1_298:
	setx	0x3a030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81420  ! 3544: FMOVRNZ	dis not found

	.word 0xbba00560  ! 3547: FSQRTq	fsqrt	
	.word 0xbbaa8820  ! 3549: FMOVG	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_299:
	setx	0x390023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_300:
	setx	0x3a0128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda48960  ! 3560: FMULq	dis not found

	.word 0xb7aa0820  ! 3565: FMOVA	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_160:
	mov	0x3c8, %r14
	.word 0xfedb8e60  ! 3567: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb7a58860  ! 3568: FADDq	dis not found

	.word 0xbfa50920  ! 3570: FMULs	fmuls	%f20, %f0, %f31
	.word 0xb9a00520  ! 3571: FSQRTs	fsqrt	
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb7a00020  ! 3576: FMOVs	fmovs	%f0, %f27
	.word 0xbd35b001  ! 3579: SRLX_I	srlx	%r22, 0x0001, %r30
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 0)
	.word 0xb3a488a0  ! 3583: FSUBs	fsubs	%f18, %f0, %f25
	.word 0xb1a81420  ! 3584: FMOVRNZ	dis not found

	.word 0xb9a00040  ! 3585: FMOVd	fmovd	%f0, %f28
T1_asi_reg_wr_152:
	mov	0x3c7, %r14
	.word 0xfef38e80  ! 3586: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb1a48940  ! 3587: FMULd	fmuld	%f18, %f0, %f24
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 30)
	.word 0xbbaa0820  ! 3596: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb5aa4820  ! 3599: FMOVNE	fmovs	%fcc1, %f0, %f26
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_rd_161:
	mov	0x37, %r14
	.word 0xf0db89e0  ! 3601: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T1_asi_reg_rd_162:
	mov	0x28, %r14
	.word 0xfadb8e80  ! 3602: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb7ab8820  ! 3606: FMOVPOS	fmovs	%fcc1, %f0, %f27
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 8)
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_301:
	setx	0x3b021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb434607b  ! 3614: SUBC_I	orn 	%r17, 0x007b, %r26
	.word 0xb32de001  ! 3615: SLL_I	sll 	%r23, 0x0001, %r25
T1_asi_reg_wr_153:
	mov	0x26, %r14
	.word 0xf8f384a0  ! 3617: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbba5c840  ! 3618: FADDd	faddd	%f54, %f0, %f60
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_wr_154:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 3623: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_1_302:
	setx	0x380309, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_303:
	setx	0x38013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01d618d  ! 3630: XOR_I	xor 	%r21, 0x018d, %r24
	.word 0xbdab4820  ! 3631: FMOVCC	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_163:
	mov	0xe, %r14
	.word 0xf4db8e40  ! 3632: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_155:
	mov	0x3c8, %r14
	.word 0xf2f38e60  ! 3634: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb7a448e0  ! 3635: FSUBq	dis not found

T1_asi_reg_rd_164:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 3636: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, a)
	.word 0xb7352001  ! 3641: SRL_I	srl 	%r20, 0x0001, %r27
	.word 0xb9a548a0  ! 3643: FSUBs	fsubs	%f21, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb4954000  ! 3645: ORcc_R	orcc 	%r21, %r0, %r26
T1_asi_reg_wr_156:
	mov	0x2a, %r14
	.word 0xf8f38e40  ! 3646: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbfaa8820  ! 3648: FMOVG	fmovs	%fcc1, %f0, %f31
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, f)
	.word 0xb3aac820  ! 3654: FMOVGE	fmovs	%fcc1, %f0, %f25
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_rd_165:
	mov	0x3c2, %r14
	.word 0xf8db8e60  ! 3657: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb3a44860  ! 3660: FADDq	dis not found

	.word 0xb1a40820  ! 3662: FADDs	fadds	%f16, %f0, %f24
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 31)
	.word 0xb5a88820  ! 3671: FMOVLE	fmovs	%fcc1, %f0, %f26
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, a)
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_304:
	setx	0x3e0117, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_wr_157:
	mov	0x23, %r14
	.word 0xfcf38e40  ! 3684: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_305:
	setx	0x3f0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8354000  ! 3687: ORN_R	orn 	%r21, %r0, %r28
	.word 0xbba90820  ! 3691: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xbba00520  ! 3692: FSQRTs	fsqrt	
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_306:
	setx	0x3e023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe95e033  ! 3696: ORcc_I	orcc 	%r23, 0x0033, %r31
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_wr_158:
	mov	0x31, %r14
	.word 0xfef38e80  ! 3698: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb1a54840  ! 3700: FADDd	faddd	%f52, %f0, %f24
	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_307:
	setx	0x3d002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c840  ! 3704: FADDd	faddd	%f50, %f0, %f62
	.word 0xbfa589c0  ! 3705: FDIVd	fdivd	%f22, %f0, %f62
cpu_intr_1_308:
	setx	0x3d011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_309:
	setx	0x3e0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a48840  ! 3714: FADDd	faddd	%f18, %f0, %f58
cpu_intr_1_310:
	setx	0x3c0218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c8a0  ! 3718: FSUBs	fsubs	%f23, %f0, %f29
cpu_intr_1_311:
	setx	0x3f0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_166:
	mov	0x20, %r14
	.word 0xf8db8e80  ! 3721: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbda00560  ! 3723: FSQRTq	fsqrt	
T1_asi_reg_rd_167:
	mov	0x23, %r14
	.word 0xfedb89e0  ! 3728: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbda4c9a0  ! 3731: FDIVs	fdivs	%f19, %f0, %f30
	.word 0xb1a58920  ! 3734: FMULs	fmuls	%f22, %f0, %f24
	.word 0xb445c000  ! 3735: ADDC_R	addc 	%r23, %r0, %r26
cpu_intr_1_312:
	setx	0x3f0016, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_159:
	mov	0x3c8, %r14
	.word 0xf2f389e0  ! 3745: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_wr_160:
	mov	0x2, %r14
	.word 0xf0f38e60  ! 3747: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_wr_161:
	mov	0x21, %r14
	.word 0xf2f38e40  ! 3749: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_wr_162:
	mov	0x22, %r14
	.word 0xfef389e0  ! 3753: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5aa4820  ! 3761: FMOVNE	fmovs	%fcc1, %f0, %f26
iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 37)
	.word 0xb7a84820  ! 3763: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb334f001  ! 3766: SRLX_I	srlx	%r19, 0x0001, %r25
cpu_intr_1_313:
	setx	0x3f010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbda81c20  ! 3775: FMOVRGEZ	dis not found

T1_asi_reg_wr_163:
	mov	0x3c4, %r14
	.word 0xfaf38400  ! 3780: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_1_314:
	setx	0x3e0132, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_168:
	mov	0x15, %r14
	.word 0xfcdb89e0  ! 3784: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb1a00540  ! 3788: FSQRTd	fsqrt	
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, 5)
	.word 0xb5a9c820  ! 3792: FMOVVS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_169:
	mov	0x3c2, %r14
	.word 0xfedb8400  ! 3795: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbba50820  ! 3797: FADDs	fadds	%f20, %f0, %f29
cpu_intr_1_315:
	setx	0x3f0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a548a0  ! 3802: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xb5a489c0  ! 3803: FDIVd	fdivd	%f18, %f0, %f26
	.word 0xbe0ca193  ! 3804: AND_I	and 	%r18, 0x0193, %r31
	.word 0xbda00520  ! 3806: FSQRTs	fsqrt	
	.word 0xbeb5e17a  ! 3812: SUBCcc_I	orncc 	%r23, 0x017a, %r31
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xb5aa8820  ! 3817: FMOVG	fmovs	%fcc1, %f0, %f26
iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb3a00560  ! 3825: FSQRTq	fsqrt	
	.word 0xbc842041  ! 3827: ADDcc_I	addcc 	%r16, 0x0041, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbe9c4000  ! 3829: XORcc_R	xorcc 	%r17, %r0, %r31
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 1f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_170:
	mov	0x1c, %r14
	.word 0xf8db8e40  ! 3839: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb1a50840  ! 3840: FADDd	faddd	%f20, %f0, %f24
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 11)
	.word 0xbba00560  ! 3845: FSQRTq	fsqrt	
	.word 0xbfa50920  ! 3849: FMULs	fmuls	%f20, %f0, %f31
	.word 0xbda81c20  ! 3852: FMOVRGEZ	dis not found

	.word 0xb7a408e0  ! 3853: FSUBq	dis not found

	.word 0xb8b54000  ! 3856: ORNcc_R	orncc 	%r21, %r0, %r28
T1_asi_reg_wr_164:
	mov	0x3c4, %r14
	.word 0xf0f38400  ! 3859: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_1_316:
	setx	0x3d0109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 11)
	.word 0xb6b420eb  ! 3866: SUBCcc_I	orncc 	%r16, 0x00eb, %r27
	.word 0xbda80820  ! 3868: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 36)
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 7)
	.word 0xb7a44920  ! 3880: FMULs	fmuls	%f17, %f0, %f27
	lda	[%r17 + %g0] 0xf0, %f2
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 21)
	.word 0xb9aa8820  ! 3886: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb1a00560  ! 3889: FSQRTq	fsqrt	
	.word 0xbfa00020  ! 3892: FMOVs	fmovs	%f0, %f31
	.word 0xb80ca030  ! 3894: AND_I	and 	%r18, 0x0030, %r28
cpu_intr_1_317:
	setx	0x3c012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b54000  ! 3898: ORNcc_R	orncc 	%r21, %r0, %r24
cpu_intr_1_318:
	setx	0x3d0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b42006  ! 3900: ORNcc_I	orncc 	%r16, 0x0006, %r28
	.word 0xb4a5e158  ! 3901: SUBcc_I	subcc 	%r23, 0x0158, %r26
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, d)
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 33)
	.word 0xb3a508a0  ! 3910: FSUBs	fsubs	%f20, %f0, %f25
T1_asi_reg_rd_171:
	mov	0x3c8, %r14
	.word 0xf4db84a0  ! 3911: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb6aca0c6  ! 3915: ANDNcc_I	andncc 	%r18, 0x00c6, %r27
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 2)
	.word 0xbba9c820  ! 3919: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb9a80820  ! 3920: FMOVN	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_165:
	mov	0x1c, %r14
	.word 0xf4f384a0  ! 3921: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 5)
	.word 0xb9a409a0  ! 3931: FDIVs	fdivs	%f16, %f0, %f28
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_wr_166:
	mov	0x24, %r14
	.word 0xfaf38e60  ! 3938: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbe340000  ! 3940: ORN_R	orn 	%r16, %r0, %r31
cpu_intr_1_319:
	setx	0x3d011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_167:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 3949: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb9a80420  ! 3961: FMOVRZ	dis not found

iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb3a00540  ! 3963: FSQRTd	fsqrt	
	.word 0xb1ab4820  ! 3965: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb1a00540  ! 3968: FSQRTd	fsqrt	
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, b)
	.word 0xbda9c820  ! 3976: FMOVVS	fmovs	%fcc1, %f0, %f30
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_320:
	setx	0x3d022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_172:
	mov	0x1c, %r14
	.word 0xfcdb8e40  ! 3981: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_321:
	setx	0x3f011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 3987: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 24)
	.word 0xb3a98820  ! 3990: FMOVNEG	fmovs	%fcc1, %f0, %f25
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb9aa8820  ! 3993: FMOVG	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_168:
	mov	0xa, %r14
	.word 0xf0f389e0  ! 3995: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb7ab4820  ! 3999: FMOVCC	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_169:
	mov	0x3c5, %r14
	.word 0xf6f38e80  ! 4000: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbda81c20  ! 4001: FMOVRGEZ	dis not found

	.word 0xb23ca15d  ! 4002: XNOR_I	xnor 	%r18, 0x015d, %r25
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb68de10c  ! 4006: ANDcc_I	andcc 	%r23, 0x010c, %r27
	.word 0xb29dc000  ! 4008: XORcc_R	xorcc 	%r23, %r0, %r25
T1_asi_reg_wr_170:
	mov	0x19, %r14
	.word 0xf4f38e80  ! 4009: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_1_322:
	setx	0x3d013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcac4000  ! 4012: ANDNcc_R	andncc 	%r17, %r0, %r30
cpu_intr_1_323:
	setx	0x3d020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_173:
	mov	0x3c2, %r14
	.word 0xfedb8e80  ! 4015: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbfa81420  ! 4018: FMOVRNZ	dis not found

	.word 0x85952029  ! 4019: WRPR_TSTATE_I	wrpr	%r20, 0x0029, %tstate
	.word 0xb7a84820  ! 4021: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb1ab4820  ! 4022: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xbda00020  ! 4028: FMOVs	fmovs	%f0, %f30
	.word 0xb3a4c9e0  ! 4030: FDIVq	dis not found

	.word 0xb3ab8820  ! 4031: FMOVPOS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_324:
	setx	0x3f0209, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_171:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 4039: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_wr_172:
	mov	0x27, %r14
	.word 0xf6f389e0  ! 4043: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb7ab8820  ! 4046: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbba00520  ! 4047: FSQRTs	fsqrt	
T1_asi_reg_rd_174:
	mov	0xd, %r14
	.word 0xf6db84a0  ! 4048: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb1a58940  ! 4049: FMULd	fmuld	%f22, %f0, %f24
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_wr_173:
	mov	0x3c0, %r14
	.word 0xf6f384a0  ! 4054: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T1_asi_reg_wr_174:
	mov	0x3c5, %r14
	.word 0xfef38e60  ! 4055: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T1_asi_reg_rd_175:
	mov	0x1c, %r14
	.word 0xf6db8e40  ! 4056: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb7a00520  ! 4057: FSQRTs	fsqrt	
	.word 0xb3a54920  ! 4058: FMULs	fmuls	%f21, %f0, %f25
	.word 0xb5a48820  ! 4059: FADDs	fadds	%f18, %f0, %f26
	.word 0xb0840000  ! 4061: ADDcc_R	addcc 	%r16, %r0, %r24
	.word 0xbfa9c820  ! 4062: FMOVVS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_325:
	setx	0x3e0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 4065: FMOVN	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_175:
	mov	0x3, %r14
	.word 0xf4f38e40  ! 4067: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_326:
	setx	0x3e003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_176:
	mov	0x3c4, %r14
	.word 0xfcdb8e80  ! 4073: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb9a80420  ! 4075: FMOVRZ	dis not found

	.word 0xb3a488c0  ! 4077: FSUBd	fsubd	%f18, %f0, %f56
T1_asi_reg_rd_177:
	mov	0x8, %r14
	.word 0xfcdb8400  ! 4078: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_1_327:
	setx	0x3c0014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_328:
	setx	0x3f002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_329:
	setx	0x3d0020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_330:
	setx	0x3d0120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, 29)
	.word 0xbfa8c820  ! 4096: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb3a549c0  ! 4099: FDIVd	fdivd	%f52, %f0, %f56
T1_asi_reg_wr_176:
	mov	0x3c0, %r14
	.word 0xf6f38e80  ! 4103: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb1a5c9a0  ! 4104: FDIVs	fdivs	%f23, %f0, %f24
cpu_intr_1_331:
	setx	0x3c0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda40940  ! 4106: FMULd	fmuld	%f16, %f0, %f30
T1_asi_reg_rd_178:
	mov	0x6, %r14
	.word 0xf2db84a0  ! 4107: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb0240000  ! 4109: SUB_R	sub 	%r16, %r0, %r24
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_wr_177:
	mov	0x14, %r14
	.word 0xf2f38e40  ! 4114: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_332:
	setx	0x430317, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_178:
	mov	0x6, %r14
	.word 0xf8f38e60  ! 4118: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T1_asi_reg_wr_179:
	mov	0xc, %r14
	.word 0xfef38e40  ! 4119: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_333:
	setx	0x430209, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbba509a0  ! 4124: FDIVs	fdivs	%f20, %f0, %f29
cpu_intr_1_334:
	setx	0x410320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a98820  ! 4128: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbe8d8000  ! 4129: ANDcc_R	andcc 	%r22, %r0, %r31
cpu_intr_1_335:
	setx	0x420127, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_179:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 4132: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb3349000  ! 4133: SRLX_R	srlx	%r18, %r0, %r25
	.word 0xb1500000  ! 4134: RDPR_TPC	<illegal instruction>
cpu_intr_1_336:
	setx	0x430215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_337:
	setx	0x420308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a488c0  ! 4139: FSUBd	fsubd	%f18, %f0, %f28
cpu_intr_1_338:
	setx	0x430314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_339:
	setx	0x400319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a8c820  ! 4144: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb1a81420  ! 4148: FMOVRNZ	dis not found

	.word 0xb81d0000  ! 4149: XOR_R	xor 	%r20, %r0, %r28
T1_asi_reg_rd_180:
	mov	0x3c5, %r14
	.word 0xf8db84a0  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbfa9c820  ! 4153: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb3a9c820  ! 4154: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb1a88820  ! 4155: FMOVLE	fmovs	%fcc1, %f0, %f24
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbfa00040  ! 4157: FMOVd	fmovd	%f0, %f62
T1_asi_reg_wr_180:
	mov	0x4, %r14
	.word 0xfef38400  ! 4159: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T1_asi_reg_rd_181:
	mov	0x3c8, %r14
	.word 0xf6db84a0  ! 4160: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T1_asi_reg_wr_181:
	mov	0x25, %r14
	.word 0xf8f38e80  ! 4161: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb7a4c860  ! 4164: FADDq	dis not found

cpu_intr_1_340:
	setx	0x400002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_341:
	setx	0x41011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd346001  ! 4175: SRL_I	srl 	%r17, 0x0001, %r30
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 22)
	.word 0xb82ce174  ! 4178: ANDN_I	andn 	%r19, 0x0174, %r28
	.word 0xb5ab4820  ! 4180: FMOVCC	fmovs	%fcc1, %f0, %f26
cpu_intr_1_342:
	setx	0x400103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_343:
	setx	0x400307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba84201d  ! 4188: ADDcc_I	addcc 	%r16, 0x001d, %r29
	.word 0xb1a58920  ! 4189: FMULs	fmuls	%f22, %f0, %f24
cpu_intr_1_344:
	setx	0x420006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a489e0  ! 4195: FDIVq	dis not found

	.word 0xb7a5c9a0  ! 4196: FDIVs	fdivs	%f23, %f0, %f27
	.word 0xb7a90820  ! 4203: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb0150000  ! 4204: OR_R	or 	%r20, %r0, %r24
	.word 0xb5a80420  ! 4205: FMOVRZ	dis not found

	.word 0xbda488e0  ! 4206: FSUBq	dis not found

	.word 0xb5aa4820  ! 4207: FMOVNE	fmovs	%fcc1, %f0, %f26
iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_rd_182:
	mov	0x3c7, %r14
	.word 0xf6db89e0  ! 4213: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb7a00540  ! 4215: FSQRTd	fsqrt	
	.word 0xbfa48940  ! 4217: FMULd	fmuld	%f18, %f0, %f62
	.word 0xbba40820  ! 4218: FADDs	fadds	%f16, %f0, %f29
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 10)
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb7a4c840  ! 4224: FADDd	faddd	%f50, %f0, %f58
cpu_intr_1_345:
	setx	0x41002f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_346:
	setx	0x400211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_347:
	setx	0x40001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 17)
	.word 0xbba84820  ! 4235: FMOVE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_348:
	setx	0x400030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, d)
	.word 0xb3a48840  ! 4244: FADDd	faddd	%f18, %f0, %f56
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 14)
	.word 0xb7500000  ! 4248: RDPR_TPC	<illegal instruction>
T1_asi_reg_wr_182:
	mov	0x2e, %r14
	.word 0xf4f384a0  ! 4249: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_1_349:
	setx	0x43020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab4820  ! 4253: FMOVCC	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_183:
	mov	0x4, %r14
	.word 0xf4db8e40  ! 4260: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_184:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 4261: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 17)
	.word 0xb9a4c960  ! 4264: FMULq	dis not found

cpu_intr_1_350:
	setx	0x410309, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_183:
	mov	0x0, %r14
	.word 0xfef384a0  ! 4266: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb1aa8820  ! 4269: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xbda5c9a0  ! 4270: FDIVs	fdivs	%f23, %f0, %f30
	.word 0xb8348000  ! 4272: ORN_R	orn 	%r18, %r0, %r28
cpu_intr_1_351:
	setx	0x43000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_185:
	mov	0x2b, %r14
	.word 0xf2db8e40  ! 4277: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbda589e0  ! 4279: FDIVq	dis not found

T1_asi_reg_rd_186:
	mov	0x9, %r14
	.word 0xf0db8e40  ! 4280: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_352:
	setx	0x410027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00520  ! 4282: FSQRTs	fsqrt	
cpu_intr_1_353:
	setx	0x410228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a588a0  ! 4284: FSUBs	fsubs	%f22, %f0, %f28
cpu_intr_1_354:
	setx	0x400330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a88820  ! 4291: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb7a9c820  ! 4292: FMOVVS	fmovs	%fcc1, %f0, %f27
cpu_intr_1_355:
	setx	0x43032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 4300: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 2)
	.word 0xb7a5c9c0  ! 4307: FDIVd	fdivd	%f54, %f0, %f58
cpu_intr_1_356:
	setx	0x420208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf641800  ! 4316: MOVcc_R	<illegal instruction>
	.word 0xb1a80820  ! 4321: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb3a00520  ! 4322: FSQRTs	fsqrt	
	.word 0xb5a5c840  ! 4323: FADDd	faddd	%f54, %f0, %f26
	.word 0xb7a488e0  ! 4325: FSUBq	dis not found

cpu_intr_1_357:
	setx	0x43012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb02ca14b  ! 4331: ANDN_I	andn 	%r18, 0x014b, %r24
	.word 0xb7a81c20  ! 4332: FMOVRGEZ	dis not found

	.word 0xbfab8820  ! 4333: FMOVPOS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_184:
	mov	0x3c5, %r14
	.word 0xf0f38e80  ! 4335: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb9a88820  ! 4338: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a80820  ! 4342: FMOVN	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_185:
	mov	0x3c4, %r14
	.word 0xfef38e60  ! 4344: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb3a90820  ! 4345: FMOVLEU	fmovs	%fcc1, %f0, %f25
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_358:
	setx	0x410227, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_186:
	mov	0x3c7, %r14
	.word 0xfaf384a0  ! 4352: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb1a4c960  ! 4353: FMULq	dis not found

	.word 0xbba00540  ! 4354: FSQRTd	fsqrt	
T1_asi_reg_rd_187:
	mov	0xb, %r14
	.word 0xf6db8e60  ! 4356: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_1_359:
	setx	0x43033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_360:
	setx	0x40002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_361:
	setx	0x420138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 34)
	.word 0xb2bda1cb  ! 4362: XNORcc_I	xnorcc 	%r22, 0x01cb, %r25
	.word 0xb3a80420  ! 4369: FMOVRZ	dis not found

cpu_intr_1_362:
	setx	0x420129, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_188:
	mov	0x11, %r14
	.word 0xf4db8e40  ! 4375: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbba00520  ! 4376: FSQRTs	fsqrt	
T1_asi_reg_rd_189:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 4377: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5a50820  ! 4379: FADDs	fadds	%f20, %f0, %f26
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb53d5000  ! 4384: SRAX_R	srax	%r21, %r0, %r26
cpu_intr_1_363:
	setx	0x40011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_364:
	setx	0x400132, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_190:
	mov	0x8, %r14
	.word 0xf6db84a0  ! 4389: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbfab0820  ! 4393: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb5ab0820  ! 4400: FMOVGU	fmovs	%fcc1, %f0, %f26
cpu_intr_1_365:
	setx	0x43013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_366:
	setx	0x42003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb350c000  ! 4414: RDPR_TT	<illegal instruction>
	.word 0xbda00520  ! 4415: FSQRTs	fsqrt	
	.word 0xbda5c820  ! 4416: FADDs	fadds	%f23, %f0, %f30
cpu_intr_1_367:
	setx	0x420036, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_368:
	setx	0x420011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 32)
	.word 0xb1a448c0  ! 4420: FSUBd	fsubd	%f48, %f0, %f24
cpu_intr_1_369:
	setx	0x42003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_370:
	setx	0x400216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab8820  ! 4433: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbda509a0  ! 4438: FDIVs	fdivs	%f20, %f0, %f30
T1_asi_reg_wr_187:
	mov	0x8, %r14
	.word 0xf4f389e0  ! 4439: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb3a509c0  ! 4442: FDIVd	fdivd	%f20, %f0, %f56
	.word 0xb1a409e0  ! 4444: FDIVq	dis not found

	.word 0xb32d0000  ! 4445: SLL_R	sll 	%r20, %r0, %r25
	.word 0xbba80820  ! 4446: FMOVN	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_191:
	mov	0x1a, %r14
	.word 0xfedb89e0  ! 4454: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb1641800  ! 4455: MOVcc_R	<illegal instruction>
cpu_intr_1_371:
	setx	0x40001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_372:
	setx	0x400026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa4e015  ! 4460: SUBcc_I	subcc 	%r19, 0x0015, %r29
	.word 0xbbab8820  ! 4461: FMOVPOS	fmovs	%fcc1, %f0, %f29
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbfa80820  ! 4465: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xbba4c840  ! 4470: FADDd	faddd	%f50, %f0, %f60
	.word 0xb3a44940  ! 4471: FMULd	fmuld	%f48, %f0, %f56
	.word 0xb1ab8820  ! 4474: FMOVPOS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_188:
	mov	0x3c4, %r14
	.word 0xf4f384a0  ! 4475: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb835202a  ! 4477: ORN_I	orn 	%r20, 0x002a, %r28
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, b)
	.word 0xbfa588a0  ! 4481: FSUBs	fsubs	%f22, %f0, %f31
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_373:
	setx	0x41011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_189:
	mov	0x3c5, %r14
	.word 0xfcf389e0  ! 4486: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb0244000  ! 4487: SUB_R	sub 	%r17, %r0, %r24
T1_asi_reg_wr_190:
	mov	0x12, %r14
	.word 0xf6f384a0  ! 4491: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_374:
	setx	0x420124, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_191:
	mov	0x3c2, %r14
	.word 0xf6f38400  ! 4494: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_1_375:
	setx	0x41033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00040  ! 4499: FMOVd	fmovd	%f0, %f62
cpu_intr_1_376:
	setx	0x400109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80820  ! 4503: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
cpu_intr_1_377:
	setx	0x40002c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_378:
	setx	0x42012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, 25)
	.word 0xbba549e0  ! 4518: FDIVq	dis not found

cpu_intr_1_379:
	setx	0x400318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe4420f1  ! 4523: ADDC_I	addc 	%r16, 0x00f1, %r31
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 20)
	.word 0xb7a94820  ! 4525: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xbca5e06d  ! 4526: SUBcc_I	subcc 	%r23, 0x006d, %r30
	.word 0xbda90820  ! 4527: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbda80820  ! 4533: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbda44860  ! 4534: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_380:
	setx	0x410118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8050000  ! 4543: ADD_R	add 	%r20, %r0, %r28
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_rd_192:
	mov	0x14, %r14
	.word 0xfcdb8e40  ! 4545: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbfa5c940  ! 4547: FMULd	fmuld	%f54, %f0, %f62
iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb9a4c940  ! 4551: FMULd	fmuld	%f50, %f0, %f28
T1_asi_reg_wr_192:
	mov	0x2e, %r14
	.word 0xfef38e40  ! 4553: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb1a00040  ! 4554: FMOVd	fmovd	%f0, %f24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, 15)
	.word 0xbba589e0  ! 4562: FDIVq	dis not found

T1_asi_reg_wr_193:
	mov	0x3c5, %r14
	.word 0xf8f384a0  ! 4564: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_381:
	setx	0x420112, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_193:
	mov	0x32, %r14
	.word 0xfedb8e60  ! 4566: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_1_382:
	setx	0x43021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_383:
	setx	0x420310, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_384:
	setx	0x410102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab8820  ! 4572: FMOVPOS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_194:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 4574: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_rd_194:
	mov	0x28, %r14
	.word 0xfcdb8e60  ! 4576: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_1_385:
	setx	0x410223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe0dc000  ! 4578: AND_R	and 	%r23, %r0, %r31
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, 7)
	.word 0xb13c2001  ! 4585: SRA_I	sra 	%r16, 0x0001, %r24
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb0bda1e1  ! 4588: XNORcc_I	xnorcc 	%r22, 0x01e1, %r24
T1_asi_reg_rd_195:
	mov	0x4, %r14
	.word 0xfcdb8e60  ! 4592: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_1_386:
	setx	0x410014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda548a0  ! 4596: FSUBs	fsubs	%f21, %f0, %f30
	.word 0xbc2da038  ! 4598: ANDN_I	andn 	%r22, 0x0038, %r30
T1_asi_reg_wr_195:
	mov	0x18, %r14
	.word 0xfaf38e40  ! 4599: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_rd_196:
	mov	0x3c2, %r14
	.word 0xf8db8e60  ! 4603: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbfa80820  ! 4604: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb1a409c0  ! 4606: FDIVd	fdivd	%f16, %f0, %f24
T1_asi_reg_rd_197:
	mov	0x3c0, %r14
	.word 0xfedb8e60  ! 4607: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb5a488a0  ! 4608: FSUBs	fsubs	%f18, %f0, %f26
cpu_intr_1_387:
	setx	0x450121, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_388:
	setx	0x46030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r19 + %g0] 0xf0, %f2
iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, 19)
	.word 0xbda588e0  ! 4615: FSUBq	dis not found

	.word 0xbdab8820  ! 4616: FMOVPOS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_198:
	mov	0x2a, %r14
	.word 0xf6db84a0  ! 4617: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb5a488a0  ! 4622: FSUBs	fsubs	%f18, %f0, %f26
	.word 0xb095a015  ! 4626: ORcc_I	orcc 	%r22, 0x0015, %r24
	.word 0xbfab4820  ! 4627: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb3aa0820  ! 4628: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb7a40940  ! 4629: FMULd	fmuld	%f16, %f0, %f58
	.word 0xbba4c920  ! 4635: FMULs	fmuls	%f19, %f0, %f29
T1_asi_reg_wr_196:
	mov	0x1a, %r14
	.word 0xf2f389e0  ! 4636: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbfaa0820  ! 4638: FMOVA	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_199:
	mov	0x3, %r14
	.word 0xfedb8e80  ! 4639: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb8bd0000  ! 4651: XNORcc_R	xnorcc 	%r20, %r0, %r28
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 8)
cpu_intr_1_389:
	setx	0x44010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_197:
	mov	0x21, %r14
	.word 0xf6f38400  ! 4656: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbe34a011  ! 4658: ORN_I	orn 	%r18, 0x0011, %r31
cpu_intr_1_390:
	setx	0x440305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_391:
	setx	0x460307, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_200:
	mov	0x3c5, %r14
	.word 0xf0db8e80  ! 4671: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T1_asi_reg_rd_201:
	mov	0x3c2, %r14
	.word 0xf8db8e60  ! 4678: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb9ab0820  ! 4680: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb9aa0820  ! 4681: FMOVA	fmovs	%fcc1, %f0, %f28
cpu_intr_1_392:
	setx	0x440324, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_393:
	setx	0x450339, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_202:
	mov	0x33, %r14
	.word 0xf2db8e40  ! 4693: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_394:
	setx	0x45023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb1a4c8a0  ! 4700: FSUBs	fsubs	%f19, %f0, %f24
	.word 0xbba9c820  ! 4702: FMOVVS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_203:
	mov	0x30, %r14
	.word 0xf2db8e80  ! 4709: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbba509e0  ! 4710: FDIVq	dis not found

cpu_intr_1_395:
	setx	0x460226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00040  ! 4727: FMOVd	fmovd	%f0, %f62
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_396:
	setx	0x47001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, 4)
	.word 0xbab50000  ! 4734: ORNcc_R	orncc 	%r20, %r0, %r29
	.word 0xb5a80c20  ! 4735: FMOVRLZ	dis not found

	.word 0xb3a00560  ! 4741: FSQRTq	fsqrt	
	.word 0xb3a80820  ! 4743: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_wr_198:
	mov	0x31, %r14
	.word 0xfef384a0  ! 4752: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb5a81820  ! 4753: FMOVRGZ	fmovs	%fcc3, %f0, %f26
cpu_intr_1_397:
	setx	0x46002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_204:
	mov	0xb, %r14
	.word 0xfadb8e60  ! 4758: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb1a408a0  ! 4760: FSUBs	fsubs	%f16, %f0, %f24
	.word 0xbe94a09e  ! 4763: ORcc_I	orcc 	%r18, 0x009e, %r31
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 3a)
	.word 0xa1902002  ! 4765: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xb1a94820  ! 4766: FMOVCS	fmovs	%fcc1, %f0, %f24
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_rd_205:
	mov	0x3c6, %r14
	.word 0xfedb8e80  ! 4768: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbba4c820  ! 4770: FADDs	fadds	%f19, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_398:
	setx	0x440209, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_206:
	mov	0x1b, %r14
	.word 0xf6db89e0  ! 4773: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbfa549a0  ! 4777: FDIVs	fdivs	%f21, %f0, %f31
cpu_intr_1_399:
	setx	0x460034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_400:
	setx	0x470006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c8a0  ! 4786: FSUBs	fsubs	%f23, %f0, %f24
	.word 0xb7a5c960  ! 4789: FMULq	dis not found

T1_asi_reg_wr_199:
	mov	0x3c1, %r14
	.word 0xfaf389e0  ! 4790: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbba548a0  ! 4792: FSUBs	fsubs	%f21, %f0, %f29
cpu_intr_1_401:
	setx	0x45020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a40960  ! 4797: FMULq	dis not found

	.word 0xbfaa8820  ! 4799: FMOVG	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_200:
	mov	0x31, %r14
	.word 0xfef38e40  ! 4801: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_wr_201:
	mov	0x3, %r14
	.word 0xf0f384a0  ! 4802: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbba448c0  ! 4806: FSUBd	fsubd	%f48, %f0, %f60
T1_asi_reg_wr_202:
	mov	0x3, %r14
	.word 0xf8f38e80  ! 4808: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb1aa0820  ! 4811: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb7ab4820  ! 4816: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb5a9c820  ! 4822: FMOVVS	fmovs	%fcc1, %f0, %f26
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_402:
	setx	0x450215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, a)
	.word 0xbba488a0  ! 4826: FSUBs	fsubs	%f18, %f0, %f29
iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_wr_203:
	mov	0x3, %r14
	.word 0xfcf38e80  ! 4834: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T1_asi_reg_wr_204:
	mov	0x7, %r14
	.word 0xfcf38400  ! 4836: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T1_asi_reg_wr_205:
	mov	0x3c8, %r14
	.word 0xf0f38400  ! 4841: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbc8421f5  ! 4842: ADDcc_I	addcc 	%r16, 0x01f5, %r30
iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, c)
T1_asi_reg_wr_206:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 4847: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_rd_207:
	mov	0x3c2, %r14
	.word 0xfedb84a0  ! 4851: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbfa80420  ! 4852: FMOVRZ	dis not found

cpu_intr_1_403:
	setx	0x44032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00040  ! 4856: FMOVd	fmovd	%f0, %f24
iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_wr_207:
	mov	0xc, %r14
	.word 0xf2f38e40  ! 4861: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbda489a0  ! 4862: FDIVs	fdivs	%f18, %f0, %f30
	.word 0xb3aa4820  ! 4868: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb5a9c820  ! 4871: FMOVVS	fmovs	%fcc1, %f0, %f26
iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, 8)
	.word 0xbfa5c8a0  ! 4879: FSUBs	fsubs	%f23, %f0, %f31
	.word 0xbfa4c8a0  ! 4880: FSUBs	fsubs	%f19, %f0, %f31
T1_asi_reg_rd_208:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 4881: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, 3)
	.word 0xb9643801  ! 4884: MOVcc_I	<illegal instruction>
	.word 0xbfa00560  ! 4886: FSQRTq	fsqrt	
	.word 0xb1a81c20  ! 4888: FMOVRGEZ	dis not found

	.word 0xb7a98820  ! 4889: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xbda84820  ! 4890: FMOVE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_209:
	mov	0x3c7, %r14
	.word 0xf2db84a0  ! 4891: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_1_404:
	setx	0x440300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_405:
	setx	0x47011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00540  ! 4895: FSQRTd	fsqrt	
cpu_intr_1_406:
	setx	0x44002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbca4c000  ! 4899: SUBcc_R	subcc 	%r19, %r0, %r30
	.word 0xb7a90820  ! 4905: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb7a94820  ! 4906: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xbda50940  ! 4907: FMULd	fmuld	%f20, %f0, %f30
	.word 0xb7a408e0  ! 4910: FSUBq	dis not found

iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbdabc820  ! 4914: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb3a48820  ! 4918: FADDs	fadds	%f18, %f0, %f25
T1_asi_reg_rd_210:
	mov	0x3c3, %r14
	.word 0xf8db84a0  ! 4922: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_1_407:
	setx	0x46013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, 10)
	.word 0xbba58860  ! 4930: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbda4c860  ! 4934: FADDq	dis not found

	.word 0xb49521e2  ! 4935: ORcc_I	orcc 	%r20, 0x01e2, %r26
	.word 0xbfab4820  ! 4941: FMOVCC	fmovs	%fcc1, %f0, %f31
cpu_intr_1_408:
	setx	0x450035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81420  ! 4944: FMOVRNZ	dis not found

cpu_intr_1_409:
	setx	0x440219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_410:
	setx	0x440008, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_208:
	mov	0x0, %r14
	.word 0xf4f38e60  ! 4952: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T1_asi_reg_wr_209:
	mov	0xe, %r14
	.word 0xf6f38e80  ! 4963: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb9a94820  ! 4964: FMOVCS	fmovs	%fcc1, %f0, %f28
iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, 8)
	.word 0xb1ab0820  ! 4970: FMOVGU	fmovs	%fcc1, %f0, %f24
iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, 33)
	.word 0xbfaa4820  ! 4977: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbba90820  ! 4979: FMOVLEU	fmovs	%fcc1, %f0, %f29
cpu_intr_1_411:
	setx	0x44003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_412:
	setx	0x450221, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_413:
	setx	0x450303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 4988: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb3a80420  ! 4991: FMOVRZ	dis not found

T1_asi_reg_wr_210:
	mov	0x21, %r14
	.word 0xf0f38400  ! 4992: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_1_414:
	setx	0x460132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, 31)

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

	.xword	0x98a86a498847d9e9
	.xword	0xc5a02f3c69072b2d
	.xword	0xe718e51cb4bd3f09
	.xword	0x1144a609c59c5594
	.xword	0x7ab10780d2c0172a
	.xword	0xb8631bb46120060f
	.xword	0x05070202ab470a53
	.xword	0x780960e55a648637
	.xword	0x0380831eb1bc38b9
	.xword	0x6012e37e57624ba0
	.xword	0x467165c6aac2ed9e
	.xword	0x132f20edf22aae87
	.xword	0xaca6d6e6b03c6c4b
	.xword	0x1daf168f515b124c
	.xword	0xbff0ee2cd933389a
	.xword	0x12f1ac529aa38776
	.xword	0xd8f6ab0553bed5e0
	.xword	0xb3977268ab5d3540
	.xword	0x1be8c42a55ecb6a1
	.xword	0x46aaa439454b6dc3
	.xword	0x73bc412288042d99
	.xword	0x1c746d6b6b36a5cd
	.xword	0xf91c87e9760ca668
	.xword	0x885e044b0e2e8db3
	.xword	0xc58c199f52487b09
	.xword	0x07ab4f5d2db30435
	.xword	0xcbb6600232c0b38a
	.xword	0x7903524f7a8a5ef5
	.xword	0x2ff2df45a65f4dba
	.xword	0x43e32a3805f187df
	.xword	0x4181bdcf8519a1a9
	.xword	0x04941882fe210d82
	.xword	0xd4dfb8f1b96975f9
	.xword	0xb6a0731137fc4587
	.xword	0x9e3d5e4bf7d10a17
	.xword	0x9dde60dd99362867
	.xword	0xcbd535de9f1b5722
	.xword	0xca232e8aa02595c0
	.xword	0x6bbea6e5090e01d1
	.xword	0x08ecd8a4f7ed8b62
	.xword	0x1299c333ca924b6d
	.xword	0xecec9e96684be0f5
	.xword	0x49f69142b4a50c9a
	.xword	0xb0723f50613ceb5e
	.xword	0xc54715afa90b4254
	.xword	0xa5fbc4d93d9ebda7
	.xword	0x8d47447ebef1b824
	.xword	0xb6b9c592a685205b
	.xword	0x1d622d8885fdb0e7
	.xword	0xe9834cb1624e62a6
	.xword	0x55a2285c2c4f5303
	.xword	0xc0186a123dc7dace
	.xword	0x36862291c5a762a2
	.xword	0x3058cbaa222076bc
	.xword	0x77d6358f802c0558
	.xword	0x0f2610a076e7a06e
	.xword	0xcc75ce29b48cc4e8
	.xword	0xaba423e6cd4814fb
	.xword	0x4457da3f048be581
	.xword	0x97b352fd4da40fdc
	.xword	0x149cec94c79ab581
	.xword	0x154f8c66497d0e9c
	.xword	0xb2b28baf0adec938
	.xword	0xc57a33dc7b27aa48
	.xword	0x1072cb2379aac905
	.xword	0xfb91b41864fe5dbc
	.xword	0x0137eca6a8108c14
	.xword	0x79cf1cd5bef00c89
	.xword	0x2919bff81ca35b53
	.xword	0x0b324997e7edae10
	.xword	0x143a031572f3e3d9
	.xword	0x34ef6f555be4b5a0
	.xword	0x06d8cd3609ab45e9
	.xword	0xaf5a370e2c34e761
	.xword	0xd418e3f506070492
	.xword	0x32e2d3e784e8a9bd
	.xword	0xa54f1bf227b92438
	.xword	0x6686c73f26eacca5
	.xword	0xa81fba07292b572b
	.xword	0xb13bfa4839054131
	.xword	0x463941ddeb4413ad
	.xword	0x2e1de1aa97805a97
	.xword	0xeca0e9a7f9526170
	.xword	0x8568cc5075cd16cc
	.xword	0x382e503e8b3dc590
	.xword	0xb0e62cccce39e4eb
	.xword	0x6b4252798e8fd7c0
	.xword	0x085f9f09bd77487a
	.xword	0x521e9b407ec1a13a
	.xword	0xe3058aa072a4a9d9
	.xword	0xa2bf7243ef0b29b1
	.xword	0x79a8e5b29bc2ce26
	.xword	0x36182ac0aca895f1
	.xword	0x21b85c583e808e5d
	.xword	0xdfcb1f703eceba1e
	.xword	0x9bcb02173920f6d8
	.xword	0xf3d0686854a3195d
	.xword	0x8eca332fa74655e5
	.xword	0xca8675cf8787f908
	.xword	0xad2f3b8381b84b04
	.xword	0xf5900a26981bc446
	.xword	0x1e3fa084525350ea
	.xword	0x38cda7f6f9af20d5
	.xword	0x8de152492faf458c
	.xword	0x16a1191f24f62a21
	.xword	0xace476407795d310
	.xword	0xad5a573573704c60
	.xword	0x845fced794f53764
	.xword	0x11cc0b785410c467
	.xword	0x3c2c8d44583cf2f6
	.xword	0x51fa2d82e6d62420
	.xword	0x8e4f2bce221e90e2
	.xword	0x6a02448192693641
	.xword	0xe620c05b98255355
	.xword	0x865ef008defef506
	.xword	0x61149037c338918e
	.xword	0x3951265ee962fb38
	.xword	0xbbfe227f4353526e
	.xword	0x27011dce3bbd793c
	.xword	0x0990fea29965d390
	.xword	0xbfba073addb3fea5
	.xword	0x80e8b7d8a4cfdef1
	.xword	0x64345d91b78e7a59
	.xword	0x1b904ae837343c87
	.xword	0x24d850c81c5ed8bd
	.xword	0x48a5d20aba43036f
	.xword	0xc17b0b7b490917f5
	.xword	0xa86d031115d0dd8a
	.xword	0x918ee8eca93f111d
	.xword	0x42167f61a44880e8
	.xword	0x10115bc9ddd830df
	.xword	0xfefa41e356042498
	.xword	0x5a1ec0a9d16bb1cd
	.xword	0xbea4d9c8affde85b
	.xword	0xee11f22ea011bff2
	.xword	0x34aa0865494a4d5d
	.xword	0xf0306a1b82eb35ed
	.xword	0x5474595e6f590af2
	.xword	0xf40938dc0abcc698
	.xword	0xb48151016865fa34
	.xword	0x8aca11a7ce0d6a57
	.xword	0x6c43acfcf0809016
	.xword	0x522b16f8738d5b42
	.xword	0xfb3154a962598096
	.xword	0x939b3867f7f26caa
	.xword	0x5ce6a87c3a1ed43f
	.xword	0xf8b6df48c225bbfd
	.xword	0x8ad2b30df5c37dbc
	.xword	0x098c48873dff5a2e
	.xword	0xcfa8f6761a1bfedc
	.xword	0xb01d9f133f3e72aa
	.xword	0xa1fe3d5345ccf8a4
	.xword	0x8b6a071e9e443474
	.xword	0xbf7061920a32ec39
	.xword	0x00f3393d2c893d31
	.xword	0xceae4c483f3cc7b2
	.xword	0xc98b401b75e710ad
	.xword	0x36ff4347279dc839
	.xword	0x4e98b74564c7704a
	.xword	0x7fc59a8813c74823
	.xword	0x800a2d0c0dcd77e9
	.xword	0x728ccea28636c73b
	.xword	0x915048c3a3117040
	.xword	0xb8e9a00be280590a
	.xword	0xd9f448a8ac43fc84
	.xword	0x004248d0b1507836
	.xword	0x995c42aa2e5d6750
	.xword	0xc4dde29c6898cb4d
	.xword	0x5d10cf612415789d
	.xword	0xd9365cbd0aabf4d8
	.xword	0xce56212235d3d9aa
	.xword	0x6125ea06bac396e7
	.xword	0x4d9cb7c967c30287
	.xword	0xa449b6e99ba884d0
	.xword	0xbc32c2ade1085567
	.xword	0xd50653091675bdfe
	.xword	0x9b7694c299f8a423
	.xword	0x9b6ead1702acb19a
	.xword	0x590b6b3dd58eac78
	.xword	0xdf3eb6559f3d609d
	.xword	0xbb8ca1be9cf25255
	.xword	0xb7292fb1fb1f5c86
	.xword	0xe507192d77af0eb3
	.xword	0x56d018ff808e2690
	.xword	0xd4648c0c734ee361
	.xword	0xdf0d8c42289698f4
	.xword	0xe1d5c241618ef858
	.xword	0xc61fcc5fce35eac9
	.xword	0x48579468447b6feb
	.xword	0xd093946b0b6b710a
	.xword	0x3ab12052d3eb53a5
	.xword	0x240ba2bbffa5f169
	.xword	0x5539320997e0dd04
	.xword	0x9a661feedec8a699
	.xword	0xa8f9a8c2976b43bb
	.xword	0x84262b25d880803f
	.xword	0x97a01bb9f9e9b5d4
	.xword	0xc08e00dadaa02b2a
	.xword	0xd485a9b52454390d
	.xword	0x7db08af2eea5d036
	.xword	0xb2106e699bb89de4
	.xword	0x27a4144175ea260b
	.xword	0xa7d5d37d6e6c395d
	.xword	0x8a3224475d75fd4c
	.xword	0x47151b09062a24ef
	.xword	0x5de0e03478ac0995
	.xword	0xc6f186a37346350e
	.xword	0xd2f8a60e01fe424e
	.xword	0x99a9ab59192f99d9
	.xword	0x87a3498aaf108f98
	.xword	0xb9f52f617c1079bf
	.xword	0x9b06c9438f6c5831
	.xword	0xd5cfae22d8740fcf
	.xword	0xe5a081c976427d20
	.xword	0x1b99e0d9738df1ca
	.xword	0x0ef0e039fdf33520
	.xword	0xf40b3dc78d8fb6fe
	.xword	0xcf2a4462d5adae6a
	.xword	0xf9a49c5d30f9b5b7
	.xword	0xb2c86a7665938ff2
	.xword	0x3932a55b8d8fec2b
	.xword	0xccb58758aed852c4
	.xword	0xf6657fa348f2ec34
	.xword	0xa15fcd224c9f183f
	.xword	0x14b63fd8058deb80
	.xword	0x631d41e895eb4358
	.xword	0x564aa4a1e5da3e01
	.xword	0x7f1e85603eb48c75
	.xword	0x29f9f9f1269a4ebd
	.xword	0x7feebf93b43e0a23
	.xword	0xaab2a4640863b23a
	.xword	0x5bf57515b5a1993a
	.xword	0xe461381850d72604
	.xword	0x10895e482534c06f
	.xword	0x588ec5422e844ae6
	.xword	0x8a22456e7b7ca184
	.xword	0x1b6d45ae5e3e74c2
	.xword	0x741e8e0e403feb8e
	.xword	0x914e168344710804
	.xword	0xaa321b984655cf31
	.xword	0x801f9c201c39d6bd
	.xword	0xb1525b1ed66b839b
	.xword	0xa38c21d16f894235
	.xword	0xdeef57cf866a294b
	.xword	0x83cc257d39b2cc38
	.xword	0xe4a48abba4e54930
	.xword	0xdcfccd617ad67cf7
	.xword	0x976559c1a60ecc4c
	.xword	0x118522ea9c172fa8
	.xword	0x1e87a4eea9c23ff4
	.xword	0x96871493a0007dd6
	.xword	0x20c05f60e2b5785e
	.xword	0x6f1fc331a72f7378
	.xword	0x17f5390f503f54f1
	.xword	0x437d4c19a7e0413e
	.xword	0xf336dd32a9801bbf
	.align 0x2000
	.data
data_start_1:

	.xword	0x59ffa6133c4616dc
	.xword	0xfc5bc6456c87a2d6
	.xword	0x0d8b6f3adc66da97
	.xword	0x853a3b4424d5bb8b
	.xword	0xec1c9b23686dde0c
	.xword	0xee2f8ec7772c7627
	.xword	0x3ab7bee552365872
	.xword	0x7d01f46d79544809
	.xword	0xd68bb83794fee917
	.xword	0x2ac6096da8c7308d
	.xword	0x49c9040cd99dde19
	.xword	0x710313e70b519bf2
	.xword	0x58cc8897efdc1776
	.xword	0x7261ae0c9af0e39f
	.xword	0x603f36d4642cc8a6
	.xword	0x04ade133af6a28ac
	.xword	0x32f02d20fae34ef7
	.xword	0xc52ebc11b2923e0c
	.xword	0x3c9a08101112d44f
	.xword	0x1dc89a082aa606fe
	.xword	0x8065ed14139d658a
	.xword	0xbcc8fd98ec5e8ea0
	.xword	0x96a678c29187f729
	.xword	0x417dd5f8a58f9726
	.xword	0xe64e0380df5488fa
	.xword	0xe557d17c05379a39
	.xword	0x1e90895fc6552bb4
	.xword	0xf81f6d0193276e36
	.xword	0x64ca6adbba23d848
	.xword	0xaa57b88f96ebfb41
	.xword	0x52d57e526b672454
	.xword	0x7ea3bee38e99e4b4
	.xword	0x6a0d14ecfb13406e
	.xword	0x631aeec1e7b5a64f
	.xword	0xd6254e491e081e39
	.xword	0x70679c3ca4482e0b
	.xword	0x3ad366695150ec05
	.xword	0x33fbbf9d83e43cbf
	.xword	0x4e68fc96612507e9
	.xword	0xf077da22d8baff82
	.xword	0x1193a580d8c206b0
	.xword	0x6e883d2429e7322c
	.xword	0x21def43a6f491b76
	.xword	0xfdeae9a00dcd34d1
	.xword	0x4303aa17ea4d6c79
	.xword	0x29cf17d9c39ac98c
	.xword	0xd73449e766e66895
	.xword	0xa68b9dd76d63ebff
	.xword	0xe849a3b9ccf884f4
	.xword	0xb3745e6b90f972fc
	.xword	0x570ab8b08fb23cdd
	.xword	0xbdac7f1899b85d29
	.xword	0x2dcb4429bdbb1dd6
	.xword	0xb99304e7016d3440
	.xword	0x88e079db875eb0a4
	.xword	0x6720ab4d4a2f60ed
	.xword	0x0512554cbd532e6a
	.xword	0x5cd134903e1e302c
	.xword	0xca8693d1c4238679
	.xword	0xe75d4c3fa1bff4bf
	.xword	0xd8137d18961cc5d8
	.xword	0x38ec94b5d324d0a4
	.xword	0xe683ed96e2fed47c
	.xword	0xe5b6c250f5c364d5
	.xword	0x9848c6a87203e74a
	.xword	0xb41befda084d7877
	.xword	0x5409142d29d78052
	.xword	0xe8ff95ec8e5bec44
	.xword	0xf035e9cdc7d94a23
	.xword	0xf8bd6185d278ef74
	.xword	0x8028691990612905
	.xword	0x819a77fe2ff089fd
	.xword	0x41953c9bc161a87f
	.xword	0xdd2fae12d521375c
	.xword	0xc0c89499142487d5
	.xword	0xf9536fa795370fdf
	.xword	0x218c5ad387e7c926
	.xword	0x3a1d238487873028
	.xword	0x4cfb0b701984f1f6
	.xword	0xf63ba1a2e4c571fc
	.xword	0x34cfd5d4bdb6dc0e
	.xword	0x79a7bf47ac5d4ae7
	.xword	0x4367feb67619a0ec
	.xword	0x0916f22fbc6d5c1d
	.xword	0xd37bf1a46d295386
	.xword	0xa154f0184d9074fb
	.xword	0x9f52b5ba463bb583
	.xword	0xbd0280ad2b3f7e25
	.xword	0x5d8bf205bbfe9522
	.xword	0x4852b127ad1291ab
	.xword	0x2f7f69725c592db9
	.xword	0xbc54134b10e9c6ab
	.xword	0xe07d1049ecc67e75
	.xword	0xd95e5d52fcb22774
	.xword	0xd9699eb1630b3781
	.xword	0x2adc4b0c64b4af0a
	.xword	0x97c6d61cd00f1353
	.xword	0x21599d34be86fad7
	.xword	0x1dbe47e7078cd7f0
	.xword	0xf3af95db0e6e22fa
	.xword	0xdd02b29e2398843a
	.xword	0xde4a4f6240ed7762
	.xword	0x979c91c4eebdbf0b
	.xword	0x91c090c4478adcdc
	.xword	0xd22b88eea7062228
	.xword	0x63dc18f19546d4ec
	.xword	0xfad5b334d91d8a44
	.xword	0xc80390c09c77a41d
	.xword	0xd97195052933f085
	.xword	0xa20d6493e4e76885
	.xword	0xea3d0037e46f8718
	.xword	0x4f8491a5dcf89c8d
	.xword	0xb294909801f11134
	.xword	0x69d1af8b11849b5c
	.xword	0xfc27e97f3f3f6d3f
	.xword	0xed94b4bdc1e46742
	.xword	0xbac519f77a776522
	.xword	0x3652f60213e58cb2
	.xword	0x016d61bdfb69d61e
	.xword	0xdd9fcbaf519004c5
	.xword	0x4bb85cce55b1c4ad
	.xword	0xa1aa9d4186aea09a
	.xword	0x851b6c1e6589d478
	.xword	0x13ce5d86e9047e45
	.xword	0xecfd95fcf96ffeed
	.xword	0x2acb4b2f3ef7f53b
	.xword	0x58f2e89d919b9958
	.xword	0x0ad88bb4ba693286
	.xword	0xc48071f651142cf2
	.xword	0xa37d192dc9d9972d
	.xword	0x6a540e781a72d132
	.xword	0xdc1058e1dd65e11a
	.xword	0xc773ec5f5609c709
	.xword	0xf0e13a13993b0c30
	.xword	0xbfbf1f46c61015f2
	.xword	0x85f0d3fb5bb4e0c3
	.xword	0x8b43764bc175644a
	.xword	0xeff66d80bd3d65f1
	.xword	0x4de4dc532b55e6ce
	.xword	0xec08235eb6c80e16
	.xword	0x6612611cef2eca29
	.xword	0x20f01047ad522d2b
	.xword	0x75c7dad59c0a449f
	.xword	0x73d0975354f29a61
	.xword	0xfa904f6c6d843b98
	.xword	0x6d0af87f5cbb0776
	.xword	0x2e967f62f5f492e8
	.xword	0xb84749d422a840d0
	.xword	0xccb2e3028b659c2e
	.xword	0x334b0c3c2d7dfba3
	.xword	0xd3140b4ea763b7f3
	.xword	0x2fb4e4769639af75
	.xword	0xe24b2d22abbfe067
	.xword	0x53d83a77d078268e
	.xword	0x667b662f5eba2017
	.xword	0xfa72b7df6a18c351
	.xword	0xa729021aba52af0d
	.xword	0x2b9b6a14dac1ea0c
	.xword	0x58a61deded5c05d8
	.xword	0x6d6b2b982e7f7e29
	.xword	0xe00c18133763133d
	.xword	0x6987c2fa580a2a0e
	.xword	0x81d4217b291fd1a3
	.xword	0x94d0f2c12c4373c5
	.xword	0x27956d942d98b289
	.xword	0xca0f3379fabb7eff
	.xword	0xa5cfde1834f38223
	.xword	0xd407dacee835ccc5
	.xword	0x2017e9615c96835f
	.xword	0x636c3c27f499a865
	.xword	0x3433c915a9b5ce44
	.xword	0x7bb6e9c19ccad4ab
	.xword	0x15476ccea3a9ccd7
	.xword	0xb51dd95e42174aae
	.xword	0xc3c7b5fb762e90dd
	.xword	0xe582061b36837da3
	.xword	0xde99fb72c61c9cf6
	.xword	0xdb2202e920d181dd
	.xword	0xf1de86faeef421f6
	.xword	0x3767b4b3e2cb03b5
	.xword	0xc452067c967c0c51
	.xword	0x5f05e62fb033c84e
	.xword	0x1458518979ff6422
	.xword	0xec2a37af56409219
	.xword	0xd1507c3fb18dbfb4
	.xword	0xc33471754d50c948
	.xword	0x372f47deeff975c9
	.xword	0x98b5acf6804a1a11
	.xword	0x4ba0c357b2385b4c
	.xword	0xd721a4a1c9cf3425
	.xword	0x267769de3095e4ce
	.xword	0x95e2a2cd2db95f50
	.xword	0x3af818d04f7aa587
	.xword	0xa6660c7b6c3c4554
	.xword	0x70649fef8de5999a
	.xword	0x489573a776ec3eae
	.xword	0x84f3ef1d48ab5602
	.xword	0x88b6ea3de367eff3
	.xword	0x54d0e02a93d87992
	.xword	0x283f8a96f1fe2c79
	.xword	0x910063b2e8f60cca
	.xword	0xfc2be452f9328fb3
	.xword	0x1cb535c54aeb05f7
	.xword	0x2d195ea80ceb0809
	.xword	0x5ee123c003b623c6
	.xword	0xec95a7dcca18f0d2
	.xword	0x7d1c5fafff740c5d
	.xword	0x49368147c47ed43d
	.xword	0x4a4874284538036d
	.xword	0xb594e68285292d6b
	.xword	0x9ea09d899f98b693
	.xword	0x5a732184844a5531
	.xword	0xe1b51a20e7632831
	.xword	0xfcb939fda8085d7f
	.xword	0xfbd2739463937aba
	.xword	0x1650d87d5a104c35
	.xword	0x02fab5b9851c9089
	.xword	0x7888cc3a5407cf37
	.xword	0x9ace5ef82bc537a0
	.xword	0x6565e6749e2a0c99
	.xword	0xb4b1b66092ce5fbf
	.xword	0x37458d3502dacdab
	.xword	0x5bda8052912d140e
	.xword	0x8beff281501f2998
	.xword	0x70399a0d76c5ad08
	.xword	0x0e4999e53f8f2708
	.xword	0x7a23b28022fc82c1
	.xword	0x0ef63937c18d78a3
	.xword	0x4231ec32cbe91f8e
	.xword	0x7a6797f8defeeb64
	.xword	0x539a41118b49a72e
	.xword	0x3155b5fada3a9318
	.xword	0x32e77708e5c06815
	.xword	0xbaec0def8957c459
	.xword	0xdb734aacfc452d9e
	.xword	0xd4da0d8a7b1e1a12
	.xword	0xe6337ab0f3407345
	.xword	0x2c6bf2fe1af4a185
	.xword	0x2b446bb27b16f15a
	.xword	0x229dee51f25d7b9d
	.xword	0xbb3ffd8d30eabd3a
	.xword	0x741d2d3b57fec0a6
	.xword	0xc5b1eef99eae440a
	.xword	0xc0a3bf36c1cd8c1b
	.xword	0xb6d51eb8f6184a64
	.xword	0x953ffa094ca69215
	.xword	0xc2fa215e42360990
	.xword	0x8c1f01905091bacb
	.xword	0x9f7766ad925eb63e
	.xword	0xcba5fceaa08c8a3c
	.xword	0xc74ddfb54ca10cea
	.xword	0x067645d5223d363f
	.xword	0xcdb16284283f1b68
	.xword	0xf2f8a81b52c7b9ff
	.xword	0xc67f9b7636345406
	.xword	0x52faed5fad45263a
	.align 0x4000
	.data
data_start_2:

	.xword	0x5e85c490499241db
	.xword	0x92669406b8b649c2
	.xword	0x6d00616732a474ea
	.xword	0x0e43c8edb0ade85a
	.xword	0x48b2c38f7164a775
	.xword	0x8289c124cbbfb740
	.xword	0xdf06070e35c8dc10
	.xword	0xcf8d22ef1f1245af
	.xword	0x459fddb61bbbb0b3
	.xword	0xba775b054e557d51
	.xword	0x526ec8cbbddb87b0
	.xword	0xd19f5a62660486e3
	.xword	0x47c4812ca3ce54c1
	.xword	0xb12402dab37d3261
	.xword	0x7e454a48706930a5
	.xword	0xd5d285fb1413371f
	.xword	0x1dbd5f2a85b1da2a
	.xword	0x9610ef8481b44312
	.xword	0x9e103e9804bc69b4
	.xword	0x6c354fddbdb0efa2
	.xword	0x0d33f19320062a08
	.xword	0x774d73ffb0adc023
	.xword	0x027f13006e6374a0
	.xword	0x9ce1198ad7ad12fa
	.xword	0x991fe38f6dc4a881
	.xword	0xfe91b5e14c9f6510
	.xword	0xb28a08c5b2bd9d7c
	.xword	0xc1e13614d30c4752
	.xword	0xdbbf9944e83c71a0
	.xword	0x97e07c9fb4f75d97
	.xword	0x17cbb94ce16e89f4
	.xword	0x589a41beedf2c6a7
	.xword	0xd0494c5f7ea5892d
	.xword	0x80a1c8672977dd03
	.xword	0xb4bc61ec3966182f
	.xword	0xcab26acf7672947e
	.xword	0xd16c24512b043415
	.xword	0xe1d5b443d6268877
	.xword	0x83bb6e247ed3e849
	.xword	0x3a2bb0f83d0e2dfb
	.xword	0xdc2201850a5ab39a
	.xword	0xd1cba45a4197227e
	.xword	0x04a0e8cc9603be93
	.xword	0xe75da63a93b365c1
	.xword	0x3b59427edca01152
	.xword	0xb4c189b66729eaf5
	.xword	0x369e0186e0e3dbc1
	.xword	0x7bc1bc268c07c373
	.xword	0xc9c55de081f7fdff
	.xword	0x41689d6570413766
	.xword	0x33b7922ba3acb7b9
	.xword	0x34f4b9fbc4b63024
	.xword	0x3aec575d03249545
	.xword	0x36c8faf8aa008576
	.xword	0x1179b7b6623d4347
	.xword	0xd9d3f67157118e40
	.xword	0x7dd869ecb8d84ec6
	.xword	0x6bebcc16d97da1c1
	.xword	0x9dc69584a87bed66
	.xword	0x914839228125f8e4
	.xword	0x16217c4acc0ae603
	.xword	0x4fbb578b27aa6cda
	.xword	0xd4207a0389d2bfa3
	.xword	0x394155e0e2f71e72
	.xword	0x8dca2418722d977e
	.xword	0x20b2855b6b0f2279
	.xword	0xcd0b31b703058236
	.xword	0xe2320adad48c47b6
	.xword	0xb2473dfc83b88688
	.xword	0xa3527b8cc1aeadb6
	.xword	0x2bcb9096055d9044
	.xword	0xe6d07bf2cb0e839d
	.xword	0x816373637b56e5c9
	.xword	0x0153b7a64e682451
	.xword	0x69568edd9365c02e
	.xword	0x356e60bc613b90a8
	.xword	0xe76fbd6b5291ae40
	.xword	0x7677079aa7b1c3dc
	.xword	0xdaf1e379165dfe49
	.xword	0x185818be46140bee
	.xword	0x274c26124eec56ab
	.xword	0xbc7d6ed269c6c2d1
	.xword	0xdd3d4adb3fe8daae
	.xword	0xe6a83964671b1147
	.xword	0x9d0e8f83d710d1f3
	.xword	0x0801bf62250dc4e0
	.xword	0xe82bede3e1f55294
	.xword	0xdd9dc0bbbb5f46ce
	.xword	0x86b15628f8baf135
	.xword	0xa43a8b1e2869b639
	.xword	0x9a8d031d234ef527
	.xword	0x0442266176cf02fe
	.xword	0x6e221bf175b352e7
	.xword	0x5b72f9854958600f
	.xword	0x95d2f4faf65a88a9
	.xword	0xccdfa503c146f80b
	.xword	0xce7f80f4191fefae
	.xword	0x8660f277ff4231aa
	.xword	0xc8f797c086c046cc
	.xword	0x23f4074aa4421954
	.xword	0x54fc1a7df27645db
	.xword	0x1d7ba293059c242b
	.xword	0x947bbbf8f1b32f88
	.xword	0x0bd7237a3eb4fe7c
	.xword	0x6ec38a97297389d3
	.xword	0xbe143375b2d96a3e
	.xword	0x8367e84ba0e297d5
	.xword	0xcda21b374bd555ab
	.xword	0x50d3d00fd87bb925
	.xword	0x6121a99f747156c9
	.xword	0x2214550aca8a976c
	.xword	0x3f7822f816c777ff
	.xword	0x6c8340fb9a0f2860
	.xword	0xc4c39b6f7cee1f2a
	.xword	0xc8bbdb461698f521
	.xword	0xe03ed1536b8c91ab
	.xword	0x7076da3b65a994b6
	.xword	0x2827748e9ecce17f
	.xword	0xaaa01c4f13e7472e
	.xword	0xf48d0f641fb935f3
	.xword	0x088e36e95b0ffb06
	.xword	0x77caaad8d6ce6ecc
	.xword	0xbdec3fde98235002
	.xword	0x2e00b38d2763633f
	.xword	0x8f75bc042513a78b
	.xword	0x68e93ac61173950f
	.xword	0xd8902251077023e2
	.xword	0xf3107c20e2b5b283
	.xword	0xd194f9ac25a1c21e
	.xword	0x1a09e68569c1131f
	.xword	0xed2e3a3ce4f355c8
	.xword	0x9cda428ee3dbcbde
	.xword	0x7bc58fbcd72d6d98
	.xword	0x5818a608ff2bd9aa
	.xword	0x637b1b722f4b1763
	.xword	0x427eef8837cc55c5
	.xword	0x7ad120f0245465a7
	.xword	0x5e083f1a1a594397
	.xword	0x1868c2450bbcbee8
	.xword	0x19223b6d4cf71c32
	.xword	0x74c93c51e27f7cde
	.xword	0xdb31a5fc0eca181b
	.xword	0x26d61a4b95aee4c4
	.xword	0x4d6467fcdac9725f
	.xword	0x7d776cc757d54a11
	.xword	0xc2e4947ba12fc790
	.xword	0x9c9433df5214718a
	.xword	0x8b3ea11ca4723e1a
	.xword	0xb3a20977f18a3abf
	.xword	0xc62d35f55acf0446
	.xword	0x3c35331b75dfb25c
	.xword	0xf7665d098531f03d
	.xword	0x7d76e8b968394efc
	.xword	0x4c81e605f2fc4218
	.xword	0xc4a4a950fe192f71
	.xword	0x2b48c2477dd9e2a1
	.xword	0xad5add225eb2a4ee
	.xword	0x14f6e76f6cbbfdfb
	.xword	0x8a345338459f4e9e
	.xword	0x36ea7709a711595b
	.xword	0x342a347e1f8e5ea5
	.xword	0xc875acd752ef251a
	.xword	0x24af1dd327cc6208
	.xword	0x91c48938b45915fb
	.xword	0x0683cfa1fe59a0ae
	.xword	0xa970988e7db3c1e5
	.xword	0xc8b56866e0f367ec
	.xword	0xdf16a295c8bcd946
	.xword	0xcf451c2ccfd8f84f
	.xword	0xf4d537f4413e9489
	.xword	0x904984d8002e08ff
	.xword	0x32411a948f57fc78
	.xword	0x08a90c42c5a5b335
	.xword	0x828d64dfed07043d
	.xword	0x05f6bb752728ed1c
	.xword	0xd7cbc483156c3d12
	.xword	0xd3efc73a57cb0715
	.xword	0xbae6ee2fdf6676e4
	.xword	0x5f3ff522872f2f4e
	.xword	0xfa7ff0f387dd61e7
	.xword	0x4db8aa4f65b159e0
	.xword	0x3ee4c73a29d1233f
	.xword	0x1aabd0f17d838098
	.xword	0xf89d6e68017aa713
	.xword	0xbbb691c65186e53e
	.xword	0xf111604d69149960
	.xword	0x8bf1484ad35ae264
	.xword	0xd3e1e7ac80004a58
	.xword	0x2f31ef3a72a19a67
	.xword	0xcb22f58ba04c51c9
	.xword	0xc6b3f7a70f506dcb
	.xword	0x4d90975cb9ba3039
	.xword	0x010c10879b728320
	.xword	0x244c810ed04366ca
	.xword	0x65c12f7349a3738e
	.xword	0x1810985f3db8b6d1
	.xword	0x8241df4ff88dd476
	.xword	0x1b6c2b6447fbbee5
	.xword	0x346eb03d44367bc5
	.xword	0x7d689b3874bb5f85
	.xword	0x545149e0a3cd612d
	.xword	0xd99430384388ccd7
	.xword	0x1fd04bcd9cc44d08
	.xword	0x14629eb3a4fadd0d
	.xword	0xa0f1842f019b985d
	.xword	0x5340cd1285e3ac79
	.xword	0x8ea93fb37352c7a7
	.xword	0xec3cec47bee17b38
	.xword	0x86d141c24f2d4ee2
	.xword	0xe1913acbaf14b42f
	.xword	0xe059fce4a3cc97b1
	.xword	0xf43c18afce655ece
	.xword	0xf4d2e52c9533bc5d
	.xword	0x9a569cb4b9209192
	.xword	0x72717a93a17aecb9
	.xword	0xd8e5d12bd8149afd
	.xword	0x3a318719bfecf215
	.xword	0x2dadcfb68765b46e
	.xword	0x34e34831989a8a5f
	.xword	0xcb4c7e11562e96ec
	.xword	0x98b1b21520035329
	.xword	0xfbec64a1e3d95956
	.xword	0xd0f2170dc8a770bc
	.xword	0x92d041c10ccf50cc
	.xword	0x46535a68f72eadd0
	.xword	0xf7d72d0d0541434a
	.xword	0x1e567b2f31576312
	.xword	0xf6debf209c6890c8
	.xword	0xab4705fee03c35be
	.xword	0x33710b972258ebdd
	.xword	0xaa9b7e4f8bf420b9
	.xword	0xf43a39c24017ff60
	.xword	0xab7b6606597c7993
	.xword	0x9167846191ae32ce
	.xword	0x11a9dcbc16f91af3
	.xword	0x9a1e19a38c443507
	.xword	0xfddbde38205b6264
	.xword	0x033c61a3d384f42c
	.xword	0x3006744f116d55ab
	.xword	0x40b078c129bf6bd5
	.xword	0x9b6c182cd082d684
	.xword	0x15f9fc32b7a26167
	.xword	0xfd720c369210a93b
	.xword	0x8d16b207020ed386
	.xword	0x51988a3ffe8512ad
	.xword	0xf3f5b95a1ba23848
	.xword	0x36adbe4bb0754bb8
	.xword	0x79d5794806330ea4
	.xword	0x06e2dc54e52592f1
	.xword	0x10896af547f80d69
	.xword	0x96d5fa9c25e61558
	.xword	0xf9c87c69e916ce1c
	.xword	0x70235e1582007365
	.xword	0x19d729e5bb656501
	.xword	0xc7e64e0b942ca359
	.xword	0xcb50b347f17251e4
	.align 0x8000
	.data
data_start_3:

	.xword	0xd1a80a00fc0046f4
	.xword	0xc11472993b8f0eec
	.xword	0x5a53d63fd7972099
	.xword	0x59cc52d6f495ecb4
	.xword	0x7b642b30b191dfa6
	.xword	0xaf5707dbb544a278
	.xword	0xed7f938391021d1b
	.xword	0xa914cb491af460bc
	.xword	0xfea1a7166a8ea4ed
	.xword	0xbd1b2ed1e507cc19
	.xword	0x743ac9a3c9250dfa
	.xword	0x0433b42277e3f25c
	.xword	0x327d3c16cd7d07a5
	.xword	0xf87ec2dad2d8b454
	.xword	0x62cf5d7e09857188
	.xword	0xde8844c10c3cc141
	.xword	0x4a693921f974c3c9
	.xword	0x131d8c0fcd85447d
	.xword	0x670c9c7fe30945e5
	.xword	0x251a11e18d60905b
	.xword	0xa797482090fbfd95
	.xword	0x6c74454d2c91752b
	.xword	0x075be9cdcc10bba6
	.xword	0xcb30555074287357
	.xword	0xbb2ebe45090ccfde
	.xword	0xa2cc051ece8bc834
	.xword	0x8225afca86156203
	.xword	0xcaf95ae3326ed03e
	.xword	0x22c50b9b496c95c2
	.xword	0x38218d759314774e
	.xword	0xe3b280859892998e
	.xword	0x23e7397c1847bd91
	.xword	0xf10e66b0ebf1077b
	.xword	0x1085a650094468d6
	.xword	0x237d4a5ae74d0d51
	.xword	0x087d8106917fee1f
	.xword	0xea96bbd544e4fc4e
	.xword	0x4c54c33e2476fb56
	.xword	0xdd38ace1f1183480
	.xword	0x5e0b07603876eb2f
	.xword	0xea0261fa9cef6ef0
	.xword	0xaf4aa3a35e1cf1f5
	.xword	0x558099fa423100b7
	.xword	0xa66cd20e9dab6cf7
	.xword	0x3c2b08a4c8938c76
	.xword	0xcfe443305ca22d25
	.xword	0xf79dccec63d12d98
	.xword	0x4f41c840892bda6c
	.xword	0xbfc67a465b9fc172
	.xword	0xb26eca1ea823eb98
	.xword	0xa11ebd0711db9bdd
	.xword	0x8f6189f8c7d91e83
	.xword	0xf10f5dbc8cfa94fa
	.xword	0x4afc12cfcf9efdbb
	.xword	0x6a4a3b964188798c
	.xword	0x8209bf5cbb2c6b77
	.xword	0xef0e9f7f67cf215e
	.xword	0xdc7161250824f9a6
	.xword	0x6aaeda63d69d3ef2
	.xword	0xd61c02bffae1f57d
	.xword	0x445091c54b4d3666
	.xword	0x2ae5017093db3e06
	.xword	0x17e787792b3200eb
	.xword	0xa012c9b9474b52dc
	.xword	0x3cc63c14f647ccd4
	.xword	0x200285b7b8414d3b
	.xword	0x4750f88f3e59df0f
	.xword	0x38a883b0a12e261e
	.xword	0x26032c6ff6d409c4
	.xword	0xfa5a35604f2fa2b9
	.xword	0xe4efecc57a2c8fd9
	.xword	0xd36dad5e66cbc806
	.xword	0xe557c262f74d32ac
	.xword	0xddb31e08af16ae24
	.xword	0x7a28533c3e660863
	.xword	0x85eab973184a9770
	.xword	0x0175c0dc5f348b20
	.xword	0x9239708f5607bb0a
	.xword	0xcc2e9ee67e048829
	.xword	0x87afdaf45c7f93bd
	.xword	0x7705238508ddae8e
	.xword	0x9e316dc6ac54da24
	.xword	0x1edb2dbb8a3e6345
	.xword	0xa6cc711fa77a7512
	.xword	0x8460a62b7e45106d
	.xword	0xbd0513f322a9b381
	.xword	0x13fd5a54d325c3ee
	.xword	0xe527fb1dabd98f5b
	.xword	0x4774b39a16df8394
	.xword	0x3282ddc565afc13d
	.xword	0x27b60528d93c6f30
	.xword	0x15dec633cf64fe1a
	.xword	0x0e439f573b543624
	.xword	0xa40a170f00e08063
	.xword	0xbfacaaba0d87555f
	.xword	0x6b868bd378e9614a
	.xword	0xcf7e0d0dcb6ea682
	.xword	0xd90a5d696e55aebd
	.xword	0xd105dcb91d9ac0c4
	.xword	0xebdda1807adfed22
	.xword	0x613e7ac25cd79c43
	.xword	0x419a6e015960aef3
	.xword	0x3285be2c98f08941
	.xword	0x9e5732cc381ab76d
	.xword	0xc068fab164d75ae9
	.xword	0x3a45ba7a2e341881
	.xword	0xa9c3534743aa24f2
	.xword	0x74b4a9e93835bb69
	.xword	0x1f05e7725423527f
	.xword	0x95cf9af5f985af28
	.xword	0x2bc90cb115cb61e4
	.xword	0x280137f60165c8ed
	.xword	0xd90d26d1c2918469
	.xword	0xe61d659248f3ea5f
	.xword	0x9b7745f42a2db544
	.xword	0x15df079a6252c3cc
	.xword	0x223a4da6ad79b4a1
	.xword	0xbf458f48fdf9ac5c
	.xword	0x8babcb4751dd1017
	.xword	0xf8f47b90cf491077
	.xword	0x44662827ea2f80ea
	.xword	0x5e21c0264b30c7ca
	.xword	0x09a9b992e5c56661
	.xword	0xb36839084c373270
	.xword	0xcb094dd43b3a2477
	.xword	0x078cb774fa2752e7
	.xword	0x97f9effd0eec25b3
	.xword	0x27f0d3c43f7a7d13
	.xword	0x53ab384474e13594
	.xword	0x4cbddf365dbff5e9
	.xword	0x5b9ec878dd61646f
	.xword	0xd9e564c24d085429
	.xword	0x5f1b681d0bc8628d
	.xword	0xe84ae251c1089509
	.xword	0xd4aa1d34d2f1f540
	.xword	0xdefed5b68c7db328
	.xword	0x99da571e6215d10d
	.xword	0x00e24b6ad2221311
	.xword	0xbfaa4e7edfcb3998
	.xword	0xb9ba0281fbf66992
	.xword	0xa66e43a4f503b8c5
	.xword	0x5890ecf9263908e1
	.xword	0x51282c2cbd157e57
	.xword	0x9e77cca02694687c
	.xword	0x65ff83aa142860e1
	.xword	0xf42f3cfc9bc35fbe
	.xword	0xef533e7b6257300a
	.xword	0xc44f13a984d452df
	.xword	0x08071bd1c1ceb5da
	.xword	0x0e1888bad151e763
	.xword	0x0a968d8032ee7bb5
	.xword	0x8fc0173b99613b70
	.xword	0xd292f85533aab62e
	.xword	0xfea1931bdc233e56
	.xword	0x3ba090fbba9fabf9
	.xword	0xbe16a9201d286dac
	.xword	0x333b7c5cf52f6038
	.xword	0x3c5d1a4d0721af71
	.xword	0x3ae313a523d7f475
	.xword	0x233625f6fdd637f0
	.xword	0x8aa46e44f2fc589c
	.xword	0x461d3d66fa7bda4f
	.xword	0xa60a5b66c5bc7dde
	.xword	0xcf61562212300f57
	.xword	0xbf3c42056cb03cd1
	.xword	0x40006b24bf646f05
	.xword	0x269419d90997e191
	.xword	0xc2dc081598f9566e
	.xword	0x1d327ef81168a064
	.xword	0xc946eded6d488b5d
	.xword	0xfe23ff6271897520
	.xword	0xcdf747443511cbdf
	.xword	0x1dcde4366a4ec337
	.xword	0x4d0d6d7a9b1b4ea7
	.xword	0xdc1de29d58cdd10e
	.xword	0xa2efe89754f0b76a
	.xword	0x403c3a6bda56fe67
	.xword	0x2c638a6251c70d64
	.xword	0x4152a408e62e2e24
	.xword	0xa5e0078848f12397
	.xword	0x394d0fb00a4b8508
	.xword	0x1bdbc8560187066d
	.xword	0x8f3b89b854036236
	.xword	0xe8cc241c080d6ea8
	.xword	0xd46646a772c5806f
	.xword	0xc2276a661a1943bf
	.xword	0x5a29ba3f388199af
	.xword	0x702e2d6c355da6a3
	.xword	0x61a3dd24e95aabd5
	.xword	0x31abd6599a5b6118
	.xword	0x02bac274ea818a2f
	.xword	0x9117517c828b21d2
	.xword	0xfc0c816c1e4f11ee
	.xword	0xd0b66a4ff9d9d1a9
	.xword	0x056a421feac709e8
	.xword	0xec4895346556e4a3
	.xword	0xaa231661bb24d061
	.xword	0xa6f8767785b21d24
	.xword	0x1437a74baa16253c
	.xword	0x38f188c1780f3afc
	.xword	0x8a4b638c87289d2a
	.xword	0xa1914f62b5a81aae
	.xword	0xe3688a00d22da553
	.xword	0xfbc12af238e32fc1
	.xword	0x15ab6646424939b7
	.xword	0x9c23b0cb823b1e60
	.xword	0x88b248a38185f765
	.xword	0xc402dface07a7d48
	.xword	0x54aa3d7b319924c8
	.xword	0xef696d49703b8b3c
	.xword	0x88ee2ca973985130
	.xword	0x2320b7d318685ad4
	.xword	0x230f85db3742d6d1
	.xword	0x1f20d4564bc293f8
	.xword	0x47d3fe9f37d442c4
	.xword	0x4c8060bbfc45db45
	.xword	0xea91a09d637174de
	.xword	0x208639cbf4d6d0e9
	.xword	0x09e7a0082515e77c
	.xword	0x5cde3a63f5d54b0c
	.xword	0x9bbaca5e7b05806f
	.xword	0x8295a39b0780d3f1
	.xword	0x3b2dfd0e34ac3cf4
	.xword	0xce4297359270d6cf
	.xword	0x9587530a25441abb
	.xword	0x373088d77630df5a
	.xword	0xfd652d3d8c598589
	.xword	0x8d3e3f93997c8122
	.xword	0x46e8f1ae9fdd6a18
	.xword	0xfbec156285443269
	.xword	0xeade560b5d74df19
	.xword	0xd5f6eaf8ffd1afa8
	.xword	0xd53e95d188da4913
	.xword	0x2666d705a20aba21
	.xword	0x0a97364d0003f393
	.xword	0xa0b04bb135587274
	.xword	0x74d3ec46e8bb6876
	.xword	0x3f70f03d928a8325
	.xword	0x5ddef11ff828c385
	.xword	0x656c81565812a260
	.xword	0x1a52afb220319614
	.xword	0xf16b278cba1cd3a5
	.xword	0x17e02916368ae3f1
	.xword	0x63b2634abc1d8e1a
	.xword	0x9caa31b97836d240
	.xword	0x94717eeef652e3c1
	.xword	0x632affeac7c8b8ce
	.xword	0xf0f51852663bf50b
	.xword	0xb0a793569315c024
	.xword	0xe17397ae83d64d06
	.xword	0xae961e16f11863a4
	.xword	0xb2f7d27c72bf56ac
	.xword	0xdce9587005154dfd
	.xword	0xe120fc3bf5139386
	.xword	0xf17827f99483f794
	.xword	0x1f255fcbc55f0d8c
	.align 0x10000
	.data
data_start_4:

	.xword	0x23b035714c275bb0
	.xword	0x46b4c83700a65330
	.xword	0xb43b73c19834459e
	.xword	0x60e84e18659806c1
	.xword	0xfd1acb2df6e0e865
	.xword	0xb08aea12d5718d0b
	.xword	0x66c79faa7f97c0c1
	.xword	0x725b91d741d01698
	.xword	0x4d7cb436dc110393
	.xword	0xca574527ac1ce541
	.xword	0xbb39c4df3a3f14ec
	.xword	0x4ccb0c2998f3203b
	.xword	0x58252e2a27944a7c
	.xword	0x6571eae38901ba15
	.xword	0xf4924c2b049d46eb
	.xword	0x03427c4aa38c56a2
	.xword	0xa1be0b0e4aa02c2a
	.xword	0xdac8bded5c012f98
	.xword	0x606d0a87a91225be
	.xword	0x04ab1c461be2d17f
	.xword	0x7ebfd78850b48bef
	.xword	0x6c152d7c2697967c
	.xword	0x50b958d44978eb21
	.xword	0xc55f24457b0cc7f9
	.xword	0x8302ce7fed0b95bc
	.xword	0x4504ae5f2c6fbd5d
	.xword	0x9ceeb9b83035b4a5
	.xword	0xb9a97a1e2ffc132c
	.xword	0x619b599b58e0f06c
	.xword	0x3c6988a1b5d198c3
	.xword	0xc114acf5068f437c
	.xword	0xf03f42dcb3022bde
	.xword	0xecddbf5b8d53187d
	.xword	0x69e8b451598b3291
	.xword	0x7dd2056ae495a331
	.xword	0xa90e6aa809e8a54e
	.xword	0x9cb87c5b83095dbf
	.xword	0x5318b8a51a99ca90
	.xword	0x3909217f42ecb6ea
	.xword	0x08820b59e322248b
	.xword	0x79f378c3d943889d
	.xword	0x6d86536519eccc15
	.xword	0x2e0f9605cf1c2019
	.xword	0x7c488fd49f417989
	.xword	0xac2b52f94ca24caf
	.xword	0x35a2f1dddd31e551
	.xword	0x22282a2d4cc0e481
	.xword	0x99b08d3cc8c5edc4
	.xword	0x080f0c469efde450
	.xword	0x554b878e638006f4
	.xword	0xd724eef94345d67c
	.xword	0x4f5bd2b6febd39b0
	.xword	0xdc21faf77cdc1527
	.xword	0x9b6d5fc586a026c1
	.xword	0xec93eb1b272b49a7
	.xword	0x5676bc1e3794504c
	.xword	0xe29d72c5dd73da20
	.xword	0x8ef96fae2ac84d55
	.xword	0x102d2b8feb1f2867
	.xword	0x6d08b4799d38da2b
	.xword	0xed57986b064ba340
	.xword	0x011c423f5950ba39
	.xword	0x78f4107c4115567d
	.xword	0x41addaf4a6910233
	.xword	0x50c74115b9f53d85
	.xword	0x832cc8f94b92267f
	.xword	0xbda8131ae58c10e1
	.xword	0x9108908b3394d411
	.xword	0x45e644651e564c1b
	.xword	0xd30e221830562b4f
	.xword	0x3f3ab2a98e7c8d08
	.xword	0x00d20696b205186b
	.xword	0xbeb35b11ec5bba68
	.xword	0xc14e85d1ede471b7
	.xword	0x322aad44c89d8955
	.xword	0xb439a819c7ba9b51
	.xword	0xaad908c473599643
	.xword	0x8322227428190561
	.xword	0xde88757a669c422f
	.xword	0x1a1fcf6ebefd39ad
	.xword	0xa9786d42d7746b07
	.xword	0x4dc098514a11cd61
	.xword	0xb7cfb5806696bdd0
	.xword	0x5938dbefeb5dca56
	.xword	0xbca8fad93cd0199a
	.xword	0x31a46254a07fdeb2
	.xword	0xabf45845b183a91d
	.xword	0x24ce2df7a28d8350
	.xword	0x75e3336bf7f8400a
	.xword	0xc8fb56c70a437f41
	.xword	0xbf690e83d0e78b20
	.xword	0x61d41f5b111c284a
	.xword	0x64e3881c1df21f7d
	.xword	0xa4a5998467d1cbd3
	.xword	0xce0a599e76665c1e
	.xword	0xcfe68c6705ec3844
	.xword	0xb49ea62309fa0c4b
	.xword	0x720e89994ebc42fe
	.xword	0xbecd20b7fe6aa1d3
	.xword	0x2484c0ef335286cd
	.xword	0x0884d42de3555bb5
	.xword	0x8f3239d60ddf6986
	.xword	0x0a6c07aaf87598ff
	.xword	0x0a8b6553fe066081
	.xword	0x3f2185135da4fc34
	.xword	0x0bc73cb042da9dcb
	.xword	0x323b1006d3ced9fb
	.xword	0xc6288d4139cc6212
	.xword	0xf6ad31c619c12826
	.xword	0x1e0565b40740f548
	.xword	0x0135cc65d3148432
	.xword	0x12371c9240858151
	.xword	0x5feee4ff4e96c7e3
	.xword	0xcb4f06f9eae27245
	.xword	0xbc81e2ef12d5328a
	.xword	0xcfd7bcd63a1932c3
	.xword	0x63127a1eb075cef0
	.xword	0x6c50a7bc9a84a47e
	.xword	0x578109c29685fa56
	.xword	0xf99627251e91c048
	.xword	0x6d95b7867560c8c4
	.xword	0x0dbc446028f0c138
	.xword	0x1b895966b2704977
	.xword	0x9cabb58ced316680
	.xword	0x3b2d7bcf2fd4a4a3
	.xword	0xe0aeca727652e8ea
	.xword	0x860ab1335e152925
	.xword	0x98d2a4cb85a9e59b
	.xword	0xe28206b1ae02405f
	.xword	0x41d70764decfde5b
	.xword	0x5217d812a4ed8601
	.xword	0xd8c1a49d2ae9d190
	.xword	0xb793841cc6f4e905
	.xword	0x104c14a354c13397
	.xword	0xb804fddd6e5a4678
	.xword	0x5fdcc0e31d0b92d9
	.xword	0x09d6907542ef958c
	.xword	0x3f0e3ec4a4b8edf6
	.xword	0xca27ddda33ee2ea1
	.xword	0x648b11620f91b266
	.xword	0x8863ee72c68b19f0
	.xword	0x6378b7ac336dad02
	.xword	0x0fbc2cdca20b5052
	.xword	0x7432e09d6aa08f22
	.xword	0x55c928894ba45368
	.xword	0x785a3cb91c53f671
	.xword	0x1736d6bc6e0e928b
	.xword	0x73619b127f04bc08
	.xword	0xa30d759dc6460599
	.xword	0x105dafcd290201fa
	.xword	0x5f1dd3c146605677
	.xword	0xebb1209d4cd582c9
	.xword	0x4da69b080d6dc5a7
	.xword	0xed64e73c4b82cf03
	.xword	0x00b10f4dffac8224
	.xword	0xf87a1d8f7303b967
	.xword	0x9f4c6658e5f13662
	.xword	0x6792aa9c044f5447
	.xword	0xb88bc0d9468f8a54
	.xword	0x93f3400c2c934f89
	.xword	0xed477c5a034780e9
	.xword	0x75a5014fbcac51ec
	.xword	0x8b5fad1545980d15
	.xword	0xe4c5e10b02df2c23
	.xword	0xe4334a1768df1bf4
	.xword	0x483cd3313a12ef63
	.xword	0x5f5afcbf83eda106
	.xword	0x17c2140790b02082
	.xword	0xe9c8fc5ae3e226ba
	.xword	0x5100e33a50b4ca11
	.xword	0x9dec8393ef360761
	.xword	0x4e85289eace40b8d
	.xword	0x59cf667bc0cf2dc0
	.xword	0x053ccdcfa6d85c9b
	.xword	0x05e51749264aa0b6
	.xword	0x6fd15bef09ad486a
	.xword	0xeb0cdcc015d06715
	.xword	0x6d6d052971bbad0d
	.xword	0x6d101c5992eef7af
	.xword	0x9d4a2e39cef87382
	.xword	0xcb4b5f76c54c6110
	.xword	0x2bebc549ab147fcb
	.xword	0xe9c4805c3ca4941b
	.xword	0xc9eada22ef8cb291
	.xword	0x3fa9b6d5cc78ec53
	.xword	0x16e6a647eafa1592
	.xword	0x81e0700de6b79d51
	.xword	0x974f57ae69148863
	.xword	0xc8e2e8e821c9ee09
	.xword	0x5544cb477906b3b9
	.xword	0x25ea872e7f6eb7b7
	.xword	0x837fae93f8829f56
	.xword	0xf8e701a23d10b80a
	.xword	0x3c3986284471bbcf
	.xword	0xfce34c56fe910e51
	.xword	0x7f930d1dfd1526be
	.xword	0x2796d0b667247edd
	.xword	0xb6a905562693aefb
	.xword	0x2717c804eb082352
	.xword	0x97d509214453d6fb
	.xword	0xf4d0c02ed19efd21
	.xword	0xb1934753e732fa2a
	.xword	0xb904485d17ac84e1
	.xword	0xde17a2abc696b9af
	.xword	0xf50ca3589e5123cf
	.xword	0x558d027ab559df42
	.xword	0x7a12e69757111870
	.xword	0xaebbb7be1f0ac853
	.xword	0x3986fb6cde028952
	.xword	0xa7a6795f21c826cd
	.xword	0x6ea922082286ddeb
	.xword	0x728c2268c8b7b8a2
	.xword	0x5c271157e84760db
	.xword	0x37cd23136f523a1d
	.xword	0xf7f358359b9834fc
	.xword	0x33a0ddb023357594
	.xword	0x39e96231c8482bb6
	.xword	0x342137344d1ad300
	.xword	0x525d9e2defaa2023
	.xword	0xa84e4bc3e5f2ab38
	.xword	0x8b4a1792f82f2b03
	.xword	0x9002d078bbe687a3
	.xword	0x5e3bed6af52ea6d4
	.xword	0xb010297d4b647dd5
	.xword	0x7ee13e3e5e79d80a
	.xword	0xc0a5a758f095afdc
	.xword	0x05336b1af3a00927
	.xword	0x93a3113eeb958720
	.xword	0x72df2a46452b6eb9
	.xword	0xbc7712c8903cfaa7
	.xword	0xa399fabddb914108
	.xword	0x4723ba921bdf33e0
	.xword	0x288e21c430703b46
	.xword	0x48857baa9be4fa67
	.xword	0x97ced5dacf151d46
	.xword	0x18c32a7725eb8f59
	.xword	0x670f7a9f106cc697
	.xword	0xda7d599db4d3c739
	.xword	0xad87301b7f4a6656
	.xword	0x4305583ae03431a7
	.xword	0xb054544c142f83a3
	.xword	0xbdc99548d2cbf7f1
	.xword	0xaa5b8698d212f3ca
	.xword	0xcfc20f1ff956299b
	.xword	0xcacf5e10a0e2f3b7
	.xword	0xd05fb37e4499e246
	.xword	0xb2f798daa3cd868c
	.xword	0xdc5627f09ca9158d
	.xword	0x8b3b83901a876f9f
	.xword	0x9c0e4b2f3cda3c1c
	.xword	0xd37fb9f13697edc1
	.xword	0x0a0a3d593432d8c6
	.xword	0x5026acfb0d512c5a
	.xword	0xa23550814cee0f9a
	.xword	0xb970db487cbfeda5
	.xword	0x1c96d5b6c3d4864e
	.align 0x20000
	.data
data_start_5:

	.xword	0xa2478d0ffdc165b4
	.xword	0x277ac0d980489e3c
	.xword	0xce5feb36d312a469
	.xword	0xcfddd018282249ab
	.xword	0xa45b76f86a40f929
	.xword	0xa34e527adf9919f0
	.xword	0x64929c0e52e22a85
	.xword	0x0d1426fd62318797
	.xword	0x37c3fc90f97137b2
	.xword	0xe5a2fcfdafe1d856
	.xword	0x2181159e418d8b2e
	.xword	0x367ee04b76e9e718
	.xword	0x055ea48578298269
	.xword	0x93a838b52929124a
	.xword	0x7968b2f933f169b7
	.xword	0x275a90c2b6045ca4
	.xword	0x7ff537f0e7d0a0d6
	.xword	0xf587cb8e88495c49
	.xword	0x8a897c040bdbe896
	.xword	0x2c6a54e452d2b317
	.xword	0x9d2508dc2ca5795f
	.xword	0x1f1b44963c67f05c
	.xword	0x0bf0170eab1d6e49
	.xword	0xb6962cafbf65dbaa
	.xword	0x952c4ca5cf43f3e8
	.xword	0x18d657d0965acc01
	.xword	0xd2299b47838e618e
	.xword	0xcfa9792377e51fba
	.xword	0x5dd7085cc6a774b6
	.xword	0xc90d363344f36779
	.xword	0x155d990f9eda8733
	.xword	0xe17e9ec0b9e4b75f
	.xword	0x434fc81350280b08
	.xword	0x1d28bed3a9980bcd
	.xword	0x2dfcfdef50e22cd0
	.xword	0xd0cdd1513c94acc0
	.xword	0xae7d8e437b55dea5
	.xword	0xa255ef104006350a
	.xword	0x96d2390423383687
	.xword	0x10a130c646039351
	.xword	0xab110edfd46351d5
	.xword	0xff6941a7bfde941a
	.xword	0x3aa82d63159339ae
	.xword	0x331cb9186fd4f502
	.xword	0x6e448aea213bd43c
	.xword	0xa289436fba78ffd8
	.xword	0x7befc49c7b277ac4
	.xword	0xf79721c258c52119
	.xword	0xd07f4d7f9ccc3ea3
	.xword	0x219daa31f419298a
	.xword	0xa26a98df855c3063
	.xword	0x9a3e06ccfe5ef391
	.xword	0x6d1407667d7edff2
	.xword	0xd110416359d58819
	.xword	0x8b9e18da69833034
	.xword	0x5756b78bd994c6df
	.xword	0x8eb9cd5ca3f558ce
	.xword	0x0e82ac6d3a68c22a
	.xword	0x39c7614100e50009
	.xword	0x5d94909c8106eebc
	.xword	0xd73b3b728778f32b
	.xword	0xb006c2212cf29a44
	.xword	0x25b3bf03faeba370
	.xword	0x632008d076c5ada4
	.xword	0x732936cb0fec47f3
	.xword	0x622773acdf9ab82f
	.xword	0xd31187418440d7af
	.xword	0x4b3cb525c8996fa3
	.xword	0x2dec0ef5b84139b5
	.xword	0x19440b09d457b399
	.xword	0xb497f62859c4d5fb
	.xword	0x902ea3f9ae0fc3f3
	.xword	0x8a0ae512d191ea5f
	.xword	0x9e25a702c3a0d8eb
	.xword	0x5ad8c171a926fbb4
	.xword	0xdd4f21443d99c133
	.xword	0x095ca2ee78613d3f
	.xword	0x78a594489bcf00dd
	.xword	0xc1a8bb2db5d53a1f
	.xword	0x4e8dabb38cf74d54
	.xword	0xee6a714ec6b70444
	.xword	0xb06e010a4d367d95
	.xword	0x389c692495d6fcc1
	.xword	0xd32b80156733bf3e
	.xword	0xa512d43a7cfa5e8d
	.xword	0xf4ee4fde0e4cb6a6
	.xword	0xd1b57ab2fa36eab0
	.xword	0xcf7ebbd9355f4e53
	.xword	0x33477b82e518e03b
	.xword	0xe023709e3ac7a687
	.xword	0xa429a873cde7ca84
	.xword	0x9b73842edc78397c
	.xword	0xb112850cd34035b4
	.xword	0xc0c3d2e062b9cf79
	.xword	0x67cdde9b6d8fee96
	.xword	0x98ca57d8ec6886f9
	.xword	0x9363626f785724e1
	.xword	0xf843ca395e8a68d5
	.xword	0x5c3b6fea51a4381a
	.xword	0x987bd3bf2ede60f0
	.xword	0xefb545e6a541cc2e
	.xword	0x3d5c7943e7440a13
	.xword	0xff5f5d0b16140e70
	.xword	0xb9d18c3e1bb1af99
	.xword	0xc931c8cecabd5904
	.xword	0xb5632ce4e0d1e677
	.xword	0xeada0d342b55eb1a
	.xword	0xb22158ca0e9d6f9e
	.xword	0x0d67b7d8dcdb6f61
	.xword	0xea862d53ac8c4bc6
	.xword	0x2ca21ad198f7376b
	.xword	0x02877a8998886827
	.xword	0xfe9e49c3590f2e1a
	.xword	0x1b36b27b541b68a7
	.xword	0xa7da1119f77dcfe1
	.xword	0x12a647064272acfb
	.xword	0x09f32391add6e312
	.xword	0x372fc5fc7b8d1da6
	.xword	0x2d8f2db8985238f2
	.xword	0xb9a45b848517071c
	.xword	0x5c7275c2c772edf9
	.xword	0x807f99ebb92b2250
	.xword	0xca3e107c1a9de4ba
	.xword	0x8e596c0a12d90c54
	.xword	0x5170b4facb84be4e
	.xword	0x1712e1c84c9c62c7
	.xword	0x558071b9744c230a
	.xword	0x9c44526415d8239e
	.xword	0x117c1be8dbd73d74
	.xword	0xbfb396f963896b27
	.xword	0xee14df26103ea03c
	.xword	0xd3675cdd1ae5423b
	.xword	0x01e0b41629532dad
	.xword	0xb1cc7d39e05b71aa
	.xword	0x3af017f12ee33cb5
	.xword	0x37a669180f58b78e
	.xword	0x24036ceb1fac3f7a
	.xword	0xbd6828e5f252b0c6
	.xword	0x11860ae0297dfcbb
	.xword	0x4ec3a28ea115670a
	.xword	0x5b83b4c1b6b713e6
	.xword	0xaf7413d056ed7592
	.xword	0xe564ef68e993cd11
	.xword	0x6d5e565b09e4caa7
	.xword	0x8dc387ecea8a3162
	.xword	0x1f3715fbe42d6066
	.xword	0x17b05977579e3e49
	.xword	0x7cee474f7bf16afa
	.xword	0x4461fbf0f78cea44
	.xword	0xd027ff832b4a05f3
	.xword	0x07565915138a1e99
	.xword	0x687d264d2322ec40
	.xword	0x8918e16d4c004e74
	.xword	0x206975961e590949
	.xword	0x4c018c9028a3be41
	.xword	0xb431dd391378c20c
	.xword	0x842c904e0e0abddc
	.xword	0x02194a4c81e72545
	.xword	0x03f8dbcac4a5806e
	.xword	0xf0bfabb3f8d92988
	.xword	0x5069a66e0c702684
	.xword	0xe775c96c9bcba8b9
	.xword	0x2605bc196226d467
	.xword	0x69a70518f938fac7
	.xword	0x2083d04f56182754
	.xword	0x462b1d23a989f5c1
	.xword	0x86049a2f8c39204a
	.xword	0xc10562da4583b73a
	.xword	0x3bb11b358fa93244
	.xword	0xcdd93502bef8c8d3
	.xword	0x1f995c5de976c92f
	.xword	0x8dd2de9db324e7ab
	.xword	0x112f6c8be664b7dd
	.xword	0x8a4f0db829ae8c9e
	.xword	0x98623656eb901763
	.xword	0x23812e7b4826fe19
	.xword	0x70998db196efa79f
	.xword	0x6d43aba42fa3fa9f
	.xword	0x9db850930c41ea00
	.xword	0xfe29d1a3c678ba51
	.xword	0xdcd983f27a6717a1
	.xword	0x2708b31842042b09
	.xword	0x477665f1f6a3e1ca
	.xword	0x84fc31a5d4b7eefa
	.xword	0x543f13cc46fd29c0
	.xword	0x7ac4d0f08290517a
	.xword	0xa8166060000f9cb7
	.xword	0xab5450d5025c9932
	.xword	0xc1f7bded3c54ade7
	.xword	0xa669dc99d50d7a67
	.xword	0x3b6da3b1635a1e79
	.xword	0xa358fbe3253b40ac
	.xword	0xbc280c4dfd75dbc6
	.xword	0x3dff8c92bdd4c7d6
	.xword	0x4001b627d16ac0e1
	.xword	0xc91dbe4626977306
	.xword	0xb82384553322ec5e
	.xword	0xc647600a798a41ee
	.xword	0xcd45f06367f41fe1
	.xword	0x74d1d0b76c63b719
	.xword	0x800fd6fcac6e563f
	.xword	0xa7c46f3cb3ef3551
	.xword	0xcf50102538398ae8
	.xword	0xb12be56526d24bfc
	.xword	0x839aeb9eb50cc6bc
	.xword	0x462d536c6d280f58
	.xword	0xbaab9ea2f999ffde
	.xword	0xaf880be9524c9e76
	.xword	0x272f83ca6b22efeb
	.xword	0xc7d241def571514e
	.xword	0x9916379af224d5f5
	.xword	0xaf0a1d73bfb822b8
	.xword	0xe6f9c2ae2b4cc5b1
	.xword	0x403d24130869d47c
	.xword	0xd0da8500e2be5976
	.xword	0xa8f4fe23548190bb
	.xword	0x46df75f1545484d5
	.xword	0xa97d578c8dfaaeb0
	.xword	0x7e98c8919c4d91c0
	.xword	0xfe14a3f74ca30ae5
	.xword	0x8ce0f3e89b397788
	.xword	0x17d2e5fb400ef450
	.xword	0xddd98207cec20d6c
	.xword	0x348b0b5372a5ec54
	.xword	0x727e4dff2f8187cd
	.xword	0x313cc98e965dd4b8
	.xword	0x4c9527c1f9f899b9
	.xword	0x297ffb28e332f3fb
	.xword	0xa7e65c1bea4d48e4
	.xword	0xf999b82f63c5ee9f
	.xword	0x11856f6608741ed4
	.xword	0xfa96377f35819c06
	.xword	0x587ca4347fb115dc
	.xword	0x535c64b6f264836e
	.xword	0x76c461c875439c3a
	.xword	0x7ed70da4627be18d
	.xword	0x827a52888261c79c
	.xword	0x1c4a90ec67446bf6
	.xword	0xacda97ccb57c9a3c
	.xword	0x436b84d6bda2170b
	.xword	0xfa2e477eb3d2cbd9
	.xword	0x6f5f89307de95d5b
	.xword	0xf9d001524b5f0d60
	.xword	0x5494a884f4dc767d
	.xword	0xdf088f2d389c786c
	.xword	0x3e9310bf0bbb3626
	.xword	0x2f144c13dcd34aae
	.xword	0xeafd83a39c701df8
	.xword	0x3f0e436f150687fb
	.xword	0x4364bee6372ab4a5
	.xword	0x3bca1c69c6e74ba5
	.xword	0x4680001d45ba6c3a
	.xword	0xc806b44991994eda
	.xword	0x56ab8e0ee54c0bf1
	.xword	0x84f9718e9242a90c
	.xword	0xf9593869c36286f3
	.align 0x40000
	.data
data_start_6:

	.xword	0x1b04de9e6ce0bebe
	.xword	0x960130b97c8742ed
	.xword	0x8767f1ce7b862a35
	.xword	0x5fa454a8c196053d
	.xword	0x2f39558da907a5da
	.xword	0xe83d2648741944cc
	.xword	0x3ea95cca88df23be
	.xword	0x19283a906eda94cb
	.xword	0x7e0c5ad46c1d7bd7
	.xword	0x4bbc379158e5e633
	.xword	0x04bb5b6fe5fcbe13
	.xword	0x5e4ec99c73c941ba
	.xword	0x554217b84f2e96be
	.xword	0x49138fe59fd24eca
	.xword	0x8fdd210de41fa0f5
	.xword	0x87e4b604a569ada8
	.xword	0x24d105d128867f29
	.xword	0x1e247b1851db0513
	.xword	0x2777c336c284502d
	.xword	0x2280f629b12ed581
	.xword	0xa52efea28107681c
	.xword	0x5245880eef14459a
	.xword	0x427f8f9e3dba40e2
	.xword	0xd96f50672a83dd9d
	.xword	0x2d9b351bdf585083
	.xword	0x3d1ef474cbdde80a
	.xword	0x2b258f6d0093c4c4
	.xword	0xb76d2e9a6a997e6d
	.xword	0xb6531b126a4ca7f2
	.xword	0x6f6eba712785e247
	.xword	0x59fe67eaaae284f6
	.xword	0xbdacefeb795423ab
	.xword	0xe031d5cd93eb89bc
	.xword	0xe39a1dcf6fa36564
	.xword	0x1a2e3641ec048fb7
	.xword	0xa3ca2a26af389224
	.xword	0x5acf1976cdb26862
	.xword	0x820db8d6c62a8806
	.xword	0xab89cd765a6a05cf
	.xword	0xb04d1f32b4b8e51b
	.xword	0x2a63863e6115f9fc
	.xword	0x7ac6bc77ce51ef0b
	.xword	0xc7f5bfc1a51cc613
	.xword	0xb0de56ea28035c8c
	.xword	0xba2a00561ed87f27
	.xword	0xe7ea3bafa5731b2b
	.xword	0xb2842489000c80b5
	.xword	0xe4bac29e5eb01faf
	.xword	0xe4d7c3da77ebbd0a
	.xword	0xbc568ae8a48f7d32
	.xword	0x78e70295a76ac7bf
	.xword	0xd6a3610d157c1227
	.xword	0xb6508e227f2d1a4b
	.xword	0x2f5004f34ca530db
	.xword	0x7889bffa0b9ae6ce
	.xword	0xe12a32cff1db6f79
	.xword	0xb6b6f3fe2028b073
	.xword	0x6cef4d7dc799708f
	.xword	0x7e1c635f6f909736
	.xword	0xa10ef8550cf5fc2c
	.xword	0xd7d30727c14cd84f
	.xword	0x9e565ada1aa39385
	.xword	0x6a068b1030148472
	.xword	0xdf06780d4658dac8
	.xword	0xbce46909a3fde268
	.xword	0xf1762e69d857733b
	.xword	0x7fcc6023f6b066c8
	.xword	0x790ac24b1fe6c54a
	.xword	0xafd76c4177d1e05c
	.xword	0xa2c0ead42ba85ad8
	.xword	0x26e3187e173b7d67
	.xword	0x6145b11cb0f50bd9
	.xword	0x8e5edfe642ac7ec0
	.xword	0x5a4e840c7fb53224
	.xword	0x4897ed609fc80ec6
	.xword	0xf6297fa4d2ab1fc7
	.xword	0x1a5232cf8284e0f5
	.xword	0xdc3130654ebeb903
	.xword	0xc49b09a997de3269
	.xword	0x656cf496ee1700f8
	.xword	0xb7997b7738bf7082
	.xword	0xaa799f8b7a5373fa
	.xword	0x809092768aa6b30d
	.xword	0xa3e40d28d8765404
	.xword	0xd1925920300d8139
	.xword	0xe71233a67cfef332
	.xword	0x44fe4d59cfffb2c5
	.xword	0xcb0c7c2c768386be
	.xword	0x8010259b967e0251
	.xword	0x79f0b2cf8346735f
	.xword	0x2da0531453090853
	.xword	0x6630eb6bf3a8c856
	.xword	0xa0153c30a90abf4b
	.xword	0x2a29f1915d8bfff2
	.xword	0xd7d7f2200b4030a4
	.xword	0xdc9e43dded654bfc
	.xword	0xc8c5fa5826ce8e44
	.xword	0x22048f14308550a8
	.xword	0x167d84caef5d91a5
	.xword	0x484b4ee739fcef7d
	.xword	0x373154e01d2d4e6a
	.xword	0xa08e440718ead3e4
	.xword	0xacbe0f4bd54d9dec
	.xword	0x687362fcc957b8d1
	.xword	0x07671474d8f9cf0c
	.xword	0x56e3bd631e78d944
	.xword	0x1b3b6f16cdd53dd3
	.xword	0x0529ff9b09f7413e
	.xword	0x23edccfe7bfc0006
	.xword	0x8304031f9f9b6047
	.xword	0xad391fd5481c1705
	.xword	0x8c6b4f480f2c2342
	.xword	0xdf1a26023444a1fa
	.xword	0xa7689b553f78a910
	.xword	0x1429673e0f3bbb3b
	.xword	0xa933547b8fb9bee0
	.xword	0x05f803e0078341d9
	.xword	0x3289629355abf729
	.xword	0xc0a771d4df134984
	.xword	0x43685d612a69d9dc
	.xword	0x97c03c792bf05cbf
	.xword	0x85af094b1a19e571
	.xword	0xa96166bf9fda5e37
	.xword	0xa95f1e5894e3bf85
	.xword	0x3c366a659de3ce2f
	.xword	0x21201bdcb2e3153d
	.xword	0xa167e5978c739699
	.xword	0x529d589b64d7b68e
	.xword	0x20caf4cef15cf897
	.xword	0x3be8b53e92f29edf
	.xword	0x65d4dfb6615011da
	.xword	0xec1b05367d2c97cc
	.xword	0x6e8b8a014a982ee0
	.xword	0x40b36618c91fba1f
	.xword	0xe24fef0a455fbc14
	.xword	0x092975496ebcf23c
	.xword	0x03a42f704cb6371d
	.xword	0x4925ff0be263d7a1
	.xword	0x9963f24762f9e624
	.xword	0x0f8773e5651a373b
	.xword	0x49b485836537e381
	.xword	0x1dda87586677885a
	.xword	0x136d733e9b12fc6b
	.xword	0xa674bf1c2ad38285
	.xword	0xec9112c133b4e2f1
	.xword	0xffb3556f3a760a02
	.xword	0x21ea2152bec80d93
	.xword	0xd4e4ccffa20db7a8
	.xword	0x62a900aed7c57356
	.xword	0x38a720ca8e415b6c
	.xword	0x1034a111fdd2e2ac
	.xword	0x10abfea6f6449055
	.xword	0xf5463749bfb5322e
	.xword	0x6a50cb0cdb953282
	.xword	0x97aa64c9198f8de4
	.xword	0xa88ab1afe7b6839e
	.xword	0x93a72cf8113a72ea
	.xword	0x47b1459f8cb10651
	.xword	0xb5d0bc783cdec169
	.xword	0x8a35b2b6e5c59780
	.xword	0x90db3f64f6885169
	.xword	0xffaf0936ea5183b0
	.xword	0x29cd8daea2082498
	.xword	0x7cb62b9d21c79a47
	.xword	0x7478738ddd38bf91
	.xword	0x0e3adf111974f1ae
	.xword	0x356d080c36846d39
	.xword	0xe6dcce831a1c1fb5
	.xword	0xf5d8da45c4105f06
	.xword	0xe46bbe54ee4c1c6b
	.xword	0xdb0efca67c0635df
	.xword	0xfdecebfbd24f8054
	.xword	0x3fb3b28c0e8f8e8d
	.xword	0x96029aa3c208c20f
	.xword	0x3015bb0e064274c8
	.xword	0x5d96ea54d3aea72a
	.xword	0xd0887bdb2bfa9a0f
	.xword	0x914911c1705f1dbc
	.xword	0x3d4eb027ef55b438
	.xword	0x5bf07e03ea1fa146
	.xword	0x7d8fe4ece9337a4b
	.xword	0x13820a655582032a
	.xword	0xdc90b2711720e009
	.xword	0xba5604c4468d4f0a
	.xword	0x31dece8141e5881e
	.xword	0x281f90b6e2821b59
	.xword	0x7ae2ec1e5d2bbbbb
	.xword	0x31c591248d3dfd88
	.xword	0xaf72f83517bcacbc
	.xword	0xe9d7a0d44f147d18
	.xword	0x4ccf5a145b3c47aa
	.xword	0xd86c15e1d854f0aa
	.xword	0xcab2624d7685365b
	.xword	0xed8306e58ce9d83c
	.xword	0x922ac1726ff1ffbb
	.xword	0xcbd466c561e95e32
	.xword	0xe334879ed6d759e1
	.xword	0x06b0abc3729c8a03
	.xword	0x17659a48b9f68828
	.xword	0x29f8d10f5de2b824
	.xword	0x0b0321df19b5f39d
	.xword	0x227fd2e45341d9b5
	.xword	0x2e4ae0bd6c4a6c66
	.xword	0x1c5436ab34287185
	.xword	0x5b6700f76e41273e
	.xword	0x1ad28691c9409912
	.xword	0x5cc4be9fd3d0be77
	.xword	0x09e013db64cc8e21
	.xword	0xaaacda9c661c93b4
	.xword	0xc0f5dab2197d7129
	.xword	0xdcbeb0f5cbf97472
	.xword	0xf891ecd5516a3f41
	.xword	0xaf010fd74666965b
	.xword	0x9203c20ec16517fd
	.xword	0x4d3d277ac8f70a97
	.xword	0x843a83e920abc1af
	.xword	0x0abdac8ad77ed495
	.xword	0xb0e7cbe3b82cffaf
	.xword	0x743a197cbc699503
	.xword	0xdc36a86866919399
	.xword	0xefb5b269b211fd37
	.xword	0x8cad016cb335006e
	.xword	0xfbf42c3e229f508a
	.xword	0xc146ad90b162715b
	.xword	0x8863f109a833389b
	.xword	0x48c82e50ae84f144
	.xword	0xe091d40fc5efd317
	.xword	0xb58043adeb86f9ce
	.xword	0xe8877d732f6db6a0
	.xword	0x744f11cdd1f6ff7a
	.xword	0x1ece44541dd1d1b4
	.xword	0x254902b1748733b5
	.xword	0xc5f12d991edf13e3
	.xword	0x9b4a9310c6843179
	.xword	0x2518ac02554ba85f
	.xword	0x7749f7bfefe6ea13
	.xword	0x7cefacf1d3941dc4
	.xword	0x1c078f538ad6227b
	.xword	0x1c69ce7c2772dca2
	.xword	0x8edd394512df5246
	.xword	0xdae9d7d5ddedc34c
	.xword	0x0ea74074bf606008
	.xword	0x58c87481f532c27e
	.xword	0xf0ba20e2304c2fcb
	.xword	0xebdbc872dff42a6b
	.xword	0x28f472f083cdc455
	.xword	0xf25049c7f9f4d1d6
	.xword	0x3d01ca2ed38fb8e8
	.xword	0x205a42b2be936058
	.xword	0x76616fe07df76ec4
	.xword	0x46bcbf7c5bedf502
	.xword	0x6c24f3ff7763f379
	.xword	0x0a37f1dab7a681c5
	.xword	0xdacefcf5cf2d10fd
	.xword	0x04a113d0e3a00032
	.xword	0x0aac337dbf307f0d
	.align 0x80000
	.data
data_start_7:

	.xword	0xd18dfd625d43c829
	.xword	0x43481c3244e97ed9
	.xword	0x3f589c77271242a4
	.xword	0x20e02e92effe2bac
	.xword	0x58925674a45fb248
	.xword	0xf16020b9c37693e3
	.xword	0x6908b84c399eab01
	.xword	0x512e29fb244eafc5
	.xword	0x95bedf504b1d3cf9
	.xword	0xbc6f8e4182eb5773
	.xword	0x7249608704fde40a
	.xword	0xfd0f8027216a350d
	.xword	0xa698e4c11fc98617
	.xword	0xa3fc6046ae6c1943
	.xword	0x7ad1f8369237425f
	.xword	0x1ca4cbd7510a60ec
	.xword	0xdf3845740da7ea02
	.xword	0x15316c31335e3e1b
	.xword	0xa7b4528cd476c46f
	.xword	0xa3f36f767010b6bf
	.xword	0xdd42cdcfd4e68049
	.xword	0x960c1b3daa18eb35
	.xword	0xad854c4920b0818b
	.xword	0x80ca64b105bf9966
	.xword	0xb368ba0f3921619b
	.xword	0xacdde4a8b368b351
	.xword	0xd08a68d508293c86
	.xword	0x52f5c59ac295ccc4
	.xword	0x50c610e384ee9110
	.xword	0xc51ab2967b61f44f
	.xword	0x6ae5afc54e92da2f
	.xword	0xeb498a385288a685
	.xword	0x02e5f0aa9b8fd681
	.xword	0x51f634522cba4e5f
	.xword	0x7159047f98e1c0be
	.xword	0x3221e97640da5203
	.xword	0xf78ad739a1b1d619
	.xword	0x416c8c944aba2334
	.xword	0x500880859d320b78
	.xword	0xe257f68303cc4458
	.xword	0x130efdfeffc67b97
	.xword	0x081c50fdc13610b0
	.xword	0xf6dd02b852390e27
	.xword	0xc5a8599981c8c959
	.xword	0x8ec96baf5849b452
	.xword	0xa86bc7ccbda29ece
	.xword	0xc2ba42d204d5a084
	.xword	0x0ad1f02152f1d024
	.xword	0x5c6158b78abac788
	.xword	0x082555d6e29a6b6c
	.xword	0x767884062e3b2814
	.xword	0x1182d40a7ffecfad
	.xword	0xd6589970a20a16c8
	.xword	0xf843cc50dff1d04d
	.xword	0xf1e94d00bb924fff
	.xword	0x8cbc63bde3d92efa
	.xword	0xea70ba8c44b3c18a
	.xword	0xc65e1d9f37529f82
	.xword	0xb5ba0f9db8fe9cc3
	.xword	0x8c2554c2fd5ebad4
	.xword	0xd9d08950f7d33c33
	.xword	0xf7b94b248b0ecc7d
	.xword	0x151e923b2856831f
	.xword	0x42a90fbcefca279a
	.xword	0xa1b203b851946145
	.xword	0xb2603ce593bfb278
	.xword	0xd434ce0c32ee52a8
	.xword	0x4586d03f5899e985
	.xword	0xb6bc4e3b56274c4f
	.xword	0x3c47aba46af9017e
	.xword	0xdba2a8626974d182
	.xword	0xe0fe08b42258d061
	.xword	0xfa29c3ab17d86edc
	.xword	0x806513a48f7a25f9
	.xword	0x741aa428669a290c
	.xword	0xc28f8efeac3e89b5
	.xword	0x2a15702937b775c0
	.xword	0x746ffe93b75302a9
	.xword	0x3a9e8ebc231d4f2a
	.xword	0xdb8eeeec348db3b5
	.xword	0x0819d6661f00c26a
	.xword	0x63f9a6af69affeb9
	.xword	0x2f2eb424105b844f
	.xword	0xce8914fa172384e5
	.xword	0xc17d5bc2a203af5d
	.xword	0xdef8020e0ae4a85a
	.xword	0x5a2b642f09ab6c50
	.xword	0x1c173c6f8b4d20f7
	.xword	0x81a504066e66c05d
	.xword	0x25381510556270c6
	.xword	0x74195fba028c4ab1
	.xword	0xc41fc43c544ab868
	.xword	0x9ec956feb59be3d1
	.xword	0x548a7ba20ec58ec6
	.xword	0x31bac5241d2078a1
	.xword	0x1395a44b963c969c
	.xword	0xf38fb70a088cf925
	.xword	0xf07629f47a33efed
	.xword	0xb9db28b4628c6e06
	.xword	0x48703a5d438c19bb
	.xword	0x070967e6858ef665
	.xword	0x4deac3ac1de7633d
	.xword	0xcd182ddae7a3e54a
	.xword	0xac09a896d50dcd53
	.xword	0xca3bc1d4d07133c3
	.xword	0xc629ab4aae155f98
	.xword	0x78964fc2ca178b6c
	.xword	0xe89f17b40cf14592
	.xword	0x59246cf4e6856f6e
	.xword	0x5bc78969bdc98790
	.xword	0x90c318dc6f15b1b2
	.xword	0x02b95d41c954d9cd
	.xword	0xf15dd74a83ae0ca1
	.xword	0x7cd57cdbd9e3cd94
	.xword	0xc449e321cc537499
	.xword	0xa1e103170b8d1ffd
	.xword	0xcd00d2cc326fe10c
	.xword	0x787db123ad6708b3
	.xword	0x57d94ef4b649d20f
	.xword	0x7bec462c783f02a7
	.xword	0x30a7d184fc7bd2dd
	.xword	0xbd8194ec92ddd08b
	.xword	0xe746308623646d6f
	.xword	0x9e9729603967cb53
	.xword	0x511ca8ee1ae3d4a6
	.xword	0xe95cbbc1dc8a51c4
	.xword	0x37185b02f4dba4da
	.xword	0xb88c0e9d51b154a3
	.xword	0x93061cf8275e0f8c
	.xword	0xb872d2f050a3ba05
	.xword	0x1077565fb767474b
	.xword	0x122bc44ddeb11564
	.xword	0x5d361eed03c0c781
	.xword	0x4bce0c1595ac0f69
	.xword	0xe3161c5c517a322e
	.xword	0x848e0e78b30b980c
	.xword	0x0bece9b5210702fa
	.xword	0x32568288a5f61211
	.xword	0xa80ad7d7087a93d6
	.xword	0x0b3b781423be3ddc
	.xword	0x65ac859f3e2f350e
	.xword	0x7b2638a59bc22484
	.xword	0xdd2f43f6859b6aa5
	.xword	0x0257a61e6c49d829
	.xword	0x0b3076e6746fff11
	.xword	0xf04e4a100ad609f0
	.xword	0x165e19d112eeddb3
	.xword	0x2c39ddb471e223a5
	.xword	0xee7d233673471abb
	.xword	0x2bae4bb695fa4b2d
	.xword	0xc713cfe342edd387
	.xword	0x1212f6daf674721b
	.xword	0x29b71425af5052f8
	.xword	0x0a6273e8411c7f47
	.xword	0xcfd93bad1210ed96
	.xword	0x78bbfecd7b7408d1
	.xword	0x0e7336da07f6e38b
	.xword	0xe8262bc49dca00f5
	.xword	0xc8857a74463c8d0c
	.xword	0x4fa9f9370c321e9d
	.xword	0x22fb9ac1f33dfcd6
	.xword	0x2c25ca90cd938633
	.xword	0x910baceaae32368c
	.xword	0xc46b18861c4859e8
	.xword	0x5167daa462dfec90
	.xword	0xe73c7ab205b4ac28
	.xword	0x03f6f4874f0b1180
	.xword	0x3704a7809a9fa711
	.xword	0x417a816a49a05532
	.xword	0xd29df157950fe128
	.xword	0x490bc12e46865fe1
	.xword	0x2c79ec85a0277c60
	.xword	0x5585252c40d42a23
	.xword	0x0cad3c94a5c86f16
	.xword	0x3a80d820175fe1b8
	.xword	0x76b9bf9c9404fdb5
	.xword	0xf62c4bfe8f236b8c
	.xword	0x3a2c7e8b47a83e10
	.xword	0x707522e7699d7eb6
	.xword	0x68a4234290787ad1
	.xword	0xdfd1d709584c1c02
	.xword	0xb933c403e8ccc314
	.xword	0xb7d87b9df3cc68b2
	.xword	0x3f9d72cbd1e004ca
	.xword	0x9f9ff701cde3c0b6
	.xword	0x507f08ee5fd2e4bf
	.xword	0x2e2a0bb1fea8fb0e
	.xword	0x22a74df24c259063
	.xword	0x6c74c208b8071b47
	.xword	0x3c33569a078fc70f
	.xword	0x2606f7ed580fad49
	.xword	0x92fd90aceee69fed
	.xword	0x140021964f62e310
	.xword	0xbaf2d0f307f84f98
	.xword	0x37a5da2c3d3c9d3f
	.xword	0x6026d3b40759cf3c
	.xword	0x7889e4977ba52199
	.xword	0x75a91f24f145ada3
	.xword	0x2e0c40e31e79aadf
	.xword	0xa81b37ae2cca0193
	.xword	0xa5e8662cf534e1bf
	.xword	0x73c1a093aeac35dd
	.xword	0x481dcdea1cc280f5
	.xword	0x0ec1f5ab2f09495a
	.xword	0x9bf3faff94290b65
	.xword	0xbe4cf134f027fc78
	.xword	0x2279facb24ea76f1
	.xword	0x1e78b4473936c41d
	.xword	0x85a99b821bd5d1e9
	.xword	0x54b79c460756dfec
	.xword	0x8a1c2077a58a8624
	.xword	0xc00c63403ba540df
	.xword	0x63a6d0b6925cede1
	.xword	0x73ee3f7db6e25456
	.xword	0x071c6a3916a0de0b
	.xword	0x3259dbd76bd1f637
	.xword	0xf0f5d25ce7138edb
	.xword	0xe64cae06aa6348e3
	.xword	0x8be3fccd511e707c
	.xword	0x08308b2487d3a0f6
	.xword	0x37b91176696f5d13
	.xword	0xbf7f6ac9a1d4cf98
	.xword	0x176ce9e8c504e136
	.xword	0x5d461ba9dee4077f
	.xword	0x20fc418b0cff87ab
	.xword	0x52690fa2ac11f9b2
	.xword	0xc571e2db30136e05
	.xword	0x819ea4efb30eae30
	.xword	0x916fe4ca73f0d77e
	.xword	0x8263c9ca4cdcd7c4
	.xword	0x3010a1701400cba5
	.xword	0xa2eec5e9fa1a0371
	.xword	0xc2e3140e7b5a9b88
	.xword	0x334dbff75df6ae27
	.xword	0xe7b316ccd2165535
	.xword	0xe849cdd22e12b645
	.xword	0x1b9cc43e6051bb6e
	.xword	0x82874d90a365619a
	.xword	0x2c3f14147c6c5aeb
	.xword	0xb179f183e8614fe6
	.xword	0x2bc7924d7917a776
	.xword	0xc85058ae11c87286
	.xword	0x9a3a69b10e2bb8db
	.xword	0x02737e30aadc1e43
	.xword	0xb9aa2577cf9daedb
	.xword	0x70b37893144a5293
	.xword	0x81e67a040d684fcb
	.xword	0x0ed0d61c7a865491
	.xword	0x2f36588a8fcccaed
	.xword	0xffde60378416d146
	.xword	0x510d9e5076ebc142
	.xword	0x91b2c4242b8dd78d
	.xword	0x33fdd1953dc43880
	.xword	0xeefbe82b663da3ab
	.xword	0xd31d8e280b53d2e5
	.xword	0xfcd9384523d5c006



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
!!#   int iob_intr_cnt = 0;
!!#   int cpu_intr_cnt = 0;
!!#   int asi_reg_rdcnt = 0;
!!#   int asi_reg_wrcnt = 0;
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
!!#   IJ_bind_thread_group("diag.j", 36, th_all,  0xf);
!!#   IJ_bind_thread_group("diag.j", 37, th_wn,    0x1);
!!#   IJ_bind_thread_group("diag.j", 38, th_fp,    0x2);
!!#   IJ_bind_thread_group("diag.j", 39, th_ld,    0x4);
!!#   IJ_bind_thread_group("diag.j", 40, th_st,    0x8);
!!#   IJ_bind_thread_group("diag.j", 41, th_ldst,  0xc);
!!# 
!!#   IJ_set_default_rule_wt_rvar ( "diag.j", 43,"{16}" );
!!#   IJ_set_rvar ("diag.j", 44, Rv_low_wt, "{1}");
!!#   IJ_set_rvar ("diag.j", 45, Rv_mid_wt, "{8}");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 47, ijdefault, Ft_Rs1, "{16..23}");
!!#   IJ_set_ropr_fld ("diag.j", 48, ijdefault, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 49, ijdefault, Ft_Simm13, "13'b0 000r rrrr rrrr");
!!#   IJ_set_ropr_fld ("diag.j", 50, ijdefault, Ft_Rd, "{24..31}");
!!# 
!!#   // ASR read/write parametes
!!#   IJ_set_rvar ("diag.j", 53, Rv_asi_va, "{ 0x0..0x38, 0x3c0..0x3c8 }");
!!#   IJ_set_ropr_fld ("diag.j", 54, Rop_asi_reg, Ft_Rs1, "{14}");
!!#   IJ_set_ropr_fld ("diag.j", 55, Rop_asi_reg, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 56, Rop_asi_reg, Ft_Rd,  "{24..31}");
!!#   IJ_set_ropr_fld ("diag.j", 57, Rop_asi_reg, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld ("diag.j", 58, Rop_asi_reg, Ft_Imm_Asi, "{0x72, 0x73, 0x74, 0x25, 0x20, 0x4f}");
!!# 
!!#   // IO HW interrupt vector
!!#   IJ_set_rvar ("diag.j", 61, Rv_intr_vect, "6'brr rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 63, Rv_intr_disp_reg, 
!!#                "46'{0},"     // RSVD0 
!!# 	       "2'brr,"      // Type
!!#                "3'b000,"     // RSVD1 
!!#                "5'b000rr,"   // THREAD 
!!#                "2'b00,"      // RSVD2
!!#                "6'brr rrrr"  // VECTOR 
!!#               );
!!# 
!!#   IJ_set_rvar ("diag.j", 72, Rv_ma_cntl, "12'b0001 r100 0000");
!!# 
!!#   // Random data pattern
!!#   IJ_set_rvar ("diag.j", 75, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!# 
!!#   // ldst memory address
!!#   IJ_set_rvar ("diag.j", 78, Rv_data_sec, "{0..7}");
!!#   IJ_set_rvar ("diag.j", 79, Rv_ldst_var, "{16..23}");
!!# 
!!#   // HPSTATE/HTSTATE write data
!!#   //IJ_set_rvar (Rv_hpstate, "12'h1rrr rr0r r0r1");
!!#   IJ_set_ropr_fld ("diag.j", 83, Rop_hpstate, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 84, Rop_hpstate, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 85, Rop_hpstate, Ft_Simm13, "13'br 1rrr rr0r r0r0");
!!# 
!!#   // TL & GL write data
!!#   IJ_set_rvar ("diag.j", 88, Rv_tl_lvl, "{0..2}");
!!#   IJ_set_ropr_fld ("diag.j", 89, Rop_tl, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 90, Rop_tl, Ft_Rs2, "{0}");
!!#   //IJ_set_ropr_fld (Rop_tl, Ft_Simm13, "13'b0 0000 0000 00rr");
!!#   IJ_set_ropr_fld ("diag.j", 92, Rop_tl, Ft_Simm13, "{0, 1, 2}");
!!# 
!!#   IJ_set_rvar ("diag.j", 94, Rv_gl_lvl, "{0..2}");
!!#   IJ_set_ropr_fld ("diag.j", 95, Rop_gl, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 96, Rop_gl, Ft_Rs2, "{0}");
!!#   //IJ_set_ropr_fld (Rop_gl, Ft_Simm13, "13'b0 0000 0000 00rr");
!!#   IJ_set_ropr_fld ("diag.j", 98, Rop_gl, Ft_Simm13, "{0, 1, 2}");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 100, th_all, 8, 0, Rv_rand64);
!!# 
!!#   // Floating point register initializaation
!!#   IJ_printf ("diag.j", 103, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#   IJ_printf ("diag.j", 104, th_all, "\twrpr\t%%g0, 0, %%pil\n");
!!# 
!!#   IJ_printf ("diag.j", 106, th_all, "\twr\t%%g0, 4, %%fprs\n");
!!#   IJ_printf ("diag.j", 107, th_all, "\tsetx\tdata_start_0, %%r1, %%g7\n");
!!#   for (i = 0; i < 32; i++) {
!!# 	IJ_printf  ("diag.j", 109, th_all,"\tldd\t[%%g7+%d], %%f%d\n", (i*8), (i*2));
!!#   }
!!#   IJ_printf ("diag.j", 111, th_all, "\tsetx\tfsr_data, %%r1, %%g7\n");
!!#   IJ_printf ("diag.j", 112, th_all, "\tstx\t%%fsr, [%%g7]\n");
!!#   IJ_printf ("diag.j", 113, th_all, "\tldx\t[%%g7], %%g4\n");
!!#   IJ_printf ("diag.j", 114, th_all, "\tsetx\t%%hi(0x0f000000), %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 115, th_all, "\tor\t%%g4, %%g3, %%g4\n");
!!#   IJ_printf ("diag.j", 116, th_all, "\tstx\t%%g4, [%%g7]\n");
!!#   IJ_printf ("diag.j", 117, th_all, "\tldx\t[%%g7], %%fsr\n");
!!# 
!!#   // VA watchpoint enable
!!#   IJ_printf ("diag.j", 120, th_all, "\tsetx\t%%hi(0x1ffe0000f), %%g1, %%g2\n");
!!#   IJ_printf ("diag.j", 121, th_all, "\tstxa\t%%g2, [%%g0] 0x45\n");
!!#   IJ_printf ("diag.j", 122, th_all, "\tmov\t0x38, %%g3\n");
!!#   IJ_printf ("diag.j", 123, th_ldst, "\tsetx\tdata_start_0, %%g1, %%g2\n");
!!#   IJ_printf ("diag.j", 124, th_all, "\tstxa\t%%g2, [%%g3] 0x58\n");
!!# 
!!#   // Initialize the scratch pad registers
!!#   IJ_printf ("diag.j", 127, th_all, "Init_scratchpad:\n");
!!#   IJ_printf ("diag.j", 128, th_all, "\twr\t%%g0, 0x4f, %%asi\n");
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 130, th_all, "\tstxa\t%%l%0d, [0x%0x] %%asi\n", i, (i*8));
!!#   }
!!# 
!!#   IJ_printf ("diag.j", 133, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 
!!#   IJ_th_fork("diag.j", 136,0x2, 0x4, 0x8, -1);;
!!# 
!!#   // Initialize Rs1 (va) for threads 2, 3
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 140, th_ldst, "\tsetx\tdata_start_%d, %%g1, %%r%d\n", i, (16+i));
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
!!#   IJ_th_join("diag.j", 147,0xf);
!!#   IJ_th_start ("diag.j", 148,Seq_Start, NULL, 1);
!!# 
!!#   IJ_printf ("diag.j", 150, th_all, "\t.data\nfsr_data:\n\n");
!!#   IJ_printf  ("diag.j", 151, th_all,"\t.xword\t0x0000000000000000\n");
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 153, th_all, "\t.align 0x%x\n", (1<<(i+12)));
!!#     IJ_printf ("diag.j", 154, th_all, "\t.data\ndata_start_%d:\n\n", i);
!!#     for (j = 0; j < 256; j++) {
!!# 	IJ_printf  ("diag.j", 156, th_all,"\t.xword\t0x%016llrx\n", Rv_rand64);
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
!!# 	spec_inst
!!# 	| comm_inst
!!# 	{
!!# 	  IJ_generate ("diag.j", 196, th_all, $1);
!!# 	}
!!# 	| spill_trap 
!!# 	{
!!# 	  IJ_generate ("diag.j", 200, th_wn, $1);
!!# 	}
!!# 	| fp_all 
!!# 	{
!!# 	  IJ_generate ("diag.j", 204, th_fp, $1);
!!# 	}
!!# 	| load 
!!# 	{
!!# 	  IJ_generate ("diag.j", 208, th_ld, $1);
!!# 	}
!!# 	| store
!!# 	{
!!# 	  IJ_generate ("diag.j", 212, th_st, $1);
!!# 	}
!!# 	| set_va %rvar  Rv_low_wt
!!# 	{
!!# 	  IJ_generate ("diag.j", 216, th_ldst, $1);
!!# 	}
!!# ;
!!# 
!!# spec_inst:
!!# 	iob_intr
!!# 	| cpu_intr
!!# 	| spu_rsrv_illgl %rvar  Rv_low_wt
!!# 	| cntx_demap	 %rvar  Rv_low_wt
!!# ;
!!# 
!!# comm_inst:
!!# 	alu
!!# 	| read_priv_reg	 %rvar  Rv_low_wt
!!# 	| write_priv_reg %rvar  Rv_low_wt
!!# 	| read_asi_reg
!!# 	| write_asi_reg
!!# 	| change_priv	%rvar  Rv_mid_wt
!!# ;
!!# 
!!# change_priv:
!!# 	mHPRIV
!!# 	{
!!#           IJ_printf ("diag.j", 239, th_ldst, "\tta\tT_CHANGE_HPRIV\n");
!!# 	}
!!# 	| mNONHPRIV
!!# 	{
!!#           IJ_printf ("diag.j", 243, th_ldst, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 	}
!!# 	| mTL1
!!# 	{
!!#           IJ_printf ("diag.j", 247, th_ldst, "\tta\tT_CHANGE_TO_TL1\n");
!!# 	}
!!# 	| mTL0
!!# 	{
!!#           IJ_printf ("diag.j", 251, th_ldst, "\tta\tT_CHANGE_TO_TL0\n");
!!# 	}
!!# ;
!!# 
!!# set_va: tWRHPR_HPSTATE_I %ropr  Rop_hpstate
!!# 	{
!!# 	  IJ_printf ("diag.j", 257, th_ldst, "\tsetx\tdata_start_%rd, %%g1, %%r%rd\n", Rv_data_sec, Rv_ldst_var);
!!#           IJ_printf ("diag.j", 258, th_ldst, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 259, th_ldst, "\tmov\t0x38, %%g1\n");
!!#           IJ_printf ("diag.j", 260, th_ldst, "\tstxa\t%%r%d, [%%g1] 0x58\n", IJ_get_rvar_val32 ("diag.j", 260, Rv_ldst_var));
!!#         } 
!!# ;
!!# 
!!# write_priv_reg:
!!# 	tWRPR_PSTATE_I
!!# 	| tWRPR_TPC_I 
!!# 	| tWRPR_TNPC_I 
!!# 	| tWRPR_TSTATE_I 
!!# 	| tWRPR_TT_I
!!# 	| tWRPR_TICK_I
!!# 	| tWRPR_TL_I %ropr  Rop_tl
!!# 	| tWRPR_GL_I %ropr  Rop_gl
!!# 	| tWRPR_PIL_I
!!# ;
!!# 
!!# read_priv_reg: 
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
!!# read_asi_reg:
!!# 	tLDXA_R %ropr  Rop_asi_reg
!!# 	{
!!#           IJ_printf ("diag.j", 292, th_all, "T%y_asi_reg_rd_%d:\n", asi_reg_rdcnt);
!!#           IJ_printf ("diag.j", 293, th_all, "\tmov\t0x%rx, %%r14\n", Rv_asi_va);
!!# 	  asi_reg_rdcnt++;
!!# 	}
!!# ;
!!# 
!!# write_asi_reg:
!!# 	tSTXA_R %ropr  Rop_asi_reg
!!# 	{
!!#           IJ_printf ("diag.j", 301, th_all, "T%y_asi_reg_wr_%d:\n", asi_reg_wrcnt);
!!#           IJ_printf ("diag.j", 302, th_all, "\tmov\t0x%rx, %%r14\n", Rv_asi_va);
!!# 	  asi_reg_wrcnt++;
!!# 	}
!!# ;
!!# 
!!# load:	
!!# 	tLDSB_R | tLDSH_R | tLDSW_R | tLDUB_R | tLDUH_R | tLDUW_R | tLDX_R
!!# 	| tLDSB_I | tLDSH_I | tLDSW_I | tLDUB_I | tLDUH_I | tLDUW_I | tLDX_I
!!# 	| tLDSBA_R | tLDSHA_R | tLDSWA_R | tLDUBA_R | tLDUHA_R | tLDUWA_R
!!# 	| tLDSBA_I | tLDSHA_I | tLDSWA_I | tLDUBA_I | tLDUHA_I | tLDUWA_I | tLDXA_I
!!# 	| mBLK_LD
!!# 	{
!!#           IJ_printf ("diag.j", 314, th_fp, "\tlda\t[%%r%d + %%g0] 0xf0, %%f2\n", IJ_get_rvar_val32 ("diag.j", 314, Rv_ldst_var));
!!# 	}
!!# ;
!!# 
!!# store:
!!# 	tSTB_R | tSTH_R | tSTW_R | tSTX_R | tSTB_I | tSTH_I | tSTW_I | tSTX_I
!!# 	| tSTBA_R | tSTHA_R | tSTWA_R
!!# 	| tSTBA_I | tSTHA_I | tSTWA_I | tSTXA_I
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
!!# 	tSAVE_I | tSAVE_R
!!# ;
!!# 
!!# cntx_demap: itlb_demap | dtlb_demap
!!# ;
!!# 
!!# itlb_demap: mIDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 348, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 349, th_all, "\tmov\t0, %%g1\n");
!!#           IJ_printf ("diag.j", 350, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 351, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 352, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 	};
!!# 
!!# dtlb_demap: mDDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 357, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 358, th_all, "\tmov\t8, %%g1\n");
!!#           IJ_printf ("diag.j", 359, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 360, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 361, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#           IJ_printf ("diag.j", 362, th_all, "\tflush\n");
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
!!# 	  IJ_printf ("diag.j", 376, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!# 	  IJ_printf ("diag.j", 377, th_all, "\tmov\t0x80, %%g1\n");
!!# 	  IJ_printf ("diag.j", 378, th_all, "\tmov\t0x%rx, %%g2\n", Rv_ma_cntl);
!!# 	  IJ_printf ("diag.j", 379, th_all, "\tstxa\t%%g2, [%%g1] 0x40\n");
!!# 	  IJ_printf ("diag.j", 380, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#         }
!!# ;
!!# 
!!# cpu_intr:
!!# 	mCPU_INTR
!!# 	{
!!#           IJ_printf ("diag.j", 387, th_all, "cpu_intr_%y_%d:\n", cpu_intr_cnt);
!!# 	  IJ_printf ("diag.j", 388, th_all, "\tsetx\t0x%llrx, %%g1, %%o0\n", Rv_intr_disp_reg);
!!#           IJ_printf ("diag.j", 389, th_all, "\tta\tT_SEND_THRD_INTR\n");
!!# 	  cpu_intr_cnt++;
!!# 	}
!!# ;
!!# 
!!# iob_intr:
!!# 	mIOB_INT
!!#         {
!!#           IJ_printf ("diag.j", 397, th_all, "iob_intr_%y_%d:\n", iob_intr_cnt);
!!#           IJ_printf ("diag.j", 398, th_all, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.iob_intr_%y_%d), 16, 16)) -> intp(%y, 0, %rx)\n", iob_intr_cnt, Rv_intr_vect);
!!#           iob_intr_cnt++;
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
